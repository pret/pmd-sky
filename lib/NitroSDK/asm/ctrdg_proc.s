	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start CTRDG_Init
CTRDG_Init: ; 0x02084A4C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02084AEC ; =_022BC060
	ldr r1, [r0, #8]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	str r1, [r0, #8]
	bl CTRDGi_InitCommon
	ldr r0, _02084AEC ; =_022BC060
	mov r1, #0
	str r1, [r0, #0xc]
	bl PXI_Init
	mov r5, #0xd
	mov r4, #1
_02084A84:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _02084A84
	ldr r1, _02084AF0 ; =CTRDGi_CallbackForInitModuleInfo
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	bl CTRDGi_InitModuleInfo
	mov r0, #0xd
	mov r1, #0
	bl PXI_SetFifoRecvCallback
	ldr r1, _02084AF4 ; =CTRDGi_PulledOutCallback
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	ldr r1, _02084AEC ; =_022BC060
	mov r2, #0
	ldr r0, _02084AF8 ; =_022BC140
	str r2, [r1, #0x18]
	bl Ctrdgi_InitTaskThread
	ldr r1, _02084AFC ; =_02084D90
	mov r0, #0x11
	bl PXI_SetFifoRecvCallback
	mov r0, #0
	bl Ctrdg_Enable
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02084AEC: .word _022BC060
_02084AF0: .word CTRDGi_CallbackForInitModuleInfo
_02084AF4: .word CTRDGi_PulledOutCallback
_02084AF8: .word _022BC140
_02084AFC: .word Ctrdgi_CallbackForSetPhi
	arm_func_end CTRDG_Init

	arm_func_start CTRDGi_InitModuleInfo
CTRDGi_InitModuleInfo: ; 0x02084B00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r0, _02084CC8 ; =_022BC060
	ldr r1, [r0]
	cmp r1, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _02084CCC ; =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0]
	tst r1, #1
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0x40000
	bl OS_SetIrqMask
	ldr r3, _02084CD0 ; =0x04000208
	mov r2, #1
	ldrh r5, [r3]
	ldr r1, _02084CD4 ; =_022BC04C
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #2]
	add r1, sp, #8
	bl CTRDGi_LockByProcessor
	ldr r1, _02084CD8 ; =0x04000204
	add r0, sp, #0
	ldrh r1, [r1]
	and r1, r1, #0x8000
	mov r6, r1, asr #0xf
	bl CTRDGi_ChangeLatestAccessCycle
	ldr r3, _02084CD8 ; =0x04000204
	ldr r0, _02084CDC ; =_022BC080
	ldrh r2, [r3]
	add r0, r0, #0x80
	mov r1, #0x40
	bic r2, r2, #0x8000
	strh r2, [r3]
	bl DC_InvalidateRange
	ldr r2, _02084CDC ; =_022BC080
	ldr r1, _02084CE0 ; =0x08000080
	mov r0, #1
	mov r3, #0x40
	add r2, r2, #0x80
	bl MI_DmaCopy16
	ldr r2, _02084CD8 ; =0x04000204
	add r0, sp, #0
	ldrh r1, [r2]
	bic r1, r1, #0x8000
	orr r1, r1, r6, lsl #15
	strh r1, [r2]
	bl CTRDGi_RestoreAccessCycle
	ldr r0, _02084CD4 ; =_022BC04C
	add r1, sp, #8
	ldrh r0, [r0, #2]
	bl CTRDGi_UnlockByProcessor
	ldr r1, _02084CE4 ; =0x027FFF9B
	ldrb r0, [r1]
	cmp r0, #0
	bne _02084BFC
	ldrb r0, [r1, #-1]
	cmp r0, #0
	bne _02084C60
_02084BFC:
	ldr r3, _02084CDC ; =_022BC080
	ldr r6, _02084CE8 ; =0x027FFC30
	ldrh r0, [r3, #0xbe]
	mov r2, #0
	strh r0, [r6]
	b _02084C28
_02084C14:
	add r0, r3, r2
	ldrb r1, [r0, #0xb5]
	add r0, r6, r2
	add r2, r2, #1
	strb r1, [r0, #2]
_02084C28:
	cmp r2, #3
	blt _02084C14
	ldrh r0, [r3, #0xb0]
	strh r0, [r6, #6]
	ldr r0, [r3, #0xac]
	str r0, [r6, #8]
	bl Ctrdg_IsExisting
	cmp r0, #0
	movne r2, #1
	ldr r1, _02084CE4 ; =0x027FFF9B
	moveq r2, #0
	mov r0, #1
	strb r2, [r1]
	strb r0, [r1, #-1]
_02084C60:
	ldr r0, _02084CEC ; =0xFFFF0020
	ldr r1, _02084CF0 ; =_022BC084
	mov r2, #0x9c
	bl MTi_CpuCopy32
	bl DC_FlushAll
	ldr r0, _02084CDC ; =_022BC080
	add r0, r0, #0xfe000000
	mov r0, r0, lsr #5
	mov r0, r0, lsl #6
	orr r0, r0, #1
	bl CTRDGi_SendtoPxi
	mov r7, #1
	ldr r6, _02084CD4 ; =_022BC04C
	b _02084CA0
_02084C98:
	mov r0, r7
	blx SVC_WaitByLoop
_02084CA0:
	ldrh r0, [r6]
	cmp r0, #1
	bne _02084C98
	ldr r2, _02084CD0 ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh r5, [r2]
	bl OS_SetIrqMask
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02084CC8: .word _022BC060
_02084CCC: .word 0x04000300
_02084CD0: .word 0x04000208
_02084CD4: .word _022BC04C
_02084CD8: .word 0x04000204
_02084CDC: .word _022BC080
_02084CE0: .word 0x08000080
_02084CE4: .word 0x027FFF9B
_02084CE8: .word 0x027FFC30
_02084CEC: .word 0xFFFF0020
_02084CF0: .word _022BC084
	arm_func_end CTRDGi_InitModuleInfo

	arm_func_start CTRDGi_CallbackForInitModuleInfo
CTRDGi_CallbackForInitModuleInfo: ; 0x02084CF4
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _02084D14
	ldr r0, _02084D1C ; =_022BC04C
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, pc}
_02084D14:
	bl WaitForever2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084D1C: .word _022BC04C
	arm_func_end CTRDGi_CallbackForInitModuleInfo

	arm_func_start CTRDGi_PulledOutCallback
CTRDGi_PulledOutCallback: ; 0x02084D20
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #0x11
	bne _02084D70
	ldr r0, _02084D78 ; =_022BC060
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	ldr r1, [r0, #0x18]
	mov r0, #0
	cmp r1, #0
	beq _02084D54
	blx r1
_02084D54:
	cmp r0, #0
	beq _02084D60
	bl CTRDG_TerminateForPulledOut
_02084D60:
	ldr r0, _02084D78 ; =_022BC060
	mov r1, #1
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
_02084D70:
	bl WaitForever2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084D78: .word _022BC060
	arm_func_end CTRDGi_PulledOutCallback

	arm_func_start CTRDG_TerminateForPulledOut
CTRDG_TerminateForPulledOut: ; 0x02084D7C
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl CTRDGi_SendtoPxi
	bl WaitForever2
	ldmia sp!, {r3, pc}
	arm_func_end CTRDG_TerminateForPulledOut

	arm_func_start Ctrdgi_CallbackForSetPhi
Ctrdgi_CallbackForSetPhi: ; 0x02084D90
	ldr r0, _02084DA0 ; =_022BC060
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_02084DA0: .word _022BC060
	arm_func_end Ctrdgi_CallbackForSetPhi

