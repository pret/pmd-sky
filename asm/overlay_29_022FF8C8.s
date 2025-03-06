	.include "asm/macros.inc"
	.include "overlay_29_022FF8C8.inc"

	.text

#ifndef JAPAN
	arm_func_start GetMobilityTypeAfterIqSkills
GetMobilityTypeAfterIqSkills: ; 0x022FF8C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #3
	beq _022FF8EC
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
_022FF8EC:
	mov r0, r5
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMobilityTypeAfterIqSkills
#endif

	arm_func_start ov29_022FF908
ov29_022FF908: ; 0x022FF908
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	ldrb r1, [r4, #0xef]
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r4, #2]
	mov r0, r5
	bl GetMobilityTypeCheckSlipAndFloating
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FF908

	arm_func_start ov29_022FF958
ov29_022FF958: ; 0x022FF958
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _022FFA0C
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA0C:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl GetMobilityTypeCheckSlipAndFloating
	ldrh r2, [r4]
#ifdef JAPAN
	mov r4, r0
	mov r0, r6
	mov r1, #0xc
	and r5, r2, #3
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r6
	mov r1, #0xd
	movne r4, #2
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	cmp r4, #3
	addls pc, pc, r4, lsl #2
#else
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl GetMobilityTypeAfterIqSkills
	cmp r0, #3
	addls pc, pc, r0, lsl #2
#endif
	b _022FFA84
_022FFA38: ; jump table
	b _022FFA48 ; case 0
	b _022FFA58 ; case 1
	b _022FFA74 ; case 2
	b _022FFA84 ; case 3
_022FFA48:
#ifdef JAPAN
	cmp r5, #1
#else
	cmp r4, #1
#endif
	bne _022FFA8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA58:
#ifdef JAPAN
	cmp r5, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #1
#else
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
#endif
	bne _022FFA8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA74:
#ifdef JAPAN
	cmp r5, #0
#else
	cmp r4, #0
#endif
	beq _022FFA8C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA84:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFA8C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FF958

	arm_func_start ov29_022FFA94
ov29_022FFA94: ; 0x022FFA94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl GetMobilityTypeCheckSlipAndFloating
	ldrh r1, [r4]
	cmp r0, #3
	and r1, r1, #3
	addls pc, pc, r0, lsl #2
	b _022FFB80
_022FFB34: ; jump table
	b _022FFB44 ; case 0
	b _022FFB54 ; case 1
	b _022FFB70 ; case 2
	b _022FFB70 ; case 3
_022FFB44:
	cmp r1, #1
	bne _022FFB88
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB54:
	cmp r1, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #1
	bne _022FFB88
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB70:
	cmp r1, #0
	beq _022FFB88
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB80:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFB88:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FFA94

	arm_func_start ov29_022FFB90
ov29_022FFB90: ; 0x022FFB90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _022FFC44
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FFC44:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl GetMobilityTypeCheckSlipAndFloating
	ldrh r2, [r4]
#ifdef JAPAN
	mov r4, r0
	mov r0, r6
	mov r1, #0xc
	and r5, r2, #3
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r6
	mov r1, #0xd
	movne r4, #2
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	cmp r4, #3
	addls pc, pc, r4, lsl #2
#else
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl GetMobilityTypeAfterIqSkills
	cmp r0, #3
	addls pc, pc, r0, lsl #2
#endif
	b _022FFC94
_022FFC70: ; jump table
	b _022FFC80 ; case 0
	b _022FFC80 ; case 1
	b _022FFC80 ; case 2
	b _022FFC94 ; case 3
_022FFC80:
#ifdef JAPAN
	cmp r5, #0
#else
	cmp r4, #0
#endif
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFC94:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FFB90

	arm_func_start CannotStandOnTile
CannotStandOnTile: ; 0x022FFC9C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _022FFD38
	ldr r0, [r1]
	cmp r0, #1
	bne _022FFD30
	ldr r0, [r1, #0xb4]
	cmp r0, r5
	beq _022FFD38
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFD30:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFD38:
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _022FFD6C
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FFD6C:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl GetMobilityTypeCheckSlipAndFloating
	ldrh r2, [r4]
#ifdef JAPAN
	mov r4, r0
	mov r0, r6
	mov r1, #0xc
	and r5, r2, #3
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r6
	mov r1, #0xd
	movne r4, #2
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	cmp r4, #3
	addls pc, pc, r4, lsl #2
#else
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl GetMobilityTypeAfterIqSkills
	cmp r0, #3
	addls pc, pc, r0, lsl #2
#endif
	b _022FFDE4
_022FFD98: ; jump table
	b _022FFDA8 ; case 0
	b _022FFDB8 ; case 1
	b _022FFDD4 ; case 2
	b _022FFDE4 ; case 3
_022FFDA8:
#ifdef JAPAN
	cmp r5, #1
#else
	cmp r4, #1
#endif
	bne _022FFDEC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDB8:
#ifdef JAPAN
	cmp r5, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #1
#else
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
#endif
	bne _022FFDEC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDD4:
#ifdef JAPAN
	cmp r5, #0
#else
	cmp r4, #0
#endif
	beq _022FFDEC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FFDEC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CannotStandOnTile

	arm_func_start CalcSpeedStage
CalcSpeedStage: ; 0x022FFDF4
#ifdef JAPAN
#define CALC_SPEED_STAGE_OFFSET -4
#else
#define CALC_SPEED_STAGE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r6, [r8, #0xb4]
	bl GetApparentWeather
	mov r4, #0
	mov r5, r0
	mov r1, r4
_022FFE14:
	add r2, r6, r1
	ldrb r0, [r2, #0x119 + CALC_SPEED_STAGE_OFFSET]
	add r1, r1, #1
	cmp r0, #0
	ldrb r0, [r2, #0x114 + CALC_SPEED_STAGE_OFFSET]
	subne r4, r4, r7
	cmp r0, #0
	addne r4, r4, r7
	cmp r1, #5
	blt _022FFE14
	ldrb r0, [r6, #0xbf]
	cmp r0, #4
	ldrsh r0, [r6, #2]
	subeq r4, r4, #1
	bl GetSpeedStatus
	add r4, r4, r0
	mov r0, r8
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	beq _022FFE78
	mov r0, r8
	bl GetApparentWeather
	cmp r0, #7
	addeq r4, r4, #1
_022FFE78:
	mov r0, r8
	mov r1, #0x3a
	bl IqSkillIsEnabled
	cmp r0, #0
	ldr r1, _022FFF18 ; =EXCL_ITEM_EFFECTS_WEATHER_MOVE_SPEED_BOOST
	addne r4, r4, #1
	ldrb r0, [r1, r5]
	cmp r0, #0
	beq _022FFEB0
	ldrb r1, [r1, r5]
	mov r0, r8
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	addne r4, r4, #1
_022FFEB0:
	ldrsh r1, [r6, #4]
	ldr r0, _022FFF1C ; =0x000001A5
	cmp r1, r0
	addne r0, r0, #0x72
	cmpne r1, r0
	ldrsh r1, [r6, #2]
	ldr r0, _022FFF20 ; =0x0000017F
	addeq r4, r4, #1
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	bne _022FFEFC
	ldrb r0, [r6, #6]
	cmp r0, #0
	ldrne r0, _022FFF24 ; =DUNGEON_PTR
	ldrne r0, [r0]
	ldrneb r0, [r0, #0x790]
	cmpne r0, #0
	addne r4, r4, #1
_022FFEFC:
	cmp r4, #0
	movlt r4, #0
	cmp r4, #5
	movge r4, #4
	mov r0, r4
	str r4, [r6, #0x110 + CALC_SPEED_STAGE_OFFSET]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FFF18: .word EXCL_ITEM_EFFECTS_WEATHER_MOVE_SPEED_BOOST
_022FFF1C: .word 0x000001A5
_022FFF20: .word 0x0000017F
_022FFF24: .word DUNGEON_PTR
	arm_func_end CalcSpeedStage

	arm_func_start ExclusiveItemEffectIsActive__022FFF28
ExclusiveItemEffectIsActive__022FFF28: ; 0x022FFF28
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
	arm_func_end ExclusiveItemEffectIsActive__022FFF28

	arm_func_start CalcSpeedStageWrapper
CalcSpeedStageWrapper: ; 0x022FFF4C
	ldr ip, _022FFF58 ; =CalcSpeedStage
	mov r1, #1
	bx ip
	.align 2, 0
_022FFF58: .word CalcSpeedStage
	arm_func_end CalcSpeedStageWrapper

	arm_func_start GetNumberOfAttacks
GetNumberOfAttacks: ; 0x022FFF5C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r5, #0
	mov sl, r0
	mov sb, r1
	mov r6, r5
	mov r7, r5
	bl EntityIsValid__023000E4
	cmp r0, #0
	moveq r0, r5
	beq _023000D4
	mov r0, sl
	bl GetApparentWeather
	mov r8, r0
	cmp r8, #4
	bne _022FFFB8
	mov r0, sl
	mov r1, #0x1b
	bl AbilityIsActive
	cmp r0, #0
	movne r5, #1
	movne r6, r5
	b _022FFFD8
_022FFFB8:
	cmp r8, #1
	bne _022FFFD8
	mov r0, sl
	mov r1, #0x4a
	bl AbilityIsActive
	cmp r0, #0
	movne r5, #1
	movne r6, r5
_022FFFD8:
	ldr r4, _023000DC ; =EXCL_ITEM_EFFECTS_WEATHER_ATK_SPEED_BOOST
	ldrb r0, [r4, r8]
	cmp r0, #0
	beq _02300000
	ldrb r1, [r4, r8]
	mov r0, sl
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	ldrneb r7, [r4, r8]
	movne r5, #1
_02300000:
	mov r0, sl
	mov r1, #0x54
	bl AbilityIsActive
	cmp r0, #0
	beq _02300028
	ldr r0, [sl, #0xb4]
	ldrsh r0, [r0, #0x66]
	cmp r0, #0
	moveq r5, #1
	moveq r6, r5
_02300028:
	cmp sb, #0
	beq _023000C8
	cmp r6, #0
	beq _02300068
	ldr r0, [sl, #0xb4]
	mov r2, r5
	mov r1, #0x40
	bl UpdateStateFlags
	cmp r0, #0
	beq _023000C8
	mov r0, sl
	bl ov29_022E655C
#ifdef JAPAN
	ldr r1, _02301510 ; =0x0000096F
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xc30
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _023000C8
_02300068:
	cmp r7, #0
	beq _023000C8
	ldr r0, [sl, #0xb4]
	mov r2, r5
	mov r1, #0x40
	bl UpdateStateFlags
	cmp r0, #0
	beq _023000C8
	mov r0, sl
	bl ov29_022E655C
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, sl
	mov r1, r7
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #0
	bl ov29_02344B44
#ifdef JAPAN
	mov r0, sl
	mov r1, #0x970
#else
	ldr r1, _023000E0 ; =0x00000C31
	mov r0, sl
#endif
	bl LogMessageByIdWithPopupCheckUser
_023000C8:
	cmp r5, #0
	movne r0, #2
	moveq r0, #1
_023000D4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023000DC: .word EXCL_ITEM_EFFECTS_WEATHER_ATK_SPEED_BOOST
#ifdef JAPAN
_02301510: .word 0x0000096F
#else
_023000E0: .word 0x00000C31
#endif
	arm_func_end GetNumberOfAttacks
