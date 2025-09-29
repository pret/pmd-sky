	.include "asm/macros.inc"
	.include "overlay_29_0230E064.inc"

	.text

	arm_func_start TryRecruit
TryRecruit: ; 0x0230E064
#ifdef JAPAN
#define TRY_RECRUIT_OFFSET -4
#define TRY_RECRUIT_OFFSET_2 -0x2C0
#else
#define TRY_RECRUIT_OFFSET 0
#define TRY_RECRUIT_OFFSET_2 0
#endif
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x114 + TRY_RECRUIT_OFFSET
	mov sl, r0
	mov r0, #0xa
	mov r5, #0
	mov sb, r1
	mov r8, r2
	bl ov29_0234BA54
	mov r0, r5
	bl ov29_0234B1A4
	bl ov29_0234D630
	add r0, sb, #4
	add r1, sl, #4
	mvn r7, #0
	bl GetDirectionTowardsPosition
	mov r6, r0
	ldr r4, [sb, #0xb4]
	mov r0, r5
	strb r0, [sb, #0x22]
	mov r0, sl
	mov r1, sb
	bl ov29_02305F60
	mov r1, r6
	mov r0, sb
	bl ov29_02304A48
	ldrsh r0, [r4, #2]
	mov r1, #1
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _0230E0FC
	bl GetMessageLogPreprocessorArgs
	mov r1, #1
	str r1, [sp]
	mov r1, r5
	ldr r2, [sb, #0xb4]
	mov r3, r1
	bl SetPreprocessorArgsStringToName
	b _0230E114
_0230E0FC:
	bl GetMessageLogPreprocessorArgs
	mov r1, r5
	str r1, [sp]
	ldr r2, [sb, #0xb4]
	mov r3, r1
	bl SetPreprocessorArgsStringToName
_0230E114:
	bl GetMessageLogPreprocessorArgs
	mov r1, r0
	mov r3, #1
	mov r2, #0
	str r3, [sp]
	ldr r0, _0230E55C ; =0x00000C77
	mov r3, r2
	bl ov29_0234D7C0
	cmp r0, #2
	moveq r4, #0
	beq _0230E524
	mov r4, #1
	mov r0, #0
	orr r1, r4, #2
	strb r1, [sp, #0xac + TRY_RECRUIT_OFFSET]
	strb r0, [sp, #0xad + TRY_RECRUIT_OFFSET]
	ldrsh r2, [r8, #0xc]
	ldr r1, _0230E560 ; =DUNGEON_PTR
	sub r3, r0, #1
	strb r2, [sp, #0xae + TRY_RECRUIT_OFFSET]
	strh r4, [sp, #0xb2 + TRY_RECRUIT_OFFSET]
	ldr r2, [r1]
	ldrh r4, [r8, #0x44]
	add r1, sp, #0x14
	strh r4, [r1, #0xf2 + TRY_RECRUIT_OFFSET]
	ldrh r4, [r8, #0x46]
	strh r4, [r1, #0xf4 + TRY_RECRUIT_OFFSET]
	strb r0, [sp, #0x104 + TRY_RECRUIT_OFFSET]
	strh r3, [sp, #0xb4 + TRY_RECRUIT_OFFSET]
	strh r3, [sp, #0xb6 + TRY_RECRUIT_OFFSET]
	ldrsh r1, [r8]
	strh r1, [sp, #0xb8 + TRY_RECRUIT_OFFSET]
	ldrb r1, [r2, #0x748]
	strb r1, [sp, #0xaf + TRY_RECRUIT_OFFSET]
	ldrb r1, [r2, #0x749]
	add r2, sp, #0xac + TRY_RECRUIT_OFFSET
	strb r1, [sp, #0xb0 + TRY_RECRUIT_OFFSET]
	ldrsh r1, [r8, #6]
	strh r1, [sp, #0xba + TRY_RECRUIT_OFFSET]
	ldrsh r1, [r8, #6]
	strh r1, [sp, #0xbc + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x14]
	strh r1, [sp, #0xf0 + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x16]
	strh r1, [sp, #0xf2 + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x18]
	strh r1, [sp, #0xf4 + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x1a]
	strh r1, [sp, #0xf6 + TRY_RECRUIT_OFFSET]
_0230E1D8:
	add r4, r8, r0
	ldrb r1, [r4, #8]
	add r3, r2, r0
	add r0, r0, #1
	strb r1, [r3, #0x12]
	ldrb r1, [r4, #0xa]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	strb r1, [r3, #0x14]
	cmp r0, #2
	blt _0230E1D8
	ldr r0, [r8, #0x10]
	add r2, sp, #0xc8 + TRY_RECRUIT_OFFSET
	str r0, [sp, #0xc4 + TRY_RECRUIT_OFFSET]
	add r3, r8, #0x22
	mov r1, #0x11
_0230E218:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0230E218
	ldrh r0, [r8, #0x1c]
	strh r0, [sp, #0xea + TRY_RECRUIT_OFFSET]
	ldrh r0, [r8, #0x1e]
	strh r0, [sp, #0xec + TRY_RECRUIT_OFFSET]
	ldrh r0, [r8, #0x20]
	strh r0, [sp, #0xee + TRY_RECRUIT_OFFSET]
	ldrsh r0, [r8]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x100
	add r0, r0, #0xa + TRY_RECRUIT_OFFSET
	mov r2, #0xa
	bl StrncpyName
	ldrsh r1, [sp, #0xb8 + TRY_RECRUIT_OFFSET]
	ldrsh r2, [sp, #0xb2 + TRY_RECRUIT_OFFSET]
	add r0, sp, #0xf8 + TRY_RECRUIT_OFFSET
	bl EnableAllLearnableIqSkills
	add r1, sp, #0x100
	add r0, sp, #0x98
	add r1, r1, #0xa + TRY_RECRUIT_OFFSET
#ifdef JAPAN
	add r4, sp, #0x18
	bl StrcpySimple
#else
	mov r2, #0xa
	add r4, sp, #0x18
	bl StrncpySimpleNoPad
#endif
	bl ov29_022EACAC
	bl GetMessageLogPreprocessorArgs
	mov r1, r0
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r0, _0230E564 ; =0x00000C7B
	mov r3, r2
	bl ov29_0234D7C0
	cmp r0, #1
	bne _0230E2D4
	bl ov29_0234D838
	add r6, sp, #0x100
	add r6, r6, #0xa + TRY_RECRUIT_OFFSET
_0230E2BC:
	mov r0, r6
	add r1, sp, #0x98
	mov r2, #0
	bl DungeonModeSetupAndShowNameKeyboard
	cmp r0, #0
	beq _0230E2BC
_0230E2D4:
	add r1, sp, #0xac + TRY_RECRUIT_OFFSET
	mov r0, r4
	bl sub_020585B4
	mov r1, r4
	mov r0, #0
	bl SetMessageLogPreprocessorArgsString
	mov r0, #1
	mov r1, #0
	bl SetPreprocessorArgsIdVal
	ldr r0, _0230E568 ; =0x00000C7E
	bl ov29_0230E658
	ldrsh r1, [r8, #2]
	ldrsh r2, [r8, #4]
	mov r0, sb
	bl ov29_02337EC0
	ldrsh r2, [r8, #2]
	ldrsh r3, [r8, #4]
	mov r0, sl
	mov r1, sb
	bl ov29_0230E5A8
	cmp r0, #0
	bne _0230E42C
	add r0, sp, #0xac + TRY_RECRUIT_OFFSET
	mvn r1, #0
	bl ov29_0230E5FC
	mov r7, r0
	b _0230E410
_0230E340:
	ldr r0, _0230E56C ; =0x00000C7F
	bl ov29_0230E658
	mvn r4, #0
_0230E34C:
	bl ov29_0234D838
	add r1, sp, #0x100
	mov r0, sb
	add r1, r1, #0xa + TRY_RECRUIT_OFFSET
	bl ov29_0234EE10
	movs r6, r0
	beq _0230E3D4
	cmp r6, sb
	add r0, sp, #0x58
	bne _0230E380
	add r1, sp, #0xac + TRY_RECRUIT_OFFSET
	bl sub_020585B4
	b _0230E38C
_0230E380:
	ldr r1, [r6, #0xb4]
	ldrsh r1, [r1, #0xc]
	bl sub_020584FC
_0230E38C:
	mov r0, #0
	add r1, sp, #0x58
	bl SetMessageLogPreprocessorArgsString
	mov r0, #1
	mov r1, sl
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl GetMessageLogPreprocessorArgs
	mov r1, #1
	mov r2, #0
	str r1, [sp]
	mov r1, r0
	mov r0, #0xc80 + TRY_RECRUIT_OFFSET_2
	mov r3, r2
	bl ov29_0234D7C0
	mov fp, r0
	cmp fp, r4
	beq _0230E34C
_0230E3D4:
	cmp fp, #2
	cmpne r6, #0
	beq _0230E410
	ldr r0, _0230E56C ; =0x00000C7F
	add r0, r0, #2
	bl ov29_0230E658
	mov r0, r6
	bl ov29_022E68BC
	ldr r1, _0230E570 ; =0x00000233
	mov r0, r6
	mov r2, sl
	bl HandleFaint
	cmp r6, sb
	moveq r4, #1
	beq _0230E524
_0230E410:
	mov r0, sl
	mov r1, sb
	ldrsh r2, [r8, #2]
	ldrsh r3, [r8, #4]
	bl ov29_0230E5A8
	cmp r0, #0
	beq _0230E340
_0230E42C:
	mov r6, #0
	mov r4, r6
	mov r5, #1
	b _0230E468
_0230E43C:
	mov r0, r6
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0230E470
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230E468:
	cmp r6, #4
	blt _0230E43C
_0230E470:
	add r0, sp, #0xac + TRY_RECRUIT_OFFSET
	mov r1, r7
	strh r6, [sp, #0xb6 + TRY_RECRUIT_OFFSET]
	bl ov29_0230E5FC
	strh r0, [sp, #0xb4 + TRY_RECRUIT_OFFSET]
	ldrsh r1, [sp, #0xb4 + TRY_RECRUIT_OFFSET]
	mov r0, r6
	bl sub_02056698
	ldr r1, _0230E570 ; =0x00000233
	mov r0, sb
	mov r2, sl
	bl HandleFaint
	mov r0, r6
	bl GetActiveTeamMember
	mov r4, r0
	add r7, sp, #0xac + TRY_RECRUIT_OFFSET
	mov r6, r4
	mov r5, #6
_0230E4B8:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230E4B8
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	bl ov29_022E8104
	bl ov29_022E81F8
	add r1, sp, #0x14
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	ldrsh r2, [r8, #4]
	mov r3, r4
	bl InitTeamMember
	ldrsh r0, [r4, #0xc]
	bl SetPokemonJoined
	bl ov29_022E8104
	bl ov29_022E81F8
	ldr r5, [sp, #0x14]
	mov r4, #1
_0230E524:
	mov r0, #1
	bl ov29_0234D8A0
	cmp r4, #0
	bne _0230E540
	ldr r1, _0230E574 ; =0x00000C78
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_0230E540:
	cmp r5, #0
	beq _0230E550
	mov r0, r5
	bl EnsureCanStandCurrentTile
_0230E550:
	mov r0, r4
	add sp, sp, #0x114 + TRY_RECRUIT_OFFSET
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_0230E55C: .word 0x00000C77 + TRY_RECRUIT_OFFSET_2
_0230E560: .word DUNGEON_PTR
_0230E564: .word 0x00000C7B + TRY_RECRUIT_OFFSET_2
_0230E568: .word 0x00000C7E + TRY_RECRUIT_OFFSET_2
_0230E56C: .word 0x00000C7F + TRY_RECRUIT_OFFSET_2
_0230E570: .word 0x00000233
_0230E574: .word 0x00000C78 + TRY_RECRUIT_OFFSET_2
	arm_func_end TryRecruit
