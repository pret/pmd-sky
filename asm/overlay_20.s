	.include "asm/macros.inc"
	.include "overlay_20.inc"

	.text

	arm_func_start ov20_0238A140
ov20_0238A140: ; 0x0238A140
	ldr ip, _0238A14C ; =ov20_0238B294
	mov r0, #0
	bx ip
	.align 2, 0
_0238A14C: .word ov20_0238B294
	arm_func_end ov20_0238A140

	arm_func_start ov20_0238A150
ov20_0238A150: ; 0x0238A150
	ldr ip, _0238A15C ; =ov20_0238B294
	mov r0, #1
	bx ip
	.align 2, 0
_0238A15C: .word ov20_0238B294
	arm_func_end ov20_0238A150

	arm_func_start ov20_0238A160
ov20_0238A160: ; 0x0238A160
	stmdb sp!, {r3, lr}
	ldr r0, _0238A1AC ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	ldr r1, [r0]
	cmp r1, #0
	beq _0238A1A4
	ldr r0, [r1, #0x9c]
	cmp r0, #0
	beq _0238A188
	add r0, r1, #0x9c
	bl sub_020125CC
_0238A188:
	bl sub_02046D20
	ldr r0, _0238A1AC ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238A1AC ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r1, #0
	str r1, [r0]
_0238A1A4:
	bl sub_020017EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A1AC: .word OVERLAY20_UNKNOWN_POINTER__NA_238D120
	arm_func_end ov20_0238A160

	arm_func_start ov20_0238A1B0
ov20_0238A1B0: ; 0x0238A1B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xb0
	ldr r0, _0238B144 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	ldr r8, [r0]
	ldr r0, [r8]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0238B288
_0238A1D0: ; jump table
	b _0238A1F4 ; case 0
	b _0238A204 ; case 1
	b _0238A210 ; case 2
	b _0238B124 ; case 3
	b _0238B130 ; case 4
	b _0238B174 ; case 5
	b _0238B1A4 ; case 6
	b _0238B1C8 ; case 7
	b _0238B260 ; case 8
_0238A1F4:
	mov r0, #2
	str r0, [r8]
	bl ov11_022E6E68
	b _0238B288
_0238A204:
	mov r0, #2
	str r0, [r8]
	b _0238B288
_0238A210:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238A228
	bl ov11_0230CCE0
	cmp r0, #0
	beq _0238B288
_0238A228:
	ldr sl, _0238B144 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	ldr sb, [sl]
	ldr r0, [sb, #4]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0238B0FC
_0238A240: ; jump table
	b _0238A268 ; case 0
	b _0238A284 ; case 1
	b _0238A298 ; case 2
	b _0238A2A4 ; case 3
	b _0238A2A4 ; case 4
	b _0238A3C4 ; case 5
	b _0238B078 ; case 6
	b _0238B09C ; case 7
	b _0238B0B8 ; case 8
	b _0238B0EC ; case 9
_0238A268:
	bl ov11_0230D220
	cmp r0, #0
	bne _0238B0FC
	bl ov11_0230D71C
	mov r0, #1
	str r0, [sb, #4]
	b _0238B0FC
_0238A284:
	bl ov11_0230D220
	cmp r0, #0
	moveq r0, #3
	streq r0, [sb, #4]
	b _0238B0FC
_0238A298:
	mov r0, #3
	str r0, [sb, #4]
	b _0238B0FC
_0238A2A4:
	cmp r0, #4
	moveq r1, #1
	movne r1, #0
	ldr r0, [sb, #0xc]
	and r4, r1, #0xff
	cmp r0, #0
	beq _0238A2D4
	cmp r0, #1
	beq _0238A31C
	cmp r0, #2
	beq _0238A354
	b _0238B0FC
_0238A2D4:
	mov r1, #0
	mov r0, sb
	strb r1, [sb, #0xb0]
	bl ov20_0238B4A8
	cmp r4, #0
	beq _0238A300
	ldr r1, _0238B148 ; =0x000045EE
	ldr r2, _0238B14C ; =RECYCLE_MAIN_MENU_ITEMS_1
	mov r0, sb
	bl ov20_0238B39C
	b _0238A310
_0238A300:
	ldr r1, _0238B150 ; =0x000045ED
	ldr r2, _0238B14C ; =RECYCLE_MAIN_MENU_ITEMS_1
	mov r0, sb
	bl ov20_0238B39C
_0238A310:
	mov r0, #2
	str r0, [sb, #0xc]
	b _0238B0FC
_0238A31C:
	cmp r4, #0
	beq _0238A338
	ldr r1, _0238B148 ; =0x000045EE
	ldr r2, _0238B14C ; =RECYCLE_MAIN_MENU_ITEMS_1
	mov r0, sb
	bl ov20_0238B39C
	b _0238A348
_0238A338:
	ldr r1, _0238B150 ; =0x000045ED
	ldr r2, _0238B14C ; =RECYCLE_MAIN_MENU_ITEMS_1
	mov r0, sb
	bl ov20_0238B39C
_0238A348:
	mov r0, #2
	str r0, [sb, #0xc]
	b _0238B0FC
_0238A354:
	bl sub_02046B04
	mvn r1, #0
	cmp r0, r1
	beq _0238B0FC
	cmp r0, #0
	moveq r0, #5
	streq r0, [sb, #4]
	moveq r0, #0
	streq r0, [sb, #0xc]
	beq _0238B0FC
	cmp r0, #1
	bne _0238A39C
	mov r1, #0
	strh r1, [sb, #0xa8]
	mov r0, #6
	str r0, [sb, #4]
	str r1, [sb, #0xc]
	b _0238B0FC
_0238A39C:
	cmp r0, #2
	moveq r0, #7
	streq r0, [sb, #4]
	moveq r0, #0
	streq r0, [sb, #0xc]
	movne r0, #8
	strne r0, [sb, #4]
	movne r0, #0
	strne r0, [sb, #0xc]
	b _0238B0FC
_0238A3C4:
	ldr r6, _0238B154 ; =0x000045F4
	mov r7, #0
	sub fp, r6, #1
	mvn r4, #0
	b _0238B06C
_0238A3D8:
	ldr r0, [sb, #0xc]
	mov r7, #1
	cmp r0, #0x3f
	addls pc, pc, r0, lsl #2
	b _0238B05C
_0238A3EC: ; jump table
	b _0238A4EC ; case 0
	b _0238A4EC ; case 1
	b _0238A590 ; case 2
	b _0238A620 ; case 3
	b _0238A630 ; case 4
	b _0238A644 ; case 5
	b _0238A654 ; case 6
	b _0238A668 ; case 7
	b _0238A678 ; case 8
	b _0238A68C ; case 9
	b _0238A6C8 ; case 10
	b _0238A890 ; case 11
	b _0238A8BC ; case 12
	b _0238A8FC ; case 13
	b _0238A90C ; case 14
	b _0238A924 ; case 15
	b _0238A948 ; case 16
	b _0238A95C ; case 17
	b _0238A96C ; case 18
	b _0238A980 ; case 19
	b _0238A990 ; case 20
	b _0238A9A4 ; case 21
	b _0238A9BC ; case 22
	b _0238A9D4 ; case 23
	b _0238B05C ; case 24
	b _0238B05C ; case 25
	b _0238B05C ; case 26
	b _0238AAB4 ; case 27
	b _0238AAEC ; case 28
	b _0238AB70 ; case 29
	b _0238AB80 ; case 30
	b _0238AB14 ; case 31
	b _0238ABA8 ; case 32
	b _0238ABC4 ; case 33
	b _0238ABD4 ; case 34
	b _0238ABEC ; case 35
	b _0238AC34 ; case 36
	b _0238AC84 ; case 37
	b _0238AC98 ; case 38
	b _0238ACB0 ; case 39
	b _0238ACC0 ; case 40
	b _0238AD14 ; case 41
	b _0238AD24 ; case 42
	b _0238AD78 ; case 43
	b _0238ADC8 ; case 44
	b _0238ADDC ; case 45
	b _0238AE08 ; case 46
	b _0238AE20 ; case 47
	b _0238AE44 ; case 48
	b _0238AE58 ; case 49
	b _0238AE70 ; case 50
	b _0238AEA4 ; case 51
	b _0238AEB4 ; case 52
	b _0238AECC ; case 53
	b _0238AEE8 ; case 54
	b _0238AF68 ; case 55
	b _0238AF80 ; case 56
	b _0238AFAC ; case 57
	b _0238AFD0 ; case 58
	b _0238AFE8 ; case 59
	b _0238B00C ; case 60
	b _0238B01C ; case 61
	b _0238B034 ; case 62
	b _0238B048 ; case 63
_0238A4EC:
	bl sub_02011EE8
	cmp r0, #0
	bne _0238A538
	ldrb r0, [sb, #0xb0]
	cmp r0, #0
	beq _0238A520
	ldr r2, _0238B158 ; =RECYCLE_MENU_ITEMS_CONFIRM_1
	mov r0, sb
	add r1, r6, #2
	bl ov20_0238B39C
	mov r0, #2
	str r0, [sb, #0xc]
	b _0238A584
_0238A520:
	mov r0, #0
	str r0, [sb, #0x80]
	mov r0, #7
	str r0, [sb, #0xc]
	mov r7, #0
	b _0238A584
_0238A538:
	ldr r0, [sb, #0xc]
	cmp r0, #0
	bne _0238A558
	ldr r2, _0238B15C ; =RECYCLE_SUBMENU_ITEMS_2
	mov r0, sb
	mov r1, fp
	bl ov20_0238B39C
	b _0238A57C
_0238A558:
	ldrb r0, [sb, #0xb0]
	ldr r2, _0238B15C ; =RECYCLE_SUBMENU_ITEMS_2
	cmp r0, #0
	addne r0, r6, #1
	moveq r0, r6
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, sb
	bl ov20_0238B39C
_0238A57C:
	mov r0, #2
	str r0, [sb, #0xc]
_0238A584:
	mov r0, #0
	strb r0, [sb, #0xb0]
	b _0238B05C
_0238A590:
	bl sub_02046B04
	cmp r0, r4
	beq _0238B05C
	cmp r0, #4
	bne _0238A5E8
	mov r0, #2
	str r0, [sb, #0x80]
	bl sub_02011EE8
	cmp r0, #0
	moveq r0, #3
	streq r0, [sb, #0xc]
	beq _0238B0FC
	bl sub_0201227C
	cmp r0, #0
	moveq r0, r7
	movne r0, #0
	tst r0, #0xff
	movne r0, #5
	strne r0, [sb, #0xc]
	moveq r0, #7
	streq r0, [sb, #0xc]
	b _0238B0FC
_0238A5E8:
	cmp r0, #5
	moveq r0, r7
	streq r0, [sb, #0x80]
	moveq r0, #7
	streq r0, [sb, #0xc]
	beq _0238B0FC
	cmp r0, #6
	moveq r0, #0
	streq r0, [sb, #0x80]
	moveq r0, #7
	streq r0, [sb, #0xc]
	movne r0, #0x3f
	strne r0, [sb, #0xc]
	b _0238B0FC
_0238A620:
	add r0, r6, #7
	bl ov20_0238B340
	mov r0, #4
	str r0, [sb, #0xc]
_0238A630:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x3f
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A644:
	add r0, r6, #8
	bl ov20_0238B340
	mov r0, #6
	str r0, [sb, #0xc]
_0238A654:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #7
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A668:
	add r0, r6, #9
	bl ov20_0238B340
	mov r0, #8
	str r0, [sb, #0xc]
_0238A678:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #9
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A68C:
	mov r0, #0
	str r0, [sb, #0x14]
	bl sub_02046D20
	ldrsb r0, [sb, #0x18]
	bl HidePortraitBox
	mov r0, #0
	strb r0, [sb, #0xa4]
	ldr r0, [sb, #0x9c]
	cmp r0, #0
	beq _0238A6BC
	add r0, sb, #0x9c
	bl sub_020125CC
_0238A6BC:
	mov r0, #0xa
	str r0, [sb, #0xc]
	b _0238B05C
_0238A6C8:
	ldr r0, [sb, #0x14]
	cmp r0, #0xc
	bgt _0238A718
	cmp r0, #0xb
	blt _0238A6EC
	beq _0238A7A0
	cmp r0, #0xc
	beq _0238A7FC
	b _0238A83C
_0238A6EC:
	cmp r0, #1
	bgt _0238A70C
	cmp r0, #0
	blt _0238A83C
	beq _0238A73C
	cmp r0, #1
	beq _0238A754
	b _0238A83C
_0238A70C:
	cmp r0, #0xa
	beq _0238A768
	b _0238A83C
_0238A718:
	cmp r0, #0x15
	bgt _0238A730
	bge _0238A820
	cmp r0, #0x14
	beq _0238A80C
	b _0238A83C
_0238A730:
	cmp r0, #0xff
	beq _0238A834
	b _0238A83C
_0238A73C:
	ldr r0, _0238B160 ; =OVERLAY20_UNKNOWN_POINTER__NA_238CF7C
	bl ov11_0230DB58
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238A83C
_0238A754:
	bl ov11_0230D220
	cmp r0, #0
	moveq r0, #0xa
	streq r0, [sb, #0x14]
	b _0238A83C
_0238A768:
	add r0, sb, #0x84
	mov r1, #0x18
	bl MemZero
	bl sub_02011F48
	mov r5, r0
	bl sub_02011F30
	mov r2, r0
	ldr r0, [sb, #0x80]
	mov r1, r5
	bl ov20_0238BB60
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238A83C
_0238A7A0:
	bl ov20_0238BD90
	cmp r0, #0
	beq _0238A83C
	bl ov20_0238C1F0
	cmp r0, #0
	bne _0238A7CC
	add r0, sb, #0x84
	bl ov20_0238C204
	mov r0, #2
	str r0, [sb, #0xa0]
	b _0238A7EC
_0238A7CC:
	cmp r0, #3
	movne r0, r7
	strne r0, [sb, #0xa0]
	bne _0238A7EC
	add r0, sb, #0x84
	bl ov20_0238C204
	mov r0, #3
	str r0, [sb, #0xa0]
_0238A7EC:
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238A83C
_0238A7FC:
	bl ov20_0238C230
	mov r0, #0x14
	str r0, [sb, #0x14]
	b _0238A83C
_0238A80C:
	bl ov11_0230D71C
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238A83C
_0238A820:
	bl ov11_0230D220
	cmp r0, #0
	moveq r0, #0xff
	streq r0, [sb, #0x14]
	b _0238A83C
_0238A834:
	mov r0, r7
	b _0238A840
_0238A83C:
	mov r0, #0
_0238A840:
	cmp r0, #0
	beq _0238B05C
	ldr r0, [sb, #0xa0]
	cmp r0, #2
	moveq r0, #0xb
	streq r0, [sb, #0xc]
	beq _0238B05C
	cmp r0, #3
	moveq r0, #0xf
	streq r0, [sb, #0xc]
	beq _0238B05C
	cmp r0, #1
	bne _0238B05C
	bl sub_02011EE8
	cmp r0, #0
	moveq r0, #0x3f
	streq r0, [sb, #0xc]
	movne r0, #1
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A890:
	add r0, sb, #0x30
	bl InitPreprocessorArgs
	ldr r1, [sb, #0x84]
	ldr r2, _0238B164 ; =RECYCLE_MENU_ITEMS_CONFIRM_2
	ldrsh r3, [r1]
	mov r0, sb
	add r1, r6, #0xa
	str r3, [sb, #0x40]
	bl ov20_0238B39C
	mov r0, #0xc
	str r0, [sb, #0xc]
_0238A8BC:
	bl sub_02046B04
	cmp r0, r4
	beq _0238B05C
	cmp r0, #8
	bne _0238A8F0
	add r0, sb, #0x84
	bl sub_02011EC4
	cmp r0, #0
	movne r0, #0x13
	strne r0, [sb, #0xc]
	moveq r0, #0x1f
	streq r0, [sb, #0xc]
	b _0238B05C
_0238A8F0:
	mov r0, #0xd
	str r0, [sb, #0xc]
	b _0238B05C
_0238A8FC:
	add r0, r6, #0xb
	bl ov20_0238B340
	mov r0, #0xe
	str r0, [sb, #0xc]
_0238A90C:
	bl sub_02046C78
	cmp r0, #0
	beq _0238B05C
	mov r0, #9
	str r0, [sb, #0xc]
	b _0238B0FC
_0238A924:
	add r0, sb, #0x30
	bl InitPreprocessorArgs
	ldr r1, [sb, #0x84]
#ifdef NORTH_AMERICA
	mov r0, #0x4600
#else
	add r0, r6, #0xc
#endif
	ldrsh r1, [r1]
	str r1, [sb, #0x40]
	bl ov20_0238B340
	mov r0, #0x10
	str r0, [sb, #0xc]
_0238A948:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #9
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A95C:
	add r0, r6, #0xe
	bl ov20_0238B340
	mov r0, #0x12
	str r0, [sb, #0xc]
_0238A96C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #1
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A980:
	add r0, r6, #0xd
	bl ov20_0238B340
	mov r0, #0x14
	str r0, [sb, #0xc]
_0238A990:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x15
	strne r0, [sb, #0xc]
	b _0238B05C
_0238A9A4:
	mov r0, sb
	mov r1, #0
	bl ov20_0238B410
	mov r0, #0x17
	str r0, [sb, #0xc]
	b _0238B05C
_0238A9BC:
	mov r0, sb
	mov r1, r7
	bl ov20_0238B410
	mov r0, #0x17
	str r0, [sb, #0xc]
	b _0238B05C
_0238A9D4:
	ldr r0, [sb, #0x14]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238AA84
_0238A9E4: ; jump table
	b _0238A9F4 ; case 0
	b _0238AA28 ; case 1
	b _0238AA68 ; case 2
	b _0238AA7C ; case 3
_0238A9F4:
	add r0, sb, #0x84
	bl sub_02011DF0
	mov r5, r0
	add r0, sb, #0x84
	bl sub_02011E24
	mov r1, r0
	mov r0, r5
	ldrb r2, [sb, #0xa6]
	bl ov20_0238C2E0
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238AA84
_0238AA28:
	bl ov20_0238C50C
	cmp r0, #0
	beq _0238AA84
	bl ov20_0238CA0C
	cmp r0, #0
	movne r0, r7
	strne r0, [sb, #0xa0]
	bne _0238AA58
	mov r0, #2
	str r0, [sb, #0xa0]
	bl ov20_0238CA20
	str r0, [sb, #0x9c]
_0238AA58:
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238AA84
_0238AA68:
	bl ov20_0238CA3C
	ldr r0, [sb, #0x14]
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _0238AA84
_0238AA7C:
	mov r0, r7
	b _0238AA88
_0238AA84:
	mov r0, #0
_0238AA88:
	cmp r0, #0
	beq _0238B05C
	ldr r0, [sb, #0xa0]
	cmp r0, #2
	moveq r0, #0x1b
	streq r0, [sb, #0xc]
	beq _0238B05C
	cmp r0, #1
	moveq r0, #0x11
	streq r0, [sb, #0xc]
	b _0238B05C
_0238AAB4:
	add r0, sb, #0x30
	bl InitPreprocessorArgs
	ldr r1, [sb, #0x84]
	add r0, sb, #0x84
	ldrsh r1, [r1]
	str r1, [sb, #0x40]
	bl sub_02011E24
	str r0, [sb, #0x58]
	ldr r2, _0238B164 ; =RECYCLE_MENU_ITEMS_CONFIRM_2
	mov r0, sb
	add r1, r6, #0xf
	bl ov20_0238B39C
	mov r0, #0x1c
	str r0, [sb, #0xc]
_0238AAEC:
	bl sub_02046B04
	cmp r0, r4
	beq _0238B05C
	cmp r0, #8
	moveq r0, #0x1f
	streq r0, [sb, #0xc]
	movne r0, #0x1d
	moveq r7, #0
	strne r0, [sb, #0xc]
	b _0238B05C
_0238AB14:
	ldr r0, [sb, #0x80]
	cmp r0, #2
	bne _0238AB24
	bl sub_02011F14
_0238AB24:
	mov r0, #1
	strb r0, [sb, #0xb0]
	bl sub_02011F60
	ldr r1, [sb, #0x9c]
	add r0, sb, #0x84
	cmp r1, #0
	beq _0238AB48
	bl sub_02012874
	b _0238AB4C
_0238AB48:
	bl sub_0201271C
_0238AB4C:
	add r0, sb, #0x84
	bl sub_02011DFC
	cmp r0, #0
	movne r0, #0x2f
	strne r0, [sb, #0xc]
	moveq r0, #0x20
	streq r0, [sb, #0xc]
	moveq r7, #0
	b _0238B05C
_0238AB70:
#ifdef JAPAN
	mov r0, #0x1cc0
#else
	add r0, r6, #0x10
#endif
	bl ov20_0238B340
	mov r0, #0x1e
	str r0, [sb, #0xc]
_0238AB80:
	bl sub_02046C78
	cmp r0, #0
	beq _0238B05C
	ldr r0, [sb, #0x9c]
	cmp r0, #0
	movne r0, #0x16
	strne r0, [sb, #0xc]
	moveq r0, #9
	streq r0, [sb, #0xc]
	b _0238B05C
_0238ABA8:
	bl IsBagFull
	cmp r0, #0
	movne r0, #0x27
	strne r0, [sb, #0xc]
	moveq r0, #0x21
	streq r0, [sb, #0xc]
	b _0238B05C
_0238ABC4:
	add r0, r6, #0x19
	bl ov20_0238B340
	mov r0, #0x22
	str r0, [sb, #0xc]
_0238ABD4:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x23
	strne r0, [sb, #0xc]
	movne r7, #0
	b _0238B05C
_0238ABEC:
	ldr r1, [sb, #0x84]
	add r0, sp, #0x10
	ldrsh r1, [r1]
	mov r2, #0
	bl InitStandardItem
	add r0, sp, #0x10
	bl AddItemToBagNoHeld
	bl sub_02046D20
	ldrsb r0, [sb, #0x18]
	bl HidePortraitBox
	mov r0, #0
	strb r0, [sb, #0xa4]
	bl sub_020037A4
	add r0, r0, #0xa
	str r0, [sb, #0xac]
	mov r0, #0x24
	str r0, [sb, #0xc]
	b _0238B05C
_0238AC34:
	bl sub_020037A4
	ldr r1, [sb, #0xac]
	cmp r0, r1
	bls _0238B05C
	ldr r0, [sb, #0x84]
	ldr r1, [sl]
	ldrsh r2, [r0]
	add r0, r6, #0x1a
	str r2, [r1, #0x40]
	bl StringFromId
	ldr r2, [sl]
	mov r1, r0
	mov r0, #0x1c
	add r2, r2, #0x30
	bl sub_02046C30
	mov r0, #0x25
	str r0, [sb, #0xc]
	mov r0, #4
	bl sub_02017C50
	b _0238B05C
_0238AC84:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x26
	strne r0, [sb, #0xc]
	b _0238B05C
_0238AC98:
	mov r0, #4
	bl sub_02017C10
	cmp r0, #0
	moveq r0, #0x36
	streq r0, [sb, #0xc]
	b _0238B05C
_0238ACB0:
	add r0, r6, #0x16
	bl ov20_0238B340
	mov r0, #0x28
	str r0, [sb, #0xc]
_0238ACC0:
	bl sub_02046C78
	cmp r0, #0
	beq _0238B05C
	ldr r1, [sb, #0x84]
	add r0, sp, #0xa
	ldrsh r1, [r1]
	mov r2, #0
	bl InitStandardItem
	add r0, sp, #0xa
	bl AddItemToStorage
	mov r0, #0x2b
	str r0, [sb, #0xc]
	bl sub_02046D20
	ldrsb r0, [sb, #0x18]
	bl HidePortraitBox
	mov r0, #0
	strb r0, [sb, #0xa4]
	bl sub_020037A4
	add r0, r0, #0xa
	str r0, [sb, #0xac]
	b _0238B05C
_0238AD14:
	add r0, r6, #0x17
	bl ov20_0238B340
	mov r0, #0x2a
	str r0, [sb, #0xc]
_0238AD24:
	bl sub_02046C78
	cmp r0, #0
	beq _0238B05C
	ldr r1, [sb, #0x84]
	add r0, sp, #4
	ldrsh r1, [r1]
	mov r2, #0
	bl InitStandardItem
	add r0, sp, #4
	bl AddItemToStorage
	mov r0, #0x2b
	str r0, [sb, #0xc]
	bl sub_02046D20
	ldrsb r0, [sb, #0x18]
	bl HidePortraitBox
	mov r0, #0
	strb r0, [sb, #0xa4]
	bl sub_020037A4
	add r0, r0, #0xa
	str r0, [sb, #0xac]
	b _0238B05C
_0238AD78:
	bl sub_020037A4
	ldr r1, [sb, #0xac]
	cmp r0, r1
	bls _0238B05C
	ldr r0, [sb, #0x84]
	ldr r1, [sl]
	ldrsh r2, [r0]
	add r0, r6, #0x18
	str r2, [r1, #0x40]
	bl StringFromId
	ldr r2, [sl]
	mov r1, r0
	mov r0, #0x1c
	add r2, r2, #0x30
	bl sub_02046C30
	mov r0, #0x2c
	str r0, [sb, #0xc]
	mov r0, #4
	bl sub_02017C50
	b _0238B05C
_0238ADC8:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x2d
	strne r0, [sb, #0xc]
	b _0238B05C
_0238ADDC:
	mov r0, #4
	bl sub_02017C10
	cmp r0, #0
	bne _0238B05C
	mov r0, #0x2e
	str r0, [sb, #0xc]
	bl sub_02046D20
	bl sub_020037A4
	add r0, r0, #0xa
	str r0, [sb, #0xac]
	b _0238B05C
_0238AE08:
	bl sub_020037A4
	ldr r1, [sb, #0xac]
	cmp r0, r1
	movhi r0, #0x36
	strhi r0, [sb, #0xc]
	b _0238B05C
_0238AE20:
	add r0, sb, #0x30
	bl InitPreprocessorArgs
	ldr r1, [sb, #0x84]
	add r0, r6, #0x11
	ldrsh r1, [r1]
	str r1, [sb, #0x40]
	bl ov20_0238B340
	mov r0, #0x30
	str r0, [sb, #0xc]
_0238AE44:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x31
	strne r0, [sb, #0xc]
	b _0238B05C
_0238AE58:
	ldr r2, _0238B168 ; =RECYCLE_SUBMENU_ITEMS_1
	mov r0, sb
	add r1, r6, #0x12
	bl ov20_0238B39C
	mov r0, #0x32
	str r0, [sb, #0xc]
_0238AE70:
	bl sub_02046B04
	cmp r0, r4
	beq _0238B05C
	cmp r0, #8
	movne r0, #0x33
	strne r0, [sb, #0xc]
	bne _0238B05C
	add r0, sb, #0x84
	bl sub_02011DF0
	strh r0, [sb, #0xa8]
	mov r0, #0x3e
	str r0, [sb, #0xc]
	b _0238B05C
_0238AEA4:
	add r0, r6, #0x15
	bl ov20_0238B340
	mov r0, #0x34
	str r0, [sb, #0xc]
_0238AEB4:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x35
	strne r0, [sb, #0xc]
	movne r7, #0
	b _0238B05C
_0238AECC:
	bl IsBagFull
	cmp r0, #0
	movne r0, #0x29
	strne r0, [sb, #0xc]
	moveq r0, #0x23
	streq r0, [sb, #0xc]
	b _0238B05C
_0238AEE8:
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x64
	bl _s32_div_f
	mov r5, r1, lsl #0x10
	add r0, sb, #0x84
	bl sub_02011E18
	cmp r0, r5, lsr #16
	movls r0, #0
	bls _0238AF50
	bl sub_02011F48
	bl sub_02011D9C
	mov r5, r0
	str r5, [sp]
	bl Rand16Bit
	ldr r1, [r5, #4]
	bl _s32_div_f
	ldr r2, [r5]
	mov r0, #0x18
	mla r0, r1, r0, r2
	bl sub_02011DF0
	strh r0, [sb, #0xa8]
	add r0, sp, #0
	bl sub_02011DB8
	mov r0, r7
_0238AF50:
	cmp r0, #0
	movne r0, #0x37
	moveq r0, #1
	str r0, [sb, #0xc]
	mov r7, #0
	b _0238B05C
_0238AF68:
	ldrsh r1, [sb, #0xa8]
	add r0, r6, #0x1b
	str r1, [sb, #0x40]
	bl ov20_0238B340
	mov r0, #0x38
	str r0, [sb, #0xc]
_0238AF80:
	bl sub_02046C78
	cmp r0, #0
	beq _0238B05C
	ldr r2, _0238B168 ; =RECYCLE_SUBMENU_ITEMS_1
	mov r0, sb
	add r1, r6, #0x1c
	bl ov20_0238B39C
	mov r0, #0x39
	str r0, [sb, #0xc]
	mov r7, #0
	b _0238B05C
_0238AFAC:
	bl sub_02046B04
	cmp r0, r4
	beq _0238B05C
	cmp r0, #8
	moveq r0, #0x3e
	streq r0, [sb, #0xc]
	movne r0, #0x3a
	strne r0, [sb, #0xc]
	b _0238B05C
_0238AFD0:
	ldr r2, _0238B168 ; =RECYCLE_SUBMENU_ITEMS_1
	mov r0, sb
	add r1, r6, #0x1d
	bl ov20_0238B39C
	mov r0, #0x3b
	str r0, [sb, #0xc]
_0238AFE8:
	bl sub_02046B04
	cmp r0, r4
	beq _0238B05C
	cmp r0, #8
	moveq r0, #0x3e
	streq r0, [sb, #0xc]
	movne r0, #0x3c
	strne r0, [sb, #0xc]
	b _0238B05C
_0238B00C:
	add r0, r6, #0x1e
	bl ov20_0238B340
	mov r0, #0x3d
	str r0, [sb, #0xc]
_0238B01C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #1
	strne r0, [sb, #0xc]
	movne r7, #0
	b _0238B05C
_0238B034:
	mov r0, #6
	str r0, [sb, #4]
	mov r0, #0
	str r0, [sb, #0xc]
	b _0238B0FC
_0238B048:
	mov r0, #4
	str r0, [sb, #4]
	mov r0, #0
	str r0, [sb, #0xc]
	b _0238B0FC
_0238B05C:
	ldr r0, [sb, #0xc]
	sub r0, r0, #0x3e
	cmp r0, #1
	movls r7, #0
_0238B06C:
	cmp r7, #0
	beq _0238A3D8
	b _0238B0FC
_0238B078:
	ldrsb r0, [sb, #0x18]
	bl HidePortraitBox
	mov r1, #0
	mov r0, sb
	strb r1, [sb, #0xa4]
	bl ov20_0238B510
	bl sub_02046D20
	mov r1, #1
	b _0238B100
_0238B09C:
	ldr r1, _0238B16C ; =0x00004613
	mov r0, sb
	bl ov20_0238B450
	cmp r0, #0
	movne r0, #4
	strne r0, [sb, #4]
	b _0238B0FC
_0238B0B8:
	ldr r1, _0238B170 ; =0x00004614
	mov r0, sb
	bl ov20_0238B450
	cmp r0, #0
	beq _0238B0FC
	mov r0, #9
	str r0, [sb, #4]
	ldrsb r0, [sb, #0x18]
	bl HidePortraitBox
	mov r0, #0
	strb r0, [sb, #0xa4]
	bl sub_02046D20
	b _0238B0FC
_0238B0EC:
	bl ov11_0230D220
	cmp r0, #0
	moveq r1, #2
	beq _0238B100
_0238B0FC:
	mov r1, #0
_0238B100:
	sub r0, r1, #1
	cmp r0, #1
	bhi _0238B288
	cmp r1, #1
	moveq r0, #7
	streq r0, [r8]
	movne r0, #3
	strne r0, [r8]
	b _0238B288
_0238B124:
	mov r0, #4
	str r0, [r8]
	b _0238B288
_0238B130:
	mov r0, r8
	bl ov20_0238B510
	mov r0, #5
	str r0, [r8]
	b _0238B288
	.align 2, 0
#if defined(EUROPE)
#define OV20_0238A1B0_OFFSET 0x1F
#elif defined(JAPAN)
#define OV20_0238A1B0_OFFSET -0x2944
#else
#define OV20_0238A1B0_OFFSET 0
#endif
_0238B144: .word OVERLAY20_UNKNOWN_POINTER__NA_238D120
_0238B148: .word 0x000045EE + OV20_0238A1B0_OFFSET
_0238B14C: .word RECYCLE_MAIN_MENU_ITEMS_1
_0238B150: .word 0x000045ED + OV20_0238A1B0_OFFSET
_0238B154: .word 0x000045F4 + OV20_0238A1B0_OFFSET
_0238B158: .word RECYCLE_MENU_ITEMS_CONFIRM_1
_0238B15C: .word RECYCLE_SUBMENU_ITEMS_2
_0238B160: .word OVERLAY20_UNKNOWN_POINTER__NA_238CF7C
_0238B164: .word RECYCLE_MENU_ITEMS_CONFIRM_2
_0238B168: .word RECYCLE_SUBMENU_ITEMS_1
_0238B16C: .word 0x00004613 + OV20_0238A1B0_OFFSET
_0238B170: .word 0x00004614 + OV20_0238A1B0_OFFSET
_0238B174:
	add r0, sp, #0x18
	bl ov11_0230CCF0
	tst r0, #0x100
	beq _0238B198
	ldr r0, [sp, #0xa0]
	ldr r2, [sp, #0x9c]
	mov r1, #0
	blx r2
	b _0238B19C
_0238B198:
	bl ov11_022E6E68
_0238B19C:
	mov r0, #4
	b _0238B28C
_0238B1A4:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238B1BC
	bl ov11_0230CCE0
	cmp r0, #0
	beq _0238B288
_0238B1BC:
	mov r0, #2
	str r0, [r8]
	b _0238B288
_0238B1C8:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238B1E0
	bl ov11_0230CCE0
	cmp r0, #0
	beq _0238B288
_0238B1E0:
	ldrsh r0, [r8, #0xa8]
	cmp r0, #0
	bne _0238B1F8
	mov r0, #5
	bl ov11_022E6E8C
	b _0238B244
_0238B1F8:
	cmp r0, #0xa9
	bne _0238B20C
	mov r0, #1
	bl ov11_022E6E8C
	b _0238B244
_0238B20C:
	cmp r0, #0xaa
	bne _0238B220
	mov r0, #2
	bl ov11_022E6E8C
	b _0238B244
_0238B220:
	cmp r0, #0xab
	bne _0238B234
	mov r0, #3
	bl ov11_022E6E8C
	b _0238B244
_0238B234:
	cmp r0, #0xac
	bne _0238B244
	mov r0, #4
	bl ov11_022E6E8C
_0238B244:
	mov r0, #4
	str r0, [r8, #4]
	mov r0, #0
	str r0, [r8, #0xc]
	mov r0, #6
	str r0, [r8]
	b _0238B288
_0238B260:
	bl ov11_022E6EC8
	cmp r0, #0
	bne _0238B278
	bl ov11_0230CCE0
	cmp r0, #0
	beq _0238B288
_0238B278:
	mov r0, #4
	bl ov11_022E6E8C
	mov r0, #6
	str r0, [r8]
_0238B288:
	mov r0, #1
_0238B28C:
	add sp, sp, #0xb0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov20_0238A1B0

	arm_func_start ov20_0238B294
ov20_0238B294: ; 0x0238B294
	stmdb sp!, {r4, lr}
	ldr r1, _0238B33C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _0238B2C8
	mov r0, #0xb4
	mov r1, #8
	bl MemAlloc
	ldr r2, _0238B33C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r1, #0xb4
	str r0, [r2]
	bl MemZero
_0238B2C8:
	ldr r0, _0238B33C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r1, #0
	ldr r2, [r0]
	mvn r0, #1
	strb r0, [r2, #0x18]
	strb r0, [r2, #0x2c]
	strb r0, [r2, #0x2d]
	strb r0, [r2, #0x2e]
	str r1, [r2]
	str r1, [r2, #4]
	str r1, [r2, #0xc]
	str r1, [r2, #0x10]
	sub r0, r1, #1
	str r0, [r2, #8]
	str r1, [r2, #0x14]
	strb r1, [r2, #0xa4]
	str r1, [r2, #0x9c]
	strh r1, [r2, #0xa8]
	strb r1, [r2, #0xb0]
	cmp r4, #0
	strb r4, [r2, #0xa5]
	movne r0, #1
	strne r0, [r2]
	movne r0, #4
	strne r0, [r2, #4]
	strne r1, [r2, #0xc]
	bl sub_020017EC
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238B33C: .word OVERLAY20_UNKNOWN_POINTER__NA_238D120
	arm_func_end ov20_0238B294

	arm_func_start ov20_0238B340
ov20_0238B340: ; 0x0238B340
	stmdb sp!, {r4, lr}
	ldr r1, _0238B394 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r4, r0
	ldr r0, [r1]
	ldrb r1, [r0, #0xa4]
	cmp r1, #0
	bne _0238B360
	bl ov20_0238B4A8
_0238B360:
	ldr r1, _0238B394 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x188
	str r2, [r1, #0x7c]
	bl StringFromId
	ldr r2, _0238B394 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	mov r1, r0
	ldr r2, [r2]
	ldr r0, _0238B398 ; =0x0000301C
	add r2, r2, #0x30
	bl sub_02046C30
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238B394: .word OVERLAY20_UNKNOWN_POINTER__NA_238D120
_0238B398: .word 0x0000301C
	arm_func_end ov20_0238B340

	arm_func_start ov20_0238B39C
ov20_0238B39C: ; 0x0238B39C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xa4
	ldrb r3, [r0, #0xa4]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	bne _0238B3BC
	bl ov20_0238B4A8
_0238B3BC:
	ldr r1, _0238B40C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	add r0, sp, #0xc
	ldr r2, [r1]
	mov r3, #0x188
	mov r1, #0x98
	str r3, [r2, #0x7c]
	bl MemZero
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, _0238B40C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D120
	stmia sp, {r4, r5}
	ldr r1, [r1]
	add r3, sp, #0xc
	add ip, r1, #0x30
	mov r1, #0x3000
	mov r2, #0x33
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0238B40C: .word OVERLAY20_UNKNOWN_POINTER__NA_238D120
	arm_func_end ov20_0238B39C

	arm_func_start ov20_0238B410
ov20_0238B410: ; 0x0238B410
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x14]
	strb r1, [r4, #0xa6]
	ldrsb r0, [r4, #0x18]
	bl HidePortraitBox
	mov r0, #0
	strb r0, [r4, #0xa4]
	bl sub_02046D20
	ldr r0, [r4, #0x9c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x9c
	bl sub_020125CC
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238B410

	arm_func_start ov20_0238B450
ov20_0238B450: ; 0x0238B450
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0238B470
	cmp r0, #1
	beq _0238B488
	b _0238B4A0
_0238B470:
	mov r0, r1
	bl ov20_0238B340
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _0238B4A0
_0238B488:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0x10]
	movne r0, #1
	ldmneia sp!,  {r4, pc}
_0238B4A0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238B450

	arm_func_start ov20_0238B4A8
ov20_0238B4A8: ; 0x0238B4A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r1, [r4, #0x18]
	mvn r0, #1
	cmp r1, r0
	bne _0238B4D4
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	strb r0, [r4, #0x18]
_0238B4D4:
	add r0, r4, #0x1c
	mov r1, #0x188
	bl InitPortraitParamsWithMonsterId
	add r0, r4, #0x1c
	mov r1, #0
	bl SetPortraitLayout
	add r0, r4, #0x1c
	mov r1, #0
	bl SetPortraitEmotion
	ldrsb r0, [r4, #0x18]
	add r1, r4, #0x1c
	bl ShowPortraitInPortraitBox
	mov r0, #1
	strb r0, [r4, #0xa4]
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238B4A8

	arm_func_start ov20_0238B510
ov20_0238B510: ; 0x0238B510
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r0, [r4, #0x18]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl ClosePortraitBox
	mvn r0, #1
	strb r0, [r4, #0x18]
	mov r0, #0
	strb r0, [r4, #0xa4]
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238B510

	arm_func_start ov20_0238B540
ov20_0238B540: ; 0x0238B540
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x84
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238B5A8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mov r2, #0
	str r0, [r1]
	mvn r1, #1
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x15]
	strb r1, [r0, #0x16]
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	sub r1, r2, #1
	str r1, [r0, #8]
	strb r2, [r0, #0x68]
	add ip, r0, #0x6c
	ldmia r4!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia ip, {r0, r1}
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238B5A8: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
	arm_func_end ov20_0238B540

	arm_func_start ov20_0238B5AC
ov20_0238B5AC: ; 0x0238B5AC
	stmdb sp!, {r3, lr}
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #0x14]
	mvn r1, #1
	cmp r0, r1
	beq _0238B5E4
	bl CloseTextBox
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
_0238B5E4:
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x15]
	cmp r0, r1
	beq _0238B610
	bl CloseTextBox
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x15]
_0238B610:
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	cmp r0, r1
	beq _0238B63C
	bl CloseTextBox
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x16]
_0238B63C:
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238B658 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B658: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
	arm_func_end ov20_0238B5AC

	arm_func_start ov20_0238B65C
ov20_0238B65C: ; 0x0238B65C
	stmdb sp!, {r4, lr}
	ldr r0, _0238B7E4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r4, [r0]
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0238B7DC
_0238B684: ; jump table
	b _0238B6A4 ; case 0
	b _0238B6B0 ; case 1
	b _0238B79C ; case 2
	b _0238B7A8 ; case 3
	b _0238B7B4 ; case 4
	b _0238B7BC ; case 5
	b _0238B7C8 ; case 6
	b _0238B7D4 ; case 7
_0238B6A4:
	mov r0, #1
	str r0, [r4]
	b _0238B7DC
_0238B6B0:
	ldr r0, [r4, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0238B788
_0238B6C0: ; jump table
	b _0238B788 ; case 0
	b _0238B6E0 ; case 1
	b _0238B6E0 ; case 2
	b _0238B6E0 ; case 3
	b _0238B788 ; case 4
	b _0238B780 ; case 5
	b _0238B780 ; case 6
	b _0238B780 ; case 7
_0238B6E0:
	ldrsb r1, [r4, #0x14]
	mvn r0, #1
	cmp r1, r0
	bne _0238B70C
	ldr r0, _0238B7E8 ; =RECYCLE_WINDOW_PARAMS_2
	ldr r1, _0238B7EC ; =ov20_0238B8CC
	mov r2, r4
	bl CreateTextBoxWithArg
	ldr r1, _0238B7E4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r1, [r1]
	strb r0, [r1, #0x14]
_0238B70C:
	ldr r1, _0238B7E4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x15]
	cmp r1, r0
	bne _0238B740
	ldr r0, _0238B7F0 ; =RECYCLE_WINDOW_PARAMS_1
	ldr r1, _0238B7F4 ; =ov20_0238BA40
	mov r2, r4
	bl CreateTextBoxWithArg
	ldr r1, _0238B7E4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r1, [r1]
	strb r0, [r1, #0x15]
_0238B740:
	ldr r1, _0238B7E4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x16]
	cmp r1, r0
	bne _0238B774
	ldr r0, _0238B7F8 ; =RECYCLE_WINDOW_PARAMS_3
	ldr r1, _0238B7FC ; =ov20_0238BAB4
	mov r2, r4
	bl CreateTextBoxWithArg
	ldr r1, _0238B7E4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r1, [r1]
	strb r0, [r1, #0x16]
_0238B774:
	mov r0, #0
	str r0, [r4, #4]
	b _0238B788
_0238B780:
	mov r0, #3
	b _0238B78C
_0238B788:
	mov r0, #0
_0238B78C:
	cmp r0, #3
	moveq r0, #2
	streq r0, [r4]
	b _0238B7DC
_0238B79C:
	mov r0, #3
	str r0, [r4]
	b _0238B7DC
_0238B7A8:
	mov r0, #4
	str r0, [r4]
	b _0238B7DC
_0238B7B4:
	mov r0, #4
	ldmia sp!, {r4, pc}
_0238B7BC:
	mov r0, #1
	str r0, [r4]
	b _0238B7DC
_0238B7C8:
	mov r0, #5
	str r0, [r4]
	b _0238B7DC
_0238B7D4:
	mov r0, #5
	str r0, [r4]
_0238B7DC:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238B7E4: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
_0238B7E8: .word RECYCLE_WINDOW_PARAMS_2
_0238B7EC: .word ov20_0238B8CC
_0238B7F0: .word RECYCLE_WINDOW_PARAMS_1
_0238B7F4: .word ov20_0238BA40
_0238B7F8: .word RECYCLE_WINDOW_PARAMS_3
_0238B7FC: .word ov20_0238BAB4
	arm_func_end ov20_0238B65C

	arm_func_start ov20_0238B800
ov20_0238B800: ; 0x0238B800
	ldr r0, _0238B820 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0238B820: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
	arm_func_end ov20_0238B800

	arm_func_start ov20_0238B824
ov20_0238B824: ; 0x0238B824
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	beq _0238B888
	ldr r0, _0238B8C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	ldr r1, [r0]
	ldrb r0, [r1, #0x68]
	cmp r0, #0
	beq _0238B87C
	ldrsb r0, [r1, #0x14]
	mvn r1, #1
	cmp r0, r1
	beq _0238B85C
	bl sub_0202F9B8
_0238B85C:
	ldr r0, _0238B8C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x15]
	cmp r0, r1
	beq _0238B898
	bl sub_0202F9B8
	b _0238B898
_0238B87C:
	mov r0, #1
	str r0, [r1, #4]
	b _0238B898
_0238B888:
	ldr r0, _0238B8C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_0238B898:
	ldr r0, _0238B8C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	cmp r5, #0
	ldr r1, [r0]
	strb r4, [r1, #0x68]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r4, [r0]
	ldmia r5!, {r0, r1, r2, r3}
	add r4, r4, #0x6c
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1}
	stmia r4, {r0, r1}
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238B8C8: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
	arm_func_end ov20_0238B824

	arm_func_start ov20_0238B8CC
ov20_0238B8CC: ; 0x0238B8CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x154
	ldr r1, _0238BA30 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mov sl, r0
	ldr r1, [r1]
	mov r8, #0
	add r7, r1, #0x6c
	ldr r4, [r1, #0x6c]
	bl sub_02027B1C
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, _0238BA34 ; =0x00004618
	bl StringFromId
	mov r3, r0
	mov r0, sl
	mov r1, #8
	mov r2, r8
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	mov r0, sl
	mov r1, #8
	mov r2, #0x10
	mov r3, #0xd0
	bl sub_02025D50
	ldr fp, _0238BA38 ; =0x0000461C
	add r6, r4, #0x14
	add r8, r8, #0x18
	mov sb, #0
	sub r4, fp, #2
	sub r5, fp, #1
	b _0238BA14
_0238B94C:
	mov r0, sb, lsl #2
	ldrsh r1, [r6, r0]
	ldr r0, _0238BA3C ; =0x00000578
	add r2, r6, sb, lsl #2
	cmp r1, r0
	mov r3, #0x400
	bne _0238B9B0
	ldrsh r2, [r2, #2]
	add r0, r7, sb, lsl #1
	str r2, [sp, #0x2c]
	ldrsh r1, [r0, #4]
	ldrsh r0, [r0, #0xc]
	add r0, r1, r0
	cmp r2, r0
	str r0, [sp, #0x30]
	addgt r0, fp, #1
	movle r0, fp
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	add r0, sp, #4
	str r0, [sp]
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	b _0238B9F8
_0238B9B0:
	str r1, [sp, #0x14]
	ldrsh r2, [r2, #2]
	add r0, r7, sb, lsl #1
	str r2, [sp, #0x2c]
	ldrsh r1, [r0, #4]
	ldrsh r0, [r0, #0xc]
	add r0, r1, r0
	cmp r2, r0
	str r0, [sp, #0x30]
	movgt r0, r5
	movle r0, r4
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	add r0, sp, #4
	str r0, [sp]
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
_0238B9F8:
	mov r0, sl
	mov r1, #8
	mov r2, r8
	add r3, sp, #0x54
	bl DrawTextInWindow
	add r8, r8, #0xc
	add sb, sb, #1
_0238BA14:
	ldrsh r0, [r7, #0x14]
	cmp sb, r0
	blt _0238B94C
	mov r0, sl
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV20_0238B8CC_OFFSET 0x1F
#elif defined(JAPAN)
#define OV20_0238B8CC_OFFSET -0x2944
#else
#define OV20_0238B8CC_OFFSET 0
#endif
_0238BA30: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
_0238BA34: .word 0x00004618 + OV20_0238B8CC_OFFSET
_0238BA38: .word 0x0000461C + OV20_0238B8CC_OFFSET
_0238BA3C: .word 0x00000578
	arm_func_end ov20_0238B8CC

	arm_func_start ov20_0238BA40
ov20_0238BA40: ; 0x0238BA40
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	ldr r1, _0238BAAC ; =OVERLAY20_UNKNOWN_POINTER__NA_238D124
	mov r5, r0
	ldr r1, [r1]
	ldr r4, [r1, #0x6c]
	bl sub_02027B1C
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldrsh r1, [r4]
	ldr r2, _0238BAB0 ; =0x00004617
	add ip, sp, #4
	str r1, [sp, #0x14]
	add r0, sp, #0x54
	mov r1, #0x100
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r5
	mov r1, #8
	mov r2, #2
	bl DrawTextInWindow
	mov r0, r5
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0238BAAC: .word OVERLAY20_UNKNOWN_POINTER__NA_238D124
#if defined(EUROPE)
_0238BAB0: .word 0x00004636
#elif defined(JAPAN)
_0238BAB0: .word 0x00001CD3
#else
_0238BAB0: .word 0x00004617
#endif
	arm_func_end ov20_0238BA40

	arm_func_start ov20_0238BAB4
ov20_0238BAB4: ; 0x0238BAB4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x154
	mov r4, r0
	bl sub_02027B1C
	add r0, sp, #4
	bl InitPreprocessorArgs
	add ip, sp, #4
	ldr r2, _0238BB58 ; =0x0000461E
	add r0, sp, #0x54
	mov r1, #0x100
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	mov r0, r4
	mov r1, #8
	mov r2, #0x10
	mov r3, #0xd0
	bl sub_02025D50
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _0238BB5C ; =0x0000461F
	add r0, sp, #0x54
	mov r1, #0x100
	mov r3, #0x400
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #8
	mov r2, #0x18
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV20_0238BAB4_OFFSET 0x1F
#elif defined(JAPAN)
#define OV20_0238BAB4_OFFSET -0x2944
#else
#define OV20_0238BAB4_OFFSET 0
#endif
_0238BB58: .word 0x0000461E + OV20_0238BAB4_OFFSET
_0238BB5C: .word 0x0000461F + OV20_0238BAB4_OFFSET
	arm_func_end ov20_0238BAB4

	arm_func_start ov20_0238BB60
ov20_0238BB60: ; 0x0238BB60
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r5, r0
	bl sub_02011CF4
	mov r4, r0
	mov r0, #0x340
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238BD80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mvn r6, #1
	str r0, [r1]
	strb r6, [r0, #4]
	ldr r0, [r1]
	add r2, r6, #1
	strb r6, [r0, #5]
	ldr r0, [r1]
	mov r3, #0
	strb r6, [r0, #6]
	ldr r0, [r1]
	cmp r5, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	str r3, [r0, #8]
	ldr r0, [r1]
	str r3, [r0, #0x10]
	ldr r2, [r1]
	ldr r0, [r2, #0x10]
	str r0, [r2, #0x14]
	ldr r0, [r1]
	str r3, [r0]
	ldr r0, [r1]
	strb r3, [r0, #0x18]
	ldr r0, [r1]
	str r4, [r0, #0x334]
	ldr r2, [r1]
	ldr r0, [r2, #0x334]
	ldr r0, [r0]
	str r0, [r2, #0x338]
	ldreq r0, [r1]
	ldreq r1, _0238BD84 ; =0x00004622
	streqh r1, [r0, #0x24]
	beq _0238BC20
	cmp r5, #2
	ldr r0, [r1]
	ldreq r1, _0238BD88 ; =0x00004621
	streqh r1, [r0, #0x24]
	ldrne r1, _0238BD8C ; =0x00004620
	strneh r1, [r0, #0x24]
_0238BC20:
	ldr r0, _0238BD80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r2, #0x10
	ldr r1, [r0]
	mov r3, #0xd
	str r2, [r1, #0x28]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x20]
	ldr r1, [r0]
	mov r0, #0x14
	str r2, [r1, #0x90]
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r2, _0238BD80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #8
	ldr r3, [r2]
	str r0, [r3, #0x1c]
	ldr r0, [r2]
	ldr r0, [r0, #0x334]
	ldr r0, [r0, #4]
	add r0, r0, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	bl MemAlloc
	mov r7, #0
	ldr sl, _0238BD80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	add r6, sp, #0
	ldr r1, [sl]
	mov r5, r7
	str r0, [r1, #0x33c]
	mov r4, r7
	mov r8, #0x18
	b _0238BCEC
_0238BCA0:
	mul r1, r7, r8
	ldr r2, [r2]
	mov r0, r6
	ldr r1, [r2, r1]
	mov r2, r5
	ldrsh r1, [r1]
	bl InitStandardItem
	ldr r0, [sl]
	add sb, r7, r7, lsl #6
	ldr r0, [r0, #0x33c]
	mov r1, r6
	mov r2, r4
	add r0, r0, sb, lsl #2
	bl sub_0200D670
	ldr r0, [sl]
	ldr r0, [r0, #0x33c]
	add r0, r0, sb, lsl #2
	str r7, [r0, #0x100]
	add r7, r7, #1
_0238BCEC:
	ldr r1, [sl]
	ldr r2, [r1, #0x334]
	ldr r0, [r2, #4]
	cmp r7, r0
	blt _0238BCA0
	ldr r2, [r1, #0x33c]
	mov r3, #0
	add r0, r7, r7, lsl #6
	ldr r1, _0238BD80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	strb r3, [r2, r0, lsl #2]
	ldr r2, [r1]
	sub r4, r3, #1
	ldr r3, [r2, #0x33c]
	mov r2, #0xa
	add r0, r3, r0, lsl #2
	str r4, [r0, #0x100]
	ldr r0, [r1]
	ldr r1, [r0, #0x334]
	add r0, r0, #0xb4
	ldr r1, [r1, #4]
	bl sub_020327CC
	ldr r0, _0238BD80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #1
	str r3, [r1, #0x1c]
	ldr r3, [r0]
	ldr r1, [r3, #0x178]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	str r2, [r1, #0x330]
	ldr r0, [r0]
	ldr r0, [r0, #0x338]
	bl ov20_0238B540
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV20_0238BB60_OFFSET 0x1F
#elif defined(JAPAN)
#define OV20_0238BB60_OFFSET -0x2944
#else
#define OV20_0238BB60_OFFSET 0
#endif
_0238BD80: .word OVERLAY20_UNKNOWN_POINTER__NA_238D128
_0238BD84: .word 0x00004622 + OV20_0238BB60_OFFSET
_0238BD88: .word 0x00004621 + OV20_0238BB60_OFFSET
_0238BD8C: .word 0x00004620 + OV20_0238BB60_OFFSET
	arm_func_end ov20_0238BB60

	arm_func_start ov20_0238BD90
ov20_0238BD90: ; 0x0238BD90
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x5c
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r4, [r1]
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0238C1C0
_0238BDB0: ; jump table
	b _0238BDE0 ; case 0
	b _0238BE74 ; case 1
	b _0238C1C0 ; case 2
	b _0238BFA8 ; case 3
	b _0238BFDC ; case 4
	b _0238C07C ; case 5
	b _0238C108 ; case 6
	b _0238C1C0 ; case 7
	b _0238C148 ; case 8
	b _0238C150 ; case 9
	b _0238C1B0 ; case 10
	b _0238C1B0 ; case 11
_0238BDE0:
	ldrsb r2, [r4, #4]
	mvn r0, #1
	cmp r2, r0
	bne _0238BE24
	ldr r0, [r4, #8]
	mov r2, #8
	str r0, [r4, #0x1c]
	ldr r4, [r1]
	ldr r0, _0238C1D4 ; =RECYCLE_WINDOW_PARAMS_5
	str r2, [sp]
	ldr r3, [r4, #0x33c]
	ldr r1, _0238C1D8 ; =0x00441C33
	add r2, r4, #0x1c
	bl CreateSimpleMenu
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r1, [r1]
	strb r0, [r1, #4]
_0238BE24:
	ldr r2, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r0, #0x18
	ldr r4, [r2]
	mov r1, #1
	ldr r3, [r4, #8]
	str r3, [r4, #0xc]
	ldr r5, [r2]
	ldr r4, [r5, #0x334]
	ldr r3, [r5, #8]
	ldr r4, [r4]
	mla r0, r3, r0, r4
	str r0, [r5, #0x338]
	ldr r0, [r2]
	ldr r0, [r0, #0x338]
	bl ov20_0238B824
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238BE74:
	ldrsb r0, [r4, #4]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0238BEDC
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuResult
	mvn r1, #0
	cmp r0, r1
	bne _0238BEC0
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r3, #2
	ldr r2, [r0]
	mov r1, #8
	str r3, [r2, #0x330]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238BEC0:
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r2, #3
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0]
	b _0238C1C0
_0238BEDC:
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202B530
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r5, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #4]
	bl sub_0202B544
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #4]
	bl sub_0202B568
	ldr r2, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mla r1, r4, r0, r5
	ldr r0, [r2]
	str r1, [r0, #8]
	ldr r3, [r2]
	ldr r1, [r3, #8]
	ldr r0, [r3, #0xc]
	cmp r0, r1
	beq _0238BF68
	str r1, [r3, #0xc]
	ldr ip, [r2]
	mov r0, #0x18
	ldr r1, [ip, #0x334]
	ldr r3, [ip, #8]
	ldr r4, [r1]
	mov r1, #1
	mla r0, r3, r0, r4
	str r0, [ip, #0x338]
	ldr r0, [r2]
	ldr r0, [r0, #0x338]
	bl ov20_0238B824
_0238BF68:
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuField0x1A4
	tst r0, #0x100
	beq _0238C1C0
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl ov20_0238C288
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238BFA8:
	ldr r0, _0238C1DC ; =RECYCLE_WINDOW_PARAMS_6
	mov ip, #3
	ldr r3, _0238C1E0 ; =RECYCLE_MAIN_MENU_ITEMS_2
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	strb r0, [r4, #5]
	ldr r0, [r1]
	mov r1, #4
	str r1, [r0]
	b _0238C1C0
_0238BFDC:
	ldrsb r0, [r4, #5]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0238C1C0
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl GetSimpleMenuResult
	ldr r2, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mvn r1, #0
	ldr r3, [r2]
	str r0, [r3, #0x330]
	ldr r0, [r2]
	ldr r2, [r0, #0x330]
	cmp r2, r1
	cmpne r2, #2
	bne _0238C048
	ldrsb r0, [r0, #4]
	bl ResumeSimpleMenu
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl ov20_0238C2B8
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238C048:
	cmp r2, #1
	movne r1, #9
	strne r1, [r0]
	bne _0238C1C0
	bl ov20_0238C2B8
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl ov20_0238C288
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238C07C:
	mov r0, r4
	bl ov20_0238C2B8
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl ov20_0238C288
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	add r0, sp, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #0x338]
	ldr r1, [r1]
	ldrsh r4, [r1]
	bl InitPreprocessorArgs
	mov r2, #0
#if defined(EUROPE)
	add r0, r4, #0xd3
	add r0, r0, #0x2900
#elif defined(JAPAN)
	add r0, r4, #0xce
	add r0, r0, #0x4100
#else
	add r0, r4, #0xd1
	add r0, r0, #0x2900
#endif
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	str r4, [sp, #0x1c]
	str r2, [sp, #0x30]
	str r2, [sp, #0x24]
	str r2, [sp, #0x38]
	add r3, sp, #0xc
	str r3, [sp]
	stmib sp, {r1, r3}
	ldr r0, _0238C1E4 ; =RECYCLE_WINDOW_PARAMS_4
	ldr r1, _0238C1E8 ; =0x00001013
	ldr r3, _0238C1EC ; =0x000008E4
	bl CreateScrollBoxSingle
	ldr r1, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #6]
	ldr r0, [r1]
	str r2, [r0]
	b _0238C1C0
_0238C108:
	ldrsb r0, [r4, #6]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238C1C0
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl CloseScrollBox
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #6]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238C148:
	mov r0, #8
	str r0, [r4]
_0238C150:
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r4, [r0]
	ldr r0, [r4, #0x330]
	cmp r0, #0
	bne _0238C178
	ldr r0, [r4, #0x338]
	bl sub_02011E68
	cmp r0, #0
	moveq r0, #3
	streq r0, [r4, #0x330]
_0238C178:
	mov r0, #0
	mov r1, r0
	bl ov20_0238B824
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl ov20_0238C2B8
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl ov20_0238C288
	ldr r0, _0238C1D0 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _0238C1C0
_0238C1B0:
	bl ov20_0238B800
	cmp r0, #0
	movne r0, #1
	bne _0238C1C8
_0238C1C0:
	bl ov20_0238B65C
	mov r0, #0
_0238C1C8:
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0238C1D0: .word OVERLAY20_UNKNOWN_POINTER__NA_238D128
_0238C1D4: .word RECYCLE_WINDOW_PARAMS_5
_0238C1D8: .word 0x00441C33
_0238C1DC: .word RECYCLE_WINDOW_PARAMS_6
_0238C1E0: .word RECYCLE_MAIN_MENU_ITEMS_2
_0238C1E4: .word RECYCLE_WINDOW_PARAMS_4
_0238C1E8: .word 0x00001013
#ifdef JAPAN
_0238C1EC: .word 0x00001D3C
#else
_0238C1EC: .word 0x000008E4
#endif
	arm_func_end ov20_0238BD90

	arm_func_start ov20_0238C1F0
ov20_0238C1F0: ; 0x0238C1F0
	ldr r0, _0238C200 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldr r0, [r0, #0x330]
	bx lr
	.align 2, 0
_0238C200: .word OVERLAY20_UNKNOWN_POINTER__NA_238D128
	arm_func_end ov20_0238C1F0

	arm_func_start ov20_0238C204
ov20_0238C204: ; 0x0238C204
	stmdb sp!, {r3, lr}
	ldr r1, _0238C22C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov lr, r0
	ldr r0, [r1]
	ldr ip, [r0, #0x338]
	ldmia ip!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia ip, {r0, r1}
	stmia lr, {r0, r1}
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C22C: .word OVERLAY20_UNKNOWN_POINTER__NA_238D128
	arm_func_end ov20_0238C204

	arm_func_start ov20_0238C230
ov20_0238C230: ; 0x0238C230
	stmdb sp!, {r3, lr}
	ldr r0, _0238C284 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov20_0238B5AC
	ldr r0, _0238C284 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	add r0, r0, #0x334
	bl sub_02011DB8
	ldr r0, _0238C284 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	ldr r0, [r0, #0x33c]
	bl MemFree
	ldr r0, _0238C284 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238C284 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D128
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C284: .word OVERLAY20_UNKNOWN_POINTER__NA_238D128
	arm_func_end ov20_0238C230

	arm_func_start ov20_0238C288
ov20_0238C288: ; 0x0238C288
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r0, [r4, #4]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl CloseSimpleMenu
	mvn r0, #1
	strb r0, [r4, #4]
	mov r0, #0
	strb r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238C288

	arm_func_start ov20_0238C2B8
ov20_0238C2B8: ; 0x0238C2B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r0, [r4, #5]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl CloseSimpleMenu
	mvn r0, #1
	strb r0, [r4, #5]
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238C2B8

	arm_func_start ov20_0238C2E0
ov20_0238C2E0: ; 0x0238C2E0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	bl IsTicketItem
	bl sub_02012294
	mov r4, r0
	mov r0, #0x1cc
	mov r1, #8
	bl MemAlloc
	ldr r2, _0238C4D8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #8
	str r0, [r2]
	str r6, [r0, #0x1bc]
	ldr r0, [r4, #4]
	bl MemAlloc
	ldr r2, _0238C4D8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #0
	ldr r3, [r2]
	mov r6, #3
	str r0, [r3, #0x1b0]
	mov r3, r1
	b _0238C360
_0238C338:
	ldr r0, [r4]
	add r0, r0, r1, lsl #3
	ldrb r0, [r0, #7]
	cmp r0, #0
	ldr r0, [r2]
	ldrne r0, [r0, #0x1b0]
	strneb r6, [r0, r1]
	ldreq r0, [r0, #0x1b0]
	streqb r3, [r0, r1]
	add r1, r1, #1
_0238C360:
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _0238C338
	cmp r5, #0
	mov r3, #0
	beq _0238C3A4
	ldr r2, _0238C4DC ; =ov20_0238D140
	b _0238C394
_0238C380:
	ldr r0, [r4]
	ldrb r1, [r2, r3]
	add r0, r0, r3, lsl #3
	add r3, r3, #1
	strb r1, [r0, #6]
_0238C394:
	ldr r0, [r4, #4]
	cmp r3, r0
	blt _0238C380
	b _0238C3C0
_0238C3A4:
	ldr r1, _0238C4DC ; =ov20_0238D140
	ldr r0, _0238C4E0 ; =0x0000041A
	mov r2, r3
_0238C3B0:
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, r0
	blt _0238C3B0
_0238C3C0:
	ldr r2, _0238C4D8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #0
	ldr r0, [r2]
	mvn r3, #1
	strb r3, [r0, #4]
	ldr r0, [r2]
	sub r6, r1, #1
	strb r3, [r0, #5]
	ldr r0, [r2]
	ldr lr, _0238C4E4 ; =0x0000032F
	strb r3, [r0, #6]
	ldr r0, [r2]
	mov ip, #0x10
	strb r3, [r0, #7]
	ldr r0, [r2]
	mov r5, #0xd
	strb r3, [r0, #8]
	ldr r3, [r2]
	mov r0, #0x14
	strb r1, [r3, #0x1c]
	ldr r3, [r2]
	str r6, [r3, #0x10]
	ldr r3, [r2]
	str r1, [r3, #0xc]
	ldr r3, [r2]
	str r1, [r3, #0x14]
	ldr r6, [r2]
	ldr r3, [r6, #0x14]
	str r3, [r6, #0x18]
	ldr r3, [r2]
	str r1, [r3]
	ldr r3, [r2]
	strh lr, [r3, #0x28]
	ldr r3, [r2]
	str ip, [r3, #0x2c]
	ldr r3, [r2]
	str r5, [r3, #0x24]
	ldr r2, [r2]
	str r1, [r2, #0x94]
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r1, _0238C4D8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r2, [r1]
	str r0, [r2, #0x20]
	mov r0, #0
	ldr r5, [r1]
	mov r1, r0
	ldr r3, [r5, #0x1b0]
	mov r2, r0
	str r3, [r5, #0x80]
	bl ov20_0238C4E8
	ldr r0, _0238C4D8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r1, [r4, #4]
	ldr r0, [r0]
	mov r2, #0xa
	add r0, r0, #0xb8
	bl sub_020327CC
	ldr r1, _0238C4D8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r2, #0
	ldr r0, [r1]
	sub r3, r2, #1
	str r2, [r0, #0x20]
	ldr r5, [r1]
	mov r0, #1
	ldr r2, [r5, #0x17c]
	str r2, [r5, #0x178]
	ldr r2, [r1]
	str r3, [r2, #0x1b4]
	ldr r1, [r1]
	str r4, [r1, #0x1b8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0238C4D8: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
_0238C4DC: .word ov20_0238D140
_0238C4E0: .word 0x0000041A
#ifdef JAPAN
_0238C4E4: .word 0x000031F4
#else
_0238C4E4: .word 0x0000032F
#endif
	arm_func_end ov20_0238C2E0

	arm_func_start ov20_0238C4E8
ov20_0238C4E8: ; 0x0238C4E8
	ldr r3, _0238C508 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr ip, [r3]
	str r0, [ip, #0x1c0]
	ldr r0, [r3]
	str r1, [r0, #0x1c4]
	ldr r0, [r3]
	str r2, [r0, #0x1c8]
	bx lr
	.align 2, 0
_0238C508: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238C4E8

	arm_func_start ov20_0238C50C
ov20_0238C50C: ; 0x0238C50C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x5c
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r4, [r0]
	ldr r1, [r4]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _0238C9BC
_0238C52C: ; jump table
	b _0238C560 ; case 0
	b _0238C650 ; case 1
	b _0238C9BC ; case 2
	b _0238C798 ; case 3
	b _0238C7B0 ; case 4
	b _0238C7E4 ; case 5
	b _0238C860 ; case 6
	b _0238C928 ; case 7
	b _0238C9BC ; case 8
	b _0238C968 ; case 9
	b _0238C970 ; case 10
	b _0238C9B4 ; case 11
	b _0238C9B4 ; case 12
_0238C560:
	ldrsb r1, [r4, #4]
	mvn r0, #1
	cmp r1, r0
	bne _0238C5CC
	ldr r1, [r4, #0xc]
	ldr r0, _0238C9CC ; =ov20_0238CD20
	str r1, [r4, #0x20]
	str r0, [sp]
	ldr r0, [r4, #0x188]
	mov r2, #8
	str r0, [sp, #4]
	ldr r0, _0238C9D0 ; =RECYCLE_WINDOW_PARAMS_11
	ldr r1, _0238C9D4 ; =0x00441E37
	ldr r3, _0238C9D8 ; =ov20_0238CC14
	str r2, [sp, #8]
	add r2, r4, #0x20
	bl CreateCollectionMenu
	strb r0, [r4, #4]
	ldrsb r0, [r4, #4]
	mov r1, #1
	bl SetCollectionMenuField0x1C8
	ldrsb r0, [r4, #4]
	ldr r1, _0238C9DC ; =ov20_0238CE3C
	bl SetCollectionMenuField0x1A4
	ldrsb r0, [r4, #4]
	ldr r1, _0238C9E0 ; =ov20_0238CCC0
	bl SetCollectionMenuField0x1A0
_0238C5CC:
	ldrsb r1, [r4, #7]
	mvn r0, #1
	cmp r1, r0
	bne _0238C5F0
	ldr r0, _0238C9E4 ; =RECYCLE_WINDOW_PARAMS_8
	ldr r1, _0238C9E8 ; =ov20_0238CE9C
	mov r2, r4
	bl CreateTextBoxWithArg
	strb r0, [r4, #7]
_0238C5F0:
	ldrsb r1, [r4, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0238C614
	ldr r0, _0238C9EC ; =RECYCLE_WINDOW_PARAMS_7
	ldr r1, _0238C9F0 ; =ov20_0238CF20
	mov r2, r4
	bl CreateTextBoxWithArg
	strb r0, [r4, #8]
_0238C614:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r0]
	ldr r1, [r0, #0x1c0]
	cmp r1, #0
	beq _0238C63C
	mov r0, #0
	blx r1
_0238C63C:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C650:
	ldrsb r0, [r4, #4]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _0238C724
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202C75C
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	bne _0238C6B4
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	bl ov20_0238CB28
	cmp r0, #0
	ldreq r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0x1b4]
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C6B4:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r5, [r0]
	mov r0, r5
	bl ov20_0238CAE0
	ldr r1, [r5, #0x1bc]
	cmp r1, r0
	bne _0238C6E8
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	str r4, [r5, #0xc]
	ldr r0, [r0]
	mov r1, #3
	str r1, [r0]
	b _0238C9BC
_0238C6E8:
	ldr r0, [r5, #0x1b8]
	ldr r0, [r0]
	add r0, r0, r4, lsl #3
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _0238C718
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	str r4, [r5, #0xc]
	ldr r0, [r0]
	mov r1, #4
	str r1, [r0]
	b _0238C9BC
_0238C718:
	ldrsb r0, [r5, #4]
	bl sub_0202C620
	b _0238C9BC
_0238C724:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202C748
	ldr r1, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r2, [r1]
	str r0, [r2, #0xc]
	ldr r3, [r1]
	ldr r2, [r3, #0xc]
	ldr r0, [r3, #0x10]
	cmp r0, r2
	strne r2, [r3, #0x10]
	ldrne r0, [r1]
	ldrne r1, [r0, #0x1c4]
	cmpne r1, #0
	beq _0238C76C
	mov r0, #0
	blx r1
_0238C76C:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrb r1, [r0, #0x1c]
	cmp r1, #0
	beq _0238C9BC
	bl ov20_0238CB84
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C798:
	mov r1, #0
	str r1, [r4, #0x1b4]
	ldr r0, [r0]
	mov r1, #0xa
	str r1, [r0]
	b _0238C9BC
_0238C7B0:
	ldr r0, _0238C9F4 ; =RECYCLE_WINDOW_PARAMS_10
	mov r5, #3
	ldr r3, _0238C9F8 ; =RECYCLE_MAIN_MENU_ITEMS_3
	mov r1, #0x13
	mov r2, #0
	str r5, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	strb r0, [r4, #5]
	ldr r0, [r1]
	mov r1, #5
	str r1, [r0]
	b _0238C9BC
_0238C7E4:
	ldrsb r0, [r4, #5]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0238C9BC
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl GetSimpleMenuResult
	ldr r1, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r2, [r1]
	str r0, [r2, #0x1b4]
	ldr r0, [r1]
	bl ov20_0238CBEC
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldr r1, [r0, #0x1b4]
	cmp r1, #1
	bne _0238C844
	bl ov20_0238CB84
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C844:
	ldrsb r0, [r0, #4]
	bl sub_0202C620
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C860:
	ldr r1, [r4, #0x1b8]
	ldr r0, [r4, #0xc]
	ldr r1, [r1]
	add r0, r1, r0, lsl #3
	bl sub_020124D8
	ldr r1, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r4, r0
	ldr r0, [r1]
	ldr r1, [r0, #0x1b8]
	ldr r0, [r0, #0xc]
	ldr r1, [r1]
	add r0, r1, r0, lsl #3
	bl sub_02012518
	ldr r1, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r5, r0
	ldr r0, [r1]
	bl ov20_0238CBEC
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	bl ov20_0238CB84
	add r0, sp, #0xc
	bl InitPreprocessorArgs
#ifdef JAPAN
	mov r1, #0
	sub r0, r1, #1
	cmp r5, r0
	add r0, r4, #0xce
	str r1, [sp, #0x30]
	addne r1, r5, #0xbc
	add r0, r0, #0x4100
#else
	ldr r0, _0238C9FC ; =0x0000FFFF
	mov r1, #0
	cmp r5, r0
#ifdef EUROPE
	add r0, r4, #0xd3
#else
	add r0, r4, #0xd1
#endif
	str r1, [sp, #0x30]
	addne r1, r5, #0xbc
	add r0, r0, #0x2900
#endif
	mov r2, #0
	str r4, [sp, #0x1c]
	mov r0, r0, lsl #0x10
	str r1, [sp, #0x24]
	add r4, sp, #0xc
	str r2, [sp, #0x38]
	str r4, [sp]
	mov r0, r0, lsr #0x10
	str r0, [sp, #4]
	ldr r0, _0238CA00 ; =RECYCLE_WINDOW_PARAMS_9
	ldr r1, _0238CA04 ; =0x00001013
	ldr r3, _0238CA08 ; =0x000008E4
	str r4, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r2, #7
	ldr r3, [r1]
	strb r0, [r3, #6]
	ldr r0, [r1]
	str r2, [r0]
	b _0238C9BC
_0238C928:
	ldrsb r0, [r4, #6]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238C9BC
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl CloseScrollBox
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #6]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C968:
	mov r0, #9
	str r0, [r4]
_0238C970:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldr r0, [r0, #0x1c8]
	cmp r0, #0
	beq _0238C988
	blx r0
_0238C988:
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	bl ov20_0238CBEC
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	bl ov20_0238CB84
	ldr r0, _0238C9C8 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0]
	b _0238C9BC
_0238C9B4:
	mov r0, #1
	b _0238C9C0
_0238C9BC:
	mov r0, #0
_0238C9C0:
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0238C9C8: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
_0238C9CC: .word ov20_0238CD20
_0238C9D0: .word RECYCLE_WINDOW_PARAMS_11
_0238C9D4: .word 0x00441E37
_0238C9D8: .word ov20_0238CC14
_0238C9DC: .word ov20_0238CE3C
_0238C9E0: .word ov20_0238CCC0
_0238C9E4: .word RECYCLE_WINDOW_PARAMS_8
_0238C9E8: .word ov20_0238CE9C
_0238C9EC: .word RECYCLE_WINDOW_PARAMS_7
_0238C9F0: .word ov20_0238CF20
_0238C9F4: .word RECYCLE_WINDOW_PARAMS_10
_0238C9F8: .word RECYCLE_MAIN_MENU_ITEMS_3
#ifndef JAPAN
_0238C9FC: .word 0x0000FFFF
#endif
_0238CA00: .word RECYCLE_WINDOW_PARAMS_9
_0238CA04: .word 0x00001013
#ifdef JAPAN
_0238CA08: .word 0x00001D3C
#else
_0238CA08: .word 0x000008E4
#endif
	arm_func_end ov20_0238C50C

	arm_func_start ov20_0238CA0C
ov20_0238CA0C: ; 0x0238CA0C
	ldr r0, _0238CA1C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldr r0, [r0, #0x1b4]
	bx lr
	.align 2, 0
_0238CA1C: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238CA0C

	arm_func_start ov20_0238CA20
ov20_0238CA20: ; 0x0238CA20
	ldr r0, _0238CA34 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr ip, _0238CA38 ; =sub_0201255C
	ldr r0, [r0]
	ldr r0, [r0, #0x1b8]
	bx ip
	.align 2, 0
_0238CA34: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
_0238CA38: .word sub_0201255C
	arm_func_end ov20_0238CA20

	arm_func_start ov20_0238CA3C
ov20_0238CA3C: ; 0x0238CA3C
	stmdb sp!, {r3, lr}
	ldr r0, _0238CAD4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr ip, [r0]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x1b8]
	mov r3, #0
	ldr r1, _0238CAD8 ; =ov20_0238D140
	b _0238CA74
_0238CA60:
	ldr r0, [r2]
	add r0, r0, r3, lsl #3
	ldrb r0, [r0, #6]
	strb r0, [r1, r3]
	add r3, r3, #1
_0238CA74:
	ldr r0, [r2, #4]
	cmp r3, r0
	blt _0238CA60
	mov r2, #0
	ldr r1, _0238CAD8 ; =ov20_0238D140
	ldr r0, _0238CADC ; =0x0000041A
	b _0238CA98
_0238CA90:
	strb r2, [r1, r3]
	add r3, r3, #1
_0238CA98:
	cmp r3, r0
	blt _0238CA90
	add r0, ip, #0x1b8
	bl sub_020125CC
	ldr r0, _0238CAD4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldr r0, [r0, #0x1b0]
	bl MemFree
	ldr r0, _0238CAD4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238CAD4 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CAD4: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
_0238CAD8: .word ov20_0238D140
_0238CADC: .word 0x0000041A
	arm_func_end ov20_0238CA3C

	arm_func_start ov20_0238CAE0
ov20_0238CAE0: ; 0x0238CAE0
	ldr r1, _0238CB24 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r2, [r0, #0x1b8]
	ldr r1, [r1]
	mov r0, #0
	mov ip, r0
	ldr r3, [r1, #0x1b8]
	ldr r2, [r2, #4]
	b _0238CB18
_0238CB00:
	ldr r1, [r3]
	add r1, r1, ip, lsl #3
	ldrb r1, [r1, #6]
	add ip, ip, #1
	cmp r1, #0
	addne r0, r0, #1
_0238CB18:
	cmp ip, r2
	blt _0238CB00
	bx lr
	.align 2, 0
_0238CB24: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238CAE0

	arm_func_start ov20_0238CB28
ov20_0238CB28: ; 0x0238CB28
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0238CB80 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r5, #0
	ldr r1, [r1]
	mov r4, r5
	ldr lr, [r1, #0x1b8]
	mov r3, r5
	mov r2, #1
	b _0238CB68
_0238CB4C:
	ldr r1, [lr]
	add ip, r1, r4, lsl #3
	ldrb r1, [ip, #6]
	add r4, r4, #1
	cmp r1, #0
	movne r5, r2
	strneb r3, [ip, #6]
_0238CB68:
	ldr r1, [r0, #0x1b8]
	ldr r1, [r1, #4]
	cmp r4, r1
	blt _0238CB4C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238CB80: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238CB28

	arm_func_start ov20_0238CB84
ov20_0238CB84: ; 0x0238CB84
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r0, [r4, #4]
	mvn r1, #1
	cmp r0, r1
	beq _0238CBB0
	bl CloseCollectionMenu
	mvn r0, #1
	strb r0, [r4, #4]
	mov r0, #0
	strb r0, [r4, #0x1c]
_0238CBB0:
	ldrsb r0, [r4, #7]
	mvn r1, #1
	cmp r0, r1
	beq _0238CBCC
	bl CloseTextBox
	mvn r0, #1
	strb r0, [r4, #7]
_0238CBCC:
	ldrsb r0, [r4, #8]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl CloseTextBox
	mvn r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238CB84

	arm_func_start ov20_0238CBEC
ov20_0238CBEC: ; 0x0238CBEC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r0, [r4, #5]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl CloseSimpleMenu
	mvn r0, #1
	strb r0, [r4, #5]
	ldmia sp!, {r4, pc}
	arm_func_end ov20_0238CBEC

	arm_func_start ov20_0238CC14
ov20_0238CC14: ; 0x0238CC14
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _0238CCBC ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r5, r0
	ldr r0, [r3]
	mov r4, r2
	ldr r0, [r0, #0x1b8]
	ldr r2, [r0]
	ldr r0, [r2, r1, lsl #3]
	add r6, r2, r1, lsl #3
	cmp r0, #0
	bne _0238CC60
	ldrsh r0, [r6, #4]
	bl GetItemAtIdx
	mov r1, r0
	mov r0, r5
	mov r2, #0
	bl sub_0200D670
	b _0238CC9C
_0238CC60:
	cmp r0, #1
	bne _0238CC94
	ldrsh r0, [r6, #4]
	bl sub_02010044
	mov r1, r0
	add r0, sp, #0
	mov r2, #0
	bl InitStandardItem
	add r1, sp, #0
	mov r0, r5
	mov r2, #0
	bl sub_0200D670
	b _0238CC9C
_0238CC94:
	mov r0, #0
	b _0238CCB4
_0238CC9C:
	ldrb r0, [r6, #6]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r4]
	mov r0, r5
_0238CCB4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0238CCBC: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238CC14

	arm_func_start ov20_0238CCC0
ov20_0238CCC0: ; 0x0238CCC0
	stmdb sp!, {r4, lr}
	ldr r1, _0238CD1C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r4, r0
	ldr r0, [r1]
	bl ov20_0238CAE0
	cmp r0, #0
	movle r0, #0
	ldmleia sp!,  {r4, pc}
	ldr r0, _0238CD1C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	bl ov20_0238CB28
	ldr r0, _0238CD1C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202F9B8
	ldr r0, _0238CD1C ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl sub_0202F9B8
	mov r0, r4
	bl sub_0202C7E4
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238CD1C: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238CCC0

	arm_func_start ov20_0238CD20
ov20_0238CD20: ; 0x0238CD20
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0238CE38 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r4, #0
	ldr r2, [r1]
	tst r0, #0x400
	strb r4, [r2, #0x1c]
	beq _0238CDDC
	ldr r0, [r1]
	ldrsb r0, [r0, #4]
	bl sub_0202D0EC
	ldr r1, _0238CE38 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r2, [r1]
	ldr r1, [r2, #0x1b8]
	ldr r1, [r1]
	add r5, r1, r0, lsl #3
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _0238CDFC
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0238CD94
	mov r0, r2
	bl ov20_0238CAE0
	ldr r1, _0238CE38 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r1, [r1]
	ldr r1, [r1, #0x1bc]
	cmp r0, r1
	movlt r4, #1
	b _0238CD98
_0238CD94:
	mov r4, #1
_0238CD98:
	cmp r4, #0
	beq _0238CDD0
	ldrb r0, [r5, #6]
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	ldr r0, _0238CE38 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	strb r1, [r5, #6]
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202F9B8
	mov r0, #6
	bl PlaySeVolumeWrapper
	b _0238CDFC
_0238CDD0:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _0238CDFC
_0238CDDC:
	tst r0, #0x100
	beq _0238CDFC
	mov r0, r4
	bl PlaySeVolumeWrapper
	ldr r0, _0238CE38 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
_0238CDFC:
	ldr r0, _0238CE38 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	ldr r5, [r0]
	mov r0, r5
	bl ov20_0238CAE0
	ldr r1, [r5, #0x1bc]
	cmp r1, r0
	ldrsb r0, [r5, #4]
	bne _0238CE28
	mov r1, #1
	bl sub_0202D16C
	b _0238CE30
_0238CE28:
	mov r1, #0
	bl sub_0202D16C
_0238CE30:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238CE38: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	arm_func_end ov20_0238CD20

	arm_func_start ov20_0238CE3C
ov20_0238CE3C: ; 0x0238CE3C
	stmdb sp!, {r3, lr}
	ldr lr, _0238CE90 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	mov ip, r0
	ldr r0, [lr]
	ldr r0, [r0, #0x1b8]
	ldr r0, [r0]
	ldr r0, [r0, r2, lsl #3]
	cmp r0, #0
	ldreq r0, _0238CE94 ; =0x0000032F
	ldrne r0, _0238CE98 ; =0x00004623
	cmp r3, #0
	strh r0, [r1, #0x1c]
	ble _0238CE80
	ldr r0, [r1, #0xbc]
	cmp r0, r3
	subge r0, r3, #1
	strge r0, [r1, #0xbc]
_0238CE80:
	mov r0, r1
	mov r1, ip
	bl sub_0202A03C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CE90: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
#if defined(EUROPE)
_0238CE94: .word 0x0000032F
_0238CE98: .word 0x00004642
#elif defined(JAPAN)
_0238CE94: .word 0x000031F4
_0238CE98: .word 0x00001CDF
#else
_0238CE94: .word 0x0000032F
_0238CE98: .word 0x00004623
#endif
	arm_func_end ov20_0238CE3C

	arm_func_start ov20_0238CE9C
ov20_0238CE9C: ; 0x0238CE9C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	mov r0, r1
	bl ov20_0238CAE0
	mov r4, r0
	mov r0, r5
	bl sub_02027B1C
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, _0238CF18 ; =OVERLAY20_UNKNOWN_POINTER__NA_238D12C
	str r4, [sp, #0x2c]
	ldr r1, [r0]
	add r2, sp, #4
	ldr r3, [r1, #0x1bc]
	add r0, sp, #0x54
	str r3, [sp, #0x30]
	str r2, [sp]
	ldr r2, _0238CF1C ; =0x00004627
	mov r1, #0x100
	mov r3, #0x400
	bl PreprocessStringFromId
	mov r1, #2
	mov r0, r5
	mov r2, r1
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, r5
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0238CF18: .word OVERLAY20_UNKNOWN_POINTER__NA_238D12C
#if defined(EUROPE)
_0238CF1C: .word 0x00004646
#elif defined(JAPAN)
_0238CF1C: .word 0x00001CE3
#else
_0238CF1C: .word 0x00004627
#endif
	arm_func_end ov20_0238CE9C

	arm_func_start ov20_0238CF20
ov20_0238CF20: ; 0x0238CF20
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x154
	mov r4, r0
	bl sub_02027B1C
	add r0, sp, #4
	bl InitPreprocessorArgs
	add ip, sp, #4
	ldr r2, _0238CF78 ; =0x00004628
	add r0, sp, #0x54
	mov r1, #0x100
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	mov r1, #2
	mov r0, r4
	mov r2, r1
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0238CF78: .word 0x00004647
#elif defined(JAPAN)
_0238CF78: .word 0x00001CE4
#else
_0238CF78: .word 0x00004628
#endif
	arm_func_end ov20_0238CF20
	; 0x0238CF7C

	.rodata
	.global OVERLAY20_UNKNOWN_POINTER__NA_238CF7C
OVERLAY20_UNKNOWN_POINTER__NA_238CF7C:
#if defined(EUROPE)
#define OV20_DATA_OFFSET 0x1F
#elif defined(JAPAN)
#define OV20_DATA_OFFSET -0x2944
#else
#define OV20_DATA_OFFSET 0
#endif
	.word OVERLAY20_UNKNOWN_TABLE__NA_238D014
	.byte 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_MENU_ITEMS_CONFIRM_1
RECYCLE_MENU_ITEMS_CONFIRM_1:
	.word 0x4615 + OV20_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x4616 + OV20_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global RECYCLE_MENU_ITEMS_CONFIRM_2
RECYCLE_MENU_ITEMS_CONFIRM_2:
	.word 0x4615 + OV20_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x4616 + OV20_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global RECYCLE_SUBMENU_ITEMS_1
RECYCLE_SUBMENU_ITEMS_1:
	.word 0x4607 + OV20_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x4608 + OV20_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global RECYCLE_SUBMENU_ITEMS_2
RECYCLE_SUBMENU_ITEMS_2:
	.word 0x45F7 + OV20_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x45F9 + OV20_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x45FA + OV20_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global RECYCLE_MAIN_MENU_ITEMS_1
RECYCLE_MAIN_MENU_ITEMS_1:
	.word 0x45EF + OV20_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x45F0 + OV20_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x45F1 + OV20_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x45F2 + OV20_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global OVERLAY20_UNKNOWN_TABLE__NA_238D014
OVERLAY20_UNKNOWN_TABLE__NA_238D014:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x73, 0x31, 0x34
	.byte 0x70, 0x30, 0x32, 0x61, 0x2E, 0x62, 0x67, 0x70, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_1
RECYCLE_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x01, 0x0C, 0x02, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_2
RECYCLE_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x05, 0x1C, 0x09, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_3
RECYCLE_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x10, 0x1C, 0x07, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_4
RECYCLE_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_5
RECYCLE_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x12, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_6
RECYCLE_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x02, 0x08, 0x05, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_MAIN_MENU_ITEMS_2
RECYCLE_MAIN_MENU_ITEMS_2:
	.word 0x4624 + OV20_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x4625 + OV20_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x4626 + OV20_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_7
RECYCLE_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x14, 0x12, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_8
RECYCLE_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x11, 0x08, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_9
RECYCLE_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_10
RECYCLE_WINDOW_PARAMS_10:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x02, 0x08, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_WINDOW_PARAMS_11
RECYCLE_WINDOW_PARAMS_11:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x12, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global RECYCLE_MAIN_MENU_ITEMS_3
RECYCLE_MAIN_MENU_ITEMS_3:
	.word 0x4625 + OV20_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00,
	.word 0x4626 + OV20_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

	.data
	.global OVERLAY20_UNKNOWN_POINTER__NA_238D120
OVERLAY20_UNKNOWN_POINTER__NA_238D120:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY20_UNKNOWN_POINTER__NA_238D124
OVERLAY20_UNKNOWN_POINTER__NA_238D124:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY20_UNKNOWN_POINTER__NA_238D128
OVERLAY20_UNKNOWN_POINTER__NA_238D128:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY20_UNKNOWN_POINTER__NA_238D12C
OVERLAY20_UNKNOWN_POINTER__NA_238D12C:
	.byte 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov20_0238D140
ov20_0238D140:
	.space 0x420
