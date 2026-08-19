	.include "asm/macros.inc"
	.include "overlay_29_02329898.inc"

	.text

	arm_func_start DoMovePoisonFang
DoMovePoisonFang: ; 0x02329898
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023298F4
	ldr r1, _02329900 ; =POISON_FANG_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023298F4
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictBadlyPoisonedStatus
_023298F4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329900: .word POISON_FANG_POISON_CHANCE
	arm_func_end DoMovePoisonFang

	arm_func_start DoMoveDamagePoison18
DoMoveDamagePoison18: ; 0x02329904
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329960
	ldr r1, _0232996C ; =POISON_STING_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329960
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_02329960:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232996C: .word POISON_STING_POISON_CHANCE
	arm_func_end DoMoveDamagePoison18

	arm_func_start DoMoveJumpKick
DoMoveJumpKick: ; 0x02329970
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x30
	ldrb r4, [sp, #0x50]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	cmp r4, #0
	mov r4, #0
	bne _023299A8
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r4, #1
_023299A8:
	cmp r4, #0
	bne _02329A88
	mov r0, r7
	mov r1, r5
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x1c
	str r1, [sp, #4]
	mov r0, #0x100
	str r0, [sp, #8]
	ldrh ip, [r5, #4]
	mov r1, #0
	mov r2, sb
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r3, r8
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	str r1, [sp]
	ldr r2, [r7, #0xb4]
	mov r3, r1
	bl SetPreprocessorArgsStringToName
	ldr r2, _02329A94 ; =0x00000EDB
	mov r1, r6
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, [sp, #0x1c]
	mov r2, #0
	add r0, r0, r0, lsr #31
	movs r0, r0, asr #1
	str r0, [sp, #0x1c]
	addeq r0, r0, #1
	streq r0, [sp, #0x1c]
	ldrh r1, [r5, #4]
	ldr r0, _02329A98 ; =0x00000236
	add r3, sp, #0x18
	stmia sp, {r1, r2}
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	mov r0, r7
	bl CalcRecoilDamageFixed
_02329A88:
	mov r0, r4
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02329A94: .word 0x00000C1D
#else
_02329A94: .word 0x00000EDB
#endif
_02329A98: .word 0x00000236
	arm_func_end DoMoveJumpKick

	arm_func_start DoMoveBounce
DoMoveBounce: ; 0x02329A9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, r2
	mov r7, r1
	mov r1, r6
	mov r8, r0
	mov r5, r3
	mov r4, #0
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02329B2C
	ldr r1, _02329B5C ; =BOUNCE_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02329B20
	ldr r1, _02329B60 ; =BOUNCE_PARALYZE_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329B20
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictParalysisStatus
_02329B20:
	mov r0, r8
	bl EndTwoTurnMove
	b _02329B50
_02329B2C:
	ldr r0, _02329B64 ; =0x00000CD4
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #8
	bl BeginChargedMove
	mov r4, #1
_02329B50:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02329B5C: .word BOUNCE_DAMAGE_MULTIPLIER
_02329B60: .word BOUNCE_PARALYZE_CHANCE
#ifdef JAPAN
_02329B64: .word 0x00000A14
#else
_02329B64: .word 0x00000CD4
#endif
	arm_func_end DoMoveBounce

	arm_func_start DoMoveHiJumpKick
DoMoveHiJumpKick: ; 0x02329B68
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x30
	ldrb r4, [sp, #0x50]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	cmp r4, #0
	mov r4, #0
	bne _02329BA0
	str r3, [sp]
	mov r3, #0x200
	bl DealDamage
	cmp r0, #0
	movne r4, #1
_02329BA0:
	cmp r4, #0
	bne _02329C80
	mov r0, r7
	mov r1, r5
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x1c
	str r1, [sp, #4]
	mov r0, #0x200
	str r0, [sp, #8]
	ldrh ip, [r5, #4]
	mov r1, #0
	mov r2, sb
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r3, r8
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	str r1, [sp]
	ldr r2, [r7, #0xb4]
	mov r3, r1
	bl SetPreprocessorArgsStringToName
	ldr r2, _02329C8C ; =0x00000EDB
	mov r1, r6
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, [sp, #0x1c]
	mov r2, #0
	add r0, r0, r0, lsr #31
	movs r0, r0, asr #1
	str r0, [sp, #0x1c]
	addeq r0, r0, #1
	streq r0, [sp, #0x1c]
	ldrh r1, [r5, #4]
	ldr r0, _02329C90 ; =0x00000237
	add r3, sp, #0x18
	stmia sp, {r1, r2}
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	mov r0, r7
	bl CalcRecoilDamageFixed
_02329C80:
	mov r0, r4
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02329C8C: .word 0x00000C1D
#else
_02329C8C: .word 0x00000EDB
#endif
_02329C90: .word 0x00000237
	arm_func_end DoMoveHiJumpKick

	arm_func_start DoMoveTriAttack
DoMoveTriAttack: ; 0x02329C94
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329D40
	ldr r1, _02329D4C ; =TRI_ATTACK_STATUS_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329D40
	mov r0, #3
	bl DungeonRandInt
	cmp r0, #0
	beq _02329CFC
	cmp r0, #1
	beq _02329D14
	cmp r0, #2
	beq _02329D30
_02329CFC:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
	b _02329D40
_02329D14:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
	b _02329D40
_02329D30:
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl TryInflictFrozenStatus
_02329D40:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329D4C: .word TRI_ATTACK_STATUS_CHANCE
	arm_func_end DoMoveTriAttack

	arm_func_start DoMoveSwapItems
DoMoveSwapItems: ; 0x02329D50
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r8, #0
	mov r6, r1
	mov r0, r8
	mov r1, r7
	mov r2, r8
	ldr r4, [r7, #0xb4]
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #1
	mov r2, r8
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	mov r1, r6
	mov r2, #0x2c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActiveMoveEffects__02329F14
	cmp r0, #0
	beq _02329DC0
#ifdef JAPAN
	mov r0, r7
	mov r1, r6
	mov r2, #0xc20
#else
	ldr r2, _02329F08 ; =0x00000EDE
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	b _02329F00
_02329DC0:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, r8
	tst r0, #0xff
	ldrb r0, [r5, #0x62]
	moveq r8, #1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r8, #1
	cmp r8, #0
	beq _02329E10
	ldr r2, _02329F0C ; =0x00000EDD
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02329F00
_02329E10:
	ldrh r3, [r4, #0x62]
	ldrh r2, [r4, #0x64]
	ldrh r1, [r4, #0x66]
	ldrb r0, [r4, #6]
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r1, [sp, #4]
	cmp r0, #0
	bne _02329E3C
	add r0, r4, #0x62
	bl RemoveEquivItemNoHole
_02329E3C:
	ldrh r0, [r5, #0x62]
	strh r0, [r4, #0x62]
	ldrh r0, [r5, #0x64]
	strh r0, [r4, #0x64]
	ldrh r0, [r5, #0x66]
	strh r0, [r4, #0x66]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _02329E68
	mov r0, r4
	bl AddHeldItemToBag
_02329E68:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02329E7C
	add r0, r5, #0x62
	bl RemoveEquivItemNoHole
_02329E7C:
	ldrh r2, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp, #4]
	strh r2, [r5, #0x62]
	strh r1, [r5, #0x64]
	strh r0, [r5, #0x66]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02329EA8
	mov r0, r5
	bl AddHeldItemToBag
_02329EA8:
	bl RemoveEmptyItemsInBagWrapper
	ldrb r0, [r4, #6]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x63]
	ldrb r0, [r5, #6]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x63]
	mov r0, r7
	bl ov29_022F9EA0
	mov r0, r6
	bl ov29_022F9EA0
#ifdef JAPAN
	ldrb r0, [r4, #0x107]
#else
	ldrb r0, [r4, #0x108]
#endif
	ldr r2, _02329F10 ; =0x00000EDC
	mov r1, r6
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r4, #0x107]
#else
	strlob r0, [r4, #0x108]
#endif
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
_02329F00:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02329F0C: .word 0x00000C1F
_02329F10: .word 0x00000C1E
#else
_02329F08: .word 0x00000EDE
_02329F0C: .word 0x00000EDD
_02329F10: .word 0x00000EDC
#endif
	arm_func_end DoMoveSwapItems

	arm_func_start DefenderAbilityIsActiveMoveEffects__02329F14
DefenderAbilityIsActiveMoveEffects__02329F14: ; 0x02329F14
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02329F68
	cmp r0, #0
	moveq r1, #0
	beq _02329F48
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02329F48:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _02329F68
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02329F68:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActiveMoveEffects__02329F14

	arm_func_start DoMoveTripleKick
DoMoveTripleKick: ; 0x02329F78
	stmdb sp!, {r3, lr}
	ldr ip, _02329FB0 ; =TRIPLE_KICK_SUCCESSIVE_HITS
	ldr lr, [ip]
	add lr, lr, #1
	str lr, [ip]
	str r3, [sp]
	ldr r3, [ip]
	mov r3, r3, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329FB0: .word TRIPLE_KICK_SUCCESSIVE_HITS
	arm_func_end DoMoveTripleKick

	arm_func_start DoMoveSport
DoMoveSport: ; 0x02329FB4
	stmdb sp!, {r3, lr}
	ldrh r0, [r2, #4]
	cmp r0, #0xd4
	bne _02329FD0
	mov r0, #0
	bl ActivateSportCondition
	b _02329FD8
_02329FD0:
	mov r0, #1
	bl ActivateSportCondition
_02329FD8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSport

	arm_func_start DoMoveMudSlap
DoMoveMudSlap: ; 0x02329FE0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A03C
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232A03C
	ldr r1, _0232A048 ; =ATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
_0232A03C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232A048: .word ATK_STAT_IDX
	arm_func_end DoMoveMudSlap
