	.include "asm/macros.inc"

	.public sub_020001E8

	.text

	arm_func_start _start
_start: ; 0x02000000
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _020000E4 ; =0x023801E8
	mov r0, #0x3800000
	cmp r0, r1
	bpl _0200001C
	b _02000020
_0200001C:
	mov r1, r0
_02000020:
	ldr r2, _020000E8 ; =0x0380FF00
	mov r0, #0
_02000028:
	cmp r1, r2
	blt _02000034
	b _02000038
_02000034:
	stmia r1!, {r0}
_02000038:
	blt _02000028
	mov r0, #0x13
	msr cpsr_c, r0
	ldr sp, _020000EC ; =0x0380FFC0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _020000F0 ; =0x0380FF80
	mov sp, r0
	ldr r1, _020000F4 ; =0x00000400
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	ldr r0, _020000F8 ; =0x023FE940
	ldr r1, _020000FC ; =0x027FFA80
	add r2, r1, #0x160
_02000078:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02000078
	ldr r0, _02000100 ; =0x023FE904
	add r2, r1, #0x20
_02000090:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02000090
	bl do_autoload
	ldr r0, _02000104 ; =0x023801D0
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r0, #0
_020000B4:
	cmp r1, r2
	blo _020000C0
	b _020000C4
_020000C0:
	str r0, [r1], #4
_020000C4:
	blo _020000B4
	bl sub_0200018C
	ldr r1, _02000108 ; =0x0380FFFC
	ldr r0, _0200010C ; =0x037FB488
	str r0, [r1]
	ldr r1, _02000110 ; =sub_037F8000
	ldr lr, _02000114 ; =0xFFFF0000
	bx r1
	.align 2, 0
_020000E4: .word 0x023801E8
_020000E8: .word 0x0380FF00
_020000EC: .word 0x0380FFC0
_020000F0: .word 0x0380FF80
_020000F4: .word 0x00000400
_020000F8: .word 0x023FE940
_020000FC: .word 0x027FFA80
_02000100: .word 0x023FE904
_02000104: .word 0x023801D0
_02000108: .word 0x0380FFFC
_0200010C: .word 0x037FB488
_02000110: .word sub_020001E8
_02000114: .word 0xFFFF0000
	arm_func_end _start

	arm_func_start do_autoload
do_autoload: ; 0x02000118
	ldr r0, _02000184 ; =0x023801D0
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02000128:
	cmp r1, r2
	beq _02000180
	ldr r4, [r1], #4
	ldr r5, [r1], #4
	add r6, r4, r5
_0200013C:
	cmp r4, r6
	bmi _02000148
	b _0200014C
_02000148:
	ldr r7, [r3], #4
_0200014C:
	bmi _02000154
	b _02000158
_02000154:
	str r7, [r4], #4
_02000158:
	bmi _0200013C
	ldr r5, [r1], #4
	add r6, r4, r5
	mov r7, #0
_02000168:
	cmp r4, r6
	blo _02000174
	b _02000178
_02000174:
	str r7, [r4], #4
_02000178:
	blo _02000168
	beq _02000128
_02000180:
	b _start_AutoloadDoneCallback
	.align 2, 0
_02000184: .word 0x023801D0
	arm_func_end do_autoload

	arm_func_start _start_AutoloadDoneCallback
_start_AutoloadDoneCallback:
	bx lr
	arm_func_end _start_AutoloadDoneCallback

	arm_func_start sub_0200018C
sub_0200018C: ; 0x0200018C
	mov r0, #1
	mov r1, #0
	ldr r2, _020001CC ; =0x027FFFFA
	sub r3, r2, #0x400000
_0200019C:
	strh r1, [r2]
	ldrh ip, [r3]
	cmp r1, ip
	bne _020001B0
	b _020001B4
_020001B0:
	mov r0, #2
_020001B4:
	bne _020001C4
	add r1, r1, #1
	cmp r1, #2
	bne _0200019C
_020001C4:
	strh r0, [r2]
	bx lr
	.align 2, 0
_020001CC: .word 0x027FFFFA
	arm_func_end sub_0200018C
_020001D0:
	.byte 0x68, 0x70, 0x3A, 0x02, 0x80, 0x70, 0x3A, 0x02, 0xE8, 0x01, 0x38, 0x02, 0xE8, 0x01, 0x38, 0x02
	.byte 0xE8, 0x01, 0x38, 0x02, 0x00, 0x00, 0x00, 0x00