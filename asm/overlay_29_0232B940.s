	.include "asm/macros.inc"
	.include "overlay_29_0232B940.inc"

	.text

	arm_func_start DoMoveMetalClaw
DoMoveMetalClaw: ; 0x0232B940
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x28]
	mov r3, #0x100
	mov r6, r0
#ifdef EUROPE
	mov r5, r1
#endif
	str ip, [sp]
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232B9B8
	ldr r1, _0232B9CC ; =METAL_CLAW_BOOST_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
#ifdef EUROPE
	mov r1, r5
#else
	mov r1, r6
#endif
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B9B8
	add r0, sp, #0x24
	ldr r2, [r0]
	ldr r5, [r6, #0xb4]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostOffensiveStat
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
_0232B9B8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0232B9CC: .word METAL_CLAW_BOOST_ATTACK_CHANCE
	arm_func_end DoMoveMetalClaw

	arm_func_start DoMoveAttract
DoMoveAttract: ; 0x0232B9D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r0, [r6, #0xb4]
	ldr r1, [r5, #0xb4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r1, #2]
	mov r4, #0
	bl GendersNotEqualNotGenderless
	cmp r0, #0
	beq _0232BA14
	mov r4, #1
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl TryInflictInfatuatedStatus
_0232BA14:
	cmp r4, #0
	bne _0232BA3C
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldr r2, _0232CE90 ; =0x00000C52
	mov r0, r6
	mov r1, r5
#else
	mov r0, r6
	mov r1, r5
	mov r2, #0xf10
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232BA3C:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232CE90: .word 0x00000C52
#endif
	arm_func_end DoMoveAttract

	arm_func_start DoMoveCopycat
DoMoveCopycat: ; 0x0232BA44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, r1
	ldr r0, [r0, #0xb4]
	mov r7, #0
#ifdef JAPAN
	add r4, r0, #0x120
#else
	add r4, r0, #0x124
#endif
	ldr r0, _0232BB44 ; =0x0000020D
	ldr sb, [sl, #0xb4]
	str r1, [sp]
	mov r6, r7
	mov r5, r7
	sub fp, r0, #0xc6
_0232BA74:
	ldrb r0, [r4, r5, lsl #3]
	add r8, r4, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0232BAE0
	ldrh r1, [r8, #4]
	mov r0, sl
	bl ov29_02324D60
	cmp r0, #0
	bne _0232BAE0
	ldrh r1, [r8, #4]
	cmp r1, fp
	cmpne r1, #0xe5
	cmpne r1, #0x8a
	cmpne r1, #0x28
	cmpne r1, #0x11
	ldrne r0, _0232BB44 ; =0x0000020D
	cmpne r1, r0
	beq _0232BAE0
	ldrb r0, [r8]
	tst r0, #0x10
	addne r0, sb, r6, lsl #1
	addne r0, r0, #0x100
#ifdef JAPAN
	strneh r1, [r0, #0x90]
#else
	strneh r1, [r0, #0x94]
#endif
	addne r6, r6, #1
_0232BAE0:
	add r5, r5, #1
	cmp r5, #4
	blt _0232BA74
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r6, #0
	beq _0232BB2C
#ifdef JAPAN
	ldrb r0, [sb, #0x107]
	ldr r2, _0232CF98 ; =0x00000C32
	ldr r1, [sp]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [sb, #0x107]
#else
	ldrb r0, [sb, #0x108]
	ldr r1, [sp]
	mov r2, #0xef0
	cmp r0, #1
	movlo r0, #1
	strlob r0, [sb, #0x108]
#endif
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r7, #1
	b _0232BB3C
_0232BB2C:
	ldr r2, _0232BB48 ; =0x00000EF1
	ldr r1, [sp]
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUserTarget
_0232BB3C:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232BB44: .word 0x0000020D
#ifdef JAPAN
_0232CF98: .word 0x00000C32
_0232BB48: .word 0x00000C33
#else
_0232BB48: .word 0x00000EF1
#endif
	arm_func_end DoMoveCopycat

	arm_func_start DoMoveFrustration
DoMoveFrustration: ; 0x0232BB4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r7, #0
	mov r6, r0
	strb r7, [sp, #0x1c]
	mov sl, r3
	mov r5, r1
	mov r4, r2
	ldr ip, [r6, #0xb4]
	mov sb, #1
	ldr r3, _0232BC28 ; =ov10_022C4C3C
	ldr r0, _0232BC2C ; =0x000003E7
	b _0232BBA8
_0232BB80:
	mov r8, r7, lsl #2
	ldrsh r2, [r3, r8]
	cmp r2, #0
	blt _0232BBB0
	ldrsh r1, [ip, #0xe]
	cmp r1, r2
	ldrlt r0, _0232BC30 ; =ov10_022C4C3E
	ldrltsh sb, [r0, r8]
	blt _0232BBB0
	add r7, r7, #1
_0232BBA8:
	cmp r7, r0
	blt _0232BB80
_0232BBB0:
	mov r0, r4
	bl GetMoveType
	mov r8, r0
	ldrh r0, [r4, #4]
	bl GetMoveCategory
	mov r7, r0
	mov r1, sl
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
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0232BC28: .word ov10_022C4C3C
_0232BC2C: .word 0x000003E7
_0232BC30: .word ov10_022C4C3E
	arm_func_end DoMoveFrustration

	arm_func_start DoMoveLeechSeed
DoMoveLeechSeed: ; 0x0232BC34
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r2, #1
	mov r3, #0
	bl TryInflictLeechSeedStatus
	ldr r1, [r4, #0xb4]
#ifdef JAPAN
	ldrb r0, [r1, #0x107]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r1, #0x107]
#else
	ldrb r0, [r1, #0x108]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r1, #0x108]
#endif
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end DoMoveLeechSeed

	arm_func_start DoMoveMetronome
DoMoveMetronome: ; 0x0232BC64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _0232BCB8 ; =METRONOME_NEXT_INDEX
	mov r5, r0
	ldr r6, [r2]
	ldr r0, _0232BCBC ; =METRONOME_TABLE
	mov r2, r6, lsl #3
	mov r4, r1
	ldrh r1, [r0, r2]
	add r0, sp, #0
	mov r7, r3
	bl InitMove
	ldr r0, _0232BCC0 ; =ov10_022C5DE0
	add r2, sp, #0
	ldr ip, [r0, r6, lsl #3]
	mov r0, r5
	mov r1, r4
	mov r3, r7
	blx ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232BCB8: .word METRONOME_NEXT_INDEX
_0232BCBC: .word METRONOME_TABLE
_0232BCC0: .word ov10_022C5DE0
	arm_func_end DoMoveMetronome

	arm_func_start DoMoveDreamEater
DoMoveDreamEater: ; 0x0232BCC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r2
#ifdef JAPAN
	mov sb, r1
	mov r2, #0x3a
	mov r7, r0
	mov r6, r3
#else
	mov r6, r3
	mov sb, r1
	mov r2, #0x3a
	mov r3, #1
	mov r7, r0
#endif
	mov r4, #0
	bl DefenderAbilityIsActiveMoveEffects__0232BDD0
	mov r5, r0
	mov r0, sb
	bl IsMonsterSleeping
	cmp r0, #0
	beq _0232BDB4
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232BDC4
	add r0, r0, r0, lsr #31
	mov r6, r0, asr #1
	mov r4, #1
	cmp r6, #1
	mov r0, r7
	mov r1, #0
	movlt r6, r4
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232BDC4
	ldr r1, [r7, #0xb4]
#ifdef JAPAN
	ldrb r0, [r1, #0x107]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r1, #0x107]
#else
	ldrb r0, [r1, #0x108]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r1, #0x108]
#endif
	mov r0, r7
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232BDC4
	cmp r5, #0
	beq _0232BD94
	mov r2, #0xd
	mov r0, r7
	mov r1, r6
	add r3, r2, #0x22c
	bl ApplyDamageAndEffectsWrapper
	b _0232BDC4
_0232BD94:
	mov r5, #1
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, #0
	str r5, [sp]
	bl TryIncreaseHp
	b _0232BDC4
_0232BDB4:
	ldr r2, _0232BDCC ; =0x00000EF2
	mov r0, r7
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0232BDC4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232BDCC: .word 0x00000C34
#else
_0232BDCC: .word 0x00000EF2
#endif
	arm_func_end DoMoveDreamEater

	arm_func_start DefenderAbilityIsActiveMoveEffects__0232BDD0
DefenderAbilityIsActiveMoveEffects__0232BDD0: ; 0x0232BDD0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _0232BE24
	cmp r0, #0
	moveq r1, #0
	beq _0232BE04
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_0232BE04:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _0232BE24
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0232BE24:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActiveMoveEffects__0232BDD0
