	.include "asm/macros.inc"
	.include "overlay_29_0234D484.inc"

	.text

	arm_func_start ov29_0234D484
ov29_0234D484: ; 0x0234D484
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	bl StringFromId
	mov r4, r0
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, #1
	bl ov29_0234D304
	mov r0, r5
	mov r1, r4
	bl LogMessageQuiet
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234D484

	arm_func_start ov29_0234D4BC
ov29_0234D4BC: ; 0x0234D4BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov29_0234D558
	bl ov29_0234D630
	bl ov29_0234B034
	mov r1, r0
	mov r2, r7
	mov r3, r5
	mov r0, r6
	str r4, [sp]
	bl ov29_0234D750
	mov r4, r0
	ldrb r0, [sp, #0x18]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl ov29_0234D8A0
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234D4BC

	arm_func_start YesNoMenu
YesNoMenu: ; 0x0234D518
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r1
	mov r5, r2
	mov r4, r3
	bl StringFromId
	ldrb ip, [sp, #0x18]
	mov r1, r0
	mov r0, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov29_0234D4BC
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end YesNoMenu

	arm_func_start ov29_0234D558
ov29_0234D558: ; 0x0234D558
	stmdb sp!, {r4, lr}
	bl ov29_0234B73C
	mov r4, r0
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0xa
	mov r1, r0
	bl ov29_022EA370
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234D558

	arm_func_start DisplayMessageInternal
DisplayMessageInternal: ; 0x0234D590
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl StringFromId
	ldr r1, [sp, #0x18]
	ldrb ip, [sp, #0x1c]
	str r1, [sp]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp, #4]
	bl ov29_0234D5D0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessageInternal

	arm_func_start ov29_0234D5D0
ov29_0234D5D0: ; 0x0234D5D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #2
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl ov29_022EA428
	mov r0, #1
	bl ov29_0234B4CC
	bl ov29_0234DB58
	mov r0, r5
	bl ov29_0234DBE0
	mov r0, r7
	mov r3, r4
	str r6, [sp]
	ldr r1, [sp, #0x18]
	mov r2, #0
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	mov r0, r6
	ldrb r1, [sp, #0x1c]
	bl ov29_0234D8B4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234D5D0

	arm_func_start ov29_0234D630
ov29_0234D630: ; 0x0234D630
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_0234B4CC
	bl ov29_0234DB58
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234D630

	arm_func_start ov29_0234D650
ov29_0234D650: ; 0x0234D650
	ldr ip, _0234D658 ; =ov29_0234D9C0
	bx ip
	.align 2, 0
_0234D658: .word ov29_0234D9C0
	arm_func_end ov29_0234D650

	arm_func_start ov29_0234D65C
ov29_0234D65C: ; 0x0234D65C
	ldr ip, _0234D664 ; =ov29_0234DBE0
	bx ip
	.align 2, 0
_0234D664: .word ov29_0234DBE0
	arm_func_end ov29_0234D65C

	arm_func_start ov29_0234D668
ov29_0234D668: ; 0x0234D668
	stmdb sp!, {r3, lr}
	ldr r0, _0234D68C ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x12]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl HidePortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234D68C: .word ov29_02382800
	arm_func_end ov29_0234D668

	arm_func_start ov29_0234D690
ov29_0234D690: ; 0x0234D690
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl StringFromId
	ldrb ip, [sp, #0x18]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov29_0234DC3C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov29_0234D690

	arm_func_start ov29_0234D6C8
ov29_0234D6C8: ; 0x0234D6C8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r2
	mov r5, r1
	mov r4, r3
	bl ov29_0234DBE0
	ldrb ip, [sp, #0x18]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	str ip, [sp]
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov29_0234D6C8

	arm_func_start ov29_0234D70C
ov29_0234D70C: ; 0x0234D70C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	mov r7, r1
	mov r5, r3
	bl StringFromId
	mov r4, r0
	mov r0, r6
	bl ov29_0234DBE0
	mov r0, r4
	mov r1, r7
	mov r3, r5
	ldrb ip, [sp, #0x18]
	mov r2, #0
	str ip, [sp]
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234D70C

	arm_func_start ov29_0234D750
ov29_0234D750: ; 0x0234D750
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldrb ip, [sp, #0x20]
	mov r4, r2
	mov r6, r0
	mov r5, r1
	mov r2, #0
	mov r1, r3
	add r0, sp, #4
	mov r3, r2
	str ip, [sp]
	bl ov29_0234D860
	mov r0, r4
	bl ov29_0234DBE0
	mov r2, #1
	str r2, [sp]
	mov r0, r6
	mov r1, r5
	add r2, sp, #4
	mov r3, #0
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	ldr r0, _0234D7BC ; =ov29_02382800
	ldr r0, [r0]
	ldr r0, [r0, #0x46c]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0234D7BC: .word ov29_02382800
	arm_func_end ov29_0234D750

	arm_func_start ov29_0234D7C0
ov29_0234D7C0: ; 0x0234D7C0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl StringFromId
	ldrb r1, [sp, #0x20]
	mov r2, #0
	mov r4, r0
	str r1, [sp]
	add r0, sp, #4
	mov r1, r5
	mov r3, r2
	bl ov29_0234D860
	mov r0, r6
	bl ov29_0234DBE0
	mov r2, #1
	str r2, [sp]
	mov r0, r4
	mov r1, r7
	add r2, sp, #4
	mov r3, #0
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	ldr r0, _0234D834 ; =ov29_02382800
	ldr r0, [r0]
	ldr r0, [r0, #0x46c]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0234D834: .word ov29_02382800
	arm_func_end ov29_0234D7C0

	arm_func_start ov29_0234D838
ov29_0234D838: ; 0x0234D838
	stmdb sp!, {r3, lr}
	ldr r0, _0234D85C ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x10]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F334
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234D85C: .word ov29_02382800
	arm_func_end ov29_0234D838

	arm_func_start ov29_0234D860
ov29_0234D860: ; 0x0234D860
	ldrb ip, [sp]
	strb r3, [r0]
	strb ip, [r0, #1]
	strh r1, [r0, #2]
	str r2, [r0, #4]
	bx lr
	arm_func_end ov29_0234D860

	arm_func_start ov29_0234D878
ov29_0234D878: ; 0x0234D878
	ldr r1, _0234D888 ; =ov29_02382800
	ldr r1, [r1]
	str r0, [r1, #0x474]
	bx lr
	.align 2, 0
_0234D888: .word ov29_02382800
	arm_func_end ov29_0234D878

	arm_func_start ov29_0234D88C
ov29_0234D88C: ; 0x0234D88C
	ldr r0, _0234D89C ; =ov29_02382800
	ldr r0, [r0]
	ldr r0, [r0, #0x46c]
	bx lr
	.align 2, 0
_0234D89C: .word ov29_02382800
	arm_func_end ov29_0234D88C

	arm_func_start ov29_0234D8A0
ov29_0234D8A0: ; 0x0234D8A0
	ldr ip, _0234D8B0 ; =ov29_0234D8B4
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_0234D8B0: .word ov29_0234D8B4
	arm_func_end ov29_0234D8A0

	arm_func_start ov29_0234D8B4
ov29_0234D8B4: ; 0x0234D8B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0234D9BC ; =ov29_02382800
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	beq _0234D970
	ldrsb r0, [r0, #0x12]
	mvn r1, #1
	cmp r0, r1
	beq _0234D8E4
	bl HidePortraitBox
_0234D8E4:
	ldr r0, _0234D9BC ; =ov29_02382800
	ldr r0, [r0]
	ldrsb r0, [r0, #0x10]
	bl sub_0202F334
	mov r0, #8
	mov r1, #0x62
	bl ov29_022EA370
	ldr r0, _0234D9BC ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x11]
	cmp r0, r1
	beq _0234D91C
	bl CloseParentMenu
_0234D91C:
	ldr r0, _0234D9BC ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x12]
	cmp r0, r1
	beq _0234D948
	bl ClosePortraitBox
	ldr r0, _0234D9BC ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x12]
_0234D948:
	ldr r0, _0234D9BC ; =ov29_02382800
	ldr r0, [r0]
	ldrsb r0, [r0, #0x10]
	bl CloseDialogueBox
	ldr r0, _0234D9BC ; =ov29_02382800
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234D9BC ; =ov29_02382800
	mov r1, #0
	str r1, [r0]
_0234D970:
	mov r0, #0x62
	bl AdvanceFrame
	cmp r5, #0
	beq _0234D994
	bl ov29_022F2FE4
	bl ov29_02339148
	mov r0, #8
	mov r1, #9
	bl ov29_022EA370
_0234D994:
	cmp r4, #0
	beq _0234D9A8
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234D9A8:
	bl sub_02006B70
	bl ov29_022E0B44
	mov r0, #0
	bl ov29_0234B4CC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234D9BC: .word ov29_02382800
	arm_func_end ov29_0234D8B4

	arm_func_start ov29_0234D9C0
ov29_0234D9C0: ; 0x0234D9C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mvn r8, #1
	mov r7, #0
	ldr r6, _0234DB50 ; =ov29_02382800
	sub r5, r8, #3
	sub r4, r8, #2
	mov sb, #1
	mov fp, r7
_0234D9E0:
	mov r0, #0x62
	bl AdvanceFrame
	ldr r1, [r6]
	ldrb r0, [r1, #0x466]
	cmp r0, #0
	beq _0234DB2C
	add r0, r1, #0x400
	ldrsh r0, [r0, #0x6a]
	mov sl, #0
	cmp r0, #0
	bne _0234DA90
	ldrsb r0, [r1, #0x10]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0234DB44
	ldr r0, [r6]
	add r0, r0, #0x400
	strh sb, [r0, #0x6a]
	ldr r0, [r6]
	ldr r3, [r0, #0x470]
	ldrb r0, [r0, #0x467]
	cmp r3, #0
	ldreq r3, _0234DB54 ; =ov29_02353398
	cmp r0, #0
	movne r1, #0x11
	mov r0, #0
	moveq r1, #0x13
	mov r2, r0
	bl CreateParentMenuFromStringIds
	ldr r1, [r6]
	strb r0, [r1, #0x11]
	ldr r1, [r6]
	ldrsb r0, [r1, #0x11]
	add r1, r1, #0x400
	ldrsh r1, [r1, #0x68]
	bl sub_0202AB94
	ldr r0, [r6]
	ldr r0, [r0, #0x474]
	cmp r0, #0
	beq _0234DB44
	blx r0
	ldr r0, [r6]
	str fp, [r0, #0x474]
	b _0234DB44
_0234DA90:
	ldrsb r0, [r1, #0x11]
	bl sub_020282F4
	ldr r2, [r6]
	ldrb r1, [r2, #0x467]
	cmp r1, #0
	cmpeq r0, r5
	moveq r0, #2
	streq r0, [r2, #0x46c]
	moveq sl, #1
	beq _0234DAD4
	cmp r0, r4
	bne _0234DAD4
	ldrsb r0, [r2, #0x11]
	bl sub_0202ABB0
	ldr r1, [r6]
	mov sl, #1
	str r0, [r1, #0x46c]
_0234DAD4:
	cmp sl, #0
	beq _0234DB44
	ldr r0, [r6]
	ldrsb r0, [r0, #0x11]
	cmp r0, r8
	beq _0234DAF8
	bl CloseParentMenu
	ldr r0, [r6]
	strb r8, [r0, #0x11]
_0234DAF8:
	ldr r0, [r6]
	add r0, r0, #0x400
	strh r7, [r0, #0x6a]
	ldr r0, [r6]
	strb r7, [r0, #0x466]
	ldr r0, [r6]
	strb r7, [r0, #0x467]
	ldr r0, [r6]
	add r0, r0, #0x400
	strh r7, [r0, #0x68]
	ldr r0, [r6]
	str r7, [r0, #0x470]
	b _0234DB44
_0234DB2C:
	ldrsb r0, [r1, #0x10]
	bl IsDialogueBoxActive
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and sl, r0, #0xff
_0234DB44:
	cmp sl, #0
	beq _0234D9E0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234DB50: .word ov29_02382800
_0234DB54: .word ov29_02353398
	arm_func_end ov29_0234D9C0

	arm_func_start ov29_0234DB58
ov29_0234DB58: ; 0x0234DB58
	stmdb sp!, {r3, lr}
	ldr r0, _0234DBD8 ; =0x00000478
	mov r1, #8
	bl MemAlloc
	ldr r2, _0234DBDC ; =ov29_02382800
	ldr r1, _0234DBD8 ; =0x00000478
	str r0, [r2]
	bl MemZero
	ldr r0, _0234DBDC ; =ov29_02382800
	mvn r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x46c]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl InitPreprocessorArgs
	ldr r1, _0234DBDC ; =ov29_02382800
	mov r3, #0
	ldr r0, [r1]
	sub r2, r3, #2
	strb r3, [r0, #0x466]
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r3, [r0, #0x6a]
	ldr r0, [r1]
	strb r2, [r0, #0x12]
	ldr r0, [r1]
	strb r2, [r0, #0x11]
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	str r3, [r0, #0x474]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234DBD8: .word 0x00000478
_0234DBDC: .word ov29_02382800
	arm_func_end ov29_0234DB58

	arm_func_start ov29_0234DBE0
ov29_0234DBE0: ; 0x0234DBE0
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	ldr r1, _0234DC38 ; =ov29_02382800
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x12]
	cmp r1, r0
	bne _0234DC20
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0234DC38 ; =ov29_02382800
	ldr r1, [r1]
	strb r0, [r1, #0x12]
_0234DC20:
	ldr r0, _0234DC38 ; =ov29_02382800
	mov r1, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x12]
	bl ShowPortraitInPortraitBox
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234DC38: .word ov29_02382800
	arm_func_end ov29_0234DBE0

	arm_func_start ov29_0234DC3C
ov29_0234DC3C: ; 0x0234DC3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0234DD88 ; =ov29_02382800
	mvn ip, #1
	ldr r4, [r4]
	mov r7, r0
	ldrsb r0, [r4, #0x10]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, ip
	bne _0234DC8C
	mov r0, #0
	bl CreateDialogueBox
	ldr r2, _0234DD88 ; =ov29_02382800
	mov r1, #0
	ldr r3, [r2]
	strb r0, [r3, #0x10]
	ldr r0, [r2]
	ldrsb r0, [r0, #0x10]
	bl sub_0202F474
_0234DC8C:
	ldr r0, _0234DD88 ; =ov29_02382800
	mov r8, r6
	ldr sb, [r0]
	mov ip, #5
	add lr, sb, #0x14
_0234DCA0:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0234DCA0
	ldr r1, _0234DD8C ; =0x00001004
	add r0, sb, #0x400
	strh r1, [r0, #0x64]
	cmp r4, #0
	beq _0234DCDC
	ldr r0, _0234DD88 ; =ov29_02382800
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0, #0x64]
	orr r1, r1, #0x2000
	strh r1, [r0, #0x64]
_0234DCDC:
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _0234DD24
	cmp r5, #0
	beq _0234DD0C
	ldr r0, _0234DD88 ; =ov29_02382800
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0, #0x64]
	orr r1, r1, #8
	strh r1, [r0, #0x64]
	b _0234DD24
_0234DD0C:
	ldr r0, _0234DD88 ; =ov29_02382800
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0, #0x64]
	orr r1, r1, #0x18
	strh r1, [r0, #0x64]
_0234DD24:
	cmp r5, #0
	beq _0234DD64
	ldr r1, _0234DD88 ; =ov29_02382800
	mov r2, #1
	ldr r0, [r1]
	strb r2, [r0, #0x466]
	ldrb r2, [r5, #1]
	ldr r0, [r1]
	strb r2, [r0, #0x467]
	ldr r0, [r1]
	ldrsh r2, [r5, #2]
	add r0, r0, #0x400
	strh r2, [r0, #0x68]
	ldr r2, [r5, #4]
	ldr r0, [r1]
	str r2, [r0, #0x470]
_0234DD64:
	ldr r0, _0234DD88 ; =ov29_02382800
	mov r2, r7
	ldr r0, [r0]
	mov r3, r6
	add r1, r0, #0x400
	ldrsb r0, [r0, #0x10]
	ldrh r1, [r1, #0x64]
	bl ShowStringInDialogueBox
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234DD88: .word ov29_02382800
_0234DD8C: .word 0x00001004
	arm_func_end ov29_0234DC3C

	arm_func_start ov29_0234DD90
ov29_0234DD90: ; 0x0234DD90
	ldr ip, _0234DD9C ; =LoadOverlay
	mov r0, #0x22
	bx ip
	.align 2, 0
_0234DD9C: .word LoadOverlay
	arm_func_end ov29_0234DD90

	arm_func_start ov29_0234DDA0
ov29_0234DDA0: ; 0x0234DDA0
	ldr ip, _0234DDAC ; =OverlayIsLoaded
	mov r0, #0x22
	bx ip
	.align 2, 0
_0234DDAC: .word OverlayIsLoaded
	arm_func_end ov29_0234DDA0

	arm_func_start ov29_0234DDB0
ov29_0234DDB0: ; 0x0234DDB0
	stmdb sp!, {r3, lr}
	mov r0, #0x22
	bl OverlayIsLoaded
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x22
	bl UnloadOverlay
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234DDB0
