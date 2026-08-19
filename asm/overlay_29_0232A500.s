	.include "asm/macros.inc"
	.include "overlay_29_0232A500.inc"

	.text

	arm_func_start DoMoveDamage__0232A500
DoMoveDamage__0232A500: ; 0x0232A500
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDamage__0232A500

	arm_func_start DoMoveSuperpower
DoMoveSuperpower: ; 0x0232A524
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	str r3, [sp]
	mov r3, #0x100
	mov r4, #0
	mov r5, r0
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	beq _0232A59C
	ldr r0, _0232A5A8 ; =ATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r5
	mov r1, r5
	mov r3, #1
	str r2, [sp, #8]
	str ip, [sp, #4]
	bl LowerOffensiveStat
	add r0, sp, #8
	mov ip, #0
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r5
	mov r1, r5
	mov r3, #1
	str ip, [sp, #4]
	bl LowerDefensiveStat
_0232A59C:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0232A5A8: .word ATK_STAT_IDX
	arm_func_end DoMoveSuperpower

	arm_func_start DoMoveSteelWing
DoMoveSteelWing: ; 0x0232A5AC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x28]
	mov r3, #0x100
	mov r6, r0
#ifndef JAPAN
	mov r5, r1
#endif
	str ip, [sp]
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A628
	ldr r1, _0232A63C ; =STEEL_WING_BOOST_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
#ifdef JAPAN
	mov r1, r6
#else
	mov r1, r5
#endif
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232A628
	add r0, sp, #0x24
	ldr r2, [r0]
	ldr r5, [r6, #0xb4]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostDefensiveStat
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x108]
#endif
_0232A628:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0232A63C: .word STEEL_WING_BOOST_DEFENSE_CHANCE
	arm_func_end DoMoveSteelWing

	arm_func_start DoMoveSpitUp
DoMoveSpitUp: ; 0x0232A640
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, [r0, #0xb4]
#ifdef JAPAN
	ldrb ip, [r4, #0x11a]
#else
	ldrb ip, [r4, #0x11e]
#endif
	cmp ip, #0
	beq _0232A670
	str r3, [sp]
	mov r3, ip, lsl #8
	bl DealDamage
	mov r0, #0
#ifdef JAPAN
	strb r0, [r4, #0x11a]
#else
	strb r0, [r4, #0x11e]
#endif
	b _0232A678
_0232A670:
	ldr r2, _0232A684 ; =0x00000EE5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232A678:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_0232A684: .word 0x00000C27
#else
_0232A684: .word 0x00000EE5
#endif
	arm_func_end DoMoveSpitUp

	arm_func_start DoMoveDynamicPunch
DoMoveDynamicPunch: ; 0x0232A688
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A6E0
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232A6E0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictConfusedStatus
_0232A6E0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end DoMoveDynamicPunch

	arm_func_start DoMoveKnockOff
DoMoveKnockOff: ; 0x0232A6EC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov r1, r7
	mov r2, r0
	ldr r4, [r7, #0xb4]
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	mov r1, r6
	mov r2, #0x2c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActiveMoveEffects__02329F14
	cmp r0, #0
	beq _0232A758
	ldr r2, _0232A820 ; =0x00000EE6
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _0232A818
_0232A758:
	ldrh r0, [r5, #0x62]
	strh r0, [sp, #4]
	ldrh r1, [r5, #0x64]
	ldrb r0, [sp, #4]
	strh r1, [sp, #6]
	ldrh r1, [r5, #0x66]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	strh r1, [sp, #8]
	tst r0, #0xff
	bne _0232A7A0
	ldr r2, _0232A824 ; =0x00000EE8
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _0232A818
_0232A7A0:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0232A7B4
	add r0, r5, #0x62
	bl RemoveEquivItem
_0232A7B4:
	add r0, r5, #0x62
	bl ItemZInit
	ldr r2, _0232A828 ; =0x00000EE7
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrb r1, [r4, #0x4c]
	ldr r0, _0232A82C ; =DIRECTIONS_XY
	ldr r5, _0232A830 ; =DIRECTIONS_XY + 2
	mov r1, r1, lsl #2
	ldrsh r1, [r0, r1]
	add r2, sp, #4
	mov r0, r7
	strh r1, [sp]
	ldrb r4, [r4, #0x4c]
	mov r1, r6
	add r3, sp, #0
	mov r4, r4, lsl #2
	ldrsh r4, [r5, r4]
	strh r4, [sp, #2]
	bl ov29_0232A834
	mov r0, r7
	mov r1, r6
	bl ov29_02321164
	mov r0, #1
_0232A818:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_0232A820: .word 0x00000C28
_0232A824: .word 0x00000C2A
_0232A828: .word 0x00000C29
#else
_0232A820: .word 0x00000EE6
_0232A824: .word 0x00000EE8
_0232A828: .word 0x00000EE7
#endif
_0232A82C: .word DIRECTIONS_XY
_0232A830: .word DIRECTIONS_XY + 2
	arm_func_end DoMoveKnockOff

	arm_func_start ov29_0232A834
ov29_0232A834: ; 0x0232A834
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xc0
	mov r5, #0
	mov r4, r2
	mov ip, #3
	mov r2, #1
	strb r2, [sp, #0x28]
	str ip, [sp, #8]
	strb r5, [sp, #0x2c]
	strb r5, [sp, #0x2a]
	str r4, [sp, #0xbc]
	ldrsh lr, [r1, #4]
	ldrsh ip, [r3]
	mov r5, r0
	mov r2, #0x18
	add r0, lr, ip
	strh r0, [sp, #0xc]
	ldrsh ip, [r1, #6]
	ldrsh r3, [r3, #2]
	add r0, sp, #8
	add r3, ip, r3
	strh r3, [sp, #0xe]
	ldrsh r3, [r1, #4]
	ldrsh r1, [r1, #6]
	smulbb r3, r3, r2
	smulbb r1, r1, r2
	add r2, r1, #4
	add r3, r3, #4
	mov r1, r3, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r0, #0
	add r1, sp, #8
	mov r2, r0
	strh r0, [sp, #0x2e]
	bl SubstitutePlaceholderStringTags
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, r5
	mov r2, r4
	add r1, sp, #8
	mov r3, #1
	bl SpawnDroppedItem
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0232A834

	arm_func_start DoMoveSplash
DoMoveSplash: ; 0x0232A8EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov sb, r1
	ldrh r1, [sb, #4]
	mov sl, r0
	mov r8, r2
	strh r1, [sp, #0x24]
	ldrh r4, [sb, #6]
	mov r0, sb
	mov r1, #0xa
	mov r2, #8
	mov r7, r3
	strh r4, [sp, #0x26]
	bl ChangeMonsterAnimation
	mov r4, #3
	mov r5, #0
	mov fp, r4
	b _0232A990
_0232A934:
	mov r0, r4
	bl DungeonRandInt
	mov r6, r0
	mov r0, fp
	bl DungeonRandInt
	subs r1, r6, #1
	bne _0232A958
	subs r1, r0, #1
	beq _0232A98C
_0232A958:
	ldrsh r3, [sb, #4]
	sub r1, r6, #1
	sub r2, r0, #1
	add r0, r3, r1
	strh r0, [sp, #0x24]
	ldrsh r3, [sb, #6]
	mov r0, sb
	add r1, sp, #0x24
	add r2, r3, r2
	strh r2, [sp, #0x26]
	bl ov29_022FFB90
	cmp r0, #0
	beq _0232A998
_0232A98C:
	add r5, r5, #1
_0232A990:
	cmp r5, #0x28
	blt _0232A934
_0232A998:
	cmp r5, #0x28
	bne _0232A9B8
	ldr r2, _0232AC38 ; =0x00000EEA
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _0232AC30
_0232A9B8:
	ldrsh r2, [sp, #0x24]
	mov r0, #0x18
	ldr r1, [sb, #0xc]
	smulbb r0, r2, r0
	add r0, r0, #0xc
	rsb r0, r1, r0, lsl #8
	mov r1, #0xc
	bl _s32_div_f
	ldrsh r3, [sp, #0x26]
	mov r1, #0x18
	ldr r2, [sb, #0x10]
	smulbb r1, r3, r1
	add r1, r1, #0x10
	mov r5, r0
	rsb r0, r2, r1, lsl #8
	mov r1, #0xc
	bl _s32_div_f
	mov r4, r0
	add r0, sb, #4
	bl ov29_022E2CA0
	cmp r0, #0
	bne _0232AA20
	add r0, sp, #0x24
	bl ov29_022E2CA0
	cmp r0, #0
	beq _0232AA4C
_0232AA20:
	mov r6, #0
	mov fp, #0x2c
_0232AA28:
	mov r0, sb
	mov r1, r5
	mov r2, r4
	bl IncrementEntityPixelPosXY
	mov r0, fp
	bl AdvanceFrame
	add r6, r6, #1
	cmp r6, #0xc
	blt _0232AA28
_0232AA4C:
	ldrsh r0, [sp, #0x24]
	ldrsh r1, [sp, #0x26]
	bl GetTileSafe
	ldr r6, [r0, #0xc]
	cmp r6, #0
	beq _0232ABC8
	ldr r0, [r6]
	cmp r0, #1
	bne _0232AB5C
	ldr r1, _0232AC3C ; =0x00000163
	add r0, sp, #0x1c
	bl InitMove
	add r1, sp, #0x1c
	mov r0, r6
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _0232AAD8
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	mov r3, #0
	str r3, [sp]
	ldr r1, _0232AC40 ; =ov10_022C44B4
	str r3, [sp, #4]
	mov r2, #3
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldrsh r2, [r1]
	str r3, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, sl
	mov r1, r6
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
_0232AAD8:
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	bne _0232AC30
	mov r0, sl
	bl EntityIsValidMoveEffects__0232A3D8
	cmp r0, #0
	moveq r0, #1
	beq _0232AC30
	mov r3, #0
	str r3, [sp]
	ldr r0, _0232AC40 ; =ov10_022C44B4
	mov r1, #3
	str r3, [sp, #4]
	str r1, [sp, #8]
	rsb r1, r1, #0x240
	str r1, [sp, #0xc]
	ldrsh r2, [r0]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, sl
	mov r1, sl
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	bne _0232AC30
	mov r0, sl
	bl EntityIsValidMoveEffects__0232A3D8
	cmp r0, #0
	moveq r0, #1
	beq _0232AC30
_0232AB5C:
	mov r0, sb
	bl EntityIsValidMoveEffects__0232A3D8
	cmp r0, #0
	moveq r0, #1
	beq _0232AC30
	add r0, sb, #4
	bl ov29_022E2CA0
	cmp r0, #0
	bne _0232AB90
	add r0, sp, #0x24
	bl ov29_022E2CA0
	cmp r0, #0
	beq _0232ABDC
_0232AB90:
	rsb r6, r4, #0
	rsb r5, r5, #0
	mov r7, #0
	mov r4, #0x2c
_0232ABA0:
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl IncrementEntityPixelPosXY
	mov r0, r4
	bl AdvanceFrame
	add r7, r7, #1
	cmp r7, #0xc
	blt _0232ABA0
	b _0232ABDC
_0232ABC8:
	ldrsh r1, [sp, #0x24]
	ldrsh r2, [sp, #0x26]
	mov r0, sb
	mov r3, #0
	bl MoveMonsterToPos
_0232ABDC:
	mov r0, sb
	bl EntityIsValidMoveEffects__0232A3D8
	cmp r0, #0
	moveq r0, #1
	beq _0232AC30
	mov r0, sb
	mov r1, #0
	bl UpdateEntityPixelPos
	mov r0, sb
	mov r1, #0xe
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0232AC24
#ifndef JAPAN
	mov r0, sb
	bl ov29_02321260
#endif
	mov r0, sl
	mov r1, sb
	bl ov29_02321164
_0232AC24:
	mov r0, sb
	bl ov29_02321260
	mov r0, #1
_0232AC30:
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_0232AC38: .word 0x00000C2C
#else
_0232AC38: .word 0x00000EEA
#endif
_0232AC3C: .word 0x00000163
_0232AC40: .word ov10_022C44B4
	arm_func_end DoMoveSplash
