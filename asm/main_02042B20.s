	.include "asm/macros.inc"
	.include "main_02042B20.inc"

	.text

	arm_func_start sub_02042B20
sub_02042B20: ; 0x02042B20
	ldr r1, _02042B4C ; =UNK_STORAGE_STRUCT_0XC
	mov r0, #0
	ldr r3, [r1, #8]
	mov r2, r0
_02042B30:
	ldr r1, [r3, r2, lsl #2]
	add r2, r2, #1
	tst r1, #1
	addne r0, r0, #1
	cmp r2, #0x32
	blt _02042B30
	bx lr
	.align 2, 0
_02042B4C: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end sub_02042B20

	arm_func_start sub_02042B50
sub_02042B50: ; 0x02042B50
	ldr r1, _02042B80 ; =UNK_STORAGE_STRUCT_0XC
	mov r0, #0
	ldr r2, [r1, #8]
	b _02042B70
_02042B60:
	ldr r1, [r2, r0, lsl #2]
	tst r1, #1
	bxne lr
	add r0, r0, #1
_02042B70:
	cmp r0, #0x32
	blt _02042B60
	mvn r0, #0
	bx lr
	.align 2, 0
_02042B80: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end sub_02042B50
