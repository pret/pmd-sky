	.include "asm/macros.inc"
	.include "main_02010830.inc"

	.text

	arm_func_start RemoveInvalidKecleonShop1Items
RemoveInvalidKecleonShop1Items: ; 0x02010830
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
	arm_func_end RemoveInvalidKecleonShop1Items

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

	arm_func_start GetCurrentKecleonShop1ItemByIndex
GetCurrentKecleonShop1ItemByIndex: ; 0x02010898
	ldr r1, _020108B0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	add r0, r1, r0, lsl #2
	bx lr
	.align 2, 0
_020108B0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetCurrentKecleonShop1ItemByIndex

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
	ldr r5, _02010AC4
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

	arm_func_start GetCurrentKecleonShop2ItemByIndex
GetCurrentKecleonShop2ItemByIndex: ; 0x02010BA4
	ldr r1, _02010BBC ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	add r0, r1, r0, lsl #2
	bx lr
	.align 2, 0
_02010BBC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetCurrentKecleonShop2ItemByIndex

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
