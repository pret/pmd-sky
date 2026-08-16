	.include "asm/macros.inc"
	.include "main_0200F7A8.inc"

	.text

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
