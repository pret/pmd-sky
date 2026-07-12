	.include "asm/macros.inc"
	.include "main_02001CB0.inc"

	.text

	arm_func_start FixedPoint64ToInt
FixedPoint64ToInt: ; 0x02001CB0
	ldmia r0, {r1, r2}
	mov r0, #0x10000
	rsb r0, r0, #0
	mov r1, r1, lsl #0x10
	and r0, r2, r0
	orr r0, r1, r0, lsr #16
	tst r2, #0x8000
	addne r0, r0, #1
	bx lr
	arm_func_end FixedPoint64ToInt
