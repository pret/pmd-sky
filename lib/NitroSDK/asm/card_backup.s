	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Cardi_RequestStreamCommandCore
Cardi_RequestStreamCommandCore: ; 0x02083828
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	ldr r7, [sb, #0x2c]
	ldr r0, _02083A10 ; =_02000BC4
	ldr r4, [sb, #0x34]
	ldr sl, [sb, #0x30]
	mov r5, #0x100
	bl OSi_ReferSymbol
	cmp r7, #0xb
	bne _0208385C
	bl Card_GetBackupSectorSize
	mov r5, r0
	b _0208386C
_0208385C:
	cmp r7, #0xf
	ldreq r0, _02083A14 ; =_022BB7E0
	ldreq r0, [r0]
	ldreq r5, [r0, #0x20]
_0208386C:
	add r6, sb, #0x120
	mov fp, #9
_02083874:
	ldr r8, [sb, #0x24]
	ldr r0, [sb]
	cmp r5, r8
	movlo r8, r5
	str r8, [r0, #0x14]
	ldr r0, [sb, #0x114]
	tst r0, #0x40
	beq _020838B0
	ldr r0, [sb, #0x114]
	mov r1, #7
	bic r0, r0, #0x40
	str r0, [sb, #0x114]
	ldr r0, [sb]
	str r1, [r0]
	b _020839BC
_020838B0:
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _02083940
_020838BC: ; jump table
	b _020838CC ; case 0
	b _020838F0 ; case 1
	b _020838F0 ; case 2
	b _02083928 ; case 3
_020838CC:
	mov r0, r6
	mov r1, r8
	bl DC_InvalidateRange
	ldr r1, [sb, #0x1c]
	ldr r0, [sb]
	str r1, [r0, #0xc]
	ldr r0, [sb]
	str r6, [r0, #0x10]
	b _02083940
_020838F0:
	ldr r0, [sb, #0x1c]
	mov r1, r6
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r6
	mov r1, r8
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	ldr r0, [sb]
	str r6, [r0, #0xc]
	ldr r1, [sb, #0x20]
	ldr r0, [sb]
	str r1, [r0, #0x10]
	b _02083940
_02083928:
	ldr r1, [sb, #0x1c]
	ldr r0, [sb]
	str r1, [r0, #0xc]
	ldr r1, [sb, #0x20]
	ldr r0, [sb]
	str r1, [r0, #0x10]
_02083940:
	mov r0, sb
	mov r1, r7
	mov r2, sl
	bl Cardi_Request
	cmp r0, #0
	beq _020839BC
	cmp r4, #2
	bne _0208397C
	mov r0, sb
	mov r1, fp
	mov r2, #1
	bl Cardi_Request
	cmp r0, #0
	beq _020839BC
	b _02083994
_0208397C:
	cmp r4, #0
	bne _02083994
	ldr r1, [sb, #0x20]
	mov r0, r6
	mov r2, r8
	bl MI_CpuCopy8
_02083994:
	ldr r0, [sb, #0x1c]
	add r0, r0, r8
	str r0, [sb, #0x1c]
	ldr r0, [sb, #0x20]
	add r0, r0, r8
	str r0, [sb, #0x20]
	ldr r0, [sb, #0x24]
	subs r0, r0, r8
	str r0, [sb, #0x24]
	bne _02083874
_020839BC:
	ldr r6, [sb, #0x38]
	ldr r5, [sb, #0x3c]
	bl EnableIrqFlag
	ldr r1, [sb, #0x114]
	mov r4, r0
	bic r0, r1, #0x4c
	str r0, [sb, #0x114]
	add r0, sb, #0x10c
	bl OS_WakeupThread
	ldr r0, [sb, #0x114]
	tst r0, #0x10
	beq _020839F4
	add r0, sb, #0x44
	bl OS_WakeupThreadDirect
_020839F4:
	mov r0, r4
	bl SetIrqFlag
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r5
	blx r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02083A10: .word _02000BC4
_02083A14: .word _022BB7E0
	arm_func_end Cardi_RequestStreamCommandCore

	arm_func_start Cardi_RequestStreamCommand
Cardi_RequestStreamCommand: ; 0x02083A18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, _02083AF0 ; =_022BB7E0
	ldr r0, _02083AF4 ; =_02000BC4
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl OSi_ReferSymbol
	bl EnableIrqFlag
	ldr r1, [r4, #0x114]
	mov r5, r0
	tst r1, #4
	beq _02083A60
_02083A4C:
	add r0, r4, #0x10c
	bl OS_SleepThread
	ldr r0, [r4, #0x114]
	tst r0, #4
	bne _02083A4C
_02083A60:
	ldr r0, [r4, #0x114]
	ldr r1, [sp, #0x20]
	orr r2, r0, #4
	mov r0, r5
	str r2, [r4, #0x114]
	str r6, [r4, #0x38]
	str r1, [r4, #0x3c]
	bl SetIrqFlag
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x24]
	str sb, [r4, #0x1c]
	str r8, [r4, #0x20]
	str r7, [r4, #0x24]
	str r3, [r4, #0x2c]
	str r2, [r4, #0x30]
	str r1, [r4, #0x34]
	cmp r0, #0
	beq _02083AC0
	ldr r0, _02083AF8 ; =Cardi_RequestStreamCommandCore
	bl Cardi_SetTask
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02083AC0:
	ldr r0, _02083AFC ; =_022B966C
	ldr r1, _02083AF0 ; =_022BB7E0
	ldr r2, [r0, #4]
	mov r0, r4
	str r2, [r1, #0x104]
	bl Cardi_RequestStreamCommandCore
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02083AF0: .word _022BB7E0
_02083AF4: .word _02000BC4
_02083AF8: .word Cardi_RequestStreamCommandCore
_02083AFC: .word _022B966C
	arm_func_end Cardi_RequestStreamCommand

	arm_func_start Card_GetCurrentBackupType
Card_GetCurrentBackupType: ; 0x02083B00
	ldr r0, _02083B10 ; =_022BB7E0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02083B10: .word _022BB7E0
	arm_func_end Card_GetCurrentBackupType

	arm_func_start Card_GetBackupTotalSize
Card_GetBackupTotalSize: ; 0x02083B14
	ldr r0, _02083B24 ; =_022BB7E0
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bx lr
	.align 2, 0
_02083B24: .word _022BB7E0
	arm_func_end Card_GetBackupTotalSize

	arm_func_start Card_GetBackupSectorSize
Card_GetBackupSectorSize: ; 0x02083B28
	ldr r0, _02083B38 ; =_022BB7E0
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bx lr
	.align 2, 0
_02083B38: .word _022BB7E0
	arm_func_end Card_GetBackupSectorSize

	arm_func_start Card_IdentifyBackup
Card_IdentifyBackup: ; 0x02083B3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r0, _02083C68 ; =_02000BC4
	ldr r4, _02083C6C ; =_022BB7E0
	bl OSi_ReferSymbol
	cmp r6, #0
	bne _02083B5C
	bl WaitForever2
_02083B5C:
	bl Card_CheckEnabled
	bl EnableIrqFlag
	ldr r1, [r4, #0x114]
	mov r5, r0
	tst r1, #4
	beq _02083B88
_02083B74:
	add r0, r4, #0x10c
	bl OS_SleepThread
	ldr r0, [r4, #0x114]
	tst r0, #4
	bne _02083B74
_02083B88:
	ldr r0, [r4, #0x114]
	mov r1, #0
	orr r2, r0, #4
	mov r0, r5
	str r2, [r4, #0x114]
	str r1, [r4, #0x38]
	str r1, [r4, #0x3c]
	bl SetIrqFlag
	mov r0, r6
	bl Cardi_IdentifyBackupCore
	ldr r0, _02083C70 ; =_022B966C
	ldr r1, _02083C6C ; =_022BB7E0
	ldr r2, [r0, #4]
	mov r0, r4
	str r2, [r1, #0x104]
	mov r1, #2
	mov r2, #1
	bl Cardi_Request
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r4]
	add r1, r4, #0x120
	str r1, [r0, #0x10]
	ldr r1, [r4]
	mov r2, #1
	mov r0, r4
	str r2, [r1, #0x14]
	mov r1, #6
	bl Cardi_Request
	ldr r7, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl EnableIrqFlag
	mov r5, r0
	ldr r1, [r4, #0x114]
	add r0, r4, #0x10c
	bic r1, r1, #0x4c
	str r1, [r4, #0x114]
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _02083C38
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_02083C38:
	mov r0, r5
	bl SetIrqFlag
	cmp r7, #0
	beq _02083C50
	mov r0, r6
	blx r7
_02083C50:
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02083C68: .word _02000BC4
_02083C6C: .word _022BB7E0
_02083C70: .word _022B966C
	arm_func_end Card_IdentifyBackup

	arm_func_start Card_WaitBackupAsync
Card_WaitBackupAsync: ; 0x02083C74
	ldr ip, _02083C7C ; =Cardi_WaitAsync
	bx ip
	.align 2, 0
_02083C7C: .word Cardi_WaitAsync
	arm_func_end Card_WaitBackupAsync

	arm_func_start Card_TryWaitBackupAsync
Card_TryWaitBackupAsync: ; 0x02083C80
	ldr ip, _02083C88 ; =Cardi_TryWaitAsync
	bx ip
	.align 2, 0
_02083C88: .word Cardi_TryWaitAsync
	arm_func_end Card_TryWaitBackupAsync

