	.include "asm/macros.inc"
	.include "overlay_29_0232A148.inc"

	.text

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
