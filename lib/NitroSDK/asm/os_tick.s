	.include "asm/macros.inc"
	.include "include/os_timer.inc"

	.text

    arm_func_start sub_0207AD54
sub_0207AD54: ; 0x0207AD54
	stmdb sp!, {r3, lr}
	ldr r1, _0207ADC0 ; =OSi_UseTick
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl OSi_SetTimerReserved
	ldr r0, _0207ADC0 ; =OSi_UseTick
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _0207ADC4 ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _0207ADC8 ; =sub_0207ADDC
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl OS_SetIrqFunction
	mov r0, #8
	bl OS_EnableIrqMask
	ldr r0, _0207ADC0 ; =OSi_UseTick
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207ADC0: .word OSi_UseTick
_0207ADC4: .word 0x04000102
_0207ADC8: .word sub_0207ADDC
	arm_func_end sub_0207AD54

	arm_func_start sub_0207ADCC
sub_0207ADCC: ; 0x0207ADCC
	ldr r0, _0207ADD8 ; =OSi_UseTick
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207ADD8: .word OSi_UseTick
	arm_func_end sub_0207ADCC

	arm_func_start sub_0207ADDC
sub_0207ADDC: ; 0x0207ADDC
	ldr r0, _0207AE34 ; =OSi_UseTick
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0207AE20
	ldr r2, _0207AE38 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_0207AE20:
	ldr ip, _0207AE3C ; =sub_02078BF4
	mov r0, #0
	ldr r1, _0207AE40 ; =sub_0207ADDC
	mov r2, r0
	bx ip
	.align 2, 0
_0207AE34: .word OSi_UseTick
_0207AE38: .word 0x04000102
_0207AE3C: .word sub_02078BF4
_0207AE40: .word sub_0207ADDC
	arm_func_end sub_0207ADDC

	arm_func_start sub_0207AE44
sub_0207AE44: ; 0x0207AE44
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl EnableIrqFlag
	ldr lr, _0207AED8 ; =0x04000100
	ldr r2, _0207AEDC ; =0x0000FFFF
	ldrh ip, [lr]
	ldr r3, _0207AEE0 ; =OSi_UseTick
	sub r1, r2, #0x10000
	strh ip, [sp]
	ldr ip, [r3, #8]
	ldr r3, [r3, #0xc]
	and ip, ip, r1
	and r1, r3, r2
	str ip, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [lr, #0x114]
	tst r1, #8
	beq _0207AEB0
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _0207AEB0
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_0207AEB0:
	bl SetIrqFlag
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	mov r1, r1, lsl #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0207AED8: .word 0x04000100
_0207AEDC: .word 0x0000FFFF
_0207AEE0: .word OSi_UseTick
	arm_func_end sub_0207AE44

	arm_func_start GetTimer0Control
GetTimer0Control: ; 0x0207AEE4
	ldr r0, _0207AEF0 ; =0x04000100
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207AEF0: .word 0x04000100
	arm_func_end GetTimer0Control

	arm_func_start sub_0207AEF4
sub_0207AEF4: ; 0x0207AEF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	mov r3, r5, lsr #0x10
	mov ip, #1
	rsb r1, ip, #0x10000
	ldr lr, _0207AF58 ; =0x04000214
	mov r6, #8
	ldr r2, _0207AF5C ; =OSi_UseTick
	str r6, [lr]
	str ip, [r2, #4]
	orr r3, r3, r4, lsl #16
	str r3, [r2, #8]
	mov r4, r4, lsr #0x10
	ldr r3, _0207AF60 ; =0x04000102
	str r4, [r2, #0xc]
	mov r2, #0
	strh r2, [r3]
	and r1, r5, r1
	strh r1, [r3, #-2]
	mov r1, #0xc1
	strh r1, [r3]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AF58: .word 0x04000214
_0207AF5C: .word OSi_UseTick
_0207AF60: .word 0x04000102
	arm_func_end sub_0207AEF4

