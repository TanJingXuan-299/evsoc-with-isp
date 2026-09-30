
build/evsoc_ispExample_demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00001000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
    1000:	00005197          	auipc	gp,0x5
    1004:	01018193          	addi	gp,gp,16 # 6010 <__global_pointer$>

00001008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
    1008:	00006117          	auipc	sp,0x6
    100c:	9c810113          	addi	sp,sp,-1592 # 69d0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
    1010:	00003517          	auipc	a0,0x3
    1014:	47050513          	addi	a0,a0,1136 # 4480 <_data>
	la a1, _data
    1018:	00003597          	auipc	a1,0x3
    101c:	46858593          	addi	a1,a1,1128 # 4480 <_data>
	la a2, _edata
    1020:	00005617          	auipc	a2,0x5
    1024:	81c60613          	addi	a2,a2,-2020 # 583c <uart_cmd_ready>
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
    1044:	7fc50513          	addi	a0,a0,2044 # 583c <uart_cmd_ready>
	la a1, _end
    1048:	00005597          	auipc	a1,0x5
    104c:	98858593          	addi	a1,a1,-1656 # 59d0 <_end>
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
    109c:	54588893          	addi	a7,a7,1349 # 55dd <_ctype_+0x1>
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
    10dc:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff962f>
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
    1178:	fff38393          	addi	t2,t2,-1 # 7fffffff <__freertos_irq_stack_top+0x7fff962f>
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
    126c:	8101a503          	lw	a0,-2032(gp) # 5820 <_impure_ptr>
    1270:	e0dff06f          	j	107c <_strtol_l.isra.0>

00001274 <__errno>:
    1274:	8101a503          	lw	a0,-2032(gp) # 5820 <_impure_ptr>
    1278:	00008067          	ret

0000127c <__libc_init_array>:
    127c:	ff010113          	addi	sp,sp,-16
    1280:	00812423          	sw	s0,8(sp)
    1284:	01212023          	sw	s2,0(sp)
    1288:	00003797          	auipc	a5,0x3
    128c:	1f878793          	addi	a5,a5,504 # 4480 <_data>
    1290:	00003417          	auipc	s0,0x3
    1294:	1f040413          	addi	s0,s0,496 # 4480 <_data>
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
    12c8:	1bc78793          	addi	a5,a5,444 # 4480 <_data>
    12cc:	00003417          	auipc	s0,0x3
    12d0:	1b440413          	addi	s0,s0,436 # 4480 <_data>
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
    1320:	d1450513          	addi	a0,a0,-748 # 4d14 <_data+0x894>
    1324:	150010ef          	jal	2474 <bsp_printf>

    cam0_init(I2C_CTRL_CAM0);
    bsp_printf("\n\rDone !!\n\r");

#elif defined(BOARD_Ti60F225)
    bsp_printf("Init Camera.....");
    1328:	00005537          	lui	a0,0x5
    132c:	d3850513          	addi	a0,a0,-712 # 4d38 <_data+0x8b8>
    1330:	144010ef          	jal	2474 <bsp_printf>
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
    1334:	f8100437          	lui	s0,0xf8100
    1338:	00042223          	sw	zero,4(s0) # f8100004 <__freertos_irq_stack_top+0xf80f9634>

    // Assert camera reset
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000000);
    bsp_uDelay(100);
    133c:	f8b00637          	lui	a2,0xf8b00
    1340:	05f5e5b7          	lui	a1,0x5f5e
    1344:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    1348:	06400513          	li	a0,100
    134c:	3d5000ef          	jal	1f20 <clint_uDelay>
    1350:	00200793          	li	a5,2
    1354:	00f42223          	sw	a5,4(s0)
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000002);
    bsp_uDelay(1000 * 10);
    1358:	f8b00637          	lui	a2,0xf8b00
    135c:	05f5e5b7          	lui	a1,0x5f5e
    1360:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    1364:	00002537          	lui	a0,0x2
    1368:	71050513          	addi	a0,a0,1808 # 2710 <Read_Latency+0x16c>
    136c:	3b5000ef          	jal	1f20 <clint_uDelay>

    cam0_init(I2C_CTRL_CAM0);
    1370:	f8015537          	lui	a0,0xf8015
    1374:	0d1020ef          	jal	3c44 <cam0_init>
    1378:	00300793          	li	a5,3
    137c:	00f42223          	sw	a5,4(s0)

    // Indicate camera configuration done
    EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG1_OFFSET, 0x00000003);
    bsp_printf("Done\n\r");
    1380:	00005537          	lui	a0,0x5
    1384:	d4c50513          	addi	a0,a0,-692 # 4d4c <_data+0x8cc>
    1388:	0ec010ef          	jal	2474 <bsp_printf>

#endif

    /******************************************************SETUP DMA & UART********************************************************/

    bsp_printf("Init DMA.....");
    138c:	00005537          	lui	a0,0x5
    1390:	d5450513          	addi	a0,a0,-684 # 4d54 <_data+0x8d4>
    1394:	0e0010ef          	jal	2474 <bsp_printf>

    uart_interrupt_init();
    1398:	568010ef          	jal	2900 <uart_interrupt_init>
    dma_init();
    139c:	07d000ef          	jal	1c18 <dma_init>

    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, 0, 0);
    13a0:	00000693          	li	a3,0
    13a4:	00000613          	li	a2,0
    13a8:	00400593          	li	a1,4
    13ac:	f8110537          	lui	a0,0xf8110
    13b0:	0ac010ef          	jal	245c <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, 0, 0);
    13b4:	00000693          	li	a3,0
    13b8:	00000613          	li	a2,0
    13bc:	00300593          	li	a1,3
    13c0:	f8110537          	lui	a0,0xf8110
    13c4:	098010ef          	jal	245c <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, 0, 0);
    13c8:	00000693          	li	a3,0
    13cc:	00000613          	li	a2,0
    13d0:	00200593          	li	a1,2
    13d4:	f8110537          	lui	a0,0xf8110
    13d8:	084010ef          	jal	245c <dmasg_priority>
    dmasg_priority(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, 0, 0);
    13dc:	00000693          	li	a3,0
    13e0:	00000613          	li	a2,0
    13e4:	00000593          	li	a1,0
    13e8:	f8110537          	lui	a0,0xf8110
    13ec:	070010ef          	jal	245c <dmasg_priority>

    bsp_printf("Done !!\n\n\r");
    13f0:	00005537          	lui	a0,0x5
    13f4:	d6450513          	addi	a0,a0,-668 # 4d64 <_data+0x8e4>
    13f8:	07c010ef          	jal	2474 <bsp_printf>

    /*******************************************************Trigger Display********************************************************/

    select_demo_mode = 0; // Default
    13fc:	8201aa23          	sw	zero,-1996(gp) # 5844 <select_demo_mode>

    // To check display functionality
    bsp_printf("Initialize test display content..\n\r");
    1400:	00005537          	lui	a0,0x5
    1404:	d7050513          	addi	a0,a0,-656 # 4d70 <_data+0x8f0>
    1408:	06c010ef          	jal	2474 <bsp_printf>

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
    1470:	f0068693          	addi	a3,a3,-256 # ff00 <__freertos_irq_stack_top+0x9530>
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
    151c:	00160613          	addi	a2,a2,1 # f8b00001 <__freertos_irq_stack_top+0xf8af9631>
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
    1534:	d9450513          	addi	a0,a0,-620 # 4d94 <_data+0x914>
    1538:	73d000ef          	jal	2474 <bsp_printf>

    // SELECT start address of to be displayed data accordingly - Default
    dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    153c:	01000693          	li	a3,16
    1540:	00100637          	lui	a2,0x100
    1544:	00200593          	li	a1,2
    1548:	f8110537          	lui	a0,0xf8110
    154c:	609000ef          	jal	2354 <dmasg_input_memory>

    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    1550:	00100793          	li	a5,1
    1554:	00000713          	li	a4,0
    1558:	00000693          	li	a3,0
    155c:	00000613          	li	a2,0
    1560:	00200593          	li	a1,2
    1564:	f8110537          	lui	a0,0xf8110
    1568:	675000ef          	jal	23dc <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    156c:	00400613          	li	a2,4
    1570:	00200593          	li	a1,2
    1574:	f8110537          	lui	a0,0xf8110
    1578:	6b9000ef          	jal	2430 <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restart
    157c:	00000693          	li	a3,0
    1580:	0011d637          	lui	a2,0x11d
    1584:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116270>
    1588:	00200593          	li	a1,2
    158c:	f8110537          	lui	a0,0xf8110
    1590:	679000ef          	jal	2408 <dmasg_direct_start>
    display_mm2s_active = 1;                                                                         // Display always active
    1594:	00100713          	li	a4,1
    1598:	82e1a823          	sw	a4,-2000(gp) # 5840 <display_mm2s_active>

    msDelay(5000); // Display test content for 5 seconds
    159c:	00001537          	lui	a0,0x1
    15a0:	38850513          	addi	a0,a0,904 # 1388 <main+0x78>
    15a4:	039000ef          	jal	1ddc <msDelay>

    bsp_printf("Done !!\n\n\r");
    15a8:	00005537          	lui	a0,0x5
    15ac:	d6450513          	addi	a0,a0,-668 # 4d64 <_data+0x8e4>
    15b0:	6c5000ef          	jal	2474 <bsp_printf>

    ispExample_menu();
    15b4:	1d1010ef          	jal	2f84 <ispExample_menu>

    bsp_printf("Default Demo Mode: a\n\r");
    15b8:	00005537          	lui	a0,0x5
    15bc:	db050513          	addi	a0,a0,-592 # 4db0 <_data+0x930>
    15c0:	6b5000ef          	jal	2474 <bsp_printf>
    15c4:	1040006f          	j	16c8 <main+0x3b8>
    15c8:	f81007b7          	lui	a5,0xf8100
    15cc:	0007a623          	sw	zero,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f963c>
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
    15e4:	284010ef          	jal	2868 <rgb2grayscale>
    15e8:	1800006f          	j	1768 <main+0x458>
        *((volatile u32*) address) = data;
    15ec:	f81207b7          	lui	a5,0xf8120
    15f0:	0007a223          	sw	zero,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119634>
                write_u32(0x00000002, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG1_OFFSET); // 2'd2: Sobel+Erosion
            }

            // Trigger HW accel MM2S DMA
            // SELECT start address of DMA input to HW accel block
            dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, CAM_START_ADDR, 16); // Camera pre-processing block performs HW RGB2grayscale conversion
    15f4:	01000693          	li	a3,16
    15f8:	00100637          	lui	a2,0x100
    15fc:	00400593          	li	a1,4
    1600:	f8110537          	lui	a0,0xf8110
    1604:	551000ef          	jal	2354 <dmasg_input_memory>
            // dmasg_input_memory(DMASG_BASE, DMASG_HW_ACCEL_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16); //RISC-V performs SW RGB2grayscale conversion
            dmasg_output_stream(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, DMASG_HW_ACCEL_MM2S_1_PORT, 0, 0, 1);
    1608:	00100793          	li	a5,1
    160c:	00000713          	li	a4,0
    1610:	00000693          	li	a3,0
    1614:	00000613          	li	a2,0
    1618:	00400593          	li	a1,4
    161c:	f8110537          	lui	a0,0xf8110
    1620:	5bd000ef          	jal	23dc <dmasg_output_stream>

            // SELECT dma transfer length - Make sure match with HW accelerator mode selection
            // Additonal data is required to be fed for line buffer(s) data flushing
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1624:	8341a783          	lw	a5,-1996(gp) # 5844 <select_demo_mode>
    1628:	00200713          	li	a4,2
    162c:	00e78663          	beq	a5,a4,1638 <main+0x328>
    1630:	00400713          	li	a4,4
    1634:	18e79863          	bne	a5,a4,17c4 <main+0x4b4>
            {
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (FRAME_WIDTH + 1)) * 4, 0); // Sobel only
    1638:	00000693          	li	a3,0
    163c:	0011d637          	lui	a2,0x11d
    1640:	4b460613          	addi	a2,a2,1204 # 11d4b4 <__freertos_irq_stack_top+0x116ae4>
    1644:	00400593          	li	a1,4
    1648:	f8110537          	lui	a0,0xf8110
    164c:	5bd000ef          	jal	2408 <dmasg_direct_start>
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
    1664:	541000ef          	jal	23a4 <dmasg_input_stream>
            dmasg_output_memory(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, SOBEL_START_ADDR, 16);
    1668:	01000693          	li	a3,16
    166c:	00900637          	lui	a2,0x900
    1670:	00300593          	li	a1,3
    1674:	f8110537          	lui	a0,0xf8110
    1678:	505000ef          	jal	237c <dmasg_output_memory>
            dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    167c:	00000693          	li	a3,0
    1680:	0011d637          	lui	a2,0x11d
    1684:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116270>
    1688:	00300593          	li	a1,3
    168c:	f8110537          	lui	a0,0xf8110
    1690:	579000ef          	jal	2408 <dmasg_direct_start>
    1694:	f81207b7          	lui	a5,0xf8120
    1698:	00100713          	li	a4,1
    169c:	00e7a423          	sw	a4,8(a5) # f8120008 <__freertos_irq_stack_top+0xf8119638>
    16a0:	0007a423          	sw	zero,8(a5)
            // Indicate start of S2MM DMA to HW accel building block via APB3 slave
            write_u32(0x00000001, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);
            write_u32(0x00000000, EXAMPLE_APB3_SLV_HW + EXAMPLE_APB3_SLV_HW_REG2_OFFSET);

            // Wait for DMA transfer completion
            while (dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL) || dmasg_busy(DMASG_BASE, DMASG_HW_ACCEL_S2MM_CHANNEL))
    16a4:	00400593          	li	a1,4
    16a8:	f8110537          	lui	a0,0xf8110
    16ac:	59d000ef          	jal	2448 <dmasg_busy>
    16b0:	fe051ae3          	bnez	a0,16a4 <main+0x394>
    16b4:	00300593          	li	a1,3
    16b8:	f8110537          	lui	a0,0xf8110
    16bc:	58d000ef          	jal	2448 <dmasg_busy>
    16c0:	fe0512e3          	bnez	a0,16a4 <main+0x394>
    16c4:	0000500f          	.word	0x0000500f
        Read_Latency();
    16c8:	6dd000ef          	jal	25a4 <Read_Latency>
        if (select_demo_mode > 2)
    16cc:	8341a703          	lw	a4,-1996(gp) # 5844 <select_demo_mode>
    16d0:	00200793          	li	a5,2
    16d4:	eee7fae3          	bgeu	a5,a4,15c8 <main+0x2b8>
    16d8:	f81007b7          	lui	a5,0xf8100
    16dc:	00100713          	li	a4,1
    16e0:	00e7a623          	sw	a4,12(a5) # f810000c <__freertos_irq_stack_top+0xf80f963c>
        dmasg_input_stream(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, DMASG_CAM1_S2MM_PORT, 1, 0);
    16e4:	00000713          	li	a4,0
    16e8:	00100693          	li	a3,1
    16ec:	00000613          	li	a2,0
    16f0:	00000593          	li	a1,0
    16f4:	f8110537          	lui	a0,0xf8110
    16f8:	4ad000ef          	jal	23a4 <dmasg_input_stream>
        dmasg_output_memory(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, CAM_START_ADDR, 16);
    16fc:	01000693          	li	a3,16
    1700:	00100637          	lui	a2,0x100
    1704:	00000593          	li	a1,0
    1708:	f8110537          	lui	a0,0xf8110
    170c:	471000ef          	jal	237c <dmasg_output_memory>
        dmasg_direct_start(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0);
    1710:	00000693          	li	a3,0
    1714:	0011d637          	lui	a2,0x11d
    1718:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116270>
    171c:	00000593          	li	a1,0
    1720:	f8110537          	lui	a0,0xf8110
    1724:	4e5000ef          	jal	2408 <dmasg_direct_start>
    1728:	f81007b7          	lui	a5,0xf8100
    172c:	00100713          	li	a4,1
    1730:	00e7a823          	sw	a4,16(a5) # f8100010 <__freertos_irq_stack_top+0xf80f9640>
    1734:	0007a823          	sw	zero,16(a5)
    1738:	f81007b7          	lui	a5,0xf8100
    173c:	00e7a423          	sw	a4,8(a5) # f8100008 <__freertos_irq_stack_top+0xf80f9638>
    1740:	0007a423          	sw	zero,8(a5)
        while (dmasg_busy(DMASG_BASE, DMASG_CAM1_S2MM_CHANNEL))
    1744:	00000593          	li	a1,0
    1748:	f8110537          	lui	a0,0xf8110
    174c:	4fd000ef          	jal	2448 <dmasg_busy>
    1750:	fe051ae3          	bnez	a0,1744 <main+0x434>
    1754:	0000500f          	.word	0x0000500f
        if (select_demo_mode == 1 || select_demo_mode == 2)
    1758:	8341a783          	lw	a5,-1996(gp) # 5844 <select_demo_mode>
    175c:	fff78793          	addi	a5,a5,-1
    1760:	00100713          	li	a4,1
    1764:	e6f778e3          	bgeu	a4,a5,15d4 <main+0x2c4>
        if (select_demo_mode == 2 || select_demo_mode > 3)
    1768:	8341a783          	lw	a5,-1996(gp) # 5844 <select_demo_mode>
    176c:	00200713          	li	a4,2
    1770:	00e78663          	beq	a5,a4,177c <main+0x46c>
    1774:	00300713          	li	a4,3
    1778:	f4f778e3          	bgeu	a4,a5,16c8 <main+0x3b8>
    177c:	f81207b7          	lui	a5,0xf8120
    1780:	00500713          	li	a4,5
    1784:	00e7a023          	sw	a4,0(a5) # f8120000 <__freertos_irq_stack_top+0xf8119630>
            if (select_demo_mode == 2 || select_demo_mode == 4)
    1788:	8341a783          	lw	a5,-1996(gp) # 5844 <select_demo_mode>
    178c:	00200713          	li	a4,2
    1790:	e4e78ee3          	beq	a5,a4,15ec <main+0x2dc>
    1794:	00400713          	li	a4,4
    1798:	e4e78ae3          	beq	a5,a4,15ec <main+0x2dc>
            else if (select_demo_mode == 5)
    179c:	00500713          	li	a4,5
    17a0:	00e78a63          	beq	a5,a4,17b4 <main+0x4a4>
    17a4:	f81207b7          	lui	a5,0xf8120
    17a8:	00200713          	li	a4,2
    17ac:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119634>
    }
    17b0:	e45ff06f          	j	15f4 <main+0x2e4>
        *((volatile u32*) address) = data;
    17b4:	f81207b7          	lui	a5,0xf8120
    17b8:	00100713          	li	a4,1
    17bc:	00e7a223          	sw	a4,4(a5) # f8120004 <__freertos_irq_stack_top+0xf8119634>
    }
    17c0:	e35ff06f          	j	15f4 <main+0x2e4>
                dmasg_direct_start(DMASG_BASE, DMASG_HW_ACCEL_MM2S_1_CHANNEL, ((FRAME_WIDTH * FRAME_HEIGHT) + (2 * FRAME_WIDTH + 2)) * 4, 0); // Sobel + Dilation/Erosion
    17c4:	00000693          	li	a3,0
    17c8:	0011e637          	lui	a2,0x11e
    17cc:	d2860613          	addi	a2,a2,-728 # 11dd28 <__freertos_irq_stack_top+0x117358>
    17d0:	00400593          	li	a1,4
    17d4:	f8110537          	lui	a0,0xf8110
    17d8:	431000ef          	jal	2408 <dmasg_direct_start>
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
    17e8:	00c5a023          	sw	a2,0(a1) # 500000 <__freertos_irq_stack_top+0x4f9630>
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
    1854:	00452503          	lw	a0,4(a0) # f8110004 <__freertos_irq_stack_top+0xf8109634>
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
    191c:	48078793          	addi	a5,a5,1152 # 4480 <_data>
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
    1970:	49478793          	addi	a5,a5,1172 # 4494 <_data+0x14>
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
    1ba8:	4a850513          	addi	a0,a0,1192 # 44a8 <_data+0x28>
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
    1bdc:	e4470713          	addi	a4,a4,-444 # 4e44 <_data+0x9c4>
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
    1c0c:	4f450513          	addi	a0,a0,1268 # 44f4 <_data+0x74>
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
    1c58:	3f078793          	addi	a5,a5,1008 # 43f0 <trap_entry>
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
    1ca8:	258010ef          	jal	2f00 <externalInterrupt>
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
    1cc0:	00452503          	lw	a0,4(a0) # f8c00004 <__freertos_irq_stack_top+0xf8bf9634>
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
    1d54:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed870>
    1d58:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1d5c:	0000c7b7          	lui	a5,0xc
    1d60:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5628>
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
    1dcc:	50458593          	addi	a1,a1,1284 # 4504 <_data+0x84>
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
    1dec:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
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
    1e1c:	6a078793          	addi	a5,a5,1696 # 186a0 <__freertos_irq_stack_top+0x11cd0>
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
    1e54:	00452503          	lw	a0,4(a0) # f8010004 <__freertos_irq_stack_top+0xf8009634>
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
    1f24:	24078793          	addi	a5,a5,576 # f4240 <__freertos_irq_stack_top+0xed870>
    1f28:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
    1f2c:	0000c7b7          	lui	a5,0xc
    1f30:	ff878793          	addi	a5,a5,-8 # bff8 <__freertos_irq_stack_top+0x5628>
    1f34:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
    1f38:	00062783          	lw	a5,0(a2) # f8b00000 <__freertos_irq_stack_top+0xf8af9630>
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
    1fd0:	48078793          	addi	a5,a5,1152 # 4480 <_data>
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
    2024:	49478793          	addi	a5,a5,1172 # 4494 <_data+0x14>
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
    2224:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f9634>
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
    2240:	00478793          	addi	a5,a5,4 # 200004 <__freertos_irq_stack_top+0x1f9634>
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
    226c:	ec870713          	addi	a4,a4,-312 # 4ec8 <_data+0xa48>
    2270:	00e787b3          	add	a5,a5,a4
    2274:	0007a783          	lw	a5,0(a5)
    2278:	00078067          	jr	a5
	u32 data = setting;
    227c:	04400793          	li	a5,68
    2280:	0700006f          	j	22f0 <Set_Gain+0xa0>
    2284:	01c00793          	li	a5,28
    2288:	0680006f          	j	22f0 <Set_Gain+0xa0>
    228c:	02000793          	li	a5,32
    2290:	0600006f          	j	22f0 <Set_Gain+0xa0>
    2294:	02400793          	li	a5,36
    2298:	0580006f          	j	22f0 <Set_Gain+0xa0>
    229c:	02800793          	li	a5,40
    22a0:	0500006f          	j	22f0 <Set_Gain+0xa0>
    22a4:	02c00793          	li	a5,44
    22a8:	0480006f          	j	22f0 <Set_Gain+0xa0>
    22ac:	03000793          	li	a5,48
    22b0:	0400006f          	j	22f0 <Set_Gain+0xa0>
    22b4:	03400793          	li	a5,52
    22b8:	0380006f          	j	22f0 <Set_Gain+0xa0>
    22bc:	03800793          	li	a5,56
    22c0:	0300006f          	j	22f0 <Set_Gain+0xa0>
    22c4:	03c00793          	li	a5,60
    22c8:	0280006f          	j	22f0 <Set_Gain+0xa0>
    22cc:	04000793          	li	a5,64
    22d0:	0200006f          	j	22f0 <Set_Gain+0xa0>
				 (var==11)? EXAMPLE_APB3_SLV_REG15_OFFSET: 
				 (var==12)? EXAMPLE_APB3_SLV_REG16_OFFSET:EXAMPLE_APB3_SLV_REG17_OFFSET; // single cam, camId ignored
#endif

	if (var == 0) {                       // REG0 black level (RAW10 range)
		if (data > 0x3F) data = 0x3F;
    22d4:	03f00793          	li	a5,63
    22d8:	06c7e863          	bltu	a5,a2,2348 <Set_Gain+0xf8>
    22dc:	00000793          	li	a5,0
    22e0:	0340006f          	j	2314 <Set_Gain+0xc4>
	u32 data = setting;
    22e4:	01400793          	li	a5,20
    22e8:	0080006f          	j	22f0 <Set_Gain+0xa0>
    22ec:	01800793          	li	a5,24
	} else if (var >= 1 && var <= 3) {    // REG5-7 colour gains (Q9.7)
    22f0:	fff58713          	addi	a4,a1,-1
    22f4:	00200513          	li	a0,2
    22f8:	00e56a63          	bltu	a0,a4,230c <Set_Gain+0xbc>
		if (data > 0x400) data = 0x400;   // ceiling: 8.0x
    22fc:	40000713          	li	a4,1024
    2300:	00d77a63          	bgeu	a4,a3,2314 <Set_Gain+0xc4>
    2304:	40000693          	li	a3,1024
    2308:	00c0006f          	j	2314 <Set_Gain+0xc4>
	} else if (var == 13) {               // REG17 isp_enable
    230c:	00d00713          	li	a4,13
    2310:	02e58863          	beq	a1,a4,2340 <Set_Gain+0xf0>
		data &= 0x3;
	}

	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, offset, data);
    2314:	f8100737          	lui	a4,0xf8100
    2318:	00e787b3          	add	a5,a5,a4
    231c:	00d7a023          	sw	a3,0(a5)
	bsp_uDelay(DELAY_BUSY);
    2320:	f8b00637          	lui	a2,0xf8b00
    2324:	05f5e5b7          	lui	a1,0x5f5e
    2328:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    232c:	00500513          	li	a0,5
    2330:	bf1ff0ef          	jal	1f20 <clint_uDelay>
}
    2334:	00c12083          	lw	ra,12(sp)
    2338:	01010113          	addi	sp,sp,16
    233c:	00008067          	ret
		data &= 0x3;
    2340:	00367693          	andi	a3,a2,3
    2344:	fd1ff06f          	j	2314 <Set_Gain+0xc4>
    2348:	00000793          	li	a5,0
		if (data > 0x3F) data = 0x3F;
    234c:	03f00693          	li	a3,63
    2350:	fc5ff06f          	j	2314 <Set_Gain+0xc4>

00002354 <dmasg_input_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_input_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    2354:	00759593          	slli	a1,a1,0x7
    2358:	00a58533          	add	a0,a1,a0
    235c:	00c52023          	sw	a2,0(a0) # f8010000 <__freertos_irq_stack_top+0xf8009630>
        write_u32(address, ca + DMASG_CHANNEL_INPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_INPUT_CONFIG);
    2360:	fff68693          	addi	a3,a3,-1 # feffff <__freertos_irq_stack_top+0xfe962f>
    2364:	000017b7          	lui	a5,0x1
    2368:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    236c:	00e6f6b3          	and	a3,a3,a4
    2370:	00f6e6b3          	or	a3,a3,a5
    2374:	00d52623          	sw	a3,12(a0)
    }
    2378:	00008067          	ret

0000237c <dmasg_output_memory>:
* @note byte_per_burst need to be a power of two, can be set to zero if the channel has
*       hardcoded burst length.
*
******************************************************************************/
    static void dmasg_output_memory(u32 base, u32 channel, u32 address, u32 byte_per_burst){
        u32 ca = dmasg_ca(base, channel);
    237c:	00759593          	slli	a1,a1,0x7
    2380:	00a58533          	add	a0,a1,a0
    2384:	00c52823          	sw	a2,16(a0)
        write_u32(address, ca + DMASG_CHANNEL_OUTPUT_ADDRESS);
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_MEMORY | (byte_per_burst-1 & 0xFFF), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    2388:	fff68693          	addi	a3,a3,-1
    238c:	000017b7          	lui	a5,0x1
    2390:	fff78713          	addi	a4,a5,-1 # fff <CUSTOM2+0xfa4>
    2394:	00e6f6b3          	and	a3,a3,a4
    2398:	00f6e6b3          	or	a3,a3,a5
    239c:	00d52e23          	sw	a3,28(a0)
    }
    23a0:	00008067          	ret

000023a4 <dmasg_input_stream>:
*                              contain one packet and force its completion when fully transferred 
*                              into memory.
*
*******************************************************************************/   
    static void dmasg_input_stream(u32 base, u32 channel, u32 port, u32 wait_on_packet, u32 completion_on_packet){
        u32 ca = dmasg_ca(base, channel);
    23a4:	00759593          	slli	a1,a1,0x7
    23a8:	00a58533          	add	a0,a1,a0
    23ac:	00c52423          	sw	a2,8(a0)
        write_u32(port << 0, ca + DMASG_CHANNEL_INPUT_STREAM);
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    23b0:	00070e63          	beqz	a4,23cc <dmasg_input_stream+0x28>
    23b4:	000027b7          	lui	a5,0x2
    23b8:	00068e63          	beqz	a3,23d4 <dmasg_input_stream+0x30>
    23bc:	00004737          	lui	a4,0x4
    23c0:	00e7e7b3          	or	a5,a5,a4
    23c4:	00f52623          	sw	a5,12(a0)
    }
    23c8:	00008067          	ret
        write_u32(DMASG_CHANNEL_INPUT_CONFIG_STREAM | (completion_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_COMPLETION_ON_PACKET : 0) | (wait_on_packet ? DMASG_CHANNEL_INPUT_CONFIG_WAIT_ON_PACKET : 0), ca + DMASG_CHANNEL_INPUT_CONFIG);
    23cc:	00000793          	li	a5,0
    23d0:	fe9ff06f          	j	23b8 <dmasg_input_stream+0x14>
    23d4:	00000713          	li	a4,0
    23d8:	fe9ff06f          	j	23c0 <dmasg_input_stream+0x1c>

000023dc <dmasg_output_stream>:
* @param last: Specifies if an end of packet should be sent at the end of the transfer
*              (only for direct DMA control, not linked list)
*
*******************************************************************************/
    static void dmasg_output_stream(u32 base, u32 channel, u32 port, u32 source, u32 sink, u32 last){
        u32 ca = dmasg_ca(base, channel);
    23dc:	00759593          	slli	a1,a1,0x7
    23e0:	00a58533          	add	a0,a1,a0
        write_u32(port << 0 | source << 8 | sink << 16, ca + DMASG_CHANNEL_OUTPUT_STREAM);
    23e4:	00869693          	slli	a3,a3,0x8
    23e8:	00c6e6b3          	or	a3,a3,a2
    23ec:	01071713          	slli	a4,a4,0x10
    23f0:	00e6e6b3          	or	a3,a3,a4
    23f4:	00d52c23          	sw	a3,24(a0)
        write_u32(DMASG_CHANNEL_OUTPUT_CONFIG_STREAM | (last ? DMASG_CHANNEL_OUTPUT_CONFIG_LAST : 0), ca + DMASG_CHANNEL_OUTPUT_CONFIG);
    23f8:	00078463          	beqz	a5,2400 <dmasg_output_stream+0x24>
    23fc:	000027b7          	lui	a5,0x2
    2400:	00f52e23          	sw	a5,28(a0)
    }
    2404:	00008067          	ret

00002408 <dmasg_direct_start>:
*                      The DESCRIPTOR_COMPLETION_HALF interrupt can be usefull 
*                      in that mode.
*
*******************************************************************************/
    static void dmasg_direct_start(u32 base, u32 channel, u32 bytes, u32 self_restart){
        u32 ca = dmasg_ca(base, channel);
    2408:	00759593          	slli	a1,a1,0x7
    240c:	00a58533          	add	a0,a1,a0
        write_u32(bytes-1, ca + DMASG_CHANNEL_DIRECT_BYTES);
    2410:	fff60613          	addi	a2,a2,-1 # f8afffff <__freertos_irq_stack_top+0xf8af962f>
    2414:	02c52023          	sw	a2,32(a0)
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2418:	00068863          	beqz	a3,2428 <dmasg_direct_start+0x20>
    241c:	00300793          	li	a5,3
    2420:	02f52623          	sw	a5,44(a0)
    }
    2424:	00008067          	ret
        write_u32(DMASG_CHANNEL_STATUS_DIRECT_START | (self_restart ? DMASG_CHANNEL_STATUS_SELF_RESTART : 0), ca + DMASG_CHANNEL_STATUS);
    2428:	00100793          	li	a5,1
    242c:	ff5ff06f          	j	2420 <dmasg_direct_start+0x18>

00002430 <dmasg_interrupt_config>:
*       This function clear all pending interrupts for the given channel 
*       before enabling the mask's interrupts.
*
*******************************************************************************/
    static void dmasg_interrupt_config(u32 base, u32 channel, u32 mask){
        u32 ca = dmasg_ca(base, channel);
    2430:	00759593          	slli	a1,a1,0x7
    2434:	00a58533          	add	a0,a1,a0
    2438:	fff00793          	li	a5,-1
    243c:	04f52a23          	sw	a5,84(a0)
    2440:	04c52823          	sw	a2,80(a0)
        write_u32(0xFFFFFFFF, ca+DMASG_CHANNEL_INTERRUPT_PENDING);
        write_u32(mask, ca+DMASG_CHANNEL_INTERRUPT_ENABLE);
    }
    2444:	00008067          	ret

00002448 <dmasg_busy>:
*
* @return 1 if the channel is busy, 0 otherwise
*
*******************************************************************************/
    static u32 dmasg_busy(u32 base, u32 channel){
        u32 ca = dmasg_ca(base, channel);
    2448:	00759593          	slli	a1,a1,0x7
    244c:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
    2450:	02c5a503          	lw	a0,44(a1)
        return read_u32(ca + DMASG_CHANNEL_STATUS) & DMASG_CHANNEL_STATUS_BUSY;
    }
    2454:	00157513          	andi	a0,a0,1
    2458:	00008067          	ret

0000245c <dmasg_priority>:
* @param priority: Priority of the channel
* @param weight: Weight of the channel
*
*******************************************************************************/  
    static void dmasg_priority(u32 base, u32 channel, u32 priority, u32 weight){
        u32 ca = dmasg_ca(base, channel);
    245c:	00759593          	slli	a1,a1,0x7
    2460:	00a585b3          	add	a1,a1,a0
        write_u32(priority| weight << 8,  ca+DMASG_CHANNEL_PRIORITY);
    2464:	00869693          	slli	a3,a3,0x8
    2468:	00c6e6b3          	or	a3,a3,a2
        *((volatile u32*) address) = data;
    246c:	04d5a223          	sw	a3,68(a1)
    }
    2470:	00008067          	ret

00002474 <bsp_printf>:
    {
    2474:	fc010113          	addi	sp,sp,-64
    2478:	00112e23          	sw	ra,28(sp)
    247c:	00812c23          	sw	s0,24(sp)
    2480:	00912a23          	sw	s1,20(sp)
    2484:	00050493          	mv	s1,a0
    2488:	02b12223          	sw	a1,36(sp)
    248c:	02c12423          	sw	a2,40(sp)
    2490:	02d12623          	sw	a3,44(sp)
    2494:	02e12823          	sw	a4,48(sp)
    2498:	02f12a23          	sw	a5,52(sp)
    249c:	03012c23          	sw	a6,56(sp)
    24a0:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    24a4:	02410793          	addi	a5,sp,36
    24a8:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    24ac:	00000413          	li	s0,0
    24b0:	01c0006f          	j	24cc <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    24b4:	00c12783          	lw	a5,12(sp)
    24b8:	00478713          	addi	a4,a5,4 # 2004 <bsp_printHex_lower+0x8>
    24bc:	00e12623          	sw	a4,12(sp)
    24c0:	0007a503          	lw	a0,0(a5)
    24c4:	b8dff0ef          	jal	2050 <bsp_printf_c>
        for (i = 0; format[i]; i++)
    24c8:	00140413          	addi	s0,s0,1
    24cc:	008487b3          	add	a5,s1,s0
    24d0:	0007c503          	lbu	a0,0(a5)
    24d4:	0a050e63          	beqz	a0,2590 <bsp_printf+0x11c>
            if (format[i] == '%') {
    24d8:	02500793          	li	a5,37
    24dc:	06f50e63          	beq	a0,a5,2558 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    24e0:	b71ff0ef          	jal	2050 <bsp_printf_c>
    24e4:	fe5ff06f          	j	24c8 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    24e8:	00c12783          	lw	a5,12(sp)
    24ec:	00478713          	addi	a4,a5,4
    24f0:	00e12623          	sw	a4,12(sp)
    24f4:	0007a503          	lw	a0,0(a5)
    24f8:	b75ff0ef          	jal	206c <bsp_printf_s>
                        break;
    24fc:	fcdff06f          	j	24c8 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    2500:	00c12783          	lw	a5,12(sp)
    2504:	00478713          	addi	a4,a5,4
    2508:	00e12623          	sw	a4,12(sp)
    250c:	0007a503          	lw	a0,0(a5)
    2510:	b75ff0ef          	jal	2084 <bsp_printf_d>
                        break;
    2514:	fb5ff06f          	j	24c8 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    2518:	00c12783          	lw	a5,12(sp)
    251c:	00478713          	addi	a4,a5,4
    2520:	00e12623          	sw	a4,12(sp)
    2524:	0007a503          	lw	a0,0(a5)
    2528:	c1dff0ef          	jal	2144 <bsp_printf_X>
                        break;
    252c:	f9dff06f          	j	24c8 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    2530:	00c12783          	lw	a5,12(sp)
    2534:	00478713          	addi	a4,a5,4
    2538:	00e12623          	sw	a4,12(sp)
    253c:	0007a503          	lw	a0,0(a5)
    2540:	bc5ff0ef          	jal	2104 <bsp_printf_x>
                        break;
    2544:	f85ff06f          	j	24c8 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    2548:	00004537          	lui	a0,0x4
    254c:	4a850513          	addi	a0,a0,1192 # 44a8 <_data+0x28>
    2550:	b1dff0ef          	jal	206c <bsp_printf_s>
                        break;
    2554:	f75ff06f          	j	24c8 <bsp_printf+0x54>
                while (format[++i]) {
    2558:	00140413          	addi	s0,s0,1
    255c:	008487b3          	add	a5,s1,s0
    2560:	0007c783          	lbu	a5,0(a5)
    2564:	f60782e3          	beqz	a5,24c8 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    2568:	fa878793          	addi	a5,a5,-88
    256c:	0ff7f693          	zext.b	a3,a5
    2570:	02000713          	li	a4,32
    2574:	fed762e3          	bltu	a4,a3,2558 <bsp_printf+0xe4>
    2578:	00269793          	slli	a5,a3,0x2
    257c:	00005737          	lui	a4,0x5
    2580:	efc70713          	addi	a4,a4,-260 # 4efc <_data+0xa7c>
    2584:	00e787b3          	add	a5,a5,a4
    2588:	0007a783          	lw	a5,0(a5)
    258c:	00078067          	jr	a5
    }
    2590:	01c12083          	lw	ra,28(sp)
    2594:	01812403          	lw	s0,24(sp)
    2598:	01412483          	lw	s1,20(sp)
    259c:	04010113          	addi	sp,sp,64
    25a0:	00008067          	ret

000025a4 <Read_Latency>:
}

#endif

static inline void Read_Latency()
{
    25a4:	fe010113          	addi	sp,sp,-32
    25a8:	00112e23          	sw	ra,28(sp)
    25ac:	00812c23          	sw	s0,24(sp)
    25b0:	00912a23          	sw	s1,20(sp)
    25b4:	01212823          	sw	s2,16(sp)
    25b8:	01312623          	sw	s3,12(sp)
        return *((volatile u32*) address);
    25bc:	f81007b7          	lui	a5,0xf8100
    25c0:	0a07a903          	lw	s2,160(a5) # f81000a0 <__freertos_irq_stack_top+0xf80f96d0>
	u32 valid_status = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG40_OFFSET);
	for(int i=0; i<12; i++)
    25c4:	00000413          	li	s0,0
    25c8:	01c0006f          	j	25e4 <Read_Latency+0x40>
			bsp_uDelay(DELAY_BUSY);

			switch(i)
			{
				case 0:
					overflow == 0 ? bsp_printf("TOTAL ISP minimum latency: %d clock cycles\n\r", counter_data):
    25cc:	08049463          	bnez	s1,2654 <Read_Latency+0xb0>
    25d0:	00098593          	mv	a1,s3
    25d4:	00004537          	lui	a0,0x4
    25d8:	51450513          	addi	a0,a0,1300 # 4514 <_data+0x94>
    25dc:	e99ff0ef          	jal	2474 <bsp_printf>
	for(int i=0; i<12; i++)
    25e0:	00140413          	addi	s0,s0,1
    25e4:	00b00793          	li	a5,11
    25e8:	2687c263          	blt	a5,s0,284c <Read_Latency+0x2a8>
		if((valid_status & (1 << i)) != 0)
    25ec:	00100793          	li	a5,1
    25f0:	008797b3          	sll	a5,a5,s0
    25f4:	0127f733          	and	a4,a5,s2
    25f8:	fe0704e3          	beqz	a4,25e0 <Read_Latency+0x3c>
        *((volatile u32*) address) = data;
    25fc:	f8100737          	lui	a4,0xf8100
    2600:	04f72423          	sw	a5,72(a4) # f8100048 <__freertos_irq_stack_top+0xf80f9678>
			u32 raw          = read_u32(EXAMPLE_APB3_SLV + EXAMPLE_APB3_SLV_REG28_OFFSET + i*4);
    2604:	00241793          	slli	a5,s0,0x2
    2608:	f8100737          	lui	a4,0xf8100
    260c:	07070713          	addi	a4,a4,112 # f8100070 <__freertos_irq_stack_top+0xf80f96a0>
    2610:	00e787b3          	add	a5,a5,a4
        return *((volatile u32*) address);
    2614:	0007a783          	lw	a5,0(a5)
			u32 counter_data = raw >> 1;
    2618:	0017d993          	srli	s3,a5,0x1
			u32 overflow     = raw & 1;
    261c:	0017f493          	andi	s1,a5,1
			bsp_uDelay(DELAY_BUSY);
    2620:	f8b00637          	lui	a2,0xf8b00
    2624:	05f5e5b7          	lui	a1,0x5f5e
    2628:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    262c:	00500513          	li	a0,5
    2630:	8f1ff0ef          	jal	1f20 <clint_uDelay>
			switch(i)
    2634:	00b00793          	li	a5,11
    2638:	fa87e4e3          	bltu	a5,s0,25e0 <Read_Latency+0x3c>
    263c:	00241793          	slli	a5,s0,0x2
    2640:	00005737          	lui	a4,0x5
    2644:	f8070713          	addi	a4,a4,-128 # 4f80 <_data+0xb00>
    2648:	00e787b3          	add	a5,a5,a4
    264c:	0007a783          	lw	a5,0(a5)
    2650:	00078067          	jr	a5
								    bsp_printf("TOTAL ISP minimum latency: OVERFLOW\n\r", counter_data);
    2654:	00098593          	mv	a1,s3
    2658:	00004537          	lui	a0,0x4
    265c:	54450513          	addi	a0,a0,1348 # 4544 <_data+0xc4>
    2660:	e15ff0ef          	jal	2474 <bsp_printf>
    2664:	f7dff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 1:
					overflow == 0 ? bsp_printf("BLC minimum latency: %d clock cycles\n\r", counter_data):
    2668:	00049c63          	bnez	s1,2680 <Read_Latency+0xdc>
    266c:	00098593          	mv	a1,s3
    2670:	00004537          	lui	a0,0x4
    2674:	56c50513          	addi	a0,a0,1388 # 456c <_data+0xec>
    2678:	dfdff0ef          	jal	2474 <bsp_printf>
    267c:	f65ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("BLC minimum latency: OVERFLOW\n\r", counter_data);
    2680:	00098593          	mv	a1,s3
    2684:	00004537          	lui	a0,0x4
    2688:	59450513          	addi	a0,a0,1428 # 4594 <_data+0x114>
    268c:	de9ff0ef          	jal	2474 <bsp_printf>
    2690:	f51ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 2:
					overflow == 0 ? bsp_printf("COLOUR GAIN minimum latency: %d clock cycles\n\r", counter_data):
    2694:	00049c63          	bnez	s1,26ac <Read_Latency+0x108>
    2698:	00098593          	mv	a1,s3
    269c:	00004537          	lui	a0,0x4
    26a0:	5b450513          	addi	a0,a0,1460 # 45b4 <_data+0x134>
    26a4:	dd1ff0ef          	jal	2474 <bsp_printf>
    26a8:	f39ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("COLOUR GAIN minimum latency: OVERFLOW\n\r", counter_data);
    26ac:	00098593          	mv	a1,s3
    26b0:	00004537          	lui	a0,0x4
    26b4:	5e450513          	addi	a0,a0,1508 # 45e4 <_data+0x164>
    26b8:	dbdff0ef          	jal	2474 <bsp_printf>
    26bc:	f25ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 3:
					overflow == 0 ? bsp_printf("DEMOSAIC minimum latency: %d clock cycles\n\r", counter_data):
    26c0:	00049c63          	bnez	s1,26d8 <Read_Latency+0x134>
    26c4:	00098593          	mv	a1,s3
    26c8:	00004537          	lui	a0,0x4
    26cc:	60c50513          	addi	a0,a0,1548 # 460c <_data+0x18c>
    26d0:	da5ff0ef          	jal	2474 <bsp_printf>
    26d4:	f0dff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("DEMOSAIC minimum latency: OVERFLOW\n\r", counter_data);
    26d8:	00098593          	mv	a1,s3
    26dc:	00004537          	lui	a0,0x4
    26e0:	63850513          	addi	a0,a0,1592 # 4638 <_data+0x1b8>
    26e4:	d91ff0ef          	jal	2474 <bsp_printf>
    26e8:	ef9ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 4:
					overflow == 0 ? bsp_printf("CCM minimum latency: %d clock cycles\n\r", counter_data):
    26ec:	00049c63          	bnez	s1,2704 <Read_Latency+0x160>
    26f0:	00098593          	mv	a1,s3
    26f4:	00004537          	lui	a0,0x4
    26f8:	66050513          	addi	a0,a0,1632 # 4660 <_data+0x1e0>
    26fc:	d79ff0ef          	jal	2474 <bsp_printf>
    2700:	ee1ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("CCM minimum latency: OVERFLOW\n\r", counter_data);
    2704:	00098593          	mv	a1,s3
    2708:	00004537          	lui	a0,0x4
    270c:	68850513          	addi	a0,a0,1672 # 4688 <_data+0x208>
    2710:	d65ff0ef          	jal	2474 <bsp_printf>
    2714:	ecdff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 5:
					overflow == 0 ? bsp_printf("GAMMA minimum latency: %d clock cycles\n\r", counter_data):
    2718:	00049c63          	bnez	s1,2730 <Read_Latency+0x18c>
    271c:	00098593          	mv	a1,s3
    2720:	00004537          	lui	a0,0x4
    2724:	6a850513          	addi	a0,a0,1704 # 46a8 <_data+0x228>
    2728:	d4dff0ef          	jal	2474 <bsp_printf>
    272c:	eb5ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("GAMMA minimum latency: OVERFLOW\n\r", counter_data);
    2730:	00098593          	mv	a1,s3
    2734:	00004537          	lui	a0,0x4
    2738:	6d450513          	addi	a0,a0,1748 # 46d4 <_data+0x254>
    273c:	d39ff0ef          	jal	2474 <bsp_printf>
    2740:	ea1ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 6:
					overflow == 0 ? bsp_printf("TOTAL ISP maximum latency: %d clock cycles\n\r", counter_data):
    2744:	00049c63          	bnez	s1,275c <Read_Latency+0x1b8>
    2748:	00098593          	mv	a1,s3
    274c:	00004537          	lui	a0,0x4
    2750:	6f850513          	addi	a0,a0,1784 # 46f8 <_data+0x278>
    2754:	d21ff0ef          	jal	2474 <bsp_printf>
    2758:	e89ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("TOTAL ISP maximum latency: OVERFLOW\n\r", counter_data);
    275c:	00098593          	mv	a1,s3
    2760:	00004537          	lui	a0,0x4
    2764:	72850513          	addi	a0,a0,1832 # 4728 <_data+0x2a8>
    2768:	d0dff0ef          	jal	2474 <bsp_printf>
    276c:	e75ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 7:
					overflow == 0 ? bsp_printf("BLC maximum latency: %d clock cycles\n\r", counter_data):
    2770:	00049c63          	bnez	s1,2788 <Read_Latency+0x1e4>
    2774:	00098593          	mv	a1,s3
    2778:	00004537          	lui	a0,0x4
    277c:	75050513          	addi	a0,a0,1872 # 4750 <_data+0x2d0>
    2780:	cf5ff0ef          	jal	2474 <bsp_printf>
    2784:	e5dff06f          	j	25e0 <Read_Latency+0x3c>
					                bsp_printf("BLC maximum latency: OVERFLOW\n\r", counter_data);
    2788:	00098593          	mv	a1,s3
    278c:	00004537          	lui	a0,0x4
    2790:	77850513          	addi	a0,a0,1912 # 4778 <_data+0x2f8>
    2794:	ce1ff0ef          	jal	2474 <bsp_printf>
    2798:	e49ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 8:
					overflow == 0 ? bsp_printf("COLOUR GAIN maximum latency: %d clock cycles\n\r", counter_data):
    279c:	00049c63          	bnez	s1,27b4 <Read_Latency+0x210>
    27a0:	00098593          	mv	a1,s3
    27a4:	00004537          	lui	a0,0x4
    27a8:	79850513          	addi	a0,a0,1944 # 4798 <_data+0x318>
    27ac:	cc9ff0ef          	jal	2474 <bsp_printf>
    27b0:	e31ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("COLOUR GAIN maximum latency: OVERFLOW\n\r", counter_data);
    27b4:	00098593          	mv	a1,s3
    27b8:	00004537          	lui	a0,0x4
    27bc:	7c850513          	addi	a0,a0,1992 # 47c8 <_data+0x348>
    27c0:	cb5ff0ef          	jal	2474 <bsp_printf>
    27c4:	e1dff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 9:
					overflow == 0 ? bsp_printf("DEMOSAIC maximum latency: %d clock cycles\n\r", counter_data):
    27c8:	00049c63          	bnez	s1,27e0 <Read_Latency+0x23c>
    27cc:	00098593          	mv	a1,s3
    27d0:	00004537          	lui	a0,0x4
    27d4:	7f050513          	addi	a0,a0,2032 # 47f0 <_data+0x370>
    27d8:	c9dff0ef          	jal	2474 <bsp_printf>
    27dc:	e05ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("DEMOSAIC maximum latency: OVERFLOW\n\r", counter_data);
    27e0:	00098593          	mv	a1,s3
    27e4:	00005537          	lui	a0,0x5
    27e8:	81c50513          	addi	a0,a0,-2020 # 481c <_data+0x39c>
    27ec:	c89ff0ef          	jal	2474 <bsp_printf>
    27f0:	df1ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 10:
					overflow == 0 ? bsp_printf("CCM maximum latency: %d clock cycles\n\r", counter_data):
    27f4:	00049c63          	bnez	s1,280c <Read_Latency+0x268>
    27f8:	00098593          	mv	a1,s3
    27fc:	00005537          	lui	a0,0x5
    2800:	84450513          	addi	a0,a0,-1980 # 4844 <_data+0x3c4>
    2804:	c71ff0ef          	jal	2474 <bsp_printf>
    2808:	dd9ff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("CCM maximum latency: OVERFLOW\n\r", counter_data);
    280c:	00098593          	mv	a1,s3
    2810:	00005537          	lui	a0,0x5
    2814:	86c50513          	addi	a0,a0,-1940 # 486c <_data+0x3ec>
    2818:	c5dff0ef          	jal	2474 <bsp_printf>
    281c:	dc5ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
				case 11:
					overflow == 0 ? bsp_printf("GAMMA maximum latency: %d clock cycles\n\r", counter_data):
    2820:	00049c63          	bnez	s1,2838 <Read_Latency+0x294>
    2824:	00098593          	mv	a1,s3
    2828:	00005537          	lui	a0,0x5
    282c:	88c50513          	addi	a0,a0,-1908 # 488c <_data+0x40c>
    2830:	c45ff0ef          	jal	2474 <bsp_printf>
    2834:	dadff06f          	j	25e0 <Read_Latency+0x3c>
								    bsp_printf("GAMMA maximum latency: OVERFLOW\n\r", counter_data);
    2838:	00098593          	mv	a1,s3
    283c:	00005537          	lui	a0,0x5
    2840:	8b850513          	addi	a0,a0,-1864 # 48b8 <_data+0x438>
    2844:	c31ff0ef          	jal	2474 <bsp_printf>
    2848:	d99ff06f          	j	25e0 <Read_Latency+0x3c>
				break;
			}
		}
	}
}
    284c:	01c12083          	lw	ra,28(sp)
    2850:	01812403          	lw	s0,24(sp)
    2854:	01412483          	lw	s1,20(sp)
    2858:	01012903          	lw	s2,16(sp)
    285c:	00c12983          	lw	s3,12(sp)
    2860:	02010113          	addi	sp,sp,32
    2864:	00008067          	ret

00002868 <rgb2grayscale>:

void rgb2grayscale(volatile uint32_t in_array[], volatile uint32_t out_array[], uint32_t width, uint32_t height)
{
   uint8_t red, green, blue, grayscale;

   for (int i = 0; i < (width * height); i++)
    2868:	00000313          	li	t1,0
    286c:	0880006f          	j	28f4 <rgb2grayscale+0x8c>
   {
      red = (in_array[i]) & 0xff;
    2870:	00231e13          	slli	t3,t1,0x2
    2874:	01c507b3          	add	a5,a0,t3
    2878:	0007a703          	lw	a4,0(a5)
      green = ((in_array[i]) >> 8) & 0xff;
    287c:	0007a883          	lw	a7,0(a5)
    2880:	0088d893          	srli	a7,a7,0x8
      blue = ((in_array[i]) >> 16) & 0xff;
    2884:	0007a803          	lw	a6,0(a5)
    2888:	01085813          	srli	a6,a6,0x10

      grayscale = (30 * red + 59 * green + 11 * blue) / 100;
    288c:	0ff77713          	zext.b	a4,a4
    2890:	00471793          	slli	a5,a4,0x4
    2894:	40e787b3          	sub	a5,a5,a4
    2898:	00179793          	slli	a5,a5,0x1
    289c:	0ff8f893          	zext.b	a7,a7
    28a0:	00489713          	slli	a4,a7,0x4
    28a4:	41170733          	sub	a4,a4,a7
    28a8:	00271713          	slli	a4,a4,0x2
    28ac:	41170733          	sub	a4,a4,a7
    28b0:	00e787b3          	add	a5,a5,a4
    28b4:	0ff87813          	zext.b	a6,a6
    28b8:	00181713          	slli	a4,a6,0x1
    28bc:	01070733          	add	a4,a4,a6
    28c0:	00271713          	slli	a4,a4,0x2
    28c4:	41070733          	sub	a4,a4,a6
    28c8:	00e787b3          	add	a5,a5,a4
    28cc:	06400713          	li	a4,100
    28d0:	02e7c7b3          	div	a5,a5,a4
      out_array[i] = (grayscale << 16) + (grayscale << 8) + (grayscale);
    28d4:	0ff7f793          	zext.b	a5,a5
    28d8:	01079713          	slli	a4,a5,0x10
    28dc:	00879813          	slli	a6,a5,0x8
    28e0:	01070733          	add	a4,a4,a6
    28e4:	01c58e33          	add	t3,a1,t3
    28e8:	00f707b3          	add	a5,a4,a5
    28ec:	00fe2023          	sw	a5,0(t3)
   for (int i = 0; i < (width * height); i++)
    28f0:	00130313          	addi	t1,t1,1
    28f4:	02d607b3          	mul	a5,a2,a3
    28f8:	f6f36ce3          	bltu	t1,a5,2870 <rgb2grayscale+0x8>
   }

   return;
}
    28fc:	00008067          	ret

00002900 <uart_interrupt_init>:
{
    2900:	ff010113          	addi	sp,sp,-16
    2904:	00112623          	sw	ra,12(sp)
    bsp_init();
    2908:	87dff0ef          	jal	2184 <bsp_init>
    uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    290c:	f8010537          	lui	a0,0xf8010
    2910:	e00ff0ef          	jal	1f10 <uart_status_read>
    2914:	00256593          	ori	a1,a0,2
    2918:	0ff5f593          	zext.b	a1,a1
    291c:	f8010537          	lui	a0,0xf8010
    2920:	df8ff0ef          	jal	1f18 <uart_status_write>
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
    2924:	00100693          	li	a3,1
    2928:	00100613          	li	a2,1
    292c:	00000593          	li	a1,0
    2930:	f8c00537          	lui	a0,0xf8c00
    2934:	899ff0ef          	jal	21cc <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 2); // 1
    2938:	00200613          	li	a2,2
    293c:	00100593          	li	a1,1
    2940:	f8c00537          	lui	a0,0xf8c00
    2944:	879ff0ef          	jal	21bc <plic_set_priority>
}
    2948:	00c12083          	lw	ra,12(sp)
    294c:	01010113          	addi	sp,sp,16
    2950:	00008067          	ret

00002954 <trigger_next_display_dma>:
{
    2954:	ff010113          	addi	sp,sp,-16
    2958:	00112623          	sw	ra,12(sp)
    if (select_demo_mode == 0 || select_demo_mode == 3)
    295c:	8341a783          	lw	a5,-1996(gp) # 5844 <select_demo_mode>
    2960:	02078663          	beqz	a5,298c <trigger_next_display_dma+0x38>
    2964:	00300713          	li	a4,3
    2968:	02e78263          	beq	a5,a4,298c <trigger_next_display_dma+0x38>
    else if (select_demo_mode == 1)
    296c:	00100713          	li	a4,1
    2970:	08e78063          	beq	a5,a4,29f0 <trigger_next_display_dma+0x9c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, SOBEL_START_ADDR, 16);
    2974:	01000693          	li	a3,16
    2978:	00900637          	lui	a2,0x900
    297c:	00200593          	li	a1,2
    2980:	f8110537          	lui	a0,0xf8110
    2984:	9d1ff0ef          	jal	2354 <dmasg_input_memory>
    2988:	0180006f          	j	29a0 <trigger_next_display_dma+0x4c>
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, CAM_START_ADDR, 16);
    298c:	01000693          	li	a3,16
    2990:	00100637          	lui	a2,0x100
    2994:	00200593          	li	a1,2
    2998:	f8110537          	lui	a0,0xf8110
    299c:	9b9ff0ef          	jal	2354 <dmasg_input_memory>
    dmasg_output_stream(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_DISPLAY_MM2S_PORT, 0, 0, 1);
    29a0:	00100793          	li	a5,1
    29a4:	00000713          	li	a4,0
    29a8:	00000693          	li	a3,0
    29ac:	00000613          	li	a2,0
    29b0:	00200593          	li	a1,2
    29b4:	f8110537          	lui	a0,0xf8110
    29b8:	a25ff0ef          	jal	23dc <dmasg_output_stream>
    dmasg_interrupt_config(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, DMASG_CHANNEL_INTERRUPT_CHANNEL_COMPLETION_MASK);
    29bc:	00400613          	li	a2,4
    29c0:	00200593          	li	a1,2
    29c4:	f8110537          	lui	a0,0xf8110
    29c8:	a69ff0ef          	jal	2430 <dmasg_interrupt_config>
    dmasg_direct_start(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, (FRAME_WIDTH * FRAME_HEIGHT) * 4, 0); // Without self restar
    29cc:	00000693          	li	a3,0
    29d0:	0011d637          	lui	a2,0x11d
    29d4:	c4060613          	addi	a2,a2,-960 # 11cc40 <__freertos_irq_stack_top+0x116270>
    29d8:	00200593          	li	a1,2
    29dc:	f8110537          	lui	a0,0xf8110
    29e0:	a29ff0ef          	jal	2408 <dmasg_direct_start>
}
    29e4:	00c12083          	lw	ra,12(sp)
    29e8:	01010113          	addi	sp,sp,16
    29ec:	00008067          	ret
        dmasg_input_memory(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL, GRAYSCALE_START_ADDR, 16);
    29f0:	01000693          	li	a3,16
    29f4:	00500637          	lui	a2,0x500
    29f8:	00200593          	li	a1,2
    29fc:	f8110537          	lui	a0,0xf8110
    2a00:	955ff0ef          	jal	2354 <dmasg_input_memory>
    2a04:	f9dff06f          	j	29a0 <trigger_next_display_dma+0x4c>

00002a08 <uart_buffer_read>:
{
    2a08:	ff010113          	addi	sp,sp,-16
    2a0c:	00112623          	sw	ra,12(sp)
    2a10:	00812423          	sw	s0,8(sp)
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2a14:	0440006f          	j	2a58 <uart_buffer_read+0x50>
           uart_write(BSP_UART_TERMINAL, c);
    2a18:	00040593          	mv	a1,s0
    2a1c:	f8010537          	lui	a0,0xf8010
    2a20:	c50ff0ef          	jal	1e70 <uart_write>
    2a24:	0a40006f          	j	2ac8 <uart_buffer_read+0xc0>
            if (uart_cmd_index > 0) {
    2a28:	82d1c783          	lbu	a5,-2003(gp) # 583d <uart_cmd_index>
    2a2c:	0ff7f793          	zext.b	a5,a5
    2a30:	02078463          	beqz	a5,2a58 <uart_buffer_read+0x50>
                uart_cmd_buffer[uart_cmd_index] = '\0';
    2a34:	82d1c683          	lbu	a3,-2003(gp) # 583d <uart_cmd_index>
    2a38:	97c18793          	addi	a5,gp,-1668 # 598c <uart_cmd_buffer>
    2a3c:	00d787b3          	add	a5,a5,a3
    2a40:	00078023          	sb	zero,0(a5)
                uart_cmd_ready = true;
    2a44:	00100693          	li	a3,1
    2a48:	82d18623          	sb	a3,-2004(gp) # 583c <uart_cmd_ready>
                uart_cmd_index = 0;         // reset for next command
    2a4c:	820186a3          	sb	zero,-2003(gp) # 583d <uart_cmd_index>
            continue;
    2a50:	0080006f          	j	2a58 <uart_buffer_read+0x50>
            uart_cmd_index = 0;
    2a54:	820186a3          	sb	zero,-2003(gp) # 583d <uart_cmd_index>
    while (uart_status_read(BSP_UART_TERMINAL) & 0x00000200) {
    2a58:	f8010537          	lui	a0,0xf8010
    2a5c:	cb4ff0ef          	jal	1f10 <uart_status_read>
    2a60:	20057513          	andi	a0,a0,512
    2a64:	0a050263          	beqz	a0,2b08 <uart_buffer_read+0x100>
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD); // RX FIFO not empty interrupt Disable
    2a68:	f8010537          	lui	a0,0xf8010
    2a6c:	ca4ff0ef          	jal	1f10 <uart_status_read>
    2a70:	0fd57593          	andi	a1,a0,253
    2a74:	f8010537          	lui	a0,0xf8010
    2a78:	ca0ff0ef          	jal	1f18 <uart_status_write>
        char c = uart_read(BSP_UART_TERMINAL);
    2a7c:	f8010537          	lui	a0,0xf8010
    2a80:	c2cff0ef          	jal	1eac <uart_read>
    2a84:	00050413          	mv	s0,a0
        uart_status_write(BSP_UART_TERMINAL, uart_status_read(BSP_UART_TERMINAL) | 0x02); // RX FIFO not empty interrupt enable
    2a88:	f8010537          	lui	a0,0xf8010
    2a8c:	c84ff0ef          	jal	1f10 <uart_status_read>
    2a90:	00256593          	ori	a1,a0,2
    2a94:	0ff5f593          	zext.b	a1,a1
    2a98:	f8010537          	lui	a0,0xf8010
    2a9c:	c7cff0ef          	jal	1f18 <uart_status_write>
        if (c == '\r' || c == '\n') {
    2aa0:	00d00793          	li	a5,13
    2aa4:	00f40663          	beq	s0,a5,2ab0 <uart_buffer_read+0xa8>
    2aa8:	00a00793          	li	a5,10
    2aac:	f6f416e3          	bne	s0,a5,2a18 <uart_buffer_read+0x10>
           uart_write(BSP_UART_TERMINAL, '\n');
    2ab0:	00a00593          	li	a1,10
    2ab4:	f8010537          	lui	a0,0xf8010
    2ab8:	bb8ff0ef          	jal	1e70 <uart_write>
           uart_write(BSP_UART_TERMINAL, '\r');
    2abc:	00d00593          	li	a1,13
    2ac0:	f8010537          	lui	a0,0xf8010
    2ac4:	bacff0ef          	jal	1e70 <uart_write>
        if (c == '\r' || c == '\n') {
    2ac8:	00d00793          	li	a5,13
    2acc:	f4f40ee3          	beq	s0,a5,2a28 <uart_buffer_read+0x20>
    2ad0:	00a00793          	li	a5,10
    2ad4:	f4f40ae3          	beq	s0,a5,2a28 <uart_buffer_read+0x20>
        if (uart_cmd_index < UART_CMD_MAX_LEN - 1) {
    2ad8:	82d1c783          	lbu	a5,-2003(gp) # 583d <uart_cmd_index>
    2adc:	0ff7f793          	zext.b	a5,a5
    2ae0:	03e00713          	li	a4,62
    2ae4:	f6f768e3          	bltu	a4,a5,2a54 <uart_buffer_read+0x4c>
            uart_cmd_buffer[uart_cmd_index++] = c;
    2ae8:	82d1c703          	lbu	a4,-2003(gp) # 583d <uart_cmd_index>
    2aec:	00170793          	addi	a5,a4,1
    2af0:	0ff7f793          	zext.b	a5,a5
    2af4:	82f186a3          	sb	a5,-2003(gp) # 583d <uart_cmd_index>
    2af8:	97c18793          	addi	a5,gp,-1668 # 598c <uart_cmd_buffer>
    2afc:	00e787b3          	add	a5,a5,a4
    2b00:	00878023          	sb	s0,0(a5)
    2b04:	f55ff06f          	j	2a58 <uart_buffer_read+0x50>
    if (uart_cmd_ready) {
    2b08:	82c1c783          	lbu	a5,-2004(gp) # 583c <uart_cmd_ready>
    2b0c:	0ff7f793          	zext.b	a5,a5
    2b10:	00079a63          	bnez	a5,2b24 <uart_buffer_read+0x11c>
}
    2b14:	00c12083          	lw	ra,12(sp)
    2b18:	00812403          	lw	s0,8(sp)
    2b1c:	01010113          	addi	sp,sp,16
    2b20:	00008067          	ret
        var = uart_cmd_buffer[0];
    2b24:	97c18413          	addi	s0,gp,-1668 # 598c <uart_cmd_buffer>
    2b28:	00044783          	lbu	a5,0(s0)
    2b2c:	0ff7f793          	zext.b	a5,a5
    2b30:	96f18c23          	sb	a5,-1672(gp) # 5988 <var>
        data= atoi(&uart_cmd_buffer[1]);
    2b34:	97d18513          	addi	a0,gp,-1667 # 598d <uart_cmd_buffer+0x1>
    2b38:	d38fe0ef          	jal	1070 <atoi>
    2b3c:	96a1aa23          	sw	a0,-1676(gp) # 5984 <data>
        char_data= uart_cmd_buffer[1];
    2b40:	00144783          	lbu	a5,1(s0)
    2b44:	0ff7f793          	zext.b	a5,a5
    2b48:	96f18823          	sb	a5,-1680(gp) # 5980 <char_data>
}
    2b4c:	fc9ff06f          	j	2b14 <uart_buffer_read+0x10c>

00002b50 <settings>:
    if (uart_cmd_ready)
    2b50:	82c1c783          	lbu	a5,-2004(gp) # 583c <uart_cmd_ready>
    2b54:	0ff7f793          	zext.b	a5,a5
    2b58:	3a078263          	beqz	a5,2efc <settings+0x3ac>
{
    2b5c:	ff010113          	addi	sp,sp,-16
    2b60:	00112623          	sw	ra,12(sp)
    {uart_cmd_ready = false; // Reset command ready flag
    2b64:	82018623          	sb	zero,-2004(gp) # 583c <uart_cmd_ready>
        switch (var)
    2b68:	9781c783          	lbu	a5,-1672(gp) # 5988 <var>
    2b6c:	fd078793          	addi	a5,a5,-48
    2b70:	0ff7f693          	zext.b	a3,a5
    2b74:	01500713          	li	a4,21
    2b78:	36d76863          	bltu	a4,a3,2ee8 <settings+0x398>
    2b7c:	00269793          	slli	a5,a3,0x2
    2b80:	00005737          	lui	a4,0x5
    2b84:	fb070713          	addi	a4,a4,-80 # 4fb0 <_data+0xb30>
    2b88:	00e787b3          	add	a5,a5,a4
    2b8c:	0007a783          	lw	a5,0(a5)
    2b90:	00078067          	jr	a5
            if (char_data == 'a')
    2b94:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2b98:	0ff7f793          	zext.b	a5,a5
    2b9c:	06100713          	li	a4,97
    2ba0:	06e78c63          	beq	a5,a4,2c18 <settings+0xc8>
            else if (char_data == 'b')
    2ba4:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2ba8:	0ff7f793          	zext.b	a5,a5
    2bac:	06200713          	li	a4,98
    2bb0:	06e78e63          	beq	a5,a4,2c2c <settings+0xdc>
            else if (char_data == 'c')
    2bb4:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2bb8:	0ff7f793          	zext.b	a5,a5
    2bbc:	06300713          	li	a4,99
    2bc0:	08e78263          	beq	a5,a4,2c44 <settings+0xf4>
            else if (char_data == 'd')
    2bc4:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2bc8:	0ff7f793          	zext.b	a5,a5
    2bcc:	06400713          	li	a4,100
    2bd0:	08e78663          	beq	a5,a4,2c5c <settings+0x10c>
            else if (char_data == 'e')
    2bd4:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2bd8:	0ff7f793          	zext.b	a5,a5
    2bdc:	06500713          	li	a4,101
    2be0:	08e78a63          	beq	a5,a4,2c74 <settings+0x124>
            else if (char_data == 'f')
    2be4:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2be8:	0ff7f793          	zext.b	a5,a5
    2bec:	06600713          	li	a4,102
    2bf0:	08e78e63          	beq	a5,a4,2c8c <settings+0x13c>
            else if (char_data == 'g')
    2bf4:	9701c783          	lbu	a5,-1680(gp) # 5980 <char_data>
    2bf8:	0ff7f793          	zext.b	a5,a5
    2bfc:	06700713          	li	a4,103
    2c00:	0ae78263          	beq	a5,a4,2ca4 <settings+0x154>
                bsp_printf("Invalid Demo Mode: %c\n\r", char_data);
    2c04:	9701c583          	lbu	a1,-1680(gp) # 5980 <char_data>
    2c08:	00005537          	lui	a0,0x5
    2c0c:	98450513          	addi	a0,a0,-1660 # 4984 <_data+0x504>
    2c10:	865ff0ef          	jal	2474 <bsp_printf>
    2c14:	0c00006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 0;
    2c18:	8201aa23          	sw	zero,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: a\n\r");
    2c1c:	00005537          	lui	a0,0x5
    2c20:	8dc50513          	addi	a0,a0,-1828 # 48dc <_data+0x45c>
    2c24:	851ff0ef          	jal	2474 <bsp_printf>
    2c28:	0ac0006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 1;
    2c2c:	00100713          	li	a4,1
    2c30:	82e1aa23          	sw	a4,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: b\n\r");
    2c34:	00005537          	lui	a0,0x5
    2c38:	8f450513          	addi	a0,a0,-1804 # 48f4 <_data+0x474>
    2c3c:	839ff0ef          	jal	2474 <bsp_printf>
    2c40:	0940006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 2;
    2c44:	00200713          	li	a4,2
    2c48:	82e1aa23          	sw	a4,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: c\n\r");
    2c4c:	00005537          	lui	a0,0x5
    2c50:	90c50513          	addi	a0,a0,-1780 # 490c <_data+0x48c>
    2c54:	821ff0ef          	jal	2474 <bsp_printf>
    2c58:	07c0006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 3;
    2c5c:	00300713          	li	a4,3
    2c60:	82e1aa23          	sw	a4,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: d\n\r");
    2c64:	00005537          	lui	a0,0x5
    2c68:	92450513          	addi	a0,a0,-1756 # 4924 <_data+0x4a4>
    2c6c:	809ff0ef          	jal	2474 <bsp_printf>
    2c70:	0640006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 4;
    2c74:	00400713          	li	a4,4
    2c78:	82e1aa23          	sw	a4,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: e\n\r");
    2c7c:	00005537          	lui	a0,0x5
    2c80:	93c50513          	addi	a0,a0,-1732 # 493c <_data+0x4bc>
    2c84:	ff0ff0ef          	jal	2474 <bsp_printf>
    2c88:	04c0006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 5;
    2c8c:	00500713          	li	a4,5
    2c90:	82e1aa23          	sw	a4,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: f\n\r");
    2c94:	00005537          	lui	a0,0x5
    2c98:	95450513          	addi	a0,a0,-1708 # 4954 <_data+0x4d4>
    2c9c:	fd8ff0ef          	jal	2474 <bsp_printf>
    2ca0:	0340006f          	j	2cd4 <settings+0x184>
                select_demo_mode = 6;
    2ca4:	00600713          	li	a4,6
    2ca8:	82e1aa23          	sw	a4,-1996(gp) # 5844 <select_demo_mode>
                bsp_printf("Selected Demo Mode: g\n\r");
    2cac:	00005537          	lui	a0,0x5
    2cb0:	96c50513          	addi	a0,a0,-1684 # 496c <_data+0x4ec>
    2cb4:	fc0ff0ef          	jal	2474 <bsp_printf>
    2cb8:	01c0006f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 0, data);
    2cbc:	9741a603          	lw	a2,-1676(gp) # 5984 <data>
    2cc0:	01061613          	slli	a2,a2,0x10
    2cc4:	01065613          	srli	a2,a2,0x10
    2cc8:	00000593          	li	a1,0
    2ccc:	00000513          	li	a0,0
    2cd0:	d80ff0ef          	jal	2250 <Set_Gain>
}
    2cd4:	00c12083          	lw	ra,12(sp)
    2cd8:	01010113          	addi	sp,sp,16
    2cdc:	00008067          	ret
            Set_Gain(0, 1, data);
    2ce0:	9741a603          	lw	a2,-1676(gp) # 5984 <data>
    2ce4:	01061613          	slli	a2,a2,0x10
    2ce8:	01065613          	srli	a2,a2,0x10
    2cec:	00100593          	li	a1,1
    2cf0:	00000513          	li	a0,0
    2cf4:	d5cff0ef          	jal	2250 <Set_Gain>
            break;
    2cf8:	fddff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 2, data);
    2cfc:	9741a603          	lw	a2,-1676(gp) # 5984 <data>
    2d00:	01061613          	slli	a2,a2,0x10
    2d04:	01065613          	srli	a2,a2,0x10
    2d08:	00200593          	li	a1,2
    2d0c:	00000513          	li	a0,0
    2d10:	d40ff0ef          	jal	2250 <Set_Gain>
            break;
    2d14:	fc1ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 3, data);
    2d18:	9741a603          	lw	a2,-1676(gp) # 5984 <data>
    2d1c:	01061613          	slli	a2,a2,0x10
    2d20:	01065613          	srli	a2,a2,0x10
    2d24:	00300593          	li	a1,3
    2d28:	00000513          	li	a0,0
    2d2c:	d24ff0ef          	jal	2250 <Set_Gain>
            break;
    2d30:	fa5ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 4, data);
    2d34:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2d38:	01071713          	slli	a4,a4,0x10
    2d3c:	01075713          	srli	a4,a4,0x10
        *((volatile u32*) address) = data;
    2d40:	f81007b7          	lui	a5,0xf8100
    2d44:	02e7a023          	sw	a4,32(a5) # f8100020 <__freertos_irq_stack_top+0xf80f9650>
	bsp_uDelay(DELAY_BUSY);
    2d48:	f8b00637          	lui	a2,0xf8b00
    2d4c:	05f5e5b7          	lui	a1,0x5f5e
    2d50:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2d54:	00500513          	li	a0,5
    2d58:	9c8ff0ef          	jal	1f20 <clint_uDelay>
}
    2d5c:	f79ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 5, data);
    2d60:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2d64:	01071713          	slli	a4,a4,0x10
    2d68:	01075713          	srli	a4,a4,0x10
    2d6c:	f81007b7          	lui	a5,0xf8100
    2d70:	02e7a223          	sw	a4,36(a5) # f8100024 <__freertos_irq_stack_top+0xf80f9654>
	bsp_uDelay(DELAY_BUSY);
    2d74:	f8b00637          	lui	a2,0xf8b00
    2d78:	05f5e5b7          	lui	a1,0x5f5e
    2d7c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2d80:	00500513          	li	a0,5
    2d84:	99cff0ef          	jal	1f20 <clint_uDelay>
}
    2d88:	f4dff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 6, data);
    2d8c:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2d90:	01071713          	slli	a4,a4,0x10
    2d94:	01075713          	srli	a4,a4,0x10
    2d98:	f81007b7          	lui	a5,0xf8100
    2d9c:	02e7a423          	sw	a4,40(a5) # f8100028 <__freertos_irq_stack_top+0xf80f9658>
	bsp_uDelay(DELAY_BUSY);
    2da0:	f8b00637          	lui	a2,0xf8b00
    2da4:	05f5e5b7          	lui	a1,0x5f5e
    2da8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2dac:	00500513          	li	a0,5
    2db0:	970ff0ef          	jal	1f20 <clint_uDelay>
}
    2db4:	f21ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 7, data);
    2db8:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2dbc:	01071713          	slli	a4,a4,0x10
    2dc0:	01075713          	srli	a4,a4,0x10
    2dc4:	f81007b7          	lui	a5,0xf8100
    2dc8:	02e7a623          	sw	a4,44(a5) # f810002c <__freertos_irq_stack_top+0xf80f965c>
	bsp_uDelay(DELAY_BUSY);
    2dcc:	f8b00637          	lui	a2,0xf8b00
    2dd0:	05f5e5b7          	lui	a1,0x5f5e
    2dd4:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2dd8:	00500513          	li	a0,5
    2ddc:	944ff0ef          	jal	1f20 <clint_uDelay>
}
    2de0:	ef5ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 8, data);
    2de4:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2de8:	01071713          	slli	a4,a4,0x10
    2dec:	01075713          	srli	a4,a4,0x10
    2df0:	f81007b7          	lui	a5,0xf8100
    2df4:	02e7a823          	sw	a4,48(a5) # f8100030 <__freertos_irq_stack_top+0xf80f9660>
	bsp_uDelay(DELAY_BUSY);
    2df8:	f8b00637          	lui	a2,0xf8b00
    2dfc:	05f5e5b7          	lui	a1,0x5f5e
    2e00:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2e04:	00500513          	li	a0,5
    2e08:	918ff0ef          	jal	1f20 <clint_uDelay>
}
    2e0c:	ec9ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 9, data);
    2e10:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2e14:	01071713          	slli	a4,a4,0x10
    2e18:	01075713          	srli	a4,a4,0x10
    2e1c:	f81007b7          	lui	a5,0xf8100
    2e20:	02e7aa23          	sw	a4,52(a5) # f8100034 <__freertos_irq_stack_top+0xf80f9664>
	bsp_uDelay(DELAY_BUSY);
    2e24:	f8b00637          	lui	a2,0xf8b00
    2e28:	05f5e5b7          	lui	a1,0x5f5e
    2e2c:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2e30:	00500513          	li	a0,5
    2e34:	8ecff0ef          	jal	1f20 <clint_uDelay>
}
    2e38:	e9dff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 10, data);
    2e3c:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2e40:	01071713          	slli	a4,a4,0x10
    2e44:	01075713          	srli	a4,a4,0x10
    2e48:	f81007b7          	lui	a5,0xf8100
    2e4c:	02e7ac23          	sw	a4,56(a5) # f8100038 <__freertos_irq_stack_top+0xf80f9668>
	bsp_uDelay(DELAY_BUSY);
    2e50:	f8b00637          	lui	a2,0xf8b00
    2e54:	05f5e5b7          	lui	a1,0x5f5e
    2e58:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2e5c:	00500513          	li	a0,5
    2e60:	8c0ff0ef          	jal	1f20 <clint_uDelay>
}
    2e64:	e71ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 11, data);
    2e68:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2e6c:	01071713          	slli	a4,a4,0x10
    2e70:	01075713          	srli	a4,a4,0x10
    2e74:	f81007b7          	lui	a5,0xf8100
    2e78:	02e7ae23          	sw	a4,60(a5) # f810003c <__freertos_irq_stack_top+0xf80f966c>
	bsp_uDelay(DELAY_BUSY);
    2e7c:	f8b00637          	lui	a2,0xf8b00
    2e80:	05f5e5b7          	lui	a1,0x5f5e
    2e84:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2e88:	00500513          	li	a0,5
    2e8c:	894ff0ef          	jal	1f20 <clint_uDelay>
}
    2e90:	e45ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 12, data);
    2e94:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
	u32 data = setting;
    2e98:	01071713          	slli	a4,a4,0x10
    2e9c:	01075713          	srli	a4,a4,0x10
    2ea0:	f81007b7          	lui	a5,0xf8100
    2ea4:	04e7a023          	sw	a4,64(a5) # f8100040 <__freertos_irq_stack_top+0xf80f9670>
	bsp_uDelay(DELAY_BUSY);
    2ea8:	f8b00637          	lui	a2,0xf8b00
    2eac:	05f5e5b7          	lui	a1,0x5f5e
    2eb0:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2eb4:	00500513          	li	a0,5
    2eb8:	868ff0ef          	jal	1f20 <clint_uDelay>
}
    2ebc:	e19ff06f          	j	2cd4 <settings+0x184>
            Set_Gain(0, 13, data);
    2ec0:	9741a703          	lw	a4,-1676(gp) # 5984 <data>
		data &= 0x3;
    2ec4:	00377713          	andi	a4,a4,3
    2ec8:	f81007b7          	lui	a5,0xf8100
    2ecc:	04e7a223          	sw	a4,68(a5) # f8100044 <__freertos_irq_stack_top+0xf80f9674>
	bsp_uDelay(DELAY_BUSY);
    2ed0:	f8b00637          	lui	a2,0xf8b00
    2ed4:	05f5e5b7          	lui	a1,0x5f5e
    2ed8:	10058593          	addi	a1,a1,256 # 5f5e100 <__freertos_irq_stack_top+0x5f57730>
    2edc:	00500513          	li	a0,5
    2ee0:	840ff0ef          	jal	1f20 <clint_uDelay>
}
    2ee4:	df1ff06f          	j	2cd4 <settings+0x184>
            bsp_printf("Unknown command: %c (demo modes: D+a-g, gains: 0-9/A/B/C/E+value)\n\r", var);
    2ee8:	9781c583          	lbu	a1,-1672(gp) # 5988 <var>
    2eec:	00005537          	lui	a0,0x5
    2ef0:	99c50513          	addi	a0,a0,-1636 # 499c <_data+0x51c>
    2ef4:	d80ff0ef          	jal	2474 <bsp_printf>
}
    2ef8:	dddff06f          	j	2cd4 <settings+0x184>
    2efc:	00008067          	ret

00002f00 <externalInterrupt>:
{
    2f00:	ff010113          	addi	sp,sp,-16
    2f04:	00112623          	sw	ra,12(sp)
    2f08:	00812423          	sw	s0,8(sp)
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2f0c:	01c0006f          	j	2f28 <externalInterrupt+0x28>
            uart_buffer_read();
    2f10:	af9ff0ef          	jal	2a08 <uart_buffer_read>
            settings();
    2f14:	c3dff0ef          	jal	2b50 <settings>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); // unmask the claimed interrupt
    2f18:	00040613          	mv	a2,s0
    2f1c:	00000593          	li	a1,0
    2f20:	f8c00537          	lui	a0,0xf8c00
    2f24:	b10ff0ef          	jal	2234 <plic_release>
    while (claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0))
    2f28:	00000593          	li	a1,0
    2f2c:	f8c00537          	lui	a0,0xf8c00
    2f30:	ae8ff0ef          	jal	2218 <plic_claim>
    2f34:	00050413          	mv	s0,a0
    2f38:	02050e63          	beqz	a0,2f74 <externalInterrupt+0x74>
        switch (claim)
    2f3c:	00100793          	li	a5,1
    2f40:	fcf408e3          	beq	s0,a5,2f10 <externalInterrupt+0x10>
    2f44:	00600793          	li	a5,6
    2f48:	02f41263          	bne	s0,a5,2f6c <externalInterrupt+0x6c>
            if (display_mm2s_active && !(dmasg_busy(DMASG_BASE, DMASG_DISPLAY_MM2S_CHANNEL)))
    2f4c:	8301a783          	lw	a5,-2000(gp) # 5840 <display_mm2s_active>
    2f50:	fc0784e3          	beqz	a5,2f18 <externalInterrupt+0x18>
    2f54:	00200593          	li	a1,2
    2f58:	f8110537          	lui	a0,0xf8110
    2f5c:	cecff0ef          	jal	2448 <dmasg_busy>
    2f60:	fa051ce3          	bnez	a0,2f18 <externalInterrupt+0x18>
                trigger_next_display_dma();
    2f64:	9f1ff0ef          	jal	2954 <trigger_next_display_dma>
    2f68:	fb1ff06f          	j	2f18 <externalInterrupt+0x18>
            crash();
    2f6c:	c95fe0ef          	jal	1c00 <crash>
            break;
    2f70:	fa9ff06f          	j	2f18 <externalInterrupt+0x18>
}
    2f74:	00c12083          	lw	ra,12(sp)
    2f78:	00812403          	lw	s0,8(sp)
    2f7c:	01010113          	addi	sp,sp,16
    2f80:	00008067          	ret

00002f84 <ispExample_menu>:
{
    2f84:	ff010113          	addi	sp,sp,-16
    2f88:	00112623          	sw	ra,12(sp)
    2f8c:	00812423          	sw	s0,8(sp)
    bsp_printf("================================================================================ \n\r");
    2f90:	00005437          	lui	s0,0x5
    2f94:	9e040513          	addi	a0,s0,-1568 # 49e0 <_data+0x560>
    2f98:	cdcff0ef          	jal	2474 <bsp_printf>
    bsp_printf("                    ISP Example Design Scenario Selection\n\r");
    2f9c:	00005537          	lui	a0,0x5
    2fa0:	a3450513          	addi	a0,a0,-1484 # 4a34 <_data+0x5b4>
    2fa4:	cd0ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("================================================================================ \n\r");
    2fa8:	9e040513          	addi	a0,s0,-1568
    2fac:	cc8ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'Da' : Camera Capture + HDMI Display                                             \n\r");
    2fb0:	00005537          	lui	a0,0x5
    2fb4:	a7050513          	addi	a0,a0,-1424 # 4a70 <_data+0x5f0>
    2fb8:	cbcff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'Db' : Camera Capture + RGB2Grayscale (SW) + HDMI Display                        \n\r");
    2fbc:	00005537          	lui	a0,0x5
    2fc0:	ac450513          	addi	a0,a0,-1340 # 4ac4 <_data+0x644>
    2fc4:	cb0ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'Dc' : Camera Capture + RGB2Grayscale (SW) + Sobel (HW) + HDMI Display           \n\r");
    2fc8:	00005537          	lui	a0,0x5
    2fcc:	b1850513          	addi	a0,a0,-1256 # 4b18 <_data+0x698>
    2fd0:	ca4ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'Dd' : Camera Capture + RGB2Grayscale (HW) + HDMI Display                        \n\r");
    2fd4:	00005537          	lui	a0,0x5
    2fd8:	b6c50513          	addi	a0,a0,-1172 # 4b6c <_data+0x6ec>
    2fdc:	c98ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'De' : Camera Capture + RGB2Grayscale & Sobel (HW) + HDMI Display                \n\r");
    2fe0:	00005537          	lui	a0,0x5
    2fe4:	bc050513          	addi	a0,a0,-1088 # 4bc0 <_data+0x740>
    2fe8:	c8cff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'Df' : Camera Capture + RGB2Grayscale & Sobel & Dilation (HW) + HDMI Display     \n\r");
    2fec:	00005537          	lui	a0,0x5
    2ff0:	c1450513          	addi	a0,a0,-1004 # 4c14 <_data+0x794>
    2ff4:	c80ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("'Dg' : Camera Capture + RGB2Grayscale & Sobel & Erosion  (HW) + HDMI Display     \n\r");
    2ff8:	00005537          	lui	a0,0x5
    2ffc:	c6850513          	addi	a0,a0,-920 # 4c68 <_data+0x7e8>
    3000:	c74ff0ef          	jal	2474 <bsp_printf>
    bsp_printf("================================================================================ \n\n\r");
    3004:	00005537          	lui	a0,0x5
    3008:	cbc50513          	addi	a0,a0,-836 # 4cbc <_data+0x83c>
    300c:	c68ff0ef          	jal	2474 <bsp_printf>
}
    3010:	00c12083          	lw	ra,12(sp)
    3014:	00812403          	lw	s0,8(sp)
    3018:	01010113          	addi	sp,sp,16
    301c:	00008067          	ret

00003020 <i2c_masterBusy>:
        return *((volatile u32*) address);
    3020:	04052503          	lw	a0,64(a0)
* @return      Returns 1 if the I2C master is busy, and 0 otherwise.
*
******************************************************************************/
    static int i2c_masterBusy(u32 reg){
        return (read_u32(reg + I2C_MASTER_STATUS) & I2C_MASTER_BUSY) != 0;
    }
    3024:	00157513          	andi	a0,a0,1
    3028:	00008067          	ret

0000302c <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    302c:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3030:	21000793          	li	a5,528
    3034:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3038:	00072783          	lw	a5,0(a4)
* @return      None.
*
******************************************************************************/
    static void i2c_masterStartBlocking(u32 reg){
        i2c_masterStart(reg);
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    303c:	0107f793          	andi	a5,a5,16
    3040:	fe079ce3          	bnez	a5,3038 <i2c_masterStartBlocking+0xc>
    }
    3044:	00008067          	ret

00003048 <i2c_masterStopWait>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopWait(u32 reg){
    3048:	ff010113          	addi	sp,sp,-16
    304c:	00112623          	sw	ra,12(sp)
    3050:	00812423          	sw	s0,8(sp)
    3054:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3058:	00040513          	mv	a0,s0
    305c:	fc5ff0ef          	jal	3020 <i2c_masterBusy>
    3060:	fe051ce3          	bnez	a0,3058 <i2c_masterStopWait+0x10>
    }
    3064:	00c12083          	lw	ra,12(sp)
    3068:	00812403          	lw	s0,8(sp)
    306c:	01010113          	addi	sp,sp,16
    3070:	00008067          	ret

00003074 <i2c_masterStopBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_masterStopBlocking(u32 reg){
    3074:	ff010113          	addi	sp,sp,-16
    3078:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    307c:	42000713          	li	a4,1056
    3080:	04e52023          	sw	a4,64(a0)
        i2c_masterStop(reg);
        i2c_masterStopWait(reg);
    3084:	fc5ff0ef          	jal	3048 <i2c_masterStopWait>
    }
    3088:	00c12083          	lw	ra,12(sp)
    308c:	01010113          	addi	sp,sp,16
    3090:	00008067          	ret

00003094 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3094:	00452783          	lw	a5,4(a0)
*
* @return      None.
*
******************************************************************************/
    static void i2c_txAckWait(u32 reg){
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3098:	1007f793          	andi	a5,a5,256
    309c:	fe079ce3          	bnez	a5,3094 <i2c_txAckWait>
    }
    30a0:	00008067          	ret

000030a4 <i2c_txNackBlocking>:
* @param reg   The base address of the I2C registers.
*
* @return      None.
*
******************************************************************************/
    static void i2c_txNackBlocking(u32 reg){
    30a4:	ff010113          	addi	sp,sp,-16
    30a8:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    30ac:	30100713          	li	a4,769
    30b0:	00e52223          	sw	a4,4(a0)
        i2c_txNack(reg);
        i2c_txAckWait(reg);
    30b4:	fe1ff0ef          	jal	3094 <i2c_txAckWait>
    }
    30b8:	00c12083          	lw	ra,12(sp)
    30bc:	01010113          	addi	sp,sp,16
    30c0:	00008067          	ret

000030c4 <i2c_rxAck>:
        return *((volatile u32*) address);
    30c4:	00c52503          	lw	a0,12(a0)
*
* @return      1 if ACK signal is detected, otherwise 0.
*
******************************************************************************/
    static int i2c_rxAck(u32 reg){
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    30c8:	0ff57513          	zext.b	a0,a0
    }
    30cc:	00153513          	seqz	a0,a0
    30d0:	00008067          	ret

000030d4 <PiCam_WriteRegData>:
#include "riscv.h"
#include "PiCamDriver.h"
#include "common.h"

void PiCam_WriteRegData(u32 i2c_base, u16 reg, u8 data)
{
    30d4:	fe010113          	addi	sp,sp,-32
    30d8:	00112e23          	sw	ra,28(sp)
    30dc:	00812c23          	sw	s0,24(sp)
    30e0:	00912a23          	sw	s1,20(sp)
    30e4:	01212823          	sw	s2,16(sp)
    30e8:	01312623          	sw	s3,12(sp)
    30ec:	00050413          	mv	s0,a0
    30f0:	00058493          	mv	s1,a1
    30f4:	00060913          	mv	s2,a2
   u8 outdata;

   i2c_masterStartBlocking(i2c_base);
    30f8:	f35ff0ef          	jal	302c <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    30fc:	000017b7          	lui	a5,0x1
    3100:	b2078793          	addi	a5,a5,-1248 # b20 <CUSTOM2+0xac5>
    3104:	00f42023          	sw	a5,0(s0)

   i2c_txByte(i2c_base, 0x10 << 1);
   i2c_txNackBlocking(i2c_base);
    3108:	00040513          	mv	a0,s0
    310c:	f99ff0ef          	jal	30a4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3110:	00040513          	mv	a0,s0
    3114:	fb1ff0ef          	jal	30c4 <i2c_rxAck>
    3118:	ca1fe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg >> 8) & 0xFF);
    311c:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3120:	000019b7          	lui	s3,0x1
    3124:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3128:	0137e7b3          	or	a5,a5,s3
    312c:	00f42023          	sw	a5,0(s0)
   i2c_txNackBlocking(i2c_base);
    3130:	00040513          	mv	a0,s0
    3134:	f71ff0ef          	jal	30a4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3138:	00040513          	mv	a0,s0
    313c:	f89ff0ef          	jal	30c4 <i2c_rxAck>
    3140:	c79fe0ef          	jal	1db8 <assert>

   i2c_txByte(i2c_base, (reg) & 0xFF);
    3144:	0ff4f493          	zext.b	s1,s1
    3148:	0134e4b3          	or	s1,s1,s3
    314c:	00942023          	sw	s1,0(s0)
   i2c_txNackBlocking(i2c_base);
    3150:	00040513          	mv	a0,s0
    3154:	f51ff0ef          	jal	30a4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3158:	00040513          	mv	a0,s0
    315c:	f69ff0ef          	jal	30c4 <i2c_rxAck>
    3160:	c59fe0ef          	jal	1db8 <assert>
    3164:	01396933          	or	s2,s2,s3
    3168:	01242023          	sw	s2,0(s0)

   i2c_txByte(i2c_base, data & 0xFF);
   i2c_txNackBlocking(i2c_base);
    316c:	00040513          	mv	a0,s0
    3170:	f35ff0ef          	jal	30a4 <i2c_txNackBlocking>
   assert(i2c_rxAck(i2c_base)); // Optional check
    3174:	00040513          	mv	a0,s0
    3178:	f4dff0ef          	jal	30c4 <i2c_rxAck>
    317c:	c3dfe0ef          	jal	1db8 <assert>

   i2c_masterStopBlocking(i2c_base);
    3180:	00040513          	mv	a0,s0
    3184:	ef1ff0ef          	jal	3074 <i2c_masterStopBlocking>
}
    3188:	01c12083          	lw	ra,28(sp)
    318c:	01812403          	lw	s0,24(sp)
    3190:	01412483          	lw	s1,20(sp)
    3194:	01012903          	lw	s2,16(sp)
    3198:	00c12983          	lw	s3,12(sp)
    319c:	02010113          	addi	sp,sp,32
    31a0:	00008067          	ret

000031a4 <AccessCommSeq>:
   i2c_masterStopBlocking(i2c_base);

   return outdata;
}
void AccessCommSeq(u32 i2c_base)
{
    31a4:	ff010113          	addi	sp,sp,-16
    31a8:	00112623          	sw	ra,12(sp)
    31ac:	00812423          	sw	s0,8(sp)
    31b0:	00050413          	mv	s0,a0
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    31b4:	00500613          	li	a2,5
    31b8:	000035b7          	lui	a1,0x3
    31bc:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x17>
    31c0:	f15ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x0C);
    31c4:	00c00613          	li	a2,12
    31c8:	000035b7          	lui	a1,0x3
    31cc:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x17>
    31d0:	00040513          	mv	a0,s0
    31d4:	f01ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300A, 0xFF);
    31d8:	0ff00613          	li	a2,255
    31dc:	000035b7          	lui	a1,0x3
    31e0:	00a58593          	addi	a1,a1,10 # 300a <ispExample_menu+0x86>
    31e4:	00040513          	mv	a0,s0
    31e8:	eedff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x300B, 0xFF);
    31ec:	0ff00613          	li	a2,255
    31f0:	000035b7          	lui	a1,0x3
    31f4:	00b58593          	addi	a1,a1,11 # 300b <ispExample_menu+0x87>
    31f8:	00040513          	mv	a0,s0
    31fc:	ed9ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x05);
    3200:	00500613          	li	a2,5
    3204:	000035b7          	lui	a1,0x3
    3208:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x17>
    320c:	00040513          	mv	a0,s0
    3210:	ec5ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, 0x30EB, 0x09);
    3214:	00900613          	li	a2,9
    3218:	000035b7          	lui	a1,0x3
    321c:	0eb58593          	addi	a1,a1,235 # 30eb <PiCam_WriteRegData+0x17>
    3220:	00040513          	mv	a0,s0
    3224:	eb1ff0ef          	jal	30d4 <PiCam_WriteRegData>
}
    3228:	00c12083          	lw	ra,12(sp)
    322c:	00812403          	lw	s0,8(sp)
    3230:	01010113          	addi	sp,sp,16
    3234:	00008067          	ret

00003238 <PiCam_Output_Size>:

void PiCam_Output_Size(u32 i2c_base, u16 X, u16 Y)
{
    3238:	ff010113          	addi	sp,sp,-16
    323c:	00112623          	sw	ra,12(sp)
    3240:	00812423          	sw	s0,8(sp)
    3244:	00912223          	sw	s1,4(sp)
    3248:	01212023          	sw	s2,0(sp)
    324c:	00050413          	mv	s0,a0
    3250:	00058913          	mv	s2,a1
    3254:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, x_output_size_A_1, X >> 8);
    3258:	0085d613          	srli	a2,a1,0x8
    325c:	16c00593          	li	a1,364
    3260:	e75ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, x_output_size_A_0, X & 0xFF);
    3264:	0ff97613          	zext.b	a2,s2
    3268:	16d00593          	li	a1,365
    326c:	00040513          	mv	a0,s0
    3270:	e65ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_1, Y >> 8);
    3274:	0084d613          	srli	a2,s1,0x8
    3278:	16e00593          	li	a1,366
    327c:	00040513          	mv	a0,s0
    3280:	e55ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, y_output_size_A_0, Y & 0xFF);
    3284:	0ff4f613          	zext.b	a2,s1
    3288:	16f00593          	li	a1,367
    328c:	00040513          	mv	a0,s0
    3290:	e45ff0ef          	jal	30d4 <PiCam_WriteRegData>
}
    3294:	00c12083          	lw	ra,12(sp)
    3298:	00812403          	lw	s0,8(sp)
    329c:	00412483          	lw	s1,4(sp)
    32a0:	00012903          	lw	s2,0(sp)
    32a4:	01010113          	addi	sp,sp,16
    32a8:	00008067          	ret

000032ac <PiCam_Output_activePixel>:

void PiCam_Output_activePixel(u32 i2c_base, u16 XStart, u16 XEnd, u16 YStart, u16 YEnd)
{
    32ac:	fe010113          	addi	sp,sp,-32
    32b0:	00112e23          	sw	ra,28(sp)
    32b4:	00812c23          	sw	s0,24(sp)
    32b8:	00912a23          	sw	s1,20(sp)
    32bc:	01212823          	sw	s2,16(sp)
    32c0:	01312623          	sw	s3,12(sp)
    32c4:	01412423          	sw	s4,8(sp)
    32c8:	00050413          	mv	s0,a0
    32cc:	00058a13          	mv	s4,a1
    32d0:	00060993          	mv	s3,a2
    32d4:	00068913          	mv	s2,a3
    32d8:	00070493          	mv	s1,a4
   // Max Active pixel 3280* 2464--imx219
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_1, XStart >> 8);
    32dc:	0085d613          	srli	a2,a1,0x8
    32e0:	16400593          	li	a1,356
    32e4:	df1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_STA_A_0, XStart & 0xFF);
    32e8:	0ffa7613          	zext.b	a2,s4
    32ec:	16500593          	li	a1,357
    32f0:	00040513          	mv	a0,s0
    32f4:	de1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_1, XEnd >> 8);
    32f8:	0089d613          	srli	a2,s3,0x8
    32fc:	16600593          	li	a1,358
    3300:	00040513          	mv	a0,s0
    3304:	dd1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, X_ADD_END_A_0, XEnd & 0xFF);
    3308:	0ff9f613          	zext.b	a2,s3
    330c:	16700593          	li	a1,359
    3310:	00040513          	mv	a0,s0
    3314:	dc1ff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_1, YStart >> 8);
    3318:	00895613          	srli	a2,s2,0x8
    331c:	16800593          	li	a1,360
    3320:	00040513          	mv	a0,s0
    3324:	db1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_STA_A_0, YStart & 0xFF);
    3328:	0ff97613          	zext.b	a2,s2
    332c:	16900593          	li	a1,361
    3330:	00040513          	mv	a0,s0
    3334:	da1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
    3338:	0084d613          	srli	a2,s1,0x8
    333c:	16a00593          	li	a1,362
    3340:	00040513          	mv	a0,s0
    3344:	d91ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
    3348:	0ff4f613          	zext.b	a2,s1
    334c:	16b00593          	li	a1,363
    3350:	00040513          	mv	a0,s0
    3354:	d81ff0ef          	jal	30d4 <PiCam_WriteRegData>
}
    3358:	01c12083          	lw	ra,28(sp)
    335c:	01812403          	lw	s0,24(sp)
    3360:	01412483          	lw	s1,20(sp)
    3364:	01012903          	lw	s2,16(sp)
    3368:	00c12983          	lw	s3,12(sp)
    336c:	00812a03          	lw	s4,8(sp)
    3370:	02010113          	addi	sp,sp,32
    3374:	00008067          	ret

00003378 <PiCam_SetBinningMode>:
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_1, YEnd >> 8);
   PiCam_WriteRegData(i2c_base, Y_ADD_END_A_0, YEnd & 0xFF);
}

void PiCam_SetBinningMode(u32 i2c_base, u8 Xmode, u8 Ymode)
{
    3378:	ff010113          	addi	sp,sp,-16
    337c:	00112623          	sw	ra,12(sp)
    3380:	00812423          	sw	s0,8(sp)
    3384:	00912223          	sw	s1,4(sp)
    3388:	00050493          	mv	s1,a0
    338c:	00060413          	mv	s0,a2
   // 0:no-binning
   // 1:x2-binning
   // 2:x4-binning
   // 3:x2 analog (special)

   if (Xmode >= 3)
    3390:	00200793          	li	a5,2
    3394:	00b7f463          	bgeu	a5,a1,339c <PiCam_SetBinningMode+0x24>
      Xmode = 3;
    3398:	00300593          	li	a1,3
   if (Ymode >= 3)
    339c:	00200793          	li	a5,2
    33a0:	0087f463          	bgeu	a5,s0,33a8 <PiCam_SetBinningMode+0x30>
      Ymode = 3;
    33a4:	00300413          	li	s0,3

   PiCam_WriteRegData(i2c_base, BINNING_MODE_H_A, Xmode);
    33a8:	00058613          	mv	a2,a1
    33ac:	17400593          	li	a1,372
    33b0:	00048513          	mv	a0,s1
    33b4:	d21ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, BINNING_MODE_V_A, Ymode);
    33b8:	00040613          	mv	a2,s0
    33bc:	17500593          	li	a1,373
    33c0:	00048513          	mv	a0,s1
    33c4:	d11ff0ef          	jal	30d4 <PiCam_WriteRegData>
}
    33c8:	00c12083          	lw	ra,12(sp)
    33cc:	00812403          	lw	s0,8(sp)
    33d0:	00412483          	lw	s1,4(sp)
    33d4:	01010113          	addi	sp,sp,16
    33d8:	00008067          	ret

000033dc <PiCam_Gainfilter>:

   PiCam_Output_ColorBarSize(i2c_base, X, Y);
}

void PiCam_Gainfilter(u32 i2c_base, u8 AGain, u16 DGain)
{
    33dc:	ff010113          	addi	sp,sp,-16
    33e0:	00112623          	sw	ra,12(sp)
    33e4:	00812423          	sw	s0,8(sp)
    33e8:	00912223          	sw	s1,4(sp)
    33ec:	00050413          	mv	s0,a0
    33f0:	00060493          	mv	s1,a2
   PiCam_WriteRegData(i2c_base, ANA_GAIN_GLOBAL_A, AGain & 0xFF);
    33f4:	00058613          	mv	a2,a1
    33f8:	15700593          	li	a1,343
    33fc:	cd9ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_1, (DGain >> 8) & 0x0F);
    3400:	0084d613          	srli	a2,s1,0x8
    3404:	00f67613          	andi	a2,a2,15
    3408:	15800593          	li	a1,344
    340c:	00040513          	mv	a0,s0
    3410:	cc5ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DIG_GAIN_GLOBAL_A_0, DGain & 0xFF);
    3414:	0ff4f613          	zext.b	a2,s1
    3418:	15900593          	li	a1,345
    341c:	00040513          	mv	a0,s0
    3420:	cb5ff0ef          	jal	30d4 <PiCam_WriteRegData>
}
    3424:	00c12083          	lw	ra,12(sp)
    3428:	00812403          	lw	s0,8(sp)
    342c:	00412483          	lw	s1,4(sp)
    3430:	01010113          	addi	sp,sp,16
    3434:	00008067          	ret

00003438 <PiCam_init>:

// For cam1
void PiCam_init(u32 i2c_base)
{
    3438:	ff010113          	addi	sp,sp,-16
    343c:	00112623          	sw	ra,12(sp)
    3440:	00812423          	sw	s0,8(sp)
    3444:	00050413          	mv	s0,a0

   PiCam_WriteRegData(i2c_base, mode_select, 0x00);
    3448:	00000613          	li	a2,0
    344c:	10000593          	li	a1,256
    3450:	c85ff0ef          	jal	30d4 <PiCam_WriteRegData>
   AccessCommSeq(i2c_base);
    3454:	00040513          	mv	a0,s0
    3458:	d4dff0ef          	jal	31a4 <AccessCommSeq>
   PiCam_WriteRegData(i2c_base, CSI_LANE_MODE, 0x01);
    345c:	00100613          	li	a2,1
    3460:	11400593          	li	a1,276
    3464:	00040513          	mv	a0,s0
    3468:	c6dff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, DPHY_CTRL, 0x00);
    346c:	00000613          	li	a2,0
    3470:	12800593          	li	a1,296
    3474:	00040513          	mv	a0,s0
    3478:	c5dff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_1, 0x18);
    347c:	01800613          	li	a2,24
    3480:	12a00593          	li	a1,298
    3484:	00040513          	mv	a0,s0
    3488:	c4dff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, EXCK_FREQ_0, 0x00);
    348c:	00000613          	li	a2,0
    3490:	12b00593          	li	a1,299
    3494:	00040513          	mv	a0,s0
    3498:	c3dff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x04);
    349c:	00400613          	li	a2,4
    34a0:	16000593          	li	a1,352
    34a4:	00040513          	mv	a0,s0
    34a8:	c2dff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0x59);
    34ac:	05900613          	li	a2,89
    34b0:	16100593          	li	a1,353
    34b4:	00040513          	mv	a0,s0
    34b8:	c1dff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    34bc:	00d00613          	li	a2,13
    34c0:	16200593          	li	a1,354
    34c4:	00040513          	mv	a0,s0
    34c8:	c0dff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    34cc:	07800613          	li	a2,120
    34d0:	16300593          	li	a1,355
    34d4:	00040513          	mv	a0,s0
    34d8:	bfdff0ef          	jal	30d4 <PiCam_WriteRegData>

   //   PiCam_Output_activePixel(i2c_base, 0, 3279, 0, 2463);
   PiCam_Output_activePixel(i2c_base, 680, 2599, 692, 1771); // Capture centre of sensor
    34dc:	6eb00713          	li	a4,1771
    34e0:	2b400693          	li	a3,692
    34e4:	00001637          	lui	a2,0x1
    34e8:	a2760613          	addi	a2,a2,-1497 # a27 <CUSTOM2+0x9cc>
    34ec:	2a800593          	li	a1,680
    34f0:	00040513          	mv	a0,s0
    34f4:	db9ff0ef          	jal	32ac <PiCam_Output_activePixel>

   PiCam_Output_Size(i2c_base, 1920, 1080);
    34f8:	43800613          	li	a2,1080
    34fc:	78000593          	li	a1,1920
    3500:	00040513          	mv	a0,s0
    3504:	d35ff0ef          	jal	3238 <PiCam_Output_Size>
   // PiCam_Output_Size(i2c_base, 1280, 720);
   // PiCam_Output_Size(i2c_base, 640, 480);

   PiCam_WriteRegData(i2c_base, X_ODD_INC_A, 0x01);
    3508:	00100613          	li	a2,1
    350c:	17000593          	li	a1,368
    3510:	00040513          	mv	a0,s0
    3514:	bc1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, Y_ODD_INC_A, 0x01);
    3518:	00100613          	li	a2,1
    351c:	17100593          	li	a1,369
    3520:	00040513          	mv	a0,s0
    3524:	bb1ff0ef          	jal	30d4 <PiCam_WriteRegData>

   // 0: No binning; 1: x2 binning; 2: x4 binning; 3: x2 binning (analog special)
   PiCam_SetBinningMode(i2c_base, 0, 0);
    3528:	00000613          	li	a2,0
    352c:	00000593          	li	a1,0
    3530:	00040513          	mv	a0,s0
    3534:	e45ff0ef          	jal	3378 <PiCam_SetBinningMode>

   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_1, 0x0A);
    3538:	00a00613          	li	a2,10
    353c:	18c00593          	li	a1,396
    3540:	00040513          	mv	a0,s0
    3544:	b91ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, CSI_DATA_FORMAT_A_0, 0x0A);
    3548:	00a00613          	li	a2,10
    354c:	18d00593          	li	a1,397
    3550:	00040513          	mv	a0,s0
    3554:	b81ff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, VTPXCK_DIV, 0x05);
    3558:	00500613          	li	a2,5
    355c:	30100593          	li	a1,769
    3560:	00040513          	mv	a0,s0
    3564:	b71ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, VTSYCK_DIV, 0x01);
    3568:	00100613          	li	a2,1
    356c:	30300593          	li	a1,771
    3570:	00040513          	mv	a0,s0
    3574:	b61ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_VT_DIV, 0x03);
    3578:	00300613          	li	a2,3
    357c:	30400593          	li	a1,772
    3580:	00040513          	mv	a0,s0
    3584:	b51ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PREPLLCK_OP_DIV, 0x03);
    3588:	00300613          	li	a2,3
    358c:	30500593          	li	a1,773
    3590:	00040513          	mv	a0,s0
    3594:	b41ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_1, 0x00);
    3598:	00000613          	li	a2,0
    359c:	30600593          	li	a1,774
    35a0:	00040513          	mv	a0,s0
    35a4:	b31ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_VT_MPY_0, 0x39);
    35a8:	03900613          	li	a2,57
    35ac:	30700593          	li	a1,775
    35b0:	00040513          	mv	a0,s0
    35b4:	b21ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    35b8:	00a00613          	li	a2,10
    35bc:	30900593          	li	a1,777
    35c0:	00040513          	mv	a0,s0
    35c4:	b11ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    35c8:	00100613          	li	a2,1
    35cc:	30b00593          	li	a1,779
    35d0:	00040513          	mv	a0,s0
    35d4:	b01ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    35d8:	00000613          	li	a2,0
    35dc:	30c00593          	li	a1,780
    35e0:	00040513          	mv	a0,s0
    35e4:	af1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    35e8:	07200613          	li	a2,114
    35ec:	30d00593          	li	a1,781
    35f0:	00040513          	mv	a0,s0
    35f4:	ae1ff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, OPPXCK_DIV, 0x0A);
    35f8:	00a00613          	li	a2,10
    35fc:	30900593          	li	a1,777
    3600:	00040513          	mv	a0,s0
    3604:	ad1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, OPSYCK_DIV, 0x01);
    3608:	00100613          	li	a2,1
    360c:	30b00593          	li	a1,779
    3610:	00040513          	mv	a0,s0
    3614:	ac1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_1, 0x00);
    3618:	00000613          	li	a2,0
    361c:	30c00593          	li	a1,780
    3620:	00040513          	mv	a0,s0
    3624:	ab1ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, PLL_OP_MPY_0, 0x72);
    3628:	07200613          	li	a2,114
    362c:	30d00593          	li	a1,781
    3630:	00040513          	mv	a0,s0
    3634:	aa1ff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, mode_select, 0x01);
    3638:	00100613          	li	a2,1
    363c:	10000593          	li	a1,256
    3640:	00040513          	mv	a0,s0
    3644:	a91ff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_Gainfilter(i2c_base, 0xB9, 0x200);
    3648:	20000613          	li	a2,512
    364c:	0b900593          	li	a1,185
    3650:	00040513          	mv	a0,s0
    3654:	d89ff0ef          	jal	33dc <PiCam_Gainfilter>

   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_1, 0x0D);
    3658:	00d00613          	li	a2,13
    365c:	16200593          	li	a1,354
    3660:	00040513          	mv	a0,s0
    3664:	a71ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, LINE_LENGTH_A_0, 0x78);
    3668:	07800613          	li	a2,120
    366c:	16300593          	li	a1,355
    3670:	00040513          	mv	a0,s0
    3674:	a61ff0ef          	jal	30d4 <PiCam_WriteRegData>
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
      PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
   */

   // Longer camera exposure time, suitable for low light condition. Trade-off with lower frame rate.
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_1, 0x06);
    3678:	00600613          	li	a2,6
    367c:	16000593          	li	a1,352
    3680:	00040513          	mv	a0,s0
    3684:	a51ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, FRM_LENGTH_A_0, 0xE3);
    3688:	0e300613          	li	a2,227
    368c:	16100593          	li	a1,353
    3690:	00040513          	mv	a0,s0
    3694:	a41ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_1, 0x04);
    3698:	00400613          	li	a2,4
    369c:	15a00593          	li	a1,346
    36a0:	00040513          	mv	a0,s0
    36a4:	a31ff0ef          	jal	30d4 <PiCam_WriteRegData>
   PiCam_WriteRegData(i2c_base, COARSE_INTEGRATION_TIME_A_0, 0x54);
    36a8:	05400613          	li	a2,84
    36ac:	15b00593          	li	a1,347
    36b0:	00040513          	mv	a0,s0
    36b4:	a21ff0ef          	jal	30d4 <PiCam_WriteRegData>

   PiCam_WriteRegData(i2c_base, IMG_ORIENTATION_A, 0x00);
    36b8:	00000613          	li	a2,0
    36bc:	17200593          	li	a1,370
    36c0:	00040513          	mv	a0,s0
    36c4:	a11ff0ef          	jal	30d4 <PiCam_WriteRegData>
}
    36c8:	00c12083          	lw	ra,12(sp)
    36cc:	00812403          	lw	s0,8(sp)
    36d0:	01010113          	addi	sp,sp,16
    36d4:	00008067          	ret

000036d8 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    36d8:	04050713          	addi	a4,a0,64
    36dc:	21000793          	li	a5,528
    36e0:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    36e4:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    36e8:	0107f793          	andi	a5,a5,16
    36ec:	fe079ce3          	bnez	a5,36e4 <i2c_masterStartBlocking+0xc>
    }
    36f0:	00008067          	ret

000036f4 <i2c_txAckWait>:
    36f4:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    36f8:	1007f793          	andi	a5,a5,256
    36fc:	fe079ce3          	bnez	a5,36f4 <i2c_txAckWait>
    }
    3700:	00008067          	ret

00003704 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3704:	ff010113          	addi	sp,sp,-16
    3708:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    370c:	30100713          	li	a4,769
    3710:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3714:	fe1ff0ef          	jal	36f4 <i2c_txAckWait>
    }
    3718:	00c12083          	lw	ra,12(sp)
    371c:	01010113          	addi	sp,sp,16
    3720:	00008067          	ret

00003724 <i2c_rxAck>:
        return *((volatile u32*) address);
    3724:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3728:	0ff57513          	zext.b	a0,a0
    }
    372c:	00153513          	seqz	a0,a0
    3730:	00008067          	ret

00003734 <uart_writeAvailability>:
    3734:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3738:	01055513          	srli	a0,a0,0x10
    }
    373c:	0ff57513          	zext.b	a0,a0
    3740:	00008067          	ret

00003744 <uart_write>:
    static void uart_write(u32 reg, char data){
    3744:	ff010113          	addi	sp,sp,-16
    3748:	00112623          	sw	ra,12(sp)
    374c:	00812423          	sw	s0,8(sp)
    3750:	00912223          	sw	s1,4(sp)
    3754:	00050413          	mv	s0,a0
    3758:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    375c:	00040513          	mv	a0,s0
    3760:	fd5ff0ef          	jal	3734 <uart_writeAvailability>
    3764:	fe050ce3          	beqz	a0,375c <uart_write+0x18>
        *((volatile u32*) address) = data;
    3768:	00942023          	sw	s1,0(s0)
    }
    376c:	00c12083          	lw	ra,12(sp)
    3770:	00812403          	lw	s0,8(sp)
    3774:	00412483          	lw	s1,4(sp)
    3778:	01010113          	addi	sp,sp,16
    377c:	00008067          	ret

00003780 <_putchar>:
    static void _putchar(char character){
    3780:	ff010113          	addi	sp,sp,-16
    3784:	00112623          	sw	ra,12(sp)
    3788:	00050593          	mv	a1,a0
            bsp_putChar(character);
    378c:	f8010537          	lui	a0,0xf8010
    3790:	fb5ff0ef          	jal	3744 <uart_write>
    }
    3794:	00c12083          	lw	ra,12(sp)
    3798:	01010113          	addi	sp,sp,16
    379c:	00008067          	ret

000037a0 <_putchar_s>:
    {
    37a0:	ff010113          	addi	sp,sp,-16
    37a4:	00112623          	sw	ra,12(sp)
    37a8:	00812423          	sw	s0,8(sp)
    37ac:	00050413          	mv	s0,a0
        while (*p)
    37b0:	00c0006f          	j	37bc <_putchar_s+0x1c>
            _putchar(*(p++));
    37b4:	00140413          	addi	s0,s0,1
    37b8:	fc9ff0ef          	jal	3780 <_putchar>
        while (*p)
    37bc:	00044503          	lbu	a0,0(s0)
    37c0:	fe051ae3          	bnez	a0,37b4 <_putchar_s+0x14>
    }
    37c4:	00c12083          	lw	ra,12(sp)
    37c8:	00812403          	lw	s0,8(sp)
    37cc:	01010113          	addi	sp,sp,16
    37d0:	00008067          	ret

000037d4 <bsp_printHex>:
    {
    37d4:	ff010113          	addi	sp,sp,-16
    37d8:	00112623          	sw	ra,12(sp)
    37dc:	00812423          	sw	s0,8(sp)
    37e0:	00912223          	sw	s1,4(sp)
    37e4:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    37e8:	01c00413          	li	s0,28
    37ec:	0240006f          	j	3810 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
    37f0:	0084d733          	srl	a4,s1,s0
    37f4:	00f77713          	andi	a4,a4,15
    37f8:	000047b7          	lui	a5,0x4
    37fc:	48078793          	addi	a5,a5,1152 # 4480 <_data>
    3800:	00e787b3          	add	a5,a5,a4
    3804:	0007c503          	lbu	a0,0(a5)
    3808:	f79ff0ef          	jal	3780 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    380c:	ffc40413          	addi	s0,s0,-4
    3810:	fe0450e3          	bgez	s0,37f0 <bsp_printHex+0x1c>
    }
    3814:	00c12083          	lw	ra,12(sp)
    3818:	00812403          	lw	s0,8(sp)
    381c:	00412483          	lw	s1,4(sp)
    3820:	01010113          	addi	sp,sp,16
    3824:	00008067          	ret

00003828 <bsp_printHex_lower>:
    {
    3828:	ff010113          	addi	sp,sp,-16
    382c:	00112623          	sw	ra,12(sp)
    3830:	00812423          	sw	s0,8(sp)
    3834:	00912223          	sw	s1,4(sp)
    3838:	00050493          	mv	s1,a0
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    383c:	01c00413          	li	s0,28
    3840:	0240006f          	j	3864 <bsp_printHex_lower+0x3c>
            _putchar("0123456789abcdef"[(val >> i) % 16]);
    3844:	0084d733          	srl	a4,s1,s0
    3848:	00f77713          	andi	a4,a4,15
    384c:	000047b7          	lui	a5,0x4
    3850:	49478793          	addi	a5,a5,1172 # 4494 <_data+0x14>
    3854:	00e787b3          	add	a5,a5,a4
    3858:	0007c503          	lbu	a0,0(a5)
    385c:	f25ff0ef          	jal	3780 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
    3860:	ffc40413          	addi	s0,s0,-4
    3864:	fe0450e3          	bgez	s0,3844 <bsp_printHex_lower+0x1c>
    }
    3868:	00c12083          	lw	ra,12(sp)
    386c:	00812403          	lw	s0,8(sp)
    3870:	00412483          	lw	s1,4(sp)
    3874:	01010113          	addi	sp,sp,16
    3878:	00008067          	ret

0000387c <bsp_printf_c>:
    {
    387c:	ff010113          	addi	sp,sp,-16
    3880:	00112623          	sw	ra,12(sp)
        _putchar(c);
    3884:	0ff57513          	zext.b	a0,a0
    3888:	ef9ff0ef          	jal	3780 <_putchar>
    }
    388c:	00c12083          	lw	ra,12(sp)
    3890:	01010113          	addi	sp,sp,16
    3894:	00008067          	ret

00003898 <bsp_printf_s>:
    {
    3898:	ff010113          	addi	sp,sp,-16
    389c:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
    38a0:	f01ff0ef          	jal	37a0 <_putchar_s>
    }
    38a4:	00c12083          	lw	ra,12(sp)
    38a8:	01010113          	addi	sp,sp,16
    38ac:	00008067          	ret

000038b0 <bsp_printf_d>:
    {
    38b0:	fd010113          	addi	sp,sp,-48
    38b4:	02112623          	sw	ra,44(sp)
    38b8:	02812423          	sw	s0,40(sp)
    38bc:	02912223          	sw	s1,36(sp)
    38c0:	00050493          	mv	s1,a0
        if (val < 0) {
    38c4:	00054663          	bltz	a0,38d0 <bsp_printf_d+0x20>
    {
    38c8:	00010413          	mv	s0,sp
    38cc:	02c0006f          	j	38f8 <bsp_printf_d+0x48>
            bsp_printf_c('-');
    38d0:	02d00513          	li	a0,45
    38d4:	fa9ff0ef          	jal	387c <bsp_printf_c>
            val = -val;
    38d8:	409004b3          	neg	s1,s1
    38dc:	fedff06f          	j	38c8 <bsp_printf_d+0x18>
            *(p++) = '0' + val % 10;
    38e0:	00a00713          	li	a4,10
    38e4:	02e4e7b3          	rem	a5,s1,a4
    38e8:	03078793          	addi	a5,a5,48
    38ec:	00f40023          	sb	a5,0(s0)
            val = val / 10;
    38f0:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
    38f4:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
    38f8:	fe0494e3          	bnez	s1,38e0 <bsp_printf_d+0x30>
    38fc:	00010793          	mv	a5,sp
    3900:	fef400e3          	beq	s0,a5,38e0 <bsp_printf_d+0x30>
        while (p != buffer)
    3904:	00010793          	mv	a5,sp
    3908:	00f40a63          	beq	s0,a5,391c <bsp_printf_d+0x6c>
            bsp_printf_c(*(--p));
    390c:	fff40413          	addi	s0,s0,-1
    3910:	00044503          	lbu	a0,0(s0)
    3914:	f69ff0ef          	jal	387c <bsp_printf_c>
    3918:	fedff06f          	j	3904 <bsp_printf_d+0x54>
    }
    391c:	02c12083          	lw	ra,44(sp)
    3920:	02812403          	lw	s0,40(sp)
    3924:	02412483          	lw	s1,36(sp)
    3928:	03010113          	addi	sp,sp,48
    392c:	00008067          	ret

00003930 <bsp_printf_x>:
    {
    3930:	ff010113          	addi	sp,sp,-16
    3934:	00112623          	sw	ra,12(sp)
        for(i=0;i<8;i++)
    3938:	00000713          	li	a4,0
    393c:	00700793          	li	a5,7
    3940:	02e7c063          	blt	a5,a4,3960 <bsp_printf_x+0x30>
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3944:	00271693          	slli	a3,a4,0x2
    3948:	ff000793          	li	a5,-16
    394c:	00d797b3          	sll	a5,a5,a3
    3950:	00f577b3          	and	a5,a0,a5
    3954:	00078663          	beqz	a5,3960 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
    3958:	00170713          	addi	a4,a4,1
    395c:	fe1ff06f          	j	393c <bsp_printf_x+0xc>
        bsp_printHex_lower(val);
    3960:	ec9ff0ef          	jal	3828 <bsp_printHex_lower>
    }
    3964:	00c12083          	lw	ra,12(sp)
    3968:	01010113          	addi	sp,sp,16
    396c:	00008067          	ret

00003970 <bsp_printf_X>:
        {
    3970:	ff010113          	addi	sp,sp,-16
    3974:	00112623          	sw	ra,12(sp)
            for(i=0;i<8;i++)
    3978:	00000713          	li	a4,0
    397c:	00700793          	li	a5,7
    3980:	02e7c063          	blt	a5,a4,39a0 <bsp_printf_X+0x30>
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
    3984:	00271693          	slli	a3,a4,0x2
    3988:	ff000793          	li	a5,-16
    398c:	00d797b3          	sll	a5,a5,a3
    3990:	00f577b3          	and	a5,a0,a5
    3994:	00078663          	beqz	a5,39a0 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
    3998:	00170713          	addi	a4,a4,1
    399c:	fe1ff06f          	j	397c <bsp_printf_X+0xc>
            bsp_printHex(val);
    39a0:	e35ff0ef          	jal	37d4 <bsp_printHex>
        }
    39a4:	00c12083          	lw	ra,12(sp)
    39a8:	01010113          	addi	sp,sp,16
    39ac:	00008067          	ret

000039b0 <mipi_i2c_probe>:
// -------------------------------------------------------
// I2C
// -------------------------------------------------------

static int mipi_i2c_probe(u32 i2cCtrl, u8 slaveAddress)
{
    39b0:	ff010113          	addi	sp,sp,-16
    39b4:	00112623          	sw	ra,12(sp)
    39b8:	00812423          	sw	s0,8(sp)
    39bc:	00912223          	sw	s1,4(sp)
    39c0:	00050413          	mv	s0,a0
    39c4:	00058493          	mv	s1,a1
    i2c_masterStartBlocking(i2cCtrl);
    39c8:	d11ff0ef          	jal	36d8 <i2c_masterStartBlocking>
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    39cc:	000017b7          	lui	a5,0x1
    39d0:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    39d4:	00f4e4b3          	or	s1,s1,a5
    39d8:	00942023          	sw	s1,0(s0)
    i2c_txByte(i2cCtrl, slaveAddress);
    i2c_txNackBlocking(i2cCtrl);
    39dc:	00040513          	mv	a0,s0
    39e0:	d25ff0ef          	jal	3704 <i2c_txNackBlocking>
    return i2c_rxAck(i2cCtrl);
    39e4:	00040513          	mv	a0,s0
    39e8:	d3dff0ef          	jal	3724 <i2c_rxAck>
}
    39ec:	00c12083          	lw	ra,12(sp)
    39f0:	00812403          	lw	s0,8(sp)
    39f4:	00412483          	lw	s1,4(sp)
    39f8:	01010113          	addi	sp,sp,16
    39fc:	00008067          	ret

00003a00 <bsp_printf>:
    {
    3a00:	fc010113          	addi	sp,sp,-64
    3a04:	00112e23          	sw	ra,28(sp)
    3a08:	00812c23          	sw	s0,24(sp)
    3a0c:	00912a23          	sw	s1,20(sp)
    3a10:	00050493          	mv	s1,a0
    3a14:	02b12223          	sw	a1,36(sp)
    3a18:	02c12423          	sw	a2,40(sp)
    3a1c:	02d12623          	sw	a3,44(sp)
    3a20:	02e12823          	sw	a4,48(sp)
    3a24:	02f12a23          	sw	a5,52(sp)
    3a28:	03012c23          	sw	a6,56(sp)
    3a2c:	03112e23          	sw	a7,60(sp)
        va_start(ap, format);
    3a30:	02410793          	addi	a5,sp,36
    3a34:	00f12623          	sw	a5,12(sp)
        for (i = 0; format[i]; i++)
    3a38:	00000413          	li	s0,0
    3a3c:	01c0006f          	j	3a58 <bsp_printf+0x58>
                        bsp_printf_c(va_arg(ap,int));
    3a40:	00c12783          	lw	a5,12(sp)
    3a44:	00478713          	addi	a4,a5,4
    3a48:	00e12623          	sw	a4,12(sp)
    3a4c:	0007a503          	lw	a0,0(a5)
    3a50:	e2dff0ef          	jal	387c <bsp_printf_c>
        for (i = 0; format[i]; i++)
    3a54:	00140413          	addi	s0,s0,1
    3a58:	008487b3          	add	a5,s1,s0
    3a5c:	0007c503          	lbu	a0,0(a5)
    3a60:	0a050e63          	beqz	a0,3b1c <bsp_printf+0x11c>
            if (format[i] == '%') {
    3a64:	02500793          	li	a5,37
    3a68:	06f50e63          	beq	a0,a5,3ae4 <bsp_printf+0xe4>
                bsp_printf_c(format[i]);
    3a6c:	e11ff0ef          	jal	387c <bsp_printf_c>
    3a70:	fe5ff06f          	j	3a54 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
    3a74:	00c12783          	lw	a5,12(sp)
    3a78:	00478713          	addi	a4,a5,4
    3a7c:	00e12623          	sw	a4,12(sp)
    3a80:	0007a503          	lw	a0,0(a5)
    3a84:	e15ff0ef          	jal	3898 <bsp_printf_s>
                        break;
    3a88:	fcdff06f          	j	3a54 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
    3a8c:	00c12783          	lw	a5,12(sp)
    3a90:	00478713          	addi	a4,a5,4
    3a94:	00e12623          	sw	a4,12(sp)
    3a98:	0007a503          	lw	a0,0(a5)
    3a9c:	e15ff0ef          	jal	38b0 <bsp_printf_d>
                        break;
    3aa0:	fb5ff06f          	j	3a54 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
    3aa4:	00c12783          	lw	a5,12(sp)
    3aa8:	00478713          	addi	a4,a5,4
    3aac:	00e12623          	sw	a4,12(sp)
    3ab0:	0007a503          	lw	a0,0(a5)
    3ab4:	ebdff0ef          	jal	3970 <bsp_printf_X>
                        break;
    3ab8:	f9dff06f          	j	3a54 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
    3abc:	00c12783          	lw	a5,12(sp)
    3ac0:	00478713          	addi	a4,a5,4
    3ac4:	00e12623          	sw	a4,12(sp)
    3ac8:	0007a503          	lw	a0,0(a5)
    3acc:	e65ff0ef          	jal	3930 <bsp_printf_x>
                        break;
    3ad0:	f85ff06f          	j	3a54 <bsp_printf+0x54>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
    3ad4:	00004537          	lui	a0,0x4
    3ad8:	4a850513          	addi	a0,a0,1192 # 44a8 <_data+0x28>
    3adc:	dbdff0ef          	jal	3898 <bsp_printf_s>
                        break;
    3ae0:	f75ff06f          	j	3a54 <bsp_printf+0x54>
                while (format[++i]) {
    3ae4:	00140413          	addi	s0,s0,1
    3ae8:	008487b3          	add	a5,s1,s0
    3aec:	0007c783          	lbu	a5,0(a5)
    3af0:	f60782e3          	beqz	a5,3a54 <bsp_printf+0x54>
                    if (format[i] == 'c') {
    3af4:	fa878793          	addi	a5,a5,-88
    3af8:	0ff7f693          	zext.b	a3,a5
    3afc:	02000713          	li	a4,32
    3b00:	fed762e3          	bltu	a4,a3,3ae4 <bsp_printf+0xe4>
    3b04:	00269793          	slli	a5,a3,0x2
    3b08:	00005737          	lui	a4,0x5
    3b0c:	00870713          	addi	a4,a4,8 # 5008 <_data+0xb88>
    3b10:	00e787b3          	add	a5,a5,a4
    3b14:	0007a783          	lw	a5,0(a5)
    3b18:	00078067          	jr	a5
    }
    3b1c:	01c12083          	lw	ra,28(sp)
    3b20:	01812403          	lw	s0,24(sp)
    3b24:	01412483          	lw	s1,20(sp)
    3b28:	04010113          	addi	sp,sp,64
    3b2c:	00008067          	ret

00003b30 <camera_init>:
// -------------------------------------------------------
// Core: probe all known i2c addresses, runs init + stream + set_rgb_gain
// -------------------------------------------------------

static void camera_init(int camSlot, u32 i2cCtrl)
{
    3b30:	fe010113          	addi	sp,sp,-32
    3b34:	00112e23          	sw	ra,28(sp)
    3b38:	00812c23          	sw	s0,24(sp)
    3b3c:	00912a23          	sw	s1,20(sp)
    3b40:	01212823          	sw	s2,16(sp)
    3b44:	01312623          	sw	s3,12(sp)
    3b48:	00050913          	mv	s2,a0
    3b4c:	00058493          	mv	s1,a1
    mipi_i2c_init(i2cCtrl);
    3b50:	00058513          	mv	a0,a1
    3b54:	ab4fe0ef          	jal	1e08 <mipi_i2c_init>

    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3b58:	00000413          	li	s0,0
    3b5c:	00100793          	li	a5,1
    3b60:	0a87e863          	bltu	a5,s0,3c10 <camera_init+0xe0>
    {
        if (mipi_i2c_probe(i2cCtrl, supportedCamera[i].slaveAddress) == 1)
    3b64:	000057b7          	lui	a5,0x5
    3b68:	00241713          	slli	a4,s0,0x2
    3b6c:	00870733          	add	a4,a4,s0
    3b70:	00271713          	slli	a4,a4,0x2
    3b74:	08c78793          	addi	a5,a5,140 # 508c <supportedCamera>
    3b78:	00e787b3          	add	a5,a5,a4
    3b7c:	0007c983          	lbu	s3,0(a5)
    3b80:	00098593          	mv	a1,s3
    3b84:	00048513          	mv	a0,s1
    3b88:	e29ff0ef          	jal	39b0 <mipi_i2c_probe>
    3b8c:	00100793          	li	a5,1
    3b90:	00f50663          	beq	a0,a5,3b9c <camera_init+0x6c>
    for (int i = 0; i < NUM_KNOWN_CAMERAS; i++)
    3b94:	00140413          	addi	s0,s0,1
    3b98:	fc5ff06f          	j	3b5c <camera_init+0x2c>
    3b9c:	01412423          	sw	s4,8(sp)
        {
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
                       camSlot,
                       supportedCamera[i].name,
    3ba0:	00005a37          	lui	s4,0x5
    3ba4:	00241793          	slli	a5,s0,0x2
    3ba8:	008787b3          	add	a5,a5,s0
    3bac:	00279793          	slli	a5,a5,0x2
    3bb0:	08ca0a13          	addi	s4,s4,140 # 508c <supportedCamera>
    3bb4:	00fa0a33          	add	s4,s4,a5
            bsp_printf("Camera%d detected: %s (addr: 0x%02X)\r\n",
    3bb8:	0019d693          	srli	a3,s3,0x1
    3bbc:	008a2603          	lw	a2,8(s4)
    3bc0:	00090593          	mv	a1,s2
    3bc4:	00005537          	lui	a0,0x5
    3bc8:	dc850513          	addi	a0,a0,-568 # 4dc8 <_data+0x948>
    3bcc:	e35ff0ef          	jal	3a00 <bsp_printf>
                       supportedCamera[i].slaveAddress >> 1);

            if (supportedCamera[i].init != NULL)
    3bd0:	00ca2783          	lw	a5,12(s4)
    3bd4:	00078663          	beqz	a5,3be0 <camera_init+0xb0>
                supportedCamera[i].init(i2cCtrl);
    3bd8:	00048513          	mv	a0,s1
    3bdc:	000780e7          	jalr	a5

            if (supportedCamera[i].start_stream != NULL)
    3be0:	000057b7          	lui	a5,0x5
    3be4:	00241713          	slli	a4,s0,0x2
    3be8:	00870733          	add	a4,a4,s0
    3bec:	00271713          	slli	a4,a4,0x2
    3bf0:	08c78793          	addi	a5,a5,140 # 508c <supportedCamera>
    3bf4:	00e787b3          	add	a5,a5,a4
    3bf8:	0107a783          	lw	a5,16(a5)
    3bfc:	04078063          	beqz	a5,3c3c <camera_init+0x10c>
                supportedCamera[i].start_stream(i2cCtrl);
    3c00:	00048513          	mv	a0,s1
    3c04:	000780e7          	jalr	a5
            return;
    3c08:	00812a03          	lw	s4,8(sp)
    3c0c:	0140006f          	j	3c20 <camera_init+0xf0>
        }
    }

    bsp_printf("cam%d detected: None\n", camSlot);
    3c10:	00090593          	mv	a1,s2
    3c14:	00005537          	lui	a0,0x5
    3c18:	df050513          	addi	a0,a0,-528 # 4df0 <_data+0x970>
    3c1c:	de5ff0ef          	jal	3a00 <bsp_printf>
}
    3c20:	01c12083          	lw	ra,28(sp)
    3c24:	01812403          	lw	s0,24(sp)
    3c28:	01412483          	lw	s1,20(sp)
    3c2c:	01012903          	lw	s2,16(sp)
    3c30:	00c12983          	lw	s3,12(sp)
    3c34:	02010113          	addi	sp,sp,32
    3c38:	00008067          	ret
    3c3c:	00812a03          	lw	s4,8(sp)
    3c40:	fe1ff06f          	j	3c20 <camera_init+0xf0>

00003c44 <cam0_init>:

// -------------------------------------------------------
// API - 1 call per camera
// -------------------------------------------------------

void cam0_init(u32 i2cCtrl) { camera_init(0, i2cCtrl); }
    3c44:	ff010113          	addi	sp,sp,-16
    3c48:	00112623          	sw	ra,12(sp)
    3c4c:	00050593          	mv	a1,a0
    3c50:	00000513          	li	a0,0
    3c54:	eddff0ef          	jal	3b30 <camera_init>
    3c58:	00c12083          	lw	ra,12(sp)
    3c5c:	01010113          	addi	sp,sp,16
    3c60:	00008067          	ret

00003c64 <uart_writeAvailability>:
        return *((volatile u32*) address);
    3c64:	00452503          	lw	a0,4(a0)
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
    3c68:	01055513          	srli	a0,a0,0x10
    }
    3c6c:	0ff57513          	zext.b	a0,a0
    3c70:	00008067          	ret

00003c74 <uart_write>:
    static void uart_write(u32 reg, char data){
    3c74:	ff010113          	addi	sp,sp,-16
    3c78:	00112623          	sw	ra,12(sp)
    3c7c:	00812423          	sw	s0,8(sp)
    3c80:	00912223          	sw	s1,4(sp)
    3c84:	00050413          	mv	s0,a0
    3c88:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
    3c8c:	00040513          	mv	a0,s0
    3c90:	fd5ff0ef          	jal	3c64 <uart_writeAvailability>
    3c94:	fe050ce3          	beqz	a0,3c8c <uart_write+0x18>
        *((volatile u32*) address) = data;
    3c98:	00942023          	sw	s1,0(s0)
    }
    3c9c:	00c12083          	lw	ra,12(sp)
    3ca0:	00812403          	lw	s0,8(sp)
    3ca4:	00412483          	lw	s1,4(sp)
    3ca8:	01010113          	addi	sp,sp,16
    3cac:	00008067          	ret

00003cb0 <uart_writeStr>:
    static void uart_writeStr(u32 reg, const char* str){
    3cb0:	ff010113          	addi	sp,sp,-16
    3cb4:	00112623          	sw	ra,12(sp)
    3cb8:	00812423          	sw	s0,8(sp)
    3cbc:	00912223          	sw	s1,4(sp)
    3cc0:	00050493          	mv	s1,a0
    3cc4:	00058413          	mv	s0,a1
        while(*str) uart_write(reg, *str++);
    3cc8:	0100006f          	j	3cd8 <uart_writeStr+0x28>
    3ccc:	00140413          	addi	s0,s0,1
    3cd0:	00048513          	mv	a0,s1
    3cd4:	fa1ff0ef          	jal	3c74 <uart_write>
    3cd8:	00044583          	lbu	a1,0(s0)
    3cdc:	fe0598e3          	bnez	a1,3ccc <uart_writeStr+0x1c>
    }
    3ce0:	00c12083          	lw	ra,12(sp)
    3ce4:	00812403          	lw	s0,8(sp)
    3ce8:	00412483          	lw	s1,4(sp)
    3cec:	01010113          	addi	sp,sp,16
    3cf0:	00008067          	ret

00003cf4 <i2c_masterBusy>:
        return *((volatile u32*) address);
    3cf4:	04052503          	lw	a0,64(a0)
    }
    3cf8:	00157513          	andi	a0,a0,1
    3cfc:	00008067          	ret

00003d00 <i2c_masterStartBlocking>:
        write_u32(I2C_MASTER_START | I2C_MASTER_START_DROPPED, reg + I2C_MASTER_STATUS);
    3d00:	04050713          	addi	a4,a0,64
        *((volatile u32*) address) = data;
    3d04:	21000793          	li	a5,528
    3d08:	04f52023          	sw	a5,64(a0)
        return *((volatile u32*) address);
    3d0c:	00072783          	lw	a5,0(a4)
        while(i2c_getMasterStatus(reg) & I2C_MASTER_START);
    3d10:	0107f793          	andi	a5,a5,16
    3d14:	fe079ce3          	bnez	a5,3d0c <i2c_masterStartBlocking+0xc>
    }
    3d18:	00008067          	ret

00003d1c <i2c_masterStopWait>:
    static void i2c_masterStopWait(u32 reg){
    3d1c:	ff010113          	addi	sp,sp,-16
    3d20:	00112623          	sw	ra,12(sp)
    3d24:	00812423          	sw	s0,8(sp)
    3d28:	00050413          	mv	s0,a0
        while(i2c_masterBusy(reg));
    3d2c:	00040513          	mv	a0,s0
    3d30:	fc5ff0ef          	jal	3cf4 <i2c_masterBusy>
    3d34:	fe051ce3          	bnez	a0,3d2c <i2c_masterStopWait+0x10>
    }
    3d38:	00c12083          	lw	ra,12(sp)
    3d3c:	00812403          	lw	s0,8(sp)
    3d40:	01010113          	addi	sp,sp,16
    3d44:	00008067          	ret

00003d48 <i2c_masterStopBlocking>:
    static void i2c_masterStopBlocking(u32 reg){
    3d48:	ff010113          	addi	sp,sp,-16
    3d4c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3d50:	42000713          	li	a4,1056
    3d54:	04e52023          	sw	a4,64(a0)
        i2c_masterStopWait(reg);
    3d58:	fc5ff0ef          	jal	3d1c <i2c_masterStopWait>
    }
    3d5c:	00c12083          	lw	ra,12(sp)
    3d60:	01010113          	addi	sp,sp,16
    3d64:	00008067          	ret

00003d68 <i2c_txAckWait>:
        return *((volatile u32*) address);
    3d68:	00452783          	lw	a5,4(a0)
        while(read_u32(reg + I2C_TX_ACK) & I2C_TX_VALID);
    3d6c:	1007f793          	andi	a5,a5,256
    3d70:	fe079ce3          	bnez	a5,3d68 <i2c_txAckWait>
    }
    3d74:	00008067          	ret

00003d78 <i2c_txNackBlocking>:
    static void i2c_txNackBlocking(u32 reg){
    3d78:	ff010113          	addi	sp,sp,-16
    3d7c:	00112623          	sw	ra,12(sp)
        *((volatile u32*) address) = data;
    3d80:	30100713          	li	a4,769
    3d84:	00e52223          	sw	a4,4(a0)
        i2c_txAckWait(reg);
    3d88:	fe1ff0ef          	jal	3d68 <i2c_txAckWait>
    }
    3d8c:	00c12083          	lw	ra,12(sp)
    3d90:	01010113          	addi	sp,sp,16
    3d94:	00008067          	ret

00003d98 <i2c_rxAck>:
        return *((volatile u32*) address);
    3d98:	00c52503          	lw	a0,12(a0)
        return (read_u32(reg + I2C_RX_ACK) & I2C_RX_VALUE) == 0;
    3d9c:	0ff57513          	zext.b	a0,a0
    }
    3da0:	00153513          	seqz	a0,a0
    3da4:	00008067          	ret

00003da8 <PiCamV3_WriteRegData>:
#include "riscv.h"
#include "PiCamV3Driver.h"
#include "common.h"

void PiCamV3_WriteRegData(u32 i2c_addr, u16 reg, u8 data)
{
    3da8:	fe010113          	addi	sp,sp,-32
    3dac:	00112e23          	sw	ra,28(sp)
    3db0:	00812c23          	sw	s0,24(sp)
    3db4:	00912a23          	sw	s1,20(sp)
    3db8:	01212823          	sw	s2,16(sp)
    3dbc:	01312623          	sw	s3,12(sp)
    3dc0:	00050413          	mv	s0,a0
    3dc4:	00058493          	mv	s1,a1
    3dc8:	00060913          	mv	s2,a2
	u8 outdata;

	i2c_masterStartBlocking(i2c_addr);
    3dcc:	f35ff0ef          	jal	3d00 <i2c_masterStartBlocking>
        *((volatile u32*) address) = data;
    3dd0:	000017b7          	lui	a5,0x1
    3dd4:	b3478793          	addi	a5,a5,-1228 # b34 <CUSTOM2+0xad9>
    3dd8:	00f42023          	sw	a5,0(s0)

	i2c_txByte(i2c_addr, IMX708_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    3ddc:	00040513          	mv	a0,s0
    3de0:	f99ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3de4:	00040513          	mv	a0,s0
    3de8:	fb1ff0ef          	jal	3d98 <i2c_rxAck>
    3dec:	fcdfd0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg >> 8) & 0xFF);
    3df0:	0084d793          	srli	a5,s1,0x8
        write_u32(byte | I2C_TX_VALID | I2C_TX_ENABLE | I2C_TX_DISABLE_ON_DATA_CONFLICT, reg + I2C_TX_DATA);
    3df4:	000019b7          	lui	s3,0x1
    3df8:	b0098993          	addi	s3,s3,-1280 # b00 <CUSTOM2+0xaa5>
    3dfc:	0137e7b3          	or	a5,a5,s3
    3e00:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3e04:	00040513          	mv	a0,s0
    3e08:	f71ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e0c:	00040513          	mv	a0,s0
    3e10:	f89ff0ef          	jal	3d98 <i2c_rxAck>
    3e14:	fa5fd0ef          	jal	1db8 <assert>

	i2c_txByte(i2c_addr, (reg) & 0xFF);
    3e18:	0ff4f493          	zext.b	s1,s1
    3e1c:	0134e4b3          	or	s1,s1,s3
    3e20:	00942023          	sw	s1,0(s0)
	i2c_txNackBlocking(i2c_addr);
    3e24:	00040513          	mv	a0,s0
    3e28:	f51ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e2c:	00040513          	mv	a0,s0
    3e30:	f69ff0ef          	jal	3d98 <i2c_rxAck>
    3e34:	f85fd0ef          	jal	1db8 <assert>
    3e38:	01396933          	or	s2,s2,s3
    3e3c:	01242023          	sw	s2,0(s0)

	i2c_txByte(i2c_addr, data & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    3e40:	00040513          	mv	a0,s0
    3e44:	f35ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr)); // Optional check
    3e48:	00040513          	mv	a0,s0
    3e4c:	f4dff0ef          	jal	3d98 <i2c_rxAck>
    3e50:	f69fd0ef          	jal	1db8 <assert>

	i2c_masterStopBlocking(i2c_addr);
    3e54:	00040513          	mv	a0,s0
    3e58:	ef1ff0ef          	jal	3d48 <i2c_masterStopBlocking>
}
    3e5c:	01c12083          	lw	ra,28(sp)
    3e60:	01812403          	lw	s0,24(sp)
    3e64:	01412483          	lw	s1,20(sp)
    3e68:	01012903          	lw	s2,16(sp)
    3e6c:	00c12983          	lw	s3,12(sp)
    3e70:	02010113          	addi	sp,sp,32
    3e74:	00008067          	ret

00003e78 <PiCamV3_StartStreaming>:

	return outdata;
}

void PiCamV3_StartStreaming(u32 i2c_addr)
{
    3e78:	ff010113          	addi	sp,sp,-16
    3e7c:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_ACTIVE);
    3e80:	00100613          	li	a2,1
    3e84:	10000593          	li	a1,256
    3e88:	f21ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
}
    3e8c:	00c12083          	lw	ra,12(sp)
    3e90:	01010113          	addi	sp,sp,16
    3e94:	00008067          	ret

00003e98 <PiCamV3_StopStreaming>:

void PiCamV3_StopStreaming(u32 i2c_addr)
{
    3e98:	ff010113          	addi	sp,sp,-16
    3e9c:	00112623          	sw	ra,12(sp)
	PiCamV3_WriteRegData(i2c_addr, IMX708_MODE_SELECT, IMX708_SLEEP);
    3ea0:	00000613          	li	a2,0
    3ea4:	10000593          	li	a1,256
    3ea8:	f01ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
}
    3eac:	00c12083          	lw	ra,12(sp)
    3eb0:	01010113          	addi	sp,sp,16
    3eb4:	00008067          	ret

00003eb8 <PiCamV3_ConfigCommon>:

void PiCamV3_ConfigCommon(u32 i2c_addr)
{
    3eb8:	ff010113          	addi	sp,sp,-16
    3ebc:	00112623          	sw	ra,12(sp)
    3ec0:	00812423          	sw	s0,8(sp)
    3ec4:	00912223          	sw	s1,4(sp)
    3ec8:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3ecc:	00000413          	li	s0,0
    3ed0:	0280006f          	j	3ef8 <PiCamV3_ConfigCommon+0x40>
	{
		PiCamV3_WriteRegData(i2c_addr, mode_common_regs[i].address, mode_common_regs[i].val);
    3ed4:	000057b7          	lui	a5,0x5
    3ed8:	00241713          	slli	a4,s0,0x2
    3edc:	51c78793          	addi	a5,a5,1308 # 551c <mode_common_regs>
    3ee0:	00e787b3          	add	a5,a5,a4
    3ee4:	0027c603          	lbu	a2,2(a5)
    3ee8:	0007d583          	lhu	a1,0(a5)
    3eec:	00048513          	mv	a0,s1
    3ef0:	eb9ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(mode_common_regs) / sizeof(mode_common_regs[0]); i++)
    3ef4:	00140413          	addi	s0,s0,1
    3ef8:	02f00793          	li	a5,47
    3efc:	fc87fce3          	bgeu	a5,s0,3ed4 <PiCamV3_ConfigCommon+0x1c>
	}
}
    3f00:	00c12083          	lw	ra,12(sp)
    3f04:	00812403          	lw	s0,8(sp)
    3f08:	00412483          	lw	s1,4(sp)
    3f0c:	01010113          	addi	sp,sp,16
    3f10:	00008067          	ret

00003f14 <PiCamV3_ConfigFormat>:

void PiCamV3_ConfigFormat(u32 i2c_addr, u8 mode)
{
    3f14:	ff010113          	addi	sp,sp,-16
    3f18:	00112623          	sw	ra,12(sp)
    3f1c:	00912223          	sw	s1,4(sp)
    3f20:	00050493          	mv	s1,a0
	// 	MODE
	//  0 : 1920 x 1080 cropped, 50FPS
	//	1 : 1920 x 1080 2x2 binned, 60 FPS
	//  2 : 1920 x 1080 HDR, 50 FPS

	if (mode == 0)
    3f24:	08058663          	beqz	a1,3fb0 <PiCamV3_ConfigFormat+0x9c>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
		}
	}

	else if (mode == 1)
    3f28:	00100793          	li	a5,1
    3f2c:	0cf58263          	beq	a1,a5,3ff0 <PiCamV3_ConfigFormat+0xdc>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
		}
	}

	else if (mode == 2)
    3f30:	00200793          	li	a5,2
    3f34:	06f59663          	bne	a1,a5,3fa0 <PiCamV3_ConfigFormat+0x8c>
    3f38:	00812423          	sw	s0,8(sp)
	{
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3f3c:	00000413          	li	s0,0
    3f40:	05e00793          	li	a5,94
    3f44:	0a87ec63          	bltu	a5,s0,3ffc <PiCamV3_ConfigFormat+0xe8>
		{
			PiCamV3_WriteRegData(i2c_addr, mode_hdr_1920x1080_regs[i].address, mode_hdr_1920x1080_regs[i].val);
    3f48:	000057b7          	lui	a5,0x5
    3f4c:	00241713          	slli	a4,s0,0x2
    3f50:	0c878793          	addi	a5,a5,200 # 50c8 <mode_hdr_1920x1080_regs>
    3f54:	00e787b3          	add	a5,a5,a4
    3f58:	0027c603          	lbu	a2,2(a5)
    3f5c:	0007d583          	lhu	a1,0(a5)
    3f60:	00048513          	mv	a0,s1
    3f64:	e45ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_hdr_1920x1080_regs) / sizeof(mode_hdr_1920x1080_regs[0]); i++)
    3f68:	00140413          	addi	s0,s0,1
    3f6c:	fd5ff06f          	j	3f40 <PiCamV3_ConfigFormat+0x2c>
			PiCamV3_WriteRegData(i2c_addr, mode_1920x1080_cropped_regs[i].address, mode_1920x1080_cropped_regs[i].val);
    3f70:	000057b7          	lui	a5,0x5
    3f74:	00241713          	slli	a4,s0,0x2
    3f78:	3b078793          	addi	a5,a5,944 # 53b0 <mode_1920x1080_cropped_regs>
    3f7c:	00e787b3          	add	a5,a5,a4
    3f80:	0027c603          	lbu	a2,2(a5)
    3f84:	0007d583          	lhu	a1,0(a5)
    3f88:	00048513          	mv	a0,s1
    3f8c:	e1dff0ef          	jal	3da8 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3f90:	00140413          	addi	s0,s0,1
    3f94:	05a00793          	li	a5,90
    3f98:	fc87fce3          	bgeu	a5,s0,3f70 <PiCamV3_ConfigFormat+0x5c>
    3f9c:	00812403          	lw	s0,8(sp)
		}
	}
}
    3fa0:	00c12083          	lw	ra,12(sp)
    3fa4:	00412483          	lw	s1,4(sp)
    3fa8:	01010113          	addi	sp,sp,16
    3fac:	00008067          	ret
    3fb0:	00812423          	sw	s0,8(sp)
		for (int i = 0; i < sizeof(mode_1920x1080_cropped_regs) / sizeof(mode_1920x1080_cropped_regs[0]); i++)
    3fb4:	00000413          	li	s0,0
    3fb8:	fddff06f          	j	3f94 <PiCamV3_ConfigFormat+0x80>
			PiCamV3_WriteRegData(i2c_addr, mode_2x2binned_1920x1080_regs[i].address, mode_2x2binned_1920x1080_regs[i].val);
    3fbc:	000057b7          	lui	a5,0x5
    3fc0:	00241713          	slli	a4,s0,0x2
    3fc4:	24478793          	addi	a5,a5,580 # 5244 <mode_2x2binned_1920x1080_regs>
    3fc8:	00e787b3          	add	a5,a5,a4
    3fcc:	0027c603          	lbu	a2,2(a5)
    3fd0:	0007d583          	lhu	a1,0(a5)
    3fd4:	00048513          	mv	a0,s1
    3fd8:	dd1ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
		for (int i = 0; i < sizeof(mode_2x2binned_1920x1080_regs) / sizeof(mode_2x2binned_1920x1080_regs[0]); i++)
    3fdc:	00140413          	addi	s0,s0,1
    3fe0:	05a00793          	li	a5,90
    3fe4:	fc87fce3          	bgeu	a5,s0,3fbc <PiCamV3_ConfigFormat+0xa8>
    3fe8:	00812403          	lw	s0,8(sp)
    3fec:	fb5ff06f          	j	3fa0 <PiCamV3_ConfigFormat+0x8c>
    3ff0:	00812423          	sw	s0,8(sp)
    3ff4:	00000413          	li	s0,0
    3ff8:	fe9ff06f          	j	3fe0 <PiCamV3_ConfigFormat+0xcc>
    3ffc:	00812403          	lw	s0,8(sp)
    4000:	fa1ff06f          	j	3fa0 <PiCamV3_ConfigFormat+0x8c>

00004004 <PiCamV3_ConfigLinkFreq>:

void PiCamV3_ConfigLinkFreq(u32 i2c_addr)
{
    4004:	ff010113          	addi	sp,sp,-16
    4008:	00112623          	sw	ra,12(sp)
    400c:	00812423          	sw	s0,8(sp)
    4010:	00912223          	sw	s1,4(sp)
    4014:	00050493          	mv	s1,a0
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    4018:	00000413          	li	s0,0
    401c:	0240006f          	j	4040 <PiCamV3_ConfigLinkFreq+0x3c>
	{
		PiCamV3_WriteRegData(i2c_addr, link_450Mhz_regs[i].address, link_450Mhz_regs[i].val);
    4020:	00241713          	slli	a4,s0,0x2
    4024:	81818793          	addi	a5,gp,-2024 # 5828 <link_450Mhz_regs>
    4028:	00e787b3          	add	a5,a5,a4
    402c:	0027c603          	lbu	a2,2(a5)
    4030:	0007d583          	lhu	a1,0(a5)
    4034:	00048513          	mv	a0,s1
    4038:	d71ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
	for (int i = 0; i < sizeof(link_450Mhz_regs) / sizeof(link_450Mhz_regs[0]); i++)
    403c:	00140413          	addi	s0,s0,1
    4040:	00100793          	li	a5,1
    4044:	fc87fee3          	bgeu	a5,s0,4020 <PiCamV3_ConfigLinkFreq+0x1c>
	}
}
    4048:	00c12083          	lw	ra,12(sp)
    404c:	00812403          	lw	s0,8(sp)
    4050:	00412483          	lw	s1,4(sp)
    4054:	01010113          	addi	sp,sp,16
    4058:	00008067          	ret

0000405c <PiCamV3_ConfigQuadBayerRemosaicAdjustment>:

void PiCamV3_ConfigQuadBayerRemosaicAdjustment(u32 i2c_addr)
{
    405c:	ff010113          	addi	sp,sp,-16
    4060:	00112623          	sw	ra,12(sp)
    4064:	00812423          	sw	s0,8(sp)
    4068:	00050413          	mv	s0,a0
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY_EN, IMX708_LPF_INTENSITY_ENABLED);
    406c:	00000613          	li	a2,0
    4070:	0000c5b7          	lui	a1,0xc
    4074:	42858593          	addi	a1,a1,1064 # c428 <__freertos_irq_stack_top+0x5a58>
    4078:	d31ff0ef          	jal	3da8 <PiCamV3_WriteRegData>
	PiCamV3_WriteRegData(i2c_addr, IMX708_LPF_INTENSITY, 0x04);
    407c:	00400613          	li	a2,4
    4080:	0000c5b7          	lui	a1,0xc
    4084:	42958593          	addi	a1,a1,1065 # c429 <__freertos_irq_stack_top+0x5a59>
    4088:	00040513          	mv	a0,s0
    408c:	d1dff0ef          	jal	3da8 <PiCamV3_WriteRegData>
}
    4090:	00c12083          	lw	ra,12(sp)
    4094:	00812403          	lw	s0,8(sp)
    4098:	01010113          	addi	sp,sp,16
    409c:	00008067          	ret

000040a0 <PiCamV3_SetPdafGain>:

void PiCamV3_SetPdafGain(u32 i2c_addr)
{
    40a0:	fe010113          	addi	sp,sp,-32
    40a4:	00112e23          	sw	ra,28(sp)
    40a8:	00812c23          	sw	s0,24(sp)
    40ac:	00912a23          	sw	s1,20(sp)
    40b0:	01212823          	sw	s2,16(sp)
    40b4:	01312623          	sw	s3,12(sp)
    40b8:	00050993          	mv	s3,a0
	for (int i = 0; i < 54; i++)
    40bc:	00000493          	li	s1,0
    40c0:	0640006f          	j	4124 <PiCamV3_SetPdafGain+0x84>
	{
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_L + i, pdaf_gains[0][i % 9]);
    40c4:	01049913          	slli	s2,s1,0x10
    40c8:	01095913          	srli	s2,s2,0x10
    40cc:	00900793          	li	a5,9
    40d0:	02f4e7b3          	rem	a5,s1,a5
    40d4:	00005437          	lui	s0,0x5
    40d8:	0b440413          	addi	s0,s0,180 # 50b4 <pdaf_gains>
    40dc:	00f40433          	add	s0,s0,a5
    40e0:	000085b7          	lui	a1,0x8
    40e4:	b1058593          	addi	a1,a1,-1264 # 7b10 <__freertos_irq_stack_top+0x1140>
    40e8:	00b905b3          	add	a1,s2,a1
    40ec:	00044603          	lbu	a2,0(s0)
    40f0:	01059593          	slli	a1,a1,0x10
    40f4:	0105d593          	srli	a1,a1,0x10
    40f8:	00098513          	mv	a0,s3
    40fc:	cadff0ef          	jal	3da8 <PiCamV3_WriteRegData>
		PiCamV3_WriteRegData(i2c_addr, IMX708_REG_BASE_SPC_GAINS_R + i, pdaf_gains[1][i % 9]);
    4100:	000087b7          	lui	a5,0x8
    4104:	c0078793          	addi	a5,a5,-1024 # 7c00 <__freertos_irq_stack_top+0x1230>
    4108:	00f905b3          	add	a1,s2,a5
    410c:	00944603          	lbu	a2,9(s0)
    4110:	01059593          	slli	a1,a1,0x10
    4114:	0105d593          	srli	a1,a1,0x10
    4118:	00098513          	mv	a0,s3
    411c:	c8dff0ef          	jal	3da8 <PiCamV3_WriteRegData>
	for (int i = 0; i < 54; i++)
    4120:	00148493          	addi	s1,s1,1
    4124:	03500793          	li	a5,53
    4128:	f897dee3          	bge	a5,s1,40c4 <PiCamV3_SetPdafGain+0x24>
	}
}
    412c:	01c12083          	lw	ra,28(sp)
    4130:	01812403          	lw	s0,24(sp)
    4134:	01412483          	lw	s1,20(sp)
    4138:	01012903          	lw	s2,16(sp)
    413c:	00c12983          	lw	s3,12(sp)
    4140:	02010113          	addi	sp,sp,32
    4144:	00008067          	ret

00004148 <PiCamV3_OnActuator>:
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN, (val & 0xFF00) >> 8);
	PiCamV3_WriteRegData(i2c_addr, IMX708_REG_DIGITAL_GAIN + 1, val & 0xFF);
}

void PiCamV3_OnActuator(u32 i2c_addr)
{
    4148:	ff010113          	addi	sp,sp,-16
    414c:	00112623          	sw	ra,12(sp)
    4150:	00812423          	sw	s0,8(sp)
    4154:	00050413          	mv	s0,a0
	// Turn on actuator
	i2c_masterStartBlocking(i2c_addr);
    4158:	ba9ff0ef          	jal	3d00 <i2c_masterStartBlocking>
    415c:	000017b7          	lui	a5,0x1
    4160:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    4164:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4168:	00040513          	mv	a0,s0
    416c:	c0dff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4170:	00040513          	mv	a0,s0
    4174:	c25ff0ef          	jal	3d98 <i2c_rxAck>
    4178:	c41fd0ef          	jal	1db8 <assert>
    417c:	000017b7          	lui	a5,0x1
    4180:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4184:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4188:	00040513          	mv	a0,s0
    418c:	bedff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4190:	00040513          	mv	a0,s0
    4194:	c05ff0ef          	jal	3d98 <i2c_rxAck>
    4198:	c21fd0ef          	jal	1db8 <assert>
    419c:	000017b7          	lui	a5,0x1
    41a0:	b0078793          	addi	a5,a5,-1280 # b00 <CUSTOM2+0xaa5>
    41a4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_ACTIVE);
	i2c_txNackBlocking(i2c_addr);
    41a8:	00040513          	mv	a0,s0
    41ac:	bcdff0ef          	jal	3d78 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    41b0:	00040513          	mv	a0,s0
    41b4:	b95ff0ef          	jal	3d48 <i2c_masterStopBlocking>
}
    41b8:	00c12083          	lw	ra,12(sp)
    41bc:	00812403          	lw	s0,8(sp)
    41c0:	01010113          	addi	sp,sp,16
    41c4:	00008067          	ret

000041c8 <PiCamV3_OffActuator>:

void PiCamV3_OffActuator(u32 i2c_addr)
{
    41c8:	ff010113          	addi	sp,sp,-16
    41cc:	00112623          	sw	ra,12(sp)
    41d0:	00812423          	sw	s0,8(sp)
    41d4:	00050413          	mv	s0,a0
	// Turn off actuator
	i2c_masterStartBlocking(i2c_addr);
    41d8:	b29ff0ef          	jal	3d00 <i2c_masterStartBlocking>
    41dc:	000017b7          	lui	a5,0x1
    41e0:	b1878793          	addi	a5,a5,-1256 # b18 <CUSTOM2+0xabd>
    41e4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    41e8:	00040513          	mv	a0,s0
    41ec:	b8dff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    41f0:	00040513          	mv	a0,s0
    41f4:	ba5ff0ef          	jal	3d98 <i2c_rxAck>
    41f8:	bc1fd0ef          	jal	1db8 <assert>
    41fc:	000017b7          	lui	a5,0x1
    4200:	b0278793          	addi	a5,a5,-1278 # b02 <CUSTOM2+0xaa7>
    4204:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_CTL_ADDR);
	i2c_txNackBlocking(i2c_addr);
    4208:	00040513          	mv	a0,s0
    420c:	b6dff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4210:	00040513          	mv	a0,s0
    4214:	b85ff0ef          	jal	3d98 <i2c_rxAck>
    4218:	ba1fd0ef          	jal	1db8 <assert>
    421c:	000017b7          	lui	a5,0x1
    4220:	b0178793          	addi	a5,a5,-1279 # b01 <CUSTOM2+0xaa6>
    4224:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_SLEEP);
	i2c_txNackBlocking(i2c_addr);
    4228:	00040513          	mv	a0,s0
    422c:	b4dff0ef          	jal	3d78 <i2c_txNackBlocking>
	i2c_masterStopBlocking(i2c_addr);
    4230:	00040513          	mv	a0,s0
    4234:	b15ff0ef          	jal	3d48 <i2c_masterStopBlocking>
}
    4238:	00c12083          	lw	ra,12(sp)
    423c:	00812403          	lw	s0,8(sp)
    4240:	01010113          	addi	sp,sp,16
    4244:	00008067          	ret

00004248 <PiCamV3_SetFocusStep>:

void PiCamV3_SetFocusStep(u32 i2c_addr, u32 focus_step)
{
    4248:	fe010113          	addi	sp,sp,-32
    424c:	00112e23          	sw	ra,28(sp)
    4250:	00812c23          	sw	s0,24(sp)
    4254:	00912a23          	sw	s1,20(sp)
    4258:	01212823          	sw	s2,16(sp)
    425c:	01312623          	sw	s3,12(sp)
    4260:	00050413          	mv	s0,a0
    4264:	00058493          	mv	s1,a1
	if (focus_step >= DW9807_MAX_FOCUS_POS)
    4268:	3fe00793          	li	a5,1022
    426c:	00b7f463          	bgeu	a5,a1,4274 <PiCamV3_SetFocusStep+0x2c>
		focus_step = DW9807_MAX_FOCUS_POS;
    4270:	3ff00493          	li	s1,1023
	else if (focus_step <= 0)
		focus_step = 0;

	i2c_masterStartBlocking(i2c_addr);
    4274:	00040513          	mv	a0,s0
    4278:	a89ff0ef          	jal	3d00 <i2c_masterStartBlocking>
    427c:	000019b7          	lui	s3,0x1
    4280:	b1898993          	addi	s3,s3,-1256 # b18 <CUSTOM2+0xabd>
    4284:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    4288:	00040513          	mv	a0,s0
    428c:	aedff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4290:	00040513          	mv	a0,s0
    4294:	b05ff0ef          	jal	3d98 <i2c_rxAck>
    4298:	b21fd0ef          	jal	1db8 <assert>
    429c:	000017b7          	lui	a5,0x1
    42a0:	b0378793          	addi	a5,a5,-1277 # b03 <CUSTOM2+0xaa8>
    42a4:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_MSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    42a8:	00040513          	mv	a0,s0
    42ac:	acdff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    42b0:	00040513          	mv	a0,s0
    42b4:	ae5ff0ef          	jal	3d98 <i2c_rxAck>
    42b8:	b01fd0ef          	jal	1db8 <assert>
	i2c_txByte(i2c_addr, (focus_step >> 8) & 0x03);
    42bc:	0084d793          	srli	a5,s1,0x8
    42c0:	0037f793          	andi	a5,a5,3
    42c4:	00001937          	lui	s2,0x1
    42c8:	b0090913          	addi	s2,s2,-1280 # b00 <CUSTOM2+0xaa5>
    42cc:	0127e7b3          	or	a5,a5,s2
    42d0:	00f42023          	sw	a5,0(s0)
	i2c_txNackBlocking(i2c_addr);
    42d4:	00040513          	mv	a0,s0
    42d8:	aa1ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    42dc:	00040513          	mv	a0,s0
    42e0:	ab9ff0ef          	jal	3d98 <i2c_rxAck>
    42e4:	ad5fd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    42e8:	00040513          	mv	a0,s0
    42ec:	a5dff0ef          	jal	3d48 <i2c_masterStopBlocking>

	i2c_masterStartBlocking(i2c_addr);
    42f0:	00040513          	mv	a0,s0
    42f4:	a0dff0ef          	jal	3d00 <i2c_masterStartBlocking>
    42f8:	01342023          	sw	s3,0(s0)
	i2c_txByte(i2c_addr, DW9807_I2C_ADDRESS << 1);
	i2c_txNackBlocking(i2c_addr);
    42fc:	00040513          	mv	a0,s0
    4300:	a79ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4304:	00040513          	mv	a0,s0
    4308:	a91ff0ef          	jal	3d98 <i2c_rxAck>
    430c:	aadfd0ef          	jal	1db8 <assert>
    4310:	000017b7          	lui	a5,0x1
    4314:	b0478793          	addi	a5,a5,-1276 # b04 <CUSTOM2+0xaa9>
    4318:	00f42023          	sw	a5,0(s0)
	i2c_txByte(i2c_addr, DW9807_LSB_ADDR);
	i2c_txNackBlocking(i2c_addr);
    431c:	00040513          	mv	a0,s0
    4320:	a59ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4324:	00040513          	mv	a0,s0
    4328:	a71ff0ef          	jal	3d98 <i2c_rxAck>
    432c:	a8dfd0ef          	jal	1db8 <assert>
    4330:	0ff4f493          	zext.b	s1,s1
    4334:	0124e4b3          	or	s1,s1,s2
    4338:	00942023          	sw	s1,0(s0)
	i2c_txByte(i2c_addr, focus_step & 0xFF);
	i2c_txNackBlocking(i2c_addr);
    433c:	00040513          	mv	a0,s0
    4340:	a39ff0ef          	jal	3d78 <i2c_txNackBlocking>
	assert(i2c_rxAck(i2c_addr));
    4344:	00040513          	mv	a0,s0
    4348:	a51ff0ef          	jal	3d98 <i2c_rxAck>
    434c:	a6dfd0ef          	jal	1db8 <assert>
	i2c_masterStopBlocking(i2c_addr);
    4350:	00040513          	mv	a0,s0
    4354:	9f5ff0ef          	jal	3d48 <i2c_masterStopBlocking>
}
    4358:	01c12083          	lw	ra,28(sp)
    435c:	01812403          	lw	s0,24(sp)
    4360:	01412483          	lw	s1,20(sp)
    4364:	01012903          	lw	s2,16(sp)
    4368:	00c12983          	lw	s3,12(sp)
    436c:	02010113          	addi	sp,sp,32
    4370:	00008067          	ret

00004374 <PiCamV3_Init>:
	PiCamV3_WriteRegData(IMX708_REG_TEST_PATTERN, IMX708_TEST_PATTERN_SOLID_COLOR);
}
*/

void PiCamV3_Init(u32 i2c_addr)
{
    4374:	ff010113          	addi	sp,sp,-16
    4378:	00112623          	sw	ra,12(sp)
    437c:	00812423          	sw	s0,8(sp)
    4380:	00050413          	mv	s0,a0

	PiCamV3_StopStreaming(i2c_addr);
    4384:	b15ff0ef          	jal	3e98 <PiCamV3_StopStreaming>

	PiCamV3_ConfigCommon(i2c_addr);
    4388:	00040513          	mv	a0,s0
    438c:	b2dff0ef          	jal	3eb8 <PiCamV3_ConfigCommon>

	PiCamV3_SetPdafGain(i2c_addr);
    4390:	00040513          	mv	a0,s0
    4394:	d0dff0ef          	jal	40a0 <PiCamV3_SetPdafGain>

	PiCamV3_ConfigFormat(i2c_addr, 1);
    4398:	00100593          	li	a1,1
    439c:	00040513          	mv	a0,s0
    43a0:	b75ff0ef          	jal	3f14 <PiCamV3_ConfigFormat>

	PiCamV3_ConfigLinkFreq(i2c_addr);
    43a4:	00040513          	mv	a0,s0
    43a8:	c5dff0ef          	jal	4004 <PiCamV3_ConfigLinkFreq>

	PiCamV3_ConfigQuadBayerRemosaicAdjustment(i2c_addr);
    43ac:	00040513          	mv	a0,s0
    43b0:	cadff0ef          	jal	405c <PiCamV3_ConfigQuadBayerRemosaicAdjustment>

	PiCamV3_OnActuator(i2c_addr);
    43b4:	00040513          	mv	a0,s0
    43b8:	d91ff0ef          	jal	4148 <PiCamV3_OnActuator>

	PiCamV3_SetFocusStep(i2c_addr, 700);
    43bc:	2bc00593          	li	a1,700
    43c0:	00040513          	mv	a0,s0
    43c4:	e85ff0ef          	jal	4248 <PiCamV3_SetFocusStep>

	PiCamV3_OffActuator(i2c_addr);
    43c8:	00040513          	mv	a0,s0
    43cc:	dfdff0ef          	jal	41c8 <PiCamV3_OffActuator>

	//	PiCamV3_StartStreaming();

	uart_writeStr(BSP_UART_TERMINAL, "\n\rDone Camera Init");
    43d0:	000055b7          	lui	a1,0x5
    43d4:	e3058593          	addi	a1,a1,-464 # 4e30 <_data+0x9b0>
    43d8:	f8010537          	lui	a0,0xf8010
    43dc:	8d5ff0ef          	jal	3cb0 <uart_writeStr>
}
    43e0:	00c12083          	lw	ra,12(sp)
    43e4:	00812403          	lw	s0,8(sp)
    43e8:	01010113          	addi	sp,sp,16
    43ec:	00008067          	ret

000043f0 <trap_entry>:

trap_entry:
#ifdef __riscv_flen
  addi sp, sp, -STACK_SIZE
#else
  addi sp, sp, -64
    43f0:	fc010113          	addi	sp,sp,-64
#endif
  sw x1,   0*4(sp)
    43f4:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
    43f8:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
    43fc:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
    4400:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
    4404:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
    4408:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
    440c:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
    4410:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
    4414:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
    4418:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
    441c:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
    4420:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
    4424:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
    4428:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
    442c:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
    4430:	03f12e23          	sw	t6,60(sp)
  FSTORE f30, 64 + 18*FPR_SIZE(sp)
  FSTORE f31, 64 + 19*FPR_SIZE(sp)
  csrr t0, fcsr
  sw t0, 64 + 20*FPR_SIZE(sp)
#endif
  call trap
    4434:	859fd0ef          	jal	1c8c <trap>
  FLOAD f28, 64 + 16*FPR_SIZE(sp)
  FLOAD f29, 64 + 17*FPR_SIZE(sp)
  FLOAD f30, 64 + 18*FPR_SIZE(sp)
  FLOAD f31, 64 + 19*FPR_SIZE(sp)
#endif
  lw x1 ,  0*4(sp)
    4438:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
    443c:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
    4440:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
    4444:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
    4448:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
    444c:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
    4450:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
    4454:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
    4458:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
    445c:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
    4460:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
    4464:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
    4468:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
    446c:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
    4470:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
    4474:	03c12f83          	lw	t6,60(sp)
#ifdef __riscv_flen
  addi sp, sp, STACK_SIZE
#else
  addi sp, sp, 64
    4478:	04010113          	addi	sp,sp,64
#endif
    447c:	30200073          	mret
