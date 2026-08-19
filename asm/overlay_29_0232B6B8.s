	.include "asm/macros.inc"
	.include "overlay_29_0232B6B8.inc"

	.text

	arm_func_start DoMoveWrap
DoMoveWrap: ; 0x0232B6B8
	stmdb sp!, {r3, lr}
	bl TryInflictWrappedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveWrap

	arm_func_start DoMoveSpikes
DoMoveSpikes: ; 0x0232B6C8
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x13
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
	beq _0232B718
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x13
#endif
	mov r3, #1
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232B728
_0232B718:
	ldr r2, _0232B734 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232B728:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B734: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232B734: .word 0x00000EEF
#endif
	arm_func_end DoMoveSpikes

	arm_func_start DoMoveMagnitude
DoMoveMagnitude: ; 0x0232B738
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _0232B7B0 ; =ov29_0237CA84
	ldr r5, _0232B7B4 ; =DUNGEON_PTR
	ldr ip, [r4]
	ldr r6, _0232B7B8 ; =ov29_02352B1C
	ldr r4, [r5]
	ldr r6, [r6, ip, lsl #2]
	ldr lr, [r1, #0xb4]
	add r4, r4, #0x1a000
#ifdef JAPAN
	str r6, [r4, #0x190]
#else
	str r6, [r4, #0x234]
#endif
	ldr r4, [r5]
	mov r5, #0
	add r4, r4, #0x1a000
#ifdef JAPAN
	str r5, [r4, #0x194]
#else
	str r5, [r4, #0x238]
#endif
	ldrb r4, [lr, #0xd2]
	ldr r5, _0232B7BC ; =ov10_022C4924
	mov ip, ip, lsl #1
	cmp r4, #0xa
	ldrsh r4, [r5, ip]
	str r3, [sp]
	moveq r4, r4, lsl #1
	mov r3, r4
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232B7B0: .word ov29_0237CA84
_0232B7B4: .word DUNGEON_PTR
_0232B7B8: .word ov29_02352B1C
_0232B7BC: .word ov10_022C4924
	arm_func_end DoMoveMagnitude

	arm_func_start DoMoveMagicCoat
DoMoveMagicCoat: ; 0x0232B7C0
	stmdb sp!, {r3, lr}
	bl TryInflictMagicCoatStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveMagicCoat

	arm_func_start DoMoveProtect
DoMoveProtect: ; 0x0232B7D0
	stmdb sp!, {r3, lr}
	bl TryInflictProtectStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveProtect

	arm_func_start DoMoveDefenseCurl
DoMoveDefenseCurl: ; 0x0232B7E0
	stmdb sp!, {r3, lr}
	ldr r2, _0232B7FC ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232B7FC: .word ATK_STAT_IDX
	arm_func_end DoMoveDefenseCurl

	arm_func_start DoMoveDecoy
DoMoveDecoy: ; 0x0232B800
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov ip, #0
	mov r3, r2
	str ip, [sp]
	bl TryInflictDecoyStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDecoy

	arm_func_start DoMoveMistBall
DoMoveMistBall: ; 0x0232B820
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232B88C
	ldr r1, _0232B898 ; =MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B88C
	ldr r0, _0232B89C ; =SPATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerOffensiveStat
_0232B88C:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B898: .word MIST_BALL_LOWER_SPECIAL_ATTACK_CHANCE
_0232B89C: .word SPATK_STAT_IDX
	arm_func_end DoMoveMistBall

	arm_func_start DoMoveDestinyBond
DoMoveDestinyBond: ; 0x0232B8A0
	stmdb sp!, {r3, lr}
	bl TryInflictDestinyBondStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDestinyBond

	arm_func_start DoMoveDamage__0232B8B0
DoMoveDamage__0232B8B0: ; 0x0232B8B0
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDamage__0232B8B0

	arm_func_start DoMoveMirrorCoat
DoMoveMirrorCoat: ; 0x0232B8D4
	stmdb sp!, {r3, lr}
	bl TryInflictMirrorCoatStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveMirrorCoat

	arm_func_start DoMoveCalmMind
DoMoveCalmMind: ; 0x0232B8E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0232B924 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	str r2, [sp]
	bl BoostOffensiveStat
	add r1, sp, #0
	ldr r2, [r1]
	mov r0, r5
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232B924: .word SPATK_STAT_IDX
	arm_func_end DoMoveCalmMind

	arm_func_start DoMoveHiddenPower
DoMoveHiddenPower: ; 0x0232B928
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHiddenPower

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

	arm_func_start DoMoveSnatch
DoMoveSnatch: ; 0x0232BE34
	stmdb sp!, {r3, lr}
	bl TryInflictSnatchStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSnatch

	arm_func_start DoMoveRecycle
DoMoveRecycle: ; 0x0232BE44
#ifdef JAPAN
#define DO_MOVE_RECYCLE_OFFSET 4
#else
#define DO_MOVE_RECYCLE_OFFSET 0
#endif

	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r6, r0
	ldrb r0, [r1, #6]
	mov sb, #0
	cmp r0, #0
	bne _0232BF34
	ldr r7, _0232BF68 ; =DUNGEON_PTR
	ldr r8, _0232BF6C ; =BAG_ITEMS_PTR_MIRROR
	mov sl, sb
	mov fp, #6
_0232BE74:
	mul r4, sl, fp
	ldr r0, [r8]
	ldr r0, [r0, #0x384]
	ldrb r1, [r0, r4]
	add r2, r0, r4
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0232BF28
	ldrb r1, [r2]
	tst r1, #2
	ldreqsh r1, [r2, #4]
	cmpeq r1, #0xbb
	bne _0232BF28
	ldrh r1, [r2, #2]
	add r1, r1, #0xbc
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	cmp r1, #0xfe
	beq _0232BF28
	add r0, r0, r4
	mov r2, #0
	ldrb sb, [r0, #1]
	bl InitStandardItem
	ldr r0, [r8]
	cmp sb, #0
	ldr r0, [r0, #0x384]
	add r0, r0, r4
	strb sb, [r0, #1]
	beq _0232BF24
#ifdef JAPAN
	ldr r2, [r7]
	mov r0, #0x23c
	ldr r1, [r8]
	mla r0, sb, r0, r2
	ldr r1, [r1, #0x384]
	add r0, r0, #0x600
	add r2, r1, r4
	ldrh r1, [r1, r4]
#else
	ldr r1, [r8]
	ldr r2, [r7]
	add r0, sb, sb, lsl #3
	add r0, r2, r0, lsl #6
	ldr r2, [r1, #0x384]
	add r0, r0, #0x600
	ldrh r1, [r2, r4]
	add r2, r2, r4
#endif
	strh r1, [r0, #0x16 + DO_MOVE_RECYCLE_OFFSET]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x18 + DO_MOVE_RECYCLE_OFFSET]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x1a + DO_MOVE_RECYCLE_OFFSET]
_0232BF24:
	mov sb, #1
_0232BF28:
	add sl, sl, #1
	cmp sl, #0x32
	blt _0232BE74
_0232BF34:
	cmp sb, #0
	beq _0232BF50
	ldr r2, _0232BF70 ; =0x00000EF3
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232BF60
_0232BF50:
	ldr r2, _0232BF74 ; =0x00000EF4
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232BF60:
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232BF68: .word DUNGEON_PTR
_0232BF6C: .word BAG_ITEMS_PTR_MIRROR
#ifdef JAPAN
_0232BF70: .word 0x00000C35
_0232BF74: .word 0x00000C36
#else
_0232BF70: .word 0x00000EF3
_0232BF74: .word 0x00000EF4
#endif
	arm_func_end DoMoveRecycle

	arm_func_start DoMoveReflect
DoMoveReflect: ; 0x0232BF78
	stmdb sp!, {r3, lr}
	bl TryInflictReflectStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveReflect

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

	arm_func_start DoMoveSeeTrap
DoMoveSeeTrap: ; 0x0232C300
	stmdb sp!, {r3, lr}
	bl RevealTrapsNearby
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSeeTrap

	arm_func_start DoMoveTakeaway
DoMoveTakeaway: ; 0x0232C310
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r8, r0
	mov r7, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232C4DC
	mov r2, r4
	mov r0, r8
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232C4BC
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	ldr r6, [r7, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	mov r1, r7
	mov r2, #0x2c
#ifndef JAPAN
	mov r3, r4
#endif
	bl DefenderAbilityIsActiveMoveEffects__0232BDD0
	cmp r0, #0
	beq _0232C3B0
#ifdef JAPAN
	mov r0, r8
	mov r1, r7
	mov r2, #0xc40
#else
	ldr r2, _0232C4E8 ; =0x00000EFE
	mov r0, r8
	mov r1, r7
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r4
	b _0232C4E0
_0232C3B0:
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, r4
	moveq r0, #0
	tst r0, #0xff
	beq _0232C3E0
	ldr r2, _0232C4EC ; =0x00000EFA
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	b _0232C4E0
_0232C3E0:
	ldrb r0, [r6, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0232C410
	ldr r2, _0232C4F0 ; =0x00000EFB
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	b _0232C4E0
_0232C410:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0232C440
	bl IsBagFull
	cmp r0, #0
	beq _0232C440
	ldr r2, _0232C4F4 ; =0x00000EFC
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	b _0232C4E0
_0232C440:
	ldrh r0, [r6, #0x62]
	strh r0, [r5, #0x62]
	ldrh r0, [r6, #0x64]
	strh r0, [r5, #0x64]
	ldrh r0, [r6, #0x66]
	strh r0, [r5, #0x66]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0232C46C
	mov r0, r5
	bl AddHeldItemToBag
_0232C46C:
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0232C480
	add r0, r6, #0x62
	bl RemoveEquivItem
_0232C480:
	add r0, r6, #0x62
	bl ItemZInit
	mov r0, r8
	bl ov29_022F9EA0
	mov r0, r7
	bl ov29_022F9EA0
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
#endif
	ldr r2, _0232C4F8 ; =0x00000EF9
	mov r1, r7
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r5, #0x107]
#else
	strlob r0, [r5, #0x108]
#endif
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232C4DC
_0232C4BC:
	mov r0, r7
	bl EntityIsValidMoveEffects__0232C500
	cmp r0, #0
	beq _0232C4DC
	ldr r2, _0232C4FC ; =0x00000EFD
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_0232C4DC:
	mov r0, r4
_0232C4E0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define DO_MOVE_TAKEAWAY_OFFSET -0x2BE
#else
#define DO_MOVE_TAKEAWAY_OFFSET 0
#endif
#ifndef JAPAN
_0232C4E8: .word 0x00000EFE
#endif
_0232C4EC: .word 0x00000EFA + DO_MOVE_TAKEAWAY_OFFSET
_0232C4F0: .word 0x00000EFB + DO_MOVE_TAKEAWAY_OFFSET
_0232C4F4: .word 0x00000EFC + DO_MOVE_TAKEAWAY_OFFSET
_0232C4F8: .word 0x00000EF9 + DO_MOVE_TAKEAWAY_OFFSET
_0232C4FC: .word 0x00000EFD + DO_MOVE_TAKEAWAY_OFFSET
	arm_func_end DoMoveTakeaway
