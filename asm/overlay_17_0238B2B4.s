	.include "asm/macros.inc"
	.include "overlay_17_0238B2B4.inc"

	.text

	arm_func_start ov17_0238B2B4
ov17_0238B2B4: ; 0x0238B2B4
	stmdb sp!, {r3, lr}
	bl sub_0203A5A8
	cmp r0, #0
	beq _0238B31C
	bl sub_0203A9EC
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_0203AAB0
	ldr r1, _0238B368 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	add r1, r1, #0x200
	strh r0, [r1, #0x58]
	bl sub_0203A5F0
	ldr r0, _0238B368 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x1e
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
_0238B31C:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _0238B33C
	bl sub_0203A51C
	mov r0, #0
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B33C:
	ldr r2, _0238B368 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r2]
	add r1, r1, #0x200
	strh r0, [r1, #0x58]
	ldr r0, [r2]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_0203FA64
	mov r0, #0xe
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B368: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B2B4

	arm_func_start ov17_0238B36C
ov17_0238B36C: ; 0x0238B36C
	ldr r0, _0238B38C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #0x28
	ldr r2, [r0]
	mov r1, #0xf
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B38C: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B36C

	arm_func_start ov17_0238B390
ov17_0238B390: ; 0x0238B390
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0238B4CC ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _0238B4CC ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuResult__0202B870
	sub r0, r0, #5
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0238B4BC
_0238B3CC: ; jump table
	b _0238B3EC ; case 0
	b _0238B3F8 ; case 1
	b _0238B46C ; case 2
	b _0238B478 ; case 3
	b _0238B484 ; case 4
	b _0238B490 ; case 5
	b _0238B49C ; case 6
	b _0238B4BC ; case 7
_0238B3EC:
	mov r0, #0x10
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B3F8:
	mov sl, #0
	ldr r6, _0238B4CC ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r4, _0238B4D0 ; =0x0000022B
	ldr r7, _0238B4D4 ; =TEAM_MEMBER_TABLE_PTR
	mov r8, sl
	mov sb, #1
	mov r5, #0x44
_0238B414:
	smulbb r0, sl, r5
	ldr r1, [r7]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	ldrne r0, [r6]
	addne r0, r0, #0x200
	ldrnesh r0, [r0, #0x58]
	cmpne r0, sl
	beq _0238B44C
	mov r0, sl
	bl sub_02056410
_0238B44C:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov sl, r0, asr #0x10
	bgt _0238B414
	mov r0, #0x13
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B46C:
	mov r0, #0x15
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B478:
	mov r0, #0x18
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B484:
	mov r0, #0x1e
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B490:
	mov r0, #0x20
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B49C:
	ldr r0, _0238B4CC ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x22
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B4BC:
	bl sub_0203A638
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238B4CC: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
_0238B4D0: .word 0x0000022B
_0238B4D4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ov17_0238B390

	arm_func_start ov17_0238B4D8
ov17_0238B4D8: ; 0x0238B4D8
	ldr r1, _0238B50C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0x11
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B50C: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B4D8

	arm_func_start ov17_0238B510
ov17_0238B510: ; 0x0238B510
	stmdb sp!, {r3, lr}
	mov r0, #5
	bl sub_02017C50
	ldr r0, _0238B530 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B530: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B510

	arm_func_start ov17_0238B534
ov17_0238B534: ; 0x0238B534
	stmdb sp!, {r3, lr}
	mov r0, #5
	bl IsMePlaying
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B578 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl TryAddMonsterToActiveTeam
	bl sub_02057444
	bl ov11_022DC504
	ldr r0, _0238B578 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B578: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B534

	arm_func_start ov17_0238B57C
ov17_0238B57C: ; 0x0238B57C
	stmdb sp!, {r3, lr}
	ldr r1, _0238B5D8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r0, [r1]
	add r2, r3, #0x1400
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x30]
	ldr r0, [r1]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_02056554
	bl sub_02057444
	ldr r0, _0238B5D8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B5D8: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B57C

	arm_func_start ov17_0238B5DC
ov17_0238B5DC: ; 0x0238B5DC
	stmdb sp!, {r3, lr}
	bl ov11_022DC504
	ldr r0, _0238B5F8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B5F8: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B5DC

	arm_func_start ov17_0238B5FC
ov17_0238B5FC: ; 0x0238B5FC
	stmdb sp!, {r3, lr}
	ldr r1, _0238B684 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r2, [r1]
	mov r0, #7
	strh r3, [r2, #0x7e]
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrsh r1, [r1, #0x58]
	orr r1, r1, #0x20000
	str r1, [r2, #0xc]
	bl IsMePlaying
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B684 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _0238B670
	bl sub_02058138
	ldr r0, _0238B684 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_020566C4
	bl sub_02057444
_0238B670:
	ldr r0, _0238B684 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B684: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B5FC

	arm_func_start ov17_0238B688
ov17_0238B688: ; 0x0238B688
	stmdb sp!, {r3, lr}
	mov r0, #7
	bl sub_02017C50
	ldr r0, _0238B6A8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B6A8: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B688

	arm_func_start ov17_0238B6AC
ov17_0238B6AC: ; 0x0238B6AC
	stmdb sp!, {r3, lr}
	mov r0, #7
	bl IsMePlaying
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B6D8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bl ov11_022DC504
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B6D8: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B6AC

	arm_func_start ov17_0238B6DC
ov17_0238B6DC: ; 0x0238B6DC
	ldr r1, _0238B710 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0x19
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B710: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B6DC

	arm_func_start ov17_0238B714
ov17_0238B714: ; 0x0238B714
	ldr r0, _0238B734 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #0x13
	ldr r2, [r0]
	mov r1, #0x1a
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B734: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B714

	arm_func_start ov17_0238B738
ov17_0238B738: ; 0x0238B738
	stmdb sp!, {r3, lr}
	ldr r0, _0238B7A4 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B7A4 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #0
	beq _0238B780
	cmp r0, #1
	ldmneia sp!,  {r3, pc}
	mov r0, #0
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B780:
	ldr r1, _0238B7A4 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r0, #0x1b
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrsh r1, [r1, #0x58]
	orr r1, r1, #0x20000
	str r1, [r2, #0xc]
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B7A4: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B738

	arm_func_start ov17_0238B7A8
ov17_0238B7A8: ; 0x0238B7A8
	ldr r0, _0238B7C8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x1c
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B7C8: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B7A8

	arm_func_start ov17_0238B7CC
ov17_0238B7CC: ; 0x0238B7CC
	stmdb sp!, {r3, lr}
	ldr r1, _0238B850 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r0, #3
	ldr r1, [r1]
	strh r0, [r1, #0x7e]
	bl sub_02017C50
	ldr r0, _0238B850 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _0238B81C
	bl sub_02058138
	ldr r0, _0238B850 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_020566C4
_0238B81C:
	ldr r0, _0238B850 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_02055B20
	bl sub_0203C9C4
#ifndef JAPAN
	bl sub_0203AF0C
#endif
	bl sub_02057180
	ldr r0, _0238B850 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x1d
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B850: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B7CC

	arm_func_start ov17_0238B854
ov17_0238B854: ; 0x0238B854
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl IsMePlaying
	cmp r0, #0
	ldreq r0, _0238B878 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	moveq r1, #0
	ldreq r0, [r0]
	streq r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B878: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B854

	arm_func_start ov17_0238B87C
ov17_0238B87C: ; 0x0238B87C
	ldr r0, _0238B89C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #0x40
	ldr r2, [r0]
	mov r1, #0x1f
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B89C: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B87C

	arm_func_start ov17_0238B8A0
ov17_0238B8A0: ; 0x0238B8A0
	stmdb sp!, {r3, lr}
	bl sub_0203F398
	cmp r0, #1
	ldmneia sp!,  {r3, pc}
	bl sub_0203F990
	ldr r0, _0238B8D0 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xc
	strb r2, [r1, #5]
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B8D0: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B8A0

	arm_func_start ov17_0238B8D4
ov17_0238B8D4: ; 0x0238B8D4
	ldr r0, _0238B8F4 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #0x80
	ldr r2, [r0]
	mov r1, #0x21
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B8F4: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B8D4

	arm_func_start ov17_0238B8F8
ov17_0238B8F8: ; 0x0238B8F8
	stmdb sp!, {r4, lr}
	bl sub_020407EC
	movs r4, r0
	beq _0238B91C
	ldr r0, _0238B95C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_0203FD80
_0238B91C:
	cmp r4, #1
	beq _0238B944
	cmp r4, #2
	beq _0238B938
	cmp r4, #7
	beq _0238B950
	ldmia sp!, {r4, pc}
_0238B938:
	mov r0, #0x24
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
_0238B944:
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
_0238B950:
	mov r0, #0x26
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238B95C: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B8F8

	arm_func_start ov17_0238B960
ov17_0238B960: ; 0x0238B960
	stmdb sp!, {r3, lr}
	ldr r1, _0238B9AC ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, _0238B9B0 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	ldr r1, [r0]
	add r0, r2, #0x200
	ldrsh r2, [r0, #0x58]
	mov r0, #0x44
	mov r3, #0
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	bl PrintIqSkillsMenu
	ldr r0, _0238B9AC ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0x23
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B9AC: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
_0238B9B0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ov17_0238B960

	arm_func_start ov17_0238B9B4
ov17_0238B9B4: ; 0x0238B9B4
	stmdb sp!, {r3, lr}
	bl sub_02041B7C
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl sub_020420F4
	bl sub_020572EC
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	arm_func_end ov17_0238B9B4

	arm_func_start ov17_0238B9D8
ov17_0238B9D8: ; 0x0238B9D8
	ldr r0, _0238B9F8 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #0x280
	ldr r2, [r0]
	mov r1, #0x25
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B9F8: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B9D8

	arm_func_start ov17_0238B9FC
ov17_0238B9FC: ; 0x0238B9FC
	stmdb sp!, {r4, lr}
	ldr r0, _0238BA7C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r4, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	ldr r0, _0238BA7C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #3
	beq _0238BA3C
	cmp r0, #4
	b _0238BA48
_0238BA3C:
	mov r0, #0x26
	bl ov17_0238B028
	b _0238BA4C
_0238BA48:
	mov r4, #1
_0238BA4C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _0238BA7C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _0238BA70
	bl sub_020307EC
_0238BA70:
	mov r0, #0x20
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238BA7C: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B9FC

	arm_func_start ov17_0238BA80
ov17_0238BA80: ; 0x0238BA80
	stmdb sp!, {r3, lr}
	bl sub_0203FD38
	ldr r1, _0238BAC4 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	str r0, [r1, #0x264]
	bl sub_02041094
	ldr r2, _0238BAC4 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov ip, #0x100
	ldr r1, [r2]
	mov r3, #0x27
	add r1, r1, #0x200
	strh r0, [r1, #0x68]
	ldr r0, [r2]
	strh ip, [r0, #0x7e]
	ldr r0, [r2]
	str r3, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238BAC4: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238BA80

	arm_func_start ov17_0238BAC8
ov17_0238BAC8: ; 0x0238BAC8
	stmdb sp!, {r3, lr}
	bl sub_02041A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x20
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	arm_func_end ov17_0238BAC8

	arm_func_start ov17_0238BAE4
ov17_0238BAE4: ; 0x0238BAE4
	ldr r1, _0238BB18 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0x29
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x78]
	bx lr
	.align 2, 0
_0238BB18: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238BAE4

	arm_func_start ov17_0238BB1C
ov17_0238BB1C: ; 0x0238BB1C
	ldr r0, _0238BB30 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238BB30: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238BB1C
	; 0x0238BB34

	.rodata
	.global ASSEMBLY_WINDOW_PARAMS_1
ASSEMBLY_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ASSEMBLY_WINDOW_PARAMS_2
ASSEMBLY_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x02, 0x0B, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ASSEMBLY_WINDOW_PARAMS_3
ASSEMBLY_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ASSEMBLY_WINDOW_PARAMS_4
ASSEMBLY_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x11, 0x1C, 0x05, 0x00, 0xFD, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ASSEMBLY_WINDOW_PARAMS_5
ASSEMBLY_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ASSEMBLY_MENU_ITEMS_CONFIRM
ASSEMBLY_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV17_DATA_OFFSET 0x38E2
#else
#define OV17_DATA_OFFSET 0
#endif
	.word 0x411 + OV17_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x412 + OV17_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global ASSEMBLY_MAIN_MENU_ITEMS_1
ASSEMBLY_MAIN_MENU_ITEMS_1:
	.word 0x414 + OV17_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x415 + OV17_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
	.global ASSEMBLY_MAIN_MENU_ITEMS_2
ASSEMBLY_MAIN_MENU_ITEMS_2:
	.word 0x413 + OV17_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x414 + OV17_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x415 + OV17_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
	.global ASSEMBLY_SUBMENU_ITEMS_1
ASSEMBLY_SUBMENU_ITEMS_1:
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.global ASSEMBLY_SUBMENU_ITEMS_2
ASSEMBLY_SUBMENU_ITEMS_2:
	.word 0x418 + OV17_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.global ASSEMBLY_SUBMENU_ITEMS_3
ASSEMBLY_SUBMENU_ITEMS_3:
	.word 0x417 + OV17_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
.global ASSEMBLY_SUBMENU_ITEMS_4
ASSEMBLY_SUBMENU_ITEMS_4:
	.word 0x418 + OV17_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x419 + OV17_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00
	.global ASSEMBLY_SUBMENU_ITEMS_5
ASSEMBLY_SUBMENU_ITEMS_5:
	.word 0x417 + OV17_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x419 + OV17_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.global ASSEMBLY_SUBMENU_ITEMS_6
ASSEMBLY_SUBMENU_ITEMS_6:
	.word 0x416 + OV17_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x418 + OV17_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00
	.global ASSEMBLY_SUBMENU_ITEMS_7
ASSEMBLY_SUBMENU_ITEMS_7:
	.word 0x416 + OV17_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x418 + OV17_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x419 + OV17_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x41A + OV17_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x41B + OV17_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x41C + OV17_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x41D + OV17_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00
	.global OVERLAY17_FUNCTION_POINTER_TABLE
OVERLAY17_FUNCTION_POINTER_TABLE:
	.word ov17_0238B048
	.word ov17_0238B07C
	.word ov17_0238B0B4
	.word ov17_0238B10C
	.word ov17_0238B194
	.word ov17_0238B1B8
	.word ov17_0238B1E8
	.word ov17_0238B20C
	.word ov17_0238B224
	.word ov17_0238B23C
	.word ov17_0238B260
	.word ov17_0238B278
	.word ov17_0238B290
	.word ov17_0238B2B4
	.word ov17_0238B36C
	.word ov17_0238B390
	.word ov17_0238B4D8
	.word ov17_0238B510
	.word ov17_0238B534
	.word ov17_0238B57C
	.word ov17_0238B5DC
	.word ov17_0238B5FC
	.word ov17_0238B688
	.word ov17_0238B6AC
	.word ov17_0238B6DC
	.word ov17_0238B714
	.word ov17_0238B738
	.word ov17_0238B7A8
	.word ov17_0238B7CC
	.word ov17_0238B854
	.word ov17_0238B87C
	.word ov17_0238B8A0
	.word ov17_0238B8D4
	.word ov17_0238B8F8
	.word ov17_0238B960
	.word ov17_0238B9B4
	.word ov17_0238B9D8
	.word ov17_0238B9FC
	.word ov17_0238BA80
	.word ov17_0238BAC8
	.word ov17_0238BAE4
	.word ov17_0238BB1C

	.data
	.global OVERLAY17_UNKNOWN_POINTER__NA_238BE00
OVERLAY17_UNKNOWN_POINTER__NA_238BE00:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
