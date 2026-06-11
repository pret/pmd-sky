	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Cardi_SetTask
Cardi_SetTask: ; 0x020830FC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02083134 ; =_022BB7E0
	mov r5, r0
	ldr r1, [r4, #0x108]
	add r0, r4, #0x44
	bl OS_SetThreadPriority
	ldr r1, [r4, #0x114]
	add r0, r4, #0x44
	orr r1, r1, #8
	str r0, [r4, #0x104]
	str r5, [r4, #0x40]
	str r1, [r4, #0x114]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02083134: .word _022BB7E0
	arm_func_end Cardi_SetTask

	arm_func_start Cardi_LockResource
Cardi_LockResource: ; 0x02083138
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020831B8 ; =_022BB7E0
	mov r8, r0
	mov r7, r1
	bl EnableIrqFlag
	ldr r1, [r4, #8]
	mov r5, r0
	cmp r1, r8
	bne _02083170
	ldr r0, [r4, #0x18]
	cmp r0, r7
	beq _02083194
	bl WaitForever2
	b _02083194
_02083170:
	mvn r6, #2
	b _02083180
_02083178:
	add r0, r4, #0x10
	bl OS_SleepThread
_02083180:
	ldr r0, [r4, #8]
	cmp r0, r6
	bne _02083178
	str r8, [r4, #8]
	str r7, [r4, #0x18]
_02083194:
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	add r2, r0, #1
	mov r0, r5
	str r2, [r4, #0xc]
	mov r2, #0
	str r2, [r1]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020831B8: .word _022BB7E0
	arm_func_end Cardi_LockResource

	arm_func_start Cardi_UnlockResource
Cardi_UnlockResource: ; 0x020831BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02083244 ; =_022BB7E0
	mov r7, r0
	mov r6, r1
	bl EnableIrqFlag
	ldr r1, [r4, #8]
	mov r5, r0
	cmp r1, r7
	bne _020831EC
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _020831F4
_020831EC:
	bl WaitForever2
	b _0208322C
_020831F4:
	ldr r0, [r4, #0x18]
	cmp r0, r6
	beq _02083204
	bl WaitForever2
_02083204:
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
	bne _0208322C
	mvn r2, #2
	mov r1, #0
	add r0, r4, #0x10
	str r2, [r4, #8]
	str r1, [r4, #0x18]
	bl OS_WakeupThread
_0208322C:
	ldr r1, [r4]
	mov r2, #0
	mov r0, r5
	str r2, [r1]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02083244: .word _022BB7E0
	arm_func_end Cardi_UnlockResource

	arm_func_start CARDi_InitCommon
CARDi_InitCommon: ; 0x02083248
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _0208333C ; =_022BB7E0
	ldr r1, _02083340 ; =_022BB780
	mvn r2, #2
	mov r0, #0
	str r2, [r4, #8]
	mov r2, #0x60
	str r0, [r4, #0xc]
	str r0, [r4, #0x18]
	str r1, [r4]
	bl MTi_CpuClearFast
	ldr r0, _02083340 ; =_022BB780
	mov r1, #0x60
	bl DC_FlushRange
	mvn r1, #0
	ldr r0, _02083344 ; =0x027FFC40
	str r1, [r4, #0x118]
	str r1, [r4, #0x11c]
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _020832BC
	ldr r0, _02083348 ; =0x027FFE00
	mov r2, #0x160
	sub r1, r0, #0x380
	bl MI_CpuCopy8
_020832BC:
	mov r2, #0
	mov r0, #4
	str r0, [r4, #0x108]
	str r2, [r4, #0x14]
	str r2, [r4, #0x10]
	str r2, [r4, #0x110]
	str r2, [r4, #0x10c]
	mov r0, #0x400
	str r0, [sp]
	ldr ip, [r4, #0x108]
	ldr r1, _0208334C ; =CARDi_TaskThread
	ldr r3, _02083350 ; =_022BBE00
	add r0, r4, #0x44
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
	ldr r1, _02083354 ; =CARDi_OnFifoRecv
	mov r0, #0xb
	bl PXI_SetFifoRecvCallback
	ldr r0, _02083344 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r4, pc}
	mov r0, #1
	bl CARD_Enable
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0208333C: .word _022BB7E0
_02083340: .word _022BB780
_02083344: .word 0x027FFC40
_02083348: .word 0x027FFE00
_0208334C: .word CARDi_TaskThread
_02083350: .word _022BBE00
_02083354: .word CARDi_OnFifoRecv
	arm_func_end CARDi_InitCommon

	arm_func_start Card_IsEnabled
Card_IsEnabled: ; 0x02083358
	ldr r0, _02083364 ; =_022BB760
	ldr r0, [r0]
	bx lr
	.align 2, 0
_02083364: .word _022BB760
	arm_func_end Card_IsEnabled

	arm_func_start Card_CheckEnabled
Card_CheckEnabled: ; 0x02083368
	stmdb sp!, {r3, lr}
	bl Card_IsEnabled
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl WaitForever2
	ldmia sp!, {r3, pc}
	arm_func_end Card_CheckEnabled

	arm_func_start CARD_Enable
CARD_Enable: ; 0x02083380
	ldr r1, _0208338C ; =_022BB760
	str r0, [r1]
	bx lr
	.align 2, 0
_0208338C: .word _022BB760
	arm_func_end CARD_Enable

	arm_func_start Cardi_WaitAsync
Cardi_WaitAsync: ; 0x02083390
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020833D8 ; =_022BB7E0
	bl EnableIrqFlag
	mov r5, r0
	b _020833AC
_020833A4:
	add r0, r4, #0x10c
	bl OS_SleepThread
_020833AC:
	ldr r0, [r4, #0x114]
	tst r0, #4
	bne _020833A4
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020833D8: .word _022BB7E0
	arm_func_end Cardi_WaitAsync

	arm_func_start Cardi_TryWaitAsync
Cardi_TryWaitAsync: ; 0x020833DC
	ldr r0, _020833F4 ; =_022BB7E0
	ldr r0, [r0, #0x114]
	tst r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020833F4: .word _022BB7E0
	arm_func_end Cardi_TryWaitAsync

	arm_func_start Card_SetThreadPriority
Card_SetThreadPriority: ; 0x020833F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _02083430 ; =_022BB7E0
	mov r7, r0
	bl EnableIrqFlag
	ldr r6, [r5, #0x108]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x44
	str r7, [r5, #0x108]
	bl OS_SetThreadPriority
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02083430: .word _022BB7E0
	arm_func_end Card_SetThreadPriority

	arm_func_start Card_LockRom
Card_LockRom: ; 0x02083434
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #1
	bl Cardi_LockResource
	mov r0, r4
	bl OS_LockCard
	ldmia sp!, {r4, pc}
	arm_func_end Card_LockRom

	arm_func_start Card_UnlockRom
Card_UnlockRom: ; 0x02083450
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_UnlockCard
	mov r0, r4
	mov r1, #1
	bl Cardi_UnlockResource
	ldmia sp!, {r4, pc}
	arm_func_end Card_UnlockRom

	arm_func_start Card_LockBackup
Card_LockBackup: ; 0x0208346C
	ldr ip, _02083478 ; =Cardi_LockResource
	mov r1, #2
	bx ip
	.align 2, 0
_02083478: .word Cardi_LockResource
	arm_func_end Card_LockBackup

	arm_func_start Card_UnlockBackup
Card_UnlockBackup: ; 0x0208347C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Card_TryWaitBackupAsync
	cmp r0, #0
	bne _02083494
	bl Card_WaitBackupAsync
_02083494:
	mov r0, r4
	mov r1, #2
	bl Cardi_UnlockResource
	ldmia sp!, {r4, pc}
	arm_func_end Card_UnlockBackup

