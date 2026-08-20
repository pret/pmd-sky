	.include "asm/macros.inc"
	.include "overlay_29_02325DE4.inc"

	.text

	arm_func_start DoMoveIronTail
DoMoveIronTail: ; 0x02325DE4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02325E50
	ldr r1, _02325E5C ; =IRON_TAIL_LOWER_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02325E50
	ldr r0, _02325E60 ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_02325E50:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02325E5C: .word IRON_TAIL_LOWER_DEFENSE_CHANCE
_02325E60: .word ATK_STAT_IDX
	arm_func_end DoMoveIronTail

	arm_func_start DoMoveDamageMultihitUntilMiss
DoMoveDamageMultihitUntilMiss: ; 0x02325E64
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, _02325EB8 ; =ROLLOUT_ICE_BALL_SUCCESSIVE_HITS
	str r3, [sp]
	ldr ip, [ip]
	ldr r3, _02325EBC ; =ROLLOUT_DAMAGE_MULT_TABLE
	mov r4, #0
	ldr r3, [r3, ip, lsl #2]
	bl DealDamage
	cmp r0, #0
	ldreq r0, _02325EC0 ; =ROLLOUT_ICE_BALL_MISSED
	moveq r1, #1
	streqb r1, [r0]
	ldr r1, _02325EB8 ; =ROLLOUT_ICE_BALL_SUCCESSIVE_HITS
	movne r4, #1
	ldr r2, [r1]
	mov r0, r4
	add r2, r2, #1
	str r2, [r1]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02325EB8: .word ROLLOUT_ICE_BALL_SUCCESSIVE_HITS
_02325EBC: .word ROLLOUT_DAMAGE_MULT_TABLE
_02325EC0: .word ROLLOUT_ICE_BALL_MISSED
	arm_func_end DoMoveDamageMultihitUntilMiss

	arm_func_start DoMoveYawn
DoMoveYawn: ; 0x02325EC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02325EFC ; =YAWN_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	add r2, r2, #1
	bl TryInflictYawningStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02325EFC: .word YAWN_TURN_RANGE
	arm_func_end DoMoveYawn

	arm_func_start DoMoveSleep
DoMoveSleep: ; 0x02325F00
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02325F38 ; =SLEEP_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	mov r3, #1
	bl TryInflictSleepStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02325F38: .word SLEEP_TURN_RANGE
	arm_func_end DoMoveSleep
