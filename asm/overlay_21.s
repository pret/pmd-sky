	.include "asm/macros.inc"
	.include "overlay_21.inc"

	.text

	arm_func_start ov21_0238A140
ov21_0238A140: ; 0x0238A140
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x180
	ldr r4, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r1, [r0]
	cmp r1, #0x42
	addls pc, pc, r1, lsl #2
	b _0238B7B8
_0238A168: ; jump table
	b _0238A274 ; case 0
	b _0238A378 ; case 1
	b _0238A3E0 ; case 2
	b _0238A594 ; case 3
	b _0238A844 ; case 4
	b _0238A668 ; case 5
	b _0238A6DC ; case 6
	b _0238A750 ; case 7
	b _0238A7D0 ; case 8
	b _0238A854 ; case 9
	b _0238A8D4 ; case 10
	b _0238A950 ; case 11
	b _0238A98C ; case 12
	b _0238A9A8 ; case 13
	b _0238A9E8 ; case 14
	b _0238AA1C ; case 15
	b _0238AAC0 ; case 16
	b _0238AF50 ; case 17
	b _0238AC38 ; case 18
	b _0238AC7C ; case 19
	b _0238ACC0 ; case 20
	b _0238AEF4 ; case 21
	b _0238AE94 ; case 22
	b _0238AE08 ; case 23
	b _0238AD64 ; case 24
	b _0238AD04 ; case 25
	b _0238B7B8 ; case 26
	b _0238A32C ; case 27
	b _0238B7B8 ; case 28
	b _0238B7B8 ; case 29
	b _0238ABDC ; case 30
	b _0238B7B8 ; case 31
	b _0238A4EC ; case 32
	b _0238A44C ; case 33
	b _0238A478 ; case 34
	b _0238A520 ; case 35
	b _0238B204 ; case 36
	b _0238B228 ; case 37
	b _0238B260 ; case 38
	b _0238B7B8 ; case 39
	b _0238B28C ; case 40
	b _0238B7B8 ; case 41
	b _0238B2BC ; case 42
	b _0238B7B8 ; case 43
	b _0238B2EC ; case 44
	b _0238B7B8 ; case 45
	b _0238B318 ; case 46
	b _0238B7B8 ; case 47
	b _0238B344 ; case 48
	b _0238B3B8 ; case 49
	b _0238B7B8 ; case 50
	b _0238B408 ; case 51
	b _0238B434 ; case 52
	b _0238B4CC ; case 53
	b _0238B538 ; case 54
	b _0238B5A4 ; case 55
	b _0238A5FC ; case 56
	b _0238B5D0 ; case 57
	b _0238B640 ; case 58
	b _0238B684 ; case 59
	b _0238B7B8 ; case 60
	b _0238B7B8 ; case 61
	b _0238B6F8 ; case 62
	b _0238B724 ; case 63
	b _0238B68C ; case 64
	b _0238B7B8 ; case 65
	b _0238B7B8 ; case 66
_0238A274:
	ldr r0, _0238B090 ; =ov21_0238CBB8
	bl Debug_Print0
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0x96
	mov r0, #0
	str r2, [r1, #0x54]
	bl CreateDialogueBox
	mov r3, r4
	ldr r4, [r3]
	ldr r1, _0238B094 ; =0x00003008
	strb r0, [r4, #0x80]
	ldr r3, [r3]
	ldr r2, _0238B098 ; =0x000003B2
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, _0238B09C ; =0x000001EF
	ldr r3, [r2]
	strb r0, [r3, #0x81]
	ldr r0, [r2]
	add r0, r0, #0xc8
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xc8
	bl SetPortraitLayout
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	add r0, r1, #0xc8
	ldr r1, [r1, #0x28]
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	b _0238B7B8
_0238A32C:
	ldr r0, _0238B0A0 ; =ov21_0238CBD4
	bl Debug_Print0
	ldr r0, _0238B0A4 ; =SWAP_SHOP_WINDOW_PARAMS_1
	ldr r1, _0238B0A8 ; =ov21_0238C9A4
	bl CreateTextBox
	mov r2, r4
	ldr r2, [r2]
	ldr r1, _0238B0AC ; =0x00300013
	strb r0, [r2, #0x84]
	mov r4, #4
	ldr r3, _0238B0B0 ; =SWAP_SHOP_MAIN_MENU_ITEMS_2
	ldr r0, _0238B0B4 ; =SWAP_SHOP_WINDOW_PARAMS_5
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238A378:
	ldr r0, _0238B0B8 ; =ov21_0238CBF8
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B094 ; =0x00003008
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B0BC ; =0x000003B3
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A3E0:
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0x21
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B094 ; =0x00003008
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C620 ; =0x000032AF
#else
	mov r2, #0x3d0
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A44C:
	ldr r0, _0238B0C0 ; =SWAP_SHOP_WINDOW_PARAMS_7
	mov r4, #3
	ldr r1, _0238B0AC ; =0x00300013
	ldr r3, _0238B0C4 ; =SWAP_SHOP_SUBMENU_ITEMS_2
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238A478:
	ldr r0, _0238B0C8 ; =ov21_0238CC18
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0x20
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	add r2, r1, #0x28c
#else
	ldr r2, _0238B0D0 ; =0x000003C5
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A4EC:
	ldr r0, _0238B0C8 ; =ov21_0238CC18
	bl Debug_Print0
	mov r0, r4
	ldr r2, [r0]
#ifdef JAPAN
	mov r3, #2
	str r3, [r2, #4]
#else
	mov r4, #2
	str r4, [r2, #4]
#endif
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C634 ; =0x000032A5
#else
	add r2, r4, #0x3c4
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A520:
	ldr r0, _0238B0C8 ; =ov21_0238CC18
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #2
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B0D4 ; =0x000003C7
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A594:
	ldr r0, _0238B0D8 ; =ov21_0238CC3C
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r2, #4
	str r2, [r1, #4]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C640 ; =0x000032A7
#else
	mov r2, #0x3c8
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A5FC:
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B0DC ; =0x000003B7
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A668:
	ldr r0, _0238B0E0 ; =ov21_0238CC5C
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B0E4 ; =0x000003B6
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A6DC:
	ldr r0, _0238B0E8 ; =ov21_0238CC7C
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C654 ; =0x00003293
#else
	mov r2, #0x3b4
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A750:
	ldr r0, _0238B0EC ; =ov21_0238CC9C
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0x96
	str r2, [r1, #0x54]
	ldr r1, [r0]
	mov r3, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	add r2, r1, #0x27c
#else
	ldr r2, _0238B0F0 ; =0x000003B5
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A7D0:
	ldr r0, _0238B0F4 ; =ov21_0238CCC0
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0xd
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C660 ; =0x000032A3
#else
	mov r2, #0x3c4
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A844:
	ldr r0, _0238B0F8 ; =ov21_0238CCE4
	bl Debug_Print0
	bl ov11_022DC504
	b _0238B7B8
_0238A854:
	ldr r0, _0238B0FC ; =ov21_0238CD00
	bl Debug_Print0
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0xb
	str r2, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x1a
	str r3, [r1]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C66C ; =0x00003297
#else
	mov r2, #0x3b8
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A8D4:
	ldr r0, _0238B100 ; =ov21_0238CD24
	bl Debug_Print0
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0xd
	str r2, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x1a
	str r3, [r1]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B094 ; =0x00003008
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B104 ; =0x000003C2
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238A950:
	ldr r0, _0238B108 ; =ov21_0238CD44
	bl Debug_Print0
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238B7B8
_0238A98C:
	ldr r0, _0238B10C ; =ov21_0238CD68
	bl Debug_Print0
	bl ov11_0230C910
	mov r0, #0
	mov r1, r0
	bl ov11_0230B20C
	b _0238B7B8
_0238A9A8:
	ldr r0, _0238B110 ; =ov21_0238CD8C
	bl Debug_Print0
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	bl ov11_0230BB98
	b _0238B7B8
_0238A9E8:
	ldr r0, _0238B114 ; =ov21_0238CDB4
	bl Debug_Print0
	mov r4, #3
	ldr r0, _0238B118 ; =SWAP_SHOP_WINDOW_PARAMS_6
	ldr r1, _0238B11C ; =0x00400013
	ldr r3, _0238B120 ; =SWAP_SHOP_MAIN_MENU_ITEMS_1
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238AA1C:
	ldr r0, _0238B124 ; =ov21_0238CDDC
	bl Debug_Print0
	mov r0, r4
	ldr r5, [r0]
	ldr r2, _0238B128 ; =ov21_0238CE00
	ldrsh r4, [r5, #0xe]
	ldr r3, _0238B12C ; =0x0000C402
	mov r1, #0x400
	str r4, [r5, #0x40]
	ldr r5, [r0]
	ldrh r4, [r5, #0x10]
	str r4, [r5, #0x54]
	ldr r0, [r0]
	add r4, r0, #0x30
	add r0, r0, #0x86
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0x18
	bl InitPreprocessorArgs
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	add r1, sp, #0x18
	ldr r3, [r0]
	ldr r0, _0238B130 ; =SWAP_SHOP_WINDOW_PARAMS_8
	add r2, r3, #0x86
	str r2, [sp, #0x50]
	str r1, [sp]
	ldrsh r2, [r3, #0xe]
	add r3, r3, #0x30
	ldr r1, _0238B134 ; =0x00001013
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
	stmib sp, {r2, r3}
	ldr r3, _0238B138 ; =0x0000033E
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x85]
	b _0238B7B8
_0238AAC0:
	ldr r0, _0238B13C ; =ov21_0238CE0C
	bl Debug_Print0
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0x96
	str r3, [r1, #0x54]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0x1c
	str r3, [r1]
	ldr r1, [r0]
	mov r2, #0x1e
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xe]
	bl ov21_0238B7E0
	mov r1, r4
	ldr r4, [r1]
	add r3, r0, #1
	add r2, r0, #2
	str r0, [r4, #0x44]
	ldr r0, [r1]
	str r3, [r0, #0x48]
	ldr r0, [r1]
	str r2, [r0, #0x4c]
	ldr r2, [r1]
	ldrh r0, [r2, #0xd8]
	str r0, [r2, #0x58]
	ldr r3, [r1]
	ldrh r0, [r3, #0xd8]
	cmp r0, #0
	beq _0238AB90
#ifdef JAPAN
	ldr r1, _0238B094 ; =0x00003008
	ldrsb r0, [r3, #0x80]
	add r2, r1, #0x294
#else
	ldrsb r0, [r3, #0x80]
	ldr r1, _0238B094 ; =0x00003008
	ldr r2, _0238B140 ; =0x000003BD
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238AB90:
	ldrsh r0, [r3, #0xe]
	bl ov11_0230C068
	cmp r0, #3
	ldr r1, _0238B094 ; =0x00003008
	bne _0238ABC0
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
#ifdef JAPAN
	ldr r2, _0238C6B0 ; =0x0000329B
#else
	mov r2, #0x3bc
#endif
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238ABC0:
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r2, _0238B144 ; =0x000003BB
	ldr r3, [r0]
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238ABDC:
	ldr r0, _0238B148 ; =ov21_0238CE34
	bl Debug_Print0
	mov r1, r4
	ldr r2, [r1]
	mov r3, #0x96
	ldr r0, _0238B0A4 ; =SWAP_SHOP_WINDOW_PARAMS_1
	ldr r1, _0238B0A8 ; =ov21_0238C9A4
	str r3, [r2, #0x54]
	bl CreateTextBox
	mov r2, r4
	ldr r2, [r2]
	ldr r1, _0238B0AC ; =0x00300013
	strb r0, [r2, #0x84]
	mov r4, #2
	ldr r3, _0238B14C ; =SWAP_SHOP_MENU_ITEMS_CONFIRM
	ldr r0, _0238B0C0 ; =SWAP_SHOP_WINDOW_PARAMS_7
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238AC38:
	ldr r0, _0238B150 ; =ov21_0238CE4C
	bl Debug_Print0
	mov r0, r4
	ldr r1, [r0]
	mov r3, #6
	str r3, [r1, #0x2c]
	ldr r1, [r0]
	mov r2, #0x15
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238B7B8
_0238AC7C:
	ldr r0, _0238B154 ; =ov21_0238CE78
	bl Debug_Print0
	mov r0, r4
	ldr r1, [r0]
	mov r3, #7
	str r3, [r1, #0x2c]
	ldr r1, [r0]
	mov r2, #0x16
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238B7B8
_0238ACC0:
	ldr r0, _0238B158 ; =ov21_0238CEA4
	bl Debug_Print0
	mov r0, r4
	ldr r1, [r0]
	mov r3, #8
	str r3, [r1, #0x2c]
	ldr r1, [r0]
	mov r2, #0x17
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238B7B8
_0238AD04:
	mov r1, #1
	str r1, [r0, #4]
#ifdef JAPAN
	ldr r3, [r4]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238C660 ; =0x000032A3
	add r3, r3, #0x30
#else
	ldr r2, [r4]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r2, #0x80]
	add r3, r2, #0x30
	mov r2, #0x3c4
#endif
	bl ShowStringIdInDialogueBox
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	b _0238B7B8
_0238AD64:
	ldrsh r0, [r0, #0xe]
	bl ov11_0230C068
	cmp r0, #3
	mov r0, r4
	bne _0238ADB0
	ldr r1, [r0]
	mov r3, #9
	str r3, [r1, #0x58]
#ifdef JAPAN
	ldr r3, [r0]
	ldr r2, _0238C6CC ; =0x000032A2
	ldrsb r0, [r3, #0x80]
	mov r1, #0x18
#else
	rsb r2, r3, #0x3cc
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x80]
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238ADE4
_0238ADB0:
	ldr r1, [r0]
	mov r3, #4
	str r3, [r1, #0x58]
	ldr r3, [r0]
	ldr r2, _0238B15C ; =0x000003C1
	ldrsb r0, [r3, #0x80]
	mov r1, #0x18
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
_0238ADE4:
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	movne r0, #0x19
	strne r0, [r1, #4]
	moveq r0, #1
	streq r0, [r1, #4]
	b _0238B7B8
_0238AE08:
	mov r1, #0x18
	str r1, [r0, #4]
	ldr r0, [r4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230C068
	cmp r0, #3
	mov r0, r4
	ldr r1, _0238B0CC ; =0x00003018
	ldr r3, [r0]
	bne _0238AE44
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B104 ; =0x000003C2
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238AE54
_0238AE44:
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238C6D4 ; =0x0000329F
#else
	mov r2, #0x3c0
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
_0238AE54:
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	b _0238B7B8
_0238AE94:
	mov r1, #0x14
	str r1, [r0, #4]
	ldr r3, [r4]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B160 ; =0x000003BA
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	mov r0, r4
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	b _0238B7B8
_0238AEF4:
	ldr r0, _0238B164 ; =ov21_0238CED0
	bl Debug_Print0
	mov r0, r4
#ifdef JAPAN
	mov r3, #0x13
	ldr r1, [r0]
	add r2, r3, #0x1dc
	str r3, [r1, #4]
	ldr r1, [r0]
	ldr r3, _0238B168 ; =0x00001311
	str r2, [r1, #0x30]
	ldr r1, [r0]
	ldr r2, _0238C6E4 ; =0x0000329E
	str r3, [r1, #0x54]
#else
	mov r2, #0x13
	ldr r1, [r0]
	add r3, r2, #0x1dc
	str r2, [r1, #4]
	ldr r1, [r0]
	ldr r4, _0238B168 ; =0x00001311
	str r3, [r1, #0x30]
	ldr r3, [r0]
	add r2, r2, #0x3ac
	str r4, [r3, #0x54]
#endif
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
#ifdef JAPAN
	mov r0, r4
#else
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
#endif
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238B7B8
_0238AF50:
	ldr r0, _0238B16C ; =ov21_0238CEF8
	bl Debug_Print0
	mvn r0, #0x95
	bl AddMoneyCarried
	ldr r1, [r4]
	ldrh r0, [r1, #0xd8]
	cmp r0, #0
	beq _0238AFE8
	mov r5, #0
	b _0238AF88
_0238AF78:
	add r0, r1, r5, lsl #1
	ldrsh r0, [r0, #0xdc]
	bl RemoveItem
	add r5, r5, #1
_0238AF88:
	ldr r1, [r4]
	ldrh r0, [r1, #0xda]
	cmp r5, r0
	blt _0238AF78
	mov r5, #0
	ldr r4, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	b _0238AFB8
_0238AFA4:
	add r0, r1, r5, lsl #1
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x42]
	bl RemoveItemAtIdxInStorage
	add r5, r5, #1
_0238AFB8:
	ldr r1, [r4]
	add r0, r1, #0x100
	ldrh r0, [r0, #0x40]
	cmp r5, r0
	blt _0238AFA4
	bl RemoveEmptyItemsInBag
	bl sub_0201007C
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsh r0, [r0, #0xe]
	bl sub_02013150
	b _0238B064
_0238AFE8:
	ldrsh r0, [r1, #0xe]
	bl ov11_0230C068
	cmp r0, #3
	moveq r5, #3
	mov r4, #0
	movne r5, #2
	add r8, sp, #0x12
	mov sl, r4
	mov sb, #1
	add r7, sp, #0xc
	ldr r6, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	b _0238B05C
_0238B018:
	ldr r0, [r6]
	ldrsh r0, [r0, #0xe]
	bl ov21_0238B7E0
	add r2, r4, r0
	mov r0, r8
	mov r1, r7
	strh r2, [sp, #0x10]
	strh sl, [sp, #0xe]
	strb sb, [sp, #0xc]
	bl ItemToBulkItem
	mov r0, r8
	bl RemoveItemByIdAndStackNoHole
	cmp r0, #0
	bne _0238B058
	mov r0, r8
	bl RemoveBulkItemInStorage
_0238B058:
	add r4, r4, #1
_0238B05C:
	cmp r4, r5
	blt _0238B018
_0238B064:
	bl IsBagFull
	cmp r0, #0
	beq _0238B170
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0xe
	bl AddBulkItemToStorage
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #1
	b _0238B188
	.align 2, 0
#ifdef JAPAN
#define OV21_238A140_OFFSET 0x2EDF
#else
#define OV21_238A140_OFFSET 0
#endif
_0238B08C: .word OVERLAY21_UNKNOWN_POINTER__NA_238CF40
_0238B090: .word ov21_0238CBB8
_0238B094: .word 0x00003008
_0238B098: .word 0x000003B2 + OV21_238A140_OFFSET
_0238B09C: .word 0x000001EF
_0238B0A0: .word ov21_0238CBD4
_0238B0A4: .word SWAP_SHOP_WINDOW_PARAMS_1
_0238B0A8: .word ov21_0238C9A4
_0238B0AC: .word 0x00300013
_0238B0B0: .word SWAP_SHOP_MAIN_MENU_ITEMS_2
_0238B0B4: .word SWAP_SHOP_WINDOW_PARAMS_5
_0238B0B8: .word ov21_0238CBF8
_0238B0BC: .word 0x000003B3 + OV21_238A140_OFFSET
#ifdef JAPAN
_0238C620: .word 0x000032AF
#endif
_0238B0C0: .word SWAP_SHOP_WINDOW_PARAMS_7
_0238B0C4: .word SWAP_SHOP_SUBMENU_ITEMS_2
_0238B0C8: .word ov21_0238CC18
_0238B0CC: .word 0x00003018
#ifdef JAPAN
_0238C634: .word 0x000032A5
#else
_0238B0D0: .word 0x000003C5
#endif
_0238B0D4: .word 0x000003C7 + OV21_238A140_OFFSET
_0238B0D8: .word ov21_0238CC3C
#ifdef JAPAN
_0238C640: .word 0x000032A7
#endif
_0238B0DC: .word 0x000003B7 + OV21_238A140_OFFSET
_0238B0E0: .word ov21_0238CC5C
_0238B0E4: .word 0x000003B6 + OV21_238A140_OFFSET
_0238B0E8: .word ov21_0238CC7C
#ifdef JAPAN
_0238C654: .word 0x00003293
_0238B0EC: .word ov21_0238CC9C
_0238B0F4: .word ov21_0238CCC0
_0238C660: .word 0x000032A3
#else
_0238B0EC: .word ov21_0238CC9C
_0238B0F0: .word 0x000003B5
_0238B0F4: .word ov21_0238CCC0
#endif
_0238B0F8: .word ov21_0238CCE4
_0238B0FC: .word ov21_0238CD00
#ifdef JAPAN
_0238C66C: .word 0x00003297
#endif
_0238B100: .word ov21_0238CD24
_0238B104: .word 0x000003C2 + OV21_238A140_OFFSET
_0238B108: .word ov21_0238CD44
_0238B10C: .word ov21_0238CD68
_0238B110: .word ov21_0238CD8C
_0238B114: .word ov21_0238CDB4
_0238B118: .word SWAP_SHOP_WINDOW_PARAMS_6
_0238B11C: .word 0x00400013
_0238B120: .word SWAP_SHOP_MAIN_MENU_ITEMS_1
_0238B124: .word ov21_0238CDDC
_0238B128: .word ov21_0238CE00
_0238B12C: .word 0x0000C402
_0238B130: .word SWAP_SHOP_WINDOW_PARAMS_8
_0238B134: .word 0x00001013
#ifdef JAPAN
_0238B138: .word 0x00003203
_0238B13C: .word ov21_0238CE0C
_0238C6B0: .word 0x0000329B
#else
_0238B138: .word 0x0000033E
_0238B13C: .word ov21_0238CE0C
_0238B140: .word 0x000003BD
#endif
_0238B144: .word 0x000003BB + OV21_238A140_OFFSET
_0238B148: .word ov21_0238CE34
_0238B14C: .word SWAP_SHOP_MENU_ITEMS_CONFIRM
_0238B150: .word ov21_0238CE4C
_0238B154: .word ov21_0238CE78
_0238B158: .word ov21_0238CEA4
#ifdef JAPAN
_0238C6CC: .word 0x000032A2
_0238B15C: .word 0x000032A0
_0238C6D4: .word 0x0000329F
_0238B160: .word 0x00003299
#else
_0238B15C: .word 0x000003C1
_0238B160: .word 0x000003BA
#endif
_0238B164: .word ov21_0238CED0
_0238B168: .word 0x00001311
#ifdef JAPAN
_0238C6E4: .word 0x0000329E
#endif
_0238B16C: .word ov21_0238CEF8
_0238B170:
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0xe
	bl SpecialProcAddItemToBag
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0
_0238B188:
	ldr r0, [r0]
	mov r2, #0x12
	strb r1, [r0, #0xc]
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r2, [r0]
	ldrsh r1, [r2, #0xe]
	str r1, [r2, #0x44]
	ldr r2, [r0]
	ldrh r1, [r2, #0x10]
	str r1, [r2, #0x58]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, _0238B0CC ; =0x00003018
	ldr r3, [r0]
	ldr r2, _0238B7C0 ; =0x000003BE
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238B204:
	mov r1, #0x25
	str r1, [r0, #4]
	ldr r3, [r4]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B7C4 ; =0x000003CA
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238B228:
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	mov r0, #0xc
	mov r1, #0
	bl sub_02039C2C
	b _0238B7B8
_0238B260:
	ldr r0, _0238B7C8 ; =SWAP_SHOP_WINDOW_PARAMS_9
	mov r4, #5
	ldr r3, _0238B7CC ; =SWAP_SHOP_SUBMENU_ITEMS_3
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238B28C:
	ldr r1, [r0, #0x914]
	add r0, sp, #0x68
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_0205B028
	add r0, sp, #0x68
	mov r1, #3
	bl sub_0203F150
	mov r1, r4
	ldr r1, [r1]
	strb r0, [r1, #0x85]
	b _0238B7B8
_0238B2BC:
	ldr r0, [r0, #0x914]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0203FA64
	mov r1, #0
	mov r2, r1
	mov r0, #9
	bl sub_0204018C
	mov r1, r4
	ldr r1, [r1]
	strb r0, [r1, #0x82]
	b _0238B7B8
_0238B2EC:
	add r1, r0, #0x900
	ldrsh r2, [r1, #0x18]
	add r0, r0, #0x1a
	add r0, r0, #0x900
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	mov r1, r4
	ldr r1, [r1]
	strb r0, [r1, #0x85]
	b _0238B7B8
_0238B318:
	ldr r0, [r0, #0x914]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	mov r1, r0
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	mov r3, #0
	bl PrintIqSkillsMenu
	b _0238B7B8
_0238B344:
	mov r1, #0x31
	str r1, [r0, #4]
	ldr r2, [r4]
	mov r1, #0
	ldr r0, [r2, #0x914]
	orr r0, r0, #0x20000
	str r0, [r2, #0x30]
	ldr r0, [r4]
	str r1, [r0, #0x28]
	ldr r0, [r4]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
	ldr r2, _0238B7D0 ; =0x000003CB
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	bl ov11_0230C910
	b _0238B7B8
_0238B3B8:
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	mov r0, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x914]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	ldrsh r1, [r0, #4]
	mov r0, #2
	bl ov11_0230B20C
	b _0238B7B8
_0238B408:
	ldr r0, _0238B118 ; =SWAP_SHOP_WINDOW_PARAMS_6
	mov r4, #2
	ldr r3, _0238B7D4 ; =SWAP_SHOP_SUBMENU_ITEMS_1
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238B434:
	ldrsh r1, [r0, #0xe]
	ldr r2, _0238B128 ; =ov21_0238CE00
	ldr r3, _0238B12C ; =0x0000C402
	str r1, [r0, #0x40]
	ldr r5, [r4]
	mov r1, #0x400
	ldrh r0, [r5, #0x10]
	str r0, [r5, #0x54]
	ldr r0, [r4]
	add r4, r0, #0x30
	add r0, r0, #0x86
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0xe0
	bl InitPreprocessorArgs
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	add r1, sp, #0xe0
	ldr r4, [r0]
	ldr r0, _0238B130 ; =SWAP_SHOP_WINDOW_PARAMS_8
	add r2, r4, #0x86
	str r2, [sp, #0x118]
	str r1, [sp]
	ldrsh r2, [r4, #0xe]
	ldr r1, _0238B134 ; =0x00001013
	ldr r3, _0238B138 ; =0x0000033E
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
	add r4, r4, #0x30
	mov r2, #0
	str r4, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x85]
	b _0238B7B8
_0238B4CC:
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0x36
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	add r2, r1, #0x280
#else
	ldr r2, _0238B7D8 ; =0x000003B9
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238B538:
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #0x37
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B094 ; =0x00003008
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	ldr r2, _0238CD54 ; =0x000032AB
#else
	mov r2, #0x3cc
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238B5A4:
	ldr r0, _0238B0C0 ; =SWAP_SHOP_WINDOW_PARAMS_7
	mov r4, #2
	ldr r1, _0238B0AC ; =0x00300013
	ldr r3, _0238B14C ; =SWAP_SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238B5D0:
	mov r1, #0x3a
	str r1, [r0, #4]
	ldr r2, [r4]
	mov r1, #0
	ldr r0, [r2, #0x914]
	orr r0, r0, #0x20000
	str r0, [r2, #0x30]
	ldr r0, [r4]
	str r1, [r0, #0x28]
	ldr r0, [r4]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	add r2, r1, #0x290
#else
	ldr r2, _0238B7DC ; =0x000003C9
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238B640:
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	mov r0, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	bl ov11_0230C910
	mov r1, r4
	ldr r1, [r1]
	mov r0, #3
	ldrh r1, [r1, #0xd8]
	bl ov11_0230B20C
	b _0238B7B8
_0238B684:
	bl ov11_0230BB98
	b _0238B7B8
_0238B68C:
	bl ov21_0238C920
	mov r0, r4
	ldr r1, [r0]
	mov r3, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #0x28]
	ldr r0, [r0]
	ldr r1, [r0, #0x28]
	add r0, r0, #0xc8
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	mov r0, r4
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	mov r0, r4
	ldr r3, [r0]
	ldr r1, _0238B0CC ; =0x00003018
	ldrsb r0, [r3, #0x80]
#ifdef JAPAN
	add r2, r1, #0x280
#else
	ldr r2, _0238B7D8 ; =0x000003B9
#endif
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238B7B8
_0238B6F8:
	ldr r0, _0238B118 ; =SWAP_SHOP_WINDOW_PARAMS_6
	mov r4, #2
	ldr r3, _0238B7D4 ; =SWAP_SHOP_SUBMENU_ITEMS_1
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x83]
	b _0238B7B8
_0238B724:
	ldrsh r1, [r0, #0x18]
	ldr r2, _0238B128 ; =ov21_0238CE00
	ldr r3, _0238B12C ; =0x0000C402
	str r1, [r0, #0x40]
	ldr r5, [r4]
	mov r1, #0x400
	ldrh r0, [r5, #0x1a]
	str r0, [r5, #0x54]
	ldr r0, [r4]
	add r4, r0, #0x30
	add r0, r0, #0x86
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0x130
	bl InitPreprocessorArgs
	ldr r0, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	add r1, sp, #0x130
	ldr r4, [r0]
	ldr r0, _0238B130 ; =SWAP_SHOP_WINDOW_PARAMS_8
	add r2, r4, #0x86
	str r2, [sp, #0x168]
	str r1, [sp]
	ldrsh r2, [r4, #0x18]
	ldr r1, _0238B134 ; =0x00001013
	ldr r3, _0238B138 ; =0x0000033E
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
	add r4, r4, #0x30
	mov r2, #0
	str r4, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _0238B08C ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	strb r0, [r1, #0x85]
_0238B7B8:
	add sp, sp, #0x180
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238B7C0: .word 0x000003BE + OV21_238A140_OFFSET
_0238B7C4: .word 0x000003CA + OV21_238A140_OFFSET
_0238B7C8: .word SWAP_SHOP_WINDOW_PARAMS_9
_0238B7CC: .word SWAP_SHOP_SUBMENU_ITEMS_3
_0238B7D0: .word 0x000003CB + OV21_238A140_OFFSET
_0238B7D4: .word SWAP_SHOP_SUBMENU_ITEMS_1
#ifdef JAPAN
_0238CD54: .word 0x000032AB
#else
_0238B7D8: .word 0x000003B9
_0238B7DC: .word 0x000003C9
#endif
	arm_func_end ov21_0238A140

	arm_func_start ov21_0238B7E0
ov21_0238B7E0: ; 0x0238B7E0
	cmp r0, #0x1bc
	blt _0238B7F8
	ldr r1, _0238B834 ; =0x000001C3
	cmp r0, r1
	ldrle r0, _0238B838 ; =0x000002FE
	bxle lr
_0238B7F8:
	cmp r0, #0x1c4
	blt _0238B810
	ldr r1, _0238B83C ; =0x000001C7
	cmp r0, r1
	ldrle r0, _0238B840 ; =0x00000336
	bxle lr
_0238B810:
	ldr r1, _0238B844 ; =0xFFFFFE06
	add r1, r0, r1
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	mov r0, r0, lsl #2
	add r0, r0, #0xfa
	add r0, r0, #0x100
	bx lr
	.align 2, 0
_0238B834: .word 0x000001C3
_0238B838: .word 0x000002FE
_0238B83C: .word 0x000001C7
_0238B840: .word 0x00000336
_0238B844: .word 0xFFFFFE06
	arm_func_end ov21_0238B7E0

	arm_func_start ov21_0238B848
ov21_0238B848: ; 0x0238B848
	stmdb sp!, {r3, lr}
	ldr r0, _0238B8F0 ; =0x0000093C
	mov r1, #6
	bl MemAlloc
	ldr r1, _0238B8F4 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0
	str r0, [r1]
	str r3, [r0, #0x1c]
	ldr r0, [r1]
	sub r2, r3, #2
	str r3, [r0, #0x20]
	ldr r0, [r1]
	str r3, [r0, #0x24]
	ldr r0, [r1]
	strb r2, [r0, #0x84]
	ldr r0, [r1]
	strb r2, [r0, #0x82]
	ldr r0, [r1]
	strb r2, [r0, #0x83]
	ldr r0, [r1]
	str r3, [r0, #0x2c]
	ldr r0, [r1]
	add r0, r0, #0x30
	bl InitPreprocessorArgs
	ldr r0, _0238B8F4 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r3, _0238B8F8 ; =0x000001EF
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #0x7c]
	ldr r2, [r0]
	str r3, [r2, #0x30]
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov11_0230C910
	ldr r0, _0238B8F4 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x41
	str r2, [r1, #0x28]
	bl ov21_0238A140
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B8F0: .word 0x0000093C
_0238B8F4: .word OVERLAY21_UNKNOWN_POINTER__NA_238CF40
_0238B8F8: .word 0x000001EF
	arm_func_end ov21_0238B848

	arm_func_start ov21_0238B8FC
ov21_0238B8FC: ; 0x0238B8FC
	stmdb sp!, {r3, lr}
	ldr r0, _0238B924 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238B924 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B924: .word OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	arm_func_end ov21_0238B8FC

	arm_func_start ov21_0238B928
ov21_0238B928: ; 0x0238B928
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r3, [r0]
	ldr r1, [r3, #0x2c]
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _0238C914
_0238B948: ; jump table
	b _0238B96C ; case 0
	b _0238B97C ; case 1
	b _0238C830 ; case 2
	b _0238C904 ; case 3
	b _0238C8E8 ; case 4
	b _0238C914 ; case 5
	b _0238C858 ; case 6
	b _0238C880 ; case 7
	b _0238C8A8 ; case 8
_0238B96C:
	mov r0, #4
	str r0, [r3, #0x2c]
	bl ov11_022E6E68
	b _0238C914
_0238B97C:
	ldr r2, [r3]
	cmp r2, #0x43
	addls pc, pc, r2, lsl #2
	b _0238C7B4
_0238B98C: ; jump table
	b _0238BA9C ; case 0
	b _0238BA9C ; case 1
	b _0238C7B4 ; case 2
	b _0238C7B4 ; case 3
	b _0238BE08 ; case 4
	b _0238C7B4 ; case 5
	b _0238C7B4 ; case 6
	b _0238C7B4 ; case 7
	b _0238C7B4 ; case 8
	b _0238C7B4 ; case 9
	b _0238C7B4 ; case 10
	b _0238BAC8 ; case 11
	b _0238BAE4 ; case 12
	b _0238BAE4 ; case 13
	b _0238BBA8 ; case 14
	b _0238BD40 ; case 15
	b _0238BD7C ; case 16
	b _0238C7B4 ; case 17
	b _0238C7A8 ; case 18
	b _0238C7A8 ; case 19
	b _0238C7A8 ; case 20
	b _0238C7B4 ; case 21
	b _0238C7B4 ; case 22
	b _0238C7B4 ; case 23
	b _0238C7B4 ; case 24
	b _0238C7B4 ; case 25
	b _0238BE10 ; case 26
	b _0238BE60 ; case 27
	b _0238C7B4 ; case 28
	b _0238C7B4 ; case 29
	b _0238BD7C ; case 30
	b _0238BF08 ; case 31
	b _0238C7B4 ; case 32
	b _0238C3C0 ; case 33
	b _0238C7B4 ; case 34
	b _0238C7B4 ; case 35
	b _0238C7B4 ; case 36
	b _0238BF80 ; case 37
	b _0238C034 ; case 38
	b _0238C5E4 ; case 39
	b _0238C124 ; case 40
	b _0238C5E4 ; case 41
	b _0238C150 ; case 42
	b _0238C5E4 ; case 43
	b _0238C1D8 ; case 44
	b _0238C5E4 ; case 45
	b _0238C204 ; case 46
	b _0238C5E4 ; case 47
	b _0238C7B4 ; case 48
	b _0238C230 ; case 49
	b _0238C5E4 ; case 50
	b _0238C2E8 ; case 51
	b _0238C340 ; case 52
	b _0238C7B4 ; case 53
	b _0238C7B4 ; case 54
	b _0238C37C ; case 55
	b _0238C7B4 ; case 56
	b _0238C7B4 ; case 57
	b _0238C42C ; case 58
	b _0238C42C ; case 59
	b _0238C5E4 ; case 60
	b _0238C5E4 ; case 61
	b _0238C550 ; case 62
	b _0238C5A8 ; case 63
	b _0238C7B4 ; case 64
	b _0238C724 ; case 65
	b _0238C788 ; case 66
	b _0238C5E4 ; case 67
_0238BA9C:
	ldrsb r0, [r3, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238C7E4
	mov r0, #0x1b
	bl ov21_0238A140
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	b _0238C7E4
_0238BAC8:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C7E4
	bl ov11_02310C2C
	mov r0, #0xc
	bl ov21_0238A140
	b _0238C7E4
_0238BAE4:
	bl ov11_0230BA64
	cmp r0, #2
	beq _0238BAFC
	cmp r0, #3
	beq _0238BB28
	b _0238BB44
_0238BAFC:
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x1f
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238BB28:
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0xe
	bl ov11_0230B8C0
	mov r0, #0xe
	bl ov21_0238A140
	b _0238C7E4
_0238BB44:
	bl ov11_0230BD28
	cmp r0, #0
	beq _0238C7E4
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _0238C7E4
	ldr r0, _0238C8D4 ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0xe
	bl ov11_0230B8C0
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0xf
	ldr r2, [r0]
	mov r1, #0x43
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C7E4
_0238BBA8:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238BD24
	cmp r0, #6
	beq _0238BD00
	cmp r0, #7
	bne _0238C7E4
	bl GetMoneyCarried
	cmp r0, #0
	bne _0238BC00
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x1f
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238BC00:
	bl GetMoneyCarried
	cmp r0, #0x96
	bge _0238BC38
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x1f
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238BC38:
	bl ov11_0230B914
	cmp r0, #0
	bne _0238BC78
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov ip, #0
	ldr r1, [r0]
	mov r3, #0x1f
	strh ip, [r1, #0xd8]
	ldr r2, [r0]
	mov r1, #0x10
	str ip, [r2, #8]
	ldr r2, [r0]
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238BC78:
	add r0, sp, #4
	add r1, sp, #2
	bl ov11_0230C050
	bl ov11_0230B958
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #2]
	add r1, r2, r1
	cmp r1, r0
	bge _0238BCC8
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x1f
	str r2, [r1, #8]
	ldr r2, [r0]
	mov r1, #5
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238BCC8:
	bl ov11_0230B958
	ldr r1, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov ip, #0
	ldr r2, [r1]
	mov r3, #0x1f
	strh r0, [r2, #0xd8]
	ldr r0, [r1]
	mov r2, #0x39
	str ip, [r0, #8]
	ldr r0, [r1]
	str r3, [r0]
	ldr r0, [r1]
	str r2, [r0, #4]
	b _0238C7E4
_0238BD00:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0xf
	ldr r2, [r0]
	mov r1, #0x43
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C7E4
_0238BD24:
	bl ov21_0238C920
	bl ov11_0230BCF8
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _0238C7E4
_0238BD40:
	ldrsb r0, [r3, #0x85]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x85]
	bl CloseScrollBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xd
	strb r2, [r1, #0x85]
	bl ov21_0238A140
	b _0238C7E4
_0238BD7C:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238BDB8
	cmp r0, #4
	beq _0238BDA0
	cmp r0, #5
	beq _0238BDB8
	b _0238C7E4
_0238BDA0:
	bl ov21_0238C920
	mov r0, #0x11
	bl ov21_0238A140
	ldr r0, _0238C8D8 ; =0x00001308
	bl sub_02017C80
	b _0238C7E4
_0238BDB8:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x1a
	ldr r1, [r0]
	mov r2, #0xb
	str r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r1, [r0]
	ldrsb r0, [r1, #0x81]
	add r1, r1, #0xc8
	bl ShowPortraitInPortraitBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, _0238C8DC ; =0x00003018
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x280
#else
	ldr r2, _0238C8E0 ; =0x000003B9
#endif
	ldrsb r0, [r3, #0x80]
	add r3, r3, #0x30
	bl ShowStringIdInDialogueBox
	b _0238C7E4
_0238BE08:
	mov r0, #3
	b _0238C7E8
_0238BE10:
	ldrsb r0, [r3, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0x44
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	b _0238C7E4
_0238BE60:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldrne r1, [r1]
	strne r0, [r1, #0x1c]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0238C7E4
_0238BE84: ; jump table
	b _0238C7E4 ; case 0
	b _0238BEF8 ; case 1
	b _0238C7E4 ; case 2
	b _0238C7E4 ; case 3
	b _0238C7E4 ; case 4
	b _0238C7E4 ; case 5
	b _0238BEE8 ; case 6
	b _0238BEA8 ; case 7
	b _0238BED8 ; case 8
_0238BEA8:
	ldr r0, _0238C8E4 ; =OVERLAY21_JP_STRING
	bl Debug_Print0
	bl ov21_0238C920
	bl ov11_0230B694
	cmp r0, #0
	bne _0238BECC
	mov r0, #0x38
	bl ov21_0238A140
	b _0238C7E4
_0238BECC:
	mov r0, #9
	bl ov21_0238A140
	b _0238C7E4
_0238BED8:
	bl ov21_0238C920
	mov r0, #0x24
	bl ov21_0238A140
	b _0238C7E4
_0238BEE8:
	bl ov21_0238C920
	mov r0, #2
	bl ov21_0238A140
	b _0238C7E4
_0238BEF8:
	bl ov21_0238C920
	mov r0, #3
	bl ov21_0238A140
	b _0238C7E4
_0238BF08:
	ldr r0, [r3, #8]
	cmp r0, #0
	beq _0238BF20
	cmp r0, #1
	beq _0238BF50
	b _0238C7E4
_0238BF20:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	bl ov11_0230D92C
	bl ov21_0238C920
	bl ov11_0230B9BC
	b _0238C7E4
_0238BF50:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov21_0238A140
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238C7E4
_0238BF80:
	bl sub_0203A5A8
	cmp r0, #0
	beq _0238BFEC
	bl sub_0203A9EC
	cmp r0, #0
	beq _0238C7E4
	add r1, sp, #6
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #6]
	tst r0, #8
	beq _0238C7E4
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_0203AAB0
	ldr r1, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	str r0, [r1, #0x914]
	bl sub_0203A5F0
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x27
	ldr r2, [r0]
	mov r1, #0x28
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238BFEC:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	beq _0238C014
	ldr r1, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	str r0, [r1, #0x914]
	mov r0, #0x26
	bl ov21_0238A140
	b _0238C7E4
_0238C014:
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x27
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C034:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0238C7E4
_0238C048: ; jump table
	b _0238C7E4 ; case 0
	b _0238C108 ; case 1
	b _0238C7E4 ; case 2
	b _0238C7E4 ; case 3
	b _0238C7E4 ; case 4
	b _0238C7E4 ; case 5
	b _0238C7E4 ; case 6
	b _0238C7E4 ; case 7
	b _0238C078 ; case 8
	b _0238C09C ; case 9
	b _0238C0C0 ; case 10
	b _0238C0E4 ; case 11
_0238C078:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x27
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C09C:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x27
	ldr r2, [r0]
	mov r1, #0x28
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C0C0:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x27
	ldr r2, [r0]
	mov r1, #0x2a
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C0E4:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x27
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C108:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0x25
	ldr r0, [r0]
	str r1, [r0]
	bl sub_0203A638
	b _0238C7E4
_0238C124:
	bl sub_0203F398
	cmp r0, #1
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x29
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C150:
	bl sub_020407EC
	cmp r0, #1
	bne _0238C17C
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x2b
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C17C:
	cmp r0, #2
	cmpne r0, #7
	bne _0238C7E4
	bl sub_0203FD38
	ldr r2, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x1a
	add r0, r0, #0x900
	bl MemcpySimple
	bl sub_02041094
	ldr r2, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov ip, #0x2b
	ldr r1, [r2]
	mov r3, #0x2c
	add r1, r1, #0x900
	strh r0, [r1, #0x18]
	ldr r0, [r2]
	str ip, [r0]
	ldr r0, [r2]
	str r3, [r0, #4]
	b _0238C7E4
_0238C1D8:
	bl sub_02041A18
	cmp r0, #1
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x2d
	ldr r2, [r0]
	mov r1, #0x2a
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C204:
	bl sub_02041B7C
	cmp r0, #1
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x2f
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C230:
	bl ov11_0230BA64
	cmp r0, #2
	beq _0238C248
	cmp r0, #3
	beq _0238C268
	b _0238C284
_0238C248:
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x32
	ldr r2, [r0]
	mov r1, #0x35
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C268:
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0xe
	bl ov11_0230B8C0
	mov r0, #0x33
	bl ov21_0238A140
	b _0238C7E4
_0238C284:
	bl ov11_0230BD28
	cmp r0, #0
	beq _0238C7E4
	add r1, sp, #8
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #8]
	tst r0, #8
	beq _0238C7E4
	ldr r0, _0238C8D4 ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0xe
	bl ov11_0230B8C0
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x34
	ldr r2, [r0]
	mov r1, #0x32
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C7E4
_0238C2E8:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238C324
	cmp r0, #6
	bne _0238C7E4
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x32
	ldr r2, [r0]
	mov r1, #0x34
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C324:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0x31
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230BCF8
	b _0238C7E4
_0238C340:
	ldrsb r0, [r3, #0x85]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x85]
	bl CloseScrollBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x31
	strb r2, [r1, #0x85]
	bl ov21_0238A140
	b _0238C7E4
_0238C37C:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238C3B0
	cmp r0, #4
	beq _0238C3A0
	cmp r0, #5
	beq _0238C3B0
	b _0238C7E4
_0238C3A0:
	bl ov21_0238C920
	mov r0, #0x24
	bl ov21_0238A140
	b _0238C7E4
_0238C3B0:
	bl ov21_0238C920
	mov r0, #1
	bl ov21_0238A140
	b _0238C7E4
_0238C3C0:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #0xc
	bgt _0238C3F0
	bge _0238C3FC
	cmp r0, #5
	bgt _0238C7E4
	cmp r0, #1
	blt _0238C7E4
	cmpne r0, #5
	beq _0238C41C
	b _0238C7E4
_0238C3F0:
	cmp r0, #0xd
	beq _0238C40C
	b _0238C7E4
_0238C3FC:
	bl ov21_0238C920
	mov r0, #0x22
	bl ov21_0238A140
	b _0238C7E4
_0238C40C:
	bl ov21_0238C920
	mov r0, #0x23
	bl ov21_0238A140
	b _0238C7E4
_0238C41C:
	bl ov21_0238C920
	mov r0, #1
	bl ov21_0238A140
	b _0238C7E4
_0238C42C:
	bl ov11_0230BA64
	cmp r0, #2
	beq _0238C444
	cmp r0, #3
	beq _0238C464
	b _0238C4EC
_0238C444:
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x3c
	ldr r2, [r0]
	mov r1, #0x40
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C464:
	bl ov11_0230B874
	ldr r1, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r1, [r1]
	ldrh r1, [r1, #0xd8]
	cmp r0, r1
	bge _0238C4A0
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0x18
	bl ov11_0230B8C0
	mov r0, #0x3e
	bl ov21_0238A140
	b _0238C7E4
_0238C4A0:
	bne _0238C7E4
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r2, [r0]
	add r3, r2, #0x42
	add r0, r2, #0xda
	add r1, r2, #0xdc
	add r2, r2, #0x140
	add r3, r3, #0x100
	bl ov11_0230C118
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x3c
	ldr r2, [r0]
	mov r1, #0x10
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C4EC:
	bl ov11_0230BD28
	cmp r0, #0
	beq _0238C7E4
	add r1, sp, #0xa
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0xa]
	tst r0, #8
	beq _0238C7E4
	ldr r0, _0238C8D4 ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	add r0, r0, #0x18
	bl ov11_0230B8C0
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x3f
	ldr r2, [r0]
	mov r1, #0x3d
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C7E4
_0238C550:
	ldrsb r0, [r3, #0x83]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238C58C
	cmp r0, #6
	bne _0238C7E4
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r3, #0x3d
	ldr r2, [r0]
	mov r1, #0x3f
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C7E4
_0238C58C:
	bl ov21_0238C920
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0x3a
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230BCF8
	b _0238C7E4
_0238C5A8:
	ldrsb r0, [r3, #0x85]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x85]
	bl CloseScrollBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x3b
	strb r2, [r1, #0x85]
	bl ov21_0238A140
	b _0238C7E4
_0238C5E4:
	ldr r1, [r3, #8]
	add r1, r1, #1
	str r1, [r3, #8]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	beq _0238C60C
	cmp r0, #3
	beq _0238C708
	b _0238C7E4
_0238C60C:
	cmp r2, #0x3c
	bgt _0238C658
	bge _0238C6F8
	sub r0, r2, #0x27
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0238C7E4
_0238C628: ; jump table
	b _0238C674 ; case 0
	b _0238C7E4 ; case 1
	b _0238C67C ; case 2
	b _0238C7E4 ; case 3
	b _0238C694 ; case 4
	b _0238C7E4 ; case 5
	b _0238C6C4 ; case 6
	b _0238C7E4 ; case 7
	b _0238C6EC ; case 8
	b _0238C7E4 ; case 9
	b _0238C7E4 ; case 10
	b _0238C6F8 ; case 11
_0238C658:
	cmp r2, #0x3d
	bgt _0238C668
	beq _0238C700
	b _0238C7E4
_0238C668:
	cmp r2, #0x43
	beq _0238C700
	b _0238C7E4
_0238C674:
	bl sub_0203A51C
	b _0238C7E4
_0238C67C:
	bl sub_0203F990
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x85]
	b _0238C7E4
_0238C694:
	ldr r0, [r1, #0x914]
	bl sub_0203FD80
	bl sub_020407C0
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x82]
	bl CloseAdvancedTextBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x82]
	b _0238C7E4
_0238C6C4:
	bl sub_02041A00
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x85]
	bl CloseScrollBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x85]
	b _0238C7E4
_0238C6EC:
	bl sub_020420F4
	bl sub_020572EC
	b _0238C7E4
_0238C6F8:
	bl ov11_0230B9BC
	b _0238C7E4
_0238C700:
	bl ov11_0230BB1C
	b _0238C7E4
_0238C708:
	ldr r0, [r1, #4]
	bl ov21_0238A140
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238C7E4
_0238C724:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r2, [r0]
	ldr r1, [r2, #8]
	add r1, r1, #1
	str r1, [r2, #8]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _0238C7E4
	mov r0, #0x42
	bl ov21_0238A140
	mvn r0, #0
	mov r1, #0
	bl InitRandomNpcJobs
	bl ov11_0230D92C
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0, #8]
	b _0238C7E4
_0238C788:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov21_0238A140
	b _0238C7E4
_0238C7A8:
	ldr r0, [r3, #4]
	bl ov21_0238A140
	b _0238C7E4
_0238C7B4:
	ldrsb r0, [r3, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238C7E4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl ShowDialogueBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov21_0238A140
_0238C7E4:
	mov r0, #0
_0238C7E8:
	cmp r0, #3
	bne _0238C914
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r2, #2
	ldr r1, [r0]
	str r2, [r1, #0x2c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202836C
	b _0238C914
_0238C830:
	mov r1, #3
	str r1, [r3, #0x2c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl CloseDialogueBox
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl ClosePortraitBox
	b _0238C914
_0238C858:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238C914
	mov r0, #1
	bl ov11_022E6E8C
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0x2c]
	b _0238C914
_0238C880:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238C914
	mov r0, #2
	bl ov11_022E6E8C
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0x2c]
	b _0238C914
_0238C8A8:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238C914
	mov r0, #3
	bl ov11_022E6E8C
	ldr r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #0x2c]
	b _0238C914
	.align 2, 0
_0238C8D0: .word OVERLAY21_UNKNOWN_POINTER__NA_238CF40
_0238C8D4: .word 0x00003F02
_0238C8D8: .word 0x00001308
_0238C8DC: .word 0x00003018
#ifndef JAPAN
_0238C8E0: .word 0x000003B9
#endif
_0238C8E4: .word OVERLAY21_JP_STRING
_0238C8E8:
	bl ov11_022E6EC8
	cmp r0, #0
	ldrne r0, _0238C8D0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	movne r1, #1
	ldrne r0, [r0]
	strne r1, [r0, #0x2c]
	b _0238C914
_0238C904:
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	b _0238C918
_0238C914:
	mov r0, #1
_0238C918:
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov21_0238B928

	arm_func_start ov21_0238C920
ov21_0238C920: ; 0x0238C920
	stmdb sp!, {r3, lr}
	ldr r0, _0238C9A0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x84]
	cmp r0, r1
	beq _0238C960
	bl sub_0202836C
	ldr r0, _0238C9A0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x84]
	bl CloseTextBox
	ldr r0, _0238C9A0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x84]
_0238C960:
	ldr r0, _0238C9A0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x83]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0238C9A0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	ldr r0, [r0]
	ldrsb r0, [r0, #0x83]
	bl CloseSimpleMenu
	ldr r0, _0238C9A0 ; =OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x83]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C9A0: .word OVERLAY21_UNKNOWN_POINTER__NA_238CF40
	arm_func_end ov21_0238C920

	arm_func_start ov21_0238C9A4
ov21_0238C9A4: ; 0x0238C9A4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	bl GetMoneyCarried
	add ip, sp, #0x400
	str r0, [sp, #0x428]
	add ip, ip, #4
	ldr r2, _0238CA1C ; =ov21_0238CF24
	ldr r3, _0238CA20 ; =0x0000C402
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
	ldr r3, _0238CA24 ; =0x00000225
	mov r0, r4
	mov r1, #4
	mov r2, #2
#endif
	bl sub_02026268
	mov r0, r4
	mov r1, #0x16
	mov r2, #0x10
	add r3, sp, #4
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238CA1C: .word ov21_0238CF24
_0238CA20: .word 0x0000C402
#ifndef JAPAN
_0238CA24: .word 0x00000225
#endif
	arm_func_end ov21_0238C9A4
	; 0x0238CA28

	.rodata
	.global SWAP_SHOP_WINDOW_PARAMS_1
SWAP_SHOP_WINDOW_PARAMS_1:
#ifdef JAPAN
#define OV21_DATA_OFFSET 0x2EDF
#define OV21_DATA_OFFSET_2 0x2D00
#else
#define OV21_DATA_OFFSET 0
#define OV21_DATA_OFFSET_2 0
#endif
		.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x04, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global SWAP_SHOP_MENU_ITEMS_CONFIRM
SWAP_SHOP_MENU_ITEMS_CONFIRM:
	.word 0x3AB + OV21_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3AC + OV21_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global SWAP_SHOP_SUBMENU_ITEMS_1
SWAP_SHOP_SUBMENU_ITEMS_1:
	.word 0x3B0 + OV21_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3AD + OV21_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global SWAP_SHOP_SUBMENU_ITEMS_2
SWAP_SHOP_SUBMENU_ITEMS_2:
	.word 0x3CD + OV21_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00
	.word 0x3CE + OV21_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3CF + OV21_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global SWAP_SHOP_MAIN_MENU_ITEMS_1
SWAP_SHOP_MAIN_MENU_ITEMS_1:
	.word 0x3AE + OV21_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3B0 + OV21_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3B1 + OV21_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global SWAP_SHOP_MAIN_MENU_ITEMS_2
SWAP_SHOP_MAIN_MENU_ITEMS_2:
	.word 0x3AE + OV21_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3AF + OV21_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3B0 + OV21_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3AD + OV21_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global SWAP_SHOP_SUBMENU_ITEMS_3
SWAP_SHOP_SUBMENU_ITEMS_3:
	.word 0x3AF + OV21_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x2ED + OV21_DATA_OFFSET_2
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x2EE + OV21_DATA_OFFSET_2
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x2EF + OV21_DATA_OFFSET_2
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x3B1 + OV21_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.hword 0x3B2 + OV21_DATA_OFFSET, 0x3B3 + OV21_DATA_OFFSET, 0x3C5 + OV21_DATA_OFFSET, 0x3C8 + OV21_DATA_OFFSET
	.hword 0x3B6 + OV21_DATA_OFFSET, 0x3B9 + OV21_DATA_OFFSET, 0x3B4 + OV21_DATA_OFFSET, 0x3B5 + OV21_DATA_OFFSET, 0x3BB + OV21_DATA_OFFSET, 0x3BC + OV21_DATA_OFFSET, 0x3B8 + OV21_DATA_OFFSET, 0x3BE + OV21_DATA_OFFSET
	.hword 0x3C2 + OV21_DATA_OFFSET, 0x3C3 + OV21_DATA_OFFSET, 0x3BF + OV21_DATA_OFFSET, 0x3C0 + OV21_DATA_OFFSET, 0x3C1 + OV21_DATA_OFFSET, 0x3BA + OV21_DATA_OFFSET, 0x3C4 + OV21_DATA_OFFSET, 0x3C6 + OV21_DATA_OFFSET
	.hword 0x3CA + OV21_DATA_OFFSET, 0x3CB + OV21_DATA_OFFSET, 0x3CC + OV21_DATA_OFFSET, 0x3B7 + OV21_DATA_OFFSET, 0x3BD + OV21_DATA_OFFSET, 0x3D0 + OV21_DATA_OFFSET, 0x3C7 + OV21_DATA_OFFSET
	.byte 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x10, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x0A, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x0F, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global SWAP_SHOP_WINDOW_PARAMS_5
SWAP_SHOP_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global SWAP_SHOP_WINDOW_PARAMS_6
SWAP_SHOP_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global SWAP_SHOP_WINDOW_PARAMS_7
SWAP_SHOP_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global SWAP_SHOP_WINDOW_PARAMS_8
SWAP_SHOP_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global SWAP_SHOP_WINDOW_PARAMS_9
SWAP_SHOP_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x02, 0x0A, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov21_0238CBB8
ov21_0238CBB8:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D
	.byte 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00
	.global ov21_0238CBD4
ov21_0238CBD4:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F
	.byte 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x4D, 0x45, 0x4E, 0x55, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov21_0238CBF8
ov21_0238CBF8:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D
	.byte 0x4F, 0x44, 0x45, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CC18
ov21_0238CC18:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D
	.byte 0x4F, 0x44, 0x45, 0x5F, 0x45, 0x58, 0x50, 0x4C, 0x41, 0x4E, 0x41, 0x54, 0x49, 0x4F, 0x4E, 0x3A
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CC3C
ov21_0238CC3C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov21_0238CC5C
ov21_0238CC5C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x49, 0x54, 0x45, 0x4D, 0x5F, 0x4E, 0x4F, 0x4E
	.byte 0x3A, 0x0A, 0x00, 0x00
	.global ov21_0238CC7C
ov21_0238CC7C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x4F, 0x4C, 0x44, 0x5F, 0x4E, 0x4F, 0x4E
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CC9C
ov21_0238CC9C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x47, 0x4F, 0x4C, 0x44, 0x81, 0x51, 0x4E, 0x4F, 0x5F, 0x43, 0x48, 0x41, 0x52
	.byte 0x47, 0x45, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov21_0238CCC0
ov21_0238CCC0:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E
	.byte 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45
	.byte 0x43, 0x54, 0x5F, 0x46, 0x55, 0x4C, 0x4C, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CCE4
ov21_0238CCE4:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F
	.byte 0x51, 0x55, 0x49, 0x54, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CD00
ov21_0238CD00:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E
	.byte 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45
	.byte 0x43, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00, 0x00
	.global ov21_0238CD24
ov21_0238CD24:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F
	.byte 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00, 0x00
	.global ov21_0238CD44
ov21_0238CD44:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F
	.byte 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x49, 0x4E, 0x49, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CD68
ov21_0238CD68:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D
	.byte 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43
	.byte 0x54, 0x3A, 0x0A, 0x00
	.global ov21_0238CD8C
ov21_0238CD8C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x52
	.byte 0x45, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CDB4
ov21_0238CDB4:
	.byte 0x09, 0x4D, 0x45, 0x4E
	.byte 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45, 0x4E, 0x55
	.byte 0x3A, 0x0A, 0x00, 0x00
	.global ov21_0238CDDC
ov21_0238CDDC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x45
	.byte 0x58, 0x50, 0x4C, 0x41, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CE00
ov21_0238CE00:
	.byte 0x5B, 0x69, 0x74, 0x65, 0x6D, 0x3A, 0x30, 0x5D
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov21_0238CE0C
ov21_0238CE0C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x43
	.byte 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x5F, 0x31, 0x3A, 0x0A, 0x00, 0x00
	.global ov21_0238CE34
ov21_0238CE34:
	.byte 0x5F, 0x53, 0x45, 0x4C
	.byte 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x5F, 0x31, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov21_0238CE4C
ov21_0238CE4C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53
	.byte 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x54
	.byte 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x5F, 0x41, 0x43, 0x54, 0x49, 0x4F, 0x4E, 0x3A, 0x0A, 0x00, 0x00
	.global ov21_0238CE78
ov21_0238CE78:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D
	.byte 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B
	.byte 0x53, 0x5F, 0x41, 0x43, 0x54, 0x49, 0x4F, 0x4E, 0x32, 0x3A, 0x0A, 0x00
	.global ov21_0238CEA4
ov21_0238CEA4:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F
	.byte 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x5F, 0x41, 0x43
	.byte 0x54, 0x49, 0x4F, 0x4E, 0x33, 0x3A, 0x0A, 0x00
	.global ov21_0238CED0
ov21_0238CED0:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E
	.byte 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45
	.byte 0x43, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x5F, 0x31, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov21_0238CEF8
ov21_0238CEF8:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x53, 0x59, 0x4E, 0x54, 0x48, 0x45, 0x53, 0x49, 0x53, 0x5F, 0x4D
	.byte 0x4F, 0x44, 0x45, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B
	.byte 0x53, 0x3A, 0x0A, 0x00
	.global OVERLAY21_JP_STRING
OVERLAY21_JP_STRING:
	.byte 0x8D, 0x87, 0x90, 0xAC, 0x81, 0x46, 0x00, 0x00
	.global ov21_0238CF24
ov21_0238CF24:
	.byte 0x5B, 0x43, 0x53, 0x3A
	.byte 0x56, 0x5D, 0x5B, 0x67, 0x6F, 0x6C, 0x64, 0x3A, 0x30, 0x5D, 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00

	.data
	.global OVERLAY21_UNKNOWN_POINTER__NA_238CF40
OVERLAY21_UNKNOWN_POINTER__NA_238CF40:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
