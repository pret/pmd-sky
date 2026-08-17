	.include "asm/macros.inc"
	.include "main_02010724.inc"

	.text

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
