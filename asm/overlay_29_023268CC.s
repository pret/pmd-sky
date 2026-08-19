	.include "asm/macros.inc"
	.include "overlay_29_023268CC.inc"

	.text

	arm_func_start DoMoveSmokescreen
DoMoveSmokescreen: ; 0x023268CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02326904 ; =SMOKESCREEN_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl TryInflictWhifferStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02326904: .word SMOKESCREEN_TURN_RANGE
	arm_func_end DoMoveSmokescreen

	arm_func_start DoMoveMirrorMove
DoMoveMirrorMove: ; 0x02326908
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EndFrozenStatus
	mov r0, r5
	mov r1, r4
	bl TryInflictMirrorMoveStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveMirrorMove

	arm_func_start DoMoveOverheat
DoMoveOverheat: ; 0x0232692C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	ldr r5, [sb, #0xb4]
	mov r6, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326988
	mov r1, r4
	mov r0, sb
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	movne r0, r4
#ifdef JAPAN
	strneb r0, [r5, #0x15b]
#else
	strneb r0, [r5, #0x15f]
#endif
_02326988:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveOverheat

	arm_func_start DoMoveAuroraBeam
DoMoveAuroraBeam: ; 0x02326990
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023269F8
	ldr r1, _02326A04 ; =AURORA_BEAM_LOWER_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023269F8
	ldr r0, _02326A08 ; =ATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	mov r3, #0x80
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
_023269F8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326A04: .word AURORA_BEAM_LOWER_ATTACK_CHANCE
_02326A08: .word ATK_STAT_IDX
	arm_func_end DoMoveAuroraBeam

	arm_func_start DoMoveMemento
DoMoveMemento: ; 0x02326A0C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r2, _02326A6C ; =ATK_STAT_IDX
	ldr r4, [r6, #0xb4]
	mov ip, #1
	strh ip, [r4, #0x10]
	ldr r2, [r2]
	mov r3, #0x40
	mov r5, r1
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
	ldr r0, _02326A70 ; =SPATK_STAT_IDX
	mov ip, #1
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	mov r3, #0x40
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
	mov r0, #1
#ifdef JAPAN
	strb r0, [r4, #0x15a]
#else
	strb r0, [r4, #0x15e]
#endif
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326A6C: .word ATK_STAT_IDX
_02326A70: .word SPATK_STAT_IDX
	arm_func_end DoMoveMemento

	arm_func_start DoMoveOctazooka
DoMoveOctazooka: ; 0x02326A74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02326AD4
	ldr r1, _02326AE0 ; =OCTAZOOKA_LOWER_ACCURACY_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326AD4
	ldr r1, _02326AE4 ; =ATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
_02326AD4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326AE0: .word OCTAZOOKA_LOWER_ACCURACY_CHANCE
_02326AE4: .word ATK_STAT_IDX
	arm_func_end DoMoveOctazooka

	arm_func_start DoMoveFlatter
DoMoveFlatter: ; 0x02326AE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	mov r3, #0
	mov r5, r0
	mov r4, r1
	bl TryInflictConfusedStatus
	ldr r1, _02326B20 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02326B20: .word SPATK_STAT_IDX
	arm_func_end DoMoveFlatter

	arm_func_start DoMoveWillOWisp
DoMoveWillOWisp: ; 0x02326B24
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r5, r1
	bl GetFlashFireStatus
	movs r4, r0
	beq _02326B94
	ldr r3, [r5, #0xb4]
#ifdef JAPAN
	ldrb r0, [r3, #0x158]
#else
	ldrb r0, [r3, #0x15c]
#endif
	cmp r0, #0
	bne _02326BAC
	mov r0, #1
	mov r1, r5
	mov r2, #0
#ifdef JAPAN
	strb r0, [r3, #0x158]
#else
	strb r0, [r3, #0x15c]
#endif
	bl SubstitutePlaceholderStringTags
	cmp r4, #1
	bne _02326B80
	ldr r2, _02326BB8 ; =0x00000CDD
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326BAC
_02326B80:
	ldr r2, _02326BBC ; =0x00000CDC
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326BAC
_02326B94:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, #1
	str r2, [sp]
	bl TryInflictBurnStatus
_02326BAC:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02326BB8: .word 0x00000A1D
_02326BBC: .word 0x00000A1C
#else
_02326BB8: .word 0x00000CDD
_02326BBC: .word 0x00000CDC
#endif
	arm_func_end DoMoveWillOWisp

	arm_func_start DoMoveReturn
DoMoveReturn: ; 0x02326BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov sb, r0
	mov r4, r3
	mov r8, r1
	mov r7, r2
	ldr lr, [sb, #0xb4]
	mov r6, #1
	mov ip, #0
	ldr r3, _02326C98 ; =ov10_022C4C0C
	ldr r0, _02326C9C ; =0x000003E7
	b _02326C18
_02326BF0:
	mov r5, ip, lsl #2
	ldrsh r2, [r3, r5]
	cmp r2, #0
	blt _02326C20
	ldrsh r1, [lr, #0xe]
	cmp r1, r2
	ldrlt r0, _02326CA0 ; =ov10_022C4C0E
	ldrltsh r6, [r0, r5]
	blt _02326C20
	add ip, ip, #1
_02326C18:
	cmp ip, r0
	blt _02326BF0
_02326C20:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r4
	mov r4, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r5}
	str r4, [sp, #8]
	mov r2, r6
	str r0, [sp, #0xc]
	mov r6, #0
	str r6, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r8
	mov r0, sb
	str r6, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r6
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02326C98: .word ov10_022C4C0C
_02326C9C: .word 0x000003E7
_02326CA0: .word ov10_022C4C0E
	arm_func_end DoMoveReturn
