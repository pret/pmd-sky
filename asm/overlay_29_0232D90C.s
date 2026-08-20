	.include "asm/macros.inc"
	.include "overlay_29_0232D90C.inc"

	.text

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
