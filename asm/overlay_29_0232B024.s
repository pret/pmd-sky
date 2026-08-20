	.include "asm/macros.inc"
	.include "overlay_29_0232B024.inc"

	.text

	arm_func_start DoMoveBeatUp
DoMoveBeatUp: ; 0x0232B024
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r8, [sl, #0xb4]
	mov fp, r1
	ldrb r0, [r8, #6]
	mov r4, #0
	mov r5, #0
	cmp r0, #0
	ldrne r0, _0232B110 ; =DUNGEON_PTR
	movne r6, #0x10
	ldrne r0, [r0]
	moveq r6, #4
#ifdef JAPAN
	addne r0, r0, #0x294
	ldreq r0, _0232B110 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x284
#else
	addne r0, r0, #0x338
	ldreq r0, _0232B110 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x328
#endif
	add r7, r0, #0x12800
	b _0232B0E8
_0232B06C:
	ldr sb, [r7, r5, lsl #2]
	mov r0, sb
	bl EntityIsValidMoveEffects__0232A3D8
	cmp r0, #0
	cmpne sl, sb
	beq _0232B0E4
	mov r2, #0
	mov r0, sl
	mov r1, sb
	mov r3, r2
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _0232B0E4
	ldr r0, [sb, #0xb4]
	ldrb r1, [r0, #0xbc]
	cmp r1, #7
	beq _0232B0E4
	bl IsExperienceLocked
	cmp r0, #0
	bne _0232B0E4
	mov r0, sl
	mov r1, sb
	mov r2, #2
	add r3, fp, #4
	bl TryWarp
#ifdef JAPAN
	ldrb r0, [r8, #0x107]
#else
	ldrb r0, [r8, #0x108]
#endif
	mov r4, #1
	cmp r0, #1
	movlo r0, r4
#ifdef JAPAN
	strlob r0, [r8, #0x107]
#else
	strlob r0, [r8, #0x108]
#endif
_0232B0E4:
	add r5, r5, #1
_0232B0E8:
	cmp r5, r6
	blt _0232B06C
	cmp r4, #0
	bne _0232B108
	ldr r2, _0232B114 ; =0x00000EEC
	mov r0, sl
	mov r1, fp
	bl LogMessageByIdWithPopupCheckUserTarget
_0232B108:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232B110: .word DUNGEON_PTR
#ifdef JAPAN
_0232B114: .word 0x00000C2E
#else
_0232B114: .word 0x00000EEC
#endif
	arm_func_end DoMoveBeatUp

	arm_func_start DoMoveBlastBurn
DoMoveBlastBurn: ; 0x0232B118
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x200
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end DoMoveBlastBurn

	arm_func_start DoMoveCrushClaw
DoMoveCrushClaw: ; 0x0232B164
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232B1D0
	ldr r1, _0232B1DC ; =CRUSH_CLAW_LOWER_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B1D0
	ldr r0, _0232B1E0 ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_0232B1D0:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B1DC: .word CRUSH_CLAW_LOWER_DEFENSE_CHANCE
_0232B1E0: .word ATK_STAT_IDX
	arm_func_end DoMoveCrushClaw

	arm_func_start DoMoveBlazeKick
DoMoveBlazeKick: ; 0x0232B1E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232B25C
	ldr r1, _0232B268 ; =BLAZE_KICK_BURN_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B25C
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_0232B25C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232B268: .word BLAZE_KICK_BURN_CHANCE
	arm_func_end DoMoveBlazeKick

	arm_func_start DoMovePresent
DoMovePresent: ; 0x0232B26C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r0, #0x64
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl DungeonRandInt
	cmp r0, #0xa
	bge _0232B2BC
	mov r0, r5
	mov r1, r4
	mov r2, r7
	mov r3, #0x4b
	str r6, [sp]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232B2BC:
	cmp r0, #0x1e
	bge _0232B30C
	ldr r1, [r4, #0xb4]
	ldr r0, _0232B364 ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	mov ip, #1
	mov r3, #0
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #1
	add r2, r1, r0, lsr #30
	mov r0, r5
	mov r1, r4
	mov r2, r2, asr #2
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232B30C:
	cmp r0, #0x3c
	mov r0, r5
	mov r1, r4
	bge _0232B340
	mov r2, r7
	mov r3, #0x32
	str r6, [sp]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232B340:
	mov r2, r7
	mov r3, #0x19
	str r6, [sp]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232B364: .word 0x000003E7
	arm_func_end DoMovePresent

	arm_func_start DoMoveEruption
DoMoveEruption: ; 0x0232B368
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EndFrozenStatus
	ldr r2, [r7, #0xb4]
	ldr r3, _0232B42C ; =0x000003E7
	ldrsh r1, [r2, #0x12]
	ldrsh r0, [r2, #0x16]
	add r1, r1, r0
	cmp r1, r3
	movle r3, r1
	ldrsh r0, [r2, #0x10]
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	movle r2, #0
	ble _0232B3FC
	ldr r2, _0232B42C ; =0x000003E7
	cmp r1, r2
	movle r2, r1
	mov r3, r2, lsl #1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	movle r2, #1
	ble _0232B3FC
	ldr r2, _0232B42C ; =0x000003E7
	cmp r1, r2
	movgt r1, r2
	add r2, r1, r1, lsl #1
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	cmp r0, r1, asr #2
	movle r2, #2
	movgt r2, #3
_0232B3FC:
	ldr r1, _0232B430 ; =ERUPTION_DAMAGE_MULT_TABLE
	mov r0, r7
	ldr r3, [r1, r2, lsl #2]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232B42C: .word 0x000003E7
_0232B430: .word ERUPTION_DAMAGE_MULT_TABLE
	arm_func_end DoMoveEruption
