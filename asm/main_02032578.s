	.include "asm/macros.inc"
	.include "main_02032578.inc"

	.text

	arm_func_start GetSelectedMenuItemIdx
GetSelectedMenuItemIdx: ; 0x02032578
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end GetSelectedMenuItemIdx
