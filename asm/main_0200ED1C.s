	.include "asm/macros.inc"
	.include "main_0200ED1C.inc"

	.text

	arm_func_start SetMoneyCarried
SetMoneyCarried: ; 0x0200ED1C
	ldr r1, _0200ED50 ; =0x0001869F
	cmp r0, r1
	movgt r0, r1
	bgt _0200ED34
	cmp r0, #0
	movlt r0, #0
_0200ED34:
	ldr r1, _0200ED54 ; =BAG_ITEMS_PTR_MIRROR
	ldr r2, [r1]
	ldrb r1, [r2, #0x388]
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x394]
	bx lr
	.align 2, 0
_0200ED50: .word 0x0001869F
_0200ED54: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetMoneyCarried

	arm_func_start AddMoneyCarried
AddMoneyCarried: ; 0x0200ED58
	ldr r1, _0200ED7C ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _0200ED80 ; =SetMoneyCarried
	ldr r2, [r1]
	ldrb r1, [r2, #0x388]
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x394]
	add r0, r0, r1
	bx ip
	.align 2, 0
_0200ED7C: .word BAG_ITEMS_PTR_MIRROR
_0200ED80: .word SetMoneyCarried
	arm_func_end AddMoneyCarried

	arm_func_start GetCurrentBagCapacity
GetCurrentBagCapacity: ; 0x0200ED84
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	mvn r1, #0
	cmp r0, r1
	bne _0200EDB8
	mov r0, #2
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl GetScenarioBalance
	bl GetBagCapacity
	ldmia sp!, {r3, pc}
_0200EDB8:
	bl GetBagCapacitySpecialEpisode
	ldmia sp!, {r3, pc}
	arm_func_end GetCurrentBagCapacity

	arm_func_start IsBagFull
IsBagFull: ; 0x0200EDC0
	stmdb sp!, {r3, lr}
	bl GetCurrentBagCapacity
	sub r2, r0, #1
	mov r0, #6
	ldr r1, _0200EDF8 ; =BAG_ITEMS_PTR_MIRROR
	mul r0, r2, r0
	ldr r1, [r1]
	ldr r1, [r1, #0x384]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EDF8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsBagFull

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

	arm_func_start ExclusiveItemEffectFlagTest
ExclusiveItemEffectFlagTest: ; 0x02010FA4
	mov r3, r1, lsr #5
	ldr r2, [r0, r3, lsl #2]
	sub r0, r1, r3, lsl #5
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	arm_func_end ExclusiveItemEffectFlagTest

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

	arm_func_start sub_02012B7C
sub_02012B7C: ; 0x02012B7C
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
	bl sub_020132A4
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
	bl sub_020132A4
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
	arm_func_end sub_02012B7C

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

	arm_func_start sub_020132A4
sub_020132A4: ; 0x020132A4
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
	bl sub_0200EB90
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
	arm_func_end sub_020132A4

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

	arm_func_start InitMove
InitMove: ; 0x020137B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r2, #5
	strb r2, [r4]
	mov r2, #0
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl GetMaxPp
	strb r0, [r4, #6]
	mov r0, #0
	strb r0, [r4, #7]
	ldmia sp!, {r4, pc}
	arm_func_end InitMove

	arm_func_start InitMoveCheckId
InitMoveCheckId: ; 0x020137E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r4]
	ldmeqia sp!, {r4, pc}
	mov r2, #5
	strb r2, [r4]
	mov r2, #0
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl GetMaxPp
	strb r0, [r4, #6]
	mov r0, #0
	strb r0, [r4, #7]
	ldmia sp!, {r4, pc}
	arm_func_end InitMoveCheckId

	arm_func_start GetInfoMoveGround
GetInfoMoveGround: ; 0x02013828
	mov r2, #5
	strb r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #4]
	bx lr
	arm_func_end GetInfoMoveGround

	arm_func_start GetMoveTargetAndRange
GetMoveTargetAndRange: ; 0x02013840
	ldr r2, _02013860 ; =DUNGEON_MOVE_TABLES
	ldrh r3, [r0, #4]
	ldr r2, [r2, #8]
	mov r0, #0x1a
	mla r0, r3, r0, r2
	add r0, r0, r1, lsl #1
	ldrsh r0, [r0, #4]
	bx lr
	.align 2, 0
_02013860: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveTargetAndRange

	arm_func_start GetMoveType
GetMoveType: ; 0x02013864
	ldr r1, _02013880 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_02013880: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveType

	arm_func_start GetMovesetLevelUpPtr
GetMovesetLevelUpPtr: ; 0x02013884
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _020138C4 ; =_02098D64
	ldreq r1, _020138C8 ; =DUNGEON_MOVE_TABLES
	moveq r0, #0xc
	smulbbeq r0, r4, r0
	ldreq r1, [r1]
	ldreq r0, [r1, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020138C4: .word _02098D64
_020138C8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetLevelUpPtr

	arm_func_start IsInvalidMoveset
IsInvalidMoveset: ; 0x020138CC
	cmp r0, #0
	ble _020138E0
	ldr r1, _020138F0 ; =0x00000229
	cmp r0, r1
	blt _020138E8
_020138E0:
	mov r0, #1
	bx lr
_020138E8:
	mov r0, #0
	bx lr
	.align 2, 0
_020138F0: .word 0x00000229
	arm_func_end IsInvalidMoveset

	arm_func_start GetMovesetHmTmPtr
GetMovesetHmTmPtr: ; 0x020138F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _02013938 ; =_02098D64
	ldmneia sp!, {r4, pc}
	ldr r1, _0201393C ; =DUNGEON_MOVE_TABLES
	mov r0, #0xc
	ldr r1, [r1]
	smlabb r0, r4, r0, r1
	ldr r0, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02013938: .word _02098D64
_0201393C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetHmTmPtr

	arm_func_start GetMovesetEggPtr
GetMovesetEggPtr: ; 0x02013940
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _02013984 ; =_02098D64
	ldmneia sp!, {r4, pc}
	ldr r1, _02013988 ; =DUNGEON_MOVE_TABLES
	mov r0, #0xc
	ldr r1, [r1]
	smlabb r0, r4, r0, r1
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02013984: .word _02098D64
_02013988: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetEggPtr

	arm_func_start GetMoveAiWeight
GetMoveAiWeight: ; 0x0201398C
	ldr r1, _020139A8 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #9]
	bx lr
	.align 2, 0
_020139A8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveAiWeight

	arm_func_start GetMoveNbStrikes
GetMoveNbStrikes: ; 0x020139AC
	ldr r1, _020139C8 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_020139C8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveNbStrikes

	arm_func_start GetMoveBasePower
GetMoveBasePower: ; 0x020139CC
	ldrh r2, [r0, #4]
	mov r0, #0x1a
	ldr r1, _020139E8 ; =DUNGEON_MOVE_TABLES
	mul r0, r2, r0
	ldr r1, [r1, #8]
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_020139E8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePower

	arm_func_start GetMoveBasePowerGround
GetMoveBasePowerGround: ; 0x020139EC
	ldrh r2, [r0, #2]
	mov r0, #0x1a
	ldr r1, _02013A08 ; =DUNGEON_MOVE_TABLES
	mul r0, r2, r0
	ldr r1, [r1, #8]
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_02013A08: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePowerGround

	arm_func_start GetMoveAccuracyOrAiChance
GetMoveAccuracyOrAiChance: ; 0x02013A0C
	ldr r2, _02013A2C ; =DUNGEON_MOVE_TABLES
	ldrh r3, [r0, #4]
	ldr r2, [r2, #8]
	mov r0, #0x1a
	mla r0, r3, r0, r2
	add r0, r0, r1
	ldrb r0, [r0, #0xa]
	bx lr
	.align 2, 0
_02013A2C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveAccuracyOrAiChance

	arm_func_start GetMoveBasePp
GetMoveBasePp: ; 0x02013A30
	ldr r1, _02013A4C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_02013A4C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePp
