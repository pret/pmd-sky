	.include "asm/macros.inc"
	.include "overlay_15.inc"

	.text

	arm_func_start ov15_0238A140
ov15_0238A140: ; 0x0238A140
	stmdb sp!, {r3, lr}
	mov r0, #0xec
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A228 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	str r0, [r1]
	add r0, r0, #0x88
	bl InitPreprocessorArgs
	mov r0, #0
	bl CreateDialogueBox
	ldr r2, _0238A228 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #3
	ldr r3, [r2]
	mov r2, #1
	strb r0, [r3, #0x80]
	mov r0, #0
	bl CreatePortraitBox
	ldr r2, _0238A228 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r3, #1
	ldr r1, [r2]
	mov ip, #0
	strb r0, [r1, #0x81]
	ldr r0, [r2]
	ldr r1, _0238A22C ; =0x00000183
	strb r3, [r0, #0x68]
	ldr r0, [r2]
	ldr r3, _0238A230 ; =0x0000270F
	str ip, [r0, #0x10]
	ldr r0, [r2]
	str r1, [r0, #0x88]
	ldr r0, [r2]
	str r3, [r0, #0xac]
	ldr r0, [r2]
	str r1, [r0, #0xd4]
	ldr r0, [r2]
	str ip, [r0]
	ldr r0, [r2]
	add r0, r0, #0xdc
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238A228 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl SetPortraitLayout
	ldr r0, _0238A228 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl SetPortraitEmotion
	ldr r0, _0238A228 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xdc
	bl ShowPortraitInPortraitBox
	mov r0, #0
	bl ov15_0238A4E8
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A228: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238A22C: .word 0x00000183
_0238A230: .word 0x0000270F
	arm_func_end ov15_0238A140

	arm_func_start ov15_0238A234
ov15_0238A234: ; 0x0238A234
	stmdb sp!, {r4, lr}
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _0238A4B4
_0238A250: ; jump table
	b _0238A4B4 ; case 0
	b _0238A284 ; case 1
	b _0238A2A8 ; case 2
	b _0238A4B4 ; case 3
	b _0238A4B4 ; case 4
	b _0238A4B4 ; case 5
	b _0238A4AC ; case 6
	b _0238A4B4 ; case 7
	b _0238A35C ; case 8
	b _0238A4B4 ; case 9
	b _0238A4B4 ; case 10
	b _0238A400 ; case 11
	b _0238A4B4 ; case 12
_0238A284:
	ldrsb r0, [r1, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A4D4
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov15_0238A4E8
	b _0238A4D4
_0238A2A8:
	ldrsb r0, [r1, #0x83]
	bl GetSimpleMenuResult
	ldr r1, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A4D4
	cmp r4, #4
	addls pc, pc, r4, lsl #2
	b _0238A4D4
_0238A2D8: ; jump table
	b _0238A4D4 ; case 0
	b _0238A340 ; case 1
	b _0238A2EC ; case 2
	b _0238A308 ; case 3
	b _0238A324 ; case 4
_0238A2EC:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #7
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #8]
	bl ov15_0238A4E8
	b _0238A4D4
_0238A308:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #0xa
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #8]
	bl ov15_0238A4E8
	b _0238A4D4
_0238A324:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #3
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #8]
	bl ov15_0238A4E8
	b _0238A4D4
_0238A340:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #4
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #8]
	bl ov15_0238A4E8
	b _0238A4D4
_0238A35C:
	add r0, r1, #0x54
	bl sub_020396E4
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238A4D4
_0238A370: ; jump table
	b _0238A4D4 ; case 0
	b _0238A380 ; case 1
	b _0238A3E4 ; case 2
	b _0238A3A0 ; case 3
_0238A380:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xd8]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxField0x1C2
	b _0238A4D4
_0238A3A0:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, [r0]
	ldr r1, [r2, #0x54]
	str r1, [r2, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl AddMoneyStored
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	rsb r0, r0, #0
	bl AddMoneyCarried
	ldr r0, _0238A4E0 ; =0x00001308
	bl sub_02017C80
	mov r0, #9
	bl ov15_0238A4E8
	b _0238A4D4
_0238A3E4:
#ifdef EUROPE
	mov r0, #1
	bl PlaySeVolumeWrapper
#endif
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, #5
	bl ov15_0238A4E8
	b _0238A4D4
_0238A400:
	add r0, r1, #0x54
	bl sub_020396E4
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238A4D4
_0238A414: ; jump table
	b _0238A4D4 ; case 0
	b _0238A424 ; case 1
	b _0238A488 ; case 2
	b _0238A444 ; case 3
_0238A424:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0xd8]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxField0x1C2
	b _0238A4D4
_0238A444:
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, [r0]
	ldr r1, [r2, #0x54]
	str r1, [r2, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	rsb r0, r0, #0
	bl AddMoneyStored
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl AddMoneyCarried
	ldr r0, _0238A4E0 ; =0x00001308
	bl sub_02017C80
	mov r0, #0xc
	bl ov15_0238A4E8
	b _0238A4D4
_0238A488:
#ifdef EUROPE
	mov r0, #1
	bl PlaySeVolumeWrapper
#else
	ldr r0, _0238A4E4 ; =ov15_0238B0CC
	bl Debug_Print0
#endif
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, #5
	bl ov15_0238A4E8
	b _0238A4D4
_0238A4AC:
	mov r0, #3
	ldmia sp!, {r4, pc}
_0238A4B4:
	ldrsb r0, [r1, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238A4D4
	ldr r0, _0238A4DC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov15_0238A4E8
_0238A4D4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238A4DC: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238A4E0: .word 0x00001308
#ifndef EUROPE
_0238A4E4: .word ov15_0238B0CC
#endif
	arm_func_end ov15_0238A234

	arm_func_start ov15_0238A4E8
ov15_0238A4E8: ; 0x0238A4E8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, [r1]
	str r0, [r2, #4]
#ifdef JAPAN
	ldr r2, [r1]
	ldr r0, [r2, #4]
#else
	ldr r3, [r1]
	ldr r0, [r3, #4]
#endif
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _0238AD08
_0238A510: ; jump table
	b _0238A548 ; case 0
	b _0238A56C ; case 1
	b _0238A634 ; case 2
	b _0238A68C ; case 3
	b _0238A708 ; case 4
	b _0238A7AC ; case 5
	b _0238AD08 ; case 6
	b _0238A820 ; case 7
	b _0238A914 ; case 8
	b _0238AA08 ; case 9
	b _0238AA88 ; case 10
	b _0238AB94 ; case 11
	b _0238AC80 ; case 12
	b _0238AD00 ; case 13
_0238A548:
#ifdef JAPAN
	mov r0, #1
	str r0, [r2, #8]
#else
	mov r2, #1
	str r2, [r3, #8]
#endif
	ldr r3, [r1]
	ldr r1, _0238AD14 ; =0x00003008
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C278 ; =0x0000323A
#else
	add r2, r2, #0x374
#endif
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A56C:
#ifdef JAPAN
	ldrsb r1, [r2, #0x68]
#else
	ldrsb r1, [r3, #0x68]
#endif
	mvn r0, #1
	cmp r1, r0
	beq _0238A5CC
	tst r1, #0x80
	beq _0238A5CC
	ldr r0, _0238AD18 ; =ov15_0238B0D4
	and r1, r1, #0x1f
#ifdef JAPAN
	strb r1, [r2, #0x68]
#else
	strb r1, [r3, #0x68]
#endif
	bl Debug_Print0
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl CloseAdvancedTextBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl CloseTextBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x82]
	ldr r0, [r0]
	strb r2, [r0, #0x68]
_0238A5CC:
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	bl GetMoneyStored
	cmp r0, #0
	bne _0238A608
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD14 ; =0x00003008
	ldr r3, [r0]
	ldr r2, _0238AD1C ; =0x00000376
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A608:
	bl GetMoneyStored
	ldr r3, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD14 ; =0x00003008
	ldr ip, [r3]
#ifdef JAPAN
	add r2, r1, #0x234
#else
	ldr r2, _0238AD20 ; =0x00000377
#endif
	str r0, [ip, #0xac]
	ldr r3, [r3]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A634:
	ldr r0, _0238AD24 ; =BANK_WINDOW_PARAMS_2
	ldr r1, _0238AD28 ; =ov15_0238ADC4
	bl CreateTextBox
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, [r1]
	strb r0, [r2, #0x82]
	ldr r0, [r1]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	ldr r0, _0238AD2C ; =ov15_0238B0E0
	bl Debug_Print0
	mov r1, #4
	ldr r0, _0238AD30 ; =BANK_WINDOW_PARAMS_4
	str r1, [sp]
	ldr r1, _0238AD34 ; =0x00300013
	mov r2, #0
	ldr r3, _0238AD38 ; =BANK_MAIN_MENU_ITEMS
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238AD08
_0238A68C:
	ldr r0, _0238AD3C ; =ov15_0238B0E8
	bl Debug_Print0
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x83]
	bl CloseSimpleMenu
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x83]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl CloseTextBox
	mvn r3, #1
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov ip, #1
	ldr r2, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	strb r3, [r2, #0x82]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C2A0_JP ; =0x0000323D
#else
	mov r2, #0x378
#endif
	str ip, [r3, #8]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A708:
	ldr r0, _0238AD3C ; =ov15_0238B0E8
	mov r1, #6
#ifdef JAPAN
	str r1, [r2, #8]
#else
	str r1, [r3, #8]
#endif
	bl Debug_Print0
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x83]
	bl CloseSimpleMenu
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x83]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl CloseTextBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x82]
	bl GetMoneyStored
	cmp r0, #0
	ldr r1, _0238AD40 ; =0x00003018
	bne _0238A790
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, _0238AD44 ; =0x00000379
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A790:
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, _0238AD48 ; =0x0000037A
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A7AC:
	ldr r0, _0238AD4C ; =ov15_0238B0F4
	bl Debug_Print0
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #1
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxState5
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl sub_020288DC
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD14 ; =0x00003008
	ldr ip, [r0]
#ifdef JAPAN
	mov r2, #0x3240
#else
	ldr r2, _0238AD50 ; =0x0000037B
#endif
	ldrsb r3, [ip, #0x68]
	orr r3, r3, #0x80
	strb r3, [ip, #0x68]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A820:
	ldr r0, _0238AD3C ; =ov15_0238B0E8
	bl Debug_Print0
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x83]
	bl CloseSimpleMenu
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl CloseTextBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x82]
	ldr r0, [r0]
	strb r2, [r0, #0x83]
	bl GetMoneyCarried
	cmp r0, #0
	bne _0238A8AC
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD14 ; =0x00003008
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C2B4 ; =0x00003241
#else
	mov r2, #0x37c
#endif
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238AD08
_0238A8AC:
	bl GetMoneyStored
	ldr r1, _0238AD54 ; =0x0098967F
	cmp r0, r1
	blt _0238A8E8
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
#ifdef JAPAN
	mov r3, #1
	ldr r2, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	str r3, [r2, #8]
	ldr r3, [r0]
	ldr r2, _0238C2BC ; =0x00003242
#else
	mov ip, #1
	ldr r2, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	str ip, [r2, #8]
	ldr r3, [r0]
	add r2, ip, #0x37c
#endif
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A8E8:
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov ip, #8
	ldr r1, [r0]
	ldr r2, _0238AD58 ; =0x0000037E
	str ip, [r1, #8]
	ldr r3, [r0]
	add r1, ip, #0x3000
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238A914:
#ifdef JAPAN
	ldrsb r0, [r2, #0x80]
#else
	ldrsb r0, [r3, #0x80]
#endif
	bl ShowDialogueBox
	bl GetMoneyStored
	ldr r2, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD54 ; =0x0098967F
	ldr r2, [r2]
	sub r0, r1, r0
	str r0, [r2, #0x60]
	bl GetMoneyCarried
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	cmp r1, r0
	ble _0238A95C
	bl GetMoneyCarried
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r1]
	str r0, [r1, #0x60]
_0238A95C:
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r3, #1
	ldr r2, [r1]
	mov lr, #5
	ldr r0, [r2, #0x60]
	mov ip, #0x50
	str r0, [r2, #0x58]
	ldr r2, [r1]
	ldr r0, _0238AD5C ; =ov15_0238B10C
	str r3, [r2, #0x5c]
	ldr r3, [r1]
	mov r2, #0x12
	str lr, [r3, #0x64]
	ldr r3, [r1]
	str ip, [r3, #0x74]
	ldr r1, [r1]
	str r2, [r1, #0x78]
	bl Debug_Print0
	ldr r0, _0238AD24 ; =BANK_WINDOW_PARAMS_2
	ldr r1, _0238AD28 ; =ov15_0238ADC4
	bl CreateTextBox
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #0
	ldr r3, [r1]
	ldr r1, _0238AD60 ; =0x00001017
	strb r0, [r3, #0x82]
	str r2, [sp]
	ldr r0, _0238AD64 ; =BANK_WINDOW_PARAMS_3
	ldr r3, _0238AD68 ; =ov15_0238AE6C
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
#ifdef EUROPE
	ldr r2, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0
	ldr r3, [r2]
	strb r0, [r3, #0x68]
	ldr r0, [r2]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxField0x1C4
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
#else
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, [r1]
	strb r0, [r2, #0x68]
	ldr r0, [r1]
#endif
	add r0, r0, #0x54
	bl sub_020395CC
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0xd8]
	bl ov15_0238AD78
	b _0238AD08
_0238AA08:
#ifdef JAPAN
	ldrsb r0, [r2, #0x80]
#else
	ldrsb r0, [r3, #0x80]
#endif
	bl ShowDialogueBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxState5
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl sub_020288DC
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov ip, #1
	ldr lr, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	ldrsb r3, [lr, #0x68]
#ifdef JAPAN
	add r2, r1, #0x23c
#else
	rsb r2, ip, #0x380
#endif
	orr r3, r3, #0x80
	strb r3, [lr, #0x68]
	ldr r3, [r0]
	str ip, [r3, #8]
	ldr ip, [r0]
	ldr r3, [ip, #0xc]
	str r3, [ip, #0xac]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238AA88:
	ldr r0, _0238AD3C ; =ov15_0238B0E8
	bl Debug_Print0
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x83]
	bl CloseSimpleMenu
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl CloseTextBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x82]
	ldr r1, [r0]
	strb r2, [r1, #0x83]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	bl GetMoneyCarried
	ldr r1, _0238AD6C ; =0x0001869F
	cmp r0, r1
	blt _0238AB20
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r3, #1
	ldr r2, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	str r3, [r2, #8]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C2D8 ; =0x00003245
#else
	mov r2, #0x380
#endif
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238AB20:
	bl GetMoneyStored
	cmp r0, #0
	bne _0238AB58
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
#ifdef JAPAN
	mov r3, #1
	ldr r2, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	str r3, [r2, #8]
	ldr r3, [r0]
	ldr r2, _0238C2DC ; =0x00003246
#else
	mov ip, #1
	ldr r2, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	str ip, [r2, #8]
	ldr r3, [r0]
	add r2, ip, #0x380
#endif
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238AB58:
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #8]
	bl GetMoneyStored
	ldr r3, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD14 ; =0x00003008
	ldr ip, [r3]
	ldr r2, _0238AD70 ; =0x00000382
	str r0, [ip, #0xac]
	ldr r3, [r3]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238AB94:
	bl GetMoneyCarried
	ldr r2, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, _0238AD6C ; =0x0001869F
	ldr r2, [r2]
	sub r0, r1, r0
	str r0, [r2, #0x60]
	bl GetMoneyStored
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	cmp r1, r0
	ble _0238ABD4
	bl GetMoneyStored
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r1]
	str r0, [r1, #0x60]
_0238ABD4:
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r3, #1
	ldr r2, [r1]
	mov lr, #5
	ldr r0, [r2, #0x60]
	mov ip, #0x50
	str r0, [r2, #0x58]
	ldr r2, [r1]
	ldr r0, _0238AD74 ; =ov15_0238B114
	str r3, [r2, #0x5c]
	ldr r3, [r1]
	mov r2, #0x12
	str lr, [r3, #0x64]
	ldr r3, [r1]
	str ip, [r3, #0x74]
	ldr r1, [r1]
	str r2, [r1, #0x78]
	bl Debug_Print0
	ldr r0, _0238AD24 ; =BANK_WINDOW_PARAMS_2
	ldr r1, _0238AD28 ; =ov15_0238ADC4
	bl CreateTextBox
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r2, #0
	ldr r3, [r1]
	ldr r1, _0238AD60 ; =0x00001017
	strb r0, [r3, #0x82]
	str r2, [sp]
	ldr r0, _0238AD64 ; =BANK_WINDOW_PARAMS_3
	ldr r3, _0238AD68 ; =ov15_0238AE6C
	str r2, [sp, #4]
	bl CreateAdvancedTextBox
#ifdef EUROPE
	ldr r2, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0
	ldr r3, [r2]
	strb r0, [r3, #0x68]
	ldr r0, [r2]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxField0x1C4
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
#else
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r2, [r1]
	strb r0, [r2, #0x68]
	ldr r0, [r1]
#endif
	add r0, r0, #0x54
	bl sub_020395CC
	ldr r1, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1, #0xd8]
	bl ov15_0238AD78
	b _0238AD08
_0238AC80:
#ifdef JAPAN
	ldrsb r0, [r2, #0x80]
#else
	ldrsb r0, [r3, #0x80]
#endif
	bl ShowDialogueBox
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl sub_0202F954
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl SetAdvancedTextBoxState5
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x68]
	bl sub_020288DC
	ldr r0, _0238AD10 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov ip, #1
	ldr lr, [r0]
	ldr r1, _0238AD14 ; =0x00003008
	ldrsb r3, [lr, #0x68]
#ifdef JAPAN
	add r2, r1, #0x240
#else
	rsb r2, ip, #0x384
#endif
	orr r3, r3, #0x80
	strb r3, [lr, #0x68]
	ldr r3, [r0]
	str ip, [r3, #8]
	ldr ip, [r0]
	ldr r3, [ip, #0xc]
	str r3, [ip, #0xac]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x88
	bl ShowStringIdInDialogueBox
	b _0238AD08
_0238AD00:
#ifdef JAPAN
	ldrsb r0, [r2, #0x82]
#else
	ldrsb r0, [r3, #0x82]
#endif
	bl sub_0202F954
_0238AD08:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
#define OV15_0238A4E8_OFFSET 0x2EC5
#else
#define OV15_0238A4E8_OFFSET 0
#endif
_0238AD10: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238AD14: .word 0x00003008
#ifdef JAPAN
_0238C278: .word 0x0000323A
#endif
_0238AD18: .word ov15_0238B0D4
_0238AD1C: .word 0x00000376 + OV15_0238A4E8_OFFSET
#ifndef JAPAN
_0238AD20: .word 0x00000377
#endif
_0238AD24: .word BANK_WINDOW_PARAMS_2
_0238AD28: .word ov15_0238ADC4
_0238AD2C: .word ov15_0238B0E0
_0238AD30: .word BANK_WINDOW_PARAMS_4
_0238AD34: .word 0x00300013
_0238AD38: .word BANK_MAIN_MENU_ITEMS
_0238AD3C: .word ov15_0238B0E8
#ifdef JAPAN
_0238C2A0_JP: .word 0x0000323D
#endif
_0238AD40: .word 0x00003018
_0238AD44: .word 0x00000379 + OV15_0238A4E8_OFFSET
_0238AD48: .word 0x0000037A + OV15_0238A4E8_OFFSET
_0238AD4C: .word ov15_0238B0F4
#ifdef JAPAN
_0238C2B4: .word 0x00003241
_0238AD54: .word 0x0098967F
_0238C2BC: .word 0x00003242
#else
_0238AD50: .word 0x0000037B
_0238AD54: .word 0x0098967F
#endif
_0238AD58: .word 0x0000037E + OV15_0238A4E8_OFFSET
_0238AD5C: .word ov15_0238B10C
_0238AD60: .word 0x00001017
_0238AD64: .word BANK_WINDOW_PARAMS_3
_0238AD68: .word ov15_0238AE6C
_0238AD6C: .word 0x0001869F
#ifdef JAPAN
_0238C2D8: .word 0x00003245
_0238C2DC: .word 0x00003246
#endif
_0238AD70: .word 0x00000382 + OV15_0238A4E8_OFFSET
_0238AD74: .word ov15_0238B114
	arm_func_end ov15_0238A4E8

	arm_func_start ov15_0238AD78
ov15_0238AD78: ; 0x0238AD78
	stmdb sp!, {r3, lr}
	cmp r0, #0
#ifdef JAPAN
	ldrne r0, _0238C32C ; =0x00003249
#else
	movne r0, #0x384
#endif
	ldr r1, _0238ADBC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldreq r0, _0238ADC0 ; =0x00000385
	ldr r1, [r1]
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	ldrsb r0, [r1, #0x68]
	mov r1, #2
	mov r2, #0
	bl sub_02026268
	ldr r0, _0238ADBC ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_02039B0C
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_0238C32C: .word 0x00003249
_0238ADBC: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238ADC0: .word 0x0000324A
#else
_0238ADBC: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238ADC0: .word 0x00000385
#endif
	arm_func_end ov15_0238AD78

	arm_func_start ov15_0238ADC4
ov15_0238ADC4: ; 0x0238ADC4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	bl GetMoneyCarried
	add ip, sp, #0x400
	str r0, [sp, #0x428]
	add ip, ip, #4
	ldr r2, _0238AE64 ; =0x00000373
	ldr r3, _0238AE68 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #4
	mov r0, r4
	mov r1, #8
	mov r2, #6
	bl DrawTextInWindow
	bl GetMoneyStored
	add r1, sp, #0x400
	str r0, [sp, #0x428]
	add r1, r1, #4
	str r1, [sp]
#ifdef JAPAN
	ldr r2, _0238C3E0 ; =0x00003239
	ldr r3, _0238AE68 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
#else
	ldr r3, _0238AE68 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	mov r2, #0x374
#endif
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #0x74
	mov r2, #6
	add r3, sp, #4
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_0238AE64: .word 0x00003238
_0238AE68: .word 0x0000C402
_0238C3E0: .word 0x00003239
#else
_0238AE64: .word 0x00000373
_0238AE68: .word 0x0000C402
#endif
	arm_func_end ov15_0238ADC4

	arm_func_start ov15_0238AE6C
ov15_0238AE6C: ; 0x0238AE6C
	ldr r0, _0238AE80 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr ip, _0238AE84 ; =ov15_0238AD78
	ldr r0, [r0]
	ldrb r0, [r0, #0xd8]
	bx ip
	.align 2, 0
_0238AE80: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238AE84: .word ov15_0238AD78
	arm_func_end ov15_0238AE6C

	arm_func_start ov15_0238AE88
ov15_0238AE88: ; 0x0238AE88
	stmdb sp!, {r3, lr}
	bl ov15_0238A140
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov15_0238AE88

	arm_func_start ov15_0238AE98
ov15_0238AE98: ; 0x0238AE98
	stmdb sp!, {r3, lr}
	ldr r0, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r1, [r0, #0x80]
	mvn r0, #1
	cmp r1, r0
	beq _0238AEC4
	ldr r0, _0238AF44 ; =ov15_0238B11C
	bl Debug_Print0
_0238AEC4:
	ldr r1, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x82]
	cmp r1, r0
	beq _0238AEE4
	ldr r0, _0238AF48 ; =ov15_0238B12C
	bl Debug_Print0
_0238AEE4:
	ldr r1, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x83]
	cmp r1, r0
	beq _0238AF04
	ldr r0, _0238AF4C ; =ov15_0238B13C
	bl Debug_Print0
_0238AF04:
	ldr r1, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x84]
	cmp r1, r0
	beq _0238AF24
	ldr r0, _0238AF50 ; =ov15_0238B150
	bl Debug_Print0
_0238AF24:
	ldr r0, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238AF40: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238AF44: .word ov15_0238B11C
_0238AF48: .word ov15_0238B12C
_0238AF4C: .word ov15_0238B13C
_0238AF50: .word ov15_0238B150
	arm_func_end ov15_0238AE98

	arm_func_start ov15_0238AF54
ov15_0238AF54: ; 0x0238AF54
	stmdb sp!, {r3, lr}
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0238B048
_0238AF70: ; jump table
	b _0238AF88 ; case 0
	b _0238AF94 ; case 1
	b _0238AFB0 ; case 2
	b _0238B03C ; case 3
	b _0238B048 ; case 4
	b _0238AFF4 ; case 5
_0238AF88:
	mov r0, #1
	str r0, [r1]
	b _0238B048
_0238AF94:
	bl ov15_0238A234
	cmp r0, #3
	ldreq r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238B048
_0238AFB0:
	ldrsb r0, [r1, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238B048
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _0238B048
_0238AFF4:
	ldrsb r0, [r1, #0x80]
	bl sub_0202836C
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl ClosePortraitBox
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl CloseDialogueBox
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r3, #3
	ldr r2, [r0]
	sub r1, r3, #5
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #0x80]
	b _0238B048
_0238B03C:
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, pc}
_0238B048:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B050: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
	arm_func_end ov15_0238AF54
	; 0x0238B054

	.global BANK_MAIN_MENU_ITEMS
BANK_MAIN_MENU_ITEMS:
#ifdef JAPAN
#define OV15_DATA_OFFSET 0x2EC5
#else
#define OV15_DATA_OFFSET 0
#endif
	.word 0x36F + OV15_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x370 + OV15_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x371 + OV15_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x372 + OV15_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x12, 0x1E, 0x05
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_2
BANK_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x1C, 0x03
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_3
BANK_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x08, 0x0B, 0x07
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_4
BANK_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0A, 0x05
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
#ifndef EUROPE
	.global ov15_0238B0CC
ov15_0238B0CC:
	.byte 0x43, 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00
#endif
	.global ov15_0238B0D4
ov15_0238B0D4:
	.byte 0x52, 0x2D, 0x43, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov15_0238B0E0
ov15_0238B0E0:
	.byte 0x4D, 0x2D, 0x4F, 0x70
	.byte 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B0E8
ov15_0238B0E8:
	.byte 0x53, 0x2D, 0x43, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov15_0238B0F4
ov15_0238B0F4:
	.byte 0x4D, 0x65, 0x6E, 0x75, 0x5F, 0x42, 0x61, 0x6E, 0x6B, 0x5F, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x43
	.byte 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00, 0x00
	.global ov15_0238B10C
ov15_0238B10C:
	.byte 0x50, 0x2D, 0x4F, 0x70, 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B114
ov15_0238B114:
	.byte 0x47, 0x2D, 0x4F, 0x70, 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B11C
ov15_0238B11C:
	.byte 0x6D, 0x65, 0x73, 0x20, 0x6E, 0x6F, 0x74, 0x20
	.byte 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00
	.global ov15_0238B12C
ov15_0238B12C:
	.byte 0x73, 0x75, 0x62, 0x20, 0x6E, 0x6F, 0x74, 0x20
	.byte 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00
	.global ov15_0238B13C
ov15_0238B13C:
	.byte 0x73, 0x65, 0x6C, 0x65, 0x63, 0x74, 0x20, 0x6E
	.byte 0x6F, 0x74, 0x20, 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00
	.global ov15_0238B150
ov15_0238B150:
	.byte 0x49, 0x6E, 0x70, 0x75
	.byte 0x74, 0x20, 0x6E, 0x6F, 0x74, 0x20, 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00

	.data
	.global OVERLAY15_UNKNOWN_POINTER__NA_238B180
OVERLAY15_UNKNOWN_POINTER__NA_238B180:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
