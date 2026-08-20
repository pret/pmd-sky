	.include "asm/macros.inc"
	.include "overlay_29_02326EB8.inc"

	.text

	arm_func_start DoMoveRazorWind
DoMoveRazorWind: ; 0x02326EB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02326F14
	ldr r1, _02326F40 ; =RAZOR_WIND_DAMAGE_MULTIPLIER
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
	b _02326F38
_02326F14:
	ldr r0, _02326F44 ; =0x00000CCD
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #4
	bl BeginChargedMove
	mov r4, #1
_02326F38:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02326F40: .word RAZOR_WIND_DAMAGE_MULTIPLIER
#ifdef JAPAN
_02326F44: .word 0x00000A0D
#else
_02326F44: .word 0x00000CCD
#endif
	arm_func_end DoMoveRazorWind

	arm_func_start DoMoveBide
DoMoveBide: ; 0x02326F48
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, _02326F88 ; =0x00000CCE
	mov r5, r1
	mov r4, r2
	bl StringFromId
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #1
	bl BeginChargedMove
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02326F88: .word 0x00000A0E
#else
_02326F88: .word 0x00000CCE
#endif
	arm_func_end DoMoveBide

	arm_func_start DoMoveBideUnleash
DoMoveBideUnleash: ; 0x02326F8C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x20
	mov r3, #0
	mov r6, r0
	strb r3, [sp, #0x1c]
	ldr r3, [r6, #0xb4]
	ldr r0, _0232702C ; =0x000003E7
	ldr r3, [r3, #0xb8]
	mov r8, r2
	mov r4, r3, lsl #1
	cmp r0, r3, lsl #1
	movlt r4, r0
	mov r0, r8
	mov r5, r1
	bl GetMoveType
	mov r7, r0
	ldrh r0, [r8, #4]
	bl GetMoveCategory
	add r2, sp, #0x1c
	stmia sp, {r2, r7}
	str r0, [sp, #8]
	ldr r1, _02327030 ; =0x0000023E
	mov ip, #0
	str r1, [sp, #0xc]
	str ip, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	str ip, [sp, #0x18]
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
_0232702C: .word 0x000003E7
_02327030: .word 0x0000023E
	arm_func_end DoMoveBideUnleash

	arm_func_start DoMoveCrunch
DoMoveCrunch: ; 0x02327034
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023270A0
	ldr r1, _023270AC ; =CRUNCH_LOWER_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023270A0
	ldr r0, _023270B0 ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_023270A0:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023270AC: .word CRUNCH_LOWER_DEFENSE_CHANCE
_023270B0: .word ATK_STAT_IDX
	arm_func_end DoMoveCrunch

	arm_func_start DoMoveDamageCringe20
DoMoveDamageCringe20: ; 0x023270B4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327110
	ldr r1, _0232711C ; =BITE_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327110
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02327110:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232711C: .word BITE_CRINGE_CHANCE
	arm_func_end DoMoveDamageCringe20

	arm_func_start DoMoveDamageParalyze20
DoMoveDamageParalyze20: ; 0x02327120
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232717C
	ldr r1, _02327188 ; =THUNDER_PARALYZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232717C
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_0232717C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327188: .word THUNDER_PARALYZE_CHANCE
	arm_func_end DoMoveDamageParalyze20

	arm_func_start DoMoveEndeavor
DoMoveEndeavor: ; 0x0232718C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov sb, r0
	strb r4, [sp, #0x1c]
	mov r8, r1
	ldr r1, [r8, #0xb4]
	ldr r0, [sb, #0xb4]
	ldrsh r1, [r1, #0x10]
	ldrsh r0, [r0, #0x10]
	mov r7, r2
	mov r6, r3
	subs r5, r1, r0
	mov r0, r8
	movmi r5, r4
	bl MirrorMoveIsActive
	cmp r0, #0
	mov r0, r7
	movne r8, sb
	bl GetMoveType
	mov r4, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r6
	mov r6, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	mov r2, r5
	add r5, sp, #0x1c
	str r5, [sp]
	stmib sp, {r4, r6}
	str r0, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	mov r4, #1
	str r4, [sp, #0x14]
	mov r1, r8
	mov r0, sb
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, r4
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveEndeavor

	arm_func_start DoMoveFacade
DoMoveFacade: ; 0x0232724C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov lr, #0x100
	ldrb ip, [ip, #0xbf]
	cmp ip, #0
	ldrne ip, _02327288 ; =FACADE_DAMAGE_MULTIPLIER
	str r3, [sp]
	ldrne lr, [ip]
	mov r3, lr
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02327288: .word FACADE_DAMAGE_MULTIPLIER
	arm_func_end DoMoveFacade

	arm_func_start DoMoveDamageLowerSpeed20
DoMoveDamageLowerSpeed20: ; 0x0232728C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023272E8
	ldr r1, _023272F4 ; =CONSTRICT_LOWER_SPEED_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023272E8
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
_023272E8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023272F4: .word CONSTRICT_LOWER_SPEED_CHANCE
	arm_func_end DoMoveDamageLowerSpeed20

	arm_func_start DoMoveBrickBreak
DoMoveBrickBreak: ; 0x023272F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r5, [r6, #0xb4]
	mov r7, r0
	str r3, [sp]
	mov r3, #0x100
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, r4
	orr r0, r4, r0
	ands r4, r0, #0xff
	beq _0232735C
	ldrb r0, [r5, #0xd5]
	cmp r0, #1
	cmpne r0, #3
	bne _0232735C
	ldr r2, _02327364 ; =0x00000ED2
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl EndReflectClassStatus
_0232735C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02327364: .word 0x00000C14
#else
_02327364: .word 0x00000ED2
#endif
	arm_func_end DoMoveBrickBreak

	arm_func_start DoMoveDamageLowerSpeed100
DoMoveDamageLowerSpeed100: ; 0x02327368
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023273C0
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023273C0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
_023273C0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end DoMoveDamageLowerSpeed100

	arm_func_start DoMoveFocusPunch
DoMoveFocusPunch: ; 0x023273CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02327428
	ldr r1, _02327454 ; =FOCUS_PUNCH_DAMAGE_MULTIPLIER
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
	b _0232744C
_02327428:
#ifdef JAPAN
	mov r0, #0xa10
#else
	mov r0, #0xcd0
#endif
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #5
	bl BeginChargedMove
	mov r4, #1
_0232744C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02327454: .word FOCUS_PUNCH_DAMAGE_MULTIPLIER
	arm_func_end DoMoveFocusPunch

	arm_func_start DoMoveDamageDrain
DoMoveDamageDrain: ; 0x02327458
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r5, r3
	cmp sb, r8
	mov r4, #0
	beq _023274B8
	cmp sb, #0
	moveq r0, r4
	beq _02327498
	ldr r0, [sb]
	cmp r0, #1
	moveq r0, #1
	movne r0, r4
	and r0, r0, #0xff
_02327498:
	cmp r0, #0
	beq _023274B8
	mov r0, sb
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r6, #0
	bne _023274C8
_023274B8:
	mov r0, r8
	mov r1, #0x3a
	bl AbilityIsActiveVeneer
	mov r6, r0
_023274C8:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	movs r5, r0
	movne r4, #1
	cmp r4, #0
	beq _02327590
	mov r0, sb
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _02327590
	ldr r1, [sb, #0xb4]
	add r0, r5, r5, lsr #31
	mov r5, r0, asr #1
#ifdef JAPAN
	ldrb r0, [r1, #0x107]
#else
	ldrb r0, [r1, #0x108]
#endif
	mov r4, #1
	cmp r5, #1
	movlt r5, r4
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r1, #0x107]
#else
	strlob r0, [r1, #0x108]
#endif
	cmp r6, #0
	beq _0232754C
	mov r2, #0xd
	mov r0, sb
	mov r1, r5
	add r3, r2, #0x22c
	bl ApplyDamageAndEffectsWrapper
	b _02327590
_0232754C:
	ldr r1, [sb, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _0232756C
#ifdef JAPAN
	add r0, r1, #0x224
#else
	add r0, r1, #0x228
#endif
	mov r1, #0x57
	bl ExclusiveItemEffectFlagTest
_0232756C:
	cmp r0, #0
	movne r5, r5, lsl #1
	mov r6, #1
	mov r0, sb
	mov r1, sb
	mov r2, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_02327590:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveDamageDrain

	arm_func_start DoMoveReversal
DoMoveReversal: ; 0x02327598
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [r0, #0xb4]
	ldr r6, _02327644 ; =0x000003E7
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
	ble _0232761C
	ldr r4, _02327644 ; =0x000003E7
	cmp lr, r4
	movle r4, lr
	mov r5, r4, lsl #1
	mov r4, r5, asr #1
	add r4, r5, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #1
	ble _0232761C
	ldr r4, _02327644 ; =0x000003E7
	cmp lr, r4
	movgt lr, r4
	add r4, lr, lr, lsl #1
	mov lr, r4, asr #1
	add lr, r4, lr, lsr #30
	cmp ip, lr, asr #2
	movle r5, #2
	movgt r5, #3
_0232761C:
	ldr r4, _02327648 ; =REVERSAL_DAMAGE_MULT_TABLE
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
_02327644: .word 0x000003E7
_02327648: .word REVERSAL_DAMAGE_MULT_TABLE
	arm_func_end DoMoveReversal

	arm_func_start DoMoveSmellingSalt
DoMoveSmellingSalt: ; 0x0232764C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr ip, [r4, #0xb4]
	mov r5, r0
	ldrb ip, [ip, #0xbf]
	cmp ip, #4
	str r3, [sp]
	bne _02327694
	mov r3, #0x200
	bl DealDamage
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r1, r4
	mov r0, r5
	and r4, r2, #0xff
	bl EndBurnClassStatus
	b _023276AC
_02327694:
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r4, r0, #0xff
_023276AC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveSmellingSalt
