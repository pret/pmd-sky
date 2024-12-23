	.include "asm/macros.inc"
	.include "overlay_13.inc"

	.text

; https://decomp.me/scratch/Vph2k
	arm_func_start Overlay13SwitchFunctionNa238A574
Overlay13SwitchFunctionNa238A574: ; 0x0238A574
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x178
	add r0, sp, #0xb0
	bl GetReleasedStylus
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl InitPortraitParams
	ldr r2, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r2]
	ldr r1, [r0, #0x20]
	cmp r1, #0x41
	addls pc, pc, r1, lsl #2
	b _0238BD74
_0238A5AC: ; jump table
	b _0238A6B4 ; case 0
	b _0238A73C ; case 1
	b _0238A79C ; case 2
	b _0238A8B8 ; case 3
	b _0238AA00 ; case 4
	b _0238AA28 ; case 5
	b _0238AA6C ; case 6
	b _0238AC2C ; case 7
	b _0238AEF4 ; case 8
	b _0238B038 ; case 9
	b _0238B4C0 ; case 10
	b _0238B0A8 ; case 11
	b _0238B0C4 ; case 12
	b _0238B4C0 ; case 13
	b _0238AE90 ; case 14
	b _0238B5A4 ; case 15
	b _0238AF38 ; case 16
	b _0238B100 ; case 17
	b _0238B558 ; case 18
	b _0238AE90 ; case 19
	b _0238AF44 ; case 20
	b _0238B13C ; case 21
	b _0238B4C0 ; case 22
	b _0238AE90 ; case 23
	b _0238B608 ; case 24
	b _0238B63C ; case 25
	b _0238AF80 ; case 26
	b _0238B178 ; case 27
	b _0238B488 ; case 28
	b _0238AE80 ; case 29
	b _0238AFA0 ; case 30
	b _0238B1B4 ; case 31
	b _0238B488 ; case 32
	b _0238AE78 ; case 33
	b _0238AFF8 ; case 34
	b _0238BD74 ; case 35
	b _0238ACC0 ; case 36
	b _0238AD00 ; case 37
	b _0238ADD4 ; case 38
	b _0238AEA8 ; case 39
	b _0238B670 ; case 40
	b _0238B410 ; case 41
	b _0238B6AC ; case 42
	b _0238B410 ; case 43
	b _0238B878 ; case 44
	b _0238BA70 ; case 45
	b _0238BCA8 ; case 46
	b _0238B6E8 ; case 47
	b _0238B230 ; case 48
	b _0238B2A4 ; case 49
	b _0238B2FC ; case 50
	b _0238B32C ; case 51
	b _0238B360 ; case 52
	b _0238B3D4 ; case 53
	b _0238B744 ; case 54
	b _0238ADF8 ; case 55
	b _0238AE20 ; case 56
	b _0238AE68 ; case 57
	b _0238BCC8 ; case 58
	b _0238B774 ; case 59
	b _0238B7C0 ; case 60
	b _0238AFBC ; case 61
	b _0238B204 ; case 62
	b _0238B438 ; case 63
	b _0238BCFC ; case 64
	b _0238BD1C ; case 65
_0238A6B4:
	mov r0, #0x64
	bl RandInt
	cmp r0, #0x4b
	blt _0238A6E0
	add r0, sp, #0x14
	bl sub_0204A198
	ldrb r1, [sp, #0x19]
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	and r1, r1, #0xf
	b _0238A6F4
_0238A6E0:
	add r0, sp, #0xd4
	bl GetDsFirmwareUserSettingsVeneer
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldrb r1, [sp, #0xd5]
	ldr r0, [r0]
_0238A6F4:
	add r0, r0, #0x400
	strh r1, [r0, #0x26]
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #0xe
	ldr r1, [r0]
	mov r2, #0
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #0x24]
	ldr r1, [r0]
	strb r2, [r1, #0x5e]
	ldr r1, [r0]
	strb r2, [r1, #0x5f]
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238A73C:
	ldr r0, _0238B4FC ; =QUIZ_WINDOW_PARAMS_4
	bl CreateDialogueBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #2
	ldr r4, [r1]
	mov r2, #0xa
	strb r0, [r4, #2]
	ldr r0, [r1]
	add r1, sp, #0x1c
	ldrsb r0, [r0, #2]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldmia r1, {r1, r2}
	bl sub_02028770
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
#ifdef JAPAN
	ldr r2, _0238CA60 ; =0x000031C4
	ldr r0, [r0]
	mov r1, #8
#else
	mov r1, #8
	ldr r0, [r0]
	add r2, r1, #0x6c0
#endif
	ldrsb r0, [r0, #2]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, #2
	bl WaitForNextStep
	b _0238BD74
_0238A79C:
	mov r1, #0x10
	strb r1, [r0]
	ldr r0, [r2]
	ldrsb r0, [r0, #2]
	bl sub_0202836C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseDialogueBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, _0238B500 ; =QUIZ_WINDOW_PARAMS_1
	ldr r1, [r1]
	mvn r2, #1
	strb r2, [r1, #2]
	bl CreateDialogueBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #0
	ldr r2, [r1]
	mov sb, r3
	strb r0, [r2, #2]
	ldr r2, [r1]
	ldr r0, [r2, #0x20]
	add r0, r0, #1
	str r0, [r2, #0x20]
	add r0, sp, #0x24
_0238A800:
	ldr r2, [r1]
	add r2, r2, r3
	strb sb, [r2, #0x34]
	strb sb, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x10
	blt _0238A800
	ldr sl, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r5, #1
	mov r4, #4
	mov r8, #0x10
	add r6, sp, #0x24
_0238A830:
	mov r0, r8
	bl RandInt
	mov r7, r0
	ldrsb r0, [r6, r7]
	cmp r0, #0
	bne _0238A830
	mov r0, r4
	strb r5, [r6, r7]
	bl RandInt
	ldr r1, [sl]
	add r2, r0, r7, lsl #2
	add r0, r1, sb
	add sb, sb, #1
	strb r2, [r0, #0x55]
	cmp sb, #8
	blt _0238A830
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #0x41
	ldr r1, [r0]
	mov r2, #0x40
	strb r3, [r1, #0x54]
	ldr r1, [r0]
	mov r0, #0xb
	strb r2, [r1, #0x5d]
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _0238BD74
	ldr r0, _0238B504 ; =QUIZ_WINDOW_PARAMS_3
	ldr r1, _0238B508 ; =ov13_0238BE6C
	bl CreateTextBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _0238BD74
_0238A8B8:
	ldrsb r0, [r0, #2]
	mov r3, #2
	mov r2, #0x11
	add r1, sp, #0x1c
	str r3, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldmia r1, {r1, r2}
	bl sub_02028770
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r3, _0238B50C ; =QUIZ_QUESTION_ANSWER_ASSOCIATIONS
	ldr r7, [r0]
	mov r2, #0
	ldr r4, [r7, #0x24]
	ldr r1, _0238B510 ; =QUIZ_QUESTION_STRINGS
	add r4, r7, r4
	ldrb r4, [r4, #0x54]
	mov r4, r4, lsl #1
	ldrh r5, [r3, r4]
	ldrh r6, [r1, r4]
	str r2, [r7, #0x14]
	ldr r3, [r0]
	mov r1, r6
	ldr r2, [r3, #0x14]
	and r8, r5, #0xff
	str r2, [r3, #0x18]
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	str r2, [r3, #0x1c]
	ldr r0, [r0]
	add r0, r0, #0x6c
	bl GetStringFromFileVeneer
	mov r0, r5, asr #8
	ldr r4, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	and r1, r0, #0xff
	ldr r2, [r4]
	mov r7, #0
	strh r6, [r2, #0x60]
	ldr r2, [r4]
	ldr r5, _0238B514 ; =QUIZ_DEBUG_MENU_ITEMS
	add r0, r2, #0x6c
	str r0, [r2, #8]
	ldr r0, _0238B518 ; =QUIZ_ANSWER_STRINGS
	add r6, r0, r1, lsl #1
	b _0238A9A4
_0238A968:
	mov r0, r7, lsl #1
	ldrh sb, [r0, r6]
	ldr r0, [r4]
	add r0, r0, #0x26c
	mov r1, sb
	add r0, r0, r7, lsl #6
	bl GetStringFromFileVeneer
	ldr r2, [r4]
	mov r1, r7, lsl #3
	add r0, r2, #0x26c
	strh sb, [r5, r1]
	add r1, r0, r7, lsl #6
	add r0, r2, r7, lsl #2
	str r1, [r0, #0xc]
	add r7, r7, #1
_0238A9A4:
	cmp r7, r8
	bne _0238A968
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, _0238B514 ; =QUIZ_DEBUG_MENU_ITEMS
	mov r2, r8, lsl #3
	mov r3, #0
	ldr r0, [r0]
	strh r3, [r1, r2]
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #4
	ldr r2, [r0]
	mov r3, #0
	ldrsb r0, [r2, #2]
	ldrh r2, [r2, #0x60]
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AA00:
	ldrsb r0, [r0, #2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AA28:
	add r4, r0, #0xc
	ldr r0, _0238B51C ; =QUIZ_WINDOW_PARAMS_5
	ldr r1, _0238B520 ; =0x00300011
	ldr r3, _0238B514 ; =QUIZ_DEBUG_MENU_ITEMS
	str r4, [r2, #0x18]
	mov r4, #0xa
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r1]
	strb r0, [r2, #3]
	ldr r1, [r1]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AA6C:
	ldrsb r0, [r0, #3]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetSimpleMenuResult
	ldr r3, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r3]
	ldr r1, [r2, #0x24]
	cmp r1, #9
	bne _0238AB74
	strb r0, [r2, #0x5f]
	ldr r0, [r3]
	ldrb r0, [r0, #0x5e]
	cmp r0, #0
	bne _0238AAF4
	mov r4, #0
	ldr r2, _0238B524 ; =QUIZ_MALE_FEMALE_BOOST_TABLE
	b _0238AAEC
_0238AAC0:
	ldr r1, [r3]
	ldrb r0, [r1, #0x5f]
	add r0, r2, r0, lsl #2
	ldrb r0, [r4, r0]
	cmp r0, #0x10
	beq _0238AAF4
	add r1, r1, r0
	ldrb r0, [r1, #0x34]
	add r4, r4, #1
	add r0, r0, #4
	strb r0, [r1, #0x34]
_0238AAEC:
	cmp r4, #4
	bne _0238AAC0
_0238AAF4:
	mov r4, #0
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, r4
	mov r2, r4
_0238AB04:
	ldr r1, [r0]
	add r1, r1, r3
	strb r2, [r1, #0x44]
	ldr r1, [r0]
	add r1, r1, r3
	ldrb r1, [r1, #0x34]
	add r3, r3, #1
	cmp r4, r1
	movlt r4, r1
	cmp r3, #0x10
	blt _0238AB04
	ldr r6, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r5, #0
	mov r7, #0x14
_0238AB3C:
	ldr r0, [r6]
	add r0, r0, r5
	ldrb r0, [r0, #0x34]
	cmp r4, r0
	bne _0238AB64
	mov r0, r7
	bl RandInt
	ldr r1, [r6]
	add r1, r1, r5
	strb r0, [r1, #0x44]
_0238AB64:
	add r5, r5, #1
	cmp r5, #0x10
	blt _0238AB3C
	b _0238ABF8
_0238AB74:
	cmp r1, #0
	bne _0238ABA4
	strb r0, [r2, #0x5e]
	ldr r0, [r3]
	mov r1, #0x6f
	ldrb r0, [r0, #0x5e]
	cmp r0, #0
	moveq r2, #1
	movne r2, #0
	mov r0, #0
	bl SaveScriptVariableValue
	b _0238ABF8
_0238ABA4:
	add r1, r2, r1
	ldrb r2, [r1, #0x54]
	ldr r1, _0238B50C ; =QUIZ_QUESTION_ANSWER_ASSOCIATIONS
	ldr r5, _0238B528 ; =QUIZ_ANSWER_POINTS
	mov r2, r2, lsl #1
	ldrh r2, [r1, r2]
	mov r1, #0
	and r4, r2, #0xff00
	mov r2, r4, asr #7
	add r2, r4, r2, lsr #24
	add r0, r0, r2, asr #8
	add r5, r5, r0, lsl #4
_0238ABD4:
	ldr r2, [r3]
	ldrb r0, [r5, r1]
	add r4, r2, r1
	ldrb r2, [r4, #0x34]
	add r1, r1, #1
	cmp r1, #0x10
	add r0, r2, r0
	strb r0, [r4, #0x34]
	blt _0238ABD4
_0238ABF8:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _0238AC14
	bl ov13_0238BE6C
_0238AC14:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AC2C:
	ldrsb r0, [r0, #2]
	bl sub_02027B1C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseSimpleMenu
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r1, #1
	ldr r2, [r0]
	strb r1, [r2, #3]
	ldr r3, [r0]
	ldr r2, [r3, #0x24]
	add r2, r2, #1
	str r2, [r3, #0x24]
	ldr r4, [r0]
	ldr r2, [r4, #0x24]
	cmp r2, #0xa
	bne _0238ACB4
	ldr r2, [r4, #0x20]
	mov r3, #4
	add r2, r2, #1
	str r2, [r4, #0x20]
	ldr r2, [r0]
	str r3, [r2, #0x30]
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _0238BD74
	bl CloseTextBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
	b _0238BD74
_0238ACB4:
	mov r0, #3
	str r0, [r4, #0x20]
	b _0238BD74
_0238ACC0:
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	bl GetPersonality
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	add r0, r0, r0, lsl #1
	ldr r3, [r1]
	mov r2, r0, lsl #1
	ldr r1, _0238B52C ; =STARTERS_STRINGS
	ldrsb r0, [r3, #2]
	ldrh r2, [r1, r2]
	mov r1, #8
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, #0x25
	bl WaitForNextStep
	b _0238BD74
_0238AD00:
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r1]
	strb r0, [r2, #5]
	ldr r4, [r1]
	bl GetPersonality
	mov r3, r0
	ldrb r2, [r4, #0x5f]
	ldr r1, _0238B530 ; =STARTERS_HERO_IDS
	add r0, r4, #0x3b4
	add r2, r2, r3, lsl #1
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitEmotion
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitLayout
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #0x3b4
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r4, [r0]
	bl GetPersonality
	add r0, r0, r0, lsl #1
	add r3, r0, #1
	ldrsb r0, [r4, #2]
	ldrb r4, [r4, #0x5f]
	ldr r2, _0238B52C ; =STARTERS_STRINGS
	mov r1, #0x18
	add r3, r4, r3
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, #0x26
	bl WaitForNextStep
	b _0238BD74
_0238ADD4:
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl HidePortraitBox
	mov r0, #0x27
	bl WaitForNextStep
	b _0238BD74
_0238ADF8:
	ldrsb r0, [r0, #2]
	bl sub_0202F2C4
	mov r0, #0xb4
	bl sub_02017B7C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AE20:
	ldrsb r0, [r0, #2]
	bl sub_0202836C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0xf
	strb r3, [r2, #2]
	ldr r3, [r0]
	ldr r2, [r3, #0x20]
	add r2, r2, #1
	str r2, [r3, #0x20]
	ldr r0, [r0]
	strb r1, [r0]
	b _0238BD74
_0238AE68:
	mov r1, #0x13
	strb r1, [r0]
	bl ov11_0230D71C
	b _0238BD74
_0238AE78:
	mov r1, #4
	strb r1, [r0]
_0238AE80:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202F2C4
_0238AE90:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AEA8:
	ldrsb r0, [r0, #2]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl HidePortraitBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl ClosePortraitBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AEF4:
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r3, [r0]
	ldr r2, [r3, #0x30]
	sub r1, r2, #1
	str r1, [r3, #0x30]
	cmp r2, #0
	ldreq r1, [r0]
	ldreq r0, [r1, #0x20]
	addeq r0, r0, #1
	streq r0, [r1, #0x20]
	b _0238BD74
_0238AF38:
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _0238BD74
_0238AF44:
	ldr r0, _0238B534 ; =0x00002208
	bl sub_02017CB4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r2, #3
	ldr r1, [r0]
	strb r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AF80:
	ldrsb r0, [r0, #4]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AFA0:
	mov r1, #7
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AFBC:
	ldr r0, _0238B534 ; =0x00002208
	bl sub_02017CB4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r2, #2
	ldr r1, [r0]
	strb r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238AFF8:
	ldrsb r0, [r0, #4]
	bl CloseDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
#ifdef JAPAN
	mov r1, #8
	ldr r0, [r0]
	add r2, r1, #0x30c0
#else
	ldr r2, _0238B538 ; =0x000005CC
	ldr r0, [r0]
	mov r1, #8
#endif
	ldrsb r0, [r0, #2]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, #0x24
	bl WaitForNextStep
	b _0238BD74
_0238B038:
	ldrb r1, [r0, #0x5f]
	ldr r0, _0238B53C ; =QUIZ_BORDER_COLOR_TABLE
	ldrb r0, [r0, r1]
	bl SetBothScreensWindowsColor
	ldr r0, _0238B540 ; =QUIZ_WINDOW_PARAMS_2
	bl CreateDialogueBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r1]
	strb r0, [r2, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238B544 ; =0x000006AD
	ldr r0, [r0]
	mov r1, #8
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r2, #0x11
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B0A8:
	mov r1, #0x12
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B0C4:
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238B548 ; =0x000006AE
	ldr r0, [r0]
	mov r1, #8
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B100:
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238B54C ; =0x000006AF
	ldr r0, [r0]
	mov r1, #8
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B13C:
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
#ifdef JAPAN
	ldr r2, _0238CAB0 ; =0x000031AC
	ldr r0, [r0]
	mov r1, #8
#else
	mov r1, #8
	ldr r0, [r0]
	mov r2, #0x6b0
#endif
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B178:
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238B550 ; =0x000006B1
	ldr r0, [r0]
	mov r1, #0x18
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B1B4:
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #8
	ldr r4, [r0]
	mov r3, #0
	add r0, r4, #0x400
	ldrh r2, [r0, #0x26]
	ldrsb r0, [r4, #4]
#ifdef JAPAN
	add r2, r2, #0xae
	add r2, r2, #0x3100
#else
	add r2, r2, #0xb2
	add r2, r2, #0x600
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B204:
	ldrsb r0, [r0, #4]
	ldr r2, _0238B554 ; =0x000006C9
	mov r1, #0x218
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B230:
	add r0, r0, #0x400
	ldrsh r1, [r0, #0x24]
	add r0, sp, #0x70
	bl GetNameRaw
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	add r1, sp, #0x70
	ldr r0, [r0]
	add r0, r0, #0x3e4
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	add r1, sp, #0x70
	ldr r0, [r0]
	add r0, r0, #4
	add r0, r0, #0x400
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r0, #3
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e4
	add r3, r3, #4
	add r3, r3, #0x400
	bl ShowKeyboard
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B2A4:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0238BD74
	bl GetKeyboardStringResult
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x3c4
	mov r2, #0x10
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x3e4
	bl StrcpySimple
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B2FC:
	bl sub_02037468
	cmp r0, #0
	beq _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r0]
	ldr r1, [r2, #0x20]
	add r1, r1, #1
	str r1, [r2, #0x20]
	ldr r0, [r0]
	add r0, r0, #0x3c4
	bl sub_0203909C
	b _0238BD74
_0238B32C:
	bl sub_0203931C
	cmp r0, #0
	ldreq r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	moveq r1, #0x34
	ldreq r0, [r0]
	streq r1, [r0, #0x20]
	beq _0238BD74
	cmp r0, #1
	ldreq r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	moveq r1, #0x35
	ldreq r0, [r0]
	streq r1, [r0, #0x20]
	b _0238BD74
_0238B360:
	bl sub_02039218
	cmp r0, #0
	beq _0238BD74
	add r0, sp, #0x34
	bl sub_02048764
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r4, [r0]
	bl GetPersonality
	ldrb r3, [r4, #0x5f]
	ldr r1, _0238B530 ; =STARTERS_HERO_IDS
	add r2, r4, #0x400
	add r0, r3, r0, lsl #1
	mov r0, r0, lsl #1
	ldrsh r3, [r1, r0]
	add r0, sp, #0x4c
	add r1, r4, #0x3e4
	strh r3, [sp, #0x34]
	ldrsh r3, [r2, #0x24]
	strh r3, [sp, #0x36]
	ldrh r2, [r2, #0x26]
	str r2, [sp, #0x60]
	bl StrcpySimple
	add r0, sp, #0x34
	bl sub_02048794
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #0x36
	ldr r0, [r0]
	str r1, [r0, #0x20]
	b _0238BD74
_0238B3D4:
	bl sub_02039218
	cmp r0, #0
	beq _0238BD74
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #0x31
	ldr r2, [r1]
	mov r0, #3
	str r3, [r2, #0x20]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #4
	add r1, r1, #0x3e4
	add r3, r3, #0x400
	bl ShowKeyboard
	b _0238BD74
_0238B410:
	ldrsb r0, [r0, #2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B438:
	ldrsb r0, [r0, #4]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #0xc
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0x20]
	ldr r0, [r0]
	strb r1, [r0]
	b _0238BD74
_0238B488:
	ldrsb r0, [r0, #4]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B4C0:
	ldrsb r0, [r0, #4]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
	.align 2, 0
#ifdef JAPAN
#define OV13_238A574_OFFSET 0x2AFC
#else
#define OV13_238A574_OFFSET 0
#endif
_0238B4F8: .word OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
_0238B4FC: .word QUIZ_WINDOW_PARAMS_4
#ifdef JAPAN
_0238CA60: .word 0x000031C4
#endif
_0238B500: .word QUIZ_WINDOW_PARAMS_1
_0238B504: .word QUIZ_WINDOW_PARAMS_3
_0238B508: .word ov13_0238BE6C
_0238B50C: .word QUIZ_QUESTION_ANSWER_ASSOCIATIONS
_0238B510: .word QUIZ_QUESTION_STRINGS
_0238B514: .word QUIZ_DEBUG_MENU_ITEMS
_0238B518: .word QUIZ_ANSWER_STRINGS
_0238B51C: .word QUIZ_WINDOW_PARAMS_5
_0238B520: .word 0x00300011
_0238B524: .word QUIZ_MALE_FEMALE_BOOST_TABLE
_0238B528: .word QUIZ_ANSWER_POINTS
_0238B52C: .word STARTERS_STRINGS
_0238B530: .word STARTERS_HERO_IDS
_0238B534: .word 0x00002208
#ifndef JAPAN
_0238B538: .word 0x000005CC
#endif
_0238B53C: .word QUIZ_BORDER_COLOR_TABLE
_0238B540: .word QUIZ_WINDOW_PARAMS_2
_0238B544: .word 0x000006AD + OV13_238A574_OFFSET
_0238B548: .word 0x000006AE + OV13_238A574_OFFSET
_0238B54C: .word 0x000006AF + OV13_238A574_OFFSET
#ifdef JAPAN
_0238CAB0: .word 0x000031AC
#endif
_0238B550: .word 0x000006B1 + OV13_238A574_OFFSET
_0238B554: .word 0x000006C9 + OV13_238A574_OFFSET
_0238B558:
	ldrh r1, [sp, #0xb0]
	tst r1, #1
	moveq r1, #0x3d
	streq r1, [r0, #0x20]
	beq _0238BD74
	ldrsb r0, [r0, #4]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B5A4:
	add r1, sp, #8
	mov r0, #0
	bl GetPressedButtons
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r2, #0x3c
	ldr r0, [r0]
	add r1, sp, #0xc
	str r2, [r0, #0x28]
	mov r0, #0
	bl ov11_022EB3C8
	ldrh r0, [sp, #0xb0]
	tst r0, #1
	beq _0238BD74
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r3, #5
	ldr r2, [r1]
	ldr r0, _0238B534 ; =0x00002208
	strb r3, [r2]
	ldr r3, [r1]
	mov r1, #0x100
	ldr r2, [r3, #0x20]
	add r2, r2, #1
	str r2, [r3, #0x20]
	bl sub_02017C74
	b _0238BD74
_0238B608:
	ldr r1, [r0, #0x28]
	cmp r1, #0
	subne r1, r1, #1
	strne r1, [r0, #0x28]
	ldrh r0, [sp, #0xb0]
	tst r0, #1
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B63C:
	ldr r1, [r0, #0x28]
	cmp r1, #0
	subne r1, r1, #1
	strne r1, [r0, #0x28]
	bne _0238BD74
	ldrsb r0, [r0, #4]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B670:
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238BD7C ; =0x000006C2
	ldr r0, [r0]
	mov r1, #8
	ldrsb r0, [r0, #2]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B6AC:
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238BD80 ; =0x000006C3
	ldr r0, [r0]
	mov r1, #4
	ldrsb r0, [r0, #2]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B6E8:
	add r0, sp, #0x128
	bl InitPreprocessorArgs
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x74]
	str r0, [sp, #0x128]
	ldrsb r0, [r1, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
#ifdef JAPAN
	add r3, sp, #0x128
	ldr r0, [r0]
	mov r1, #4
	ldrsb r0, [r0, #2]
	mov r2, #0x31c0
#else
	mov r1, #4
	ldr r0, [r0]
	add r3, sp, #0x128
	ldrsb r0, [r0, #2]
	add r2, r1, #0x6c0
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #0x3b
	ldr r0, [r0]
	str r1, [r0, #0x20]
	b _0238BD74
_0238B744:
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238BD84 ; =0x000006C5
	ldr r0, [r0]
	mov r1, #8
	ldrsb r0, [r0, #2]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, #0x37
	bl WaitForNextStep
	b _0238BD74
_0238B774:
	ldrsb r0, [r0, #2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B51C ; =QUIZ_WINDOW_PARAMS_5
	mov r4, #2
	ldr r1, _0238BD88 ; =0x00300013
	ldr r3, _0238BD8C ; =QUIZ_MENU_ITEMS_1
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r1]
	strb r0, [r2, #3]
	ldr r1, [r1]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238B7C0:
	ldrsb r0, [r0, #3]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238B7DC
	cmp r0, #2
	beq _0238B848
	b _0238BD74
_0238B7DC:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseSimpleMenu
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #3]
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl ClosePortraitBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x30
	strb r3, [r2, #5]
	ldr r0, [r0]
	str r1, [r0, #0x20]
	b _0238BD74
_0238B848:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseSimpleMenu
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x2a
	strb r3, [r2, #3]
	ldr r0, [r0]
	str r1, [r0, #0x20]
	b _0238BD74
_0238B878:
	mov r0, #0x1f
	str r0, [r2, #8]
	bl GetPersonality
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, _0238B530 ; =STARTERS_HERO_IDS
	ldr r1, [r1]
	ldrb r1, [r1, #0x5f]
	add r0, r1, r0, lsl #1
	mov r0, r0, lsl #1
	ldrsh r4, [r2, r0]
	mov r0, r4
	bl GetMonsterGenderVeneer
	cmp r0, #2
	bne _0238B8BC
	mov r0, r4
	bl FemaleToMaleForm
	mov r4, r0
_0238B8BC:
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r0, r4
	ldr r2, [r1]
	mov r1, #0
	str r1, [r2, #0x370]
	bl GetType
	ldr r2, _0238BD90 ; =STARTERS_TYPE_INCOMPATIBILITY_TABLE
	mov r1, #1
	ldr sb, [r2, r0, lsl #2]
	mov r0, r4
	bl GetType
	ldr r1, _0238BD90 ; =STARTERS_TYPE_INCOMPATIBILITY_TABLE
	ldr r1, [r1, r0, lsl #2]
	mov r0, #0x15
	orr sb, sb, r1
	bl RandInt
	ldr fp, _0238BD94 ; =STARTERS_PARTNER_IDS
	ldr r5, _0238BD90 ; =STARTERS_TYPE_INCOMPATIBILITY_TABLE
	ldr r4, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r6, r0
	mov r7, #0
_0238B910:
	mov r1, #0x15
	add r0, r6, r7
	bl _s32_div_f
	mov r0, r1, lsl #1
	ldrsh sl, [fp, r0]
	mov r1, #0
	mov r0, sl
	bl GetType
	ldr r8, [r5, r0, lsl #2]
	mov r0, sl
	mov r1, #1
	bl GetType
	ldr r0, [r5, r0, lsl #2]
	orr r0, r8, r0
	tst sb, r0
	bne _0238B970
	ldr r2, [r4]
	ldr r1, [r2, #0x370]
	add r0, r1, #1
	str r0, [r2, #0x370]
	ldr r0, [r4]
	add r0, r0, r1, lsl #1
	add r0, r0, #0x300
	strh sl, [r0, #0x74]
_0238B970:
	add r7, r7, #1
	cmp r7, #0x15
	blt _0238B910
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, _0238BD98 ; =QUIZ_WINDOW_PARAMS_6
	ldr r2, [r1]
	ldr r1, _0238BD9C ; =0x00001011
	ldr r2, [r2, #0x370]
	ldr r3, _0238BDA0 ; =GetOptionStringFromID
	str r2, [sp]
	mov r4, #6
	mov r2, #0
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r2, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r2]
	strb r0, [r1, #3]
	ldr r4, [r2]
	mov r0, #0
	ldr r3, [r4, #0x20]
	sub r1, r0, #2
	add r3, r3, #1
	str r3, [r4, #0x20]
	str r0, [r2, #4]
	str r0, [r2, #8]
	ldr r2, [r2]
	ldrsb r2, [r2, #5]
	cmp r2, r1
	bne _0238B9FC
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r1]
	strb r0, [r1, #5]
_0238B9FC:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0x3b4
	add r1, r2, r1, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x74]
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitEmotion
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitLayout
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, _0238BDA4 ; =PORTRAIT_ATTRIBUTES
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitOffset
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #0x3b4
	bl ShowPortraitInPortraitBox
	b _0238BD74
_0238BA70:
	ldrsb r0, [r0, #3]
	ldr r4, [r2, #4]
	bl GetAdvancedMenuCurrentOption
	cmp r4, r0
	beq _0238BB10
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #0
	str r1, [r0, #8]
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	str r0, [r1, #4]
	ldr r2, [r1]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x74]
	add r0, r2, #0x3b4
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitEmotion
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitLayout
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, _0238BDA4 ; =PORTRAIT_ATTRIBUTES
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitOffset
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #0x3b4
	bl ShowPortraitInPortraitBox
	b _0238BB98
_0238BB10:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0, #8]
	cmp r1, #0x20
	addne r1, r1, #1
	strne r1, [r0, #8]
	bne _0238BB98
	mov r1, #0xff
	str r1, [r0, #8]
	ldr r2, [r0]
	add r0, r2, r4, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x74]
	add r0, r2, #0x3b4
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitEmotion
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitLayout
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, _0238BDA4 ; =PORTRAIT_ATTRIBUTES
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitOffset
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #0x3b4
	bl ShowPortraitInPortraitBox
_0238BB98:
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r4, [r0]
	ldrsb r0, [r4, #3]
	bl GetAdvancedMenuResult
	add r0, r4, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r2, [r0, #0x74]
	add r0, r4, #0x400
	ldr r1, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	strh r2, [r0, #0x24]
	ldr r0, [r1]
	ldrsb r0, [r0, #2]
	bl ShowDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_02027B1C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_0202F2C4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0x3b4
	add r1, r2, r1, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x74]
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitEmotion
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitLayout
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, _0238BDA4 ; =PORTRAIT_ATTRIBUTES
	ldr r0, [r0]
	add r0, r0, #0x3b4
	bl SetPortraitOffset
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #0x3b4
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseAdvancedMenu
	mvn r2, #1
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	strb r2, [r1, #3]
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238BCA8:
	ldrsb r0, [r0, #2]
	bl sub_0202836C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238BCC8:
	ldrsb r0, [r0, #2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_02027B1C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	str r0, [r1, #0x20]
	b _0238BD74
_0238BCFC:
	mov r0, #1
	bl ov11_023039D4
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	b _0238BD74
_0238BD1C:
	bl ov11_02303D80
	mvn r1, #0
	cmp r0, r1
	bne _0238BD74
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mov r2, #0x39
	ldr r1, [r0]
	str r2, [r1, #0x20]
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_0202836C
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseDialogueBox
	ldr r0, _0238B4F8 ; =OVERLAY13_UNKNOWN_POINTER__NA_238CEA0
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #2]
	ldr r0, [r0]
	strb r1, [r0]
_0238BD74:
	add sp, sp, #0x178
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238BD7C: .word 0x000006C2 + OV13_238A574_OFFSET
_0238BD80: .word 0x000006C3 + OV13_238A574_OFFSET
_0238BD84: .word 0x000006C5 + OV13_238A574_OFFSET
_0238BD88: .word 0x00300013
_0238BD8C: .word QUIZ_MENU_ITEMS_1
_0238BD90: .word STARTERS_TYPE_INCOMPATIBILITY_TABLE
_0238BD94: .word STARTERS_PARTNER_IDS
_0238BD98: .word QUIZ_WINDOW_PARAMS_6
_0238BD9C: .word 0x00001011
_0238BDA0: .word GetOptionStringFromID
_0238BDA4: .word PORTRAIT_ATTRIBUTES
	arm_func_end Overlay13SwitchFunctionNa238A574
