	.include "asm/macros.inc"
	.include "overlay_29_0232E864.inc"

	.text

	arm_func_start ExecuteMoveEffect
ExecuteMoveEffect: ; 0x0232E864
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xf0
	ldr fp, _0232F7AC ; =0x022C45F8
	str r0, [sp, #0x14]
	ldrsh r0, [fp]
	ldr r5, _0232F7B0 ; =0x02352AE8
	ldr sl, _0232F7B4 ; =0x022C483C
	ldr r7, [r5]
	str r0, [sp, #0x34]
	ldr r0, [sl]
	ldr r4, _0232F7B8 ; =0x02352AEC
	mov r8, r2
	ldr r6, [r4]
	mov r2, #0
	str r2, [sp, #0x78]
	str r6, [sp, #0xa0]
	ldr r5, _0232F7BC ; =0x022C4468
	str r0, [sp, #0x30]
	ldrsh r0, [r5]
	ldr r4, _0232F7C0 ; =0x022C460C
	ldrh r6, [r8, #4]
	str r0, [sp, #0x2c]
	ldrsh r0, [r4]
	ldr r2, _0232F7C4 ; =0x022C4480
	ldr ip, _0232F7C8 ; =0x022C4614
	str r0, [sp, #0x28]
	ldrsh r0, [r2]
	ldr lr, _0232F7CC ; =0x022C4508
	mov sb, r1
	str r0, [sp, #0x24]
	ldrsh r0, [ip]
	str r7, [sp, #0x9c]
	ldr r1, _0232F7D0 ; =0x02353718
	str r0, [sp, #0x20]
	ldrsh r0, [lr]
	mov r7, r3
	str r0, [sp, #0x1c]
	ldr r0, _0232F7D4 ; =0x022C4504
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
	strb r0, [sl, #0x164]
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
	ldrne r0, _0232F7D8 ; =0x02353538
	ldrne r0, [r0]
	addne r0, r0, #0x19000
	ldrne r5, [r0, #0x904]
	cmpne r5, #0
	beq _0232EA2C
	ldr r1, [r5]
	cmp r1, #1
	bne _0232EE54
	cmp r5, sb
	beq _0232EE54
	ldr r1, [r0, #0x90c]
	ldr r0, [r5, #0xb4]
	ldr r0, [r0, #0xb0]
	cmp r1, r0
	ldreqb r0, [sl, #0x10b]
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
	bl AbilityIsActive2
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
	bl ov29_02300DCC
	cmp r0, #0
	bne _0232ED9C
	mov r0, sb
	mov r1, r8
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	tst r0, #0xf0
	bne _0232ED9C
	add r0, sl, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	ldr r1, [sp, #0x34]
	cmp r0, r1
	blt _0232ED9C
	ldrb r0, [sl, #0x10b]
	cmp r0, #0
	bne _0232EE54
	ldrb r5, [sl, #0x4c]
	str r5, [sp, #0x50]
	bl ov29_022E0880
	cmp r0, #0
	beq _0232EB78
	mov r0, sb
	mov r1, r4
	mov r2, #0xeb0
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
	ldr r0, _0232F7E8 ; =0x0235171C
	ldr r3, _0232F7E8 ; =0x0235171C
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
	bl ov29_022E272C
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
	ldrh r5, [r0, #0x46]
	sub r1, sp, #4
	ldrh r3, [sp, #0x98]
	strh r5, [r1]
	ldrh r0, [r0, #0x48]
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
	strh r3, [r1, #0x46]
	ldr r0, _0232F7EC ; =0x00000163
	strh r2, [r1, #0x48]
	ldrh r1, [r8, #4]
	cmp r1, r0
	mov r0, sb
	mov r1, r4
	bne _0232ED2C
	ldr r2, _0232F7F0 ; =0x00000EB1
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232ED34
_0232ED2C:
	ldr r2, _0232F7F4 ; =0x00000EAE
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
	ldreqb r0, [r0, #0x10b]
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
	mov r2, #0xec0
	bl LogMessageByIdWithPopupCheckUserTarget
_0232EE54:
	ldr r1, _0232F800 ; =0x0237CA80
	ldr r0, _0232F804 ; =0x0237CA74
	ldr r3, [r1]
	ldr r2, [r0]
	add r3, r3, #1
	str r3, [r1]
	add r1, r2, #1
	str r1, [r0]
	ldr r5, [r4, #0xb4]
	mov r0, #0
	strb r0, [r5, #0x164]
	ldrb r0, [r5, #6]
	cmp r0, #0
	ldrneh r1, [sb, #4]
	addne r0, r5, #0x100
	strneh r1, [r0, #0x7e]
	ldrneh r1, [sb, #6]
	strneh r1, [r0, #0x80]
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
	bl AbilityIsActive2
	cmp r0, #0
	beq _0232EF28
	mov r0, sb
	mov r1, r4
	mov r2, #1
	bl ov29_022FB10C
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
	bl AbilityIsActive2
	cmp r0, #0
	beq _0232EF48
	mov r0, sb
	mov r1, r4
	bl ov29_0231B0A4
_0232EF48:
	mov r0, sb
	mov r1, r8
	bl ov29_023245A4
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
	bl ov29_02332FC8
	cmp r0, #0
	beq _0232F188
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _0232F050
	mov r0, r4
	mov r1, #0x21
	add r2, sp, #0xac
	bl ov29_0230F654
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
	strb r0, [r5, #0x164]
	mov r0, #1
	mov r4, sb
	str r0, [sp, #0x60]
	b _0232F188
_0232F090:
	mov r0, r4
	bl ov29_02319748
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
	bl ov29_0232461C
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
	bl ov29_02332FC8
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
	strb r0, [r5, #0x164]
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
	bl ov29_02324854
	cmp r0, #0
	movne fp, #0
	cmp fp, #0
	beq _0232F270
	mov r0, sb
	mov r1, r4
	mov r2, #0x3c
	mov r3, #1
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
	mov r3, #1
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
	bl ov29_0234B250
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
	bl ov29_022E272C
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
	bl ov29_022E38E0
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
	bl ov29_023256B4
	b _0232F40C
_0232F3F8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, #0
	bl ov29_023256B4
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
	bl ov29_022FB678
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
	ldreq r0, _0232F838 ; =0x0237CA69
	moveq r1, #1
	streqb r1, [r0]
	ldrh r1, [r8, #4]
	ldr r0, _0232F7EC ; =0x00000163
	cmp r1, r0
	movne r0, #1
	strneb r0, [r2, #0x166]
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
	bl ov29_0230175C
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
	ldr r2, _0232F84C ; =0x00000EBE
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
	bl ov29_022E272C
	cmp r0, #0
	beq _0232F5BC
	ldr r0, _0232F858 ; =0x0000270F
	mov r1, r4
	mov r2, #1
	sub r3, r2, #2
	bl ov29_022EA718
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
	bl ov29_02329B68
	b _0232F608
_0232F5EC:
	mov r1, r4
	mov r0, #1
	str r0, [sp]
	mov r0, sb
	mov r2, r8
	mov r3, r7
	bl ov29_02329970
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
	ldrb fp, [r5, #0x108]
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
	strlob sl, [r5, #0x108]
_0232F660:
	ldr r0, [sp, #0x118]
	cmp r0, #1
	moveq r0, #2
	streqb r0, [r5, #0x108]
_0232F670:
	ldrb r0, [r5, #0x177]
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
	strb r0, [r5, #0x177]
_0232F6A0:
	ldrb r0, [r5, #0x178]
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
	strb r0, [r5, #0x178]
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
	ldrb r0, [r2, #0x23f]
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
	mov r3, #1
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _0232F87C
	mov r0, sb
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl ov29_0230175C
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
_0232F7AC: .word 0x022C45F8
_0232F7B0: .word 0x02352AE8
_0232F7B4: .word 0x022C483C
_0232F7B8: .word 0x02352AEC
_0232F7BC: .word 0x022C4468
_0232F7C0: .word 0x022C460C
_0232F7C4: .word 0x022C4480
_0232F7C8: .word 0x022C4614
_0232F7CC: .word 0x022C4508
_0232F7D0: .word 0x02353718
_0232F7D4: .word 0x022C4504
_0232F7D8: .word 0x02353538
_0232F7DC: .word 0x00000EAB
_0232F7E0: .word 0x00000EAC
_0232F7E4: .word 0x00000EAD
_0232F7E8: .word 0x0235171C
_0232F7EC: .word 0x00000163
_0232F7F0: .word 0x00000EB1
_0232F7F4: .word 0x00000EAE
_0232F7F8: .word 0x00000EB2
_0232F7FC: .word 0x00000EAF
_0232F800: .word 0x0237CA80
_0232F804: .word 0x0237CA74
_0232F808: .word 0x00000EB3
_0232F80C: .word 0x00000EB5
_0232F810: .word 0x00000EB4
_0232F814: .word 0x00000EB7
_0232F818: .word 0x00000EB6
_0232F81C: .word 0x000001DD
_0232F820: .word 0x00000EB8
_0232F824: .word 0x00000EB9
_0232F828: .word 0x00000131
_0232F82C: .word 0x00000EBA
_0232F830: .word 0x000001F6
_0232F834: .word 0x00000232
_0232F838: .word 0x0237CA69
_0232F83C: .word 0x00001307
_0232F840: .word 0x00001306
_0232F844: .word 0x00000EBC
_0232F848: .word 0x00000EBD
_0232F84C: .word 0x00000EBE
_0232F850: .word 0x00000EBF
_0232F854: .word 0x00000EBB
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
	bl ov29_0230D440
_0232F8A0:
	ldr r0, _0232F85C ; =0x0000021E
	mov r1, #1
	strb r1, [r5, #0x162]
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
	b ov29_023319B4 ; case 67
	b _0233037C ; case 68
	b ov29_02330468 ; case 69
	b _023316B8 ; case 70
	b ov29_02330680 ; case 71
	b ov29_0233169C ; case 72
	b ov29_02330AA8 ; case 73
	b ov29_02330360 ; case 74
	b ov29_02331258 ; case 75
	b ov29_02330DB8 ; case 76
	b ov29_02331944 ; case 77
	b ov29_02331434 ; case 78
	b _02330974 ; case 79
	b ov29_02330DB8 ; case 80
	b _0233037C ; case 81
	b ov29_0233069C ; case 82
	b ov29_02331530 ; case 83
	b _02330974 ; case 84
	b ov29_02331928 ; case 85
	b ov29_023304BC ; case 86
	b _0233037C ; case 87
	b ov29_023313E0 ; case 88
	b ov29_023304BC ; case 89
	b _0233037C ; case 90
	b ov29_02330ED0 ; case 91
	b ov29_023319D0 ; case 92
	b ov29_0233069C ; case 93
	b ov01_0233103C ; case 94
	b ov29_0233111C ; case 95
	b ov29_02331B3C ; case 96
	b ov29_02330AA8 ; case 97
	b ov29_023316D4 ; case 98
	b ov29_02330C84 ; case 99
	b ov29_02330E98 ; case 100
	b ov29_02330328 ; case 101
	b ov29_023318B0 ; case 102
	b ov29_02330878 ; case 103
	b ov29_02331C00 ; case 104
	b _02330FE8 ; case 105
	b ov29_02330D10 ; case 106
	b ov29_023306B8 ; case 107
	b ov29_02331370 ; case 108
	b ov29_023304F4 ; case 109
	b ov29_02330CF4 ; case 110
	b _02330974 ; case 111
	b ov29_02330F08 ; case 112
	b ov29_023319EC ; case 113
	b ov29_023306B8 ; case 114
	b ov29_02331FC0 ; case 115
	b ov29_02330DF0 ; case 116
	b ov29_02331090 ; case 117
	b ov29_0233029C ; case 118
	b ov29_02331E68 ; case 119
	b ov29_0233077C ; case 120
	b ov29_02331944 ; case 121
	b ov29_0233131C ; case 122
	b ov29_02331960 ; case 123
	b ov29_0233093C ; case 124
	b ov29_02330468 ; case 125
	b _02330134 ; case 126
	b ov29_02330824 ; case 127
	b ov29_02331998 ; case 128
	b ov29_023309AC ; case 129
	b ov29_02330FB0 ; case 130
	b ov29_02330414 ; case 131
	b _02330134 ; case 132
	b ov29_02330798 ; case 133
	b ov29_02330F94 ; case 134
	b ov29_02330E0C ; case 135
	b _02330134 ; case 136
	b ov29_02331EFC ; case 137
	b ov29_02331EA0 ; case 138
	b ov29_023307D0 ; case 139
	b ov29_02330DD4 ; case 140
	b ov29_02330F78 ; case 141
	b ov29_023314DC ; case 142
	b ov29_02330468 ; case 143
	b ov29_0233077C ; case 144
	b _02330134 ; case 145
	b ov29_023314DC ; case 146
	b ov29_02330728 ; case 147
	b ov29_02330C14 ; case 148
	b ov29_02330744 ; case 149
	b ov29_02330430 ; case 150
	b ov29_02330E7C ; case 151
	b ov29_02330904 ; case 152
	b ov29_0233170C ; case 153
	b _02330134 ; case 154
	b ov29_0233197C ; case 155
	b ov29_02331744 ; case 156
	b _0233030C ; case 157
	b ov29_02330280 ; case 158
	b ov29_02330CA0 ; case 159
	b ov29_02331A5C ; case 160
	b _02330134 ; case 161
	b ov29_02330664 ; case 162
	b _02330134 ; case 163
	b ov29_02330E60 ; case 164
	b ov29_02331020 ; case 165
	b _02330134 ; case 166
	b _02330134 ; case 167
	b _02330134 ; case 168
	b ov29_02330B50 ; case 169
	b ov29_02330D80 ; case 170
	b _02330A00 ; case 171
	b ov29_0233190C ; case 172
	b ov29_02331058 ; case 173
	b _02330134 ; case 174
	b _02330134 ; case 175
	b _02330134 ; case 176
	b ov29_023309E4 ; case 177
	b _02330134 ; case 178
	b _02330134 ; case 179
	b _02330134 ; case 180
	b ov29_02330BDC ; case 181
	b _02330134 ; case 182
	b ov29_02331F18 ; case 183
	b ov29_02332068 ; case 184
	b ov29_02331C1C ; case 185
	b ov29_02330C68 ; case 186
	b ov29_02331648 ; case 187
	b ov29_02330760 ; case 188
	b _02330134 ; case 189
	b _02330134 ; case 190
	b _02330A00 ; case 191
	b ov29_02330A38 ; case 192
	b ov29_02330A70 ; case 193
	b ov29_023309C8 ; case 194
	b _02330BA4 ; case 195
	b ov29_02330A1C ; case 196
	b ov29_02331514 ; case 197
	b ov29_02330F24 ; case 198
	b ov29_02330A1C ; case 199
	b ov29_023304D8 ; case 200
	b _02330134 ; case 201
	b ov29_02330C68 ; case 202
	b ov29_02330DF0 ; case 203
	b ov29_023318CC ; case 204
	b ov29_02331728 ; case 205
	b ov29_023311E0 ; case 206
	b ov29_0233085C ; case 207
	b _02330134 ; case 208
	b ov29_023310C8 ; case 209
	b ov29_02330E44 ; case 210
	b _02330134 ; case 211
	b ov29_023312E4 ; case 212
	b ov29_023314C0 ; case 213
	b ov29_02331100 ; case 214
	b ov29_02330C30 ; case 215
	b ov29_02330D9C ; case 216
	b ov29_02330D2C ; case 217
	b ov29_02331090 ; case 218
	b ov29_023304A0 ; case 219
	b ov29_02331EE0 ; case 220
	b _023307B4 ; case 221
	b _02330134 ; case 222
	b ov29_02331BAC ; case 223
	b ov29_0233131C ; case 224
	b ov29_02331488 ; case 225
	b ov29_023308E8 ; case 226
	b ov29_023311A8 ; case 227
	b ov29_02331BC8 ; case 228
	b ov29_0233185C ; case 229
	b _0233030C ; case 230
	b _02330974 ; case 231
	b ov29_02331074 ; case 232
	b ov29_02331354 ; case 233
	b ov29_023306B8 ; case 234
	b ov29_0233077C ; case 235
	b ov29_02331A94 ; case 236
	b ov29_023311C4 ; case 237
	b ov29_02330344 ; case 238
	b ov29_02330344 ; case 239
	b _02330134 ; case 240
	b _02330134 ; case 241
	b ov29_02330344 ; case 242
	b ov29_02330A8C ; case 243
	b ov29_02330624 ; case 244
	b ov29_02331A78 ; case 245
	b ov29_02330AC4 ; case 246
	b ov29_02330430 ; case 247
	b _02330134 ; case 248
	b ov29_023317B4 ; case 249
	b _02330134 ; case 250
	b _0233037C ; case 251
	b ov29_023315D8 ; case 252
	b ov29_02330ED0 ; case 253
	b ov29_02331D50 ; case 254
	b ov29_02330680 ; case 255
	b ov29_02331878 ; case 256
	b ov29_02331C38 ; case 257
	b ov29_02330C68 ; case 258
	b ov29_02330FCC ; case 259
	b _02330134 ; case 260
	b ov29_02330798 ; case 261
	b _0233030C ; case 262
	b ov29_02331E4C ; case 263
	b ov29_02330840 ; case 264
	b ov29_02330B88 ; case 265
	b ov29_02331DDC ; case 266
	b ov29_02330D48 ; case 267
	b ov29_02330AFC ; case 268
	b ov29_02331DA4 ; case 269
	b ov29_02330328 ; case 270
	b _023307B4 ; case 271
	b ov29_02331204 ; case 272
	b ov29_023314DC ; case 273
	b _02330A00 ; case 274
	b ov29_0233070C ; case 275
	b ov29_02330894 ; case 276
	b ov29_02330F40 ; case 277
	b ov29_02331A08 ; case 278
	b ov29_023304D8 ; case 279
	b ov29_023304D8 ; case 280
	b ov29_02330A54 ; case 281
	b ov29_02331CE0 ; case 282
	b ov29_02330648 ; case 283
	b ov29_02330AFC ; case 284
	b _02330134 ; case 285
	b ov29_02331F88 ; case 286
	b ov29_02331100 ; case 287
	b ov29_02330B34 ; case 288
	b ov29_02330798 ; case 289
	b _02330134 ; case 290
	b ov29_02330468 ; case 291
	b _0233030C ; case 292
	b ov29_02331B20 ; case 293
	b ov29_02330EEC ; case 294
	b ov29_023313A8 ; case 295
	b ov29_02331450 ; case 296
	b _02330134 ; case 297
	b ov29_02331274 ; case 298
	b ov29_02330AA8 ; case 299
	b _02330134 ; case 300
	b ov29_023318F0 ; case 301
	b ov29_02330C4C ; case 302
	b _023307B4 ; case 303
	b ov29_023318B0 ; case 304
	b ov29_023318F0 ; case 305
	b _02330134 ; case 306
	b ov29_023312E4 ; case 307
	b _02330134 ; case 308
	b ov29_023306D4 ; case 309
	b ov29_02330840 ; case 310
	b _02330134 ; case 311
	b _02330134 ; case 312
	b ov29_02331B58 ; case 313
	b ov29_02331584 ; case 314
	b _02331D34 ; case 315
	b ov29_02331B04 ; case 316
	b ov29_02331878 ; case 317
	b ov29_02331020 ; case 318
	b ov29_02330BF8 ; case 319
	b ov29_02330DB8 ; case 320
	b _02330134 ; case 321
	b _02330134 ; case 322
	b _02330134 ; case 323
	b ov29_02331220 ; case 324
	b ov29_02330600 ; case 325
	b ov29_023308B0 ; case 326
	b ov29_023320BC ; case 327
	b ov29_02331FA4 ; case 328
	b ov29_0233138C ; case 329
	b ov29_02332030 ; case 330
	b ov01_023315F4 ; case 331
	b ov29_023305A4 ; case 332
	b _02330BA4 ; case 333
	b ov29_02331F6C ; case 334
	b ov29_023306F0 ; case 335
	b _0233037C ; case 336
	b ov29_02331FF8 ; case 337
	b ov29_02330F5C ; case 338
	b _023313C4 ; case 339
	b _02331154 ; case 340
	b ov29_02330920 ; case 341
	b ov29_0233077C ; case 342
	b ov29_02330B6C ; case 343
	b ov29_02330328 ; case 344
	b ov29_02330328 ; case 345
	b _02330134 ; case 346
	b _02330134 ; case 347
	b ov29_0233146C ; case 348
	b ov29_023316D4 ; case 349
	b _02330134 ; case 350
	b ov29_02330D10 ; case 351
	b ov29_023302D4 ; case 352
	b _02330134 ; case 353
	b ov29_02330DF0 ; case 354
	b ov29_02330150 ; case 355
	b _023326C8 ; case 356
	b ov29_02331170 ; case 357
	b ov29_02331170 ; case 358
	b ov29_02331170 ; case 359
	b _02330134 ; case 360
	b _02331CC4 ; case 361
	b _02330134 ; case 362
	b ov29_02331A40 ; case 363
	b ov01_023310E4 ; case 364
	b ov29_02331DC0 ; case 365
	b _02330134 ; case 366
	b ov29_023315D8 ; case 367
	b ov29_02330AFC ; case 368
	b ov29_02331648 ; case 369
	b ov29_02331D6C ; case 370
	b ov29_02330EB4 ; case 371
	b ov29_0233111C ; case 372
	b ov29_02331610 ; case 373
	b ov29_02331840 ; case 374
	b ov29_02331D88 ; case 375
	b ov29_02332084 ; case 376
	b ov29_023320A0 ; case 377
	b ov29_02331F34 ; case 378
	b ov29_02331DDC ; case 379
	b ov29_023318B0 ; case 380
	b ov29_02331418 ; case 381
	b _02330A00 ; case 382
	b ov29_023315A0 ; case 383
	b ov29_02332014 ; case 384
	b ov29_02331E30 ; case 385
	b ov29_023310AC ; case 386
	b ov29_023313FC ; case 387
	b ov29_02331664 ; case 388
	b ov29_023317D0 ; case 389
	b ov29_02331DF8 ; case 390
	b ov29_02331AE8 ; case 391
	b ov29_0233044C ; case 392
	b ov29_0233204C ; case 393
	b ov29_023312C8 ; case 394
	b ov29_02331E14 ; case 395
	b ov29_02331894 ; case 396
	b ov29_023320F4 ; case 397
	b ov29_02331C54 ; case 398
	b ov29_02331BE4 ; case 399
	b ov29_0233162C ; case 400
	b ov29_0233118C ; case 401
	b _023326C8 ; case 402
	b ov29_02331E84 ; case 403
	b _023326C8 ; case 404
	b _023326C8 ; case 405
	b _023320D8 ; case 406
	b ov29_02331D18 ; case 407
	b _023326C8 ; case 408
	b ov29_02331680 ; case 409
	b ov29_023317EC ; case 410
	b _023326C8 ; case 411
	b ov29_02331808 ; case 412
	b _023326C8 ; case 413
	b _023326C8 ; case 414
	b _023326C8 ; case 415
	b _023326C8 ; case 416
	b _023326C8 ; case 417
	b _023326C8 ; case 418
	b _023326C8 ; case 419
	b _023326C8 ; case 420
	b ov29_02332674 ; case 421
	b ov29_02332690 ; case 422
	b ov29_023326AC ; case 423
	b ov29_02331648 ; case 424
	b ov29_02331840 ; case 425
	b ov29_0233111C ; case 426
	b ov29_02332658 ; case 427
	b ov29_02330360 ; case 428
	b ov29_02331DDC ; case 429
	b ov29_02332110 ; case 430
	b _023307EC ; case 431
	b _02330134 ; case 432
	b _02330134 ; case 433
	b ov29_0233212C ; case 434
	b _02330134 ; case 435
	b _023307EC ; case 436
	b ov29_0233069C ; case 437
	b ov29_02332148 ; case 438
	b ov29_02332164 ; case 439
	b ov29_02332180 ; case 440
	b ov29_02330DF0 ; case 441
	b _023307EC ; case 442
	b ov29_023306F0 ; case 443
	b ov29_0233111C ; case 444
	b _02330134 ; case 445
	b ov29_023306B8 ; case 446
	b ov29_0233219C ; case 447
	b ov29_023321B8 ; case 448
	b ov29_023321D4 ; case 449
	b ov29_023321F0 ; case 450
	b _02330134 ; case 451
	b ov29_0233220C ; case 452
	b ov29_02330344 ; case 453
	b ov29_023306F0 ; case 454
	b ov29_02330344 ; case 455
	b ov29_02332228 ; case 456
	b ov29_02332244 ; case 457
	b ov29_023319D0 ; case 458
	b ov29_02330728 ; case 459
	b _02330134 ; case 460
	b ov29_02332260 ; case 461
	b _02330134 ; case 462
	b _02330134 ; case 463
	b ov29_0233227C ; case 464
	b _023326C8 ; case 465
	b ov29_02332298 ; case 466
	b _02330134 ; case 467
	b ov29_023305D0 ; case 468
	b ov29_023322D0 ; case 469
	b _02330134 ; case 470
	b ov29_023322EC ; case 471
	b _02331138 ; case 472
	b _023307EC ; case 473
	b ov29_02332458 ; case 474
	b ov29_02332308 ; case 475
	b _02330134 ; case 476
	b ov29_02332324 ; case 477
	b ov29_02332340 ; case 478
	b _02330134 ; case 479
	b ov29_0233235C ; case 480
	b _02330134 ; case 481
	b ov29_023310C8 ; case 482
	b _02330974 ; case 483
	b ov29_02330520 ; case 484
	b ov29_02330728 ; case 485
	b _02330134 ; case 486
	b _02330134 ; case 487
	b ov29_023322D0 ; case 488
	b ov29_02332378 ; case 489
	b ov29_02332394 ; case 490
	b _02330134 ; case 491
	b ov29_023323B0 ; case 492
	b ov29_023323CC ; case 493
	b ov29_02330344 ; case 494
	b ov29_02330728 ; case 495
	b ov29_023323E8 ; case 496
	b ov29_02332420 ; case 497
	b _023307EC ; case 498
	b ov29_02332404 ; case 499
	b ov29_02330DB8 ; case 500
	b ov29_02330CA0 ; case 501
	b _02330134 ; case 502
	b _023320D8 ; case 503
	b ov29_0233243C ; case 504
	b ov29_02332458 ; case 505
	b ov29_02332474 ; case 506
	b _02330958 ; case 507
	b _02330134 ; case 508
	b ov29_02332490 ; case 509
	b _02330134 ; case 510
	b _02330134 ; case 511
	b _02330134 ; case 512
	b ov29_023324AC ; case 513
	b ov29_023324C8 ; case 514
	b _02330134 ; case 515
	b ov29_023324E4 ; case 516
	b ov29_02332500 ; case 517
	b ov29_02330DF0 ; case 518
	b _023302F0 ; case 519
	b ov29_0233251C ; case 520
	b _02330958 ; case 521
	b ov29_023322B4 ; case 522
	b _02330134 ; case 523
	b ov29_02330468 ; case 524
	b ov29_023320BC ; case 525
	b ov29_02332538 ; case 526
	b ov29_02330CA0 ; case 527
	b ov29_02332554 ; case 528
	b ov29_02332394 ; case 529
	b ov29_0233054C ; case 530
	b ov29_02332570 ; case 531
	b ov29_0233258C ; case 532
	b ov29_023325A8 ; case 533
	b ov29_023325C4 ; case 534
	b _02331154 ; case 535
	b ov29_02330578 ; case 536
	b ov29_023325E0 ; case 537
	b ov29_023325FC ; case 538
	b _02330134 ; case 539
	b ov29_02332620 ; case 540
	b ov29_023306B8 ; case 541
	b ov29_0233263C ; case 542
_02330134:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325DC0
	mov sl, r0
	b _023326CC
	arm_func_end ExecuteMoveEffect

	arm_func_start ov29_02330150
ov29_02330150: ; 0x02330150
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
	bl ov29_02324E44
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	add r3, sp, #0xdc
	bl CalcDamageFinal
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
	bl ov29_02324E44
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	add r3, sp, #0xc8
	bl CalcDamageFinal
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and sl, r0, #0xff
	b _023326CC
	arm_func_end ov29_02330150

	arm_func_start ov29_02330280
ov29_02330280: ; 0x02330280
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328F94
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330280

	arm_func_start ov29_0233029C
ov29_0233029C: ; 0x0233029C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328074
	mov sl, r0
	b _023326CC
_023302B8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326E20
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233029C

	arm_func_start ov29_023302D4
ov29_023302D4: ; 0x023302D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C1A4
	mov sl, r0
	b _023326CC
_023302F0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326CC8
	mov sl, r0
	b _023326CC
_0233030C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326D50
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023302D4

	arm_func_start ov29_02330328
ov29_02330328: ; 0x02330328
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327AF4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330328

	arm_func_start ov29_02330344
ov29_02330344: ; 0x02330344
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A500
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330344

	arm_func_start ov29_02330360
ov29_02330360: ; 0x02330360
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023268BC
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
	bl ov29_02324E44
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	add r3, sp, #0xb4
	bl CalcDamageFinal
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and sl, r0, #0xff
	b _023326CC
	arm_func_end ov29_02330360

	arm_func_start ov29_02330414
ov29_02330414: ; 0x02330414
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023283A4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330414

	arm_func_start ov29_02330430
ov29_02330430: ; 0x02330430
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328B88
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330430

	arm_func_start ov29_0233044C
ov29_0233044C: ; 0x0233044C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CDA4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233044C

	arm_func_start ov29_02330468
ov29_02330468: ; 0x02330468
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B5E8
	mov sl, r0
	b _023326CC
_02330484:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326750
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330468

	arm_func_start ov29_023304A0
ov29_023304A0: ; 0x023304A0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A148
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023304A0

	arm_func_start ov29_023304BC
ov29_023304BC: ; 0x023304BC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327744
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023304BC

	arm_func_start ov29_023304D8
ov29_023304D8: ; 0x023304D8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329904
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023304D8

	arm_func_start ov29_023304F4
ov29_023304F4: ; 0x023304F4
	str r1, [sp]
	ldr r0, [sp, #0x28]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_02327CD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023304F4

	arm_func_start ov29_02330520
ov29_02330520: ; 0x02330520
	str r1, [sp]
	ldr r0, [sp, #0x24]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_02327CD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330520

	arm_func_start ov29_0233054C
ov29_0233054C: ; 0x0233054C
	str r1, [sp]
	ldr r0, [sp, #0x20]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_02327CD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233054C

	arm_func_start ov29_02330578
ov29_02330578: ; 0x02330578
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_02327CD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330578

	arm_func_start ov29_023305A4
ov29_023305A4: ; 0x023305A4
	str r1, [sp]
	ldr r0, [sp, #0x28]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_02327CD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023305A4

	arm_func_start ov29_023305D0
ov29_023305D0: ; 0x023305D0
	mov r0, #2
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r3, sp, #0x9c
	stmib sp, {r0, r7}
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_02327CD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023305D0

	arm_func_start ov29_02330600
ov29_02330600: ; 0x02330600
	add r3, sp, #0xa0
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	str r7, [sp]
	bl ov29_0232B940
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330600

	arm_func_start ov29_02330624
ov29_02330624: ; 0x02330624
	add r3, sp, #0xa0
	ldr r3, [r3]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	str r7, [sp]
	bl ov29_0232A5AC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330624

	arm_func_start ov29_02330648
ov29_02330648: ; 0x02330648
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B494
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330648

	arm_func_start ov29_02330664
ov29_02330664: ; 0x02330664
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023290CC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330664

	arm_func_start ov29_02330680
ov29_02330680: ; 0x02330680
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232728C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330680

	arm_func_start ov29_0233069C
ov29_0233069C: ; 0x0233069C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327804
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233069C

	arm_func_start ov29_023306B8
ov29_023306B8: ; 0x023306B8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327C08
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023306B8

	arm_func_start ov29_023306D4
ov29_023306D4: ; 0x023306D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B820
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023306D4

	arm_func_start ov29_023306F0
ov29_023306F0: ; 0x023306F0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C0F4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023306F0

	arm_func_start ov29_0233070C
ov29_0233070C: ; 0x0233070C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B164
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233070C

	arm_func_start ov29_02330728
ov29_02330728: ; 0x02330728
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328A74
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330728

	arm_func_start ov29_02330744
ov29_02330744: ; 0x02330744
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328B00
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330744

	arm_func_start ov29_02330760
ov29_02330760: ; 0x02330760
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329710
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330760

	arm_func_start ov29_0233077C
ov29_0233077C: ; 0x0233077C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232816C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233077C

	arm_func_start ov29_02330798
ov29_02330798: ; 0x02330798
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023284BC
	mov sl, r0
	b _023326CC
_023307B4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023270B4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330798

	arm_func_start ov29_023307D0
ov29_023307D0: ; 0x023307D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023288C4
	mov sl, r0
	b _023326CC
_023307EC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326670
	mov sl, r0
	b _023326CC
_02330808:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327034
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023307D0

	arm_func_start ov29_02330824
ov29_02330824: ; 0x02330824
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328248
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330824

	arm_func_start ov29_02330840
ov29_02330840: ; 0x02330840
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AEF0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330840

	arm_func_start ov29_0233085C
ov29_0233085C: ; 0x0233085C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329C94
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233085C

	arm_func_start ov29_02330878
ov29_02330878: ; 0x02330878
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327B5C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330878

	arm_func_start ov29_02330894
ov29_02330894: ; 0x02330894
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B1E4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330894

	arm_func_start ov29_023308B0
ov29_023308B0: ; 0x023308B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B9D0
	mov sl, r0
	b _023326CC
_023308CC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326E80
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023308B0

	arm_func_start ov29_023308E8
ov29_023308E8: ; 0x023308E8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A2BC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023308E8

	arm_func_start ov29_02330904
ov29_02330904: ; 0x02330904
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328D44
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330904

	arm_func_start ov29_02330920
ov29_02330920: ; 0x02330920
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BF88
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330920

	arm_func_start ov29_0233093C
ov29_0233093C: ; 0x0233093C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328230
	mov sl, r0
	b _023326CC
_02330958:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327120
	mov sl, r0
	b _023326CC
_02330974:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325F00
	mov sl, r0
	b _023326CC
_02330990:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325EC4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233093C

	arm_func_start ov29_023309AC
ov29_023309AC: ; 0x023309AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328328
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023309AC

	arm_func_start ov29_023309C8
ov29_023309C8: ; 0x023309C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329854
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023309C8

	arm_func_start ov29_023309E4
ov29_023309E4: ; 0x023309E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329438
	mov sl, r0
	b _023326CC
_02330A00:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023293CC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023309E4

	arm_func_start ov29_02330A1C
ov29_02330A1C: ; 0x02330A1C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329868
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330A1C

	arm_func_start ov29_02330A38
ov29_02330A38: ; 0x02330A38
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232977C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330A38

	arm_func_start ov29_02330A54
ov29_02330A54: ; 0x02330A54
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B434
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330A54

	arm_func_start ov29_02330A70
ov29_02330A70: ; 0x02330A70
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023297F0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330A70

	arm_func_start ov29_02330A8C
ov29_02330A8C: ; 0x02330A8C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A524
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330A8C

	arm_func_start ov29_02330AA8
ov29_02330AA8: ; 0x02330AA8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327368
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330AA8

	arm_func_start ov29_02330AC4
ov29_02330AC4: ; 0x02330AC4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A688
	mov sl, r0
	b _023326CC
_02330AE0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023267D8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330AC4

	arm_func_start ov29_02330AFC
ov29_02330AFC: ; 0x02330AFC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B500
	mov sl, r0
	b _023326CC
_02330B18:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232631C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330AFC

	arm_func_start ov29_02330B34
ov29_02330B34: ; 0x02330B34
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B5C8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330B34

	arm_func_start ov29_02330B50
ov29_02330B50: ; 0x02330B50
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232923C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330B50

	arm_func_start ov29_02330B6C
ov29_02330B6C: ; 0x02330B6C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C028
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330B6C

	arm_func_start ov29_02330B88
ov29_02330B88: ; 0x02330B88
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AF5C
	mov sl, r0
	b _023326CC
_02330BA4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326E98
	mov sl, r0
	b _023326CC
_02330BC0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326220
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330B88

	arm_func_start ov29_02330BDC
ov29_02330BDC: ; 0x02330BDC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329534
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330BDC

	arm_func_start ov29_02330BF8
ov29_02330BF8: ; 0x02330BF8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B8E4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330BF8

	arm_func_start ov29_02330C14
ov29_02330C14: ; 0x02330C14
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328AE0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330C14

	arm_func_start ov29_02330C30
ov29_02330C30: ; 0x02330C30
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A058
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330C30

	arm_func_start ov29_02330C4C
ov29_02330C4C: ; 0x02330C4C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B7E0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330C4C

	arm_func_start ov29_02330C68
ov29_02330C68: ; 0x02330C68
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023296D8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330C68

	arm_func_start ov29_02330C84
ov29_02330C84: ; 0x02330C84
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023279E4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330C84

	arm_func_start ov29_02330CA0
ov29_02330CA0: ; 0x02330CA0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329000
	mov sl, r0
	b _023326CC
_02330CBC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326A74
	mov sl, r0
	b _023326CC
_02330CD8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326990
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330CA0

	arm_func_start ov29_02330CF4
ov29_02330CF4: ; 0x02330CF4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327D60
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330CF4

	arm_func_start ov29_02330D10
ov29_02330D10: ; 0x02330D10
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327BF0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330D10

	arm_func_start ov29_02330D2C
ov29_02330D2C: ; 0x02330D2C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A118
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330D2C

	arm_func_start ov29_02330D48
ov29_02330D48: ; 0x02330D48
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AFF0
	mov sl, r0
	b _023326CC
_02330D64:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326648
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330D48

	arm_func_start ov29_02330D80
ov29_02330D80: ; 0x02330D80
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329258
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330D80

	arm_func_start ov29_02330D9C
ov29_02330D9C: ; 0x02330D9C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov01_0232A078
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330D9C

	arm_func_start ov29_02330DB8
ov29_02330DB8: ; 0x02330DB8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327458
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330DB8

	arm_func_start ov29_02330DD4
ov29_02330DD4: ; 0x02330DD4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328930
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330DD4

	arm_func_start ov29_02330DF0
ov29_02330DF0: ; 0x02330DF0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl DealDamageWithRecoil
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330DF0

	arm_func_start ov29_02330E0C
ov29_02330E0C: ; 0x02330E0C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328538
	mov sl, r0
	b _023326CC
_02330E28:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326568
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330E0C

	arm_func_start ov29_02330E44
ov29_02330E44: ; 0x02330E44
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329F78
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330E44

	arm_func_start ov29_02330E60
ov29_02330E60: ; 0x02330E60
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232915C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330E60

	arm_func_start ov29_02330E7C
ov29_02330E7C: ; 0x02330E7C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328C74
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330E7C

	arm_func_start ov29_02330E98
ov29_02330E98: ; 0x02330E98
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327A28
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330E98

	arm_func_start ov29_02330EB4
ov29_02330EB4: ; 0x02330EB4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CA14
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330EB4

	arm_func_start ov29_02330ED0
ov29_02330ED0: ; 0x02330ED0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232776C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330ED0

	arm_func_start ov29_02330EEC
ov29_02330EEC: ; 0x02330EEC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B6B8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330EEC

	arm_func_start ov29_02330F08
ov29_02330F08: ; 0x02330F08
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327DD0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330F08

	arm_func_start ov29_02330F24
ov29_02330F24: ; 0x02330F24
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329898
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330F24

	arm_func_start ov29_02330F40
ov29_02330F40: ; 0x02330F40
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B26C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330F40

	arm_func_start ov29_02330F5C
ov29_02330F5C: ; 0x02330F5C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BF78
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330F5C

	arm_func_start ov29_02330F78
ov29_02330F78: ; 0x02330F78
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023289F8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330F78

	arm_func_start ov29_02330F94
ov29_02330F94: ; 0x02330F94
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328528
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330F94

	arm_func_start ov29_02330FB0
ov29_02330FB0: ; 0x02330FB0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328394
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330FB0

	arm_func_start ov29_02330FCC
ov29_02330FCC: ; 0x02330FCC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AD08
	mov sl, r0
	b _023326CC
_02330FE8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325E64
	mov sl, r0
	b _023326CC
_02331004:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326A0C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02330FCC

	arm_func_start ov29_02331020
ov29_02331020: ; 0x02331020
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023291F4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331020

	arm_func_start ov29_0233103C
ov29_0233103C: ; 0x0233103C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023278E8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233103C

	arm_func_start ov29_02331058
ov29_02331058: ; 0x02331058
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023293F8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331058

	arm_func_start ov29_02331074
ov29_02331074: ; 0x02331074
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A414
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331074

	arm_func_start ov29_02331090
ov29_02331090: ; 0x02331090
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328030
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331090

	arm_func_start ov29_023310AC
ov29_023310AC: ; 0x023310AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C82C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023310AC

	arm_func_start ov29_023310C8
ov29_023310C8: ; 0x023310C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329D50
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023310C8

	arm_func_start ov29_023310E4
ov29_023310E4: ; 0x023310E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C310
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023310E4

	arm_func_start ov29_02331100
ov29_02331100: ; 0x02331100
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A04C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331100

	arm_func_start ov29_0233111C
ov29_0233111C: ; 0x0233111C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327928
	mov sl, r0
	b _023326CC
_02331138:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326CB4
	mov sl, r0
	b _023326CC
_02331154:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326F48
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233111C

	arm_func_start ov29_02331170
ov29_02331170: ; 0x02331170
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326F8C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331170

	arm_func_start ov29_0233118C
ov29_0233118C: ; 0x0233118C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D0F0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233118C

	arm_func_start ov29_023311A8
ov29_023311A8: ; 0x023311A8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A328
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023311A8

	arm_func_start ov29_023311C4
ov29_023311C4: ; 0x023311C4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A4E8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023311C4

	arm_func_start ov29_023311E0
ov29_023311E0: ; 0x023311E0
	mov r0, #0
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329B68
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023311E0

	arm_func_start ov29_02331204
ov29_02331204: ; 0x02331204
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B118
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331204

	arm_func_start ov29_02331220
ov29_02331220: ; 0x02331220
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B928
	mov sl, r0
	b _023326CC
_0233123C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326EB8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331220

	arm_func_start ov29_02331258
ov29_02331258: ; 0x02331258
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023273CC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331258

	arm_func_start ov29_02331274
ov29_02331274: ; 0x02331274
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B7C0
	mov sl, r0
	b _023326CC
_02331290:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325F3C
	mov sl, r0
	b _023326CC
_023312AC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325F74
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331274

	arm_func_start ov29_023312C8
ov29_023312C8: ; 0x023312C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CE50
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023312C8

	arm_func_start ov29_023312E4
ov29_023312E4: ; 0x023312E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329FB4
	mov sl, r0
	b _023326CC
_02331300:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325DE4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023312E4

	arm_func_start ov29_0233131C
ov29_0233131C: ; 0x0233131C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A27C
	mov sl, r0
	b _023326CC
_02331338:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326B24
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233131C

	arm_func_start ov29_02331354
ov29_02331354: ; 0x02331354
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A480
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331354

	arm_func_start ov29_02331370
ov29_02331370: ; 0x02331370
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327C74
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331370

	arm_func_start ov29_0233138C
ov29_0233138C: ; 0x0233138C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BC34
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233138C

	arm_func_start ov29_023313A8
ov29_023313A8: ; 0x023313A8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B6C8
	mov sl, r0
	b _023326CC
_023313C4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326188
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023313A8

	arm_func_start ov29_023313E0
ov29_023313E0: ; 0x023313E0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327758
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023313E0

	arm_func_start ov29_023313FC
ov29_023313FC: ; 0x023313FC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C83C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023313FC

	arm_func_start ov29_02331418
ov29_02331418: ; 0x02331418
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C6B4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331418

	arm_func_start ov29_02331434
ov29_02331434: ; 0x02331434
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232764C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331434

	arm_func_start ov29_02331450
ov29_02331450: ; 0x02331450
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B738
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331450

	arm_func_start ov29_0233146C
ov29_0233146C: ; 0x0233146C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C064
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233146C

	arm_func_start ov29_02331488
ov29_02331488: ; 0x02331488
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A2AC
	mov sl, r0
	b _023326CC
_023314A4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326AE8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331488

	arm_func_start ov29_023314C0
ov29_023314C0: ; 0x023314C0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329FE0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023314C0

	arm_func_start ov29_023314DC
ov29_023314DC: ; 0x023314DC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328A54
	mov sl, r0
	b _023326CC
_023314F8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232692C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023314DC

	arm_func_start ov29_02331514
ov29_02331514: ; 0x02331514
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329880
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331514

	arm_func_start ov29_02331530
ov29_02331530: ; 0x02331530
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023276B4
	mov sl, r0
	b _023326CC
_0233154C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326408
	mov sl, r0
	b _023326CC
_02331568:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326264
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331530

	arm_func_start ov29_02331584
ov29_02331584: ; 0x02331584
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B8B0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331584

	arm_func_start ov29_023315A0
ov29_023315A0: ; 0x023315A0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C6F0
	mov sl, r0
	b _023326CC
_023315BC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232718C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023315A0

	arm_func_start ov29_023315D8
ov29_023315D8: ; 0x023315D8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C538
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023315D8

	arm_func_start ov29_023315F4
ov29_023315F4: ; 0x023315F4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BCC4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023315F4

	arm_func_start ov29_02331610
ov29_02331610: ; 0x02331610
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CA2C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331610

	arm_func_start ov29_0233162C
ov29_0233162C: ; 0x0233162C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CF84
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233162C

	arm_func_start ov29_02331648
ov29_02331648: ; 0x02331648
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023296F8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331648

	arm_func_start ov29_02331664
ov29_02331664: ; 0x02331664
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CB08
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331664

	arm_func_start ov29_02331680
ov29_02331680: ; 0x02331680
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D1FC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331680

	arm_func_start ov29_0233169C
ov29_0233169C: ; 0x0233169C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023272F8
	mov sl, r0
	b _023326CC
_023316B8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326E60
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233169C

	arm_func_start ov29_023316D4
ov29_023316D4: ; 0x023316D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023279AC
	mov sl, r0
	b _023326CC
_023316F0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325FB4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023316D4

	arm_func_start ov29_0233170C
ov29_0233170C: ; 0x0233170C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328DE4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233170C

	arm_func_start ov29_02331728
ov29_02331728: ; 0x02331728
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329A9C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331728

	arm_func_start ov29_02331744
ov29_02331744: ; 0x02331744
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328ECC
	mov sl, r0
	b _023326CC
_02331760:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02325FC4
	mov sl, r0
	b _023326CC
_0233177C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326088
	mov sl, r0
	b _023326CC
_02331798:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326E04
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331744

	arm_func_start ov29_023317B4
ov29_023317B4: ; 0x023317B4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A6EC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023317B4

	arm_func_start ov29_023317D0
ov29_023317D0: ; 0x023317D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CB18
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023317D0

	arm_func_start ov29_023317EC
ov29_023317EC: ; 0x023317EC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D20C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023317EC

	arm_func_start ov29_02331808
ov29_02331808: ; 0x02331808
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D21C
	mov sl, r0
	b _023326CC
_02331824:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326CA4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331808

	arm_func_start ov29_02331840
ov29_02331840: ; 0x02331840
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CA3C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331840

	arm_func_start ov29_0233185C
ov29_0233185C: ; 0x0233185C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A3FC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233185C

	arm_func_start ov29_02331878
ov29_02331878: ; 0x02331878
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AC44
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331878

	arm_func_start ov29_02331894
ov29_02331894: ; 0x02331894
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CE94
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331894

	arm_func_start ov29_023318B0
ov29_023318B0: ; 0x023318B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B800
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023318B0

	arm_func_start ov29_023318CC
ov29_023318CC: ; 0x023318CC
	mov r0, #0
	str r0, [sp]
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329970
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023318CC

	arm_func_start ov29_023318F0
ov29_023318F0: ; 0x023318F0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B7D0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023318F0

	arm_func_start ov29_0233190C
ov29_0233190C: ; 0x0233190C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023293E4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233190C

	arm_func_start ov29_02331928
ov29_02331928: ; 0x02331928
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023276E8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331928

	arm_func_start ov29_02331944
ov29_02331944: ; 0x02331944
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327598
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331944

	arm_func_start ov29_02331960
ov29_02331960: ; 0x02331960
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023281D8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331960

	arm_func_start ov29_0233197C
ov29_0233197C: ; 0x0233197C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328E74
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233197C

	arm_func_start ov29_02331998
ov29_02331998: ; 0x02331998
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023282C8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331998

	arm_func_start ov29_023319B4
ov29_023319B4: ; 0x023319B4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232724C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023319B4

	arm_func_start ov29_023319D0
ov29_023319D0: ; 0x023319D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023277B8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023319D0

	arm_func_start ov29_023319EC
ov29_023319EC: ; 0x023319EC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327DE0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023319EC

	arm_func_start ov29_02331A08
ov29_02331A08: ; 0x02331A08
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B368
	mov sl, r0
	b _023326CC
_02331A24:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023268CC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331A08

	arm_func_start ov29_02331A40
ov29_02331A40: ; 0x02331A40
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C300
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331A40

	arm_func_start ov29_02331A5C
ov29_02331A5C: ; 0x02331A5C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329074
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331A5C

	arm_func_start ov29_02331A78
ov29_02331A78: ; 0x02331A78
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A640
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331A78

	arm_func_start ov29_02331A94
ov29_02331A94: ; 0x02331A94
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A490
	mov sl, r0
	b _023326CC
_02331AB0:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023260D0
	mov sl, r0
	b _023326CC
_02331ACC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232680C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331A94

	arm_func_start ov29_02331AE8
ov29_02331AE8: ; 0x02331AE8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CD90
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331AE8

	arm_func_start ov29_02331B04
ov29_02331B04: ; 0x02331B04
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B8D4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331B04

	arm_func_start ov29_02331B20
ov29_02331B20: ; 0x02331B20
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B6A4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331B20

	arm_func_start ov29_02331B3C
ov29_02331B3C: ; 0x02331B3C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327940
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331B3C

	arm_func_start ov29_02331B58
ov29_02331B58: ; 0x02331B58
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B8A0
	mov sl, r0
	b _023326CC
_02331B74:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232620C
	mov sl, r0
	b _023326CC
_02331B90:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023266DC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331B58

	arm_func_start ov29_02331BAC
ov29_02331BAC: ; 0x02331BAC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A220
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331BAC

	arm_func_start ov29_02331BC8
ov29_02331BC8: ; 0x02331BC8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A340
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331BC8

	arm_func_start ov29_02331BE4
ov29_02331BE4: ; 0x02331BE4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CF74
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331BE4

	arm_func_start ov29_02331C00
ov29_02331C00: ; 0x02331C00
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327BE0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331C00

	arm_func_start ov29_02331C1C
ov29_02331C1C: ; 0x02331C1C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329674
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331C1C

	arm_func_start ov29_02331C38
ov29_02331C38: ; 0x02331C38
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AC54
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331C38

	arm_func_start ov29_02331C54
ov29_02331C54: ; 0x02331C54
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CF54
	mov sl, r0
	b _023326CC
_02331C70:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023260A8
	mov sl, r0
	b _023326CC
_02331C8C:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023261A0
	mov sl, r0
	b _023326CC
_02331CA8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326550
	mov sl, r0
	b _023326CC
_02331CC4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C27C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331C54

	arm_func_start ov29_02331CE0
ov29_02331CE0: ; 0x02331CE0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B44C
	mov sl, r0
	b _023326CC
_02331CFC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232612C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331CE0

	arm_func_start ov29_02331D18
ov29_02331D18: ; 0x02331D18
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D1EC
	mov sl, r0
	b _023326CC
_02331D34:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326DD8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331D18

	arm_func_start ov29_02331D50
ov29_02331D50: ; 0x02331D50
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A8EC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331D50

	arm_func_start ov29_02331D6C
ov29_02331D6C: ; 0x02331D6C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C84C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331D6C

	arm_func_start ov29_02331D88
ov29_02331D88: ; 0x02331D88
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C560
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331D88

	arm_func_start ov29_02331DA4
ov29_02331DA4: ; 0x02331DA4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B024
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331DA4

	arm_func_start ov29_02331DC0
ov29_02331DC0: ; 0x02331DC0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C524
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331DC0

	arm_func_start ov29_02331DDC
ov29_02331DDC: ; 0x02331DDC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AFA0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331DDC

	arm_func_start ov29_02331DF8
ov29_02331DF8: ; 0x02331DF8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CCC4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331DF8

	arm_func_start ov29_02331E14
ov29_02331E14: ; 0x02331E14
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CE7C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331E14

	arm_func_start ov29_02331E30
ov29_02331E30: ; 0x02331E30
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CA70
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331E30

	arm_func_start ov29_02331E4C
ov29_02331E4C: ; 0x02331E4C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232AD18
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331E4C

	arm_func_start ov29_02331E68
ov29_02331E68: ; 0x02331E68
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328110
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331E68

	arm_func_start ov29_02331E84
ov29_02331E84: ; 0x02331E84
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D148
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331E84

	arm_func_start ov29_02331EA0
ov29_02331EA0: ; 0x02331EA0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328794
	movs sl, r0
	movne r0, #1
	strne r0, [sp, #0x58]
	b _023326CC
_02331EC4:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326908
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331EA0

	arm_func_start ov29_02331EE0
ov29_02331EE0: ; 0x02331EE0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232A188
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331EE0

	arm_func_start ov29_02331EFC
ov29_02331EFC: ; 0x02331EFC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02328698
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331EFC

	arm_func_start ov29_02331F18
ov29_02331F18: ; 0x02331F18
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329554
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331F18

	arm_func_start ov29_02331F34
ov29_02331F34: ; 0x02331F34
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C578
	mov sl, r0
	b _023326CC
_02331F50:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02326BC0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331F34

	arm_func_start ov29_02331F6C
ov29_02331F6C: ; 0x02331F6C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BE34
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331F6C

	arm_func_start ov29_02331F88
ov29_02331F88: ; 0x02331F88
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232B518
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331F88

	arm_func_start ov29_02331FA4
ov29_02331FA4: ; 0x02331FA4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BB4C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331FA4

	arm_func_start ov29_02331FC0
ov29_02331FC0: ; 0x02331FC0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02327E94
	mov sl, r0
	b _023326CC
_02331FDC:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_023265A4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331FC0

	arm_func_start ov29_02331FF8
ov29_02331FF8: ; 0x02331FF8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BE44
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02331FF8

	arm_func_start ov29_02332014
ov29_02332014: ; 0x02332014
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232C818
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332014

	arm_func_start ov29_02332030
ov29_02332030: ; 0x02332030
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BC64
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332030

	arm_func_start ov29_0233204C
ov29_0233204C: ; 0x0233204C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CE40
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233204C

	arm_func_start ov29_02332068
ov29_02332068: ; 0x02332068
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_02329664
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332068

	arm_func_start ov29_02332084
ov29_02332084: ; 0x02332084
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CA4C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332084

	arm_func_start ov29_023320A0
ov29_023320A0: ; 0x023320A0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CA60
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023320A0

	arm_func_start ov29_023320BC
ov29_023320BC: ; 0x023320BC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232BA44
	mov sl, r0
	b _023326CC
_023320D8:
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D1DC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023320BC

	arm_func_start ov29_023320F4
ov29_023320F4: ; 0x023320F4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232CEAC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023320F4

	arm_func_start ov29_02332110
ov29_02332110: ; 0x02332110
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D22C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332110

	arm_func_start ov29_0233212C
ov29_0233212C: ; 0x0233212C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D270
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233212C

	arm_func_start ov29_02332148
ov29_02332148: ; 0x02332148
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D280
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332148

	arm_func_start ov29_02332164
ov29_02332164: ; 0x02332164
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D298
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332164

	arm_func_start ov29_02332180
ov29_02332180: ; 0x02332180
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D2E8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332180

	arm_func_start ov29_0233219C
ov29_0233219C: ; 0x0233219C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D368
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233219C

	arm_func_start ov29_023321B8
ov29_023321B8: ; 0x023321B8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D378
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023321B8

	arm_func_start ov29_023321D4
ov29_023321D4: ; 0x023321D4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D3D8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023321D4

	arm_func_start ov29_023321F0
ov29_023321F0: ; 0x023321F0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D400
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023321F0

	arm_func_start ov29_0233220C
ov29_0233220C: ; 0x0233220C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D418
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233220C

	arm_func_start ov29_02332228
ov29_02332228: ; 0x02332228
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D4AC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332228

	arm_func_start ov29_02332244
ov29_02332244: ; 0x02332244
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D560
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332244

	arm_func_start ov29_02332260
ov29_02332260: ; 0x02332260
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D620
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332260

	arm_func_start ov29_0233227C
ov29_0233227C: ; 0x0233227C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D6B0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233227C

	arm_func_start ov29_02332298
ov29_02332298: ; 0x02332298
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D6D0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332298

	arm_func_start ov29_023322B4
ov29_023322B4: ; 0x023322B4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E2B8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023322B4

	arm_func_start ov29_023322D0
ov29_023322D0: ; 0x023322D0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D6E8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023322D0

	arm_func_start ov29_023322EC
ov29_023322EC: ; 0x023322EC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D738
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023322EC

	arm_func_start ov29_02332308
ov29_02332308: ; 0x02332308
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D7F8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332308

	arm_func_start ov29_02332324
ov29_02332324: ; 0x02332324
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D860
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332324

	arm_func_start ov29_02332340
ov29_02332340: ; 0x02332340
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D8FC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332340

	arm_func_start ov29_0233235C
ov29_0233235C: ; 0x0233235C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D90C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233235C

	arm_func_start ov29_02332378
ov29_02332378: ; 0x02332378
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D97C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332378

	arm_func_start ov29_02332394
ov29_02332394: ; 0x02332394
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232D9E4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332394

	arm_func_start ov29_023323B0
ov29_023323B0: ; 0x023323B0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DAD0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023323B0

	arm_func_start ov29_023323CC
ov29_023323CC: ; 0x023323CC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DC54
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023323CC

	arm_func_start ov29_023323E8
ov29_023323E8: ; 0x023323E8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DC64
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023323E8

	arm_func_start ov29_02332404
ov29_02332404: ; 0x02332404
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DD78
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332404

	arm_func_start ov29_02332420
ov29_02332420: ; 0x02332420
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DCD4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332420

	arm_func_start ov29_0233243C
ov29_0233243C: ; 0x0233243C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DDAC
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233243C

	arm_func_start ov29_02332458
ov29_02332458: ; 0x02332458
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DE84
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332458

	arm_func_start ov29_02332474
ov29_02332474: ; 0x02332474
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DF38
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332474

	arm_func_start ov29_02332490
ov29_02332490: ; 0x02332490
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232DFC8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332490

	arm_func_start ov29_023324AC
ov29_023324AC: ; 0x023324AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E084
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023324AC

	arm_func_start ov29_023324C8
ov29_023324C8: ; 0x023324C8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E0E4
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023324C8

	arm_func_start ov29_023324E4
ov29_023324E4: ; 0x023324E4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E0F8
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023324E4

	arm_func_start ov29_02332500
ov29_02332500: ; 0x02332500
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E130
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332500

	arm_func_start ov29_0233251C
ov29_0233251C: ; 0x0233251C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E274
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233251C

	arm_func_start ov29_02332538
ov29_02332538: ; 0x02332538
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E368
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332538

	arm_func_start ov29_02332554
ov29_02332554: ; 0x02332554
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E3D0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332554

	arm_func_start ov29_02332570
ov29_02332570: ; 0x02332570
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E400
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332570

	arm_func_start ov29_0233258C
ov29_0233258C: ; 0x0233258C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E48C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233258C

	arm_func_start ov29_023325A8
ov29_023325A8: ; 0x023325A8
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E4A0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023325A8

	arm_func_start ov29_023325C4
ov29_023325C4: ; 0x023325C4
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E560
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023325C4

	arm_func_start ov29_023325E0
ov29_023325E0: ; 0x023325E0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E624
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023325E0

	arm_func_start ov29_023325FC
ov29_023325FC: ; 0x023325FC
	ldr r0, [sp, #0x78]
	mov r1, r4
	str r0, [sp]
	mov r0, sb
	mov r2, r8
	mov r3, r7
	bl ov29_0232E67C
	mov sl, r0
	b _023326CC
	arm_func_end ov29_023325FC

	arm_func_start ov29_02332620
ov29_02332620: ; 0x02332620
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E6E0
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332620

	arm_func_start ov29_0233263C
ov29_0233263C: ; 0x0233263C
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E714
	mov sl, r0
	b _023326CC
	arm_func_end ov29_0233263C

	arm_func_start ov29_02332658
ov29_02332658: ; 0x02332658
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E734
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332658

	arm_func_start ov29_02332674
ov29_02332674: ; 0x02332674
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E744
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332674

	arm_func_start ov29_02332690
ov29_02332690: ; 0x02332690
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E750
	mov sl, r0
	b _023326CC
	arm_func_end ov29_02332690

	arm_func_start ov29_023326AC
ov29_023326AC: ; 0x023326AC
	mov r0, sb
	mov r1, r4
	mov r2, r8
	mov r3, r7
	bl ov29_0232E794
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
	ldr r1, _023329D4 ; =0x02353718
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
	strneb fp, [r5, #0x108]
	b _023327C8
_02332790:
	mov r0, r8
	bl ov29_02324534
	cmp r0, #0
	beq _023327C8
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bne _023327C8
	mov r0, sb
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	ldrne r0, _023329DC ; =0x0237CA68
	movne r1, #1
	strneb r1, [r0]
_023327C8:
	mov r0, r4
	bl EntityIsValid__0232E840
	cmp r0, #0
	movne r0, #1
	strneb r0, [r5, #0x162]
	cmp r6, #0x89
	beq _02332818
	mov r0, sb
	bl ov29_02321A78
	mov r0, sb
	mov r1, r4
	bl ov29_02321CF0
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl ov29_022F94F0
	mov r1, r4
	mov r0, sb
	mov r2, r8
	bl ov29_022F9744
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
	strneb r0, [r1, #0x166]
	strneb r0, [r1, #0x167]
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
	bl ov29_0230D11C
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
	ldrneb r0, [r4, #0x15e]
	cmpne r0, #0
	beq _02332970
	mov r2, #0
	mov r0, sb
	mov r1, sb
	mov r3, r2
	strb r2, [r4, #0x15e]
	bl TryWarp
_02332970:
	mov r0, sb
	bl EntityIsValid__0232E840
	cmp r0, #0
	beq _023329CC
	ldr r4, [sb, #0xb4]
	ldrb r0, [r4, #0x15f]
	cmp r0, #0
	beq _023329B8
	add r0, sp, #0x9c
	mov r5, #0
	strb r5, [r4, #0x15f]
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
	streqb r0, [r4, #0x170]
_023329CC:
	add sp, sp, #0xf0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023329D4: .word 0x02353718
_023329D8: .word 0x000001F6
_023329DC: .word 0x0237CA68
_023329E0: .word 0x0000023A
_023329E4: .word 0x00000EC2
	arm_func_end ov29_023326AC

	arm_func_start ExclusiveItemEffectIsActive__023329E8
ExclusiveItemEffectIsActive__023329E8: ; 0x023329E8
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
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
	cmpne r3, #0
	beq _02332A60
	mov r1, #0x53
	bl AbilityIsActive2
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02332A60:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActive2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActive__02332A0C

	arm_func_start ov29_02332A70
ov29_02332A70: ; 0x02332A70
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
	bl ov29_02324E44
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl CalcDamageFinal
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02332A70

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
	bl ov29_02324E44
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl CalcDamageFinal
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DealDamage

	arm_func_start ov29_02332BB8
ov29_02332BB8: ; 0x02332BB8
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
	bl ov29_02324E44
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl CalcDamageFinal
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02332BB8

	arm_func_start CalcDamageProjectile
CalcDamageProjectile: ; 0x02332C4C
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
	bl ov29_02324E44
	str r0, [sp]
	mov r1, r5
	mov r2, r4
	mov r0, r6
	add r3, sp, #0x14
	bl CalcDamageFinal
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CalcDamageProjectile

	arm_func_start ov29_02332CDC
ov29_02332CDC: ; 0x02332CDC
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
	bl ov29_02324E44
	str r0, [sp]
	mov r1, r5
	mov r2, r4
	mov r0, r6
	add r3, sp, #0x14
	bl CalcDamageFinal
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02332CDC

	arm_func_start CalcDamageFinal
CalcDamageFinal: ; 0x02332D6C
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
	mov r3, #1
	movne r5, #0
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _02332DFC
	ldr r1, _02332F08 ; =0x02353538
	ldr r2, _02332F0C ; =0x000003E7
	ldr r0, [r1]
	add r0, r0, #0x700
	strh r2, [r0, #0x82]
	ldr r0, [r1]
	add r0, r0, #0x19000
	str r7, [r0, #0x908]
	ldr r0, [r1]
	ldrh r1, [r7, #0x26]
	add r0, r0, #0x19000
	str r1, [r0, #0x910]
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
	bl ov29_0230863C
	mov r0, r5
	strb r0, [r4, #0x166]
	strb r0, [r4, #0x167]
	b _02332ED0
_02332E3C:
	bl ov29_0234B034
	mov r3, #0
	str r3, [sp]
	ldr r2, [r7, #0xb4]
	mov r1, #1
	bl ov29_0230040C
	mov r0, r8
	bl ov29_022E272C
	cmp r0, #0
	beq _02332EA8
	mov r0, r7
	bl ov29_022E272C
	cmp r0, #0
	beq _02332EA8
	mov r2, #1
	ldr r0, _02332F10 ; =0x0000270F
	mov r1, r7
	sub r3, r2, #2
	bl ov29_022EA718
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
	strneb r2, [r4, #0x166]
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
	strneb r1, [r0, #0x164]
	ldr r0, [r6]
_02332EFC:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02332F04: .word 0x0000013A
_02332F08: .word 0x02353538
_02332F0C: .word 0x000003E7
_02332F10: .word 0x0000270F
_02332F14: .word 0x00000EC3
	arm_func_end CalcDamageFinal

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
	bl ov29_02324E44
	mov r1, #1
	str r1, [sp]
	stmib sp, {r0, r1}
	mov r3, #0
	mov r0, r8
	str r3, [sp, #0xc]
	mov r1, r7
	add r2, sp, #0x10
	bl ov29_0230863C
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	movne r0, #0
	bne _02332FC0
	mov r0, r7
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	movne r1, #1
	strneb r1, [r0, #0x164]
	ldr r0, [sp, #0x10]
_02332FC0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02332F18

	arm_func_start ov29_02332FC8
ov29_02332FC8: ; 0x02332FC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #4]
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	bl Abs
	cmp r0, #1
	bgt _02333010
	ldrsh r1, [r5, #6]
	ldrsh r0, [r4, #6]
	sub r0, r1, r0
	bl Abs
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
	arm_func_end ov29_02332FC8

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
	bl ov29_02319748
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
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
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
	ldr r0, [r3, #0x110]
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
	bl ov29_023197CC
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
	ldrb r0, [r3, #0x11e]
	cmp r0, #0
	bne _02333F90
_02333804:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233380C:
	ldrb r0, [r3, #0x11e]
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
	ldr r1, _02333FA4 ; =0x02353538
	mov r2, #0xc
	ldr r1, [r1]
	ldr r3, _02333FA8 ; =0x022C6322
	add r1, r1, #0x4000
	ldrsh r1, [r1, #0xd4]
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
	ldrgt r0, [r3, #0x110]
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
	bl ov29_02300634
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
	ldr r0, _02333FA4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5b]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A64:
	ldr r0, _02333FA4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5c]
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
	ldr r0, _02333FA4 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe38]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333AB8:
	ldrb r0, [r3, #0x11e]
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
	bl ov29_022E0880
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
	bl ov29_022E0880
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
	ldr r6, _02333FA4 ; =0x02353538
	b _02333C60
_02333C0C:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333C5C
	mov r0, r4
	mov r1, r7
	bl ov29_022E274C
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
	ldr r6, _02333FA4 ; =0x02353538
	b _02333CD4
_02333C80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333CD0
	mov r0, r4
	mov r1, r7
	bl ov29_022E274C
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
	ldr r6, _02333FA4 ; =0x02353538
	b _02333D60
_02333D18:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333D5C
	mov r0, r4
	mov r1, r7
	bl ov29_022E274C
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
	ldr r6, _02333FA4 ; =0x02353538
	b _02333DC8
_02333D80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333DC4
	mov r0, r4
	mov r1, r7
	bl ov29_022E274C
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
	bl ov29_02300634
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DF8:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333E8C
	ldr r6, _02333FA4 ; =0x02353538
	b _02333E74
_02333E10:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333E70
	mov r0, r4
	mov r1, r7
	bl ov29_022E274C
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
	ldr r6, _02333FA4 ; =0x02353538
	b _02333EF8
_02333E94:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333EF4
	mov r0, r4
	mov r1, r7
	bl ov29_022E274C
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
	ldr r0, [r3, #0x110]
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
_02333FA4: .word 0x02353538
_02333FA8: .word 0x022C6322
	arm_func_end StatusCheckerCheck
