	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

	arm_func_start FS_ChangeDir
FS_ChangeDir: ; 0x0207F894
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	add r0, sp, #0xc
	bl FileInit
	add r0, sp, #0xc
	add r3, sp, #0
	mov r1, r4
	mov r2, #0
	bl FSi_FindPath
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r3, _0207F8E8 ; =_022BB5EC
	add r0, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0207F8E8: .word _022BB5EC
	arm_func_end FS_ChangeDir

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
	ldr r0, _0207FB00 ; =_022BB614
	bl FS_InitArchive
	ldr r0, _0207FB00 ; =_022BB614
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
	ldr r0, _0207FB00 ; =_022BB614
	ldr r1, _0207FB0C ; =_0207F9D4
	str ip, [r3, #0x14]
	bl FS_SetArchiveProc
	mov r1, #0
	str r1, [sp]
	ldr r0, _0207FB10 ; =FSi_ReadDummyCallback
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr ip, _0207FB14 ; =_0207F958
	ldr r0, _0207FB00 ; =_022BB614
	mov r2, r1
	mov r3, r1
	str ip, [sp, #0xc]
	bl FS_LoadArchive
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
_0207FA94:
	ldr r0, _0207FB00 ; =_022BB614
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
	ldr r0, _0207FB00 ; =_022BB614
	mov r1, #0
	bl FS_LoadArchive
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207FAFC: .word _022BB5FC
_0207FB00: .word _022BB614
_0207FB04: .word _020B2BB4
_0207FB08: .word 0x027FFC40
_0207FB0C: .word FSi_EmptyArchiveProc
_0207FB10: .word FSi_ReadDummyCallback
_0207FB14: .word FSi_WriteDummyCallback
_0207FB18: .word FSi_RomArchiveProc
_0207FB1C: .word 0x00000602
_0207FB20: .word FSi_ReadRomCallback
	arm_func_end FSi_InitRom

	arm_func_start FSi_GetOverlayBinarySize
FSi_GetOverlayBinarySize: ; 0x0207FB24
	ldr r1, [r0, #0x1c]
	mov r2, r1, lsr #0x18
	tst r2, #1
	movne r0, r1, lsl #8
	movne r0, r0, lsr #8
	ldreq r0, [r0, #8]
	bx lr
	arm_func_end FSi_GetOverlayBinarySize

	arm_func_start FS_ClearOverlayImage
FS_ClearOverlayImage: ; 0x0207FB40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #0xc]
	ldmib r0, {r4, r5}
	add r6, r5, r1
	mov r0, r4
	mov r1, r6
	bl IC_InvalidateRange
	mov r0, r4
	mov r1, r6
	bl DC_InvalidateRange
	add r0, r4, r5
	sub r2, r6, r5
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FS_ClearOverlayImage

	arm_func_start FS_GetOverlayFileID
FS_GetOverlayFileID: ; 0x0207FB7C
	sub sp, sp, #8
	ldr r1, [r1, #0x18]
	ldr r2, _0207FBA0 ; =_022BB614
	str r1, [sp, #4]
	str r2, [r0]
	str r2, [sp]
	str r1, [r0, #4]
	add sp, sp, #8
	bx lr
	.align 2, 0
_0207FBA0: .word _022BB614
	arm_func_end FS_GetOverlayFileID

	arm_func_start FSi_LoadOverlayInfoCore
FSi_LoadOverlayInfoCore: ; 0x0207FBA4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x54
	movs sb, r1
	ldreq r7, [sp, #0x74]
	ldreq r6, [sp, #0x70]
	ldrne r7, [sp, #0x7c]
	ldrne r6, [sp, #0x78]
	cmp r7, r2, lsl #5
	mov r4, r0
	mov r8, r3
	mov r5, r2, lsl #5
	addls sp, sp, #0x54
	movls r0, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, sp, #0xc
	bl FileInit
	mvn ip, #0
	add r0, sp, #0xc
	mov r1, r8
	add r2, r6, r5
	add r3, r6, r7
	str ip, [sp]
	bl FS_OpenFileDirect
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, sp, #0xc
	mov r1, r4
	mov r2, #0x20
	bl FS_ReadFile
	cmp r0, #0x20
	add r0, sp, #0xc
	beq _0207FC3C
	bl FS_CloseFile
	add sp, sp, #0x54
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0207FC3C:
	bl FS_CloseFile
	add r0, sp, #4
	mov r1, r4
	str sb, [r4, #0x20]
	bl FS_GetOverlayFileID
	add r1, sp, #4
	add r0, sp, #0xc
	ldmia r1, {r1, r2}
	bl FS_OpenFileFast
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [sp, #0x30]
	add r0, sp, #0xc
	str r1, [r4, #0x24]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x30]
	sub r1, r2, r1
	str r1, [r4, #0x28]
	bl FS_CloseFile
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FSi_LoadOverlayInfoCore

	arm_func_start GetOverlayInfo
GetOverlayInfo: ; 0x0207FC9C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x60
	movs r4, r1
	mov r5, r0
	ldreq r0, _0207FD88 ; =_022BB604
	ldrne r0, _0207FD8C ; =_022BB60C
	ldr ip, [r0]
	cmp ip, #0
	beq _0207FD4C
	ldr r0, [r0, #4]
	mov r3, r2, lsl #5
	cmp r0, r2, lsl #5
	addls sp, sp, #0x60
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
	mov r1, r5
	add r0, ip, r3
	mov r2, #0x20
	bl MI_CpuCopy8
	add r0, sp, #0x18
	str r4, [r5, #0x20]
	bl FileInit
	add r0, sp, #0x10
	mov r1, r5
	bl FS_GetOverlayFileID
	add r1, sp, #0x10
	add r0, sp, #0x18
	ldmia r1, {r1, r2}
	bl FS_OpenFileFast
	cmp r0, #0
	addeq sp, sp, #0x60
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #0x3c]
	add r0, sp, #0x18
	str r1, [r5, #0x24]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x3c]
	sub r1, r2, r1
	str r1, [r5, #0x28]
	bl FS_CloseFile
	add sp, sp, #0x60
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0207FD4C:
	ldr ip, _0207FD90 ; =0x027FFE50
	ldr r3, _0207FD94 ; =_022BB614
	ldr r1, [ip]
	mov r0, r5
	str r1, [sp]
	ldr r5, [ip, #4]
	mov r1, r4
	str r5, [sp, #4]
	ldr r4, [ip, #8]
	str r4, [sp, #8]
	ldr r4, [ip, #0xc]
	str r4, [sp, #0xc]
	bl FSi_LoadOverlayInfoCore
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207FD88: .word _022BB604
_0207FD8C: .word _022BB60C
_0207FD90: .word 0x027FFE50
_0207FD94: .word _022BB614
	arm_func_end GetOverlayInfo

	arm_func_start LoadOverlayInternal
LoadOverlayInternal: ; 0x0207FD98
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	mov r5, r0
	add r0, sp, #8
	bl FileInit
	add r0, sp, #0
	mov r1, r5
	bl FS_GetOverlayFileID
	add r1, sp, #0
	add r0, sp, #8
	ldmia r1, {r1, r2}
	bl FS_OpenFileFast
	cmp r0, #0
	addeq sp, sp, #0x50
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl FSi_GetOverlayBinarySize
	mov r4, r0
	mov r0, r5
	bl FS_ClearOverlayImage
	ldr r1, [r5, #4]
	add r0, sp, #8
	mov r2, r4
	bl FS_ReadFile
	cmp r4, r0
	add r0, sp, #8
	beq _0207FE18
	bl FS_CloseFile
	add sp, sp, #0x50
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0207FE18:
	bl FS_CloseFile
	mov r0, #1
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end LoadOverlayInternal

	arm_func_start FSi_CompareDigest
FSi_CompareDigest: ; 0x0207FE28
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r4, r0
	mov r6, r1
	mov r5, r2
	add r0, sp, #0x44
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r2, _0207FEB8 ; =_020B2BB8
	add r1, sp, #4
	ldmia r2, {r0, r2}
	bl MI_CpuCopy8
	ldr r3, _0207FEB8 ; =_020B2BB8
	mov r1, r6
	ldr ip, [r3, #4]
	mov r2, r5
	add r0, sp, #0x44
	add r3, sp, #4
	str ip, [sp]
	bl Dgt_Hash2CalcHmac
	add r3, sp, #0x44
	mov r2, #0
_0207FE84:
	ldr r1, [r3]
	ldr r0, [r4, r2]
	cmp r1, r0
	bne _0207FEA4
	add r2, r2, #4
	cmp r2, #0x14
	add r3, r3, #4
	blo _0207FE84
_0207FEA4:
	cmp r2, #0x14
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207FEB8: .word _020B2BB8
	arm_func_end FSi_CompareDigest

	arm_func_start InitOverlay
InitOverlay: ; 0x0207FEBC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl FSi_GetOverlayBinarySize
	ldr r1, _0207FFA0 ; =0x027FFC40
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #2
	bne _0207FF4C
	ldr r1, [r5, #0x1c]
	mov r0, #0
	mov r1, r1, lsr #0x18
	tst r1, #2
	beq _0207FF2C
	ldr r1, _0207FFA4 ; =_020B3364
	ldr r3, _0207FFA8 ; =_020B3364
	ldr r2, _0207FFAC ; =0x66666667
	sub ip, r1, r3
	smull r1, lr, r2, ip
	mov r1, ip, lsr #0x1f
	ldr r2, [r5]
	add lr, r1, lr, asr #3
	cmp r2, lr
	bhs _0207FF2C
	mov r0, #0x14
	mla r0, r2, r0, r3
	ldr r1, [r5, #4]
	mov r2, r4
	bl FSi_CompareDigest
_0207FF2C:
	cmp r0, #0
	bne _0207FF4C
	ldr r0, [r5, #4]
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	bl WaitForever2
	ldmia sp!, {r3, r4, r5, pc}
_0207FF4C:
	ldr r0, [r5, #0x1c]
	mov r0, r0, lsr #0x18
	tst r0, #1
	beq _0207FF68
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl MIi_UncompressBackward
_0207FF68:
	ldmib r5, {r0, r1}
	bl DC_FlushRange
	ldr r4, [r5, #0x10]
	ldr r5, [r5, #0x14]
	cmp r4, r5
	ldmhsia sp!, {r3, r4, r5, pc}
_0207FF80:
	ldr r0, [r4]
	cmp r0, #0
	beq _0207FF90
	blx r0
_0207FF90:
	add r4, r4, #4
	cmp r4, r5
	blo _0207FF80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207FFA0: .word 0x027FFC40
_0207FFA4: .word _020B3364
_0207FFA8: .word _020B3364
_0207FFAC: .word 0x66666667
	arm_func_end InitOverlay

	arm_func_start FS_EndOverlay
FS_EndOverlay: ; 0x0207FFB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
_0207FFB8:
	ldr r1, [fp, #8]
	ldr r0, [fp, #0xc]
	mov r4, #0
	ldr r6, [fp, #4]
	add r0, r1, r0
	mov r5, r4
	add r7, r6, r0
	bl EnableIrqFlag
	ldr r1, _0208009C ; =_022BCA74
	mov ip, r4
	ldr lr, [r1]
	mov r8, lr
	cmp lr, #0
	beq _02080064
	mov r2, r4
_0207FFF4:
	ldr sl, [r8, #8]
	ldr sb, [r8]
	cmp sl, #0
	ldr r3, [r8, #4]
	bne _02080018
	cmp r3, r6
	blo _02080018
	cmp r3, r7
	blo _02080028
_02080018:
	cmp sl, r6
	blo _02080054
	cmp sl, r7
	bhs _02080054
_02080028:
	cmp r5, #0
	strne r8, [r5]
	moveq r4, r8
	cmp lr, r8
	streq sb, [r1]
	moveq lr, sb
	str r2, [r8]
	cmp ip, #0
	mov r5, r8
	strne sb, [ip]
	b _02080058
_02080054:
	mov ip, r8
_02080058:
	mov r8, sb
	cmp sb, #0
	bne _0207FFF4
_02080064:
	bl SetIrqFlag
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02080070:
	ldr r1, [r4, #4]
	ldr r5, [r4]
	cmp r1, #0
	beq _02080088
	ldr r0, [r4, #8]
	blx r1
_02080088:
	mov r4, r5
	cmp r5, #0
	bne _02080070
	b _0207FFB8
_02080098:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208009C: .word _022BCA74
	arm_func_end FS_EndOverlay

	arm_func_start FS_UnloadOverlayImage
FS_UnloadOverlayImage: ; 0x020800A0
	stmdb sp!, {r3, lr}
	bl FS_EndOverlay
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end FS_UnloadOverlayImage

	arm_func_start FS_UnloadOverlay
FS_UnloadOverlay: ; 0x020800B0
	stmdb sp!, {lr}
	sub sp, sp, #0x2c
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl GetOverlayInfo
	cmp r0, #0
	beq _020800E4
	add r0, sp, #0
	bl FS_UnloadOverlayImage
	cmp r0, #0
	bne _020800F0
_020800E4:
	add sp, sp, #0x2c
	mov r0, #0
	ldmia sp!, {pc}
_020800F0:
	mov r0, #1
	add sp, sp, #0x2c
	ldmia sp!, {pc}
	arm_func_end FS_UnloadOverlay

	arm_func_start MD5_Init
MD5_Init: ; 0x020800FC
	ldr r2, _0208012C ; =0x67452301
	ldr r1, _02080130 ; =0xEFCDAB89
	str r2, [r0]
	ldr r2, _02080134 ; =0x98BADCFE
	str r1, [r0, #4]
	ldr r1, _02080138 ; =0x10325476
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
_0208012C: .word 0x67452301
_02080130: .word 0xEFCDAB89
_02080134: .word 0x98BADCFE
_02080138: .word 0x10325476
	arm_func_end MD5_Init

	arm_func_start MD5_Update
MD5_Update: ; 0x0208013C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	ldr r3, [r6, #0x10]
	mov r4, r2
	and ip, r3, #0x3f
	ldr r0, [r6, #0x14]
	adds r3, r3, r4
	str r3, [r6, #0x10]
	adc r0, r0, #0
	rsb r7, ip, #0x40
	mov r5, r1
	str r0, [r6, #0x14]
	cmp r7, r4
	bls _02080190
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r1, r6, #0x18
	mov r0, r5
	add r1, r1, ip
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02080190:
	add r1, r6, #0x18
	mov r0, r5
	mov r2, r7
	add r1, r1, ip
	bl MI_CpuCopy8
	mov r0, r6
	bl MD5_Transform
	sub r4, r4, r7
	mov r8, r4, lsr #6
	cmp r8, #0
	add r7, r5, r7
	ble _020801EC
	mov r5, #0x40
_020801C4:
	mov r0, r7
	mov r2, r5
	add r1, r6, #0x18
	bl MI_CpuCopy8
	mov r0, r6
	add r7, r7, #0x40
	bl MD5_Transform
	sub r8, r8, #1
	cmp r8, #0
	bgt _020801C4
_020801EC:
	ands r2, r4, #0x3f
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	add r1, r6, #0x18
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MD5_Update

	arm_func_start MD5_Digest
MD5_Digest: ; 0x02080204
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	ldr r1, [r4, #0x14]
	ldr r3, [r4, #0x10]
	mov r5, r0
	mov r6, r1, lsl #3
	ldr r1, _020802B8 ; =_020B2BC0
	mov r0, r4
	mov r2, #1
	orr r6, r6, r3, lsr #29
	mov r7, r3, lsl #3
	bl MD5_Update
	ldr r0, [r4, #0x10]
	mov r1, #0
	and r3, r0, #0x3f
	rsb r2, r3, #0x40
	cmp r2, #8
	bhs _02080268
	add r0, r4, #0x18
	add r0, r0, r3
	bl MI_CpuFill8
	mov r0, r4
	bl MD5_Transform
	mov r3, #0
	mov r2, #0x40
_02080268:
	cmp r2, #8
	bls _02080284
	add r0, r4, #0x18
	add r0, r0, r3
	sub r2, r2, #8
	mov r1, #0
	bl MI_CpuFill8
_02080284:
	str r7, [r4, #0x50]
	mov r0, r4
	str r6, [r4, #0x54]
	bl MD5_Transform
	mov r0, r4
	mov r1, r5
	mov r2, #0x10
	bl MI_CpuCopy8
	mov r0, r4
	mov r1, #0
	mov r2, #0x58
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020802B8: .word _020B2BC0
	arm_func_end MD5_Digest

	arm_func_start MD5_Transform
MD5_Transform: ; 0x020802BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldmia r0, {r2, r3, ip, lr}
	add r4, r0, #0x18
	ldr r5, _02080668 ; =_020B2C84
	mov r7, r4
	mov r8, #0
_020802D4:
	mvn r1, r3
	and r6, r3, ip
	and r1, r1, lr
	orr r1, r6, r1
	ldr r6, [r7]
	add r1, r2, r1
	ldr r2, [r5]
	add r1, r6, r1
	add r2, r2, r1
	mov r1, r2, lsr #0x19
	orr r1, r1, r2, lsl #7
	add r2, r3, r1
	mvn r1, r2
	and r6, r2, r3
	and r1, r1, ip
	orr r1, r6, r1
	ldr r6, [r7, #4]
	add r1, lr, r1
	ldr sb, [r5, #4]
	add r1, r6, r1
	add r6, sb, r1
	mov r1, r6, lsr #0x14
	orr r1, r1, r6, lsl #12
	add lr, r2, r1
	mvn r1, lr
	and r6, lr, r2
	and r1, r1, r3
	orr r1, r6, r1
	ldr sb, [r7, #8]
	add r6, ip, r1
	ldr r1, [r7, #0xc]
	add sb, sb, r6
	ldr sl, [r5, #8]
	ldr r6, [r5, #0xc]
	add sl, sl, sb
	mov sb, sl, lsr #0xf
	orr sb, sb, sl, lsl #17
	add ip, lr, sb
	add r5, r5, #0x10
	add r7, r7, #0x10
	and sl, ip, lr
	mvn sb, ip
	and sb, sb, r2
	orr sb, sl, sb
	add r3, r3, sb
	add r1, r1, r3
	add r3, r6, r1
	mov r1, r3, lsr #0xa
	orr r1, r1, r3, lsl #22
	add r3, ip, r1
	add r8, r8, #1
	cmp r8, #4
	blt _020802D4
	ldr r1, _0208066C ; =_020B2BC4
	mov r6, #0
_020803B0:
	mvn r7, lr
	ldr sb, [r1]
	and r8, r3, lr
	and r7, ip, r7
	orr r7, r8, r7
	ldr r8, [r4, sb, lsl #2]
	add r2, r2, r7
	ldr r7, [r5]
	add r2, r8, r2
	add r7, r7, r2
	mov r2, r7, lsr #0x1b
	orr r2, r2, r7, lsl #5
	add r2, r3, r2
	mvn r8, ip
	ldr r7, [r1, #4]
	and sb, r2, ip
	and r8, r3, r8
	orr sl, sb, r8
	mvn r8, r3
	ldr sb, [r1, #8]
	ldr fp, [r4, r7, lsl #2]
	add r7, lr, sl
	add r7, fp, r7
	ldr sl, [r5, #4]
	ldr sb, [r4, sb, lsl #2]
	add sl, sl, r7
	ldr r7, [r1, #0xc]
	and r8, r2, r8
	ldr r7, [r4, r7, lsl #2]
	mov fp, sl, lsr #0x17
	orr sl, fp, sl, lsl #9
	add lr, r2, sl
	ldr sl, [r5, #8]
	and fp, lr, r3
	orr r8, fp, r8
	add r8, ip, r8
	add r8, sb, r8
	add sb, sl, r8
	mov r8, sb, lsr #0x12
	orr r8, r8, sb, lsl #14
	add ip, lr, r8
	mvn r8, r2
	and sb, lr, r8
	ldr r8, [r5, #0xc]
	add r5, r5, #0x10
	add r1, r1, #0x10
	and sl, ip, r2
	orr sb, sl, sb
	add r3, r3, sb
	add r3, r7, r3
	add r7, r8, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r7, lsl #20
	add r3, ip, r3
	add r6, r6, #1
	cmp r6, #4
	blt _020803B0
	mov r6, #0
_02080498:
	ldr r8, [r1]
	eor r7, r3, ip
	eor r7, lr, r7
	ldr r8, [r4, r8, lsl #2]
	add r2, r2, r7
	ldr r7, [r5]
	add r2, r8, r2
	add r7, r7, r2
	mov r2, r7, lsr #0x1c
	orr r2, r2, r7, lsl #4
	add r2, r3, r2
	ldr r8, [r1, #4]
	eor r7, r2, r3
	eor r7, ip, r7
	ldr r8, [r4, r8, lsl #2]
	add r7, lr, r7
	ldr sb, [r1, #8]
	ldr sl, [r5, #4]
	add r7, r8, r7
	add r8, sl, r7
	mov r7, r8, lsr #0x15
	orr r7, r7, r8, lsl #11
	add lr, r2, r7
	eor r8, lr, r2
	ldr r7, [r1, #0xc]
	ldr sb, [r4, sb, lsl #2]
	eor r8, r3, r8
	add r8, ip, r8
	add sb, sb, r8
	ldr sl, [r5, #8]
	ldr r8, [r4, r7, lsl #2]
	add sb, sl, sb
	mov r7, sb, lsr #0x10
	orr r7, r7, sb, lsl #16
	add ip, lr, r7
	eor r7, ip, lr
	eor r7, r2, r7
	add r3, r3, r7
	add r3, r8, r3
	ldr r7, [r5, #0xc]
	add r5, r5, #0x10
	add r7, r7, r3
	add r1, r1, #0x10
	mov r3, r7, lsr #9
	orr r3, r3, r7, lsl #23
	add r3, ip, r3
	add r6, r6, #1
	cmp r6, #4
	blt _02080498
	mov r8, #0
_02080560:
	mvn r6, lr
	ldr r7, [r1]
	orr r6, r3, r6
	eor r6, ip, r6
	ldr r7, [r4, r7, lsl #2]
	add r2, r2, r6
	ldr r6, [r5]
	add r2, r7, r2
	add r6, r6, r2
	mov r2, r6, lsr #0x1a
	orr r2, r2, r6, lsl #6
	add r2, r3, r2
	mvn r6, ip
	ldr sb, [r1, #4]
	orr r6, r2, r6
	eor r7, r3, r6
	ldr r6, [r1, #8]
	ldr sb, [r4, sb, lsl #2]
	add r7, lr, r7
	ldr sl, [r5, #4]
	add r7, sb, r7
	add sb, sl, r7
	mov r7, sb, lsr #0x16
	orr sb, r7, sb, lsl #10
	ldr r7, [r1, #0xc]
	add lr, r2, sb
	mvn sb, r3
	ldr r6, [r4, r6, lsl #2]
	orr sb, lr, sb
	eor sb, r2, sb
	add sb, ip, sb
	add sb, r6, sb
	ldr sl, [r5, #8]
	ldr r6, [r4, r7, lsl #2]
	add sb, sl, sb
	mov r7, sb, lsr #0x11
	orr sb, r7, sb, lsl #15
	ldr r7, [r5, #0xc]
	add ip, lr, sb
	add r5, r5, #0x10
	add r1, r1, #0x10
	mvn sb, r2
	orr sb, ip, sb
	eor sb, lr, sb
	add r3, r3, sb
	add r3, r6, r3
	add r6, r7, r3
	mov r3, r6, lsr #0xb
	orr r3, r3, r6, lsl #21
	add r3, ip, r3
	add r8, r8, #1
	cmp r8, #4
	blt _02080560
	ldr r1, [r0]
	add r1, r1, r2
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r3
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, ip
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r1, r1, lr
	str r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02080668: .word _020B2C84
_0208066C: .word _020B2BC4
	arm_func_end MD5_Transform

	arm_func_start Dgt_Hash2Init
Dgt_Hash2Init: ; 0x02080670
	ldr r1, _020806AC ; =0x67452301
	ldr r2, _020806B0 ; =0xEFCDAB89
	str r1, [r0]
	ldr r1, _020806B4 ; =0x98BADCFE
	str r2, [r0, #4]
	ldr r2, _020806B8 ; =0x10325476
	str r1, [r0, #8]
	ldr r1, _020806BC ; =0xC3D2E1F0
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_020806AC: .word 0x67452301
_020806B0: .word 0xEFCDAB89
_020806B4: .word 0x98BADCFE
_020806B8: .word 0x10325476
_020806BC: .word 0xC3D2E1F0
	arm_func_end Dgt_Hash2Init

	arm_func_start Dgt_Hash2Update
Dgt_Hash2Update: ; 0x020806C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	movs r8, r2
	mov sb, r1
	add r6, sl, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x14]
	add r1, r0, r8, lsl #3
	cmp r1, r0
	ldrlo r0, [sl, #0x18]
	addlo r0, r0, #1
	strlo r0, [sl, #0x18]
	ldr r0, [sl, #0x18]
	add r0, r0, r8, lsr #29
	str r0, [sl, #0x18]
	str r1, [sl, #0x14]
	ldr r1, [sl, #0x1c]
	cmp r1, #0
	beq _02080778
	add r0, r1, r8
	cmp r0, #0x40
	blo _02080758
	rsb r4, r1, #0x40
	mov r0, sb
	mov r2, r4
	add r1, r6, r1
	bl MI_CpuCopy8
	ldr r1, _02080810 ; =_020B2D88
	mov r0, sl
	ldr r3, [r1]
	mov r1, r6
	mov r2, #0x40
	sub r8, r8, r4
	add sb, sb, r4
	blx r3
	mov r0, #0
	str r0, [sl, #0x1c]
	b _02080778
_02080758:
	mov r0, sb
	mov r2, r8
	add r1, r6, r1
	bl MI_CpuCopy8
	ldr r0, [sl, #0x1c]
	add r0, r0, r8
	str r0, [sl, #0x1c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02080778:
	cmp r8, #0x40
	blo _020807F0
	bic r7, r8, #0x3f
	tst sb, #3
	sub r8, r8, r7
	bne _020807B0
	ldr r1, _02080810 ; =_020B2D88
	mov r0, sl
	ldr r3, [r1]
	mov r1, sb
	mov r2, r7
	blx r3
	add sb, sb, r7
	b _020807F0
_020807B0:
	mov r5, #0x40
	ldr r4, _02080810 ; =_020B2D88
	mov fp, r5
_020807BC:
	mov r0, sb
	mov r1, r6
	mov r2, r5
	bl MI_CpuCopy8
	ldr r3, [r4]
	mov r0, sl
	mov r1, r6
	add sb, sb, #0x40
	mov r2, fp
	blx r3
	sub r7, r7, #0x40
	cmp r7, #0
	bgt _020807BC
_020807F0:
	str r8, [sl, #0x1c]
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	mov r1, r6
	mov r2, r8
	bl MI_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02080810: .word _020B2D88
	arm_func_end Dgt_Hash2Update

	arm_func_start Dgt_Hash2GetHash
Dgt_Hash2GetHash: ; 0x02080814
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, [sp, #0x10]
	mov r6, r1
	ldr r3, [r0, #0x1c]
	add r4, r0, #0x20
	tst r3, #3
	mov r2, r3, asr #2
	moveq r0, #0
	streq r0, [r4, r2, lsl #2]
	ldr r1, [sp, #0x10]
	mov r0, #0x80
	add r5, r1, #0x20
	strb r0, [r5, r3]
	add r3, r3, #1
	tst r3, #3
	beq _0208086C
	mov r0, #0
_0208085C:
	strb r0, [r5, r3]
	add r3, r3, #1
	tst r3, #3
	bne _0208085C
_0208086C:
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	ldr r0, [r0, #0x1c]
	cmp r0, #0x38
	blt _020808B8
	cmp r2, #0x10
	bge _0208089C
	mov r0, #0
_0208088C:
	str r0, [r4, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x10
	blt _0208088C
_0208089C:
	ldr r1, _02080A0C ; =_020B2D88
	ldr r0, [sp, #0x10]
	ldr r3, [r1]
	mov r1, r4
	mov r2, #0x40
	blx r3
	mov r2, #0
_020808B8:
	cmp r2, #0xe
	bge _020808D4
	mov r0, #0
_020808C4:
	str r0, [r4, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0xe
	blt _020808C4
_020808D4:
	ldr r0, [sp, #0x10]
	ldr r3, _02080A0C ; =_020B2D88
	ldr r2, [r0, #0x14]
	mov r1, r4
	strb r2, [r5, #0x3f]
	mov r0, r2, lsr #8
	strb r0, [r5, #0x3e]
	mov r0, r2, lsr #0x10
	strb r0, [r5, #0x3d]
	mov r0, r2, lsr #0x18
	strb r0, [r5, #0x3c]
	ldr r0, [sp, #0x10]
	mov r2, #0x40
	ldr r4, [r0, #0x18]
	strb r4, [r5, #0x3b]
	mov r0, r4, lsr #8
	strb r0, [r5, #0x3a]
	mov r0, r4, lsr #0x10
	strb r0, [r5, #0x39]
	mov r0, r4, lsr #0x18
	strb r0, [r5, #0x38]
	ldr r0, [sp, #0x10]
	ldr r3, [r3]
	blx r3
	ldr r0, [sp, #0x10]
	ldr r1, [r0]
	mov r0, r1, lsr #0x18
	strb r0, [r6]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #1]
	mov r0, r1, lsr #8
	strb r0, [r6, #2]
	strb r1, [r6, #3]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #4]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #5]
	mov r0, r1, lsr #8
	strb r0, [r6, #6]
	strb r1, [r6, #7]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #8]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #8]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #9]
	mov r0, r1, lsr #8
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0xc]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #0xc]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #0xd]
	mov r0, r1, lsr #8
	strb r0, [r6, #0xe]
	strb r1, [r6, #0xf]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #0x10]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #0x11]
	mov r0, r1, lsr #8
	strb r0, [r6, #0x12]
	strb r1, [r6, #0x13]
	ldr r3, [sp, #0x10]
	mov r0, #0
	add r1, sp, #0x10
	mov r2, #4
	str r0, [r3, #0x1c]
	bl MTi_CpuClear32
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02080A0C: .word _020B2D88
	arm_func_end Dgt_Hash2GetHash

	arm_func_start Dgt_Hash2CalcHmac
Dgt_Hash2CalcHmac: ; 0x02080A10
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xa0
	ldr lr, _02080A94 ; =_020AEC5C
	add ip, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, ip
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	add lr, sp, #0x38
	add ip, sp, #0x24
	str lr, [sp, #0x10]
	ldr lr, _02080A98 ; =Dgt_Hash2Init
	str ip, [sp, #0x14]
	ldr ip, _02080A9C ; =Dgt_Hash2Update
	str lr, [sp, #0x18]
	ldr lr, _02080AA0 ; =Dgt_Hash2GetHash
	str ip, [sp, #0x1c]
	ldr ip, [sp, #0xb8]
	str lr, [sp, #0x20]
	str ip, [sp]
	mov r3, r5
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r4, [sp, #4]
	bl Dgti_CalcHmac
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02080A94: .word _020AEC5C
_02080A98: .word Dgt_Hash2Init
_02080A9C: .word Dgt_Hash2Update
_02080AA0: .word Dgt_Hash2GetHash
	arm_func_end Dgt_Hash2CalcHmac

	arm_func_start Dgti_CalcHmac
Dgti_CalcHmac: ; 0x02080AA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc0
	ldr r5, [sp, #0xe0]
	ldr r4, [sp, #0xe4]
	mov r8, r1
	movs sb, r0
	mov r7, r2
	cmpne r8, #0
	mov r6, r3
	cmpne r7, #0
	cmpne r6, #0
	cmpne r5, #0
	cmpne r4, #0
	addeq sp, sp, #0xc0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4, #4]
	cmp r5, r0
	ble _02080B24
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r3, [r4, #0x14]
	mov r1, r6
	mov r2, r5
	blx r3
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x18]
	add r1, sp, #0x80
	blx r2
	ldr r5, [r4]
	add r6, sp, #0x80
_02080B24:
	cmp r5, #0
	mov r2, #0
	ble _02080B4C
	add r1, sp, #0x40
_02080B34:
	ldrb r0, [r6, r2]
	add r2, r2, #1
	cmp r2, r5
	eor r0, r0, #0x36
	strb r0, [r1], #1
	blt _02080B34
_02080B4C:
	ldr r0, [r4, #4]
	cmp r2, r0
	bge _02080B78
	add r0, sp, #0x40
	add r3, r0, r2
	mov r1, #0x36
_02080B64:
	strb r1, [r3], #1
	ldr r0, [r4, #4]
	add r2, r2, #1
	cmp r2, r0
	blt _02080B64
_02080B78:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x14]
	add r1, sp, #0x40
	blx r3
	ldr r0, [r4, #8]
	ldr r3, [r4, #0x14]
	mov r1, r8
	mov r2, r7
	blx r3
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x18]
	blx r2
	cmp r5, #0
	mov r3, #0
	ble _02080BE4
	add r1, sp, #0
_02080BCC:
	ldrb r0, [r6, r3]
	add r3, r3, #1
	cmp r3, r5
	eor r0, r0, #0x5c
	strb r0, [r1], #1
	blt _02080BCC
_02080BE4:
	ldr r0, [r4, #4]
	cmp r3, r0
	bge _02080C10
	add r0, sp, #0
	add r2, r0, r3
	mov r1, #0x5c
_02080BFC:
	strb r1, [r2], #1
	ldr r0, [r4, #4]
	add r3, r3, #1
	cmp r3, r0
	blt _02080BFC
_02080C10:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x14]
	add r1, sp, #0
	blx r3
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4]
	ldr r3, [r4, #0x14]
	blx r3
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x18]
	mov r1, sb
	blx r2
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02080C5C: .word 0x00FF00FF
_02080C60: .word 0x5A827999
_02080C64: .word 0x6ED9EBA1
_02080C68: .word 0x8F1BBCDC
_02080C6C: .word 0xCA62C1D6
	arm_func_end Dgti_CalcHmac

	arm_func_start Dgt_Hash2Transform
Dgt_Hash2Transform: ; 0x02080C70
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
	ldmia r0, {r3, sb, sl, fp, ip}
	sub sp, sp, #0x84
	str r2, [sp, #0x80]
_02080C80:
	ldr r8, _02080C60 ; =0x5A827999
	ldr r7, _02080C5C ; =0x00FF00FF
	mov r6, sp
	mov r5, #0
_02080C90:
	ldr r4, [r1], #4
	add r2, r8, ip
	add r2, r2, r3, ror #27
	and lr, r4, r7
	and r4, r7, r4, ror #24
	orr r4, r4, lr, ror #8
	str r4, [r6, #0x40]
	str r4, [r6], #4
	add r2, r2, r4
	eor r4, sl, fp
	and r4, r4, sb
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r5, r5, #4
	cmp r5, #0x40
	blt _02080C90
	mov r7, #0
	mov r6, sp
_02080CF0:
	ldr r2, [r6]
	ldr r5, [r6, #8]
	ldr r4, [r6, #0x20]
	ldr lr, [r6, #0x34]
	eor r2, r2, r5
	eor r4, r4, lr
	eor r2, r2, r4
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor r4, sl, fp
	and r4, r4, sb
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #4
	cmp r7, #0x10
	blt _02080CF0
	ldr r8, _02080C64 ; =0x6ED9EBA1
	mov r7, #0
_02080D60:
	ldr r2, [r6]
	ldr r4, [r6, #8]
	ldr lr, [r6, #0x20]
	ldr r5, [r6, #0x34]
	eor r2, r2, r4
	eor lr, lr, r5
	eor r2, r2, lr
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor lr, sb, sl
	eor lr, lr, fp
	add r2, r2, lr
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #0xc
	moveq r6, sp
	cmp r7, #0x14
	blt _02080D60
	ldr r8, _02080C68 ; =0x8F1BBCDC
	mov r7, #0
_02080DD4:
	ldr r2, [r6]
	ldr lr, [r6, #8]
	ldr r5, [r6, #0x20]
	ldr r4, [r6, #0x34]
	eor r2, r2, lr
	eor r5, r5, r4
	eor r2, r2, r5
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	orr r5, sb, sl
	and r5, r5, fp
	and r4, sb, sl
	orr r5, r5, r4
	add r2, r2, r5
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #8
	moveq r6, sp
	cmp r7, #0x14
	blt _02080DD4
	ldr r8, _02080C6C ; =0xCA62C1D6
	mov r7, #0
_02080E50:
	ldr r2, [r6]
	ldr r5, [r6, #8]
	ldr r4, [r6, #0x20]
	ldr lr, [r6, #0x34]
	eor r2, r2, r5
	eor r4, r4, lr
	eor r2, r2, r4
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor r4, sb, sl
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #4
	moveq r6, sp
	cmp r7, #0x14
	blt _02080E50
	ldmia r0, {r2, r4, r6, r7, lr}
	add r3, r3, r2
	add sb, sb, r4
	add sl, sl, r6
	add fp, fp, r7
	add ip, ip, lr
	stmia r0, {r3, sb, sl, fp, ip}
	ldr lr, [sp, #0x80]
	subs lr, lr, #0x40
	str lr, [sp, #0x80]
	bgt _02080C80
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
	arm_func_end Dgt_Hash2Transform

	arm_func_start CP_SaveContext
CP_SaveContext: ; 0x02080EF0
	ldr r1, _02080F2C ; =0x04000290
	stmdb sp!, {r4}
	ldmia r1, {r2, r3, r4, ip}
	stmia r0!, {r2, r3, r4, ip}
	ldrh ip, [r1, #-0x10]
	add r1, r1, #0x28
	ldmia r1, {r2, r3}
	stmia r0!, {r2, r3}
	and ip, ip, #3
	ldrh r2, [r1, #-8]
	strh ip, [r0]
	and r2, r2, #1
	strh r2, [r0, #2]
	ldmia sp!, {r4}
	bx lr
	.align 2, 0
_02080F2C: .word 0x04000290
	arm_func_end CP_SaveContext

	arm_func_start CPi_RestoreContext
CPi_RestoreContext: ; 0x02080F30
	stmdb sp!, {r4}
	ldr r1, _02080F68 ; =0x04000290
	ldmia r0, {r2, r3, r4, ip}
	stmia r1, {r2, r3, r4, ip}
	ldrh r2, [r0, #0x18]
	ldrh r3, [r0, #0x1a]
	strh r2, [r1, #-0x10]
	strh r3, [r1, #0x20]
	add r0, r0, #0x10
	add r1, r1, #0x28
	ldmia r0, {r2, r3}
	stmia r1, {r2, r3}
	ldmia sp!, {r4}
	bx lr
	.align 2, 0
_02080F68: .word 0x04000290
	arm_func_end CPi_RestoreContext

	arm_func_start TPi_TpCallback
TPi_TpCallback: ; 0x02080F6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r0, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	and r0, r3, #0x7f00
	mov r0, r0, lsl #8
	cmp r2, #0
	mov r0, r0, lsr #0x10
	beq _02080FC8
	ldr r1, _020811E4 ; =_022BB670
	mov r2, #1
	ldrh r3, [r1, #0x38]
	orr r2, r3, r2, lsl r0
	strh r2, [r1, #0x38]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, #4
	mov r2, #0
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02080FC8:
	cmp r0, #0x10
	bne _02081080
	ldr r1, _020811E4 ; =_022BB670
	ldrh r2, [r1, #0x10]
	add r2, r2, #1
	strh r2, [r1, #0x10]
	ldrh r3, [r1, #0x10]
	ldrh r2, [r1, #0x18]
	cmp r3, r2
	movhs r2, #0
	strhsh r2, [r1, #0x10]
	ldr r2, _020811E8 ; =0x027FFFAA
	ldr r1, _020811E4 ; =_022BB670
	ldrh r3, [r2]
	ldrh r2, [r2, #2]
	ldrh lr, [r1, #0x10]
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	ldr r5, [sp, #4]
	ldr r7, [r1, #0x14]
	mov r2, r5, lsl #7
	mov r3, r2, lsr #0x1f
	mov r4, r5, lsl #8
	mov r2, r5, lsl #5
	mov ip, r5, lsl #0x14
	mov r2, r2, lsr #0x1e
	mov r6, lr, lsl #3
	mov r5, ip, lsr #0x14
	strh r5, [r7, r6]
	add r5, r7, lr, lsl #3
	mov r4, r4, lsr #0x14
	strh r4, [r5, #2]
	and r3, r3, #0xff
	strh r3, [r5, #4]
	and r2, r2, #0xff
	strh r2, [r5, #6]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r2, [r1, #0x10]
	mov r1, #0
	and r2, r2, #0xff
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02081080:
	tst r1, #0x1000000
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r1, r3, #0xff
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _020811D8
_0208109C: ; jump table
	b _020810B0 ; case 0
	b _020811D8 ; case 1
	b _02081184 ; case 2
	b _0208118C ; case 3
	b _0208117C ; case 4
_020810B0:
	cmp r0, #0
	beq _020810D4
	cmp r0, #1
	beq _02081134
	cmp r0, #2
	ldreq r1, _020811E4 ; =_022BB670
	moveq r2, #0
	streqh r2, [r1, #0x36]
	b _02081140
_020810D4:
	ldr r2, _020811E8 ; =0x027FFFAA
	ldr r1, _020811E4 ; =_022BB670
	ldrh r4, [r2]
	ldrh r3, [r2, #2]
	mov r2, #0
	strh r4, [sp]
	strh r3, [sp, #2]
	ldr r4, [sp]
	mov r3, r4, lsl #0x14
	mov r5, r3, lsr #0x14
	mov lr, r4, lsl #8
	mov r3, r4, lsl #7
	mov ip, r3, lsr #0x1f
	mov r3, r4, lsl #5
	mov r3, r3, lsr #0x1e
	strh r5, [r1, #8]
	mov lr, lr, lsr #0x14
	strh lr, [r1, #0xa]
	and ip, ip, #0xff
	strh ip, [r1, #0xc]
	and r3, r3, #0xff
	strh r3, [r1, #0xe]
	strh r2, [r1, #0x36]
	b _02081140
_02081134:
	ldr r1, _020811E4 ; =_022BB670
	mov r2, #2
	strh r2, [r1, #0x36]
_02081140:
	ldr r1, _020811E4 ; =_022BB670
	mov r2, #1
	ldrh r3, [r1, #0x3a]
	mvn r2, r2, lsl r0
	and r2, r3, r2
	strh r2, [r1, #0x3a]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, #0
	mov r2, r1
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0208117C:
	mov r4, #3
	b _02081190
_02081184:
	mov r4, #1
	b _02081190
_0208118C:
	mov r4, #2
_02081190:
	ldr r1, _020811E4 ; =_022BB670
	mov ip, #1
	ldrh r3, [r1, #0x38]
	mvn r2, ip, lsl r0
	orr r3, r3, ip, lsl r0
	strh r3, [r1, #0x38]
	ldrh r3, [r1, #0x3a]
	and r2, r3, r2
	strh r2, [r1, #0x3a]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r1, r4, #0xff
	mov r2, #0
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020811D8:
	bl WaitForever2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020811E4: .word _022BB670
_020811E8: .word 0x027FFFAA
	arm_func_end TPi_TpCallback

	arm_func_start TP_Init
TP_Init: ; 0x020811EC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0208125C ; =_022BB670
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	bl PXI_Init
	ldr r0, _0208125C ; =_022BB670
	mov r1, #0
	strh r1, [r0, #0x10]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	strh r1, [r0, #0x36]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	mov r5, #6
	mov r4, #1
_02081238:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _02081238
	ldr r1, _02081260 ; =_02080F6C
	mov r0, #6
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0208125C: .word _022BB670
_02081260: .word TPi_TpCallback
	arm_func_end TP_Init

	arm_func_start TP_GetUserInfo
TP_GetUserInfo: ; 0x02081264
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	ldr ip, _020812F4 ; =0x027FFC80
	mov r4, r0
	ldrh r1, [ip, #0x58]
	ldrh r2, [ip, #0x5a]
	ldrh r0, [ip, #0x5e]
	cmp r1, #0
	ldrh lr, [ip, #0x60]
	cmpeq r0, #0
	cmpeq r2, #0
	ldrb r3, [ip, #0x5c]
	ldrb r5, [ip, #0x5d]
	ldrb r6, [ip, #0x62]
	ldrb ip, [ip, #0x63]
	cmpeq lr, #0
	beq _020812C8
	str r5, [sp]
	stmib sp, {r0, lr}
	str r6, [sp, #0xc]
	mov r0, r4
	str ip, [sp, #0x10]
	bl TP_CalcCalibrateParam
	cmp r0, #0
	beq _020812E8
_020812C8:
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	add sp, sp, #0x14
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, pc}
_020812E8:
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020812F4: .word 0x027FFC80
	arm_func_end TP_GetUserInfo

	arm_func_start TP_SetCalibrateParam
TP_SetCalibrateParam: ; 0x020812F8
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02081314
	ldr r0, _02081414 ; =_022BB670
	mov r1, #0
	strh r1, [r0, #0x34]
	ldmia sp!, {r4, pc}
_02081314:
	bl EnableIrqFlag
	ldrsh r2, [r4, #4]
	cmp r2, #0
	beq _02081378
	ldr r3, _02081418 ; =0x04000280
	mov r1, #0
	strh r1, [r3]
	mov r1, #0x10000000
	str r1, [r3, #0x10]
	str r2, [r3, #0x18]
	mov r1, #0
	str r1, [r3, #0x1c]
	ldrsh r2, [r4]
	ldr r1, _02081414 ; =_022BB670
	str r2, [r1, #0x1c]
	ldrsh r2, [r4, #4]
	str r2, [r1, #0x20]
_02081358:
	ldrh r1, [r3]
	tst r1, #0x8000
	bne _02081358
	ldr r2, _0208141C ; =0x040002A0
	ldr r1, _02081414 ; =_022BB670
	ldr r2, [r2]
	str r2, [r1, #0x24]
	b _0208138C
_02081378:
	ldr r1, _02081414 ; =_022BB670
	mov r2, #0
	str r2, [r1, #0x1c]
	str r2, [r1, #0x20]
	str r2, [r1, #0x24]
_0208138C:
	ldrsh r2, [r4, #6]
	cmp r2, #0
	beq _020813EC
	ldr r3, _02081418 ; =0x04000280
	mov r1, #0
	strh r1, [r3]
	mov r1, #0x10000000
	str r1, [r3, #0x10]
	str r2, [r3, #0x18]
	mov r1, #0
	str r1, [r3, #0x1c]
	ldrsh r2, [r4, #2]
	ldr r1, _02081414 ; =_022BB670
	str r2, [r1, #0x28]
	ldrsh r2, [r4, #6]
	str r2, [r1, #0x2c]
_020813CC:
	ldrh r1, [r3]
	tst r1, #0x8000
	bne _020813CC
	ldr r2, _0208141C ; =0x040002A0
	ldr r1, _02081414 ; =_022BB670
	ldr r2, [r2]
	str r2, [r1, #0x30]
	b _02081400
_020813EC:
	ldr r1, _02081414 ; =_022BB670
	mov r2, #0
	str r2, [r1, #0x28]
	str r2, [r1, #0x2c]
	str r2, [r1, #0x30]
_02081400:
	bl SetIrqFlag
	ldr r0, _02081414 ; =_022BB670
	mov r1, #1
	strh r1, [r0, #0x34]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02081414: .word _022BB670
_02081418: .word 0x04000280
_0208141C: .word 0x040002A0
	arm_func_end TP_SetCalibrateParam

	arm_func_start TP_RequestSamplingAsync
TP_RequestSamplingAsync: ; 0x02081420
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	mov r0, #6
	mov r1, #0x3000000
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	bne _02081488
	mov r0, r4
	bl SetIrqFlag
	ldr r0, _020814B0 ; =_022BB670
	ldrh r1, [r0, #0x38]
	orr r1, r1, #1
	strh r1, [r0, #0x38]
	ldr r3, [r0, #4]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r2, r0
	mov r1, #4
	blx r3
	ldmia sp!, {r4, pc}
_02081488:
	ldr r1, _020814B0 ; =_022BB670
	mov r0, r4
	ldrh r2, [r1, #0x3a]
	orr r2, r2, #1
	strh r2, [r1, #0x3a]
	ldrh r2, [r1, #0x38]
	bic r2, r2, #1
	strh r2, [r1, #0x38]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_020814B0: .word _022BB670
	arm_func_end TP_RequestSamplingAsync

	arm_func_start TP_GetCalibratedResult
TP_GetCalibratedResult: ; 0x020814B4
	stmdb sp!, {r3, lr}
	ldr r2, _020814FC ; =_022BB670
	ldrh r1, [r2, #0x38]
	tst r1, #1
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldrh ip, [r2, #8]
	ldrh r3, [r2, #0xa]
	mov r1, r0
	strh ip, [r0]
	strh r3, [r0, #2]
	ldrh r3, [r2, #0xc]
	ldrh r2, [r2, #0xe]
	strh r3, [r0, #4]
	strh r2, [r0, #6]
	bl TP_GetCalibratedPoint
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020814FC: .word _022BB670
	arm_func_end TP_GetCalibratedResult

	arm_func_start TP_WaitCalibratedResult
TP_WaitCalibratedResult: ; 0x02081500
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl TP_WaitBusy
	mov r0, r4
	bl TP_GetCalibratedResult
	ldmia sp!, {r4, pc}
	arm_func_end TP_WaitCalibratedResult

	arm_func_start TP_RequestAutoSamplingStartAsync
TP_RequestAutoSamplingStartAsync: ; 0x0208151C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _02081618 ; =_022BB670
	mov lr, #0
	str r2, [ip, #0x14]
	mov r5, r1
	strh lr, [ip, #0x10]
	strh r5, [ip, #0x12]
	mov r4, r0
	strh r3, [ip, #0x18]
	cmp r3, #0
	bls _02081564
	mov r1, lr
_0208154C:
	ldr r0, [ip, #0x14]
	add r0, r0, lr, lsl #3
	add lr, lr, #1
	strh r1, [r0, #4]
	cmp lr, r3
	blo _0208154C
_02081564:
	bl EnableIrqFlag
	and r1, r5, #0xff
	orr r1, r1, #0x100
	mov r5, r0
	orr r1, r1, #0x2000000
	mov r0, #6
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	blt _020815B0
	orr r1, r4, #0x10000
	orr r1, r1, #0x1000000
	mov r0, #6
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	movge r0, #1
_020815B0:
	tst r0, #0xff
	bne _020815F0
	mov r0, r5
	bl SetIrqFlag
	ldr r0, _02081618 ; =_022BB670
	ldrh r1, [r0, #0x38]
	orr r1, r1, #2
	strh r1, [r0, #0x38]
	ldr r3, [r0, #4]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r1, #4
	mov r2, #0
	blx r3
	ldmia sp!, {r3, r4, r5, pc}
_020815F0:
	ldr r1, _02081618 ; =_022BB670
	mov r0, r5
	ldrh r2, [r1, #0x3a]
	orr r2, r2, #2
	strh r2, [r1, #0x3a]
	ldrh r2, [r1, #0x38]
	bic r2, r2, #2
	strh r2, [r1, #0x38]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02081618: .word _022BB670
	arm_func_end TP_RequestAutoSamplingStartAsync

	arm_func_start sub_0208161C
sub_0208161C: ; 0x0208161C
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	ldr r1, _020816AC ; =0x03000200
	mov r0, #6
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	bne _02081684
	mov r0, r4
	bl SetIrqFlag
	ldr r0, _020816B0 ; =_022BB670
	ldrh r1, [r0, #0x38]
	orr r1, r1, #4
	strh r1, [r0, #0x38]
	ldr r3, [r0, #4]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #2
	mov r1, #4
	mov r2, #0
	blx r3
	ldmia sp!, {r4, pc}
_02081684:
	ldr r1, _020816B0 ; =_022BB670
	mov r0, r4
	ldrh r2, [r1, #0x3a]
	orr r2, r2, #4
	strh r2, [r1, #0x3a]
	ldrh r2, [r1, #0x38]
	bic r2, r2, #4
	strh r2, [r1, #0x38]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_020816AC: .word 0x03000200
_020816B0: .word _022BB670
	arm_func_end sub_0208161C

	arm_func_start TP_GetLatestIndexInAuto
TP_GetLatestIndexInAuto: ; 0x020816B4
	ldr r0, _020816C0 ; =_022BB670
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_020816C0: .word _022BB670
	arm_func_end TP_GetLatestIndexInAuto

	arm_func_start TP_CalcCalibrateParam
TP_CalcCalibrateParam: ; 0x020816C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r2
	cmp sb, #0x1000
	cmplo r8, #0x1000
	ldrloh r4, [sp, #0x2c]
	mov r7, r3
	mov sl, r0
	cmplo r4, #0x1000
	ldrloh r3, [sp, #0x30]
	cmplo r3, #0x1000
	movhs r0, #1
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0x100
	ldrloh r2, [sp, #0x34]
	cmplo r2, #0x100
	ldrloh r1, [sp, #0x28]
	cmplo r1, #0xc0
	ldrloh r0, [sp, #0x38]
	cmplo r0, #0xc0
	movhs r0, #1
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, r2
	cmpne r1, r0
	cmpne sb, r4
	cmpne r8, r3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl EnableIrqFlag
	ldrh lr, [sp, #0x2c]
	ldrh ip, [sp, #0x34]
	ldr r3, _020818A8 ; =0x04000280
	sub r1, sb, lr
	mov r2, #0
	ldrh r4, [sp, #0x38]
	ldrh r5, [sp, #0x28]
	ldrh r6, [sp, #0x30]
	strh r2, [r3]
	mov r1, r1, lsl #8
	str r1, [r3, #0x10]
	sub r1, r7, ip
	str r1, [r3, #0x18]
	mov r1, r2
	sub r2, r5, r4
	str r1, [r3, #0x1c]
	sub r1, r8, r6
	str r2, [sp]
_02081780:
	ldrh r2, [r3]
	tst r2, #0x8000
	bne _02081780
	mov fp, r1, lsl #8
	ldr r1, _020818AC ; =0x040002A0
	ldr r2, [r1]
	mov r1, #0
	strh r1, [r3]
	ldr r1, _020818AC ; =0x040002A0
	cmp r2, #0x8000
	str fp, [r1, #-0x10]
	sub r3, r1, #8
	ldr r1, [sp]
	mov fp, #0
	stmia r3, {r1, fp}
	bge _020817D0
	mov r1, fp
	sub r1, r1, #0x8000
	cmp r2, r1
	bge _020817DC
_020817D0:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020817DC:
	strh r2, [sl, #4]
	ldrsh r2, [sl, #4]
	add r1, r7, ip
	add r3, sb, lr
	mul r1, r2, r1
	rsb r1, r1, r3, lsl #8
	mov r1, r1, lsl #9
	mov r2, r1, asr #0x10
	cmp r2, #0x8000
	bge _02081814
	mov r1, fp
	sub r1, r1, #0x8000
	cmp r2, r1
	bge _02081820
_02081814:
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02081820:
	ldr r1, _020818AC ; =0x040002A0
	strh r2, [sl]
	sub r2, r1, #0x20
_0208182C:
	ldrh r1, [r2]
	tst r1, #0x8000
	bne _0208182C
	ldr r1, _020818AC ; =0x040002A0
	ldr r7, [r1]
	bl SetIrqFlag
	cmp r7, #0x8000
	bge _0208185C
	mov r1, #0x8000
	rsb r1, r1, #0
	cmp r7, r1
	bge _02081864
_0208185C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02081864:
	strh r7, [sl, #6]
	ldrsh r2, [sl, #6]
	add r0, r5, r4
	add r3, r8, r6
	mul r0, r2, r0
	rsb r0, r0, r3, lsl #8
	mov r0, r0, lsl #9
	mov r0, r0, asr #0x10
	cmp r0, #0x8000
	bge _02081894
	cmp r0, r1
	bge _0208189C
_02081894:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208189C:
	strh r0, [sl, #2]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020818A8: .word 0x04000280
_020818AC: .word 0x040002A0
	arm_func_end TP_CalcCalibrateParam

	arm_func_start TP_GetCalibratedPoint
TP_GetCalibratedPoint: ; 0x020818B0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020819CC ; =_022BB670
	ldrh r2, [r2, #0x34]
	cmp r2, #0
	bne _020818E8
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	strh r3, [r0]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldmia sp!, {r4, r5, r6, pc}
_020818E8:
	ldrh r3, [r1, #4]
	ldr r2, _020819D0 ; =_022BB68C
	strh r3, [r0, #4]
	ldrh r3, [r1, #6]
	strh r3, [r0, #6]
	ldrh r3, [r1, #4]
	cmp r3, #0
	bne _02081918
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldmia sp!, {r4, r5, r6, pc}
_02081918:
	ldrh r4, [r1]
	ldr r3, [r2]
	ldr lr, [r2, #8]
	mov r4, r4, lsl #2
	subs ip, r4, r3
	mov r3, r3, asr #0x1f
	rsc r3, r3, r4, asr #31
	umull r6, r5, lr, ip
	mla r5, lr, r3, r5
	mov r3, lr, asr #0x1f
	mla r5, r3, ip, r5
	mov r3, r6, lsr #0x16
	orr r3, r3, r5, lsl #10
	strh r3, [r0]
	ldrsh r3, [r0]
	cmp r3, #0
	movlt r3, #0
	strlth r3, [r0]
	blt _02081970
	cmp r3, #0xff
	movgt r3, #0xff
	strgth r3, [r0]
_02081970:
	ldrh r3, [r1, #2]
	ldr r1, [r2, #0xc]
	ldr ip, [r2, #0x14]
	mov r2, r3, lsl #2
	subs r3, r2, r1
	mov r1, r1, asr #0x1f
	rsc r1, r1, r2, asr #31
	umull r4, lr, ip, r3
	mla lr, ip, r1, lr
	mov r1, ip, asr #0x1f
	mla lr, r1, r3, lr
	mov r1, r4, lsr #0x16
	orr r1, r1, lr, lsl #10
	strh r1, [r0, #2]
	ldrsh r1, [r0, #2]
	cmp r1, #0
	movlt r1, #0
	strlth r1, [r0, #2]
	ldmltia sp!, {r4, r5, r6, pc}
	cmp r1, #0xbf
	movgt r1, #0xbf
	strgth r1, [r0, #2]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020819CC: .word _022BB670
_020819D0: .word _022BB68C
	arm_func_end TP_GetCalibratedPoint

	arm_func_start TP_WaitBusy
TP_WaitBusy: ; 0x020819D4
	ldr r1, _020819E8 ; =_022BB670
_020819D8:
	ldrh r2, [r1, #0x3a]
	tst r2, r0
	bne _020819D8
	bx lr
	.align 2, 0
_020819E8: .word _022BB670
	arm_func_end TP_WaitBusy

	arm_func_start TP_CheckBusy
TP_CheckBusy: ; 0x020819EC
	ldr r1, _020819FC ; =_022BB670
	ldrh r1, [r1, #0x38]
	and r0, r1, r0
	bx lr
	.align 2, 0
_020819FC: .word _022BB670
	arm_func_end TP_CheckBusy

	arm_func_start PMi_Lock
PMi_Lock: ; 0x02081A00
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r1, _02081A38 ; =_022BB6AC
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	beq _02081A24
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, pc}
_02081A24:
	mov r2, #1
	str r2, [r1, #0x1c]
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081A38: .word _022BB6AC
	arm_func_end PMi_Lock

	arm_func_start PMi_WaitBusy
PMi_WaitBusy: ; 0x02081A3C
	stmdb sp!, {r4, lr}
	ldr r0, _02081A74 ; =_022BB6AC
	ldr r4, _02081A78 ; =_022BB6C8
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
_02081A54:
	bl GetIrqFlag
	cmp r0, #0x80
	bne _02081A64
	bl PXIi_HandlerRecvFifoNotEmpty
_02081A64:
	ldr r0, [r4]
	cmp r0, #0
	bne _02081A54
	ldmia sp!, {r4, pc}
	.align 2, 0
_02081A74: .word _022BB6AC
_02081A78: .word _022BB6C8
	arm_func_end PMi_WaitBusy

	arm_func_start PMi_DummyCallback
PMi_DummyCallback: ; 0x02081A7C
	str r0, [r1]
	bx lr
	arm_func_end PMi_DummyCallback

	arm_func_start PMi_CallCallbackAndUnlock
PMi_CallCallbackAndUnlock: ; 0x02081A84
	stmdb sp!, {r3, lr}
	ldr r2, _02081AC0 ; =_022BB6AC
	ldr r1, [r2, #0x1c]
	ldr ip, [r2, #0x20]
	cmp r1, #0
	ldr r1, [r2, #0x24]
	movne r3, #0
	strne r3, [r2, #0x1c]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _02081AC0 ; =_022BB6AC
	mov r3, #0
	str r3, [r2, #0x20]
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081AC0: .word _022BB6AC
	arm_func_end PMi_CallCallbackAndUnlock

	arm_func_start PM_Init
PM_Init: ; 0x02081AC4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02081B54 ; =_022BB6AC
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	bl PXI_Init
	mov r5, #8
	mov r4, #1
_02081AF8:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _02081AF8
	ldr r1, _02081B58 ; =PMi_CommonCallback
	mov r0, #8
	bl PXI_SetFifoRecvCallback
	mov r3, #0
	ldr r0, _02081B5C ; =_022BB6F0
	mov r2, r3
_02081B24:
	mov r1, r3, lsl #3
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #5
	blt _02081B24
	ldr r0, _02081B60 ; =_022BB6D8
	bl OS_InitMutex
	ldr r1, _02081B64 ; =0x027FFC3C
	ldr r0, _02081B54 ; =_022BB6AC
	ldr r1, [r1]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02081B54: .word _022BB6AC
_02081B58: .word PMi_CommonCallback
_02081B5C: .word _022BB6F0
_02081B60: .word _022BB6D8
_02081B64: .word 0x027FFC3C
	arm_func_end PM_Init

	arm_func_start PMi_CommonCallback
PMi_CommonCallback: ; 0x02081B68
	stmdb sp!, {r3, lr}
	cmp r2, #0
	beq _02081B80
	mov r0, #2
	bl PMi_CallCallbackAndUnlock
	ldmia sp!, {r3, pc}
_02081B80:
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r2, r0, lsr #0x10
	and r0, r1, #0xff
	cmp r2, #0x70
	blo _02081BD0
	cmp r2, #0x74
	bhi _02081BD0
	ldr r1, _02081C24 ; =_022BB6F4
	sub r2, r2, #0x70
	ldr r1, [r1, r2, lsl #3]
	and r0, r0, #0xff
	cmp r1, #0
	strneh r0, [r1]
	mov r1, r2, lsl #3
	ldr r0, _02081C28 ; =_022BB6F0
	mov r2, #1
	strh r2, [r0, r1]
	mov r0, #0
	b _02081C1C
_02081BD0:
	cmp r2, #0x60
	bne _02081BE8
	ldr r1, _02081C2C ; =_022BB6AC
	mov r2, #1
	str r2, [r1, #4]
	b _02081C1C
_02081BE8:
	cmp r2, #0x62
	bne _02081C00
	ldr r1, _02081C2C ; =_022BB6AC
	mov r2, #1
	str r2, [r1, #8]
	b _02081C1C
_02081C00:
	cmp r2, #0x67
	bne _02081C1C
	ldr r1, _02081C2C ; =_022BB6AC
	ldr r1, [r1, #0x28]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
_02081C1C:
	bl PMi_CallCallbackAndUnlock
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081C24: .word _022BB6F4
_02081C28: .word _022BB6F0
_02081C2C: .word _022BB6AC
	arm_func_end PMi_CommonCallback

	arm_func_start PMi_SendSleepStart
PMi_SendSleepStart: ; 0x02081C30
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _02081CB8 ; =_022BB6AC
	mov r2, #0
	ldr r0, _02081CBC ; =0x03006000
	str r2, [r1, #4]
	bl PMi_SendPxiData
	ldr r0, _02081CB8 ; =_022BB6AC
_02081C64:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02081C64
	ldr ip, _02081CB8 ; =_022BB6AC
	mov r0, #0
	str r0, [ip, #4]
	mov r2, r0
	mov r1, #2
	mov r3, #1
	str r0, [ip, #8]
	bl PMi_SetLcdPower
	and r0, r5, #0xff
	orr r0, r0, #0x6100
	orr r0, r0, #0x2000000
	bl PMi_SendPxiData
	ldr r1, _02081CC0 ; =0x01010000
	mov r0, r4, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02081CB8: .word _022BB6AC
_02081CBC: .word 0x03006000
_02081CC0: .word 0x01010000
	arm_func_end PMi_SendSleepStart

	arm_func_start PM_SendUtilityCommandAsync
PM_SendUtilityCommandAsync: ; 0x02081CC4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6, lsr #0x10
	and r0, r0, #0xff
	ldr r1, _02081D1C ; =_022BB6AC
	orr r0, r0, #0x6300
	str r5, [r1, #0x20]
	orr r0, r0, #0x2000000
	str r4, [r1, #0x24]
	bl PMi_SendPxiData
	ldr r1, _02081D20 ; =0x01010000
	mov r0, r6, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02081D1C: .word _022BB6AC
_02081D20: .word 0x01010000
	arm_func_end PM_SendUtilityCommandAsync

	arm_func_start PMi_ReadRegisterAsync
PMi_ReadRegisterAsync: ; 0x02081D24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _02081D84 ; =_022BB6AC
	and r0, r5, #0xff
	str r7, [r1, #0x20]
	orr r0, r0, #0x6500
	ldr r2, _02081D88 ; =_022BB6F0
	str r6, [r1, #0x24]
	mov r3, r5, lsl #3
	mov ip, #0
	ldr r1, _02081D8C ; =_022BB6F4
	strh ip, [r2, r3]
	orr r0, r0, #0x3000000
	str r4, [r1, r5, lsl #3]
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02081D84: .word _022BB6AC
_02081D88: .word _022BB6F0
_02081D8C: .word _022BB6F4
	arm_func_end PMi_ReadRegisterAsync

	arm_func_start PMi_ReadRegister
PMi_ReadRegister: ; 0x02081D90
	stmdb sp!, {r3, lr}
	ldr r2, _02081DB4 ; =_02081A7C
	add r3, sp, #0
	bl PMi_ReadRegisterAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081DB4: .word PMi_DummyCallback
	arm_func_end PMi_ReadRegister

	arm_func_start PMi_WriteRegisterAsync
PMi_WriteRegisterAsync: ; 0x02081DB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r0, r7, #0xff
	ldr r1, _02081E10 ; =_022BB6AC
	orr r0, r0, #0x6400
	str r5, [r1, #0x20]
	orr r0, r0, #0x2000000
	str r4, [r1, #0x24]
	bl PMi_SendPxiData
	ldr r1, _02081E14 ; =0x01010000
	mov r0, r6, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02081E10: .word _022BB6AC
_02081E14: .word 0x01010000
	arm_func_end PMi_WriteRegisterAsync

	arm_func_start PMi_WriteRegister
PMi_WriteRegister: ; 0x02081E18
	stmdb sp!, {r3, lr}
	ldr r2, _02081E3C ; =_02081A7C
	add r3, sp, #0
	bl PMi_WriteRegisterAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081E3C: .word PMi_DummyCallback
	arm_func_end PMi_WriteRegister

	arm_func_start PMi_SetLedAsync
PMi_SetLedAsync: ; 0x02081E40
	stmdb sp!, {r3, lr}
	cmp r0, #1
	beq _02081E60
	cmp r0, #2
	beq _02081E70
	cmp r0, #3
	beq _02081E68
	b _02081E78
_02081E60:
	mov r0, #1
	b _02081E7C
_02081E68:
	mov r0, #2
	b _02081E7C
_02081E70:
	mov r0, #3
	b _02081E7C
_02081E78:
	mov r0, #0
_02081E7C:
	cmp r0, #0
	ldreq r0, _02081E90 ; =0x0000FFFF
	ldmeqia sp!, {r3, pc}
	bl PM_SendUtilityCommandAsync
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081E90: .word 0x0000FFFF
	arm_func_end PMi_SetLedAsync

	arm_func_start PMi_SetLed
PMi_SetLed: ; 0x02081E94
	stmdb sp!, {r3, lr}
	ldr r1, _02081EB8 ; =_02081A7C
	add r2, sp, #0
	bl PMi_SetLedAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081EB8: .word PMi_DummyCallback
	arm_func_end PMi_SetLed

	arm_func_start PM_SetBackLightAsync
PM_SetBackLightAsync: ; 0x02081EBC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	mov ip, #0
	bne _02081EE0
	cmp r1, #1
	moveq ip, #6
	cmp r1, #0
	moveq ip, #7
	b _02081F14
_02081EE0:
	cmp r0, #1
	bne _02081EFC
	cmp r1, #1
	moveq ip, #4
	cmp r1, #0
	moveq ip, #5
	b _02081F14
_02081EFC:
	cmp r0, #2
	bne _02081F14
	cmp r1, #1
	moveq ip, #8
	cmp r1, #0
	moveq ip, #9
_02081F14:
	cmp ip, #0
	ldreq r0, _02081F34 ; =0x0000FFFF
	ldmeqia sp!, {r3, pc}
	mov r1, r2
	mov r0, ip
	mov r2, r3
	bl PM_SendUtilityCommandAsync
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081F34: .word 0x0000FFFF
	arm_func_end PM_SetBackLightAsync

	arm_func_start PM_SetBackLight
PM_SetBackLight: ; 0x02081F38
	stmdb sp!, {r3, lr}
	ldr r2, _02081F5C ; =_02081A7C
	add r3, sp, #0
	bl PM_SetBackLightAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081F5C: .word PMi_DummyCallback
	arm_func_end PM_SetBackLight

	arm_func_start PM_ForceToPowerOffAsync
PM_ForceToPowerOffAsync: ; 0x02081F60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r0, _02082008 ; =0x00996A00
	mov r6, r1
	bl OS_SpinWait
	bl PM_GetLcdPower
	cmp r0, #1
	beq _02081FF0
	add r0, sp, #4
	add r1, sp, #0
	bl PM_GetBackLight
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02081FA8
	mov r0, #0
	mov r1, r0
	bl PM_SetBackLight
_02081FA8:
	ldr r0, [sp]
	cmp r0, #0
	beq _02081FC0
	mov r0, #1
	mov r1, #0
	bl PM_SetBackLight
_02081FC0:
	mov r0, #1
	bl PM_SetLcdPower
	cmp r0, #0
	bne _02081FF0
	ldr r5, _02082008 ; =0x00996A00
	mov r4, #1
_02081FD8:
	mov r0, r5
	bl OS_SpinWait
	mov r0, r4
	bl PM_SetLcdPower
	cmp r0, #0
	beq _02081FD8
_02081FF0:
	mov r1, r7
	mov r2, r6
	mov r0, #0xe
	bl PM_SendUtilityCommandAsync
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02082008: .word 0x00996A00
	arm_func_end PM_ForceToPowerOffAsync

	arm_func_start PM_ForceToPowerOff
PM_ForceToPowerOff: ; 0x0208200C
	stmdb sp!, {r3, lr}
	ldr r0, _02082030 ; =_02081A7C
	add r1, sp, #0
	bl PM_ForceToPowerOffAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082030: .word PMi_DummyCallback
	arm_func_end PM_ForceToPowerOff

	arm_func_start PMi_SetAmp
PMi_SetAmp: ; 0x02082034
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl PM_GetLcdPower
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #2
	bl PMi_WriteRegister
	ldmia sp!, {r4, pc}
	arm_func_end PMi_SetAmp

	arm_func_start PM_GetBackLight
PM_GetBackLight: ; 0x02082060
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	add r1, sp, #0
	mov r0, #0
	bl PMi_ReadRegister
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	beq _0208209C
	ldrh r1, [sp]
	tst r1, #8
	movne r1, #1
	moveq r1, #0
	str r1, [r5]
_0208209C:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r1, [sp]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end PM_GetBackLight

	arm_func_start PMi_SendPxiData
PMi_SendPxiData: ; 0x020820BC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #8
	mov r4, #0
_020820CC:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _020820CC
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end PMi_SendPxiData

	arm_func_start sub_020820E8
sub_020820E8: ; 0x020820E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r3, _0208230C ; =_022BB6AC
	mov sl, r0
	ldr r0, [r3, #0xc]
	mov sb, r1
	mov fp, r2
	mov r4, #0
	bl PMi_ExecuteList
	ldr r1, _02082310 ; =0x04000208
	mov r0, r4
	ldrh r8, [r1]
	strh r0, [r1]
	bl EnableIrqFlag
	str r0, [sp, #8]
	ldr r0, _02082314 ; =0x003FFFFF
	bl OS_DisableIrqMask
	str r0, [sp, #4]
	bl OS_IsTickAvailable
	cmp r0, #0
	movne r0, #8
	moveq r0, r4
	orr r0, r0, #0x40000
	bl OS_SetIrqMask
	ldr r0, [sp, #8]
	bl SetIrqFlag
	ldr r2, _02082310 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	tst sl, #8
	strh r0, [r2]
	beq _02082178
	ldr r0, _02082318 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	biceq sl, sl, #8
_02082178:
	tst sl, #0x10
	beq _0208218C
	bl Ctrdg_IsExisting
	cmp r0, #0
	biceq sl, sl, #0x10
_0208218C:
	mov r1, #0x4000000
	add r0, r1, #0x1000
	ldr r5, [r1]
	ldr r6, [r0]
	bl PM_GetLcdPower
	str r0, [sp]
	add r0, sp, #0x14
	add r1, sp, #0x10
	bl PM_GetBackLight
	mov r0, #2
	mov r1, #0
	bl PM_SetBackLight
	ldr r2, _0208231C ; =0x027FFC3C
	ldr r0, [r2]
	str r0, [sp, #0xc]
_020821C8:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _020821C8
	ldr r0, [r2]
	mov r2, #0x4000000
	str r0, [sp, #0xc]
	ldr r0, [r2]
	add r1, r2, #0x1000
	bic r0, r0, #0x30000
	str r0, [r2]
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	ldr r2, _0208231C ; =0x027FFC3C
_02082204:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _02082204
	ldr r0, [r2]
	str r0, [sp, #0xc]
	ldr r2, _0208231C ; =0x027FFC3C
_02082220:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _02082220
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	orr r0, sl, r0, lsl #5
	orr r0, r0, r1, lsl #6
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	orr r0, sb, fp
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
_02082254:
	mov r0, r7
	mov r1, sb
	bl PMi_SendSleepStart
	cmp r0, #0
	bne _02082254
	bl WaitForInterrupt
	tst sl, #8
	beq _02082284
	ldr r0, _02082320 ; =0x04000214
	ldr r0, [r0]
	tst r0, #0x100000
	movne r4, #1
_02082284:
	cmp r4, #0
	bne _020822C4
	ldr r0, [sp]
	cmp r0, #1
	mov r0, #1
	bne _020822B0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl PMi_SetLcdPower
	b _020822B4
_020822B0:
	bl PMi_SetLed
_020822B4:
	mov r0, #0x4000000
	str r5, [r0]
	add r0, r0, #0x1000
	str r6, [r0]
_020822C4:
	ldr r0, _02082324 ; =0x00708100
	bl OS_SpinWait
	bl EnableIrqFlag
	ldr r0, [sp, #4]
	bl OS_SetIrqMask
	ldr r0, [sp, #8]
	bl SetIrqFlag
	ldr r1, _02082310 ; =0x04000208
	cmp r4, #0
	ldrh r0, [r1]
	strh r8, [r1]
	beq _020822F8
	bl PM_ForceToPowerOff
_020822F8:
	ldr r0, _0208230C ; =_022BB6AC
	ldr r0, [r0, #0x18]
	bl PMi_ExecuteList
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208230C: .word _022BB6AC
_02082310: .word 0x04000208
_02082314: .word 0x003FFFFF
_02082318: .word 0x027FFC40
_0208231C: .word 0x027FFC3C
_02082320: .word 0x04000214
_02082324: .word 0x00708100
	arm_func_end sub_020820E8

	arm_func_start PMi_SetLcdPower
PMi_SetLcdPower: ; 0x02082328
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r3
	cmp r0, #0
	beq _020823B8
	cmp r0, #1
	bne _0208240C
	cmp r2, #0
	bne _0208236C
	ldr r1, _02082414 ; =0x027FFC3C
	ldr r0, _02082418 ; =_022BB6AC
	ldr r1, [r1]
	ldr r0, [r0, #0x10]
	sub r0, r1, r0
	cmp r0, #7
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_0208236C:
	cmp r5, #0
	beq _02082398
	cmp r4, #0
	beq _02082388
	mov r0, r5
	bl PMi_SetLed
	b _02082398
_02082388:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl PMi_SetLedAsync
_02082398:
	ldr r2, _0208241C ; =0x04000304
	ldr r0, _02082418 ; =_022BB6AC
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	ldr r0, [r0, #0x14]
	bl PMi_SetAmp
	b _0208240C
_020823B8:
	mov r0, #0
	bl PMi_SetAmp
	ldr r3, _0208241C ; =0x04000304
	ldr r1, _02082414 ; =0x027FFC3C
	ldrh r2, [r3]
	ldr r0, _02082418 ; =_022BB6AC
	cmp r5, #0
	bic r2, r2, #1
	strh r2, [r3]
	ldr r1, [r1]
	str r1, [r0, #0x10]
	beq _0208240C
	cmp r4, #0
	beq _020823FC
	mov r0, r5
	bl PMi_SetLed
	b _0208240C
_020823FC:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl PMi_SetLedAsync
_0208240C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02082414: .word 0x027FFC3C
_02082418: .word _022BB6AC
_0208241C: .word 0x04000304
	arm_func_end PMi_SetLcdPower

	arm_func_start PM_SetLcdPower
PM_SetLcdPower: ; 0x02082420
	ldr ip, _0208243C ; =PMi_SetLcdPower
	mov r1, #0
	cmp r0, #1
	movne r0, #0
	mov r2, r1
	mov r3, #1
	bx ip
	.align 2, 0
_0208243C: .word PMi_SetLcdPower
	arm_func_end PM_SetLcdPower

	arm_func_start PM_GetLcdPower
PM_GetLcdPower: ; 0x02082440
	ldr r0, _02082458 ; =0x04000304
	ldrh r0, [r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02082458: .word 0x04000304
	arm_func_end PM_GetLcdPower

	arm_func_start PMi_SendLedPatternCommandAsync
PMi_SendLedPatternCommandAsync: ; 0x0208245C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	and r0, r6, #0xff
	ldr r1, _020824A0 ; =_022BB6AC
	orr r0, r0, #0x6600
	str r5, [r1, #0x20]
	orr r0, r0, #0x3000000
	str r4, [r1, #0x24]
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020824A0: .word _022BB6AC
	arm_func_end PMi_SendLedPatternCommandAsync

	arm_func_start PMi_SendLedPatternCommand
PMi_SendLedPatternCommand: ; 0x020824A4
	stmdb sp!, {r3, lr}
	ldr r1, _020824C8 ; =_02081A7C
	add r2, sp, #0
	bl PMi_SendLedPatternCommandAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020824C8: .word PMi_DummyCallback
	arm_func_end PMi_SendLedPatternCommand

	arm_func_start PM_GetLedPatternAsync
PM_GetLedPatternAsync: ; 0x020824CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, _0208250C ; =_022BB6AC
	ldr r0, _02082510 ; =0x03006700
	str r5, [r1, #0x20]
	str r4, [r1, #0x24]
	str r6, [r1, #0x28]
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0208250C: .word _022BB6AC
_02082510: .word 0x03006700
	arm_func_end PM_GetLedPatternAsync

	arm_func_start PM_GetLedPattern
PM_GetLedPattern: ; 0x02082514
	stmdb sp!, {r3, lr}
	ldr r1, _02082538 ; =_02081A7C
	add r2, sp, #0
	bl PM_GetLedPatternAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082538: .word PMi_DummyCallback
	arm_func_end PM_GetLedPattern

	arm_func_start PMi_PrependList
PMi_PrependList: ; 0x0208253C
	cmp r0, #0
	ldrne r2, [r0]
	strne r2, [r1, #8]
	strne r1, [r0]
	bx lr
	arm_func_end PMi_PrependList

	arm_func_start PMi_AppendList
PMi_AppendList: ; 0x02082550
	cmp r0, #0
	bxeq lr
	ldr r2, [r0]
	cmp r2, #0
	bne _02082574
	mov r2, #0
	str r2, [r1, #8]
	str r1, [r0]
	bx lr
_02082574:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _02082590
_02082580:
	mov r2, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02082580
_02082590:
	str r0, [r1, #8]
	str r1, [r2, #8]
	bx lr
	arm_func_end PMi_AppendList

	arm_func_start PMi_DeleteList
PMi_DeleteList: ; 0x0208259C
	cmp r0, #0
	ldrne r2, [r0]
	movne r3, r2
	cmpne r2, #0
	bxeq lr
_020825B0:
	cmp r2, r1
	bne _020825D0
	cmp r2, r3
	ldreq r1, [r2, #8]
	streq r1, [r0]
	ldrne r0, [r2, #8]
	strne r0, [r3, #8]
	bx lr
_020825D0:
	mov r3, r2
	ldr r2, [r2, #8]
	cmp r2, #0
	bne _020825B0
	bx lr
	arm_func_end PMi_DeleteList

	arm_func_start PMi_ExecuteList
PMi_ExecuteList: ; 0x020825E4
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
_020825F0:
	ldr r0, [r4, #4]
	ldr r1, [r4]
	blx r1
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _020825F0
	ldmia sp!, {r4, pc}
	arm_func_end PMi_ExecuteList

	arm_func_start PM_PrependPreSleepCallback
PM_PrependPreSleepCallback: ; 0x0208260C
	ldr ip, _0208261C ; =PMi_PrependList
	mov r1, r0
	ldr r0, _02082620 ; =_022BB6B8
	bx ip
	.align 2, 0
_0208261C: .word PMi_PrependList
_02082620: .word _022BB6B8
	arm_func_end PM_PrependPreSleepCallback

	arm_func_start PM_AppendPostSleepCallback
PM_AppendPostSleepCallback: ; 0x02082624
	ldr ip, _02082634 ; =PMi_AppendList
	mov r1, r0
	ldr r0, _02082638 ; =_022BB6C4
	bx ip
	.align 2, 0
_02082634: .word PMi_AppendList
_02082638: .word _022BB6C4
	arm_func_end PM_AppendPostSleepCallback

	arm_func_start PM_DeletePreSleepCallback
PM_DeletePreSleepCallback: ; 0x0208263C
	ldr ip, _0208264C ; =PMi_DeleteList
	mov r1, r0
	ldr r0, _02082650 ; =_022BB6B8
	bx ip
	.align 2, 0
_0208264C: .word PMi_DeleteList
_02082650: .word _022BB6B8
	arm_func_end PM_DeletePreSleepCallback

	arm_func_start PM_DeletePostSleepCallback
PM_DeletePostSleepCallback: ; 0x02082654
	ldr ip, _02082664 ; =PMi_DeleteList
	mov r1, r0
	ldr r0, _02082668 ; =_022BB6C4
	bx ip
	.align 2, 0
_02082664: .word PMi_DeleteList
_02082668: .word _022BB6C4
	arm_func_end PM_DeletePostSleepCallback

	arm_func_start Rtc_Init
Rtc_Init: ; 0x0208266C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020826D0 ; =_022BB718
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x28]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	bl PXI_Init
	mov r5, #5
	mov r4, #1
_020826AC:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020826AC
	ldr r1, _020826D4 ; =RtcCommonCallback
	mov r0, #5
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020826D0: .word _022BB718
_020826D4: .word RtcCommonCallback
	arm_func_end Rtc_Init

	arm_func_start Rtc_GetDateAsync
Rtc_GetDateAsync: ; 0x020826D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EnableIrqFlag
	ldr r1, _02082744 ; =_022BB718
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _02082708
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02082708:
	mov r2, #1
	str r2, [r1, #0xc]
	bl SetIrqFlag
	ldr r0, _02082744 ; =_022BB718
	mov r1, #0
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r6, [r0, #0x14]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl Rtci_ReadRawDateAsync
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02082744: .word _022BB718
	arm_func_end Rtc_GetDateAsync

	arm_func_start Rtc_GetDate
Rtc_GetDate: ; 0x02082748
	stmdb sp!, {r3, lr}
	ldr r1, _02082778 ; =RtcGetResultCallback
	mov r2, #0
	bl Rtc_GetDateAsync
	ldr r1, _0208277C ; =_022BB718
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _0208276C
	bl RtcWaitBusy
_0208276C:
	ldr r0, _0208277C ; =_022BB718
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082778: .word RtcGetResultCallback
_0208277C: .word _022BB718
	arm_func_end Rtc_GetDate

	arm_func_start Rtc_GetTimeAsync
Rtc_GetTimeAsync: ; 0x02082780
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EnableIrqFlag
	ldr r1, _020827F0 ; =_022BB718
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _020827B0
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020827B0:
	mov r2, #1
	str r2, [r1, #0xc]
	bl SetIrqFlag
	ldr r0, _020827F0 ; =_022BB718
	mov r1, #1
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r6, [r0, #0x14]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl Rtci_ReadRawTimeAsync
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020827F0: .word _022BB718
	arm_func_end Rtc_GetTimeAsync

	arm_func_start Rtc_GetTime
Rtc_GetTime: ; 0x020827F4
	stmdb sp!, {r3, lr}
	ldr r1, _02082824 ; =RtcGetResultCallback
	mov r2, #0
	bl Rtc_GetTimeAsync
	ldr r1, _02082828 ; =_022BB718
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _02082818
	bl RtcWaitBusy
_02082818:
	ldr r0, _02082828 ; =_022BB718
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082824: .word RtcGetResultCallback
_02082828: .word _022BB718
	arm_func_end Rtc_GetTime

	arm_func_start Rtc_GetDateTimeAsync
Rtc_GetDateTimeAsync: ; 0x0208282C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EnableIrqFlag
	ldr r1, _020828A4 ; =_022BB718
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _02082860
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02082860:
	mov r2, #1
	str r2, [r1, #0xc]
	bl SetIrqFlag
	ldr r0, _020828A4 ; =_022BB718
	mov r1, #2
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r7, [r0, #0x14]
	str r6, [r0, #0x18]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl Rtci_ReadRawDateTimeAsync
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020828A4: .word _022BB718
	arm_func_end Rtc_GetDateTimeAsync

	arm_func_start Rtc_GetDateTime
Rtc_GetDateTime: ; 0x020828A8
	stmdb sp!, {r3, lr}
	ldr r2, _020828D8 ; =RtcGetResultCallback
	mov r3, #0
	bl Rtc_GetDateTimeAsync
	ldr r1, _020828DC ; =_022BB718
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _020828CC
	bl RtcWaitBusy
_020828CC:
	ldr r0, _020828DC ; =_022BB718
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020828D8: .word RtcGetResultCallback
_020828DC: .word _022BB718
	arm_func_end Rtc_GetDateTime

	arm_func_start RtcCommonCallback
RtcCommonCallback: ; 0x020828E0
	stmdb sp!, {r3, r4, r5, lr}
	cmp r2, #0
	beq _0208293C
	ldr r0, _02082E20 ; =_022BB718
	ldr r1, [r0, #0x24]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x24]
	ldr r0, _02082E20 ; =_022BB718
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _02082E20 ; =_022BB718
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, [r0, #0x1c]
	mov r0, #6
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
_0208293C:
	and r0, r1, #0x7f00
	mov r0, r0, lsr #8
	and r0, r0, #0xff
	cmp r0, #0x30
	and r2, r1, #0xff
	bne _0208296C
	ldr r0, _02082E20 ; =_022BB718
	ldr r0, [r0, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	blx r0
	ldmia sp!, {r3, r4, r5, pc}
_0208296C:
	cmp r2, #0
	bne _02082D90
	ldr r0, _02082E20 ; =_022BB718
	mov r4, #0
	ldr r1, [r0, #0x20]
	cmp r1, #0xf
	addls pc, pc, r1, lsl #2
	b _02082D7C
_0208298C: ; jump table
	b _020829CC ; case 0
	b _02082A28 ; case 1
	b _02082A78 ; case 2
	b _02082DD8 ; case 3
	b _02082DD8 ; case 4
	b _02082DD8 ; case 5
	b _02082B20 ; case 6
	b _02082B50 ; case 7
	b _02082B74 ; case 8
	b _02082C1C ; case 9
	b _02082CD0 ; case 10
	b _02082DD8 ; case 11
	b _02082DD8 ; case 12
	b _02082DD8 ; case 13
	b _02082DD8 ; case 14
	b _02082DD8 ; case 15
_020829CC:
	ldr r1, _02082E24 ; =0x027FFDE8
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	str r0, [r5, #8]
	mov r0, r5
	bl Rtc_GetDayOfWeek
	str r0, [r5, #0xc]
	b _02082DD8
_02082A28:
	ldr r1, _02082E28 ; =0x027FFDEC
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	str r0, [r5, #8]
	b _02082DD8
_02082A78:
	ldr r1, _02082E24 ; =0x027FFDE8
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	and r0, r0, #0xff
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	str r0, [r5, #8]
	mov r0, r5
	bl Rtc_GetDayOfWeek
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #0xc]
	ldr r0, [r1]
	ldr r1, _02082E20 ; =_022BB718
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1a
	ldr r5, [r1, #0x18]
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	str r0, [r5, #8]
	b _02082DD8
_02082B20:
	ldr r1, _02082E2C ; =0x027FFDEA
	ldr r2, [r0, #0x14]
	ldrh r0, [r1]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	bne _02082B48
	mov r0, #1
	str r0, [r2]
	b _02082DD8
_02082B48:
	str r4, [r2]
	b _02082DD8
_02082B50:
	ldr r1, _02082E2C ; =0x027FFDEA
	ldr r2, [r0, #0x14]
	ldrh r0, [r1]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	movne r0, #1
	strne r0, [r2]
	streq r4, [r2]
	b _02082DD8
_02082B74:
	ldr r1, _02082E28 ; =0x027FFDEC
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x12
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	str r0, [r5, #8]
	mov r1, r4
	ldr r0, _02082E28 ; =0x027FFDEC
	str r1, [r5, #0xc]
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	ldrne r0, [r5, #0xc]
	addne r0, r0, #1
	strne r0, [r5, #0xc]
	ldr r0, _02082E28 ; =0x027FFDEC
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x1f
	ldrne r0, [r5, #0xc]
	addne r0, r0, #2
	strne r0, [r5, #0xc]
	ldr r0, _02082E28 ; =0x027FFDEC
	ldr r0, [r0]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	beq _02082DD8
	ldr r0, [r5, #0xc]
	add r0, r0, #4
	str r0, [r5, #0xc]
	b _02082DD8
_02082C1C:
	ldr r3, [r0, #0x24]
	cmp r3, #0
	bne _02082CC8
	ldr r1, [r0, #0x14]
	ldr r2, _02082E2C ; =0x027FFDEA
	ldr r1, [r1]
	cmp r1, #1
	ldrh r1, [r2]
	bne _02082C88
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1c
	cmp r1, #4
	beq _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0xf
	orr r0, r0, #4
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082C88:
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1c
	beq _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0xf
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082CC8:
	str r4, [r0, #0x24]
	b _02082DD8
_02082CD0:
	ldr r3, [r0, #0x24]
	cmp r3, #0
	bne _02082D74
	ldr r1, [r0, #0x14]
	ldr r2, _02082E2C ; =0x027FFDEA
	ldr r1, [r1]
	cmp r1, #1
	ldrh r1, [r2]
	bne _02082D34
	mov r1, r1, lsl #0x19
	movs r1, r1, lsr #0x1f
	bne _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	orr r0, r0, #0x40
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082D34:
	mov r1, r1, lsl #0x19
	movs r1, r1, lsr #0x1f
	beq _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0x40
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082D74:
	str r4, [r0, #0x24]
	b _02082DD8
_02082D7C:
	ldr r0, _02082E20 ; =_022BB718
	mov r1, #0
	str r1, [r0, #0x24]
	mov r4, #4
	b _02082DD8
_02082D90:
	ldr r0, _02082E20 ; =_022BB718
	mov r1, #0
	str r1, [r0, #0x24]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _02082DD4
_02082DA8: ; jump table
	b _02082DD4 ; case 0
	b _02082DBC ; case 1
	b _02082DC4 ; case 2
	b _02082DCC ; case 3
	b _02082DD4 ; case 4
_02082DBC:
	mov r4, #4
	b _02082DD8
_02082DC4:
	mov r4, #5
	b _02082DD8
_02082DCC:
	mov r4, #1
	b _02082DD8
_02082DD4:
	mov r4, #6
_02082DD8:
	ldr r0, _02082E20 ; =_022BB718
	ldr r1, [r0, #0x24]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _02082E20 ; =_022BB718
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, [r0, #0x1c]
	mov r0, r4
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02082E20: .word _022BB718
_02082E24: .word 0x027FFDE8
_02082E28: .word 0x027FFDEC
_02082E2C: .word 0x027FFDEA
	arm_func_end RtcCommonCallback

	arm_func_start RtcBcd2Hex
RtcBcd2Hex: ; 0x02082E30
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #0
	mov r2, ip
	mov r3, ip
_02082E40:
	mov r1, r0, lsr r3
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	add r2, r2, #1
	cmp r2, #8
	add r3, r3, #4
	blt _02082E40
	mov r5, #0
	mov r4, r5
	mov lr, #1
	mov r2, #0xa
_02082E74:
	mov r1, r0, lsr r4
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r5, r5, #1
	mov lr, r1
	cmp r5, #8
	add r4, r4, #4
	blt _02082E74
	mov r0, ip
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RtcBcd2Hex

	arm_func_start RtcGetResultCallback
RtcGetResultCallback: ; 0x02082EA0
	ldr r1, _02082EAC ; =_022BB718
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_02082EAC: .word _022BB718
	arm_func_end RtcGetResultCallback

	arm_func_start RtcWaitBusy
RtcWaitBusy: ; 0x02082EB0
	ldr ip, _02082EC4 ; =_022BB724
_02082EB4:
	ldr r0, [ip]
	cmp r0, #1
	beq _02082EB4
	bx lr
	.align 2, 0
_02082EC4: .word _022BB724
	arm_func_end RtcWaitBusy

	arm_func_start Rtci_ReadRawDateTimeAsync
Rtci_ReadRawDateTimeAsync: ; 0x02082EC8
	ldr ip, _02082ED4 ; =RtcSendPxiCommand
	mov r0, #0x10
	bx ip
	.align 2, 0
_02082ED4: .word RtcSendPxiCommand
	arm_func_end Rtci_ReadRawDateTimeAsync

	arm_func_start Rtci_ReadRawDateAsync
Rtci_ReadRawDateAsync: ; 0x02082ED8
	ldr ip, _02082EE4 ; =RtcSendPxiCommand
	mov r0, #0x11
	bx ip
	.align 2, 0
_02082EE4: .word RtcSendPxiCommand
	arm_func_end Rtci_ReadRawDateAsync

	arm_func_start Rtci_ReadRawTimeAsync
Rtci_ReadRawTimeAsync: ; 0x02082EE8
	ldr ip, _02082EF4 ; =RtcSendPxiCommand
	mov r0, #0x12
	bx ip
	.align 2, 0
_02082EF4: .word RtcSendPxiCommand
	arm_func_end Rtci_ReadRawTimeAsync

	arm_func_start Rtci_WriteRawStatus2Async
Rtci_WriteRawStatus2Async: ; 0x02082EF8
	ldr ip, _02082F04 ; =RtcSendPxiCommand
	mov r0, #0x27
	bx ip
	.align 2, 0
_02082F04: .word RtcSendPxiCommand
	arm_func_end Rtci_WriteRawStatus2Async

	arm_func_start RtcSendPxiCommand
RtcSendPxiCommand: ; 0x02082F08
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #8
	and r1, r0, #0x7f00
	mov r0, #5
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end RtcSendPxiCommand

	arm_func_start Rtc_ConvertDateToDay
Rtc_ConvertDateToDay: ; 0x02082F30
	ldr r3, [r0]
	cmp r3, #0x64
	bhs _02082F80
	ldr r2, [r0, #4]
	cmp r2, #1
	blo _02082F80
	cmp r2, #0xc
	bhi _02082F80
	ldr r1, [r0, #8]
	cmp r1, #1
	blo _02082F80
	cmp r1, #0x1f
	bhi _02082F80
	ldr r0, [r0, #0xc]
	cmp r0, #7
	bge _02082F80
	cmp r2, #1
	blo _02082F80
	cmp r2, #0xc
	bls _02082F88
_02082F80:
	mvn r0, #0
	bx lr
_02082F88:
	ldr r0, _02082FBC ; =_020B2E9C
	sub r1, r1, #1
	ldr r0, [r0, r2, lsl #2]
	cmp r2, #3
	add r2, r1, r0
	blo _02082FA8
	tst r3, #3
	addeq r2, r2, #1
_02082FA8:
	ldr r0, _02082FC0 ; =0x0000016D
	add r1, r3, #3
	mla r0, r3, r0, r2
	add r0, r0, r1, lsr #2
	bx lr
	.align 2, 0
_02082FBC: .word _020B2E9C
_02082FC0: .word 0x0000016D
	arm_func_end Rtc_ConvertDateToDay

	arm_func_start Rtci_ConvertTimeToSecond
Rtci_ConvertTimeToSecond: ; 0x02082FC4
	mov r1, #0x3c
	ldmia r0, {r2, r3}
	mla r3, r2, r1, r3
	ldr r0, [r0, #8]
	mla r0, r3, r1, r0
	bx lr
	arm_func_end Rtci_ConvertTimeToSecond

	arm_func_start Rtc_ConvertDateTimeToSecond
Rtc_ConvertDateTimeToSecond: ; 0x02082FDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl Rtc_ConvertDateToDay
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r1, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl Rtci_ConvertTimeToSecond
	mvn r2, #0
	cmp r0, r2
	moveq r1, r2
	beq _02083034
	ldr r1, _0208303C ; =0x00015180
	mov r2, #0
	umull ip, r3, r4, r1
	mla r3, r4, r2, r3
	mov r2, r4, asr #0x1f
	mla r3, r2, r1, r3
	adds r2, r0, ip
	adc r1, r3, r0, asr #31
_02083034:
	mov r0, r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0208303C: .word 0x00015180
	arm_func_end Rtc_ConvertDateTimeToSecond

	arm_func_start Rtc_GetDayOfWeek
Rtc_GetDayOfWeek: ; 0x02083040
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #4]
	ldr r2, [r0]
	sub r1, r1, #2
	cmp r1, #1
	add ip, r2, #0x7d0
	sublt ip, ip, #1
	ldr r6, _020830F0 ; =0x51EB851F
	ldr lr, [r0, #8]
	smull r3, r2, r6, ip
	smull r4, r3, r6, ip
	mov r5, ip, lsr #0x1f
	add r3, r5, r3, asr #5
	add r2, r5, r2, asr #5
	mov r5, #0x64
	smull r2, r4, r5, r2
	sub r2, ip, r2
	addlt r1, r1, #0xc
	mov r0, #0x1a
	mul r0, r1, r0
	sub r1, r0, #2
	ldr r0, _020830F4 ; =0x66666667
	mov r5, r1, lsr #0x1f
	smull r1, ip, r0, r1
	add ip, r5, ip, asr #2
	mov r4, r2, asr #1
	add r0, lr, ip
	add r1, r2, r4, lsr #30
	add r2, r2, r0
	mov r6, r3, asr #1
	add r0, r3, r6, lsr #30
	add r1, r2, r1, asr #2
	add r1, r1, r0, asr #2
	add r0, r3, r3, lsl #2
	add r4, r1, r0
	ldr r3, _020830F8 ; =0x92492493
	mov r1, r4, lsr #0x1f
	smull r2, r0, r3, r4
	add r0, r4, r0
	add r0, r1, r0, asr #2
	mov r2, #7
	smull r0, r1, r2, r0
	sub r0, r4, r0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020830F0: .word 0x51EB851F
_020830F4: .word 0x66666667
_020830F8: .word 0x92492493
	arm_func_end Rtc_GetDayOfWeek

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
	bl StartThread
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

	arm_func_start Cardi_IdentifyBackupCore
Cardi_IdentifyBackupCore: ; 0x020834A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02083808 ; =_022BB7E0
	mov r5, r0
	ldr r4, [r1]
	mov r1, #0
	add r0, r4, #0x18
	mov r2, #0x48
	bl MI_CpuFill8
	ldr r0, _0208380C ; =0x0000203F
	str r5, [r4, #4]
	str r0, [r4, #0x58]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5, asr #8
	and r0, r0, #0xff
	mov r3, #1
	mov ip, r3, lsl r0
	and r2, r5, #0xff
	mov r1, r5, asr #0x10
	str ip, [r4, #0x18]
	mov r0, #0xff
	strb r0, [r4, #0x54]
	cmp r2, #1
	and r0, r1, #0xff
	bne _020835E0
	cmp ip, #0x2000
	bhi _02083520
	bhs _0208355C
	cmp ip, #0x200
	beq _0208353C
	b _020837E8
_02083520:
	cmp ip, #0x10000
	bhi _02083530
	beq _02083580
	b _020837E8
_02083530:
	cmp ip, #0x20000
	beq _020835A4
	b _020837E8
_0208353C:
	mov r0, #0x10
	str r0, [r4, #0x24]
	str r3, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #0xf0
	strb r0, [r4, #0x54]
	b _020835C4
_0208355C:
	mov r0, #0x20
	str r0, [r4, #0x24]
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #0
	strb r0, [r4, #0x54]
	b _020835C4
_02083580:
	mov r0, #0x80
	str r0, [r4, #0x24]
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #0xa
	str r0, [r4, #0x2c]
	mov r0, #0
	strb r0, [r4, #0x54]
	b _020835C4
_020835A4:
	mov r0, #0x100
	str r0, [r4, #0x24]
	mov r0, #3
	str r0, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #0
	strb r0, [r4, #0x54]
_020835C4:
	ldr r0, [r4, #0x24]
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x40
	orr r0, r0, #0x4300
	str r0, [r4, #0x58]
	ldmia sp!, {r3, r4, r5, pc}
_020835E0:
	cmp r2, #2
	bne _020837A8
	cmp ip, #0x100000
	bhi _02083610
	bhs _02083634
	cmp ip, #0x40000
	bhi _02083604
	beq _02083634
	b _020837E8
_02083604:
	cmp ip, #0x80000
	beq _02083634
	b _020837E8
_02083610:
	cmp ip, #0x400000
	bhi _02083628
	bhs _020836AC
	cmp ip, #0x200000
	beq _02083660
	b _020837E8
_02083628:
	cmp ip, #0x800000
	beq _020836FC
	b _020837E8
_02083634:
	mov r0, #0x19
	str r0, [r4, #0x30]
	mov r1, #0x12c
	str r1, [r4, #0x34]
	ldr r0, _02083810 ; =0x00001388
	str r1, [r4, #0x50]
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x480
	str r0, [r4, #0x58]
	b _02083778
_02083660:
	mov r0, #0x17
	str r0, [r4, #0x30]
	mov r1, #0x12c
	str r1, [r4, #0x34]
	mov r1, #0x1f4
	ldr r0, _02083810 ; =0x00001388
	str r1, [r4, #0x40]
	str r0, [r4, #0x44]
	mov r1, r0, lsl #1
	ldr r0, _02083814 ; =0x0000EA60
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x80
	orr r0, r0, #0x5400
	str r0, [r4, #0x58]
	b _02083778
_020836AC:
	mov r0, #0x258
	str r0, [r4, #0x40]
	add r0, r0, #0x960
	str r0, [r4, #0x44]
	mov r0, #0x46
	str r0, [r4, #0x48]
	mov r0, #0x96
	str r0, [r4, #0x4c]
	ldr r1, _02083818 ; =0x000059D8
	ldr r0, _0208381C ; =0x000C3500
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0
	strb r0, [r4, #0x54]
	mov r0, #0x1000
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0xd000
	str r0, [r4, #0x58]
	b _02083778
_020836FC:
	cmp r0, #0
	bne _0208373C
	mov r0, #0x3e8
	str r0, [r4, #0x40]
	add r0, r0, #0x7d0
	str r0, [r4, #0x44]
	ldr r1, _02083820 ; =0x000109A0
	ldr r0, _02083824 ; =0x00027100
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x5000
	str r0, [r4, #0x58]
	b _02083778
_0208373C:
	cmp r0, #1
	bne _02083778
	mov r0, #0x3e8
	str r0, [r4, #0x40]
	add r0, r0, #0x7d0
	str r0, [r4, #0x44]
	ldr r1, _02083820 ; =0x000109A0
	ldr r0, _02083824 ; =0x00027100
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0x84
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x5000
	str r0, [r4, #0x58]
_02083778:
	mov r0, #0x10000
	str r0, [r4, #0x1c]
	mov r0, #0x100
	str r0, [r4, #0x24]
	mov r0, #3
	str r0, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0xb40
	str r0, [r4, #0x58]
	ldmia sp!, {r3, r4, r5, pc}
_020837A8:
	cmp r2, #3
	bne _020837E8
	cmp ip, #0x2000
	cmpne ip, #0x8000
	bne _020837E8
	str ip, [r4, #0x24]
	str ip, [r4, #0x1c]
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #0
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x40
	orr r0, r0, #0x4300
	str r0, [r4, #0x58]
	ldmia sp!, {r3, r4, r5, pc}
_020837E8:
	mov r1, #0
	str r1, [r4, #4]
	str r1, [r4, #0x18]
	ldr r0, _02083808 ; =_022BB7E0
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02083808: .word _022BB7E0
_0208380C: .word 0x0000203F
_02083810: .word 0x00001388
_02083814: .word 0x0000EA60
_02083818: .word 0x000059D8
_0208381C: .word 0x000C3500
_02083820: .word 0x000109A0
_02083824: .word 0x00027100
	arm_func_end Cardi_IdentifyBackupCore

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

	arm_func_start CARDi_ReadFromCache
CARDi_ReadFromCache: ; 0x02083C8C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02083D14 ; =_022BB7E0
	mov r1, #0x200
	ldr r3, [r4, #0x1c]
	rsb r1, r1, #0
	ldr r2, [r0, #8]
	and r3, r3, r1
	cmp r3, r2
	bne _02083D00
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	sub r3, r2, r3
	rsb r5, r3, #0x200
	cmp r5, r1
	movhi r5, r1
	add r0, r0, #0x20
	ldr r1, [r4, #0x20]
	mov r2, r5
	add r0, r0, r3
	bl MI_CpuCopy8
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x24]
	add r2, r2, r5
	add r1, r1, r5
	sub r0, r0, r5
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r0, [r4, #0x24]
_02083D00:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02083D14: .word _022BB7E0
	arm_func_end CARDi_ReadFromCache

	arm_func_start CARDi_SetRomOp
CARDi_SetRomOp: ; 0x02083D18
	ldr r3, _02083D70 ; =0x040001A4
_02083D1C:
	ldr r2, [r3]
	tst r2, #0x80000000
	bne _02083D1C
	ldr r3, _02083D74 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_02083D70: .word 0x040001A4
_02083D74: .word 0x040001A1
	arm_func_end CARDi_SetRomOp

	arm_func_start sub_02083D78
sub_02083D78: ; 0x02083D78
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02083DBC ; =_022BB7E0
	ldr r1, _02083DC0 ; =0x04100010
	ldr r0, [r4, #0x28]
	ldr r2, [r4, #0x20]
	mov r3, #0x200
	ldr r5, _02083DC4 ; =_022BBE20
	bl MTi_CardDmaCopy32
	ldr r1, [r4, #0x1c]
	mov r0, r1, lsr #8
	orr r0, r0, #0xb7000000
	mov r1, r1, lsl #0x18
	bl CARDi_SetRomOp
	ldr r1, [r5, #4]
	ldr r0, _02083DC8 ; =0x040001A4
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02083DBC: .word _022BB7E0
_02083DC0: .word 0x04100010
_02083DC4: .word _022BBE20
_02083DC8: .word 0x040001A4
	arm_func_end sub_02083D78

	arm_func_start sub_02083DCC
sub_02083DCC: ; 0x02083DCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02083E98 ; =_022BB7E0
	ldr r0, [r0, #0x28]
	bl MI_StopDma
	ldr r3, _02083E98 ; =_022BB7E0
	ldr r0, [r3, #0x24]
	ldr r2, [r3, #0x1c]
	ldr r1, [r3, #0x20]
	subs r0, r0, #0x200
	str r0, [r3, #0x24]
	movne r0, #1
	add r2, r2, #0x200
	add r1, r1, #0x200
	moveq r0, #0
	str r2, [r3, #0x1c]
	str r1, [r3, #0x20]
	cmp r0, #0
	bne _02083E90
	mov r0, #0x80000
	bl OS_DisableIrqMask
	mov r0, #0x80000
	bl OS_ResetRequestIrqMask
	ldr r4, _02083E98 ; =_022BB7E0
	bl sub_02084118
	bl Cardi_CheckPulledOutCore
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r5, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl EnableIrqFlag
	ldr r1, [r4, #0x114]
	mov r7, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0x114]
	add r0, r4, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _02083E74
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_02083E74:
	mov r0, r7
	bl SetIrqFlag
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02083E90:
	bl sub_02083D78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02083E98: .word _022BB7E0
	arm_func_end sub_02083DCC

	arm_func_start Cardi_TryReadCardDma
Cardi_TryReadCardDma: ; 0x02083E9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02084014 ; =_022BB7E0
	mov r6, #0
	ldr sb, [r4, #0x20]
	mov fp, r0
	mov r7, r6
	mov r8, r6
	mov r1, r6
	ands sl, sb, #0x1f
	ldr r5, [r4, #0x24]
	bne _02083ED4
	ldr r0, [r4, #0x28]
	cmp r0, #3
	movls r1, #1
_02083ED4:
	cmp r1, #0
	beq _02083F28
	bl OS_GetDTCMAddress
	ldr r1, _02084018 ; =CopyAndInterleave
	add r3, sb, r5
	cmp r3, r1
	mov r1, #1
	mov r2, #0
	bls _02083F00
	cmp sb, #0x2000000
	movlo r2, r1
_02083F00:
	cmp r2, #0
	bne _02083F20
	cmp r0, r3
	bhs _02083F1C
	add r0, r0, #0x4000
	cmp r0, sb
	bhi _02083F20
_02083F1C:
	mov r1, #0
_02083F20:
	cmp r1, #0
	moveq r8, #1
_02083F28:
	cmp r8, #0
	beq _02083F44
	ldr r1, [r4, #0x1c]
	ldr r0, _0208401C ; =0x000001FF
	orr r1, r1, r5
	tst r1, r0
	moveq r7, #1
_02083F44:
	ldr r0, _02084020 ; =_020B2ED0
	cmp r7, #0
	ldr r0, [r0]
	cmpne r5, #0
	ldr r0, [r0, #0x60]
	movne r6, #1
	bic r0, r0, #0x7000000
	orr r0, r0, #0xa1000000
	cmp r6, #0
	str r0, [fp, #4]
	beq _0208400C
	bl EnableIrqFlag
	ldr r1, [r4, #0x118]
	mov r7, r0
	cmp r5, r1
	bhs _02083F94
	mov r0, sb
	mov r1, r5
	bl IC_InvalidateRange
	b _02083F98
_02083F94:
	bl IC_InvalidateAll
_02083F98:
	ldr r0, [r4, #0x11c]
	cmp r5, r0
	bhs _02083FE0
	cmp sl, #0
	beq _02083FCC
	sub sb, sb, sl
	mov r0, sb
	mov r1, #0x20
	bl DC_StoreRange
	add r0, sb, r5
	mov r1, #0x20
	bl DC_StoreRange
	add r5, r5, #0x20
_02083FCC:
	mov r0, sb
	mov r1, r5
	bl DC_InvalidateRange
	bl DC_WaitWriteBufferEmpty
	b _02083FE4
_02083FE0:
	bl DC_FlushAll
_02083FE4:
	ldr r1, _02084024 ; =_02083DCC
	mov r0, #0x80000
	bl OS_SetIrqFunction
	mov r0, #0x80000
	bl OS_ResetRequestIrqMask
	mov r0, #0x80000
	bl OS_EnableIrqMask
	mov r0, r7
	bl SetIrqFlag
	bl sub_02083D78
_0208400C:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02084014: .word _022BB7E0
_02084018: .word CopyAndInterleave
_0208401C: .word 0x000001FF
_02084020: .word _020B2ED0
_02084024: .word sub_02083DCC
	arm_func_end Cardi_TryReadCardDma

	arm_func_start CARDi_ReadCard
CARDi_ReadCard: ; 0x02084028
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _0208410C ; =_022BB7E0
	mov r6, r0
_02084034:
	mov r0, #0x200
	ldr r1, [r4, #0x1c]
	rsb r0, r0, #0
	and r2, r1, r0
	cmp r2, r1
	bne _02084064
	ldr r5, [r4, #0x20]
	tst r5, #3
	bne _02084064
	ldr r0, [r4, #0x24]
	cmp r0, #0x200
	bhs _0208406C
_02084064:
	str r2, [r6, #8]
	add r5, r6, #0x20
_0208406C:
	mov r0, r2, lsr #8
	orr r0, r0, #0xb7000000
	mov r1, r2, lsl #0x18
	bl CARDi_SetRomOp
	mov ip, #0
	ldr r0, [r6, #4]
	ldr r2, _02084110 ; =0x040001A4
	mov lr, ip
	str r0, [r2]
	ldr r1, _02084114 ; =0x04100010
_02084094:
	ldr r3, [r2]
	tst r3, #0x800000
	beq _020840B4
	ldr r0, [r1]
	cmp lr, #0x200
	strlo r0, [r5, ip, lsl #2]
	addlo lr, lr, #4
	addlo ip, ip, #1
_020840B4:
	tst r3, #0x80000000
	bne _02084094
	ldr r0, [r4, #0x20]
	cmp r5, r0
	bne _020840F8
	ldr r0, _0208410C ; =_022BB7E0
	ldr r1, [r0, #0x1c]
	add r1, r1, #0x200
	str r1, [r0, #0x1c]
	ldr r1, [r0, #0x20]
	add r1, r1, #0x200
	str r1, [r0, #0x20]
	ldr r1, [r0, #0x24]
	subs r1, r1, #0x200
	str r1, [r0, #0x24]
	ldmeqia sp!, {r4, r5, r6, pc}
	b _02084034
_020840F8:
	mov r0, r6
	bl CARDi_ReadFromCache
	cmp r0, #0
	bne _02084034
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0208410C: .word _022BB7E0
_02084110: .word 0x040001A4
_02084114: .word 0x04100010
	arm_func_end CARDi_ReadCard

	arm_func_start sub_02084118
sub_02084118: ; 0x02084118
	stmdb sp!, {r3, lr}
	mov r0, #0xb8000000
	mov r1, #0
	bl CARDi_SetRomOp
	ldr r1, _02084168 ; =_020B2ED0
	mov r0, #0x2000
	ldr r1, [r1]
	rsb r0, r0, #0
	ldr r2, [r1, #0x60]
	ldr r1, _0208416C ; =0x040001A4
	bic r2, r2, #0x7000000
	orr r2, r2, #0xa7000000
	and r0, r2, r0
	str r0, [r1]
_02084150:
	ldr r0, [r1]
	tst r0, #0x800000
	beq _02084150
	ldr r0, _02084170 ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084168: .word _020B2ED0
_0208416C: .word 0x040001A4
_02084170: .word 0x04100010
	arm_func_end sub_02084118

	arm_func_start Cardi_ReadRomSyncCore
Cardi_ReadRomSyncCore: ; 0x02084174
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02084204 ; =_022BBE20
	mov r0, r4
	bl CARDi_ReadFromCache
	cmp r0, #0
	beq _02084198
	ldr r1, [r4]
	mov r0, r4
	blx r1
_02084198:
	ldr r4, _02084208 ; =_022BB7E0
	bl sub_02084118
	bl Cardi_CheckPulledOutCore
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r5, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl EnableIrqFlag
	ldr r1, [r4, #0x114]
	mov r7, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0x114]
	add r0, r4, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _020841E8
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_020841E8:
	mov r0, r7
	bl SetIrqFlag
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02084204: .word _022BBE20
_02084208: .word _022BB7E0
	arm_func_end Cardi_ReadRomSyncCore

	arm_func_start Cardi_ReadRom
Cardi_ReadRom: ; 0x0208420C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r4, _020842F0 ; =_022BBE20
	ldr r5, _020842F4 ; =_022BB7E0
	bl Card_CheckEnabled
	bl EnableIrqFlag
	mov r6, r0
	b _02084240
_02084238:
	add r0, r5, #0x10c
	bl OS_SleepThread
_02084240:
	ldr r0, [r5, #0x114]
	tst r0, #4
	bne _02084238
	ldr r0, [r5, #0x114]
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	orr r3, r0, #4
	mov r0, r6
	str r3, [r5, #0x114]
	str r2, [r5, #0x38]
	str r1, [r5, #0x3c]
	bl SetIrqFlag
	ldr r0, _020842F8 ; =_022BBE00
	str sl, [r5, #0x28]
	ldr r0, [r0]
	str r8, [r5, #0x20]
	add r0, sb, r0
	str r0, [r5, #0x1c]
	str r7, [r5, #0x24]
	cmp sl, #3
	bhi _0208429C
	mov r0, sl
	bl MI_StopDma
_0208429C:
	mov r0, r4
	bl Cardi_TryReadCardDma
	cmp r0, #0
	beq _020842C0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	bl Card_WaitRomAsync
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020842C0:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020842D8
	ldr r0, _020842FC ; =Cardi_ReadRomSyncCore
	bl Cardi_SetTask
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020842D8:
	ldr r1, _02084300 ; =_022B966C
	mov r0, r5
	ldr r1, [r1, #4]
	str r1, [r5, #0x104]
	bl Cardi_ReadRomSyncCore
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020842F0: .word _022BBE20
_020842F4: .word _022BB7E0
_020842F8: .word _022BBE00
_020842FC: .word Cardi_ReadRomSyncCore
_02084300: .word _022B966C
	arm_func_end Cardi_ReadRom

	arm_func_start CARD_Init
CARD_Init: ; 0x02084304
	stmdb sp!, {r3, lr}
	ldr ip, _02084360 ; =_022BB7E0
	ldr r0, [ip, #0x114]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #0
	ldr r0, _02084364 ; =_022BBE00
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0x114]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r2, [ip, #0x1c]
	str r1, [ip, #0x28]
	str r2, [ip, #0x38]
	str r2, [ip, #0x3c]
	str r2, [r0]
	bl CARDi_InitCommon
	bl CARDi_GetRomAccessor
	ldr r1, _02084364 ; =_022BBE00
	str r0, [r1, #0x20]
	bl CARD_InitPulledOutCallback
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084360: .word _022BB7E0
_02084364: .word _022BBE00
	arm_func_end CARD_Init

	arm_func_start Card_WaitRomAsync
Card_WaitRomAsync: ; 0x02084368
	ldr ip, _02084370 ; =Cardi_WaitAsync
	bx ip
	.align 2, 0
_02084370: .word Cardi_WaitAsync
	arm_func_end Card_WaitRomAsync

	arm_func_start CARDi_GetRomAccessor
CARDi_GetRomAccessor: ; 0x02084374
	ldr r0, _0208437C ; =CARDi_ReadCard
	bx lr
	.align 2, 0
_0208437C: .word CARDi_ReadCard
	arm_func_end CARDi_GetRomAccessor

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

	arm_func_start Ctrdgi_InitTaskThread
Ctrdgi_InitTaskThread: ; 0x02084DA4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _02084E20 ; =_022BC228
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _02084E10
	add r0, r5, #0xc4
	str r5, [r1]
	bl Ctrdgi_InitTaskInfo
	ldr r0, _02084E24 ; =_022BC22C
	bl Ctrdgi_InitTaskInfo
	mov r0, #0
	str r0, [r5, #0xc0]
	mov r2, #0x400
	ldr r1, _02084E28 ; =Ctrdgi_TaskThread
	ldr r3, _02084E2C ; =_022BC650
	mov r0, r5
	str r2, [sp]
	mov r2, #0x14
	str r2, [sp, #4]
	mov r2, r5
	bl StartThread
	mov r0, r5
	bl OS_WakeupThreadDirect
_02084E10:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02084E20: .word _022BC228
_02084E24: .word _022BC22C
_02084E28: .word Ctrdgi_TaskThread
_02084E2C: .word _022BC650
	arm_func_end Ctrdgi_InitTaskThread

	arm_func_start Ctrdgi_InitTaskInfo
Ctrdgi_InitTaskInfo: ; 0x02084E30
	ldr ip, _02084E40 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x24
	bx ip
	.align 2, 0
_02084E40: .word MI_CpuFill8
	arm_func_end Ctrdgi_InitTaskInfo

	arm_func_start Ctrdgi_TaskThread
Ctrdgi_TaskThread: ; 0x02084E44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r4, #0
	mov r8, r0
	add r6, sp, #0
	mov sl, r4
	mov sb, r4
	mov r5, r4
	mov fp, #0x24
_02084E68:
	mov r0, r6
	mov r1, r5
	mov r2, fp
	bl MI_CpuFill8
	bl EnableIrqFlag
	ldr r1, [r8, #0xc0]
	mov r7, r0
	cmp r1, #0
	bne _02084EA0
_02084E8C:
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r8, #0xc0]
	cmp r0, #0
	beq _02084E8C
_02084EA0:
	ldr lr, [r8, #0xc0]
	add ip, sp, #0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r1, [lr]
	mov r0, r7
	str r1, [ip]
	bl SetIrqFlag
	ldr r1, [sp]
	cmp r1, #0
	beq _02084EE0
	mov r0, r6
	blx r1
	str r0, [sp, #8]
_02084EE0:
	bl EnableIrqFlag
	ldr r2, [sp, #4]
	ldr r1, _02084F30 ; =_022BC228
	mov r7, r0
	strb sl, [r1, #0x26]
	cmp r2, #0
	beq _02084F04
	mov r0, r6
	blx r2
_02084F04:
	ldr r0, _02084F30 ; =_022BC228
	ldr r0, [r0]
	cmp r0, #0
	beq _02084F24
	mov r0, r7
	str sb, [r8, #0xc0]
	bl SetIrqFlag
	b _02084E68
_02084F24:
	bl ThreadExit
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02084F30: .word _022BC228
	arm_func_end Ctrdgi_TaskThread

	arm_func_start Math_CountPopulation
Math_CountPopulation: ; 0x02084F34
	ldr r1, _02084F6C ; =0x55555555
	ldr r2, _02084F70 ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r0, r0, r1
	and r1, r0, r2
	and r0, r2, r0, lsr #2
	add r1, r1, r0
	ldr r0, _02084F74 ; =0x0F0F0F0F
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02084F6C: .word 0x55555555
_02084F70: .word 0x33333333
_02084F74: .word 0x0F0F0F0F
	arm_func_end Math_CountPopulation

	arm_func_start Math_CalcSha1
Math_CalcSha1: ; 0x02084F78
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	mov r4, r2
	bl Dgt_Hash2Init
	add r0, sp, #0
	mov r1, r5
	mov r2, r4
	bl Dgt_Hash2Update
	add r0, sp, #0
	mov r1, r6
	bl Dgt_Hash2GetHash
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Math_CalcSha1

	arm_func_start Mathi_Crc8InitTable
Mathi_Crc8InitTable: ; 0x02084FB8
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r2, ip
_02084FC4:
	mov r3, ip
	mov lr, r2
_02084FCC:
	tst r3, #0x80
	eorne r3, r1, r3, lsl #1
	add lr, lr, #1
	moveq r3, r3, lsl #1
	cmp lr, #8
	blo _02084FCC
	strb r3, [r0, ip]
	add ip, ip, #1
	cmp ip, #0x100
	blo _02084FC4
	ldmia sp!, {r3, pc}
	arm_func_end Mathi_Crc8InitTable

	arm_func_start Mathi_Crc8Update
Mathi_Crc8Update: ; 0x02084FF8
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrb lr, [r1]
	mov r4, #0
	bls _02085028
_0208500C:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	and ip, ip, #0xff
	ldrb lr, [r0, ip]
	blo _0208500C
_02085028:
	strb lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end Mathi_Crc8Update

	arm_func_start Mathi_Crc16InitTable
Mathi_Crc16InitTable: ; 0x02085030
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov r3, lr
_0208503C:
	mov ip, lr
	mov r2, r3
_02085044:
	tst ip, #1
	eorne ip, r1, ip, lsr #1
	add r2, r2, #1
	moveq ip, ip, lsr #1
	cmp r2, #8
	blo _02085044
	mov r2, lr, lsl #1
	add lr, lr, #1
	strh ip, [r0, r2]
	cmp lr, #0x100
	blo _0208503C
	ldmia sp!, {r3, pc}
	arm_func_end Mathi_Crc16InitTable

	arm_func_start Mathi_Crc16Update
Mathi_Crc16Update: ; 0x02085074
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrh lr, [r1]
	mov r4, #0
	bls _020850AC
_02085088:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	mov ip, ip, lsl #0x18
	mov ip, ip, lsr #0x17
	ldrh ip, [r0, ip]
	eor lr, ip, lr, lsr #8
	blo _02085088
_020850AC:
	strh lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end Mathi_Crc16Update

	arm_func_start Mathi_Crc32InitTable
Mathi_Crc32InitTable: ; 0x020850B4
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r2, ip
_020850C0:
	mov r3, ip
	mov lr, r2
_020850C8:
	tst r3, #1
	eorne r3, r1, r3, lsr #1
	add lr, lr, #1
	moveq r3, r3, lsr #1
	cmp lr, #8
	blo _020850C8
	str r3, [r0, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #0x100
	blo _020850C0
	ldmia sp!, {r3, pc}
	arm_func_end Mathi_Crc32InitTable

	arm_func_start Mathi_Crc32Update
Mathi_Crc32Update: ; 0x020850F4
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldr lr, [r1]
	mov r4, #0
	bls _02085128
_02085108:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	and ip, ip, #0xff
	ldr ip, [r0, ip, lsl #2]
	eor lr, ip, lr, lsr #8
	blo _02085108
_02085128:
	str lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end Mathi_Crc32Update

	arm_func_start Math_CalcCrc8
Math_CalcCrc8: ; 0x02085130
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strb ip, [sp]
	bl Mathi_Crc8Update
	ldrb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end Math_CalcCrc8

	arm_func_start Math_CalcCrc16
Math_CalcCrc16: ; 0x02085158
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strh ip, [sp]
	bl Mathi_Crc16Update
	ldrh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end Math_CalcCrc16

	arm_func_start Math_CalcCrc32
Math_CalcCrc32: ; 0x02085180
	stmdb sp!, {r3, lr}
	mov lr, r1
	mvn ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	str ip, [sp]
	bl Mathi_Crc32Update
	ldr r0, [sp]
	mvn r0, r0
	ldmia sp!, {r3, pc}
	arm_func_end Math_CalcCrc32

	arm_func_start sub_020851AC
sub_020851AC: ; 0x020851AC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	movs r4, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, sp, #0
	add r0, r4, #0x50
	mov r2, #8
	bl MI_CpuCopy8
	add r0, sp, #0
	mov r1, #8
	bl DC_StoreRange
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _02085230
	ldrh r1, [sp]
	ldr r0, _0208523C ; =0x00002348
	cmp r1, r0
	ldrneh r1, [sp]
	ldrne r0, _02085240 ; =0x0000BD8A
	cmpne r1, r0
	bne _02085230
	ldrh r0, [sp, #6]
	cmp r0, #4
	addeq sp, sp, #8
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02085230:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0208523C: .word 0x00002348
_02085240: .word 0x0000BD8A
	arm_func_end sub_020851AC

	arm_func_start Std_CopyLString
Std_CopyLString: ; 0x02085244
	stmdb sp!, {r4, lr}
	sub ip, r2, #1
	mov r4, r1
	cmp ip, #0
	mov lr, #0
	ble _02085280
_0208525C:
	ldrsb r3, [r4]
	strb r3, [r0, lr]
	ldrsb r3, [r4]
	cmp r3, #0
	beq _02085280
	add lr, lr, #1
	cmp lr, ip
	add r4, r4, #1
	blt _0208525C
_02085280:
	sub r3, r2, #1
	cmp lr, r3
	blt _02085298
	cmp r2, #0
	movne r2, #0
	strneb r2, [r0, lr]
_02085298:
	mov r0, r1
	bl Std_GetStringLength
	ldmia sp!, {r4, pc}
	arm_func_end Std_CopyLString

	arm_func_start Std_GetStringLength
Std_GetStringLength: ; 0x020852A4
	ldrsb r1, [r0]
	mov r2, #0
	cmp r1, #0
	beq _020852C4
_020852B4:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _020852B4
_020852C4:
	mov r0, r2
	bx lr
	arm_func_end Std_GetStringLength

	arm_func_start Std_CompareString__020852CC
Std_CompareString__020852CC: ; 0x020852CC
	b _020852D8
_020852D0:
	add r0, r0, #1
	add r1, r1, #1
_020852D8:
	ldrsb r3, [r1]
	ldrsb r2, [r0]
	cmp r2, r3
	bne _020852F0
	cmp r2, #0
	bne _020852D0
_020852F0:
	sub r0, r2, r3
	bx lr
	arm_func_end Std_CompareString__020852CC

	arm_func_start Std_CompareNString
Std_CompareNString: ; 0x020852F8
	stmdb sp!, {r3, lr}
	cmp r2, #0
	beq _02085330
	cmp r2, #0
	mov lr, #0
	ble _02085330
_02085310:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blt _02085310
_02085330:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Std_CompareNString

	arm_func_start Std_TsScanf
Std_TsScanf: ; 0x02085338
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl Std_TvsScanf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end Std_TsScanf

	arm_func_start Stdi_IsSpace
Stdi_IsSpace: ; 0x02085360
	sub r3, r0, #9
	cmp r3, #0x17
	mov r0, #0
	bxhi lr
	ldr r1, _02085384 ; =0x0080001F
	mov r2, #1
	tst r1, r2, lsl r3
	movne r0, r2
	bx lr
	.align 2, 0
_02085384: .word 0x0080001F
	arm_func_end Stdi_IsSpace

	arm_func_start Stdi_FillBitset
Stdi_FillBitset: ; 0x02085388
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, r2
	ldmhsia sp!, {r3, r4, r5, pc}
	and r3, r2, #0x1f
	mov ip, #1
	mov r3, ip, lsl r3
	sub r5, r3, #1
	mvn ip, #0
_020853A8:
	and r3, r1, #0x1f
	mov lr, r1, lsr #5
	mov r4, ip, lsl r3
	add r1, lr, #1
	cmp r2, r1, lsl #5
	ldr r3, [r0, lr, lsl #2]
	andlo r4, r4, r5
	mov r1, r1, lsl #5
	orr r3, r3, r4
	cmp r1, r2
	str r3, [r0, lr, lsl #2]
	blo _020853A8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Stdi_FillBitset

	arm_func_start Std_TvsScanf
Std_TvsScanf: ; 0x020853DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov r8, r1
	ldrsb r4, [r8]
	mov sb, r0
	mov r0, #0
	str r0, [sp, #0xc]
	str r2, [sp]
	str sb, [sp, #0x10]
	str r0, [sp, #4]
	cmp r4, #0
	beq _02085AD4
_0208540C:
	mov r0, r4
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085460
	ldrsb r0, [r8]
	bl Stdi_IsSpace
	cmp r0, #0
	beq _0208543C
_0208542C:
	ldrsb r0, [r8, #1]!
	bl Stdi_IsSpace
	cmp r0, #0
	bne _0208542C
_0208543C:
	ldrsb r0, [sb]
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085AC8
_0208544C:
	ldrsb r0, [sb, #1]!
	bl Stdi_IsSpace
	cmp r0, #0
	bne _0208544C
	b _02085AC8
_02085460:
	cmp r4, #0x25
	beq _020854A0
	ldrsb r0, [sb]
	cmp r4, r0
	bne _02085AD4
	and r0, r4, #0xff
	eor r0, r0, #0x20
	sub r0, r0, #0xa1
	cmp r0, #0x3c
	bhs _02085494
	ldrsb r0, [sb, #1]!
	cmp r4, r0
	bne _02085AD4
_02085494:
	add sb, sb, #1
	add r8, r8, #1
	b _02085AC8
_020854A0:
	ldrsb r0, [r8, #1]
	cmp r0, #0x25
	bne _020854C0
	ldrsb r0, [sb]
	cmp r4, r0
	bne _02085AD4
	add r8, r8, #2
	b _02085AC8
_020854C0:
	ldrsb r0, [r8, #1]!
	mov sl, #0
	mov r5, sl
	cmp r0, #0x2a
	mov fp, sl
	mov r6, sl
	orreq r5, sl, #0x2000
	ldreqsb r0, [r8, #1]!
	mov r1, #0xa
	b _020854F4
_020854E8:
	mla r2, r6, r1, r0
	ldrsb r0, [r8, #1]!
	sub r6, r2, #0x30
_020854F4:
	cmp r0, #0x30
	blt _02085504
	cmp r0, #0x39
	ble _020854E8
_02085504:
	cmp r0, #0x68
	beq _02085518
	cmp r0, #0x6c
	beq _02085530
	b _02085544
_02085518:
	ldrsb r0, [r8, #1]!
	cmp r0, #0x68
	orrne r5, r5, #0x40
	orreq r5, r5, #0x100
	ldreqsb r0, [r8, #1]!
	b _02085544
_02085530:
	ldrsb r0, [r8, #1]!
	cmp r0, #0x6c
	orrne r5, r5, #0x20
	ldreqsb r0, [r8, #1]!
	orreq r5, r5, #0x80
_02085544:
	cmp r0, #0x69
	bgt _02085590
	cmp r0, #0x64
	blt _02085564
	beq _020855D8
	cmp r0, #0x69
	beq _020855E0
	b _02085AD4
_02085564:
	cmp r0, #0x5b
	bgt _02085584
	cmp r0, #0x58
	blt _02085AD4
	beq _020855FC
	cmp r0, #0x5b
	beq _020858D0
	b _02085AD4
_02085584:
	cmp r0, #0x63
	beq _020857D8
	b _02085AD4
_02085590:
	cmp r0, #0x6e
	bgt _020855A0
	beq _02085608
	b _02085AD4
_020855A0:
	sub r1, r0, #0x6f
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _02085AD4
_020855B0: ; jump table
	b _020855E8 ; case 0
	b _020855FC ; case 1
	b _02085AD4 ; case 2
	b _02085AD4 ; case 3
	b _020857D8 ; case 4
	b _02085AD4 ; case 5
	b _020855F0 ; case 6
	b _02085AD4 ; case 7
	b _02085AD4 ; case 8
	b _020855FC ; case 9
_020855D8:
	mov r4, #0xa
	b _0208562C
_020855E0:
	mvn r4, #0
	b _0208562C
_020855E8:
	mov r4, #8
	b _0208562C
_020855F0:
	orr r5, r5, #0x1000
	mov r4, #0xa
	b _0208562C
_020855FC:
	orr r5, r5, #0x1000
	mov r4, #0x10
	b _0208562C
_02085608:
	tst r5, #0x2000
	ldreq r0, [sp, #4]
	add r8, r8, #1
	subeq r0, r0, #1
	streq r0, [sp, #4]
	ldr r0, [sp, #0x10]
	sub sl, sb, r0
	mov fp, sl, asr #0x1f
	b _0208574C
_0208562C:
	ldrsb r7, [sb]
	add r8, r8, #1
	mov r0, r7
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085658
_02085644:
	ldrsb r7, [sb, #1]!
	mov r0, r7
	bl Stdi_IsSpace
	cmp r0, #0
	bne _02085644
_02085658:
	cmp r7, #0x2b
	orreq r5, r5, #2
	beq _02085670
	cmp r7, #0x2d
	bne _02085678
	orr r5, r5, #8
_02085670:
	ldrsb r7, [sb, #1]!
	b _02085658
_02085678:
	mvn r0, #0
	cmp r4, r0
	bne _020856A4
	cmp r7, #0x30
	movne r4, #0xa
	bne _020856A4
	ldrsb r0, [sb, #1]
	cmp r0, #0x78
	cmpne r0, #0x58
	moveq r4, #0x10
	movne r4, #8
_020856A4:
	cmp r4, #0x10
	cmpeq r7, #0x30
	bne _020856C0
	ldrsb r0, [sb, #1]
	cmp r0, #0x78
	cmpne r0, #0x58
	ldreqsb r7, [sb, #2]!
_020856C0:
	cmp r6, #0
	mvneq r6, #0x80000000
	cmp r6, #0
	mov r2, #0
	ble _0208572C
	mov ip, r4, asr #0x1f
_020856D8:
	sub r3, r7, #0x30
	cmp r3, #0xa
	blo _02085700
	sub r0, r3, #0x31
	cmp r0, #6
	sublo r3, r3, #0x27
	blo _02085700
	sub r3, r3, #0x11
	cmp r3, #6
	addlo r3, r3, #0xa
_02085700:
	cmp r3, r4
	bhs _0208572C
	ldrsb r7, [sb, #1]!
	add r2, r2, #1
	umull r1, r0, sl, r4
	mla r0, sl, ip, r0
	adds sl, r3, r1
	mla r0, fp, r4, r0
	adc fp, r0, #0
	cmp r2, r6
	blt _020856D8
_0208572C:
	cmp r2, #0
	beq _02085AD4
	tst r5, #8
	beq _02085744
	rsbs sl, sl, #0
	rsc fp, fp, #0
_02085744:
	mov r0, #1
	str r0, [sp, #0xc]
_0208574C:
	tst r5, #0x2000
	bne _02085AC8
	ldr r0, [sp, #4]
	tst r5, #0x100
	add r0, r0, #1
	str r0, [sp, #4]
	beq _02085780
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	strb sl, [r0]
	b _02085AC8
_02085780:
	tst r5, #0x40
	beq _020857A0
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	strh sl, [r0]
	b _02085AC8
_020857A0:
	tst r5, #0x80
	beq _020857C0
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	stmia r0, {sl, fp}
	b _02085AC8
_020857C0:
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	str sl, [r0]
	b _02085AC8
_020857D8:
	mov r1, #1
	tst r5, #0x2000
	add r8, r8, #1
	mov r4, #0
	str r1, [sp, #0xc]
	bne _0208580C
	ldr r1, [sp]
	add r1, r1, #4
	str r1, [sp]
	ldr r4, [r1, #-4]
	ldr r1, [sp, #4]
	add r1, r1, #1
	str r1, [sp, #4]
_0208580C:
	cmp r0, #0x73
	bne _02085888
	ldrsb r5, [sb]
	cmp r6, #0
	mvneq r6, #0x80000000
	mov r0, r5
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085858
_02085830:
	ldrsb r5, [sb, #1]!
	mov r0, r5
	bl Stdi_IsSpace
	cmp r0, #0
	bne _02085830
	b _02085858
_02085848:
	cmp r4, #0
	strneb r5, [r4], #1
	ldrsb r5, [sb, #1]!
	sub r6, r6, #1
_02085858:
	cmp r5, #0
	beq _02085878
	mov r0, r5
	bl Stdi_IsSpace
	cmp r0, #0
	bne _02085878
	cmp r6, #0
	bgt _02085848
_02085878:
	cmp r4, #0
	movne r0, #0
	strneb r0, [r4]
	b _02085AC8
_02085888:
	cmp r6, #0
	moveq r6, #1
	ldrsb r0, [sb]
	b _020858A8
_02085898:
	cmp r4, #0
	strneb r0, [r4], #1
	ldrsb r0, [sb, #1]!
	sub r6, r6, #1
_020858A8:
	cmp r0, #0
	beq _020858B8
	cmp r6, #0
	bgt _02085898
_020858B8:
	cmp r4, #0
	beq _02085AC8
	cmp r6, #0
	movgt r0, #0
	strgtb r0, [r4]
	b _02085AC8
_020858D0:
	mov sl, #0
	mov r3, #1
	add r1, sp, #0x14
	mov r0, sl
	mov r2, #0x20
	mov r7, sl
	mov fp, sl
	str r3, [sp, #8]
	bl MTi_CpuClear32
	ldrsb r0, [r8, #1]!
	cmp r0, #0x5e
	moveq r0, sl
	addeq r8, r8, #1
	streq r0, [sp, #8]
	ldrsb r0, [r8]
	cmp r0, #0x5d
	bne _02085938
	and r2, r0, #0xff
	mov r0, r2, lsr #5
	add r1, sp, #0x14
	ldr r4, [r1, r0, lsl #2]
	and r2, r2, #0x1f
	mov r3, #1
	orr r2, r4, r3, lsl r2
	str r2, [r1, r0, lsl #2]
	add r8, r8, #1
_02085938:
	add r4, sp, #0x14
_0208593C:
	ldrsb r0, [r8]
	cmp r0, #0
	cmpne r0, #0x5d
	bne _0208598C
	cmp fp, #0
	beq _0208597C
	add r4, sp, #0x14
	mov r3, r7, lsr #5
	ldr r2, [r4, r3, lsl #2]
	and r0, r7, #0x1f
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [r4, r3, lsl #2]
	ldr r0, [sp, #0x18]
	orr r0, r0, #0x2000
	str r0, [sp, #0x18]
_0208597C:
	ldrsb r0, [r8]
	cmp r0, #0x5d
	addeq r8, r8, #1
	b _02085A38
_0208598C:
	cmp fp, #0
	bne _020859CC
	cmp r7, #0
	beq _020859A8
	cmp r0, #0x2d
	moveq fp, #1
	beq _02085A30
_020859A8:
	and r0, r0, #0xff
	mov r3, r0, lsr #5
	ldr r2, [r4, r3, lsl #2]
	and r1, r0, #0x1f
	mov r0, #1
	orr r0, r2, r0, lsl r1
	str r0, [r4, r3, lsl #2]
	ldrb r7, [r8]
	b _02085A30
_020859CC:
	and r2, r0, #0xff
	cmp r7, r2
	bls _02085A18
	mov r1, r7, lsr #5
	ldr fp, [r4, r1, lsl #2]
	and r7, r7, #0x1f
	mov r3, #1
	orr r3, fp, r3, lsl r7
	str r3, [r4, r1, lsl #2]
	ldr r1, [sp, #0x18]
	mov r0, r2, lsr #5
	orr r1, r1, #0x2000
	str r1, [sp, #0x18]
	ldr r3, [r4, r0, lsl #2]
	and r2, r2, #0x1f
	mov r1, #1
	orr r1, r3, r1, lsl r2
	str r1, [r4, r0, lsl #2]
	b _02085A28
_02085A18:
	mov r1, r7
	add r2, r2, #1
	mov r0, r4
	bl Stdi_FillBitset
_02085A28:
	mov fp, #0
	mov r7, fp
_02085A30:
	add r8, r8, #1
	b _0208593C
_02085A38:
	mov r0, #1
	tst r5, #0x2000
	str r0, [sp, #0xc]
	bne _02085A64
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr sl, [r0, #-4]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02085A64:
	cmp r6, #0
	mvneq r6, #0x80000000
	ldrsb r0, [sb]
	add r3, sp, #0x14
	b _02085AAC
_02085A78:
	and r4, r0, #0xff
	mov r1, r4, lsr #5
	ldr r2, [r3, r1, lsl #2]
	and r1, r4, #0x1f
	mov r1, r2, lsr r1
	and r2, r1, #1
	ldr r1, [sp, #8]
	cmp r1, r2
	bne _02085ABC
	cmp sl, #0
	strneb r0, [sl], #1
	ldrsb r0, [sb, #1]!
	sub r6, r6, #1
_02085AAC:
	cmp r0, #0
	beq _02085ABC
	cmp r6, #0
	bgt _02085A78
_02085ABC:
	cmp sl, #0
	movne r0, #0
	strneb r0, [sl]
_02085AC8:
	ldrsb r4, [r8]
	cmp r4, #0
	bne _0208540C
_02085AD4:
	ldrsb r0, [sb]
	cmp r0, #0
	ldreq r0, [sp, #0xc]
	cmpeq r0, #0
	mvneq r0, #0
	streq r0, [sp, #4]
	ldr r0, [sp, #4]
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Std_TvsScanf

	arm_func_start string_put_char
string_put_char: ; 0x02085AF8
	ldr r2, [r0]
	cmp r2, #0
	beq _02085B18
	ldr r2, [r0, #4]
	strb r1, [r2]
	ldr r1, [r0]
	sub r1, r1, #1
	str r1, [r0]
_02085B18:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end string_put_char

	arm_func_start string_fill_char
string_fill_char: ; 0x02085B28
	stmdb sp!, {r3, lr}
	cmp r2, #0
	ldmleia sp!, {r3, pc}
	ldr lr, [r0]
	mov ip, #0
	cmp lr, r2
	movhi lr, r2
	cmp lr, #0
	bls _02085B60
_02085B4C:
	ldr r3, [r0, #4]
	strb r1, [r3, ip]
	add ip, ip, #1
	cmp ip, lr
	blo _02085B4C
_02085B60:
	ldr r1, [r0]
	sub r1, r1, lr
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end string_fill_char

	arm_func_start string_put_string
string_put_string: ; 0x02085B7C
	stmdb sp!, {r4, lr}
	cmp r2, #0
	ldmleia sp!, {r4, pc}
	ldr r4, [r0]
	mov lr, #0
	cmp r4, r2
	movhi r4, r2
	cmp r4, #0
	bls _02085BB8
_02085BA0:
	ldrsb ip, [r1, lr]
	ldr r3, [r0, #4]
	strb ip, [r3, lr]
	add lr, lr, #1
	cmp lr, r4
	blo _02085BA0
_02085BB8:
	ldr r1, [r0]
	sub r1, r1, r4
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end string_put_string

	arm_func_start OS_VsNPrintfEx
OS_VsNPrintfEx: ; 0x02085BD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r2
	str r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldrsb r0, [sb]
	str r1, [sp]
	mov fp, r3
	cmp r0, #0
	beq _02086400
_02085C00:
	ldrsb r1, [sb]
	and r0, r1, #0xff
	eor r0, r0, #0x20
	sub r0, r0, #0xa1
	cmp r0, #0x3c
	bhs _02085C3C
	add r0, sp, #0xc
	bl string_put_char
	ldrsb r1, [sb, #1]!
	cmp r1, #0
	beq _020863F4
	add r0, sp, #0xc
	add sb, sb, #1
	bl string_put_char
	b _020863F4
_02085C3C:
	cmp r1, #0x25
	beq _02085C54
	add r0, sp, #0xc
	add sb, sb, #1
	bl string_put_char
	b _020863F4
_02085C54:
	mov r5, #0
	mov sl, r5
	mov r2, sb
	sub r6, r5, #1
	mov r0, #0xa
	mov r3, #0x57
_02085C6C:
	ldrsb r4, [sb, #1]!
	cmp r4, #0x20
	bgt _02085C80
	beq _02085CBC
	b _02085CD4
_02085C80:
	cmp r4, #0x30
	bgt _02085CD4
	cmp r4, #0x2b
	blt _02085CD4
	beq _02085CA8
	cmp r4, #0x2d
	beq _02085CC4
	cmp r4, #0x30
	beq _02085CCC
	b _02085CD4
_02085CA8:
	ldrsb r1, [sb, #-1]
	cmp r1, #0x20
	bne _02085CD4
	orr r5, r5, #2
	b _02085C6C
_02085CBC:
	orr r5, r5, #1
	b _02085C6C
_02085CC4:
	orr r5, r5, #8
	b _02085C6C
_02085CCC:
	orr r5, r5, #0x10
	b _02085C6C
_02085CD4:
	cmp r4, #0x2a
	bne _02085CF8
	add fp, fp, #4
	ldr sl, [fp, #-4]
	add sb, sb, #1
	cmp sl, #0
	rsblt sl, sl, #0
	orrlt r5, r5, #8
	b _02085D20
_02085CF8:
	mov r1, #0xa
	b _02085D0C
_02085D00:
	ldrsb r4, [sb], #1
	mla r4, sl, r1, r4
	sub sl, r4, #0x30
_02085D0C:
	ldrsb r4, [sb]
	cmp r4, #0x30
	blt _02085D20
	cmp r4, #0x39
	ble _02085D00
_02085D20:
	ldrsb r1, [sb]
	cmp r1, #0x2e
	bne _02085D7C
	ldrsb r1, [sb, #1]!
	mov r6, #0
	cmp r1, #0x2a
	bne _02085D54
	add fp, fp, #4
	ldr r6, [fp, #-4]
	add sb, sb, #1
	cmp r6, #0
	mvnlt r6, #0
	b _02085D7C
_02085D54:
	mov r1, #0xa
	b _02085D68
_02085D5C:
	ldrsb r4, [sb], #1
	mla r4, r6, r1, r4
	sub r6, r4, #0x30
_02085D68:
	ldrsb r4, [sb]
	cmp r4, #0x30
	blt _02085D7C
	cmp r4, #0x39
	ble _02085D5C
_02085D7C:
	ldrsb r1, [sb]
	cmp r1, #0x68
	beq _02085D94
	cmp r1, #0x6c
	beq _02085DAC
	b _02085DC0
_02085D94:
	ldrsb r1, [sb, #1]!
	cmp r1, #0x68
	orrne r5, r5, #0x40
	addeq sb, sb, #1
	orreq r5, r5, #0x100
	b _02085DC0
_02085DAC:
	ldrsb r1, [sb, #1]!
	cmp r1, #0x6c
	orrne r5, r5, #0x20
	addeq sb, sb, #1
	orreq r5, r5, #0x80
_02085DC0:
	ldrsb r1, [sb]
	cmp r1, #0x69
	bgt _02085E04
	cmp r1, #0x63
	blt _02085DE8
	beq _02085E74
	cmp r1, #0x64
	cmpne r1, #0x69
	beq _0208602C
	b _02086010
_02085DE8:
	cmp r1, #0x25
	bgt _02085DF8
	beq _02085FF4
	b _02086010
_02085DF8:
	cmp r1, #0x58
	beq _02085E60
	b _02086010
_02085E04:
	cmp r1, #0x6e
	bgt _02085E14
	beq _02085F9C
	b _02086010
_02085E14:
	sub r1, r1, #0x6f
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _02086010
_02085E24: ; jump table
	b _02085E4C ; case 0
	b _02085E68 ; case 1
	b _02086010 ; case 2
	b _02086010 ; case 3
	b _02085EE8 ; case 4
	b _02086010 ; case 5
	b _02085E58 ; case 6
	b _02086010 ; case 7
	b _02086010 ; case 8
	b _02086024 ; case 9
_02085E4C:
	orr r5, r5, #0x1000
	mov r0, #8
	b _0208602C
_02085E58:
	orr r5, r5, #0x1000
	b _0208602C
_02085E60:
	mov r3, #0x37
	b _02086024
_02085E68:
	orr r5, r5, #4
	mov r6, #8
	b _02086024
_02085E74:
	cmp r6, #0
	bge _02086010
	add fp, fp, #4
	tst r5, #8
	ldr r4, [fp, #-4]
	beq _02085EB0
	mov r1, r4, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	bl string_put_char
	add r0, sp, #0xc
	sub r2, sl, #1
	mov r1, #0x20
	bl string_fill_char
	b _02085EE0
_02085EB0:
	tst r5, #0x10
	movne r0, #0x30
	moveq r0, #0x20
	mov r1, r0, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	sub r2, sl, #1
	bl string_fill_char
	mov r1, r4, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	bl string_put_char
_02085EE0:
	add sb, sb, #1
	b _020863F4
_02085EE8:
	add fp, fp, #4
	cmp r6, #0
	ldr r7, [fp, #-4]
	mov r4, #0
	bge _02085F20
	ldrsb r0, [r7]
	cmp r0, #0
	beq _02085F34
_02085F08:
	add r4, r4, #1
	ldrsb r0, [r7, r4]
	cmp r0, #0
	bne _02085F08
	b _02085F34
_02085F1C:
	add r4, r4, #1
_02085F20:
	cmp r4, r6
	bge _02085F34
	ldrsb r0, [r7, r4]
	cmp r0, #0
	bne _02085F1C
_02085F34:
	tst r5, #8
	sub sl, sl, r4
	beq _02085F64
	add r0, sp, #0xc
	mov r1, r7
	mov r2, r4
	bl string_put_string
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl string_fill_char
	b _02085F94
_02085F64:
	tst r5, #0x10
	movne r0, #0x30
	moveq r0, #0x20
	mov r1, r0, lsl #0x18
	add r0, sp, #0xc
	mov r2, sl
	mov r1, r1, asr #0x18
	bl string_fill_char
	add r0, sp, #0xc
	mov r1, r7
	mov r2, r4
	bl string_put_string
_02085F94:
	add sb, sb, #1
	b _020863F4
_02085F9C:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	tst r5, #0x100
	sub r2, r1, r0
	bne _02085FEC
	tst r5, #0x40
	beq _02085FC8
	add fp, fp, #4
	ldr r0, [fp, #-4]
	strh r2, [r0]
	b _02085FEC
_02085FC8:
	add fp, fp, #4
	tst r5, #0x80
	ldreq r0, [fp, #-4]
	streq r2, [r0]
	beq _02085FEC
	ldr r0, [fp, #-4]
	mov r1, r2, asr #0x1f
	str r2, [r0]
	str r1, [r0, #4]
_02085FEC:
	add sb, sb, #1
	b _020863F4
_02085FF4:
	add r0, r2, #1
	cmp r0, sb
	bne _02086010
	add r0, sp, #0xc
	add sb, sb, #1
	bl string_put_char
	b _020863F4
_02086010:
	mov r1, r2
	add r0, sp, #0xc
	sub r2, sb, r2
	bl string_put_string
	b _020863F4
_02086024:
	orr r5, r5, #0x1000
	mov r0, #0x10
_0208602C:
	tst r5, #8
	bicne r5, r5, #0x10
	cmp r6, #0
	bicge r5, r5, #0x10
	movlt r6, #1
	mov r4, #0
	tst r5, #0x1000
	beq _020860EC
	tst r5, #0x100
	beq _02086064
	add fp, fp, #4
	ldrb r7, [fp, #-4]
	mov r1, #0
	b _0208609C
_02086064:
	tst r5, #0x40
	beq _0208607C
	add fp, fp, #4
	ldrh r7, [fp, #-4]
	mov r1, #0
	b _0208609C
_0208607C:
	tst r5, #0x80
	addeq fp, fp, #4
	ldreq r7, [fp, #-4]
	moveq r1, #0
	beq _0208609C
	add fp, fp, #8
	ldr r7, [fp, #-8]
	ldr r1, [fp, #-4]
_0208609C:
	bic r5, r5, #3
	tst r5, #4
	beq _020861AC
	cmp r0, #0x10
	bne _020860D4
	cmp r1, #0
	cmpeq r7, #0
	beq _020861AC
	add r4, r3, #0x21
	mov r2, #0x30
	strb r4, [sp, #8]
	strb r2, [sp, #9]
	mov r4, #2
	b _020861AC
_020860D4:
	cmp r0, #8
	bne _020861AC
	mov r2, #0x30
	strb r2, [sp, #8]
	mov r4, #1
	b _020861AC
_020860EC:
	tst r5, #0x100
	beq _02086104
	add fp, fp, #4
	ldrsb r7, [fp, #-4]
	mov r1, r7, asr #0x1f
	b _0208613C
_02086104:
	tst r5, #0x40
	beq _0208611C
	add fp, fp, #4
	ldrsh r7, [fp, #-4]
	mov r1, r7, asr #0x1f
	b _0208613C
_0208611C:
	tst r5, #0x80
	addeq fp, fp, #4
	ldreq r7, [fp, #-4]
	moveq r1, r7, asr #0x1f
	beq _0208613C
	add fp, fp, #8
	ldr r7, [fp, #-8]
	ldr r1, [fp, #-4]
_0208613C:
	mov ip, #0
	and r2, ip, #0
	and r8, r1, #0x80000000
	cmp r2, #0
	cmpeq r8, #0
	beq _02086174
	mvn r4, r7
	mov r2, #0x2d
	mvn r1, r1
	strb r2, [sp, #8]
	adds r7, r4, #1
	adc r1, r1, ip
	mov r4, #1
	b _020861AC
_02086174:
	cmp r1, ip
	cmpeq r7, ip
	cmpeq r6, #0
	beq _020861AC
	tst r5, #2
	beq _0208619C
	mov r2, #0x2b
	strb r2, [sp, #8]
	mov r4, #1
	b _020861AC
_0208619C:
	tst r5, #1
	movne r2, #0x20
	strneb r2, [sp, #8]
	movne r4, #1
_020861AC:
	cmp r0, #8
	mov r8, #0
	beq _020861CC
	cmp r0, #0xa
	beq _02086218
	cmp r0, #0x10
	beq _020862B0
	b _020862FC
_020861CC:
	cmp r1, r8
	cmpeq r7, r8
	beq _020862FC
	add r2, sp, #0x18
	mov r0, r8
	mov lr, #7
	mov ip, r8
_020861E8:
	and r3, r7, lr
	add r3, r3, #0x30
	strb r3, [r2, r8]
	mov r3, r1, lsr #3
	cmp r3, r0
	mov r7, r7, lsr #3
	orr r7, r7, r1, lsl #29
	mov r1, r3
	cmpeq r7, ip
	add r8, r8, #1
	bne _020861E8
	b _020862FC
_02086218:
	mov r0, r8
	cmp r0, r8
	cmpeq r1, r8
	bne _02086264
	cmp r7, #0
	beq _020862FC
	ldr ip, _0208644C ; =0xCCCCCCCD
	add r3, sp, #0x18
	mov r2, #0xa
_0208623C:
	umull r1, r0, r7, ip
	movs r0, r0, lsr #3
	mul r1, r0, r2
	sub r1, r7, r1
	mov r7, r0
	add r0, r1, #0x30
	strb r0, [r3, r8]
	add r8, r8, #1
	bne _0208623C
	b _020862FC
_02086264:
	cmp r1, r8
	cmpeq r7, r8
	beq _020862FC
_02086270:
	mov r0, r7
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r2, #0xa
	umull r3, r2, r0, r2
	subs r2, r7, r3
	add r3, r2, #0x30
	add r2, sp, #0x18
	strb r3, [r2, r8]
	cmp r1, #0
	cmpeq r0, #0
	mov r7, r0
	add r8, r8, #1
	bne _02086270
	b _020862FC
_020862B0:
	cmp r1, r8
	cmpeq r7, r8
	beq _020862FC
	add ip, sp, #0x18
	mov lr, #0xf
_020862C4:
	and r2, r7, lr
	mov r7, r7, lsr #4
	mov r0, r1, lsr #4
	orr r7, r7, r1, lsl #28
	cmp r2, #0xa
	mov r1, r0
	addlt r0, r2, #0x30
	addge r0, r2, r3
	strb r0, [ip, r8]
	mov r0, #0
	cmp r1, r0
	cmpeq r7, r0
	add r8, r8, #1
	bne _020862C4
_020862FC:
	cmp r4, #0
	ble _02086324
	ldrsb r0, [sp, #8]
	cmp r0, #0x30
	bne _02086324
	add r0, sp, #0x18
	mov r1, #0x30
	strb r1, [r0, r8]
	add r8, r8, #1
	mov r4, #0
_02086324:
	tst r5, #0x10
	sub r6, r6, r8
	beq _02086340
	sub r0, sl, r8
	sub r0, r0, r4
	cmp r6, r0
	movlt r6, r0
_02086340:
	cmp r6, #0
	subgt sl, sl, r6
	add r0, r4, r8
	sub sl, sl, r0
	ands r0, r5, #8
	str r0, [sp, #4]
	bne _0208636C
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl string_fill_char
_0208636C:
	cmp r4, #0
	ble _02086398
	add r0, sp, #8
	add r5, r0, r4
	add r7, sp, #0xc
_02086380:
	ldrsb r1, [r5, #-1]!
	mov r0, r7
	sub r4, r4, #1
	bl string_put_char
	cmp r4, #0
	bgt _02086380
_02086398:
	add r0, sp, #0xc
	mov r2, r6
	mov r1, #0x30
	bl string_fill_char
	cmp r8, #0
	ble _020863D4
	add r0, sp, #0x18
	add r5, r0, r8
	add r4, sp, #0xc
_020863BC:
	ldrsb r1, [r5, #-1]!
	mov r0, r4
	sub r8, r8, #1
	bl string_put_char
	cmp r8, #0
	bgt _020863BC
_020863D4:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020863F0
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl string_fill_char
_020863F0:
	add sb, sb, #1
_020863F4:
	ldrsb r0, [sb]
	cmp r0, #0
	bne _02085C00
_02086400:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0208641C
	ldr r0, [sp, #0x10]
	mov r1, #0
	strb r1, [r0]
	b _02086438
_0208641C:
	ldr r0, [sp]
	cmp r0, #0
	beq _02086438
	ldr r1, [sp, #0x14]
	mov r2, #0
	add r0, r1, r0
	strb r2, [r0, #-1]
_02086438:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208644C: .word 0xCCCCCCCD
	arm_func_end OS_VsNPrintfEx

	arm_func_start NotANumber
NotANumber: ; 0x02086450
	ldr r0, _02086460 ; =_020B2FBC
	ldr ip, _02086464 ; =_f2d
	ldr r0, [r0]
	bx ip
	.align 2, 0
_02086460: .word _020B2FBC
_02086464: .word _f2d
	arm_func_end NotANumber

	arm_func_start _flush_line_buffered_output_files
_flush_line_buffered_output_files: ; 0x02086468
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _020864F0 ; =_020B2ED4
	mov r4, #0
	mov r5, #1
	mov r8, r0
	mvn sb, #0
	mov r7, r4
	mov r6, #0x4c
_02086488:
	ldr r1, [r0, #4]
	mov r2, r1, lsl #0x16
	movs r2, r2, lsr #0x1d
	beq _020864C8
	mov r1, r1, lsl #0x19
	mov r1, r1, lsr #0x1e
	tst r1, #1
	beq _020864C8
	ldr r1, [r0, #8]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	bne _020864C8
	bl fflush
	cmp r0, #0
	movne r4, sb
_020864C8:
	cmp r5, #3
	movge r0, r7
	bge _020864E0
	mul r0, r5, r6
	add r5, r5, #1
	add r0, r8, r0
_020864E0:
	cmp r0, #0
	bne _02086488
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020864F0: .word _020B2ED4
	arm_func_end _flush_line_buffered_output_files

	arm_func_start _flush_all
_flush_all: ; 0x020864F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _02086558 ; =_020B2ED4
	mov r4, #0
	mov r5, #1
	mov r8, r0
	mvn sb, #0
	mov r7, r4
	mov r6, #0x4c
_02086514:
	ldr r1, [r0, #4]
	mov r1, r1, lsl #0x16
	movs r1, r1, lsr #0x1d
	beq _02086530
	bl fflush
	cmp r0, #0
	movne r4, sb
_02086530:
	cmp r5, #3
	movge r0, r7
	bge _02086548
	mul r0, r5, r6
	add r5, r5, #1
	add r0, r8, r0
_02086548:
	cmp r0, #0
	bne _02086514
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02086558: .word _020B2ED4
	arm_func_end _flush_all
