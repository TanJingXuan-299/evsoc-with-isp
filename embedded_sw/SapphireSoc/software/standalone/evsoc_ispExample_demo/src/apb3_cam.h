////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2026 Efinix Inc. All rights reserved.
// See https://github.com/Efinix-Inc/evsoc/blob/main/LICENSE.txt for details.
////////////////////////////////////////////////////////////////////////////////

#ifndef APB3_CAM_H
#define APB3_CAM_H

#include "bsp.h"
#include "userDef.h"

#define DELAY_BUSY 5

#ifdef DUAL_CAM

#define EXAMPLE_APB3_SLV_REG0_OFFSET  0	 	// mipi_rst
#define EXAMPLE_APB3_SLV_REG1_OFFSET  4	 	// cam1_rgb_control
#define EXAMPLE_APB3_SLV_REG2_OFFSET  8	 	// cam1_trigger_capture_frame
#define EXAMPLE_APB3_SLV_REG3_OFFSET  12	// cam1_rgb_gray
#define EXAMPLE_APB3_SLV_REG4_OFFSET  16	// cam1_dma_init_done
#define EXAMPLE_APB3_SLV_REG5_OFFSET  20	// cam2_rgb_control
#define EXAMPLE_APB3_SLV_REG6_OFFSET  24	// cam2_trigger_capture_frame
#define EXAMPLE_APB3_SLV_REG7_OFFSET  28	// cam2_rgb_gray
#define EXAMPLE_APB3_SLV_REG8_OFFSET  32	// cam2_dma_init_done
#define EXAMPLE_APB3_SLV_REG9_OFFSET  36	// Expect 32'hABCD_5678 - Verify slave read operation
#define EXAMPLE_APB3_SLV_REG10_OFFSET 40 	// debug_fifo_status
#define EXAMPLE_APB3_SLV_REG11_OFFSET 44 	// debug_display_dma_fifo_rcount
#define EXAMPLE_APB3_SLV_REG12_OFFSET 48 	// debug_display_dma_fifo_wcount
#define EXAMPLE_APB3_SLV_REG13_OFFSET 52 	// cam1_frames_per_second
#define EXAMPLE_APB3_SLV_REG14_OFFSET 56 	// debug_cam1_dma_fifo_rcount
#define EXAMPLE_APB3_SLV_REG15_OFFSET 60 	// debug_cam1_dma_fifo_wcount
#define EXAMPLE_APB3_SLV_REG16_OFFSET 64 	// debug_cam1_dma_status
#define EXAMPLE_APB3_SLV_REG17_OFFSET 68 	// cam2_frames_per_second
#define EXAMPLE_APB3_SLV_REG18_OFFSET 72 	// debug_cam2_dma_fifo_rcount
#define EXAMPLE_APB3_SLV_REG19_OFFSET 76 	// debug_cam2_dma_fifo_wcount
#define EXAMPLE_APB3_SLV_REG20_OFFSET 80 	// debug_cam2_dma_status

#else

#define EXAMPLE_APB3_SLV_REG0_OFFSET  0	 	// black_level
#define EXAMPLE_APB3_SLV_REG1_OFFSET  4	 	// cam_confdone
#define EXAMPLE_APB3_SLV_REG2_OFFSET  8	 	// trigger_capture_frame
#define EXAMPLE_APB3_SLV_REG3_OFFSET  12	// rgb_gray
#define EXAMPLE_APB3_SLV_REG4_OFFSET  16	// cam_dma_init_done
#define EXAMPLE_APB3_SLV_REG5_OFFSET  20	// rgain
#define EXAMPLE_APB3_SLV_REG6_OFFSET  24	// ggain
#define EXAMPLE_APB3_SLV_REG7_OFFSET  28	// bgain
#define EXAMPLE_APB3_SLV_REG8_OFFSET  32	// ccm_r_r
#define EXAMPLE_APB3_SLV_REG9_OFFSET  36	// ccm_r_g
#define EXAMPLE_APB3_SLV_REG10_OFFSET 40 	// ccm_r_b
#define EXAMPLE_APB3_SLV_REG11_OFFSET 44 	// ccm_g_r
#define EXAMPLE_APB3_SLV_REG12_OFFSET 48 	// ccm_g_g
#define EXAMPLE_APB3_SLV_REG13_OFFSET 52 	// ccm_g_b
#define EXAMPLE_APB3_SLV_REG14_OFFSET 56	// ccm_b_r
#define EXAMPLE_APB3_SLV_REG15_OFFSET 60	// ccm_b_g
#define EXAMPLE_APB3_SLV_REG16_OFFSET 64	// ccm_b_b
#define EXAMPLE_APB3_SLV_REG17_OFFSET 68	// isp_enable
#define EXAMPLE_APB3_SLV_REG18_OFFSET 72	// isp_counter_ready
#define EXAMPLE_APB3_SLV_REG19_OFFSET 76	// Expect 32'hABCD_5678 - Verify slave read operation
#define EXAMPLE_APB3_SLV_REG20_OFFSET 80	// debug_fifo_status
#define EXAMPLE_APB3_SLV_REG21_OFFSET 84	// debug_cam_dma_fifo_rcount
#define EXAMPLE_APB3_SLV_REG22_OFFSET 88	// debug_cam_dma_fifo_wcount
#define EXAMPLE_APB3_SLV_REG23_OFFSET 92	// debug_display_dma_fifo_rcount
#define EXAMPLE_APB3_SLV_REG24_OFFSET 96 	// debug_display_dma_fifo_wcount
#define EXAMPLE_APB3_SLV_REG25_OFFSET 100 	// debug_cam_dma_status
#define EXAMPLE_APB3_SLV_REG26_OFFSET 104 	// frames_per_second
#define EXAMPLE_APB3_SLV_REG27_OFFSET 108 	// select_demo_mode
#define EXAMPLE_APB3_SLV_REG28_OFFSET 112   // isp_info0_min
#define EXAMPLE_APB3_SLV_REG29_OFFSET 116   // isp_info1_min
#define EXAMPLE_APB3_SLV_REG30_OFFSET 120   // isp_info2_min
#define EXAMPLE_APB3_SLV_REG31_OFFSET 124   // isp_info3_min
#define EXAMPLE_APB3_SLV_REG32_OFFSET 128   // isp_info4_min
#define EXAMPLE_APB3_SLV_REG33_OFFSET 132   // isp_info5_min
#define EXAMPLE_APB3_SLV_REG34_OFFSET 136   // isp_info0_max
#define EXAMPLE_APB3_SLV_REG35_OFFSET 140   // isp_info1_max
#define EXAMPLE_APB3_SLV_REG36_OFFSET 144   // isp_info2_max
#define EXAMPLE_APB3_SLV_REG37_OFFSET 148   // isp_info3_max
#define EXAMPLE_APB3_SLV_REG38_OFFSET 152   // isp_info4_max
#define EXAMPLE_APB3_SLV_REG39_OFFSET 156   // isp_info5_max
#define EXAMPLE_APB3_SLV_REG40_OFFSET 160   // isp_counter_valid

#endif

#define EXAMPLE_APB3_REGR(addr, offset) \
	read_u32(addr + offset)

#define EXAMPLE_APB3_REGW(addr, offset, data) \
	write_u32(data, addr + offset)

#define MASK_OVERWRITE_BIT 1

static u32 example_register_read(u16 reg)
{
	u32 rdata;
	rdata = EXAMPLE_APB3_REGR(EXAMPLE_APB3_SLV, reg);
	return rdata;
}

// Unified Set_Gain — camId selects which camera (0 = cam1, 1 = cam2)
static inline void Set_Gain(int camId, int var, u16 setting)
{
	u32 data = setting;

#ifdef DUAL_CAM
	u32 offset = (camId == 0) ? EXAMPLE_APB3_SLV_REG1_OFFSET
							  : EXAMPLE_APB3_SLV_REG5_OFFSET;
#else
	u32 offset = (var==0) ? EXAMPLE_APB3_SLV_REG0_OFFSET : 
				 (var==1) ? EXAMPLE_APB3_SLV_REG5_OFFSET :
				 (var==2) ? EXAMPLE_APB3_SLV_REG6_OFFSET :
				 (var==3) ? EXAMPLE_APB3_SLV_REG7_OFFSET :
				 (var==4) ? EXAMPLE_APB3_SLV_REG8_OFFSET :
				 (var==5) ? EXAMPLE_APB3_SLV_REG9_OFFSET :
				 (var==6) ? EXAMPLE_APB3_SLV_REG10_OFFSET:
				 (var==7) ? EXAMPLE_APB3_SLV_REG11_OFFSET:
				 (var==8) ? EXAMPLE_APB3_SLV_REG12_OFFSET:
				 (var==9) ? EXAMPLE_APB3_SLV_REG13_OFFSET:
				 (var==10)? EXAMPLE_APB3_SLV_REG14_OFFSET:
				 (var==11)? EXAMPLE_APB3_SLV_REG15_OFFSET: 
				 (var==12)? EXAMPLE_APB3_SLV_REG16_OFFSET:EXAMPLE_APB3_SLV_REG17_OFFSET; // single cam, camId ignored
#endif

	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, offset, data);
	bsp_uDelay(DELAY_BUSY);
}

static inline void Set_MipiRst(u8 rst)
{
#ifdef DUAL_CAM
	u32 offset = EXAMPLE_APB3_SLV_REG0_OFFSET;
#else
	u32 offset = EXAMPLE_APB3_SLV_REG1_OFFSET;
#endif

	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, offset, rst & 0x01);
	bsp_uDelay(DELAY_BUSY);
}

#endif

static inline void Read_Latency()
{
	u32 valid_status = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG40_OFFSET);
	for(int i=0; i<12; i++)
	{
		if(valid_status & (1 << i) != 0)
		{
			write_u32(1 << i, EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG18_OFFSET);
			u32 counter_data = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4) >> 1;
			u32 overflow     = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4) & 1;
			bsp_uDelay(DELAY_BUSY);

			switch(i)
			{
				case 0:
					overflow == 0 ? bsp_printf("TOTAL ISP minimum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("TOTAL ISP minimum latency: OVERFLOW\n\r", counter_data);
				break;
				case 1:
					overflow == 0 ? bsp_printf("BLC minimum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("BLC minimum latency: OVERFLOW\n\r", counter_data);
				break;
				case 2:
					overflow == 0 ? bsp_printf("COLOUR GAIN minimum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("COLOUR GAIN minimum latency: OVERFLOW\n\r", counter_data);
				break;
				case 3:
					overflow == 0 ? bsp_printf("DEMOSAIC minimum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("DEMOSAIC minimum latency: OVERFLOW\n\r", counter_data);
				break;
				case 4:
					overflow == 0 ? bsp_printf("CCM minimum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("CCM minimum latency: OVERFLOW\n\r", counter_data);
				break;
				case 5:
					overflow == 0 ? bsp_printf("GAMMA minimum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("GAMMA minimum latency: OVERFLOW\n\r", counter_data);
				break;
				case 6:
					overflow == 0 ? bsp_printf("TOTAL ISP maximum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("TOTAL ISP maximum latency: OVERFLOW\n\r", counter_data);
				break;
				case 7:
					overflow == 0 ? bsp_printf("BLC maximum latency: %d clock cycles\n\r", counter_data):
					                bsp_printf("BLC maximum latency: OVERFLOW\n\r", counter_data);
				break;
				case 8:
					overflow == 0 ? bsp_printf("COLOUR GAIN maximum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("COLOUR GAIN maximum latency: OVERFLOW\n\r", counter_data);
				break;
				case 9:
					overflow == 0 ? bsp_printf("DEMOSAIC maximum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("DEMOSAIC maximum latency: OVERFLOW\n\r", counter_data);
				break;
				case 10:
					overflow == 0 ? bsp_printf("CCM maximum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("CCM maximum latency: OVERFLOW\n\r", counter_data);
				break;
				case 11:
					overflow == 0 ? bsp_printf("GAMMA maximum latency: %d clock cycles\n\r", counter_data):
								    bsp_printf("GAMMA maximum latency: OVERFLOW\n\r", counter_data);
				break;
			}
		}
	}
}
