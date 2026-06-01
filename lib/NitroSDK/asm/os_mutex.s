	.include "asm/macros.inc"
	.include "include/os_thread.inc"

	.text
    
    arm_func_start OS_InitMutex
OS_InitMutex: ; 0x0207A030
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end OS_InitMutex

	arm_func_start OS_LockMutex
OS_LockMutex: ; 0x0207A048
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A0C8 ; =_022B966C
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_0207A064:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0207A090
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl OSi_EnqueueTail
	b _0207A0BC
_0207A090:
	cmp r0, r7
	bne _0207A0A8
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0207A0BC
_0207A0A8:
	mov r0, r5
	str r5, [r7, #0x84]
	bl OS_SleepThread
	str r6, [r7, #0x84]
	b _0207A064
_0207A0BC:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A0C8: .word _022B966C
	arm_func_end OS_LockMutex

	arm_func_start OS_UnlockMutex
OS_UnlockMutex: ; 0x0207A0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A124 ; =_022B966C
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _0207A118
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _0207A118
	mov r1, r5
	bl OSi_DequeueItem
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl OS_WakeupThread
_0207A118:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A124: .word _022B966C
	arm_func_end OS_UnlockMutex

	arm_func_start OSi_UnlockAllMutex
OSi_UnlockAllMutex: ; 0x0207A128
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x88]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
_0207A140:
	add r0, r5, #0x88
	bl OSi_RemoveMutexLinkFromQueue
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl OS_WakeupThread
	ldr r0, [r5, #0x88]
	cmp r0, #0
	bne _0207A140
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OSi_UnlockAllMutex

	arm_func_start OS_TryLockMutex
OS_TryLockMutex: ; 0x0207A164
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r2, [r5, #8]
	ldr r1, _0207A1D4 ; =_022B966C
	mov r4, r0
	cmp r2, #0
	ldr r0, [r1, #4]
	bne _0207A1A8
	str r0, [r5, #8]
	ldr r2, [r5, #0xc]
	mov r1, r5
	add r2, r2, #1
	str r2, [r5, #0xc]
	bl OSi_EnqueueTail
	mov r6, #1
	b _0207A1C4
_0207A1A8:
	cmp r2, r0
	movne r6, #0
	bne _0207A1C4
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
_0207A1C4:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207A1D4: .word _022B966C
	arm_func_end OS_TryLockMutex

	arm_func_start OSi_EnqueueTail
OSi_EnqueueTail: ; 0x0207A1D8
	ldr r2, [r0, #0x8c]
	cmp r2, #0
	streq r1, [r0, #0x88]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x8c]
	bx lr
	arm_func_end OSi_EnqueueTail

	arm_func_start OSi_DequeueItem
OSi_DequeueItem: ; 0x0207A1FC
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x8c]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x88]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end OSi_DequeueItem

