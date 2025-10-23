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

	arm_func_start RemoveFirstUnequippedItemOfType
RemoveFirstUnequippedItemOfType: ; 0x0200F798
	stmdb sp!, {r3, lr}
	bl GetFirstUnequippedItemOfType
	bl RemoveItemNoHoleCheck
	ldmia sp!, {r3, pc}
	arm_func_end RemoveFirstUnequippedItemOfType

	arm_func_start RemoveAllItems
RemoveAllItems: ; 0x0200F7A8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0200F7D8 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r0, [r0]
	ldr r4, [r0, #0x384]
_0200F7BC:
	mov r0, r4
	bl ItemZInit
	add r5, r5, #1
	cmp r5, #0x32
	add r4, r4, #6
	blt _0200F7BC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0200F7D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveAllItems

	arm_func_start RemoveAllItemsStartingAt
RemoveAllItemsStartingAt: ; 0x0200F7DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _0200F848 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r0
	ldr r1, [r6]
	mov r0, #6
	ldr r1, [r1, #0x384]
	mov r5, r0
	mla r7, r4, r0, r1
	b _0200F828
_0200F800:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0200F810
	bl sub_020582E0
_0200F810:
	ldr r0, [r6]
	ldr r0, [r0, #0x384]
	mla r0, r4, r5, r0
	bl ItemZInit
	add r4, r4, #1
	add r7, r7, #6
_0200F828:
	cmp r4, #0x32
	blt _0200F800
	ldr r0, _0200F848 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200F848: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveAllItemsStartingAt

	arm_func_start SpecialProcAddItemToBag
SpecialProcAddItemToBag: ; 0x0200F84C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r1, r0
	add r0, sp, #0
	bl BulkItemToItem
	add r0, sp, #0
	mov r1, #0
	bl AddItemToBag
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end SpecialProcAddItemToBag

	arm_func_start AddItemToBagNoHeld
AddItemToBagNoHeld: ; 0x0200F874
	ldr ip, _0200F880 ; =AddItemToBag
	mov r1, #0
	bx ip
	.align 2, 0
_0200F880: .word AddItemToBag
	arm_func_end AddItemToBagNoHeld

	arm_func_start AddItemToBag
AddItemToBag: ; 0x0200F884
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0200F90C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	ldr r4, [r0, #0x384]
	bl GetCurrentBagCapacity
	mov ip, #0
	mov r1, ip
	mov r2, #1
	b _0200F8FC
_0200F8B0:
	ldrb r3, [r4]
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	bne _0200F8F4
	ldrh r1, [r6]
	mov r0, r6
	strh r1, [r4]
	ldrh r1, [r6, #2]
	strh r1, [r4, #2]
	ldrh r1, [r6, #4]
	strh r1, [r4, #4]
	strb r5, [r4, #1]
	bl SetItemAcquired
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_0200F8F4:
	add ip, ip, #1
	add r4, r4, #6
_0200F8FC:
	cmp ip, r0
	blt _0200F8B0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200F90C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddItemToBag

	arm_func_start CleanStickyItemsInBag
CleanStickyItemsInBag: ; 0x0200F910
	ldr r0, _0200F93C ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x384]
_0200F920:
	ldrb r0, [r1]
	add r2, r2, #1
	cmp r2, #0x32
	bic r0, r0, #8
	strb r0, [r1], #6
	blt _0200F920
	bx lr
	.align 2, 0
_0200F93C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CleanStickyItemsInBag

	arm_func_start CountStickyItemsInBag
CountStickyItemsInBag: ; 0x0200F940
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0200F9B0 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r0, [r0]
	mov r3, #1
	ldr ip, [r0, #0x384]
	mov r4, lr
	mov r2, lr
	mov r0, lr
	mov r1, r3
_0200F968:
	ldrb r5, [ip]
	tst r5, #1
	movne r6, r3
	moveq r6, r2
	tst r6, #0xff
	beq _0200F994
	tst r5, #8
	movne r5, r1
	moveq r5, r0
	tst r5, #0xff
	addne lr, lr, #1
_0200F994:
	add r4, r4, #1
	cmp r4, #0x32
	add ip, ip, #6
	blt _0200F968
	mov r0, lr, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200F9B0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountStickyItemsInBag

	arm_func_start sub_0200F9B4
sub_0200F9B4: ; 0x0200F9B4
	stmdb sp!, {r3, lr}
	ldr r1, _0200FA08 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r1, [r1]
	mov r2, lr
	ldr ip, [r1, #0x384]
	mov r3, #1
_0200F9D0:
	ldrb r1, [ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [ip, #1]
	cmpne r1, #0
	ldrneb r1, [r0, r1]
	strneb r1, [ip, #1]
	cmp lr, #0x32
	add ip, ip, #6
	blt _0200F9D0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200FA08: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0200F9B4

	arm_func_start sub_0200FA0C
sub_0200FA0C: ; 0x0200FA0C
	stmdb sp!, {r3, lr}
	ldr r3, _0200FA64 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0x12c
	ldr r3, [r3]
	mov lr, #0
	mla ip, r1, r2, r3
	mov r2, lr
	mov r3, #1
_0200FA2C:
	ldrb r1, [ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [ip, #1]
	cmpne r1, #0
	ldrneb r1, [r0, r1]
	strneb r1, [ip, #1]
	cmp lr, #0x32
	add ip, ip, #6
	blt _0200FA2C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200FA64: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0200FA0C

	arm_func_start TransmuteHeldItemInBag
TransmuteHeldItemInBag: ; 0x0200FA68
	stmdb sp!, {r4, lr}
	ldr r1, _0200FAE8 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r1, [r1]
	mov r3, r4
	ldr lr, [r1, #0x384]
	mov ip, #1
	b _0200FAD8
_0200FA88:
	ldrb r1, [lr]
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	beq _0200FAD0
	ldrb r2, [lr, #1]
	ldrb r1, [r0, #1]
	cmp r2, r1
	bne _0200FAD0
	ldrh r1, [r0]
	strh r1, [lr]
	ldrh r1, [r0, #2]
	strh r1, [lr, #2]
	ldrh r1, [r0, #4]
	mov r0, #1
	strh r1, [lr, #4]
	ldmia sp!, {r4, pc}
_0200FAD0:
	add r4, r4, #1
	add lr, lr, #6
_0200FAD8:
	cmp r4, #0x32
	blt _0200FA88
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200FAE8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end TransmuteHeldItemInBag

	arm_func_start SetFlagsForHeldItemInBag
SetFlagsForHeldItemInBag: ; 0x0200FAEC
	stmdb sp!, {r4, lr}
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, _0200FB50 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r2, [r2]
	mov r3, r4
	ldr lr, [r2, #0x384]
	mov ip, #1
_0200FB10:
	ldrb r2, [lr]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _0200FB3C
	ldrb r2, [lr, #1]
	cmp r2, r0
	ldreqb r2, [lr]
	orreq r2, r2, r1
	streqb r2, [lr]
_0200FB3C:
	add r4, r4, #1
	cmp r4, #0x32
	add lr, lr, #6
	blt _0200FB10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200FB50: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetFlagsForHeldItemInBag

	arm_func_start RemoveHolderForItemInBag
RemoveHolderForItemInBag: ; 0x0200FB54
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200FBDC ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	mov sb, #1
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov r7, sb
	b _0200FBCC
_0200FB7C:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200FBC4
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200FBC4
	mov r0, #0
	strb r0, [r4, #1]
	ldrb r1, [r6]
	mov r0, #1
	strb r1, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200FBC4:
	add r5, r5, #1
	add r4, r4, #6
_0200FBCC:
	cmp r5, #0x32
	blt _0200FB7C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200FBDC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveHolderForItemInBag

	arm_func_start SetHolderForItemInBag
SetHolderForItemInBag: ; 0x0200FBE0
	stmdb sp!, {r4, lr}
	ldr ip, _0200FC20 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #6
	ldr lr, [ip]
	smulbb ip, r0, r3
	ldr lr, [lr, #0x384]
	and r0, r2, #0xff
	ldrb r3, [lr, ip]
	add r4, lr, ip
	bic r3, r3, #0x10
	strb r3, [lr, ip]
	strb r2, [r1, #1]
	strb r0, [r4, #1]
	ldrb r0, [r1]
	strb r0, [lr, ip]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200FC20: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetHolderForItemInBag

	arm_func_start SortItemsInBag
SortItemsInBag: ; 0x0200FC24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	ldr r7, _0200FCA8 ; =BAG_ITEMS_PTR_MIRROR
	mov r8, r4
	mov sb, #1
	mov r6, #6
_0200FC3C:
	mul r1, r4, r6
	ldr r0, [r7]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add r5, r2, r1
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200FC84
	ldrsh r0, [r5, #4]
	cmp r0, #0xb7
	bne _0200FC84
	mov r0, r5
	bl sub_0200D8AC
	bl AddMoneyCarried
	mov r0, r5
	bl ItemZInit
_0200FC84:
	add r4, r4, #1
	cmp r4, #0x32
	blt _0200FC3C
	ldr r0, _0200FCA8 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl SortItemList
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200FCA8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortItemsInBag

	arm_func_start RemovePokeItemsInBag
RemovePokeItemsInBag: ; 0x0200FCAC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200FD34 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r0, [r0]
	mov r6, r5
	ldr r4, [r0, #0x384]
	mov r7, #1
_0200FCC8:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _0200FD0C
	ldrsh r0, [r4, #4]
	cmp r0, #0xb7
	bne _0200FD0C
	ldrb r1, [r4]
	mov r0, r4
	bic r1, r1, #8
	strb r1, [r4]
	bl sub_0200D8AC
	bl AddMoneyCarried
	mov r0, r4
	bl ItemZInit
_0200FD0C:
	add r5, r5, #1
	cmp r5, #0x32
	add r4, r4, #6
	blt _0200FCC8
	ldr r0, _0200FD34 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200FD34: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemovePokeItemsInBag

	arm_func_start sub_0200FD38
sub_0200FD38: ; 0x0200FD38
	bx lr
	arm_func_end sub_0200FD38

	arm_func_start sub_0200FD3C
sub_0200FD3C: ; 0x0200FD3C
	ldr ip, _0200FD44 ; =StorageZInit
	bx ip
	.align 2, 0
_0200FD44: .word StorageZInit
	arm_func_end sub_0200FD3C

	arm_func_start sub_0200FD48
sub_0200FD48: ; 0x0200FD48
	ldr ip, _0200FD50 ; =GetRankStorageSize
	bx ip
	.align 2, 0
_0200FD50: .word GetRankStorageSize
	arm_func_end sub_0200FD48

	arm_func_start IsStorageFull
IsStorageFull: ; 0x0200FD54
	stmdb sp!, {r4, lr}
	bl GetRankStorageSize
	mov r4, r0
	bl CountNbOfItemsInStorage
	cmp r0, r4
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsStorageFull

	arm_func_start CountNbOfItemsInStorage
CountNbOfItemsInStorage: ; 0x0200FD78
	ldr r1, _0200FDAC ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r3, [r1]
	mov r2, r0
_0200FD88:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #0x3e8
	blt _0200FD88
	bx lr
	.align 2, 0
_0200FDAC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbOfItemsInStorage

	arm_func_start CountNbOfValidItemsInStorage
CountNbOfValidItemsInStorage: ; 0x0200FDB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _0200FDFC ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r5
_0200FDC0:
	ldr r0, [r4]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x8a]
	cmp r1, #0
	beq _0200FDE8
	ldrsh r0, [r0, #0x8a]
	bl IsItemValidVeneer
	cmp r0, #0
	addne r5, r5, #1
_0200FDE8:
	add r6, r6, #1
	cmp r6, #0x3e8
	blt _0200FDC0
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200FDFC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbOfValidItemsInStorage

	arm_func_start CountNbOfValidItemsInTimeDarknessInStorage
CountNbOfValidItemsInTimeDarknessInStorage: ; 0x0200FE00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r6, _0200FEA4 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r4
_0200FE10:
	ldr r0, [r6]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r7, [r0, #0x8a]
	cmp r7, #0
	beq _0200FE90
	mov r0, r7
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0200FE90
	mov r0, r7
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _0200FE90
	mov r0, r7
	bl IsTreasureBox
	cmp r0, #0
	beq _0200FE8C
	ldr r0, [r6]
	add r0, r0, r5, lsl #1
	add r0, r0, #0xb00
	ldrsh r7, [r0, #0x5a]
	mov r0, r7
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0200FE90
	mov r0, r7
	bl IsItemInTimeDarkness
	cmp r0, #0
	addne r4, r4, #1
	b _0200FE90
_0200FE8C:
	add r4, r4, #1
_0200FE90:
	add r5, r5, #1
	cmp r5, #0x3e8
	blt _0200FE10
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200FEA4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbOfValidItemsInTimeDarknessInStorage

	arm_func_start CountNbItemsOfTypeInStorage
CountNbItemsOfTypeInStorage: ; 0x0200FEA8
	ldr r1, _0200FEE0 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr ip, [r1]
	mov r3, r2
_0200FEB8:
	add r1, ip, r3, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	add r3, r3, #1
	cmp r0, r1
	addeq r2, r2, #1
	cmp r3, #0x3e8
	blt _0200FEB8
	mov r0, r2
	bx lr
	.align 2, 0
_0200FEE0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbItemsOfTypeInStorage

	arm_func_start CountItemTypeInStorage
CountItemTypeInStorage: ; 0x0200FEE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _0200FF4C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	mov r5, r4
_0200FEF8:
	ldr r1, [r7]
	ldrsh r0, [r6]
	add r1, r1, r5, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r0, r1
	bne _0200FF38
	bl IsThrownItem
	cmp r0, #0
	addeq r4, r4, #1
	beq _0200FF38
	ldr r0, [r7]
	add r0, r0, r5, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	add r4, r4, r0
_0200FF38:
	add r5, r5, #1
	cmp r5, #0x3e8
	blt _0200FEF8
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200FF4C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountItemTypeInStorage

	arm_func_start GetEquivBulkItemIdxInStorage
GetEquivBulkItemIdxInStorage: ; 0x0200FF50
	stmdb sp!, {r3, lr}
	ldr r1, _0200FFA8 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr lr, [r1]
	b _0200FF98
_0200FF64:
	add r2, lr, ip, lsl #1
	add r1, r2, #0x300
	ldrsh r3, [r0]
	ldrsh r1, [r1, #0x8a]
	cmp r3, r1
	addeq r1, r2, #0xb00
	ldreqh r2, [r0, #2]
	ldreqh r1, [r1, #0x5a]
	cmpeq r2, r1
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r3, pc}
	add ip, ip, #1
_0200FF98:
	cmp ip, #0x3e8
	blt _0200FF64
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200FFA8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetEquivBulkItemIdxInStorage

	arm_func_start ConvertStorageItemAtIdxToBulkItem
ConvertStorageItemAtIdxToBulkItem: ; 0x0200FFAC
	ldr r3, _0200FFF0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r2, [r3]
	add r2, r2, r0, lsl #1
	add r2, r2, #0x300
	ldrsh r2, [r2, #0x8a]
	strh r2, [r1]
	ldr r2, [r3]
	add r0, r2, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	strh r0, [r1, #2]
	ldrsh r0, [r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200FFF0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ConvertStorageItemAtIdxToBulkItem

	arm_func_start ConvertStorageItemAtIdxToItem
ConvertStorageItemAtIdxToItem: ; 0x0200FFF4
	ldr r3, _02010040 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r2, [r3]
	add r2, r2, r0, lsl #1
	add r2, r2, #0x300
	ldrsh r2, [r2, #0x8a]
	strh r2, [r1, #4]
	ldr r2, [r3]
	add r0, r2, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	strh r0, [r1, #2]
	strb ip, [r1]
	strb ip, [r1, #1]
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne ip, #1
	and r0, ip, #0xff
	bx lr
	.align 2, 0
_02010040: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ConvertStorageItemAtIdxToItem

	arm_func_start sub_02010044
sub_02010044: ; 0x02010044
	ldr r1, _0201005C ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	bx lr
	.align 2, 0
_0201005C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010044

	arm_func_start sub_02010060
sub_02010060: ; 0x02010060
	ldr r1, _02010078 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	bx lr
	.align 2, 0
_02010078: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010060

	arm_func_start sub_0201007C
sub_0201007C: ; 0x0201007C
	stmdb sp!, {r3, lr}
	ldr r1, _02010150 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r2, [r1]
	b _02010144
_02010090:
	add r1, r2, r0, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r1, #0
	bne _02010140
	mov r1, r0
	add r0, r0, #1
	ldr r3, _02010150 ; =BAG_ITEMS_PTR_MIRROR
	b _020100FC
_020100B4:
	ldr lr, [r3]
	add r2, lr, r0, lsl #1
	add r2, r2, #0x300
	ldrsh ip, [r2, #0x8a]
	cmp ip, #0
	beq _020100F8
	add r2, lr, r1, lsl #1
	add r2, r2, #0x300
	strh ip, [r2, #0x8a]
	ldr lr, [r3]
	add r2, lr, r0, lsl #1
	add r2, r2, #0xb00
	ldrh ip, [r2, #0x5a]
	add r2, lr, r1, lsl #1
	add r2, r2, #0xb00
	strh ip, [r2, #0x5a]
	add r1, r1, #1
_020100F8:
	add r0, r0, #1
_020100FC:
	cmp r0, #0x3e8
	blt _020100B4
	mov r3, #0
	ldr r2, _02010150 ; =BAG_ITEMS_PTR_MIRROR
	b _02010134
_02010110:
	ldr r0, [r2]
	add r0, r0, r1, lsl #1
	add r0, r0, #0x300
	strh r3, [r0, #0x8a]
	ldr r0, [r2]
	add r0, r0, r1, lsl #1
	add r0, r0, #0xb00
	strh r3, [r0, #0x5a]
	add r1, r1, #1
_02010134:
	cmp r1, #0x3e8
	blt _02010110
	ldmia sp!, {r3, pc}
_02010140:
	add r0, r0, #1
_02010144:
	cmp r0, #0x3e8
	blt _02010090
	ldmia sp!, {r3, pc}
	.align 2, 0
_02010150: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201007C

	arm_func_start sub_02010154
sub_02010154: ; 0x02010154
	stmdb sp!, {r3, lr}
	ldr r2, _0201019C ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x300
	ldrsh r3, [r1, #0x8a]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r3, #0
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	strh r3, [r0, #0x5a]
	bl sub_0201007C
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201019C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010154

	arm_func_start RemoveItemAtIdxInStorage
RemoveItemAtIdxInStorage: ; 0x020101A0
	ldr r2, _020101E0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x300
	ldrsh r3, [r1, #0x8a]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	mov r3, #0
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	strh r3, [r0, #0x5a]
	mov r0, #1
	bx lr
	.align 2, 0
_020101E0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemAtIdxInStorage

	arm_func_start RemoveBulkItemInStorage
RemoveBulkItemInStorage: ; 0x020101E4
	stmdb sp!, {r4, lr}
	ldr r1, _0201025C ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r4, [r1]
	b _0201024C
_020101F8:
	add r3, r4, lr, lsl #1
	add r2, r3, #0x300
	ldrsh ip, [r0]
	ldrsh r1, [r2, #0x8a]
	cmp ip, r1
	addeq r1, r3, #0xb00
	ldreqh r3, [r0, #2]
	ldreqh r1, [r1, #0x5a]
	cmpeq r3, r1
	bne _02010248
	mov r1, #0
	ldr r0, _0201025C ; =BAG_ITEMS_PTR_MIRROR
	strh r1, [r2, #0x8a]
	ldr r0, [r0]
	add r0, r0, lr, lsl #1
	add r0, r0, #0xb00
	strh r1, [r0, #0x5a]
	bl sub_0201007C
	mov r0, #1
	ldmia sp!, {r4, pc}
_02010248:
	add lr, lr, #1
_0201024C:
	cmp lr, #0x3e8
	blt _020101F8
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201025C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveBulkItemInStorage

	arm_func_start RemoveItemInStorage
RemoveItemInStorage: ; 0x02010260
	stmdb sp!, {r4, lr}
	ldr r1, _020102D8 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r4, [r1]
	b _020102C8
_02010274:
	add r3, r4, lr, lsl #1
	add r2, r3, #0x300
	ldrsh ip, [r0, #4]
	ldrsh r1, [r2, #0x8a]
	cmp ip, r1
	addeq r1, r3, #0xb00
	ldreqh r3, [r0, #2]
	ldreqh r1, [r1, #0x5a]
	cmpeq r3, r1
	bne _020102C4
	mov r1, #0
	ldr r0, _020102D8 ; =BAG_ITEMS_PTR_MIRROR
	strh r1, [r2, #0x8a]
	ldr r0, [r0]
	add r0, r0, lr, lsl #1
	add r0, r0, #0xb00
	strh r1, [r0, #0x5a]
	bl sub_0201007C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020102C4:
	add lr, lr, #1
_020102C8:
	cmp lr, #0x3e8
	blt _02010274
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020102D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemInStorage

	arm_func_start StorageZInit
StorageZInit: ; 0x020102DC
	mov r3, #0
	ldr r1, _02010318 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, r3
_020102E8:
	ldr r0, [r1]
	add r0, r0, r3, lsl #1
	add r0, r0, #0x300
	strh r2, [r0, #0x8a]
	ldr r0, [r1]
	add r0, r0, r3, lsl #1
	add r0, r0, #0xb00
	add r3, r3, #1
	strh r2, [r0, #0x5a]
	cmp r3, #0x3e8
	blt _020102E8
	bx lr
	.align 2, 0
_02010318: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end StorageZInit

	arm_func_start AddBulkItemToStorage
AddBulkItemToStorage: ; 0x0201031C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	bl GetRankStorageSize
	mov r5, r0
	add r0, sp, #0
	mov r1, r4
	bl BulkItemToItem
	ldr r0, _020103A8 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r2, [r0]
	b _02010394
_0201034C:
	add r0, r2, ip, lsl #1
	add r1, r0, #0x300
	ldrsh r0, [r1, #0x8a]
	cmp r0, #0
	bne _02010390
	ldrsh r3, [r4]
	ldr r2, _020103A8 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	ldrh r2, [r4, #2]
	add r1, r1, ip, lsl #1
	add r1, r1, #0xb00
	strh r2, [r1, #0x5a]
	bl SetItemAcquired
	mov r0, #1
	b _020103A0
_02010390:
	add ip, ip, #1
_02010394:
	cmp ip, r5
	blt _0201034C
	mov r0, #0
_020103A0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020103A8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddBulkItemToStorage

	arm_func_start AddItemToStorage
AddItemToStorage: ; 0x020103AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetRankStorageSize
	ldr r1, _02010420 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r3, [r1]
	b _02010410
_020103C8:
	add r1, r3, ip, lsl #1
	add r1, r1, #0x300
	ldrsh r2, [r1, #0x8a]
	cmp r2, #0
	bne _0201040C
	ldrsh r3, [r4, #4]
	ldr r2, _02010420 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, r4
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	ldrh r2, [r4, #2]
	add r1, r1, ip, lsl #1
	add r1, r1, #0xb00
	strh r2, [r1, #0x5a]
	bl SetItemAcquired
	mov r0, #1
	ldmia sp!, {r4, pc}
_0201040C:
	add ip, ip, #1
_02010410:
	cmp ip, r0
	blt _020103C8
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02010420: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddItemToStorage

	arm_func_start SortItemsInStorage
SortItemsInStorage: ; 0x02010424
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r1, #6
	mov sl, r0
	mul r0, sb, r1
	mov r1, #0
	bl MemAlloc
	mov r5, #6
	mov r7, r0
	mov r8, #0
	mov fp, #0x80
	ldr r6, _0201058C ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r5
	b _020104C8
_0201045C:
	ldr r0, [r6]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _020104D0
	mla r0, r8, r5, r7
	bl ItemZInit
	ldrb r0, [sl, r8]
	mul r2, r8, r4
	cmp r0, #0
	movne r0, fp
	moveq r0, #0
	orr r0, r0, #1
	strb r0, [r7, r2]
	ldr r1, [r6]
	add r0, r7, r2
	add r1, r1, r8, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	strh r1, [r0, #4]
	ldr r1, [r6]
	add r1, r1, r8, lsl #1
	add r1, r1, #0xb00
	ldrh r1, [r1, #0x5a]
	add r8, r8, #1
	strh r1, [r0, #2]
_020104C8:
	cmp r8, sb
	blt _0201045C
_020104D0:
	mov r0, r7
	mov r1, r8
	bl SortItemList
	mov r6, #0
	mov r1, r6
	mov r2, #1
	mov fp, #6
	ldr r0, _0201058C ; =BAG_ITEMS_PTR_MIRROR
	b _0201053C
_020104F4:
	mul r4, r6, fp
	add r5, r7, r4
	ldr ip, [r0]
	ldrsh r3, [r5, #4]
	add ip, ip, r6, lsl #1
	add ip, ip, #0x300
	strh r3, [ip, #0x8a]
	ldr ip, [r0]
	ldrh r3, [r5, #2]
	add r5, ip, r6, lsl #1
	add r5, r5, #0xb00
	strh r3, [r5, #0x5a]
	ldrb r3, [r7, r4]
	tst r3, #0x80
	movne r3, r2
	moveq r3, r1
	strb r3, [sl, r6]
	add r6, r6, #1
_0201053C:
	cmp r6, r8
	blt _020104F4
	mov r2, #0
	ldr r1, _0201058C ; =BAG_ITEMS_PTR_MIRROR
	b _02010578
_02010550:
	ldr r0, [r1]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	strh r2, [r0, #0x8a]
	ldr r0, [r1]
	add r0, r0, r6, lsl #1
	add r0, r0, #0xb00
	strh r2, [r0, #0x5a]
	strb r2, [sl, r6]
	add r6, r6, #1
_02010578:
	cmp r6, sb
	blt _02010550
	mov r0, r7
	bl MemFree
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201058C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortItemsInStorage

	arm_func_start sub_02010590
sub_02010590: ; 0x02010590
	bx lr
	arm_func_end sub_02010590

	arm_func_start AllKecleonShopsZInit
AllKecleonShopsZInit: ; 0x02010594
	stmdb sp!, {r4, r5, r6, lr}
	mov r2, #0
	ldr ip, _02010650 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r2
	mov r0, r2
	mov r1, r2
_020105AC:
	mov r6, r1
_020105B0:
	ldr r3, [ip]
	mov r4, r6, lsl #2
	add r3, r3, #0x330
	add r3, r3, #0x1000
	add r3, r3, r2, lsl #5
	add lr, r3, r6, lsl #2
	strh r5, [r3, r4]
	add r6, r6, #1
	strh r5, [lr, #2]
	cmp r6, #8
	blt _020105B0
	mov r6, r5
_020105E0:
	ldr r3, [ip]
	mov lr, r6, lsl #2
	add r3, r3, #0x374
	add r3, r3, #0x1000
	add r3, r3, r2, lsl #4
	add r4, r3, r6, lsl #2
	strh r0, [r3, lr]
	add r6, r6, #1
	strh r0, [r4, #2]
	cmp r6, #4
	blt _020105E0
	add r2, r2, #1
	cmp r2, #2
	blt _020105AC
	ldr r2, _02010650 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r0, [r1, #0x3a0]
	ldr r1, [r2]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa4]
	ldr r1, [r2]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa6]
	ldr r1, [r2]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02010650: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AllKecleonShopsZInit

	arm_func_start SpecialEpisodeKecleonShopZInit
SpecialEpisodeKecleonShopZInit: ; 0x02010654
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r2, _020106C0 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, lr
_02010664:
	ldr r1, [r2]
	mov r3, lr, lsl #2
	add r1, r1, #0x350
	add r1, r1, #0x1000
	add ip, r1, lr, lsl #2
	strh r0, [r1, r3]
	add lr, lr, #1
	strh r0, [ip, #2]
	cmp lr, #8
	blt _02010664
	ldr r2, _020106C0 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
_02010694:
	ldr r1, [r2]
	mov ip, r0, lsl #2
	add r1, r1, #0x384
	add r1, r1, #0x1000
	add lr, r1, r0, lsl #2
	strh r3, [r1, ip]
	add r0, r0, #1
	strh r3, [lr, #2]
	cmp r0, #4
	blt _02010694
	ldmia sp!, {r3, pc}
	.align 2, 0
_020106C0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SpecialEpisodeKecleonShopZInit

	arm_func_start SetActiveKecleonShop
SetActiveKecleonShop: ; 0x020106C4
	ldr r2, _02010708 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x32a]
	ldr ip, [r2]
	add r1, ip, #0x330
	add r1, r1, #0x1000
	add r3, r1, r0, lsl #5
	add r1, ip, #0x1000
	str r3, [r1, #0x32c]
	ldr r2, [r2]
	add r1, r2, #0x374
	add r1, r1, #0x1000
	add r1, r1, r0, lsl #4
	add r0, r2, #0x1000
	str r1, [r0, #0x370]
	bx lr
	.align 2, 0
_02010708: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetActiveKecleonShop

	arm_func_start GetMoneyStored
GetMoneyStored: ; 0x0201070C
	ldr r0, _02010720 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3a0]
	bx lr
	.align 2, 0
_02010720: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetMoneyStored

	arm_func_start SetMoneyStored
SetMoneyStored: ; 0x02010724
	ldr r1, _02010750 ; =0x0098967F
	cmp r0, r1
	movgt r0, r1
	bgt _0201073C
	cmp r0, #0
	movlt r0, #0
_0201073C:
	ldr r1, _02010754 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x3a0]
	bx lr
	.align 2, 0
_02010750: .word 0x0098967F
_02010754: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetMoneyStored

	arm_func_start AddMoneyStored
AddMoneyStored: ; 0x02010758
	ldr r1, _02010774 ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _02010778 ; =SetMoneyStored
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x3a0]
	add r0, r1, r0
	bx ip
	.align 2, 0
_02010774: .word BAG_ITEMS_PTR_MIRROR
_02010778: .word SetMoneyStored
	arm_func_end AddMoneyStored

	arm_func_start sub_0201077C
sub_0201077C: ; 0x0201077C
	ldr r0, _02010790 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xa4]
	bx lr
	.align 2, 0
_02010790: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201077C

	arm_func_start sub_02010794
sub_02010794: ; 0x02010794
	ldr r1, _020107A8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa4]
	bx lr
	.align 2, 0
_020107A8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010794

	arm_func_start sub_020107AC
sub_020107AC: ; 0x020107AC
	ldr r0, _020107C0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xa6]
	bx lr
	.align 2, 0
_020107C0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107AC

	arm_func_start sub_020107C4
sub_020107C4: ; 0x020107C4
	ldr r1, _020107D8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa6]
	bx lr
	.align 2, 0
_020107D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107C4

	arm_func_start sub_020107DC
sub_020107DC: ; 0x020107DC
	ldr r0, _020107F0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xa8]
	bx lr
	.align 2, 0
_020107F0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107DC

	arm_func_start sub_020107F4
sub_020107F4: ; 0x020107F4
	ldr r1, _02010808 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa8]
	bx lr
	.align 2, 0
_02010808: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107F4

	arm_func_start sub_0201080C
sub_0201080C: ; 0x0201080C
	ldr r0, _0201082C ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r1, [r0, #0xa8]
	cmp r1, #0
	subne r1, r1, #1
	strneh r1, [r0, #0xa8]
	bx lr
	.align 2, 0
_0201082C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201080C

	arm_func_start sub_02010830
sub_02010830: ; 0x02010830
	ldr r1, _02010868 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	mov r2, r0
	add r1, r1, #0x1000
	ldr r3, [r1, #0x32c]
_02010848:
	mov r1, r2, lsl #2
	ldrsh r1, [r3, r1]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #8
	blt _02010848
	bx lr
	.align 2, 0
_02010868: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010830

	arm_func_start RemoveItemFromKecleonShop1
RemoveItemFromKecleonShop1: ; 0x0201086C
	ldr r1, _02010894 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, r0, lsl #2
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	strh r2, [r1, r3]
	add r0, r1, r0, lsl #2
	strh r2, [r0, #2]
	bx lr
	.align 2, 0
_02010894: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemFromKecleonShop1

	arm_func_start sub_02010898
sub_02010898: ; 0x02010898
	ldr r1, _020108B0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	add r0, r1, r0, lsl #2
	bx lr
	.align 2, 0
_020108B0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010898

	arm_func_start sub_020108B4
sub_020108B4: ; 0x020108B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	mov r4, r0
	ldr r2, _02010950 ; =BAG_ITEMS_PTR_MIRROR
	b _020108E8
_020108C8:
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	ldrsh r1, [r1, r3]
	cmp r1, #0
	bne _020108F0
	add r0, r0, #1
_020108E8:
	cmp r0, #8
	blt _020108C8
_020108F0:
	cmp r0, #8
	beq _02010944
	cmp r0, r4
	ble _0201092C
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r5, [r1, #0x32c]
	mov lr, r4, lsl #2
	ldrh r1, [r5, r3]
	add ip, r5, r0, lsl #2
	add r3, r5, r4, lsl #2
	strh r1, [r5, lr]
	ldrh r1, [ip, #2]
	strh r1, [r3, #2]
_0201092C:
	add r0, r0, #1
	add r4, r4, #1
	b _020108E8
_02010938:
	and r0, r4, #0xff
	bl RemoveItemFromKecleonShop1
	add r4, r4, #1
_02010944:
	cmp r4, #8
	blt _02010938
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02010950: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020108B4

	arm_func_start SortKecleonItems1
SortKecleonItems1: ; 0x02010954
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, #0
_02010960:
	add r7, r6, #1
	mov r5, r6, lsl #2
	ldr r4, _02010A48 ; =BAG_ITEMS_PTR_MIRROR
	b _02010A2C
_02010970:
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x32c]
	ldrsh r0, [r5, r0]
	bl sub_0200D1F0
	ldr r1, [r4]
	mov r2, r7, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	mov r8, r0
	ldrsh r0, [r1, r2]
	bl sub_0200D1F0
	cmp r8, r0
	bgt _020109D0
	bne _02010A28
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x32c]
	add r1, r5, r0
	add r0, r0, r7, lsl #2
	ldrh r1, [r1, #2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bhs _02010A28
_020109D0:
	ldr r1, [r4]
	mov r0, r7, lsl #2
	add r1, r1, #0x1000
	ldr r8, [r1, #0x32c]
	add lr, r5, r8
	ldrh ip, [r5, r8]
	ldrh r3, [lr, #2]
	ldrh r1, [r8, r0]
	add r2, r8, r7, lsl #2
	strh ip, [sp]
	strh r1, [r5, r8]
	ldrh r1, [r2, #2]
	strh r3, [sp, #2]
	ldrh r3, [sp]
	strh r1, [lr, #2]
	ldr r1, [r4]
	ldrh r2, [sp, #2]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	strh r3, [r1, r0]
	add r0, r1, r7, lsl #2
	strh r2, [r0, #2]
_02010A28:
	add r7, r7, #1
_02010A2C:
	cmp r7, #8
	blt _02010970
	add r6, r6, #1
	cmp r6, #7
	blt _02010960
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02010A48: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortKecleonItems1

	arm_func_start GenerateKecleonItems1
GenerateKecleonItems1: ; 0x02010A4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r4, #0
_02010A58:
	and r0, r4, #0xff
	bl RemoveItemFromKecleonShop1
	add r4, r4, #1
	cmp r4, #8
	blt _02010A58
	ldr r0, _02010AC0 ; =KECLEON_SHOP_ITEM_TABLE_LISTS_1
	ldr r5, _02010AC4 ; =0x0000270F
	ldr r6, [r0, r8, lsl #2]
	mov r7, #0
_02010A7C:
	mov r0, r5
	bl RandIntSafe
	mov r4, r0
	mov r0, r5
	bl RandIntSafe
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl GetItemIdFromList
	bl AddItemToKecleonShop1
	add r7, r7, #1
	cmp r7, #8
	blt _02010A7C
	bl SortKecleonItems1
	mov r0, r8
	bl GenerateKecleonItems2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02010AC0: .word KECLEON_SHOP_ITEM_TABLE_LISTS_1
_02010AC4: .word 0x0000270F
	arm_func_end GenerateKecleonItems1

	arm_func_start AddItemToKecleonShop1
AddItemToKecleonShop1: ; 0x02010AC8
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl InitBulkItem
	ldr r0, _02010B38 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r3, [r0]
	add r0, r3, #0x1000
	b _02010B28
_02010AEC:
	ldr r1, [r0, #0x32c]
	mov ip, r2, lsl #2
	ldrsh r1, [r1, ip]
	cmp r1, #0
	bne _02010B24
	add r0, r3, #0x1000
	ldr r3, [r0, #0x32c]
	ldrh r1, [sp]
	add r2, r3, ip
	mov r0, #0
	strh r1, [r3, ip]
	ldrh r1, [sp, #2]
	strh r1, [r2, #2]
	ldmia sp!, {r3, pc}
_02010B24:
	add r2, r2, #1
_02010B28:
	cmp r2, #8
	blt _02010AEC
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02010B38: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddItemToKecleonShop1

	arm_func_start sub_02010B3C
sub_02010B3C: ; 0x02010B3C
	ldr r1, _02010B74 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	mov r2, r0
	add r1, r1, #0x1000
	ldr r3, [r1, #0x370]
_02010B54:
	mov r1, r2, lsl #2
	ldrsh r1, [r3, r1]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #4
	blt _02010B54
	bx lr
	.align 2, 0
_02010B74: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010B3C

	arm_func_start RemoveItemFromKecleonShop2
RemoveItemFromKecleonShop2: ; 0x02010B78
	ldr r1, _02010BA0 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, r0, lsl #2
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	strh r2, [r1, r3]
	add r0, r1, r0, lsl #2
	strh r2, [r0, #2]
	bx lr
	.align 2, 0
_02010BA0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemFromKecleonShop2

	arm_func_start sub_02010BA4
sub_02010BA4: ; 0x02010BA4
	ldr r1, _02010BBC ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	add r0, r1, r0, lsl #2
	bx lr
	.align 2, 0
_02010BBC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010BA4

	arm_func_start sub_02010BC0
sub_02010BC0: ; 0x02010BC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	mov r4, r0
	ldr r2, _02010C5C ; =BAG_ITEMS_PTR_MIRROR
	b _02010BF4
_02010BD4:
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	ldrsh r1, [r1, r3]
	cmp r1, #0
	bne _02010BFC
	add r0, r0, #1
_02010BF4:
	cmp r0, #4
	blt _02010BD4
_02010BFC:
	cmp r0, #4
	beq _02010C50
	cmp r0, r4
	ble _02010C38
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r5, [r1, #0x370]
	mov lr, r4, lsl #2
	ldrh r1, [r5, r3]
	add ip, r5, r0, lsl #2
	add r3, r5, r4, lsl #2
	strh r1, [r5, lr]
	ldrh r1, [ip, #2]
	strh r1, [r3, #2]
_02010C38:
	add r0, r0, #1
	add r4, r4, #1
	b _02010BF4
_02010C44:
	and r0, r4, #0xff
	bl RemoveItemFromKecleonShop2
	add r4, r4, #1
_02010C50:
	cmp r4, #4
	blt _02010C44
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02010C5C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010BC0

	arm_func_start SortKecleonItems2
SortKecleonItems2: ; 0x02010C60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, #0
_02010C6C:
	add r7, r6, #1
	mov r5, r6, lsl #2
	ldr r4, _02010D54 ; =BAG_ITEMS_PTR_MIRROR
	b _02010D38
_02010C7C:
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x370]
	ldrsh r0, [r5, r0]
	bl sub_0200D1F0
	ldr r1, [r4]
	mov r2, r7, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	mov r8, r0
	ldrsh r0, [r1, r2]
	bl sub_0200D1F0
	cmp r8, r0
	bgt _02010CDC
	bne _02010D34
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x370]
	add r1, r5, r0
	add r0, r0, r7, lsl #2
	ldrh r1, [r1, #2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bhs _02010D34
_02010CDC:
	ldr r1, [r4]
	mov r0, r7, lsl #2
	add r1, r1, #0x1000
	ldr r8, [r1, #0x370]
	add lr, r5, r8
	ldrh ip, [r5, r8]
	ldrh r3, [lr, #2]
	ldrh r1, [r8, r0]
	add r2, r8, r7, lsl #2
	strh ip, [sp]
	strh r1, [r5, r8]
	ldrh r1, [r2, #2]
	strh r3, [sp, #2]
	ldrh r3, [sp]
	strh r1, [lr, #2]
	ldr r1, [r4]
	ldrh r2, [sp, #2]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	strh r3, [r1, r0]
	add r0, r1, r7, lsl #2
	strh r2, [r0, #2]
_02010D34:
	add r7, r7, #1
_02010D38:
	cmp r7, #4
	blt _02010C7C
	add r6, r6, #1
	cmp r6, #3
	blt _02010C6C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02010D54: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortKecleonItems2

	arm_func_start GenerateKecleonItems2
GenerateKecleonItems2: ; 0x02010D58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, #0
_02010D64:
	and r0, r4, #0xff
	bl RemoveItemFromKecleonShop2
	add r4, r4, #1
	cmp r4, #4
	blt _02010D64
	ldr r0, _02010DC4 ; =KECLEON_SHOP_ITEM_TABLE_LISTS_2
	mov r7, #0
	ldr r6, [r0, r5, lsl #2]
	ldr r5, _02010DC8 ; =0x0000270F
_02010D88:
	mov r0, r5
	bl RandIntSafe
	mov r4, r0
	mov r0, r5
	bl RandIntSafe
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl GetItemIdFromList
	bl AddItemToKecleonShop2
	add r7, r7, #1
	cmp r7, #4
	blt _02010D88
	bl SortKecleonItems2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02010DC4: .word KECLEON_SHOP_ITEM_TABLE_LISTS_2
_02010DC8: .word 0x0000270F
	arm_func_end GenerateKecleonItems2

	arm_func_start AddItemToKecleonShop2
AddItemToKecleonShop2: ; 0x02010DCC
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl InitBulkItem
	ldr r0, _02010E3C ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r3, [r0]
	add r0, r3, #0x1000
	b _02010E2C
_02010DF0:
	ldr r1, [r0, #0x370]
	mov ip, r2, lsl #2
	ldrsh r1, [r1, ip]
	cmp r1, #0
	bne _02010E28
	add r0, r3, #0x1000
	ldr r3, [r0, #0x370]
	ldrh r1, [sp]
	add r2, r3, ip
	mov r0, #0
	strh r1, [r3, ip]
	ldrh r1, [sp, #2]
	strh r1, [r2, #2]
	ldmia sp!, {r3, pc}
_02010E28:
	add r2, r2, #1
_02010E2C:
	cmp r2, #4
	blt _02010DF0
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02010E3C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddItemToKecleonShop2

	arm_func_start GetExclusiveItemOffset
GetExclusiveItemOffset: ; 0x02010E40
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetItemCategory
	cmp r0, #0xf
	movne r0, #0
	subeq r0, r4, #0x1bc
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end GetExclusiveItemOffset

	arm_func_start ApplyExclusiveItemStatBoosts
ApplyExclusiveItemStatBoosts: ; 0x02010E64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x28]
	bl GetExclusiveItemOffset
	ldr r1, _02010F6C ; =EXCLUSIVE_ITEM_STAT_BOOST_DATA_INDEXES
	ldrb r2, [r7]
	ldrb r1, [r1, r0, lsl #1]
	ldrb r0, [r4]
	strh r2, [sp, #4]
	ldrb r2, [r5]
	strh r0, [sp, #2]
	ldrb r3, [r6]
	ldr r0, _02010F70 ; =EXCLUSIVE_ITEM_ATTACK_BOOSTS
	mov r1, r1, lsl #2
	strh r3, [sp, #6]
	strh r2, [sp]
	ldrsb r2, [r0, r1]
	ldr r0, _02010F74 ; =EXCLUSIVE_ITEM_SPECIAL_ATTACK_BOOSTS
	ldrh sb, [sp, #4]
	ldrsb r8, [r0, r1]
	mov r0, r2, lsl #0x10
	add r0, sb, r0, lsr #16
	strh r0, [sp, #4]
	mov r0, r8, lsl #0x10
	ldrh lr, [sp, #6]
	ldrh r2, [sp, #4]
	ldr ip, _02010F78 ; =EXCLUSIVE_ITEM_DEFENSE_BOOSTS
	add r0, lr, r0, lsr #16
	ldrsb lr, [ip, r1]
	ldr r3, _02010F7C ; =EXCLUSIVE_ITEM_SPECIAL_DEFENSE_BOOSTS
	ldrsh ip, [sp, #2]
	ldrsb r1, [r3, r1]
	strh r0, [sp, #6]
	ldrsh r8, [sp]
	add r0, ip, r1
	strh r0, [sp, #2]
	cmp r2, #0xff
	movhi r0, #0xff
	strhih r0, [sp, #4]
	ldrh r0, [sp, #6]
	add r3, r8, lr
	ldrh r2, [sp, #4]
	cmp r0, #0xff
	movhi r0, #0xff
	strh r3, [sp]
	strhih r0, [sp, #6]
	ldrsh r0, [sp]
	strb r2, [r7]
	cmp r0, #0xff
	movgt r0, #0xff
	strgth r0, [sp]
	ldrsh r0, [sp, #2]
	ldrsh r1, [sp]
	cmp r0, #0xff
	movgt r0, #0xff
	strgth r0, [sp, #2]
	ldrh r0, [sp, #6]
	strb r0, [r6]
	ldrsh r0, [sp, #2]
	strb r1, [r5]
	strb r0, [r4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02010F6C: .word EXCLUSIVE_ITEM_STAT_BOOST_DATA_INDEXES
_02010F70: .word EXCLUSIVE_ITEM_ATTACK_BOOSTS
_02010F74: .word EXCLUSIVE_ITEM_SPECIAL_ATTACK_BOOSTS
_02010F78: .word EXCLUSIVE_ITEM_DEFENSE_BOOSTS
_02010F7C: .word EXCLUSIVE_ITEM_SPECIAL_DEFENSE_BOOSTS
	arm_func_end ApplyExclusiveItemStatBoosts

	arm_func_start SetExclusiveItemEffect
SetExclusiveItemEffect: ; 0x02010F80
	cmp r1, #0
	bxeq lr
	mov ip, r1, lsr #5
	ldr r3, [r0, ip, lsl #2]
	sub r1, r1, ip, lsl #5
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, ip, lsl #2]
	bx lr
	arm_func_end SetExclusiveItemEffect
