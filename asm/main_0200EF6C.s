	.include "asm/macros.inc"
	.include "main_0200EF6C.inc"

	.text

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
