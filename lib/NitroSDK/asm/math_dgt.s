	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Math_CalcSha1
Math_CalcSha1: ; 0x02084F78
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	mov r4, r2
	bl Dgt_Hash2Init
	add r0, sp, #0
	mov r1, r5
	mov r2, r4
	bl Dgt_Hash2Update
	add r0, sp, #0
	mov r1, r6
	bl Dgt_Hash2GetHash
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Math_CalcSha1

