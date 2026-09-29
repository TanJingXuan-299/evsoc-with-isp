////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2026 Efinix Inc. All rights reserved.
// See https://github.com/Efinix-Inc/evsoc/blob/main/LICENSE.txt for details.
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module common_apb3 #(
   parameter   ADDR_WIDTH  = 8,
   parameter   DATA_WIDTH  = 32,
   parameter   NUM_REG     = 19
) (
   input    [1:0]          select_demo_mode,
   output   [15:0]         black_level,
   output   [15:0]         rgain,
   output   [15:0]         ggain,
   output   [15:0]         bgain,
   output   [15:0]         ccm_r_r,
   output   [15:0]         ccm_r_g,
   output   [15:0]         ccm_r_b,
   output   [15:0]         ccm_g_r,
   output   [15:0]         ccm_g_g,
   output   [15:0]         ccm_g_b,
   output   [15:0]         ccm_b_r,
   output   [15:0]         ccm_b_g,
   output   [15:0]         ccm_b_b,
   output   [1:0]          isp_enable,
   input    [63:0]         isp_info0,
   input    [63:0]         isp_info1,
   input    [63:0]         isp_info2,
   input    [63:0]         isp_info3,
   input    [63:0]         isp_info4,
   input    [63:0]         isp_info5,
   output   [11:0]         isp_ready,
   output                  mipi_rstn,
   output                  enable_cam,
   output                  trigger_capture_frame,
   output                  continuous_capture_frame,
   output                  rgb_gray,
   output                  cam_dma_init_done,
   input   [31:0]          debug_fifo_status,
   input   [31:0]          debug_cam_dma_fifo_rcount,
   input   [31:0]          debug_cam_dma_fifo_wcount,
   input   [31:0]          debug_display_dma_fifo_rcount,
   input   [31:0]          debug_display_dma_fifo_wcount,
   input   [31:0]          debug_cam_dma_status,
   input   [31:0]          frames_per_second,
   input                   clk,
   input                   resetn,
   input  [ADDR_WIDTH-1:0] PADDR,
   input                   PSEL,
   input                   PENABLE,
   output                  PREADY,
   input                   PWRITE,
   input  [DATA_WIDTH-1:0] PWDATA,
   output [DATA_WIDTH-1:0] PRDATA,
   output                  PSLVERROR
);

///////////////////////////////////////////////////////////////////////////////

localparam [1:0] IDLE   = 2'b00,
                 SETUP  = 2'b01,
                 ACCESS = 2'b10;

reg [1:0]            busState,
                     busNext;
reg [          15:0] slaveReg [0:NUM_REG-1];
reg [DATA_WIDTH-1:0] slaveRegOut;
reg                  slaveReady;
wire                 actWrite,
                     actRead;
integer              byteIndex;

///////////////////////////////////////////////////////////////////////////////

   always@(posedge clk or negedge resetn)
   begin
      if(!resetn) 
         busState <= IDLE; 
      else
         busState <= busNext; 
   end

   always@(*)
   begin
      busNext = busState;

      case(busState)
         IDLE:
         begin
            if(PSEL && !PENABLE)
               busNext = SETUP;
            else
               busNext = IDLE;
         end
         SETUP:
         begin
            if(PSEL && PENABLE)
               busNext = ACCESS;
            else
               busNext = IDLE;
         end
         ACCESS:
         begin
            if(PREADY)
               busNext = IDLE;
            else
               busNext = ACCESS;
         end
         default:
         begin
            busNext = IDLE;
         end
      endcase
   end

   assign actWrite   = PWRITE  & (busState == ACCESS);
   assign actRead    = !PWRITE & (busState == ACCESS);
   assign PSLVERROR  = 1'b0; //FIXME
   assign PRDATA     = slaveRegOut;
   assign PREADY     = slaveReady && (busState !== IDLE);

   always@ (posedge clk)
   begin
      slaveReady <= actWrite | actRead;
   end

   always@ (posedge clk or negedge resetn)
   begin
      if(!resetn) begin
         for(byteIndex = 0; byteIndex < NUM_REG; byteIndex = byteIndex + 1)
            slaveReg[byteIndex] <= {{DATA_WIDTH}{1'b0}};
         slaveReg[0]  <= 16'h0010;  // black_level
         slaveReg[5]  <= 16'h00A0;  // rgain
         slaveReg[6]  <= 16'h0060;  // ggain
         slaveReg[7]  <= 16'h0080;  // bgain
         slaveReg[8]  <= 16'h252F;  // ccm_r_r =  9519
         slaveReg[9]  <= 16'hF1DA;  // ccm_r_g = -3622
         slaveReg[10] <= 16'hF8F7;  // ccm_r_b = -1801
         slaveReg[11] <= 16'hF5CA;  // ccm_g_r = -2614
         slaveReg[12] <= 16'h2956;  // ccm_g_g = 10582
         slaveReg[13] <= 16'hF0E0;  // ccm_g_b = -3872
         slaveReg[14] <= 16'hFB6F;  // ccm_b_r = -1169
         slaveReg[15] <= 16'hF758;  // ccm_b_g = -2216
         slaveReg[16] <= 16'h1D39;  // ccm_b_b =  7481
         slaveReg[17] <= 16'h0003;  // isp_enable
         slaveReg[18] <= 16'h0000;  // isp_ready
      end
      else begin
         for(byteIndex = 0; byteIndex < NUM_REG; byteIndex = byteIndex + 1)
            if(actWrite && PADDR[ADDR_WIDTH-1:0] == (byteIndex*4))
               slaveReg[byteIndex] <= PWDATA;
            else
               slaveReg[byteIndex] <= slaveReg[byteIndex];
      end
   end

   always@ (posedge clk or negedge resetn)
   begin
      if(!resetn)
         slaveRegOut <= {{DATA_WIDTH}{1'b0}};
      else begin
         if (actRead) begin
            case(PADDR[ADDR_WIDTH-1:2])
               'd19  : slaveRegOut <= 32'hABCD_5678;   //To verify correct slave read operation
               'd20  : slaveRegOut <= debug_fifo_status;
               'd21  : slaveRegOut <= debug_cam_dma_fifo_rcount;
               'd22  : slaveRegOut <= debug_cam_dma_fifo_wcount;
               'd23  : slaveRegOut <= debug_display_dma_fifo_rcount;
               'd24  : slaveRegOut <= debug_display_dma_fifo_wcount;
               'd25  : slaveRegOut <= debug_cam_dma_status;
               'd26  : slaveRegOut <= frames_per_second;
               'd27  : slaveRegOut <= {30'd0, select_demo_mode};
               'd28  : slaveRegOut <= isp_info0[31: 1];
               'd29  : slaveRegOut <= isp_info1[31: 1];
               'd30  : slaveRegOut <= isp_info2[31: 1];
               'd31  : slaveRegOut <= isp_info3[31: 1];
               'd32  : slaveRegOut <= isp_info4[31: 1];
               'd33  : slaveRegOut <= isp_info5[31: 1];
               'd34  : slaveRegOut <= isp_info0[63:33];
               'd35  : slaveRegOut <= isp_info1[63:33];
               'd36  : slaveRegOut <= isp_info2[63:33];
               'd37  : slaveRegOut <= isp_info3[63:33];
               'd38  : slaveRegOut <= isp_info4[63:33];
               'd39  : slaveRegOut <= isp_info5[63:33];
               'd40  : slaveRegOut <= {{20{1'b0}},
                                       isp_info5[32],
                                       isp_info4[32],
                                       isp_info3[32],
                                       isp_info2[32],
                                       isp_info1[32],
                                       isp_info0[32],
                                       isp_info5[ 0],
                                       isp_info4[ 0],
                                       isp_info3[ 0],
                                       isp_info2[ 0],
                                       isp_info1[ 0],
                                       isp_info0[ 0]};
               default: begin slaveRegOut <= slaveRegOut; end
            endcase
         end
         else
            slaveRegOut <= slaveRegOut;
      end
   end

   //custom logic starts here
   assign black_level              = slaveReg[0][15:0];
   assign mipi_rstn                = slaveReg[1][0];
   assign trigger_capture_frame    = slaveReg[2][0];
   assign continuous_capture_frame = slaveReg[2][1];
   assign rgb_gray                 = slaveReg[3][0];
   assign cam_dma_init_done        = slaveReg[4][0];
   assign enable_cam               = slaveReg[1][1];
   assign rgain                    = slaveReg[5][15:0];
   assign ggain                    = slaveReg[6][15:0];
   assign bgain                    = slaveReg[7][15:0];
   assign ccm_r_r                  = slaveReg[8][15:0];
   assign ccm_r_g                  = slaveReg[9][15:0];
   assign ccm_r_b                  = slaveReg[10][15:0];
   assign ccm_g_r                  = slaveReg[11][15:0];
   assign ccm_g_g                  = slaveReg[12][15:0];
   assign ccm_g_b                  = slaveReg[13][15:0];
   assign ccm_b_r                  = slaveReg[14][15:0];
   assign ccm_b_g                  = slaveReg[15][15:0];
   assign ccm_b_b                  = slaveReg[16][15:0];
   assign isp_enable               = slaveReg[17][ 1:0];
   assign isp_ready                = slaveReg[18][11:0];
endmodule
