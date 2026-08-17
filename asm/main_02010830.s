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
