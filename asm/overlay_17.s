	.include "asm/macros.inc"
	.include "overlay_17.inc"

	.text

; https://decomp.me/scratch/EJVO7
	arm_func_start ov17_0238A140
ov17_0238A140: ; 0x0238A140
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_0203C760
	mov r0, #0x26c
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A270 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r2, #1
	str r0, [r1]
	strb r2, [r0, #9]
	ldr r0, [r1]
	add r0, r0, #0xc
	bl InitPreprocessorArgs
	ldr lr, _0238A270 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r2, #0
	ldr r0, [lr]
	mov r4, #2
	str r2, [r0, #0x6c]
	ldr r0, [lr]
	sub r1, r2, #1
	str r2, [r0, #0x70]
	ldr r5, [lr]
	ldr ip, _0238A274 ; =ov11_0238A08C
	ldr r3, [r5, #0x70]
	sub r0, r4, #4
	str r3, [r5, #0x78]
	ldr r3, [lr]
	str r2, [r3, #0x74]
	ldr r3, [lr]
	strh r2, [r3, #0x7c]
	ldr r3, [lr]
	strh r2, [r3, #0x7e]
	ldr r3, [lr]
	add r3, r3, #0x200
	strh r1, [r3, #0x58]
	ldr r3, [lr]
	str r2, [r3, #0x80]
	ldr r3, [lr]
	add r3, r3, #0x200
	strh r4, [r3, #0x5a]
	ldr r3, [lr]
	add r3, r3, #0x200
	strh r4, [r3, #0x5c]
	ldr r3, [lr]
	str r2, [r3, #0x264]
	ldr r2, [lr]
	add r2, r2, #0x200
	strh r1, [r2, #0x68]
	ldr r2, [ip]
	ldr r1, [lr]
	str r2, [r1, #0x260]
	ldr r1, [lr]
	strb r0, [r1]
	ldr r1, [lr]
	strb r0, [r1, #1]
	ldr r1, [lr]
	strb r0, [r1, #2]
	ldr r1, [lr]
	strb r0, [r1, #3]
	ldr r1, [lr]
	strb r0, [r1, #4]
	ldr r1, [lr]
	strb r0, [r1, #5]
	ldr r1, [lr]
	strb r0, [r1, #6]
	ldr r1, [lr]
	strb r0, [r1, #7]
	ldr r1, [lr]
	strb r0, [r1, #8]
	ldr r0, [lr]
	add r0, r0, #0x84
	bl sub_02034A38
	ldr r1, _0238A270 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	str r0, [r1, #0x80]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238A270: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
_0238A274: .word ov11_0238A08C
	arm_func_end ov17_0238A140

	arm_func_start ov17_0238A278
ov17_0238A278: ; 0x0238A278
	stmdb sp!, {r3, lr}
	ldr r0, _0238A360 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #1
	bne _0238A2A4
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A2A4
	bl sub_0202F334
_0238A2A4:
	ldr r0, _0238A360 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #2
	bne _0238A2CC
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A2CC
	bl HidePortraitBox
_0238A2CC:
	ldr r0, _0238A360 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrh r0, [r0, #0x7e]
	tst r0, #0x20
	bne _0238A2E4
	bl sub_0203A618
_0238A2E4:
	ldr r0, _0238A360 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x40
	bne _0238A30C
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	beq _0238A30C
	bl SetAdvancedTextBoxState5
_0238A30C:
	ldr r0, _0238A360 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x80
	bne _0238A334
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	beq _0238A334
	bl SetAdvancedTextBoxState5
_0238A334:
	ldr r0, _0238A360 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x100
	ldmneia sp!,  {r3, pc}
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl SetScrollBoxState7
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A360: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238A278

	arm_func_start ov17_0238A364
ov17_0238A364: ; 0x0238A364
	stmdb sp!, {r3, lr}
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #1
	bne _0238A3D0
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A3C4
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A3C4
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0]
_0238A3C4:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A3D0:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #2
	bne _0238A438
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A42C
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238A42C
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ClosePortraitBox
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #1]
_0238A42C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A438:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #4
	bne _0238A4A0
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A494
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A494
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseSimpleMenu
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #2]
_0238A494:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A4A0:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x10
	bne _0238A508
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A4FC
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A4FC
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseSimpleMenu
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #3]
_0238A4FC:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A508:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrh r0, [r0, #0x7e]
	tst r0, #0x20
	bne _0238A540
	bl sub_0203A9B8
	cmp r0, #0
	movne r0, #0
	bne _0238A534
	bl sub_0203A51C
	mov r0, #1
_0238A534:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A540:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #8
	bne _0238A5A8
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A59C
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A59C
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseSimpleMenu
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #4]
_0238A59C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A5A8:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r3, [r0]
	ldrh r2, [r3, #0x7e]
	tst r2, #0x40
	bne _0238A5DC
	ldrsb r1, [r3, #5]
	mvn r0, #1
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A5DC:
	tst r2, #0x80
	bne _0238A63C
	ldrsb r0, [r3, #6]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A630
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A630
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl CloseAdvancedTextBox
	bl sub_020407C0
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #6]
_0238A630:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A63C:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x100
	bne _0238A6A8
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A69C
	bl IsScrollBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A69C
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl CloseScrollBox
	bl sub_02041A00
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #7]
_0238A69C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A6A8:
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x200
	bne _0238A710
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A704
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A704
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl CloseSimpleMenu
	ldr r0, _0238A718 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #8]
_0238A704:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A710:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A718: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238A364
