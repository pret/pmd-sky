	.include "asm/macros.inc"
	.include "overlay_29_0232DDAC.inc"

	.text

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
