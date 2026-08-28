////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2026 Efinix Inc. All rights reserved.
// See https://github.com/Efinix-Inc/evsoc/blob/main/LICENSE.txt for details.
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module hw_accel_apb3 #(
   parameter   ADDR_WIDTH  = 16,
   parameter   DATA_WIDTH  = 32,
   parameter   NUM_REG     = 3
) (
   output [7:0] sobel_thresh_var,
   output [1:0] hw_accel_mode,
   output       dma_wr_init_done,

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
reg [DATA_WIDTH-1:0] slaveReg [0:NUM_REG-1];
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
      if(!resetn)
         for(byteIndex = 0; byteIndex < NUM_REG; byteIndex = byteIndex + 1)
            slaveReg[byteIndex] <= {{DATA_WIDTH}{1'b0}};
      else begin
         for(byteIndex = 0; byteIndex < NUM_REG; byteIndex = byteIndex + 1)
            if(actWrite && PADDR[ADDR_WIDTH-1:0] == (byteIndex*4))
               slaveReg[byteIndex] <= PWDATA;
            else
               slaveReg[byteIndex] <= slaveReg[byteIndex];
      end
   end

//    always@ (posedge clk or negedge resetn)
//    begin
//       if(!resetn)
//          slaveRegOut <= {{DATA_WIDTH}{1'b0}};
//       else begin
//          if (actRead) begin
//             case(PADDR[6:2])
//                5'd5  : slaveRegOut <= 32'hABCD_5678;   //To verify correct slave read operation
//                5'd6  : slaveRegOut <= debug_fifo_status;
//                5'd7  : slaveRegOut <= debug_cam_dma_fifo_rcount;
//                5'd8  : slaveRegOut <= debug_cam_dma_fifo_wcount;
//                5'd9  : slaveRegOut <= debug_display_dma_fifo_rcount;
//                5'd10 : slaveRegOut <= debug_display_dma_fifo_wcount;
//                5'd11 : slaveRegOut <= debug_cam_dma_status;
//                5'd12 : slaveRegOut <= frames_per_second;
//                5'd13 : slaveRegOut <= {30'd0, select_demo_mode};
//                default: begin slaveRegOut <= slaveRegOut; end
//             endcase
//          end
//          else
//             slaveRegOut <= slaveRegOut;
//       end
//    end

   //custom logic starts here
   assign sobel_thresh_var         = slaveReg[0][7:0];
   assign hw_accel_mode            = slaveReg[1][1:0];
   assign dma_wr_init_done         = slaveReg[2][0];

endmodule
