
build/evsoc_ispExample_demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00005197          	auipc	gp,0x5
    1004:	14818193          	addi	gp,gp,328 # 6148 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00006117          	auipc	sp,0x6
    100c:	b0810113          	addi	sp,sp,-1272 # 6b10 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00003517          	auipc	a0,0x3
    1014:	50050513          	addi	a0,a0,1280 # 4510 <_data>
	la a1, _data
    1018:	00003597          	auipc	a1,0x3
    101c:	4f858593          	addi	a1,a1,1272 # 4510 <_data>
	la a2, _edata
    1020:	00005617          	auipc	a2,0x5
    1024:	95460613          	addi	a2,a2,-1708 # 5974 <uart_cmd_ready>
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
    1040:	00005517          	auipc	a0,0x5
    1044:	93450513          	addi	a0,a0,-1740 # 5974 <uart_cmd_ready>
	la a1, _end
    1048:	00005597          	auipc	a1,0x5
    104c:	ac058593          	addi	a1,a1,-1344 # 5b08 <_end>
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
    109c:	67988893          	addi	a7,a7,1657 # 5711 <_ctype_+0x1>
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
    10dc:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff94ef>
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
    1178:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff94ef>
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
    126c:	8101a503          	lw	a0,-2032(gp) # 5958 <_impure_ptr>
    1270:	e0dff06f          	j	107c <_strtol_l.isra.0>

00001274 <__errno>:
    1274:	8101a503          	lw	a0,-2032(gp) # 5958 <_impure_ptr>
    1278:	00008067          	ret

0000127c <__libc_init_array>:
    127c:	ff010113          	addi	sp,sp,-16
    1280:	00812423          	sw	s0,8(sp)
    1284:	01212023          	sw	s2,0(sp)
    1288:	00003797          	auipc	a5,0x3
    128c:	28878793          	addi	a5,a5,648 # 4510 <_data>
    1290:	00003417          	auipc	s0,0x3
    1294:	28040413          	addi	s0,s0,640 # 4510 <_data>
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
    12c8:	24c78793          	addi	a5,a5,588 # 4510 <_data>
    12cc:	00003417          	auipc	s0,0x3
    12d0:	24440413          	addi	s0,s0,580 # 4510 <_data>
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
    1320:	e2c50513          	addi	a0,a0,-468 # 4e2c <_data+0x91c>
    1324:	13c010ef          	jal	2460 <bsp_printf>

    cam0_init(I2C_CTRL_CAM0);
    bsp_printf("\n\rDone !!\n\r");

#elif defined(BOARD_Ti60F225)
    bsp_printf("Init Camera.....");
    1328:	00005537          	lui	a0,0x5
    132c:	e5050513          	addi	a0,a0,-432 # 4e50 <_data+0x940>
    1330:	130010ef          	jal	2460 <bsp_printf>
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    1334:	f8100437          	lui	s0,0xf8100
    1338:	00042223          	sw	zero,4(s0) # f8100004 <__freertos_irq_stack_top+0xf80f94f4>

    // Assert camera reset
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000000);
    bsp_uDelay(100);
    133c:	f8b00637          	lui	a2,0xf8b00
    1340:	05f5e5b7          	lui	a1,0x5f5e
    1344:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    1348:	06400513          	li	a0,100
    134c:	3d5000ef          	jal	1f20 <clint_uDelay>
    1350:	00200793          	li	a5,2
    1354:	00f42223          	sw	a5,4(s0)
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000002);
    bsp_uDelay(1000 * 10);
    1358:	f8b00637          	lui	a2,0xf8b00
    135c:	05f5e5b7          	lui	a1,0x5f5e
    1360:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    1364:	00002537          	lui	a0,0x2
    1368:	71050513          	addi	a0,a0,1808 # 2710 <Latency_Print+0x180>
    136c:	3b5000ef          	jal	1f20 <clint_uDelay>

    cam0_init(I2C_CTRL_CAM0);
    1370:	f8015537          	lui	a0,0xf8015
    1374:	161020ef          	jal	3cd4 <cam0_init>
    1378:	00300793          	li	a5,3
    137c:	00f42223          	sw	a5,4(s0)

    // Indicate camera configuration done
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000003);
    bsp_printf("Done\n\r");
    1380:	00005537          	lui	a0,0x5
    1384:	e6450513          	addi	a0,a0,-412 # 4e64 <_data+0x954>
    1388:	0d8010ef          	jal	2460 <bsp_printf>

#endif

    /******************************************************SETUP DMA & UART********************************************************/

    bsp_printf("Init DMA.....");
    138c:	00005537          	lui	a0,0x5
    1390:	e6c50513          	addi	a0,a0,-404 # 4e6c <_data+0x95c>
    1394:	0cc010ef          	jal	2460 <bsp_printf>

    uart_interrupt_init();
    1398:	5d4010ef          	jal	296c <uart_interrupt_init>
    dma_init();
    139c:	07d000ef          	jal	1c18 <dma_init>

    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, 0, 0);
    13a0:	00000693          	li	a3,0
    13a4:	00000613          	li	a2,0
    13a8:	00400593          	li	a1,4
    13ac:	f8110537          	lui	a0,0xf8110
    13b0:	098010ef          	jal	2448 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, 0, 0);
    13b4:	00000693          	li	a3,0
    13b8:	00000613          	li	a2,0
    13bc:	00300593          	li	a1,3
    13c0:	f8110537          	lui	a0,0xf8110
    13c4:	084010ef          	jal	2448 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, 0, 0);
    13c8:	00000693          	li	a3,0
    13cc:	00000613          	li	a2,0
    13d0:	00200593          	li	a1,2
    13d4:	f8110537          	lui	a0,0xf8110
    13d8:	070010ef          	jal	2448 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, 0, 0);
    13dc:	00000693          	li	a3,0
    13e0:	00000613          	li	a2,0
    13e4:	00000593          	li	a1,0
    13e8:	f8110537          	lui	a0,0xf8110
    13ec:	05c010ef          	jal	2448 <dmasg_priority>

    bsp_printf("Done !!\n\n\r");
    13f0:	00005537          	lui	a0,0x5
    13f4:	e7c50513          	addi	a0,a0,-388 # 4e7c <_data+0x96c>
    13f8:	068010ef          	jal	2460 <bsp_printf>

    /*******************************************************Trigger Display********************************************************/

    select_demo_mode = 0; // Default
    13fc:	8201aa23          	sw	zero,-1996(gp) # 597c <select_demo_mode>

    // To check display functionality
    bsp_printf("Initialize test display content..\n\r");
    1400:	00005537          	lui	a0,0x5
    1404:	e8850513          	addi	a0,a0,-376 # 4e88 <_data+0x978>
    1408:	058010ef          	jal	2460 <bsp_printf>

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
    1470:	f0068693          	addi	a3,a3,-256 # ff00 <__freertos_irq_stack_top+0x93f0>
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
    151c:	00160613          	addi	a2,a2,1 # f8b00001 <__freertos_irq_stack_top+0xf8af94f1>
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
    1534:	eac50513          	addi	a0,a0,-340 # 4eac <_data+0x99c>
    1538:	729000ef          	jal	2460 <bsp_printf>

    // SELECT start address of to be displayed data accordingly - Default
    dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    153c:	01000693          	li	a3,16
    1540:	00100637          	lui	a2,0x100
    1544:	00200593          	li	a1,2
    1548:	f8110537          	lui	a0,0xf8110
    154c:	5f5000ef          	jal	2340 <dmasg_input_memory>

    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    1550:	00100793          	li	a5,1
    1554:	00000713          	li	a4,0
    1558:	00000693          	li	a3,0
    155c:	00000613          	li	a2,0
    1560:	00200593          	li	a1,2
    1564:	f8110537          	lui	a0,0xf8110
    1568:	661000ef          	jal	23c8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    156c:	00400613          	li	a2,4
    1570:	00200593          	li	a1,2
    1574:	f8110537          	lui	a0,0xf8110
    1578:	6a5000ef          	jal	241c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restart
    157c:	00000693          	li	a3,0
    1580:	0011d637          	lui	a2,0x11d
    1584:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116130>
    1588:	00200593          	li	a1,2
    158c:	f8110537          	lui	a0,0xf8110
    1590:	665000ef          	jal	23f4 <dmasg_direct_start>
    display_mm2s_active = 1;                                                                         // Display always active
    1594:	00100713          	li	a4,1
    1598:	82e1a823          	sw	a4,-2000(gp) # 5978 <display_mm2s_active>

    msDelay(5000); // Display test content for 5 seconds
    159c:	00001537          	lui	a0,0x1
    15a0:	38850513          	addi	a0,a0,904 # 1388 <main+0x78>
    15a4:	039000ef          	jal	1ddc <msDelay>

    bsp_printf("Done !!\n\n\r");
    15a8:	00005537          	lui	a0,0x5
    15ac:	e7c50513          	addi	a0,a0,-388 # 4e7c <_data+0x96c>
    15b0:	6b1000ef          	jal	2460 <bsp_printf>

    ispExample_menu();
    15b4:	255010ef          	jal	3008 <ispExample_menu>

    bsp_printf("Default Demo Mode: a\n\r");
    15b8:	00005537          	lui	a0,0x5
    15bc:	ec850513          	addi	a0,a0,-312 # 4ec8 <_data+0x9b8>
    15c0:	6a1000ef          	jal	2460 <bsp_printf>
    15c4:	1040006f          	j	16c8 <main+0x3b8>
    15c8:	f81007b7          	lui	a5,0xf8100
    15cc:	0007a623          	sw	zero,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f94fc>
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
    15e4:	2f0010ef          	jal	28d4 <rgb2grayscale>
    15e8:	1800006f          	j	1768 <main+0x458>
        *((volatile u32*) address) = data;
    15ec:	f81207b7          	lui	a5,0xf8120
    15f0:	0007a223          	sw	zero,4(a5) # f8120004 <__freertos_irq_stack_top+0xf81194f4>
                write_u32(0x00000002, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG1_OFFSET); // 2'd2: Sobel+Erosion
            }

            // Trigger HW accel MM2S DMA
            // SELECT start address of DMA input to HW accel block
            dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, CAM_START_ADDR, 16); // Camera pre-processing block performs HW RGB2grayscale conversion
    15f4:	01000693          	li	a3,16
    15f8:	00100637          	lui	a2,0x100
    15fc:	00400593          	li	a1,4
    1600:	f8110537          	lui	a0,0xf8110
    1604:	53d000ef          	jal	2340 <dmasg_input_memory>
            // dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16); //RISC-V performs SW RGB2grayscale conversion
            dmasg_output_stream(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, DMASG_HW_ACCEL_MM2S_1_PORT, 0, 0, 1);
    1608:	00100793          	li	a5,1
    160c:	00000713          	li	a4,0
    1610:	00000693          	li	a3,0
    1614:	00000613          	li	a2,0
    1618:	00400593          	li	a1,4
    161c:	f8110537          	lui	a0,0xf8110
    1620:	5a9000ef          	jal	23c8 <dmasg_output_stream>

            // SELECT dma transfer length - Make sure match with HW accelerator mode selection
            // Additonal data is required to be fed for line buffer(s) data flushing
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1624:	8341a783          	lw	a5,-1996(gp) # 597c <select_demo_mode>
    1628:	00200713          	li	a4,2
    162c:	00e78663          	beq	a5,a4,1638 <main+0x328>
    1630:	00400713          	li	a4,4
    1634:	18e79863          	bne	a5,a4,17c4 <main+0x4b4>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (FRAME_WIDTH + 1)) * 4, 0); // Sobel only
    1638:	00000693          	li	a3,0
    163c:	0011d637          	lui	a2,0x11d
    1640:	4b460613          	addi	a2,a2,1204 # 11d4b4 <__freertos_irq_stack_top+0x1169a4>
    1644:	00400593          	li	a1,4
    1648:	f8110537          	lui	a0,0xf8110
    164c:	5a9000ef          	jal	23f4 <dmasg_direct_start>
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
    1664:	52d000ef          	jal	2390 <dmasg_input_stream>
            dmasg_output_memory(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, SOBEL_START_ADDR, 16);
    1668:	01000693          	li	a3,16
    166c:	00900637          	lui	a2,0x900
    1670:	00300593          	li	a1,3
    1674:	f8110537          	lui	a0,0xf8110
    1678:	4f1000ef          	jal	2368 <dmasg_output_memory>
            dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    167c:	00000693          	li	a3,0
    1680:	0011d637          	lui	a2,0x11d
    1684:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116130>
    1688:	00300593          	li	a1,3
    168c:	f8110537          	lui	a0,0xf8110
    1690:	565000ef          	jal	23f4 <dmasg_direct_start>
    1694:	f81207b7          	lui	a5,0xf8120
    1698:	00100713          	li	a4,1
    169c:	00e7a423          	sw	a4,8(a5) # f8120008 <__freertos_irq_stack_top+0xf81194f8>
    16a0:	0007a423          	sw	zero,8(a5)
            // Indicate start of S2MM DMA to HW accel building block via APB3 slave
            write_u32(0x00000001, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);
            write_u32(0x00000000, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);

            // Wait for DMA transfer completion
            while (dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL) || dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL))
    16a4:	00400593          	li	a1,4
    16a8:	f8110537          	lui	a0,0xf8110
    16ac:	589000ef          	jal	2434 <dmasg_busy>
    16b0:	fe051ae3          	bnez	a0,16a4 <main+0x394>
    16b4:	00300593          	li	a1,3
    16b8:	f8110537          	lui	a0,0xf8110
    16bc:	579000ef          	jal	2434 <dmasg_busy>
    16c0:	fe0512e3          	bnez	a0,16a4 <main+0x394>
    16c4:	0000500f          	.word	0x0000500f
        Read_Latency();
    16c8:	154010ef          	jal	281c <Read_Latency>
        if (select_demo_mode > 2)
    16cc:	8341a703          	lw	a4,-1996(gp) # 597c <select_demo_mode>
    16d0:	00200793          	li	a5,2
    16d4:	eee7fae3          	bgeu	a5,a4,15c8 <main+0x2b8>
    16d8:	f81007b7          	lui	a5,0xf8100
    16dc:	00100713          	li	a4,1
    16e0:	00e7a623          	sw	a4,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f94fc>
        dmasg_input_stream(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, DMASG_CAM1_S2MM_PORT, 1, 0);
    16e4:	00000713          	li	a4,0
    16e8:	00100693          	li	a3,1
    16ec:	00000613          	li	a2,0
    16f0:	00000593          	li	a1,0
    16f4:	f8110537          	lui	a0,0xf8110
    16f8:	499000ef          	jal	2390 <dmasg_input_stream>
        dmasg_output_memory(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, CAM_START_ADDR, 16);
    16fc:	01000693          	li	a3,16
    1700:	00100637          	lui	a2,0x100
    1704:	00000593          	li	a1,0
    1708:	f8110537          	lui	a0,0xf8110
    170c:	45d000ef          	jal	2368 <dmasg_output_memory>
        dmasg_direct_start(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    1710:	00000693          	li	a3,0
    1714:	0011d637          	lui	a2,0x11d
    1718:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116130>
    171c:	00000593          	li	a1,0
    1720:	f8110537          	lui	a0,0xf8110
    1724:	4d1000ef          	jal	23f4 <dmasg_direct_start>
    1728:	f81007b7          	lui	a5,0xf8100
    172c:	00100713          	li	a4,1
    1730:	00e7a823          	sw	a4,16(a5) # f8100010 <__freertos_irq_stack_top+0xf80f9500>
    1734:	0007a823          	sw	zero,16(a5)
    1738:	f81007b7          	lui	a5,0xf8100
    173c:	00e7a423          	sw	a4,8(a5) # f8100008 <__freertos_irq_stack_top+0xf80f94f8>
    1740:	0007a423          	sw	zero,8(a5)
        while (dmasg_busy(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL))
    1744:	00000593          	li	a1,0
    1748:	f8110537          	lui	a0,0xf8110
    174c:	4e9000ef          	jal	2434 <dmasg_busy>
    1750:	fe051ae3          	bnez	a0,1744 <main+0x434>
    1754:	0000500f          	.word	0x0000500f
        if (select_demo_mode == 1 || select_demo_mode == 2)
    1758:	8341a783          	lw	a5,-1996(gp) # 597c <select_demo_mode>
    175c:	fff78793          	addi	a5,a5,-1
    1760:	00100713          	li	a4,1
    1764:	e6f778e3          	bgeu	a4,a5,15d4 <main+0x2c4>
        if (select_demo_mode == 2 || select_demo_mode > 3)
    1768:	8341a783          	lw	a5,-1996(gp) # 597c <select_demo_mode>
    176c:	00200713          	li	a4,2
    1770:	00e78663          	beq	a5,a4,177c <main+0x46c>
    1774:	00300713          	li	a4,3
    1778:	f4f778e3          	bgeu	a4,a5,16c8 <main+0x3b8>
    177c:	f81207b7          	lui	a5,0xf8120
    1780:	00500713          	li	a4,5
    1784:	00e7a023          	sw	a4,0(a5) # f8120000 <__freertos_irq_stack_top+0xf81194f0>
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1788:	8341a783          	lw	a5,-1996(gp) # 597c <select_demo_mode>
    178c:	00200713          	li	a4,2
    1790:	e4e78ee3          	beq	a5,a4,15ec <main+0x2dc>
    1794:	00400713          	li	a4,4
    1798:	e4e78ae3          	beq	a5,a4,15ec <main+0x2dc>
            else if (select_demo_mode == 5)
    179c:	00500713          	li	a4,5
    17a0:	00e78a63          	beq	a5,a4,17b4 <main+0x4a4>
    17a4:	f81207b7          	lui	a5,0xf8120
    17a8:	00200713          	li	a4,2
    17ac:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf81194f4>
    }
    17b0:	e45ff06f          	j	15f4 <main+0x2e4>
        *((volatile u32*) address) = data;
    17b4:	f81207b7          	lui	a5,0xf8120
    17b8:	00100713          	li	a4,1
    17bc:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf81194f4>
    }
    17c0:	e35ff06f          	j	15f4 <main+0x2e4>
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
    17c4:	00000693          	li	a3,0
    17c8:	0011e637          	lui	a2,0x11e
    17cc:	d2860613          	addi	a2,a2,-728 # 11dd28 <__freertos_irq_stack_top+0x117218>
    17d0:	00400593          	li	a1,4
    17d4:	f8110537          	lui	a0,0xf8110
    17d8:	41d000ef          	jal	23f4 <dmasg_direct_start>
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
    17e8:	00c5a023          	sw	a2,0(a1) # 500000 <__freertos_irq_stack_top+0x4f94f0>
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
    1854:	00452503          	lw	a0,4(a0) # f8110004 <__freertos_irq_stack_top+0xf81094f4>
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
    191c:	51078793          	addi	a5,a5,1296 # 4510 <_data>
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
    1970:	52478793          	addi	a5,a5,1316 # 4524 <_data+0x14>
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
    1ba8:	53850513          	addi	a0,a0,1336 # 4538 <_data+0x28>
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
    1bdc:	f5c70713          	addi	a4,a4,-164 # 4f5c <_data+0xa4c>
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
    1c0c:	58450513          	addi	a0,a0,1412 # 4584 <_data+0x74>
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
    1c58:	48078793          	addi	a5,a5,1152 # 4480 <trap_entry>
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
    1ca8:	2dc010ef          	jal	2f84 <externalInterrupt>
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
    1cc0:	00452503          	lw	a0,4(a0) # f8c00004 <__freertos_irq_stack_top+0xf8bf94f4>
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
    1d54:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed730>
    1d58:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1d5c:	0000c7b7          	lui	a5,0xc
    1d60:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x54e8>
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
    1dcc:	59458593          	addi	a1,a1,1428 # 4594 <_data+0x84>
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
    1dec:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
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
    1e1c:	6a078793          	addi	a5,a5,1696 # 186a0 <__freertos_irq_stack_top+0x11b90>
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
    1e54:	00452503          	lw	a0,4(a0) # f8010004 <__freertos_irq_stack_top+0xf80094f4>
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
    1f24:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed730>
    1f28:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1f2c:	0000c7b7          	lui	a5,0xc
    1f30:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x54e8>
    1f34:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1f38:	00062783          	lw	a5,0(a2) # f8b00000 <__freertos_irq_stack_top+0xf8af94f0>
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
    1fd0:	51078793          	addi	a5,a5,1296 # 4510 <_data>
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
    2024:	52478793          	addi	a5,a5,1316 # 4524 <_data+0x14>
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
    2224:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f94f4>
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
    2240:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f94f4>
    2244:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
    2248:	00c5a023          	sw	a2,0(a1)
    }
    224c:	00008067          	ret

00002250 <Set_Gain>:
	return rdata;
}

// Unified Set_Gain — camId selects which camera (0 = cam1, 1 = cam2)
static inline void Set_Gain(int camId, int var, u16 setting)
{
    2250:	ff010113          	addi	sp,sp,-16
    2254:	00112623          	sw	ra,12(sp)
	u32 data = setting;
    2258:	00060693          	mv	a3,a2

#ifdef DUAL_CAM
	u32 offset = (camId == 0) ? EXAMPLE_APB3_SLV_REG1_OFFSET
							  : EXAMPLE_APB3_SLV_REG5_OFFSET;
#else
	u32 offset = (var==0) ? EXAMPLE_APB3_SLV_REG0_OFFSET : 
    225c:	00c00793          	li	a5,12
    2260:	00b7ee63          	bltu	a5,a1,227c <Set_Gain+0x2c>
    2264:	00259793          	slli	a5,a1,0x2
    2268:	00005737          	lui	a4,0x5
    226c:	fe070713          	addi	a4,a4,-32 # 4fe0 <_data+0xad0>
    2270:	00e787b3          	add	a5,a5,a4
    2274:	0007a783          	lw	a5,0(a5)
    2278:	00078067          	jr	a5
	u32 data = setting;
    227c:	04400713          	li	a4,68
    2280:	0680006f          	j	22e8 <Set_Gain+0x98>
    2284:	01400713          	li	a4,20
    2288:	0600006f          	j	22e8 <Set_Gain+0x98>
    228c:	01800713          	li	a4,24
    2290:	0580006f          	j	22e8 <Set_Gain+0x98>
    2294:	01c00713          	li	a4,28
    2298:	0500006f          	j	22e8 <Set_Gain+0x98>
    229c:	02000713          	li	a4,32
    22a0:	0480006f          	j	22e8 <Set_Gain+0x98>
    22a4:	02400713          	li	a4,36
    22a8:	0400006f          	j	22e8 <Set_Gain+0x98>
    22ac:	02800713          	li	a4,40
    22b0:	0380006f          	j	22e8 <Set_Gain+0x98>
    22b4:	02c00713          	li	a4,44
    22b8:	0300006f          	j	22e8 <Set_Gain+0x98>
    22bc:	03000713          	li	a4,48
    22c0:	0280006f          	j	22e8 <Set_Gain+0x98>
    22c4:	03400713          	li	a4,52
    22c8:	0200006f          	j	22e8 <Set_Gain+0x98>
    22cc:	03800713          	li	a4,56
    22d0:	0180006f          	j	22e8 <Set_Gain+0x98>
    22d4:	03c00713          	li	a4,60
    22d8:	0100006f          	j	22e8 <Set_Gain+0x98>
    22dc:	04000713          	li	a4,64
    22e0:	0080006f          	j	22e8 <Set_Gain+0x98>
    22e4:	00000713          	li	a4,0
				 (var==10)? EXAMPLE_APB3_SLV_REG14_OFFSET:
				 (var==11)? EXAMPLE_APB3_SLV_REG15_OFFSET: 
				 (var==12)? EXAMPLE_APB3_SLV_REG16_OFFSET:EXAMPLE_APB3_SLV_REG17_OFFSET; // single cam, camId ignored
#endif

	if (var >= 1 && var <= 3) {    // REG5-7 colour gains (Q9.7)
    22e8:	fff58793          	addi	a5,a1,-1
    22ec:	00200513          	li	a0,2
    22f0:	00f56a63          	bltu	a0,a5,2304 <Set_Gain+0xb4>
		if (data > 0x400) data = 0x400;   // ceiling: 8.0x
    22f4:	40000793          	li	a5,1024
    22f8:	00d7fa63          	bgeu	a5,a3,230c <Set_Gain+0xbc>
    22fc:	40000693          	li	a3,1024
    2300:	00c0006f          	j	230c <Set_Gain+0xbc>
	} else if (var == 13) {               // REG17 isp_enable
    2304:	00d00793          	li	a5,13
    2308:	02f58863          	beq	a1,a5,2338 <Set_Gain+0xe8>
		data &= 0x3;
	}

	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, offset, data);
    230c:	f81007b7          	lui	a5,0xf8100
    2310:	00f707b3          	add	a5,a4,a5
    2314:	00d7a023          	sw	a3,0(a5) # f8100000 <__freertos_irq_stack_top+0xf80f94f0>
	bsp_uDelay(DELAY_BUSY);
    2318:	f8b00637          	lui	a2,0xf8b00
    231c:	05f5e5b7          	lui	a1,0x5f5e
    2320:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2324:	00500513          	li	a0,5
    2328:	bf9ff0ef          	jal	1f20 <clint_uDelay>
}
    232c:	00c12083          	lw	ra,12(sp)
    2330:	01010113          	addi	sp,sp,16
    2334:	00008067          	ret
		data &= 0x3;
    2338:	00367693          	andi	a3,a2,3
    233c:	fd1ff06f          	j	230c <Set_Gain+0xbc>

00002340 <dmasg_input_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_input_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2340:	00759593          	slli	a1,a1,0x7
    2344:	00a58533          	add	a0,a1,a0
    2348:	00c52023          	sw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf80094f0>
        write_u32(address, ca + DMASG_CHANNEL_INPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_INPUT_CONFIG);
    234c:	fff68693          	addi	a3,a3,-1 # feffff <__freertos_irq_stack_top+0xfe94ef>
    2350:	000017b7          	lui	a5,0x1
    2354:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2358:	00e6f6b3          	and	a3,a3,a4
    235c:	00f6e6b3          	or	a3,a3,a5
    2360:	00d52623          	sw	a3,12(a0)
    }
    2364:	00008067          	ret

00002368 <dmasg_output_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_output_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2368:	00759593          	slli	a1,a1,0x7
    236c:	00a58533          	add	a0,a1,a0
    2370:	00c52823          	sw	a2,16(a0)
        write_u32(address, ca + DMASG_CHANNEL_OUTPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    2374:	fff68693          	addi	a3,a3,-1
    2378:	000017b7          	lui	a5,0x1
    237c:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2380:	00e6f6b3          	and	a3,a3,a4
    2384:	00f6e6b3          	or	a3,a3,a5
    2388:	00d52e23          	sw	a3,28(a0)
    }
    238c:	00008067          	ret

00002390 <dmasg_input_stream>:
*                              contain one packet and force its completion when fully transferred 
*                              into memory.
*
*******************************************************************************/   
    static void dmasg_input_stream(u32 base, u32 channel, u32 port, u32 wait_on_packet, u32 completion_on_packet){
        u32 ca = dmasg_ca(base, channel);
    2390:	00759593          	slli	a1,a1,0x7
    2394:	00a58533          	add	a0,a1,a0
    2398:	00c52423          	sw	a2,8(a0)
        write_u32(port << 0, ca + DMASG_CHANNEL_INPUT_STREAM);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    239c:	00070e63          	beqz	a4,23b8 <dmasg_input_stream+0x28>
    23a0:	000027b7          	lui	a5,0x2
    23a4:	00068e63          	beqz	a3,23c0 <dmasg_input_stream+0x30>
    23a8:	00004737          	lui	a4,0x4
    23ac:	00e7e7b3          	or	a5,a5,a4
    23b0:	00f52623          	sw	a5,12(a0)
    }
    23b4:	00008067          	ret
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    23b8:	00000793          	li	a5,0
    23bc:	fe9ff06f          	j	23a4 <dmasg_input_stream+0x14>
    23c0:	00000713          	li	a4,0
    23c4:	fe9ff06f          	j	23ac <dmasg_input_stream+0x1c>

000023c8 <dmasg_output_stream>:
* @param last: Specifies if an end of packet should be sent at the end of the transfer
*              (only for direct DMA control, not linked list)
*
*******************************************************************************/
    static void dmasg_output_stream(u32 base, u32 channel, u32 port, u32 source, u32 sink, u32 last){
        u32 ca = dmasg_ca(base, channel);
    23c8:	00759593          	slli	a1,a1,0x7
    23cc:	00a58533          	add	a0,a1,a0
        write_u32(port << 0 | source << 8 | sink << 16, ca + DMASG_CHANNEL_OUTPUT_STREAM);
    23d0:	00869693          	slli	a3,a3,0x8
    23d4:	00c6e6b3          	or	a3,a3,a2
    23d8:	01071713          	slli	a4,a4,0x10
    23dc:	00e6e6b3          	or	a3,a3,a4
    23e0:	00d52c23          	sw	a3,24(a0)
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_STREAM | (last ? DMASG_CHANNEL_OUTPUT_CONFIG_LAST : 0), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    23e4:	00078463          	beqz	a5,23ec <dmasg_output_stream+0x24>
    23e8:	000027b7          	lui	a5,0x2
    23ec:	00f52e23          	sw	a5,28(a0)
    }
    23f0:	00008067          	ret

000023f4 <dmasg_direct_start>:
*                      The DESCRIPTOR_COMPLETION_HALF interrupt can be usefull 
*                      in that mode.
*
*******************************************************************************/
    static void dmasg_direct_start(u32 base, u32 channel, u32 bytes, u32 self_restart){
        u32 ca = dmasg_ca(base, channel);
    23f4:	00759593          	slli	a1,a1,0x7
    23f8:	00a58533          	add	a0,a1,a0
        write_u32(bytes-1, ca + DMASG_CHANNEL_DIRECT_BYTES);
    23fc:	fff60613          	addi	a2,a2,-1 # f8afffff <__freertos_irq_stack_top+0xf8af94ef>
    2400:	02c52023          	sw	a2,32(a0)
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2404:	00068863          	beqz	a3,2414 <dmasg_direct_start+0x20>
    2408:	00300793          	li	a5,3
    240c:	02f52623          	sw	a5,44(a0)
    }
    2410:	00008067          	ret
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2414:	00100793          	li	a5,1
    2418:	ff5ff06f          	j	240c <dmasg_direct_start+0x18>

0000241c <dmasg_interrupt_config>:
*       This function clear all pending interrupts for the given channel 
*       before enabling the mask's interrupts.
*
*******************************************************************************/
    static void dmasg_interrupt_config(u32 base, u32 channel, u32 mask){
        u32 ca = dmasg_ca(base, channel);
    241c:	00759593          	slli	a1,a1,0x7
    2420:	00a58533          	add	a0,a1,a0
    2424:	fff00793          	li	a5,-1
    2428:	04f52a23          	sw	a5,84(a0)
    242c:	04c52823          	sw	a2,80(a0)
        write_u32(0xFFFFFFFF, ca+DMASG_CHANNEL_INTERRUPT_PENDING);
        write_u32(mask, ca+DMASG_CHANNEL_INTERRUPT_ENABLE);
    }
    2430:	00008067          	ret

00002434 <dmasg_busy>:
*
* @return 1 if the channel is busy, 0 otherwise
*
*******************************************************************************/
    static u32 dmasg_busy(u32 base, u32 channel){
        u32 ca = dmasg_ca(base, channel);
    2434:	00759593          	slli	a1,a1,0x7
    2438:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
    243c:	02c5a503          	lw	a0,44(a1)
        return read_u32(ca + DMASG_CHANNEL_STATUS) & DMASG_CHANNEL_STATUS_BUSY;
    }
    2440:	00157513          	andi	a0,a0,1
    2444:	00008067          	ret

00002448 <dmasg_priority>:
* @param priority: Priority of the channel
* @param weight: Weight of the channel
*
*******************************************************************************/  
    static void dmasg_priority(u32 base, u32 channel, u32 priority, u32 weight){
        u32 ca = dmasg_ca(base, channel);
    2448:	00759593          	slli	a1,a1,0x7
    244c:	00a585b3          	add	a1,a1,a0
        write_u32(priority| weight << 8,  ca+DMASG_CHANNEL_PRIORITY);
    2450:	00869693          	slli	a3,a3,0x8
    2454:	00c6e6b3          	or	a3,a3,a2
        *((volatile u32*) address) = data;
    2458:	04d5a223          	sw	a3,68(a1)
    }
    245c:	00008067          	ret

00002460 <bsp_printf>:
    {
    2460:	fc010113          	addi	sp,sp,-64
    2464:	00112e23          	sw	ra,28(sp)
    2468:	00812c23          	sw	s0,24(sp)
    246c:	00912a23          	sw	s1,20(sp)
    2470:	00050493          	mv	s1,a0
    2474:	02b12223          	sw	a1,36(sp)
    2478:	02c12423          	sw	a2,40(sp)
    247c:	02d12623          	sw	a3,44(sp)
    2480:	02e12823          	sw	a4,48(sp)
    2484:	02f12a23          	sw	a5,52(sp)
    2488:	03012c23          	sw	a6,56(sp)
    248c:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    2490:	02410793          	addi	a5,sp,36
    2494:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    2498:	00000413          	li	s0,0
    249c:	01c0006f          	j	24b8 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    24a0:	00c12783          	lw	a5,12(sp)
    24a4:	00478713          	addi	a4,a5,4 # 2004 <bsp_printHex_lower+0x8>
    24a8:	00e12623          	sw	a4,12(sp)
    24ac:	0007a503          	lw	a0,0(a5)
    24b0:	ba1ff0ef          	jal	2050 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    24b4:	00140413          	addi	s0,s0,1
    24b8:	008487b3          	add	a5,s1,s0
    24bc:	0007c503          	lbu	a0,0(a5)
    24c0:	0a050e63          	beqz	a0,257c <bsp_printf+0x11c>
            if (format[i] == '%') {
    24c4:	02500793          	li	a5,37
    24c8:	06f50e63          	beq	a0,a5,2544 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    24cc:	b85ff0ef          	jal	2050 <bsp_printf_c>
    24d0:	fe5ff06f          	j	24b4 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    24d4:	00c12783          	lw	a5,12(sp)
    24d8:	00478713          	addi	a4,a5,4
    24dc:	00e12623          	sw	a4,12(sp)
    24e0:	0007a503          	lw	a0,0(a5)
    24e4:	b89ff0ef          	jal	206c <bsp_printf_s>
                        break;
    24e8:	fcdff06f          	j	24b4 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    24ec:	00c12783          	lw	a5,12(sp)
    24f0:	00478713          	addi	a4,a5,4
    24f4:	00e12623          	sw	a4,12(sp)
    24f8:	0007a503          	lw	a0,0(a5)
    24fc:	b89ff0ef          	jal	2084 <bsp_printf_d>
                        break;
    2500:	fb5ff06f          	j	24b4 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    2504:	00c12783          	lw	a5,12(sp)
    2508:	00478713          	addi	a4,a5,4
    250c:	00e12623          	sw	a4,12(sp)
    2510:	0007a503          	lw	a0,0(a5)
    2514:	c31ff0ef          	jal	2144 <bsp_printf_X>
                        break;
    2518:	f9dff06f          	j	24b4 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    251c:	00c12783          	lw	a5,12(sp)
    2520:	00478713          	addi	a4,a5,4
    2524:	00e12623          	sw	a4,12(sp)
    2528:	0007a503          	lw	a0,0(a5)
    252c:	bd9ff0ef          	jal	2104 <bsp_printf_x>
                        break;
    2530:	f85ff06f          	j	24b4 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    2534:	00004537          	lui	a0,0x4
    2538:	53850513          	addi	a0,a0,1336 # 4538 <_data+0x28>
    253c:	b31ff0ef          	jal	206c <bsp_printf_s>
                        break;
    2540:	f75ff06f          	j	24b4 <bsp_printf+0x54>
                while (format[++i]) {
    2544:	00140413          	addi	s0,s0,1
    2548:	008487b3          	add	a5,s1,s0
    254c:	0007c783          	lbu	a5,0(a5)
    2550:	f60782e3          	beqz	a5,24b4 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    2554:	fa878793          	addi	a5,a5,-88
    2558:	0ff7f693          	zext.b	a3,a5
    255c:	02000713          	li	a4,32
    2560:	fed762e3          	bltu	a4,a3,2544 <bsp_printf+0xe4>
    2564:	00269793          	slli	a5,a3,0x2
    2568:	00005737          	lui	a4,0x5
    256c:	01470713          	addi	a4,a4,20 # 5014 <_data+0xb04>
    2570:	00e787b3          	add	a5,a5,a4
    2574:	0007a783          	lw	a5,0(a5)
    2578:	00078067          	jr	a5
    }
    257c:	01c12083          	lw	ra,28(sp)
    2580:	01812403          	lw	s0,24(sp)
    2584:	01412483          	lw	s1,20(sp)
    2588:	04010113          	addi	sp,sp,64
    258c:	00008067          	ret

00002590 <Latency_Print>:
static inline void Latency_Print(int i, u32 raw)
{
	u32 counter_data = raw >> 1;
	u32 overflow     = raw & 1;

	switch(i)
    2590:	00b00713          	li	a4,11
    2594:	1ea76463          	bltu	a4,a0,277c <Latency_Print+0x1ec>
{
    2598:	ff010113          	addi	sp,sp,-16
    259c:	00112623          	sw	ra,12(sp)
    25a0:	00058793          	mv	a5,a1
    25a4:	0015d593          	srli	a1,a1,0x1
    25a8:	0017f793          	andi	a5,a5,1
	switch(i)
    25ac:	00251513          	slli	a0,a0,0x2
    25b0:	00005737          	lui	a4,0x5
    25b4:	09870713          	addi	a4,a4,152 # 5098 <_data+0xb88>
    25b8:	00e50533          	add	a0,a0,a4
    25bc:	00052703          	lw	a4,0(a0)
    25c0:	00070067          	jr	a4
	{
		case 0:
			overflow == 0 ? bsp_printf("TOTAL ISP minimum latency: %d clock cycles\n\r", counter_data):
    25c4:	00079e63          	bnez	a5,25e0 <Latency_Print+0x50>
    25c8:	00004537          	lui	a0,0x4
    25cc:	5a450513          	addi	a0,a0,1444 # 45a4 <_data+0x94>
    25d0:	e91ff0ef          	jal	2460 <bsp_printf>
		case 11:
			overflow == 0 ? bsp_printf("GAMMA maximum latency: %d clock cycles\n\r", counter_data):
						    bsp_printf("GAMMA maximum latency: OVERFLOW\n\r", counter_data);
		break;
	}
}
    25d4:	00c12083          	lw	ra,12(sp)
    25d8:	01010113          	addi	sp,sp,16
    25dc:	00008067          	ret
						    bsp_printf("TOTAL ISP minimum latency: OVERFLOW\n\r", counter_data);
    25e0:	00004537          	lui	a0,0x4
    25e4:	5d450513          	addi	a0,a0,1492 # 45d4 <_data+0xc4>
    25e8:	e79ff0ef          	jal	2460 <bsp_printf>
    25ec:	fe9ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("BLC minimum latency: %d clock cycles\n\r", counter_data):
    25f0:	00079a63          	bnez	a5,2604 <Latency_Print+0x74>
    25f4:	00004537          	lui	a0,0x4
    25f8:	5fc50513          	addi	a0,a0,1532 # 45fc <_data+0xec>
    25fc:	e65ff0ef          	jal	2460 <bsp_printf>
    2600:	fd5ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("BLC minimum latency: OVERFLOW\n\r", counter_data);
    2604:	00004537          	lui	a0,0x4
    2608:	62450513          	addi	a0,a0,1572 # 4624 <_data+0x114>
    260c:	e55ff0ef          	jal	2460 <bsp_printf>
    2610:	fc5ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("COLOUR GAIN minimum latency: %d clock cycles\n\r", counter_data):
    2614:	00079a63          	bnez	a5,2628 <Latency_Print+0x98>
    2618:	00004537          	lui	a0,0x4
    261c:	64450513          	addi	a0,a0,1604 # 4644 <_data+0x134>
    2620:	e41ff0ef          	jal	2460 <bsp_printf>
    2624:	fb1ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("COLOUR GAIN minimum latency: OVERFLOW\n\r", counter_data);
    2628:	00004537          	lui	a0,0x4
    262c:	67450513          	addi	a0,a0,1652 # 4674 <_data+0x164>
    2630:	e31ff0ef          	jal	2460 <bsp_printf>
    2634:	fa1ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("DEMOSAIC minimum latency: %d clock cycles\n\r", counter_data):
    2638:	00079a63          	bnez	a5,264c <Latency_Print+0xbc>
    263c:	00004537          	lui	a0,0x4
    2640:	69c50513          	addi	a0,a0,1692 # 469c <_data+0x18c>
    2644:	e1dff0ef          	jal	2460 <bsp_printf>
    2648:	f8dff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("DEMOSAIC minimum latency: OVERFLOW\n\r", counter_data);
    264c:	00004537          	lui	a0,0x4
    2650:	6c850513          	addi	a0,a0,1736 # 46c8 <_data+0x1b8>
    2654:	e0dff0ef          	jal	2460 <bsp_printf>
    2658:	f7dff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("CCM minimum latency: %d clock cycles\n\r", counter_data):
    265c:	00079a63          	bnez	a5,2670 <Latency_Print+0xe0>
    2660:	00004537          	lui	a0,0x4
    2664:	6f050513          	addi	a0,a0,1776 # 46f0 <_data+0x1e0>
    2668:	df9ff0ef          	jal	2460 <bsp_printf>
    266c:	f69ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("CCM minimum latency: OVERFLOW\n\r", counter_data);
    2670:	00004537          	lui	a0,0x4
    2674:	71850513          	addi	a0,a0,1816 # 4718 <_data+0x208>
    2678:	de9ff0ef          	jal	2460 <bsp_printf>
    267c:	f59ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("GAMMA minimum latency: %d clock cycles\n\r", counter_data):
    2680:	00079a63          	bnez	a5,2694 <Latency_Print+0x104>
    2684:	00004537          	lui	a0,0x4
    2688:	73850513          	addi	a0,a0,1848 # 4738 <_data+0x228>
    268c:	dd5ff0ef          	jal	2460 <bsp_printf>
    2690:	f45ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("GAMMA minimum latency: OVERFLOW\n\r", counter_data);
    2694:	00004537          	lui	a0,0x4
    2698:	76450513          	addi	a0,a0,1892 # 4764 <_data+0x254>
    269c:	dc5ff0ef          	jal	2460 <bsp_printf>
    26a0:	f35ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("TOTAL ISP maximum latency: %d clock cycles\n\r", counter_data):
    26a4:	00079a63          	bnez	a5,26b8 <Latency_Print+0x128>
    26a8:	00004537          	lui	a0,0x4
    26ac:	78850513          	addi	a0,a0,1928 # 4788 <_data+0x278>
    26b0:	db1ff0ef          	jal	2460 <bsp_printf>
    26b4:	f21ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("TOTAL ISP maximum latency: OVERFLOW\n\r", counter_data);
    26b8:	00004537          	lui	a0,0x4
    26bc:	7b850513          	addi	a0,a0,1976 # 47b8 <_data+0x2a8>
    26c0:	da1ff0ef          	jal	2460 <bsp_printf>
    26c4:	f11ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("BLC maximum latency: %d clock cycles\n\r", counter_data):
    26c8:	00079a63          	bnez	a5,26dc <Latency_Print+0x14c>
    26cc:	00004537          	lui	a0,0x4
    26d0:	7e050513          	addi	a0,a0,2016 # 47e0 <_data+0x2d0>
    26d4:	d8dff0ef          	jal	2460 <bsp_printf>
    26d8:	efdff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("BLC maximum latency: OVERFLOW\n\r", counter_data);
    26dc:	00005537          	lui	a0,0x5
    26e0:	80850513          	addi	a0,a0,-2040 # 4808 <_data+0x2f8>
    26e4:	d7dff0ef          	jal	2460 <bsp_printf>
    26e8:	eedff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("COLOUR GAIN maximum latency: %d clock cycles\n\r", counter_data):
    26ec:	00079a63          	bnez	a5,2700 <Latency_Print+0x170>
    26f0:	00005537          	lui	a0,0x5
    26f4:	82850513          	addi	a0,a0,-2008 # 4828 <_data+0x318>
    26f8:	d69ff0ef          	jal	2460 <bsp_printf>
    26fc:	ed9ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("COLOUR GAIN maximum latency: OVERFLOW\n\r", counter_data);
    2700:	00005537          	lui	a0,0x5
    2704:	85850513          	addi	a0,a0,-1960 # 4858 <_data+0x348>
    2708:	d59ff0ef          	jal	2460 <bsp_printf>
    270c:	ec9ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("DEMOSAIC maximum latency: %d clock cycles\n\r", counter_data):
    2710:	00079a63          	bnez	a5,2724 <Latency_Print+0x194>
    2714:	00005537          	lui	a0,0x5
    2718:	88050513          	addi	a0,a0,-1920 # 4880 <_data+0x370>
    271c:	d45ff0ef          	jal	2460 <bsp_printf>
    2720:	eb5ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("DEMOSAIC maximum latency: OVERFLOW\n\r", counter_data);
    2724:	00005537          	lui	a0,0x5
    2728:	8ac50513          	addi	a0,a0,-1876 # 48ac <_data+0x39c>
    272c:	d35ff0ef          	jal	2460 <bsp_printf>
    2730:	ea5ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("CCM maximum latency: %d clock cycles\n\r", counter_data):
    2734:	00079a63          	bnez	a5,2748 <Latency_Print+0x1b8>
    2738:	00005537          	lui	a0,0x5
    273c:	8d450513          	addi	a0,a0,-1836 # 48d4 <_data+0x3c4>
    2740:	d21ff0ef          	jal	2460 <bsp_printf>
    2744:	e91ff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("CCM maximum latency: OVERFLOW\n\r", counter_data);
    2748:	00005537          	lui	a0,0x5
    274c:	8fc50513          	addi	a0,a0,-1796 # 48fc <_data+0x3ec>
    2750:	d11ff0ef          	jal	2460 <bsp_printf>
    2754:	e81ff06f          	j	25d4 <Latency_Print+0x44>
			overflow == 0 ? bsp_printf("GAMMA maximum latency: %d clock cycles\n\r", counter_data):
    2758:	00079a63          	bnez	a5,276c <Latency_Print+0x1dc>
    275c:	00005537          	lui	a0,0x5
    2760:	91c50513          	addi	a0,a0,-1764 # 491c <_data+0x40c>
    2764:	cfdff0ef          	jal	2460 <bsp_printf>
    2768:	e6dff06f          	j	25d4 <Latency_Print+0x44>
						    bsp_printf("GAMMA maximum latency: OVERFLOW\n\r", counter_data);
    276c:	00005537          	lui	a0,0x5
    2770:	94850513          	addi	a0,a0,-1720 # 4948 <_data+0x438>
    2774:	cedff0ef          	jal	2460 <bsp_printf>
}
    2778:	e5dff06f          	j	25d4 <Latency_Print+0x44>
    277c:	00008067          	ret

00002780 <Latency_Report>:
//Unconditional full report of all 12 latched min/max values (valid or not).
//Used by the 'L' command and the GUI latency-panel reset button: it always
//repopulates the panel immediately, even when the values have converged and
//no new records would ever trigger a print.
static inline void Latency_Report()
{
    2780:	ff010113          	addi	sp,sp,-16
    2784:	00112623          	sw	ra,12(sp)
    2788:	00812423          	sw	s0,8(sp)
    278c:	00912223          	sw	s1,4(sp)
    2790:	01212023          	sw	s2,0(sp)
	for(int i=0; i<12; i++)
    2794:	00000413          	li	s0,0
    2798:	0640006f          	j	27fc <Latency_Report+0x7c>
	{
		u32 raw = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4);
    279c:	00241793          	slli	a5,s0,0x2
    27a0:	f8100737          	lui	a4,0xf8100
    27a4:	07070713          	addi	a4,a4,112 # f8100070 <__freertos_irq_stack_top+0xf80f9560>
    27a8:	00e787b3          	add	a5,a5,a4
        return *((volatile u32*) address);
    27ac:	0007a903          	lw	s2,0(a5)

		//clear any pending valid with a ready pulse so state stays clean
		write_u32(1 << i, EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG18_OFFSET);
    27b0:	00100793          	li	a5,1
    27b4:	008797b3          	sll	a5,a5,s0
        *((volatile u32*) address) = data;
    27b8:	f81004b7          	lui	s1,0xf8100
    27bc:	04f4a423          	sw	a5,72(s1) # f8100048 <__freertos_irq_stack_top+0xf80f9538>
		bsp_uDelay(DELAY_BUSY);
    27c0:	f8b00637          	lui	a2,0xf8b00
    27c4:	05f5e5b7          	lui	a1,0x5f5e
    27c8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    27cc:	00500513          	li	a0,5
    27d0:	f50ff0ef          	jal	1f20 <clint_uDelay>
    27d4:	0404a423          	sw	zero,72(s1)
		write_u32(0, EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG18_OFFSET);
		bsp_uDelay(DELAY_BUSY);
    27d8:	f8b00637          	lui	a2,0xf8b00
    27dc:	05f5e5b7          	lui	a1,0x5f5e
    27e0:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    27e4:	00500513          	li	a0,5
    27e8:	f38ff0ef          	jal	1f20 <clint_uDelay>

		Latency_Print(i, raw);
    27ec:	00090593          	mv	a1,s2
    27f0:	00040513          	mv	a0,s0
    27f4:	d9dff0ef          	jal	2590 <Latency_Print>
	for(int i=0; i<12; i++)
    27f8:	00140413          	addi	s0,s0,1
    27fc:	00b00793          	li	a5,11
    2800:	f887dee3          	bge	a5,s0,279c <Latency_Report+0x1c>
	}
}
    2804:	00c12083          	lw	ra,12(sp)
    2808:	00812403          	lw	s0,8(sp)
    280c:	00412483          	lw	s1,4(sp)
    2810:	00012903          	lw	s2,0(sp)
    2814:	01010113          	addi	sp,sp,16
    2818:	00008067          	ret

0000281c <Read_Latency>:
{
    281c:	fe010113          	addi	sp,sp,-32
    2820:	00112e23          	sw	ra,28(sp)
    2824:	00812c23          	sw	s0,24(sp)
    2828:	00912a23          	sw	s1,20(sp)
    282c:	01212823          	sw	s2,16(sp)
    2830:	01312623          	sw	s3,12(sp)
        return *((volatile u32*) address);
    2834:	f81007b7          	lui	a5,0xf8100
    2838:	0a07a903          	lw	s2,160(a5) # f81000a0 <__freertos_irq_stack_top+0xf80f9590>
	for(int i=0; i<12; i++)
    283c:	00000413          	li	s0,0
    2840:	0080006f          	j	2848 <Read_Latency+0x2c>
    2844:	00140413          	addi	s0,s0,1
    2848:	00b00793          	li	a5,11
    284c:	0687c663          	blt	a5,s0,28b8 <Read_Latency+0x9c>
		if((valid_status & (1 << i)) != 0)
    2850:	00100793          	li	a5,1
    2854:	008797b3          	sll	a5,a5,s0
    2858:	0127f733          	and	a4,a5,s2
    285c:	fe0704e3          	beqz	a4,2844 <Read_Latency+0x28>
			u32 raw = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4);
    2860:	00241713          	slli	a4,s0,0x2
    2864:	f81006b7          	lui	a3,0xf8100
    2868:	07068693          	addi	a3,a3,112 # f8100070 <__freertos_irq_stack_top+0xf80f9560>
    286c:	00d70733          	add	a4,a4,a3
    2870:	00072983          	lw	s3,0(a4)
        *((volatile u32*) address) = data;
    2874:	f81004b7          	lui	s1,0xf8100
    2878:	04f4a423          	sw	a5,72(s1) # f8100048 <__freertos_irq_stack_top+0xf80f9538>
			bsp_uDelay(DELAY_BUSY);
    287c:	f8b00637          	lui	a2,0xf8b00
    2880:	05f5e5b7          	lui	a1,0x5f5e
    2884:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2888:	00500513          	li	a0,5
    288c:	e94ff0ef          	jal	1f20 <clint_uDelay>
    2890:	0404a423          	sw	zero,72(s1)
			bsp_uDelay(DELAY_BUSY);
    2894:	f8b00637          	lui	a2,0xf8b00
    2898:	05f5e5b7          	lui	a1,0x5f5e
    289c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    28a0:	00500513          	li	a0,5
    28a4:	e7cff0ef          	jal	1f20 <clint_uDelay>
			Latency_Print(i, raw);
    28a8:	00098593          	mv	a1,s3
    28ac:	00040513          	mv	a0,s0
    28b0:	ce1ff0ef          	jal	2590 <Latency_Print>
    28b4:	f91ff06f          	j	2844 <Read_Latency+0x28>
}
    28b8:	01c12083          	lw	ra,28(sp)
    28bc:	01812403          	lw	s0,24(sp)
    28c0:	01412483          	lw	s1,20(sp)
    28c4:	01012903          	lw	s2,16(sp)
    28c8:	00c12983          	lw	s3,12(sp)
    28cc:	02010113          	addi	sp,sp,32
    28d0:	00008067          	ret

000028d4 <rgb2grayscale>:

void rgb2grayscale(volatile uint32_t in_array[], volatile uint32_t out_array[], uint32_t width, uint32_t height)
{
   uint8_t red, green, blue, grayscale;

   for (int i = 0; i < (width * height); i++)
    28d4:	00000313          	li	t1,0
    28d8:	0880006f          	j	2960 <rgb2grayscale+0x8c>
   {
      red = (in_array[i]) & 0xff;
    28dc:	00231e13          	slli	t3,t1,0x2
    28e0:	01c507b3          	add	a5,a0,t3
    28e4:	0007a703          	lw	a4,0(a5)
      green = ((in_array[i]) >> 8) & 0xff;
    28e8:	0007a883          	lw	a7,0(a5)
    28ec:	0088d893          	srli	a7,a7,0x8
      blue = ((in_array[i]) >> 16) & 0xff;
    28f0:	0007a803          	lw	a6,0(a5)
    28f4:	01085813          	srli	a6,a6,0x10

      grayscale = (30 * red + 59 * green + 11 * blue) / 100;
    28f8:	0ff77713          	zext.b	a4,a4
    28fc:	00471793          	slli	a5,a4,0x4
    2900:	40e787b3          	sub	a5,a5,a4
    2904:	00179793          	slli	a5,a5,0x1
    2908:	0ff8f893          	zext.b	a7,a7
    290c:	00489713          	slli	a4,a7,0x4
    2910:	41170733          	sub	a4,a4,a7
    2914:	00271713          	slli	a4,a4,0x2
    2918:	41170733          	sub	a4,a4,a7
    291c:	00e787b3          	add	a5,a5,a4
    2920:	0ff87813          	zext.b	a6,a6
    2924:	00181713          	slli	a4,a6,0x1
    2928:	01070733          	add	a4,a4,a6
    292c:	00271713          	slli	a4,a4,0x2
    2930:	41070733          	sub	a4,a4,a6
    2934:	00e787b3          	add	a5,a5,a4
    2938:	06400713          	li	a4,100
    293c:	02e7c7b3          	div	a5,a5,a4
      out_array[i] = (grayscale << 16) + (grayscale << 8) + (grayscale);
    2940:	0ff7f793          	zext.b	a5,a5
    2944:	01079713          	slli	a4,a5,0x10
    2948:	00879813          	slli	a6,a5,0x8
    294c:	01070733          	add	a4,a4,a6
    2950:	01c58e33          	add	t3,a1,t3
    2954:	00f707b3          	add	a5,a4,a5
    2958:	00fe2023          	sw	a5,0(t3)
   for (int i = 0; i < (width * height); i++)
    295c:	00130313          	addi	t1,t1,1
    2960:	02d607b3          	mul	a5,a2,a3
    2964:	f6f36ce3          	bltu	t1,a5,28dc <rgb2grayscale+0x8>
   }

   return;
}
    2968:	00008067          	ret

0000296c <uart_interrupt_init>:
{
    296c:	ff010113          	addi	sp,sp,-16
    2970:	00112623          	sw	ra,12(sp)
    bsp_init();
    2974:	811ff0ef          	jal	2184 <bsp_init>
    uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2978:	f8010537          	lui	a0,0xf8010
    297c:	d94ff0ef          	jal	1f10 <uart_status_read>
    2980:	00256593          	ori	a1,a0,2
    2984:	0ff5f593          	zext.b	a1,a1
    2988:	f8010537          	lui	a0,0xf8010
    298c:	d8cff0ef          	jal	1f18 <uart_status_write>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
    2990:	00100693          	li	a3,1
    2994:	00100613          	li	a2,1
    2998:	00000593          	li	a1,0
    299c:	f8c00537          	lui	a0,0xf8c00
    29a0:	82dff0ef          	jal	21cc <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 2); // 1
    29a4:	00200613          	li	a2,2
    29a8:	00100593          	li	a1,1
    29ac:	f8c00537          	lui	a0,0xf8c00
    29b0:	80dff0ef          	jal	21bc <plic_set_priority>
}
    29b4:	00c12083          	lw	ra,12(sp)
    29b8:	01010113          	addi	sp,sp,16
    29bc:	00008067          	ret

000029c0 <trigger_next_display_dma>:
{
    29c0:	ff010113          	addi	sp,sp,-16
    29c4:	00112623          	sw	ra,12(sp)
    if (select_demo_mode == 0 || select_demo_mode == 3)
    29c8:	8341a783          	lw	a5,-1996(gp) # 597c <select_demo_mode>
    29cc:	02078663          	beqz	a5,29f8 <trigger_next_display_dma+0x38>
    29d0:	00300713          	li	a4,3
    29d4:	02e78263          	beq	a5,a4,29f8 <trigger_next_display_dma+0x38>
    else if (select_demo_mode == 1)
    29d8:	00100713          	li	a4,1
    29dc:	08e78063          	beq	a5,a4,2a5c <trigger_next_display_dma+0x9c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, SOBEL_START_ADDR, 16);
    29e0:	01000693          	li	a3,16
    29e4:	00900637          	lui	a2,0x900
    29e8:	00200593          	li	a1,2
    29ec:	f8110537          	lui	a0,0xf8110
    29f0:	951ff0ef          	jal	2340 <dmasg_input_memory>
    29f4:	0180006f          	j	2a0c <trigger_next_display_dma+0x4c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    29f8:	01000693          	li	a3,16
    29fc:	00100637          	lui	a2,0x100
    2a00:	00200593          	li	a1,2
    2a04:	f8110537          	lui	a0,0xf8110
    2a08:	939ff0ef          	jal	2340 <dmasg_input_memory>
    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    2a0c:	00100793          	li	a5,1
    2a10:	00000713          	li	a4,0
    2a14:	00000693          	li	a3,0
    2a18:	00000613          	li	a2,0
    2a1c:	00200593          	li	a1,2
    2a20:	f8110537          	lui	a0,0xf8110
    2a24:	9a5ff0ef          	jal	23c8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    2a28:	00400613          	li	a2,4
    2a2c:	00200593          	li	a1,2
    2a30:	f8110537          	lui	a0,0xf8110
    2a34:	9e9ff0ef          	jal	241c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restar
    2a38:	00000693          	li	a3,0
    2a3c:	0011d637          	lui	a2,0x11d
    2a40:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116130>
    2a44:	00200593          	li	a1,2
    2a48:	f8110537          	lui	a0,0xf8110
    2a4c:	9a9ff0ef          	jal	23f4 <dmasg_direct_start>
}
    2a50:	00c12083          	lw	ra,12(sp)
    2a54:	01010113          	addi	sp,sp,16
    2a58:	00008067          	ret
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16);
    2a5c:	01000693          	li	a3,16
    2a60:	00500637          	lui	a2,0x500
    2a64:	00200593          	li	a1,2
    2a68:	f8110537          	lui	a0,0xf8110
    2a6c:	8d5ff0ef          	jal	2340 <dmasg_input_memory>
    2a70:	f9dff06f          	j	2a0c <trigger_next_display_dma+0x4c>

00002a74 <uart_buffer_read>:
{
    2a74:	ff010113          	addi	sp,sp,-16
    2a78:	00112623          	sw	ra,12(sp)
    2a7c:	00812423          	sw	s0,8(sp)
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2a80:	0440006f          	j	2ac4 <uart_buffer_read+0x50>
           uart_write(BSP_UART_TERMINAL, c);
    2a84:	00040593          	mv	a1,s0
    2a88:	f8010537          	lui	a0,0xf8010
    2a8c:	be4ff0ef          	jal	1e70 <uart_write>
    2a90:	0a40006f          	j	2b34 <uart_buffer_read+0xc0>
            if (uart_cmd_index > 0) {
    2a94:	82d1c783          	lbu	a5,-2003(gp) # 5975 <uart_cmd_index>
    2a98:	0ff7f793          	zext.b	a5,a5
    2a9c:	02078463          	beqz	a5,2ac4 <uart_buffer_read+0x50>
                uart_cmd_buffer[uart_cmd_index] = '\0';
    2aa0:	82d1c683          	lbu	a3,-2003(gp) # 5975 <uart_cmd_index>
    2aa4:	97c18793          	addi	a5,gp,-1668 # 5ac4 <uart_cmd_buffer>
    2aa8:	00d787b3          	add	a5,a5,a3
    2aac:	00078023          	sb	zero,0(a5)
                uart_cmd_ready = true;
    2ab0:	00100693          	li	a3,1
    2ab4:	82d18623          	sb	a3,-2004(gp) # 5974 <uart_cmd_ready>
                uart_cmd_index = 0;         // reset for next command
    2ab8:	820186a3          	sb	zero,-2003(gp) # 5975 <uart_cmd_index>
            continue;
    2abc:	0080006f          	j	2ac4 <uart_buffer_read+0x50>
            uart_cmd_index = 0;
    2ac0:	820186a3          	sb	zero,-2003(gp) # 5975 <uart_cmd_index>
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2ac4:	f8010537          	lui	a0,0xf8010
    2ac8:	c48ff0ef          	jal	1f10 <uart_status_read>
    2acc:	20057513          	andi	a0,a0,512
    2ad0:	0a050263          	beqz	a0,2b74 <uart_buffer_read+0x100>
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD); // RX FIFO not empty interrupt Disable
    2ad4:	f8010537          	lui	a0,0xf8010
    2ad8:	c38ff0ef          	jal	1f10 <uart_status_read>
    2adc:	0fd57593          	andi	a1,a0,253
    2ae0:	f8010537          	lui	a0,0xf8010
    2ae4:	c34ff0ef          	jal	1f18 <uart_status_write>
        char c = uart_read(BSP_UART_TERMINAL);
    2ae8:	f8010537          	lui	a0,0xf8010
    2aec:	bc0ff0ef          	jal	1eac <uart_read>
    2af0:	00050413          	mv	s0,a0
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2af4:	f8010537          	lui	a0,0xf8010
    2af8:	c18ff0ef          	jal	1f10 <uart_status_read>
    2afc:	00256593          	ori	a1,a0,2
    2b00:	0ff5f593          	zext.b	a1,a1
    2b04:	f8010537          	lui	a0,0xf8010
    2b08:	c10ff0ef          	jal	1f18 <uart_status_write>
        if (c == '\r' || c == '\n') {
    2b0c:	00d00793          	li	a5,13
    2b10:	00f40663          	beq	s0,a5,2b1c <uart_buffer_read+0xa8>
    2b14:	00a00793          	li	a5,10
    2b18:	f6f416e3          	bne	s0,a5,2a84 <uart_buffer_read+0x10>
            uart_write(BSP_UART_TERMINAL, '\r');
    2b1c:	00d00593          	li	a1,13
    2b20:	f8010537          	lui	a0,0xf8010
    2b24:	b4cff0ef          	jal	1e70 <uart_write>
            uart_write(BSP_UART_TERMINAL, '\n');
    2b28:	00a00593          	li	a1,10
    2b2c:	f8010537          	lui	a0,0xf8010
    2b30:	b40ff0ef          	jal	1e70 <uart_write>
        if (c == '\r' || c == '\n') {
    2b34:	00d00793          	li	a5,13
    2b38:	f4f40ee3          	beq	s0,a5,2a94 <uart_buffer_read+0x20>
    2b3c:	00a00793          	li	a5,10
    2b40:	f4f40ae3          	beq	s0,a5,2a94 <uart_buffer_read+0x20>
        if (uart_cmd_index < UART_CMD_MAX_LEN - 1) {
    2b44:	82d1c783          	lbu	a5,-2003(gp) # 5975 <uart_cmd_index>
    2b48:	0ff7f793          	zext.b	a5,a5
    2b4c:	03e00713          	li	a4,62
    2b50:	f6f768e3          	bltu	a4,a5,2ac0 <uart_buffer_read+0x4c>
            uart_cmd_buffer[uart_cmd_index++] = c;
    2b54:	82d1c703          	lbu	a4,-2003(gp) # 5975 <uart_cmd_index>
    2b58:	00170793          	addi	a5,a4,1
    2b5c:	0ff7f793          	zext.b	a5,a5
    2b60:	82f186a3          	sb	a5,-2003(gp) # 5975 <uart_cmd_index>
    2b64:	97c18793          	addi	a5,gp,-1668 # 5ac4 <uart_cmd_buffer>
    2b68:	00e787b3          	add	a5,a5,a4
    2b6c:	00878023          	sb	s0,0(a5)
    2b70:	f55ff06f          	j	2ac4 <uart_buffer_read+0x50>
    if (uart_cmd_ready) {
    2b74:	82c1c783          	lbu	a5,-2004(gp) # 5974 <uart_cmd_ready>
    2b78:	0ff7f793          	zext.b	a5,a5
    2b7c:	00079a63          	bnez	a5,2b90 <uart_buffer_read+0x11c>
}
    2b80:	00c12083          	lw	ra,12(sp)
    2b84:	00812403          	lw	s0,8(sp)
    2b88:	01010113          	addi	sp,sp,16
    2b8c:	00008067          	ret
        var = uart_cmd_buffer[0];
    2b90:	97c18413          	addi	s0,gp,-1668 # 5ac4 <uart_cmd_buffer>
    2b94:	00044783          	lbu	a5,0(s0)
    2b98:	0ff7f793          	zext.b	a5,a5
    2b9c:	96f18c23          	sb	a5,-1672(gp) # 5ac0 <var>
        data= atoi(&uart_cmd_buffer[1]);
    2ba0:	97d18513          	addi	a0,gp,-1667 # 5ac5 <uart_cmd_buffer+0x1>
    2ba4:	cccfe0ef          	jal	1070 <atoi>
    2ba8:	96a1aa23          	sw	a0,-1676(gp) # 5abc <data>
        char_data= uart_cmd_buffer[1];
    2bac:	00144783          	lbu	a5,1(s0)
    2bb0:	0ff7f793          	zext.b	a5,a5
    2bb4:	96f18823          	sb	a5,-1680(gp) # 5ab8 <char_data>
}
    2bb8:	fc9ff06f          	j	2b80 <uart_buffer_read+0x10c>

00002bbc <settings>:
    if (uart_cmd_ready)
    2bbc:	82c1c783          	lbu	a5,-2004(gp) # 5974 <uart_cmd_ready>
    2bc0:	0ff7f793          	zext.b	a5,a5
    2bc4:	3a078e63          	beqz	a5,2f80 <settings+0x3c4>
{
    2bc8:	ff010113          	addi	sp,sp,-16
    2bcc:	00112623          	sw	ra,12(sp)
    {uart_cmd_ready = false; // Reset command ready flag
    2bd0:	82018623          	sb	zero,-2004(gp) # 5974 <uart_cmd_ready>
        switch (var)
    2bd4:	9781c783          	lbu	a5,-1672(gp) # 5ac0 <var>
    2bd8:	fd078793          	addi	a5,a5,-48
    2bdc:	0ff7f693          	zext.b	a3,a5
    2be0:	01c00713          	li	a4,28
    2be4:	38d76463          	bltu	a4,a3,2f6c <settings+0x3b0>
    2be8:	00269793          	slli	a5,a3,0x2
    2bec:	00005737          	lui	a4,0x5
    2bf0:	0c870713          	addi	a4,a4,200 # 50c8 <_data+0xbb8>
    2bf4:	00e787b3          	add	a5,a5,a4
    2bf8:	0007a783          	lw	a5,0(a5)
    2bfc:	00078067          	jr	a5
            if (char_data == 'a')
    2c00:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c04:	0ff7f793          	zext.b	a5,a5
    2c08:	06100713          	li	a4,97
    2c0c:	06e78c63          	beq	a5,a4,2c84 <settings+0xc8>
            else if (char_data == 'b')
    2c10:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c14:	0ff7f793          	zext.b	a5,a5
    2c18:	06200713          	li	a4,98
    2c1c:	06e78e63          	beq	a5,a4,2c98 <settings+0xdc>
            else if (char_data == 'c')
    2c20:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c24:	0ff7f793          	zext.b	a5,a5
    2c28:	06300713          	li	a4,99
    2c2c:	08e78263          	beq	a5,a4,2cb0 <settings+0xf4>
            else if (char_data == 'd')
    2c30:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c34:	0ff7f793          	zext.b	a5,a5
    2c38:	06400713          	li	a4,100
    2c3c:	08e78663          	beq	a5,a4,2cc8 <settings+0x10c>
            else if (char_data == 'e')
    2c40:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c44:	0ff7f793          	zext.b	a5,a5
    2c48:	06500713          	li	a4,101
    2c4c:	08e78a63          	beq	a5,a4,2ce0 <settings+0x124>
            else if (char_data == 'f')
    2c50:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c54:	0ff7f793          	zext.b	a5,a5
    2c58:	06600713          	li	a4,102
    2c5c:	08e78e63          	beq	a5,a4,2cf8 <settings+0x13c>
            else if (char_data == 'g')
    2c60:	9701c783          	lbu	a5,-1680(gp) # 5ab8 <char_data>
    2c64:	0ff7f793          	zext.b	a5,a5
    2c68:	06700713          	li	a4,103
    2c6c:	0ae78263          	beq	a5,a4,2d10 <settings+0x154>
                bsp_printf("Invalid Demo Mode: %c\n\r", char_data);
    2c70:	9701c583          	lbu	a1,-1680(gp) # 5ab8 <char_data>
    2c74:	00005537          	lui	a0,0x5
    2c78:	a3050513          	addi	a0,a0,-1488 # 4a30 <_data+0x520>
    2c7c:	fe4ff0ef          	jal	2460 <bsp_printf>
    2c80:	0d00006f          	j	2d50 <settings+0x194>
                select_demo_mode = 0;
    2c84:	8201aa23          	sw	zero,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: Da\n\r");
    2c88:	00005537          	lui	a0,0x5
    2c8c:	96c50513          	addi	a0,a0,-1684 # 496c <_data+0x45c>
    2c90:	fd0ff0ef          	jal	2460 <bsp_printf>
    2c94:	0bc0006f          	j	2d50 <settings+0x194>
                select_demo_mode = 1;
    2c98:	00100713          	li	a4,1
    2c9c:	82e1aa23          	sw	a4,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: Db\n\r");
    2ca0:	00005537          	lui	a0,0x5
    2ca4:	98850513          	addi	a0,a0,-1656 # 4988 <_data+0x478>
    2ca8:	fb8ff0ef          	jal	2460 <bsp_printf>
    2cac:	0a40006f          	j	2d50 <settings+0x194>
                select_demo_mode = 2;
    2cb0:	00200713          	li	a4,2
    2cb4:	82e1aa23          	sw	a4,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: Dc\n\r");
    2cb8:	00005537          	lui	a0,0x5
    2cbc:	9a450513          	addi	a0,a0,-1628 # 49a4 <_data+0x494>
    2cc0:	fa0ff0ef          	jal	2460 <bsp_printf>
    2cc4:	08c0006f          	j	2d50 <settings+0x194>
                select_demo_mode = 3;
    2cc8:	00300713          	li	a4,3
    2ccc:	82e1aa23          	sw	a4,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: Dd\n\r");
    2cd0:	00005537          	lui	a0,0x5
    2cd4:	9c050513          	addi	a0,a0,-1600 # 49c0 <_data+0x4b0>
    2cd8:	f88ff0ef          	jal	2460 <bsp_printf>
    2cdc:	0740006f          	j	2d50 <settings+0x194>
                select_demo_mode = 4;
    2ce0:	00400713          	li	a4,4
    2ce4:	82e1aa23          	sw	a4,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: De\n\r");
    2ce8:	00005537          	lui	a0,0x5
    2cec:	9dc50513          	addi	a0,a0,-1572 # 49dc <_data+0x4cc>
    2cf0:	f70ff0ef          	jal	2460 <bsp_printf>
    2cf4:	05c0006f          	j	2d50 <settings+0x194>
                select_demo_mode = 5;
    2cf8:	00500713          	li	a4,5
    2cfc:	82e1aa23          	sw	a4,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: Df\n\r");
    2d00:	00005537          	lui	a0,0x5
    2d04:	9f850513          	addi	a0,a0,-1544 # 49f8 <_data+0x4e8>
    2d08:	f58ff0ef          	jal	2460 <bsp_printf>
    2d0c:	0440006f          	j	2d50 <settings+0x194>
                select_demo_mode = 6;
    2d10:	00600713          	li	a4,6
    2d14:	82e1aa23          	sw	a4,-1996(gp) # 597c <select_demo_mode>
                bsp_printf("Selected Demo Mode: Dg\n\r");
    2d18:	00005537          	lui	a0,0x5
    2d1c:	a1450513          	addi	a0,a0,-1516 # 4a14 <_data+0x504>
    2d20:	f40ff0ef          	jal	2460 <bsp_printf>
    2d24:	02c0006f          	j	2d50 <settings+0x194>
            Set_Gain(0, 0, data);
    2d28:	9741a783          	lw	a5,-1676(gp) # 5abc <data>
	u32 data = setting;
    2d2c:	01079793          	slli	a5,a5,0x10
    2d30:	0107d793          	srli	a5,a5,0x10
    2d34:	f8100737          	lui	a4,0xf8100
    2d38:	00f72023          	sw	a5,0(a4) # f8100000 <__freertos_irq_stack_top+0xf80f94f0>
	bsp_uDelay(DELAY_BUSY);
    2d3c:	f8b00637          	lui	a2,0xf8b00
    2d40:	05f5e5b7          	lui	a1,0x5f5e
    2d44:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2d48:	00500513          	li	a0,5
    2d4c:	9d4ff0ef          	jal	1f20 <clint_uDelay>
}
    2d50:	00c12083          	lw	ra,12(sp)
    2d54:	01010113          	addi	sp,sp,16
    2d58:	00008067          	ret
            Set_Gain(0, 1, data);
    2d5c:	9741a603          	lw	a2,-1676(gp) # 5abc <data>
    2d60:	01061613          	slli	a2,a2,0x10
    2d64:	01065613          	srli	a2,a2,0x10
    2d68:	00100593          	li	a1,1
    2d6c:	00000513          	li	a0,0
    2d70:	ce0ff0ef          	jal	2250 <Set_Gain>
            break;
    2d74:	fddff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 2, data);
    2d78:	9741a603          	lw	a2,-1676(gp) # 5abc <data>
    2d7c:	01061613          	slli	a2,a2,0x10
    2d80:	01065613          	srli	a2,a2,0x10
    2d84:	00200593          	li	a1,2
    2d88:	00000513          	li	a0,0
    2d8c:	cc4ff0ef          	jal	2250 <Set_Gain>
            break;
    2d90:	fc1ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 3, data);
    2d94:	9741a603          	lw	a2,-1676(gp) # 5abc <data>
    2d98:	01061613          	slli	a2,a2,0x10
    2d9c:	01065613          	srli	a2,a2,0x10
    2da0:	00300593          	li	a1,3
    2da4:	00000513          	li	a0,0
    2da8:	ca8ff0ef          	jal	2250 <Set_Gain>
            break;
    2dac:	fa5ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 4, data);
    2db0:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2db4:	01071713          	slli	a4,a4,0x10
    2db8:	01075713          	srli	a4,a4,0x10
    2dbc:	f81007b7          	lui	a5,0xf8100
    2dc0:	02e7a023          	sw	a4,32(a5) # f8100020 <__freertos_irq_stack_top+0xf80f9510>
	bsp_uDelay(DELAY_BUSY);
    2dc4:	f8b00637          	lui	a2,0xf8b00
    2dc8:	05f5e5b7          	lui	a1,0x5f5e
    2dcc:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2dd0:	00500513          	li	a0,5
    2dd4:	94cff0ef          	jal	1f20 <clint_uDelay>
}
    2dd8:	f79ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 5, data);
    2ddc:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2de0:	01071713          	slli	a4,a4,0x10
    2de4:	01075713          	srli	a4,a4,0x10
    2de8:	f81007b7          	lui	a5,0xf8100
    2dec:	02e7a223          	sw	a4,36(a5) # f8100024 <__freertos_irq_stack_top+0xf80f9514>
	bsp_uDelay(DELAY_BUSY);
    2df0:	f8b00637          	lui	a2,0xf8b00
    2df4:	05f5e5b7          	lui	a1,0x5f5e
    2df8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2dfc:	00500513          	li	a0,5
    2e00:	920ff0ef          	jal	1f20 <clint_uDelay>
}
    2e04:	f4dff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 6, data);
    2e08:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2e0c:	01071713          	slli	a4,a4,0x10
    2e10:	01075713          	srli	a4,a4,0x10
    2e14:	f81007b7          	lui	a5,0xf8100
    2e18:	02e7a423          	sw	a4,40(a5) # f8100028 <__freertos_irq_stack_top+0xf80f9518>
	bsp_uDelay(DELAY_BUSY);
    2e1c:	f8b00637          	lui	a2,0xf8b00
    2e20:	05f5e5b7          	lui	a1,0x5f5e
    2e24:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2e28:	00500513          	li	a0,5
    2e2c:	8f4ff0ef          	jal	1f20 <clint_uDelay>
}
    2e30:	f21ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 7, data);
    2e34:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2e38:	01071713          	slli	a4,a4,0x10
    2e3c:	01075713          	srli	a4,a4,0x10
    2e40:	f81007b7          	lui	a5,0xf8100
    2e44:	02e7a623          	sw	a4,44(a5) # f810002c <__freertos_irq_stack_top+0xf80f951c>
	bsp_uDelay(DELAY_BUSY);
    2e48:	f8b00637          	lui	a2,0xf8b00
    2e4c:	05f5e5b7          	lui	a1,0x5f5e
    2e50:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2e54:	00500513          	li	a0,5
    2e58:	8c8ff0ef          	jal	1f20 <clint_uDelay>
}
    2e5c:	ef5ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 8, data);
    2e60:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2e64:	01071713          	slli	a4,a4,0x10
    2e68:	01075713          	srli	a4,a4,0x10
    2e6c:	f81007b7          	lui	a5,0xf8100
    2e70:	02e7a823          	sw	a4,48(a5) # f8100030 <__freertos_irq_stack_top+0xf80f9520>
	bsp_uDelay(DELAY_BUSY);
    2e74:	f8b00637          	lui	a2,0xf8b00
    2e78:	05f5e5b7          	lui	a1,0x5f5e
    2e7c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2e80:	00500513          	li	a0,5
    2e84:	89cff0ef          	jal	1f20 <clint_uDelay>
}
    2e88:	ec9ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 9, data);
    2e8c:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2e90:	01071713          	slli	a4,a4,0x10
    2e94:	01075713          	srli	a4,a4,0x10
    2e98:	f81007b7          	lui	a5,0xf8100
    2e9c:	02e7aa23          	sw	a4,52(a5) # f8100034 <__freertos_irq_stack_top+0xf80f9524>
	bsp_uDelay(DELAY_BUSY);
    2ea0:	f8b00637          	lui	a2,0xf8b00
    2ea4:	05f5e5b7          	lui	a1,0x5f5e
    2ea8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2eac:	00500513          	li	a0,5
    2eb0:	870ff0ef          	jal	1f20 <clint_uDelay>
}
    2eb4:	e9dff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 10, data);
    2eb8:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2ebc:	01071713          	slli	a4,a4,0x10
    2ec0:	01075713          	srli	a4,a4,0x10
    2ec4:	f81007b7          	lui	a5,0xf8100
    2ec8:	02e7ac23          	sw	a4,56(a5) # f8100038 <__freertos_irq_stack_top+0xf80f9528>
	bsp_uDelay(DELAY_BUSY);
    2ecc:	f8b00637          	lui	a2,0xf8b00
    2ed0:	05f5e5b7          	lui	a1,0x5f5e
    2ed4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2ed8:	00500513          	li	a0,5
    2edc:	844ff0ef          	jal	1f20 <clint_uDelay>
}
    2ee0:	e71ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 11, data);
    2ee4:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2ee8:	01071713          	slli	a4,a4,0x10
    2eec:	01075713          	srli	a4,a4,0x10
    2ef0:	f81007b7          	lui	a5,0xf8100
    2ef4:	02e7ae23          	sw	a4,60(a5) # f810003c <__freertos_irq_stack_top+0xf80f952c>
	bsp_uDelay(DELAY_BUSY);
    2ef8:	f8b00637          	lui	a2,0xf8b00
    2efc:	05f5e5b7          	lui	a1,0x5f5e
    2f00:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2f04:	00500513          	li	a0,5
    2f08:	818ff0ef          	jal	1f20 <clint_uDelay>
}
    2f0c:	e45ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 12, data);
    2f10:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
	u32 data = setting;
    2f14:	01071713          	slli	a4,a4,0x10
    2f18:	01075713          	srli	a4,a4,0x10
    2f1c:	f81007b7          	lui	a5,0xf8100
    2f20:	04e7a023          	sw	a4,64(a5) # f8100040 <__freertos_irq_stack_top+0xf80f9530>
	bsp_uDelay(DELAY_BUSY);
    2f24:	f8b00637          	lui	a2,0xf8b00
    2f28:	05f5e5b7          	lui	a1,0x5f5e
    2f2c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2f30:	00500513          	li	a0,5
    2f34:	fedfe0ef          	jal	1f20 <clint_uDelay>
}
    2f38:	e19ff06f          	j	2d50 <settings+0x194>
            Set_Gain(0, 13, data);
    2f3c:	9741a703          	lw	a4,-1676(gp) # 5abc <data>
		data &= 0x3;
    2f40:	00377713          	andi	a4,a4,3
    2f44:	f81007b7          	lui	a5,0xf8100
    2f48:	04e7a223          	sw	a4,68(a5) # f8100044 <__freertos_irq_stack_top+0xf80f9534>
	bsp_uDelay(DELAY_BUSY);
    2f4c:	f8b00637          	lui	a2,0xf8b00
    2f50:	05f5e5b7          	lui	a1,0x5f5e
    2f54:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f575f0>
    2f58:	00500513          	li	a0,5
    2f5c:	fc5fe0ef          	jal	1f20 <clint_uDelay>
}
    2f60:	df1ff06f          	j	2d50 <settings+0x194>
            Latency_Report();
    2f64:	81dff0ef          	jal	2780 <Latency_Report>
            break;
    2f68:	de9ff06f          	j	2d50 <settings+0x194>
            bsp_printf("Unknown command: %c (demo modes: D+a-g, gains: 0-9/A/B/C/E+value, L: latency report)\n\r", var);
    2f6c:	9781c583          	lbu	a1,-1672(gp) # 5ac0 <var>
    2f70:	00005537          	lui	a0,0x5
    2f74:	a4850513          	addi	a0,a0,-1464 # 4a48 <_data+0x538>
    2f78:	ce8ff0ef          	jal	2460 <bsp_printf>
}
    2f7c:	dd5ff06f          	j	2d50 <settings+0x194>
    2f80:	00008067          	ret

00002f84 <externalInterrupt>:
{
    2f84:	ff010113          	addi	sp,sp,-16
    2f88:	00112623          	sw	ra,12(sp)
    2f8c:	00812423          	sw	s0,8(sp)
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2f90:	01c0006f          	j	2fac <externalInterrupt+0x28>
            uart_buffer_read();
    2f94:	ae1ff0ef          	jal	2a74 <uart_buffer_read>
            settings();
    2f98:	c25ff0ef          	jal	2bbc <settings>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); // unmask the claimed interrupt
    2f9c:	00040613          	mv	a2,s0
    2fa0:	00000593          	li	a1,0
    2fa4:	f8c00537          	lui	a0,0xf8c00
    2fa8:	a8cff0ef          	jal	2234 <plic_release>
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2fac:	00000593          	li	a1,0
    2fb0:	f8c00537          	lui	a0,0xf8c00
    2fb4:	a64ff0ef          	jal	2218 <plic_claim>
    2fb8:	00050413          	mv	s0,a0
    2fbc:	02050e63          	beqz	a0,2ff8 <externalInterrupt+0x74>
        switch (claim)
    2fc0:	00100793          	li	a5,1
    2fc4:	fcf408e3          	beq	s0,a5,2f94 <externalInterrupt+0x10>
    2fc8:	00600793          	li	a5,6
    2fcc:	02f41263          	bne	s0,a5,2ff0 <externalInterrupt+0x6c>
            if (display_mm2s_active && !(dmasg_busy(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL)))
    2fd0:	8301a783          	lw	a5,-2000(gp) # 5978 <display_mm2s_active>
    2fd4:	fc0784e3          	beqz	a5,2f9c <externalInterrupt+0x18>
    2fd8:	00200593          	li	a1,2
    2fdc:	f8110537          	lui	a0,0xf8110
    2fe0:	c54ff0ef          	jal	2434 <dmasg_busy>
    2fe4:	fa051ce3          	bnez	a0,2f9c <externalInterrupt+0x18>
                trigger_next_display_dma();
    2fe8:	9d9ff0ef          	jal	29c0 <trigger_next_display_dma>
    2fec:	fb1ff06f          	j	2f9c <externalInterrupt+0x18>
            crash();
    2ff0:	c11fe0ef          	jal	1c00 <crash>
            break;
    2ff4:	fa9ff06f          	j	2f9c <externalInterrupt+0x18>
}
    2ff8:	00c12083          	lw	ra,12(sp)
    2ffc:	00812403          	lw	s0,8(sp)
    3000:	01010113          	addi	sp,sp,16
    3004:	00008067          	ret

00003008 <ispExample_menu>:
{
    3008:	ff010113          	addi	sp,sp,-16
    300c:	00112623          	sw	ra,12(sp)
    3010:	00812423          	sw	s0,8(sp)
    bsp_printf("================================================================================ \n\r");
    3014:	00005437          	lui	s0,0x5
    3018:	aa040513          	addi	a0,s0,-1376 # 4aa0 <_data+0x590>
    301c:	c44ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("                    ISP Example Design Scenario Selection\n\r");
    3020:	00005537          	lui	a0,0x5
    3024:	af450513          	addi	a0,a0,-1292 # 4af4 <_data+0x5e4>
    3028:	c38ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("================================================================================ \n\r");
    302c:	aa040513          	addi	a0,s0,-1376
    3030:	c30ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Da' : Camera Capture + HDMI Display                                             \n\r");
    3034:	00005537          	lui	a0,0x5
    3038:	b3050513          	addi	a0,a0,-1232 # 4b30 <_data+0x620>
    303c:	c24ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Db' : Camera Capture + RGB2Grayscale (SW) + HDMI Display                        \n\r");
    3040:	00005537          	lui	a0,0x5
    3044:	b8450513          	addi	a0,a0,-1148 # 4b84 <_data+0x674>
    3048:	c18ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Dc' : Camera Capture + RGB2Grayscale (SW) + Sobel (HW) + HDMI Display           \n\r");
    304c:	00005537          	lui	a0,0x5
    3050:	bd850513          	addi	a0,a0,-1064 # 4bd8 <_data+0x6c8>
    3054:	c0cff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Dd' : Camera Capture + RGB2Grayscale (HW) + HDMI Display                        \n\r");
    3058:	00005537          	lui	a0,0x5
    305c:	c2c50513          	addi	a0,a0,-980 # 4c2c <_data+0x71c>
    3060:	c00ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'De' : Camera Capture + RGB2Grayscale & Sobel (HW) + HDMI Display                \n\r");
    3064:	00005537          	lui	a0,0x5
    3068:	c8050513          	addi	a0,a0,-896 # 4c80 <_data+0x770>
    306c:	bf4ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Df' : Camera Capture + RGB2Grayscale & Sobel & Dilation (HW) + HDMI Display     \n\r");
    3070:	00005537          	lui	a0,0x5
    3074:	cd450513          	addi	a0,a0,-812 # 4cd4 <_data+0x7c4>
    3078:	be8ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Dg' : Camera Capture + RGB2Grayscale & Sobel & Erosion  (HW) + HDMI Display     \n\r");
    307c:	00005537          	lui	a0,0x5
    3080:	d2850513          	addi	a0,a0,-728 # 4d28 <_data+0x818>
    3084:	bdcff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'L'  : Print ISP latency report (min/max per pipeline stage)                        \n\r");
    3088:	00005537          	lui	a0,0x5
    308c:	d7c50513          	addi	a0,a0,-644 # 4d7c <_data+0x86c>
    3090:	bd0ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("================================================================================ \n\n\r");
    3094:	00005537          	lui	a0,0x5
    3098:	dd450513          	addi	a0,a0,-556 # 4dd4 <_data+0x8c4>
    309c:	bc4ff0ef          	jal	2460 <bsp_printf>
}
    30a0:	00c12083          	lw	ra,12(sp)
    30a4:	00812403          	lw	s0,8(sp)
    30a8:	01010113          	addi	sp,sp,16
    30ac:	00008067          	ret

000030b0 <i2c_masterBusy>:
        return *((volatile u32*) address);
    30b0:	04052503          	lw	a0,64(a0)
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
    30b4:	00157513          	andi	a0,a0,1
    30b8:	00008067          	ret

000030bc <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    30bc:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    30c0:	21000793          	li	a5,528
    30c4:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    30c8:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    30cc:	0107f793          	andi	a5,a5,16
    30d0:	fe079ce3          	bnez	a5,30c8 <i2c_masterStartBlocking+0xc>
    }
    30d4:	00008067          	ret

000030d8 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
    30d8:	ff010113          	addi	sp,sp,-16
    30dc:	00112623          	sw	ra,12(sp)
    30e0:	00812423          	sw	s0,8(sp)
    30e4:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    30e8:	00040513          	mv	a0,s0
    30ec:	fc5ff0ef          	jal	30b0 <i2c_masterBusy>
    30f0:	fe051ce3          	bnez	a0,30e8 <i2c_masterStopWait+0x10>
    }
    30f4:	00c12083          	lw	ra,12(sp)
    30f8:	00812403          	lw	s0,8(sp)
    30fc:	01010113          	addi	sp,sp,16
    3100:	00008067          	ret

00003104 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
    3104:	ff010113          	addi	sp,sp,-16
    3108:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    310c:	42000713          	li	a4,1056
    3110:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
    3114:	fc5ff0ef          	jal	30d8 <i2c_masterStopWait>
    }
    3118:	00c12083          	lw	ra,12(sp)
    311c:	01010113          	addi	sp,sp,16
    3120:	00008067          	ret

00003124 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3124:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3128:	1007f793          	andi	a5,a5,256
    312c:	fe079ce3          	bnez	a5,3124 <i2c_txAckWait>
    }
    3130:	00008067          	ret

00003134 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
    3134:	ff010113          	addi	sp,sp,-16
    3138:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    313c:	30100713          	li	a4,769
    3140:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
    3144:	fe1ff0ef          	jal	3124 <i2c_txAckWait>
    }
    3148:	00c12083          	lw	ra,12(sp)
    314c:	01010113          	addi	sp,sp,16
    3150:	00008067          	ret

00003154 <i2c_rxAck>:
        return *((volatile u32*) address);
    3154:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3158:	0ff57513          	zext.b	a0,a0
    }
    315c:	00153513          	seqz	a0,a0
    3160:	00008067          	ret

00003164 <PiCam_WriteRegData>:
#include "riscv.h"
#include "PiCamDriver.h"
#include "common.h"

void PiCam_WriteRegData(u32 i2c_base, u16 reg, u8 data)
{
    3164:	fe010113          	addi	sp,sp,-32
    3168:	00112e23          	sw	ra,28(sp)
    316c:	00812c23          	sw	s0,24(sp)
    3170:	00912a23          	sw	s1,20(sp)
    3174:	01212823          	sw	s2,16(sp)
    3178:	01312623          	sw	s3,12(sp)
    317c:	00050413          	mv	s0,a0
    3180:	00058493          	mv	s1,a1
    3184:	00060913          	mv	s2,a2
   u8 outdata;

   i2c_masterStartBlocking(i2c_base);
    3188:	f35ff0ef          	jal	30bc <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    318c:	000017b7          	lui	a5,0x1
    3190:	b2078793          	addi	a5,a5,-1248 # b20 <CUSTOM2+0xac5>
    3194:	00f42023          	sw	a5,0(s0)

   i2c_txByte(i2c_base, 0x10 << 1);
   i2c_txNackBlocking(i2c_base);
    3198:	00040513          	mv	a0,s0
    319c:	f99ff0ef          	jal	3134 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    31a0:	00040513          	mv	a0,s0
    31a4:	fb1ff0ef          	jal	3154 <i2c_rxAck>
    31a8:	c11fe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg >> 8) & 0xFF);
    31ac:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    31b0:	000019b7          	lui	s3,0x1
    31b4:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    31b8:	0137e7b3          	or	a5,a5,s3
    31bc:	00f42023          	sw	a5,0(s0)
   i2c_txNackBlocking(i2c_base);
    31c0:	00040513          	mv	a0,s0
    31c4:	f71ff0ef          	jal	3134 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    31c8:	00040513          	mv	a0,s0
    31cc:	f89ff0ef          	jal	3154 <i2c_rxAck>
    31d0:	be9fe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg) & 0xFF);
    31d4:	0ff4f493          	zext.b	s1,s1
    31d8:	0134e4b3          	or	s1,s1,s3
    31dc:	00942023          	sw	s1,0(s0)
   i2c_txNackBlocking(i2c_base);
    31e0:	00040513          	mv	a0,s0
    31e4:	f51ff0ef          	jal	3134 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    31e8:	00040513          	mv	a0,s0
    31ec:	f69ff0ef          	jal	3154 <i2c_rxAck>
    31f0:	bc9fe0ef          	jal	1db8 <assert>
    31f4:	01396933          	or	s2,s2,s3
    31f8:	01242023          	sw	s2,0(s0)

   i2c_txByte(i2c_base, data & 0xFF);
   i2c_txNackBlocking(i2c_base);
    31fc:	00040513          	mv	a0,s0
    3200:	f35ff0ef          	jal	3134 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3204:	00040513          	mv	a0,s0
    3208:	f4dff0ef          	jal	3154 <i2c_rxAck>
    320c:	badfe0ef          	jal	1db8 <assert>

   i2c_masterStopBlocking(i2c_base);
    3210:	00040513          	mv	a0,s0
    3214:	ef1ff0ef          	jal	3104 <i2c_masterStopBlocking>
}
    3218:	01c12083          	lw	ra,28(sp)
    321c:	01812403          	lw	s0,24(sp)
    3220:	01412483          	lw	s1,20(sp)
    3224:	01012903          	lw	s2,16(sp)
    3228:	00c12983          	lw	s3,12(sp)
    322c:	02010113          	addi	sp,sp,32
    3230:	00008067          	ret

00003234 <AccessCommSeq>:
   i2c_masterStopBlocking(i2c_base);

   return outdata;
}
void AccessCommSeq(u32 i2c_base)
{
    3234:	ff010113          	addi	sp,sp,-16
    3238:	00112623          	sw	ra,12(sp)
    323c:	00812423          	sw	s0,8(sp)
    3240:	00050413          	mv	s0,a0
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    3244:	00500613          	li	a2,5
    3248:	000035b7          	lui	a1,0x3
    324c:	0eb58593          	addi	a1,a1,235 # 30eb <i2c_masterStopWait+0x13>
    3250:	f15ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x0C);
    3254:	00c00613          	li	a2,12
    3258:	000035b7          	lui	a1,0x3
    325c:	0eb58593          	addi	a1,a1,235 # 30eb <i2c_masterStopWait+0x13>
    3260:	00040513          	mv	a0,s0
    3264:	f01ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300A, 0xFF);
    3268:	0ff00613          	li	a2,255
    326c:	000035b7          	lui	a1,0x3
    3270:	00a58593          	addi	a1,a1,10 # 300a <ispExample_menu+0x2>
    3274:	00040513          	mv	a0,s0
    3278:	eedff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300B, 0xFF);
    327c:	0ff00613          	li	a2,255
    3280:	000035b7          	lui	a1,0x3
    3284:	00b58593          	addi	a1,a1,11 # 300b <ispExample_menu+0x3>
    3288:	00040513          	mv	a0,s0
    328c:	ed9ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    3290:	00500613          	li	a2,5
    3294:	000035b7          	lui	a1,0x3
    3298:	0eb58593          	addi	a1,a1,235 # 30eb <i2c_masterStopWait+0x13>
    329c:	00040513          	mv	a0,s0
    32a0:	ec5ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x09);
    32a4:	00900613          	li	a2,9
    32a8:	000035b7          	lui	a1,0x3
    32ac:	0eb58593          	addi	a1,a1,235 # 30eb <i2c_masterStopWait+0x13>
    32b0:	00040513          	mv	a0,s0
    32b4:	eb1ff0ef          	jal	3164 <PiCam_WriteRegData>
}
    32b8:	00c12083          	lw	ra,12(sp)
    32bc:	00812403          	lw	s0,8(sp)
    32c0:	01010113          	addi	sp,sp,16
    32c4:	00008067          	ret

000032c8 <PiCam_Output_Size>:

void PiCam_Output_Size(u32 i2c_base, u16 X, u16 Y)
{
    32c8:	ff010113          	addi	sp,sp,-16
    32cc:	00112623          	sw	ra,12(sp)
    32d0:	00812423          	sw	s0,8(sp)
    32d4:	00912223          	sw	s1,4(sp)
    32d8:	01212023          	sw	s2,0(sp)
    32dc:	00050413          	mv	s0,a0
    32e0:	00058913          	mv	s2,a1
    32e4:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, x_output_size_A_1, X >> 8);
    32e8:	0085d613          	srli	a2,a1,0x8
    32ec:	16c00593          	li	a1,364
    32f0:	e75ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, x_output_size_A_0, X & 0xFF);
    32f4:	0ff97613          	zext.b	a2,s2
    32f8:	16d00593          	li	a1,365
    32fc:	00040513          	mv	a0,s0
    3300:	e65ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_1, Y >> 8);
    3304:	0084d613          	srli	a2,s1,0x8
    3308:	16e00593          	li	a1,366
    330c:	00040513          	mv	a0,s0
    3310:	e55ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_0, Y & 0xFF);
    3314:	0ff4f613          	zext.b	a2,s1
    3318:	16f00593          	li	a1,367
    331c:	00040513          	mv	a0,s0
    3320:	e45ff0ef          	jal	3164 <PiCam_WriteRegData>
}
    3324:	00c12083          	lw	ra,12(sp)
    3328:	00812403          	lw	s0,8(sp)
    332c:	00412483          	lw	s1,4(sp)
    3330:	00012903          	lw	s2,0(sp)
    3334:	01010113          	addi	sp,sp,16
    3338:	00008067          	ret

0000333c <PiCam_Output_activePixel>:

void PiCam_Output_activePixel(u32 i2c_base, u16 XStart, u16 XEnd, u16 YStart, u16 YEnd)
{
    333c:	fe010113          	addi	sp,sp,-32
    3340:	00112e23          	sw	ra,28(sp)
    3344:	00812c23          	sw	s0,24(sp)
    3348:	00912a23          	sw	s1,20(sp)
    334c:	01212823          	sw	s2,16(sp)
    3350:	01312623          	sw	s3,12(sp)
    3354:	01412423          	sw	s4,8(sp)
    3358:	00050413          	mv	s0,a0
    335c:	00058a13          	mv	s4,a1
    3360:	00060993          	mv	s3,a2
    3364:	00068913          	mv	s2,a3
    3368:	00070493          	mv	s1,a4
   // Max Active pixel 3280* 2464--imx219
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_1, XStart >> 8);
    336c:	0085d613          	srli	a2,a1,0x8
    3370:	16400593          	li	a1,356
    3374:	df1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_0, XStart & 0xFF);
    3378:	0ffa7613          	zext.b	a2,s4
    337c:	16500593          	li	a1,357
    3380:	00040513          	mv	a0,s0
    3384:	de1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_1, XEnd >> 8);
    3388:	0089d613          	srli	a2,s3,0x8
    338c:	16600593          	li	a1,358
    3390:	00040513          	mv	a0,s0
    3394:	dd1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_0, XEnd & 0xFF);
    3398:	0ff9f613          	zext.b	a2,s3
    339c:	16700593          	li	a1,359
    33a0:	00040513          	mv	a0,s0
    33a4:	dc1ff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_1, YStart >> 8);
    33a8:	00895613          	srli	a2,s2,0x8
    33ac:	16800593          	li	a1,360
    33b0:	00040513          	mv	a0,s0
    33b4:	db1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_0, YStart & 0xFF);
    33b8:	0ff97613          	zext.b	a2,s2
    33bc:	16900593          	li	a1,361
    33c0:	00040513          	mv	a0,s0
    33c4:	da1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
    33c8:	0084d613          	srli	a2,s1,0x8
    33cc:	16a00593          	li	a1,362
    33d0:	00040513          	mv	a0,s0
    33d4:	d91ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
    33d8:	0ff4f613          	zext.b	a2,s1
    33dc:	16b00593          	li	a1,363
    33e0:	00040513          	mv	a0,s0
    33e4:	d81ff0ef          	jal	3164 <PiCam_WriteRegData>
}
    33e8:	01c12083          	lw	ra,28(sp)
    33ec:	01812403          	lw	s0,24(sp)
    33f0:	01412483          	lw	s1,20(sp)
    33f4:	01012903          	lw	s2,16(sp)
    33f8:	00c12983          	lw	s3,12(sp)
    33fc:	00812a03          	lw	s4,8(sp)
    3400:	02010113          	addi	sp,sp,32
    3404:	00008067          	ret

00003408 <PiCam_SetBinningMode>:
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
}

void PiCam_SetBinningMode(u32 i2c_base, u8 Xmode, u8 Ymode)
{
    3408:	ff010113          	addi	sp,sp,-16
    340c:	00112623          	sw	ra,12(sp)
    3410:	00812423          	sw	s0,8(sp)
    3414:	00912223          	sw	s1,4(sp)
    3418:	00050493          	mv	s1,a0
    341c:	00060413          	mv	s0,a2
   // 0:no-binning
   // 1:x2-binning
   // 2:x4-binning
   // 3:x2 analog (special)

   if (Xmode >= 3)
    3420:	00200793          	li	a5,2
    3424:	00b7f463          	bgeu	a5,a1,342c <PiCam_SetBinningMode+0x24>
      Xmode = 3;
    3428:	00300593          	li	a1,3
   if (Ymode >= 3)
    342c:	00200793          	li	a5,2
    3430:	0087f463          	bgeu	a5,s0,3438 <PiCam_SetBinningMode+0x30>
      Ymode = 3;
    3434:	00300413          	li	s0,3

   PiCam_WriteRegData(i2c_base, BINNING_MODE_H_A, Xmode);
    3438:	00058613          	mv	a2,a1
    343c:	17400593          	li	a1,372
    3440:	00048513          	mv	a0,s1
    3444:	d21ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, BINNING_MODE_V_A, Ymode);
    3448:	00040613          	mv	a2,s0
    344c:	17500593          	li	a1,373
    3450:	00048513          	mv	a0,s1
    3454:	d11ff0ef          	jal	3164 <PiCam_WriteRegData>
}
    3458:	00c12083          	lw	ra,12(sp)
    345c:	00812403          	lw	s0,8(sp)
    3460:	00412483          	lw	s1,4(sp)
    3464:	01010113          	addi	sp,sp,16
    3468:	00008067          	ret

0000346c <PiCam_Gainfilter>:

   PiCam_Output_ColorBarSize(i2c_base, X, Y);
}

void PiCam_Gainfilter(u32 i2c_base, u8 AGain, u16 DGain)
{
    346c:	ff010113          	addi	sp,sp,-16
    3470:	00112623          	sw	ra,12(sp)
    3474:	00812423          	sw	s0,8(sp)
    3478:	00912223          	sw	s1,4(sp)
    347c:	00050413          	mv	s0,a0
    3480:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, ANA_GAIN_GLOBAL_A, AGain & 0xFF);
    3484:	00058613          	mv	a2,a1
    3488:	15700593          	li	a1,343
    348c:	cd9ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_1, (DGain >> 8) & 0x0F);
    3490:	0084d613          	srli	a2,s1,0x8
    3494:	00f67613          	andi	a2,a2,15
    3498:	15800593          	li	a1,344
    349c:	00040513          	mv	a0,s0
    34a0:	cc5ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_0, DGain & 0xFF);
    34a4:	0ff4f613          	zext.b	a2,s1
    34a8:	15900593          	li	a1,345
    34ac:	00040513          	mv	a0,s0
    34b0:	cb5ff0ef          	jal	3164 <PiCam_WriteRegData>
}
    34b4:	00c12083          	lw	ra,12(sp)
    34b8:	00812403          	lw	s0,8(sp)
    34bc:	00412483          	lw	s1,4(sp)
    34c0:	01010113          	addi	sp,sp,16
    34c4:	00008067          	ret

000034c8 <PiCam_init>:

// For cam1
void PiCam_init(u32 i2c_base)
{
    34c8:	ff010113          	addi	sp,sp,-16
    34cc:	00112623          	sw	ra,12(sp)
    34d0:	00812423          	sw	s0,8(sp)
    34d4:	00050413          	mv	s0,a0

   PiCam_WriteRegData(i2c_base, mode_select, 0x00);
    34d8:	00000613          	li	a2,0
    34dc:	10000593          	li	a1,256
    34e0:	c85ff0ef          	jal	3164 <PiCam_WriteRegData>
   AccessCommSeq(i2c_base);
    34e4:	00040513          	mv	a0,s0
    34e8:	d4dff0ef          	jal	3234 <AccessCommSeq>
   PiCam_WriteRegData(i2c_base, CSI_LANE_MODE, 0x01);
    34ec:	00100613          	li	a2,1
    34f0:	11400593          	li	a1,276
    34f4:	00040513          	mv	a0,s0
    34f8:	c6dff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DPHY_CTRL, 0x00);
    34fc:	00000613          	li	a2,0
    3500:	12800593          	li	a1,296
    3504:	00040513          	mv	a0,s0
    3508:	c5dff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_1, 0x18);
    350c:	01800613          	li	a2,24
    3510:	12a00593          	li	a1,298
    3514:	00040513          	mv	a0,s0
    3518:	c4dff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_0, 0x00);
    351c:	00000613          	li	a2,0
    3520:	12b00593          	li	a1,299
    3524:	00040513          	mv	a0,s0
    3528:	c3dff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x04);
    352c:	00400613          	li	a2,4
    3530:	16000593          	li	a1,352
    3534:	00040513          	mv	a0,s0
    3538:	c2dff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0x59);
    353c:	05900613          	li	a2,89
    3540:	16100593          	li	a1,353
    3544:	00040513          	mv	a0,s0
    3548:	c1dff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    354c:	00d00613          	li	a2,13
    3550:	16200593          	li	a1,354
    3554:	00040513          	mv	a0,s0
    3558:	c0dff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    355c:	07800613          	li	a2,120
    3560:	16300593          	li	a1,355
    3564:	00040513          	mv	a0,s0
    3568:	bfdff0ef          	jal	3164 <PiCam_WriteRegData>

   //   PiCam_Output_activePixel(i2c_base, 0, 3279, 0, 2463);
   PiCam_Output_activePixel(i2c_base, 680, 2599, 692, 1771); // Capture centre of sensor
    356c:	6eb00713          	li	a4,1771
    3570:	2b400693          	li	a3,692
    3574:	00001637          	lui	a2,0x1
    3578:	a2760613          	addi	a2,a2,-1497 # a27 <CUSTOM2+0x9cc>
    357c:	2a800593          	li	a1,680
    3580:	00040513          	mv	a0,s0
    3584:	db9ff0ef          	jal	333c <PiCam_Output_activePixel>

   PiCam_Output_Size(i2c_base, 1920, 1080);
    3588:	43800613          	li	a2,1080
    358c:	78000593          	li	a1,1920
    3590:	00040513          	mv	a0,s0
    3594:	d35ff0ef          	jal	32c8 <PiCam_Output_Size>
   // PiCam_Output_Size(i2c_base, 1280, 720);
   // PiCam_Output_Size(i2c_base, 640, 480);

   PiCam_WriteRegData(i2c_base, X_ODD_INC_A, 0x01);
    3598:	00100613          	li	a2,1
    359c:	17000593          	li	a1,368
    35a0:	00040513          	mv	a0,s0
    35a4:	bc1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ODD_INC_A, 0x01);
    35a8:	00100613          	li	a2,1
    35ac:	17100593          	li	a1,369
    35b0:	00040513          	mv	a0,s0
    35b4:	bb1ff0ef          	jal	3164 <PiCam_WriteRegData>

   // 0: No binning; 1: x2 binning; 2: x4 binning; 3: x2 binning (analog special)
   PiCam_SetBinningMode(i2c_base, 0, 0);
    35b8:	00000613          	li	a2,0
    35bc:	00000593          	li	a1,0
    35c0:	00040513          	mv	a0,s0
    35c4:	e45ff0ef          	jal	3408 <PiCam_SetBinningMode>

   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_1, 0x0A);
    35c8:	00a00613          	li	a2,10
    35cc:	18c00593          	li	a1,396
    35d0:	00040513          	mv	a0,s0
    35d4:	b91ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_0, 0x0A);
    35d8:	00a00613          	li	a2,10
    35dc:	18d00593          	li	a1,397
    35e0:	00040513          	mv	a0,s0
    35e4:	b81ff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, VTPXCK_DIV, 0x05);
    35e8:	00500613          	li	a2,5
    35ec:	30100593          	li	a1,769
    35f0:	00040513          	mv	a0,s0
    35f4:	b71ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, VTSYCK_DIV, 0x01);
    35f8:	00100613          	li	a2,1
    35fc:	30300593          	li	a1,771
    3600:	00040513          	mv	a0,s0
    3604:	b61ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_VT_DIV, 0x03);
    3608:	00300613          	li	a2,3
    360c:	30400593          	li	a1,772
    3610:	00040513          	mv	a0,s0
    3614:	b51ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_OP_DIV, 0x03);
    3618:	00300613          	li	a2,3
    361c:	30500593          	li	a1,773
    3620:	00040513          	mv	a0,s0
    3624:	b41ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_1, 0x00);
    3628:	00000613          	li	a2,0
    362c:	30600593          	li	a1,774
    3630:	00040513          	mv	a0,s0
    3634:	b31ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_0, 0x39);
    3638:	03900613          	li	a2,57
    363c:	30700593          	li	a1,775
    3640:	00040513          	mv	a0,s0
    3644:	b21ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    3648:	00a00613          	li	a2,10
    364c:	30900593          	li	a1,777
    3650:	00040513          	mv	a0,s0
    3654:	b11ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    3658:	00100613          	li	a2,1
    365c:	30b00593          	li	a1,779
    3660:	00040513          	mv	a0,s0
    3664:	b01ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    3668:	00000613          	li	a2,0
    366c:	30c00593          	li	a1,780
    3670:	00040513          	mv	a0,s0
    3674:	af1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    3678:	07200613          	li	a2,114
    367c:	30d00593          	li	a1,781
    3680:	00040513          	mv	a0,s0
    3684:	ae1ff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    3688:	00a00613          	li	a2,10
    368c:	30900593          	li	a1,777
    3690:	00040513          	mv	a0,s0
    3694:	ad1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    3698:	00100613          	li	a2,1
    369c:	30b00593          	li	a1,779
    36a0:	00040513          	mv	a0,s0
    36a4:	ac1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    36a8:	00000613          	li	a2,0
    36ac:	30c00593          	li	a1,780
    36b0:	00040513          	mv	a0,s0
    36b4:	ab1ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    36b8:	07200613          	li	a2,114
    36bc:	30d00593          	li	a1,781
    36c0:	00040513          	mv	a0,s0
    36c4:	aa1ff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, mode_select, 0x01);
    36c8:	00100613          	li	a2,1
    36cc:	10000593          	li	a1,256
    36d0:	00040513          	mv	a0,s0
    36d4:	a91ff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_Gainfilter(i2c_base, 0xB9, 0x200);
    36d8:	20000613          	li	a2,512
    36dc:	0b900593          	li	a1,185
    36e0:	00040513          	mv	a0,s0
    36e4:	d89ff0ef          	jal	346c <PiCam_Gainfilter>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    36e8:	00d00613          	li	a2,13
    36ec:	16200593          	li	a1,354
    36f0:	00040513          	mv	a0,s0
    36f4:	a71ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    36f8:	07800613          	li	a2,120
    36fc:	16300593          	li	a1,355
    3700:	00040513          	mv	a0,s0
    3704:	a61ff0ef          	jal	3164 <PiCam_WriteRegData>
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
   */

   // Longer camera exposure time, suitable for low light condition. Trade-off with lower frame rate.
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x06);
    3708:	00600613          	li	a2,6
    370c:	16000593          	li	a1,352
    3710:	00040513          	mv	a0,s0
    3714:	a51ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0xE3);
    3718:	0e300613          	li	a2,227
    371c:	16100593          	li	a1,353
    3720:	00040513          	mv	a0,s0
    3724:	a41ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
    3728:	00400613          	li	a2,4
    372c:	15a00593          	li	a1,346
    3730:	00040513          	mv	a0,s0
    3734:	a31ff0ef          	jal	3164 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
    3738:	05400613          	li	a2,84
    373c:	15b00593          	li	a1,347
    3740:	00040513          	mv	a0,s0
    3744:	a21ff0ef          	jal	3164 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, IMG_ORIENTATION_A, 0x00);
    3748:	00000613          	li	a2,0
    374c:	17200593          	li	a1,370
    3750:	00040513          	mv	a0,s0
    3754:	a11ff0ef          	jal	3164 <PiCam_WriteRegData>
}
    3758:	00c12083          	lw	ra,12(sp)
    375c:	00812403          	lw	s0,8(sp)
    3760:	01010113          	addi	sp,sp,16
    3764:	00008067          	ret

00003768 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3768:	04050713          	addi	a4,a0,64
    376c:	21000793          	li	a5,528
    3770:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3774:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3778:	0107f793          	andi	a5,a5,16
    377c:	fe079ce3          	bnez	a5,3774 <i2c_masterStartBlocking+0xc>
    }
    3780:	00008067          	ret

00003784 <i2c_txAckWait>:
    3784:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3788:	1007f793          	andi	a5,a5,256
    378c:	fe079ce3          	bnez	a5,3784 <i2c_txAckWait>
    }
    3790:	00008067          	ret

00003794 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3794:	ff010113          	addi	sp,sp,-16
    3798:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    379c:	30100713          	li	a4,769
    37a0:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    37a4:	fe1ff0ef          	jal	3784 <i2c_txAckWait>
    }
    37a8:	00c12083          	lw	ra,12(sp)
    37ac:	01010113          	addi	sp,sp,16
    37b0:	00008067          	ret

000037b4 <i2c_rxAck>:
        return *((volatile u32*) address);
    37b4:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    37b8:	0ff57513          	zext.b	a0,a0
    }
    37bc:	00153513          	seqz	a0,a0
    37c0:	00008067          	ret

000037c4 <uart_writeAvailability>:
    37c4:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    37c8:	01055513          	srli	a0,a0,0x10
    }
    37cc:	0ff57513          	zext.b	a0,a0
    37d0:	00008067          	ret

000037d4 <uart_write>:
    static void uart_write(u32 reg, char data){
    37d4:	ff010113          	addi	sp,sp,-16
    37d8:	00112623          	sw	ra,12(sp)
    37dc:	00812423          	sw	s0,8(sp)
    37e0:	00912223          	sw	s1,4(sp)
    37e4:	00050413          	mv	s0,a0
    37e8:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    37ec:	00040513          	mv	a0,s0
    37f0:	fd5ff0ef          	jal	37c4 <uart_writeAvailability>
    37f4:	fe050ce3          	beqz	a0,37ec <uart_write+0x18>
        *((volatile u32*) address) = data;
    37f8:	00942023          	sw	s1,0(s0)
    }
    37fc:	00c12083          	lw	ra,12(sp)
    3800:	00812403          	lw	s0,8(sp)
    3804:	00412483          	lw	s1,4(sp)
    3808:	01010113          	addi	sp,sp,16
    380c:	00008067          	ret

00003810 <_putchar>:
    static void _putchar(char character){
    3810:	ff010113          	addi	sp,sp,-16
    3814:	00112623          	sw	ra,12(sp)
    3818:	00050593          	mv	a1,a0
            bsp_putChar(character);
    381c:	f8010537          	lui	a0,0xf8010
    3820:	fb5ff0ef          	jal	37d4 <uart_write>
    }
    3824:	00c12083          	lw	ra,12(sp)
    3828:	01010113          	addi	sp,sp,16
    382c:	00008067          	ret

00003830 <_putchar_s>:
    {
    3830:	ff010113          	addi	sp,sp,-16
    3834:	00112623          	sw	ra,12(sp)
    3838:	00812423          	sw	s0,8(sp)
    383c:	00050413          	mv	s0,a0
        while (*p)
    3840:	00c0006f          	j	384c <_putchar_s+0x1c>
            _putchar(*(p++));
    3844:	00140413          	addi	s0,s0,1
    3848:	fc9ff0ef          	jal	3810 <_putchar>
        while (*p)
    384c:	00044503          	lbu	a0,0(s0)
    3850:	fe051ae3          	bnez	a0,3844 <_putchar_s+0x14>
    }
    3854:	00c12083          	lw	ra,12(sp)
    3858:	00812403          	lw	s0,8(sp)
    385c:	01010113          	addi	sp,sp,16
    3860:	00008067          	ret

00003864 <bsp_printHex>:
    {
    3864:	ff010113          	addi	sp,sp,-16
    3868:	00112623          	sw	ra,12(sp)
    386c:	00812423          	sw	s0,8(sp)
    3870:	00912223          	sw	s1,4(sp)
    3874:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3878:	01c00413          	li	s0,28
    387c:	0240006f          	j	38a0 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    3880:	0084d733          	srl	a4,s1,s0
    3884:	00f77713          	andi	a4,a4,15
    3888:	000047b7          	lui	a5,0x4
    388c:	51078793          	addi	a5,a5,1296 # 4510 <_data>
    3890:	00e787b3          	add	a5,a5,a4
    3894:	0007c503          	lbu	a0,0(a5)
    3898:	f79ff0ef          	jal	3810 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    389c:	ffc40413          	addi	s0,s0,-4
    38a0:	fe0450e3          	bgez	s0,3880 <bsp_printHex+0x1c>
    }
    38a4:	00c12083          	lw	ra,12(sp)
    38a8:	00812403          	lw	s0,8(sp)
    38ac:	00412483          	lw	s1,4(sp)
    38b0:	01010113          	addi	sp,sp,16
    38b4:	00008067          	ret

000038b8 <bsp_printHex_lower>:
    {
    38b8:	ff010113          	addi	sp,sp,-16
    38bc:	00112623          	sw	ra,12(sp)
    38c0:	00812423          	sw	s0,8(sp)
    38c4:	00912223          	sw	s1,4(sp)
    38c8:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    38cc:	01c00413          	li	s0,28
    38d0:	0240006f          	j	38f4 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    38d4:	0084d733          	srl	a4,s1,s0
    38d8:	00f77713          	andi	a4,a4,15
    38dc:	000047b7          	lui	a5,0x4
    38e0:	52478793          	addi	a5,a5,1316 # 4524 <_data+0x14>
    38e4:	00e787b3          	add	a5,a5,a4
    38e8:	0007c503          	lbu	a0,0(a5)
    38ec:	f25ff0ef          	jal	3810 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    38f0:	ffc40413          	addi	s0,s0,-4
    38f4:	fe0450e3          	bgez	s0,38d4 <bsp_printHex_lower+0x1c>
    }
    38f8:	00c12083          	lw	ra,12(sp)
    38fc:	00812403          	lw	s0,8(sp)
    3900:	00412483          	lw	s1,4(sp)
    3904:	01010113          	addi	sp,sp,16
    3908:	00008067          	ret

0000390c <bsp_printf_c>:
    {
    390c:	ff010113          	addi	sp,sp,-16
    3910:	00112623          	sw	ra,12(sp)
        _putchar(c);
    3914:	0ff57513          	zext.b	a0,a0
    3918:	ef9ff0ef          	jal	3810 <_putchar>
    }
    391c:	00c12083          	lw	ra,12(sp)
    3920:	01010113          	addi	sp,sp,16
    3924:	00008067          	ret

00003928 <bsp_printf_s>:
    {
    3928:	ff010113          	addi	sp,sp,-16
    392c:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    3930:	f01ff0ef          	jal	3830 <_putchar_s>
    }
    3934:	00c12083          	lw	ra,12(sp)
    3938:	01010113          	addi	sp,sp,16
    393c:	00008067          	ret

00003940 <bsp_printf_d>:
    {
    3940:	fd010113          	addi	sp,sp,-48
    3944:	02112623          	sw	ra,44(sp)
    3948:	02812423          	sw	s0,40(sp)
    394c:	02912223          	sw	s1,36(sp)
    3950:	00050493          	mv	s1,a0
        if (val < 0) {
    3954:	00054663          	bltz	a0,3960 <bsp_printf_d+0x20>
    {
    3958:	00010413          	mv	s0,sp
    395c:	02c0006f          	j	3988 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    3960:	02d00513          	li	a0,45
    3964:	fa9ff0ef          	jal	390c <bsp_printf_c>
            val = -val;
    3968:	409004b3          	neg	s1,s1
    396c:	fedff06f          	j	3958 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    3970:	00a00713          	li	a4,10
    3974:	02e4e7b3          	rem	a5,s1,a4
    3978:	03078793          	addi	a5,a5,48
    397c:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    3980:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    3984:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    3988:	fe0494e3          	bnez	s1,3970 <bsp_printf_d+0x30>
    398c:	00010793          	mv	a5,sp
    3990:	fef400e3          	beq	s0,a5,3970 <bsp_printf_d+0x30>
        while (p != buffer)
    3994:	00010793          	mv	a5,sp
    3998:	00f40a63          	beq	s0,a5,39ac <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    399c:	fff40413          	addi	s0,s0,-1
    39a0:	00044503          	lbu	a0,0(s0)
    39a4:	f69ff0ef          	jal	390c <bsp_printf_c>
    39a8:	fedff06f          	j	3994 <bsp_printf_d+0x54>
    }
    39ac:	02c12083          	lw	ra,44(sp)
    39b0:	02812403          	lw	s0,40(sp)
    39b4:	02412483          	lw	s1,36(sp)
    39b8:	03010113          	addi	sp,sp,48
    39bc:	00008067          	ret

000039c0 <bsp_printf_x>:
    {
    39c0:	ff010113          	addi	sp,sp,-16
    39c4:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    39c8:	00000713          	li	a4,0
    39cc:	00700793          	li	a5,7
    39d0:	02e7c063          	blt	a5,a4,39f0 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    39d4:	00271693          	slli	a3,a4,0x2
    39d8:	ff000793          	li	a5,-16
    39dc:	00d797b3          	sll	a5,a5,a3
    39e0:	00f577b3          	and	a5,a0,a5
    39e4:	00078663          	beqz	a5,39f0 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    39e8:	00170713          	addi	a4,a4,1
    39ec:	fe1ff06f          	j	39cc <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    39f0:	ec9ff0ef          	jal	38b8 <bsp_printHex_lower>
    }
    39f4:	00c12083          	lw	ra,12(sp)
    39f8:	01010113          	addi	sp,sp,16
    39fc:	00008067          	ret

00003a00 <bsp_printf_X>:
        {
    3a00:	ff010113          	addi	sp,sp,-16
    3a04:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    3a08:	00000713          	li	a4,0
    3a0c:	00700793          	li	a5,7
    3a10:	02e7c063          	blt	a5,a4,3a30 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3a14:	00271693          	slli	a3,a4,0x2
    3a18:	ff000793          	li	a5,-16
    3a1c:	00d797b3          	sll	a5,a5,a3
    3a20:	00f577b3          	and	a5,a0,a5
    3a24:	00078663          	beqz	a5,3a30 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    3a28:	00170713          	addi	a4,a4,1
    3a2c:	fe1ff06f          	j	3a0c <bsp_printf_X+0xc>
            bsp_printHex(val);
    3a30:	e35ff0ef          	jal	3864 <bsp_printHex>
        }
    3a34:	00c12083          	lw	ra,12(sp)
    3a38:	01010113          	addi	sp,sp,16
    3a3c:	00008067          	ret

00003a40 <mipi_i2c_probe>:
// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    3a40:	ff010113          	addi	sp,sp,-16
    3a44:	00112623          	sw	ra,12(sp)
    3a48:	00812423          	sw	s0,8(sp)
    3a4c:	00912223          	sw	s1,4(sp)
    3a50:	00050413          	mv	s0,a0
    3a54:	00058493          	mv	s1,a1
    i2c_masterStartBlocking(i2cCtrl);
    3a58:	d11ff0ef          	jal	3768 <i2c_masterStartBlocking>
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3a5c:	000017b7          	lui	a5,0x1
    3a60:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    3a64:	00f4e4b3          	or	s1,s1,a5
    3a68:	00942023          	sw	s1,0(s0)
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    3a6c:	00040513          	mv	a0,s0
    3a70:	d25ff0ef          	jal	3794 <i2c_txNackBlocking>
    return i2c_rxAck(i2cCtrl);
    3a74:	00040513          	mv	a0,s0
    3a78:	d3dff0ef          	jal	37b4 <i2c_rxAck>
}
    3a7c:	00c12083          	lw	ra,12(sp)
    3a80:	00812403          	lw	s0,8(sp)
    3a84:	00412483          	lw	s1,4(sp)
    3a88:	01010113          	addi	sp,sp,16
    3a8c:	00008067          	ret

00003a90 <bsp_printf>:
    {
    3a90:	fc010113          	addi	sp,sp,-64
    3a94:	00112e23          	sw	ra,28(sp)
    3a98:	00812c23          	sw	s0,24(sp)
    3a9c:	00912a23          	sw	s1,20(sp)
    3aa0:	00050493          	mv	s1,a0
    3aa4:	02b12223          	sw	a1,36(sp)
    3aa8:	02c12423          	sw	a2,40(sp)
    3aac:	02d12623          	sw	a3,44(sp)
    3ab0:	02e12823          	sw	a4,48(sp)
    3ab4:	02f12a23          	sw	a5,52(sp)
    3ab8:	03012c23          	sw	a6,56(sp)
    3abc:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    3ac0:	02410793          	addi	a5,sp,36
    3ac4:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    3ac8:	00000413          	li	s0,0
    3acc:	01c0006f          	j	3ae8 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    3ad0:	00c12783          	lw	a5,12(sp)
    3ad4:	00478713          	addi	a4,a5,4
    3ad8:	00e12623          	sw	a4,12(sp)
    3adc:	0007a503          	lw	a0,0(a5)
    3ae0:	e2dff0ef          	jal	390c <bsp_printf_c>
        for (i = 0; format[i]; i++)
    3ae4:	00140413          	addi	s0,s0,1
    3ae8:	008487b3          	add	a5,s1,s0
    3aec:	0007c503          	lbu	a0,0(a5)
    3af0:	0a050e63          	beqz	a0,3bac <bsp_printf+0x11c>
            if (format[i] == '%') {
    3af4:	02500793          	li	a5,37
    3af8:	06f50e63          	beq	a0,a5,3b74 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    3afc:	e11ff0ef          	jal	390c <bsp_printf_c>
    3b00:	fe5ff06f          	j	3ae4 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    3b04:	00c12783          	lw	a5,12(sp)
    3b08:	00478713          	addi	a4,a5,4
    3b0c:	00e12623          	sw	a4,12(sp)
    3b10:	0007a503          	lw	a0,0(a5)
    3b14:	e15ff0ef          	jal	3928 <bsp_printf_s>
                        break;
    3b18:	fcdff06f          	j	3ae4 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    3b1c:	00c12783          	lw	a5,12(sp)
    3b20:	00478713          	addi	a4,a5,4
    3b24:	00e12623          	sw	a4,12(sp)
    3b28:	0007a503          	lw	a0,0(a5)
    3b2c:	e15ff0ef          	jal	3940 <bsp_printf_d>
                        break;
    3b30:	fb5ff06f          	j	3ae4 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    3b34:	00c12783          	lw	a5,12(sp)
    3b38:	00478713          	addi	a4,a5,4
    3b3c:	00e12623          	sw	a4,12(sp)
    3b40:	0007a503          	lw	a0,0(a5)
    3b44:	ebdff0ef          	jal	3a00 <bsp_printf_X>
                        break;
    3b48:	f9dff06f          	j	3ae4 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    3b4c:	00c12783          	lw	a5,12(sp)
    3b50:	00478713          	addi	a4,a5,4
    3b54:	00e12623          	sw	a4,12(sp)
    3b58:	0007a503          	lw	a0,0(a5)
    3b5c:	e65ff0ef          	jal	39c0 <bsp_printf_x>
                        break;
    3b60:	f85ff06f          	j	3ae4 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    3b64:	00004537          	lui	a0,0x4
    3b68:	53850513          	addi	a0,a0,1336 # 4538 <_data+0x28>
    3b6c:	dbdff0ef          	jal	3928 <bsp_printf_s>
                        break;
    3b70:	f75ff06f          	j	3ae4 <bsp_printf+0x54>
                while (format[++i]) {
    3b74:	00140413          	addi	s0,s0,1
    3b78:	008487b3          	add	a5,s1,s0
    3b7c:	0007c783          	lbu	a5,0(a5)
    3b80:	f60782e3          	beqz	a5,3ae4 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    3b84:	fa878793          	addi	a5,a5,-88
    3b88:	0ff7f693          	zext.b	a3,a5
    3b8c:	02000713          	li	a4,32
    3b90:	fed762e3          	bltu	a4,a3,3b74 <bsp_printf+0xe4>
    3b94:	00269793          	slli	a5,a3,0x2
    3b98:	00005737          	lui	a4,0x5
    3b9c:	13c70713          	addi	a4,a4,316 # 513c <_data+0xc2c>
    3ba0:	00e787b3          	add	a5,a5,a4
    3ba4:	0007a783          	lw	a5,0(a5)
    3ba8:	00078067          	jr	a5
    }
    3bac:	01c12083          	lw	ra,28(sp)
    3bb0:	01812403          	lw	s0,24(sp)
    3bb4:	01412483          	lw	s1,20(sp)
    3bb8:	04010113          	addi	sp,sp,64
    3bbc:	00008067          	ret

00003bc0 <camera_init>:
// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    3bc0:	fe010113          	addi	sp,sp,-32
    3bc4:	00112e23          	sw	ra,28(sp)
    3bc8:	00812c23          	sw	s0,24(sp)
    3bcc:	00912a23          	sw	s1,20(sp)
    3bd0:	01212823          	sw	s2,16(sp)
    3bd4:	01312623          	sw	s3,12(sp)
    3bd8:	00050913          	mv	s2,a0
    3bdc:	00058493          	mv	s1,a1
    mipi_i2c_init(i2cCtrl);
    3be0:	00058513          	mv	a0,a1
    3be4:	a24fe0ef          	jal	1e08 <mipi_i2c_init>

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3be8:	00000413          	li	s0,0
    3bec:	00100793          	li	a5,1
    3bf0:	0a87e863          	bltu	a5,s0,3ca0 <camera_init+0xe0>
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
    3bf4:	000057b7          	lui	a5,0x5
    3bf8:	00241713          	slli	a4,s0,0x2
    3bfc:	00870733          	add	a4,a4,s0
    3c00:	00271713          	slli	a4,a4,0x2
    3c04:	1c078793          	addi	a5,a5,448 # 51c0 <supportedCamera>
    3c08:	00e787b3          	add	a5,a5,a4
    3c0c:	0007c983          	lbu	s3,0(a5)
    3c10:	00098593          	mv	a1,s3
    3c14:	00048513          	mv	a0,s1
    3c18:	e29ff0ef          	jal	3a40 <mipi_i2c_probe>
    3c1c:	00100793          	li	a5,1
    3c20:	00f50663          	beq	a0,a5,3c2c <camera_init+0x6c>
    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3c24:	00140413          	addi	s0,s0,1
    3c28:	fc5ff06f          	j	3bec <camera_init+0x2c>
    3c2c:	01412423          	sw	s4,8(sp)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
    3c30:	00005a37          	lui	s4,0x5
    3c34:	00241793          	slli	a5,s0,0x2
    3c38:	008787b3          	add	a5,a5,s0
    3c3c:	00279793          	slli	a5,a5,0x2
    3c40:	1c0a0a13          	addi	s4,s4,448 # 51c0 <supportedCamera>
    3c44:	00fa0a33          	add	s4,s4,a5
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
    3c48:	0019d693          	srli	a3,s3,0x1
    3c4c:	008a2603          	lw	a2,8(s4)
    3c50:	00090593          	mv	a1,s2
    3c54:	00005537          	lui	a0,0x5
    3c58:	ee050513          	addi	a0,a0,-288 # 4ee0 <_data+0x9d0>
    3c5c:	e35ff0ef          	jal	3a90 <bsp_printf>
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
    3c60:	00ca2783          	lw	a5,12(s4)
    3c64:	00078663          	beqz	a5,3c70 <camera_init+0xb0>
                supportedCamera[i].init(i2cCtrl);
    3c68:	00048513          	mv	a0,s1
    3c6c:	000780e7          	jalr	a5

            if (supportedCamera[i].start_stream != NULL)
    3c70:	000057b7          	lui	a5,0x5
    3c74:	00241713          	slli	a4,s0,0x2
    3c78:	00870733          	add	a4,a4,s0
    3c7c:	00271713          	slli	a4,a4,0x2
    3c80:	1c078793          	addi	a5,a5,448 # 51c0 <supportedCamera>
    3c84:	00e787b3          	add	a5,a5,a4
    3c88:	0107a783          	lw	a5,16(a5)
    3c8c:	04078063          	beqz	a5,3ccc <camera_init+0x10c>
                supportedCamera[i].start_stream(i2cCtrl);
    3c90:	00048513          	mv	a0,s1
    3c94:	000780e7          	jalr	a5
            return;
    3c98:	00812a03          	lw	s4,8(sp)
    3c9c:	0140006f          	j	3cb0 <camera_init+0xf0>
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
    3ca0:	00090593          	mv	a1,s2
    3ca4:	00005537          	lui	a0,0x5
    3ca8:	f0850513          	addi	a0,a0,-248 # 4f08 <_data+0x9f8>
    3cac:	de5ff0ef          	jal	3a90 <bsp_printf>
}
    3cb0:	01c12083          	lw	ra,28(sp)
    3cb4:	01812403          	lw	s0,24(sp)
    3cb8:	01412483          	lw	s1,20(sp)
    3cbc:	01012903          	lw	s2,16(sp)
    3cc0:	00c12983          	lw	s3,12(sp)
    3cc4:	02010113          	addi	sp,sp,32
    3cc8:	00008067          	ret
    3ccc:	00812a03          	lw	s4,8(sp)
    3cd0:	fe1ff06f          	j	3cb0 <camera_init+0xf0>

00003cd4 <cam0_init>:

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
    3cd4:	ff010113          	addi	sp,sp,-16
    3cd8:	00112623          	sw	ra,12(sp)
    3cdc:	00050593          	mv	a1,a0
    3ce0:	00000513          	li	a0,0
    3ce4:	eddff0ef          	jal	3bc0 <camera_init>
    3ce8:	00c12083          	lw	ra,12(sp)
    3cec:	01010113          	addi	sp,sp,16
    3cf0:	00008067          	ret

00003cf4 <uart_writeAvailability>:
        return *((volatile u32*) address);
    3cf4:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3cf8:	01055513          	srli	a0,a0,0x10
    }
    3cfc:	0ff57513          	zext.b	a0,a0
    3d00:	00008067          	ret

00003d04 <uart_write>:
    static void uart_write(u32 reg, char data){
    3d04:	ff010113          	addi	sp,sp,-16
    3d08:	00112623          	sw	ra,12(sp)
    3d0c:	00812423          	sw	s0,8(sp)
    3d10:	00912223          	sw	s1,4(sp)
    3d14:	00050413          	mv	s0,a0
    3d18:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    3d1c:	00040513          	mv	a0,s0
    3d20:	fd5ff0ef          	jal	3cf4 <uart_writeAvailability>
    3d24:	fe050ce3          	beqz	a0,3d1c <uart_write+0x18>
        *((volatile u32*) address) = data;
    3d28:	00942023          	sw	s1,0(s0)
    }
    3d2c:	00c12083          	lw	ra,12(sp)
    3d30:	00812403          	lw	s0,8(sp)
    3d34:	00412483          	lw	s1,4(sp)
    3d38:	01010113          	addi	sp,sp,16
    3d3c:	00008067          	ret

00003d40 <uart_writeStr>:
    static void uart_writeStr(u32 reg, const char* str){
    3d40:	ff010113          	addi	sp,sp,-16
    3d44:	00112623          	sw	ra,12(sp)
    3d48:	00812423          	sw	s0,8(sp)
    3d4c:	00912223          	sw	s1,4(sp)
    3d50:	00050493          	mv	s1,a0
    3d54:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    3d58:	0100006f          	j	3d68 <uart_writeStr+0x28>
    3d5c:	00140413          	addi	s0,s0,1
    3d60:	00048513          	mv	a0,s1
    3d64:	fa1ff0ef          	jal	3d04 <uart_write>
    3d68:	00044583          	lbu	a1,0(s0)
    3d6c:	fe0598e3          	bnez	a1,3d5c <uart_writeStr+0x1c>
    }
    3d70:	00c12083          	lw	ra,12(sp)
    3d74:	00812403          	lw	s0,8(sp)
    3d78:	00412483          	lw	s1,4(sp)
    3d7c:	01010113          	addi	sp,sp,16
    3d80:	00008067          	ret

00003d84 <i2c_masterBusy>:
        return *((volatile u32*) address);
    3d84:	04052503          	lw	a0,64(a0)
    }
    3d88:	00157513          	andi	a0,a0,1
    3d8c:	00008067          	ret

00003d90 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3d90:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3d94:	21000793          	li	a5,528
    3d98:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3d9c:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3da0:	0107f793          	andi	a5,a5,16
    3da4:	fe079ce3          	bnez	a5,3d9c <i2c_masterStartBlocking+0xc>
    }
    3da8:	00008067          	ret

00003dac <i2c_masterStopWait>:
    static void i2c_masterStopWait(u32 reg){
    3dac:	ff010113          	addi	sp,sp,-16
    3db0:	00112623          	sw	ra,12(sp)
    3db4:	00812423          	sw	s0,8(sp)
    3db8:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3dbc:	00040513          	mv	a0,s0
    3dc0:	fc5ff0ef          	jal	3d84 <i2c_masterBusy>
    3dc4:	fe051ce3          	bnez	a0,3dbc <i2c_masterStopWait+0x10>
    }
    3dc8:	00c12083          	lw	ra,12(sp)
    3dcc:	00812403          	lw	s0,8(sp)
    3dd0:	01010113          	addi	sp,sp,16
    3dd4:	00008067          	ret

00003dd8 <i2c_masterStopBlocking>:
    static void i2c_masterStopBlocking(u32 reg){
    3dd8:	ff010113          	addi	sp,sp,-16
    3ddc:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3de0:	42000713          	li	a4,1056
    3de4:	04e52023          	sw	a4,64(a0)
        i2c_masterStopWait(reg);
    3de8:	fc5ff0ef          	jal	3dac <i2c_masterStopWait>
    }
    3dec:	00c12083          	lw	ra,12(sp)
    3df0:	01010113          	addi	sp,sp,16
    3df4:	00008067          	ret

00003df8 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3df8:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3dfc:	1007f793          	andi	a5,a5,256
    3e00:	fe079ce3          	bnez	a5,3df8 <i2c_txAckWait>
    }
    3e04:	00008067          	ret

00003e08 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3e08:	ff010113          	addi	sp,sp,-16
    3e0c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3e10:	30100713          	li	a4,769
    3e14:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3e18:	fe1ff0ef          	jal	3df8 <i2c_txAckWait>
    }
    3e1c:	00c12083          	lw	ra,12(sp)
    3e20:	01010113          	addi	sp,sp,16
    3e24:	00008067          	ret

00003e28 <i2c_rxAck>:
        return *((volatile u32*) address);
    3e28:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3e2c:	0ff57513          	zext.b	a0,a0
    }
    3e30:	00153513          	seqz	a0,a0
    3e34:	00008067          	ret

00003e38 <PiCamV3_WriteRegData>:
#include "riscv.h"
#include "PiCamV3Driver.h"
#include "common.h"

void PiCamV3_WriteRegData(u32 i2c_addr, u16 reg, u8 data)
{
    3e38:	fe010113          	addi	sp,sp,-32
    3e3c:	00112e23          	sw	ra,28(sp)
    3e40:	00812c23          	sw	s0,24(sp)
    3e44:	00912a23          	sw	s1,20(sp)
    3e48:	01212823          	sw	s2,16(sp)
    3e4c:	01312623          	sw	s3,12(sp)
    3e50:	00050413          	mv	s0,a0
    3e54:	00058493          	mv	s1,a1
    3e58:	00060913          	mv	s2,a2
	u8 outdata;

	i2c_masterStartBlocking(i2c_addr);
    3e5c:	f35ff0ef          	jal	3d90 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    3e60:	000017b7          	lui	a5,0x1
    3e64:	b3478793          	addi	a5,a5,-1228 # b34 <CUSTOM2+0xad9>
    3e68:	00f42023          	sw	a5,0(s0)

	i2c_txByte(i2c_addr, IMX708_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3e6c:	00040513          	mv	a0,s0
    3e70:	f99ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e74:	00040513          	mv	a0,s0
    3e78:	fb1ff0ef          	jal	3e28 <i2c_rxAck>
    3e7c:	f3dfd0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg >> 8) & 0xFF);
    3e80:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3e84:	000019b7          	lui	s3,0x1
    3e88:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3e8c:	0137e7b3          	or	a5,a5,s3
    3e90:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3e94:	00040513          	mv	a0,s0
    3e98:	f71ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e9c:	00040513          	mv	a0,s0
    3ea0:	f89ff0ef          	jal	3e28 <i2c_rxAck>
    3ea4:	f15fd0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg) & 0xFF);
    3ea8:	0ff4f493          	zext.b	s1,s1
    3eac:	0134e4b3          	or	s1,s1,s3
    3eb0:	00942023          	sw	s1,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3eb4:	00040513          	mv	a0,s0
    3eb8:	f51ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3ebc:	00040513          	mv	a0,s0
    3ec0:	f69ff0ef          	jal	3e28 <i2c_rxAck>
    3ec4:	ef5fd0ef          	jal	1db8 <assert>
    3ec8:	01396933          	or	s2,s2,s3
    3ecc:	01242023          	sw	s2,0(s0)

	i2c_txByte(i2c_addr, data & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3ed0:	00040513          	mv	a0,s0
    3ed4:	f35ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3ed8:	00040513          	mv	a0,s0
    3edc:	f4dff0ef          	jal	3e28 <i2c_rxAck>
    3ee0:	ed9fd0ef          	jal	1db8 <assert>

	i2c_masterStopBlocking(i2c_addr);
    3ee4:	00040513          	mv	a0,s0
    3ee8:	ef1ff0ef          	jal	3dd8 <i2c_masterStopBlocking>
}
    3eec:	01c12083          	lw	ra,28(sp)
    3ef0:	01812403          	lw	s0,24(sp)
    3ef4:	01412483          	lw	s1,20(sp)
    3ef8:	01012903          	lw	s2,16(sp)
    3efc:	00c12983          	lw	s3,12(sp)
    3f00:	02010113          	addi	sp,sp,32
    3f04:	00008067          	ret

00003f08 <PiCamV3_StartStreaming>:

	return outdata;
}

void PiCamV3_StartStreaming(u32 i2c_addr)
{
    3f08:	ff010113          	addi	sp,sp,-16
    3f0c:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_ACTIVE);
    3f10:	00100613          	li	a2,1
    3f14:	10000593          	li	a1,256
    3f18:	f21ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
}
    3f1c:	00c12083          	lw	ra,12(sp)
    3f20:	01010113          	addi	sp,sp,16
    3f24:	00008067          	ret

00003f28 <PiCamV3_StopStreaming>:

void PiCamV3_StopStreaming(u32 i2c_addr)
{
    3f28:	ff010113          	addi	sp,sp,-16
    3f2c:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_SLEEP);
    3f30:	00000613          	li	a2,0
    3f34:	10000593          	li	a1,256
    3f38:	f01ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
}
    3f3c:	00c12083          	lw	ra,12(sp)
    3f40:	01010113          	addi	sp,sp,16
    3f44:	00008067          	ret

00003f48 <PiCamV3_ConfigCommon>:

void PiCamV3_ConfigCommon(u32 i2c_addr)
{
    3f48:	ff010113          	addi	sp,sp,-16
    3f4c:	00112623          	sw	ra,12(sp)
    3f50:	00812423          	sw	s0,8(sp)
    3f54:	00912223          	sw	s1,4(sp)
    3f58:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3f5c:	00000413          	li	s0,0
    3f60:	0280006f          	j	3f88 <PiCamV3_ConfigCommon+0x40>
	{
		PiCamV3_WriteRegData(i2c_addr, mode_common_regs[i].address, mode_common_regs[i].val);
    3f64:	000057b7          	lui	a5,0x5
    3f68:	00241713          	slli	a4,s0,0x2
    3f6c:	65078793          	addi	a5,a5,1616 # 5650 <mode_common_regs>
    3f70:	00e787b3          	add	a5,a5,a4
    3f74:	0027c603          	lbu	a2,2(a5)
    3f78:	0007d583          	lhu	a1,0(a5)
    3f7c:	00048513          	mv	a0,s1
    3f80:	eb9ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3f84:	00140413          	addi	s0,s0,1
    3f88:	02f00793          	li	a5,47
    3f8c:	fc87fce3          	bgeu	a5,s0,3f64 <PiCamV3_ConfigCommon+0x1c>
	}
}
    3f90:	00c12083          	lw	ra,12(sp)
    3f94:	00812403          	lw	s0,8(sp)
    3f98:	00412483          	lw	s1,4(sp)
    3f9c:	01010113          	addi	sp,sp,16
    3fa0:	00008067          	ret

00003fa4 <PiCamV3_ConfigFormat>:

void PiCamV3_ConfigFormat(u32 i2c_addr, u8 mode)
{
    3fa4:	ff010113          	addi	sp,sp,-16
    3fa8:	00112623          	sw	ra,12(sp)
    3fac:	00912223          	sw	s1,4(sp)
    3fb0:	00050493          	mv	s1,a0
	// 	MODE
	//  0 : 1920 x 1080 cropped, 50FPS
	//	1 : 1920 x 1080 2x2 binned, 60 FPS
	//  2 : 1920 x 1080 HDR, 50 FPS

	if (mode == 0)
    3fb4:	08058663          	beqz	a1,4040 <PiCamV3_ConfigFormat+0x9c>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
		}
	}

	else if (mode == 1)
    3fb8:	00100793          	li	a5,1
    3fbc:	0cf58263          	beq	a1,a5,4080 <PiCamV3_ConfigFormat+0xdc>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
		}
	}

	else if (mode == 2)
    3fc0:	00200793          	li	a5,2
    3fc4:	06f59663          	bne	a1,a5,4030 <PiCamV3_ConfigFormat+0x8c>
    3fc8:	00812423          	sw	s0,8(sp)
	{
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3fcc:	00000413          	li	s0,0
    3fd0:	05e00793          	li	a5,94
    3fd4:	0a87ec63          	bltu	a5,s0,408c <PiCamV3_ConfigFormat+0xe8>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_hdr_1920x1080_regs[i].address, mode_hdr_1920x1080_regs[i].val);
    3fd8:	000057b7          	lui	a5,0x5
    3fdc:	00241713          	slli	a4,s0,0x2
    3fe0:	1fc78793          	addi	a5,a5,508 # 51fc <mode_hdr_1920x1080_regs>
    3fe4:	00e787b3          	add	a5,a5,a4
    3fe8:	0027c603          	lbu	a2,2(a5)
    3fec:	0007d583          	lhu	a1,0(a5)
    3ff0:	00048513          	mv	a0,s1
    3ff4:	e45ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3ff8:	00140413          	addi	s0,s0,1
    3ffc:	fd5ff06f          	j	3fd0 <PiCamV3_ConfigFormat+0x2c>
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
    4000:	000057b7          	lui	a5,0x5
    4004:	00241713          	slli	a4,s0,0x2
    4008:	4e478793          	addi	a5,a5,1252 # 54e4 <mode_1920x1080_cropped_regs>
    400c:	00e787b3          	add	a5,a5,a4
    4010:	0027c603          	lbu	a2,2(a5)
    4014:	0007d583          	lhu	a1,0(a5)
    4018:	00048513          	mv	a0,s1
    401c:	e1dff0ef          	jal	3e38 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    4020:	00140413          	addi	s0,s0,1
    4024:	05a00793          	li	a5,90
    4028:	fc87fce3          	bgeu	a5,s0,4000 <PiCamV3_ConfigFormat+0x5c>
    402c:	00812403          	lw	s0,8(sp)
		}
	}
}
    4030:	00c12083          	lw	ra,12(sp)
    4034:	00412483          	lw	s1,4(sp)
    4038:	01010113          	addi	sp,sp,16
    403c:	00008067          	ret
    4040:	00812423          	sw	s0,8(sp)
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    4044:	00000413          	li	s0,0
    4048:	fddff06f          	j	4024 <PiCamV3_ConfigFormat+0x80>
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
    404c:	000057b7          	lui	a5,0x5
    4050:	00241713          	slli	a4,s0,0x2
    4054:	37878793          	addi	a5,a5,888 # 5378 <mode_2x2binned_1920x1080_regs>
    4058:	00e787b3          	add	a5,a5,a4
    405c:	0027c603          	lbu	a2,2(a5)
    4060:	0007d583          	lhu	a1,0(a5)
    4064:	00048513          	mv	a0,s1
    4068:	dd1ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_2x2binned_1920x1080_regs) / sizeof(mode_2x2binned_1920x1080_regs[0]); i++)
    406c:	00140413          	addi	s0,s0,1
    4070:	05a00793          	li	a5,90
    4074:	fc87fce3          	bgeu	a5,s0,404c <PiCamV3_ConfigFormat+0xa8>
    4078:	00812403          	lw	s0,8(sp)
    407c:	fb5ff06f          	j	4030 <PiCamV3_ConfigFormat+0x8c>
    4080:	00812423          	sw	s0,8(sp)
    4084:	00000413          	li	s0,0
    4088:	fe9ff06f          	j	4070 <PiCamV3_ConfigFormat+0xcc>
    408c:	00812403          	lw	s0,8(sp)
    4090:	fa1ff06f          	j	4030 <PiCamV3_ConfigFormat+0x8c>

00004094 <PiCamV3_ConfigLinkFreq>:

void PiCamV3_ConfigLinkFreq(u32 i2c_addr)
{
    4094:	ff010113          	addi	sp,sp,-16
    4098:	00112623          	sw	ra,12(sp)
    409c:	00812423          	sw	s0,8(sp)
    40a0:	00912223          	sw	s1,4(sp)
    40a4:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    40a8:	00000413          	li	s0,0
    40ac:	0240006f          	j	40d0 <PiCamV3_ConfigLinkFreq+0x3c>
	{
		PiCamV3_WriteRegData(i2c_addr, link_450Mhz_regs[i].address, link_450Mhz_regs[i].val);
    40b0:	00241713          	slli	a4,s0,0x2
    40b4:	81818793          	addi	a5,gp,-2024 # 5960 <link_450Mhz_regs>
    40b8:	00e787b3          	add	a5,a5,a4
    40bc:	0027c603          	lbu	a2,2(a5)
    40c0:	0007d583          	lhu	a1,0(a5)
    40c4:	00048513          	mv	a0,s1
    40c8:	d71ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    40cc:	00140413          	addi	s0,s0,1
    40d0:	00100793          	li	a5,1
    40d4:	fc87fee3          	bgeu	a5,s0,40b0 <PiCamV3_ConfigLinkFreq+0x1c>
	}
}
    40d8:	00c12083          	lw	ra,12(sp)
    40dc:	00812403          	lw	s0,8(sp)
    40e0:	00412483          	lw	s1,4(sp)
    40e4:	01010113          	addi	sp,sp,16
    40e8:	00008067          	ret

000040ec <PiCamV3_ConfigQuadBayerRemosaicAdjustment>:

void PiCamV3_ConfigQuadBayerRemosaicAdjustment(u32 i2c_addr)
{
    40ec:	ff010113          	addi	sp,sp,-16
    40f0:	00112623          	sw	ra,12(sp)
    40f4:	00812423          	sw	s0,8(sp)
    40f8:	00050413          	mv	s0,a0
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED);
    40fc:	00000613          	li	a2,0
    4100:	0000c5b7          	lui	a1,0xc
    4104:	42858593          	addi	a1,a1,1064 # c428 <__freertos_irq_stack_top+0x5918>
    4108:	d31ff0ef          	jal	3e38 <PiCamV3_WriteRegData>
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY, 0x04);
    410c:	00400613          	li	a2,4
    4110:	0000c5b7          	lui	a1,0xc
    4114:	42958593          	addi	a1,a1,1065 # c429 <__freertos_irq_stack_top+0x5919>
    4118:	00040513          	mv	a0,s0
    411c:	d1dff0ef          	jal	3e38 <PiCamV3_WriteRegData>
}
    4120:	00c12083          	lw	ra,12(sp)
    4124:	00812403          	lw	s0,8(sp)
    4128:	01010113          	addi	sp,sp,16
    412c:	00008067          	ret

00004130 <PiCamV3_SetPdafGain>:

void PiCamV3_SetPdafGain(u32 i2c_addr)
{
    4130:	fe010113          	addi	sp,sp,-32
    4134:	00112e23          	sw	ra,28(sp)
    4138:	00812c23          	sw	s0,24(sp)
    413c:	00912a23          	sw	s1,20(sp)
    4140:	01212823          	sw	s2,16(sp)
    4144:	01312623          	sw	s3,12(sp)
    4148:	00050993          	mv	s3,a0
	for (int i = 0; i < 54; i++)
    414c:	00000493          	li	s1,0
    4150:	0640006f          	j	41b4 <PiCamV3_SetPdafGain+0x84>
	{
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_L + i, pdaf_gains[0][i % 9]);
    4154:	01049913          	slli	s2,s1,0x10
    4158:	01095913          	srli	s2,s2,0x10
    415c:	00900793          	li	a5,9
    4160:	02f4e7b3          	rem	a5,s1,a5
    4164:	00005437          	lui	s0,0x5
    4168:	1e840413          	addi	s0,s0,488 # 51e8 <pdaf_gains>
    416c:	00f40433          	add	s0,s0,a5
    4170:	000085b7          	lui	a1,0x8
    4174:	b1058593          	addi	a1,a1,-1264 # 7b10 <__freertos_irq_stack_top+0x1000>
    4178:	00b905b3          	add	a1,s2,a1
    417c:	00044603          	lbu	a2,0(s0)
    4180:	01059593          	slli	a1,a1,0x10
    4184:	0105d593          	srli	a1,a1,0x10
    4188:	00098513          	mv	a0,s3
    418c:	cadff0ef          	jal	3e38 <PiCamV3_WriteRegData>
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_R + i, pdaf_gains[1][i % 9]);
    4190:	000087b7          	lui	a5,0x8
    4194:	c0078793          	addi	a5,a5,-1024 # 7c00 <__freertos_irq_stack_top+0x10f0>
    4198:	00f905b3          	add	a1,s2,a5
    419c:	00944603          	lbu	a2,9(s0)
    41a0:	01059593          	slli	a1,a1,0x10
    41a4:	0105d593          	srli	a1,a1,0x10
    41a8:	00098513          	mv	a0,s3
    41ac:	c8dff0ef          	jal	3e38 <PiCamV3_WriteRegData>
	for (int i = 0; i < 54; i++)
    41b0:	00148493          	addi	s1,s1,1
    41b4:	03500793          	li	a5,53
    41b8:	f897dee3          	bge	a5,s1,4154 <PiCamV3_SetPdafGain+0x24>
	}
}
    41bc:	01c12083          	lw	ra,28(sp)
    41c0:	01812403          	lw	s0,24(sp)
    41c4:	01412483          	lw	s1,20(sp)
    41c8:	01012903          	lw	s2,16(sp)
    41cc:	00c12983          	lw	s3,12(sp)
    41d0:	02010113          	addi	sp,sp,32
    41d4:	00008067          	ret

000041d8 <PiCamV3_OnActuator>:
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN, (val & 0xFF00) >> 8);
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN + 1, val & 0xFF);
}

void PiCamV3_OnActuator(u32 i2c_addr)
{
    41d8:	ff010113          	addi	sp,sp,-16
    41dc:	00112623          	sw	ra,12(sp)
    41e0:	00812423          	sw	s0,8(sp)
    41e4:	00050413          	mv	s0,a0
	// Turn on actuator
	i2c_masterStartBlocking(i2c_addr);
    41e8:	ba9ff0ef          	jal	3d90 <i2c_masterStartBlocking>
    41ec:	000017b7          	lui	a5,0x1
    41f0:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    41f4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    41f8:	00040513          	mv	a0,s0
    41fc:	c0dff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4200:	00040513          	mv	a0,s0
    4204:	c25ff0ef          	jal	3e28 <i2c_rxAck>
    4208:	bb1fd0ef          	jal	1db8 <assert>
    420c:	000017b7          	lui	a5,0x1
    4210:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4214:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4218:	00040513          	mv	a0,s0
    421c:	bedff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4220:	00040513          	mv	a0,s0
    4224:	c05ff0ef          	jal	3e28 <i2c_rxAck>
    4228:	b91fd0ef          	jal	1db8 <assert>
    422c:	000017b7          	lui	a5,0x1
    4230:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    4234:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_ACTIVE);
	i2c_txNackBlocking(i2c_addr);
    4238:	00040513          	mv	a0,s0
    423c:	bcdff0ef          	jal	3e08 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    4240:	00040513          	mv	a0,s0
    4244:	b95ff0ef          	jal	3dd8 <i2c_masterStopBlocking>
}
    4248:	00c12083          	lw	ra,12(sp)
    424c:	00812403          	lw	s0,8(sp)
    4250:	01010113          	addi	sp,sp,16
    4254:	00008067          	ret

00004258 <PiCamV3_OffActuator>:

void PiCamV3_OffActuator(u32 i2c_addr)
{
    4258:	ff010113          	addi	sp,sp,-16
    425c:	00112623          	sw	ra,12(sp)
    4260:	00812423          	sw	s0,8(sp)
    4264:	00050413          	mv	s0,a0
	// Turn off actuator
	i2c_masterStartBlocking(i2c_addr);
    4268:	b29ff0ef          	jal	3d90 <i2c_masterStartBlocking>
    426c:	000017b7          	lui	a5,0x1
    4270:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    4274:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4278:	00040513          	mv	a0,s0
    427c:	b8dff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4280:	00040513          	mv	a0,s0
    4284:	ba5ff0ef          	jal	3e28 <i2c_rxAck>
    4288:	b31fd0ef          	jal	1db8 <assert>
    428c:	000017b7          	lui	a5,0x1
    4290:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4294:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4298:	00040513          	mv	a0,s0
    429c:	b6dff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    42a0:	00040513          	mv	a0,s0
    42a4:	b85ff0ef          	jal	3e28 <i2c_rxAck>
    42a8:	b11fd0ef          	jal	1db8 <assert>
    42ac:	000017b7          	lui	a5,0x1
    42b0:	b0178793          	addi	a5,a5,-1279 # b01 <CUSTOM2+0xaa6>
    42b4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_SLEEP);
	i2c_txNackBlocking(i2c_addr);
    42b8:	00040513          	mv	a0,s0
    42bc:	b4dff0ef          	jal	3e08 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    42c0:	00040513          	mv	a0,s0
    42c4:	b15ff0ef          	jal	3dd8 <i2c_masterStopBlocking>
}
    42c8:	00c12083          	lw	ra,12(sp)
    42cc:	00812403          	lw	s0,8(sp)
    42d0:	01010113          	addi	sp,sp,16
    42d4:	00008067          	ret

000042d8 <PiCamV3_SetFocusStep>:

void PiCamV3_SetFocusStep(u32 i2c_addr, u32 focus_step)
{
    42d8:	fe010113          	addi	sp,sp,-32
    42dc:	00112e23          	sw	ra,28(sp)
    42e0:	00812c23          	sw	s0,24(sp)
    42e4:	00912a23          	sw	s1,20(sp)
    42e8:	01212823          	sw	s2,16(sp)
    42ec:	01312623          	sw	s3,12(sp)
    42f0:	00050413          	mv	s0,a0
    42f4:	00058493          	mv	s1,a1
	if (focus_step >= DW9807_MAX_FOCUS_POS)
    42f8:	3fe00793          	li	a5,1022
    42fc:	00b7f463          	bgeu	a5,a1,4304 <PiCamV3_SetFocusStep+0x2c>
		focus_step = DW9807_MAX_FOCUS_POS;
    4300:	3ff00493          	li	s1,1023
	else if (focus_step <= 0)
		focus_step = 0;

	i2c_masterStartBlocking(i2c_addr);
    4304:	00040513          	mv	a0,s0
    4308:	a89ff0ef          	jal	3d90 <i2c_masterStartBlocking>
    430c:	000019b7          	lui	s3,0x1
    4310:	b1898993          	addi	s3,s3,-1256 # b18 <CUSTOM2+0xabd>
    4314:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4318:	00040513          	mv	a0,s0
    431c:	aedff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4320:	00040513          	mv	a0,s0
    4324:	b05ff0ef          	jal	3e28 <i2c_rxAck>
    4328:	a91fd0ef          	jal	1db8 <assert>
    432c:	000017b7          	lui	a5,0x1
    4330:	b0378793          	addi	a5,a5,-1277 # b03 <CUSTOM2+0xaa8>
    4334:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_MSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4338:	00040513          	mv	a0,s0
    433c:	acdff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4340:	00040513          	mv	a0,s0
    4344:	ae5ff0ef          	jal	3e28 <i2c_rxAck>
    4348:	a71fd0ef          	jal	1db8 <assert>
	i2c_txByte(i2c_addr, (focus_step >> 8) & 0x03);
    434c:	0084d793          	srli	a5,s1,0x8
    4350:	0037f793          	andi	a5,a5,3
    4354:	00001937          	lui	s2,0x1
    4358:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
    435c:	0127e7b3          	or	a5,a5,s2
    4360:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    4364:	00040513          	mv	a0,s0
    4368:	aa1ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    436c:	00040513          	mv	a0,s0
    4370:	ab9ff0ef          	jal	3e28 <i2c_rxAck>
    4374:	a45fd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    4378:	00040513          	mv	a0,s0
    437c:	a5dff0ef          	jal	3dd8 <i2c_masterStopBlocking>

	i2c_masterStartBlocking(i2c_addr);
    4380:	00040513          	mv	a0,s0
    4384:	a0dff0ef          	jal	3d90 <i2c_masterStartBlocking>
    4388:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    438c:	00040513          	mv	a0,s0
    4390:	a79ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4394:	00040513          	mv	a0,s0
    4398:	a91ff0ef          	jal	3e28 <i2c_rxAck>
    439c:	a1dfd0ef          	jal	1db8 <assert>
    43a0:	000017b7          	lui	a5,0x1
    43a4:	b0478793          	addi	a5,a5,-1276 # b04 <CUSTOM2+0xaa9>
    43a8:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_LSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    43ac:	00040513          	mv	a0,s0
    43b0:	a59ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    43b4:	00040513          	mv	a0,s0
    43b8:	a71ff0ef          	jal	3e28 <i2c_rxAck>
    43bc:	9fdfd0ef          	jal	1db8 <assert>
    43c0:	0ff4f493          	zext.b	s1,s1
    43c4:	0124e4b3          	or	s1,s1,s2
    43c8:	00942023          	sw	s1,0(s0)
	i2c_txByte(i2c_addr, focus_step & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    43cc:	00040513          	mv	a0,s0
    43d0:	a39ff0ef          	jal	3e08 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    43d4:	00040513          	mv	a0,s0
    43d8:	a51ff0ef          	jal	3e28 <i2c_rxAck>
    43dc:	9ddfd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    43e0:	00040513          	mv	a0,s0
    43e4:	9f5ff0ef          	jal	3dd8 <i2c_masterStopBlocking>
}
    43e8:	01c12083          	lw	ra,28(sp)
    43ec:	01812403          	lw	s0,24(sp)
    43f0:	01412483          	lw	s1,20(sp)
    43f4:	01012903          	lw	s2,16(sp)
    43f8:	00c12983          	lw	s3,12(sp)
    43fc:	02010113          	addi	sp,sp,32
    4400:	00008067          	ret

00004404 <PiCamV3_Init>:
	PiCamV3_WriteRegData(IMX708_REG_TEST_PATTERN, IMX708_TEST_PATTERN_SOLID_COLOR);
}
*/

void PiCamV3_Init(u32 i2c_addr)
{
    4404:	ff010113          	addi	sp,sp,-16
    4408:	00112623          	sw	ra,12(sp)
    440c:	00812423          	sw	s0,8(sp)
    4410:	00050413          	mv	s0,a0

	PiCamV3_StopStreaming(i2c_addr);
    4414:	b15ff0ef          	jal	3f28 <PiCamV3_StopStreaming>

	PiCamV3_ConfigCommon(i2c_addr);
    4418:	00040513          	mv	a0,s0
    441c:	b2dff0ef          	jal	3f48 <PiCamV3_ConfigCommon>

	PiCamV3_SetPdafGain(i2c_addr);
    4420:	00040513          	mv	a0,s0
    4424:	d0dff0ef          	jal	4130 <PiCamV3_SetPdafGain>

	PiCamV3_ConfigFormat(i2c_addr, 1);
    4428:	00100593          	li	a1,1
    442c:	00040513          	mv	a0,s0
    4430:	b75ff0ef          	jal	3fa4 <PiCamV3_ConfigFormat>

	PiCamV3_ConfigLinkFreq(i2c_addr);
    4434:	00040513          	mv	a0,s0
    4438:	c5dff0ef          	jal	4094 <PiCamV3_ConfigLinkFreq>

	PiCamV3_ConfigQuadBayerRemosaicAdjustment(i2c_addr);
    443c:	00040513          	mv	a0,s0
    4440:	cadff0ef          	jal	40ec <PiCamV3_ConfigQuadBayerRemosaicAdjustment>

	PiCamV3_OnActuator(i2c_addr);
    4444:	00040513          	mv	a0,s0
    4448:	d91ff0ef          	jal	41d8 <PiCamV3_OnActuator>

	PiCamV3_SetFocusStep(i2c_addr, 700);
    444c:	2bc00593          	li	a1,700
    4450:	00040513          	mv	a0,s0
    4454:	e85ff0ef          	jal	42d8 <PiCamV3_SetFocusStep>

	PiCamV3_OffActuator(i2c_addr);
    4458:	00040513          	mv	a0,s0
    445c:	dfdff0ef          	jal	4258 <PiCamV3_OffActuator>

	//	PiCamV3_StartStreaming();

	uart_writeStr(BSP_UART_TERMINAL, "\n\rDone Camera Init");
    4460:	000055b7          	lui	a1,0x5
    4464:	f4858593          	addi	a1,a1,-184 # 4f48 <_data+0xa38>
    4468:	f8010537          	lui	a0,0xf8010
    446c:	8d5ff0ef          	jal	3d40 <uart_writeStr>
}
    4470:	00c12083          	lw	ra,12(sp)
    4474:	00812403          	lw	s0,8(sp)
    4478:	01010113          	addi	sp,sp,16
    447c:	00008067          	ret

00004480 <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
    4480:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
    4484:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    4488:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    448c:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    4490:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    4494:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    4498:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    449c:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    44a0:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    44a4:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    44a8:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    44ac:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    44b0:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    44b4:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    44b8:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    44bc:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    44c0:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
    44c4:	fc8fd0ef          	jal	1c8c <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
    44c8:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    44cc:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    44d0:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    44d4:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    44d8:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    44dc:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    44e0:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    44e4:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    44e8:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    44ec:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    44f0:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    44f4:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    44f8:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    44fc:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    4500:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    4504:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
    4508:	04010113          	addi	sp,sp,64
#endif
    450c:	30200073          	mret
