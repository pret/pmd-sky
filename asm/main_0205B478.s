	.include "asm/macros.inc"
	.include "main_0205B478.inc"

	.text

	arm_func_start sub_0205B478
sub_0205B478: ; 0x0205B478
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl sub_0204A198
	ldrb r1, [sp, #3]
	ldr r0, _0205B54C ; =_020B0A54
	ldrb r2, [sp, #2]
	mov r1, r1, lsl #0x10
	ldrb r3, [sp, #4]
	orr r1, r1, r2, lsl #24
	ldrb r2, [sp, #5]
	orr r1, r1, r3, lsl #8
	ldr r0, [r0]
	orr ip, r2, r1
	ldr r3, _0205B550 ; =_022B57BC
	mov r1, #0
	mov r2, #0x1600
	str ip, [r3]
	bl MemsetSimple
	ldr r0, _0205B54C ; =_020B0A54
	mov r1, #0
	ldr r0, [r0, #8]
	mov r2, #0x4c
	bl MemsetSimple
	mov lr, #0
	ldr r2, _0205B54C ; =_020B0A54
	mov r0, lr
	mov r1, #0xb0
_0205B4E8:
	mul ip, lr, r1
	ldr r3, [r2]
	add lr, lr, #1
	strb r0, [r3, ip]
	ldr r3, [r2]
	cmp lr, #0x20
	add r3, r3, ip
	strh r0, [r3, #0xa2]
	blt _0205B4E8
	ldr r1, _0205B54C ; =_020B0A54
	mov ip, #0
	ldr r2, [r1, #4]
	mvn r3, #0
	str r0, [r2]
_0205B520:
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #3
	str ip, [r2, #4]
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #3
	add r0, r0, #1
	str r3, [r2, #8]
	cmp r0, #0x20
	blt _0205B520
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205B54C: .word _020B0A54
_0205B550: .word _022B57BC
	arm_func_end sub_0205B478
