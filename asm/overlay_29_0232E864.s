	.include "asm/macros.inc"
	.include "overlay_29_0232E864.inc"

	.text

	arm_func_start ExecuteMoveEffect
ExecuteMoveEffect: ; 0x0232E864
#ifdef JAPAN
#define EXECUTE_MOVE_EFFECT_OFFSET -4
#define EXECUTE_MOVE_EFFECT_OFFSET_2 -1
#else
#define EXECUTE_MOVE_EFFECT_OFFSET 0
#define EXECUTE_MOVE_EFFECT_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xf0
	ldr fp, _0232F7AC ; =ov10_022C45F8
	str r0, [sp, #0x14]
	ldrsh r0, [fp]
	ldr r5, _0232F7B0 ; =SPATK_STAT_IDX
	ldr sl, _0232F7B4 ; =ov10_022C483C
	ldr r7, [r5]
	str r0, [sp, #0x34]
	ldr r0, [sl]
	ldr r4, _0232F7B8 ; =ATK_STAT_IDX
	mov r8, r2
	ldr r6, [r4]
	mov r2, #0
	str r2, [sp, #0x78]
	str r6, [sp, #0xa0]
	ldr r5, _0232F7BC ; =FOREWARN_FORCED_MISS_CHANCE
	str r0, [sp, #0x30]
	ldrsh r0, [r5]
	ldr r4, _0232F7C0 ; =ov10_022C460C
	ldrh r6, [r8, #4]
	str r0, [sp, #0x2c]
	ldrsh r0, [r4]
	ldr r2, _0232F7C4 ; =ov10_022C4480
	ldr ip, _0232F7C8 ; =ov10_022C4614
	str r0, [sp, #0x28]
	ldrsh r0, [r2]
	ldr lr, _0232F7CC ; =ov10_022C4508
	mov sb, r1
	str r0, [sp, #0x24]
	ldrsh r0, [ip]
	str r7, [sp, #0x9c]
	ldr r1, _0232F7D0 ; =ov29_02353718
	str r0, [sp, #0x20]
	ldrsh r0, [lr]
	mov r7, r3
	str r0, [sp, #0x1c]
	ldr r0, _0232F7D4 ; =ov10_022C4504
	ldrsh r0, [r0]
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x80]
	ldr r0, [sp, #0x78]
	str r0, [sp, #0x74]
	ldr r0, [sp, #0x78]
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x78]
	str r0, [sp, #0x7c]
	str r0, [r1]
	b _02332824
_0232E92C:
	mov r0, #0
	str r0, [sp, #0x6c]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x7c]
	mov fp, #1
	ldr r4, [r1, r0, lsl #2]
	ldr r0, [sp, #0x6c]
	cmp r4, #0
	str r0, [sp, #0x68]
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	str r0, [sp, #0x5c]
	str r0, [sp, #0x58]
	beq _02332830
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _02332830
	mov r0, r4
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _02332818
	mov r0, #0
	str r0, [sp, #0x80]
	ldr sl, [r4, #0xb4]
	cmp sb, r4
	str r0, [sp, #0x38]
	strb r0, [sl, #0x164 + EXECUTE_MOVE_EFFECT_OFFSET]
	bne _0232E9B0
	mov r0, r6
	bl IsHealingWishOrLunarDance
	cmp r0, #0
	bne _02332818
_0232E9B0:
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	bl CanBeSnatched
	cmp r0, #0
	ldrne r0, _0232F7D8 ; =DUNGEON_PTR
	ldrne r0, [r0]
	addne r0, r0, #0x19000
#ifdef JAPAN
	ldrne r5, [r0, #0x860]
#else
	ldrne r5, [r0, #0x904]
#endif
	cmpne r5, #0
	beq _0232EA2C
	ldr r1, [r5]
	cmp r1, #1
	bne _0232EE54
	cmp r5, sb
	beq _0232EE54
#ifdef JAPAN
	ldr r1, [r0, #0x868]
#else
	ldr r1, [r0, #0x90c]
#endif
	ldr r0, [r5, #0xb4]
	ldr r0, [r0, #0xb0]
	cmp r1, r0
	ldreqb r0, [sl, #0x10b + EXECUTE_MOVE_EFFECT_OFFSET_2]
	cmpeq r0, #0
	bne _0232EE54
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F7DC ; =0x00000EAB
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r4, r5
	b _0232EE54
_0232EA2C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, #0
	bl LightningRodStormDrainCheck
	movs r5, r0
	beq _0232EA6C
	bl ov29_022E6338
	ldr r2, _0232F7E0 ; =0x00000EAC
	mov r0, sb
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	mov r4, r5
	str r0, [sp, #0x68]
	b _0232EE54
_0232EA6C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, #1
	bl LightningRodStormDrainCheck
	movs r5, r0
	beq _0232EAAC
	bl ov29_022E6388
	ldr r2, _0232F7E4 ; =0x00000EAD
	mov r0, sb
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	mov r4, r5
	str r0, [sp, #0x64]
	b _0232EE54
_0232EAAC:
	mov r0, r4
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0232EAD0
	mov r0, r4
	mov r1, #0x33
	bl HasHeldItem
_0232EAD0:
	cmp r0, #0
	bne _0232EAEC
	mov r0, r4
	mov r1, #0x2a
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0232ED9C
_0232EAEC:
	mov r0, r4
	mov r1, #0
	bl MonsterCannotAttack
	cmp r0, #0
	bne _0232ED9C
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	tst r0, #0xf0
	bne _0232ED9C
	add r0, sl, #0x100
	ldrh r1, [r0, #0x46 + EXECUTE_MOVE_EFFECT_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + EXECUTE_MOVE_EFFECT_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	ldr r1, [sp, #0x34]
	cmp r0, r1
	blt _0232ED9C
	ldrb r0, [sl, #0x10b + EXECUTE_MOVE_EFFECT_OFFSET_2]
	cmp r0, #0
	bne _0232EE54
	ldrb r5, [sl, #0x4c]
	str r5, [sp, #0x50]
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _0232EB78
	mov r0, sb
	mov r1, r4
#ifdef JAPAN
	ldr r2, _02330BE0 ; =0x00000BF2
#else
	mov r2, #0xeb0
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232EE54
_0232EB78:
	mov r0, #0
	str r0, [sp, #0x54]
	b _0232ED54
_0232EB84:
	ldr r0, [sp, #0x50]
	ldrsh r1, [r4, #4]
	add r0, r0, #1
	and r0, r0, #7
	str r0, [sp, #0x50]
	mov r2, r0, lsl #2
	ldr r0, _0232F7E8 ; =DIRECTIONS_XY
	ldr r3, _0232F7E8 ; =DIRECTIONS_XY
	ldrsh r0, [r0, r2]
	ldr r2, [sp, #0x50]
	ldrsh ip, [r4, #6]
	add r2, r3, r2, lsl #2
	add r0, r1, r0
	ldrsh r1, [r2, #2]
	add r1, ip, r1
	bl GetTile
	ldr r0, [r0, #0xc]
	str r0, [sp, #0x4c]
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _0232ED48
	ldr r0, [sp, #0x4c]
	ldr r0, [r0]
	cmp r0, #1
	bne _0232ED48
	ldrb r0, [sl, #6]
	cmp r0, #0
	bne _0232EC0C
	bne _0232ED48
	ldr r0, [sp, #0x4c]
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #9]
	cmp r0, #1
	beq _0232ED48
_0232EC0C:
	mov r0, r4
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0232ECA0
	mov r0, #0
	str r0, [sp, #0x48]
_0232EC24:
	mov r0, r4
	mov r1, r5
	bl ov29_02304A48
	mov r0, #2
	mov r1, #0x43
	bl ov29_022EA370
	add r0, r5, #1
	and r5, r0, #7
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
	cmp r0, #0x18
	blt _0232EC24
	b _0232EC7C
_0232EC5C:
	mov r0, r4
	mov r1, r5
	bl ov29_02304A48
	mov r0, #2
	mov r1, #0x43
	bl ov29_022EA370
	add r0, r5, #1
	and r5, r0, #7
_0232EC7C:
	ldr r0, [sp, #0x50]
	cmp r5, r0
	bne _0232EC5C
	mov r1, r5
	mov r0, r4
	bl ov29_02304A48
	mov r0, #2
	mov r1, #0x43
	bl ov29_022EA370
_0232ECA0:
	ldr r0, [sp, #0x34]
	bl sub_02050FF8
	strh r0, [sp, #0x98]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x9a]
	add r0, sl, #0x100
	ldrh r5, [r0, #0x46 + EXECUTE_MOVE_EFFECT_OFFSET]
	sub r1, sp, #4
	ldrh r3, [sp, #0x98]
	strh r5, [r1]
	ldrh r0, [r0, #0x48 + EXECUTE_MOVE_EFFECT_OFFSET]
	ldrh r2, [sp, #0x9a]
	strh r0, [r1, #2]
	ldr r0, [r1]
	strh r3, [r1]
	strh r2, [r1, #2]
	ldr r1, [r1]
	bl SubFixedPoint
	strh r0, [sp, #0x94]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x96]
	ldrh r3, [sp, #0x94]
	add r1, sl, #0x100
	ldrh r2, [sp, #0x96]
	strh r3, [r1, #0x46 + EXECUTE_MOVE_EFFECT_OFFSET]
	ldr r0, _0232F7EC ; =0x00000163
	strh r2, [r1, #0x48 + EXECUTE_MOVE_EFFECT_OFFSET]
	ldrh r1, [r8, #4]
	cmp r1, r0
#ifdef JAPAN
	bne _0232ED2C
	add r2, r0, #0xa90
	mov r0, sb
	mov r1, r4
#else
	mov r0, sb
	mov r1, r4
	bne _0232ED2C
	ldr r2, _0232F7F0 ; =0x00000EB1
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232ED34
_0232ED2C:
#ifdef JAPAN
	mov r0, sb
	mov r1, r4
	mov r2, #0xbf0
#else
	ldr r2, _0232F7F4 ; =0x00000EAE
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232ED34:
	str r4, [sp, #0x6c]
	ldr r0, [sp, #0x6c]
	ldr r4, [sp, #0x4c]
	str r0, [sp, #0x38]
	b _0232ED60
_0232ED48:
	ldr r0, [sp, #0x54]
	add r0, r0, #1
	str r0, [sp, #0x54]
_0232ED54:
	ldr r0, [sp, #0x54]
	cmp r0, #8
	blt _0232EB84
_0232ED60:
	ldr r0, [sp, #0x54]
	cmp r0, #8
	bne _0232EE54
	ldrh r1, [r8, #4]
	ldr r0, _0232F7EC ; =0x00000163
	cmp r1, r0
	mov r0, sb
	mov r1, r4
	bne _0232ED90
	ldr r2, _0232F7F8 ; =0x00000EB2
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232EE54
_0232ED90:
	ldr r2, _0232F7FC ; =0x00000EAF
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232EE54
_0232ED9C:
	ldr r0, [sp, #0x7c]
	cmp r0, #0
	bne _0232EE54
	mov r0, r4
	bl HasLowHealth
	cmp r0, #0
	beq _0232EE54
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	ands r0, r0, #0xf0
	cmpne r0, #0x40
	cmpne r0, #0x50
	cmpne r0, #0x80
	cmpne r0, #0x90
	bne _0232EE54
	mov r0, r4
	mov r1, #0x20
	mov r2, #1
	bl ov29_023381C0
	movs r5, r0
	beq _0232EE54
	bl ov29_02300DC0
	cmp r0, #0
	ldreq r0, [r5, #0xb4]
	ldreqb r0, [r0, #0x10b + EXECUTE_MOVE_EFFECT_OFFSET_2]
	cmpeq r0, #0
	bne _0232EE54
	mov sl, r4
	mov r4, r5
	mov r0, r5
	mov r1, #3
	bl ov29_02304C3C
	mov r1, sl
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, #2
	mov r1, r5
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r1, r5
	mov r0, sb
#ifdef JAPAN
	ldr r2, _02330BF4 ; =0x00000C02
#else
	mov r2, #0xec0
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232EE54:
	ldr r1, _0232F800 ; =ov29_0237CA80
	ldr r0, _0232F804 ; =ov29_0237CA74
	ldr r3, [r1]
	ldr r2, [r0]
	add r3, r3, #1
	str r3, [r1]
	add r1, r2, #1
	str r1, [r0]
	ldr r5, [r4, #0xb4]
	mov r0, #0
	strb r0, [r5, #0x164 + EXECUTE_MOVE_EFFECT_OFFSET]
	ldrb r0, [r5, #6]
	cmp r0, #0
	ldrneh r1, [sb, #4]
	addne r0, r5, #0x100
	strneh r1, [r0, #0x7e + EXECUTE_MOVE_EFFECT_OFFSET]
	ldrneh r1, [sb, #6]
	strneh r1, [r0, #0x80 + EXECUTE_MOVE_EFFECT_OFFSET]
	mov r0, r4
	bl ov29_022F9840
	mov r0, sb
	mov r1, r4
	bl ov29_02307BDC
	ldr r0, [sp, #0x7c]
	cmp r0, #0
	ldreq r0, _0232F7EC ; =0x00000163
	cmpeq r6, r0
	bne _0232EF48
	mov r0, sb
	mov r1, #0x56
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0232EF28
	mov r0, sb
	mov r1, r4
	mov r2, #1
	bl HasSuperEffectiveMoveAgainstUser
	cmp r0, #0
	bne _0232EF00
	mov r0, r4
	bl ov29_022FB1A8
	cmp r0, #0
	beq _0232EF28
_0232EF00:
	mov r0, sb
	bl ov29_022E4110
	mov r0, #1
	mov r1, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F808 ; =0x00000EB3
	bl LogMessageByIdWithPopupCheckUserTarget
_0232EF28:
	mov r0, sb
	mov r1, #0x52
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0232EF48
	mov r0, sb
	mov r1, r4
	bl TryActivateFrisk
_0232EF48:
	mov r0, sb
	mov r1, r8
	bl IsChargingTwoTurnMove
	cmp r0, #0
	bne _0232EF74
	ldrh r1, [r8, #4]
	mov r0, sb
	bl ov29_02324D60
	cmp r0, #0
	movne r0, #1
	bne _0232EF78
_0232EF74:
	mov r0, #0
_0232EF78:
	and sl, r0, #0xff
	ldr r0, [sp, #0x68]
	cmp r0, #0
	ldreq r0, [sp, #0x64]
	cmpeq r0, #0
	bne _0232F188
	mov r0, #0
	str r0, [sp, #0x44]
	str r0, [sp, #0x40]
	ldrb r0, [r5, #0xd5]
	cmp r0, #5
	moveq r0, #1
	streq r0, [sp, #0x44]
	beq _0232EFDC
	mov r0, r4
	mov r1, #0x21
	bl ExclusiveItemEffectIsActive__023329E8
	cmp r0, #0
	beq _0232EFDC
	ldr r0, [sp, #0x30]
	bl DungeonRandOutcome__022EAB20
	str r0, [sp, #0x40]
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x44]
_0232EFDC:
	ldr r0, [sp, #0x44]
	cmp r0, #0
	beq _0232F090
	mov r0, r6
	bl IsReflectedByMagicCoat
	cmp r0, #0
	beq _0232F188
	mov r0, sb
	mov r1, r4
	bl CanHitWithRegularAttack
	cmp r0, #0
	beq _0232F188
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _0232F050
	mov r0, r4
	mov r1, #0x21
	add r2, sp, #0xac
	bl GetExclusiveItemWithEffectFromBag
	cmp r0, #0
	beq _0232F060
	mov r0, #0
	add r1, sp, #0xac
	bl ov29_02344B44
	ldr r2, _0232F80C ; =0x00000EB5
	mov r0, sb
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232F060
_0232F050:
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F810 ; =0x00000EB4
	bl LogMessageByIdWithPopupCheckUserTarget
_0232F060:
	mov r0, r4
	bl ov29_022E3FCC
	mov r0, r4
	mov r1, sb
	bl ov29_02333044
	ldr r5, [sb, #0xb4]
	mov r0, #0
	strb r0, [r5, #0x164 + EXECUTE_MOVE_EFFECT_OFFSET]
	mov r0, #1
	mov r4, sb
	str r0, [sp, #0x60]
	b _0232F188
_0232F090:
	mov r0, r4
	bl MirrorMoveIsActive
	str r0, [sp, #0x3c]
	cmp r0, #0
	beq _0232F188
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	str r0, [sp, #0x84]
	ldr r0, _0232F7EC ; =0x00000163
	cmp r6, r0
	addne r0, r0, #0x32
	cmpne r6, r0
	beq _0232F188
	cmp sl, #0
	bne _0232F188
	mov r0, r4
	mov r1, #1
	bl IsChargingAnyTwoTurnMove
	cmp r0, #0
	bne _0232F188
	ldr r0, [sp, #0x84]
	ands r0, r0, #0xf
	cmpne r0, #4
	cmpne r0, #5
	cmpne r0, #2
	bne _0232F188
	mov r0, sb
	mov r1, r4
	bl CanHitWithRegularAttack
	cmp r0, #0
	beq _0232F188
	mov r0, r4
	bl ov29_02300D50
	cmp r0, #0
	bne _0232F188
	ldr r0, [sp, #0x3c]
	str r4, [sp, #0x38]
	cmp r0, #2
	mov r0, sb
	mov r1, r4
	bne _0232F14C
	ldr r2, _0232F814 ; =0x00000EB7
	mov r3, #0x25
	bl ov29_02314DC4
	b _0232F154
_0232F14C:
	ldr r2, _0232F818 ; =0x00000EB6
	bl LogMessageByIdWithPopupCheckUserTarget
_0232F154:
	mov r0, r4
	bl ov29_022E4110
	mov r0, r4
	mov r1, sb
	bl ov29_02333044
	ldr r5, [sb, #0xb4]
	mov r0, #0
	strb r0, [r5, #0x164 + EXECUTE_MOVE_EFFECT_OFFSET]
	mov r0, #1
	mov r4, sb
	cmp r6, #0x42
	ldreq r4, [sp, #0x38]
	str r0, [sp, #0x60]
_0232F188:
	ldr r0, [sp, #0x68]
	cmp r0, #0
	ldreq r0, [sp, #0x64]
	cmpeq r0, #0
	ldreqb r0, [r5, #0xd5]
	cmpeq r0, #7
	bne _0232F204
	cmp r6, #0x204
	ldrne r0, _0232F81C ; =0x000001DD
	cmpne r6, r0
	beq _0232F204
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	ands r0, r0, #0xf
	cmpne r0, #4
	cmpne r0, #5
	cmpne r0, #2
	bne _0232F204
	cmp sl, #0
	bne _0232F204
	mov r0, #1
	mov r1, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F820 ; =0x00000EB8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov fp, #0
_0232F204:
	mov r0, r4
	mov r1, r8
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	movne fp, #0
	cmp fp, #0
	beq _0232F270
	mov r0, sb
	mov r1, r4
	mov r2, #0x3c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _0232F270
	mov r0, r8
	bl IsSoundMove
	cmp r0, #0
	beq _0232F270
	mov r0, #1
	mov r1, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F824 ; =0x00000EB9
	bl LogMessageByIdWithPopupCheckUserTarget
	mov fp, #0
_0232F270:
	cmp fp, #0
	beq _0232F350
	ldr r0, [sp, #0x60]
	ldrh r1, [r8, #4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and sl, r0, #0xff
	cmp r1, #0x68
	ldrne r0, _0232F828 ; =0x00000131
	mov r2, #0x79
	cmpne r1, r0
	subne r0, r0, #4
	cmpne r1, r0
	mov r0, sb
	mov r1, r4
#ifndef JAPAN
	mov r3, #1
#endif
	moveq sl, #0
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _0232F2F0
	mov r0, sb
	mov r1, r8
	bl ov29_0231AD38
	cmp r0, #0
	bne _0232F2F0
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, [sp, #0x2c]
	cmp r0, r1
	movlt r0, #1
	strlt r0, [sp, #0x5c]
_0232F2F0:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _0232F330
	mov r0, #1
	mov r1, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, #0x79
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F82C ; =0x00000EBA
	mov r3, #2
	bl LogMessageByIdWithPopupCheckParticipants
	mov fp, #0
	b _0232F350
_0232F330:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, #0
	str sl, [sp]
	bl MoveHitCheck
	cmp r0, #0
	moveq fp, #0
_0232F350:
	cmp fp, #0
	beq _0232F370
	ldr r0, [sp, #0x68]
	cmp r0, #0
	ldr r0, [sp, #0x64]
	movne fp, #0
	cmp r0, #0
	movne fp, #0
_0232F370:
	mov r0, r4
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0232F40C
	mov r0, #4
	mov r1, #0x4a
	bl ov29_022EA370
	ldrh r0, [r8, #4]
	bl ov10_022BFD6C
	cmp r0, #0
	beq _0232F3B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_023258EC
	b _0232F40C
_0232F3B0:
	ldrh r0, [r8, #4]
	cmp r0, #0xad
	bne _0232F3C4
	mov r0, #1
	bl AnimationDelayOrSomething
_0232F3C4:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _0232F3F8
	ldrh r0, [r8, #4]
	cmp r0, #0x1f4
	cmpne r0, #0x50
	bne _0232F3F8
	ldr r1, [sp, #0x38]
	mov r0, sb
	mov r2, r8
	mov r3, #0
	bl PlayMoveAnimation
	b _0232F40C
_0232F3F8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, #0
	bl PlayMoveAnimation
_0232F40C:
	ldr r0, _0232F830 ; =0x000001F6
	cmp r6, r0
	bne _0232F498
	mov r3, r8
	add r2, sp, #0xa4
	mov r1, #4
_0232F424:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0232F424
	ldr r0, [sp, #0x60]
	mov sl, #1
	cmp r0, #0
	ldr r0, _0232F834 ; =0x00000232
	strh r0, [sp, #0xa8]
	beq _0232F468
	mov r3, #0
	mov r0, sb
	mov r1, r4
	add r2, sp, #0xa4
	str r3, [sp]
	bl ov29_0232393C
	b _0232F498
_0232F468:
	mov r0, sb
	mov r1, r4
	bl AreEntitiesAdjacent
	cmp r0, #0
	moveq sl, #2
	mov r0, #0
	str r0, [sp]
	mov r3, sl
	mov r0, sb
	mov r1, r4
	add r2, sp, #0xa4
	bl ov29_0232393C
_0232F498:
	cmp fp, #0
	bne _0232F62C
	ldrh r0, [r8, #4]
	ldr r2, [sb, #0xb4]
	cmp r0, #2
	cmpne r0, #0x69
	ldreq r0, _0232F838 ; =ROLLOUT_ICE_BALL_MISSED
	moveq r1, #1
	streqb r1, [r0]
	ldrh r1, [r8, #4]
	ldr r0, _0232F7EC ; =0x00000163
	cmp r1, r0
	movne r0, #1
	strneb r0, [r2, #0x166 + EXECUTE_MOVE_EFFECT_OFFSET]
	ldrb r0, [r2, #7]
	cmp r0, #0
	mov r0, sb
	beq _0232F4EC
	ldr r1, _0232F83C ; =0x00001307
	bl ov29_022E56A0
	b _0232F4F4
_0232F4EC:
	ldr r1, _0232F840 ; =0x00001306
	bl ov29_022E56A0
_0232F4F4:
	bl ov29_0234B034
	mov r3, #0
	str r3, [sp]
	ldr r2, [r4, #0xb4]
	mov r1, #1
	bl ov29_0230040C
	cmp sb, r4
	mov r0, sb
	mov r1, r4
	bne _0232F528
	ldr r2, _0232F844 ; =0x00000EBC
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232F598
_0232F528:
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _0232F550
	mov r0, sb
	mov r1, r4
	ldr r2, _0232F848 ; =0x00000EBD
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232F598
_0232F550:
	ldr r0, [sp, #0x68]
	cmp r0, #0
	beq _0232F570
	mov r0, sb
	mov r1, r4
#ifdef JAPAN
	mov r2, #0xc00
#else
	ldr r2, _0232F84C ; =0x00000EBE
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232F598
_0232F570:
	ldr r0, [sp, #0x64]
	mov r1, r4
	cmp r0, #0
	mov r0, sb
	beq _0232F590
	ldr r2, _0232F850 ; =0x00000EBF
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232F598
_0232F590:
	ldr r2, _0232F854 ; =0x00000EBB
	bl LogMessageByIdWithPopupCheckUserTarget
_0232F598:
	mov r0, r4
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0232F5BC
	ldr r0, _0232F858 ; =0x0000270F
	mov r1, r4
	mov r2, #1
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
_0232F5BC:
	cmp r6, #0xcc
	beq _0232F5EC
	cmp r6, #0xce
	bne _0232F608
	mov r1, r4
	mov r0, #1
	str r0, [sp]
	mov r0, sb
	mov r2, r8
	mov r3, r7
	bl DoMoveHiJumpKick
	b _0232F608
_0232F5EC:
	mov r1, r4
	mov r0, #1
	str r0, [sp]
	mov r0, sb
	mov r2, r8
	mov r3, r7
	bl DoMoveJumpKick
_0232F608:
	ldr r0, [sp, #0x70]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x70]
	bl IsFloorOver
	cmp r0, #0
	bne _02332830
	b _02332818
_0232F62C:
	mov sl, #1
	ldrb fp, [r5, #0x108 + EXECUTE_MOVE_EFFECT_OFFSET_2]
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0232F670
	ldrh r1, [r8, #4]
	rsb r0, sl, #0x164
	cmp r1, r0
	beq _0232F660
	cmp r7, #0
	bne _0232F660
	cmp fp, #1
	strlob sl, [r5, #0x108 + EXECUTE_MOVE_EFFECT_OFFSET_2]
_0232F660:
	ldr r0, [sp, #0x118]
	cmp r0, #1
	moveq r0, #2
	streqb r0, [r5, #0x108 + EXECUTE_MOVE_EFFECT_OFFSET_2]
_0232F670:
	ldrb r0, [r5, #0x177 + EXECUTE_MOVE_EFFECT_OFFSET]
	cmp r0, #0xff
	bne _0232F6A0
	mov r0, r4
	mov r1, #0xe3
	bl ov29_02301C2C
	cmp r0, #0
	beq _0232F6A0
	add r0, r4, #4
	add r1, sb, #4
	bl GetDirectionTowardsPosition
	strb r0, [r5, #0x177 + EXECUTE_MOVE_EFFECT_OFFSET]
_0232F6A0:
	ldrb r0, [r5, #0x178 + EXECUTE_MOVE_EFFECT_OFFSET]
	cmp r0, #0xff
	bne _0232F6D0
	mov r0, r4
	mov r1, #0x19
	bl ov29_02301C2C
	cmp r0, #0
	beq _0232F6D0
	add r0, r4, #4
	add r1, sb, #4
	bl GetDirectionTowardsPosition
	strb r0, [r5, #0x178 + EXECUTE_MOVE_EFFECT_OFFSET]
_0232F6D0:
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf
	cmp r0, #4
	ldrne r2, [sb, #0xb4]
	ldrneh r1, [r8, #4]
	ldrneh r0, [r2, #0xac]
	cmpne r1, r0
	beq _0232F708
	ldrb r0, [r2, #0x23f + EXECUTE_MOVE_EFFECT_OFFSET]
	cmp r0, #0
	beq _0232F70C
_0232F708:
	mov sl, #0
_0232F70C:
	cmp sl, #0
	beq _0232F87C
	mov r0, sb
	mov r1, r4
	mov r2, #0x39
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _0232F87C
	mov r0, sb
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _0232F87C
	ldrh r1, [r8, #4]
	ldr r0, _0232F7EC ; =0x00000163
	cmp r1, r0
	cmpne r1, #0x160
	beq _0232F87C
	cmp r7, #0
	bne _0232F87C
	ldrb r0, [r8, #6]
	cmp r0, #0
	beq _0232F87C
	mov r0, r4
	mov r1, #0x58
	bl ExclusiveItemEffectIsActive__023329E8
	cmp r0, #0
	ldrh r0, [r8, #2]
	beq _0232F860
	tst r0, #0x40
	bne _0232F79C
	mov r0, sb
	bl ov29_022E6424
_0232F79C:
	ldrh r0, [r8, #2]
	orr r0, r0, #0x40
	strh r0, [r8, #2]
	b _0232F87C
	.align 2, 0
#ifdef JAPAN
#define EXECUTE_MOVE_EFFECT_DATA_OFFSET -0x2BE
#else
#define EXECUTE_MOVE_EFFECT_DATA_OFFSET 0
#endif
_0232F7AC: .word ov10_022C45F8
_0232F7B0: .word SPATK_STAT_IDX
_0232F7B4: .word ov10_022C483C
_0232F7B8: .word ATK_STAT_IDX
_0232F7BC: .word FOREWARN_FORCED_MISS_CHANCE
_0232F7C0: .word ov10_022C460C
_0232F7C4: .word ov10_022C4480
_0232F7C8: .word ov10_022C4614
_0232F7CC: .word ov10_022C4508
_0232F7D0: .word ov29_02353718
_0232F7D4: .word ov10_022C4504
_0232F7D8: .word DUNGEON_PTR
_0232F7DC: .word 0x00000EAB + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F7E0: .word 0x00000EAC + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F7E4: .word 0x00000EAD + EXECUTE_MOVE_EFFECT_DATA_OFFSET
#ifdef JAPAN
_02330BE0: .word 0x00000BF2
#endif
_0232F7E8: .word DIRECTIONS_XY
_0232F7EC: .word 0x00000163
#ifndef JAPAN
_0232F7F0: .word 0x00000EB1
_0232F7F4: .word 0x00000EAE
#endif
_0232F7F8: .word 0x00000EB2 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F7FC: .word 0x00000EAF + EXECUTE_MOVE_EFFECT_DATA_OFFSET
#ifdef JAPAN
_02330BF4: .word 0x00000C02
#endif
_0232F800: .word ov29_0237CA80
_0232F804: .word ov29_0237CA74
_0232F808: .word 0x00000EB3 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F80C: .word 0x00000EB5 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F810: .word 0x00000EB4 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F814: .word 0x00000EB7 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F818: .word 0x00000EB6 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F81C: .word 0x000001DD
_0232F820: .word 0x00000EB8 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F824: .word 0x00000EB9 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F828: .word 0x00000131
_0232F82C: .word 0x00000EBA + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F830: .word 0x000001F6
_0232F834: .word 0x00000232
_0232F838: .word ROLLOUT_ICE_BALL_MISSED
_0232F83C: .word 0x00001307
_0232F840: .word 0x00001306
_0232F844: .word 0x00000EBC + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F848: .word 0x00000EBD + EXECUTE_MOVE_EFFECT_DATA_OFFSET
#ifndef JAPAN
_0232F84C: .word 0x00000EBE
#endif
_0232F850: .word 0x00000EBF + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F854: .word 0x00000EBB + EXECUTE_MOVE_EFFECT_DATA_OFFSET
_0232F858: .word 0x0000270F
_0232F85C: .word 0x0000021E
_0232F860:
	tst r0, #0x10
	bne _0232F870
	mov r0, sb
	bl ov29_022E6424
_0232F870:
	ldrh r0, [r8, #2]
	orr r0, r0, #0x10
	strh r0, [r8, #2]
_0232F87C:
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	tst r0, #0xf
	bne _0232F8A0
	mov r0, sb
	mov r1, r4
	bl UpdateShopkeeperModeAfterAttack
_0232F8A0:
	ldr r0, _0232F85C ; =0x0000021E
	mov r1, #1
	strb r1, [r5, #0x162 + EXECUTE_MOVE_EFFECT_OFFSET]
	cmp r6, r0
	addls pc, pc, r6, lsl #2
	b _023326C8
_0232F8B8: ; jump table
	b _023301E8 ; case 0
	b _02331300 ; case 1
	b _02330FE8 ; case 2
	b _02330990 ; case 3
	b _02330974 ; case 4
	b _02331290 ; case 5
	b _023312AC ; case 6
	b _023316F0 ; case 7
	b _02331760 ; case 8
	b _02330134 ; case 9
	b _0233177C ; case 10
	b _02331C70 ; case 11
	b _02331AB0 ; case 12
	b _02330A00 ; case 13
	b _02331CFC ; case 14
	b _023313C4 ; case 15
	b _02331C8C ; case 16
	b _02331B74 ; case 17
	b _02330134 ; case 18
	b _02330BC0 ; case 19
	b _02331568 ; case 20
	b _02330B18 ; case 21
	b _0233154C ; case 22
	b _02331CA8 ; case 23
	b _02330E28 ; case 24
	b _02331FDC ; case 25
	b _023313C4 ; case 26
	b _02330D64 ; case 27
	b _02330134 ; case 28
	b _02331CC4 ; case 29
	b _023307EC ; case 30
	b _02331B90 ; case 31
	b _02330484 ; case 32
	b _02330AE0 ; case 33
	b _02330974 ; case 34
	b _02331ACC ; case 35
	b _0233037C ; case 36
	b _02331A24 ; case 37
	b _02331138 ; case 38
	b _02330134 ; case 39
	b _02331EC4 ; case 40
	b _023314F8 ; case 41
	b _02330CD8 ; case 42
	b _02331004 ; case 43
	b _02330CBC ; case 44
	b _023314A4 ; case 45
	b _023307EC ; case 46
	b _02331338 ; case 47
	b _02331F50 ; case 48
	b _02331824 ; case 49
	b _023320D8 ; case 50
	b _02331138 ; case 51
	b _023302F0 ; case 52
	b _0233030C ; case 53
	b _02331D34 ; case 54
	b _02330BA4 ; case 55
	b _02331798 ; case 56
	b _023302B8 ; case 57
	b _023316B8 ; case 58
	b _023308CC ; case 59
	b _0233123C ; case 60
	b _02331154 ; case 61
	b _02330808 ; case 62
	b _023307B4 ; case 63
	b _02330958 ; case 64
	b _02330958 ; case 65
	b _023315BC ; case 66
	b _023319B4 ; case 67
	b _0233037C ; case 68
	b _02330468 ; case 69
	b _023316B8 ; case 70
	b _02330680 ; case 71
	b _0233169C ; case 72
	b _02330AA8 ; case 73
	b _02330360 ; case 74
	b _02331258 ; case 75
	b _02330DB8 ; case 76
	b _02331944 ; case 77
	b _02331434 ; case 78
	b _02330974 ; case 79
	b _02330DB8 ; case 80
	b _0233037C ; case 81
	b _0233069C ; case 82
	b _02331530 ; case 83
	b _02330974 ; case 84
	b _02331928 ; case 85
	b _023304BC ; case 86
	b _0233037C ; case 87
	b _023313E0 ; case 88
	b _023304BC ; case 89
	b _0233037C ; case 90
	b _02330ED0 ; case 91
	b _023319D0 ; case 92
	b _0233069C ; case 93
	b _0233103C ; case 94
	b _0233111C ; case 95
	b _02331B3C ; case 96
	b _02330AA8 ; case 97
	b _023316D4 ; case 98
	b _02330C84 ; case 99
	b _02330E98 ; case 100
	b _02330328 ; case 101
	b _023318B0 ; case 102
	b _02330878 ; case 103
	b _02331C00 ; case 104
	b _02330FE8 ; case 105
	b _02330D10 ; case 106
	b _023306B8 ; case 107
	b _02331370 ; case 108
	b _023304F4 ; case 109
	b _02330CF4 ; case 110
	b _02330974 ; case 111
	b _02330F08 ; case 112
	b _023319EC ; case 113
	b _023306B8 ; case 114
	b _02331FC0 ; case 115
	b _02330DF0 ; case 116
	b _02331090 ; case 117
	b _0233029C ; case 118
	b _02331E68 ; case 119
	b _0233077C ; case 120
	b _02331944 ; case 121
	b _0233131C ; case 122
	b _02331960 ; case 123
	b _0233093C ; case 124
	b _02330468 ; case 125
	b _02330134 ; case 126
	b _02330824 ; case 127
	b _02331998 ; case 128
	b _023309AC ; case 129
	b _02330FB0 ; case 130
	b _02330414 ; case 131
	b _02330134 ; case 132
	b _02330798 ; case 133
	b _02330F94 ; case 134
	b _02330E0C ; case 135
	b _02330134 ; case 136
	b _02331EFC ; case 137
	b _02331EA0 ; case 138
	b _023307D0 ; case 139
	b _02330DD4 ; case 140
	b _02330F78 ; case 141
	b _023314DC ; case 142
	b _02330468 ; case 143
	b _0233077C ; case 144
	b _02330134 ; case 145
	b _023314DC ; case 146
	b _02330728 ; case 147
	b _02330C14 ; case 148
	b _02330744 ; case 149
	b _02330430 ; case 150
	b _02330E7C ; case 151
	b _02330904 ; case 152
	b _0233170C ; case 153
	b _02330134 ; case 154
	b _0233197C ; case 155
	b _02331744 ; case 156
	b _0233030C ; case 157
	b _02330280 ; case 158
	b _02330CA0 ; case 159
	b _02331A5C ; case 160
	b _02330134 ; case 161
	b _02330664 ; case 162
	b _02330134 ; case 163
	b _02330E60 ; case 164
	b _02331020 ; case 165
	b _02330134 ; case 166
	b _02330134 ; case 167
	b _02330134 ; case 168
	b _02330B50 ; case 169
	b _02330D80 ; case 170
	b _02330A00 ; case 171
	b _0233190C ; case 172
	b _02331058 ; case 173
	b _02330134 ; case 174
	b _02330134 ; case 175
	b _02330134 ; case 176
	b _023309E4 ; case 177
	b _02330134 ; case 178
	b _02330134 ; case 179
	b _02330134 ; case 180
	b _02330BDC ; case 181
	b _02330134 ; case 182
	b _02331F18 ; case 183
	b _02332068 ; case 184
	b _02331C1C ; case 185
	b _02330C68 ; case 186
	b _02331648 ; case 187
	b _02330760 ; case 188
	b _02330134 ; case 189
	b _02330134 ; case 190
	b _02330A00 ; case 191
	b _02330A38 ; case 192
	b _02330A70 ; case 193
	b _023309C8 ; case 194
	b _02330BA4 ; case 195
	b _02330A1C ; case 196
	b _02331514 ; case 197
	b _02330F24 ; case 198
	b _02330A1C ; case 199
	b _023304D8 ; case 200
	b _02330134 ; case 201
	b _02330C68 ; case 202
	b _02330DF0 ; case 203
	b _023318CC ; case 204
	b _02331728 ; case 205
	b _023311E0 ; case 206
	b _0233085C ; case 207
	b _02330134 ; case 208
	b _023310C8 ; case 209
	b _02330E44 ; case 210
	b _02330134 ; case 211
	b _023312E4 ; case 212
	b _023314C0 ; case 213
	b _02331100 ; case 214
	b _02330C30 ; case 215
	b _02330D9C ; case 216
	b _02330D2C ; case 217
	b _02331090 ; case 218
	b _023304A0 ; case 219
	b _02331EE0 ; case 220
	b _023307B4 ; case 221
	b _02330134 ; case 222
	b _02331BAC ; case 223
	b _0233131C ; case 224
	b _02331488 ; case 225
	b _023308E8 ; case 226
	b _023311A8 ; case 227
	b _02331BC8 ; case 228
	b _0233185C ; case 229
	b _0233030C ; case 230
	b _02330974 ; case 231
	b _02331074 ; case 232
	b _02331354 ; case 233
	b _023306B8 ; case 234
	b _0233077C ; case 235
	b _02331A94 ; case 236
	b _023311C4 ; case 237
	b _02330344 ; case 238
	b _02330344 ; case 239
	b _02330134 ; case 240
	b _02330134 ; case 241
	b _02330344 ; case 242
	b _02330A8C ; case 243
	b _02330624 ; case 244
	b _02331A78 ; case 245
	b _02330AC4 ; case 246
	b _02330430 ; case 247
	b _02330134 ; case 248
	b _023317B4 ; case 249
	b _02330134 ; case 250
	b _0233037C ; case 251
	b _023315D8 ; case 252
	b _02330ED0 ; case 253
	b _02331D50 ; case 254
	b _02330680 ; case 255
	b _02331878 ; case 256
	b _02331C38 ; case 257
	b _02330C68 ; case 258
	b _02330FCC ; case 259
	b _02330134 ; case 260
	b _02330798 ; case 261
	b _0233030C ; case 262
	b _02331E4C ; case 263
	b _02330840 ; case 264
	b _02330B88 ; case 265
	b _02331DDC ; case 266
	b _02330D48 ; case 267
	b _02330AFC ; case 268
	b _02331DA4 ; case 269
	b _02330328 ; case 270
	b _023307B4 ; case 271
	b _02331204 ; case 272
	b _023314DC ; case 273
	b _02330A00 ; case 274
	b _0233070C ; case 275
	b _02330894 ; case 276
	b _02330F40 ; case 277
	b _02331A08 ; case 278
	b _023304D8 ; case 279
	b _023304D8 ; case 280
	b _02330A54 ; case 281
	b _02331CE0 ; case 282
	b _02330648 ; case 283
	b _02330AFC ; case 284
	b _02330134 ; case 285
	b _02331F88 ; case 286
	b _02331100 ; case 287
	b _02330B34 ; case 288
	b _02330798 ; case 289
	b _02330134 ; case 290
	b _02330468 ; case 291
	b _0233030C ; case 292
	b _02331B20 ; case 293
	b _02330EEC ; case 294
	b _023313A8 ; case 295
	b _02331450 ; case 296
	b _02330134 ; case 297
	b _02331274 ; case 298
	b _02330AA8 ; case 299
	b _02330134 ; case 300
	b _023318F0 ; case 301
	b _02330C4C ; case 302
	b _023307B4 ; case 303
	b _023318B0 ; case 304
	b _023318F0 ; case 305
	b _02330134 ; case 306
	b _023312E4 ; case 307
	b _02330134 ; case 308
	b _023306D4 ; case 309
	b _02330840 ; case 310
	b _02330134 ; case 311
	b _02330134 ; case 312
	b _02331B58 ; case 313
	b _02331584 ; case 314
	b _02331D34 ; case 315
	b _02331B04 ; case 316
	b _02331878 ; case 317
	b _02331020 ; case 318
	b _02330BF8 ; case 319
	b _02330DB8 ; case 320
	b _02330134 ; case 321
	b _02330134 ; case 322
	b _02330134 ; case 323
	b _02331220 ; case 324
	b _02330600 ; case 325
	b _023308B0 ; case 326
	b _023320BC ; case 327
	b _02331FA4 ; case 328
	b _0233138C ; case 329
	b _02332030 ; case 330
	b _023315F4 ; case 331
	b _023305A4 ; case 332
	b _02330BA4 ; case 333
	b _02331F6C ; case 334
	b _023306F0 ; case 335
	b _0233037C ; case 336
	b _02331FF8 ; case 337
	b _02330F5C ; case 338
	b _023313C4 ; case 339
	b _02331154 ; case 340
	b _02330920 ; case 341
	b _0233077C ; case 342
	b _02330B6C ; case 343
	b _02330328 ; case 344
	b _02330328 ; case 345
	b _02330134 ; case 346
	b _02330134 ; case 347
	b _0233146C ; case 348
	b _023316D4 ; case 349
	b _02330134 ; case 350
	b _02330D10 ; case 351
	b _023302D4 ; case 352
	b _02330134 ; case 353
	b _02330DF0 ; case 354
	b _02330150 ; case 355
	b _023326C8 ; case 356
	b _02331170 ; case 357
	b _02331170 ; case 358
	b _02331170 ; case 359
	b _02330134 ; case 360
	b _02331CC4 ; case 361
	b _02330134 ; case 362
	b _02331A40 ; case 363
	b _023310E4 ; case 364
	b _02331DC0 ; case 365
	b _02330134 ; case 366
	b _023315D8 ; case 367
	b _02330AFC ; case 368
	b _02331648 ; case 369
	b _02331D6C ; case 370
	b _02330EB4 ; case 371
	b _0233111C ; case 372
	b _02331610 ; case 373
	b _02331840 ; case 374
	b _02331D88 ; case 375
	b _02332084 ; case 376
	b _023320A0 ; case 377
	b _02331F34 ; case 378
	b _02331DDC ; case 379
	b _023318B0 ; case 380
	b _02331418 ; case 381
	b _02330A00 ; case 382
	b _023315A0 ; case 383
	b _02332014 ; case 384
	b _02331E30 ; case 385
	b _023310AC ; case 386
	b _023313FC ; case 387
	b _02331664 ; case 388
	b _023317D0 ; case 389
	b _02331DF8 ; case 390
	b _02331AE8 ; case 391
	b _0233044C ; case 392
	b _0233204C ; case 393
	b _023312C8 ; case 394
	b _02331E14 ; case 395
	b _02331894 ; case 396
	b _023320F4 ; case 397
	b _02331C54 ; case 398
	b _02331BE4 ; case 399
	b _0233162C ; case 400
	b _0233118C ; case 401
	b _023326C8 ; case 402
	b _02331E84 ; case 403
	b _023326C8 ; case 404
	b _023326C8 ; case 405
	b _023320D8 ; case 406
	b _02331D18 ; case 407
	b _023326C8 ; case 408
	b _02331680 ; case 409
	b _023317EC ; case 410
	b _023326C8 ; case 411
	b _02331808 ; case 412
	b _023326C8 ; case 413
	b _023326C8 ; case 414
	b _023326C8 ; case 415
	b _023326C8 ; case 416
	b _023326C8 ; case 417
	b _023326C8 ; case 418
	b _023326C8 ; case 419
	b _023326C8 ; case 420
	b _02332674 ; case 421
	b _02332690 ; case 422
	b _023326AC ; case 423
	b _02331648 ; case 424
	b _02331840 ; case 425
	b _0233111C ; case 426
	b _02332658 ; case 427
	b _02330360 ; case 428
	b _02331DDC ; case 429
	b _02332110 ; case 430
	b _023307EC ; case 431
	b _02330134 ; case 432
	b _02330134 ; case 433
	b _0233212C ; case 434
	b _02330134 ; case 435
	b _023307EC ; case 436
	b _0233069C ; case 437
	b _02332148 ; case 438
	b _02332164 ; case 439
	b _02332180 ; case 440
	b _02330DF0 ; case 441
	b _023307EC ; case 442
	b _023306F0 ; case 443
	b _0233111C ; case 444
	b _02330134 ; case 445
	b _023306B8 ; case 446
	b _0233219C ; case 447
	b _023321B8 ; case 448
	b _023321D4 ; case 449
	b _023321F0 ; case 450
	b _02330134 ; case 451
	b _0233220C ; case 452
	b _02330344 ; case 453
	b _023306F0 ; case 454
	b _02330344 ; case 455
	b _02332228 ; case 456
	b _02332244 ; case 457
	b _023319D0 ; case 458
	b _02330728 ; case 459
	b _02330134 ; case 460
	b _02332260 ; case 461
	b _02330134 ; case 462
	b _02330134 ; case 463
	b _0233227C ; case 464
	b _023326C8 ; case 465
	b _02332298 ; case 466
	b _02330134 ; case 467
	b _023305D0 ; case 468
	b _023322D0 ; case 469
	b _02330134 ; case 470
	b _023322EC ; case 471
	b _02331138 ; case 472
	b _023307EC ; case 473
	b _02332458 ; case 474
	b _02332308 ; case 475
	b _02330134 ; case 476
	b _02332324 ; case 477
	b _02332340 ; case 478
	b _02330134 ; case 479
	b _0233235C ; case 480
	b _02330134 ; case 481
	b _023310C8 ; case 482
	b _02330974 ; case 483
	b _02330520 ; case 484
	b _02330728 ; case 485
	b _02330134 ; case 486
	b _02330134 ; case 487
	b _023322D0 ; case 488
	b _02332378 ; case 489
	b _02332394 ; case 490
	b _02330134 ; case 491
	b _023323B0 ; case 492
	b _023323CC ; case 493
	b _02330344 ; case 494
	b _02330728 ; case 495
	b _023323E8 ; case 496
	b _02332420 ; case 497
	b _023307EC ; case 498
	b _02332404 ; case 499
	b _02330DB8 ; case 500
	b _02330CA0 ; case 501
	b _02330134 ; case 502
	b _023320D8 ; case 503
	b _0233243C ; case 504
	b _02332458 ; case 505
	b _02332474 ; case 506
	b _02330958 ; case 507
	b _02330134 ; case 508
	b _02332490 ; case 509
	b _02330134 ; case 510
	b _02330134 ; case 511
	b _02330134 ; case 512
	b _023324AC ; case 513
	b _023324C8 ; case 514
	b _02330134 ; case 515
	b _023324E4 ; case 516
	b _02332500 ; case 517
	b _02330DF0 ; case 518
	b _023302F0 ; case 519
	b _0233251C ; case 520
	b _02330958 ; case 521
	b _023322B4 ; case 522
	b _02330134 ; case 523
	b _02330468 ; case 524
	b _023320BC ; case 525
	b _02332538 ; case 526
	b _02330CA0 ; case 527
	b _02332554 ; case 528
	b _02332394 ; case 529
	b _0233054C ; case 530
	b _02332570 ; case 531
	b _0233258C ; case 532
	b _023325A8 ; case 533
	b _023325C4 ; case 534
	b _02331154 ; case 535
	b _02330578 ; case 536
	b _023325E0 ; case 537
	b _023325FC ; case 538
	b _02330134 ; case 539
	b _02332620 ; case 540
	b _023306B8 ; case 541
	b _0233263C ; case 542
_02330134:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamage__02325DC0
	mov sl, r0
	b _023326CC
_02330150: ; 0x02330150
	mov r0, sb
	mov r1, r8
	bl GetMoveTypeForMonster
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl GetMovePower
	str r0, [sp, #0x88]
	mov r0, r8
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0xdc
	str r1, [sp, #4]
	mov r0, #0x80
	str r0, [sp, #8]
	mov r2, sl
	ldrh sl, [r8, #4]
	ldr r3, [sp, #0x88]
	mov r1, #1
	str sl, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, sb
	mov r1, r4
	bl CalcDamage
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	add r3, sp, #0xdc
	bl PerformDamageSequence
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and sl, r0, #0xff
	b _023326CC
_023301E8:
	mov r0, sb
	mov r1, r8
	bl GetMoveTypeForMonster
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl GetMovePower
	str r0, [sp, #0x8c]
	mov r0, r8
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0xc8
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r2, sl
	ldrh sl, [r8, #4]
	ldr r3, [sp, #0x8c]
	mov r1, #1
	str sl, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, sb
	mov r1, r4
	bl CalcDamage
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	add r3, sp, #0xc8
	bl PerformDamageSequence
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and sl, r0, #0xff
	b _023326CC
_02330280: ; 0x02330280
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWaterfall
	mov sl, r0
	b _023326CC
_0233029C: ; 0x0233029C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEarthquake
	mov sl, r0
	b _023326CC
_023302B8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGust
	mov sl, r0
	b _023326CC
_023302D4: ; 0x023302D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveStruggle
	mov sl, r0
	b _023326CC
_023302F0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageBurn10FlameWheel
	mov sl, r0
	b _023326CC
_0233030C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageBurn10
	mov sl, r0
	b _023326CC
_02330328: ; 0x02330328
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageFreeze15
	mov sl, r0
	b _023326CC
_02330344: ; 0x02330344
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamage__0232A500
	mov sl, r0
	b _023326CC
_02330360: ; 0x02330360
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFocusEnergy
	mov sl, r0
	b _023326CC
_0233037C:
	mov r0, sb
	mov r1, r8
	bl GetMoveTypeForMonster
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl GetMovePower
	str r0, [sp, #0x90]
	mov r0, r8
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0xb4
	str r1, [sp, #4]
	mov r0, #0x100
	str r0, [sp, #8]
	mov r2, sl
	ldrh sl, [r8, #4]
	ldr r3, [sp, #0x90]
	mov r1, #1
	str sl, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, sb
	mov r1, r4
	bl CalcDamage
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	add r3, sp, #0xb4
	bl PerformDamageSequence
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and sl, r0, #0xff
	b _023326CC
_02330414: ; 0x02330414
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFissure
	mov sl, r0
	b _023326CC
_02330430: ; 0x02330430
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveOhko
	mov sl, r0
	b _023326CC
_0233044C: ; 0x0233044C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveOneShot
	mov sl, r0
	b _023326CC
_02330468: ; 0x02330468
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageConstrict10
	mov sl, r0
	b _023326CC
_02330484:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWhirlpool
	mov sl, r0
	b _023326CC
_023304A0: ; 0x023304A0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSurf
	mov sl, r0
	b _023326CC
_023304BC: ; 0x023304BC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveShadowHold
	mov sl, r0
	b _023326CC
_023304D8: ; 0x023304D8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamagePoison18
	mov sl, r0
	b _023326CC
_023304F4: ; 0x023304F4
	str r1, [sp]
	ldr r0, [sp, #0x28]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl DoMoveDamageLowerDefensiveStatVariable
	mov sl, r0
	b _023326CC
_02330520: ; 0x02330520
	str r1, [sp]
	ldr r0, [sp, #0x24]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl DoMoveDamageLowerDefensiveStatVariable
	mov sl, r0
	b _023326CC
_0233054C: ; 0x0233054C
	str r1, [sp]
	ldr r0, [sp, #0x20]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl DoMoveDamageLowerDefensiveStatVariable
	mov sl, r0
	b _023326CC
_02330578: ; 0x02330578
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl DoMoveDamageLowerDefensiveStatVariable
	mov sl, r0
	b _023326CC
_023305A4: ; 0x023305A4
	str r1, [sp]
	ldr r0, [sp, #0x28]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl DoMoveDamageLowerDefensiveStatVariable
	mov sl, r0
	b _023326CC
_023305D0: ; 0x023305D0
	mov r0, #2
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl DoMoveDamageLowerDefensiveStatVariable
	mov sl, r0
	b _023326CC
_02330600: ; 0x02330600
	add r3, sp, #0xa0
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	str r7, [sp]
	bl DoMoveMetalClaw
	mov sl, r0
	b _023326CC
_02330624: ; 0x02330624
	add r3, sp, #0xa0
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	str r7, [sp]
	bl DoMoveSteelWing
	mov sl, r0
	b _023326CC
_02330648: ; 0x02330648
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePoisonTail
	mov sl, r0
	b _023326CC
_02330664: ; 0x02330664
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTwister
	mov sl, r0
	b _023326CC
_02330680: ; 0x02330680
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageLowerSpeed20
	mov sl, r0
	b _023326CC
_0233069C: ; 0x0233069C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageBoostAllStats
	mov sl, r0
	b _023326CC
_023306B8: ; 0x023306B8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageConfuse10
	mov sl, r0
	b _023326CC
_023306D4: ; 0x023306D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMistBall
	mov sl, r0
	b _023326CC
_023306F0: ; 0x023306F0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageLowerSpecialDefense50
	mov sl, r0
	b _023326CC
_0233070C: ; 0x0233070C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCrushClaw
	mov sl, r0
	b _023326CC
_02330728: ; 0x02330728
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamagePoison40
	mov sl, r0
	b _023326CC
_02330744: ; 0x02330744
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSacredFire
	mov sl, r0
	b _023326CC
_02330760: ; 0x02330760
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveThundershock
	mov sl, r0
	b _023326CC
_0233077C: ; 0x0233077C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageParalyze10
	mov sl, r0
	b _023326CC
_02330798: ; 0x02330798
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageCringe10
	mov sl, r0
	b _023326CC
_023307B4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageCringe20
	mov sl, r0
	b _023326CC
_023307D0: ; 0x023307D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHeadbutt
	mov sl, r0
	b _023326CC
_023307EC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageCringe30
	mov sl, r0
	b _023326CC
_02330808:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCrunch
	mov sl, r0
	b _023326CC
_02330824: ; 0x02330824
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveShadowBall
	mov sl, r0
	b _023326CC
_02330840: ; 0x02330840
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageConfuse30
	mov sl, r0
	b _023326CC
_0233085C: ; 0x0233085C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTriAttack
	mov sl, r0
	b _023326CC
_02330878: ; 0x02330878
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMeteorMash
	mov sl, r0
	b _023326CC
_02330894: ; 0x02330894
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBlazeKick
	mov sl, r0
	b _023326CC
_023308B0: ; 0x023308B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAttract
	mov sl, r0
	b _023326CC
_023308CC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveParalyze__02326E80
	mov sl, r0
	b _023326CC
_023308E8: ; 0x023308E8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFakeOut
	mov sl, r0
	b _023326CC
_02330904: ; 0x02330904
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSonicBoom
	mov sl, r0
	b _023326CC
_02330920: ; 0x02330920
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDragonRage
	mov sl, r0
	b _023326CC
_0233093C: ; 0x0233093C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveParalyze__02328230
	mov sl, r0
	b _023326CC
_02330958:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageParalyze20
	mov sl, r0
	b _023326CC
_02330974:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSleep
	mov sl, r0
	b _023326CC
_02330990:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveYawn
	mov sl, r0
	b _023326CC
_023309AC: ; 0x023309AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveThunderbolt
	mov sl, r0
	b _023326CC
_023309C8: ; 0x023309C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBlock
	mov sl, r0
	b _023326CC
_023309E4: ; 0x023309E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHornDrill
	mov sl, r0
	b _023326CC
_02330A00:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveConfuse
	mov sl, r0
	b _023326CC
_02330A1C: ; 0x02330A1C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePoison
	mov sl, r0
	b _023326CC
_02330A38: ; 0x02330A38
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveThunderWave
	mov sl, r0
	b _023326CC
_02330A54: ; 0x02330A54
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveParalyze__0232B434
	mov sl, r0
	b _023326CC
_02330A70: ; 0x02330A70
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveZapCannon
	mov sl, r0
	b _023326CC
_02330A8C: ; 0x02330A8C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSuperpower
	mov sl, r0
	b _023326CC
_02330AA8: ; 0x02330AA8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageLowerSpeed100
	mov sl, r0
	b _023326CC
_02330AC4: ; 0x02330AC4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDynamicPunch
	mov sl, r0
	b _023326CC
_02330AE0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFakeTears
	mov sl, r0
	b _023326CC
_02330AFC: ; 0x02330AFC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBlowback
	mov sl, r0
	b _023326CC
_02330B18:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePainSplit
	mov sl, r0
	b _023326CC
_02330B34: ; 0x02330B34
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTailGlow
	mov sl, r0
	b _023326CC
_02330B50: ; 0x02330B50
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMinimize
	mov sl, r0
	b _023326CC
_02330B6C: ; 0x02330B6C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDragonDance
	mov sl, r0
	b _023326CC
_02330B88: ; 0x02330B88
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBulkUp
	mov sl, r0
	b _023326CC
_02330BA4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBoostAttack1
	mov sl, r0
	b _023326CC
_02330BC0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRage
	mov sl, r0
	b _023326CC
_02330BDC: ; 0x02330BDC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSwordsDance
	mov sl, r0
	b _023326CC
_02330BF8: ; 0x02330BF8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCalmMind
	mov sl, r0
	b _023326CC
_02330C14: ; 0x02330C14
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGrowth
	mov sl, r0
	b _023326CC
_02330C30: ; 0x02330C30
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAmnesia
	mov sl, r0
	b _023326CC
_02330C4C: ; 0x02330C4C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDefenseCurl
	mov sl, r0
	b _023326CC
_02330C68: ; 0x02330C68
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBoostDefense2
	mov sl, r0
	b _023326CC
_02330C84: ; 0x02330C84
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCosmicPower
	mov sl, r0
	b _023326CC
_02330CA0: ; 0x02330CA0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageLowerAccuracy40
	mov sl, r0
	b _023326CC
_02330CBC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveOctazooka
	mov sl, r0
	b _023326CC
_02330CD8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAuroraBeam
	mov sl, r0
	b _023326CC
_02330CF4: ; 0x02330CF4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePsychoBoost
	mov sl, r0
	b _023326CC
_02330D10: ; 0x02330D10
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLowerSpeed1
	mov sl, r0
	b _023326CC
_02330D2C: ; 0x02330D2C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGrowl
	mov sl, r0
	b _023326CC
_02330D48: ; 0x02330D48
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFeatherDance
	mov sl, r0
	b _023326CC
_02330D64:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveScreech
	mov sl, r0
	b _023326CC
_02330D80: ; 0x02330D80
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSeismicToss
	mov sl, r0
	b _023326CC
_02330D9C: ; 0x02330D9C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveNightShade
	mov sl, r0
	b _023326CC
_02330DB8: ; 0x02330DB8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageDrain
	mov sl, r0
	b _023326CC
_02330DD4: ; 0x02330DD4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDoubleEdge
	mov sl, r0
	b _023326CC
_02330DF0: ; 0x02330DF0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageWithRecoil
	mov sl, r0
	b _023326CC
_02330E0C: ; 0x02330E0C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAbsorb
	mov sl, r0
	b _023326CC
_02330E28:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSwagger
	mov sl, r0
	b _023326CC
_02330E44: ; 0x02330E44
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTripleKick
	mov sl, r0
	b _023326CC
_02330E60: ; 0x02330E60
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTwineedle
	mov sl, r0
	b _023326CC
_02330E7C: ; 0x02330E7C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSolarBeam
	mov sl, r0
	b _023326CC
_02330E98: ; 0x02330E98
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSkyAttack
	mov sl, r0
	b _023326CC
_02330EB4: ; 0x02330EB4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSlowDown
	mov sl, r0
	b _023326CC
_02330ED0: ; 0x02330ED0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageMultihitFatigue
	mov sl, r0
	b _023326CC
_02330EEC: ; 0x02330EEC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWrap
	mov sl, r0
	b _023326CC
_02330F08: ; 0x02330F08
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveUproar
	mov sl, r0
	b _023326CC
_02330F24: ; 0x02330F24
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePoisonFang
	mov sl, r0
	b _023326CC
_02330F40: ; 0x02330F40
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePresent
	mov sl, r0
	b _023326CC
_02330F5C: ; 0x02330F5C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveReflect
	mov sl, r0
	b _023326CC
_02330F78: ; 0x02330F78
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSandstorm
	mov sl, r0
	b _023326CC
_02330F94: ; 0x02330F94
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSafeguard
	mov sl, r0
	b _023326CC
_02330FB0: ; 0x02330FB0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMist
	mov sl, r0
	b _023326CC
_02330FCC: ; 0x02330FCC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLightScreen
	mov sl, r0
	b _023326CC
_02330FE8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageMultihitUntilMiss
	mov sl, r0
	b _023326CC
_02331004:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMemento
	mov sl, r0
	b _023326CC
_02331020: ; 0x02331020
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRecoverHpTeam
	mov sl, r0
	b _023326CC
_0233103C: ; 0x0233103C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSynthesis
	mov sl, r0
	b _023326CC
_02331058: ; 0x02331058
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMoonlight
	mov sl, r0
	b _023326CC
_02331074: ; 0x02331074
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRest
	mov sl, r0
	b _023326CC
_02331090: ; 0x02331090
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRecoverHp
	mov sl, r0
	b _023326CC
_023310AC: ; 0x023310AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveScan
	mov sl, r0
	b _023326CC
_023310C8: ; 0x023310C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSwapItems
	mov sl, r0
	b _023326CC
_023310E4: ; 0x023310E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTakeaway
	mov sl, r0
	b _023326CC
_02331100: ; 0x02331100
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageStealItem
	mov sl, r0
	b _023326CC
_0233111C: ; 0x0233111C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBoostSpeed1
	mov sl, r0
	b _023326CC
_02331138:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCounter
	mov sl, r0
	b _023326CC
_02331154:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBide
	mov sl, r0
	b _023326CC
_02331170: ; 0x02331170
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBideUnleash
	mov sl, r0
	b _023326CC
_0233118C: ; 0x0233118C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTrapper
	mov sl, r0
	b _023326CC
_023311A8: ; 0x023311A8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSleepTalk
	mov sl, r0
	b _023326CC
_023311C4: ; 0x023311C4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCurse
	mov sl, r0
	b _023326CC
_023311E0: ; 0x023311E0
	mov r0, #0
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHiJumpKick
	mov sl, r0
	b _023326CC
_02331204: ; 0x02331204
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBlastBurn
	mov sl, r0
	b _023326CC
_02331220: ; 0x02331220
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHiddenPower
	mov sl, r0
	b _023326CC
_0233123C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRazorWind
	mov sl, r0
	b _023326CC
_02331258: ; 0x02331258
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFocusPunch
	mov sl, r0
	b _023326CC
_02331274: ; 0x02331274
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMagicCoat
	mov sl, r0
	b _023326CC
_02331290:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveNightmare
	mov sl, r0
	b _023326CC
_023312AC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMorningSun
	mov sl, r0
	b _023326CC
_023312C8: ; 0x023312C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveVacuumCut
	mov sl, r0
	b _023326CC
_023312E4: ; 0x023312E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSport
	mov sl, r0
	b _023326CC
_02331300:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveIronTail
	mov sl, r0
	b _023326CC
_0233131C: ; 0x0233131C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLowerDefense1
	mov sl, r0
	b _023326CC
_02331338:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWillOWisp
	mov sl, r0
	b _023326CC
_02331354: ; 0x02331354
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveIngrain
	mov sl, r0
	b _023326CC
_02331370: ; 0x02331370
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePsywave
	mov sl, r0
	b _023326CC
_0233138C: ; 0x0233138C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLeechSeed
	mov sl, r0
	b _023326CC
_023313A8: ; 0x023313A8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSpikes
	mov sl, r0
	b _023326CC
_023313C4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHealStatus
	mov sl, r0
	b _023326CC
_023313E0: ; 0x023313E0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHaze
	mov sl, r0
	b _023326CC
_023313FC: ; 0x023313FC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePowerEars
	mov sl, r0
	b _023326CC
_02331418: ; 0x02331418
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSiesta
	mov sl, r0
	b _023326CC
_02331434: ; 0x02331434
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSmellingSalt
	mov sl, r0
	b _023326CC
_02331450: ; 0x02331450
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMagnitude
	mov sl, r0
	b _023326CC
_0233146C: ; 0x0233146C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSkullBash
	mov sl, r0
	b _023326CC
_02331488: ; 0x02331488
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWish
	mov sl, r0
	b _023326CC
_023314A4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFlatter
	mov sl, r0
	b _023326CC
_023314C0: ; 0x023314C0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMudSlap
	mov sl, r0
	b _023326CC
_023314DC: ; 0x023314DC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLowerAccuracy1
	mov sl, r0
	b _023326CC
_023314F8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveOverheat
	mov sl, r0
	b _023326CC
_02331514: ; 0x02331514
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveToxic
	mov sl, r0
	b _023326CC
_02331530: ; 0x02331530
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMetalSound
	mov sl, r0
	b _023326CC
_0233154C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTorment
	mov sl, r0
	b _023326CC
_02331568:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSuperFang
	mov sl, r0
	b _023326CC
_02331584: ; 0x02331584
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamage__0232B8B0
	mov sl, r0
	b _023326CC
_023315A0: ; 0x023315A0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTwoEdge
	mov sl, r0
	b _023326CC
_023315BC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEndeavor
	mov sl, r0
	b _023326CC
_023315D8: ; 0x023315D8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSwitchPositions
	mov sl, r0
	b _023326CC
_023315F4: ; 0x023315F4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDreamEater
	mov sl, r0
	b _023326CC
_02331610: ; 0x02331610
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSearchlight
	mov sl, r0
	b _023326CC
_0233162C: ; 0x0233162C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFillIn
	mov sl, r0
	b _023326CC
_02331648: ; 0x02331648
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWarp
	mov sl, r0
	b _023326CC
_02331664: ; 0x02331664
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDrought
	mov sl, r0
	b _023326CC
_02331680: ; 0x02331680
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSeeStairs
	mov sl, r0
	b _023326CC
_0233169C: ; 0x0233169C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBrickBreak
	mov sl, r0
	b _023326CC
_023316B8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBoostDefense1
	mov sl, r0
	b _023326CC
_023316D4: ; 0x023316D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSureShot
	mov sl, r0
	b _023326CC
_023316F0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveVitalThrow
	mov sl, r0
	b _023326CC
_0233170C: ; 0x0233170C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFly
	mov sl, r0
	b _023326CC
_02331728: ; 0x02331728
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBounce
	mov sl, r0
	b _023326CC
_02331744: ; 0x02331744
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDive
	mov sl, r0
	b _023326CC
_02331760:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDig
	mov sl, r0
	b _023326CC
_0233177C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSweetScent
	mov sl, r0
	b _023326CC
_02331798:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDoubleTeam
	mov sl, r0
	b _023326CC
_023317B4: ; 0x023317B4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveKnockOff
	mov sl, r0
	b _023326CC
_023317D0: ; 0x023317D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTrapBuster
	mov sl, r0
	b _023326CC
_023317EC: ; 0x023317EC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLongToss
	mov sl, r0
	b _023326CC
_02331808: ; 0x02331808
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePierce
	mov sl, r0
	b _023326CC
_02331824:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGrudge
	mov sl, r0
	b _023326CC
_02331840: ; 0x02331840
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePetrify
	mov sl, r0
	b _023326CC
_0233185C: ; 0x0233185C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAssist
	mov sl, r0
	b _023326CC
_02331878: ; 0x02331878
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSetDamage
	mov sl, r0
	b _023326CC
_02331894: ; 0x02331894
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveShocker
	mov sl, r0
	b _023326CC
_023318B0: ; 0x023318B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDecoy
	mov sl, r0
	b _023326CC
_023318CC: ; 0x023318CC
	mov r0, #0
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveJumpKick
	mov sl, r0
	b _023326CC
_023318F0: ; 0x023318F0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveProtect
	mov sl, r0
	b _023326CC
_0233190C: ; 0x0233190C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTaunt
	mov sl, r0
	b _023326CC
_02331928: ; 0x02331928
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTickle
	mov sl, r0
	b _023326CC
_02331944: ; 0x02331944
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveReversal
	mov sl, r0
	b _023326CC
_02331960: ; 0x02331960
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSelfdestruct
	mov sl, r0
	b _023326CC
_0233197C: ; 0x0233197C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveExplosion
	mov sl, r0
	b _023326CC
_02331998: ; 0x02331998
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCharge
	mov sl, r0
	b _023326CC
_023319B4: ; 0x023319B4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFacade
	mov sl, r0
	b _023326CC
_023319D0: ; 0x023319D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageWeightDependent
	mov sl, r0
	b _023326CC
_023319EC: ; 0x023319EC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWaterSpout
	mov sl, r0
	b _023326CC
_02331A08: ; 0x02331A08
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEruption
	mov sl, r0
	b _023326CC
_02331A24:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSmokescreen
	mov sl, r0
	b _023326CC
_02331A40: ; 0x02331A40
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSeeTrap
	mov sl, r0
	b _023326CC
_02331A5C: ; 0x02331A5C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveStockpile
	mov sl, r0
	b _023326CC
_02331A78: ; 0x02331A78
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSpitUp
	mov sl, r0
	b _023326CC
_02331A94: ; 0x02331A94
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSwallow
	mov sl, r0
	b _023326CC
_02331AB0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRainDance
	mov sl, r0
	b _023326CC
_02331ACC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSpite
	mov sl, r0
	b _023326CC
_02331AE8: ; 0x02331AE8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveInvisify
	mov sl, r0
	b _023326CC
_02331B04: ; 0x02331B04
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMirrorCoat
	mov sl, r0
	b _023326CC
_02331B20: ; 0x02331B20
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePerishSong
	mov sl, r0
	b _023326CC
_02331B3C: ; 0x02331B3C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRapidSpin
	mov sl, r0
	b _023326CC
_02331B58: ; 0x02331B58
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDestinyBond
	mov sl, r0
	b _023326CC
_02331B74:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEncore
	mov sl, r0
	b _023326CC
_02331B90:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWeatherBall
	mov sl, r0
	b _023326CC
_02331BAC: ; 0x02331BAC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSunnyDay
	mov sl, r0
	b _023326CC
_02331BC8: ; 0x02331BC8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePayDay
	mov sl, r0
	b _023326CC
_02331BE4: ; 0x02331BE4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveOneRoom
	mov sl, r0
	b _023326CC
_02331C00: ; 0x02331C00
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEndure
	mov sl, r0
	b _023326CC
_02331C1C: ; 0x02331C1C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHelpingHand
	mov sl, r0
	b _023326CC
_02331C38: ; 0x02331C38
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBellyDrum
	mov sl, r0
	b _023326CC
_02331C54: ; 0x02331C54
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFamish
	mov sl, r0
	b _023326CC
_02331C70:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCharm
	mov sl, r0
	b _023326CC
_02331C8C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBubble
	mov sl, r0
	b _023326CC
_02331CA8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveStringShot
	mov sl, r0
	b _023326CC
_02331CC4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRockSmash
	mov sl, r0
	b _023326CC
_02331CE0: ; 0x02331CE0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTransform
	mov sl, r0
	b _023326CC
_02331CFC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHail
	mov sl, r0
	b _023326CC
_02331D18: ; 0x02331D18
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMobile
	mov sl, r0
	b _023326CC
_02331D34:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveExpose
	mov sl, r0
	b _023326CC
_02331D50: ; 0x02331D50
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSplash
	mov sl, r0
	b _023326CC
_02331D6C: ; 0x02331D6C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTransfer
	mov sl, r0
	b _023326CC
_02331D88: ; 0x02331D88
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveStayAway
	mov sl, r0
	b _023326CC
_02331DA4: ; 0x02331DA4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBeatUp
	mov sl, r0
	b _023326CC
_02331DC0: ; 0x02331DC0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRebound
	mov sl, r0
	b _023326CC
_02331DDC: ; 0x02331DDC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePause
	mov sl, r0
	b _023326CC
_02331DF8: ; 0x02331DF8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWildCall
	mov sl, r0
	b _023326CC
_02331E14: ; 0x02331E14
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveReviver
	mov sl, r0
	b _023326CC
_02331E30: ; 0x02331E30
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEscape
	mov sl, r0
	b _023326CC
_02331E4C: ; 0x02331E4C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSecretPower
	mov sl, r0
	b _023326CC
_02331E68: ; 0x02331E68
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveNaturePower
	mov sl, r0
	b _023326CC
_02331E84: ; 0x02331E84
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveItemize
	mov sl, r0
	b _023326CC
_02331EA0: ; 0x02331EA0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSketch
	movs sl, r0
	movne r0, #1
	strne r0, [sp, #0x58]
	b _023326CC
_02331EC4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMirrorMove
	mov sl, r0
	b _023326CC
_02331EE0: ; 0x02331EE0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRolePlay
	mov sl, r0
	b _023326CC
_02331EFC: ; 0x02331EFC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSkillSwap
	mov sl, r0
	b _023326CC
_02331F18: ; 0x02331F18
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveConversion
	mov sl, r0
	b _023326CC
_02331F34: ; 0x02331F34
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCleanse
	mov sl, r0
	b _023326CC
_02331F50:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveReturn
	mov sl, r0
	b _023326CC
_02331F6C: ; 0x02331F6C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSnatch
	mov sl, r0
	b _023326CC
_02331F88: ; 0x02331F88
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCamouflage
	mov sl, r0
	b _023326CC
_02331FA4: ; 0x02331FA4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFrustration
	mov sl, r0
	b _023326CC
_02331FC0: ; 0x02331FC0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePsychUp
	mov sl, r0
	b _023326CC
_02331FDC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveSnore
	mov sl, r0
	b _023326CC
_02331FF8: ; 0x02331FF8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRecycle
	mov sl, r0
	b _023326CC
_02332014: ; 0x02332014
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveNoMove
	mov sl, r0
	b _023326CC
_02332030: ; 0x02332030
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMetronome
	mov sl, r0
	b _023326CC
_0233204C: ; 0x0233204C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHpGauge
	mov sl, r0
	b _023326CC
_02332068: ; 0x02332068
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveConversion2
	mov sl, r0
	b _023326CC
_02332084: ; 0x02332084
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePounce
	mov sl, r0
	b _023326CC
_023320A0: ; 0x023320A0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTrawl
	mov sl, r0
	b _023326CC
_023320BC: ; 0x023320BC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCopycat
	mov sl, r0
	b _023326CC
_023320D8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHurl
	mov sl, r0
	b _023326CC
_023320F4: ; 0x023320F4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEcho
	mov sl, r0
	b _023326CC
_02332110: ; 0x02332110
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHammerArm
	mov sl, r0
	b _023326CC
_0233212C: ; 0x0233212C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAquaRing
	mov sl, r0
	b _023326CC
_02332148: ; 0x02332148
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGastroAcid
	mov sl, r0
	b _023326CC
_02332164: ; 0x02332164
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHealingWish
	mov sl, r0
	b _023326CC
_02332180: ; 0x02332180
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCloseCombat
	mov sl, r0
	b _023326CC
_0233219C: ; 0x0233219C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLuckyChant
	mov sl, r0
	b _023326CC
_023321B8: ; 0x023321B8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGuardSwap
	mov sl, r0
	b _023326CC
_023321D4: ; 0x023321D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHealOrder
	mov sl, r0
	b _023326CC
_023321F0: ; 0x023321F0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHealBlock
	mov sl, r0
	b _023326CC
_0233220C: ; 0x0233220C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveThunderFang
	mov sl, r0
	b _023326CC
_02332228: ; 0x02332228
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDefog
	mov sl, r0
	b _023326CC
_02332244: ; 0x02332244
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTrumpCard
	mov sl, r0
	b _023326CC
_02332260: ; 0x02332260
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveIceFang
	mov sl, r0
	b _023326CC
_0233227C: ; 0x0233227C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePsychoShift
	mov sl, r0
	b _023326CC
_02332298: ; 0x02332298
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveEmbargo
	mov sl, r0
	b _023326CC
_023322B4: ; 0x023322B4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFireFang
	mov sl, r0
	b _023326CC
_023322D0: ; 0x023322D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveBrine
	mov sl, r0
	b _023326CC
_023322EC: ; 0x023322EC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveNaturalGift
	mov sl, r0
	b _023326CC
_02332308: ; 0x02332308
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGyroBall
	mov sl, r0
	b _023326CC
_02332324: ; 0x02332324
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveShadowForce
	mov sl, r0
	b _023326CC
_02332340: ; 0x02332340
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveGravity
	mov sl, r0
	b _023326CC
_0233235C: ; 0x0233235C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveStealthRock
	mov sl, r0
	b _023326CC
_02332378: ; 0x02332378
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveChargeBeam
	mov sl, r0
	b _023326CC
_02332394: ; 0x02332394
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageEatItem
	mov sl, r0
	b _023326CC
_023323B0: ; 0x023323B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveAcupressure
	mov sl, r0
	b _023326CC
_023323CC: ; 0x023323CC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMagnetRise
	mov sl, r0
	b _023326CC
_023323E8: ; 0x023323E8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveToxicSpikes
	mov sl, r0
	b _023326CC
_02332404: ; 0x02332404
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTrickRoom
	mov sl, r0
	b _023326CC
_02332420: ; 0x02332420
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLastResort
	mov sl, r0
	b _023326CC
_0233243C: ; 0x0233243C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWorrySeed
	mov sl, r0
	b _023326CC
_02332458: ; 0x02332458
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDamageHpDependent
	mov sl, r0
	b _023326CC
_02332474: ; 0x02332474
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHeartSwap
	mov sl, r0
	b _023326CC
_02332490: ; 0x02332490
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRoost
	mov sl, r0
	b _023326CC
_023324AC: ; 0x023324AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePowerSwap
	mov sl, r0
	b _023326CC
_023324C8: ; 0x023324C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMovePowerTrick
	mov sl, r0
	b _023326CC
_023324E4: ; 0x023324E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFeint
	mov sl, r0
	b _023326CC
_02332500: ; 0x02332500
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveFlareBlitz
	mov sl, r0
	b _023326CC
_0233251C: ; 0x0233251C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveDefendOrder
	mov sl, r0
	b _023326CC
_02332538: ; 0x02332538
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLunarDance
	mov sl, r0
	b _023326CC
_02332554: ; 0x02332554
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMiracleEye
	mov sl, r0
	b _023326CC
_02332570: ; 0x02332570
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveWakeUpSlap
	mov sl, r0
	b _023326CC
_0233258C: ; 0x0233258C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveMetalBurst
	mov sl, r0
	b _023326CC
_023325A8: ; 0x023325A8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveHeadSmash
	mov sl, r0
	b _023326CC
_023325C4: ; 0x023325C4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveCaptivate
	mov sl, r0
	b _023326CC
_023325E0: ; 0x023325E0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveLeafStorm
	mov sl, r0
	b _023326CC
_023325FC: ; 0x023325FC
	ldr r0, [sp, #0x78]
	mov r1, r4
	str r0, [sp]
	mov r0, sb
	mov r2, r8
	mov r3, r7
	bl DoMoveDracoMeteor
	mov sl, r0
	b _023326CC
_02332620: ; 0x02332620
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveRockPolish
	mov sl, r0
	b _023326CC
_0233263C: ; 0x0233263C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveNastyPlot
	mov sl, r0
	b _023326CC
_02332658: ; 0x02332658
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTag0x1AB
	mov sl, r0
	b _023326CC
_02332674: ; 0x02332674
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E744
	mov sl, r0
	b _023326CC
_02332690: ; 0x02332690
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTag0x1A6
	mov sl, r0
	b _023326CC
_023326AC: ; 0x023326AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DoMoveTag0x1A7
	mov sl, r0
	b _023326CC
_023326C8:
	mov sl, #0
_023326CC:
	cmp sl, #0
	ldreq r0, [sp, #0x74]
	addeq r0, r0, #1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	streq r0, [sp, #0x74]
	beq _02332704
	ldr r0, [sp, #0x78]
	ldr r1, _023329D4 ; =ov29_02353718
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	str r4, [r1]
	mov r0, r0, asr #0x10
	str r0, [sp, #0x78]
_02332704:
	bl IsFloorOver
	cmp r0, #0
	bne _02332830
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _02332738
	ldr r0, _023329D8 ; =0x000001F6
	cmp r6, r0
	bne _02332738
	bl IsFloorOver
	cmp r0, #0
	bne _02332830
_02332738:
	ldr r0, [sp, #0x6c]
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _0233275C
	ldr r0, [sp, #0x6c]
	mov r1, r0
	ldr r1, [r1, #0xb4]
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_0233275C:
	cmp sl, #0
	bne _02332790
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _023327C8
	mov r0, r4
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrneb r0, [r5, #6]
	cmpne r0, #0
	strneb fp, [r5, #0x108 + EXECUTE_MOVE_EFFECT_OFFSET_2]
	b _023327C8
_02332790:
	mov r0, r8
	bl IsHyperBeamVariant
	cmp r0, #0
	beq _023327C8
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bne _023327C8
	mov r0, sb
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	ldrne r0, _023329DC ; =ov29_0237CA68
	movne r1, #1
	strneb r1, [r0]
_023327C8:
	mov r0, r4
	bl EntityIsValid__0232E840
	cmp r0, #0
	movne r0, #1
	strneb r0, [r5, #0x162 + EXECUTE_MOVE_EFFECT_OFFSET]
	cmp r6, #0x89
	beq _02332818
	mov r0, sb
	bl TryActivateNondamagingDefenderAbility
	mov r0, sb
	mov r1, r4
	bl TryActivateNondamagingDefenderExclusiveItem
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl TryActivateTraceAndColorChange
	mov r1, r4
	mov r0, sb
	mov r2, r8
	bl TryActivateConversion2
_02332818:
	ldr r0, [sp, #0x7c]
	add r0, r0, #1
	str r0, [sp, #0x7c]
_02332824:
	ldr r0, [sp, #0x7c]
	cmp r0, #0x40
	blt _0232E92C
_02332830:
	ldr r0, [sp, #0x80]
	cmp r0, #0
	beq _02332858
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r1, [sb, #0xb4]
	movne r0, #0
	strneb r0, [r1, #0x166 + EXECUTE_MOVE_EFFECT_OFFSET]
	strneb r0, [r1, #0x167 + EXECUTE_MOVE_EFFECT_OFFSET]
_02332858:
	mov r0, r6
	bl IsHealingWishOrLunarDance
	cmp r0, #0
	beq _0233289C
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _0233289C
	ldr r0, [sb, #0xb4]
	ldr r3, _023329E0 ; =0x0000023A
	ldrsh r1, [r0, #0x10]
	mov r0, sb
	mov r2, #0x17
	sub r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyDamageAndEffectsWrapper
_0233289C:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ldrle r0, [sp, #0x74]
	cmple r0, #0
	ble _02332930
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _02332930
	cmp r7, #0
	bne _02332930
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xbd]
	cmp r0, #1
	cmpne r6, #0xe3
	beq _02332930
	mov r0, sb
	mov r1, #0x2d
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02332930
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x50
	beq _02332930
	ldrb r1, [sb, #0xb0]
	ldr r3, _023329E4 ; =0x00000EC2
	mov r0, sb
	add r1, r1, #4
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	mov r2, #1
	bl ov29_023201D0
_02332930:
	bl IsFloorOver
	cmp r0, #0
	bne _023329CC
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r4, [sb, #0xb4]
	ldrneb r0, [r4, #0x15e + EXECUTE_MOVE_EFFECT_OFFSET]
	cmpne r0, #0
	beq _02332970
	mov r2, #0
	mov r0, sb
	mov r1, sb
	mov r3, r2
	strb r2, [r4, #0x15e + EXECUTE_MOVE_EFFECT_OFFSET]
	bl TryWarp
_02332970:
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _023329CC
	ldr r4, [sb, #0xb4]
	ldrb r0, [r4, #0x15f + EXECUTE_MOVE_EFFECT_OFFSET]
	cmp r0, #0
	beq _023329B8
	add r0, sp, #0x9c
	mov r5, #0
	strb r5, [r4, #0x15f + EXECUTE_MOVE_EFFECT_OFFSET]
	ldr r2, [r0]
	str r5, [sp]
	mov r0, sb
	mov r1, sb
	mov r3, #2
	str r5, [sp, #4]
	bl LowerOffensiveStat
_023329B8:
	ldrh r1, [r8, #4]
	ldr r0, _023329D8 ; =0x000001F6
	cmp r1, r0
	moveq r0, #0
	streqb r0, [r4, #0x170 + EXECUTE_MOVE_EFFECT_OFFSET]
_023329CC:
	add sp, sp, #0xf0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023329D4: .word ov29_02353718
_023329D8: .word 0x000001F6
_023329DC: .word ov29_0237CA68
_023329E0: .word 0x0000023A
_023329E4: .word 0x00000EC2 + EXECUTE_MOVE_EFFECT_DATA_OFFSET
	arm_func_end ExecuteMoveEffect

	arm_func_start ExclusiveItemEffectIsActive__023329E8
ExclusiveItemEffectIsActive__023329E8: ; 0x023329E8
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
	arm_func_end ExclusiveItemEffectIsActive__023329E8

	arm_func_start DefenderAbilityIsActive__02332A0C
DefenderAbilityIsActive__02332A0C: ; 0x02332A0C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02332A60
	cmp r0, #0
	moveq r1, #0
	beq _02332A40
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02332A40:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _02332A60
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02332A60:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActive__02332A0C

	arm_func_start DoMoveDamageInlined
DoMoveDamageInlined: ; 0x02332A70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	mov r5, r2
	mov r6, r1
	mov r7, r0
	mov r1, r5
	mov r4, r3
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x14
	str r1, [sp, #4]
	mov r0, #0x100
	str r0, [sp, #8]
	ldrh ip, [r5, #4]
	mov r1, #1
	mov r2, sb
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r3, r8
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	mov r1, r4
	mov r0, r5
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl PerformDamageSequence
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveDamageInlined

	arm_func_start DealDamage
DealDamage: ; 0x02332B20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	mov r5, r2
	mov r6, r1
	mov r7, r0
	mov r1, r5
	mov r4, r3
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r0, sp, #0x14
	stmib sp, {r0, r4}
	ldrh r4, [r5, #4]
	mov r2, sb
	mov r3, r8
	mov ip, #1
	str r4, [sp, #0xc]
	mov r0, r7
	mov r1, r6
	str ip, [sp, #0x10]
	bl CalcDamage
	ldr r1, [sp, #0x48]
	mov r0, r5
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DealDamage

	arm_func_start DealDamageWithTypeAndPowerBoost
DealDamageWithTypeAndPowerBoost: ; 0x02332BB8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl GetMovePower
	ldrsh r1, [sp, #0x48]
	add r0, r1, r0
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r8, r1, asr #0x10
	bl GetMoveCritChance
	str r0, [sp]
	add r0, sp, #0x14
	stmib sp, {r0, r4}
	ldrh r4, [r5, #4]
	mov r2, #1
	mov r3, r8
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r2, [sp, #0x44]
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	ldr r1, [sp, #0x40]
	mov r0, r5
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DealDamageWithTypeAndPowerBoost

	arm_func_start DealDamageProjectile
DealDamageProjectile: ; 0x02332C4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r4, r2
	mov r5, r1
	mov r1, r4
	mov r6, r0
	mov r8, r3
	bl GetMoveTypeForMonster
	mov r7, r0
	mov r0, r4
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x14
	str r1, [sp, #4]
	ldr r0, [sp, #0x40]
	mov r1, #1
	str r0, [sp, #8]
	ldrh ip, [r4, #4]
	mov r2, r7
	mov r3, r8
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, r6
	mov r1, r5
	bl CalcDamage
	ldr r1, [sp, #0x44]
	mov r0, r4
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r5
	mov r2, r4
	mov r0, r6
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DealDamageProjectile

	arm_func_start DealDamageWithType
DealDamageWithType: ; 0x02332CDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r4, r3
	mov r5, r1
	mov r1, r4
	mov r6, r0
	mov r8, r2
	bl GetMovePower
	mov r7, r0
	mov r0, r4
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x14
	str r1, [sp, #4]
	ldr r0, [sp, #0x40]
	mov r1, #1
	str r0, [sp, #8]
	ldrh ip, [r4, #4]
	mov r2, r8
	mov r3, r7
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, r6
	mov r1, r5
	bl CalcDamage
	ldr r1, [sp, #0x44]
	mov r0, r4
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r5
	mov r2, r4
	mov r0, r6
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DealDamageWithType

	arm_func_start PerformDamageSequence
PerformDamageSequence: ; 0x02332D6C
#ifdef JAPAN
#define PERFORM_DAMAGE_SEQUENCE_OFFSET -4
#else
#define PERFORM_DAMAGE_SEQUENCE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r4, [r8, #0xb4]
	mov r6, r3
	mov r3, #1
	mov r7, r1
	mov r5, r2
	str r3, [sp]
	bl MoveHitCheck
	cmp r0, #0
	beq _02332E3C
	ldrh r1, [r5, #4]
	ldr r0, _02332F04 ; =0x0000013A
	mov r2, #0x2e
	cmp r1, r0
	moveq r5, #1
	mov r0, r8
	mov r1, r7
#ifndef JAPAN
	mov r3, #1
#endif
	movne r5, #0
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _02332DFC
	ldr r1, _02332F08 ; =DUNGEON_PTR
	ldr r2, _02332F0C ; =0x000003E7
	ldr r0, [r1]
	add r0, r0, #0x700
	strh r2, [r0, #0x82]
	ldr r0, [r1]
	add r0, r0, #0x19000
#ifdef JAPAN
	str r7, [r0, #0x864]
#else
	str r7, [r0, #0x908]
#endif
	ldr r0, [r1]
	ldrh r1, [r7, #0x26]
	add r0, r0, #0x19000
#ifdef JAPAN
	str r1, [r0, #0x86c]
#else
	str r1, [r0, #0x910]
#endif
_02332DFC:
	ldrsh r0, [sp, #0x28]
	mov ip, #1
	str ip, [sp]
	str r0, [sp, #4]
	mov r3, r5
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str ip, [sp, #8]
	mov r5, #0
	str r5, [sp, #0xc]
	bl ApplyDamageAndEffects
	mov r0, r5
	strb r0, [r4, #0x166 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
	strb r0, [r4, #0x167 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
	b _02332ED0
_02332E3C:
	bl ov29_0234B034
	mov r3, #0
	str r3, [sp]
	ldr r2, [r7, #0xb4]
	mov r1, #1
	bl ov29_0230040C
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02332EA8
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02332EA8
	mov r2, #1
	ldr r0, _02332F10 ; =0x0000270F
	mov r1, r7
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
	ldr r2, _02332F14 ; =0x00000EC3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdQuietCheckUserTarget
	mov r0, r8
	mov r1, r7
	bl ov29_022E576C
	b _02332EB8
_02332EA8:
	ldr r2, _02332F14 ; =0x00000EC3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02332EB8:
	mov r2, #1
	strb r2, [r6, #0x10]
	ldrh r1, [r5, #4]
	rsb r0, r2, #0x164
	cmp r1, r0
	strneb r2, [r4, #0x166 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
_02332ED0:
	ldrb r0, [r6, #0x10]
	cmp r0, #0
	movne r0, #0
	bne _02332EFC
	mov r0, r7
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	movne r1, #1
	strneb r1, [r0, #0x164 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
	ldr r0, [r6]
_02332EFC:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02332F04: .word 0x0000013A
_02332F08: .word DUNGEON_PTR
_02332F0C: .word 0x000003E7
_02332F10: .word 0x0000270F
#ifdef JAPAN
_02332F14: .word 0x00000C05
#else
_02332F14: .word 0x00000EC3
#endif
	arm_func_end PerformDamageSequence

	arm_func_start ov29_02332F18
ov29_02332F18: ; 0x02332F18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r6, r2
	mov r7, r1
	mov r1, r6
	mov r8, r0
	mov r5, r3
	bl GetMoveTypeForMonster
	mov r4, r0
	ldrh r0, [r6, #4]
	bl GetMoveCategory
	mov r3, r0
	str r5, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	mov r2, r4
	mov r0, r8
	mov r1, r7
	bl ov29_0230D088
	ldr r1, [sp, #0x40]
	mov r0, r6
	bl GetDamageSourceWrapper
	mov r1, #1
	str r1, [sp]
	stmib sp, {r0, r1}
	mov r3, #0
	mov r0, r8
	str r3, [sp, #0xc]
	mov r1, r7
	add r2, sp, #0x10
	bl ApplyDamageAndEffects
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	movne r0, #0
	bne _02332FC0
	mov r0, r7
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	movne r1, #1
#ifdef JAPAN
	strneb r1, [r0, #0x160]
#else
	strneb r1, [r0, #0x164]
#endif
	ldr r0, [sp, #0x10]
_02332FC0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02332F18

	arm_func_start CanHitWithRegularAttack
CanHitWithRegularAttack: ; 0x02332FC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #4]
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _02333010
	ldrsh r1, [r5, #6]
	ldrsh r0, [r4, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _02333018
_02333010:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02333018:
	add r0, r4, #4
	add r1, r5, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r4
	bl CanAttackInDirection
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanHitWithRegularAttack

	arm_func_start ov29_02333044
ov29_02333044: ; 0x02333044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #4
	add r1, r1, #4
	ldr r4, [r5, #0xb4]
	bl GetDirectionTowardsPosition
	mov r1, r0
	and r2, r1, #7
	mov r0, r5
	strb r2, [r4, #0x4c]
	bl ov29_02304A48
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02333044

	arm_func_start StatusCheckerCheck
StatusCheckerCheck: ; 0x02333074
#ifdef JAPAN
#define STATUS_CHECKER_CHECK_OFFSET -4
#define STATUS_CHECKER_CHECK_OFFSET_2 -0xA4
#else
#define STATUS_CHECKER_CHECK_OFFSET 0
#define STATUS_CHECKER_CHECK_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrh r2, [r1, #4]
	ldr r1, _02333F98 ; =0x00000109
	mov r4, r0
	cmp r2, r1
	ldr r3, [r4, #0xb4]
	bgt _02333314
	cmp r2, r1
	bge _02333834
	cmp r2, #0x9c
	bgt _023331F4
	bge _023339D8
	cmp r2, #0x4a
	bgt _02333170
	bge _0233397C
	cmp r2, #0x2b
	bgt _02333114
	bge _02333BCC
	cmp r2, #0x13
	bgt _023330F8
	bge _02333620
	sub r1, r2, #7
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02333F90
_023330D8: ; jump table
	b _02333BCC ; case 0
	b _023339F0 ; case 1
	b _02333F90 ; case 2
	b _02333F90 ; case 3
	b _02333F90 ; case 4
	b _02333918 ; case 5
	b _02333F90 ; case 6
	b _0233360C ; case 7
_023330F8:
	cmp r2, #0x26
	bgt _02333108
	beq _02333634
	b _02333F90
_02333108:
	cmp r2, #0x28
	beq _02333648
	b _02333F90
_02333114:
	cmp r2, #0x37
	bgt _0233313C
	bge _02333660
	cmp r2, #0x31
	bgt _02333130
	beq _02333A84
	b _02333F90
_02333130:
	cmp r2, #0x33
	beq _02333634
	b _02333F90
_0233313C:
	cmp r2, #0x3d
	bgt _02333164
	cmp r2, #0x38
	blt _02333F90
	beq _02333B00
	cmp r2, #0x3a
	beq _023336B0
	cmp r2, #0x3d
	beq _023336D8
	b _02333F90
_02333164:
	cmp r2, #0x46
	beq _023336B0
	b _02333F90
_02333170:
	cmp r2, #0x68
	bgt _023331B0
	bge _02333730
	cmp r2, #0x62
	bgt _02333194
	bge _02333700
	cmp r2, #0x5f
	beq _023336EC
	b _02333F90
_02333194:
	cmp r2, #0x63
	bgt _023331A4
	beq _02333714
	b _02333F90
_023331A4:
	cmp r2, #0x66
	beq _02333A98
	b _02333F90
_023331B0:
	cmp r2, #0x86
	bgt _023331D8
	bge _02333954
	cmp r2, #0x80
	bgt _023331CC
	beq _02333744
	b _02333F90
_023331CC:
	cmp r2, #0x82
	beq _02333758
	b _02333F90
_023331D8:
	cmp r2, #0x8d
	bgt _023331E8
	beq _0233392C
	b _02333F90
_023331E8:
	cmp r2, #0x94
	beq _02333B14
	b _02333F90
_023331F4:
	cmp r2, #0xd7
	bgt _02333284
	bge _023336C4
	cmp r2, #0xb9
	bgt _02333240
	bge _02333BF4
	cmp r2, #0xa9
	bgt _02333224
	bge _02333780
	cmp r2, #0xa0
	beq _02333AB8
	b _02333F90
_02333224:
	cmp r2, #0xb5
	bgt _02333234
	beq _02333B28
	b _02333F90
_02333234:
	cmp r2, #0xb8
	beq _02333BE0
	b _02333F90
_02333240:
	cmp r2, #0xc3
	bgt _02333268
	bge _02333660
	cmp r2, #0xba
	bgt _0233325C
	beq _023336B0
	b _02333F90
_0233325C:
	cmp r2, #0xbb
	beq _02333BCC
	b _02333F90
_02333268:
	cmp r2, #0xca
	bgt _02333278
	beq _023336B0
	b _02333F90
_02333278:
	cmp r2, #0xd4
	beq _02333A44
	b _02333F90
_02333284:
	cmp r2, #0xec
	bgt _023332C4
	bge _023337D4
	cmp r2, #0xe1
	bgt _023332A8
	bge _02333B3C
	cmp r2, #0xdf
	beq _02333940
	b _02333F90
_023332A8:
	cmp r2, #0xe8
	bgt _023332B8
	beq _023339B0
	b _02333F90
_023332B8:
	cmp r2, #0xe9
	beq _02333794
	b _02333F90
_023332C4:
	sub r0, r1, #8
	cmp r2, r0
	bgt _023332F0
	bge _02333674
	cmp r2, #0xf5
	bgt _023332E4
	beq _0233380C
	b _02333F90
_023332E4:
	cmp r2, #0x100
	beq _02333820
	b _02333F90
_023332F0:
	sub r0, r1, #7
	cmp r2, r0
	bgt _02333304
	beq _023336B0
	b _02333F90
_02333304:
	sub r0, r1, #6
	cmp r2, r0
	beq _0233376C
	b _02333F90
_02333314:
	add r5, r1, #0x68
	cmp r2, r5
	bgt _023334B4
	bge _02333BCC
	add r5, r1, #0x34
	cmp r2, r5
	bgt _02333414
	bge _02333820
	cmp r2, #0x120
	bgt _02333398
	bge _02333884
	add r4, r1, #0x11
	cmp r2, r4
	bgt _02333378
	mov r0, r4
	cmp r2, r0
	bge _02333B60
	add r0, r1, #4
	cmp r2, r0
	bgt _02333F90
	cmp r2, #0x10c
	blt _02333F90
	cmpne r2, r0
	beq _02333BCC
	b _02333F90
_02333378:
	cmp r2, #0x11c
	bgt _02333388
	beq _02333BCC
	b _02333F90
_02333388:
	add r1, r1, #0x15
	cmp r2, r1
	beq _02333850
	b _02333F90
_02333398:
	add r0, r1, #0x2a
	cmp r2, r0
	bgt _023333F4
	add r0, r1, #0x24
	subs r0, r2, r0
	addpl pc, pc, r0, lsl #2
	b _023333D0
_023333B4: ; jump table
	b _02333904 ; case 0
	b _023336B0 ; case 1
	b _02333F90 ; case 2
	b _02333A98 ; case 3
	b _02333904 ; case 4
	b _02333F90 ; case 5
	b _02333A64 ; case 6
_023333D0:
	ldr r0, _02333F9C ; =0x00000127
	cmp r2, r0
	bgt _023333E4
	beq _02333B84
	b _02333F90
_023333E4:
	add r0, r0, #3
	cmp r2, r0
	beq _023338F0
	b _02333F90
_023333F4:
	add r0, r1, #0x30
	cmp r2, r0
	bgt _02333408
	beq _02333898
	b _02333F90
_02333408:
	cmp r2, #0x13c
	beq _023338AC
	b _02333F90
_02333414:
	cmp r2, #0x154
	bgt _02333464
	bge _023336D8
	add r0, r1, #0x44
	cmp r2, r0
	bgt _02333440
	bge _02333660
	add r0, r1, #0x36
	cmp r2, r0
	beq _02333B9C
	b _02333F90
_02333440:
	add r0, r1, #0x45
	cmp r2, r0
	bgt _02333454
	beq _02333BB8
	b _02333F90
_02333454:
	add r0, r1, #0x49
	cmp r2, r0
	beq _023338C0
	b _02333F90
_02333464:
	cmp r2, #0x16c
	bgt _02333494
	bge _02333990
	add r0, r1, #0x4e
	cmp r2, r0
	bgt _02333484
	beq _023338D4
	b _02333F90
_02333484:
	add r0, r1, #0x54
	cmp r2, r0
	beq _02333700
	b _02333F90
_02333494:
	add r0, r1, #0x66
	cmp r2, r0
	bgt _023334A8
	beq _02333BCC
	b _02333F90
_023334A8:
	cmp r2, #0x170
	beq _02333BCC
	b _02333F90
_023334B4:
	cmp r2, #0x1d8
	bgt _02333578
	bge _02333634
	add r5, r1, #0x7e
	cmp r2, r5
	bgt _02333520
	mov r4, r5
	cmp r2, r4
	bge _02333968
	add r4, r1, #0x71
	cmp r2, r4
	bgt _02333500
	mov r0, r4
	cmp r2, r0
	bge _02333ACC
	add r0, r1, #0x6e
	cmp r2, r0
	beq _02333BCC
	b _02333F90
_02333500:
	cmp r2, #0x17c
	bgt _02333510
	beq _02333A98
	b _02333F90
_02333510:
	add r1, r1, #0x7c
	cmp r2, r1
	beq _02333A1C
	b _02333F90
_02333520:
	cmp r2, #0x1bc
	bgt _02333550
	bge _023336EC
	add r0, r1, #0x8d
	cmp r2, r0
	bgt _02333540
	beq _02333BCC
	b _02333F90
_02333540:
	add r0, r1, #0xa9
	cmp r2, r0
	beq _02333CEC
	b _02333F90
_02333550:
	add r5, r1, #0xb6
	cmp r2, r5
	bgt _0233356C
	mov r0, r5
	cmp r2, r0
	beq _02333D00
	b _02333F90
_0233356C:
	cmp r2, #0x1d0
	beq _02333DE0
	b _02333F90
_02333578:
	add r0, r1, #0xea
	cmp r2, r0
	bgt _023335C0
	bge _02333F24
	cmp r2, #0x1ec
	bgt _023335A0
	bge _02333DF8
	cmp r2, #0x1e0
	beq _02333B84
	b _02333F90
_023335A0:
	add r0, r1, #0xe4
	cmp r2, r0
	bgt _023335B4
	beq _02333F10
	b _02333F90
_023335B4:
	cmp r2, #0x1f0
	beq _02333B84
	b _02333F90
_023335C0:
	rsb r0, r1, #0x320
	cmp r2, r0
	bgt _023335EC
	bge _023336D8
	cmp r2, #0x208
	bgt _023335E0
	beq _02333F38
	b _02333F90
_023335E0:
	cmp r2, #0x214
	beq _02333F6C
	b _02333F90
_023335EC:
	cmp r2, #0x21c
	bgt _023335FC
	beq _023336EC
	b _02333F90
_023335FC:
	ldr r0, _02333FA0 ; =0x0000021E
	cmp r2, r0
	beq _02333F80
	b _02333F90
_0233360C:
	bl GetApparentWeather
	cmp r0, #5
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333620:
	ldrb r0, [r3, #0xd2]
	cmp r0, #0xc
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333634:
	ldrb r0, [r3, #0xd5]
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333648:
	mov r0, r4
	bl MirrorMoveIsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333660:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333674:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	bgt _023336A8
	add r0, r3, #0x100
	ldrh r1, [r0, #0x46 + STATUS_CHECKER_CHECK_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + STATUS_CHECKER_CHECK_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #1
	bge _02333F90
_023336A8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336B0:
	ldrsh r0, [r3, #0x28]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336C4:
	ldrsh r0, [r3, #0x2a]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336D8:
	ldrb r0, [r3, #0xd2]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336EC:
	ldr r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #3
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333700:
	ldrb r0, [r3, #0xec]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333714:
	ldrsh r0, [r3, #0x28]
	cmp r0, #0x13
	ldrgtsh r0, [r3, #0x2a]
	cmpgt r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333730:
	ldrb r0, [r3, #0xd5]
	cmp r0, #9
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333744:
	ldrb r0, [r3, #0xd2]
	cmp r0, #0xb
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333758:
	bl MistIsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233376C:
	ldrb r0, [r3, #0xd5]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333780:
	ldrsh r0, [r3, #0x2e]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333794:
	ldrb r0, [r3, #0xc4]
	cmp r0, #5
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r4, [r3, #0x12]
	ldrsh r2, [r3, #0x16]
	rsb r0, r1, #0x4f0
	ldrsh r1, [r3, #0x10]
	add r2, r4, r2
	cmp r2, r0
	movgt r2, r0
	add r0, r2, r2, lsr #31
	cmp r1, r0, asr #1
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023337D4:
	ldrsh r4, [r3, #0x12]
	ldrsh r2, [r3, #0x16]
	rsb r0, r1, #0x4f0
	add r2, r4, r2
	cmp r2, r0
	movgt r2, r0
	ldrsh r0, [r3, #0x10]
	cmp r2, r0
	ble _02333804
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #0
	bne _02333F90
_02333804:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233380C:
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333820:
	ldrb r0, [r3, #0xec]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333834:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ldrgtsh r0, [r3, #0x28]
	cmpgt r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333850:
	ldr r1, _02333FA4 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r1, [r1]
	ldr r3, _02333FA8 ; =ov10_022C6322
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrsh r1, [r1, #0x30]
#else
	ldrsh r1, [r1, #0xd4]
#endif
	smulbb r1, r1, r2
	ldrb r1, [r3, r1]
	bl MonsterIsType
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333884:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333898:
	ldrb r0, [r3, #0xe0]
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338AC:
	ldrb r0, [r3, #0xd5]
	cmp r0, #8
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338C0:
	ldrb r0, [r3, #0xd5]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338D4:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ldrgt r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmpgt r0, #3
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338F0:
	ldrb r0, [r3, #0xd5]
	cmp r0, #5
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333904:
	ldrb r0, [r3, #0xd5]
	cmp r0, #7
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333918:
	bl GetApparentWeather
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233392C:
	bl GetApparentWeather
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333940:
	bl GetApparentWeather
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333954:
	ldrb r0, [r3, #0xd5]
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333968:
	ldrb r0, [r3, #0xef]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233397C:
	ldrb r0, [r3, #0xec]
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333990:
	ldrb r0, [r3, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339B0:
	bl ov29_023007DC
	cmp r0, #0
	bne _02333F90
	mov r0, r4
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339D8:
	bl GetTileAtEntity
	bl ov29_02337E2C
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339F0:
	bl GetTileAtEntity
	mov r4, r0
	bl ov29_02337E2C
	cmp r0, #0
	beq _02333A14
	ldrh r0, [r4]
	and r0, r0, #3
	cmp r0, #1
	beq _02333F90
_02333A14:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A1C:
	bl GetTileAtEntity
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r0]
	cmp r0, #2
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A44:
	ldr r0, _02333FA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5b + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A64:
	ldr r0, _02333FA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5c + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A84:
	ldrb r0, [r3, #0xfd]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A98:
	ldr r0, _02333FA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe38 + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333AB8:
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #3
	blo _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333ACC:
	ldrb r0, [r3, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02333F90
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B00:
	ldrsh r0, [r3, #0x2e]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B14:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B28:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B3C:
	ldrb r0, [r3, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r3, #0xd5]
	cmp r0, #6
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B60:
	ldrb r0, [r3, #0xef]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B84:
	add r0, r4, #4
	bl ov29_022EDC30
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B9C:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	ldrgesh r0, [r3, #0x2a]
	cmpge r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BB8:
	ldrb r0, [r3, #0xd8]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BCC:
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BE0:
	bl Conversion2IsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BF4:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333C78
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333C60
_02333C0C:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333C5C
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333C5C
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrltsh r0, [r1, #0x26]
	cmplt r0, #0x14
	blt _02333C68
_02333C5C:
	add r5, r5, #1
_02333C60:
	cmp r5, #0x10
	blt _02333C0C
_02333C68:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333C78:
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333CD4
_02333C80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333CD0
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333CD0
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrltsh r0, [r1, #0x26]
	cmplt r0, #0x14
	blt _02333CDC
_02333CD0:
	add r5, r5, #1
_02333CD4:
	cmp r5, #4
	blt _02333C80
_02333CDC:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333CEC:
	ldrb r0, [r3, #0xd5]
	cmp r0, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333D00:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333D78
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333D60
_02333D18:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333D5C
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	ldrneb r0, [r0, #0xd5]
	cmpne r0, #0x11
	bne _02333D68
_02333D5C:
	add r5, r5, #1
_02333D60:
	cmp r5, #0x10
	blt _02333D18
_02333D68:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333D78:
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333DC8
_02333D80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333DC4
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	ldrneb r0, [r0, #0xd5]
	cmpne r0, #0x11
	bne _02333DD0
_02333DC4:
	add r5, r5, #1
_02333DC8:
	cmp r5, #4
	blt _02333D80
_02333DD0:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DE0:
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DF8:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333E8C
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333E74
_02333E10:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333E70
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333E70
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x26]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x2a]
	cmpge r0, #0x14
	blt _02333E7C
_02333E70:
	add r5, r5, #1
_02333E74:
	cmp r5, #0x10
	blt _02333E10
_02333E7C:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333E8C:
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333EF8
_02333E94:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333EF4
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333EF4
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x26]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x2a]
	cmpge r0, #0x14
	blt _02333F00
_02333EF4:
	add r5, r5, #1
_02333EF8:
	cmp r5, #4
	blt _02333E94
_02333F00:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F10:
	ldrb r0, [r3, #0xf7]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F24:
	ldr r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #1
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F38:
	mov r1, #0
	b _02333F54
_02333F40:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #0x28]
	cmp r0, #0x14
	blt _02333F5C
	add r1, r1, #1
_02333F54:
	cmp r1, #2
	blt _02333F40
_02333F5C:
	cmp r1, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F6C:
	ldrb r0, [r3, #0xd5]
	cmp r0, #0xf
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F80:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_02333F90:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02333F98: .word 0x00000109
_02333F9C: .word 0x00000127
_02333FA0: .word 0x0000021E
_02333FA4: .word DUNGEON_PTR
_02333FA8: .word ov10_022C6322
	arm_func_end StatusCheckerCheck
