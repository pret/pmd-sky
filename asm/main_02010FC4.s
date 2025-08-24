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

	arm_func_start sub_020114F8
sub_020114F8: ; 0x020114F8
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
	arm_func_end sub_020114F8

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
	bl sub_02054FB8
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
	bl sub_02054FB8
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
	bl sub_02054FEC
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
	bl sub_02054FEC
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
	bl sub_02055020
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
	bl sub_02055020
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
	bl sub_02055054
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
	bl sub_02055054
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
	bl sub_02054FEC
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
	bl sub_02054FEC
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
	bl sub_02055020
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
	bl sub_02055020
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011AA0: .word WONDER_GUMMI_IQ_GAIN
_02011AA4: .word WONDER_GUMMI_STAT_BOOST
_02011AA8: .word GUMMI_STAT_BOOST
_02011AAC: .word IQ_GUMMI_GAIN_TABLE
_02011AB0: .word 0x000003E7
_02011AB4: .word _0209889C
	arm_func_end ApplyGummiBoostsGroundMode

	arm_func_start sub_02011AB8
sub_02011AB8: ; 0x02011AB8
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
	arm_func_end sub_02011AB8

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
	bl sub_020128DC
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

	arm_func_start sub_02011DB8
sub_02011DB8: ; 0x02011DB8
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
	arm_func_end sub_02011DB8

	arm_func_start sub_02011DF0
sub_02011DF0: ; 0x02011DF0
	ldr r0, [r0]
	ldrsh r0, [r0]
	bx lr
	arm_func_end sub_02011DF0

	arm_func_start sub_02011DFC
sub_02011DFC: ; 0x02011DFC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02011DFC

	arm_func_start sub_02011E18
sub_02011E18: ; 0x02011E18
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	bx lr
	arm_func_end sub_02011E18

	arm_func_start sub_02011E24
sub_02011E24: ; 0x02011E24
	mov ip, #0
	mov r3, ip
	b _02011E58
_02011E30:
	ldr r2, [r0]
	mov r1, r3, lsl #2
	add r2, r2, #0x14
	ldrsh r1, [r2, r1]
	add r2, r2, r3, lsl #2
	cmp r1, #0
	beq _02011E60
	ldrsh r1, [r2, #2]
	add r3, r3, #1
	add ip, ip, r1
_02011E58:
	cmp r3, #4
	blt _02011E30
_02011E60:
	mov r0, ip
	bx lr
	arm_func_end sub_02011E24

	arm_func_start sub_02011E68
sub_02011E68: ; 0x02011E68
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02011EB4
_02011E74:
	ldr r2, [r0]
	mov r1, lr, lsl #2
	add r2, r2, #0x14
	ldrsh r1, [r2, r1]
	add ip, r2, lr, lsl #2
	cmp r1, #0
	beq _02011EBC
	add r1, r0, lr, lsl #1
	ldrsh r3, [r1, #4]
	ldrsh r2, [r1, #0xc]
	ldrsh r1, [ip, #2]
	add r2, r3, r2
	cmp r2, r1
	movlt r0, #0
	ldmltia sp!, {r3, pc}
	add lr, lr, #1
_02011EB4:
	cmp lr, #4
	blt _02011E74
_02011EBC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02011E68

	arm_func_start sub_02011EC4
sub_02011EC4: ; 0x02011EC4
	ldr r1, [r0]
	ldr r0, _02011EE4 ; =0x00000578
	ldrsh r1, [r1, #0x14]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02011EE4: .word 0x00000578
	arm_func_end sub_02011EC4

	arm_func_start sub_02011EE8
sub_02011EE8: ; 0x02011EE8
	ldr r0, _02011F10 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02011F10: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011EE8

	arm_func_start sub_02011F14
sub_02011F14: ; 0x02011F14
	ldr r0, _02011F2C ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	strh r1, [r0, #0xb2]
	bx lr
	.align 2, 0
_02011F2C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011F14

	arm_func_start sub_02011F30
sub_02011F30: ; 0x02011F30
	ldr r0, _02011F44 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	bx lr
	.align 2, 0
_02011F44: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011F30

	arm_func_start sub_02011F48
sub_02011F48: ; 0x02011F48
	ldr r0, _02011F5C ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x3aa]
	bx lr
	.align 2, 0
_02011F5C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011F48

	arm_func_start sub_02011F60
sub_02011F60: ; 0x02011F60
	stmdb sp!, {r4, lr}
	mov r0, #0
	mov r1, #0x6c
	bl LoadScriptVariableValue
	add r4, r0, #1
	ldr r1, _02011F9C ; =0x000F423F
	mov r0, #0
	cmp r4, r1
	movgt r4, r1
	mov r2, r4
	mov r1, #0x6c
	bl SaveScriptVariableValue
	mov r0, r4
	bl SetNbRecycled
	ldmia sp!, {r4, pc}
	.align 2, 0
_02011F9C: .word 0x000F423F
	arm_func_end sub_02011F60

	arm_func_start sub_02011FA0
sub_02011FA0: ; 0x02011FA0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r0, #0
	mov r1, #0x71
	bl LoadScriptVariableValue
	and r0, r0, #0xff
	cmp r0, #1
	bne _0201207C
	ldr r1, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #3
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r6, [r1, #0x3aa]
	ldr r5, [r1, #0x3ac]
	mov r1, r6
	mov r2, r5
	bl sub_020128DC
	mov r4, r0
	mov r1, r6
	mov r2, r5
	mov r0, #2
	bl sub_020128DC
	sub r4, r4, r0
	mov r0, #0
	mov r1, #0x6c
	bl LoadScriptVariableValue
	ldr r1, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x3ac]
	bl GetRank
	ldr r2, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x3aa]
	ldr r1, [r2]
	mov r0, #3
	add r1, r1, #0x1000
	ldr r5, [r1, #0x3ac]
	ldrb r6, [r1, #0x3aa]
	mov r2, r5
	mov r1, r6
	bl sub_020128DC
	mov r1, r6
	mov r2, r5
	mov r5, r0
	mov r0, #2
	bl sub_020128DC
	sub r0, r5, r0
	cmp r0, r4
	ble _0201207C
	mov r0, #0
	mov r1, #0x6a
	mov r2, #1
	bl SaveScriptVariableValue
_0201207C:
	mov r0, #0
	mov r1, #0x6b
	bl LoadScriptVariableValue
	tst r0, #0xff
	bne _02012104
	mov r0, #0
	mov r1, #0x6d
	bl LoadScriptVariableValue
	mov r4, r0
	cmp r4, #5
	bge _02012104
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, _02012218 ; =_020988A4
	ldr r0, [r0]
	ldr r1, [r1, r4, lsl #3]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	cmp r0, r1
	blt _02012104
	bl GetScenarioBalance
	ldr r1, _0201221C ; =_020988A8
	mov r2, r4, lsl #3
	ldrsh r1, [r1, r2]
	and r1, r1, #0xff
	cmp r0, r1
	blo _02012104
	add r2, r4, #1
	mov r0, #0
	mov r1, #0x6d
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x6b
	mov r2, #1
	bl SaveScriptVariableValue
_02012104:
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0201213C
	bl sub_02012254
	cmp r0, #0
	moveq r2, #0
	beq _02012200
_0201213C:
	ldr r1, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #2
	ldr r1, [r1]
	add r2, r1, #0x1000
	ldrb r1, [r2, #0x3aa]
	ldr r2, [r2, #0x3ac]
	bl sub_02011B3C
	mov r4, r0
	str r4, [sp]
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02012184
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	strh r1, [r0, #0xb2]
	b _020121E0
_02012184:
	bl Rand16Bit
	ldr r1, [r4, #4]
	bl _s32_div_f
	mov r0, #0x18
	mul r0, r1, r0
	ldr r1, [r4]
	ldr r2, _02012220 ; =RECYCLE_SHOP_ITEM_LIST
	ldr r1, [r1, r0]
	mov r3, #0
	b _020121C4
_020121AC:
	cmp r2, r1
	beq _020121D0
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x24
_020121C4:
	cmp r3, #0x18
	blt _020121AC
	mvn r3, #0
_020121D0:
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	strh r3, [r0, #0xb2]
_020121E0:
	add r0, sp, #0
	bl sub_02011DB8
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #2
	ldr r0, [r0]
	mov r2, #1
	add r0, r0, #0x1300
	strh r1, [r0, #0xb0]
_02012200:
	cmp r2, #0
	bne _0201220C
	bl sub_02012224
_0201220C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02012214: .word BAG_ITEMS_PTR_MIRROR
_02012218: .word _020988A4
_0201221C: .word _020988A8
_02012220: .word RECYCLE_SHOP_ITEM_LIST
	arm_func_end sub_02011FA0

	arm_func_start sub_02012224
sub_02012224: ; 0x02012224
	stmdb sp!, {r3, lr}
	bl sub_02012254
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02012250 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r1, [r0, #0xb0]
	sub r1, r1, #1
	strh r1, [r0, #0xb0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012250: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02012224

	arm_func_start sub_02012254
sub_02012254: ; 0x02012254
	ldr r0, _02012278 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02012278: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02012254

	arm_func_start sub_0201227C
sub_0201227C: ; 0x0201227C
	ldr r0, _02012290 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb0]
	bx lr
	.align 2, 0
_02012290: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201227C

	arm_func_start sub_02012294
sub_02012294: ; 0x02012294
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	mov r8, #0
	mov r4, r0
	mov r7, r8
	mov r6, r8
	bl CountNbOfItemsInStorage
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0
	ble _02012324
	mov r0, r5, lsl #2
	mov r1, #6
	bl MemAlloc
	mov sb, r6
	mov r8, r0
	mov sl, sb
	b _0201231C
_020122E8:
	mov r0, sb
	bl sub_02010044
	mov r1, fp
	bl sub_02012630
	cmp r0, #0
	moveq r1, r6, lsl #2
	addeq r0, r8, r6, lsl #2
	streqh sb, [r8, r1]
	streqb sl, [r0, #2]
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	addeq r6, r6, #1
	mov sb, r0, asr #0x10
_0201231C:
	cmp sb, r5
	blt _020122E8
_02012324:
	mov r5, #0
	bl GetNbItemsInBag
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0
	ble _0201239C
	mov r0, sb, lsl #2
	mov r1, #6
	bl MemAlloc
	mov r7, r0
	mov sl, r5
	b _02012394
_02012354:
	mov r0, sl
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	mov r1, fp
	bl sub_02012630
	cmp r0, #0
	bne _02012388
	mov r0, r5, lsl #2
	add r1, r7, r5, lsl #2
	strh sl, [r7, r0]
	mov r0, #0
	strb r0, [r1, #2]
	add r5, r5, #1
_02012388:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_02012394:
	cmp sl, sb
	blt _02012354
_0201239C:
	cmp r5, #0
	beq _020123B4
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #29
	adds r0, r1, r0, ror #29
	bne _020123BC
_020123B4:
	mov sb, #0
	b _020123C0
_020123BC:
	rsb sb, r0, #8
_020123C0:
	add r0, r5, r6
	adds r0, sb, r0
	str r0, [r4, #4]
	moveq r0, #0
	streq r0, [r4]
	beq _020124B0
	mov r0, r0, lsl #3
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	mov sl, #0
	mov r3, #1
	b _02012418
_020123F4:
	str r3, [r0]
	mov r1, sl, lsl #2
	ldrsh r2, [r8, r1]
	add r1, r8, sl, lsl #2
	add sl, sl, #1
	strh r2, [r0, #4]
	ldrb r1, [r1, #2]
	strb r1, [r0, #7]
	add r0, r0, #8
_02012418:
	cmp sl, r6
	blt _020123F4
	mov r6, #0
	mov r3, #2
	mvn r2, #0
	mov r1, r6
	b _02012448
_02012434:
	str r3, [r0]
	strh r2, [r0, #4]
	strb r1, [r0, #7]
	add r6, r6, #1
	add r0, r0, #8
_02012448:
	cmp r6, sb
	blt _02012434
	mov r6, #0
	mov r3, r6
	b _02012480
_0201245C:
	str r3, [r0]
	mov r1, r6, lsl #2
	ldrsh r2, [r7, r1]
	add r1, r7, r6, lsl #2
	add r6, r6, #1
	strh r2, [r0, #4]
	ldrb r1, [r1, #2]
	strb r1, [r0, #7]
	add r0, r0, #8
_02012480:
	cmp r6, r5
	blt _0201245C
	mov r3, #0
	ldr r2, [r4]
	mov r1, r3
	b _020124A4
_02012498:
	strb r1, [r2, #6]
	add r3, r3, #1
	add r2, r2, #8
_020124A4:
	ldr r0, [r4, #4]
	cmp r3, r0
	blt _02012498
_020124B0:
	cmp r7, #0
	beq _020124C0
	mov r0, r7
	bl MemFree
_020124C0:
	cmp r8, #0
	beq _020124D0
	mov r0, r8
	bl MemFree
_020124D0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02012294

	arm_func_start sub_020124D8
sub_020124D8: ; 0x020124D8
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _020124F8
	ldrsh r0, [r0, #4]
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	ldmia sp!, {r3, pc}
_020124F8:
	cmp r1, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	add r1, sp, #0
	bl ConvertStorageItemAtIdxToBulkItem
	ldrsh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020124D8

	arm_func_start sub_02012518
sub_02012518: ; 0x02012518
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _02012538
	ldrsh r0, [r0, #4]
	bl GetItemAtIdx
	ldrh r0, [r0, #2]
	ldmia sp!, {r3, pc}
_02012538:
	cmp r1, #1
	ldrne r0, _02012558 ; =0x0000FFFF
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	add r1, sp, #0
	bl ConvertStorageItemAtIdxToBulkItem
	ldrh r0, [sp, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012558: .word 0x0000FFFF
	arm_func_end sub_02012518

	arm_func_start sub_0201255C
sub_0201255C: ; 0x0201255C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	ldr r1, [r5, #4]
	mov r4, r0
	mov r0, r1, lsl #3
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	mov ip, #0
	b _020125B4
_02012590:
	ldr r1, [r5]
	ldr r3, [r4]
	add r0, r1, ip, lsl #3
	ldr r2, [r1, ip, lsl #3]
	ldr r1, [r0, #4]
	add r0, r3, ip, lsl #3
	str r2, [r3, ip, lsl #3]
	str r1, [r0, #4]
	add ip, ip, #1
_020125B4:
	ldr r1, [r5, #4]
	cmp ip, r1
	blt _02012590
	mov r0, r4
	str r1, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201255C

	arm_func_start sub_020125CC
sub_020125CC: ; 0x020125CC
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
	arm_func_end sub_020125CC

	arm_func_start sub_020125FC
sub_020125FC: ; 0x020125FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _02012620
	mov r0, r4
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _02012628
_02012620:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02012628:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020125FC

	arm_func_start sub_02012630
sub_02012630: ; 0x02012630
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _02012650
	bl IsTicketItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
_02012650:
	mov r0, r4
	bl sub_020125FC
	ldmia sp!, {r4, pc}
	arm_func_end sub_02012630

	arm_func_start sub_0201265C
sub_0201265C: ; 0x0201265C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _020126C4 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r1, [r1]
	mov r5, r0
	ldr r8, [r1, #0x384]
	mov sb, r4
	mov r6, r4
	mov r7, #1
_02012680:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _020126AC
	ldrsh r0, [r8, #4]
	mov r1, r5
	bl sub_02012630
	cmp r0, #0
	addeq r4, r4, #1
_020126AC:
	add sb, sb, #1
	cmp sb, #0x32
	add r8, r8, #6
	blt _02012680
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020126C4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201265C

	arm_func_start sub_020126C8
sub_020126C8: ; 0x020126C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	ldr r4, _02012718 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, r0
	mov r6, r5
_020126DC:
	ldr r0, [r4]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _02012704
	mov r1, r7
	bl sub_02012630
	cmp r0, #0
	addeq r5, r5, #1
_02012704:
	add r6, r6, #1
	cmp r6, #0x3e8
	blt _020126DC
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02012718: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020126C8

	arm_func_start sub_0201271C
sub_0201271C: ; 0x0201271C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldrsh r0, [sl, #0x14]
	ldr r6, [sl]
	mov r8, #0
	str r0, [sp]
	b _02012854
_0201273C:
	add r5, r6, #0x14
	mov r4, r8, lsl #2
	ldrsh r1, [r5, r4]
	add r0, sp, #4
	bl InitBulkItem
	add r1, r6, r8, lsl #2
	add r0, sl, r8, lsl #1
	ldrsh r7, [r1, #0x16]
	ldrsh fp, [r0, #0xc]
	mov sb, #0
	b _02012780
_02012768:
	add r0, sp, #4
	bl GetEquivBulkItemIdxInStorage
	bl RemoveItemAtIdxInStorage
	cmp r0, #0
	subne r7, r7, #1
	add sb, sb, #1
_02012780:
	cmp sb, fp
	bge _02012790
	cmp r7, #0
	bgt _02012768
_02012790:
	cmp r7, #0
	ble _020127CC
	add r0, sl, r8, lsl #1
	ldrsh fp, [r0, #4]
	mov sb, #0
	b _020127BC
_020127A8:
	ldrsh r0, [sp, #4]
	bl GetFirstUnequippedItemOfType
	bl RemoveItem
	sub r7, r7, #1
	add sb, sb, #1
_020127BC:
	cmp sb, fp
	bge _020127CC
	cmp r7, #0
	bgt _020127A8
_020127CC:
	ldrsh r0, [r5, r4]
	ldr r1, _02012870 ; =0x00000578
	cmp r0, r1
	bne _02012834
	ldrsh r0, [r6]
	bl IsTicketItem
	cmp r0, #0
	beq _02012810
	mov r0, #1
	bl sub_0201265C
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	mov r0, #1
	bl sub_020126C8
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
	b _02012850
_02012810:
	mov r0, #0
	bl sub_0201265C
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	mov r0, #0
	bl sub_020126C8
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
	b _02012850
_02012834:
	bl CountNbItemsOfTypeInBag
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	ldrsh r0, [r5, r4]
	bl CountNbItemsOfTypeInStorage
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
_02012850:
	add r8, r8, #1
_02012854:
	ldr r0, [sp]
	cmp r8, r0
	blt _0201273C
	bl RemoveEmptyItemsInBag
	bl sub_0201007C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02012870: .word 0x00000578
	arm_func_end sub_0201271C

	arm_func_start sub_02012874
sub_02012874: ; 0x02012874
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, #0
	b _020128C4
_02012884:
	ldr r0, [r5]
	add r1, r0, r4, lsl #3
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _020128C0
	ldr r0, [r1]
	cmp r0, #0
	bne _020128B0
	ldrsh r0, [r1, #4]
	bl RemoveItem
	b _020128C0
_020128B0:
	cmp r0, #1
	bne _020128C0
	ldrsh r0, [r1, #4]
	bl RemoveItemAtIdxInStorage
_020128C0:
	add r4, r4, #1
_020128C4:
	ldr r0, [r5, #4]
	cmp r4, r0
	blt _02012884
	bl RemoveEmptyItemsInBag
	bl sub_0201007C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02012874

	arm_func_start sub_020128DC
sub_020128DC: ; 0x020128DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov fp, #0x24
	ldr r5, _02012950 ; =RECYCLE_SHOP_ITEM_LIST
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r6, r7
	mov r4, fp
_02012900:
	cmp sl, #3
	beq _02012920
	mla r0, r6, r4, r5
	ldr r1, [r0, #4]
	mov r0, sl
	bl sub_02012954
	cmp r0, #0
	beq _0201293C
_02012920:
	mla r1, r6, fp, r5
	ldrb r0, [r1, #8]
	cmp r0, sb
	bhi _0201293C
	ldr r0, [r1, #0xc]
	cmp r0, r8
	addle r7, r7, #1
_0201293C:
	add r6, r6, #1
	cmp r6, #0x18
	blt _02012900
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02012950: .word RECYCLE_SHOP_ITEM_LIST
	arm_func_end sub_020128DC

	arm_func_start sub_02012954
sub_02012954: ; 0x02012954
	cmp r0, r1
	beq _0201296C
	cmp r0, #0
	bne _02012974
	cmp r1, #2
	beq _02012974
_0201296C:
	mov r0, #1
	bx lr
_02012974:
	mov r0, #0
	bx lr
	arm_func_end sub_02012954

	arm_func_start sub_0201297C
sub_0201297C: ; 0x0201297C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	smulbb r4, r1, r4
	ldr r1, _02012AA4 ; =_020988D0
	mov sl, r0
	ldr r1, [r1, r4]
	mov r0, r2
	mov r5, r3
	bl sub_02012954
	cmp r0, #0
	beq _02012A9C
	ldr r0, _02012AA8 ; =_020988D4
	ldrb r0, [r0, r4]
	cmp r0, r5
	bhi _02012A9C
	ldr r1, _02012AAC ; =_020988D8
	ldr r0, [sp, #0x28]
	ldr r1, [r1, r4]
	cmp r1, r0
	bgt _02012A9C
	ldr r0, _02012AB0 ; =RECYCLE_SHOP_ITEM_LIST
	mov sb, #0
	add r0, r0, r4
	mov r6, #1
	str r0, [sl]
	mov fp, sb
	mov r5, r6
	ldr r4, _02012AB4 ; =0x00000578
	b _02012A88
_020129F0:
	ldr r1, [sl]
	mov r7, sb, lsl #2
	add r8, r1, #0x14
	ldrsh r0, [r8, r7]
	cmp r0, #0
	beq _02012A90
	cmp r0, r4
	bne _02012A68
	ldrsh r0, [r1]
	bl IsTicketItem
	cmp r0, #0
	beq _02012A44
	mov r0, r6
	bl sub_0201265C
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	mov r0, r5
	bl sub_020126C8
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
	b _02012A84
_02012A44:
	mov r0, fp
	bl sub_0201265C
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	mov r0, #0
	bl sub_020126C8
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
	b _02012A84
_02012A68:
	bl CountNbItemsOfTypeInBag
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	ldrsh r0, [r8, r7]
	bl CountNbItemsOfTypeInStorage
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
_02012A84:
	add sb, sb, #1
_02012A88:
	cmp sb, #4
	blt _020129F0
_02012A90:
	strh sb, [sl, #0x14]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02012A9C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02012AA4: .word _020988D0
_02012AA8: .word _020988D4
_02012AAC: .word _020988D8
_02012AB0: .word RECYCLE_SHOP_ITEM_LIST
_02012AB4: .word 0x00000578
	arm_func_end sub_0201297C

	arm_func_start sub_02012AB8
sub_02012AB8: ; 0x02012AB8
	mov r3, #0
	ldr r0, _02012ADC ; =_022A4BD8
	mov r2, r3
_02012AC4:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #8
	blt _02012AC4
	bx lr
	.align 2, 0
_02012ADC: .word _022A4BD8
	arm_func_end sub_02012AB8

	arm_func_start LoadSynthBin
LoadSynthBin: ; 0x02012AE0
	stmdb sp!, {r3, lr}
	ldr r0, _02012B28 ; =_020AF6D0
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02012B2C ; =_020AF6D4
	ldr r1, _02012B30 ; =_02098CB4
	mov r2, #0xe
	bl LoadFileFromRom
	ldr r1, _02012B28 ; =_020AF6D0
	mov r0, #1
	ldr r2, [r1, #4]
	str r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012B28: .word _020AF6D0
_02012B2C: .word _020AF6D4
_02012B30: .word _02098CB4
	arm_func_end LoadSynthBin

	arm_func_start CloseSynthBin
CloseSynthBin: ; 0x02012B34
	stmdb sp!, {r3, lr}
	ldr r0, _02012B74 ; =_020AF6D0
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, pc}
	ldr r0, _02012B78 ; =_020AF6D4
	bl UnloadFile
	ldr r0, _02012B74 ; =_020AF6D0
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012B74: .word _020AF6D0
_02012B78: .word _020AF6D4
	arm_func_end CloseSynthBin

	arm_func_start GenerateCroagunkItems
GenerateCroagunkItems: ; 0x02012B7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x160
	bl GetScenarioBalance
	ldr r1, _02013098 ; =_020AF6D0
	str r0, [sp, #8]
	ldr r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r7, #0
	bne _02012BB4
	mov r7, #1
	bl LoadSynthBin
_02012BB4:
	ldr r0, _0201309C ; =0x000045E0
	mov r1, #0xf
	bl MemAlloc
	mov r1, #0
	mov r4, r0
	mov r5, r1
	add r0, sp, #0x2c
_02012BD0:
	strb r5, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x12
	blt _02012BD0
	ldr r0, _020130A0 ; =_02098CCC
	mov r6, r5
	bl Debug_Print0
	add r0, sp, #0x24
	bl GetPartyMembers
	str r0, [sp, #0xc]
	mov r0, #0
	mov r1, #3
	bl RandRange
	mov r8, #0
	mov fp, r0
	mov sl, r8
	b _02012C78
_02012C14:
	mov r1, sl, lsl #1
	add r0, sp, #0x24
	ldrsh r0, [r0, r1]
	bl GetTeamMember
	ldrsh r0, [r0, #4]
	mov sb, #0
	bl FemaleToMaleForm
	bl GetBaseFormCastformDeoxysCherrim
	mov r3, sb
	b _02012C58
_02012C3C:
	mov r2, r3, lsl #1
	add r1, sp, #0x1c
	ldrsh r1, [r1, r2]
	cmp r0, r1
	moveq sb, #1
	beq _02012C60
	add r3, r3, #1
_02012C58:
	cmp r3, r8
	blt _02012C3C
_02012C60:
	cmp sb, #0
	moveq r2, r8, lsl #1
	addeq r1, sp, #0x1c
	streqh r0, [r1, r2]
	addeq r8, r8, #1
	add sl, sl, #1
_02012C78:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _02012C14
	ldr r0, _020130A4 ; =_02098D24
	mov r2, #0
	mov r1, fp
	mov r3, r8
	mov sb, r8
	str r2, [sp]
	bl Debug_Print0
	add r0, r4, #0x12c
	add r0, r0, #0x800
	str r0, [sp, #0x14]
	mvn r0, #0
	str r0, [sp, #0x18]
	b _02012D28
_02012CB8:
	mov r0, r8
	bl RandInt
	str r0, [sp, #4]
	mov r1, r0, lsl #1
	add r0, sp, #0x1c
	ldrsh sl, [r0, r1]
	cmp sl, #0
	blt _02012D28
	ldr r1, [sp, #0x14]
	mov r2, #0x1c
	mla r1, r6, r2, r1
	mov r0, sl
	add r2, sp, #0x2c
	bl GetValidSynthsForSpecies
	cmp r0, #0
	addne r0, r4, r5, lsl #1
	addne r0, r0, #0x900
	strneh sl, [r0, #6]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	mov r2, r0, lsl #1
	add r0, sp, #0x1c
	sub sb, sb, #1
	addne r6, r6, #1
	addne r5, r5, #1
	strh r1, [r0, r2]
	cmp sb, #0
	ble _02012D38
_02012D28:
	cmp r5, fp
	bge _02012D38
	cmp r8, r5
	bgt _02012CB8
_02012D38:
	ldr fp, _020130A8 ; =0x00000229
	str r5, [sp, #0x10]
	mov sl, #0
	mov sb, #1
_02012D48:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl FemaleToMaleForm
	bl GetBaseFormCastformDeoxysCherrim
	mov r8, r0
	bl IsMonsterValid
	cmp r0, #0
	beq _02012D80
	mov r0, r8
	bl HasMonsterBeenAttackedInDungeons
	cmp r0, #0
	movne r0, sl, lsl #1
	strneh r8, [r4, r0]
	addne sl, sl, #1
_02012D80:
	add sb, sb, #1
	cmp sb, fp
	ble _02012D48
	b _02012E34
_02012D90:
	mov r0, sl
	mov fp, #0
	bl RandInt
	mov r8, r0
	mov r0, r8, lsl #1
	ldrsh sb, [r4, r0]
	mov r1, fp
	b _02012DCC
_02012DB0:
	add r0, r4, r1, lsl #1
	add r0, r0, #0x900
	ldrsh r0, [r0, #6]
	cmp sb, r0
	moveq fp, #1
	beq _02012DD4
	add r1, r1, #1
_02012DCC:
	cmp r1, r5
	blt _02012DB0
_02012DD4:
	cmp fp, #0
	bne _02012E10
	add r0, r4, #0x12c
	add r1, r0, #0x800
	mov r0, #0x1c
	mla r1, r6, r0, r1
	add r2, sp, #0x2c
	mov r0, sb
	bl GetValidSynthsForSpecies
	cmp r0, #0
	addne r0, r4, r5, lsl #1
	addne r0, r0, #0x900
	strneh sb, [r0, #6]
	addne r6, r6, #1
	addne r5, r5, #1
_02012E10:
	sub sl, sl, #1
	b _02012E2C
_02012E18:
	add r0, r4, r8, lsl #1
	ldrsh r0, [r0, #2]
	mov r1, r8, lsl #1
	add r8, r8, #1
	strh r0, [r4, r1]
_02012E2C:
	cmp r8, sl
	blt _02012E18
_02012E34:
	cmp r5, #0x10
	ldrlt r0, [sp, #0x10]
	sublt r0, r5, r0
	cmplt r0, sl
	blt _02012D90
	mov r8, #0
	mov sb, r8
_02012E50:
	add r0, sp, #0x2c
	ldrb r0, [r0, sb]
	cmp r0, #0
	beq _02012EB0
	ldr r0, _020130AC ; =TYPE_SPECIFIC_EXCLUSIVE_ITEMS
	and r5, sb, #0xff
	mov sl, #0
	add fp, r0, r5, lsl #3
_02012E70:
	cmp r5, #0x12
	movhs r0, #0
	addlo r0, fp, sl, lsl #1
	ldrlosh r0, [r0, #-8]
	bl GetSynthItem
	cmp r0, #0
	beq _02012EA4
	ldrh r2, [r0, #6]
	ldr r1, [sp, #8]
	cmp r2, r1
	addle r1, sp, #0x40
	strle r0, [r1, r8, lsl #2]
	addle r8, r8, #1
_02012EA4:
	add sl, sl, #1
	cmp sl, #4
	blt _02012E70
_02012EB0:
	add sb, sb, #1
	cmp sb, #0x12
	blt _02012E50
	cmp r8, #0
	ble _02012F00
	mov r0, #0x1c
	mul r5, r6, r0
	add r0, r4, #0x12c
	add sb, r0, #0x800
	mov r0, r8
	add r8, sb, r5
	bl RandInt
	add r2, sp, #0x40
	ldr r0, [r2, r0, lsl #2]
	mov r1, #1
	str r0, [r8, #8]
	str r1, [sb, r5]
	ldrh r0, [r0, #2]
	add r6, r6, #1
	str r0, [r8, #4]
_02012F00:
	cmp r6, #0
	bne _02012F40
	mov r0, r4
	bl MemFree
	cmp r7, #0
	beq _02012F1C
	bl CloseSynthBin
_02012F1C:
	mov r3, #0
	ldr r1, _020130B0 ; =_022A4BD8
	mov r0, r3
_02012F28:
	mov r2, r3, lsl #1
	add r3, r3, #1
	strh r0, [r1, r2]
	cmp r3, #8
	blt _02012F28
	b _02013090
_02012F40:
	mov r0, #4
	mov r1, #9
	bl RandRange
	mov fp, r0
	mov sb, #0
	b _02013050
_02012F58:
	mov r0, #0
	mov r3, r0
	mov r1, #0x1c
	b _02012F78
_02012F68:
	mla r2, r3, r1, r4
	ldr r2, [r2, #0x930]
	add r3, r3, #1
	add r0, r0, r2
_02012F78:
	cmp r3, r6
	blt _02012F68
	cmp r0, #0
	beq _02013058
	bl RandInt
	mov r1, #0
	add r2, r4, #0x12c
	add r8, r2, #0x800
	mov sl, r1
	mov r2, #0x1c
	b _02013048
_02012FA4:
	mla r5, sl, r2, r8
	ldr r3, [r5, #4]
	cmp r0, r3
	bhs _02013044
	ldr r8, [r5]
	mov sl, #0
	b _02013030
_02012FC0:
	add r2, r5, sl, lsl #2
	ldr r3, [r2, #8]
	ldrh r2, [r3, #2]
	add r1, r1, r2
	cmp r0, r1
	bge _0201302C
	ldrsh r8, [r3]
	mov sl, #0
	ldr r1, _020130B0 ; =_022A4BD8
	b _0201300C
_02012FE8:
	mov r0, sl, lsl #1
	ldrsh r0, [r1, r0]
	cmp r8, r0
	bne _02013008
	ldr r0, _020130B4 ; =_02098D48
	mov r1, r8
	bl Debug_Print0
	b _02013014
_02013008:
	add sl, sl, #1
_0201300C:
	cmp sl, sb
	blt _02012FE8
_02013014:
	cmp sl, sb
	movge r1, sb, lsl #1
	ldrge r0, _020130B0 ; =_022A4BD8
	addge sb, sb, #1
	strgeh r8, [r0, r1]
	b _02013038
_0201302C:
	add sl, sl, #1
_02013030:
	cmp sl, r8
	blt _02012FC0
_02013038:
	mov r0, #0
	str r0, [r5, #4]
	b _02013050
_02013044:
	add sl, sl, #1
_02013048:
	cmp sl, r6
	blt _02012FA4
_02013050:
	cmp sb, fp
	blt _02012F58
_02013058:
	mov r2, #0
	ldr r0, _020130B0 ; =_022A4BD8
	b _02013070
_02013064:
	mov r1, sb, lsl #1
	strh r2, [r0, r1]
	add sb, sb, #1
_02013070:
	cmp sb, #8
	blt _02013064
	mov r0, r4
	bl MemFree
	cmp r7, #0
	beq _0201308C
	bl CloseSynthBin
_0201308C:
	mov r0, #1
_02013090:
	add sp, sp, #0x160
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02013098: .word _020AF6D0
_0201309C: .word 0x000045E0
_020130A0: .word _02098CCC
_020130A4: .word _02098D24
_020130A8: .word 0x00000229
_020130AC: .word TYPE_SPECIFIC_EXCLUSIVE_ITEMS
_020130B0: .word _022A4BD8
_020130B4: .word _02098D48
	arm_func_end GenerateCroagunkItems

	arm_func_start sub_020130B8
sub_020130B8: ; 0x020130B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02013148 ; =_020AF6D0
	mov r7, r0
	ldr r0, [r1, #4]
	ldr r4, _0201314C ; =_022A4BD8
	cmp r0, #0
	mov r5, #0
	movne r0, #1
	moveq r0, r5
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
_020130EC:
	mov r1, r6, lsl #1
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _02013130
	ldrsh r0, [r4, r1]
	bl GetSynthItem
	cmp r0, #0
	beq _02013130
	cmp r7, #0
	beq _0201312C
	add r3, r7, r5, lsl #3
	mov r2, #4
_0201311C:
	ldrh r1, [r0], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0201311C
_0201312C:
	add r5, r5, #1
_02013130:
	add r6, r6, #1
	cmp r6, #8
	blt _020130EC
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02013148: .word _020AF6D0
_0201314C: .word _022A4BD8
	arm_func_end sub_020130B8

	arm_func_start sub_02013150
sub_02013150: ; 0x02013150
	ldr r3, _0201318C ; =_022A4BD8
	mov ip, #0
	b _0201317C
_0201315C:
	mov r2, ip, lsl #1
	ldrsh r1, [r3, r2]
	cmp r0, r1
	moveq r0, #0
	streqh r0, [r3, r2]
	moveq r0, #1
	bxeq lr
	add ip, ip, #1
_0201317C:
	cmp ip, #8
	blt _0201315C
	mov r0, #0
	bx lr
	.align 2, 0
_0201318C: .word _022A4BD8
	arm_func_end sub_02013150

	arm_func_start sub_02013190
sub_02013190: ; 0x02013190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	ldr r5, _020131EC ; =_022A4BD8
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb
_020131BC:
	mov r0, r6
	mov r2, r4
	add r1, r5, r7, lsl #1
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #8
	blt _020131BC
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020131EC: .word _022A4BD8
	arm_func_end sub_02013190

	arm_func_start sub_020131F0
sub_020131F0: ; 0x020131F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r5, _0201324C ; =_022A4BD8
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb
_0201321C:
	mov r0, r6
	mov r2, r4
	add r1, r5, r7, lsl #1
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #8
	blt _0201321C
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201324C: .word _022A4BD8
	arm_func_end sub_020131F0

	arm_func_start GetSynthItem
GetSynthItem: ; 0x02013250
	ldr r1, _020132A0 ; =_020AF6D0
	ldr r1, [r1, #4]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	bxeq lr
	ldr r1, _020132A0 ; =_020AF6D0
	ldr r1, [r1]
	b _0201328C
_0201327C:
	cmp r2, r0
	moveq r0, r1
	bxeq lr
	add r1, r1, #8
_0201328C:
	ldrsh r2, [r1]
	cmp r2, #0
	bne _0201327C
	mov r0, #0
	bx lr
	.align 2, 0
_020132A0: .word _020AF6D0
	arm_func_end GetSynthItem

	arm_func_start GetValidSynthsForSpecies
GetValidSynthsForSpecies: ; 0x020132A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl GetScenarioBalance
	mov r5, #0
	str r5, [sb]
	mov r7, r0
	mov r6, r5
	str r5, [sb, #4]
	mov r4, #1
_020132D0:
	mov r1, r6, lsl #0x10
	mov r0, sl
	mov r1, r1, asr #0x10
	bl GetExclusiveItem
	cmp r0, #0
	beq _0201332C
	bl GetSynthItem
	cmp r0, #0
	beq _0201332C
	ldrh r1, [r0, #6]
	cmp r1, r7
	bgt _0201332C
	ldr r1, [sb]
	mov r5, r4
	add r1, sb, r1, lsl #2
	str r0, [r1, #8]
	ldrh r0, [r0, #2]
	ldr r1, [sb, #4]
	add r0, r1, r0
	str r0, [sb, #4]
	ldr r0, [sb]
	add r0, r0, #1
	str r0, [sb]
_0201332C:
	add r6, r6, #1
	cmp r6, #4
	blt _020132D0
	mov r0, sl
	bl ReturnEggExclusiveItem
	cmp r0, #0
	beq _0201338C
	bl GetSynthItem
	cmp r0, #0
	beq _0201338C
	ldrh r1, [r0, #6]
	cmp r1, r7
	bgt _0201338C
	ldr r1, [sb]
	mov r5, #1
	add r1, sb, r1, lsl #2
	str r0, [r1, #8]
	ldrh r0, [r0, #2]
	ldr r1, [sb, #4]
	add r0, r1, r0
	str r0, [sb, #4]
	ldr r0, [sb]
	add r0, r0, #1
	str r0, [sb]
_0201338C:
	mov r0, sl
	mov r1, #0
	bl GetType
	cmp r0, #0
	movne r1, #1
	strneb r1, [r8, r0]
	mov r0, sl
	mov r1, #1
	bl GetType
	cmp r0, #0
	movne r1, #1
	strneb r1, [r8, r0]
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end GetValidSynthsForSpecies

	arm_func_start LoadWazaP
LoadWazaP: ; 0x020133C4
	stmdb sp!, {r3, lr}
	ldr r1, _020133E8 ; =DUNGEON_MOVE_TABLES
	mov r0, #0
	str r0, [r1, #4]
	bl OpenWaza
	ldr r0, _020133E8 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #4]
	bl SelectWaza
	ldmia sp!, {r3, pc}
	.align 2, 0
_020133E8: .word DUNGEON_MOVE_TABLES
	arm_func_end LoadWazaP

	arm_func_start LoadWazaP2
LoadWazaP2: ; 0x020133EC
	stmdb sp!, {r3, lr}
	ldr r1, _02013410 ; =DUNGEON_MOVE_TABLES
	mov r0, #1
	str r0, [r1, #4]
	bl OpenWaza
	ldr r0, _02013410 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #4]
	bl SelectWaza
	ldmia sp!, {r3, pc}
	.align 2, 0
_02013410: .word DUNGEON_MOVE_TABLES
	arm_func_end LoadWazaP2

	arm_func_start UnloadCurrentWazaP
UnloadCurrentWazaP: ; 0x02013414
	stmdb sp!, {r4, lr}
	ldr r0, _0201344C ; =DUNGEON_MOVE_TABLES
	ldr r1, _02013450 ; =_020AF700
	ldr r0, [r0, #4]
	add r4, r1, r0, lsl #3
	mov r0, r4
	bl UnloadFile
	mov r0, r4
	bl ZInit8
	ldr r1, _0201344C ; =DUNGEON_MOVE_TABLES
	mov r0, #0
	str r0, [r1, #4]
	bl SelectWaza
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201344C: .word DUNGEON_MOVE_TABLES
_02013450: .word _020AF700
	arm_func_end UnloadCurrentWazaP

	arm_func_start GetMoveName
GetMoveName: ; 0x02013454
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	ldr ip, _02013474 ; =StringFromId
	mov r0, r0, lsr #0x10
	bx ip
	.align 2, 0
_02013474: .word StringFromId
	arm_func_end GetMoveName

	arm_func_start FormatMoveString
FormatMoveString: ; 0x02013478
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r6, r1
	ldrb r1, [r6]
	mov r7, r0
	mov r5, r2
	tst r1, #0x20
	bne _020134A4
	ldrh r0, [r6, #2]
	tst r0, #1
	beq _020134AC
_020134A4:
	mov r0, #0x57
	b _020134B0
_020134AC:
	mov r0, #0x4d
_020134B0:
	ldrb r3, [r6, #7]
	cmp r5, #0
	ldreq r5, _02013738 ; =_02098D68
	and r4, r0, #0xff
	cmp r3, #0
	moveq r0, #0
	streqb r0, [sp, #0x10]
	beq _020134E0
	ldr r1, _0201373C ; =_02098DE4
	add r0, sp, #0x10
	mov r2, #0x56
	bl SprintfStatic__02013758
_020134E0:
	ldrb r0, [r5, #8]
	cmp r0, #0
	movne r4, #0x57
	bne _0201350C
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _0201350C
	ldrh r0, [r6, #4]
	bl Is2TurnsMove
	cmp r0, #0
	movne r4, #0x57
_0201350C:
	ldr r0, [r5]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02013730
_0201351C: ; jump table
	b _02013534 ; case 0
	b _02013564 ; case 1
	b _020135C8 ; case 2
	b _0201362C ; case 3
	b _02013690 ; case 4
	b _020136F4 ; case 5
_02013534:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _02013740 ; =_02098DF4
	add r3, sp, #0x10
	mov r0, r7
	bl SprintfStatic__02013758
	b _02013730
_02013564:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #8
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _0201374C ; =_02098E14
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_020135C8:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #8
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _0201374C ; =_02098E14
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_0201362C:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #4
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _02013750 ; =_02098E58
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_02013690:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #4
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _0201374C ; =_02098E14
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_020136F4:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r4, r0
	mov r0, r6
	bl GetMaxPp
	str r0, [sp]
	ldrb r3, [r6, #6]
	ldr r1, _02013754 ; =_02098E9C
	mov r0, r7
	mov r2, r4
	bl SprintfStatic__02013758
_02013730:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02013738: .word _02098D68
_0201373C: .word _02098DE4
_02013740: .word _02098DF4
_02013744: .word _02098E04
_02013748: .word _02098E0C
_0201374C: .word _02098E14
_02013750: .word _02098E58
_02013754: .word _02098E9C
	arm_func_end FormatMoveString

	arm_func_start SprintfStatic__02013758
SprintfStatic__02013758: ; 0x02013758
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02013758

	arm_func_start FormatMoveStringMore
FormatMoveStringMore: ; 0x02013780
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	mov r0, r6
	bl GetDungeonResultString
	mov r1, r5
	mov r2, r4
	orr ip, r6, #0x10000
	add r3, r7, r6, lsl #2
	str ip, [r3, #0x10]
	bl FormatMoveString
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end FormatMoveStringMore
