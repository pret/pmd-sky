	.include "asm/macros.inc"
	.include "overlay_29_0232393C.inc"

	.text

	arm_func_start ov29_0232393C
ov29_0232393C: ; 0x0232393C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	ldr r0, [r0, #0xb4]
	mov sb, r2
	str r0, [sp, #0x18]
	mov sl, r1
	ldrh r0, [sb, #4]
	ldr r1, [sp, #0x60]
	str r3, [sp]
	str r1, [sp, #0x60]
	ldr r7, [sl, #0xb4]
	bl GetMoveAnimationSpeed
	cmp r0, #1
	moveq r6, #2
	beq _02323984
	cmp r0, #2
	moveq r6, #3
	movne r6, #6
_02323984:
	ldr r0, [sp, #0x18]
	ldr r4, _02323C30 ; =DIRECTIONS_XY
	ldrb r1, [r0, #0x4c]
	ldrsh r0, [sl, #4]
	ldr r5, _02323C34 ; =DIRECTIONS_XY + 2
	add r1, r1, #4
	strh r0, [sp, #0x34]
	and r0, r1, #7
	mov r8, r0, lsl #2
	ldrsh r4, [r4, r8]
	ldrsh r3, [sl, #6]
	add r1, sp, #0x34
	str r4, [sp, #0x24]
	ldrsh r4, [r5, r8]
	strh r3, [sp, #0x36]
	ldr r3, [sp]
	mov r0, sl
	mov r2, sb
	str r4, [sp, #0x20]
	bl ov29_02322F78
	mov r4, r0
	mov r1, r6
	mov r0, #0x18
	bl _s32_div_f
	str r0, [sp, #4]
	ldr r0, [sp]
	cmp r0, #2
	mov r2, r0
	ldr r0, [sp, #4]
	mul r1, r2, r0
	blt _02323A18
	add r0, r1, #8
	str r0, [sp, #0x14]
	cmp r0, #0x40
	movge r0, #0x40
	strge r0, [sp, #0x14]
	b _02323A20
_02323A18:
	mov r0, #0x20
	str r0, [sp, #0x14]
_02323A20:
	mov r0, #0x80000
	mov r5, #0
	bl _s32_div_f
	str r0, [sp, #0x1c]
	ldrb r2, [r7, #0x4c]
	ldr r1, _02323C38 ; =ov29_02352A8C
	mov r0, #1
	ldr r1, [r1, r2, lsl #2]
	str r1, [sp, #0x10]
	bl ov29_0234B4CC
	ldr r0, [sp, #0x24]
	mov r2, r6, lsl #8
	mul r1, r0, r2
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	mul r1, r0, r2
	mov fp, r5
	str r1, [sp, #8]
	b _02323BC0
_02323A6C:
	ldrsh r2, [sp, #0x34]
	cmp r2, #0
	ldrgesh r1, [sp, #0x36]
	cmpge r1, #0
	blt _02323BCC
	cmp r2, #0x38
	cmplt r1, #0x20
	bge _02323BCC
	ldr r0, [sp, #0x24]
	ldrh r6, [sp, #0x34]
	add r2, r2, r0
	ldr r0, [sp, #0x20]
	ldrh r3, [sp, #0x36]
	add r1, r1, r0
	add r0, sp, #0x34
	strh r6, [sp, #0x30]
	strh r3, [sp, #0x32]
	strh r2, [sp, #0x34]
	strh r1, [sp, #0x36]
	bl ov29_022E2CA0
	cmp r0, #0
	beq _02323BB0
	ldr r0, _02323C3C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	bne _02323BB0
	ldrsh r2, [sp, #0x30]
	ldrsh r1, [sp, #0x32]
	mov r0, #0x18
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r0, r0, #0x10
	mov r8, r0, lsl #8
	mov r0, r4, lsl #0x10
	add r1, r2, #0xc
	mov r0, r0, asr #0x10
	mov r7, r1, lsl #8
	mov r6, #0
	str r0, [sp, #0x28]
	b _02323BA0
_02323B14:
	cmp r4, #0
	blt _02323B7C
	ldr r0, [sp, #0x60]
	cmp r0, #1
	movne r0, #0
	bne _02323B3C
	mov r0, r5, asr #8
	bl SinAbs4096
	ldr r1, [sp, #0x14]
	mul r0, r1, r0
_02323B3C:
	sub r0, r8, r0
	ldr r2, _02323C3C ; =DUNGEON_PTR
	mov r0, r0, asr #8
	strh r0, [sp, #0x2e]
	mov r0, r7, asr #8
	ldr r3, [r2]
	strh r0, [sp, #0x2c]
	ldr r2, _02323C40 ; =0x0001A226
	ldr r0, [sp, #0x28]
	ldrsh r2, [r3, r2]
	add r1, sp, #0x2c
	rsb r2, r2, r8, asr #8
	add r3, r2, r2, lsr #31
	ldr r2, [sp, #0x10]
	add r2, r2, r3, asr #1
	bl ov10_022BEB2C
_02323B7C:
	mov r0, #0x30
	bl AdvanceFrame
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r7, r7, r0
	ldr r0, [sp, #8]
	add r8, r8, r0
	ldr r0, [sp, #0x1c]
	add r5, r5, r0
_02323BA0:
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _02323B14
	b _02323BBC
_02323BB0:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #4]
	mla r5, r1, r0, r5
_02323BBC:
	add fp, fp, #1
_02323BC0:
	ldr r0, [sp]
	cmp fp, r0
	blt _02323A6C
_02323BCC:
	cmp r4, #0
	blt _02323BE0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_02323BE0:
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r0, #0
	bl ov29_0234B4CC
	mov r0, #1
	mov r1, #0x4a
	bl ov29_022EA370
	ldrh r1, [sb, #4]
	ldr r0, _02323C44 ; =0x00000232
	add r3, sp, #0x34
	cmp r1, r0
	ldreq r0, [sp, #0x18]
	moveq r1, #0
#ifdef JAPAN
	streqb r1, [r0, #0x16c]
#else
	streqb r1, [r0, #0x170]
#endif
	mov r0, sl
	mov r2, sb
	mov r1, #0
	bl PlayMoveAnimation
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02323C30: .word DIRECTIONS_XY
_02323C34: .word DIRECTIONS_XY + 2
_02323C38: .word ov29_02352A8C
_02323C3C: .word DUNGEON_PTR
#ifdef JAPAN
_02323C40: .word 0x0001A182
#else
_02323C40: .word 0x0001A226
#endif
_02323C44: .word 0x00000232
	arm_func_end ov29_0232393C

	arm_func_start MoveHitCheck
MoveHitCheck: ; 0x02323C48
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov fp, r2
	mov r7, r0
	mov r6, r1
	mov r0, fp
	mov r1, r3
	bl GetMoveAccuracyOrAiChance
	mov r8, r0
	mov r0, #0x64
	bl DungeonRandInt
	mov r1, #0
	str r1, [sp, #4]
	ldr sb, [r7, #0xb4]
	str r0, [sp, #8]
	ldrsh r0, [sb, #2]
	mov r1, r1
	str r1, [sp]
	ldr r5, [r6, #0xb4]
	bl GetMonsterGenderVeneer
	cmp r0, #2
	moveq r0, #1
	streq r0, [sp, #4]
	ldrsh r0, [r5, #2]
	bl GetMonsterGenderVeneer
	cmp r0, #2
	moveq r0, #1
	streq r0, [sp]
	ldrb r0, [sp, #0x30]
	mov sl, #0
	mov r4, sl
	cmp r0, #0
	beq _02323CD8
	cmp r7, r6
	moveq r0, #1
	beq _02324008
_02323CD8:
	ldrh r1, [fp, #4]
	ldr r0, _02324010 ; =0x00000163
	cmp r1, r0
	bne _02323D00
	mov r0, r7
	mov r1, #4
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #1
	bne _02324008
_02323D00:
	ldrb r0, [sb, #0xec]
	cmp r0, #1
	moveq r0, #1
	beq _02324008
	cmp r0, #2
	moveq r0, #0
	beq _02324008
	cmp r8, #0x64
	movgt r0, #1
	bgt _02324008
	mov r0, r6
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _02323D4C
	mov r0, r6
	mov r1, #0x2a
	bl HasHeldItem
_02323D4C:
	cmp r0, #0
	ldrne r0, _02324014 ; =DETECT_BAND_MOVE_ACCURACY_DROP
	mov r1, #5
	ldrne r0, [r0]
	subne r8, r8, r0
	mov r0, r6
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _02324018 ; =QUICK_DODGER_MOVE_ACCURACY_DROP
	mov r1, #0x33
	ldrne r0, [r0]
	ldrsh sb, [sb, #0x2c]
	subne r8, r8, r0
	mov r0, r7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrh r0, [fp, #4]
	addne sl, sl, #2
	cmp r0, #0x40
	bne _02323DB8
	mov r0, r7
	bl GetApparentWeather
	cmp r0, #4
	moveq r0, #1
	beq _02324008
	cmp r0, #1
	subeq sl, sl, #2
_02323DB8:
	ldrh r1, [fp, #4]
	ldr r0, _0232401C ; =0x0000010E
	cmp r1, r0
	bne _02323DDC
	mov r0, r7
	bl GetApparentWeather
	cmp r0, #5
	moveq r0, #1
	beq _02324008
_02323DDC:
	mov r0, r7
	mov r1, #0x30
	bl IqSkillIsEnabled
	cmp r0, #0
	addne sl, sl, #1
	ldrb r0, [r5, #0xfe]
	add sb, sb, sl
	ldrsh sl, [r5, #0x2e]
	cmp r0, #0
	mov r0, r6
	movne sl, #0xa
	bl GetApparentWeather
	cmp r0, #2
	bne _02323E30
	mov r0, r7
	mov r1, r6
	mov r2, #0x1d
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	addne r4, r4, #2
_02323E30:
	mov r0, r7
	mov r1, #0x30
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02323E54
	ldrh r0, [fp, #4]
	bl MoveIsNotPhysical
	cmp r0, #0
	addeq r4, r4, #2
_02323E54:
	mov r0, r6
	mov r1, #0x3f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02323E94
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _02324020 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r5, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	addle r4, r4, #2
_02323E94:
	mov r0, r6
	mov r1, #0x30
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r7
	mov r1, r6
	mov r2, #0x62
#ifndef JAPAN
	mov r3, #1
#endif
	subne r4, r4, #1
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02323ED8
	ldrb r0, [r5, #0xd0]
	cmp r0, #2
	ldrneb r0, [r5, #0xf1]
	cmpne r0, #2
	addeq r4, r4, #3
_02323ED8:
	mov r0, r7
	mov r1, r6
	mov r2, #0x77
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02323F18
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #5
	beq _02323F14
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #7
	bne _02323F18
_02323F14:
	add r4, r4, #2
_02323F18:
	mov r0, r6
	bl GetApparentWeather
	ldr r2, _02324024 ; =EXCL_ITEM_EFFECTS_EVASION_BOOST
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _02323F44
	ldrb r1, [r2, r0]
	mov r0, r6
	bl ExclusiveItemEffectIsActive__02323918
	cmp r0, #0
	addne r4, r4, #1
_02323F44:
	mov r0, r7
	mov r1, #0x6a
	add sl, sl, r4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne sb, #0xa
	mov r0, r7
	mov r1, r6
	mov r2, #0x6a
#ifndef JAPAN
	mov r3, #1
#endif
	movne sl, sb
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	movne sb, #0xa
	movne sl, sb
	cmp sb, #0
	movlt sb, #0
	blt _02323F94
	cmp sb, #0x14
	movgt sb, #0x14
_02323F94:
	ldr r2, _02324028 ; =MALE_ACCURACY_STAGE_MULTIPLIERS
	ldr r0, [sp, #4]
	mov r1, #0xa8
	mla r1, r0, r1, r2
	ldr r3, [r1, sb, lsl #2]
	cmp sl, #0
	movlt sl, #0
	cmp sl, #0x14
	movgt sl, #0x14
	cmp r3, #0
	movlt r3, #0
	cmp r3, #0x6400
	ldr r2, _0232402C ; =MALE_EVASION_STAGE_MULTIPLIERS
	ldr r0, [sp]
	mov r1, #0xa8
	mla r1, r0, r1, r2
	movgt r3, #0x6400
	mul r0, r8, r3
	ldr r1, [r1, sl, lsl #2]
	mov r8, r0, asr #8
	cmp r1, #0
	movlt r1, #0
	cmp r1, #0x6400
	movgt r1, #0x6400
	mul r1, r8, r1
	ldr r0, [sp, #8]
	cmp r0, r1, asr #8
	movlt r0, #1
	movge r0, #0
_02324008:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02324010: .word 0x00000163
_02324014: .word DETECT_BAND_MOVE_ACCURACY_DROP
_02324018: .word QUICK_DODGER_MOVE_ACCURACY_DROP
_0232401C: .word 0x0000010E
_02324020: .word 0x000003E7
_02324024: .word EXCL_ITEM_EFFECTS_EVASION_BOOST
_02324028: .word MALE_ACCURACY_STAGE_MULTIPLIERS
_0232402C: .word MALE_EVASION_STAGE_MULTIPLIERS
	arm_func_end MoveHitCheck

	arm_func_start BuildMoveTargetList
BuildMoveTargetList: ; 0x02324030
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r1, #1
	mov r4, #0
	mov r8, r2
	bl ov29_023024E0
	mov r6, r0
	mov r0, sb
	mov r1, r4
	bl ov29_023024E0
	str r0, [sp, #0x10]
	mov r0, sb
	mov r1, r8
	mov r2, r4
	bl GetEntityMoveTargetAndRange
	mov r5, r0
	and r0, r5, #0xf
	cmp r0, #4
	bne _023240C0
	mov r0, sb
	mov r1, r8
	bl IsChargingTwoTurnMove
	ldrh r1, [r8, #4]
	mov r5, r0
	cmp r1, #0x97
	bne _023240B4
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #1
	moveq r5, #1
_023240B4:
	cmp r5, #0
	movne r5, #0
	moveq r5, #0x73
_023240C0:
	ands r0, r5, #0xf0
	bne _023240FC
	mov r0, sb
	bl ov29_022F87C0
	cmp r0, #0
	beq _0232439C
	stmia sp, {r0, r8}
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, #0
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _0232439C
_023240FC:
	cmp r0, #0x10
	cmpne r0, #0x20
	bne _023241AC
	cmp r0, #0x20
	ldr r0, [sb, #0xb4]
	mov fp, #0
	ldreqb r7, [r0, #0x4c]
	moveq r0, #8
	ldrneb r1, [r0, #0x4c]
	streq r0, [sp, #0xc]
	movne r0, #3
	strne r0, [sp, #0xc]
	subne r7, r1, #1
	b _0232419C
_02324134:
	and r7, r7, #7
	ldr r1, _023243AC ; =DIRECTIONS_XY
	mov r2, r7, lsl #2
	ldrsh r2, [r1, r2]
	ldrsh r0, [sb, #4]
	add r1, r1, r7, lsl #2
	ldrsh r1, [r1, #2]
	add r0, r0, r2
	strh r0, [sp, #0x14]
	ldrsh r2, [sb, #6]
	add r0, sp, #0x14
	add r1, r2, r1
	strh r1, [sp, #0x16]
	bl PositionHasMonster
	cmp r0, #0
	beq _02324194
	stmia sp, {r0, r8}
	mov r0, r4
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_02324194:
	add fp, fp, #1
	add r7, r7, #1
_0232419C:
	ldr r0, [sp, #0xc]
	cmp fp, r0
	blt _02324134
	b _0232439C
_023241AC:
	cmp r0, #0x30
	bne _02324248
	mov fp, #0
_023241B8:
	ldr r0, _023243B0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, fp, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02324238
	mov r0, sb
	mov r1, r7
	bl ov29_022E28D4
	cmp r0, #0
	beq _02324238
	cmp r7, sb
	stmia sp, {r7, r8}
	mov r0, r4
	bne _02324220
	ldr r4, [sp, #0x10]
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r4, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _02324238
_02324220:
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_02324238:
	add fp, fp, #1
	cmp fp, #0x14
	blt _023241B8
	b _0232439C
_02324248:
	cmp r0, #0x40
	bne _023242C4
	mov r0, sb
	mov r7, #0
	bl ov29_022F8830
	cmp r0, #0
	beq _02324288
	stmia sp, {r0, r8}
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, r7
	str r6, [sp, #8]
	bl ov29_023243B4
	movs r4, r0
	movne r7, #1
_02324288:
	cmp r7, #0
	bne _0232439C
	mov r0, sb
	bl ov29_022F88C0
	cmp r0, #0
	beq _0232439C
	stmia sp, {r0, r8}
	mov r0, r4
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _0232439C
_023242C4:
	cmp r0, #0x50
	beq _0232439C
	cmp r0, #0x80
	cmpne r0, #0x90
	bne _0232430C
	mov r0, sb
	bl ov29_022F8830
	cmp r0, #0
	beq _0232439C
	stmia sp, {r0, r8}
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, #0
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
	b _0232439C
_0232430C:
	cmp r0, #0x60
	bne _02324370
	mov r7, #0
_02324318:
	ldr r0, _023243B0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr fp, [r0, #0xad4]
#else
	ldr fp, [r0, #0xb78]
#endif
	mov r0, fp
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02324360
	str fp, [sp]
	str r8, [sp, #4]
	mov r0, r4
	mov r1, sl
	mov r2, r5
	mov r3, sb
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_02324360:
	add r7, r7, #1
	cmp r7, #0x14
	blt _02324318
	b _0232439C
_02324370:
	cmp r0, #0x70
	bne _0232439C
	str sb, [sp]
	str r8, [sp, #4]
	mov r1, sl
	mov r2, r5
	mov r3, sb
	mov r0, #0
	str r6, [sp, #8]
	bl ov29_023243B4
	mov r4, r0
_0232439C:
	mov r0, #0
	str r0, [sl, r4, lsl #2]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023243AC: .word DIRECTIONS_XY
_023243B0: .word DUNGEON_PTR
	arm_func_end BuildMoveTargetList

	arm_func_start ov29_023243B4
ov29_023243B4: ; 0x023243B4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x18]
	ldrh r4, [r4, #4]
	mov r7, r1
	mov r8, r0
	cmp r4, #0xfc
	mov r6, r3
	mov r4, #0
	ldr r1, [r5, #0xb4]
	cmpeq r6, r5
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #9]
	cmp r0, #1
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	movne r4, #1
	bne _023244C0
	ands r0, r2, #0xf
	cmpne r0, #4
	bne _02324440
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	moveq r4, #1
	b _023244C0
_02324440:
	cmp r0, #1
	bne _02324468
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	moveq r4, #1
	b _023244C0
_02324468:
	cmp r0, #2
	moveq r4, #1
	beq _023244C0
	cmp r0, #5
	bne _02324488
	cmp r6, r5
	movne r4, #1
	b _023244C0
_02324488:
	cmp r0, #6
	bne _023244B8
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _023244C0
	cmp r6, r5
	movne r4, #1
	b _023244C0
_023244B8:
	cmp r0, #3
	moveq r4, #1
_023244C0:
	ldr r1, [sp, #0x1c]
	mov r0, r5
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	movne r4, #0
	cmp r4, #0
	beq _02324508
	cmp r8, #0x40
	bge _02324508
	str r5, [r7, r8, lsl #2]
	ldr r0, [r5, #0xb4]
	add r8, r8, #1
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldreq r0, _02324510 ; =ov29_0235370C
	ldreq r1, [r0]
	cmpeq r1, #0
	streq r5, [r0]
_02324508:
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02324510: .word ov29_0235370C
	arm_func_end ov29_023243B4

	arm_func_start ov29_02324514
ov29_02324514: ; 0x02324514
	stmdb sp!, {r3, lr}
	bl GetMoveNbStrikes
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #2
	mov r1, #6
	bl DungeonRandRange
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02324514

	arm_func_start IsHyperBeamVariant
IsHyperBeamVariant: ; 0x02324534
	ldrh r2, [r0, #4]
	cmp r2, #0xee
	moveq r0, #1
	bxeq lr
	cmp r2, #0xef
	moveq r0, #1
	bxeq lr
	cmp r2, #0xf2
	moveq r0, #1
	bxeq lr
	cmp r2, #0x110
	moveq r0, #1
	bxeq lr
	ldr r1, _023245A0 ; =0x000001C5
	cmp r2, r1
	moveq r0, #1
	bxeq lr
	add r0, r1, #2
	cmp r2, r0
	moveq r0, #1
	bxeq lr
	add r0, r1, #0x29
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023245A0: .word 0x000001C5
	arm_func_end IsHyperBeamVariant
