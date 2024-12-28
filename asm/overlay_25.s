	.include "asm/macros.inc"
	.include "overlay_25.inc"

	.text

	arm_func_start ov25_0238A140
ov25_0238A140: ; 0x0238A140
	stmdb sp!, {r3, lr}
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0x1f
	addls pc, pc, r1, lsl #2
	b _0238A63C
_0238A15C: ; jump table
	b _0238A1DC ; case 0
	b _0238A1DC ; case 1
	b _0238A63C ; case 2
	b _0238A63C ; case 3
	b _0238A3FC ; case 4
	b _0238A63C ; case 5
	b _0238A63C ; case 6
	b _0238A63C ; case 7
	b _0238A63C ; case 8
	b _0238A63C ; case 9
	b _0238A63C ; case 10
	b _0238A63C ; case 11
	b _0238A210 ; case 12
	b _0238A210 ; case 13
	b _0238A2C4 ; case 14
	b _0238A350 ; case 15
	b _0238A394 ; case 16
	b _0238A63C ; case 17
	b _0238A63C ; case 18
	b _0238A5C0 ; case 19
	b _0238A5F8 ; case 20
	b _0238A63C ; case 21
	b _0238A63C ; case 22
	b _0238A63C ; case 23
	b _0238A63C ; case 24
	b _0238A404 ; case 25
	b _0238A464 ; case 26
	b _0238A63C ; case 27
	b _0238A63C ; case 28
	b _0238A394 ; case 29
	b _0238A4F8 ; case 30
	b _0238A56C ; case 31
_0238A1DC:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x38]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A674
	mov r0, #0x1a
	bl ov25_0238A694
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl ShowDialogueBox
	b _0238A674
_0238A210:
	bl ov11_0230BA64
	cmp r0, #2
	beq _0238A228
	cmp r0, #3
	beq _0238A248
	b _0238A260
_0238A228:
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #0x1f
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238A674
_0238A248:
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov11_0230B8C0
	mov r0, #0xe
	bl ov25_0238A694
_0238A260:
	bl ov11_0230BD28
	cmp r0, #0
	beq _0238A674
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _0238A674
	ldr r0, _0238A680 ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov11_0230B8C0
	bl ov25_0238B380
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #0xf
	ldr r2, [r0]
	mov r1, #0x1f
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238A674
_0238A2C4:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x3a]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238A334
	cmp r0, #6
	beq _0238A310
	cmp r0, #7
	bne _0238A674
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0, #4]
	bl ov25_0238B380
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0x1f
	ldr r0, [r0]
	str r1, [r0]
	b _0238A674
_0238A310:
	bl ov25_0238B380
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #0xf
	ldr r2, [r0]
	mov r1, #0x1f
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238A674
_0238A334:
	bl ov25_0238B380
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230BCF8
	b _0238A674
_0238A350:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x3b]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238A674
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x3b]
	bl CloseScrollBox
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xd
	strb r2, [r1, #0x13b]
	bl ov25_0238A694
	b _0238A674
_0238A394:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x3a]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238A3EC
	cmp r0, #4
	beq _0238A3BC
	cmp r0, #5
	beq _0238A3EC
	b _0238A674
_0238A3BC:
	bl ov25_0238B380
	bl GetMoneyCarried
	cmp r0, #0x96
	bge _0238A3D8
	mov r0, #9
	bl ov25_0238A694
	b _0238A674
_0238A3D8:
	mov r0, #0x11
	bl ov25_0238A694
	ldr r0, _0238A684 ; =0x00001308
	bl sub_02017C80
	b _0238A674
_0238A3EC:
	bl ov25_0238B380
	mov r0, #0x12
	bl ov25_0238A694
	b _0238A674
_0238A3FC:
	mov r0, #3
	ldmia sp!, {r3, pc}
_0238A404:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x38]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A674
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl ShowDialogueBox
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #0x20
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl sub_0202F2C4
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x39]
	bl HidePortraitBox
	b _0238A674
_0238A464:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x3a]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldrne r1, [r1]
	strne r0, [r1, #0x14]
	cmp r0, #1
	beq _0238A4E8
	cmp r0, #6
	beq _0238A4D8
	cmp r0, #7
	bne _0238A674
	bl ov25_0238B380
	bl GetNbItemsInBag
	cmp r0, #0
	bne _0238A4B4
	mov r0, #5
	bl ov25_0238A694
	b _0238A674
_0238A4B4:
	bl ov11_0230B724
	cmp r0, #0
	bne _0238A4CC
	mov r0, #6
	bl ov25_0238A694
	b _0238A674
_0238A4CC:
	mov r0, #0xa
	bl ov25_0238A694
	b _0238A674
_0238A4D8:
	bl ov25_0238B380
	mov r0, #2
	bl ov25_0238A694
	b _0238A674
_0238A4E8:
	bl ov25_0238B380
	mov r0, #3
	bl ov25_0238A694
	b _0238A674
_0238A4F8:
	ldr r1, [r2, #8]
	add r1, r1, #1
	str r1, [r2, #8]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	beq _0238A528
	cmp r0, #2
	beq _0238A674
	cmp r0, #3
	beq _0238A550
	b _0238A674
_0238A528:
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x3c]
	bl sub_0202836C
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x3c]
	bl CloseTextBox2
	bl ov11_0230B9BC
	b _0238A674
_0238A550:
	ldr r0, [r1, #4]
	bl ov25_0238A694
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238A674
_0238A56C:
	ldr r1, [r2, #8]
	add r1, r1, #1
	str r1, [r2, #8]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	beq _0238A59C
	cmp r0, #2
	beq _0238A674
	cmp r0, #3
	beq _0238A5A4
	b _0238A674
_0238A59C:
	bl ov11_0230B9BC
	b _0238A674
_0238A5A4:
	ldr r0, [r1, #4]
	bl ov25_0238A694
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238A674
_0238A5C0:
	mov r1, #0x14
	str r1, [r2, #4]
	ldr r3, [r0]
	ldr r1, _0238A688 ; =0x00003008
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	ldr r2, _0238A68C ; =0x000003E2
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0x1b
	ldr r0, [r0]
	str r1, [r0]
	b _0238A674
_0238A5F8:
	mov r1, #4
	str r1, [r2, #0x50]
	ldr r1, [r0]
	mov r2, #1
	str r2, [r1, #4]
	ldr r3, [r0]
	ldr r1, _0238A690 ; =0x00003018
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
#ifdef JAPAN
	ldr r2, _0238BBF4 ; =0x000032C7
#else
	rsb r2, r2, #0x3e4
#endif
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0x1b
	ldr r0, [r0]
	str r1, [r0]
	b _0238A674
_0238A63C:
	add r0, r2, #0x100
	ldrsb r0, [r0, #0x38]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A674
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl ShowDialogueBox
	ldr r0, _0238A67C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov25_0238A694
_0238A674:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A67C: .word OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
_0238A680: .word 0x00003F02
_0238A684: .word 0x00001308
_0238A688: .word 0x00003008
#ifdef JAPAN
_0238A68C: .word 0x000032C6
_0238A690: .word 0x00003018
_0238BBF4: .word 0x000032C7
#else
_0238A68C: .word 0x000003E2
_0238A690: .word 0x00003018
#endif
	arm_func_end ov25_0238A140

	arm_func_start ov25_0238A694
ov25_0238A694: ; 0x0238A694
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x68
	ldr ip, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [ip]
	str r0, [r1]
	ldr r1, [ip]
	ldr r0, [r1]
	cmp r0, #0x1d
	addls pc, pc, r0, lsl #2
	b _0238B0C8
_0238A6BC: ; jump table
	b _0238A734 ; case 0
	b _0238A828 ; case 1
	b _0238A890 ; case 2
	b _0238A904 ; case 3
	b _0238B0C8 ; case 4
	b _0238A96C ; case 5
	b _0238A9E0 ; case 6
	b _0238AA54 ; case 7
	b _0238AAC8 ; case 8
	b _0238AB3C ; case 9
	b _0238ABBC ; case 10
	b _0238AC1C ; case 11
	b _0238AD04 ; case 12
	b _0238AD48 ; case 13
	b _0238AD8C ; case 14
	b _0238ADC0 ; case 15
	b _0238AE64 ; case 16
	b _0238AF64 ; case 17
	b _0238AC90 ; case 18
	b _0238AF34 ; case 19
	b _0238AF40 ; case 20
	b _0238AF4C ; case 21
	b _0238B0C8 ; case 22
	b _0238B0C8 ; case 23
	b _0238B0C8 ; case 24
	b _0238B0C8 ; case 25
	b _0238A7E4 ; case 26
	b _0238B0C8 ; case 27
	b _0238B0C8 ; case 28
	b _0238AEF0 ; case 29
_0238A734:
	mov r2, #0x96
	mov r0, #0
	str r2, [r1, #0x4c]
	bl CreateDialogueBox
	ldr r3, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0D4 ; =0x00003008
	ldr ip, [r3]
	ldr r2, _0238B0D8 ; =0x000003D7
	strb r0, [ip, #0x138]
	ldr r3, [r3]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0xb2
	ldr r3, [r2]
	strb r0, [r3, #0x139]
	ldr r0, [r2]
	add r0, r0, #0x140
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x140
	bl SetPortraitLayout
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x140
	ldr r1, [r1, #0x20]
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	b _0238B0C8
_0238A7E4:
	ldr r0, _0238B0DC ; =APPRAISAL_WINDOW_PARAMS_1
	ldr r1, _0238B0E0 ; =ov25_0238B414
	bl CreateTextBox
	ldr r2, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0E4 ; =0x00300013
	ldr r2, [r2]
	ldr r3, _0238B0E8 ; =APPRAISAL_MAIN_MENU_ITEMS
	strb r0, [r2, #0x13d]
	mov ip, #4
	ldr r0, _0238B0EC ; =APPRAISAL_WINDOW_PARAMS_5
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r1]
	strb r0, [r1, #0x13a]
	b _0238B0C8
_0238A828:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0D4 ; =0x00003008
	ldr r3, [r0]
	ldr r2, _0238B0F0 ; =0x000003DD
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238A890:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x2b0
#else
	mov r2, #0x3e4
#endif
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238A904:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #4
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B0F8 ; =0x000003E5
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238A96C:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x2a4
#else
	mov r2, #0x3d8
#endif
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238A9E0:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B0FC ; =0x000003D9
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238AA54:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B0FC ; =0x000003D9
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238AAC8:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x2ac
#else
	mov r2, #0x3e0
#endif
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238AB3C:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #0x96
	ldr r1, [r0]
	mov r3, #1
	str r2, [r1, #0x4c]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x2ac
#else
	mov r2, #0x3e0
#endif
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238ABBC:
	bl ov25_0238B380
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #0xc
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	b _0238B0C8
_0238AC1C:
	mov r0, #0xd
	str r0, [r1, #4]
	ldr r0, [ip]
	mov r1, #0x19
	str r1, [r0]
	ldr r0, [ip]
	mov r1, #0
	str r1, [r0, #0x20]
	ldr r0, [ip]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0D4 ; =0x00003008
	ldr r3, [r0]
	ldr r2, _0238B0F0 ; =0x000003DD
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238AC90:
	mov r0, #0xd
	str r0, [r1, #4]
	ldr r0, [ip]
	mov r1, #0x1b
	str r1, [r0]
	ldr r0, [ip]
	mov r1, #0
	str r1, [r0, #0x20]
	ldr r0, [ip]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B100 ; =0x000003DF
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238AD04:
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x38]
	bl ShowDialogueBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl sub_0202F2C4
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x39]
	bl HidePortraitBox
	mov r0, #1
	mov r1, #0
	bl ov11_0230B20C
	b _0238B0C8
_0238AD48:
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x38]
	bl ShowDialogueBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl sub_0202F2C4
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x39]
	bl HidePortraitBox
	mov r0, #1
	mov r1, #0
	bl ov11_0230B20C
	b _0238B0C8
_0238AD8C:
	mov r2, #0x96
	ldr r0, _0238B104 ; =APPRAISAL_WINDOW_PARAMS_6
	ldr r3, _0238B108 ; =APPRAISAL_SUBMENU_ITEMS
	str r2, [r1, #0x4c]
	mov ip, #3
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r1]
	strb r0, [r1, #0x13a]
	b _0238B0C8
_0238ADC0:
	ldrh r0, [r1, #0xe]
	ldr r2, _0238B10C ; =ov25_0238B5A4
	ldr r3, _0238B110 ; =0x0000C402
	str r0, [r1, #0x28]
	ldr lr, [ip]
	mov r1, #0x400
	ldrsh r0, [lr, #0xc]
	str r0, [lr, #0x38]
	ldr lr, [ip]
	ldrh r0, [lr, #0xe]
	str r0, [lr, #0x4c]
	ldr r0, [ip]
	add ip, r0, #0x28
	add r0, r0, #0x78
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x18
	bl InitPreprocessorArgs
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	add r1, sp, #0x18
	ldr ip, [r0]
	ldr r0, _0238B114 ; =APPRAISAL_WINDOW_PARAMS_8
	add r2, ip, #0x78
	str r2, [sp, #0x50]
	str r1, [sp]
	ldrsh r2, [ip, #0xc]
	ldr r1, _0238B118 ; =0x00001013
	ldr r3, _0238B11C ; =0x0000033E
#if defined(EUROPE)
	add r2, r2, #0xd3
	add r2, r2, #0x2900
#elif defined(JAPAN)
	add r2, r2, #0xce
	add r2, r2, #0x4100
#else
	add r2, r2, #0xd1
	add r2, r2, #0x2900
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	str r2, [sp, #4]
	add ip, ip, #0x28
	mov r2, #0
	str ip, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r1]
	strb r0, [r1, #0x13b]
	b _0238B0C8
_0238AE64:
	mov r0, #0
	str r0, [r1, #0x20]
	ldr r0, [ip]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #0x1b
	ldr r1, [r0]
	mov r2, #0x1d
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0D4 ; =0x00003008
	ldr ip, [r0]
#ifdef JAPAN
	mov r2, #0x32c0
#else
	mov r2, #0x3dc
#endif
	ldrsh r3, [ip, #0xc]
	str r3, [ip, #0x3c]
	ldr ip, [r0]
	ldrh r3, [ip, #0xe]
	str r3, [ip, #0x50]
	ldr r3, [r0]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
	b _0238B0C8
_0238AEF0:
	ldr r0, _0238B0DC ; =APPRAISAL_WINDOW_PARAMS_1
	ldr r1, _0238B0E0 ; =ov25_0238B414
	bl CreateTextBox
	ldr r1, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r3, _0238B120 ; =APPRAISAL_MENU_ITEMS_CONFIRM
	ldr r1, [r1]
	mov ip, #2
	strb r0, [r1, #0x13d]
	ldr r0, _0238B124 ; =APPRAISAL_WINDOW_PARAMS_7
	mov r1, #0x80000013
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r1]
	strb r0, [r1, #0x13a]
	b _0238B0C8
_0238AF34:
	mov r0, #7
	str r0, [r1, #0x24]
	b _0238B0C8
_0238AF40:
	mov r0, #8
	str r0, [r1, #0x24]
	b _0238B0C8
_0238AF4C:
	mov r0, #8
	str r0, [r1, #0x24]
	ldr r0, [ip]
	mov r1, #1
	str r1, [r0, #4]
	b _0238B0C8
_0238AF64:
	mvn r0, #0x95
	bl AddMoneyCarried
	ldr r1, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	add r0, sp, #0x12
	ldr ip, [r1]
	add r1, sp, #0xc
	ldrsh r3, [ip, #0xc]
	mov r2, #1
	strh r3, [sp, #0x10]
	ldrh r3, [ip, #0xe]
	strh r3, [sp, #0xe]
	strb r2, [sp, #0xc]
	bl ItemToBulkItem
	add r0, sp, #0x12
	bl RemoveItemByIdAndStackNoHole
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0
	ldr r0, [r0]
	ldrh r0, [r0, #0xe]
	strh r0, [sp, #0x10]
	ldrsh r0, [sp, #0x10]
	strh r1, [sp, #0xe]
	bl IsThrownItem
	cmp r0, #0
	movne r0, #0xa
	strneh r0, [sp, #0xe]
	bne _0238B00C
	ldrsh r0, [sp, #0x10]
	cmp r0, #0xbb
	moveq r0, #0x55
	streqh r0, [sp, #0x10]
	ldrsh r1, [sp, #0x10]
	cmp r1, #0x16c
	blt _0238AFFC
	ldr r0, _0238B128 ; =0x0000018F
	cmp r1, r0
	movle r0, #0x55
	strleh r0, [sp, #0x10]
_0238AFFC:
	ldrsh r0, [sp, #0x10]
	cmp r0, #0xb7
	moveq r0, #0x55
	streqh r0, [sp, #0x10]
_0238B00C:
	mov r1, #1
	add r0, sp, #0xc
	strb r1, [sp, #0xc]
	bl AddItemToBagNoHeld
	bl ov11_022DC504
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #0x13
	ldr r1, [r0]
	mov r3, #6
	str r2, [r1, #4]
	ldr r2, [r0]
	add r1, sp, #0xc
	str r3, [r2, #0x24]
	ldr r0, [r0]
	ldr r2, _0238B12C ; =OVERLAY25_UNKNOWN_STRUCT__NA_238B498
	add r0, r0, #0xb8
	bl sub_0200D670
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r2, [r0]
	add r1, r2, #0xb8
	str r1, [r2, #0x60]
	ldrsh r2, [sp, #0x10]
	ldr r1, [r0]
	str r2, [r1, #0x3c]
	ldr r2, [r0]
	ldrh r1, [r2, #0xe]
	str r1, [r2, #0x50]
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	add r0, r0, #0x140
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x39]
	add r1, r1, #0x140
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B0D0 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r1, _0238B0F4 ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B130 ; =0x000003E1
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x38]
	add r3, r3, #0x28
	bl ShowStringIdInDialogueBox
_0238B0C8:
	add sp, sp, #0x68
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
#define OV25_0238A694_OFFSET 0x2EE4
#else
#define OV25_0238A694_OFFSET 0
#endif
_0238B0D0: .word OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
_0238B0D4: .word 0x00003008
_0238B0D8: .word 0x000003D7 + OV25_0238A694_OFFSET
_0238B0DC: .word APPRAISAL_WINDOW_PARAMS_1
_0238B0E0: .word ov25_0238B414
_0238B0E4: .word 0x00300013
_0238B0E8: .word APPRAISAL_MAIN_MENU_ITEMS
_0238B0EC: .word APPRAISAL_WINDOW_PARAMS_5
_0238B0F0: .word 0x000003DD + OV25_0238A694_OFFSET
_0238B0F4: .word 0x00003018
_0238B0F8: .word 0x000003E5 + OV25_0238A694_OFFSET
_0238B0FC: .word 0x000003D9 + OV25_0238A694_OFFSET
_0238B100: .word 0x000003DF + OV25_0238A694_OFFSET
_0238B104: .word APPRAISAL_WINDOW_PARAMS_6
_0238B108: .word APPRAISAL_SUBMENU_ITEMS
_0238B10C: .word ov25_0238B5A4
_0238B110: .word 0x0000C402
_0238B114: .word APPRAISAL_WINDOW_PARAMS_8
_0238B118: .word 0x00001013
#ifdef JAPAN
_0238B11C: .word 0x00003203
#else
_0238B11C: .word 0x0000033E
#endif
_0238B120: .word APPRAISAL_MENU_ITEMS_CONFIRM
_0238B124: .word APPRAISAL_WINDOW_PARAMS_7
_0238B128: .word 0x0000018F
_0238B12C: .word OVERLAY25_UNKNOWN_STRUCT__NA_238B498
_0238B130: .word 0x000003E1 + OV25_0238A694_OFFSET
	arm_func_end ov25_0238A694

	arm_func_start ov25_0238B134
ov25_0238B134: ; 0x0238B134
	stmdb sp!, {r3, lr}
	mov r0, #0x150
	mov r1, #6
	bl MemAlloc
	ldr r1, _0238B1C8 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #0
	str r0, [r1]
	str r3, [r0, #0x14]
	ldr r0, [r1]
	sub r2, r3, #2
	str r3, [r0, #0x18]
	ldr r0, [r1]
	str r3, [r0, #0x1c]
	ldr r0, [r1]
	strb r2, [r0, #0x13d]
	ldr r0, [r1]
	str r3, [r0, #0x24]
	ldr r0, [r1]
	add r0, r0, #0x28
	bl InitPreprocessorArgs
	ldr r0, _0238B1C8 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r3, #0xb2
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #0x74]
	ldr r2, [r0]
	str r3, [r2, #0x28]
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov11_0230C910
	ldr r1, _0238B1C8 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r0, #0
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bl ov25_0238A694
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B1C8: .word OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	arm_func_end ov25_0238B134

	arm_func_start ov25_0238B1CC
ov25_0238B1CC: ; 0x0238B1CC
	stmdb sp!, {r3, lr}
	ldr r0, _0238B1F4 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238B1F4 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B1F4: .word OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	arm_func_end ov25_0238B1CC

	arm_func_start ov25_0238B1F8
ov25_0238B1F8: ; 0x0238B1F8
	stmdb sp!, {r3, lr}
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r2, [r0]
	ldr r1, [r2, #0x24]
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _0238B374
_0238B214: ; jump table
	b _0238B238 ; case 0
	b _0238B248 ; case 1
	b _0238B318 ; case 2
	b _0238B364 ; case 3
	b _0238B348 ; case 4
	b _0238B374 ; case 5
	b _0238B2A0 ; case 6
	b _0238B2C8 ; case 7
	b _0238B2F0 ; case 8
_0238B238:
	mov r0, #4
	str r0, [r2, #0x24]
	bl ov11_022E6E68
	b _0238B374
_0238B248:
	bl ov25_0238A140
	cmp r0, #3
	bne _0238B374
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r2, #2
	ldr r1, [r0]
	str r2, [r1, #0x24]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl sub_0202F2C4
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x39]
	bl HidePortraitBox
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl sub_0202836C
	b _0238B374
_0238B2A0:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238B374
	mov r0, #1
	bl ov11_022E6E8C
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0x24]
	b _0238B374
_0238B2C8:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238B374
	mov r0, #2
	bl ov11_022E6E8C
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0x24]
	b _0238B374
_0238B2F0:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238B374
	mov r0, #3
	bl ov11_022E6E8C
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0x24]
	b _0238B374
_0238B318:
	mov r1, #3
	str r1, [r2, #0x24]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x38]
	bl CloseDialogueBox
	ldr r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x39]
	bl ClosePortraitBox
	b _0238B374
_0238B348:
	bl ov11_022E6EC8
	cmp r0, #0
	ldrne r0, _0238B37C ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	movne r1, #1
	ldrne r0, [r0]
	strne r1, [r0, #0x24]
	b _0238B374
_0238B364:
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_0238B374:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B37C: .word OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	arm_func_end ov25_0238B1F8

	arm_func_start ov25_0238B380
ov25_0238B380: ; 0x0238B380
	stmdb sp!, {r3, lr}
	ldr r0, _0238B410 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x3a]
	cmp r0, r1
	beq _0238B3C8
	bl sub_0202836C
	ldr r0, _0238B410 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x3a]
	bl CloseSimpleMenu
	ldr r0, _0238B410 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x13a]
_0238B3C8:
	ldr r0, _0238B410 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x3d]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0238B410 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x3d]
	bl CloseTextBox
	ldr r0, _0238B410 ; =OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x13d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B410: .word OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
	arm_func_end ov25_0238B380

	arm_func_start ov25_0238B414
ov25_0238B414: ; 0x0238B414
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	bl GetMoneyCarried
	add ip, sp, #0x400
	str r0, [sp, #0x428]
	add ip, ip, #4
	ldr r2, _0238B48C ; =ov25_0238B5B0
	ldr r3, _0238B490 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
#ifdef JAPAN
	mov r1, #4
	mov r0, r4
	mov r2, #2
	rsb r3, r1, #0x430
#else
	ldr r3, _0238B494 ; =0x00000225
	mov r0, r4
	mov r1, #4
	mov r2, #2
#endif
	bl sub_02026268
	mov r1, #0x10
	mov r0, r4
	mov r2, r1
	add r3, sp, #4
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238B48C: .word ov25_0238B5B0
_0238B490: .word 0x0000C402
#ifndef JAPAN
_0238B494: .word 0x00000225
#endif
	arm_func_end ov25_0238B414
	; 0x0238B498

	.rodata
	.global OVERLAY25_UNKNOWN_STRUCT__NA_238B498
OVERLAY25_UNKNOWN_STRUCT__NA_238B498:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global APPRAISAL_WINDOW_PARAMS_1
APPRAISAL_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x02, 0x08, 0x04, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global APPRAISAL_MENU_ITEMS_CONFIRM
APPRAISAL_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV25_DATA_OFFSET 0x2EE4
#else
#define OV25_DATA_OFFSET 0
#endif
	.word 0x3D1 + OV25_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3D2 + OV25_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global APPRAISAL_MAIN_MENU_ITEMS
APPRAISAL_MAIN_MENU_ITEMS:
	.word 0x3D3 + OV25_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3D5 + OV25_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3D6 + OV25_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global APPRAISAL_SUBMENU_ITEMS
APPRAISAL_SUBMENU_ITEMS:
	.word 0x3DA + OV25_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3D5 + OV25_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3E6 + OV25_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.hword 0x3D3 + OV25_DATA_OFFSET, 0x3D4 + OV25_DATA_OFFSET, 0x3D5 + OV25_DATA_OFFSET, 0x3D6 + OV25_DATA_OFFSET, 0x3D7 + OV25_DATA_OFFSET, 0x3D8 + OV25_DATA_OFFSET
	.hword 0x3D9 + OV25_DATA_OFFSET, 0x3DA + OV25_DATA_OFFSET, 0x3DB + OV25_DATA_OFFSET, 0x3DC + OV25_DATA_OFFSET, 0x3DD + OV25_DATA_OFFSET, 0x3DE + OV25_DATA_OFFSET, 0x3DF + OV25_DATA_OFFSET, 0x3E0 + OV25_DATA_OFFSET
	.hword 0x3E1 + OV25_DATA_OFFSET, 0x3E4 + OV25_DATA_OFFSET, 0x3E5 + OV25_DATA_OFFSET, 0x3E2 + OV25_DATA_OFFSET, 0x3E3 + OV25_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x12, 0x10, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x0A, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x0F, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global APPRAISAL_WINDOW_PARAMS_5
APPRAISAL_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global APPRAISAL_WINDOW_PARAMS_6
APPRAISAL_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x02, 0x08, 0x05, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global APPRAISAL_WINDOW_PARAMS_7
APPRAISAL_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x0B, 0x06, 0x04, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global APPRAISAL_WINDOW_PARAMS_8
APPRAISAL_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov25_0238B5A4
ov25_0238B5A4:
	.byte 0x5B, 0x69, 0x74, 0x65
	.byte 0x6D, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00, 0x00
	.global ov25_0238B5B0
ov25_0238B5B0:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x56, 0x5D, 0x5B, 0x67
	.byte 0x6F, 0x6C, 0x64, 0x3A, 0x30, 0x5D, 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00

	.data
	.global OVERLAY25_UNKNOWN_POINTER__NA_238B5E0
OVERLAY25_UNKNOWN_POINTER__NA_238B5E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
