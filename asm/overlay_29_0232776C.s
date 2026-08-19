	.include "asm/macros.inc"
	.include "overlay_29_0232776C.inc"

	.text

	arm_func_start DoMoveDamageMultihitFatigue
DoMoveDamageMultihitFatigue: ; 0x0232776C
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023277AC
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	ldrne r0, _023277B4 ; =MULTIHIT_FATIGUE_MOVE_USED
	movne r1, r4
	strneb r1, [r0]
_023277AC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023277B4: .word MULTIHIT_FATIGUE_MOVE_USED
	arm_func_end DoMoveDamageMultihitFatigue

	arm_func_start DoMoveDamageWeightDependent
DoMoveDamageWeightDependent: ; 0x023277B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r1, [r6, #0xb4]
	mov r7, r0
	ldrsh r0, [r1, #4]
	mov r5, r2
	mov r4, r3
	bl GetWeightMultiplier
	mov r3, r0
	mov r0, r7
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMoveDamageWeightDependent

	arm_func_start DoMoveDamageBoostAllStats
DoMoveDamageBoostAllStats: ; 0x02327804
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023278D4
	ldr r1, _023278E0 ; =SILVER_WIND_BOOST_CHANCE
	mov r0, r6
	ldrsh r1, [r1]
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023278D4
	mov r0, r6
	mov r1, r6
	mov r2, #0
	mov r3, r4
	ldr r5, [r6, #0xb4]
	bl BoostSpeedOneStage
	ldr r1, _023278E4 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1, #4]
	mov r1, r6
	mov r3, r4
	str r2, [sp, #8]
	bl BoostOffensiveStat
	ldr r1, _023278E4 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r6
	mov r3, r4
	str r2, [sp, #4]
	bl BoostOffensiveStat
	add r2, sp, #8
	ldr r2, [r2]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostDefensiveStat
	add r2, sp, #4
	ldr r2, [r2]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostDefensiveStat
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x108]
#endif
_023278D4:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023278E0: .word SILVER_WIND_BOOST_CHANCE
_023278E4: .word SPATK_STAT_IDX
	arm_func_end DoMoveDamageBoostAllStats

	arm_func_start DoMoveSynthesis
DoMoveSynthesis: ; 0x023278E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02327924 ; =SYNTHESIS_HP_RESTORATION_TABLE
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
_02327924: .word SYNTHESIS_HP_RESTORATION_TABLE
	arm_func_end DoMoveSynthesis
