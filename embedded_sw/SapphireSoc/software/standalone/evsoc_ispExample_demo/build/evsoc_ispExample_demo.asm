
build/evsoc_ispExample_demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00005197          	auipc	gp,0x5
    1004:	03018193          	addi	gp,gp,48 # 6030 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00006117          	auipc	sp,0x6
    100c:	9e810113          	addi	sp,sp,-1560 # 69f0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00003517          	auipc	a0,0x3
    1014:	46c50513          	addi	a0,a0,1132 # 447c <_data>
	la a1, _data
    1018:	00003597          	auipc	a1,0x3
    101c:	46458593          	addi	a1,a1,1124 # 447c <_data>
	la a2, _edata
    1020:	00005617          	auipc	a2,0x5
    1024:	83c60613          	addi	a2,a2,-1988 # 585c <uart_cmd_ready>
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
    1044:	81c50513          	addi	a0,a0,-2020 # 585c <uart_cmd_ready>
	la a1, _end
    1048:	00005597          	auipc	a1,0x5
    104c:	9a858593          	addi	a1,a1,-1624 # 59f0 <_end>
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
    109c:	56188893          	addi	a7,a7,1377 # 55f9 <_ctype_+0x1>
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
    10dc:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff960f>
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
    1178:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff960f>
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
    126c:	8101a503          	lw	a0,-2032(gp) # 5840 <_impure_ptr>
    1270:	e0dff06f          	j	107c <_strtol_l.isra.0>

00001274 <__errno>:
    1274:	8101a503          	lw	a0,-2032(gp) # 5840 <_impure_ptr>
    1278:	00008067          	ret

0000127c <__libc_init_array>:
    127c:	ff010113          	addi	sp,sp,-16
    1280:	00812423          	sw	s0,8(sp)
    1284:	01212023          	sw	s2,0(sp)
    1288:	00003797          	auipc	a5,0x3
    128c:	1f478793          	addi	a5,a5,500 # 447c <_data>
    1290:	00003417          	auipc	s0,0x3
    1294:	1ec40413          	addi	s0,s0,492 # 447c <_data>
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
    12c8:	1b878793          	addi	a5,a5,440 # 447c <_data>
    12cc:	00003417          	auipc	s0,0x3
    12d0:	1b040413          	addi	s0,s0,432 # 447c <_data>
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
    1320:	d3050513          	addi	a0,a0,-720 # 4d30 <_data+0x8b4>
    1324:	13c010ef          	jal	2460 <bsp_printf>

    cam0_init(I2C_CTRL_CAM0);
    bsp_printf("\n\rDone !!\n\r");

#elif defined(BOARD_Ti60F225)
    bsp_printf("Init Camera.....");
    1328:	00005537          	lui	a0,0x5
    132c:	d5450513          	addi	a0,a0,-684 # 4d54 <_data+0x8d8>
    1330:	130010ef          	jal	2460 <bsp_printf>
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    1334:	f8100437          	lui	s0,0xf8100
    1338:	00042223          	sw	zero,4(s0) # f8100004 <__freertos_irq_stack_top+0xf80f9614>

    // Assert camera reset
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000000);
    bsp_uDelay(100);
    133c:	f8b00637          	lui	a2,0xf8b00
    1340:	05f5e5b7          	lui	a1,0x5f5e
    1344:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    1348:	06400513          	li	a0,100
    134c:	3d5000ef          	jal	1f20 <clint_uDelay>
    1350:	00200793          	li	a5,2
    1354:	00f42223          	sw	a5,4(s0)
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000002);
    bsp_uDelay(1000 * 10);
    1358:	f8b00637          	lui	a2,0xf8b00
    135c:	05f5e5b7          	lui	a1,0x5f5e
    1360:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    1364:	00002537          	lui	a0,0x2
    1368:	71050513          	addi	a0,a0,1808 # 2710 <Read_Latency+0x180>
    136c:	3b5000ef          	jal	1f20 <clint_uDelay>

    cam0_init(I2C_CTRL_CAM0);
    1370:	f8015537          	lui	a0,0xf8015
    1374:	0cd020ef          	jal	3c40 <cam0_init>
    1378:	00300793          	li	a5,3
    137c:	00f42223          	sw	a5,4(s0)

    // Indicate camera configuration done
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000003);
    bsp_printf("Done\n\r");
    1380:	00005537          	lui	a0,0x5
    1384:	d6850513          	addi	a0,a0,-664 # 4d68 <_data+0x8ec>
    1388:	0d8010ef          	jal	2460 <bsp_printf>

#endif

    /******************************************************SETUP DMA & UART********************************************************/

    bsp_printf("Init DMA.....");
    138c:	00005537          	lui	a0,0x5
    1390:	d7050513          	addi	a0,a0,-656 # 4d70 <_data+0x8f4>
    1394:	0cc010ef          	jal	2460 <bsp_printf>

    uart_interrupt_init();
    1398:	554010ef          	jal	28ec <uart_interrupt_init>
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
    13f4:	d8050513          	addi	a0,a0,-640 # 4d80 <_data+0x904>
    13f8:	068010ef          	jal	2460 <bsp_printf>

    /*******************************************************Trigger Display********************************************************/

    select_demo_mode = 0; // Default
    13fc:	8201aa23          	sw	zero,-1996(gp) # 5864 <select_demo_mode>

    // To check display functionality
    bsp_printf("Initialize test display content..\n\r");
    1400:	00005537          	lui	a0,0x5
    1404:	d8c50513          	addi	a0,a0,-628 # 4d8c <_data+0x910>
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
    1470:	f0068693          	addi	a3,a3,-256 # ff00 <__freertos_irq_stack_top+0x9510>
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
    151c:	00160613          	addi	a2,a2,1 # f8b00001 <__freertos_irq_stack_top+0xf8af9611>
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
    1534:	db050513          	addi	a0,a0,-592 # 4db0 <_data+0x934>
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
    1584:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116250>
    1588:	00200593          	li	a1,2
    158c:	f8110537          	lui	a0,0xf8110
    1590:	665000ef          	jal	23f4 <dmasg_direct_start>
    display_mm2s_active = 1;                                                                         // Display always active
    1594:	00100713          	li	a4,1
    1598:	82e1a823          	sw	a4,-2000(gp) # 5860 <display_mm2s_active>

    msDelay(5000); // Display test content for 5 seconds
    159c:	00001537          	lui	a0,0x1
    15a0:	38850513          	addi	a0,a0,904 # 1388 <main+0x78>
    15a4:	039000ef          	jal	1ddc <msDelay>

    bsp_printf("Done !!\n\n\r");
    15a8:	00005537          	lui	a0,0x5
    15ac:	d8050513          	addi	a0,a0,-640 # 4d80 <_data+0x904>
    15b0:	6b1000ef          	jal	2460 <bsp_printf>

    ispExample_menu();
    15b4:	1cd010ef          	jal	2f80 <ispExample_menu>

    bsp_printf("Default Demo Mode: a\n\r");
    15b8:	00005537          	lui	a0,0x5
    15bc:	dcc50513          	addi	a0,a0,-564 # 4dcc <_data+0x950>
    15c0:	6a1000ef          	jal	2460 <bsp_printf>
    15c4:	1040006f          	j	16c8 <main+0x3b8>
    15c8:	f81007b7          	lui	a5,0xf8100
    15cc:	0007a623          	sw	zero,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f961c>
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
    15e4:	270010ef          	jal	2854 <rgb2grayscale>
    15e8:	1800006f          	j	1768 <main+0x458>
        *((volatile u32*) address) = data;
    15ec:	f81207b7          	lui	a5,0xf8120
    15f0:	0007a223          	sw	zero,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119614>
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
    1624:	8341a783          	lw	a5,-1996(gp) # 5864 <select_demo_mode>
    1628:	00200713          	li	a4,2
    162c:	00e78663          	beq	a5,a4,1638 <main+0x328>
    1630:	00400713          	li	a4,4
    1634:	18e79863          	bne	a5,a4,17c4 <main+0x4b4>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (FRAME_WIDTH + 1)) * 4, 0); // Sobel only
    1638:	00000693          	li	a3,0
    163c:	0011d637          	lui	a2,0x11d
    1640:	4b460613          	addi	a2,a2,1204 # 11d4b4 <__freertos_irq_stack_top+0x116ac4>
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
    1684:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116250>
    1688:	00300593          	li	a1,3
    168c:	f8110537          	lui	a0,0xf8110
    1690:	565000ef          	jal	23f4 <dmasg_direct_start>
    1694:	f81207b7          	lui	a5,0xf8120
    1698:	00100713          	li	a4,1
    169c:	00e7a423          	sw	a4,8(a5) # f8120008 <__freertos_irq_stack_top+0xf8119618>
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
    16c8:	6c9000ef          	jal	2590 <Read_Latency>
        if (select_demo_mode > 2)
    16cc:	8341a703          	lw	a4,-1996(gp) # 5864 <select_demo_mode>
    16d0:	00200793          	li	a5,2
    16d4:	eee7fae3          	bgeu	a5,a4,15c8 <main+0x2b8>
    16d8:	f81007b7          	lui	a5,0xf8100
    16dc:	00100713          	li	a4,1
    16e0:	00e7a623          	sw	a4,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f961c>
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
    1718:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116250>
    171c:	00000593          	li	a1,0
    1720:	f8110537          	lui	a0,0xf8110
    1724:	4d1000ef          	jal	23f4 <dmasg_direct_start>
    1728:	f81007b7          	lui	a5,0xf8100
    172c:	00100713          	li	a4,1
    1730:	00e7a823          	sw	a4,16(a5) # f8100010 <__freertos_irq_stack_top+0xf80f9620>
    1734:	0007a823          	sw	zero,16(a5)
    1738:	f81007b7          	lui	a5,0xf8100
    173c:	00e7a423          	sw	a4,8(a5) # f8100008 <__freertos_irq_stack_top+0xf80f9618>
    1740:	0007a423          	sw	zero,8(a5)
        while (dmasg_busy(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL))
    1744:	00000593          	li	a1,0
    1748:	f8110537          	lui	a0,0xf8110
    174c:	4e9000ef          	jal	2434 <dmasg_busy>
    1750:	fe051ae3          	bnez	a0,1744 <main+0x434>
    1754:	0000500f          	.word	0x0000500f
        if (select_demo_mode == 1 || select_demo_mode == 2)
    1758:	8341a783          	lw	a5,-1996(gp) # 5864 <select_demo_mode>
    175c:	fff78793          	addi	a5,a5,-1
    1760:	00100713          	li	a4,1
    1764:	e6f778e3          	bgeu	a4,a5,15d4 <main+0x2c4>
        if (select_demo_mode == 2 || select_demo_mode > 3)
    1768:	8341a783          	lw	a5,-1996(gp) # 5864 <select_demo_mode>
    176c:	00200713          	li	a4,2
    1770:	00e78663          	beq	a5,a4,177c <main+0x46c>
    1774:	00300713          	li	a4,3
    1778:	f4f778e3          	bgeu	a4,a5,16c8 <main+0x3b8>
    177c:	f81207b7          	lui	a5,0xf8120
    1780:	00500713          	li	a4,5
    1784:	00e7a023          	sw	a4,0(a5) # f8120000 <__freertos_irq_stack_top+0xf8119610>
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1788:	8341a783          	lw	a5,-1996(gp) # 5864 <select_demo_mode>
    178c:	00200713          	li	a4,2
    1790:	e4e78ee3          	beq	a5,a4,15ec <main+0x2dc>
    1794:	00400713          	li	a4,4
    1798:	e4e78ae3          	beq	a5,a4,15ec <main+0x2dc>
            else if (select_demo_mode == 5)
    179c:	00500713          	li	a4,5
    17a0:	00e78a63          	beq	a5,a4,17b4 <main+0x4a4>
    17a4:	f81207b7          	lui	a5,0xf8120
    17a8:	00200713          	li	a4,2
    17ac:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119614>
    }
    17b0:	e45ff06f          	j	15f4 <main+0x2e4>
        *((volatile u32*) address) = data;
    17b4:	f81207b7          	lui	a5,0xf8120
    17b8:	00100713          	li	a4,1
    17bc:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119614>
    }
    17c0:	e35ff06f          	j	15f4 <main+0x2e4>
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
    17c4:	00000693          	li	a3,0
    17c8:	0011e637          	lui	a2,0x11e
    17cc:	d2860613          	addi	a2,a2,-728 # 11dd28 <__freertos_irq_stack_top+0x117338>
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
    17e8:	00c5a023          	sw	a2,0(a1) # 500000 <__freertos_irq_stack_top+0x4f9610>
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
    1854:	00452503          	lw	a0,4(a0) # f8110004 <__freertos_irq_stack_top+0xf8109614>
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
    191c:	48078793          	addi	a5,a5,1152 # 4480 <_data+0x4>
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
    1970:	49478793          	addi	a5,a5,1172 # 4494 <_data+0x18>
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
    1ba8:	4a850513          	addi	a0,a0,1192 # 44a8 <_data+0x2c>
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
    1bdc:	e6070713          	addi	a4,a4,-416 # 4e60 <_data+0x9e4>
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
    1c0c:	4f450513          	addi	a0,a0,1268 # 44f4 <_data+0x78>
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
    1c58:	3ec78793          	addi	a5,a5,1004 # 43ec <trap_entry>
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
    1ca8:	254010ef          	jal	2efc <externalInterrupt>
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
    1cc0:	00452503          	lw	a0,4(a0) # f8c00004 <__freertos_irq_stack_top+0xf8bf9614>
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
    1d54:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed850>
    1d58:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1d5c:	0000c7b7          	lui	a5,0xc
    1d60:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5608>
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
    1dcc:	50458593          	addi	a1,a1,1284 # 4504 <_data+0x88>
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
    1dec:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
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
    1e1c:	6a078793          	addi	a5,a5,1696 # 186a0 <__freertos_irq_stack_top+0x11cb0>
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
    1e54:	00452503          	lw	a0,4(a0) # f8010004 <__freertos_irq_stack_top+0xf8009614>
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
    1f24:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed850>
    1f28:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1f2c:	0000c7b7          	lui	a5,0xc
    1f30:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5608>
    1f34:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1f38:	00062783          	lw	a5,0(a2) # f8b00000 <__freertos_irq_stack_top+0xf8af9610>
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
    1fd0:	48078793          	addi	a5,a5,1152 # 4480 <_data+0x4>
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
    2024:	49478793          	addi	a5,a5,1172 # 4494 <_data+0x18>
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
    2224:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f9614>
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
    2240:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f9614>
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
    226c:	ee470713          	addi	a4,a4,-284 # 4ee4 <_data+0xa68>
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
    2314:	00d7a023          	sw	a3,0(a5) # f8100000 <__freertos_irq_stack_top+0xf80f9610>
	bsp_uDelay(DELAY_BUSY);
    2318:	f8b00637          	lui	a2,0xf8b00
    231c:	05f5e5b7          	lui	a1,0x5f5e
    2320:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
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
    2348:	00c52023          	sw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf8009610>
        write_u32(address, ca + DMASG_CHANNEL_INPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_INPUT_CONFIG);
    234c:	fff68693          	addi	a3,a3,-1 # feffff <__freertos_irq_stack_top+0xfe960f>
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
    23fc:	fff60613          	addi	a2,a2,-1 # f8afffff <__freertos_irq_stack_top+0xf8af960f>
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
    2538:	4a850513          	addi	a0,a0,1192 # 44a8 <_data+0x2c>
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
    256c:	f1870713          	addi	a4,a4,-232 # 4f18 <_data+0xa9c>
    2570:	00e787b3          	add	a5,a5,a4
    2574:	0007a783          	lw	a5,0(a5)
    2578:	00078067          	jr	a5
    }
    257c:	01c12083          	lw	ra,28(sp)
    2580:	01812403          	lw	s0,24(sp)
    2584:	01412483          	lw	s1,20(sp)
    2588:	04010113          	addi	sp,sp,64
    258c:	00008067          	ret

00002590 <Read_Latency>:
}

#endif

static inline void Read_Latency()
{
    2590:	fe010113          	addi	sp,sp,-32
    2594:	00112e23          	sw	ra,28(sp)
    2598:	00812c23          	sw	s0,24(sp)
    259c:	00912a23          	sw	s1,20(sp)
    25a0:	01212823          	sw	s2,16(sp)
    25a4:	01312623          	sw	s3,12(sp)
        return *((volatile u32*) address);
    25a8:	f81007b7          	lui	a5,0xf8100
    25ac:	0a07a903          	lw	s2,160(a5) # f81000a0 <__freertos_irq_stack_top+0xf80f96b0>
	u32 valid_status = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG40_OFFSET);
	for(int i=0; i<12; i++)
    25b0:	00000413          	li	s0,0
    25b4:	01c0006f          	j	25d0 <Read_Latency+0x40>
			bsp_uDelay(DELAY_BUSY);

			switch(i)
			{
				case 0:
					overflow == 0 ? bsp_printf("TOTAL ISP minimum latency: %d clock cycles\n\r", counter_data):
    25b8:	08049463          	bnez	s1,2640 <Read_Latency+0xb0>
    25bc:	00098593          	mv	a1,s3
    25c0:	00004537          	lui	a0,0x4
    25c4:	51450513          	addi	a0,a0,1300 # 4514 <_data+0x98>
    25c8:	e99ff0ef          	jal	2460 <bsp_printf>
	for(int i=0; i<12; i++)
    25cc:	00140413          	addi	s0,s0,1
    25d0:	00b00793          	li	a5,11
    25d4:	2687c263          	blt	a5,s0,2838 <Read_Latency+0x2a8>
		if((valid_status & (1 << i)) != 0)
    25d8:	00100793          	li	a5,1
    25dc:	008797b3          	sll	a5,a5,s0
    25e0:	0127f733          	and	a4,a5,s2
    25e4:	fe0704e3          	beqz	a4,25cc <Read_Latency+0x3c>
        *((volatile u32*) address) = data;
    25e8:	f8100737          	lui	a4,0xf8100
    25ec:	04f72423          	sw	a5,72(a4) # f8100048 <__freertos_irq_stack_top+0xf80f9658>
			u32 raw          = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4);
    25f0:	00241793          	slli	a5,s0,0x2
    25f4:	f8100737          	lui	a4,0xf8100
    25f8:	07070713          	addi	a4,a4,112 # f8100070 <__freertos_irq_stack_top+0xf80f9680>
    25fc:	00e787b3          	add	a5,a5,a4
        return *((volatile u32*) address);
    2600:	0007a783          	lw	a5,0(a5)
			u32 counter_data = raw >> 1;
    2604:	0017d993          	srli	s3,a5,0x1
			u32 overflow     = raw & 1;
    2608:	0017f493          	andi	s1,a5,1
			bsp_uDelay(DELAY_BUSY);
    260c:	f8b00637          	lui	a2,0xf8b00
    2610:	05f5e5b7          	lui	a1,0x5f5e
    2614:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2618:	00500513          	li	a0,5
    261c:	905ff0ef          	jal	1f20 <clint_uDelay>
			switch(i)
    2620:	00b00793          	li	a5,11
    2624:	fa87e4e3          	bltu	a5,s0,25cc <Read_Latency+0x3c>
    2628:	00241793          	slli	a5,s0,0x2
    262c:	00005737          	lui	a4,0x5
    2630:	f9c70713          	addi	a4,a4,-100 # 4f9c <_data+0xb20>
    2634:	00e787b3          	add	a5,a5,a4
    2638:	0007a783          	lw	a5,0(a5)
    263c:	00078067          	jr	a5
								    bsp_printf("TOTAL ISP minimum latency: OVERFLOW\n\r", counter_data);
    2640:	00098593          	mv	a1,s3
    2644:	00004537          	lui	a0,0x4
    2648:	54450513          	addi	a0,a0,1348 # 4544 <_data+0xc8>
    264c:	e15ff0ef          	jal	2460 <bsp_printf>
    2650:	f7dff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 1:
					overflow == 0 ? bsp_printf("BLC minimum latency: %d clock cycles\n\r", counter_data):
    2654:	00049c63          	bnez	s1,266c <Read_Latency+0xdc>
    2658:	00098593          	mv	a1,s3
    265c:	00004537          	lui	a0,0x4
    2660:	56c50513          	addi	a0,a0,1388 # 456c <_data+0xf0>
    2664:	dfdff0ef          	jal	2460 <bsp_printf>
    2668:	f65ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("BLC minimum latency: OVERFLOW\n\r", counter_data);
    266c:	00098593          	mv	a1,s3
    2670:	00004537          	lui	a0,0x4
    2674:	59450513          	addi	a0,a0,1428 # 4594 <_data+0x118>
    2678:	de9ff0ef          	jal	2460 <bsp_printf>
    267c:	f51ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 2:
					overflow == 0 ? bsp_printf("COLOUR GAIN minimum latency: %d clock cycles\n\r", counter_data):
    2680:	00049c63          	bnez	s1,2698 <Read_Latency+0x108>
    2684:	00098593          	mv	a1,s3
    2688:	00004537          	lui	a0,0x4
    268c:	5b450513          	addi	a0,a0,1460 # 45b4 <_data+0x138>
    2690:	dd1ff0ef          	jal	2460 <bsp_printf>
    2694:	f39ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("COLOUR GAIN minimum latency: OVERFLOW\n\r", counter_data);
    2698:	00098593          	mv	a1,s3
    269c:	00004537          	lui	a0,0x4
    26a0:	5e450513          	addi	a0,a0,1508 # 45e4 <_data+0x168>
    26a4:	dbdff0ef          	jal	2460 <bsp_printf>
    26a8:	f25ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 3:
					overflow == 0 ? bsp_printf("DEMOSAIC minimum latency: %d clock cycles\n\r", counter_data):
    26ac:	00049c63          	bnez	s1,26c4 <Read_Latency+0x134>
    26b0:	00098593          	mv	a1,s3
    26b4:	00004537          	lui	a0,0x4
    26b8:	60c50513          	addi	a0,a0,1548 # 460c <_data+0x190>
    26bc:	da5ff0ef          	jal	2460 <bsp_printf>
    26c0:	f0dff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("DEMOSAIC minimum latency: OVERFLOW\n\r", counter_data);
    26c4:	00098593          	mv	a1,s3
    26c8:	00004537          	lui	a0,0x4
    26cc:	63850513          	addi	a0,a0,1592 # 4638 <_data+0x1bc>
    26d0:	d91ff0ef          	jal	2460 <bsp_printf>
    26d4:	ef9ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 4:
					overflow == 0 ? bsp_printf("CCM minimum latency: %d clock cycles\n\r", counter_data):
    26d8:	00049c63          	bnez	s1,26f0 <Read_Latency+0x160>
    26dc:	00098593          	mv	a1,s3
    26e0:	00004537          	lui	a0,0x4
    26e4:	66050513          	addi	a0,a0,1632 # 4660 <_data+0x1e4>
    26e8:	d79ff0ef          	jal	2460 <bsp_printf>
    26ec:	ee1ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("CCM minimum latency: OVERFLOW\n\r", counter_data);
    26f0:	00098593          	mv	a1,s3
    26f4:	00004537          	lui	a0,0x4
    26f8:	68850513          	addi	a0,a0,1672 # 4688 <_data+0x20c>
    26fc:	d65ff0ef          	jal	2460 <bsp_printf>
    2700:	ecdff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 5:
					overflow == 0 ? bsp_printf("GAMMA minimum latency: %d clock cycles\n\r", counter_data):
    2704:	00049c63          	bnez	s1,271c <Read_Latency+0x18c>
    2708:	00098593          	mv	a1,s3
    270c:	00004537          	lui	a0,0x4
    2710:	6a850513          	addi	a0,a0,1704 # 46a8 <_data+0x22c>
    2714:	d4dff0ef          	jal	2460 <bsp_printf>
    2718:	eb5ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("GAMMA minimum latency: OVERFLOW\n\r", counter_data);
    271c:	00098593          	mv	a1,s3
    2720:	00004537          	lui	a0,0x4
    2724:	6d450513          	addi	a0,a0,1748 # 46d4 <_data+0x258>
    2728:	d39ff0ef          	jal	2460 <bsp_printf>
    272c:	ea1ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 6:
					overflow == 0 ? bsp_printf("TOTAL ISP maximum latency: %d clock cycles\n\r", counter_data):
    2730:	00049c63          	bnez	s1,2748 <Read_Latency+0x1b8>
    2734:	00098593          	mv	a1,s3
    2738:	00004537          	lui	a0,0x4
    273c:	6f850513          	addi	a0,a0,1784 # 46f8 <_data+0x27c>
    2740:	d21ff0ef          	jal	2460 <bsp_printf>
    2744:	e89ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("TOTAL ISP maximum latency: OVERFLOW\n\r", counter_data);
    2748:	00098593          	mv	a1,s3
    274c:	00004537          	lui	a0,0x4
    2750:	72850513          	addi	a0,a0,1832 # 4728 <_data+0x2ac>
    2754:	d0dff0ef          	jal	2460 <bsp_printf>
    2758:	e75ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 7:
					overflow == 0 ? bsp_printf("BLC maximum latency: %d clock cycles\n\r", counter_data):
    275c:	00049c63          	bnez	s1,2774 <Read_Latency+0x1e4>
    2760:	00098593          	mv	a1,s3
    2764:	00004537          	lui	a0,0x4
    2768:	75050513          	addi	a0,a0,1872 # 4750 <_data+0x2d4>
    276c:	cf5ff0ef          	jal	2460 <bsp_printf>
    2770:	e5dff06f          	j	25cc <Read_Latency+0x3c>
					                bsp_printf("BLC maximum latency: OVERFLOW\n\r", counter_data);
    2774:	00098593          	mv	a1,s3
    2778:	00004537          	lui	a0,0x4
    277c:	77850513          	addi	a0,a0,1912 # 4778 <_data+0x2fc>
    2780:	ce1ff0ef          	jal	2460 <bsp_printf>
    2784:	e49ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 8:
					overflow == 0 ? bsp_printf("COLOUR GAIN maximum latency: %d clock cycles\n\r", counter_data):
    2788:	00049c63          	bnez	s1,27a0 <Read_Latency+0x210>
    278c:	00098593          	mv	a1,s3
    2790:	00004537          	lui	a0,0x4
    2794:	79850513          	addi	a0,a0,1944 # 4798 <_data+0x31c>
    2798:	cc9ff0ef          	jal	2460 <bsp_printf>
    279c:	e31ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("COLOUR GAIN maximum latency: OVERFLOW\n\r", counter_data);
    27a0:	00098593          	mv	a1,s3
    27a4:	00004537          	lui	a0,0x4
    27a8:	7c850513          	addi	a0,a0,1992 # 47c8 <_data+0x34c>
    27ac:	cb5ff0ef          	jal	2460 <bsp_printf>
    27b0:	e1dff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 9:
					overflow == 0 ? bsp_printf("DEMOSAIC maximum latency: %d clock cycles\n\r", counter_data):
    27b4:	00049c63          	bnez	s1,27cc <Read_Latency+0x23c>
    27b8:	00098593          	mv	a1,s3
    27bc:	00004537          	lui	a0,0x4
    27c0:	7f050513          	addi	a0,a0,2032 # 47f0 <_data+0x374>
    27c4:	c9dff0ef          	jal	2460 <bsp_printf>
    27c8:	e05ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("DEMOSAIC maximum latency: OVERFLOW\n\r", counter_data);
    27cc:	00098593          	mv	a1,s3
    27d0:	00005537          	lui	a0,0x5
    27d4:	81c50513          	addi	a0,a0,-2020 # 481c <_data+0x3a0>
    27d8:	c89ff0ef          	jal	2460 <bsp_printf>
    27dc:	df1ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 10:
					overflow == 0 ? bsp_printf("CCM maximum latency: %d clock cycles\n\r", counter_data):
    27e0:	00049c63          	bnez	s1,27f8 <Read_Latency+0x268>
    27e4:	00098593          	mv	a1,s3
    27e8:	00005537          	lui	a0,0x5
    27ec:	84450513          	addi	a0,a0,-1980 # 4844 <_data+0x3c8>
    27f0:	c71ff0ef          	jal	2460 <bsp_printf>
    27f4:	dd9ff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("CCM maximum latency: OVERFLOW\n\r", counter_data);
    27f8:	00098593          	mv	a1,s3
    27fc:	00005537          	lui	a0,0x5
    2800:	86c50513          	addi	a0,a0,-1940 # 486c <_data+0x3f0>
    2804:	c5dff0ef          	jal	2460 <bsp_printf>
    2808:	dc5ff06f          	j	25cc <Read_Latency+0x3c>
				break;
				case 11:
					overflow == 0 ? bsp_printf("GAMMA maximum latency: %d clock cycles\n\r", counter_data):
    280c:	00049c63          	bnez	s1,2824 <Read_Latency+0x294>
    2810:	00098593          	mv	a1,s3
    2814:	00005537          	lui	a0,0x5
    2818:	88c50513          	addi	a0,a0,-1908 # 488c <_data+0x410>
    281c:	c45ff0ef          	jal	2460 <bsp_printf>
    2820:	dadff06f          	j	25cc <Read_Latency+0x3c>
								    bsp_printf("GAMMA maximum latency: OVERFLOW\n\r", counter_data);
    2824:	00098593          	mv	a1,s3
    2828:	00005537          	lui	a0,0x5
    282c:	8b850513          	addi	a0,a0,-1864 # 48b8 <_data+0x43c>
    2830:	c31ff0ef          	jal	2460 <bsp_printf>
    2834:	d99ff06f          	j	25cc <Read_Latency+0x3c>
				break;
			}
		}
	}
}
    2838:	01c12083          	lw	ra,28(sp)
    283c:	01812403          	lw	s0,24(sp)
    2840:	01412483          	lw	s1,20(sp)
    2844:	01012903          	lw	s2,16(sp)
    2848:	00c12983          	lw	s3,12(sp)
    284c:	02010113          	addi	sp,sp,32
    2850:	00008067          	ret

00002854 <rgb2grayscale>:

void rgb2grayscale(volatile uint32_t in_array[], volatile uint32_t out_array[], uint32_t width, uint32_t height)
{
   uint8_t red, green, blue, grayscale;

   for (int i = 0; i < (width * height); i++)
    2854:	00000313          	li	t1,0
    2858:	0880006f          	j	28e0 <rgb2grayscale+0x8c>
   {
      red = (in_array[i]) & 0xff;
    285c:	00231e13          	slli	t3,t1,0x2
    2860:	01c507b3          	add	a5,a0,t3
    2864:	0007a703          	lw	a4,0(a5)
      green = ((in_array[i]) >> 8) & 0xff;
    2868:	0007a883          	lw	a7,0(a5)
    286c:	0088d893          	srli	a7,a7,0x8
      blue = ((in_array[i]) >> 16) & 0xff;
    2870:	0007a803          	lw	a6,0(a5)
    2874:	01085813          	srli	a6,a6,0x10

      grayscale = (30 * red + 59 * green + 11 * blue) / 100;
    2878:	0ff77713          	zext.b	a4,a4
    287c:	00471793          	slli	a5,a4,0x4
    2880:	40e787b3          	sub	a5,a5,a4
    2884:	00179793          	slli	a5,a5,0x1
    2888:	0ff8f893          	zext.b	a7,a7
    288c:	00489713          	slli	a4,a7,0x4
    2890:	41170733          	sub	a4,a4,a7
    2894:	00271713          	slli	a4,a4,0x2
    2898:	41170733          	sub	a4,a4,a7
    289c:	00e787b3          	add	a5,a5,a4
    28a0:	0ff87813          	zext.b	a6,a6
    28a4:	00181713          	slli	a4,a6,0x1
    28a8:	01070733          	add	a4,a4,a6
    28ac:	00271713          	slli	a4,a4,0x2
    28b0:	41070733          	sub	a4,a4,a6
    28b4:	00e787b3          	add	a5,a5,a4
    28b8:	06400713          	li	a4,100
    28bc:	02e7c7b3          	div	a5,a5,a4
      out_array[i] = (grayscale << 16) + (grayscale << 8) + (grayscale);
    28c0:	0ff7f793          	zext.b	a5,a5
    28c4:	01079713          	slli	a4,a5,0x10
    28c8:	00879813          	slli	a6,a5,0x8
    28cc:	01070733          	add	a4,a4,a6
    28d0:	01c58e33          	add	t3,a1,t3
    28d4:	00f707b3          	add	a5,a4,a5
    28d8:	00fe2023          	sw	a5,0(t3)
   for (int i = 0; i < (width * height); i++)
    28dc:	00130313          	addi	t1,t1,1
    28e0:	02d607b3          	mul	a5,a2,a3
    28e4:	f6f36ce3          	bltu	t1,a5,285c <rgb2grayscale+0x8>
   }

   return;
}
    28e8:	00008067          	ret

000028ec <uart_interrupt_init>:
{
    28ec:	ff010113          	addi	sp,sp,-16
    28f0:	00112623          	sw	ra,12(sp)
    bsp_init();
    28f4:	891ff0ef          	jal	2184 <bsp_init>
    uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    28f8:	f8010537          	lui	a0,0xf8010
    28fc:	e14ff0ef          	jal	1f10 <uart_status_read>
    2900:	00256593          	ori	a1,a0,2
    2904:	0ff5f593          	zext.b	a1,a1
    2908:	f8010537          	lui	a0,0xf8010
    290c:	e0cff0ef          	jal	1f18 <uart_status_write>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
    2910:	00100693          	li	a3,1
    2914:	00100613          	li	a2,1
    2918:	00000593          	li	a1,0
    291c:	f8c00537          	lui	a0,0xf8c00
    2920:	8adff0ef          	jal	21cc <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 2); // 1
    2924:	00200613          	li	a2,2
    2928:	00100593          	li	a1,1
    292c:	f8c00537          	lui	a0,0xf8c00
    2930:	88dff0ef          	jal	21bc <plic_set_priority>
}
    2934:	00c12083          	lw	ra,12(sp)
    2938:	01010113          	addi	sp,sp,16
    293c:	00008067          	ret

00002940 <trigger_next_display_dma>:
{
    2940:	ff010113          	addi	sp,sp,-16
    2944:	00112623          	sw	ra,12(sp)
    if (select_demo_mode == 0 || select_demo_mode == 3)
    2948:	8341a783          	lw	a5,-1996(gp) # 5864 <select_demo_mode>
    294c:	02078663          	beqz	a5,2978 <trigger_next_display_dma+0x38>
    2950:	00300713          	li	a4,3
    2954:	02e78263          	beq	a5,a4,2978 <trigger_next_display_dma+0x38>
    else if (select_demo_mode == 1)
    2958:	00100713          	li	a4,1
    295c:	08e78063          	beq	a5,a4,29dc <trigger_next_display_dma+0x9c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, SOBEL_START_ADDR, 16);
    2960:	01000693          	li	a3,16
    2964:	00900637          	lui	a2,0x900
    2968:	00200593          	li	a1,2
    296c:	f8110537          	lui	a0,0xf8110
    2970:	9d1ff0ef          	jal	2340 <dmasg_input_memory>
    2974:	0180006f          	j	298c <trigger_next_display_dma+0x4c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    2978:	01000693          	li	a3,16
    297c:	00100637          	lui	a2,0x100
    2980:	00200593          	li	a1,2
    2984:	f8110537          	lui	a0,0xf8110
    2988:	9b9ff0ef          	jal	2340 <dmasg_input_memory>
    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    298c:	00100793          	li	a5,1
    2990:	00000713          	li	a4,0
    2994:	00000693          	li	a3,0
    2998:	00000613          	li	a2,0
    299c:	00200593          	li	a1,2
    29a0:	f8110537          	lui	a0,0xf8110
    29a4:	a25ff0ef          	jal	23c8 <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    29a8:	00400613          	li	a2,4
    29ac:	00200593          	li	a1,2
    29b0:	f8110537          	lui	a0,0xf8110
    29b4:	a69ff0ef          	jal	241c <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restar
    29b8:	00000693          	li	a3,0
    29bc:	0011d637          	lui	a2,0x11d
    29c0:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116250>
    29c4:	00200593          	li	a1,2
    29c8:	f8110537          	lui	a0,0xf8110
    29cc:	a29ff0ef          	jal	23f4 <dmasg_direct_start>
}
    29d0:	00c12083          	lw	ra,12(sp)
    29d4:	01010113          	addi	sp,sp,16
    29d8:	00008067          	ret
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16);
    29dc:	01000693          	li	a3,16
    29e0:	00500637          	lui	a2,0x500
    29e4:	00200593          	li	a1,2
    29e8:	f8110537          	lui	a0,0xf8110
    29ec:	955ff0ef          	jal	2340 <dmasg_input_memory>
    29f0:	f9dff06f          	j	298c <trigger_next_display_dma+0x4c>

000029f4 <uart_buffer_read>:
{
    29f4:	ff010113          	addi	sp,sp,-16
    29f8:	00112623          	sw	ra,12(sp)
    29fc:	00812423          	sw	s0,8(sp)
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2a00:	0440006f          	j	2a44 <uart_buffer_read+0x50>
           uart_write(BSP_UART_TERMINAL, c);
    2a04:	00040593          	mv	a1,s0
    2a08:	f8010537          	lui	a0,0xf8010
    2a0c:	c64ff0ef          	jal	1e70 <uart_write>
    2a10:	0a40006f          	j	2ab4 <uart_buffer_read+0xc0>
            if (uart_cmd_index > 0) {
    2a14:	82d1c783          	lbu	a5,-2003(gp) # 585d <uart_cmd_index>
    2a18:	0ff7f793          	zext.b	a5,a5
    2a1c:	02078463          	beqz	a5,2a44 <uart_buffer_read+0x50>
                uart_cmd_buffer[uart_cmd_index] = '\0';
    2a20:	82d1c683          	lbu	a3,-2003(gp) # 585d <uart_cmd_index>
    2a24:	97c18793          	addi	a5,gp,-1668 # 59ac <uart_cmd_buffer>
    2a28:	00d787b3          	add	a5,a5,a3
    2a2c:	00078023          	sb	zero,0(a5)
                uart_cmd_ready = true;
    2a30:	00100693          	li	a3,1
    2a34:	82d18623          	sb	a3,-2004(gp) # 585c <uart_cmd_ready>
                uart_cmd_index = 0;         // reset for next command
    2a38:	820186a3          	sb	zero,-2003(gp) # 585d <uart_cmd_index>
            continue;
    2a3c:	0080006f          	j	2a44 <uart_buffer_read+0x50>
            uart_cmd_index = 0;
    2a40:	820186a3          	sb	zero,-2003(gp) # 585d <uart_cmd_index>
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2a44:	f8010537          	lui	a0,0xf8010
    2a48:	cc8ff0ef          	jal	1f10 <uart_status_read>
    2a4c:	20057513          	andi	a0,a0,512
    2a50:	0a050263          	beqz	a0,2af4 <uart_buffer_read+0x100>
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD); // RX FIFO not empty interrupt Disable
    2a54:	f8010537          	lui	a0,0xf8010
    2a58:	cb8ff0ef          	jal	1f10 <uart_status_read>
    2a5c:	0fd57593          	andi	a1,a0,253
    2a60:	f8010537          	lui	a0,0xf8010
    2a64:	cb4ff0ef          	jal	1f18 <uart_status_write>
        char c = uart_read(BSP_UART_TERMINAL);
    2a68:	f8010537          	lui	a0,0xf8010
    2a6c:	c40ff0ef          	jal	1eac <uart_read>
    2a70:	00050413          	mv	s0,a0
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2a74:	f8010537          	lui	a0,0xf8010
    2a78:	c98ff0ef          	jal	1f10 <uart_status_read>
    2a7c:	00256593          	ori	a1,a0,2
    2a80:	0ff5f593          	zext.b	a1,a1
    2a84:	f8010537          	lui	a0,0xf8010
    2a88:	c90ff0ef          	jal	1f18 <uart_status_write>
        if (c == '\r' || c == '\n') {
    2a8c:	00d00793          	li	a5,13
    2a90:	00f40663          	beq	s0,a5,2a9c <uart_buffer_read+0xa8>
    2a94:	00a00793          	li	a5,10
    2a98:	f6f416e3          	bne	s0,a5,2a04 <uart_buffer_read+0x10>
            uart_write(BSP_UART_TERMINAL, '\r');
    2a9c:	00d00593          	li	a1,13
    2aa0:	f8010537          	lui	a0,0xf8010
    2aa4:	bccff0ef          	jal	1e70 <uart_write>
            uart_write(BSP_UART_TERMINAL, '\n');
    2aa8:	00a00593          	li	a1,10
    2aac:	f8010537          	lui	a0,0xf8010
    2ab0:	bc0ff0ef          	jal	1e70 <uart_write>
        if (c == '\r' || c == '\n') {
    2ab4:	00d00793          	li	a5,13
    2ab8:	f4f40ee3          	beq	s0,a5,2a14 <uart_buffer_read+0x20>
    2abc:	00a00793          	li	a5,10
    2ac0:	f4f40ae3          	beq	s0,a5,2a14 <uart_buffer_read+0x20>
        if (uart_cmd_index < UART_CMD_MAX_LEN - 1) {
    2ac4:	82d1c783          	lbu	a5,-2003(gp) # 585d <uart_cmd_index>
    2ac8:	0ff7f793          	zext.b	a5,a5
    2acc:	03e00713          	li	a4,62
    2ad0:	f6f768e3          	bltu	a4,a5,2a40 <uart_buffer_read+0x4c>
            uart_cmd_buffer[uart_cmd_index++] = c;
    2ad4:	82d1c703          	lbu	a4,-2003(gp) # 585d <uart_cmd_index>
    2ad8:	00170793          	addi	a5,a4,1
    2adc:	0ff7f793          	zext.b	a5,a5
    2ae0:	82f186a3          	sb	a5,-2003(gp) # 585d <uart_cmd_index>
    2ae4:	97c18793          	addi	a5,gp,-1668 # 59ac <uart_cmd_buffer>
    2ae8:	00e787b3          	add	a5,a5,a4
    2aec:	00878023          	sb	s0,0(a5)
    2af0:	f55ff06f          	j	2a44 <uart_buffer_read+0x50>
    if (uart_cmd_ready) {
    2af4:	82c1c783          	lbu	a5,-2004(gp) # 585c <uart_cmd_ready>
    2af8:	0ff7f793          	zext.b	a5,a5
    2afc:	00079a63          	bnez	a5,2b10 <uart_buffer_read+0x11c>
}
    2b00:	00c12083          	lw	ra,12(sp)
    2b04:	00812403          	lw	s0,8(sp)
    2b08:	01010113          	addi	sp,sp,16
    2b0c:	00008067          	ret
        var = uart_cmd_buffer[0];
    2b10:	97c18413          	addi	s0,gp,-1668 # 59ac <uart_cmd_buffer>
    2b14:	00044783          	lbu	a5,0(s0)
    2b18:	0ff7f793          	zext.b	a5,a5
    2b1c:	96f18c23          	sb	a5,-1672(gp) # 59a8 <var>
        data= atoi(&uart_cmd_buffer[1]);
    2b20:	97d18513          	addi	a0,gp,-1667 # 59ad <uart_cmd_buffer+0x1>
    2b24:	d4cfe0ef          	jal	1070 <atoi>
    2b28:	96a1aa23          	sw	a0,-1676(gp) # 59a4 <data>
        char_data= uart_cmd_buffer[1];
    2b2c:	00144783          	lbu	a5,1(s0)
    2b30:	0ff7f793          	zext.b	a5,a5
    2b34:	96f18823          	sb	a5,-1680(gp) # 59a0 <char_data>
}
    2b38:	fc9ff06f          	j	2b00 <uart_buffer_read+0x10c>

00002b3c <settings>:
    if (uart_cmd_ready)
    2b3c:	82c1c783          	lbu	a5,-2004(gp) # 585c <uart_cmd_ready>
    2b40:	0ff7f793          	zext.b	a5,a5
    2b44:	3a078a63          	beqz	a5,2ef8 <settings+0x3bc>
{
    2b48:	ff010113          	addi	sp,sp,-16
    2b4c:	00112623          	sw	ra,12(sp)
    {uart_cmd_ready = false; // Reset command ready flag
    2b50:	82018623          	sb	zero,-2004(gp) # 585c <uart_cmd_ready>
        switch (var)
    2b54:	9781c783          	lbu	a5,-1672(gp) # 59a8 <var>
    2b58:	fd078793          	addi	a5,a5,-48
    2b5c:	0ff7f693          	zext.b	a3,a5
    2b60:	01500713          	li	a4,21
    2b64:	38d76063          	bltu	a4,a3,2ee4 <settings+0x3a8>
    2b68:	00269793          	slli	a5,a3,0x2
    2b6c:	00005737          	lui	a4,0x5
    2b70:	fcc70713          	addi	a4,a4,-52 # 4fcc <_data+0xb50>
    2b74:	00e787b3          	add	a5,a5,a4
    2b78:	0007a783          	lw	a5,0(a5)
    2b7c:	00078067          	jr	a5
            if (char_data == 'a')
    2b80:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2b84:	0ff7f793          	zext.b	a5,a5
    2b88:	06100713          	li	a4,97
    2b8c:	06e78c63          	beq	a5,a4,2c04 <settings+0xc8>
            else if (char_data == 'b')
    2b90:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2b94:	0ff7f793          	zext.b	a5,a5
    2b98:	06200713          	li	a4,98
    2b9c:	06e78e63          	beq	a5,a4,2c18 <settings+0xdc>
            else if (char_data == 'c')
    2ba0:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2ba4:	0ff7f793          	zext.b	a5,a5
    2ba8:	06300713          	li	a4,99
    2bac:	08e78263          	beq	a5,a4,2c30 <settings+0xf4>
            else if (char_data == 'd')
    2bb0:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2bb4:	0ff7f793          	zext.b	a5,a5
    2bb8:	06400713          	li	a4,100
    2bbc:	08e78663          	beq	a5,a4,2c48 <settings+0x10c>
            else if (char_data == 'e')
    2bc0:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2bc4:	0ff7f793          	zext.b	a5,a5
    2bc8:	06500713          	li	a4,101
    2bcc:	08e78a63          	beq	a5,a4,2c60 <settings+0x124>
            else if (char_data == 'f')
    2bd0:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2bd4:	0ff7f793          	zext.b	a5,a5
    2bd8:	06600713          	li	a4,102
    2bdc:	08e78e63          	beq	a5,a4,2c78 <settings+0x13c>
            else if (char_data == 'g')
    2be0:	9701c783          	lbu	a5,-1680(gp) # 59a0 <char_data>
    2be4:	0ff7f793          	zext.b	a5,a5
    2be8:	06700713          	li	a4,103
    2bec:	0ae78263          	beq	a5,a4,2c90 <settings+0x154>
                bsp_printf("Invalid Demo Mode: %c\n\r", char_data);
    2bf0:	9701c583          	lbu	a1,-1680(gp) # 59a0 <char_data>
    2bf4:	00005537          	lui	a0,0x5
    2bf8:	9a050513          	addi	a0,a0,-1632 # 49a0 <_data+0x524>
    2bfc:	865ff0ef          	jal	2460 <bsp_printf>
    2c00:	0d00006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 0;
    2c04:	8201aa23          	sw	zero,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: Da\n\r");
    2c08:	00005537          	lui	a0,0x5
    2c0c:	8dc50513          	addi	a0,a0,-1828 # 48dc <_data+0x460>
    2c10:	851ff0ef          	jal	2460 <bsp_printf>
    2c14:	0bc0006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 1;
    2c18:	00100713          	li	a4,1
    2c1c:	82e1aa23          	sw	a4,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: Db\n\r");
    2c20:	00005537          	lui	a0,0x5
    2c24:	8f850513          	addi	a0,a0,-1800 # 48f8 <_data+0x47c>
    2c28:	839ff0ef          	jal	2460 <bsp_printf>
    2c2c:	0a40006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 2;
    2c30:	00200713          	li	a4,2
    2c34:	82e1aa23          	sw	a4,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: Dc\n\r");
    2c38:	00005537          	lui	a0,0x5
    2c3c:	91450513          	addi	a0,a0,-1772 # 4914 <_data+0x498>
    2c40:	821ff0ef          	jal	2460 <bsp_printf>
    2c44:	08c0006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 3;
    2c48:	00300713          	li	a4,3
    2c4c:	82e1aa23          	sw	a4,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: Dd\n\r");
    2c50:	00005537          	lui	a0,0x5
    2c54:	93050513          	addi	a0,a0,-1744 # 4930 <_data+0x4b4>
    2c58:	809ff0ef          	jal	2460 <bsp_printf>
    2c5c:	0740006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 4;
    2c60:	00400713          	li	a4,4
    2c64:	82e1aa23          	sw	a4,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: De\n\r");
    2c68:	00005537          	lui	a0,0x5
    2c6c:	94c50513          	addi	a0,a0,-1716 # 494c <_data+0x4d0>
    2c70:	ff0ff0ef          	jal	2460 <bsp_printf>
    2c74:	05c0006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 5;
    2c78:	00500713          	li	a4,5
    2c7c:	82e1aa23          	sw	a4,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: Df\n\r");
    2c80:	00005537          	lui	a0,0x5
    2c84:	96850513          	addi	a0,a0,-1688 # 4968 <_data+0x4ec>
    2c88:	fd8ff0ef          	jal	2460 <bsp_printf>
    2c8c:	0440006f          	j	2cd0 <settings+0x194>
                select_demo_mode = 6;
    2c90:	00600713          	li	a4,6
    2c94:	82e1aa23          	sw	a4,-1996(gp) # 5864 <select_demo_mode>
                bsp_printf("Selected Demo Mode: Dg\n\r");
    2c98:	00005537          	lui	a0,0x5
    2c9c:	98450513          	addi	a0,a0,-1660 # 4984 <_data+0x508>
    2ca0:	fc0ff0ef          	jal	2460 <bsp_printf>
    2ca4:	02c0006f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 0, data);
    2ca8:	9741a783          	lw	a5,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2cac:	01079793          	slli	a5,a5,0x10
    2cb0:	0107d793          	srli	a5,a5,0x10
        *((volatile u32*) address) = data;
    2cb4:	f8100737          	lui	a4,0xf8100
    2cb8:	00f72023          	sw	a5,0(a4) # f8100000 <__freertos_irq_stack_top+0xf80f9610>
	bsp_uDelay(DELAY_BUSY);
    2cbc:	f8b00637          	lui	a2,0xf8b00
    2cc0:	05f5e5b7          	lui	a1,0x5f5e
    2cc4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2cc8:	00500513          	li	a0,5
    2ccc:	a54ff0ef          	jal	1f20 <clint_uDelay>
}
    2cd0:	00c12083          	lw	ra,12(sp)
    2cd4:	01010113          	addi	sp,sp,16
    2cd8:	00008067          	ret
            Set_Gain(0, 1, data);
    2cdc:	9741a603          	lw	a2,-1676(gp) # 59a4 <data>
    2ce0:	01061613          	slli	a2,a2,0x10
    2ce4:	01065613          	srli	a2,a2,0x10
    2ce8:	00100593          	li	a1,1
    2cec:	00000513          	li	a0,0
    2cf0:	d60ff0ef          	jal	2250 <Set_Gain>
            break;
    2cf4:	fddff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 2, data);
    2cf8:	9741a603          	lw	a2,-1676(gp) # 59a4 <data>
    2cfc:	01061613          	slli	a2,a2,0x10
    2d00:	01065613          	srli	a2,a2,0x10
    2d04:	00200593          	li	a1,2
    2d08:	00000513          	li	a0,0
    2d0c:	d44ff0ef          	jal	2250 <Set_Gain>
            break;
    2d10:	fc1ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 3, data);
    2d14:	9741a603          	lw	a2,-1676(gp) # 59a4 <data>
    2d18:	01061613          	slli	a2,a2,0x10
    2d1c:	01065613          	srli	a2,a2,0x10
    2d20:	00300593          	li	a1,3
    2d24:	00000513          	li	a0,0
    2d28:	d28ff0ef          	jal	2250 <Set_Gain>
            break;
    2d2c:	fa5ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 4, data);
    2d30:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2d34:	01071713          	slli	a4,a4,0x10
    2d38:	01075713          	srli	a4,a4,0x10
    2d3c:	f81007b7          	lui	a5,0xf8100
    2d40:	02e7a023          	sw	a4,32(a5) # f8100020 <__freertos_irq_stack_top+0xf80f9630>
	bsp_uDelay(DELAY_BUSY);
    2d44:	f8b00637          	lui	a2,0xf8b00
    2d48:	05f5e5b7          	lui	a1,0x5f5e
    2d4c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2d50:	00500513          	li	a0,5
    2d54:	9ccff0ef          	jal	1f20 <clint_uDelay>
}
    2d58:	f79ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 5, data);
    2d5c:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2d60:	01071713          	slli	a4,a4,0x10
    2d64:	01075713          	srli	a4,a4,0x10
    2d68:	f81007b7          	lui	a5,0xf8100
    2d6c:	02e7a223          	sw	a4,36(a5) # f8100024 <__freertos_irq_stack_top+0xf80f9634>
	bsp_uDelay(DELAY_BUSY);
    2d70:	f8b00637          	lui	a2,0xf8b00
    2d74:	05f5e5b7          	lui	a1,0x5f5e
    2d78:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2d7c:	00500513          	li	a0,5
    2d80:	9a0ff0ef          	jal	1f20 <clint_uDelay>
}
    2d84:	f4dff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 6, data);
    2d88:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2d8c:	01071713          	slli	a4,a4,0x10
    2d90:	01075713          	srli	a4,a4,0x10
    2d94:	f81007b7          	lui	a5,0xf8100
    2d98:	02e7a423          	sw	a4,40(a5) # f8100028 <__freertos_irq_stack_top+0xf80f9638>
	bsp_uDelay(DELAY_BUSY);
    2d9c:	f8b00637          	lui	a2,0xf8b00
    2da0:	05f5e5b7          	lui	a1,0x5f5e
    2da4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2da8:	00500513          	li	a0,5
    2dac:	974ff0ef          	jal	1f20 <clint_uDelay>
}
    2db0:	f21ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 7, data);
    2db4:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2db8:	01071713          	slli	a4,a4,0x10
    2dbc:	01075713          	srli	a4,a4,0x10
    2dc0:	f81007b7          	lui	a5,0xf8100
    2dc4:	02e7a623          	sw	a4,44(a5) # f810002c <__freertos_irq_stack_top+0xf80f963c>
	bsp_uDelay(DELAY_BUSY);
    2dc8:	f8b00637          	lui	a2,0xf8b00
    2dcc:	05f5e5b7          	lui	a1,0x5f5e
    2dd0:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2dd4:	00500513          	li	a0,5
    2dd8:	948ff0ef          	jal	1f20 <clint_uDelay>
}
    2ddc:	ef5ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 8, data);
    2de0:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2de4:	01071713          	slli	a4,a4,0x10
    2de8:	01075713          	srli	a4,a4,0x10
    2dec:	f81007b7          	lui	a5,0xf8100
    2df0:	02e7a823          	sw	a4,48(a5) # f8100030 <__freertos_irq_stack_top+0xf80f9640>
	bsp_uDelay(DELAY_BUSY);
    2df4:	f8b00637          	lui	a2,0xf8b00
    2df8:	05f5e5b7          	lui	a1,0x5f5e
    2dfc:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2e00:	00500513          	li	a0,5
    2e04:	91cff0ef          	jal	1f20 <clint_uDelay>
}
    2e08:	ec9ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 9, data);
    2e0c:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2e10:	01071713          	slli	a4,a4,0x10
    2e14:	01075713          	srli	a4,a4,0x10
    2e18:	f81007b7          	lui	a5,0xf8100
    2e1c:	02e7aa23          	sw	a4,52(a5) # f8100034 <__freertos_irq_stack_top+0xf80f9644>
	bsp_uDelay(DELAY_BUSY);
    2e20:	f8b00637          	lui	a2,0xf8b00
    2e24:	05f5e5b7          	lui	a1,0x5f5e
    2e28:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2e2c:	00500513          	li	a0,5
    2e30:	8f0ff0ef          	jal	1f20 <clint_uDelay>
}
    2e34:	e9dff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 10, data);
    2e38:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2e3c:	01071713          	slli	a4,a4,0x10
    2e40:	01075713          	srli	a4,a4,0x10
    2e44:	f81007b7          	lui	a5,0xf8100
    2e48:	02e7ac23          	sw	a4,56(a5) # f8100038 <__freertos_irq_stack_top+0xf80f9648>
	bsp_uDelay(DELAY_BUSY);
    2e4c:	f8b00637          	lui	a2,0xf8b00
    2e50:	05f5e5b7          	lui	a1,0x5f5e
    2e54:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2e58:	00500513          	li	a0,5
    2e5c:	8c4ff0ef          	jal	1f20 <clint_uDelay>
}
    2e60:	e71ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 11, data);
    2e64:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2e68:	01071713          	slli	a4,a4,0x10
    2e6c:	01075713          	srli	a4,a4,0x10
    2e70:	f81007b7          	lui	a5,0xf8100
    2e74:	02e7ae23          	sw	a4,60(a5) # f810003c <__freertos_irq_stack_top+0xf80f964c>
	bsp_uDelay(DELAY_BUSY);
    2e78:	f8b00637          	lui	a2,0xf8b00
    2e7c:	05f5e5b7          	lui	a1,0x5f5e
    2e80:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2e84:	00500513          	li	a0,5
    2e88:	898ff0ef          	jal	1f20 <clint_uDelay>
}
    2e8c:	e45ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 12, data);
    2e90:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
	u32 data = setting;
    2e94:	01071713          	slli	a4,a4,0x10
    2e98:	01075713          	srli	a4,a4,0x10
    2e9c:	f81007b7          	lui	a5,0xf8100
    2ea0:	04e7a023          	sw	a4,64(a5) # f8100040 <__freertos_irq_stack_top+0xf80f9650>
	bsp_uDelay(DELAY_BUSY);
    2ea4:	f8b00637          	lui	a2,0xf8b00
    2ea8:	05f5e5b7          	lui	a1,0x5f5e
    2eac:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2eb0:	00500513          	li	a0,5
    2eb4:	86cff0ef          	jal	1f20 <clint_uDelay>
}
    2eb8:	e19ff06f          	j	2cd0 <settings+0x194>
            Set_Gain(0, 13, data);
    2ebc:	9741a703          	lw	a4,-1676(gp) # 59a4 <data>
		data &= 0x3;
    2ec0:	00377713          	andi	a4,a4,3
    2ec4:	f81007b7          	lui	a5,0xf8100
    2ec8:	04e7a223          	sw	a4,68(a5) # f8100044 <__freertos_irq_stack_top+0xf80f9654>
	bsp_uDelay(DELAY_BUSY);
    2ecc:	f8b00637          	lui	a2,0xf8b00
    2ed0:	05f5e5b7          	lui	a1,0x5f5e
    2ed4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57710>
    2ed8:	00500513          	li	a0,5
    2edc:	844ff0ef          	jal	1f20 <clint_uDelay>
}
    2ee0:	df1ff06f          	j	2cd0 <settings+0x194>
            bsp_printf("Unknown command: %c (demo modes: D+a-g, gains: 0-9/A/B/C/E+value)\n\r", var);
    2ee4:	9781c583          	lbu	a1,-1672(gp) # 59a8 <var>
    2ee8:	00005537          	lui	a0,0x5
    2eec:	9b850513          	addi	a0,a0,-1608 # 49b8 <_data+0x53c>
    2ef0:	d70ff0ef          	jal	2460 <bsp_printf>
}
    2ef4:	dddff06f          	j	2cd0 <settings+0x194>
    2ef8:	00008067          	ret

00002efc <externalInterrupt>:
{
    2efc:	ff010113          	addi	sp,sp,-16
    2f00:	00112623          	sw	ra,12(sp)
    2f04:	00812423          	sw	s0,8(sp)
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2f08:	01c0006f          	j	2f24 <externalInterrupt+0x28>
            uart_buffer_read();
    2f0c:	ae9ff0ef          	jal	29f4 <uart_buffer_read>
            settings();
    2f10:	c2dff0ef          	jal	2b3c <settings>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); // unmask the claimed interrupt
    2f14:	00040613          	mv	a2,s0
    2f18:	00000593          	li	a1,0
    2f1c:	f8c00537          	lui	a0,0xf8c00
    2f20:	b14ff0ef          	jal	2234 <plic_release>
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2f24:	00000593          	li	a1,0
    2f28:	f8c00537          	lui	a0,0xf8c00
    2f2c:	aecff0ef          	jal	2218 <plic_claim>
    2f30:	00050413          	mv	s0,a0
    2f34:	02050e63          	beqz	a0,2f70 <externalInterrupt+0x74>
        switch (claim)
    2f38:	00100793          	li	a5,1
    2f3c:	fcf408e3          	beq	s0,a5,2f0c <externalInterrupt+0x10>
    2f40:	00600793          	li	a5,6
    2f44:	02f41263          	bne	s0,a5,2f68 <externalInterrupt+0x6c>
            if (display_mm2s_active && !(dmasg_busy(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL)))
    2f48:	8301a783          	lw	a5,-2000(gp) # 5860 <display_mm2s_active>
    2f4c:	fc0784e3          	beqz	a5,2f14 <externalInterrupt+0x18>
    2f50:	00200593          	li	a1,2
    2f54:	f8110537          	lui	a0,0xf8110
    2f58:	cdcff0ef          	jal	2434 <dmasg_busy>
    2f5c:	fa051ce3          	bnez	a0,2f14 <externalInterrupt+0x18>
                trigger_next_display_dma();
    2f60:	9e1ff0ef          	jal	2940 <trigger_next_display_dma>
    2f64:	fb1ff06f          	j	2f14 <externalInterrupt+0x18>
            crash();
    2f68:	c99fe0ef          	jal	1c00 <crash>
            break;
    2f6c:	fa9ff06f          	j	2f14 <externalInterrupt+0x18>
}
    2f70:	00c12083          	lw	ra,12(sp)
    2f74:	00812403          	lw	s0,8(sp)
    2f78:	01010113          	addi	sp,sp,16
    2f7c:	00008067          	ret

00002f80 <ispExample_menu>:
{
    2f80:	ff010113          	addi	sp,sp,-16
    2f84:	00112623          	sw	ra,12(sp)
    2f88:	00812423          	sw	s0,8(sp)
    bsp_printf("================================================================================ \n\r");
    2f8c:	00005437          	lui	s0,0x5
    2f90:	9fc40513          	addi	a0,s0,-1540 # 49fc <_data+0x580>
    2f94:	cccff0ef          	jal	2460 <bsp_printf>
    bsp_printf("                    ISP Example Design Scenario Selection\n\r");
    2f98:	00005537          	lui	a0,0x5
    2f9c:	a5050513          	addi	a0,a0,-1456 # 4a50 <_data+0x5d4>
    2fa0:	cc0ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("================================================================================ \n\r");
    2fa4:	9fc40513          	addi	a0,s0,-1540
    2fa8:	cb8ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Da' : Camera Capture + HDMI Display                                             \n\r");
    2fac:	00005537          	lui	a0,0x5
    2fb0:	a8c50513          	addi	a0,a0,-1396 # 4a8c <_data+0x610>
    2fb4:	cacff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Db' : Camera Capture + RGB2Grayscale (SW) + HDMI Display                        \n\r");
    2fb8:	00005537          	lui	a0,0x5
    2fbc:	ae050513          	addi	a0,a0,-1312 # 4ae0 <_data+0x664>
    2fc0:	ca0ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Dc' : Camera Capture + RGB2Grayscale (SW) + Sobel (HW) + HDMI Display           \n\r");
    2fc4:	00005537          	lui	a0,0x5
    2fc8:	b3450513          	addi	a0,a0,-1228 # 4b34 <_data+0x6b8>
    2fcc:	c94ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Dd' : Camera Capture + RGB2Grayscale (HW) + HDMI Display                        \n\r");
    2fd0:	00005537          	lui	a0,0x5
    2fd4:	b8850513          	addi	a0,a0,-1144 # 4b88 <_data+0x70c>
    2fd8:	c88ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'De' : Camera Capture + RGB2Grayscale & Sobel (HW) + HDMI Display                \n\r");
    2fdc:	00005537          	lui	a0,0x5
    2fe0:	bdc50513          	addi	a0,a0,-1060 # 4bdc <_data+0x760>
    2fe4:	c7cff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Df' : Camera Capture + RGB2Grayscale & Sobel & Dilation (HW) + HDMI Display     \n\r");
    2fe8:	00005537          	lui	a0,0x5
    2fec:	c3050513          	addi	a0,a0,-976 # 4c30 <_data+0x7b4>
    2ff0:	c70ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("'Dg' : Camera Capture + RGB2Grayscale & Sobel & Erosion  (HW) + HDMI Display     \n\r");
    2ff4:	00005537          	lui	a0,0x5
    2ff8:	c8450513          	addi	a0,a0,-892 # 4c84 <_data+0x808>
    2ffc:	c64ff0ef          	jal	2460 <bsp_printf>
    bsp_printf("================================================================================ \n\n\r");
    3000:	00005537          	lui	a0,0x5
    3004:	cd850513          	addi	a0,a0,-808 # 4cd8 <_data+0x85c>
    3008:	c58ff0ef          	jal	2460 <bsp_printf>
}
    300c:	00c12083          	lw	ra,12(sp)
    3010:	00812403          	lw	s0,8(sp)
    3014:	01010113          	addi	sp,sp,16
    3018:	00008067          	ret

0000301c <i2c_masterBusy>:
        return *((volatile u32*) address);
    301c:	04052503          	lw	a0,64(a0)
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
    3020:	00157513          	andi	a0,a0,1
    3024:	00008067          	ret

00003028 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3028:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    302c:	21000793          	li	a5,528
    3030:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3034:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3038:	0107f793          	andi	a5,a5,16
    303c:	fe079ce3          	bnez	a5,3034 <i2c_masterStartBlocking+0xc>
    }
    3040:	00008067          	ret

00003044 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
    3044:	ff010113          	addi	sp,sp,-16
    3048:	00112623          	sw	ra,12(sp)
    304c:	00812423          	sw	s0,8(sp)
    3050:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3054:	00040513          	mv	a0,s0
    3058:	fc5ff0ef          	jal	301c <i2c_masterBusy>
    305c:	fe051ce3          	bnez	a0,3054 <i2c_masterStopWait+0x10>
    }
    3060:	00c12083          	lw	ra,12(sp)
    3064:	00812403          	lw	s0,8(sp)
    3068:	01010113          	addi	sp,sp,16
    306c:	00008067          	ret

00003070 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
    3070:	ff010113          	addi	sp,sp,-16
    3074:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3078:	42000713          	li	a4,1056
    307c:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
    3080:	fc5ff0ef          	jal	3044 <i2c_masterStopWait>
    }
    3084:	00c12083          	lw	ra,12(sp)
    3088:	01010113          	addi	sp,sp,16
    308c:	00008067          	ret

00003090 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3090:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3094:	1007f793          	andi	a5,a5,256
    3098:	fe079ce3          	bnez	a5,3090 <i2c_txAckWait>
    }
    309c:	00008067          	ret

000030a0 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
    30a0:	ff010113          	addi	sp,sp,-16
    30a4:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    30a8:	30100713          	li	a4,769
    30ac:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
    30b0:	fe1ff0ef          	jal	3090 <i2c_txAckWait>
    }
    30b4:	00c12083          	lw	ra,12(sp)
    30b8:	01010113          	addi	sp,sp,16
    30bc:	00008067          	ret

000030c0 <i2c_rxAck>:
        return *((volatile u32*) address);
    30c0:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    30c4:	0ff57513          	zext.b	a0,a0
    }
    30c8:	00153513          	seqz	a0,a0
    30cc:	00008067          	ret

000030d0 <PiCam_WriteRegData>:
#include "riscv.h"
#include "PiCamDriver.h"
#include "common.h"

void PiCam_WriteRegData(u32 i2c_base, u16 reg, u8 data)
{
    30d0:	fe010113          	addi	sp,sp,-32
    30d4:	00112e23          	sw	ra,28(sp)
    30d8:	00812c23          	sw	s0,24(sp)
    30dc:	00912a23          	sw	s1,20(sp)
    30e0:	01212823          	sw	s2,16(sp)
    30e4:	01312623          	sw	s3,12(sp)
    30e8:	00050413          	mv	s0,a0
    30ec:	00058493          	mv	s1,a1
    30f0:	00060913          	mv	s2,a2
   u8 outdata;

   i2c_masterStartBlocking(i2c_base);
    30f4:	f35ff0ef          	jal	3028 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    30f8:	000017b7          	lui	a5,0x1
    30fc:	b2078793          	addi	a5,a5,-1248 # b20 <CUSTOM2+0xac5>
    3100:	00f42023          	sw	a5,0(s0)

   i2c_txByte(i2c_base, 0x10 << 1);
   i2c_txNackBlocking(i2c_base);
    3104:	00040513          	mv	a0,s0
    3108:	f99ff0ef          	jal	30a0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    310c:	00040513          	mv	a0,s0
    3110:	fb1ff0ef          	jal	30c0 <i2c_rxAck>
    3114:	ca5fe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg >> 8) & 0xFF);
    3118:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    311c:	000019b7          	lui	s3,0x1
    3120:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3124:	0137e7b3          	or	a5,a5,s3
    3128:	00f42023          	sw	a5,0(s0)
   i2c_txNackBlocking(i2c_base);
    312c:	00040513          	mv	a0,s0
    3130:	f71ff0ef          	jal	30a0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3134:	00040513          	mv	a0,s0
    3138:	f89ff0ef          	jal	30c0 <i2c_rxAck>
    313c:	c7dfe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg) & 0xFF);
    3140:	0ff4f493          	zext.b	s1,s1
    3144:	0134e4b3          	or	s1,s1,s3
    3148:	00942023          	sw	s1,0(s0)
   i2c_txNackBlocking(i2c_base);
    314c:	00040513          	mv	a0,s0
    3150:	f51ff0ef          	jal	30a0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3154:	00040513          	mv	a0,s0
    3158:	f69ff0ef          	jal	30c0 <i2c_rxAck>
    315c:	c5dfe0ef          	jal	1db8 <assert>
    3160:	01396933          	or	s2,s2,s3
    3164:	01242023          	sw	s2,0(s0)

   i2c_txByte(i2c_base, data & 0xFF);
   i2c_txNackBlocking(i2c_base);
    3168:	00040513          	mv	a0,s0
    316c:	f35ff0ef          	jal	30a0 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3170:	00040513          	mv	a0,s0
    3174:	f4dff0ef          	jal	30c0 <i2c_rxAck>
    3178:	c41fe0ef          	jal	1db8 <assert>

   i2c_masterStopBlocking(i2c_base);
    317c:	00040513          	mv	a0,s0
    3180:	ef1ff0ef          	jal	3070 <i2c_masterStopBlocking>
}
    3184:	01c12083          	lw	ra,28(sp)
    3188:	01812403          	lw	s0,24(sp)
    318c:	01412483          	lw	s1,20(sp)
    3190:	01012903          	lw	s2,16(sp)
    3194:	00c12983          	lw	s3,12(sp)
    3198:	02010113          	addi	sp,sp,32
    319c:	00008067          	ret

000031a0 <AccessCommSeq>:
   i2c_masterStopBlocking(i2c_base);

   return outdata;
}
void AccessCommSeq(u32 i2c_base)
{
    31a0:	ff010113          	addi	sp,sp,-16
    31a4:	00112623          	sw	ra,12(sp)
    31a8:	00812423          	sw	s0,8(sp)
    31ac:	00050413          	mv	s0,a0
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    31b0:	00500613          	li	a2,5
    31b4:	000035b7          	lui	a1,0x3
    31b8:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x1b>
    31bc:	f15ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x0C);
    31c0:	00c00613          	li	a2,12
    31c4:	000035b7          	lui	a1,0x3
    31c8:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x1b>
    31cc:	00040513          	mv	a0,s0
    31d0:	f01ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300A, 0xFF);
    31d4:	0ff00613          	li	a2,255
    31d8:	000035b7          	lui	a1,0x3
    31dc:	00a58593          	addi	a1,a1,10 # 300a <ispExample_menu+0x8a>
    31e0:	00040513          	mv	a0,s0
    31e4:	eedff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300B, 0xFF);
    31e8:	0ff00613          	li	a2,255
    31ec:	000035b7          	lui	a1,0x3
    31f0:	00b58593          	addi	a1,a1,11 # 300b <ispExample_menu+0x8b>
    31f4:	00040513          	mv	a0,s0
    31f8:	ed9ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    31fc:	00500613          	li	a2,5
    3200:	000035b7          	lui	a1,0x3
    3204:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x1b>
    3208:	00040513          	mv	a0,s0
    320c:	ec5ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x09);
    3210:	00900613          	li	a2,9
    3214:	000035b7          	lui	a1,0x3
    3218:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x1b>
    321c:	00040513          	mv	a0,s0
    3220:	eb1ff0ef          	jal	30d0 <PiCam_WriteRegData>
}
    3224:	00c12083          	lw	ra,12(sp)
    3228:	00812403          	lw	s0,8(sp)
    322c:	01010113          	addi	sp,sp,16
    3230:	00008067          	ret

00003234 <PiCam_Output_Size>:

void PiCam_Output_Size(u32 i2c_base, u16 X, u16 Y)
{
    3234:	ff010113          	addi	sp,sp,-16
    3238:	00112623          	sw	ra,12(sp)
    323c:	00812423          	sw	s0,8(sp)
    3240:	00912223          	sw	s1,4(sp)
    3244:	01212023          	sw	s2,0(sp)
    3248:	00050413          	mv	s0,a0
    324c:	00058913          	mv	s2,a1
    3250:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, x_output_size_A_1, X >> 8);
    3254:	0085d613          	srli	a2,a1,0x8
    3258:	16c00593          	li	a1,364
    325c:	e75ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, x_output_size_A_0, X & 0xFF);
    3260:	0ff97613          	zext.b	a2,s2
    3264:	16d00593          	li	a1,365
    3268:	00040513          	mv	a0,s0
    326c:	e65ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_1, Y >> 8);
    3270:	0084d613          	srli	a2,s1,0x8
    3274:	16e00593          	li	a1,366
    3278:	00040513          	mv	a0,s0
    327c:	e55ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_0, Y & 0xFF);
    3280:	0ff4f613          	zext.b	a2,s1
    3284:	16f00593          	li	a1,367
    3288:	00040513          	mv	a0,s0
    328c:	e45ff0ef          	jal	30d0 <PiCam_WriteRegData>
}
    3290:	00c12083          	lw	ra,12(sp)
    3294:	00812403          	lw	s0,8(sp)
    3298:	00412483          	lw	s1,4(sp)
    329c:	00012903          	lw	s2,0(sp)
    32a0:	01010113          	addi	sp,sp,16
    32a4:	00008067          	ret

000032a8 <PiCam_Output_activePixel>:

void PiCam_Output_activePixel(u32 i2c_base, u16 XStart, u16 XEnd, u16 YStart, u16 YEnd)
{
    32a8:	fe010113          	addi	sp,sp,-32
    32ac:	00112e23          	sw	ra,28(sp)
    32b0:	00812c23          	sw	s0,24(sp)
    32b4:	00912a23          	sw	s1,20(sp)
    32b8:	01212823          	sw	s2,16(sp)
    32bc:	01312623          	sw	s3,12(sp)
    32c0:	01412423          	sw	s4,8(sp)
    32c4:	00050413          	mv	s0,a0
    32c8:	00058a13          	mv	s4,a1
    32cc:	00060993          	mv	s3,a2
    32d0:	00068913          	mv	s2,a3
    32d4:	00070493          	mv	s1,a4
   // Max Active pixel 3280* 2464--imx219
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_1, XStart >> 8);
    32d8:	0085d613          	srli	a2,a1,0x8
    32dc:	16400593          	li	a1,356
    32e0:	df1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_0, XStart & 0xFF);
    32e4:	0ffa7613          	zext.b	a2,s4
    32e8:	16500593          	li	a1,357
    32ec:	00040513          	mv	a0,s0
    32f0:	de1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_1, XEnd >> 8);
    32f4:	0089d613          	srli	a2,s3,0x8
    32f8:	16600593          	li	a1,358
    32fc:	00040513          	mv	a0,s0
    3300:	dd1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_0, XEnd & 0xFF);
    3304:	0ff9f613          	zext.b	a2,s3
    3308:	16700593          	li	a1,359
    330c:	00040513          	mv	a0,s0
    3310:	dc1ff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_1, YStart >> 8);
    3314:	00895613          	srli	a2,s2,0x8
    3318:	16800593          	li	a1,360
    331c:	00040513          	mv	a0,s0
    3320:	db1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_0, YStart & 0xFF);
    3324:	0ff97613          	zext.b	a2,s2
    3328:	16900593          	li	a1,361
    332c:	00040513          	mv	a0,s0
    3330:	da1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
    3334:	0084d613          	srli	a2,s1,0x8
    3338:	16a00593          	li	a1,362
    333c:	00040513          	mv	a0,s0
    3340:	d91ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
    3344:	0ff4f613          	zext.b	a2,s1
    3348:	16b00593          	li	a1,363
    334c:	00040513          	mv	a0,s0
    3350:	d81ff0ef          	jal	30d0 <PiCam_WriteRegData>
}
    3354:	01c12083          	lw	ra,28(sp)
    3358:	01812403          	lw	s0,24(sp)
    335c:	01412483          	lw	s1,20(sp)
    3360:	01012903          	lw	s2,16(sp)
    3364:	00c12983          	lw	s3,12(sp)
    3368:	00812a03          	lw	s4,8(sp)
    336c:	02010113          	addi	sp,sp,32
    3370:	00008067          	ret

00003374 <PiCam_SetBinningMode>:
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
}

void PiCam_SetBinningMode(u32 i2c_base, u8 Xmode, u8 Ymode)
{
    3374:	ff010113          	addi	sp,sp,-16
    3378:	00112623          	sw	ra,12(sp)
    337c:	00812423          	sw	s0,8(sp)
    3380:	00912223          	sw	s1,4(sp)
    3384:	00050493          	mv	s1,a0
    3388:	00060413          	mv	s0,a2
   // 0:no-binning
   // 1:x2-binning
   // 2:x4-binning
   // 3:x2 analog (special)

   if (Xmode >= 3)
    338c:	00200793          	li	a5,2
    3390:	00b7f463          	bgeu	a5,a1,3398 <PiCam_SetBinningMode+0x24>
      Xmode = 3;
    3394:	00300593          	li	a1,3
   if (Ymode >= 3)
    3398:	00200793          	li	a5,2
    339c:	0087f463          	bgeu	a5,s0,33a4 <PiCam_SetBinningMode+0x30>
      Ymode = 3;
    33a0:	00300413          	li	s0,3

   PiCam_WriteRegData(i2c_base, BINNING_MODE_H_A, Xmode);
    33a4:	00058613          	mv	a2,a1
    33a8:	17400593          	li	a1,372
    33ac:	00048513          	mv	a0,s1
    33b0:	d21ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, BINNING_MODE_V_A, Ymode);
    33b4:	00040613          	mv	a2,s0
    33b8:	17500593          	li	a1,373
    33bc:	00048513          	mv	a0,s1
    33c0:	d11ff0ef          	jal	30d0 <PiCam_WriteRegData>
}
    33c4:	00c12083          	lw	ra,12(sp)
    33c8:	00812403          	lw	s0,8(sp)
    33cc:	00412483          	lw	s1,4(sp)
    33d0:	01010113          	addi	sp,sp,16
    33d4:	00008067          	ret

000033d8 <PiCam_Gainfilter>:

   PiCam_Output_ColorBarSize(i2c_base, X, Y);
}

void PiCam_Gainfilter(u32 i2c_base, u8 AGain, u16 DGain)
{
    33d8:	ff010113          	addi	sp,sp,-16
    33dc:	00112623          	sw	ra,12(sp)
    33e0:	00812423          	sw	s0,8(sp)
    33e4:	00912223          	sw	s1,4(sp)
    33e8:	00050413          	mv	s0,a0
    33ec:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, ANA_GAIN_GLOBAL_A, AGain & 0xFF);
    33f0:	00058613          	mv	a2,a1
    33f4:	15700593          	li	a1,343
    33f8:	cd9ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_1, (DGain >> 8) & 0x0F);
    33fc:	0084d613          	srli	a2,s1,0x8
    3400:	00f67613          	andi	a2,a2,15
    3404:	15800593          	li	a1,344
    3408:	00040513          	mv	a0,s0
    340c:	cc5ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_0, DGain & 0xFF);
    3410:	0ff4f613          	zext.b	a2,s1
    3414:	15900593          	li	a1,345
    3418:	00040513          	mv	a0,s0
    341c:	cb5ff0ef          	jal	30d0 <PiCam_WriteRegData>
}
    3420:	00c12083          	lw	ra,12(sp)
    3424:	00812403          	lw	s0,8(sp)
    3428:	00412483          	lw	s1,4(sp)
    342c:	01010113          	addi	sp,sp,16
    3430:	00008067          	ret

00003434 <PiCam_init>:

// For cam1
void PiCam_init(u32 i2c_base)
{
    3434:	ff010113          	addi	sp,sp,-16
    3438:	00112623          	sw	ra,12(sp)
    343c:	00812423          	sw	s0,8(sp)
    3440:	00050413          	mv	s0,a0

   PiCam_WriteRegData(i2c_base, mode_select, 0x00);
    3444:	00000613          	li	a2,0
    3448:	10000593          	li	a1,256
    344c:	c85ff0ef          	jal	30d0 <PiCam_WriteRegData>
   AccessCommSeq(i2c_base);
    3450:	00040513          	mv	a0,s0
    3454:	d4dff0ef          	jal	31a0 <AccessCommSeq>
   PiCam_WriteRegData(i2c_base, CSI_LANE_MODE, 0x01);
    3458:	00100613          	li	a2,1
    345c:	11400593          	li	a1,276
    3460:	00040513          	mv	a0,s0
    3464:	c6dff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DPHY_CTRL, 0x00);
    3468:	00000613          	li	a2,0
    346c:	12800593          	li	a1,296
    3470:	00040513          	mv	a0,s0
    3474:	c5dff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_1, 0x18);
    3478:	01800613          	li	a2,24
    347c:	12a00593          	li	a1,298
    3480:	00040513          	mv	a0,s0
    3484:	c4dff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_0, 0x00);
    3488:	00000613          	li	a2,0
    348c:	12b00593          	li	a1,299
    3490:	00040513          	mv	a0,s0
    3494:	c3dff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x04);
    3498:	00400613          	li	a2,4
    349c:	16000593          	li	a1,352
    34a0:	00040513          	mv	a0,s0
    34a4:	c2dff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0x59);
    34a8:	05900613          	li	a2,89
    34ac:	16100593          	li	a1,353
    34b0:	00040513          	mv	a0,s0
    34b4:	c1dff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    34b8:	00d00613          	li	a2,13
    34bc:	16200593          	li	a1,354
    34c0:	00040513          	mv	a0,s0
    34c4:	c0dff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    34c8:	07800613          	li	a2,120
    34cc:	16300593          	li	a1,355
    34d0:	00040513          	mv	a0,s0
    34d4:	bfdff0ef          	jal	30d0 <PiCam_WriteRegData>

   //   PiCam_Output_activePixel(i2c_base, 0, 3279, 0, 2463);
   PiCam_Output_activePixel(i2c_base, 680, 2599, 692, 1771); // Capture centre of sensor
    34d8:	6eb00713          	li	a4,1771
    34dc:	2b400693          	li	a3,692
    34e0:	00001637          	lui	a2,0x1
    34e4:	a2760613          	addi	a2,a2,-1497 # a27 <CUSTOM2+0x9cc>
    34e8:	2a800593          	li	a1,680
    34ec:	00040513          	mv	a0,s0
    34f0:	db9ff0ef          	jal	32a8 <PiCam_Output_activePixel>

   PiCam_Output_Size(i2c_base, 1920, 1080);
    34f4:	43800613          	li	a2,1080
    34f8:	78000593          	li	a1,1920
    34fc:	00040513          	mv	a0,s0
    3500:	d35ff0ef          	jal	3234 <PiCam_Output_Size>
   // PiCam_Output_Size(i2c_base, 1280, 720);
   // PiCam_Output_Size(i2c_base, 640, 480);

   PiCam_WriteRegData(i2c_base, X_ODD_INC_A, 0x01);
    3504:	00100613          	li	a2,1
    3508:	17000593          	li	a1,368
    350c:	00040513          	mv	a0,s0
    3510:	bc1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ODD_INC_A, 0x01);
    3514:	00100613          	li	a2,1
    3518:	17100593          	li	a1,369
    351c:	00040513          	mv	a0,s0
    3520:	bb1ff0ef          	jal	30d0 <PiCam_WriteRegData>

   // 0: No binning; 1: x2 binning; 2: x4 binning; 3: x2 binning (analog special)
   PiCam_SetBinningMode(i2c_base, 0, 0);
    3524:	00000613          	li	a2,0
    3528:	00000593          	li	a1,0
    352c:	00040513          	mv	a0,s0
    3530:	e45ff0ef          	jal	3374 <PiCam_SetBinningMode>

   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_1, 0x0A);
    3534:	00a00613          	li	a2,10
    3538:	18c00593          	li	a1,396
    353c:	00040513          	mv	a0,s0
    3540:	b91ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_0, 0x0A);
    3544:	00a00613          	li	a2,10
    3548:	18d00593          	li	a1,397
    354c:	00040513          	mv	a0,s0
    3550:	b81ff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, VTPXCK_DIV, 0x05);
    3554:	00500613          	li	a2,5
    3558:	30100593          	li	a1,769
    355c:	00040513          	mv	a0,s0
    3560:	b71ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, VTSYCK_DIV, 0x01);
    3564:	00100613          	li	a2,1
    3568:	30300593          	li	a1,771
    356c:	00040513          	mv	a0,s0
    3570:	b61ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_VT_DIV, 0x03);
    3574:	00300613          	li	a2,3
    3578:	30400593          	li	a1,772
    357c:	00040513          	mv	a0,s0
    3580:	b51ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_OP_DIV, 0x03);
    3584:	00300613          	li	a2,3
    3588:	30500593          	li	a1,773
    358c:	00040513          	mv	a0,s0
    3590:	b41ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_1, 0x00);
    3594:	00000613          	li	a2,0
    3598:	30600593          	li	a1,774
    359c:	00040513          	mv	a0,s0
    35a0:	b31ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_0, 0x39);
    35a4:	03900613          	li	a2,57
    35a8:	30700593          	li	a1,775
    35ac:	00040513          	mv	a0,s0
    35b0:	b21ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    35b4:	00a00613          	li	a2,10
    35b8:	30900593          	li	a1,777
    35bc:	00040513          	mv	a0,s0
    35c0:	b11ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    35c4:	00100613          	li	a2,1
    35c8:	30b00593          	li	a1,779
    35cc:	00040513          	mv	a0,s0
    35d0:	b01ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    35d4:	00000613          	li	a2,0
    35d8:	30c00593          	li	a1,780
    35dc:	00040513          	mv	a0,s0
    35e0:	af1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    35e4:	07200613          	li	a2,114
    35e8:	30d00593          	li	a1,781
    35ec:	00040513          	mv	a0,s0
    35f0:	ae1ff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    35f4:	00a00613          	li	a2,10
    35f8:	30900593          	li	a1,777
    35fc:	00040513          	mv	a0,s0
    3600:	ad1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    3604:	00100613          	li	a2,1
    3608:	30b00593          	li	a1,779
    360c:	00040513          	mv	a0,s0
    3610:	ac1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    3614:	00000613          	li	a2,0
    3618:	30c00593          	li	a1,780
    361c:	00040513          	mv	a0,s0
    3620:	ab1ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    3624:	07200613          	li	a2,114
    3628:	30d00593          	li	a1,781
    362c:	00040513          	mv	a0,s0
    3630:	aa1ff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, mode_select, 0x01);
    3634:	00100613          	li	a2,1
    3638:	10000593          	li	a1,256
    363c:	00040513          	mv	a0,s0
    3640:	a91ff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_Gainfilter(i2c_base, 0xB9, 0x200);
    3644:	20000613          	li	a2,512
    3648:	0b900593          	li	a1,185
    364c:	00040513          	mv	a0,s0
    3650:	d89ff0ef          	jal	33d8 <PiCam_Gainfilter>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    3654:	00d00613          	li	a2,13
    3658:	16200593          	li	a1,354
    365c:	00040513          	mv	a0,s0
    3660:	a71ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    3664:	07800613          	li	a2,120
    3668:	16300593          	li	a1,355
    366c:	00040513          	mv	a0,s0
    3670:	a61ff0ef          	jal	30d0 <PiCam_WriteRegData>
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
   */

   // Longer camera exposure time, suitable for low light condition. Trade-off with lower frame rate.
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x06);
    3674:	00600613          	li	a2,6
    3678:	16000593          	li	a1,352
    367c:	00040513          	mv	a0,s0
    3680:	a51ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0xE3);
    3684:	0e300613          	li	a2,227
    3688:	16100593          	li	a1,353
    368c:	00040513          	mv	a0,s0
    3690:	a41ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
    3694:	00400613          	li	a2,4
    3698:	15a00593          	li	a1,346
    369c:	00040513          	mv	a0,s0
    36a0:	a31ff0ef          	jal	30d0 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
    36a4:	05400613          	li	a2,84
    36a8:	15b00593          	li	a1,347
    36ac:	00040513          	mv	a0,s0
    36b0:	a21ff0ef          	jal	30d0 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, IMG_ORIENTATION_A, 0x00);
    36b4:	00000613          	li	a2,0
    36b8:	17200593          	li	a1,370
    36bc:	00040513          	mv	a0,s0
    36c0:	a11ff0ef          	jal	30d0 <PiCam_WriteRegData>
}
    36c4:	00c12083          	lw	ra,12(sp)
    36c8:	00812403          	lw	s0,8(sp)
    36cc:	01010113          	addi	sp,sp,16
    36d0:	00008067          	ret

000036d4 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    36d4:	04050713          	addi	a4,a0,64
    36d8:	21000793          	li	a5,528
    36dc:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    36e0:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    36e4:	0107f793          	andi	a5,a5,16
    36e8:	fe079ce3          	bnez	a5,36e0 <i2c_masterStartBlocking+0xc>
    }
    36ec:	00008067          	ret

000036f0 <i2c_txAckWait>:
    36f0:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    36f4:	1007f793          	andi	a5,a5,256
    36f8:	fe079ce3          	bnez	a5,36f0 <i2c_txAckWait>
    }
    36fc:	00008067          	ret

00003700 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3700:	ff010113          	addi	sp,sp,-16
    3704:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3708:	30100713          	li	a4,769
    370c:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3710:	fe1ff0ef          	jal	36f0 <i2c_txAckWait>
    }
    3714:	00c12083          	lw	ra,12(sp)
    3718:	01010113          	addi	sp,sp,16
    371c:	00008067          	ret

00003720 <i2c_rxAck>:
        return *((volatile u32*) address);
    3720:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3724:	0ff57513          	zext.b	a0,a0
    }
    3728:	00153513          	seqz	a0,a0
    372c:	00008067          	ret

00003730 <uart_writeAvailability>:
    3730:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3734:	01055513          	srli	a0,a0,0x10
    }
    3738:	0ff57513          	zext.b	a0,a0
    373c:	00008067          	ret

00003740 <uart_write>:
    static void uart_write(u32 reg, char data){
    3740:	ff010113          	addi	sp,sp,-16
    3744:	00112623          	sw	ra,12(sp)
    3748:	00812423          	sw	s0,8(sp)
    374c:	00912223          	sw	s1,4(sp)
    3750:	00050413          	mv	s0,a0
    3754:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    3758:	00040513          	mv	a0,s0
    375c:	fd5ff0ef          	jal	3730 <uart_writeAvailability>
    3760:	fe050ce3          	beqz	a0,3758 <uart_write+0x18>
        *((volatile u32*) address) = data;
    3764:	00942023          	sw	s1,0(s0)
    }
    3768:	00c12083          	lw	ra,12(sp)
    376c:	00812403          	lw	s0,8(sp)
    3770:	00412483          	lw	s1,4(sp)
    3774:	01010113          	addi	sp,sp,16
    3778:	00008067          	ret

0000377c <_putchar>:
    static void _putchar(char character){
    377c:	ff010113          	addi	sp,sp,-16
    3780:	00112623          	sw	ra,12(sp)
    3784:	00050593          	mv	a1,a0
            bsp_putChar(character);
    3788:	f8010537          	lui	a0,0xf8010
    378c:	fb5ff0ef          	jal	3740 <uart_write>
    }
    3790:	00c12083          	lw	ra,12(sp)
    3794:	01010113          	addi	sp,sp,16
    3798:	00008067          	ret

0000379c <_putchar_s>:
    {
    379c:	ff010113          	addi	sp,sp,-16
    37a0:	00112623          	sw	ra,12(sp)
    37a4:	00812423          	sw	s0,8(sp)
    37a8:	00050413          	mv	s0,a0
        while (*p)
    37ac:	00c0006f          	j	37b8 <_putchar_s+0x1c>
            _putchar(*(p++));
    37b0:	00140413          	addi	s0,s0,1
    37b4:	fc9ff0ef          	jal	377c <_putchar>
        while (*p)
    37b8:	00044503          	lbu	a0,0(s0)
    37bc:	fe051ae3          	bnez	a0,37b0 <_putchar_s+0x14>
    }
    37c0:	00c12083          	lw	ra,12(sp)
    37c4:	00812403          	lw	s0,8(sp)
    37c8:	01010113          	addi	sp,sp,16
    37cc:	00008067          	ret

000037d0 <bsp_printHex>:
    {
    37d0:	ff010113          	addi	sp,sp,-16
    37d4:	00112623          	sw	ra,12(sp)
    37d8:	00812423          	sw	s0,8(sp)
    37dc:	00912223          	sw	s1,4(sp)
    37e0:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    37e4:	01c00413          	li	s0,28
    37e8:	0240006f          	j	380c <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    37ec:	0084d733          	srl	a4,s1,s0
    37f0:	00f77713          	andi	a4,a4,15
    37f4:	000047b7          	lui	a5,0x4
    37f8:	48078793          	addi	a5,a5,1152 # 4480 <_data+0x4>
    37fc:	00e787b3          	add	a5,a5,a4
    3800:	0007c503          	lbu	a0,0(a5)
    3804:	f79ff0ef          	jal	377c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3808:	ffc40413          	addi	s0,s0,-4
    380c:	fe0450e3          	bgez	s0,37ec <bsp_printHex+0x1c>
    }
    3810:	00c12083          	lw	ra,12(sp)
    3814:	00812403          	lw	s0,8(sp)
    3818:	00412483          	lw	s1,4(sp)
    381c:	01010113          	addi	sp,sp,16
    3820:	00008067          	ret

00003824 <bsp_printHex_lower>:
    {
    3824:	ff010113          	addi	sp,sp,-16
    3828:	00112623          	sw	ra,12(sp)
    382c:	00812423          	sw	s0,8(sp)
    3830:	00912223          	sw	s1,4(sp)
    3834:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3838:	01c00413          	li	s0,28
    383c:	0240006f          	j	3860 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    3840:	0084d733          	srl	a4,s1,s0
    3844:	00f77713          	andi	a4,a4,15
    3848:	000047b7          	lui	a5,0x4
    384c:	49478793          	addi	a5,a5,1172 # 4494 <_data+0x18>
    3850:	00e787b3          	add	a5,a5,a4
    3854:	0007c503          	lbu	a0,0(a5)
    3858:	f25ff0ef          	jal	377c <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    385c:	ffc40413          	addi	s0,s0,-4
    3860:	fe0450e3          	bgez	s0,3840 <bsp_printHex_lower+0x1c>
    }
    3864:	00c12083          	lw	ra,12(sp)
    3868:	00812403          	lw	s0,8(sp)
    386c:	00412483          	lw	s1,4(sp)
    3870:	01010113          	addi	sp,sp,16
    3874:	00008067          	ret

00003878 <bsp_printf_c>:
    {
    3878:	ff010113          	addi	sp,sp,-16
    387c:	00112623          	sw	ra,12(sp)
        _putchar(c);
    3880:	0ff57513          	zext.b	a0,a0
    3884:	ef9ff0ef          	jal	377c <_putchar>
    }
    3888:	00c12083          	lw	ra,12(sp)
    388c:	01010113          	addi	sp,sp,16
    3890:	00008067          	ret

00003894 <bsp_printf_s>:
    {
    3894:	ff010113          	addi	sp,sp,-16
    3898:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    389c:	f01ff0ef          	jal	379c <_putchar_s>
    }
    38a0:	00c12083          	lw	ra,12(sp)
    38a4:	01010113          	addi	sp,sp,16
    38a8:	00008067          	ret

000038ac <bsp_printf_d>:
    {
    38ac:	fd010113          	addi	sp,sp,-48
    38b0:	02112623          	sw	ra,44(sp)
    38b4:	02812423          	sw	s0,40(sp)
    38b8:	02912223          	sw	s1,36(sp)
    38bc:	00050493          	mv	s1,a0
        if (val < 0) {
    38c0:	00054663          	bltz	a0,38cc <bsp_printf_d+0x20>
    {
    38c4:	00010413          	mv	s0,sp
    38c8:	02c0006f          	j	38f4 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    38cc:	02d00513          	li	a0,45
    38d0:	fa9ff0ef          	jal	3878 <bsp_printf_c>
            val = -val;
    38d4:	409004b3          	neg	s1,s1
    38d8:	fedff06f          	j	38c4 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    38dc:	00a00713          	li	a4,10
    38e0:	02e4e7b3          	rem	a5,s1,a4
    38e4:	03078793          	addi	a5,a5,48
    38e8:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    38ec:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    38f0:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    38f4:	fe0494e3          	bnez	s1,38dc <bsp_printf_d+0x30>
    38f8:	00010793          	mv	a5,sp
    38fc:	fef400e3          	beq	s0,a5,38dc <bsp_printf_d+0x30>
        while (p != buffer)
    3900:	00010793          	mv	a5,sp
    3904:	00f40a63          	beq	s0,a5,3918 <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    3908:	fff40413          	addi	s0,s0,-1
    390c:	00044503          	lbu	a0,0(s0)
    3910:	f69ff0ef          	jal	3878 <bsp_printf_c>
    3914:	fedff06f          	j	3900 <bsp_printf_d+0x54>
    }
    3918:	02c12083          	lw	ra,44(sp)
    391c:	02812403          	lw	s0,40(sp)
    3920:	02412483          	lw	s1,36(sp)
    3924:	03010113          	addi	sp,sp,48
    3928:	00008067          	ret

0000392c <bsp_printf_x>:
    {
    392c:	ff010113          	addi	sp,sp,-16
    3930:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    3934:	00000713          	li	a4,0
    3938:	00700793          	li	a5,7
    393c:	02e7c063          	blt	a5,a4,395c <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3940:	00271693          	slli	a3,a4,0x2
    3944:	ff000793          	li	a5,-16
    3948:	00d797b3          	sll	a5,a5,a3
    394c:	00f577b3          	and	a5,a0,a5
    3950:	00078663          	beqz	a5,395c <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    3954:	00170713          	addi	a4,a4,1
    3958:	fe1ff06f          	j	3938 <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    395c:	ec9ff0ef          	jal	3824 <bsp_printHex_lower>
    }
    3960:	00c12083          	lw	ra,12(sp)
    3964:	01010113          	addi	sp,sp,16
    3968:	00008067          	ret

0000396c <bsp_printf_X>:
        {
    396c:	ff010113          	addi	sp,sp,-16
    3970:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    3974:	00000713          	li	a4,0
    3978:	00700793          	li	a5,7
    397c:	02e7c063          	blt	a5,a4,399c <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3980:	00271693          	slli	a3,a4,0x2
    3984:	ff000793          	li	a5,-16
    3988:	00d797b3          	sll	a5,a5,a3
    398c:	00f577b3          	and	a5,a0,a5
    3990:	00078663          	beqz	a5,399c <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    3994:	00170713          	addi	a4,a4,1
    3998:	fe1ff06f          	j	3978 <bsp_printf_X+0xc>
            bsp_printHex(val);
    399c:	e35ff0ef          	jal	37d0 <bsp_printHex>
        }
    39a0:	00c12083          	lw	ra,12(sp)
    39a4:	01010113          	addi	sp,sp,16
    39a8:	00008067          	ret

000039ac <mipi_i2c_probe>:
// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    39ac:	ff010113          	addi	sp,sp,-16
    39b0:	00112623          	sw	ra,12(sp)
    39b4:	00812423          	sw	s0,8(sp)
    39b8:	00912223          	sw	s1,4(sp)
    39bc:	00050413          	mv	s0,a0
    39c0:	00058493          	mv	s1,a1
    i2c_masterStartBlocking(i2cCtrl);
    39c4:	d11ff0ef          	jal	36d4 <i2c_masterStartBlocking>
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    39c8:	000017b7          	lui	a5,0x1
    39cc:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    39d0:	00f4e4b3          	or	s1,s1,a5
    39d4:	00942023          	sw	s1,0(s0)
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    39d8:	00040513          	mv	a0,s0
    39dc:	d25ff0ef          	jal	3700 <i2c_txNackBlocking>
    return i2c_rxAck(i2cCtrl);
    39e0:	00040513          	mv	a0,s0
    39e4:	d3dff0ef          	jal	3720 <i2c_rxAck>
}
    39e8:	00c12083          	lw	ra,12(sp)
    39ec:	00812403          	lw	s0,8(sp)
    39f0:	00412483          	lw	s1,4(sp)
    39f4:	01010113          	addi	sp,sp,16
    39f8:	00008067          	ret

000039fc <bsp_printf>:
    {
    39fc:	fc010113          	addi	sp,sp,-64
    3a00:	00112e23          	sw	ra,28(sp)
    3a04:	00812c23          	sw	s0,24(sp)
    3a08:	00912a23          	sw	s1,20(sp)
    3a0c:	00050493          	mv	s1,a0
    3a10:	02b12223          	sw	a1,36(sp)
    3a14:	02c12423          	sw	a2,40(sp)
    3a18:	02d12623          	sw	a3,44(sp)
    3a1c:	02e12823          	sw	a4,48(sp)
    3a20:	02f12a23          	sw	a5,52(sp)
    3a24:	03012c23          	sw	a6,56(sp)
    3a28:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    3a2c:	02410793          	addi	a5,sp,36
    3a30:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    3a34:	00000413          	li	s0,0
    3a38:	01c0006f          	j	3a54 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    3a3c:	00c12783          	lw	a5,12(sp)
    3a40:	00478713          	addi	a4,a5,4
    3a44:	00e12623          	sw	a4,12(sp)
    3a48:	0007a503          	lw	a0,0(a5)
    3a4c:	e2dff0ef          	jal	3878 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    3a50:	00140413          	addi	s0,s0,1
    3a54:	008487b3          	add	a5,s1,s0
    3a58:	0007c503          	lbu	a0,0(a5)
    3a5c:	0a050e63          	beqz	a0,3b18 <bsp_printf+0x11c>
            if (format[i] == '%') {
    3a60:	02500793          	li	a5,37
    3a64:	06f50e63          	beq	a0,a5,3ae0 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    3a68:	e11ff0ef          	jal	3878 <bsp_printf_c>
    3a6c:	fe5ff06f          	j	3a50 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    3a70:	00c12783          	lw	a5,12(sp)
    3a74:	00478713          	addi	a4,a5,4
    3a78:	00e12623          	sw	a4,12(sp)
    3a7c:	0007a503          	lw	a0,0(a5)
    3a80:	e15ff0ef          	jal	3894 <bsp_printf_s>
                        break;
    3a84:	fcdff06f          	j	3a50 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    3a88:	00c12783          	lw	a5,12(sp)
    3a8c:	00478713          	addi	a4,a5,4
    3a90:	00e12623          	sw	a4,12(sp)
    3a94:	0007a503          	lw	a0,0(a5)
    3a98:	e15ff0ef          	jal	38ac <bsp_printf_d>
                        break;
    3a9c:	fb5ff06f          	j	3a50 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    3aa0:	00c12783          	lw	a5,12(sp)
    3aa4:	00478713          	addi	a4,a5,4
    3aa8:	00e12623          	sw	a4,12(sp)
    3aac:	0007a503          	lw	a0,0(a5)
    3ab0:	ebdff0ef          	jal	396c <bsp_printf_X>
                        break;
    3ab4:	f9dff06f          	j	3a50 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    3ab8:	00c12783          	lw	a5,12(sp)
    3abc:	00478713          	addi	a4,a5,4
    3ac0:	00e12623          	sw	a4,12(sp)
    3ac4:	0007a503          	lw	a0,0(a5)
    3ac8:	e65ff0ef          	jal	392c <bsp_printf_x>
                        break;
    3acc:	f85ff06f          	j	3a50 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    3ad0:	00004537          	lui	a0,0x4
    3ad4:	4a850513          	addi	a0,a0,1192 # 44a8 <_data+0x2c>
    3ad8:	dbdff0ef          	jal	3894 <bsp_printf_s>
                        break;
    3adc:	f75ff06f          	j	3a50 <bsp_printf+0x54>
                while (format[++i]) {
    3ae0:	00140413          	addi	s0,s0,1
    3ae4:	008487b3          	add	a5,s1,s0
    3ae8:	0007c783          	lbu	a5,0(a5)
    3aec:	f60782e3          	beqz	a5,3a50 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    3af0:	fa878793          	addi	a5,a5,-88
    3af4:	0ff7f693          	zext.b	a3,a5
    3af8:	02000713          	li	a4,32
    3afc:	fed762e3          	bltu	a4,a3,3ae0 <bsp_printf+0xe4>
    3b00:	00269793          	slli	a5,a3,0x2
    3b04:	00005737          	lui	a4,0x5
    3b08:	02470713          	addi	a4,a4,36 # 5024 <_data+0xba8>
    3b0c:	00e787b3          	add	a5,a5,a4
    3b10:	0007a783          	lw	a5,0(a5)
    3b14:	00078067          	jr	a5
    }
    3b18:	01c12083          	lw	ra,28(sp)
    3b1c:	01812403          	lw	s0,24(sp)
    3b20:	01412483          	lw	s1,20(sp)
    3b24:	04010113          	addi	sp,sp,64
    3b28:	00008067          	ret

00003b2c <camera_init>:
// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    3b2c:	fe010113          	addi	sp,sp,-32
    3b30:	00112e23          	sw	ra,28(sp)
    3b34:	00812c23          	sw	s0,24(sp)
    3b38:	00912a23          	sw	s1,20(sp)
    3b3c:	01212823          	sw	s2,16(sp)
    3b40:	01312623          	sw	s3,12(sp)
    3b44:	00050913          	mv	s2,a0
    3b48:	00058493          	mv	s1,a1
    mipi_i2c_init(i2cCtrl);
    3b4c:	00058513          	mv	a0,a1
    3b50:	ab8fe0ef          	jal	1e08 <mipi_i2c_init>

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3b54:	00000413          	li	s0,0
    3b58:	00100793          	li	a5,1
    3b5c:	0a87e863          	bltu	a5,s0,3c0c <camera_init+0xe0>
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
    3b60:	000057b7          	lui	a5,0x5
    3b64:	00241713          	slli	a4,s0,0x2
    3b68:	00870733          	add	a4,a4,s0
    3b6c:	00271713          	slli	a4,a4,0x2
    3b70:	0a878793          	addi	a5,a5,168 # 50a8 <supportedCamera>
    3b74:	00e787b3          	add	a5,a5,a4
    3b78:	0007c983          	lbu	s3,0(a5)
    3b7c:	00098593          	mv	a1,s3
    3b80:	00048513          	mv	a0,s1
    3b84:	e29ff0ef          	jal	39ac <mipi_i2c_probe>
    3b88:	00100793          	li	a5,1
    3b8c:	00f50663          	beq	a0,a5,3b98 <camera_init+0x6c>
    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3b90:	00140413          	addi	s0,s0,1
    3b94:	fc5ff06f          	j	3b58 <camera_init+0x2c>
    3b98:	01412423          	sw	s4,8(sp)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
    3b9c:	00005a37          	lui	s4,0x5
    3ba0:	00241793          	slli	a5,s0,0x2
    3ba4:	008787b3          	add	a5,a5,s0
    3ba8:	00279793          	slli	a5,a5,0x2
    3bac:	0a8a0a13          	addi	s4,s4,168 # 50a8 <supportedCamera>
    3bb0:	00fa0a33          	add	s4,s4,a5
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
    3bb4:	0019d693          	srli	a3,s3,0x1
    3bb8:	008a2603          	lw	a2,8(s4)
    3bbc:	00090593          	mv	a1,s2
    3bc0:	00005537          	lui	a0,0x5
    3bc4:	de450513          	addi	a0,a0,-540 # 4de4 <_data+0x968>
    3bc8:	e35ff0ef          	jal	39fc <bsp_printf>
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
    3bcc:	00ca2783          	lw	a5,12(s4)
    3bd0:	00078663          	beqz	a5,3bdc <camera_init+0xb0>
                supportedCamera[i].init(i2cCtrl);
    3bd4:	00048513          	mv	a0,s1
    3bd8:	000780e7          	jalr	a5

            if (supportedCamera[i].start_stream != NULL)
    3bdc:	000057b7          	lui	a5,0x5
    3be0:	00241713          	slli	a4,s0,0x2
    3be4:	00870733          	add	a4,a4,s0
    3be8:	00271713          	slli	a4,a4,0x2
    3bec:	0a878793          	addi	a5,a5,168 # 50a8 <supportedCamera>
    3bf0:	00e787b3          	add	a5,a5,a4
    3bf4:	0107a783          	lw	a5,16(a5)
    3bf8:	04078063          	beqz	a5,3c38 <camera_init+0x10c>
                supportedCamera[i].start_stream(i2cCtrl);
    3bfc:	00048513          	mv	a0,s1
    3c00:	000780e7          	jalr	a5
            return;
    3c04:	00812a03          	lw	s4,8(sp)
    3c08:	0140006f          	j	3c1c <camera_init+0xf0>
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
    3c0c:	00090593          	mv	a1,s2
    3c10:	00005537          	lui	a0,0x5
    3c14:	e0c50513          	addi	a0,a0,-500 # 4e0c <_data+0x990>
    3c18:	de5ff0ef          	jal	39fc <bsp_printf>
}
    3c1c:	01c12083          	lw	ra,28(sp)
    3c20:	01812403          	lw	s0,24(sp)
    3c24:	01412483          	lw	s1,20(sp)
    3c28:	01012903          	lw	s2,16(sp)
    3c2c:	00c12983          	lw	s3,12(sp)
    3c30:	02010113          	addi	sp,sp,32
    3c34:	00008067          	ret
    3c38:	00812a03          	lw	s4,8(sp)
    3c3c:	fe1ff06f          	j	3c1c <camera_init+0xf0>

00003c40 <cam0_init>:

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
    3c40:	ff010113          	addi	sp,sp,-16
    3c44:	00112623          	sw	ra,12(sp)
    3c48:	00050593          	mv	a1,a0
    3c4c:	00000513          	li	a0,0
    3c50:	eddff0ef          	jal	3b2c <camera_init>
    3c54:	00c12083          	lw	ra,12(sp)
    3c58:	01010113          	addi	sp,sp,16
    3c5c:	00008067          	ret

00003c60 <uart_writeAvailability>:
        return *((volatile u32*) address);
    3c60:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3c64:	01055513          	srli	a0,a0,0x10
    }
    3c68:	0ff57513          	zext.b	a0,a0
    3c6c:	00008067          	ret

00003c70 <uart_write>:
    static void uart_write(u32 reg, char data){
    3c70:	ff010113          	addi	sp,sp,-16
    3c74:	00112623          	sw	ra,12(sp)
    3c78:	00812423          	sw	s0,8(sp)
    3c7c:	00912223          	sw	s1,4(sp)
    3c80:	00050413          	mv	s0,a0
    3c84:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    3c88:	00040513          	mv	a0,s0
    3c8c:	fd5ff0ef          	jal	3c60 <uart_writeAvailability>
    3c90:	fe050ce3          	beqz	a0,3c88 <uart_write+0x18>
        *((volatile u32*) address) = data;
    3c94:	00942023          	sw	s1,0(s0)
    }
    3c98:	00c12083          	lw	ra,12(sp)
    3c9c:	00812403          	lw	s0,8(sp)
    3ca0:	00412483          	lw	s1,4(sp)
    3ca4:	01010113          	addi	sp,sp,16
    3ca8:	00008067          	ret

00003cac <uart_writeStr>:
    static void uart_writeStr(u32 reg, const char* str){
    3cac:	ff010113          	addi	sp,sp,-16
    3cb0:	00112623          	sw	ra,12(sp)
    3cb4:	00812423          	sw	s0,8(sp)
    3cb8:	00912223          	sw	s1,4(sp)
    3cbc:	00050493          	mv	s1,a0
    3cc0:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    3cc4:	0100006f          	j	3cd4 <uart_writeStr+0x28>
    3cc8:	00140413          	addi	s0,s0,1
    3ccc:	00048513          	mv	a0,s1
    3cd0:	fa1ff0ef          	jal	3c70 <uart_write>
    3cd4:	00044583          	lbu	a1,0(s0)
    3cd8:	fe0598e3          	bnez	a1,3cc8 <uart_writeStr+0x1c>
    }
    3cdc:	00c12083          	lw	ra,12(sp)
    3ce0:	00812403          	lw	s0,8(sp)
    3ce4:	00412483          	lw	s1,4(sp)
    3ce8:	01010113          	addi	sp,sp,16
    3cec:	00008067          	ret

00003cf0 <i2c_masterBusy>:
        return *((volatile u32*) address);
    3cf0:	04052503          	lw	a0,64(a0)
    }
    3cf4:	00157513          	andi	a0,a0,1
    3cf8:	00008067          	ret

00003cfc <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3cfc:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3d00:	21000793          	li	a5,528
    3d04:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3d08:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3d0c:	0107f793          	andi	a5,a5,16
    3d10:	fe079ce3          	bnez	a5,3d08 <i2c_masterStartBlocking+0xc>
    }
    3d14:	00008067          	ret

00003d18 <i2c_masterStopWait>:
    static void i2c_masterStopWait(u32 reg){
    3d18:	ff010113          	addi	sp,sp,-16
    3d1c:	00112623          	sw	ra,12(sp)
    3d20:	00812423          	sw	s0,8(sp)
    3d24:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3d28:	00040513          	mv	a0,s0
    3d2c:	fc5ff0ef          	jal	3cf0 <i2c_masterBusy>
    3d30:	fe051ce3          	bnez	a0,3d28 <i2c_masterStopWait+0x10>
    }
    3d34:	00c12083          	lw	ra,12(sp)
    3d38:	00812403          	lw	s0,8(sp)
    3d3c:	01010113          	addi	sp,sp,16
    3d40:	00008067          	ret

00003d44 <i2c_masterStopBlocking>:
    static void i2c_masterStopBlocking(u32 reg){
    3d44:	ff010113          	addi	sp,sp,-16
    3d48:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3d4c:	42000713          	li	a4,1056
    3d50:	04e52023          	sw	a4,64(a0)
        i2c_masterStopWait(reg);
    3d54:	fc5ff0ef          	jal	3d18 <i2c_masterStopWait>
    }
    3d58:	00c12083          	lw	ra,12(sp)
    3d5c:	01010113          	addi	sp,sp,16
    3d60:	00008067          	ret

00003d64 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3d64:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3d68:	1007f793          	andi	a5,a5,256
    3d6c:	fe079ce3          	bnez	a5,3d64 <i2c_txAckWait>
    }
    3d70:	00008067          	ret

00003d74 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3d74:	ff010113          	addi	sp,sp,-16
    3d78:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3d7c:	30100713          	li	a4,769
    3d80:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3d84:	fe1ff0ef          	jal	3d64 <i2c_txAckWait>
    }
    3d88:	00c12083          	lw	ra,12(sp)
    3d8c:	01010113          	addi	sp,sp,16
    3d90:	00008067          	ret

00003d94 <i2c_rxAck>:
        return *((volatile u32*) address);
    3d94:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3d98:	0ff57513          	zext.b	a0,a0
    }
    3d9c:	00153513          	seqz	a0,a0
    3da0:	00008067          	ret

00003da4 <PiCamV3_WriteRegData>:
#include "riscv.h"
#include "PiCamV3Driver.h"
#include "common.h"

void PiCamV3_WriteRegData(u32 i2c_addr, u16 reg, u8 data)
{
    3da4:	fe010113          	addi	sp,sp,-32
    3da8:	00112e23          	sw	ra,28(sp)
    3dac:	00812c23          	sw	s0,24(sp)
    3db0:	00912a23          	sw	s1,20(sp)
    3db4:	01212823          	sw	s2,16(sp)
    3db8:	01312623          	sw	s3,12(sp)
    3dbc:	00050413          	mv	s0,a0
    3dc0:	00058493          	mv	s1,a1
    3dc4:	00060913          	mv	s2,a2
	u8 outdata;

	i2c_masterStartBlocking(i2c_addr);
    3dc8:	f35ff0ef          	jal	3cfc <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    3dcc:	000017b7          	lui	a5,0x1
    3dd0:	b3478793          	addi	a5,a5,-1228 # b34 <CUSTOM2+0xad9>
    3dd4:	00f42023          	sw	a5,0(s0)

	i2c_txByte(i2c_addr, IMX708_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3dd8:	00040513          	mv	a0,s0
    3ddc:	f99ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3de0:	00040513          	mv	a0,s0
    3de4:	fb1ff0ef          	jal	3d94 <i2c_rxAck>
    3de8:	fd1fd0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg >> 8) & 0xFF);
    3dec:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3df0:	000019b7          	lui	s3,0x1
    3df4:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3df8:	0137e7b3          	or	a5,a5,s3
    3dfc:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3e00:	00040513          	mv	a0,s0
    3e04:	f71ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e08:	00040513          	mv	a0,s0
    3e0c:	f89ff0ef          	jal	3d94 <i2c_rxAck>
    3e10:	fa9fd0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg) & 0xFF);
    3e14:	0ff4f493          	zext.b	s1,s1
    3e18:	0134e4b3          	or	s1,s1,s3
    3e1c:	00942023          	sw	s1,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3e20:	00040513          	mv	a0,s0
    3e24:	f51ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e28:	00040513          	mv	a0,s0
    3e2c:	f69ff0ef          	jal	3d94 <i2c_rxAck>
    3e30:	f89fd0ef          	jal	1db8 <assert>
    3e34:	01396933          	or	s2,s2,s3
    3e38:	01242023          	sw	s2,0(s0)

	i2c_txByte(i2c_addr, data & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3e3c:	00040513          	mv	a0,s0
    3e40:	f35ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e44:	00040513          	mv	a0,s0
    3e48:	f4dff0ef          	jal	3d94 <i2c_rxAck>
    3e4c:	f6dfd0ef          	jal	1db8 <assert>

	i2c_masterStopBlocking(i2c_addr);
    3e50:	00040513          	mv	a0,s0
    3e54:	ef1ff0ef          	jal	3d44 <i2c_masterStopBlocking>
}
    3e58:	01c12083          	lw	ra,28(sp)
    3e5c:	01812403          	lw	s0,24(sp)
    3e60:	01412483          	lw	s1,20(sp)
    3e64:	01012903          	lw	s2,16(sp)
    3e68:	00c12983          	lw	s3,12(sp)
    3e6c:	02010113          	addi	sp,sp,32
    3e70:	00008067          	ret

00003e74 <PiCamV3_StartStreaming>:

	return outdata;
}

void PiCamV3_StartStreaming(u32 i2c_addr)
{
    3e74:	ff010113          	addi	sp,sp,-16
    3e78:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_ACTIVE);
    3e7c:	00100613          	li	a2,1
    3e80:	10000593          	li	a1,256
    3e84:	f21ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
}
    3e88:	00c12083          	lw	ra,12(sp)
    3e8c:	01010113          	addi	sp,sp,16
    3e90:	00008067          	ret

00003e94 <PiCamV3_StopStreaming>:

void PiCamV3_StopStreaming(u32 i2c_addr)
{
    3e94:	ff010113          	addi	sp,sp,-16
    3e98:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_SLEEP);
    3e9c:	00000613          	li	a2,0
    3ea0:	10000593          	li	a1,256
    3ea4:	f01ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
}
    3ea8:	00c12083          	lw	ra,12(sp)
    3eac:	01010113          	addi	sp,sp,16
    3eb0:	00008067          	ret

00003eb4 <PiCamV3_ConfigCommon>:

void PiCamV3_ConfigCommon(u32 i2c_addr)
{
    3eb4:	ff010113          	addi	sp,sp,-16
    3eb8:	00112623          	sw	ra,12(sp)
    3ebc:	00812423          	sw	s0,8(sp)
    3ec0:	00912223          	sw	s1,4(sp)
    3ec4:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3ec8:	00000413          	li	s0,0
    3ecc:	0280006f          	j	3ef4 <PiCamV3_ConfigCommon+0x40>
	{
		PiCamV3_WriteRegData(i2c_addr, mode_common_regs[i].address, mode_common_regs[i].val);
    3ed0:	000057b7          	lui	a5,0x5
    3ed4:	00241713          	slli	a4,s0,0x2
    3ed8:	53878793          	addi	a5,a5,1336 # 5538 <mode_common_regs>
    3edc:	00e787b3          	add	a5,a5,a4
    3ee0:	0027c603          	lbu	a2,2(a5)
    3ee4:	0007d583          	lhu	a1,0(a5)
    3ee8:	00048513          	mv	a0,s1
    3eec:	eb9ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3ef0:	00140413          	addi	s0,s0,1
    3ef4:	02f00793          	li	a5,47
    3ef8:	fc87fce3          	bgeu	a5,s0,3ed0 <PiCamV3_ConfigCommon+0x1c>
	}
}
    3efc:	00c12083          	lw	ra,12(sp)
    3f00:	00812403          	lw	s0,8(sp)
    3f04:	00412483          	lw	s1,4(sp)
    3f08:	01010113          	addi	sp,sp,16
    3f0c:	00008067          	ret

00003f10 <PiCamV3_ConfigFormat>:

void PiCamV3_ConfigFormat(u32 i2c_addr, u8 mode)
{
    3f10:	ff010113          	addi	sp,sp,-16
    3f14:	00112623          	sw	ra,12(sp)
    3f18:	00912223          	sw	s1,4(sp)
    3f1c:	00050493          	mv	s1,a0
	// 	MODE
	//  0 : 1920 x 1080 cropped, 50FPS
	//	1 : 1920 x 1080 2x2 binned, 60 FPS
	//  2 : 1920 x 1080 HDR, 50 FPS

	if (mode == 0)
    3f20:	08058663          	beqz	a1,3fac <PiCamV3_ConfigFormat+0x9c>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
		}
	}

	else if (mode == 1)
    3f24:	00100793          	li	a5,1
    3f28:	0cf58263          	beq	a1,a5,3fec <PiCamV3_ConfigFormat+0xdc>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
		}
	}

	else if (mode == 2)
    3f2c:	00200793          	li	a5,2
    3f30:	06f59663          	bne	a1,a5,3f9c <PiCamV3_ConfigFormat+0x8c>
    3f34:	00812423          	sw	s0,8(sp)
	{
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3f38:	00000413          	li	s0,0
    3f3c:	05e00793          	li	a5,94
    3f40:	0a87ec63          	bltu	a5,s0,3ff8 <PiCamV3_ConfigFormat+0xe8>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_hdr_1920x1080_regs[i].address, mode_hdr_1920x1080_regs[i].val);
    3f44:	000057b7          	lui	a5,0x5
    3f48:	00241713          	slli	a4,s0,0x2
    3f4c:	0e478793          	addi	a5,a5,228 # 50e4 <mode_hdr_1920x1080_regs>
    3f50:	00e787b3          	add	a5,a5,a4
    3f54:	0027c603          	lbu	a2,2(a5)
    3f58:	0007d583          	lhu	a1,0(a5)
    3f5c:	00048513          	mv	a0,s1
    3f60:	e45ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3f64:	00140413          	addi	s0,s0,1
    3f68:	fd5ff06f          	j	3f3c <PiCamV3_ConfigFormat+0x2c>
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
    3f6c:	000057b7          	lui	a5,0x5
    3f70:	00241713          	slli	a4,s0,0x2
    3f74:	3cc78793          	addi	a5,a5,972 # 53cc <mode_1920x1080_cropped_regs>
    3f78:	00e787b3          	add	a5,a5,a4
    3f7c:	0027c603          	lbu	a2,2(a5)
    3f80:	0007d583          	lhu	a1,0(a5)
    3f84:	00048513          	mv	a0,s1
    3f88:	e1dff0ef          	jal	3da4 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3f8c:	00140413          	addi	s0,s0,1
    3f90:	05a00793          	li	a5,90
    3f94:	fc87fce3          	bgeu	a5,s0,3f6c <PiCamV3_ConfigFormat+0x5c>
    3f98:	00812403          	lw	s0,8(sp)
		}
	}
}
    3f9c:	00c12083          	lw	ra,12(sp)
    3fa0:	00412483          	lw	s1,4(sp)
    3fa4:	01010113          	addi	sp,sp,16
    3fa8:	00008067          	ret
    3fac:	00812423          	sw	s0,8(sp)
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3fb0:	00000413          	li	s0,0
    3fb4:	fddff06f          	j	3f90 <PiCamV3_ConfigFormat+0x80>
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
    3fb8:	000057b7          	lui	a5,0x5
    3fbc:	00241713          	slli	a4,s0,0x2
    3fc0:	26078793          	addi	a5,a5,608 # 5260 <mode_2x2binned_1920x1080_regs>
    3fc4:	00e787b3          	add	a5,a5,a4
    3fc8:	0027c603          	lbu	a2,2(a5)
    3fcc:	0007d583          	lhu	a1,0(a5)
    3fd0:	00048513          	mv	a0,s1
    3fd4:	dd1ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_2x2binned_1920x1080_regs) / sizeof(mode_2x2binned_1920x1080_regs[0]); i++)
    3fd8:	00140413          	addi	s0,s0,1
    3fdc:	05a00793          	li	a5,90
    3fe0:	fc87fce3          	bgeu	a5,s0,3fb8 <PiCamV3_ConfigFormat+0xa8>
    3fe4:	00812403          	lw	s0,8(sp)
    3fe8:	fb5ff06f          	j	3f9c <PiCamV3_ConfigFormat+0x8c>
    3fec:	00812423          	sw	s0,8(sp)
    3ff0:	00000413          	li	s0,0
    3ff4:	fe9ff06f          	j	3fdc <PiCamV3_ConfigFormat+0xcc>
    3ff8:	00812403          	lw	s0,8(sp)
    3ffc:	fa1ff06f          	j	3f9c <PiCamV3_ConfigFormat+0x8c>

00004000 <PiCamV3_ConfigLinkFreq>:

void PiCamV3_ConfigLinkFreq(u32 i2c_addr)
{
    4000:	ff010113          	addi	sp,sp,-16
    4004:	00112623          	sw	ra,12(sp)
    4008:	00812423          	sw	s0,8(sp)
    400c:	00912223          	sw	s1,4(sp)
    4010:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    4014:	00000413          	li	s0,0
    4018:	0240006f          	j	403c <PiCamV3_ConfigLinkFreq+0x3c>
	{
		PiCamV3_WriteRegData(i2c_addr, link_450Mhz_regs[i].address, link_450Mhz_regs[i].val);
    401c:	00241713          	slli	a4,s0,0x2
    4020:	81818793          	addi	a5,gp,-2024 # 5848 <link_450Mhz_regs>
    4024:	00e787b3          	add	a5,a5,a4
    4028:	0027c603          	lbu	a2,2(a5)
    402c:	0007d583          	lhu	a1,0(a5)
    4030:	00048513          	mv	a0,s1
    4034:	d71ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    4038:	00140413          	addi	s0,s0,1
    403c:	00100793          	li	a5,1
    4040:	fc87fee3          	bgeu	a5,s0,401c <PiCamV3_ConfigLinkFreq+0x1c>
	}
}
    4044:	00c12083          	lw	ra,12(sp)
    4048:	00812403          	lw	s0,8(sp)
    404c:	00412483          	lw	s1,4(sp)
    4050:	01010113          	addi	sp,sp,16
    4054:	00008067          	ret

00004058 <PiCamV3_ConfigQuadBayerRemosaicAdjustment>:

void PiCamV3_ConfigQuadBayerRemosaicAdjustment(u32 i2c_addr)
{
    4058:	ff010113          	addi	sp,sp,-16
    405c:	00112623          	sw	ra,12(sp)
    4060:	00812423          	sw	s0,8(sp)
    4064:	00050413          	mv	s0,a0
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED);
    4068:	00000613          	li	a2,0
    406c:	0000c5b7          	lui	a1,0xc
    4070:	42858593          	addi	a1,a1,1064 # c428 <__freertos_irq_stack_top+0x5a38>
    4074:	d31ff0ef          	jal	3da4 <PiCamV3_WriteRegData>
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY, 0x04);
    4078:	00400613          	li	a2,4
    407c:	0000c5b7          	lui	a1,0xc
    4080:	42958593          	addi	a1,a1,1065 # c429 <__freertos_irq_stack_top+0x5a39>
    4084:	00040513          	mv	a0,s0
    4088:	d1dff0ef          	jal	3da4 <PiCamV3_WriteRegData>
}
    408c:	00c12083          	lw	ra,12(sp)
    4090:	00812403          	lw	s0,8(sp)
    4094:	01010113          	addi	sp,sp,16
    4098:	00008067          	ret

0000409c <PiCamV3_SetPdafGain>:

void PiCamV3_SetPdafGain(u32 i2c_addr)
{
    409c:	fe010113          	addi	sp,sp,-32
    40a0:	00112e23          	sw	ra,28(sp)
    40a4:	00812c23          	sw	s0,24(sp)
    40a8:	00912a23          	sw	s1,20(sp)
    40ac:	01212823          	sw	s2,16(sp)
    40b0:	01312623          	sw	s3,12(sp)
    40b4:	00050993          	mv	s3,a0
	for (int i = 0; i < 54; i++)
    40b8:	00000493          	li	s1,0
    40bc:	0640006f          	j	4120 <PiCamV3_SetPdafGain+0x84>
	{
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_L + i, pdaf_gains[0][i % 9]);
    40c0:	01049913          	slli	s2,s1,0x10
    40c4:	01095913          	srli	s2,s2,0x10
    40c8:	00900793          	li	a5,9
    40cc:	02f4e7b3          	rem	a5,s1,a5
    40d0:	00005437          	lui	s0,0x5
    40d4:	0d040413          	addi	s0,s0,208 # 50d0 <pdaf_gains>
    40d8:	00f40433          	add	s0,s0,a5
    40dc:	000085b7          	lui	a1,0x8
    40e0:	b1058593          	addi	a1,a1,-1264 # 7b10 <__freertos_irq_stack_top+0x1120>
    40e4:	00b905b3          	add	a1,s2,a1
    40e8:	00044603          	lbu	a2,0(s0)
    40ec:	01059593          	slli	a1,a1,0x10
    40f0:	0105d593          	srli	a1,a1,0x10
    40f4:	00098513          	mv	a0,s3
    40f8:	cadff0ef          	jal	3da4 <PiCamV3_WriteRegData>
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_R + i, pdaf_gains[1][i % 9]);
    40fc:	000087b7          	lui	a5,0x8
    4100:	c0078793          	addi	a5,a5,-1024 # 7c00 <__freertos_irq_stack_top+0x1210>
    4104:	00f905b3          	add	a1,s2,a5
    4108:	00944603          	lbu	a2,9(s0)
    410c:	01059593          	slli	a1,a1,0x10
    4110:	0105d593          	srli	a1,a1,0x10
    4114:	00098513          	mv	a0,s3
    4118:	c8dff0ef          	jal	3da4 <PiCamV3_WriteRegData>
	for (int i = 0; i < 54; i++)
    411c:	00148493          	addi	s1,s1,1
    4120:	03500793          	li	a5,53
    4124:	f897dee3          	bge	a5,s1,40c0 <PiCamV3_SetPdafGain+0x24>
	}
}
    4128:	01c12083          	lw	ra,28(sp)
    412c:	01812403          	lw	s0,24(sp)
    4130:	01412483          	lw	s1,20(sp)
    4134:	01012903          	lw	s2,16(sp)
    4138:	00c12983          	lw	s3,12(sp)
    413c:	02010113          	addi	sp,sp,32
    4140:	00008067          	ret

00004144 <PiCamV3_OnActuator>:
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN, (val & 0xFF00) >> 8);
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN + 1, val & 0xFF);
}

void PiCamV3_OnActuator(u32 i2c_addr)
{
    4144:	ff010113          	addi	sp,sp,-16
    4148:	00112623          	sw	ra,12(sp)
    414c:	00812423          	sw	s0,8(sp)
    4150:	00050413          	mv	s0,a0
	// Turn on actuator
	i2c_masterStartBlocking(i2c_addr);
    4154:	ba9ff0ef          	jal	3cfc <i2c_masterStartBlocking>
    4158:	000017b7          	lui	a5,0x1
    415c:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    4160:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4164:	00040513          	mv	a0,s0
    4168:	c0dff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    416c:	00040513          	mv	a0,s0
    4170:	c25ff0ef          	jal	3d94 <i2c_rxAck>
    4174:	c45fd0ef          	jal	1db8 <assert>
    4178:	000017b7          	lui	a5,0x1
    417c:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4180:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4184:	00040513          	mv	a0,s0
    4188:	bedff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    418c:	00040513          	mv	a0,s0
    4190:	c05ff0ef          	jal	3d94 <i2c_rxAck>
    4194:	c25fd0ef          	jal	1db8 <assert>
    4198:	000017b7          	lui	a5,0x1
    419c:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    41a0:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_ACTIVE);
	i2c_txNackBlocking(i2c_addr);
    41a4:	00040513          	mv	a0,s0
    41a8:	bcdff0ef          	jal	3d74 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    41ac:	00040513          	mv	a0,s0
    41b0:	b95ff0ef          	jal	3d44 <i2c_masterStopBlocking>
}
    41b4:	00c12083          	lw	ra,12(sp)
    41b8:	00812403          	lw	s0,8(sp)
    41bc:	01010113          	addi	sp,sp,16
    41c0:	00008067          	ret

000041c4 <PiCamV3_OffActuator>:

void PiCamV3_OffActuator(u32 i2c_addr)
{
    41c4:	ff010113          	addi	sp,sp,-16
    41c8:	00112623          	sw	ra,12(sp)
    41cc:	00812423          	sw	s0,8(sp)
    41d0:	00050413          	mv	s0,a0
	// Turn off actuator
	i2c_masterStartBlocking(i2c_addr);
    41d4:	b29ff0ef          	jal	3cfc <i2c_masterStartBlocking>
    41d8:	000017b7          	lui	a5,0x1
    41dc:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    41e0:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    41e4:	00040513          	mv	a0,s0
    41e8:	b8dff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    41ec:	00040513          	mv	a0,s0
    41f0:	ba5ff0ef          	jal	3d94 <i2c_rxAck>
    41f4:	bc5fd0ef          	jal	1db8 <assert>
    41f8:	000017b7          	lui	a5,0x1
    41fc:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4200:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4204:	00040513          	mv	a0,s0
    4208:	b6dff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    420c:	00040513          	mv	a0,s0
    4210:	b85ff0ef          	jal	3d94 <i2c_rxAck>
    4214:	ba5fd0ef          	jal	1db8 <assert>
    4218:	000017b7          	lui	a5,0x1
    421c:	b0178793          	addi	a5,a5,-1279 # b01 <CUSTOM2+0xaa6>
    4220:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_SLEEP);
	i2c_txNackBlocking(i2c_addr);
    4224:	00040513          	mv	a0,s0
    4228:	b4dff0ef          	jal	3d74 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    422c:	00040513          	mv	a0,s0
    4230:	b15ff0ef          	jal	3d44 <i2c_masterStopBlocking>
}
    4234:	00c12083          	lw	ra,12(sp)
    4238:	00812403          	lw	s0,8(sp)
    423c:	01010113          	addi	sp,sp,16
    4240:	00008067          	ret

00004244 <PiCamV3_SetFocusStep>:

void PiCamV3_SetFocusStep(u32 i2c_addr, u32 focus_step)
{
    4244:	fe010113          	addi	sp,sp,-32
    4248:	00112e23          	sw	ra,28(sp)
    424c:	00812c23          	sw	s0,24(sp)
    4250:	00912a23          	sw	s1,20(sp)
    4254:	01212823          	sw	s2,16(sp)
    4258:	01312623          	sw	s3,12(sp)
    425c:	00050413          	mv	s0,a0
    4260:	00058493          	mv	s1,a1
	if (focus_step >= DW9807_MAX_FOCUS_POS)
    4264:	3fe00793          	li	a5,1022
    4268:	00b7f463          	bgeu	a5,a1,4270 <PiCamV3_SetFocusStep+0x2c>
		focus_step = DW9807_MAX_FOCUS_POS;
    426c:	3ff00493          	li	s1,1023
	else if (focus_step <= 0)
		focus_step = 0;

	i2c_masterStartBlocking(i2c_addr);
    4270:	00040513          	mv	a0,s0
    4274:	a89ff0ef          	jal	3cfc <i2c_masterStartBlocking>
    4278:	000019b7          	lui	s3,0x1
    427c:	b1898993          	addi	s3,s3,-1256 # b18 <CUSTOM2+0xabd>
    4280:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4284:	00040513          	mv	a0,s0
    4288:	aedff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    428c:	00040513          	mv	a0,s0
    4290:	b05ff0ef          	jal	3d94 <i2c_rxAck>
    4294:	b25fd0ef          	jal	1db8 <assert>
    4298:	000017b7          	lui	a5,0x1
    429c:	b0378793          	addi	a5,a5,-1277 # b03 <CUSTOM2+0xaa8>
    42a0:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_MSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    42a4:	00040513          	mv	a0,s0
    42a8:	acdff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    42ac:	00040513          	mv	a0,s0
    42b0:	ae5ff0ef          	jal	3d94 <i2c_rxAck>
    42b4:	b05fd0ef          	jal	1db8 <assert>
	i2c_txByte(i2c_addr, (focus_step >> 8) & 0x03);
    42b8:	0084d793          	srli	a5,s1,0x8
    42bc:	0037f793          	andi	a5,a5,3
    42c0:	00001937          	lui	s2,0x1
    42c4:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
    42c8:	0127e7b3          	or	a5,a5,s2
    42cc:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    42d0:	00040513          	mv	a0,s0
    42d4:	aa1ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    42d8:	00040513          	mv	a0,s0
    42dc:	ab9ff0ef          	jal	3d94 <i2c_rxAck>
    42e0:	ad9fd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    42e4:	00040513          	mv	a0,s0
    42e8:	a5dff0ef          	jal	3d44 <i2c_masterStopBlocking>

	i2c_masterStartBlocking(i2c_addr);
    42ec:	00040513          	mv	a0,s0
    42f0:	a0dff0ef          	jal	3cfc <i2c_masterStartBlocking>
    42f4:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    42f8:	00040513          	mv	a0,s0
    42fc:	a79ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4300:	00040513          	mv	a0,s0
    4304:	a91ff0ef          	jal	3d94 <i2c_rxAck>
    4308:	ab1fd0ef          	jal	1db8 <assert>
    430c:	000017b7          	lui	a5,0x1
    4310:	b0478793          	addi	a5,a5,-1276 # b04 <CUSTOM2+0xaa9>
    4314:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_LSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4318:	00040513          	mv	a0,s0
    431c:	a59ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4320:	00040513          	mv	a0,s0
    4324:	a71ff0ef          	jal	3d94 <i2c_rxAck>
    4328:	a91fd0ef          	jal	1db8 <assert>
    432c:	0ff4f493          	zext.b	s1,s1
    4330:	0124e4b3          	or	s1,s1,s2
    4334:	00942023          	sw	s1,0(s0)
	i2c_txByte(i2c_addr, focus_step & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    4338:	00040513          	mv	a0,s0
    433c:	a39ff0ef          	jal	3d74 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4340:	00040513          	mv	a0,s0
    4344:	a51ff0ef          	jal	3d94 <i2c_rxAck>
    4348:	a71fd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    434c:	00040513          	mv	a0,s0
    4350:	9f5ff0ef          	jal	3d44 <i2c_masterStopBlocking>
}
    4354:	01c12083          	lw	ra,28(sp)
    4358:	01812403          	lw	s0,24(sp)
    435c:	01412483          	lw	s1,20(sp)
    4360:	01012903          	lw	s2,16(sp)
    4364:	00c12983          	lw	s3,12(sp)
    4368:	02010113          	addi	sp,sp,32
    436c:	00008067          	ret

00004370 <PiCamV3_Init>:
	PiCamV3_WriteRegData(IMX708_REG_TEST_PATTERN, IMX708_TEST_PATTERN_SOLID_COLOR);
}
*/

void PiCamV3_Init(u32 i2c_addr)
{
    4370:	ff010113          	addi	sp,sp,-16
    4374:	00112623          	sw	ra,12(sp)
    4378:	00812423          	sw	s0,8(sp)
    437c:	00050413          	mv	s0,a0

	PiCamV3_StopStreaming(i2c_addr);
    4380:	b15ff0ef          	jal	3e94 <PiCamV3_StopStreaming>

	PiCamV3_ConfigCommon(i2c_addr);
    4384:	00040513          	mv	a0,s0
    4388:	b2dff0ef          	jal	3eb4 <PiCamV3_ConfigCommon>

	PiCamV3_SetPdafGain(i2c_addr);
    438c:	00040513          	mv	a0,s0
    4390:	d0dff0ef          	jal	409c <PiCamV3_SetPdafGain>

	PiCamV3_ConfigFormat(i2c_addr, 1);
    4394:	00100593          	li	a1,1
    4398:	00040513          	mv	a0,s0
    439c:	b75ff0ef          	jal	3f10 <PiCamV3_ConfigFormat>

	PiCamV3_ConfigLinkFreq(i2c_addr);
    43a0:	00040513          	mv	a0,s0
    43a4:	c5dff0ef          	jal	4000 <PiCamV3_ConfigLinkFreq>

	PiCamV3_ConfigQuadBayerRemosaicAdjustment(i2c_addr);
    43a8:	00040513          	mv	a0,s0
    43ac:	cadff0ef          	jal	4058 <PiCamV3_ConfigQuadBayerRemosaicAdjustment>

	PiCamV3_OnActuator(i2c_addr);
    43b0:	00040513          	mv	a0,s0
    43b4:	d91ff0ef          	jal	4144 <PiCamV3_OnActuator>

	PiCamV3_SetFocusStep(i2c_addr, 700);
    43b8:	2bc00593          	li	a1,700
    43bc:	00040513          	mv	a0,s0
    43c0:	e85ff0ef          	jal	4244 <PiCamV3_SetFocusStep>

	PiCamV3_OffActuator(i2c_addr);
    43c4:	00040513          	mv	a0,s0
    43c8:	dfdff0ef          	jal	41c4 <PiCamV3_OffActuator>

	//	PiCamV3_StartStreaming();

	uart_writeStr(BSP_UART_TERMINAL, "\n\rDone Camera Init");
    43cc:	000055b7          	lui	a1,0x5
    43d0:	e4c58593          	addi	a1,a1,-436 # 4e4c <_data+0x9d0>
    43d4:	f8010537          	lui	a0,0xf8010
    43d8:	8d5ff0ef          	jal	3cac <uart_writeStr>
}
    43dc:	00c12083          	lw	ra,12(sp)
    43e0:	00812403          	lw	s0,8(sp)
    43e4:	01010113          	addi	sp,sp,16
    43e8:	00008067          	ret

000043ec <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
    43ec:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
    43f0:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    43f4:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    43f8:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    43fc:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    4400:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    4404:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    4408:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    440c:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    4410:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    4414:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    4418:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    441c:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    4420:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    4424:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    4428:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    442c:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
    4430:	85dfd0ef          	jal	1c8c <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
    4434:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    4438:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    443c:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    4440:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    4444:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    4448:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    444c:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    4450:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    4454:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    4458:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    445c:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    4460:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    4464:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    4468:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    446c:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    4470:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
    4474:	04010113          	addi	sp,sp,64
#endif
    4478:	30200073          	mret
