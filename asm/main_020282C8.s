	.include "asm/macros.inc"
	.include "main_020282C8.inc"

	.text

	arm_func_start sub_020282C8
sub_020282C8: ; 0x020282C8
	ldr r3, _020282F0 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r2, r0, r2, r3
	ldrb r0, [r2, #7]
	mov r0, r0, lsl #3
	str r0, [r1, #4]
	ldrb r0, [r2, #6]
	mov r0, r0, lsl #3
	str r0, [r1]
	bx lr
	.align 2, 0
_020282F0: .word WINDOW_LIST
	arm_func_end sub_020282C8

	arm_func_start sub_020282F4
sub_020282F4: ; 0x020282F4
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028308 ; =_022A8994
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02028308: .word _022A8994
	arm_func_end sub_020282F4

	arm_func_start sub_0202830C
sub_0202830C: ; 0x0202830C
	mov r2, #0xe0
	mul r2, r0, r2
	ldr r0, _02028320 ; =_022A8994
	str r1, [r0, r2]
	bx lr
	.align 2, 0
_02028320: .word _022A8994
	arm_func_end sub_0202830C

	arm_func_start sub_02028324
sub_02028324: ; 0x02028324
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028338 ; =_022A88E4
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02028338: .word _022A88E4
	arm_func_end sub_02028324
