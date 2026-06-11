	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start CARDi_OnFifoRecv
CARDi_OnFifoRecv: ; 0x02084380
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	ldmneia sp!, {r3, pc}
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _020843B0 ; =_022BB7E0
	ldr r1, [r2, #0x114]
	ldr r0, [r2, #0x104]
	bic r1, r1, #0x20
	str r1, [r2, #0x114]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, pc}
	.align 2, 0
_020843B0: .word _022BB7E0
	arm_func_end CARDi_OnFifoRecv

	arm_func_start CARDi_TaskThread
CARDi_TaskThread: ; 0x020843B4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _02084400 ; =_022BB7E0
	mov r4, #0
_020843C0:
	bl EnableIrqFlag
	ldr r1, [r5, #0x114]
	mov r6, r0
	tst r1, #8
	bne _020843E8
_020843D4:
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r5, #0x114]
	tst r0, #8
	beq _020843D4
_020843E8:
	mov r0, r6
	bl SetIrqFlag
	ldr r1, [r5, #0x40]
	mov r0, r5
	blx r1
	b _020843C0
	.align 2, 0
_02084400: .word _022BB7E0
	arm_func_end CARDi_TaskThread

	arm_func_start Cardi_Request
Cardi_Request: ; 0x02084404
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #0x114]
	mov sb, r1
	str r2, [sp]
	tst r0, #2
	bne _02084478
	ldr r1, [sl, #0x114]
	mov r0, #0xb
	orr r2, r1, #2
	mov r1, #1
	str r2, [sl, #0x114]
	bl PXI_IsCallbackReady
	cmp r0, #0
	bne _02084468
	mov r6, #0x64
	mov r5, #0xb
	mov r4, #1
_0208444C:
	mov r0, r6
	bl OS_SpinWait
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _0208444C
_02084468:
	mov r0, sl
	mov r1, #0
	mov r2, #1
	bl Cardi_Request
_02084478:
	ldr r0, [sl]
	mov r1, #0x60
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	mov r7, #0xb
	mov r6, #1
	mov r5, r7
	mov r4, r6
	mov fp, #0
_0208449C:
	str sb, [sl, #4]
	ldr r0, [sl, #0x114]
	orr r0, r0, #0x20
	str r0, [sl, #0x114]
_020844AC:
	mov r0, r7
	mov r1, sb
	mov r2, r6
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _020844AC
	cmp sb, #0
	bne _020844E8
	ldr r8, [sl]
_020844D0:
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _020844D0
_020844E8:
	bl EnableIrqFlag
	ldr r1, [sl, #0x114]
	mov r8, r0
	tst r1, #0x20
	beq _02084510
_020844FC:
	mov r0, fp
	bl OS_SleepThread
	ldr r0, [sl, #0x114]
	tst r0, #0x20
	bne _020844FC
_02084510:
	mov r0, r8
	bl SetIrqFlag
	ldr r0, [sl]
	mov r1, #0x60
	bl DC_InvalidateRange
	ldr r0, [sl]
	ldr r1, [r0]
	cmp r1, #4
	bne _02084548
	ldr r0, [sp]
	sub r0, r0, #1
	str r0, [sp]
	cmp r0, #0
	bgt _0208449C
_02084548:
	cmp r1, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Cardi_Request

