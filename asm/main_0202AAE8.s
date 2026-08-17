	.include "asm/macros.inc"
	.include "main_0202AAE8.inc"

	.text

	arm_func_start sub_0202AAE8
sub_0202AAE8: ; 0x0202AAE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #9
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	strb r0, [r4, #0x1a0]
	mov r2, #0
	strb r0, [r4, #0x1a1]
	mov r0, r5
	sub r1, r2, #5
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202AAE8
