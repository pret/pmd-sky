	.include "asm/macros.inc"
	.include "main_02001A30.inc"

	.text

	arm_func_start UFixedPoint64CmpLt
UFixedPoint64CmpLt: ; 0x02001A30
	cmp r0, r2
	movlo r0, #1
	bxlo lr
	movhi r0, #0
	bxhi lr
	cmp r1, r3
	movlo r0, #1
	movhs r0, #0
	bx lr
	arm_func_end UFixedPoint64CmpLt
