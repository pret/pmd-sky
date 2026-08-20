	.include "asm/macros.inc"
	.include "overlay_29_0232BF88.inc"

	.text

	arm_func_start DoMoveDragonRage
DoMoveDragonRage: ; 0x0232BF88
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
	ldr r2, _0232C024 ; =DRAGON_RAGE_FIXED_DAMAGE
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
_0232C024: .word DRAGON_RAGE_FIXED_DAMAGE
	arm_func_end DoMoveDragonRage

	arm_func_start DoMoveDragonDance
DoMoveDragonDance: ; 0x0232C028
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0232C060 ; =ATK_STAT_IDX
	mov r5, r0
	ldr r2, [r2]
	mov r4, r1
	mov r3, #1
	bl BoostOffensiveStat
	mov r0, r5
	mov r1, r4
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232C060: .word ATK_STAT_IDX
	arm_func_end DoMoveDragonDance

	arm_func_start DoMoveSkullBash
DoMoveSkullBash: ; 0x0232C064
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _0232C0C0
	ldr r1, _0232C0EC ; =SKULL_BASH_DAMAGE_MULTIPLIER
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
	b _0232C0E4
_0232C0C0:
	ldr r0, _0232C0F0 ; =0x00000CEB
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, #6
	bl BeginChargedMove
	mov r4, #1
_0232C0E4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232C0EC: .word SKULL_BASH_DAMAGE_MULTIPLIER
#ifdef JAPAN
_0232C0F0: .word 0x00000A2B
#else
_0232C0F0: .word 0x00000CEB
#endif
	arm_func_end DoMoveSkullBash

	arm_func_start DoMoveDamageLowerSpecialDefense50
DoMoveDamageLowerSpecialDefense50: ; 0x0232C0F4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r2
	ldrh ip, [r8, #4]
	ldr r2, _0232C198 ; =0x0000014F
	mov r5, r0
	mov r4, r1
	mov r7, r3
	cmp ip, r2
	mov r6, #0
	bne _0232C128
	mov r0, #1
	bl AnimationDelayOrSomething
_0232C128:
	mov r0, r5
	mov r1, r4
	mov r2, r8
	mov r3, #0x100
	str r7, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232C18C
	ldr r1, _0232C19C ; =LUSTER_PURGE_LOWER_SPECIAL_DEFENSE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	mov r6, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232C18C
	ldr r0, _0232C1A0 ; =SPATK_STAT_IDX
	mov r3, r6
	ldr r2, [r0]
	mov r1, r4
	mov r0, r5
	str r3, [sp]
	mov r4, #0
	str r4, [sp, #4]
	bl LowerDefensiveStat
_0232C18C:
	mov r0, r6
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232C198: .word 0x0000014F
_0232C19C: .word LUSTER_PURGE_LOWER_SPECIAL_DEFENSE_CHANCE
_0232C1A0: .word SPATK_STAT_IDX
	arm_func_end DoMoveDamageLowerSpecialDefense50

	arm_func_start DoMoveStruggle
DoMoveStruggle: ; 0x0232C1A4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	str r3, [sp]
	mov r3, #0x100
	mov r7, r0
	mov r6, r2
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232C26C
	mov r1, r4
	mov r0, r7
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232C26C
	ldr r1, [r7, #0xb4]
	ldr r0, _0232C278 ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r5, r0, asr #2
	ldr r0, [r7, #0xb4]
	cmp r5, #1
	ldrsh r0, [r0, #0x10]
	movlt r5, #1
	cmp r0, #0
	moveq r0, #1
	beq _0232C270
	ldrh r0, [r6, #4]
	bl GetMoveCategory
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x23c
	str r0, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, r7
	mov r1, r7
	mov r2, r5
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
_0232C26C:
	mov r0, r4
_0232C270:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0232C278: .word 0x000003E7
	arm_func_end DoMoveStruggle

	arm_func_start DoMoveRockSmash
DoMoveRockSmash: ; 0x0232C27C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	mov r4, #0
	bl ov29_022F8FF8
	cmp r0, #0
	beq _0232C2B4
	ldr r2, _0232C2F4 ; =0x00000EF5
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232C2E8
_0232C2B4:
	add r0, sp, #0
	bl TrySmashWall
	movs r4, r0
	beq _0232C2D8
	ldr r2, _0232C2F8 ; =0x00000EF6
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232C2E8
_0232C2D8:
	ldr r2, _0232C2FC ; =0x00000EF7
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232C2E8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232C2F4: .word 0x00000C37
_0232C2F8: .word 0x00000C38
_0232C2FC: .word 0x00000C39
#else
_0232C2F4: .word 0x00000EF5
_0232C2F8: .word 0x00000EF6
_0232C2FC: .word 0x00000EF7
#endif
	arm_func_end DoMoveRockSmash
