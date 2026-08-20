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
