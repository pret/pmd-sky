	.include "asm/macros.inc"
	.include "overlay_29_0232D378.inc"

	.text

	arm_func_start DoMoveGuardSwap
DoMoveGuardSwap: ; 0x0232D378
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl SwapDefensiveStages
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapDefensiveMultipliers
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232D3D4 ; =0x00000F2E
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232D3D4: .word 0x00002495
#else
_0232D3D4: .word 0x00000F2E
#endif
	arm_func_end DoMoveGuardSwap

	arm_func_start DoMoveHealOrder
DoMoveHealOrder: ; 0x0232D3D8
	stmdb sp!, {r3, lr}
	ldr r2, _0232D3FC ; =HEAL_ORDER_HP_RESTORATION
	mov ip, #1
	ldrsh r2, [r2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232D3FC: .word HEAL_ORDER_HP_RESTORATION
	arm_func_end DoMoveHealOrder

	arm_func_start DoMoveHealBlock
DoMoveHealBlock: ; 0x0232D400
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictHealBlockStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHealBlock

	arm_func_start DoMoveThunderFang
DoMoveThunderFang: ; 0x0232D418
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D4A4 ; =THUNDER_FANG_PARALYZE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D46C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictParalysisStatus
_0232D46C:
	ldr r1, _0232D4A8 ; =THUNDER_FANG_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D49C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232D49C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D4A4: .word THUNDER_FANG_PARALYZE_CHANCE
_0232D4A8: .word THUNDER_FANG_CRINGE_CHANCE
	arm_func_end DoMoveThunderFang

	arm_func_start DoMoveDefog
DoMoveDefog: ; 0x0232D4AC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	ldr r4, [r5, #0xb4]
	bl MistIsActive
	cmp r0, #0
	bne _0232D4E0
	ldrb r0, [r4, #0xd5]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0232D4FC
_0232D4E0:
	ldr r2, _0232D550 ; =0x00000ED2
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl EndReflectClassStatus
_0232D4FC:
	ldr r1, _0232D554 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #6
	bne _0232D548
	ldr r1, _0232D558 ; =WEATHER_MOVE_TURN_COUNT
	ldr r0, _0232D55C ; =DUNGEON_PTR
	ldrsh r3, [r1]
	ldr r1, [r0]
	mov r0, #1
#ifdef JAPAN
	add r2, r1, #0xcc00
	mov r1, #0
	strh r3, [r2, #0x96]
#else
	add r2, r1, #0xcd00
	mov r1, #0
	strh r3, [r2, #0x3a]
#endif
	bl TryActivateWeather
_0232D548:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232D550: .word 0x00000C14
#else
_0232D550: .word 0x00000ED2
#endif
_0232D554: .word SPATK_STAT_IDX
_0232D558: .word WEATHER_MOVE_TURN_COUNT
_0232D55C: .word DUNGEON_PTR
	arm_func_end DoMoveDefog

	arm_func_start DoMoveTrumpCard
DoMoveTrumpCard: ; 0x0232D560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, r2
	ldrb r4, [r6, #6]
	mov r8, r0
	mov r0, r6
	mov r7, r1
	mov r5, r3
	bl GetMaxPp
	movs r1, r0
	mov r0, #0x64
	mul r0, r4, r0
	moveq r1, #1
	bl _s32_div_f
	cmp r0, #0x19
	bgt _0232D5BC
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x140
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D5BC:
	cmp r0, #0x32
	bgt _0232D5E0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D5E0:
	cmp r0, #0x4b
	mov r0, r8
	mov r1, r7
	bgt _0232D604
	mov r2, r6
	mov r3, #0xc0
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D604:
	mov r2, r6
	mov r3, #0x80
	str r5, [sp]
	bl DealDamage
_0232D614:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end DoMoveTrumpCard

	arm_func_start DoMoveIceFang
DoMoveIceFang: ; 0x0232D620
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D6A8 ; =ICE_FANG_FREEZE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D670
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl TryInflictFrozenStatus
_0232D670:
	ldr r1, _0232D6AC ; =ICE_FANG_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D6A0
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232D6A0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D6A8: .word ICE_FANG_FREEZE_CHANCE
_0232D6AC: .word ICE_FANG_CRINGE_CHANCE
	arm_func_end DoMoveIceFang

	arm_func_start DoMovePsychoShift
DoMovePsychoShift: ; 0x0232D6B0
	stmdb sp!, {r3, lr}
	cmp r0, r1
	beq _0232D6C8
	mov r2, #0
	mov r3, r2
	bl TransferNegativeStatusCondition
_0232D6C8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePsychoShift

	arm_func_start DoMoveEmbargo
DoMoveEmbargo: ; 0x0232D6D0
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictEmbargoStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveEmbargo

	arm_func_start DoMoveBrine
DoMoveBrine: ; 0x0232D6E8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, [r1, #0xb4]
	ldr ip, _0232D734 ; =0x000003E7
	ldrsh r4, [r5, #0x12]
	ldrsh lr, [r5, #0x16]
	add r4, r4, lr
	cmp r4, ip
	movgt r4, ip
	ldrsh ip, [r5, #0x10]
	cmp r4, ip, lsl #1
	movge r4, #2
	movlt r4, #1
	str r3, [sp]
	mov r3, r4, lsl #8
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D734: .word 0x000003E7
	arm_func_end DoMoveBrine

	arm_func_start DoMoveNaturalGift
DoMoveNaturalGift: ; 0x0232D738
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrsh r0, [r0, #0x66]
	mov r5, r2
	mov r4, r3
	cmp r0, #0
	beq _0232D7C8
	add r2, sp, #0xc
	mov r3, r5
	mov r1, #4
_0232D76C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0232D76C
	mov r0, r7
	bl GetEntityNaturalGiftInfo
	cmp r0, #0
	beq _0232D7C8
	str r4, [sp]
	ldrb r3, [r0, #2]
	add r2, sp, #0xc
	mov r1, r6
	str r3, [sp, #4]
	ldrsh r4, [r0, #4]
	mov r0, r7
	mov r3, #0x100
	str r4, [sp, #8]
	bl DealDamageWithTypeAndPowerBoost
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _0232D7F0
_0232D7C8:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0x100
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0232D7F0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end DoMoveNaturalGift

	arm_func_start DoMoveGyroBall
DoMoveGyroBall: ; 0x0232D7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr ip, [r8, #0xb4]
	mov r7, r1
#ifdef JAPAN
	ldr ip, [ip, #0x10c]
#else
	ldr ip, [ip, #0x110]
#endif
	mov r6, r2
	cmp ip, #0
	mov r5, r3
	movne r4, #1
	bne _0232D830
	ldr r2, _0232D85C ; =0x00000F0D
	mov r4, #2
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D830:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r4, lsl #8
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_0232D85C: .word 0x00000C4F
#else
_0232D85C: .word 0x00000F0D
#endif
	arm_func_end DoMoveGyroBall

	arm_func_start DoMoveShadowForce
DoMoveShadowForce: ; 0x0232D860
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _0232D8CC
	ldr r1, _0232D8F4 ; =SHADOW_FORCE_DAMAGE_MULTIPLIER
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	moveq r4, #0
	mov r0, r7
	bl EndTwoTurnMove
	tst r4, #0xff
	beq _0232D8EC
	mov r0, r7
	mov r1, r6
	bl EndProtectStatus
	b _0232D8EC
_0232D8CC:
	ldr r0, _0232D8F8 ; =0x00000CD7
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, #0xd
	bl BeginChargedMove
_0232D8EC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D8F4: .word SHADOW_FORCE_DAMAGE_MULTIPLIER
#ifdef JAPAN
_0232D8F8: .word 0x00000A17
#else
_0232D8F8: .word 0x00000CD7
#endif
	arm_func_end DoMoveShadowForce

	arm_func_start DoMoveGravity
DoMoveGravity: ; 0x0232D8FC
	stmdb sp!, {r3, lr}
	bl TryActivateGravity
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveGravity

	arm_func_start DoMoveStealthRock
DoMoveStealthRock: ; 0x0232D90C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x14
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r6, #4
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	beq _0232D95C
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x14
#endif
	mov r3, #0
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232D96C
_0232D95C:
	ldr r2, _0232D978 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D96C:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232D978: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D978: .word 0x00000EEF
#endif
	arm_func_end DoMoveStealthRock

	arm_func_start DoMoveChargeBeam
DoMoveChargeBeam: ; 0x0232D97C
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D9DC ; =CHARGE_BEAM_BOOST_SPECIAL_ATTACK_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D9D4
	ldr r1, _0232D9E0 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r5
	mov r3, #1
	bl BoostOffensiveStat
_0232D9D4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D9DC: .word CHARGE_BEAM_BOOST_SPECIAL_ATTACK_CHANCE
_0232D9E0: .word SPATK_STAT_IDX
	arm_func_end DoMoveChargeBeam

	arm_func_start DoMoveDamageEatItem
DoMoveDamageEatItem: ; 0x0232D9E4
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
#ifdef EUROPE
	mov r0, r5
	bl ov29_022E34A8_EU
#else
#ifndef JAPAN
	ldr r0, _0232DACC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0232DAC4
#endif
	cmp r5, #0
	moveq r0, #0
	beq _0232DA3C
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0232DA3C:
#endif
	cmp r0, #0
	beq _0232DAC4
	cmp r5, r4
	beq _0232DA8C
	cmp r5, #0
	moveq r0, #0
	beq _0232DA6C
	ldr r0, [r5]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_0232DA6C:
	cmp r0, #0
	beq _0232DA8C
	mov r0, r5
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0232DA98
_0232DA8C:
	mov r0, r4
	mov r1, #0x2c
	bl AbilityIsActiveVeneer
_0232DA98:
	cmp r0, #0
	bne _0232DAC4
	ldr r1, [r5, #0xb4]
	ldrb r0, [r1, #0xd8]
	cmp r0, #6
	ldrneb r0, [r1, #0xf3]
	cmpne r0, #1
	beq _0232DAC4
	mov r0, r5
	mov r1, r4
	bl TryEatItem
_0232DAC4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(NORTH_AMERICA)
_0232DACC: .word DUNGEON_PTR
#endif
	arm_func_end DoMoveDamageEatItem

	arm_func_start DoMoveAcupressure
DoMoveAcupressure: ; 0x0232DAD0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r1
	ldr ip, [r4, #0xb4]
	ldr r1, _0232DC44 ; =ov29_02352B3C
	mov r5, r0
	add lr, sp, #0
	ldmia r1, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	ldrsh r1, [ip, #0x24]
	mov r0, #0
	cmp r1, #0x14
	strlt r0, [sp]
	ldrsh r1, [ip, #0x26]
	addlt r0, r0, #1
	cmp r1, #0x14
	addlt r1, sp, #0
	movlt r2, #1
	strlt r2, [r1, r0, lsl #2]
	ldrsh r1, [ip, #0x28]
	addlt r0, r0, #1
	cmp r1, #0x14
	addlt r1, sp, #0
	movlt r2, #2
	strlt r2, [r1, r0, lsl #2]
	ldrsh r1, [ip, #0x2a]
	addlt r0, r0, #1
	cmp r1, #0x14
	addlt r1, sp, #0
	movlt r2, #3
	strlt r2, [r1, r0, lsl #2]
	addlt r0, r0, #1
	cmp r0, #0
	bne _0232DB7C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	mov r0, r5
	mov r1, r4
	mov r2, #0xc50
#else
	ldr r2, _0232DC48 ; =0x00000F0E
	mov r0, r5
	mov r1, r4
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232DC38
_0232DB7C:
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
	cmp r0, #0
	bne _0232DBAC
	ldr r1, _0232DC4C ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	b _0232DC38
_0232DBAC:
	cmp r0, #2
	bne _0232DBD0
	ldr r1, _0232DC4C ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostDefensiveStat
	b _0232DC38
_0232DBD0:
	cmp r0, #1
	bne _0232DBF4
	ldr r1, _0232DC50 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	b _0232DC38
_0232DBF4:
	cmp r0, #3
	bne _0232DC18
	ldr r1, _0232DC50 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostDefensiveStat
	b _0232DC38
_0232DC18:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	mov r0, r5
	mov r1, r4
	mov r2, #0xc50
#else
	ldr r2, _0232DC48 ; =0x00000F0E
	mov r0, r5
	mov r1, r4
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DC38:
	mov r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232DC44: .word ov29_02352B3C
#ifndef JAPAN
_0232DC48: .word 0x00000F0E
#endif
_0232DC4C: .word ATK_STAT_IDX
_0232DC50: .word SPATK_STAT_IDX
	arm_func_end DoMoveAcupressure

	arm_func_start DoMoveMagnetRise
DoMoveMagnetRise: ; 0x0232DC54
	stmdb sp!, {r3, lr}
	bl TryInflictMagnetRiseStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveMagnetRise

	arm_func_start DoMoveToxicSpikes
DoMoveToxicSpikes: ; 0x0232DC64
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x15
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r6, #4
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	beq _0232DCB4
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x15
#endif
	mov r3, #1
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232DCC4
_0232DCB4:
	ldr r2, _0232DCD0 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DCC4:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232DCD0: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232DCD0: .word 0x00000EEF
#endif
	arm_func_end DoMoveToxicSpikes

	arm_func_start DoMoveLastResort
DoMoveLastResort: ; 0x0232DCD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl CountMovesOutOfPp
	cmp r0, #0
	ble _0232DD10
	ldrb r1, [r6, #6]
	cmp r1, #0
	subeq r0, r0, #1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
_0232DD10:
	cmp r0, #0
	ble _0232DD44
	ldr r1, _0232DD70 ; =LAST_RESORT_DAMAGE_MULT_TABLE
	sub r0, r0, #1
	ldr r3, [r1, r0, lsl #2]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
#ifdef JAPAN
	moveq r4, #1
#else
	movgt r4, #1
#endif
	b _0232DD64
_0232DD44:
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232DD74 ; =0x00000EBC
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DD64:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232DD70: .word LAST_RESORT_DAMAGE_MULT_TABLE
#ifdef JAPAN
_0232DD74: .word 0x00000BFE
#else
_0232DD74: .word 0x00000EBC
#endif
	arm_func_end DoMoveLastResort

	arm_func_start DoMoveTrickRoom
DoMoveTrickRoom: ; 0x0232DD78
	stmdb sp!, {r3, lr}
	bl BoostOrLowerSpeed
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveTrickRoom

	arm_func_start DoMoveDamage__0232DD88
DoMoveDamage__0232DD88: ; 0x0232DD88
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDamage__0232DD88

	arm_func_start DoMoveWorrySeed
DoMoveWorrySeed: ; 0x0232DDAC
	stmdb sp!, {r4, r5, r6, lr}
#ifndef JAPAN
	mov r4, #1
	mov r3, r4
#endif
	mov r2, #0x2a
	mov r6, r0
	mov r5, r1
#ifdef JAPAN
	mov r4, #1
#endif
	bl DefenderAbilityIsActiveMoveEffects__0232DE20
	cmp r0, #0
	beq _0232DE00
	mov r4, #0
	mov r0, r4
	mov r1, r5
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, #0x2a
	bl SetPreprocessorArgsIdVal
	ldr r2, _0232DE1C ; =0x00000F13
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DE00:
	cmp r4, #0
	beq _0232DE14
	mov r0, r6
	mov r1, r5
	bl TryInflictSleeplessStatus
_0232DE14:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232DE1C: .word 0x00000C55
#else
_0232DE1C: .word 0x00000F13
#endif
	arm_func_end DoMoveWorrySeed

	arm_func_start DefenderAbilityIsActiveMoveEffects__0232DE20
DefenderAbilityIsActiveMoveEffects__0232DE20: ; 0x0232DE20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _0232DE74
	cmp r0, #0
	moveq r1, #0
	beq _0232DE54
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_0232DE54:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _0232DE74
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0232DE74:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActiveMoveEffects__0232DE20

	arm_func_start DoMoveDamageHpDependent
DoMoveDamageHpDependent: ; 0x0232DE84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [r1, #0xb4]
	ldr r6, _0232DF30 ; =0x000003E7
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
	ble _0232DF08
	ldr r4, _0232DF30 ; =0x000003E7
	cmp lr, r4
	movle r4, lr
	mov r5, r4, lsl #1
	mov r4, r5, asr #1
	add r4, r5, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #1
	ble _0232DF08
	ldr r4, _0232DF30 ; =0x000003E7
	cmp lr, r4
	movgt lr, r4
	add r4, lr, lr, lsl #1
	mov lr, r4, asr #1
	add lr, r4, lr, lsr #30
	cmp ip, lr, asr #2
	movle r5, #2
	movgt r5, #3
_0232DF08:
	ldr r4, _0232DF34 ; =WRING_OUT_DAMAGE_MULT_TABLE
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
_0232DF30: .word 0x000003E7
_0232DF34: .word WRING_OUT_DAMAGE_MULT_TABLE
	arm_func_end DoMoveDamageHpDependent

	arm_func_start DoMoveHeartSwap
DoMoveHeartSwap: ; 0x0232DF38
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl SwapOffensiveStages
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapOffensiveMultipliers
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapDefensiveStages
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapDefensiveMultipliers
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapHitChanceStages
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232DFC4 ; =0x00000F2F
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232DFC4: .word 0x00002496
#else
_0232DFC4: .word 0x00000F2F
#endif
	arm_func_end DoMoveHeartSwap

	arm_func_start DoMoveRoost
DoMoveRoost: ; 0x0232DFC8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r6, r1
	ldr r4, [r5, #0xb4]
	bl GetApparentWeather
	mov r3, #1
	str r3, [sp]
	ldr r1, _0232E07C ; =ROOST_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r6
	mov r3, #0
	bl TryIncreaseHp
	ldrb r0, [r4, #0x5e]
	mov ip, #0
	mov r1, ip
	strb r0, [r4, #0xaa]
	ldrb r0, [r4, #0x5f]
	strb r0, [r4, #0xab]
	mov r0, #1
_0232E020:
	add r3, r4, ip
	ldrb r2, [r3, #0x5e]
	add ip, ip, #1
	cmp r2, #0xa
	streqb r1, [r3, #0x5e]
	streqb r0, [r4, #0xa9]
	cmp ip, #2
	blt _0232E020
	ldrb r0, [r4, #0xa9]
	cmp r0, #0
	mov r0, #0
	streqb r0, [r4, #0xaa]
	streqb r0, [r4, #0xab]
	beq _0232E070
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0232E080 ; =0x00000CC9
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_0232E070:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232E07C: .word ROOST_HP_RESTORATION_TABLE
#ifdef JAPAN
_0232E080: .word 0x00000A09
#else
_0232E080: .word 0x00000CC9
#endif
	arm_func_end DoMoveRoost

	arm_func_start DoMovePowerSwap
DoMovePowerSwap: ; 0x0232E084
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl SwapOffensiveStages
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapOffensiveMultipliers
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232E0E0 ; =0x00000F2B
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232E0E0: .word 0x00002492
#else
_0232E0E0: .word 0x00000F2B
#endif
	arm_func_end DoMovePowerSwap

	arm_func_start DoMovePowerTrick
DoMovePowerTrick: ; 0x0232E0E4
	stmdb sp!, {r3, lr}
	mov r2, #1
	bl SwapUserAtkAndDefModifiers
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePowerTrick

	arm_func_start DoMoveFeint
DoMoveFeint: ; 0x0232E0F8
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl EndProtectStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveFeint

	arm_func_start DoMoveFlareBlitz
DoMoveFlareBlitz: ; 0x0232E130
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r7, r1
	mov r4, r2
	mov r6, r3
	bl EndFrozenStatus
	mov r0, r5
	mov r1, r7
	mov r2, r4
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232E240
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E1B4
	ldr r1, _0232E248 ; =FLARE_BLITZ_BURN_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r7
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232E1B4
	mov r2, #0
	mov r0, r5
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_0232E1B4:
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E23C
	mov r0, r5
	mov r1, #7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0232E23C
	ldr r1, [r5, #0xb4]
	ldr r0, _0232E24C ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	ldrh r3, [r4, #4]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	movs r1, r0, asr #3
	mov r2, #0
	str r3, [sp]
	mov r0, #0x23c
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x14
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	moveq r1, #1
	mov r0, r5
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_0232E23C:
	mov r0, #1
_0232E240:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232E248: .word FLARE_BLITZ_BURN_CHANCE
_0232E24C: .word 0x000003E7
	arm_func_end DoMoveFlareBlitz
