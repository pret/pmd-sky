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
