	.include "asm/macros.inc"
	.include "overlay_29_02326670.inc"

	.text

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
