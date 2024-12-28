	.include "asm/macros.inc"
	.include "overlay_23.inc"

	.text

	arm_func_start ov23_0238A140
ov23_0238A140: ; 0x0238A140
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x30c
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r1]
	str r0, [r2, #8]
	ldr r2, [r1]
	ldr r0, [r2, #8]
	cmp r0, #0x2b
	addls pc, pc, r0, lsl #2
	b _0238B230
_0238A168: ; jump table
	b _0238A218 ; case 0
	b _0238A3B8 ; case 1
	b _0238A404 ; case 2
	b _0238A454 ; case 3
	b _0238A6F8 ; case 4
	b _0238A4A4 ; case 5
	b _0238A4F4 ; case 6
	b _0238A544 ; case 7
	b _0238A594 ; case 8
	b _0238A634 ; case 9
	b _0238A6A8 ; case 10
	b _0238A5E4 ; case 11
	b _0238A704 ; case 12
	b _0238A758 ; case 13
	b _0238A7A4 ; case 14
	b _0238A800 ; case 15
	b _0238A85C ; case 16
	b _0238A8FC ; case 17
	b _0238A938 ; case 18
	b _0238AA1C ; case 19
	b _0238AAC0 ; case 20
	b _0238ABCC ; case 21
	b _0238ABCC ; case 22
	b _0238AC68 ; case 23
	b _0238ACBC ; case 24
	b _0238AD0C ; case 25
	b _0238AD74 ; case 26
	b _0238ADCC ; case 27
	b _0238AE00 ; case 28
	b _0238AE3C ; case 29
	b _0238AEEC ; case 30
	b _0238AFC8 ; case 31
	b _0238B0A0 ; case 32
	b _0238B0A0 ; case 33
	b _0238B230 ; case 34
	b _0238A2A0 ; case 35
	b _0238B230 ; case 36
	b _0238AF94 ; case 37
	b _0238B06C ; case 38
	b _0238AB64 ; case 39
	b _0238AB98 ; case 40
	b _0238B230 ; case 41
	b _0238B230 ; case 42
	b _0238AD54 ; case 43
_0238A218:
	mov r1, #1
	mov r0, #0
	strb r1, [r2, #0x88]
	bl CreateDialogueBox
	ldr r2, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r4, #0x73
	ldr r3, [r2]
	mov r1, #3
	strb r0, [r3, #0x95]
	ldr r3, [r2]
	mov r0, #0
	mov r2, #1
	str r4, [r3, #0x9c]
	bl CreatePortraitBox
	ldr r2, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, r4
	ldr r3, [r2]
	strb r0, [r3, #0x96]
	ldr r0, [r2]
	add r0, r0, #0x1ac
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1ac
	bl SetPortraitLayout
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, _0238B0E0 ; =0x00003008
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C644 ; =0x00003255
#else
	mov r2, #0x318
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A2A0:
	ldr r0, _0238B0E4 ; =ov23_0238D448
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r3, [r0]
	add r1, r3, #0x90
	str r1, [sp, #0x6c]
	ldr r1, [r3]
	cmp r1, #1
	bne _0238A34C
	mov r2, #0
	strb r2, [r3, #0x90]
	ldr r1, [r0]
	strb r2, [r1, #0x91]
	ldr r0, [r0]
	strb r2, [r0, #0x92]
	bl GetNbItemsInBag
	cmp r0, #0
	ldreq r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	moveq r1, #3
	ldreq r0, [r0]
	streqb r1, [r0, #0x90]
	beq _0238A314
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	ldrne r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #3
	ldrne r0, [r0]
	strneb r1, [r0, #0x90]
_0238A314:
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	ldrne r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #3
	ldrne r0, [r0]
	strneb r1, [r0, #0x91]
	bne _0238A34C
	bl IsBagFull
	cmp r0, #0
	ldrne r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #3
	ldrne r0, [r0]
	strneb r1, [r0, #0x91]
_0238A34C:
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _0238A38C
	mov r4, #3
	ldr r0, _0238B0E8 ; =STORAGE_WINDOW_PARAMS_8
	ldr r3, _0238B0EC ; =STORAGE_MAIN_MENU_ITEMS_2
	add r2, sp, #0xc
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238A38C:
	ldr r0, _0238B0F0 ; =STORAGE_WINDOW_PARAMS_4
	mov r4, #4
	ldr r1, _0238B0F4 ; =0x00300013
	ldr r3, _0238B0F8 ; =STORAGE_MAIN_MENU_ITEMS_4
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238A3B8:
	ldr r0, _0238B0FC ; =ov23_0238D468
	bl Debug_Print0
	bl sub_02042AF8
	bl sub_020434D4
	bl ov23_0238D098
	mov r3, #0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r4, #0x73
	ldr r2, [r0]
	ldr r1, _0238B0E0 ; =0x00003008
	strb r3, [r2, #0x88]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C664 ; =0x00003256
#else
	rsb r2, r4, #0x38c
#endif
	str r4, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A404:
	ldr r0, _0238B100 ; =ov23_0238D484
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x250
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r4, #0x2b8
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A454:
	ldr r0, _0238B108 ; =ov23_0238D4A4
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #4
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238B10C ; =0x0000031A
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A4A4:
	ldr r0, _0238B110 ; =ov23_0238D4C0
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238C67C ; =0x00003262
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	rsb r2, r4, #0x398
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A4F4:
	ldr r0, _0238B114 ; =ov23_0238D4DC
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238B118 ; =0x00000326
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A544:
	ldr r0, _0238B11C ; =ov23_0238D4F8
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x24c
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r4, #0x2b4
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A594:
	ldr r0, _0238B120 ; =ov23_0238D51C
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238B124 ; =0x0000032A
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A5E4:
	ldr r0, _0238B128 ; =ov23_0238D540
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C698 ; =0x00003269
#else
	mov r2, #0x32c
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A634:
	ldr r0, _0238B12C ; =ov23_0238D55C
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0xf
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r1, [r0]
	ldr r2, _0238B130 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	str r3, [r1, #0x9c]
	ldr r1, [r0]
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, _0238B104 ; =0x00003018
	ldr r4, [r0]
#ifdef JAPAN
	ldr r2, _0238C6A4 ; =0x00003265
#else
	mov r2, #0x328
#endif
	add r3, r4, #0x12c
	str r3, [r4, #0xd4]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A6A8:
	ldr r0, _0238B134 ; =ov23_0238D578
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #0xf
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #0xf
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238C6AC ; =0x00003266
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	rsb r2, r4, #0x39c
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A6F8:
	ldr r0, _0238B138 ; =ov23_0238D594
	bl Debug_Print0
	b _0238B230
_0238A704:
	ldr r0, _0238B13C ; =ov23_0238D5AC
	bl Debug_Print0
	bl sub_02042730
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #0xe
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x240
#else
	mov r4, #0x73
	mov r2, #0xe
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0xc]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	strb r3, [r2, #0x88]
	ldr r3, [r0]
	add r2, r4, #0x2a8
	str r4, [r3, #0x9c]
	ldr r3, [r0]
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A758:
	ldr r0, _0238B140 ; =ov23_0238D5CC
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0xf
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C6BC ; =0x00003259
#else
	mov r2, #0x31c
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238A7A4:
	ldr r0, _0238B144 ; =ov23_0238D5E8
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	mov r0, #3
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x97]
	b _0238B230
_0238A800:
	ldr r0, _0238B148 ; =ov23_0238D608
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	mov r0, #3
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x97]
	b _0238B230
_0238A85C:
	ldr r0, _0238B14C ; =ov23_0238D628
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	add r0, r1, #0x90
	str r0, [sp, #0x104]
	ldr r0, [r1]
	cmp r0, #1
	bne _0238A8B0
	ldrsh r0, [r1, #0x1c]
	bl IsStorableItem
	cmp r0, #0
	ldrne r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x90]
	ldreq r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	moveq r1, #3
	ldreq r0, [r0]
	streqb r1, [r0, #0x90]
	b _0238A8B8
_0238A8B0:
	mov r0, #0
	strb r0, [r1, #0x90]
_0238A8B8:
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0
	ldr r1, [r0]
	mov r4, #3
	strb r2, [r1, #0x91]
	ldr r1, [r0]
	ldr r0, _0238B150 ; =STORAGE_WINDOW_PARAMS_5
	strb r2, [r1, #0x92]
	ldr r3, _0238B154 ; =STORAGE_MAIN_MENU_ITEMS_3
	add r2, sp, #0xa4
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238A8FC:
	ldr r0, _0238B158 ; =ov23_0238D64C
	bl Debug_Print0
	ldr r0, _0238B15C ; =OVERLAY23_UNKNOWN_VALUE__NA_238D2EC
	mov r4, #3
	str r0, [sp, #0x19c]
	ldr r0, _0238B150 ; =STORAGE_WINDOW_PARAMS_5
	ldr r3, _0238B154 ; =STORAGE_MAIN_MENU_ITEMS_3
	add r2, sp, #0x13c
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238A938:
	ldr r0, _0238B160 ; =ov23_0238D670
	bl Debug_Print0
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, _0238B164 ; =ov23_0238D68C
	ldr r2, [r1]
	ldrsh r1, [r2, #0x1c]
	ldrh r2, [r2, #0x1a]
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov lr, #0
	ldr ip, [r0]
	ldr r2, _0238B168 ; =ov23_0238D69C
	ldrh r4, [ip, #0x1a]
	ldr r3, _0238B16C ; =0x0000C402
	mov r1, #0x400
	str r4, [ip, #0x9c]
	ldr ip, [r0]
	ldrsh r4, [ip, #0x1c]
	str r4, [ip, #0xac]
	ldr ip, [r0]
	ldrh r4, [ip, #0x1a]
	str r4, [ip, #0xc0]
	ldr r4, [r0]
	ldrh ip, [r4, #0x1a]
	add ip, ip, #0xbc
	str ip, [r4, #0xb4]
	ldr ip, [r0]
	str lr, [ip, #0xc8]
	ldr r0, [r0]
	add ip, r0, #0x9c
	add r0, r0, #0xec
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x1d4
	bl InitPreprocessorArgs
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	add r1, sp, #0x1d4
	ldr r3, [r0]
	ldr r0, _0238B170 ; =STORAGE_WINDOW_PARAMS_7
	add r2, r3, #0xec
	str r2, [sp, #0x20c]
	str r1, [sp]
	ldrsh r2, [r3, #0x1c]
	add r3, r3, #0x9c
	ldr r1, _0238B174 ; =0x00001013
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
	ldr r3, _0238B178 ; =0x00000315
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x9a]
	b _0238B230
_0238AA1C:
	ldr r0, _0238B17C ; =ov23_0238D6A8
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238AA54
	bl ov23_0238D278
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238B230
_0238AA54:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	mov r2, #0x24
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x27
	str r2, [r1, #0xc]
	ldr r1, [r0]
	ldr r2, _0238B130 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238B0E0 ; =0x00003008
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C6FC ; =0x0000325A
#else
	rsb r2, ip, #0x390
#endif
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238AAC0:
	ldr r0, _0238B180 ; =ov23_0238D6CC
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238AAF8
	bl ov23_0238D1B8
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238B230
_0238AAF8:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	mov r2, #0x24
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x28
	str r2, [r1, #0xc]
	ldr r1, [r0]
	ldr r2, _0238B130 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238B0E0 ; =0x00003008
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
	ldr r2, _0238B184 ; =0x0000031E
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238AB64:
	ldr r0, _0238B188 ; =ov23_0238D6F0
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238B18C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238B0F4 ; =0x00300013
	ldr r3, _0238B190 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238AB98:
	ldr r0, _0238B194 ; =ov23_0238D708
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238B18C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238B0F4 ; =0x00300013
	ldr r3, _0238B190 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238ABCC:
	ldr r0, _0238B198 ; =ov23_0238D71C
	bl Debug_Print0
	bl ov11_022DC504
	bl GetNbItemsInBag
	cmp r0, #0
	beq _0238ABF4
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	beq _0238AC08
_0238ABF4:
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238AC28
_0238AC08:
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0x16
	moveq r0, #1
	streq r0, [r1, #0xc]
	movne r0, #0xd
	strne r0, [r1, #0xc]
_0238AC28:
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov ip, #0x73
	ldr r1, [r0]
	mov r2, #1
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x244
#else
	str ip, [r2, #0x9c]
	ldr r3, [r0]
	add r2, ip, #0x2ac
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238AC68:
	ldr r0, _0238B19C ; =ov23_0238D73C
	bl Debug_Print0
	bl sub_02043218
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x19
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C720 ; =0x0000325D
#else
	mov r2, #0x320
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238ACBC:
	ldr r0, _0238B1A0 ; =ov23_0238D75C
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #0x19
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #0x19
	ldr r1, [r0]
	mov ip, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238C728_JP ; =0x0000325E
#else
	str ip, [r2, #0x9c]
	ldr r3, [r0]
	rsb r2, ip, #0x394
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238AD0C:
	ldr r0, _0238B1A4 ; =ov23_0238D77C
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0x2b
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	b _0238B230
_0238AD54:
	mov r0, #1
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x98]
	b _0238B230
_0238AD74:
	ldr r0, _0238B1A8 ; =ov23_0238D79C
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	mov r0, #1
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x98]
	b _0238B230
_0238ADCC:
	ldr r0, _0238B1AC ; =ov23_0238D7BC
	bl Debug_Print0
	mov ip, #3
	ldr r0, _0238B150 ; =STORAGE_WINDOW_PARAMS_5
	ldr r3, _0238B1B0 ; =STORAGE_MAIN_MENU_ITEMS_1
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238AE00:
	ldr r0, _0238B1AC ; =ov23_0238D7BC
	bl Debug_Print0
	ldr r0, _0238B1B4 ; =OVERLAY23_UNKNOWN_VALUE__NA_238D2E8
	mov ip, #3
	str r0, [sp, #0x284]
	ldr r0, _0238B150 ; =STORAGE_WINDOW_PARAMS_5
	ldr r3, _0238B1B0 ; =STORAGE_MAIN_MENU_ITEMS_1
	add r2, sp, #0x224
	add r1, ip, #0x210
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238AE3C:
	ldr r0, _0238B1B8 ; =ov23_0238D7E0
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, _0238B168 ; =ov23_0238D69C
	ldr lr, [r0]
	ldr r3, _0238B16C ; =0x0000C402
	ldrh ip, [lr, #0x1a]
	mov r1, #0x400
	str ip, [lr, #0x9c]
	ldr lr, [r0]
	ldrsh ip, [lr, #0x1c]
	str ip, [lr, #0xac]
	ldr lr, [r0]
	ldrh ip, [lr, #0x1a]
	str ip, [lr, #0xc0]
	ldr r0, [r0]
	add ip, r0, #0x9c
	add r0, r0, #0xec
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x2bc
	bl InitPreprocessorArgs
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	add r1, sp, #0x2bc
	ldr r3, [r0]
	ldr r0, _0238B170 ; =STORAGE_WINDOW_PARAMS_7
	add r2, r3, #0xec
	str r2, [sp, #0x2f4]
	str r1, [sp]
	ldrsh r2, [r3, #0x1c]
	add r3, r3, #0x9c
	ldr r1, _0238B174 ; =0x00001013
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
	ldr r3, _0238B178 ; =0x00000315
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x9a]
	b _0238B230
_0238AEEC:
	ldr r0, _0238B1BC ; =ov23_0238D7FC
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238AF24
	bl ov23_0238D238
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238B230
_0238AF24:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	ldr r2, _0238B130 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238B0E0 ; =0x00003008
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
	ldr r2, _0238B1C0 ; =0x00000322
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x24
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238B230
_0238AF94:
	ldr r0, _0238B1C4 ; =ov23_0238D81C
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238B18C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238B0F4 ; =0x00300013
	ldr r3, _0238B190 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238AFC8:
	ldr r0, _0238B1C8 ; =ov23_0238D834
	bl Debug_Print0
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238B000
	bl ov23_0238D148
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238B230
_0238B000:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	mov r2, #0x24
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x26
	str r2, [r1, #0xc]
	ldr r1, [r0]
	ldr r2, _0238B130 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	ldr r1, _0238B0E0 ; =0x00003008
	ldr r3, [r0]
	mov ip, #0x73
#else
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238B0E0 ; =0x00003008
#endif
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x258
#else
	add r2, ip, #0x2b0
#endif
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238B230
_0238B06C:
	ldr r0, _0238B1CC ; =ov23_0238D854
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238B18C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238B0F4 ; =0x00300013
	ldr r3, _0238B190 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238B230
_0238B0A0:
	ldr r0, _0238B1D0 ; =ov23_0238D868
	bl Debug_Print0
	bl ov11_022DC504
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	bne _0238B0C8
	bl IsBagFull
	cmp r0, #0
	beq _0238B1D4
_0238B0C8:
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238B1F4
	.align 2, 0
#ifdef JAPAN
#define OV23_0238A140_OFFSET 0x2F3D
#else
#define OV23_0238A140_OFFSET 0
#endif
_0238B0DC: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
_0238B0E0: .word 0x00003008
#ifdef JAPAN
_0238C644: .word 0x00003255
#endif
_0238B0E4: .word ov23_0238D448
_0238B0E8: .word STORAGE_WINDOW_PARAMS_8
_0238B0EC: .word STORAGE_MAIN_MENU_ITEMS_2
_0238B0F0: .word STORAGE_WINDOW_PARAMS_4
_0238B0F4: .word 0x00300013
_0238B0F8: .word STORAGE_MAIN_MENU_ITEMS_4
_0238B0FC: .word ov23_0238D468
#ifdef JAPAN
_0238C664: .word 0x00003256
#endif
_0238B100: .word ov23_0238D484
_0238B104: .word 0x00003018
_0238B108: .word ov23_0238D4A4
_0238B10C: .word 0x0000031A + OV23_0238A140_OFFSET
_0238B110: .word ov23_0238D4C0
#ifdef JAPAN
_0238C67C: .word 0x00003262
#endif
_0238B114: .word ov23_0238D4DC
_0238B118: .word 0x00000326 + OV23_0238A140_OFFSET
_0238B11C: .word ov23_0238D4F8
_0238B120: .word ov23_0238D51C
_0238B124: .word 0x0000032A + OV23_0238A140_OFFSET
_0238B128: .word ov23_0238D540
#ifdef JAPAN
_0238C698: .word 0x00003269
#endif
_0238B12C: .word ov23_0238D55C
_0238B130: .word OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
#ifdef JAPAN
_0238C6A4: .word 0x00003265
_0238B134: .word ov23_0238D578
_0238C6AC: .word 0x00003266
#else
_0238B134: .word ov23_0238D578
#endif
_0238B138: .word ov23_0238D594
_0238B13C: .word ov23_0238D5AC
_0238B140: .word ov23_0238D5CC
#ifdef JAPAN
_0238C6BC: .word 0x00003259
#endif
_0238B144: .word ov23_0238D5E8
_0238B148: .word ov23_0238D608
_0238B14C: .word ov23_0238D628
_0238B150: .word STORAGE_WINDOW_PARAMS_5
_0238B154: .word STORAGE_MAIN_MENU_ITEMS_3
_0238B158: .word ov23_0238D64C
_0238B15C: .word OVERLAY23_UNKNOWN_VALUE__NA_238D2EC
_0238B160: .word ov23_0238D670
_0238B164: .word ov23_0238D68C
_0238B168: .word ov23_0238D69C
_0238B16C: .word 0x0000C402
_0238B170: .word STORAGE_WINDOW_PARAMS_7
_0238B174: .word 0x00001013
_0238B178: .word 0x00000315 + OV23_0238A140_OFFSET
_0238B17C: .word ov23_0238D6A8
#ifdef JAPAN
_0238C6FC: .word 0x0000325A
#endif
_0238B180: .word ov23_0238D6CC
_0238B184: .word 0x0000031E + OV23_0238A140_OFFSET
_0238B188: .word ov23_0238D6F0
_0238B18C: .word STORAGE_WINDOW_PARAMS_6
_0238B190: .word STORAGE_MENU_ITEMS_CONFIRM
_0238B194: .word ov23_0238D708
_0238B198: .word ov23_0238D71C
_0238B19C: .word ov23_0238D73C
#ifdef JAPAN
_0238C720: .word 0x0000325D
_0238B1A0: .word ov23_0238D75C
_0238C728_JP: .word 0x0000325E
#else
_0238B1A0: .word ov23_0238D75C
#endif
_0238B1A4: .word ov23_0238D77C
_0238B1A8: .word ov23_0238D79C
_0238B1AC: .word ov23_0238D7BC
_0238B1B0: .word STORAGE_MAIN_MENU_ITEMS_1
_0238B1B4: .word OVERLAY23_UNKNOWN_VALUE__NA_238D2E8
_0238B1B8: .word ov23_0238D7E0
_0238B1BC: .word ov23_0238D7FC
_0238B1C0: .word 0x00000322 + OV23_0238A140_OFFSET
_0238B1C4: .word ov23_0238D81C
_0238B1C8: .word ov23_0238D834
_0238B1CC: .word ov23_0238D854
_0238B1D0: .word ov23_0238D868
_0238B1D4:
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0x21
	moveq r0, #1
	streq r0, [r1, #0xc]
	movne r0, #0x18
	strne r0, [r1, #0xc]
_0238B1F4:
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238B0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238B104 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238C7C0 ; =0x00003261
#else
	mov r2, #0x324
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
_0238B230:
	add sp, sp, #0x30c
	ldmia sp!, {r3, r4, pc}
#ifdef JAPAN
	.align 2, 0
_0238C7C0: .word 0x00003261
#endif
	arm_func_end ov23_0238A140

	arm_func_start ov23_0238B238
ov23_0238B238: ; 0x0238B238
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x30c
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #0x2b
	addls pc, pc, r0, lsl #2
	b _0238C320
_0238B258: ; jump table
	b _0238B308 ; case 0
	b _0238B4A8 ; case 1
	b _0238B4F4 ; case 2
	b _0238B544 ; case 3
	b _0238B7E8 ; case 4
	b _0238B594 ; case 5
	b _0238B5E4 ; case 6
	b _0238B634 ; case 7
	b _0238B684 ; case 8
	b _0238B724 ; case 9
	b _0238B798 ; case 10
	b _0238B6D4 ; case 11
	b _0238B7F4 ; case 12
	b _0238B848 ; case 13
	b _0238B894 ; case 14
	b _0238B8F0 ; case 15
	b _0238B94C ; case 16
	b _0238B9EC ; case 17
	b _0238BA28 ; case 18
	b _0238BB0C ; case 19
	b _0238BBB0 ; case 20
	b _0238BCBC ; case 21
	b _0238BCBC ; case 22
	b _0238BD58 ; case 23
	b _0238BDAC ; case 24
	b _0238BDFC ; case 25
	b _0238BE64 ; case 26
	b _0238BEBC ; case 27
	b _0238BEF0 ; case 28
	b _0238BF2C ; case 29
	b _0238BFDC ; case 30
	b _0238C0B8 ; case 31
	b _0238C190 ; case 32
	b _0238C190 ; case 33
	b _0238C320 ; case 34
	b _0238B390 ; case 35
	b _0238C320 ; case 36
	b _0238C084 ; case 37
	b _0238C15C ; case 38
	b _0238BC54 ; case 39
	b _0238BC88 ; case 40
	b _0238C320 ; case 41
	b _0238C320 ; case 42
	b _0238BE44 ; case 43
_0238B308:
	mov r1, #1
	mov r0, #0
	strb r1, [r2, #0x88]
	bl CreateDialogueBox
	ldr r2, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r4, #0x73
	ldr r3, [r2]
	mov r1, #3
	strb r0, [r3, #0x95]
	ldr r3, [r2]
	mov r0, #0
	mov r2, #1
	str r4, [r3, #0x9c]
	bl CreatePortraitBox
	ldr r2, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, r4
	ldr r3, [r2]
	strb r0, [r3, #0x96]
	ldr r0, [r2]
	add r0, r0, #0x1ac
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1ac
	bl SetPortraitLayout
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, _0238C1D0 ; =0x00003008
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D760 ; =0x00003255
#else
	mov r2, #0x318
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B390:
	ldr r0, _0238C1D4 ; =ov23_0238D448
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r3, [r0]
	add r1, r3, #0x90
	str r1, [sp, #0x2d4]
	ldr r1, [r3]
	cmp r1, #1
	bne _0238B43C
	mov r2, #0
	strb r2, [r3, #0x90]
	ldr r1, [r0]
	strb r2, [r1, #0x91]
	ldr r0, [r0]
	strb r2, [r0, #0x92]
	bl GetNbItemsInBag
	cmp r0, #0
	ldreq r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	moveq r1, #3
	ldreq r0, [r0]
	streqb r1, [r0, #0x90]
	beq _0238B404
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	ldrne r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #3
	ldrne r0, [r0]
	strneb r1, [r0, #0x90]
_0238B404:
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	ldrne r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #3
	ldrne r0, [r0]
	strneb r1, [r0, #0x91]
	bne _0238B43C
	bl IsBagFull
	cmp r0, #0
	ldrne r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #3
	ldrne r0, [r0]
	strneb r1, [r0, #0x91]
_0238B43C:
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _0238B47C
	mov r4, #3
	ldr r0, _0238C1D8 ; =STORAGE_WINDOW_PARAMS_8
	ldr r3, _0238C1DC ; =STORAGE_MAIN_MENU_ITEMS_2
	add r2, sp, #0x274
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238B47C:
	ldr r0, _0238C1E0 ; =STORAGE_WINDOW_PARAMS_4
	mov r4, #4
	ldr r1, _0238C1E4 ; =0x00300013
	ldr r3, _0238C1E8 ; =STORAGE_MAIN_MENU_ITEMS_4
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238B4A8:
	ldr r0, _0238C1EC ; =ov23_0238D468
	bl Debug_Print0
	bl sub_02042AF8
	bl sub_020434D4
	bl ov23_0238D098
	mov r3, #0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r4, #0x73
	ldr r2, [r0]
	ldr r1, _0238C1D0 ; =0x00003008
	strb r3, [r2, #0x88]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D780 ; =0x00003256
#else
	rsb r2, r4, #0x38c
#endif
	str r4, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B4F4:
	ldr r0, _0238C1F0 ; =ov23_0238D484
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x250
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r4, #0x2b8
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B544:
	ldr r0, _0238C1F8 ; =ov23_0238D4A4
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #4
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238C1FC ; =0x0000031A
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B594:
	ldr r0, _0238C200 ; =ov23_0238D4C0
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238D798 ; =0x00003262
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	rsb r2, r4, #0x398
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B5E4:
	ldr r0, _0238C204 ; =ov23_0238D4DC
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238C208 ; =0x00000326
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B634:
	ldr r0, _0238C20C ; =ov23_0238D4F8
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x24c
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r4, #0x2b4
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B684:
	ldr r0, _0238C210 ; =ov23_0238D51C
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238C214 ; =0x0000032A
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B6D4:
	ldr r0, _0238C218 ; =ov23_0238D540
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D7B4 ; =0x00003269
#else
	mov r2, #0x32c
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B724:
	ldr r0, _0238C21C ; =ov23_0238D55C
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0xf
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r1, [r0]
	ldr r2, _0238C220 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	str r3, [r1, #0x9c]
	ldr r1, [r0]
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, _0238C1F4 ; =0x00003018
	ldr r4, [r0]
#ifdef JAPAN
	ldr r2, _0238D7C0 ; =0x00003265
#else
	mov r2, #0x328
#endif
	add r3, r4, #0x12c
	str r3, [r4, #0xd4]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B798:
	ldr r0, _0238C224 ; =ov23_0238D578
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #0xf
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #0xf
	ldr r1, [r0]
	mov r4, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238D7C8 ; =0x00003266
#else
	str r4, [r2, #0x9c]
	ldr r3, [r0]
	rsb r2, r4, #0x39c
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B7E8:
	ldr r0, _0238C228 ; =ov23_0238D594
	bl Debug_Print0
	b _0238C320
_0238B7F4:
	ldr r0, _0238C22C ; =ov23_0238D5AC
	bl Debug_Print0
	bl sub_02042730
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #0xe
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x240
#else
	mov r4, #0x73
	mov r2, #0xe
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0xc]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	strb r3, [r2, #0x88]
	ldr r3, [r0]
	add r2, r4, #0x2a8
	str r4, [r3, #0x9c]
	ldr r3, [r0]
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B848:
	ldr r0, _0238C230 ; =ov23_0238D5CC
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0xf
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D7D8 ; =0x00003259
#else
	mov r2, #0x31c
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238B894:
	ldr r0, _0238C234 ; =ov23_0238D5E8
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	mov r0, #3
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x97]
	b _0238C320
_0238B8F0:
	ldr r0, _0238C238 ; =ov23_0238D608
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	mov r0, #3
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x97]
	b _0238C320
_0238B94C:
	ldr r0, _0238C23C ; =ov23_0238D628
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	add r0, r1, #0x90
	str r0, [sp, #0x23c]
	ldr r0, [r1]
	cmp r0, #1
	bne _0238B9A0
	ldrsh r0, [r1, #0x1c]
	bl IsStorableItem
	cmp r0, #0
	ldrne r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	movne r1, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x90]
	ldreq r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	moveq r1, #3
	ldreq r0, [r0]
	streqb r1, [r0, #0x90]
	b _0238B9A8
_0238B9A0:
	mov r0, #0
	strb r0, [r1, #0x90]
_0238B9A8:
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0
	ldr r1, [r0]
	mov r4, #3
	strb r2, [r1, #0x91]
	ldr r1, [r0]
	ldr r0, _0238C240 ; =STORAGE_WINDOW_PARAMS_5
	strb r2, [r1, #0x92]
	ldr r3, _0238C244 ; =STORAGE_MAIN_MENU_ITEMS_3
	add r2, sp, #0x1dc
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238B9EC:
	ldr r0, _0238C248 ; =ov23_0238D64C
	bl Debug_Print0
	ldr r0, _0238C24C ; =OVERLAY23_UNKNOWN_VALUE__NA_238D2EC
	mov r4, #3
	str r0, [sp, #0x1a4]
	ldr r0, _0238C240 ; =STORAGE_WINDOW_PARAMS_5
	ldr r3, _0238C244 ; =STORAGE_MAIN_MENU_ITEMS_3
	add r2, sp, #0x144
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238BA28:
	ldr r0, _0238C250 ; =ov23_0238D670
	bl Debug_Print0
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, _0238C254 ; =ov23_0238D68C
	ldr r2, [r1]
	ldrsh r1, [r2, #0x1c]
	ldrh r2, [r2, #0x1a]
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov lr, #0
	ldr ip, [r0]
	ldr r2, _0238C258 ; =ov23_0238D69C
	ldrh r4, [ip, #0x1a]
	ldr r3, _0238C25C ; =0x0000C402
	mov r1, #0x400
	str r4, [ip, #0x9c]
	ldr ip, [r0]
	ldrsh r4, [ip, #0x1c]
	str r4, [ip, #0xac]
	ldr ip, [r0]
	ldrh r4, [ip, #0x1a]
	str r4, [ip, #0xc0]
	ldr r4, [r0]
	ldrh ip, [r4, #0x1a]
	add ip, ip, #0xbc
	str ip, [r4, #0xb4]
	ldr ip, [r0]
	str lr, [ip, #0xc8]
	ldr r0, [r0]
	add ip, r0, #0x9c
	add r0, r0, #0xec
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0xf4
	bl InitPreprocessorArgs
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	add r1, sp, #0xf4
	ldr r3, [r0]
	ldr r0, _0238C260 ; =STORAGE_WINDOW_PARAMS_7
	add r2, r3, #0xec
	str r2, [sp, #0x12c]
	str r1, [sp]
	ldrsh r2, [r3, #0x1c]
	add r3, r3, #0x9c
	ldr r1, _0238C264 ; =0x00001013
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
	ldr r3, _0238C268 ; =0x00000315
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x9a]
	b _0238C320
_0238BB0C:
	ldr r0, _0238C26C ; =ov23_0238D6A8
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238BB44
	bl ov23_0238D278
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238C320
_0238BB44:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	mov r2, #0x24
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x27
	str r2, [r1, #0xc]
	ldr r1, [r0]
	ldr r2, _0238C220 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238C1D0 ; =0x00003008
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D818 ; =0x0000325A
#else
	rsb r2, ip, #0x390
#endif
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238BBB0:
	ldr r0, _0238C270 ; =ov23_0238D6CC
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238BBE8
	bl ov23_0238D1B8
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238C320
_0238BBE8:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	mov r2, #0x24
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x28
	str r2, [r1, #0xc]
	ldr r1, [r0]
	ldr r2, _0238C220 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238C1D0 ; =0x00003008
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
	ldr r2, _0238C274 ; =0x0000031E
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238BC54:
	ldr r0, _0238C278 ; =ov23_0238D6F0
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238C27C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238C1E4 ; =0x00300013
	ldr r3, _0238C280 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238BC88:
	ldr r0, _0238C284 ; =ov23_0238D708
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238C27C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238C1E4 ; =0x00300013
	ldr r3, _0238C280 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238BCBC:
	ldr r0, _0238C288 ; =ov23_0238D71C
	bl Debug_Print0
	bl ov11_022DC504
	bl GetNbItemsInBag
	cmp r0, #0
	beq _0238BCE4
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	beq _0238BCF8
_0238BCE4:
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238BD18
_0238BCF8:
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0x16
	moveq r0, #1
	streq r0, [r1, #0xc]
	movne r0, #0xd
	strne r0, [r1, #0xc]
_0238BD18:
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov ip, #0x73
	ldr r1, [r0]
	mov r2, #1
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	add r2, r1, #0x244
#else
	str ip, [r2, #0x9c]
	ldr r3, [r0]
	add r2, ip, #0x2ac
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238BD58:
	ldr r0, _0238C28C ; =ov23_0238D73C
	bl Debug_Print0
	bl sub_02043218
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x19
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D83C ; =0x0000325D
#else
	mov r2, #0x320
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238BDAC:
	ldr r0, _0238C290 ; =ov23_0238D75C
	bl Debug_Print0
	bl ov23_0238D098
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	mov r3, #0x19
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r3, #0x73
#else
	mov r2, #0x19
	ldr r1, [r0]
	mov ip, #0x73
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0
#endif
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
#ifdef JAPAN
	str r3, [r2, #0x9c]
	ldr r3, [r0]
	ldr r2, _0238D844 ; =0x0000325E
#else
	str ip, [r2, #0x9c]
	ldr r3, [r0]
	rsb r2, ip, #0x394
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238BDFC:
	ldr r0, _0238C294 ; =ov23_0238D77C
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0x2b
	ldr r1, [r0]
	str r2, [r1, #0xc]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	b _0238C320
_0238BE44:
	mov r0, #1
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x98]
	b _0238C320
_0238BE64:
	ldr r0, _0238C298 ; =ov23_0238D79C
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	mov r0, #1
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x98]
	b _0238C320
_0238BEBC:
	ldr r0, _0238C29C ; =ov23_0238D7BC
	bl Debug_Print0
	mov ip, #3
	ldr r0, _0238C240 ; =STORAGE_WINDOW_PARAMS_5
	ldr r3, _0238C2A0 ; =STORAGE_MAIN_MENU_ITEMS_1
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238BEF0:
	ldr r0, _0238C29C ; =ov23_0238D7BC
	bl Debug_Print0
	ldr r0, _0238C2A4 ; =OVERLAY23_UNKNOWN_VALUE__NA_238D2E8
	mov ip, #3
	str r0, [sp, #0xbc]
	ldr r0, _0238C240 ; =STORAGE_WINDOW_PARAMS_5
	ldr r3, _0238C2A0 ; =STORAGE_MAIN_MENU_ITEMS_1
	add r2, sp, #0x5c
	add r1, ip, #0x210
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238BF2C:
	ldr r0, _0238C2A8 ; =ov23_0238D7E0
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, _0238C258 ; =ov23_0238D69C
	ldr lr, [r0]
	ldr r3, _0238C25C ; =0x0000C402
	ldrh ip, [lr, #0x1a]
	mov r1, #0x400
	str ip, [lr, #0x9c]
	ldr lr, [r0]
	ldrsh ip, [lr, #0x1c]
	str ip, [lr, #0xac]
	ldr lr, [r0]
	ldrh ip, [lr, #0x1a]
	str ip, [lr, #0xc0]
	ldr r0, [r0]
	add ip, r0, #0x9c
	add r0, r0, #0xec
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0xc
	bl InitPreprocessorArgs
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	add r1, sp, #0xc
	ldr r3, [r0]
	ldr r0, _0238C260 ; =STORAGE_WINDOW_PARAMS_7
	add r2, r3, #0xec
	str r2, [sp, #0x44]
	str r1, [sp]
	ldrsh r2, [r3, #0x1c]
	add r3, r3, #0x9c
	ldr r1, _0238C264 ; =0x00001013
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
	ldr r3, _0238C268 ; =0x00000315
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x9a]
	b _0238C320
_0238BFDC:
	ldr r0, _0238C2AC ; =ov23_0238D7FC
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238C014
	bl ov23_0238D238
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238C320
_0238C014:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	ldr r2, _0238C220 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238C1D0 ; =0x00003008
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
	ldr r2, _0238C2B0 ; =0x00000322
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x24
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238C320
_0238C084:
	ldr r0, _0238C2B4 ; =ov23_0238D81C
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238C27C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238C1E4 ; =0x00300013
	ldr r3, _0238C280 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238C0B8:
	ldr r0, _0238C2B8 ; =ov23_0238D834
	bl Debug_Print0
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #1
	bne _0238C0F0
	bl ov23_0238D148
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238B238
	b _0238C320
_0238C0F0:
	mov r1, #0
	strb r1, [r2, #0x88]
	ldr r1, [r0]
	mov r2, #0x24
	str r2, [r1, #8]
	ldr r1, [r0]
	mov r2, #0x26
	str r2, [r1, #0xc]
	ldr r1, [r0]
	ldr r2, _0238C220 ; =OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
	add r0, r1, #0x12c
	add r1, r1, #0x18
	bl sub_0200D670
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
#ifdef JAPAN
	ldr r1, _0238C1D0 ; =0x00003008
	ldr r3, [r0]
	mov ip, #0x73
#else
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238C1D0 ; =0x00003008
#endif
	add r2, r3, #0x12c
	str r2, [r3, #0xd4]
	ldr r3, [r0]
#ifdef JAPAN
	add r2, r1, #0x258
#else
	add r2, ip, #0x2b0
#endif
	str ip, [r3, #0x9c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
	b _0238C320
_0238C15C:
	ldr r0, _0238C2BC ; =ov23_0238D854
	bl Debug_Print0
	mov ip, #2
	ldr r0, _0238C27C ; =STORAGE_WINDOW_PARAMS_6
	ldr r1, _0238C1E4 ; =0x00300013
	ldr r3, _0238C280 ; =STORAGE_MENU_ITEMS_CONFIRM
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strb r0, [r1, #0x99]
	b _0238C320
_0238C190:
	ldr r0, _0238C2C0 ; =ov23_0238D868
	bl Debug_Print0
	bl ov11_022DC504
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	bne _0238C1B8
	bl IsBagFull
	cmp r0, #0
	beq _0238C2C4
_0238C1B8:
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238C2E4
	.align 2, 0
#ifdef JAPAN
#define OV23_0238B238_OFFSET 0x2F3D
#else
#define OV23_0238B238_OFFSET 0
#endif
_0238C1CC: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
_0238C1D0: .word 0x00003008
#ifdef JAPAN
_0238D760: .word 0x00003255
#endif
_0238C1D4: .word ov23_0238D448
_0238C1D8: .word STORAGE_WINDOW_PARAMS_8
_0238C1DC: .word STORAGE_MAIN_MENU_ITEMS_2
_0238C1E0: .word STORAGE_WINDOW_PARAMS_4
_0238C1E4: .word 0x00300013
_0238C1E8: .word STORAGE_MAIN_MENU_ITEMS_4
_0238C1EC: .word ov23_0238D468
#ifdef JAPAN
_0238D780: .word 0x00003256
#endif
_0238C1F0: .word ov23_0238D484
_0238C1F4: .word 0x00003018
_0238C1F8: .word ov23_0238D4A4
_0238C1FC: .word 0x0000031A + OV23_0238B238_OFFSET
_0238C200: .word ov23_0238D4C0
#ifdef JAPAN
_0238D798: .word 0x00003262
#endif
_0238C204: .word ov23_0238D4DC
_0238C208: .word 0x00000326 + OV23_0238B238_OFFSET
_0238C20C: .word ov23_0238D4F8
_0238C210: .word ov23_0238D51C
_0238C214: .word 0x0000032A + OV23_0238B238_OFFSET
_0238C218: .word ov23_0238D540
#ifdef JAPAN
_0238D7B4: .word 0x00003269
#endif
_0238C21C: .word ov23_0238D55C
_0238C220: .word OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
#ifdef JAPAN
_0238D7C0: .word 0x00003265
_0238C224: .word ov23_0238D578
_0238D7C8: .word 0x00003266
#else
_0238C224: .word ov23_0238D578
#endif
_0238C228: .word ov23_0238D594
_0238C22C: .word ov23_0238D5AC
_0238C230: .word ov23_0238D5CC
#ifdef JAPAN
_0238D7D8: .word 0x00003259
#endif
_0238C234: .word ov23_0238D5E8
_0238C238: .word ov23_0238D608
_0238C23C: .word ov23_0238D628
_0238C240: .word STORAGE_WINDOW_PARAMS_5
_0238C244: .word STORAGE_MAIN_MENU_ITEMS_3
_0238C248: .word ov23_0238D64C
_0238C24C: .word OVERLAY23_UNKNOWN_VALUE__NA_238D2EC
_0238C250: .word ov23_0238D670
_0238C254: .word ov23_0238D68C
_0238C258: .word ov23_0238D69C
_0238C25C: .word 0x0000C402
_0238C260: .word STORAGE_WINDOW_PARAMS_7
_0238C264: .word 0x00001013
_0238C268: .word 0x00000315 + OV23_0238B238_OFFSET
_0238C26C: .word ov23_0238D6A8
#ifdef JAPAN
_0238D818: .word 0x0000325A
#endif
_0238C270: .word ov23_0238D6CC
_0238C274: .word 0x0000031E + OV23_0238B238_OFFSET
_0238C278: .word ov23_0238D6F0
_0238C27C: .word STORAGE_WINDOW_PARAMS_6
_0238C280: .word STORAGE_MENU_ITEMS_CONFIRM
_0238C284: .word ov23_0238D708
_0238C288: .word ov23_0238D71C
_0238C28C: .word ov23_0238D73C
#ifdef JAPAN
_0238D83C: .word 0x0000325D
_0238C290: .word ov23_0238D75C
_0238D844: .word 0x0000325E
#else
_0238C290: .word ov23_0238D75C
#endif
_0238C294: .word ov23_0238D77C
_0238C298: .word ov23_0238D79C
_0238C29C: .word ov23_0238D7BC
_0238C2A0: .word STORAGE_MAIN_MENU_ITEMS_1
_0238C2A4: .word OVERLAY23_UNKNOWN_VALUE__NA_238D2E8
_0238C2A8: .word ov23_0238D7E0
_0238C2AC: .word ov23_0238D7FC
_0238C2B0: .word 0x00000322 + OV23_0238B238_OFFSET
_0238C2B4: .word ov23_0238D81C
_0238C2B8: .word ov23_0238D834
_0238C2BC: .word ov23_0238D854
_0238C2C0: .word ov23_0238D868
_0238C2C4:
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0x21
	moveq r0, #1
	streq r0, [r1, #0xc]
	movne r0, #0x18
	strne r0, [r1, #0xc]
_0238C2E4:
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238C1CC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x88]
	ldr r2, [r0]
	ldr r1, _0238C1F4 ; =0x00003018
	str r3, [r2, #0x9c]
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _0238D8DC ; =0x00003261
#else
	mov r2, #0x324
#endif
	ldrsb r0, [r3, #0x95]
	add r3, r3, #0x9c
	bl ov23_0238D0E0
_0238C320:
	add sp, sp, #0x30c
	ldmia sp!, {r3, r4, pc}
#ifdef JAPAN
	.align 2, 0
_0238D8DC: .word 0x00003261
#endif
	arm_func_end ov23_0238B238

	arm_func_start ov23_0238C328
ov23_0238C328: ; 0x0238C328
	stmdb sp!, {r4, lr}
	bl sub_02044094
	bl sub_020440DC
	bl sub_02042B98
	ldr r2, _0238C440 ; =ov11_0238A134
	mov r0, #0x258
	mov r1, #8
	ldr r4, [r2]
	bl MemAlloc
	ldr r1, _0238C444 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #0x28]
	ldr r0, [r1]
	str r2, [r0, #0x2c]
	ldr r0, [r1]
	str r2, [r0, #0x30]
	ldr r0, [r1]
	str r2, [r0, #0x8c]
	ldr r0, [r1]
	add r0, r0, #0x9c
	bl InitPreprocessorArgs
	ldr r0, _0238C444 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x73
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0xe8]
	ldr r1, [r0]
	str r3, [r1, #0x9c]
	ldr r1, [r0]
	str r4, [r1]
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #2
	bne _0238C3F0
	mov r1, #1
	str r1, [r2]
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_02034A38
	ldr r1, _0238C444 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0xff
	ldr r3, [r1]
	str r0, [r3, #0x1bc]
	ldr r0, [r1]
	str r2, [r0, #4]
_0238C3F0:
	mov r3, #0
	ldr r1, _0238C444 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r0, r3
_0238C3FC:
	ldr r2, [r1]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0x90]
	cmp r3, #5
	blt _0238C3FC
	ldr r1, _0238C444 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r3, #1
	ldr r2, [r1]
	strb r3, [r2, #0x97]
	ldr r2, [r1]
	strb r3, [r2, #0x98]
	ldr r1, [r1]
	strb r0, [r1, #0x88]
	bl ov23_0238A140
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238C440: .word ov11_0238A134
_0238C444: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	arm_func_end ov23_0238C328

	arm_func_start ov23_0238C448
ov23_0238C448: ; 0x0238C448
	stmdb sp!, {r3, lr}
	ldr r0, _0238C470 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238C470 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C470: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	arm_func_end ov23_0238C448

	arm_func_start ov23_0238C474
ov23_0238C474: ; 0x0238C474
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldr r2, [r1, #0x8c]
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _0238D088
_0238C490: ; jump table
	b _0238C4A0 ; case 0
	b _0238C4AC ; case 1
	b _0238D01C ; case 2
	b _0238D050 ; case 3
_0238C4A0:
	mov r0, #1
	str r0, [r1, #0x8c]
	b _0238D088
_0238C4AC:
	ldr r2, [r1, #8]
	cmp r2, #0x2d
	addls pc, pc, r2, lsl #2
	b _0238CFA0
_0238C4BC: ; jump table
	b _0238C598 ; case 0
	b _0238C598 ; case 1
	b _0238CFA0 ; case 2
	b _0238CFA0 ; case 3
	b _0238CD70 ; case 4
	b _0238CFA0 ; case 5
	b _0238CFA0 ; case 6
	b _0238CFA0 ; case 7
	b _0238CFA0 ; case 8
	b _0238CFA0 ; case 9
	b _0238CFA0 ; case 10
	b _0238CFA0 ; case 11
	b _0238CFA0 ; case 12
	b _0238CFA0 ; case 13
	b _0238C5C4 ; case 14
	b _0238C5C4 ; case 15
	b _0238C704 ; case 16
	b _0238C704 ; case 17
	b _0238C828 ; case 18
	b _0238C864 ; case 19
	b _0238C8DC ; case 20
	b _0238CFA0 ; case 21
	b _0238CFA0 ; case 22
	b _0238CFA0 ; case 23
	b _0238CFA0 ; case 24
	b _0238CF88 ; case 25
	b _0238C974 ; case 26
	b _0238CAE8 ; case 27
	b _0238CAE8 ; case 28
	b _0238CBE8 ; case 29
	b _0238CC24 ; case 30
	b _0238CCBC ; case 31
	b _0238CFA0 ; case 32
	b _0238CFA0 ; case 33
	b _0238CD7C ; case 34
	b _0238CDCC ; case 35
	b _0238CFA0 ; case 36
	b _0238CC24 ; case 37
	b _0238CCBC ; case 38
	b _0238C864 ; case 39
	b _0238C8DC ; case 40
	b _0238CEE0 ; case 41
	b _0238CF3C ; case 42
	b _0238C974 ; case 43
	b _0238C574 ; case 44
	b _0238CF94 ; case 45
_0238C574:
	ldr r3, [r1, #0x14]
	sub r2, r3, #1
	str r2, [r1, #0x14]
	cmp r3, #0
	bne _0238CFD0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl ov23_0238A140
	b _0238CFD0
_0238C598:
	ldrsb r0, [r1, #0x95]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238CFD0
	mov r0, #0x23
	bl ov23_0238A140
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	b _0238CFD0
_0238C5C4:
	bl sub_020426B4
	cmp r0, #2
	beq _0238C5DC
	cmp r0, #3
	beq _0238C60C
	b _0238C66C
_0238C5DC:
	bl sub_02042664
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #0x2a
	strb r2, [r1, #0x97]
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238CFD0
_0238C60C:
	bl sub_02042B20
	cmp r0, #1
	ble _0238C624
	mov r0, #0x11
	bl ov23_0238A140
	b _0238CFD0
_0238C624:
	bne _0238C634
	bl sub_02042B50
	ldr r1, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	b _0238C63C
_0238C634:
	bl sub_02042ADC
	ldr r1, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
_0238C63C:
	ldr r1, [r1]
	str r0, [r1, #0x20]
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	add r1, r1, #0x18
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	mov r0, #0x10
	bl ov23_0238A140
	b _0238CFD0
_0238C66C:
	bl sub_02042AAC
	cmp r0, #0
	beq _0238CFD0
	mov r0, #0
	add r1, sp, #0
	strh r0, [sp]
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _0238CFD0
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_02042ADC
	ldr r1, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r1]
	str r0, [r2, #0x20]
	ldr r1, [r1]
	ldr r0, [r1, #0x20]
	add r1, r1, #0x18
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	bl sub_02042664
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x97]
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #5
	ldr r1, [r0]
	mov r2, #0x12
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0x2c
	str r2, [r1, #0xc]
	bl ov23_0238A140
	b _0238CFD0
_0238C704:
	ldrsb r0, [r1, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238C80C
	cmp r0, #2
	beq _0238C728
	cmp r0, #6
	beq _0238C7D0
	b _0238CFD0
_0238C728:
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r2, [r0]
	ldr r1, [r2, #8]
	cmp r1, #0x10
	bne _0238C78C
	ldrsh r0, [r2, #0x1c]
	bl IsStorableItem
	cmp r0, #0
	bne _0238C76C
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #9
	ldr r2, [r0]
	mov r1, #0x2a
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238C7A0
_0238C76C:
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x2a
	ldr r2, [r0]
	mov r1, #0x13
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238C7A0
_0238C78C:
	mov r1, #0x2a
	str r1, [r2, #8]
	ldr r0, [r0]
	mov r1, #0x14
	str r1, [r0, #0xc]
_0238C7A0:
	bl ov23_0238D098
	bl sub_02042664
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x97]
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x2a
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238C7D0:
	bl ov23_0238D098
	bl sub_02042664
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x97]
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #0x12
	ldr r2, [r0]
	mov r1, #0x2a
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238C80C:
	bl ov23_0238D098
	bl sub_02042744
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238C828:
	ldrsb r0, [r1, #0x9a]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238CFD0
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x9a]
	bl CloseScrollBox
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xf
	strb r2, [r1, #0x9a]
	bl ov23_0238A140
	b _0238CFD0
_0238C864:
	ldrsb r0, [r1, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238C89C
	cmp r0, #4
	beq _0238C888
	cmp r0, #5
	beq _0238C89C
	b _0238CFD0
_0238C888:
	bl ov23_0238D278
	bl ov23_0238D098
	mov r0, #0x15
	bl ov23_0238A140
	b _0238CFD0
_0238C89C:
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0xf
	str r2, [r1, #0x14]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238C8DC:
	ldrsb r0, [r1, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238C934
	cmp r0, #4
	beq _0238C900
	cmp r0, #5
	beq _0238C934
	b _0238CFD0
_0238C900:
	bl ov23_0238D1B8
	bl ov23_0238D098
	bl sub_02042AF8
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r3, #6
	ldr r1, [r0]
	mov r2, #0x16
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0x2c
	str r2, [r1, #0xc]
	bl ov23_0238A140
	b _0238CFD0
_0238C934:
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0xf
	str r2, [r1, #0x14]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238C974:
	bl sub_02043468
	mov r4, r0
	bl sub_02043400
	cmp r0, #0
	bne _0238CA2C
	mvn r0, #0
	cmp r4, r0
	bne _0238C9C8
	bl sub_0204317C
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #1
	strb r2, [r1, #0x98]
	ldr r2, [r0]
	mov r1, #0x29
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238C9C8:
	bl sub_020434FC
	mov r5, r0
	mov r0, r4
	bl sub_0204323C
	cmp r5, #1
	ble _0238C9EC
	mov r0, #0x1c
	bl ov23_0238A140
	b _0238CFD0
_0238C9EC:
	ldrne r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldrne r0, [r0]
	strneh r4, [r0, #0x24]
	bne _0238CA0C
	bl sub_0204352C
	ldr r1, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r1]
	strh r0, [r1, #0x24]
_0238CA0C:
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldrsh r0, [r1, #0x24]
	add r1, r1, #0x18
	bl ConvertStorageItemAtIdxToItem
	mov r0, #0x1b
	bl ov23_0238A140
	b _0238CFD0
_0238CA2C:
	bl sub_02043434
	cmp r0, #0
	beq _0238CFD0
	mov r0, #0
	add r1, sp, #2
	strh r0, [sp, #2]
	bl GetPressedButtons
	ldrh r0, [sp, #2]
	tst r0, #8
	beq _0238CFD0
	mov r0, #0
	bl PlaySeVolumeWrapper
	mov r0, r4
	bl sub_0204323C
	ldr r2, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, _0238D094 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r2]
	mov r3, #0
	strh r4, [r0, #0x24]
	ldr ip, [r2]
	ldr r4, [r1]
	ldrsh r0, [ip, #0x24]
	add r0, r4, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	strh r0, [ip, #0x1c]
	ldr r4, [r2]
	ldr r1, [r1]
	ldrsh r0, [r4, #0x24]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	strh r0, [r4, #0x1a]
	ldr r0, [r2]
	strb r3, [r0, #0x18]
	bl sub_0204317C
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0x1d
	strb r3, [r1, #0x98]
	ldr r1, [r0]
	mov r0, #0x29
	str r2, [r1, #0xc]
	bl ov23_0238A140
	b _0238CFD0
_0238CAE8:
	ldrsb r0, [r1, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238CBCC
	cmp r0, #3
	beq _0238CB0C
	cmp r0, #6
	beq _0238CB98
	b _0238CFD0
_0238CB0C:
	bl IsBagFull
	cmp r0, #0
	beq _0238CB50
	bl ov23_0238D098
	bl sub_0204317C
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #6
	strb r2, [r1, #0x98]
	ldr r2, [r0]
	mov r1, #0x29
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CB50:
	bl ov23_0238D098
	bl sub_0204317C
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x98]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0x1b
	moveq r0, #0x1e
	movne r0, #0x1f
	str r0, [r1, #0xc]
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x29
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CB98:
	bl sub_0204317C
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #0x1d
	strb r2, [r1, #0x98]
	ldr r2, [r0]
	mov r1, #0x29
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CBCC:
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0, #8]
	bl ov23_0238D098
	bl sub_020433C0
	b _0238CFD0
_0238CBE8:
	ldrsb r0, [r1, #0x9a]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238CFD0
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x9a]
	bl CloseScrollBox
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x1a
	strb r2, [r1, #0x9a]
	bl ov23_0238A140
	b _0238CFD0
_0238CC24:
	ldrsb r0, [r1, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238CC7C
	cmp r0, #4
	beq _0238CC48
	cmp r0, #5
	beq _0238CC7C
	b _0238CFD0
_0238CC48:
	bl ov23_0238D238
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x20
	str r2, [r1, #0x14]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CC7C:
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0x14]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CCBC:
	ldrsb r0, [r1, #0x95]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238CFD0
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238CD30
	cmp r0, #4
	beq _0238CCF8
	cmp r0, #5
	beq _0238CD30
	b _0238CFD0
_0238CCF8:
	bl ov23_0238D148
	bl ov23_0238D098
	bl sub_020434D4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x21
	str r2, [r1, #0x14]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CD30:
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x1a
	str r2, [r1, #0x14]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238CFD0
_0238CD70:
	bl ov11_022DC504
	mov r0, #3
	b _0238CFD4
_0238CD7C:
	ldrsb r0, [r1, #0x95]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238CFD0
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #0x2e
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	b _0238CFD0
_0238CDCC:
	ldrsb r0, [r1, #0x99]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldrne r1, [r1]
	strne r0, [r1, #0x28]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238CFD0
_0238CDF0: ; jump table
	b _0238CFD0 ; case 0
	b _0238CED0 ; case 1
	b _0238CE0C ; case 2
	b _0238CE7C ; case 3
	b _0238CFD0 ; case 4
	b _0238CFD0 ; case 5
	b _0238CEC0 ; case 6
_0238CE0C:
	bl ov23_0238D098
	bl GetNbItemsInBag
	cmp r0, #0
	bne _0238CE28
	mov r0, #5
	bl ov23_0238A140
	b _0238CFD0
_0238CE28:
	bl HasStorableItems
	cmp r0, #0
	bne _0238CE54
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	beq _0238CE54
	mov r0, #0xb
	bl ov23_0238A140
	b _0238CFD0
_0238CE54:
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	beq _0238CE70
	mov r0, #8
	bl ov23_0238A140
	b _0238CFD0
_0238CE70:
	mov r0, #0xc
	bl ov23_0238A140
	b _0238CFD0
_0238CE7C:
	bl ov23_0238D098
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	beq _0238CE9C
	mov r0, #7
	bl ov23_0238A140
	b _0238CFD0
_0238CE9C:
	bl IsBagFull
	cmp r0, #0
	beq _0238CEB4
	mov r0, #6
	bl ov23_0238A140
	b _0238CFD0
_0238CEB4:
	mov r0, #0x17
	bl ov23_0238A140
	b _0238CFD0
_0238CEC0:
	bl ov23_0238D098
	mov r0, #2
	bl ov23_0238A140
	b _0238CFD0
_0238CED0:
	bl ov23_0238D098
	mov r0, #3
	bl ov23_0238A140
	b _0238CFD0
_0238CEE0:
	ldr r2, [r1, #0x10]
	add r2, r2, #1
	str r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	cmp r0, #1
	beq _0238CF08
	cmp r0, #3
	beq _0238CF20
	b _0238CFD0
_0238CF08:
	bl ov23_0238D098
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x98]
	b _0238CFD0
_0238CF20:
	ldr r0, [r1, #0xc]
	bl ov23_0238A140
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0238CFD0
_0238CF3C:
	ldr r2, [r1, #0x10]
	add r2, r2, #1
	str r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	cmp r0, #1
	beq _0238CF64
	cmp r0, #3
	beq _0238CF6C
	b _0238CFD0
_0238CF64:
	bl ov23_0238D098
	b _0238CFD0
_0238CF6C:
	ldr r0, [r1, #0xc]
	bl ov23_0238A140
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0238CFD0
_0238CF88:
	ldr r0, [r1, #0xc]
	bl ov23_0238A140
	b _0238CFD0
_0238CF94:
	mov r0, #0xf
	str r0, [r1, #8]
	b _0238CFD0
_0238CFA0:
	ldrsb r0, [r1, #0x95]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238CFD0
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl ShowDialogueBox
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl ov23_0238A140
_0238CFD0:
	mov r0, #0
_0238CFD4:
	cmp r0, #3
	bne _0238D088
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r2, #2
	ldr r1, [r0]
	str r2, [r1, #0x8c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202F2C4
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl HidePortraitBox
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl sub_0202836C
	b _0238D088
_0238D01C:
	mov r0, #3
	str r0, [r1, #0x8c]
	bl sub_020440B8
	bl sub_02042BBC
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x95]
	bl CloseDialogueBox
	ldr r0, _0238D090 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x96]
	bl ClosePortraitBox
	b _0238D088
_0238D050:
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0238D07C
	ldr r0, [r1, #0x1bc]
	tst r0, #0x100
	beq _0238D080
	ldr r0, [r1, #0x248]
	ldr r2, [r1, #0x244]
	mov r1, #0
	blx r2
	b _0238D080
_0238D07C:
	bl ov11_022E6E68
_0238D080:
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_0238D088:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238D090: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
_0238D094: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov23_0238C474

	arm_func_start ov23_0238D098
ov23_0238D098: ; 0x0238D098
	stmdb sp!, {r3, lr}
	ldr r0, _0238D0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x99]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0238D0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x99]
	bl CloseSimpleMenu
	ldr r0, _0238D0DC ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x99]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D0DC: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	arm_func_end ov23_0238D098

	arm_func_start ov23_0238D0E0
ov23_0238D0E0: ; 0x0238D0E0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0238D144 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r6, r0
	ldr r3, [r3]
	mov r5, r1
	ldr r0, [r3]
	mov r4, r2
	cmp r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r1, [r3, #0x88]
	add r0, r3, #0x1ac
	bl SetPortraitEmotion
	ldr r0, _0238D144 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r1, [r0]
	ldrsb r0, [r1, #0x96]
	add r1, r1, #0x1ac
	bl ShowPortraitInPortraitBox
	ldr r1, _0238D144 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	mov r0, r6
	ldr r3, [r1]
	mov r1, r5
	mov r2, r4
	add r3, r3, #0x9c
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0238D144: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	arm_func_end ov23_0238D0E0

	arm_func_start ov23_0238D148
ov23_0238D148: ; 0x0238D148
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	add r4, sp, #0
_0238D154:
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02043568
	tst r0, #1
	beq _0238D19C
	mov r0, r5, lsl #0x10
	mov r1, r4
	mov r0, r0, asr #0x10
	bl ConvertStorageItemAtIdxToBulkItem
	cmp r0, #0
	beq _0238D19C
	mov r0, r4
	bl SpecialProcAddItemToBag
	cmp r0, #0
	beq _0238D19C
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemAtIdxInStorage
_0238D19C:
	add r5, r5, #1
	cmp r5, #0x3e8
	blt _0238D154
	bl RemoveEmptyItemsInBag
	bl sub_0201007C
	bl sub_02042AF8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov23_0238D148

	arm_func_start ov23_0238D1B8
ov23_0238D1B8: ; 0x0238D1B8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, #0
	add r4, sp, #0
_0238D1C8:
	mov r0, r5
	bl sub_02042B84
	tst r0, #1
	beq _0238D21C
	mov r0, r5, lsl #0x10
	mov r1, r4
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	cmp r0, #0
	beq _0238D21C
	ldrb r0, [sp, #1]
	cmp r0, #0
	beq _0238D208
	bl sub_020582E0
	cmp r0, #0
	beq _0238D21C
_0238D208:
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
	mov r0, r4
	bl AddItemToStorage
_0238D21C:
	add r5, r5, #1
	cmp r5, #0x32
	blt _0238D1C8
	bl RemoveEmptyItemsInBag
	bl sub_020434D4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov23_0238D1B8

	arm_func_start ov23_0238D238
ov23_0238D238: ; 0x0238D238
	stmdb sp!, {r3, lr}
	ldr r0, _0238D274 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldrsh r0, [r0, #0x24]
	bl sub_02010154
	ldr r1, _0238D274 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	add r0, sp, #0
	ldr r2, [r1]
	ldrsh r1, [r2, #0x1c]
	strh r1, [sp]
	ldrh r1, [r2, #0x1a]
	strh r1, [sp, #2]
	bl SpecialProcAddItemToBag
	bl sub_020434D4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D274: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	arm_func_end ov23_0238D238

	arm_func_start ov23_0238D278
ov23_0238D278: ; 0x0238D278
	stmdb sp!, {r3, lr}
	ldr r0, _0238D2E4 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0238D2B4
	bl sub_020582E0
	cmp r0, #0
	bne _0238D2B4
	bl sub_02042AF8
	ldmia sp!, {r3, pc}
_0238D2B4:
	ldr r0, _0238D2E4 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _0238D2E4 ; =OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	ldr r0, [r0]
	add r0, r0, #0x18
	bl AddItemToStorage
	bl sub_02042AF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D2E4: .word OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
	arm_func_end ov23_0238D278
	; 0x0238D2E8

	.rodata
	.global OVERLAY23_UNKNOWN_VALUE__NA_238D2E8
OVERLAY23_UNKNOWN_VALUE__NA_238D2E8:
	.byte 0x00, 0x03, 0x00, 0x00
	.global OVERLAY23_UNKNOWN_VALUE__NA_238D2EC
OVERLAY23_UNKNOWN_VALUE__NA_238D2EC:
	.byte 0x00, 0x03, 0x00, 0x00
	.global OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0
OVERLAY23_UNKNOWN_STRUCT__NA_238D2F0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global STORAGE_MENU_ITEMS_CONFIRM
STORAGE_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV23_DATA_OFFSET 0x2F3D
#else
#define OV23_DATA_OFFSET 0
#endif
	.word 0x30E + OV23_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x30F + OV23_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global STORAGE_MAIN_MENU_ITEMS_1
STORAGE_MAIN_MENU_ITEMS_1:
	.word 0x311 + OV23_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x312 + OV23_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x314 + OV23_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global STORAGE_MAIN_MENU_ITEMS_2
STORAGE_MAIN_MENU_ITEMS_2:
	.word 0x310 + OV23_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x311 + OV23_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x313 + OV23_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global STORAGE_MAIN_MENU_ITEMS_3
STORAGE_MAIN_MENU_ITEMS_3:
	.word 0x310 + OV23_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x312 + OV23_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x314 + OV23_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global STORAGE_MAIN_MENU_ITEMS_4
STORAGE_MAIN_MENU_ITEMS_4:
	.word 0x310 + OV23_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x311 + OV23_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x312 + OV23_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x313 + OV23_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.hword 0x318 + OV23_DATA_OFFSET, 0x319 + OV23_DATA_OFFSET, 0x31A + OV23_DATA_OFFSET, 0x31B + OV23_DATA_OFFSET, 0x31C + OV23_DATA_OFFSET, 0x31D + OV23_DATA_OFFSET
	.hword 0x31E + OV23_DATA_OFFSET, 0x31F + OV23_DATA_OFFSET, 0x320 + OV23_DATA_OFFSET, 0x321 + OV23_DATA_OFFSET, 0x322 + OV23_DATA_OFFSET, 0x323 + OV23_DATA_OFFSET, 0x324 + OV23_DATA_OFFSET, 0x325 + OV23_DATA_OFFSET
	.hword 0x326 + OV23_DATA_OFFSET, 0x327 + OV23_DATA_OFFSET, 0x328 + OV23_DATA_OFFSET, 0x329 + OV23_DATA_OFFSET, 0x32A + OV23_DATA_OFFSET, 0x32C + OV23_DATA_OFFSET, 0x32B + OV23_DATA_OFFSET
	.byte 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x10, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x12, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x0F, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global STORAGE_WINDOW_PARAMS_4
STORAGE_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global STORAGE_WINDOW_PARAMS_5
STORAGE_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global STORAGE_WINDOW_PARAMS_6
STORAGE_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global STORAGE_WINDOW_PARAMS_7
STORAGE_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global STORAGE_WINDOW_PARAMS_8
STORAGE_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D448
ov23_0238D448:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x4D, 0x45, 0x4E, 0x55, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D468
ov23_0238D468:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00, 0x00
	.global ov23_0238D484
ov23_0238D484:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x45, 0x58, 0x50
	.byte 0x4C, 0x41, 0x4E, 0x41, 0x54, 0x49, 0x4F, 0x4E, 0x3A, 0x0A, 0x00, 0x00
	.global ov23_0238D4A4
ov23_0238D4A4:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x54, 0x48, 0x41
	.byte 0x4E, 0x4B, 0x53, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D4C0
ov23_0238D4C0:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45
	.byte 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x49, 0x54, 0x45, 0x4D, 0x5F, 0x4E, 0x4F
	.byte 0x4E, 0x3A, 0x0A, 0x00
	.global ov23_0238D4DC
ov23_0238D4DC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x49, 0x54, 0x45, 0x4D, 0x5F, 0x4D, 0x41, 0x58, 0x3A, 0x0A, 0x00
	.global ov23_0238D4F8
ov23_0238D4F8:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x5F, 0x57, 0x41, 0x52, 0x45, 0x48, 0x4F, 0x55, 0x53, 0x45, 0x5F, 0x4E, 0x4F, 0x4E, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D51C
ov23_0238D51C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x57, 0x41, 0x52, 0x45, 0x48, 0x4F, 0x55, 0x53, 0x45, 0x5F, 0x46
	.byte 0x55, 0x4C, 0x4C, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D540
ov23_0238D540:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45
	.byte 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x4E, 0x4F
	.byte 0x4E, 0x3A, 0x0A, 0x00
	.global ov23_0238D55C
ov23_0238D55C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x42, 0x41, 0x44, 0x3A, 0x0A, 0x00
	.global ov23_0238D578
ov23_0238D578:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x46, 0x55, 0x4C, 0x4C, 0x3A, 0x0A, 0x00
	.global ov23_0238D594
ov23_0238D594:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x51, 0x55, 0x49
	.byte 0x54, 0x0A, 0x00, 0x00
	.global ov23_0238D5AC
ov23_0238D5AC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D5CC
ov23_0238D5CC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00
	.global ov23_0238D5E8
ov23_0238D5E8:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D608
ov23_0238D608:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x52, 0x45, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x3A, 0x0A, 0x00
	.global ov23_0238D628
ov23_0238D628:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x31, 0x3A
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D64C
ov23_0238D64C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45, 0x4E
	.byte 0x55, 0x5F, 0x41, 0x3A, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D670
ov23_0238D670:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45
	.byte 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x45, 0x58, 0x50
	.byte 0x4C, 0x41, 0x0A, 0x00
	.global ov23_0238D68C
ov23_0238D68C:
	.byte 0x49, 0x74, 0x65, 0x6D, 0x25, 0x64, 0x20, 0x43, 0x6F, 0x75, 0x6E, 0x74
	.byte 0x25, 0x64, 0x0A, 0x00
	.global ov23_0238D69C
ov23_0238D69C:
	.byte 0x5B, 0x69, 0x74, 0x65, 0x6D, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D6A8
ov23_0238D6A8:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x5F, 0x31, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D6CC
ov23_0238D6CC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D
	.byte 0x5F, 0x41, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D6F0
ov23_0238D6F0:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x43, 0x4F
	.byte 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x5F, 0x31, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D708
ov23_0238D708:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45
	.byte 0x57, 0x0A, 0x00, 0x00
	.global ov23_0238D71C
ov23_0238D71C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x3A
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D73C
ov23_0238D73C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov23_0238D75C
ov23_0238D75C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54
	.byte 0x3A, 0x0A, 0x00, 0x00
	.global ov23_0238D77C
ov23_0238D77C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x3A
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D79C
ov23_0238D79C:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x52, 0x45, 0x53, 0x45, 0x4C, 0x45, 0x43
	.byte 0x54, 0x3A, 0x0A, 0x00
	.global ov23_0238D7BC
ov23_0238D7BC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45
	.byte 0x4E, 0x55, 0x5F, 0x31, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D7E0
ov23_0238D7E0:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45
	.byte 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x45, 0x58, 0x50
	.byte 0x4C, 0x41, 0x0A, 0x00
	.global ov23_0238D7FC
ov23_0238D7FC:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F
	.byte 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D
	.byte 0x5F, 0x31, 0x0A, 0x00
	.global ov23_0238D81C
ov23_0238D81C:
	.byte 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D
	.byte 0x5F, 0x4E, 0x45, 0x57, 0x5F, 0x31, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00
	.global ov23_0238D834
ov23_0238D834:
	.byte 0x4D, 0x45, 0x4E, 0x55
	.byte 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x47, 0x45, 0x54
	.byte 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x5F, 0x41, 0x0A, 0x00
	.global ov23_0238D854
ov23_0238D854:
	.byte 0x5F, 0x47, 0x45, 0x54
	.byte 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x00, 0x00
	.global ov23_0238D868
ov23_0238D868:
	.byte 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x4B, 0x45, 0x45, 0x50, 0x45, 0x52, 0x5F, 0x4D, 0x4F, 0x44, 0x45
	.byte 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x3A, 0x0A, 0x00, 0x00, 0x00

	.data
	.global OVERLAY23_UNKNOWN_POINTER__NA_238D8A0
OVERLAY23_UNKNOWN_POINTER__NA_238D8A0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
