	.include "asm/macros.inc"
	.include "overlay_29_0232B44C.inc"

	.text

	arm_func_start DoMoveTransform
DoMoveTransform: ; 0x0232B44C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsFullFloorFixedRoom
	cmp r0, #0
	beq _0232B47C
	ldr r2, _0232B490 ; =0x00000EED
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0232B47C:
	mov r0, r5
	mov r1, r4
	bl TryTransform
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232B490: .word 0x00000C2F
#else
_0232B490: .word 0x00000EED
#endif
	arm_func_end DoMoveTransform

	arm_func_start DoMovePoisonTail
DoMovePoisonTail: ; 0x0232B494
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232B4F0
	ldr r1, _0232B4FC ; =POISON_TAIL_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B4F0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_0232B4F0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232B4FC: .word POISON_TAIL_POISON_CHANCE
	arm_func_end DoMovePoisonTail

	arm_func_start DoMoveBlowback
DoMoveBlowback: ; 0x0232B500
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r2, [r2, #0x4c]
	bl TryBlowAway
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveBlowback

	arm_func_start DoMoveCamouflage
DoMoveCamouflage: ; 0x0232B518
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	bl AllocateTemp1024ByteBufferFromPool
	ldr r0, _0232B5B8 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r0, [r0]
	ldr r3, _0232B5BC ; =ov10_022C6322
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh ip, [r0, #0x30]
#else
	ldrsh ip, [r0, #0xd4]
#endif
	mov r0, r4
	mov r1, #0x25
	smulbb r2, ip, r2
	ldr r7, [r4, #0xb4]
	ldrb r6, [r3, r2]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0232B578
	ldr r2, _0232B5C0 ; =0x00000DC3
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0232B578:
	strb r6, [r7, #0x5e]
	mov r2, #0
	mov r1, r4
	strb r2, [r7, #0x5f]
	mov r0, #1
	strb r0, [r7, #0xff]
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #0
	bl SetPreprocessorArgsIdVal
#ifdef JAPAN
	mov r0, r5
	mov r1, r4
	mov r2, #0xc30
#else
	ldr r2, _0232B5C4 ; =0x00000EEE
	mov r0, r5
	mov r1, r4
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232B5B8: .word DUNGEON_PTR
_0232B5BC: .word ov10_022C6322
#ifdef JAPAN
_0232B5C0: .word 0x00000B03
#else
_0232B5C0: .word 0x00000DC3
_0232B5C4: .word 0x00000EEE
#endif
	arm_func_end DoMoveCamouflage

	arm_func_start DoMoveTailGlow
DoMoveTailGlow: ; 0x0232B5C8
	stmdb sp!, {r3, lr}
	ldr r2, _0232B5E4 ; =SPATK_STAT_IDX
	mov r3, #2
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B5E4: .word SPATK_STAT_IDX
	arm_func_end DoMoveTailGlow

	arm_func_start DoMoveDamageConstrict10
DoMoveDamageConstrict10: ; 0x0232B5E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r2
	ldrh ip, [r5, #4]
	ldr r2, _0232B69C ; =0x00000123
	mov r7, r0
	cmp ip, r2
	mov r6, r1
	mov r4, r3
	mov r8, #0
	cmpne ip, #0x20c
	bne _0232B628
	mov r0, r7
	mov r1, r6
	bl EndFrozenStatus
	mov sb, #0x13c
	b _0232B640
_0232B628:
	cmp ip, #0x45
	moveq sb, #0x75
	beq _0232B640
	cmp ip, #0x7d
	moveq sb, #0x7e
	movne sb, #0xf1
_0232B640:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0x100
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232B694
	ldr r1, _0232B6A0 ; =WHIRLPOOL_CONSTRICTION_CHANCE
	mov r0, r7
	ldrsh r2, [r1]
	mov r1, r6
	mov r8, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B694
	mov r0, r7
	mov r1, r6
	mov r2, sb
	mov r3, #0
	bl TryInflictConstrictionStatus
_0232B694:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0232B69C: .word 0x00000123
_0232B6A0: .word WHIRLPOOL_CONSTRICTION_CHANCE
	arm_func_end DoMoveDamageConstrict10
