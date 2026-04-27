	.include "asm/macros.inc"
	.include "main_0200BC60.inc"

	.text

	arm_func_start sub_0200BC60
sub_0200BC60: ; 0x0200BC60
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BC70:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BC70
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BCA4
	mov r1, #2
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
_0200BCA4:
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BC60

	arm_func_start sub_0200BCB0
sub_0200BCB0: ; 0x0200BCB0
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BCC0:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BCC0
	cmp r1, #1
	bne _0200BCE4
	mov r1, #1
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
_0200BCE4:
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BD08
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
_0200BD08:
	mov r1, #2
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BCB0

	arm_func_start sub_0200BD14
sub_0200BD14: ; 0x0200BD14
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0200BD14
