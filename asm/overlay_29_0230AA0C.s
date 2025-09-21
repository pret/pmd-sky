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
