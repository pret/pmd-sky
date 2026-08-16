	.include "asm/macros.inc"
	.include "main_0200EDFC.inc"

	.text

	arm_func_start GetNbItemsInBag
GetNbItemsInBag: ; 0x0200EDFC
	stmdb sp!, {r3, lr}
	ldr r1, _0200EE48 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	mov lr, r0
	ldr ip, [r1, #0x384]
	mov r1, r0
	mov r2, #1
_0200EE1C:
	ldrb r3, [ip]
	add lr, lr, #1
	add ip, ip, #6
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	addne r0, r0, #1
	cmp lr, #0x32
	blt _0200EE1C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EE48: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetNbItemsInBag

	arm_func_start CountNbItemsOfTypeInBag
CountNbItemsOfTypeInBag: ; 0x0200EE4C
	ldr r1, _0200EE84 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	mov ip, r3
	ldr r2, [r1, #0x384]
_0200EE60:
	ldrsh r1, [r2, #4]
	add ip, ip, #1
	add r2, r2, #6
	cmp r1, r0
	addeq r3, r3, #1
	cmp ip, #0x32
	blt _0200EE60
	mov r0, r3
	bx lr
	.align 2, 0
_0200EE84: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbItemsOfTypeInBag

	arm_func_start CountItemTypeInBag
CountItemTypeInBag: ; 0x0200EE88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0200EEDC ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r1, [r1]
	mov r7, r0
	ldr r4, [r1, #0x384]
	mov r6, r5
_0200EEA4:
	ldrsh r0, [r4, #4]
	cmp r0, r7
	bne _0200EEC4
	bl IsThrownItem
	cmp r0, #0
	ldrneh r0, [r4, #2]
	addne r5, r5, r0
	addeq r5, r5, #1
_0200EEC4:
	add r6, r6, #1
	cmp r6, #0x32
	add r4, r4, #6
	blt _0200EEA4
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200EEDC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountItemTypeInBag

	arm_func_start IsItemInBag
IsItemInBag: ; 0x0200EEE0
	ldr r1, _0200EF1C ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	ldr r2, [r1, #0x384]
	b _0200EF0C
_0200EEF4:
	ldrsh r1, [r2, #4]
	cmp r1, r0
	moveq r0, #1
	bxeq lr
	add r3, r3, #1
	add r2, r2, #6
_0200EF0C:
	cmp r3, #0x32
	blt _0200EEF4
	mov r0, #0
	bx lr
	.align 2, 0
_0200EF1C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemInBag

	arm_func_start IsItemWithFlagsInBag
IsItemWithFlagsInBag: ; 0x0200EF20
	ldr r2, _0200EF68 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r2, [r2]
	ldr r3, [r2, #0x384]
	b _0200EF58
_0200EF34:
	ldrsh r2, [r3, #4]
	cmp r2, r0
	bne _0200EF50
	ldrb r2, [r3]
	tst r2, r1
	movne r0, #1
	bxne lr
_0200EF50:
	add ip, ip, #1
	add r3, r3, #6
_0200EF58:
	cmp ip, #0x32
	blt _0200EF34
	mov r0, #0
	bx lr
	.align 2, 0
_0200EF68: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemWithFlagsInBag

#ifndef JAPAN
	arm_func_start IsItemInTreasureBoxes
IsItemInTreasureBoxes: ; 0x0200EF6C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200EFC8 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r0
	ldr r0, [r1]
	mov r6, #0
	ldr r5, [r0, #0x384]
	b _0200EFB8
_0200EF88:
	ldrsh r0, [r5, #4]
	bl GetItemCategoryVeneer
	add r0, r0, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0200EFB0
	ldrh r0, [r5, #2]
	cmp r0, r4
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
_0200EFB0:
	add r6, r6, #1
	add r5, r5, #6
_0200EFB8:
	cmp r6, #0x32
	blt _0200EF88
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200EFC8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemInTreasureBoxes
#endif

	arm_func_start IsHeldItemInBag
IsHeldItemInBag: ; 0x0200EFCC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F04C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	mov sb, #1
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov r7, sb
	b _0200F03C
_0200EFF4:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200F034
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0200F034
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F034:
	add r5, r5, #1
	add r4, r4, #6
_0200F03C:
	cmp r5, #0x32
	blt _0200EFF4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F04C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsHeldItemInBag

	arm_func_start IsItemForSpecialSpawnInBag
IsItemForSpecialSpawnInBag: ; 0x0200F050
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0200F0E0 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r0, [r0]
	mov ip, #1
	ldr lr, [r0, #0x384]
	mov r3, r4
	mov r1, r4
	mov r2, ip
	b _0200F0D0
_0200F078:
	ldrb r5, [lr]
	tst r5, #1
	movne r0, ip
	moveq r0, r3
	tst r0, #0xff
	beq _0200F0C8
	ldrsh r0, [lr, #4]
	sub r0, r0, #0xad
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0200F0C8
	tst r5, #8
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_0200F0C8:
	add r4, r4, #1
	add lr, lr, #6
_0200F0D0:
	cmp r4, #0x32
	blt _0200F078
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0200F0E0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemForSpecialSpawnInBag

	arm_func_start HasStorableItems
HasStorableItems: ; 0x0200F0E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200F148 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	ldr r0, [r0]
	mov r4, r7
	ldr r6, [r0, #0x384]
	mov r5, #1
	b _0200F138
_0200F104:
	ldrb r0, [r6]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0200F130
	ldrsh r0, [r6, #4]
	bl IsStorableItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0200F130:
	add r7, r7, #1
	add r6, r6, #6
_0200F138:
	cmp r7, #0x32
	blt _0200F104
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200F148: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end HasStorableItems

	arm_func_start GetItemIndex
GetItemIndex: ; 0x0200F14C
	ldr r1, _0200F188 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x384]
	b _0200F178
_0200F160:
	cmp r1, r0
	moveq r0, r2, lsl #0x10
	moveq r0, r0, asr #0x10
	bxeq lr
	add r2, r2, #1
	add r1, r1, #6
_0200F178:
	cmp r2, #0x32
	blt _0200F160
	mvn r0, #0
	bx lr
	.align 2, 0
_0200F188: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetItemIndex

	arm_func_start GetEquivItemIndex
GetEquivItemIndex: ; 0x0200F18C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F204 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F1F4
_0200F1B4:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F1EC
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	movne r0, r4, lsl #0x10
	movne r0, r0, asr #0x10
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F1EC:
	add r4, r4, #1
	add sb, sb, #6
_0200F1F4:
	cmp r4, #0x32
	blt _0200F1B4
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F204: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetEquivItemIndex

	arm_func_start GetEquippedThrowableItem
GetEquippedThrowableItem: ; 0x0200F208
	ldr r0, _0200F268 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r0, [r0]
	mov r1, ip
	ldr r3, [r0, #0x384]
	mov r2, #1
	b _0200F258
_0200F224:
	ldrb r0, [r3]
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _0200F250
	ldrb r0, [r3]
	tst r0, #0x10
	movne r0, ip, lsl #0x10
	movne r0, r0, asr #0x10
	bxne lr
_0200F250:
	add ip, ip, #1
	add r3, r3, #6
_0200F258:
	cmp ip, #0x32
	blt _0200F224
	mvn r0, #0
	bx lr
	.align 2, 0
_0200F268: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetEquippedThrowableItem

	arm_func_start GetFirstUnequippedItemOfType
GetFirstUnequippedItemOfType: ; 0x0200F26C
	stmdb sp!, {r3, lr}
	ldr r1, _0200F2DC ; =BAG_ITEMS_PTR_MIRROR
	mvn ip, #0
	ldr r1, [r1]
	cmp r0, #0
	ldr r3, [r1, #0x384]
	moveq r0, ip
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	mov r2, ip
	b _0200F2CC
_0200F298:
	ldrsh r1, [r3, #4]
	cmp r1, r0
	bne _0200F2C4
	ldrb r1, [r3, #1]
	cmp r1, #0
	moveq r0, lr, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r3, pc}
	cmp ip, r2
	moveq r1, lr, lsl #0x10
	moveq ip, r1, asr #0x10
_0200F2C4:
	add lr, lr, #1
	add r3, r3, #6
_0200F2CC:
	cmp lr, #0x32
	blt _0200F298
	mov r0, ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200F2DC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetFirstUnequippedItemOfType

	arm_func_start CopyItemAtIdx
CopyItemAtIdx: ; 0x0200F2E0
	stmdb sp!, {r3, lr}
	ldr r3, _0200F344 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #6
	ldr r3, [r3]
	smulbb r2, r0, r2
	ldr r3, [r3, #0x384]
	ldrb r0, [r3, r2]
	add r3, r3, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F334
	ldrh r2, [r3]
	mov r0, #1
	strh r2, [r1]
	ldrh r2, [r3, #2]
	strh r2, [r1, #2]
	ldrh r2, [r3, #4]
	strh r2, [r1, #4]
	ldmia sp!, {r3, pc}
_0200F334:
	mov r0, r1
	bl ItemZInit
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200F344: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CopyItemAtIdx

	arm_func_start GetItemAtIdx
GetItemAtIdx: ; 0x0200F348
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r2, _0200F36C ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	ldr r2, [r2, #0x384]
	smlabb r0, r0, r1, r2
	bx lr
	.align 2, 0
_0200F36C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetItemAtIdx

	arm_func_start RemoveEmptyItemsInBag
RemoveEmptyItemsInBag: ; 0x0200F370
	ldr r0, _0200F388 ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _0200F38C ; =RemoveEmptyItems
	ldr r0, [r0]
	mov r1, #0x32
	ldr r0, [r0, #0x384]
	bx ip
	.align 2, 0
_0200F388: .word BAG_ITEMS_PTR_MIRROR
_0200F38C: .word RemoveEmptyItems
	arm_func_end RemoveEmptyItemsInBag

	arm_func_start RemoveItemNoHole
RemoveItemNoHole: ; 0x0200F390
	stmdb sp!, {r4, lr}
	ldr r2, _0200F400 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F3F8
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F3D4
	bl sub_020582E0
_0200F3D4:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F400 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F3F8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F400: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemNoHole

	arm_func_start RemoveItem
RemoveItem: ; 0x0200F404
	stmdb sp!, {r4, lr}
	ldr r2, _0200F450 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r4, #1]
	cmpne r0, #0
	beq _0200F444
	bl sub_020582E0
_0200F444:
	mov r0, r4
	bl ItemZInit
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F450: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItem

	arm_func_start RemoveHeldItemNoHole
RemoveHeldItemNoHole: ; 0x0200F454
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _0200F4D0 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r0, [r0]
	mov r6, r4
	ldr r8, [r0, #0x384]
	mov r7, #1
_0200F478:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _0200F4A8
	ldrb r0, [r8, #1]
	cmp r0, r5
	bne _0200F4A8
	bl sub_020582E0
	mov r0, r8
	bl ItemZInit
_0200F4A8:
	add r4, r4, #1
	cmp r4, #0x32
	add r8, r8, #6
	blt _0200F478
	ldr r0, _0200F4D0 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0200F4D0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveHeldItemNoHole

	arm_func_start RemoveItemByIdAndStackNoHole
RemoveItemByIdAndStackNoHole: ; 0x0200F4D4
	stmdb sp!, {r4, lr}
	ldr r1, _0200F554 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	ldr r4, [r1, #0x384]
	b _0200F544
_0200F4EC:
	ldrsh r2, [r4, #4]
	ldrsh r1, [r0]
	cmp r2, r1
	ldreqh r2, [r4, #2]
	ldreqh r1, [r0, #2]
	cmpeq r2, r1
	bne _0200F53C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F518
	bl sub_020582E0
_0200F518:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F554 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F53C:
	add r3, r3, #1
	add r4, r4, #6
_0200F544:
	cmp r3, #0x32
	blt _0200F4EC
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F554: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemByIdAndStackNoHole

	arm_func_start RemoveEquivItem
RemoveEquivItem: ; 0x0200F558
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F5FC ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F5EC
_0200F580:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F5E4
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200F5E4
	ldrb r0, [sb, #1]
	cmp r0, #0
	beq _0200F5C0
	bl sub_020582E0
_0200F5C0:
	mov r0, sb
	bl ItemZInit
	ldr r0, _0200F5FC ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F5E4:
	add r4, r4, #1
	add sb, sb, #6
_0200F5EC:
	cmp r4, #0x32
	blt _0200F580
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F5FC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveEquivItem

	arm_func_start RemoveEquivItemNoHole
RemoveEquivItemNoHole: ; 0x0200F600
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F690 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F680
_0200F628:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F678
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200F678
	ldrb r0, [sb, #1]
	cmp r0, #0
	beq _0200F668
	bl sub_020582E0
_0200F668:
	mov r0, sb
	bl ItemZInit
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F678:
	add r4, r4, #1
	add sb, sb, #6
_0200F680:
	cmp r4, #0x32
	blt _0200F628
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F690: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveEquivItemNoHole

	arm_func_start DecrementStackItem
DecrementStackItem: ; 0x0200F694
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F714 ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov sb, #1
	mov r7, #0xb
	b _0200F704
_0200F6BC:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200F6FC
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	ldrneh r1, [r4, #2]
	movne r0, #1
	subne r1, r1, #1
	strneh r1, [r4, #2]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F6FC:
	add r5, r5, #1
	add r4, r4, #6
_0200F704:
	cmp r5, #0x32
	blt _0200F6BC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F714: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end DecrementStackItem

	arm_func_start RemoveItemNoHoleCheck
RemoveItemNoHoleCheck: ; 0x0200F718
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _0200F78C
	ldr r2, _0200F794 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F78C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F768
	bl sub_020582E0
_0200F768:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F794 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F78C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F794: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemNoHoleCheck
