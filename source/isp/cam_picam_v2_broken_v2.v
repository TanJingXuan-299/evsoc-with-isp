////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2026 Efinix Inc. All rights reserved.
// See https://github.com/Efinix-Inc/evsoc/blob/main/LICENSE.txt for details.
////////////////////////////////////////////////////////////////////////////////

module cam_picam_v2 #(
   //Input resolution from camera MIPI interface
   parameter MIPI_FRAME_WIDTH     = 11'd1920,  
   parameter MIPI_FRAME_HEIGHT    = 11'd1080,
   //Output resolution to external memory
   parameter FRAME_WIDTH          = 11'd540,
   parameter FRAME_HEIGHT         = 11'd540,
   //Should match with firmware DMA transfer length
   parameter DMA_TRANSFER_LENGTH  = 1920,
   //Should match with mipi_pclk clock rate
   parameter MIPI_PCLK_CLK_RATE   = 100000000
) (
   input  wire        mipi_pclk,
   input  wire        rst_n,
 
   //Input camera frame data from MIPI interface
   input  wire [63:0] mipi_cam_data,
   input  wire        mipi_cam_valid,
   input  wire        mipi_cam_vs,
   input  wire        mipi_cam_hs,
   input  wire [5:0]  mipi_cam_type,

`ifdef SIM
   //Simulation frame data from testbench
   input wire        sim_cam_hsync,
   input wire        sim_cam_vsync,
   input wire        sim_cam_valid,
   input wire [15:0] sim_cam_r_pix,
   input wire [15:0] sim_cam_g_pix,
   input wire [15:0] sim_cam_b_pix,
`endif
   
   //DMA
   input  wire        cam_dma_wready,
   output wire        cam_dma_wvalid,
   output wire        cam_dma_wlast,
   output wire [63:0] cam_dma_wdata,
   
   //RISC-V slave control & Debug
   input  wire [15:0] rgb_control,
   input  wire        trigger_capture_frame,
   input  wire        continuous_capture_frame,
   input  wire        rgb_gray,
   input  wire        cam_dma_init_done,
   
   output reg  [31:0] frames_per_second,
   output reg         debug_cam_pixel_remap_fifo_overflow,
   output reg         debug_cam_pixel_remap_fifo_underflow,
   output reg         debug_cam_dma_fifo_overflow,
   output reg         debug_cam_dma_fifo_underflow,
   output reg  [31:0] debug_cam_dma_fifo_rcount,
   output reg  [31:0] debug_cam_dma_fifo_wcount,
   output wire [31:0] debug_cam_dma_status
);

localparam CAM_DMA_COUNT_BIT = $clog2(DMA_TRANSFER_LENGTH);
localparam CAM_X_COUNT_BIT   = $clog2(MIPI_FRAME_WIDTH/4); //4PPC
localparam CAM_Y_COUNT_BIT   = $clog2(MIPI_FRAME_HEIGHT);

reg  [39:0]                 cam_data;
reg                         cam_valid;
reg                         cam_vs;
reg                         cam_vs_r;
wire                        cam_vs_fall_edge;
reg                         cam_hs;
reg                         cam_hs_r;
wire                        cam_hs_fall_edge;
wire [31:0]                 cam_data8;
reg  [CAM_X_COUNT_BIT-1:0]  cam_x_count;
reg  [CAM_Y_COUNT_BIT-1:0]  cam_y_count;

//NOTE: Manual RGB gain (cam_rgb_gain) removed - color gain is now handled
//inside isp_top (BLC + color gain + CCM stages). rgb_control[14:0] gain
//sub-fields are therefore currently unused by this module (reserved for a
//possible future AXI-Lite passthrough into isp_top).

reg                         cam_alternate_clock; 
wire                        cam_pixel_remap_fifo_wvalid;
wire [31:0]                 cam_pixel_remap_fifo_wdata;
wire                        cam_pixel_remap_fifo_re;
wire                        cam_pixel_remap_fifo_rvalid;
wire [31:0]                 cam_pixel_remap_fifo_rdata;
wire                        cam_pixel_remap_fifo_empty;
wire                        cam_pixel_remap_fifo_overflow;
wire                        cam_pixel_remap_fifo_underflow;
reg                         cam_pixel_remap_fifo_rvalid_r;
reg  [15:0]                 cam_pixel_remap_fifo_rdata_r;
wire                        cam_pixel_remap_2ppc_valid;
wire [15:0]                 cam_pixel_remap_2ppc_data;

//isp_top (raw->RGB pipeline: BLC, color gain, demosaic, CCM, gamma)
//replaces cam_rgb_gain + cam_pixel_remap 4PPC->2PPC stays, cam_line_buffer
//and cam_raw_to_rgb are removed - isp_top now sits directly after the
//existing 4PPC->2PPC remap FIFO and drives the same rgb_pixel_*_out /
//rgb_pixel_out_valid signals that cam_crop already consumes below.
localparam ISP_PPC              = 2;   //Matches existing 2PPC downstream (crop/scale/gray)
//FIX (Bug #4 - dark image): the ISP gamma LUT (lut.mem) is a 4096-entry
//table and lut.sv addresses the ROM DIRECTLY with the input pixel value.
//With PIXEL_BIT_WIDTH=8 only the first 256 LUT entries were ever addressed
//(max gamma output = 0x46 = ~27% brightness). Run the ISP at its native
//12-bit pixel width and shift the 8-bit RAW data left by 4 when packing
//s_axis_tdata, so raw8=0xFF addresses LUT entry 0xFF0 and produces 0xFF.
localparam ISP_PIXEL_BIT_WIDTH  = 12;  //12-bit internal pipeline (gamma LUT is 12-bit addressed)
localparam ISP_COMPONENT_WIDTH  = 8;   //RGB8 out
localparam ISP_S_AXIS_WIDTH     = 8*(((ISP_PPC*ISP_PIXEL_BIT_WIDTH)+7)/8);        //24
localparam ISP_M_AXIS_WIDTH     = 8*(((ISP_PPC*3*ISP_COMPONENT_WIDTH)+7)/8);      //48
localparam ISP_LINE_CNT_BIT     = $clog2(MIPI_FRAME_WIDTH/ISP_PPC);

wire                            isp_s_axis_tvalid;
wire [ISP_S_AXIS_WIDTH-1:0]     isp_s_axis_tdata;
wire                            isp_s_axis_tlast;
wire                            isp_s_axis_tuser;
wire                            isp_s_axis_tready;
wire                            isp_m_axis_tvalid;
wire [ISP_M_AXIS_WIDTH-1:0]     isp_m_axis_tdata;
wire                            isp_m_axis_tlast;
wire                            isp_m_axis_tuser;

reg  [ISP_LINE_CNT_BIT-1:0]     isp_s_line_count;
reg                             isp_sof_pending;

//AXI-Lite slave of isp_top - tied off (no writes): the ISP register bank
//keeps its safe reset defaults from axi_lite_register.sv (unity color gain
//0x0080, identity CCM 0x1000, black level 0). The old design's manual RGB
//gain via rgb_control is superseded by the ISP colorgain stage; rgb_control
//remains unused (reserved for a future AXI-Lite passthrough).
wire [4:0]                      isp_s_axi_awaddr;
wire                            isp_s_axi_awvalid;
wire                            isp_s_axi_awready;
wire [31:0]                     isp_s_axi_wdata;
wire [3:0]                      isp_s_axi_wstrb;
wire                            isp_s_axi_wvalid;
wire                            isp_s_axi_wready;
wire [1:0]                      isp_s_axi_bresp;
wire                            isp_s_axi_bvalid;
wire                            isp_s_axi_bready;

wire [15:0]                 rgb_pixel_r_out;
wire [15:0]                 rgb_pixel_g_out;
wire [15:0]                 rgb_pixel_b_out;
wire [15:0]                 rgb_pixel_r_crop_out;
wire [15:0]                 rgb_pixel_g_crop_out;
wire [15:0]                 rgb_pixel_b_crop_out;
wire [15:0]                 rgb_pixel_r_scale_out;
wire [15:0]                 rgb_pixel_g_scale_out;
wire [15:0]                 rgb_pixel_b_scale_out;
wire                        rgb_pixel_out_valid;
wire                        rgb_pixel_crop_out_valid;
wire [15:0]                 gray_pixel_out;

reg                         trigger_capture_frame_r1;
reg                         trigger_capture_frame_r2;
reg                         trigger_capture_frame_r3;
reg                         trigger_capture_frame_hold;
reg                         continuous_capture_frame_r1;
reg                         continuous_capture_frame_r2;
reg                         continuous_capture_frame_hold;
reg                         capture_frame;
reg                         rgb_gray_r;
reg                         rgb_gray_synced;
wire                        cam_dma_fifo_wvalid;
wire [47:0]                 cam_dma_fifo_wdata;
wire                        cam_dma_fifo_re;
wire                        cam_dma_fifo_rvalid;
wire [47:0]                 cam_dma_fifo_rdata;
wire                        cam_dma_fifo_empty;
wire                        cam_dma_fifo_overflow;
wire                        cam_dma_fifo_underflow;
reg [CAM_DMA_COUNT_BIT-1:0] cam_dma_count;
reg                         cam_dma_init_done_r1;
reg                         cam_dma_init_done_r2;
reg                         cam_dma_init_done_r3;
reg                         cam_dma_write;

`ifndef SIM

//Camera data sync to FPGA fabric mipi_pclk
always @(posedge mipi_pclk)
begin
   if (~rst_n) begin
      cam_data            <= 40'd0;
      cam_valid           <= 1'b0;
      cam_vs              <= 1'b0;
      cam_vs_r            <= 1'b0;
   end else begin
      cam_data            <= mipi_cam_data[39:0];   //Keep valid least significant 4 x 10 bits data (RAW10, 4PPC)
      cam_valid           <= mipi_cam_valid && (mipi_cam_type == 6'h2B);  //For RAW10 data type
      cam_vs              <= mipi_cam_vs;
      cam_vs_r            <= cam_vs;
      cam_hs              <= mipi_cam_hs;
      cam_hs_r            <= cam_hs;
   end
end

assign cam_hs_fall_edge = cam_hs_r && ~cam_hs;
assign cam_vs_fall_edge = cam_vs_r && ~cam_vs;
assign cam_data8        = {cam_data[39:32], cam_data[29:22], cam_data[19:12], cam_data[9:2]};  //Keep MSB 8-bit per pixel only

//RGB gain removed - raw8 data (cam_data8) is fed straight into the
//4PPC->2PPC remap FIFO below and then into isp_top, which now performs
//BLC + color gain + demosaic + CCM + gamma.

//Map from 4PPC to 2PPC
always @(posedge mipi_pclk)
begin
   if (~rst_n)
   begin
      cam_alternate_clock           <= 1'b0;
      cam_pixel_remap_fifo_rvalid_r <= 1'b0;
      cam_pixel_remap_fifo_rdata_r  <= 16'd0;
   end else begin
      cam_alternate_clock           <= ~cam_alternate_clock;
      cam_pixel_remap_fifo_rvalid_r <= cam_pixel_remap_fifo_rvalid;
      cam_pixel_remap_fifo_rdata_r  <= cam_pixel_remap_fifo_rdata [31:16]; //Store most significant half word only
   end
end

assign cam_pixel_remap_fifo_wvalid = capture_frame && cam_valid;
assign cam_pixel_remap_fifo_wdata  = cam_data8;
assign cam_pixel_remap_fifo_re     = (~cam_pixel_remap_fifo_empty) && cam_alternate_clock;
assign cam_pixel_remap_2ppc_valid  = cam_pixel_remap_fifo_rvalid || cam_pixel_remap_fifo_rvalid_r;
assign cam_pixel_remap_2ppc_data   = (cam_pixel_remap_fifo_rvalid) ? cam_pixel_remap_fifo_rdata [15:0] : cam_pixel_remap_fifo_rdata_r;

cam_pixel_remap_fifo u_cam_pixel_remap_fifo (
   .almost_full_o  (),
   .full_o         (),
   .overflow_o     (cam_pixel_remap_fifo_overflow),
   .wr_ack_o       (),
   .empty_o        (cam_pixel_remap_fifo_empty),
   .almost_empty_o (),
   .underflow_o    (cam_pixel_remap_fifo_underflow),
   .rd_valid_o     (cam_pixel_remap_fifo_rvalid),
   .rdata          (cam_pixel_remap_fifo_rdata),
   .clk_i          (mipi_pclk),
   .wr_en_i        (cam_pixel_remap_fifo_wvalid),
   .rd_en_i        (cam_pixel_remap_fifo_re),
   .a_rst_i        (~rst_n),
   .wdata          (cam_pixel_remap_fifo_wdata),
   .datacount_o    ()
);

//Adjusted vsync signal for 2PPC outputs
localparam MIPI_FRAME_PIX_COUNT_2PPC    = MIPI_FRAME_HEIGHT*(MIPI_FRAME_WIDTH/2);
localparam DELAY_VSYNC_2PPC             = 20;
localparam PIX_COUNT_2PPC_BIT           = $clog2(MIPI_FRAME_PIX_COUNT_2PPC);
localparam VSYNC_2PPC_COUNT_BIT         = $clog2(DELAY_VSYNC_2PPC);

reg [PIX_COUNT_2PPC_BIT-1:0]   count_2PPC;
reg                            vsync_2PPC_pre;
reg                            delay_count_en;
reg [VSYNC_2PPC_COUNT_BIT-1:0] delay_count;
wire                           cam_vs_2PPC;

assign cam_vs_2PPC = delay_count_en && (delay_count==DELAY_VSYNC_2PPC-1);

always @(posedge mipi_pclk)
begin
   if (~rst_n)
   begin
      count_2PPC     <= {PIX_COUNT_2PPC_BIT{1'b0}};
      vsync_2PPC_pre <= 1'b0;
      delay_count_en <= 1'b0;
      delay_count    <= {VSYNC_2PPC_COUNT_BIT{1'b0}};
   end else begin
      count_2PPC     <= (cam_pixel_remap_2ppc_valid && (count_2PPC == MIPI_FRAME_PIX_COUNT_2PPC-1)) ? {PIX_COUNT_2PPC_BIT{1'b0}} :
                        (cam_pixel_remap_2ppc_valid) ? count_2PPC + 1'b1 : count_2PPC;
      vsync_2PPC_pre <= cam_pixel_remap_2ppc_valid && (count_2PPC == MIPI_FRAME_PIX_COUNT_2PPC-1);
      delay_count_en <= (cam_vs_2PPC) ? 1'b0                         : (vsync_2PPC_pre) ? 1'b1               : delay_count_en;
      delay_count    <= (cam_vs_2PPC) ? {VSYNC_2PPC_COUNT_BIT{1'b0}} : (delay_count_en) ? delay_count + 1'b1 : delay_count;
   end
end

//------------------------------------------------------------------------
// isp_top raw->RGB pipeline (replaces cam_line_buffer + cam_raw_to_rgb)
//------------------------------------------------------------------------
//s_axis framing: tlast marks the last 2PPC beat of each line (lines are
//always exactly MIPI_FRAME_WIDTH/ISP_PPC = 960 beats on this side because
//the remap FIFO delivers the MIPI pixel stream 1:1), tuser marks the first
//2PPC beat of a new frame (SOF).
//
//FIX (Bug #1 - black screen): colorgain.sv / ccm.sv / blc.sv latch their
//gain / CCM-matrix / black-level configuration ONLY when a tuser (SOF) beat
//arrives, and their latched registers power up at ZERO. The AXI-Lite
//register defaults (unity gain 0x0080 / identity CCM 0x1000) never reach
//them without a SOF beat. isp_sof_pending used to reset to 0 and was only
//armed by cam_vs_2PPC - a pulse that fires after a FULL frame has already
//streamed through - so the first captured frame entered isp_top with no SOF
//at all and every pixel was multiplied by gain 0 / matrix 0 (black frame).
//Arm the SOF at reset so the very first captured frame is also framed;
//subsequent frames keep being framed by the existing cam_vs_2PPC mechanism
//(the pulse fires during the vertical blanking after each frame, so the
//pending flag survives the inter-frame gap of both single-shot and
//continuous capture).
always @(posedge mipi_pclk)
begin
   if (~rst_n) begin
      isp_s_line_count <= {ISP_LINE_CNT_BIT{1'b0}};
      isp_sof_pending  <= 1'b1;   //FIX: arm SOF for the first captured frame
   end else begin
      isp_s_line_count <= (cam_pixel_remap_2ppc_valid && (isp_s_line_count == MIPI_FRAME_WIDTH/ISP_PPC-1)) ? {ISP_LINE_CNT_BIT{1'b0}} :
                          (cam_pixel_remap_2ppc_valid)                                                     ? isp_s_line_count + 1'b1 : isp_s_line_count;
      isp_sof_pending  <= (cam_vs_2PPC)                 ? 1'b1 :
                          (cam_pixel_remap_2ppc_valid)  ? 1'b0 : isp_sof_pending;
   end
end

assign isp_s_axis_tvalid = cam_pixel_remap_2ppc_valid;
//FIX (Bug #4): pack the two 8-bit RAW pixels as 12-bit values ({px, 4'b0})
//so they span the full input range of the ISP's 4096-entry gamma LUT.
//pixel 0 (left/even pixel) occupies tdata[11:0], pixel 1 (right/odd pixel)
//tdata[23:12] - this is the packing colorgain.sv expects (pixel_0 = LSB).
assign isp_s_axis_tdata  = {cam_pixel_remap_2ppc_data[15:8], 4'b0000,   //pixel 1 (odd)
                            cam_pixel_remap_2ppc_data[7:0],  4'b0000};  //pixel 0 (even)
assign isp_s_axis_tlast  = cam_pixel_remap_2ppc_valid && (isp_s_line_count == MIPI_FRAME_WIDTH/ISP_PPC-1);
assign isp_s_axis_tuser  = isp_sof_pending;
//NOTE: isp_s_axis_tready is intentionally not used to gate the camera
//source - the MIPI pixel stream can't be paused. isp_top's internal
//pipeline is assumed to sustain 1 beat/cycle so tready should stay high
//in normal operation; if it ever deasserts, that beat's pixels are lost.

isp_top #(
   //FIX (Bug #5 - red/blue swapped vs old design): the old working pipeline
   //(cam_line_buffer + cam_raw_to_rgb, pristine Efinix reference code)
   //interprets the Bayer pattern DELIVERED BY THIS PLATFORM as:
   //   even lines (line 0) = Gb B Gb B ...   ("Gb"-start line)
   //   odd  lines (line 1) = R  Gr R  Gr ... ("R"-start line)
   //i.e. a GBRG 2x2 tile. CFA_ORIENTATION=3 (RG) assumed an RGGB tile - a
   //one-line/one-pixel diagonal phase shift - which swaps the red and blue
   //sites and produces R/B swapped colours compared to the old design.
   //CFA_GB=1 matches the old (working) interpretation exactly.
   .CFA_ORIENTATION    (1),              //0=BG,1=GB,2=GR,3=RG - GB matches old cam_raw_to_rgb
   .MAX_RESOLUTION     (2048),           //RES_2K - covers MIPI_FRAME_WIDTH up to 1920
   .PIXEL_PER_CYCLE    (ISP_PPC),
   .PIXEL_BIT_WIDTH    (ISP_PIXEL_BIT_WIDTH),
   .COMPONENT_BIT_WIDTH(ISP_COMPONENT_WIDTH),
   .S_AXIS_DATA_WIDTH  (ISP_S_AXIS_WIDTH),
   .M_AXIS_DATA_WIDTH  (ISP_M_AXIS_WIDTH),
   .TUSER_WIDTH        (1)
) u_isp_top (
   .aclk           (mipi_pclk),
   .aresetn        (rst_n),

   .s_axi_awaddr   (isp_s_axi_awaddr),
   .s_axi_awvalid  (isp_s_axi_awvalid),
   .s_axi_awready  (isp_s_axi_awready),
   .s_axi_wdata    (isp_s_axi_wdata),
   .s_axi_wstrb    (isp_s_axi_wstrb),
   .s_axi_wvalid   (isp_s_axi_wvalid),
   .s_axi_wready   (isp_s_axi_wready),
   .s_axi_bresp    (isp_s_axi_bresp),
   .s_axi_bvalid   (isp_s_axi_bvalid),
   .s_axi_bready   (isp_s_axi_bready),
   .s_axi_araddr   (5'd0),
   .s_axi_arvalid  (1'b0),
   .s_axi_arready  (),
   .s_axi_rdata    (),
   .s_axi_rresp    (),
   .s_axi_rvalid   (),
   .s_axi_rready   (1'b1),

   .s_axis_tdata   (isp_s_axis_tdata),
   .s_axis_tvalid  (isp_s_axis_tvalid),
   .s_axis_tready  (isp_s_axis_tready),
   .s_axis_tlast   (isp_s_axis_tlast),
   .s_axis_tuser   (isp_s_axis_tuser),

   .m_axis_tdata   (isp_m_axis_tdata),
   .m_axis_tvalid  (isp_m_axis_tvalid),
   .m_axis_tready  (1'b1),
   .m_axis_tlast   (isp_m_axis_tlast),
   .m_axis_tuser   (isp_m_axis_tuser)
);

//Unpack isp_top's 2PPC RGB888 output into this module's existing 16-bit
//(2 pixel) per-channel signal format, consistent with the earlier/first
//pixel occupying the LSB half - same convention already used for
//cam_data8/gray_pixel_out elsewhere in this file.
//
//Verified ISP output packing (demosaic.sv stage-4, ccm.sv stage-4 and
//gamma.sv stage-0 - gamma preserves byte positions since all three LUT
//instances are identical): each pixel is packed {R, B, G} with G in the
//LSB byte, i.e. for the 48-bit 2PPC m_axis word:
//   [47:40] = pixel1 R   [39:32] = pixel1 B   [31:24] = pixel1 G
//   [23:16] = pixel0 R   [15:8]  = pixel0 B   [7:0]   = pixel0 G
//
//FIX (Bug #3 - green/blue swap): the previous unpack mapped [39:32]/[15:8]
//to green and [31:24]/[7:0] to blue, swapping the green and blue channels.
assign rgb_pixel_out_valid = isp_m_axis_tvalid;
assign rgb_pixel_r_out     = {isp_m_axis_tdata[47:40], isp_m_axis_tdata[23:16]};
assign rgb_pixel_g_out     = {isp_m_axis_tdata[31:24], isp_m_axis_tdata[7:0]};
assign rgb_pixel_b_out     = {isp_m_axis_tdata[39:32], isp_m_axis_tdata[15:8]};

// ISP register bank uses its safe reset defaults in axi_lite_register.sv.
assign isp_s_axi_awaddr  = 5'd0;
assign isp_s_axi_awvalid = 1'b0;
assign isp_s_axi_wdata   = 32'd0;
assign isp_s_axi_wstrb   = 4'd0;
assign isp_s_axi_wvalid  = 1'b0;
assign isp_s_axi_bready  = 1'b1;

//Perform cropping and scaling 
reg [10:0] mipi_x_count;
reg [10:0] mipi_y_count;
reg [10:0] crop_x_count;
reg [10:0] crop_y_count;

//FIX (Bug #2 - crop window drift / DMA framing): the AMD ISP is NOT 1:1
//with the 2PPC pixel stream the way the old cam_line_buffer +
//cam_raw_to_rgb pipeline was:
//   - demosaic.sv flushes its 3-deep horizontal window pipeline at every
//     EOL, so every 960-beat input line produces only 958 output beats
//     (the first and last beat of each line are consumed as window
//     context), and
//   - (after the linebuffer.sv fix) every input line still yields exactly
//     one output line, so a frame is 1080 lines x 958 beats.
//The old free-running mod-(MIPI_FRAME_WIDTH/2) / mod-(MIPI_FRAME_HEIGHT)
//counters therefore drifted: the x wrap point slid 2 beats per line and y
//never completed a frame, so cam_crop's start-corner condition
//(in_y == Y_START && in_x == X_START) landed at arbitrary positions - the
//crop window slid through the image and the DMA never received exactly
//145,800 beats per frame (frame buffer rolls/tears, firmware can hang on
//dmasg_busy in single-shot capture).
//Instead, lock the counters to the ISP's actual output framing:
//   - x resets on every isp_m_axis_tlast (EOL of a 958-beat output line),
//   - y increments on EOL and wraps at MIPI_FRAME_HEIGHT (exactly 1080
//     EOLs occur per captured frame), so y = 0 at the first output line of
//     every frame and the crop start corner hits precisely once per frame.
//The 540-beat crop window (X_START=210..749) still fits inside the 958-beat
//line, so the crop/scale/DMA path again delivers exactly 145,800 beats per
//frame as the firmware DMA descriptor expects.
always @(posedge mipi_pclk)
begin
   if (~rst_n)
   begin
      mipi_x_count <= 11'd0;
      mipi_y_count <= 11'd0;
   end
   else if (rgb_pixel_out_valid)
   begin
      if (isp_m_axis_tlast)
      begin
         //End of an ISP output line - realign x to the line start
         mipi_x_count <= 11'd0;
         mipi_y_count <= (mipi_y_count == MIPI_FRAME_HEIGHT-1) ? 11'd0 : mipi_y_count + 1'b1;
      end
      else
      begin
         mipi_x_count <= mipi_x_count + 1'b1;
      end
   end
end

//Resolution adjustment to be compatible with the deployed display panel and available memory/processing bandwidth
//Default crop from 1920x1080 to 1080x1080 - 2PPC
cam_crop #(  
   .P_DEPTH (16),
   .X_START ((MIPI_FRAME_WIDTH-2*FRAME_WIDTH)/4), //((MIPI_FRAME_WIDTH-2*FRAME_WIDTH)/2)/2 - With consideration of subsequent 2x downscaling
   .Y_START (0),
   .X_WIN   (FRAME_WIDTH), //2*FRAME_WIDTH/2 - With consideration of subsequent 2x downscaling
   .Y_WIN   (2*FRAME_HEIGHT)
) u_cam_crop (
   .in_pclk       (mipi_pclk),
   .in_arstn      (rst_n),
   .in_x          (mipi_x_count),
   .in_y          (mipi_y_count),
   .in_valid      (rgb_pixel_out_valid),
   .in_data_00    (rgb_pixel_r_out),
   .in_data_01    (rgb_pixel_g_out),
   .in_data_10    (rgb_pixel_b_out),
   .out_x         (crop_x_count),
   .out_y         (crop_y_count),
   .out_valid     (rgb_pixel_crop_out_valid),
   .out_hs        (),
   .out_data_00   (rgb_pixel_r_crop_out),
   .out_data_01   (rgb_pixel_g_crop_out),
   .out_data_10   (rgb_pixel_b_crop_out)
);

//Nearest neighbour method - 2 pixels per clock, scale down by 2x vertically and 2x horizontally
//Default scale down from 1080x1080 to 540x540 reduce overall memory/processing bandwidth requirement
scale_down_2x_nn #(
   .P_DEPTH        (8),
   .IN_FRAME_WIDTH (2*FRAME_WIDTH)
) u_cam_downscaling (
   .clk        (mipi_pclk),
   .rst_n      (rst_n),
   .in_x       (crop_x_count),
   .in_y       (crop_y_count),
   .in_red     (rgb_pixel_r_crop_out),
   .in_green   (rgb_pixel_g_crop_out),
   .in_blue    (rgb_pixel_b_crop_out),
   .in_valid   (rgb_pixel_crop_out_valid),
   .out_red    (rgb_pixel_r_scale_out),
   .out_green  (rgb_pixel_g_scale_out),
   .out_blue   (rgb_pixel_b_scale_out),
   .out_valid  (cam_dma_fifo_wvalid)
);

//RGB to grayscale conversion (optional)
cam_rgb2gray #(
   .DATA_WIDTH (8),
   .PPC        (2)
) u_rgb2gray (
   .in_red   (rgb_pixel_r_scale_out),
   .in_green (rgb_pixel_g_scale_out),
   .in_blue  (rgb_pixel_b_scale_out),
   .out_gray (gray_pixel_out)
);

//Select RGB or grayscale output
assign cam_dma_fifo_wdata  = (rgb_gray_synced) ? {gray_pixel_out[15:8],  gray_pixel_out[15:8],  gray_pixel_out[15:8],  gray_pixel_out[7:0],  gray_pixel_out[7:0],  gray_pixel_out[7:0]} :
                                                 {rgb_pixel_b_scale_out[15:8], rgb_pixel_g_scale_out[15:8], rgb_pixel_r_scale_out[15:8], 
                                                  rgb_pixel_b_scale_out[7:0], rgb_pixel_g_scale_out[7:0], rgb_pixel_r_scale_out[7:0]};

`else

reg sim_cam_vsync_r;

always @(posedge mipi_pclk) begin
   sim_cam_vsync_r <= sim_cam_vsync;
end

cam_rgb2gray #(
   .DATA_WIDTH (8),
   .PPC        (2)
) u_rgb2gray (
   .in_red   (sim_cam_r_pix),
   .in_green (sim_cam_g_pix),
   .in_blue  (sim_cam_b_pix),
   .out_gray (gray_pixel_out)
);

assign cam_vs_fall_edge    = sim_cam_vsync_r && ~sim_cam_vsync;
assign cam_dma_fifo_wvalid = capture_frame && sim_cam_valid;
//Select RGB or grayscale output
assign cam_dma_fifo_wdata  = (rgb_gray_synced) ? {gray_pixel_out[15:8], gray_pixel_out[15:8], gray_pixel_out[15:8], gray_pixel_out[7:0], gray_pixel_out[7:0], gray_pixel_out[7:0]} :
                                                 {sim_cam_b_pix[15:8] , sim_cam_g_pix[15:8],  sim_cam_r_pix[15:8],  sim_cam_b_pix[7:0],  sim_cam_g_pix[7:0],  sim_cam_r_pix[7:0]};

`endif

//Store frame to external memory through DMA
always @(posedge mipi_pclk)
begin
   if (~rst_n) 
   begin
      trigger_capture_frame_r1      <= 1'b0;
      trigger_capture_frame_r2      <= 1'b0;
      trigger_capture_frame_r3      <= 1'b0;
      trigger_capture_frame_hold    <= 1'b0;
      continuous_capture_frame_r1   <= 1'b0;
      continuous_capture_frame_r2   <= 1'b0;
      continuous_capture_frame_hold <= 1'b0;
      capture_frame                 <= 1'b0;
      rgb_gray_r                    <= 1'b0;
      rgb_gray_synced               <= 1'b0;
   end else begin
      trigger_capture_frame_r1      <= trigger_capture_frame;
      trigger_capture_frame_r2      <= trigger_capture_frame_r1;
      trigger_capture_frame_r3      <= trigger_capture_frame_r2;
      trigger_capture_frame_hold    <= (~trigger_capture_frame_r3 && trigger_capture_frame_r2) ? 1'b1 : (cam_dma_fifo_wvalid) ? 1'b0 : trigger_capture_frame_hold;
      continuous_capture_frame_r1   <= continuous_capture_frame;
      continuous_capture_frame_r2   <= continuous_capture_frame_r1;
      continuous_capture_frame_hold <= (continuous_capture_frame_r2) ? 1'b1 : continuous_capture_frame_hold;
      capture_frame                 <= ((trigger_capture_frame_hold | continuous_capture_frame_hold) & cam_vs_fall_edge) ? 1'b1 : 
                                       (capture_frame & cam_vs_fall_edge & (~continuous_capture_frame_hold))             ? 1'b0 : capture_frame;
      rgb_gray_r                    <= rgb_gray;
      rgb_gray_synced               <= rgb_gray_r;
   end
end

//IMPORTANT TO CHECK FIFO OVERFLOW FLAG
//Mode FWFT
//DATA_WIDTH = 48
//DEPTH - Might be further cut down

cam_dma_fifo u_cam_dma_fifo (
   .almost_full_o  (),
   .full_o         (),
   .overflow_o     (cam_dma_fifo_overflow),
   .wr_ack_o       (),
   .empty_o        (cam_dma_fifo_empty),
   .almost_empty_o (),
   .underflow_o    (cam_dma_fifo_underflow),
   .rd_valid_o     (cam_dma_fifo_rvalid),
   .rdata          (cam_dma_fifo_rdata),
   .clk_i          (mipi_pclk),
   .wr_en_i        (cam_dma_fifo_wvalid),
   .rd_en_i        (cam_dma_fifo_re),
   .a_rst_i        (~rst_n),
   .wdata          (cam_dma_fifo_wdata),
   .datacount_o    ()
);

reg [31:0] timer_count;
reg [31:0] frame_count;

always@(posedge mipi_pclk)
begin
   if(~rst_n) begin
      cam_dma_count                        <= {CAM_DMA_COUNT_BIT{1'b0}};
      cam_dma_init_done_r1                 <= 1'b0;
      cam_dma_init_done_r2                 <= 1'b0;
      cam_dma_init_done_r3                 <= 1'b0;
      cam_dma_write                        <= 1'b0;
      debug_cam_pixel_remap_fifo_overflow  <= 1'b0;
      debug_cam_pixel_remap_fifo_underflow <= 1'b0;
      debug_cam_dma_fifo_overflow          <= 1'b0;
      debug_cam_dma_fifo_underflow         <= 1'b0;
      debug_cam_dma_fifo_rcount            <= 32'd0;
      debug_cam_dma_fifo_wcount            <= 32'd0;
      timer_count                          <= 32'd0;
      frame_count                          <= 32'd0;
      frames_per_second                    <= 32'd0;
   end else begin
      cam_dma_init_done_r1                 <= cam_dma_init_done;
      cam_dma_init_done_r2                 <= cam_dma_init_done_r1;
      cam_dma_init_done_r3                 <= cam_dma_init_done_r2;
      cam_dma_write                        <= (~cam_dma_init_done_r3 && cam_dma_init_done_r2)            ? 1'b1 :
                                              (cam_dma_wvalid && (cam_dma_count==DMA_TRANSFER_LENGTH-1)) ? 1'b0 : cam_dma_write;
      
      //To determine cam_dma_wlast
      cam_dma_count                        <= (cam_dma_wvalid && (cam_dma_count==DMA_TRANSFER_LENGTH-1)) ? {CAM_DMA_COUNT_BIT{1'b0}}                           :
                                              (cam_dma_wvalid)                                           ? cam_dma_count + {{CAM_DMA_COUNT_BIT-1{1'b0}}, 1'b1} : cam_dma_count;
      
      //Debug registers
      debug_cam_pixel_remap_fifo_overflow  <= (cam_pixel_remap_fifo_overflow)   ? 1'b1 : debug_cam_pixel_remap_fifo_overflow;
      debug_cam_pixel_remap_fifo_underflow <= (cam_pixel_remap_fifo_underflow)  ? 1'b1 : debug_cam_pixel_remap_fifo_underflow;
      debug_cam_dma_fifo_overflow          <= (cam_dma_fifo_overflow)           ? 1'b1 : debug_cam_dma_fifo_overflow;
      debug_cam_dma_fifo_underflow         <= (cam_dma_fifo_underflow)          ? 1'b1 : debug_cam_dma_fifo_underflow;
      debug_cam_dma_fifo_rcount            <= (cam_dma_wvalid)                  ? debug_cam_dma_fifo_rcount + 1'b1 : debug_cam_dma_fifo_rcount;
      debug_cam_dma_fifo_wcount            <= (cam_dma_fifo_wvalid)             ? debug_cam_dma_fifo_wcount + 1'b1 : debug_cam_dma_fifo_wcount;

      //Frame counter - Assume frame rate > 1 FPS
      timer_count                          <= (timer_count == MIPI_PCLK_CLK_RATE) ? 32'd0 : timer_count + 1'b1;
      frame_count                          <= (timer_count == MIPI_PCLK_CLK_RATE) ? 32'd0 : (cam_vs_fall_edge) ? frame_count + 1'b1 : frame_count;
      frames_per_second                    <= (timer_count == MIPI_PCLK_CLK_RATE) ? frame_count : frames_per_second;
   end
end

assign debug_cam_dma_status = {29'd0, cam_dma_fifo_empty, cam_dma_write, cam_dma_wready};

assign cam_dma_fifo_re = cam_dma_write && cam_dma_wready && ~cam_dma_fifo_empty;
assign cam_dma_wvalid  = cam_dma_fifo_rvalid && cam_dma_fifo_re;
assign cam_dma_wdata   = {8'd0, cam_dma_fifo_rdata[47:24], 8'd0, cam_dma_fifo_rdata[23:0]};
assign cam_dma_wlast   = cam_dma_wvalid && (cam_dma_count==DMA_TRANSFER_LENGTH-1);

endmodule