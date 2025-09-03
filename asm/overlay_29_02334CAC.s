	.include "asm/macros.inc"
	.include "overlay_29_02334CAC.inc"

	.text

	arm_func_start HasLastUsedMove
HasLastUsedMove: ; 0x02334CAC
	stmdb sp!, {r3, lr}
	mov r3, #0
	mov r1, r3
	mov r2, #1
	b _02334CE8
_02334CC0:
	ldrb ip, [r0, r3, lsl #3]
	tst ip, #1
	movne lr, r2
	moveq lr, r1
	tst lr, #0xff
	beq _02334CE4
	tst ip, #0x10
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02334CE4:
	add r3, r3, #1
_02334CE8:
	cmp r3, #4
	blt _02334CC0
	ldrb r0, [r0, #0x20]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end HasLastUsedMove
