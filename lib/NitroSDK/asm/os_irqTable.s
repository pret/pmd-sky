	.include "asm/macros.inc"
	.include "include/os_interrupt.inc"

	.text

    arm_func_start OS_IrqDummy
OS_IrqDummy: ; 0x02078974
	bx lr
	arm_func_end OS_IrqDummy

	arm_func_start OSi_IrqCallback
OSi_IrqCallback: ; 0x02078978
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _020789EC ; =_022B95E4
	ldr r3, _020789F0 ; =_020B2B9C
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _020789BC
	ldr r0, _020789F4 ; =_022B95EC
	ldr r0, [r0, r5]
	blx r1
_020789BC:
	ldr r0, _020789F8 ; =OS_IRQTable
	ldr r1, _020789FC ; =_022B95E8
	add r0, r0, #0x3000
	ldr r2, [r0, #0xff8]
	ldr r1, [r1, r5]
	orr r2, r2, r4
	str r2, [r0, #0xff8]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl OS_DisableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020789EC: .word _022B95E4
_020789F0: .word _020B2B9C
_020789F4: .word _022B95EC
_020789F8: .word OS_IRQTable
_020789FC: .word _022B95E8
	arm_func_end OSi_IrqCallback

	arm_func_start OSi_IrqDma0
OSi_IrqDma0: ; 0x02078A00
	ldr ip, _02078A0C ; =OSi_IrqCallback
	mov r0, #0
	bx ip
	.align 2, 0
_02078A0C: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma0

	arm_func_start OSi_IrqDma1
OSi_IrqDma1: ; 0x02078A10
	ldr ip, _02078A1C ; =OSi_IrqCallback
	mov r0, #1
	bx ip
	.align 2, 0
_02078A1C: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma1

	arm_func_start OSi_IrqDma2
OSi_IrqDma2: ; 0x02078A20
	ldr ip, _02078A2C ; =OSi_IrqCallback
	mov r0, #2
	bx ip
	.align 2, 0
_02078A2C: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma2

	arm_func_start OSi_IrqDma3
OSi_IrqDma3: ; 0x02078A30
	ldr ip, _02078A3C ; =OSi_IrqCallback
	mov r0, #3
	bx ip
	.align 2, 0
_02078A3C: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma3

	arm_func_start OSi_IrqTimer0
OSi_IrqTimer0: ; 0x02078A40
	ldr ip, _02078A4C ; =OSi_IrqCallback
	mov r0, #4
	bx ip
	.align 2, 0
_02078A4C: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer0

	arm_func_start OSi_IrqTimer1
OSi_IrqTimer1: ; 0x02078A50
	ldr ip, _02078A5C ; =OSi_IrqCallback
	mov r0, #5
	bx ip
	.align 2, 0
_02078A5C: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer1

	arm_func_start OSi_IrqTimer2
OSi_IrqTimer2: ; 0x02078A60
	ldr ip, _02078A6C ; =OSi_IrqCallback
	mov r0, #6
	bx ip
	.align 2, 0
_02078A6C: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer2

	arm_func_start OSi_IrqTimer3
OSi_IrqTimer3: ; 0x02078A70
	ldr ip, _02078A7C ; =OSi_IrqCallback
	mov r0, #7
	bx ip
	.align 2, 0
_02078A7C: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer3

