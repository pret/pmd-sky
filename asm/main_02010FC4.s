	.include "asm/macros.inc"
	.include "main_02010FC4.inc"

	.text

	arm_func_start IsExclusiveItemIdForMonster
IsExclusiveItemIdForMonster: ; 0x02010FC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetItemCategory
	cmp r0, #0xf
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r8, #0x258
	mov r5, #0
	ble _02011000
	mov r0, r8
	bl FemaleToMaleForm
	mov r8, r0
_02011000:
	mov r0, sb
	bl GetExclusiveItemType
	movs r4, r0
	moveq r5, #0
	beq _0201108C
	sub r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	mov r0, sb
	bhi _0201104C
	bl GetExclusiveItemParameter
	and r0, r0, #0xff
	cmp r7, r0
	cmpne r6, r0
	moveq r5, #1
	b _0201108C
_0201104C:
	bl GetExclusiveItemParameter
	mov r6, r0
	cmp r4, #9
	bne _02011068
	cmp r8, r6
	moveq r5, #1
	b _0201108C
_02011068:
	cmp r4, #0xa
	bne _0201107C
	cmp r8, r6
	moveq r5, #1
	b _0201108C
_0201107C:
	mov r0, r8
	bl GetFamilyIndex
	cmp r6, r0
	moveq r5, #1
_0201108C:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end IsExclusiveItemIdForMonster

	arm_func_start IsExclusiveItemForMonster
IsExclusiveItemForMonster: ; 0x02011094
	stmdb sp!, {r3, lr}
	ldrb ip, [r0]
	tst ip, #1
	movne lr, #1
	moveq lr, #0
	tst lr, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst ip, #8
	movne ip, #1
	moveq ip, #0
	tst ip, #0xff
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl IsExclusiveItemIdForMonster
	ldmia sp!, {r3, pc}
	arm_func_end IsExclusiveItemForMonster

	arm_func_start BagHasExclusiveItemTypeForMonster
BagHasExclusiveItemTypeForMonster: ; 0x020110D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl GetCurrentBagCapacity
	mov r4, r0, lsl #0x10
	mov r5, #0
	ldr fp, _02011164 ; =EXCLUSIVE_ITEM_EFFECT_DATA
	b _02011154
_02011100:
	ldr r0, _02011168 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, sb
	ldr r0, [r0]
	mov r2, r8
	ldr r3, [r0, #0x384]
	mov r0, #6
	smlabb r6, r5, r0, r3
	mov r0, r6
	mov r3, r7
	bl IsExclusiveItemForMonster
	cmp r0, #0
	beq _02011148
	ldrsh r0, [r6, #4]
	bl GetExclusiveItemOffset
	ldrb r0, [fp, r0, lsl #1]
	cmp sl, r0
	ldreqsh r0, [r6, #4]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02011148:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02011154:
	cmp r5, r4, asr #16
	blt _02011100
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011164: .word EXCLUSIVE_ITEM_EFFECT_DATA
_02011168: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end BagHasExclusiveItemTypeForMonster

	arm_func_start GetExclusiveItemForMonsterFromBag
GetExclusiveItemForMonsterFromBag: ; 0x0201116C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov fp, r3
	ldr r7, [sp, #0x28]
	bl GetCurrentBagCapacity
	mov r4, r0, lsl #0x10
	mov r5, #0
	b _02011208
_02011194:
	ldr r0, _02011218 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, r8
	ldr r0, [r0]
	mov r2, fp
	ldr r3, [r0, #0x384]
	mov r0, #6
	smlabb r6, r5, r0, r3
	mov r0, r6
	mov r3, r7
	bl IsExclusiveItemForMonster
	cmp r0, #0
	beq _020111FC
	ldrsh r0, [r6, #4]
	bl GetExclusiveItemOffset
	ldr r1, _0201121C ; =EXCLUSIVE_ITEM_EFFECT_DATA
	ldrb r0, [r1, r0, lsl #1]
	cmp sb, r0
	bne _020111FC
	ldrh r1, [r6]
	mov r0, #1
	strh r1, [sl]
	ldrh r1, [r6, #2]
	strh r1, [sl, #2]
	ldrh r1, [r6, #4]
	strh r1, [sl, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020111FC:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02011208:
	cmp r5, r4, asr #16
	blt _02011194
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011218: .word BAG_ITEMS_PTR_MIRROR
_0201121C: .word EXCLUSIVE_ITEM_EFFECT_DATA
	arm_func_end GetExclusiveItemForMonsterFromBag

	arm_func_start sub_02011220
sub_02011220: ; 0x02011220
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	mov r8, r0
	mov r7, r1
	mov fp, r2
	str r3, [sp, #4]
	bl GetCurrentBagCapacity
	mov sb, r0, lsl #0x10
	mov r0, r8
	mov r1, #0x18
	mov r5, #0
	bl MemZero
	mov r4, r5
	b _0201130C
_02011258:
	ldr r1, _0201138C ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #6
	ldr r1, [r1]
	smulbb r6, r4, r0
	ldr r0, [r1, #0x384]
	ldr r3, [sp, #4]
	mov r1, r7
	mov r2, fp
	add r0, r0, r6
	bl IsExclusiveItemForMonster
	cmp r0, #0
	beq _02011300
	ldr r0, _0201138C ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	mov ip, lr
	ldr sl, [r0]
	b _020112D8
_0201129C:
	ldr r3, [sl, #0x384]
	mov r1, ip, lsl #1
	add r0, sp, #8
	ldrsh r2, [r0, r1]
	add r0, r3, r6
	ldrsh r1, [r0, #4]
	mov r0, #6
	smlabb r0, r2, r0, r3
	ldrsh r0, [r0, #4]
	cmp r0, r1
	moveq lr, #1
	beq _020112E0
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov ip, r0, asr #0x10
_020112D8:
	cmp ip, r5
	blt _0201129C
_020112E0:
	cmp lr, #0
	bne _02011300
	add r0, r5, #1
	mov r1, r0, lsl #0x10
	mov r2, r5, lsl #1
	add r0, sp, #8
	strh r4, [r0, r2]
	mov r5, r1, asr #0x10
_02011300:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0201130C:
	cmp r4, sb, asr #16
	blt _02011258
	mov sl, #0
	add r4, r8, #3
	add r7, sp, #8
	ldr r6, _02011390 ; =EXCLUSIVE_ITEM_EFFECT_DATA
	ldr fp, _0201138C ; =BAG_ITEMS_PTR_MIRROR
	b _0201137C
_0201132C:
	mov r0, sl, lsl #1
	ldr r2, [fp]
	ldrsh r1, [r7, r0]
	ldr r2, [r2, #0x384]
	mov r0, #6
	smlabb sb, r1, r0, r2
	ldrsh r0, [sb, #4]
	bl GetExclusiveItemOffset
	ldrb r1, [r6, r0, lsl #1]
	add r0, r8, #4
	bl SetExclusiveItemEffect
	str r4, [sp]
	ldrsh r0, [sb, #4]
	mov r1, r8
	add r2, r8, #1
	add r3, r8, #2
	bl ApplyExclusiveItemStatBoosts
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_0201137C:
	cmp sl, r5
	blt _0201132C
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201138C: .word BAG_ITEMS_PTR_MIRROR
_02011390: .word EXCLUSIVE_ITEM_EFFECT_DATA
	arm_func_end sub_02011220

	arm_func_start GetHpBoostFromExclusiveItems
GetHpBoostFromExclusiveItems: ; 0x02011394
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #4
	mov r1, #0x4c
	mov r4, #0
	bl ExclusiveItemEffectFlagTest
	cmp r0, #0
	ldrne r0, _0201141C ; =_020A1878
	mov r1, #0x4d
	ldrnesh r0, [r0]
	addne r0, r4, r0
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
	add r0, r5, #4
	bl ExclusiveItemEffectFlagTest
	cmp r0, #0
	ldrne r0, _0201141C ; =_020A1878
	mov r1, #0x4e
	ldrnesh r0, [r0]
	addne r0, r4, r0, lsl #1
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
	add r0, r5, #4
	bl ExclusiveItemEffectFlagTest
	cmp r0, #0
	beq _02011414
	ldr r0, _0201141C ; =_020A1878
	ldrsh r0, [r0]
	add r0, r0, r0, lsl #1
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02011414:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201141C: .word _020A1878
	arm_func_end GetHpBoostFromExclusiveItems

	arm_func_start sub_02011420
sub_02011420: ; 0x02011420
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r1, #0
	bl GetType
	mov r4, r0
	mov r0, sl
	mov r1, #1
	bl GetType
	mov r5, r0
	mov r0, #8
	mov r1, #0
	bl MemAlloc
	mov r6, r0
	mov r0, #0xaf0
	mov r1, #0
	bl MemAlloc
	ldr fp, _020114F4 ; =0x00000578
	mov r8, r0
	mov sb, #0
	mov r7, #0x1bc
_02011470:
	mov r0, r7
	mov r1, sl
	mov r2, r4
	mov r3, r5
	bl IsExclusiveItemIdForMonster
	cmp r0, #0
	addne r0, sb, #1
	movne r1, sb, lsl #1
	movne r0, r0, lsl #0x10
	movne sb, r0, asr #0x10
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	strneh r7, [r8, r1]
	cmp fp, r0, asr #16
	mov r7, r0, asr #0x10
	bgt _02011470
	mov r0, sb, lsl #1
	mov r1, #0
	bl MemAlloc
	stmia r6, {r0, sb}
	mov r3, #0
	b _020114DC
_020114C8:
	mov r2, r3, lsl #1
	ldrsh r1, [r8, r2]
	ldr r0, [r6]
	add r3, r3, #1
	strh r1, [r0, r2]
_020114DC:
	cmp r3, sb
	blt _020114C8
	mov r0, r8
	bl MemFree
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020114F4: .word 0x00000578
	arm_func_end sub_02011420

	arm_func_start SwapShopFreeDoublePointer
SwapShopFreeDoublePointer: ; 0x020114F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	bl MemFree
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end SwapShopFreeDoublePointer

	arm_func_start ApplyGummiBoostsToGroundMonster
ApplyGummiBoostsToGroundMonster: ; 0x02011528
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov ip, r0
	stmia sp, {r1, r2, r3}
	add r0, ip, #4
	add r1, ip, #8
	add r2, ip, #0xc
	add r3, ip, #0xe
	bl ApplyGummiBoostsGroundMode
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ApplyGummiBoostsToGroundMonster

	arm_func_start ApplyGummiBoostsToTeamMember
ApplyGummiBoostsToTeamMember: ; 0x02011554
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov ip, r0
	stmia sp, {r1, r2, r3}
	add r0, ip, #0xc
	add r1, ip, #6
	add r2, ip, #0x12
	add r3, ip, #0x14
	bl ApplyGummiBoostsGroundMode
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ApplyGummiBoostsToTeamMember

	arm_func_start ApplySitrusBerryBoostToGroundMonster
ApplySitrusBerryBoostToGroundMonster: ; 0x02011580
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020115B8 ; =SITRUS_BERRY_FULL_HP_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrsh r4, [r7, #0xa]
	mov r6, r1
	add r0, r7, #0xa
	mov r1, r5
	bl ModifyHpStat
	cmp r6, #0
	strne r5, [r6]
	ldrsh r0, [r7, #0xa]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020115B8: .word SITRUS_BERRY_FULL_HP_BOOST
	arm_func_end ApplySitrusBerryBoostToGroundMonster

	arm_func_start ApplyLifeSeedBoostToGroundMonster
ApplyLifeSeedBoostToGroundMonster: ; 0x020115BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020115F4 ; =LIFE_SEED_HP_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrsh r4, [r7, #0xa]
	mov r6, r1
	add r0, r7, #0xa
	mov r1, r5
	bl ModifyHpStat
	cmp r6, #0
	strne r5, [r6]
	ldrsh r0, [r7, #0xa]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020115F4: .word LIFE_SEED_HP_BOOST
	arm_func_end ApplyLifeSeedBoostToGroundMonster

	arm_func_start ApplyGinsengToGroundMonster
ApplyGinsengToGroundMonster: ; 0x020115F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	mov r0, #0x64
	mov sb, r1
	mov r8, r2
	mvn r4, #0
	mov r6, #0
	bl RandInt
	ldr r1, _02011708 ; =GINSENG_CHANCE_3
	mov ip, #0
	ldrsh r1, [r1]
	mov r2, #1
	cmp r0, r1
	movlt r7, #3
	movge r7, #1
	mov r1, ip
	mov r0, #6
	b _02011664
_02011640:
	mla r3, ip, r0, r5
	ldrb r3, [r3, #0x22]
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	movne r4, ip
	bne _0201166C
	add ip, ip, #1
_02011664:
	cmp ip, #4
	blt _02011640
_0201166C:
	mvn r0, #0
	cmp r4, r0
	bne _02011698
	cmp sb, #0
	movne r0, #0
	strneh r0, [sb]
	cmp r8, #0
	movne r0, #0
	strne r0, [r8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02011698:
	add r1, r5, #0x22
	mov r0, #6
	mla r5, r4, r0, r1
	mov r0, r5
	bl GetMoveBasePowerGround
	cmp r0, #0
	beq _020116E4
	mov r0, r5
	ldrb r4, [r5, #4]
	bl GetMoveMaxGinsengBoostGround
	ldrb r1, [r5, #4]
	add r2, r1, r7
	and r1, r2, #0xff
	strb r2, [r5, #4]
	cmp r1, r0
	strgeb r0, [r5, #4]
	ldrb r0, [r5, #4]
	cmp r4, r0
	movne r6, #1
_020116E4:
	cmp sb, #0
	ldrneh r0, [r5, #2]
	strneh r0, [sb]
	cmp r8, #0
	strne r7, [r8]
	cmp r6, #0
	moveq r7, #0
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02011708: .word GINSENG_CHANCE_3
	arm_func_end ApplyGinsengToGroundMonster

	arm_func_start ApplyProteinBoostToGroundMonster
ApplyProteinBoostToGroundMonster: ; 0x0201170C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02011744 ; =PROTEIN_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xc]
	mov r6, r1
	add r0, r7, #0xc
	mov r1, r5
	bl ModifyOffensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xc]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011744: .word PROTEIN_STAT_BOOST
	arm_func_end ApplyProteinBoostToGroundMonster

	arm_func_start ApplyCalciumBoostToGroundMonster
ApplyCalciumBoostToGroundMonster: ; 0x02011748
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02011780 ; =CALCIUM_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xd]
	mov r6, r1
	add r0, r7, #0xd
	mov r1, r5
	bl ModifyOffensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xd]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011780: .word CALCIUM_STAT_BOOST
	arm_func_end ApplyCalciumBoostToGroundMonster

	arm_func_start ApplyIronBoostToGroundMonster
ApplyIronBoostToGroundMonster: ; 0x02011784
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020117BC ; =IRON_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xe]
	mov r6, r1
	add r0, r7, #0xe
	mov r1, r5
	bl ModifyDefensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xe]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020117BC: .word IRON_STAT_BOOST
	arm_func_end ApplyIronBoostToGroundMonster

	arm_func_start ApplyZincBoostToGroundMonster
ApplyZincBoostToGroundMonster: ; 0x020117C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020117F8 ; =ZINC_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xf]
	mov r6, r1
	add r0, r7, #0xf
	mov r1, r5
	bl ModifyDefensiveStat
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xf]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020117F8: .word ZINC_STAT_BOOST
	arm_func_end ApplyZincBoostToGroundMonster

	arm_func_start ApplyNectarBoostToGroundMonster
ApplyNectarBoostToGroundMonster: ; 0x020117FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrsh r4, [r6, #8]
	mov r5, r1
	add r0, r6, #8
	mov r1, #0xa
	bl ModifyIqStat
	cmp r5, #0
	movne r0, #0xa
	strne r0, [r5]
	ldrsh r0, [r6, #8]
	sub r0, r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ApplyNectarBoostToGroundMonster

	arm_func_start IsMonsterAffectedByGravelyrockGroundMode
IsMonsterAffectedByGravelyrockGroundMode: ; 0x02011830
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r0, #0x1e0
	cmpne r0, #0xb9
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsMonsterAffectedByGravelyrockGroundMode

	arm_func_start ApplyGravelyrockBoostToGroundMonster
ApplyGravelyrockBoostToGroundMonster: ; 0x02011850
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldrsh r4, [r6, #8]
	bl IsMonsterAffectedByGravelyrockGroundMode
	cmp r0, #0
	beq _02011884
	add r0, r6, #8
	mov r1, #0xa
	bl ModifyIqStat
	cmp r5, #0
	movne r0, #0xa
	b _0201188C
_02011884:
	cmp r5, #0
	movne r0, #0
_0201188C:
	strne r0, [r5]
	ldrsh r0, [r6, #8]
	sub r0, r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ApplyGravelyrockBoostToGroundMonster

	arm_func_start ApplyGummiBoostsGroundMode
ApplyGummiBoostsGroundMode: ; 0x0201189C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrsh r0, [sp, #0x28]
	mov r4, #0
	ldr r6, [sp, #0x30]
	sub r5, r4, #1
	strh r5, [r6]
	mov sb, r1
	mov r8, r2
	mov r7, r3
	sub fp, r0, #0x77
	strh r4, [r6, #2]
	bl IsGummi
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsh r0, [sp, #0x28]
	cmp r0, #0x88
	bne _020118FC
	ldr r1, _02011AA0 ; =WONDER_GUMMI_IQ_GAIN
	ldr r0, _02011AA4 ; =WONDER_GUMMI_STAT_BOOST
	ldrsh r1, [r1]
	ldrsh r5, [r0]
	add r4, r4, r1
	b _02011950
_020118FC:
	ldrsh r0, [sl]
	ldr r2, _02011AA8 ; =GUMMI_STAT_BOOST
	mov r1, r4
	ldrsh r5, [r2]
	bl GetType
	str r0, [sp]
	ldrsh r0, [sl]
	mov r1, #1
	bl GetType
	add sl, fp, #1
	ldr fp, _02011AAC ; =IQ_GUMMI_GAIN_TABLE
	ldr r1, [sp]
	mov r2, #0x24
	mla r3, r1, r2, fp
	mla r1, r0, r2, fp
	mov sl, sl, lsl #1
	ldrsh r2, [sl, r3]
	ldrsh r0, [sl, r1]
	cmp r2, r0
	addgt r4, r4, r2
	addle r4, r4, r0
_02011950:
	ldrsh r1, [sb]
	add r0, r1, r4
	strh r0, [sb]
	ldrsh r0, [sb]
	cmp r0, #1
	sub r2, r0, r1
	movlt r0, #1
	strlth r0, [sb]
	ldrsh r1, [sb]
	ldr r0, _02011AB0 ; =0x000003E7
	cmp r1, r0
	strgth r0, [sb]
	cmp r2, #9
	movge r1, #0
	bge _020119A4
	cmp r2, #5
	movge r1, #1
	bge _020119A4
	cmp r2, #3
	movge r1, #2
	movlt r1, #3
_020119A4:
	ldrb r0, [sp, #0x2c]
	strh r1, [r6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r1, #0
	bne _020119D4
	mov r0, #0x10
	bl RandIntSafe
	cmp r0, #0xa
	moveq r0, #0xf
	streqh r0, [r6, #2]
	beq _020119EC
_020119D4:
	mov r0, #4
	bl RandIntSafe
	ldr r1, _02011AB4 ; =_0209889C
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	strh r0, [r6, #2]
_020119EC:
	ldrh r1, [r6, #2]
	tst r1, #1
	beq _02011A18
	ldrb r0, [r8]
	cmp r0, #0xff
	bichs r0, r1, #1
	strhsh r0, [r6, #2]
	bhs _02011A18
	mov r0, r8
	mov r1, r5
	bl ModifyOffensiveStat
_02011A18:
	ldrh r1, [r6, #2]
	tst r1, #2
	beq _02011A44
	ldrb r0, [r8, #1]
	cmp r0, #0xff
	bichs r0, r1, #2
	strhsh r0, [r6, #2]
	bhs _02011A44
	mov r1, r5
	add r0, r8, #1
	bl ModifyOffensiveStat
_02011A44:
	ldrh r1, [r6, #2]
	tst r1, #4
	beq _02011A70
	ldrb r0, [r7]
	cmp r0, #0xff
	bichs r0, r1, #4
	strhsh r0, [r6, #2]
	bhs _02011A70
	mov r0, r7
	mov r1, r5
	bl ModifyDefensiveStat
_02011A70:
	ldrh r1, [r6, #2]
	tst r1, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #1]
	cmp r0, #0xff
	bichs r0, r1, #8
	strhsh r0, [r6, #2]
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, r5
	add r0, r7, #1
	bl ModifyDefensiveStat
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011AA0: .word WONDER_GUMMI_IQ_GAIN
_02011AA4: .word WONDER_GUMMI_STAT_BOOST
_02011AA8: .word GUMMI_STAT_BOOST
_02011AAC: .word IQ_GUMMI_GAIN_TABLE
_02011AB0: .word 0x000003E7
_02011AB4: .word _0209889C
	arm_func_end ApplyGummiBoostsGroundMode

	arm_func_start WipeRecycleShopRecords
WipeRecycleShopRecords: ; 0x02011AB8
	stmdb sp!, {r3, lr}
	ldr ip, _02011B38 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [ip]
	mov r2, r0
	add r1, r1, #0x1000
	strb r0, [r1, #0x3aa]
	ldr r1, [ip]
	sub lr, r0, #1
	add r1, r1, #0x1000
	str r0, [r1, #0x3ac]
	ldr r3, [ip]
	mov r1, #0x6d
	add r3, r3, #0x1300
	strh r0, [r3, #0xb0]
	ldr r3, [ip]
	add r3, r3, #0x1300
	strh lr, [r3, #0xb2]
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6b
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6c
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6a
	bl SaveScriptVariableValue
	ldmia sp!, {r3, pc}
	.align 2, 0
_02011B38: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end WipeRecycleShopRecords

	arm_func_start sub_02011B3C
sub_02011B3C: ; 0x02011B3C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sl, r0
	mov r8, r1
	mov r7, r2
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	mov sb, r0
	mov r0, sl
	mov r1, r8
	mov r2, r7
	bl CountValidRecycleShopItems
	movs r1, r0
	str r0, [sb, #4]
	moveq r0, #0
	streq r0, [sb]
	beq _02011CE8
	mov r0, #0x18
	mul r0, r1, r0
	mov r1, #6
	bl MemAlloc
	str r0, [sb]
	ldr r2, [sb, #4]
	mov r1, #0x18
	mul r1, r2, r1
	bl MemZero
	mov r5, #0
	mov r6, r5
	mov r4, #0x18
	b _02011BF8
_02011BB8:
	str r7, [sp]
	ldr r0, [sb]
	mov r1, r6
	mla r0, r5, r4, r0
	mov r2, sl
	mov r3, r8
	bl sub_0201297C
	cmp r0, #0
	beq _02011BEC
	ldr r0, [sb, #4]
	add r5, r5, #1
	cmp r5, r0
	beq _02011C00
_02011BEC:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02011BF8:
	cmp r6, #0x18
	blt _02011BB8
_02011C00:
	mov r8, #0
	b _02011CDC
_02011C08:
	mov r0, #0x18
	mul sl, r8, r0
	ldr r0, [sb]
	mvn r6, #0
	ldr r0, [r0, sl]
	ldrsh r0, [r0]
	bl sub_0200D1F0
	mov fp, r0
	add r7, r8, #1
	b _02011C68
_02011C30:
	mov r0, #0x18
	mul r4, r7, r0
	ldr r5, [sb]
	ldr r0, [r5, r4]
	ldrsh r0, [r0]
	bl sub_0200D1F0
	cmp fp, r0
	ble _02011C64
	ldr r0, [r5, r4]
	mov r6, r7
	ldrsh r0, [r0]
	bl sub_0200D1F0
	mov fp, r0
_02011C64:
	add r7, r7, #1
_02011C68:
	ldr r0, [sb, #4]
	cmp r7, r0
	blt _02011C30
	mvn r0, #0
	cmp r6, r0
	beq _02011CD8
	ldr r4, [sb]
	mov r0, #0x18
	add fp, r4, sl
	mul r5, r6, r0
	add r7, sp, #4
	mov sl, fp
	mov r6, r7
	ldmia sl!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1}
	stmia r7, {r0, r1}
	add r4, r4, r5
	ldmia r4!, {r0, r1, r2, r3}
	stmia fp!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia fp, {r0, r1}
	ldr r4, [sb]
	ldmia r6!, {r0, r1, r2, r3}
	add r4, r4, r5
	stmia r4!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r4, {r0, r1}
_02011CD8:
	add r8, r8, #1
_02011CDC:
	ldr r0, [sb, #4]
	cmp r8, r0
	blt _02011C08
_02011CE8:
	mov r0, sb
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02011B3C

	arm_func_start sub_02011CF4
sub_02011CF4: ; 0x02011CF4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	cmp r0, #2
	bne _02011D90
	ldr r0, _02011D98 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r5, [r0, #0xb2]
	cmp r5, r1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	mov r4, r0
	mov r1, #1
	mov r0, #0x18
	smulbb r0, r1, r0
	str r1, [r4, #4]
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #0x18
	mul r1, r2, r1
	bl MemZero
	str r6, [sp]
	ldr r0, [r4]
	mov r1, r5
	mov r3, r7
	mov r2, #2
	bl sub_0201297C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02011D90:
	bl sub_02011B3C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011D98: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011CF4

	arm_func_start sub_02011D9C
sub_02011D9C: ; 0x02011D9C
	ldr ip, _02011DB0 ; =sub_02011B3C
	mov r1, r0
	ldr r2, _02011DB4 ; =0x000F423F
	mov r0, #1
	bx ip
	.align 2, 0
_02011DB0: .word sub_02011B3C
_02011DB4: .word 0x000F423F
	arm_func_end sub_02011D9C

	arm_func_start FreeRecycleOfferItems
FreeRecycleOfferItems: ; 0x02011DB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	cmp r0, #0
	beq _02011DDC
	bl MemFree
_02011DDC:
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end FreeRecycleOfferItems
