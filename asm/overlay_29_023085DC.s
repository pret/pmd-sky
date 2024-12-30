	.include "asm/macros.inc"
	.include "overlay_29_023085DC.inc"

	.text

	arm_func_start ov29_023085DC
ov29_023085DC: ; 0x023085DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	cmp r1, #0
	ldr r4, [r5, #0xb4]
	beq _02308618
	ldrb r1, [r4, #0xd0]
	cmp r1, #4
	bne _02308618
	ldrb r1, [r4, #0x4c]
	add r2, r1, #4
	and r1, r2, #0xff
	and r1, r1, #7
	strb r1, [r4, #0x4c]
	bl UpdateAiTargetPos
	ldmia sp!, {r3, r4, r5, pc}
_02308618:
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #8
	bl DungeonRandInt
	strb r0, [r4, #0x4c]
	mov r0, r5
	bl UpdateAiTargetPos
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023085DC

	arm_func_start ApplyDamageAndEffects
ApplyDamageAndEffects: ; 0x0230863C
#ifdef JAPAN
#define APPLY_DAMAGE_AND_EFFECTS_OFFSET -4
#else
#define APPLY_DAMAGE_AND_EFFECTS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldr r7, [sp, #0x68]
	ldrsh r4, [sp, #0x6c]
	ldr r6, [sp, #0x74]
	str r7, [sp]
	stmib sp, {r4, r6}
	mov r8, r2
	mov sl, r0
	mov sb, r1
	bl ApplyDamage
	cmp r0, #0
	ldreqb r0, [r8, #0x10]
	cmpeq r0, #0
	bne _02308F68
	mov r0, sl
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _02308F68
	mov r0, sb
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _02308F68
	ldr r0, [sl]
	cmp r0, #1
	ldreq r0, [sb]
	cmpeq r0, #1
	bne _02308F68
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xd2]
	cmp r0, #0xc
	bne _023086D4
	ldr r1, _02308F70 ; =ATK_STAT_IDX
	mov r0, sl
	ldr r2, [r1]
	mov r1, sb
	mov r3, #1
	bl BoostOffensiveStat
_023086D4:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	beq _02308F68
	mov r0, sb
	bl ov29_02300D50
	cmp r0, #0
	ldreq r0, [sb, #0xb4]
	ldreqb r0, [r0, #0xd2]
	cmpeq r0, #0
	movne r0, #0
	bne _02308F64
	mov r0, sl
	mov r1, #0x29
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02308730
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F74 ; =ov10_022C442C
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #0
	blt _02308F64
_02308730:
	ldrb r0, [r8, #0xd]
	bl CategoryIsNotPhysical
	cmp r0, #0
	bne _02308778
	cmp sl, sb
	beq _02308778
	ldrsh r1, [sl, #4]
	ldrsh r0, [sb, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _02308778
	ldrsh r1, [sl, #6]
	ldrsh r0, [sb, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _02308780
_02308778:
	mov r0, #0
	b _023087B4
_02308780:
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xd
	bne _023087A8
	mov r0, sb
	mov r1, sl
	bl ov29_022E5E84
	mov r0, sb
	mov r1, sl
	bl ov29_0231EDFC
_023087A8:
	mov r0, sl
	mov r1, sb
	bl ov29_0230D654
_023087B4:
	cmp r0, #0
	movne r0, #1
	bne _02308F64
	ldrb r0, [r8, #0xd]
	bl CategoryIsNotPhysical
	mov r4, r0
	cmp sl, sb
	mov r5, #0
	beq _02308808
	ldrsh r1, [sl, #4]
	ldrsh r0, [sb, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _02308808
	ldrsh r1, [sl, #6]
	ldrsh r0, [sb, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _02308810
_02308808:
	mov r0, #0
	b _02308A28
_02308810:
	add r0, sp, #0x2c
	bl ResetDamageData
	ldr r0, [sb, #0xb4]
	cmp r4, #0
	ldrb r0, [r0, #0xd5]
	bne _023088E4
	cmp r0, #4
	bne _0230883C
	mov r0, sb
	bl ov29_022E3F24
	add r5, r5, #4
_0230883C:
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xa
	bne _02308858
	mov r0, sb
	bl ov29_022E3F24
	add r5, r5, #1
_02308858:
	mov r0, sb
	mov r1, #0x20
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	mov r0, sb
	mov r1, #0x23
	addne r5, r5, #4
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	mov r0, sb
	mov r1, #0x31
	addne r5, r5, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023088B0
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F78 ; =ov10_022C44C0
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1]
	cmp r1, r0, asr #16
	addgt r5, r5, #4
_023088B0:
	mov r0, sb
	mov r1, #0x27
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023088F8
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F7C ; =ov10_022C4464
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1]
	cmp r1, r0, asr #16
	addgt r5, r5, #1
	b _023088F8
_023088E4:
	cmp r0, #8
	bne _023088F8
	mov r0, sb
	bl ov29_022E40C0
	add r5, r5, #4
_023088F8:
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xf
	bne _02308914
	mov r0, sb
	bl ov29_022E57D4
	add r5, r5, #2
_02308914:
	mov r0, sl
	mov r1, sb
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	addne r5, r5, #2
	cmp r5, #0
	beq _02308A1C
	ldr r2, _02308F80 ; =0x00000C3F
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, [r8]
	mov r1, #6
	mul r2, r0, r5
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r0, r0, asr #2
	str r0, [sp, #0x2c]
	ldrb r2, [r8, #0xc]
	mov r0, #2
	mov r3, #0
	strb r2, [sp, #0x38]
	str r1, [sp, #0x30]
	str r0, [sp, #0x34]
	ldrb r0, [r8, #0xd]
	strb r0, [sp, #0x39]
	strb r3, [sp, #0x3a]
	strb r3, [sp, #0x3b]
	strb r3, [sp, #0x3c]
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xf
	bne _023089FC
	mov r2, #1
	add r1, sp, #0xc
	mov r0, sb
	strb r2, [sp, #0x39]
	bl ov29_023380FC
	mov fp, r0
	ldrsh r5, [sp, #0x6c]
	mov r4, #0
	b _023089F0
_023089C4:
	str r7, [sp]
	stmib sp, {r5, r6}
	add r0, sp, #0xc
	ldr r1, [r0, r4, lsl #2]
	mov r0, sb
	add r2, sp, #0x2c
	mov r3, #0
	bl ApplyDamage
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_023089F0:
	cmp r4, fp
	blt _023089C4
	b _02308A1C
_023089FC:
	ldrsh r0, [sp, #0x6c]
	str r7, [sp]
	add r2, sp, #0x2c
	str r0, [sp, #4]
	mov r0, sb
	mov r1, sl
	str r6, [sp, #8]
	bl ApplyDamage
_02308A1C:
	mov r0, sl
	mov r1, sb
	bl ov29_0230D654
_02308A28:
	cmp r0, #0
	movne r0, #1
	bne _02308F64
	cmp sl, sb
	beq _02308A6C
	ldrsh r1, [sl, #4]
	ldrsh r0, [sb, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _02308A6C
	ldrsh r1, [sl, #6]
	ldrsh r0, [sb, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _02308A74
_02308A6C:
	mov r0, #0
	b _02308ECC
_02308A74:
	ldrb r0, [r8, #0xd]
	bl CategoryIsNotPhysical
	mov r4, r0
	mov r0, sb
	mov r1, #0xb
	ldr r6, [sl, #0xb4]
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02308B04
	cmp r4, #0
	bne _02308B04
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F84 ; =ov10_022C45B4
	ldrsh r1, [r1]
	cmp r0, r1
	bge _02308B04
	mov r0, #0x12c
	bl DungeonRandInt
	cmp r0, #0x64
	mov r2, #0xb
	bge _02308AE0
	mov r0, sl
	mov r1, sb
	mov r3, #0x40
	bl ov29_0230F728
	b _02308B04
_02308AE0:
	cmp r0, #0xc8
	mov r0, sl
	mov r1, sb
	bge _02308AFC
	mov r3, #0x10
	bl ov29_0230F728
	b _02308B04
_02308AFC:
	mov r3, #0x80
	bl ov29_0230F728
_02308B04:
	ldr r5, _02308F88 ; =ov29_023535DC
	b _02308B54
_02308B0C:
	ldrb r1, [r5]
	mov r0, sb
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02308B50
	ldr r3, [r5, #8]
	mov r0, sl
	mov r1, sb
	mov r2, r4
	blx r3
	cmp r0, #0
	beq _02308B50
	ldrb r2, [r5]
	ldr r3, [r5, #4]
	mov r0, sl
	mov r1, sb
	bl ov29_0230F728
_02308B50:
	add r5, r5, #0x10
_02308B54:
	ldrb r0, [r5]
	cmp r0, #0
	bne _02308B0C
	mov r0, sb
	mov r1, #0x1b
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02308BB0
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F8C ; =ov10_022C45B0
	ldrsh r1, [r1]
	cmp r0, r1
	bge _02308BB0
	mov r0, sb
	bl HasLowHealth
	cmp r0, #0
	beq _02308BB0
	mov r0, sl
	mov r1, sb
	mov r2, #0x1b
	mov r3, #0x40000
	bl ov29_0230F728
_02308BB0:
	mov r0, sl
	mov r1, sb
	mov r2, #5
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308C38
	ldrb r0, [r6, #0xf7]
	mov r5, #0
	cmp r0, #1
	beq _02308C00
	mov r0, sl
	mov r1, #0xa
	bl HasTypeAffectedByGravity
	cmp r0, #0
	bne _02308C00
	mov r0, sl
	bl LevitateIsActive
	cmp r0, #0
	beq _02308C0C
_02308C00:
	bl GravityIsActive
	cmp r0, #0
	moveq r5, #1
_02308C0C:
	cmp r5, #0
	bne _02308C38
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F90 ; =ov10_022C4564
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #1
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308C38:
	mov r0, sl
	mov r1, sb
	mov r2, #0xa
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308C88
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F94 ; =ov10_022C468C
	ldrsh r1, [r1]
	cmp r0, r1
	bge _02308C88
	add r0, r6, #0x100
	ldrh r3, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	ldr r1, _02308F98 ; =RAPID_SPIN_BINDING_REMOVAL
	mov r2, #0
	orr r3, r3, #2
	strh r3, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	strb r2, [r1]
_02308C88:
	mov r0, sl
	mov r1, sb
	mov r2, #0x17
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308CDC
	mov r0, sl
	mov r1, #0x11
	bl MonsterIsType
	cmp r0, #0
	beq _02308CDC
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308F9C ; =ov10_022C4460
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #4
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308CDC:
	mov r0, sl
	mov r1, sb
	mov r2, #0x20
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308D24
	cmp r4, #0
	bne _02308D24
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308FA0 ; =ov10_022C4550
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #8
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308D24:
	mov r0, sl
	mov r1, sb
	mov r2, #0x27
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308D64
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308FA4 ; =ov10_022C45C0
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #0x20
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308D64:
	mov r0, sl
	mov r1, sb
	mov r2, #0x3d
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308DE0
	cmp r4, #0
	bne _02308DE0
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308FA8 ; =ov10_022C45AC
	ldrsh r1, [r1]
	cmp r0, r1
	bge _02308DE0
	mov r0, #3
	bl DungeonRandInt
	cmp r0, #1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #0x40
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	blt _02308DE0
	cmp r0, #2
	add r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #0x10
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	ldrgeh r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrge r1, r1, #0x80
	strgeh r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308DE0:
	mov r0, sl
	mov r1, sb
	mov r2, #0x3e
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308E20
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308FAC ; =ov10_022C467C
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #0x100
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308E20:
	mov r0, sl
	mov r1, sb
	mov r2, #0x44
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308E80
	ldr r1, [sb, #0xb4]
	ldrsh r0, [r6, #2]
	ldrsh r1, [r1, #2]
	bl GendersNotEqualNotGenderless
	cmp r0, #0
	beq _02308E80
	cmp r4, #0
	bne _02308E80
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308FB0 ; =ov10_022C4524
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #0x200
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308E80:
#ifdef JAPAN
	mov r0, sl
	mov r1, sb
	mov r2, #1
#else
	mov r2, #1
	mov r0, sl
	mov r1, sb
	mov r3, r2
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02308EC0
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02308FB4 ; =ov10_022C4638
	ldrsh r1, [r1]
	cmp r0, r1
	addlt r0, r6, #0x100
	ldrlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
	orrlt r1, r1, #0x400
	strlth r1, [r0, #0x92 + APPLY_DAMAGE_AND_EFFECTS_OFFSET]
_02308EC0:
	mov r0, sl
	mov r1, sb
	bl ov29_0230D654
_02308ECC:
	cmp r0, #0
	movne r0, #1
	bne _02308F64
	ldr r0, [sb, #0xb4]
	ldrb r1, [r0, #0xe0]
	cmp r1, #2
	bne _02308F4C
	ldr r1, _02308FB8 ; =DUNGEON_PTR
	ldrb r2, [r0, #0xe8]
	ldr r1, [r1]
	add r1, r1, r2, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r4, [r1, #0xad4]
#else
	ldr r4, [r1, #0xb78]
#endif
	cmp r4, #0
	moveq r1, #0
	streqb r1, [r0, #0xe0]
	beq _02308F4C
	ldr r1, [r4, #0xb4]
	ldr r2, [r0, #0xe4]
	ldr r1, [r1, #0xb0]
	cmp r2, r1
	movne r1, #0
	strneb r1, [r0, #0xe0]
	bne _02308F4C
	mov r0, r4
	mov r1, sb
	bl ov29_022E45D0
	ldr r1, [r8]
	mov r0, r4
	mov r2, #0xc
	mov r3, #0x238
	bl ApplyDamageAndEffectsWrapper
_02308F4C:
	mov r0, sl
	mov r1, sb
	bl ov29_0230D654
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
_02308F64:
	cmp r0, #0
_02308F68:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02308F70: .word ATK_STAT_IDX
_02308F74: .word ov10_022C442C
_02308F78: .word ov10_022C44C0
_02308F7C: .word ov10_022C4464
#ifdef JAPAN
_02308F80: .word 0x0000097E
#else
_02308F80: .word 0x00000C3F
#endif
_02308F84: .word ov10_022C45B4
_02308F88: .word ov29_023535DC
_02308F8C: .word ov10_022C45B0
_02308F90: .word ov10_022C4564
_02308F94: .word ov10_022C468C
_02308F98: .word RAPID_SPIN_BINDING_REMOVAL
_02308F9C: .word ov10_022C4460
_02308FA0: .word ov10_022C4550
_02308FA4: .word ov10_022C45C0
_02308FA8: .word ov10_022C45AC
_02308FAC: .word ov10_022C467C
_02308FB0: .word ov10_022C4524
_02308FB4: .word ov10_022C4638
_02308FB8: .word DUNGEON_PTR
	arm_func_end ApplyDamageAndEffects
