	.include "asm/macros.inc"
	.include "overlay_16.inc"

	.text

	arm_func_start ov16_0238A140
ov16_0238A140: ; 0x0238A140
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x128
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r1]
	str r0, [r2, #0x70]
	ldr r0, [r1]
	ldr r2, [r0, #0x70]
	cmp r2, #0x2c
	addls pc, pc, r2, lsl #2
	b _0238B0C4
_0238A168: ; jump table
	b _0238A21C ; case 0
	b _0238A274 ; case 1
	b _0238A2D8 ; case 2
	b _0238A344 ; case 3
	b _0238A370 ; case 4
	b _0238B0C4 ; case 5
	b _0238A318 ; case 6
	b _0238A928 ; case 7
	b _0238A95C ; case 8
	b _0238A9C4 ; case 9
	b _0238AEA0 ; case 10
	b _0238AE3C ; case 11
	b _0238AE6C ; case 12
	b _0238A640 ; case 13
	b _0238A614 ; case 14
	b _0238AE74 ; case 15
	b _0238A574 ; case 16
	b _0238A5D8 ; case 17
	b _0238A480 ; case 18
	b _0238A50C ; case 19
	b _0238A440 ; case 20
	b _0238B0C4 ; case 21
	b _0238A730 ; case 22
	b _0238A850 ; case 23
	b _0238B0C4 ; case 24
	b _0238B0C4 ; case 25
	b _0238A668 ; case 26
	b _0238A6F4 ; case 27
	b _0238A9F4 ; case 28
	b _0238AA58 ; case 29
	b _0238AA94 ; case 30
	b _0238AAD8 ; case 31
	b _0238AFF8 ; case 32
	b _0238AED8 ; case 33
	b _0238AF98 ; case 34
	b _0238AFD0 ; case 35
	b _0238B0C4 ; case 36
	b _0238AFEC ; case 37
	b _0238B0C4 ; case 38
	b _0238B038 ; case 39
	b _0238B0C4 ; case 40
	b _0238B0C4 ; case 41
	b _0238B0C4 ; case 42
	b _0238B0C4 ; case 43
	b _0238A424 ; case 44
_0238A21C:
	bl ov16_0238CBD0
	cmp r0, #0
	bne _0238A240
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A240:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B0D0 ; =0x00000431
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A274:
	bl ov16_0238CBD0
	cmp r0, #0
	bne _0238A298
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A298:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #6
	ldr r1, [r0]
	ldr r2, _0238B0D4 ; =0x00000432
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A2D8:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #1
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _0238C638 ; =0x000032E1
#else
	add r2, r3, #0x440
#endif
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A318:
	ldr r0, _0238B0D8 ; =EVO_WINDOW_PARAMS_6
	mov r4, #3
	ldr r1, _0238B0DC ; =0x00300011
	ldr r3, _0238B0E0 ; =EVO_MAIN_MENU_ITEMS
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238A344:
	mov r1, #1
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B0E4 ; =0x00000442
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A370:
	mov r1, #5
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x88]
	cmp r0, #0
	ble _0238A394
	bl sub_020572EC
_0238A394:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldr r1, [r2, #0x88]
	cmp r1, #1
	ble _0238A3DC
	mov r1, #4
	str r1, [r2, #0x74]
	ldr r1, [r0]
	ldr r2, _0238B0E8 ; =0x00000449
	ldrsb r0, [r1, #0xc1]
	add r3, r1, #0xe8
	mov r1, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x88]
	b _0238B0C4
_0238A3DC:
	bl ov16_0238CBD0
	cmp r0, #0
	mov r1, #0x18
	bne _0238A408
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef JAPAN
	ldr r2, _0238C650 ; =0x000032E0
#else
	mov r2, #0x440
#endif
	ldr r3, [r0]
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A408:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef JAPAN
	rsb r2, r1, #0x3300
#else
	add r2, r1, #0x430
#endif
	ldr r3, [r0]
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A424:
	mov r2, #5
	str r2, [r0, #0xd8]
	ldr r0, [r1]
	mov r1, #1
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A440:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0x27
	ldr r1, [r0]
#ifdef JAPAN
	rsb r2, r3, #0x3300
#else
	rsb r2, r3, #0x460
#endif
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A480:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, [r0, #0x3c]
	add r0, r0, #0x138
	add r1, r1, #0x3a
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	add r1, r2, #0x138
	str r1, [r2, #0x120]
	ldr r2, [r0]
	ldr r1, [r2, #0x3c]
	ldrsh r1, [r1, #4]
	str r1, [r2, #0xe8]
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	str r1, [r2, #0xec]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef JAPAN
	mov r3, #0x13
	ldr r2, [r0]
	mov r1, #8
	str r3, [r2, #0x74]
	ldr r3, [r0]
	ldr r2, _0238C654 ; =0x000032D8
#else
	mov r1, #8
	mov r4, #0x13
	ldr r3, [r0]
	add r2, r1, #0x430
	str r4, [r3, #0x74]
	ldr r3, [r0]
#endif
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A50C:
	ldr r2, [r0, #0x40]
	mov r1, #0
	add r0, r0, r2, lsl #1
	ldrsh r0, [r0, #0xc]
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrne r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #0x1a
	ldreq r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	moveq r1, #0x1c
	ldr r0, [r0]
	mov r4, #2
	str r1, [r0, #0x74]
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r3, _0238B0EC ; =EVO_MENU_ITEMS_CONFIRM
	ldr r1, [r0]
	ldr r0, _0238B0D8 ; =EVO_WINDOW_PARAMS_6
	str r4, [r1, #0x78]
	ldr r1, _0238B0F0 ; =0x00300013
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238A574:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldrsh r1, [r2, #0x44]
	orr r1, r1, #0x20000
	str r1, [r2, #0xe8]
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	str r1, [r2, #0xec]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0x11
	ldr r1, [r0]
	ldr r2, _0238B0F4 ; =0x00000434
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A5D8:
	mov r2, #0x1c
	str r2, [r0, #0x74]
	ldr r0, [r1]
	mov r4, #2
	str r4, [r0, #0x78]
	ldr r0, _0238B0D8 ; =EVO_WINDOW_PARAMS_6
	ldr r1, _0238B0F0 ; =0x00300013
	ldr r3, _0238B0EC ; =EVO_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238A614:
	ldr r0, _0238B0F8 ; =EVO_WINDOW_PARAMS_5
	mov r4, #3
	ldr r3, _0238B0FC ; =EVO_SUBMENU_ITEMS
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238A640:
	ldr r1, [r0, #0x3c]
	add r0, sp, #0x18
	bl sub_0205B008
	add r0, sp, #0x18
	mov r1, #3
	bl sub_0203F150
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc4]
	b _0238B0C4
_0238A668:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, [r0, #0x3c]
	add r0, r0, #0x138
	add r1, r1, #0x3a
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	add r1, r2, #0x138
	str r1, [r2, #0x120]
	ldr r2, [r0]
	ldr r1, [r2, #0x3c]
	ldrsh r1, [r1, #4]
	str r1, [r2, #0xe8]
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	str r1, [r2, #0xec]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r4, #0x1b
	ldr r2, [r0]
	mov r1, #8
	str r4, [r2, #0x74]
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r4, #0x32c0
#else
	add r2, r4, #0x420
#endif
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A6F4:
	mov r2, #0x1c
	str r2, [r0, #0x74]
	ldr r0, [r1]
	mov r4, #2
	str r4, [r0, #0x78]
	ldr r0, _0238B0D8 ; =EVO_WINDOW_PARAMS_6
	ldr r1, _0238B0F0 ; =0x00300013
	ldr r3, _0238B0EC ; =EVO_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238A730:
	mov r2, #0
	str r2, [r0, #0x40]
	ldr r3, [r1]
	ldr r0, _0238B100 ; =0x00000125
	ldr r1, [r3, #0x3c]
	ldrsh r1, [r1, #4]
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	moveq r0, #0
	beq _0238A7DC
	mov r1, r2
_0238A760:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #0xc]
	add r1, r1, #1
	cmp r0, #0
	addne r2, r2, #1
	cmp r1, #8
	blt _0238A760
	cmp r2, #1
	bne _0238A7D8
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0
_0238A78C:
	ldr r2, [r0]
	add r1, r2, r3, lsl #1
	ldrsh r1, [r1, #0xc]
	cmp r1, #0
	beq _0238A7C4
	strh r1, [r2, #0xc]
	ldr r2, [r0]
	add r1, r2, r3, lsl #1
	ldrsh r1, [r1, #0x1c]
	strh r1, [r2, #0x1c]
	ldr r2, [r0]
	add r1, r2, r3, lsl #1
	ldrsh r1, [r1, #0x2c]
	strh r1, [r2, #0x2c]
_0238A7C4:
	add r3, r3, #1
	cmp r3, #8
	blt _0238A78C
	mov r0, #1
	b _0238A7DC
_0238A7D8:
	mov r0, #2
_0238A7DC:
	cmp r0, #0
	beq _0238A7F0
	cmp r0, #1
	beq _0238A820
	b _0238A838
_0238A7F0:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldrsh r0, [r1, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [r1, #0x40]
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A820:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A838:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A850:
	ldrsh r2, [r0, #0x44]
	orr r2, r2, #0x20000
	str r2, [r0, #0xe8]
	ldr r2, [r1]
	ldr r0, [r2, #0x40]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	str r0, [r2, #0xec]
	ldr r2, [r1]
	ldr r0, [r2, #0x40]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x1c]
	str r0, [r2, #0xf8]
	ldr r2, [r1]
	ldr r0, [r2, #0x40]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x2c]
	str r0, [r2, #0xfc]
	ldr r1, [r1]
	ldr r0, [r1, #0xf8]
	cmp r0, #0
	ldreq r0, [r1, #0xfc]
	streq r0, [r1, #0xf8]
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r3, [r0]
	ldr r2, [r3, #0x40]
	add r0, r3, r2, lsl #1
	ldrsh r0, [r0, #0x1c]
	cmp r0, #0
	add r0, r3, r2, lsl #1
	ldrsh r0, [r0, #0x2c]
	addne r1, r1, #1
	cmp r0, #0
	addne r1, r1, #1
	cmp r1, #0
	beq _0238A8F8
	cmp r1, #1
	beq _0238A908
	cmp r1, #2
	beq _0238A918
	b _0238B0C4
_0238A8F8:
	mov r0, #0x12
	str r0, [r3, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A908:
	mov r0, #7
	str r0, [r3, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A918:
	mov r0, #9
	str r0, [r3, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238A928:
	bl ov16_0238CAE8
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #8
	ldr r1, [r0]
	ldr r2, _0238B104 ; =0x0000043E
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A95C:
	ldr r2, [r0, #0x40]
	mov r1, #0
	add r0, r0, r2, lsl #1
	ldrsh r0, [r0, #0xc]
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrne r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #0x1a
	ldreq r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	moveq r1, #0x1c
	ldr r0, [r0]
	mov r4, #2
	str r1, [r0, #0x74]
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r3, _0238B0EC ; =EVO_MENU_ITEMS_CONFIRM
	ldr r1, [r0]
	ldr r0, _0238B0D8 ; =EVO_WINDOW_PARAMS_6
	str r4, [r1, #0x78]
	ldr r1, _0238B0F0 ; =0x00300013
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238A9C4:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #8
	ldr r1, [r0]
	ldr r2, _0238B108 ; =0x0000043A
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238A9F4:
	ldrsb r0, [r0, #0xc1]
	bl sub_0202F2C4
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0x14
	ldr r1, [r0]
	mov r2, #3
	str r3, [r1, #0xe4]
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0xd8]
	ldr r4, [r0]
	mov r1, #0x1d
	ldr r2, [r4, #0x3c]
	ldrsh r2, [r2, #4]
	strh r2, [r4, #0xdc]
	ldr r4, [r0]
	ldr r2, [r4, #0x40]
	add r2, r4, r2, lsl #1
	ldrsh r2, [r2, #0xc]
	strh r2, [r4, #0xde]
	ldr r2, [r0]
	str r3, [r2, #0xe0]
	ldr r0, [r0]
	str r1, [r0, #0x74]
	b _0238B0C4
_0238AA58:
	ldrsh r3, [r0, #0x44]
	mov r2, #0x1e
	orr r3, r3, #0x20000
	str r3, [r0, #0xe8]
	ldr r0, [r1]
	str r2, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B10C ; =0x0000043C
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238AA94:
	mov r1, #0x1f
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #3
	ldr r1, [r0]
	ldr r3, _0238B110 ; =0x0000140F
	str r2, [r1, #0xe0]
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _0238C680 ; =0x000032DD
#else
	rsb r2, r2, #0x440
#endif
	str r3, [r1, #0x10c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238AAD8:
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldr r1, [r2, #0x3c]
	ldrsh r1, [r1, #4]
	str r1, [r2, #0xe8]
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl IsMonsterNotNicknamed
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3, #0x46]
	ldr r0, [r1]
	strb r2, [r0]
	bl IncrementNbEvolutions
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	bl SetPokemonJoined
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl sub_02056410
	cmp r0, #0
	beq _0238AB84
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl sub_020564B0
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0x8c]
	bl SetTeamSetupHeroOnly
	cmp r0, #0
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #2
	ldr r0, [r0]
	moveq r1, #1
	str r1, [r0, #0x88]
	b _0238AB9C
_0238AB84:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x8c]
	ldr r0, [r0]
	str r2, [r0, #0x88]
_0238AB9C:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r0, r2, #0x44
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	bl sub_0205A288
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl ov16_0238CC64
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrb r0, [r0, #0x8c]
	cmp r0, #0
	beq _0238ABF4
	bl sub_02056880
	bl GetActiveTeamMember
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	ldrsh r1, [r1, #0x44]
	strh r1, [r0, #8]
_0238ABF4:
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, _0238B114 ; =EVOLUTION_HP_BONUS
	ldr r3, [r1]
	ldrsh r2, [r0]
	ldr r4, [r3, #0x3c]
	ldr r0, _0238B118 ; =0x000003E7
	ldrsh r3, [r4, #0xa]
	add r2, r3, r2
	strh r2, [r4, #0xa]
	ldr r1, [r1]
	ldr r3, _0238B11C ; =EVOLUTION_PHYSICAL_STAT_BONUSES
	ldr r2, [r1, #0x3c]
	ldrsh r1, [r2, #0xa]
	cmp r1, r0
	strgth r0, [r2, #0xa]
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, _0238B120 ; =EVOLUTION_SPECIAL_STAT_BONUSES
	ldr r1, [r1]
	ldrsh r5, [r0]
	ldr r1, [r1, #0x3c]
	ldrsh r2, [r0, #2]
	ldrb ip, [r1, #0xc]
	ldrb r4, [r1, #0xd]
	ldrb lr, [r1, #0xf]
	add r0, ip, r5
	add r2, r4, r2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldrsh ip, [r3, #2]
	cmp r0, #0xff
	ldrb r5, [r1, #0xe]
	ldrsh r4, [r3]
	movgt r0, #0xff
	strb r0, [r1, #0xc]
	add r3, r5, r4
	mov r2, r2, lsl #0x10
	mov r4, r2, asr #0x10
	ldr r2, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	cmp r4, #0xff
	ldr r1, [r2]
	mov r3, r3, lsl #0x10
	add ip, lr, ip
	mov ip, ip, lsl #0x10
	ldr r1, [r1, #0x3c]
	movgt r4, #0xff
	strb r4, [r1, #0xd]
	ldr r1, [r2]
	mov r3, r3, asr #0x10
	cmp r3, #0xff
	ldr r1, [r1, #0x3c]
	movgt r3, #0xff
	strb r3, [r1, #0xe]
	ldr r1, [r2]
	mov r5, ip, asr #0x10
	cmp r5, #0xff
	ldr r1, [r1, #0x3c]
	movgt r5, #0xff
	strb r5, [r1, #0xf]
	mov r0, #0
	ldr r1, [r2]
	strh r0, [sp, #0xa]
	ldr r0, [r1, #0x40]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x1c]
	strh r0, [sp, #0xc]
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0238AD2C
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0238AD20
	bl sub_020582E0
_0238AD20:
	mov r0, r4
	bl RemoveItemNoHole
	b _0238AD40
_0238AD2C:
	ldrsh r0, [sp, #0xc]
	cmp r0, #0
	beq _0238AD40
	add r0, sp, #8
	bl RemoveItemInStorage
_0238AD40:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x2c]
	strh r0, [sp, #0xc]
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0238AD8C
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0238AD80
	bl sub_020582E0
_0238AD80:
	mov r0, r4
	bl RemoveItemNoHole
	b _0238ADA0
_0238AD8C:
	ldrsh r0, [sp, #0xc]
	cmp r0, #0
	beq _0238ADA0
	add r0, sp, #8
	bl RemoveItemInStorage
_0238ADA0:
	ldr r0, _0238B124 ; =0x00003F01
	bl sub_02017CB4
	mov r0, #8
	bl sub_02017C50
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldrb r0, [r1, #0x46]
	cmp r0, #0
	moveq r0, #4
	streq r0, [r1, #0x74]
	beq _0238AE1C
	ldr r1, [r1, #0x3c]
	add r0, sp, #0xe
	ldrsh r1, [r1, #4]
	bl GetNameRaw
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	ldrsh r0, [r0, #4]
	bl GetNameString
	ldr r2, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	ldr r0, [r0, #0x3c]
	add r0, r0, #0x3a
	bl StrncpyName
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0, #0x74]
_0238AE1C:
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B128 ; =0x0000043F
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238AE3C:
	ldrsb r0, [r0, #0xc1]
	bl CloseDialogueBox
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc1]
	bl GetMainCharacter1MemberIdx
	bl sub_0203C7E4
	mov r0, #5
	mov r1, #0
	bl sub_02039C3C
	b _0238B0C4
_0238AE6C:
	bl sub_0203A638
	b _0238B0C4
_0238AE74:
	mov r1, #5
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B12C ; =0x0000042D
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238AEA0:
	mov r2, #0xb
	str r2, [r0, #0x74]
	ldr r0, [r1]
	mov r1, #0x29
	str r1, [r0, #0x70]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B130 ; =0x00000433
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238B0C4
_0238AED8:
	bl ov11_02310BDC
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238B134 ; =0x00000447
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0xc2]
	cmp r1, r0
	bne _0238B0C4
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r1]
	strb r0, [r2, #0xc2]
	ldr r2, [r1]
	ldr r1, [r2, #0x40]
	add r0, r2, #0xc8
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0xc8
	bl SetPortraitLayout
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xc8
	bl SetPortraitEmotion
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldrsb r0, [r1, #0xc2]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	b _0238B0C4
_0238AF98:
	ldrsb r0, [r0, #0xc1]
	bl CloseDialogueBox
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0xc1]
	ldr r3, [r1]
	mov r2, #0
	ldr r1, [r3, #0x3c]
	add r3, r3, #0xb1
	add r1, r1, #0x3a
	bl ShowKeyboard
	b _0238B0C4
_0238AFD0:
	ldr r1, [r0, #0x3c]
	add r3, r0, #0xb1
	add r1, r1, #0x3a
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	b _0238B0C4
_0238AFEC:
	add r0, r0, #0x8d
	bl sub_0203909C
	b _0238B0C4
_0238AFF8:
	mov r2, #0x22
	str r2, [r0, #0x74]
	ldr r2, [r1]
	mov ip, #4
	ldr r0, _0238B0D8 ; =EVO_WINDOW_PARAMS_6
	ldr r1, _0238B0DC ; =0x00300011
	ldr r3, _0238B0EC ; =EVO_MENU_ITEMS_CONFIRM
	str ip, [r2, #0x78]
	mov ip, #2
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238B0C4
_0238B038:
	mov ip, #0
	mov r3, ip
_0238B040:
	ldr r2, [r1]
	add r0, r2, r3, lsl #1
	ldrsh r0, [r0, #0xc]
	cmp r0, #0
	addne r0, r2, ip, lsl #2
	strne r3, [r0, #0x50]
	add r3, r3, #1
	addne ip, ip, #1
	cmp r3, #8
	blt _0238B040
	cmp ip, #2
	bge _0238B088
	ldr r0, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238B0C4
_0238B088:
	ldr r1, _0238B138 ; =0x00000446
	mov r0, #0xf
	strh r1, [sp, #0x98]
	str r0, [sp, #0x9c]
	str ip, [sp]
	mov ip, #4
	ldr r0, _0238B13C ; =EVO_WINDOW_PARAMS_4
	ldr r1, _0238B140 ; =0x00009813
	ldr r3, _0238B144 ; =ov16_0238CB30
	add r2, sp, #0x90
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0238B0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
_0238B0C4:
	add sp, sp, #0x128
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV16_0238A140_OFFSET 0x2EA0
#else
#define OV16_0238A140_OFFSET 0
#endif
_0238B0CC: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
_0238B0D0: .word 0x00000431 + OV16_0238A140_OFFSET
_0238B0D4: .word 0x00000432 + OV16_0238A140_OFFSET
#ifdef JAPAN
_0238C638: .word 0x000032E1
#endif
_0238B0D8: .word EVO_WINDOW_PARAMS_6
_0238B0DC: .word 0x00300011
_0238B0E0: .word EVO_MAIN_MENU_ITEMS
_0238B0E4: .word 0x00000442 + OV16_0238A140_OFFSET
_0238B0E8: .word 0x00000449 + OV16_0238A140_OFFSET
#ifdef JAPAN
_0238C650: .word 0x000032E0
_0238C654: .word 0x000032D8
#endif
_0238B0EC: .word EVO_MENU_ITEMS_CONFIRM
_0238B0F0: .word 0x00300013
_0238B0F4: .word 0x00000434 + OV16_0238A140_OFFSET
_0238B0F8: .word EVO_WINDOW_PARAMS_5
_0238B0FC: .word EVO_SUBMENU_ITEMS
_0238B100: .word 0x00000125
_0238B104: .word 0x0000043E + OV16_0238A140_OFFSET
_0238B108: .word 0x0000043A + OV16_0238A140_OFFSET
_0238B10C: .word 0x0000043C + OV16_0238A140_OFFSET
_0238B110: .word 0x0000140F
#ifdef JAPAN
_0238C680: .word 0x000032DD
#endif
_0238B114: .word EVOLUTION_HP_BONUS
_0238B118: .word 0x000003E7
_0238B11C: .word EVOLUTION_PHYSICAL_STAT_BONUSES
_0238B120: .word EVOLUTION_SPECIAL_STAT_BONUSES
_0238B124: .word 0x00003F01
_0238B128: .word 0x0000043F + OV16_0238A140_OFFSET
_0238B12C: .word 0x0000042D + OV16_0238A140_OFFSET
_0238B130: .word 0x00000433 + OV16_0238A140_OFFSET
_0238B134: .word 0x00000447 + OV16_0238A140_OFFSET
_0238B138: .word 0x00000446 + OV16_0238A140_OFFSET
_0238B13C: .word EVO_WINDOW_PARAMS_4
_0238B140: .word 0x00009813
_0238B144: .word ov16_0238CB30
	arm_func_end ov16_0238A140

	arm_func_start ov16_0238B148
ov16_0238B148: ; 0x0238B148
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x128
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r1]
	ldr r2, [r0, #0x70]
	cmp r2, #0x2c
	addls pc, pc, r2, lsl #2
	b _0238C0C4
_0238B168: ; jump table
	b _0238B21C ; case 0
	b _0238B274 ; case 1
	b _0238B2D8 ; case 2
	b _0238B344 ; case 3
	b _0238B370 ; case 4
	b _0238C0C4 ; case 5
	b _0238B318 ; case 6
	b _0238B928 ; case 7
	b _0238B95C ; case 8
	b _0238B9C4 ; case 9
	b _0238BEA0 ; case 10
	b _0238BE3C ; case 11
	b _0238BE6C ; case 12
	b _0238B640 ; case 13
	b _0238B614 ; case 14
	b _0238BE74 ; case 15
	b _0238B574 ; case 16
	b _0238B5D8 ; case 17
	b _0238B480 ; case 18
	b _0238B50C ; case 19
	b _0238B440 ; case 20
	b _0238C0C4 ; case 21
	b _0238B730 ; case 22
	b _0238B850 ; case 23
	b _0238C0C4 ; case 24
	b _0238C0C4 ; case 25
	b _0238B668 ; case 26
	b _0238B6F4 ; case 27
	b _0238B9F4 ; case 28
	b _0238BA58 ; case 29
	b _0238BA94 ; case 30
	b _0238BAD8 ; case 31
	b _0238BFF8 ; case 32
	b _0238BED8 ; case 33
	b _0238BF98 ; case 34
	b _0238BFD0 ; case 35
	b _0238C0C4 ; case 36
	b _0238BFEC ; case 37
	b _0238C0C4 ; case 38
	b _0238C038 ; case 39
	b _0238C0C4 ; case 40
	b _0238C0C4 ; case 41
	b _0238C0C4 ; case 42
	b _0238C0C4 ; case 43
	b _0238B424 ; case 44
_0238B21C:
	bl ov16_0238CBD0
	cmp r0, #0
	bne _0238B240
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B240:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C0D0 ; =0x00000431
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B274:
	bl ov16_0238CBD0
	cmp r0, #0
	bne _0238B298
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B298:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #6
	ldr r1, [r0]
	ldr r2, _0238C0D4 ; =0x00000432
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B2D8:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #1
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _0238D648 ; =0x000032E1
#else
	add r2, r3, #0x440
#endif
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B318:
	ldr r0, _0238C0D8 ; =EVO_WINDOW_PARAMS_6
	mov r4, #3
	ldr r1, _0238C0DC ; =0x00300011
	ldr r3, _0238C0E0 ; =EVO_MAIN_MENU_ITEMS
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238B344:
	mov r1, #1
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C0E4 ; =0x00000442
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B370:
	mov r1, #5
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x88]
	cmp r0, #0
	ble _0238B394
	bl sub_020572EC
_0238B394:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldr r1, [r2, #0x88]
	cmp r1, #1
	ble _0238B3DC
	mov r1, #4
	str r1, [r2, #0x74]
	ldr r1, [r0]
	ldr r2, _0238C0E8 ; =0x00000449
	ldrsb r0, [r1, #0xc1]
	add r3, r1, #0xe8
	mov r1, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x88]
	b _0238C0C4
_0238B3DC:
	bl ov16_0238CBD0
	cmp r0, #0
	mov r1, #0x18
	bne _0238B408
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef JAPAN
	ldr r2, _0238D660 ; =0x000032E0
#else
	mov r2, #0x440
#endif
	ldr r3, [r0]
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B408:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef JAPAN
	rsb r2, r1, #0x3300
#else
	add r2, r1, #0x430
#endif
	ldr r3, [r0]
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B424:
	mov r2, #5
	str r2, [r0, #0xd8]
	ldr r0, [r1]
	mov r1, #1
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B440:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0x27
	ldr r1, [r0]
#ifdef JAPAN
	rsb r2, r3, #0x3300
#else
	rsb r2, r3, #0x460
#endif
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B480:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, [r0, #0x3c]
	add r0, r0, #0x138
	add r1, r1, #0x3a
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	add r1, r2, #0x138
	str r1, [r2, #0x120]
	ldr r2, [r0]
	ldr r1, [r2, #0x3c]
	ldrsh r1, [r1, #4]
	str r1, [r2, #0xe8]
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	str r1, [r2, #0xec]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef JAPAN
	mov r3, #0x13
	ldr r2, [r0]
	mov r1, #8
	str r3, [r2, #0x74]
	ldr r3, [r0]
	ldr r2, _0238D664 ; =0x000032D8
#else
	mov r1, #8
	mov r4, #0x13
	ldr r3, [r0]
	add r2, r1, #0x430
	str r4, [r3, #0x74]
	ldr r3, [r0]
#endif
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B50C:
	ldr r2, [r0, #0x40]
	mov r1, #0
	add r0, r0, r2, lsl #1
	ldrsh r0, [r0, #0xc]
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrne r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #0x1a
	ldreq r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	moveq r1, #0x1c
	ldr r0, [r0]
	mov r4, #2
	str r1, [r0, #0x74]
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r3, _0238C0EC ; =EVO_MENU_ITEMS_CONFIRM
	ldr r1, [r0]
	ldr r0, _0238C0D8 ; =EVO_WINDOW_PARAMS_6
	str r4, [r1, #0x78]
	ldr r1, _0238C0F0 ; =0x00300013
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238B574:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldrsh r1, [r2, #0x44]
	orr r1, r1, #0x20000
	str r1, [r2, #0xe8]
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	str r1, [r2, #0xec]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0x11
	ldr r1, [r0]
	ldr r2, _0238C0F4 ; =0x00000434
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B5D8:
	mov r2, #0x1c
	str r2, [r0, #0x74]
	ldr r0, [r1]
	mov r4, #2
	str r4, [r0, #0x78]
	ldr r0, _0238C0D8 ; =EVO_WINDOW_PARAMS_6
	ldr r1, _0238C0F0 ; =0x00300013
	ldr r3, _0238C0EC ; =EVO_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238B614:
	ldr r0, _0238C0F8 ; =EVO_WINDOW_PARAMS_5
	mov r4, #3
	ldr r3, _0238C0FC ; =EVO_SUBMENU_ITEMS
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238B640:
	ldr r1, [r0, #0x3c]
	add r0, sp, #0xb0
	bl sub_0205B008
	add r0, sp, #0xb0
	mov r1, #3
	bl sub_0203F150
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc4]
	b _0238C0C4
_0238B668:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, [r0, #0x3c]
	add r0, r0, #0x138
	add r1, r1, #0x3a
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	add r1, r2, #0x138
	str r1, [r2, #0x120]
	ldr r2, [r0]
	ldr r1, [r2, #0x3c]
	ldrsh r1, [r1, #4]
	str r1, [r2, #0xe8]
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	str r1, [r2, #0xec]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r4, #0x1b
	ldr r2, [r0]
	mov r1, #8
	str r4, [r2, #0x74]
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r4, #0x32c0
#else
	add r2, r4, #0x420
#endif
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B6F4:
	mov r2, #0x1c
	str r2, [r0, #0x74]
	ldr r0, [r1]
	mov r4, #2
	str r4, [r0, #0x78]
	ldr r0, _0238C0D8 ; =EVO_WINDOW_PARAMS_6
	ldr r1, _0238C0F0 ; =0x00300013
	ldr r3, _0238C0EC ; =EVO_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238B730:
	mov r2, #0
	str r2, [r0, #0x40]
	ldr r3, [r1]
	ldr r0, _0238C100 ; =0x00000125
	ldr r1, [r3, #0x3c]
	ldrsh r1, [r1, #4]
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	moveq r0, #0
	beq _0238B7DC
	mov r1, r2
_0238B760:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #0xc]
	add r1, r1, #1
	cmp r0, #0
	addne r2, r2, #1
	cmp r1, #8
	blt _0238B760
	cmp r2, #1
	bne _0238B7D8
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0
_0238B78C:
	ldr r2, [r0]
	add r1, r2, r3, lsl #1
	ldrsh r1, [r1, #0xc]
	cmp r1, #0
	beq _0238B7C4
	strh r1, [r2, #0xc]
	ldr r2, [r0]
	add r1, r2, r3, lsl #1
	ldrsh r1, [r1, #0x1c]
	strh r1, [r2, #0x1c]
	ldr r2, [r0]
	add r1, r2, r3, lsl #1
	ldrsh r1, [r1, #0x2c]
	strh r1, [r2, #0x2c]
_0238B7C4:
	add r3, r3, #1
	cmp r3, #8
	blt _0238B78C
	mov r0, #1
	b _0238B7DC
_0238B7D8:
	mov r0, #2
_0238B7DC:
	cmp r0, #0
	beq _0238B7F0
	cmp r0, #1
	beq _0238B820
	b _0238B838
_0238B7F0:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldrsh r0, [r1, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [r1, #0x40]
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B820:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B838:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B850:
	ldrsh r2, [r0, #0x44]
	orr r2, r2, #0x20000
	str r2, [r0, #0xe8]
	ldr r2, [r1]
	ldr r0, [r2, #0x40]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	str r0, [r2, #0xec]
	ldr r2, [r1]
	ldr r0, [r2, #0x40]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x1c]
	str r0, [r2, #0xf8]
	ldr r2, [r1]
	ldr r0, [r2, #0x40]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x2c]
	str r0, [r2, #0xfc]
	ldr r1, [r1]
	ldr r0, [r1, #0xf8]
	cmp r0, #0
	ldreq r0, [r1, #0xfc]
	streq r0, [r1, #0xf8]
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r3, [r0]
	ldr r2, [r3, #0x40]
	add r0, r3, r2, lsl #1
	ldrsh r0, [r0, #0x1c]
	cmp r0, #0
	add r0, r3, r2, lsl #1
	ldrsh r0, [r0, #0x2c]
	addne r1, r1, #1
	cmp r0, #0
	addne r1, r1, #1
	cmp r1, #0
	beq _0238B8F8
	cmp r1, #1
	beq _0238B908
	cmp r1, #2
	beq _0238B918
	b _0238C0C4
_0238B8F8:
	mov r0, #0x12
	str r0, [r3, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B908:
	mov r0, #7
	str r0, [r3, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B918:
	mov r0, #9
	str r0, [r3, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238B928:
	bl ov16_0238CAE8
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #8
	ldr r1, [r0]
	ldr r2, _0238C104 ; =0x0000043E
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B95C:
	ldr r2, [r0, #0x40]
	mov r1, #0
	add r0, r0, r2, lsl #1
	ldrsh r0, [r0, #0xc]
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrne r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #0x1a
	ldreq r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	moveq r1, #0x1c
	ldr r0, [r0]
	mov r4, #2
	str r1, [r0, #0x74]
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r3, _0238C0EC ; =EVO_MENU_ITEMS_CONFIRM
	ldr r1, [r0]
	ldr r0, _0238C0D8 ; =EVO_WINDOW_PARAMS_6
	str r4, [r1, #0x78]
	ldr r1, _0238C0F0 ; =0x00300013
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238B9C4:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #8
	ldr r1, [r0]
	ldr r2, _0238C108 ; =0x0000043A
	str r3, [r1, #0x74]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238B9F4:
	ldrsb r0, [r0, #0xc1]
	bl sub_0202F2C4
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0x14
	ldr r1, [r0]
	mov r2, #3
	str r3, [r1, #0xe4]
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0xd8]
	ldr r4, [r0]
	mov r1, #0x1d
	ldr r2, [r4, #0x3c]
	ldrsh r2, [r2, #4]
	strh r2, [r4, #0xdc]
	ldr r4, [r0]
	ldr r2, [r4, #0x40]
	add r2, r4, r2, lsl #1
	ldrsh r2, [r2, #0xc]
	strh r2, [r4, #0xde]
	ldr r2, [r0]
	str r3, [r2, #0xe0]
	ldr r0, [r0]
	str r1, [r0, #0x74]
	b _0238C0C4
_0238BA58:
	ldrsh r3, [r0, #0x44]
	mov r2, #0x1e
	orr r3, r3, #0x20000
	str r3, [r0, #0xe8]
	ldr r0, [r1]
	str r2, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C10C ; =0x0000043C
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238BA94:
	mov r1, #0x1f
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #3
	ldr r1, [r0]
	ldr r3, _0238C110 ; =0x0000140F
	str r2, [r1, #0xe0]
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _0238D690 ; =0x000032DD
#else
	rsb r2, r2, #0x440
#endif
	str r3, [r1, #0x10c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238BAD8:
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldr r1, [r2, #0x3c]
	ldrsh r1, [r1, #4]
	str r1, [r2, #0xe8]
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl IsMonsterNotNicknamed
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3, #0x46]
	ldr r0, [r1]
	strb r2, [r0]
	bl IncrementNbEvolutions
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	bl SetPokemonJoined
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl sub_02056410
	cmp r0, #0
	beq _0238BB84
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl sub_020564B0
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0x8c]
	bl SetTeamSetupHeroOnly
	cmp r0, #0
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #2
	ldr r0, [r0]
	moveq r1, #1
	str r1, [r0, #0x88]
	b _0238BB9C
_0238BB84:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x8c]
	ldr r0, [r0]
	str r2, [r0, #0x88]
_0238BB9C:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	ldr r1, [r2, #0x40]
	add r0, r2, #0x44
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	bl sub_0205A288
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl ov16_0238CC64
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrb r0, [r0, #0x8c]
	cmp r0, #0
	beq _0238BBF4
	bl sub_02056880
	bl GetActiveTeamMember
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	ldrsh r1, [r1, #0x44]
	strh r1, [r0, #8]
_0238BBF4:
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, _0238C114 ; =EVOLUTION_HP_BONUS
	ldr r3, [r1]
	ldrsh r2, [r0]
	ldr r4, [r3, #0x3c]
	ldr r0, _0238C118 ; =0x000003E7
	ldrsh r3, [r4, #0xa]
	add r2, r3, r2
	strh r2, [r4, #0xa]
	ldr r1, [r1]
	ldr r3, _0238C11C ; =EVOLUTION_PHYSICAL_STAT_BONUSES
	ldr r2, [r1, #0x3c]
	ldrsh r1, [r2, #0xa]
	cmp r1, r0
	strgth r0, [r2, #0xa]
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, _0238C120 ; =EVOLUTION_SPECIAL_STAT_BONUSES
	ldr r1, [r1]
	ldrsh r5, [r0]
	ldr r1, [r1, #0x3c]
	ldrsh r2, [r0, #2]
	ldrb ip, [r1, #0xc]
	ldrb r4, [r1, #0xd]
	ldrb lr, [r1, #0xf]
	add r0, ip, r5
	add r2, r4, r2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldrsh ip, [r3, #2]
	cmp r0, #0xff
	ldrb r5, [r1, #0xe]
	ldrsh r4, [r3]
	movgt r0, #0xff
	strb r0, [r1, #0xc]
	add r3, r5, r4
	mov r2, r2, lsl #0x10
	mov r4, r2, asr #0x10
	ldr r2, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	cmp r4, #0xff
	ldr r1, [r2]
	mov r3, r3, lsl #0x10
	add ip, lr, ip
	mov ip, ip, lsl #0x10
	ldr r1, [r1, #0x3c]
	movgt r4, #0xff
	strb r4, [r1, #0xd]
	ldr r1, [r2]
	mov r3, r3, asr #0x10
	cmp r3, #0xff
	ldr r1, [r1, #0x3c]
	movgt r3, #0xff
	strb r3, [r1, #0xe]
	ldr r1, [r2]
	mov r5, ip, asr #0x10
	cmp r5, #0xff
	ldr r1, [r1, #0x3c]
	movgt r5, #0xff
	strb r5, [r1, #0xf]
	mov r0, #0
	ldr r1, [r2]
	strh r0, [sp, #0xa]
	ldr r0, [r1, #0x40]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x1c]
	strh r0, [sp, #0xc]
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0238BD2C
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0238BD20
	bl sub_020582E0
_0238BD20:
	mov r0, r4
	bl RemoveItemNoHole
	b _0238BD40
_0238BD2C:
	ldrsh r0, [sp, #0xc]
	cmp r0, #0
	beq _0238BD40
	add r0, sp, #8
	bl RemoveItemInStorage
_0238BD40:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x2c]
	strh r0, [sp, #0xc]
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _0238BD8C
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0238BD80
	bl sub_020582E0
_0238BD80:
	mov r0, r4
	bl RemoveItemNoHole
	b _0238BDA0
_0238BD8C:
	ldrsh r0, [sp, #0xc]
	cmp r0, #0
	beq _0238BDA0
	add r0, sp, #8
	bl RemoveItemInStorage
_0238BDA0:
	ldr r0, _0238C124 ; =0x00003F01
	bl sub_02017CB4
	mov r0, #8
	bl sub_02017C50
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldrb r0, [r1, #0x46]
	cmp r0, #0
	moveq r0, #4
	streq r0, [r1, #0x74]
	beq _0238BE1C
	ldr r1, [r1, #0x3c]
	add r0, sp, #0xe
	ldrsh r1, [r1, #4]
	bl GetNameRaw
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	ldrsh r0, [r0, #4]
	bl GetNameString
	ldr r2, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	ldr r0, [r0, #0x3c]
	add r0, r0, #0x3a
	bl StrncpyName
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0, #0x74]
_0238BE1C:
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C128 ; =0x0000043F
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238BE3C:
	ldrsb r0, [r0, #0xc1]
	bl CloseDialogueBox
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc1]
	bl GetMainCharacter1MemberIdx
	bl sub_0203C7E4
	mov r0, #5
	mov r1, #0
	bl sub_02039C3C
	b _0238C0C4
_0238BE6C:
	bl sub_0203A638
	b _0238C0C4
_0238BE74:
	mov r1, #5
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C12C ; =0x0000042D
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238BEA0:
	mov r2, #0xb
	str r2, [r0, #0x74]
	ldr r0, [r1]
	mov r1, #0x29
	str r1, [r0, #0x70]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C130 ; =0x00000433
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	b _0238C0C4
_0238BED8:
	bl ov11_02310BDC
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0, #0x74]
	bl ov16_0238CB98
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, _0238C134 ; =0x00000447
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0xc1]
	add r3, r3, #0xe8
	bl ShowStringIdInDialogueBox
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0xc2]
	cmp r1, r0
	bne _0238C0C4
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r1]
	strb r0, [r2, #0xc2]
	ldr r2, [r1]
	ldr r1, [r2, #0x40]
	add r0, r2, #0xc8
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0xc8
	bl SetPortraitLayout
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xc8
	bl SetPortraitEmotion
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldrsb r0, [r1, #0xc2]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	b _0238C0C4
_0238BF98:
	ldrsb r0, [r0, #0xc1]
	bl CloseDialogueBox
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0xc1]
	ldr r3, [r1]
	mov r2, #0
	ldr r1, [r3, #0x3c]
	add r3, r3, #0xb1
	add r1, r1, #0x3a
	bl ShowKeyboard
	b _0238C0C4
_0238BFD0:
	ldr r1, [r0, #0x3c]
	add r3, r0, #0xb1
	add r1, r1, #0x3a
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	b _0238C0C4
_0238BFEC:
	add r0, r0, #0x8d
	bl sub_0203909C
	b _0238C0C4
_0238BFF8:
	mov r2, #0x22
	str r2, [r0, #0x74]
	ldr r2, [r1]
	mov ip, #4
	ldr r0, _0238C0D8 ; =EVO_WINDOW_PARAMS_6
	ldr r1, _0238C0DC ; =0x00300011
	ldr r3, _0238C0EC ; =EVO_MENU_ITEMS_CONFIRM
	str ip, [r2, #0x78]
	mov ip, #2
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
	b _0238C0C4
_0238C038:
	mov ip, #0
	mov r3, ip
_0238C040:
	ldr r2, [r1]
	add r0, r2, r3, lsl #1
	ldrsh r0, [r0, #0xc]
	cmp r0, #0
	addne r0, r2, ip, lsl #2
	strne r3, [r0, #0x50]
	add r3, r3, #1
	addne ip, ip, #1
	cmp r3, #8
	blt _0238C040
	cmp ip, #2
	bge _0238C088
	ldr r0, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl ov16_0238B148
	b _0238C0C4
_0238C088:
	ldr r1, _0238C138 ; =0x00000446
	mov r0, #0xf
	strh r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str ip, [sp]
	mov ip, #4
	ldr r0, _0238C13C ; =EVO_WINDOW_PARAMS_4
	ldr r1, _0238C140 ; =0x00009813
	ldr r3, _0238C144 ; =ov16_0238CB30
	add r2, sp, #0x18
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0238C0CC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc3]
_0238C0C4:
	add sp, sp, #0x128
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV16_0238B148_OFFSET 0x2EA0
#else
#define OV16_0238B148_OFFSET 0
#endif
_0238C0CC: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
_0238C0D0: .word 0x00000431 + OV16_0238B148_OFFSET
_0238C0D4: .word 0x00000432 + OV16_0238B148_OFFSET
#ifdef JAPAN
_0238D648: .word 0x000032E1
#endif
_0238C0D8: .word EVO_WINDOW_PARAMS_6
_0238C0DC: .word 0x00300011
_0238C0E0: .word EVO_MAIN_MENU_ITEMS
_0238C0E4: .word 0x00000442 + OV16_0238B148_OFFSET
_0238C0E8: .word 0x00000449 + OV16_0238B148_OFFSET
#ifdef JAPAN
_0238D660: .word 0x000032E0
_0238D664: .word 0x000032D8
#endif
_0238C0EC: .word EVO_MENU_ITEMS_CONFIRM
_0238C0F0: .word 0x00300013
_0238C0F4: .word 0x00000434 + OV16_0238B148_OFFSET
_0238C0F8: .word EVO_WINDOW_PARAMS_5
_0238C0FC: .word EVO_SUBMENU_ITEMS
_0238C100: .word 0x00000125
_0238C104: .word 0x0000043E + OV16_0238B148_OFFSET
_0238C108: .word 0x0000043A + OV16_0238B148_OFFSET
_0238C10C: .word 0x0000043C + OV16_0238B148_OFFSET
_0238C110: .word 0x0000140F
#ifdef JAPAN
_0238D690: .word 0x000032DD
#endif
_0238C114: .word EVOLUTION_HP_BONUS
_0238C118: .word 0x000003E7
_0238C11C: .word EVOLUTION_PHYSICAL_STAT_BONUSES
_0238C120: .word EVOLUTION_SPECIAL_STAT_BONUSES
_0238C124: .word 0x00003F01
_0238C128: .word 0x0000043F + OV16_0238B148_OFFSET
_0238C12C: .word 0x0000042D + OV16_0238B148_OFFSET
_0238C130: .word 0x00000433 + OV16_0238B148_OFFSET
_0238C134: .word 0x00000447 + OV16_0238B148_OFFSET
_0238C138: .word 0x00000446 + OV16_0238B148_OFFSET
_0238C13C: .word EVO_WINDOW_PARAMS_4
_0238C140: .word 0x00009813
_0238C144: .word ov16_0238CB30
	arm_func_end ov16_0238B148

	arm_func_start ov16_0238C148
ov16_0238C148: ; 0x0238C148
	stmdb sp!, {r3, lr}
	ldr r0, _0238C1C8 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	cmp r0, #0
	bne _0238C170
	mov r0, #0x150
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238C1C8 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	str r0, [r1]
_0238C170:
	ldr r0, _0238C1C8 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl InitPreprocessorArgs
	ldr r1, _0238C1C8 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #2
	str r0, [r2, #0x134]
	ldr r2, [r1]
	str r0, [r2, #0xe8]
	ldr r2, [r1]
	str r0, [r2, #0xd8]
	ldr r2, [r1]
	strb r3, [r2, #0xc1]
	ldr r2, [r1]
	strb r3, [r2, #0xc2]
	ldr r1, [r1]
	strb r3, [r1, #0xc3]
	bl ov16_0238A140
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C1C8: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238C148

	arm_func_start ov16_0238C1CC
ov16_0238C1CC: ; 0x0238C1CC
	stmdb sp!, {r3, lr}
	ldr r0, _0238C1F4 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238C1F4 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C1F4: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238C1CC

	arm_func_start ov16_0238C1F8
ov16_0238C1F8: ; 0x0238C1F8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r3, [r0]
	ldr r1, [r3, #0xd8]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0238CAD0
_0238C218: ; jump table
	b _0238C238 ; case 0
	b _0238C250 ; case 1
	b _0238CA40 ; case 2
	b _0238CA5C ; case 3
	b _0238CA84 ; case 4
	b _0238CAAC ; case 5
	b _0238C9EC ; case 6
	b _0238CA30 ; case 7
_0238C238:
	bl ov11_022E6E68
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xd8]
	b _0238CAD0
_0238C250:
	ldr r1, [r3, #0x70]
	cmp r1, #0x29
	addls pc, pc, r1, lsl #2
	b _0238C96C
_0238C260: ; jump table
	b _0238C96C ; case 0
	b _0238C96C ; case 1
	b _0238C96C ; case 2
	b _0238C96C ; case 3
	b _0238C96C ; case 4
	b _0238C874 ; case 5
	b _0238C308 ; case 6
	b _0238C96C ; case 7
	b _0238C690 ; case 8
	b _0238C96C ; case 9
	b _0238C96C ; case 10
	b _0238C380 ; case 11
	b _0238C380 ; case 12
	b _0238C614 ; case 13
	b _0238C56C ; case 14
	b _0238C96C ; case 15
	b _0238C96C ; case 16
	b _0238C690 ; case 17
	b _0238C96C ; case 18
	b _0238C690 ; case 19
	b _0238C96C ; case 20
	b _0238C96C ; case 21
	b _0238C96C ; case 22
	b _0238C96C ; case 23
	b _0238C4A4 ; case 24
	b _0238C51C ; case 25
	b _0238C96C ; case 26
	b _0238C690 ; case 27
	b _0238C66C ; case 28
	b _0238C96C ; case 29
	b _0238C96C ; case 30
	b _0238C96C ; case 31
	b _0238C690 ; case 32
	b _0238C96C ; case 33
	b _0238C770 ; case 34
	b _0238C770 ; case 35
	b _0238C7D8 ; case 36
	b _0238C7F0 ; case 37
	b _0238C854 ; case 38
	b _0238C8BC ; case 39
	b _0238C96C ; case 40
	b _0238C87C ; case 41
_0238C308:
	ldrsb r0, [r3, #0xc3]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldrne r1, [r1]
	strne r0, [r1, #0x7c]
	cmp r0, #1
	beq _0238C370
	cmp r0, #2
	beq _0238C360
	cmp r0, #3
	bne _0238C9B0
	bl ov16_0238CAE8
	bl ov16_0238CBD0
	cmp r0, #0
	bne _0238C354
	mov r0, #0xf
	bl ov16_0238A140
	b _0238C9B0
_0238C354:
	mov r0, #0xa
	bl ov16_0238A140
	b _0238C9B0
_0238C360:
	bl ov16_0238CAE8
	mov r0, #3
	bl ov16_0238A140
	b _0238C9B0
_0238C370:
	bl ov16_0238CAE8
	mov r0, #4
	bl ov16_0238A140
	b _0238C9B0
_0238C380:
	bl sub_0203C9E4
	bl sub_0203A5A8
	cmp r0, #0
	beq _0238C408
	bl sub_0203A9EC
	cmp r0, #0
	beq _0238C9B0
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _0238C9B0
	bl sub_0203AAB0
	ldr r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r0, r0, lsl #0x10
	ldr r1, [r1]
	mov r0, r0, asr #0x10
	strh r0, [r1, #0x44]
	bl ov16_0238CC64
	ldr r0, _0238CAE0 ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	bl sub_0203A5F0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0xa
	ldr r1, [r0]
	mov r2, #0xd
	str r3, [r1, #0x78]
	ldr r1, [r0]
	mov r0, #0x19
	str r2, [r1, #0x74]
	bl ov16_0238A140
	b _0238C9B0
_0238C408:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _0238C448
	bl sub_0203A51C
	bl sub_0203C874
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0xa
	ldr r1, [r0]
	mov r2, #2
	str r3, [r1, #0x78]
	ldr r1, [r0]
	mov r0, #0x18
	str r2, [r1, #0x74]
	bl ov16_0238A140
	b _0238C9B0
_0238C448:
	ldr r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r0, r0, lsl #0x10
	ldr r1, [r1]
	mov r0, r0, asr #0x10
	strh r0, [r1, #0x44]
	bl ov16_0238CC64
	bl Rand16Bit
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	strb r1, [r2, #6]
	ldr r1, [r0]
	ldr r0, [r1, #0x3c]
	add r1, r1, #2
	bl GetEvolutionPossibilities
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0x44]
	bl ov16_0238CC64
	mov r0, #0xe
	bl ov16_0238A140
	b _0238C9B0
_0238C4A4:
	bl sub_0203C9E4
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x78]
	cmp r0, #5
	bne _0238C4C4
	bl sub_0203A51C
	bl sub_0203C874
_0238C4C4:
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x78]
	cmp r0, #0
	bne _0238C504
	bl sub_0203C8E0
	cmp r0, #0
	beq _0238C4F0
	ldr r0, _0238CAE4 ; =ov16_0238CE04
	bl Debug_Print0
	b _0238C9B0
_0238C4F0:
	bl sub_0203C940
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x74]
	bl ov16_0238A140
_0238C504:
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x78]
	sub r0, r0, #1
	str r0, [r1, #0x78]
	b _0238C9B0
_0238C51C:
	bl sub_0203C9E4
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x78]
	cmp r0, #5
	bne _0238C538
	bl sub_0203A618
_0238C538:
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x78]
	cmp r0, #0
	bne _0238C554
	ldr r0, [r1, #0x74]
	bl ov16_0238A140
_0238C554:
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r0]
	ldr r0, [r1, #0x78]
	sub r0, r0, #1
	str r0, [r1, #0x78]
	b _0238C9B0
_0238C56C:
	ldrsb r0, [r3, #0xc3]
	bl GetSimpleMenuResult
	mov r4, r0
	bl sub_0203C9E4
	cmp r4, #1
	beq _0238C5F8
	cmp r4, #3
	beq _0238C598
	cmp r4, #8
	beq _0238C5CC
	b _0238C9B0
_0238C598:
	bl ov16_0238CAE8
	bl sub_0203A51C
	bl sub_0203C874
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0xa
	ldr r1, [r0]
	mov r2, #0x16
	str r3, [r1, #0x78]
	ldr r1, [r0]
	mov r0, #0x18
	str r2, [r1, #0x74]
	bl ov16_0238A140
	b _0238C9B0
_0238C5CC:
	bl ov16_0238CAE8
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0xa
	ldr r1, [r0]
	mov r2, #0xd
	str r3, [r1, #0x78]
	ldr r1, [r0]
	mov r0, #0x19
	str r2, [r1, #0x74]
	bl ov16_0238A140
	b _0238C9B0
_0238C5F8:
	bl ov16_0238CAE8
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x70]
	bl sub_0203A638
	b _0238C9B0
_0238C614:
	bl sub_0203F398
	cmp r0, #1
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc4]
	bl sub_0202836C
	bl sub_0203F990
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #3
	strb r3, [r1, #0xc4]
	ldr r1, [r0]
	mov r3, #0xc
	str r2, [r1, #0xe4]
	ldr r2, [r0]
	mov r1, #0x1c
	str r3, [r2, #0x74]
	ldr r0, [r0]
	str r1, [r0, #0x70]
	b _0238C9B0
_0238C66C:
	ldr r2, [r3, #0xe4]
	sub r1, r2, #1
	str r1, [r3, #0xe4]
	cmp r2, #0
	bne _0238C9B0
	ldr r0, [r0]
	ldr r0, [r0, #0x74]
	bl ov16_0238A140
	b _0238C9B0
_0238C690:
	ldrsb r0, [r3, #0xc3]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc3]
	bl GetSimpleMenuResult
	ldr r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r4, r0
	ldr r0, [r1]
	mvn r1, #1
	ldrsb r0, [r0, #0xc2]
	cmp r0, r1
	beq _0238C6E0
	bl ClosePortraitBox
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc2]
_0238C6E0:
	cmp r4, #1
	beq _0238C730
	cmp r4, #6
	beq _0238C6FC
	cmp r4, #7
	beq _0238C730
	b _0238C9B0
_0238C6FC:
	bl ov16_0238CAE8
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl sub_0202F2C4
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x1c
	str r3, [r2, #0xe4]
	ldr r0, [r0]
	str r1, [r0, #0x70]
	b _0238C9B0
_0238C730:
	bl ov16_0238CAE8
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl sub_0202F2C4
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #0xa
	ldr r4, [r0]
	mov r1, #0x1c
	ldr r2, [r4, #0x78]
	str r2, [r4, #0x74]
	ldr r2, [r0]
	str r3, [r2, #0xe4]
	ldr r0, [r0]
	str r1, [r0, #0x70]
	b _0238C9B0
_0238C770:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0238C9B0
	bl GetKeyboardStringResult
	ldr r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x8d
	mov r2, #0x10
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0xa1
	bl StrcpySimple
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl IsMonsterNotNicknamed
	ldr r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0x46]
	mov r0, #0x24
	bl ov16_0238A140
	b _0238C9B0
_0238C7D8:
	bl sub_02037468
	cmp r0, #0
	beq _0238C9B0
	mov r0, #0x25
	bl ov16_0238A140
	b _0238C9B0
_0238C7F0:
	bl sub_0203931C
	cmp r0, #0
	bne _0238C830
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r3, #4
	ldr r1, [r0]
	mov r2, #0xa
	str r3, [r1, #0x78]
	ldr r1, [r0]
	ldr r0, [r1, #0x3c]
	add r1, r1, #0xa1
	add r0, r0, #0x3a
	bl StrncpySimple
	mov r0, #0x26
	bl ov16_0238A140
	b _0238C9B0
_0238C830:
	cmp r0, #1
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0x23
	ldr r1, [r0]
	mov r0, #0x26
	str r2, [r1, #0x78]
	bl ov16_0238A140
	b _0238C9B0
_0238C854:
	bl sub_02039218
	cmp r0, #0
	beq _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x78]
	bl ov16_0238A140
	b _0238C9B0
_0238C874:
	mov r0, #3
	b _0238C9B4
_0238C87C:
	ldrsb r0, [r3, #0xc1]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #0x2b
	ldr r1, [r0]
	str r2, [r1, #0x70]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl sub_0202F2C4
	b _0238C9B0
_0238C8BC:
	ldrsb r0, [r3, #0xc3]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc3]
	bl GetAdvancedMenuResult
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	bne _0238C918
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc3]
	bl CloseAdvancedMenu
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #2
	strb r2, [r1, #0xc3]
	bl ov16_0238A140
	b _0238C9B0
_0238C918:
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r2, [r0]
	add r1, r2, r4, lsl #2
	ldr r1, [r1, #0x50]
	str r1, [r2, #0x40]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc3]
	bl CloseAdvancedMenu
	ldr r1, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #0x17
	strb r3, [r2, #0xc3]
	ldr r2, [r1]
	add r1, r2, r4, lsl #2
	ldr r1, [r1, #0x50]
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	strh r1, [r2, #0xa]
	bl ov16_0238A140
	b _0238C9B0
_0238C96C:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238C9B0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl ShowDialogueBox
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldr r0, [r0, #0x74]
	bl ov16_0238A140
_0238C9B0:
	mov r0, #0
_0238C9B4:
	cmp r0, #3
	bne _0238CAD0
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r2, #6
	ldr r1, [r0]
	str r2, [r1, #0xd8]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl sub_0202836C
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl sub_0202F2C4
	b _0238CAD0
_0238C9EC:
	mov r1, #7
	str r1, [r3, #0xd8]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc1]
	bl CloseDialogueBox
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc2]
	cmp r0, r1
	beq _0238CAD0
	bl ClosePortraitBox
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc2]
	b _0238CAD0
_0238CA30:
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	b _0238CAD4
_0238CA40:
	bl ov11_022E6EC8
	cmp r0, #0
	ldrne r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	movne r1, #1
	ldrne r0, [r0]
	strne r1, [r0, #0xd8]
	b _0238CAD0
_0238CA5C:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238CAD0
	mov r0, #3
	bl ov11_022E6E8C
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xd8]
	b _0238CAD0
_0238CA84:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238CAD0
	mov r0, #1
	bl ov11_022E6E8C
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xd8]
	b _0238CAD0
_0238CAAC:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238CAD0
	mov r0, #4
	bl ov11_022E6E8C
	ldr r0, _0238CADC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xd8]
_0238CAD0:
	mov r0, #1
_0238CAD4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238CADC: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
_0238CAE0: .word 0x00003F02
_0238CAE4: .word ov16_0238CE04
	arm_func_end ov16_0238C1F8

	arm_func_start ov16_0238CAE8
ov16_0238CAE8: ; 0x0238CAE8
	stmdb sp!, {r3, lr}
	ldr r0, _0238CB2C ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc3]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0238CB2C ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc3]
	bl CloseSimpleMenu
	ldr r0, _0238CB2C ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc3]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CB2C: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CAE8

	arm_func_start ov16_0238CB30
ov16_0238CB30: ; 0x0238CB30
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	ldr r2, _0238CB8C ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r3, _0238CB90 ; =0x0000C402
	ldr r6, [r2]
	ldr r2, _0238CB94 ; =ov16_0238CE28
	add r5, r6, r1, lsl #2
	ldr r1, [r5, #0x50]
	add ip, sp, #4
	add r1, r6, r1, lsl #1
	ldrsh lr, [r1, #0xc]
	mov r1, #0x400
	mov r4, r0
	str lr, [sp, #4]
	ldr lr, [r5, #0x50]
	add lr, r6, lr, lsl #1
	ldrsh lr, [lr, #0xc]
	str lr, [sp, #0x28]
	str ip, [sp]
	bl PreprocessString
	mov r0, r4
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0238CB8C: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
_0238CB90: .word 0x0000C402
_0238CB94: .word ov16_0238CE28
	arm_func_end ov16_0238CB30

	arm_func_start ov16_0238CB98
ov16_0238CB98: ; 0x0238CB98
	stmdb sp!, {r3, lr}
	ldr r1, _0238CBCC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0xc1]
	cmp r1, r0
	ldmneia sp!,  {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _0238CBCC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r1, [r1]
	strb r0, [r1, #0xc1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CBCC: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CB98

	arm_func_start ov16_0238CBD0
ov16_0238CBD0: ; 0x0238CBD0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x3c
	bl sub_02059B08
	ldr r1, _0238CC5C ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #0
	ldr r8, [r1]
	ldr sb, _0238CC60 ; =0x0000022B
	mov r5, r0
	mov r7, r6
	add r4, sp, #0
_0238CBF8:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsValidTeamMember
	cmp r0, #0
	beq _0238CC40
	cmp r5, #0
	bne _0238CC28
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsMainCharacter
	cmp r0, #0
	bne _0238CC40
_0238CC28:
	mov r0, r8
	mov r1, r4
	bl GetEvolutionPossibilities
	ldrsh r0, [sp, #8]
	cmp r0, #0
	addne r6, r6, #1
_0238CC40:
	add r7, r7, #1
	cmp r7, sb
	add r8, r8, #0x44
	blt _0238CBF8
	mov r0, r6
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238CC5C: .word TEAM_MEMBER_TABLE_PTR
_0238CC60: .word 0x0000022B
	arm_func_end ov16_0238CBD0

	arm_func_start ov16_0238CC64
ov16_0238CC64: ; 0x0238CC64
	stmdb sp!, {r3, lr}
	bl GetTeamMember
	ldr r1, _0238CC90 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
#ifdef EUROPE
	mov r2, #0xa
	ldr r3, [r1]
	str r0, [r3, #0x3c]
#else
	ldr r2, [r1]
	str r0, [r2, #0x3c]
#endif
	ldr r0, [r1]
	ldr r1, [r0, #0x3c]
	add r0, r0, #0xb1
	add r1, r1, #0x3a
#ifdef EUROPE
	bl StrncpySimple
#else
	bl StrcpySimple
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CC90: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CC64

	arm_func_start ov16_0238CC94
ov16_0238CC94: ; 0x0238CC94
	ldr r0, _0238CCA4 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0xdc]
	bx lr
	.align 2, 0
_0238CCA4: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CC94

	arm_func_start ov16_0238CCA8
ov16_0238CCA8: ; 0x0238CCA8
	ldr r0, _0238CCB8 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	ldrsh r0, [r0, #0xde]
	bx lr
	.align 2, 0
_0238CCB8: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CCA8

	arm_func_start ov16_0238CCBC
ov16_0238CCBC: ; 0x0238CCBC
	ldr r0, _0238CCD4 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldrne r0, [r0, #0xe0]
	bx lr
	.align 2, 0
_0238CCD4: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CCBC

	arm_func_start ov16_0238CCD8
ov16_0238CCD8: ; 0x0238CCD8
	ldr r0, _0238CCEC ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xe0]
	bx lr
	.align 2, 0
_0238CCEC: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CCD8

	arm_func_start ov16_0238CCF0
ov16_0238CCF0: ; 0x0238CCF0
	ldr r0, _0238CD04 ; =OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0xd8]
	bx lr
	.align 2, 0
_0238CD04: .word OVERLAY16_UNKNOWN_POINTER__NA_238CE40
	arm_func_end ov16_0238CCF0
	; 0x0238CD08

	.rodata
	.global EVO_MENU_ITEMS_CONFIRM
EVO_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV16_DATA_OFFSET 0x2EA0
#else
#define OV16_DATA_OFFSET 0
#endif
	.word 0x42B + OV16_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x42C + OV16_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global EVO_SUBMENU_ITEMS
EVO_SUBMENU_ITEMS:
	.word 0x435 + OV16_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x436 + OV16_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x437 + OV16_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global EVO_MAIN_MENU_ITEMS
EVO_MAIN_MENU_ITEMS:
	.word 0x42E + OV16_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x42F + OV16_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x430 + OV16_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.hword 0x42D + OV16_DATA_OFFSET, 0x42E + OV16_DATA_OFFSET, 0x42F + OV16_DATA_OFFSET, 0x430 + OV16_DATA_OFFSET
	.hword 0x431 + OV16_DATA_OFFSET, 0x432 + OV16_DATA_OFFSET, 0x433 + OV16_DATA_OFFSET, 0x434 + OV16_DATA_OFFSET, 0x438 + OV16_DATA_OFFSET, 0x439 + OV16_DATA_OFFSET, 0x43A + OV16_DATA_OFFSET, 0x43C + OV16_DATA_OFFSET
	.hword 0x43D + OV16_DATA_OFFSET, 0x43E + OV16_DATA_OFFSET, 0x43F + OV16_DATA_OFFSET, 0x440 + OV16_DATA_OFFSET, 0x441 + OV16_DATA_OFFSET, 0x442 + OV16_DATA_OFFSET, 0x443 + OV16_DATA_OFFSET, 0x444 + OV16_DATA_OFFSET
	.hword 0x445 + OV16_DATA_OFFSET, 0x446 + OV16_DATA_OFFSET, 0x447 + OV16_DATA_OFFSET, 0x448 + OV16_DATA_OFFSET, 0x449 + OV16_DATA_OFFSET, 0x43B + OV16_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x12, 0x10, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x0A, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global EVO_WINDOW_PARAMS_4
EVO_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global EVO_WINDOW_PARAMS_5
EVO_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x13, 0x02, 0x0B, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global EVO_WINDOW_PARAMS_6
EVO_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x14, 0x10, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov16_0238CE04
ov16_0238CE04:
	.byte 0x6D, 0x65, 0x6E, 0x75
	.byte 0x4D, 0x6F, 0x6E, 0x73, 0x74, 0x65, 0x72, 0x50, 0x69, 0x63, 0x74, 0x75, 0x72, 0x65, 0x42, 0x6F
	.byte 0x6F, 0x6B, 0x5F, 0x49, 0x73, 0x42, 0x75, 0x73, 0x79, 0x20, 0x62, 0x75, 0x73, 0x79, 0x0A, 0x00
	.global ov16_0238CE28
ov16_0238CE28:
	.byte 0x5B, 0x6B, 0x69, 0x6E, 0x64, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00, 0x00

	.data
	.global OVERLAY16_UNKNOWN_POINTER__NA_238CE40
OVERLAY16_UNKNOWN_POINTER__NA_238CE40:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
