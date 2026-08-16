	.include "asm/macros.inc"
	.include "main_0200EF20.inc"

	.text

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
