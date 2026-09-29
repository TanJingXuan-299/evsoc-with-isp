
build/evsoc_ispExample_demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00005197          	auipc	gp,0x5
    1004:	e9818193          	addi	gp,gp,-360 # 5e98 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00006117          	auipc	sp,0x6
    100c:	85810113          	addi	sp,sp,-1960 # 6860 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00003517          	auipc	a0,0x3
    1014:	36c50513          	addi	a0,a0,876 # 437c <_data>
	la a1, _data
    1018:	00003597          	auipc	a1,0x3
    101c:	36458593          	addi	a1,a1,868 # 437c <_data>
	la a2, _edata
    1020:	00004617          	auipc	a2,0x4
    1024:	6a460613          	addi	a2,a2,1700 # 56c4 <uart_cmd_ready>
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
    1044:	68450513          	addi	a0,a0,1668 # 56c4 <uart_cmd_ready>
	la a1, _end
    1048:	00005597          	auipc	a1,0x5
    104c:	81058593          	addi	a1,a1,-2032 # 5858 <_end>
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
    1060:	21c000ef          	jal	127c <__libc_init_array>
#endif

	call main
    1064:	2ac000ef          	jal	1310 <main>

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

00001070 <atoi>:
    1070:	00a00613          	li	a2,10
    1074:	00000593          	li	a1,0
    1078:	1e80006f          	j	1260 <strtol>

0000107c <_strtol_l.isra.0>:
    107c:	ff010113          	addi	sp,sp,-16
    1080:	00112623          	sw	ra,12(sp)
    1084:	02400793          	li	a5,36
    1088:	0cd7e663          	bltu	a5,a3,1154 <_strtol_l.isra.0+0xd8>
    108c:	00100713          	li	a4,1
    1090:	00068293          	mv	t0,a3
    1094:	00058793          	mv	a5,a1
    1098:	00004897          	auipc	a7,0x4
    109c:	3c988893          	addi	a7,a7,969 # 5461 <_ctype_+0x1>
    10a0:	0ae68a63          	beq	a3,a4,1154 <_strtol_l.isra.0+0xd8>
    10a4:	00812423          	sw	s0,8(sp)
    10a8:	00912223          	sw	s1,4(sp)
    10ac:	0007c803          	lbu	a6,0(a5)
    10b0:	00078313          	mv	t1,a5
    10b4:	00178793          	addi	a5,a5,1
    10b8:	01088733          	add	a4,a7,a6
    10bc:	00074703          	lbu	a4,0(a4)
    10c0:	00877713          	andi	a4,a4,8
    10c4:	fe0714e3          	bnez	a4,10ac <_strtol_l.isra.0+0x30>
    10c8:	02d00713          	li	a4,45
    10cc:	14e80e63          	beq	a6,a4,1228 <_strtol_l.isra.0+0x1ac>
    10d0:	02b00713          	li	a4,43
    10d4:	08e80e63          	beq	a6,a4,1170 <_strtol_l.isra.0+0xf4>
    10d8:	800003b7          	lui	t2,0x80000
    10dc:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff979f>
    10e0:	00000493          	li	s1,0
    10e4:	0a069263          	bnez	a3,1188 <_strtol_l.isra.0+0x10c>
    10e8:	03000713          	li	a4,48
    10ec:	14e80863          	beq	a6,a4,123c <_strtol_l.isra.0+0x1c0>
    10f0:	00a00293          	li	t0,10
    10f4:	00a00693          	li	a3,10
    10f8:	0253f433          	remu	s0,t2,t0
    10fc:	00000313          	li	t1,0
    1100:	00000893          	li	a7,0
    1104:	00900e13          	li	t3,9
    1108:	01900f93          	li	t6,25
    110c:	fff00e93          	li	t4,-1
    1110:	0253df33          	divu	t5,t2,t0
    1114:	fd080713          	addi	a4,a6,-48
    1118:	00ee7863          	bgeu	t3,a4,1128 <_strtol_l.isra.0+0xac>
    111c:	fbf80713          	addi	a4,a6,-65
    1120:	0aefe063          	bltu	t6,a4,11c0 <_strtol_l.isra.0+0x144>
    1124:	fc980713          	addi	a4,a6,-55
    1128:	0ad75463          	bge	a4,a3,11d0 <_strtol_l.isra.0+0x154>
    112c:	01d30e63          	beq	t1,t4,1148 <_strtol_l.isra.0+0xcc>
    1130:	fff00313          	li	t1,-1
    1134:	011f6a63          	bltu	t5,a7,1148 <_strtol_l.isra.0+0xcc>
    1138:	0d1f0663          	beq	t5,a7,1204 <_strtol_l.isra.0+0x188>
    113c:	00100313          	li	t1,1
    1140:	025888b3          	mul	a7,a7,t0
    1144:	011708b3          	add	a7,a4,a7
    1148:	00178793          	addi	a5,a5,1
    114c:	fff7c803          	lbu	a6,-1(a5)
    1150:	fc5ff06f          	j	1114 <_strtol_l.isra.0+0x98>
    1154:	120000ef          	jal	1274 <__errno>
    1158:	00c12083          	lw	ra,12(sp)
    115c:	01600793          	li	a5,22
    1160:	00f52023          	sw	a5,0(a0)
    1164:	00000513          	li	a0,0
    1168:	01010113          	addi	sp,sp,16
    116c:	00008067          	ret
    1170:	800003b7          	lui	t2,0x80000
    1174:	0007c803          	lbu	a6,0(a5)
    1178:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff979f>
    117c:	00230793          	addi	a5,t1,2
    1180:	00000493          	li	s1,0
    1184:	f60682e3          	beqz	a3,10e8 <_strtol_l.isra.0+0x6c>
    1188:	01000713          	li	a4,16
    118c:	f6e696e3          	bne	a3,a4,10f8 <_strtol_l.isra.0+0x7c>
    1190:	03000713          	li	a4,48
    1194:	01000293          	li	t0,16
    1198:	f6e810e3          	bne	a6,a4,10f8 <_strtol_l.isra.0+0x7c>
    119c:	0007c703          	lbu	a4,0(a5)
    11a0:	05800893          	li	a7,88
    11a4:	0df77713          	andi	a4,a4,223
    11a8:	f51718e3          	bne	a4,a7,10f8 <_strtol_l.isra.0+0x7c>
    11ac:	0017c803          	lbu	a6,1(a5)
    11b0:	01000293          	li	t0,16
    11b4:	00278793          	addi	a5,a5,2
    11b8:	01000693          	li	a3,16
    11bc:	f3dff06f          	j	10f8 <_strtol_l.isra.0+0x7c>
    11c0:	f9f80713          	addi	a4,a6,-97
    11c4:	00efe663          	bltu	t6,a4,11d0 <_strtol_l.isra.0+0x154>
    11c8:	fa980713          	addi	a4,a6,-87
    11cc:	f6d740e3          	blt	a4,a3,112c <_strtol_l.isra.0+0xb0>
    11d0:	fff00713          	li	a4,-1
    11d4:	02e30c63          	beq	t1,a4,120c <_strtol_l.isra.0+0x190>
    11d8:	00048463          	beqz	s1,11e0 <_strtol_l.isra.0+0x164>
    11dc:	411008b3          	neg	a7,a7
    11e0:	00060663          	beqz	a2,11ec <_strtol_l.isra.0+0x170>
    11e4:	06031a63          	bnez	t1,1258 <_strtol_l.isra.0+0x1dc>
    11e8:	00b62023          	sw	a1,0(a2)
    11ec:	00812403          	lw	s0,8(sp)
    11f0:	00c12083          	lw	ra,12(sp)
    11f4:	00412483          	lw	s1,4(sp)
    11f8:	00088513          	mv	a0,a7
    11fc:	01010113          	addi	sp,sp,16
    1200:	00008067          	ret
    1204:	f4e442e3          	blt	s0,a4,1148 <_strtol_l.isra.0+0xcc>
    1208:	f35ff06f          	j	113c <_strtol_l.isra.0+0xc0>
    120c:	02200713          	li	a4,34
    1210:	00e52023          	sw	a4,0(a0)
    1214:	00038893          	mv	a7,t2
    1218:	fc060ae3          	beqz	a2,11ec <_strtol_l.isra.0+0x170>
    121c:	fff78593          	addi	a1,a5,-1
    1220:	00038893          	mv	a7,t2
    1224:	fc5ff06f          	j	11e8 <_strtol_l.isra.0+0x16c>
    1228:	0007c803          	lbu	a6,0(a5)
    122c:	800003b7          	lui	t2,0x80000
    1230:	00230793          	addi	a5,t1,2
    1234:	00100493          	li	s1,1
    1238:	eadff06f          	j	10e4 <_strtol_l.isra.0+0x68>
    123c:	0007c703          	lbu	a4,0(a5)
    1240:	05800893          	li	a7,88
    1244:	00800293          	li	t0,8
    1248:	0df77713          	andi	a4,a4,223
    124c:	00800693          	li	a3,8
    1250:	eb1714e3          	bne	a4,a7,10f8 <_strtol_l.isra.0+0x7c>
    1254:	f59ff06f          	j	11ac <_strtol_l.isra.0+0x130>
    1258:	00088393          	mv	t2,a7
    125c:	fc1ff06f          	j	121c <_strtol_l.isra.0+0x1a0>

00001260 <strtol>:
    1260:	00060693          	mv	a3,a2
    1264:	00058613          	mv	a2,a1
    1268:	00050593          	mv	a1,a0
    126c:	8101a503          	lw	a0,-2032(gp) # 56a8 <_impure_ptr>
    1270:	e0dff06f          	j	107c <_strtol_l.isra.0>

00001274 <__errno>:
    1274:	8101a503          	lw	a0,-2032(gp) # 56a8 <_impure_ptr>
    1278:	00008067          	ret

0000127c <__libc_init_array>:
    127c:	ff010113          	addi	sp,sp,-16
    1280:	00812423          	sw	s0,8(sp)
    1284:	01212023          	sw	s2,0(sp)
    1288:	00003797          	auipc	a5,0x3
    128c:	0f478793          	addi	a5,a5,244 # 437c <_data>
    1290:	00003417          	auipc	s0,0x3
    1294:	0ec40413          	addi	s0,s0,236 # 437c <_data>
    1298:	00112623          	sw	ra,12(sp)
    129c:	00912223          	sw	s1,4(sp)
    12a0:	40878933          	sub	s2,a5,s0
    12a4:	02878063          	beq	a5,s0,12c4 <__libc_init_array+0x48>
    12a8:	40295913          	srai	s2,s2,0x2
    12ac:	00000493          	li	s1,0
    12b0:	00042783          	lw	a5,0(s0)
    12b4:	00148493          	addi	s1,s1,1
    12b8:	00440413          	addi	s0,s0,4
    12bc:	000780e7          	jalr	a5
    12c0:	ff24e8e3          	bltu	s1,s2,12b0 <__libc_init_array+0x34>
    12c4:	00003797          	auipc	a5,0x3
    12c8:	0b878793          	addi	a5,a5,184 # 437c <_data>
    12cc:	00003417          	auipc	s0,0x3
    12d0:	0b040413          	addi	s0,s0,176 # 437c <_data>
    12d4:	40878933          	sub	s2,a5,s0
    12d8:	40295913          	srai	s2,s2,0x2
    12dc:	00878e63          	beq	a5,s0,12f8 <__libc_init_array+0x7c>
    12e0:	00000493          	li	s1,0
    12e4:	00042783          	lw	a5,0(s0)
    12e8:	00148493          	addi	s1,s1,1
    12ec:	00440413          	addi	s0,s0,4
    12f0:	000780e7          	jalr	a5
    12f4:	ff24e8e3          	bltu	s1,s2,12e4 <__libc_init_array+0x68>
    12f8:	00c12083          	lw	ra,12(sp)
    12fc:	00812403          	lw	s0,8(sp)
    1300:	00412483          	lw	s1,4(sp)
    1304:	00012903          	lw	s2,0(sp)
    1308:	01010113          	addi	sp,sp,16
    130c:	00008067          	ret

00001310 <main>:
}

/****************************************************************MAIN**************************************************************/

void main()
{
    1310:	ff010113          	addi	sp,sp,-16
    1314:	00112623          	sw	ra,12(sp)
    1318:	00812423          	sw	s0,8(sp)

    bsp_printf("\n\rHello Efinix Edge Vision SoC!!\n\n\r");
    131c:	00005537          	lui	a0,0x5
    1320:	bcc50513          	addi	a0,a0,-1076 # 4bcc <_data+0x850>
    1324:	04c010ef          	jal	2370 <bsp_printf>

    cam0_init(I2C_CTRL_CAM0);
    bsp_printf("\n\rDone !!\n\r");

#elif defined(BOARD_Ti60F225)
    bsp_printf("Init Camera.....");
    1328:	00005537          	lui	a0,0x5
    132c:	bf050513          	addi	a0,a0,-1040 # 4bf0 <_data+0x874>
    1330:	040010ef          	jal	2370 <bsp_printf>
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    1334:	f8100437          	lui	s0,0xf8100
    1338:	00042223          	sw	zero,4(s0) # f8100004 <__freertos_irq_stack_top+0xf80f97a4>

    // Assert camera reset
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000000);
    bsp_uDelay(100);
    133c:	f8b00637          	lui	a2,0xf8b00
    1340:	05f5e5b7          	lui	a1,0x5f5e
    1344:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    1348:	06400513          	li	a0,100
    134c:	3d5000ef          	jal	1f20 <clint_uDelay>
    1350:	00200793          	li	a5,2
    1354:	00f42223          	sw	a5,4(s0)
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000002);
    bsp_uDelay(1000 * 10);
    1358:	f8b00637          	lui	a2,0xf8b00
    135c:	05f5e5b7          	lui	a1,0x5f5e
    1360:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    1364:	00002537          	lui	a0,0x2
    1368:	71050513          	addi	a0,a0,1808 # 2710 <Read_Latency+0x270>
    136c:	3b5000ef          	jal	1f20 <clint_uDelay>

    cam0_init(I2C_CTRL_CAM0);
    1370:	f8015537          	lui	a0,0xf8015
    1374:	7cc020ef          	jal	3b40 <cam0_init>
    1378:	00300793          	li	a5,3
    137c:	00f42223          	sw	a5,4(s0)

    // Indicate camera configuration done
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000003);
    bsp_printf("Done\n\r");
    1380:	00005537          	lui	a0,0x5
    1384:	c0450513          	addi	a0,a0,-1020 # 4c04 <_data+0x888>
    1388:	7e9000ef          	jal	2370 <bsp_printf>

#endif

    /******************************************************SETUP DMA & UART********************************************************/

    bsp_printf("Init DMA.....");
    138c:	00005537          	lui	a0,0x5
    1390:	c0c50513          	addi	a0,a0,-1012 # 4c0c <_data+0x890>
    1394:	7dd000ef          	jal	2370 <bsp_printf>

    uart_interrupt_init();
    1398:	46c010ef          	jal	2804 <uart_interrupt_init>
    dma_init();
    139c:	07d000ef          	jal	1c18 <dma_init>

    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, 0, 0);
    13a0:	00000693          	li	a3,0
    13a4:	00000613          	li	a2,0
    13a8:	00400593          	li	a1,4
    13ac:	f8110537          	lui	a0,0xf8110
    13b0:	7a9000ef          	jal	2358 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, 0, 0);
    13b4:	00000693          	li	a3,0
    13b8:	00000613          	li	a2,0
    13bc:	00300593          	li	a1,3
    13c0:	f8110537          	lui	a0,0xf8110
    13c4:	795000ef          	jal	2358 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, 0, 0);
    13c8:	00000693          	li	a3,0
    13cc:	00000613          	li	a2,0
    13d0:	00200593          	li	a1,2
    13d4:	f8110537          	lui	a0,0xf8110
    13d8:	781000ef          	jal	2358 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, 0, 0);
    13dc:	00000693          	li	a3,0
    13e0:	00000613          	li	a2,0
    13e4:	00000593          	li	a1,0
    13e8:	f8110537          	lui	a0,0xf8110
    13ec:	76d000ef          	jal	2358 <dmasg_priority>

    bsp_printf("Done !!\n\n\r");
    13f0:	00005537          	lui	a0,0x5
    13f4:	c1c50513          	addi	a0,a0,-996 # 4c1c <_data+0x8a0>
    13f8:	779000ef          	jal	2370 <bsp_printf>

    /*******************************************************Trigger Display********************************************************/

    select_demo_mode = 0; // Default
    13fc:	8201aa23          	sw	zero,-1996(gp) # 56cc <select_demo_mode>

    // To check display functionality
    bsp_printf("Initialize test display content..\n\r");
    1400:	00005537          	lui	a0,0x5
    1404:	c2850513          	addi	a0,a0,-984 # 4c28 <_data+0x8ac>
    1408:	769000ef          	jal	2370 <bsp_printf>

    // Array name to be modified to DDR location used for display
    // Colour bar & Red dots at 4 corners of active display
    // Initialize test image in cam_array - Default
    for (int y = 0; y < FRAME_HEIGHT; y++)
    140c:	00000613          	li	a2,0
    1410:	1100006f          	j	1520 <main+0x210>
    {
        for (int x = 0; x < FRAME_WIDTH; x++)
        {
            if ((x < 3 && y < 3) || (x >= FRAME_WIDTH - 3 && y < 3) || (x < 3 && y >= FRAME_HEIGHT - 3) || (x >= FRAME_WIDTH - 3 && y >= FRAME_HEIGHT - 3))
    1414:	00200713          	li	a4,2
    1418:	00c75c63          	bge	a4,a2,1430 <main+0x120>
    141c:	0af74063          	blt	a4,a5,14bc <main+0x1ac>
    1420:	21800713          	li	a4,536
    1424:	08c75c63          	bge	a4,a2,14bc <main+0x1ac>
    1428:	0080006f          	j	1430 <main+0x120>
    142c:	08c75c63          	bge	a4,a2,14c4 <main+0x1b4>
            {
                cam_array[y * FRAME_WIDTH + x] = 0x000000FF; // RED
    1430:	21c00713          	li	a4,540
    1434:	02e60733          	mul	a4,a2,a4
    1438:	00f70733          	add	a4,a4,a5
    143c:	00271713          	slli	a4,a4,0x2
    1440:	001006b7          	lui	a3,0x100
    1444:	00e68733          	add	a4,a3,a4
    1448:	0ff00693          	li	a3,255
    144c:	00d72023          	sw	a3,0(a4)
    1450:	0540006f          	j	14a4 <main+0x194>
            }
            else if (x < (FRAME_WIDTH / 4))
            {
                cam_array[y * FRAME_WIDTH + x] = 0x0000FF00; // GREEN
    1454:	21c00713          	li	a4,540
    1458:	02e60733          	mul	a4,a2,a4
    145c:	00f70733          	add	a4,a4,a5
    1460:	00271713          	slli	a4,a4,0x2
    1464:	001006b7          	lui	a3,0x100
    1468:	00e68733          	add	a4,a3,a4
    146c:	000106b7          	lui	a3,0x10
    1470:	f0068693          	addi	a3,a3,-256 # ff00 <__freertos_irq_stack_top+0x96a0>
    1474:	00d72023          	sw	a3,0(a4)
    1478:	02c0006f          	j	14a4 <main+0x194>
            }
            else if (x < (FRAME_WIDTH / 4 * 2))
            {
                cam_array[y * FRAME_WIDTH + x] = 0x00FF0000; // BLUE
            }
            else if (x < (FRAME_WIDTH / 4 * 3))
    147c:	19400713          	li	a4,404
    1480:	06f74c63          	blt	a4,a5,14f8 <main+0x1e8>
            {
                cam_array[y * FRAME_WIDTH + x] = 0x000000FF; // RED
    1484:	21c00713          	li	a4,540
    1488:	02e60733          	mul	a4,a2,a4
    148c:	00f70733          	add	a4,a4,a5
    1490:	00271713          	slli	a4,a4,0x2
    1494:	001006b7          	lui	a3,0x100
    1498:	00e68733          	add	a4,a3,a4
    149c:	0ff00693          	li	a3,255
    14a0:	00d72023          	sw	a3,0(a4)
        for (int x = 0; x < FRAME_WIDTH; x++)
    14a4:	00178793          	addi	a5,a5,1
    14a8:	21b00713          	li	a4,539
    14ac:	06f74863          	blt	a4,a5,151c <main+0x20c>
            if ((x < 3 && y < 3) || (x >= FRAME_WIDTH - 3 && y < 3) || (x < 3 && y >= FRAME_HEIGHT - 3) || (x >= FRAME_WIDTH - 3 && y >= FRAME_HEIGHT - 3))
    14b0:	ffd78713          	addi	a4,a5,-3
    14b4:	21500693          	li	a3,533
    14b8:	f4e6eee3          	bltu	a3,a4,1414 <main+0x104>
    14bc:	21800713          	li	a4,536
    14c0:	f6f746e3          	blt	a4,a5,142c <main+0x11c>
            else if (x < (FRAME_WIDTH / 4))
    14c4:	08600713          	li	a4,134
    14c8:	f8f756e3          	bge	a4,a5,1454 <main+0x144>
            else if (x < (FRAME_WIDTH / 4 * 2))
    14cc:	10d00713          	li	a4,269
    14d0:	faf746e3          	blt	a4,a5,147c <main+0x16c>
                cam_array[y * FRAME_WIDTH + x] = 0x00FF0000; // BLUE
    14d4:	21c00713          	li	a4,540
    14d8:	02e60733          	mul	a4,a2,a4
    14dc:	00f70733          	add	a4,a4,a5
    14e0:	00271713          	slli	a4,a4,0x2
    14e4:	001006b7          	lui	a3,0x100
    14e8:	00e68733          	add	a4,a3,a4
    14ec:	00ff06b7          	lui	a3,0xff0
    14f0:	00d72023          	sw	a3,0(a4)
    14f4:	fb1ff06f          	j	14a4 <main+0x194>
            }
            else
            {
                cam_array[y * FRAME_WIDTH + x] = 0x00FF0000; // BLUE
    14f8:	21c00713          	li	a4,540
    14fc:	02e60733          	mul	a4,a2,a4
    1500:	00f70733          	add	a4,a4,a5
    1504:	00271713          	slli	a4,a4,0x2
    1508:	001006b7          	lui	a3,0x100
    150c:	00e68733          	add	a4,a3,a4
    1510:	00ff06b7          	lui	a3,0xff0
    1514:	00d72023          	sw	a3,0(a4)
    1518:	f8dff06f          	j	14a4 <main+0x194>
    for (int y = 0; y < FRAME_HEIGHT; y++)
    151c:	00160613          	addi	a2,a2,1 # f8b00001 <__freertos_irq_stack_top+0xf8af97a1>
    1520:	21b00793          	li	a5,539
    1524:	00c7c663          	blt	a5,a2,1530 <main+0x220>
        for (int x = 0; x < FRAME_WIDTH; x++)
    1528:	00000793          	li	a5,0
    152c:	f7dff06f          	j	14a8 <main+0x198>
            }
        }
    }

    // Trigger display DMA once then the rest handled by DMA (Direct mode DMA)
    bsp_printf("\nTrigger display DMA..\n\r");
    1530:	00005537          	lui	a0,0x5
    1534:	c4c50513          	addi	a0,a0,-948 # 4c4c <_data+0x8d0>
    1538:	639000ef          	jal	2370 <bsp_printf>

    // SELECT start address of to be displayed data accordingly - Default
    dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    153c:	01000693          	li	a3,16
    1540:	00100637          	lui	a2,0x100
    1544:	00200593          	li	a1,2
    1548:	f8110537          	lui	a0,0xf8110
    154c:	505000ef          	jal	2250 <dmasg_input_memory>

    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    1550:	00100793          	li	a5,1
    1554:	00000713          	li	a4,0
    1558:	00000693          	li	a3,0
    155c:	00000613          	li	a2,0
    1560:	00200593          	li	a1,2
    1564:	f8110537          	lui	a0,0xf8110
    1568:	571000ef          	jal	22d8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    156c:	00400613          	li	a2,4
    1570:	00200593          	li	a1,2
    1574:	f8110537          	lui	a0,0xf8110
    1578:	5b5000ef          	jal	232c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restart
    157c:	00000693          	li	a3,0
    1580:	0011d637          	lui	a2,0x11d
    1584:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1163e0>
    1588:	00200593          	li	a1,2
    158c:	f8110537          	lui	a0,0xf8110
    1590:	575000ef          	jal	2304 <dmasg_direct_start>
    display_mm2s_active = 1;                                                                         // Display always active
    1594:	00100713          	li	a4,1
    1598:	82e1a823          	sw	a4,-2000(gp) # 56c8 <display_mm2s_active>

    msDelay(5000); // Display test content for 5 seconds
    159c:	00001537          	lui	a0,0x1
    15a0:	38850513          	addi	a0,a0,904 # 1388 <main+0x78>
    15a4:	039000ef          	jal	1ddc <msDelay>

    bsp_printf("Done !!\n\n\r");
    15a8:	00005537          	lui	a0,0x5
    15ac:	c1c50513          	addi	a0,a0,-996 # 4c1c <_data+0x8a0>
    15b0:	5c1000ef          	jal	2370 <bsp_printf>

    ispExample_menu();
    15b4:	0cd010ef          	jal	2e80 <ispExample_menu>

    bsp_printf("Default Demo Mode: a\n\r");
    15b8:	00005537          	lui	a0,0x5
    15bc:	c6850513          	addi	a0,a0,-920 # 4c68 <_data+0x8ec>
    15c0:	5b1000ef          	jal	2370 <bsp_printf>
    15c4:	1040006f          	j	16c8 <main+0x3b8>
    15c8:	f81007b7          	lui	a5,0xf8100
    15cc:	0007a623          	sw	zero,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f97ac>
    }
    15d0:	1140006f          	j	16e4 <main+0x3d4>

        /*******************************************************RISC-V Processing***********************************************************/

        if (select_demo_mode == 1 || select_demo_mode == 2)
        {
            rgb2grayscale(cam_array, grayscale_array, FRAME_WIDTH, FRAME_HEIGHT);
    15d4:	21c00693          	li	a3,540
    15d8:	21c00613          	li	a2,540
    15dc:	005005b7          	lui	a1,0x500
    15e0:	00100537          	lui	a0,0x100
    15e4:	188010ef          	jal	276c <rgb2grayscale>
    15e8:	1800006f          	j	1768 <main+0x458>
        *((volatile u32*) address) = data;
    15ec:	f81207b7          	lui	a5,0xf8120
    15f0:	0007a223          	sw	zero,4(a5) # f8120004 <__freertos_irq_stack_top+0xf81197a4>
                write_u32(0x00000002, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG1_OFFSET); // 2'd2: Sobel+Erosion
            }

            // Trigger HW accel MM2S DMA
            // SELECT start address of DMA input to HW accel block
            dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, CAM_START_ADDR, 16); // Camera pre-processing block performs HW RGB2grayscale conversion
    15f4:	01000693          	li	a3,16
    15f8:	00100637          	lui	a2,0x100
    15fc:	00400593          	li	a1,4
    1600:	f8110537          	lui	a0,0xf8110
    1604:	44d000ef          	jal	2250 <dmasg_input_memory>
            // dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16); //RISC-V performs SW RGB2grayscale conversion
            dmasg_output_stream(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, DMASG_HW_ACCEL_MM2S_1_PORT, 0, 0, 1);
    1608:	00100793          	li	a5,1
    160c:	00000713          	li	a4,0
    1610:	00000693          	li	a3,0
    1614:	00000613          	li	a2,0
    1618:	00400593          	li	a1,4
    161c:	f8110537          	lui	a0,0xf8110
    1620:	4b9000ef          	jal	22d8 <dmasg_output_stream>

            // SELECT dma transfer length - Make sure match with HW accelerator mode selection
            // Additonal data is required to be fed for line buffer(s) data flushing
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1624:	8341a783          	lw	a5,-1996(gp) # 56cc <select_demo_mode>
    1628:	00200713          	li	a4,2
    162c:	00e78663          	beq	a5,a4,1638 <main+0x328>
    1630:	00400713          	li	a4,4
    1634:	18e79863          	bne	a5,a4,17c4 <main+0x4b4>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (FRAME_WIDTH + 1)) * 4, 0); // Sobel only
    1638:	00000693          	li	a3,0
    163c:	0011d637          	lui	a2,0x11d
    1640:	4b460613          	addi	a2,a2,1204 # 11d4b4 <__freertos_irq_stack_top+0x116c54>
    1644:	00400593          	li	a1,4
    1648:	f8110537          	lui	a0,0xf8110
    164c:	4b9000ef          	jal	2304 <dmasg_direct_start>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
            }

            // Trigger HW accel S2MM DMA
            dmasg_input_stream(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, DMASG_HW_ACCEL_S2MM_PORT, 1, 0);
    1650:	00000713          	li	a4,0
    1654:	00100693          	li	a3,1
    1658:	00000613          	li	a2,0
    165c:	00300593          	li	a1,3
    1660:	f8110537          	lui	a0,0xf8110
    1664:	43d000ef          	jal	22a0 <dmasg_input_stream>
            dmasg_output_memory(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, SOBEL_START_ADDR, 16);
    1668:	01000693          	li	a3,16
    166c:	00900637          	lui	a2,0x900
    1670:	00300593          	li	a1,3
    1674:	f8110537          	lui	a0,0xf8110
    1678:	401000ef          	jal	2278 <dmasg_output_memory>
            dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    167c:	00000693          	li	a3,0
    1680:	0011d637          	lui	a2,0x11d
    1684:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1163e0>
    1688:	00300593          	li	a1,3
    168c:	f8110537          	lui	a0,0xf8110
    1690:	475000ef          	jal	2304 <dmasg_direct_start>
    1694:	f81207b7          	lui	a5,0xf8120
    1698:	00100713          	li	a4,1
    169c:	00e7a423          	sw	a4,8(a5) # f8120008 <__freertos_irq_stack_top+0xf81197a8>
    16a0:	0007a423          	sw	zero,8(a5)
            // Indicate start of S2MM DMA to HW accel building block via APB3 slave
            write_u32(0x00000001, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);
            write_u32(0x00000000, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);

            // Wait for DMA transfer completion
            while (dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL) || dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL))
    16a4:	00400593          	li	a1,4
    16a8:	f8110537          	lui	a0,0xf8110
    16ac:	499000ef          	jal	2344 <dmasg_busy>
    16b0:	fe051ae3          	bnez	a0,16a4 <main+0x394>
    16b4:	00300593          	li	a1,3
    16b8:	f8110537          	lui	a0,0xf8110
    16bc:	489000ef          	jal	2344 <dmasg_busy>
    16c0:	fe0512e3          	bnez	a0,16a4 <main+0x394>
    16c4:	0000500f          	.word	0x0000500f
        Read_Latency();
    16c8:	5d9000ef          	jal	24a0 <Read_Latency>
        if (select_demo_mode > 2)
    16cc:	8341a703          	lw	a4,-1996(gp) # 56cc <select_demo_mode>
    16d0:	00200793          	li	a5,2
    16d4:	eee7fae3          	bgeu	a5,a4,15c8 <main+0x2b8>
    16d8:	f81007b7          	lui	a5,0xf8100
    16dc:	00100713          	li	a4,1
    16e0:	00e7a623          	sw	a4,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f97ac>
        dmasg_input_stream(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, DMASG_CAM1_S2MM_PORT, 1, 0);
    16e4:	00000713          	li	a4,0
    16e8:	00100693          	li	a3,1
    16ec:	00000613          	li	a2,0
    16f0:	00000593          	li	a1,0
    16f4:	f8110537          	lui	a0,0xf8110
    16f8:	3a9000ef          	jal	22a0 <dmasg_input_stream>
        dmasg_output_memory(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, CAM_START_ADDR, 16);
    16fc:	01000693          	li	a3,16
    1700:	00100637          	lui	a2,0x100
    1704:	00000593          	li	a1,0
    1708:	f8110537          	lui	a0,0xf8110
    170c:	36d000ef          	jal	2278 <dmasg_output_memory>
        dmasg_direct_start(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    1710:	00000693          	li	a3,0
    1714:	0011d637          	lui	a2,0x11d
    1718:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1163e0>
    171c:	00000593          	li	a1,0
    1720:	f8110537          	lui	a0,0xf8110
    1724:	3e1000ef          	jal	2304 <dmasg_direct_start>
    1728:	f81007b7          	lui	a5,0xf8100
    172c:	00100713          	li	a4,1
    1730:	00e7a823          	sw	a4,16(a5) # f8100010 <__freertos_irq_stack_top+0xf80f97b0>
    1734:	0007a823          	sw	zero,16(a5)
    1738:	f81007b7          	lui	a5,0xf8100
    173c:	00e7a423          	sw	a4,8(a5) # f8100008 <__freertos_irq_stack_top+0xf80f97a8>
    1740:	0007a423          	sw	zero,8(a5)
        while (dmasg_busy(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL))
    1744:	00000593          	li	a1,0
    1748:	f8110537          	lui	a0,0xf8110
    174c:	3f9000ef          	jal	2344 <dmasg_busy>
    1750:	fe051ae3          	bnez	a0,1744 <main+0x434>
    1754:	0000500f          	.word	0x0000500f
        if (select_demo_mode == 1 || select_demo_mode == 2)
    1758:	8341a783          	lw	a5,-1996(gp) # 56cc <select_demo_mode>
    175c:	fff78793          	addi	a5,a5,-1
    1760:	00100713          	li	a4,1
    1764:	e6f778e3          	bgeu	a4,a5,15d4 <main+0x2c4>
        if (select_demo_mode == 2 || select_demo_mode > 3)
    1768:	8341a783          	lw	a5,-1996(gp) # 56cc <select_demo_mode>
    176c:	00200713          	li	a4,2
    1770:	00e78663          	beq	a5,a4,177c <main+0x46c>
    1774:	00300713          	li	a4,3
    1778:	f4f778e3          	bgeu	a4,a5,16c8 <main+0x3b8>
    177c:	f81207b7          	lui	a5,0xf8120
    1780:	00500713          	li	a4,5
    1784:	00e7a023          	sw	a4,0(a5) # f8120000 <__freertos_irq_stack_top+0xf81197a0>
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1788:	8341a783          	lw	a5,-1996(gp) # 56cc <select_demo_mode>
    178c:	00200713          	li	a4,2
    1790:	e4e78ee3          	beq	a5,a4,15ec <main+0x2dc>
    1794:	00400713          	li	a4,4
    1798:	e4e78ae3          	beq	a5,a4,15ec <main+0x2dc>
            else if (select_demo_mode == 5)
    179c:	00500713          	li	a4,5
    17a0:	00e78a63          	beq	a5,a4,17b4 <main+0x4a4>
    17a4:	f81207b7          	lui	a5,0xf8120
    17a8:	00200713          	li	a4,2
    17ac:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf81197a4>
    }
    17b0:	e45ff06f          	j	15f4 <main+0x2e4>
        *((volatile u32*) address) = data;
    17b4:	f81207b7          	lui	a5,0xf8120
    17b8:	00100713          	li	a4,1
    17bc:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf81197a4>
    }
    17c0:	e35ff06f          	j	15f4 <main+0x2e4>
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
    17c4:	00000693          	li	a3,0
    17c8:	0011e637          	lui	a2,0x11e
    17cc:	d2860613          	addi	a2,a2,-728 # 11dd28 <__freertos_irq_stack_top+0x1174c8>
    17d0:	00400593          	li	a1,4
    17d4:	f8110537          	lui	a0,0xf8110
    17d8:	32d000ef          	jal	2304 <dmasg_direct_start>
    17dc:	e75ff06f          	j	1650 <main+0x340>

000017e0 <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    17e0:	00259593          	slli	a1,a1,0x2
    17e4:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    17e8:	00c5a023          	sw	a2,0(a1) # 500000 <__freertos_irq_stack_top+0x4f97a0>
    }
    17ec:	00008067          	ret

000017f0 <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    17f0:	00759593          	slli	a1,a1,0x7
    17f4:	00a585b3          	add	a1,a1,a0
    17f8:	00565793          	srli	a5,a2,0x5
    17fc:	00279793          	slli	a5,a5,0x2
    1800:	00f587b3          	add	a5,a1,a5
    1804:	00002737          	lui	a4,0x2
    1808:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
    180c:	00100713          	li	a4,1
    1810:	00c71633          	sll	a2,a4,a2
        if (enable)
    1814:	00068a63          	beqz	a3,1828 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    1818:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
    181c:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
    1820:	00c7a023          	sw	a2,0(a5)
    }
    1824:	00008067          	ret
        return *((volatile u32*) address);
    1828:	0007a703          	lw	a4,0(a5)
        else
            write_u32(read_u32(word) & ~mask, word);
    182c:	fff64613          	not	a2,a2
    1830:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
    1834:	00c7a023          	sw	a2,0(a5)
    }
    1838:	00008067          	ret

0000183c <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
    183c:	00c59593          	slli	a1,a1,0xc
    1840:	00a585b3          	add	a1,a1,a0
    1844:	002007b7          	lui	a5,0x200
    1848:	00f585b3          	add	a1,a1,a5
    184c:	00c5a023          	sw	a2,0(a1)
    }
    1850:	00008067          	ret

00001854 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1854:	00452503          	lw	a0,4(a0) # f8110004 <__freertos_irq_stack_top+0xf81097a4>
*          of available spaces for writing data from bits 23 to 16. It then
*          returns this value after masking with 0xFF.
*
******************************************************************************/
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1858:	01055513          	srli	a0,a0,0x10
    }
    185c:	0ff57513          	zext.b	a0,a0
    1860:	00008067          	ret

00001864 <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
    1864:	ff010113          	addi	sp,sp,-16
    1868:	00112623          	sw	ra,12(sp)
    186c:	00812423          	sw	s0,8(sp)
    1870:	00912223          	sw	s1,4(sp)
    1874:	00050413          	mv	s0,a0
    1878:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    187c:	00040513          	mv	a0,s0
    1880:	fd5ff0ef          	jal	1854 <uart_writeAvailability>
    1884:	fe050ce3          	beqz	a0,187c <uart_write+0x18>
        *((volatile u32*) address) = data;
    1888:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
    188c:	00c12083          	lw	ra,12(sp)
    1890:	00812403          	lw	s0,8(sp)
    1894:	00412483          	lw	s1,4(sp)
    1898:	01010113          	addi	sp,sp,16
    189c:	00008067          	ret

000018a0 <_putchar>:
#include <math.h>
#include <string.h>
#include "bsp.h"

#if (ENABLE_BSP_PRINTF)
    static void _putchar(char character){
    18a0:	ff010113          	addi	sp,sp,-16
    18a4:	00112623          	sw	ra,12(sp)
    18a8:	00050593          	mv	a1,a0
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
    18ac:	f8010537          	lui	a0,0xf8010
    18b0:	fb5ff0ef          	jal	1864 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    18b4:	00c12083          	lw	ra,12(sp)
    18b8:	01010113          	addi	sp,sp,16
    18bc:	00008067          	ret

000018c0 <_putchar_s>:

    static void _putchar_s(char *p)
    {
    18c0:	ff010113          	addi	sp,sp,-16
    18c4:	00112623          	sw	ra,12(sp)
    18c8:	00812423          	sw	s0,8(sp)
    18cc:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
    18d0:	00c0006f          	j	18dc <_putchar_s+0x1c>
            _putchar(*(p++));
    18d4:	00140413          	addi	s0,s0,1
    18d8:	fc9ff0ef          	jal	18a0 <_putchar>
        while (*p)
    18dc:	00044503          	lbu	a0,0(s0)
    18e0:	fe051ae3          	bnez	a0,18d4 <_putchar_s+0x14>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    18e4:	00c12083          	lw	ra,12(sp)
    18e8:	00812403          	lw	s0,8(sp)
    18ec:	01010113          	addi	sp,sp,16
    18f0:	00008067          	ret

000018f4 <bsp_printHex>:

        static void bsp_printHex(uint32_t val)
    {
    18f4:	ff010113          	addi	sp,sp,-16
    18f8:	00112623          	sw	ra,12(sp)
    18fc:	00812423          	sw	s0,8(sp)
    1900:	00912223          	sw	s1,4(sp)
    1904:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1908:	01c00413          	li	s0,28
    190c:	0240006f          	j	1930 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    1910:	0084d733          	srl	a4,s1,s0
    1914:	00f77713          	andi	a4,a4,15
    1918:	000047b7          	lui	a5,0x4
    191c:	38078793          	addi	a5,a5,896 # 4380 <_data+0x4>
    1920:	00e787b3          	add	a5,a5,a4
    1924:	0007c503          	lbu	a0,0(a5)
    1928:	f79ff0ef          	jal	18a0 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    192c:	ffc40413          	addi	s0,s0,-4
    1930:	fe0450e3          	bgez	s0,1910 <bsp_printHex+0x1c>
        }
    }
    1934:	00c12083          	lw	ra,12(sp)
    1938:	00812403          	lw	s0,8(sp)
    193c:	00412483          	lw	s1,4(sp)
    1940:	01010113          	addi	sp,sp,16
    1944:	00008067          	ret

00001948 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
    {
    1948:	ff010113          	addi	sp,sp,-16
    194c:	00112623          	sw	ra,12(sp)
    1950:	00812423          	sw	s0,8(sp)
    1954:	00912223          	sw	s1,4(sp)
    1958:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    195c:	01c00413          	li	s0,28
    1960:	0240006f          	j	1984 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    1964:	0084d733          	srl	a4,s1,s0
    1968:	00f77713          	andi	a4,a4,15
    196c:	000047b7          	lui	a5,0x4
    1970:	39478793          	addi	a5,a5,916 # 4394 <_data+0x18>
    1974:	00e787b3          	add	a5,a5,a4
    1978:	0007c503          	lbu	a0,0(a5)
    197c:	f25ff0ef          	jal	18a0 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1980:	ffc40413          	addi	s0,s0,-4
    1984:	fe0450e3          	bgez	s0,1964 <bsp_printHex_lower+0x1c>

        }
    }
    1988:	00c12083          	lw	ra,12(sp)
    198c:	00812403          	lw	s0,8(sp)
    1990:	00412483          	lw	s1,4(sp)
    1994:	01010113          	addi	sp,sp,16
    1998:	00008067          	ret

0000199c <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
    199c:	ff010113          	addi	sp,sp,-16
    19a0:	00112623          	sw	ra,12(sp)
        _putchar(c);
    19a4:	0ff57513          	zext.b	a0,a0
    19a8:	ef9ff0ef          	jal	18a0 <_putchar>
    }
    19ac:	00c12083          	lw	ra,12(sp)
    19b0:	01010113          	addi	sp,sp,16
    19b4:	00008067          	ret

000019b8 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
    19b8:	ff010113          	addi	sp,sp,-16
    19bc:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    19c0:	f01ff0ef          	jal	18c0 <_putchar_s>
    }
    19c4:	00c12083          	lw	ra,12(sp)
    19c8:	01010113          	addi	sp,sp,16
    19cc:	00008067          	ret

000019d0 <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
    19d0:	fd010113          	addi	sp,sp,-48
    19d4:	02112623          	sw	ra,44(sp)
    19d8:	02812423          	sw	s0,40(sp)
    19dc:	02912223          	sw	s1,36(sp)
    19e0:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
    19e4:	00054663          	bltz	a0,19f0 <bsp_printf_d+0x20>
    {
    19e8:	00010413          	mv	s0,sp
    19ec:	02c0006f          	j	1a18 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    19f0:	02d00513          	li	a0,45
    19f4:	fa9ff0ef          	jal	199c <bsp_printf_c>
            val = -val;
    19f8:	409004b3          	neg	s1,s1
    19fc:	fedff06f          	j	19e8 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
    1a00:	00a00713          	li	a4,10
    1a04:	02e4e7b3          	rem	a5,s1,a4
    1a08:	03078793          	addi	a5,a5,48
    1a0c:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    1a10:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    1a14:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    1a18:	fe0494e3          	bnez	s1,1a00 <bsp_printf_d+0x30>
    1a1c:	00010793          	mv	a5,sp
    1a20:	fef400e3          	beq	s0,a5,1a00 <bsp_printf_d+0x30>
        }
        while (p != buffer)
    1a24:	00010793          	mv	a5,sp
    1a28:	00f40a63          	beq	s0,a5,1a3c <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    1a2c:	fff40413          	addi	s0,s0,-1
    1a30:	00044503          	lbu	a0,0(s0)
    1a34:	f69ff0ef          	jal	199c <bsp_printf_c>
    1a38:	fedff06f          	j	1a24 <bsp_printf_d+0x54>
    }
    1a3c:	02c12083          	lw	ra,44(sp)
    1a40:	02812403          	lw	s0,40(sp)
    1a44:	02412483          	lw	s1,36(sp)
    1a48:	03010113          	addi	sp,sp,48
    1a4c:	00008067          	ret

00001a50 <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
    1a50:	ff010113          	addi	sp,sp,-16
    1a54:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
    1a58:	00000713          	li	a4,0
    1a5c:	00700793          	li	a5,7
    1a60:	02e7c063          	blt	a5,a4,1a80 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1a64:	00271693          	slli	a3,a4,0x2
    1a68:	ff000793          	li	a5,-16
    1a6c:	00d797b3          	sll	a5,a5,a3
    1a70:	00f577b3          	and	a5,a0,a5
    1a74:	00078663          	beqz	a5,1a80 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    1a78:	00170713          	addi	a4,a4,1 # 2001 <bsp_printHex_lower+0x5>
    1a7c:	fe1ff06f          	j	1a5c <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
    1a80:	ec9ff0ef          	jal	1948 <bsp_printHex_lower>
    }
    1a84:	00c12083          	lw	ra,12(sp)
    1a88:	01010113          	addi	sp,sp,16
    1a8c:	00008067          	ret

00001a90 <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
    1a90:	ff010113          	addi	sp,sp,-16
    1a94:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
    1a98:	00000713          	li	a4,0
    1a9c:	00700793          	li	a5,7
    1aa0:	02e7c063          	blt	a5,a4,1ac0 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1aa4:	00271693          	slli	a3,a4,0x2
    1aa8:	ff000793          	li	a5,-16
    1aac:	00d797b3          	sll	a5,a5,a3
    1ab0:	00f577b3          	and	a5,a0,a5
    1ab4:	00078663          	beqz	a5,1ac0 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    1ab8:	00170713          	addi	a4,a4,1
    1abc:	fe1ff06f          	j	1a9c <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
    1ac0:	e35ff0ef          	jal	18f4 <bsp_printHex>
        }
    1ac4:	00c12083          	lw	ra,12(sp)
    1ac8:	01010113          	addi	sp,sp,16
    1acc:	00008067          	ret

00001ad0 <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
    1ad0:	fc010113          	addi	sp,sp,-64
    1ad4:	00112e23          	sw	ra,28(sp)
    1ad8:	00812c23          	sw	s0,24(sp)
    1adc:	00912a23          	sw	s1,20(sp)
    1ae0:	00050493          	mv	s1,a0
    1ae4:	02b12223          	sw	a1,36(sp)
    1ae8:	02c12423          	sw	a2,40(sp)
    1aec:	02d12623          	sw	a3,44(sp)
    1af0:	02e12823          	sw	a4,48(sp)
    1af4:	02f12a23          	sw	a5,52(sp)
    1af8:	03012c23          	sw	a6,56(sp)
    1afc:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
    1b00:	02410793          	addi	a5,sp,36
    1b04:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
    1b08:	00000413          	li	s0,0
    1b0c:	01c0006f          	j	1b28 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
    1b10:	00c12783          	lw	a5,12(sp)
    1b14:	00478713          	addi	a4,a5,4
    1b18:	00e12623          	sw	a4,12(sp)
    1b1c:	0007a503          	lw	a0,0(a5)
    1b20:	e7dff0ef          	jal	199c <bsp_printf_c>
        for (i = 0; format[i]; i++)
    1b24:	00140413          	addi	s0,s0,1
    1b28:	008487b3          	add	a5,s1,s0
    1b2c:	0007c503          	lbu	a0,0(a5)
    1b30:	0a050e63          	beqz	a0,1bec <bsp_printf+0x11c>
            if (format[i] == '%') {
    1b34:	02500793          	li	a5,37
    1b38:	06f50e63          	beq	a0,a5,1bb4 <bsp_printf+0xe4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
    1b3c:	e61ff0ef          	jal	199c <bsp_printf_c>
    1b40:	fe5ff06f          	j	1b24 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    1b44:	00c12783          	lw	a5,12(sp)
    1b48:	00478713          	addi	a4,a5,4
    1b4c:	00e12623          	sw	a4,12(sp)
    1b50:	0007a503          	lw	a0,0(a5)
    1b54:	e65ff0ef          	jal	19b8 <bsp_printf_s>
                        break;
    1b58:	fcdff06f          	j	1b24 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    1b5c:	00c12783          	lw	a5,12(sp)
    1b60:	00478713          	addi	a4,a5,4
    1b64:	00e12623          	sw	a4,12(sp)
    1b68:	0007a503          	lw	a0,0(a5)
    1b6c:	e65ff0ef          	jal	19d0 <bsp_printf_d>
                        break;
    1b70:	fb5ff06f          	j	1b24 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    1b74:	00c12783          	lw	a5,12(sp)
    1b78:	00478713          	addi	a4,a5,4
    1b7c:	00e12623          	sw	a4,12(sp)
    1b80:	0007a503          	lw	a0,0(a5)
    1b84:	f0dff0ef          	jal	1a90 <bsp_printf_X>
                        break;
    1b88:	f9dff06f          	j	1b24 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    1b8c:	00c12783          	lw	a5,12(sp)
    1b90:	00478713          	addi	a4,a5,4
    1b94:	00e12623          	sw	a4,12(sp)
    1b98:	0007a503          	lw	a0,0(a5)
    1b9c:	eb5ff0ef          	jal	1a50 <bsp_printf_x>
                        break;
    1ba0:	f85ff06f          	j	1b24 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    1ba4:	00004537          	lui	a0,0x4
    1ba8:	3a850513          	addi	a0,a0,936 # 43a8 <_data+0x2c>
    1bac:	e0dff0ef          	jal	19b8 <bsp_printf_s>
                        break;
    1bb0:	f75ff06f          	j	1b24 <bsp_printf+0x54>
                while (format[++i]) {
    1bb4:	00140413          	addi	s0,s0,1
    1bb8:	008487b3          	add	a5,s1,s0
    1bbc:	0007c783          	lbu	a5,0(a5)
    1bc0:	f60782e3          	beqz	a5,1b24 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    1bc4:	fa878793          	addi	a5,a5,-88
    1bc8:	0ff7f693          	zext.b	a3,a5
    1bcc:	02000713          	li	a4,32
    1bd0:	fed762e3          	bltu	a4,a3,1bb4 <bsp_printf+0xe4>
    1bd4:	00269793          	slli	a5,a3,0x2
    1bd8:	00005737          	lui	a4,0x5
    1bdc:	cfc70713          	addi	a4,a4,-772 # 4cfc <_data+0x980>
    1be0:	00e787b3          	add	a5,a5,a4
    1be4:	0007a783          	lw	a5,0(a5)
    1be8:	00078067          	jr	a5

        va_end(ap);
    }
    1bec:	01c12083          	lw	ra,28(sp)
    1bf0:	01812403          	lw	s0,24(sp)
    1bf4:	01412483          	lw	s1,20(sp)
    1bf8:	04010113          	addi	sp,sp,64
    1bfc:	00008067          	ret

00001c00 <crash>:
#include "uart.h"
#include "bsp.h"

// crash() and trap()
void crash()
{
    1c00:	ff010113          	addi	sp,sp,-16
    1c04:	00112623          	sw	ra,12(sp)
    bsp_printf("\n*** CRASH ***\n");
    1c08:	00004537          	lui	a0,0x4
    1c0c:	3f450513          	addi	a0,a0,1012 # 43f4 <_data+0x78>
    1c10:	ec1ff0ef          	jal	1ad0 <bsp_printf>
    while (1)
    1c14:	0000006f          	j	1c14 <crash+0x14>

00001c18 <dma_init>:
        ;
}

void dma_init()
{
    1c18:	ff010113          	addi	sp,sp,-16
    1c1c:	00112623          	sw	ra,12(sp)
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0);
    1c20:	00000613          	li	a2,0
    1c24:	00000593          	li	a1,0
    1c28:	f8c00537          	lui	a0,0xf8c00
    1c2c:	c11ff0ef          	jal	183c <plic_set_threshold>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, PLIC_DMASG_CHANNEL, 1);
    1c30:	00100693          	li	a3,1
    1c34:	00600613          	li	a2,6
    1c38:	00000593          	li	a1,0
    1c3c:	f8c00537          	lui	a0,0xf8c00
    1c40:	bb1ff0ef          	jal	17f0 <plic_set_enable>
    plic_set_priority(BSP_PLIC, PLIC_DMASG_CHANNEL, 1);
    1c44:	00100613          	li	a2,1
    1c48:	00600593          	li	a1,6
    1c4c:	f8c00537          	lui	a0,0xf8c00
    1c50:	b91ff0ef          	jal	17e0 <plic_set_priority>
    csr_write(mtvec, trap_entry);
    1c54:	000047b7          	lui	a5,0x4
    1c58:	2ec78793          	addi	a5,a5,748 # 42ec <trap_entry>
    1c5c:	30579073          	csrw	mtvec,a5
    csr_set(mie, MIE_MEIE);
    1c60:	000017b7          	lui	a5,0x1
    1c64:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM2+0x7a5>
    1c68:	3047a073          	csrs	mie,a5
    csr_write(mstatus, csr_read(mstatus) | MSTATUS_MPP | MSTATUS_MIE);
    1c6c:	300027f3          	csrr	a5,mstatus
    1c70:	00002737          	lui	a4,0x2
    1c74:	80870713          	addi	a4,a4,-2040 # 1808 <plic_set_enable+0x18>
    1c78:	00e7e7b3          	or	a5,a5,a4
    1c7c:	30079073          	csrw	mstatus,a5
}
    1c80:	00c12083          	lw	ra,12(sp)
    1c84:	01010113          	addi	sp,sp,16
    1c88:	00008067          	ret

00001c8c <trap>:

// defined in main.c
extern void externalInterrupt();

void trap()
{
    1c8c:	ff010113          	addi	sp,sp,-16
    1c90:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
    1c94:	342027f3          	csrr	a5,mcause
    int32_t interrupt = mcause < 0;
    int32_t cause = mcause & 0xF;
    if (interrupt)
    1c98:	0207d263          	bgez	a5,1cbc <trap+0x30>
    1c9c:	00f7f713          	andi	a4,a5,15
    {
        switch (cause)
    1ca0:	00b00793          	li	a5,11
    1ca4:	00f71a63          	bne	a4,a5,1cb8 <trap+0x2c>
        {
        case CAUSE_MACHINE_EXTERNAL:
            externalInterrupt();
    1ca8:	154010ef          	jal	2dfc <externalInterrupt>
    }
    else
    {
        crash();
    }
    1cac:	00c12083          	lw	ra,12(sp)
    1cb0:	01010113          	addi	sp,sp,16
    1cb4:	00008067          	ret
            crash();
    1cb8:	f49ff0ef          	jal	1c00 <crash>
        crash();
    1cbc:	f45ff0ef          	jal	1c00 <crash>

00001cc0 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1cc0:	00452503          	lw	a0,4(a0) # f8c00004 <__freertos_irq_stack_top+0xf8bf97a4>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1cc4:	01055513          	srli	a0,a0,0x10
    }
    1cc8:	0ff57513          	zext.b	a0,a0
    1ccc:	00008067          	ret

00001cd0 <uart_write>:
    static void uart_write(u32 reg, char data){
    1cd0:	ff010113          	addi	sp,sp,-16
    1cd4:	00112623          	sw	ra,12(sp)
    1cd8:	00812423          	sw	s0,8(sp)
    1cdc:	00912223          	sw	s1,4(sp)
    1ce0:	00050413          	mv	s0,a0
    1ce4:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1ce8:	00040513          	mv	a0,s0
    1cec:	fd5ff0ef          	jal	1cc0 <uart_writeAvailability>
    1cf0:	fe050ce3          	beqz	a0,1ce8 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1cf4:	00942023          	sw	s1,0(s0)
    }
    1cf8:	00c12083          	lw	ra,12(sp)
    1cfc:	00812403          	lw	s0,8(sp)
    1d00:	00412483          	lw	s1,4(sp)
    1d04:	01010113          	addi	sp,sp,16
    1d08:	00008067          	ret

00001d0c <uart_writeStr>:
*
* @note    The function iterates through each character of the string and writes
*          them one by one to the UART buffer using the uart_write function.
*
******************************************************************************/
    static void uart_writeStr(u32 reg, const char* str){
    1d0c:	ff010113          	addi	sp,sp,-16
    1d10:	00112623          	sw	ra,12(sp)
    1d14:	00812423          	sw	s0,8(sp)
    1d18:	00912223          	sw	s1,4(sp)
    1d1c:	00050493          	mv	s1,a0
    1d20:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    1d24:	0100006f          	j	1d34 <uart_writeStr+0x28>
    1d28:	00140413          	addi	s0,s0,1
    1d2c:	00048513          	mv	a0,s1
    1d30:	fa1ff0ef          	jal	1cd0 <uart_write>
    1d34:	00044583          	lbu	a1,0(s0)
    1d38:	fe0598e3          	bnez	a1,1d28 <uart_writeStr+0x1c>
    }
    1d3c:	00c12083          	lw	ra,12(sp)
    1d40:	00812403          	lw	s0,8(sp)
    1d44:	00412483          	lw	s1,4(sp)
    1d48:	01010113          	addi	sp,sp,16
    1d4c:	00008067          	ret

00001d50 <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
    1d50:	000f47b7          	lui	a5,0xf4
    1d54:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed9e0>
    1d58:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1d5c:	0000c7b7          	lui	a5,0xc
    1d60:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5798>
    1d64:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1d68:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1d6c:	02a585b3          	mul	a1,a1,a0
    1d70:	00f58733          	add	a4,a1,a5
    1d74:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    1d78:	40f707b3          	sub	a5,a4,a5
    1d7c:	fe07dce3          	bgez	a5,1d74 <clint_uDelay+0x24>
    1d80:	00008067          	ret

00001d84 <i2c_applyConfig>:
*
* @return       None.
*
******************************************************************************/
    static void i2c_applyConfig(u32 reg, I2c_Config *config){
        write_u32(config->samplingClockDivider, reg + I2C_SAMPLING_CLOCK_DIVIDER);
    1d84:	0005a783          	lw	a5,0(a1)
        *((volatile u32*) address) = data;
    1d88:	02f52423          	sw	a5,40(a0)
        write_u32(config->timeout, reg + I2C_TIMEOUT);
    1d8c:	0045a783          	lw	a5,4(a1)
    1d90:	02f52623          	sw	a5,44(a0)
        write_u32(config->tsuDat, reg + I2C_TSUDAT);
    1d94:	0085a783          	lw	a5,8(a1)
    1d98:	02f52823          	sw	a5,48(a0)
        write_u32(config->tLow, reg + I2C_TLOW);
    1d9c:	00c5a783          	lw	a5,12(a1)
    1da0:	04f52823          	sw	a5,80(a0)
        write_u32(config->tHigh, reg + I2C_THIGH);
    1da4:	0105a783          	lw	a5,16(a1)
    1da8:	04f52a23          	sw	a5,84(a0)
        write_u32(config->tBuf, reg + I2C_TBUF);
    1dac:	0145a783          	lw	a5,20(a1)
    1db0:	04f52c23          	sw	a5,88(a0)
    }
    1db4:	00008067          	ret

00001db8 <assert>:
	return data;
}

void assert(int cond)
{
	if (!cond)
    1db8:	00050463          	beqz	a0,1dc0 <assert+0x8>
    1dbc:	00008067          	ret
{
    1dc0:	ff010113          	addi	sp,sp,-16
    1dc4:	00112623          	sw	ra,12(sp)
	{
		uart_writeStr(BSP_UART_TERMINAL, "Assert failure\n");
    1dc8:	000045b7          	lui	a1,0x4
    1dcc:	40458593          	addi	a1,a1,1028 # 4404 <_data+0x88>
    1dd0:	f8010537          	lui	a0,0xf8010
    1dd4:	f39ff0ef          	jal	1d0c <uart_writeStr>
		while (1)
    1dd8:	0000006f          	j	1dd8 <assert+0x20>

00001ddc <msDelay>:
		}
	}
}

void msDelay(u32 ms)
{
    1ddc:	ff010113          	addi	sp,sp,-16
    1de0:	00112623          	sw	ra,12(sp)
	bsp_uDelay(ms * 1000);
    1de4:	f8b00637          	lui	a2,0xf8b00
    1de8:	05f5e5b7          	lui	a1,0x5f5e
    1dec:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    1df0:	3e800793          	li	a5,1000
    1df4:	02f50533          	mul	a0,a0,a5
    1df8:	f59ff0ef          	jal	1d50 <clint_uDelay>
}
    1dfc:	00c12083          	lw	ra,12(sp)
    1e00:	01010113          	addi	sp,sp,16
    1e04:	00008067          	ret

00001e08 <mipi_i2c_init>:
		}
	}
}

void mipi_i2c_init(u32 i2cCtrl)
{
    1e08:	fd010113          	addi	sp,sp,-48
    1e0c:	02112623          	sw	ra,44(sp)
	// I2C init
	I2c_Config i2c_mipi;
	i2c_mipi.samplingClockDivider = 3;
    1e10:	00300793          	li	a5,3
    1e14:	00f12423          	sw	a5,8(sp)
	i2c_mipi.timeout = I2C_CTRL_HZ / 1000;
    1e18:	000187b7          	lui	a5,0x18
    1e1c:	6a078793          	addi	a5,a5,1696 # 186a0 <__freertos_irq_stack_top+0x11e40>
    1e20:	00f12623          	sw	a5,12(sp)
	i2c_mipi.tsuDat = I2C_CTRL_HZ / 2000000;
    1e24:	03200793          	li	a5,50
    1e28:	00f12823          	sw	a5,16(sp)

	i2c_mipi.tLow = I2C_CTRL_HZ / 800000;
    1e2c:	07d00793          	li	a5,125
    1e30:	00f12a23          	sw	a5,20(sp)
	i2c_mipi.tHigh = I2C_CTRL_HZ / 800000;
    1e34:	00f12c23          	sw	a5,24(sp)
	i2c_mipi.tBuf = I2C_CTRL_HZ / 400000;
    1e38:	0fa00793          	li	a5,250
    1e3c:	00f12e23          	sw	a5,28(sp)

	i2c_applyConfig(i2cCtrl, &i2c_mipi);
    1e40:	00810593          	addi	a1,sp,8
    1e44:	f41ff0ef          	jal	1d84 <i2c_applyConfig>
}
    1e48:	02c12083          	lw	ra,44(sp)
    1e4c:	03010113          	addi	sp,sp,48
    1e50:	00008067          	ret

00001e54 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1e54:	00452503          	lw	a0,4(a0) # f8010004 <__freertos_irq_stack_top+0xf80097a4>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1e58:	01055513          	srli	a0,a0,0x10
    }
    1e5c:	0ff57513          	zext.b	a0,a0
    1e60:	00008067          	ret

00001e64 <uart_readOccupancy>:
    1e64:	00452503          	lw	a0,4(a0)
    }
    1e68:	01855513          	srli	a0,a0,0x18
    1e6c:	00008067          	ret

00001e70 <uart_write>:
    static void uart_write(u32 reg, char data){
    1e70:	ff010113          	addi	sp,sp,-16
    1e74:	00112623          	sw	ra,12(sp)
    1e78:	00812423          	sw	s0,8(sp)
    1e7c:	00912223          	sw	s1,4(sp)
    1e80:	00050413          	mv	s0,a0
    1e84:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1e88:	00040513          	mv	a0,s0
    1e8c:	fc9ff0ef          	jal	1e54 <uart_writeAvailability>
    1e90:	fe050ce3          	beqz	a0,1e88 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1e94:	00942023          	sw	s1,0(s0)
    }
    1e98:	00c12083          	lw	ra,12(sp)
    1e9c:	00812403          	lw	s0,8(sp)
    1ea0:	00412483          	lw	s1,4(sp)
    1ea4:	01010113          	addi	sp,sp,16
    1ea8:	00008067          	ret

00001eac <uart_read>:
* @note    The function waits until there is data available in the UART buffer
*          for reading. Once data is available, it reads the character data from
*          the UART data register and returns it.
*
******************************************************************************/
    static char uart_read(u32 reg){
    1eac:	ff010113          	addi	sp,sp,-16
    1eb0:	00112623          	sw	ra,12(sp)
    1eb4:	00812423          	sw	s0,8(sp)
    1eb8:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
    1ebc:	00040513          	mv	a0,s0
    1ec0:	fa5ff0ef          	jal	1e64 <uart_readOccupancy>
    1ec4:	fe050ce3          	beqz	a0,1ebc <uart_read+0x10>
        return *((volatile u32*) address);
    1ec8:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
    1ecc:	0ff57513          	zext.b	a0,a0
    1ed0:	00c12083          	lw	ra,12(sp)
    1ed4:	00812403          	lw	s0,8(sp)
    1ed8:	01010113          	addi	sp,sp,16
    1edc:	00008067          	ret

00001ee0 <uart_applyConfig>:
*          value using data length, parity, and stop bit settings from the configuration
*          structure, and writes this value to the UART frame configuration register.
*
******************************************************************************/
    static void uart_applyConfig(u32 reg, Uart_Config *config){
        write_u32(config->clockDivider, reg + UART_CLOCK_DIVIDER);
    1ee0:	00c5a783          	lw	a5,12(a1)
        *((volatile u32*) address) = data;
    1ee4:	00f52423          	sw	a5,8(a0)
        write_u32(((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16), reg + UART_FRAME_CONFIG);
    1ee8:	0005a783          	lw	a5,0(a1)
    1eec:	fff78793          	addi	a5,a5,-1
    1ef0:	0045a703          	lw	a4,4(a1)
    1ef4:	00871713          	slli	a4,a4,0x8
    1ef8:	00e7e7b3          	or	a5,a5,a4
    1efc:	0085a703          	lw	a4,8(a1)
    1f00:	01071713          	slli	a4,a4,0x10
    1f04:	00e7e7b3          	or	a5,a5,a4
    1f08:	00f52623          	sw	a5,12(a0)
    }
    1f0c:	00008067          	ret

00001f10 <uart_status_read>:
        return *((volatile u32*) address);
    1f10:	00452503          	lw	a0,4(a0)
*
******************************************************************************/    
    static u32 uart_status_read(u32 reg)
     {
    	 return read_u32(reg+UART_STATUS);
     }
    1f14:	00008067          	ret

00001f18 <uart_status_write>:
        *((volatile u32*) address) = data;
    1f18:	00b52223          	sw	a1,4(a0)
*
******************************************************************************/
    static void uart_status_write(u32 reg, char data)
    {
    	write_u32(data ,reg+UART_STATUS);
    }
    1f1c:	00008067          	ret

00001f20 <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
    1f20:	000f47b7          	lui	a5,0xf4
    1f24:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed9e0>
    1f28:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1f2c:	0000c7b7          	lui	a5,0xc
    1f30:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5798>
    1f34:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1f38:	00062783          	lw	a5,0(a2) # f8b00000 <__freertos_irq_stack_top+0xf8af97a0>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1f3c:	02a585b3          	mul	a1,a1,a0
    1f40:	00f58733          	add	a4,a1,a5
    1f44:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    1f48:	40f707b3          	sub	a5,a4,a5
    1f4c:	fe07dce3          	bgez	a5,1f44 <clint_uDelay+0x24>
    1f50:	00008067          	ret

00001f54 <_putchar>:
    static void _putchar(char character){
    1f54:	ff010113          	addi	sp,sp,-16
    1f58:	00112623          	sw	ra,12(sp)
    1f5c:	00050593          	mv	a1,a0
            bsp_putChar(character);
    1f60:	f8010537          	lui	a0,0xf8010
    1f64:	f0dff0ef          	jal	1e70 <uart_write>
    }
    1f68:	00c12083          	lw	ra,12(sp)
    1f6c:	01010113          	addi	sp,sp,16
    1f70:	00008067          	ret

00001f74 <_putchar_s>:
    {
    1f74:	ff010113          	addi	sp,sp,-16
    1f78:	00112623          	sw	ra,12(sp)
    1f7c:	00812423          	sw	s0,8(sp)
    1f80:	00050413          	mv	s0,a0
        while (*p)
    1f84:	00c0006f          	j	1f90 <_putchar_s+0x1c>
            _putchar(*(p++));
    1f88:	00140413          	addi	s0,s0,1
    1f8c:	fc9ff0ef          	jal	1f54 <_putchar>
        while (*p)
    1f90:	00044503          	lbu	a0,0(s0)
    1f94:	fe051ae3          	bnez	a0,1f88 <_putchar_s+0x14>
    }
    1f98:	00c12083          	lw	ra,12(sp)
    1f9c:	00812403          	lw	s0,8(sp)
    1fa0:	01010113          	addi	sp,sp,16
    1fa4:	00008067          	ret

00001fa8 <bsp_printHex>:
    {
    1fa8:	ff010113          	addi	sp,sp,-16
    1fac:	00112623          	sw	ra,12(sp)
    1fb0:	00812423          	sw	s0,8(sp)
    1fb4:	00912223          	sw	s1,4(sp)
    1fb8:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1fbc:	01c00413          	li	s0,28
    1fc0:	0240006f          	j	1fe4 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    1fc4:	0084d733          	srl	a4,s1,s0
    1fc8:	00f77713          	andi	a4,a4,15
    1fcc:	000047b7          	lui	a5,0x4
    1fd0:	38078793          	addi	a5,a5,896 # 4380 <_data+0x4>
    1fd4:	00e787b3          	add	a5,a5,a4
    1fd8:	0007c503          	lbu	a0,0(a5)
    1fdc:	f79ff0ef          	jal	1f54 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1fe0:	ffc40413          	addi	s0,s0,-4
    1fe4:	fe0450e3          	bgez	s0,1fc4 <bsp_printHex+0x1c>
    }
    1fe8:	00c12083          	lw	ra,12(sp)
    1fec:	00812403          	lw	s0,8(sp)
    1ff0:	00412483          	lw	s1,4(sp)
    1ff4:	01010113          	addi	sp,sp,16
    1ff8:	00008067          	ret

00001ffc <bsp_printHex_lower>:
    {
    1ffc:	ff010113          	addi	sp,sp,-16
    2000:	00112623          	sw	ra,12(sp)
    2004:	00812423          	sw	s0,8(sp)
    2008:	00912223          	sw	s1,4(sp)
    200c:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2010:	01c00413          	li	s0,28
    2014:	0240006f          	j	2038 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    2018:	0084d733          	srl	a4,s1,s0
    201c:	00f77713          	andi	a4,a4,15
    2020:	000047b7          	lui	a5,0x4
    2024:	39478793          	addi	a5,a5,916 # 4394 <_data+0x18>
    2028:	00e787b3          	add	a5,a5,a4
    202c:	0007c503          	lbu	a0,0(a5)
    2030:	f25ff0ef          	jal	1f54 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2034:	ffc40413          	addi	s0,s0,-4
    2038:	fe0450e3          	bgez	s0,2018 <bsp_printHex_lower+0x1c>
    }
    203c:	00c12083          	lw	ra,12(sp)
    2040:	00812403          	lw	s0,8(sp)
    2044:	00412483          	lw	s1,4(sp)
    2048:	01010113          	addi	sp,sp,16
    204c:	00008067          	ret

00002050 <bsp_printf_c>:
    {
    2050:	ff010113          	addi	sp,sp,-16
    2054:	00112623          	sw	ra,12(sp)
        _putchar(c);
    2058:	0ff57513          	zext.b	a0,a0
    205c:	ef9ff0ef          	jal	1f54 <_putchar>
    }
    2060:	00c12083          	lw	ra,12(sp)
    2064:	01010113          	addi	sp,sp,16
    2068:	00008067          	ret

0000206c <bsp_printf_s>:
    {
    206c:	ff010113          	addi	sp,sp,-16
    2070:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    2074:	f01ff0ef          	jal	1f74 <_putchar_s>
    }
    2078:	00c12083          	lw	ra,12(sp)
    207c:	01010113          	addi	sp,sp,16
    2080:	00008067          	ret

00002084 <bsp_printf_d>:
    {
    2084:	fd010113          	addi	sp,sp,-48
    2088:	02112623          	sw	ra,44(sp)
    208c:	02812423          	sw	s0,40(sp)
    2090:	02912223          	sw	s1,36(sp)
    2094:	00050493          	mv	s1,a0
        if (val < 0) {
    2098:	00054663          	bltz	a0,20a4 <bsp_printf_d+0x20>
    {
    209c:	00010413          	mv	s0,sp
    20a0:	02c0006f          	j	20cc <bsp_printf_d+0x48>
            bsp_printf_c('-');
    20a4:	02d00513          	li	a0,45
    20a8:	fa9ff0ef          	jal	2050 <bsp_printf_c>
            val = -val;
    20ac:	409004b3          	neg	s1,s1
    20b0:	fedff06f          	j	209c <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    20b4:	00a00713          	li	a4,10
    20b8:	02e4e7b3          	rem	a5,s1,a4
    20bc:	03078793          	addi	a5,a5,48
    20c0:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    20c4:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    20c8:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    20cc:	fe0494e3          	bnez	s1,20b4 <bsp_printf_d+0x30>
    20d0:	00010793          	mv	a5,sp
    20d4:	fef400e3          	beq	s0,a5,20b4 <bsp_printf_d+0x30>
        while (p != buffer)
    20d8:	00010793          	mv	a5,sp
    20dc:	00f40a63          	beq	s0,a5,20f0 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    20e0:	fff40413          	addi	s0,s0,-1
    20e4:	00044503          	lbu	a0,0(s0)
    20e8:	f69ff0ef          	jal	2050 <bsp_printf_c>
    20ec:	fedff06f          	j	20d8 <bsp_printf_d+0x54>
    }
    20f0:	02c12083          	lw	ra,44(sp)
    20f4:	02812403          	lw	s0,40(sp)
    20f8:	02412483          	lw	s1,36(sp)
    20fc:	03010113          	addi	sp,sp,48
    2100:	00008067          	ret

00002104 <bsp_printf_x>:
    {
    2104:	ff010113          	addi	sp,sp,-16
    2108:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    210c:	00000713          	li	a4,0
    2110:	00700793          	li	a5,7
    2114:	02e7c063          	blt	a5,a4,2134 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    2118:	00271693          	slli	a3,a4,0x2
    211c:	ff000793          	li	a5,-16
    2120:	00d797b3          	sll	a5,a5,a3
    2124:	00f577b3          	and	a5,a0,a5
    2128:	00078663          	beqz	a5,2134 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    212c:	00170713          	addi	a4,a4,1
    2130:	fe1ff06f          	j	2110 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    2134:	ec9ff0ef          	jal	1ffc <bsp_printHex_lower>
    }
    2138:	00c12083          	lw	ra,12(sp)
    213c:	01010113          	addi	sp,sp,16
    2140:	00008067          	ret

00002144 <bsp_printf_X>:
        {
    2144:	ff010113          	addi	sp,sp,-16
    2148:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    214c:	00000713          	li	a4,0
    2150:	00700793          	li	a5,7
    2154:	02e7c063          	blt	a5,a4,2174 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    2158:	00271693          	slli	a3,a4,0x2
    215c:	ff000793          	li	a5,-16
    2160:	00d797b3          	sll	a5,a5,a3
    2164:	00f577b3          	and	a5,a0,a5
    2168:	00078663          	beqz	a5,2174 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    216c:	00170713          	addi	a4,a4,1
    2170:	fe1ff06f          	j	2150 <bsp_printf_X+0xc>
            bsp_printHex(val);
    2174:	e35ff0ef          	jal	1fa8 <bsp_printHex>
        }
    2178:	00c12083          	lw	ra,12(sp)
    217c:	01010113          	addi	sp,sp,16
    2180:	00008067          	ret

00002184 <bsp_init>:
    *   1. UART baudrate
    *   2. 
    */
////////////////////////////////////////////////////////////////////////////////
    static void bsp_init()
    {
    2184:	fe010113          	addi	sp,sp,-32
    2188:	00112e23          	sw	ra,28(sp)
        Uart_Config uartConfig;
        uartConfig.dataLength   = BITS_8;
    218c:	00800793          	li	a5,8
    2190:	00f12023          	sw	a5,0(sp)
        uartConfig.parity       = NONE;
    2194:	00012223          	sw	zero,4(sp)
        uartConfig.stop         = ONE;
    2198:	00012423          	sw	zero,8(sp)
        uartConfig.clockDivider = BSP_CLINT_HZ/(BSP_UART_BAUDRATE*BSP_UART_DATA_LEN)-1;
    219c:	06b00793          	li	a5,107
    21a0:	00f12623          	sw	a5,12(sp)
        uart_applyConfig(BSP_UART_TERMINAL, &uartConfig);    
    21a4:	00010593          	mv	a1,sp
    21a8:	f8010537          	lui	a0,0xf8010
    21ac:	d35ff0ef          	jal	1ee0 <uart_applyConfig>
    }
    21b0:	01c12083          	lw	ra,28(sp)
    21b4:	02010113          	addi	sp,sp,32
    21b8:	00008067          	ret

000021bc <plic_set_priority>:
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    21bc:	00259593          	slli	a1,a1,0x2
    21c0:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    21c4:	00c5a023          	sw	a2,0(a1)
    }
    21c8:	00008067          	ret

000021cc <plic_set_enable>:
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    21cc:	00759593          	slli	a1,a1,0x7
    21d0:	00a585b3          	add	a1,a1,a0
    21d4:	00565793          	srli	a5,a2,0x5
    21d8:	00279793          	slli	a5,a5,0x2
    21dc:	00f587b3          	add	a5,a1,a5
    21e0:	00002737          	lui	a4,0x2
    21e4:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
    21e8:	00100713          	li	a4,1
    21ec:	00c71633          	sll	a2,a4,a2
        if (enable)
    21f0:	00068a63          	beqz	a3,2204 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    21f4:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
    21f8:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
    21fc:	00c7a023          	sw	a2,0(a5)
    }
    2200:	00008067          	ret
        return *((volatile u32*) address);
    2204:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) & ~mask, word);
    2208:	fff64613          	not	a2,a2
    220c:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
    2210:	00c7a023          	sw	a2,0(a5)
    }
    2214:	00008067          	ret

00002218 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    2218:	00c59593          	slli	a1,a1,0xc
    221c:	00a585b3          	add	a1,a1,a0
    2220:	002007b7          	lui	a5,0x200
    2224:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f97a4>
    2228:	00f585b3          	add	a1,a1,a5
        return *((volatile u32*) address);
    222c:	0005a503          	lw	a0,0(a1)
    }
    2230:	00008067          	ret

00002234 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    2234:	00c59593          	slli	a1,a1,0xc
    2238:	00a585b3          	add	a1,a1,a0
    223c:	002007b7          	lui	a5,0x200
    2240:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f97a4>
    2244:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
    2248:	00c5a023          	sw	a2,0(a1)
    }
    224c:	00008067          	ret

00002250 <dmasg_input_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_input_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2250:	00759593          	slli	a1,a1,0x7
    2254:	00a58533          	add	a0,a1,a0
    2258:	00c52023          	sw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf80097a0>
        write_u32(address, ca + DMASG_CHANNEL_INPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_INPUT_CONFIG);
    225c:	fff68693          	addi	a3,a3,-1 # feffff <__freertos_irq_stack_top+0xfe979f>
    2260:	000017b7          	lui	a5,0x1
    2264:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2268:	00e6f6b3          	and	a3,a3,a4
    226c:	00f6e6b3          	or	a3,a3,a5
    2270:	00d52623          	sw	a3,12(a0)
    }
    2274:	00008067          	ret

00002278 <dmasg_output_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_output_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2278:	00759593          	slli	a1,a1,0x7
    227c:	00a58533          	add	a0,a1,a0
    2280:	00c52823          	sw	a2,16(a0)
        write_u32(address, ca + DMASG_CHANNEL_OUTPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    2284:	fff68693          	addi	a3,a3,-1
    2288:	000017b7          	lui	a5,0x1
    228c:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2290:	00e6f6b3          	and	a3,a3,a4
    2294:	00f6e6b3          	or	a3,a3,a5
    2298:	00d52e23          	sw	a3,28(a0)
    }
    229c:	00008067          	ret

000022a0 <dmasg_input_stream>:
*                              contain one packet and force its completion when fully transferred 
*                              into memory.
*
*******************************************************************************/   
    static void dmasg_input_stream(u32 base, u32 channel, u32 port, u32 wait_on_packet, u32 completion_on_packet){
        u32 ca = dmasg_ca(base, channel);
    22a0:	00759593          	slli	a1,a1,0x7
    22a4:	00a58533          	add	a0,a1,a0
    22a8:	00c52423          	sw	a2,8(a0)
        write_u32(port << 0, ca + DMASG_CHANNEL_INPUT_STREAM);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    22ac:	00070e63          	beqz	a4,22c8 <dmasg_input_stream+0x28>
    22b0:	000027b7          	lui	a5,0x2
    22b4:	00068e63          	beqz	a3,22d0 <dmasg_input_stream+0x30>
    22b8:	00004737          	lui	a4,0x4
    22bc:	00e7e7b3          	or	a5,a5,a4
    22c0:	00f52623          	sw	a5,12(a0)
    }
    22c4:	00008067          	ret
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    22c8:	00000793          	li	a5,0
    22cc:	fe9ff06f          	j	22b4 <dmasg_input_stream+0x14>
    22d0:	00000713          	li	a4,0
    22d4:	fe9ff06f          	j	22bc <dmasg_input_stream+0x1c>

000022d8 <dmasg_output_stream>:
* @param last: Specifies if an end of packet should be sent at the end of the transfer
*              (only for direct DMA control, not linked list)
*
*******************************************************************************/
    static void dmasg_output_stream(u32 base, u32 channel, u32 port, u32 source, u32 sink, u32 last){
        u32 ca = dmasg_ca(base, channel);
    22d8:	00759593          	slli	a1,a1,0x7
    22dc:	00a58533          	add	a0,a1,a0
        write_u32(port << 0 | source << 8 | sink << 16, ca + DMASG_CHANNEL_OUTPUT_STREAM);
    22e0:	00869693          	slli	a3,a3,0x8
    22e4:	00c6e6b3          	or	a3,a3,a2
    22e8:	01071713          	slli	a4,a4,0x10
    22ec:	00e6e6b3          	or	a3,a3,a4
    22f0:	00d52c23          	sw	a3,24(a0)
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_STREAM | (last ? DMASG_CHANNEL_OUTPUT_CONFIG_LAST : 0), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    22f4:	00078463          	beqz	a5,22fc <dmasg_output_stream+0x24>
    22f8:	000027b7          	lui	a5,0x2
    22fc:	00f52e23          	sw	a5,28(a0)
    }
    2300:	00008067          	ret

00002304 <dmasg_direct_start>:
*                      The DESCRIPTOR_COMPLETION_HALF interrupt can be usefull 
*                      in that mode.
*
*******************************************************************************/
    static void dmasg_direct_start(u32 base, u32 channel, u32 bytes, u32 self_restart){
        u32 ca = dmasg_ca(base, channel);
    2304:	00759593          	slli	a1,a1,0x7
    2308:	00a58533          	add	a0,a1,a0
        write_u32(bytes-1, ca + DMASG_CHANNEL_DIRECT_BYTES);
    230c:	fff60613          	addi	a2,a2,-1
    2310:	02c52023          	sw	a2,32(a0)
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2314:	00068863          	beqz	a3,2324 <dmasg_direct_start+0x20>
    2318:	00300793          	li	a5,3
    231c:	02f52623          	sw	a5,44(a0)
    }
    2320:	00008067          	ret
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2324:	00100793          	li	a5,1
    2328:	ff5ff06f          	j	231c <dmasg_direct_start+0x18>

0000232c <dmasg_interrupt_config>:
*       This function clear all pending interrupts for the given channel 
*       before enabling the mask's interrupts.
*
*******************************************************************************/
    static void dmasg_interrupt_config(u32 base, u32 channel, u32 mask){
        u32 ca = dmasg_ca(base, channel);
    232c:	00759593          	slli	a1,a1,0x7
    2330:	00a58533          	add	a0,a1,a0
    2334:	fff00793          	li	a5,-1
    2338:	04f52a23          	sw	a5,84(a0)
    233c:	04c52823          	sw	a2,80(a0)
        write_u32(0xFFFFFFFF, ca+DMASG_CHANNEL_INTERRUPT_PENDING);
        write_u32(mask, ca+DMASG_CHANNEL_INTERRUPT_ENABLE);
    }
    2340:	00008067          	ret

00002344 <dmasg_busy>:
*
* @return 1 if the channel is busy, 0 otherwise
*
*******************************************************************************/
    static u32 dmasg_busy(u32 base, u32 channel){
        u32 ca = dmasg_ca(base, channel);
    2344:	00759593          	slli	a1,a1,0x7
    2348:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
    234c:	02c5a503          	lw	a0,44(a1)
        return read_u32(ca + DMASG_CHANNEL_STATUS) & DMASG_CHANNEL_STATUS_BUSY;
    }
    2350:	00157513          	andi	a0,a0,1
    2354:	00008067          	ret

00002358 <dmasg_priority>:
* @param priority: Priority of the channel
* @param weight: Weight of the channel
*
*******************************************************************************/  
    static void dmasg_priority(u32 base, u32 channel, u32 priority, u32 weight){
        u32 ca = dmasg_ca(base, channel);
    2358:	00759593          	slli	a1,a1,0x7
    235c:	00a585b3          	add	a1,a1,a0
        write_u32(priority| weight << 8,  ca+DMASG_CHANNEL_PRIORITY);
    2360:	00869693          	slli	a3,a3,0x8
    2364:	00c6e6b3          	or	a3,a3,a2
        *((volatile u32*) address) = data;
    2368:	04d5a223          	sw	a3,68(a1)
    }
    236c:	00008067          	ret

00002370 <bsp_printf>:
    {
    2370:	fc010113          	addi	sp,sp,-64
    2374:	00112e23          	sw	ra,28(sp)
    2378:	00812c23          	sw	s0,24(sp)
    237c:	00912a23          	sw	s1,20(sp)
    2380:	00050493          	mv	s1,a0
    2384:	02b12223          	sw	a1,36(sp)
    2388:	02c12423          	sw	a2,40(sp)
    238c:	02d12623          	sw	a3,44(sp)
    2390:	02e12823          	sw	a4,48(sp)
    2394:	02f12a23          	sw	a5,52(sp)
    2398:	03012c23          	sw	a6,56(sp)
    239c:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    23a0:	02410793          	addi	a5,sp,36
    23a4:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    23a8:	00000413          	li	s0,0
    23ac:	01c0006f          	j	23c8 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    23b0:	00c12783          	lw	a5,12(sp)
    23b4:	00478713          	addi	a4,a5,4 # 2004 <bsp_printHex_lower+0x8>
    23b8:	00e12623          	sw	a4,12(sp)
    23bc:	0007a503          	lw	a0,0(a5)
    23c0:	c91ff0ef          	jal	2050 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    23c4:	00140413          	addi	s0,s0,1
    23c8:	008487b3          	add	a5,s1,s0
    23cc:	0007c503          	lbu	a0,0(a5)
    23d0:	0a050e63          	beqz	a0,248c <bsp_printf+0x11c>
            if (format[i] == '%') {
    23d4:	02500793          	li	a5,37
    23d8:	06f50e63          	beq	a0,a5,2454 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    23dc:	c75ff0ef          	jal	2050 <bsp_printf_c>
    23e0:	fe5ff06f          	j	23c4 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    23e4:	00c12783          	lw	a5,12(sp)
    23e8:	00478713          	addi	a4,a5,4
    23ec:	00e12623          	sw	a4,12(sp)
    23f0:	0007a503          	lw	a0,0(a5)
    23f4:	c79ff0ef          	jal	206c <bsp_printf_s>
                        break;
    23f8:	fcdff06f          	j	23c4 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    23fc:	00c12783          	lw	a5,12(sp)
    2400:	00478713          	addi	a4,a5,4
    2404:	00e12623          	sw	a4,12(sp)
    2408:	0007a503          	lw	a0,0(a5)
    240c:	c79ff0ef          	jal	2084 <bsp_printf_d>
                        break;
    2410:	fb5ff06f          	j	23c4 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    2414:	00c12783          	lw	a5,12(sp)
    2418:	00478713          	addi	a4,a5,4
    241c:	00e12623          	sw	a4,12(sp)
    2420:	0007a503          	lw	a0,0(a5)
    2424:	d21ff0ef          	jal	2144 <bsp_printf_X>
                        break;
    2428:	f9dff06f          	j	23c4 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    242c:	00c12783          	lw	a5,12(sp)
    2430:	00478713          	addi	a4,a5,4
    2434:	00e12623          	sw	a4,12(sp)
    2438:	0007a503          	lw	a0,0(a5)
    243c:	cc9ff0ef          	jal	2104 <bsp_printf_x>
                        break;
    2440:	f85ff06f          	j	23c4 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    2444:	00004537          	lui	a0,0x4
    2448:	3a850513          	addi	a0,a0,936 # 43a8 <_data+0x2c>
    244c:	c21ff0ef          	jal	206c <bsp_printf_s>
                        break;
    2450:	f75ff06f          	j	23c4 <bsp_printf+0x54>
                while (format[++i]) {
    2454:	00140413          	addi	s0,s0,1
    2458:	008487b3          	add	a5,s1,s0
    245c:	0007c783          	lbu	a5,0(a5)
    2460:	f60782e3          	beqz	a5,23c4 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    2464:	fa878793          	addi	a5,a5,-88
    2468:	0ff7f693          	zext.b	a3,a5
    246c:	02000713          	li	a4,32
    2470:	fed762e3          	bltu	a4,a3,2454 <bsp_printf+0xe4>
    2474:	00269793          	slli	a5,a3,0x2
    2478:	00005737          	lui	a4,0x5
    247c:	d8070713          	addi	a4,a4,-640 # 4d80 <_data+0xa04>
    2480:	00e787b3          	add	a5,a5,a4
    2484:	0007a783          	lw	a5,0(a5)
    2488:	00078067          	jr	a5
    }
    248c:	01c12083          	lw	ra,28(sp)
    2490:	01812403          	lw	s0,24(sp)
    2494:	01412483          	lw	s1,20(sp)
    2498:	04010113          	addi	sp,sp,64
    249c:	00008067          	ret

000024a0 <Read_Latency>:
}

#endif

static inline void Read_Latency()
{
    24a0:	fe010113          	addi	sp,sp,-32
    24a4:	00112e23          	sw	ra,28(sp)
    24a8:	00812c23          	sw	s0,24(sp)
    24ac:	00912a23          	sw	s1,20(sp)
    24b0:	01212823          	sw	s2,16(sp)
    24b4:	01312623          	sw	s3,12(sp)
        return *((volatile u32*) address);
    24b8:	f81007b7          	lui	a5,0xf8100
    24bc:	0a07a483          	lw	s1,160(a5) # f81000a0 <__freertos_irq_stack_top+0xf80f9840>
	u32 valid_status = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG40_OFFSET);
	for(int i=0; i<12; i++)
    24c0:	00000413          	li	s0,0
    24c4:	01c0006f          	j	24e0 <Read_Latency+0x40>
			bsp_uDelay(DELAY_BUSY);

			switch(i)
			{
				case 0:
					overflow == 0 ? bsp_printf("TOTAL ISP minimum latency: %d clock cycles\n\r", counter_data):
    24c8:	08091863          	bnez	s2,2558 <Read_Latency+0xb8>
    24cc:	00098593          	mv	a1,s3
    24d0:	00004537          	lui	a0,0x4
    24d4:	41450513          	addi	a0,a0,1044 # 4414 <_data+0x98>
    24d8:	e99ff0ef          	jal	2370 <bsp_printf>
	for(int i=0; i<12; i++)
    24dc:	00140413          	addi	s0,s0,1
    24e0:	00b00793          	li	a5,11
    24e4:	2687c663          	blt	a5,s0,2750 <Read_Latency+0x2b0>
		if(valid_status & (1 << i) != 0)
    24e8:	00100793          	li	a5,1
    24ec:	008797b3          	sll	a5,a5,s0
    24f0:	00f03733          	snez	a4,a5
    24f4:	00977733          	and	a4,a4,s1
    24f8:	fe0702e3          	beqz	a4,24dc <Read_Latency+0x3c>
        *((volatile u32*) address) = data;
    24fc:	f8100737          	lui	a4,0xf8100
    2500:	04f72423          	sw	a5,72(a4) # f8100048 <__freertos_irq_stack_top+0xf80f97e8>
			u32 counter_data = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4) >> 1;
    2504:	00241793          	slli	a5,s0,0x2
    2508:	f8100737          	lui	a4,0xf8100
    250c:	07070713          	addi	a4,a4,112 # f8100070 <__freertos_irq_stack_top+0xf80f9810>
    2510:	00e787b3          	add	a5,a5,a4
        return *((volatile u32*) address);
    2514:	0007a983          	lw	s3,0(a5)
    2518:	0019d993          	srli	s3,s3,0x1
    251c:	0007a783          	lw	a5,0(a5)
			u32 overflow     = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4) & 1;
    2520:	0017f913          	andi	s2,a5,1
			bsp_uDelay(DELAY_BUSY);
    2524:	f8b00637          	lui	a2,0xf8b00
    2528:	05f5e5b7          	lui	a1,0x5f5e
    252c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2530:	00500513          	li	a0,5
    2534:	9edff0ef          	jal	1f20 <clint_uDelay>
			switch(i)
    2538:	00b00793          	li	a5,11
    253c:	fa87e0e3          	bltu	a5,s0,24dc <Read_Latency+0x3c>
    2540:	00241793          	slli	a5,s0,0x2
    2544:	00005737          	lui	a4,0x5
    2548:	e0470713          	addi	a4,a4,-508 # 4e04 <_data+0xa88>
    254c:	00e787b3          	add	a5,a5,a4
    2550:	0007a783          	lw	a5,0(a5)
    2554:	00078067          	jr	a5
								    bsp_printf("TOTAL ISP minimum latency: OVERFLOW\n\r", counter_data);
    2558:	00098593          	mv	a1,s3
    255c:	00004537          	lui	a0,0x4
    2560:	44450513          	addi	a0,a0,1092 # 4444 <_data+0xc8>
    2564:	e0dff0ef          	jal	2370 <bsp_printf>
    2568:	f75ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 1:
					overflow == 0 ? bsp_printf("BLC minimum latency: %d clock cycles\n\r", counter_data):
    256c:	00091c63          	bnez	s2,2584 <Read_Latency+0xe4>
    2570:	00098593          	mv	a1,s3
    2574:	00004537          	lui	a0,0x4
    2578:	46c50513          	addi	a0,a0,1132 # 446c <_data+0xf0>
    257c:	df5ff0ef          	jal	2370 <bsp_printf>
    2580:	f5dff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("BLC minimum latency: OVERFLOW\n\r", counter_data);
    2584:	00098593          	mv	a1,s3
    2588:	00004537          	lui	a0,0x4
    258c:	49450513          	addi	a0,a0,1172 # 4494 <_data+0x118>
    2590:	de1ff0ef          	jal	2370 <bsp_printf>
    2594:	f49ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 2:
					overflow == 0 ? bsp_printf("COLOUR GAIN minimum latency: %d clock cycles\n\r", counter_data):
    2598:	00091c63          	bnez	s2,25b0 <Read_Latency+0x110>
    259c:	00098593          	mv	a1,s3
    25a0:	00004537          	lui	a0,0x4
    25a4:	4b450513          	addi	a0,a0,1204 # 44b4 <_data+0x138>
    25a8:	dc9ff0ef          	jal	2370 <bsp_printf>
    25ac:	f31ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("COLOUR GAIN minimum latency: OVERFLOW\n\r", counter_data);
    25b0:	00098593          	mv	a1,s3
    25b4:	00004537          	lui	a0,0x4
    25b8:	4e450513          	addi	a0,a0,1252 # 44e4 <_data+0x168>
    25bc:	db5ff0ef          	jal	2370 <bsp_printf>
    25c0:	f1dff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 3:
					overflow == 0 ? bsp_printf("DEMOSAIC minimum latency: %d clock cycles\n\r", counter_data):
    25c4:	00091c63          	bnez	s2,25dc <Read_Latency+0x13c>
    25c8:	00098593          	mv	a1,s3
    25cc:	00004537          	lui	a0,0x4
    25d0:	50c50513          	addi	a0,a0,1292 # 450c <_data+0x190>
    25d4:	d9dff0ef          	jal	2370 <bsp_printf>
    25d8:	f05ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("DEMOSAIC minimum latency: OVERFLOW\n\r", counter_data);
    25dc:	00098593          	mv	a1,s3
    25e0:	00004537          	lui	a0,0x4
    25e4:	53850513          	addi	a0,a0,1336 # 4538 <_data+0x1bc>
    25e8:	d89ff0ef          	jal	2370 <bsp_printf>
    25ec:	ef1ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 4:
					overflow == 0 ? bsp_printf("CCM minimum latency: %d clock cycles\n\r", counter_data):
    25f0:	00091c63          	bnez	s2,2608 <Read_Latency+0x168>
    25f4:	00098593          	mv	a1,s3
    25f8:	00004537          	lui	a0,0x4
    25fc:	56050513          	addi	a0,a0,1376 # 4560 <_data+0x1e4>
    2600:	d71ff0ef          	jal	2370 <bsp_printf>
    2604:	ed9ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("CCM minimum latency: OVERFLOW\n\r", counter_data);
    2608:	00098593          	mv	a1,s3
    260c:	00004537          	lui	a0,0x4
    2610:	58850513          	addi	a0,a0,1416 # 4588 <_data+0x20c>
    2614:	d5dff0ef          	jal	2370 <bsp_printf>
    2618:	ec5ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 5:
					overflow == 0 ? bsp_printf("GAMMA minimum latency: %d clock cycles\n\r", counter_data):
    261c:	00091c63          	bnez	s2,2634 <Read_Latency+0x194>
    2620:	00098593          	mv	a1,s3
    2624:	00004537          	lui	a0,0x4
    2628:	5a850513          	addi	a0,a0,1448 # 45a8 <_data+0x22c>
    262c:	d45ff0ef          	jal	2370 <bsp_printf>
    2630:	eadff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("GAMMA minimum latency: OVERFLOW\n\r", counter_data);
    2634:	00098593          	mv	a1,s3
    2638:	00004537          	lui	a0,0x4
    263c:	5d450513          	addi	a0,a0,1492 # 45d4 <_data+0x258>
    2640:	d31ff0ef          	jal	2370 <bsp_printf>
    2644:	e99ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 6:
					overflow == 0 ? bsp_printf("TOTAL ISP maximum latency: %d clock cycles\n\r", counter_data):
    2648:	00091c63          	bnez	s2,2660 <Read_Latency+0x1c0>
    264c:	00098593          	mv	a1,s3
    2650:	00004537          	lui	a0,0x4
    2654:	5f850513          	addi	a0,a0,1528 # 45f8 <_data+0x27c>
    2658:	d19ff0ef          	jal	2370 <bsp_printf>
    265c:	e81ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("TOTAL ISP maximum latency: OVERFLOW\n\r", counter_data);
    2660:	00098593          	mv	a1,s3
    2664:	00004537          	lui	a0,0x4
    2668:	62850513          	addi	a0,a0,1576 # 4628 <_data+0x2ac>
    266c:	d05ff0ef          	jal	2370 <bsp_printf>
    2670:	e6dff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 7:
					overflow == 0 ? bsp_printf("BLC maximum latency: %d clock cycles\n\r", counter_data):
    2674:	00091c63          	bnez	s2,268c <Read_Latency+0x1ec>
    2678:	00098593          	mv	a1,s3
    267c:	00004537          	lui	a0,0x4
    2680:	65050513          	addi	a0,a0,1616 # 4650 <_data+0x2d4>
    2684:	cedff0ef          	jal	2370 <bsp_printf>
    2688:	e55ff06f          	j	24dc <Read_Latency+0x3c>
					                bsp_printf("BLC maximum latency: OVERFLOW\n\r", counter_data);
    268c:	00098593          	mv	a1,s3
    2690:	00004537          	lui	a0,0x4
    2694:	67850513          	addi	a0,a0,1656 # 4678 <_data+0x2fc>
    2698:	cd9ff0ef          	jal	2370 <bsp_printf>
    269c:	e41ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 8:
					overflow == 0 ? bsp_printf("COLOUR GAIN maximum latency: %d clock cycles\n\r", counter_data):
    26a0:	00091c63          	bnez	s2,26b8 <Read_Latency+0x218>
    26a4:	00098593          	mv	a1,s3
    26a8:	00004537          	lui	a0,0x4
    26ac:	69850513          	addi	a0,a0,1688 # 4698 <_data+0x31c>
    26b0:	cc1ff0ef          	jal	2370 <bsp_printf>
    26b4:	e29ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("COLOUR GAIN maximum latency: OVERFLOW\n\r", counter_data);
    26b8:	00098593          	mv	a1,s3
    26bc:	00004537          	lui	a0,0x4
    26c0:	6c850513          	addi	a0,a0,1736 # 46c8 <_data+0x34c>
    26c4:	cadff0ef          	jal	2370 <bsp_printf>
    26c8:	e15ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 9:
					overflow == 0 ? bsp_printf("DEMOSAIC maximum latency: %d clock cycles\n\r", counter_data):
    26cc:	00091c63          	bnez	s2,26e4 <Read_Latency+0x244>
    26d0:	00098593          	mv	a1,s3
    26d4:	00004537          	lui	a0,0x4
    26d8:	6f050513          	addi	a0,a0,1776 # 46f0 <_data+0x374>
    26dc:	c95ff0ef          	jal	2370 <bsp_printf>
    26e0:	dfdff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("DEMOSAIC maximum latency: OVERFLOW\n\r", counter_data);
    26e4:	00098593          	mv	a1,s3
    26e8:	00004537          	lui	a0,0x4
    26ec:	71c50513          	addi	a0,a0,1820 # 471c <_data+0x3a0>
    26f0:	c81ff0ef          	jal	2370 <bsp_printf>
    26f4:	de9ff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 10:
					overflow == 0 ? bsp_printf("CCM maximum latency: %d clock cycles\n\r", counter_data):
    26f8:	00091c63          	bnez	s2,2710 <Read_Latency+0x270>
    26fc:	00098593          	mv	a1,s3
    2700:	00004537          	lui	a0,0x4
    2704:	74450513          	addi	a0,a0,1860 # 4744 <_data+0x3c8>
    2708:	c69ff0ef          	jal	2370 <bsp_printf>
    270c:	dd1ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("CCM maximum latency: OVERFLOW\n\r", counter_data);
    2710:	00098593          	mv	a1,s3
    2714:	00004537          	lui	a0,0x4
    2718:	76c50513          	addi	a0,a0,1900 # 476c <_data+0x3f0>
    271c:	c55ff0ef          	jal	2370 <bsp_printf>
    2720:	dbdff06f          	j	24dc <Read_Latency+0x3c>
				break;
				case 11:
					overflow == 0 ? bsp_printf("GAMMA maximum latency: %d clock cycles\n\r", counter_data):
    2724:	00091c63          	bnez	s2,273c <Read_Latency+0x29c>
    2728:	00098593          	mv	a1,s3
    272c:	00004537          	lui	a0,0x4
    2730:	78c50513          	addi	a0,a0,1932 # 478c <_data+0x410>
    2734:	c3dff0ef          	jal	2370 <bsp_printf>
    2738:	da5ff06f          	j	24dc <Read_Latency+0x3c>
								    bsp_printf("GAMMA maximum latency: OVERFLOW\n\r", counter_data);
    273c:	00098593          	mv	a1,s3
    2740:	00004537          	lui	a0,0x4
    2744:	7b850513          	addi	a0,a0,1976 # 47b8 <_data+0x43c>
    2748:	c29ff0ef          	jal	2370 <bsp_printf>
    274c:	d91ff06f          	j	24dc <Read_Latency+0x3c>
				break;
			}
		}
	}
}
    2750:	01c12083          	lw	ra,28(sp)
    2754:	01812403          	lw	s0,24(sp)
    2758:	01412483          	lw	s1,20(sp)
    275c:	01012903          	lw	s2,16(sp)
    2760:	00c12983          	lw	s3,12(sp)
    2764:	02010113          	addi	sp,sp,32
    2768:	00008067          	ret

0000276c <rgb2grayscale>:

void rgb2grayscale(volatile uint32_t in_array[], volatile uint32_t out_array[], uint32_t width, uint32_t height)
{
   uint8_t red, green, blue, grayscale;

   for (int i = 0; i < (width * height); i++)
    276c:	00000313          	li	t1,0
    2770:	0880006f          	j	27f8 <rgb2grayscale+0x8c>
   {
      red = (in_array[i]) & 0xff;
    2774:	00231e13          	slli	t3,t1,0x2
    2778:	01c507b3          	add	a5,a0,t3
    277c:	0007a703          	lw	a4,0(a5)
      green = ((in_array[i]) >> 8) & 0xff;
    2780:	0007a883          	lw	a7,0(a5)
    2784:	0088d893          	srli	a7,a7,0x8
      blue = ((in_array[i]) >> 16) & 0xff;
    2788:	0007a803          	lw	a6,0(a5)
    278c:	01085813          	srli	a6,a6,0x10

      grayscale = (30 * red + 59 * green + 11 * blue) / 100;
    2790:	0ff77713          	zext.b	a4,a4
    2794:	00471793          	slli	a5,a4,0x4
    2798:	40e787b3          	sub	a5,a5,a4
    279c:	00179793          	slli	a5,a5,0x1
    27a0:	0ff8f893          	zext.b	a7,a7
    27a4:	00489713          	slli	a4,a7,0x4
    27a8:	41170733          	sub	a4,a4,a7
    27ac:	00271713          	slli	a4,a4,0x2
    27b0:	41170733          	sub	a4,a4,a7
    27b4:	00e787b3          	add	a5,a5,a4
    27b8:	0ff87813          	zext.b	a6,a6
    27bc:	00181713          	slli	a4,a6,0x1
    27c0:	01070733          	add	a4,a4,a6
    27c4:	00271713          	slli	a4,a4,0x2
    27c8:	41070733          	sub	a4,a4,a6
    27cc:	00e787b3          	add	a5,a5,a4
    27d0:	06400713          	li	a4,100
    27d4:	02e7c7b3          	div	a5,a5,a4
      out_array[i] = (grayscale << 16) + (grayscale << 8) + (grayscale);
    27d8:	0ff7f793          	zext.b	a5,a5
    27dc:	01079713          	slli	a4,a5,0x10
    27e0:	00879813          	slli	a6,a5,0x8
    27e4:	01070733          	add	a4,a4,a6
    27e8:	01c58e33          	add	t3,a1,t3
    27ec:	00f707b3          	add	a5,a4,a5
    27f0:	00fe2023          	sw	a5,0(t3)
   for (int i = 0; i < (width * height); i++)
    27f4:	00130313          	addi	t1,t1,1
    27f8:	02d607b3          	mul	a5,a2,a3
    27fc:	f6f36ce3          	bltu	t1,a5,2774 <rgb2grayscale+0x8>
   }

   return;
}
    2800:	00008067          	ret

00002804 <uart_interrupt_init>:
{
    2804:	ff010113          	addi	sp,sp,-16
    2808:	00112623          	sw	ra,12(sp)
    bsp_init();
    280c:	979ff0ef          	jal	2184 <bsp_init>
    uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2810:	f8010537          	lui	a0,0xf8010
    2814:	efcff0ef          	jal	1f10 <uart_status_read>
    2818:	00256593          	ori	a1,a0,2
    281c:	0ff5f593          	zext.b	a1,a1
    2820:	f8010537          	lui	a0,0xf8010
    2824:	ef4ff0ef          	jal	1f18 <uart_status_write>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
    2828:	00100693          	li	a3,1
    282c:	00100613          	li	a2,1
    2830:	00000593          	li	a1,0
    2834:	f8c00537          	lui	a0,0xf8c00
    2838:	995ff0ef          	jal	21cc <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 2); // 1
    283c:	00200613          	li	a2,2
    2840:	00100593          	li	a1,1
    2844:	f8c00537          	lui	a0,0xf8c00
    2848:	975ff0ef          	jal	21bc <plic_set_priority>
}
    284c:	00c12083          	lw	ra,12(sp)
    2850:	01010113          	addi	sp,sp,16
    2854:	00008067          	ret

00002858 <trigger_next_display_dma>:
{
    2858:	ff010113          	addi	sp,sp,-16
    285c:	00112623          	sw	ra,12(sp)
    if (select_demo_mode == 0 || select_demo_mode == 3)
    2860:	8341a783          	lw	a5,-1996(gp) # 56cc <select_demo_mode>
    2864:	02078663          	beqz	a5,2890 <trigger_next_display_dma+0x38>
    2868:	00300713          	li	a4,3
    286c:	02e78263          	beq	a5,a4,2890 <trigger_next_display_dma+0x38>
    else if (select_demo_mode == 1)
    2870:	00100713          	li	a4,1
    2874:	08e78063          	beq	a5,a4,28f4 <trigger_next_display_dma+0x9c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, SOBEL_START_ADDR, 16);
    2878:	01000693          	li	a3,16
    287c:	00900637          	lui	a2,0x900
    2880:	00200593          	li	a1,2
    2884:	f8110537          	lui	a0,0xf8110
    2888:	9c9ff0ef          	jal	2250 <dmasg_input_memory>
    288c:	0180006f          	j	28a4 <trigger_next_display_dma+0x4c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    2890:	01000693          	li	a3,16
    2894:	00100637          	lui	a2,0x100
    2898:	00200593          	li	a1,2
    289c:	f8110537          	lui	a0,0xf8110
    28a0:	9b1ff0ef          	jal	2250 <dmasg_input_memory>
    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    28a4:	00100793          	li	a5,1
    28a8:	00000713          	li	a4,0
    28ac:	00000693          	li	a3,0
    28b0:	00000613          	li	a2,0
    28b4:	00200593          	li	a1,2
    28b8:	f8110537          	lui	a0,0xf8110
    28bc:	a1dff0ef          	jal	22d8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    28c0:	00400613          	li	a2,4
    28c4:	00200593          	li	a1,2
    28c8:	f8110537          	lui	a0,0xf8110
    28cc:	a61ff0ef          	jal	232c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restar
    28d0:	00000693          	li	a3,0
    28d4:	0011d637          	lui	a2,0x11d
    28d8:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x1163e0>
    28dc:	00200593          	li	a1,2
    28e0:	f8110537          	lui	a0,0xf8110
    28e4:	a21ff0ef          	jal	2304 <dmasg_direct_start>
}
    28e8:	00c12083          	lw	ra,12(sp)
    28ec:	01010113          	addi	sp,sp,16
    28f0:	00008067          	ret
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16);
    28f4:	01000693          	li	a3,16
    28f8:	00500637          	lui	a2,0x500
    28fc:	00200593          	li	a1,2
    2900:	f8110537          	lui	a0,0xf8110
    2904:	94dff0ef          	jal	2250 <dmasg_input_memory>
    2908:	f9dff06f          	j	28a4 <trigger_next_display_dma+0x4c>

0000290c <uart_buffer_read>:
{
    290c:	ff010113          	addi	sp,sp,-16
    2910:	00112623          	sw	ra,12(sp)
    2914:	00812423          	sw	s0,8(sp)
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2918:	0340006f          	j	294c <uart_buffer_read+0x40>
            if (uart_cmd_index > 0) {
    291c:	82d1c783          	lbu	a5,-2003(gp) # 56c5 <uart_cmd_index>
    2920:	0ff7f793          	zext.b	a5,a5
    2924:	02078463          	beqz	a5,294c <uart_buffer_read+0x40>
                uart_cmd_buffer[uart_cmd_index] = '\0';
    2928:	82d1c683          	lbu	a3,-2003(gp) # 56c5 <uart_cmd_index>
    292c:	97c18793          	addi	a5,gp,-1668 # 5814 <uart_cmd_buffer>
    2930:	00d787b3          	add	a5,a5,a3
    2934:	00078023          	sb	zero,0(a5)
                uart_cmd_ready = true;
    2938:	00100693          	li	a3,1
    293c:	82d18623          	sb	a3,-2004(gp) # 56c4 <uart_cmd_ready>
                uart_cmd_index = 0;         // reset for next command
    2940:	820186a3          	sb	zero,-2003(gp) # 56c5 <uart_cmd_index>
            continue;
    2944:	0080006f          	j	294c <uart_buffer_read+0x40>
            uart_cmd_index = 0;
    2948:	820186a3          	sb	zero,-2003(gp) # 56c5 <uart_cmd_index>
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    294c:	f8010537          	lui	a0,0xf8010
    2950:	dc0ff0ef          	jal	1f10 <uart_status_read>
    2954:	20057513          	andi	a0,a0,512
    2958:	06050e63          	beqz	a0,29d4 <uart_buffer_read+0xc8>
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD); // RX FIFO not empty interrupt Disable
    295c:	f8010537          	lui	a0,0xf8010
    2960:	db0ff0ef          	jal	1f10 <uart_status_read>
    2964:	0fd57593          	andi	a1,a0,253
    2968:	f8010537          	lui	a0,0xf8010
    296c:	dacff0ef          	jal	1f18 <uart_status_write>
        char c = uart_read(BSP_UART_TERMINAL);
    2970:	f8010537          	lui	a0,0xf8010
    2974:	d38ff0ef          	jal	1eac <uart_read>
    2978:	00050413          	mv	s0,a0
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    297c:	f8010537          	lui	a0,0xf8010
    2980:	d90ff0ef          	jal	1f10 <uart_status_read>
    2984:	00256593          	ori	a1,a0,2
    2988:	0ff5f593          	zext.b	a1,a1
    298c:	f8010537          	lui	a0,0xf8010
    2990:	d88ff0ef          	jal	1f18 <uart_status_write>
        if (c == '\r' || c == '\n') {
    2994:	00d00793          	li	a5,13
    2998:	f8f402e3          	beq	s0,a5,291c <uart_buffer_read+0x10>
    299c:	00a00793          	li	a5,10
    29a0:	f6f40ee3          	beq	s0,a5,291c <uart_buffer_read+0x10>
        if (uart_cmd_index < UART_CMD_MAX_LEN - 1) {
    29a4:	82d1c783          	lbu	a5,-2003(gp) # 56c5 <uart_cmd_index>
    29a8:	0ff7f793          	zext.b	a5,a5
    29ac:	03e00713          	li	a4,62
    29b0:	f8f76ce3          	bltu	a4,a5,2948 <uart_buffer_read+0x3c>
            uart_cmd_buffer[uart_cmd_index++] = c;
    29b4:	82d1c703          	lbu	a4,-2003(gp) # 56c5 <uart_cmd_index>
    29b8:	00170793          	addi	a5,a4,1
    29bc:	0ff7f793          	zext.b	a5,a5
    29c0:	82f186a3          	sb	a5,-2003(gp) # 56c5 <uart_cmd_index>
    29c4:	97c18793          	addi	a5,gp,-1668 # 5814 <uart_cmd_buffer>
    29c8:	00e787b3          	add	a5,a5,a4
    29cc:	00878023          	sb	s0,0(a5)
    29d0:	f7dff06f          	j	294c <uart_buffer_read+0x40>
    if (uart_cmd_ready) {
    29d4:	82c1c783          	lbu	a5,-2004(gp) # 56c4 <uart_cmd_ready>
    29d8:	0ff7f793          	zext.b	a5,a5
    29dc:	00079a63          	bnez	a5,29f0 <uart_buffer_read+0xe4>
}
    29e0:	00c12083          	lw	ra,12(sp)
    29e4:	00812403          	lw	s0,8(sp)
    29e8:	01010113          	addi	sp,sp,16
    29ec:	00008067          	ret
        var = uart_cmd_buffer[0];
    29f0:	97c18413          	addi	s0,gp,-1668 # 5814 <uart_cmd_buffer>
    29f4:	00044783          	lbu	a5,0(s0)
    29f8:	0ff7f793          	zext.b	a5,a5
    29fc:	96f18c23          	sb	a5,-1672(gp) # 5810 <var>
        data= atoi(&uart_cmd_buffer[1]);
    2a00:	97d18513          	addi	a0,gp,-1667 # 5815 <uart_cmd_buffer+0x1>
    2a04:	e6cfe0ef          	jal	1070 <atoi>
    2a08:	96a1aa23          	sw	a0,-1676(gp) # 580c <data>
        char_data= uart_cmd_buffer[1];
    2a0c:	00144783          	lbu	a5,1(s0)
    2a10:	0ff7f793          	zext.b	a5,a5
    2a14:	96f18823          	sb	a5,-1680(gp) # 5808 <char_data>
}
    2a18:	fc9ff06f          	j	29e0 <uart_buffer_read+0xd4>

00002a1c <settings>:
    if (uart_cmd_ready)
    2a1c:	82c1c783          	lbu	a5,-2004(gp) # 56c4 <uart_cmd_ready>
    2a20:	0ff7f793          	zext.b	a5,a5
    2a24:	3c078a63          	beqz	a5,2df8 <settings+0x3dc>
    {uart_cmd_ready = false; // Reset command ready flag
    2a28:	82018623          	sb	zero,-2004(gp) # 56c4 <uart_cmd_ready>
        switch (var)
    2a2c:	9781c783          	lbu	a5,-1672(gp) # 5810 <var>
    2a30:	fd078793          	addi	a5,a5,-48
    2a34:	0ff7f693          	zext.b	a3,a5
    2a38:	01500713          	li	a4,21
    2a3c:	3ad76e63          	bltu	a4,a3,2df8 <settings+0x3dc>
{
    2a40:	ff010113          	addi	sp,sp,-16
    2a44:	00112623          	sw	ra,12(sp)
        switch (var)
    2a48:	00269793          	slli	a5,a3,0x2
    2a4c:	00005737          	lui	a4,0x5
    2a50:	e3470713          	addi	a4,a4,-460 # 4e34 <_data+0xab8>
    2a54:	00e787b3          	add	a5,a5,a4
    2a58:	0007a783          	lw	a5,0(a5)
    2a5c:	00078067          	jr	a5
            if (char_data == 'a')
    2a60:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2a64:	0ff7f793          	zext.b	a5,a5
    2a68:	06100713          	li	a4,97
    2a6c:	06e78c63          	beq	a5,a4,2ae4 <settings+0xc8>
            else if (char_data == 'b')
    2a70:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2a74:	0ff7f793          	zext.b	a5,a5
    2a78:	06200713          	li	a4,98
    2a7c:	06e78e63          	beq	a5,a4,2af8 <settings+0xdc>
            else if (char_data == 'c')
    2a80:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2a84:	0ff7f793          	zext.b	a5,a5
    2a88:	06300713          	li	a4,99
    2a8c:	08e78263          	beq	a5,a4,2b10 <settings+0xf4>
            else if (char_data == 'd')
    2a90:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2a94:	0ff7f793          	zext.b	a5,a5
    2a98:	06400713          	li	a4,100
    2a9c:	08e78663          	beq	a5,a4,2b28 <settings+0x10c>
            else if (char_data == 'e')
    2aa0:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2aa4:	0ff7f793          	zext.b	a5,a5
    2aa8:	06500713          	li	a4,101
    2aac:	08e78a63          	beq	a5,a4,2b40 <settings+0x124>
            else if (char_data == 'f')
    2ab0:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2ab4:	0ff7f793          	zext.b	a5,a5
    2ab8:	06600713          	li	a4,102
    2abc:	08e78e63          	beq	a5,a4,2b58 <settings+0x13c>
            else if (char_data == 'g')
    2ac0:	9701c783          	lbu	a5,-1680(gp) # 5808 <char_data>
    2ac4:	0ff7f793          	zext.b	a5,a5
    2ac8:	06700713          	li	a4,103
    2acc:	0ae78263          	beq	a5,a4,2b70 <settings+0x154>
                bsp_printf("Invalid Demo Mode: %c\n\r", char_data);
    2ad0:	9701c583          	lbu	a1,-1680(gp) # 5808 <char_data>
    2ad4:	00005537          	lui	a0,0x5
    2ad8:	88450513          	addi	a0,a0,-1916 # 4884 <_data+0x508>
    2adc:	895ff0ef          	jal	2370 <bsp_printf>
    2ae0:	0d00006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 0;
    2ae4:	8201aa23          	sw	zero,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: a\n\r");
    2ae8:	00004537          	lui	a0,0x4
    2aec:	7dc50513          	addi	a0,a0,2012 # 47dc <_data+0x460>
    2af0:	881ff0ef          	jal	2370 <bsp_printf>
    2af4:	0bc0006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 1;
    2af8:	00100713          	li	a4,1
    2afc:	82e1aa23          	sw	a4,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: b\n\r");
    2b00:	00004537          	lui	a0,0x4
    2b04:	7f450513          	addi	a0,a0,2036 # 47f4 <_data+0x478>
    2b08:	869ff0ef          	jal	2370 <bsp_printf>
    2b0c:	0a40006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 2;
    2b10:	00200713          	li	a4,2
    2b14:	82e1aa23          	sw	a4,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: c\n\r");
    2b18:	00005537          	lui	a0,0x5
    2b1c:	80c50513          	addi	a0,a0,-2036 # 480c <_data+0x490>
    2b20:	851ff0ef          	jal	2370 <bsp_printf>
    2b24:	08c0006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 3;
    2b28:	00300713          	li	a4,3
    2b2c:	82e1aa23          	sw	a4,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: d\n\r");
    2b30:	00005537          	lui	a0,0x5
    2b34:	82450513          	addi	a0,a0,-2012 # 4824 <_data+0x4a8>
    2b38:	839ff0ef          	jal	2370 <bsp_printf>
    2b3c:	0740006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 4;
    2b40:	00400713          	li	a4,4
    2b44:	82e1aa23          	sw	a4,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: e\n\r");
    2b48:	00005537          	lui	a0,0x5
    2b4c:	83c50513          	addi	a0,a0,-1988 # 483c <_data+0x4c0>
    2b50:	821ff0ef          	jal	2370 <bsp_printf>
    2b54:	05c0006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 5;
    2b58:	00500713          	li	a4,5
    2b5c:	82e1aa23          	sw	a4,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: f\n\r");
    2b60:	00005537          	lui	a0,0x5
    2b64:	85450513          	addi	a0,a0,-1964 # 4854 <_data+0x4d8>
    2b68:	809ff0ef          	jal	2370 <bsp_printf>
    2b6c:	0440006f          	j	2bb0 <settings+0x194>
                select_demo_mode = 6;
    2b70:	00600713          	li	a4,6
    2b74:	82e1aa23          	sw	a4,-1996(gp) # 56cc <select_demo_mode>
                bsp_printf("Selected Demo Mode: g\n\r");
    2b78:	00005537          	lui	a0,0x5
    2b7c:	86c50513          	addi	a0,a0,-1940 # 486c <_data+0x4f0>
    2b80:	ff0ff0ef          	jal	2370 <bsp_printf>
    2b84:	02c0006f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 0, data);
    2b88:	9741a783          	lw	a5,-1676(gp) # 580c <data>
	u32 data = setting;
    2b8c:	01079793          	slli	a5,a5,0x10
    2b90:	0107d793          	srli	a5,a5,0x10
        *((volatile u32*) address) = data;
    2b94:	f8100737          	lui	a4,0xf8100
    2b98:	00f72023          	sw	a5,0(a4) # f8100000 <__freertos_irq_stack_top+0xf80f97a0>
	bsp_uDelay(DELAY_BUSY);
    2b9c:	f8b00637          	lui	a2,0xf8b00
    2ba0:	05f5e5b7          	lui	a1,0x5f5e
    2ba4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2ba8:	00500513          	li	a0,5
    2bac:	b74ff0ef          	jal	1f20 <clint_uDelay>
}
    2bb0:	00c12083          	lw	ra,12(sp)
    2bb4:	01010113          	addi	sp,sp,16
    2bb8:	00008067          	ret
            Set_Gain(0, 1, data);
    2bbc:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2bc0:	01071713          	slli	a4,a4,0x10
    2bc4:	01075713          	srli	a4,a4,0x10
    2bc8:	f81007b7          	lui	a5,0xf8100
    2bcc:	00e7aa23          	sw	a4,20(a5) # f8100014 <__freertos_irq_stack_top+0xf80f97b4>
	bsp_uDelay(DELAY_BUSY);
    2bd0:	f8b00637          	lui	a2,0xf8b00
    2bd4:	05f5e5b7          	lui	a1,0x5f5e
    2bd8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2bdc:	00500513          	li	a0,5
    2be0:	b40ff0ef          	jal	1f20 <clint_uDelay>
}
    2be4:	fcdff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 2, data);
    2be8:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2bec:	01071713          	slli	a4,a4,0x10
    2bf0:	01075713          	srli	a4,a4,0x10
    2bf4:	f81007b7          	lui	a5,0xf8100
    2bf8:	00e7ac23          	sw	a4,24(a5) # f8100018 <__freertos_irq_stack_top+0xf80f97b8>
	bsp_uDelay(DELAY_BUSY);
    2bfc:	f8b00637          	lui	a2,0xf8b00
    2c00:	05f5e5b7          	lui	a1,0x5f5e
    2c04:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2c08:	00500513          	li	a0,5
    2c0c:	b14ff0ef          	jal	1f20 <clint_uDelay>
}
    2c10:	fa1ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 3, data);
    2c14:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2c18:	01071713          	slli	a4,a4,0x10
    2c1c:	01075713          	srli	a4,a4,0x10
    2c20:	f81007b7          	lui	a5,0xf8100
    2c24:	00e7ae23          	sw	a4,28(a5) # f810001c <__freertos_irq_stack_top+0xf80f97bc>
	bsp_uDelay(DELAY_BUSY);
    2c28:	f8b00637          	lui	a2,0xf8b00
    2c2c:	05f5e5b7          	lui	a1,0x5f5e
    2c30:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2c34:	00500513          	li	a0,5
    2c38:	ae8ff0ef          	jal	1f20 <clint_uDelay>
}
    2c3c:	f75ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 4, data);
    2c40:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2c44:	01071713          	slli	a4,a4,0x10
    2c48:	01075713          	srli	a4,a4,0x10
    2c4c:	f81007b7          	lui	a5,0xf8100
    2c50:	02e7a023          	sw	a4,32(a5) # f8100020 <__freertos_irq_stack_top+0xf80f97c0>
	bsp_uDelay(DELAY_BUSY);
    2c54:	f8b00637          	lui	a2,0xf8b00
    2c58:	05f5e5b7          	lui	a1,0x5f5e
    2c5c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2c60:	00500513          	li	a0,5
    2c64:	abcff0ef          	jal	1f20 <clint_uDelay>
}
    2c68:	f49ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 5, data);
    2c6c:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2c70:	01071713          	slli	a4,a4,0x10
    2c74:	01075713          	srli	a4,a4,0x10
    2c78:	f81007b7          	lui	a5,0xf8100
    2c7c:	02e7a223          	sw	a4,36(a5) # f8100024 <__freertos_irq_stack_top+0xf80f97c4>
	bsp_uDelay(DELAY_BUSY);
    2c80:	f8b00637          	lui	a2,0xf8b00
    2c84:	05f5e5b7          	lui	a1,0x5f5e
    2c88:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2c8c:	00500513          	li	a0,5
    2c90:	a90ff0ef          	jal	1f20 <clint_uDelay>
}
    2c94:	f1dff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 6, data);
    2c98:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2c9c:	01071713          	slli	a4,a4,0x10
    2ca0:	01075713          	srli	a4,a4,0x10
    2ca4:	f81007b7          	lui	a5,0xf8100
    2ca8:	02e7a423          	sw	a4,40(a5) # f8100028 <__freertos_irq_stack_top+0xf80f97c8>
	bsp_uDelay(DELAY_BUSY);
    2cac:	f8b00637          	lui	a2,0xf8b00
    2cb0:	05f5e5b7          	lui	a1,0x5f5e
    2cb4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2cb8:	00500513          	li	a0,5
    2cbc:	a64ff0ef          	jal	1f20 <clint_uDelay>
}
    2cc0:	ef1ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 7, data);
    2cc4:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2cc8:	01071713          	slli	a4,a4,0x10
    2ccc:	01075713          	srli	a4,a4,0x10
    2cd0:	f81007b7          	lui	a5,0xf8100
    2cd4:	02e7a623          	sw	a4,44(a5) # f810002c <__freertos_irq_stack_top+0xf80f97cc>
	bsp_uDelay(DELAY_BUSY);
    2cd8:	f8b00637          	lui	a2,0xf8b00
    2cdc:	05f5e5b7          	lui	a1,0x5f5e
    2ce0:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2ce4:	00500513          	li	a0,5
    2ce8:	a38ff0ef          	jal	1f20 <clint_uDelay>
}
    2cec:	ec5ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 8, data);
    2cf0:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2cf4:	01071713          	slli	a4,a4,0x10
    2cf8:	01075713          	srli	a4,a4,0x10
    2cfc:	f81007b7          	lui	a5,0xf8100
    2d00:	02e7a823          	sw	a4,48(a5) # f8100030 <__freertos_irq_stack_top+0xf80f97d0>
	bsp_uDelay(DELAY_BUSY);
    2d04:	f8b00637          	lui	a2,0xf8b00
    2d08:	05f5e5b7          	lui	a1,0x5f5e
    2d0c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2d10:	00500513          	li	a0,5
    2d14:	a0cff0ef          	jal	1f20 <clint_uDelay>
}
    2d18:	e99ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 9, data);
    2d1c:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2d20:	01071713          	slli	a4,a4,0x10
    2d24:	01075713          	srli	a4,a4,0x10
    2d28:	f81007b7          	lui	a5,0xf8100
    2d2c:	02e7aa23          	sw	a4,52(a5) # f8100034 <__freertos_irq_stack_top+0xf80f97d4>
	bsp_uDelay(DELAY_BUSY);
    2d30:	f8b00637          	lui	a2,0xf8b00
    2d34:	05f5e5b7          	lui	a1,0x5f5e
    2d38:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2d3c:	00500513          	li	a0,5
    2d40:	9e0ff0ef          	jal	1f20 <clint_uDelay>
}
    2d44:	e6dff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 10, data);
    2d48:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2d4c:	01071713          	slli	a4,a4,0x10
    2d50:	01075713          	srli	a4,a4,0x10
    2d54:	f81007b7          	lui	a5,0xf8100
    2d58:	02e7ac23          	sw	a4,56(a5) # f8100038 <__freertos_irq_stack_top+0xf80f97d8>
	bsp_uDelay(DELAY_BUSY);
    2d5c:	f8b00637          	lui	a2,0xf8b00
    2d60:	05f5e5b7          	lui	a1,0x5f5e
    2d64:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2d68:	00500513          	li	a0,5
    2d6c:	9b4ff0ef          	jal	1f20 <clint_uDelay>
}
    2d70:	e41ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 11, data);
    2d74:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2d78:	01071713          	slli	a4,a4,0x10
    2d7c:	01075713          	srli	a4,a4,0x10
    2d80:	f81007b7          	lui	a5,0xf8100
    2d84:	02e7ae23          	sw	a4,60(a5) # f810003c <__freertos_irq_stack_top+0xf80f97dc>
	bsp_uDelay(DELAY_BUSY);
    2d88:	f8b00637          	lui	a2,0xf8b00
    2d8c:	05f5e5b7          	lui	a1,0x5f5e
    2d90:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2d94:	00500513          	li	a0,5
    2d98:	988ff0ef          	jal	1f20 <clint_uDelay>
}
    2d9c:	e15ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 12, data);
    2da0:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2da4:	01071713          	slli	a4,a4,0x10
    2da8:	01075713          	srli	a4,a4,0x10
    2dac:	f81007b7          	lui	a5,0xf8100
    2db0:	04e7a023          	sw	a4,64(a5) # f8100040 <__freertos_irq_stack_top+0xf80f97e0>
	bsp_uDelay(DELAY_BUSY);
    2db4:	f8b00637          	lui	a2,0xf8b00
    2db8:	05f5e5b7          	lui	a1,0x5f5e
    2dbc:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2dc0:	00500513          	li	a0,5
    2dc4:	95cff0ef          	jal	1f20 <clint_uDelay>
}
    2dc8:	de9ff06f          	j	2bb0 <settings+0x194>
            Set_Gain(0, 13, data);
    2dcc:	9741a703          	lw	a4,-1676(gp) # 580c <data>
	u32 data = setting;
    2dd0:	01071713          	slli	a4,a4,0x10
    2dd4:	01075713          	srli	a4,a4,0x10
    2dd8:	f81007b7          	lui	a5,0xf8100
    2ddc:	04e7a223          	sw	a4,68(a5) # f8100044 <__freertos_irq_stack_top+0xf80f97e4>
	bsp_uDelay(DELAY_BUSY);
    2de0:	f8b00637          	lui	a2,0xf8b00
    2de4:	05f5e5b7          	lui	a1,0x5f5e
    2de8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f578a0>
    2dec:	00500513          	li	a0,5
    2df0:	930ff0ef          	jal	1f20 <clint_uDelay>
}
    2df4:	dbdff06f          	j	2bb0 <settings+0x194>
    2df8:	00008067          	ret

00002dfc <externalInterrupt>:
{
    2dfc:	ff010113          	addi	sp,sp,-16
    2e00:	00112623          	sw	ra,12(sp)
    2e04:	00812423          	sw	s0,8(sp)
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2e08:	01c0006f          	j	2e24 <externalInterrupt+0x28>
            uart_buffer_read();
    2e0c:	b01ff0ef          	jal	290c <uart_buffer_read>
            settings();
    2e10:	c0dff0ef          	jal	2a1c <settings>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); // unmask the claimed interrupt
    2e14:	00040613          	mv	a2,s0
    2e18:	00000593          	li	a1,0
    2e1c:	f8c00537          	lui	a0,0xf8c00
    2e20:	c14ff0ef          	jal	2234 <plic_release>
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2e24:	00000593          	li	a1,0
    2e28:	f8c00537          	lui	a0,0xf8c00
    2e2c:	becff0ef          	jal	2218 <plic_claim>
    2e30:	00050413          	mv	s0,a0
    2e34:	02050e63          	beqz	a0,2e70 <externalInterrupt+0x74>
        switch (claim)
    2e38:	00100793          	li	a5,1
    2e3c:	fcf408e3          	beq	s0,a5,2e0c <externalInterrupt+0x10>
    2e40:	00600793          	li	a5,6
    2e44:	02f41263          	bne	s0,a5,2e68 <externalInterrupt+0x6c>
            if (display_mm2s_active && !(dmasg_busy(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL)))
    2e48:	8301a783          	lw	a5,-2000(gp) # 56c8 <display_mm2s_active>
    2e4c:	fc0784e3          	beqz	a5,2e14 <externalInterrupt+0x18>
    2e50:	00200593          	li	a1,2
    2e54:	f8110537          	lui	a0,0xf8110
    2e58:	cecff0ef          	jal	2344 <dmasg_busy>
    2e5c:	fa051ce3          	bnez	a0,2e14 <externalInterrupt+0x18>
                trigger_next_display_dma();
    2e60:	9f9ff0ef          	jal	2858 <trigger_next_display_dma>
    2e64:	fb1ff06f          	j	2e14 <externalInterrupt+0x18>
            crash();
    2e68:	d99fe0ef          	jal	1c00 <crash>
            break;
    2e6c:	fa9ff06f          	j	2e14 <externalInterrupt+0x18>
}
    2e70:	00c12083          	lw	ra,12(sp)
    2e74:	00812403          	lw	s0,8(sp)
    2e78:	01010113          	addi	sp,sp,16
    2e7c:	00008067          	ret

00002e80 <ispExample_menu>:
{
    2e80:	ff010113          	addi	sp,sp,-16
    2e84:	00112623          	sw	ra,12(sp)
    2e88:	00812423          	sw	s0,8(sp)
    bsp_printf("================================================================================\n\r");
    2e8c:	00005437          	lui	s0,0x5
    2e90:	89c40513          	addi	a0,s0,-1892 # 489c <_data+0x520>
    2e94:	cdcff0ef          	jal	2370 <bsp_printf>
    bsp_printf("                    ISP Example Design Scenario Selection\n\r");
    2e98:	00005537          	lui	a0,0x5
    2e9c:	8f050513          	addi	a0,a0,-1808 # 48f0 <_data+0x574>
    2ea0:	cd0ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("================================================================================\n\r");
    2ea4:	89c40513          	addi	a0,s0,-1892
    2ea8:	cc8ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'a' : Camera Capture + HDMI Display                                             \n\r");
    2eac:	00005537          	lui	a0,0x5
    2eb0:	92c50513          	addi	a0,a0,-1748 # 492c <_data+0x5b0>
    2eb4:	cbcff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'b' : Camera Capture + RGB2Grayscale (SW) + HDMI Display                        \n\r");
    2eb8:	00005537          	lui	a0,0x5
    2ebc:	98050513          	addi	a0,a0,-1664 # 4980 <_data+0x604>
    2ec0:	cb0ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'c' : Camera Capture + RGB2Grayscale (SW) + Sobel (HW) + HDMI Display           \n\r");
    2ec4:	00005537          	lui	a0,0x5
    2ec8:	9d450513          	addi	a0,a0,-1580 # 49d4 <_data+0x658>
    2ecc:	ca4ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'d' : Camera Capture + RGB2Grayscale (HW) + HDMI Display                        \n\r");
    2ed0:	00005537          	lui	a0,0x5
    2ed4:	a2850513          	addi	a0,a0,-1496 # 4a28 <_data+0x6ac>
    2ed8:	c98ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'e' : Camera Capture + RGB2Grayscale & Sobel (HW) + HDMI Display                \n\r");
    2edc:	00005537          	lui	a0,0x5
    2ee0:	a7c50513          	addi	a0,a0,-1412 # 4a7c <_data+0x700>
    2ee4:	c8cff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'f' : Camera Capture + RGB2Grayscale & Sobel & Dilation (HW) + HDMI Display     \n\r");
    2ee8:	00005537          	lui	a0,0x5
    2eec:	ad050513          	addi	a0,a0,-1328 # 4ad0 <_data+0x754>
    2ef0:	c80ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("'g' : Camera Capture + RGB2Grayscale & Sobel & Erosion  (HW) + HDMI Display     \n\r");
    2ef4:	00005537          	lui	a0,0x5
    2ef8:	b2450513          	addi	a0,a0,-1244 # 4b24 <_data+0x7a8>
    2efc:	c74ff0ef          	jal	2370 <bsp_printf>
    bsp_printf("================================================================================\n\n\r");
    2f00:	00005537          	lui	a0,0x5
    2f04:	b7850513          	addi	a0,a0,-1160 # 4b78 <_data+0x7fc>
    2f08:	c68ff0ef          	jal	2370 <bsp_printf>
}
    2f0c:	00c12083          	lw	ra,12(sp)
    2f10:	00812403          	lw	s0,8(sp)
    2f14:	01010113          	addi	sp,sp,16
    2f18:	00008067          	ret

00002f1c <i2c_masterBusy>:
        return *((volatile u32*) address);
    2f1c:	04052503          	lw	a0,64(a0)
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
    2f20:	00157513          	andi	a0,a0,1
    2f24:	00008067          	ret

00002f28 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    2f28:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    2f2c:	21000793          	li	a5,528
    2f30:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    2f34:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    2f38:	0107f793          	andi	a5,a5,16
    2f3c:	fe079ce3          	bnez	a5,2f34 <i2c_masterStartBlocking+0xc>
    }
    2f40:	00008067          	ret

00002f44 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
    2f44:	ff010113          	addi	sp,sp,-16
    2f48:	00112623          	sw	ra,12(sp)
    2f4c:	00812423          	sw	s0,8(sp)
    2f50:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    2f54:	00040513          	mv	a0,s0
    2f58:	fc5ff0ef          	jal	2f1c <i2c_masterBusy>
    2f5c:	fe051ce3          	bnez	a0,2f54 <i2c_masterStopWait+0x10>
    }
    2f60:	00c12083          	lw	ra,12(sp)
    2f64:	00812403          	lw	s0,8(sp)
    2f68:	01010113          	addi	sp,sp,16
    2f6c:	00008067          	ret

00002f70 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
    2f70:	ff010113          	addi	sp,sp,-16
    2f74:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    2f78:	42000713          	li	a4,1056
    2f7c:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
    2f80:	fc5ff0ef          	jal	2f44 <i2c_masterStopWait>
    }
    2f84:	00c12083          	lw	ra,12(sp)
    2f88:	01010113          	addi	sp,sp,16
    2f8c:	00008067          	ret

00002f90 <i2c_txAckWait>:
        return *((volatile u32*) address);
    2f90:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    2f94:	1007f793          	andi	a5,a5,256
    2f98:	fe079ce3          	bnez	a5,2f90 <i2c_txAckWait>
    }
    2f9c:	00008067          	ret

00002fa0 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
    2fa0:	ff010113          	addi	sp,sp,-16
    2fa4:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    2fa8:	30100713          	li	a4,769
    2fac:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
    2fb0:	fe1ff0ef          	jal	2f90 <i2c_txAckWait>
    }
    2fb4:	00c12083          	lw	ra,12(sp)
    2fb8:	01010113          	addi	sp,sp,16
    2fbc:	00008067          	ret

00002fc0 <i2c_rxAck>:
        return *((volatile u32*) address);
    2fc0:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    2fc4:	0ff57513          	zext.b	a0,a0
    }
    2fc8:	00153513          	seqz	a0,a0
    2fcc:	00008067          	ret

00002fd0 <PiCam_WriteRegData>:
#include "riscv.h"
#include "PiCamDriver.h"
#include "common.h"

void PiCam_WriteRegData(u32 i2c_base, u16 reg, u8 data)
{
    2fd0:	fe010113          	addi	sp,sp,-32
    2fd4:	00112e23          	sw	ra,28(sp)
    2fd8:	00812c23          	sw	s0,24(sp)
    2fdc:	00912a23          	sw	s1,20(sp)
    2fe0:	01212823          	sw	s2,16(sp)
    2fe4:	01312623          	sw	s3,12(sp)
    2fe8:	00050413          	mv	s0,a0
    2fec:	00058493          	mv	s1,a1
    2ff0:	00060913          	mv	s2,a2
   u8 outdata;

   i2c_masterStartBlocking(i2c_base);
    2ff4:	f35ff0ef          	jal	2f28 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    2ff8:	000017b7          	lui	a5,0x1
    2ffc:	b2078793          	addi	a5,a5,-1248 # b20 <CUSTOM2+0xac5>
    3000:	00f42023          	sw	a5,0(s0)

   i2c_txByte(i2c_base, 0x10 << 1);
   i2c_txNackBlocking(i2c_base);
    3004:	00040513          	mv	a0,s0
    3008:	f99ff0ef          	jal	2fa0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    300c:	00040513          	mv	a0,s0
    3010:	fb1ff0ef          	jal	2fc0 <i2c_rxAck>
    3014:	da5fe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg >> 8) & 0xFF);
    3018:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    301c:	000019b7          	lui	s3,0x1
    3020:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3024:	0137e7b3          	or	a5,a5,s3
    3028:	00f42023          	sw	a5,0(s0)
   i2c_txNackBlocking(i2c_base);
    302c:	00040513          	mv	a0,s0
    3030:	f71ff0ef          	jal	2fa0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3034:	00040513          	mv	a0,s0
    3038:	f89ff0ef          	jal	2fc0 <i2c_rxAck>
    303c:	d7dfe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg) & 0xFF);
    3040:	0ff4f493          	zext.b	s1,s1
    3044:	0134e4b3          	or	s1,s1,s3
    3048:	00942023          	sw	s1,0(s0)
   i2c_txNackBlocking(i2c_base);
    304c:	00040513          	mv	a0,s0
    3050:	f51ff0ef          	jal	2fa0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3054:	00040513          	mv	a0,s0
    3058:	f69ff0ef          	jal	2fc0 <i2c_rxAck>
    305c:	d5dfe0ef          	jal	1db8 <assert>
    3060:	01396933          	or	s2,s2,s3
    3064:	01242023          	sw	s2,0(s0)

   i2c_txByte(i2c_base, data & 0xFF);
   i2c_txNackBlocking(i2c_base);
    3068:	00040513          	mv	a0,s0
    306c:	f35ff0ef          	jal	2fa0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3070:	00040513          	mv	a0,s0
    3074:	f4dff0ef          	jal	2fc0 <i2c_rxAck>
    3078:	d41fe0ef          	jal	1db8 <assert>

   i2c_masterStopBlocking(i2c_base);
    307c:	00040513          	mv	a0,s0
    3080:	ef1ff0ef          	jal	2f70 <i2c_masterStopBlocking>
}
    3084:	01c12083          	lw	ra,28(sp)
    3088:	01812403          	lw	s0,24(sp)
    308c:	01412483          	lw	s1,20(sp)
    3090:	01012903          	lw	s2,16(sp)
    3094:	00c12983          	lw	s3,12(sp)
    3098:	02010113          	addi	sp,sp,32
    309c:	00008067          	ret

000030a0 <AccessCommSeq>:
   i2c_masterStopBlocking(i2c_base);

   return outdata;
}
void AccessCommSeq(u32 i2c_base)
{
    30a0:	ff010113          	addi	sp,sp,-16
    30a4:	00112623          	sw	ra,12(sp)
    30a8:	00812423          	sw	s0,8(sp)
    30ac:	00050413          	mv	s0,a0
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    30b0:	00500613          	li	a2,5
    30b4:	000035b7          	lui	a1,0x3
    30b8:	0eb58593          	addi	a1,a1,235 # 30eb <AccessCommSeq+0x4b>
    30bc:	f15ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x0C);
    30c0:	00c00613          	li	a2,12
    30c4:	000035b7          	lui	a1,0x3
    30c8:	0eb58593          	addi	a1,a1,235 # 30eb <AccessCommSeq+0x4b>
    30cc:	00040513          	mv	a0,s0
    30d0:	f01ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300A, 0xFF);
    30d4:	0ff00613          	li	a2,255
    30d8:	000035b7          	lui	a1,0x3
    30dc:	00a58593          	addi	a1,a1,10 # 300a <PiCam_WriteRegData+0x3a>
    30e0:	00040513          	mv	a0,s0
    30e4:	eedff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300B, 0xFF);
    30e8:	0ff00613          	li	a2,255
    30ec:	000035b7          	lui	a1,0x3
    30f0:	00b58593          	addi	a1,a1,11 # 300b <PiCam_WriteRegData+0x3b>
    30f4:	00040513          	mv	a0,s0
    30f8:	ed9ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    30fc:	00500613          	li	a2,5
    3100:	000035b7          	lui	a1,0x3
    3104:	0eb58593          	addi	a1,a1,235 # 30eb <AccessCommSeq+0x4b>
    3108:	00040513          	mv	a0,s0
    310c:	ec5ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x09);
    3110:	00900613          	li	a2,9
    3114:	000035b7          	lui	a1,0x3
    3118:	0eb58593          	addi	a1,a1,235 # 30eb <AccessCommSeq+0x4b>
    311c:	00040513          	mv	a0,s0
    3120:	eb1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
}
    3124:	00c12083          	lw	ra,12(sp)
    3128:	00812403          	lw	s0,8(sp)
    312c:	01010113          	addi	sp,sp,16
    3130:	00008067          	ret

00003134 <PiCam_Output_Size>:

void PiCam_Output_Size(u32 i2c_base, u16 X, u16 Y)
{
    3134:	ff010113          	addi	sp,sp,-16
    3138:	00112623          	sw	ra,12(sp)
    313c:	00812423          	sw	s0,8(sp)
    3140:	00912223          	sw	s1,4(sp)
    3144:	01212023          	sw	s2,0(sp)
    3148:	00050413          	mv	s0,a0
    314c:	00058913          	mv	s2,a1
    3150:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, x_output_size_A_1, X >> 8);
    3154:	0085d613          	srli	a2,a1,0x8
    3158:	16c00593          	li	a1,364
    315c:	e75ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, x_output_size_A_0, X & 0xFF);
    3160:	0ff97613          	zext.b	a2,s2
    3164:	16d00593          	li	a1,365
    3168:	00040513          	mv	a0,s0
    316c:	e65ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_1, Y >> 8);
    3170:	0084d613          	srli	a2,s1,0x8
    3174:	16e00593          	li	a1,366
    3178:	00040513          	mv	a0,s0
    317c:	e55ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_0, Y & 0xFF);
    3180:	0ff4f613          	zext.b	a2,s1
    3184:	16f00593          	li	a1,367
    3188:	00040513          	mv	a0,s0
    318c:	e45ff0ef          	jal	2fd0 <PiCam_WriteRegData>
}
    3190:	00c12083          	lw	ra,12(sp)
    3194:	00812403          	lw	s0,8(sp)
    3198:	00412483          	lw	s1,4(sp)
    319c:	00012903          	lw	s2,0(sp)
    31a0:	01010113          	addi	sp,sp,16
    31a4:	00008067          	ret

000031a8 <PiCam_Output_activePixel>:

void PiCam_Output_activePixel(u32 i2c_base, u16 XStart, u16 XEnd, u16 YStart, u16 YEnd)
{
    31a8:	fe010113          	addi	sp,sp,-32
    31ac:	00112e23          	sw	ra,28(sp)
    31b0:	00812c23          	sw	s0,24(sp)
    31b4:	00912a23          	sw	s1,20(sp)
    31b8:	01212823          	sw	s2,16(sp)
    31bc:	01312623          	sw	s3,12(sp)
    31c0:	01412423          	sw	s4,8(sp)
    31c4:	00050413          	mv	s0,a0
    31c8:	00058a13          	mv	s4,a1
    31cc:	00060993          	mv	s3,a2
    31d0:	00068913          	mv	s2,a3
    31d4:	00070493          	mv	s1,a4
   // Max Active pixel 3280* 2464--imx219
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_1, XStart >> 8);
    31d8:	0085d613          	srli	a2,a1,0x8
    31dc:	16400593          	li	a1,356
    31e0:	df1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_0, XStart & 0xFF);
    31e4:	0ffa7613          	zext.b	a2,s4
    31e8:	16500593          	li	a1,357
    31ec:	00040513          	mv	a0,s0
    31f0:	de1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_1, XEnd >> 8);
    31f4:	0089d613          	srli	a2,s3,0x8
    31f8:	16600593          	li	a1,358
    31fc:	00040513          	mv	a0,s0
    3200:	dd1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_0, XEnd & 0xFF);
    3204:	0ff9f613          	zext.b	a2,s3
    3208:	16700593          	li	a1,359
    320c:	00040513          	mv	a0,s0
    3210:	dc1ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_1, YStart >> 8);
    3214:	00895613          	srli	a2,s2,0x8
    3218:	16800593          	li	a1,360
    321c:	00040513          	mv	a0,s0
    3220:	db1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_0, YStart & 0xFF);
    3224:	0ff97613          	zext.b	a2,s2
    3228:	16900593          	li	a1,361
    322c:	00040513          	mv	a0,s0
    3230:	da1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
    3234:	0084d613          	srli	a2,s1,0x8
    3238:	16a00593          	li	a1,362
    323c:	00040513          	mv	a0,s0
    3240:	d91ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
    3244:	0ff4f613          	zext.b	a2,s1
    3248:	16b00593          	li	a1,363
    324c:	00040513          	mv	a0,s0
    3250:	d81ff0ef          	jal	2fd0 <PiCam_WriteRegData>
}
    3254:	01c12083          	lw	ra,28(sp)
    3258:	01812403          	lw	s0,24(sp)
    325c:	01412483          	lw	s1,20(sp)
    3260:	01012903          	lw	s2,16(sp)
    3264:	00c12983          	lw	s3,12(sp)
    3268:	00812a03          	lw	s4,8(sp)
    326c:	02010113          	addi	sp,sp,32
    3270:	00008067          	ret

00003274 <PiCam_SetBinningMode>:
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
}

void PiCam_SetBinningMode(u32 i2c_base, u8 Xmode, u8 Ymode)
{
    3274:	ff010113          	addi	sp,sp,-16
    3278:	00112623          	sw	ra,12(sp)
    327c:	00812423          	sw	s0,8(sp)
    3280:	00912223          	sw	s1,4(sp)
    3284:	00050493          	mv	s1,a0
    3288:	00060413          	mv	s0,a2
   // 0:no-binning
   // 1:x2-binning
   // 2:x4-binning
   // 3:x2 analog (special)

   if (Xmode >= 3)
    328c:	00200793          	li	a5,2
    3290:	00b7f463          	bgeu	a5,a1,3298 <PiCam_SetBinningMode+0x24>
      Xmode = 3;
    3294:	00300593          	li	a1,3
   if (Ymode >= 3)
    3298:	00200793          	li	a5,2
    329c:	0087f463          	bgeu	a5,s0,32a4 <PiCam_SetBinningMode+0x30>
      Ymode = 3;
    32a0:	00300413          	li	s0,3

   PiCam_WriteRegData(i2c_base, BINNING_MODE_H_A, Xmode);
    32a4:	00058613          	mv	a2,a1
    32a8:	17400593          	li	a1,372
    32ac:	00048513          	mv	a0,s1
    32b0:	d21ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, BINNING_MODE_V_A, Ymode);
    32b4:	00040613          	mv	a2,s0
    32b8:	17500593          	li	a1,373
    32bc:	00048513          	mv	a0,s1
    32c0:	d11ff0ef          	jal	2fd0 <PiCam_WriteRegData>
}
    32c4:	00c12083          	lw	ra,12(sp)
    32c8:	00812403          	lw	s0,8(sp)
    32cc:	00412483          	lw	s1,4(sp)
    32d0:	01010113          	addi	sp,sp,16
    32d4:	00008067          	ret

000032d8 <PiCam_Gainfilter>:

   PiCam_Output_ColorBarSize(i2c_base, X, Y);
}

void PiCam_Gainfilter(u32 i2c_base, u8 AGain, u16 DGain)
{
    32d8:	ff010113          	addi	sp,sp,-16
    32dc:	00112623          	sw	ra,12(sp)
    32e0:	00812423          	sw	s0,8(sp)
    32e4:	00912223          	sw	s1,4(sp)
    32e8:	00050413          	mv	s0,a0
    32ec:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, ANA_GAIN_GLOBAL_A, AGain & 0xFF);
    32f0:	00058613          	mv	a2,a1
    32f4:	15700593          	li	a1,343
    32f8:	cd9ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_1, (DGain >> 8) & 0x0F);
    32fc:	0084d613          	srli	a2,s1,0x8
    3300:	00f67613          	andi	a2,a2,15
    3304:	15800593          	li	a1,344
    3308:	00040513          	mv	a0,s0
    330c:	cc5ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_0, DGain & 0xFF);
    3310:	0ff4f613          	zext.b	a2,s1
    3314:	15900593          	li	a1,345
    3318:	00040513          	mv	a0,s0
    331c:	cb5ff0ef          	jal	2fd0 <PiCam_WriteRegData>
}
    3320:	00c12083          	lw	ra,12(sp)
    3324:	00812403          	lw	s0,8(sp)
    3328:	00412483          	lw	s1,4(sp)
    332c:	01010113          	addi	sp,sp,16
    3330:	00008067          	ret

00003334 <PiCam_init>:

// For cam1
void PiCam_init(u32 i2c_base)
{
    3334:	ff010113          	addi	sp,sp,-16
    3338:	00112623          	sw	ra,12(sp)
    333c:	00812423          	sw	s0,8(sp)
    3340:	00050413          	mv	s0,a0

   PiCam_WriteRegData(i2c_base, mode_select, 0x00);
    3344:	00000613          	li	a2,0
    3348:	10000593          	li	a1,256
    334c:	c85ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   AccessCommSeq(i2c_base);
    3350:	00040513          	mv	a0,s0
    3354:	d4dff0ef          	jal	30a0 <AccessCommSeq>
   PiCam_WriteRegData(i2c_base, CSI_LANE_MODE, 0x01);
    3358:	00100613          	li	a2,1
    335c:	11400593          	li	a1,276
    3360:	00040513          	mv	a0,s0
    3364:	c6dff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DPHY_CTRL, 0x00);
    3368:	00000613          	li	a2,0
    336c:	12800593          	li	a1,296
    3370:	00040513          	mv	a0,s0
    3374:	c5dff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_1, 0x18);
    3378:	01800613          	li	a2,24
    337c:	12a00593          	li	a1,298
    3380:	00040513          	mv	a0,s0
    3384:	c4dff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_0, 0x00);
    3388:	00000613          	li	a2,0
    338c:	12b00593          	li	a1,299
    3390:	00040513          	mv	a0,s0
    3394:	c3dff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x04);
    3398:	00400613          	li	a2,4
    339c:	16000593          	li	a1,352
    33a0:	00040513          	mv	a0,s0
    33a4:	c2dff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0x59);
    33a8:	05900613          	li	a2,89
    33ac:	16100593          	li	a1,353
    33b0:	00040513          	mv	a0,s0
    33b4:	c1dff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    33b8:	00d00613          	li	a2,13
    33bc:	16200593          	li	a1,354
    33c0:	00040513          	mv	a0,s0
    33c4:	c0dff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    33c8:	07800613          	li	a2,120
    33cc:	16300593          	li	a1,355
    33d0:	00040513          	mv	a0,s0
    33d4:	bfdff0ef          	jal	2fd0 <PiCam_WriteRegData>

   //   PiCam_Output_activePixel(i2c_base, 0, 3279, 0, 2463);
   PiCam_Output_activePixel(i2c_base, 680, 2599, 692, 1771); // Capture centre of sensor
    33d8:	6eb00713          	li	a4,1771
    33dc:	2b400693          	li	a3,692
    33e0:	00001637          	lui	a2,0x1
    33e4:	a2760613          	addi	a2,a2,-1497 # a27 <CUSTOM2+0x9cc>
    33e8:	2a800593          	li	a1,680
    33ec:	00040513          	mv	a0,s0
    33f0:	db9ff0ef          	jal	31a8 <PiCam_Output_activePixel>

   PiCam_Output_Size(i2c_base, 1920, 1080);
    33f4:	43800613          	li	a2,1080
    33f8:	78000593          	li	a1,1920
    33fc:	00040513          	mv	a0,s0
    3400:	d35ff0ef          	jal	3134 <PiCam_Output_Size>
   // PiCam_Output_Size(i2c_base, 1280, 720);
   // PiCam_Output_Size(i2c_base, 640, 480);

   PiCam_WriteRegData(i2c_base, X_ODD_INC_A, 0x01);
    3404:	00100613          	li	a2,1
    3408:	17000593          	li	a1,368
    340c:	00040513          	mv	a0,s0
    3410:	bc1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ODD_INC_A, 0x01);
    3414:	00100613          	li	a2,1
    3418:	17100593          	li	a1,369
    341c:	00040513          	mv	a0,s0
    3420:	bb1ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   // 0: No binning; 1: x2 binning; 2: x4 binning; 3: x2 binning (analog special)
   PiCam_SetBinningMode(i2c_base, 0, 0);
    3424:	00000613          	li	a2,0
    3428:	00000593          	li	a1,0
    342c:	00040513          	mv	a0,s0
    3430:	e45ff0ef          	jal	3274 <PiCam_SetBinningMode>

   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_1, 0x0A);
    3434:	00a00613          	li	a2,10
    3438:	18c00593          	li	a1,396
    343c:	00040513          	mv	a0,s0
    3440:	b91ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_0, 0x0A);
    3444:	00a00613          	li	a2,10
    3448:	18d00593          	li	a1,397
    344c:	00040513          	mv	a0,s0
    3450:	b81ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, VTPXCK_DIV, 0x05);
    3454:	00500613          	li	a2,5
    3458:	30100593          	li	a1,769
    345c:	00040513          	mv	a0,s0
    3460:	b71ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, VTSYCK_DIV, 0x01);
    3464:	00100613          	li	a2,1
    3468:	30300593          	li	a1,771
    346c:	00040513          	mv	a0,s0
    3470:	b61ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_VT_DIV, 0x03);
    3474:	00300613          	li	a2,3
    3478:	30400593          	li	a1,772
    347c:	00040513          	mv	a0,s0
    3480:	b51ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_OP_DIV, 0x03);
    3484:	00300613          	li	a2,3
    3488:	30500593          	li	a1,773
    348c:	00040513          	mv	a0,s0
    3490:	b41ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_1, 0x00);
    3494:	00000613          	li	a2,0
    3498:	30600593          	li	a1,774
    349c:	00040513          	mv	a0,s0
    34a0:	b31ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_0, 0x39);
    34a4:	03900613          	li	a2,57
    34a8:	30700593          	li	a1,775
    34ac:	00040513          	mv	a0,s0
    34b0:	b21ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    34b4:	00a00613          	li	a2,10
    34b8:	30900593          	li	a1,777
    34bc:	00040513          	mv	a0,s0
    34c0:	b11ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    34c4:	00100613          	li	a2,1
    34c8:	30b00593          	li	a1,779
    34cc:	00040513          	mv	a0,s0
    34d0:	b01ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    34d4:	00000613          	li	a2,0
    34d8:	30c00593          	li	a1,780
    34dc:	00040513          	mv	a0,s0
    34e0:	af1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    34e4:	07200613          	li	a2,114
    34e8:	30d00593          	li	a1,781
    34ec:	00040513          	mv	a0,s0
    34f0:	ae1ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    34f4:	00a00613          	li	a2,10
    34f8:	30900593          	li	a1,777
    34fc:	00040513          	mv	a0,s0
    3500:	ad1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    3504:	00100613          	li	a2,1
    3508:	30b00593          	li	a1,779
    350c:	00040513          	mv	a0,s0
    3510:	ac1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    3514:	00000613          	li	a2,0
    3518:	30c00593          	li	a1,780
    351c:	00040513          	mv	a0,s0
    3520:	ab1ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    3524:	07200613          	li	a2,114
    3528:	30d00593          	li	a1,781
    352c:	00040513          	mv	a0,s0
    3530:	aa1ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, mode_select, 0x01);
    3534:	00100613          	li	a2,1
    3538:	10000593          	li	a1,256
    353c:	00040513          	mv	a0,s0
    3540:	a91ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_Gainfilter(i2c_base, 0xB9, 0x200);
    3544:	20000613          	li	a2,512
    3548:	0b900593          	li	a1,185
    354c:	00040513          	mv	a0,s0
    3550:	d89ff0ef          	jal	32d8 <PiCam_Gainfilter>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    3554:	00d00613          	li	a2,13
    3558:	16200593          	li	a1,354
    355c:	00040513          	mv	a0,s0
    3560:	a71ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    3564:	07800613          	li	a2,120
    3568:	16300593          	li	a1,355
    356c:	00040513          	mv	a0,s0
    3570:	a61ff0ef          	jal	2fd0 <PiCam_WriteRegData>
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
   */

   // Longer camera exposure time, suitable for low light condition. Trade-off with lower frame rate.
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x06);
    3574:	00600613          	li	a2,6
    3578:	16000593          	li	a1,352
    357c:	00040513          	mv	a0,s0
    3580:	a51ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0xE3);
    3584:	0e300613          	li	a2,227
    3588:	16100593          	li	a1,353
    358c:	00040513          	mv	a0,s0
    3590:	a41ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
    3594:	00400613          	li	a2,4
    3598:	15a00593          	li	a1,346
    359c:	00040513          	mv	a0,s0
    35a0:	a31ff0ef          	jal	2fd0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
    35a4:	05400613          	li	a2,84
    35a8:	15b00593          	li	a1,347
    35ac:	00040513          	mv	a0,s0
    35b0:	a21ff0ef          	jal	2fd0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, IMG_ORIENTATION_A, 0x00);
    35b4:	00000613          	li	a2,0
    35b8:	17200593          	li	a1,370
    35bc:	00040513          	mv	a0,s0
    35c0:	a11ff0ef          	jal	2fd0 <PiCam_WriteRegData>
}
    35c4:	00c12083          	lw	ra,12(sp)
    35c8:	00812403          	lw	s0,8(sp)
    35cc:	01010113          	addi	sp,sp,16
    35d0:	00008067          	ret

000035d4 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    35d4:	04050713          	addi	a4,a0,64
    35d8:	21000793          	li	a5,528
    35dc:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    35e0:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    35e4:	0107f793          	andi	a5,a5,16
    35e8:	fe079ce3          	bnez	a5,35e0 <i2c_masterStartBlocking+0xc>
    }
    35ec:	00008067          	ret

000035f0 <i2c_txAckWait>:
    35f0:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    35f4:	1007f793          	andi	a5,a5,256
    35f8:	fe079ce3          	bnez	a5,35f0 <i2c_txAckWait>
    }
    35fc:	00008067          	ret

00003600 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3600:	ff010113          	addi	sp,sp,-16
    3604:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3608:	30100713          	li	a4,769
    360c:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3610:	fe1ff0ef          	jal	35f0 <i2c_txAckWait>
    }
    3614:	00c12083          	lw	ra,12(sp)
    3618:	01010113          	addi	sp,sp,16
    361c:	00008067          	ret

00003620 <i2c_rxAck>:
        return *((volatile u32*) address);
    3620:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3624:	0ff57513          	zext.b	a0,a0
    }
    3628:	00153513          	seqz	a0,a0
    362c:	00008067          	ret

00003630 <uart_writeAvailability>:
    3630:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3634:	01055513          	srli	a0,a0,0x10
    }
    3638:	0ff57513          	zext.b	a0,a0
    363c:	00008067          	ret

00003640 <uart_write>:
    static void uart_write(u32 reg, char data){
    3640:	ff010113          	addi	sp,sp,-16
    3644:	00112623          	sw	ra,12(sp)
    3648:	00812423          	sw	s0,8(sp)
    364c:	00912223          	sw	s1,4(sp)
    3650:	00050413          	mv	s0,a0
    3654:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    3658:	00040513          	mv	a0,s0
    365c:	fd5ff0ef          	jal	3630 <uart_writeAvailability>
    3660:	fe050ce3          	beqz	a0,3658 <uart_write+0x18>
        *((volatile u32*) address) = data;
    3664:	00942023          	sw	s1,0(s0)
    }
    3668:	00c12083          	lw	ra,12(sp)
    366c:	00812403          	lw	s0,8(sp)
    3670:	00412483          	lw	s1,4(sp)
    3674:	01010113          	addi	sp,sp,16
    3678:	00008067          	ret

0000367c <_putchar>:
    static void _putchar(char character){
    367c:	ff010113          	addi	sp,sp,-16
    3680:	00112623          	sw	ra,12(sp)
    3684:	00050593          	mv	a1,a0
            bsp_putChar(character);
    3688:	f8010537          	lui	a0,0xf8010
    368c:	fb5ff0ef          	jal	3640 <uart_write>
    }
    3690:	00c12083          	lw	ra,12(sp)
    3694:	01010113          	addi	sp,sp,16
    3698:	00008067          	ret

0000369c <_putchar_s>:
    {
    369c:	ff010113          	addi	sp,sp,-16
    36a0:	00112623          	sw	ra,12(sp)
    36a4:	00812423          	sw	s0,8(sp)
    36a8:	00050413          	mv	s0,a0
        while (*p)
    36ac:	00c0006f          	j	36b8 <_putchar_s+0x1c>
            _putchar(*(p++));
    36b0:	00140413          	addi	s0,s0,1
    36b4:	fc9ff0ef          	jal	367c <_putchar>
        while (*p)
    36b8:	00044503          	lbu	a0,0(s0)
    36bc:	fe051ae3          	bnez	a0,36b0 <_putchar_s+0x14>
    }
    36c0:	00c12083          	lw	ra,12(sp)
    36c4:	00812403          	lw	s0,8(sp)
    36c8:	01010113          	addi	sp,sp,16
    36cc:	00008067          	ret

000036d0 <bsp_printHex>:
    {
    36d0:	ff010113          	addi	sp,sp,-16
    36d4:	00112623          	sw	ra,12(sp)
    36d8:	00812423          	sw	s0,8(sp)
    36dc:	00912223          	sw	s1,4(sp)
    36e0:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    36e4:	01c00413          	li	s0,28
    36e8:	0240006f          	j	370c <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    36ec:	0084d733          	srl	a4,s1,s0
    36f0:	00f77713          	andi	a4,a4,15
    36f4:	000047b7          	lui	a5,0x4
    36f8:	38078793          	addi	a5,a5,896 # 4380 <_data+0x4>
    36fc:	00e787b3          	add	a5,a5,a4
    3700:	0007c503          	lbu	a0,0(a5)
    3704:	f79ff0ef          	jal	367c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3708:	ffc40413          	addi	s0,s0,-4
    370c:	fe0450e3          	bgez	s0,36ec <bsp_printHex+0x1c>
    }
    3710:	00c12083          	lw	ra,12(sp)
    3714:	00812403          	lw	s0,8(sp)
    3718:	00412483          	lw	s1,4(sp)
    371c:	01010113          	addi	sp,sp,16
    3720:	00008067          	ret

00003724 <bsp_printHex_lower>:
    {
    3724:	ff010113          	addi	sp,sp,-16
    3728:	00112623          	sw	ra,12(sp)
    372c:	00812423          	sw	s0,8(sp)
    3730:	00912223          	sw	s1,4(sp)
    3734:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3738:	01c00413          	li	s0,28
    373c:	0240006f          	j	3760 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    3740:	0084d733          	srl	a4,s1,s0
    3744:	00f77713          	andi	a4,a4,15
    3748:	000047b7          	lui	a5,0x4
    374c:	39478793          	addi	a5,a5,916 # 4394 <_data+0x18>
    3750:	00e787b3          	add	a5,a5,a4
    3754:	0007c503          	lbu	a0,0(a5)
    3758:	f25ff0ef          	jal	367c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    375c:	ffc40413          	addi	s0,s0,-4
    3760:	fe0450e3          	bgez	s0,3740 <bsp_printHex_lower+0x1c>
    }
    3764:	00c12083          	lw	ra,12(sp)
    3768:	00812403          	lw	s0,8(sp)
    376c:	00412483          	lw	s1,4(sp)
    3770:	01010113          	addi	sp,sp,16
    3774:	00008067          	ret

00003778 <bsp_printf_c>:
    {
    3778:	ff010113          	addi	sp,sp,-16
    377c:	00112623          	sw	ra,12(sp)
        _putchar(c);
    3780:	0ff57513          	zext.b	a0,a0
    3784:	ef9ff0ef          	jal	367c <_putchar>
    }
    3788:	00c12083          	lw	ra,12(sp)
    378c:	01010113          	addi	sp,sp,16
    3790:	00008067          	ret

00003794 <bsp_printf_s>:
    {
    3794:	ff010113          	addi	sp,sp,-16
    3798:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    379c:	f01ff0ef          	jal	369c <_putchar_s>
    }
    37a0:	00c12083          	lw	ra,12(sp)
    37a4:	01010113          	addi	sp,sp,16
    37a8:	00008067          	ret

000037ac <bsp_printf_d>:
    {
    37ac:	fd010113          	addi	sp,sp,-48
    37b0:	02112623          	sw	ra,44(sp)
    37b4:	02812423          	sw	s0,40(sp)
    37b8:	02912223          	sw	s1,36(sp)
    37bc:	00050493          	mv	s1,a0
        if (val < 0) {
    37c0:	00054663          	bltz	a0,37cc <bsp_printf_d+0x20>
    {
    37c4:	00010413          	mv	s0,sp
    37c8:	02c0006f          	j	37f4 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    37cc:	02d00513          	li	a0,45
    37d0:	fa9ff0ef          	jal	3778 <bsp_printf_c>
            val = -val;
    37d4:	409004b3          	neg	s1,s1
    37d8:	fedff06f          	j	37c4 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    37dc:	00a00713          	li	a4,10
    37e0:	02e4e7b3          	rem	a5,s1,a4
    37e4:	03078793          	addi	a5,a5,48
    37e8:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    37ec:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    37f0:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    37f4:	fe0494e3          	bnez	s1,37dc <bsp_printf_d+0x30>
    37f8:	00010793          	mv	a5,sp
    37fc:	fef400e3          	beq	s0,a5,37dc <bsp_printf_d+0x30>
        while (p != buffer)
    3800:	00010793          	mv	a5,sp
    3804:	00f40a63          	beq	s0,a5,3818 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    3808:	fff40413          	addi	s0,s0,-1
    380c:	00044503          	lbu	a0,0(s0)
    3810:	f69ff0ef          	jal	3778 <bsp_printf_c>
    3814:	fedff06f          	j	3800 <bsp_printf_d+0x54>
    }
    3818:	02c12083          	lw	ra,44(sp)
    381c:	02812403          	lw	s0,40(sp)
    3820:	02412483          	lw	s1,36(sp)
    3824:	03010113          	addi	sp,sp,48
    3828:	00008067          	ret

0000382c <bsp_printf_x>:
    {
    382c:	ff010113          	addi	sp,sp,-16
    3830:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    3834:	00000713          	li	a4,0
    3838:	00700793          	li	a5,7
    383c:	02e7c063          	blt	a5,a4,385c <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3840:	00271693          	slli	a3,a4,0x2
    3844:	ff000793          	li	a5,-16
    3848:	00d797b3          	sll	a5,a5,a3
    384c:	00f577b3          	and	a5,a0,a5
    3850:	00078663          	beqz	a5,385c <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    3854:	00170713          	addi	a4,a4,1
    3858:	fe1ff06f          	j	3838 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    385c:	ec9ff0ef          	jal	3724 <bsp_printHex_lower>
    }
    3860:	00c12083          	lw	ra,12(sp)
    3864:	01010113          	addi	sp,sp,16
    3868:	00008067          	ret

0000386c <bsp_printf_X>:
        {
    386c:	ff010113          	addi	sp,sp,-16
    3870:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    3874:	00000713          	li	a4,0
    3878:	00700793          	li	a5,7
    387c:	02e7c063          	blt	a5,a4,389c <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3880:	00271693          	slli	a3,a4,0x2
    3884:	ff000793          	li	a5,-16
    3888:	00d797b3          	sll	a5,a5,a3
    388c:	00f577b3          	and	a5,a0,a5
    3890:	00078663          	beqz	a5,389c <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    3894:	00170713          	addi	a4,a4,1
    3898:	fe1ff06f          	j	3878 <bsp_printf_X+0xc>
            bsp_printHex(val);
    389c:	e35ff0ef          	jal	36d0 <bsp_printHex>
        }
    38a0:	00c12083          	lw	ra,12(sp)
    38a4:	01010113          	addi	sp,sp,16
    38a8:	00008067          	ret

000038ac <mipi_i2c_probe>:
// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    38ac:	ff010113          	addi	sp,sp,-16
    38b0:	00112623          	sw	ra,12(sp)
    38b4:	00812423          	sw	s0,8(sp)
    38b8:	00912223          	sw	s1,4(sp)
    38bc:	00050413          	mv	s0,a0
    38c0:	00058493          	mv	s1,a1
    i2c_masterStartBlocking(i2cCtrl);
    38c4:	d11ff0ef          	jal	35d4 <i2c_masterStartBlocking>
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    38c8:	000017b7          	lui	a5,0x1
    38cc:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    38d0:	00f4e4b3          	or	s1,s1,a5
    38d4:	00942023          	sw	s1,0(s0)
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    38d8:	00040513          	mv	a0,s0
    38dc:	d25ff0ef          	jal	3600 <i2c_txNackBlocking>
    return i2c_rxAck(i2cCtrl);
    38e0:	00040513          	mv	a0,s0
    38e4:	d3dff0ef          	jal	3620 <i2c_rxAck>
}
    38e8:	00c12083          	lw	ra,12(sp)
    38ec:	00812403          	lw	s0,8(sp)
    38f0:	00412483          	lw	s1,4(sp)
    38f4:	01010113          	addi	sp,sp,16
    38f8:	00008067          	ret

000038fc <bsp_printf>:
    {
    38fc:	fc010113          	addi	sp,sp,-64
    3900:	00112e23          	sw	ra,28(sp)
    3904:	00812c23          	sw	s0,24(sp)
    3908:	00912a23          	sw	s1,20(sp)
    390c:	00050493          	mv	s1,a0
    3910:	02b12223          	sw	a1,36(sp)
    3914:	02c12423          	sw	a2,40(sp)
    3918:	02d12623          	sw	a3,44(sp)
    391c:	02e12823          	sw	a4,48(sp)
    3920:	02f12a23          	sw	a5,52(sp)
    3924:	03012c23          	sw	a6,56(sp)
    3928:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    392c:	02410793          	addi	a5,sp,36
    3930:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    3934:	00000413          	li	s0,0
    3938:	01c0006f          	j	3954 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    393c:	00c12783          	lw	a5,12(sp)
    3940:	00478713          	addi	a4,a5,4
    3944:	00e12623          	sw	a4,12(sp)
    3948:	0007a503          	lw	a0,0(a5)
    394c:	e2dff0ef          	jal	3778 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    3950:	00140413          	addi	s0,s0,1
    3954:	008487b3          	add	a5,s1,s0
    3958:	0007c503          	lbu	a0,0(a5)
    395c:	0a050e63          	beqz	a0,3a18 <bsp_printf+0x11c>
            if (format[i] == '%') {
    3960:	02500793          	li	a5,37
    3964:	06f50e63          	beq	a0,a5,39e0 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    3968:	e11ff0ef          	jal	3778 <bsp_printf_c>
    396c:	fe5ff06f          	j	3950 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    3970:	00c12783          	lw	a5,12(sp)
    3974:	00478713          	addi	a4,a5,4
    3978:	00e12623          	sw	a4,12(sp)
    397c:	0007a503          	lw	a0,0(a5)
    3980:	e15ff0ef          	jal	3794 <bsp_printf_s>
                        break;
    3984:	fcdff06f          	j	3950 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    3988:	00c12783          	lw	a5,12(sp)
    398c:	00478713          	addi	a4,a5,4
    3990:	00e12623          	sw	a4,12(sp)
    3994:	0007a503          	lw	a0,0(a5)
    3998:	e15ff0ef          	jal	37ac <bsp_printf_d>
                        break;
    399c:	fb5ff06f          	j	3950 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    39a0:	00c12783          	lw	a5,12(sp)
    39a4:	00478713          	addi	a4,a5,4
    39a8:	00e12623          	sw	a4,12(sp)
    39ac:	0007a503          	lw	a0,0(a5)
    39b0:	ebdff0ef          	jal	386c <bsp_printf_X>
                        break;
    39b4:	f9dff06f          	j	3950 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    39b8:	00c12783          	lw	a5,12(sp)
    39bc:	00478713          	addi	a4,a5,4
    39c0:	00e12623          	sw	a4,12(sp)
    39c4:	0007a503          	lw	a0,0(a5)
    39c8:	e65ff0ef          	jal	382c <bsp_printf_x>
                        break;
    39cc:	f85ff06f          	j	3950 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    39d0:	00004537          	lui	a0,0x4
    39d4:	3a850513          	addi	a0,a0,936 # 43a8 <_data+0x2c>
    39d8:	dbdff0ef          	jal	3794 <bsp_printf_s>
                        break;
    39dc:	f75ff06f          	j	3950 <bsp_printf+0x54>
                while (format[++i]) {
    39e0:	00140413          	addi	s0,s0,1
    39e4:	008487b3          	add	a5,s1,s0
    39e8:	0007c783          	lbu	a5,0(a5)
    39ec:	f60782e3          	beqz	a5,3950 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    39f0:	fa878793          	addi	a5,a5,-88
    39f4:	0ff7f693          	zext.b	a3,a5
    39f8:	02000713          	li	a4,32
    39fc:	fed762e3          	bltu	a4,a3,39e0 <bsp_printf+0xe4>
    3a00:	00269793          	slli	a5,a3,0x2
    3a04:	00005737          	lui	a4,0x5
    3a08:	e8c70713          	addi	a4,a4,-372 # 4e8c <_data+0xb10>
    3a0c:	00e787b3          	add	a5,a5,a4
    3a10:	0007a783          	lw	a5,0(a5)
    3a14:	00078067          	jr	a5
    }
    3a18:	01c12083          	lw	ra,28(sp)
    3a1c:	01812403          	lw	s0,24(sp)
    3a20:	01412483          	lw	s1,20(sp)
    3a24:	04010113          	addi	sp,sp,64
    3a28:	00008067          	ret

00003a2c <camera_init>:
// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    3a2c:	fe010113          	addi	sp,sp,-32
    3a30:	00112e23          	sw	ra,28(sp)
    3a34:	00812c23          	sw	s0,24(sp)
    3a38:	00912a23          	sw	s1,20(sp)
    3a3c:	01212823          	sw	s2,16(sp)
    3a40:	01312623          	sw	s3,12(sp)
    3a44:	00050913          	mv	s2,a0
    3a48:	00058493          	mv	s1,a1
    mipi_i2c_init(i2cCtrl);
    3a4c:	00058513          	mv	a0,a1
    3a50:	bb8fe0ef          	jal	1e08 <mipi_i2c_init>

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3a54:	00000413          	li	s0,0
    3a58:	00100793          	li	a5,1
    3a5c:	0a87e863          	bltu	a5,s0,3b0c <camera_init+0xe0>
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
    3a60:	000057b7          	lui	a5,0x5
    3a64:	00241713          	slli	a4,s0,0x2
    3a68:	00870733          	add	a4,a4,s0
    3a6c:	00271713          	slli	a4,a4,0x2
    3a70:	f1078793          	addi	a5,a5,-240 # 4f10 <supportedCamera>
    3a74:	00e787b3          	add	a5,a5,a4
    3a78:	0007c983          	lbu	s3,0(a5)
    3a7c:	00098593          	mv	a1,s3
    3a80:	00048513          	mv	a0,s1
    3a84:	e29ff0ef          	jal	38ac <mipi_i2c_probe>
    3a88:	00100793          	li	a5,1
    3a8c:	00f50663          	beq	a0,a5,3a98 <camera_init+0x6c>
    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3a90:	00140413          	addi	s0,s0,1
    3a94:	fc5ff06f          	j	3a58 <camera_init+0x2c>
    3a98:	01412423          	sw	s4,8(sp)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
    3a9c:	00005a37          	lui	s4,0x5
    3aa0:	00241793          	slli	a5,s0,0x2
    3aa4:	008787b3          	add	a5,a5,s0
    3aa8:	00279793          	slli	a5,a5,0x2
    3aac:	f10a0a13          	addi	s4,s4,-240 # 4f10 <supportedCamera>
    3ab0:	00fa0a33          	add	s4,s4,a5
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
    3ab4:	0019d693          	srli	a3,s3,0x1
    3ab8:	008a2603          	lw	a2,8(s4)
    3abc:	00090593          	mv	a1,s2
    3ac0:	00005537          	lui	a0,0x5
    3ac4:	c8050513          	addi	a0,a0,-896 # 4c80 <_data+0x904>
    3ac8:	e35ff0ef          	jal	38fc <bsp_printf>
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
    3acc:	00ca2783          	lw	a5,12(s4)
    3ad0:	00078663          	beqz	a5,3adc <camera_init+0xb0>
                supportedCamera[i].init(i2cCtrl);
    3ad4:	00048513          	mv	a0,s1
    3ad8:	000780e7          	jalr	a5

            if (supportedCamera[i].start_stream != NULL)
    3adc:	000057b7          	lui	a5,0x5
    3ae0:	00241713          	slli	a4,s0,0x2
    3ae4:	00870733          	add	a4,a4,s0
    3ae8:	00271713          	slli	a4,a4,0x2
    3aec:	f1078793          	addi	a5,a5,-240 # 4f10 <supportedCamera>
    3af0:	00e787b3          	add	a5,a5,a4
    3af4:	0107a783          	lw	a5,16(a5)
    3af8:	04078063          	beqz	a5,3b38 <camera_init+0x10c>
                supportedCamera[i].start_stream(i2cCtrl);
    3afc:	00048513          	mv	a0,s1
    3b00:	000780e7          	jalr	a5
            return;
    3b04:	00812a03          	lw	s4,8(sp)
    3b08:	0140006f          	j	3b1c <camera_init+0xf0>
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
    3b0c:	00090593          	mv	a1,s2
    3b10:	00005537          	lui	a0,0x5
    3b14:	ca850513          	addi	a0,a0,-856 # 4ca8 <_data+0x92c>
    3b18:	de5ff0ef          	jal	38fc <bsp_printf>
}
    3b1c:	01c12083          	lw	ra,28(sp)
    3b20:	01812403          	lw	s0,24(sp)
    3b24:	01412483          	lw	s1,20(sp)
    3b28:	01012903          	lw	s2,16(sp)
    3b2c:	00c12983          	lw	s3,12(sp)
    3b30:	02010113          	addi	sp,sp,32
    3b34:	00008067          	ret
    3b38:	00812a03          	lw	s4,8(sp)
    3b3c:	fe1ff06f          	j	3b1c <camera_init+0xf0>

00003b40 <cam0_init>:

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
    3b40:	ff010113          	addi	sp,sp,-16
    3b44:	00112623          	sw	ra,12(sp)
    3b48:	00050593          	mv	a1,a0
    3b4c:	00000513          	li	a0,0
    3b50:	eddff0ef          	jal	3a2c <camera_init>
    3b54:	00c12083          	lw	ra,12(sp)
    3b58:	01010113          	addi	sp,sp,16
    3b5c:	00008067          	ret

00003b60 <uart_writeAvailability>:
        return *((volatile u32*) address);
    3b60:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3b64:	01055513          	srli	a0,a0,0x10
    }
    3b68:	0ff57513          	zext.b	a0,a0
    3b6c:	00008067          	ret

00003b70 <uart_write>:
    static void uart_write(u32 reg, char data){
    3b70:	ff010113          	addi	sp,sp,-16
    3b74:	00112623          	sw	ra,12(sp)
    3b78:	00812423          	sw	s0,8(sp)
    3b7c:	00912223          	sw	s1,4(sp)
    3b80:	00050413          	mv	s0,a0
    3b84:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    3b88:	00040513          	mv	a0,s0
    3b8c:	fd5ff0ef          	jal	3b60 <uart_writeAvailability>
    3b90:	fe050ce3          	beqz	a0,3b88 <uart_write+0x18>
        *((volatile u32*) address) = data;
    3b94:	00942023          	sw	s1,0(s0)
    }
    3b98:	00c12083          	lw	ra,12(sp)
    3b9c:	00812403          	lw	s0,8(sp)
    3ba0:	00412483          	lw	s1,4(sp)
    3ba4:	01010113          	addi	sp,sp,16
    3ba8:	00008067          	ret

00003bac <uart_writeStr>:
    static void uart_writeStr(u32 reg, const char* str){
    3bac:	ff010113          	addi	sp,sp,-16
    3bb0:	00112623          	sw	ra,12(sp)
    3bb4:	00812423          	sw	s0,8(sp)
    3bb8:	00912223          	sw	s1,4(sp)
    3bbc:	00050493          	mv	s1,a0
    3bc0:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    3bc4:	0100006f          	j	3bd4 <uart_writeStr+0x28>
    3bc8:	00140413          	addi	s0,s0,1
    3bcc:	00048513          	mv	a0,s1
    3bd0:	fa1ff0ef          	jal	3b70 <uart_write>
    3bd4:	00044583          	lbu	a1,0(s0)
    3bd8:	fe0598e3          	bnez	a1,3bc8 <uart_writeStr+0x1c>
    }
    3bdc:	00c12083          	lw	ra,12(sp)
    3be0:	00812403          	lw	s0,8(sp)
    3be4:	00412483          	lw	s1,4(sp)
    3be8:	01010113          	addi	sp,sp,16
    3bec:	00008067          	ret

00003bf0 <i2c_masterBusy>:
        return *((volatile u32*) address);
    3bf0:	04052503          	lw	a0,64(a0)
    }
    3bf4:	00157513          	andi	a0,a0,1
    3bf8:	00008067          	ret

00003bfc <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3bfc:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3c00:	21000793          	li	a5,528
    3c04:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3c08:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3c0c:	0107f793          	andi	a5,a5,16
    3c10:	fe079ce3          	bnez	a5,3c08 <i2c_masterStartBlocking+0xc>
    }
    3c14:	00008067          	ret

00003c18 <i2c_masterStopWait>:
    static void i2c_masterStopWait(u32 reg){
    3c18:	ff010113          	addi	sp,sp,-16
    3c1c:	00112623          	sw	ra,12(sp)
    3c20:	00812423          	sw	s0,8(sp)
    3c24:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3c28:	00040513          	mv	a0,s0
    3c2c:	fc5ff0ef          	jal	3bf0 <i2c_masterBusy>
    3c30:	fe051ce3          	bnez	a0,3c28 <i2c_masterStopWait+0x10>
    }
    3c34:	00c12083          	lw	ra,12(sp)
    3c38:	00812403          	lw	s0,8(sp)
    3c3c:	01010113          	addi	sp,sp,16
    3c40:	00008067          	ret

00003c44 <i2c_masterStopBlocking>:
    static void i2c_masterStopBlocking(u32 reg){
    3c44:	ff010113          	addi	sp,sp,-16
    3c48:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3c4c:	42000713          	li	a4,1056
    3c50:	04e52023          	sw	a4,64(a0)
        i2c_masterStopWait(reg);
    3c54:	fc5ff0ef          	jal	3c18 <i2c_masterStopWait>
    }
    3c58:	00c12083          	lw	ra,12(sp)
    3c5c:	01010113          	addi	sp,sp,16
    3c60:	00008067          	ret

00003c64 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3c64:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3c68:	1007f793          	andi	a5,a5,256
    3c6c:	fe079ce3          	bnez	a5,3c64 <i2c_txAckWait>
    }
    3c70:	00008067          	ret

00003c74 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3c74:	ff010113          	addi	sp,sp,-16
    3c78:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3c7c:	30100713          	li	a4,769
    3c80:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3c84:	fe1ff0ef          	jal	3c64 <i2c_txAckWait>
    }
    3c88:	00c12083          	lw	ra,12(sp)
    3c8c:	01010113          	addi	sp,sp,16
    3c90:	00008067          	ret

00003c94 <i2c_rxAck>:
        return *((volatile u32*) address);
    3c94:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3c98:	0ff57513          	zext.b	a0,a0
    }
    3c9c:	00153513          	seqz	a0,a0
    3ca0:	00008067          	ret

00003ca4 <PiCamV3_WriteRegData>:
#include "riscv.h"
#include "PiCamV3Driver.h"
#include "common.h"

void PiCamV3_WriteRegData(u32 i2c_addr, u16 reg, u8 data)
{
    3ca4:	fe010113          	addi	sp,sp,-32
    3ca8:	00112e23          	sw	ra,28(sp)
    3cac:	00812c23          	sw	s0,24(sp)
    3cb0:	00912a23          	sw	s1,20(sp)
    3cb4:	01212823          	sw	s2,16(sp)
    3cb8:	01312623          	sw	s3,12(sp)
    3cbc:	00050413          	mv	s0,a0
    3cc0:	00058493          	mv	s1,a1
    3cc4:	00060913          	mv	s2,a2
	u8 outdata;

	i2c_masterStartBlocking(i2c_addr);
    3cc8:	f35ff0ef          	jal	3bfc <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    3ccc:	000017b7          	lui	a5,0x1
    3cd0:	b3478793          	addi	a5,a5,-1228 # b34 <CUSTOM2+0xad9>
    3cd4:	00f42023          	sw	a5,0(s0)

	i2c_txByte(i2c_addr, IMX708_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3cd8:	00040513          	mv	a0,s0
    3cdc:	f99ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3ce0:	00040513          	mv	a0,s0
    3ce4:	fb1ff0ef          	jal	3c94 <i2c_rxAck>
    3ce8:	8d0fe0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg >> 8) & 0xFF);
    3cec:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3cf0:	000019b7          	lui	s3,0x1
    3cf4:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3cf8:	0137e7b3          	or	a5,a5,s3
    3cfc:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3d00:	00040513          	mv	a0,s0
    3d04:	f71ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3d08:	00040513          	mv	a0,s0
    3d0c:	f89ff0ef          	jal	3c94 <i2c_rxAck>
    3d10:	8a8fe0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg) & 0xFF);
    3d14:	0ff4f493          	zext.b	s1,s1
    3d18:	0134e4b3          	or	s1,s1,s3
    3d1c:	00942023          	sw	s1,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3d20:	00040513          	mv	a0,s0
    3d24:	f51ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3d28:	00040513          	mv	a0,s0
    3d2c:	f69ff0ef          	jal	3c94 <i2c_rxAck>
    3d30:	888fe0ef          	jal	1db8 <assert>
    3d34:	01396933          	or	s2,s2,s3
    3d38:	01242023          	sw	s2,0(s0)

	i2c_txByte(i2c_addr, data & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3d3c:	00040513          	mv	a0,s0
    3d40:	f35ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3d44:	00040513          	mv	a0,s0
    3d48:	f4dff0ef          	jal	3c94 <i2c_rxAck>
    3d4c:	86cfe0ef          	jal	1db8 <assert>

	i2c_masterStopBlocking(i2c_addr);
    3d50:	00040513          	mv	a0,s0
    3d54:	ef1ff0ef          	jal	3c44 <i2c_masterStopBlocking>
}
    3d58:	01c12083          	lw	ra,28(sp)
    3d5c:	01812403          	lw	s0,24(sp)
    3d60:	01412483          	lw	s1,20(sp)
    3d64:	01012903          	lw	s2,16(sp)
    3d68:	00c12983          	lw	s3,12(sp)
    3d6c:	02010113          	addi	sp,sp,32
    3d70:	00008067          	ret

00003d74 <PiCamV3_StartStreaming>:

	return outdata;
}

void PiCamV3_StartStreaming(u32 i2c_addr)
{
    3d74:	ff010113          	addi	sp,sp,-16
    3d78:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_ACTIVE);
    3d7c:	00100613          	li	a2,1
    3d80:	10000593          	li	a1,256
    3d84:	f21ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
}
    3d88:	00c12083          	lw	ra,12(sp)
    3d8c:	01010113          	addi	sp,sp,16
    3d90:	00008067          	ret

00003d94 <PiCamV3_StopStreaming>:

void PiCamV3_StopStreaming(u32 i2c_addr)
{
    3d94:	ff010113          	addi	sp,sp,-16
    3d98:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_SLEEP);
    3d9c:	00000613          	li	a2,0
    3da0:	10000593          	li	a1,256
    3da4:	f01ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
}
    3da8:	00c12083          	lw	ra,12(sp)
    3dac:	01010113          	addi	sp,sp,16
    3db0:	00008067          	ret

00003db4 <PiCamV3_ConfigCommon>:

void PiCamV3_ConfigCommon(u32 i2c_addr)
{
    3db4:	ff010113          	addi	sp,sp,-16
    3db8:	00112623          	sw	ra,12(sp)
    3dbc:	00812423          	sw	s0,8(sp)
    3dc0:	00912223          	sw	s1,4(sp)
    3dc4:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3dc8:	00000413          	li	s0,0
    3dcc:	0280006f          	j	3df4 <PiCamV3_ConfigCommon+0x40>
	{
		PiCamV3_WriteRegData(i2c_addr, mode_common_regs[i].address, mode_common_regs[i].val);
    3dd0:	000057b7          	lui	a5,0x5
    3dd4:	00241713          	slli	a4,s0,0x2
    3dd8:	3a078793          	addi	a5,a5,928 # 53a0 <mode_common_regs>
    3ddc:	00e787b3          	add	a5,a5,a4
    3de0:	0027c603          	lbu	a2,2(a5)
    3de4:	0007d583          	lhu	a1,0(a5)
    3de8:	00048513          	mv	a0,s1
    3dec:	eb9ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3df0:	00140413          	addi	s0,s0,1
    3df4:	02f00793          	li	a5,47
    3df8:	fc87fce3          	bgeu	a5,s0,3dd0 <PiCamV3_ConfigCommon+0x1c>
	}
}
    3dfc:	00c12083          	lw	ra,12(sp)
    3e00:	00812403          	lw	s0,8(sp)
    3e04:	00412483          	lw	s1,4(sp)
    3e08:	01010113          	addi	sp,sp,16
    3e0c:	00008067          	ret

00003e10 <PiCamV3_ConfigFormat>:

void PiCamV3_ConfigFormat(u32 i2c_addr, u8 mode)
{
    3e10:	ff010113          	addi	sp,sp,-16
    3e14:	00112623          	sw	ra,12(sp)
    3e18:	00912223          	sw	s1,4(sp)
    3e1c:	00050493          	mv	s1,a0
	// 	MODE
	//  0 : 1920 x 1080 cropped, 50FPS
	//	1 : 1920 x 1080 2x2 binned, 60 FPS
	//  2 : 1920 x 1080 HDR, 50 FPS

	if (mode == 0)
    3e20:	08058663          	beqz	a1,3eac <PiCamV3_ConfigFormat+0x9c>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
		}
	}

	else if (mode == 1)
    3e24:	00100793          	li	a5,1
    3e28:	0cf58263          	beq	a1,a5,3eec <PiCamV3_ConfigFormat+0xdc>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
		}
	}

	else if (mode == 2)
    3e2c:	00200793          	li	a5,2
    3e30:	06f59663          	bne	a1,a5,3e9c <PiCamV3_ConfigFormat+0x8c>
    3e34:	00812423          	sw	s0,8(sp)
	{
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3e38:	00000413          	li	s0,0
    3e3c:	05e00793          	li	a5,94
    3e40:	0a87ec63          	bltu	a5,s0,3ef8 <PiCamV3_ConfigFormat+0xe8>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_hdr_1920x1080_regs[i].address, mode_hdr_1920x1080_regs[i].val);
    3e44:	000057b7          	lui	a5,0x5
    3e48:	00241713          	slli	a4,s0,0x2
    3e4c:	f4c78793          	addi	a5,a5,-180 # 4f4c <mode_hdr_1920x1080_regs>
    3e50:	00e787b3          	add	a5,a5,a4
    3e54:	0027c603          	lbu	a2,2(a5)
    3e58:	0007d583          	lhu	a1,0(a5)
    3e5c:	00048513          	mv	a0,s1
    3e60:	e45ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3e64:	00140413          	addi	s0,s0,1
    3e68:	fd5ff06f          	j	3e3c <PiCamV3_ConfigFormat+0x2c>
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
    3e6c:	000057b7          	lui	a5,0x5
    3e70:	00241713          	slli	a4,s0,0x2
    3e74:	23478793          	addi	a5,a5,564 # 5234 <mode_1920x1080_cropped_regs>
    3e78:	00e787b3          	add	a5,a5,a4
    3e7c:	0027c603          	lbu	a2,2(a5)
    3e80:	0007d583          	lhu	a1,0(a5)
    3e84:	00048513          	mv	a0,s1
    3e88:	e1dff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3e8c:	00140413          	addi	s0,s0,1
    3e90:	05a00793          	li	a5,90
    3e94:	fc87fce3          	bgeu	a5,s0,3e6c <PiCamV3_ConfigFormat+0x5c>
    3e98:	00812403          	lw	s0,8(sp)
		}
	}
}
    3e9c:	00c12083          	lw	ra,12(sp)
    3ea0:	00412483          	lw	s1,4(sp)
    3ea4:	01010113          	addi	sp,sp,16
    3ea8:	00008067          	ret
    3eac:	00812423          	sw	s0,8(sp)
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3eb0:	00000413          	li	s0,0
    3eb4:	fddff06f          	j	3e90 <PiCamV3_ConfigFormat+0x80>
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
    3eb8:	000057b7          	lui	a5,0x5
    3ebc:	00241713          	slli	a4,s0,0x2
    3ec0:	0c878793          	addi	a5,a5,200 # 50c8 <mode_2x2binned_1920x1080_regs>
    3ec4:	00e787b3          	add	a5,a5,a4
    3ec8:	0027c603          	lbu	a2,2(a5)
    3ecc:	0007d583          	lhu	a1,0(a5)
    3ed0:	00048513          	mv	a0,s1
    3ed4:	dd1ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_2x2binned_1920x1080_regs) / sizeof(mode_2x2binned_1920x1080_regs[0]); i++)
    3ed8:	00140413          	addi	s0,s0,1
    3edc:	05a00793          	li	a5,90
    3ee0:	fc87fce3          	bgeu	a5,s0,3eb8 <PiCamV3_ConfigFormat+0xa8>
    3ee4:	00812403          	lw	s0,8(sp)
    3ee8:	fb5ff06f          	j	3e9c <PiCamV3_ConfigFormat+0x8c>
    3eec:	00812423          	sw	s0,8(sp)
    3ef0:	00000413          	li	s0,0
    3ef4:	fe9ff06f          	j	3edc <PiCamV3_ConfigFormat+0xcc>
    3ef8:	00812403          	lw	s0,8(sp)
    3efc:	fa1ff06f          	j	3e9c <PiCamV3_ConfigFormat+0x8c>

00003f00 <PiCamV3_ConfigLinkFreq>:

void PiCamV3_ConfigLinkFreq(u32 i2c_addr)
{
    3f00:	ff010113          	addi	sp,sp,-16
    3f04:	00112623          	sw	ra,12(sp)
    3f08:	00812423          	sw	s0,8(sp)
    3f0c:	00912223          	sw	s1,4(sp)
    3f10:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    3f14:	00000413          	li	s0,0
    3f18:	0240006f          	j	3f3c <PiCamV3_ConfigLinkFreq+0x3c>
	{
		PiCamV3_WriteRegData(i2c_addr, link_450Mhz_regs[i].address, link_450Mhz_regs[i].val);
    3f1c:	00241713          	slli	a4,s0,0x2
    3f20:	81818793          	addi	a5,gp,-2024 # 56b0 <link_450Mhz_regs>
    3f24:	00e787b3          	add	a5,a5,a4
    3f28:	0027c603          	lbu	a2,2(a5)
    3f2c:	0007d583          	lhu	a1,0(a5)
    3f30:	00048513          	mv	a0,s1
    3f34:	d71ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    3f38:	00140413          	addi	s0,s0,1
    3f3c:	00100793          	li	a5,1
    3f40:	fc87fee3          	bgeu	a5,s0,3f1c <PiCamV3_ConfigLinkFreq+0x1c>
	}
}
    3f44:	00c12083          	lw	ra,12(sp)
    3f48:	00812403          	lw	s0,8(sp)
    3f4c:	00412483          	lw	s1,4(sp)
    3f50:	01010113          	addi	sp,sp,16
    3f54:	00008067          	ret

00003f58 <PiCamV3_ConfigQuadBayerRemosaicAdjustment>:

void PiCamV3_ConfigQuadBayerRemosaicAdjustment(u32 i2c_addr)
{
    3f58:	ff010113          	addi	sp,sp,-16
    3f5c:	00112623          	sw	ra,12(sp)
    3f60:	00812423          	sw	s0,8(sp)
    3f64:	00050413          	mv	s0,a0
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED);
    3f68:	00000613          	li	a2,0
    3f6c:	0000c5b7          	lui	a1,0xc
    3f70:	42858593          	addi	a1,a1,1064 # c428 <__freertos_irq_stack_top+0x5bc8>
    3f74:	d31ff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY, 0x04);
    3f78:	00400613          	li	a2,4
    3f7c:	0000c5b7          	lui	a1,0xc
    3f80:	42958593          	addi	a1,a1,1065 # c429 <__freertos_irq_stack_top+0x5bc9>
    3f84:	00040513          	mv	a0,s0
    3f88:	d1dff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
}
    3f8c:	00c12083          	lw	ra,12(sp)
    3f90:	00812403          	lw	s0,8(sp)
    3f94:	01010113          	addi	sp,sp,16
    3f98:	00008067          	ret

00003f9c <PiCamV3_SetPdafGain>:

void PiCamV3_SetPdafGain(u32 i2c_addr)
{
    3f9c:	fe010113          	addi	sp,sp,-32
    3fa0:	00112e23          	sw	ra,28(sp)
    3fa4:	00812c23          	sw	s0,24(sp)
    3fa8:	00912a23          	sw	s1,20(sp)
    3fac:	01212823          	sw	s2,16(sp)
    3fb0:	01312623          	sw	s3,12(sp)
    3fb4:	00050993          	mv	s3,a0
	for (int i = 0; i < 54; i++)
    3fb8:	00000493          	li	s1,0
    3fbc:	0640006f          	j	4020 <PiCamV3_SetPdafGain+0x84>
	{
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_L + i, pdaf_gains[0][i % 9]);
    3fc0:	01049913          	slli	s2,s1,0x10
    3fc4:	01095913          	srli	s2,s2,0x10
    3fc8:	00900793          	li	a5,9
    3fcc:	02f4e7b3          	rem	a5,s1,a5
    3fd0:	00005437          	lui	s0,0x5
    3fd4:	f3840413          	addi	s0,s0,-200 # 4f38 <pdaf_gains>
    3fd8:	00f40433          	add	s0,s0,a5
    3fdc:	000085b7          	lui	a1,0x8
    3fe0:	b1058593          	addi	a1,a1,-1264 # 7b10 <__freertos_irq_stack_top+0x12b0>
    3fe4:	00b905b3          	add	a1,s2,a1
    3fe8:	00044603          	lbu	a2,0(s0)
    3fec:	01059593          	slli	a1,a1,0x10
    3ff0:	0105d593          	srli	a1,a1,0x10
    3ff4:	00098513          	mv	a0,s3
    3ff8:	cadff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_R + i, pdaf_gains[1][i % 9]);
    3ffc:	000087b7          	lui	a5,0x8
    4000:	c0078793          	addi	a5,a5,-1024 # 7c00 <__freertos_irq_stack_top+0x13a0>
    4004:	00f905b3          	add	a1,s2,a5
    4008:	00944603          	lbu	a2,9(s0)
    400c:	01059593          	slli	a1,a1,0x10
    4010:	0105d593          	srli	a1,a1,0x10
    4014:	00098513          	mv	a0,s3
    4018:	c8dff0ef          	jal	3ca4 <PiCamV3_WriteRegData>
	for (int i = 0; i < 54; i++)
    401c:	00148493          	addi	s1,s1,1
    4020:	03500793          	li	a5,53
    4024:	f897dee3          	bge	a5,s1,3fc0 <PiCamV3_SetPdafGain+0x24>
	}
}
    4028:	01c12083          	lw	ra,28(sp)
    402c:	01812403          	lw	s0,24(sp)
    4030:	01412483          	lw	s1,20(sp)
    4034:	01012903          	lw	s2,16(sp)
    4038:	00c12983          	lw	s3,12(sp)
    403c:	02010113          	addi	sp,sp,32
    4040:	00008067          	ret

00004044 <PiCamV3_OnActuator>:
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN, (val & 0xFF00) >> 8);
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN + 1, val & 0xFF);
}

void PiCamV3_OnActuator(u32 i2c_addr)
{
    4044:	ff010113          	addi	sp,sp,-16
    4048:	00112623          	sw	ra,12(sp)
    404c:	00812423          	sw	s0,8(sp)
    4050:	00050413          	mv	s0,a0
	// Turn on actuator
	i2c_masterStartBlocking(i2c_addr);
    4054:	ba9ff0ef          	jal	3bfc <i2c_masterStartBlocking>
    4058:	000017b7          	lui	a5,0x1
    405c:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    4060:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4064:	00040513          	mv	a0,s0
    4068:	c0dff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    406c:	00040513          	mv	a0,s0
    4070:	c25ff0ef          	jal	3c94 <i2c_rxAck>
    4074:	d45fd0ef          	jal	1db8 <assert>
    4078:	000017b7          	lui	a5,0x1
    407c:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4080:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4084:	00040513          	mv	a0,s0
    4088:	bedff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    408c:	00040513          	mv	a0,s0
    4090:	c05ff0ef          	jal	3c94 <i2c_rxAck>
    4094:	d25fd0ef          	jal	1db8 <assert>
    4098:	000017b7          	lui	a5,0x1
    409c:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    40a0:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_ACTIVE);
	i2c_txNackBlocking(i2c_addr);
    40a4:	00040513          	mv	a0,s0
    40a8:	bcdff0ef          	jal	3c74 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    40ac:	00040513          	mv	a0,s0
    40b0:	b95ff0ef          	jal	3c44 <i2c_masterStopBlocking>
}
    40b4:	00c12083          	lw	ra,12(sp)
    40b8:	00812403          	lw	s0,8(sp)
    40bc:	01010113          	addi	sp,sp,16
    40c0:	00008067          	ret

000040c4 <PiCamV3_OffActuator>:

void PiCamV3_OffActuator(u32 i2c_addr)
{
    40c4:	ff010113          	addi	sp,sp,-16
    40c8:	00112623          	sw	ra,12(sp)
    40cc:	00812423          	sw	s0,8(sp)
    40d0:	00050413          	mv	s0,a0
	// Turn off actuator
	i2c_masterStartBlocking(i2c_addr);
    40d4:	b29ff0ef          	jal	3bfc <i2c_masterStartBlocking>
    40d8:	000017b7          	lui	a5,0x1
    40dc:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    40e0:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    40e4:	00040513          	mv	a0,s0
    40e8:	b8dff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    40ec:	00040513          	mv	a0,s0
    40f0:	ba5ff0ef          	jal	3c94 <i2c_rxAck>
    40f4:	cc5fd0ef          	jal	1db8 <assert>
    40f8:	000017b7          	lui	a5,0x1
    40fc:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4100:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4104:	00040513          	mv	a0,s0
    4108:	b6dff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    410c:	00040513          	mv	a0,s0
    4110:	b85ff0ef          	jal	3c94 <i2c_rxAck>
    4114:	ca5fd0ef          	jal	1db8 <assert>
    4118:	000017b7          	lui	a5,0x1
    411c:	b0178793          	addi	a5,a5,-1279 # b01 <CUSTOM2+0xaa6>
    4120:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_SLEEP);
	i2c_txNackBlocking(i2c_addr);
    4124:	00040513          	mv	a0,s0
    4128:	b4dff0ef          	jal	3c74 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    412c:	00040513          	mv	a0,s0
    4130:	b15ff0ef          	jal	3c44 <i2c_masterStopBlocking>
}
    4134:	00c12083          	lw	ra,12(sp)
    4138:	00812403          	lw	s0,8(sp)
    413c:	01010113          	addi	sp,sp,16
    4140:	00008067          	ret

00004144 <PiCamV3_SetFocusStep>:

void PiCamV3_SetFocusStep(u32 i2c_addr, u32 focus_step)
{
    4144:	fe010113          	addi	sp,sp,-32
    4148:	00112e23          	sw	ra,28(sp)
    414c:	00812c23          	sw	s0,24(sp)
    4150:	00912a23          	sw	s1,20(sp)
    4154:	01212823          	sw	s2,16(sp)
    4158:	01312623          	sw	s3,12(sp)
    415c:	00050413          	mv	s0,a0
    4160:	00058493          	mv	s1,a1
	if (focus_step >= DW9807_MAX_FOCUS_POS)
    4164:	3fe00793          	li	a5,1022
    4168:	00b7f463          	bgeu	a5,a1,4170 <PiCamV3_SetFocusStep+0x2c>
		focus_step = DW9807_MAX_FOCUS_POS;
    416c:	3ff00493          	li	s1,1023
	else if (focus_step <= 0)
		focus_step = 0;

	i2c_masterStartBlocking(i2c_addr);
    4170:	00040513          	mv	a0,s0
    4174:	a89ff0ef          	jal	3bfc <i2c_masterStartBlocking>
    4178:	000019b7          	lui	s3,0x1
    417c:	b1898993          	addi	s3,s3,-1256 # b18 <CUSTOM2+0xabd>
    4180:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4184:	00040513          	mv	a0,s0
    4188:	aedff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    418c:	00040513          	mv	a0,s0
    4190:	b05ff0ef          	jal	3c94 <i2c_rxAck>
    4194:	c25fd0ef          	jal	1db8 <assert>
    4198:	000017b7          	lui	a5,0x1
    419c:	b0378793          	addi	a5,a5,-1277 # b03 <CUSTOM2+0xaa8>
    41a0:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_MSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    41a4:	00040513          	mv	a0,s0
    41a8:	acdff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    41ac:	00040513          	mv	a0,s0
    41b0:	ae5ff0ef          	jal	3c94 <i2c_rxAck>
    41b4:	c05fd0ef          	jal	1db8 <assert>
	i2c_txByte(i2c_addr, (focus_step >> 8) & 0x03);
    41b8:	0084d793          	srli	a5,s1,0x8
    41bc:	0037f793          	andi	a5,a5,3
    41c0:	00001937          	lui	s2,0x1
    41c4:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
    41c8:	0127e7b3          	or	a5,a5,s2
    41cc:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    41d0:	00040513          	mv	a0,s0
    41d4:	aa1ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    41d8:	00040513          	mv	a0,s0
    41dc:	ab9ff0ef          	jal	3c94 <i2c_rxAck>
    41e0:	bd9fd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    41e4:	00040513          	mv	a0,s0
    41e8:	a5dff0ef          	jal	3c44 <i2c_masterStopBlocking>

	i2c_masterStartBlocking(i2c_addr);
    41ec:	00040513          	mv	a0,s0
    41f0:	a0dff0ef          	jal	3bfc <i2c_masterStartBlocking>
    41f4:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    41f8:	00040513          	mv	a0,s0
    41fc:	a79ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4200:	00040513          	mv	a0,s0
    4204:	a91ff0ef          	jal	3c94 <i2c_rxAck>
    4208:	bb1fd0ef          	jal	1db8 <assert>
    420c:	000017b7          	lui	a5,0x1
    4210:	b0478793          	addi	a5,a5,-1276 # b04 <CUSTOM2+0xaa9>
    4214:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_LSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4218:	00040513          	mv	a0,s0
    421c:	a59ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4220:	00040513          	mv	a0,s0
    4224:	a71ff0ef          	jal	3c94 <i2c_rxAck>
    4228:	b91fd0ef          	jal	1db8 <assert>
    422c:	0ff4f493          	zext.b	s1,s1
    4230:	0124e4b3          	or	s1,s1,s2
    4234:	00942023          	sw	s1,0(s0)
	i2c_txByte(i2c_addr, focus_step & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    4238:	00040513          	mv	a0,s0
    423c:	a39ff0ef          	jal	3c74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4240:	00040513          	mv	a0,s0
    4244:	a51ff0ef          	jal	3c94 <i2c_rxAck>
    4248:	b71fd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    424c:	00040513          	mv	a0,s0
    4250:	9f5ff0ef          	jal	3c44 <i2c_masterStopBlocking>
}
    4254:	01c12083          	lw	ra,28(sp)
    4258:	01812403          	lw	s0,24(sp)
    425c:	01412483          	lw	s1,20(sp)
    4260:	01012903          	lw	s2,16(sp)
    4264:	00c12983          	lw	s3,12(sp)
    4268:	02010113          	addi	sp,sp,32
    426c:	00008067          	ret

00004270 <PiCamV3_Init>:
	PiCamV3_WriteRegData(IMX708_REG_TEST_PATTERN, IMX708_TEST_PATTERN_SOLID_COLOR);
}
*/

void PiCamV3_Init(u32 i2c_addr)
{
    4270:	ff010113          	addi	sp,sp,-16
    4274:	00112623          	sw	ra,12(sp)
    4278:	00812423          	sw	s0,8(sp)
    427c:	00050413          	mv	s0,a0

	PiCamV3_StopStreaming(i2c_addr);
    4280:	b15ff0ef          	jal	3d94 <PiCamV3_StopStreaming>

	PiCamV3_ConfigCommon(i2c_addr);
    4284:	00040513          	mv	a0,s0
    4288:	b2dff0ef          	jal	3db4 <PiCamV3_ConfigCommon>

	PiCamV3_SetPdafGain(i2c_addr);
    428c:	00040513          	mv	a0,s0
    4290:	d0dff0ef          	jal	3f9c <PiCamV3_SetPdafGain>

	PiCamV3_ConfigFormat(i2c_addr, 1);
    4294:	00100593          	li	a1,1
    4298:	00040513          	mv	a0,s0
    429c:	b75ff0ef          	jal	3e10 <PiCamV3_ConfigFormat>

	PiCamV3_ConfigLinkFreq(i2c_addr);
    42a0:	00040513          	mv	a0,s0
    42a4:	c5dff0ef          	jal	3f00 <PiCamV3_ConfigLinkFreq>

	PiCamV3_ConfigQuadBayerRemosaicAdjustment(i2c_addr);
    42a8:	00040513          	mv	a0,s0
    42ac:	cadff0ef          	jal	3f58 <PiCamV3_ConfigQuadBayerRemosaicAdjustment>

	PiCamV3_OnActuator(i2c_addr);
    42b0:	00040513          	mv	a0,s0
    42b4:	d91ff0ef          	jal	4044 <PiCamV3_OnActuator>

	PiCamV3_SetFocusStep(i2c_addr, 700);
    42b8:	2bc00593          	li	a1,700
    42bc:	00040513          	mv	a0,s0
    42c0:	e85ff0ef          	jal	4144 <PiCamV3_SetFocusStep>

	PiCamV3_OffActuator(i2c_addr);
    42c4:	00040513          	mv	a0,s0
    42c8:	dfdff0ef          	jal	40c4 <PiCamV3_OffActuator>

	//	PiCamV3_StartStreaming();

	uart_writeStr(BSP_UART_TERMINAL, "\n\rDone Camera Init");
    42cc:	000055b7          	lui	a1,0x5
    42d0:	ce858593          	addi	a1,a1,-792 # 4ce8 <_data+0x96c>
    42d4:	f8010537          	lui	a0,0xf8010
    42d8:	8d5ff0ef          	jal	3bac <uart_writeStr>
}
    42dc:	00c12083          	lw	ra,12(sp)
    42e0:	00812403          	lw	s0,8(sp)
    42e4:	01010113          	addi	sp,sp,16
    42e8:	00008067          	ret

000042ec <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
    42ec:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
    42f0:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    42f4:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    42f8:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    42fc:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    4300:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    4304:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    4308:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    430c:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    4310:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    4314:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    4318:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    431c:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    4320:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    4324:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    4328:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    432c:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
    4330:	95dfd0ef          	jal	1c8c <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
    4334:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    4338:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    433c:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    4340:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    4344:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    4348:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    434c:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    4350:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    4354:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    4358:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    435c:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    4360:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    4364:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    4368:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    436c:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    4370:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
    4374:	04010113          	addi	sp,sp,64
#endif
    4378:	30200073          	mret
