	.include "asm/macros.inc"
	.include "overlay_29_02328B00.inc"

	.text

	arm_func_start DoMoveSacredFire
DoMoveSacredFire: ; 0x02328B00
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
	beq _02328B78
	ldr r1, _02328B84 ; =SACRED_FIRE_BURN_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328B78
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_02328B78:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328B84: .word SACRED_FIRE_BURN_CHANCE
	arm_func_end DoMoveSacredFire

	arm_func_start DoMoveOhko
DoMoveOhko: ; 0x02328B88
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
	bne _02328BF4
	ldr r2, _02328C6C ; =0x00000ED7
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _02328C64
_02328BF4:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, _02328C70 ; =0x0000270F
	mov r1, r8
	mov r0, sb
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
_02328C64:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02328C6C: .word 0x00000C19
#else
_02328C6C: .word 0x00000ED7
#endif
_02328C70: .word 0x0000270F
	arm_func_end DoMoveOhko

	arm_func_start DoMoveSolarBeam
DoMoveSolarBeam: ; 0x02328C74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetApparentWeather
	mov r8, r0
	cmp r8, #1
	moveq r0, #1
	beq _02328CAC
	mov r0, r7
	mov r1, r5
	bl IsChargingTwoTurnMove
_02328CAC:
	cmp r0, #0
	beq _02328D0C
	ldr r0, _02328D3C ; =SOLARBEAM_DAMAGE_MULTIPLIER
	cmp r8, #2
	ldr r3, [r0]
	beq _02328CD4
	add r0, r8, #0xfc
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02328CDC
_02328CD4:
	add r0, r3, r3, lsr #31
	mov r3, r0, asr #1
_02328CDC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r7
	and r4, r1, #0xff
	bl EndTwoTurnMove
	b _02328D30
_02328D0C:
	ldr r0, _02328D40 ; =0x00000CD2
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #2
	bl BeginChargedMove
	mov r4, #1
_02328D30:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328D3C: .word SOLARBEAM_DAMAGE_MULTIPLIER
#ifdef JAPAN
_02328D40: .word 0x00000A12
#else
_02328D40: .word 0x00000CD2
#endif
	arm_func_end DoMoveSolarBeam

	arm_func_start DoMoveSonicBoom
DoMoveSonicBoom: ; 0x02328D44
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x20
	mov r5, #0
	strb r5, [sp, #0x1c]
	mov r7, r2
	mov r4, r0
	mov r0, r7
	mov r8, r1
	mov r5, r3
	bl GetMoveType
	mov r6, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r5
	mov r5, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r6}
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, _02328DE0 ; =SONICBOOM_FIXED_DAMAGE
	mov r1, r8
	ldrsh r2, [r2]
	mov r0, r4
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02328DE0: .word SONICBOOM_FIXED_DAMAGE
	arm_func_end DoMoveSonicBoom

	arm_func_start DoMoveFly
DoMoveFly: ; 0x02328DE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02328E40
	ldr r1, _02328E6C ; =FLY_DAMAGE_MULTIPLIER
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r7
	and r4, r1, #0xff
	bl EndTwoTurnMove
	b _02328E64
_02328E40:
	ldr r0, _02328E70 ; =0x00000CD3
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #7
	bl BeginChargedMove
	mov r4, #1
_02328E64:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02328E6C: .word FLY_DAMAGE_MULTIPLIER
#ifdef JAPAN
_02328E70: .word 0x00000A13
#else
_02328E70: .word 0x00000CD3
#endif
	arm_func_end DoMoveFly

	arm_func_start DoMoveExplosion
DoMoveExplosion: ; 0x02328E74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r2
	mov r8, r0
	mov r5, r3
	mov r0, r6
	mov r7, r1
	bl GetMoveType
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl GetDamageSourceWrapper
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, r7
	add r2, r7, #4
	mov r3, #2
	bl TryExplosion
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DoMoveExplosion

	arm_func_start DoMoveDive
DoMoveDive: ; 0x02328ECC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl GetTileAtEntity
	bl IsTileGround
	cmp r0, #0
	beq _02328F0C
	ldr r2, _02328F88 ; =0x00000ED8
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02328F7C
_02328F0C:
	mov r0, r8
	mov r1, r6
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02328F58
	ldr r1, _02328F8C ; =DIVE_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, r4
	mov r0, r8
	and r4, r1, #0xff
	bl EndTwoTurnMove
	b _02328F7C
_02328F58:
	ldr r0, _02328F90 ; =0x00000CD5
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #9
	bl BeginChargedMove
	mov r4, #1
_02328F7C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02328F88: .word 0x00000C1A
_02328F8C: .word DIVE_DAMAGE_MULTIPLIER
_02328F90: .word 0x00000A15
#else
_02328F88: .word 0x00000ED8
_02328F8C: .word DIVE_DAMAGE_MULTIPLIER
_02328F90: .word 0x00000CD5
#endif
	arm_func_end DoMoveDive

	arm_func_start DoMoveWaterfall
DoMoveWaterfall: ; 0x02328F94
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328FF0
	ldr r1, _02328FFC ; =WATERFALL_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328FF0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02328FF0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328FFC: .word WATERFALL_CRINGE_CHANCE
	arm_func_end DoMoveWaterfall

	arm_func_start DoMoveDamageLowerAccuracy40
DoMoveDamageLowerAccuracy40: ; 0x02329000
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329060
	ldr r1, _0232906C ; =MUDDY_WATER_LOWER_ACCURACY_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329060
	ldr r1, _02329070 ; =ATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
_02329060:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232906C: .word MUDDY_WATER_LOWER_ACCURACY_CHANCE
_02329070: .word ATK_STAT_IDX
	arm_func_end DoMoveDamageLowerAccuracy40

	arm_func_start DoMoveStockpile
DoMoveStockpile: ; 0x02329074
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl TryInflictStockpileStatus
	cmp r0, #0
	beq _023290BC
	ldr r1, _023290C4 ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	ldr r1, _023290C8 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
_023290BC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023290C4: .word ATK_STAT_IDX
_023290C8: .word SPATK_STAT_IDX
	arm_func_end DoMoveStockpile

	arm_func_start DoMoveTwister
DoMoveTwister: ; 0x023290CC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r1, #0xd2]
	mov ip, #1
	mov r1, r4
	add r0, r0, #0xf9
	and r0, r0, #0xff
	cmp r0, #1
	movls ip, #2
	str r3, [sp]
	mov r0, r5
	mov r3, ip, lsl #8
	mov r6, #0
	bl DealDamage
	cmp r0, #0
	beq _0232914C
	ldr r1, _02329158 ; =TWISTER_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	mov r6, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232914C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232914C:
	mov r0, r6
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329158: .word TWISTER_CRINGE_CHANCE
	arm_func_end DoMoveTwister

	arm_func_start DoMoveTwineedle
DoMoveTwineedle: ; 0x0232915C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	ldrne r0, _023291E8 ; =TWINEEDLE_HIT_TRACKER
	movne r4, #1
	strneb r4, [r0]
	ldr r0, _023291E8 ; =TWINEEDLE_HIT_TRACKER
	ldrb r0, [r0]
	cmp r0, #0
	beq _023291DC
	ldr r0, _023291EC ; =MULTIHIT_MOVE_SUCCESSIVE_HITS
	ldr r0, [r0]
	cmp r0, #2
	bne _023291DC
	ldr r1, _023291F0 ; =TWINEEDLE_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023291DC
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_023291DC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023291E8: .word TWINEEDLE_HIT_TRACKER
_023291EC: .word MULTIHIT_MOVE_SUCCESSIVE_HITS
_023291F0: .word TWINEEDLE_POISON_CHANCE
	arm_func_end DoMoveTwineedle

	arm_func_start DoMoveRecoverHpTeam
DoMoveRecoverHpTeam: ; 0x023291F4
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xb4]
	ldr r2, _02329238 ; =0x000003E7
	ldrsh ip, [r3, #0x12]
	ldrsh r3, [r3, #0x16]
	add r3, ip, r3
	cmp r3, r2
	movgt r3, r2
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov ip, #1
	mov r2, r2, asr #2
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329238: .word 0x000003E7
	arm_func_end DoMoveRecoverHpTeam
