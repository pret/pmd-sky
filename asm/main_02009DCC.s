	.include "asm/macros.inc"
	.include "main_02009DCC.inc"

	.text

	arm_func_start sub_02009DCC
sub_02009DCC: ; 0x02009DCC
	ldr r1, _02009E58 ; =_022A37AC
	add r3, r0, r0, lsl #2
	ldrb r2, [r1, r3]
	mov r1, #0x1f
	cmp r2, #0
	ldr r2, _02009E5C ; =_022A37AD
	bicne r1, r1, #1
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E60 ; =_022A37AE
	bicne r1, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E64 ; =_022A37AF
	bicne r1, r1, #4
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E68 ; =_022A37B0
	bicne r1, r1, #8
	ldrb r2, [r2, r3]
	cmp r2, #0
	bicne r1, r1, #0x10
	cmp r0, #0
	ldrne r2, _02009E6C ; =0x04001000
	ldrne r0, [r2]
	bicne r0, r0, #0x1f00
	orrne r0, r0, r1, lsl #8
	strne r0, [r2]
	bxne lr
	mov r2, #0x4000000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, r1, lsl #8
	str r0, [r2]
	bx lr
	.align 2, 0
_02009E58: .word _022A37AC
_02009E5C: .word _022A37AD
_02009E60: .word _022A37AE
_02009E64: .word _022A37AF
_02009E68: .word _022A37B0
_02009E6C: .word 0x04001000
	arm_func_end sub_02009DCC
