	.include "asm/macros.inc"
	.include "overlay_29_0232B7E0.inc"

	.text

	arm_func_start DoMoveDefenseCurl
DoMoveDefenseCurl: ; 0x0232B7E0
	stmdb sp!, {r3, lr}
	ldr r2, _0232B7FC ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B7FC: .word ATK_STAT_IDX
	arm_func_end DoMoveDefenseCurl

	arm_func_start DoMoveDecoy
DoMoveDecoy: ; 0x0232B800
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov ip, #0
	mov r3, r2
	str ip, [sp]
	bl TryInflictDecoyStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDecoy

	arm_func_start DoMoveMistBall
DoMoveMistBall: ; 0x0232B820
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232B88C
	ldr r1, _0232B898 ; =MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B88C
	ldr r0, _0232B89C ; =SPATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerOffensiveStat
_0232B88C:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B898: .word MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE
_0232B89C: .word SPATK_STAT_IDX
	arm_func_end DoMoveMistBall
