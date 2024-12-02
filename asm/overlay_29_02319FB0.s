	.include "asm/macros.inc"
	.include "overlay_29_02319FB0.inc"

	.text

	arm_func_start TryAddTargetToAiTargetList
TryAddTargetToAiTargetList: ; 0x02319FB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	mov r6, r3
	ldrsh r3, [r7, #4]
	ldrsh r2, [r6, #4]
	mov sb, r0
	mov r8, r1
	cmp r3, r2
	ldreqsh r1, [r7, #6]
	ldreqsh r0, [r6, #6]
	ldr r2, [r7, #0xb4]
	cmpeq r1, r0
	ldreqb r5, [r2, #0x4c]
	beq _0231A010
	and r0, r8, #0xf0
	cmp r0, #0x30
	cmpne r0, #0x60
	cmpne r0, #0x70
	ldreqb r5, [r2, #0x4c]
	beq _0231A010
	add r0, r7, #4
	add r1, r6, #4
	bl GetDirectionTowardsPosition
	mov r5, r0
_0231A010:
	ldr r4, _0231A094 ; =ov29_0237CA18
	ldrb r0, [r4, r5]
	cmp r0, #0
	movne r0, sb
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb ip, [sp, #0x24]
	ldr r3, [sp, #0x20]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str ip, [sp]
	bl IsAiTargetEligible
	cmp r0, #0
	beq _0231A08C
	ldr r2, _0231A098 ; =ov29_0237CA20
	mov r3, #1
	ldr r1, [sp, #0x20]
	mov r0, r7
	strb r3, [r4, r5]
	strb r5, [r2, sb]
	bl GetMoveTypeForMonster
	mov r3, r0
	mov r0, r7
	mov r1, r8
	mov r2, r6
	bl ov29_0231A364
	ldr r2, _0231A09C ; =ov29_0237CA28
	ldr r1, _0231A0A0 ; =ov29_0237CA48
	str r0, [r2, sb, lsl #2]
	str r6, [r1, sb, lsl #2]
	add sb, sb, #1
_0231A08C:
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231A094: .word ov29_0237CA18
_0231A098: .word ov29_0237CA20
_0231A09C: .word ov29_0237CA28
_0231A0A0: .word ov29_0237CA48
	arm_func_end TryAddTargetToAiTargetList

	arm_func_start IsAiTargetEligible
IsAiTargetEligible: ; 0x0231A0A4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r6, r2
	mov r2, #0
	mov r7, r1
	mov r5, r3
	mov r4, r2
	ands r0, r8, #0xf
	bne _0231A0E4
	mov r0, r7
	mov r1, r6
	mov r3, #1
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	moveq r4, #1
	b _0231A1B8
_0231A0E4:
	cmp r0, #1
	bne _0231A108
	mov r0, r7
	mov r1, r6
	mov r3, #1
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	moveq r4, #1
	b _0231A1B8
_0231A108:
	cmp r0, #2
	bne _0231A13C
	ldr r1, [r6, #0xb4]
	mov r4, #1
	ldrb r0, [r1, #9]
	cmp r0, #1
	moveq r0, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	bne _0231A1B8
	mov r0, r2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A13C:
	cmp r0, #5
	bne _0231A17C
	cmp r7, r6
	ldr r1, [r6, #0xb4]
	moveq r0, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #9]
	mov r4, #1
	cmp r0, #1
	moveq r0, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	bne _0231A1B8
	mov r0, r2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A17C:
	cmp r0, #6
	bne _0231A1AC
	cmp r7, r6
	moveq r0, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r6
	mov r3, #1
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	moveq r4, #1
	b _0231A1B8
_0231A1AC:
	sub r0, r0, #3
	cmp r0, #1
	movls r4, #1
_0231A1B8:
	cmp r4, #0
	beq _0231A358
	ldrb r0, [sp, #0x18]
	cmp r0, #0
	beq _0231A328
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov29_02333FD0
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	and r0, r8, #0xf00
	cmp r0, #0x100
	bne _0231A21C
	mov r0, r5
	mov r1, #2
	bl GetMoveAccuracyOrAiChance
	mov r5, r0
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, r5
	blt _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A21C:
	cmp r0, #0x200
	bne _0231A23C
	mov r0, r6
	bl ov29_023007DC
	cmp r0, #0
	bne _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A23C:
	cmp r0, #0x300
	bne _0231A260
	mov r0, r6
	mov r1, #1
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A260:
	cmp r0, #0x400
	bne _0231A280
	mov r0, r6
	bl IsMonsterSleeping
	cmp r0, #0
	bne _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A280:
	cmp r0, #0x600
	bne _0231A2B8
	ldr r1, [r6, #0xb4]
	ldrb r0, [r1, #0x5e]
	cmp r0, #0xe
	ldrneb r0, [r1, #0x5f]
	cmpne r0, #0xe
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #0xfe]
	cmp r0, #0
	beq _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A2B8:
	cmp r0, #0x500
	bne _0231A358
	ldrh r1, [r5, #4]
	ldr r0, _0231A360 ; =0x000001B7
	cmp r1, r0
	addne r0, r0, #0x57
	cmpne r1, r0
	mov r0, r6
	mov r1, #1
	bne _0231A304
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _0231A358
	mov r0, r6
	bl ov29_023007DC
	cmp r0, #0
	bne _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A304:
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _0231A358
	mov r0, r6
	bl ov29_023007DC
	cmp r0, #0
	bne _0231A358
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0231A328:
	and r0, r8, #0xf00
	cmp r0, #0x100
	bne _0231A358
	mov r0, r5
	mov r1, #2
	bl GetMoveAccuracyOrAiChance
	mov r5, r0
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, r5
	movge r0, #0
	ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
_0231A358:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0231A360: .word 0x000001B7
	arm_func_end IsAiTargetEligible

	arm_func_start ov29_0231A364
ov29_0231A364: ; 0x0231A364
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r0, r7
	mov r1, #0x6f
	mov r6, r3
	ldr r5, [r7, #0xb4]
	mov r4, #1
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0231A3A4
	mov r0, r7
	mov r1, #0xf
	bl HasHeldItem
_0231A3A4:
	cmp r0, #0
	movne r0, #0x1f4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r5, #6]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r8, #0xf
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, #9
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A404
	ldrsh r0, [r5, #2]
	mov r1, #0x258
	bl _s32_div_f
	ldr r0, _0231A45C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r1
	add r0, r0, #0x3000
#ifdef JAPAN
	ldrb r4, [r0, #0xb24]
#else
	ldrb r4, [r0, #0xb74]
#endif
	b _0231A454
_0231A404:
	mov r0, sb
	mov r1, #0xa
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A42C
	ldrsh r0, [r5, #0x10]
	rsb r4, r0, #0x1f4
	cmp r4, #1
	movlt r4, #1
	b _0231A454
_0231A42C:
	mov r0, sb
	mov r1, #0xb
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A454
	mov r0, sb
	mov r1, r7
	mov r2, r6
	bl ov29_0230B7D4
	add r4, r0, #1
_0231A454:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231A45C: .word DUNGEON_PTR
	arm_func_end ov29_0231A364

	arm_func_start ov29_0231A460
ov29_0231A460: ; 0x0231A460
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	mov sl, r0
	ldr r3, [sl, #0xb4]
	mov sb, r1
	str r2, [sp]
	mov r1, #1
	ldrb r6, [r3, #0x4c]
	mov r4, #0
	bl IsBlinded
	cmp r0, #0
	movne r7, #1
	bne _0231A4AC
	mov r0, sl
	mov r1, #0xf
	bl ov29_0230F8D0
	cmp r0, #0xff
	mov r7, #8
	movne r6, r0
_0231A4AC:
	mov r0, sl
	mov r1, #9
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0231A4D4
	mov r0, sl
	mov r1, #0xa
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231A4DC
_0231A4D4:
	mov r2, #1
	b _0231A4E0
_0231A4DC:
	mov r2, #0
_0231A4E0:
	mov r0, sl
	mov r1, #8
	and fp, r2, #0xff
	bl IqSkillIsEnabled
	str r0, [sp, #4]
	mov r5, #0
	b _0231A5CC
_0231A4FC:
	and r6, r6, #7
	ldr r1, _0231A690 ; =DIRECTIONS_XY
	mov r2, r6, lsl #2
	ldrsh r3, [r1, r2]
	add r1, r1, r6, lsl #2
	ldrsh r0, [sl, #4]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, #2]
	add r0, r0, r3
	add r1, r2, r1
	bl GetTile
	ldr r8, [r0, #0xc]
	cmp r8, #0
	beq _0231A5C4
	ldr r0, [r8]
	cmp r0, #1
	bne _0231A5C4
	mov r0, sl
	mov r1, r6
	bl CanAttackInDirection
	cmp r0, #0
	beq _0231A5C4
	ldr r3, [sp]
	mov r0, sl
	mov r1, r8
	mov r2, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _0231A5C4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0231A58C
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xc4]
	cmp r0, #1
	beq _0231A5C4
_0231A58C:
	add r0, sp, #0x28
	mov r1, #0
	str r6, [r0, r4, lsl #2]
	mov r2, r8
	mov r0, sl
	mov r3, r1
	bl ov29_0231A364
	add r1, sp, #8
	cmp fp, #0
	str r0, [r1, r4, lsl #2]
	streq r6, [sb]
	moveq r0, #1
	beq _0231A688
	add r4, r4, #1
_0231A5C4:
	add r5, r5, #1
	add r6, r6, #1
_0231A5CC:
	cmp r5, r7
	blt _0231A4FC
	cmp r4, #0
	mov r0, #0
	beq _0231A688
	mov r5, r0
	mov r3, r0
	add r2, sp, #8
	b _0231A600
_0231A5F0:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r5, r1
	movlt r5, r1
_0231A600:
	cmp r3, r4
	blt _0231A5F0
	mov r6, #0
	mov r1, r6
	add r3, sp, #8
	b _0231A628
_0231A618:
	ldr r2, [r3, r6, lsl #2]
	cmp r5, r2
	strne r1, [r3, r6, lsl #2]
	add r6, r6, #1
_0231A628:
	cmp r6, r4
	blt _0231A618
	mov r3, #0
	add r2, sp, #8
	b _0231A648
_0231A63C:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	add r0, r0, r1
_0231A648:
	cmp r3, r4
	blt _0231A63C
	bl DungeonRandInt
	mov r3, #0
	add r2, sp, #8
	b _0231A670
_0231A660:
	ldr r1, [r2, r3, lsl #2]
	subs r0, r0, r1
	bmi _0231A678
	add r3, r3, #1
_0231A670:
	cmp r3, r4
	blt _0231A660
_0231A678:
	add r1, sp, #0x28
	ldr r1, [r1, r3, lsl #2]
	mov r0, #1
	str r1, [sb]
_0231A688:
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231A690: .word DIRECTIONS_XY
	arm_func_end ov29_0231A460

	arm_func_start IsTargetInRange
IsTargetInRange: ; 0x0231A694
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r0
	mov r5, r1
	ldrsh r1, [sb, #6]
	ldrsh r0, [r5, #6]
	mov r8, r2
	mov r7, r3
	sub r0, r1, r0
	bl abs
	ldrsh r2, [sb, #4]
	ldrsh r1, [r5, #4]
	mov r6, r0
	sub r0, r2, r1
	bl abs
	mov r4, r0
	cmp r4, r6
	movle r4, r6
	cmp r4, r7
	mov r0, sb
	mov r1, #3
	movgt r4, r7
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0231A708
	cmp r4, r7
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0231A708:
	ldr r1, _0231A798 ; =DIRECTIONS_XY
	mov r2, r8, lsl #2
	ldr r0, _0231A79C ; =ov29_0235171E
	ldrsh r7, [sb, #4]
	ldrsh r8, [sb, #6]
	ldrsh sb, [r1, r2]
	ldrsh sl, [r0, r2]
	mov r6, #0
	b _0231A788
_0231A72C:
	add r7, r7, sb
	add r8, r8, sl
	cmp r7, #1
	cmpge r8, #1
	blt _0231A790
	cmp r7, #0x37
	cmplt r8, #0x1f
	bge _0231A790
	mov r0, r7
	mov r1, r8
	bl GetTile
	ldrh r1, [r0]
	tst r1, #3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [r0, #0xc]
	cmp r0, r5
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add r6, r6, #1
_0231A788:
	cmp r6, r4
	ble _0231A72C
_0231A790:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0231A798: .word DIRECTIONS_XY
_0231A79C: .word ov29_0235171E
	arm_func_end IsTargetInRange

	arm_func_start ShouldUsePp
ShouldUsePp: ; 0x0231A7A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r1, #0x52
	mov r7, r0
	mov r5, r4
	mov r6, r4
	bl ExclusiveItemEffectIsActive__0231A87C
	cmp r0, #0
	mov r0, r7
	mov r1, #0x1f
	movne r4, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r5, #1
	cmp r5, #0
	beq _0231A81C
	ldr r0, _0231A870 ; =ov10_022C459C
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0231A81C
	mov r0, r7
	bl ov29_022E3ED0
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231A874 ; =0x00000DF5
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r6, #1
_0231A81C:
	cmp r6, #0
	bne _0231A868
	cmp r4, #0
	beq _0231A868
	ldr r0, _0231A870 ; =ov10_022C459C
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0231A868
	mov r0, r7
	bl ov29_022E3ED0
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231A878 ; =0x00000DF7
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r6, #1
_0231A868:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0231A870: .word ov10_022C459C
#ifdef JAPAN
_0231A874: .word 0x00000B35
_0231A878: .word 0x00000B37
#else
_0231A874: .word 0x00000DF5
_0231A878: .word 0x00000DF7
#endif
	arm_func_end ShouldUsePp

	arm_func_start ExclusiveItemEffectIsActive__0231A87C
ExclusiveItemEffectIsActive__0231A87C: ; 0x0231A87C
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__0231A87C

	arm_func_start ov29_0231A8A0
ov29_0231A8A0: ; 0x0231A8A0
#ifdef JAPAN
#define OV29_0231A8A0_OFFSET -4
#else
#define OV29_0231A8A0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sb, r0
	mov r7, #0
	bl IsMonster__0231A9D4
	cmp r0, #0
	beq _0231A910
	ldr r0, _0231A9CC ; =DUNGEON_PTR
	ldr r4, [sb, #0xb4]
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreMovesEnabled
	cmp r0, #0
	bne _0231A8EC
	ldr r1, _0231A9D0 ; =0x00000DFD
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	b _0231A9C4
_0231A8EC:
	mov r1, r7
	mov r0, sb
	strb r1, [r4, #0x23f + OV29_0231A8A0_OFFSET]
	bl ShouldUsePp
	cmp r0, #0
	movne r7, #1
	strneb r7, [r4, #0x23f + OV29_0231A8A0_OFFSET]
	mov r0, #0
	strb r0, [r4, #0x23e + OV29_0231A8A0_OFFSET]
_0231A910:
	mov r6, #0
	mov r4, #1
	mov r5, r6
	mov sl, r4
	b _0231A970
_0231A924:
	ldr r8, [sb, #0xb4]
	mov r0, sb
	str r5, [sp]
	ldrb r1, [r8, #0x4e]
	mov r2, r4
	mov r3, r5
	bl ov29_0232145C
	mov r0, sb
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _0231A984
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r8, #0x23e + OV29_0231A8A0_OFFSET]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x163 + OV29_0231A8A0_OFFSET]
	cmpeq r0, #0
	bne _0231A984
	add r6, r6, #1
_0231A970:
	mov r0, sb
	mov r1, sl
	bl GetNumberOfAttacks
	cmp r6, r0
	blt _0231A924
_0231A984:
	mov r0, sb
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _0231A9BC
	cmp r7, #0
	moveq r1, #1
	movne r1, #0
	ldr r4, [sb, #0xb4]
	mov r0, sb
	and r1, r1, #0xff
	bl UpdateMovePp
	ldrb r1, [r4, #0x4e]
	mov r0, sb
	bl ov29_022FA574
_0231A9BC:
	mov r0, sb
	bl TryActivateTruant
_0231A9C4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0231A9CC: .word DUNGEON_PTR
#ifdef JAPAN
_0231A9D0: .word 0x00000B3D
#else
_0231A9D0: .word 0x00000DFD
#endif
	arm_func_end ov29_0231A8A0
