	.include "asm/macros.inc"
	.include "overlay_29_02308FE0.inc"

	.text

	arm_func_start ApplyDamage
ApplyDamage: ; 0x02308FE0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x64
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
	ldreq r0, _02309F98 ; =ov10_022C4598
	ldreqsh r0, [r0]
	streq r0, [r6]
	ldr r0, [r8]
	cmp r0, #1
	bne _02309134
	mov r0, r8
	mov r1, r7
	mov r2, #0x73
	mov r3, #1
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
	mov r3, #1
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
	mov r0, r8
	mov r1, r7
	mov r2, #0xc40
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
	ldr r2, _02309FA8 ; =0x00000C41
	mov r0, r8
	mov r1, r7
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
	mov r3, #1
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
	mov r3, #1
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
	mov r3, #1
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
	mov r3, #1
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
	ldr sl, _02309FAC ; =ov29_023528A4
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
	ldrb r0, [r4, #0x15c]
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
	ldrb r0, [r4, #0x15c]
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
	ldrb r0, [r4, #0x15c]
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
	ldrb r0, [r4, #0x15c]
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
	ldrlt r0, _02309FD8 ; =ov29_02353330
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
	bl ov29_022EA718
_023097BC:
	ldrb r0, [r4, #0x15c]
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
	ldrb r0, [r4, #0x15c]
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
	bl ov29_023049A8
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
	mov r0, r7
	bl UpdateStatusIconFlags
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
	bl ov29_023049A8
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
	strb r0, [r4, #0x156]
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
	ldr r0, _02309FFC ; =ov29_02353538
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
	ldr r0, _02309FFC ; =ov29_02353538
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
	strb r2, [r4, #0x162]
	mov r0, #1
	strb r0, [r4, #0x156]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =ov29_02353538
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
	bl GetSleepAnimationId
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
	ldr r6, _02309FFC ; =ov29_02353538
	b _0230A090
	.align 2, 0
_02309F98: .word ov10_022C4598
_02309F9C: .word 0x00000C46
_02309FA0: .word 0x0000024D
_02309FA4: .word 0x0000270F
_02309FA8: .word 0x00000C41
_02309FAC: .word ov29_023528A4
_02309FB0: .word ov10_022C45C4
_02309FB4: .word 0x00000C42
_02309FB8: .word 0x00000C43
_02309FBC: .word 0x00000C44
_02309FC0: .word 0x00000C45
_02309FC4: .word 0x00000C47
_02309FC8: .word ov29_023535D4
_02309FCC: .word 0x000002B6
_02309FD0: .word 0x00000C48
_02309FD4: .word 0x000003E7
_02309FD8: .word ov29_02353330
_02309FDC: .word 0x0000025F
_02309FE0: .word 0x00000C49
_02309FE4: .word 0x00000C4A
_02309FE8: .word ov10_022C4834
_02309FEC: .word ov10_022C45FC
_02309FF0: .word 0x00000C4B
_02309FF4: .word ov29_02353220
_02309FF8: .word ov29_0235321C
_02309FFC: .word ov29_02353538
_0230A000: .word ov29_02353228
_0230A004: .word ov29_02353234
_0230A008: .word ov29_0235322C
_0230A00C: .word ov29_02353224
_0230A010: .word ov29_02353230
_0230A014: .word ov29_02353218
_0230A018: .word 0x00000153
_0230A01C: .word 0x00000C4C
_0230A020: .word 0x00000159
_0230A024:
	ldr r0, [r6]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb28]
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
	strb r2, [r4, #0x162]
	mov r0, #1
	strb r0, [r4, #0x156]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =ov29_02353538
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
	bl GetSleepAnimationId
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
	mov r0, r7
	bl ov29_022FBD24
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
	strb r2, [r4, #0x162]
	mov r0, #1
	strb r0, [r4, #0x156]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	ldrh r1, [r0, #0x4c]
	strh r1, [r0, #0x48]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldrne r0, _02309FFC ; =ov29_02353538
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
	mov r0, r7
	bl ov29_023159D4
	mov r0, r4
	mov r1, #0
	bl SubInitMonster
	bl ov10_022BDC68
	mov r0, r7
	bl RestorePpAllMovesSetFlags
	mov r0, r7
	bl GetSleepAnimationId
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
	ldr r0, _02309FFC ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0230A5E0
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
	strb r0, [r4, #0x23d]
	mov r0, r7
	bl GetSleepAnimationId
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
	strb r0, [r4, #0x23d]
	mov r0, r8
	ldr r1, _0230A934 ; =0x00000C6D
	bl LogMessageByIdWithPopup
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, #0
	bl ov29_022F0534
	ldr r0, _02309FFC ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd6]
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
	bl sub_0200FB54
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
	ldrne r0, _02309FFC ; =ov29_02353538
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
	ldrsh r2, [r0, #0x68]
	mov r0, #0xc
	ldr r1, _0230A938 ; =ov10_022C593C
	smulbb r0, r2, r0
	ldrsh sb, [r1, r0]
	b _0230A740
_0230A714:
	ldrb r0, [r4, #0x108]
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
	strneb r0, [sl, #0x155]
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
	ldr r6, _02309FFC ; =ov29_02353538
	mov r4, #0
_0230A78C:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb28]
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
	ldr r0, _02309FFC ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl CanEnemyEvolve
	cmp r0, #0
	movne r1, #1
	ldrne r0, _02309FFC ; =ov29_02353538
	strneb r1, [sl, #0x153]
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
_0230A920: .word 0x00000C4D
_0230A924: .word BAG_ITEMS_PTR_MIRROR
_0230A928: .word 0x00000C6A
_0230A92C: .word 0x00000C6B
_0230A930: .word 0x00000C6C
_0230A934: .word 0x00000C6D
_0230A938: .word ov10_022C593C
_0230A93C: .word ov29_0237CA6C
	arm_func_end ApplyDamage

	arm_func_start DefenderAbilityIsActive__0230A940
DefenderAbilityIsActive__0230A940: ; 0x0230A940
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
	beq _0230A984
	bl IsMonster__0230A994
	cmp r0, #0
	cmpne r4, #0
	beq _0230A984
	mov r0, r7
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0230A984:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DefenderAbilityIsActive__0230A940

	arm_func_start IsMonster__0230A994
IsMonster__0230A994: ; 0x0230A994
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__0230A994

	arm_func_start ExclusiveItemEffectIsActive__0230A9B8
ExclusiveItemEffectIsActive__0230A9B8: ; 0x0230A9B8
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__0230A9B8

	arm_func_start ItemIsActive__0230A9DC
ItemIsActive__0230A9DC: ; 0x0230A9DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__0230A9DC

	arm_func_start AftermathCheck
AftermathCheck: ; 0x0230AA0C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r2
	mov r2, #0x76
	mov r3, #1
	mov r6, r0
	mov r5, r1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230AA78
	ldr r0, _0230AA84 ; =ov10_022C4594
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
_0230AA84: .word ov10_022C4594
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
	ldr fp, _0230AB50 ; =ov29_02353538
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
	ldr r0, _0230AB54 ; =ov10_022C4D14
	ldrsh r1, [sp, #2]
	add r0, r0, r2, lsl #4
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230AB4C: .word ov29_02352838
_0230AB50: .word ov29_02353538
_0230AB54: .word ov10_022C4D14
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
	ldrne r1, _0230ABEC ; =ov29_02353538
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
_0230ABEC: .word ov29_02353538
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
	ldr r1, _0230AD00 ; =ov10_022C56B0
	mov r0, #0x24
	mla r0, r5, r0, r1
	add r1, r4, r6
	ldrb r1, [r1, #0x5e]
	mov r1, r1, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230AD00: .word ov10_022C56B0
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
	mov r3, #1
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
	ldr r3, _0230B778 ; =ov10_022C4820
	str r0, [sp, #0x28]
	ldr r0, [r3]
	ldr r2, _0230B77C ; =ov10_022C4824
	str r0, [sp, #0x24]
	ldr r0, [r2]
	ldr r1, _0230B780 ; =ov10_022C482C
	str r0, [sp, #0x20]
	ldr r0, [r1]
	ldr r1, _0230B784 ; =ov10_022C4758
	str r0, [sp, #0x1c]
	ldr r0, _0230B788 ; =ov10_022C474C
	mov r4, #0
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r1]
	ldr r1, _0230B78C ; =ov10_022C481C
	str r0, [sp, #0x14]
	ldr r0, _0230B790 ; =ov10_022C4810
	ldr r0, [r0]
	str r0, [sp, #0x10]
	ldr r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _0230B794 ; =ov10_022C4818
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
	ldr r0, _0230B798 ; =ov29_02353538
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r4, [sp, #0x34]
	ldr r2, [r0]
	ldr r1, _0230B79C ; =ov10_022C4D14
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
	ldr r1, _0230B7A0 ; =ov10_022C47C0
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
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	bne _0230B064
	mov r0, sl
	mov r1, sb
	mov r2, #0x6e
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B080
_0230B064:
	ldr r0, [r7, #8]
	cmp r0, #3
	bne _0230B080
	ldr r2, _0230B7A4 ; =ov29_02352864
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
_0230B080:
	mov r0, sb
	mov r1, #0x5a
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230B0A4
	ldr r2, _0230B7A8 ; =ov29_0235283C
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
	ldr r0, _0230B7AC ; =ov10_022C455C
	ldrsh r1, [r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	bgt _0230B104
	ldr r2, _0230B7B0 ; =ov29_02352844
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
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B14C
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7A8 ; =ov29_0235283C
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
	ldr r1, _0230B798 ; =ov29_02353538
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
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B1DC
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7A8 ; =ov29_0235283C
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
	ldr r1, _0230B798 ; =ov29_02353538
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7BC ; =ov29_0235284C
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7BC ; =ov29_0235284C
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
	mov r0, sl
	mov r1, sb
	mov r2, #0xc50
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7BC ; =ov29_0235284C
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
	ldr r2, _0230B7C4 ; =0x00000C51
	mov r0, sl
	mov r1, sb
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7BC ; =ov29_0235284C
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
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230B534
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7B0 ; =ov29_02352844
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
	ldr r1, _0230B7CC ; =ov10_022C4744
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
	ldr r1, _0230B798 ; =ov29_02353538
	mov r0, sl
	ldr r2, [r1]
	mov r3, #1
	mov r1, #0x63
	strb r3, [r2, #0x1cf]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230B5BC
	ldr r2, _0230B7BC ; =ov29_0235284C
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
	b _0230B5CC
_0230B5BC:
	ldr r2, _0230B7B0 ; =ov29_02352844
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7B0 ; =ov29_02352844
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7A8 ; =ov29_0235283C
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7A8 ; =ov29_0235283C
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7B0 ; =ov29_02352844
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
	ldr r2, _0230B7D0 ; =ov29_0235285C
	mov r0, fp
	mov r1, fp
	bl MultiplyFixedPoint64
	ldr r0, _0230B798 ; =ov29_02353538
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1c2]
_0230B6C0:
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r7, [r0]
	add r0, r7, #0xc000
	ldrb r0, [r0, #0xd5b]
	cmp r0, #0
	bne _0230B6E0
	cmp r5, #6
	bne _0230B700
_0230B6E0:
	cmp r8, #5
	bne _0230B700
	ldr r2, _0230B7A8 ; =ov29_0235283C
	mov r3, #1
	mov r0, fp
	mov r1, fp
	strb r3, [r7, #0x1d0]
	bl MultiplyFixedPoint64
_0230B700:
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r5, [r0]
	add r0, r5, #0xc000
	ldrb r0, [r0, #0xd5c]
	cmp r0, #0
	beq _0230B738
	cmp r8, #2
	bne _0230B738
	ldr r2, _0230B7A8 ; =ov29_0235283C
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
	ldr r0, _0230B798 ; =ov29_02353538
	ldr r2, _0230B7BC ; =ov29_0235284C
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
_0230B774: .word ov29_02352838
_0230B778: .word ov10_022C4820
_0230B77C: .word ov10_022C4824
_0230B780: .word ov10_022C482C
_0230B784: .word ov10_022C4758
_0230B788: .word ov10_022C474C
_0230B78C: .word ov10_022C481C
_0230B790: .word ov10_022C4810
_0230B794: .word ov10_022C4818
_0230B798: .word ov29_02353538
_0230B79C: .word ov10_022C4D14
_0230B7A0: .word ov10_022C47C0
_0230B7A4: .word ov29_02352864
_0230B7A8: .word ov29_0235283C
_0230B7AC: .word ov10_022C455C
_0230B7B0: .word ov29_02352844
_0230B7B4: .word 0x00000C3E
_0230B7B8: .word 0x000003E7
_0230B7BC: .word ov29_0235284C
_0230B7C0: .word 0x00000C4F
_0230B7C4: .word 0x00000C51
_0230B7C8: .word 0x00000C52
_0230B7CC: .word ov10_022C4744
_0230B7D0: .word ov29_0235285C
	arm_func_end CalcTypeBasedDamageEffects

	arm_func_start ov29_0230B7D4
ov29_0230B7D4: ; 0x0230B7D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r4, #1
	mov r8, r2
	mov fp, #0
	bl EntityIsValid__02308FBC
	cmp r0, #0
	moveq r0, r4
	beq _0230BB98
	mov r0, sl
	mov r1, #0x6b
	ldr r7, [sl, #0xb4]
	ldr r6, [sb, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r8, r4
	cmp r8, #1
	cmpne r8, #7
	moveq fp, #1
	cmp r8, #2
	bne _0230B84C
	mov r0, sl
	mov r1, sb
	bl FlashFireShouldActivate
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B84C:
	cmp r8, #5
	bne _0230B874
	mov r0, sl
	mov r1, sb
	mov r2, #0x23
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B874:
	cmp r8, #3
	bne _0230B89C
	mov r0, sl
	mov r1, sb
	mov r2, #0x24
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0
	bne _0230BB98
_0230B89C:
	cmp r8, #9
	bne _0230B8E0
	mov r0, sl
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230B8C8
	mov r0, sb
	bl LevitateIsActive
	cmp r0, #0
	bne _0230B8D8
_0230B8C8:
	mov r0, sb
	bl IsFloating
	cmp r0, #0
	beq _0230B8E0
_0230B8D8:
	mov r0, #1
	b _0230BB98
_0230B8E0:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl ScrappyShouldActivate
	ldr r1, _0230BBA0 ; =ov29_02352884
	str r0, [sp]
	add ip, sp, #4
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r5, #0
	b _0230B9A0
_0230B90C:
	ldr r0, [sp]
	add ip, sp, #0x14
	cmp r0, #0
	add r0, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	bne _0230B960
	cmp fp, #0
	beq _0230B960
	add r0, r6, r5
	ldrb r0, [r0, #0x5e]
	cmp r0, #0xe
	ldreqb r0, [r6, #0xfe]
	cmpeq r0, #0
	bne _0230B960
	ldr r1, _0230BBA4 ; =ov29_02353538
	mov r0, #0
	ldr r2, [r1]
	mov r1, #1
	strb r1, [r2, #0x1d4]
	b _0230B978
_0230B960:
	mov r0, sl
	mov r1, sb
	mov r2, r5, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r8
	bl GetTypeMatchup
_0230B978:
	cmp r4, #0
	beq _0230B9A8
	add r1, sp, #0x14
	ldr r0, [r1, r0, lsl #2]
	mul r0, r4, r0
	add r0, r0, r0, lsr #31
	movs r4, r0, asr #1
	moveq r0, #2
	beq _0230BB98
	add r5, r5, #1
_0230B9A0:
	cmp r5, #2
	blt _0230B90C
_0230B9A8:
	cmp r8, #2
	cmpne r8, #6
	bne _0230B9D4
	mov r0, sl
	mov r1, sb
	mov r2, #2
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #2
	bne _0230BB98
_0230B9D4:
	cmp r8, #3
	bne _0230BA1C
	mov r0, sl
	mov r1, #0x10
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BA1C
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BA1C:
	cmp r8, #4
	bne _0230BA64
	mov r0, sl
	mov r1, #0x1a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BA64
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BA64:
	cmp r8, #0xc
	bne _0230BAAC
	mov r0, sl
	mov r1, #0x43
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BAAC
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BAAC:
	cmp r8, #2
	bne _0230BAF4
	mov r0, sl
	mov r1, #0x46
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BAF4
	ldrsh r2, [r7, #0x12]
	ldrsh r1, [r7, #0x16]
	ldr r0, _0230BBA8 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r7, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r4, r4, lsl #1
_0230BAF4:
	cmp r4, #0
	moveq r0, #2
	beq _0230BB98
	mov r0, sl
	mov r1, r8
	bl MonsterIsType
	cmp r0, #0
	mov r0, sl
	movne r4, r4, lsl #1
	bl GetApparentWeather
	cmp r0, #1
	bne _0230BB3C
	cmp r8, #2
	moveq r4, r4, lsl #1
	beq _0230BB3C
	cmp r8, #3
	moveq r0, #2
	beq _0230BB98
_0230BB3C:
	ldr r0, _0230BBA4 ; =ov29_02353538
	ldr r1, [r0]
	add r0, r1, #0xc000
	ldrb r0, [r0, #0xd5b]
	cmp r0, #0
	beq _0230BB60
	cmp r8, #5
	moveq r0, #2
	beq _0230BB98
_0230BB60:
	add r0, r1, #0xc000
	ldrb r0, [r0, #0xd5c]
	cmp r0, #0
	beq _0230BB7C
	cmp r8, #2
	moveq r0, #2
	beq _0230BB98
_0230BB7C:
	cmp r8, #5
	ldreqb r0, [r7, #0xd2]
	cmpeq r0, #0xb
	moveq r4, r4, lsl #1
	cmp r4, #3
	movge r4, #3
	add r0, r4, #2
_0230BB98:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230BBA0: .word ov29_02352884
_0230BBA4: .word ov29_02353538
_0230BBA8: .word 0x000003E7
	arm_func_end ov29_0230B7D4

	arm_func_start CalcDamage
CalcDamage: ; 0x0230BBAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc0
	ldr r4, _0230C450 ; =ov29_02353538
	mov sl, r0
	ldr r4, [r4]
	ldr r6, [sl, #0xb4]
	ldr r8, [sp, #0xec]
	str r2, [sp, #0xc]
	mov sb, r1
	ldr r1, [sp, #0xf4]
	mov r0, r8
	str r1, [sp, #0xf4]
	ldr r1, [sp, #0xf8]
	str r3, [sp, #0x10]
	str r1, [sp, #0xf8]
	ldr r1, [sp, #0xf0]
	add r5, r4, #0x184
	ldr r7, [sb, #0xb4]
	str r1, [sp, #0x1c]
	bl ResetDamageData
	ldrb r0, [r6, #0x221]
	cmp r0, #0
	beq _0230BC1C
	ldr r1, _0230C454 ; =ov10_022C4710
	ldr r0, [sp, #0x1c]
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	str r0, [sp, #0x1c]
_0230BC1C:
	mov r0, sl
	mov r1, #0x5c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BC50
	ldr r0, [sp, #0xf4]
	bl IsRecoilMove
	cmp r0, #0
	ldrne r0, [sp, #0x1c]
	addne r0, r0, r0, lsl #1
	addne r0, r0, r0, lsr #31
	movne r0, r0, asr #1
	strne r0, [sp, #0x1c]
_0230BC50:
	mov r0, sl
	mov r1, #0x65
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BC84
	ldr r0, [sp, #0xf4]
	bl IsPunchMove
	cmp r0, #0
	beq _0230BC84
	ldr r0, [sp, #0x1c]
	mov r1, #0x180
	bl MultiplyByFixedPoint
	str r0, [sp, #0x1c]
_0230BC84:
	mov r0, sl
	mov r1, #0x6b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0xc]
	ldr r1, _0230C458 ; =0x000001D3
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	ldreqb r0, [r6, #0x5e]
	streq r0, [sp, #0xc]
	ldr r0, [sp, #0xf4]
	bl MoveIsNotPhysical
	str r0, [sp, #0x18]
	bl ResetDamageCalcDiagnostics
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _0230BD34
	add r0, r6, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _0230BD34
	mov r0, #1
	str r0, [r8]
	mov r0, #0
	str r0, [r8, #4]
	mov r0, #2
	str r0, [r8, #8]
	ldr r0, [sp, #0xf4]
	ldr r1, [sp, #0xc]
	strb r1, [r8, #0xc]
	bl GetMoveCategory
	strb r0, [r8, #0xd]
	mov r0, #0
	strb r0, [r8, #0xe]
	strb r0, [r8, #0xf]
	strb r0, [r8, #0x10]
	b _0230D054
_0230BD34:
	ldr r1, _0230C45C ; =0x00000163
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	bne _0230BDA0
	mov r0, sl
	mov r1, sb
	mov r2, #0x35
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230BDA0
	mov r0, #1
	str r0, [r8]
	mov r0, #0
	str r0, [r8, #4]
	mov r0, #2
	str r0, [r8, #8]
	ldr r0, [sp, #0xf4]
	ldr r1, [sp, #0xc]
	strb r1, [r8, #0xc]
	bl GetMoveCategory
	strb r0, [r8, #0xd]
	mov r0, #0
	strb r0, [r8, #0xe]
	strb r0, [r8, #0xf]
	strb r0, [r8, #0x10]
	b _0230D054
_0230BDA0:
	ldr r0, [sp, #0xf4]
	ldr r1, [sp, #0xc]
	strb r1, [r8, #0xc]
	bl GetMoveCategory
	strb r0, [r8, #0xd]
	ldr r0, [sp, #0xc]
	mov r4, #0
	strb r0, [r5]
	ldr r0, [sp, #0x18]
	mov r1, #0x60
	str r0, [r5, #4]
	add r0, r6, r0, lsl #2
	ldr r0, [r0, #0x34]
	mov fp, r4
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	add r0, r7, r0, lsl #2
	ldr r0, [r0, #0x3c]
	str r0, [sp, #0x38]
	mov r0, sl
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BE40
	ldrb r1, [r7, #0x1c]
	ldrb r0, [r7, #0x1d]
	cmp r1, r0
	blo _0230BE28
	ldr r0, [sp, #0x18]
	cmp r0, #1
	ldreqb r0, [r5, #0x32]
	addeq r4, r4, #1
	addeq r0, r0, #1
	streqb r0, [r5, #0x32]
	b _0230BE40
_0230BE28:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldreqb r0, [r5, #0x32]
	addeq r4, r4, #1
	addeq r0, r0, #1
	streqb r0, [r5, #0x32]
_0230BE40:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	ldr r0, [sp, #0x18]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0x24]
	str r0, [sp, #0x44]
	beq _0230BE70
	ldr r0, [sp, #0xc]
	cmp r0, #2
	ldreqsh r0, [r6, #0x30]
	streqh r0, [r5, #0x10]
	addeq r4, r4, r0
_0230BE70:
	mov r0, sl
	mov r1, #0x22
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x34]
	mov r1, #0x23
	addne r4, r4, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x34]
	mov r0, sl
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x34]
	mov r1, #0x3c
	subne r4, r4, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x34]
	mov r0, sl
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r6, #0x166]
	mov r1, #0x32
	cmpne r0, #0
	ldrneb r0, [r5, #0x34]
	addne r4, r4, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x34]
	mov r0, sl
	bl NearbyAllyIqSkillIsEnabled
	cmp r0, #0
	ldr r0, [sp, #0x18]
	addne r4, r4, #1
	cmp r0, #0
	mov r0, sl
	bne _0230BFA8
	mov r1, #0x68
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BF5C
	ldrsh r0, [r6, #4]
	ldrsh r1, [r7, #4]
	bl GendersEqualNotGenderless
	cmp r0, #0
	ldrneb r0, [r5, #0x32]
	addne r4, r4, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x32]
	bne _0230BF5C
	ldrsh r0, [r6, #4]
	bl GetMonsterGenderVeneer
	cmp r0, #3
	beq _0230BF5C
	ldrsh r0, [r7, #4]
	bl GetMonsterGenderVeneer
	cmp r0, #3
	ldrneb r0, [r5, #0x32]
	subne r4, r4, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x32]
_0230BF5C:
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #1
	bne _0230C040
	mov r0, sl
	mov r1, #0x71
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230BF94
	mov r0, sl
	mov r1, #0x71
	bl OtherMonsterAbilityIsActive
	cmp r0, #0
	beq _0230C040
_0230BF94:
	add r4, r4, #1
	ldrb r0, [r5, #0x32]
	add r0, r0, #1
	strb r0, [r5, #0x32]
	b _0230C040
_0230BFA8:
	mov r1, #0x5a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230BFD4
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #1
	ldreqb r0, [r5, #0x32]
	addeq r4, r4, #2
	addeq r0, r0, #2
	streqb r0, [r5, #0x32]
_0230BFD4:
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #1
	bne _0230C01C
	mov r0, sb
	mov r1, #0x71
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230C00C
	mov r0, sb
	mov r1, #0x71
	bl OtherMonsterAbilityIsActive
	cmp r0, #0
	beq _0230C01C
_0230C00C:
	add fp, fp, #1
	ldrb r0, [r5, #0x33]
	add r0, r0, #1
	strb r0, [r5, #0x33]
_0230C01C:
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #2
	bne _0230C040
	ldrb r0, [r7, #0x5e]
	cmp r0, #0xd
	ldrneb r0, [r7, #0x5f]
	cmpne r0, #0xd
	addeq fp, fp, #2
_0230C040:
	ldrsh r1, [r6, #4]
	ldr r0, _0230C460 ; =0x000001A3
	cmp r1, r0
	addeq r4, r4, #2
	cmp r1, #0x1a4
	ldr r0, _0230C464 ; =0x000001A5
	subeq r4, r4, #2
	cmp r1, r0
	ldr r0, _0230C468 ; =0x00000211
	subeq r4, r4, #2
	cmp r1, r0
	subeq r4, r4, #2
	beq _0230C07C
	cmp r1, #0x218
	addeq r4, r4, #2
_0230C07C:
	ldr r0, [sp, #0x44]
	add r0, r0, r4
	str r0, [sp, #0x44]
	ldrb r0, [r6, #0x167]
	cmp r0, #0
	beq _0230C0AC
	mov r0, sl
	mov r1, #0x4f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0x14
	strne r0, [sp, #0x44]
_0230C0AC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	add r0, r7, r0, lsl #1
	ldrsh r4, [r0, #0x28]
	bne _0230C0F4
	ldrb r0, [r7, #0xd2]
	mov r1, #0x31
	cmp r0, #6
	moveq r0, #1
	streqb r0, [r5, #0x51]
	mov r0, sb
	addeq fp, fp, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x35]
	subne fp, fp, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x35]
_0230C0F4:
	mov r0, sb
	mov r1, #0x22
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x35]
	mov r1, #0x23
	subne fp, fp, #1
	subne r0, r0, #1
	strneb r0, [r5, #0x35]
	mov r0, sb
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5, #0x35]
	addne fp, fp, #1
	addne r0, r0, #1
	strneb r0, [r5, #0x35]
	ldrsh r1, [r7, #4]
	ldr r0, _0230C460 ; =0x000001A3
	cmp r1, r0
	subeq fp, fp, #2
	cmp r1, #0x1a4
	ldr r0, _0230C464 ; =0x000001A5
	addeq fp, fp, #2
	cmp r1, r0
	ldr r0, _0230C468 ; =0x00000211
	subeq fp, fp, #2
	cmp r1, r0
	addeq fp, fp, #2
	beq _0230C170
	cmp r1, #0x218
	subeq fp, fp, #2
_0230C170:
	ldr r1, _0230C46C ; =0x000001BD
	ldr r0, [sp, #0xf4]
	add r4, r4, fp
	cmp r0, r1
	bne _0230C1F4
	ldrsh r1, [r7, #0x24]
	mov r0, #0
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldrsh r1, [r7, #0x28]
	movgt r0, r0, asr #0x10
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldrsh r1, [r7, #0x26]
	movgt r0, r0, asr #0x10
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldrsh r1, [r7, #0x2a]
	movgt r0, r0, asr #0x10
	cmp r1, #0xa
	subgt r1, r1, #0xa
	addgt r0, r0, r1
	movgt r0, r0, lsl #0x10
	ldr r1, [sp, #0x44]
	movgt r0, r0, asr #0x10
	add r0, r1, r0
	str r0, [sp, #0x44]
_0230C1F4:
	mov r0, sl
	mov r1, #0x67
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0x100
	movne r4, #0xa
	strne r0, [sp, #0x38]
	bne _0230C23C
	mov r0, sl
	mov r1, sb
	mov r2, #0x67
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	movne r0, #0xa
	strne r0, [sp, #0x44]
	movne r0, #0x100
	strne r0, [sp, #0x3c]
_0230C23C:
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [sp, #0x44]
	ldr r0, [sp, #0x44]
	ldr r2, _0230C470 ; =ov10_022C4D98
	cmp r0, #0x14
	movgt r0, #0x14
	strgt r0, [sp, #0x44]
	ldr r0, [sp, #0x44]
	strb r0, [r5, #0xa]
	add r0, r6, #0x1a
	ldrb r3, [r0, r1]
	ldr r1, [sp, #0x44]
	ldr fp, [r2, r1, lsl #2]
	ldr r1, [sp, #0x18]
	strh r3, [r5, #0xc]
	ldrb r0, [r0, r1]
	mov r1, fp
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	ldr r1, [sp, #0x3c]
	bl MultiplyByFixedPoint
	mov r0, r0, asr #8
	cmp r4, #0
	movlt r4, #0
	str r0, [sp, #0x90]
	cmp r4, #0x14
	movgt r4, #0x14
	ldr r1, [sp, #0x18]
	strb r4, [r5, #0xb]
	add r0, r7, #0x1c
	ldrb r2, [r0, r1]
	ldr r1, _0230C474 ; =ov10_022C4DEC
	strh r2, [r5, #0xe]
	ldr r2, [sp, #0x18]
	ldr r1, [r1, r4, lsl #2]
	ldrb r0, [r0, r2]
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	ldr r1, [sp, #0x38]
	bl MultiplyByFixedPoint
	mov r0, r0, asr #8
	str r0, [sp, #0x94]
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230C314
	ldr r1, [sp, #0x18]
	mov r0, sl
	bl ExclusiveItemOffenseBoost
	ldr r1, [sp, #0x90]
	add r0, r1, r0
	str r0, [sp, #0x90]
_0230C314:
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _0230C338
	ldr r1, [sp, #0x18]
	mov r0, sb
	bl ExclusiveItemDefenseBoost
	ldr r1, [sp, #0x94]
	add r0, r1, r0
	str r0, [sp, #0x94]
_0230C338:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0230C4D8
	mov r0, sl
	mov r1, #0x1a
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C378
	ldr r0, _0230C478 ; =POWER_BAND_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x30]
	add r0, r0, r2
	strb r0, [r5, #0x30]
_0230C378:
	mov r0, sl
	mov r1, #0x32
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C3AC
	ldr r0, _0230C47C ; =MUNCH_BELT_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x30]
	add r0, r0, r2
	strb r0, [r5, #0x30]
_0230C3AC:
	mov r0, sl
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C3DC
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C3DC:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230C5E0
	mov r0, sb
	mov r1, #0x25
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C41C
	ldr r0, _0230C484 ; =DEF_SCARF_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x36]
	add r0, r0, r2
	strb r0, [r5, #0x36]
_0230C41C:
	mov r0, sb
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C5E0
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x36]
	add r0, r0, r2
	strb r0, [r5, #0x36]
	b _0230C5E0
	.align 2, 0
_0230C450: .word ov29_02353538
_0230C454: .word ov10_022C4710
_0230C458: .word 0x000001D3
_0230C45C: .word 0x00000163
_0230C460: .word 0x000001A3
_0230C464: .word 0x000001A5
_0230C468: .word 0x00000211
_0230C46C: .word 0x000001BD
_0230C470: .word ov10_022C4D98
_0230C474: .word ov10_022C4DEC
_0230C478: .word POWER_BAND_STAT_BOOST
_0230C47C: .word MUNCH_BELT_STAT_BOOST
_0230C480: .word AURA_BOW_STAT_BOOST
_0230C484: .word DEF_SCARF_STAT_BOOST
_0230C488: .word ZINC_BAND_STAT_BOOST
_0230C48C: .word SPECIAL_BAND_STAT_BOOST
_0230C490: .word 0x00000C53
_0230C494: .word 0x00000C54
_0230C498: .word 0x00000C55
_0230C49C: .word 0x000003E7
_0230C4A0: .word _020A18D8
_0230C4A4: .word ov29_02352984
_0230C4A8: .word ov29_02352990
_0230C4AC: .word ov29_0235299C
_0230C4B0: .word _020A18F4
_0230C4B4: .word _020A18F0
_0230C4B8: .word _020A18CC
_0230C4BC: .word _020A18F8
_0230C4C0: .word _020A18EC
_0230C4C4: .word _020A18D4
_0230C4C8: .word _020A18E8
_0230C4CC: .word ov29_0235286C
_0230C4D0: .word ov29_02352838
_0230C4D4: .word ov29_0235287C
_0230C4D8:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230C548
	mov r0, sb
	mov r1, #0x29
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C518
	ldr r0, _0230C488 ; =ZINC_BAND_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x37]
	add r0, r0, r2
	strb r0, [r5, #0x37]
_0230C518:
	mov r0, sb
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C548
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x94]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x94]
	ldrb r0, [r5, #0x36]
	add r0, r0, r2
	strb r0, [r5, #0x36]
_0230C548:
	mov r0, sl
	mov r1, #0x28
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C57C
	ldr r0, _0230C48C ; =SPECIAL_BAND_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C57C:
	mov r0, sl
	mov r1, #0x32
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	beq _0230C5B0
	ldr r0, _0230C47C ; =MUNCH_BELT_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C5B0:
	mov r0, sb
	bl AuraBowIsActive
	cmp r0, #0
	beq _0230C5E0
	ldr r0, _0230C480 ; =AURA_BOW_STAT_BOOST
	ldr r1, [sp, #0x90]
	ldrsh r2, [r0]
	add r0, r1, r2
	str r0, [sp, #0x90]
	ldrb r0, [r5, #0x31]
	add r0, r0, r2
	strb r0, [r5, #0x31]
_0230C5E0:
	ldr r0, [sp, #0x10]
	mov r1, fp
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	ldr r1, [sp, #0x3c]
	bl MultiplyByFixedPoint
	mov r1, r0
	add r0, sp, #0xa0
	bl FixedPoint32To64
	mov r0, #0x64
	bl DungeonRandInt
	mov r4, #1
	str r0, [sp, #0x40]
	add r0, r6, #0x100
	ldrh r1, [r0, #0x5a]
	mov fp, r4
	str r4, [sp, #0x28]
	bic r1, r1, #0x100
	strh r1, [r0, #0x5a]
	ldrh r1, [r0, #0x58]
	str r4, [sp, #0x2c]
	bic r1, r1, #0x100
	strh r1, [r0, #0x58]
	ldr r0, [sp, #0xf4]
	bl MoveIsNotPhysical
	str r0, [sp, #0x30]
	cmp r0, #0
	bne _0230C6B8
	mov r0, sl
	mov r1, #0x11
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C6B8
	ldr r0, [sl, #0xb4]
	mov r1, r4
	str r0, [sp, #0x24]
	mov r0, sl
	bl MonsterHasNegativeStatus
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x48]
	mov r1, r4
	bl UpdateStateFlags
	ldr r1, [sp, #0x48]
	cmp r1, #0
	movne r4, r4, lsl #1
	cmp r0, #0
	beq _0230C6B8
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E6130
	mov r0, sl
	mov r1, sb
	ldr r2, _0230C490 ; =0x00000C53
	bl LogMessageByIdWithPopupCheckUserTarget
_0230C6B8:
	mov r0, sl
	mov r1, #0x22
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0230C6E0
	mov r0, sl
	mov r1, #0x4b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C748
_0230C6E0:
	ldr r0, [sp, #0x40]
	cmp r0, #0x21
	ldr r0, [sl, #0xb4]
	bge _0230C700
	ldr r1, [sp, #0x30]
	cmp r1, #0
	moveq r1, #1
	beq _0230C704
_0230C700:
	mov r1, #0
_0230C704:
	and r1, r1, #0xff
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x34]
	mov r1, #0x100
	bl UpdateStateFlags
	ldr r1, [sp, #0x34]
	cmp r1, #0
	addne r4, r4, r4, lsl #1
	movne fp, fp, lsl #1
	cmp r0, #0
	beq _0230C748
	mov r0, sl
	bl PlayEffectAnimation0x1A9__022E617C
	mov r0, sl
	mov r1, sb
	ldr r2, _0230C494 ; =0x00000C54
	bl LogMessageByIdWithPopupCheckUserTarget
_0230C748:
	mov r0, sl
	mov r1, #0x30
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C76C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	addeq r4, r4, r4, lsl #1
	moveq fp, fp, lsl #1
_0230C76C:
	ldr r0, [sl, #0xb4]
	mov r1, #0x38
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x14]
	movne r0, #0
	strne r0, [sp, #0x14]
	mov r0, sl
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C7D4
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _0230C7D4
	ldr r0, _0230C450 ; =ov29_02353538
	ldr r1, [r0]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe36]
	cmp r0, #0
	movne r0, #0xa
	mulne r0, fp, r0
	rsbne r4, r4, r4, lsl #4
	movne fp, r0
_0230C7D4:
	mov r0, sl
	mov r1, #0x3f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230C820
	ldr r0, [sp, #0x30]
	cmp r0, #1
	bne _0230C820
	ldr r0, _0230C450 ; =ov29_02353538
	ldr r1, [r0]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe34]
	cmp r0, #0
	movne r0, #0xa
	mulne r0, fp, r0
	rsbne r4, r4, r4, lsl #4
	movne fp, r0
_0230C820:
	mov r0, sl
	mov r1, sb
	mov r2, #6
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230C84C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	moveq r4, r4, lsl #2
	addeq fp, fp, fp, lsl #2
_0230C84C:
	mov r0, sl
	mov r1, sb
	mov r2, #0x34
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230C8E0
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _0230C8E0
	ldr r0, [sb, #0xb4]
	mov r1, #1
	str r0, [sp, #0x20]
	mov r0, sb
	bl MonsterHasNegativeStatus
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x4c]
	mov r1, #8
	bl UpdateStateFlags
	ldr r1, [sp, #0x4c]
	cmp r1, #0
	beq _0230C8C0
	ldr r1, [sp, #0x28]
	add r1, r1, r1, lsl #1
	str r1, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	mov r1, r1, lsl #1
	str r1, [sp, #0x2c]
_0230C8C0:
	cmp r0, #0
	beq _0230C8E0
	mov r0, sb
	bl PlayEffectAnimation0x18E
	mov r0, sl
	mov r1, sb
	ldr r2, _0230C498 ; =0x00000C55
	bl LogMessageByIdWithPopupCheckUserTarget
_0230C8E0:
	add r0, sp, #0x90
	ldr r2, [r0]
	add r1, sp, #0x94
	mul r0, r2, r4
	ldr r3, [r1]
	ldr r2, [sp, #0x28]
	cmp fp, #1
	mul r2, r3, r2
	str r2, [r1]
	add r1, sp, #0x90
	str r0, [r1]
	beq _0230C920
	mov r1, fp
	bl __divsi3
	add r1, sp, #0x90
	str r0, [r1]
_0230C920:
	ldr r0, [sp, #0x2c]
	cmp r0, #1
	beq _0230C940
	add r4, sp, #0x94
	mov r1, r0
	ldr r0, [r4]
	bl __divsi3
	str r0, [r4]
_0230C940:
	ldr r0, [sp, #0x90]
	strh r0, [r5, #0x12]
	ldr r0, [sp, #0x94]
	strh r0, [r5, #0x14]
	ldr r0, [sp, #0x90]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [sp, #0x90]
	ldr r1, [sp, #0x90]
	ldr r0, _0230C49C ; =0x000003E7
	cmp r1, r0
	strge r0, [sp, #0x90]
	ldr r1, [sp, #0x94]
	add r0, sp, #0x98
	strh r1, [r5, #0x1a]
	ldr r1, [sp, #0x94]
	bl IntToFixedPoint64
	ldr r2, [sp, #0x90]
	ldr r1, [sp, #0x94]
	add r0, sp, #0x88
	sub r1, r2, r1
	bl IntToFixedPoint64
	ldr r1, _0230C4A0 ; =_020A18D8
	add r0, sp, #0x80
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x88
	add r2, sp, #0x80
	mov r1, r0
	bl DivideFixedPoint64
	ldrb r1, [r6, #0xa]
	add r0, sp, #0x80
	bl IntToFixedPoint64
	add r0, sp, #0xa8
	add r1, sp, #0x80
	add r2, sp, #0x88
	bl AddFixedPoint64
	ldr r1, [sp, #0x90]
	add r0, sp, #0x80
	bl IntToFixedPoint64
	add r0, sp, #0xa0
	add r2, sp, #0x80
	mov r1, r0
	bl AddFixedPoint64
	add r0, sp, #0xa0
	bl FixedPoint64ToInt
	strh r0, [r5, #0x18]
	ldrb r1, [r6, #0xa]
	add r0, sp, #0xa8
	strh r1, [r5, #0x16]
	bl FixedPoint64ToInt
	strh r0, [r5, #0x1c]
	add r0, sp, #0xa8
	bl FixedPoint64ToInt
	mov r1, r0
	ldr r0, _0230C4A4 ; =ov29_02352984
	bl DebugPrint0
	add r0, sp, #0xa0
	bl FixedPoint64ToInt
	mov r1, r0
	ldr r0, _0230C4A8 ; =ov29_02352990
	bl DebugPrint0
	add r0, sp, #0x98
	bl FixedPoint64ToInt
	mov r1, r0
	ldr r0, _0230C4AC ; =ov29_0235299C
	bl DebugPrint0
	ldr r1, _0230C4B0 ; =_020A18F4
	add r0, sp, #0x70
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x70
	add r1, sp, #0xa0
	mov r2, r0
	bl MultiplyFixedPoint64
	ldr r1, _0230C4B4 ; =_020A18F0
	add r0, sp, #0x68
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x68
	add r1, sp, #0x98
	mov r2, r0
	bl MultiplyFixedPoint64
	ldr r1, _0230C4B8 ; =_020A18CC
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x60
	add r1, sp, #0xa8
	add r2, sp, #0x78
	bl AddFixedPoint64
	ldr r1, _0230C4BC ; =_020A18F8
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x60
	add r2, sp, #0x78
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0x60
	bl FixedPoint64ToInt
	mov r1, r0
	add r0, sp, #0x60
	bl ClampedLn
	ldr r1, _0230C4C0 ; =_020A18EC
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0x60
	add r2, sp, #0x78
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xb0
	add r1, sp, #0x68
	add r2, sp, #0x70
	bl AddFixedPoint64
	add r0, sp, #0xb0
	add r2, sp, #0x60
	mov r1, r0
	bl AddFixedPoint64
	ldr r1, _0230C4C4 ; =_020A18D4
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0xb0
	add r2, sp, #0x78
	mov r1, r0
	bl AddFixedPoint64
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	bne _0230CB78
	ldrb r0, [r6, #6]
	cmp r0, #0
	beq _0230CB78
	ldr r1, _0230C4C8 ; =_020A18E8
	add r0, sp, #0x78
	ldr r1, [r1]
	bl FixedPoint32To64
	add r0, sp, #0xb0
	add r2, sp, #0x78
	mov r1, r0
	bl DivideFixedPoint64
_0230CB78:
	ldr r0, _0230C4CC ; =ov29_0235286C
	add r1, sp, #0xb0
	bl FixedPoint64CmpLt
	cmp r0, #0
	ldrne r0, _0230C4D0 ; =ov29_02352838
	ldrne r1, [r0, #0x38]
	ldrne r0, [r0, #0x34]
	strne r1, [sp, #0xb4]
	strne r0, [sp, #0xb0]
	ldr r1, _0230C4D4 ; =ov29_0235287C
	add r0, sp, #0xb0
	bl FixedPoint64CmpLt
	cmp r0, #0
	ldrne r0, _0230C4D0 ; =ov29_02352838
	ldrne r1, [r0, #0x48]
	ldrne r0, [r0, #0x44]
	strne r1, [sp, #0xb4]
	strne r0, [sp, #0xb0]
	ldr r0, [sp, #0xf4]
	bl IsRegularAttackOrProjectile
	cmp r0, #0
	ldr r0, [sp, #0xc]
	movne r1, #1
	str r0, [sp]
	moveq r1, #0
	and r1, r1, #0xff
	str r8, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, sp, #0xb8
	mov r1, sl
	mov r2, sb
	bl CalcTypeBasedDamageEffects
	mov fp, r0
	ldr r0, [sp, #0xc]
	cmp r0, #2
	bne _0230CC78
	mov r0, sl
	mov r1, sb
	bl FlashFireShouldActivate
	movs r4, r0
	beq _0230CC78
	ldrb r0, [r7, #0x15c]
	cmp r0, #0
	bne _0230CC78
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230CC78
	mov r0, #1
	mov r1, sb
	strb r0, [r7, #0x15c]
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	cmp r4, #1
	bne _0230CC68
	ldr r2, _0230D05C ; =0x00000C58
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0230CC78
_0230CC68:
	ldr r2, _0230D060 ; =0x00000C57
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0230CC78:
	ldr r0, [sp, #0xf8]
	cmp r0, #0
	beq _0230CD3C
	mov r0, sl
	mov r1, #0x44
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	bne _0230CD3C
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0230CCF0
	ldr r0, [sp, #0xf4]
	cmp r0, #0x48
	beq _0230CCBC
	ldrb r0, [r7, #0xd5]
	cmp r0, #1
	beq _0230CCD0
_0230CCBC:
	mov r0, sb
	mov r1, #0x1e
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230CCF0
_0230CCD0:
	mov r0, sb
	bl PlayEffectAnimation0x171
	add r0, sp, #0xb8
	ldr r2, _0230D064 ; =ov29_0235283C
	mov r1, r0
	bl MultiplyFixedPoint64
	mov r0, #1
	strb r0, [r5, #0x3a]
_0230CCF0:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0230CD3C
	ldrb r0, [r7, #0xd5]
	cmp r0, #3
	beq _0230CD1C
	mov r0, sb
	mov r1, #0x1f
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230CD3C
_0230CD1C:
	mov r0, sb
	bl PlayEffectAnimation0x171Full
	add r0, sp, #0xb8
	ldr r2, _0230D064 ; =ov29_0235283C
	mov r1, r0
	bl MultiplyFixedPoint64
	mov r0, #1
	strb r0, [r5, #0x3b]
_0230CD3C:
	ldrb r0, [r7, #0xd5]
	cmp r0, #0x11
	beq _0230CEEC
	mov r0, sl
	mov r1, sb
	mov r2, #0xc
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	bne _0230CEEC
	mov r0, sl
	mov r1, sb
	mov r2, #0x13
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	bne _0230CEEC
	mov r0, sb
	mov r1, #0x40
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0230CEEC
	ldrsh r0, [r6, #2]
	bl GetMonsterGenderVeneer
	cmp r0, #2
	ldrne r1, [sp, #0xe8]
	ldreq r4, [sp, #0xe8]
	addne r0, r1, r1, lsr #31
	addne r4, r1, r0, asr #1
	ldrb r0, [r6, #0xec]
	cmp r0, #4
	moveq r0, #1
	streqb r0, [r5, #0x3c]
	ldreq r4, _0230C49C ; =0x000003E7
	beq _0230CE74
	mov r0, sl
	mov r1, #0x13
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	bne _0230CDF0
	mov r0, sl
	mov r1, #0x1d
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230CE04
_0230CDF0:
	ldr r0, _0230D068 ; =ov10_022C46F0
	mov r1, #1
	ldrsh r0, [r0]
	strb r1, [r5, #0x38]
	add r4, r4, r0
_0230CE04:
	mov r0, sl
	mov r1, #0x58
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, _0230D06C ; =ov10_022C4510
	movne r1, #1
	ldrnesh r0, [r0]
	strneb r1, [r5, #0x49]
	mov r1, #0x14
	addne r4, r4, r0
	mov r0, sb
	bl ItemIsActive__0230A9DC
	cmp r0, #0
	ldrne r0, _0230D068 ; =ov10_022C46F0
	movne r1, #1
	ldrnesh r0, [r0]
	strneb r1, [r5, #0x39]
	addne r4, r4, r0
	cmp fp, #0
	beq _0230CE74
	mov r0, sl
	mov r1, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _0230D070 ; =ov10_022C45E0
	movne r1, #1
	ldrnesh r4, [r0]
	strneb r1, [r5, #0x3d]
_0230CE74:
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, r4
	bge _0230CEEC
	mov r2, #1
	mov r4, #5
	mov r0, sl
	mov r1, sb
	add r3, r2, #0xdc0
	str r4, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _0230CEEC
	mov r2, #1
	mov r0, sl
	mov r1, #0x5d
	strb r2, [r8, #0xe]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	add r0, sp, #0xb8
	beq _0230CEE0
	ldr r2, _0230D074 ; =ov29_0235284C
	mov r1, r0
	bl MultiplyFixedPoint64
	mov r0, #1
	strb r0, [r5, #0x4a]
	b _0230CEEC
_0230CEE0:
	ldr r2, _0230D078 ; =ov29_02352844
	mov r1, r0
	bl MultiplyFixedPoint64
_0230CEEC:
	add r0, sp, #0xb0
	bl FixedPoint64ToInt
	str r0, [r5, #0x24]
	add r0, sp, #0xb0
	add r2, sp, #0xb8
	mov r1, r0
	bl MultiplyFixedPoint64
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x58
	mov r2, r1
	str r2, [r5, #0x2c]
	bl FixedPoint32To64
	add r0, sp, #0xb0
	add r2, sp, #0x58
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xb0
	bl FixedPoint64ToInt
	str r0, [r5, #0x20]
	mov r0, #0x4000
	bl DungeonRandInt
	add r0, r0, #0xe000
	mov r1, #0
	str r0, [sp, #0xbc]
	add r0, sp, #0xb0
	str r1, [sp, #0xb8]
	add r2, sp, #0xb8
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0x50
	mov r1, #0x64
	bl IntToFixedPoint64
	add r0, sp, #0xb8
	add r1, sp, #0x50
	mov r2, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xb8
	bl FixedPoint64ToInt
	str r0, [r5, #0x28]
	add r0, sp, #0xb0
	bl FixedPoint64ToInt
	str r0, [r8]
	ldr r1, _0230D07C ; =0x00000195
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	bne _0230CFBC
	ldr r0, [r8]
	mov r1, #0x80
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	bl RoundUpDiv256
	str r0, [r8]
_0230CFBC:
	ldr r1, _0230D07C ; =0x00000195
	ldr r0, [sp, #0xf4]
	cmp r0, r1
	bne _0230CFFC
	mov r0, sl
	mov r1, #0x2f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230CFFC
	ldr r0, _0230D080 ; =ov10_022C47F8
	ldr r2, [r8]
	ldr r1, [r0]
	mov r0, r2, lsl #8
	bl MultiplyByFixedPoint
	bl RoundUpDiv256
	str r0, [r8]
_0230CFFC:
	ldr r0, [r8]
	arm_func_end CalcDamage

	arm_func_start ov29_0230D000
ov29_0230D000: ; 0x0230D000
	cmp r0, #0
	ble _0230D038
	mov r0, sl
	mov r1, #0x5b
	bl ExclusiveItemEffectIsActive__0230A9B8
	cmp r0, #0
	beq _0230D038
	ldr r0, _0230D084 ; =ov10_022C4844
	ldr r2, [r8]
	ldr r1, [r0]
	mov r0, r2, lsl #8
	bl MultiplyByFixedPoint
	bl RoundUpDiv256
	str r0, [r8]
_0230D038:
	mov r1, #0
	str r1, [r8, #4]
	ldr r0, [r8]
	cmp r0, #0
	streqb r1, [r8, #0xe]
	ldrb r0, [r8, #0xe]
	strb r0, [r7, #0x167]
_0230D054:
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230D05C: .word 0x00000C58
_0230D060: .word 0x00000C57
_0230D064: .word ov29_0235283C
_0230D068: .word ov10_022C46F0
_0230D06C: .word ov10_022C4510
_0230D070: .word ov10_022C45E0
_0230D074: .word ov29_0235284C
_0230D078: .word ov29_02352844
_0230D07C: .word 0x00000195
_0230D080: .word ov10_022C47F8
_0230D084: .word ov10_022C4844
	arm_func_end ov29_0230D000

	arm_func_start ov29_0230D088
ov29_0230D088: ; 0x0230D088
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x1c
	ldr r5, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov lr, r0
	strb r2, [r5, #0xc]
	cmp r4, #1
	strb r3, [r5, #0xd]
	mov ip, r1
	str r2, [sp]
	mov r2, ip
	ldr r0, _0230D118 ; =0x000003E7
	movlt r4, #1
	cmp r4, r0
	movgt r4, r0
	add r0, sp, #0x14
	mov r1, lr
	mov r3, r4
	str r5, [sp, #4]
	mov ip, #0
	str ip, [sp, #8]
	bl CalcTypeBasedDamageEffects
	add r0, sp, #0xc
	mov r1, r4
	bl IntToFixedPoint64
	add r0, sp, #0xc
	add r2, sp, #0x14
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xc
	bl FixedPoint64ToInt
	str r0, [r5]
	mov r0, #0
	str r0, [r5, #4]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230D118: .word 0x000003E7
	arm_func_end ov29_0230D088

	arm_func_start ApplyDamageAndEffectsWrapper
ApplyDamageAndEffectsWrapper: ; 0x0230D11C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xdc
	mov r7, r0
	add r0, sp, #0x10
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ResetDamageData
	add r0, sp, #0x24
	bl ov29_022E2470
	mov r3, #0
	mov r0, #2
	str r0, [sp, #0x18]
	str r6, [sp, #0x10]
	str r5, [sp, #0x14]
	strb r3, [sp, #0x1c]
	strb r3, [sp, #0x1e]
	strb r3, [sp, #0x1f]
	strb r3, [sp, #0x20]
	stmia sp, {r3, r4}
	str r3, [sp, #8]
	mov r1, r7
	add r0, sp, #0x24
	add r2, sp, #0x10
	str r3, [sp, #0xc]
	bl ApplyDamageAndEffects
	add sp, sp, #0xdc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ApplyDamageAndEffectsWrapper

	arm_func_start CalcRecoilDamageFixed
CalcRecoilDamageFixed: ; 0x0230D18C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230D238
	ldr r0, [r7]
	cmp r0, #1
	bne _0230D1F0
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	beq _0230D238
	mov r0, r7
	mov r1, #0x5c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230D1F0
	mov r0, r6, lsl #8
	mov r1, #0x180
	bl MultiplyByFixedPoint
	mov r6, r0, asr #8
_0230D1F0:
	ldrb r1, [sp, #0x34]
	str r4, [sp]
	ldrsh r0, [sp, #0x38]
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	ldr r1, [sp, #0x3c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x10]
	ldr r4, [sp, #0x44]
	str r0, [sp, #0x14]
	arm_func_end CalcRecoilDamageFixed

	arm_func_start ov29_0230D220
ov29_0230D220: ; 0x0230D220
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r4, [sp, #0x18]
	bl CalcDamageFixed
_0230D238:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov29_0230D220

	arm_func_start CalcDamageFixed
CalcDamageFixed: ; 0x0230D240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x2c
	mov sl, r0
	add r0, sp, #0x18
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x54]
	bl ResetDamageData
	mov r5, #0
	ldrb r0, [sp, #0x58]
	ldr r1, [sp, #0x60]
	mov r2, #2
	str r2, [sp, #0x20]
	str r1, [sp, #0x1c]
	strb r6, [sp, #0x24]
	strb r5, [sp, #0x26]
	strb r5, [sp, #0x27]
	strb r0, [sp, #0x25]
	cmp r6, #0
	beq _0230D2F8
	add r4, sp, #0x10
_0230D298:
	mov r2, r5, lsl #0x10
	mov r0, sl
	mov r1, sb
	mov r3, r6
	mov r2, r2, asr #0x10
	bl GetTypeMatchup
	str r0, [r4, r5, lsl #2]
	add r5, r5, #1
	cmp r5, #2
	blt _0230D298
	mov r0, sl
	mov r1, sb
	mov r2, #0x35
	mov r3, #1
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230D2F8
	ldr r2, [sp, #0x10]
	ldr r0, _0230D39C ; =ov10_022C4D14
	ldr r1, [sp, #0x14]
	add r0, r0, r2, lsl #4
	ldr r0, [r0, r1, lsl #2]
	cmp r0, #3
	movne r8, #0
_0230D2F8:
	ldrsh r1, [sp, #0x5c]
	ldr r0, _0230D3A0 ; =0x00000256
	mov r8, r8, lsl #8
	cmp r1, r0
	bne _0230D334
	mov r0, sl
	mov r1, #0x2f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230D334
	ldr r1, _0230D3A4 ; =ov10_022C47F8
	mov r0, r8
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	mov r8, r0
_0230D334:
	mov r0, r8
	bl RoundUpDiv256
	str r0, [sp, #0x18]
	cmp r8, #0
	moveq r0, #1
	streqb r0, [sp, #0x28]
	movne r0, #0
	strneb r0, [sp, #0x28]
	ldrsh r1, [sp, #0x5c]
	str r7, [sp]
	ldr r0, [sp, #0x64]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r4, [sp, #0x68]
	add r2, sp, #0x18
	mov r0, sl
	mov r1, sb
	mov r3, #0
	str r4, [sp, #0xc]
	bl ApplyDamageAndEffects
	ldr r1, [sp, #0x50]
	cmp r1, #0
	ldrneb r0, [sp, #0x28]
	strneb r0, [r1]
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0230D39C: .word ov10_022C4D14
_0230D3A0: .word 0x00000256
_0230D3A4: .word ov10_022C47F8
	arm_func_end CalcDamageFixed

	arm_func_start CalcDamageFixedNoCategory
CalcDamageFixedNoCategory: ; 0x0230D3A8
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	ldr lr, [sp, #0x20]
	ldrb ip, [sp, #0x24]
	str lr, [sp]
	ldrsh lr, [sp, #0x28]
	str ip, [sp, #4]
	mov ip, #3
	str ip, [sp, #8]
	ldr ip, [sp, #0x2c]
	str lr, [sp, #0xc]
	ldr lr, [sp, #0x30]
	str ip, [sp, #0x10]
	ldr ip, [sp, #0x34]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	bl CalcDamageFixed
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	arm_func_end CalcDamageFixedNoCategory

	arm_func_start CalcDamageFixedWrapper
CalcDamageFixedWrapper: ; 0x0230D3F4
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	ldr ip, [sp, #0x20]
	ldrb lr, [sp, #0x24]
	str ip, [sp]
	ldrb ip, [sp, #0x28]
	str lr, [sp, #4]
	ldrsh lr, [sp, #0x2c]
	str ip, [sp, #8]
	ldr ip, [sp, #0x30]
	str lr, [sp, #0xc]
	ldr lr, [sp, #0x34]
	str ip, [sp, #0x10]
	ldr ip, [sp, #0x38]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	bl CalcDamageFixed
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	arm_func_end CalcDamageFixedWrapper

	arm_func_start UpdateShopkeeperModeAfterAttack
UpdateShopkeeperModeAfterAttack: ; 0x0230D440
	ldr r2, [r1, #0xb4]
	ldrb r1, [r2, #9]
	cmp r1, #0
	bxeq lr
	ldr r1, [r0]
	cmp r1, #1
	bxne lr
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #2
	strneb r0, [r2, #9]
	moveq r0, #3
	streqb r0, [r2, #9]
	bx lr
	arm_func_end UpdateShopkeeperModeAfterAttack

	arm_func_start UpdateShopkeeperModeAfterTrap
UpdateShopkeeperModeAfterTrap: ; 0x0230D47C
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #9]
	cmp r0, #0
	bxeq lr
	cmp r1, #0
	movne r0, #2
	strneb r0, [r2, #9]
	moveq r0, #3
	streqb r0, [r2, #9]
	bx lr
	arm_func_end UpdateShopkeeperModeAfterTrap

	arm_func_start ov29_0230D4A4
ov29_0230D4A4: ; 0x0230D4A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r1, #0xe
	mov r5, r2
	ldr r4, [r6, #0xb4]
	bl MonsterIsType
	cmp r0, #0
	beq _0230D4E8
	cmp r5, #1
	cmpne r5, #7
	bne _0230D4E8
	ldrb r0, [r4, #0xfe]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0230D4E8:
	mov r4, #0
	b _0230D518
_0230D4F0:
	mov r2, r4, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, r2, asr #0x10
	bl GetTypeMatchup
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r4, r4, #1
_0230D518:
	cmp r4, #2
	blt _0230D4F0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0230D4A4

	arm_func_start ResetDamageCalcDiagnostics
ResetDamageCalcDiagnostics: ; 0x0230D528
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0230D614 ; =ov29_02353538
	mov r1, #0x54
	ldr r4, [r0]
	add r5, r4, #0x184
	mov r0, r5
	bl MemZero
	mov r1, #0
	strb r1, [r4, #0x184]
	str r1, [r5, #4]
	strb r1, [r5, #8]
	strb r1, [r5, #9]
	mov r0, #0xa
	strb r0, [r5, #0xa]
	strb r0, [r5, #0xb]
	mov r0, #1
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x12]
	strh r1, [r5, #0x16]
	strh r1, [r5, #0x1c]
	str r1, [r5, #0x20]
	str r1, [r5, #0x28]
	str r1, [r5, #0x2c]
	strb r1, [r5, #0x30]
	strb r1, [r5, #0x31]
	strb r1, [r5, #0x36]
	strb r1, [r5, #0x37]
	strb r1, [r5, #0x34]
	strb r1, [r5, #0x35]
	strb r1, [r5, #0x38]
	strb r1, [r5, #0x39]
	strb r1, [r5, #0x3a]
	strb r1, [r5, #0x3b]
	strb r1, [r5, #0x3c]
	strb r1, [r5, #0x3d]
	strb r1, [r5, #0x3e]
	strb r1, [r5, #0x40]
	strb r1, [r5, #0x3f]
	strb r1, [r5, #0x41]
	strb r1, [r5, #0x42]
	strb r1, [r5, #0x43]
	strb r1, [r5, #0x44]
	strb r1, [r5, #0x45]
	strb r1, [r5, #0x46]
	strb r1, [r5, #0x47]
	strb r1, [r5, #0x48]
	strb r1, [r5, #0x4b]
	strb r1, [r5, #0x4c]
	strb r1, [r5, #0x4d]
	strb r1, [r5, #0x4e]
	strb r1, [r5, #0x4f]
	strb r1, [r5, #0x50]
	strb r1, [r5, #0x51]
	strb r1, [r5, #0x32]
	strb r1, [r5, #0x33]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D614: .word ov29_02353538
	arm_func_end ResetDamageCalcDiagnostics

	arm_func_start ov29_0230D618
ov29_0230D618: ; 0x0230D618
	ldr r1, _0230D624 ; =ov29_02352894
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0230D624: .word ov29_02352894
	arm_func_end ov29_0230D618

	arm_func_start ov29_0230D628
ov29_0230D628: ; 0x0230D628
	stmdb sp!, {r3, lr}
	ldr r1, _0230D650 ; =ov29_02353538
	ldr r1, [r1]
	add r1, r1, #0x1a000
	ldr r1, [r1, #0x22c]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	bl PointCameraToMonster
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D650: .word ov29_02353538
	arm_func_end ov29_0230D628

	arm_func_start ov29_0230D654
ov29_0230D654: ; 0x0230D654
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230D678
	mov r0, r4
	bl EntityIsValid__02308FBC
	cmp r0, #0
	bne _0230D680
_0230D678:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0230D680:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230D654

	arm_func_start ov29_0230D688
ov29_0230D688: ; 0x0230D688
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldrh r3, [r4]
	mov r1, #0x55
	mov r2, #2
	strh r3, [sp]
	ldrh r3, [r4, #2]
	strh r3, [sp, #2]
	ldrh r3, [r4, #4]
	strh r3, [sp, #4]
	bl GenerateStandardItem
	mov r0, r4
	bl SetItemAcquired
	ldrb r0, [sp, #1]
	strb r0, [r4, #1]
	cmp r0, #0
	beq _0230D6FC
	add r0, sp, #0
	bl GetEquivItemIndex
	cmp r0, #0
	blt _0230D6FC
	bl GetItemAtIdx
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
_0230D6FC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230D688

	arm_func_start ov29_0230D704
ov29_0230D704: ; 0x0230D704
	mov r0, #0
	bx lr
	arm_func_end ov29_0230D704

	arm_func_start ov29_0230D70C
ov29_0230D70C: ; 0x0230D70C
	stmdb sp!, {r3, lr}
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0230D734 ; =ov10_022C45B4
	arm_func_end ov29_0230D70C

	arm_func_start ov29_0230D71C
ov29_0230D71C: ; 0x0230D71C
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D734: .word ov10_022C45B4
	arm_func_end ov29_0230D71C

	arm_func_start ov29_0230D738
ov29_0230D738: ; 0x0230D738
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _0230D760
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0230D768 ; =ov10_022C45B4
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #1
	ldmltia sp!, {r3, pc}
_0230D760:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D768: .word ov10_022C45B4
	arm_func_end ov29_0230D738

	arm_func_start ov29_0230D76C
ov29_0230D76C: ; 0x0230D76C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsMonster__0230A994
	cmp r0, #0
	beq _0230D798
	mov r0, r5
	bl IsMonster__0230A994
	cmp r0, #0
	bne _0230D7A0
_0230D798:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0230D7A0:
	ldr r0, [r6, #0xb4]
	ldr r1, [r5, #0xb4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r1, #2]
	bl sub_02054EC8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov29_0230D738
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0230D76C

	arm_func_start ov29_0230D7D4
ov29_0230D7D4: ; 0x0230D7D4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r2, _0230D870 ; =ov29_023535D4
	mvn r1, #0
	ldrsh r3, [r2]
	mov r4, r0
	cmp r3, r1
	beq _0230D808
	ldrsh r0, [r2]
	bl ov10_022BDE50
	ldr r0, _0230D870 ; =ov29_023535D4
	mvn r1, #0
	strh r1, [r0]
_0230D808:
	mov r2, #0
	mov r1, #1
	str r2, [sp]
	stmib sp, {r1, r2}
	mov r0, r4
	rsb r1, r1, #0x2b8
	mov r3, #3
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mvn r0, #0
	cmp r5, r0
	beq _0230D868
	mov r4, #0x18
	b _0230D850
_0230D848:
	mov r0, r4
	bl AdvanceFrame
_0230D850:
	mov r0, r5
	bl ov10_022BF964
	cmp r0, #0
	bne _0230D848
	mov r0, r5
	bl ov10_022BDE50
_0230D868:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D870: .word ov29_023535D4
	arm_func_end ov29_0230D7D4

	arm_func_start ov29_0230D874
ov29_0230D874: ; 0x0230D874
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x28]
	ldrsh r1, [lr, #0x2a]
	ldrsh r0, [ip, #0x28]
	cmp r2, #0
	strh r0, [lr, #0x28]
	ldrsh r0, [ip, #0x2a]
	strh r0, [lr, #0x2a]
	strh r3, [ip, #0x28]
	strh r1, [ip, #0x2a]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D8E4 ; =0x00000F2D
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D8E4: .word 0x00000F2D
	arm_func_end ov29_0230D874

	arm_func_start ov29_0230D8E8
ov29_0230D8E8: ; 0x0230D8E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldr r3, [lr, #0x3c]
	ldr r1, [lr, #0x40]
	ldr r0, [ip, #0x3c]
	cmp r2, #0
	str r0, [lr, #0x3c]
	ldr r0, [ip, #0x40]
	str r0, [lr, #0x40]
	str r3, [ip, #0x3c]
	str r1, [ip, #0x40]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	arm_func_end ov29_0230D8E8

	arm_func_start ov29_0230D92C
ov29_0230D92C: ; 0x0230D92C
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D958 ; =0x00000F2E
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D958: .word 0x00000F2E
	arm_func_end ov29_0230D92C

	arm_func_start ov29_0230D95C
ov29_0230D95C: ; 0x0230D95C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x24]
	ldrsh r1, [lr, #0x26]
	ldrsh r0, [ip, #0x24]
	cmp r2, #0
	strh r0, [lr, #0x24]
	ldrsh r0, [ip, #0x26]
	strh r0, [lr, #0x26]
	strh r3, [ip, #0x24]
	strh r1, [ip, #0x26]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D9CC ; =0x00000F2B
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D9CC: .word 0x00000F2B
	arm_func_end ov29_0230D95C

	arm_func_start ov29_0230D9D0
ov29_0230D9D0: ; 0x0230D9D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldr r3, [lr, #0x34]
	ldr r1, [lr, #0x38]
	ldr r0, [ip, #0x34]
	cmp r2, #0
	str r0, [lr, #0x34]
	ldr r0, [ip, #0x38]
	str r0, [lr, #0x38]
	str r3, [ip, #0x34]
	str r1, [ip, #0x38]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230DA40 ; =0x00000F2C
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230DA40: .word 0x00000F2C
	arm_func_end ov29_0230D9D0

	arm_func_start ov29_0230DA44
ov29_0230DA44: ; 0x0230DA44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x2c]
	ldrsh r1, [lr, #0x2e]
	ldrsh r0, [ip, #0x2c]
	cmp r2, #0
	strh r0, [lr, #0x2c]
	ldrsh r0, [ip, #0x2e]
	strh r0, [lr, #0x2e]
	strh r3, [ip, #0x2c]
	strh r1, [ip, #0x2e]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230DAB4 ; =0x00000F2F
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230DAB4: .word 0x00000F2F
	arm_func_end ov29_0230DA44

	arm_func_start ov29_0230DAB8
ov29_0230DAB8: ; 0x0230DAB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr ip, [r5, #0xb4]
	mov r4, r1
	ldrsh r1, [ip, #0x24]
	ldr r3, [ip, #0x34]
	ldr r0, [ip, #0x3c]
	cmp r2, #0
	str r0, [ip, #0x34]
	ldrsh r0, [ip, #0x28]
	strh r0, [ip, #0x24]
	str r3, [ip, #0x3c]
	strh r1, [ip, #0x28]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	mov r2, #0xf30
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0230DAB8

	arm_func_start SpecificRecruitCheck
SpecificRecruitCheck: ; 0x0230DB14
	stmdb sp!, {r4, lr}
	ldr r1, _0230DBC8 ; =ov29_02353538
	mov r4, r0
	ldr r1, [r1]
	ldrb r1, [r1, #0x759]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl DebugRecruitingEnabled
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x97
	ldreq r0, _0230DBC8 ; =ov29_02353538
	ldreq r0, [r0]
	addeq r0, r0, #0x700
	ldreqsb r0, [r0, #0x98]
	cmpeq r0, #2
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, _0230DBCC ; =0x000001A3
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x1a4
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r1, #2
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #0xa
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #9
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #8
	cmp r4, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230DBC8: .word ov29_02353538
_0230DBCC: .word 0x000001A3
	arm_func_end SpecificRecruitCheck

	arm_func_start RecruitCheck
RecruitCheck: ; 0x0230DBD0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0230E024 ; =ov29_02353538
	mov r8, r0
	ldr r0, [r2]
	mov r7, r1
	ldrb r0, [r0, #0x748]
	ldr r5, [r8, #0xb4]
	ldr r6, [r7, #0xb4]
	bl IsRecruitingAllowed
	cmp r0, #0
	beq _0230DC28
	bl IsFullFloorFixedRoom
	cmp r0, #0
	bne _0230DC28
	bl IsLegendaryChallengeFloor
	cmp r0, #0
	bne _0230DC28
	mov r0, #0xa
	mov r1, #6
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	beq _0230DC30
_0230DC28:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DC30:
	ldr r0, _0230E024 ; =ov29_02353538
	ldr r1, [r0]
	ldrb r0, [r1, #0x75d]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r1, #0x748]
	cmp r0, #0x5b
	bne _0230DC70
	ldrsh r1, [r6, #2]
	ldr r0, _0230E028 ; =0x000001E6
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DC70:
	ldrsh r0, [r6, #2]
	cmp r0, #0x91
	cmpne r0, #0x90
	cmpne r0, #0x92
	ldrne r2, _0230E02C ; =0x0000010F
	cmpne r0, r2
	subne r1, r2, #1
	cmpne r0, r1
	cmpne r0, #0x110
	cmpne r0, #0x19c
	addne r1, r2, #0x8e
	cmpne r0, r1
	addne r1, r2, #0x92
	cmpne r0, r1
	cmpne r0, #0x1a0
	addne r1, r2, #0x93
	cmpne r0, r1
	addne r1, r2, #0x8a
	cmpne r0, r1
	addne r1, r2, #0x8b
	cmpne r0, r1
	addne r1, r2, #0x8c
	cmpne r0, r1
	beq _0230DCF0
	ldr r1, _0230E030 ; =0xFFFFFDEA
	add r1, r0, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _0230DD04
_0230DCF0:
	mov r1, #1
	bl IsMonsterOnTeam
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DD04:
	mov r0, r6
	bl ov29_022FBDE0
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r0, [r6, #2]
	bl SpecificRecruitCheck
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r1, [r8, #4]
	ldrsh r0, [r7, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _0230DD5C
	ldrsh r1, [r8, #6]
	ldrsh r0, [r7, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _0230DD64
_0230DD5C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230DD64:
	ldrb r0, [r6, #0x48]
	cmp r0, #0xfa
	ldrneb r0, [r6, #0xbc]
	cmpne r0, #7
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	bl ov29_022E1B28
	bl ov29_022E81F8
	ldrsh r0, [r6, #2]
	mov r1, #1
	bl IsMonsterOnTeam
	mov sb, r0
	mov r0, #0x3e8
	bl DungeonRandInt
	mov r4, r0
	bl HasPlayedOldGame
	cmp r0, #0
	beq _0230DDE0
	cmp sb, #0
	bne _0230DDE0
	ldrsh r0, [r6, #2]
	bl GetRecruitRate2
	mov r6, r0
	b _0230DDEC
_0230DDE0:
	ldrsh r0, [r6, #2]
	bl GetRecruitRate1
	mov r6, r0
_0230DDEC:
	cmp r6, #0
	ble _0230DDFC
	cmp sb, #0
	movne r6, r6, asr #1
_0230DDFC:
	ldr r0, _0230E034 ; =0xFFFFFC19
	cmp r6, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	mov r1, #0x35
	bl ItemIsActive__0230E578
	cmp r0, #0
	ldrne r0, _0230E038 ; =ov10_022C44FC
	ldrnesh r0, [r0]
	addne r6, r6, r0
	bne _0230DFD4
	mov r0, r8
	mov r1, #0x39
	bl ItemIsActive__0230E578
	cmp r0, #0
	ldrne r0, _0230E03C ; =ov10_022C443C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	bne _0230DFD4
	mov r0, r8
	mov r1, #0x3a
	bl ItemIsActive__0230E578
	cmp r0, #0
	ldrne r0, _0230E040 ; =ov10_022C447C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	bne _0230DFD4
	mov r0, r8
	mov r1, #0x3b
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DEA0
	mov r0, r7
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E044 ; =ov10_022C441C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DEA0:
	mov r0, r8
	mov r1, #0x3c
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DED4
	mov r0, r7
	mov r1, #2
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E048 ; =ov10_022C4410
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DED4:
	mov r0, r8
	mov r1, #0x3d
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DF08
	mov r0, r7
	mov r1, #9
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E04C ; =ov10_022C470C
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DF08:
	mov r0, r8
	mov r1, #0x3e
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DF3C
	mov r0, r7
	mov r1, #3
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E050 ; =ov10_022C4708
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DF3C:
	mov r0, r8
	mov r1, #0x3f
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DF70
	mov r0, r7
	mov r1, #0xd
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E054 ; =ov10_022C4704
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DF70:
	mov r0, r8
	mov r1, #0x40
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DFA4
	mov r0, r7
	mov r1, #4
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E058 ; =ov10_022C4700
	ldrnesh r0, [r0]
	addne r6, r6, r0
	b _0230DFD4
_0230DFA4:
	mov r0, r8
	mov r1, #0x41
	bl ItemIsActive__0230E578
	cmp r0, #0
	beq _0230DFD4
	mov r0, r7
	mov r1, #0xa
	bl MonsterIsType
	cmp r0, #0
	ldrne r0, _0230E05C ; =ov10_022C46FC
	ldrnesh r0, [r0]
	addne r6, r6, r0
_0230DFD4:
	mov r0, r8
	mov r1, #0x1e
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _0230E038 ; =ov10_022C44FC
	ldrb r1, [r5, #0xa]
	ldrnesh r0, [r0]
	mov r1, r1, lsl #1
	addne r6, r6, r0
	ldr r0, _0230E060 ; =ov10_022C5064
	ldrsh r0, [r0, r1]
	add r0, r6, r0
	cmp r4, r0
	mov r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetFirstEmptyMemberIdx
	cmp r0, #0
	movlt r0, #0
	movge r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230E024: .word ov29_02353538
_0230E028: .word 0x000001E6
_0230E02C: .word 0x0000010F
_0230E030: .word 0xFFFFFDEA
_0230E034: .word 0xFFFFFC19
_0230E038: .word ov10_022C44FC
_0230E03C: .word ov10_022C443C
_0230E040: .word ov10_022C447C
_0230E044: .word ov10_022C441C
_0230E048: .word ov10_022C4410
_0230E04C: .word ov10_022C470C
_0230E050: .word ov10_022C4708
_0230E054: .word ov10_022C4704
_0230E058: .word ov10_022C4700
_0230E05C: .word ov10_022C46FC
_0230E060: .word ov10_022C5064
	arm_func_end RecruitCheck

	arm_func_start TryRecruit
TryRecruit: ; 0x0230E064
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x114
	mov sl, r0
	mov r0, #0xa
	mov r5, #0
	mov sb, r1
	mov r8, r2
	bl ov29_0234BA54
	mov r0, r5
	bl ov29_0234B1A4
	bl ov29_0234D630
	add r0, sb, #4
	add r1, sl, #4
	mvn r7, #0
	bl GetDirectionTowardsPosition
	mov r6, r0
	ldr r4, [sb, #0xb4]
	mov r0, r5
	strb r0, [sb, #0x22]
	mov r0, sl
	mov r1, sb
	bl ov29_02305F60
	mov r1, r6
	mov r0, sb
	bl ov29_02304A48
	ldrsh r0, [r4, #2]
	mov r1, #1
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _0230E0FC
	bl ov29_0234B034
	mov r1, #1
	str r1, [sp]
	mov r1, r5
	ldr r2, [sb, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	b _0230E114
_0230E0FC:
	bl ov29_0234B034
	mov r1, r5
	str r1, [sp]
	ldr r2, [sb, #0xb4]
	mov r3, r1
	bl ov29_0230040C
_0230E114:
	bl ov29_0234B034
	mov r1, r0
	mov r3, #1
	mov r2, #0
	str r3, [sp]
	ldr r0, _0230E55C ; =0x00000C77
	mov r3, r2
	bl ov29_0234D7C0
	cmp r0, #2
	moveq r4, #0
	beq _0230E524
	mov r4, #1
	mov r0, #0
	orr r1, r4, #2
	strb r1, [sp, #0xac]
	strb r0, [sp, #0xad]
	ldrsh r2, [r8, #0xc]
	ldr r1, _0230E560 ; =ov29_02353538
	sub r3, r0, #1
	strb r2, [sp, #0xae]
	strh r4, [sp, #0xb2]
	ldr r2, [r1]
	ldrh r4, [r8, #0x44]
	add r1, sp, #0x14
	strh r4, [r1, #0xf2]
	ldrh r4, [r8, #0x46]
	strh r4, [r1, #0xf4]
	strb r0, [sp, #0x104]
	strh r3, [sp, #0xb4]
	strh r3, [sp, #0xb6]
	ldrsh r1, [r8]
	strh r1, [sp, #0xb8]
	ldrb r1, [r2, #0x748]
	strb r1, [sp, #0xaf]
	ldrb r1, [r2, #0x749]
	add r2, sp, #0xac
	strb r1, [sp, #0xb0]
	ldrsh r1, [r8, #6]
	strh r1, [sp, #0xba]
	ldrsh r1, [r8, #6]
	strh r1, [sp, #0xbc]
	ldrh r1, [r8, #0x14]
	strh r1, [sp, #0xf0]
	ldrh r1, [r8, #0x16]
	strh r1, [sp, #0xf2]
	ldrh r1, [r8, #0x18]
	strh r1, [sp, #0xf4]
	ldrh r1, [r8, #0x1a]
	strh r1, [sp, #0xf6]
_0230E1D8:
	add r4, r8, r0
	ldrb r1, [r4, #8]
	add r3, r2, r0
	add r0, r0, #1
	strb r1, [r3, #0x12]
	ldrb r1, [r4, #0xa]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	strb r1, [r3, #0x14]
	cmp r0, #2
	blt _0230E1D8
	ldr r0, [r8, #0x10]
	add r2, sp, #0xc8
	str r0, [sp, #0xc4]
	add r3, r8, #0x22
	mov r1, #0x11
_0230E218:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0230E218
	ldrh r0, [r8, #0x1c]
	strh r0, [sp, #0xea]
	ldrh r0, [r8, #0x1e]
	strh r0, [sp, #0xec]
	ldrh r0, [r8, #0x20]
	strh r0, [sp, #0xee]
	ldrsh r0, [r8]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x100
	add r0, r0, #0xa
	mov r2, #0xa
	bl sub_02025314
	ldrsh r1, [sp, #0xb8]
	ldrsh r2, [sp, #0xb2]
	add r0, sp, #0xf8
	bl sub_02058EB0
	add r1, sp, #0x100
	add r0, sp, #0x98
	add r1, r1, #0xa
	mov r2, #0xa
	add r4, sp, #0x18
	bl StrncpySimpleNoPad
	bl ov29_022EACAC
	bl ov29_0234B034
	mov r1, r0
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r0, _0230E564 ; =0x00000C7B
	mov r3, r2
	bl ov29_0234D7C0
	cmp r0, #1
	bne _0230E2D4
	bl ov29_0234D838
	add r6, sp, #0x100
	add r6, r6, #0xa
_0230E2BC:
	mov r0, r6
	add r1, sp, #0x98
	mov r2, #0
	bl ov29_0234F008
	cmp r0, #0
	beq _0230E2BC
_0230E2D4:
	add r1, sp, #0xac
	mov r0, r4
	bl sub_020585B4
	mov r1, r4
	mov r0, #0
	bl ov29_0234B0B4
	mov r0, #1
	mov r1, #0
	bl ov29_0234B084
	ldr r0, _0230E568 ; =0x00000C7E
	bl ov29_0230E658
	ldrsh r1, [r8, #2]
	ldrsh r2, [r8, #4]
	mov r0, sb
	bl ov29_02337EC0
	ldrsh r2, [r8, #2]
	ldrsh r3, [r8, #4]
	mov r0, sl
	mov r1, sb
	bl ov29_0230E5A8
	cmp r0, #0
	bne _0230E42C
	add r0, sp, #0xac
	mvn r1, #0
	bl ov29_0230E5FC
	mov r7, r0
	b _0230E410
_0230E340:
	ldr r0, _0230E56C ; =0x00000C7F
	bl ov29_0230E658
	mvn r4, #0
_0230E34C:
	bl ov29_0234D838
	add r1, sp, #0x100
	mov r0, sb
	add r1, r1, #0xa
	bl ov29_0234EE10
	movs r6, r0
	beq _0230E3D4
	cmp r6, sb
	add r0, sp, #0x58
	bne _0230E380
	add r1, sp, #0xac
	bl sub_020585B4
	b _0230E38C
_0230E380:
	ldr r1, [r6, #0xb4]
	ldrsh r1, [r1, #0xc]
	bl sub_020584FC
_0230E38C:
	mov r0, #0
	add r1, sp, #0x58
	bl ov29_0234B0B4
	mov r0, #1
	mov r1, sl
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl ov29_0234B034
	mov r1, #1
	mov r2, #0
	str r1, [sp]
	mov r1, r0
	mov r0, #0xc80
	mov r3, r2
	bl ov29_0234D7C0
	mov fp, r0
	cmp fp, r4
	beq _0230E34C
_0230E3D4:
	cmp fp, #2
	cmpne r6, #0
	beq _0230E410
	ldr r0, _0230E56C ; =0x00000C7F
	add r0, r0, #2
	bl ov29_0230E658
	mov r0, r6
	bl ov29_022E68BC
	ldr r1, _0230E570 ; =0x00000233
	mov r0, r6
	mov r2, sl
	bl HandleFaint
	cmp r6, sb
	moveq r4, #1
	beq _0230E524
_0230E410:
	mov r0, sl
	mov r1, sb
	ldrsh r2, [r8, #2]
	ldrsh r3, [r8, #4]
	bl ov29_0230E5A8
	cmp r0, #0
	beq _0230E340
_0230E42C:
	mov r6, #0
	mov r4, r6
	mov r5, #1
	b _0230E468
_0230E43C:
	mov r0, r6
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0230E470
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230E468:
	cmp r6, #4
	blt _0230E43C
_0230E470:
	add r0, sp, #0xac
	mov r1, r7
	strh r6, [sp, #0xb6]
	bl ov29_0230E5FC
	strh r0, [sp, #0xb4]
	ldrsh r1, [sp, #0xb4]
	mov r0, r6
	bl sub_02056698
	ldr r1, _0230E570 ; =0x00000233
	mov r0, sb
	mov r2, sl
	bl HandleFaint
	mov r0, r6
	bl GetActiveTeamMember
	mov r4, r0
	add r7, sp, #0xac
	mov r6, r4
	mov r5, #6
_0230E4B8:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230E4B8
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	bl ov29_022E8104
	bl ov29_022E81F8
	add r1, sp, #0x14
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	ldrsh r2, [r8, #4]
	mov r3, r4
	bl InitTeamMember
	ldrsh r0, [r4, #0xc]
	bl SetPokemonJoined
	bl ov29_022E8104
	bl ov29_022E81F8
	ldr r5, [sp, #0x14]
	mov r4, #1
_0230E524:
	mov r0, #1
	bl ov29_0234D8A0
	cmp r4, #0
	bne _0230E540
	ldr r1, _0230E574 ; =0x00000C78
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_0230E540:
	cmp r5, #0
	beq _0230E550
	mov r0, r5
	bl EnsureCanStandCurrentTile
_0230E550:
	mov r0, r4
	add sp, sp, #0x114
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230E55C: .word 0x00000C77
_0230E560: .word ov29_02353538
_0230E564: .word 0x00000C7B
_0230E568: .word 0x00000C7E
_0230E56C: .word 0x00000C7F
_0230E570: .word 0x00000233
_0230E574: .word 0x00000C78
	arm_func_end TryRecruit

	arm_func_start ItemIsActive__0230E578
ItemIsActive__0230E578: ; 0x0230E578
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__0230E578

	arm_func_start ov29_0230E5A8
ov29_0230E5A8: ; 0x0230E5A8
	stmdb sp!, {r4, lr}
	ldr r4, [r1, #0xb4]
	mov r1, r2
	ldrsh r0, [r4, #2]
	mov r2, r3
	mov r3, #1
	bl ov29_022FD318
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #2]
	bl ov29_022FBC94
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_02056830
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230E5A8

	arm_func_start ov29_0230E5FC
ov29_0230E5FC: ; 0x0230E5FC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x44
	mov r5, r0
	mov r4, r1
	add r0, sp, #0
	mov r1, r5
	bl sub_020534BC
	mov r1, #0
	sub r0, r1, #1
	strb r1, [sp, #6]
	strb r1, [sp, #7]
	cmp r4, r0
	bne _0230E640
	add r0, sp, #0
	bl sub_02055CCC
	mov r4, r0
	b _0230E64C
_0230E640:
	ldrsh r0, [r5, #8]
	add r1, sp, #0
	bl sub_02055D7C
_0230E64C:
	mov r0, r4
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_0230E5FC

	arm_func_start ov29_0230E658
ov29_0230E658: ; 0x0230E658
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_02025888
	mov r5, r0
	mov r0, r4
	bl StringFromMessageId
	mov r4, r0
	bl ov29_0234B034
	mov r2, r4
	str r0, [sp]
	mov r0, r5
	mov r1, #0x400
	mov r3, r1
	bl PreprocessString
	mov r0, r5
	bl ov29_0234BB50
	bl ov29_0234B034
	mov r1, r0
	mov r0, r5
	mov r2, #1
	str r2, [sp]
	mov r2, #0
	mov r3, r2
	bl ov29_0234D6C8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0230E658

	arm_func_start TrySpawnMonsterAndTickSpawnCounter
TrySpawnMonsterAndTickSpawnCounter: ; 0x0230E6BC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r0, _0230E8D8 ; =ov29_02353538
	mov r6, #0
	ldr r7, [r0]
	add r0, r7, #0x700
	ldrsh r1, [r0, #0x86]
	cmp r1, #0
	beq _0230E8D0
	ldrsh r1, [r0, #0x82]
	add r1, r1, #1
	strh r1, [r0, #0x82]
	ldrb r1, [r7, #0x790]
	cmp r1, #0
	bne _0230E710
	ldr r1, _0230E8DC ; =ov10_022C44DC
	ldrsh r2, [r0, #0x82]
	ldrsh r0, [r1]
	cmp r2, r0
	bge _0230E724
	b _0230E8D0
_0230E710:
	ldr r1, _0230E8E0 ; =ov10_022C4640
	ldrsh r2, [r0, #0x82]
	ldrsh r0, [r1]
	cmp r2, r0
	blt _0230E8D0
_0230E724:
	cmp r2, #0x384
	ble _0230E76C
	add r0, r7, #0x19000
	ldr r4, [r0, #0x908]
	mov r0, r4
	bl EntityIsValid__0230E8F0
	cmp r0, #0
	beq _0230E76C
	add r0, r7, #0x19000
	ldrh r1, [r4, #0x26]
	ldr r0, [r0, #0x910]
	cmp r1, r0
	bne _0230E76C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r6, r4
_0230E76C:
	mov r5, #0
	add r0, r7, #0x700
	strh r5, [r0, #0x82]
	add r0, r7, #0x19000
	mov r4, r5
	str r5, [r0, #0x908]
_0230E784:
	add r0, r7, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb38]
	mov r0, r8
	bl EntityIsValid__0230E8F0
	cmp r0, #0
	beq _0230E7B8
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x100
	addeq r5, r5, #1
_0230E7B8:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0230E784
	ldrb r0, [r7, #0x790]
	cmp r0, #0
	bne _0230E80C
	ldr r0, _0230E8D8 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xc9]
	cmp r0, #0xff
	bne _0230E7FC
	ldr r0, _0230E8E4 ; =ov10_022C4430
	ldrsh r0, [r0]
	cmp r5, r0
	blt _0230E80C
	b _0230E8D0
_0230E7FC:
	ldr r0, _0230E8E8 ; =ov10_022C46A4
	ldrsh r0, [r0]
	cmp r5, r0
	bge _0230E8D0
_0230E80C:
	cmp r6, #0
	beq _0230E828
	ldr r1, _0230E8EC ; =0x00000C5D
	mov r0, #0
	bl LogMessageByIdWithPopup
	mov r0, r6
	bl ov29_022E62F0
_0230E828:
	ldrb r0, [r7, #0x790]
	cmp r0, #0
	beq _0230E83C
	bl GetKecleonIdToSpawnByFloor
	b _0230E844
_0230E83C:
	mov r0, #0
	bl GetMonsterIdToSpawn
_0230E844:
	mov r5, r0
	mov r0, r5
	bl GetMonsterLevelToSpawn
	movs r4, r0
	mov r0, r5
	mov r1, #0
	moveq r4, #1
	bl MewSpawnCheck
	cmp r0, #0
	beq _0230E8D0
	add r0, sp, #0xa
	mov r1, #0
	bl ov29_022E9628
	cmp r0, #0
	beq _0230E8D0
	mov r1, #0
	mov r0, #0x64
	strh r5, [sp]
	strh r4, [sp, #8]
	strb r1, [sp, #2]
	bl DungeonRandInt
	ldr r1, _0230E8D8 ; =ov29_02353538
	mov r4, r0
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl GetRandomMovementChance
	cmp r4, r0
	movlt r0, #1
	strlt r0, [sp, #4]
	movge r0, #0
	strge r0, [sp, #4]
	mov r1, #0
	add r0, sp, #0
	strb r1, [sp, #0xe]
	bl SpawnMonster
_0230E8D0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0230E8D8: .word ov29_02353538
_0230E8DC: .word ov10_022C44DC
_0230E8E0: .word ov10_022C4640
_0230E8E4: .word ov10_022C4430
_0230E8E8: .word ov10_022C46A4
_0230E8EC: .word 0x00000C5D
	arm_func_end TrySpawnMonsterAndTickSpawnCounter
