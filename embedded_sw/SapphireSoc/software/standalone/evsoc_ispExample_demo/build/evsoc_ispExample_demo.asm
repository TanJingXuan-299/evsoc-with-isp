
build/evsoc_ispExample_demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00004197          	auipc	gp,0x4
    1004:	79818193          	addi	gp,gp,1944 # 5798 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00005117          	auipc	sp,0x5
    100c:	15810113          	addi	sp,sp,344 # 6160 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00003517          	auipc	a0,0x3
    1014:	07050513          	addi	a0,a0,112 # 4080 <_data>
	la a1, _data
    1018:	00003597          	auipc	a1,0x3
    101c:	06858593          	addi	a1,a1,104 # 4080 <_data>
	la a2, _edata
    1020:	00004617          	auipc	a2,0x4
    1024:	fa460613          	addi	a2,a2,-92 # 4fc4 <uart_cmd_ready>
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
    1044:	f8450513          	addi	a0,a0,-124 # 4fc4 <uart_cmd_ready>
	la a1, _end
    1048:	00004597          	auipc	a1,0x4
    104c:	11058593          	addi	a1,a1,272 # 5158 <_end>
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
    109c:	ccd88893          	addi	a7,a7,-819 # 4d65 <_ctype_+0x1>
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
    10dc:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff9e9f>
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
    1178:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff9e9f>
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
    126c:	8101a503          	lw	a0,-2032(gp) # 4fa8 <_impure_ptr>
    1270:	e0dff06f          	j	107c <_strtol_l.isra.0>

00001274 <__errno>:
    1274:	8101a503          	lw	a0,-2032(gp) # 4fa8 <_impure_ptr>
    1278:	00008067          	ret

0000127c <__libc_init_array>:
    127c:	ff010113          	addi	sp,sp,-16
    1280:	00812423          	sw	s0,8(sp)
    1284:	01212023          	sw	s2,0(sp)
    1288:	00003797          	auipc	a5,0x3
    128c:	df878793          	addi	a5,a5,-520 # 4080 <_data>
    1290:	00003417          	auipc	s0,0x3
    1294:	df040413          	addi	s0,s0,-528 # 4080 <_data>
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
    12c8:	dbc78793          	addi	a5,a5,-580 # 4080 <_data>
    12cc:	00003417          	auipc	s0,0x3
    12d0:	db440413          	addi	s0,s0,-588 # 4080 <_data>
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
    131c:	00004537          	lui	a0,0x4
    1320:	50450513          	addi	a0,a0,1284 # 4504 <_data+0x484>
    1324:	048010ef          	jal	236c <bsp_printf>

    cam0_init(I2C_CTRL_CAM0);
    bsp_printf("\n\rDone !!\n\r");

#elif defined(BOARD_Ti60F225)
    bsp_printf("Init Camera.....");
    1328:	00004537          	lui	a0,0x4
    132c:	52850513          	addi	a0,a0,1320 # 4528 <_data+0x4a8>
    1330:	03c010ef          	jal	236c <bsp_printf>
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    1334:	f8100437          	lui	s0,0xf8100
    1338:	00042223          	sw	zero,4(s0) # f8100004 <__freertos_irq_stack_top+0xf80f9ea4>

    // Assert camera reset
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000000);
    bsp_uDelay(100);
    133c:	f8b00637          	lui	a2,0xf8b00
    1340:	05f5e5b7          	lui	a1,0x5f5e
    1344:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    1348:	06400513          	li	a0,100
    134c:	3d1000ef          	jal	1f1c <clint_uDelay>
    1350:	00200793          	li	a5,2
    1354:	00f42223          	sw	a5,4(s0)
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000002);
    bsp_uDelay(1000 * 10);
    1358:	f8b00637          	lui	a2,0xf8b00
    135c:	05f5e5b7          	lui	a1,0x5f5e
    1360:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    1364:	00002537          	lui	a0,0x2
    1368:	71050513          	addi	a0,a0,1808 # 2710 <uart_buffer_read+0xd4>
    136c:	3b1000ef          	jal	1f1c <clint_uDelay>

    cam0_init(I2C_CTRL_CAM0);
    1370:	f8015537          	lui	a0,0xf8015
    1374:	4d0020ef          	jal	3844 <cam0_init>
    1378:	00300793          	li	a5,3
    137c:	00f42223          	sw	a5,4(s0)

    // Indicate camera configuration done
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000003);
    bsp_printf("Done\n\r");
    1380:	00004537          	lui	a0,0x4
    1384:	53c50513          	addi	a0,a0,1340 # 453c <_data+0x4bc>
    1388:	7e5000ef          	jal	236c <bsp_printf>

#endif

    /******************************************************SETUP DMA & UART********************************************************/

    bsp_printf("Init DMA.....");
    138c:	00004537          	lui	a0,0x4
    1390:	54450513          	addi	a0,a0,1348 # 4544 <_data+0x4c4>
    1394:	7d9000ef          	jal	236c <bsp_printf>

    uart_interrupt_init();
    1398:	19c010ef          	jal	2534 <uart_interrupt_init>
    dma_init();
    139c:	079000ef          	jal	1c14 <dma_init>

    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, 0, 0);
    13a0:	00000693          	li	a3,0
    13a4:	00000613          	li	a2,0
    13a8:	00400593          	li	a1,4
    13ac:	f8110537          	lui	a0,0xf8110
    13b0:	7a5000ef          	jal	2354 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, 0, 0);
    13b4:	00000693          	li	a3,0
    13b8:	00000613          	li	a2,0
    13bc:	00300593          	li	a1,3
    13c0:	f8110537          	lui	a0,0xf8110
    13c4:	791000ef          	jal	2354 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, 0, 0);
    13c8:	00000693          	li	a3,0
    13cc:	00000613          	li	a2,0
    13d0:	00200593          	li	a1,2
    13d4:	f8110537          	lui	a0,0xf8110
    13d8:	77d000ef          	jal	2354 <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, 0, 0);
    13dc:	00000693          	li	a3,0
    13e0:	00000613          	li	a2,0
    13e4:	00000593          	li	a1,0
    13e8:	f8110537          	lui	a0,0xf8110
    13ec:	769000ef          	jal	2354 <dmasg_priority>

    bsp_printf("Done !!\n\n\r");
    13f0:	00004537          	lui	a0,0x4
    13f4:	55450513          	addi	a0,a0,1364 # 4554 <_data+0x4d4>
    13f8:	775000ef          	jal	236c <bsp_printf>

    /*******************************************************Trigger Display********************************************************/

    select_demo_mode = 0; // Default
    13fc:	8201aa23          	sw	zero,-1996(gp) # 4fcc <select_demo_mode>

    // To check display functionality
    bsp_printf("Initialize test display content..\n\r");
    1400:	00004537          	lui	a0,0x4
    1404:	56050513          	addi	a0,a0,1376 # 4560 <_data+0x4e0>
    1408:	765000ef          	jal	236c <bsp_printf>

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
    1470:	f0068693          	addi	a3,a3,-256 # ff00 <__freertos_irq_stack_top+0x9da0>
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
    151c:	00160613          	addi	a2,a2,1 # f8b00001 <__freertos_irq_stack_top+0xf8af9ea1>
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
    1530:	00004537          	lui	a0,0x4
    1534:	58450513          	addi	a0,a0,1412 # 4584 <_data+0x504>
    1538:	635000ef          	jal	236c <bsp_printf>

    // SELECT start address of to be displayed data accordingly - Default
    dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    153c:	01000693          	li	a3,16
    1540:	00100637          	lui	a2,0x100
    1544:	00200593          	li	a1,2
    1548:	f8110537          	lui	a0,0xf8110
    154c:	501000ef          	jal	224c <dmasg_input_memory>

    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    1550:	00100793          	li	a5,1
    1554:	00000713          	li	a4,0
    1558:	00000693          	li	a3,0
    155c:	00000613          	li	a2,0
    1560:	00200593          	li	a1,2
    1564:	f8110537          	lui	a0,0xf8110
    1568:	56d000ef          	jal	22d4 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    156c:	00400613          	li	a2,4
    1570:	00200593          	li	a1,2
    1574:	f8110537          	lui	a0,0xf8110
    1578:	5b1000ef          	jal	2328 <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restart
    157c:	00000693          	li	a3,0
    1580:	0011d637          	lui	a2,0x11d
    1584:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116ae0>
    1588:	00200593          	li	a1,2
    158c:	f8110537          	lui	a0,0xf8110
    1590:	571000ef          	jal	2300 <dmasg_direct_start>
    display_mm2s_active = 1;                                                                         // Display always active
    1594:	00100713          	li	a4,1
    1598:	82e1a823          	sw	a4,-2000(gp) # 4fc8 <display_mm2s_active>

    msDelay(5000); // Display test content for 5 seconds
    159c:	00001537          	lui	a0,0x1
    15a0:	38850513          	addi	a0,a0,904 # 1388 <main+0x78>
    15a4:	035000ef          	jal	1dd8 <msDelay>

    bsp_printf("Done !!\n\n\r");
    15a8:	00004537          	lui	a0,0x4
    15ac:	55450513          	addi	a0,a0,1364 # 4554 <_data+0x4d4>
    15b0:	5bd000ef          	jal	236c <bsp_printf>

    ispExample_menu();
    15b4:	5d0010ef          	jal	2b84 <ispExample_menu>

    bsp_printf("Default Demo Mode: a\n\r");
    15b8:	00004537          	lui	a0,0x4
    15bc:	5a050513          	addi	a0,a0,1440 # 45a0 <_data+0x520>
    15c0:	5ad000ef          	jal	236c <bsp_printf>
    15c4:	1040006f          	j	16c8 <main+0x3b8>
    15c8:	f81007b7          	lui	a5,0xf8100
    15cc:	0007a623          	sw	zero,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f9eac>
    }
    15d0:	1100006f          	j	16e0 <main+0x3d0>

        /*******************************************************RISC-V Processing***********************************************************/

        if (select_demo_mode == 1 || select_demo_mode == 2)
        {
            rgb2grayscale(cam_array, grayscale_array, FRAME_WIDTH, FRAME_HEIGHT);
    15d4:	21c00693          	li	a3,540
    15d8:	21c00613          	li	a2,540
    15dc:	005005b7          	lui	a1,0x500
    15e0:	00100537          	lui	a0,0x100
    15e4:	6b9000ef          	jal	249c <rgb2grayscale>
    15e8:	17c0006f          	j	1764 <main+0x454>
        *((volatile u32*) address) = data;
    15ec:	f81207b7          	lui	a5,0xf8120
    15f0:	0007a223          	sw	zero,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119ea4>
                write_u32(0x00000002, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG1_OFFSET); // 2'd2: Sobel+Erosion
            }

            // Trigger HW accel MM2S DMA
            // SELECT start address of DMA input to HW accel block
            dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, CAM_START_ADDR, 16); // Camera pre-processing block performs HW RGB2grayscale conversion
    15f4:	01000693          	li	a3,16
    15f8:	00100637          	lui	a2,0x100
    15fc:	00400593          	li	a1,4
    1600:	f8110537          	lui	a0,0xf8110
    1604:	449000ef          	jal	224c <dmasg_input_memory>
            // dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16); //RISC-V performs SW RGB2grayscale conversion
            dmasg_output_stream(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, DMASG_HW_ACCEL_MM2S_1_PORT, 0, 0, 1);
    1608:	00100793          	li	a5,1
    160c:	00000713          	li	a4,0
    1610:	00000693          	li	a3,0
    1614:	00000613          	li	a2,0
    1618:	00400593          	li	a1,4
    161c:	f8110537          	lui	a0,0xf8110
    1620:	4b5000ef          	jal	22d4 <dmasg_output_stream>

            // SELECT dma transfer length - Make sure match with HW accelerator mode selection
            // Additonal data is required to be fed for line buffer(s) data flushing
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1624:	8341a783          	lw	a5,-1996(gp) # 4fcc <select_demo_mode>
    1628:	00200713          	li	a4,2
    162c:	00e78663          	beq	a5,a4,1638 <main+0x328>
    1630:	00400713          	li	a4,4
    1634:	18e79663          	bne	a5,a4,17c0 <main+0x4b0>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (FRAME_WIDTH + 1)) * 4, 0); // Sobel only
    1638:	00000693          	li	a3,0
    163c:	0011d637          	lui	a2,0x11d
    1640:	4b460613          	addi	a2,a2,1204 # 11d4b4 <__freertos_irq_stack_top+0x117354>
    1644:	00400593          	li	a1,4
    1648:	f8110537          	lui	a0,0xf8110
    164c:	4b5000ef          	jal	2300 <dmasg_direct_start>
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
    1664:	439000ef          	jal	229c <dmasg_input_stream>
            dmasg_output_memory(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, SOBEL_START_ADDR, 16);
    1668:	01000693          	li	a3,16
    166c:	00900637          	lui	a2,0x900
    1670:	00300593          	li	a1,3
    1674:	f8110537          	lui	a0,0xf8110
    1678:	3fd000ef          	jal	2274 <dmasg_output_memory>
            dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    167c:	00000693          	li	a3,0
    1680:	0011d637          	lui	a2,0x11d
    1684:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116ae0>
    1688:	00300593          	li	a1,3
    168c:	f8110537          	lui	a0,0xf8110
    1690:	471000ef          	jal	2300 <dmasg_direct_start>
    1694:	f81207b7          	lui	a5,0xf8120
    1698:	00100713          	li	a4,1
    169c:	00e7a423          	sw	a4,8(a5) # f8120008 <__freertos_irq_stack_top+0xf8119ea8>
    16a0:	0007a423          	sw	zero,8(a5)
            // Indicate start of S2MM DMA to HW accel building block via APB3 slave
            write_u32(0x00000001, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);
            write_u32(0x00000000, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);

            // Wait for DMA transfer completion
            while (dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL) || dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL))
    16a4:	00400593          	li	a1,4
    16a8:	f8110537          	lui	a0,0xf8110
    16ac:	495000ef          	jal	2340 <dmasg_busy>
    16b0:	fe051ae3          	bnez	a0,16a4 <main+0x394>
    16b4:	00300593          	li	a1,3
    16b8:	f8110537          	lui	a0,0xf8110
    16bc:	485000ef          	jal	2340 <dmasg_busy>
    16c0:	fe0512e3          	bnez	a0,16a4 <main+0x394>
    16c4:	0000500f          	.word	0x0000500f
        if (select_demo_mode > 2)
    16c8:	8341a703          	lw	a4,-1996(gp) # 4fcc <select_demo_mode>
    16cc:	00200793          	li	a5,2
    16d0:	eee7fce3          	bgeu	a5,a4,15c8 <main+0x2b8>
    16d4:	f81007b7          	lui	a5,0xf8100
    16d8:	00100713          	li	a4,1
    16dc:	00e7a623          	sw	a4,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f9eac>
        dmasg_input_stream(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, DMASG_CAM1_S2MM_PORT, 1, 0);
    16e0:	00000713          	li	a4,0
    16e4:	00100693          	li	a3,1
    16e8:	00000613          	li	a2,0
    16ec:	00000593          	li	a1,0
    16f0:	f8110537          	lui	a0,0xf8110
    16f4:	3a9000ef          	jal	229c <dmasg_input_stream>
        dmasg_output_memory(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, CAM_START_ADDR, 16);
    16f8:	01000693          	li	a3,16
    16fc:	00100637          	lui	a2,0x100
    1700:	00000593          	li	a1,0
    1704:	f8110537          	lui	a0,0xf8110
    1708:	36d000ef          	jal	2274 <dmasg_output_memory>
        dmasg_direct_start(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    170c:	00000693          	li	a3,0
    1710:	0011d637          	lui	a2,0x11d
    1714:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116ae0>
    1718:	00000593          	li	a1,0
    171c:	f8110537          	lui	a0,0xf8110
    1720:	3e1000ef          	jal	2300 <dmasg_direct_start>
    1724:	f81007b7          	lui	a5,0xf8100
    1728:	00100713          	li	a4,1
    172c:	00e7a823          	sw	a4,16(a5) # f8100010 <__freertos_irq_stack_top+0xf80f9eb0>
    1730:	0007a823          	sw	zero,16(a5)
    1734:	f81007b7          	lui	a5,0xf8100
    1738:	00e7a423          	sw	a4,8(a5) # f8100008 <__freertos_irq_stack_top+0xf80f9ea8>
    173c:	0007a423          	sw	zero,8(a5)
        while (dmasg_busy(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL))
    1740:	00000593          	li	a1,0
    1744:	f8110537          	lui	a0,0xf8110
    1748:	3f9000ef          	jal	2340 <dmasg_busy>
    174c:	fe051ae3          	bnez	a0,1740 <main+0x430>
    1750:	0000500f          	.word	0x0000500f
        if (select_demo_mode == 1 || select_demo_mode == 2)
    1754:	8341a783          	lw	a5,-1996(gp) # 4fcc <select_demo_mode>
    1758:	fff78793          	addi	a5,a5,-1
    175c:	00100713          	li	a4,1
    1760:	e6f77ae3          	bgeu	a4,a5,15d4 <main+0x2c4>
        if (select_demo_mode == 2 || select_demo_mode > 3)
    1764:	8341a783          	lw	a5,-1996(gp) # 4fcc <select_demo_mode>
    1768:	00200713          	li	a4,2
    176c:	00e78663          	beq	a5,a4,1778 <main+0x468>
    1770:	00300713          	li	a4,3
    1774:	f4f77ae3          	bgeu	a4,a5,16c8 <main+0x3b8>
    1778:	f81207b7          	lui	a5,0xf8120
    177c:	00500713          	li	a4,5
    1780:	00e7a023          	sw	a4,0(a5) # f8120000 <__freertos_irq_stack_top+0xf8119ea0>
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1784:	8341a783          	lw	a5,-1996(gp) # 4fcc <select_demo_mode>
    1788:	00200713          	li	a4,2
    178c:	e6e780e3          	beq	a5,a4,15ec <main+0x2dc>
    1790:	00400713          	li	a4,4
    1794:	e4e78ce3          	beq	a5,a4,15ec <main+0x2dc>
            else if (select_demo_mode == 5)
    1798:	00500713          	li	a4,5
    179c:	00e78a63          	beq	a5,a4,17b0 <main+0x4a0>
    17a0:	f81207b7          	lui	a5,0xf8120
    17a4:	00200713          	li	a4,2
    17a8:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119ea4>
    }
    17ac:	e49ff06f          	j	15f4 <main+0x2e4>
        *((volatile u32*) address) = data;
    17b0:	f81207b7          	lui	a5,0xf8120
    17b4:	00100713          	li	a4,1
    17b8:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119ea4>
    }
    17bc:	e39ff06f          	j	15f4 <main+0x2e4>
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
    17c0:	00000693          	li	a3,0
    17c4:	0011e637          	lui	a2,0x11e
    17c8:	d2860613          	addi	a2,a2,-728 # 11dd28 <__freertos_irq_stack_top+0x117bc8>
    17cc:	00400593          	li	a1,4
    17d0:	f8110537          	lui	a0,0xf8110
    17d4:	32d000ef          	jal	2300 <dmasg_direct_start>
    17d8:	e79ff06f          	j	1650 <main+0x340>

000017dc <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    17dc:	00259593          	slli	a1,a1,0x2
    17e0:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    17e4:	00c5a023          	sw	a2,0(a1) # 500000 <__freertos_irq_stack_top+0x4f9ea0>
    }
    17e8:	00008067          	ret

000017ec <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    17ec:	00759593          	slli	a1,a1,0x7
    17f0:	00a585b3          	add	a1,a1,a0
    17f4:	00565793          	srli	a5,a2,0x5
    17f8:	00279793          	slli	a5,a5,0x2
    17fc:	00f587b3          	add	a5,a1,a5
    1800:	00002737          	lui	a4,0x2
    1804:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
    1808:	00100713          	li	a4,1
    180c:	00c71633          	sll	a2,a4,a2
        if (enable)
    1810:	00068a63          	beqz	a3,1824 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    1814:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
    1818:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
    181c:	00c7a023          	sw	a2,0(a5)
    }
    1820:	00008067          	ret
        return *((volatile u32*) address);
    1824:	0007a703          	lw	a4,0(a5)
        else
            write_u32(read_u32(word) & ~mask, word);
    1828:	fff64613          	not	a2,a2
    182c:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
    1830:	00c7a023          	sw	a2,0(a5)
    }
    1834:	00008067          	ret

00001838 <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
    1838:	00c59593          	slli	a1,a1,0xc
    183c:	00a585b3          	add	a1,a1,a0
    1840:	002007b7          	lui	a5,0x200
    1844:	00f585b3          	add	a1,a1,a5
    1848:	00c5a023          	sw	a2,0(a1)
    }
    184c:	00008067          	ret

00001850 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1850:	00452503          	lw	a0,4(a0) # f8110004 <__freertos_irq_stack_top+0xf8109ea4>
*          of available spaces for writing data from bits 23 to 16. It then
*          returns this value after masking with 0xFF.
*
******************************************************************************/
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1854:	01055513          	srli	a0,a0,0x10
    }
    1858:	0ff57513          	zext.b	a0,a0
    185c:	00008067          	ret

00001860 <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
    1860:	ff010113          	addi	sp,sp,-16
    1864:	00112623          	sw	ra,12(sp)
    1868:	00812423          	sw	s0,8(sp)
    186c:	00912223          	sw	s1,4(sp)
    1870:	00050413          	mv	s0,a0
    1874:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1878:	00040513          	mv	a0,s0
    187c:	fd5ff0ef          	jal	1850 <uart_writeAvailability>
    1880:	fe050ce3          	beqz	a0,1878 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1884:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
    1888:	00c12083          	lw	ra,12(sp)
    188c:	00812403          	lw	s0,8(sp)
    1890:	00412483          	lw	s1,4(sp)
    1894:	01010113          	addi	sp,sp,16
    1898:	00008067          	ret

0000189c <_putchar>:
#include <math.h>
#include <string.h>
#include "bsp.h"

#if (ENABLE_BSP_PRINTF)
    static void _putchar(char character){
    189c:	ff010113          	addi	sp,sp,-16
    18a0:	00112623          	sw	ra,12(sp)
    18a4:	00050593          	mv	a1,a0
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
    18a8:	f8010537          	lui	a0,0xf8010
    18ac:	fb5ff0ef          	jal	1860 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    18b0:	00c12083          	lw	ra,12(sp)
    18b4:	01010113          	addi	sp,sp,16
    18b8:	00008067          	ret

000018bc <_putchar_s>:

    static void _putchar_s(char *p)
    {
    18bc:	ff010113          	addi	sp,sp,-16
    18c0:	00112623          	sw	ra,12(sp)
    18c4:	00812423          	sw	s0,8(sp)
    18c8:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
    18cc:	00c0006f          	j	18d8 <_putchar_s+0x1c>
            _putchar(*(p++));
    18d0:	00140413          	addi	s0,s0,1
    18d4:	fc9ff0ef          	jal	189c <_putchar>
        while (*p)
    18d8:	00044503          	lbu	a0,0(s0)
    18dc:	fe051ae3          	bnez	a0,18d0 <_putchar_s+0x14>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
    18e0:	00c12083          	lw	ra,12(sp)
    18e4:	00812403          	lw	s0,8(sp)
    18e8:	01010113          	addi	sp,sp,16
    18ec:	00008067          	ret

000018f0 <bsp_printHex>:

        static void bsp_printHex(uint32_t val)
    {
    18f0:	ff010113          	addi	sp,sp,-16
    18f4:	00112623          	sw	ra,12(sp)
    18f8:	00812423          	sw	s0,8(sp)
    18fc:	00912223          	sw	s1,4(sp)
    1900:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1904:	01c00413          	li	s0,28
    1908:	0240006f          	j	192c <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    190c:	0084d733          	srl	a4,s1,s0
    1910:	00f77713          	andi	a4,a4,15
    1914:	000047b7          	lui	a5,0x4
    1918:	08078793          	addi	a5,a5,128 # 4080 <_data>
    191c:	00e787b3          	add	a5,a5,a4
    1920:	0007c503          	lbu	a0,0(a5)
    1924:	f79ff0ef          	jal	189c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1928:	ffc40413          	addi	s0,s0,-4
    192c:	fe0450e3          	bgez	s0,190c <bsp_printHex+0x1c>
        }
    }
    1930:	00c12083          	lw	ra,12(sp)
    1934:	00812403          	lw	s0,8(sp)
    1938:	00412483          	lw	s1,4(sp)
    193c:	01010113          	addi	sp,sp,16
    1940:	00008067          	ret

00001944 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
    {
    1944:	ff010113          	addi	sp,sp,-16
    1948:	00112623          	sw	ra,12(sp)
    194c:	00812423          	sw	s0,8(sp)
    1950:	00912223          	sw	s1,4(sp)
    1954:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1958:	01c00413          	li	s0,28
    195c:	0240006f          	j	1980 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    1960:	0084d733          	srl	a4,s1,s0
    1964:	00f77713          	andi	a4,a4,15
    1968:	000047b7          	lui	a5,0x4
    196c:	09478793          	addi	a5,a5,148 # 4094 <_data+0x14>
    1970:	00e787b3          	add	a5,a5,a4
    1974:	0007c503          	lbu	a0,0(a5)
    1978:	f25ff0ef          	jal	189c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    197c:	ffc40413          	addi	s0,s0,-4
    1980:	fe0450e3          	bgez	s0,1960 <bsp_printHex_lower+0x1c>

        }
    }
    1984:	00c12083          	lw	ra,12(sp)
    1988:	00812403          	lw	s0,8(sp)
    198c:	00412483          	lw	s1,4(sp)
    1990:	01010113          	addi	sp,sp,16
    1994:	00008067          	ret

00001998 <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
    1998:	ff010113          	addi	sp,sp,-16
    199c:	00112623          	sw	ra,12(sp)
        _putchar(c);
    19a0:	0ff57513          	zext.b	a0,a0
    19a4:	ef9ff0ef          	jal	189c <_putchar>
    }
    19a8:	00c12083          	lw	ra,12(sp)
    19ac:	01010113          	addi	sp,sp,16
    19b0:	00008067          	ret

000019b4 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
    19b4:	ff010113          	addi	sp,sp,-16
    19b8:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    19bc:	f01ff0ef          	jal	18bc <_putchar_s>
    }
    19c0:	00c12083          	lw	ra,12(sp)
    19c4:	01010113          	addi	sp,sp,16
    19c8:	00008067          	ret

000019cc <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
    19cc:	fd010113          	addi	sp,sp,-48
    19d0:	02112623          	sw	ra,44(sp)
    19d4:	02812423          	sw	s0,40(sp)
    19d8:	02912223          	sw	s1,36(sp)
    19dc:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
    19e0:	00054663          	bltz	a0,19ec <bsp_printf_d+0x20>
    {
    19e4:	00010413          	mv	s0,sp
    19e8:	02c0006f          	j	1a14 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    19ec:	02d00513          	li	a0,45
    19f0:	fa9ff0ef          	jal	1998 <bsp_printf_c>
            val = -val;
    19f4:	409004b3          	neg	s1,s1
    19f8:	fedff06f          	j	19e4 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
    19fc:	00a00713          	li	a4,10
    1a00:	02e4e7b3          	rem	a5,s1,a4
    1a04:	03078793          	addi	a5,a5,48
    1a08:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    1a0c:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    1a10:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    1a14:	fe0494e3          	bnez	s1,19fc <bsp_printf_d+0x30>
    1a18:	00010793          	mv	a5,sp
    1a1c:	fef400e3          	beq	s0,a5,19fc <bsp_printf_d+0x30>
        }
        while (p != buffer)
    1a20:	00010793          	mv	a5,sp
    1a24:	00f40a63          	beq	s0,a5,1a38 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    1a28:	fff40413          	addi	s0,s0,-1
    1a2c:	00044503          	lbu	a0,0(s0)
    1a30:	f69ff0ef          	jal	1998 <bsp_printf_c>
    1a34:	fedff06f          	j	1a20 <bsp_printf_d+0x54>
    }
    1a38:	02c12083          	lw	ra,44(sp)
    1a3c:	02812403          	lw	s0,40(sp)
    1a40:	02412483          	lw	s1,36(sp)
    1a44:	03010113          	addi	sp,sp,48
    1a48:	00008067          	ret

00001a4c <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
    1a4c:	ff010113          	addi	sp,sp,-16
    1a50:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
    1a54:	00000713          	li	a4,0
    1a58:	00700793          	li	a5,7
    1a5c:	02e7c063          	blt	a5,a4,1a7c <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1a60:	00271693          	slli	a3,a4,0x2
    1a64:	ff000793          	li	a5,-16
    1a68:	00d797b3          	sll	a5,a5,a3
    1a6c:	00f577b3          	and	a5,a0,a5
    1a70:	00078663          	beqz	a5,1a7c <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    1a74:	00170713          	addi	a4,a4,1 # 2001 <bsp_printHex_lower+0x9>
    1a78:	fe1ff06f          	j	1a58 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
    1a7c:	ec9ff0ef          	jal	1944 <bsp_printHex_lower>
    }
    1a80:	00c12083          	lw	ra,12(sp)
    1a84:	01010113          	addi	sp,sp,16
    1a88:	00008067          	ret

00001a8c <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
    1a8c:	ff010113          	addi	sp,sp,-16
    1a90:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
    1a94:	00000713          	li	a4,0
    1a98:	00700793          	li	a5,7
    1a9c:	02e7c063          	blt	a5,a4,1abc <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    1aa0:	00271693          	slli	a3,a4,0x2
    1aa4:	ff000793          	li	a5,-16
    1aa8:	00d797b3          	sll	a5,a5,a3
    1aac:	00f577b3          	and	a5,a0,a5
    1ab0:	00078663          	beqz	a5,1abc <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    1ab4:	00170713          	addi	a4,a4,1
    1ab8:	fe1ff06f          	j	1a98 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
    1abc:	e35ff0ef          	jal	18f0 <bsp_printHex>
        }
    1ac0:	00c12083          	lw	ra,12(sp)
    1ac4:	01010113          	addi	sp,sp,16
    1ac8:	00008067          	ret

00001acc <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
    1acc:	fc010113          	addi	sp,sp,-64
    1ad0:	00112e23          	sw	ra,28(sp)
    1ad4:	00812c23          	sw	s0,24(sp)
    1ad8:	00912a23          	sw	s1,20(sp)
    1adc:	00050493          	mv	s1,a0
    1ae0:	02b12223          	sw	a1,36(sp)
    1ae4:	02c12423          	sw	a2,40(sp)
    1ae8:	02d12623          	sw	a3,44(sp)
    1aec:	02e12823          	sw	a4,48(sp)
    1af0:	02f12a23          	sw	a5,52(sp)
    1af4:	03012c23          	sw	a6,56(sp)
    1af8:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
    1afc:	02410793          	addi	a5,sp,36
    1b00:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
    1b04:	00000413          	li	s0,0
    1b08:	01c0006f          	j	1b24 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
    1b0c:	00c12783          	lw	a5,12(sp)
    1b10:	00478713          	addi	a4,a5,4
    1b14:	00e12623          	sw	a4,12(sp)
    1b18:	0007a503          	lw	a0,0(a5)
    1b1c:	e7dff0ef          	jal	1998 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    1b20:	00140413          	addi	s0,s0,1
    1b24:	008487b3          	add	a5,s1,s0
    1b28:	0007c503          	lbu	a0,0(a5)
    1b2c:	0a050e63          	beqz	a0,1be8 <bsp_printf+0x11c>
            if (format[i] == '%') {
    1b30:	02500793          	li	a5,37
    1b34:	06f50e63          	beq	a0,a5,1bb0 <bsp_printf+0xe4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
    1b38:	e61ff0ef          	jal	1998 <bsp_printf_c>
    1b3c:	fe5ff06f          	j	1b20 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    1b40:	00c12783          	lw	a5,12(sp)
    1b44:	00478713          	addi	a4,a5,4
    1b48:	00e12623          	sw	a4,12(sp)
    1b4c:	0007a503          	lw	a0,0(a5)
    1b50:	e65ff0ef          	jal	19b4 <bsp_printf_s>
                        break;
    1b54:	fcdff06f          	j	1b20 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    1b58:	00c12783          	lw	a5,12(sp)
    1b5c:	00478713          	addi	a4,a5,4
    1b60:	00e12623          	sw	a4,12(sp)
    1b64:	0007a503          	lw	a0,0(a5)
    1b68:	e65ff0ef          	jal	19cc <bsp_printf_d>
                        break;
    1b6c:	fb5ff06f          	j	1b20 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    1b70:	00c12783          	lw	a5,12(sp)
    1b74:	00478713          	addi	a4,a5,4
    1b78:	00e12623          	sw	a4,12(sp)
    1b7c:	0007a503          	lw	a0,0(a5)
    1b80:	f0dff0ef          	jal	1a8c <bsp_printf_X>
                        break;
    1b84:	f9dff06f          	j	1b20 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    1b88:	00c12783          	lw	a5,12(sp)
    1b8c:	00478713          	addi	a4,a5,4
    1b90:	00e12623          	sw	a4,12(sp)
    1b94:	0007a503          	lw	a0,0(a5)
    1b98:	eb5ff0ef          	jal	1a4c <bsp_printf_x>
                        break;
    1b9c:	f85ff06f          	j	1b20 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    1ba0:	00004537          	lui	a0,0x4
    1ba4:	0a850513          	addi	a0,a0,168 # 40a8 <_data+0x28>
    1ba8:	e0dff0ef          	jal	19b4 <bsp_printf_s>
                        break;
    1bac:	f75ff06f          	j	1b20 <bsp_printf+0x54>
                while (format[++i]) {
    1bb0:	00140413          	addi	s0,s0,1
    1bb4:	008487b3          	add	a5,s1,s0
    1bb8:	0007c783          	lbu	a5,0(a5)
    1bbc:	f60782e3          	beqz	a5,1b20 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    1bc0:	fa878793          	addi	a5,a5,-88
    1bc4:	0ff7f693          	zext.b	a3,a5
    1bc8:	02000713          	li	a4,32
    1bcc:	fed762e3          	bltu	a4,a3,1bb0 <bsp_printf+0xe4>
    1bd0:	00269793          	slli	a5,a3,0x2
    1bd4:	00004737          	lui	a4,0x4
    1bd8:	63470713          	addi	a4,a4,1588 # 4634 <_data+0x5b4>
    1bdc:	00e787b3          	add	a5,a5,a4
    1be0:	0007a783          	lw	a5,0(a5)
    1be4:	00078067          	jr	a5

        va_end(ap);
    }
    1be8:	01c12083          	lw	ra,28(sp)
    1bec:	01812403          	lw	s0,24(sp)
    1bf0:	01412483          	lw	s1,20(sp)
    1bf4:	04010113          	addi	sp,sp,64
    1bf8:	00008067          	ret

00001bfc <crash>:
#include "uart.h"
#include "bsp.h"

// crash() and trap()
void crash()
{
    1bfc:	ff010113          	addi	sp,sp,-16
    1c00:	00112623          	sw	ra,12(sp)
    bsp_printf("\n*** CRASH ***\n");
    1c04:	00004537          	lui	a0,0x4
    1c08:	0f450513          	addi	a0,a0,244 # 40f4 <_data+0x74>
    1c0c:	ec1ff0ef          	jal	1acc <bsp_printf>
    while (1)
    1c10:	0000006f          	j	1c10 <crash+0x14>

00001c14 <dma_init>:
        ;
}

void dma_init()
{
    1c14:	ff010113          	addi	sp,sp,-16
    1c18:	00112623          	sw	ra,12(sp)
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0);
    1c1c:	00000613          	li	a2,0
    1c20:	00000593          	li	a1,0
    1c24:	f8c00537          	lui	a0,0xf8c00
    1c28:	c11ff0ef          	jal	1838 <plic_set_threshold>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, PLIC_DMASG_CHANNEL, 1);
    1c2c:	00100693          	li	a3,1
    1c30:	00600613          	li	a2,6
    1c34:	00000593          	li	a1,0
    1c38:	f8c00537          	lui	a0,0xf8c00
    1c3c:	bb1ff0ef          	jal	17ec <plic_set_enable>
    plic_set_priority(BSP_PLIC, PLIC_DMASG_CHANNEL, 1);
    1c40:	00100613          	li	a2,1
    1c44:	00600593          	li	a1,6
    1c48:	f8c00537          	lui	a0,0xf8c00
    1c4c:	b91ff0ef          	jal	17dc <plic_set_priority>
    csr_write(mtvec, trap_entry);
    1c50:	000047b7          	lui	a5,0x4
    1c54:	ff078793          	addi	a5,a5,-16 # 3ff0 <trap_entry>
    1c58:	30579073          	csrw	mtvec,a5
    csr_set(mie, MIE_MEIE);
    1c5c:	000017b7          	lui	a5,0x1
    1c60:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM2+0x7a5>
    1c64:	3047a073          	csrs	mie,a5
    csr_write(mstatus, csr_read(mstatus) | MSTATUS_MPP | MSTATUS_MIE);
    1c68:	300027f3          	csrr	a5,mstatus
    1c6c:	00002737          	lui	a4,0x2
    1c70:	80870713          	addi	a4,a4,-2040 # 1808 <plic_set_enable+0x1c>
    1c74:	00e7e7b3          	or	a5,a5,a4
    1c78:	30079073          	csrw	mstatus,a5
}
    1c7c:	00c12083          	lw	ra,12(sp)
    1c80:	01010113          	addi	sp,sp,16
    1c84:	00008067          	ret

00001c88 <trap>:

// defined in main.c
extern void externalInterrupt();

void trap()
{
    1c88:	ff010113          	addi	sp,sp,-16
    1c8c:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
    1c90:	342027f3          	csrr	a5,mcause
    int32_t interrupt = mcause < 0;
    int32_t cause = mcause & 0xF;
    if (interrupt)
    1c94:	0207d263          	bgez	a5,1cb8 <trap+0x30>
    1c98:	00f7f713          	andi	a4,a5,15
    {
        switch (cause)
    1c9c:	00b00793          	li	a5,11
    1ca0:	00f71a63          	bne	a4,a5,1cb4 <trap+0x2c>
        {
        case CAUSE_MACHINE_EXTERNAL:
            externalInterrupt();
    1ca4:	65d000ef          	jal	2b00 <externalInterrupt>
    }
    else
    {
        crash();
    }
    1ca8:	00c12083          	lw	ra,12(sp)
    1cac:	01010113          	addi	sp,sp,16
    1cb0:	00008067          	ret
            crash();
    1cb4:	f49ff0ef          	jal	1bfc <crash>
        crash();
    1cb8:	f45ff0ef          	jal	1bfc <crash>

00001cbc <uart_writeAvailability>:
        return *((volatile u32*) address);
    1cbc:	00452503          	lw	a0,4(a0) # f8c00004 <__freertos_irq_stack_top+0xf8bf9ea4>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1cc0:	01055513          	srli	a0,a0,0x10
    }
    1cc4:	0ff57513          	zext.b	a0,a0
    1cc8:	00008067          	ret

00001ccc <uart_write>:
    static void uart_write(u32 reg, char data){
    1ccc:	ff010113          	addi	sp,sp,-16
    1cd0:	00112623          	sw	ra,12(sp)
    1cd4:	00812423          	sw	s0,8(sp)
    1cd8:	00912223          	sw	s1,4(sp)
    1cdc:	00050413          	mv	s0,a0
    1ce0:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1ce4:	00040513          	mv	a0,s0
    1ce8:	fd5ff0ef          	jal	1cbc <uart_writeAvailability>
    1cec:	fe050ce3          	beqz	a0,1ce4 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1cf0:	00942023          	sw	s1,0(s0)
    }
    1cf4:	00c12083          	lw	ra,12(sp)
    1cf8:	00812403          	lw	s0,8(sp)
    1cfc:	00412483          	lw	s1,4(sp)
    1d00:	01010113          	addi	sp,sp,16
    1d04:	00008067          	ret

00001d08 <uart_writeStr>:
*
* @note    The function iterates through each character of the string and writes
*          them one by one to the UART buffer using the uart_write function.
*
******************************************************************************/
    static void uart_writeStr(u32 reg, const char* str){
    1d08:	ff010113          	addi	sp,sp,-16
    1d0c:	00112623          	sw	ra,12(sp)
    1d10:	00812423          	sw	s0,8(sp)
    1d14:	00912223          	sw	s1,4(sp)
    1d18:	00050493          	mv	s1,a0
    1d1c:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    1d20:	0100006f          	j	1d30 <uart_writeStr+0x28>
    1d24:	00140413          	addi	s0,s0,1
    1d28:	00048513          	mv	a0,s1
    1d2c:	fa1ff0ef          	jal	1ccc <uart_write>
    1d30:	00044583          	lbu	a1,0(s0)
    1d34:	fe0598e3          	bnez	a1,1d24 <uart_writeStr+0x1c>
    }
    1d38:	00c12083          	lw	ra,12(sp)
    1d3c:	00812403          	lw	s0,8(sp)
    1d40:	00412483          	lw	s1,4(sp)
    1d44:	01010113          	addi	sp,sp,16
    1d48:	00008067          	ret

00001d4c <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
    1d4c:	000f47b7          	lui	a5,0xf4
    1d50:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xee0e0>
    1d54:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1d58:	0000c7b7          	lui	a5,0xc
    1d5c:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5e98>
    1d60:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1d64:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1d68:	02a585b3          	mul	a1,a1,a0
    1d6c:	00f58733          	add	a4,a1,a5
    1d70:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    1d74:	40f707b3          	sub	a5,a4,a5
    1d78:	fe07dce3          	bgez	a5,1d70 <clint_uDelay+0x24>
    1d7c:	00008067          	ret

00001d80 <i2c_applyConfig>:
*
* @return       None.
*
******************************************************************************/
    static void i2c_applyConfig(u32 reg, I2c_Config *config){
        write_u32(config->samplingClockDivider, reg + I2C_SAMPLING_CLOCK_DIVIDER);
    1d80:	0005a783          	lw	a5,0(a1)
        *((volatile u32*) address) = data;
    1d84:	02f52423          	sw	a5,40(a0)
        write_u32(config->timeout, reg + I2C_TIMEOUT);
    1d88:	0045a783          	lw	a5,4(a1)
    1d8c:	02f52623          	sw	a5,44(a0)
        write_u32(config->tsuDat, reg + I2C_TSUDAT);
    1d90:	0085a783          	lw	a5,8(a1)
    1d94:	02f52823          	sw	a5,48(a0)
        write_u32(config->tLow, reg + I2C_TLOW);
    1d98:	00c5a783          	lw	a5,12(a1)
    1d9c:	04f52823          	sw	a5,80(a0)
        write_u32(config->tHigh, reg + I2C_THIGH);
    1da0:	0105a783          	lw	a5,16(a1)
    1da4:	04f52a23          	sw	a5,84(a0)
        write_u32(config->tBuf, reg + I2C_TBUF);
    1da8:	0145a783          	lw	a5,20(a1)
    1dac:	04f52c23          	sw	a5,88(a0)
    }
    1db0:	00008067          	ret

00001db4 <assert>:
	return data;
}

void assert(int cond)
{
	if (!cond)
    1db4:	00050463          	beqz	a0,1dbc <assert+0x8>
    1db8:	00008067          	ret
{
    1dbc:	ff010113          	addi	sp,sp,-16
    1dc0:	00112623          	sw	ra,12(sp)
	{
		uart_writeStr(BSP_UART_TERMINAL, "Assert failure\n");
    1dc4:	000045b7          	lui	a1,0x4
    1dc8:	10458593          	addi	a1,a1,260 # 4104 <_data+0x84>
    1dcc:	f8010537          	lui	a0,0xf8010
    1dd0:	f39ff0ef          	jal	1d08 <uart_writeStr>
		while (1)
    1dd4:	0000006f          	j	1dd4 <assert+0x20>

00001dd8 <msDelay>:
		}
	}
}

void msDelay(u32 ms)
{
    1dd8:	ff010113          	addi	sp,sp,-16
    1ddc:	00112623          	sw	ra,12(sp)
	bsp_uDelay(ms * 1000);
    1de0:	f8b00637          	lui	a2,0xf8b00
    1de4:	05f5e5b7          	lui	a1,0x5f5e
    1de8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    1dec:	3e800793          	li	a5,1000
    1df0:	02f50533          	mul	a0,a0,a5
    1df4:	f59ff0ef          	jal	1d4c <clint_uDelay>
}
    1df8:	00c12083          	lw	ra,12(sp)
    1dfc:	01010113          	addi	sp,sp,16
    1e00:	00008067          	ret

00001e04 <mipi_i2c_init>:
		}
	}
}

void mipi_i2c_init(u32 i2cCtrl)
{
    1e04:	fd010113          	addi	sp,sp,-48
    1e08:	02112623          	sw	ra,44(sp)
	// I2C init
	I2c_Config i2c_mipi;
	i2c_mipi.samplingClockDivider = 3;
    1e0c:	00300793          	li	a5,3
    1e10:	00f12423          	sw	a5,8(sp)
	i2c_mipi.timeout = I2C_CTRL_HZ / 1000;
    1e14:	000187b7          	lui	a5,0x18
    1e18:	6a078793          	addi	a5,a5,1696 # 186a0 <__freertos_irq_stack_top+0x12540>
    1e1c:	00f12623          	sw	a5,12(sp)
	i2c_mipi.tsuDat = I2C_CTRL_HZ / 2000000;
    1e20:	03200793          	li	a5,50
    1e24:	00f12823          	sw	a5,16(sp)

	i2c_mipi.tLow = I2C_CTRL_HZ / 800000;
    1e28:	07d00793          	li	a5,125
    1e2c:	00f12a23          	sw	a5,20(sp)
	i2c_mipi.tHigh = I2C_CTRL_HZ / 800000;
    1e30:	00f12c23          	sw	a5,24(sp)
	i2c_mipi.tBuf = I2C_CTRL_HZ / 400000;
    1e34:	0fa00793          	li	a5,250
    1e38:	00f12e23          	sw	a5,28(sp)

	i2c_applyConfig(i2cCtrl, &i2c_mipi);
    1e3c:	00810593          	addi	a1,sp,8
    1e40:	f41ff0ef          	jal	1d80 <i2c_applyConfig>
}
    1e44:	02c12083          	lw	ra,44(sp)
    1e48:	03010113          	addi	sp,sp,48
    1e4c:	00008067          	ret

00001e50 <uart_writeAvailability>:
        return *((volatile u32*) address);
    1e50:	00452503          	lw	a0,4(a0) # f8010004 <__freertos_irq_stack_top+0xf8009ea4>
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    1e54:	01055513          	srli	a0,a0,0x10
    }
    1e58:	0ff57513          	zext.b	a0,a0
    1e5c:	00008067          	ret

00001e60 <uart_readOccupancy>:
    1e60:	00452503          	lw	a0,4(a0)
    }
    1e64:	01855513          	srli	a0,a0,0x18
    1e68:	00008067          	ret

00001e6c <uart_write>:
    static void uart_write(u32 reg, char data){
    1e6c:	ff010113          	addi	sp,sp,-16
    1e70:	00112623          	sw	ra,12(sp)
    1e74:	00812423          	sw	s0,8(sp)
    1e78:	00912223          	sw	s1,4(sp)
    1e7c:	00050413          	mv	s0,a0
    1e80:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    1e84:	00040513          	mv	a0,s0
    1e88:	fc9ff0ef          	jal	1e50 <uart_writeAvailability>
    1e8c:	fe050ce3          	beqz	a0,1e84 <uart_write+0x18>
        *((volatile u32*) address) = data;
    1e90:	00942023          	sw	s1,0(s0)
    }
    1e94:	00c12083          	lw	ra,12(sp)
    1e98:	00812403          	lw	s0,8(sp)
    1e9c:	00412483          	lw	s1,4(sp)
    1ea0:	01010113          	addi	sp,sp,16
    1ea4:	00008067          	ret

00001ea8 <uart_read>:
* @note    The function waits until there is data available in the UART buffer
*          for reading. Once data is available, it reads the character data from
*          the UART data register and returns it.
*
******************************************************************************/
    static char uart_read(u32 reg){
    1ea8:	ff010113          	addi	sp,sp,-16
    1eac:	00112623          	sw	ra,12(sp)
    1eb0:	00812423          	sw	s0,8(sp)
    1eb4:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
    1eb8:	00040513          	mv	a0,s0
    1ebc:	fa5ff0ef          	jal	1e60 <uart_readOccupancy>
    1ec0:	fe050ce3          	beqz	a0,1eb8 <uart_read+0x10>
        return *((volatile u32*) address);
    1ec4:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
    1ec8:	0ff57513          	zext.b	a0,a0
    1ecc:	00c12083          	lw	ra,12(sp)
    1ed0:	00812403          	lw	s0,8(sp)
    1ed4:	01010113          	addi	sp,sp,16
    1ed8:	00008067          	ret

00001edc <uart_applyConfig>:
*          value using data length, parity, and stop bit settings from the configuration
*          structure, and writes this value to the UART frame configuration register.
*
******************************************************************************/
    static void uart_applyConfig(u32 reg, Uart_Config *config){
        write_u32(config->clockDivider, reg + UART_CLOCK_DIVIDER);
    1edc:	00c5a783          	lw	a5,12(a1)
        *((volatile u32*) address) = data;
    1ee0:	00f52423          	sw	a5,8(a0)
        write_u32(((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16), reg + UART_FRAME_CONFIG);
    1ee4:	0005a783          	lw	a5,0(a1)
    1ee8:	fff78793          	addi	a5,a5,-1
    1eec:	0045a703          	lw	a4,4(a1)
    1ef0:	00871713          	slli	a4,a4,0x8
    1ef4:	00e7e7b3          	or	a5,a5,a4
    1ef8:	0085a703          	lw	a4,8(a1)
    1efc:	01071713          	slli	a4,a4,0x10
    1f00:	00e7e7b3          	or	a5,a5,a4
    1f04:	00f52623          	sw	a5,12(a0)
    }
    1f08:	00008067          	ret

00001f0c <uart_status_read>:
        return *((volatile u32*) address);
    1f0c:	00452503          	lw	a0,4(a0)
*
******************************************************************************/    
    static u32 uart_status_read(u32 reg)
     {
    	 return read_u32(reg+UART_STATUS);
     }
    1f10:	00008067          	ret

00001f14 <uart_status_write>:
        *((volatile u32*) address) = data;
    1f14:	00b52223          	sw	a1,4(a0)
*
******************************************************************************/
    static void uart_status_write(u32 reg, char data)
    {
    	write_u32(data ,reg+UART_STATUS);
    }
    1f18:	00008067          	ret

00001f1c <clint_uDelay>:
        u32 mTimePerUsec = hz/1000000;
    1f1c:	000f47b7          	lui	a5,0xf4
    1f20:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xee0e0>
    1f24:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1f28:	0000c7b7          	lui	a5,0xc
    1f2c:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5e98>
    1f30:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1f34:	00062783          	lw	a5,0(a2) # f8b00000 <__freertos_irq_stack_top+0xf8af9ea0>
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
    1f38:	02a585b3          	mul	a1,a1,a0
    1f3c:	00f58733          	add	a4,a1,a5
    1f40:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
    1f44:	40f707b3          	sub	a5,a4,a5
    1f48:	fe07dce3          	bgez	a5,1f40 <clint_uDelay+0x24>
    1f4c:	00008067          	ret

00001f50 <_putchar>:
    static void _putchar(char character){
    1f50:	ff010113          	addi	sp,sp,-16
    1f54:	00112623          	sw	ra,12(sp)
    1f58:	00050593          	mv	a1,a0
            bsp_putChar(character);
    1f5c:	f8010537          	lui	a0,0xf8010
    1f60:	f0dff0ef          	jal	1e6c <uart_write>
    }
    1f64:	00c12083          	lw	ra,12(sp)
    1f68:	01010113          	addi	sp,sp,16
    1f6c:	00008067          	ret

00001f70 <_putchar_s>:
    {
    1f70:	ff010113          	addi	sp,sp,-16
    1f74:	00112623          	sw	ra,12(sp)
    1f78:	00812423          	sw	s0,8(sp)
    1f7c:	00050413          	mv	s0,a0
        while (*p)
    1f80:	00c0006f          	j	1f8c <_putchar_s+0x1c>
            _putchar(*(p++));
    1f84:	00140413          	addi	s0,s0,1
    1f88:	fc9ff0ef          	jal	1f50 <_putchar>
        while (*p)
    1f8c:	00044503          	lbu	a0,0(s0)
    1f90:	fe051ae3          	bnez	a0,1f84 <_putchar_s+0x14>
    }
    1f94:	00c12083          	lw	ra,12(sp)
    1f98:	00812403          	lw	s0,8(sp)
    1f9c:	01010113          	addi	sp,sp,16
    1fa0:	00008067          	ret

00001fa4 <bsp_printHex>:
    {
    1fa4:	ff010113          	addi	sp,sp,-16
    1fa8:	00112623          	sw	ra,12(sp)
    1fac:	00812423          	sw	s0,8(sp)
    1fb0:	00912223          	sw	s1,4(sp)
    1fb4:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1fb8:	01c00413          	li	s0,28
    1fbc:	0240006f          	j	1fe0 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    1fc0:	0084d733          	srl	a4,s1,s0
    1fc4:	00f77713          	andi	a4,a4,15
    1fc8:	000047b7          	lui	a5,0x4
    1fcc:	08078793          	addi	a5,a5,128 # 4080 <_data>
    1fd0:	00e787b3          	add	a5,a5,a4
    1fd4:	0007c503          	lbu	a0,0(a5)
    1fd8:	f79ff0ef          	jal	1f50 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    1fdc:	ffc40413          	addi	s0,s0,-4
    1fe0:	fe0450e3          	bgez	s0,1fc0 <bsp_printHex+0x1c>
    }
    1fe4:	00c12083          	lw	ra,12(sp)
    1fe8:	00812403          	lw	s0,8(sp)
    1fec:	00412483          	lw	s1,4(sp)
    1ff0:	01010113          	addi	sp,sp,16
    1ff4:	00008067          	ret

00001ff8 <bsp_printHex_lower>:
    {
    1ff8:	ff010113          	addi	sp,sp,-16
    1ffc:	00112623          	sw	ra,12(sp)
    2000:	00812423          	sw	s0,8(sp)
    2004:	00912223          	sw	s1,4(sp)
    2008:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    200c:	01c00413          	li	s0,28
    2010:	0240006f          	j	2034 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    2014:	0084d733          	srl	a4,s1,s0
    2018:	00f77713          	andi	a4,a4,15
    201c:	000047b7          	lui	a5,0x4
    2020:	09478793          	addi	a5,a5,148 # 4094 <_data+0x14>
    2024:	00e787b3          	add	a5,a5,a4
    2028:	0007c503          	lbu	a0,0(a5)
    202c:	f25ff0ef          	jal	1f50 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    2030:	ffc40413          	addi	s0,s0,-4
    2034:	fe0450e3          	bgez	s0,2014 <bsp_printHex_lower+0x1c>
    }
    2038:	00c12083          	lw	ra,12(sp)
    203c:	00812403          	lw	s0,8(sp)
    2040:	00412483          	lw	s1,4(sp)
    2044:	01010113          	addi	sp,sp,16
    2048:	00008067          	ret

0000204c <bsp_printf_c>:
    {
    204c:	ff010113          	addi	sp,sp,-16
    2050:	00112623          	sw	ra,12(sp)
        _putchar(c);
    2054:	0ff57513          	zext.b	a0,a0
    2058:	ef9ff0ef          	jal	1f50 <_putchar>
    }
    205c:	00c12083          	lw	ra,12(sp)
    2060:	01010113          	addi	sp,sp,16
    2064:	00008067          	ret

00002068 <bsp_printf_s>:
    {
    2068:	ff010113          	addi	sp,sp,-16
    206c:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    2070:	f01ff0ef          	jal	1f70 <_putchar_s>
    }
    2074:	00c12083          	lw	ra,12(sp)
    2078:	01010113          	addi	sp,sp,16
    207c:	00008067          	ret

00002080 <bsp_printf_d>:
    {
    2080:	fd010113          	addi	sp,sp,-48
    2084:	02112623          	sw	ra,44(sp)
    2088:	02812423          	sw	s0,40(sp)
    208c:	02912223          	sw	s1,36(sp)
    2090:	00050493          	mv	s1,a0
        if (val < 0) {
    2094:	00054663          	bltz	a0,20a0 <bsp_printf_d+0x20>
    {
    2098:	00010413          	mv	s0,sp
    209c:	02c0006f          	j	20c8 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    20a0:	02d00513          	li	a0,45
    20a4:	fa9ff0ef          	jal	204c <bsp_printf_c>
            val = -val;
    20a8:	409004b3          	neg	s1,s1
    20ac:	fedff06f          	j	2098 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    20b0:	00a00713          	li	a4,10
    20b4:	02e4e7b3          	rem	a5,s1,a4
    20b8:	03078793          	addi	a5,a5,48
    20bc:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    20c0:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    20c4:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    20c8:	fe0494e3          	bnez	s1,20b0 <bsp_printf_d+0x30>
    20cc:	00010793          	mv	a5,sp
    20d0:	fef400e3          	beq	s0,a5,20b0 <bsp_printf_d+0x30>
        while (p != buffer)
    20d4:	00010793          	mv	a5,sp
    20d8:	00f40a63          	beq	s0,a5,20ec <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    20dc:	fff40413          	addi	s0,s0,-1
    20e0:	00044503          	lbu	a0,0(s0)
    20e4:	f69ff0ef          	jal	204c <bsp_printf_c>
    20e8:	fedff06f          	j	20d4 <bsp_printf_d+0x54>
    }
    20ec:	02c12083          	lw	ra,44(sp)
    20f0:	02812403          	lw	s0,40(sp)
    20f4:	02412483          	lw	s1,36(sp)
    20f8:	03010113          	addi	sp,sp,48
    20fc:	00008067          	ret

00002100 <bsp_printf_x>:
    {
    2100:	ff010113          	addi	sp,sp,-16
    2104:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    2108:	00000713          	li	a4,0
    210c:	00700793          	li	a5,7
    2110:	02e7c063          	blt	a5,a4,2130 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    2114:	00271693          	slli	a3,a4,0x2
    2118:	ff000793          	li	a5,-16
    211c:	00d797b3          	sll	a5,a5,a3
    2120:	00f577b3          	and	a5,a0,a5
    2124:	00078663          	beqz	a5,2130 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    2128:	00170713          	addi	a4,a4,1
    212c:	fe1ff06f          	j	210c <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    2130:	ec9ff0ef          	jal	1ff8 <bsp_printHex_lower>
    }
    2134:	00c12083          	lw	ra,12(sp)
    2138:	01010113          	addi	sp,sp,16
    213c:	00008067          	ret

00002140 <bsp_printf_X>:
        {
    2140:	ff010113          	addi	sp,sp,-16
    2144:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    2148:	00000713          	li	a4,0
    214c:	00700793          	li	a5,7
    2150:	02e7c063          	blt	a5,a4,2170 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    2154:	00271693          	slli	a3,a4,0x2
    2158:	ff000793          	li	a5,-16
    215c:	00d797b3          	sll	a5,a5,a3
    2160:	00f577b3          	and	a5,a0,a5
    2164:	00078663          	beqz	a5,2170 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    2168:	00170713          	addi	a4,a4,1
    216c:	fe1ff06f          	j	214c <bsp_printf_X+0xc>
            bsp_printHex(val);
    2170:	e35ff0ef          	jal	1fa4 <bsp_printHex>
        }
    2174:	00c12083          	lw	ra,12(sp)
    2178:	01010113          	addi	sp,sp,16
    217c:	00008067          	ret

00002180 <bsp_init>:
    *   1. UART baudrate
    *   2. 
    */
////////////////////////////////////////////////////////////////////////////////
    static void bsp_init()
    {
    2180:	fe010113          	addi	sp,sp,-32
    2184:	00112e23          	sw	ra,28(sp)
        Uart_Config uartConfig;
        uartConfig.dataLength   = BITS_8;
    2188:	00800793          	li	a5,8
    218c:	00f12023          	sw	a5,0(sp)
        uartConfig.parity       = NONE;
    2190:	00012223          	sw	zero,4(sp)
        uartConfig.stop         = ONE;
    2194:	00012423          	sw	zero,8(sp)
        uartConfig.clockDivider = BSP_CLINT_HZ/(BSP_UART_BAUDRATE*BSP_UART_DATA_LEN)-1;
    2198:	06b00793          	li	a5,107
    219c:	00f12623          	sw	a5,12(sp)
        uart_applyConfig(BSP_UART_TERMINAL, &uartConfig);    
    21a0:	00010593          	mv	a1,sp
    21a4:	f8010537          	lui	a0,0xf8010
    21a8:	d35ff0ef          	jal	1edc <uart_applyConfig>
    }
    21ac:	01c12083          	lw	ra,28(sp)
    21b0:	02010113          	addi	sp,sp,32
    21b4:	00008067          	ret

000021b8 <plic_set_priority>:
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
    21b8:	00259593          	slli	a1,a1,0x2
    21bc:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
    21c0:	00c5a023          	sw	a2,0(a1)
    }
    21c4:	00008067          	ret

000021c8 <plic_set_enable>:
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
    21c8:	00759593          	slli	a1,a1,0x7
    21cc:	00a585b3          	add	a1,a1,a0
    21d0:	00565793          	srli	a5,a2,0x5
    21d4:	00279793          	slli	a5,a5,0x2
    21d8:	00f587b3          	add	a5,a1,a5
    21dc:	00002737          	lui	a4,0x2
    21e0:	00e787b3          	add	a5,a5,a4
        u32 mask = 1 << (gateway % 32);
    21e4:	00100713          	li	a4,1
    21e8:	00c71633          	sll	a2,a4,a2
        if (enable)
    21ec:	00068a63          	beqz	a3,2200 <plic_set_enable+0x38>
        return *((volatile u32*) address);
    21f0:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) | mask, word);
    21f4:	00e66633          	or	a2,a2,a4
        *((volatile u32*) address) = data;
    21f8:	00c7a023          	sw	a2,0(a5)
    }
    21fc:	00008067          	ret
        return *((volatile u32*) address);
    2200:	0007a703          	lw	a4,0(a5)
            write_u32(read_u32(word) & ~mask, word);
    2204:	fff64613          	not	a2,a2
    2208:	00e67633          	and	a2,a2,a4
        *((volatile u32*) address) = data;
    220c:	00c7a023          	sw	a2,0(a5)
    }
    2210:	00008067          	ret

00002214 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    2214:	00c59593          	slli	a1,a1,0xc
    2218:	00a585b3          	add	a1,a1,a0
    221c:	002007b7          	lui	a5,0x200
    2220:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f9ea4>
    2224:	00f585b3          	add	a1,a1,a5
        return *((volatile u32*) address);
    2228:	0005a503          	lw	a0,0(a1)
    }
    222c:	00008067          	ret

00002230 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
    2230:	00c59593          	slli	a1,a1,0xc
    2234:	00a585b3          	add	a1,a1,a0
    2238:	002007b7          	lui	a5,0x200
    223c:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f9ea4>
    2240:	00f585b3          	add	a1,a1,a5
        *((volatile u32*) address) = data;
    2244:	00c5a023          	sw	a2,0(a1)
    }
    2248:	00008067          	ret

0000224c <dmasg_input_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_input_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    224c:	00759593          	slli	a1,a1,0x7
    2250:	00a58533          	add	a0,a1,a0
    2254:	00c52023          	sw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf8009ea0>
        write_u32(address, ca + DMASG_CHANNEL_INPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_INPUT_CONFIG);
    2258:	fff68693          	addi	a3,a3,-1 # feffff <__freertos_irq_stack_top+0xfe9e9f>
    225c:	000017b7          	lui	a5,0x1
    2260:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2264:	00e6f6b3          	and	a3,a3,a4
    2268:	00f6e6b3          	or	a3,a3,a5
    226c:	00d52623          	sw	a3,12(a0)
    }
    2270:	00008067          	ret

00002274 <dmasg_output_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_output_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2274:	00759593          	slli	a1,a1,0x7
    2278:	00a58533          	add	a0,a1,a0
    227c:	00c52823          	sw	a2,16(a0)
        write_u32(address, ca + DMASG_CHANNEL_OUTPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    2280:	fff68693          	addi	a3,a3,-1
    2284:	000017b7          	lui	a5,0x1
    2288:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    228c:	00e6f6b3          	and	a3,a3,a4
    2290:	00f6e6b3          	or	a3,a3,a5
    2294:	00d52e23          	sw	a3,28(a0)
    }
    2298:	00008067          	ret

0000229c <dmasg_input_stream>:
*                              contain one packet and force its completion when fully transferred 
*                              into memory.
*
*******************************************************************************/   
    static void dmasg_input_stream(u32 base, u32 channel, u32 port, u32 wait_on_packet, u32 completion_on_packet){
        u32 ca = dmasg_ca(base, channel);
    229c:	00759593          	slli	a1,a1,0x7
    22a0:	00a58533          	add	a0,a1,a0
    22a4:	00c52423          	sw	a2,8(a0)
        write_u32(port << 0, ca + DMASG_CHANNEL_INPUT_STREAM);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    22a8:	00070e63          	beqz	a4,22c4 <dmasg_input_stream+0x28>
    22ac:	000027b7          	lui	a5,0x2
    22b0:	00068e63          	beqz	a3,22cc <dmasg_input_stream+0x30>
    22b4:	00004737          	lui	a4,0x4
    22b8:	00e7e7b3          	or	a5,a5,a4
    22bc:	00f52623          	sw	a5,12(a0)
    }
    22c0:	00008067          	ret
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    22c4:	00000793          	li	a5,0
    22c8:	fe9ff06f          	j	22b0 <dmasg_input_stream+0x14>
    22cc:	00000713          	li	a4,0
    22d0:	fe9ff06f          	j	22b8 <dmasg_input_stream+0x1c>

000022d4 <dmasg_output_stream>:
* @param last: Specifies if an end of packet should be sent at the end of the transfer
*              (only for direct DMA control, not linked list)
*
*******************************************************************************/
    static void dmasg_output_stream(u32 base, u32 channel, u32 port, u32 source, u32 sink, u32 last){
        u32 ca = dmasg_ca(base, channel);
    22d4:	00759593          	slli	a1,a1,0x7
    22d8:	00a58533          	add	a0,a1,a0
        write_u32(port << 0 | source << 8 | sink << 16, ca + DMASG_CHANNEL_OUTPUT_STREAM);
    22dc:	00869693          	slli	a3,a3,0x8
    22e0:	00c6e6b3          	or	a3,a3,a2
    22e4:	01071713          	slli	a4,a4,0x10
    22e8:	00e6e6b3          	or	a3,a3,a4
    22ec:	00d52c23          	sw	a3,24(a0)
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_STREAM | (last ? DMASG_CHANNEL_OUTPUT_CONFIG_LAST : 0), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    22f0:	00078463          	beqz	a5,22f8 <dmasg_output_stream+0x24>
    22f4:	000027b7          	lui	a5,0x2
    22f8:	00f52e23          	sw	a5,28(a0)
    }
    22fc:	00008067          	ret

00002300 <dmasg_direct_start>:
*                      The DESCRIPTOR_COMPLETION_HALF interrupt can be usefull 
*                      in that mode.
*
*******************************************************************************/
    static void dmasg_direct_start(u32 base, u32 channel, u32 bytes, u32 self_restart){
        u32 ca = dmasg_ca(base, channel);
    2300:	00759593          	slli	a1,a1,0x7
    2304:	00a58533          	add	a0,a1,a0
        write_u32(bytes-1, ca + DMASG_CHANNEL_DIRECT_BYTES);
    2308:	fff60613          	addi	a2,a2,-1
    230c:	02c52023          	sw	a2,32(a0)
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2310:	00068863          	beqz	a3,2320 <dmasg_direct_start+0x20>
    2314:	00300793          	li	a5,3
    2318:	02f52623          	sw	a5,44(a0)
    }
    231c:	00008067          	ret
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2320:	00100793          	li	a5,1
    2324:	ff5ff06f          	j	2318 <dmasg_direct_start+0x18>

00002328 <dmasg_interrupt_config>:
*       This function clear all pending interrupts for the given channel 
*       before enabling the mask's interrupts.
*
*******************************************************************************/
    static void dmasg_interrupt_config(u32 base, u32 channel, u32 mask){
        u32 ca = dmasg_ca(base, channel);
    2328:	00759593          	slli	a1,a1,0x7
    232c:	00a58533          	add	a0,a1,a0
    2330:	fff00793          	li	a5,-1
    2334:	04f52a23          	sw	a5,84(a0)
    2338:	04c52823          	sw	a2,80(a0)
        write_u32(0xFFFFFFFF, ca+DMASG_CHANNEL_INTERRUPT_PENDING);
        write_u32(mask, ca+DMASG_CHANNEL_INTERRUPT_ENABLE);
    }
    233c:	00008067          	ret

00002340 <dmasg_busy>:
*
* @return 1 if the channel is busy, 0 otherwise
*
*******************************************************************************/
    static u32 dmasg_busy(u32 base, u32 channel){
        u32 ca = dmasg_ca(base, channel);
    2340:	00759593          	slli	a1,a1,0x7
    2344:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
    2348:	02c5a503          	lw	a0,44(a1)
        return read_u32(ca + DMASG_CHANNEL_STATUS) & DMASG_CHANNEL_STATUS_BUSY;
    }
    234c:	00157513          	andi	a0,a0,1
    2350:	00008067          	ret

00002354 <dmasg_priority>:
* @param priority: Priority of the channel
* @param weight: Weight of the channel
*
*******************************************************************************/  
    static void dmasg_priority(u32 base, u32 channel, u32 priority, u32 weight){
        u32 ca = dmasg_ca(base, channel);
    2354:	00759593          	slli	a1,a1,0x7
    2358:	00a585b3          	add	a1,a1,a0
        write_u32(priority| weight << 8,  ca+DMASG_CHANNEL_PRIORITY);
    235c:	00869693          	slli	a3,a3,0x8
    2360:	00c6e6b3          	or	a3,a3,a2
        *((volatile u32*) address) = data;
    2364:	04d5a223          	sw	a3,68(a1)
    }
    2368:	00008067          	ret

0000236c <bsp_printf>:
    {
    236c:	fc010113          	addi	sp,sp,-64
    2370:	00112e23          	sw	ra,28(sp)
    2374:	00812c23          	sw	s0,24(sp)
    2378:	00912a23          	sw	s1,20(sp)
    237c:	00050493          	mv	s1,a0
    2380:	02b12223          	sw	a1,36(sp)
    2384:	02c12423          	sw	a2,40(sp)
    2388:	02d12623          	sw	a3,44(sp)
    238c:	02e12823          	sw	a4,48(sp)
    2390:	02f12a23          	sw	a5,52(sp)
    2394:	03012c23          	sw	a6,56(sp)
    2398:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    239c:	02410793          	addi	a5,sp,36
    23a0:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    23a4:	00000413          	li	s0,0
    23a8:	01c0006f          	j	23c4 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    23ac:	00c12783          	lw	a5,12(sp)
    23b0:	00478713          	addi	a4,a5,4 # 2004 <bsp_printHex_lower+0xc>
    23b4:	00e12623          	sw	a4,12(sp)
    23b8:	0007a503          	lw	a0,0(a5)
    23bc:	c91ff0ef          	jal	204c <bsp_printf_c>
        for (i = 0; format[i]; i++)
    23c0:	00140413          	addi	s0,s0,1
    23c4:	008487b3          	add	a5,s1,s0
    23c8:	0007c503          	lbu	a0,0(a5)
    23cc:	0a050e63          	beqz	a0,2488 <bsp_printf+0x11c>
            if (format[i] == '%') {
    23d0:	02500793          	li	a5,37
    23d4:	06f50e63          	beq	a0,a5,2450 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    23d8:	c75ff0ef          	jal	204c <bsp_printf_c>
    23dc:	fe5ff06f          	j	23c0 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    23e0:	00c12783          	lw	a5,12(sp)
    23e4:	00478713          	addi	a4,a5,4
    23e8:	00e12623          	sw	a4,12(sp)
    23ec:	0007a503          	lw	a0,0(a5)
    23f0:	c79ff0ef          	jal	2068 <bsp_printf_s>
                        break;
    23f4:	fcdff06f          	j	23c0 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    23f8:	00c12783          	lw	a5,12(sp)
    23fc:	00478713          	addi	a4,a5,4
    2400:	00e12623          	sw	a4,12(sp)
    2404:	0007a503          	lw	a0,0(a5)
    2408:	c79ff0ef          	jal	2080 <bsp_printf_d>
                        break;
    240c:	fb5ff06f          	j	23c0 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    2410:	00c12783          	lw	a5,12(sp)
    2414:	00478713          	addi	a4,a5,4
    2418:	00e12623          	sw	a4,12(sp)
    241c:	0007a503          	lw	a0,0(a5)
    2420:	d21ff0ef          	jal	2140 <bsp_printf_X>
                        break;
    2424:	f9dff06f          	j	23c0 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    2428:	00c12783          	lw	a5,12(sp)
    242c:	00478713          	addi	a4,a5,4
    2430:	00e12623          	sw	a4,12(sp)
    2434:	0007a503          	lw	a0,0(a5)
    2438:	cc9ff0ef          	jal	2100 <bsp_printf_x>
                        break;
    243c:	f85ff06f          	j	23c0 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    2440:	00004537          	lui	a0,0x4
    2444:	0a850513          	addi	a0,a0,168 # 40a8 <_data+0x28>
    2448:	c21ff0ef          	jal	2068 <bsp_printf_s>
                        break;
    244c:	f75ff06f          	j	23c0 <bsp_printf+0x54>
                while (format[++i]) {
    2450:	00140413          	addi	s0,s0,1
    2454:	008487b3          	add	a5,s1,s0
    2458:	0007c783          	lbu	a5,0(a5)
    245c:	f60782e3          	beqz	a5,23c0 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    2460:	fa878793          	addi	a5,a5,-88
    2464:	0ff7f693          	zext.b	a3,a5
    2468:	02000713          	li	a4,32
    246c:	fed762e3          	bltu	a4,a3,2450 <bsp_printf+0xe4>
    2470:	00269793          	slli	a5,a3,0x2
    2474:	00004737          	lui	a4,0x4
    2478:	6b870713          	addi	a4,a4,1720 # 46b8 <_data+0x638>
    247c:	00e787b3          	add	a5,a5,a4
    2480:	0007a783          	lw	a5,0(a5)
    2484:	00078067          	jr	a5
    }
    2488:	01c12083          	lw	ra,28(sp)
    248c:	01812403          	lw	s0,24(sp)
    2490:	01412483          	lw	s1,20(sp)
    2494:	04010113          	addi	sp,sp,64
    2498:	00008067          	ret

0000249c <rgb2grayscale>:

void rgb2grayscale(volatile uint32_t in_array[], volatile uint32_t out_array[], uint32_t width, uint32_t height)
{
   uint8_t red, green, blue, grayscale;

   for (int i = 0; i < (width * height); i++)
    249c:	00000313          	li	t1,0
    24a0:	0880006f          	j	2528 <rgb2grayscale+0x8c>
   {
      red = (in_array[i]) & 0xff;
    24a4:	00231e13          	slli	t3,t1,0x2
    24a8:	01c507b3          	add	a5,a0,t3
    24ac:	0007a703          	lw	a4,0(a5)
      green = ((in_array[i]) >> 8) & 0xff;
    24b0:	0007a883          	lw	a7,0(a5)
    24b4:	0088d893          	srli	a7,a7,0x8
      blue = ((in_array[i]) >> 16) & 0xff;
    24b8:	0007a803          	lw	a6,0(a5)
    24bc:	01085813          	srli	a6,a6,0x10

      grayscale = (30 * red + 59 * green + 11 * blue) / 100;
    24c0:	0ff77713          	zext.b	a4,a4
    24c4:	00471793          	slli	a5,a4,0x4
    24c8:	40e787b3          	sub	a5,a5,a4
    24cc:	00179793          	slli	a5,a5,0x1
    24d0:	0ff8f893          	zext.b	a7,a7
    24d4:	00489713          	slli	a4,a7,0x4
    24d8:	41170733          	sub	a4,a4,a7
    24dc:	00271713          	slli	a4,a4,0x2
    24e0:	41170733          	sub	a4,a4,a7
    24e4:	00e787b3          	add	a5,a5,a4
    24e8:	0ff87813          	zext.b	a6,a6
    24ec:	00181713          	slli	a4,a6,0x1
    24f0:	01070733          	add	a4,a4,a6
    24f4:	00271713          	slli	a4,a4,0x2
    24f8:	41070733          	sub	a4,a4,a6
    24fc:	00e787b3          	add	a5,a5,a4
    2500:	06400713          	li	a4,100
    2504:	02e7c7b3          	div	a5,a5,a4
      out_array[i] = (grayscale << 16) + (grayscale << 8) + (grayscale);
    2508:	0ff7f793          	zext.b	a5,a5
    250c:	01079713          	slli	a4,a5,0x10
    2510:	00879813          	slli	a6,a5,0x8
    2514:	01070733          	add	a4,a4,a6
    2518:	01c58e33          	add	t3,a1,t3
    251c:	00f707b3          	add	a5,a4,a5
    2520:	00fe2023          	sw	a5,0(t3)
   for (int i = 0; i < (width * height); i++)
    2524:	00130313          	addi	t1,t1,1
    2528:	02d607b3          	mul	a5,a2,a3
    252c:	f6f36ce3          	bltu	t1,a5,24a4 <rgb2grayscale+0x8>
   }

   return;
}
    2530:	00008067          	ret

00002534 <uart_interrupt_init>:
{
    2534:	ff010113          	addi	sp,sp,-16
    2538:	00112623          	sw	ra,12(sp)
    bsp_init();
    253c:	c45ff0ef          	jal	2180 <bsp_init>
    uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2540:	f8010537          	lui	a0,0xf8010
    2544:	9c9ff0ef          	jal	1f0c <uart_status_read>
    2548:	00256593          	ori	a1,a0,2
    254c:	0ff5f593          	zext.b	a1,a1
    2550:	f8010537          	lui	a0,0xf8010
    2554:	9c1ff0ef          	jal	1f14 <uart_status_write>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
    2558:	00100693          	li	a3,1
    255c:	00100613          	li	a2,1
    2560:	00000593          	li	a1,0
    2564:	f8c00537          	lui	a0,0xf8c00
    2568:	c61ff0ef          	jal	21c8 <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 2); // 1
    256c:	00200613          	li	a2,2
    2570:	00100593          	li	a1,1
    2574:	f8c00537          	lui	a0,0xf8c00
    2578:	c41ff0ef          	jal	21b8 <plic_set_priority>
}
    257c:	00c12083          	lw	ra,12(sp)
    2580:	01010113          	addi	sp,sp,16
    2584:	00008067          	ret

00002588 <trigger_next_display_dma>:
{
    2588:	ff010113          	addi	sp,sp,-16
    258c:	00112623          	sw	ra,12(sp)
    if (select_demo_mode == 0 || select_demo_mode == 3)
    2590:	8341a783          	lw	a5,-1996(gp) # 4fcc <select_demo_mode>
    2594:	02078663          	beqz	a5,25c0 <trigger_next_display_dma+0x38>
    2598:	00300713          	li	a4,3
    259c:	02e78263          	beq	a5,a4,25c0 <trigger_next_display_dma+0x38>
    else if (select_demo_mode == 1)
    25a0:	00100713          	li	a4,1
    25a4:	08e78063          	beq	a5,a4,2624 <trigger_next_display_dma+0x9c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, SOBEL_START_ADDR, 16);
    25a8:	01000693          	li	a3,16
    25ac:	00900637          	lui	a2,0x900
    25b0:	00200593          	li	a1,2
    25b4:	f8110537          	lui	a0,0xf8110
    25b8:	c95ff0ef          	jal	224c <dmasg_input_memory>
    25bc:	0180006f          	j	25d4 <trigger_next_display_dma+0x4c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    25c0:	01000693          	li	a3,16
    25c4:	00100637          	lui	a2,0x100
    25c8:	00200593          	li	a1,2
    25cc:	f8110537          	lui	a0,0xf8110
    25d0:	c7dff0ef          	jal	224c <dmasg_input_memory>
    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    25d4:	00100793          	li	a5,1
    25d8:	00000713          	li	a4,0
    25dc:	00000693          	li	a3,0
    25e0:	00000613          	li	a2,0
    25e4:	00200593          	li	a1,2
    25e8:	f8110537          	lui	a0,0xf8110
    25ec:	ce9ff0ef          	jal	22d4 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    25f0:	00400613          	li	a2,4
    25f4:	00200593          	li	a1,2
    25f8:	f8110537          	lui	a0,0xf8110
    25fc:	d2dff0ef          	jal	2328 <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restar
    2600:	00000693          	li	a3,0
    2604:	0011d637          	lui	a2,0x11d
    2608:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116ae0>
    260c:	00200593          	li	a1,2
    2610:	f8110537          	lui	a0,0xf8110
    2614:	cedff0ef          	jal	2300 <dmasg_direct_start>
}
    2618:	00c12083          	lw	ra,12(sp)
    261c:	01010113          	addi	sp,sp,16
    2620:	00008067          	ret
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16);
    2624:	01000693          	li	a3,16
    2628:	00500637          	lui	a2,0x500
    262c:	00200593          	li	a1,2
    2630:	f8110537          	lui	a0,0xf8110
    2634:	c19ff0ef          	jal	224c <dmasg_input_memory>
    2638:	f9dff06f          	j	25d4 <trigger_next_display_dma+0x4c>

0000263c <uart_buffer_read>:
{
    263c:	ff010113          	addi	sp,sp,-16
    2640:	00112623          	sw	ra,12(sp)
    2644:	00812423          	sw	s0,8(sp)
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2648:	0340006f          	j	267c <uart_buffer_read+0x40>
            if (uart_cmd_index > 0) {
    264c:	82d1c783          	lbu	a5,-2003(gp) # 4fc5 <uart_cmd_index>
    2650:	0ff7f793          	zext.b	a5,a5
    2654:	02078463          	beqz	a5,267c <uart_buffer_read+0x40>
                uart_cmd_buffer[uart_cmd_index] = '\0';
    2658:	82d1c683          	lbu	a3,-2003(gp) # 4fc5 <uart_cmd_index>
    265c:	97c18793          	addi	a5,gp,-1668 # 5114 <uart_cmd_buffer>
    2660:	00d787b3          	add	a5,a5,a3
    2664:	00078023          	sb	zero,0(a5)
                uart_cmd_ready = true;
    2668:	00100693          	li	a3,1
    266c:	82d18623          	sb	a3,-2004(gp) # 4fc4 <uart_cmd_ready>
                uart_cmd_index = 0;         // reset for next command
    2670:	820186a3          	sb	zero,-2003(gp) # 4fc5 <uart_cmd_index>
            continue;
    2674:	0080006f          	j	267c <uart_buffer_read+0x40>
            uart_cmd_index = 0;
    2678:	820186a3          	sb	zero,-2003(gp) # 4fc5 <uart_cmd_index>
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    267c:	f8010537          	lui	a0,0xf8010
    2680:	88dff0ef          	jal	1f0c <uart_status_read>
    2684:	20057513          	andi	a0,a0,512
    2688:	06050e63          	beqz	a0,2704 <uart_buffer_read+0xc8>
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD); // RX FIFO not empty interrupt Disable
    268c:	f8010537          	lui	a0,0xf8010
    2690:	87dff0ef          	jal	1f0c <uart_status_read>
    2694:	0fd57593          	andi	a1,a0,253
    2698:	f8010537          	lui	a0,0xf8010
    269c:	879ff0ef          	jal	1f14 <uart_status_write>
        char c = uart_read(BSP_UART_TERMINAL);
    26a0:	f8010537          	lui	a0,0xf8010
    26a4:	805ff0ef          	jal	1ea8 <uart_read>
    26a8:	00050413          	mv	s0,a0
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    26ac:	f8010537          	lui	a0,0xf8010
    26b0:	85dff0ef          	jal	1f0c <uart_status_read>
    26b4:	00256593          	ori	a1,a0,2
    26b8:	0ff5f593          	zext.b	a1,a1
    26bc:	f8010537          	lui	a0,0xf8010
    26c0:	855ff0ef          	jal	1f14 <uart_status_write>
        if (c == '\r' || c == '\n') {
    26c4:	00d00793          	li	a5,13
    26c8:	f8f402e3          	beq	s0,a5,264c <uart_buffer_read+0x10>
    26cc:	00a00793          	li	a5,10
    26d0:	f6f40ee3          	beq	s0,a5,264c <uart_buffer_read+0x10>
        if (uart_cmd_index < UART_CMD_MAX_LEN - 1) {
    26d4:	82d1c783          	lbu	a5,-2003(gp) # 4fc5 <uart_cmd_index>
    26d8:	0ff7f793          	zext.b	a5,a5
    26dc:	03e00713          	li	a4,62
    26e0:	f8f76ce3          	bltu	a4,a5,2678 <uart_buffer_read+0x3c>
            uart_cmd_buffer[uart_cmd_index++] = c;
    26e4:	82d1c703          	lbu	a4,-2003(gp) # 4fc5 <uart_cmd_index>
    26e8:	00170793          	addi	a5,a4,1
    26ec:	0ff7f793          	zext.b	a5,a5
    26f0:	82f186a3          	sb	a5,-2003(gp) # 4fc5 <uart_cmd_index>
    26f4:	97c18793          	addi	a5,gp,-1668 # 5114 <uart_cmd_buffer>
    26f8:	00e787b3          	add	a5,a5,a4
    26fc:	00878023          	sb	s0,0(a5)
    2700:	f7dff06f          	j	267c <uart_buffer_read+0x40>
    if (uart_cmd_ready) {
    2704:	82c1c783          	lbu	a5,-2004(gp) # 4fc4 <uart_cmd_ready>
    2708:	0ff7f793          	zext.b	a5,a5
    270c:	00079a63          	bnez	a5,2720 <uart_buffer_read+0xe4>
}
    2710:	00c12083          	lw	ra,12(sp)
    2714:	00812403          	lw	s0,8(sp)
    2718:	01010113          	addi	sp,sp,16
    271c:	00008067          	ret
        var = uart_cmd_buffer[0];
    2720:	97c18413          	addi	s0,gp,-1668 # 5114 <uart_cmd_buffer>
    2724:	00044783          	lbu	a5,0(s0)
    2728:	0ff7f793          	zext.b	a5,a5
    272c:	96f18c23          	sb	a5,-1672(gp) # 5110 <var>
        data= atoi(&uart_cmd_buffer[1]);
    2730:	97d18513          	addi	a0,gp,-1667 # 5115 <uart_cmd_buffer+0x1>
    2734:	93dfe0ef          	jal	1070 <atoi>
    2738:	96a1aa23          	sw	a0,-1676(gp) # 510c <data>
        char_data= uart_cmd_buffer[1];
    273c:	00144783          	lbu	a5,1(s0)
    2740:	0ff7f793          	zext.b	a5,a5
    2744:	96f18823          	sb	a5,-1680(gp) # 5108 <char_data>
}
    2748:	fc9ff06f          	j	2710 <uart_buffer_read+0xd4>

0000274c <settings>:
    if (uart_cmd_ready)
    274c:	82c1c783          	lbu	a5,-2004(gp) # 4fc4 <uart_cmd_ready>
    2750:	0ff7f793          	zext.b	a5,a5
    2754:	3a078463          	beqz	a5,2afc <settings+0x3b0>
    {uart_cmd_ready = false; // Reset command ready flag
    2758:	82018623          	sb	zero,-2004(gp) # 4fc4 <uart_cmd_ready>
        switch (var)
    275c:	9781c783          	lbu	a5,-1672(gp) # 5110 <var>
    2760:	fd078793          	addi	a5,a5,-48
    2764:	0ff7f693          	zext.b	a3,a5
    2768:	01400713          	li	a4,20
    276c:	38d76863          	bltu	a4,a3,2afc <settings+0x3b0>
{
    2770:	ff010113          	addi	sp,sp,-16
    2774:	00112623          	sw	ra,12(sp)
        switch (var)
    2778:	00269793          	slli	a5,a3,0x2
    277c:	00004737          	lui	a4,0x4
    2780:	73c70713          	addi	a4,a4,1852 # 473c <_data+0x6bc>
    2784:	00e787b3          	add	a5,a5,a4
    2788:	0007a783          	lw	a5,0(a5)
    278c:	00078067          	jr	a5
            if (char_data == 'a')
    2790:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    2794:	0ff7f793          	zext.b	a5,a5
    2798:	06100713          	li	a4,97
    279c:	06e78c63          	beq	a5,a4,2814 <settings+0xc8>
            else if (char_data == 'b')
    27a0:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    27a4:	0ff7f793          	zext.b	a5,a5
    27a8:	06200713          	li	a4,98
    27ac:	06e78e63          	beq	a5,a4,2828 <settings+0xdc>
            else if (char_data == 'c')
    27b0:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    27b4:	0ff7f793          	zext.b	a5,a5
    27b8:	06300713          	li	a4,99
    27bc:	08e78263          	beq	a5,a4,2840 <settings+0xf4>
            else if (char_data == 'd')
    27c0:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    27c4:	0ff7f793          	zext.b	a5,a5
    27c8:	06400713          	li	a4,100
    27cc:	08e78663          	beq	a5,a4,2858 <settings+0x10c>
            else if (char_data == 'e')
    27d0:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    27d4:	0ff7f793          	zext.b	a5,a5
    27d8:	06500713          	li	a4,101
    27dc:	08e78a63          	beq	a5,a4,2870 <settings+0x124>
            else if (char_data == 'f')
    27e0:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    27e4:	0ff7f793          	zext.b	a5,a5
    27e8:	06600713          	li	a4,102
    27ec:	08e78e63          	beq	a5,a4,2888 <settings+0x13c>
            else if (char_data == 'g')
    27f0:	9701c783          	lbu	a5,-1680(gp) # 5108 <char_data>
    27f4:	0ff7f793          	zext.b	a5,a5
    27f8:	06700713          	li	a4,103
    27fc:	0ae78263          	beq	a5,a4,28a0 <settings+0x154>
                bsp_printf("Invalid Demo Mode: %c\n\r", char_data);
    2800:	9701c583          	lbu	a1,-1680(gp) # 5108 <char_data>
    2804:	00004537          	lui	a0,0x4
    2808:	1bc50513          	addi	a0,a0,444 # 41bc <_data+0x13c>
    280c:	b61ff0ef          	jal	236c <bsp_printf>
    2810:	0d00006f          	j	28e0 <settings+0x194>
                select_demo_mode = 0;
    2814:	8201aa23          	sw	zero,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: a\n\r");
    2818:	00004537          	lui	a0,0x4
    281c:	11450513          	addi	a0,a0,276 # 4114 <_data+0x94>
    2820:	b4dff0ef          	jal	236c <bsp_printf>
    2824:	0bc0006f          	j	28e0 <settings+0x194>
                select_demo_mode = 1;
    2828:	00100713          	li	a4,1
    282c:	82e1aa23          	sw	a4,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: b\n\r");
    2830:	00004537          	lui	a0,0x4
    2834:	12c50513          	addi	a0,a0,300 # 412c <_data+0xac>
    2838:	b35ff0ef          	jal	236c <bsp_printf>
    283c:	0a40006f          	j	28e0 <settings+0x194>
                select_demo_mode = 2;
    2840:	00200713          	li	a4,2
    2844:	82e1aa23          	sw	a4,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: c\n\r");
    2848:	00004537          	lui	a0,0x4
    284c:	14450513          	addi	a0,a0,324 # 4144 <_data+0xc4>
    2850:	b1dff0ef          	jal	236c <bsp_printf>
    2854:	08c0006f          	j	28e0 <settings+0x194>
                select_demo_mode = 3;
    2858:	00300713          	li	a4,3
    285c:	82e1aa23          	sw	a4,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: d\n\r");
    2860:	00004537          	lui	a0,0x4
    2864:	15c50513          	addi	a0,a0,348 # 415c <_data+0xdc>
    2868:	b05ff0ef          	jal	236c <bsp_printf>
    286c:	0740006f          	j	28e0 <settings+0x194>
                select_demo_mode = 4;
    2870:	00400713          	li	a4,4
    2874:	82e1aa23          	sw	a4,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: e\n\r");
    2878:	00004537          	lui	a0,0x4
    287c:	17450513          	addi	a0,a0,372 # 4174 <_data+0xf4>
    2880:	aedff0ef          	jal	236c <bsp_printf>
    2884:	05c0006f          	j	28e0 <settings+0x194>
                select_demo_mode = 5;
    2888:	00500713          	li	a4,5
    288c:	82e1aa23          	sw	a4,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: f\n\r");
    2890:	00004537          	lui	a0,0x4
    2894:	18c50513          	addi	a0,a0,396 # 418c <_data+0x10c>
    2898:	ad5ff0ef          	jal	236c <bsp_printf>
    289c:	0440006f          	j	28e0 <settings+0x194>
                select_demo_mode = 6;
    28a0:	00600713          	li	a4,6
    28a4:	82e1aa23          	sw	a4,-1996(gp) # 4fcc <select_demo_mode>
                bsp_printf("Selected Demo Mode: g\n\r");
    28a8:	00004537          	lui	a0,0x4
    28ac:	1a450513          	addi	a0,a0,420 # 41a4 <_data+0x124>
    28b0:	abdff0ef          	jal	236c <bsp_printf>
    28b4:	02c0006f          	j	28e0 <settings+0x194>
            Set_Gain(0, 0, data);
    28b8:	9741a783          	lw	a5,-1676(gp) # 510c <data>
}

// Unified Set_Gain — camId selects which camera (0 = cam1, 1 = cam2)
static inline void Set_Gain(int camId, int var, u16 setting)
{
	u32 data = setting;
    28bc:	01079793          	slli	a5,a5,0x10
    28c0:	0107d793          	srli	a5,a5,0x10
    28c4:	f8100737          	lui	a4,0xf8100
    28c8:	00f72023          	sw	a5,0(a4) # f8100000 <__freertos_irq_stack_top+0xf80f9ea0>
				 (var==10)? EXAMPLE_APB3_SLV_REG14_OFFSET:
				 (var==11)? EXAMPLE_APB3_SLV_REG15_OFFSET: EXAMPLE_APB3_SLV_REG16_OFFSET; // single cam, camId ignored
#endif

	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, offset, data);
	bsp_uDelay(DELAY_BUSY);
    28cc:	f8b00637          	lui	a2,0xf8b00
    28d0:	05f5e5b7          	lui	a1,0x5f5e
    28d4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    28d8:	00500513          	li	a0,5
    28dc:	e40ff0ef          	jal	1f1c <clint_uDelay>
}
    28e0:	00c12083          	lw	ra,12(sp)
    28e4:	01010113          	addi	sp,sp,16
    28e8:	00008067          	ret
            Set_Gain(0, 1, data);
    28ec:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    28f0:	01071713          	slli	a4,a4,0x10
    28f4:	01075713          	srli	a4,a4,0x10
    28f8:	f81007b7          	lui	a5,0xf8100
    28fc:	00e7aa23          	sw	a4,20(a5) # f8100014 <__freertos_irq_stack_top+0xf80f9eb4>
	bsp_uDelay(DELAY_BUSY);
    2900:	f8b00637          	lui	a2,0xf8b00
    2904:	05f5e5b7          	lui	a1,0x5f5e
    2908:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    290c:	00500513          	li	a0,5
    2910:	e0cff0ef          	jal	1f1c <clint_uDelay>
}
    2914:	fcdff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 2, data);
    2918:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    291c:	01071713          	slli	a4,a4,0x10
    2920:	01075713          	srli	a4,a4,0x10
    2924:	f81007b7          	lui	a5,0xf8100
    2928:	00e7ac23          	sw	a4,24(a5) # f8100018 <__freertos_irq_stack_top+0xf80f9eb8>
	bsp_uDelay(DELAY_BUSY);
    292c:	f8b00637          	lui	a2,0xf8b00
    2930:	05f5e5b7          	lui	a1,0x5f5e
    2934:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2938:	00500513          	li	a0,5
    293c:	de0ff0ef          	jal	1f1c <clint_uDelay>
}
    2940:	fa1ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 3, data);
    2944:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2948:	01071713          	slli	a4,a4,0x10
    294c:	01075713          	srli	a4,a4,0x10
    2950:	f81007b7          	lui	a5,0xf8100
    2954:	00e7ae23          	sw	a4,28(a5) # f810001c <__freertos_irq_stack_top+0xf80f9ebc>
	bsp_uDelay(DELAY_BUSY);
    2958:	f8b00637          	lui	a2,0xf8b00
    295c:	05f5e5b7          	lui	a1,0x5f5e
    2960:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2964:	00500513          	li	a0,5
    2968:	db4ff0ef          	jal	1f1c <clint_uDelay>
}
    296c:	f75ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 4, data);
    2970:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2974:	01071713          	slli	a4,a4,0x10
    2978:	01075713          	srli	a4,a4,0x10
    297c:	f81007b7          	lui	a5,0xf8100
    2980:	02e7a023          	sw	a4,32(a5) # f8100020 <__freertos_irq_stack_top+0xf80f9ec0>
	bsp_uDelay(DELAY_BUSY);
    2984:	f8b00637          	lui	a2,0xf8b00
    2988:	05f5e5b7          	lui	a1,0x5f5e
    298c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2990:	00500513          	li	a0,5
    2994:	d88ff0ef          	jal	1f1c <clint_uDelay>
}
    2998:	f49ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 5, data);
    299c:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    29a0:	01071713          	slli	a4,a4,0x10
    29a4:	01075713          	srli	a4,a4,0x10
    29a8:	f81007b7          	lui	a5,0xf8100
    29ac:	02e7a223          	sw	a4,36(a5) # f8100024 <__freertos_irq_stack_top+0xf80f9ec4>
	bsp_uDelay(DELAY_BUSY);
    29b0:	f8b00637          	lui	a2,0xf8b00
    29b4:	05f5e5b7          	lui	a1,0x5f5e
    29b8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    29bc:	00500513          	li	a0,5
    29c0:	d5cff0ef          	jal	1f1c <clint_uDelay>
}
    29c4:	f1dff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 6, data);
    29c8:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    29cc:	01071713          	slli	a4,a4,0x10
    29d0:	01075713          	srli	a4,a4,0x10
    29d4:	f81007b7          	lui	a5,0xf8100
    29d8:	02e7a423          	sw	a4,40(a5) # f8100028 <__freertos_irq_stack_top+0xf80f9ec8>
	bsp_uDelay(DELAY_BUSY);
    29dc:	f8b00637          	lui	a2,0xf8b00
    29e0:	05f5e5b7          	lui	a1,0x5f5e
    29e4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    29e8:	00500513          	li	a0,5
    29ec:	d30ff0ef          	jal	1f1c <clint_uDelay>
}
    29f0:	ef1ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 7, data);
    29f4:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    29f8:	01071713          	slli	a4,a4,0x10
    29fc:	01075713          	srli	a4,a4,0x10
    2a00:	f81007b7          	lui	a5,0xf8100
    2a04:	02e7a623          	sw	a4,44(a5) # f810002c <__freertos_irq_stack_top+0xf80f9ecc>
	bsp_uDelay(DELAY_BUSY);
    2a08:	f8b00637          	lui	a2,0xf8b00
    2a0c:	05f5e5b7          	lui	a1,0x5f5e
    2a10:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2a14:	00500513          	li	a0,5
    2a18:	d04ff0ef          	jal	1f1c <clint_uDelay>
}
    2a1c:	ec5ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 8, data);
    2a20:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2a24:	01071713          	slli	a4,a4,0x10
    2a28:	01075713          	srli	a4,a4,0x10
    2a2c:	f81007b7          	lui	a5,0xf8100
    2a30:	02e7a823          	sw	a4,48(a5) # f8100030 <__freertos_irq_stack_top+0xf80f9ed0>
	bsp_uDelay(DELAY_BUSY);
    2a34:	f8b00637          	lui	a2,0xf8b00
    2a38:	05f5e5b7          	lui	a1,0x5f5e
    2a3c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2a40:	00500513          	li	a0,5
    2a44:	cd8ff0ef          	jal	1f1c <clint_uDelay>
}
    2a48:	e99ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 9, data);
    2a4c:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2a50:	01071713          	slli	a4,a4,0x10
    2a54:	01075713          	srli	a4,a4,0x10
    2a58:	f81007b7          	lui	a5,0xf8100
    2a5c:	02e7aa23          	sw	a4,52(a5) # f8100034 <__freertos_irq_stack_top+0xf80f9ed4>
	bsp_uDelay(DELAY_BUSY);
    2a60:	f8b00637          	lui	a2,0xf8b00
    2a64:	05f5e5b7          	lui	a1,0x5f5e
    2a68:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2a6c:	00500513          	li	a0,5
    2a70:	cacff0ef          	jal	1f1c <clint_uDelay>
}
    2a74:	e6dff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 10, data);
    2a78:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2a7c:	01071713          	slli	a4,a4,0x10
    2a80:	01075713          	srli	a4,a4,0x10
    2a84:	f81007b7          	lui	a5,0xf8100
    2a88:	02e7ac23          	sw	a4,56(a5) # f8100038 <__freertos_irq_stack_top+0xf80f9ed8>
	bsp_uDelay(DELAY_BUSY);
    2a8c:	f8b00637          	lui	a2,0xf8b00
    2a90:	05f5e5b7          	lui	a1,0x5f5e
    2a94:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2a98:	00500513          	li	a0,5
    2a9c:	c80ff0ef          	jal	1f1c <clint_uDelay>
}
    2aa0:	e41ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 11, data);
    2aa4:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2aa8:	01071713          	slli	a4,a4,0x10
    2aac:	01075713          	srli	a4,a4,0x10
    2ab0:	f81007b7          	lui	a5,0xf8100
    2ab4:	02e7ae23          	sw	a4,60(a5) # f810003c <__freertos_irq_stack_top+0xf80f9edc>
	bsp_uDelay(DELAY_BUSY);
    2ab8:	f8b00637          	lui	a2,0xf8b00
    2abc:	05f5e5b7          	lui	a1,0x5f5e
    2ac0:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2ac4:	00500513          	li	a0,5
    2ac8:	c54ff0ef          	jal	1f1c <clint_uDelay>
}
    2acc:	e15ff06f          	j	28e0 <settings+0x194>
            Set_Gain(0, 12, data);
    2ad0:	9741a703          	lw	a4,-1676(gp) # 510c <data>
	u32 data = setting;
    2ad4:	01071713          	slli	a4,a4,0x10
    2ad8:	01075713          	srli	a4,a4,0x10
    2adc:	f81007b7          	lui	a5,0xf8100
    2ae0:	04e7a023          	sw	a4,64(a5) # f8100040 <__freertos_irq_stack_top+0xf80f9ee0>
	bsp_uDelay(DELAY_BUSY);
    2ae4:	f8b00637          	lui	a2,0xf8b00
    2ae8:	05f5e5b7          	lui	a1,0x5f5e
    2aec:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57fa0>
    2af0:	00500513          	li	a0,5
    2af4:	c28ff0ef          	jal	1f1c <clint_uDelay>
}
    2af8:	de9ff06f          	j	28e0 <settings+0x194>
    2afc:	00008067          	ret

00002b00 <externalInterrupt>:
{
    2b00:	ff010113          	addi	sp,sp,-16
    2b04:	00112623          	sw	ra,12(sp)
    2b08:	00812423          	sw	s0,8(sp)
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2b0c:	01c0006f          	j	2b28 <externalInterrupt+0x28>
            uart_buffer_read();
    2b10:	b2dff0ef          	jal	263c <uart_buffer_read>
            settings();
    2b14:	c39ff0ef          	jal	274c <settings>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); // unmask the claimed interrupt
    2b18:	00040613          	mv	a2,s0
    2b1c:	00000593          	li	a1,0
    2b20:	f8c00537          	lui	a0,0xf8c00
    2b24:	f0cff0ef          	jal	2230 <plic_release>
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2b28:	00000593          	li	a1,0
    2b2c:	f8c00537          	lui	a0,0xf8c00
    2b30:	ee4ff0ef          	jal	2214 <plic_claim>
    2b34:	00050413          	mv	s0,a0
    2b38:	02050e63          	beqz	a0,2b74 <externalInterrupt+0x74>
        switch (claim)
    2b3c:	00100793          	li	a5,1
    2b40:	fcf408e3          	beq	s0,a5,2b10 <externalInterrupt+0x10>
    2b44:	00600793          	li	a5,6
    2b48:	02f41263          	bne	s0,a5,2b6c <externalInterrupt+0x6c>
            if (display_mm2s_active && !(dmasg_busy(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL)))
    2b4c:	8301a783          	lw	a5,-2000(gp) # 4fc8 <display_mm2s_active>
    2b50:	fc0784e3          	beqz	a5,2b18 <externalInterrupt+0x18>
    2b54:	00200593          	li	a1,2
    2b58:	f8110537          	lui	a0,0xf8110
    2b5c:	fe4ff0ef          	jal	2340 <dmasg_busy>
    2b60:	fa051ce3          	bnez	a0,2b18 <externalInterrupt+0x18>
                trigger_next_display_dma();
    2b64:	a25ff0ef          	jal	2588 <trigger_next_display_dma>
    2b68:	fb1ff06f          	j	2b18 <externalInterrupt+0x18>
            crash();
    2b6c:	890ff0ef          	jal	1bfc <crash>
            break;
    2b70:	fa9ff06f          	j	2b18 <externalInterrupt+0x18>
}
    2b74:	00c12083          	lw	ra,12(sp)
    2b78:	00812403          	lw	s0,8(sp)
    2b7c:	01010113          	addi	sp,sp,16
    2b80:	00008067          	ret

00002b84 <ispExample_menu>:
{
    2b84:	ff010113          	addi	sp,sp,-16
    2b88:	00112623          	sw	ra,12(sp)
    2b8c:	00812423          	sw	s0,8(sp)
    bsp_printf("================================================================================\n\r");
    2b90:	00004437          	lui	s0,0x4
    2b94:	1d440513          	addi	a0,s0,468 # 41d4 <_data+0x154>
    2b98:	fd4ff0ef          	jal	236c <bsp_printf>
    bsp_printf("                    ISP Example Design Scenario Selection\n\r");
    2b9c:	00004537          	lui	a0,0x4
    2ba0:	22850513          	addi	a0,a0,552 # 4228 <_data+0x1a8>
    2ba4:	fc8ff0ef          	jal	236c <bsp_printf>
    bsp_printf("================================================================================\n\r");
    2ba8:	1d440513          	addi	a0,s0,468
    2bac:	fc0ff0ef          	jal	236c <bsp_printf>
    bsp_printf("'a' : Camera Capture + HDMI Display                                             \n\r");
    2bb0:	00004537          	lui	a0,0x4
    2bb4:	26450513          	addi	a0,a0,612 # 4264 <_data+0x1e4>
    2bb8:	fb4ff0ef          	jal	236c <bsp_printf>
    bsp_printf("'b' : Camera Capture + RGB2Grayscale (SW) + HDMI Display                        \n\r");
    2bbc:	00004537          	lui	a0,0x4
    2bc0:	2b850513          	addi	a0,a0,696 # 42b8 <_data+0x238>
    2bc4:	fa8ff0ef          	jal	236c <bsp_printf>
    bsp_printf("'c' : Camera Capture + RGB2Grayscale (SW) + Sobel (HW) + HDMI Display           \n\r");
    2bc8:	00004537          	lui	a0,0x4
    2bcc:	30c50513          	addi	a0,a0,780 # 430c <_data+0x28c>
    2bd0:	f9cff0ef          	jal	236c <bsp_printf>
    bsp_printf("'d' : Camera Capture + RGB2Grayscale (HW) + HDMI Display                        \n\r");
    2bd4:	00004537          	lui	a0,0x4
    2bd8:	36050513          	addi	a0,a0,864 # 4360 <_data+0x2e0>
    2bdc:	f90ff0ef          	jal	236c <bsp_printf>
    bsp_printf("'e' : Camera Capture + RGB2Grayscale & Sobel (HW) + HDMI Display                \n\r");
    2be0:	00004537          	lui	a0,0x4
    2be4:	3b450513          	addi	a0,a0,948 # 43b4 <_data+0x334>
    2be8:	f84ff0ef          	jal	236c <bsp_printf>
    bsp_printf("'f' : Camera Capture + RGB2Grayscale & Sobel & Dilation (HW) + HDMI Display     \n\r");
    2bec:	00004537          	lui	a0,0x4
    2bf0:	40850513          	addi	a0,a0,1032 # 4408 <_data+0x388>
    2bf4:	f78ff0ef          	jal	236c <bsp_printf>
    bsp_printf("'g' : Camera Capture + RGB2Grayscale & Sobel & Erosion  (HW) + HDMI Display     \n\r");
    2bf8:	00004537          	lui	a0,0x4
    2bfc:	45c50513          	addi	a0,a0,1116 # 445c <_data+0x3dc>
    2c00:	f6cff0ef          	jal	236c <bsp_printf>
    bsp_printf("================================================================================\n\n\r");
    2c04:	00004537          	lui	a0,0x4
    2c08:	4b050513          	addi	a0,a0,1200 # 44b0 <_data+0x430>
    2c0c:	f60ff0ef          	jal	236c <bsp_printf>
}
    2c10:	00c12083          	lw	ra,12(sp)
    2c14:	00812403          	lw	s0,8(sp)
    2c18:	01010113          	addi	sp,sp,16
    2c1c:	00008067          	ret

00002c20 <i2c_masterBusy>:
        return *((volatile u32*) address);
    2c20:	04052503          	lw	a0,64(a0)
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
    2c24:	00157513          	andi	a0,a0,1
    2c28:	00008067          	ret

00002c2c <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    2c2c:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    2c30:	21000793          	li	a5,528
    2c34:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    2c38:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    2c3c:	0107f793          	andi	a5,a5,16
    2c40:	fe079ce3          	bnez	a5,2c38 <i2c_masterStartBlocking+0xc>
    }
    2c44:	00008067          	ret

00002c48 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
    2c48:	ff010113          	addi	sp,sp,-16
    2c4c:	00112623          	sw	ra,12(sp)
    2c50:	00812423          	sw	s0,8(sp)
    2c54:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    2c58:	00040513          	mv	a0,s0
    2c5c:	fc5ff0ef          	jal	2c20 <i2c_masterBusy>
    2c60:	fe051ce3          	bnez	a0,2c58 <i2c_masterStopWait+0x10>
    }
    2c64:	00c12083          	lw	ra,12(sp)
    2c68:	00812403          	lw	s0,8(sp)
    2c6c:	01010113          	addi	sp,sp,16
    2c70:	00008067          	ret

00002c74 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
    2c74:	ff010113          	addi	sp,sp,-16
    2c78:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    2c7c:	42000713          	li	a4,1056
    2c80:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
    2c84:	fc5ff0ef          	jal	2c48 <i2c_masterStopWait>
    }
    2c88:	00c12083          	lw	ra,12(sp)
    2c8c:	01010113          	addi	sp,sp,16
    2c90:	00008067          	ret

00002c94 <i2c_txAckWait>:
        return *((volatile u32*) address);
    2c94:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    2c98:	1007f793          	andi	a5,a5,256
    2c9c:	fe079ce3          	bnez	a5,2c94 <i2c_txAckWait>
    }
    2ca0:	00008067          	ret

00002ca4 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
    2ca4:	ff010113          	addi	sp,sp,-16
    2ca8:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    2cac:	30100713          	li	a4,769
    2cb0:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
    2cb4:	fe1ff0ef          	jal	2c94 <i2c_txAckWait>
    }
    2cb8:	00c12083          	lw	ra,12(sp)
    2cbc:	01010113          	addi	sp,sp,16
    2cc0:	00008067          	ret

00002cc4 <i2c_rxAck>:
        return *((volatile u32*) address);
    2cc4:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    2cc8:	0ff57513          	zext.b	a0,a0
    }
    2ccc:	00153513          	seqz	a0,a0
    2cd0:	00008067          	ret

00002cd4 <PiCam_WriteRegData>:
#include "riscv.h"
#include "PiCamDriver.h"
#include "common.h"

void PiCam_WriteRegData(u32 i2c_base, u16 reg, u8 data)
{
    2cd4:	fe010113          	addi	sp,sp,-32
    2cd8:	00112e23          	sw	ra,28(sp)
    2cdc:	00812c23          	sw	s0,24(sp)
    2ce0:	00912a23          	sw	s1,20(sp)
    2ce4:	01212823          	sw	s2,16(sp)
    2ce8:	01312623          	sw	s3,12(sp)
    2cec:	00050413          	mv	s0,a0
    2cf0:	00058493          	mv	s1,a1
    2cf4:	00060913          	mv	s2,a2
   u8 outdata;

   i2c_masterStartBlocking(i2c_base);
    2cf8:	f35ff0ef          	jal	2c2c <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    2cfc:	000017b7          	lui	a5,0x1
    2d00:	b2078793          	addi	a5,a5,-1248 # b20 <CUSTOM2+0xac5>
    2d04:	00f42023          	sw	a5,0(s0)

   i2c_txByte(i2c_base, 0x10 << 1);
   i2c_txNackBlocking(i2c_base);
    2d08:	00040513          	mv	a0,s0
    2d0c:	f99ff0ef          	jal	2ca4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    2d10:	00040513          	mv	a0,s0
    2d14:	fb1ff0ef          	jal	2cc4 <i2c_rxAck>
    2d18:	89cff0ef          	jal	1db4 <assert>

   i2c_txByte(i2c_base, (reg >> 8) & 0xFF);
    2d1c:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    2d20:	000019b7          	lui	s3,0x1
    2d24:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    2d28:	0137e7b3          	or	a5,a5,s3
    2d2c:	00f42023          	sw	a5,0(s0)
   i2c_txNackBlocking(i2c_base);
    2d30:	00040513          	mv	a0,s0
    2d34:	f71ff0ef          	jal	2ca4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    2d38:	00040513          	mv	a0,s0
    2d3c:	f89ff0ef          	jal	2cc4 <i2c_rxAck>
    2d40:	874ff0ef          	jal	1db4 <assert>

   i2c_txByte(i2c_base, (reg) & 0xFF);
    2d44:	0ff4f493          	zext.b	s1,s1
    2d48:	0134e4b3          	or	s1,s1,s3
    2d4c:	00942023          	sw	s1,0(s0)
   i2c_txNackBlocking(i2c_base);
    2d50:	00040513          	mv	a0,s0
    2d54:	f51ff0ef          	jal	2ca4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    2d58:	00040513          	mv	a0,s0
    2d5c:	f69ff0ef          	jal	2cc4 <i2c_rxAck>
    2d60:	854ff0ef          	jal	1db4 <assert>
    2d64:	01396933          	or	s2,s2,s3
    2d68:	01242023          	sw	s2,0(s0)

   i2c_txByte(i2c_base, data & 0xFF);
   i2c_txNackBlocking(i2c_base);
    2d6c:	00040513          	mv	a0,s0
    2d70:	f35ff0ef          	jal	2ca4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    2d74:	00040513          	mv	a0,s0
    2d78:	f4dff0ef          	jal	2cc4 <i2c_rxAck>
    2d7c:	838ff0ef          	jal	1db4 <assert>

   i2c_masterStopBlocking(i2c_base);
    2d80:	00040513          	mv	a0,s0
    2d84:	ef1ff0ef          	jal	2c74 <i2c_masterStopBlocking>
}
    2d88:	01c12083          	lw	ra,28(sp)
    2d8c:	01812403          	lw	s0,24(sp)
    2d90:	01412483          	lw	s1,20(sp)
    2d94:	01012903          	lw	s2,16(sp)
    2d98:	00c12983          	lw	s3,12(sp)
    2d9c:	02010113          	addi	sp,sp,32
    2da0:	00008067          	ret

00002da4 <AccessCommSeq>:
   i2c_masterStopBlocking(i2c_base);

   return outdata;
}
void AccessCommSeq(u32 i2c_base)
{
    2da4:	ff010113          	addi	sp,sp,-16
    2da8:	00112623          	sw	ra,12(sp)
    2dac:	00812423          	sw	s0,8(sp)
    2db0:	00050413          	mv	s0,a0
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    2db4:	00500613          	li	a2,5
    2db8:	000035b7          	lui	a1,0x3
    2dbc:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_init+0xb3>
    2dc0:	f15ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x0C);
    2dc4:	00c00613          	li	a2,12
    2dc8:	000035b7          	lui	a1,0x3
    2dcc:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_init+0xb3>
    2dd0:	00040513          	mv	a0,s0
    2dd4:	f01ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300A, 0xFF);
    2dd8:	0ff00613          	li	a2,255
    2ddc:	000035b7          	lui	a1,0x3
    2de0:	00a58593          	addi	a1,a1,10 # 300a <PiCam_Gainfilter+0x2e>
    2de4:	00040513          	mv	a0,s0
    2de8:	eedff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300B, 0xFF);
    2dec:	0ff00613          	li	a2,255
    2df0:	000035b7          	lui	a1,0x3
    2df4:	00b58593          	addi	a1,a1,11 # 300b <PiCam_Gainfilter+0x2f>
    2df8:	00040513          	mv	a0,s0
    2dfc:	ed9ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    2e00:	00500613          	li	a2,5
    2e04:	000035b7          	lui	a1,0x3
    2e08:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_init+0xb3>
    2e0c:	00040513          	mv	a0,s0
    2e10:	ec5ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x09);
    2e14:	00900613          	li	a2,9
    2e18:	000035b7          	lui	a1,0x3
    2e1c:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_init+0xb3>
    2e20:	00040513          	mv	a0,s0
    2e24:	eb1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
}
    2e28:	00c12083          	lw	ra,12(sp)
    2e2c:	00812403          	lw	s0,8(sp)
    2e30:	01010113          	addi	sp,sp,16
    2e34:	00008067          	ret

00002e38 <PiCam_Output_Size>:

void PiCam_Output_Size(u32 i2c_base, u16 X, u16 Y)
{
    2e38:	ff010113          	addi	sp,sp,-16
    2e3c:	00112623          	sw	ra,12(sp)
    2e40:	00812423          	sw	s0,8(sp)
    2e44:	00912223          	sw	s1,4(sp)
    2e48:	01212023          	sw	s2,0(sp)
    2e4c:	00050413          	mv	s0,a0
    2e50:	00058913          	mv	s2,a1
    2e54:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, x_output_size_A_1, X >> 8);
    2e58:	0085d613          	srli	a2,a1,0x8
    2e5c:	16c00593          	li	a1,364
    2e60:	e75ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, x_output_size_A_0, X & 0xFF);
    2e64:	0ff97613          	zext.b	a2,s2
    2e68:	16d00593          	li	a1,365
    2e6c:	00040513          	mv	a0,s0
    2e70:	e65ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_1, Y >> 8);
    2e74:	0084d613          	srli	a2,s1,0x8
    2e78:	16e00593          	li	a1,366
    2e7c:	00040513          	mv	a0,s0
    2e80:	e55ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_0, Y & 0xFF);
    2e84:	0ff4f613          	zext.b	a2,s1
    2e88:	16f00593          	li	a1,367
    2e8c:	00040513          	mv	a0,s0
    2e90:	e45ff0ef          	jal	2cd4 <PiCam_WriteRegData>
}
    2e94:	00c12083          	lw	ra,12(sp)
    2e98:	00812403          	lw	s0,8(sp)
    2e9c:	00412483          	lw	s1,4(sp)
    2ea0:	00012903          	lw	s2,0(sp)
    2ea4:	01010113          	addi	sp,sp,16
    2ea8:	00008067          	ret

00002eac <PiCam_Output_activePixel>:

void PiCam_Output_activePixel(u32 i2c_base, u16 XStart, u16 XEnd, u16 YStart, u16 YEnd)
{
    2eac:	fe010113          	addi	sp,sp,-32
    2eb0:	00112e23          	sw	ra,28(sp)
    2eb4:	00812c23          	sw	s0,24(sp)
    2eb8:	00912a23          	sw	s1,20(sp)
    2ebc:	01212823          	sw	s2,16(sp)
    2ec0:	01312623          	sw	s3,12(sp)
    2ec4:	01412423          	sw	s4,8(sp)
    2ec8:	00050413          	mv	s0,a0
    2ecc:	00058a13          	mv	s4,a1
    2ed0:	00060993          	mv	s3,a2
    2ed4:	00068913          	mv	s2,a3
    2ed8:	00070493          	mv	s1,a4
   // Max Active pixel 3280* 2464--imx219
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_1, XStart >> 8);
    2edc:	0085d613          	srli	a2,a1,0x8
    2ee0:	16400593          	li	a1,356
    2ee4:	df1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_0, XStart & 0xFF);
    2ee8:	0ffa7613          	zext.b	a2,s4
    2eec:	16500593          	li	a1,357
    2ef0:	00040513          	mv	a0,s0
    2ef4:	de1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_1, XEnd >> 8);
    2ef8:	0089d613          	srli	a2,s3,0x8
    2efc:	16600593          	li	a1,358
    2f00:	00040513          	mv	a0,s0
    2f04:	dd1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_0, XEnd & 0xFF);
    2f08:	0ff9f613          	zext.b	a2,s3
    2f0c:	16700593          	li	a1,359
    2f10:	00040513          	mv	a0,s0
    2f14:	dc1ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_1, YStart >> 8);
    2f18:	00895613          	srli	a2,s2,0x8
    2f1c:	16800593          	li	a1,360
    2f20:	00040513          	mv	a0,s0
    2f24:	db1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_0, YStart & 0xFF);
    2f28:	0ff97613          	zext.b	a2,s2
    2f2c:	16900593          	li	a1,361
    2f30:	00040513          	mv	a0,s0
    2f34:	da1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
    2f38:	0084d613          	srli	a2,s1,0x8
    2f3c:	16a00593          	li	a1,362
    2f40:	00040513          	mv	a0,s0
    2f44:	d91ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
    2f48:	0ff4f613          	zext.b	a2,s1
    2f4c:	16b00593          	li	a1,363
    2f50:	00040513          	mv	a0,s0
    2f54:	d81ff0ef          	jal	2cd4 <PiCam_WriteRegData>
}
    2f58:	01c12083          	lw	ra,28(sp)
    2f5c:	01812403          	lw	s0,24(sp)
    2f60:	01412483          	lw	s1,20(sp)
    2f64:	01012903          	lw	s2,16(sp)
    2f68:	00c12983          	lw	s3,12(sp)
    2f6c:	00812a03          	lw	s4,8(sp)
    2f70:	02010113          	addi	sp,sp,32
    2f74:	00008067          	ret

00002f78 <PiCam_SetBinningMode>:
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
}

void PiCam_SetBinningMode(u32 i2c_base, u8 Xmode, u8 Ymode)
{
    2f78:	ff010113          	addi	sp,sp,-16
    2f7c:	00112623          	sw	ra,12(sp)
    2f80:	00812423          	sw	s0,8(sp)
    2f84:	00912223          	sw	s1,4(sp)
    2f88:	00050493          	mv	s1,a0
    2f8c:	00060413          	mv	s0,a2
   // 0:no-binning
   // 1:x2-binning
   // 2:x4-binning
   // 3:x2 analog (special)

   if (Xmode >= 3)
    2f90:	00200793          	li	a5,2
    2f94:	00b7f463          	bgeu	a5,a1,2f9c <PiCam_SetBinningMode+0x24>
      Xmode = 3;
    2f98:	00300593          	li	a1,3
   if (Ymode >= 3)
    2f9c:	00200793          	li	a5,2
    2fa0:	0087f463          	bgeu	a5,s0,2fa8 <PiCam_SetBinningMode+0x30>
      Ymode = 3;
    2fa4:	00300413          	li	s0,3

   PiCam_WriteRegData(i2c_base, BINNING_MODE_H_A, Xmode);
    2fa8:	00058613          	mv	a2,a1
    2fac:	17400593          	li	a1,372
    2fb0:	00048513          	mv	a0,s1
    2fb4:	d21ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, BINNING_MODE_V_A, Ymode);
    2fb8:	00040613          	mv	a2,s0
    2fbc:	17500593          	li	a1,373
    2fc0:	00048513          	mv	a0,s1
    2fc4:	d11ff0ef          	jal	2cd4 <PiCam_WriteRegData>
}
    2fc8:	00c12083          	lw	ra,12(sp)
    2fcc:	00812403          	lw	s0,8(sp)
    2fd0:	00412483          	lw	s1,4(sp)
    2fd4:	01010113          	addi	sp,sp,16
    2fd8:	00008067          	ret

00002fdc <PiCam_Gainfilter>:

   PiCam_Output_ColorBarSize(i2c_base, X, Y);
}

void PiCam_Gainfilter(u32 i2c_base, u8 AGain, u16 DGain)
{
    2fdc:	ff010113          	addi	sp,sp,-16
    2fe0:	00112623          	sw	ra,12(sp)
    2fe4:	00812423          	sw	s0,8(sp)
    2fe8:	00912223          	sw	s1,4(sp)
    2fec:	00050413          	mv	s0,a0
    2ff0:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, ANA_GAIN_GLOBAL_A, AGain & 0xFF);
    2ff4:	00058613          	mv	a2,a1
    2ff8:	15700593          	li	a1,343
    2ffc:	cd9ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_1, (DGain >> 8) & 0x0F);
    3000:	0084d613          	srli	a2,s1,0x8
    3004:	00f67613          	andi	a2,a2,15
    3008:	15800593          	li	a1,344
    300c:	00040513          	mv	a0,s0
    3010:	cc5ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_0, DGain & 0xFF);
    3014:	0ff4f613          	zext.b	a2,s1
    3018:	15900593          	li	a1,345
    301c:	00040513          	mv	a0,s0
    3020:	cb5ff0ef          	jal	2cd4 <PiCam_WriteRegData>
}
    3024:	00c12083          	lw	ra,12(sp)
    3028:	00812403          	lw	s0,8(sp)
    302c:	00412483          	lw	s1,4(sp)
    3030:	01010113          	addi	sp,sp,16
    3034:	00008067          	ret

00003038 <PiCam_init>:

// For cam1
void PiCam_init(u32 i2c_base)
{
    3038:	ff010113          	addi	sp,sp,-16
    303c:	00112623          	sw	ra,12(sp)
    3040:	00812423          	sw	s0,8(sp)
    3044:	00050413          	mv	s0,a0

   PiCam_WriteRegData(i2c_base, mode_select, 0x00);
    3048:	00000613          	li	a2,0
    304c:	10000593          	li	a1,256
    3050:	c85ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   AccessCommSeq(i2c_base);
    3054:	00040513          	mv	a0,s0
    3058:	d4dff0ef          	jal	2da4 <AccessCommSeq>
   PiCam_WriteRegData(i2c_base, CSI_LANE_MODE, 0x01);
    305c:	00100613          	li	a2,1
    3060:	11400593          	li	a1,276
    3064:	00040513          	mv	a0,s0
    3068:	c6dff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DPHY_CTRL, 0x00);
    306c:	00000613          	li	a2,0
    3070:	12800593          	li	a1,296
    3074:	00040513          	mv	a0,s0
    3078:	c5dff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_1, 0x18);
    307c:	01800613          	li	a2,24
    3080:	12a00593          	li	a1,298
    3084:	00040513          	mv	a0,s0
    3088:	c4dff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_0, 0x00);
    308c:	00000613          	li	a2,0
    3090:	12b00593          	li	a1,299
    3094:	00040513          	mv	a0,s0
    3098:	c3dff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x04);
    309c:	00400613          	li	a2,4
    30a0:	16000593          	li	a1,352
    30a4:	00040513          	mv	a0,s0
    30a8:	c2dff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0x59);
    30ac:	05900613          	li	a2,89
    30b0:	16100593          	li	a1,353
    30b4:	00040513          	mv	a0,s0
    30b8:	c1dff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    30bc:	00d00613          	li	a2,13
    30c0:	16200593          	li	a1,354
    30c4:	00040513          	mv	a0,s0
    30c8:	c0dff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    30cc:	07800613          	li	a2,120
    30d0:	16300593          	li	a1,355
    30d4:	00040513          	mv	a0,s0
    30d8:	bfdff0ef          	jal	2cd4 <PiCam_WriteRegData>

   //   PiCam_Output_activePixel(i2c_base, 0, 3279, 0, 2463);
   PiCam_Output_activePixel(i2c_base, 680, 2599, 692, 1771); // Capture centre of sensor
    30dc:	6eb00713          	li	a4,1771
    30e0:	2b400693          	li	a3,692
    30e4:	00001637          	lui	a2,0x1
    30e8:	a2760613          	addi	a2,a2,-1497 # a27 <CUSTOM2+0x9cc>
    30ec:	2a800593          	li	a1,680
    30f0:	00040513          	mv	a0,s0
    30f4:	db9ff0ef          	jal	2eac <PiCam_Output_activePixel>

   PiCam_Output_Size(i2c_base, 1920, 1080);
    30f8:	43800613          	li	a2,1080
    30fc:	78000593          	li	a1,1920
    3100:	00040513          	mv	a0,s0
    3104:	d35ff0ef          	jal	2e38 <PiCam_Output_Size>
   // PiCam_Output_Size(i2c_base, 1280, 720);
   // PiCam_Output_Size(i2c_base, 640, 480);

   PiCam_WriteRegData(i2c_base, X_ODD_INC_A, 0x01);
    3108:	00100613          	li	a2,1
    310c:	17000593          	li	a1,368
    3110:	00040513          	mv	a0,s0
    3114:	bc1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ODD_INC_A, 0x01);
    3118:	00100613          	li	a2,1
    311c:	17100593          	li	a1,369
    3120:	00040513          	mv	a0,s0
    3124:	bb1ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   // 0: No binning; 1: x2 binning; 2: x4 binning; 3: x2 binning (analog special)
   PiCam_SetBinningMode(i2c_base, 0, 0);
    3128:	00000613          	li	a2,0
    312c:	00000593          	li	a1,0
    3130:	00040513          	mv	a0,s0
    3134:	e45ff0ef          	jal	2f78 <PiCam_SetBinningMode>

   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_1, 0x0A);
    3138:	00a00613          	li	a2,10
    313c:	18c00593          	li	a1,396
    3140:	00040513          	mv	a0,s0
    3144:	b91ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_0, 0x0A);
    3148:	00a00613          	li	a2,10
    314c:	18d00593          	li	a1,397
    3150:	00040513          	mv	a0,s0
    3154:	b81ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, VTPXCK_DIV, 0x05);
    3158:	00500613          	li	a2,5
    315c:	30100593          	li	a1,769
    3160:	00040513          	mv	a0,s0
    3164:	b71ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, VTSYCK_DIV, 0x01);
    3168:	00100613          	li	a2,1
    316c:	30300593          	li	a1,771
    3170:	00040513          	mv	a0,s0
    3174:	b61ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_VT_DIV, 0x03);
    3178:	00300613          	li	a2,3
    317c:	30400593          	li	a1,772
    3180:	00040513          	mv	a0,s0
    3184:	b51ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_OP_DIV, 0x03);
    3188:	00300613          	li	a2,3
    318c:	30500593          	li	a1,773
    3190:	00040513          	mv	a0,s0
    3194:	b41ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_1, 0x00);
    3198:	00000613          	li	a2,0
    319c:	30600593          	li	a1,774
    31a0:	00040513          	mv	a0,s0
    31a4:	b31ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_0, 0x39);
    31a8:	03900613          	li	a2,57
    31ac:	30700593          	li	a1,775
    31b0:	00040513          	mv	a0,s0
    31b4:	b21ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    31b8:	00a00613          	li	a2,10
    31bc:	30900593          	li	a1,777
    31c0:	00040513          	mv	a0,s0
    31c4:	b11ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    31c8:	00100613          	li	a2,1
    31cc:	30b00593          	li	a1,779
    31d0:	00040513          	mv	a0,s0
    31d4:	b01ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    31d8:	00000613          	li	a2,0
    31dc:	30c00593          	li	a1,780
    31e0:	00040513          	mv	a0,s0
    31e4:	af1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    31e8:	07200613          	li	a2,114
    31ec:	30d00593          	li	a1,781
    31f0:	00040513          	mv	a0,s0
    31f4:	ae1ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    31f8:	00a00613          	li	a2,10
    31fc:	30900593          	li	a1,777
    3200:	00040513          	mv	a0,s0
    3204:	ad1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    3208:	00100613          	li	a2,1
    320c:	30b00593          	li	a1,779
    3210:	00040513          	mv	a0,s0
    3214:	ac1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    3218:	00000613          	li	a2,0
    321c:	30c00593          	li	a1,780
    3220:	00040513          	mv	a0,s0
    3224:	ab1ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    3228:	07200613          	li	a2,114
    322c:	30d00593          	li	a1,781
    3230:	00040513          	mv	a0,s0
    3234:	aa1ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, mode_select, 0x01);
    3238:	00100613          	li	a2,1
    323c:	10000593          	li	a1,256
    3240:	00040513          	mv	a0,s0
    3244:	a91ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_Gainfilter(i2c_base, 0xB9, 0x200);
    3248:	20000613          	li	a2,512
    324c:	0b900593          	li	a1,185
    3250:	00040513          	mv	a0,s0
    3254:	d89ff0ef          	jal	2fdc <PiCam_Gainfilter>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    3258:	00d00613          	li	a2,13
    325c:	16200593          	li	a1,354
    3260:	00040513          	mv	a0,s0
    3264:	a71ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    3268:	07800613          	li	a2,120
    326c:	16300593          	li	a1,355
    3270:	00040513          	mv	a0,s0
    3274:	a61ff0ef          	jal	2cd4 <PiCam_WriteRegData>
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
   */

   // Longer camera exposure time, suitable for low light condition. Trade-off with lower frame rate.
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x06);
    3278:	00600613          	li	a2,6
    327c:	16000593          	li	a1,352
    3280:	00040513          	mv	a0,s0
    3284:	a51ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0xE3);
    3288:	0e300613          	li	a2,227
    328c:	16100593          	li	a1,353
    3290:	00040513          	mv	a0,s0
    3294:	a41ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
    3298:	00400613          	li	a2,4
    329c:	15a00593          	li	a1,346
    32a0:	00040513          	mv	a0,s0
    32a4:	a31ff0ef          	jal	2cd4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
    32a8:	05400613          	li	a2,84
    32ac:	15b00593          	li	a1,347
    32b0:	00040513          	mv	a0,s0
    32b4:	a21ff0ef          	jal	2cd4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, IMG_ORIENTATION_A, 0x00);
    32b8:	00000613          	li	a2,0
    32bc:	17200593          	li	a1,370
    32c0:	00040513          	mv	a0,s0
    32c4:	a11ff0ef          	jal	2cd4 <PiCam_WriteRegData>
}
    32c8:	00c12083          	lw	ra,12(sp)
    32cc:	00812403          	lw	s0,8(sp)
    32d0:	01010113          	addi	sp,sp,16
    32d4:	00008067          	ret

000032d8 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    32d8:	04050713          	addi	a4,a0,64
    32dc:	21000793          	li	a5,528
    32e0:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    32e4:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    32e8:	0107f793          	andi	a5,a5,16
    32ec:	fe079ce3          	bnez	a5,32e4 <i2c_masterStartBlocking+0xc>
    }
    32f0:	00008067          	ret

000032f4 <i2c_txAckWait>:
    32f4:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    32f8:	1007f793          	andi	a5,a5,256
    32fc:	fe079ce3          	bnez	a5,32f4 <i2c_txAckWait>
    }
    3300:	00008067          	ret

00003304 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3304:	ff010113          	addi	sp,sp,-16
    3308:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    330c:	30100713          	li	a4,769
    3310:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3314:	fe1ff0ef          	jal	32f4 <i2c_txAckWait>
    }
    3318:	00c12083          	lw	ra,12(sp)
    331c:	01010113          	addi	sp,sp,16
    3320:	00008067          	ret

00003324 <i2c_rxAck>:
        return *((volatile u32*) address);
    3324:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3328:	0ff57513          	zext.b	a0,a0
    }
    332c:	00153513          	seqz	a0,a0
    3330:	00008067          	ret

00003334 <uart_writeAvailability>:
    3334:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3338:	01055513          	srli	a0,a0,0x10
    }
    333c:	0ff57513          	zext.b	a0,a0
    3340:	00008067          	ret

00003344 <uart_write>:
    static void uart_write(u32 reg, char data){
    3344:	ff010113          	addi	sp,sp,-16
    3348:	00112623          	sw	ra,12(sp)
    334c:	00812423          	sw	s0,8(sp)
    3350:	00912223          	sw	s1,4(sp)
    3354:	00050413          	mv	s0,a0
    3358:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    335c:	00040513          	mv	a0,s0
    3360:	fd5ff0ef          	jal	3334 <uart_writeAvailability>
    3364:	fe050ce3          	beqz	a0,335c <uart_write+0x18>
        *((volatile u32*) address) = data;
    3368:	00942023          	sw	s1,0(s0)
    }
    336c:	00c12083          	lw	ra,12(sp)
    3370:	00812403          	lw	s0,8(sp)
    3374:	00412483          	lw	s1,4(sp)
    3378:	01010113          	addi	sp,sp,16
    337c:	00008067          	ret

00003380 <_putchar>:
    static void _putchar(char character){
    3380:	ff010113          	addi	sp,sp,-16
    3384:	00112623          	sw	ra,12(sp)
    3388:	00050593          	mv	a1,a0
            bsp_putChar(character);
    338c:	f8010537          	lui	a0,0xf8010
    3390:	fb5ff0ef          	jal	3344 <uart_write>
    }
    3394:	00c12083          	lw	ra,12(sp)
    3398:	01010113          	addi	sp,sp,16
    339c:	00008067          	ret

000033a0 <_putchar_s>:
    {
    33a0:	ff010113          	addi	sp,sp,-16
    33a4:	00112623          	sw	ra,12(sp)
    33a8:	00812423          	sw	s0,8(sp)
    33ac:	00050413          	mv	s0,a0
        while (*p)
    33b0:	00c0006f          	j	33bc <_putchar_s+0x1c>
            _putchar(*(p++));
    33b4:	00140413          	addi	s0,s0,1
    33b8:	fc9ff0ef          	jal	3380 <_putchar>
        while (*p)
    33bc:	00044503          	lbu	a0,0(s0)
    33c0:	fe051ae3          	bnez	a0,33b4 <_putchar_s+0x14>
    }
    33c4:	00c12083          	lw	ra,12(sp)
    33c8:	00812403          	lw	s0,8(sp)
    33cc:	01010113          	addi	sp,sp,16
    33d0:	00008067          	ret

000033d4 <bsp_printHex>:
    {
    33d4:	ff010113          	addi	sp,sp,-16
    33d8:	00112623          	sw	ra,12(sp)
    33dc:	00812423          	sw	s0,8(sp)
    33e0:	00912223          	sw	s1,4(sp)
    33e4:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    33e8:	01c00413          	li	s0,28
    33ec:	0240006f          	j	3410 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    33f0:	0084d733          	srl	a4,s1,s0
    33f4:	00f77713          	andi	a4,a4,15
    33f8:	000047b7          	lui	a5,0x4
    33fc:	08078793          	addi	a5,a5,128 # 4080 <_data>
    3400:	00e787b3          	add	a5,a5,a4
    3404:	0007c503          	lbu	a0,0(a5)
    3408:	f79ff0ef          	jal	3380 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    340c:	ffc40413          	addi	s0,s0,-4
    3410:	fe0450e3          	bgez	s0,33f0 <bsp_printHex+0x1c>
    }
    3414:	00c12083          	lw	ra,12(sp)
    3418:	00812403          	lw	s0,8(sp)
    341c:	00412483          	lw	s1,4(sp)
    3420:	01010113          	addi	sp,sp,16
    3424:	00008067          	ret

00003428 <bsp_printHex_lower>:
    {
    3428:	ff010113          	addi	sp,sp,-16
    342c:	00112623          	sw	ra,12(sp)
    3430:	00812423          	sw	s0,8(sp)
    3434:	00912223          	sw	s1,4(sp)
    3438:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    343c:	01c00413          	li	s0,28
    3440:	0240006f          	j	3464 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    3444:	0084d733          	srl	a4,s1,s0
    3448:	00f77713          	andi	a4,a4,15
    344c:	000047b7          	lui	a5,0x4
    3450:	09478793          	addi	a5,a5,148 # 4094 <_data+0x14>
    3454:	00e787b3          	add	a5,a5,a4
    3458:	0007c503          	lbu	a0,0(a5)
    345c:	f25ff0ef          	jal	3380 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3460:	ffc40413          	addi	s0,s0,-4
    3464:	fe0450e3          	bgez	s0,3444 <bsp_printHex_lower+0x1c>
    }
    3468:	00c12083          	lw	ra,12(sp)
    346c:	00812403          	lw	s0,8(sp)
    3470:	00412483          	lw	s1,4(sp)
    3474:	01010113          	addi	sp,sp,16
    3478:	00008067          	ret

0000347c <bsp_printf_c>:
    {
    347c:	ff010113          	addi	sp,sp,-16
    3480:	00112623          	sw	ra,12(sp)
        _putchar(c);
    3484:	0ff57513          	zext.b	a0,a0
    3488:	ef9ff0ef          	jal	3380 <_putchar>
    }
    348c:	00c12083          	lw	ra,12(sp)
    3490:	01010113          	addi	sp,sp,16
    3494:	00008067          	ret

00003498 <bsp_printf_s>:
    {
    3498:	ff010113          	addi	sp,sp,-16
    349c:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    34a0:	f01ff0ef          	jal	33a0 <_putchar_s>
    }
    34a4:	00c12083          	lw	ra,12(sp)
    34a8:	01010113          	addi	sp,sp,16
    34ac:	00008067          	ret

000034b0 <bsp_printf_d>:
    {
    34b0:	fd010113          	addi	sp,sp,-48
    34b4:	02112623          	sw	ra,44(sp)
    34b8:	02812423          	sw	s0,40(sp)
    34bc:	02912223          	sw	s1,36(sp)
    34c0:	00050493          	mv	s1,a0
        if (val < 0) {
    34c4:	00054663          	bltz	a0,34d0 <bsp_printf_d+0x20>
    {
    34c8:	00010413          	mv	s0,sp
    34cc:	02c0006f          	j	34f8 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    34d0:	02d00513          	li	a0,45
    34d4:	fa9ff0ef          	jal	347c <bsp_printf_c>
            val = -val;
    34d8:	409004b3          	neg	s1,s1
    34dc:	fedff06f          	j	34c8 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    34e0:	00a00713          	li	a4,10
    34e4:	02e4e7b3          	rem	a5,s1,a4
    34e8:	03078793          	addi	a5,a5,48
    34ec:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    34f0:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    34f4:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    34f8:	fe0494e3          	bnez	s1,34e0 <bsp_printf_d+0x30>
    34fc:	00010793          	mv	a5,sp
    3500:	fef400e3          	beq	s0,a5,34e0 <bsp_printf_d+0x30>
        while (p != buffer)
    3504:	00010793          	mv	a5,sp
    3508:	00f40a63          	beq	s0,a5,351c <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    350c:	fff40413          	addi	s0,s0,-1
    3510:	00044503          	lbu	a0,0(s0)
    3514:	f69ff0ef          	jal	347c <bsp_printf_c>
    3518:	fedff06f          	j	3504 <bsp_printf_d+0x54>
    }
    351c:	02c12083          	lw	ra,44(sp)
    3520:	02812403          	lw	s0,40(sp)
    3524:	02412483          	lw	s1,36(sp)
    3528:	03010113          	addi	sp,sp,48
    352c:	00008067          	ret

00003530 <bsp_printf_x>:
    {
    3530:	ff010113          	addi	sp,sp,-16
    3534:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    3538:	00000713          	li	a4,0
    353c:	00700793          	li	a5,7
    3540:	02e7c063          	blt	a5,a4,3560 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3544:	00271693          	slli	a3,a4,0x2
    3548:	ff000793          	li	a5,-16
    354c:	00d797b3          	sll	a5,a5,a3
    3550:	00f577b3          	and	a5,a0,a5
    3554:	00078663          	beqz	a5,3560 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    3558:	00170713          	addi	a4,a4,1
    355c:	fe1ff06f          	j	353c <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    3560:	ec9ff0ef          	jal	3428 <bsp_printHex_lower>
    }
    3564:	00c12083          	lw	ra,12(sp)
    3568:	01010113          	addi	sp,sp,16
    356c:	00008067          	ret

00003570 <bsp_printf_X>:
        {
    3570:	ff010113          	addi	sp,sp,-16
    3574:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    3578:	00000713          	li	a4,0
    357c:	00700793          	li	a5,7
    3580:	02e7c063          	blt	a5,a4,35a0 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3584:	00271693          	slli	a3,a4,0x2
    3588:	ff000793          	li	a5,-16
    358c:	00d797b3          	sll	a5,a5,a3
    3590:	00f577b3          	and	a5,a0,a5
    3594:	00078663          	beqz	a5,35a0 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    3598:	00170713          	addi	a4,a4,1
    359c:	fe1ff06f          	j	357c <bsp_printf_X+0xc>
            bsp_printHex(val);
    35a0:	e35ff0ef          	jal	33d4 <bsp_printHex>
        }
    35a4:	00c12083          	lw	ra,12(sp)
    35a8:	01010113          	addi	sp,sp,16
    35ac:	00008067          	ret

000035b0 <mipi_i2c_probe>:
// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    35b0:	ff010113          	addi	sp,sp,-16
    35b4:	00112623          	sw	ra,12(sp)
    35b8:	00812423          	sw	s0,8(sp)
    35bc:	00912223          	sw	s1,4(sp)
    35c0:	00050413          	mv	s0,a0
    35c4:	00058493          	mv	s1,a1
    i2c_masterStartBlocking(i2cCtrl);
    35c8:	d11ff0ef          	jal	32d8 <i2c_masterStartBlocking>
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    35cc:	000017b7          	lui	a5,0x1
    35d0:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    35d4:	00f4e4b3          	or	s1,s1,a5
    35d8:	00942023          	sw	s1,0(s0)
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    35dc:	00040513          	mv	a0,s0
    35e0:	d25ff0ef          	jal	3304 <i2c_txNackBlocking>
    return i2c_rxAck(i2cCtrl);
    35e4:	00040513          	mv	a0,s0
    35e8:	d3dff0ef          	jal	3324 <i2c_rxAck>
}
    35ec:	00c12083          	lw	ra,12(sp)
    35f0:	00812403          	lw	s0,8(sp)
    35f4:	00412483          	lw	s1,4(sp)
    35f8:	01010113          	addi	sp,sp,16
    35fc:	00008067          	ret

00003600 <bsp_printf>:
    {
    3600:	fc010113          	addi	sp,sp,-64
    3604:	00112e23          	sw	ra,28(sp)
    3608:	00812c23          	sw	s0,24(sp)
    360c:	00912a23          	sw	s1,20(sp)
    3610:	00050493          	mv	s1,a0
    3614:	02b12223          	sw	a1,36(sp)
    3618:	02c12423          	sw	a2,40(sp)
    361c:	02d12623          	sw	a3,44(sp)
    3620:	02e12823          	sw	a4,48(sp)
    3624:	02f12a23          	sw	a5,52(sp)
    3628:	03012c23          	sw	a6,56(sp)
    362c:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    3630:	02410793          	addi	a5,sp,36
    3634:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    3638:	00000413          	li	s0,0
    363c:	01c0006f          	j	3658 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    3640:	00c12783          	lw	a5,12(sp)
    3644:	00478713          	addi	a4,a5,4
    3648:	00e12623          	sw	a4,12(sp)
    364c:	0007a503          	lw	a0,0(a5)
    3650:	e2dff0ef          	jal	347c <bsp_printf_c>
        for (i = 0; format[i]; i++)
    3654:	00140413          	addi	s0,s0,1
    3658:	008487b3          	add	a5,s1,s0
    365c:	0007c503          	lbu	a0,0(a5)
    3660:	0a050e63          	beqz	a0,371c <bsp_printf+0x11c>
            if (format[i] == '%') {
    3664:	02500793          	li	a5,37
    3668:	06f50e63          	beq	a0,a5,36e4 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    366c:	e11ff0ef          	jal	347c <bsp_printf_c>
    3670:	fe5ff06f          	j	3654 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    3674:	00c12783          	lw	a5,12(sp)
    3678:	00478713          	addi	a4,a5,4
    367c:	00e12623          	sw	a4,12(sp)
    3680:	0007a503          	lw	a0,0(a5)
    3684:	e15ff0ef          	jal	3498 <bsp_printf_s>
                        break;
    3688:	fcdff06f          	j	3654 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    368c:	00c12783          	lw	a5,12(sp)
    3690:	00478713          	addi	a4,a5,4
    3694:	00e12623          	sw	a4,12(sp)
    3698:	0007a503          	lw	a0,0(a5)
    369c:	e15ff0ef          	jal	34b0 <bsp_printf_d>
                        break;
    36a0:	fb5ff06f          	j	3654 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    36a4:	00c12783          	lw	a5,12(sp)
    36a8:	00478713          	addi	a4,a5,4
    36ac:	00e12623          	sw	a4,12(sp)
    36b0:	0007a503          	lw	a0,0(a5)
    36b4:	ebdff0ef          	jal	3570 <bsp_printf_X>
                        break;
    36b8:	f9dff06f          	j	3654 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    36bc:	00c12783          	lw	a5,12(sp)
    36c0:	00478713          	addi	a4,a5,4
    36c4:	00e12623          	sw	a4,12(sp)
    36c8:	0007a503          	lw	a0,0(a5)
    36cc:	e65ff0ef          	jal	3530 <bsp_printf_x>
                        break;
    36d0:	f85ff06f          	j	3654 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    36d4:	00004537          	lui	a0,0x4
    36d8:	0a850513          	addi	a0,a0,168 # 40a8 <_data+0x28>
    36dc:	dbdff0ef          	jal	3498 <bsp_printf_s>
                        break;
    36e0:	f75ff06f          	j	3654 <bsp_printf+0x54>
                while (format[++i]) {
    36e4:	00140413          	addi	s0,s0,1
    36e8:	008487b3          	add	a5,s1,s0
    36ec:	0007c783          	lbu	a5,0(a5)
    36f0:	f60782e3          	beqz	a5,3654 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    36f4:	fa878793          	addi	a5,a5,-88
    36f8:	0ff7f693          	zext.b	a3,a5
    36fc:	02000713          	li	a4,32
    3700:	fed762e3          	bltu	a4,a3,36e4 <bsp_printf+0xe4>
    3704:	00269793          	slli	a5,a3,0x2
    3708:	00004737          	lui	a4,0x4
    370c:	79070713          	addi	a4,a4,1936 # 4790 <_data+0x710>
    3710:	00e787b3          	add	a5,a5,a4
    3714:	0007a783          	lw	a5,0(a5)
    3718:	00078067          	jr	a5
    }
    371c:	01c12083          	lw	ra,28(sp)
    3720:	01812403          	lw	s0,24(sp)
    3724:	01412483          	lw	s1,20(sp)
    3728:	04010113          	addi	sp,sp,64
    372c:	00008067          	ret

00003730 <camera_init>:
// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    3730:	fe010113          	addi	sp,sp,-32
    3734:	00112e23          	sw	ra,28(sp)
    3738:	00812c23          	sw	s0,24(sp)
    373c:	00912a23          	sw	s1,20(sp)
    3740:	01212823          	sw	s2,16(sp)
    3744:	01312623          	sw	s3,12(sp)
    3748:	00050913          	mv	s2,a0
    374c:	00058493          	mv	s1,a1
    mipi_i2c_init(i2cCtrl);
    3750:	00058513          	mv	a0,a1
    3754:	eb0fe0ef          	jal	1e04 <mipi_i2c_init>

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3758:	00000413          	li	s0,0
    375c:	00100793          	li	a5,1
    3760:	0a87e863          	bltu	a5,s0,3810 <camera_init+0xe0>
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
    3764:	000057b7          	lui	a5,0x5
    3768:	00241713          	slli	a4,s0,0x2
    376c:	00870733          	add	a4,a4,s0
    3770:	00271713          	slli	a4,a4,0x2
    3774:	81478793          	addi	a5,a5,-2028 # 4814 <supportedCamera>
    3778:	00e787b3          	add	a5,a5,a4
    377c:	0007c983          	lbu	s3,0(a5)
    3780:	00098593          	mv	a1,s3
    3784:	00048513          	mv	a0,s1
    3788:	e29ff0ef          	jal	35b0 <mipi_i2c_probe>
    378c:	00100793          	li	a5,1
    3790:	00f50663          	beq	a0,a5,379c <camera_init+0x6c>
    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3794:	00140413          	addi	s0,s0,1
    3798:	fc5ff06f          	j	375c <camera_init+0x2c>
    379c:	01412423          	sw	s4,8(sp)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
    37a0:	00005a37          	lui	s4,0x5
    37a4:	00241793          	slli	a5,s0,0x2
    37a8:	008787b3          	add	a5,a5,s0
    37ac:	00279793          	slli	a5,a5,0x2
    37b0:	814a0a13          	addi	s4,s4,-2028 # 4814 <supportedCamera>
    37b4:	00fa0a33          	add	s4,s4,a5
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
    37b8:	0019d693          	srli	a3,s3,0x1
    37bc:	008a2603          	lw	a2,8(s4)
    37c0:	00090593          	mv	a1,s2
    37c4:	00004537          	lui	a0,0x4
    37c8:	5b850513          	addi	a0,a0,1464 # 45b8 <_data+0x538>
    37cc:	e35ff0ef          	jal	3600 <bsp_printf>
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
    37d0:	00ca2783          	lw	a5,12(s4)
    37d4:	00078663          	beqz	a5,37e0 <camera_init+0xb0>
                supportedCamera[i].init(i2cCtrl);
    37d8:	00048513          	mv	a0,s1
    37dc:	000780e7          	jalr	a5

            if (supportedCamera[i].start_stream != NULL)
    37e0:	000057b7          	lui	a5,0x5
    37e4:	00241713          	slli	a4,s0,0x2
    37e8:	00870733          	add	a4,a4,s0
    37ec:	00271713          	slli	a4,a4,0x2
    37f0:	81478793          	addi	a5,a5,-2028 # 4814 <supportedCamera>
    37f4:	00e787b3          	add	a5,a5,a4
    37f8:	0107a783          	lw	a5,16(a5)
    37fc:	04078063          	beqz	a5,383c <camera_init+0x10c>
                supportedCamera[i].start_stream(i2cCtrl);
    3800:	00048513          	mv	a0,s1
    3804:	000780e7          	jalr	a5
            return;
    3808:	00812a03          	lw	s4,8(sp)
    380c:	0140006f          	j	3820 <camera_init+0xf0>
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
    3810:	00090593          	mv	a1,s2
    3814:	00004537          	lui	a0,0x4
    3818:	5e050513          	addi	a0,a0,1504 # 45e0 <_data+0x560>
    381c:	de5ff0ef          	jal	3600 <bsp_printf>
}
    3820:	01c12083          	lw	ra,28(sp)
    3824:	01812403          	lw	s0,24(sp)
    3828:	01412483          	lw	s1,20(sp)
    382c:	01012903          	lw	s2,16(sp)
    3830:	00c12983          	lw	s3,12(sp)
    3834:	02010113          	addi	sp,sp,32
    3838:	00008067          	ret
    383c:	00812a03          	lw	s4,8(sp)
    3840:	fe1ff06f          	j	3820 <camera_init+0xf0>

00003844 <cam0_init>:

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
    3844:	ff010113          	addi	sp,sp,-16
    3848:	00112623          	sw	ra,12(sp)
    384c:	00050593          	mv	a1,a0
    3850:	00000513          	li	a0,0
    3854:	eddff0ef          	jal	3730 <camera_init>
    3858:	00c12083          	lw	ra,12(sp)
    385c:	01010113          	addi	sp,sp,16
    3860:	00008067          	ret

00003864 <uart_writeAvailability>:
        return *((volatile u32*) address);
    3864:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3868:	01055513          	srli	a0,a0,0x10
    }
    386c:	0ff57513          	zext.b	a0,a0
    3870:	00008067          	ret

00003874 <uart_write>:
    static void uart_write(u32 reg, char data){
    3874:	ff010113          	addi	sp,sp,-16
    3878:	00112623          	sw	ra,12(sp)
    387c:	00812423          	sw	s0,8(sp)
    3880:	00912223          	sw	s1,4(sp)
    3884:	00050413          	mv	s0,a0
    3888:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    388c:	00040513          	mv	a0,s0
    3890:	fd5ff0ef          	jal	3864 <uart_writeAvailability>
    3894:	fe050ce3          	beqz	a0,388c <uart_write+0x18>
        *((volatile u32*) address) = data;
    3898:	00942023          	sw	s1,0(s0)
    }
    389c:	00c12083          	lw	ra,12(sp)
    38a0:	00812403          	lw	s0,8(sp)
    38a4:	00412483          	lw	s1,4(sp)
    38a8:	01010113          	addi	sp,sp,16
    38ac:	00008067          	ret

000038b0 <uart_writeStr>:
    static void uart_writeStr(u32 reg, const char* str){
    38b0:	ff010113          	addi	sp,sp,-16
    38b4:	00112623          	sw	ra,12(sp)
    38b8:	00812423          	sw	s0,8(sp)
    38bc:	00912223          	sw	s1,4(sp)
    38c0:	00050493          	mv	s1,a0
    38c4:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    38c8:	0100006f          	j	38d8 <uart_writeStr+0x28>
    38cc:	00140413          	addi	s0,s0,1
    38d0:	00048513          	mv	a0,s1
    38d4:	fa1ff0ef          	jal	3874 <uart_write>
    38d8:	00044583          	lbu	a1,0(s0)
    38dc:	fe0598e3          	bnez	a1,38cc <uart_writeStr+0x1c>
    }
    38e0:	00c12083          	lw	ra,12(sp)
    38e4:	00812403          	lw	s0,8(sp)
    38e8:	00412483          	lw	s1,4(sp)
    38ec:	01010113          	addi	sp,sp,16
    38f0:	00008067          	ret

000038f4 <i2c_masterBusy>:
        return *((volatile u32*) address);
    38f4:	04052503          	lw	a0,64(a0)
    }
    38f8:	00157513          	andi	a0,a0,1
    38fc:	00008067          	ret

00003900 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3900:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3904:	21000793          	li	a5,528
    3908:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    390c:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3910:	0107f793          	andi	a5,a5,16
    3914:	fe079ce3          	bnez	a5,390c <i2c_masterStartBlocking+0xc>
    }
    3918:	00008067          	ret

0000391c <i2c_masterStopWait>:
    static void i2c_masterStopWait(u32 reg){
    391c:	ff010113          	addi	sp,sp,-16
    3920:	00112623          	sw	ra,12(sp)
    3924:	00812423          	sw	s0,8(sp)
    3928:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    392c:	00040513          	mv	a0,s0
    3930:	fc5ff0ef          	jal	38f4 <i2c_masterBusy>
    3934:	fe051ce3          	bnez	a0,392c <i2c_masterStopWait+0x10>
    }
    3938:	00c12083          	lw	ra,12(sp)
    393c:	00812403          	lw	s0,8(sp)
    3940:	01010113          	addi	sp,sp,16
    3944:	00008067          	ret

00003948 <i2c_masterStopBlocking>:
    static void i2c_masterStopBlocking(u32 reg){
    3948:	ff010113          	addi	sp,sp,-16
    394c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3950:	42000713          	li	a4,1056
    3954:	04e52023          	sw	a4,64(a0)
        i2c_masterStopWait(reg);
    3958:	fc5ff0ef          	jal	391c <i2c_masterStopWait>
    }
    395c:	00c12083          	lw	ra,12(sp)
    3960:	01010113          	addi	sp,sp,16
    3964:	00008067          	ret

00003968 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3968:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    396c:	1007f793          	andi	a5,a5,256
    3970:	fe079ce3          	bnez	a5,3968 <i2c_txAckWait>
    }
    3974:	00008067          	ret

00003978 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3978:	ff010113          	addi	sp,sp,-16
    397c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3980:	30100713          	li	a4,769
    3984:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3988:	fe1ff0ef          	jal	3968 <i2c_txAckWait>
    }
    398c:	00c12083          	lw	ra,12(sp)
    3990:	01010113          	addi	sp,sp,16
    3994:	00008067          	ret

00003998 <i2c_rxAck>:
        return *((volatile u32*) address);
    3998:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    399c:	0ff57513          	zext.b	a0,a0
    }
    39a0:	00153513          	seqz	a0,a0
    39a4:	00008067          	ret

000039a8 <PiCamV3_WriteRegData>:
#include "riscv.h"
#include "PiCamV3Driver.h"
#include "common.h"

void PiCamV3_WriteRegData(u32 i2c_addr, u16 reg, u8 data)
{
    39a8:	fe010113          	addi	sp,sp,-32
    39ac:	00112e23          	sw	ra,28(sp)
    39b0:	00812c23          	sw	s0,24(sp)
    39b4:	00912a23          	sw	s1,20(sp)
    39b8:	01212823          	sw	s2,16(sp)
    39bc:	01312623          	sw	s3,12(sp)
    39c0:	00050413          	mv	s0,a0
    39c4:	00058493          	mv	s1,a1
    39c8:	00060913          	mv	s2,a2
	u8 outdata;

	i2c_masterStartBlocking(i2c_addr);
    39cc:	f35ff0ef          	jal	3900 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    39d0:	000017b7          	lui	a5,0x1
    39d4:	b3478793          	addi	a5,a5,-1228 # b34 <CUSTOM2+0xad9>
    39d8:	00f42023          	sw	a5,0(s0)

	i2c_txByte(i2c_addr, IMX708_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    39dc:	00040513          	mv	a0,s0
    39e0:	f99ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    39e4:	00040513          	mv	a0,s0
    39e8:	fb1ff0ef          	jal	3998 <i2c_rxAck>
    39ec:	bc8fe0ef          	jal	1db4 <assert>

	i2c_txByte(i2c_addr, (reg >> 8) & 0xFF);
    39f0:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    39f4:	000019b7          	lui	s3,0x1
    39f8:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    39fc:	0137e7b3          	or	a5,a5,s3
    3a00:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3a04:	00040513          	mv	a0,s0
    3a08:	f71ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3a0c:	00040513          	mv	a0,s0
    3a10:	f89ff0ef          	jal	3998 <i2c_rxAck>
    3a14:	ba0fe0ef          	jal	1db4 <assert>

	i2c_txByte(i2c_addr, (reg) & 0xFF);
    3a18:	0ff4f493          	zext.b	s1,s1
    3a1c:	0134e4b3          	or	s1,s1,s3
    3a20:	00942023          	sw	s1,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3a24:	00040513          	mv	a0,s0
    3a28:	f51ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3a2c:	00040513          	mv	a0,s0
    3a30:	f69ff0ef          	jal	3998 <i2c_rxAck>
    3a34:	b80fe0ef          	jal	1db4 <assert>
    3a38:	01396933          	or	s2,s2,s3
    3a3c:	01242023          	sw	s2,0(s0)

	i2c_txByte(i2c_addr, data & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3a40:	00040513          	mv	a0,s0
    3a44:	f35ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3a48:	00040513          	mv	a0,s0
    3a4c:	f4dff0ef          	jal	3998 <i2c_rxAck>
    3a50:	b64fe0ef          	jal	1db4 <assert>

	i2c_masterStopBlocking(i2c_addr);
    3a54:	00040513          	mv	a0,s0
    3a58:	ef1ff0ef          	jal	3948 <i2c_masterStopBlocking>
}
    3a5c:	01c12083          	lw	ra,28(sp)
    3a60:	01812403          	lw	s0,24(sp)
    3a64:	01412483          	lw	s1,20(sp)
    3a68:	01012903          	lw	s2,16(sp)
    3a6c:	00c12983          	lw	s3,12(sp)
    3a70:	02010113          	addi	sp,sp,32
    3a74:	00008067          	ret

00003a78 <PiCamV3_StartStreaming>:

	return outdata;
}

void PiCamV3_StartStreaming(u32 i2c_addr)
{
    3a78:	ff010113          	addi	sp,sp,-16
    3a7c:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_ACTIVE);
    3a80:	00100613          	li	a2,1
    3a84:	10000593          	li	a1,256
    3a88:	f21ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
}
    3a8c:	00c12083          	lw	ra,12(sp)
    3a90:	01010113          	addi	sp,sp,16
    3a94:	00008067          	ret

00003a98 <PiCamV3_StopStreaming>:

void PiCamV3_StopStreaming(u32 i2c_addr)
{
    3a98:	ff010113          	addi	sp,sp,-16
    3a9c:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_SLEEP);
    3aa0:	00000613          	li	a2,0
    3aa4:	10000593          	li	a1,256
    3aa8:	f01ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
}
    3aac:	00c12083          	lw	ra,12(sp)
    3ab0:	01010113          	addi	sp,sp,16
    3ab4:	00008067          	ret

00003ab8 <PiCamV3_ConfigCommon>:

void PiCamV3_ConfigCommon(u32 i2c_addr)
{
    3ab8:	ff010113          	addi	sp,sp,-16
    3abc:	00112623          	sw	ra,12(sp)
    3ac0:	00812423          	sw	s0,8(sp)
    3ac4:	00912223          	sw	s1,4(sp)
    3ac8:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3acc:	00000413          	li	s0,0
    3ad0:	0280006f          	j	3af8 <PiCamV3_ConfigCommon+0x40>
	{
		PiCamV3_WriteRegData(i2c_addr, mode_common_regs[i].address, mode_common_regs[i].val);
    3ad4:	000057b7          	lui	a5,0x5
    3ad8:	00241713          	slli	a4,s0,0x2
    3adc:	ca478793          	addi	a5,a5,-860 # 4ca4 <mode_common_regs>
    3ae0:	00e787b3          	add	a5,a5,a4
    3ae4:	0027c603          	lbu	a2,2(a5)
    3ae8:	0007d583          	lhu	a1,0(a5)
    3aec:	00048513          	mv	a0,s1
    3af0:	eb9ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3af4:	00140413          	addi	s0,s0,1
    3af8:	02f00793          	li	a5,47
    3afc:	fc87fce3          	bgeu	a5,s0,3ad4 <PiCamV3_ConfigCommon+0x1c>
	}
}
    3b00:	00c12083          	lw	ra,12(sp)
    3b04:	00812403          	lw	s0,8(sp)
    3b08:	00412483          	lw	s1,4(sp)
    3b0c:	01010113          	addi	sp,sp,16
    3b10:	00008067          	ret

00003b14 <PiCamV3_ConfigFormat>:

void PiCamV3_ConfigFormat(u32 i2c_addr, u8 mode)
{
    3b14:	ff010113          	addi	sp,sp,-16
    3b18:	00112623          	sw	ra,12(sp)
    3b1c:	00912223          	sw	s1,4(sp)
    3b20:	00050493          	mv	s1,a0
	// 	MODE
	//  0 : 1920 x 1080 cropped, 50FPS
	//	1 : 1920 x 1080 2x2 binned, 60 FPS
	//  2 : 1920 x 1080 HDR, 50 FPS

	if (mode == 0)
    3b24:	08058663          	beqz	a1,3bb0 <PiCamV3_ConfigFormat+0x9c>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
		}
	}

	else if (mode == 1)
    3b28:	00100793          	li	a5,1
    3b2c:	0cf58263          	beq	a1,a5,3bf0 <PiCamV3_ConfigFormat+0xdc>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
		}
	}

	else if (mode == 2)
    3b30:	00200793          	li	a5,2
    3b34:	06f59663          	bne	a1,a5,3ba0 <PiCamV3_ConfigFormat+0x8c>
    3b38:	00812423          	sw	s0,8(sp)
	{
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3b3c:	00000413          	li	s0,0
    3b40:	05e00793          	li	a5,94
    3b44:	0a87ec63          	bltu	a5,s0,3bfc <PiCamV3_ConfigFormat+0xe8>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_hdr_1920x1080_regs[i].address, mode_hdr_1920x1080_regs[i].val);
    3b48:	000057b7          	lui	a5,0x5
    3b4c:	00241713          	slli	a4,s0,0x2
    3b50:	85078793          	addi	a5,a5,-1968 # 4850 <mode_hdr_1920x1080_regs>
    3b54:	00e787b3          	add	a5,a5,a4
    3b58:	0027c603          	lbu	a2,2(a5)
    3b5c:	0007d583          	lhu	a1,0(a5)
    3b60:	00048513          	mv	a0,s1
    3b64:	e45ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3b68:	00140413          	addi	s0,s0,1
    3b6c:	fd5ff06f          	j	3b40 <PiCamV3_ConfigFormat+0x2c>
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
    3b70:	000057b7          	lui	a5,0x5
    3b74:	00241713          	slli	a4,s0,0x2
    3b78:	b3878793          	addi	a5,a5,-1224 # 4b38 <mode_1920x1080_cropped_regs>
    3b7c:	00e787b3          	add	a5,a5,a4
    3b80:	0027c603          	lbu	a2,2(a5)
    3b84:	0007d583          	lhu	a1,0(a5)
    3b88:	00048513          	mv	a0,s1
    3b8c:	e1dff0ef          	jal	39a8 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3b90:	00140413          	addi	s0,s0,1
    3b94:	05a00793          	li	a5,90
    3b98:	fc87fce3          	bgeu	a5,s0,3b70 <PiCamV3_ConfigFormat+0x5c>
    3b9c:	00812403          	lw	s0,8(sp)
		}
	}
}
    3ba0:	00c12083          	lw	ra,12(sp)
    3ba4:	00412483          	lw	s1,4(sp)
    3ba8:	01010113          	addi	sp,sp,16
    3bac:	00008067          	ret
    3bb0:	00812423          	sw	s0,8(sp)
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3bb4:	00000413          	li	s0,0
    3bb8:	fddff06f          	j	3b94 <PiCamV3_ConfigFormat+0x80>
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
    3bbc:	000057b7          	lui	a5,0x5
    3bc0:	00241713          	slli	a4,s0,0x2
    3bc4:	9cc78793          	addi	a5,a5,-1588 # 49cc <mode_2x2binned_1920x1080_regs>
    3bc8:	00e787b3          	add	a5,a5,a4
    3bcc:	0027c603          	lbu	a2,2(a5)
    3bd0:	0007d583          	lhu	a1,0(a5)
    3bd4:	00048513          	mv	a0,s1
    3bd8:	dd1ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_2x2binned_1920x1080_regs) / sizeof(mode_2x2binned_1920x1080_regs[0]); i++)
    3bdc:	00140413          	addi	s0,s0,1
    3be0:	05a00793          	li	a5,90
    3be4:	fc87fce3          	bgeu	a5,s0,3bbc <PiCamV3_ConfigFormat+0xa8>
    3be8:	00812403          	lw	s0,8(sp)
    3bec:	fb5ff06f          	j	3ba0 <PiCamV3_ConfigFormat+0x8c>
    3bf0:	00812423          	sw	s0,8(sp)
    3bf4:	00000413          	li	s0,0
    3bf8:	fe9ff06f          	j	3be0 <PiCamV3_ConfigFormat+0xcc>
    3bfc:	00812403          	lw	s0,8(sp)
    3c00:	fa1ff06f          	j	3ba0 <PiCamV3_ConfigFormat+0x8c>

00003c04 <PiCamV3_ConfigLinkFreq>:

void PiCamV3_ConfigLinkFreq(u32 i2c_addr)
{
    3c04:	ff010113          	addi	sp,sp,-16
    3c08:	00112623          	sw	ra,12(sp)
    3c0c:	00812423          	sw	s0,8(sp)
    3c10:	00912223          	sw	s1,4(sp)
    3c14:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    3c18:	00000413          	li	s0,0
    3c1c:	0240006f          	j	3c40 <PiCamV3_ConfigLinkFreq+0x3c>
	{
		PiCamV3_WriteRegData(i2c_addr, link_450Mhz_regs[i].address, link_450Mhz_regs[i].val);
    3c20:	00241713          	slli	a4,s0,0x2
    3c24:	81818793          	addi	a5,gp,-2024 # 4fb0 <link_450Mhz_regs>
    3c28:	00e787b3          	add	a5,a5,a4
    3c2c:	0027c603          	lbu	a2,2(a5)
    3c30:	0007d583          	lhu	a1,0(a5)
    3c34:	00048513          	mv	a0,s1
    3c38:	d71ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    3c3c:	00140413          	addi	s0,s0,1
    3c40:	00100793          	li	a5,1
    3c44:	fc87fee3          	bgeu	a5,s0,3c20 <PiCamV3_ConfigLinkFreq+0x1c>
	}
}
    3c48:	00c12083          	lw	ra,12(sp)
    3c4c:	00812403          	lw	s0,8(sp)
    3c50:	00412483          	lw	s1,4(sp)
    3c54:	01010113          	addi	sp,sp,16
    3c58:	00008067          	ret

00003c5c <PiCamV3_ConfigQuadBayerRemosaicAdjustment>:

void PiCamV3_ConfigQuadBayerRemosaicAdjustment(u32 i2c_addr)
{
    3c5c:	ff010113          	addi	sp,sp,-16
    3c60:	00112623          	sw	ra,12(sp)
    3c64:	00812423          	sw	s0,8(sp)
    3c68:	00050413          	mv	s0,a0
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED);
    3c6c:	00000613          	li	a2,0
    3c70:	0000c5b7          	lui	a1,0xc
    3c74:	42858593          	addi	a1,a1,1064 # c428 <__freertos_irq_stack_top+0x62c8>
    3c78:	d31ff0ef          	jal	39a8 <PiCamV3_WriteRegData>
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY, 0x04);
    3c7c:	00400613          	li	a2,4
    3c80:	0000c5b7          	lui	a1,0xc
    3c84:	42958593          	addi	a1,a1,1065 # c429 <__freertos_irq_stack_top+0x62c9>
    3c88:	00040513          	mv	a0,s0
    3c8c:	d1dff0ef          	jal	39a8 <PiCamV3_WriteRegData>
}
    3c90:	00c12083          	lw	ra,12(sp)
    3c94:	00812403          	lw	s0,8(sp)
    3c98:	01010113          	addi	sp,sp,16
    3c9c:	00008067          	ret

00003ca0 <PiCamV3_SetPdafGain>:

void PiCamV3_SetPdafGain(u32 i2c_addr)
{
    3ca0:	fe010113          	addi	sp,sp,-32
    3ca4:	00112e23          	sw	ra,28(sp)
    3ca8:	00812c23          	sw	s0,24(sp)
    3cac:	00912a23          	sw	s1,20(sp)
    3cb0:	01212823          	sw	s2,16(sp)
    3cb4:	01312623          	sw	s3,12(sp)
    3cb8:	00050993          	mv	s3,a0
	for (int i = 0; i < 54; i++)
    3cbc:	00000493          	li	s1,0
    3cc0:	0640006f          	j	3d24 <PiCamV3_SetPdafGain+0x84>
	{
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_L + i, pdaf_gains[0][i % 9]);
    3cc4:	01049913          	slli	s2,s1,0x10
    3cc8:	01095913          	srli	s2,s2,0x10
    3ccc:	00900793          	li	a5,9
    3cd0:	02f4e7b3          	rem	a5,s1,a5
    3cd4:	00005437          	lui	s0,0x5
    3cd8:	83c40413          	addi	s0,s0,-1988 # 483c <pdaf_gains>
    3cdc:	00f40433          	add	s0,s0,a5
    3ce0:	000085b7          	lui	a1,0x8
    3ce4:	b1058593          	addi	a1,a1,-1264 # 7b10 <__freertos_irq_stack_top+0x19b0>
    3ce8:	00b905b3          	add	a1,s2,a1
    3cec:	00044603          	lbu	a2,0(s0)
    3cf0:	01059593          	slli	a1,a1,0x10
    3cf4:	0105d593          	srli	a1,a1,0x10
    3cf8:	00098513          	mv	a0,s3
    3cfc:	cadff0ef          	jal	39a8 <PiCamV3_WriteRegData>
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_R + i, pdaf_gains[1][i % 9]);
    3d00:	000087b7          	lui	a5,0x8
    3d04:	c0078793          	addi	a5,a5,-1024 # 7c00 <__freertos_irq_stack_top+0x1aa0>
    3d08:	00f905b3          	add	a1,s2,a5
    3d0c:	00944603          	lbu	a2,9(s0)
    3d10:	01059593          	slli	a1,a1,0x10
    3d14:	0105d593          	srli	a1,a1,0x10
    3d18:	00098513          	mv	a0,s3
    3d1c:	c8dff0ef          	jal	39a8 <PiCamV3_WriteRegData>
	for (int i = 0; i < 54; i++)
    3d20:	00148493          	addi	s1,s1,1
    3d24:	03500793          	li	a5,53
    3d28:	f897dee3          	bge	a5,s1,3cc4 <PiCamV3_SetPdafGain+0x24>
	}
}
    3d2c:	01c12083          	lw	ra,28(sp)
    3d30:	01812403          	lw	s0,24(sp)
    3d34:	01412483          	lw	s1,20(sp)
    3d38:	01012903          	lw	s2,16(sp)
    3d3c:	00c12983          	lw	s3,12(sp)
    3d40:	02010113          	addi	sp,sp,32
    3d44:	00008067          	ret

00003d48 <PiCamV3_OnActuator>:
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN, (val & 0xFF00) >> 8);
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN + 1, val & 0xFF);
}

void PiCamV3_OnActuator(u32 i2c_addr)
{
    3d48:	ff010113          	addi	sp,sp,-16
    3d4c:	00112623          	sw	ra,12(sp)
    3d50:	00812423          	sw	s0,8(sp)
    3d54:	00050413          	mv	s0,a0
	// Turn on actuator
	i2c_masterStartBlocking(i2c_addr);
    3d58:	ba9ff0ef          	jal	3900 <i2c_masterStartBlocking>
    3d5c:	000017b7          	lui	a5,0x1
    3d60:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    3d64:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3d68:	00040513          	mv	a0,s0
    3d6c:	c0dff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3d70:	00040513          	mv	a0,s0
    3d74:	c25ff0ef          	jal	3998 <i2c_rxAck>
    3d78:	83cfe0ef          	jal	1db4 <assert>
    3d7c:	000017b7          	lui	a5,0x1
    3d80:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    3d84:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    3d88:	00040513          	mv	a0,s0
    3d8c:	bedff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3d90:	00040513          	mv	a0,s0
    3d94:	c05ff0ef          	jal	3998 <i2c_rxAck>
    3d98:	81cfe0ef          	jal	1db4 <assert>
    3d9c:	000017b7          	lui	a5,0x1
    3da0:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    3da4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_ACTIVE);
	i2c_txNackBlocking(i2c_addr);
    3da8:	00040513          	mv	a0,s0
    3dac:	bcdff0ef          	jal	3978 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    3db0:	00040513          	mv	a0,s0
    3db4:	b95ff0ef          	jal	3948 <i2c_masterStopBlocking>
}
    3db8:	00c12083          	lw	ra,12(sp)
    3dbc:	00812403          	lw	s0,8(sp)
    3dc0:	01010113          	addi	sp,sp,16
    3dc4:	00008067          	ret

00003dc8 <PiCamV3_OffActuator>:

void PiCamV3_OffActuator(u32 i2c_addr)
{
    3dc8:	ff010113          	addi	sp,sp,-16
    3dcc:	00112623          	sw	ra,12(sp)
    3dd0:	00812423          	sw	s0,8(sp)
    3dd4:	00050413          	mv	s0,a0
	// Turn off actuator
	i2c_masterStartBlocking(i2c_addr);
    3dd8:	b29ff0ef          	jal	3900 <i2c_masterStartBlocking>
    3ddc:	000017b7          	lui	a5,0x1
    3de0:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    3de4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3de8:	00040513          	mv	a0,s0
    3dec:	b8dff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3df0:	00040513          	mv	a0,s0
    3df4:	ba5ff0ef          	jal	3998 <i2c_rxAck>
    3df8:	fbdfd0ef          	jal	1db4 <assert>
    3dfc:	000017b7          	lui	a5,0x1
    3e00:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    3e04:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    3e08:	00040513          	mv	a0,s0
    3e0c:	b6dff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3e10:	00040513          	mv	a0,s0
    3e14:	b85ff0ef          	jal	3998 <i2c_rxAck>
    3e18:	f9dfd0ef          	jal	1db4 <assert>
    3e1c:	000017b7          	lui	a5,0x1
    3e20:	b0178793          	addi	a5,a5,-1279 # b01 <CUSTOM2+0xaa6>
    3e24:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_SLEEP);
	i2c_txNackBlocking(i2c_addr);
    3e28:	00040513          	mv	a0,s0
    3e2c:	b4dff0ef          	jal	3978 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    3e30:	00040513          	mv	a0,s0
    3e34:	b15ff0ef          	jal	3948 <i2c_masterStopBlocking>
}
    3e38:	00c12083          	lw	ra,12(sp)
    3e3c:	00812403          	lw	s0,8(sp)
    3e40:	01010113          	addi	sp,sp,16
    3e44:	00008067          	ret

00003e48 <PiCamV3_SetFocusStep>:

void PiCamV3_SetFocusStep(u32 i2c_addr, u32 focus_step)
{
    3e48:	fe010113          	addi	sp,sp,-32
    3e4c:	00112e23          	sw	ra,28(sp)
    3e50:	00812c23          	sw	s0,24(sp)
    3e54:	00912a23          	sw	s1,20(sp)
    3e58:	01212823          	sw	s2,16(sp)
    3e5c:	01312623          	sw	s3,12(sp)
    3e60:	00050413          	mv	s0,a0
    3e64:	00058493          	mv	s1,a1
	if (focus_step >= DW9807_MAX_FOCUS_POS)
    3e68:	3fe00793          	li	a5,1022
    3e6c:	00b7f463          	bgeu	a5,a1,3e74 <PiCamV3_SetFocusStep+0x2c>
		focus_step = DW9807_MAX_FOCUS_POS;
    3e70:	3ff00493          	li	s1,1023
	else if (focus_step <= 0)
		focus_step = 0;

	i2c_masterStartBlocking(i2c_addr);
    3e74:	00040513          	mv	a0,s0
    3e78:	a89ff0ef          	jal	3900 <i2c_masterStartBlocking>
    3e7c:	000019b7          	lui	s3,0x1
    3e80:	b1898993          	addi	s3,s3,-1256 # b18 <CUSTOM2+0xabd>
    3e84:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3e88:	00040513          	mv	a0,s0
    3e8c:	aedff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3e90:	00040513          	mv	a0,s0
    3e94:	b05ff0ef          	jal	3998 <i2c_rxAck>
    3e98:	f1dfd0ef          	jal	1db4 <assert>
    3e9c:	000017b7          	lui	a5,0x1
    3ea0:	b0378793          	addi	a5,a5,-1277 # b03 <CUSTOM2+0xaa8>
    3ea4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_MSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    3ea8:	00040513          	mv	a0,s0
    3eac:	acdff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3eb0:	00040513          	mv	a0,s0
    3eb4:	ae5ff0ef          	jal	3998 <i2c_rxAck>
    3eb8:	efdfd0ef          	jal	1db4 <assert>
	i2c_txByte(i2c_addr, (focus_step >> 8) & 0x03);
    3ebc:	0084d793          	srli	a5,s1,0x8
    3ec0:	0037f793          	andi	a5,a5,3
    3ec4:	00001937          	lui	s2,0x1
    3ec8:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
    3ecc:	0127e7b3          	or	a5,a5,s2
    3ed0:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3ed4:	00040513          	mv	a0,s0
    3ed8:	aa1ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3edc:	00040513          	mv	a0,s0
    3ee0:	ab9ff0ef          	jal	3998 <i2c_rxAck>
    3ee4:	ed1fd0ef          	jal	1db4 <assert>
	i2c_masterStopBlocking(i2c_addr);
    3ee8:	00040513          	mv	a0,s0
    3eec:	a5dff0ef          	jal	3948 <i2c_masterStopBlocking>

	i2c_masterStartBlocking(i2c_addr);
    3ef0:	00040513          	mv	a0,s0
    3ef4:	a0dff0ef          	jal	3900 <i2c_masterStartBlocking>
    3ef8:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3efc:	00040513          	mv	a0,s0
    3f00:	a79ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3f04:	00040513          	mv	a0,s0
    3f08:	a91ff0ef          	jal	3998 <i2c_rxAck>
    3f0c:	ea9fd0ef          	jal	1db4 <assert>
    3f10:	000017b7          	lui	a5,0x1
    3f14:	b0478793          	addi	a5,a5,-1276 # b04 <CUSTOM2+0xaa9>
    3f18:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_LSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    3f1c:	00040513          	mv	a0,s0
    3f20:	a59ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3f24:	00040513          	mv	a0,s0
    3f28:	a71ff0ef          	jal	3998 <i2c_rxAck>
    3f2c:	e89fd0ef          	jal	1db4 <assert>
    3f30:	0ff4f493          	zext.b	s1,s1
    3f34:	0124e4b3          	or	s1,s1,s2
    3f38:	00942023          	sw	s1,0(s0)
	i2c_txByte(i2c_addr, focus_step & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3f3c:	00040513          	mv	a0,s0
    3f40:	a39ff0ef          	jal	3978 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    3f44:	00040513          	mv	a0,s0
    3f48:	a51ff0ef          	jal	3998 <i2c_rxAck>
    3f4c:	e69fd0ef          	jal	1db4 <assert>
	i2c_masterStopBlocking(i2c_addr);
    3f50:	00040513          	mv	a0,s0
    3f54:	9f5ff0ef          	jal	3948 <i2c_masterStopBlocking>
}
    3f58:	01c12083          	lw	ra,28(sp)
    3f5c:	01812403          	lw	s0,24(sp)
    3f60:	01412483          	lw	s1,20(sp)
    3f64:	01012903          	lw	s2,16(sp)
    3f68:	00c12983          	lw	s3,12(sp)
    3f6c:	02010113          	addi	sp,sp,32
    3f70:	00008067          	ret

00003f74 <PiCamV3_Init>:
	PiCamV3_WriteRegData(IMX708_REG_TEST_PATTERN, IMX708_TEST_PATTERN_SOLID_COLOR);
}
*/

void PiCamV3_Init(u32 i2c_addr)
{
    3f74:	ff010113          	addi	sp,sp,-16
    3f78:	00112623          	sw	ra,12(sp)
    3f7c:	00812423          	sw	s0,8(sp)
    3f80:	00050413          	mv	s0,a0

	PiCamV3_StopStreaming(i2c_addr);
    3f84:	b15ff0ef          	jal	3a98 <PiCamV3_StopStreaming>

	PiCamV3_ConfigCommon(i2c_addr);
    3f88:	00040513          	mv	a0,s0
    3f8c:	b2dff0ef          	jal	3ab8 <PiCamV3_ConfigCommon>

	PiCamV3_SetPdafGain(i2c_addr);
    3f90:	00040513          	mv	a0,s0
    3f94:	d0dff0ef          	jal	3ca0 <PiCamV3_SetPdafGain>

	PiCamV3_ConfigFormat(i2c_addr, 1);
    3f98:	00100593          	li	a1,1
    3f9c:	00040513          	mv	a0,s0
    3fa0:	b75ff0ef          	jal	3b14 <PiCamV3_ConfigFormat>

	PiCamV3_ConfigLinkFreq(i2c_addr);
    3fa4:	00040513          	mv	a0,s0
    3fa8:	c5dff0ef          	jal	3c04 <PiCamV3_ConfigLinkFreq>

	PiCamV3_ConfigQuadBayerRemosaicAdjustment(i2c_addr);
    3fac:	00040513          	mv	a0,s0
    3fb0:	cadff0ef          	jal	3c5c <PiCamV3_ConfigQuadBayerRemosaicAdjustment>

	PiCamV3_OnActuator(i2c_addr);
    3fb4:	00040513          	mv	a0,s0
    3fb8:	d91ff0ef          	jal	3d48 <PiCamV3_OnActuator>

	PiCamV3_SetFocusStep(i2c_addr, 700);
    3fbc:	2bc00593          	li	a1,700
    3fc0:	00040513          	mv	a0,s0
    3fc4:	e85ff0ef          	jal	3e48 <PiCamV3_SetFocusStep>

	PiCamV3_OffActuator(i2c_addr);
    3fc8:	00040513          	mv	a0,s0
    3fcc:	dfdff0ef          	jal	3dc8 <PiCamV3_OffActuator>

	//	PiCamV3_StartStreaming();

	uart_writeStr(BSP_UART_TERMINAL, "\n\rDone Camera Init");
    3fd0:	000045b7          	lui	a1,0x4
    3fd4:	62058593          	addi	a1,a1,1568 # 4620 <_data+0x5a0>
    3fd8:	f8010537          	lui	a0,0xf8010
    3fdc:	8d5ff0ef          	jal	38b0 <uart_writeStr>
}
    3fe0:	00c12083          	lw	ra,12(sp)
    3fe4:	00812403          	lw	s0,8(sp)
    3fe8:	01010113          	addi	sp,sp,16
    3fec:	00008067          	ret

00003ff0 <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
    3ff0:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
    3ff4:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    3ff8:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    3ffc:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    4000:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    4004:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    4008:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    400c:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    4010:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    4014:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    4018:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    401c:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    4020:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    4024:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    4028:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    402c:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    4030:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
    4034:	c55fd0ef          	jal	1c88 <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
    4038:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    403c:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    4040:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    4044:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    4048:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    404c:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    4050:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    4054:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    4058:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    405c:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    4060:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    4064:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    4068:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    406c:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    4070:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    4074:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
    4078:	04010113          	addi	sp,sp,64
#endif
    407c:	30200073          	mret
