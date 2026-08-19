	.include "asm/macros.inc"
	.include "overlay_29_0232A058.inc"

	.text

	arm_func_start DoMoveAmnesia
DoMoveAmnesia: ; 0x0232A058
	stmdb sp!, {r3, lr}
	ldr r2, _0232A074 ; =SPATK_STAT_IDX
	mov r3, #2
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A074: .word SPATK_STAT_IDX
	arm_func_end DoMoveAmnesia

	arm_func_start DoMoveNightShade
DoMoveNightShade: ; 0x0232A078
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r4, #0
	strb r4, [sp, #0x1c]
	mov r6, r0
	mov r4, r2
	ldr r2, [r6, #0xb4]
	mov r0, r4
	mov r5, r1
	mov r7, r3
	ldrb sb, [r2, #0xa]
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r1, r7
	mov r7, r0
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
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveNightShade

	arm_func_start DoMoveGrowl
DoMoveGrowl: ; 0x0232A118
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0232A144 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	str r3, [sp]
	str r3, [sp, #4]
	bl LowerOffensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A144: .word ATK_STAT_IDX
	arm_func_end DoMoveGrowl

	arm_func_start DoMoveSurf
DoMoveSurf: ; 0x0232A148
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [r1, #0xb4]
	mov r4, #0
	ldrb ip, [ip, #0xd2]
	cmp ip, #9
	moveq ip, #0x200
	movne ip, #0x100
	str r3, [sp]
	mov r3, ip
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end DoMoveSurf

	arm_func_start DoMoveRolePlay
DoMoveRolePlay: ; 0x0232A188
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r2, #0x35
#ifndef JAPAN
	mov r3, #1
#endif
	ldr r4, [r6, #0xb4]
	ldr r7, [r5, #0xb4]
	bl DefenderAbilityIsActiveMoveEffects__02329F14
	cmp r0, #0
	beq _0232A1C8
	ldr r2, _0232A218 ; =0x00000EE1
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232A1C8:
	ldrb r2, [r7, #0x60]
	ldr r0, _0232A21C ; =DUNGEON_PTR
	mov r1, #1
	strb r2, [r4, #0x60]
	ldrb r2, [r7, #0x61]
	strb r2, [r4, #0x61]
	ldr r0, [r0]
#ifdef JAPAN
	ldr r2, _0232B68C ; =0x00000C22
	strb r1, [r0, #0xe]
	ldrb r0, [r4, #0x107]
	cmp r0, #1
	strlob r1, [r4, #0x107]
#else
	mov r2, #0xee0
	strb r1, [r0, #0xe]
	ldrb r0, [r4, #0x108]
	cmp r0, #1
	strlob r1, [r4, #0x108]
#endif
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r6
	bl TryEndStatusWithAbility
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_0232A218: .word 0x00000C23
_0232A21C: .word DUNGEON_PTR
_0232B68C: .word 0x00000C22
#else
_0232A218: .word 0x00000EE1
_0232A21C: .word DUNGEON_PTR
#endif
	arm_func_end DoMoveRolePlay

	arm_func_start DoMoveSunnyDay
DoMoveSunnyDay: ; 0x0232A220
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0232A270 ; =WEATHER_MOVE_TURN_COUNT
	ldr r2, _0232A274 ; =DUNGEON_PTR
	ldrsh r3, [r3]
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
#ifdef JAPAN
	add r2, r2, #0xcc00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x98]
#else
	add r2, r2, #0xcd00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x3c]
#endif
	bl TryActivateWeather
	cmp r0, #0
	bne _0232A268
	ldr r2, _0232A278 ; =0x00000EC7
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_0232A268:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A270: .word WEATHER_MOVE_TURN_COUNT
_0232A274: .word DUNGEON_PTR
#ifdef JAPAN
_0232A278: .word 0x00000C09
#else
_0232A278: .word 0x00000EC7
#endif
	arm_func_end DoMoveSunnyDay

	arm_func_start DoMoveLowerDefense1
DoMoveLowerDefense1: ; 0x0232A27C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _0232A2A8 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	str r3, [sp]
	str r3, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232A2A8: .word ATK_STAT_IDX
	arm_func_end DoMoveLowerDefense1
