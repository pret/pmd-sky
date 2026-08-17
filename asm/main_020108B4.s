	.include "asm/macros.inc"
	.include "main_020108B4.inc"

	.text

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

	arm_func_start RemoveInvalidKecleonShop2Items
RemoveInvalidKecleonShop2Items: ; 0x02010B3C
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
	arm_func_end RemoveInvalidKecleonShop2Items

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
