	.include "asm/macros.inc"
	.include "overlay_29_02308FE0.inc"

	.text

	arm_func_start ApplyDamage
ApplyDamage: ; 0x02308FE0
#ifdef JAPAN
#define APPLY_DAMAGE_OFFSET -4
#define APPLY_DAMAGE_OFFSET_2 -0xA4
#else
#define APPLY_DAMAGE_OFFSET 0
#define APPLY_DAMAGE_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x64
#ifdef EUROPE
	ldr r8, [sp, #0x8c]
	mov r4, #0
	mov r5, r2
	mov sb, r1
	strb r4, [r5, #0x10]
	ldr r1, [sb]
	mov sl, r0
	str r3, [sp, #0x10]
	mov fp, r4
	str r4, [sp, #0x14]
	cmp r1, #1
	bne _02309A58
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0xbc]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	beq _02309A68
_02309A58:
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309A68:
	ldr r7, [sb, #0xb4]
	ldrb r0, [r7, #6]
	cmp r0, #0
	beq _02309A88
	ldrb r0, [r7, #8]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x14]
_02309A88:
	mov r0, sl
	mov r1, sb
	bl ov29_02307BDC
	mov r0, sl
	mov r1, sb
	bl UpdateShopkeeperModeAfterAttack
	ldr r0, [sl]
	cmp r0, #1
	ldreq r0, [sl, #0xb4]
	ldreqb r0, [r0, #0xec]
	cmpeq r0, #3
	ldreqb r0, [r5, #0xf]
	cmpeq r0, #0
	ldreq r0, _02309F98 ; =SET_DAMAGE_STATUS_DAMAGE
	ldreqsh r0, [r0]
	streq r0, [r5]
	ldr r0, [sl]
	cmp r0, #1
	bne _02309B60
	mov r0, sl
	mov r1, sb
	mov r2, #0x73
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	ldrne r0, [r5, #4]
	cmpne r0, #4
	cmpne r0, #0xe
	cmpne r0, #0
	cmpne r0, #0x17
	beq _02309BD0
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02309F9C ; =0x00000C46
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309B50
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309B50
	mov r0, sl
	mov r1, sb
	bl ov29_022E576C
_02309B50:
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309B60:
	cmp r0, #6
	bne _02309BD0
	mov r0, sb
	mov r1, #0x73
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r5, #4]
	cmpne r0, #4
	cmpne r0, #0xe
	cmpne r0, #0x17
	beq _02309BD0
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02309F9C ; =0x00000C46
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309BC0
	mov r0, sb
	bl ov29_022E57A0
_02309BC0:
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309BD0:
	ldr r0, _02309FA0 ; =0x0000024D
	cmp r8, r0
	beq _02309C50
	ldr r0, [sl]
	cmp r0, #1
	bne _02309C50
	mov r0, sl
	mov r1, sb
	mov r2, #0xd
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309C50
	ldr r1, [r5]
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	bne _02309C50
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	mov r1, sb
	mov r2, #0xc40
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, sb
	bl ov29_022E576C
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309C50:
	ldrb r0, [r7, #0xc4]
	cmp r0, #1
	bne _02309CA0
	cmp r8, #0x250
	beq _02309C90
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02309FA8 ; =0x00000C41
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, sb
	bl ov29_022E576C
_02309C90:
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309CA0:
	ldrb r0, [r7, #0xbd]
	cmp r0, #1
	cmpne r0, #5
	cmpne r0, #3
	bne _02309CC8
	ldrb r0, [r7, #0xbe]
	cmp r0, #0x7f
	bne _02309CC8
	mov r0, sb
	bl ov29_02307C48
_02309CC8:
	ldr r0, [sl]
	cmp r0, #1
	bne _02309E04
	mov r0, sl
	mov r1, sb
	mov r2, #0x23
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309D24
	ldrb r0, [r5, #0xc]
	cmp r0, #5
	bne _02309D24
	mov r3, #0
	str r3, [sp]
	ldr r2, [r5]
	mov r0, sl
	mov r1, sb
	bl TryIncreaseHp
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309D24:
	mov r0, sl
	mov r1, sb
	mov r2, #0x24
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309D74
	ldrb r0, [r5, #0xc]
	cmp r0, #3
	bne _02309D74
	mov r3, #0
	str r3, [sp]
	ldr r2, [r5]
	mov r0, sl
	mov r1, sb
	bl TryIncreaseHp
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309D74:
	mov r0, sl
	mov r1, sb
	mov r2, #0x55
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309DC4
	ldrb r0, [r5, #0xc]
	cmp r0, #3
	bne _02309DC4
	mov r3, #0
	str r3, [sp]
	ldr r2, [r5]
	mov r0, sl
	mov r1, sb
	bl TryIncreaseHp
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309DC4:
	mov r0, sl
	mov r1, sb
	mov r2, #0x66
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309E04
	ldrb r0, [r5, #0xc]
	cmp r0, #5
	bne _02309E04
	mov r0, sb
	bl ActivateMotorDrive
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309E04:
	ldr r6, _02309FAC ; =TYPE_DAMAGE_NEGATING_EXCLUSIVE_ITEM_EFFECTS
	b _02309E78
_02309E0C:
	ldrb r0, [r5, #0xc]
	cmp r1, r0
	bne _02309E74
	ldr r1, [r6, #4]
	mov r0, sl
	and r2, r1, #0xff
	str r2, [sp]
	mov r2, #0
	mov r1, sb
	mov r3, r2
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	beq _02309E74
	ldr r0, [r6, #4]
	cmp r0, #0x71
	mov r0, #1
	strleb r0, [r5, #0x10]
	ble _02309E6C
	str r0, [sp]
	ldr r2, [r5]
	mov r0, sl
	mov r1, sb
	mov r3, #0
	bl TryIncreaseHp
_02309E6C:
	mov r0, #0
	b _02309E88
_02309E74:
	add r6, r6, #8
_02309E78:
	ldrb r1, [r6]
	cmp r1, #0x12
	bne _02309E0C
	mov r0, #1
_02309E88:
	cmp r0, #0
	bne _02309F04
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	beq _02309EF4
	ldr r0, [sl]
	cmp r0, #1
	bne _02309ED8
	mov r0, sl
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309EF4
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309EF4
	mov r0, sl
	mov r1, sb
	bl ov29_022FB98C
	b _02309EF4
_02309ED8:
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309EF4
	mov r0, sl
	mov r1, sb
	bl ov29_022FB98C
_02309EF4:
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_02309F04:
	ldr r0, [r5]
	cmp r0, #0
	ble _02309F4C
	mov r0, sb
	mov r1, #0x51
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02309F4C
	ldr r0, _02309FB0 ; =ov10_022C45C4
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _02309F4C
	mov r0, sb
	mov r1, sb
	mov r2, #1
	mov r3, #0
	bl RestoreRandomMovePP
_02309F4C:
	ldrb r0, [r7, #0x15c]
	cmp r0, #0
	bne _02309FCC_EU
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	beq _02309F74
	ldr r2, _02309FB4 ; =0x00000C42
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02309F74:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02309F94
	cmp r0, #1
	beq _02309FA8_EU
	cmp r0, #3
	beq _02309FBC_EU
	b _02309FCC_EU
_02309F94:
	ldr r2, _02309FB8 ; =0x00000C43
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309FCC_EU
_02309FA8_EU:
	ldr r2, _02309FBC ; =0x00000C44
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309FCC_EU
_02309FBC_EU:
	ldr r2, _02309FC0 ; =0x00000C45
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02309FCC_EU:
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, [r5]
	cmp r1, #0
	bne _0230A07C
	mov r0, sl
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0230A044
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0230A044
	ldrb r0, [r7, #0x15c]
	cmp r0, #0
	bne _0230A034
	ldr r2, _02309FC4 ; =0x00000C47
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230A034:
	mov r0, sl
	mov r1, sb
	bl ov29_022E576C
	b _0230A06C
_0230A044:
	ldrb r0, [r7, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _0230A060
	ldr r2, _02309FC4 ; =0x00000C47
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230A060:
	mov r0, #0x1e
	mov r1, #0x18
	bl ov29_022EA370
_0230A06C:
	mov r0, #1
	strb r0, [r5, #0x10]
	mov r0, #0
	b _0230A918
_0230A07C:
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	bne _0230A16C
	ldr r0, [sp, #0x90]
	cmp r0, #0
	beq _0230A144
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0230A144
	mov r0, sb
	bl GetTileAtEntity
	mov r2, #0
	mov r1, #1
	str r2, [sp]
	str r1, [sp, #4]
	add r1, r1, #0x2b4
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	mov fp, r0
	mov r0, sb
	mov r3, #3
	bl PlayEffectAnimationEntity
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	mvn r1, #0
	cmp r6, r1
	ldr r0, _02309FC8 ; =ov29_023535D4
	strh r1, [r0]
	beq _0230A144
	b _0230A100
_0230A0F8:
	mov r0, #0x18
	bl AdvanceFrame
_0230A100:
	mov r0, r6
	bl ov10_022BF964
	cmp r0, #0
	bne _0230A0F8
	mov r0, r6
	bl ov10_022BDE50
	mov r2, #0
	str r2, [sp]
	mov r0, #1
	stmib sp, {r0, r2}
	ldr r1, _02309FCC ; =0x000002B6
	mov r0, sb
	mov r3, #3
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	ldr r1, _02309FC8 ; =ov29_023535D4
	strh r0, [r1]
_0230A144:
	ldrb r0, [r7, #0x15c]
	cmp r0, #0
	bne _0230A160
	ldr r2, _02309FD0 ; =0x00000C48
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230A160:
	ldr r0, _02309FD4 ; =0x000003E7
	str r0, [r7, #0xb8]
	b _0230A234
_0230A16C:
	mov r0, #0
	bl ov29_0234B09C
	ldr r1, [r5, #4]
	ldr r2, [r7, #0xb8]
	cmp r1, #0x1b
	ldrlt r0, _02309FD8 ; =DAMAGE_STRING_IDS
	movge r6, #0
	movlt r1, r1, lsl #1
	ldrlth r6, [r0, r1]
	ldr r1, [r5]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	str r1, [r7, #0xb8]
	cmp r1, r0
	strgt r0, [r7, #0xb8]
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0230A210
	ldr r0, [r5, #4]
	cmp r0, #0xe
	cmpne r0, #0x17
	ldrne r0, _02309FDC ; =0x0000025F
	cmpne r8, r0
	beq _0230A1E8
	ldr r0, [r5]
	mov r2, #1
	mov r1, sb
	rsb r0, r0, #0
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
_0230A1E8:
	ldrb r0, [r7, #0x15c]
	cmp r0, #0
	bne _0230A234
	cmp r6, #0
	beq _0230A234
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230A234
_0230A210:
	ldrb r0, [r7, #0x15c]
	cmp r0, #0
	bne _0230A234
	cmp r6, #0
	beq _0230A234
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0230A234:
	ldr r0, [r5, #4]
	cmp r0, #0xe
	bne _0230A24C
	ldrsh r0, [r7, #0x10]
	cmp r0, #1
	bgt _0230A348
_0230A24C:
	cmp fp, #0
	bne _0230A348
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0230A348
	ldrsh r1, [sl, #4]
	ldrsh r0, [sb, #4]
	cmp r1, r0
	ldreqsh r1, [sl, #6]
	ldreqsh r0, [sb, #6]
	cmpeq r1, r0
	beq _0230A318
	ldr r0, [sl]
	cmp r0, #1
	bne _0230A318
	ldrb r0, [r7, #7]
	mov r6, #0
	cmp r0, #0
	beq _0230A2CC
	bl sub_0204AF00
	cmp r0, #0
	beq _0230A2CC
	mov r0, sb
	bl ov29_022F9AF4
	cmp r0, #0
	bne _0230A2CC
	mov r0, sb
	mov r1, sl
	bl CanSeeTarget
	cmp r0, #0
	movne r6, #1
_0230A2CC:
	ldrb r0, [r7, #0xf1]
	cmp r0, #2
	beq _0230A2EC
	mov r0, sb
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _0230A2F0
_0230A2EC:
	mov r6, #0
_0230A2F0:
	cmp r6, #0
	beq _0230A310
	add r0, sb, #4
	add r1, sl, #4
	ldr r6, [sb, #0xb4]
	bl GetDirectionTowardsPosition
	and r0, r0, #7
	strb r0, [r6, #0x4c]
_0230A310:
	mov r0, sb
	bl UpdateAiTargetPos
_0230A318:
	ldr r0, _02309FDC ; =0x0000025F
	cmp r8, r0
	beq _0230A348
	ldr r1, [sb, #0xb4]
	mov r0, sb
	ldrb r2, [r1, #0x4c]
	mov r1, #6
	bl ChangeMonsterAnimation
	mov r0, sb
	mov r1, r5
	bl ov29_022E5478
	mov r4, #1
_0230A348:
	ldrb r0, [r7, #6]
	cmp r0, #0
	beq _0230A388
	ldr r0, [r5]
	cmp r0, #0
	ble _0230A388
	ldr r0, [sl]
	cmp r0, #1
	ldreq r0, [sl, #0xb4]
	ldreqb r0, [r0, #6]
	cmpeq r0, #0
	bne _0230A388
	ldrsh r0, [r7, #2]
	bl SetMonsterFlag2
	ldrsh r0, [r7, #2]
	bl SetPokemonBattled
_0230A388:
	ldrsh r6, [r7, #0x10]
	ldr r0, [r5]
	cmp r6, r0
	subgt r0, r6, r0
	movle r0, #0
	strh r0, [r7, #0x10]
	ldrb r0, [r7, #0xd5]
	cmp r0, #9
	bne _0230A3D4
	ldrsh r0, [r7, #0x10]
	cmp r0, #0
	bne _0230A454
	ldr r2, _02309FE0 ; =0x00000C49
	mov r3, #1
	mov r0, sl
	mov r1, sb
	strh r3, [r7, #0x10]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230A454
_0230A3D4:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _0230A408
	ldrsh r0, [r7, #0x10]
	cmp r0, #0
	bne _0230A454
	ldr r2, _02309FE4 ; =0x00000C4A
	mov r3, #1
	mov r0, sl
	mov r1, sb
	strh r3, [r7, #0x10]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230A454
_0230A408:
	mov r0, sb
	mov r1, #0x22
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230A454
	ldr r0, _02309FE8 ; =ov10_022C4834
	ldr r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230A454
	ldrsh r0, [r7, #0x10]
	cmp r0, #0
	bne _0230A454
	ldr r2, _02309FE0 ; =0x00000C49
	mov r3, #1
	mov r0, sl
	mov r1, sb
	strh r3, [r7, #0x10]
	bl LogMessageByIdWithPopupCheckUserTarget
_0230A454:
	bl ov29_022E81F8
	ldrsh r0, [r7, #0x10]
	subs r6, r6, r0
	movmi r6, #0
	cmp r4, #0
	cmpeq fp, #0
	beq _0230A47C
	mov r0, #0xa
	mov r1, #0x18
	bl ov29_022EA370
_0230A47C:
	mov r0, sb
	bl UpdateStatusIconFlags
	ldrsh r0, [r7, #0x10]
	cmp r0, #0
	beq _0230A54C
	cmp r4, #0
	beq _0230A4A4
	mov r0, sb
	mov r1, #8
	bl ov29_02304A48
_0230A4A4:
	ldr r0, [r5, #4]
	cmp r0, #0xe
	beq _0230A530
	mov r0, sb
	mov r1, #0x17
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230A4F0
	cmp r6, #0
	ble _0230A4F0
	ldr r1, [r5]
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	beq _0230A4F0
	ldr r1, _02309FEC ; =ov10_022C45FC
	mov r0, sl
	ldrsh r2, [r1]
	mov r1, sb
	bl AddExpSpecial
_0230A4F0:
	mov r0, sb
	mov r1, #0x50
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230A530
	cmp r6, #0
	ble _0230A530
	ldr r1, [r5]
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	beq _0230A530
	ldr r1, _02309FEC ; =ov10_022C45FC
	mov r0, sl
	ldrsh r2, [r1]
	mov r1, sb
	bl AddExpSpecial
_0230A530:
	cmp fp, #0
	beq _0230A544
	mov r0, sb
	bl ov29_0230D7D4
	bl UpdateTrapsVisibility
_0230A544:
	mov r0, #0
	b _0230A918
_0230A54C:
	ldr r0, _02309FDC ; =0x0000025F
	cmp r8, r0
	bne _0230A588
	ldr r1, [sb, #0xb4]
	mov r0, sb
	ldrb r2, [r1, #0x4c]
	mov r1, #6
	bl ChangeMonsterAnimation
	mov r0, sb
	mov r1, r5
	bl ov29_022E5478
	mov r0, #0xa
	mov r1, #0x18
	bl ov29_022EA370
	mov r4, #1
_0230A588:
	ldrb r0, [r7, #0xef]
	cmp r0, #2
	bne _0230A5A4
	mov r0, sl
	mov r1, sb
	mov r2, #0
	bl EndInvisibleClassStatus
_0230A5A4:
	cmp fp, #0
	beq _0230A5D0
	mov r0, #0x14
	mov r1, #0x18
	bl ov29_022EA370
	mov r1, #2
	mov r0, sb
	strb r1, [sb, #0x22]
	bl ov29_0230D7D4
	bl UpdateTrapsVisibility
	b _0230A5EC
_0230A5D0:
	cmp r4, #0
	beq _0230A5EC
	mov r2, #1
	mov r0, #0x1e
	mov r1, #0x18
	strb r2, [sb, #0x22]
	bl ov29_022EA370
_0230A5EC:
	mov r0, sl
	mov r4, #1
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230A614
	ldr r0, [sl]
	cmp r0, #1
	bne _0230A614
	cmp sl, sb
	movne r4, #0
_0230A614:
	mov r0, #0
	mov r1, sl
	mov r2, r0
	strb r0, [r7, #0x156]
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r0, [r5, #4]
	mov fp, #0
	cmp r0, #0x13
	cmpne r0, #4
	cmpne r0, #0x14
	ldrb r0, [r7, #6]
	bne _0230A680
	cmp r0, #0
	beq _0230A670
	ldr r2, _02309FF0 ; =0x00000C4B
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230A7E8
_0230A670:
	ldr r1, _02309FF0 ; =0x00000C4B
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A680:
	cmp r0, #0
	beq _0230A6C8
	ldrb r0, [r7, #0xbc]
	cmp r0, #7
	bne _0230A6AC
	ldr r0, _02309FF4 ; =ov29_02353220
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A6AC:
	ldr r0, _02309FF8 ; =ov29_0235321C
	mov r1, r4, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230A7E8
_0230A6C8:
	ldrsh r0, [r7, #0xc]
	bl GetActiveTeamMember
	ldrb r1, [r7, #7]
	mov r5, r0
	cmp r1, #0
	bne _0230A704
	ldrb r0, [r7, #0x48]
	bl JoinedAtRangeCheck2Veneer
	cmp r0, #0
	beq _0230A71C
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _0230A71C
_0230A704:
	ldr r0, _0230A000 ; =ov29_02353228
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A71C:
	mov r0, r7
	bl IsExperienceLocked
	cmp r0, #0
	beq _0230A76C
	mov r0, r7
	bl IsSpecialStoryAlly
	cmp r0, #0
	beq _0230A754
	ldr r0, _0230A004 ; =ov29_02353234
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A754:
	ldr r0, _0230A008 ; =ov29_0235322C
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A76C:
	ldrb r0, [r7, #0xbc]
	cmp r0, #7
	bne _0230A790
	ldr r0, _02309FF4 ; =ov29_02353220
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A790:
	ldrsh r0, [r5, #8]
	bl IsMonsterIdInNormalRangeVeneer
	cmp r0, #0
	beq _0230A7E4
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75d]
	cmp r0, #0
	beq _0230A7CC
	ldr r0, _0230A00C ; =ov29_02353224
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A7CC:
	ldr r0, _0230A010 ; =ov29_02353230
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
	b _0230A7E8
_0230A7E4:
	mov fp, #1
_0230A7E8:
	ldrb r0, [r7, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0230A804
	ldr r0, [r7, #0xb4]
	bl FreeOtherWrappedMonsters
_0230A804:
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0230A964
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0230A964
	ldrb r0, [r7, #0x62]
	tst r0, #2
	ldreqsh r1, [r7, #0x66]
	ldreq r0, _0230A018 ; =0x00000153
	cmpeq r1, r0
	bne _0230A964
	mov r0, sb
	bl ov29_022E550C
	mov r0, #0
	strb r0, [sb, #0x22]
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r7, #0x10]
	mov r2, #0
	strb r2, [r7, #0x162]
	mov r0, #1
	strb r0, [r7, #0x156]
	add r0, r7, #0x100
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
	ldrb r0, [r7, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, [r0]
	strneb r2, [r1, #0x799]
	ldrne r0, [r0]
	strneb r2, [r0, #0x78d]
	add r0, r7, #0x62
	bl ItemZInit
	ldrb r0, [r7, #0xd8]
	cmp r0, #3
	bne _0230A8E0
	mov r0, sl
	mov r1, sb
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	b _0230A8FC
_0230A8E0:
	cmp r0, #2
	bne _0230A8FC
	mov r0, sl
	mov r1, sb
	mov r2, #2
	mov r3, #1
	bl EndCurseClassStatus
_0230A8FC:
	mov r0, sb
	bl ov29_023159D4
	mov r0, r7
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, sb
	bl RestorePpAllMovesSetFlags
	mov r0, sb
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
	mov r1, sb
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	ldr r1, _0230A01C ; =0x00000C4C
	bl LogMessageByIdWithPopup
	mov r0, sb
	bl ov29_0230D628
	mov r0, #0
	b _0230A918
_0230A964:
	ldrb r0, [r7, #7]
	cmp r0, #0
	beq _0230AC40_EU
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0230AC40_EU
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldreqsh r1, [r7, #0x66]
	ldreq r0, _0230A020 ; =0x00000159
	cmpeq r1, r0
	bne _0230AC40_EU
	mov r6, #0
	mov r5, r6
#else
	ldr r5, [sp, #0x8c]
	mov sb, #0
	mov r6, r2
	mov r7, r1
	strb sb, [r6, #0x10]
	ldr r1, [r7]
	mov r8, r0
	str r3, [sp, #0x10]
	mov fp, sb
	str sb, [sp, #0x14]
	cmp r1, #1
	bne _0230902C
	ldr r0, [r7, #0xb4]
	ldrb r0, [r0, #0xbc]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	beq _0230903C
_0230902C:
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_0230903C:
	ldr r4, [r7, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0230905C
	ldrb r0, [r4, #8]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x14]
_0230905C:
	mov r0, r8
	mov r1, r7
	bl ov29_02307BDC
	mov r0, r8
	mov r1, r7
	bl UpdateShopkeeperModeAfterAttack
	ldr r0, [r8]
	cmp r0, #1
	ldreq r0, [r8, #0xb4]
	ldreqb r0, [r0, #0xec]
	cmpeq r0, #3
	ldreqb r0, [r6, #0xf]
	cmpeq r0, #0
	ldreq r0, _02309F98 ; =SET_DAMAGE_STATUS_DAMAGE
	ldreqsh r0, [r0]
	streq r0, [r6]
	ldr r0, [r8]
	cmp r0, #1
	bne _02309134
	mov r0, r8
	mov r1, r7
	mov r2, #0x73
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	ldrne r0, [r6, #4]
	cmpne r0, #4
	cmpne r0, #0xe
	cmpne r0, #0
	cmpne r0, #0x17
	beq _023091A4
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02309F9C ; =0x00000C46
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309124
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309124
	mov r0, r8
	mov r1, r7
	bl ov29_022E576C
_02309124:
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_02309134:
	cmp r0, #6
	bne _023091A4
	mov r0, r7
	mov r1, #0x73
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r6, #4]
	cmpne r0, #4
	cmpne r0, #0xe
	cmpne r0, #0x17
	beq _023091A4
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02309F9C ; =0x00000C46
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309194
	mov r0, r7
	bl ov29_022E57A0
_02309194:
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_023091A4:
	ldr r0, _02309FA0 ; =0x0000024D
	cmp r5, r0
	beq _02309224
	ldr r0, [r8]
	cmp r0, #1
	bne _02309224
	mov r0, r8
	mov r1, r7
	mov r2, #0xd
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309224
	ldr r1, [r6]
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	bne _02309224
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldr r2, _0230B540 ; =0x0000097F
	mov r0, r8
	mov r1, r7
#else
	mov r0, r8
	mov r1, r7
	mov r2, #0xc40
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	mov r1, r7
	bl ov29_022E576C
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_02309224:
	ldrb r0, [r4, #0xc4]
	cmp r0, #1
	bne _02309274
	cmp r5, #0x250
	beq _02309264
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	mov r0, r8
	mov r1, r7
	mov r2, #0x980
#else
	ldr r2, _02309FA8 ; =0x00000C41
	mov r0, r8
	mov r1, r7
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	mov r1, r7
	bl ov29_022E576C
_02309264:
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_02309274:
	ldrb r0, [r4, #0xbd]
	cmp r0, #1
	cmpne r0, #5
	cmpne r0, #3
	bne _0230929C
	ldrb r0, [r4, #0xbe]
	cmp r0, #0x7f
	bne _0230929C
	mov r0, r7
	bl ov29_02307C48
_0230929C:
	ldr r0, [r8]
	cmp r0, #1
	bne _023093D8
	mov r0, r8
	mov r1, r7
	mov r2, #0x23
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _023092F8
	ldrb r0, [r6, #0xc]
	cmp r0, #5
	bne _023092F8
	mov r3, #0
	str r3, [sp]
	ldr r2, [r6]
	mov r0, r8
	mov r1, r7
	bl TryIncreaseHp
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_023092F8:
	mov r0, r8
	mov r1, r7
	mov r2, #0x24
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309348
	ldrb r0, [r6, #0xc]
	cmp r0, #3
	bne _02309348
	mov r3, #0
	str r3, [sp]
	ldr r2, [r6]
	mov r0, r8
	mov r1, r7
	bl TryIncreaseHp
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_02309348:
	mov r0, r8
	mov r1, r7
	mov r2, #0x55
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _02309398
	ldrb r0, [r6, #0xc]
	cmp r0, #3
	bne _02309398
	mov r3, #0
	str r3, [sp]
	ldr r2, [r6]
	mov r0, r8
	mov r1, r7
	bl TryIncreaseHp
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_02309398:
	mov r0, r8
	mov r1, r7
	mov r2, #0x66
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _023093D8
	ldrb r0, [r6, #0xc]
	cmp r0, #5
	bne _023093D8
	mov r0, r7
	bl ActivateMotorDrive
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_023093D8:
	ldr sl, _02309FAC ; =TYPE_DAMAGE_NEGATING_EXCLUSIVE_ITEM_EFFECTS
	b _0230944C
_023093E0:
	ldrb r0, [r6, #0xc]
	cmp r1, r0
	bne _02309448
	ldr r1, [sl, #4]
	mov r0, r8
	and r2, r1, #0xff
	str r2, [sp]
	mov r2, #0
	mov r1, r7
	mov r3, r2
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	beq _02309448
	ldr r0, [sl, #4]
	cmp r0, #0x71
	mov r0, #1
	strleb r0, [r6, #0x10]
	ble _02309440
	str r0, [sp]
	ldr r2, [r6]
	mov r0, r8
	mov r1, r7
	mov r3, #0
	bl TryIncreaseHp
_02309440:
	mov r0, #0
	b _0230945C
_02309448:
	add sl, sl, #8
_0230944C:
	ldrb r1, [sl]
	cmp r1, #0x12
	bne _023093E0
	mov r0, #1
_0230945C:
	cmp r0, #0
	bne _023094D8
	ldrb r0, [r6, #0x10]
	cmp r0, #0
	beq _023094C8
	ldr r0, [r8]
	cmp r0, #1
	bne _023094AC
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _023094C8
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _023094C8
	mov r0, r8
	mov r1, r7
	bl ov29_022FB98C
	b _023094C8
_023094AC:
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _023094C8
	mov r0, r8
	mov r1, r7
	bl ov29_022FB98C
_023094C8:
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_023094D8:
	ldr r0, [r6]
	cmp r0, #0
	ble _02309520
	mov r0, r7
	mov r1, #0x51
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02309520
	ldr r0, _02309FB0 ; =ov10_022C45C4
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _02309520
	mov r0, r7
	mov r1, r7
	mov r2, #1
	mov r3, #0
	bl RestoreRandomMovePP
_02309520:
	ldrb r0, [r4, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _023095A0
	ldrb r0, [r6, #0xe]
	cmp r0, #0
	beq _02309548
	ldr r2, _02309FB4 ; =0x00000C42
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02309548:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _02309568
	cmp r0, #1
	beq _0230957C
	cmp r0, #3
	beq _02309590
	b _023095A0
_02309568:
	ldr r2, _02309FB8 ; =0x00000C43
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023095A0
_0230957C:
	ldr r2, _02309FBC ; =0x00000C44
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023095A0
_02309590:
	ldr r2, _02309FC0 ; =0x00000C45
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_023095A0:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, [r6]
	cmp r1, #0
	bne _02309650
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309618
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309618
	ldrb r0, [r4, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _02309608
	ldr r2, _02309FC4 ; =0x00000C47
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02309608:
	mov r0, r8
	mov r1, r7
	bl ov29_022E576C
	b _02309640
_02309618:
	ldrb r0, [r4, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _02309634
	ldr r2, _02309FC4 ; =0x00000C47
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02309634:
	mov r0, #0x1e
	mov r1, #0x18
	bl ov29_022EA370
_02309640:
	mov r0, #1
	strb r0, [r6, #0x10]
	mov r0, #0
	b _0230A918
_02309650:
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	bne _02309740
	ldr r0, [sp, #0x90]
	cmp r0, #0
	beq _02309718
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02309718
	mov r0, r7
	bl GetTileAtEntity
	mov r2, #0
	mov r1, #1
	str r2, [sp]
	str r1, [sp, #4]
	add r1, r1, #0x2b4
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	mov fp, r0
	mov r0, r7
	mov r3, #3
	bl PlayEffectAnimationEntity
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
	mvn r1, #0
	cmp sl, r1
	ldr r0, _02309FC8 ; =ov29_023535D4
	strh r1, [r0]
	beq _02309718
	b _023096D4
_023096CC:
	mov r0, #0x18
	bl AdvanceFrame
_023096D4:
	mov r0, sl
	bl ov10_022BF964
	cmp r0, #0
	bne _023096CC
	mov r0, sl
	bl ov10_022BDE50
	mov r2, #0
	str r2, [sp]
	mov r0, #1
	stmib sp, {r0, r2}
	ldr r1, _02309FCC ; =0x000002B6
	mov r0, r7
	mov r3, #3
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	ldr r1, _02309FC8 ; =ov29_023535D4
	strh r0, [r1]
_02309718:
	ldrb r0, [r4, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _02309734
	ldr r2, _02309FD0 ; =0x00000C48
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02309734:
	ldr r0, _02309FD4 ; =0x000003E7
	str r0, [r4, #0xb8]
	b _02309808
_02309740:
	mov r0, #0
	bl ov29_0234B09C
	ldr r1, [r6, #4]
	ldr r2, [r4, #0xb8]
	cmp r1, #0x1b
	ldrlt r0, _02309FD8 ; =DAMAGE_STRING_IDS
	movge sl, #0
	movlt r1, r1, lsl #1
	ldrlth sl, [r0, r1]
	ldr r1, [r6]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	str r1, [r4, #0xb8]
	cmp r1, r0
	strgt r0, [r4, #0xb8]
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _023097E4
	ldr r0, [r6, #4]
	cmp r0, #0xe
	cmpne r0, #0x17
	ldrne r0, _02309FDC ; =0x0000025F
	cmpne r5, r0
	beq _023097BC
	ldr r0, [r6]
	mov r2, #1
	mov r1, r7
	rsb r0, r0, #0
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
_023097BC:
	ldrb r0, [r4, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _02309808
	cmp sl, #0
	beq _02309808
	mov r0, r8
	mov r1, r7
	mov r2, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309808
_023097E4:
	ldrb r0, [r4, #0x15c + APPLY_DAMAGE_OFFSET]
	cmp r0, #0
	bne _02309808
	cmp sl, #0
	beq _02309808
	mov r0, r8
	mov r1, r7
	mov r2, sl
	bl LogMessageByIdWithPopupCheckUserTarget
_02309808:
	ldr r0, [r6, #4]
	cmp r0, #0xe
	bne _02309820
	ldrsh r0, [r4, #0x10]
	cmp r0, #1
	bgt _0230991C
_02309820:
	cmp fp, #0
	bne _0230991C
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0230991C
	ldrsh r1, [r8, #4]
	ldrsh r0, [r7, #4]
	cmp r1, r0
	ldreqsh r1, [r8, #6]
	ldreqsh r0, [r7, #6]
	cmpeq r1, r0
	beq _023098EC
	ldr r0, [r8]
	cmp r0, #1
	bne _023098EC
	ldrb r0, [r4, #7]
	mov sl, #0
	cmp r0, #0
	beq _023098A0
	bl sub_0204AF00
	cmp r0, #0
	beq _023098A0
	mov r0, r7
	bl ov29_022F9AF4
	cmp r0, #0
	bne _023098A0
	mov r0, r7
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	movne sl, #1
_023098A0:
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	beq _023098C0
	mov r0, r7
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _023098C4
_023098C0:
	mov sl, #0
_023098C4:
	cmp sl, #0
	beq _023098E4
	add r0, r7, #4
	add r1, r8, #4
	ldr sl, [r7, #0xb4]
	bl GetDirectionTowardsPosition
	and r0, r0, #7
	strb r0, [sl, #0x4c]
_023098E4:
	mov r0, r7
	bl UpdateAiTargetPos
_023098EC:
	ldr r0, _02309FDC ; =0x0000025F
	cmp r5, r0
	beq _0230991C
	ldr r1, [r7, #0xb4]
	mov r0, r7
	ldrb r2, [r1, #0x4c]
	mov r1, #6
	bl ChangeMonsterAnimation
	mov r0, r7
	mov r1, r6
	bl ov29_022E5478
	mov sb, #1
_0230991C:
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0230995C
	ldr r0, [r6]
	cmp r0, #0
	ble _0230995C
	ldr r0, [r8]
	cmp r0, #1
	ldreq r0, [r8, #0xb4]
	ldreqb r0, [r0, #6]
	cmpeq r0, #0
	bne _0230995C
	ldrsh r0, [r4, #2]
	bl SetMonsterFlag2
	ldrsh r0, [r4, #2]
	bl SetPokemonBattled
_0230995C:
	ldrsh sl, [r4, #0x10]
	ldr r0, [r6]
	cmp sl, r0
	subgt r0, sl, r0
	movle r0, #0
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #0xd5]
	cmp r0, #9
	bne _023099A8
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	bne _02309A28
	ldr r2, _02309FE0 ; =0x00000C49
	mov r3, #1
	mov r0, r8
	mov r1, r7
	strh r3, [r4, #0x10]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309A28
_023099A8:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _023099DC
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	bne _02309A28
	ldr r2, _02309FE4 ; =0x00000C4A
	mov r3, #1
	mov r0, r8
	mov r1, r7
	strh r3, [r4, #0x10]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309A28
_023099DC:
	mov r0, r7
	mov r1, #0x22
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02309A28
	ldr r0, _02309FE8 ; =ov10_022C4834
	ldr r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _02309A28
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	bne _02309A28
	ldr r2, _02309FE0 ; =0x00000C49
	mov r3, #1
	mov r0, r8
	mov r1, r7
	strh r3, [r4, #0x10]
	bl LogMessageByIdWithPopupCheckUserTarget
_02309A28:
	bl ov29_022E81F8
	ldrsh r0, [r4, #0x10]
	subs sl, sl, r0
	movmi sl, #0
	cmp sb, #0
	cmpeq fp, #0
	beq _02309A50
	mov r0, #0xa
	mov r1, #0x18
	bl ov29_022EA370
_02309A50:
#ifndef JAPAN
	mov r0, r7
	bl UpdateStatusIconFlags
#endif
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	beq _02309B20
	cmp sb, #0
	beq _02309A78
	mov r0, r7
	mov r1, #8
	bl ov29_02304A48
_02309A78:
	ldr r0, [r6, #4]
	cmp r0, #0xe
	beq _02309B04
	mov r0, r7
	mov r1, #0x17
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _02309AC4
	cmp sl, #0
	ble _02309AC4
	ldr r1, [r6]
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	beq _02309AC4
	ldr r1, _02309FEC ; =ov10_022C45FC
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	bl AddExpSpecial
_02309AC4:
	mov r0, r7
	mov r1, #0x50
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _02309B04
	cmp sl, #0
	ble _02309B04
	ldr r1, [r6]
	ldr r0, _02309FA4 ; =0x0000270F
	cmp r1, r0
	beq _02309B04
	ldr r1, _02309FEC ; =ov10_022C45FC
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	bl AddExpSpecial
_02309B04:
	cmp fp, #0
	beq _02309B18
	mov r0, r7
	bl ov29_0230D7D4
	bl UpdateTrapsVisibility
_02309B18:
	mov r0, #0
	b _0230A918
_02309B20:
	ldr r0, _02309FDC ; =0x0000025F
	cmp r5, r0
	bne _02309B5C
	ldr r1, [r7, #0xb4]
	mov r0, r7
	ldrb r2, [r1, #0x4c]
	mov r1, #6
	bl ChangeMonsterAnimation
	mov r0, r7
	mov r1, r6
	bl ov29_022E5478
	mov r0, #0xa
	mov r1, #0x18
	bl ov29_022EA370
	mov sb, #1
_02309B5C:
	ldrb r0, [r4, #0xef]
	cmp r0, #2
	bne _02309B78
	mov r0, r8
	mov r1, r7
	mov r2, #0
	bl EndInvisibleClassStatus
_02309B78:
	cmp fp, #0
	beq _02309BA4
	mov r0, #0x14
	mov r1, #0x18
	bl ov29_022EA370
	mov r1, #2
	mov r0, r7
	strb r1, [r7, #0x22]
	bl ov29_0230D7D4
	bl UpdateTrapsVisibility
	b _02309BC0
_02309BA4:
	cmp sb, #0
	beq _02309BC0
	mov r2, #1
	mov r0, #0x1e
	mov r1, #0x18
	strb r2, [r7, #0x22]
	bl ov29_022EA370
_02309BC0:
	mov r0, r8
	mov sb, #1
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _02309BE8
	ldr r0, [r8]
	cmp r0, #1
	bne _02309BE8
	cmp r8, r7
	movne sb, #0
_02309BE8:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	strb r0, [r4, #0x156 + APPLY_DAMAGE_OFFSET]
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r0, [r6, #4]
	cmp r0, #0x13
	cmpne r0, #4
	cmpne r0, #0x14
	ldrb r0, [r4, #6]
	bne _02309C50
	cmp r0, #0
	beq _02309C40
	ldr r2, _02309FF0 ; =0x00000C4B
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309DC8
_02309C40:
	ldr r1, _02309FF0 ; =0x00000C4B
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309C50:
	cmp r0, #0
	beq _02309C98
	ldrb r0, [r4, #0xbc]
	cmp r0, #7
	bne _02309C7C
	ldr r0, _02309FF4 ; =ov29_02353220
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309C7C:
	ldr r0, _02309FF8 ; =ov29_0235321C
	mov r1, sb, lsl #1
	ldrh r2, [r0, r1]
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02309DC8
_02309C98:
	ldrsh r0, [r4, #0xc]
	bl GetActiveTeamMember
	ldrb r1, [r4, #7]
	mov r6, r0
	cmp r1, #0
	bne _02309CD4
	ldrb r0, [r4, #0x48]
	bl JoinedAtRangeCheck2Veneer
	cmp r0, #0
	beq _02309CEC
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _02309CEC
_02309CD4:
	ldr r0, _0230A000 ; =ov29_02353228
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309CEC:
	mov r0, r4
	bl IsExperienceLocked
	cmp r0, #0
	beq _02309D3C
	mov r0, r4
	bl IsSpecialStoryAlly
	cmp r0, #0
	beq _02309D24
	ldr r0, _0230A004 ; =ov29_02353234
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309D24:
	ldr r0, _0230A008 ; =ov29_0235322C
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309D3C:
	ldrb r0, [r4, #0xbc]
	cmp r0, #7
	bne _02309D60
	ldr r0, _02309FF4 ; =ov29_02353220
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309D60:
	ldrsh r0, [r6, #8]
	bl IsMonsterIdInNormalRangeVeneer
	cmp r0, #0
	beq _02309DB4
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75d]
	cmp r0, #0
	beq _02309D9C
	ldr r0, _0230A00C ; =ov29_02353224
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309D9C:
	ldr r0, _0230A010 ; =ov29_02353230
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _02309DC8
_02309DB4:
	ldr r0, _0230A014 ; =ov29_02353218
	mov r1, sb, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r8
	bl LogMessageByIdWithPopup
_02309DC8:
	ldrb r0, [r4, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02309DE4
	ldr r0, [r4, #0xb4]
	bl FreeOtherWrappedMonsters
_02309DE4:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02309F44
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02309F44
	ldrb r0, [r4, #0x62]
	tst r0, #2
	ldreqsh r1, [r4, #0x66]
	ldreq r0, _0230A018 ; =0x00000153
	cmpeq r1, r0
	bne _02309F44
	mov r0, r7
	bl ov29_022E550C
	mov r0, #0
	strb r0, [r7, #0x22]
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x10]
	mov r2, #0
	strb r2, [r4, #0x162 + APPLY_DAMAGE_OFFSET]
	mov r0, #1
	strb r0, [r4, #0x156 + APPLY_DAMAGE_OFFSET]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x4a + APPLY_DAMAGE_OFFSET]
	strh r1, [r0, #0x46 + APPLY_DAMAGE_OFFSET]
	ldrh r1, [r0, #0x4c + APPLY_DAMAGE_OFFSET]
	strh r1, [r0, #0x48 + APPLY_DAMAGE_OFFSET]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, [r0]
	strneb r2, [r1, #0x799]
	ldrne r0, [r0]
	strneb r2, [r0, #0x78d]
	add r0, r4, #0x62
	bl ItemZInit
	ldrb r0, [r4, #0xd8]
	cmp r0, #3
	bne _02309EC0
	mov r0, r8
	mov r1, r7
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	b _02309EDC
_02309EC0:
	cmp r0, #2
	bne _02309EDC
	mov r0, r8
	mov r1, r7
	mov r2, #2
	mov r3, #1
	bl EndCurseClassStatus
_02309EDC:
	mov r0, r7
	bl ov29_023159D4
	mov r0, r4
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, r7
	bl RestorePpAllMovesSetFlags
	mov r0, r7
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
	mov r0, r7
	bl UpdateStatusIconFlags
	mov r0, #1
	mov r1, r7
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	ldr r1, _0230A01C ; =0x00000C4C
	bl LogMessageByIdWithPopup
	mov r0, r7
	bl ov29_0230D628
	mov r0, #0
	b _0230A918
_02309F44:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0230A224
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0230A224
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldreqsh r1, [r4, #0x66]
	ldreq r0, _0230A020 ; =0x00000159
	cmpeq r1, r0
	bne _0230A224
	mov sl, #0
	mov sb, sl
	ldr r6, _02309FFC ; =DUNGEON_PTR
#endif
	b _0230A090
	.align 2, 0
#ifdef JAPAN
#define APPLY_DAMAGE_DATA_OFFSET -0x2C1
#else
#define APPLY_DAMAGE_DATA_OFFSET 0
#endif
_02309F98: .word SET_DAMAGE_STATUS_DAMAGE
_02309F9C: .word 0x00000C46 + APPLY_DAMAGE_DATA_OFFSET
_02309FA0: .word 0x0000024D
_02309FA4: .word 0x0000270F
#ifdef JAPAN
_0230B540: .word 0x0000097F
#else
_02309FA8: .word 0x00000C41
#endif
_02309FAC: .word TYPE_DAMAGE_NEGATING_EXCLUSIVE_ITEM_EFFECTS
_02309FB0: .word ov10_022C45C4
_02309FB4: .word 0x00000C42 + APPLY_DAMAGE_DATA_OFFSET
_02309FB8: .word 0x00000C43 + APPLY_DAMAGE_DATA_OFFSET
_02309FBC: .word 0x00000C44 + APPLY_DAMAGE_DATA_OFFSET
_02309FC0: .word 0x00000C45 + APPLY_DAMAGE_DATA_OFFSET
_02309FC4: .word 0x00000C47 + APPLY_DAMAGE_DATA_OFFSET
_02309FC8: .word ov29_023535D4
_02309FCC: .word 0x000002B6
_02309FD0: .word 0x00000C48 + APPLY_DAMAGE_DATA_OFFSET
_02309FD4: .word 0x000003E7
_02309FD8: .word DAMAGE_STRING_IDS
_02309FDC: .word 0x0000025F
_02309FE0: .word 0x00000C49 + APPLY_DAMAGE_DATA_OFFSET
_02309FE4: .word 0x00000C4A + APPLY_DAMAGE_DATA_OFFSET
_02309FE8: .word ov10_022C4834
_02309FEC: .word ov10_022C45FC
_02309FF0: .word 0x00000C4B + APPLY_DAMAGE_DATA_OFFSET
_02309FF4: .word ov29_02353220
_02309FF8: .word ov29_0235321C
_02309FFC: .word DUNGEON_PTR
_0230A000: .word ov29_02353228
_0230A004: .word ov29_02353234
_0230A008: .word ov29_0235322C
_0230A00C: .word ov29_02353224
_0230A010: .word ov29_02353230
#ifndef EUROPE
_0230A014: .word ov29_02353218
#endif
_0230A018: .word 0x00000153
_0230A01C: .word 0x00000C4C + APPLY_DAMAGE_DATA_OFFSET
_0230A020: .word 0x00000159
_0230A024:
#ifdef EUROPE
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	mov r0, r6
	bl EntityIsValid__02308FBC
	cmp r0, #0
	cmpne r6, sb
	beq _0230AAA8
	mov r0, sb
	mov r1, r6
	bl CanSeeTarget
	cmp r0, #0
	beq _0230AAA8
	ldrsh r1, [r6, #4]
	ldrsh r0, [sb, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _0230AAA8
	ldrsh r1, [r6, #6]
	ldrsh r0, [sb, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _0230AAB4
_0230AAA8:
	add r5, r5, #1
_0230A090:
	cmp r5, #4
	blt _0230A024
_0230AAB4:
	cmp r5, #4
	beq _0230AC40_EU
	mov r0, sb
	bl ov29_022E550C
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrh r2, [r6, #4]
	ldrh r1, [r6, #6]
	mov r0, r6
	strh r2, [sp, #0x18]
	strh r1, [sp, #0x1a]
	mov r2, sb
	mov r1, #0x260
	bl HandleFaint
	ldrsh r1, [sp, #0x18]
	ldrsh r2, [sp, #0x1a]
	mov r0, sb
	mov r3, #1
	bl MoveMonsterToPos
	mov r0, sb
	mov r1, #0
	bl UpdateEntityPixelPos
	mov r0, #0
	strb r0, [sb, #0x22]
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, sb
	strh r1, [r7, #0x10]
	bl ov29_022E66D8
	mov r2, #0
	strb r2, [r7, #0x162]
	mov r0, #1
	strb r0, [r7, #0x156]
	add r0, r7, #0x100
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
	ldrb r0, [r7, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, [r0]
	strneb r2, [r1, #0x799]
	ldrne r0, [r0]
	strneb r2, [r0, #0x78d]
	add r0, r7, #0x62
	bl ItemZInit
	ldrb r0, [r7, #0xd8]
	cmp r0, #3
	bne _0230ABAC
	mov r0, sl
	mov r1, sb
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	b _0230ABC8
_0230ABAC:
	cmp r0, #2
	bne _0230ABC8
	mov r0, sl
	mov r1, sb
	mov r2, #2
	mov r3, #1
	bl EndCurseClassStatus
_0230ABC8:
	mov r0, sb
	bl ov29_023159D4
	mov r0, r7
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, sb
	bl RestorePpAllMovesSetFlags
	mov r0, sb
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	ldr r1, _0230A920 ; =0x00000C4D
	bl LogMessageByIdWithPopup
	mov r0, sb
	bl ov29_0230D628
	mov r0, #0
	b _0230A918
_0230AC40_EU:
	mov r0, sb
	mov r1, #0x16
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230B04C
	ldrb r0, [r7, #0x62]
	mov r5, #0
	mov r6, r5
	tst r0, #1
	movne r0, #1
	moveq r0, r5
	tst r0, #0xff
	beq _0230ACB8
	mov r0, sb
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230ACB8
	ldrb r0, [r7, #0x62]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0230ACB8
	ldrsh r0, [r7, #0x66]
	cmp r0, #0x49
	addeq r5, r7, #0x62
	beq _0230ACB8
	cmp r0, #0x69
	addeq r6, r7, #0x62
_0230ACB8:
	cmp r5, #0
	ldreqb r0, [r7, #6]
	cmpeq r0, #0
	bne _0230AD44
	ldr r0, _0230A924 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr ip, [r0]
	mov lr, #6
	b _0230AD3C
_0230ACDC:
	mul r0, r2, lr
	ldr r1, [ip, #0x384]
	add r3, r1, r0
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0230AD38
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldreqb r0, [r3, #1]
	cmpeq r0, #0
	bne _0230AD38
	ldrsh r0, [r3, #4]
	cmp r0, #0x49
	moveq r5, r3
	beq _0230AD44
	cmp r6, #0
	cmpeq r0, #0x69
	moveq r6, r3
_0230AD38:
	add r2, r2, #1
_0230AD3C:
	cmp r2, #0x32
	blt _0230ACDC
_0230AD44:
	cmp r5, #0
	beq _0230AE8C
	cmp fp, #0
	beq _0230AD68
	ldr r0, _0230B394 ; =0x02353E44
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
_0230AD68:
	mov r0, sb
	bl ov29_022FBD24
	mov r0, sb
	bl ov29_022E550C
	mov r0, r5
	bl ov29_0230D688
	mov r0, #0
	strb r0, [sb, #0x22]
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r7, #0x10]
	mov r2, #0
	strb r2, [r7, #0x162]
	mov r0, #1
	strb r0, [r7, #0x156]
	add r0, r7, #0x100
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
	ldrb r0, [r7, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, [r0]
	strneb r2, [r1, #0x799]
	ldrne r0, [r0]
	strneb r2, [r0, #0x78d]
	ldrb r0, [r7, #0xd8]
	cmp r0, #3
	bne _0230AE08
	mov r0, sl
	mov r1, sb
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	b _0230AE24
_0230AE08:
	cmp r0, #2
	bne _0230AE24
	mov r0, sl
	mov r1, sb
	mov r2, #2
	mov r3, #1
	bl EndCurseClassStatus
_0230AE24:
	mov r0, sb
	bl ov29_023159D4
	mov r0, r7
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, sb
	bl RestorePpAllMovesSetFlags
	mov r0, sb
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
	mov r1, sb
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	ldr r1, _0230A01C ; =0x00000C4C
	bl LogMessageByIdWithPopup
	mov r0, sb
	bl ov29_0230D628
	mov r0, #0
	b _0230A918
_0230AE8C:
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0230B030
	cmp r6, #0
	beq _0230B030
	cmp fp, #0
	beq _0230AEC4
	ldr r0, _0230B394 ; =0x02353E44
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
_0230AEC4:
	bl ov29_022EAF20
	ldrb r1, [r7, #0xd8]
	mov r4, r0
	cmp r1, #2
	bne _0230AEEC
	ldrb r2, [r7, #0xd8]
	mov r0, sb
	mov r1, sb
	mov r3, #0
	bl EndCurseClassStatus
_0230AEEC:
	mov r0, #0
	mov r1, #0x69
	bl ov29_02344B9C
	mov r0, #1
	mov r1, #0x49
	bl ov29_02344B9C
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	bl ov29_022EFB20
	mov r0, sb
	bl ov29_022E550C
	mov r0, r6
	bl ov29_0230D688
	mov r0, #0
	strb r0, [sb, #0x22]
	mov r0, #1
	strb r0, [r7, #0x23d]
	mov r0, sb
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sb
	bl ov29_02304830
	mov r0, #1
	mov r1, sb
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	ldr r1, _0230A01C ; =0x00000C4C
	bl LogMessageByIdWithPopup
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #1
	bl ov29_022F0534
	ldr r0, _0230A928 ; =0x00000C6A
	bl ov29_022F0780
	mov r0, sb
	mov r1, #0xb
	bl ov29_02304830
	ldr r0, _0230A92C ; =0x00000C6B
	mov r1, sb
	mov r2, #0
	bl ov29_022F0604
	mov r0, #4
	bl ov29_022EAF34
	mov r0, sb
	bl ov29_022F0518
	mov r0, sb
	mov r1, #6
	bl ov29_02304830
	ldr r0, _0230A930 ; =0x00000C6C
	bl ov29_022F0780
	bl ov29_022F05E4
	mov r0, #1
	bl ov29_022EFB84
	mov r0, #1
	strb r0, [sb, #0x22]
	mov r0, #0
	strb r0, [r7, #0x23d]
	mov r0, sl
	ldr r1, _0230A934 ; =0x00000C6D
	bl LogMessageByIdWithPopup
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, #0
	bl ov29_022F0534
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd6]
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
	mov r0, r4
	bl ov29_022EAF34
	mov r0, sb
	bl ov29_0230D628
	b _0230B04C
_0230B030:
	cmp fp, #0
	beq _0230B04C
	ldr r0, _0230B3A8 ; =0x02353E40
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopup
_0230B04C:
	ldrb r0, [r7, #7]
	cmp r0, #0
	bne _0230B108
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230B0FC
	ldrb r0, [r7, #6]
	cmp r0, #0
	beq _0230B0E8
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _0230B0B4
	mov r0, r7
	bl ov29_022FBDE0
	cmp r0, #0
	beq _0230B0B4
	ldrb r0, [r7, #0x62]
	tst r0, #0x40
	bicne r1, r0, #0x40
	andne r0, r1, #0xff
	orrne r0, r0, #0x80
	strneb r0, [r7, #0x62]
_0230B0B4:
	mov r0, sb
	add r1, sb, #4
	add r2, r7, #0x62
	mov r3, #1
	bl SpawnDroppedItemWrapper
	cmp r0, #0
	beq _0230B0F0
	ldrb r0, [r7, #0x62]
	tst r0, #0x80
	beq _0230B0F0
	mov r0, #1
	bl ov29_0234969C
	b _0230B0F0
_0230B0E8:
	add r0, r7, #0x62
	bl RemoveHolderForItemInBag
_0230B0F0:
	add r0, r7, #0x62
	bl ItemZInit
	b _0230B108
_0230B0FC:
	mov r0, sl
	mov r1, sb
	bl TrySpawnEnemyItemDrop
_0230B108:
	ldrb r0, [r7, #0x100]
	mov r4, #0
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, _02309FD4 ; =0x000003E7
	ldrne r0, [r0]
	addne r0, r0, #0x700
	strneh r1, [r0, #0x96]
	ldr r0, [sl]
	cmp r0, #1
	bne _0230B268
	ldrsh r0, [r7, #2]
	ldrb r1, [r7, #0xa]
	ldr r6, [sl, #0xb4]
	bl GetExp
	mov r5, r0
	mov r0, r7
	bl ov29_02303E0C
	cmp r0, #0
	bne _0230B268
	ldrb r0, [r7, #0x100]
	cmp r0, #0
	beq _0230B180
	add r0, r7, #0x100
	ldrsh r2, [r0, #0x68]
	mov r0, #0xc
	ldr r1, _0230A938 ; =ov10_022C593C
	smulbb r0, r2, r0
	ldrsh r5, [r1, r0]
	b _0230B1AC
_0230B180:
	ldrb r0, [r7, #0x108]
	cmp r0, #0
	addeq r0, r5, r5, lsr #31
	moveq r5, r0, asr #1
	beq _0230B1A4
	cmp r0, #2
	addeq r0, r5, r5, lsl #1
	addeq r0, r0, r0, lsr #31
	moveq r5, r0, asr #1
_0230B1A4:
	cmp r5, #0
	moveq r5, #1
_0230B1AC:
	ldrb r0, [r7, #0xfd]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6, #0x155]
	ldr r0, [sp, #0x88]
	cmp r0, #1
	bne _0230B268
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230B240
	ldrb r0, [r7, #6]
	cmp r0, #0
	beq _0230B268
	mov r0, sl
	mov r1, sl
	mov r2, r5
	bl AddExpSpecial
	ldr r6, _02309FFC ; =DUNGEON_PTR
	mov r4, #0
_0230B1F8:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__02308FBC
	cmp r0, #0
	cmpne r7, sl
	beq _0230B22C
	mov r0, sl
	mov r1, r7
	mov r2, r5
	bl AddExpSpecial
_0230B22C:
	add r4, r4, #1
	cmp r4, #4
	blt _0230B1F8
	mov r4, #1
	b _0230B268
_0230B240:
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl CanEnemyEvolve
	cmp r0, #0
	movne r1, #1
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	strneb r1, [r6, #0x153]
	ldrne r0, [r0]
	strneb r1, [r0, #0xf]
_0230B268:
	mov r0, sl
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230B290
	ldr r0, [sl]
	cmp r0, #1
	ldreq r0, [sl, #0xb4]
	ldreqb r0, [r0, #7]
	cmpeq r0, #0
	moveq r4, #0
_0230B290:
	cmp r4, #0
	beq _0230B338
	add r0, sp, #0x1c
	mov r1, sb
	bl ov29_022F9058
	mov r0, sl
	mov r1, sb
	bl RecruitCheck
	cmp r0, #0
	beq _0230B314
	add r2, sp, #0x1c
	mov r0, sl
	mov r1, sb
	bl TryRecruit
	cmp r0, #0
	bne _0230B304
	mov r0, sb
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230A8F4
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl AftermathCheck
	mov r0, sb
	mov r2, sl
	mov r1, #0x234
	bl HandleFaint
	b _0230A8F4
_0230B304:
	ldr r0, _0230A93C ; =ov29_0237CA6C
	mov r1, #1
	strb r1, [r0]
	b _0230A8F4
_0230B314:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl AftermathCheck
	mov r0, sb
	mov r1, r8
	mov r2, sl
	bl HandleFaint
	b _0230A8F4
_0230B338:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl AftermathCheck
	mov r0, sl
	bl ov29_022ECD84
	mov r0, sb
	mov r1, r8
	mov r2, sl
#else
	ldr r0, [r6]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb28 + APPLY_DAMAGE_OFFSET_2]
	mov r0, sl
	bl EntityIsValid__02308FBC
	cmp r0, #0
	cmpne sl, r7
	beq _0230A08C
	mov r0, r7
	mov r1, sl
	bl CanSeeTarget
	cmp r0, #0
	beq _0230A08C
	ldrsh r1, [sl, #4]
	ldrsh r0, [r7, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _0230A08C
	ldrsh r1, [sl, #6]
	ldrsh r0, [r7, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _0230A098
_0230A08C:
	add sb, sb, #1
_0230A090:
	cmp sb, #4
	blt _0230A024
_0230A098:
	cmp sb, #4
	beq _0230A224
	mov r0, r7
	bl ov29_022E550C
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrh r2, [sl, #4]
	ldrh r1, [sl, #6]
	mov r0, sl
	strh r2, [sp, #0x18]
	strh r1, [sp, #0x1a]
	mov r2, r7
	mov r1, #0x260
	bl HandleFaint
	ldrsh r1, [sp, #0x18]
	ldrsh r2, [sp, #0x1a]
	mov r0, r7
	mov r3, #1
	bl MoveMonsterToPos
	mov r0, r7
	mov r1, #0
	bl UpdateEntityPixelPos
	mov r0, #0
	strb r0, [r7, #0x22]
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r7
	strh r1, [r4, #0x10]
	bl ov29_022E66D8
	mov r2, #0
	strb r2, [r4, #0x162 + APPLY_DAMAGE_OFFSET]
	mov r0, #1
	strb r0, [r4, #0x156 + APPLY_DAMAGE_OFFSET]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x4a + APPLY_DAMAGE_OFFSET]
	strh r1, [r0, #0x46 + APPLY_DAMAGE_OFFSET]
	ldrh r1, [r0, #0x4c + APPLY_DAMAGE_OFFSET]
	strh r1, [r0, #0x48 + APPLY_DAMAGE_OFFSET]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, [r0]
	strneb r2, [r1, #0x799]
	ldrne r0, [r0]
	strneb r2, [r0, #0x78d]
	add r0, r4, #0x62
	bl ItemZInit
	ldrb r0, [r4, #0xd8]
	cmp r0, #3
	bne _0230A190
	mov r0, r8
	mov r1, r7
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	b _0230A1AC
_0230A190:
	cmp r0, #2
	bne _0230A1AC
	mov r0, r8
	mov r1, r7
	mov r2, #2
	mov r3, #1
	bl EndCurseClassStatus
_0230A1AC:
	mov r0, r7
	bl ov29_023159D4
	mov r0, r4
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, r7
	bl RestorePpAllMovesSetFlags
	mov r0, r7
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
	mov r0, r7
	bl UpdateStatusIconFlags
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sl
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	ldr r1, _0230A920 ; =0x00000C4D
	bl LogMessageByIdWithPopup
	mov r0, r7
	bl ov29_0230D628
	mov r0, #0
	b _0230A918
_0230A224:
	mov r0, r7
	mov r1, #0x16
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230A5E0
	ldrb r0, [r4, #0x62]
	mov r6, #0
	mov sb, r6
	tst r0, #1
	movne r0, #1
	moveq r0, r6
	tst r0, #0xff
	beq _0230A29C
	mov r0, r7
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230A29C
	ldrb r0, [r4, #0x62]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0230A29C
	ldrsh r0, [r4, #0x66]
	cmp r0, #0x49
	addeq r6, r4, #0x62
	beq _0230A29C
	cmp r0, #0x69
	addeq sb, r4, #0x62
_0230A29C:
	cmp r6, #0
	ldreqb r0, [r4, #6]
	cmpeq r0, #0
	bne _0230A330
	ldr r0, _0230A924 ; =BAG_ITEMS_PTR_MIRROR
	mov sl, #0
	ldr ip, [r0]
	mov lr, sl
	mov r1, #1
	mov r0, #6
	b _0230A328
_0230A2C8:
	mul r2, sl, r0
	ldr r3, [ip, #0x384]
	add fp, r3, r2
	ldrb r2, [r3, r2]
	tst r2, #1
	movne r3, r1
	moveq r3, lr
	tst r3, #0xff
	beq _0230A324
	tst r2, #8
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	ldreqb r2, [fp, #1]
	cmpeq r2, #0
	bne _0230A324
	ldrsh r2, [fp, #4]
	cmp r2, #0x49
	moveq r6, fp
	beq _0230A330
	cmp sb, #0
	cmpeq r2, #0x69
	moveq sb, fp
_0230A324:
	add sl, sl, #1
_0230A328:
	cmp sl, #0x32
	blt _0230A2C8
_0230A330:
	cmp r6, #0
	beq _0230A45C
#ifndef JAPAN
	mov r0, r7
	bl ov29_022FBD24
#endif
	mov r0, r7
	bl ov29_022E550C
	mov r0, r6
	bl ov29_0230D688
	mov r0, #0
	strb r0, [r7, #0x22]
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02309FD4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x10]
	mov r2, #0
	strb r2, [r4, #0x162 + APPLY_DAMAGE_OFFSET]
	mov r0, #1
	strb r0, [r4, #0x156 + APPLY_DAMAGE_OFFSET]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x4a + APPLY_DAMAGE_OFFSET]
	strh r1, [r0, #0x46 + APPLY_DAMAGE_OFFSET]
	ldrh r1, [r0, #0x4c + APPLY_DAMAGE_OFFSET]
	strh r1, [r0, #0x48 + APPLY_DAMAGE_OFFSET]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, [r0]
	strneb r2, [r1, #0x799]
	ldrne r0, [r0]
	strneb r2, [r0, #0x78d]
	ldrb r0, [r4, #0xd8]
	cmp r0, #3
	bne _0230A3D8
	mov r0, r8
	mov r1, r7
	mov r2, #3
	mov r3, #1
	bl EndCurseClassStatus
	b _0230A3F4
_0230A3D8:
	cmp r0, #2
	bne _0230A3F4
	mov r0, r8
	mov r1, r7
	mov r2, #2
	mov r3, #1
	bl EndCurseClassStatus
_0230A3F4:
#ifdef JAPAN
	mov r0, r7
	bl ov29_02307DC0
#endif
	mov r0, r7
	bl ov29_023159D4
	mov r0, r4
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, r7
	bl RestorePpAllMovesSetFlags
	mov r0, r7
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
	mov r0, r7
	bl UpdateStatusIconFlags
	mov r0, #1
	mov r1, r7
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	ldr r1, _0230A01C ; =0x00000C4C
	bl LogMessageByIdWithPopup
	mov r0, r7
	bl ov29_0230D628
	mov r0, #0
	b _0230A918
_0230A45C:
#ifndef JAPAN
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0230A5E0
#endif
	cmp sb, #0
	beq _0230A5E0
	bl ov29_022EAF20
	ldrb r1, [r4, #0xd8]
	mov r6, r0
	cmp r1, #2
	bne _0230A4A0
	ldrb r2, [r4, #0xd8]
	mov r0, r7
	mov r1, r7
	mov r3, #0
	bl EndCurseClassStatus
_0230A4A0:
	mov r0, #0
	mov r1, #0x69
	bl ov29_02344B9C
	mov r0, #1
	mov r1, #0x49
	bl ov29_02344B9C
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	bl ov29_022EFB20
	mov r0, r7
	bl ov29_022E550C
	mov r0, sb
	bl ov29_0230D688
	mov r0, #0
	strb r0, [r7, #0x22]
	mov r0, #1
	strb r0, [r4, #0x23d + APPLY_DAMAGE_OFFSET]
	mov r0, r7
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r7
	bl ov29_02304830
	mov r0, #1
	mov r1, r7
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	ldr r1, _0230A01C ; =0x00000C4C
	bl LogMessageByIdWithPopup
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #1
	bl ov29_022F0534
	ldr r0, _0230A928 ; =0x00000C6A
	bl ov29_022F0780
	mov r0, r7
	mov r1, #0xb
	bl ov29_02304830
	ldr r0, _0230A92C ; =0x00000C6B
	mov r1, r7
	mov r2, #0
	bl ov29_022F0604
	mov r0, #4
	bl ov29_022EAF34
	mov r0, r7
	bl ov29_022F0518
	mov r0, r7
	mov r1, #6
	bl ov29_02304830
	ldr r0, _0230A930 ; =0x00000C6C
	bl ov29_022F0780
	bl ov29_022F05E4
	mov r0, #1
	bl ov29_022EFB84
	mov r0, #1
	strb r0, [r7, #0x22]
	mov r0, #0
	strb r0, [r4, #0x23d + APPLY_DAMAGE_OFFSET]
	mov r0, r8
	ldr r1, _0230A934 ; =0x00000C6D
	bl LogMessageByIdWithPopup
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, #0
	bl ov29_022F0534
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd6 + APPLY_DAMAGE_OFFSET_2]
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
	mov r0, r6
	bl ov29_022EAF34
	mov r0, r7
	bl ov29_0230D628
_0230A5E0:
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _0230A69C
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230A690
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0230A67C
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _0230A648
	mov r0, r4
	bl ov29_022FBDE0
	cmp r0, #0
	beq _0230A648
	ldrb r0, [r4, #0x62]
	tst r0, #0x40
	bicne r1, r0, #0x40
	andne r0, r1, #0xff
	orrne r0, r0, #0x80
	strneb r0, [r4, #0x62]
_0230A648:
	mov r0, r7
	add r1, r7, #4
	add r2, r4, #0x62
	mov r3, #1
	bl SpawnDroppedItemWrapper
	cmp r0, #0
	beq _0230A684
	ldrb r0, [r4, #0x62]
	tst r0, #0x80
	beq _0230A684
	mov r0, #1
	bl ov29_0234969C
	b _0230A684
_0230A67C:
	add r0, r4, #0x62
	bl RemoveHolderForItemInBag
_0230A684:
	add r0, r4, #0x62
	bl ItemZInit
	b _0230A69C
_0230A690:
	mov r0, r8
	mov r1, r7
	bl TrySpawnEnemyItemDrop
_0230A69C:
	ldrb r0, [r4, #0x100]
	mov r6, #0
	cmp r0, #0
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	ldrne r1, _02309FD4 ; =0x000003E7
	ldrne r0, [r0]
	addne r0, r0, #0x700
	strneh r1, [r0, #0x96]
	ldr r0, [r8]
	cmp r0, #1
	bne _0230A7FC
	ldrsh r0, [r4, #2]
	ldrb r1, [r4, #0xa]
	ldr sl, [r8, #0xb4]
	bl GetExp
	mov sb, r0
	mov r0, r4
	bl ov29_02303E0C
	cmp r0, #0
	bne _0230A7FC
	ldrb r0, [r4, #0x100]
	cmp r0, #0
	beq _0230A714
	add r0, r4, #0x100
	ldrsh r2, [r0, #0x68 + APPLY_DAMAGE_OFFSET]
	mov r0, #0xc
	ldr r1, _0230A938 ; =ov10_022C593C
	smulbb r0, r2, r0
	ldrsh sb, [r1, r0]
	b _0230A740
_0230A714:
#ifdef JAPAN
	ldrb r0, [r4, #0x107]
#else
	ldrb r0, [r4, #0x108]
#endif
	cmp r0, #0
	addeq r0, sb, sb, lsr #31
	moveq sb, r0, asr #1
	beq _0230A738
	cmp r0, #2
	addeq r0, sb, sb, lsl #1
	addeq r0, r0, r0, lsr #31
	moveq sb, r0, asr #1
_0230A738:
	cmp sb, #0
	moveq sb, #1
_0230A740:
	ldrb r0, [r4, #0xfd]
	cmp r0, #0
	movne r0, #1
	strneb r0, [sl, #0x155 + APPLY_DAMAGE_OFFSET]
	ldr r0, [sp, #0x88]
	cmp r0, #1
	bne _0230A7FC
	ldrb r0, [sl, #6]
	cmp r0, #0
	bne _0230A7D4
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0230A7FC
	mov r0, r8
	mov r1, r8
	mov r2, sb
	bl AddExpSpecial
	ldr r6, _02309FFC ; =DUNGEON_PTR
	mov r4, #0
_0230A78C:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb28 + APPLY_DAMAGE_OFFSET_2]
	mov r0, sl
	bl EntityIsValid__02308FBC
	cmp r0, #0
	cmpne sl, r8
	beq _0230A7C0
	mov r0, r8
	mov r1, sl
	mov r2, sb
	bl AddExpSpecial
_0230A7C0:
	add r4, r4, #1
	cmp r4, #4
	blt _0230A78C
	mov r6, #1
	b _0230A7FC
_0230A7D4:
	ldr r0, _02309FFC ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl CanEnemyEvolve
	cmp r0, #0
	movne r1, #1
	ldrne r0, _02309FFC ; =DUNGEON_PTR
	strneb r1, [sl, #0x153 + APPLY_DAMAGE_OFFSET]
	ldrne r0, [r0]
	strneb r1, [r0, #0xf]
_0230A7FC:
	mov r0, r8
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230A824
	ldr r0, [r8]
	cmp r0, #1
	ldreq r0, [r8, #0xb4]
	ldreqb r0, [r0, #7]
	cmpeq r0, #0
	moveq r6, #0
_0230A824:
	cmp r6, #0
	beq _0230A8CC
	add r0, sp, #0x1c
	mov r1, r7
	bl ov29_022F9058
	mov r0, r8
	mov r1, r7
	bl RecruitCheck
	cmp r0, #0
	beq _0230A8A8
	add r2, sp, #0x1c
	mov r0, r8
	mov r1, r7
	bl TryRecruit
	cmp r0, #0
	bne _0230A898
	mov r0, r7
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230A8F4
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl AftermathCheck
	mov r0, r7
	mov r2, r8
	mov r1, #0x234
	bl HandleFaint
	b _0230A8F4
_0230A898:
	ldr r0, _0230A93C ; =ov29_0237CA6C
	mov r1, #1
	strb r1, [r0]
	b _0230A8F4
_0230A8A8:
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl AftermathCheck
	mov r0, r7
	mov r1, r5
	mov r2, r8
	bl HandleFaint
	b _0230A8F4
_0230A8CC:
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl AftermathCheck
	mov r0, r8
	bl ov29_022ECD84
	mov r0, r7
	mov r1, r5
	mov r2, r8
#endif
	bl HandleFaint
_0230A8F4:
	ldr r0, _0230A93C ; =ov29_0237CA6C
	ldrb r0, [r0]
	cmp r0, #0
	bne _0230A914
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0230A914
	bl ov29_0233847C
_0230A914:
	mov r0, #1
_0230A918:
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230A920: .word 0x00000C4D + APPLY_DAMAGE_DATA_OFFSET
_0230A924: .word BAG_ITEMS_PTR_MIRROR
#ifdef EUROPE
_0230B394: .word 0x02353E44
#endif
_0230A928: .word 0x00000C6A + APPLY_DAMAGE_DATA_OFFSET
_0230A92C: .word 0x00000C6B + APPLY_DAMAGE_DATA_OFFSET
_0230A930: .word 0x00000C6C + APPLY_DAMAGE_DATA_OFFSET
_0230A934: .word 0x00000C6D + APPLY_DAMAGE_DATA_OFFSET
#ifdef EUROPE
_0230B3A8: .word 0x02353E40
#endif
_0230A938: .word ov10_022C593C
_0230A93C: .word ov29_0237CA6C
	arm_func_end ApplyDamage

	arm_func_start DefenderAbilityIsActive__0230A940
DefenderAbilityIsActive__0230A940: ; 0x0230A940
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	cmp r6, r5
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
#endif
	beq _0230A984
	bl IsMonster__0230A994
	cmp r0, #0
#ifdef JAPAN
	beq _0230A984
	mov r0, r6
#else
	cmpne r4, #0
	beq _0230A984
	mov r0, r7
#endif
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
#ifdef JAPAN
	ldmneia sp!, {r4, r5, r6, pc}
_0230A984:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0230A984:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end DefenderAbilityIsActive__0230A940
