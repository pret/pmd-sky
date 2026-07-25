	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start FSi_OnRomReadDone
FSi_OnRomReadDone: ; 0x0207F8EC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Card_IsPulledOut
	cmp r0, #0
	movne r1, #5
	moveq r1, #0
	mov r0, r4
	bl FS_NotifyArchiveAsyncEnd
	ldmia sp!, {r4, pc}
	arm_func_end FSi_OnRomReadDone

	arm_func_start FSi_ReadRomCallback
FSi_ReadRomCallback: ; 0x0207F910
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _0207F950 ; =_0207F8EC
	mov lr, r1
	str ip, [sp]
	str r0, [sp, #4]
	mov r1, #1
	ldr r0, _0207F954 ; =_022BB5FC
	str r1, [sp, #8]
	mov r1, r2
	ldr r0, [r0, #4]
	mov r2, lr
	bl Cardi_ReadRom
	mov r0, #6
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0207F950: .word FSi_OnRomReadDone
_0207F954: .word _022BB5FC
	arm_func_end FSi_ReadRomCallback

	arm_func_start FSi_WriteDummyCallback
FSi_WriteDummyCallback: ; 0x0207F958
	mov r0, #1
	bx lr
	arm_func_end FSi_WriteDummyCallback

	arm_func_start FSi_RomArchiveProc
FSi_RomArchiveProc: ; 0x0207F960
	stmdb sp!, {r3, lr}
	cmp r1, #1
	beq _0207F9B8
	cmp r1, #9
	beq _0207F980
	cmp r1, #0xa
	beq _0207F99C
	b _0207F9C0
_0207F980:
	ldr r0, _0207F9C8 ; =_022BB5FC
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_LockRom
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207F99C:
	ldr r0, _0207F9C8 ; =_022BB5FC
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl Card_UnlockRom
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207F9B8:
	mov r0, #4
	ldmia sp!, {r3, pc}
_0207F9C0:
	mov r0, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207F9C8: .word _022BB5FC
	arm_func_end FSi_RomArchiveProc

	arm_func_start FSi_ReadDummyCallback
FSi_ReadDummyCallback: ; 0x0207F9CC
	mov r0, #1
	bx lr
	arm_func_end FSi_ReadDummyCallback

	arm_func_start FSi_EmptyArchiveProc
FSi_EmptyArchiveProc: ; 0x0207F9D4
	mov r0, #4
	bx lr
	arm_func_end FSi_EmptyArchiveProc

	arm_func_start FSi_InitRom
FSi_InitRom: ; 0x0207F9DC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, _0207FAFC ; =_022BB5FC
	str r0, [r1, #4]
	bl OS_GetLockID
	ldr r1, _0207FAFC ; =_022BB5FC
	mov r2, #0
	str r0, [r1]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	bl CARD_Init
	ldr r0, _0207FB00 ; =fsi_arc_rom
	bl FS_InitArchive
	ldr r0, _0207FB00 ; =fsi_arc_rom
	ldr r1, _0207FB04 ; =_020B2BB4
	mov r2, #3
	bl FS_RegisterArchiveName
	ldr r4, _0207FB08 ; =0x027FFC40
	ldrh r0, [r4]
	cmp r0, #2
	bne _0207FA94
	ldr r3, _0207FAFC ; =_022BB5FC
	mvn r2, #0
	str r2, [r3, #8]
	mov ip, #0
	str ip, [r3, #0xc]
	str r2, [r3, #0x10]
	ldr r0, _0207FB00 ; =fsi_arc_rom
	ldr r1, _0207FB0C ; =_0207F9D4
	str ip, [r3, #0x14]
	bl FS_SetArchiveProc
	mov r1, #0
	str r1, [sp]
	ldr r0, _0207FB10 ; =FSi_ReadDummyCallback
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr ip, _0207FB14 ; =_0207F958
	ldr r0, _0207FB00 ; =fsi_arc_rom
	mov r2, r1
	mov r3, r1
	str ip, [sp, #0xc]
	bl FS_LoadArchive
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
_0207FA94:
	ldr r0, _0207FB00 ; =fsi_arc_rom
	ldr r1, _0207FB18 ; =FSi_RomArchiveProc
	ldr r2, _0207FB1C ; =0x00000602
	bl FS_SetArchiveProc
	ldr r1, [r4, #0x200]
	mvn r0, #0
	cmp r1, r0
	cmpne r1, #0
	ldrne r2, [r4, #0x208]
	cmpne r2, r0
	cmpne r2, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r4, pc}
	str r1, [sp]
	ldr r0, [r4, #0x204]
	ldr r1, _0207FB20 ; =FSi_ReadRomCallback
	str r0, [sp, #4]
	ldr r0, _0207FB14 ; =_0207F958
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r3, [r4, #0x20c]
	ldr r0, _0207FB00 ; =fsi_arc_rom
	mov r1, #0
	bl FS_LoadArchive
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207FAFC: .word _022BB5FC
_0207FB00: .word fsi_arc_rom
_0207FB04: .word _020B2BB4
_0207FB08: .word 0x027FFC40
_0207FB0C: .word FSi_EmptyArchiveProc
_0207FB10: .word FSi_ReadDummyCallback
_0207FB14: .word FSi_WriteDummyCallback
_0207FB18: .word FSi_RomArchiveProc
_0207FB1C: .word 0x00000602
_0207FB20: .word FSi_ReadRomCallback
	arm_func_end FSi_InitRom

