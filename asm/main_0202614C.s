	.include "asm/macros.inc"
	.include "main_0202614C.inc"

	.text

	arm_func_start sub_0202614C
sub_0202614C: ; 0x0202614C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r3, sp, #0
	str r1, [sp]
	mov r1, r3
	add r0, r0, #4
	str r2, [sp, #4]
	bl sub_02020B60
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202614C
