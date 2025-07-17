	.include "asm/macros.inc"
	.include "overlay_31_023833D8.inc"

	.text

; https://decomp.me/scratch/Q183B
	arm_func_start ov31_023833D8
ov31_023833D8: ; 0x023833D8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x98
	ldr lr, _02383424 ; =ov31_02383328
	ldr r3, _02383428 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A268
	mov ip, #1
	str r0, [sp, #0x88]
	strb ip, [r3, #1]
	ldr r2, _0238342C ; =ov31_0238335C
	add r1, sp, #0
	str lr, [sp, #0x84]
	mov ip, #0
	mov r0, #0x100
	strb ip, [r3]
	bl sub_020355DC
	bl sub_0204AEA0
	ldr r1, _02383430 ; =ov31_0238A2A8
	strb r0, [r1]
	add sp, sp, #0x98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383424: .word ov31_02383328
_02383428: .word OVERLAY31_UNKNOWN_POINTER__NA_238A268
_0238342C: .word ov31_0238335C
_02383430: .word ov31_0238A2A8
	arm_func_end ov31_023833D8

	arm_func_start ov31_02383434
ov31_02383434: ; 0x02383434
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x98
	ldr ip, _02383470 ; =ov31_023833B4
	ldr r3, _02383474 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A268
	mov r1, #1
	str r0, [sp, #0x88]
	strb r1, [r3, #1]
	add r2, sp, #0
	str ip, [sp, #0x84]
	mov r0, #0
	mov r1, #0x100
	strb r0, [r3]
	bl sub_02035CE4
	add sp, sp, #0x98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383470: .word ov31_023833B4
_02383474: .word OVERLAY31_UNKNOWN_POINTER__NA_238A268
	arm_func_end ov31_02383434
