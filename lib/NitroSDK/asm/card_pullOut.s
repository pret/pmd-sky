	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start CARD_InitPulledOutCallback
CARD_InitPulledOutCallback: ; 0x02084558
	stmdb sp!, {r3, lr}
	bl PXI_Init
	ldr r1, _0208457C ; =CARDi_PulledOutCallback
	mov r0, #0xe
	bl PXI_SetFifoRecvCallback
	ldr r0, _02084580 ; =_022BC040
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0208457C: .word CARDi_PulledOutCallback
_02084580: .word _022BC040
	arm_func_end CARD_InitPulledOutCallback

	arm_func_start CARDi_PulledOutCallback
CARDi_PulledOutCallback: ; 0x02084584
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #0x11
	bne _020845CC
	ldr r1, _020845D4 ; =_022BC040
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	str r0, [r1]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _020845BC
	blx r1
_020845BC:
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl Card_TerminateForPulledOut
	ldmia sp!, {r3, pc}
_020845CC:
	bl WaitForever2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020845D4: .word _022BC040
	arm_func_end CARDi_PulledOutCallback

	arm_func_start Card_SetPulledOutCallback
Card_SetPulledOutCallback: ; 0x020845D8
	ldr r1, _020845E4 ; =_022BC040
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020845E4: .word _022BC040
	arm_func_end Card_SetPulledOutCallback

	arm_func_start Card_IsPulledOut
Card_IsPulledOut: ; 0x020845E8
	ldr r0, _020845F4 ; =_022BC040
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020845F4: .word _022BC040
	arm_func_end Card_IsPulledOut

	arm_func_start Card_TerminateForPulledOut
Card_TerminateForPulledOut: ; 0x020845F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	mov r5, #1
	bl MI_StopDma
	mov r0, r5
	bl MI_StopDma
	mov r0, #2
	bl MI_StopDma
	mov r0, #3
	bl MI_StopDma
	ldr r0, _0208467C ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	beq _02084660
	bl PM_ForceToPowerOff
	cmp r0, #4
	bne _02084658
	ldr r4, _02084680 ; =0x000A3A47
_02084644:
	mov r0, r4
	bl OS_SpinWait
	bl PM_ForceToPowerOff
	cmp r0, #4
	beq _02084644
_02084658:
	cmp r0, #0
	moveq r5, #0
_02084660:
	cmp r5, #0
	beq _02084674
	mov r0, #1
	mov r1, r0
	bl Cardi_SendtoPxi
_02084674:
	bl WaitForever2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0208467C: .word 0x027FFFA8
_02084680: .word 0x000A3A47
	arm_func_end Card_TerminateForPulledOut

	arm_func_start Cardi_CheckPulledOutCore
Cardi_CheckPulledOutCore: ; 0x02084684
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r2, _020846E0 ; =0x027FFC10
	ldrh r1, [r2]
	cmp r1, #0
	subeq r1, r2, #0x410
	subne r1, r2, #0x10
	ldr r1, [r1]
	str r1, [sp]
	ldr r1, [sp]
	cmp r0, r1
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	bl EnableIrqFlag
	mov r4, r0
	mov r0, #0xe
	mov r1, #0x11
	mov r2, #0
	bl CARDi_PulledOutCallback
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020846E0: .word 0x027FFC10
	arm_func_end Cardi_CheckPulledOutCore

	arm_func_start Cardi_SendtoPxi
Cardi_SendtoPxi: ; 0x020846E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r1, r7
	mov r0, #0xe
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, #0xe
	mov r4, #0
_02084710:
	mov r0, r6
	blx SVC_WaitByLoop
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _02084710
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end Cardi_SendtoPxi

