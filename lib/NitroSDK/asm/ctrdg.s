	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start CTRDGi_InitCommon
CTRDGi_InitCommon: ; 0x02084734
	stmdb sp!, {r3, lr}
	ldr r1, _02084760 ; =_022BC04C
	mov r3, #0
	ldr r2, _02084764 ; =0x05000001
	add r0, sp, #0
	str r3, [sp]
	blx SVC_CpuSet
	bl OS_GetLockID
	ldr r1, _02084768 ; =_022BC048
	strh r0, [r1, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084760: .word _022BC04C
_02084764: .word 0x05000001
_02084768: .word _022BC048
	arm_func_end CTRDGi_InitCommon

	arm_func_start Ctrdg_IsOptionCartridge
Ctrdg_IsOptionCartridge: ; 0x0208476C
	stmdb sp!, {r3, lr}
	bl Ctrdg_IsExisting
	cmp r0, #0
	beq _0208478C
	bl Ctrdgi_IsAgbCartridgeAtInit
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0208478C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Ctrdg_IsOptionCartridge

	arm_func_start Ctrdgi_IsAgbCartridgeAtInit
Ctrdgi_IsAgbCartridgeAtInit: ; 0x02084794
	ldr r0, _020847A8 ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	bx lr
	.align 2, 0
_020847A8: .word 0x027FFC30
	arm_func_end Ctrdgi_IsAgbCartridgeAtInit

	arm_func_start Ctrdg_IsExisting
Ctrdg_IsExisting: ; 0x020847AC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _020848AC ; =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _020848B0 ; =_022BC048
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl CTRDGi_LockByProcessor
	add r0, sp, #0
	bl CTRDGi_ChangeLatestAccessCycle
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _0208482C
	ldr r1, _020848AC ; =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _02084874
_0208482C:
	cmp r2, #0x96
	beq _0208484C
	ldr r1, _020848AC ; =0x027FFC30
	ldr r0, _020848B4 ; =0x0801FFFE
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _02084874
_0208484C:
	ldr r2, _020848AC ; =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _02084888
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _02084888
_02084874:
	ldr r1, _020848AC ; =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_02084888:
	add r0, sp, #0
	bl CTRDGi_RestoreAccessCycle
	ldr r0, _020848B0 ; =_022BC048
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl CTRDGi_UnlockByProcessor
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_020848AC: .word 0x027FFC30
_020848B0: .word _022BC048
_020848B4: .word 0x0801FFFE
	arm_func_end Ctrdg_IsExisting

	arm_func_start CTRDGi_ChangeLatestAccessCycle
CTRDGi_ChangeLatestAccessCycle: ; 0x020848B8
	ldr r2, _020848FC ; =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	mov r1, r1, asr #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	mov r1, r1, asr #4
	str r1, [r0, #4]
	ldrh r0, [r2]
	bic r0, r0, #0xc
	orr r0, r0, #0xc
	strh r0, [r2]
	ldrh r0, [r2]
	bic r0, r0, #0x10
	strh r0, [r2]
	bx lr
	.align 2, 0
_020848FC: .word 0x04000204
	arm_func_end CTRDGi_ChangeLatestAccessCycle

	arm_func_start CTRDGi_RestoreAccessCycle
CTRDGi_RestoreAccessCycle: ; 0x02084900
	ldr r3, _02084930 ; =0x04000204
	ldr r2, [r0]
	ldrh r1, [r3]
	bic r1, r1, #0xc
	orr r1, r1, r2, lsl #2
	strh r1, [r3]
	ldrh r1, [r3]
	ldr r2, [r0, #4]
	bic r0, r1, #0x10
	orr r0, r0, r2, lsl #4
	strh r0, [r3]
	bx lr
	.align 2, 0
_02084930: .word 0x04000204
	arm_func_end CTRDGi_RestoreAccessCycle

	arm_func_start CTRDGi_LockByProcessor
CTRDGi_LockByProcessor: ; 0x02084934
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _0208498C ; =0x027FFFE8
	mov r7, r0
	mov r6, r1
	mov r4, #1
_02084948:
	bl EnableIrqFlag
	str r0, [r6, #4]
	mov r0, r5
	bl OS_ReadOwnerOfLockWord
	ands r0, r0, #0x40
	str r0, [r6]
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl OS_TryLockCartridge
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6, #4]
	bl SetIrqFlag
	mov r0, r4
	blx SVC_WaitByLoop
	b _02084948
_02084988:
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0208498C: .word 0x027FFFE8
	arm_func_end CTRDGi_LockByProcessor

	arm_func_start CTRDGi_UnlockByProcessor
CTRDGi_UnlockByProcessor: ; 0x02084990
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _020849A8
	bl OS_UnlockCartridgeVeneer
_020849A8:
	ldr r0, [r4, #4]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	arm_func_end CTRDGi_UnlockByProcessor

	arm_func_start CTRDGi_SendtoPxi
CTRDGi_SendtoPxi: ; 0x020849B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r1, r7
	mov r0, #0xd
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
_020849E0:
	mov r0, r6
	blx SVC_WaitByLoop
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _020849E0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CTRDGi_SendtoPxi

	arm_func_start Ctrdg_Enable
Ctrdg_Enable: ; 0x02084A04
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _02084A48 ; =_022BC048
	mov r4, r0
	str r5, [r1]
	bl Ctrdg_IsOptionCartridge
	cmp r0, #0
	bne _02084A3C
	cmp r5, #0
	movne r1, #0x1000
	moveq r1, #0x5000
	mov r0, #0xf000
	bl OS_SetDPermissionsForProtectionRegion
_02084A3C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02084A48: .word _022BC048
	arm_func_end Ctrdg_Enable

