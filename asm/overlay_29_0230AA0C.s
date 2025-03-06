	.include "asm/macros.inc"
	.include "overlay_29_0230AA0C.inc"

	.text

	arm_func_start AftermathCheck
AftermathCheck: ; 0x0230AA0C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r2
	mov r2, #0x76
#ifndef JAPAN
	mov r3, #1
#endif
	mov r6, r0
	mov r5, r1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230AA78
	ldr r0, _0230AA84 ; =AFTERMATH_CHANCE
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	ldrne ip, _0230AA88 ; =0x0000026F
	cmpne r4, ip
	beq _0230AA78
	mov r0, #0
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	add r2, r5, #4
	mov r3, #1
	str ip, [sp, #4]
	bl TryAftermathExplosion
	mov r0, #1
	b _0230AA7C
_0230AA78:
	mov r0, #0
_0230AA7C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230AA84: .word AFTERMATH_CHANCE
_0230AA88: .word 0x0000026F
	arm_func_end AftermathCheck

	arm_func_start GetTypeMatchupBothTypes
GetTypeMatchupBothTypes: ; 0x0230AA8C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _0230AB4C ; =ov29_02352838
	mov sl, r0
	ldrh r4, [r3]
	ldrh r3, [r3, #2]
	mov sb, r1
	mov r8, r2
	strh r4, [sp]
	strh r3, [sp, #2]
	bl ScrappyShouldActivate
	ldr fp, _0230AB50 ; =DUNGEON_PTR
	mov r7, r0
	mov r6, #0
	mov r5, #1
	add r4, sp, #0
_0230AAC8:
	cmp r7, #0
	bne _0230AB04
	mov r0, r8
	bl IsTypeIneffectiveAgainstGhost
	cmp r0, #0
	beq _0230AB04
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl GhostImmunityIsActive
	cmp r0, #0
	ldrne r1, [fp]
	movne r0, #0
	strneb r5, [r1, #0x1d4]
	bne _0230AB18
_0230AB04:
	mov r0, sl
	mov r1, sb
	mov r2, r6
	mov r3, r8
	bl GetTypeMatchup
_0230AB18:
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r2, r6, lsl #1
	mov r6, r1, asr #0x10
	strh r0, [r4, r2]
	cmp r6, #2
	blt _0230AAC8
	ldrsh r2, [sp]
	ldr r0, _0230AB54 ; =TYPE_MATCHUP_COMBINATOR_TABLE
	ldrsh r1, [sp, #2]
	add r0, r0, r2, lsl #4
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230AB4C: .word ov29_02352838
_0230AB50: .word DUNGEON_PTR
_0230AB54: .word TYPE_MATCHUP_COMBINATOR_TABLE
	arm_func_end GetTypeMatchupBothTypes

	arm_func_start ScrappyShouldActivate
ScrappyShouldActivate: ; 0x0230AB58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r5, #0x57
	mov fp, r6
	mov r4, #1
	b _0230ABDC
_0230AB7C:
	mov r0, sl
	mov r1, r5
	ldr r7, [sb, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230ABB4
	add r0, r7, r6
	ldrb r0, [r0, #0x5e]
	cmp r0, #0xe
	bne _0230ABB4
	cmp r8, #1
	cmpne r8, #7
	moveq r0, r4
	beq _0230ABB8
_0230ABB4:
	mov r0, fp
_0230ABB8:
	cmp r0, #0
	ldrne r1, _0230ABEC ; =DUNGEON_PTR
	movne r0, #1
	ldrne r1, [r1]
	strneb r0, [r1, #0x1cc]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230ABDC:
	cmp r6, #2
	blt _0230AB7C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230ABEC: .word DUNGEON_PTR
	arm_func_end ScrappyShouldActivate

	arm_func_start IsTypeIneffectiveAgainstGhost
IsTypeIneffectiveAgainstGhost: ; 0x0230ABF0
	cmp r0, #1
	cmpne r0, #7
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end IsTypeIneffectiveAgainstGhost

	arm_func_start GhostImmunityIsActive
GhostImmunityIsActive: ; 0x0230AC04
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xb4]
	add r1, r3, r2
	ldrb r1, [r1, #0x5e]
	cmp r1, #0xe
	bne _0230AC50
	ldrb r1, [r3, #0xfe]
	cmp r1, #0
	bne _0230AC38
	mov r1, #0x45
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230AC40
_0230AC38:
	mov r0, #1
	b _0230AC44
_0230AC40:
	mov r0, #0
_0230AC44:
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0230AC50:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GhostImmunityIsActive

	arm_func_start GetTypeMatchup
GetTypeMatchup: ; 0x0230AC58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldr r4, [r7, #0xb4]
	mov r6, r2
	ldrb r1, [r4, #0xf5]
	mov r5, r3
	cmp r1, #1
	beq _0230AC88
	mov r1, #0x46
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230ACA0
_0230AC88:
	cmp r5, #0xb
	addeq r0, r4, r6
	ldreqb r0, [r0, #0x5e]
	cmpeq r0, #0x10
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0230ACA0:
	cmp r5, #9
	bne _0230ACE0
	bl GravityIsActive
	cmp r0, #0
	beq _0230ACCC
	add r0, r4, r6
	ldrb r0, [r0, #0x5e]
	cmp r0, #0xa
	bne _0230ACE0
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0230ACCC:
	mov r0, r7
	bl IsFloating
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0230ACE0:
	ldr r1, _0230AD00 ; =TYPE_MATCHUP_TABLE
	mov r0, #0x24
	mla r0, r5, r0, r1
	add r1, r4, r6
	ldrb r1, [r1, #0x5e]
	mov r1, r1, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230AD00: .word TYPE_MATCHUP_TABLE
	arm_func_end GetTypeMatchup

	arm_func_start CalcTypeBasedDamageEffects
CalcTypeBasedDamageEffects: ; 0x0230AD04
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x64
	ldr r5, _0230B774 ; =ov29_02352838
	mov sl, r1
	ldr r4, [r5, #0x1c]
	ldr r5, [r5, #0x20]
	ldr r8, [sp, #0x88]
	ldr r1, [sp, #0x90]
	ldr r7, [sp, #0x8c]
	str r1, [sp, #0x90]
	ldr r6, [sl, #0xb4]
	mov r1, #1
	mov fp, r0
	mov sb, r2
	str r3, [sp, #4]
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	bl IntToFixedPoint64
	mov r0, #0
	str r0, [sp, #0x30]
	strb r0, [r7, #0xe]
	ldr r1, [sp, #0x30]
	mov r0, sb
	strb r1, [r7, #0xf]
	bl EntityIsValid__02308FBC
	cmp r0, #0
	moveq r0, #1
	beq _0230B76C
	mov r0, r8
	bl IsTypeIneffectiveAgainstGhost
	str r0, [sp, #0x2c]
	mov r0, sl
	mov r1, sb
	mov r2, #0x35
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	cmpne r8, #0
	movne r0, #1
	strne r0, [sp, #0x30]
	mov r3, #2
	mov r0, sl
	mov r1, sb
	mov r2, r8
	str r3, [r7, #8]
	bl ScrappyShouldActivate
	ldr r3, _0230B778 ; =MATCHUP_IMMUNE_MULTIPLIER_ERRATIC_PLAYER
	str r0, [sp, #0x28]
	ldr r0, [r3]
	ldr r2, _0230B77C ; =MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER
	str r0, [sp, #0x24]
	ldr r0, [r2]
	ldr r1, _0230B780 ; =MATCHUP_NEUTRAL_MULTIPLIER_ERRATIC_PLAYER
	str r0, [sp, #0x20]
	ldr r0, [r1]
	ldr r1, _0230B784 ; =MATCHUP_IMMUNE_MULTIPLIER
	str r0, [sp, #0x1c]
	ldr r0, _0230B788 ; =MATCHUP_SUPER_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER
	mov r4, #0
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r1]
	ldr r1, _0230B78C ; =MATCHUP_NEUTRAL_MULTIPLIER
	str r0, [sp, #0x14]
	ldr r0, _0230B790 ; =MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldr r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _0230B794 ; =MATCHUP_SUPER_EFFECTIVE_MULTIPLIER
	ldr r0, [r0]
	str r0, [sp, #8]
	b _0230AF8C
_0230AE28:
	ldr r0, [sp, #0x90]
	cmp r0, #0
	bne _0230AE90
	mov r0, sl
	mov r1, #0x3b
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0230AE5C
	mov r0, sb
	mov r1, #0x3b
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230AE90
_0230AE5C:
	ldr r1, [sp, #0x24]
	add r0, sp, #0x44
	bl FixedPoint32To64
	ldr r1, [sp, #0x20]
	add r0, sp, #0x4c
	bl FixedPoint32To64
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x54
	bl FixedPoint32To64
	ldr r1, [sp, #0x18]
	add r0, sp, #0x5c
	bl FixedPoint32To64
	b _0230AEC0
_0230AE90:
	ldr r1, [sp, #0x14]
	add r0, sp, #0x44
	bl FixedPoint32To64
	ldr r1, [sp, #0x10]
	add r0, sp, #0x4c
	bl FixedPoint32To64
	ldr r1, [sp, #0xc]
	add r0, sp, #0x54
	bl FixedPoint32To64
	ldr r1, [sp, #8]
	add r0, sp, #0x5c
	bl FixedPoint32To64
_0230AEC0:
	mov r0, fp
	bl FixedPoint64IsZero
	cmp r0, #0
	bne _0230AF94
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _0230AF1C
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _0230AF1C
	mov r0, sl
	mov r1, sb
	mov r2, r4, lsl #0x10
	mov r2, r2, asr #0x10
	bl GhostImmunityIsActive
	cmp r0, #0
	beq _0230AF1C
	ldr r0, _0230B798 ; =DUNGEON_PTR
	mov r5, #0
	ldr r1, [r0]
	mov r0, #1
	strb r0, [r1, #0x1d4]
	b _0230AF38
_0230AF1C:
	mov r0, sl
	mov r1, sb
	mov r2, r4, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r8
	bl GetTypeMatchup
	mov r5, r0
_0230AF38:
	mov r0, sl
	mov r1, #0x3b
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230AF64
	add r2, sp, #0x44
	mov r0, fp
	mov r1, fp
	add r2, r2, r5, lsl #3
	bl MultiplyFixedPoint64
	b _0230AF80
_0230AF64:
	cmp r5, #2
	beq _0230AF80
	add r2, sp, #0x44
	mov r0, fp
	mov r1, fp
	add r2, r2, r5, lsl #3
	bl MultiplyFixedPoint64
_0230AF80:
	add r0, sp, #0x34
	str r5, [r0, r4, lsl #2]
	add r4, r4, #1
_0230AF8C:
	cmp r4, #2
	blt _0230AE28
_0230AF94:
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r4, [sp, #0x34]
	ldr r2, [r0]
	ldr r1, _0230B79C ; =TYPE_MATCHUP_COMBINATOR_TABLE
	strb r4, [r2, #0x18c]
	ldr r3, [sp, #0x38]
	ldr r2, [r0]
	add r1, r1, r4, lsl #4
	ldr r0, [r1, r3, lsl #2]
	strb r3, [r2, #0x18d]
	cmp r0, #3
	str r0, [r7, #8]
	moveq r4, #1
	beq _0230AFEC
	ldr r0, [sp, #0x30]
	mov r4, #0
	cmp r0, #0
	ldrne r0, _0230B774 ; =ov29_02352838
	ldrne r1, [r0, #0x3c]
	ldrne r0, [r0, #0x40]
	strne r1, [fp]
	strne r0, [fp, #4]
_0230AFEC:
	mov r0, sl
	mov r1, #0x50
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B02C
	ldr r0, [r7, #8]
	cmp r0, #1
	bne _0230B02C
	ldr r1, _0230B7A0 ; =TINTED_LENS_MULTIPLIER
	add r0, sp, #0x3c
	ldr r1, [r1]
	bl FixedPoint32To64
	add r2, sp, #0x3c
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
_0230B02C:
	mov r0, sl
	mov r1, sb
	mov r2, #0x6c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	bne _0230B064
	mov r0, sl
	mov r1, sb
	mov r2, #0x6e
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B080
_0230B064:
	ldr r0, [r7, #8]
	cmp r0, #3
	bne _0230B080
	ldr r2, _0230B7A4 ; =SOLID_ROCK_MULTIPLIER
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
_0230B080:
	mov r0, sb
	mov r1, #0x5a
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230B0A4
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
_0230B0A4:
	ldr r0, [sp, #0x90]
	cmp r0, #0
	bne _0230B104
	mov r0, sl
	mov r1, #0x64
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B104
	ldr r0, _0230B7AC ; =TECHNICIAN_MOVE_POWER_THRESHOLD
	ldrsh r1, [r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	bgt _0230B104
	ldr r2, _0230B7B0 ; =DAMAGE_MULTIPLIER_1_5
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
	mov r1, #0x64
	ldr r2, _0230B7B4 ; =0x00000C3E
	mov r0, sl
	str r1, [sp]
	mov r1, sb
	mov r3, #2
	bl LogMessageByIdWithPopupCheckParticipants
_0230B104:
	cmp r8, #2
	cmpne r8, #6
	bne _0230B14C
	mov r0, sl
	mov r1, sb
	mov r2, #2
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B14C
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	ldr r3, [r0]
	mov r5, #1
	mov r0, fp
	mov r1, fp
	strb r5, [r3, #0x1c5]
	bl MultiplyFixedPoint64
_0230B14C:
	cmp r8, #2
	bne _0230B198
	mov r0, sl
	mov r1, sb
	bl FlashFireShouldActivate
	cmp r0, #0
	beq _0230B198
	ldr r1, _0230B798 ; =DUNGEON_PTR
	mov r0, fp
	ldr r2, [r1]
	mov r3, #1
	mov r1, #0
	strb r3, [r2, #0x1c6]
	bl IntToFixedPoint64
	mov r4, #0
	str r4, [r7, #8]
	strb r4, [r7, #0xe]
	mov r0, #1
	strb r0, [r7, #0xf]
_0230B198:
	cmp r8, #2
	bne _0230B1DC
	mov r0, sl
	mov r1, sb
	mov r2, #0x5f
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B1DC
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	ldr r3, [r0]
	mov r5, #1
	mov r0, fp
	mov r1, fp
	strb r5, [r3, #0x1c5]
	bl MultiplyFixedPoint64
_0230B1DC:
	cmp r8, #9
	bne _0230B248
	mov r0, sl
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230B208
	mov r0, sb
	bl LevitateIsActive
	cmp r0, #0
	bne _0230B218
_0230B208:
	mov r0, sb
	bl IsFloating
	cmp r0, #0
	beq _0230B248
_0230B218:
	ldr r1, _0230B798 ; =DUNGEON_PTR
	mov r0, fp
	ldr r2, [r1]
	mov r3, #1
	mov r1, #0
	strb r3, [r2, #0x1c7]
	bl IntToFixedPoint64
	mov r4, #0
	str r4, [r7, #8]
	strb r4, [r7, #0xe]
	mov r0, #1
	strb r0, [r7, #0xf]
_0230B248:
	cmp r8, #3
	bne _0230B2F4
	mov r0, sl
	mov r1, #0x10
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B2F4
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	ldr r0, _0230B7B8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r6, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r0, #1
	movgt r0, #0
	and r7, r0, #0xff
	mov r0, r6
	mov r2, r7
	mov r1, #0x80
	bl UpdateStateFlags
	mov r5, r0
	cmp r7, #0
	beq _0230B2D4
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7BC ; =DAMAGE_MULTIPLIER_2
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1c8]
	bl MultiplyFixedPoint64
_0230B2D4:
	cmp r5, #0
	beq _0230B2F4
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E6214
	ldr r2, _0230B7C0 ; =0x00000C4F
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230B2F4:
	cmp r8, #4
	bne _0230B3A0
	mov r0, sl
	mov r1, #0x1a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B3A0
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	ldr r0, _0230B7B8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r6, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r0, #1
	movgt r0, #0
	and r7, r0, #0xff
	mov r0, r6
	mov r2, r7
	mov r1, #2
	bl UpdateStateFlags
	mov r5, r0
	cmp r7, #0
	beq _0230B380
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7BC ; =DAMAGE_MULTIPLIER_2
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1c9]
	bl MultiplyFixedPoint64
_0230B380:
	cmp r5, #0
	beq _0230B3A0
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E61C8
#ifdef JAPAN
	ldr r2, _0230CD24 ; =0x0000098F
	mov r0, sl
	mov r1, sb
#else
	mov r0, sl
	mov r1, sb
	mov r2, #0xc50
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0230B3A0:
	cmp r8, #0xc
	bne _0230B44C
	mov r0, sl
	mov r1, #0x43
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B44C
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	ldr r0, _0230B7B8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r6, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r0, #1
	movgt r0, #0
	and r7, r0, #0xff
	mov r0, r6
	mov r2, r7
	mov r1, #0x10
	bl UpdateStateFlags
	mov r5, r0
	cmp r7, #0
	beq _0230B42C
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7BC ; =DAMAGE_MULTIPLIER_2
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1ca]
	bl MultiplyFixedPoint64
_0230B42C:
	cmp r5, #0
	beq _0230B44C
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E64C4
#ifdef JAPAN
	mov r0, sl
	mov r1, sb
	mov r2, #0x990
#else
	ldr r2, _0230B7C4 ; =0x00000C51
	mov r0, sl
	mov r1, sb
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0230B44C:
	cmp r8, #2
	bne _0230B534
	mov r0, sl
	mov r1, #0x46
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B4F8
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	ldr r0, _0230B7B8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r6, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r0, #1
	movgt r0, #0
	and r7, r0, #0xff
	mov r0, r6
	mov r2, r7
	mov r1, #0x20
	bl UpdateStateFlags
	mov r5, r0
	cmp r7, #0
	beq _0230B4D8
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7BC ; =DAMAGE_MULTIPLIER_2
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1cb]
	bl MultiplyFixedPoint64
_0230B4D8:
	cmp r5, #0
	beq _0230B4F8
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E6510
	ldr r2, _0230B7C8 ; =0x00000C52
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230B4F8:
	mov r0, sl
	mov r1, sb
	mov r2, #0x55
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B534
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7B0 ; =DAMAGE_MULTIPLIER_1_5
	ldr r3, [r0]
	mov r5, #1
	mov r0, fp
	mov r1, fp
	strb r5, [r3, #0x1cb]
	bl MultiplyFixedPoint64
_0230B534:
	ldrb r0, [r6, #0xbf]
	cmp r0, #1
	bne _0230B560
	ldr r1, _0230B7CC ; =BURN_DAMAGE_MULTIPLIER
	add r0, sp, #0x3c
	ldr r1, [r1]
	bl FixedPoint32To64
	add r2, sp, #0x3c
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
_0230B560:
	mov r0, fp
	bl FixedPoint64IsZero
	cmp r0, #0
	bne _0230B5CC
	mov r0, sl
	mov r1, r8
	bl MonsterIsType
	cmp r0, #0
	beq _0230B5CC
	ldr r1, _0230B798 ; =DUNGEON_PTR
	mov r0, sl
	ldr r2, [r1]
	mov r3, #1
	mov r1, #0x63
	strb r3, [r2, #0x1cf]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B5BC
	ldr r2, _0230B7BC ; =DAMAGE_MULTIPLIER_2
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
	b _0230B5CC
_0230B5BC:
	ldr r2, _0230B7B0 ; =DAMAGE_MULTIPLIER_1_5
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
_0230B5CC:
	mov r0, sl
	bl GetApparentWeather
	mov r5, r0
	cmp r5, #1
	bne _0230B634
	cmp r8, #2
	bne _0230B60C
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7B0 ; =DAMAGE_MULTIPLIER_1_5
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1c4]
	bl MultiplyFixedPoint64
	b _0230B634
_0230B60C:
	cmp r8, #3
	bne _0230B634
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1c4]
	bl MultiplyFixedPoint64
_0230B634:
	cmp r5, #4
	bne _0230B690
	cmp r8, #2
	bne _0230B668
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1c3]
	bl MultiplyFixedPoint64
	b _0230B690
_0230B668:
	cmp r8, #3
	bne _0230B690
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7B0 ; =DAMAGE_MULTIPLIER_1_5
	ldr r3, [r0]
	mov r7, #1
	mov r0, fp
	mov r1, fp
	strb r7, [r3, #0x1c3]
	bl MultiplyFixedPoint64
_0230B690:
	cmp r5, #3
	bne _0230B6C0
	cmp r8, #1
	beq _0230B6C0
	ldr r2, _0230B7D0 ; =CLOUDY_DAMAGE_MULTIPLIER
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
	ldr r0, _0230B798 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1c2]
_0230B6C0:
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r7, [r0]
	add r0, r7, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xcb7]
#else
	ldrb r0, [r0, #0xd5b]
#endif
	cmp r0, #0
	bne _0230B6E0
	cmp r5, #6
	bne _0230B700
_0230B6E0:
	cmp r8, #5
	bne _0230B700
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	mov r3, #1
	mov r0, fp
	mov r1, fp
	strb r3, [r7, #0x1d0]
	bl MultiplyFixedPoint64
_0230B700:
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r5, [r0]
	add r0, r5, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xcb8]
#else
	ldrb r0, [r0, #0xd5c]
#endif
	cmp r0, #0
	beq _0230B738
	cmp r8, #2
	bne _0230B738
	ldr r2, _0230B7A8 ; =DAMAGE_MULTIPLIER_0_5
	mov r3, #1
	mov r0, fp
	mov r1, fp
	strb r3, [r5, #0x1d1]
	bl MultiplyFixedPoint64
_0230B738:
	cmp r8, #5
	ldreqb r0, [r6, #0xd2]
	cmpeq r0, #0xb
	bne _0230B768
	ldr r0, _0230B798 ; =DUNGEON_PTR
	ldr r2, _0230B7BC ; =DAMAGE_MULTIPLIER_2
	ldr r3, [r0]
	mov r5, #1
	mov r0, fp
	mov r1, fp
	strb r5, [r3, #0x1d2]
	bl MultiplyFixedPoint64
_0230B768:
	mov r0, r4
_0230B76C:
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define CALC_TYPE_BASED_DAMAGE_EFFECTS_OFFSET -0x2C1
#else
#define CALC_TYPE_BASED_DAMAGE_EFFECTS_OFFSET 0
#endif
_0230B774: .word ov29_02352838
_0230B778: .word MATCHUP_IMMUNE_MULTIPLIER_ERRATIC_PLAYER
_0230B77C: .word MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER
_0230B780: .word MATCHUP_NEUTRAL_MULTIPLIER_ERRATIC_PLAYER
_0230B784: .word MATCHUP_IMMUNE_MULTIPLIER
_0230B788: .word MATCHUP_SUPER_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER
_0230B78C: .word MATCHUP_NEUTRAL_MULTIPLIER
_0230B790: .word MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER
_0230B794: .word MATCHUP_SUPER_EFFECTIVE_MULTIPLIER
_0230B798: .word DUNGEON_PTR
_0230B79C: .word TYPE_MATCHUP_COMBINATOR_TABLE
_0230B7A0: .word TINTED_LENS_MULTIPLIER
_0230B7A4: .word SOLID_ROCK_MULTIPLIER
_0230B7A8: .word DAMAGE_MULTIPLIER_0_5
_0230B7AC: .word TECHNICIAN_MOVE_POWER_THRESHOLD
_0230B7B0: .word DAMAGE_MULTIPLIER_1_5
_0230B7B4: .word 0x00000C3E + CALC_TYPE_BASED_DAMAGE_EFFECTS_OFFSET
_0230B7B8: .word 0x000003E7
_0230B7BC: .word DAMAGE_MULTIPLIER_2
_0230B7C0: .word 0x00000C4F + CALC_TYPE_BASED_DAMAGE_EFFECTS_OFFSET
#ifdef JAPAN
_0230CD24: .word 0x0000098F
#else
_0230B7C4: .word 0x00000C51
#endif
_0230B7C8: .word 0x00000C52 + CALC_TYPE_BASED_DAMAGE_EFFECTS_OFFSET
_0230B7CC: .word BURN_DAMAGE_MULTIPLIER
_0230B7D0: .word CLOUDY_DAMAGE_MULTIPLIER
	arm_func_end CalcTypeBasedDamageEffects

	arm_func_start ov29_0230B7D4
ov29_0230B7D4: ; 0x0230B7D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r4, #1
	mov r8, r2
	mov fp, #0
	bl EntityIsValid__02308FBC
	cmp r0, #0
	moveq r0, r4
	beq _0230BB98
	mov r0, sl
	mov r1, #0x6b
	ldr r7, [sl, #0xb4]
	ldr r6, [sb, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r8, r4
	cmp r8, #1
	cmpne r8, #7
	moveq fp, #1
	cmp r8, #2
	bne _0230B84C
	mov r0, sl
	mov r1, sb
	bl FlashFireShouldActivate
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B84C:
	cmp r8, #5
	bne _0230B874
	mov r0, sl
	mov r1, sb
	mov r2, #0x23
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B874:
	cmp r8, #3
	bne _0230B89C
	mov r0, sl
	mov r1, sb
	mov r2, #0x24
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B89C:
	cmp r8, #9
	bne _0230B8E0
	mov r0, sl
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230B8C8
	mov r0, sb
	bl LevitateIsActive
	cmp r0, #0
	bne _0230B8D8
_0230B8C8:
	mov r0, sb
	bl IsFloating
	cmp r0, #0
	beq _0230B8E0
_0230B8D8:
	mov r0, #1
	b _0230BB98
_0230B8E0:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl ScrappyShouldActivate
	ldr r1, _0230BBA0 ; =ov29_02352884
	str r0, [sp]
	add ip, sp, #4
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r5, #0
	b _0230B9A0
_0230B90C:
	ldr r0, [sp]
	add ip, sp, #0x14
	cmp r0, #0
	add r0, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	bne _0230B960
	cmp fp, #0
	beq _0230B960
	add r0, r6, r5
	ldrb r0, [r0, #0x5e]
	cmp r0, #0xe
	ldreqb r0, [r6, #0xfe]
	cmpeq r0, #0
	bne _0230B960
	ldr r1, _0230BBA4 ; =DUNGEON_PTR
	mov r0, #0
	ldr r2, [r1]
	mov r1, #1
	strb r1, [r2, #0x1d4]
	b _0230B978
_0230B960:
	mov r0, sl
	mov r1, sb
	mov r2, r5, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r8
	bl GetTypeMatchup
_0230B978:
	cmp r4, #0
	beq _0230B9A8
	add r1, sp, #0x14
	ldr r0, [r1, r0, lsl #2]
	mul r0, r4, r0
	add r0, r0, r0, lsr #31
	movs r4, r0, asr #1
	moveq r0, #2
	beq _0230BB98
	add r5, r5, #1
_0230B9A0:
	cmp r5, #2
	blt _0230B90C
_0230B9A8:
	cmp r8, #2
	cmpne r8, #6
	bne _0230B9D4
	mov r0, sl
	mov r1, sb
	mov r2, #2
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #2
	bne _0230BB98
_0230B9D4:
	cmp r8, #3
	bne _0230BA1C
	mov r0, sl
	mov r1, #0x10
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BA1C
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BA1C:
	cmp r8, #4
	bne _0230BA64
	mov r0, sl
	mov r1, #0x1a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BA64
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BA64:
	cmp r8, #0xc
	bne _0230BAAC
	mov r0, sl
	mov r1, #0x43
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BAAC
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BAAC:
	cmp r8, #2
	bne _0230BAF4
	mov r0, sl
	mov r1, #0x46
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BAF4
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BAF4:
	cmp r4, #0
	moveq r0, #2
	beq _0230BB98
	mov r0, sl
	mov r1, r8
	bl MonsterIsType
	cmp r0, #0
	mov r0, sl
	movne r4, r4, lsl #1
	bl GetApparentWeather
	cmp r0, #1
	bne _0230BB3C
	cmp r8, #2
	moveq r4, r4, lsl #1
	beq _0230BB3C
	cmp r8, #3
	moveq r0, #2
	beq _0230BB98
_0230BB3C:
	ldr r0, _0230BBA4 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xcb7]
#else
	ldrb r0, [r0, #0xd5b]
#endif
	cmp r0, #0
	beq _0230BB60
	cmp r8, #5
	moveq r0, #2
	beq _0230BB98
_0230BB60:
	add r0, r1, #0xc000
#ifdef JAPAN
	ldrb r0, [r0, #0xcb8]
#else
	ldrb r0, [r0, #0xd5c]
#endif
	cmp r0, #0
	beq _0230BB7C
	cmp r8, #2
	moveq r0, #2
	beq _0230BB98
_0230BB7C:
	cmp r8, #5
	ldreqb r0, [r7, #0xd2]
	cmpeq r0, #0xb
	moveq r4, r4, lsl #1
	cmp r4, #3
	movge r4, #3
	add r0, r4, #2
_0230BB98:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230BBA0: .word ov29_02352884
_0230BBA4: .word DUNGEON_PTR
_0230BBA8: .word 0x000003E7
	arm_func_end ov29_0230B7D4

	arm_func_start CalcDamage
CalcDamage: ; 0x0230BBAC
#ifdef JAPAN
#define CALC_DAMAGE_OFFSET -4
#else
#define CALC_DAMAGE_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc0
	ldr r4, _0230C450 ; =DUNGEON_PTR
	mov sl, r0
	ldr r4, [r4]
	ldr r6, [sl, #0xb4]
	ldr r8, [sp, #0xec]
	str r2, [sp, #0xc]
	mov sb, r1
	ldr r1, [sp, #0xf4]
	mov r0, r8
	str r1, [sp, #0xf4]
	ldr r1, [sp, #0xf8]
	str r3, [sp, #0x10]
	str r1, [sp, #0xf8]
	ldr r1, [sp, #0xf0]
	add r5, r4, #0x184
	ldr r7, [sb, #0xb4]
	str r1, [sp, #0x1c]
	bl ResetDamageData
	ldrb r0, [r6, #0x221 + CALC_DAMAGE_OFFSET]
	cmp r0, #0
	beq _0230BC1C
	ldr r1, _0230C454 ; =ME_FIRST_MULTIPLIER
	ldr r0, [sp, #0x1c]
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	str r0, [sp, #0x1c]
_0230BC1C:
	mov r0, sl
	mov r1, #0x5c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BC50
	ldr r0, [sp, #0xf4]
	bl IsRecoilMove
	cmp r0, #0
	ldrne r0, [sp, #0x1c]
	addne r0, r0, r0, lsl #1
	addne r0, r0, r0, lsr #31
	movne r0, r0, asr #1
	strne r0, [sp, #0x1c]
_0230BC50:
	mov r0, sl
	mov r1, #0x65
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BC84
	ldr r0, [sp, #0xf4]
	bl IsPunchMove
	cmp r0, #0
	beq _0230BC84
	ldr r0, [sp, #0x1c]
	mov r1, #0x180
	bl MultiplyByFixedPoint
	str r0, [sp, #0x1c]
_0230BC84:
	mov r0, sl
	mov r1, #0x6b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0xc]
	ldr r1, _0230C458 ; =0x000001D3
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	ldreqb r0, [r6, #0x5e]
	streq r0, [sp, #0xc]
	ldr r0, [sp, #0xf4]
	bl MoveIsNotPhysical
	str r0, [sp, #0x18]
	bl ResetDamageCalcDiagnostics
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _0230BD34
	add r0, r6, #0x100
	ldrh r1, [r0, #0x46 + CALC_DAMAGE_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + CALC_DAMAGE_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _0230BD34
	mov r0, #1
	str r0, [r8]
	mov r0, #0
	str r0, [r8, #4]
	mov r0, #2
	str r0, [r8, #8]
	ldr r0, [sp, #0xf4]
	ldr r1, [sp, #0xc]
	strb r1, [r8, #0xc]
	bl GetMoveCategory
	strb r0, [r8, #0xd]
	mov r0, #0
	strb r0, [r8, #0xe]
	strb r0, [r8, #0xf]
	strb r0, [r8, #0x10]
	b _0230D054
_0230BD34:
	ldr r1, _0230C45C ; =0x00000163
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	bne _0230BDA0
	mov r0, sl
	mov r1, sb
	mov r2, #0x35
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230BDA0
	mov r0, #1
	str r0, [r8]
	mov r0, #0
	str r0, [r8, #4]
	mov r0, #2
	str r0, [r8, #8]
	ldr r0, [sp, #0xf4]
	ldr r1, [sp, #0xc]
	strb r1, [r8, #0xc]
	bl GetMoveCategory
	strb r0, [r8, #0xd]
	mov r0, #0
	strb r0, [r8, #0xe]
	strb r0, [r8, #0xf]
	strb r0, [r8, #0x10]
	b _0230D054
_0230BDA0:
	ldr r0, [sp, #0xf4]
	ldr r1, [sp, #0xc]
	strb r1, [r8, #0xc]
	bl GetMoveCategory
	strb r0, [r8, #0xd]
	ldr r0, [sp, #0xc]
	mov r4, #0
	strb r0, [r5]
	ldr r0, [sp, #0x18]
	mov r1, #0x60
	str r0, [r5, #4]
	add r0, r6, r0, lsl #2
	ldr r0, [r0, #0x34]
	mov fp, r4
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	add r0, r7, r0, lsl #2
	ldr r0, [r0, #0x3c]
	str r0, [sp, #0x38]
	mov r0, sl
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BE40
	ldrb r1, [r7, #0x1c]
	ldrb r0, [r7, #0x1d]
	cmp r1, r0
	blo _0230BE28
	ldr r0, [sp, #0x18]
	cmp r0, #1
	ldreqb r0, [r5, #0x32]
	addeq r4, r4, #1
	addeq r0, r0, #1
	streqb r0, [r5, #0x32]
	b _0230BE40
_0230BE28:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldreqb r0, [r5, #0x32]
	addeq r4, r4, #1
	addeq r0, r0, #1
	streqb r0, [r5, #0x32]
_0230BE40:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	ldr r0, [sp, #0x18]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0x24]
	str r0, [sp, #0x44]
	beq _0230BE70
	ldr r0, [sp, #0xc]
	cmp r0, #2
	ldreqsh r0, [r6, #0x30]
	streqh r0, [r5, #0x10]
	addeq r4, r4, r0
_0230BE70:
	mov r0, sl
	mov r1, #0x22
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x34]
	mov r1, #0x23
	addne r4, r4, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x34]
	mov r0, sl
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x34]
	mov r1, #0x3c
	subne r4, r4, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x34]
	mov r0, sl
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r6, #0x166 + CALC_DAMAGE_OFFSET]
	mov r1, #0x32
	cmpne r0, #0
	ldrneb r0, [r5, #0x34]
	addne r4, r4, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x34]
	mov r0, sl
	bl NearbyAllyIqSkillIsEnabled
	cmp r0, #0
	ldr r0, [sp, #0x18]
	addne r4, r4, #1
	cmp r0, #0
	mov r0, sl
	bne _0230BFA8
	mov r1, #0x68
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BF5C
	ldrsh r0, [r6, #4]
	ldrsh r1, [r7, #4]
	bl GendersEqualNotGenderless
	cmp r0, #0
	ldrneb r0, [r5, #0x32]
	addne r4, r4, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x32]
	bne _0230BF5C
	ldrsh r0, [r6, #4]
	bl GetMonsterGenderVeneer
	cmp r0, #3
	beq _0230BF5C
	ldrsh r0, [r7, #4]
	bl GetMonsterGenderVeneer
	cmp r0, #3
	ldrneb r0, [r5, #0x32]
	subne r4, r4, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x32]
_0230BF5C:
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #1
	bne _0230C040
	mov r0, sl
	mov r1, #0x71
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230BF94
	mov r0, sl
	mov r1, #0x71
	bl OtherMonsterAbilityIsActive
	cmp r0, #0
	beq _0230C040
_0230BF94:
	add r4, r4, #1
	ldrb r0, [r5, #0x32]
	add r0, r0, #1
	strb r0, [r5, #0x32]
	b _0230C040
_0230BFA8:
	mov r1, #0x5a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BFD4
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #1
	ldreqb r0, [r5, #0x32]
	addeq r4, r4, #2
	addeq r0, r0, #2
	streqb r0, [r5, #0x32]
_0230BFD4:
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #1
	bne _0230C01C
	mov r0, sb
	mov r1, #0x71
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230C00C
	mov r0, sb
	mov r1, #0x71
	bl OtherMonsterAbilityIsActive
	cmp r0, #0
	beq _0230C01C
_0230C00C:
	add fp, fp, #1
	ldrb r0, [r5, #0x33]
	add r0, r0, #1
	strb r0, [r5, #0x33]
_0230C01C:
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #2
	bne _0230C040
	ldrb r0, [r7, #0x5e]
	cmp r0, #0xd
	ldrneb r0, [r7, #0x5f]
	cmpne r0, #0xd
	addeq fp, fp, #2
_0230C040:
	ldrsh r1, [r6, #4]
	ldr r0, _0230C460 ; =0x000001A3
	cmp r1, r0
	addeq r4, r4, #2
	cmp r1, #0x1a4
	ldr r0, _0230C464 ; =0x000001A5
	subeq r4, r4, #2
	cmp r1, r0
	ldr r0, _0230C468 ; =0x00000211
	subeq r4, r4, #2
	cmp r1, r0
	subeq r4, r4, #2
	beq _0230C07C
	cmp r1, #0x218
	addeq r4, r4, #2
_0230C07C:
	ldr r0, [sp, #0x44]
	add r0, r0, r4
	str r0, [sp, #0x44]
	ldrb r0, [r6, #0x167 + CALC_DAMAGE_OFFSET]
	cmp r0, #0
	beq _0230C0AC
	mov r0, sl
	mov r1, #0x4f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0x14
	strne r0, [sp, #0x44]
_0230C0AC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	add r0, r7, r0, lsl #1
	ldrsh r4, [r0, #0x28]
	bne _0230C0F4
	ldrb r0, [r7, #0xd2]
	mov r1, #0x31
	cmp r0, #6
	moveq r0, #1
	streqb r0, [r5, #0x51]
	mov r0, sb
	addeq fp, fp, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x35]
	subne fp, fp, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x35]
_0230C0F4:
	mov r0, sb
	mov r1, #0x22
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x35]
	mov r1, #0x23
	subne fp, fp, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x35]
	mov r0, sb
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x35]
	addne fp, fp, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x35]
	ldrsh r1, [r7, #4]
	ldr r0, _0230C460 ; =0x000001A3
	cmp r1, r0
	subeq fp, fp, #2
	cmp r1, #0x1a4
	ldr r0, _0230C464 ; =0x000001A5
	addeq fp, fp, #2
	cmp r1, r0
#ifdef JAPAN
	ldrsh r1, [r6, #4]
#endif
	ldr r0, _0230C468 ; =0x00000211
	subeq fp, fp, #2
	cmp r1, r0
	addeq fp, fp, #2
	beq _0230C170
	cmp r1, #0x218
	subeq fp, fp, #2
_0230C170:
	ldr r1, _0230C46C ; =0x000001BD
	ldr r0, [sp, #0xf4]
	add r4, r4, fp
	cmp r0, r1
	bne _0230C1F4
	ldrsh r1, [r7, #0x24]
	mov r0, #0
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldrsh r1, [r7, #0x28]
	movgt r0, r0, asr #0x10
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldrsh r1, [r7, #0x26]
	movgt r0, r0, asr #0x10
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldrsh r1, [r7, #0x2a]
	movgt r0, r0, asr #0x10
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldr r1, [sp, #0x44]
	movgt r0, r0, asr #0x10
	add r0, r1, r0
	str r0, [sp, #0x44]
_0230C1F4:
	mov r0, sl
	mov r1, #0x67
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0x100
	movne r4, #0xa
	strne r0, [sp, #0x38]
	bne _0230C23C
	mov r0, sl
	mov r1, sb
	mov r2, #0x67
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0xa
	strne r0, [sp, #0x44]
	movne r0, #0x100
	strne r0, [sp, #0x3c]
_0230C23C:
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [sp, #0x44]
	ldr r0, [sp, #0x44]
	ldr r2, _0230C470 ; =OFFENSIVE_STAT_STAGE_MULTIPLIERS
	cmp r0, #0x14
	movgt r0, #0x14
	strgt r0, [sp, #0x44]
	ldr r0, [sp, #0x44]
	strb r0, [r5, #0xa]
	add r0, r6, #0x1a
	ldrb r3, [r0, r1]
	ldr r1, [sp, #0x44]
	ldr fp, [r2, r1, lsl #2]
	ldr r1, [sp, #0x18]
	strh r3, [r5, #0xc]
	ldrb r0, [r0, r1]
	mov r1, fp
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	ldr r1, [sp, #0x3c]
	bl MultiplyByFixedPoint
	mov r0, r0, asr #8
	cmp r4, #0
	movlt r4, #0
	str r0, [sp, #0x90]
	cmp r4, #0x14
	movgt r4, #0x14
	ldr r1, [sp, #0x18]
	strb r4, [r5, #0xb]
	add r0, r7, #0x1c
	ldrb r2, [r0, r1]
	ldr r1, _0230C474 ; =DEFENSIVE_STAT_STAGE_MULTIPLIERS
	strh r2, [r5, #0xe]
	ldr r2, [sp, #0x18]
	ldr r1, [r1, r4, lsl #2]
	ldrb r0, [r0, r2]
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	ldr r1, [sp, #0x38]
	bl MultiplyByFixedPoint
	mov r0, r0, asr #8
	str r0, [sp, #0x94]
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230C314
	ldr r1, [sp, #0x18]
	mov r0, sl
	bl ExclusiveItemOffenseBoost
	ldr r1, [sp, #0x90]
	add r0, r1, r0
	str r0, [sp, #0x90]
_0230C314:
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _0230C338
	ldr r1, [sp, #0x18]
	mov r0, sb
	bl ExclusiveItemDefenseBoost
	ldr r1, [sp, #0x94]
	add r0, r1, r0
	str r0, [sp, #0x94]
_0230C338:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0230C4D8
	mov r0, sl
	mov r1, #0x1a
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C378
	ldr r0, _0230C478 ; =POWER_BAND_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x30]
	add r0, r0, r2
	strb r0, [r5, #0x30]
_0230C378:
	mov r0, sl
	mov r1, #0x32
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C3AC
	ldr r0, _0230C47C ; =MUNCH_BELT_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x30]
	add r0, r0, r2
	strb r0, [r5, #0x30]
_0230C3AC:
	mov r0, sl
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C3DC
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C3DC:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230C5E0
	mov r0, sb
	mov r1, #0x25
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C41C
	ldr r0, _0230C484 ; =DEF_SCARF_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x36]
	add r0, r0, r2
	strb r0, [r5, #0x36]
_0230C41C:
	mov r0, sb
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C5E0
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x36]
	add r0, r0, r2
	strb r0, [r5, #0x36]
	b _0230C5E0
	.align 2, 0
#ifdef JAPAN
#define CALC_DAMAGE_DATA_OFFSET -0x2C1
#else
#define CALC_DAMAGE_DATA_OFFSET 0
#endif
_0230C450: .word DUNGEON_PTR
_0230C454: .word ME_FIRST_MULTIPLIER
_0230C458: .word 0x000001D3
_0230C45C: .word 0x00000163
_0230C460: .word 0x000001A3
_0230C464: .word 0x000001A5
_0230C468: .word 0x00000211
_0230C46C: .word 0x000001BD
_0230C470: .word OFFENSIVE_STAT_STAGE_MULTIPLIERS
_0230C474: .word DEFENSIVE_STAT_STAGE_MULTIPLIERS
_0230C478: .word POWER_BAND_STAT_BOOST
_0230C47C: .word MUNCH_BELT_STAT_BOOST
_0230C480: .word AURA_BOW_STAT_BOOST
_0230C484: .word DEF_SCARF_STAT_BOOST
_0230C488: .word ZINC_BAND_STAT_BOOST
_0230C48C: .word SPECIAL_BAND_STAT_BOOST
_0230C490: .word 0x00000C53 + CALC_DAMAGE_DATA_OFFSET
_0230C494: .word 0x00000C54 + CALC_DAMAGE_DATA_OFFSET
_0230C498: .word 0x00000C55 + CALC_DAMAGE_DATA_OFFSET
_0230C49C: .word 0x000003E7
_0230C4A0: .word DAMAGE_FORMULA_FLV_DEFICIT_DIVISOR
_0230C4A4: .word ov29_02352984
_0230C4A8: .word ov29_02352990
_0230C4AC: .word ov29_0235299C
_0230C4B0: .word DAMAGE_FORMULA_AT_PREFACTOR
_0230C4B4: .word DAMAGE_FORMULA_DEF_PREFACTOR
_0230C4B8: .word DAMAGE_FORMULA_FLV_SHIFT
_0230C4BC: .word DAMAGE_FORMULA_LN_ARG_PREFACTOR
_0230C4C0: .word DAMAGE_FORMULA_LN_PREFACTOR
_0230C4C4: .word DAMAGE_FORMULA_CONSTANT_SHIFT
_0230C4C8: .word DAMAGE_FORMULA_NON_TEAM_MEMBER_MODIFIER
_0230C4CC: .word DAMAGE_FORMULA_MAX_BASE
_0230C4D0: .word ov29_02352838
_0230C4D4: .word DAMAGE_FORMULA_MIN_BASE
_0230C4D8:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230C548
	mov r0, sb
	mov r1, #0x29
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C518
	ldr r0, _0230C488 ; =ZINC_BAND_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x37]
	add r0, r0, r2
	strb r0, [r5, #0x37]
_0230C518:
	mov r0, sb
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C548
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x36]
	add r0, r0, r2
	strb r0, [r5, #0x36]
_0230C548:
	mov r0, sl
	mov r1, #0x28
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C57C
	ldr r0, _0230C48C ; =SPECIAL_BAND_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C57C:
	mov r0, sl
	mov r1, #0x32
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C5B0
	ldr r0, _0230C47C ; =MUNCH_BELT_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C5B0:
	mov r0, sb
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C5E0
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C5E0:
	ldr r0, [sp, #0x10]
	mov r1, fp
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	ldr r1, [sp, #0x3c]
	bl MultiplyByFixedPoint
	mov r1, r0
	add r0, sp, #0xa0
	bl FixedPoint32To64
	mov r0, #0x64
	bl DungeonRandInt
	mov r4, #1
	str r0, [sp, #0x40]
	add r0, r6, #0x100
	ldrh r1, [r0, #0x5a + CALC_DAMAGE_OFFSET]
	mov fp, r4
	str r4, [sp, #0x28]
	bic r1, r1, #0x100
	strh r1, [r0, #0x5a + CALC_DAMAGE_OFFSET]
	ldrh r1, [r0, #0x58 + CALC_DAMAGE_OFFSET]
	str r4, [sp, #0x2c]
	bic r1, r1, #0x100
	strh r1, [r0, #0x58 + CALC_DAMAGE_OFFSET]
	ldr r0, [sp, #0xf4]
	bl MoveIsNotPhysical
	str r0, [sp, #0x30]
	cmp r0, #0
	bne _0230C6B8
	mov r0, sl
	mov r1, #0x11
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C6B8
	ldr r0, [sl, #0xb4]
	mov r1, r4
	str r0, [sp, #0x24]
	mov r0, sl
	bl MonsterHasNegativeStatus
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x48]
	mov r1, r4
	bl UpdateStateFlags
	ldr r1, [sp, #0x48]
	cmp r1, #0
	movne r4, r4, lsl #1
	cmp r0, #0
	beq _0230C6B8
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E6130
	mov r0, sl
	mov r1, sb
	ldr r2, _0230C490 ; =0x00000C53
	bl LogMessageByIdWithPopupCheckUserTarget
_0230C6B8:
	mov r0, sl
	mov r1, #0x22
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230C6E0
	mov r0, sl
	mov r1, #0x4b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C748
_0230C6E0:
	ldr r0, [sp, #0x40]
	cmp r0, #0x21
	ldr r0, [sl, #0xb4]
	bge _0230C700
	ldr r1, [sp, #0x30]
	cmp r1, #0
	moveq r1, #1
	beq _0230C704
_0230C700:
	mov r1, #0
_0230C704:
	and r1, r1, #0xff
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x34]
	mov r1, #0x100
	bl UpdateStateFlags
	ldr r1, [sp, #0x34]
	cmp r1, #0
	addne r4, r4, r4, lsl #1
	movne fp, fp, lsl #1
	cmp r0, #0
	beq _0230C748
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E617C
	mov r0, sl
	mov r1, sb
	ldr r2, _0230C494 ; =0x00000C54
	bl LogMessageByIdWithPopupCheckUserTarget
_0230C748:
	mov r0, sl
	mov r1, #0x30
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C76C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	addeq r4, r4, r4, lsl #1
	moveq fp, fp, lsl #1
_0230C76C:
	ldr r0, [sl, #0xb4]
	mov r1, #0x38
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x14]
	movne r0, #0
	strne r0, [sp, #0x14]
	mov r0, sl
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C7D4
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _0230C7D4
	ldr r0, _0230C450 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r0, r0, #0x3000
#ifdef JAPAN
	ldrb r0, [r0, #0xd92]
#else
	ldrb r0, [r0, #0xe36]
#endif
	cmp r0, #0
	movne r0, #0xa
	mulne r0, fp, r0
	rsbne r4, r4, r4, lsl #4
	movne fp, r0
_0230C7D4:
	mov r0, sl
	mov r1, #0x3f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C820
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _0230C820
	ldr r0, _0230C450 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r0, r0, #0x3000
#ifdef JAPAN
	ldrb r0, [r0, #0xd90]
#else
	ldrb r0, [r0, #0xe34]
#endif
	cmp r0, #0
	movne r0, #0xa
	mulne r0, fp, r0
	rsbne r4, r4, r4, lsl #4
	movne fp, r0
_0230C820:
	mov r0, sl
	mov r1, sb
	mov r2, #6
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230C84C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	moveq r4, r4, lsl #2
	addeq fp, fp, fp, lsl #2
_0230C84C:
	mov r0, sl
	mov r1, sb
	mov r2, #0x34
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230C8E0
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _0230C8E0
	ldr r0, [sb, #0xb4]
	mov r1, #1
	str r0, [sp, #0x20]
	mov r0, sb
	bl MonsterHasNegativeStatus
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x4c]
	mov r1, #8
	bl UpdateStateFlags
	ldr r1, [sp, #0x4c]
	cmp r1, #0
	beq _0230C8C0
	ldr r1, [sp, #0x28]
	add r1, r1, r1, lsl #1
	str r1, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	mov r1, r1, lsl #1
	str r1, [sp, #0x2c]
_0230C8C0:
	cmp r0, #0
	beq _0230C8E0
	mov r0, sb
	bl PlayEffectAnimation0x18E
	mov r0, sl
	mov r1, sb
	ldr r2, _0230C498 ; =0x00000C55
	bl LogMessageByIdWithPopupCheckUserTarget
_0230C8E0:
	add r0, sp, #0x90
	ldr r2, [r0]
	add r1, sp, #0x94
	mul r0, r2, r4
	ldr r3, [r1]
	ldr r2, [sp, #0x28]
	cmp fp, #1
	mul r2, r3, r2
	str r2, [r1]
	add r1, sp, #0x90
	str r0, [r1]
	beq _0230C920
	mov r1, fp
	bl _s32_div_f
	add r1, sp, #0x90
	str r0, [r1]
_0230C920:
	ldr r0, [sp, #0x2c]
	cmp r0, #1
	beq _0230C940
	add r4, sp, #0x94
	mov r1, r0
	ldr r0, [r4]
	bl _s32_div_f
	str r0, [r4]
_0230C940:
	ldr r0, [sp, #0x90]
	strh r0, [r5, #0x12]
	ldr r0, [sp, #0x94]
	strh r0, [r5, #0x14]
	ldr r0, [sp, #0x90]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [sp, #0x90]
	ldr r1, [sp, #0x90]
	ldr r0, _0230C49C ; =0x000003E7
	cmp r1, r0
	strge r0, [sp, #0x90]
	ldr r1, [sp, #0x94]
	add r0, sp, #0x98
	strh r1, [r5, #0x1a]
	ldr r1, [sp, #0x94]
	bl IntToFixedPoint64
	ldr r2, [sp, #0x90]
	ldr r1, [sp, #0x94]
	add r0, sp, #0x88
	sub r1, r2, r1
	bl IntToFixedPoint64
	ldr r1, _0230C4A0 ; =DAMAGE_FORMULA_FLV_DEFICIT_DIVISOR
	add r0, sp, #0x80
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x88
	add r2, sp, #0x80
	mov r1, r0
	bl DivideFixedPoint64
	ldrb r1, [r6, #0xa]
	add r0, sp, #0x80
	bl IntToFixedPoint64
	add r0, sp, #0xa8
	add r1, sp, #0x80
	add r2, sp, #0x88
	bl AddFixedPoint64
	ldr r1, [sp, #0x90]
	add r0, sp, #0x80
	bl IntToFixedPoint64
	add r0, sp, #0xa0
	add r2, sp, #0x80
	mov r1, r0
	bl AddFixedPoint64
	add r0, sp, #0xa0
	bl FixedPoint64ToInt
	strh r0, [r5, #0x18]
	ldrb r1, [r6, #0xa]
	add r0, sp, #0xa8
	strh r1, [r5, #0x16]
	bl FixedPoint64ToInt
	strh r0, [r5, #0x1c]
	add r0, sp, #0xa8
	bl FixedPoint64ToInt
	mov r1, r0
	ldr r0, _0230C4A4 ; =ov29_02352984
	bl Debug_Print0
	add r0, sp, #0xa0
	bl FixedPoint64ToInt
	mov r1, r0
	ldr r0, _0230C4A8 ; =ov29_02352990
	bl Debug_Print0
	add r0, sp, #0x98
	bl FixedPoint64ToInt
	mov r1, r0
	ldr r0, _0230C4AC ; =ov29_0235299C
	bl Debug_Print0
	ldr r1, _0230C4B0 ; =DAMAGE_FORMULA_AT_PREFACTOR
	add r0, sp, #0x70
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x70
	add r1, sp, #0xa0
	mov r2, r0
	bl MultiplyFixedPoint64
	ldr r1, _0230C4B4 ; =DAMAGE_FORMULA_DEF_PREFACTOR
	add r0, sp, #0x68
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x68
	add r1, sp, #0x98
	mov r2, r0
	bl MultiplyFixedPoint64
	ldr r1, _0230C4B8 ; =DAMAGE_FORMULA_FLV_SHIFT
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x60
	add r1, sp, #0xa8
	add r2, sp, #0x78
	bl AddFixedPoint64
	ldr r1, _0230C4BC ; =DAMAGE_FORMULA_LN_ARG_PREFACTOR
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x60
	add r2, sp, #0x78
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0x60
	bl FixedPoint64ToInt
	mov r1, r0
	add r0, sp, #0x60
	bl ClampedLn
	ldr r1, _0230C4C0 ; =DAMAGE_FORMULA_LN_PREFACTOR
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x60
	add r2, sp, #0x78
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xb0
	add r1, sp, #0x68
	add r2, sp, #0x70
	bl AddFixedPoint64
	add r0, sp, #0xb0
	add r2, sp, #0x60
	mov r1, r0
	bl AddFixedPoint64
	ldr r1, _0230C4C4 ; =DAMAGE_FORMULA_CONSTANT_SHIFT
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0xb0
	add r2, sp, #0x78
	mov r1, r0
	bl AddFixedPoint64
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	bne _0230CB78
	ldrb r0, [r6, #6]
	cmp r0, #0
	beq _0230CB78
	ldr r1, _0230C4C8 ; =DAMAGE_FORMULA_NON_TEAM_MEMBER_MODIFIER
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0xb0
	add r2, sp, #0x78
	mov r1, r0
	bl DivideFixedPoint64
_0230CB78:
	ldr r0, _0230C4CC ; =DAMAGE_FORMULA_MAX_BASE
	add r1, sp, #0xb0
	bl FixedPoint64CmpLt
	cmp r0, #0
	ldrne r0, _0230C4D0 ; =ov29_02352838
	ldrne r1, [r0, #0x38]
	ldrne r0, [r0, #0x34]
	strne r1, [sp, #0xb4]
	strne r0, [sp, #0xb0]
	ldr r1, _0230C4D4 ; =DAMAGE_FORMULA_MIN_BASE
	add r0, sp, #0xb0
	bl FixedPoint64CmpLt
	cmp r0, #0
	ldrne r0, _0230C4D0 ; =ov29_02352838
	ldrne r1, [r0, #0x48]
	ldrne r0, [r0, #0x44]
	strne r1, [sp, #0xb4]
	strne r0, [sp, #0xb0]
	ldr r0, [sp, #0xf4]
	bl IsRegularAttackOrProjectile
	cmp r0, #0
	ldr r0, [sp, #0xc]
	movne r1, #1
	str r0, [sp]
	moveq r1, #0
	and r1, r1, #0xff
	str r8, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, sp, #0xb8
	mov r1, sl
	mov r2, sb
	bl CalcTypeBasedDamageEffects
	mov fp, r0
	ldr r0, [sp, #0xc]
	cmp r0, #2
	bne _0230CC78
	mov r0, sl
	mov r1, sb
	bl FlashFireShouldActivate
	movs r4, r0
	beq _0230CC78
	ldrb r0, [r7, #0x15c + CALC_DAMAGE_OFFSET]
	cmp r0, #0
	bne _0230CC78
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230CC78
	mov r0, #1
	mov r1, sb
	strb r0, [r7, #0x15c + CALC_DAMAGE_OFFSET]
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	cmp r4, #1
	bne _0230CC68
	ldr r2, _0230D05C ; =0x00000C58
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230CC78
_0230CC68:
	ldr r2, _0230D060 ; =0x00000C57
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230CC78:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230CD3C
	mov r0, sl
	mov r1, #0x44
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	bne _0230CD3C
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0230CCF0
	ldr r0, [sp, #0xf4]
	cmp r0, #0x48
	beq _0230CCBC
	ldrb r0, [r7, #0xd5]
	cmp r0, #1
	beq _0230CCD0
_0230CCBC:
	mov r0, sb
	mov r1, #0x1e
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230CCF0
_0230CCD0:
	mov r0, sb
	bl PlayEffectAnimation0x171
	add r0, sp, #0xb8
	ldr r2, _0230D064 ; =DAMAGE_MULTIPLIER_0_5
	mov r1, r0
	bl MultiplyFixedPoint64
	mov r0, #1
	strb r0, [r5, #0x3a]
_0230CCF0:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0230CD3C
	ldrb r0, [r7, #0xd5]
	cmp r0, #3
	beq _0230CD1C
	mov r0, sb
	mov r1, #0x1f
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230CD3C
_0230CD1C:
	mov r0, sb
	bl PlayEffectAnimation0x171Full
	add r0, sp, #0xb8
	ldr r2, _0230D064 ; =DAMAGE_MULTIPLIER_0_5
	mov r1, r0
	bl MultiplyFixedPoint64
	mov r0, #1
	strb r0, [r5, #0x3b]
_0230CD3C:
	ldrb r0, [r7, #0xd5]
	cmp r0, #0x11
	beq _0230CEEC
	mov r0, sl
	mov r1, sb
	mov r2, #0xc
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	bne _0230CEEC
	mov r0, sl
	mov r1, sb
	mov r2, #0x13
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	bne _0230CEEC
	mov r0, sb
	mov r1, #0x40
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0230CEEC
	ldrsh r0, [r6, #2]
	bl GetMonsterGenderVeneer
	cmp r0, #2
	ldrne r1, [sp, #0xe8]
	ldreq r4, [sp, #0xe8]
	addne r0, r1, r1, lsr #31
	addne r4, r1, r0, asr #1
	ldrb r0, [r6, #0xec]
	cmp r0, #4
	moveq r0, #1
	streqb r0, [r5, #0x3c]
	ldreq r4, _0230C49C ; =0x000003E7
	beq _0230CE74
	mov r0, sl
	mov r1, #0x13
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	bne _0230CDF0
	mov r0, sl
	mov r1, #0x1d
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230CE04
_0230CDF0:
	ldr r0, _0230D068 ; =SCOPE_LENS_CRIT_RATE_BOOST
	mov r1, #1
	ldrsh r0, [r0]
	strb r1, [r5, #0x38]
	add r4, r4, r0
_0230CE04:
	mov r0, sl
	mov r1, #0x58
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, _0230D06C ; =SUPER_LUCK_CRIT_RATE_BOOST
	movne r1, #1
	ldrnesh r0, [r0]
	strneb r1, [r5, #0x49]
	mov r1, #0x14
	addne r4, r4, r0
	mov r0, sb
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	ldrne r0, _0230D068 ; =SCOPE_LENS_CRIT_RATE_BOOST
	movne r1, #1
	ldrnesh r0, [r0]
	strneb r1, [r5, #0x39]
	addne r4, r4, r0
	cmp fp, #0
	beq _0230CE74
	mov r0, sl
	mov r1, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _0230D070 ; =TYPE_ADVANTAGE_MASTER_CRIT_RATE
	movne r1, #1
	ldrnesh r4, [r0]
	strneb r1, [r5, #0x3d]
_0230CE74:
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, r4
	bge _0230CEEC
	mov r2, #1
	mov r4, #5
	mov r0, sl
	mov r1, sb
#ifdef JAPAN
	add r3, r2, #0xb00
#else
	add r3, r2, #0xdc0
#endif
	str r4, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _0230CEEC
	mov r2, #1
	mov r0, sl
	mov r1, #0x5d
	strb r2, [r8, #0xe]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	add r0, sp, #0xb8
	beq _0230CEE0
	ldr r2, _0230D074 ; =DAMAGE_MULTIPLIER_2
	mov r1, r0
	bl MultiplyFixedPoint64
	mov r0, #1
	strb r0, [r5, #0x4a]
	b _0230CEEC
_0230CEE0:
	ldr r2, _0230D078 ; =DAMAGE_MULTIPLIER_1_5
	mov r1, r0
	bl MultiplyFixedPoint64
_0230CEEC:
	add r0, sp, #0xb0
	bl FixedPoint64ToInt
	str r0, [r5, #0x24]
	add r0, sp, #0xb0
	add r2, sp, #0xb8
	mov r1, r0
	bl MultiplyFixedPoint64
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x58
	mov r2, r1
	str r2, [r5, #0x2c]
	bl FixedPoint32To64
	add r0, sp, #0xb0
	add r2, sp, #0x58
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xb0
	bl FixedPoint64ToInt
	str r0, [r5, #0x20]
	mov r0, #0x4000
	bl DungeonRandInt
	add r0, r0, #0xe000
	mov r1, #0
	str r0, [sp, #0xbc]
	add r0, sp, #0xb0
	str r1, [sp, #0xb8]
	add r2, sp, #0xb8
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0x50
	mov r1, #0x64
	bl IntToFixedPoint64
	add r0, sp, #0xb8
	add r1, sp, #0x50
	mov r2, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xb8
	bl FixedPoint64ToInt
	str r0, [r5, #0x28]
	add r0, sp, #0xb0
	bl FixedPoint64ToInt
	str r0, [r8]
	ldr r1, _0230D07C ; =0x00000195
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	bne _0230CFBC
	ldr r0, [r8]
	mov r1, #0x80
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	bl RoundUpDiv256
	str r0, [r8]
_0230CFBC:
	ldr r1, _0230D07C ; =0x00000195
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	bne _0230CFFC
	mov r0, sl
	mov r1, #0x2f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230CFFC
	ldr r0, _0230D080 ; =POWER_PITCHER_DAMAGE_MULTIPLIER
	ldr r2, [r8]
	ldr r1, [r0]
	mov r0, r2, lsl #8
	bl MultiplyByFixedPoint
	bl RoundUpDiv256
	str r0, [r8]
_0230CFFC:
	ldr r0, [r8]
	cmp r0, #0
	ble _0230D038
	mov r0, sl
	mov r1, #0x5b
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230D038
	ldr r0, _0230D084 ; =AIR_BLADE_DAMAGE_MULTIPLIER
	ldr r2, [r8]
	ldr r1, [r0]
	mov r0, r2, lsl #8
	bl MultiplyByFixedPoint
	bl RoundUpDiv256
	str r0, [r8]
_0230D038:
	mov r1, #0
	str r1, [r8, #4]
	ldr r0, [r8]
	cmp r0, #0
	streqb r1, [r8, #0xe]
	ldrb r0, [r8, #0xe]
	strb r0, [r7, #0x167 + CALC_DAMAGE_OFFSET]
_0230D054:
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230D05C: .word 0x00000C58 + CALC_DAMAGE_DATA_OFFSET
_0230D060: .word 0x00000C57 + CALC_DAMAGE_DATA_OFFSET
_0230D064: .word DAMAGE_MULTIPLIER_0_5
_0230D068: .word SCOPE_LENS_CRIT_RATE_BOOST
_0230D06C: .word SUPER_LUCK_CRIT_RATE_BOOST
_0230D070: .word TYPE_ADVANTAGE_MASTER_CRIT_RATE
_0230D074: .word DAMAGE_MULTIPLIER_2
_0230D078: .word DAMAGE_MULTIPLIER_1_5
_0230D07C: .word 0x00000195
_0230D080: .word POWER_PITCHER_DAMAGE_MULTIPLIER
_0230D084: .word AIR_BLADE_DAMAGE_MULTIPLIER
	arm_func_end CalcDamage

	arm_func_start ov29_0230D088
ov29_0230D088: ; 0x0230D088
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x1c
	ldr r5, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov lr, r0
	strb r2, [r5, #0xc]
	cmp r4, #1
	strb r3, [r5, #0xd]
	mov ip, r1
	str r2, [sp]
	mov r2, ip
	ldr r0, _0230D118 ; =0x000003E7
	movlt r4, #1
	cmp r4, r0
	movgt r4, r0
	add r0, sp, #0x14
	mov r1, lr
	mov r3, r4
	str r5, [sp, #4]
	mov ip, #0
	str ip, [sp, #8]
	bl CalcTypeBasedDamageEffects
	add r0, sp, #0xc
	mov r1, r4
	bl IntToFixedPoint64
	add r0, sp, #0xc
	add r2, sp, #0x14
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xc
	bl FixedPoint64ToInt
	str r0, [r5]
	mov r0, #0
	str r0, [r5, #4]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230D118: .word 0x000003E7
	arm_func_end ov29_0230D088

	arm_func_start ApplyDamageAndEffectsWrapper
ApplyDamageAndEffectsWrapper: ; 0x0230D11C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xdc
	mov r7, r0
	add r0, sp, #0x10
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ResetDamageData
	add r0, sp, #0x24
	bl ov29_022E2470
	mov r3, #0
	mov r0, #2
	str r0, [sp, #0x18]
	str r6, [sp, #0x10]
	str r5, [sp, #0x14]
	strb r3, [sp, #0x1c]
	strb r3, [sp, #0x1e]
	strb r3, [sp, #0x1f]
	strb r3, [sp, #0x20]
	stmia sp, {r3, r4}
	str r3, [sp, #8]
	mov r1, r7
	add r0, sp, #0x24
	add r2, sp, #0x10
	str r3, [sp, #0xc]
	bl ApplyDamageAndEffects
	add sp, sp, #0xdc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ApplyDamageAndEffectsWrapper

	arm_func_start CalcRecoilDamageFixed
CalcRecoilDamageFixed: ; 0x0230D18C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230D238
	ldr r0, [r7]
	cmp r0, #1
	bne _0230D1F0
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	beq _0230D238
	mov r0, r7
	mov r1, #0x5c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230D1F0
	mov r0, r6, lsl #8
	mov r1, #0x180
	bl MultiplyByFixedPoint
	mov r6, r0, asr #8
_0230D1F0:
	ldrb r1, [sp, #0x34]
	str r4, [sp]
	ldrsh r0, [sp, #0x38]
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	ldr r1, [sp, #0x3c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x10]
	ldr r4, [sp, #0x44]
	str r0, [sp, #0x14]
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r4, [sp, #0x18]
	bl CalcDamageFixed
_0230D238:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end CalcRecoilDamageFixed

	arm_func_start CalcDamageFixed
CalcDamageFixed: ; 0x0230D240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x2c
	mov sl, r0
	add r0, sp, #0x18
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x54]
	bl ResetDamageData
	mov r5, #0
	ldrb r0, [sp, #0x58]
	ldr r1, [sp, #0x60]
	mov r2, #2
	str r2, [sp, #0x20]
	str r1, [sp, #0x1c]
	strb r6, [sp, #0x24]
	strb r5, [sp, #0x26]
	strb r5, [sp, #0x27]
	strb r0, [sp, #0x25]
	cmp r6, #0
	beq _0230D2F8
	add r4, sp, #0x10
_0230D298:
	mov r2, r5, lsl #0x10
	mov r0, sl
	mov r1, sb
	mov r3, r6
	mov r2, r2, asr #0x10
	bl GetTypeMatchup
	str r0, [r4, r5, lsl #2]
	add r5, r5, #1
	cmp r5, #2
	blt _0230D298
	mov r0, sl
	mov r1, sb
	mov r2, #0x35
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230D2F8
	ldr r2, [sp, #0x10]
	ldr r0, _0230D39C ; =TYPE_MATCHUP_COMBINATOR_TABLE
	ldr r1, [sp, #0x14]
	add r0, r0, r2, lsl #4
	ldr r0, [r0, r1, lsl #2]
	cmp r0, #3
	movne r8, #0
_0230D2F8:
	ldrsh r1, [sp, #0x5c]
	ldr r0, _0230D3A0 ; =0x00000256
	mov r8, r8, lsl #8
	cmp r1, r0
	bne _0230D334
	mov r0, sl
	mov r1, #0x2f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230D334
	ldr r1, _0230D3A4 ; =POWER_PITCHER_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	mov r8, r0
_0230D334:
	mov r0, r8
	bl RoundUpDiv256
	str r0, [sp, #0x18]
	cmp r8, #0
	moveq r0, #1
	streqb r0, [sp, #0x28]
	movne r0, #0
	strneb r0, [sp, #0x28]
	ldrsh r1, [sp, #0x5c]
	str r7, [sp]
	ldr r0, [sp, #0x64]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r4, [sp, #0x68]
	add r2, sp, #0x18
	mov r0, sl
	mov r1, sb
	mov r3, #0
	str r4, [sp, #0xc]
	bl ApplyDamageAndEffects
	ldr r1, [sp, #0x50]
	cmp r1, #0
	ldrneb r0, [sp, #0x28]
	strneb r0, [r1]
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0230D39C: .word TYPE_MATCHUP_COMBINATOR_TABLE
_0230D3A0: .word 0x00000256
_0230D3A4: .word POWER_PITCHER_DAMAGE_MULTIPLIER
	arm_func_end CalcDamageFixed

	arm_func_start CalcDamageFixedNoCategory
CalcDamageFixedNoCategory: ; 0x0230D3A8
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	ldr lr, [sp, #0x20]
	ldrb ip, [sp, #0x24]
	str lr, [sp]
	ldrsh lr, [sp, #0x28]
	str ip, [sp, #4]
	mov ip, #3
	str ip, [sp, #8]
	ldr ip, [sp, #0x2c]
	str lr, [sp, #0xc]
	ldr lr, [sp, #0x30]
	str ip, [sp, #0x10]
	ldr ip, [sp, #0x34]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	bl CalcDamageFixed
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	arm_func_end CalcDamageFixedNoCategory

	arm_func_start CalcDamageFixedWrapper
CalcDamageFixedWrapper: ; 0x0230D3F4
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	ldr ip, [sp, #0x20]
	ldrb lr, [sp, #0x24]
	str ip, [sp]
	ldrb ip, [sp, #0x28]
	str lr, [sp, #4]
	ldrsh lr, [sp, #0x2c]
	str ip, [sp, #8]
	ldr ip, [sp, #0x30]
	str lr, [sp, #0xc]
	ldr lr, [sp, #0x34]
	str ip, [sp, #0x10]
	ldr ip, [sp, #0x38]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	bl CalcDamageFixed
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	arm_func_end CalcDamageFixedWrapper

	arm_func_start UpdateShopkeeperModeAfterAttack
UpdateShopkeeperModeAfterAttack: ; 0x0230D440
	ldr r2, [r1, #0xb4]
	ldrb r1, [r2, #9]
	cmp r1, #0
	bxeq lr
	ldr r1, [r0]
	cmp r1, #1
	bxne lr
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #2
	strneb r0, [r2, #9]
	moveq r0, #3
	streqb r0, [r2, #9]
	bx lr
	arm_func_end UpdateShopkeeperModeAfterAttack

	arm_func_start UpdateShopkeeperModeAfterTrap
UpdateShopkeeperModeAfterTrap: ; 0x0230D47C
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #9]
	cmp r0, #0
	bxeq lr
	cmp r1, #0
	movne r0, #2
	strneb r0, [r2, #9]
	moveq r0, #3
	streqb r0, [r2, #9]
	bx lr
	arm_func_end UpdateShopkeeperModeAfterTrap

	arm_func_start ov29_0230D4A4
ov29_0230D4A4: ; 0x0230D4A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r1, #0xe
	mov r5, r2
	ldr r4, [r6, #0xb4]
	bl MonsterIsType
	cmp r0, #0
	beq _0230D4E8
	cmp r5, #1
	cmpne r5, #7
	bne _0230D4E8
	ldrb r0, [r4, #0xfe]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0230D4E8:
	mov r4, #0
	b _0230D518
_0230D4F0:
	mov r2, r4, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, r2, asr #0x10
	bl GetTypeMatchup
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r4, r4, #1
_0230D518:
	cmp r4, #2
	blt _0230D4F0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0230D4A4

	arm_func_start ResetDamageCalcDiagnostics
ResetDamageCalcDiagnostics: ; 0x0230D528
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0230D614 ; =DUNGEON_PTR
	mov r1, #0x54
	ldr r4, [r0]
	add r5, r4, #0x184
	mov r0, r5
	bl MemZero
	mov r1, #0
	strb r1, [r4, #0x184]
	str r1, [r5, #4]
	strb r1, [r5, #8]
	strb r1, [r5, #9]
	mov r0, #0xa
	strb r0, [r5, #0xa]
	strb r0, [r5, #0xb]
	mov r0, #1
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x12]
	strh r1, [r5, #0x16]
	strh r1, [r5, #0x1c]
	str r1, [r5, #0x20]
	str r1, [r5, #0x28]
	str r1, [r5, #0x2c]
	strb r1, [r5, #0x30]
	strb r1, [r5, #0x31]
	strb r1, [r5, #0x36]
	strb r1, [r5, #0x37]
	strb r1, [r5, #0x34]
	strb r1, [r5, #0x35]
	strb r1, [r5, #0x38]
	strb r1, [r5, #0x39]
	strb r1, [r5, #0x3a]
	strb r1, [r5, #0x3b]
	strb r1, [r5, #0x3c]
	strb r1, [r5, #0x3d]
	strb r1, [r5, #0x3e]
	strb r1, [r5, #0x40]
	strb r1, [r5, #0x3f]
	strb r1, [r5, #0x41]
	strb r1, [r5, #0x42]
	strb r1, [r5, #0x43]
	strb r1, [r5, #0x44]
	strb r1, [r5, #0x45]
	strb r1, [r5, #0x46]
	strb r1, [r5, #0x47]
	strb r1, [r5, #0x48]
	strb r1, [r5, #0x4b]
	strb r1, [r5, #0x4c]
	strb r1, [r5, #0x4d]
	strb r1, [r5, #0x4e]
	strb r1, [r5, #0x4f]
	strb r1, [r5, #0x50]
	strb r1, [r5, #0x51]
	strb r1, [r5, #0x32]
	strb r1, [r5, #0x33]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D614: .word DUNGEON_PTR
	arm_func_end ResetDamageCalcDiagnostics

	arm_func_start ov29_0230D618
ov29_0230D618: ; 0x0230D618
	ldr r1, _0230D624 ; =ov29_02352894
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0230D624: .word ov29_02352894
	arm_func_end ov29_0230D618

	arm_func_start ov29_0230D628
ov29_0230D628: ; 0x0230D628
	stmdb sp!, {r3, lr}
	ldr r1, _0230D650 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
#ifdef JAPAN
	ldr r1, [r1, #0x188]
#else
	ldr r1, [r1, #0x22c]
#endif
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	bl PointCameraToMonster
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D650: .word DUNGEON_PTR
	arm_func_end ov29_0230D628

	arm_func_start ov29_0230D654
ov29_0230D654: ; 0x0230D654
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230D678
	mov r0, r4
	bl EntityIsValid__02308FBC
	cmp r0, #0
	bne _0230D680
_0230D678:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0230D680:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230D654

	arm_func_start ov29_0230D688
ov29_0230D688: ; 0x0230D688
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldrh r3, [r4]
	mov r1, #0x55
	mov r2, #2
	strh r3, [sp]
	ldrh r3, [r4, #2]
	strh r3, [sp, #2]
	ldrh r3, [r4, #4]
	strh r3, [sp, #4]
	bl GenerateStandardItem
	mov r0, r4
	bl SetItemAcquired
	ldrb r0, [sp, #1]
	strb r0, [r4, #1]
	cmp r0, #0
	beq _0230D6FC
	add r0, sp, #0
	bl GetEquivItemIndex
	cmp r0, #0
	blt _0230D6FC
	bl GetItemAtIdx
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
_0230D6FC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230D688

	arm_func_start ov29_0230D704
ov29_0230D704: ; 0x0230D704
	mov r0, #0
	bx lr
	arm_func_end ov29_0230D704

	arm_func_start ov29_0230D70C
ov29_0230D70C: ; 0x0230D70C
	stmdb sp!, {r3, lr}
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0230D734 ; =ov10_022C45B4
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D734: .word ov10_022C45B4
	arm_func_end ov29_0230D70C

	arm_func_start ov29_0230D738
ov29_0230D738: ; 0x0230D738
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _0230D760
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0230D768 ; =ov10_022C45B4
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #1
	ldmltia sp!, {r3, pc}
_0230D760:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D768: .word ov10_022C45B4
	arm_func_end ov29_0230D738

	arm_func_start ov29_0230D76C
ov29_0230D76C: ; 0x0230D76C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsMonster__0230A994
	cmp r0, #0
	beq _0230D798
	mov r0, r5
	bl IsMonster__0230A994
	cmp r0, #0
	bne _0230D7A0
_0230D798:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0230D7A0:
	ldr r0, [r6, #0xb4]
	ldr r1, [r5, #0xb4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r1, #2]
	bl GendersNotEqualNotGenderless
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov29_0230D738
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0230D76C

	arm_func_start ov29_0230D7D4
ov29_0230D7D4: ; 0x0230D7D4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r2, _0230D870 ; =ov29_023535D4
	mvn r1, #0
	ldrsh r3, [r2]
	mov r4, r0
	cmp r3, r1
	beq _0230D808
	ldrsh r0, [r2]
	bl ov10_022BDE50
	ldr r0, _0230D870 ; =ov29_023535D4
	mvn r1, #0
	strh r1, [r0]
_0230D808:
	mov r2, #0
	mov r1, #1
	str r2, [sp]
	stmib sp, {r1, r2}
	mov r0, r4
	rsb r1, r1, #0x2b8
	mov r3, #3
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mvn r0, #0
	cmp r5, r0
	beq _0230D868
	mov r4, #0x18
	b _0230D850
_0230D848:
	mov r0, r4
	bl AdvanceFrame
_0230D850:
	mov r0, r5
	bl ov10_022BF964
	cmp r0, #0
	bne _0230D848
	mov r0, r5
	bl ov10_022BDE50
_0230D868:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D870: .word ov29_023535D4
	arm_func_end ov29_0230D7D4

	arm_func_start ov29_0230D874
ov29_0230D874: ; 0x0230D874
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x28]
	ldrsh r1, [lr, #0x2a]
	ldrsh r0, [ip, #0x28]
	cmp r2, #0
	strh r0, [lr, #0x28]
	ldrsh r0, [ip, #0x2a]
	strh r0, [lr, #0x2a]
	strh r3, [ip, #0x28]
	strh r1, [ip, #0x2a]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D8E4 ; =0x00000F2D
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230D8E4: .word 0x00002494
#else
_0230D8E4: .word 0x00000F2D
#endif
	arm_func_end ov29_0230D874

	arm_func_start ov29_0230D8E8
ov29_0230D8E8: ; 0x0230D8E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldr r3, [lr, #0x3c]
	ldr r1, [lr, #0x40]
	ldr r0, [ip, #0x3c]
	cmp r2, #0
	str r0, [lr, #0x3c]
	ldr r0, [ip, #0x40]
	str r0, [lr, #0x40]
	str r3, [ip, #0x3c]
	str r1, [ip, #0x40]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D958 ; =0x00000F2E
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230D958: .word 0x00002495
#else
_0230D958: .word 0x00000F2E
#endif
	arm_func_end ov29_0230D8E8

	arm_func_start ov29_0230D95C
ov29_0230D95C: ; 0x0230D95C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x24]
	ldrsh r1, [lr, #0x26]
	ldrsh r0, [ip, #0x24]
	cmp r2, #0
	strh r0, [lr, #0x24]
	ldrsh r0, [ip, #0x26]
	strh r0, [lr, #0x26]
	strh r3, [ip, #0x24]
	strh r1, [ip, #0x26]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D9CC ; =0x00000F2B
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230D9CC: .word 0x00002492
#else
_0230D9CC: .word 0x00000F2B
#endif
	arm_func_end ov29_0230D95C

	arm_func_start ov29_0230D9D0
ov29_0230D9D0: ; 0x0230D9D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldr r3, [lr, #0x34]
	ldr r1, [lr, #0x38]
	ldr r0, [ip, #0x34]
	cmp r2, #0
	str r0, [lr, #0x34]
	ldr r0, [ip, #0x38]
	str r0, [lr, #0x38]
	str r3, [ip, #0x34]
	str r1, [ip, #0x38]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230DA40 ; =0x00000F2C
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230DA40: .word 0x00002493
#else
_0230DA40: .word 0x00000F2C
#endif
	arm_func_end ov29_0230D9D0

	arm_func_start ov29_0230DA44
ov29_0230DA44: ; 0x0230DA44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x2c]
	ldrsh r1, [lr, #0x2e]
	ldrsh r0, [ip, #0x2c]
	cmp r2, #0
	strh r0, [lr, #0x2c]
	ldrsh r0, [ip, #0x2e]
	strh r0, [lr, #0x2e]
	strh r3, [ip, #0x2c]
	strh r1, [ip, #0x2e]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230DAB4 ; =0x00000F2F
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230DAB4: .word 0x00002496
#else
_0230DAB4: .word 0x00000F2F
#endif
	arm_func_end ov29_0230DA44

	arm_func_start ov29_0230DAB8
ov29_0230DAB8: ; 0x0230DAB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr ip, [r5, #0xb4]
	mov r4, r1
	ldrsh r1, [ip, #0x24]
	ldr r3, [ip, #0x34]
	ldr r0, [ip, #0x3c]
	cmp r2, #0
	str r0, [ip, #0x34]
	ldrsh r0, [ip, #0x28]
	strh r0, [ip, #0x24]
	str r3, [ip, #0x3c]
	strh r1, [ip, #0x28]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldr r2, _0230F050 ; =0x00002497
	mov r0, r5
	mov r1, r4
#else
	mov r0, r5
	mov r1, r4
	mov r2, #0xf30
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
#ifdef JAPAN
_0230F050: .word 0x00002497
#endif
	arm_func_end ov29_0230DAB8

	arm_func_start SpecificRecruitCheck
SpecificRecruitCheck: ; 0x0230DB14
	stmdb sp!, {r4, lr}
	ldr r1, _0230DBC8 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	ldrb r1, [r1, #0x759]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl DebugRecruitingEnabled
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x97
	ldreq r0, _0230DBC8 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x700
	ldreqsb r0, [r0, #0x98]
	cmpeq r0, #2
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, _0230DBCC ; =0x000001A3
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x1a4
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r1, #2
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #0xa
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #9
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #8
	cmp r4, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230DBC8: .word DUNGEON_PTR
_0230DBCC: .word 0x000001A3
	arm_func_end SpecificRecruitCheck

	arm_func_start RecruitCheck
RecruitCheck: ; 0x0230DBD0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0230E024 ; =DUNGEON_PTR
	mov r8, r0
	ldr r0, [r2]
	mov r7, r1
	ldrb r0, [r0, #0x748]
	ldr r5, [r8, #0xb4]
	ldr r6, [r7, #0xb4]
	bl IsRecruitingAllowed
	cmp r0, #0
	beq _0230DC28
	bl IsFullFloorFixedRoom
	cmp r0, #0
	bne _0230DC28
	bl IsLegendaryChallengeFloor
	cmp r0, #0
	bne _0230DC28
	mov r0, #0xa
	mov r1, #6
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	beq _0230DC30
_0230DC28:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DC30:
	ldr r0, _0230E024 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x75d]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r1, #0x748]
	cmp r0, #0x5b
	bne _0230DC70
	ldrsh r1, [r6, #2]
	ldr r0, _0230E028 ; =0x000001E6
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DC70:
	ldrsh r0, [r6, #2]
	cmp r0, #0x91
	cmpne r0, #0x90
	cmpne r0, #0x92
	ldrne r2, _0230E02C ; =0x0000010F
	cmpne r0, r2
	subne r1, r2, #1
	cmpne r0, r1
	cmpne r0, #0x110
	cmpne r0, #0x19c
	addne r1, r2, #0x8e
	cmpne r0, r1
	addne r1, r2, #0x92
	cmpne r0, r1
	cmpne r0, #0x1a0
	addne r1, r2, #0x93
	cmpne r0, r1
	addne r1, r2, #0x8a
	cmpne r0, r1
	addne r1, r2, #0x8b
	cmpne r0, r1
	addne r1, r2, #0x8c
	cmpne r0, r1
	beq _0230DCF0
	ldr r1, _0230E030 ; =0xFFFFFDEA
	add r1, r0, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _0230DD04
_0230DCF0:
	mov r1, #1
	bl IsMonsterOnTeam
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DD04:
	mov r0, r6
	bl ov29_022FBDE0
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r0, [r6, #2]
	bl SpecificRecruitCheck
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r1, [r8, #4]
	ldrsh r0, [r7, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _0230DD5C
	ldrsh r1, [r8, #6]
	ldrsh r0, [r7, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _0230DD64
_0230DD5C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DD64:
	ldrb r0, [r6, #0x48]
	cmp r0, #0xfa
	ldrneb r0, [r6, #0xbc]
	cmpne r0, #7
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	bl ov29_022E1B28
	bl ov29_022E81F8
	ldrsh r0, [r6, #2]
	mov r1, #1
	bl IsMonsterOnTeam
	mov sb, r0
	mov r0, #0x3e8
	bl DungeonRandInt
	mov r4, r0
	bl HasPlayedOldGame
	cmp r0, #0
	beq _0230DDE0
	cmp sb, #0
	bne _0230DDE0
	ldrsh r0, [r6, #2]
	bl GetRecruitRate2
	mov r6, r0
	b _0230DDEC
_0230DDE0:
	ldrsh r0, [r6, #2]
	bl GetRecruitRate1
	mov r6, r0
_0230DDEC:
	cmp r6, #0
	ble _0230DDFC
	cmp sb, #0
	movne r6, r6, asr #1
_0230DDFC:
	ldr r0, _0230E034 ; =0xFFFFFC19
	cmp r6, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	mov r1, #0x35
	bl ItemIsActive__0230E578
	cmp r0, #0
	ldrne r0, _0230E038 ; =ov10_022C44FC
	ldrnesh r0, [r0]
	addne r6, r6, r0
	bne _0230DFD4
	mov r0, r8
	mov r1, #0x39
	bl ItemIsActive__0230E578
	cmp r0, #0
	ldrne r0, _0230E03C ; =ov10_022C443C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	bne _0230DFD4
	mov r0, r8
	mov r1, #0x3a
	bl ItemIsActive__0230E578
	cmp r0, #0
	ldrne r0, _0230E040 ; =ov10_022C447C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	bne _0230DFD4
	mov r0, r8
	mov r1, #0x3b
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DEA0
	mov r0, r7
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E044 ; =ov10_022C441C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DEA0:
	mov r0, r8
	mov r1, #0x3c
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DED4
	mov r0, r7
	mov r1, #2
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E048 ; =ov10_022C4410
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DED4:
	mov r0, r8
	mov r1, #0x3d
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DF08
	mov r0, r7
	mov r1, #9
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E04C ; =ov10_022C470C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DF08:
	mov r0, r8
	mov r1, #0x3e
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DF3C
	mov r0, r7
	mov r1, #3
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E050 ; =ov10_022C4708
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DF3C:
	mov r0, r8
	mov r1, #0x3f
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DF70
	mov r0, r7
	mov r1, #0xd
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E054 ; =ov10_022C4704
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DF70:
	mov r0, r8
	mov r1, #0x40
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DFA4
	mov r0, r7
	mov r1, #4
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E058 ; =ov10_022C4700
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DFA4:
	mov r0, r8
	mov r1, #0x41
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DFD4
	mov r0, r7
	mov r1, #0xa
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E05C ; =ov10_022C46FC
	ldrnesh r0, [r0]
	addne r6, r6, r0
_0230DFD4:
	mov r0, r8
	mov r1, #0x1e
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _0230E038 ; =ov10_022C44FC
	ldrb r1, [r5, #0xa]
	ldrnesh r0, [r0]
	mov r1, r1, lsl #1
	addne r6, r6, r0
	ldr r0, _0230E060 ; =RECRUITMENT_LEVEL_BOOST_TABLE
	ldrsh r0, [r0, r1]
	add r0, r6, r0
	cmp r4, r0
	mov r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetFirstEmptyMemberIdx
	cmp r0, #0
	movlt r0, #0
	movge r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230E024: .word DUNGEON_PTR
_0230E028: .word 0x000001E6
_0230E02C: .word 0x0000010F
_0230E030: .word 0xFFFFFDEA
_0230E034: .word 0xFFFFFC19
_0230E038: .word ov10_022C44FC
_0230E03C: .word ov10_022C443C
_0230E040: .word ov10_022C447C
_0230E044: .word ov10_022C441C
_0230E048: .word ov10_022C4410
_0230E04C: .word ov10_022C470C
_0230E050: .word ov10_022C4708
_0230E054: .word ov10_022C4704
_0230E058: .word ov10_022C4700
_0230E05C: .word ov10_022C46FC
_0230E060: .word RECRUITMENT_LEVEL_BOOST_TABLE
	arm_func_end RecruitCheck

	arm_func_start TryRecruit
TryRecruit: ; 0x0230E064
#ifdef JAPAN
#define TRY_RECRUIT_OFFSET -4
#define TRY_RECRUIT_OFFSET_2 -0x2C0
#else
#define TRY_RECRUIT_OFFSET 0
#define TRY_RECRUIT_OFFSET_2 0
#endif
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x114 + TRY_RECRUIT_OFFSET
	mov sl, r0
	mov r0, #0xa
	mov r5, #0
	mov sb, r1
	mov r8, r2
	bl ov29_0234BA54
	mov r0, r5
	bl ov29_0234B1A4
	bl ov29_0234D630
	add r0, sb, #4
	add r1, sl, #4
	mvn r7, #0
	bl GetDirectionTowardsPosition
	mov r6, r0
	ldr r4, [sb, #0xb4]
	mov r0, r5
	strb r0, [sb, #0x22]
	mov r0, sl
	mov r1, sb
	bl ov29_02305F60
	mov r1, r6
	mov r0, sb
	bl ov29_02304A48
	ldrsh r0, [r4, #2]
	mov r1, #1
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _0230E0FC
	bl ov29_0234B034
	mov r1, #1
	str r1, [sp]
	mov r1, r5
	ldr r2, [sb, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	b _0230E114
_0230E0FC:
	bl ov29_0234B034
	mov r1, r5
	str r1, [sp]
	ldr r2, [sb, #0xb4]
	mov r3, r1
	bl ov29_0230040C
_0230E114:
	bl ov29_0234B034
	mov r1, r0
	mov r3, #1
	mov r2, #0
	str r3, [sp]
	ldr r0, _0230E55C ; =0x00000C77
	mov r3, r2
	bl ov29_0234D7C0
	cmp r0, #2
	moveq r4, #0
	beq _0230E524
	mov r4, #1
	mov r0, #0
	orr r1, r4, #2
	strb r1, [sp, #0xac + TRY_RECRUIT_OFFSET]
	strb r0, [sp, #0xad + TRY_RECRUIT_OFFSET]
	ldrsh r2, [r8, #0xc]
	ldr r1, _0230E560 ; =DUNGEON_PTR
	sub r3, r0, #1
	strb r2, [sp, #0xae + TRY_RECRUIT_OFFSET]
	strh r4, [sp, #0xb2 + TRY_RECRUIT_OFFSET]
	ldr r2, [r1]
	ldrh r4, [r8, #0x44]
	add r1, sp, #0x14
	strh r4, [r1, #0xf2 + TRY_RECRUIT_OFFSET]
	ldrh r4, [r8, #0x46]
	strh r4, [r1, #0xf4 + TRY_RECRUIT_OFFSET]
	strb r0, [sp, #0x104 + TRY_RECRUIT_OFFSET]
	strh r3, [sp, #0xb4 + TRY_RECRUIT_OFFSET]
	strh r3, [sp, #0xb6 + TRY_RECRUIT_OFFSET]
	ldrsh r1, [r8]
	strh r1, [sp, #0xb8 + TRY_RECRUIT_OFFSET]
	ldrb r1, [r2, #0x748]
	strb r1, [sp, #0xaf + TRY_RECRUIT_OFFSET]
	ldrb r1, [r2, #0x749]
	add r2, sp, #0xac + TRY_RECRUIT_OFFSET
	strb r1, [sp, #0xb0 + TRY_RECRUIT_OFFSET]
	ldrsh r1, [r8, #6]
	strh r1, [sp, #0xba + TRY_RECRUIT_OFFSET]
	ldrsh r1, [r8, #6]
	strh r1, [sp, #0xbc + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x14]
	strh r1, [sp, #0xf0 + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x16]
	strh r1, [sp, #0xf2 + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x18]
	strh r1, [sp, #0xf4 + TRY_RECRUIT_OFFSET]
	ldrh r1, [r8, #0x1a]
	strh r1, [sp, #0xf6 + TRY_RECRUIT_OFFSET]
_0230E1D8:
	add r4, r8, r0
	ldrb r1, [r4, #8]
	add r3, r2, r0
	add r0, r0, #1
	strb r1, [r3, #0x12]
	ldrb r1, [r4, #0xa]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	strb r1, [r3, #0x14]
	cmp r0, #2
	blt _0230E1D8
	ldr r0, [r8, #0x10]
	add r2, sp, #0xc8 + TRY_RECRUIT_OFFSET
	str r0, [sp, #0xc4 + TRY_RECRUIT_OFFSET]
	add r3, r8, #0x22
	mov r1, #0x11
_0230E218:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0230E218
	ldrh r0, [r8, #0x1c]
	strh r0, [sp, #0xea + TRY_RECRUIT_OFFSET]
	ldrh r0, [r8, #0x1e]
	strh r0, [sp, #0xec + TRY_RECRUIT_OFFSET]
	ldrh r0, [r8, #0x20]
	strh r0, [sp, #0xee + TRY_RECRUIT_OFFSET]
	ldrsh r0, [r8]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x100
	add r0, r0, #0xa + TRY_RECRUIT_OFFSET
	mov r2, #0xa
	bl StrncpyName
	ldrsh r1, [sp, #0xb8 + TRY_RECRUIT_OFFSET]
	ldrsh r2, [sp, #0xb2 + TRY_RECRUIT_OFFSET]
	add r0, sp, #0xf8 + TRY_RECRUIT_OFFSET
	bl EnableAllLearnableIqSkills
	add r1, sp, #0x100
	add r0, sp, #0x98
	add r1, r1, #0xa + TRY_RECRUIT_OFFSET
#ifdef JAPAN
	add r4, sp, #0x18
	bl StrcpySimple
#else
	mov r2, #0xa
	add r4, sp, #0x18
	bl StrncpySimpleNoPad
#endif
	bl ov29_022EACAC
	bl ov29_0234B034
	mov r1, r0
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r0, _0230E564 ; =0x00000C7B
	mov r3, r2
	bl ov29_0234D7C0
	cmp r0, #1
	bne _0230E2D4
	bl ov29_0234D838
	add r6, sp, #0x100
	add r6, r6, #0xa + TRY_RECRUIT_OFFSET
_0230E2BC:
	mov r0, r6
	add r1, sp, #0x98
	mov r2, #0
	bl DungeonModeSetupAndShowNameKeyboard
	cmp r0, #0
	beq _0230E2BC
_0230E2D4:
	add r1, sp, #0xac + TRY_RECRUIT_OFFSET
	mov r0, r4
	bl sub_020585B4
	mov r1, r4
	mov r0, #0
	bl ov29_0234B0B4
	mov r0, #1
	mov r1, #0
	bl ov29_0234B084
	ldr r0, _0230E568 ; =0x00000C7E
	bl ov29_0230E658
	ldrsh r1, [r8, #2]
	ldrsh r2, [r8, #4]
	mov r0, sb
	bl ov29_02337EC0
	ldrsh r2, [r8, #2]
	ldrsh r3, [r8, #4]
	mov r0, sl
	mov r1, sb
	bl ov29_0230E5A8
	cmp r0, #0
	bne _0230E42C
	add r0, sp, #0xac + TRY_RECRUIT_OFFSET
	mvn r1, #0
	bl ov29_0230E5FC
	mov r7, r0
	b _0230E410
_0230E340:
	ldr r0, _0230E56C ; =0x00000C7F
	bl ov29_0230E658
	mvn r4, #0
_0230E34C:
	bl ov29_0234D838
	add r1, sp, #0x100
	mov r0, sb
	add r1, r1, #0xa + TRY_RECRUIT_OFFSET
	bl ov29_0234EE10
	movs r6, r0
	beq _0230E3D4
	cmp r6, sb
	add r0, sp, #0x58
	bne _0230E380
	add r1, sp, #0xac + TRY_RECRUIT_OFFSET
	bl sub_020585B4
	b _0230E38C
_0230E380:
	ldr r1, [r6, #0xb4]
	ldrsh r1, [r1, #0xc]
	bl sub_020584FC
_0230E38C:
	mov r0, #0
	add r1, sp, #0x58
	bl ov29_0234B0B4
	mov r0, #1
	mov r1, sl
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl ov29_0234B034
	mov r1, #1
	mov r2, #0
	str r1, [sp]
	mov r1, r0
	mov r0, #0xc80 + TRY_RECRUIT_OFFSET_2
	mov r3, r2
	bl ov29_0234D7C0
	mov fp, r0
	cmp fp, r4
	beq _0230E34C
_0230E3D4:
	cmp fp, #2
	cmpne r6, #0
	beq _0230E410
	ldr r0, _0230E56C ; =0x00000C7F
	add r0, r0, #2
	bl ov29_0230E658
	mov r0, r6
	bl ov29_022E68BC
	ldr r1, _0230E570 ; =0x00000233
	mov r0, r6
	mov r2, sl
	bl HandleFaint
	cmp r6, sb
	moveq r4, #1
	beq _0230E524
_0230E410:
	mov r0, sl
	mov r1, sb
	ldrsh r2, [r8, #2]
	ldrsh r3, [r8, #4]
	bl ov29_0230E5A8
	cmp r0, #0
	beq _0230E340
_0230E42C:
	mov r6, #0
	mov r4, r6
	mov r5, #1
	b _0230E468
_0230E43C:
	mov r0, r6
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0230E470
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230E468:
	cmp r6, #4
	blt _0230E43C
_0230E470:
	add r0, sp, #0xac + TRY_RECRUIT_OFFSET
	mov r1, r7
	strh r6, [sp, #0xb6 + TRY_RECRUIT_OFFSET]
	bl ov29_0230E5FC
	strh r0, [sp, #0xb4 + TRY_RECRUIT_OFFSET]
	ldrsh r1, [sp, #0xb4 + TRY_RECRUIT_OFFSET]
	mov r0, r6
	bl sub_02056698
	ldr r1, _0230E570 ; =0x00000233
	mov r0, sb
	mov r2, sl
	bl HandleFaint
	mov r0, r6
	bl GetActiveTeamMember
	mov r4, r0
	add r7, sp, #0xac + TRY_RECRUIT_OFFSET
	mov r6, r4
	mov r5, #6
_0230E4B8:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230E4B8
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	bl ov29_022E8104
	bl ov29_022E81F8
	add r1, sp, #0x14
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	ldrsh r2, [r8, #4]
	mov r3, r4
	bl InitTeamMember
	ldrsh r0, [r4, #0xc]
	bl SetPokemonJoined
	bl ov29_022E8104
	bl ov29_022E81F8
	ldr r5, [sp, #0x14]
	mov r4, #1
_0230E524:
	mov r0, #1
	bl ov29_0234D8A0
	cmp r4, #0
	bne _0230E540
	ldr r1, _0230E574 ; =0x00000C78
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_0230E540:
	cmp r5, #0
	beq _0230E550
	mov r0, r5
	bl EnsureCanStandCurrentTile
_0230E550:
	mov r0, r4
	add sp, sp, #0x114 + TRY_RECRUIT_OFFSET
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_0230E55C: .word 0x00000C77 + TRY_RECRUIT_OFFSET_2
_0230E560: .word DUNGEON_PTR
_0230E564: .word 0x00000C7B + TRY_RECRUIT_OFFSET_2
_0230E568: .word 0x00000C7E + TRY_RECRUIT_OFFSET_2
_0230E56C: .word 0x00000C7F + TRY_RECRUIT_OFFSET_2
_0230E570: .word 0x00000233
_0230E574: .word 0x00000C78 + TRY_RECRUIT_OFFSET_2
	arm_func_end TryRecruit
