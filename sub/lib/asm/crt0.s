	.include "asm/macros.inc"

	.public sub_037F8000

	.text

	arm_func_start _start
_start: ; 0x037F7E18
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _037F7EFC ; =0x023801E8
	mov r0, #0x3800000
	cmp r0, r1
	bpl _037F7E34
	b _037F7E38
_037F7E34:
	mov r1, r0
_037F7E38:
	ldr r2, _037F7F00 ; =0x0380FF00
	mov r0, #0
_037F7E40:
	cmp r1, r2
	blt _037F7E4C
	b _037F7E50
_037F7E4C:
	stmia r1!, {r0}
_037F7E50:
	blt _037F7E40
	mov r0, #0x13
	msr cpsr_c, r0
	ldr sp, _037F7F04 ; =0x0380FFC0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _037F7F08 ; =0x0380FF80
	mov sp, r0
	ldr r1, _037F7F0C ; =0x00000400
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	ldr r0, _037F7F10 ; =0x023FE940
	ldr r1, _037F7F14 ; =0x027FFA80
	add r2, r1, #0x160
_037F7E90:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _037F7E90
	ldr r0, _037F7F18 ; =0x023FE904
	add r2, r1, #0x20
_037F7EA8:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _037F7EA8
	bl do_autoload
	ldr r0, _037F7F1C ; =0x023801D0
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r0, #0
_037F7ECC:
	cmp r1, r2
	blo _037F7ED8
	b _037F7EDC
_037F7ED8:
	str r0, [r1], #4
_037F7EDC:
	blo _037F7ECC
	bl sub_037F7FA4
	ldr r1, _037F7F20 ; =0x0380FFFC
	ldr r0, _037F7F24 ; =0x037FB488
	str r0, [r1]
	ldr r1, _037F7F28 ; =sub_037F8000
	ldr lr, _037F7F2C ; =0xFFFF0000
	bx r1
	.align 2, 0
_037F7EFC: .word 0x023801E8
_037F7F00: .word 0x0380FF00
_037F7F04: .word 0x0380FFC0
_037F7F08: .word 0x0380FF80
_037F7F0C: .word 0x00000400
_037F7F10: .word 0x023FE940
_037F7F14: .word 0x027FFA80
_037F7F18: .word 0x023FE904
_037F7F1C: .word 0x023801D0
_037F7F20: .word 0x0380FFFC
_037F7F24: .word 0x037FB488
_037F7F28: .word sub_037F8000
_037F7F2C: .word 0xFFFF0000
	arm_func_end _start

	arm_func_start do_autoload
do_autoload: ; 0x037F7F30
	ldr r0, _037F7F9C ; =0x023801D0
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_037F7F40:
	cmp r1, r2
	beq _037F7F98
	ldr r4, [r1], #4
	ldr r5, [r1], #4
	add r6, r4, r5
_037F7F54:
	cmp r4, r6
	bmi _037F7F60
	b _037F7F64
_037F7F60:
	ldr r7, [r3], #4
_037F7F64:
	bmi _037F7F6C
	b _037F7F70
_037F7F6C:
	str r7, [r4], #4
_037F7F70:
	bmi _037F7F54
	ldr r5, [r1], #4
	add r6, r4, r5
	mov r7, #0
_037F7F80:
	cmp r4, r6
	blo _037F7F8C
	b _037F7F90
_037F7F8C:
	str r7, [r4], #4
_037F7F90:
	blo _037F7F80
	beq _037F7F40
_037F7F98:
	b _start_AutoloadDoneCallback
	.align 2, 0
_037F7F9C: .word 0x023801D0
	arm_func_end do_autoload

	arm_func_start _start_AutoloadDoneCallback
_start_AutoloadDoneCallback:
	bx lr
	arm_func_end _start_AutoloadDoneCallback

	arm_func_start sub_037F7FA4
sub_037F7FA4: ; 0x037F7FA4
	mov r0, #1
	mov r1, #0
	ldr r2, _037F7FE4 ; =0x027FFFFA
	sub r3, r2, #0x400000
_037F7FB4:
	strh r1, [r2]
	ldrh ip, [r3]
	cmp r1, ip
	bne _037F7FC8
	b _037F7FCC
_037F7FC8:
	mov r0, #2
_037F7FCC:
	bne _037F7FDC
	add r1, r1, #1
	cmp r1, #2
	bne _037F7FB4
_037F7FDC:
	strh r0, [r2]
	bx lr
	.align 2, 0
_037F7FE4: .word 0x027FFFFA
	arm_func_end sub_037F7FA4
_037F7FE8:
	.byte 0x68, 0x70, 0x3A, 0x02, 0x80, 0x70, 0x3A, 0x02, 0xE8, 0x01, 0x38, 0x02, 0xE8, 0x01, 0x38, 0x02
	.byte 0xE8, 0x01, 0x38, 0x02