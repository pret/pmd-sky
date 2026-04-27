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

	arm_func_start sub_02009E70
sub_02009E70: ; 0x02009E70
	stmdb sp!, {r3, lr}
	mov r1, #0xa
	mul r3, r0, r1
	ldr r2, _02009F78 ; =_022A37B6
	mov r1, #0
	ldrb ip, [r2, r3]
	mov r2, #0x20
	cmp ip, #1
	orreq r1, r1, #1
	beq _02009EA0
	cmp ip, #2
	orreq r2, r2, #1
_02009EA0:
	ldr ip, _02009F7C ; =_022A37B7
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #2
	beq _02009EBC
	cmp ip, #2
	orreq r2, r2, #2
_02009EBC:
	ldr ip, _02009F80 ; =_022A37B8
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #4
	beq _02009ED8
	cmp ip, #2
	orreq r2, r2, #4
_02009ED8:
	ldr ip, _02009F84 ; =_022A37B9
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #8
	beq _02009EF4
	cmp ip, #2
	orreq r2, r2, #8
_02009EF4:
	ldr ip, _02009F88 ; =_022A37BA
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #0x10
	beq _02009F10
	cmp ip, #2
	orreq r2, r2, #0x10
_02009F10:
	cmp r0, #0
	bne _02009F48
	ldr r0, _02009F8C ; =_022A37BE
	ldr ip, _02009F90 ; =_022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F94 ; =0x04000050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl G2x_SetBlendAlpha_
	ldmia sp!, {r3, pc}
_02009F48:
	ldr r0, _02009F8C ; =_022A37BE
	ldr ip, _02009F90 ; =_022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F98 ; =0x04001050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl G2x_SetBlendAlpha_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009F78: .word _022A37B6
_02009F7C: .word _022A37B7
_02009F80: .word _022A37B8
_02009F84: .word _022A37B9
_02009F88: .word _022A37BA
_02009F8C: .word _022A37BE
_02009F90: .word _022A37BC
_02009F94: .word 0x04000050
_02009F98: .word 0x04001050
	arm_func_end sub_02009E70
