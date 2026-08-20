	.include "asm/macros.inc"
	.include "main_02011E24.inc"

	.text

	arm_func_start CountTradedRecycleItems
CountTradedRecycleItems: ; 0x02011E24
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
	arm_func_end CountTradedRecycleItems

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

	arm_func_start RecycleShopTradeIsNonspecific
RecycleShopTradeIsNonspecific: ; 0x02011EC4
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
	arm_func_end RecycleShopTradeIsNonspecific

	arm_func_start RecycleShopOfferExists
RecycleShopOfferExists: ; 0x02011EE8
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
	arm_func_end RecycleShopOfferExists
