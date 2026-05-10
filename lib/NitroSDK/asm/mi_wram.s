	.include "asm/macros.inc"

	.text

	arm_func_start MI_SetWramBank
MI_SetWramBank: ; 0x0207BC3C
	ldr r1, _0207BC48 ; =0x04000247
	strb r0, [r1]
	bx lr
	.align 2, 0
_0207BC48: .word 0x04000247
	arm_func_end MI_SetWramBank
