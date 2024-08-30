	.include "asm/macros.inc"
	.include "overlay_29_023055B0.inc"

	.text

	arm_func_start ov29_023055B0
ov29_023055B0: ; 0x023055B0
#ifdef JAPAN
#define OV29_023055B0_OFFSET -4
#else
#define OV29_023055B0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, #0
	mov r5, #1
	ldr r4, _02305690 ; =DUNGEON_PTR
	b _02305684
_023055C4:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__0230558C
	cmp r0, #0
	beq _02305680
	ldr r8, [r7, #0xb4]
	ldrb r0, [r8, #7]
	cmp r0, #0
	bne _02305680
	mov r0, r8
	bl ov29_022FBE04
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r8, #0x100
	ldrsh r1, [r0, #0x7e + OV29_023055B0_OFFSET]
	cmp r1, #0
	ldreqsh r0, [r0, #0x80 + OV29_023055B0_OFFSET]
	cmpeq r0, #0
	beq _02305680
	ldrsh r0, [r7, #4]
	cmp r1, r0
	addeq r0, r8, #0x100
	ldreqsh r1, [r0, #0x80 + OV29_023055B0_OFFSET]
	ldreqsh r0, [r7, #6]
	cmpeq r1, r0
	beq _02305680
	mov r0, r7
	mov r1, r5
	bl CheckVariousStatuses2
	cmp r0, #0
	bne _02305680
	add r1, r8, #0x7e + OV29_023055B0_OFFSET
	add r0, r7, #4
	add r1, r1, #0x100
	bl GetDirectionTowardsPosition
	mov sb, r0
	and r1, sb, #7
	mov r0, r7
	strb r1, [r8, #0x4c]
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	mov r2, sb
	bl ChangeMonsterAnimation
_02305680:
	add r6, r6, #1
_02305684:
	cmp r6, #0x14
	blt _023055C4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02305690: .word DUNGEON_PTR
	arm_func_end ov29_023055B0

	arm_func_start CheckNonLeaderTile
CheckNonLeaderTile: ; 0x02305694
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r8, [sb, #0xb4]
	bl EntityIsValid__0230558C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	bl GetTileAtEntity
	mov r4, r0
	mov r0, sb
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r8, #0xef]
	cmpne r0, #3
	beq _02305708
	mov r0, sb
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _023056F8
	mov r0, sb
	mov r1, #0x10
	bl HasHeldItem
_023056F8:
	cmp r0, #0
	bne _02305708
	add r0, sb, #4
	bl ov29_02337D68
_02305708:
	ldr r4, [r4, #0x10]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02305724: ; jump table
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 1
	b _02305740 ; case 2
	b _02305808 ; case 3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 6
_02305740:
	mov r0, r4
	bl GetTrapInfo
	ldrb r1, [r8, #6]
	mov r6, #0
	mov r5, r0
	mov r7, r6
	cmp r1, #0
	bne _02305790
	mov r0, sb
	mov r1, #0x13
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02305790
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	bne _02305790
	mov r0, #1
	strb r0, [r4, #0x20]
	bl UpdateTrapsVisibility
	mov r7, #1
_02305790:
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _023057B8
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	beq _023057E0
	ldrb r0, [r8, #6]
	cmp r0, #0
	moveq r6, #1
	b _023057E0
_023057B8:
	cmp r0, #1
	bne _023057D0
	ldrb r0, [r8, #6]
	cmp r0, #0
	movne r6, #1
	b _023057E0
_023057D0:
	cmp r0, #2
	ldreqb r0, [r8, #6]
	cmpeq r0, #0
	moveq r6, #1
_023057E0:
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	add r1, sb, #4
	mov r2, #0
	mov r3, #1
	bl TryTriggerTrap
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02305808:
	mov r0, sb
	bl TryNonLeaderItemPickUp
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CheckNonLeaderTile

	arm_func_start ov29_02305814
ov29_02305814: ; 0x02305814
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__0230558C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl IsFloorOver
	cmp r0, #0
	ldreq r0, _023058BC ; =DUNGEON_PTR
	ldreq r0, [r0]
	ldreqb r0, [r0, #0x793]
	cmpeq r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl GetTileAtEntity
	ldrh r0, [r0]
	tst r0, #0x40
	ldmeqia sp!, {r3, r4, r5, pc}
	bl GetLeader
	ldr r1, _023058C0 ; =0x00000C82
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _023058BC ; =DUNGEON_PTR
	mov r0, r5
	ldr r2, [r1]
	mov r3, #1
	mov r1, r4
	strb r3, [r2, #0x794]
	bl TryTriggerMonsterHouse
	mov r0, #0
	bl ov29_022E3A58
	add r0, r5, #4
	bl ov29_022E2CA0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x78
	mov r1, #0x39
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023058BC: .word DUNGEON_PTR
#ifdef JAPAN
_023058C0: .word 0x000009C2
#else
_023058C0: .word 0x00000C82
#endif
	arm_func_end ov29_02305814

	arm_func_start EndNegativeStatusCondition
EndNegativeStatusCondition: ; 0x023058C4
#ifdef JAPAN
#define END_NEGATIVE_STATUS_CONDITION_OFFSET -4
#else
#define END_NEGATIVE_STATUS_CONDITION_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r7, r3
	mov r5, r4
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	mov r1, r4
	ldr r6, [sb, #0xb4]
	bl MonsterHasNegativeStatus
	cmp r0, #0
	beq _02305AD8
	mov r0, sb
	mov r4, #1
	bl IsMonsterDrowsy
	cmp r0, #0
	beq _0230593C
	mov r2, r5
	mov fp, r4
	mov r0, sl
	mov r1, sb
	mov r3, r2
	str fp, [sp]
	bl EndSleepClassStatus
_0230593C:
	mov r0, sb
	bl EntityIsValid__02305C04
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	bl MonsterHasNonvolatileNonsleepStatus
	cmp r0, #0
	beq _0230596C
	mov r0, sl
	mov r1, sb
	bl EndBurnClassStatus
_0230596C:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	mov r0, sb
	beq _0230599C
	bl MonsterHasImmobilizingStatus
	cmp r0, #0
	beq _023059C0
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl EndFrozenClassStatus
	b _023059C0
_0230599C:
	bl MonsterHasImmobilizingStatus
	cmp r0, #0
	ldrneb r0, [r6, #0xc4]
	cmpne r0, #3
	beq _023059C0
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl EndFrozenClassStatus
_023059C0:
	mov r0, sb
	bl MonsterHasAttackInterferingStatus
	cmp r0, #0
	beq _023059DC
	mov r0, sl
	mov r1, sb
	bl EndCringeClassStatus
_023059DC:
	mov r0, sb
	bl MonsterHasSkillInterferingStatus
	cmp r0, #0
	beq _02305A00
	mov r0, sl
	mov r1, sb
	mov r2, #0
	mov r3, #1
	bl EndCurseClassStatus
_02305A00:
	mov r0, sb
	bl MonsterHasLeechSeedStatus
	cmp r0, #0
	beq _02305A1C
	mov r0, sl
	mov r1, sb
	bl EndLeechSeedClassStatus
_02305A1C:
	mov r0, sb
	bl MonsterHasWhifferStatus
	cmp r0, #0
	beq _02305A38
	mov r0, sl
	mov r1, sb
	bl EndSureShotClassStatus
_02305A38:
	mov r0, sb
	mov r1, #0
	bl IsMonsterVisuallyImpaired
	cmp r0, #0
	beq _02305A58
	mov r0, sl
	mov r1, sb
	bl EndBlinkerClassStatus
_02305A58:
	mov r0, sb
	bl IsMonsterMuzzled
	cmp r0, #0
	beq _02305A74
	mov r0, sl
	mov r1, sb
	bl EndMuzzledStatus
_02305A74:
	mov r0, sb
	bl MonsterHasMiracleEyeStatus
	cmp r0, #0
	beq _02305A90
	mov r0, sl
	mov r1, sb
	bl EndMiracleEyeStatus
_02305A90:
#ifdef JAPAN
	ldrb r0, [r6, #0x105]
#else
	ldrb r0, [r6, #0x106]
#endif
	cmp r0, #0
	beq _02305AB4
	ldr r2, _02305BF0 ; =0x00000C83
	mov r3, #0
	mov r0, sl
	mov r1, sb
#ifdef JAPAN
	strb r3, [r6, #0x105]
#else
	strb r3, [r6, #0x106]
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02305AB4:
	ldrb r0, [r6, #0xfe]
	cmp r0, #0
	beq _02305AD8
	ldr r2, _02305BF4 ; =0x00000C84
	mov r3, #0
	mov r0, sl
	mov r1, sb
	strb r3, [r6, #0xfe]
	bl LogMessageByIdWithPopupCheckUserTarget
_02305AD8:
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r2, #0
	mov fp, r0
	mov r1, r2
_02305AEC:
	add r0, r6, r2
	add r2, r2, #1
	strb r1, [r0, #0x119 + END_NEGATIVE_STATUS_CONDITION_OFFSET]
	cmp r2, #5
	blt _02305AEC
	mov r0, sb
	bl CalcSpeedStageWrapper
	cmp fp, r0
	beq _02305B40
	mov r0, #0
	mov r1, sb
	mov r2, r0
	mov r4, #1
	bl SubstitutePlaceholderStringTags
	ldr r1, [r6, #0x110 + END_NEGATIVE_STATUS_CONDITION_OFFSET]
	ldr r0, _02305BF8 ; =ov29_02353318
	mov r1, r1, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02305B40:
	mov fp, #0
	mov r1, #1
	add r2, r6, #0x124 + END_NEGATIVE_STATUS_CONDITION_OFFSET
	mov r0, fp
	mov ip, r1
_02305B54:
	ldrb r6, [r2, fp, lsl #3]
	add r3, r2, fp, lsl #3
	tst r6, #1
	movne r6, r1
	moveq r6, r0
	tst r6, #0xff
	beq _02305B88
	ldrh r6, [r3, #2]
	tst r6, #1
	bicne r6, r6, #1
	movne r4, ip
	movne r5, ip
	strneh r6, [r3, #2]
_02305B88:
	add fp, fp, #1
	cmp fp, #4
	blt _02305B54
	cmp r4, #0
	beq _02305BC8
	cmp r8, #0
	beq _02305BAC
	mov r0, sb
	bl ov29_022E543C
_02305BAC:
	cmp r5, #0
	beq _02305BE0
	ldr r2, _02305BFC ; =0x00000C85
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02305BE0
_02305BC8:
	cmp r7, #0
	bne _02305BE0
	ldr r2, _02305C00 ; =0x00000C86
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02305BE0:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define END_NEGATIVE_STATUS_CONDITION_DATA_OFFSET -0x2C0
#else
#define END_NEGATIVE_STATUS_CONDITION_DATA_OFFSET 0
#endif
_02305BF0: .word 0x00000C83 + END_NEGATIVE_STATUS_CONDITION_DATA_OFFSET
_02305BF4: .word 0x00000C84 + END_NEGATIVE_STATUS_CONDITION_DATA_OFFSET
_02305BF8: .word ov29_02353318
_02305BFC: .word 0x00000C85 + END_NEGATIVE_STATUS_CONDITION_DATA_OFFSET
_02305C00: .word 0x00000C86 + END_NEGATIVE_STATUS_CONDITION_DATA_OFFSET
	arm_func_end EndNegativeStatusCondition
