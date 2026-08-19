	.include "asm/macros.inc"
	.include "overlay_29_02326568.inc"

	.text

	arm_func_start DoMoveSwagger
DoMoveSwagger: ; 0x02326568
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	mov r3, #0
	mov r5, r0
	mov r4, r1
	bl TryInflictConfusedStatus
	ldr r1, _023265A0 ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023265A0: .word ATK_STAT_IDX
	arm_func_end DoMoveSwagger

	arm_func_start DoMoveSnore
DoMoveSnore: ; 0x023265A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02326624
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326634
	ldr r1, _02326640 ; =SNORE_CRINGE_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326634
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictCringeStatus
	b _02326634
_02326624:
	ldr r2, _02326644 ; =0x00000ECD
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02326634:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326640: .word SNORE_CRINGE_CHANCE
#ifdef JAPAN
_02326644: .word 0x00000C0F
#else
_02326644: .word 0x00000ECD
#endif
	arm_func_end DoMoveSnore

	arm_func_start DoMoveScreech
DoMoveScreech: ; 0x02326648
	stmdb sp!, {r3, lr}
	ldr r2, _0232666C ; =ATK_STAT_IDX
	mov ip, #1
	ldr r2, [r2]
	mov r3, #0x40
	str ip, [sp]
	bl ApplyDefensiveStatMultiplier
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232666C: .word ATK_STAT_IDX
	arm_func_end DoMoveScreech

	arm_func_start DoMoveDamageCringe30
DoMoveDamageCringe30: ; 0x02326670
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023266CC
	ldr r1, _023266D8 ; =ROCK_SLIDE_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023266CC
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_023266CC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023266D8: .word ROCK_SLIDE_CRINGE_CHANCE
	arm_func_end DoMoveDamageCringe30

	arm_func_start DoMoveWeatherBall
DoMoveWeatherBall: ; 0x023266DC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetApparentWeather
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl EndFrozenStatus
	ldr ip, _02326748 ; =WEATHER_BALL_DAMAGE_MULT_TABLE
	ldr r2, _0232674C ; =WEATHER_BALL_TYPE_TABLE
	ldr ip, [ip, r4, lsl #2]
	ldrb r2, [r2, r4]
	str ip, [sp]
	mov r0, r8
	mov r1, r7
	mov r3, r6
	str r5, [sp, #4]
	bl DealDamageWithType
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326748: .word WEATHER_BALL_DAMAGE_MULT_TABLE
_0232674C: .word WEATHER_BALL_TYPE_TABLE
	arm_func_end DoMoveWeatherBall

	arm_func_start DoMoveWhirlpool
DoMoveWhirlpool: ; 0x02326750
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r6, r0
	ldrb r0, [r1, #0xd2]
	mov r1, r5
	mov r4, #0
	cmp r0, #9
	moveq ip, #0x200
	movne ip, #0x100
	str r3, [sp]
	mov r0, r6
	mov r3, ip
	bl DealDamage
	cmp r0, #0
	beq _023267C8
	ldr r1, _023267D4 ; =WHIRLPOOL_CONSTRICTION_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023267C8
	mov r0, r6
	mov r1, r5
	mov r2, #0x3b
	mov r3, #0
	bl TryInflictConstrictionStatus
_023267C8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023267D4: .word WHIRLPOOL_CONSTRICTION_CHANCE
	arm_func_end DoMoveWhirlpool

	arm_func_start DoMoveFakeTears
DoMoveFakeTears: ; 0x023267D8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _02326808 ; =SPATK_STAT_IDX
	mov ip, #1
	ldr r2, [r2]
	str ip, [sp]
	mov r3, #2
	str ip, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326808: .word SPATK_STAT_IDX
	arm_func_end DoMoveFakeTears

	arm_func_start DoMoveSpite
DoMoveSpite: ; 0x0232680C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r4, #0
#ifdef JAPAN
	add lr, r1, #0x120
#else
	add lr, r1, #0x124
#endif
	mov ip, #1
	mov r6, r0
	mov r7, r4
	mov r3, r4
	mov r1, r4
	mov r0, ip
_02326838:
	ldrb r2, [lr, r7, lsl #3]
	add r8, lr, r7, lsl #3
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02326864
	ldrb r2, [r8]
	tst r2, #0x10
	movne r4, r0
	strneb r1, [r8, #6]
_02326864:
	add r7, r7, #1
	cmp r7, #4
	blt _02326838
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	cmp r4, #0
	beq _0232689C
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
	mov r2, #0xc10
#else
	ldr r2, _023268B4 ; =0x00000ECE
	mov r0, r6
	mov r1, r5
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023268AC
_0232689C:
	ldr r2, _023268B8 ; =0x00000ECF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023268AC:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_023268B8: .word 0x00000C11
#else
_023268B4: .word 0x00000ECE
_023268B8: .word 0x00000ECF
#endif
	arm_func_end DoMoveSpite
