	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

    arm_func_start FSi_StrNiCmp
FSi_StrNiCmp: ; 0x0207DEAC
	stmdb sp!, {r3, lr}
	cmp r2, #0
	mov lr, #0
	bls _0207DEF4
_0207DEBC:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	sub ip, ip, #0x41
	cmp ip, #0x19
	sub r3, r3, #0x41
	addls ip, ip, #0x20
	cmp r3, #0x19
	addls r3, r3, #0x20
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blo _0207DEBC
_0207DEF4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FSi_StrNiCmp

	arm_func_start FSi_ReadTable
FSi_ReadTable: ; 0x0207DEFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldr r4, [r7]
	mov r6, r2
	ldr r2, [r4, #0x1c]
	mov r0, r4
	orr r2, r2, #0x200
	str r2, [r4, #0x1c]
	ldr r2, [r7, #4]
	ldr r5, [r4, #0x50]
	mov r3, r6
	blx r5
	cmp r0, #0
	cmpne r0, #1
	beq _0207DF44
	cmp r0, #6
	beq _0207DF54
	b _0207DFAC
_0207DF44:
	ldr r1, [r4, #0x1c]
	bic r1, r1, #0x200
	str r1, [r4, #0x1c]
	b _0207DFAC
_0207DF54:
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DF9C
	mov r8, #0
	mov sb, #1
_0207DF7C:
	add r0, r4, #0xc
	bl OS_SleepThread
	ldr r0, [r4, #0x1c]
	tst r0, #0x200
	movne r0, sb
	moveq r0, r8
	cmp r0, #0
	bne _0207DF7C
_0207DF9C:
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0x14]
_0207DFAC:
	ldr r1, [r7, #4]
	add r1, r1, r6
	str r1, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FSi_ReadTable

	arm_func_start FSi_SeekDirDirect
FSi_SeekDirDirect: ; 0x0207DFBC
	ldr r3, [r0, #0xc]
	mov r2, #0
	orr r3, r3, #4
	str r3, [r0, #0xc]
	ldr r3, [r0, #8]
	ldr ip, _0207DFEC ; =FSi_TranslateCommand
	str r3, [r0, #0x30]
	str r2, [r0, #0x38]
	strh r2, [r0, #0x36]
	strh r1, [r0, #0x34]
	mov r1, #2
	bx ip
	.align 2, 0
_0207DFEC: .word FSi_TranslateCommand
	arm_func_end FSi_SeekDirDirect

	arm_func_start FSi_ReadFileCommand
FSi_ReadFileCommand: ; 0x0207DFF0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x48]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end FSi_ReadFileCommand

	arm_func_start FSi_WriteFileCommand
FSi_WriteFileCommand: ; 0x0207E01C
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x4c]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end FSi_WriteFileCommand

	arm_func_start FSi_SeekDirCommand
FSi_SeekDirCommand: ; 0x0207E048
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r4, [r6, #8]
	add r5, r6, #0x30
	str r4, [sp]
	ldrh r1, [r5, #4]
	ldr r2, [r4, #0x34]
	add r0, sp, #0
	add r3, r2, r1, lsl #3
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl FSi_ReadTable
	movs r3, r0
	bne _0207E0D0
	add ip, r6, #0x20
	ldmia r5, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldrh r0, [r5, #6]
	cmp r0, #0
	ldreq r0, [r5, #8]
	cmpeq r0, #0
	bne _0207E0C0
	ldrh r0, [sp, #0xc]
	strh r0, [r6, #0x26]
	ldr r1, [r4, #0x34]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r6, #0x28]
_0207E0C0:
	ldrh r1, [sp, #0xe]
	ldr r0, _0207E0DC ; =0x00000FFF
	and r0, r1, r0
	str r0, [r6, #0x2c]
_0207E0D0:
	mov r0, r3
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207E0DC: .word 0x00000FFF
	arm_func_end FSi_SeekDirCommand

	arm_func_start FSi_ReadDirCommand
FSi_ReadDirCommand: ; 0x0207E0E0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r4, [r5, #0x30]
	ldr r1, [r5, #8]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r3, [r5, #0x28]
	add r1, sp, #0
	mov r2, #1
	str r3, [sp, #8]
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldrb r1, [sp]
	and r2, r1, #0x7f
	mov r1, r1, asr #7
	str r2, [r4, #0x10]
	and r1, r1, #1
	str r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	cmp r2, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _0207E180
	add r0, sp, #4
	add r1, r4, #0x14
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r1, [r4, #0x10]
	mov r2, #0
	add r1, r4, r1
	strb r2, [r1, #0x14]
	b _0207E18C
_0207E180:
	ldr r1, [sp, #8]
	add r1, r1, r2
	str r1, [sp, #8]
_0207E18C:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _0207E1DC
	add r0, sp, #4
	add r1, sp, #2
	mov r2, #2
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r2, [r5, #8]
	ldr r1, _0207E208 ; =0x00000FFF
	str r2, [r4]
	ldrh r3, [sp, #2]
	mov r2, #0
	and r1, r3, r1
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	str r2, [r4, #8]
	b _0207E1F8
_0207E1DC:
	ldr r1, [r5, #8]
	str r1, [r4]
	ldrh r1, [r5, #0x26]
	str r1, [r4, #4]
	ldrh r1, [r5, #0x26]
	add r1, r1, #1
	strh r1, [r5, #0x26]
_0207E1F8:
	ldr r1, [sp, #8]
	str r1, [r5, #0x28]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0207E208: .word 0x00000FFF
	arm_func_end FSi_ReadDirCommand

	arm_func_start FSi_FindPathCommand
FSi_FindPathCommand: ; 0x0207E20C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x94
	mov sb, r0
	ldr r5, [sb, #0x3c]
	mov r1, #2
	ldr r6, [sb, #0x40]
	bl FSi_TranslateCommand
	ldrb r3, [r5]
	cmp r3, #0
	beq _0207E3C4
_0207E234:
	mov r8, #0
	mov r0, #1
	mov r1, r8
	b _0207E248
_0207E244:
	add r8, r8, #1
_0207E248:
	ldrb r7, [r5, r8]
	mov r2, r1
	cmp r7, #0
	cmpne r7, #0x2f
	cmpne r7, #0x5c
	movne r2, r0
	cmp r2, #0
	bne _0207E244
	cmp r7, #0
	cmpeq r6, #0
	movne r7, #1
	cmp r8, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r3, #0x2e
	bne _0207E2DC
	cmp r8, #1
	addeq r5, r5, #1
	beq _0207E3A8
	ldrb r0, [r5, #1]
	cmp r8, #2
	moveq r1, #1
	movne r1, #0
	cmp r0, #0x2e
	moveq r0, #1
	movne r0, #0
	tst r1, r0
	beq _0207E2DC
	ldrh r0, [sb, #0x24]
	cmp r0, #0
	beq _0207E2D4
	ldr r1, [sb, #0x2c]
	mov r0, sb
	bl FSi_SeekDirDirect
_0207E2D4:
	add r5, r5, #2
	b _0207E3A8
_0207E2DC:
	cmp r8, #0x7f
	addgt sp, sp, #0x94
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0
	mov r0, #0
	str r1, [sb, #0x30]
	str r0, [sb, #0x34]
	add sl, sp, #0x14
	mov r4, #3
_0207E304:
	mov r0, sb
	mov r1, r4
	bl FSi_TranslateCommand
	cmp r0, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [sp, #0xc]
	cmp r7, r0
	ldreq r0, [sp, #0x10]
	cmpeq r8, r0
	bne _0207E304
	mov r0, r5
	mov r1, sl
	mov r2, r8
	bl FSi_StrNiCmp
	cmp r0, #0
	bne _0207E304
	cmp r7, #0
	beq _0207E378
	add r0, sp, #0
	add r3, sb, #0x30
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, sb
	mov r1, #2
	add r5, r5, r8
	bl FSi_TranslateCommand
	b _0207E3A8
_0207E378:
	cmp r6, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add sp, sp, #0x94
	str r2, [r3]
	mov r0, #0
	str r1, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_0207E3A8:
	ldrb r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldrb r3, [r5, r0]!
	cmp r3, #0
	bne _0207E234
_0207E3C4:
	cmp r6, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	add r0, sb, #0x20
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #0
	add sp, sp, #0x94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end FSi_FindPathCommand

	arm_func_start FSi_GetPathCommand
FSi_GetPathCommand: ; 0x0207E3F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe0
	mov sl, r0
	ldr r1, [sl, #8]
	add r0, sp, #4
	str r1, [sp]
	bl FileInit
	ldr r0, [sl, #8]
	str r0, [sp, #0xc]
	ldr r0, [sl, #0xc]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldrneh sb, [sl, #0x24]
	movne r6, #0x10000
	bne _0207E4D4
	ldrh r0, [sl, #0x38]
	ldr r6, [sl, #0x20]
	cmp r0, #0
	ldrneh sb, [sl, #0x3a]
	bne _0207E4D4
	mov r7, #0
	mov r8, r7
	mov sb, #0x10000
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_0207E460:
	mov r0, r5
	mov r1, r7
	bl FSi_SeekDirDirect
	mov r2, #1
	cmp r7, #0
	mov r0, r5
	mov r1, #3
	ldreq r8, [sp, #0x30]
	str fp, [sp, #0x34]
	str r2, [sp, #0x38]
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E4C0
_0207E494:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	ldreqh sb, [sp, #0x28]
	beq _0207E4C0
	mov r0, r5
	mov r1, r4
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E494
_0207E4C0:
	cmp sb, #0x10000
	bne _0207E4D4
	add r7, r7, #1
	cmp r7, r8
	blo _0207E460
_0207E4D4:
	cmp sb, #0x10000
	bne _0207E4F0
	mov r0, #0
	strh r0, [sl, #0x38]
	add sp, sp, #0xe0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207E4F0:
	ldrh r0, [sl, #0x38]
	cmp r0, #0
	bne _0207E5D4
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0]
	cmp r0, #0xff
	addls r8, r1, #1
	bls _0207E520
	cmp r0, #0xff00
	addls r8, r1, #2
	addhi r8, r1, #3
_0207E520:
	cmp r6, #0x10000
	ldrne r0, [sp, #0x5c]
	add r8, r8, #2
	addne r8, r8, r0
	mov r7, sb
	cmp sb, #0
	beq _0207E5C8
	add r0, sp, #4
	mov r1, sb
	bl FSi_SeekDirDirect
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_0207E554:
	ldr r1, [sp, #0x30]
	mov r0, r5
	bl FSi_SeekDirDirect
	mov r1, #1
	str r1, [sp, #0x38]
	mov r0, r5
	mov r1, #3
	str fp, [sp, #0x34]
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E5BC
_0207E580:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _0207E5A8
	ldrh r0, [sp, #0x50]
	cmp r0, r7
	bne _0207E5A8
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	add r8, r8, r0
	b _0207E5BC
_0207E5A8:
	mov r0, r5
	mov r1, r4
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E580
_0207E5BC:
	ldrh r7, [sp, #0x28]
	cmp r7, #0
	bne _0207E554
_0207E5C8:
	add r0, r8, #1
	strh r0, [sl, #0x38]
	strh sb, [sl, #0x3a]
_0207E5D4:
	ldr r5, [sl, #0x30]
	cmp r5, #0
	addeq sp, sp, #0xe0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r4, [sl, #0x38]
	ldr r0, [sl, #0x34]
	cmp r0, r4
	addlo sp, sp, #0xe0
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp]
	mov r7, #0
	ldr r0, [r0]
	cmp r0, #0xff
	movls r8, #1
	bls _0207E624
	cmp r0, #0xff00
	movls r8, #2
	movhi r8, #3
_0207E624:
	ldr r0, [sp]
	mov r1, r5
	mov r2, r8
	bl MI_CpuCopy8
	add r1, r7, r8
	ldr r0, _0207E798 ; =_020B2BB0
	add r1, r5, r1
	mov r2, #2
	bl MI_CpuCopy8
	add r0, sp, #4
	mov r1, sb
	bl FSi_SeekDirDirect
	cmp r6, #0x10000
	beq _0207E6D4
	add r3, sp, #0x4c
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E6B0
	add r8, sp, #4
	mov r7, #3
_0207E688:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	beq _0207E6B0
	mov r0, r8
	mov r1, r7
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E688
_0207E6B0:
	ldr r0, [sp, #0x5c]
	add r1, r5, r4
	add r6, r0, #1
	add r0, sp, #0x60
	mov r2, r6
	sub r1, r1, r6
	bl MI_CpuCopy8
	sub r4, r4, r6
	b _0207E6E4
_0207E6D4:
	add r0, r5, r4
	mov r1, #0
	strb r1, [r0, #-1]
	sub r4, r4, #1
_0207E6E4:
	cmp sb, #0
	beq _0207E78C
	add sl, sp, #4
	mov r6, #3
	add r8, sp, #0x4c
	mov r7, #0
	mov fp, #0x2f
_0207E700:
	ldr r1, [sp, #0x30]
	mov r0, sl
	bl FSi_SeekDirDirect
	add r1, r5, r4
	str r8, [sp, #0x34]
	str r7, [sp, #0x38]
	strb fp, [r1, #-1]
	mov r0, sl
	mov r1, #3
	sub r4, r4, #1
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E780
_0207E734:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _0207E76C
	ldrh r0, [sp, #0x50]
	cmp r0, sb
	bne _0207E76C
	ldr sb, [sp, #0x5c]
	add r1, r5, r4
	add r0, sp, #0x60
	mov r2, sb
	sub r1, r1, sb
	bl MI_CpuCopy8
	sub r4, r4, sb
	b _0207E780
_0207E76C:
	mov r0, sl
	mov r1, r6
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E734
_0207E780:
	ldrh sb, [sp, #0x28]
	cmp sb, #0
	bne _0207E700
_0207E78C:
	mov r0, #0
	add sp, sp, #0xe0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207E798: .word _020B2BB0
	arm_func_end FSi_GetPathCommand

	arm_func_start FSi_OpenFileFastCommand
FSi_OpenFileFastCommand: ; 0x0207E79C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r1, [r5, #8]
	ldr r4, [r5, #0x34]
	ldr r0, [r1, #0x30]
	mov r2, r4, lsl #3
	cmp r0, r4, lsl #3
	addls sp, sp, #0x10
	movls r0, #1
	ldmlsia sp!, {r3, r4, r5, pc}
	str r1, [sp]
	ldr r1, [r1, #0x2c]
	add r0, sp, #0
	add r3, r1, r2
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #8]
	mov r0, r5
	str r1, [r5, #0x30]
	ldr r2, [sp, #0xc]
	mov r1, #7
	str r2, [r5, #0x34]
	str r4, [r5, #0x38]
	bl FSi_TranslateCommand
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end FSi_OpenFileFastCommand
