	.include "asm/macros.inc"
	.include "overlay_29_022E908C.inc"

	.text

	arm_func_start GetChebyshevDistance
GetChebyshevDistance: ; 0x022E908C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r1, [r5]
	ldrsh r0, [r4]
	sub r0, r1, r0
	bl abs
	ldrsh r1, [r4, #2]
	ldrsh r2, [r5, #2]
	mov r4, r0
	sub r0, r2, r1
	bl abs
	cmp r4, r0
	movle r4, r0
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetChebyshevDistance
