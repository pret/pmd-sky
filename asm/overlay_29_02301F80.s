	.include "asm/macros.inc"
	.include "overlay_29_02301F80.inc"

	.text

	arm_func_start IqSkillIsEnabled
IqSkillIsEnabled: ; 0x02301F80
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _02301FAC
	ldr r0, _02301FB8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02301FAC:
	add r0, r2, #0x9c
	bl IqSkillFlagTest
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301FB8: .word DUNGEON_PTR
	arm_func_end IqSkillIsEnabled

	arm_func_start UpdateIqSkills
UpdateIqSkills: ; 0x02301FBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrb r0, [r4, #6]
	mov r6, #0
	cmp r0, #0
	str r6, [r4, #0x9c]
	beq _02302118
	str r6, [r4, #0xa0]
	str r6, [r4, #0xa4]
	b _0230202C
_02301FE4:
	ldrsh r0, [r4, #2]
	and r1, r6, #0xff
	bl GetSpeciesIqSkill
	mov r5, r0
	cmp r5, #0xff
	beq _02302034
	ldrsh r0, [r4, #0xe]
	mov r1, r5
	bl CanLearnIqSkill
	cmp r0, #0
	beq _02302028
	mov r1, r5
	add r0, r4, #0x90
	bl EnableIqSkill
	mov r1, r5
	add r0, r4, #0x9c
	bl EnableIqSkill
_02302028:
	add r6, r6, #1
_0230202C:
	cmp r6, #0x19
	blt _02301FE4
_02302034:
	ldr r0, _023021E8 ; =MIN_IQ_EXCLUSIVE_MOVE_USER
	ldrsh r1, [r4, #0xe]
	ldrsh r0, [r0]
	cmp r1, r0
	bge _02302068
	add r0, r4, #0x9c
	mov r1, #0x17
	bl IqSkillFlagTest
	cmp r0, #0
	beq _02302068
	add r0, r4, #0x9c
	mov r1, #0x17
	bl DisableIqSkill
_02302068:
	mov r0, r4
	bl ov29_022FBDE0
	cmp r0, #0
	bne _0230208C
	ldr r0, _023021EC ; =MIN_IQ_ITEM_MASTER
	ldrsh r1, [r4, #0xe]
	ldrsh r0, [r0]
	cmp r1, r0
	bge _023020AC
_0230208C:
	add r0, r4, #0x9c
	mov r1, #0x16
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023020AC
	add r0, r4, #0x9c
	mov r1, #0x16
	bl DisableIqSkill
_023020AC:
	add r0, r4, #0x9c
	mov r1, #0x15
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023020CC
	add r0, r4, #0x9c
	mov r1, #0x15
	bl DisableIqSkill
_023020CC:
	add r0, r4, #0x9c
	mov r1, #0x14
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023020EC
	add r0, r4, #0x9c
	mov r1, #0x14
	bl DisableIqSkill
_023020EC:
	add r0, r4, #0x9c
	mov r1, #0xb
	bl IqSkillFlagTest
	cmp r0, #0
	beq _0230210C
	add r0, r4, #0x9c
	mov r1, #0xb
	bl DisableIqSkill
_0230210C:
	mov r0, #2
	strb r0, [r4, #0xa8]
	ldmia sp!, {r4, r5, r6, pc}
_02302118:
	str r6, [r4, #0xa0]
	str r6, [r4, #0xa4]
	b _02302174
_02302124:
	ldrsh r0, [r4, #2]
	and r1, r6, #0xff
	bl GetSpeciesIqSkill
	mov r5, r0
	cmp r5, #0xff
	beq _0230217C
	ldrsh r0, [r4, #0xe]
	mov r1, r5
	bl CanLearnIqSkill
	cmp r0, #0
	beq _02302170
	mov r1, r5
	add r0, r4, #0x90
	bl IqSkillFlagTest
	cmp r0, #0
	beq _02302170
	mov r1, r5
	add r0, r4, #0x9c
	bl EnableIqSkill
_02302170:
	add r6, r6, #1
_02302174:
	cmp r6, #0x19
	blt _02302124
_0230217C:
	mov r0, #3
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _023021A4
	add r0, r4, #0x90
	mov r1, #0x18
	bl EnableIqSkill
	add r0, r4, #0x9c
	mov r1, #0x18
	bl EnableIqSkill
_023021A4:
	add r0, r4, #0x90
	mov r1, #0x38
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023021C4
	add r0, r4, #0x9c
	mov r1, #0x38
	bl EnableIqSkill
_023021C4:
	add r0, r4, #0x90
	mov r1, #0x39
	bl IqSkillFlagTest
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r4, #0x9c
	mov r1, #0x39
	bl EnableIqSkill
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023021E8: .word MIN_IQ_EXCLUSIVE_MOVE_USER
_023021EC: .word MIN_IQ_ITEM_MASTER
	arm_func_end UpdateIqSkills

	arm_func_start ov29_023021F0
ov29_023021F0: ; 0x023021F0
	ldr ip, _023021FC ; =UpdateIqSkills
	ldr r0, [r0, #0xb4]
	bx ip
	.align 2, 0
_023021FC: .word UpdateIqSkills
	arm_func_end ov29_023021F0

	arm_func_start ov29_02302200
ov29_02302200: ; 0x02302200
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
	ldr r5, _02302278 ; =DUNGEON_PTR
	b _02302268
_02302228:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r6, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r7, [r1, #0xa84]
#else
	ldr r7, [r1, #0xb28]
#endif
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r4, r7
	beq _02302264
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02302264:
	add r6, r6, #1
_02302268:
	cmp r6, #4
	blt _02302228
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02302278: .word DUNGEON_PTR
	arm_func_end ov29_02302200

	arm_func_start GetMoveTypeForMonster
GetMoveTypeForMonster: ; 0x0230227C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldrh r0, [r4, #4]
	bl IsRegularAttackOrProjectile
	cmp r0, #0
	bne _023022C0
	mov r0, r5
	bl EntityIsValid__023000E4
	cmp r0, #0
	beq _023022C0
	mov r0, r5
	mov r1, #0x6b
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_023022C0:
	ldrh r1, [r4, #4]
	cmp r1, #0x144
	ldreq r0, [r5, #0xb4]
	ldreqb r0, [r0, #0x46]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02302318 ; =0x000001D7
	cmp r1, r0
	bne _023022F4
	mov r0, r5
	bl GetEntityNaturalGiftInfo
	cmp r0, #0
	ldrneb r0, [r0, #2]
	ldmneia sp!, {r3, r4, r5, pc}
_023022F4:
	ldrh r0, [r4, #4]
	cmp r0, #0x1f
	bne _0230230C
	mov r0, r5
	bl GetEntityWeatherBallType
	ldmia sp!, {r3, r4, r5, pc}
_0230230C:
	mov r0, r4
	bl GetMoveType
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302318: .word 0x000001D7
	arm_func_end GetMoveTypeForMonster

	arm_func_start GetMovePower
GetMovePower: ; 0x0230231C
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r2, [r1, #4]
	mov r5, r0
	ldrb r4, [r1, #7]
	cmp r2, #0x144
	ldreq r0, [r5, #0xb4]
	ldreqsh r0, [r0, #0x44]
	addeq r0, r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r1
	bl GetMoveBasePower
	add r4, r4, r0
	mov r0, r5
	mov r1, #0x2b
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, r4, lsl #1
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMovePower

	arm_func_start MonsterCanThrowItems
MonsterCanThrowItems: ; 0x02302368
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #2]
	bl CanThrowItems
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end MonsterCanThrowItems

	arm_func_start ov29_02302388
ov29_02302388: ; 0x02302388
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__023000E4
	cmp r0, #0
	ldrne r0, [r4, #0xb4]
	ldrneb r1, [r0, #0xbc]
	cmpne r1, #7
	beq _023023B8
	bl IsExperienceLocked
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_023023B8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02302388

	arm_func_start UpdateStateFlags
UpdateStateFlags: ; 0x023023C0
#ifdef JAPAN
#define UPDATE_STATE_FLAGS_OFFSET -4
#else
#define UPDATE_STATE_FLAGS_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	add r3, r0, #0x100
	ldrh ip, [r3, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	tst ip, r1
	ldrneh ip, [r3, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	ldreqh lr, [r3, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	orrne ip, ip, r1
	mvneq ip, r1
	andeq ip, lr, ip
	cmp r2, #0
	add r2, r0, #0x100
	strh ip, [r3, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	ldrneh r3, [r2, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	ldreqh ip, [r2, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	add r0, r0, #0x100
	orrne r3, r3, r1
	mvneq r3, r1
	andeq r3, ip, r3
	strh r3, [r2, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	ldrh r2, [r0, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	tst r2, r1
	bne _02302428
	ldrh r0, [r0, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	tst r0, r1
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02302428:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end UpdateStateFlags

	arm_func_start IsProtectedFromNegativeStatus
IsProtectedFromNegativeStatus: ; 0x02302430
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl LeafGuardIsActive
	cmp r0, #0
	movne r0, #1
	bne _023024D4
	mov r0, r5
	mov r1, #0x59
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	beq _023024B4
	cmp r4, #0
	beq _023024AC
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, r5
	mov r1, #0x59
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _023024DC ; =0x00000C39
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023024AC:
	mov r0, #1
	b _023024D4
_023024B4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov29_02301A84
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_023024D4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_023024DC: .word 0x00000978
#else
_023024DC: .word 0x00000C39
#endif
	arm_func_end IsProtectedFromNegativeStatus

	arm_func_start ov29_023024E0
ov29_023024E0: ; 0x023024E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #7
	mov r5, r0
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _02302534
	cmp r4, #0
	beq _02302518
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	bne _0230252C
_02302518:
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xd0]
	cmp r0, #2
	cmpne r0, #4
	bne _02302534
_0230252C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_02302534:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023024E0

	arm_func_start AddExpSpecial
AddExpSpecial: ; 0x0230253C
#ifdef JAPAN
#define ADD_EXP_SPECIAL_OFFSET -4
#else
#define ADD_EXP_SPECIAL_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldr r5, [r7, #0xb4]
	mov r6, r2
	mov r0, r5
	bl IsExperienceLocked
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r5, #0xa]
	cmp r0, #0x64
	bne _02302580
	cmp r6, #0
	ldrgt r0, _023026B4 ; =DUNGEON_PTR
	movgt r1, #1
	ldrgt r0, [r0]
	strgtb r1, [r0, #0xf]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02302580:
	ldr r2, [r5, #0x20]
	mov r0, r7
	mov r1, #0x1c
	add r4, r2, r6
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023025C0
	ldr r0, _023026B8 ; =EXP_ELITE_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_023025C0:
	mov r0, r7
	mov r1, #0x43
	bl ItemIsActive__023026CC
	cmp r0, #0
	beq _023025F8
	ldr r0, _023026BC ; =WONDER_CHEST_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_023025F8:
	mov r0, r7
	mov r1, #0x42
	bl ItemIsActive__023026CC
	cmp r0, #0
	beq _02302630
	ldr r0, _023026C0 ; =MIRACLE_CHEST_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_02302630:
	ldr r1, [r7, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _02302650
	add r0, r1, #0x228 + ADD_EXP_SPECIAL_OFFSET
	mov r1, #0x4f
	bl ExclusiveItemEffectFlagTest
_02302650:
	cmp r0, #0
	beq _0230267C
	ldr r0, _023026C4 ; =EXCLUSIVE_ITEM_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_0230267C:
	ldr r0, _023026C8 ; =0x0098967F
	cmp r4, r0
	movge r4, r0
	ldr r0, [r5, #0x20]
	subs r2, r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r5, #0x214 + ADD_EXP_SPECIAL_OFFSET]
	ldr r0, _023026B4 ; =DUNGEON_PTR
	add r1, r1, r2
	str r1, [r5, #0x214 + ADD_EXP_SPECIAL_OFFSET]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0xf]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023026B4: .word DUNGEON_PTR
_023026B8: .word EXP_ELITE_EXP_BOOST
_023026BC: .word WONDER_CHEST_EXP_BOOST
_023026C0: .word MIRACLE_CHEST_EXP_BOOST
_023026C4: .word EXCLUSIVE_ITEM_EXP_BOOST
_023026C8: .word 0x0098967F
	arm_func_end AddExpSpecial
