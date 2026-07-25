	.include "asm/macros.inc"
	.include "include/os_interrupt.inc"

	.text

    arm_func_start OS_WaitIrq
OS_WaitIrq: ; 0x02078900
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	cmp r5, #0
	beq _02078930
	ldr r1, _0207896C ; =OS_IRQTable
	mvn r2, r4
	add r1, r1, #0x3000
	ldr r3, [r1, #0xff8]
	and r2, r3, r2
	str r2, [r1, #0xff8]
_02078930:
	bl SetIrqFlag
	ldr r1, _0207896C ; =OS_IRQTable
	add r0, r1, #0x3000
	ldr r0, [r0, #0xff8]
	tst r4, r0
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r1, #0x3f8
	ldr r5, _02078970 ; =DTCM_BSS
	add r6, r0, #0x3c00
_02078954:
	mov r0, r5
	bl OS_SleepThread
	ldr r0, [r6]
	tst r4, r0
	beq _02078954
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207896C: .word OS_IRQTable
_02078970: .word DTCM_BSS
	arm_func_end OS_WaitIrq

