	.include "asm/macros.inc"
	.include "main_0207E84C.inc"

	.text

	arm_func_start FSi_GetPackedName
FSi_GetPackedName: ; 0x0207E84C
	stmdb sp!, {r3, lr}
	cmp r1, #3
	mov r3, #0
	bgt _0207E89C
	mov ip, r3
	cmp r1, #0
	ble _0207E89C
	mov lr, r3
_0207E86C:
	ldrb r2, [r0, ip]
	cmp r2, #0
	beq _0207E89C
	sub r2, r2, #0x41
	cmp r2, #0x19
	addls r2, r2, #0x61
	addhi r2, r2, #0x41
	add ip, ip, #1
	orr r3, r3, r2, lsl lr
	cmp ip, r1
	add lr, lr, #8
	blt _0207E86C
_0207E89C:
	mov r0, r3
	ldmia sp!, {r3, pc}
	arm_func_end FSi_GetPackedName

	arm_func_start FSi_ReadMemCallback
FSi_ReadMemCallback: ; 0x0207E8A4
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x28]
	add r0, r0, r2
	mov r2, r3
	bl MI_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FSi_ReadMemCallback

	arm_func_start FSi_WriteMemCallback
FSi_WriteMemCallback: ; 0x0207E8C0
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x28]
	mov r0, r1
	add r1, ip, r2
	mov r2, r3
	bl MI_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FSi_WriteMemCallback

	arm_func_start FSi_ReadMemoryCore
FSi_ReadMemoryCore: ; 0x0207E8E0
	stmdb sp!, {r3, lr}
	mov r0, r2
	mov r2, r3
	bl MI_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FSi_ReadMemoryCore

	arm_func_start FSi_NextCommand
FSi_NextCommand: ; 0x0207E8F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x48
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207E98C
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0x20
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _0207E98C
	mov r8, #0
	mov sb, #1
	mov r7, #3
_0207E948:
	ldr r1, [r0, #0xc]
	ldr r5, [r0, #4]
	tst r1, #2
	movne r1, sb
	moveq r1, r8
	cmp r1, #0
	beq _0207E980
	ldr r1, [r6, #0x24]
	cmp r1, r0
	mov r1, r7
	streq r5, [r6, #0x24]
	bl FSi_ReleaseCommand
	cmp r5, #0
	ldreq r5, [r6, #0x24]
_0207E980:
	mov r0, r5
	cmp r5, #0
	bne _0207E948
_0207E98C:
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207EA7C
	ldr r0, [r6, #0x1c]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207EA7C
	ldr r5, [r6, #0x24]
	cmp r5, #0
	beq _0207EA7C
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	moveq r7, #1
	movne r7, #0
	cmp r7, #0
	ldrne r0, [r6, #0x1c]
	orrne r0, r0, #0x10
	strne r0, [r6, #0x1c]
	mov r0, r4
	bl SetIrqFlag
	cmp r7, #0
	beq _0207EA20
	ldr r0, [r6, #0x58]
	tst r0, #0x200
	beq _0207EA20
	ldr r2, [r6, #0x54]
	mov r0, r5
	mov r1, #9
	blx r2
_0207EA20:
	bl EnableIrqFlag
	ldr r1, [r5, #0xc]
	mov r4, r0
	orr r0, r1, #0x40
	str r0, [r5, #0xc]
	ldr r0, [r5, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207EA68
	add r0, r5, #0x18
	bl OS_WakeupThread
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x48
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0207EA68:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x48
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0207EA7C:
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207EAC8
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0x10
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x58]
	tst r0, #0x400
	beq _0207EAC8
	add r0, sp, #0
	bl FS_InitFile
	str r6, [sp, #8]
	ldr r2, [r6, #0x54]
	add r0, sp, #0
	mov r1, #0xa
	blx r2
_0207EAC8:
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207EAF8
	ldr r1, [r6, #0x1c]
	add r0, r6, #0x14
	bic r1, r1, #0x40
	orr r1, r1, #8
	str r1, [r6, #0x1c]
	bl OS_WakeupThread
_0207EAF8:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FSi_NextCommand

	arm_func_start FSi_ExecuteAsyncCommand
FSi_ExecuteAsyncCommand: ; 0x0207EB0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r6, r0
	ldr r4, [r6, #8]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r7, #0
	mov r8, #1
_0207EB24:
	bl EnableIrqFlag
	ldr r1, [r6, #0xc]
	mov r5, r0
	orr r0, r1, #0x40
	str r0, [r6, #0xc]
	ldr r0, [r6, #0xc]
	tst r0, #4
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	beq _0207EB64
	add r0, r6, #0x18
	bl OS_WakeupThread
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207EB64:
	ldr r1, [r6, #0xc]
	mov r0, r5
	orr r1, r1, #8
	str r1, [r6, #0xc]
	bl SetIrqFlag
	ldr r1, [r6, #0x10]
	mov r0, r6
	bl FSi_TranslateCommand
	cmp r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl FSi_NextCommand
	movs r6, r0
	bne _0207EB24
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FSi_ExecuteAsyncCommand

	arm_func_start FSi_ExecuteSyncCommand
FSi_ExecuteSyncCommand: ; 0x0207EBA0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	bl FSi_TranslateCommand
	mov r1, r0
	mov r0, r4
	bl FSi_ReleaseCommand
	ldr r0, [r4, #8]
	bl FSi_NextCommand
	cmp r0, #0
	beq _0207EBD0
	bl FSi_ExecuteAsyncCommand
_0207EBD0:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end FSi_ExecuteSyncCommand

	arm_func_start FSi_SendCommand
FSi_SendCommand: ; 0x0207EBE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r4, [r6, #8]
	mov r2, #1
	str r1, [r6, #0x10]
	mov r0, #2
	str r0, [r6, #0x14]
	ldr r0, [r6, #0xc]
	mov r7, r2, lsl r1
	orr r0, r0, #1
	str r0, [r6, #0xc]
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x80
	beq _0207EC40
	mov r0, r6
	mov r1, #3
	bl FSi_ReleaseCommand
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207EC40:
	tst r7, #0x1fc
	ldrne r0, [r6, #0xc]
	orrne r0, r0, #4
	strne r0, [r6, #0xc]
	ldr r1, [r6]
	ldr r2, [r6, #4]
	cmp r1, #0
	strne r2, [r1, #4]
	cmp r2, #0
	add r0, r4, #0x20
	strne r1, [r2]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0207EC88
_0207EC78:
	mov r0, r1
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _0207EC78
_0207EC88:
	str r6, [r0, #4]
	str r0, [r6]
	mov r1, #0
	str r1, [r6, #4]
	ldr r0, [r4, #0x1c]
	tst r0, #8
	movne r1, #1
	cmp r1, #0
	bne _0207ED38
	ldr r0, [r4, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207ED38
	ldr r1, [r4, #0x1c]
	mov r0, r5
	orr r1, r1, #0x10
	str r1, [r4, #0x1c]
	bl SetIrqFlag
	ldr r0, [r4, #0x58]
	tst r0, #0x200
	beq _0207ECF4
	ldr r2, [r4, #0x54]
	mov r0, r6
	mov r1, #9
	blx r2
_0207ECF4:
	bl EnableIrqFlag
	ldr r1, [r6, #0xc]
	orr r1, r1, #0x40
	str r1, [r6, #0xc]
	ldr r1, [r6, #0xc]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _0207ED30
	bl SetIrqFlag
	mov r0, r6
	bl FSi_ExecuteAsyncCommand
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207ED30:
	bl SetIrqFlag
	b _0207ED7C
_0207ED38:
	ldr r0, [r6, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207ED60
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207ED60:
	add r0, r6, #0x18
	bl OS_SleepThread
	ldr r0, [r6, #0xc]
	tst r0, #0x40
	beq _0207ED60
	mov r0, r5
	bl SetIrqFlag
_0207ED7C:
	mov r0, r6
	bl FSi_ExecuteSyncCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end FSi_SendCommand

	arm_func_start FS_InitArchive
FS_InitArchive: ; 0x0207ED88
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x5c
	mov r4, r0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	str r0, [r4, #0x18]
	str r0, [r4, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end FS_InitArchive

	arm_func_start FS_FindArchive
FS_FindArchive: ; 0x0207EDB4
	stmdb sp!, {r3, r4, r5, lr}
	bl FSi_GetPackedName
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207EDF0 ; =_022BB5E8
	ldr r5, [r1]
	b _0207EDD4
_0207EDD0:
	ldr r5, [r5, #4]
_0207EDD4:
	cmp r5, #0
	ldrne r1, [r5]
	cmpne r1, r4
	bne _0207EDD0
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207EDF0: .word _022BB5E8
	arm_func_end FS_FindArchive

	arm_func_start FS_RegisterArchiveName
FS_RegisterArchiveName: ; 0x0207EDF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r5, r2
	mov r7, r0
	mov r8, #0
	bl EnableIrqFlag
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl FS_FindArchive
	cmp r0, #0
	bne _0207EE94
	ldr r0, _0207EEA4 ; =_022BB5E8
	ldr r1, [r0]
	cmp r1, #0
	bne _0207EE50
	str r7, [r0]
	str r7, [r0, #4]
	mov r1, r8
	str r1, [r0, #0xc]
	strh r1, [r0, #0xa]
	strh r1, [r0, #8]
	b _0207EE74
_0207EE50:
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0207EE6C
_0207EE5C:
	mov r1, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0207EE5C
_0207EE6C:
	str r7, [r1, #4]
	str r1, [r7, #8]
_0207EE74:
	mov r0, r6
	mov r1, r5
	bl FSi_GetPackedName
	str r0, [r7]
	ldr r0, [r7, #0x1c]
	mov r8, #1
	orr r0, r0, #1
	str r0, [r7, #0x1c]
_0207EE94:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207EEA4: .word _022BB5E8
	arm_func_end FS_RegisterArchiveName

	arm_func_start FS_ReleaseArchiveName
FS_ReleaseArchiveName: ; 0x0207EEA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl EnableIrqFlag
	ldr r2, [r4, #4]
	mov r3, #0
	cmp r2, #0
	ldrne r1, [r4, #8]
	strne r1, [r2, #8]
	ldr r2, [r4, #8]
	cmp r2, #0
	ldrne r1, [r4, #4]
	strne r1, [r2, #4]
	str r3, [r4]
	str r3, [r4, #8]
	str r3, [r4, #4]
	ldr r2, [r4, #0x1c]
	ldr r1, _0207EF28 ; =_022BB5E8
	bic r2, r2, #1
	str r2, [r4, #0x1c]
	ldr r2, [r1, #4]
	cmp r2, r4
	bne _0207EF20
	ldr r2, [r1]
	str r2, [r1, #4]
	str r3, [r1, #0xc]
	strh r3, [r1, #0xa]
	strh r3, [r1, #8]
_0207EF20:
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207EF28: .word _022BB5E8
	arm_func_end FS_ReleaseArchiveName

	arm_func_start FS_LoadArchive
FS_LoadArchive: ; 0x0207EF2C
	str r1, [r0, #0x28]
	str r3, [r0, #0x30]
	str r2, [r0, #0x3c]
	ldr r3, [sp, #4]
	str r2, [r0, #0x2c]
	ldr ip, [sp, #8]
	ldr r1, [sp]
	str r3, [r0, #0x38]
	str r1, [r0, #0x40]
	str r1, [r0, #0x34]
	cmp ip, #0
	ldreq ip, _0207EF94 ; =FSi_ReadMemCallback
	ldr r1, [sp, #0xc]
	str ip, [r0, #0x48]
	cmp r1, #0
	ldreq r1, _0207EF98 ; =FSi_WriteMemCallback
	str r1, [r0, #0x4c]
	ldr r2, [r0, #0x48]
	mov r1, #0
	str r2, [r0, #0x50]
	str r1, [r0, #0x44]
	ldr r1, [r0, #0x1c]
	orr r1, r1, #2
	str r1, [r0, #0x1c]
	mov r0, #1
	bx lr
	.align 2, 0
_0207EF94: .word FSi_ReadMemCallback
_0207EF98: .word FSi_WriteMemCallback
	arm_func_end FS_LoadArchive

	arm_func_start FS_UnloadArchive
FS_UnloadArchive: ; 0x0207EF9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #2
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207F04C
	mov r0, r6
	ldr r1, [r6, #0x1c]
	bl FS_SuspendArchive
	ldr r1, [r6, #0x1c]
	mov r5, r0
	orr r0, r1, #0x80
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _0207F008
	mov r7, #3
_0207EFF0:
	ldr r8, [r0, #4]
	mov r1, r7
	bl FSi_ReleaseCommand
	mov r0, r8
	cmp r8, #0
	bne _0207EFF0
_0207F008:
	mov r0, #0
	str r0, [r6, #0x24]
	cmp r5, #0
	beq _0207F020
	mov r0, r6
	bl FS_ResumeArchive
_0207F020:
	mov r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x2c]
	str r0, [r6, #0x30]
	str r0, [r6, #0x34]
	str r0, [r6, #0x38]
	str r0, [r6, #0x40]
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0xa2
	str r0, [r6, #0x1c]
_0207F04C:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FS_UnloadArchive

	arm_func_start FS_LoadArchiveTables
FS_LoadArchiveTables: ; 0x0207F05C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	mov r7, r0
	ldr r3, [r7, #0x30]
	ldr r0, [r7, #0x38]
	mov r6, r1
	add r0, r3, r0
	add r0, r0, #0x3f
	bic r4, r0, #0x1f
	cmp r4, r2
	bhi _0207F170
	add r1, r6, #0x1f
	add r0, sp, #4
	bic r5, r1, #0x1f
	bl FS_InitFile
	ldr r2, [r7, #0x2c]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r7, #0x30]
	add r0, sp, #4
	mov r1, r7
	add r3, r2, r3
	bl FS_OpenFileDirect
	cmp r0, #0
	beq _0207F0F0
	ldr r2, [r7, #0x30]
	add r0, sp, #4
	mov r1, r5
	bl FS_ReadFile
	cmp r0, #0
	bge _0207F0E8
	ldr r2, [r7, #0x30]
	mov r0, r5
	mov r1, #0
	bl MI_CpuFill8
_0207F0E8:
	add r0, sp, #4
	bl FS_CloseFile
_0207F0F0:
	str r5, [r7, #0x2c]
	ldr ip, [r7, #0x30]
	ldr r2, [r7, #0x34]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r7, #0x38]
	add r0, sp, #4
	mov r1, r7
	add r3, r2, r3
	add r5, r5, ip
	bl FS_OpenFileDirect
	cmp r0, #0
	beq _0207F154
	ldr r2, [r7, #0x38]
	add r0, sp, #4
	mov r1, r5
	bl FS_ReadFile
	cmp r0, #0
	bge _0207F14C
	ldr r2, [r7, #0x38]
	mov r0, r5
	mov r1, #0
	bl MI_CpuFill8
_0207F14C:
	add r0, sp, #4
	bl FS_CloseFile
_0207F154:
	str r5, [r7, #0x34]
	ldr r0, _0207F17C ; =FSi_ReadMemoryCore
	str r6, [r7, #0x44]
	str r0, [r7, #0x50]
	ldr r0, [r7, #0x1c]
	orr r0, r0, #4
	str r0, [r7, #0x1c]
_0207F170:
	mov r0, r4
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0207F17C: .word FSi_ReadMemoryCore
	arm_func_end FS_LoadArchiveTables

	arm_func_start FS_UnloadArchiveTables
FS_UnloadArchiveTables: ; 0x0207F180
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	tst r0, #2
	movne r0, #1
	moveq r0, r4
	cmp r0, #0
	beq _0207F204
	mov r0, r5
	bl FS_SuspendArchive
	ldr r1, [r5, #0x1c]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	beq _0207F1F4
	ldr r2, [r5, #0x1c]
	mov r1, #0
	bic r2, r2, #4
	str r2, [r5, #0x1c]
	ldr r4, [r5, #0x44]
	str r1, [r5, #0x44]
	ldr r1, [r5, #0x3c]
	str r1, [r5, #0x2c]
	ldr r1, [r5, #0x40]
	str r1, [r5, #0x34]
	ldr r1, [r5, #0x48]
	str r1, [r5, #0x50]
_0207F1F4:
	cmp r0, #0
	beq _0207F204
	mov r0, r5
	bl FS_ResumeArchive
_0207F204:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end FS_UnloadArchiveTables

	arm_func_start FS_SuspendArchive
FS_SuspendArchive: ; 0x0207F20C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	moveq r5, #1
	movne r5, #0
	cmp r5, #0
	beq _0207F298
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldr r0, [r6, #0x1c]
	beq _0207F290
	orr r0, r0, #0x40
	str r0, [r6, #0x1c]
	mov r7, #0
	mov r8, #1
_0207F26C:
	add r0, r6, #0x14
	bl OS_SleepThread
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	bne _0207F26C
	b _0207F298
_0207F290:
	orr r0, r0, #8
	str r0, [r6, #0x1c]
_0207F298:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FS_SuspendArchive

	arm_func_start FS_ResumeArchive
FS_ResumeArchive: ; 0x0207F2A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, #0
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r6, r0
	tst r1, #8
	movne r0, #1
	moveq r0, r5
	cmp r0, #0
	moveq r7, #1
	movne r7, #0
	cmp r7, #0
	bne _0207F2F8
	ldr r1, [r4, #0x1c]
	mov r0, r4
	bic r1, r1, #8
	str r1, [r4, #0x1c]
	bl FSi_NextCommand
	mov r5, r0
_0207F2F8:
	mov r0, r6
	bl SetIrqFlag
	cmp r5, #0
	beq _0207F310
	mov r0, r5
	bl FSi_ExecuteAsyncCommand
_0207F310:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end FS_ResumeArchive

	arm_func_start FS_SetArchiveProc
FS_SetArchiveProc: ; 0x0207F318
	cmp r2, #0
	moveq r1, #0
	beq _0207F32C
	cmp r1, #0
	moveq r2, #0
_0207F32C:
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	bx lr
	arm_func_end FS_SetArchiveProc

	arm_func_start FS_NotifyArchiveAsyncEnd
FS_NotifyArchiveAsyncEnd: ; 0x0207F338
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, [r4, #0x1c]
	mov r6, r1
	tst r0, #0x100
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207F38C
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x24]
	bic r2, r1, #0x100
	mov r1, r6
	str r2, [r4, #0x1c]
	bl FSi_ReleaseCommand
	mov r0, r4
	bl FSi_NextCommand
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl FSi_ExecuteAsyncCommand
	ldmia sp!, {r4, r5, r6, pc}
_0207F38C:
	ldr r5, [r4, #0x24]
	bl EnableIrqFlag
	str r6, [r5, #0x14]
	ldr r1, [r4, #0x1c]
	mov r5, r0
	bic r1, r1, #0x200
	add r0, r4, #0xc
	str r1, [r4, #0x1c]
	bl OS_WakeupThread
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FS_NotifyArchiveAsyncEnd
