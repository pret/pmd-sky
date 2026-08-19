	.include "asm/macros.inc"
	.include "overlay_29_023293F8.inc"

	.text

	arm_func_start DoMoveMoonlight
DoMoveMoonlight: ; 0x023293F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02329434 ; =MOONLIGHT_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02329434: .word MOONLIGHT_HP_RESTORATION_TABLE
	arm_func_end DoMoveMoonlight

	arm_func_start DoMoveHornDrill
DoMoveHornDrill: ; 0x02329438
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r2
	mov sb, r0
	mov r2, #0
	mov r0, r7
	mov r8, r1
	mov r6, r3
	strb r2, [sp, #0x1c]
	bl GetMoveType
	mov r4, r0
	mov r0, sb
	mov r1, #0x57
	bl AbilityIsActiveVeneer
	mov r2, r4
	mov r3, r0
	mov r0, sb
	mov r1, r8
	bl ov29_0230D4A4
	cmp r0, #0
	bne _023294A4
	ldr r2, _0232952C ; =0x00000ED9
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329524
_023294A4:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl GetDamageSourceWrapper
	add r2, sp, #0x1c
	stmia sp, {r2, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r2, _02329530 ; =0x0000270F
	mov r0, sb
	mov r1, r8
	mov r3, #1
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	mov r1, r8
	cmp r0, #0
	moveq r3, #1
	movne r3, #0
	mov r0, #0
	mov r2, r0
	strb r3, [sp, #0x1c]
	bl SubstitutePlaceholderStringTags
	ldrb r0, [sp, #0x1c]
_02329524:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232952C: .word 0x00000C1B
#else
_0232952C: .word 0x00000ED9
#endif
_02329530: .word 0x0000270F
	arm_func_end DoMoveHornDrill

	arm_func_start DoMoveSwordsDance
DoMoveSwordsDance: ; 0x02329534
	stmdb sp!, {r3, lr}
	ldr r2, _02329550 ; =ATK_STAT_IDX
	mov r3, #2
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329550: .word ATK_STAT_IDX
	arm_func_end DoMoveSwordsDance

	arm_func_start DoMoveConversion
DoMoveConversion: ; 0x02329554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r1, #0x25
	ldr r7, [sb, #0xb4]
	mov r8, #0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02329598
	ldr r2, _02329658 ; =0x00000DC3
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	b _02329650
_02329598:
	mov r5, r8
#ifdef JAPAN
	add r4, r7, #0x120
#else
	add r4, r7, #0x124
#endif
	add fp, sp, #0
_023295A4:
	ldrb r0, [r4, r5, lsl #3]
	add r6, r4, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023295D8
	mov r0, sb
	mov r1, r6
	bl GetMoveTypeForMonster
	cmp r0, #0
	strne r6, [fp, r8, lsl #2]
	addne r8, r8, #1
_023295D8:
	add r5, r5, #1
	cmp r5, #4
	blt _023295A4
	cmp r8, #0
	bne _02329604
	ldr r2, _0232965C ; =0x00000DB6
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329650
_02329604:
	mov r0, r8
	bl DungeonRandInt
	add r1, sp, #0
	ldr r4, [r1, r0, lsl #2]
	mov r0, sb
	mov r1, r4
	bl GetMoveTypeForMonster
	strb r0, [r7, #0x5e]
	mov r0, #0
	strb r0, [r7, #0x5f]
	mov r1, #1
	strb r1, [r7, #0xff]
	ldrh r1, [r4, #4]
	bl SetPreprocessorArgsIdVal
	ldr r2, _02329660 ; =0x00000DB5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
_02329650:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02329658: .word 0x00000B03
_0232965C: .word 0x00000AF6
_02329660: .word 0x00000AF5
#else
_02329658: .word 0x00000DC3
_0232965C: .word 0x00000DB6
_02329660: .word 0x00000DB5
#endif
	arm_func_end DoMoveConversion
