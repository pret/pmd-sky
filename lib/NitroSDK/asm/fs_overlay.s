	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

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
	ldr r2, _0207FBA0 ; =fsi_arc_rom
	str r1, [sp, #4]
	str r2, [r0]
	str r2, [sp]
	str r1, [r0, #4]
	add sp, sp, #8
	bx lr
	.align 2, 0
_0207FBA0: .word fsi_arc_rom
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
	bl FS_InitFile
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

	arm_func_start FS_LoadOverlayInfo
FS_LoadOverlayInfo: ; 0x0207FC9C
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
	bl FS_InitFile
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
	ldr r3, _0207FD94 ; =fsi_arc_rom
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
_0207FD94: .word fsi_arc_rom
	arm_func_end FS_LoadOverlayInfo

	arm_func_start FS_LoadOverlayImage
FS_LoadOverlayImage: ; 0x0207FD98
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	mov r5, r0
	add r0, sp, #8
	bl FS_InitFile
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
	arm_func_end FS_LoadOverlayImage

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
	ldr r2, _0207FEB8 ; =fsi_digest_key_len
	add r1, sp, #4
	ldmia r2, {r0, r2}
	bl MI_CpuCopy8
	ldr r3, _0207FEB8 ; =fsi_digest_key_len
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
_0207FEB8: .word fsi_digest_key_len
	arm_func_end FSi_CompareDigest

	arm_func_start FS_StartOverlay
FS_StartOverlay: ; 0x0207FEBC
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
	arm_func_end FS_StartOverlay

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
	bl FS_LoadOverlayInfo
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

