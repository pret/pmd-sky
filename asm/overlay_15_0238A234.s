	.include "asm/macros.inc"
	.include "overlay_15_0238A234.inc"

	.text

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
