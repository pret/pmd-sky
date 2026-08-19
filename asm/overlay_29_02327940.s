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

	arm_func_start DoMoveEndure
DoMoveEndure: ; 0x02327BE0
	stmdb sp!, {r3, lr}
	bl TryInflictEndureStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveEndure

	arm_func_start DoMoveLowerSpeed1
DoMoveLowerSpeed1: ; 0x02327BF0
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, r2
	bl LowerSpeed
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveLowerSpeed1

	arm_func_start DoMoveDamageConfuse10
DoMoveDamageConfuse10: ; 0x02327C08
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327C64
	ldr r1, _02327C70 ; =PSYBEAM_CONFUSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327C64
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictConfusedStatus
_02327C64:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327C70: .word PSYBEAM_CONFUSE_CHANCE
	arm_func_end DoMoveDamageConfuse10

	arm_func_start DoMovePsywave
DoMovePsywave: ; 0x02327C74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0x80
	mov r1, #0x180
	mov r5, r2
	mov r4, r3
	bl DungeonRandRange
	ldr r1, [r7, #0xb4]
	mov r2, r5
	ldrb r1, [r1, #0xa]
	mul r1, r0, r1
	movs r3, r1, asr #8
	movmi r3, #1
	cmp r3, #0xc7
	movgt r3, #0xc7
	mov r0, r7
	mov r1, r6
	str r4, [sp]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMovePsywave

	arm_func_start DoMoveDamageLowerDefensiveStatVariable
DoMoveDamageLowerDefensiveStatVariable: ; 0x02327CD8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr ip, [sp, #0x30]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	str ip, [sp]
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327D4C
	ldrsh r2, [sp, #0x2c]
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327D4C
	add r0, sp, #0x24
	mov ip, r4
	ldr r2, [r0]
	str ip, [sp]
	mov ip, #0
	ldrsh r3, [sp, #0x28]
	mov r0, r6
	mov r1, r5
	str ip, [sp, #4]
	bl LowerDefensiveStat
_02327D4C:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end DoMoveDamageLowerDefensiveStatVariable

	arm_func_start DoMovePsychoBoost
DoMovePsychoBoost: ; 0x02327D60
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327DC0
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _02327DC0
	ldr r0, _02327DCC ; =SPATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r5
	mov r1, r5
	mov r3, #2
	str ip, [sp, #4]
	bl LowerOffensiveStat
_02327DC0:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02327DCC: .word SPATK_STAT_IDX
	arm_func_end DoMovePsychoBoost

	arm_func_start DoMoveUproar
DoMoveUproar: ; 0x02327DD0
	stmdb sp!, {r3, lr}
	bl TryInflictSleeplessStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveUproar

	arm_func_start DoMoveWaterSpout
DoMoveWaterSpout: ; 0x02327DE0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [r0, #0xb4]
	ldr r6, _02327E8C ; =0x000003E7
	ldrsh r5, [ip, #0x12]
	ldrsh r4, [ip, #0x16]
	ldrsh ip, [ip, #0x10]
	add lr, r5, r4
	cmp lr, r6
	movle r6, lr
	mov r4, r6, asr #1
	add r4, r6, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #0
	ble _02327E64
	ldr r4, _02327E8C ; =0x000003E7
	cmp lr, r4
	movle r4, lr
	mov r5, r4, lsl #1
	mov r4, r5, asr #1
	add r4, r5, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #1
	ble _02327E64
	ldr r4, _02327E8C ; =0x000003E7
	cmp lr, r4
	movgt lr, r4
	add r4, lr, lr, lsl #1
	mov lr, r4, asr #1
	add lr, r4, lr, lsr #30
	cmp ip, lr, asr #2
	movle r5, #2
	movgt r5, #3
_02327E64:
	ldr r4, _02327E90 ; =WATER_SPOUT_DAMAGE_MULT_TABLE
	str r3, [sp]
	ldr r3, [r4, r5, lsl #2]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327E8C: .word 0x000003E7
_02327E90: .word WATER_SPOUT_DAMAGE_MULT_TABLE
	arm_func_end DoMoveWaterSpout

	arm_func_start DoMovePsychUp
DoMovePsychUp: ; 0x02327E94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	ldr r5, [r7, #0xb4]
	ldr r4, [r6, #0xb4]
	bl ov29_022E5474
	mov r0, #0
_02327EB4:
	add lr, r4, r0, lsl #1
	ldrsh r1, [lr, #0x24]
	add ip, r5, r0, lsl #1
	add r3, r4, r0, lsl #2
	strh r1, [ip, #0x24]
	ldrsh r1, [lr, #0x28]
	add r2, r5, r0, lsl #2
	add r0, r0, #1
	strh r1, [ip, #0x28]
	ldrsh r1, [lr, #0x2c]
	cmp r0, #2
	strh r1, [ip, #0x2c]
	ldr r1, [r3, #0x34]
	str r1, [r2, #0x34]
	ldr r1, [r3, #0x3c]
	str r1, [r2, #0x3c]
	blt _02327EB4
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02327F30 ; =0x00000D62
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r5, #0x108]
#endif
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02327F30: .word 0x00000AA2
#else
_02327F30: .word 0x00000D62
#endif
	arm_func_end DoMovePsychUp

	arm_func_start DoMoveDamageWithRecoil
DoMoveDamageWithRecoil: ; 0x02327F34
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	str r3, [sp]
	mov r3, #0x100
	mov r7, r0
	mov r6, r2
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327FFC
	mov r0, r7
	bl EntityIsValidMoveEffects__0232800C
	cmp r0, #0
	beq _02327FFC
	ldr r1, [r7, #0xb4]
	ldr r0, _02328008 ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	mov r4, #1
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	movs r5, r0, asr #3
	mov r0, r7
	mov r1, #7
	moveq r5, #1
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02327FFC
	mov r0, r7
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _02327FFC
	ldrh r1, [r6, #4]
	mov r2, #0
	mov r0, #0x23c
	stmia sp, {r1, r2}
	str r0, [sp, #8]
	mov r0, #0x14
	str r0, [sp, #0xc]
	mov r0, r4
	str r0, [sp, #0x10]
	mov r0, r7
	mov r1, r5
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_02327FFC:
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02328008: .word 0x000003E7
	arm_func_end DoMoveDamageWithRecoil
