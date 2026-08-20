	.include "asm/macros.inc"
	.include "overlay_29_02328248.inc"

	.text

	arm_func_start DoMoveShadowBall
DoMoveShadowBall: ; 0x02328248
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023282B4
	ldr r1, _023282C0 ; =SHADOW_BALL_LOWER_SPECIAL_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023282B4
	ldr r0, _023282C4 ; =SPATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_023282B4:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023282C0: .word SHADOW_BALL_LOWER_SPECIAL_DEFENSE_CHANCE
_023282C4: .word SPATK_STAT_IDX
	arm_func_end DoMoveShadowBall

	arm_func_start DoMoveCharge
DoMoveCharge: ; 0x023282C8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, _02328320 ; =0x00000CD9
	mov r5, r1
	mov r4, r2
	bl StringFromId
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0xb
	bl BeginChargedMove
	ldr r2, _02328324 ; =SPATK_STAT_IDX
	mov r0, r6
	mov r1, r5
	ldr r2, [r2]
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02328320: .word 0x00000A19
#else
_02328320: .word 0x00000CD9
#endif
_02328324: .word SPATK_STAT_IDX
	arm_func_end DoMoveCharge

	arm_func_start DoMoveThunderbolt
DoMoveThunderbolt: ; 0x02328328
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328384
	ldr r1, _02328390 ; =THUNDERBOLT_PARALYZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328384
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_02328384:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328390: .word THUNDERBOLT_PARALYZE_CHANCE
	arm_func_end DoMoveThunderbolt
