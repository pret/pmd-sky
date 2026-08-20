	.include "asm/macros.inc"
	.include "main_02065BD8.inc"

	.text

	arm_func_start sub_02065BD8
sub_02065BD8: ; 0x02065BD8
	ldr ip, _02065BE8 ; =StrncpySimple
	mov r2, r1
	ldr r1, _02065BEC ; =_022B7310
	bx ip
	.align 2, 0
_02065BE8: .word StrncpySimple
_02065BEC: .word _022B7310
	arm_func_end sub_02065BD8

	arm_func_start sub_02065BF0
sub_02065BF0: ; 0x02065BF0
	ldr ip, _02065C00 ; =StrncpySimpleNoPadSafe
	ldr r1, _02065C04 ; =_022B7310
	mov r2, #0xa
	bx ip
	.align 2, 0
_02065C00: .word StrncpySimpleNoPadSafe
_02065C04: .word _022B7310
	arm_func_end sub_02065BF0

	arm_func_start sub_02065C08
sub_02065C08: ; 0x02065C08
	ldr ip, _02065C44 ; =_022B7310
	mov r3, #0
	b _02065C20
_02065C14:
	ldrb r2, [r0], #1
	add r3, r3, #1
	strb r2, [ip], #1
_02065C20:
	cmp r3, r1
	blt _02065C14
	mov r0, #0
	b _02065C38
_02065C30:
	strb r0, [ip], #1
	add r3, r3, #1
_02065C38:
	cmp r3, #0x10
	blt _02065C30
	bx lr
	.align 2, 0
_02065C44: .word _022B7310
	arm_func_end sub_02065C08
