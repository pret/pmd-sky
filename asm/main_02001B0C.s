	.include "asm/macros.inc"
	.include "main_02001B0C.inc"

	.text

	arm_func_start UMultiplyByFixedPoint
UMultiplyByFixedPoint: ; 0x02001B0C
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #0
	mov r2, r3
	mov ip, r3
	mov lr, r3
	mov r4, r3
_02001B3C:
	mov r5, lr
	tst r1, #1
	beq _02001B58
	add lr, lr, r0
	add ip, ip, r3
	cmp r5, lr
	addhi ip, ip, #1
_02001B58:
	mov r1, r1, lsr #1
	tst r2, #1
	orrne r1, r1, #0x80000000
	mov r2, r2, lsr #1
	tst r0, #0x80000000
	mov r3, r3, lsl #1
	mov r0, r0, lsl #1
	add r4, r4, #1
	orrne r3, r3, #1
	bic r2, r2, #0x80000000
	cmp r4, #0x40
	bic r0, r0, #1
	blt _02001B3C
	mov r0, lr, lsr #8
	tst lr, #0x80
	movne r1, #1
	bic r0, r0, #0xff000000
	moveq r1, #0
	orr lr, r0, ip, lsl #24
	tst r1, #0xff
	addne lr, lr, #1
	mov r0, lr
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UMultiplyByFixedPoint
