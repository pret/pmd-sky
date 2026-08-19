	.include "asm/macros.inc"
	.include "overlay_29_02327940.inc"

	.text

	arm_func_start DoMoveRapidSpin
DoMoveRapidSpin: ; 0x02327940
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023279A0
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023279A0
	ldr r0, [r5, #0xb4]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x8e]
#else
	ldrh r0, [r0, #0x92]
#endif
	tst r0, #2
	ldrne r0, _023279A8 ; =RAPID_SPIN_BINDING_REMOVAL
	movne r1, #0
	strneb r1, [r0]
	ldreq r0, _023279A8 ; =RAPID_SPIN_BINDING_REMOVAL
	moveq r1, r4
	streqb r1, [r0]
_023279A0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023279A8: .word RAPID_SPIN_BINDING_REMOVAL
	arm_func_end DoMoveRapidSpin

	arm_func_start DoMoveSureShot
DoMoveSureShot: ; 0x023279AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _023279E0 ; =SURE_SHOT_TURN_RANGE
	mov r0, r4
	mov r2, #0
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl TryInflictSureShotStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023279E0: .word SURE_SHOT_TURN_RANGE
	arm_func_end DoMoveSureShot

	arm_func_start DoMoveCosmicPower
DoMoveCosmicPower: ; 0x023279E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02327A20 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	bl BoostDefensiveStat
	ldr r1, _02327A24 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02327A20: .word ATK_STAT_IDX
_02327A24: .word SPATK_STAT_IDX
	arm_func_end DoMoveCosmicPower

	arm_func_start DoMoveSkyAttack
DoMoveSkyAttack: ; 0x02327A28
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
	beq _02327AB8
	ldr r1, _02327AE8 ; =SKY_ATTACK_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02327AAC
	ldr r1, _02327AEC ; =SKY_ATTACK_CRINGE_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327AAC
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictCringeStatus
_02327AAC:
	mov r0, r8
	bl EndTwoTurnMove
	b _02327ADC
_02327AB8:
	ldr r0, _02327AF0 ; =0x00000CD1
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #3
	bl BeginChargedMove
	mov r4, #1
_02327ADC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02327AE8: .word SKY_ATTACK_DAMAGE_MULTIPLIER
_02327AEC: .word SKY_ATTACK_CRINGE_CHANCE
#ifdef JAPAN
_02327AF0: .word 0x00000A11
#else
_02327AF0: .word 0x00000CD1
#endif
	arm_func_end DoMoveSkyAttack

	arm_func_start DoMoveDamageFreeze15
DoMoveDamageFreeze15: ; 0x02327AF4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327B4C
	ldr r1, _02327B58 ; =POWDER_SNOW_FREEZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327B4C
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl TryInflictFrozenStatus
_02327B4C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327B58: .word POWDER_SNOW_FREEZE_CHANCE
	arm_func_end DoMoveDamageFreeze15

	arm_func_start DoMoveMeteorMash
DoMoveMeteorMash: ; 0x02327B5C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
#ifdef EUROPE
	mov r5, r1
#endif
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327BCC
	ldr r1, _02327BD8 ; =METEOR_MASH_BOOST_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
#ifdef EUROPE
	mov r1, r5
#else
	mov r1, r6
#endif
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327BCC
	ldr r0, _02327BDC ; =ATK_STAT_IDX
	ldr r5, [r6, #0xb4]
	ldr r2, [r0]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostOffensiveStat
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
_02327BCC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327BD8: .word METEOR_MASH_BOOST_ATTACK_CHANCE
_02327BDC: .word ATK_STAT_IDX
	arm_func_end DoMoveMeteorMash
