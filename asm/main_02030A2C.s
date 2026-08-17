	.include "asm/macros.inc"
	.include "main_02030A2C.inc"

	.text

	arm_func_start SetWindowTitle
SetWindowTitle: ; 0x02030A2C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strh r4, [r0, #0x20]
	ldmia sp!, {r4, pc}
	arm_func_end SetWindowTitle
