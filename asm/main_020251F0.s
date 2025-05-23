	.include "asm/macros.inc"
	.include "main_020251F0.inc"

	.text

	arm_func_start sub_020251F0
sub_020251F0: ; 0x020251F0
#ifdef JAPAN
	ldr r1, _02025264 ; =_020B112C_JP
	ldr r1, [r1, #4]
	add r2, r1, r0, lsl #1
	ldrb r1, [r1, r0, lsl #1]
	ldrb r0, [r2, #1]
	add r0, r0, r1, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_02025264: .word _020B112C_JP
#else
	bx lr
#endif
	arm_func_end sub_020251F0

	arm_func_start StrncpySimpleNoPadSafe
StrncpySimpleNoPadSafe: ; 0x020251F4
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	b _02025294
_0202527C:
	ldrb r0, [r5], #1
	bl sub_020251F0
	mov r1, r0, asr #8
	strb r1, [r6]
	strb r0, [r6, #1]
	add r6, r6, #2
_02025294:
	cmp r4, #0
	sub r4, r4, #1
	ble _020252AC
	ldrb r0, [r5]
	cmp r0, #0
	bne _0202527C
_020252AC:
	mov r0, #0
	strb r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
#else
	mov ip, #0x20
	b _0202520C
_020251FC:
	ldrb r3, [r1], #1
	cmp r3, #0x100
	strlob r3, [r0], #1
	strhsb ip, [r0], #1
_0202520C:
	cmp r2, #0
	sub r2, r2, #1
	ble _02025224
	ldrb r3, [r1]
	cmp r3, #0
	bne _020251FC
_02025224:
	mov r1, #0
	strb r1, [r0]
	bx lr
#endif
	arm_func_end StrncpySimpleNoPadSafe

	arm_func_start StrcpyName
StrcpyName: ; 0x02025230
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	ldr r3, _02025300 ; =_020B112C_JP
	b _020252D8
_020252C4:
	ldrb ip, [r1], #1
	ldr lr, [r3]
	mov ip, ip, lsl #1
	ldrh ip, [lr, ip]
	strh ip, [r0], #2
_020252D8:
	cmp r2, #0
	sub r2, r2, #1
	ble _020252F0
	ldrb ip, [r1]
	cmp ip, #0
	bne _020252C4
_020252F0:
	cmp r2, #0
	movgt r1, #0
	strgth r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025300: .word _020B112C_JP
#else
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r3, ip
	b _020252FC
_02025240:
	cmp r2, #0x7e
	bne _020252F8
	ldrb lr, [r1]
	ldrb r4, [r1, #1]
	add r1, r1, #2
	cmp lr, #0x30
	blo _0202526C
	cmp lr, #0x39
	subls r2, lr, #0x30
	andls lr, r2, #0xff
	bls _020252A0
_0202526C:
	cmp lr, #0x61
	blo _02025284
	cmp lr, #0x66
	subls r2, lr, #0x6b
	andls lr, r2, #0xff
	bls _020252A0
_02025284:
	cmp lr, #0x41
	blo _0202529C
	cmp lr, #0x46
	subls r2, lr, #0x4b
	andls lr, r2, #0xff
	bls _020252A0
_0202529C:
	mov lr, ip
_020252A0:
	cmp r4, #0x30
	blo _020252B8
	cmp r4, #0x39
	subls r2, r4, #0x30
	andls r4, r2, #0xff
	bls _020252EC
_020252B8:
	cmp r4, #0x61
	blo _020252D0
	cmp r4, #0x66
	subls r2, r4, #0x6b
	andls r4, r2, #0xff
	bls _020252EC
_020252D0:
	cmp r4, #0x41
	blo _020252E8
	cmp r4, #0x46
	subls r2, r4, #0x4b
	andls r4, r2, #0xff
	bls _020252EC
_020252E8:
	mov r4, r3
_020252EC:
	orr r2, r4, lr, lsl #4
	strb r2, [r0], #1
	b _020252FC
_020252F8:
	strb r2, [r0], #1
_020252FC:
	ldrb r2, [r1], #1
	cmp r2, #0
	bne _02025240
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r4, pc}
#endif
	arm_func_end StrcpyName

#ifdef JAPAN
	arm_func_start sub_02025304_JP
sub_02025304_JP: ; 0x02025304
	stmdb sp!, {r4, r5, r6, lr}
	mov lr, #0
	ldr r2, _02025368 ; =_020B112C_JP
	b _02025350
_02025314:
	mov r5, lr
	ldr r4, [r2, #4]
	b _0202533C
_02025320:
	cmp r6, r3
	ldreqb ip, [r1, #1]
	ldreqb r3, [r4, #1]
	cmpeq ip, r3
	beq _02025348
	add r4, r4, #2
	add r5, r5, #1
_0202533C:
	ldrb r3, [r4]
	cmp r3, #0
	bne _02025320
_02025348:
	strb r5, [r0], #1
	add r1, r1, #2
_02025350:
	ldrb r6, [r1]
	cmp r6, #0
	bne _02025314
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02025368: .word _020B112C_JP
	arm_func_end sub_02025304_JP
#endif

	arm_func_start StrncpyName
StrncpyName: ; 0x02025314
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r3, _020253DC ; =_020B112C_JP
	b _020253CC
_0202537C:
	ldrb r7, [r1]
	cmp r7, #0
	moveq r1, #0
	streqb r1, [r0]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, r4
	ldr r5, [r3, #4]
	b _020253B8
_0202539C:
	cmp r7, ip
	ldreqb lr, [r1, #1]
	ldreqb ip, [r5, #1]
	cmpeq lr, ip
	beq _020253C4
	add r5, r5, #2
	add r6, r6, #1
_020253B8:
	ldrb ip, [r5]
	cmp ip, #0
	bne _0202539C
_020253C4:
	strb r6, [r0], #1
	add r1, r1, #2
_020253CC:
	cmp r2, #0
	sub r2, r2, #1
	bgt _0202537C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020253DC: .word _020B112C_JP
#else
	stmdb sp!, {r3, r4, r5, lr}
	mov lr, #0
	mov ip, lr
	b _020253F4
_02025324:
	ldrb r3, [r1], #1
	cmp r3, #0
	moveq r1, #0
	streqb r1, [r0]
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r3, #0x7e
	bne _020253F0
	ldrb r4, [r1]
	ldrb r5, [r1, #1]
	add r1, r1, #2
	cmp r4, #0x30
	blo _02025364
	cmp r4, #0x39
	subls r3, r4, #0x30
	andls r4, r3, #0xff
	bls _02025398
_02025364:
	cmp r4, #0x61
	blo _0202537C
	cmp r4, #0x66
	subls r3, r4, #0x6b
	andls r4, r3, #0xff
	bls _02025398
_0202537C:
	cmp r4, #0x41
	blo _02025394
	cmp r4, #0x46
	subls r3, r4, #0x4b
	andls r4, r3, #0xff
	bls _02025398
_02025394:
	mov r4, lr
_02025398:
	cmp r5, #0x30
	blo _020253B0
	cmp r5, #0x39
	subls r3, r5, #0x30
	andls r5, r3, #0xff
	bls _020253E4
_020253B0:
	cmp r5, #0x61
	blo _020253C8
	cmp r5, #0x66
	subls r3, r5, #0x6b
	andls r5, r3, #0xff
	bls _020253E4
_020253C8:
	cmp r5, #0x41
	blo _020253E0
	cmp r5, #0x46
	subls r3, r5, #0x4b
	andls r5, r3, #0xff
	bls _020253E4
_020253E0:
	mov r5, ip
_020253E4:
	orr r3, r5, r4, lsl #4
	strb r3, [r0], #1
	b _020253F4
_020253F0:
	strb r3, [r0], #1
_020253F4:
	cmp r2, #0
	sub r2, r2, #1
	bgt _02025324
	ldmia sp!, {r3, r4, r5, pc}
#endif
	arm_func_end StrncpyName

#ifdef JAPAN
	arm_func_start sub_020253E0_JP
sub_020253E0_JP: ; 0x020253E0
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r3, _02025444 ; =_020B112C_JP
	b _02025434
_020253F0:
	ldrh r5, [r1]
	cmp r5, #0
	moveq r1, #0
	streqb r1, [r0]
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, ip
	ldr lr, [r3]
	b _02025420
_02025410:
	cmp r6, r5
	beq _0202542C
	add lr, lr, #2
	add r4, r4, #1
_02025420:
	ldrh r6, [lr]
	cmp r6, #0
	bne _02025410
_0202542C:
	strb r4, [r0], #1
	add r1, r1, #2
_02025434:
	cmp r2, #0
	sub r2, r2, #1
	bgt _020253F0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02025444: .word _020B112C_JP
	arm_func_end sub_020253E0_JP
#else
	arm_func_start sub_02025404
sub_02025404: ; 0x02025404
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	b _02025424
_02025418:
	ldrb r0, [r5], #1
	bl sub_02025480
	strh r0, [r6], #2
_02025424:
	cmp r4, #0
	sub r4, r4, #1
	ble _0202543C
	ldrb r0, [r5]
	cmp r0, #0
	bne _02025418
_0202543C:
	cmp r4, #0
	movgt r0, #0
	strgth r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02025404

	arm_func_start sub_0202544C
sub_0202544C: ; 0x0202544C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r5, r0
	add r0, sp, #0
	mov r3, #1
	mov r4, r2
	bl sub_0202568C
	add r1, sp, #0
	mov r0, r5
	mov r2, r4
	bl StrncpyName
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202544C
#endif

	arm_func_start sub_02025480
sub_02025480: ; 0x02025480
	stmdb sp!, {r3, lr}
#ifdef JAPAN
	tst r0, #0xff00
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	ldmeqia sp!, {r3, pc}
#endif
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov ip, #0
#ifdef JAPAN
	mov lr, #0x110
#else
	mov lr, #0xdb
#endif
	ldr r2, _020254F0 ; =_0209A044
	b _020254C8
_020254A0:
	add r1, ip, lr
	add r1, r1, r1, lsr #31
	mov r3, r1, asr #1
	mov r1, r3, lsl #2
	ldrh r1, [r2, r1]
	cmp r1, r0
	moveq ip, r3
	beq _020254D0
	addlt ip, r3, #1
	movge lr, r3
_020254C8:
	cmp ip, lr
	blt _020254A0
_020254D0:
	ldr r1, _020254F0 ; =_0209A044
	mov r2, ip, lsl #2
	ldrh r1, [r1, r2]
	cmp r1, r0
	ldreq r0, _020254F4 ; =_0209A046
	ldreqh r0, [r0, r2]
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020254F0: .word _0209A044
_020254F4: .word _0209A046
	arm_func_end sub_02025480

	arm_func_start sub_020254F8
sub_020254F8: ; 0x020254F8
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa
	ldreq r0, _02025530 ; =0x000081A5
	ldmeqia sp!, {r3, pc}
	tst r0, #0xff00
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	ldr r3, _02025534 ; =_0209A044
	ldr r1, _02025538 ; =0x00000111
	b _02025520
_02025504:
	add r2, r3, lr, lsl #2
	ldrh r2, [r2, #2]
	mov ip, lr, lsl #2
	cmp r0, r2
	ldreqh r0, [r3, ip]
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_02025520:
	cmp lr, r1
	blt _02025504
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025530: .word 0x000081A5
_02025534: .word _0209A044
_02025538: .word 0x00000111
#else
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0xa
	moveq r0, #0xa
	bxeq lr
	mov ip, #0
	ldr r2, _02025548 ; =_0209A044
	b _02025538
_0202551C:
	add r1, r2, ip, lsl #2
	ldrh r1, [r1, #2]
	mov r3, ip, lsl #2
	cmp r0, r1
	ldreqh r0, [r2, r3]
	bxeq lr
	add ip, ip, #1
_02025538:
	cmp ip, #0xdc
	blt _0202551C
	mov r0, #0
	bx lr
	.align 2, 0
_02025548: .word _0209A044
#endif
	arm_func_end sub_020254F8

	arm_func_start sub_0202554C
sub_0202554C: ; 0x0202554C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa
#ifdef JAPAN
	ldreq r0, _020255BC ; =0x000081A5
#else
	moveq r0, #0xa
#endif
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	ldr ip, _020255CC ; =0x000001BE
	ldr r2, _020255D0 ; =_0209A3B4
	b _020255A4
_02025578:
	add r1, lr, ip
	add r1, r1, r1, lsr #31
	mov r3, r1, asr #1
	mov r1, r3, lsl #2
	ldrh r1, [r2, r1]
	cmp r0, r1
	moveq lr, r3
	beq _020255AC
	cmp r1, r0
	addlo lr, r3, #1
	movhs ip, r3
_020255A4:
	cmp lr, ip
	blt _02025578
_020255AC:
	ldr r1, _020255D0 ; =_0209A3B4
	mov r2, lr, lsl #2
	ldrh r1, [r1, r2]
	cmp r0, r1
	ldreq r0, _020255D4 ; =_0209A3B6
	ldreqh r0, [r0, r2]
#ifdef JAPAN
	ldrne r0, _020255CC_JP ; =0x00008148
#else
	movne r0, #0x3f
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_020255BC: .word 0x000081A5
_020255CC: .word 0x000001BF
#else
_020255CC: .word 0x000001BE
#endif
_020255D0: .word _0209A3B4
_020255D4: .word _0209A3B6
#ifdef JAPAN
_020255CC_JP: .word 0x00008148
#endif
	arm_func_end sub_0202554C

	arm_func_start sub_020255D8
sub_020255D8: ; 0x020255D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	str r1, [sp]
	add r4, sp, #0
	b _020255FC
_020255EC:
	mov r0, r4
	bl sub_0202065C
	bl sub_02025480
	strh r0, [r5], #2
_020255FC:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	bne _020255EC
	mov r1, #0
	mov r0, r5
	strh r1, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020255D8

	arm_func_start sub_0202561C
sub_0202561C: ; 0x0202561C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r8, r2
	mov r7, r3
	str r1, [sp]
	mov r6, #0
	add r5, sp, #0
	b _02025654
_02025640:
	mov r0, r5
	bl sub_0202065C
	bl sub_02025480
	strh r0, [r4], #2
	add r6, r6, #1
_02025654:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0202566C
	cmp r6, r8
	blt _02025640
_0202566C:
	cmp r7, #0
	beq _02025680
	cmp r6, r8
	movlt r0, #0
	strlth r0, [r4]
_02025680:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0202561C

	arm_func_start sub_0202568C
sub_0202568C: ; 0x0202568C
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, #0
	b _020256C0
_0202569C:
	bl sub_020254F8
	ands r1, r0, #0xff00
	movne r1, r1, asr #8
	strneb r1, [r7]
	strneb r0, [r7, #1]
	addne r7, r7, #2
	streqb r0, [r7], #1
	add r6, r6, #2
	add r4, r4, #1
_020256C0:
	ldrh r0, [r6]
	cmp r0, #0
	beq _020256D4
	cmp r4, r5
	blt _0202569C
_020256D4:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r5, #0
	b _020256CC
_020256A8:
	bl sub_020254F8
	ands r1, r0, #0xff00
	movne r1, r1, asr #8
	strneb r1, [r4]
	strneb r0, [r4, #1]
	addne r4, r4, #2
	streqb r0, [r4], #1
	add r8, r8, #2
	add r5, r5, #1
_020256CC:
	ldrh r0, [r8]
	cmp r0, #0
	beq _020256E0
	cmp r5, r7
	blt _020256A8
_020256E0:
	cmp r6, #0
	beq _020256F4
	cmp r5, r7
	movlt r0, #0
	strltb r0, [r4]
_020256F4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#endif
	arm_func_end sub_0202568C

	arm_func_start sub_020256FC
sub_020256FC: ; 0x020256FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, #0
	mov r5, #0x81
	mov r4, #0x48
	ldr fp, _02025780 ; =0x000081A1
	b _02025764
_02025720:
	bl sub_0202554C
	mov r6, r0
	bl sub_02025C7C
#ifdef JAPAN
	ldrh r0, [r0, #4]
#else
	ldrh r0, [r0]
#endif
	cmp r0, fp
	streqb r5, [sl]
	streqb r4, [sl, #1]
	addeq sl, sl, #2
	beq _0202575C
	ands r0, r6, #0xff00
	movne r0, r0, asr #8
	strneb r0, [sl]
	strneb r6, [sl, #1]
	addne sl, sl, #2
	streqb r6, [sl], #1
_0202575C:
	add sb, sb, #2
	add r7, r7, #1
_02025764:
	ldrh r0, [sb]
	cmp r0, #0
	beq _02025778
	cmp r7, r8
	blt _02025720
_02025778:
	mov r0, sl
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02025780: .word 0x000081A1
	arm_func_end sub_020256FC

	arm_func_start sub_02025784
sub_02025784: ; 0x02025784
	bx lr
	arm_func_end sub_02025784
