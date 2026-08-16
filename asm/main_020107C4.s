	.include "asm/macros.inc"
	.include "main_020107C4.inc"

	.text

	arm_func_start SetUnkGameState0x13a6
SetUnkGameState0x13a6: ; 0x020107C4
	ldr r1, _020107D8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa6]
	bx lr
	.align 2, 0
_020107D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetUnkGameState0x13a6
