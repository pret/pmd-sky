	.include "asm/macros.inc"
	.include "main_02028354.inc"

	.text

	arm_func_start sub_02028354
sub_02028354: ; 0x02028354
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028368 ; =_022A8992
	ldrsb r0, [r0, r1]
	bx lr
	.align 2, 0
_02028368: .word _022A8992
	arm_func_end sub_02028354

	arm_func_start sub_0202836C
sub_0202836C: ; 0x0202836C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _02028438 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r6, r0, r1, r2
	ldrb r0, [r6, #8]
	cmp r0, #0
	bne _020283A4
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #5]
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	bl sub_02029154
	b _02028428
_020283A4:
	ldrb r0, [r6, #8]
	bl sub_0202843C
	ldrb r1, [r6, #5]
	mov r7, r0
	add r5, sp, #0
	str r1, [sp, #4]
	mov r4, #0
	b _02028410
_020283C4:
	ldrb r0, [r6, #4]
	str r0, [sp]
	b _020283EC
_020283D0:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_020283EC:
	ldrb r1, [r6, #4]
	ldrb r0, [r6, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _020283D0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02028410:
	ldrb r1, [r6, #5]
	ldrb r0, [r6, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _020283C4
_02028428:
	ldrb r0, [r6, #8]
	bl sub_02027AA0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028438: .word WINDOW_LIST
	arm_func_end sub_0202836C

	arm_func_start sub_0202843C
sub_0202843C: ; 0x0202843C
	cmp r0, #1
	ldreq r0, _02028458 ; =_022A7B00
	bxeq lr
	cmp r0, #2
	ldreq r0, _0202845C ; =_022A7AE4
	ldrne r0, _02028460 ; =_022A7AC8
	bx lr
	.align 2, 0
_02028458: .word _022A7B00
_0202845C: .word _022A7AE4
_02028460: .word _022A7AC8
	arm_func_end sub_0202843C

	arm_func_start sub_02028464
sub_02028464: ; 0x02028464
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	ldr r3, _02028768 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r4, r0, r2, r3
	ldrsb r0, [r4, #9]
	ldrb r5, [r4, #8]
	ldr r7, _0202876C ; =_0209AC64
	rsb r2, r0, #0
	mov r0, r5
	mov r6, r2, lsl #1
	mov r8, r1
	bl sub_0202843C
	ldrsb r1, [r7, r6]
	mov r6, r0
	cmp r1, #0
	movlt r8, #0
	cmp r5, #0
	bne _020284D8
	ldrh r0, [r4, #0x30]
	str r0, [sp]
	ldrb r0, [r4, #0x11]
	stmib sp, {r0, r8}
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	bl sub_020291FC
	b _02028758
_020284D8:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _0202857C
	ldrh r0, [r4, #0x30]
	ldrb r1, [r4, #5]
	add r7, sp, #0xc
	orr r0, r0, #0x400
	mov r0, r0, lsl #0x10
	str r1, [sp, #0x10]
	mov sb, r0, lsr #0x10
	b _02028560
_02028504:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	add r0, r1, r0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028544
_0202851C:
	add r0, sb, #1
	mov r2, sb
	mov r3, r0, lsl #0x10
	mov r0, r6
	mov r1, r7
	mov sb, r3, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #0xc]
	sub r0, r0, #1
	str r0, [sp, #0xc]
_02028544:
	ldrb r0, [r4, #4]
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bge _0202851C
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_02028560:
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #7]
	ldr r2, [sp, #0x10]
	add r1, r0, r1
	cmp r2, r1
	blt _02028504
	b _02028600
_0202857C:
	ldrh r7, [r4, #0x30]
	ldrb sl, [r4, #5]
	add sb, sp, #0xc
	b _020285EC
_0202858C:
	mov r1, sl, lsr #0x1f
	ldrb r2, [r4, #4]
	rsb r0, r1, sl, lsl #27
	add r0, r1, r0, ror #27
	str r0, [sp, #0x10]
	str r2, [sp, #0xc]
	b _020285D0
_020285A8:
	add r0, r7, #1
	mov r2, r7
	mov r3, r0, lsl #0x10
	mov r0, r6
	mov r1, sb
	mov r7, r3, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_020285D0:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	blt _020285A8
	add sl, sl, #1
_020285EC:
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #7]
	add r1, r0, r1
	cmp sl, r1
	blt _0202858C
_02028600:
	cmp r8, #0
	beq _02028758
	subs r0, r0, #1
	str r0, [sp, #0x10]
	bmi _02028670
	ldrb r0, [r4, #4]
	add r8, sp, #0xc
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028658
_0202862C:
	cmp r2, #0
	blt _0202864C
	cmp r2, #0x20
	bge _0202864C
	mov r0, r6
	mov r1, r8
	mov r2, r7
	bl sub_0200B3FC
_0202864C:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02028658:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	ble _0202862C
_02028670:
	ldrb r0, [r4, #5]
	mov r8, #0
	add sb, sp, #0xc
	str r0, [sp, #0x10]
	mov r7, r8
	b _020286DC
_02028688:
	ldrb r0, [r4, #4]
	subs r0, r0, #1
	str r0, [sp, #0xc]
	bmi _020286A8
	mov r0, r6
	mov r1, sb
	mov r2, r8
	bl sub_0200B3FC
_020286A8:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	add r0, r1, r0
	str r0, [sp, #0xc]
	cmp r0, #0x20
	bge _020286D0
	mov r0, r6
	mov r1, sb
	mov r2, r7
	bl sub_0200B3FC
_020286D0:
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_020286DC:
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #7]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	cmp r2, r0
	blt _02028688
	cmp r2, #0x18
	bge _02028758
	ldrb r0, [r4, #4]
	add r8, sp, #0xc
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028740
_02028714:
	cmp r2, #0
	blt _02028734
	cmp r2, #0x20
	bge _02028734
	mov r0, r6
	mov r1, r8
	mov r2, r7
	bl sub_0200B3FC
_02028734:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02028740:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	ble _02028714
_02028758:
	mov r0, r5
	bl sub_02027AA0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02028768: .word WINDOW_LIST
_0202876C: .word _0209AC64
	arm_func_end sub_02028464

	arm_func_start sub_02028770
sub_02028770: ; 0x02028770
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020287C0 ; =WINDOW_LIST
	mov r5, r0
	mov r1, #0xe0
	mla r4, r5, r1, r2
	bl sub_0202836C
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	strb r0, [r4, #4]
	mov r0, r5
	mov r1, #1
	strb r2, [r4, #5]
	bl sub_02027E30
	mov r0, r5
	mov r1, #1
	bl sub_02028464
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020287C0: .word WINDOW_LIST
	arm_func_end sub_02028770

	arm_func_start sub_020287C4
sub_020287C4: ; 0x020287C4
	ldr r1, _020287DC ; =_020AFD4C
	mov r2, #1
	ldr r3, [r1, #8]
	orr r0, r3, r2, lsl r0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020287DC: .word _020AFD4C
	arm_func_end sub_020287C4

	arm_func_start sub_020287E0
sub_020287E0: ; 0x020287E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02028840 ; =_022A7A6C
	mov r6, r0
#ifdef JAPAN
	ldrsb r0, [r1, #1]
#else
	ldrsb r0, [r1, #3]
#endif
	mov r1, #0
	mov sb, #1
	ldr r4, _02028844 ; =WINDOW_LIST
	mov r8, #0xe0
	mvn r7, #1
	b _0202882C
_02028808:
	mla r5, r0, r8, r4
	ldrsb r2, [r5, #0xb6]
	cmp r2, #2
	ldreqb r2, [r5, #8]
	cmpeq r6, r2
	bne _02028828
	bl sub_02028464
	mov r1, sb
_02028828:
	ldrsb r0, [r5, #0xb5]
_0202882C:
	cmp r0, r7
	bne _02028808
	mov r0, r6
	bl sub_02027AA0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02028840: .word _022A7A6C
_02028844: .word WINDOW_LIST
	arm_func_end sub_020287E0

	arm_func_start sub_02028848
sub_02028848: ; 0x02028848
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020288D0 ; =_022A7A6C
	ldr r6, _020288D4 ; =WINDOW_LIST
#ifdef JAPAN
	ldrsb r0, [r0, #1]
#else
	ldrsb r0, [r0, #3]
#endif
	mov r5, #0xe0
	mvn r4, #1
	b _02028888
_02028864:
	mla r7, r0, r5, r6
	ldrsb r0, [r7, #0xb6]
	cmp r0, #0
	ldrne r1, [r7]
	cmpne r1, #0
	beq _02028884
	mov r0, r7
	blx r1
_02028884:
	ldrsb r0, [r7, #0xb5]
_02028888:
	cmp r0, r4
	bne _02028864
	ldr r0, _020288D8 ; =_020AFD4C
	ldr r0, [r0, #8]
	tst r0, #1
	beq _020288A8
	mov r0, #0
	bl sub_020287E0
_020288A8:
	ldr r0, _020288D8 ; =_020AFD4C
	ldr r0, [r0, #8]
	tst r0, #2
	beq _020288C0
	mov r0, #1
	bl sub_020287E0
_020288C0:
	ldr r0, _020288D8 ; =_020AFD4C
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020288D0: .word _022A7A6C
_020288D4: .word WINDOW_LIST
_020288D8: .word _020AFD4C
	arm_func_end sub_02028848

	arm_func_start sub_020288DC
sub_020288DC: ; 0x020288DC
	ldr r2, _020288F4 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr ip, _020288F8 ; =InitWindowTrailer
	add r0, r1, #0xbc
	bx ip
	.align 2, 0
_020288F4: .word WINDOW_LIST
_020288F8: .word InitWindowTrailer
	arm_func_end sub_020288DC

	arm_func_start sub_020288FC
sub_020288FC: ; 0x020288FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr lr, _02028944 ; =WINDOW_LIST
	mov ip, #0xe0
	mla r4, r0, ip, lr
	ldr lr, [r4, #0xb8]
	sub r0, ip, #0xe1
	cmp lr, r0
	moveq ip, #1
	stmia sp, {r2, r3}
	movne ip, #0
	mov r2, r1
	add r0, r4, #0xbc
	and r3, ip, #0xff
	mov r1, #0
	bl sub_02029688
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028944: .word WINDOW_LIST
	arm_func_end sub_020288FC

	arm_func_start sub_02028948
sub_02028948: ; 0x02028948
	stmdb sp!, {r3, lr}
	ldr r3, _0202897C ; =WINDOW_LIST
	mov r2, #0xe0
	mla ip, r0, r2, r3
	ldr r3, [ip, #0xb8]
	sub r0, r2, #0xe1
	cmp r3, r0
	moveq r2, #1
	movne r2, #0
	add r0, ip, #0xbc
	and r2, r2, #0xff
	bl sub_02029758
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202897C: .word WINDOW_LIST
	arm_func_end sub_02028948

	arm_func_start sub_02028980
sub_02028980: ; 0x02028980
	stmdb sp!, {r3, lr}
	ldr r3, _020289B4 ; =WINDOW_LIST
	mov r2, #0xe0
	mla ip, r0, r2, r3
	ldr r3, [ip, #0xb8]
	sub r0, r2, #0xe1
	cmp r3, r0
	moveq r2, #1
	movne r2, #0
	add r0, ip, #0xbc
	and r2, r2, #0xff
	bl sub_02029828
	ldmia sp!, {r3, pc}
	.align 2, 0
_020289B4: .word WINDOW_LIST
	arm_func_end sub_02028980

	arm_func_start sub_020289B8
sub_020289B8: ; 0x020289B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr lr, _02028A04 ; =WINDOW_LIST
	mov ip, #0xe0
	mla r4, r0, ip, lr
	ldr lr, [r4, #0xb8]
	sub r0, ip, #0xe1
	cmp lr, r0
	moveq lr, #1
	str r3, [sp]
	ldr ip, [sp, #0x10]
	movne lr, #0
	mov r3, r2
	add r0, r4, #0xbc
	and r2, lr, #0xff
	str ip, [sp, #4]
	bl sub_020298F8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028A04: .word WINDOW_LIST
	arm_func_end sub_020289B8

	arm_func_start sub_02028A08
sub_02028A08: ; 0x02028A08
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr lr, _02028A60 ; =WINDOW_LIST
	mov ip, #0xe0
	mla r4, r0, ip, lr
	sub r0, ip, #0xe1
	ldr lr, [r4, #0xb8]
	ldr ip, [sp, #0x18]
	cmp lr, r0
	stmia sp, {r3, ip}
	moveq lr, #1
	ldr r0, [sp, #0x1c]
	movne lr, #0
	str r0, [sp, #8]
	ldr ip, [sp, #0x20]
	mov r3, r2
	add r0, r4, #0xbc
	and r2, lr, #0xff
	str ip, [sp, #0xc]
	bl sub_02029998
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028A60: .word WINDOW_LIST
	arm_func_end sub_02028A08

	arm_func_start sub_02028A64
sub_02028A64: ; 0x02028A64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02028DE8 ; =_020AFD4C
	movs r4, r0
#ifdef JAPAN
	strb r4, [r1, #2]
#else
	strb r4, [r1, #4]
#endif
	mov r5, #8
	beq _02028D58
	ldr r0, _02028DEC ; =_022A7A6C
	mov r1, #0
#ifdef JAPAN
	ldrsb r3, [r0, #1]
#else
	ldrsb r3, [r0, #3]
	strb r3, [r0, #5]
#endif
	strh r1, [r0, #6]
	b _02028BF4
_02028A94:
	ldr r1, _02028DF0 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r6, r3, r0, r1
	ldrsb r1, [r6, #0xb6]
	ldr r2, _02028DF4 ; =_022A7B1C
#ifdef JAPAN
	mov r0, #0x2c
#else
	mov r0, #0x30
#endif
	mla r7, r3, r0, r2
	cmp r1, #0
#ifdef JAPAN
	mov r0, #0
	beq _02028BDC
#else
	beq _02028BDC
	mov r0, #0
#endif
	strb r0, [r6, #0xb7]
	ldrb r0, [r6, #8]
	mov r1, #1
	strb r1, [r7]
	cmp r0, #0
	bne _02028BC4
	ldr r0, _02028DF8 ; =_020AFD98
	ldrsb r3, [r6, #9]
	ldrb r2, [r0]
	ldr r0, _02028DEC ; =_022A7A6C
	ldr r1, _02028DFC ; =_0209ACA8
	ldrsh r0, [r0, #0x58]
	rsb r3, r3, #0
	ldrb r1, [r1, r2]
	ldr r2, _02028E00 ; =_0209AC64
	mov r3, r3, lsl #1
	ldrsb r8, [r2, r3]
	bl GetPaletteBaseAddress__020278A8
	mov r1, r5, lsl #1
	str r0, [r6, #0x98]
	add r0, r1, #9
	strh r0, [r6, #0x9e]
	add r0, r1, #0xa
	strh r0, [r6, #0x5e]
	cmp r8, #0
	sub r5, r5, #1
	blt _02028BC4
	ldrsh r0, [r6, #0x38]
	cmp r0, #0
	beq _02028BC4
	ldr r0, _02028E04 ; =_0209AC78
	mov r1, r8, lsl #3
	add r3, r0, r8, lsl #3
	ldrsh r1, [r0, r1]
	ldr r0, _02028DEC ; =_022A7A6C
	ldrsh r2, [r3, #2]
	strh r1, [r6, #0x8a]
	ldrsh r8, [r0, #6]
	ldrsh r1, [r3, #4]
	strh r2, [r6, #0x8c]
	ldrsh r0, [r3, #6]
	strh r1, [r6, #0x8e]
	cmp r8, #0x14
	strh r0, [r6, #0x90]
	bge _02028BC4
	ldr r0, _02028E08 ; =_022A7EDC
	add ip, r6, #0x34
	add sl, r0, r8, lsl #7
	mov sb, #4
_02028B80:
	ldmia ip!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs sb, sb, #1
	bne _02028B80
	ldr r0, _02028E08 ; =_022A7EDC
	add sl, r6, #0x74
	add r0, r0, r8, lsl #7
	add sb, r0, #0x40
	mov r8, #4
_02028BA4:
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _02028BA4
	ldr r0, _02028DEC ; =_022A7A6C
	ldrsh r1, [r0, #6]
	add r1, r1, #1
	strh r1, [r0, #6]
_02028BC4:
	add r0, r7, #4
	add r1, r6, #0xbc
	bl sub_02029A68
	add r0, r7, #4
	bl sub_02029B0C
	b _02028BEC
_02028BDC:
#ifdef JAPAN
	strb r0, [r7]
#else
	mov r1, #0
	add r0, r7, #4
	strb r1, [r7]
	bl sub_02029A50
#endif
_02028BEC:
	ldrsb r3, [r6, #0xb5]
#ifndef JAPAN
	strb r3, [r7, #0x2c]
#endif
_02028BF4:
	mvn r0, #1
	cmp r3, r0
	bne _02028A94
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1]
#else
	ldrb r0, [r1, #4]
#endif
	cmp r0, #0
	beq _02028C20
	ldr r0, _02028E0C ; =_022A7AA0
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1]
#else
	strb r2, [r1, #4]
#endif
	bl sub_0200A174
_02028C20:
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1, #4]
#else
	ldrb r0, [r1]
#endif
	cmp r0, #0
	beq _02028C40
	ldr r0, _02028E10 ; =_022A7A8C
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1, #4]
#else
	strb r2, [r1]
#endif
	bl sub_0200A174
_02028C40:
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1, #2]
#else
	ldrb r0, [r1, #1]
#endif
	cmp r0, #0
	beq _02028C60
	ldr r0, _02028E14 ; =_022A7A78
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1, #2]
#else
	strb r2, [r1, #1]
#endif
	bl sub_0200A174
_02028C60:
	mov r8, #0
	ldr r7, _02028DF0 ; =WINDOW_LIST
	mov r6, r8
	mov r5, #0xe0
_02028C70:
	mla sl, r8, r5, r7
	ldrsb r0, [sl, #0xb6]
	cmp r0, #0
	ldrne sb, [sl, #0x2c]
	cmpne sb, #0
	beq _02028CB8
	ldr r0, [sl, #0x28]
	ldr r1, [sl, #0x24]
	mov r2, sb
	bl Memcpy32
	ldr r0, [sl, #0x24]
	bic r1, sb, #3
	add r0, r0, r1
	str r0, [sl, #0x24]
	ldr r0, [sl, #0x28]
	add r0, r0, r1
	str r0, [sl, #0x28]
	str r6, [sl, #0x2c]
_02028CB8:
	add r0, r8, #1
	mov r0, r0, lsl #0x18
	mov r8, r0, asr #0x18
	cmp r8, #0x14
	blt _02028C70
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02028D08
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_02029054
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_0200B330
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #0
	strb r2, [r1, r0]
_02028D08:
	bl sub_02028FC8
	ldr r0, _02028DE8 ; =_020AFD4C
#ifdef JAPAN
	ldrb r0, [r0, #3]
#else
	ldrb r0, [r0]
#endif
	cmp r0, #0
	beq _02028D30
	ldr r0, _02028E24 ; =_022A7B00
	bl sub_0200B330
	ldr r0, _02028DE8 ; =_020AFD4C
	mov r1, #0
#ifdef JAPAN
	strb r1, [r0, #3]
#else
	strb r1, [r0]
#endif
_02028D30:
	ldr r0, _02028DE8 ; =_020AFD4C
#ifdef JAPAN
	ldrb r0, [r0]
#else
	ldrb r0, [r0, #3]
#endif
	cmp r0, #0
	beq _02028DD4
	ldr r0, _02028E28 ; =_022A7AE4
	bl sub_0200B330
	ldr r0, _02028DE8 ; =_020AFD4C
	mov r1, #0
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
	b _02028DD4
_02028D58:
	ldr r0, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldr r6, _02028DF0 ; =WINDOW_LIST
	ldrsb r2, [r0, #1]
	ldr r5, _02028DF4 ; =_022A7B1C
	mov sb, #0xe0
	mov sl, #0x2c
	mvn r8, #1
	b _02028D90
_02028D70:
	mul r1, r2, sl
	ldrb r0, [r5, r1]
	mla r7, r2, sb, r6
	cmp r0, #0
	add r0, r5, r1
	beq _02028D8C
	add r0, r0, #4
	bl sub_02029B0C
_02028D8C:
	ldrsb r2, [r7, #0xb5]
_02028D90:
	cmp r2, r8
#else
	ldr r7, _02028DF4 ; =_022A7B1C
	ldrsb r0, [r0, #5]
	mov r6, #0x30
	mvn r5, #1
	b _02028D90
_02028D70:
	mul r1, r0, r6
	ldrb r0, [r7, r1]
	add r8, r7, r1
	cmp r0, #0
	beq _02028D8C
	add r0, r8, #4
	bl sub_02029B0C
_02028D8C:
	ldrsb r0, [r8, #0x2c]
_02028D90:
	cmp r0, r5
#endif
	bne _02028D70
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02028DD4
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_02029054
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_0200B330
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #0
	strb r2, [r1, r0]
_02028DD4:
	bl sub_02029EC4
	bl sub_02029FE8
	mov r0, r4
	bl sub_0202A2C8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02028DE8: .word _020AFD4C
_02028DEC: .word _022A7A6C
_02028DF0: .word WINDOW_LIST
_02028DF4: .word _022A7B1C
_02028DF8: .word _020AFD98
_02028DFC: .word _0209ACA8
_02028E00: .word _0209AC64
_02028E04: .word _0209AC78
_02028E08: .word _022A7EDC
_02028E0C: .word _022A7AA0
_02028E10: .word _022A7A8C
_02028E14: .word _022A7A78
_02028E18: .word _020AFD9C
_02028E1C: .word _020AFD94
_02028E20: .word _022A7AC8
_02028E24: .word _022A7B00
_02028E28: .word _022A7AE4
	arm_func_end sub_02028A64

	arm_func_start sub_02028E2C
sub_02028E2C: ; 0x02028E2C
	ldr r0, _02028E3C ; =_022A7A6C
	mov r1, #0
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
_02028E3C: .word _022A7A6C
	arm_func_end sub_02028E2C

	arm_func_start sub_02028E40
sub_02028E40: ; 0x02028E40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r5, _02028E80 ; =_022A7EDC
	ldr r4, _02028E84 ; =_022A7A6C
	b _02028E6C
_02028E54:
	add r7, r5, r6, lsl #7
	mov r0, r7
	bl sub_0201F2A0
	add r0, r7, #0x40
	bl sub_0201F2A0
	add r6, r6, #1
_02028E6C:
	ldrsh r0, [r4, #6]
	cmp r6, r0
	blt _02028E54
	bl sub_0202A388
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028E80: .word _022A7EDC
_02028E84: .word _022A7A6C
	arm_func_end sub_02028E40

	arm_func_start sub_02028E88
sub_02028E88: ; 0x02028E88
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _02028ED0 ; =_022A7AC8
	bl sub_0200B340
	ldr r0, _02028ED4 ; =_022A7B00
	bl sub_0200B340
	ldr r0, _02028ED8 ; =_022A7AE4
	bl sub_0200B340
	ldr r0, _02028EDC ; =_022A7AA0
	bl sub_0200A184
	ldr r0, _02028EE0 ; =_022A7A8C
	bl sub_0200A184
	ldr r0, _02028EE4 ; =_022A7A78
	bl sub_0200A184
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02028ED0: .word _022A7AC8
_02028ED4: .word _022A7B00
_02028ED8: .word _022A7AE4
_02028EDC: .word _022A7AA0
_02028EE0: .word _022A7A8C
_02028EE4: .word _022A7A78
	arm_func_end sub_02028E88

	arm_func_start sub_02028EE8
sub_02028EE8: ; 0x02028EE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r7, r3
	bl sub_0202843C
	mov r5, r0
	ldr r6, [sb, #4]
	add r4, sp, #0
	mov fp, #0
	b _02028F68
_02028F18:
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #27
	add r0, r1, r0, ror #27
	str r0, [sp, #4]
	ldr r0, [sb]
	str r0, [sp]
	b _02028F50
_02028F34:
	mov r0, r5
	mov r1, r4
	mov r2, fp
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02028F50:
	ldr r0, [sb]
	ldr r1, [sp]
	add r0, r0, r8
	cmp r1, r0
	blt _02028F34
	add r6, r6, #1
_02028F68:
	ldr r0, [sb, #4]
	add r0, r0, r7
	cmp r6, r0
	blt _02028F18
	mov r0, sl
	bl sub_02027AA0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02028EE8

	arm_func_start sub_02028F88
sub_02028F88: ; 0x02028F88
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0202843C
	mov r1, r4
	bl sub_0200B3C0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02028F88

	arm_func_start sub_02028FA0
sub_02028FA0: ; 0x02028FA0
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028FC4 ; =_022A8908
	ldr r0, [r0, r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02028FC4: .word _022A8908
	arm_func_end sub_02028FA0

	arm_func_start sub_02028FC8
sub_02028FC8: ; 0x02028FC8
	ldr r0, _02028FDC ; =_020AFD9C
	ldrh r1, [r0]
	eor r1, r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0
_02028FDC: .word _020AFD9C
	arm_func_end sub_02028FC8

	arm_func_start sub_02028FE0
sub_02028FE0: ; 0x02028FE0
	ldr r1, _02028FF8 ; =0x00000904
	ldr r2, _02028FFC ; =_022A9A5C
	mov r3, #0
	smlabb r0, r0, r1, r2
	str r3, [r0, #0x900]
	bx lr
	.align 2, 0
_02028FF8: .word 0x00000904
_02028FFC: .word _022A9A5C
	arm_func_end sub_02028FE0

	arm_func_start sub_02029000
sub_02029000: ; 0x02029000
	ldr r2, _02029034 ; =_022A9A5C
	ldr r1, _02029038 ; =0x00000904
	smlabb r2, r0, r1, r2
	ldr r0, [r2, #0x900]
	add r1, r0, #1
	mov r0, r0, lsl #0x10
	str r1, [r2, #0x900]
	cmp r1, #0x10
	mov r1, r0, asr #0x10
	movge r0, #0x10
	strge r0, [r2, #0x900]
	add r0, r2, r1, lsl #4
	bx lr
	.align 2, 0
_02029034: .word _022A9A5C
_02029038: .word 0x00000904
	arm_func_end sub_02029000

	arm_func_start sub_0202903C
sub_0202903C: ; 0x0202903C
	ldr r0, _0202904C ; =_020AFD9C
	ldr ip, _02029050 ; =sub_02028FE0
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_0202904C: .word _020AFD9C
_02029050: .word sub_02028FE0
	arm_func_end sub_0202903C

	arm_func_start sub_02029054
sub_02029054: ; 0x02029054
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r2, _02029144 ; =_020AFD9C
	ldr r1, _02029148 ; =0x00000904
	ldrh sl, [r2]
	ldr r6, _0202914C ; =_022A9A5C
	ldr r2, _02029150 ; =_022AA35C
	mul r3, sl, r1
	smlabb r4, sl, r1, r6
	ldr r1, [r2, r3]
	add r5, r4, #0x100
	mov fp, r0
	mov r4, r1, lsl #0x10
	add sb, r6, r3
	mov r7, #0
	b _02029120
_02029094:
	add r8, sb, r7, lsl #4
	ldr r6, [r8, #4]
	b _02029100
_020290A0:
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #27
	ldr r2, [r8]
	add r0, r1, r0, ror #27
	str r0, [sp, #4]
	str r2, [sp]
	b _020290E4
_020290BC:
	ldr r0, [sp, #4]
	mov r1, r2, lsl #1
	add r0, r5, r0, lsl #6
	ldrh r2, [r1, r0]
	mov r0, fp
	add r1, sp, #0
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_020290E4:
	ldr r1, [r8]
	ldr r0, [r8, #8]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _020290BC
	add r6, r6, #1
_02029100:
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	add r0, r1, r0
	cmp r6, r0
	blt _020290A0
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02029120:
	cmp r7, r4, asr #16
	blt _02029094
	ldr r0, _02029148 ; =0x00000904
	ldr r1, _0202914C ; =_022A9A5C
	mov r2, #0
	smlabb r0, sl, r0, r1
	str r2, [r0, #0x900]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02029144: .word _020AFD9C
_02029148: .word 0x00000904
_0202914C: .word _022A9A5C
_02029150: .word _022AA35C
	arm_func_end sub_02029054

	arm_func_start sub_02029154
sub_02029154: ; 0x02029154
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _020291F0 ; =_020AFD9C
	mov r7, r0
	ldrh r0, [r4]
	mov r6, r1
	mov r5, r2
	eor r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r4, r3
	bl sub_02029000
	ldr r1, _020291F0 ; =_020AFD9C
	ldr ip, _020291F4 ; =_022A9A5C
	ldrh r3, [r1]
	ldr r2, _020291F8 ; =0x00000904
	add r1, r7, r5
	str r7, [r0]
	eor r3, r3, #1
	smlabb r2, r3, r2, ip
	str r6, [r0, #4]
	str r5, [r0, #8]
	str r4, [r0, #0xc]
	add r5, r2, #0x100
	add ip, r6, r4
	mov r3, #0
	b _020291E4
_020291BC:
	mov r0, r6, lsl #5
	mov r4, r7
	add r0, r5, r0, lsl #1
	b _020291D8
_020291CC:
	mov r2, r4, lsl #1
	strh r3, [r2, r0]
	add r4, r4, #1
_020291D8:
	cmp r4, r1
	blt _020291CC
	add r6, r6, #1
_020291E4:
	cmp r6, ip
	blt _020291BC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020291F0: .word _020AFD9C
_020291F4: .word _022A9A5C
_020291F8: .word 0x00000904
	arm_func_end sub_02029154

	arm_func_start sub_020291FC
sub_020291FC: ; 0x020291FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _0202946C ; =_020AFD9C
	mov r5, r0
	ldrh r0, [r4]
	mov r4, r1
	mov r8, r2
	eor r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r7, r3
	ldr r6, [sp, #0x18]
	bl sub_02029000
	ldr r1, _0202946C ; =_020AFD9C
	ldr ip, _02029470 ; =_022A9A5C
	ldrh r3, [r1]
	ldr r1, _02029474 ; =0x00000904
	ldrb r2, [sp, #0x1c]
	str r5, [r0]
	eor r3, r3, #1
	smlabb r1, r3, r1, ip
	stmib r0, {r4, r8}
	str r7, [r0, #0xc]
	cmp r2, #0
	add r1, r1, #0x100
	beq _020292BC
	orr r2, r6, #0x400
	mov r2, r2, lsl #0x10
	add r3, r5, r8
	mov r6, r2, lsr #0x10
	sub ip, r3, #1
	add lr, r4, r7
	b _020292B0
_0202927C:
	mov r2, r4, lsl #5
	mov r8, ip
	add r3, r1, r2, lsl #1
	b _020292A4
_0202928C:
	add r2, r6, #1
	mov r7, r8, lsl #1
	mov r2, r2, lsl #0x10
	strh r6, [r7, r3]
	mov r6, r2, lsr #0x10
	sub r8, r8, #1
_020292A4:
	cmp r8, r5
	bge _0202928C
	add r4, r4, #1
_020292B0:
	cmp r4, lr
	blt _0202927C
	b _02029310
_020292BC:
	add r2, r5, r8
	add r3, r4, r7
	b _02029308
_020292C8:
	mov r8, r4, lsr #0x1f
	rsb r7, r8, r4, lsl #27
	add r7, r8, r7, ror #27
	mov r7, r7, lsl #5
	mov ip, r5
	add r8, r1, r7, lsl #1
	b _020292FC
_020292E4:
	add r7, r6, #1
	mov lr, ip, lsl #1
	mov r7, r7, lsl #0x10
	strh r6, [lr, r8]
	mov r6, r7, lsr #0x10
	add ip, ip, #1
_020292FC:
	cmp ip, r2
	blt _020292E4
	add r4, r4, #1
_02029308:
	cmp r4, r3
	blt _020292C8
_02029310:
	ldrb r2, [sp, #0x20]
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, [r0]
	subs r2, r2, #1
	str r2, [r0]
	movmi r2, #0
	strmi r2, [r0]
	ldr r2, [r0, #4]
	subs r2, r2, #1
	str r2, [r0, #4]
	movmi r2, #0
	strmi r2, [r0, #4]
	ldr r2, [r0, #8]
	add r2, r2, #1
	str r2, [r0, #8]
	cmp r2, #0x20
	movgt r2, #0x20
	strgt r2, [r0, #8]
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	cmp r2, #0x20
	movgt r2, #0x20
	strgt r2, [r0, #0xc]
	ldr r5, [r0, #0xc]
	ldmia r0, {r2, r3, r6}
	mov r0, r3, lsl #0x10
	mov r4, r2, lsl #0x10
	mov r5, r5, lsl #0x10
	mov r3, r6, lsl #0x10
	movs r2, r0, asr #0x10
	mov r4, r4, asr #0x10
	bmi _020293D8
	mov r0, r2, lsl #5
	mov r8, r4
	add ip, r4, r3, asr #16
	add r6, r1, r0, lsl #1
	mov r7, #0
	b _020293D0
_020293B0:
	cmp r8, #0
	blt _020293C4
	cmp r8, #0x20
	movlt r0, r8, lsl #1
	strlth r7, [r0, r6]
_020293C4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_020293D0:
	cmp r8, ip
	ble _020293B0
_020293D8:
	add r3, r4, r3, asr #16
	add r0, r2, r5, asr #16
	mov r5, r3, lsl #0x10
	mov r8, r5, asr #0x10
	mov lr, #0
	mov ip, r4, lsl #1
	mov r6, r8, lsl #1
	mov r7, lr
	b _02029420
_020293FC:
	cmp r4, #0
	addge r5, r1, r2, lsl #6
	strgeh lr, [ip, r5]
	cmp r8, #0x20
	addlt r5, r1, r2, lsl #6
	add r2, r2, #1
	mov r2, r2, lsl #0x10
	strlth r7, [r6, r5]
	mov r2, r2, asr #0x10
_02029420:
	cmp r2, r0
	blt _020293FC
	cmp r2, #0x18
	ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r2, lsl #5
	add r1, r1, r0, lsl #1
	mov r2, #0
	b _02029460
_02029440:
	cmp r4, #0
	blt _02029454
	cmp r4, #0x20
	movlt r0, r4, lsl #1
	strlth r2, [r0, r1]
_02029454:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02029460:
	cmp r4, r3
	ble _02029440
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202946C: .word _020AFD9C
_02029470: .word _022A9A5C
_02029474: .word 0x00000904
	arm_func_end sub_020291FC

	arm_func_start sub_02029478
sub_02029478: ; 0x02029478
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mvn r2, #0
	cmp r1, r2
	ldrnesh r2, [r0, #0x24]
	cmpne r1, r2
	beq _020294FC
	ldrb r0, [r0, #0x26]
	cmp r0, #0
	bne _020294D0
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #1
	ldr r0, _02029504 ; =CURSOR_ANIMATION_CONTROL
	str r2, [sp, #8]
	mov r2, #0
	mov r3, #0x3f8
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	b _020294FC
_020294D0:
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov ip, #1
	str ip, [sp, #8]
	ldr r0, _02029508 ; =CURSOR_16_ANIMATION_CONTROL
	mov r2, #0
	mov r3, #0x7c
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
_020294FC:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029504: .word CURSOR_ANIMATION_CONTROL
_02029508: .word CURSOR_16_ANIMATION_CONTROL
	arm_func_end sub_02029478

	arm_func_start LoadCursors
LoadCursors: ; 0x0202950C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02029654 ; =PREV_MENU_ITEMS
	mov r1, #0
	mov r2, #0x15
	bl memset
	ldr r0, _02029658 ; =WAN_TABLE
	ldr r1, _0202965C ; =_0209ADF0
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r2, _02029660 ; =CURSOR_16_SPRITE_ID
	ldr r1, _02029658 ; =WAN_TABLE
	strh r0, [r2, #2]
	ldr r0, [r1]
	ldr r1, _02029664 ; =_0209AE08
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02029660 ; =CURSOR_16_SPRITE_ID
	mov r3, #1
	strh r0, [r1]
	str r3, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrsh r0, [r1, #2]
	mov r1, #0x3f8
	mov r2, #0xf
	bl sub_0201D9C8
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _02029660 ; =CURSOR_16_SPRITE_ID
	mov r1, #0x7c
	ldrsh r0, [r0]
	mov r2, #0xe
	bl sub_0201D9C8
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	ldr r1, _02029660 ; =CURSOR_16_SPRITE_ID
	ldrsh r1, [r1, #2]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	mov r2, r1
	mov r3, #0x3f8
	bl SetAnimationForAnimationControl
	mov r1, #0
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x38]
	bl sub_0201C108
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	ldr r1, _02029660 ; =CURSOR_16_SPRITE_ID
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	mov r1, #0
	mov r2, r1
	mov r3, #0x7c
	bl SetAnimationForAnimationControl
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	mov r1, #0
	strh r1, [r0, #0x38]
	bl sub_0201C108
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029654: .word PREV_MENU_ITEMS
_02029658: .word WAN_TABLE
_0202965C: .word _0209ADF0
_02029660: .word CURSOR_16_SPRITE_ID
_02029664: .word _0209AE08
_02029668: .word CURSOR_ANIMATION_CONTROL
_0202966C: .word CURSOR_16_ANIMATION_CONTROL
	arm_func_end LoadCursors

	arm_func_start InitWindowTrailer
InitWindowTrailer: ; 0x02029670
	mov r1, #0
	str r1, [r0]
	strb r1, [r0, #4]
	strb r1, [r0, #0x19]
	strb r1, [r0, #0x18]
	bx lr
	arm_func_end InitWindowTrailer

	arm_func_start sub_02029688
sub_02029688: ; 0x02029688
	cmp r2, #1
	cmpeq r3, #0
	moveq r2, #2
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, r2
	ldreq r3, [r0, #8]
	ldreq r1, [sp]
	cmpeq r3, r1
	ldreq r3, [r0, #0xc]
	ldreq r1, [sp, #4]
	cmpeq r3, r1
	bxeq lr
	str r2, [r0]
	mov r1, #1
	ldr r2, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp, #4]
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02029688

	arm_func_start sub_020296E8
sub_020296E8: ; 0x020296E8
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, r2
	ldreq r3, [r0, #8]
	ldreq r1, [sp]
	cmpeq r3, r1
	ldreq r3, [r0, #0xc]
	ldreq r1, [sp, #4]
	cmpeq r3, r1
	ldreq r3, [r0, #0x10]
	ldreq r1, [sp, #8]
	cmpeq r3, r1
	ldreq r3, [r0, #0x14]
	ldreq r1, [sp, #0xc]
	cmpeq r3, r1
	bxeq lr
	str r2, [r0]
	mov r1, #1
	ldr r2, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp, #4]
	str r2, [r0, #8]
	ldr r2, [sp, #8]
	str r1, [r0, #0xc]
	ldr r1, [sp, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020296E8

	arm_func_start sub_02029758
sub_02029758: ; 0x02029758
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0xc0]
	mov r5, r0
	mov r6, r2
	cmp r1, #0
	ble _0202980C
	ldr r0, [r4, #0x10]
	tst r0, #0x4000000
	bne _020297C8
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl GetPageItemYOffset
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xb0]
	mov r3, r6
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [r4]
	mov r2, #1
	add r0, r1, r0
	str r0, [sp, #4]
	ldrb r1, [r4, #0xd4]
	mov r0, r5
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_020297C8:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029820
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
	b _02029820
_0202980C:
	mov r0, #0
	str r0, [r5]
	strb r0, [r5, #4]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
_02029820:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02029758

	arm_func_start sub_02029828
sub_02029828: ; 0x02029828
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0xc0]
	mov r5, r0
	mov r6, r2
	cmp r1, #0
	ble _020298DC
	ldr r0, [r4, #0x10]
	tst r0, #0x4000000
	bne _02029898
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02033350
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xb0]
	mov r3, r6
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [r4]
	mov r2, #1
	add r0, r1, r0
	str r0, [sp, #4]
	ldrb r1, [r4, #0xd4]
	mov r0, r5
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029898:
	mov r0, r4
	bl sub_020333B4
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02033390
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _020298F0
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
	b _020298F0
_020298DC:
	mov r0, #0
	str r0, [r5]
	strb r0, [r5, #4]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
_020298F0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02029828

	arm_func_start sub_020298F8
sub_020298F8: ; 0x020298F8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0x10]
	mov r5, r0
	mov lr, r2
	tst r1, #0x4000000
	bne _02029950
	ldr ip, [r4, #8]
	ldr r1, [sp, #0x18]
	mov r2, r3
	add r1, ip, r1
	str r1, [sp]
	ldr ip, [r4]
	ldr r1, [sp, #0x1c]
	mov r3, lr
	add r1, ip, r1
	str r1, [sp, #4]
	ldrb r1, [r4, #0xd4]
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029950:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029990
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
_02029990:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020298F8

	arm_func_start sub_02029998
sub_02029998: ; 0x02029998
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r4, r1
	ldr r1, [r4, #0x10]
	mov r5, r0
	mov lr, r2
	tst r1, #0x4000000
	bne _02029A08
	ldr r1, [r4, #8]
	ldr r6, [sp, #0x28]
	ldr r7, [sp, #0x30]
	ldr ip, [r4]
	ldr r2, [sp, #0x2c]
	add r8, r1, r6
	ldr r6, [sp, #0x34]
	str r8, [sp]
	add r8, ip, r2
	mov r2, r3
	str r8, [sp, #4]
	add r1, r1, r7
	str r1, [sp, #8]
	add r1, ip, r6
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0xd4]
	mov r3, lr
	bl sub_020296E8
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029A08:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029A48
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
_02029A48:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02029998
