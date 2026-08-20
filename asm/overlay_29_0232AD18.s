	.include "asm/macros.inc"
	.include "overlay_29_0232AD18.inc"

	.text

	arm_func_start DoMoveSecretPower
DoMoveSecretPower: ; 0x0232AD18
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232AED0
	ldr r1, _0232AEDC ; =SECRET_POWER_EFFECT_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232AED0
	ldr r0, _0232AEE0 ; =DUNGEON_PTR
	mov r1, #0xc
	ldr r0, [r0]
	ldr r2, _0232AEE4 ; =ov10_022C6321
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	smulbb r0, r0, r1
	ldrb r0, [r2, r0]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0232AEBC
_0232AD8C: ; jump table
	b _0232ADB4 ; case 0
	b _0232ADCC ; case 1
	b _0232ADF4 ; case 2
	b _0232AE0C ; case 3
	b _0232AE34 ; case 4
	b _0232AE5C ; case 5
	b _0232AE78 ; case 6
	b _0232AE90 ; case 7
	b _0232AEA8 ; case 8
	b _0232AEBC ; case 9
_0232ADB4:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
	b _0232AED0
_0232ADCC:
	ldr r1, _0232AEE8 ; =SLEEP_TURN_RANGE
	mov r0, r5
	mov r2, r4
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, #0
	bl TryInflictSleepStatus
	b _0232AED0
_0232ADF4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
	b _0232AED0
_0232AE0C:
	ldr r0, _0232AEEC ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r1, r5
	mov r0, r6
	str r3, [sp]
	mov r5, #0
	str r5, [sp, #4]
	bl LowerOffensiveStat
	b _0232AED0
_0232AE34:
	ldr r0, _0232AEEC ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r1, r5
	mov r0, r6
	str r3, [sp]
	mov r5, #0
	str r5, [sp, #4]
	bl LowerDefensiveStat
	b _0232AED0
_0232AE5C:
	ldr r1, _0232AEEC ; =ATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
	b _0232AED0
_0232AE78:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictConfusedStatus
	b _0232AED0
_0232AE90:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
	b _0232AED0
_0232AEA8:
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl TryInflictFrozenStatus
	b _0232AED0
_0232AEBC:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_0232AED0:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232AEDC: .word SECRET_POWER_EFFECT_CHANCE
_0232AEE0: .word DUNGEON_PTR
_0232AEE4: .word ov10_022C6321
_0232AEE8: .word SLEEP_TURN_RANGE
_0232AEEC: .word ATK_STAT_IDX
	arm_func_end DoMoveSecretPower

	arm_func_start DoMoveDamageConfuse30
DoMoveDamageConfuse30: ; 0x0232AEF0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232AF4C
	ldr r1, _0232AF58 ; =DIZZY_PUNCH_CONFUSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232AF4C
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictConfusedStatus
_0232AF4C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232AF58: .word DIZZY_PUNCH_CONFUSE_CHANCE
	arm_func_end DoMoveDamageConfuse30

	arm_func_start DoMoveBulkUp
DoMoveBulkUp: ; 0x0232AF5C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0232AF9C ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	str r2, [sp]
	bl BoostOffensiveStat
	add r1, sp, #0
	ldr r2, [r1]
	mov r0, r5
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232AF9C: .word ATK_STAT_IDX
	arm_func_end DoMoveBulkUp

	arm_func_start DoMovePause
DoMovePause: ; 0x0232AFA0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r5, r0
	ldr r1, _0232AFEC ; =IMPRISON_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, #1
	mov r3, r0
	mov r0, r5
	mov r1, r4
	str r2, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl TryInflictPausedStatus
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232AFEC: .word IMPRISON_TURN_RANGE
	arm_func_end DoMovePause
