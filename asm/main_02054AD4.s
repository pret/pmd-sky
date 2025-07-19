	.include "asm/macros.inc"
	.include "main_02054AD4.inc"

	.text

	arm_func_start IsCastform
IsCastform: ; 0x02054AD4
	ldr r2, _02054B24 ; =0x0000017B
	cmp r0, r2
	cmpne r0, #0x17c
	addne r1, r2, #2
	cmpne r0, r1
	addne r1, r2, #3
	cmpne r0, r1
	beq _02054B14
	ldr r1, _02054B28 ; =0xFFFFFC2D
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	bhi _02054B1C
_02054B14:
	mov r0, #1
	bx lr
_02054B1C:
	mov r0, #0
	bx lr
	.align 2, 0
_02054B24: .word 0x0000017B
_02054B28: .word 0xFFFFFC2D
	arm_func_end IsCastform

	arm_func_start IsCherrim
IsCherrim: ; 0x02054B2C
	cmp r0, #0x1cc
	ldrne r1, _02054B6C ; =0x000001CD
	cmpne r0, r1
	beq _02054B5C
	ldr r1, _02054B70 ; =0xFFFFFBDC
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _02054B64
_02054B5C:
	mov r0, #1
	bx lr
_02054B64:
	mov r0, #0
	bx lr
	.align 2, 0
_02054B6C: .word 0x000001CD
_02054B70: .word 0xFFFFFBDC
	arm_func_end IsCherrim

