
build/evsoc_ispExample_demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00004197          	auipc	gp,0x4
    1004:	06818193          	addi	gp,gp,104 # 5068 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00005117          	auipc	sp,0x5
    100c:	89810113          	addi	sp,sp,-1896 # 58a0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00003517          	auipc	a0,0x3
    1014:	bc450513          	addi	a0,a0,-1084 # 3bd4 <_data>
	la a1, _data
    1018:	00003597          	auipc	a1,0x3
    101c:	bbc58593          	addi	a1,a1,-1092 # 3bd4 <_data>
	la a2, _edata
    1020:	00004617          	auipc	a2,0x4
    1024:	86c60613          	addi	a2,a2,-1940 # 488c <display_mm2s_active>
	bgeu a1, a2, 2f
    1028:	00c5fc63          	bgeu	a1,a2,1040 <init+0x38>
1:
	lw t0, (a0)
    102c:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
    1030:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
    1034:	00450513          	addi	a0,a0,4
	addi a1, a1, 4
    1038:	00458593          	addi	a1,a1,4
	bltu a1, a2, 1b
    103c:	fec5e8e3          	bltu	a1,a2,102c <init+0x24>
2:

	/* Clear bss section */
	la a0, __bss_start
    1040:	00004517          	auipc	a0,0x4
    1044:	84c50513          	addi	a0,a0,-1972 # 488c <display_mm2s_active>
	la a1, _end
    1048:	00004597          	auipc	a1,0x4
    104c:	85058593          	addi	a1,a1,-1968 # 4898 <_end>
	bgeu a0, a1, 2f
    1050:	00b57863          	bgeu	a0,a1,1060 <init+0x58>
1:
	sw zero, (a0)
    1054:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
    1058:	00450513          	addi	a0,a0,4
	bltu a0, a1, 1b
    105c:	feb56ce3          	bltu	a0,a1,1054 <init+0x4c>
2:

#ifndef NO_LIBC_INIT_ARRAY
	call __libc_init_array
    1060:	010000ef          	jal	1070 <__libc_init_array>
#endif

	call main
    1064:	0a0000ef          	jal	1104 <main>

00001068 <mainDone>:
mainDone:
    j mainDone
    1068:	0000006f          	j	1068 <mainDone>

0000106c <_init>:


	.globl _init
_init:
    ret
    106c:	00008067          	ret

Disassembly of section .text:

00001070 <__libc_init_array>:
    1070:	ff010113          	addi	sp,sp,-16
    1074:	00812423          	sw	s0,8(sp)
    1078:	01212023          	sw	s2,0(sp)
    107c:	00003797          	auipc	a5,0x3
    1080:	b5878793          	addi	a5,a5,-1192 # 3bd4 <_data>
    1084:	00003417          	auipc	s0,0x3
    1088:	b5040413          	addi	s0,s0,-1200 # 3bd4 <_data>
    108c:	00112623          	sw	ra,12(sp)
    1090:	00912223          	sw	s1,4(sp)
    1094:	40878933          	sub	s2,a5,s0
    1098:	02878063          	beq	a5,s0,10b8 <__libc_init_array+0x48>
    109c:	40295913          	srai	s2,s2,0x2
    10a0:	00000493          	li	s1,0
    10a4:	00042783          	lw	a5,0(s0)
    10a8:	00148493          	addi	s1,s1,1
    10ac:	00440413          	addi	s0,s0,4
    10b0:	000780e7          	jalr	a5
    10b4:	ff24e8e3          	bltu	s1,s2,10a4 <__libc_init_array+0x34>
    10b8:	00003797          	auipc	a5,0x3
    10bc:	b1c78793          	addi	a5,a5,-1252 # 3bd4 <_data>
    10c0:	00003417          	auipc	s0,0x3
    10c4:	b1440413          	addi	s0,s0,-1260 # 3bd4 <_data>
    10c8:	40878933          	sub	s2,a5,s0
    10cc:	40295913          	srai	s2,s2,0x2
    10d0:	00878e63          	beq	a5,s0,10ec <__libc_init_array+0x7c>
    10d4:	00000493          	li	s1,0
    10d8:	00042783          	lw	a5,0(s0)
    10dc:	00148493          	addi	s1,s1,1
    10e0:	00440413          	addi	s0,s0,4
    10e4:	000780e7          	jalr	a5
    10e8:	ff24e8e3          	bltu	s1,s2,10d8 <__libc_init_array+0x68>
    10ec:	00c12083          	lw	ra,12(sp)
    10f0:	00812403          	lw	s0,8(sp)
    10f4:	00412483          	lw	s1,4(sp)
    10f8:	00012903          	lw	s2,0(sp)
    10fc:	01010113          	addi	sp,sp,16
    1100:	00008067          	ret

00001104 <main>:
}

/****************************************************************MAIN**************************************************************/

void main()
{
    1104:	ff010113          	addi	sp,sp,-16
    1108:	00112623          	sw	ra,12(sp)
    110c:	00812423          	sw	s0,8(sp)

    bsp_printf("\n\rHello Efinix Edge Vision SoC!!\n\n\r");
    1110:	00004537          	lui	a0,0x4
    1114:	04050513          	addi	a0,a0,64 # 4040 <_data+0x46c>
    1118:	048010ef          	jal	2160 <bsp_printf>

    cam0_init(I2C_CTRL_CAM0);
    bsp_printf("\n\rDone !!\n\r");

#elif defined(BOARD_Ti60F225)
    bsp_printf("Init Camera.....");
    111c:	00004537          	lui	a0,0x4
    1120:	06450513          	addi	a0,a0,100 # 4064 <_data+0x490>
    1124:	03c010ef          	jal	2160 <bsp_printf>
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    1128:	f8100437          	lui	s0,0xf8100
    112c:	00042223          	sw	zero,4(s0) # f8100004 <__freertos_irq_stack_top+0xf80fa764>

    // Assert camera reset
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000000);
    bsp_uDelay(100);
    1130:	f8b00637          	lui	a2,0xf8b00
    1134:	05f5e5b7          	lui	a1,0x5f5e
    1138:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f58860>
    113c:	06400513          	li	a0,100
    1140:	3d1000ef          	jal	1d10 <clint_uDelay>
    1144:	00200793          	li	a5,2
    1148:	00f42223          	sw	a5,4(s0)
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000002);
    bsp_uDelay(1000 * 10);
    114c:	f8b00637          	lui	a2,0xf8b00
    1150:	05f5e5b7          	lui	a1,0x5f5e
    1154:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f58860>
    1158:	00002537          	lui	a0,0x2
    115c:	71050513          	addi	a0,a0,1808 # 2710 <i2c_txAckWait+0x8>
    1160:	3b1000ef          	jal	1d10 <clint_uDelay>

    cam0_init(I2C_CTRL_CAM0);
    1164:	f8015537          	lui	a0,0xf8015
    1168:	230020ef          	jal	3398 <cam0_init>
    116c:	00300793          	li	a5,3
    1170:	00f42223          	sw	a5,4(s0)

    // Indicate camera configuration done
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000003);
    bsp_printf("Done\n\r");
    1174:	00004537          	lui	a0,0x4
    1178:	07850513          	addi	a0,a0,120 # 4078 <_data+0x4a4>
    117c:	7e5000ef          	jal	2160 <bsp_printf>

#endif

    /******************************************************SETUP DMA & UART********************************************************/

    bsp_printf("Init DMA.....");
    1180:	00004537          	lui	a0,0x4
    1184:	08050513          	addi	a0,a0,128 # 4080 <_data+0x4ac>
    1188:	7d9000ef          	jal	2160 <bsp_printf>

    uart_interrupt_init();
    118c:	19c010ef          	jal	2328 <uart_interrupt_init>
    dma_init();
    1190:	079000ef          	jal	1a08 <dma_init>

    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, 0, 0);
    1194:	00000693          	li	a3,0
    1198:	00000613          	li	a2,0
    119c:	00400593          	li	a1,4
    11a0:	f8110537          	lui	a0,0xf8110
    11a4:	7a5000ef          	jal	2148 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, 0, 0);
    11a8:	00000693          	li	a3,0
    11ac:	00000613          	li	a2,0
    11b0:	00300593          	li	a1,3
    11b4:	f8110537          	lui	a0,0xf8110
    11b8:	791000ef          	jal	2148 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, 0, 0);
    11bc:	00000693          	li	a3,0
    11c0:	00000613          	li	a2,0
    11c4:	00200593          	li	a1,2
    11c8:	f8110537          	lui	a0,0xf8110
    11cc:	77d000ef          	jal	2148 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, 0, 0);
    11d0:	00000693          	li	a3,0
    11d4:	00000613          	li	a2,0
    11d8:	00000593          	li	a1,0
    11dc:	f8110537          	lui	a0,0xf8110
    11e0:	769000ef          	jal	2148 <dmasg_priority>

    bsp_printf("Done !!\n\n\r");
    11e4:	00004537          	lui	a0,0x4
    11e8:	09050513          	addi	a0,a0,144 # 4090 <_data+0x4bc>
    11ec:	775000ef          	jal	2160 <bsp_printf>

    /*******************************************************Trigger Display********************************************************/

    select_demo_mode = 0; // Default
    11f0:	8201a423          	sw	zero,-2008(gp) # 4890 <select_demo_mode>

    // To check display functionality
    bsp_printf("Initialize test display content..\n\r");
    11f4:	00004537          	lui	a0,0x4
    11f8:	09c50513          	addi	a0,a0,156 # 409c <_data+0x4c8>
    11fc:	765000ef          	jal	2160 <bsp_printf>

    // Array name to be modified to DDR location used for display
    // Colour bar & Red dots at 4 corners of active display
    // Initialize test image in cam_array - Default
    for (int y = 0; y < FRAME_HEIGHT; y++)
    1200:	00000613          	li	a2,0
    1204:	1100006f          	j	1314 <main+0x210>
    {
        for (int x = 0; x < FRAME_WIDTH; x++)
        {
            if ((x < 3 && y < 3) || (x >= FRAME_WIDTH - 3 && y < 3) || (x < 3 && y >= FRAME_HEIGHT - 3) || (x >= FRAME_WIDTH - 3 && y >= FRAME_HEIGHT - 3))
    1208:	00200713          	li	a4,2
    120c:	00c75c63          	bge	a4,a2,1224 <main+0x120>
    1210:	0af74063          	blt	a4,a5,12b0 <main+0x1ac>
    1214:	21800713          	li	a4,536
    1218:	08c75c63          	bge	a4,a2,12b0 <main+0x1ac>
    121c:	0080006f          	j	1224 <main+0x120>
    1220:	08c75c63          	bge	a4,a2,12b8 <main+0x1b4>
            {
                cam_array[y * FRAME_WIDTH + x] = 0x000000FF; // RED
    1224:	21c00713          	li	a4,540
    1228:	02e60733          	mul	a4,a2,a4
    122c:	00f70733          	add	a4,a4,a5
    1230:	00271713          	slli	a4,a4,0x2
    1234:	001006b7          	lui	a3,0x100
    1238:	00e68733          	add	a4,a3,a4
    123c:	0ff00693          	li	a3,255
    1240:	00d72023          	sw	a3,0(a4)
    1244:	0540006f          	j	1298 <main+0x194>
            }
            else if (x < (FRAME_WIDTH / 4))
            {
                cam_array[y * FRAME_WIDTH + x] = 0x0000FF00; // GREEN
    1248:	21c00713          	li	a4,540
    124c:	02e60733          	mul	a4,a2,a4
    1250:	00f70733          	add	a4,a4,a5
    1254:	00271713          	slli	a4,a4,0x2
    1258:	001006b7          	lui	a3,0x100
    125c:	00e68733          	add	a4,a3,a4
    1260:	000106b7          	lui	a3,0x10
    1264:	f0068693          	addi	a3,a3,-256 # ff00 <__freertos_irq_stack_top+0xa660>
    1268:	00d72023          	sw	a3,0(a4)
    126c:	02c0006f          	j	1298 <main+0x194>
            }
            else if (x < (FRAME_WIDTH / 4 * 2))
            {
                cam_array[y * FRAME_WIDTH + x] = 0x00FF0000; // BLUE
            }
            else if (x < (FRAME_WIDTH / 4 * 3))
    1270:	19400713          	li	a4,404
    1274:	06f74c63          	blt	a4,a5,12ec <main+0x1e8>
            {
                cam_array[y * FRAME_WIDTH + x] = 0x000000FF; // RED
    1278:	21c00713          	li	a4,540
    127c:	02e60733          	mul	a4,a2,a4
    1280:	00f70733          	add	a4,a4,a5
    1284:	00271713          	slli	a4,a4,0x2
    1288:	001006b7          	lui	a3,0x100
    128c:	00e68733          	add	a4,a3,a4
    1290:	0ff00693          	li	a3,255
    1294:	00d72023          	sw	a3,0(a4)
        for (int x = 0; x < FRAME_WIDTH; x++)
    1298:	00178793          	addi	a5,a5,1
    129c:	21b00713          	li	a4,539
    12a0:	06f74863          	blt	a4,a5,1310 <main+0x20c>
            if ((x < 3 && y < 3) || (x >= FRAME_WIDTH - 3 && y < 3) || (x < 3 && y >= FRAME_HEIGHT - 3) || (x >= FRAME_WIDTH - 3 && y >= FRAME_HEIGHT - 3))
    12a4:	ffd78713          	addi	a4,a5,-3
    12a8:	21500693          	li	a3,533
    12ac:	f4e6eee3          	bltu	a3,a4,1208 <main+0x104>
    12b0:	21800713          	li	a4,536
    12b4:	f6f746e3          	blt	a4,a5,1220 <main+0x11c>
            else if (x < (FRAME_WIDTH / 4))
    12b8:	08600713          	li	a4,134
    12bc:	f8f756e3          	bge	a4,a5,1248 <main+0x144>
            else if (x < (FRAME_WIDTH / 4 * 2))
    12c0:	10d00713          	li	a4,269
    12c4:	faf746e3          	blt	a4,a5,1270 <main+0x16c>
                cam_array[y * FRAME_WIDTH + x] = 0x00FF0000; // BLUE
    12c8:	21c00713          	li	a4,540
    12cc:	02e60733          	mul	a4,a2,a4
    12d0:	00f70733          	add	a4,a4,a5
    12d4:	00271713          	slli	a4,a4,0x2
    12d8:	001006b7          	lui	a3,0x100
    12dc:	00e68733          	add	a4,a3,a4
    12e0:	00ff06b7          	lui	a3,0xff0
    12e4:	00d72023          	sw	a3,0(a4)
    12e8:	fb1ff06f          	j	1298 <main+0x194>
            }
            else
            {
                cam_array[y * FRAME_WIDTH + x] = 0x00FF0000; // BLUE
    12ec:	21c00713          	li	a4,540
    12f0:	02e60733          	mul	a4,a2,a4
    12f4:	00f70733          	add	a4,a4,a5
    12f8:	00271713          	slli	a4,a4,0x2
    12fc:	001006b7          	lui	a3,0x100
    1300:	00e68733          	add	a4,a3,a4
    1304:	00ff06b7          	lui	a3,0xff0
    1308:	00d72023          	sw	a3,0(a4)
    130c:	f8dff06f          	j	1298 <main+0x194>
    for (int y = 0; y < FRAME_HEIGHT; y++)
    1310:	00160613          	addi	a2,a2,1 # f8b00001 <__freertos_irq_stack_top+0xf8afa761>
    1314:	21b00793          	li	a5,539
    1318:	00c7c663          	blt	a5,a2,1324 <main+0x220>
        for (int x = 0; x < FRAME_WIDTH; x++)
    131c:	00000793          	li	a5,0
    1320:	f7dff06f          	j	129c <main+0x198>
            }
        }
    }

    // Trigger display DMA once then the rest handled by DMA (Direct mode DMA)
    bsp_printf("\nTrigger display DMA..\n\r");
    1324:	00004537          	lui	a0,0x4
    1328:	0c050513          	addi	a0,a0,192 # 40c0 <_data+0x4ec>
    132c:	635000ef          	jal	2160 <bsp_printf>

    // SELECT start address of to be displayed data accordingly - Default
    dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    1330:	01000693          	li	a3,16
    1334:	00100637          	lui	a2,0x100
    1338:	00200593          	li	a1,2
    133c:	f8110537          	lui	a0,0xf8110
    1340:	501000ef          	jal	2040 <dmasg_input_memory>

    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    1344:	00100793          	li	a5,1
    1348:	00000713          	li	a4,0
    134c:	00000693          	li	a3,0
    1350:	00000613          	li	a2,0
    1354:	00200593          	li	a1,2
    1358:	f8110537          	lui	a0,0xf8110
    135c:	56d000ef          	jal	20c8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    1360:	00400613          	li	a2,4
    1364:	00200593          	li	a1,2
    1368:	f8110537          	lui	a0,0xf8110
    136c:	5b1000ef          	jal	211c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restart
    1370:	00000693          	li	a3,0
    1374:	0011d637          	lui	a2,0x11d
    1378:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1173a0>
    137c:	00200593          	li	a1,2
    1380:	f8110537          	lui	a0,0xf8110
    1384:	571000ef          	jal	20f4 <dmasg_direct_start>
    display_mm2s_active = 1;                                                                         // Display always active
    1388:	00100713          	li	a4,1
    138c:	82e1a223          	sw	a4,-2012(gp) # 488c <display_mm2s_active>

    msDelay(5000); // Display test content for 5 seconds
    1390:	00001537          	lui	a0,0x1
    1394:	38850513          	addi	a0,a0,904 # 1388 <main+0x284>
    1398:	035000ef          	jal	1bcc <msDelay>

    bsp_printf("Done !!\n\n\r");
    139c:	00004537          	lui	a0,0x4
    13a0:	09050513          	addi	a0,a0,144 # 4090 <_data+0x4bc>
    13a4:	5bd000ef          	jal	2160 <bsp_printf>

    ispExample_menu();
    13a8:	250010ef          	jal	25f8 <ispExample_menu>

    bsp_printf("Default Demo Mode: a\n\r");
    13ac:	00004537          	lui	a0,0x4
    13b0:	0dc50513          	addi	a0,a0,220 # 40dc <_data+0x508>
    13b4:	5ad000ef          	jal	2160 <bsp_printf>
    13b8:	1040006f          	j	14bc <main+0x3b8>
    13bc:	f81007b7          	lui	a5,0xf8100
    13c0:	0007a623          	sw	zero,12(a5) # f810000c <__freertos_irq_stack_top+0xf80fa76c>
    }
    13c4:	1100006f          	j	14d4 <main+0x3d0>

        /*******************************************************RISC-V Processing***********************************************************/

        if (select_demo_mode == 1 || select_demo_mode == 2)
        {
            rgb2grayscale(cam_array, grayscale_array, FRAME_WIDTH, FRAME_HEIGHT);
    13c8:	21c00693          	li	a3,540
    13cc:	21c00613          	li	a2,540
    13d0:	005005b7          	lui	a1,0x500
    13d4:	00100537          	lui	a0,0x100
    13d8:	6b9000ef          	jal	2290 <rgb2grayscale>
    13dc:	17c0006f          	j	1558 <main+0x454>
        *((volatile u32*) address) = data;
    13e0:	f81207b7          	lui	a5,0xf8120
    13e4:	0007a223          	sw	zero,4(a5) # f8120004 <__freertos_irq_stack_top+0xf811a764>
                write_u32(0x00000002, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG1_OFFSET); // 2'd2: Sobel+Erosion
            }

            // Trigger HW accel MM2S DMA
            // SELECT start address of DMA input to HW accel block
            dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, CAM_START_ADDR, 16); // Camera pre-processing block performs HW RGB2grayscale conversion
    13e8:	01000693          	li	a3,16
    13ec:	00100637          	lui	a2,0x100
    13f0:	00400593          	li	a1,4
    13f4:	f8110537          	lui	a0,0xf8110
    13f8:	449000ef          	jal	2040 <dmasg_input_memory>
            // dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16); //RISC-V performs SW RGB2grayscale conversion
            dmasg_output_stream(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, DMASG_HW_ACCEL_MM2S_1_PORT, 0, 0, 1);
    13fc:	00100793          	li	a5,1
    1400:	00000713          	li	a4,0
    1404:	00000693          	li	a3,0
    1408:	00000613          	li	a2,0
    140c:	00400593          	li	a1,4
    1410:	f8110537          	lui	a0,0xf8110
    1414:	4b5000ef          	jal	20c8 <dmasg_output_stream>

            // SELECT dma transfer length - Make sure match with HW accelerator mode selection
            // Additonal data is required to be fed for line buffer(s) data flushing
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1418:	8281a783          	lw	a5,-2008(gp) # 4890 <select_demo_mode>
    141c:	00200713          	li	a4,2
    1420:	00e78663          	beq	a5,a4,142c <main+0x328>
    1424:	00400713          	li	a4,4
    1428:	18e79663          	bne	a5,a4,15b4 <main+0x4b0>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (FRAME_WIDTH + 1)) * 4, 0); // Sobel only
    142c:	00000693          	li	a3,0
    1430:	0011d637          	lui	a2,0x11d
    1434:	4b460613          	addi	a2,a2,1204 # 11d4b4 <__freertos_irq_stack_top+0x117c14>
    1438:	00400593          	li	a1,4
    143c:	f8110537          	lui	a0,0xf8110
    1440:	4b5000ef          	jal	20f4 <dmasg_direct_start>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
            }

            // Trigger HW accel S2MM DMA
            dmasg_input_stream(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, DMASG_HW_ACCEL_S2MM_PORT, 1, 0);
    1444:	00000713          	li	a4,0
    1448:	00100693          	li	a3,1
    144c:	00000613          	li	a2,0
    1450:	00300593          	li	a1,3
    1454:	f8110537          	lui	a0,0xf8110
    1458:	439000ef          	jal	2090 <dmasg_input_stream>
            dmasg_output_memory(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, SOBEL_START_ADDR, 16);
    145c:	01000693          	li	a3,16
    1460:	00900637          	lui	a2,0x900
    1464:	00300593          	li	a1,3
    1468:	f8110537          	lui	a0,0xf8110
    146c:	3fd000ef          	jal	2068 <dmasg_output_memory>
            dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    1470:	00000693          	li	a3,0
    1474:	0011d637          	lui	a2,0x11d
    1478:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1173a0>
    147c:	00300593          	li	a1,3
    1480:	f8110537          	lui	a0,0xf8110
    1484:	471000ef          	jal	20f4 <dmasg_direct_start>
    1488:	f81207b7          	lui	a5,0xf8120
    148c:	00100713          	li	a4,1
    1490:	00e7a423          	sw	a4,8(a5) # f8120008 <__freertos_irq_stack_top+0xf811a768>
    1494:	0007a423          	sw	zero,8(a5)
            // Indicate start of S2MM DMA to HW accel building block via APB3 slave
            write_u32(0x00000001, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);
            write_u32(0x00000000, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);

            // Wait for DMA transfer completion
            while (dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL) || dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL))
    1498:	00400593          	li	a1,4
    149c:	f8110537          	lui	a0,0xf8110
    14a0:	495000ef          	jal	2134 <dmasg_busy>
    14a4:	fe051ae3          	bnez	a0,1498 <main+0x394>
    14a8:	00300593          	li	a1,3
    14ac:	f8110537          	lui	a0,0xf8110
    14b0:	485000ef          	jal	2134 <dmasg_busy>
    14b4:	fe0512e3          	bnez	a0,1498 <main+0x394>
    14b8:	0000500f          	.word	0x0000500f
        if (select_demo_mode > 2)
    14bc:	8281a703          	lw	a4,-2008(gp) # 4890 <select_demo_mode>
    14c0:	00200793          	li	a5,2
    14c4:	eee7fce3          	bgeu	a5,a4,13bc <main+0x2b8>
    14c8:	f81007b7          	lui	a5,0xf8100
    14cc:	00100713          	li	a4,1
    14d0:	00e7a623          	sw	a4,12(a5) # f810000c <__freertos_irq_stack_top+0xf80fa76c>
        dmasg_input_stream(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, DMASG_CAM1_S2MM_PORT, 1, 0);
    14d4:	00000713          	li	a4,0
    14d8:	00100693          	li	a3,1
    14dc:	00000613          	li	a2,0
    14e0:	00000593          	li	a1,0
    14e4:	f8110537          	lui	a0,0xf8110
    14e8:	3a9000ef          	jal	2090 <dmasg_input_stream>
        dmasg_output_memory(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, CAM_START_ADDR, 16);
    14ec:	01000693          	li	a3,16
    14f0:	00100637          	lui	a2,0x100
    14f4:	00000593          	li	a1,0
    14f8:	f8110537          	lui	a0,0xf8110
    14fc:	36d000ef          	jal	2068 <dmasg_output_memory>
        dmasg_direct_start(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    1500:	00000693          	li	a3,0
    1504:	0011d637          	lui	a2,0x11d
    1508:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1173a0>
    150c:	00000593          	li	a1,0
    1510:	f8110537          	lui	a0,0xf8110
    1514:	3e1000ef          	jal	20f4 <dmasg_direct_start>
    1518:	f81007b7          	lui	a5,0xf8100
    151c:	00100713          	li	a4,1
    1520:	00e7a823          	sw	a4,16(a5) # f8100010 <__freertos_irq_stack_top+0xf80fa770>
    1524:	0007a823          	sw	zero,16(a5)
    1528:	f81007b7          	lui	a5,0xf8100
    152c:	00e7a423          	sw	a4,8(a5) # f8100008 <__freertos_irq_stack_top+0xf80fa768>
    1530:	0007a423          	sw	zero,8(a5)
        while (dmasg_busy(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL))
    1534:	00000593          	li	a1,0
    1538:	f8110537          	lui	a0,0xf8110
    153c:	3f9000ef          	jal	2134 <dmasg_busy>
    1540:	fe051ae3          	bnez	a0,1534 <main+0x430>
    1544:	0000500f          	.word	0x0000500f
        if (select_demo_mode == 1 || select_demo_mode == 2)
    1548:	8281a783          	lw	a5,-2008(gp) # 4890 <select_demo_mode>
    154c:	fff78793          	addi	a5,a5,-1
    1550:	00100713          	li	a4,1
    1554:	e6f77ae3          	bgeu	a4,a5,13c8 <main+0x2c4>
        if (select_demo_mode == 2 || select_demo_mode > 3)
    1558:	8281a783          	lw	a5,-2008(gp) # 4890 <select_demo_mode>
    155c:	00200713          	li	a4,2
    1560:	00e78663          	beq	a5,a4,156c <main+0x468>
    1564:	00300713          	li	a4,3
    1568:	f4f77ae3          	bgeu	a4,a5,14bc <main+0x3b8>
    156c:	f81207b7          	lui	a5,0xf8120
    1570:	00500713          	li	a4,5
    1574:	00e7a023          	sw	a4,0(a5) # f8120000 <__freertos_irq_stack_top+0xf811a760>
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1578:	8281a783          	lw	a5,-2008(gp) # 4890 <select_demo_mode>
    157c:	00200713          	li	a4,2
    1580:	e6e780e3          	beq	a5,a4,13e0 <main+0x2dc>
    1584:	00400713          	li	a4,4
    1588:	e4e78ce3          	beq	a5,a4,13e0 <main+0x2dc>
            else if (select_demo_mode == 5)
    158c:	00500713          	li	a4,5
    1590:	00e78a63          	beq	a5,a4,15a4 <main+0x4a0>
    1594:	f81207b7          	lui	a5,0xf8120
    1598:	00200713          	li	a4,2
    159c:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf811a764>
    }
    15a0:	e49ff06f          	j	13e8 <main+0x2e4>
        *((volatile u32*) address) = data;
    15a4:	f81207b7          	lui	a5,0xf8120
    15a8:	00100713          	li	a4,1
    15ac:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf811a764>
    }
    15b0:	e39ff06f          	j	13e8 <main+0x2e4>
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
    15b4:	00000693          	li	a3,0
    15b8:	0011e637          	lui	a2,0x11e
    15bc:	d2860613          	addi	a2,a2,-728 # 11dd28 <__freertos_irq_stack_top+0x118488>
    15c0:	00400593          	li	a1,4
    15c4:	f8110537          	lui	a0,0xf8110
    15c8:	32d000ef          	jal	20f4 <dmasg_direct_start>
    15cc:	e79ff06f          	j	1444 <main+0x340>

000015d0 <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    15d0:	00259593          	slli	a1,a1,0x2
    15d4:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    15d8:	00c5a023          	sw	a2,0(a1) # 500000 <__freertos_irq_stack_top+0x4fa760>
    }
    15dc:	00008067          	ret

000015e0 <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    15e0:	00759593          	slli	a1,a1,0x7
    15e4:	00a585b3          	add	a1,a1,a0
    15e8:	00565793          	srli	a5,a2,0x5
    15ec:	00279793          	slli	a5,a5,0x2
    15f0:	00f587b3          	add	a5,a1,a5
    15f4:	00002737          	lui	a4,0x2
    15f8:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
    15fc:	00100713          	li	a4,1
    1600:	00c71633          	sll	a2,a4,a2
        if (enable)
    1604:	00068a63          	beqz	a3,1618 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    1608:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
    160c:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
    1610:	00c7a023          	sw	a2,0(a5)
    }
    1614:	00008067          	ret
        return *((volatile u32*) address);
    1618:	0007a703          	lw	a4,0(a5)
        else
            write_u32(read_u32(word) & ~mask, word);
    161c:	fff64613          	not	a2,a2
    1620:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
    1624:	00c7a023          	sw	a2,0(a5)
    }
    1628:	00008067          	ret

0000162c <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
    162c:	00c59593          	slli	a1,a1,0xc
    1630:	00a585b3          	add	a1,a1,a0
    1634:	002007b7          	lui	a5,0x200
    1638:	00f585b3          	add	a1,a1,a5
    163c:	00c5a023          	sw	a2,0(a1)
    }
    1640:	00008067          	ret

00001644 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1644:	00452503          	lw	a0,4(a0) # f8110004 <__freertos_irq_stack_top+0xf810a764>
*          of available spaces for writing data from bits 23 to 16. It then
*          returns this value after masking with 0xFF.
*
******************************************************************************/
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1648:	01055513          	srli	a0,a0,0x10
    }
    164c:	0ff57513          	zext.b	a0,a0
    1650:	00008067          	ret

00001654 <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
    1654:	ff010113          	addi	sp,sp,-16
    1658:	00112623          	sw	ra,12(sp)
    165c:	00812423          	sw	s0,8(sp)
    1660:	00912223          	sw	s1,4(sp)
    1664:	00050413          	mv	s0,a0
    1668:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    166c:	00040513          	mv	a0,s0
    1670:	fd5ff0ef          	jal	1644 <uart_writeAvailability>
    1674:	fe050ce3          	beqz	a0,166c <uart_write+0x18>
        *((volatile u32*) address) = data;
    1678:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
    167c:	00c12083          	lw	ra,12(sp)
    1680:	00812403          	lw	s0,8(sp)
    1684:	00412483          	lw	s1,4(sp)
    1688:	01010113          	addi	sp,sp,16
    168c:	00008067          	ret

00001690 <_putchar>:
#include <math.h>
#include <string.h>
#include "bsp.h"

#if (ENABLE_BSP_PRINTF)
    static void _putchar(char character){
    1690:	ff010113          	addi	sp,sp,-16
    1694:	00112623          	sw	ra,12(sp)
    1698:	00050593          	mv	a1,a0
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
    169c:	f8010537          	lui	a0,0xf8010
    16a0:	fb5ff0ef          	jal	1654 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    16a4:	00c12083          	lw	ra,12(sp)
    16a8:	01010113          	addi	sp,sp,16
    16ac:	00008067          	ret

000016b0 <_putchar_s>:

    static void _putchar_s(char *p)
    {
    16b0:	ff010113          	addi	sp,sp,-16
    16b4:	00112623          	sw	ra,12(sp)
    16b8:	00812423          	sw	s0,8(sp)
    16bc:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
    16c0:	00c0006f          	j	16cc <_putchar_s+0x1c>
            _putchar(*(p++));
    16c4:	00140413          	addi	s0,s0,1
    16c8:	fc9ff0ef          	jal	1690 <_putchar>
        while (*p)
    16cc:	00044503          	lbu	a0,0(s0)
    16d0:	fe051ae3          	bnez	a0,16c4 <_putchar_s+0x14>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    16d4:	00c12083          	lw	ra,12(sp)
    16d8:	00812403          	lw	s0,8(sp)
    16dc:	01010113          	addi	sp,sp,16
    16e0:	00008067          	ret

000016e4 <bsp_printHex>:

        static void bsp_printHex(uint32_t val)
    {
    16e4:	ff010113          	addi	sp,sp,-16
    16e8:	00112623          	sw	ra,12(sp)
    16ec:	00812423          	sw	s0,8(sp)
    16f0:	00912223          	sw	s1,4(sp)
    16f4:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    16f8:	01c00413          	li	s0,28
    16fc:	0240006f          	j	1720 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    1700:	0084d733          	srl	a4,s1,s0
    1704:	00f77713          	andi	a4,a4,15
    1708:	000047b7          	lui	a5,0x4
    170c:	bd478793          	addi	a5,a5,-1068 # 3bd4 <_data>
    1710:	00e787b3          	add	a5,a5,a4
    1714:	0007c503          	lbu	a0,0(a5)
    1718:	f79ff0ef          	jal	1690 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    171c:	ffc40413          	addi	s0,s0,-4
    1720:	fe0450e3          	bgez	s0,1700 <bsp_printHex+0x1c>
        }
    }
    1724:	00c12083          	lw	ra,12(sp)
    1728:	00812403          	lw	s0,8(sp)
    172c:	00412483          	lw	s1,4(sp)
    1730:	01010113          	addi	sp,sp,16
    1734:	00008067          	ret

00001738 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
    {
    1738:	ff010113          	addi	sp,sp,-16
    173c:	00112623          	sw	ra,12(sp)
    1740:	00812423          	sw	s0,8(sp)
    1744:	00912223          	sw	s1,4(sp)
    1748:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    174c:	01c00413          	li	s0,28
    1750:	0240006f          	j	1774 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    1754:	0084d733          	srl	a4,s1,s0
    1758:	00f77713          	andi	a4,a4,15
    175c:	000047b7          	lui	a5,0x4
    1760:	be878793          	addi	a5,a5,-1048 # 3be8 <_data+0x14>
    1764:	00e787b3          	add	a5,a5,a4
    1768:	0007c503          	lbu	a0,0(a5)
    176c:	f25ff0ef          	jal	1690 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1770:	ffc40413          	addi	s0,s0,-4
    1774:	fe0450e3          	bgez	s0,1754 <bsp_printHex_lower+0x1c>

        }
    }
    1778:	00c12083          	lw	ra,12(sp)
    177c:	00812403          	lw	s0,8(sp)
    1780:	00412483          	lw	s1,4(sp)
    1784:	01010113          	addi	sp,sp,16
    1788:	00008067          	ret

0000178c <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
    178c:	ff010113          	addi	sp,sp,-16
    1790:	00112623          	sw	ra,12(sp)
        _putchar(c);
    1794:	0ff57513          	zext.b	a0,a0
    1798:	ef9ff0ef          	jal	1690 <_putchar>
    }
    179c:	00c12083          	lw	ra,12(sp)
    17a0:	01010113          	addi	sp,sp,16
    17a4:	00008067          	ret

000017a8 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
    17a8:	ff010113          	addi	sp,sp,-16
    17ac:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    17b0:	f01ff0ef          	jal	16b0 <_putchar_s>
    }
    17b4:	00c12083          	lw	ra,12(sp)
    17b8:	01010113          	addi	sp,sp,16
    17bc:	00008067          	ret

000017c0 <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
    17c0:	fd010113          	addi	sp,sp,-48
    17c4:	02112623          	sw	ra,44(sp)
    17c8:	02812423          	sw	s0,40(sp)
    17cc:	02912223          	sw	s1,36(sp)
    17d0:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
    17d4:	00054663          	bltz	a0,17e0 <bsp_printf_d+0x20>
    {
    17d8:	00010413          	mv	s0,sp
    17dc:	02c0006f          	j	1808 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    17e0:	02d00513          	li	a0,45
    17e4:	fa9ff0ef          	jal	178c <bsp_printf_c>
            val = -val;
    17e8:	409004b3          	neg	s1,s1
    17ec:	fedff06f          	j	17d8 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
    17f0:	00a00713          	li	a4,10
    17f4:	02e4e7b3          	rem	a5,s1,a4
    17f8:	03078793          	addi	a5,a5,48
    17fc:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    1800:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    1804:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    1808:	fe0494e3          	bnez	s1,17f0 <bsp_printf_d+0x30>
    180c:	00010793          	mv	a5,sp
    1810:	fef400e3          	beq	s0,a5,17f0 <bsp_printf_d+0x30>
        }
        while (p != buffer)
    1814:	00010793          	mv	a5,sp
    1818:	00f40a63          	beq	s0,a5,182c <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    181c:	fff40413          	addi	s0,s0,-1
    1820:	00044503          	lbu	a0,0(s0)
    1824:	f69ff0ef          	jal	178c <bsp_printf_c>
    1828:	fedff06f          	j	1814 <bsp_printf_d+0x54>
    }
    182c:	02c12083          	lw	ra,44(sp)
    1830:	02812403          	lw	s0,40(sp)
    1834:	02412483          	lw	s1,36(sp)
    1838:	03010113          	addi	sp,sp,48
    183c:	00008067          	ret

00001840 <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
    1840:	ff010113          	addi	sp,sp,-16
    1844:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
    1848:	00000713          	li	a4,0
    184c:	00700793          	li	a5,7
    1850:	02e7c063          	blt	a5,a4,1870 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1854:	00271693          	slli	a3,a4,0x2
    1858:	ff000793          	li	a5,-16
    185c:	00d797b3          	sll	a5,a5,a3
    1860:	00f577b3          	and	a5,a0,a5
    1864:	00078663          	beqz	a5,1870 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    1868:	00170713          	addi	a4,a4,1 # 2001 <plic_set_enable+0x45>
    186c:	fe1ff06f          	j	184c <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
    1870:	ec9ff0ef          	jal	1738 <bsp_printHex_lower>
    }
    1874:	00c12083          	lw	ra,12(sp)
    1878:	01010113          	addi	sp,sp,16
    187c:	00008067          	ret

00001880 <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
    1880:	ff010113          	addi	sp,sp,-16
    1884:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
    1888:	00000713          	li	a4,0
    188c:	00700793          	li	a5,7
    1890:	02e7c063          	blt	a5,a4,18b0 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1894:	00271693          	slli	a3,a4,0x2
    1898:	ff000793          	li	a5,-16
    189c:	00d797b3          	sll	a5,a5,a3
    18a0:	00f577b3          	and	a5,a0,a5
    18a4:	00078663          	beqz	a5,18b0 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    18a8:	00170713          	addi	a4,a4,1
    18ac:	fe1ff06f          	j	188c <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
    18b0:	e35ff0ef          	jal	16e4 <bsp_printHex>
        }
    18b4:	00c12083          	lw	ra,12(sp)
    18b8:	01010113          	addi	sp,sp,16
    18bc:	00008067          	ret

000018c0 <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
    18c0:	fc010113          	addi	sp,sp,-64
    18c4:	00112e23          	sw	ra,28(sp)
    18c8:	00812c23          	sw	s0,24(sp)
    18cc:	00912a23          	sw	s1,20(sp)
    18d0:	00050493          	mv	s1,a0
    18d4:	02b12223          	sw	a1,36(sp)
    18d8:	02c12423          	sw	a2,40(sp)
    18dc:	02d12623          	sw	a3,44(sp)
    18e0:	02e12823          	sw	a4,48(sp)
    18e4:	02f12a23          	sw	a5,52(sp)
    18e8:	03012c23          	sw	a6,56(sp)
    18ec:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
    18f0:	02410793          	addi	a5,sp,36
    18f4:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
    18f8:	00000413          	li	s0,0
    18fc:	01c0006f          	j	1918 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
    1900:	00c12783          	lw	a5,12(sp)
    1904:	00478713          	addi	a4,a5,4
    1908:	00e12623          	sw	a4,12(sp)
    190c:	0007a503          	lw	a0,0(a5)
    1910:	e7dff0ef          	jal	178c <bsp_printf_c>
        for (i = 0; format[i]; i++)
    1914:	00140413          	addi	s0,s0,1
    1918:	008487b3          	add	a5,s1,s0
    191c:	0007c503          	lbu	a0,0(a5)
    1920:	0a050e63          	beqz	a0,19dc <bsp_printf+0x11c>
            if (format[i] == '%') {
    1924:	02500793          	li	a5,37
    1928:	06f50e63          	beq	a0,a5,19a4 <bsp_printf+0xe4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
    192c:	e61ff0ef          	jal	178c <bsp_printf_c>
    1930:	fe5ff06f          	j	1914 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    1934:	00c12783          	lw	a5,12(sp)
    1938:	00478713          	addi	a4,a5,4
    193c:	00e12623          	sw	a4,12(sp)
    1940:	0007a503          	lw	a0,0(a5)
    1944:	e65ff0ef          	jal	17a8 <bsp_printf_s>
                        break;
    1948:	fcdff06f          	j	1914 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    194c:	00c12783          	lw	a5,12(sp)
    1950:	00478713          	addi	a4,a5,4
    1954:	00e12623          	sw	a4,12(sp)
    1958:	0007a503          	lw	a0,0(a5)
    195c:	e65ff0ef          	jal	17c0 <bsp_printf_d>
                        break;
    1960:	fb5ff06f          	j	1914 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    1964:	00c12783          	lw	a5,12(sp)
    1968:	00478713          	addi	a4,a5,4
    196c:	00e12623          	sw	a4,12(sp)
    1970:	0007a503          	lw	a0,0(a5)
    1974:	f0dff0ef          	jal	1880 <bsp_printf_X>
                        break;
    1978:	f9dff06f          	j	1914 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    197c:	00c12783          	lw	a5,12(sp)
    1980:	00478713          	addi	a4,a5,4
    1984:	00e12623          	sw	a4,12(sp)
    1988:	0007a503          	lw	a0,0(a5)
    198c:	eb5ff0ef          	jal	1840 <bsp_printf_x>
                        break;
    1990:	f85ff06f          	j	1914 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    1994:	00004537          	lui	a0,0x4
    1998:	bfc50513          	addi	a0,a0,-1028 # 3bfc <_data+0x28>
    199c:	e0dff0ef          	jal	17a8 <bsp_printf_s>
                        break;
    19a0:	f75ff06f          	j	1914 <bsp_printf+0x54>
                while (format[++i]) {
    19a4:	00140413          	addi	s0,s0,1
    19a8:	008487b3          	add	a5,s1,s0
    19ac:	0007c783          	lbu	a5,0(a5)
    19b0:	f60782e3          	beqz	a5,1914 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    19b4:	fa878793          	addi	a5,a5,-88
    19b8:	0ff7f693          	zext.b	a3,a5
    19bc:	02000713          	li	a4,32
    19c0:	fed762e3          	bltu	a4,a3,19a4 <bsp_printf+0xe4>
    19c4:	00269793          	slli	a5,a3,0x2
    19c8:	00004737          	lui	a4,0x4
    19cc:	17070713          	addi	a4,a4,368 # 4170 <_data+0x59c>
    19d0:	00e787b3          	add	a5,a5,a4
    19d4:	0007a783          	lw	a5,0(a5)
    19d8:	00078067          	jr	a5

        va_end(ap);
    }
    19dc:	01c12083          	lw	ra,28(sp)
    19e0:	01812403          	lw	s0,24(sp)
    19e4:	01412483          	lw	s1,20(sp)
    19e8:	04010113          	addi	sp,sp,64
    19ec:	00008067          	ret

000019f0 <crash>:
#include "uart.h"
#include "bsp.h"

// crash() and trap()
void crash()
{
    19f0:	ff010113          	addi	sp,sp,-16
    19f4:	00112623          	sw	ra,12(sp)
    bsp_printf("\n*** CRASH ***\n");
    19f8:	00004537          	lui	a0,0x4
    19fc:	c4850513          	addi	a0,a0,-952 # 3c48 <_data+0x74>
    1a00:	ec1ff0ef          	jal	18c0 <bsp_printf>
    while (1)
    1a04:	0000006f          	j	1a04 <crash+0x14>

00001a08 <dma_init>:
        ;
}

void dma_init()
{
    1a08:	ff010113          	addi	sp,sp,-16
    1a0c:	00112623          	sw	ra,12(sp)
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0);
    1a10:	00000613          	li	a2,0
    1a14:	00000593          	li	a1,0
    1a18:	f8c00537          	lui	a0,0xf8c00
    1a1c:	c11ff0ef          	jal	162c <plic_set_threshold>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, PLIC_DMASG_CHANNEL, 1);
    1a20:	00100693          	li	a3,1
    1a24:	00600613          	li	a2,6
    1a28:	00000593          	li	a1,0
    1a2c:	f8c00537          	lui	a0,0xf8c00
    1a30:	bb1ff0ef          	jal	15e0 <plic_set_enable>
    plic_set_priority(BSP_PLIC, PLIC_DMASG_CHANNEL, 1);
    1a34:	00100613          	li	a2,1
    1a38:	00600593          	li	a1,6
    1a3c:	f8c00537          	lui	a0,0xf8c00
    1a40:	b91ff0ef          	jal	15d0 <plic_set_priority>
    csr_write(mtvec, trap_entry);
    1a44:	000047b7          	lui	a5,0x4
    1a48:	b4478793          	addi	a5,a5,-1212 # 3b44 <trap_entry>
    1a4c:	30579073          	csrw	mtvec,a5
    csr_set(mie, MIE_MEIE);
    1a50:	000017b7          	lui	a5,0x1
    1a54:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM2+0x7a5>
    1a58:	3047a073          	csrs	mie,a5
    csr_write(mstatus, csr_read(mstatus) | MSTATUS_MPP | MSTATUS_MIE);
    1a5c:	300027f3          	csrr	a5,mstatus
    1a60:	00002737          	lui	a4,0x2
    1a64:	80870713          	addi	a4,a4,-2040 # 1808 <bsp_printf_d+0x48>
    1a68:	00e7e7b3          	or	a5,a5,a4
    1a6c:	30079073          	csrw	mstatus,a5
}
    1a70:	00c12083          	lw	ra,12(sp)
    1a74:	01010113          	addi	sp,sp,16
    1a78:	00008067          	ret

00001a7c <trap>:

// defined in main.c
extern void externalInterrupt();

void trap()
{
    1a7c:	ff010113          	addi	sp,sp,-16
    1a80:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
    1a84:	342027f3          	csrr	a5,mcause
    int32_t interrupt = mcause < 0;
    int32_t cause = mcause & 0xF;
    if (interrupt)
    1a88:	0207d263          	bgez	a5,1aac <trap+0x30>
    1a8c:	00f7f713          	andi	a4,a5,15
    {
        switch (cause)
    1a90:	00b00793          	li	a5,11
    1a94:	00f71a63          	bne	a4,a5,1aa8 <trap+0x2c>
        {
        case CAUSE_MACHINE_EXTERNAL:
            externalInterrupt();
    1a98:	2e1000ef          	jal	2578 <externalInterrupt>
    }
    else
    {
        crash();
    }
    1a9c:	00c12083          	lw	ra,12(sp)
    1aa0:	01010113          	addi	sp,sp,16
    1aa4:	00008067          	ret
            crash();
    1aa8:	f49ff0ef          	jal	19f0 <crash>
        crash();
    1aac:	f45ff0ef          	jal	19f0 <crash>

00001ab0 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1ab0:	00452503          	lw	a0,4(a0) # f8c00004 <__freertos_irq_stack_top+0xf8bfa764>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1ab4:	01055513          	srli	a0,a0,0x10
    }
    1ab8:	0ff57513          	zext.b	a0,a0
    1abc:	00008067          	ret

00001ac0 <uart_write>:
    static void uart_write(u32 reg, char data){
    1ac0:	ff010113          	addi	sp,sp,-16
    1ac4:	00112623          	sw	ra,12(sp)
    1ac8:	00812423          	sw	s0,8(sp)
    1acc:	00912223          	sw	s1,4(sp)
    1ad0:	00050413          	mv	s0,a0
    1ad4:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1ad8:	00040513          	mv	a0,s0
    1adc:	fd5ff0ef          	jal	1ab0 <uart_writeAvailability>
    1ae0:	fe050ce3          	beqz	a0,1ad8 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1ae4:	00942023          	sw	s1,0(s0)
    }
    1ae8:	00c12083          	lw	ra,12(sp)
    1aec:	00812403          	lw	s0,8(sp)
    1af0:	00412483          	lw	s1,4(sp)
    1af4:	01010113          	addi	sp,sp,16
    1af8:	00008067          	ret

00001afc <uart_writeStr>:
*
* @note    The function iterates through each character of the string and writes
*          them one by one to the UART buffer using the uart_write function.
*
******************************************************************************/
    static void uart_writeStr(u32 reg, const char* str){
    1afc:	ff010113          	addi	sp,sp,-16
    1b00:	00112623          	sw	ra,12(sp)
    1b04:	00812423          	sw	s0,8(sp)
    1b08:	00912223          	sw	s1,4(sp)
    1b0c:	00050493          	mv	s1,a0
    1b10:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    1b14:	0100006f          	j	1b24 <uart_writeStr+0x28>
    1b18:	00140413          	addi	s0,s0,1
    1b1c:	00048513          	mv	a0,s1
    1b20:	fa1ff0ef          	jal	1ac0 <uart_write>
    1b24:	00044583          	lbu	a1,0(s0)
    1b28:	fe0598e3          	bnez	a1,1b18 <uart_writeStr+0x1c>
    }
    1b2c:	00c12083          	lw	ra,12(sp)
    1b30:	00812403          	lw	s0,8(sp)
    1b34:	00412483          	lw	s1,4(sp)
    1b38:	01010113          	addi	sp,sp,16
    1b3c:	00008067          	ret

00001b40 <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
    1b40:	000f47b7          	lui	a5,0xf4
    1b44:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xee9a0>
    1b48:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1b4c:	0000c7b7          	lui	a5,0xc
    1b50:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x6758>
    1b54:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1b58:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1b5c:	02a585b3          	mul	a1,a1,a0
    1b60:	00f58733          	add	a4,a1,a5
    1b64:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    1b68:	40f707b3          	sub	a5,a4,a5
    1b6c:	fe07dce3          	bgez	a5,1b64 <clint_uDelay+0x24>
    1b70:	00008067          	ret

00001b74 <i2c_applyConfig>:
*
* @return       None.
*
******************************************************************************/
    static void i2c_applyConfig(u32 reg, I2c_Config *config){
        write_u32(config->samplingClockDivider, reg + I2C_SAMPLING_CLOCK_DIVIDER);
    1b74:	0005a783          	lw	a5,0(a1)
        *((volatile u32*) address) = data;
    1b78:	02f52423          	sw	a5,40(a0)
        write_u32(config->timeout, reg + I2C_TIMEOUT);
    1b7c:	0045a783          	lw	a5,4(a1)
    1b80:	02f52623          	sw	a5,44(a0)
        write_u32(config->tsuDat, reg + I2C_TSUDAT);
    1b84:	0085a783          	lw	a5,8(a1)
    1b88:	02f52823          	sw	a5,48(a0)
        write_u32(config->tLow, reg + I2C_TLOW);
    1b8c:	00c5a783          	lw	a5,12(a1)
    1b90:	04f52823          	sw	a5,80(a0)
        write_u32(config->tHigh, reg + I2C_THIGH);
    1b94:	0105a783          	lw	a5,16(a1)
    1b98:	04f52a23          	sw	a5,84(a0)
        write_u32(config->tBuf, reg + I2C_TBUF);
    1b9c:	0145a783          	lw	a5,20(a1)
    1ba0:	04f52c23          	sw	a5,88(a0)
    }
    1ba4:	00008067          	ret

00001ba8 <assert>:
	return data;
}

void assert(int cond)
{
	if (!cond)
    1ba8:	00050463          	beqz	a0,1bb0 <assert+0x8>
    1bac:	00008067          	ret
{
    1bb0:	ff010113          	addi	sp,sp,-16
    1bb4:	00112623          	sw	ra,12(sp)
	{
		uart_writeStr(BSP_UART_TERMINAL, "Assert failure\n");
    1bb8:	000045b7          	lui	a1,0x4
    1bbc:	c5858593          	addi	a1,a1,-936 # 3c58 <_data+0x84>
    1bc0:	f8010537          	lui	a0,0xf8010
    1bc4:	f39ff0ef          	jal	1afc <uart_writeStr>
		while (1)
    1bc8:	0000006f          	j	1bc8 <assert+0x20>

00001bcc <msDelay>:
		}
	}
}

void msDelay(u32 ms)
{
    1bcc:	ff010113          	addi	sp,sp,-16
    1bd0:	00112623          	sw	ra,12(sp)
	bsp_uDelay(ms * 1000);
    1bd4:	f8b00637          	lui	a2,0xf8b00
    1bd8:	05f5e5b7          	lui	a1,0x5f5e
    1bdc:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f58860>
    1be0:	3e800793          	li	a5,1000
    1be4:	02f50533          	mul	a0,a0,a5
    1be8:	f59ff0ef          	jal	1b40 <clint_uDelay>
}
    1bec:	00c12083          	lw	ra,12(sp)
    1bf0:	01010113          	addi	sp,sp,16
    1bf4:	00008067          	ret

00001bf8 <mipi_i2c_init>:
		}
	}
}

void mipi_i2c_init(u32 i2cCtrl)
{
    1bf8:	fd010113          	addi	sp,sp,-48
    1bfc:	02112623          	sw	ra,44(sp)
	// I2C init
	I2c_Config i2c_mipi;
	i2c_mipi.samplingClockDivider = 3;
    1c00:	00300793          	li	a5,3
    1c04:	00f12423          	sw	a5,8(sp)
	i2c_mipi.timeout = I2C_CTRL_HZ / 1000;
    1c08:	000187b7          	lui	a5,0x18
    1c0c:	6a078793          	addi	a5,a5,1696 # 186a0 <__freertos_irq_stack_top+0x12e00>
    1c10:	00f12623          	sw	a5,12(sp)
	i2c_mipi.tsuDat = I2C_CTRL_HZ / 2000000;
    1c14:	03200793          	li	a5,50
    1c18:	00f12823          	sw	a5,16(sp)

	i2c_mipi.tLow = I2C_CTRL_HZ / 800000;
    1c1c:	07d00793          	li	a5,125
    1c20:	00f12a23          	sw	a5,20(sp)
	i2c_mipi.tHigh = I2C_CTRL_HZ / 800000;
    1c24:	00f12c23          	sw	a5,24(sp)
	i2c_mipi.tBuf = I2C_CTRL_HZ / 400000;
    1c28:	0fa00793          	li	a5,250
    1c2c:	00f12e23          	sw	a5,28(sp)

	i2c_applyConfig(i2cCtrl, &i2c_mipi);
    1c30:	00810593          	addi	a1,sp,8
    1c34:	f41ff0ef          	jal	1b74 <i2c_applyConfig>
}
    1c38:	02c12083          	lw	ra,44(sp)
    1c3c:	03010113          	addi	sp,sp,48
    1c40:	00008067          	ret

00001c44 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1c44:	00452503          	lw	a0,4(a0) # f8010004 <__freertos_irq_stack_top+0xf800a764>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1c48:	01055513          	srli	a0,a0,0x10
    }
    1c4c:	0ff57513          	zext.b	a0,a0
    1c50:	00008067          	ret

00001c54 <uart_readOccupancy>:
    1c54:	00452503          	lw	a0,4(a0)
    }
    1c58:	01855513          	srli	a0,a0,0x18
    1c5c:	00008067          	ret

00001c60 <uart_write>:
    static void uart_write(u32 reg, char data){
    1c60:	ff010113          	addi	sp,sp,-16
    1c64:	00112623          	sw	ra,12(sp)
    1c68:	00812423          	sw	s0,8(sp)
    1c6c:	00912223          	sw	s1,4(sp)
    1c70:	00050413          	mv	s0,a0
    1c74:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1c78:	00040513          	mv	a0,s0
    1c7c:	fc9ff0ef          	jal	1c44 <uart_writeAvailability>
    1c80:	fe050ce3          	beqz	a0,1c78 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1c84:	00942023          	sw	s1,0(s0)
    }
    1c88:	00c12083          	lw	ra,12(sp)
    1c8c:	00812403          	lw	s0,8(sp)
    1c90:	00412483          	lw	s1,4(sp)
    1c94:	01010113          	addi	sp,sp,16
    1c98:	00008067          	ret

00001c9c <uart_read>:
* @note    The function waits until there is data available in the UART buffer
*          for reading. Once data is available, it reads the character data from
*          the UART data register and returns it.
*
******************************************************************************/
    static char uart_read(u32 reg){
    1c9c:	ff010113          	addi	sp,sp,-16
    1ca0:	00112623          	sw	ra,12(sp)
    1ca4:	00812423          	sw	s0,8(sp)
    1ca8:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
    1cac:	00040513          	mv	a0,s0
    1cb0:	fa5ff0ef          	jal	1c54 <uart_readOccupancy>
    1cb4:	fe050ce3          	beqz	a0,1cac <uart_read+0x10>
        return *((volatile u32*) address);
    1cb8:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
    1cbc:	0ff57513          	zext.b	a0,a0
    1cc0:	00c12083          	lw	ra,12(sp)
    1cc4:	00812403          	lw	s0,8(sp)
    1cc8:	01010113          	addi	sp,sp,16
    1ccc:	00008067          	ret

00001cd0 <uart_applyConfig>:
*          value using data length, parity, and stop bit settings from the configuration
*          structure, and writes this value to the UART frame configuration register.
*
******************************************************************************/
    static void uart_applyConfig(u32 reg, Uart_Config *config){
        write_u32(config->clockDivider, reg + UART_CLOCK_DIVIDER);
    1cd0:	00c5a783          	lw	a5,12(a1)
        *((volatile u32*) address) = data;
    1cd4:	00f52423          	sw	a5,8(a0)
        write_u32(((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16), reg + UART_FRAME_CONFIG);
    1cd8:	0005a783          	lw	a5,0(a1)
    1cdc:	fff78793          	addi	a5,a5,-1
    1ce0:	0045a703          	lw	a4,4(a1)
    1ce4:	00871713          	slli	a4,a4,0x8
    1ce8:	00e7e7b3          	or	a5,a5,a4
    1cec:	0085a703          	lw	a4,8(a1)
    1cf0:	01071713          	slli	a4,a4,0x10
    1cf4:	00e7e7b3          	or	a5,a5,a4
    1cf8:	00f52623          	sw	a5,12(a0)
    }
    1cfc:	00008067          	ret

00001d00 <uart_status_read>:
        return *((volatile u32*) address);
    1d00:	00452503          	lw	a0,4(a0)
*
******************************************************************************/    
    static u32 uart_status_read(u32 reg)
     {
    	 return read_u32(reg+UART_STATUS);
     }
    1d04:	00008067          	ret

00001d08 <uart_status_write>:
        *((volatile u32*) address) = data;
    1d08:	00b52223          	sw	a1,4(a0)
*
******************************************************************************/
    static void uart_status_write(u32 reg, char data)
    {
    	write_u32(data ,reg+UART_STATUS);
    }
    1d0c:	00008067          	ret

00001d10 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
    1d10:	000f47b7          	lui	a5,0xf4
    1d14:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xee9a0>
    1d18:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1d1c:	0000c7b7          	lui	a5,0xc
    1d20:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x6758>
    1d24:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1d28:	00062783          	lw	a5,0(a2) # f8b00000 <__freertos_irq_stack_top+0xf8afa760>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1d2c:	02a585b3          	mul	a1,a1,a0
    1d30:	00f58733          	add	a4,a1,a5
    1d34:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    1d38:	40f707b3          	sub	a5,a4,a5
    1d3c:	fe07dce3          	bgez	a5,1d34 <clint_uDelay+0x24>
    1d40:	00008067          	ret

00001d44 <_putchar>:
    static void _putchar(char character){
    1d44:	ff010113          	addi	sp,sp,-16
    1d48:	00112623          	sw	ra,12(sp)
    1d4c:	00050593          	mv	a1,a0
            bsp_putChar(character);
    1d50:	f8010537          	lui	a0,0xf8010
    1d54:	f0dff0ef          	jal	1c60 <uart_write>
    }
    1d58:	00c12083          	lw	ra,12(sp)
    1d5c:	01010113          	addi	sp,sp,16
    1d60:	00008067          	ret

00001d64 <_putchar_s>:
    {
    1d64:	ff010113          	addi	sp,sp,-16
    1d68:	00112623          	sw	ra,12(sp)
    1d6c:	00812423          	sw	s0,8(sp)
    1d70:	00050413          	mv	s0,a0
        while (*p)
    1d74:	00c0006f          	j	1d80 <_putchar_s+0x1c>
            _putchar(*(p++));
    1d78:	00140413          	addi	s0,s0,1
    1d7c:	fc9ff0ef          	jal	1d44 <_putchar>
        while (*p)
    1d80:	00044503          	lbu	a0,0(s0)
    1d84:	fe051ae3          	bnez	a0,1d78 <_putchar_s+0x14>
    }
    1d88:	00c12083          	lw	ra,12(sp)
    1d8c:	00812403          	lw	s0,8(sp)
    1d90:	01010113          	addi	sp,sp,16
    1d94:	00008067          	ret

00001d98 <bsp_printHex>:
    {
    1d98:	ff010113          	addi	sp,sp,-16
    1d9c:	00112623          	sw	ra,12(sp)
    1da0:	00812423          	sw	s0,8(sp)
    1da4:	00912223          	sw	s1,4(sp)
    1da8:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1dac:	01c00413          	li	s0,28
    1db0:	0240006f          	j	1dd4 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    1db4:	0084d733          	srl	a4,s1,s0
    1db8:	00f77713          	andi	a4,a4,15
    1dbc:	000047b7          	lui	a5,0x4
    1dc0:	bd478793          	addi	a5,a5,-1068 # 3bd4 <_data>
    1dc4:	00e787b3          	add	a5,a5,a4
    1dc8:	0007c503          	lbu	a0,0(a5)
    1dcc:	f79ff0ef          	jal	1d44 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1dd0:	ffc40413          	addi	s0,s0,-4
    1dd4:	fe0450e3          	bgez	s0,1db4 <bsp_printHex+0x1c>
    }
    1dd8:	00c12083          	lw	ra,12(sp)
    1ddc:	00812403          	lw	s0,8(sp)
    1de0:	00412483          	lw	s1,4(sp)
    1de4:	01010113          	addi	sp,sp,16
    1de8:	00008067          	ret

00001dec <bsp_printHex_lower>:
    {
    1dec:	ff010113          	addi	sp,sp,-16
    1df0:	00112623          	sw	ra,12(sp)
    1df4:	00812423          	sw	s0,8(sp)
    1df8:	00912223          	sw	s1,4(sp)
    1dfc:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1e00:	01c00413          	li	s0,28
    1e04:	0240006f          	j	1e28 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    1e08:	0084d733          	srl	a4,s1,s0
    1e0c:	00f77713          	andi	a4,a4,15
    1e10:	000047b7          	lui	a5,0x4
    1e14:	be878793          	addi	a5,a5,-1048 # 3be8 <_data+0x14>
    1e18:	00e787b3          	add	a5,a5,a4
    1e1c:	0007c503          	lbu	a0,0(a5)
    1e20:	f25ff0ef          	jal	1d44 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1e24:	ffc40413          	addi	s0,s0,-4
    1e28:	fe0450e3          	bgez	s0,1e08 <bsp_printHex_lower+0x1c>
    }
    1e2c:	00c12083          	lw	ra,12(sp)
    1e30:	00812403          	lw	s0,8(sp)
    1e34:	00412483          	lw	s1,4(sp)
    1e38:	01010113          	addi	sp,sp,16
    1e3c:	00008067          	ret

00001e40 <bsp_printf_c>:
    {
    1e40:	ff010113          	addi	sp,sp,-16
    1e44:	00112623          	sw	ra,12(sp)
        _putchar(c);
    1e48:	0ff57513          	zext.b	a0,a0
    1e4c:	ef9ff0ef          	jal	1d44 <_putchar>
    }
    1e50:	00c12083          	lw	ra,12(sp)
    1e54:	01010113          	addi	sp,sp,16
    1e58:	00008067          	ret

00001e5c <bsp_printf_s>:
    {
    1e5c:	ff010113          	addi	sp,sp,-16
    1e60:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    1e64:	f01ff0ef          	jal	1d64 <_putchar_s>
    }
    1e68:	00c12083          	lw	ra,12(sp)
    1e6c:	01010113          	addi	sp,sp,16
    1e70:	00008067          	ret

00001e74 <bsp_printf_d>:
    {
    1e74:	fd010113          	addi	sp,sp,-48
    1e78:	02112623          	sw	ra,44(sp)
    1e7c:	02812423          	sw	s0,40(sp)
    1e80:	02912223          	sw	s1,36(sp)
    1e84:	00050493          	mv	s1,a0
        if (val < 0) {
    1e88:	00054663          	bltz	a0,1e94 <bsp_printf_d+0x20>
    {
    1e8c:	00010413          	mv	s0,sp
    1e90:	02c0006f          	j	1ebc <bsp_printf_d+0x48>
            bsp_printf_c('-');
    1e94:	02d00513          	li	a0,45
    1e98:	fa9ff0ef          	jal	1e40 <bsp_printf_c>
            val = -val;
    1e9c:	409004b3          	neg	s1,s1
    1ea0:	fedff06f          	j	1e8c <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    1ea4:	00a00713          	li	a4,10
    1ea8:	02e4e7b3          	rem	a5,s1,a4
    1eac:	03078793          	addi	a5,a5,48
    1eb0:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    1eb4:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    1eb8:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    1ebc:	fe0494e3          	bnez	s1,1ea4 <bsp_printf_d+0x30>
    1ec0:	00010793          	mv	a5,sp
    1ec4:	fef400e3          	beq	s0,a5,1ea4 <bsp_printf_d+0x30>
        while (p != buffer)
    1ec8:	00010793          	mv	a5,sp
    1ecc:	00f40a63          	beq	s0,a5,1ee0 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    1ed0:	fff40413          	addi	s0,s0,-1
    1ed4:	00044503          	lbu	a0,0(s0)
    1ed8:	f69ff0ef          	jal	1e40 <bsp_printf_c>
    1edc:	fedff06f          	j	1ec8 <bsp_printf_d+0x54>
    }
    1ee0:	02c12083          	lw	ra,44(sp)
    1ee4:	02812403          	lw	s0,40(sp)
    1ee8:	02412483          	lw	s1,36(sp)
    1eec:	03010113          	addi	sp,sp,48
    1ef0:	00008067          	ret

00001ef4 <bsp_printf_x>:
    {
    1ef4:	ff010113          	addi	sp,sp,-16
    1ef8:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    1efc:	00000713          	li	a4,0
    1f00:	00700793          	li	a5,7
    1f04:	02e7c063          	blt	a5,a4,1f24 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1f08:	00271693          	slli	a3,a4,0x2
    1f0c:	ff000793          	li	a5,-16
    1f10:	00d797b3          	sll	a5,a5,a3
    1f14:	00f577b3          	and	a5,a0,a5
    1f18:	00078663          	beqz	a5,1f24 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    1f1c:	00170713          	addi	a4,a4,1
    1f20:	fe1ff06f          	j	1f00 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    1f24:	ec9ff0ef          	jal	1dec <bsp_printHex_lower>
    }
    1f28:	00c12083          	lw	ra,12(sp)
    1f2c:	01010113          	addi	sp,sp,16
    1f30:	00008067          	ret

00001f34 <bsp_printf_X>:
        {
    1f34:	ff010113          	addi	sp,sp,-16
    1f38:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    1f3c:	00000713          	li	a4,0
    1f40:	00700793          	li	a5,7
    1f44:	02e7c063          	blt	a5,a4,1f64 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1f48:	00271693          	slli	a3,a4,0x2
    1f4c:	ff000793          	li	a5,-16
    1f50:	00d797b3          	sll	a5,a5,a3
    1f54:	00f577b3          	and	a5,a0,a5
    1f58:	00078663          	beqz	a5,1f64 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    1f5c:	00170713          	addi	a4,a4,1
    1f60:	fe1ff06f          	j	1f40 <bsp_printf_X+0xc>
            bsp_printHex(val);
    1f64:	e35ff0ef          	jal	1d98 <bsp_printHex>
        }
    1f68:	00c12083          	lw	ra,12(sp)
    1f6c:	01010113          	addi	sp,sp,16
    1f70:	00008067          	ret

00001f74 <bsp_init>:
    *   1. UART baudrate
    *   2. 
    */
////////////////////////////////////////////////////////////////////////////////
    static void bsp_init()
    {
    1f74:	fe010113          	addi	sp,sp,-32
    1f78:	00112e23          	sw	ra,28(sp)
        Uart_Config uartConfig;
        uartConfig.dataLength   = BITS_8;
    1f7c:	00800793          	li	a5,8
    1f80:	00f12023          	sw	a5,0(sp)
        uartConfig.parity       = NONE;
    1f84:	00012223          	sw	zero,4(sp)
        uartConfig.stop         = ONE;
    1f88:	00012423          	sw	zero,8(sp)
        uartConfig.clockDivider = BSP_CLINT_HZ/(BSP_UART_BAUDRATE*BSP_UART_DATA_LEN)-1;
    1f8c:	06b00793          	li	a5,107
    1f90:	00f12623          	sw	a5,12(sp)
        uart_applyConfig(BSP_UART_TERMINAL, &uartConfig);    
    1f94:	00010593          	mv	a1,sp
    1f98:	f8010537          	lui	a0,0xf8010
    1f9c:	d35ff0ef          	jal	1cd0 <uart_applyConfig>
    }
    1fa0:	01c12083          	lw	ra,28(sp)
    1fa4:	02010113          	addi	sp,sp,32
    1fa8:	00008067          	ret

00001fac <plic_set_priority>:
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    1fac:	00259593          	slli	a1,a1,0x2
    1fb0:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    1fb4:	00c5a023          	sw	a2,0(a1)
    }
    1fb8:	00008067          	ret

00001fbc <plic_set_enable>:
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    1fbc:	00759593          	slli	a1,a1,0x7
    1fc0:	00a585b3          	add	a1,a1,a0
    1fc4:	00565793          	srli	a5,a2,0x5
    1fc8:	00279793          	slli	a5,a5,0x2
    1fcc:	00f587b3          	add	a5,a1,a5
    1fd0:	00002737          	lui	a4,0x2
    1fd4:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
    1fd8:	00100713          	li	a4,1
    1fdc:	00c71633          	sll	a2,a4,a2
        if (enable)
    1fe0:	00068a63          	beqz	a3,1ff4 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    1fe4:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
    1fe8:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
    1fec:	00c7a023          	sw	a2,0(a5)
    }
    1ff0:	00008067          	ret
        return *((volatile u32*) address);
    1ff4:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) & ~mask, word);
    1ff8:	fff64613          	not	a2,a2
    1ffc:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
    2000:	00c7a023          	sw	a2,0(a5)
    }
    2004:	00008067          	ret

00002008 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    2008:	00c59593          	slli	a1,a1,0xc
    200c:	00a585b3          	add	a1,a1,a0
    2010:	002007b7          	lui	a5,0x200
    2014:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1fa764>
    2018:	00f585b3          	add	a1,a1,a5
        return *((volatile u32*) address);
    201c:	0005a503          	lw	a0,0(a1)
    }
    2020:	00008067          	ret

00002024 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    2024:	00c59593          	slli	a1,a1,0xc
    2028:	00a585b3          	add	a1,a1,a0
    202c:	002007b7          	lui	a5,0x200
    2030:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1fa764>
    2034:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
    2038:	00c5a023          	sw	a2,0(a1)
    }
    203c:	00008067          	ret

00002040 <dmasg_input_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_input_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2040:	00759593          	slli	a1,a1,0x7
    2044:	00a58533          	add	a0,a1,a0
    2048:	00c52023          	sw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf800a760>
        write_u32(address, ca + DMASG_CHANNEL_INPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_INPUT_CONFIG);
    204c:	fff68693          	addi	a3,a3,-1 # feffff <__freertos_irq_stack_top+0xfea75f>
    2050:	000017b7          	lui	a5,0x1
    2054:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2058:	00e6f6b3          	and	a3,a3,a4
    205c:	00f6e6b3          	or	a3,a3,a5
    2060:	00d52623          	sw	a3,12(a0)
    }
    2064:	00008067          	ret

00002068 <dmasg_output_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_output_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2068:	00759593          	slli	a1,a1,0x7
    206c:	00a58533          	add	a0,a1,a0
    2070:	00c52823          	sw	a2,16(a0)
        write_u32(address, ca + DMASG_CHANNEL_OUTPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    2074:	fff68693          	addi	a3,a3,-1
    2078:	000017b7          	lui	a5,0x1
    207c:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2080:	00e6f6b3          	and	a3,a3,a4
    2084:	00f6e6b3          	or	a3,a3,a5
    2088:	00d52e23          	sw	a3,28(a0)
    }
    208c:	00008067          	ret

00002090 <dmasg_input_stream>:
*                              contain one packet and force its completion when fully transferred 
*                              into memory.
*
*******************************************************************************/   
    static void dmasg_input_stream(u32 base, u32 channel, u32 port, u32 wait_on_packet, u32 completion_on_packet){
        u32 ca = dmasg_ca(base, channel);
    2090:	00759593          	slli	a1,a1,0x7
    2094:	00a58533          	add	a0,a1,a0
    2098:	00c52423          	sw	a2,8(a0)
        write_u32(port << 0, ca + DMASG_CHANNEL_INPUT_STREAM);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    209c:	00070e63          	beqz	a4,20b8 <dmasg_input_stream+0x28>
    20a0:	000027b7          	lui	a5,0x2
    20a4:	00068e63          	beqz	a3,20c0 <dmasg_input_stream+0x30>
    20a8:	00004737          	lui	a4,0x4
    20ac:	00e7e7b3          	or	a5,a5,a4
    20b0:	00f52623          	sw	a5,12(a0)
    }
    20b4:	00008067          	ret
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    20b8:	00000793          	li	a5,0
    20bc:	fe9ff06f          	j	20a4 <dmasg_input_stream+0x14>
    20c0:	00000713          	li	a4,0
    20c4:	fe9ff06f          	j	20ac <dmasg_input_stream+0x1c>

000020c8 <dmasg_output_stream>:
* @param last: Specifies if an end of packet should be sent at the end of the transfer
*              (only for direct DMA control, not linked list)
*
*******************************************************************************/
    static void dmasg_output_stream(u32 base, u32 channel, u32 port, u32 source, u32 sink, u32 last){
        u32 ca = dmasg_ca(base, channel);
    20c8:	00759593          	slli	a1,a1,0x7
    20cc:	00a58533          	add	a0,a1,a0
        write_u32(port << 0 | source << 8 | sink << 16, ca + DMASG_CHANNEL_OUTPUT_STREAM);
    20d0:	00869693          	slli	a3,a3,0x8
    20d4:	00c6e6b3          	or	a3,a3,a2
    20d8:	01071713          	slli	a4,a4,0x10
    20dc:	00e6e6b3          	or	a3,a3,a4
    20e0:	00d52c23          	sw	a3,24(a0)
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_STREAM | (last ? DMASG_CHANNEL_OUTPUT_CONFIG_LAST : 0), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    20e4:	00078463          	beqz	a5,20ec <dmasg_output_stream+0x24>
    20e8:	000027b7          	lui	a5,0x2
    20ec:	00f52e23          	sw	a5,28(a0)
    }
    20f0:	00008067          	ret

000020f4 <dmasg_direct_start>:
*                      The DESCRIPTOR_COMPLETION_HALF interrupt can be usefull 
*                      in that mode.
*
*******************************************************************************/
    static void dmasg_direct_start(u32 base, u32 channel, u32 bytes, u32 self_restart){
        u32 ca = dmasg_ca(base, channel);
    20f4:	00759593          	slli	a1,a1,0x7
    20f8:	00a58533          	add	a0,a1,a0
        write_u32(bytes-1, ca + DMASG_CHANNEL_DIRECT_BYTES);
    20fc:	fff60613          	addi	a2,a2,-1
    2100:	02c52023          	sw	a2,32(a0)
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2104:	00068863          	beqz	a3,2114 <dmasg_direct_start+0x20>
    2108:	00300793          	li	a5,3
    210c:	02f52623          	sw	a5,44(a0)
    }
    2110:	00008067          	ret
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2114:	00100793          	li	a5,1
    2118:	ff5ff06f          	j	210c <dmasg_direct_start+0x18>

0000211c <dmasg_interrupt_config>:
*       This function clear all pending interrupts for the given channel 
*       before enabling the mask's interrupts.
*
*******************************************************************************/
    static void dmasg_interrupt_config(u32 base, u32 channel, u32 mask){
        u32 ca = dmasg_ca(base, channel);
    211c:	00759593          	slli	a1,a1,0x7
    2120:	00a58533          	add	a0,a1,a0
    2124:	fff00793          	li	a5,-1
    2128:	04f52a23          	sw	a5,84(a0)
    212c:	04c52823          	sw	a2,80(a0)
        write_u32(0xFFFFFFFF, ca+DMASG_CHANNEL_INTERRUPT_PENDING);
        write_u32(mask, ca+DMASG_CHANNEL_INTERRUPT_ENABLE);
    }
    2130:	00008067          	ret

00002134 <dmasg_busy>:
*
* @return 1 if the channel is busy, 0 otherwise
*
*******************************************************************************/
    static u32 dmasg_busy(u32 base, u32 channel){
        u32 ca = dmasg_ca(base, channel);
    2134:	00759593          	slli	a1,a1,0x7
    2138:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
    213c:	02c5a503          	lw	a0,44(a1)
        return read_u32(ca + DMASG_CHANNEL_STATUS) & DMASG_CHANNEL_STATUS_BUSY;
    }
    2140:	00157513          	andi	a0,a0,1
    2144:	00008067          	ret

00002148 <dmasg_priority>:
* @param priority: Priority of the channel
* @param weight: Weight of the channel
*
*******************************************************************************/  
    static void dmasg_priority(u32 base, u32 channel, u32 priority, u32 weight){
        u32 ca = dmasg_ca(base, channel);
    2148:	00759593          	slli	a1,a1,0x7
    214c:	00a585b3          	add	a1,a1,a0
        write_u32(priority| weight << 8,  ca+DMASG_CHANNEL_PRIORITY);
    2150:	00869693          	slli	a3,a3,0x8
    2154:	00c6e6b3          	or	a3,a3,a2
        *((volatile u32*) address) = data;
    2158:	04d5a223          	sw	a3,68(a1)
    }
    215c:	00008067          	ret

00002160 <bsp_printf>:
    {
    2160:	fc010113          	addi	sp,sp,-64
    2164:	00112e23          	sw	ra,28(sp)
    2168:	00812c23          	sw	s0,24(sp)
    216c:	00912a23          	sw	s1,20(sp)
    2170:	00050493          	mv	s1,a0
    2174:	02b12223          	sw	a1,36(sp)
    2178:	02c12423          	sw	a2,40(sp)
    217c:	02d12623          	sw	a3,44(sp)
    2180:	02e12823          	sw	a4,48(sp)
    2184:	02f12a23          	sw	a5,52(sp)
    2188:	03012c23          	sw	a6,56(sp)
    218c:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    2190:	02410793          	addi	a5,sp,36
    2194:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    2198:	00000413          	li	s0,0
    219c:	01c0006f          	j	21b8 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    21a0:	00c12783          	lw	a5,12(sp)
    21a4:	00478713          	addi	a4,a5,4 # 2004 <plic_set_enable+0x48>
    21a8:	00e12623          	sw	a4,12(sp)
    21ac:	0007a503          	lw	a0,0(a5)
    21b0:	c91ff0ef          	jal	1e40 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    21b4:	00140413          	addi	s0,s0,1
    21b8:	008487b3          	add	a5,s1,s0
    21bc:	0007c503          	lbu	a0,0(a5)
    21c0:	0a050e63          	beqz	a0,227c <bsp_printf+0x11c>
            if (format[i] == '%') {
    21c4:	02500793          	li	a5,37
    21c8:	06f50e63          	beq	a0,a5,2244 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    21cc:	c75ff0ef          	jal	1e40 <bsp_printf_c>
    21d0:	fe5ff06f          	j	21b4 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    21d4:	00c12783          	lw	a5,12(sp)
    21d8:	00478713          	addi	a4,a5,4
    21dc:	00e12623          	sw	a4,12(sp)
    21e0:	0007a503          	lw	a0,0(a5)
    21e4:	c79ff0ef          	jal	1e5c <bsp_printf_s>
                        break;
    21e8:	fcdff06f          	j	21b4 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    21ec:	00c12783          	lw	a5,12(sp)
    21f0:	00478713          	addi	a4,a5,4
    21f4:	00e12623          	sw	a4,12(sp)
    21f8:	0007a503          	lw	a0,0(a5)
    21fc:	c79ff0ef          	jal	1e74 <bsp_printf_d>
                        break;
    2200:	fb5ff06f          	j	21b4 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    2204:	00c12783          	lw	a5,12(sp)
    2208:	00478713          	addi	a4,a5,4
    220c:	00e12623          	sw	a4,12(sp)
    2210:	0007a503          	lw	a0,0(a5)
    2214:	d21ff0ef          	jal	1f34 <bsp_printf_X>
                        break;
    2218:	f9dff06f          	j	21b4 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    221c:	00c12783          	lw	a5,12(sp)
    2220:	00478713          	addi	a4,a5,4
    2224:	00e12623          	sw	a4,12(sp)
    2228:	0007a503          	lw	a0,0(a5)
    222c:	cc9ff0ef          	jal	1ef4 <bsp_printf_x>
                        break;
    2230:	f85ff06f          	j	21b4 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    2234:	00004537          	lui	a0,0x4
    2238:	bfc50513          	addi	a0,a0,-1028 # 3bfc <_data+0x28>
    223c:	c21ff0ef          	jal	1e5c <bsp_printf_s>
                        break;
    2240:	f75ff06f          	j	21b4 <bsp_printf+0x54>
                while (format[++i]) {
    2244:	00140413          	addi	s0,s0,1
    2248:	008487b3          	add	a5,s1,s0
    224c:	0007c783          	lbu	a5,0(a5)
    2250:	f60782e3          	beqz	a5,21b4 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    2254:	fa878793          	addi	a5,a5,-88
    2258:	0ff7f693          	zext.b	a3,a5
    225c:	02000713          	li	a4,32
    2260:	fed762e3          	bltu	a4,a3,2244 <bsp_printf+0xe4>
    2264:	00269793          	slli	a5,a3,0x2
    2268:	00004737          	lui	a4,0x4
    226c:	1f470713          	addi	a4,a4,500 # 41f4 <_data+0x620>
    2270:	00e787b3          	add	a5,a5,a4
    2274:	0007a783          	lw	a5,0(a5)
    2278:	00078067          	jr	a5
    }
    227c:	01c12083          	lw	ra,28(sp)
    2280:	01812403          	lw	s0,24(sp)
    2284:	01412483          	lw	s1,20(sp)
    2288:	04010113          	addi	sp,sp,64
    228c:	00008067          	ret

00002290 <rgb2grayscale>:

void rgb2grayscale(volatile uint32_t in_array[], volatile uint32_t out_array[], uint32_t width, uint32_t height)
{
   uint8_t red, green, blue, grayscale;

   for (int i = 0; i < (width * height); i++)
    2290:	00000313          	li	t1,0
    2294:	0880006f          	j	231c <rgb2grayscale+0x8c>
   {
      red = (in_array[i]) & 0xff;
    2298:	00231e13          	slli	t3,t1,0x2
    229c:	01c507b3          	add	a5,a0,t3
    22a0:	0007a703          	lw	a4,0(a5)
      green = ((in_array[i]) >> 8) & 0xff;
    22a4:	0007a883          	lw	a7,0(a5)
    22a8:	0088d893          	srli	a7,a7,0x8
      blue = ((in_array[i]) >> 16) & 0xff;
    22ac:	0007a803          	lw	a6,0(a5)
    22b0:	01085813          	srli	a6,a6,0x10

      grayscale = (30 * red + 59 * green + 11 * blue) / 100;
    22b4:	0ff77713          	zext.b	a4,a4
    22b8:	00471793          	slli	a5,a4,0x4
    22bc:	40e787b3          	sub	a5,a5,a4
    22c0:	00179793          	slli	a5,a5,0x1
    22c4:	0ff8f893          	zext.b	a7,a7
    22c8:	00489713          	slli	a4,a7,0x4
    22cc:	41170733          	sub	a4,a4,a7
    22d0:	00271713          	slli	a4,a4,0x2
    22d4:	41170733          	sub	a4,a4,a7
    22d8:	00e787b3          	add	a5,a5,a4
    22dc:	0ff87813          	zext.b	a6,a6
    22e0:	00181713          	slli	a4,a6,0x1
    22e4:	01070733          	add	a4,a4,a6
    22e8:	00271713          	slli	a4,a4,0x2
    22ec:	41070733          	sub	a4,a4,a6
    22f0:	00e787b3          	add	a5,a5,a4
    22f4:	06400713          	li	a4,100
    22f8:	02e7c7b3          	div	a5,a5,a4
      out_array[i] = (grayscale << 16) + (grayscale << 8) + (grayscale);
    22fc:	0ff7f793          	zext.b	a5,a5
    2300:	01079713          	slli	a4,a5,0x10
    2304:	00879813          	slli	a6,a5,0x8
    2308:	01070733          	add	a4,a4,a6
    230c:	01c58e33          	add	t3,a1,t3
    2310:	00f707b3          	add	a5,a4,a5
    2314:	00fe2023          	sw	a5,0(t3)
   for (int i = 0; i < (width * height); i++)
    2318:	00130313          	addi	t1,t1,1
    231c:	02d607b3          	mul	a5,a2,a3
    2320:	f6f36ce3          	bltu	t1,a5,2298 <rgb2grayscale+0x8>
   }

   return;
}
    2324:	00008067          	ret

00002328 <uart_interrupt_init>:
{
    2328:	ff010113          	addi	sp,sp,-16
    232c:	00112623          	sw	ra,12(sp)
    bsp_init();
    2330:	c45ff0ef          	jal	1f74 <bsp_init>
    uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2334:	f8010537          	lui	a0,0xf8010
    2338:	9c9ff0ef          	jal	1d00 <uart_status_read>
    233c:	00256593          	ori	a1,a0,2
    2340:	0ff5f593          	zext.b	a1,a1
    2344:	f8010537          	lui	a0,0xf8010
    2348:	9c1ff0ef          	jal	1d08 <uart_status_write>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
    234c:	00100693          	li	a3,1
    2350:	00100613          	li	a2,1
    2354:	00000593          	li	a1,0
    2358:	f8c00537          	lui	a0,0xf8c00
    235c:	c61ff0ef          	jal	1fbc <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 2); // 1
    2360:	00200613          	li	a2,2
    2364:	00100593          	li	a1,1
    2368:	f8c00537          	lui	a0,0xf8c00
    236c:	c41ff0ef          	jal	1fac <plic_set_priority>
}
    2370:	00c12083          	lw	ra,12(sp)
    2374:	01010113          	addi	sp,sp,16
    2378:	00008067          	ret

0000237c <trigger_next_display_dma>:
{
    237c:	ff010113          	addi	sp,sp,-16
    2380:	00112623          	sw	ra,12(sp)
    if (select_demo_mode == 0 || select_demo_mode == 3)
    2384:	8281a783          	lw	a5,-2008(gp) # 4890 <select_demo_mode>
    2388:	02078663          	beqz	a5,23b4 <trigger_next_display_dma+0x38>
    238c:	00300713          	li	a4,3
    2390:	02e78263          	beq	a5,a4,23b4 <trigger_next_display_dma+0x38>
    else if (select_demo_mode == 1)
    2394:	00100713          	li	a4,1
    2398:	08e78063          	beq	a5,a4,2418 <trigger_next_display_dma+0x9c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, SOBEL_START_ADDR, 16);
    239c:	01000693          	li	a3,16
    23a0:	00900637          	lui	a2,0x900
    23a4:	00200593          	li	a1,2
    23a8:	f8110537          	lui	a0,0xf8110
    23ac:	c95ff0ef          	jal	2040 <dmasg_input_memory>
    23b0:	0180006f          	j	23c8 <trigger_next_display_dma+0x4c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    23b4:	01000693          	li	a3,16
    23b8:	00100637          	lui	a2,0x100
    23bc:	00200593          	li	a1,2
    23c0:	f8110537          	lui	a0,0xf8110
    23c4:	c7dff0ef          	jal	2040 <dmasg_input_memory>
    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    23c8:	00100793          	li	a5,1
    23cc:	00000713          	li	a4,0
    23d0:	00000693          	li	a3,0
    23d4:	00000613          	li	a2,0
    23d8:	00200593          	li	a1,2
    23dc:	f8110537          	lui	a0,0xf8110
    23e0:	ce9ff0ef          	jal	20c8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    23e4:	00400613          	li	a2,4
    23e8:	00200593          	li	a1,2
    23ec:	f8110537          	lui	a0,0xf8110
    23f0:	d2dff0ef          	jal	211c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restar
    23f4:	00000693          	li	a3,0
    23f8:	0011d637          	lui	a2,0x11d
    23fc:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1173a0>
    2400:	00200593          	li	a1,2
    2404:	f8110537          	lui	a0,0xf8110
    2408:	cedff0ef          	jal	20f4 <dmasg_direct_start>
}
    240c:	00c12083          	lw	ra,12(sp)
    2410:	01010113          	addi	sp,sp,16
    2414:	00008067          	ret
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16);
    2418:	01000693          	li	a3,16
    241c:	00500637          	lui	a2,0x500
    2420:	00200593          	li	a1,2
    2424:	f8110537          	lui	a0,0xf8110
    2428:	c19ff0ef          	jal	2040 <dmasg_input_memory>
    242c:	f9dff06f          	j	23c8 <trigger_next_display_dma+0x4c>

00002430 <uart_demo_mode_selection>:
{
    2430:	ff010113          	addi	sp,sp,-16
    2434:	00112623          	sw	ra,12(sp)
    if (uart_status_read(BSP_UART_TERMINAL) & 0x00000200)
    2438:	f8010537          	lui	a0,0xf8010
    243c:	8c5ff0ef          	jal	1d00 <uart_status_read>
    2440:	20057513          	andi	a0,a0,512
    2444:	00051863          	bnez	a0,2454 <uart_demo_mode_selection+0x24>
}
    2448:	00c12083          	lw	ra,12(sp)
    244c:	01010113          	addi	sp,sp,16
    2450:	00008067          	ret
    2454:	00812423          	sw	s0,8(sp)
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD); // RX FIFO not empty interrupt Disable
    2458:	f8010537          	lui	a0,0xf8010
    245c:	8a5ff0ef          	jal	1d00 <uart_status_read>
    2460:	0fd57593          	andi	a1,a0,253
    2464:	f8010537          	lui	a0,0xf8010
    2468:	8a1ff0ef          	jal	1d08 <uart_status_write>
        uart_user_input = uart_read(BSP_UART_TERMINAL);
    246c:	f8010537          	lui	a0,0xf8010
    2470:	82dff0ef          	jal	1c9c <uart_read>
    2474:	00050413          	mv	s0,a0
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2478:	f8010537          	lui	a0,0xf8010
    247c:	885ff0ef          	jal	1d00 <uart_status_read>
    2480:	00256593          	ori	a1,a0,2
    2484:	0ff5f593          	zext.b	a1,a1
    2488:	f8010537          	lui	a0,0xf8010
    248c:	87dff0ef          	jal	1d08 <uart_status_write>
        if (uart_user_input == 'a')
    2490:	f9f40513          	addi	a0,s0,-97
    2494:	0ff57713          	zext.b	a4,a0
    2498:	00500793          	li	a5,5
    249c:	0ce7e063          	bltu	a5,a4,255c <uart_demo_mode_selection+0x12c>
    24a0:	00271513          	slli	a0,a4,0x2
    24a4:	000047b7          	lui	a5,0x4
    24a8:	27878793          	addi	a5,a5,632 # 4278 <_data+0x6a4>
    24ac:	00f50533          	add	a0,a0,a5
    24b0:	00052783          	lw	a5,0(a0) # f8010000 <__freertos_irq_stack_top+0xf800a760>
    24b4:	00078067          	jr	a5
            select_demo_mode = 0;
    24b8:	8201a423          	sw	zero,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: a\n\r");
    24bc:	00004537          	lui	a0,0x4
    24c0:	c6850513          	addi	a0,a0,-920 # 3c68 <_data+0x94>
    24c4:	c9dff0ef          	jal	2160 <bsp_printf>
    24c8:	00812403          	lw	s0,8(sp)
    24cc:	f7dff06f          	j	2448 <uart_demo_mode_selection+0x18>
            select_demo_mode = 1;
    24d0:	00100713          	li	a4,1
    24d4:	82e1a423          	sw	a4,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: b\n\r");
    24d8:	00004537          	lui	a0,0x4
    24dc:	c8050513          	addi	a0,a0,-896 # 3c80 <_data+0xac>
    24e0:	c81ff0ef          	jal	2160 <bsp_printf>
    24e4:	00812403          	lw	s0,8(sp)
    24e8:	f61ff06f          	j	2448 <uart_demo_mode_selection+0x18>
            select_demo_mode = 2;
    24ec:	00200713          	li	a4,2
    24f0:	82e1a423          	sw	a4,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: c\n\r");
    24f4:	00004537          	lui	a0,0x4
    24f8:	c9850513          	addi	a0,a0,-872 # 3c98 <_data+0xc4>
    24fc:	c65ff0ef          	jal	2160 <bsp_printf>
    2500:	00812403          	lw	s0,8(sp)
    2504:	f45ff06f          	j	2448 <uart_demo_mode_selection+0x18>
            select_demo_mode = 3;
    2508:	00300713          	li	a4,3
    250c:	82e1a423          	sw	a4,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: d\n\r");
    2510:	00004537          	lui	a0,0x4
    2514:	cb050513          	addi	a0,a0,-848 # 3cb0 <_data+0xdc>
    2518:	c49ff0ef          	jal	2160 <bsp_printf>
    251c:	00812403          	lw	s0,8(sp)
    2520:	f29ff06f          	j	2448 <uart_demo_mode_selection+0x18>
            select_demo_mode = 4;
    2524:	00400713          	li	a4,4
    2528:	82e1a423          	sw	a4,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: e\n\r");
    252c:	00004537          	lui	a0,0x4
    2530:	cc850513          	addi	a0,a0,-824 # 3cc8 <_data+0xf4>
    2534:	c2dff0ef          	jal	2160 <bsp_printf>
    2538:	00812403          	lw	s0,8(sp)
    253c:	f0dff06f          	j	2448 <uart_demo_mode_selection+0x18>
            select_demo_mode = 5;
    2540:	00500713          	li	a4,5
    2544:	82e1a423          	sw	a4,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: f\n\r");
    2548:	00004537          	lui	a0,0x4
    254c:	ce050513          	addi	a0,a0,-800 # 3ce0 <_data+0x10c>
    2550:	c11ff0ef          	jal	2160 <bsp_printf>
    2554:	00812403          	lw	s0,8(sp)
    2558:	ef1ff06f          	j	2448 <uart_demo_mode_selection+0x18>
            select_demo_mode = 6;
    255c:	00600713          	li	a4,6
    2560:	82e1a423          	sw	a4,-2008(gp) # 4890 <select_demo_mode>
            bsp_printf("Selected Demo Mode: g\n\r");
    2564:	00004537          	lui	a0,0x4
    2568:	cf850513          	addi	a0,a0,-776 # 3cf8 <_data+0x124>
    256c:	bf5ff0ef          	jal	2160 <bsp_printf>
    2570:	00812403          	lw	s0,8(sp)
}
    2574:	ed5ff06f          	j	2448 <uart_demo_mode_selection+0x18>

00002578 <externalInterrupt>:
{
    2578:	ff010113          	addi	sp,sp,-16
    257c:	00112623          	sw	ra,12(sp)
    2580:	00812423          	sw	s0,8(sp)
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2584:	0180006f          	j	259c <externalInterrupt+0x24>
            uart_demo_mode_selection();
    2588:	ea9ff0ef          	jal	2430 <uart_demo_mode_selection>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); // unmask the claimed interrupt
    258c:	00040613          	mv	a2,s0
    2590:	00000593          	li	a1,0
    2594:	f8c00537          	lui	a0,0xf8c00
    2598:	a8dff0ef          	jal	2024 <plic_release>
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    259c:	00000593          	li	a1,0
    25a0:	f8c00537          	lui	a0,0xf8c00
    25a4:	a65ff0ef          	jal	2008 <plic_claim>
    25a8:	00050413          	mv	s0,a0
    25ac:	02050e63          	beqz	a0,25e8 <externalInterrupt+0x70>
        switch (claim)
    25b0:	00100793          	li	a5,1
    25b4:	fcf40ae3          	beq	s0,a5,2588 <externalInterrupt+0x10>
    25b8:	00600793          	li	a5,6
    25bc:	02f41263          	bne	s0,a5,25e0 <externalInterrupt+0x68>
            if (display_mm2s_active && !(dmasg_busy(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL)))
    25c0:	8241a783          	lw	a5,-2012(gp) # 488c <display_mm2s_active>
    25c4:	fc0784e3          	beqz	a5,258c <externalInterrupt+0x14>
    25c8:	00200593          	li	a1,2
    25cc:	f8110537          	lui	a0,0xf8110
    25d0:	b65ff0ef          	jal	2134 <dmasg_busy>
    25d4:	fa051ce3          	bnez	a0,258c <externalInterrupt+0x14>
                trigger_next_display_dma();
    25d8:	da5ff0ef          	jal	237c <trigger_next_display_dma>
    25dc:	fb1ff06f          	j	258c <externalInterrupt+0x14>
            crash();
    25e0:	c10ff0ef          	jal	19f0 <crash>
            break;
    25e4:	fa9ff06f          	j	258c <externalInterrupt+0x14>
}
    25e8:	00c12083          	lw	ra,12(sp)
    25ec:	00812403          	lw	s0,8(sp)
    25f0:	01010113          	addi	sp,sp,16
    25f4:	00008067          	ret

000025f8 <ispExample_menu>:
{
    25f8:	ff010113          	addi	sp,sp,-16
    25fc:	00112623          	sw	ra,12(sp)
    2600:	00812423          	sw	s0,8(sp)
    bsp_printf("================================================================================\n\r");
    2604:	00004437          	lui	s0,0x4
    2608:	d1040513          	addi	a0,s0,-752 # 3d10 <_data+0x13c>
    260c:	b55ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("                    ISP Example Design Scenario Selection\n\r");
    2610:	00004537          	lui	a0,0x4
    2614:	d6450513          	addi	a0,a0,-668 # 3d64 <_data+0x190>
    2618:	b49ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("================================================================================\n\r");
    261c:	d1040513          	addi	a0,s0,-752
    2620:	b41ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'a' : Camera Capture + HDMI Display                                             \n\r");
    2624:	00004537          	lui	a0,0x4
    2628:	da050513          	addi	a0,a0,-608 # 3da0 <_data+0x1cc>
    262c:	b35ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'b' : Camera Capture + RGB2Grayscale (SW) + HDMI Display                        \n\r");
    2630:	00004537          	lui	a0,0x4
    2634:	df450513          	addi	a0,a0,-524 # 3df4 <_data+0x220>
    2638:	b29ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'c' : Camera Capture + RGB2Grayscale (SW) + Sobel (HW) + HDMI Display           \n\r");
    263c:	00004537          	lui	a0,0x4
    2640:	e4850513          	addi	a0,a0,-440 # 3e48 <_data+0x274>
    2644:	b1dff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'d' : Camera Capture + RGB2Grayscale (HW) + HDMI Display                        \n\r");
    2648:	00004537          	lui	a0,0x4
    264c:	e9c50513          	addi	a0,a0,-356 # 3e9c <_data+0x2c8>
    2650:	b11ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'e' : Camera Capture + RGB2Grayscale & Sobel (HW) + HDMI Display                \n\r");
    2654:	00004537          	lui	a0,0x4
    2658:	ef050513          	addi	a0,a0,-272 # 3ef0 <_data+0x31c>
    265c:	b05ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'f' : Camera Capture + RGB2Grayscale & Sobel & Dilation (HW) + HDMI Display     \n\r");
    2660:	00004537          	lui	a0,0x4
    2664:	f4450513          	addi	a0,a0,-188 # 3f44 <_data+0x370>
    2668:	af9ff0ef          	jal	2160 <bsp_printf>
    bsp_printf("'g' : Camera Capture + RGB2Grayscale & Sobel & Erosion  (HW) + HDMI Display     \n\r");
    266c:	00004537          	lui	a0,0x4
    2670:	f9850513          	addi	a0,a0,-104 # 3f98 <_data+0x3c4>
    2674:	aedff0ef          	jal	2160 <bsp_printf>
    bsp_printf("================================================================================\n\n\r");
    2678:	00004537          	lui	a0,0x4
    267c:	fec50513          	addi	a0,a0,-20 # 3fec <_data+0x418>
    2680:	ae1ff0ef          	jal	2160 <bsp_printf>
}
    2684:	00c12083          	lw	ra,12(sp)
    2688:	00812403          	lw	s0,8(sp)
    268c:	01010113          	addi	sp,sp,16
    2690:	00008067          	ret

00002694 <i2c_masterBusy>:
        return *((volatile u32*) address);
    2694:	04052503          	lw	a0,64(a0)
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
    2698:	00157513          	andi	a0,a0,1
    269c:	00008067          	ret

000026a0 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    26a0:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    26a4:	21000793          	li	a5,528
    26a8:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    26ac:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    26b0:	0107f793          	andi	a5,a5,16
    26b4:	fe079ce3          	bnez	a5,26ac <i2c_masterStartBlocking+0xc>
    }
    26b8:	00008067          	ret

000026bc <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
    26bc:	ff010113          	addi	sp,sp,-16
    26c0:	00112623          	sw	ra,12(sp)
    26c4:	00812423          	sw	s0,8(sp)
    26c8:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    26cc:	00040513          	mv	a0,s0
    26d0:	fc5ff0ef          	jal	2694 <i2c_masterBusy>
    26d4:	fe051ce3          	bnez	a0,26cc <i2c_masterStopWait+0x10>
    }
    26d8:	00c12083          	lw	ra,12(sp)
    26dc:	00812403          	lw	s0,8(sp)
    26e0:	01010113          	addi	sp,sp,16
    26e4:	00008067          	ret

000026e8 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
    26e8:	ff010113          	addi	sp,sp,-16
    26ec:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    26f0:	42000713          	li	a4,1056
    26f4:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
    26f8:	fc5ff0ef          	jal	26bc <i2c_masterStopWait>
    }
    26fc:	00c12083          	lw	ra,12(sp)
    2700:	01010113          	addi	sp,sp,16
    2704:	00008067          	ret

00002708 <i2c_txAckWait>:
        return *((volatile u32*) address);
    2708:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    270c:	1007f793          	andi	a5,a5,256
    2710:	fe079ce3          	bnez	a5,2708 <i2c_txAckWait>
    }
    2714:	00008067          	ret

00002718 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
    2718:	ff010113          	addi	sp,sp,-16
    271c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    2720:	30100713          	li	a4,769
    2724:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
    2728:	fe1ff0ef          	jal	2708 <i2c_txAckWait>
    }
    272c:	00c12083          	lw	ra,12(sp)
    2730:	01010113          	addi	sp,sp,16
    2734:	00008067          	ret

00002738 <i2c_rxAck>:
        return *((volatile u32*) address);
    2738:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    273c:	0ff57513          	zext.b	a0,a0
    }
    2740:	00153513          	seqz	a0,a0
    2744:	00008067          	ret

00002748 <PiCam_WriteRegData>:
#include "riscv.h"
#include "PiCamDriver.h"
#include "common.h"

void PiCam_WriteRegData(u32 i2c_base, u16 reg, u8 data)
{
    2748:	fe010113          	addi	sp,sp,-32
    274c:	00112e23          	sw	ra,28(sp)
    2750:	00812c23          	sw	s0,24(sp)
    2754:	00912a23          	sw	s1,20(sp)
    2758:	01212823          	sw	s2,16(sp)
    275c:	01312623          	sw	s3,12(sp)
    2760:	00050413          	mv	s0,a0
    2764:	00058493          	mv	s1,a1
    2768:	00060913          	mv	s2,a2
   u8 outdata;

   i2c_masterStartBlocking(i2c_base);
    276c:	f35ff0ef          	jal	26a0 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    2770:	000017b7          	lui	a5,0x1
    2774:	b2078793          	addi	a5,a5,-1248 # b20 <CUSTOM2+0xac5>
    2778:	00f42023          	sw	a5,0(s0)

   i2c_txByte(i2c_base, 0x10 << 1);
   i2c_txNackBlocking(i2c_base);
    277c:	00040513          	mv	a0,s0
    2780:	f99ff0ef          	jal	2718 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    2784:	00040513          	mv	a0,s0
    2788:	fb1ff0ef          	jal	2738 <i2c_rxAck>
    278c:	c1cff0ef          	jal	1ba8 <assert>

   i2c_txByte(i2c_base, (reg >> 8) & 0xFF);
    2790:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    2794:	000019b7          	lui	s3,0x1
    2798:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    279c:	0137e7b3          	or	a5,a5,s3
    27a0:	00f42023          	sw	a5,0(s0)
   i2c_txNackBlocking(i2c_base);
    27a4:	00040513          	mv	a0,s0
    27a8:	f71ff0ef          	jal	2718 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    27ac:	00040513          	mv	a0,s0
    27b0:	f89ff0ef          	jal	2738 <i2c_rxAck>
    27b4:	bf4ff0ef          	jal	1ba8 <assert>

   i2c_txByte(i2c_base, (reg) & 0xFF);
    27b8:	0ff4f493          	zext.b	s1,s1
    27bc:	0134e4b3          	or	s1,s1,s3
    27c0:	00942023          	sw	s1,0(s0)
   i2c_txNackBlocking(i2c_base);
    27c4:	00040513          	mv	a0,s0
    27c8:	f51ff0ef          	jal	2718 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    27cc:	00040513          	mv	a0,s0
    27d0:	f69ff0ef          	jal	2738 <i2c_rxAck>
    27d4:	bd4ff0ef          	jal	1ba8 <assert>
    27d8:	01396933          	or	s2,s2,s3
    27dc:	01242023          	sw	s2,0(s0)

   i2c_txByte(i2c_base, data & 0xFF);
   i2c_txNackBlocking(i2c_base);
    27e0:	00040513          	mv	a0,s0
    27e4:	f35ff0ef          	jal	2718 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    27e8:	00040513          	mv	a0,s0
    27ec:	f4dff0ef          	jal	2738 <i2c_rxAck>
    27f0:	bb8ff0ef          	jal	1ba8 <assert>

   i2c_masterStopBlocking(i2c_base);
    27f4:	00040513          	mv	a0,s0
    27f8:	ef1ff0ef          	jal	26e8 <i2c_masterStopBlocking>
}
    27fc:	01c12083          	lw	ra,28(sp)
    2800:	01812403          	lw	s0,24(sp)
    2804:	01412483          	lw	s1,20(sp)
    2808:	01012903          	lw	s2,16(sp)
    280c:	00c12983          	lw	s3,12(sp)
    2810:	02010113          	addi	sp,sp,32
    2814:	00008067          	ret

00002818 <AccessCommSeq>:
   i2c_masterStopBlocking(i2c_base);

   return outdata;
}
void AccessCommSeq(u32 i2c_base)
{
    2818:	ff010113          	addi	sp,sp,-16
    281c:	00112623          	sw	ra,12(sp)
    2820:	00812423          	sw	s0,8(sp)
    2824:	00050413          	mv	s0,a0
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    2828:	00500613          	li	a2,5
    282c:	000035b7          	lui	a1,0x3
    2830:	0eb58593          	addi	a1,a1,235 # 30eb <mipi_i2c_probe+0x37>
    2834:	f15ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x0C);
    2838:	00c00613          	li	a2,12
    283c:	000035b7          	lui	a1,0x3
    2840:	0eb58593          	addi	a1,a1,235 # 30eb <mipi_i2c_probe+0x37>
    2844:	00040513          	mv	a0,s0
    2848:	f01ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300A, 0xFF);
    284c:	0ff00613          	li	a2,255
    2850:	000035b7          	lui	a1,0x3
    2854:	00a58593          	addi	a1,a1,10 # 300a <bsp_printf_x+0x32>
    2858:	00040513          	mv	a0,s0
    285c:	eedff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300B, 0xFF);
    2860:	0ff00613          	li	a2,255
    2864:	000035b7          	lui	a1,0x3
    2868:	00b58593          	addi	a1,a1,11 # 300b <bsp_printf_x+0x33>
    286c:	00040513          	mv	a0,s0
    2870:	ed9ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    2874:	00500613          	li	a2,5
    2878:	000035b7          	lui	a1,0x3
    287c:	0eb58593          	addi	a1,a1,235 # 30eb <mipi_i2c_probe+0x37>
    2880:	00040513          	mv	a0,s0
    2884:	ec5ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x09);
    2888:	00900613          	li	a2,9
    288c:	000035b7          	lui	a1,0x3
    2890:	0eb58593          	addi	a1,a1,235 # 30eb <mipi_i2c_probe+0x37>
    2894:	00040513          	mv	a0,s0
    2898:	eb1ff0ef          	jal	2748 <PiCam_WriteRegData>
}
    289c:	00c12083          	lw	ra,12(sp)
    28a0:	00812403          	lw	s0,8(sp)
    28a4:	01010113          	addi	sp,sp,16
    28a8:	00008067          	ret

000028ac <PiCam_Output_Size>:

void PiCam_Output_Size(u32 i2c_base, u16 X, u16 Y)
{
    28ac:	ff010113          	addi	sp,sp,-16
    28b0:	00112623          	sw	ra,12(sp)
    28b4:	00812423          	sw	s0,8(sp)
    28b8:	00912223          	sw	s1,4(sp)
    28bc:	01212023          	sw	s2,0(sp)
    28c0:	00050413          	mv	s0,a0
    28c4:	00058913          	mv	s2,a1
    28c8:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, x_output_size_A_1, X >> 8);
    28cc:	0085d613          	srli	a2,a1,0x8
    28d0:	16c00593          	li	a1,364
    28d4:	e75ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, x_output_size_A_0, X & 0xFF);
    28d8:	0ff97613          	zext.b	a2,s2
    28dc:	16d00593          	li	a1,365
    28e0:	00040513          	mv	a0,s0
    28e4:	e65ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_1, Y >> 8);
    28e8:	0084d613          	srli	a2,s1,0x8
    28ec:	16e00593          	li	a1,366
    28f0:	00040513          	mv	a0,s0
    28f4:	e55ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_0, Y & 0xFF);
    28f8:	0ff4f613          	zext.b	a2,s1
    28fc:	16f00593          	li	a1,367
    2900:	00040513          	mv	a0,s0
    2904:	e45ff0ef          	jal	2748 <PiCam_WriteRegData>
}
    2908:	00c12083          	lw	ra,12(sp)
    290c:	00812403          	lw	s0,8(sp)
    2910:	00412483          	lw	s1,4(sp)
    2914:	00012903          	lw	s2,0(sp)
    2918:	01010113          	addi	sp,sp,16
    291c:	00008067          	ret

00002920 <PiCam_Output_activePixel>:

void PiCam_Output_activePixel(u32 i2c_base, u16 XStart, u16 XEnd, u16 YStart, u16 YEnd)
{
    2920:	fe010113          	addi	sp,sp,-32
    2924:	00112e23          	sw	ra,28(sp)
    2928:	00812c23          	sw	s0,24(sp)
    292c:	00912a23          	sw	s1,20(sp)
    2930:	01212823          	sw	s2,16(sp)
    2934:	01312623          	sw	s3,12(sp)
    2938:	01412423          	sw	s4,8(sp)
    293c:	00050413          	mv	s0,a0
    2940:	00058a13          	mv	s4,a1
    2944:	00060993          	mv	s3,a2
    2948:	00068913          	mv	s2,a3
    294c:	00070493          	mv	s1,a4
   // Max Active pixel 3280* 2464--imx219
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_1, XStart >> 8);
    2950:	0085d613          	srli	a2,a1,0x8
    2954:	16400593          	li	a1,356
    2958:	df1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_0, XStart & 0xFF);
    295c:	0ffa7613          	zext.b	a2,s4
    2960:	16500593          	li	a1,357
    2964:	00040513          	mv	a0,s0
    2968:	de1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_1, XEnd >> 8);
    296c:	0089d613          	srli	a2,s3,0x8
    2970:	16600593          	li	a1,358
    2974:	00040513          	mv	a0,s0
    2978:	dd1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_0, XEnd & 0xFF);
    297c:	0ff9f613          	zext.b	a2,s3
    2980:	16700593          	li	a1,359
    2984:	00040513          	mv	a0,s0
    2988:	dc1ff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_1, YStart >> 8);
    298c:	00895613          	srli	a2,s2,0x8
    2990:	16800593          	li	a1,360
    2994:	00040513          	mv	a0,s0
    2998:	db1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_0, YStart & 0xFF);
    299c:	0ff97613          	zext.b	a2,s2
    29a0:	16900593          	li	a1,361
    29a4:	00040513          	mv	a0,s0
    29a8:	da1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
    29ac:	0084d613          	srli	a2,s1,0x8
    29b0:	16a00593          	li	a1,362
    29b4:	00040513          	mv	a0,s0
    29b8:	d91ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
    29bc:	0ff4f613          	zext.b	a2,s1
    29c0:	16b00593          	li	a1,363
    29c4:	00040513          	mv	a0,s0
    29c8:	d81ff0ef          	jal	2748 <PiCam_WriteRegData>
}
    29cc:	01c12083          	lw	ra,28(sp)
    29d0:	01812403          	lw	s0,24(sp)
    29d4:	01412483          	lw	s1,20(sp)
    29d8:	01012903          	lw	s2,16(sp)
    29dc:	00c12983          	lw	s3,12(sp)
    29e0:	00812a03          	lw	s4,8(sp)
    29e4:	02010113          	addi	sp,sp,32
    29e8:	00008067          	ret

000029ec <PiCam_SetBinningMode>:
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
}

void PiCam_SetBinningMode(u32 i2c_base, u8 Xmode, u8 Ymode)
{
    29ec:	ff010113          	addi	sp,sp,-16
    29f0:	00112623          	sw	ra,12(sp)
    29f4:	00812423          	sw	s0,8(sp)
    29f8:	00912223          	sw	s1,4(sp)
    29fc:	00050493          	mv	s1,a0
    2a00:	00060413          	mv	s0,a2
   // 0:no-binning
   // 1:x2-binning
   // 2:x4-binning
   // 3:x2 analog (special)

   if (Xmode >= 3)
    2a04:	00200793          	li	a5,2
    2a08:	00b7f463          	bgeu	a5,a1,2a10 <PiCam_SetBinningMode+0x24>
      Xmode = 3;
    2a0c:	00300593          	li	a1,3
   if (Ymode >= 3)
    2a10:	00200793          	li	a5,2
    2a14:	0087f463          	bgeu	a5,s0,2a1c <PiCam_SetBinningMode+0x30>
      Ymode = 3;
    2a18:	00300413          	li	s0,3

   PiCam_WriteRegData(i2c_base, BINNING_MODE_H_A, Xmode);
    2a1c:	00058613          	mv	a2,a1
    2a20:	17400593          	li	a1,372
    2a24:	00048513          	mv	a0,s1
    2a28:	d21ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, BINNING_MODE_V_A, Ymode);
    2a2c:	00040613          	mv	a2,s0
    2a30:	17500593          	li	a1,373
    2a34:	00048513          	mv	a0,s1
    2a38:	d11ff0ef          	jal	2748 <PiCam_WriteRegData>
}
    2a3c:	00c12083          	lw	ra,12(sp)
    2a40:	00812403          	lw	s0,8(sp)
    2a44:	00412483          	lw	s1,4(sp)
    2a48:	01010113          	addi	sp,sp,16
    2a4c:	00008067          	ret

00002a50 <PiCam_Gainfilter>:

   PiCam_Output_ColorBarSize(i2c_base, X, Y);
}

void PiCam_Gainfilter(u32 i2c_base, u8 AGain, u16 DGain)
{
    2a50:	ff010113          	addi	sp,sp,-16
    2a54:	00112623          	sw	ra,12(sp)
    2a58:	00812423          	sw	s0,8(sp)
    2a5c:	00912223          	sw	s1,4(sp)
    2a60:	00050413          	mv	s0,a0
    2a64:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, ANA_GAIN_GLOBAL_A, AGain & 0xFF);
    2a68:	00058613          	mv	a2,a1
    2a6c:	15700593          	li	a1,343
    2a70:	cd9ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_1, (DGain >> 8) & 0x0F);
    2a74:	0084d613          	srli	a2,s1,0x8
    2a78:	00f67613          	andi	a2,a2,15
    2a7c:	15800593          	li	a1,344
    2a80:	00040513          	mv	a0,s0
    2a84:	cc5ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_0, DGain & 0xFF);
    2a88:	0ff4f613          	zext.b	a2,s1
    2a8c:	15900593          	li	a1,345
    2a90:	00040513          	mv	a0,s0
    2a94:	cb5ff0ef          	jal	2748 <PiCam_WriteRegData>
}
    2a98:	00c12083          	lw	ra,12(sp)
    2a9c:	00812403          	lw	s0,8(sp)
    2aa0:	00412483          	lw	s1,4(sp)
    2aa4:	01010113          	addi	sp,sp,16
    2aa8:	00008067          	ret

00002aac <PiCam_init>:

// For cam1
void PiCam_init(u32 i2c_base)
{
    2aac:	ff010113          	addi	sp,sp,-16
    2ab0:	00112623          	sw	ra,12(sp)
    2ab4:	00812423          	sw	s0,8(sp)
    2ab8:	00050413          	mv	s0,a0

   PiCam_WriteRegData(i2c_base, mode_select, 0x00);
    2abc:	00000613          	li	a2,0
    2ac0:	10000593          	li	a1,256
    2ac4:	c85ff0ef          	jal	2748 <PiCam_WriteRegData>
   AccessCommSeq(i2c_base);
    2ac8:	00040513          	mv	a0,s0
    2acc:	d4dff0ef          	jal	2818 <AccessCommSeq>
   PiCam_WriteRegData(i2c_base, CSI_LANE_MODE, 0x01);
    2ad0:	00100613          	li	a2,1
    2ad4:	11400593          	li	a1,276
    2ad8:	00040513          	mv	a0,s0
    2adc:	c6dff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DPHY_CTRL, 0x00);
    2ae0:	00000613          	li	a2,0
    2ae4:	12800593          	li	a1,296
    2ae8:	00040513          	mv	a0,s0
    2aec:	c5dff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_1, 0x18);
    2af0:	01800613          	li	a2,24
    2af4:	12a00593          	li	a1,298
    2af8:	00040513          	mv	a0,s0
    2afc:	c4dff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_0, 0x00);
    2b00:	00000613          	li	a2,0
    2b04:	12b00593          	li	a1,299
    2b08:	00040513          	mv	a0,s0
    2b0c:	c3dff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x04);
    2b10:	00400613          	li	a2,4
    2b14:	16000593          	li	a1,352
    2b18:	00040513          	mv	a0,s0
    2b1c:	c2dff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0x59);
    2b20:	05900613          	li	a2,89
    2b24:	16100593          	li	a1,353
    2b28:	00040513          	mv	a0,s0
    2b2c:	c1dff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    2b30:	00d00613          	li	a2,13
    2b34:	16200593          	li	a1,354
    2b38:	00040513          	mv	a0,s0
    2b3c:	c0dff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    2b40:	07800613          	li	a2,120
    2b44:	16300593          	li	a1,355
    2b48:	00040513          	mv	a0,s0
    2b4c:	bfdff0ef          	jal	2748 <PiCam_WriteRegData>

   //   PiCam_Output_activePixel(i2c_base, 0, 3279, 0, 2463);
   PiCam_Output_activePixel(i2c_base, 680, 2599, 692, 1771); // Capture centre of sensor
    2b50:	6eb00713          	li	a4,1771
    2b54:	2b400693          	li	a3,692
    2b58:	00001637          	lui	a2,0x1
    2b5c:	a2760613          	addi	a2,a2,-1497 # a27 <CUSTOM2+0x9cc>
    2b60:	2a800593          	li	a1,680
    2b64:	00040513          	mv	a0,s0
    2b68:	db9ff0ef          	jal	2920 <PiCam_Output_activePixel>

   PiCam_Output_Size(i2c_base, 1920, 1080);
    2b6c:	43800613          	li	a2,1080
    2b70:	78000593          	li	a1,1920
    2b74:	00040513          	mv	a0,s0
    2b78:	d35ff0ef          	jal	28ac <PiCam_Output_Size>
   // PiCam_Output_Size(i2c_base, 1280, 720);
   // PiCam_Output_Size(i2c_base, 640, 480);

   PiCam_WriteRegData(i2c_base, X_ODD_INC_A, 0x01);
    2b7c:	00100613          	li	a2,1
    2b80:	17000593          	li	a1,368
    2b84:	00040513          	mv	a0,s0
    2b88:	bc1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ODD_INC_A, 0x01);
    2b8c:	00100613          	li	a2,1
    2b90:	17100593          	li	a1,369
    2b94:	00040513          	mv	a0,s0
    2b98:	bb1ff0ef          	jal	2748 <PiCam_WriteRegData>

   // 0: No binning; 1: x2 binning; 2: x4 binning; 3: x2 binning (analog special)
   PiCam_SetBinningMode(i2c_base, 0, 0);
    2b9c:	00000613          	li	a2,0
    2ba0:	00000593          	li	a1,0
    2ba4:	00040513          	mv	a0,s0
    2ba8:	e45ff0ef          	jal	29ec <PiCam_SetBinningMode>

   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_1, 0x0A);
    2bac:	00a00613          	li	a2,10
    2bb0:	18c00593          	li	a1,396
    2bb4:	00040513          	mv	a0,s0
    2bb8:	b91ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_0, 0x0A);
    2bbc:	00a00613          	li	a2,10
    2bc0:	18d00593          	li	a1,397
    2bc4:	00040513          	mv	a0,s0
    2bc8:	b81ff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, VTPXCK_DIV, 0x05);
    2bcc:	00500613          	li	a2,5
    2bd0:	30100593          	li	a1,769
    2bd4:	00040513          	mv	a0,s0
    2bd8:	b71ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, VTSYCK_DIV, 0x01);
    2bdc:	00100613          	li	a2,1
    2be0:	30300593          	li	a1,771
    2be4:	00040513          	mv	a0,s0
    2be8:	b61ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_VT_DIV, 0x03);
    2bec:	00300613          	li	a2,3
    2bf0:	30400593          	li	a1,772
    2bf4:	00040513          	mv	a0,s0
    2bf8:	b51ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_OP_DIV, 0x03);
    2bfc:	00300613          	li	a2,3
    2c00:	30500593          	li	a1,773
    2c04:	00040513          	mv	a0,s0
    2c08:	b41ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_1, 0x00);
    2c0c:	00000613          	li	a2,0
    2c10:	30600593          	li	a1,774
    2c14:	00040513          	mv	a0,s0
    2c18:	b31ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_0, 0x39);
    2c1c:	03900613          	li	a2,57
    2c20:	30700593          	li	a1,775
    2c24:	00040513          	mv	a0,s0
    2c28:	b21ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    2c2c:	00a00613          	li	a2,10
    2c30:	30900593          	li	a1,777
    2c34:	00040513          	mv	a0,s0
    2c38:	b11ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    2c3c:	00100613          	li	a2,1
    2c40:	30b00593          	li	a1,779
    2c44:	00040513          	mv	a0,s0
    2c48:	b01ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    2c4c:	00000613          	li	a2,0
    2c50:	30c00593          	li	a1,780
    2c54:	00040513          	mv	a0,s0
    2c58:	af1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    2c5c:	07200613          	li	a2,114
    2c60:	30d00593          	li	a1,781
    2c64:	00040513          	mv	a0,s0
    2c68:	ae1ff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    2c6c:	00a00613          	li	a2,10
    2c70:	30900593          	li	a1,777
    2c74:	00040513          	mv	a0,s0
    2c78:	ad1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    2c7c:	00100613          	li	a2,1
    2c80:	30b00593          	li	a1,779
    2c84:	00040513          	mv	a0,s0
    2c88:	ac1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    2c8c:	00000613          	li	a2,0
    2c90:	30c00593          	li	a1,780
    2c94:	00040513          	mv	a0,s0
    2c98:	ab1ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    2c9c:	07200613          	li	a2,114
    2ca0:	30d00593          	li	a1,781
    2ca4:	00040513          	mv	a0,s0
    2ca8:	aa1ff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, mode_select, 0x01);
    2cac:	00100613          	li	a2,1
    2cb0:	10000593          	li	a1,256
    2cb4:	00040513          	mv	a0,s0
    2cb8:	a91ff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_Gainfilter(i2c_base, 0xB9, 0x200);
    2cbc:	20000613          	li	a2,512
    2cc0:	0b900593          	li	a1,185
    2cc4:	00040513          	mv	a0,s0
    2cc8:	d89ff0ef          	jal	2a50 <PiCam_Gainfilter>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    2ccc:	00d00613          	li	a2,13
    2cd0:	16200593          	li	a1,354
    2cd4:	00040513          	mv	a0,s0
    2cd8:	a71ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    2cdc:	07800613          	li	a2,120
    2ce0:	16300593          	li	a1,355
    2ce4:	00040513          	mv	a0,s0
    2ce8:	a61ff0ef          	jal	2748 <PiCam_WriteRegData>
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
   */

   // Longer camera exposure time, suitable for low light condition. Trade-off with lower frame rate.
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x06);
    2cec:	00600613          	li	a2,6
    2cf0:	16000593          	li	a1,352
    2cf4:	00040513          	mv	a0,s0
    2cf8:	a51ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0xE3);
    2cfc:	0e300613          	li	a2,227
    2d00:	16100593          	li	a1,353
    2d04:	00040513          	mv	a0,s0
    2d08:	a41ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
    2d0c:	00400613          	li	a2,4
    2d10:	15a00593          	li	a1,346
    2d14:	00040513          	mv	a0,s0
    2d18:	a31ff0ef          	jal	2748 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
    2d1c:	05400613          	li	a2,84
    2d20:	15b00593          	li	a1,347
    2d24:	00040513          	mv	a0,s0
    2d28:	a21ff0ef          	jal	2748 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, IMG_ORIENTATION_A, 0x00);
    2d2c:	00000613          	li	a2,0
    2d30:	17200593          	li	a1,370
    2d34:	00040513          	mv	a0,s0
    2d38:	a11ff0ef          	jal	2748 <PiCam_WriteRegData>
}
    2d3c:	00c12083          	lw	ra,12(sp)
    2d40:	00812403          	lw	s0,8(sp)
    2d44:	01010113          	addi	sp,sp,16
    2d48:	00008067          	ret

00002d4c <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    2d4c:	04050713          	addi	a4,a0,64
    2d50:	21000793          	li	a5,528
    2d54:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    2d58:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    2d5c:	0107f793          	andi	a5,a5,16
    2d60:	fe079ce3          	bnez	a5,2d58 <i2c_masterStartBlocking+0xc>
    }
    2d64:	00008067          	ret

00002d68 <i2c_txAckWait>:
    2d68:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    2d6c:	1007f793          	andi	a5,a5,256
    2d70:	fe079ce3          	bnez	a5,2d68 <i2c_txAckWait>
    }
    2d74:	00008067          	ret

00002d78 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    2d78:	ff010113          	addi	sp,sp,-16
    2d7c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    2d80:	30100713          	li	a4,769
    2d84:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    2d88:	fe1ff0ef          	jal	2d68 <i2c_txAckWait>
    }
    2d8c:	00c12083          	lw	ra,12(sp)
    2d90:	01010113          	addi	sp,sp,16
    2d94:	00008067          	ret

00002d98 <i2c_rxAck>:
        return *((volatile u32*) address);
    2d98:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    2d9c:	0ff57513          	zext.b	a0,a0
    }
    2da0:	00153513          	seqz	a0,a0
    2da4:	00008067          	ret

00002da8 <uart_writeAvailability>:
    2da8:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    2dac:	01055513          	srli	a0,a0,0x10
    }
    2db0:	0ff57513          	zext.b	a0,a0
    2db4:	00008067          	ret

00002db8 <uart_write>:
    static void uart_write(u32 reg, char data){
    2db8:	ff010113          	addi	sp,sp,-16
    2dbc:	00112623          	sw	ra,12(sp)
    2dc0:	00812423          	sw	s0,8(sp)
    2dc4:	00912223          	sw	s1,4(sp)
    2dc8:	00050413          	mv	s0,a0
    2dcc:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    2dd0:	00040513          	mv	a0,s0
    2dd4:	fd5ff0ef          	jal	2da8 <uart_writeAvailability>
    2dd8:	fe050ce3          	beqz	a0,2dd0 <uart_write+0x18>
        *((volatile u32*) address) = data;
    2ddc:	00942023          	sw	s1,0(s0)
    }
    2de0:	00c12083          	lw	ra,12(sp)
    2de4:	00812403          	lw	s0,8(sp)
    2de8:	00412483          	lw	s1,4(sp)
    2dec:	01010113          	addi	sp,sp,16
    2df0:	00008067          	ret

00002df4 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
    2df4:	000f47b7          	lui	a5,0xf4
    2df8:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xee9a0>
    2dfc:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    2e00:	0000c7b7          	lui	a5,0xc
    2e04:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x6758>
    2e08:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    2e0c:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    2e10:	02a585b3          	mul	a1,a1,a0
    2e14:	00f58733          	add	a4,a1,a5
    2e18:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    2e1c:	40f707b3          	sub	a5,a4,a5
    2e20:	fe07dce3          	bgez	a5,2e18 <clint_uDelay+0x24>
    2e24:	00008067          	ret

00002e28 <_putchar>:
    static void _putchar(char character){
    2e28:	ff010113          	addi	sp,sp,-16
    2e2c:	00112623          	sw	ra,12(sp)
    2e30:	00050593          	mv	a1,a0
            bsp_putChar(character);
    2e34:	f8010537          	lui	a0,0xf8010
    2e38:	f81ff0ef          	jal	2db8 <uart_write>
    }
    2e3c:	00c12083          	lw	ra,12(sp)
    2e40:	01010113          	addi	sp,sp,16
    2e44:	00008067          	ret

00002e48 <_putchar_s>:
    {
    2e48:	ff010113          	addi	sp,sp,-16
    2e4c:	00112623          	sw	ra,12(sp)
    2e50:	00812423          	sw	s0,8(sp)
    2e54:	00050413          	mv	s0,a0
        while (*p)
    2e58:	00c0006f          	j	2e64 <_putchar_s+0x1c>
            _putchar(*(p++));
    2e5c:	00140413          	addi	s0,s0,1
    2e60:	fc9ff0ef          	jal	2e28 <_putchar>
        while (*p)
    2e64:	00044503          	lbu	a0,0(s0)
    2e68:	fe051ae3          	bnez	a0,2e5c <_putchar_s+0x14>
    }
    2e6c:	00c12083          	lw	ra,12(sp)
    2e70:	00812403          	lw	s0,8(sp)
    2e74:	01010113          	addi	sp,sp,16
    2e78:	00008067          	ret

00002e7c <bsp_printHex>:
    {
    2e7c:	ff010113          	addi	sp,sp,-16
    2e80:	00112623          	sw	ra,12(sp)
    2e84:	00812423          	sw	s0,8(sp)
    2e88:	00912223          	sw	s1,4(sp)
    2e8c:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2e90:	01c00413          	li	s0,28
    2e94:	0240006f          	j	2eb8 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    2e98:	0084d733          	srl	a4,s1,s0
    2e9c:	00f77713          	andi	a4,a4,15
    2ea0:	000047b7          	lui	a5,0x4
    2ea4:	bd478793          	addi	a5,a5,-1068 # 3bd4 <_data>
    2ea8:	00e787b3          	add	a5,a5,a4
    2eac:	0007c503          	lbu	a0,0(a5)
    2eb0:	f79ff0ef          	jal	2e28 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2eb4:	ffc40413          	addi	s0,s0,-4
    2eb8:	fe0450e3          	bgez	s0,2e98 <bsp_printHex+0x1c>
    }
    2ebc:	00c12083          	lw	ra,12(sp)
    2ec0:	00812403          	lw	s0,8(sp)
    2ec4:	00412483          	lw	s1,4(sp)
    2ec8:	01010113          	addi	sp,sp,16
    2ecc:	00008067          	ret

00002ed0 <bsp_printHex_lower>:
    {
    2ed0:	ff010113          	addi	sp,sp,-16
    2ed4:	00112623          	sw	ra,12(sp)
    2ed8:	00812423          	sw	s0,8(sp)
    2edc:	00912223          	sw	s1,4(sp)
    2ee0:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2ee4:	01c00413          	li	s0,28
    2ee8:	0240006f          	j	2f0c <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    2eec:	0084d733          	srl	a4,s1,s0
    2ef0:	00f77713          	andi	a4,a4,15
    2ef4:	000047b7          	lui	a5,0x4
    2ef8:	be878793          	addi	a5,a5,-1048 # 3be8 <_data+0x14>
    2efc:	00e787b3          	add	a5,a5,a4
    2f00:	0007c503          	lbu	a0,0(a5)
    2f04:	f25ff0ef          	jal	2e28 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2f08:	ffc40413          	addi	s0,s0,-4
    2f0c:	fe0450e3          	bgez	s0,2eec <bsp_printHex_lower+0x1c>
    }
    2f10:	00c12083          	lw	ra,12(sp)
    2f14:	00812403          	lw	s0,8(sp)
    2f18:	00412483          	lw	s1,4(sp)
    2f1c:	01010113          	addi	sp,sp,16
    2f20:	00008067          	ret

00002f24 <bsp_printf_c>:
    {
    2f24:	ff010113          	addi	sp,sp,-16
    2f28:	00112623          	sw	ra,12(sp)
        _putchar(c);
    2f2c:	0ff57513          	zext.b	a0,a0
    2f30:	ef9ff0ef          	jal	2e28 <_putchar>
    }
    2f34:	00c12083          	lw	ra,12(sp)
    2f38:	01010113          	addi	sp,sp,16
    2f3c:	00008067          	ret

00002f40 <bsp_printf_s>:
    {
    2f40:	ff010113          	addi	sp,sp,-16
    2f44:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    2f48:	f01ff0ef          	jal	2e48 <_putchar_s>
    }
    2f4c:	00c12083          	lw	ra,12(sp)
    2f50:	01010113          	addi	sp,sp,16
    2f54:	00008067          	ret

00002f58 <bsp_printf_d>:
    {
    2f58:	fd010113          	addi	sp,sp,-48
    2f5c:	02112623          	sw	ra,44(sp)
    2f60:	02812423          	sw	s0,40(sp)
    2f64:	02912223          	sw	s1,36(sp)
    2f68:	00050493          	mv	s1,a0
        if (val < 0) {
    2f6c:	00054663          	bltz	a0,2f78 <bsp_printf_d+0x20>
    {
    2f70:	00010413          	mv	s0,sp
    2f74:	02c0006f          	j	2fa0 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    2f78:	02d00513          	li	a0,45
    2f7c:	fa9ff0ef          	jal	2f24 <bsp_printf_c>
            val = -val;
    2f80:	409004b3          	neg	s1,s1
    2f84:	fedff06f          	j	2f70 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    2f88:	00a00713          	li	a4,10
    2f8c:	02e4e7b3          	rem	a5,s1,a4
    2f90:	03078793          	addi	a5,a5,48
    2f94:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    2f98:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    2f9c:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    2fa0:	fe0494e3          	bnez	s1,2f88 <bsp_printf_d+0x30>
    2fa4:	00010793          	mv	a5,sp
    2fa8:	fef400e3          	beq	s0,a5,2f88 <bsp_printf_d+0x30>
        while (p != buffer)
    2fac:	00010793          	mv	a5,sp
    2fb0:	00f40a63          	beq	s0,a5,2fc4 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    2fb4:	fff40413          	addi	s0,s0,-1
    2fb8:	00044503          	lbu	a0,0(s0)
    2fbc:	f69ff0ef          	jal	2f24 <bsp_printf_c>
    2fc0:	fedff06f          	j	2fac <bsp_printf_d+0x54>
    }
    2fc4:	02c12083          	lw	ra,44(sp)
    2fc8:	02812403          	lw	s0,40(sp)
    2fcc:	02412483          	lw	s1,36(sp)
    2fd0:	03010113          	addi	sp,sp,48
    2fd4:	00008067          	ret

00002fd8 <bsp_printf_x>:
    {
    2fd8:	ff010113          	addi	sp,sp,-16
    2fdc:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    2fe0:	00000713          	li	a4,0
    2fe4:	00700793          	li	a5,7
    2fe8:	02e7c063          	blt	a5,a4,3008 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    2fec:	00271693          	slli	a3,a4,0x2
    2ff0:	ff000793          	li	a5,-16
    2ff4:	00d797b3          	sll	a5,a5,a3
    2ff8:	00f577b3          	and	a5,a0,a5
    2ffc:	00078663          	beqz	a5,3008 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    3000:	00170713          	addi	a4,a4,1
    3004:	fe1ff06f          	j	2fe4 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    3008:	ec9ff0ef          	jal	2ed0 <bsp_printHex_lower>
    }
    300c:	00c12083          	lw	ra,12(sp)
    3010:	01010113          	addi	sp,sp,16
    3014:	00008067          	ret

00003018 <bsp_printf_X>:
        {
    3018:	ff010113          	addi	sp,sp,-16
    301c:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    3020:	00000713          	li	a4,0
    3024:	00700793          	li	a5,7
    3028:	02e7c063          	blt	a5,a4,3048 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    302c:	00271693          	slli	a3,a4,0x2
    3030:	ff000793          	li	a5,-16
    3034:	00d797b3          	sll	a5,a5,a3
    3038:	00f577b3          	and	a5,a0,a5
    303c:	00078663          	beqz	a5,3048 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    3040:	00170713          	addi	a4,a4,1
    3044:	fe1ff06f          	j	3024 <bsp_printf_X+0xc>
            bsp_printHex(val);
    3048:	e35ff0ef          	jal	2e7c <bsp_printHex>
        }
    304c:	00c12083          	lw	ra,12(sp)
    3050:	01010113          	addi	sp,sp,16
    3054:	00008067          	ret

00003058 <Set_RGBGain>:
	return rdata;
}

// Unified Set_RGBGain — camId selects which camera (0 = cam1, 1 = cam2)
static inline void Set_RGBGain(int camId, u8 ena, u8 R, u8 G, u8 B)
{
    3058:	ff010113          	addi	sp,sp,-16
    305c:	00112623          	sw	ra,12(sp)
	u32 data = ((B & 0x7) << 12) | ((G & 0x7) << 8) | ((R & 0x7) << 4) | (ena & 0x1);
    3060:	00c71713          	slli	a4,a4,0xc
    3064:	000077b7          	lui	a5,0x7
    3068:	00f77733          	and	a4,a4,a5
    306c:	00869693          	slli	a3,a3,0x8
    3070:	7006f693          	andi	a3,a3,1792
    3074:	00d76733          	or	a4,a4,a3
    3078:	00461613          	slli	a2,a2,0x4
    307c:	07067613          	andi	a2,a2,112
    3080:	00c76733          	or	a4,a4,a2
    3084:	0015f593          	andi	a1,a1,1
    3088:	00b76733          	or	a4,a4,a1
        *((volatile u32*) address) = data;
    308c:	f81007b7          	lui	a5,0xf8100
    3090:	00e7a023          	sw	a4,0(a5) # f8100000 <__freertos_irq_stack_top+0xf80fa760>
#else
	u32 offset = EXAMPLE_APB3_SLV_REG0_OFFSET; // single cam, camId ignored
#endif

	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, offset, data);
	bsp_uDelay(DELAY_BUSY);
    3094:	f8b00637          	lui	a2,0xf8b00
    3098:	05f5e5b7          	lui	a1,0x5f5e
    309c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f58860>
    30a0:	00500513          	li	a0,5
    30a4:	d51ff0ef          	jal	2df4 <clint_uDelay>
}
    30a8:	00c12083          	lw	ra,12(sp)
    30ac:	01010113          	addi	sp,sp,16
    30b0:	00008067          	ret

000030b4 <mipi_i2c_probe>:
// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    30b4:	ff010113          	addi	sp,sp,-16
    30b8:	00112623          	sw	ra,12(sp)
    30bc:	00812423          	sw	s0,8(sp)
    30c0:	00912223          	sw	s1,4(sp)
    30c4:	00050413          	mv	s0,a0
    30c8:	00058493          	mv	s1,a1
    i2c_masterStartBlocking(i2cCtrl);
    30cc:	c81ff0ef          	jal	2d4c <i2c_masterStartBlocking>
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    30d0:	000017b7          	lui	a5,0x1
    30d4:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    30d8:	00f4e4b3          	or	s1,s1,a5
    30dc:	00942023          	sw	s1,0(s0)
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    30e0:	00040513          	mv	a0,s0
    30e4:	c95ff0ef          	jal	2d78 <i2c_txNackBlocking>
    return i2c_rxAck(i2cCtrl);
    30e8:	00040513          	mv	a0,s0
    30ec:	cadff0ef          	jal	2d98 <i2c_rxAck>
}
    30f0:	00c12083          	lw	ra,12(sp)
    30f4:	00812403          	lw	s0,8(sp)
    30f8:	00412483          	lw	s1,4(sp)
    30fc:	01010113          	addi	sp,sp,16
    3100:	00008067          	ret

00003104 <bsp_printf>:
    {
    3104:	fc010113          	addi	sp,sp,-64
    3108:	00112e23          	sw	ra,28(sp)
    310c:	00812c23          	sw	s0,24(sp)
    3110:	00912a23          	sw	s1,20(sp)
    3114:	00050493          	mv	s1,a0
    3118:	02b12223          	sw	a1,36(sp)
    311c:	02c12423          	sw	a2,40(sp)
    3120:	02d12623          	sw	a3,44(sp)
    3124:	02e12823          	sw	a4,48(sp)
    3128:	02f12a23          	sw	a5,52(sp)
    312c:	03012c23          	sw	a6,56(sp)
    3130:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    3134:	02410793          	addi	a5,sp,36
    3138:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    313c:	00000413          	li	s0,0
    3140:	01c0006f          	j	315c <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    3144:	00c12783          	lw	a5,12(sp)
    3148:	00478713          	addi	a4,a5,4
    314c:	00e12623          	sw	a4,12(sp)
    3150:	0007a503          	lw	a0,0(a5)
    3154:	dd1ff0ef          	jal	2f24 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    3158:	00140413          	addi	s0,s0,1
    315c:	008487b3          	add	a5,s1,s0
    3160:	0007c503          	lbu	a0,0(a5)
    3164:	0a050e63          	beqz	a0,3220 <bsp_printf+0x11c>
            if (format[i] == '%') {
    3168:	02500793          	li	a5,37
    316c:	06f50e63          	beq	a0,a5,31e8 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    3170:	db5ff0ef          	jal	2f24 <bsp_printf_c>
    3174:	fe5ff06f          	j	3158 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    3178:	00c12783          	lw	a5,12(sp)
    317c:	00478713          	addi	a4,a5,4
    3180:	00e12623          	sw	a4,12(sp)
    3184:	0007a503          	lw	a0,0(a5)
    3188:	db9ff0ef          	jal	2f40 <bsp_printf_s>
                        break;
    318c:	fcdff06f          	j	3158 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    3190:	00c12783          	lw	a5,12(sp)
    3194:	00478713          	addi	a4,a5,4
    3198:	00e12623          	sw	a4,12(sp)
    319c:	0007a503          	lw	a0,0(a5)
    31a0:	db9ff0ef          	jal	2f58 <bsp_printf_d>
                        break;
    31a4:	fb5ff06f          	j	3158 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    31a8:	00c12783          	lw	a5,12(sp)
    31ac:	00478713          	addi	a4,a5,4
    31b0:	00e12623          	sw	a4,12(sp)
    31b4:	0007a503          	lw	a0,0(a5)
    31b8:	e61ff0ef          	jal	3018 <bsp_printf_X>
                        break;
    31bc:	f9dff06f          	j	3158 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    31c0:	00c12783          	lw	a5,12(sp)
    31c4:	00478713          	addi	a4,a5,4
    31c8:	00e12623          	sw	a4,12(sp)
    31cc:	0007a503          	lw	a0,0(a5)
    31d0:	e09ff0ef          	jal	2fd8 <bsp_printf_x>
                        break;
    31d4:	f85ff06f          	j	3158 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    31d8:	00004537          	lui	a0,0x4
    31dc:	bfc50513          	addi	a0,a0,-1028 # 3bfc <_data+0x28>
    31e0:	d61ff0ef          	jal	2f40 <bsp_printf_s>
                        break;
    31e4:	f75ff06f          	j	3158 <bsp_printf+0x54>
                while (format[++i]) {
    31e8:	00140413          	addi	s0,s0,1
    31ec:	008487b3          	add	a5,s1,s0
    31f0:	0007c783          	lbu	a5,0(a5)
    31f4:	f60782e3          	beqz	a5,3158 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    31f8:	fa878793          	addi	a5,a5,-88
    31fc:	0ff7f693          	zext.b	a3,a5
    3200:	02000713          	li	a4,32
    3204:	fed762e3          	bltu	a4,a3,31e8 <bsp_printf+0xe4>
    3208:	00269793          	slli	a5,a3,0x2
    320c:	00004737          	lui	a4,0x4
    3210:	29070713          	addi	a4,a4,656 # 4290 <_data+0x6bc>
    3214:	00e787b3          	add	a5,a5,a4
    3218:	0007a783          	lw	a5,0(a5)
    321c:	00078067          	jr	a5
    }
    3220:	01c12083          	lw	ra,28(sp)
    3224:	01812403          	lw	s0,24(sp)
    3228:	01412483          	lw	s1,20(sp)
    322c:	04010113          	addi	sp,sp,64
    3230:	00008067          	ret

00003234 <camera_init>:
// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    3234:	fe010113          	addi	sp,sp,-32
    3238:	00112e23          	sw	ra,28(sp)
    323c:	00812c23          	sw	s0,24(sp)
    3240:	00912a23          	sw	s1,20(sp)
    3244:	01212823          	sw	s2,16(sp)
    3248:	01312623          	sw	s3,12(sp)
    324c:	00050913          	mv	s2,a0
    3250:	00058493          	mv	s1,a1
    mipi_i2c_init(i2cCtrl);
    3254:	00058513          	mv	a0,a1
    3258:	9a1fe0ef          	jal	1bf8 <mipi_i2c_init>

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    325c:	00000413          	li	s0,0
    3260:	00100793          	li	a5,1
    3264:	1087e063          	bltu	a5,s0,3364 <camera_init+0x130>
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
    3268:	000047b7          	lui	a5,0x4
    326c:	00341713          	slli	a4,s0,0x3
    3270:	40870733          	sub	a4,a4,s0
    3274:	00271713          	slli	a4,a4,0x2
    3278:	31478793          	addi	a5,a5,788 # 4314 <supportedCamera>
    327c:	00e787b3          	add	a5,a5,a4
    3280:	0007c983          	lbu	s3,0(a5)
    3284:	00098593          	mv	a1,s3
    3288:	00048513          	mv	a0,s1
    328c:	e29ff0ef          	jal	30b4 <mipi_i2c_probe>
    3290:	00100793          	li	a5,1
    3294:	00f50663          	beq	a0,a5,32a0 <camera_init+0x6c>
    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3298:	00140413          	addi	s0,s0,1
    329c:	fc5ff06f          	j	3260 <camera_init+0x2c>
    32a0:	01412423          	sw	s4,8(sp)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
    32a4:	00004a37          	lui	s4,0x4
    32a8:	00341793          	slli	a5,s0,0x3
    32ac:	408787b3          	sub	a5,a5,s0
    32b0:	00279793          	slli	a5,a5,0x2
    32b4:	314a0a13          	addi	s4,s4,788 # 4314 <supportedCamera>
    32b8:	00fa0a33          	add	s4,s4,a5
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
    32bc:	0019d693          	srli	a3,s3,0x1
    32c0:	008a2603          	lw	a2,8(s4)
    32c4:	00090593          	mv	a1,s2
    32c8:	00004537          	lui	a0,0x4
    32cc:	0f450513          	addi	a0,a0,244 # 40f4 <_data+0x520>
    32d0:	e35ff0ef          	jal	3104 <bsp_printf>
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
    32d4:	00ca2783          	lw	a5,12(s4)
    32d8:	00078663          	beqz	a5,32e4 <camera_init+0xb0>
                supportedCamera[i].init(i2cCtrl);
    32dc:	00048513          	mv	a0,s1
    32e0:	000780e7          	jalr	a5

            if (supportedCamera[i].start_stream != NULL)
    32e4:	000047b7          	lui	a5,0x4
    32e8:	00341713          	slli	a4,s0,0x3
    32ec:	40870733          	sub	a4,a4,s0
    32f0:	00271713          	slli	a4,a4,0x2
    32f4:	31478793          	addi	a5,a5,788 # 4314 <supportedCamera>
    32f8:	00e787b3          	add	a5,a5,a4
    32fc:	0107a783          	lw	a5,16(a5)
    3300:	00078663          	beqz	a5,330c <camera_init+0xd8>
                supportedCamera[i].start_stream(i2cCtrl);
    3304:	00048513          	mv	a0,s1
    3308:	000780e7          	jalr	a5

            if (supportedCamera[i].set_rgb_gain != NULL)
    330c:	000047b7          	lui	a5,0x4
    3310:	00341713          	slli	a4,s0,0x3
    3314:	40870733          	sub	a4,a4,s0
    3318:	00271713          	slli	a4,a4,0x2
    331c:	31478793          	addi	a5,a5,788 # 4314 <supportedCamera>
    3320:	00e787b3          	add	a5,a5,a4
    3324:	0147a803          	lw	a6,20(a5)
    3328:	06080463          	beqz	a6,3390 <camera_init+0x15c>
                supportedCamera[i].set_rgb_gain(camSlot,
                                                supportedCamera[i].gain.ena,
    332c:	00004737          	lui	a4,0x4
    3330:	31470713          	addi	a4,a4,788 # 4314 <supportedCamera>
    3334:	00341693          	slli	a3,s0,0x3
    3338:	408687b3          	sub	a5,a3,s0
    333c:	00279793          	slli	a5,a5,0x2
    3340:	00f707b3          	add	a5,a4,a5
                supportedCamera[i].set_rgb_gain(camSlot,
    3344:	01b7c703          	lbu	a4,27(a5)
    3348:	01a7c683          	lbu	a3,26(a5)
    334c:	0197c603          	lbu	a2,25(a5)
    3350:	0187c583          	lbu	a1,24(a5)
    3354:	00090513          	mv	a0,s2
    3358:	000800e7          	jalr	a6
                                                supportedCamera[i].gain.R,
                                                supportedCamera[i].gain.G,
                                                supportedCamera[i].gain.B);

            return;
    335c:	00812a03          	lw	s4,8(sp)
    3360:	0140006f          	j	3374 <camera_init+0x140>
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
    3364:	00090593          	mv	a1,s2
    3368:	00004537          	lui	a0,0x4
    336c:	11c50513          	addi	a0,a0,284 # 411c <_data+0x548>
    3370:	d95ff0ef          	jal	3104 <bsp_printf>
}
    3374:	01c12083          	lw	ra,28(sp)
    3378:	01812403          	lw	s0,24(sp)
    337c:	01412483          	lw	s1,20(sp)
    3380:	01012903          	lw	s2,16(sp)
    3384:	00c12983          	lw	s3,12(sp)
    3388:	02010113          	addi	sp,sp,32
    338c:	00008067          	ret
    3390:	00812a03          	lw	s4,8(sp)
    3394:	fe1ff06f          	j	3374 <camera_init+0x140>

00003398 <cam0_init>:

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
    3398:	ff010113          	addi	sp,sp,-16
    339c:	00112623          	sw	ra,12(sp)
    33a0:	00050593          	mv	a1,a0
    33a4:	00000513          	li	a0,0
    33a8:	e8dff0ef          	jal	3234 <camera_init>
    33ac:	00c12083          	lw	ra,12(sp)
    33b0:	01010113          	addi	sp,sp,16
    33b4:	00008067          	ret

000033b8 <uart_writeAvailability>:
        return *((volatile u32*) address);
    33b8:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    33bc:	01055513          	srli	a0,a0,0x10
    }
    33c0:	0ff57513          	zext.b	a0,a0
    33c4:	00008067          	ret

000033c8 <uart_write>:
    static void uart_write(u32 reg, char data){
    33c8:	ff010113          	addi	sp,sp,-16
    33cc:	00112623          	sw	ra,12(sp)
    33d0:	00812423          	sw	s0,8(sp)
    33d4:	00912223          	sw	s1,4(sp)
    33d8:	00050413          	mv	s0,a0
    33dc:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    33e0:	00040513          	mv	a0,s0
    33e4:	fd5ff0ef          	jal	33b8 <uart_writeAvailability>
    33e8:	fe050ce3          	beqz	a0,33e0 <uart_write+0x18>
        *((volatile u32*) address) = data;
    33ec:	00942023          	sw	s1,0(s0)
    }
    33f0:	00c12083          	lw	ra,12(sp)
    33f4:	00812403          	lw	s0,8(sp)
    33f8:	00412483          	lw	s1,4(sp)
    33fc:	01010113          	addi	sp,sp,16
    3400:	00008067          	ret

00003404 <uart_writeStr>:
    static void uart_writeStr(u32 reg, const char* str){
    3404:	ff010113          	addi	sp,sp,-16
    3408:	00112623          	sw	ra,12(sp)
    340c:	00812423          	sw	s0,8(sp)
    3410:	00912223          	sw	s1,4(sp)
    3414:	00050493          	mv	s1,a0
    3418:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    341c:	0100006f          	j	342c <uart_writeStr+0x28>
    3420:	00140413          	addi	s0,s0,1
    3424:	00048513          	mv	a0,s1
    3428:	fa1ff0ef          	jal	33c8 <uart_write>
    342c:	00044583          	lbu	a1,0(s0)
    3430:	fe0598e3          	bnez	a1,3420 <uart_writeStr+0x1c>
    }
    3434:	00c12083          	lw	ra,12(sp)
    3438:	00812403          	lw	s0,8(sp)
    343c:	00412483          	lw	s1,4(sp)
    3440:	01010113          	addi	sp,sp,16
    3444:	00008067          	ret

00003448 <i2c_masterBusy>:
        return *((volatile u32*) address);
    3448:	04052503          	lw	a0,64(a0)
    }
    344c:	00157513          	andi	a0,a0,1
    3450:	00008067          	ret

00003454 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3454:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3458:	21000793          	li	a5,528
    345c:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3460:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3464:	0107f793          	andi	a5,a5,16
    3468:	fe079ce3          	bnez	a5,3460 <i2c_masterStartBlocking+0xc>
    }
    346c:	00008067          	ret

00003470 <i2c_masterStopWait>:
    static void i2c_masterStopWait(u32 reg){
    3470:	ff010113          	addi	sp,sp,-16
    3474:	00112623          	sw	ra,12(sp)
    3478:	00812423          	sw	s0,8(sp)
    347c:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3480:	00040513          	mv	a0,s0
    3484:	fc5ff0ef          	jal	3448 <i2c_masterBusy>
    3488:	fe051ce3          	bnez	a0,3480 <i2c_masterStopWait+0x10>
    }
    348c:	00c12083          	lw	ra,12(sp)
    3490:	00812403          	lw	s0,8(sp)
    3494:	01010113          	addi	sp,sp,16
    3498:	00008067          	ret

0000349c <i2c_masterStopBlocking>:
    static void i2c_masterStopBlocking(u32 reg){
    349c:	ff010113          	addi	sp,sp,-16
    34a0:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    34a4:	42000713          	li	a4,1056
    34a8:	04e52023          	sw	a4,64(a0)
        i2c_masterStopWait(reg);
    34ac:	fc5ff0ef          	jal	3470 <i2c_masterStopWait>
    }
    34b0:	00c12083          	lw	ra,12(sp)
    34b4:	01010113          	addi	sp,sp,16
    34b8:	00008067          	ret

000034bc <i2c_txAckWait>:
        return *((volatile u32*) address);
    34bc:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    34c0:	1007f793          	andi	a5,a5,256
    34c4:	fe079ce3          	bnez	a5,34bc <i2c_txAckWait>
    }
    34c8:	00008067          	ret

000034cc <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    34cc:	ff010113          	addi	sp,sp,-16
    34d0:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    34d4:	30100713          	li	a4,769
    34d8:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    34dc:	fe1ff0ef          	jal	34bc <i2c_txAckWait>
    }
    34e0:	00c12083          	lw	ra,12(sp)
    34e4:	01010113          	addi	sp,sp,16
    34e8:	00008067          	ret

000034ec <i2c_rxAck>:
        return *((volatile u32*) address);
    34ec:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    34f0:	0ff57513          	zext.b	a0,a0
    }
    34f4:	00153513          	seqz	a0,a0
    34f8:	00008067          	ret

000034fc <PiCamV3_WriteRegData>:
#include "riscv.h"
#include "PiCamV3Driver.h"
#include "common.h"

void PiCamV3_WriteRegData(u32 i2c_addr, u16 reg, u8 data)
{
    34fc:	fe010113          	addi	sp,sp,-32
    3500:	00112e23          	sw	ra,28(sp)
    3504:	00812c23          	sw	s0,24(sp)
    3508:	00912a23          	sw	s1,20(sp)
    350c:	01212823          	sw	s2,16(sp)
    3510:	01312623          	sw	s3,12(sp)
    3514:	00050413          	mv	s0,a0
    3518:	00058493          	mv	s1,a1
    351c:	00060913          	mv	s2,a2
	u8 outdata;

	i2c_masterStartBlocking(i2c_addr);
    3520:	f35ff0ef          	jal	3454 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    3524:	000017b7          	lui	a5,0x1
    3528:	b3478793          	addi	a5,a5,-1228 # b34 <CUSTOM2+0xad9>
    352c:	00f42023          	sw	a5,0(s0)

	i2c_txByte(i2c_addr, IMX708_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3530:	00040513          	mv	a0,s0
    3534:	f99ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3538:	00040513          	mv	a0,s0
    353c:	fb1ff0ef          	jal	34ec <i2c_rxAck>
    3540:	e68fe0ef          	jal	1ba8 <assert>

	i2c_txByte(i2c_addr, (reg >> 8) & 0xFF);
    3544:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3548:	000019b7          	lui	s3,0x1
    354c:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3550:	0137e7b3          	or	a5,a5,s3
    3554:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3558:	00040513          	mv	a0,s0
    355c:	f71ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3560:	00040513          	mv	a0,s0
    3564:	f89ff0ef          	jal	34ec <i2c_rxAck>
    3568:	e40fe0ef          	jal	1ba8 <assert>

	i2c_txByte(i2c_addr, (reg) & 0xFF);
    356c:	0ff4f493          	zext.b	s1,s1
    3570:	0134e4b3          	or	s1,s1,s3
    3574:	00942023          	sw	s1,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3578:	00040513          	mv	a0,s0
    357c:	f51ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3580:	00040513          	mv	a0,s0
    3584:	f69ff0ef          	jal	34ec <i2c_rxAck>
    3588:	e20fe0ef          	jal	1ba8 <assert>
    358c:	01396933          	or	s2,s2,s3
    3590:	01242023          	sw	s2,0(s0)

	i2c_txByte(i2c_addr, data & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3594:	00040513          	mv	a0,s0
    3598:	f35ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    359c:	00040513          	mv	a0,s0
    35a0:	f4dff0ef          	jal	34ec <i2c_rxAck>
    35a4:	e04fe0ef          	jal	1ba8 <assert>

	i2c_masterStopBlocking(i2c_addr);
    35a8:	00040513          	mv	a0,s0
    35ac:	ef1ff0ef          	jal	349c <i2c_masterStopBlocking>
}
    35b0:	01c12083          	lw	ra,28(sp)
    35b4:	01812403          	lw	s0,24(sp)
    35b8:	01412483          	lw	s1,20(sp)
    35bc:	01012903          	lw	s2,16(sp)
    35c0:	00c12983          	lw	s3,12(sp)
    35c4:	02010113          	addi	sp,sp,32
    35c8:	00008067          	ret

000035cc <PiCamV3_StartStreaming>:

	return outdata;
}

void PiCamV3_StartStreaming(u32 i2c_addr)
{
    35cc:	ff010113          	addi	sp,sp,-16
    35d0:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_ACTIVE);
    35d4:	00100613          	li	a2,1
    35d8:	10000593          	li	a1,256
    35dc:	f21ff0ef          	jal	34fc <PiCamV3_WriteRegData>
}
    35e0:	00c12083          	lw	ra,12(sp)
    35e4:	01010113          	addi	sp,sp,16
    35e8:	00008067          	ret

000035ec <PiCamV3_StopStreaming>:

void PiCamV3_StopStreaming(u32 i2c_addr)
{
    35ec:	ff010113          	addi	sp,sp,-16
    35f0:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_SLEEP);
    35f4:	00000613          	li	a2,0
    35f8:	10000593          	li	a1,256
    35fc:	f01ff0ef          	jal	34fc <PiCamV3_WriteRegData>
}
    3600:	00c12083          	lw	ra,12(sp)
    3604:	01010113          	addi	sp,sp,16
    3608:	00008067          	ret

0000360c <PiCamV3_ConfigCommon>:

void PiCamV3_ConfigCommon(u32 i2c_addr)
{
    360c:	ff010113          	addi	sp,sp,-16
    3610:	00112623          	sw	ra,12(sp)
    3614:	00812423          	sw	s0,8(sp)
    3618:	00912223          	sw	s1,4(sp)
    361c:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3620:	00000413          	li	s0,0
    3624:	0280006f          	j	364c <PiCamV3_ConfigCommon+0x40>
	{
		PiCamV3_WriteRegData(i2c_addr, mode_common_regs[i].address, mode_common_regs[i].val);
    3628:	000047b7          	lui	a5,0x4
    362c:	00241713          	slli	a4,s0,0x2
    3630:	7b478793          	addi	a5,a5,1972 # 47b4 <mode_common_regs>
    3634:	00e787b3          	add	a5,a5,a4
    3638:	0027c603          	lbu	a2,2(a5)
    363c:	0007d583          	lhu	a1,0(a5)
    3640:	00048513          	mv	a0,s1
    3644:	eb9ff0ef          	jal	34fc <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3648:	00140413          	addi	s0,s0,1
    364c:	02f00793          	li	a5,47
    3650:	fc87fce3          	bgeu	a5,s0,3628 <PiCamV3_ConfigCommon+0x1c>
	}
}
    3654:	00c12083          	lw	ra,12(sp)
    3658:	00812403          	lw	s0,8(sp)
    365c:	00412483          	lw	s1,4(sp)
    3660:	01010113          	addi	sp,sp,16
    3664:	00008067          	ret

00003668 <PiCamV3_ConfigFormat>:

void PiCamV3_ConfigFormat(u32 i2c_addr, u8 mode)
{
    3668:	ff010113          	addi	sp,sp,-16
    366c:	00112623          	sw	ra,12(sp)
    3670:	00912223          	sw	s1,4(sp)
    3674:	00050493          	mv	s1,a0
	// 	MODE
	//  0 : 1920 x 1080 cropped, 50FPS
	//	1 : 1920 x 1080 2x2 binned, 60 FPS
	//  2 : 1920 x 1080 HDR, 50 FPS

	if (mode == 0)
    3678:	08058663          	beqz	a1,3704 <PiCamV3_ConfigFormat+0x9c>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
		}
	}

	else if (mode == 1)
    367c:	00100793          	li	a5,1
    3680:	0cf58263          	beq	a1,a5,3744 <PiCamV3_ConfigFormat+0xdc>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
		}
	}

	else if (mode == 2)
    3684:	00200793          	li	a5,2
    3688:	06f59663          	bne	a1,a5,36f4 <PiCamV3_ConfigFormat+0x8c>
    368c:	00812423          	sw	s0,8(sp)
	{
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3690:	00000413          	li	s0,0
    3694:	05e00793          	li	a5,94
    3698:	0a87ec63          	bltu	a5,s0,3750 <PiCamV3_ConfigFormat+0xe8>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_hdr_1920x1080_regs[i].address, mode_hdr_1920x1080_regs[i].val);
    369c:	000047b7          	lui	a5,0x4
    36a0:	00241713          	slli	a4,s0,0x2
    36a4:	36078793          	addi	a5,a5,864 # 4360 <mode_hdr_1920x1080_regs>
    36a8:	00e787b3          	add	a5,a5,a4
    36ac:	0027c603          	lbu	a2,2(a5)
    36b0:	0007d583          	lhu	a1,0(a5)
    36b4:	00048513          	mv	a0,s1
    36b8:	e45ff0ef          	jal	34fc <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    36bc:	00140413          	addi	s0,s0,1
    36c0:	fd5ff06f          	j	3694 <PiCamV3_ConfigFormat+0x2c>
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
    36c4:	000047b7          	lui	a5,0x4
    36c8:	00241713          	slli	a4,s0,0x2
    36cc:	64878793          	addi	a5,a5,1608 # 4648 <mode_1920x1080_cropped_regs>
    36d0:	00e787b3          	add	a5,a5,a4
    36d4:	0027c603          	lbu	a2,2(a5)
    36d8:	0007d583          	lhu	a1,0(a5)
    36dc:	00048513          	mv	a0,s1
    36e0:	e1dff0ef          	jal	34fc <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    36e4:	00140413          	addi	s0,s0,1
    36e8:	05a00793          	li	a5,90
    36ec:	fc87fce3          	bgeu	a5,s0,36c4 <PiCamV3_ConfigFormat+0x5c>
    36f0:	00812403          	lw	s0,8(sp)
		}
	}
}
    36f4:	00c12083          	lw	ra,12(sp)
    36f8:	00412483          	lw	s1,4(sp)
    36fc:	01010113          	addi	sp,sp,16
    3700:	00008067          	ret
    3704:	00812423          	sw	s0,8(sp)
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3708:	00000413          	li	s0,0
    370c:	fddff06f          	j	36e8 <PiCamV3_ConfigFormat+0x80>
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
    3710:	000047b7          	lui	a5,0x4
    3714:	00241713          	slli	a4,s0,0x2
    3718:	4dc78793          	addi	a5,a5,1244 # 44dc <mode_2x2binned_1920x1080_regs>
    371c:	00e787b3          	add	a5,a5,a4
    3720:	0027c603          	lbu	a2,2(a5)
    3724:	0007d583          	lhu	a1,0(a5)
    3728:	00048513          	mv	a0,s1
    372c:	dd1ff0ef          	jal	34fc <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_2x2binned_1920x1080_regs) / sizeof(mode_2x2binned_1920x1080_regs[0]); i++)
    3730:	00140413          	addi	s0,s0,1
    3734:	05a00793          	li	a5,90
    3738:	fc87fce3          	bgeu	a5,s0,3710 <PiCamV3_ConfigFormat+0xa8>
    373c:	00812403          	lw	s0,8(sp)
    3740:	fb5ff06f          	j	36f4 <PiCamV3_ConfigFormat+0x8c>
    3744:	00812423          	sw	s0,8(sp)
    3748:	00000413          	li	s0,0
    374c:	fe9ff06f          	j	3734 <PiCamV3_ConfigFormat+0xcc>
    3750:	00812403          	lw	s0,8(sp)
    3754:	fa1ff06f          	j	36f4 <PiCamV3_ConfigFormat+0x8c>

00003758 <PiCamV3_ConfigLinkFreq>:

void PiCamV3_ConfigLinkFreq(u32 i2c_addr)
{
    3758:	ff010113          	addi	sp,sp,-16
    375c:	00112623          	sw	ra,12(sp)
    3760:	00812423          	sw	s0,8(sp)
    3764:	00912223          	sw	s1,4(sp)
    3768:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    376c:	00000413          	li	s0,0
    3770:	0240006f          	j	3794 <PiCamV3_ConfigLinkFreq+0x3c>
	{
		PiCamV3_WriteRegData(i2c_addr, link_450Mhz_regs[i].address, link_450Mhz_regs[i].val);
    3774:	00241713          	slli	a4,s0,0x2
    3778:	81018793          	addi	a5,gp,-2032 # 4878 <link_450Mhz_regs>
    377c:	00e787b3          	add	a5,a5,a4
    3780:	0027c603          	lbu	a2,2(a5)
    3784:	0007d583          	lhu	a1,0(a5)
    3788:	00048513          	mv	a0,s1
    378c:	d71ff0ef          	jal	34fc <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    3790:	00140413          	addi	s0,s0,1
    3794:	00100793          	li	a5,1
    3798:	fc87fee3          	bgeu	a5,s0,3774 <PiCamV3_ConfigLinkFreq+0x1c>
	}
}
    379c:	00c12083          	lw	ra,12(sp)
    37a0:	00812403          	lw	s0,8(sp)
    37a4:	00412483          	lw	s1,4(sp)
    37a8:	01010113          	addi	sp,sp,16
    37ac:	00008067          	ret

000037b0 <PiCamV3_ConfigQuadBayerRemosaicAdjustment>:

void PiCamV3_ConfigQuadBayerRemosaicAdjustment(u32 i2c_addr)
{
    37b0:	ff010113          	addi	sp,sp,-16
    37b4:	00112623          	sw	ra,12(sp)
    37b8:	00812423          	sw	s0,8(sp)
    37bc:	00050413          	mv	s0,a0
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED);
    37c0:	00000613          	li	a2,0
    37c4:	0000c5b7          	lui	a1,0xc
    37c8:	42858593          	addi	a1,a1,1064 # c428 <__freertos_irq_stack_top+0x6b88>
    37cc:	d31ff0ef          	jal	34fc <PiCamV3_WriteRegData>
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY, 0x04);
    37d0:	00400613          	li	a2,4
    37d4:	0000c5b7          	lui	a1,0xc
    37d8:	42958593          	addi	a1,a1,1065 # c429 <__freertos_irq_stack_top+0x6b89>
    37dc:	00040513          	mv	a0,s0
    37e0:	d1dff0ef          	jal	34fc <PiCamV3_WriteRegData>
}
    37e4:	00c12083          	lw	ra,12(sp)
    37e8:	00812403          	lw	s0,8(sp)
    37ec:	01010113          	addi	sp,sp,16
    37f0:	00008067          	ret

000037f4 <PiCamV3_SetPdafGain>:

void PiCamV3_SetPdafGain(u32 i2c_addr)
{
    37f4:	fe010113          	addi	sp,sp,-32
    37f8:	00112e23          	sw	ra,28(sp)
    37fc:	00812c23          	sw	s0,24(sp)
    3800:	00912a23          	sw	s1,20(sp)
    3804:	01212823          	sw	s2,16(sp)
    3808:	01312623          	sw	s3,12(sp)
    380c:	00050993          	mv	s3,a0
	for (int i = 0; i < 54; i++)
    3810:	00000493          	li	s1,0
    3814:	0640006f          	j	3878 <PiCamV3_SetPdafGain+0x84>
	{
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_L + i, pdaf_gains[0][i % 9]);
    3818:	01049913          	slli	s2,s1,0x10
    381c:	01095913          	srli	s2,s2,0x10
    3820:	00900793          	li	a5,9
    3824:	02f4e7b3          	rem	a5,s1,a5
    3828:	00004437          	lui	s0,0x4
    382c:	34c40413          	addi	s0,s0,844 # 434c <pdaf_gains>
    3830:	00f40433          	add	s0,s0,a5
    3834:	000085b7          	lui	a1,0x8
    3838:	b1058593          	addi	a1,a1,-1264 # 7b10 <__freertos_irq_stack_top+0x2270>
    383c:	00b905b3          	add	a1,s2,a1
    3840:	00044603          	lbu	a2,0(s0)
    3844:	01059593          	slli	a1,a1,0x10
    3848:	0105d593          	srli	a1,a1,0x10
    384c:	00098513          	mv	a0,s3
    3850:	cadff0ef          	jal	34fc <PiCamV3_WriteRegData>
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_R + i, pdaf_gains[1][i % 9]);
    3854:	000087b7          	lui	a5,0x8
    3858:	c0078793          	addi	a5,a5,-1024 # 7c00 <__freertos_irq_stack_top+0x2360>
    385c:	00f905b3          	add	a1,s2,a5
    3860:	00944603          	lbu	a2,9(s0)
    3864:	01059593          	slli	a1,a1,0x10
    3868:	0105d593          	srli	a1,a1,0x10
    386c:	00098513          	mv	a0,s3
    3870:	c8dff0ef          	jal	34fc <PiCamV3_WriteRegData>
	for (int i = 0; i < 54; i++)
    3874:	00148493          	addi	s1,s1,1
    3878:	03500793          	li	a5,53
    387c:	f897dee3          	bge	a5,s1,3818 <PiCamV3_SetPdafGain+0x24>
	}
}
    3880:	01c12083          	lw	ra,28(sp)
    3884:	01812403          	lw	s0,24(sp)
    3888:	01412483          	lw	s1,20(sp)
    388c:	01012903          	lw	s2,16(sp)
    3890:	00c12983          	lw	s3,12(sp)
    3894:	02010113          	addi	sp,sp,32
    3898:	00008067          	ret

0000389c <PiCamV3_OnActuator>:
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN, (val & 0xFF00) >> 8);
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN + 1, val & 0xFF);
}

void PiCamV3_OnActuator(u32 i2c_addr)
{
    389c:	ff010113          	addi	sp,sp,-16
    38a0:	00112623          	sw	ra,12(sp)
    38a4:	00812423          	sw	s0,8(sp)
    38a8:	00050413          	mv	s0,a0
	// Turn on actuator
	i2c_masterStartBlocking(i2c_addr);
    38ac:	ba9ff0ef          	jal	3454 <i2c_masterStartBlocking>
    38b0:	000017b7          	lui	a5,0x1
    38b4:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    38b8:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    38bc:	00040513          	mv	a0,s0
    38c0:	c0dff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    38c4:	00040513          	mv	a0,s0
    38c8:	c25ff0ef          	jal	34ec <i2c_rxAck>
    38cc:	adcfe0ef          	jal	1ba8 <assert>
    38d0:	000017b7          	lui	a5,0x1
    38d4:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    38d8:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    38dc:	00040513          	mv	a0,s0
    38e0:	bedff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    38e4:	00040513          	mv	a0,s0
    38e8:	c05ff0ef          	jal	34ec <i2c_rxAck>
    38ec:	abcfe0ef          	jal	1ba8 <assert>
    38f0:	000017b7          	lui	a5,0x1
    38f4:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    38f8:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_ACTIVE);
	i2c_txNackBlocking(i2c_addr);
    38fc:	00040513          	mv	a0,s0
    3900:	bcdff0ef          	jal	34cc <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    3904:	00040513          	mv	a0,s0
    3908:	b95ff0ef          	jal	349c <i2c_masterStopBlocking>
}
    390c:	00c12083          	lw	ra,12(sp)
    3910:	00812403          	lw	s0,8(sp)
    3914:	01010113          	addi	sp,sp,16
    3918:	00008067          	ret

0000391c <PiCamV3_OffActuator>:

void PiCamV3_OffActuator(u32 i2c_addr)
{
    391c:	ff010113          	addi	sp,sp,-16
    3920:	00112623          	sw	ra,12(sp)
    3924:	00812423          	sw	s0,8(sp)
    3928:	00050413          	mv	s0,a0
	// Turn off actuator
	i2c_masterStartBlocking(i2c_addr);
    392c:	b29ff0ef          	jal	3454 <i2c_masterStartBlocking>
    3930:	000017b7          	lui	a5,0x1
    3934:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    3938:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    393c:	00040513          	mv	a0,s0
    3940:	b8dff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3944:	00040513          	mv	a0,s0
    3948:	ba5ff0ef          	jal	34ec <i2c_rxAck>
    394c:	a5cfe0ef          	jal	1ba8 <assert>
    3950:	000017b7          	lui	a5,0x1
    3954:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    3958:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    395c:	00040513          	mv	a0,s0
    3960:	b6dff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3964:	00040513          	mv	a0,s0
    3968:	b85ff0ef          	jal	34ec <i2c_rxAck>
    396c:	a3cfe0ef          	jal	1ba8 <assert>
    3970:	000017b7          	lui	a5,0x1
    3974:	b0178793          	addi	a5,a5,-1279 # b01 <CUSTOM2+0xaa6>
    3978:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_SLEEP);
	i2c_txNackBlocking(i2c_addr);
    397c:	00040513          	mv	a0,s0
    3980:	b4dff0ef          	jal	34cc <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    3984:	00040513          	mv	a0,s0
    3988:	b15ff0ef          	jal	349c <i2c_masterStopBlocking>
}
    398c:	00c12083          	lw	ra,12(sp)
    3990:	00812403          	lw	s0,8(sp)
    3994:	01010113          	addi	sp,sp,16
    3998:	00008067          	ret

0000399c <PiCamV3_SetFocusStep>:

void PiCamV3_SetFocusStep(u32 i2c_addr, u32 focus_step)
{
    399c:	fe010113          	addi	sp,sp,-32
    39a0:	00112e23          	sw	ra,28(sp)
    39a4:	00812c23          	sw	s0,24(sp)
    39a8:	00912a23          	sw	s1,20(sp)
    39ac:	01212823          	sw	s2,16(sp)
    39b0:	01312623          	sw	s3,12(sp)
    39b4:	00050413          	mv	s0,a0
    39b8:	00058493          	mv	s1,a1
	if (focus_step >= DW9807_MAX_FOCUS_POS)
    39bc:	3fe00793          	li	a5,1022
    39c0:	00b7f463          	bgeu	a5,a1,39c8 <PiCamV3_SetFocusStep+0x2c>
		focus_step = DW9807_MAX_FOCUS_POS;
    39c4:	3ff00493          	li	s1,1023
	else if (focus_step <= 0)
		focus_step = 0;

	i2c_masterStartBlocking(i2c_addr);
    39c8:	00040513          	mv	a0,s0
    39cc:	a89ff0ef          	jal	3454 <i2c_masterStartBlocking>
    39d0:	000019b7          	lui	s3,0x1
    39d4:	b1898993          	addi	s3,s3,-1256 # b18 <CUSTOM2+0xabd>
    39d8:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    39dc:	00040513          	mv	a0,s0
    39e0:	aedff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    39e4:	00040513          	mv	a0,s0
    39e8:	b05ff0ef          	jal	34ec <i2c_rxAck>
    39ec:	9bcfe0ef          	jal	1ba8 <assert>
    39f0:	000017b7          	lui	a5,0x1
    39f4:	b0378793          	addi	a5,a5,-1277 # b03 <CUSTOM2+0xaa8>
    39f8:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_MSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    39fc:	00040513          	mv	a0,s0
    3a00:	acdff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3a04:	00040513          	mv	a0,s0
    3a08:	ae5ff0ef          	jal	34ec <i2c_rxAck>
    3a0c:	99cfe0ef          	jal	1ba8 <assert>
	i2c_txByte(i2c_addr, (focus_step >> 8) & 0x03);
    3a10:	0084d793          	srli	a5,s1,0x8
    3a14:	0037f793          	andi	a5,a5,3
    3a18:	00001937          	lui	s2,0x1
    3a1c:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
    3a20:	0127e7b3          	or	a5,a5,s2
    3a24:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3a28:	00040513          	mv	a0,s0
    3a2c:	aa1ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3a30:	00040513          	mv	a0,s0
    3a34:	ab9ff0ef          	jal	34ec <i2c_rxAck>
    3a38:	970fe0ef          	jal	1ba8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    3a3c:	00040513          	mv	a0,s0
    3a40:	a5dff0ef          	jal	349c <i2c_masterStopBlocking>

	i2c_masterStartBlocking(i2c_addr);
    3a44:	00040513          	mv	a0,s0
    3a48:	a0dff0ef          	jal	3454 <i2c_masterStartBlocking>
    3a4c:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3a50:	00040513          	mv	a0,s0
    3a54:	a79ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3a58:	00040513          	mv	a0,s0
    3a5c:	a91ff0ef          	jal	34ec <i2c_rxAck>
    3a60:	948fe0ef          	jal	1ba8 <assert>
    3a64:	000017b7          	lui	a5,0x1
    3a68:	b0478793          	addi	a5,a5,-1276 # b04 <CUSTOM2+0xaa9>
    3a6c:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_LSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    3a70:	00040513          	mv	a0,s0
    3a74:	a59ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3a78:	00040513          	mv	a0,s0
    3a7c:	a71ff0ef          	jal	34ec <i2c_rxAck>
    3a80:	928fe0ef          	jal	1ba8 <assert>
    3a84:	0ff4f493          	zext.b	s1,s1
    3a88:	0124e4b3          	or	s1,s1,s2
    3a8c:	00942023          	sw	s1,0(s0)
	i2c_txByte(i2c_addr, focus_step & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3a90:	00040513          	mv	a0,s0
    3a94:	a39ff0ef          	jal	34cc <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3a98:	00040513          	mv	a0,s0
    3a9c:	a51ff0ef          	jal	34ec <i2c_rxAck>
    3aa0:	908fe0ef          	jal	1ba8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    3aa4:	00040513          	mv	a0,s0
    3aa8:	9f5ff0ef          	jal	349c <i2c_masterStopBlocking>
}
    3aac:	01c12083          	lw	ra,28(sp)
    3ab0:	01812403          	lw	s0,24(sp)
    3ab4:	01412483          	lw	s1,20(sp)
    3ab8:	01012903          	lw	s2,16(sp)
    3abc:	00c12983          	lw	s3,12(sp)
    3ac0:	02010113          	addi	sp,sp,32
    3ac4:	00008067          	ret

00003ac8 <PiCamV3_Init>:
	PiCamV3_WriteRegData(IMX708_REG_TEST_PATTERN, IMX708_TEST_PATTERN_SOLID_COLOR);
}
*/

void PiCamV3_Init(u32 i2c_addr)
{
    3ac8:	ff010113          	addi	sp,sp,-16
    3acc:	00112623          	sw	ra,12(sp)
    3ad0:	00812423          	sw	s0,8(sp)
    3ad4:	00050413          	mv	s0,a0

	PiCamV3_StopStreaming(i2c_addr);
    3ad8:	b15ff0ef          	jal	35ec <PiCamV3_StopStreaming>

	PiCamV3_ConfigCommon(i2c_addr);
    3adc:	00040513          	mv	a0,s0
    3ae0:	b2dff0ef          	jal	360c <PiCamV3_ConfigCommon>

	PiCamV3_SetPdafGain(i2c_addr);
    3ae4:	00040513          	mv	a0,s0
    3ae8:	d0dff0ef          	jal	37f4 <PiCamV3_SetPdafGain>

	PiCamV3_ConfigFormat(i2c_addr, 1);
    3aec:	00100593          	li	a1,1
    3af0:	00040513          	mv	a0,s0
    3af4:	b75ff0ef          	jal	3668 <PiCamV3_ConfigFormat>

	PiCamV3_ConfigLinkFreq(i2c_addr);
    3af8:	00040513          	mv	a0,s0
    3afc:	c5dff0ef          	jal	3758 <PiCamV3_ConfigLinkFreq>

	PiCamV3_ConfigQuadBayerRemosaicAdjustment(i2c_addr);
    3b00:	00040513          	mv	a0,s0
    3b04:	cadff0ef          	jal	37b0 <PiCamV3_ConfigQuadBayerRemosaicAdjustment>

	PiCamV3_OnActuator(i2c_addr);
    3b08:	00040513          	mv	a0,s0
    3b0c:	d91ff0ef          	jal	389c <PiCamV3_OnActuator>

	PiCamV3_SetFocusStep(i2c_addr, 700);
    3b10:	2bc00593          	li	a1,700
    3b14:	00040513          	mv	a0,s0
    3b18:	e85ff0ef          	jal	399c <PiCamV3_SetFocusStep>

	PiCamV3_OffActuator(i2c_addr);
    3b1c:	00040513          	mv	a0,s0
    3b20:	dfdff0ef          	jal	391c <PiCamV3_OffActuator>

	//	PiCamV3_StartStreaming();

	uart_writeStr(BSP_UART_TERMINAL, "\n\rDone Camera Init");
    3b24:	000045b7          	lui	a1,0x4
    3b28:	15c58593          	addi	a1,a1,348 # 415c <_data+0x588>
    3b2c:	f8010537          	lui	a0,0xf8010
    3b30:	8d5ff0ef          	jal	3404 <uart_writeStr>
}
    3b34:	00c12083          	lw	ra,12(sp)
    3b38:	00812403          	lw	s0,8(sp)
    3b3c:	01010113          	addi	sp,sp,16
    3b40:	00008067          	ret

00003b44 <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
    3b44:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
    3b48:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    3b4c:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    3b50:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    3b54:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    3b58:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    3b5c:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    3b60:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    3b64:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    3b68:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    3b6c:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    3b70:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    3b74:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    3b78:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    3b7c:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    3b80:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    3b84:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
    3b88:	ef5fd0ef          	jal	1a7c <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
    3b8c:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    3b90:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    3b94:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    3b98:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    3b9c:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    3ba0:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    3ba4:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    3ba8:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    3bac:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    3bb0:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    3bb4:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    3bb8:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    3bbc:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    3bc0:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    3bc4:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    3bc8:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
    3bcc:	04010113          	addi	sp,sp,64
#endif
    3bd0:	30200073          	mret
