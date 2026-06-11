	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Math_CountPopulation
Math_CountPopulation: ; 0x02084F34
	ldr r1, _02084F6C ; =0x55555555
	ldr r2, _02084F70 ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r0, r0, r1
	and r1, r0, r2
	and r0, r2, r0, lsr #2
	add r1, r1, r0
	ldr r0, _02084F74 ; =0x0F0F0F0F
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02084F6C: .word 0x55555555
_02084F70: .word 0x33333333
_02084F74: .word 0x0F0F0F0F
	arm_func_end Math_CountPopulation


