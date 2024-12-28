	.include "asm/macros.inc"
	.include "overlay_24.inc"

	.text

	arm_func_start ov24_0238A140
ov24_0238A140: ; 0x0238A140
	stmdb sp!, {r3, lr}
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0x26
	addls pc, pc, r1, lsl #2
	b _0238A5B8
_0238A15C: ; jump table
	b _0238A1F8 ; case 0
	b _0238A1F8 ; case 1
	b _0238A5B8 ; case 2
	b _0238A5B8 ; case 3
	b _0238A2B4 ; case 4
	b _0238A5B8 ; case 5
	b _0238A5B8 ; case 6
	b _0238A5B8 ; case 7
	b _0238A5B8 ; case 8
	b _0238A5B8 ; case 9
	b _0238A5B8 ; case 10
	b _0238A5B8 ; case 11
	b _0238A5B8 ; case 12
	b _0238A5B8 ; case 13
	b _0238A26C ; case 14
	b _0238A5B8 ; case 15
	b _0238A5B8 ; case 16
	b _0238A5B8 ; case 17
	b _0238A5B8 ; case 18
	b _0238A5B8 ; case 19
	b _0238A22C ; case 20
	b _0238A5B8 ; case 21
	b _0238A5B8 ; case 22
	b _0238A518 ; case 23
	b _0238A55C ; case 24
	b _0238A2C0 ; case 25
	b _0238A334 ; case 26
	b _0238A5B8 ; case 27
	b _0238A5B8 ; case 28
	b _0238A26C ; case 29
	b _0238A4A8 ; case 30
	b _0238A5B8 ; case 31
	b _0238A3DC ; case 32
	b _0238A3DC ; case 33
	b _0238A43C ; case 34
	b _0238A488 ; case 35
	b _0238A424 ; case 36
	b _0238A5B8 ; case 37
	b _0238A598 ; case 38
_0238A1F8:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x8c]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A604
	mov r0, #0x1a
	bl ov24_0238A610
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl ShowDialogueBox
	b _0238A604
_0238A22C:
	bl ov11_02306C9C
	cmp r0, #3
	beq _0238A250
	cmp r0, #4
	bne _0238A604
	bl ov11_02306C64
	mov r0, #0x11
	bl ov24_0238A610
	b _0238A604
_0238A250:
	bl ov11_02306C64
	ldr r1, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	str r0, [r1, #0x1e8]
	mov r0, #0x26
	bl ov24_0238A610
	b _0238A604
_0238A26C:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x8f]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238A2A4
	cmp r0, #4
	beq _0238A294
	cmp r0, #5
	beq _0238A2A4
	b _0238A604
_0238A294:
	bl ov24_0238C47C
	mov r0, #0x13
	bl ov24_0238A610
	b _0238A604
_0238A2A4:
	bl ov24_0238C47C
	mov r0, #0x11
	bl ov24_0238A610
	b _0238A604
_0238A2B4:
	bl ov11_022DC504
	mov r0, #3
	ldmia sp!, {r3, pc}
_0238A2C0:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl ShowDialogueBox
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x27
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl sub_0202F2C4
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	b _0238A604
_0238A334:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x8f]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldrne r1, [r1]
	strne r0, [r1, #0x1c]
	cmp r0, #1
	beq _0238A3CC
	cmp r0, #6
	beq _0238A3BC
	cmp r0, #7
	bne _0238A604
	bl ov24_0238C47C
	bl sub_020107DC
	cmp r0, #0
	beq _0238A38C
	cmp r0, #1
	beq _0238A398
	cmp r0, #2
	beq _0238A3A4
	b _0238A3B0
_0238A38C:
	mov r0, #9
	bl ov24_0238A610
	b _0238A604
_0238A398:
	mov r0, #7
	bl ov24_0238A610
	b _0238A604
_0238A3A4:
	mov r0, #6
	bl ov24_0238A610
	b _0238A604
_0238A3B0:
	mov r0, #5
	bl ov24_0238A610
	b _0238A604
_0238A3BC:
	bl ov24_0238C47C
	mov r0, #2
	bl ov24_0238A610
	b _0238A604
_0238A3CC:
	bl ov24_0238C47C
	mov r0, #3
	bl ov24_0238A610
	b _0238A604
_0238A3DC:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0238A604
	bl GetKeyboardStringResult
	ldr r2, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, r0
	ldr r0, [r2]
	add r0, r0, #0x42
	bl StrcpySimple
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x10
	ldr r1, [r0]
	add r0, r1, #0x22
	add r1, r1, #0x42
	bl StrncpySimpleNoPadSafe
	mov r0, #0x24
	bl ov24_0238A610
	b _0238A604
_0238A424:
	bl sub_02037468
	cmp r0, #0
	beq _0238A604
	mov r0, #0x22
	bl ov24_0238A610
	b _0238A604
_0238A43C:
	bl sub_0203931C
	cmp r0, #0
	bne _0238A464
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x10
	ldr r1, [r0]
	mov r0, #0x23
	str r2, [r1, #4]
	bl ov24_0238A610
	b _0238A604
_0238A464:
	cmp r0, #1
	bne _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x21
	ldr r1, [r0]
	mov r0, #0x23
	str r2, [r1, #4]
	bl ov24_0238A610
	b _0238A604
_0238A488:
	bl sub_02039218
	cmp r0, #0
	beq _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov24_0238A610
	b _0238A604
_0238A4A8:
	ldr r1, [r2, #0xc]
	add r1, r1, #1
	str r1, [r2, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _0238A4D8
	cmp r0, #2
	beq _0238A604
	cmp r0, #3
	beq _0238A4FC
	b _0238A604
_0238A4D8:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8e]
	bl sub_0202836C
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8e]
	bl CloseCollectionMenu
	b _0238A604
_0238A4FC:
	ldr r0, [r1, #8]
	bl ov24_0238A610
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238A604
_0238A518:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x8c]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl CloseDialogueBox
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x18
	strb r2, [r1, #0x28c]
	bl ov24_0238A610
	b _0238A604
_0238A55C:
	bl sub_0203D538
	mvn r1, #0
	cmp r0, r1
	beq _0238A578
	cmp r0, #1
	beq _0238A588
	b _0238A604
_0238A578:
	bl sub_0203EFD4
	mov r0, #4
	bl ov24_0238A610
	b _0238A604
_0238A588:
	bl sub_0203EFD4
	mov r0, #4
	bl ov24_0238A610
	b _0238A604
_0238A598:
	ldr r1, [r2, #0xc]
	sub r0, r1, #1
	str r0, [r2, #0xc]
	cmp r1, #0
	bne _0238A604
	mov r0, #0x1f
	bl ov24_0238A610
	b _0238A604
_0238A5B8:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A604
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl ShowDialogueBox
	ldr r0, _0238A60C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov24_0238A610
_0238A604:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A60C: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
	arm_func_end ov24_0238A140

	arm_func_start ov24_0238A610
ov24_0238A610: ; 0x0238A610
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r3, _0238B388 ; =ov24_0238C50A
	ldr r1, [r1]
	add r2, sp, #8
	str r0, [r1]
	mov r1, #4
_0238A630:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0238A630
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	ldr r2, [r1]
	cmp r2, #0x26
	addls pc, pc, r2, lsl #2
	b _0238B37C
_0238A658: ; jump table
	b _0238A6F4 ; case 0
	b _0238A82C ; case 1
	b _0238A890 ; case 2
	b _0238A900 ; case 3
	b _0238B37C ; case 4
	b _0238A964 ; case 5
	b _0238A9E0 ; case 6
	b _0238AA5C ; case 7
	b _0238AAD8 ; case 8
	b _0238AB50 ; case 9
	b _0238ACE0 ; case 10
	b _0238B37C ; case 11
	b _0238B37C ; case 12
	b _0238B37C ; case 13
	b _0238AC80 ; case 14
	b _0238B114 ; case 15
	b _0238B170 ; case 16
	b _0238ABE0 ; case 17
	b _0238ABF8 ; case 18
	b _0238AE60 ; case 19
	b _0238ADB8 ; case 20
	b _0238AF00 ; case 21
	b _0238AECC ; case 22
	b _0238B0A8 ; case 23
	b _0238B0CC ; case 24
	b _0238B37C ; case 25
	b _0238A800 ; case 26
	b _0238B37C ; case 27
	b _0238B37C ; case 28
	b _0238AD90 ; case 29
	b _0238B37C ; case 30
	b _0238B284 ; case 31
	b _0238B2D4 ; case 32
	b _0238B310 ; case 33
	b _0238B32C ; case 34
	b _0238B37C ; case 35
	b _0238B37C ; case 36
	b _0238B338 ; case 37
	b _0238B278 ; case 38
_0238A6F4:
	mov r0, #0
	strb r0, [r1, #0x1f0]
	bl CreateDialogueBox
	ldr r2, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #3
	ldr r3, [r2]
	mov r2, #1
	strb r0, [r3, #0x28c]
	mov r0, #0
	bl CreatePortraitBox
	ldr r2, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x71
	ldr r3, [r2]
	strb r0, [r3, #0x28d]
	ldr r0, [r2]
	add r0, r0, #0x294
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x294
	bl SetPortraitLayout
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r3, [r0]
	ldrb r0, [r3, #0x21]
	cmp r0, #0
	bne _0238A7E4
	ldrb r0, [r3, #0x20]
	ldr r1, _0238B38C ; =0x00003018
	cmp r0, #0
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	bne _0238A7B8
	ldr r2, _0238B390 ; =0x0000038A
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238A7C4
_0238A7B8:
	ldr r2, _0238B394 ; =0x0000038B
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
_0238A7C4:
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0x19
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0]
	b _0238B37C
_0238A7E4:
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	ldr r1, _0238B398 ; =0x00003008
	ldr r2, _0238B39C ; =0x0000038F
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238A800:
	ldr r0, _0238B3A0 ; =DAYCARE_WINDOW_PARAMS_4
	mov r4, #4
	ldr r1, _0238B3A4 ; =0x00300013
	ldr r3, _0238B3A8 ; =DAYCARE_MAIN_MENU_ITEMS
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	strb r0, [r1, #0x28f]
	b _0238B37C
_0238A82C:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B398 ; =0x00003008
	ldr r3, [r0]
	ldr r2, _0238B39C ; =0x0000038F
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238A890:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3AC ; =0x00000391
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238A900:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #4
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x25c
#else
	mov r2, #0x390
#endif
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238A964:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3B0 ; =0x0000220F
	ldr r1, [r0]
	mov r3, #8
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3B4 ; =0x00000392
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238A9E0:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3B0 ; =0x0000220F
	ldr r1, [r0]
	mov r3, #8
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3B4 ; =0x00000392
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AA5C:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3B0 ; =0x0000220F
	ldr r1, [r0]
	mov r3, #8
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3B4 ; =0x00000392
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AAD8:
	ldr r0, _0238B3B0 ; =0x0000220F
	bl sub_02017CB4
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x264
#else
	mov r2, #0x398
#endif
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AB50:
	bl ov24_0238C47C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0xa
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #8]
	ldr r1, [r0]
	ldr r2, _0238B3B0 ; =0x0000220F
	strb r3, [r1, #0x1f0]
	ldr r1, [r0]
	str r2, [r1, #0x21c]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	bl sub_0201077C
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	str r0, [r1, #0x1f8]
	bl IncrementNbEggsHatched
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3B8 ; =0x00000393
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238ABE0:
	mov r2, #0x12
	str r2, [r1, #8]
	ldr r0, [r0]
	mov r1, #0x14
	str r1, [r0, #0x2a4]
	b _0238B37C
_0238ABF8:
	ldr r2, [r1, #0x2a4]
	sub r2, r2, #1
	str r2, [r1, #0x2a4]
	ldr r0, [r0]
	ldr r0, [r0, #0x2a4]
	cmp r0, #0
	bgt _0238B37C
	mov r0, #3
	bl sub_02017C10
	cmp r0, #0
	bne _0238AC2C
	mov r0, #3
	bl sub_02017C50
_0238AC2C:
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #4
	ldr r0, [r1]
	mov r3, #0x1b
	str r2, [r0, #8]
	ldr r2, [r1]
	mov r0, #0
	str r3, [r2]
	ldr r2, [r1]
	add r1, r2, #0x52
	str r1, [r2, #0x230]
	bl sub_02010794
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3BC ; =0x00000397
	ldr r3, [r0]
	mov r1, #0x1c
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AC80:
	mov r2, #0x1b
	str r2, [r1]
	ldr r1, [r0]
	mov r2, #0x1d
	str r2, [r1, #8]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3C0 ; =0x00000396
	ldr r4, [r0]
	mov r1, #4
	add r3, r4, #0x66
	str r3, [r4, #0x230]
	ldr r4, [r0]
	ldrsh r3, [r4, #0x14]
	str r3, [r4, #0x20c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238ACE0:
	ldr r0, _0238B3B0 ; =0x0000220F
	bl sub_02017CB4
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3C4 ; =0x00000715
	ldr r1, [r0]
	mov r3, #5
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x220]
	ldr r3, [r0]
	add r1, r3, #0x52
	str r1, [r3, #0x230]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #0x1b
	ldr r1, [r0]
	mov r2, #0xe
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r4, [r0]
	ldr r2, _0238B3C8 ; =0x00000395
	ldrsh r3, [r4, #0x14]
	str r3, [r4, #0x20c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AD90:
	mov r0, #0
	ldr r3, _0238B3CC ; =DAYCARE_MENU_ITEMS_CONFIRM
	mov r2, r0
	mov r1, #0x11
	str r0, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	strb r0, [r1, #0x28f]
	b _0238B37C
_0238ADB8:
	add r0, r1, #0x1bc
	bl sub_0206351C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x71
	ldr r0, [r0]
	add r0, r0, #0x100
	strh r1, [r0, #0xbc]
	bl sub_0201077C
	ldr r2, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r4, #6
	ldr r1, [r2]
	mov r3, #0
	add r1, r1, #0x100
	strh r0, [r1, #0xe0]
	ldr r0, [r2]
	strb r4, [r0, #0x1be]
	ldr r0, [r2]
	str r3, [r0, #0x1c4]
	bl sub_0201077C
	mov r1, r0
	add r0, sp, #8
	mov r2, #1
	mov r3, #0
	bl sub_02053B60
	bl sub_0201077C
	add r2, sp, #8
	mov r1, r0
	mov r0, #1
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r3, _0238B3D0 ; =OVERLAY24_UNKNOWN_STRUCT__NA_238C508
	ldr r2, [r0]
	add r0, r2, #0x248
	add r2, r2, #0x42
	bl sub_02052F8C
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x248
	bl ov11_023061E4
	b _0238B37C
_0238AE60:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _0238AEB4
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl sub_0202F2C4
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	bl ov24_0238B3F8
	b _0238B37C
_0238AEB4:
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0]
	bl ov24_0238B3F8
	b _0238B37C
_0238AECC:
	mov r2, #0x17
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x1b
	str r2, [r1]
	ldr r3, [r0]
	ldr r1, _0238B38C ; =0x00003018
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	ldr r2, _0238B3D4 ; =0x000003A2
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AF00:
	bl Rand16Bit
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, _0238B3D8 ; =_020A1868
	ldrsh r0, [r0]
	cmp r1, r0
	bge _0238B094
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	ldrsh r0, [r1, #0x16]
	cmp r0, #0
	moveq r0, #4
	streq r0, [r1]
	beq _0238B37C
	bl ov24_0238C4CC
	bl IsBagFull
	cmp r0, #0
	beq _0238AFC0
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x16
	ldr r1, [r0]
	mov r3, #0x1b
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3DC ; =0x000003A1
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238AFC0:
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238B38C ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B3DC ; =0x000003A1
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #0x25
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #8]
	ldr r2, [r0]
	add r0, sp, #0x10
	ldrsh r2, [r2, #0x16]
	strh r2, [sp, #0x10]
	strh r1, [sp, #0x12]
	bl SpecialProcAddItemToBag
	mov r0, #0
	strb r0, [sp, #0x14]
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldrsh r2, [sp, #0x10]
	ldrh r1, [sp, #0x12]
	ldr r0, [r0]
	strh r2, [sp, #0x18]
	add r0, r0, #0x7a
	strh r1, [sp, #0x16]
	ldr r2, _0238B3E0 ; =OVERLAY24_UNKNOWN_STRUCT__NA_238C514
	add r1, sp, #0x14
	add r0, r0, #0x100
	bl sub_0200D670
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x7a
	add r0, r0, #0x100
	str r0, [r1, #0x230]
	b _0238B37C
_0238B094:
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _0238B37C
_0238B0A8:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8c]
	bl sub_0202F2C4
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	b _0238B37C
_0238B0CC:
	add r0, r1, #0x1bc
	bl sub_0206351C
	ldr r3, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #1
	ldr r0, [r3]
	mov r1, #0
	str r2, [r0, #0x1c8]
	ldr r0, [r3]
	mov r2, r1
	str r1, [r0, #0x1e4]
	ldr r0, [r3]
	ldrsh r4, [r0, #0x16]
	add r0, r0, #0x100
	strh r4, [r0, #0xd0]
	ldr r0, [r3]
	add r0, r0, #0x1bc
	bl sub_0203D438
	b _0238B37C
_0238B114:
	bl sub_0201077C
	mov r1, r0
	add r0, sp, #8
	mov r2, #1
	mov r3, #0
	bl sub_02053B60
	bl sub_0201077C
	mov r2, #1
	str r2, [sp]
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3D0 ; =OVERLAY24_UNKNOWN_STRUCT__NA_238C508
	ldr r1, [r1]
	add r3, sp, #8
	add r1, r1, #0x42
	bl sub_02055DD0
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x26
	ldr r3, [r1]
	str r0, [r3, #0x1e8]
	ldr r0, [r1]
	str r2, [r0]
	bl ov24_0238B3F8
	b _0238B37C
_0238B170:
	ldr r0, [r1, #0x1e8]
	add r1, r1, #0x42
	add r0, r0, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	ldr r2, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, _0238B3E4 ; =EGG_HP_BONUS
	ldr r1, [r2]
	ldrsh r3, [r0]
	ldr lr, [r1, #0x1e8]
	ldr r1, _0238B3E8 ; =EGG_STAT_BONUSES
	ldrsh r4, [lr, #0xa]
	ldr r0, _0238B3EC ; =_020A18E0
	ldrsh ip, [r1]
	add r3, r4, r3
	strh r3, [lr, #0xa]
	ldr r4, [r2]
	ldrsh r3, [r1, #2]
	ldr r4, [r4, #0x1e8]
	ldrsh r1, [r0]
	ldrb lr, [r4, #0xc]
	ldrsh r0, [r0, #2]
	add ip, lr, ip
	strb ip, [r4, #0xc]
	ldr ip, [r2]
	ldr lr, [ip, #0x1e8]
	ldrb ip, [lr, #0xd]
	add r3, ip, r3
	strb r3, [lr, #0xd]
	ldr r3, [r2]
	ldr ip, [r3, #0x1e8]
	ldrb r3, [ip, #0xe]
	add r1, r3, r1
	strb r1, [ip, #0xe]
	ldr r1, [r2]
	ldr r2, [r1, #0x1e8]
	ldrb r1, [r2, #0xf]
	add r0, r1, r0
	strb r0, [r2, #0xf]
	bl sub_0201077C
	bl SetPokemonJoined
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r0, #0
	ldr r2, [r1]
	add r1, r2, #0x22
	str r1, [r2, #0x230]
	bl sub_02010794
	mov r3, #0x15
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x1b
	ldr r2, [r0]
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0]
	bl ov24_0238C4CC
	mov r0, #5
	bl sub_02017C50
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x1c
	ldr r3, [r0]
	ldr r2, _0238B3F0 ; =0x00000399
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238B278:
	mov r0, #0xa
	str r0, [r1, #0xc]
	b _0238B37C
_0238B284:
	mov r0, #0x20
	str r0, [r1, #8]
	bl ov11_02310BDC
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238B3F4 ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x1c
	add r3, ip, #0x66
	str r3, [ip, #0x230]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B37C
_0238B2D4:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8c]
	bl CloseDialogueBox
	ldr r1, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x28c]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x66
	add r1, r1, #0x42
	add r3, r3, #0x100
	bl ShowKeyboard
	b _0238B37C
_0238B310:
	add r0, r1, #0x66
	add r1, r1, #0x42
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	b _0238B37C
_0238B32C:
	add r0, r1, #0x22
	bl sub_0203909C
	b _0238B37C
_0238B338:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	mov r0, #4
	bl sub_02017C50
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
#ifdef JAPAN
	ldr r2, _0238C958 ; =0x00002448
	ldr r3, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r3, [r0]
	mov r2, #0x274
#endif
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B384 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #8]
_0238B37C:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV24_0238A610_OFFSET 0x2EE4
#else
#define OV24_0238A610_OFFSET 0
#endif
_0238B384: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
_0238B388: .word ov24_0238C50A
_0238B38C: .word 0x00003018
_0238B390: .word 0x0000038A + OV24_0238A610_OFFSET
_0238B394: .word 0x0000038B + OV24_0238A610_OFFSET
_0238B398: .word 0x00003008
_0238B39C: .word 0x0000038F + OV24_0238A610_OFFSET
_0238B3A0: .word DAYCARE_WINDOW_PARAMS_4
_0238B3A4: .word 0x00300013
_0238B3A8: .word DAYCARE_MAIN_MENU_ITEMS
_0238B3AC: .word 0x00000391 + OV24_0238A610_OFFSET
_0238B3B0: .word 0x0000220F
_0238B3B4: .word 0x00000392 + OV24_0238A610_OFFSET
_0238B3B8: .word 0x00000393 + OV24_0238A610_OFFSET
_0238B3BC: .word 0x00000397 + OV24_0238A610_OFFSET
_0238B3C0: .word 0x00000396 + OV24_0238A610_OFFSET
_0238B3C4: .word 0x00000715
_0238B3C8: .word 0x00000395 + OV24_0238A610_OFFSET
_0238B3CC: .word DAYCARE_MENU_ITEMS_CONFIRM
_0238B3D0: .word OVERLAY24_UNKNOWN_STRUCT__NA_238C508
_0238B3D4: .word 0x000003A2 + OV24_0238A610_OFFSET
_0238B3D8: .word _020A1868
_0238B3DC: .word 0x000003A1 + OV24_0238A610_OFFSET
_0238B3E0: .word OVERLAY24_UNKNOWN_STRUCT__NA_238C514
_0238B3E4: .word EGG_HP_BONUS
_0238B3E8: .word EGG_STAT_BONUSES
_0238B3EC: .word _020A18E0
_0238B3F0: .word 0x00000399 + OV24_0238A610_OFFSET
_0238B3F4: .word 0x000003A3 + OV24_0238A610_OFFSET
#ifdef JAPAN
_0238C958: .word 0x00002448
#endif
	arm_func_end ov24_0238A610

	arm_func_start ov24_0238B3F8
ov24_0238B3F8: ; 0x0238B3F8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	ldr r3, _0238C160 ; =ov24_0238C50A
	add r2, sp, #0x12
	mov r1, #4
_0238B40C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0238B40C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	ldr r2, [r1]
	cmp r2, #0x26
	addls pc, pc, r2, lsl #2
	b _0238C158
_0238B434: ; jump table
	b _0238B4D0 ; case 0
	b _0238B608 ; case 1
	b _0238B66C ; case 2
	b _0238B6DC ; case 3
	b _0238C158 ; case 4
	b _0238B740 ; case 5
	b _0238B7BC ; case 6
	b _0238B838 ; case 7
	b _0238B8B4 ; case 8
	b _0238B92C ; case 9
	b _0238BABC ; case 10
	b _0238C158 ; case 11
	b _0238C158 ; case 12
	b _0238C158 ; case 13
	b _0238BA5C ; case 14
	b _0238BEF0 ; case 15
	b _0238BF4C ; case 16
	b _0238B9BC ; case 17
	b _0238B9D4 ; case 18
	b _0238BC3C ; case 19
	b _0238BB94 ; case 20
	b _0238BCDC ; case 21
	b _0238BCA8 ; case 22
	b _0238BE84 ; case 23
	b _0238BEA8 ; case 24
	b _0238C158 ; case 25
	b _0238B5DC ; case 26
	b _0238C158 ; case 27
	b _0238C158 ; case 28
	b _0238BB6C ; case 29
	b _0238C158 ; case 30
	b _0238C060 ; case 31
	b _0238C0B0 ; case 32
	b _0238C0EC ; case 33
	b _0238C108 ; case 34
	b _0238C158 ; case 35
	b _0238C158 ; case 36
	b _0238C114 ; case 37
	b _0238C054 ; case 38
_0238B4D0:
	mov r0, #0
	strb r0, [r1, #0x1f0]
	bl CreateDialogueBox
	ldr r2, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #3
	ldr r3, [r2]
	mov r2, #1
	strb r0, [r3, #0x28c]
	mov r0, #0
	bl CreatePortraitBox
	ldr r2, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x71
	ldr r3, [r2]
	strb r0, [r3, #0x28d]
	ldr r0, [r2]
	add r0, r0, #0x294
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x294
	bl SetPortraitLayout
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r3, [r0]
	ldrb r0, [r3, #0x21]
	cmp r0, #0
	bne _0238B5C0
	ldrb r0, [r3, #0x20]
	ldr r1, _0238C168 ; =0x00003018
	cmp r0, #0
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	bne _0238B594
	ldr r2, _0238C16C ; =0x0000038A
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238B5A0
_0238B594:
	ldr r2, _0238C170 ; =0x0000038B
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
_0238B5A0:
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0x19
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C158
_0238B5C0:
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	ldr r1, _0238C174 ; =0x00003008
	ldr r2, _0238C178 ; =0x0000038F
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B5DC:
	ldr r0, _0238C17C ; =DAYCARE_WINDOW_PARAMS_4
	mov r4, #4
	ldr r1, _0238C180 ; =0x00300013
	ldr r3, _0238C184 ; =DAYCARE_MAIN_MENU_ITEMS
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	strb r0, [r1, #0x28f]
	b _0238C158
_0238B608:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C174 ; =0x00003008
	ldr r3, [r0]
	ldr r2, _0238C178 ; =0x0000038F
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B66C:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C188 ; =0x00000391
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B6DC:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #4
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x25c
#else
	mov r2, #0x390
#endif
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B740:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C18C ; =0x0000220F
	ldr r1, [r0]
	mov r3, #8
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C190 ; =0x00000392
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B7BC:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C18C ; =0x0000220F
	ldr r1, [r0]
	mov r3, #8
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C190 ; =0x00000392
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B838:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C18C ; =0x0000220F
	ldr r1, [r0]
	mov r3, #8
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C190 ; =0x00000392
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B8B4:
	ldr r0, _0238C18C ; =0x0000220F
	bl sub_02017CB4
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #8]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x264
#else
	mov r2, #0x398
#endif
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B92C:
	bl ov24_0238C47C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0xa
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #8]
	ldr r1, [r0]
	ldr r2, _0238C18C ; =0x0000220F
	strb r3, [r1, #0x1f0]
	ldr r1, [r0]
	str r2, [r1, #0x21c]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	bl sub_0201077C
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	str r0, [r1, #0x1f8]
	bl IncrementNbEggsHatched
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C194 ; =0x00000393
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238B9BC:
	mov r2, #0x12
	str r2, [r1, #8]
	ldr r0, [r0]
	mov r1, #0x14
	str r1, [r0, #0x2a4]
	b _0238C158
_0238B9D4:
	ldr r2, [r1, #0x2a4]
	sub r2, r2, #1
	str r2, [r1, #0x2a4]
	ldr r0, [r0]
	ldr r0, [r0, #0x2a4]
	cmp r0, #0
	bgt _0238C158
	mov r0, #3
	bl sub_02017C10
	cmp r0, #0
	bne _0238BA08
	mov r0, #3
	bl sub_02017C50
_0238BA08:
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #4
	ldr r0, [r1]
	mov r3, #0x1b
	str r2, [r0, #8]
	ldr r2, [r1]
	mov r0, #0
	str r3, [r2]
	ldr r2, [r1]
	add r1, r2, #0x52
	str r1, [r2, #0x230]
	bl sub_02010794
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C198 ; =0x00000397
	ldr r3, [r0]
	mov r1, #0x1c
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238BA5C:
	mov r2, #0x1b
	str r2, [r1]
	ldr r1, [r0]
	mov r2, #0x1d
	str r2, [r1, #8]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C19C ; =0x00000396
	ldr r4, [r0]
	mov r1, #4
	add r3, r4, #0x66
	str r3, [r4, #0x230]
	ldr r4, [r0]
	ldrsh r3, [r4, #0x14]
	str r3, [r4, #0x20c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238BABC:
	ldr r0, _0238C18C ; =0x0000220F
	bl sub_02017CB4
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C1A0 ; =0x00000715
	ldr r1, [r0]
	mov r3, #5
	str r2, [r1, #0x21c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x220]
	ldr r3, [r0]
	add r1, r3, #0x52
	str r1, [r3, #0x230]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #0x1b
	ldr r1, [r0]
	mov r2, #0xe
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r4, [r0]
	ldr r2, _0238C1A4 ; =0x00000395
	ldrsh r3, [r4, #0x14]
	str r3, [r4, #0x20c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238BB6C:
	mov r0, #0
	ldr r3, _0238C1A8 ; =DAYCARE_MENU_ITEMS_CONFIRM
	mov r2, r0
	mov r1, #0x11
	str r0, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	strb r0, [r1, #0x28f]
	b _0238C158
_0238BB94:
	add r0, r1, #0x1bc
	bl sub_0206351C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x71
	ldr r0, [r0]
	add r0, r0, #0x100
	strh r1, [r0, #0xbc]
	bl sub_0201077C
	ldr r2, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r4, #6
	ldr r1, [r2]
	mov r3, #0
	add r1, r1, #0x100
	strh r0, [r1, #0xe0]
	ldr r0, [r2]
	strb r4, [r0, #0x1be]
	ldr r0, [r2]
	str r3, [r0, #0x1c4]
	bl sub_0201077C
	mov r1, r0
	add r0, sp, #0x12
	mov r2, #1
	mov r3, #0
	bl sub_02053B60
	bl sub_0201077C
	add r2, sp, #0x12
	mov r1, r0
	mov r0, #1
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r3, _0238C1AC ; =OVERLAY24_UNKNOWN_STRUCT__NA_238C508
	ldr r2, [r0]
	add r0, r2, #0x248
	add r2, r2, #0x42
	bl sub_02052F8C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x248
	bl ov11_023061E4
	b _0238C158
_0238BC3C:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _0238BC90
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl sub_0202F2C4
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	bl ov24_0238B3F8
	b _0238C158
_0238BC90:
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0]
	bl ov24_0238B3F8
	b _0238C158
_0238BCA8:
	mov r2, #0x17
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x1b
	str r2, [r1]
	ldr r3, [r0]
	ldr r1, _0238C168 ; =0x00003018
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	ldr r2, _0238C1B0 ; =0x000003A2
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238BCDC:
	bl Rand16Bit
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, _0238C1B4 ; =_020A1868
	ldrsh r0, [r0]
	cmp r1, r0
	bge _0238BE70
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	ldrsh r0, [r1, #0x16]
	cmp r0, #0
	moveq r0, #4
	streq r0, [r1]
	beq _0238C158
	bl ov24_0238C4CC
	bl IsBagFull
	cmp r0, #0
	beq _0238BD9C
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x16
	ldr r1, [r0]
	mov r3, #0x1b
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1]
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C1B8 ; =0x000003A1
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238BD9C:
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1f0]
	ldr r2, [r0]
	add r0, r2, #0x100
	ldrsb r1, [r0, #0xf0]
	add r0, r2, #0x294
	bl SetPortraitEmotion
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	add r1, r1, #0x294
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, _0238C168 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238C1B8 ; =0x000003A1
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #0x25
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #8]
	ldr r2, [r0]
	add r0, sp, #0xe
	ldrsh r2, [r2, #0x16]
	strh r2, [sp, #0xe]
	strh r1, [sp, #0x10]
	bl SpecialProcAddItemToBag
	mov r0, #0
	strb r0, [sp, #8]
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldrsh r2, [sp, #0xe]
	ldrh r1, [sp, #0x10]
	ldr r0, [r0]
	strh r2, [sp, #0xc]
	add r0, r0, #0x7a
	strh r1, [sp, #0xa]
	ldr r2, _0238C1BC ; =OVERLAY24_UNKNOWN_STRUCT__NA_238C514
	add r1, sp, #8
	add r0, r0, #0x100
	bl sub_0200D670
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x7a
	add r0, r0, #0x100
	str r0, [r1, #0x230]
	b _0238C158
_0238BE70:
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _0238C158
_0238BE84:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8c]
	bl sub_0202F2C4
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	b _0238C158
_0238BEA8:
	add r0, r1, #0x1bc
	bl sub_0206351C
	ldr r3, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #1
	ldr r0, [r3]
	mov r1, #0
	str r2, [r0, #0x1c8]
	ldr r0, [r3]
	mov r2, r1
	str r1, [r0, #0x1e4]
	ldr r0, [r3]
	ldrsh r4, [r0, #0x16]
	add r0, r0, #0x100
	strh r4, [r0, #0xd0]
	ldr r0, [r3]
	add r0, r0, #0x1bc
	bl sub_0203D438
	b _0238C158
_0238BEF0:
	bl sub_0201077C
	mov r1, r0
	add r0, sp, #0x12
	mov r2, #1
	mov r3, #0
	bl sub_02053B60
	bl sub_0201077C
	mov r2, #1
	str r2, [sp]
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C1AC ; =OVERLAY24_UNKNOWN_STRUCT__NA_238C508
	ldr r1, [r1]
	add r3, sp, #0x12
	add r1, r1, #0x42
	bl sub_02055DD0
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x26
	ldr r3, [r1]
	str r0, [r3, #0x1e8]
	ldr r0, [r1]
	str r2, [r0]
	bl ov24_0238B3F8
	b _0238C158
_0238BF4C:
	ldr r0, [r1, #0x1e8]
	add r1, r1, #0x42
	add r0, r0, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	ldr r2, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, _0238C1C0 ; =EGG_HP_BONUS
	ldr r1, [r2]
	ldrsh r3, [r0]
	ldr lr, [r1, #0x1e8]
	ldr r1, _0238C1C4 ; =EGG_STAT_BONUSES
	ldrsh r4, [lr, #0xa]
	ldr r0, _0238C1C8 ; =_020A18E0
	ldrsh ip, [r1]
	add r3, r4, r3
	strh r3, [lr, #0xa]
	ldr r4, [r2]
	ldrsh r3, [r1, #2]
	ldr r4, [r4, #0x1e8]
	ldrsh r1, [r0]
	ldrb lr, [r4, #0xc]
	ldrsh r0, [r0, #2]
	add ip, lr, ip
	strb ip, [r4, #0xc]
	ldr ip, [r2]
	ldr lr, [ip, #0x1e8]
	ldrb ip, [lr, #0xd]
	add r3, ip, r3
	strb r3, [lr, #0xd]
	ldr r3, [r2]
	ldr ip, [r3, #0x1e8]
	ldrb r3, [ip, #0xe]
	add r1, r3, r1
	strb r1, [ip, #0xe]
	ldr r1, [r2]
	ldr r2, [r1, #0x1e8]
	ldrb r1, [r2, #0xf]
	add r0, r1, r0
	strb r0, [r2, #0xf]
	bl sub_0201077C
	bl SetPokemonJoined
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r0, #0
	ldr r2, [r1]
	add r1, r2, #0x22
	str r1, [r2, #0x230]
	bl sub_02010794
	mov r3, #0x15
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x1b
	ldr r2, [r0]
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0]
	bl ov24_0238C4CC
	mov r0, #5
	bl sub_02017C50
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0x1c
	ldr r3, [r0]
	ldr r2, _0238C1CC ; =0x00000399
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238C054:
	mov r0, #0xa
	str r0, [r1, #0xc]
	b _0238C158
_0238C060:
	mov r0, #0x20
	str r0, [r1, #8]
	bl ov11_02310BDC
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, _0238C1D0 ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x1c
	add r3, ip, #0x66
	str r3, [ip, #0x230]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	b _0238C158
_0238C0B0:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8c]
	bl CloseDialogueBox
	ldr r1, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x28c]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x66
	add r1, r1, #0x42
	add r3, r3, #0x100
	bl ShowKeyboard
	b _0238C158
_0238C0EC:
	add r0, r1, #0x66
	add r1, r1, #0x42
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	b _0238C158
_0238C108:
	add r0, r1, #0x22
	bl sub_0203909C
	b _0238C158
_0238C114:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	mov r0, #4
	bl sub_02017C50
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
#ifdef JAPAN
	ldr r2, _0238D738 ; =0x00002448
	ldr r3, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r3, [r0]
	mov r2, #0x274
#endif
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x8c]
	add r3, r3, #0x1f8
	bl ShowStringIdInDialogueBox
	ldr r0, _0238C164 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #8]
_0238C158:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
#define OV24_0238B3F8_OFFSET 0x2EE4
#else
#define OV24_0238B3F8_OFFSET 0
#endif
_0238C160: .word ov24_0238C50A
_0238C164: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
_0238C168: .word 0x00003018
_0238C16C: .word 0x0000038A + OV24_0238B3F8_OFFSET
_0238C170: .word 0x0000038B + OV24_0238B3F8_OFFSET
_0238C174: .word 0x00003008
_0238C178: .word 0x0000038F + OV24_0238B3F8_OFFSET
_0238C17C: .word DAYCARE_WINDOW_PARAMS_4
_0238C180: .word 0x00300013
_0238C184: .word DAYCARE_MAIN_MENU_ITEMS
_0238C188: .word 0x00000391 + OV24_0238B3F8_OFFSET
_0238C18C: .word 0x0000220F
_0238C190: .word 0x00000392 + OV24_0238B3F8_OFFSET
_0238C194: .word 0x00000393 + OV24_0238B3F8_OFFSET
_0238C198: .word 0x00000397 + OV24_0238B3F8_OFFSET
_0238C19C: .word 0x00000396 + OV24_0238B3F8_OFFSET
_0238C1A0: .word 0x00000715
_0238C1A4: .word 0x00000395 + OV24_0238B3F8_OFFSET
_0238C1A8: .word DAYCARE_MENU_ITEMS_CONFIRM
_0238C1AC: .word OVERLAY24_UNKNOWN_STRUCT__NA_238C508
_0238C1B0: .word 0x000003A2 + OV24_0238B3F8_OFFSET
_0238C1B4: .word _020A1868
_0238C1B8: .word 0x000003A1 + OV24_0238B3F8_OFFSET
_0238C1BC: .word OVERLAY24_UNKNOWN_STRUCT__NA_238C514
_0238C1C0: .word EGG_HP_BONUS
_0238C1C4: .word EGG_STAT_BONUSES
_0238C1C8: .word _020A18E0
_0238C1CC: .word 0x00000399 + OV24_0238B3F8_OFFSET
_0238C1D0: .word 0x000003A3 + OV24_0238B3F8_OFFSET
#ifdef JAPAN
_0238D738: .word 0x00002448
#endif
	arm_func_end ov24_0238B3F8

	arm_func_start ov24_0238C1D4
ov24_0238C1D4: ; 0x0238C1D4
	stmdb sp!, {r3, lr}
	mov r0, #0x2a8
	mov r1, #6
	bl MemAlloc
	ldr r1, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #0
	str r0, [r1]
	str r3, [r0, #0x1c]
	ldr r0, [r1]
	sub r2, r3, #2
	str r3, [r0, #0x1f4]
	ldr r0, [r1]
	strb r2, [r0, #0x28c]
	ldr r0, [r1]
	strb r2, [r0, #0x28d]
	bl sub_0201077C
	ldr r2, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, r0
	ldr r0, [r2]
	add r0, r0, #0x52
	bl GetNameRaw
	ldr r0, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x66
	add r0, r0, #0x100
	add r1, r1, #0x52
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x22
	add r1, r1, #0x52
	bl strcpy
	ldr r0, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r0]
	add r0, r1, #0x42
	add r1, r1, #0x66
	add r1, r1, #0x100
	bl StrcpySimple
	bl sub_0201077C
	mov r1, r0
	ldr r0, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0x4e
	ldr r0, [r0]
	add r0, r0, #0x66
	bl GetNameWithGender
	ldr r0, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x1f8
	bl InitPreprocessorArgs
	mov r3, #0x71
	ldr r0, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0
	ldr r1, [r0]
	str r3, [r1, #0x244]
	ldr r1, [r0]
	str r3, [r1, #0x1f8]
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r0, [r0]
	str r2, [r0, #0x2a4]
	bl sub_0201077C
	cmp r0, #0
	bne _0238C2FC
	mov r0, #8
	bl GetAdventureLogCompleted
	ldr r1, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #0x20]
	ldr r1, [r1]
	mov r0, #1
	strb r2, [r1, #0x21]
	bl sub_020107C4
	b _0238C32C
_0238C2FC:
	bl sub_020107AC
	ldr r1, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3, #0x20]
	ldr r0, [r1]
	strb r2, [r0, #0x21]
	bl sub_0201077C
	bl sub_0200EB90
	ldr r1, _0238C33C ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	strh r0, [r1, #0x16]
_0238C32C:
	mov r0, #0
	bl ov24_0238A610
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C33C: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
	arm_func_end ov24_0238C1D4

	arm_func_start ov24_0238C340
ov24_0238C340: ; 0x0238C340
	stmdb sp!, {r3, lr}
	ldr r0, _0238C368 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238C368 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C368: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
	arm_func_end ov24_0238C340

	arm_func_start ov24_0238C36C
ov24_0238C36C: ; 0x0238C36C
	stmdb sp!, {r3, lr}
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r2, [r0]
	ldr r1, [r2, #0x1f4]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238C470
_0238C388: ; jump table
	b _0238C398 ; case 0
	b _0238C3A4 ; case 1
	b _0238C408 ; case 2
	b _0238C464 ; case 3
_0238C398:
	mov r0, #1
	str r0, [r2, #0x1f4]
	b _0238C470
_0238C3A4:
	bl ov24_0238A140
	cmp r0, #3
	bne _0238C470
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mov r3, #2
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0x1f4]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	cmp r0, r1
	beq _0238C3F0
	bl sub_0202F2C4
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	bl sub_0202836C
_0238C3F0:
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl HidePortraitBox
	b _0238C470
_0238C408:
	mov r1, #3
	str r1, [r2, #0x1f4]
	ldr r0, [r0]
	sub r1, r1, #5
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	cmp r0, r1
	beq _0238C43C
	bl CloseDialogueBox
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x28c]
_0238C43C:
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8d]
	bl ClosePortraitBox
	ldr r0, _0238C478 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x28d]
	b _0238C470
_0238C464:
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, pc}
_0238C470:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C478: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
	arm_func_end ov24_0238C36C

	arm_func_start ov24_0238C47C
ov24_0238C47C: ; 0x0238C47C
	stmdb sp!, {r3, lr}
	ldr r0, _0238C4C8 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8f]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0238C4C8 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8f]
	bl CloseSimpleMenu
	ldr r0, _0238C4C8 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x28f]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C4C8: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
	arm_func_end ov24_0238C47C

	arm_func_start ov24_0238C4CC
ov24_0238C4CC: ; 0x0238C4CC
	stmdb sp!, {r3, lr}
	ldr r0, _0238C504 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x8c]
	cmp r0, r1
	ldmneia sp!,  {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _0238C504 ; =OVERLAY24_UNKNOWN_POINTER__NA_238C600
	ldr r1, [r1]
	strb r0, [r1, #0x28c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C504: .word OVERLAY24_UNKNOWN_POINTER__NA_238C600
	arm_func_end ov24_0238C4CC
	; 0x0238C508

	.rodata
	.global OVERLAY24_UNKNOWN_STRUCT__NA_238C508
OVERLAY24_UNKNOWN_STRUCT__NA_238C508:
	.byte 0xF8, 0x00
	.global ov24_0238C50A
ov24_0238C50A:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY24_UNKNOWN_STRUCT__NA_238C514
OVERLAY24_UNKNOWN_STRUCT__NA_238C514:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global DAYCARE_MENU_ITEMS_CONFIRM
DAYCARE_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV24_DATA_OFFSET 0x2EE4
#else
#define OV24_DATA_OFFSET 0
#endif
	.word 0x386 + OV24_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x387 + OV24_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global DAYCARE_MAIN_MENU_ITEMS
DAYCARE_MAIN_MENU_ITEMS:
	.word 0x38C + OV24_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x38D + OV24_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x38E + OV24_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.hword 0x38A + OV24_DATA_OFFSET, 0x38B + OV24_DATA_OFFSET, 0x38C + OV24_DATA_OFFSET, 0x38D + OV24_DATA_OFFSET, 0x38E + OV24_DATA_OFFSET, 0x38F + OV24_DATA_OFFSET, 0x390 + OV24_DATA_OFFSET, 0x391 + OV24_DATA_OFFSET
	.hword 0x392 + OV24_DATA_OFFSET, 0x393 + OV24_DATA_OFFSET, 0x394 + OV24_DATA_OFFSET, 0x395 + OV24_DATA_OFFSET, 0x396 + OV24_DATA_OFFSET, 0x397 + OV24_DATA_OFFSET, 0x398 + OV24_DATA_OFFSET, 0x399 + OV24_DATA_OFFSET
	.hword 0x39A + OV24_DATA_OFFSET, 0x39B + OV24_DATA_OFFSET, 0x39C + OV24_DATA_OFFSET, 0x39D + OV24_DATA_OFFSET, 0x39E + OV24_DATA_OFFSET, 0x39F + OV24_DATA_OFFSET, 0x3A0 + OV24_DATA_OFFSET, 0x3A1 + OV24_DATA_OFFSET
	.hword 0x3A2 + OV24_DATA_OFFSET, 0x3A3 + OV24_DATA_OFFSET, 0x3A4 + OV24_DATA_OFFSET, 0x3A5 + OV24_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x10
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x0A, 0x08, 0x03
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x0F, 0x08, 0x03
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DAYCARE_WINDOW_PARAMS_4
DAYCARE_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x04
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data
	.global OVERLAY24_UNKNOWN_POINTER__NA_238C600
OVERLAY24_UNKNOWN_POINTER__NA_238C600:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
