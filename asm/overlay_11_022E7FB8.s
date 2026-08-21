	.include "asm/macros.inc"
	.include "overlay_11_022E7FB8.inc"

	.text

	arm_func_start GetCoroutineInfo
GetCoroutineInfo: ; 0x022E7FB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl ov11_022DC89C
	ldr r0, _022E8020 ; =UNIONALL_RAM_ADDRESS
	add r1, r5, r5, lsl #1
	ldr r2, [r0]
	add r3, r2, r1, lsl #1
	ldrh r1, [r3, #4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	str r2, [r4]
	ldrh r2, [r3, #4]
	ldr r3, [r0]
	mov r1, #0
	add r2, r3, r2, lsl #1
	str r2, [r4, #4]
	ldr r2, [r0, #4]
	sub r0, r1, #1
	str r2, [r4, #8]
	strh r1, [r4, #0x14]
	strb r1, [r4, #0x16]
	strh r0, [r4, #0x18]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8020: .word UNIONALL_RAM_ADDRESS
	arm_func_end GetCoroutineInfo
