	.include "asm/macros.inc"
	.include "overlay_17_0238A754.inc"

	.text

	arm_func_start ov17_0238A754
ov17_0238A754: ; 0x0238A754
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x124
	bl sub_0203C9E4
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r4, [r0]
	ldr r1, [r4, #0x6c]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238AF90
_0238A778: ; jump table
	b _0238A788 ; case 0
	b _0238AF18 ; case 1
	b _0238AF4C ; case 2
	b _0238AF90 ; case 3
_0238A788:
	ldr r7, _0238AFA0 ; =OVERLAY17_FUNCTION_POINTER_TABLE
	add r6, sp, #4
	mov r5, #0xa
_0238A794:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0238A794
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	ldr r0, [r4, #0x74]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238AF10
_0238A7BC: ; jump table
	b _0238A7CC ; case 0
	b _0238A840 ; case 1
	b _0238AEC8 ; case 2
	b _0238A7CC ; case 3
_0238A7CC:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	str r1, [r4, #0x74]
	ldr r1, [r0]
	add r0, sp, #4
	ldr r1, [r1, #0x70]
	ldr r0, [r0, r1, lsl #2]
	blx r0
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r3, [r0]
	ldr r1, [r3, #0x70]
	ldr r2, [r3, #0x78]
	cmp r1, r2
	beq _0238AF10
	ldr r1, [r3, #0x74]
	cmp r1, #3
	bne _0238A828
	str r2, [r3, #0x70]
	ldr r1, [r0]
	add r0, sp, #4
	ldr r1, [r1, #0x70]
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0238A828:
	bl ov17_0238A278
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x74]
	b _0238AF10
_0238A840:
	bl ov17_0238A364
	cmp r0, #0
	beq _0238AF10
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r2, [r0]
	ldrh r0, [r2, #0x7e]
	tst r0, #1
	beq _0238AA30
	ldrsb r1, [r2]
	mvn r0, #1
	ldrh r5, [r2, #0x7c]
	cmp r1, r0
	ldr r4, _0238AFA4 ; =0x00003008
	bne _0238A898
	ldr r0, _0238AFA8 ; =ASSEMBLY_WINDOW_PARAMS_4
	bl CreateDialogueBox
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	strh r2, [r0, #0x7c]
_0238A898:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDialogueBox
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldr r0, [r1, #0x70]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _0238A9F8
_0238A8C0: ; jump table
	b _0238A968 ; case 0
	b _0238A9F8 ; case 1
	b _0238A9F8 ; case 2
	b _0238A9F8 ; case 3
	b _0238A9AC ; case 4
	b _0238A9AC ; case 5
	b _0238A97C ; case 6
	b _0238A97C ; case 7
	b _0238A988 ; case 8
	b _0238A994 ; case 9
	b _0238A994 ; case 10
	b _0238A9A0 ; case 11
	b _0238A9F8 ; case 12
	b _0238A9F8 ; case 13
	b _0238A9F8 ; case 14
	b _0238A9F8 ; case 15
	b _0238A9B8 ; case 16
	b _0238A9B8 ; case 17
	b _0238A9B8 ; case 18
	b _0238A9C4 ; case 19
	b _0238A9C4 ; case 20
	b _0238A9D0 ; case 21
	b _0238A9D0 ; case 22
	b _0238A9D0 ; case 23
	b _0238A9DC ; case 24
	b _0238A9DC ; case 25
	b _0238A9DC ; case 26
	b _0238A9E4 ; case 27
	b _0238A9E4 ; case 28
	b _0238A9E4 ; case 29
	b _0238A9F8 ; case 30
	b _0238A9F8 ; case 31
	b _0238A9F8 ; case 32
	b _0238A9F8 ; case 33
	b _0238A9F8 ; case 34
	b _0238A9F8 ; case 35
	b _0238A9F8 ; case 36
	b _0238A9F8 ; case 37
	b _0238A9F8 ; case 38
	b _0238A9F8 ; case 39
	b _0238A9F0 ; case 40
	b _0238A9F0 ; case 41
_0238A968:
	ldrb r0, [r1, #9]
	cmp r0, #0
#ifdef JAPAN
	movne r5, #0x3d00
#else
	ldrne r5, _0238AFAC ; =0x0000041E
#endif
	ldreq r5, _0238AFB0 ; =0x0000041F
	b _0238A9F8
_0238A97C:
	ldr r5, _0238AFB4 ; =0x00000425
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A988:
	ldr r5, _0238AFBC ; =0x00000426
#ifdef JAPAN
	sub r4, r5, #0xcf0
#else
	ldr r4, _0238AFB8 ; =0x00003018
#endif
	b _0238A9F8
_0238A994:
	ldr r5, _0238AFC0 ; =0x00000427
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9A0:
	ldr r5, _0238AFC4 ; =0x00000428
#ifdef JAPAN
	ldr r4, _0238AFB8 ; =0x00003018
#else
	rsb r4, r5, #0x3440
#endif
	b _0238A9F8
_0238A9AC:
	ldr r5, _0238AFC8 ; =0x00000429
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9B8:
#ifdef JAPAN
	ldr r5, _0238C528 ; =0x00003D02
#else
	mov r5, #0x420
#endif
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9C4:
	ldr r5, _0238AFCC ; =0x00000422
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9D0:
	ldr r5, _0238AFD0 ; =0x00000421
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9DC:
	ldr r5, _0238AFD4 ; =0x00000423
	b _0238A9F8
_0238A9E4:
	ldr r5, _0238AFD8 ; =0x00000424
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9F0:
	ldr r5, _0238AFDC ; =0x0000042A
	ldr r4, _0238AFB8 ; =0x00003018
_0238A9F8:
	ldrh r0, [r1, #0x7c]
	cmp r0, r5
	beq _0238AA30
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	strh r5, [r1, #0x7c]
	ldr r2, [r0]
	ldr r3, _0238AFE0 ; =0x00000186
	mov r1, r4
	str r3, [r2, #0x58]
	ldr r3, [r0]
	ldrsb r0, [r3]
	ldrh r2, [r3, #0x7c]
	add r3, r3, #0xc
	bl ShowStringIdInDialogueBox
_0238AA30:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #2
	beq _0238AABC
	ldrsb r1, [r1, #1]
	mvn r0, #1
	cmp r1, r0
	bne _0238AABC
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, _0238AFE0 ; =0x00000186
	ldr r3, [r2]
	strb r0, [r3, #1]
	ldr r0, [r2]
	add r0, r0, #0x5c
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x5c
	bl SetPortraitLayout
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x5c
	bl SetPortraitEmotion
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrsb r0, [r1, #1]
	add r1, r1, #0x5c
	bl ShowPortraitInPortraitBox
_0238AABC:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #4
	beq _0238AB04
	ldrsb r1, [r1, #2]
	mvn r0, #1
	cmp r1, r0
	bne _0238AB04
	ldr r0, _0238AFE4 ; =ASSEMBLY_WINDOW_PARAMS_1
	mov r2, #0
	ldr r1, _0238AFE8 ; =0x00300013
	ldr r3, _0238AFEC ; =ASSEMBLY_MAIN_MENU_ITEMS_2
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #2]
_0238AB04:
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r3, [r1]
	ldrh r0, [r3, #0x7e]
	tst r0, #0x10
	beq _0238AB5C
	ldrsb r2, [r3, #3]
	mvn r0, #1
	cmp r2, r0
	bne _0238AB5C
	mov r0, #1
	str r0, [r3, #0x1b4]
	mov r0, #0
	str r0, [sp]
	ldr r2, [r1]
	ldr r0, _0238AFF0 ; =ASSEMBLY_WINDOW_PARAMS_3
	ldr r1, _0238AFF4 ; =0x00300033
	ldr r3, _0238AFF8 ; =ASSEMBLY_MENU_ITEMS_CONFIRM
	add r2, r2, #0x1b4
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #3]
_0238AB5C:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrh r0, [r0, #0x7e]
	tst r0, #0x20
	beq _0238AB94
	bl sub_0203A998
	cmp r0, #0
	bne _0238AB94
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r0, #1
	ldr r1, [r1]
	add r1, r1, #0x5a
	add r1, r1, #0x200
	bl sub_02039C3C
_0238AB94:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r2, [r0]
	ldrh r0, [r2, #0x7e]
	tst r0, #8
	beq _0238AD90
	ldrsb r1, [r2, #4]
	mvn r0, #1
	cmp r1, r0
	bne _0238AD90
	add r0, r2, #0x200
	ldrsh r6, [r0, #0x58]
	mov r0, r6
	bl GetTeamMember
	mov r4, r0
	mov r0, r6
	bl sub_020564B0
	cmp r0, #0
	ldrne r7, _0238AFFC ; =ASSEMBLY_SUBMENU_ITEMS_1
	bne _0238ACEC
	mov r0, r6
	bl IsMainCharacter
	mov r8, r0
	mov r0, r6
	bl sub_02056410
	mov r7, r0
	mov r5, #0
	bl GetGameMode
	cmp r0, #4
	beq _0238AC14
	bl GetGameMode
	cmp r0, #5
	bne _0238AC1C
_0238AC14:
	mov r5, #1
	b _0238AC28
_0238AC1C:
	ldrsh r0, [r4, #4]
	cmp r0, #0x214
	moveq r5, #1
_0238AC28:
	mov r0, #0x14
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _0238AC84
	bl GetGameMode
	cmp r0, #3
	beq _0238AC84
	cmp r8, #0
	beq _0238AC5C
	cmp r7, #0
	ldrne r7, _0238B000 ; =ASSEMBLY_SUBMENU_ITEMS_6
	ldreq r7, _0238B004 ; =ASSEMBLY_SUBMENU_ITEMS_3
	b _0238ACEC
_0238AC5C:
	cmp r5, #0
	beq _0238AC74
	cmp r7, #0
	ldrne r7, _0238B000 ; =ASSEMBLY_SUBMENU_ITEMS_6
	ldreq r7, _0238B004 ; =ASSEMBLY_SUBMENU_ITEMS_3
	b _0238ACEC
_0238AC74:
	cmp r7, #0
	ldrne r7, _0238B008 ; =ASSEMBLY_SUBMENU_ITEMS_7
	ldreq r7, _0238B00C ; =ASSEMBLY_SUBMENU_ITEMS_5
	b _0238ACEC
_0238AC84:
	cmp r8, #0
	beq _0238ACC8
	bl GetGameMode
	cmp r0, #4
	beq _0238ACA4
	bl GetGameMode
	cmp r0, #5
	bne _0238ACC0
_0238ACA4:
	bl GetPartnerMemberIdx
	cmp r6, r0
	bne _0238ACC0
	cmp r7, #0
	ldrne r7, _0238B010 ; =ASSEMBLY_SUBMENU_ITEMS_2
	ldreq r7, _0238B004 ; =ASSEMBLY_SUBMENU_ITEMS_3
	b _0238ACEC
_0238ACC0:
	ldr r7, _0238AFFC ; =ASSEMBLY_SUBMENU_ITEMS_1
	b _0238ACEC
_0238ACC8:
	cmp r5, #0
	beq _0238ACE0
	cmp r7, #0
	ldrne r7, _0238B010 ; =ASSEMBLY_SUBMENU_ITEMS_2
	ldreq r7, _0238B004 ; =ASSEMBLY_SUBMENU_ITEMS_3
	b _0238ACEC
_0238ACE0:
	cmp r7, #0
	ldrne r7, _0238B014 ; =ASSEMBLY_SUBMENU_ITEMS_4
	ldreq r7, _0238B00C ; =ASSEMBLY_SUBMENU_ITEMS_5
_0238ACEC:
	mov r8, #0
	mov r4, r8
	mov r5, #3
	ldr sb, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	b _0238AD4C
_0238AD00:
	mov r1, r8, lsl #3
	ldrh r0, [r7, r1]
	cmp r0, #0
	beq _0238AD54
	add r0, r7, r1
	ldr r0, [r0, #4]
	cmp r0, #6
	bne _0238AD3C
	mov r0, r6
	bl sub_02056F60
	cmp r0, #0
	ldreq r0, [sb]
	addeq r0, r0, r8
	streqb r5, [r0, #0x24c]
	beq _0238AD48
_0238AD3C:
	ldr r0, [sb]
	add r0, r0, r8
	strb r4, [r0, #0x24c]
_0238AD48:
	add r8, r8, #1
_0238AD4C:
	cmp r8, #0xc
	blt _0238AD00
_0238AD54:
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r2, #0
	ldr r4, [r1]
	ldr r0, _0238B018 ; =ASSEMBLY_WINDOW_PARAMS_2
	add r3, r4, #0x24c
	str r3, [r4, #0x17c]
	str r2, [sp]
	ldr r2, [r1]
	ldr r1, _0238B01C ; =0x00000213
	mov r3, r7
	add r2, r2, #0x11c
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #4]
_0238AD90:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r2, [r0]
	ldrh r0, [r2, #0x7e]
	tst r0, #0x40
	beq _0238ADDC
	ldrsb r1, [r2, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238ADDC
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x58]
	add r0, sp, #0xac
	bl sub_0205B028
	add r0, sp, #0xac
	mov r1, #3
	bl sub_0203F150
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #5]
_0238ADDC:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x80
	beq _0238AE24
	ldrsb r1, [r1, #6]
	mvn r0, #1
	cmp r1, r0
	bne _0238AE20
	mov r1, #0
	mov r2, r1
	mov r0, #8
	bl sub_0204018C
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _0238AE24
_0238AE20:
	bl sub_02041178
_0238AE24:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r3, [r0]
	ldrh r0, [r3, #0x7e]
	tst r0, #0x100
	beq _0238AE6C
	ldrsb r1, [r3, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238AE6C
	add r0, r3, #0x200
	ldrsh r2, [r0, #0x68]
	ldr r0, [r3, #0x264]
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #7]
_0238AE6C:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x200
	beq _0238AEB4
	ldrsb r1, [r1, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0238AEB4
	ldr r0, _0238B020 ; =ASSEMBLY_WINDOW_PARAMS_5
	mov r2, #0
	ldr r3, _0238B024 ; =ASSEMBLY_MAIN_MENU_ITEMS_1
	mov r1, #0x13
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r1, [r1]
	strb r0, [r1, #8]
_0238AEB4:
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x74]
	b _0238AF10
_0238AEC8:
	ldrh r0, [r4, #0x7e]
	tst r0, #1
	beq _0238AEE8
	ldrsb r0, [r4]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _0238AEEC
_0238AEE8:
	mov r0, #1
_0238AEEC:
	cmp r0, #0
	beq _0238AF10
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x74]
	ldr r1, [r0]
	ldr r0, [r1, #0x78]
	str r0, [r1, #0x70]
_0238AF10:
	mov r0, #1
	b _0238AF94
_0238AF18:
	bl sub_0203C874
	bl ov17_0238A364
	cmp r0, #0
	beq _0238AF90
	bl sub_0203C8E0
	cmp r0, #0
	bne _0238AF90
	bl sub_0203C940
	ldr r0, _0238AF9C ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x6c]
	b _0238AF90
_0238AF4C:
	mov r1, #3
	str r1, [r4, #0x6c]
	ldr r1, [r0]
	ldr r0, [r1, #0x260]
	cmp r0, #2
	bne _0238AF84
	ldr r0, [r1, #0x80]
	tst r0, #0x100
	beq _0238AF88
	ldr r0, [r1, #0x10c]
	ldr r2, [r1, #0x108]
	mov r1, #0
	blx r2
	b _0238AF88
_0238AF84:
	bl ReturnScriptMenuResultZero
_0238AF88:
	mov r0, #4
	b _0238AF94
_0238AF90:
	mov r0, #1
_0238AF94:
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
#define OV17_0238A754_OFFSET 0x38E2
#else
#define OV17_0238A754_OFFSET 0
#endif
_0238AF9C: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
_0238AFA0: .word OVERLAY17_FUNCTION_POINTER_TABLE
_0238AFA4: .word 0x00003008
_0238AFA8: .word ASSEMBLY_WINDOW_PARAMS_4
#ifndef JAPAN
_0238AFAC: .word 0x0000041E
#endif
_0238AFB0: .word 0x0000041F + OV17_0238A754_OFFSET
_0238AFB4: .word 0x00000425 + OV17_0238A754_OFFSET
_0238AFB8: .word 0x00003018
_0238AFBC: .word 0x00000426 + OV17_0238A754_OFFSET
_0238AFC0: .word 0x00000427 + OV17_0238A754_OFFSET
_0238AFC4: .word 0x00000428 + OV17_0238A754_OFFSET
_0238AFC8: .word 0x00000429 + OV17_0238A754_OFFSET
#ifdef JAPAN
_0238C528: .word 0x00003D02
#endif
_0238AFCC: .word 0x00000422 + OV17_0238A754_OFFSET
_0238AFD0: .word 0x00000421 + OV17_0238A754_OFFSET
_0238AFD4: .word 0x00000423 + OV17_0238A754_OFFSET
_0238AFD8: .word 0x00000424 + OV17_0238A754_OFFSET
_0238AFDC: .word 0x0000042A + OV17_0238A754_OFFSET
_0238AFE0: .word 0x00000186
_0238AFE4: .word ASSEMBLY_WINDOW_PARAMS_1
_0238AFE8: .word 0x00300013
_0238AFEC: .word ASSEMBLY_MAIN_MENU_ITEMS_2
_0238AFF0: .word ASSEMBLY_WINDOW_PARAMS_3
_0238AFF4: .word 0x00300033
_0238AFF8: .word ASSEMBLY_MENU_ITEMS_CONFIRM
_0238AFFC: .word ASSEMBLY_SUBMENU_ITEMS_1
_0238B000: .word ASSEMBLY_SUBMENU_ITEMS_6
_0238B004: .word ASSEMBLY_SUBMENU_ITEMS_3
_0238B008: .word ASSEMBLY_SUBMENU_ITEMS_7
_0238B00C: .word ASSEMBLY_SUBMENU_ITEMS_5
_0238B010: .word ASSEMBLY_SUBMENU_ITEMS_2
_0238B014: .word ASSEMBLY_SUBMENU_ITEMS_4
_0238B018: .word ASSEMBLY_WINDOW_PARAMS_2
_0238B01C: .word 0x00000213
_0238B020: .word ASSEMBLY_WINDOW_PARAMS_5
_0238B024: .word ASSEMBLY_MAIN_MENU_ITEMS_1
	arm_func_end ov17_0238A754

	arm_func_start ov17_0238B028
ov17_0238B028: ; 0x0238B028
	ldr r1, _0238B044 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #3
	ldr r2, [r1]
	str r3, [r2, #0x74]
	ldr r1, [r1]
	str r0, [r1, #0x78]
	bx lr
	.align 2, 0
_0238B044: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B028

	arm_func_start ov17_0238B048
ov17_0238B048: ; 0x0238B048
	ldr r0, _0238B074 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r2, #3
	ldr r1, [r0]
	ldr r3, _0238B078 ; =0x00000186
	strh r2, [r1, #0x7e]
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B074: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
_0238B078: .word 0x00000186
	arm_func_end ov17_0238B048

	arm_func_start ov17_0238B07C
ov17_0238B07C: ; 0x0238B07C
	stmdb sp!, {r3, lr}
	ldr r0, _0238B0B0 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0238B09C
	bl GetMainCharacter1MemberIdx
	bl sub_0203C7E4
_0238B09C:
	ldr r0, _0238B0B0 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B0B0: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B07C

	arm_func_start ov17_0238B0B4
ov17_0238B0B4: ; 0x0238B0B4
	stmdb sp!, {r3, lr}
	ldr r0, _0238B108 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0238B0E8
	bl sub_0203C910
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0238B108 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
_0238B0E8:
	ldr r0, _0238B108 ; =OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	mov r3, #7
	ldr r2, [r0]
	mov r1, #3
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B108: .word OVERLAY17_UNKNOWN_POINTER__NA_238BE00
	arm_func_end ov17_0238B0B4
