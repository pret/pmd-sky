	.include "asm/macros.inc"
	.include "main_020307B8.inc"

	.text

	arm_func_start sub_020307B8
sub_020307B8: ; 0x020307B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1bc]
	mov r1, #0
	strb r1, [r0, #0x1c0]
	strb r1, [r0, #0x1c1]
	ldr r1, [r0, #0x104]
	bic r1, r1, #0x800000
	str r1, [r0, #0x104]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_020307B8

	arm_func_start sub_020307EC
sub_020307EC: ; 0x020307EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #7
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _02030828
	mov r0, r5
	bl sub_020307B8
	ldmia sp!, {r3, r4, r5, pc}
_02030828:
	ldr r0, [r4, #0x1bc]
	cmp r0, #6
	moveq r0, #0
	streq r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020307EC
