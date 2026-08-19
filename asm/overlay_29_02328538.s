	.include "asm/macros.inc"
	.include "overlay_29_02328538.inc"

	.text

	arm_func_start DoMoveAbsorb
DoMoveAbsorb: ; 0x02328538
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r2
#ifndef JAPAN
	mov r6, r3
#endif
	mov r7, r0
	mov sb, r1
	mov r2, #0x3a
#ifdef JAPAN
	mov r6, r3
#else
	mov r3, #1
#endif
	mov r4, #0
	bl DefenderAbilityIsActiveMoveEffects__02328634
	mov r5, r0
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232862C
	add r0, r0, r0, lsr #31
	mov r6, r0, asr #1
	cmp r6, #1
	mov r0, r7
	movlt r6, #1
	bl EntityIsValidMoveEffects__0232800C
	cmp r0, #0
	beq _0232862C
	ldr r1, [r7, #0xb4]
	mov r4, #1
#ifdef JAPAN
	ldrb r0, [r1, #0x107]
	cmp r0, #1
	strlob r4, [r1, #0x107]
#else
	ldrb r0, [r1, #0x108]
	cmp r0, #1
	strlob r4, [r1, #0x108]
#endif
	mov r0, r7
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232862C
	ldr r1, [r7, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _023285E8
#ifdef JAPAN
	add r0, r1, #0x224
#else
	add r0, r1, #0x228
#endif
	mov r1, #0x57
	bl ExclusiveItemEffectFlagTest
_023285E8:
	cmp r0, #0
	movne r6, r6, lsl #1
	cmp r5, #0
	beq _02328610
	mov r2, #0xd
	mov r0, r7
	mov r1, r6
	add r3, r2, #0x22c
	bl ApplyDamageAndEffectsWrapper
	b _0232862C
_02328610:
	mov r5, #1
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, #0
	str r5, [sp]
	bl TryIncreaseHp
_0232862C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveAbsorb

	arm_func_start DefenderAbilityIsActiveMoveEffects__02328634
DefenderAbilityIsActiveMoveEffects__02328634: ; 0x02328634
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02328688
	cmp r0, #0
	moveq r1, #0
	beq _02328668
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02328668:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _02328688
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02328688:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActiveMoveEffects__02328634

	arm_func_start DoMoveSkillSwap
DoMoveSkillSwap: ; 0x02328698
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r7, r0
	mov r1, #0x35
	ldr r4, [r7, #0xb4]
	ldr r5, [r6, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _023286D0
	mov r0, r6
	mov r1, #0x35
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023286E8
_023286D0:
	ldr r2, _02328784 ; =0x00000ED5
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_023286E8:
	mov r0, r7
	mov r1, #0x74
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02328714
	ldr r2, _02328788 ; =0x00000ED6
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02328714:
	ldrb r8, [r5, #0x60]
	ldrb lr, [r5, #0x61]
	ldrb r0, [r4, #0x60]
	ldr r1, _0232878C ; =DUNGEON_PTR
	mov ip, #1
	strb r0, [r5, #0x60]
	ldrb r3, [r4, #0x61]
	ldr r2, _02328790 ; =0x00000ED4
	mov r0, r7
	strb r3, [r5, #0x61]
	strb r8, [r4, #0x60]
	strb lr, [r4, #0x61]
	ldr r3, [r1]
	mov r1, r6
	strb ip, [r3, #0xe]
	bl LogMessageByIdWithPopupCheckUserTarget
#ifdef JAPAN
	ldrb r0, [r4, #0x107]
#else
	ldrb r0, [r4, #0x108]
#endif
	mov r1, r7
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r4, #0x107]
#else
	strlob r0, [r4, #0x108]
#endif
	mov r0, r7
	bl TryEndStatusWithAbility
	mov r0, r7
	mov r1, r6
	bl TryEndStatusWithAbility
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define DO_MOVE_SKILL_SWAP_OFFSET -0x2BE
#else
#define DO_MOVE_SKILL_SWAP_OFFSET 0
#endif
_02328784: .word 0x00000ED5 + DO_MOVE_SKILL_SWAP_OFFSET
_02328788: .word 0x00000ED6 + DO_MOVE_SKILL_SWAP_OFFSET
_0232878C: .word DUNGEON_PTR
_02328790: .word 0x00000ED4 + DO_MOVE_SKILL_SWAP_OFFSET
	arm_func_end DoMoveSkillSwap

	arm_func_start DoMoveSketch
DoMoveSketch: ; 0x02328794
#ifdef JAPAN
#define DO_MOVE_SKETCH_OFFSET -4
#else
#define DO_MOVE_SKETCH_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, #0
	mov sb, r1
	str r4, [sp]
	ldr r6, [sb, #0xb4]
	mov sl, r0
	add r0, r6, #0x124 + DO_MOVE_SKETCH_OFFSET
	mov r8, r2
	mov fp, r4
	mov r7, r4
	ldr r5, [sl, #0xb4]
	str r0, [sp, #4]
	b _02328820
_023287CC:
	add r0, r6, r7, lsl #3
	ldrb r0, [r0, #0x124 + DO_MOVE_SKETCH_OFFSET]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0232881C
	ldr r1, [sp, #4]
	add r0, r5, #0x124 + DO_MOVE_SKETCH_OFFSET
	add r1, r1, r7, lsl #3
	bl IsSameMove
	cmp r0, #0
	bne _0232881C
	add r1, r6, r7, lsl #3
	ldrb r0, [r1, #0x124 + DO_MOVE_SKETCH_OFFSET]
	tst r0, #0x10
	addne r0, r1, #0x100
	ldrneh fp, [r0, #0x28 + DO_MOVE_SKETCH_OFFSET]
	movne r4, #1
	bne _02328828
_0232881C:
	add r7, r7, #1
_02328820:
	cmp r7, #4
	blt _023287CC
_02328828:
	cmp r4, #0
	bne _02328848
	ldr r2, _023288BC ; =0x00000DB8
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _023288B4
_02328848:
	cmp fp, #0
	bne _02328864
	ldr r2, _023288BC ; =0x00000DB8
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023288B0
_02328864:
	mov r0, r8
	mov r1, fp
	bl InitMove
	ldrh r1, [r8, #4]
	mov r0, #0
	bl SetPreprocessorArgsIdVal
	ldrh r1, [r8, #2]
	ldr r2, _023288C0 ; =0x00000DB7
	mov r0, sl
	orr r3, r1, #0x24
	mov r1, sb
	strh r3, [r8, #2]
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
	str r0, [sp]
_023288B0:
	ldr r0, [sp]
_023288B4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_023288BC: .word 0x00000AF8
_023288C0: .word 0x00000AF7
#else
_023288BC: .word 0x00000DB8
_023288C0: .word 0x00000DB7
#endif
	arm_func_end DoMoveSketch

	arm_func_start DoMoveHeadbutt
DoMoveHeadbutt: ; 0x023288C4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328920
	ldr r1, _0232892C ; =HEADBUTT_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328920
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02328920:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232892C: .word HEADBUTT_CRINGE_CHANCE
	arm_func_end DoMoveHeadbutt

	arm_func_start DoMoveDoubleEdge
DoMoveDoubleEdge: ; 0x02328930
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r2
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023289E8
	mov r0, r6
	mov r1, #7
	mov r4, #1
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _023289E8
	mov r0, r6
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023289E8
	ldr r1, [r6, #0xb4]
	ldr r0, _023289F4 ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	ldrh r3, [r5, #4]
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
	mov r0, r6
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_023289E8:
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023289F4: .word 0x000003E7
	arm_func_end DoMoveDoubleEdge

	arm_func_start DoMoveSandstorm
DoMoveSandstorm: ; 0x023289F8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02328A48 ; =WEATHER_MOVE_TURN_COUNT
	ldr r2, _02328A4C ; =DUNGEON_PTR
	ldrsh r3, [r3]
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
#ifdef JAPAN
	add r2, r2, #0xcc00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x9a]
#else
	add r2, r2, #0xcd00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x3e]
#endif
	bl TryActivateWeather
	cmp r0, #0
	bne _02328A40
	ldr r2, _02328A50 ; =0x00000EC6
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02328A40:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02328A48: .word WEATHER_MOVE_TURN_COUNT
_02328A4C: .word DUNGEON_PTR
#ifdef JAPAN
_02328A50: .word 0x00000C08
#else
_02328A50: .word 0x00000EC6
#endif
	arm_func_end DoMoveSandstorm

	arm_func_start DoMoveLowerAccuracy1
DoMoveLowerAccuracy1: ; 0x02328A54
	stmdb sp!, {r3, lr}
	ldr r2, _02328A70 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl LowerHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02328A70: .word ATK_STAT_IDX
	arm_func_end DoMoveLowerAccuracy1

	arm_func_start DoMoveDamagePoison40
DoMoveDamagePoison40: ; 0x02328A74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328AD0
	ldr r1, _02328ADC ; =SMOG_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328AD0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_02328AD0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328ADC: .word SMOG_POISON_CHANCE
	arm_func_end DoMoveDamagePoison40

	arm_func_start DoMoveGrowth
DoMoveGrowth: ; 0x02328AE0
	stmdb sp!, {r3, lr}
	ldr r2, _02328AFC ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02328AFC: .word SPATK_STAT_IDX
	arm_func_end DoMoveGrowth

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

	arm_func_start DoMoveMinimize
DoMoveMinimize: ; 0x0232923C
	stmdb sp!, {r3, lr}
	ldr r2, _02329254 ; =SPATK_STAT_IDX
	ldr r2, [r2]
	bl BoostHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02329254: .word SPATK_STAT_IDX
	arm_func_end DoMoveMinimize

	arm_func_start DoMoveSeismicToss
DoMoveSeismicToss: ; 0x02329258
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov r6, r0
	strb r4, [sp, #0x1c]
	mov r5, r1
	ldr r1, [r6, #0xb4]
	mov r0, r5
	mov r4, r2
	mov sl, r3
	ldr r7, [r5, #0xb4]
	ldrb sb, [r1, #0xa]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02329350
	ldrb r2, [r7, #0x4c]
	mov r0, r5
	mov r1, #0xc
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #29
	add r2, r3, r2, ror #29
	bl ChangeMonsterAnimation
	mov r0, r5
	mov r1, #1
	bl SetTwoTurnInvincibility
	ldr r1, _023293C8 ; =0x00000221
	mov r0, r5
	bl PlaySeByIdIfShouldDisplayEntity
	mov r0, r5
	bl WaitUntilMonsterFliesOffscreen
	mov r0, #0x10
	mov r1, #0x67
	bl ov29_022EA370
	mov r0, r5
	mov r1, #0
	bl SetTwoTurnInvincibility
	ldrb r2, [r7, #0x4c]
	mov r0, r5
	mov r1, #0xc
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #29
	add r2, r3, r2, ror #29
	bl ChangeMonsterAnimation
	mov r0, r5
	bl WaitUntilMonsterIsBackOnGround
	mov r0, r5
	mov r1, #0x210
	bl PlaySeByIdIfShouldDisplayEntity
	mov r0, #5
	mov r1, #0x2000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl WaitUntilFadeIsFinished
	mov r0, #4
	mov r1, #0x400
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #1
	bl ov29_022ECAFC
	mov r0, #0
	bl WaitUntilFadeIsFinished
_02329350:
	mov r0, r4
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r7, r0
	mov r1, sl
	mov r0, r4
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r8}
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	mov r4, #0
	str r4, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r5
	mov r2, sb
	mov r0, r6
	str r4, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023293C8: .word 0x00000221
	arm_func_end DoMoveSeismicToss

	arm_func_start DoMoveConfuse
DoMoveConfuse: ; 0x023293CC
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictConfusedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveConfuse
