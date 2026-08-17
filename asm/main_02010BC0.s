	.include "asm/macros.inc"
	.include "main_02010BC0.inc"

	.text

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
	ldr r5, _02010DC8
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
