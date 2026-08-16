	.include "asm/macros.inc"
	.include "main_02010794.inc"

	.text

	arm_func_start SetEggSpecies
SetEggSpecies: ; 0x02010794
	ldr r1, _020107A8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa4]
	bx lr
	.align 2, 0
_020107A8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetEggSpecies
