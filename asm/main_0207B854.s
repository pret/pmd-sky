	.include "asm/macros.inc"
	.include "main_0207B854.inc"

	.text

; https://decomp.me/scratch/5f50V
	arm_func_start sub_0207B854
sub_0207B854: ; 0x0207B854
	subs r0, r0, #4
	bhs sub_0207B854
	bx lr
	arm_func_end sub_0207B854
