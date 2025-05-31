	.include "asm/macros.inc"
	.include "main_0206C9BC.inc"

	.text

; https://decomp.me/scratch/TZIsN
	arm_func_start DseMem_Allocate
DseMem_Allocate: ; 0x0206C9BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0206CAC4 ; =DRIVER_WORK
	mov lr, r0
	ldr r0, [r3, #0x6f4]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, _0206CAC8 ; =0x04000208
	cmp r1, #0
	ldrh ip, [r4]
	moveq r1, #0x10
	mov r0, #0
	sub r5, r1, #1
	strh r0, [r4]
	ldr r3, _0206CAC4 ; =DRIVER_WORK
	mvn r0, r5
	add r4, lr, r5
	and r4, r0, r4
	ldr r3, [r3, #0x6f4]
	add r6, r4, #0x10
_0206CA0C:
	ldr r4, [r3, #0xc]
	cmp r4, #0
	bne _0206CA2C
	ldr r4, _0206CAC4 ; =DRIVER_WORK
	ldr r7, [r3, #8]
	ldr r4, [r4, #0x6f8]
	sub r5, r4, r7
	b _0206CA40
_0206CA2C:
	ldr r7, [r3, #8]
	sub r5, r4, r7
	cmp r5, r6
	movlt r3, r4
	blt _0206CA0C
_0206CA40:
	cmp r5, r6
	bge _0206CA5C
	ldr r2, _0206CAC8 ; =0x04000208
	mov r0, #0
	ldrh r1, [r2]
	strh ip, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206CA5C:
	add r4, r7, #0x10
	sub r1, r1, #1
	add r1, r4, r1
	and r1, r0, r1
	sub r6, r1, #0x10
	add r4, r6, #0x10
	add r0, r4, lr
	str r0, [r6, #8]
	str r2, [r1, #-0x10]
	mov r0, #2
	strb r0, [r6, #4]
	mov r0, #0
	strb r0, [r6, #5]
	ldr r1, [r3, #0xc]
	ldr r5, _0206CAC8 ; =0x04000208
	str r1, [r6, #0xc]
	str r6, [r3, #0xc]
	strb r0, [r6, #6]
	strb r0, [r3, #6]
	ldrh r1, [r5]
	mov r1, r4
	mov r2, lr
	strh ip, [r5]
	bl ArrayFill32Fast
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206CAC4: .word DRIVER_WORK
_0206CAC8: .word 0x04000208
	arm_func_end DseMem_Allocate

	arm_func_start DseMem_AllocateThreadStack
DseMem_AllocateThreadStack: ; 0x0206CACC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _0206CC0C ; =DRIVER_WORK
	mov r6, r0
	ldr r0, [r3, #0x6f4]
	mov r5, r1
	cmp r0, #0
	bne _0206CB00
	mov r1, r6
	mov r2, r5
	mvn r0, #0xc1
	bl Dse_SetError
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0206CB00:
	ldr r3, _0206CC10 ; =0x04000208
	cmp r5, #0
	ldrh ip, [r3]
	moveq r5, #0x10
	sub r4, r5, #1
	mov r1, #0
	strh r1, [r3]
	ldr r0, _0206CC0C ; =DRIVER_WORK
	mvn lr, r4
	add r3, r6, r4
	and r3, lr, r3
	ldr r0, [r0, #0x6f4]
	mov r4, r1
	add r3, r3, #0x10
_0206CB38:
	ldr r8, [r0, #0xc]
	cmp r8, #0
	bne _0206CB64
	ldr r7, _0206CC0C ; =DRIVER_WORK
	ldr r8, [r0, #8]
	ldr sb, [r7, #0x6f8]
	sub r7, sb, r8
	cmp r7, r3
	movge r1, r0
	movge r4, sb
	b _0206CB80
_0206CB64:
	ldr r7, [r0, #8]
	sub r7, r8, r7
	cmp r7, r3
	movge r1, r0
	movge r4, r8
	mov r0, r8
	b _0206CB38
_0206CB80:
	cmp r1, #0
	bne _0206CB9C
	ldr r2, _0206CC10 ; =0x04000208
	mov r0, #0
	ldrh r1, [r2]
	strh ip, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0206CB9C:
	sub r0, r4, r3
	add r3, r0, #0x10
	sub r0, r5, #1
	add r0, r3, r0
	and r0, lr, r0
	str r2, [r0, #-0x10]
	sub r7, r0, #0x10
	add r4, r7, #0x10
	mov r0, #0x22
	strb r0, [r7, #4]
	mov r0, #0
	strb r0, [r7, #5]
	strb r5, [r7, #7]
	add r2, r4, r6
	str r2, [r7, #8]
	ldr r2, [r1, #0xc]
	ldr r3, _0206CC10 ; =0x04000208
	str r2, [r7, #0xc]
	str r7, [r1, #0xc]
	strb r0, [r7, #6]
	strb r0, [r1, #6]
	ldrh r1, [r3]
	mov r1, r4
	mov r2, r6
	strh ip, [r3]
	bl ArrayFill32Fast
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0206CC0C: .word DRIVER_WORK
_0206CC10: .word 0x04000208
	arm_func_end DseMem_AllocateThreadStack

	arm_func_start DseMem_Free
DseMem_Free: ; 0x0206CC14
	stmdb sp!, {r3, lr}
	ldr r2, _0206CCB4 ; =DRIVER_WORK
	mov r1, r0
	ldr r0, [r2, #0x6f4]
	cmp r0, #0
	bne _0206CC40
	mvn r0, #0xc1
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0xc1
	ldmia sp!, {r3, pc}
_0206CC40:
	ldr r0, _0206CCB8 ; =0x04000208
	mov ip, #0
	ldrh r3, [r0]
	sub lr, r1, #0x10
	strh ip, [r0]
	ldr r0, [r2, #0x6f4]
	cmp r0, lr
	beq _0206CC70
_0206CC60:
	mov ip, r0
	ldr r0, [r0, #0xc]
	cmp r0, lr
	bne _0206CC60
_0206CC70:
	cmp ip, #0
	beq _0206CC94
	ldr r0, [lr, #0xc]
	ldr r1, _0206CCB8 ; =0x04000208
	str r0, [ip, #0xc]
	ldrh r0, [r1]
	mov r0, #0
	strh r3, [r1]
	ldmia sp!, {r3, pc}
_0206CC94:
	ldr ip, _0206CCB8 ; =0x04000208
	mvn r0, #0x8b
	ldrh r2, [ip]
	mov r2, #0
	strh r3, [ip]
	bl Dse_SetError
	mvn r0, #0x8b
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206CCB4: .word DRIVER_WORK
_0206CCB8: .word 0x04000208
	arm_func_end DseMem_Free

	arm_func_start DseMem_Clear
DseMem_Clear: ; 0x0206CCBC
	cmp r1, #0x10
	blt _0206CCE4
	mov r2, #0
_0206CCC8:
	str r2, [r0, #0xc]
	str r2, [r0, #8]
	sub r1, r1, #0x10
	str r2, [r0, #4]
	cmp r1, #0x10
	str r2, [r0], #0x10
	bge _0206CCC8
_0206CCE4:
	cmp r1, #4
	blt _0206CD00
	mov r2, #0
_0206CCF0:
	sub r1, r1, #4
	cmp r1, #4
	str r2, [r0], #4
	bge _0206CCF0
_0206CD00:
	cmp r1, #0
	bxle lr
	mov r2, #0
_0206CD0C:
	strb r2, [r0], #1
	subs r1, r1, #1
	bne _0206CD0C
	bx lr
	arm_func_end DseMem_Clear

	arm_func_start DseFile_CheckHeader
DseFile_CheckHeader: ; 0x0206CD1C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0206CD98 ; =DRIVER_WORK
	mov r6, r0
	ldrsb r0, [r3]
	mov r4, r2
	mov r5, r1
	cmp r0, #0
	mvneq r4, #0xc0
	beq _0206CD80
	cmp r6, #0
	mvneq r4, #0x17
	beq _0206CD80
	beq _0206CD80
	ldr r0, [r6]
	bl DseUtil_ByteSwap32
	cmp r5, r0
	mvnne r4, #0x10
	bne _0206CD80
	cmp r4, #0
	ldrneh r0, [r6, #0xc]
	cmpne r0, r4
	mvnne r4, #0x12
	bne _0206CD80
	ldrh r0, [r6, #0xe]
	ldmia sp!, {r4, r5, r6, pc}
_0206CD80:
	mov r0, r4
	mov r1, r6
	mov r2, #0
	bl Dse_SetError
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206CD98: .word DRIVER_WORK
	arm_func_end DseFile_CheckHeader

	arm_func_start DseSwd_SysInit
DseSwd_SysInit: ; 0x0206CD9C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r3, _0206CE18 ; =_022B8330
	mov r1, #0x4000
	str r1, [r3, #0xde0]
	mov ip, #0
	str ip, [r3, #0xde4]
	mov r4, r0
	str ip, [r3, #0xde8]
	strb r4, [r3, #0xdec]
	strb ip, [r3, #0xded]
	strb ip, [r3, #0xdee]
	ldr r2, _0206CE1C ; =0x72727473
	mov r0, #0x800
	mov r1, #0x10
	strb ip, [r3, #0xdef]
	bl DseMem_AllocateThreadStack
	ldr r1, _0206CE18 ; =_022B8330
	mov r2, #0x800
	str r0, [r1, #0xeb0]
	stmia sp, {r2, r4}
	ldr r2, [r1, #0xeb0]
	ldr r0, _0206CE20 ; =_022B9120
	add r3, r2, #0x800
	ldr r1, _0206CE24 ; =DseSwd_SampleLoaderMain
	mov r2, #0
	bl StartThread
	ldr r0, _0206CE20 ; =_022B9120
	bl sub_02079940
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206CE18: .word _022B8330
_0206CE1C: .word 0x72727473
_0206CE20: .word _022B9120
_0206CE24: .word DseSwd_SampleLoaderMain
	arm_func_end DseSwd_SysInit

	arm_func_start DseSwd_SysQuit
DseSwd_SysQuit: ; 0xDseSwd_SysQuit
	stmdb sp!, {r3, lr}
	ldr r1, _0206CE60 ; =_022B8330
	mov r2, #0
	ldr r0, _0206CE64 ; =_022B9120
	strb r2, [r1, #0xded]
	mov r2, #1
	strb r2, [r1, #0xdee]
	bl sub_02079940
	ldr r0, _0206CE64 ; =_022B9120
	bl sub_02079800
	ldr r0, _0206CE60 ; =_022B8330
	ldr r0, [r0, #0xeb0]
	bl DseMem_Free
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206CE60: .word _022B8330
_0206CE64: .word _022B9120
	arm_func_end DseSwd_SysQuit

	arm_func_start DseSwd_SampleLoaderMain
DseSwd_SampleLoaderMain: ; 0x0206CE68
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _0206CEC4 ; =_022B8330
	mov r6, #0
	add r4, r5, #0xd00
	mov sb, #1
	mov r8, r6
	mov r7, r6
_0206CE84:
	mov r0, r8
	strb sb, [r5, #0xdef]
	bl sub_02079888
	strb r7, [r5, #0xdef]
	ldrsb r0, [r4, #0xee]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r5, #0xeb4]
	cmp r0, #0
	beq _0206CE84
	ldr r1, [r5, #0xeb8]
	bl DseSwd_LoadWavesInternal
	str r6, [r5, #0xeb4]
	str r6, [r5, #0xeb8]
	b _0206CE84
_0206CEC0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0206CEC4: .word _022B8330
	arm_func_end DseSwd_SampleLoaderMain

	arm_func_start DseSwd_MainBankDummyCallback
DseSwd_MainBankDummyCallback: ; 0x0206CEC8
	mov r0, #0
	bx lr
	arm_func_end DseSwd_MainBankDummyCallback

	arm_func_start DseSwd_LoadMainBank
DseSwd_LoadMainBank: ; 0x0206CED0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xb4
	movs r5, r0
	bne _0206CEFC
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	add sp, sp, #0xb4
	mvn r0, #0x17
	ldmia sp!, {r3, r4, r5, r6, pc}
_0206CEFC:
	ldr r4, _0206D0E8 ; =_022B8330
	cmp r1, #0
	moveq r1, #0x4000
	cmp r2, #0
	ldreq r2, _0206D0EC ; =DseSwd_MainBankDummyCallback
	str r1, [r4, #0xde0]
	str r2, [r4, #0xde4]
	add r0, sp, #0x1c
	str r3, [r4, #0xde8]
	bl DseSwd_InitMainBankFileReader
	add r0, sp, #0x1c
	mov r1, r5
	bl DseSwd_OpenMainBankFileReader
	cmp r0, #0
	addlt sp, sp, #0xb4
	ldmltia sp!, {r3, r4, r5, r6, pc}
	mov r2, #0x50
	mov r3, #0
	mov r6, #1
	add r4, sp, #4
	add r0, sp, #0x1c
	add r1, sp, #0x64
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r6, [sp, #0x14]
	str r6, [sp, #0x18]
	str r4, [sp]
	bl DseSwd_ReadMainBank
	ldr r1, _0206D0F0 ; =0x7377646C
	ldr r2, _0206D0F4 ; =0x00000415
	add r0, sp, #0x64
	mov r3, #4
	bl DseFile_CheckHeader
	movs r4, r0
	bpl _0206CFA4
	add r0, sp, #0x1c
	bl DseSwd_CloseMainBankFileReader
	add sp, sp, #0xb4
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, pc}
_0206CFA4:
	ldrh r0, [sp, #0x72]
	bl DseSwd_GetMainBankById
	cmp r0, #0
	beq _0206CFD8
	add r0, sp, #0x1c
	bl DseSwd_CloseMainBankFileReader
	mov r1, r4
	mvn r0, #0x47
	mov r2, #0
	bl Dse_SetError
	add sp, sp, #0xb4
	mvn r0, #0x47
	ldmia sp!, {r3, r4, r5, r6, pc}
_0206CFD8:
	ldr r6, [sp, #0xb0]
	ldr r2, _0206D0F8 ; =0x66767772
	add r0, r6, #0x60
	mov r1, #0x10
	bl DseMem_Allocate
	movs r4, r0
	bne _0206D018
	add r0, sp, #0x1c
	bl DseSwd_CloseMainBankFileReader
	mov r1, #0
	mov r2, r1
	mvn r0, #0x7f
	bl Dse_SetError
	add sp, sp, #0xb4
	mvn r0, #0x7f
	ldmia sp!, {r3, r4, r5, r6, pc}
_0206D018:
	ldrh r0, [sp, #0x72]
	add r3, r6, #0x70
	add r2, sp, #4
	strh r0, [r4]
	ldrsh ip, [sp, #0xaa]
	add r0, sp, #0x1c
	add r1, r4, #0x60
	strh ip, [r4, #2]
	str r3, [r4, #4]
	ldr ip, [sp, #0xb0]
	mov r3, #0x50
	str ip, [sp, #4]
	str ip, [sp, #8]
	str r2, [sp]
	add r2, ip, #0x10
	bl DseSwd_ReadMainBank
	ldr r0, [r4, #0x60]
	bl DseUtil_ByteSwap32
	ldr r1, _0206D0FC ; =0x77617669
	cmp r0, r1
	addne sp, sp, #0xb4
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	add r1, r4, #0x70
	add r0, sp, #0x1c
	str r1, [r4, #8]
	bl DseSwd_CloseMainBankFileReader
	mov r1, #0
	ldr r0, _0206D100 ; =0x04000208
	str r1, [r4, #0x5c]
	ldrh r3, [r0]
	ldr r2, _0206D104 ; =_022B910C
	strh r1, [r0]
	ldr r0, [r2]
	cmp r0, #0
	beq _0206D0B8
_0206D0A8:
	add r2, r0, #0x5c
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	bne _0206D0A8
_0206D0B8:
	ldr r1, _0206D100 ; =0x04000208
	str r4, [r2]
	ldrh r0, [r1]
	add r0, r4, #0x14
	strh r3, [r1]
	bl DseSwd_InitMainBankFileReader
	mov r1, r5
	add r0, r4, #0x14
	bl DseSwd_OpenMainBankFileReader
	ldrh r0, [r4]
	add sp, sp, #0xb4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0206D0E8: .word _022B8330
_0206D0EC: .word DseSwd_MainBankDummyCallback
_0206D0F0: .word 0x7377646C
_0206D0F4: .word 0x00000415
_0206D0F8: .word 0x66767772
_0206D0FC: .word 0x77617669
_0206D100: .word 0x04000208
_0206D104: .word _022B910C
	arm_func_end DseSwd_LoadMainBank

	arm_func_start DseSwd_LoadBank
DseSwd_LoadBank: ; 0x0206D108
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r2, [sp]
	ldr r1, _0206D2E4 ; =0x7377646C
	ldr r2, _0206D2E8 ; =0x00000415
	mov r3, #4
	mov sl, r0
	bl DseFile_CheckHeader
	movs r4, r0
	ldmmiia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_GetBankById
	cmp r0, #0
	beq _0206D158
	mov r1, r4
	mvn r0, #0x47
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x47
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206D158:
	ldr r2, _0206D2EC ; =0x69766177
	mov r0, #0x28
	mov r1, #0x10
	bl DseMem_Allocate
	movs sb, r0
	mov r1, #0
	bne _0206D188
	mov r2, r1
	mvn r0, #0x7f
	bl Dse_SetError
	mvn r0, #0x7f
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206D188:
	str sl, [sb]
	strh r4, [sb, #4]
	strh r1, [sb, #6]
	ldrsh r0, [sl, #0x46]
	add r8, sl, #0x50
	strh r0, [sb, #8]
	ldrsh r0, [sl, #0x48]
	strh r0, [sb, #0xa]
	ldrb r0, [sl, #0x4a]
	strb r0, [sb, #0xc]
	ldrb r0, [sl, #0x4b]
	strb r0, [sb, #0xd]
	str r1, [sb, #0x10]
	str r1, [sb, #0x14]
	str r1, [sb, #0x18]
	str r1, [sb, #0x1c]
	str r1, [sb, #0x20]
	str r1, [sb, #0x24]
	ldr r0, [sl, #0x50]
	bl DseUtil_ByteSwap32
	ldr r7, _0206D2F0 ; =0x656F6420
	cmp r0, r7
	beq _0206D270
	ldr fp, _0206D2F4 ; =0x77617669
	ldr r4, _0206D2F8 ; =0x70726769
	ldr r6, _0206D2FC ; =0x70636D64
	ldr r5, _0206D300 ; =0x6B677270
_0206D1F4:
	ldr r0, [r8]
	bl DseUtil_ByteSwap32
	cmp r0, r6
	bhi _0206D218
	bhs _0206D23C
	cmp r0, r5
	addeq r0, r8, #0x10
	streq r0, [sb, #0x18]
	b _0206D244
_0206D218:
	cmp r0, r4
	bhi _0206D22C
	addeq r0, r8, #0x10
	streq r0, [sb, #0x14]
	b _0206D244
_0206D22C:
	cmp r0, fp
	addeq r0, r8, #0x10
	streq r0, [sb, #0x10]
	b _0206D244
_0206D23C:
	add r0, r8, #0x10
	str r0, [sb, #0x1c]
_0206D244:
	ldrb r1, [r8, #8]
	ldr r0, [r8, #0xc]
	sub r2, r1, #1
	add r0, r0, #0x10
	mvn r1, r2
	add r0, r0, r2
	and r0, r1, r0
	ldr r0, [r8, r0]!
	bl DseUtil_ByteSwap32
	cmp r0, r7
	bne _0206D1F4
_0206D270:
	ldr r1, _0206D304 ; =0x04000208
	mov r0, #0
	ldrh r3, [r1]
	ldr r2, _0206D308 ; =_022B7990
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	beq _0206D2A0
_0206D290:
	add r2, r0, #0x24
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _0206D290
_0206D2A0:
	ldr r1, _0206D304 ; =0x04000208
	str sb, [r2]
	ldrh r0, [r1]
	strh r3, [r1]
	ldrb r0, [sl, #0x4b]
	cmp r0, #2
	bne _0206D2DC
	ldrh r1, [sl, #0x40]
	ldr r0, [sp]
	cmp r0, #0
	strh r1, [sb, #6]
	beq _0206D2DC
	ldrh r0, [sb, #4]
	ldr r1, [sp]
	bl DseSwd_LoadWaves
_0206D2DC:
	ldrh r0, [sb, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206D2E4: .word 0x7377646C
_0206D2E8: .word 0x00000415
_0206D2EC: .word 0x69766177
_0206D2F0: .word 0x656F6420
_0206D2F4: .word 0x77617669
_0206D2F8: .word 0x70726769
_0206D2FC: .word 0x70636D64
_0206D300: .word 0x6B677270
_0206D304: .word 0x04000208
_0206D308: .word _022B7990
	arm_func_end DseSwd_LoadBank

	arm_func_start DseSwd_IsBankLoading
DseSwd_IsBankLoading: ; 0x0206D30C
	ldr r0, _0206D324 ; =_022B8330
	ldr r0, [r0, #0xeb4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0206D324: .word _022B8330
	arm_func_end DseSwd_IsBankLoading

	arm_func_start DseSwd_LoadWaves
DseSwd_LoadWaves: ; 0x0206D328
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r6, r1
	bl DseSwd_GetBankById
	movs r4, r0
	bne _0206D358
	mov r1, r5
	mvn r0, #0x40
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x40
	ldmia sp!, {r4, r5, r6, pc}
_0206D358:
	ldrb r0, [r4, #0xd]
	cmp r0, #2
	mvnne r0, #0x4c
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r4, #6]
	bl DseSwd_GetMainBankById
	cmp r0, #0
	bne _0206D390
	mov r1, #0
	mov r2, r1
	mvn r0, #0x4b
	bl Dse_SetError
	mvn r0, #0x4b
	ldmia sp!, {r4, r5, r6, pc}
_0206D390:
	ldr r5, [r4, #0x20]
	cmp r5, #0
	bne _0206D3AC
	mov r0, r4
	mov r1, #0
	bl DseSwd_LoadWavesInternal
	mov r5, r0
_0206D3AC:
	cmp r6, #0
	beq _0206D3C8
	ldr r1, _0206D3D0 ; =_022B8330
	ldr r0, _0206D3D4 ; =_022B9120
	str r4, [r1, #0xeb4]
	str r6, [r1, #0xeb8]
	bl sub_02079940
_0206D3C8:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206D3D0: .word _022B8330
_0206D3D4: .word _022B9120
	arm_func_end DseSwd_LoadWaves

	arm_func_start DseSwd_LoadWavesInternal
DseSwd_LoadWavesInternal: ; 0x0206D3D8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sl, r0
	ldrh r0, [sl, #6]
	mov sb, r1
	bl DseSwd_GetMainBankById
	movs r4, r0
	bne _0206D414
	mov r1, #0
	mov r2, r1
	mvn r0, #0x4b
	bl Dse_SetError
	add sp, sp, #0x1c
	mvn r0, #0x4b
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206D414:
	mov r6, #0
	str r6, [sp, #8]
	ldr r0, [sl, #0x20]
	mov r5, sb
	str r0, [sp, #4]
	ldrsh r0, [sl, #8]
	mov r7, r6
	str r0, [sp, #0x14]
	ldrsh r0, [sl, #8]
	cmp r0, #0
	ble _0206D4D4
	add fp, sp, #4
_0206D444:
	mov r1, r7, lsl #0x10
	mov r0, sl
	mov r1, r1, asr #0x10
	bl ReadWaviEntry
	cmp r0, #0
	beq _0206D4C4
	str r5, [r0, #0x24]
	ldr r2, [r4, #8]
	mov r1, r7, lsl #1
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _0206D4C4
	add r2, r7, #1
	str r2, [sp, #0x18]
	ldr r2, [r0, #0x2c]
	ldr r0, [r0, #0x28]
	cmp sb, #0
	add r0, r2, r0
	mov r8, r0, lsl #2
	beq _0206D4BC
	str fp, [sp]
	ldr r0, [r4, #8]
	ldr r3, [r4, #4]
	add r0, r0, r1
	ldr ip, [r0, #0x24]
	mov r1, r5
	mov r2, r8
	add r0, r4, #0x14
	add r3, ip, r3
	bl DseSwd_ReadMainBank
_0206D4BC:
	add r6, r6, r8
	add r5, r5, r8
_0206D4C4:
	ldrsh r0, [sl, #8]
	add r7, r7, #1
	cmp r7, r0
	blt _0206D444
_0206D4D4:
	mov r0, r6
	str r6, [sl, #0x20]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DseSwd_LoadWavesInternal

	arm_func_start DseSwd_Unload
DseSwd_Unload: ; 0x0206D4E4
	stmdb sp!, {r4, lr}
	ldr r2, _0206D550 ; =0x04000208
	mov r1, #0
	ldrh ip, [r2]
	mov r4, r0
	ldr r3, _0206D554 ; =_022B7990
	strh r1, [r2]
	b _0206D508
_0206D504:
	add r3, r0, #0x24
_0206D508:
	ldr r0, [r3]
	cmp r0, #0
	ldrneh r1, [r0, #4]
	cmpne r1, r4
	bne _0206D504
	ldr r2, _0206D550 ; =0x04000208
	cmp r0, #0
	ldreqh r1, [r2]
	mvneq r0, #0x40
	streqh ip, [r2]
	ldmeqia sp!, {r4, pc}
	ldr r1, [r0, #0x24]
	str r1, [r3]
	ldrh r1, [r2]
	strh ip, [r2]
	bl DseMem_Free
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206D550: .word 0x04000208
_0206D554: .word _022B7990
	arm_func_end DseSwd_Unload

	arm_func_start ReadWaviEntry
ReadWaviEntry: ; 0x0206D558
	ldr r2, [r0, #0x10]
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	ldrsh r0, [r0, #8]
	cmp r0, r1
	movle r0, #0
	bxle lr
	mov r0, r1, lsl #1
	ldrh r0, [r2, r0]
	cmp r0, #0
	moveq r0, #0
	addne r0, r2, r0
	bx lr
	arm_func_end ReadWaviEntry

	arm_func_start DseSwd_GetInstrument
DseSwd_GetInstrument: ; 0x0206D590
	ldr r2, [r0, #0x14]
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	ldrsh r0, [r0, #0xa]
	cmp r0, r1
	movle r0, #0
	bxle lr
	mov r0, r1, lsl #1
	ldrh r0, [r2, r0]
	cmp r0, #0
	moveq r0, #0
	addne r0, r2, r0
	bx lr
	arm_func_end DseSwd_GetInstrument

	arm_func_start DseSwd_GetNextSplitInRange
DseSwd_GetNextSplitInRange: ; 0x0206D5C8
	stmdb sp!, {r3, lr}
	ldrb lr, [r0, #2]
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r1, #0
	addeq r1, r0, #0x60
	beq _0206D600
	ldrb ip, [r1, #1]
	sub r0, lr, #1
	cmp ip, r0
	movge r0, #0
	ldmgeia sp!, {r3, pc}
	add r1, r1, #0x30
_0206D600:
	sub r0, lr, #1
_0206D604:
	ldrb ip, [r1, #4]
	cmp r2, ip
	blo _0206D638
	ldrb ip, [r1, #5]
	cmp r2, ip
	bhi _0206D638
	ldrb ip, [r1, #8]
	cmp r3, ip
	blt _0206D638
	ldrb ip, [r1, #9]
	cmp r3, ip
	movle r0, r1
	ldmleia sp!, {r3, pc}
_0206D638:
	ldrb ip, [r1, #1]
	cmp ip, r0
	addlt r1, r1, #0x30
	blt _0206D604
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end DseSwd_GetNextSplitInRange

	arm_func_start DseSwd_GetMainBankById
DseSwd_GetMainBankById: ; 0x0206D650
	ldr r3, _0206D698 ; =0x04000208
	mov r2, #0
	ldrh ip, [r3]
	ldr r1, _0206D69C ; =_022B8330
	strh r2, [r3]
	ldr r3, [r1, #0xddc]
	cmp r3, #0
	beq _0206D684
_0206D670:
	ldrh r1, [r3]
	cmp r1, r0
	ldrne r3, [r3, #0x5c]
	cmpne r3, #0
	bne _0206D670
_0206D684:
	ldr r2, _0206D698 ; =0x04000208
	mov r0, r3
	ldrh r1, [r2]
	strh ip, [r2]
	bx lr
	.align 2, 0
_0206D698: .word 0x04000208
_0206D69C: .word _022B8330
	arm_func_end DseSwd_GetMainBankById

	arm_func_start DseSwd_GetBankById
DseSwd_GetBankById: ; 0x0206D6A0
	ldr r3, _0206D6E8 ; =0x04000208
	mov r2, #0
	ldrh ip, [r3]
	ldr r1, _0206D6EC ; =DRIVER_WORK
	strh r2, [r3]
	ldr r3, [r1, #0x660]
	cmp r3, #0
	beq _0206D6D4
_0206D6C0:
	ldrh r1, [r3, #4]
	cmp r1, r0
	ldrne r3, [r3, #0x24]
	cmpne r3, #0
	bne _0206D6C0
_0206D6D4:
	ldr r2, _0206D6E8 ; =0x04000208
	mov r0, r3
	ldrh r1, [r2]
	strh ip, [r2]
	bx lr
	.align 2, 0
_0206D6E8: .word 0x04000208
_0206D6EC: .word DRIVER_WORK
	arm_func_end DseSwd_GetBankById

	arm_func_start DseSwd_InitMainBankFileReader
DseSwd_InitMainBankFileReader: ; 0x0206D6F0
	stmdb sp!, {r3, lr}
	bl FileInit
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end DseSwd_InitMainBankFileReader

	arm_func_start DseSwd_OpenMainBankFileReader
DseSwd_OpenMainBankFileReader: ; 0x0206D700
	stmdb sp!, {r3, lr}
	bl sub_0207F6C4
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x27
	bl Dse_SetError
	mvn r0, #0x27
	ldmia sp!, {r3, pc}
	arm_func_end DseSwd_OpenMainBankFileReader

	arm_func_start DseSwd_CloseMainBankFileReader
DseSwd_CloseMainBankFileReader: ; 0x0206D72C
	stmdb sp!, {r3, lr}
	bl sub_0207F70C
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end DseSwd_CloseMainBankFileReader

	arm_func_start DseSwd_ReadMainBank
DseSwd_ReadMainBank: ; 0x0206D73C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, [sp, #0x28]
	mov sb, r1
	mov r8, r2
	mov r1, r3
	mov r2, #0
	mov sl, r0
	bl sub_0207F828
	str r8, [r7, #8]
	mov r0, #0
	str r0, [r7, #0xc]
	cmp r8, #0
	ble _0206D7F0
	ldr r5, _0206D7F8 ; =0x04000006
	ldr fp, _0206D7FC ; =_022B8330
	mov r4, #2
_0206D77C:
	ldr r6, [fp, #0xde0]
	cmp r8, r6
	movlt r6, r8
_0206D788:
	ldrh r0, [r5]
	cmp r0, #0xb4
	blt _0206D7A0
	mov r0, r4
	bl sub_02079B14
	b _0206D788
_0206D7A0:
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl sub_0207F808
	mov r0, sl
	bl sub_0207F748
	ldr r1, [r7, #0xc]
	mov r0, r7
	add r1, r1, r6
	str r1, [r7, #0xc]
	ldr r1, [r7, #4]
	sub r8, r8, r6
	add r1, r1, r6
	str r1, [r7, #4]
	add sb, sb, r6
	ldr r1, [fp, #0xde8]
	ldr r2, [fp, #0xde4]
	blx r2
	cmp r8, #0
	bgt _0206D77C
_0206D7F0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206D7F8: .word 0x04000006
_0206D7FC: .word _022B8330
	arm_func_end DseSwd_ReadMainBank

	arm_func_start DseBgm_DefaultSignalCallback
DseBgm_DefaultSignalCallback: ; 0x0206D800
	mov r0, #0
	bx lr
	arm_func_end DseBgm_DefaultSignalCallback

	arm_func_start DseBgm_Load
DseBgm_Load: ; 0x0206D808
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0206D8F8 ; =0x736D646C
	ldr r2, _0206D8FC ; =0x00000415
	mov r3, #4
	mov r7, r0
	bl DseFile_CheckHeader
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	add r6, r0, #0x10000
	mov r0, r6
	bl DseSequence_GetById
	cmp r0, #0
	beq _0206D854
	mov r1, r6
	mvn r0, #0x48
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206D854:
	mov r0, r7
	mov r1, #1
	bl FindSmdlSongChunk
	movs r5, r0
	bne _0206D880
	mov r1, r7
	mvn r0, #0x42
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x42
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206D880:
	ldrb r0, [r5, #6]
	ldrb r1, [r5, #7]
	ldr r2, _0206D900 ; =0x7165736D
	bl DseSequence_AllocateNew
	movs r4, r0
	mvneq r0, #0x7f
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r6, [r4, #0x28]
	mov r1, r5
	str r7, [r4, #0x1c]
	bl DseSequence_LoadSong
	mov r1, #0
	ldr r0, _0206D904 ; =0x04000208
	strb r1, [r4, #0xa]
	ldrh r3, [r0]
	ldr r2, _0206D908 ; =_022B7994
	strh r1, [r0]
	ldr r0, [r2]
	cmp r0, #0
	beq _0206D8E0
_0206D8D0:
	add r2, r0, #0xa4
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	bne _0206D8D0
_0206D8E0:
	ldr r1, _0206D904 ; =0x04000208
	str r4, [r2]
	ldrh r0, [r1]
	strh r3, [r1]
	ldr r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206D8F8: .word 0x736D646C
_0206D8FC: .word 0x00000415
_0206D900: .word 0x7165736D
_0206D904: .word 0x04000208
_0206D908: .word _022B7994
	arm_func_end DseBgm_Load

	arm_func_start DseBgm_Unload
DseBgm_Unload: ; 0x0206D90C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DseSequence_GetById
	cmp r0, #0
	bne _0206D938
	mov r1, r4
	mvn r0, #0x41
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x41
	ldmia sp!, {r4, pc}
_0206D938:
	bl DseSequence_Unload
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end DseBgm_Unload

	arm_func_start DseBgm_SetSignalCallback
DseBgm_SetSignalCallback: ; 0x0206D944
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl DseSequence_GetById
	cmp r0, #0
	bne _0206D978
	mov r1, r6
	mvn r0, #0x41
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x41
	ldmia sp!, {r4, r5, r6, pc}
_0206D978:
	cmp r5, #0
	strne r5, [r0, #0x9c]
	strne r4, [r0, #0xa0]
	bne _0206D998
	ldr r2, _0206D9A0 ; =DseBgm_DefaultSignalCallback
	mov r1, #0
	str r2, [r0, #0x9c]
	str r1, [r0, #0xa0]
_0206D998:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206D9A0: .word DseBgm_DefaultSignalCallback
	arm_func_end DseBgm_SetSignalCallback

	arm_func_start DseBgm_IsPlaying
DseBgm_IsPlaying: ; 0x0206D9A4
	stmdb sp!, {r3, lr}
	bl DseSequence_GetById
	cmp r0, #0
	mvneq r0, #0x41
	ldrnesb r0, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end DseBgm_IsPlaying

	arm_func_start ResumeBgm
ResumeBgm: ; 0x0206D9BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r4, r1
	mov r6, r2
	bl DseSequence_GetById
	movs r5, r0
	bne _0206D9F0
	mov r1, r7
	mvn r0, #0x41
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x41
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206D9F0:
	ldrsb r0, [r5, #1]
	cmp r0, #1
	bne _0206DA14
	mov r1, r7
	mvn r0, #0x3d
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x3d
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206DA14:
	ldrsb r0, [r5]
	cmp r0, #0
	moveq r6, #1
	cmp r6, #1
	bne _0206DA50
	ldrsb r0, [r5, #4]
	cmp r0, #1
	bne _0206DA40
	mov r0, r7
	mov r1, #0
	bl DseBgm_Stop
_0206DA40:
	mov r0, r5
	bl DseSequence_Reset
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
_0206DA50:
	mov r0, #0
	str r0, [r5, #0x68]
	strh r0, [r5, #0x74]
	strb r6, [r5, #2]
	bl sub_0206C688
	cmp r0, #0
	ldrnesb r0, [r5, #9]
	mov r1, #0
	mov r2, r1
	cmpne r0, #0
	movne ip, #1
	moveq ip, #0
	mov r0, r5
	mov r3, r4
	strb ip, [r5, #8]
	bl DseSequence_Start
	cmp r0, #0
	movge r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ResumeBgm

	arm_func_start DseBgm_Stop
DseBgm_Stop: ; 0x0206DA9C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl DseSequence_GetById
	cmp r0, #0
	mov r2, #0
	bne _0206DACC
	mov r1, r5
	mvn r0, #0x41
	bl Dse_SetError
	mvn r0, #0x41
	ldmia sp!, {r3, r4, r5, pc}
_0206DACC:
	mov r1, r4
	bl DseSequence_Stop
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseBgm_Stop

	arm_func_start DseBgm_StopAll
DseBgm_StopAll: ; 0x0206DADC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0206DB34 ; =0x04000208
	mov r2, #0
	ldrh r4, [r3]
	ldr r1, _0206DB38 ; =DRIVER_WORK
	mov r7, r0
	strh r2, [r3]
	ldr r6, [r1, #0x664]
	cmp r6, #0
	beq _0206DB24
	mov r5, r2
_0206DB08:
	mov r0, r6
	mov r1, r7
	mov r2, r5
	bl DseSequence_Stop
	ldr r6, [r6, #0xa4]
	cmp r6, #0
	bne _0206DB08
_0206DB24:
	ldr r1, _0206DB34 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206DB34: .word 0x04000208
_0206DB38: .word DRIVER_WORK
	arm_func_end DseBgm_StopAll

	arm_func_start DseBgm_SetFades
DseBgm_SetFades: ; 0x0206DB3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl DseSequence_GetById
	cmp r0, #0
	bne _0206DB6C
	mov r1, r5
	mvn r0, #0x41
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x41
	ldmia sp!, {r3, r4, r5, pc}
_0206DB6C:
	mov r1, r4
	bl DseSequence_SetFades
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseBgm_SetFades

	arm_func_start DseSequence_Start
DseSequence_Start: ; 0x0206DB7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	strh r1, [r4, #0x2c]
	mov r5, r3
	strb r2, [r4, #0x14]
	ldrsh r2, [r5, #2]
	cmp r2, #0
	mvnlt r0, #0
	blt _0206DBB4
	ldr r1, _0206DC08 ; =DRIVER_WORK
	mov r0, #0x3e8
	ldrsh r1, [r1, #0x28]
	smulbb r0, r2, r0
	bl _s32_div_f
_0206DBB4:
	strh r0, [r4, #0x1a]
	mov r2, #0
	strb r2, [r4, #2]
	mov r0, r4
	mov r1, r5
	strb r2, [r4, #7]
	bl DseSequence_SetFades
	ldrsb r0, [r4, #8]
	cmp r0, #0
	bne _0206DBF8
	ldrsb r0, [r4, #2]
	cmp r0, #0
	bne _0206DBF0
	ldr r0, [r4, #0x24]
	bl DseSynth_RestoreHeldNotes
_0206DBF0:
	mov r0, #1
	strb r0, [r4, #5]
_0206DBF8:
	mov r0, #1
	strb r0, [r4, #4]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206DC08: .word DRIVER_WORK
	arm_func_end DseSequence_Start

	arm_func_start DseSequence_PauseList
DseSequence_PauseList: ; 0x0206DC0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r0
	beq _0206DC6C
	ldr r7, _0206DC74 ; =0x04000208
	mov r8, #0
	mov r5, #1
_0206DC24:
	ldrsb r0, [r4, #4]
	cmp r0, #1
	ldreqsb r0, [r4, #6]
	cmpeq r0, #0
	ldreqsb r0, [r4, #9]
	cmpeq r0, #1
	bne _0206DC60
	strb r8, [r4, #5]
	ldrh r6, [r7]
	strh r8, [r7]
	ldr r0, [r4, #0x24]
	bl DseSynth_StopChannels
	ldrh r0, [r7]
	strh r6, [r7]
	strb r5, [r4, #8]
_0206DC60:
	ldr r4, [r4, #0xa4]
	cmp r4, #0
	bne _0206DC24
_0206DC6C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206DC74: .word 0x04000208
	arm_func_end DseSequence_PauseList

	arm_func_start sub_0206DC78
sub_0206DC78: ; 0x0206DC78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov sb, r1
	mov r8, r2
	beq _0206DD64
	mov r0, #0x3e8
	mul r7, sb, r0
	mov fp, #1
_0206DC98:
	ldrsb r0, [sl, #8]
	cmp r0, #1
	bne _0206DD58
	cmp r8, #1
	bne _0206DCC8
	mov r0, #0
	str r0, [sl, #0x68]
	strh r0, [sl, #0x74]
	strb r0, [sl, #6]
	ldr r0, [sl, #0x24]
	mov r1, #0
	bl DseSynth_ResetAllVoiceTimersAndVolumes
_0206DCC8:
	cmp sb, #0
	ldrsb r4, [sl, #0x98]
	moveq r6, #0
	beq _0206DCF4
	ldr r0, _0206DD6C ; =DRIVER_WORK
	ldrsh r1, [r0, #0x28]
	mov r0, r7
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r6, r0, lsr #0x10
	moveq r6, #1
_0206DCF4:
	mov r1, r4, lsl #0x10
	str r1, [sl, #0x70]
	cmp r6, #0
	mov r5, r6
	streq r1, [sl, #0x68]
	beq _0206DD28
	ldr r0, [sl, #0x68]
	subs r0, r1, r0
	moveq r5, #0
	beq _0206DD28
	mov r1, r6
	bl _s32_div_f
	str r0, [sl, #0x6c]
_0206DD28:
	strh r5, [sl, #0x74]
	cmp r6, #0
	ldrneb r0, [sl, #0xc]
	orrne r0, r0, #4
	strneb r0, [sl, #0xc]
	bne _0206DD4C
	ldr r0, [sl, #0x24]
	mov r1, r4
	bl DseSynth_SetVolume
_0206DD4C:
	strb fp, [sl, #5]
	mov r0, #0
	strb r0, [sl, #8]
_0206DD58:
	ldr sl, [sl, #0xa4]
	cmp sl, #0
	bne _0206DC98
_0206DD64:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206DD6C: .word DRIVER_WORK
	arm_func_end sub_0206DC78

	arm_func_start DseSequence_SetFades
DseSequence_SetFades: ; 0x0206DD70
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	ldrb r1, [r6]
	mov r7, r0
	tst r1, #1
	beq _0206DE38
	ldrsh r4, [r6, #4]
	ldrh r1, [r6, #6]
	cmp r4, #0
	moveq r4, #0x100
	cmp r1, #0
	moveq r5, #0
	beq _0206DDC4
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _0206E05C ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r5, r0, lsr #0x10
	moveq r5, #1
_0206DDC4:
	mov r1, r4, lsl #0x10
	str r1, [r7, #0x50]
	cmp r5, #0
	mov r4, r5
	streq r1, [r7, #0x48]
	beq _0206DDF8
	ldr r0, [r7, #0x48]
	subs r0, r1, r0
	moveq r4, #0
	beq _0206DDF8
	mov r1, r5
	bl _s32_div_f
	str r0, [r7, #0x4c]
_0206DDF8:
	strh r4, [r7, #0x54]
	cmp r5, #0
	bne _0206DE2C
	ldr r1, [r7, #0x48]
	ldrb r0, [r7, #0x17]
	mov r1, r1, asr #0x10
	smulbb r0, r1, r0
	movs r1, r0, lsr #8
	ldr r0, _0206E060 ; =0x03938700
	moveq r1, #1
	bl _u32_div_f
	str r0, [r7, #0x44]
	b _0206DE38
_0206DE2C:
	ldrb r0, [r7, #0xc]
	orr r0, r0, #1
	strb r0, [r7, #0xc]
_0206DE38:
	ldrb r0, [r6]
	tst r0, #2
	beq _0206DEDC
	ldrh r1, [r6, #0xa]
	ldrsh r4, [r6, #8]
	cmp r1, #0
	moveq r5, #0
	beq _0206DE78
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _0206E05C ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r5, r0, lsr #0x10
	moveq r5, #1
_0206DE78:
	mov r1, r4, lsl #0x10
	str r1, [r7, #0x60]
	cmp r5, #0
	mov r4, r5
	streq r1, [r7, #0x58]
	beq _0206DEAC
	ldr r0, [r7, #0x58]
	subs r0, r1, r0
	moveq r4, #0
	beq _0206DEAC
	mov r1, r5
	bl _s32_div_f
	str r0, [r7, #0x5c]
_0206DEAC:
	strh r4, [r7, #0x64]
	cmp r5, #0
	ldrneb r0, [r7, #0xc]
	orrne r0, r0, #2
	strneb r0, [r7, #0xc]
	bne _0206DEDC
	ldr r1, [r7, #0x58]
	ldr r0, [r7, #0x24]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl DseSynth_SetBend
_0206DEDC:
	ldrb r0, [r6]
	tst r0, #4
	beq _0206DF98
	ldrsh r4, [r6, #0xc]
	ldrsh r1, [r6, #0xe]
	strb r4, [r7, #0x98]
	ldrsb r0, [r7, #8]
	cmp r0, #1
	moveq r4, #0
	moveq r1, r4
	mov r0, r1, lsl #0x10
	movs r1, r0, lsr #0x10
	moveq r5, #0
	beq _0206DF34
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _0206E05C ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r5, r0, lsr #0x10
	moveq r5, #1
_0206DF34:
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	mov r1, r0, lsl #0x10
	str r1, [r7, #0x70]
	cmp r5, #0
	mov r8, r5
	streq r1, [r7, #0x68]
	beq _0206DF70
	ldr r0, [r7, #0x68]
	subs r0, r1, r0
	moveq r8, #0
	beq _0206DF70
	mov r1, r5
	bl _s32_div_f
	str r0, [r7, #0x6c]
_0206DF70:
	strh r8, [r7, #0x74]
	cmp r5, #0
	ldrneb r0, [r7, #0xc]
	orrne r0, r0, #4
	strneb r0, [r7, #0xc]
	bne _0206DF98
	mov r1, r4, lsl #0x18
	ldr r0, [r7, #0x24]
	mov r1, r1, asr #0x18
	bl DseSynth_SetVolume
_0206DF98:
	ldrb r0, [r6]
	tst r0, #8
	beq _0206E048
	ldrh r0, [r6, #0x10]
	ldrh r1, [r6, #0x12]
	mov r0, r0, lsl #0x18
	cmp r1, #0
	mov r4, r0, asr #0x18
	moveq r5, #0
	beq _0206DFE0
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _0206E05C ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r5, r0, lsr #0x10
	moveq r5, #1
_0206DFE0:
	mov r1, r4, lsl #0x10
	str r1, [r7, #0x80]
	cmp r5, #0
	mov r4, r5
	streq r1, [r7, #0x78]
	beq _0206E014
	ldr r0, [r7, #0x78]
	subs r0, r1, r0
	moveq r4, #0
	beq _0206E014
	mov r1, r5
	bl _s32_div_f
	str r0, [r7, #0x7c]
_0206E014:
	strh r4, [r7, #0x84]
	cmp r5, #0
	ldrneb r0, [r7, #0xc]
	orrne r0, r0, #0x10
	strneb r0, [r7, #0xc]
	bne _0206E048
	ldr r1, [r7, #0x78]
	ldr r0, [r7, #0x24]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	and r1, r1, #0xff
	bl DseSynth_SetPan
_0206E048:
	ldrsh r0, [r7, #0x1a]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r7, #0x1a]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206E05C: .word DRIVER_WORK
_0206E060: .word 0x03938700
	arm_func_end DseSequence_SetFades

	arm_func_start DseSequence_GetParameter
DseSequence_GetParameter: ; 0x0206E064
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl DseSequence_GetById
	movs r4, r0
	bne _0206E098
	mov r1, r8
	mvn r0, #0x41
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x41
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0206E098:
	cmp r6, #0
	bne _0206E0B8
	mov r1, r8
	mvn r0, #0x17
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0206E0B8:
	cmp r7, #0x12
	mov r5, #0
	addls pc, pc, r7, lsl #2
	b _0206E1F8
_0206E0C8: ; jump table
	b _0206E1F8 ; case 0
	b _0206E114 ; case 1
	b _0206E174 ; case 2
	b _0206E180 ; case 3
	b _0206E18C ; case 4
	b _0206E1F8 ; case 5
	b _0206E1F8 ; case 6
	b _0206E1F8 ; case 7
	b _0206E1C4 ; case 8
	b _0206E1A4 ; case 9
	b _0206E198 ; case 10
	b _0206E1D0 ; case 11
	b _0206E1EC ; case 12
	b _0206E1F8 ; case 13
	b _0206E1F8 ; case 14
	b _0206E1F8 ; case 15
	b _0206E1F8 ; case 16
	b _0206E1F8 ; case 17
	b _0206E1DC ; case 18
_0206E114:
	ldrsb r2, [r4, #4]
	mov r0, #0x3e8
	ldr r1, _0206E214 ; =DRIVER_WORK
	strb r2, [r6]
	ldrsb r2, [r4, #6]
	strb r2, [r6, #1]
	ldrsb r2, [r4, #1]
	strb r2, [r6, #2]
	strb r5, [r6, #3]
	ldr r2, [r4, #0x34]
	ldr r1, [r1, #0x30]
	mul r0, r2, r0
	bl _u32_div_f
	str r0, [r6, #4]
	ldr r1, [r4, #0x38]
	mov r0, r4
	str r1, [r6, #8]
	bl DseSequence_GetSmallestNumLoops
	strh r0, [r6, #0xc]
	ldrb r0, [r4, #0x17]
	strb r0, [r6, #0xf]
	ldrb r0, [r4, #0x16]
	strb r0, [r6, #0xe]
	b _0206E20C
_0206E174:
	ldrsb r0, [r4, #4]
	str r0, [r6]
	b _0206E20C
_0206E180:
	ldrb r0, [r4, #0x17]
	str r0, [r6]
	b _0206E20C
_0206E18C:
	ldrsb r0, [r4, #1]
	str r0, [r6]
	b _0206E20C
_0206E198:
	bl DseSequence_GetSmallestNumLoops
	str r0, [r6]
	b _0206E20C
_0206E1A4:
	ldr r1, [r4, #0x34]
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _0206E214 ; =DRIVER_WORK
	ldr r1, [r1, #0x30]
	bl _u32_div_f
	str r0, [r6]
	b _0206E20C
_0206E1C4:
	ldr r0, [r4, #0x38]
	str r0, [r6]
	b _0206E20C
_0206E1D0:
	ldrb r0, [r4, #0x16]
	str r0, [r6]
	b _0206E20C
_0206E1DC:
	ldr r0, [r4, #0x68]
	mov r0, r0, asr #0x10
	str r0, [r6]
	b _0206E20C
_0206E1EC:
	ldrb r0, [r4, #0x17]
	str r0, [r6]
	b _0206E20C
_0206E1F8:
	mov r1, r8
	mvn r0, #0x17
	mov r2, #0
	bl Dse_SetError
	mvn r5, #0x17
_0206E20C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206E214: .word DRIVER_WORK
	arm_func_end DseSequence_GetParameter

	arm_func_start DseSequence_GetSmallestNumLoops
DseSequence_GetSmallestNumLoops: ; 0x0206E218
	ldrb ip, [r0, #0xf]
	add r2, r0, #0xa8
	ldr r0, _0206E268 ; =0x0000FFFF
	cmp ip, #0
	mov r3, #0
	ble _0206E258
_0206E230:
	ldrsb r1, [r2, #2]
	cmp r1, #1
	bne _0206E248
	ldrh r1, [r2, #0xa]
	cmp r0, r1
	movhi r0, r1
_0206E248:
	add r3, r3, #1
	cmp r3, ip
	add r2, r2, #0x5c
	blt _0206E230
_0206E258:
	ldr r1, _0206E268 ; =0x0000FFFF
	cmp r0, r1
	moveq r0, #0
	bx lr
	.align 2, 0
_0206E268: .word 0x0000FFFF
	arm_func_end DseSequence_GetSmallestNumLoops

	arm_func_start DseSequence_Reset
DseSequence_Reset: ; 0x0206E26C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x28]
	mov r1, #0
	bl DseSynth_ResetAndSetBankAndSequence
	ldrb r1, [r4, #0x13]
	ldr r0, [r4, #0x24]
	mov r2, #0
	bl DseSynth_SetGlobalVolumeIndex
	mov lr, #0
	str lr, [r4, #4]
	strb lr, [r4, #3]
	mov r0, #1
	strb r0, [r4, #9]
	ldr r0, _0206E3BC ; =DRIVER_WORK
	strb lr, [r4, #0xd]
	ldr r2, [r0, #0x2c]
	mov r1, #0x78
	str r2, [r4, #0x30]
	str lr, [r4, #0x34]
	str lr, [r4, #0x38]
	strb r1, [r4, #0x17]
	str lr, [r4, #0x3c]
	ldrb r2, [r4, #0x15]
	ldrsh r1, [r0, #0x28]
	ldr r0, _0206E3C0 ; =0x0007A120
	mov r2, r2, lsl #3
	mul r1, r2, r1
	str r1, [r4, #0x40]
	str r0, [r4, #0x44]
	strb lr, [r4, #0xc]
	mov r0, #0x1000000
	str r0, [r4, #0x48]
	strh lr, [r4, #0x54]
	str lr, [r4, #0x58]
	strh lr, [r4, #0x64]
	mov r0, #0x7f0000
	str r0, [r4, #0x68]
	strh lr, [r4, #0x74]
	mov r0, #0x400000
	str r0, [r4, #0x78]
	strh lr, [r4, #0x84]
	mov r0, #0x7f
	strb r0, [r4, #0x98]
	ldrb r0, [r4, #0xf]
	add ip, r4, #0xa8
	cmp r0, #0
	ble _0206E3AC
	mov r3, #1
	mov r2, lr
	mov r1, #0x7f
	mov r0, #4
	mov r5, #0xc8
_0206E344:
	ldr r6, [ip, #0x18]
	cmp r6, #0
	beq _0206E38C
	strb r3, [ip, #2]
	strh r2, [ip, #0xa]
	ldr r6, [ip, #0x18]
	str r6, [ip, #0x1c]
	str r2, [ip, #0xc]
	str r2, [ip, #0x14]
	strb r1, [ip, #5]
	strb r0, [ip, #4]
	strb r2, [ip, #6]
	str r2, [ip, #0x20]
	ldr r7, [r4, #0x24]
	ldrb r6, [ip, #3]
	add r7, r7, #0x10
	mla r7, r6, r5, r7
	str r7, [ip, #0x54]
_0206E38C:
	ldrb r6, [r4, #0xd]
	add lr, lr, #1
	add ip, ip, #0x5c
	add r6, r6, #1
	strb r6, [r4, #0xd]
	ldrb r6, [r4, #0xf]
	cmp lr, r6
	blt _0206E344
_0206E3AC:
	mov r0, #1
	strb r0, [r4]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206E3BC: .word DRIVER_WORK
_0206E3C0: .word 0x0007A120
	arm_func_end DseSequence_Reset

	arm_func_start DseSequence_Stop
DseSequence_Stop: ; 0x0206E3C4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrsb r0, [r5, #1]
	mov r4, r2
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r0, [r5, #4]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r1, #0
	beq _0206E49C
	ldr r0, [r5, #0x68]
	movs r0, r0, asr #0x10
	beq _0206E49C
	mov r0, #1
	strb r0, [r5, #7]
	mov r6, #0
	strb r6, [r5, #0x98]
	cmp r1, #0
	beq _0206E43C
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _0206E4E0 ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r6, r0, lsr #0x10
	moveq r6, #1
_0206E43C:
	mov r1, #0
	str r1, [r5, #0x70]
	cmp r6, #0
	mov r4, r6
	streq r1, [r5, #0x68]
	beq _0206E470
	ldr r0, [r5, #0x68]
	rsbs r0, r0, #0
	moveq r4, r1
	beq _0206E470
	mov r1, r6
	bl _s32_div_f
	str r0, [r5, #0x6c]
_0206E470:
	strh r4, [r5, #0x74]
	cmp r6, #0
	bne _0206E48C
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl DseSynth_SetVolume
	b _0206E4D8
_0206E48C:
	ldrb r0, [r5, #0xc]
	orr r0, r0, #4
	strb r0, [r5, #0xc]
	b _0206E4D8
_0206E49C:
	mov r1, #0
	str r1, [r5, #4]
	ldr r0, _0206E4E4 ; =0x04000208
	strb r1, [r5, #8]
	ldrh r6, [r0]
	strh r1, [r0]
	ldr r0, [r5, #0x24]
	bl DseSynth_StopChannels
	cmp r4, #1
	bne _0206E4CC
	ldr r0, [r5, #0x24]
	bl DseSynth_ClearHeldNotes
_0206E4CC:
	ldr r1, _0206E4E4 ; =0x04000208
	ldrh r0, [r1]
	strh r6, [r1]
_0206E4D8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206E4E0: .word DRIVER_WORK
_0206E4E4: .word 0x04000208
	arm_func_end DseSequence_Stop

	arm_func_start FindSmdlSongChunk
FindSmdlSongChunk: ; 0x0206E4E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _0206E54C ; =0x736F6E67
	ldr r7, _0206E550 ; =0x656F6420
	mov r5, r1
	add r4, r0, #0x40
_0206E4FC:
	ldr r0, [r4]
	bl DseUtil_ByteSwap32
	cmp r0, r7
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, r6
	ldreqsh r1, [r4, #0x10]
	addeq r0, r4, #0x10
	cmpeq r1, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4, #8]
	ldr r0, [r4, #0xc]
	sub r2, r1, #1
	add r0, r0, #0x10
	mvn r1, r2
	add r0, r0, r2
	and r0, r1, r0
	add r4, r4, r0
	b _0206E4FC
_0206E548:
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206E54C: .word 0x736F6E67
_0206E550: .word 0x656F6420
	arm_func_end FindSmdlSongChunk

	arm_func_start DseSequence_LoadSong
DseSequence_LoadSong: ; 0x0206E554
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	mov r6, r1
	ldrb r1, [r6, #6]
	ldrb r0, [r7, #0xe]
	cmp r1, r0
	mvnhi r0, #0
	ldmhiia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrh r0, [r6, #2]
	add r4, r6, #0x30
	add r5, r7, #0xa8
	mov r0, r0, asr #3
	strb r0, [r7, #0x15]
	ldrb r0, [r6, #4]
	strb r0, [r7, #0x11]
	ldrb r0, [r6, #6]
	strb r0, [r7, #0xf]
	ldrb r0, [r6, #7]
	strb r0, [r7, #0x10]
	ldrb r0, [r6, #0x1b]
	strb r0, [r7, #0x12]
	ldrb r0, [r6, #0x19]
	strb r0, [r7, #0x13]
	ldrb r0, [r6, #0x1a]
	strb r0, [r7, #0x14]
	ldrb r0, [r6, #0x18]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	strb r0, [r7, #0xb]
	ldr r0, [r6, #0x30]
	bl DseUtil_ByteSwap32
	ldr sb, _0206E648 ; =0x74726B20
	ldr sl, _0206E64C ; =0x626E6B6C
	ldr r8, _0206E650 ; =0x656F6320
	b _0206E634
_0206E5E4:
	cmp r0, sl
	beq _0206E610
	cmp r0, sb
	bne _0206E610
	add r0, r4, #0x14
	str r0, [r5, #0x18]
	ldrb r0, [r4, #0x10]
	strh r0, [r5]
	ldrb r0, [r4, #0x11]
	strb r0, [r5, #3]
	add r5, r5, #0x5c
_0206E610:
	ldrb r1, [r4, #8]
	ldr r0, [r4, #0xc]
	sub r2, r1, #1
	add r0, r0, #0x10
	mvn r1, r2
	add r0, r0, r2
	and r0, r1, r0
	ldr r0, [r4, r0]!
	bl DseUtil_ByteSwap32
_0206E634:
	cmp r0, r8
	bne _0206E5E4
	str r6, [r7, #0x20]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0206E648: .word 0x74726B20
_0206E64C: .word 0x626E6B6C
_0206E650: .word 0x656F6320
	arm_func_end DseSequence_LoadSong

	arm_func_start DseSequence_GetById
DseSequence_GetById: ; 0x0206E654
	ldr r3, _0206E698 ; =0x04000208
	ldr r1, _0206E69C ; =DRIVER_WORK
	ldrh ip, [r3]
	mov r2, #0
	strh r2, [r3]
	ldr r3, [r1, #0x664]
	b _0206E674
_0206E670:
	ldr r3, [r3, #0xa4]
_0206E674:
	cmp r3, #0
	ldrne r1, [r3, #0x28]
	cmpne r1, r0
	bne _0206E670
	ldr r2, _0206E698 ; =0x04000208
	mov r0, r3
	ldrh r1, [r2]
	strh ip, [r2]
	bx lr
	.align 2, 0
_0206E698: .word 0x04000208
_0206E69C: .word DRIVER_WORK
	arm_func_end DseSequence_GetById

	arm_func_start DseSequence_AllocateNew
DseSequence_AllocateNew: ; 0x0206E6A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0x5c
	mul r0, r7, r0
	mov r6, r1
	add r0, r0, #0xa8
	mov r1, #0x10
	mov r5, r2
	bl DseMem_Allocate
	movs r4, r0
	bne _0206E6E4
	mov r1, #0
	mov r2, r1
	mvn r0, #0x83
	bl Dse_SetError
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206E6E4:
	mov r3, #0
	str r3, [r4]
	str r3, [r4, #4]
	str r3, [r4, #8]
	strb r3, [r4, #0x16]
	strb r3, [r4, #0xd]
	str r3, [r4, #0x30]
	str r3, [r4, #0x28]
	strh r3, [r4, #0x2c]
	mov r0, #6
	strb r0, [r4, #0x15]
	strb r3, [r4, #0xd]
	and r0, r7, #0xff
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x10]
	strb r3, [r4, #0x11]
	strb r3, [r4, #0x12]
	strb r3, [r4, #0x13]
	str r3, [r4, #0x1c]
	ldr r1, _0206E7C8 ; =0x76656400
	and r2, r5, #0xff
	mov r0, r6
	orr r1, r2, r1
	str r3, [r4, #0x20]
	bl DseSynth_AllocateNew
	str r0, [r4, #0x24]
	cmp r0, #0
	bne _0206E778
	mov r0, r4
	bl DseMem_Free
	mov r1, #0
	mov r2, r1
	mvn r0, #0x85
	bl Dse_SetError
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206E778:
	mov r0, #0x78
	strb r0, [r4, #0x17]
	mov r3, #0
	str r3, [r4, #0x3c]
	ldr r0, _0206E7CC ; =DRIVER_WORK
	ldrb r2, [r4, #0x15]
	ldrsh r0, [r0, #0x28]
	ldr r1, _0206E7D0 ; =0x0007A120
	mov r2, r2, lsl #3
	mul r0, r2, r0
	str r0, [r4, #0x40]
	ldr r0, _0206E7D4 ; =DseBgm_DefaultSignalCallback
	str r1, [r4, #0x44]
	str r0, [r4, #0x9c]
	str r3, [r4, #0xa0]
	mov r0, r4
	str r3, [r4, #0xa4]
	bl DseSequence_InitTracks
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206E7C8: .word 0x76656400
_0206E7CC: .word DRIVER_WORK
_0206E7D0: .word 0x0007A120
_0206E7D4: .word DseBgm_DefaultSignalCallback
	arm_func_end DseSequence_AllocateNew

	arm_func_start DseSequence_Unload
DseSequence_Unload: ; 0x0206E7D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r1, [r4, #4]
	cmp r1, #1
	bne _0206E7F8
	mov r1, #0
	mov r2, r1
	bl DseSequence_Stop
_0206E7F8:
	ldr r1, _0206E854 ; =0x04000208
	mov r0, #0
	ldrh r3, [r1]
	ldr r2, _0206E858 ; =_022B7994
	strh r0, [r1]
	b _0206E814
_0206E810:
	add r2, r0, #0xa4
_0206E814:
	ldr r0, [r2]
	cmp r0, #0
	cmpne r0, r4
	bne _0206E810
	cmp r0, #0
	ldrne r0, [r4, #0xa4]
	ldr r1, _0206E854 ; =0x04000208
	strne r0, [r2]
	ldrh r0, [r1]
	strh r3, [r1]
	ldr r0, [r4, #0x24]
	bl DseSynth_Unload
	mov r0, r4
	bl DseMem_Free
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206E854: .word 0x04000208
_0206E858: .word _022B7994
	arm_func_end DseSequence_Unload

	arm_func_start DseSequence_InitTracks
DseSequence_InitTracks: ; 0x0206E85C
	ldrb r1, [r0, #0xf]
	add r3, r0, #0xa8
	mov ip, #0
	cmp r1, #0
	bxle lr
	mov r2, ip
_0206E874:
	strb r2, [r3, #2]
	strh ip, [r3]
	strb ip, [r3, #3]
	strh r2, [r3, #0xa]
	str r2, [r3, #0x18]
	str r2, [r3, #0x1c]
	str r2, [r3, #0x20]
	str r2, [r3, #0x54]
	ldrb r1, [r0, #0xf]
	add ip, ip, #1
	add r3, r3, #0x5c
	cmp ip, r1
	blt _0206E874
	bx lr
	arm_func_end DseSequence_InitTracks

	arm_func_start DseBgm_SysSetupNoteList
DseBgm_SysSetupNoteList: ; 0x0206E8AC
	stmdb sp!, {r3, lr}
	ldr r2, _0206E914 ; =DRIVER_WORK
	mov r1, #0
	mvn r0, #0
_0206E8BC:
	add r1, r1, #1
	str r0, [r2, #0x54]
	cmp r1, #0x80
	add r2, r2, #0xc
	blt _0206E8BC
	ldr r2, _0206E914 ; =DRIVER_WORK
	ldr ip, _0206E918 ; =_022B7380
	mov lr, #0
	mov r0, #0xc
_0206E8E0:
	add lr, lr, #1
	mul r3, lr, r0
	add r1, ip, r3
	str r1, [r2, #0x58]
	cmp lr, #0x7f
	add r2, r2, #0xc
	blt _0206E8E0
	ldr r1, _0206E91C ; =_022B7388
	mov r2, #0
	ldr r0, _0206E914 ; =DRIVER_WORK
	str r2, [r1, r3]
	str ip, [r0, #0x650]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206E914: .word DRIVER_WORK
_0206E918: .word _022B7380
_0206E91C: .word _022B7388
	arm_func_end DseBgm_SysSetupNoteList

	arm_func_start DseSe_SysReset
DseSe_SysReset: ; 0x0206E920
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _0206EA08 ; =DRIVER_WORK
	mov sb, r0
	ldrsb r0, [r2]
	mov r8, r1
	mov r1, #0
	cmp r0, #0
	bne _0206E954
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0206E954:
	ldr r4, [r2, #0x668]
	ldr r0, _0206EA0C ; =0x04000208
	str r1, [r2, #0x668]
	ldrh r5, [r0]
	cmp r4, #0
	strh r1, [r0]
	beq _0206E984
_0206E970:
	mov r0, r4
	ldr r4, [r4, #0xa4]
	bl DseSequence_Unload
	cmp r4, #0
	bne _0206E970
_0206E984:
	ldr r1, _0206EA0C ; =0x04000208
	mov r6, #0
	ldrh r0, [r1]
	ldr r0, _0206EA08 ; =DRIVER_WORK
	mov r4, r6
	strh r5, [r1]
	strb sb, [r0, #0x3a]
	strb r8, [r0, #0x3b]
	ldrh r7, [r1]
	cmp sb, #0
	ldr r5, _0206EA10 ; =_022B7998
	strh r6, [r1]
	ble _0206E9F4
	mov r0, r8, lsl #0x10
	ldr r8, _0206EA14 ; =0x71657365
	mov sl, r0, lsr #0x10
_0206E9C4:
	mov r0, sl
	mov r1, sl
	mov r2, r8
	bl DseSequence_AllocateNew
	cmp r0, #0
	mvneq r6, #0x83
	beq _0206E9F4
	add r4, r4, #1
	str r0, [r5]
	cmp r4, sb
	add r5, r0, #0xa4
	blt _0206E9C4
_0206E9F4:
	ldr r2, _0206EA0C ; =0x04000208
	mov r0, r6
	ldrh r1, [r2]
	strh r7, [r2]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0206EA08: .word DRIVER_WORK
_0206EA0C: .word 0x04000208
_0206EA10: .word _022B7998
_0206EA14: .word 0x71657365
	arm_func_end DseSe_SysReset

	arm_func_start DseSe_Load
DseSe_Load: ; 0x0206EA18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _0206EBA8 ; =0x7365646C
	ldr r2, _0206EBAC ; =0x00000415
	mov r3, #4
	mov r4, r0
	bl DseFile_CheckHeader
	movs r5, r0
	ldmmiia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_GetById
	cmp r0, #0
	beq _0206EA64
	mov r1, r5
	mvn r0, #0x49
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x49
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206EA64:
	ldr r2, _0206EBB0 ; =0x66646573
	mov r0, #0x1c
	mov r1, #0x10
	bl DseMem_Allocate
	movs sl, r0
	bne _0206EA94
	mov r1, r5
	mvn r0, #0x7f
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x7f
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206EA94:
	str r4, [sl]
	ldrsh r2, [r4, #0x30]
	mov r1, #0
	mov r0, #1
	strh r2, [sl, #4]
	strh r5, [sl, #6]
	str r1, [sl, #8]
	str r1, [sl, #0xc]
	str r1, [sl, #0x10]
	str r1, [sl, #0x14]
	strb r0, [sl, #0x18]
	ldrb r0, [r4, #0x35]
	cmp r0, #0
	beq _0206EB60
	add r8, r4, #0x40
	ldr r4, _0206EBB4 ; =0x73657120
	ldr r7, _0206EBB8 ; =0x656F6420
	ldr r6, _0206EBBC ; =0x626E6B6C
	ldr r5, _0206EBC0 ; =0x6D63726C
	mov fp, r1
_0206EAE4:
	ldr r0, [r8]
	mov sb, fp
	bl DseUtil_ByteSwap32
	cmp r0, r7
	bhi _0206EB0C
	bhs _0206EB30
	cmp r0, r6
	addeq r0, r8, #0x10
	streq r0, [sl, #0x14]
	b _0206EB34
_0206EB0C:
	cmp r0, r5
	bhi _0206EB20
	addeq r0, r8, #0x10
	streq r0, [sl, #0x10]
	b _0206EB34
_0206EB20:
	cmp r0, r4
	addeq r0, r8, #0x10
	streq r0, [sl, #0xc]
	b _0206EB34
_0206EB30:
	mov sb, #1
_0206EB34:
	cmp sb, #1
	beq _0206EB60
	ldrb r1, [r8, #8]
	ldr r0, [r8, #0xc]
	sub r2, r1, #1
	add r0, r0, #0x10
	mvn r1, r2
	add r0, r0, r2
	and r0, r1, r0
	add r8, r8, r0
	b _0206EAE4
_0206EB60:
	ldr r1, _0206EBC4 ; =0x04000208
	mov r0, #0
	ldrh r3, [r1]
	ldr r2, _0206EBC8 ; =_022B799C
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	beq _0206EB90
_0206EB80:
	add r2, r0, #8
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0206EB80
_0206EB90:
	ldr r1, _0206EBC4 ; =0x04000208
	str sl, [r2]
	ldrh r0, [r1]
	strh r3, [r1]
	ldrh r0, [sl, #6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206EBA8: .word 0x7365646C
_0206EBAC: .word 0x00000415
_0206EBB0: .word 0x66646573
_0206EBB4: .word 0x73657120
_0206EBB8: .word 0x656F6420
_0206EBBC: .word 0x626E6B6C
_0206EBC0: .word 0x6D63726C
_0206EBC4: .word 0x04000208
_0206EBC8: .word _022B799C
	arm_func_end DseSe_Load

	arm_func_start DseSe_Unload
DseSe_Unload: ; 0x0206EBCC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DseSe_StopSeq
	ldr r1, _0206EC54 ; =0x04000208
	mov r0, #0
	ldrh ip, [r1]
	ldr r3, _0206EC58 ; =_022B799C
	strh r0, [r1]
	b _0206EBF4
_0206EBF0:
	add r3, r0, #8
_0206EBF4:
	ldr r0, [r3]
	cmp r0, #0
	ldrneh r1, [r0, #6]
	cmpne r1, r4
	bne _0206EBF0
	cmp r0, #0
	bne _0206EC34
	ldr r3, _0206EC54 ; =0x04000208
	mov r1, r4
	ldrh r0, [r3]
	mov r2, #0
	mvn r0, #0x43
	strh ip, [r3]
	bl Dse_SetError
	mvn r0, #0x43
	ldmia sp!, {r4, pc}
_0206EC34:
	ldr r1, [r0, #8]
	ldr r2, _0206EC54 ; =0x04000208
	str r1, [r3]
	ldrh r1, [r2]
	strh ip, [r2]
	bl DseMem_Free
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206EC54: .word 0x04000208
_0206EC58: .word _022B799C
	arm_func_end DseSe_Unload

	arm_func_start DseSe_GetUsedBankIDs
DseSe_GetUsedBankIDs: ; 0x0206EC5C
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r1
	mov r6, r0
	beq _0206EC74
	cmp r2, #0
	bgt _0206EC8C
_0206EC74:
	mov r1, r6
	mvn r0, #0x17
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r4, r5, r6, pc}
_0206EC8C:
	mov r0, r6, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r5
	bl DseSe_GetById
	cmp r0, #0
	bne _0206ECBC
	mov r1, r5
	mvn r0, #0x43
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x43
	ldmia sp!, {r4, r5, r6, pc}
_0206ECBC:
	ldr r2, [r0, #0x14]
	cmp r2, #0
	bne _0206ECE0
	mov r1, r5
	mvn r0, #0x4d
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x4d
	ldmia sp!, {r4, r5, r6, pc}
_0206ECE0:
	mov r0, r6, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0xf
	ldrh r1, [r2, r0]
	cmp r1, #0
	mvneq r0, #0x44
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r2, r1]
	add r1, r2, r1
	add r3, r1, #4
	cmp r0, #0
	mov r2, #0
	ldmleia sp!, {r4, r5, r6, pc}
_0206ED14:
	ldrh r0, [r3], #2
	add r2, r2, #1
	strh r0, [r4], #2
	ldrb r0, [r1]
	cmp r2, r0
	blt _0206ED14
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseSe_GetUsedBankIDs

	arm_func_start DseSe_HasPlayingInstances
DseSe_HasPlayingInstances: ; 0x0206ED30
	mvn r2, #0
	cmp r0, r2
	beq _0206EDAC
	ldr r2, _0206EDF8 ; =DRIVER_WORK
	ldr r3, [r2, #0x668]
	cmp r3, #0
	beq _0206EDF0
_0206ED4C:
	ldrsb r2, [r3, #4]
	cmp r2, #1
	ldreq r2, [r3, #0x28]
	cmpeq r2, r0
	bne _0206ED9C
	cmp r1, #0
	bne _0206ED7C
	ldrsb r0, [r3, #6]
	cmp r0, #0
	moveq r0, #1
	movne r0, #2
	bx lr
_0206ED7C:
	ldrh r2, [r3, #0x2c]
	cmp r2, r1
	bne _0206ED9C
	ldrsb r0, [r3, #6]
	cmp r0, #0
	moveq r0, #1
	movne r0, #2
	bx lr
_0206ED9C:
	ldr r3, [r3, #0xa4]
	cmp r3, #0
	bne _0206ED4C
	b _0206EDF0
_0206EDAC:
	ldr r0, _0206EDF8 ; =DRIVER_WORK
	ldr r2, [r0, #0x668]
	cmp r2, #0
	beq _0206EDF0
_0206EDBC:
	ldrsb r0, [r2, #4]
	cmp r0, #1
	ldreqh r0, [r2, #0x2c]
	cmpeq r0, r1
	bne _0206EDE4
	ldrsb r0, [r2, #6]
	cmp r0, #0
	moveq r0, #1
	movne r0, #2
	bx lr
_0206EDE4:
	ldr r2, [r2, #0xa4]
	cmp r2, #0
	bne _0206EDBC
_0206EDF0:
	mov r0, #0
	bx lr
	.align 2, 0
_0206EDF8: .word DRIVER_WORK
	arm_func_end DseSe_HasPlayingInstances

	arm_func_start DseSe_Play
DseSe_Play: ; 0x0206EDFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, sl, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r5
	mov fp, r1
	mov sb, r2
	bl DseSe_GetById
	movs r4, r0
	bne _0206EE3C
	mov r1, r5
	mvn r0, #0x43
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x43
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206EE3C:
	mov r0, sl, asr #0x10
	mov r1, r0, lsl #0x10
	ldr r5, [r4]
	ldr r2, [r4, #0xc]
	mov r0, r5
	mov r1, r1, asr #0x10
	bl DseSe_GetEffectSong
	movs r6, r0
	bne _0206EE78
	mov r1, sl
	mvn r0, #0x44
	mov r2, #0
	bl Dse_SetError2
	mvn r0, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206EE78:
	ldrb r0, [r6, #0x18]
	ldrb r1, [sb]
	ldrb r8, [r6, #0x1a]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	mov r0, r0, lsl #0x18
	mov r2, r0, asr #0x18
	tst r1, #0x40
	bne _0206EECC
	cmp r8, #0
	ldrb r1, [r6, #0x1c]
	bne _0206EEBC
	mov r0, sl
	bl DseSe_CheckTooManyInstances
	and r0, r0, #0xff
	b _0206EEDC
_0206EEBC:
	mov r0, r8
	bl DseSe_CheckTooManyInstancesInGroup
	and r0, r0, #0xff
	b _0206EEDC
_0206EECC:
	mov r0, fp
	mov r1, r2
	bl sub_0206F208
	and r0, r0, #0xff
_0206EEDC:
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r6, #0x1b]
	ldrb r1, [r6, #0x19]
	ldrb r2, [r6, #0x1c]
	bl DseSe_GetBestSeqAllocation
	movs r7, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsb r1, [r7, #4]
	cmp r1, #1
	bne _0206EF1C
	mov r1, #0
	mov r2, #1
	bl DseSequence_Stop
_0206EF1C:
	str sl, [r7, #0x28]
	mov r0, r7
	str r5, [r7, #0x1c]
	bl DseSequence_InitTracks
	mov r0, r7
	mov r1, r6
	bl DseSequence_LoadSong
	movs r1, r0
	bpl _0206EF54
	mov r2, sl
	mvn r0, #0x4e
	bl Dse_SetError
	mvn r0, #0x4e
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0206EF54:
	mov r0, r7
	bl DseSequence_Reset
	mov r0, #0
	str r0, [r7, #0x68]
	strh r0, [r7, #0x74]
	mov r0, #1
	strb r0, [r7, #2]
	ldrsb r0, [r4, #0x18]
	strb r0, [r7, #9]
	bl sub_0206C688
	ldrsb r3, [r4, #0x18]
	mov r1, fp
	mov r2, r8
	and r3, r3, r0
	strb r3, [r7, #8]
	mov r3, #1
	strb r3, [r7, #0xa]
	mov r0, r7
	mov r3, sb
	bl DseSequence_Start
	cmp r0, #0
	movge r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DseSe_Play

	arm_func_start DseSe_GetEffectSong
DseSe_GetEffectSong: ; 0x0206EFB0
	cmp r1, #0
	movlt r0, #0
	bxlt lr
	ldrsh r3, [r0, #0x30]
	cmp r3, r1
	movle r0, #0
	bxle lr
	ldrb r3, [r0, #0x35]
	cmp r3, #0
	moveq r2, r0
	addeq r3, r0, #0x40
	movne r3, r2
	mov r0, r1, lsl #1
	ldrh r0, [r3, r0]
	cmp r0, #0
	moveq r0, #0
	addne r0, r2, r0
	bx lr
	arm_func_end DseSe_GetEffectSong

	arm_func_start DseSe_CheckTooManyInstances
DseSe_CheckTooManyInstances: ; 0x0206EFF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	movs sb, r1
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, _0206F0F8 ; =0x04000208
	cmp r2, #1
	ldrh r1, [r3]
	str r1, [sp]
	strh r0, [r3]
	bne _0206F0AC
	ldr r4, _0206F0FC ; =DRIVER_WORK
	mov fp, r0
	mov r6, r0
	mvn r5, #0x80000000
_0206F034:
	ldr r1, [r4, #0x668]
	mov r7, r6
	mov r2, r5
	cmp r1, #0
	beq _0206F07C
_0206F048:
	ldrsb r0, [r1, #4]
	cmp r0, #1
	ldreq r0, [r1, #0x28]
	cmpeq r0, sl
	bne _0206F070
	ldr r0, [r1, #0x30]
	add r7, r7, #1
	cmp r2, r0
	movhi r2, r0
	movhi r8, r1
_0206F070:
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	bne _0206F048
_0206F07C:
	cmp r7, sb
	blt _0206F09C
	cmp r8, #0
	beq _0206F09C
	mov r0, r8
	mov r1, fp
	mov r2, #1
	bl DseSequence_Stop
_0206F09C:
	cmp r7, sb
	bgt _0206F034
	mov r0, #0
	b _0206F0E4
_0206F0AC:
	ldr r1, _0206F0FC ; =DRIVER_WORK
	ldr r2, [r1, #0x668]
	cmp r2, #0
	beq _0206F0DC
_0206F0BC:
	ldrsb r1, [r2, #4]
	cmp r1, #1
	ldreq r1, [r2, #0x28]
	ldr r2, [r2, #0xa4]
	cmpeq r1, sl
	addeq r0, r0, #1
	cmp r2, #0
	bne _0206F0BC
_0206F0DC:
	cmp r0, sb
	movlt r0, #0
_0206F0E4:
	ldr r2, _0206F0F8 ; =0x04000208
	ldrh r1, [r2]
	ldr r1, [sp]
	strh r1, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206F0F8: .word 0x04000208
_0206F0FC: .word DRIVER_WORK
	arm_func_end DseSe_CheckTooManyInstances

	arm_func_start DseSe_CheckTooManyInstancesInGroup
DseSe_CheckTooManyInstancesInGroup: ; 0x0206F100
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	movs sb, r1
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, _0206F200 ; =0x04000208
	cmp r2, #1
	ldrh r1, [r3]
	str r1, [sp]
	strh r0, [r3]
	bne _0206F1B4
	ldr r4, _0206F204 ; =DRIVER_WORK
	mov fp, r0
	mov r6, r0
	mvn r5, #0x80000000
_0206F13C:
	ldr r1, [r4, #0x668]
	mov r7, r6
	mov r2, r5
	cmp r1, #0
	beq _0206F184
_0206F150:
	ldrsb r0, [r1, #4]
	cmp r0, #1
	ldreqb r0, [r1, #0x14]
	cmpeq r0, sl
	bne _0206F178
	ldr r0, [r1, #0x30]
	add r7, r7, #1
	cmp r2, r0
	movhi r2, r0
	movhi r8, r1
_0206F178:
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	bne _0206F150
_0206F184:
	cmp r7, sb
	blt _0206F1A4
	cmp r8, #0
	beq _0206F1A4
	mov r0, r8
	mov r1, fp
	mov r2, #1
	bl DseSequence_Stop
_0206F1A4:
	cmp r7, sb
	bgt _0206F13C
	mov r0, #0
	b _0206F1EC
_0206F1B4:
	ldr r1, _0206F204 ; =DRIVER_WORK
	ldr r2, [r1, #0x668]
	cmp r2, #0
	beq _0206F1E4
_0206F1C4:
	ldrsb r1, [r2, #4]
	cmp r1, #1
	ldreqb r1, [r2, #0x14]
	ldr r2, [r2, #0xa4]
	cmpeq r1, sl
	addeq r0, r0, #1
	cmp r2, #0
	bne _0206F1C4
_0206F1E4:
	cmp r0, sb
	movlt r0, #0
_0206F1EC:
	ldr r2, _0206F200 ; =0x04000208
	ldrh r1, [r2]
	ldr r1, [sp]
	strh r1, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206F200: .word 0x04000208
_0206F204: .word DRIVER_WORK
	arm_func_end DseSe_CheckTooManyInstancesInGroup

	arm_func_start sub_0206F208
sub_0206F208: ; 0x0206F208
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0206F2BC ; =0x04000208
	mov r4, #0
	ldrh r6, [r2]
	mov r7, r0
	cmp r1, #1
	strh r4, [r2]
	bne _0206F274
	ldr r0, _0206F2C0 ; =DRIVER_WORK
	ldr r5, [r0, #0x668]
	cmp r5, #0
	beq _0206F2A8
	mov sb, r4
	mov r8, #1
_0206F240:
	ldrsb r0, [r5, #4]
	cmp r0, #1
	ldreqh r0, [r5, #0x2c]
	cmpeq r0, r7
	bne _0206F264
	mov r0, r5
	mov r1, sb
	mov r2, r8
	bl DseSequence_Stop
_0206F264:
	ldr r5, [r5, #0xa4]
	cmp r5, #0
	bne _0206F240
	b _0206F2A8
_0206F274:
	ldr r0, _0206F2C0 ; =DRIVER_WORK
	ldr r1, [r0, #0x668]
	cmp r1, #0
	beq _0206F2A8
_0206F284:
	ldrsb r0, [r1, #4]
	cmp r0, #1
	ldreqh r0, [r1, #0x2c]
	cmpeq r0, r7
	moveq r4, #1
	beq _0206F2A8
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	bne _0206F284
_0206F2A8:
	ldr r2, _0206F2BC ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh r6, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0206F2BC: .word 0x04000208
_0206F2C0: .word DRIVER_WORK
	arm_func_end sub_0206F208

	arm_func_start DseSe_GetBestSeqAllocation
DseSe_GetBestSeqAllocation: ; 0x0206F2C4
	stmdb sp!, {r3, lr}
	ldr r2, _0206F338 ; =0x04000208
	mov r3, #0
	ldrh lr, [r2]
	ldr r1, _0206F33C ; =DRIVER_WORK
	sub ip, r3, #1
	strh r3, [r2]
	ldr r2, [r1, #0x668]
	cmp r2, #0
	beq _0206F324
_0206F2EC:
	ldrsb r1, [r2, #4]
	cmp r1, #0
	moveq r3, r2
	beq _0206F324
	ldrb r1, [r2, #0x12]
	cmp r1, r0
	blo _0206F318
	ldr r1, [r2, #0x30]
	cmp ip, r1
	movhi ip, r1
	movhi r3, r2
_0206F318:
	ldr r2, [r2, #0xa4]
	cmp r2, #0
	bne _0206F2EC
_0206F324:
	ldr r2, _0206F338 ; =0x04000208
	mov r0, r3
	ldrh r1, [r2]
	strh lr, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206F338: .word 0x04000208
_0206F33C: .word DRIVER_WORK
	arm_func_end DseSe_GetBestSeqAllocation

	arm_func_start DseSe_GetById
DseSe_GetById: ; 0x0206F340
	ldr r3, _0206F384 ; =0x04000208
	ldr r1, _0206F388 ; =DRIVER_WORK
	ldrh ip, [r3]
	mov r2, #0
	strh r2, [r3]
	ldr r3, [r1, #0x66c]
	b _0206F360
_0206F35C:
	ldr r3, [r3, #8]
_0206F360:
	cmp r3, #0
	ldrneh r1, [r3, #6]
	cmpne r1, r0
	bne _0206F35C
	ldr r2, _0206F384 ; =0x04000208
	mov r0, r3
	ldrh r1, [r2]
	strh ip, [r2]
	bx lr
	.align 2, 0
_0206F384: .word 0x04000208
_0206F388: .word DRIVER_WORK
	arm_func_end DseSe_GetById

	arm_func_start DseSe_Stop
DseSe_Stop: ; 0x0206F38C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mvn r0, #0
	mov r7, r1
	mov r6, r2
	cmp r8, r0
	ldr r2, _0206F4D8 ; =0x04000208
	mov r1, #0
	beq _0206F478
	cmp r7, #0
	bne _0206F414
	ldrh r4, [r2]
	ldr r0, _0206F4DC ; =DRIVER_WORK
	strh r1, [r2]
	ldr r7, [r0, #0x668]
	cmp r7, #0
	beq _0206F404
	mov r5, #1
_0206F3D4:
	ldrsb r0, [r7, #4]
	cmp r0, #1
	ldreq r0, [r7, #0x28]
	cmpeq r0, r8
	bne _0206F3F8
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl DseSequence_Stop
_0206F3F8:
	ldr r7, [r7, #0xa4]
	cmp r7, #0
	bne _0206F3D4
_0206F404:
	ldr r1, _0206F4D8 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	b _0206F4D0
_0206F414:
	ldrh r4, [r2]
	ldr r0, _0206F4DC ; =DRIVER_WORK
	strh r1, [r2]
	ldr r5, [r0, #0x668]
	cmp r5, #0
	beq _0206F468
	mov sb, #1
_0206F430:
	ldrsb r0, [r5, #4]
	cmp r0, #1
	ldreq r0, [r5, #0x28]
	cmpeq r0, r8
	ldreqh r0, [r5, #0x2c]
	cmpeq r0, r7
	bne _0206F45C
	mov r0, r5
	mov r1, r6
	mov r2, sb
	bl DseSequence_Stop
_0206F45C:
	ldr r5, [r5, #0xa4]
	cmp r5, #0
	bne _0206F430
_0206F468:
	ldr r1, _0206F4D8 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	b _0206F4D0
_0206F478:
	ldrh r4, [r2]
	ldr r0, _0206F4DC ; =DRIVER_WORK
	strh r1, [r2]
	ldr r8, [r0, #0x668]
	cmp r8, #0
	beq _0206F4C4
	mov r5, #1
_0206F494:
	ldrsb r0, [r8, #4]
	cmp r0, #1
	ldreqh r0, [r8, #0x2c]
	cmpeq r0, r7
	bne _0206F4B8
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl DseSequence_Stop
_0206F4B8:
	ldr r8, [r8, #0xa4]
	cmp r8, #0
	bne _0206F494
_0206F4C4:
	ldr r1, _0206F4D8 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
_0206F4D0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0206F4D8: .word 0x04000208
_0206F4DC: .word DRIVER_WORK
	arm_func_end DseSe_Stop

	arm_func_start DseSe_StopAll
DseSe_StopAll: ; 0x0206F4E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0206F544 ; =0x04000208
	mov r2, #0
	ldrh r4, [r3]
	ldr r1, _0206F548 ; =DRIVER_WORK
	mov r5, r0
	strh r2, [r3]
	ldr r7, [r1, #0x668]
	cmp r7, #0
	beq _0206F534
	mov r6, #1
_0206F50C:
	ldrsb r0, [r7, #4]
	cmp r0, #1
	bne _0206F528
	mov r0, r7
	mov r1, r5
	mov r2, r6
	bl DseSequence_Stop
_0206F528:
	ldr r7, [r7, #0xa4]
	cmp r7, #0
	bne _0206F50C
_0206F534:
	ldr r1, _0206F544 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206F544: .word 0x04000208
_0206F548: .word DRIVER_WORK
	arm_func_end DseSe_StopAll

	arm_func_start DseSe_StopSeq
DseSe_StopSeq: ; 0x0206F54C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _0206F5C0 ; =0x04000208
	mov r2, #0
	ldrh r5, [r3]
	ldr r1, _0206F5C4 ; =DRIVER_WORK
	mov r6, r0
	strh r2, [r3]
	ldr r4, [r1, #0x668]
	cmp r4, #0
	beq _0206F5B0
	mov r8, r2
	mov r7, #1
_0206F57C:
	ldrsb r0, [r4, #4]
	cmp r0, #1
	ldreq r0, [r4, #0x28]
	moveq r0, r0, lsl #0x10
	cmpeq r6, r0, lsr #16
	bne _0206F5A4
	mov r0, r4
	mov r1, r8
	mov r2, r7
	bl DseSequence_Stop
_0206F5A4:
	ldr r4, [r4, #0xa4]
	cmp r4, #0
	bne _0206F57C
_0206F5B0:
	ldr r1, _0206F5C0 ; =0x04000208
	ldrh r0, [r1]
	strh r5, [r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206F5C0: .word 0x04000208
_0206F5C4: .word DRIVER_WORK
	arm_func_end DseSe_StopSeq

	arm_func_start sub_0206F5C8
sub_0206F5C8: ; 0x0206F5C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mvn r0, #0
	mov r6, r1
	mov r5, r2
	cmp r7, r0
	ldr r2, _0206F6F4 ; =0x04000208
	mov r1, #0
	beq _0206F69C
	cmp r6, #0
	bne _0206F648
	ldrh r4, [r2]
	ldr r0, _0206F6F8 ; =DRIVER_WORK
	strh r1, [r2]
	ldr r6, [r0, #0x668]
	cmp r6, #0
	beq _0206F638
_0206F60C:
	ldrsb r0, [r6, #4]
	cmp r0, #1
	ldreq r0, [r6, #0x28]
	cmpeq r0, r7
	bne _0206F62C
	mov r0, r6
	mov r1, r5
	bl DseSequence_SetFades
_0206F62C:
	ldr r6, [r6, #0xa4]
	cmp r6, #0
	bne _0206F60C
_0206F638:
	ldr r1, _0206F6F4 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	b _0206F6EC
_0206F648:
	ldrh r4, [r2]
	ldr r0, _0206F6F8 ; =DRIVER_WORK
	strh r1, [r2]
	ldr r8, [r0, #0x668]
	cmp r8, #0
	beq _0206F68C
_0206F660:
	ldr r0, [r8, #0x28]
	cmp r0, r7
	ldreqh r0, [r8, #0x2c]
	cmpeq r0, r6
	bne _0206F680
	mov r0, r8
	mov r1, r5
	bl DseSequence_SetFades
_0206F680:
	ldr r8, [r8, #0xa4]
	cmp r8, #0
	bne _0206F660
_0206F68C:
	ldr r1, _0206F6F4 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	b _0206F6EC
_0206F69C:
	ldrh r4, [r2]
	ldr r0, _0206F6F8 ; =DRIVER_WORK
	strh r1, [r2]
	ldr r7, [r0, #0x668]
	cmp r7, #0
	beq _0206F6E0
_0206F6B4:
	ldrsb r0, [r7, #4]
	cmp r0, #1
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, r6
	bne _0206F6D4
	mov r0, r7
	mov r1, r5
	bl DseSequence_SetFades
_0206F6D4:
	ldr r7, [r7, #0xa4]
	cmp r7, #0
	bne _0206F6B4
_0206F6E0:
	ldr r1, _0206F6F4 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
_0206F6EC:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206F6F4: .word 0x04000208
_0206F6F8: .word DRIVER_WORK
	arm_func_end sub_0206F5C8

	arm_func_start sub_0206F6FC
sub_0206F6FC: ; 0x0206F6FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0206F76C ; =0x04000208
	ldr r1, _0206F770 ; =_022B9208
	ldrh r5, [r2]
	ldr r4, [r1, #0x1cc]
	mov r1, #0
	mov r6, r0
	strh r1, [r2]
	cmp r4, #0
	beq _0206F758
	mov r8, #1
	mov r7, r8
_0206F72C:
	ldrsb r0, [r4, #0xa]
	cmp r0, #1
	bne _0206F74C
	mov r0, r4
	mov r1, r8
	mov r2, r6
	bl sub_0206FAE8
	strb r7, [r4, #0x13]
_0206F74C:
	ldr r4, [r4, #0x500]
	cmp r4, #0
	bne _0206F72C
_0206F758:
	ldr r2, _0206F76C ; =0x04000208
	mov r0, #0
	ldrh r1, [r2]
	strh r5, [r2]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206F76C: .word 0x04000208
_0206F770: .word _022B9208
	arm_func_end sub_0206F6FC

	arm_func_start sub_0206F774
sub_0206F774: ; 0x0206F774
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0206F7C4 ; =_022B9208
	mov r6, r0
	ldr r5, [r1, #0x1cc]
	cmp r5, #0
	beq _0206F7BC
	mov r4, #0
_0206F790:
	ldrsb r0, [r5, #0x13]
	cmp r0, #1
	bne _0206F7B0
	mov r0, r5
	mov r1, r4
	mov r2, r6
	strb r4, [r5, #0x13]
	bl sub_0206FAE8
_0206F7B0:
	ldr r5, [r5, #0x500]
	cmp r5, #0
	bne _0206F790
_0206F7BC:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206F7C4: .word _022B9208
	arm_func_end sub_0206F774

	arm_func_start sub_0206F7C8
sub_0206F7C8: ; 0x0206F7C8
	stmdb sp!, {r3, lr}
	ldr r1, _0206F804 ; =_022B9208
	ldrsb r1, [r1, #4]
	cmp r1, #0
	mvneq r0, #0x59
	ldmeqia sp!, {r3, pc}
	bl sub_0206FD2C
	cmp r0, #0
	mvneq r0, #0xb0
	ldmeqia sp!, {r3, pc}
	ldrsb r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldrne r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206F804: .word _022B9208
	arm_func_end sub_0206F7C8

	arm_func_start sub_0206F808
sub_0206F808: ; 0x0206F808
	stmdb sp!, {r4, lr}
	ldr r0, _0206F83C ; =_022B9208
	ldr r4, [r0, #0x1cc]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
_0206F81C:
	ldr r0, [r4]
	cmp r0, #0
	ble _0206F82C
	bl sub_0206F840
_0206F82C:
	ldr r4, [r4, #0x500]
	cmp r4, #0
	bne _0206F81C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206F83C: .word _022B9208
	arm_func_end sub_0206F808

	arm_func_start sub_0206F840
sub_0206F840: ; 0x0206F840
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0206F96C ; =_022B9208
	mov r5, r0
	ldrsb r1, [r1, #4]
	cmp r1, #0
	mvneq r0, #0x59
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_0206FD2C
	movs r4, r0
	bne _0206F880
	mov r1, r5
	mvn r0, #0x3f
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x3f
	ldmia sp!, {r4, r5, r6, pc}
_0206F880:
	mov r1, #0
	strb r1, [r4, #0x2b]
	ldr r0, _0206F970 ; =0x04000208
	strb r1, [r4, #9]
	ldrh r3, [r0]
	strh r1, [r0]
	ldrsb r2, [r4, #6]
	ldr r1, _0206F970 ; =0x04000208
	cmp r2, #0
	moveq r0, #1
	streqb r0, [r4, #6]
	ldrh r0, [r1]
	cmp r2, #0
	strh r3, [r1]
	bne _0206F964
	mov r1, #0
	strb r1, [r4, #0x14]
	ldrsb r0, [r4, #0xa]
	cmp r0, #1
	bne _0206F904
	mov r0, r5
	bl sub_0206F9EC
	mov r0, r5
	bl sub_0206F974
	cmp r0, #0
	ble _0206F904
	mov r6, #4
_0206F8EC:
	mov r0, r6
	bl sub_02079B14
	mov r0, r5
	bl sub_0206F974
	cmp r0, #0
	bgt _0206F8EC
_0206F904:
	ldrsb r0, [r4, #0x12]
	cmp r0, #1
	bne _0206F918
	mov r0, r4
	bl sub_0207009C
_0206F918:
	mov r1, #1
	strb r1, [r4, #5]
	strb r1, [r4, #0x10]
	mov r0, #0
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	mov r0, r5
	streqb r1, [r4, #7]
	bl sub_0206F7C8
	cmp r0, #0
	blt _0206F964
	mov r4, #4
_0206F94C:
	mov r0, r4
	bl sub_02079B14
	mov r0, r5
	bl sub_0206F7C8
	cmp r0, #0
	bge _0206F94C
_0206F964:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206F96C: .word _022B9208
_0206F970: .word 0x04000208
	arm_func_end sub_0206F840

	arm_func_start sub_0206F974
sub_0206F974: ; 0x0206F974
	stmdb sp!, {r3, lr}
	ldr r1, _0206F9A0 ; =_022B9208
	ldrsb r1, [r1, #4]
	cmp r1, #0
	mvneq r0, #0x59
	ldmeqia sp!, {r3, pc}
	bl sub_0206FD2C
	cmp r0, #0
	mvneq r0, #0x3f
	ldrnesb r0, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206F9A0: .word _022B9208
	arm_func_end sub_0206F974

	arm_func_start sub_0206F9A4
sub_0206F9A4: ; 0x0206F9A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0206F9E8 ; =_022B9208
	mov r5, r0
	ldr r4, [r1, #0x1cc]
	cmp r4, #0
	beq _0206F9E0
_0206F9BC:
	ldrsb r0, [r4, #0xa]
	cmp r0, #1
	bne _0206F9D4
	ldr r0, [r4]
	mov r1, r5
	bl sub_0206F9EC
_0206F9D4:
	ldr r4, [r4, #0x500]
	cmp r4, #0
	bne _0206F9BC
_0206F9E0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206F9E8: .word _022B9208
	arm_func_end sub_0206F9A4

	arm_func_start sub_0206F9EC
sub_0206F9EC: ; 0x0206F9EC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0206FAE0 ; =_022B9208
	mov r5, r0
	ldrsb r2, [r2, #4]
	mov r6, r1
	cmp r2, #0
	mvneq r0, #0x59
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_0206FD2C
	movs r4, r0
	bne _0206FA30
	mov r1, r5
	mvn r0, #0x3f
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x3f
	ldmia sp!, {r4, r5, r6, pc}
_0206FA30:
	mov r5, #0
	strb r5, [r4, #0x2a]
	cmp r6, #0
	beq _0206FA60
	mov r0, #0x3e8
	mul r0, r6, r0
	ldr r1, _0206FAE4 ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r5, r0, lsr #0x10
	moveq r5, #1
_0206FA60:
	cmp r5, #0
	mov r1, #0
	bne _0206FAA4
	strb r1, [r4, #0x14]
	strb r1, [r4, #0xa]
	mov r0, r4
	strb r1, [r4, #0xd]
	bl sub_0207009C
	mov r2, #0
	str r2, [r4, #0x2c]
	strh r2, [r4, #0x38]
	ldr r0, [r4]
	ldr r3, [r4, #0x1fc]
	ldr r4, [r4, #0x1f8]
	mov r1, #9
	blx r4
	b _0206FAD8
_0206FAA4:
	mov r0, #1
	strb r0, [r4, #0x14]
	str r1, [r4, #0x34]
	streq r1, [r4, #0x2c]
	beq _0206FAD4
	ldr r0, [r4, #0x2c]
	rsbs r0, r0, #0
	moveq r5, r1
	beq _0206FAD4
	mov r1, r5
	bl _s32_div_f
	str r0, [r4, #0x30]
_0206FAD4:
	strh r5, [r4, #0x38]
_0206FAD8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206FAE0: .word _022B9208
_0206FAE4: .word DRIVER_WORK
	arm_func_end sub_0206F9EC

	arm_func_start sub_0206FAE8
sub_0206FAE8: ; 0x0206FAE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r3, #0x3e8
	mov r4, r0
	mul r0, r2, r3
	ldr r2, _0206FBC4 ; =DRIVER_WORK
	mov r5, r1
	ldrsh r1, [r2, #0x28]
	bl _s32_div_f
	ldrsb r1, [r4, #0x13]
	cmp r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #1
	bne _0206FB9C
	cmp r0, #0
	bne _0206FB58
	ldrsb r0, [r4, #8]
	cmp r0, #1
	bne _0206FBBC
	mov r0, r4
	bl sub_0207009C
	ldr r0, [r4]
	ldr r3, [r4, #0x1fc]
	ldr r4, [r4, #0x1f8]
	mov r1, #9
	mov r2, #0
	blx r4
	b _0206FBBC
_0206FB58:
	mov r1, #1
	strb r1, [r4, #0x14]
	mov r1, #0
	mov r0, r0, lsl #0x10
	str r1, [r4, #0x34]
	movs r5, r0, lsr #0x10
	streq r1, [r4, #0x2c]
	beq _0206FB94
	ldr r0, [r4, #0x2c]
	rsbs r0, r0, #0
	moveq r5, r1
	beq _0206FB94
	mov r1, r5
	bl _s32_div_f
	str r0, [r4, #0x30]
_0206FB94:
	strh r5, [r4, #0x38]
	b _0206FBBC
_0206FB9C:
	mov r1, #1
	strb r1, [r4, #0xa]
	ldrsb r0, [r4, #8]
	cmp r0, #1
	bne _0206FBBC
	mov r0, r4
	strb r1, [r4, #0x15]
	bl sub_0206FE5C
_0206FBBC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206FBC4: .word DRIVER_WORK
	arm_func_end sub_0206FAE8

	arm_func_start sub_0206FBC8
sub_0206FBC8: ; 0x0206FBC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _0206FC80 ; =_022B9208
	ldr r4, [r0, #0x1cc]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r7, #0
	mov r6, #9
	mov r5, r7
_0206FBE8:
	ldrsb r0, [r4, #0xa]
	cmp r0, #0
	ldrnesb r0, [r4, #8]
	cmpne r0, #0
	ldrneh r0, [r4, #0x38]
	cmpne r0, #0
	beq _0206FC70
	sub r0, r0, #1
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	ldreq r0, [r4, #0x34]
	beq _0206FC28
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	add r0, r1, r0
_0206FC28:
	str r0, [r4, #0x2c]
	ldrh r8, [r4, #0x38]
	mov r0, r4
	bl sub_0206FC84
	cmp r8, #0
	ldreqsb r0, [r4, #0x14]
	cmpeq r0, #1
	bne _0206FC70
	strb r7, [r4, #0xa]
	mov r0, r4
	strb r7, [r4, #0x14]
	bl sub_0207009C
	ldr r0, [r4]
	ldr r3, [r4, #0x1fc]
	ldr ip, [r4, #0x1f8]
	mov r1, r6
	mov r2, r5
	blx ip
_0206FC70:
	ldr r4, [r4, #0x500]
	cmp r4, #0
	bne _0206FBE8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206FC80: .word _022B9208
	arm_func_end sub_0206FBC8

	arm_func_start sub_0206FC84
sub_0206FC84: ; 0x0206FC84
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #0x2c]
	ldrb r2, [r0, #0xbc]
	mov r1, r1, asr #0x10
	ldr r4, _0206FD20 ; =0x04000208
	mul r1, r2, r1
	ldrb r5, [r0, #0x22]
	ldr r3, _0206FD24 ; =0x82061029
	ldrh r2, [r4]
	mul ip, r5, r1
	smull r1, lr, r3, ip
	mov r1, #0
	strh r1, [r4]
	ldrb r4, [r0, #0x1f]
	add lr, ip, lr
	mov r3, ip, lsr #0x1f
	add lr, r3, lr, asr #13
	mul r5, lr, lr
	ldr lr, _0206FD28 ; =0x81020409
	mov r3, r5, lsr #0x1f
	smull ip, r6, lr, r5
	add r6, r5, r6
	cmp r4, #0
	add r6, r3, r6, asr #6
	ble _0206FD10
_0206FCE8:
	add r3, r0, r1, lsl #2
	ldr ip, [r3, #0x1d8]
	add r1, r1, #1
	str r6, [ip, #0x140]
	ldrh r3, [ip, #6]
	orr r3, r3, #0x20
	strh r3, [ip, #6]
	ldrb r3, [r0, #0x1f]
	cmp r1, r3
	blt _0206FCE8
_0206FD10:
	ldr r1, _0206FD20 ; =0x04000208
	ldrh r0, [r1]
	strh r2, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206FD20: .word 0x04000208
_0206FD24: .word 0x82061029
_0206FD28: .word 0x81020409
	arm_func_end sub_0206FC84

	arm_func_start sub_0206FD2C
sub_0206FD2C: ; 0x0206FD2C
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r3, _0206FD80 ; =0x04000208
	mov r2, #0
	ldrh ip, [r3]
	ldr r1, _0206FD84 ; =_022B9208
	strh r2, [r3]
	ldr r3, [r1, #0x1cc]
	cmp r3, #0
	beq _0206FD6C
_0206FD58:
	ldr r1, [r3]
	cmp r1, r0
	ldrne r3, [r3, #0x500]
	cmpne r3, #0
	bne _0206FD58
_0206FD6C:
	ldr r2, _0206FD80 ; =0x04000208
	mov r0, r3
	ldrh r1, [r2]
	strh ip, [r2]
	bx lr
	.align 2, 0
_0206FD80: .word 0x04000208
_0206FD84: .word _022B9208
	arm_func_end sub_0206FD2C

	arm_func_start sub_0206FD88
sub_0206FD88: ; 0x0206FD88
	stmdb sp!, {r4, lr}
	ldr r1, _0206FDAC ; =_022B9208
	mov r4, r0
	ldr r0, [r1, #0x1c8]
	ldr r2, [r1, #0x1c4]
	sub r1, r4, #0x10
	blx r2
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206FDAC: .word _022B9208
	arm_func_end sub_0206FD88

	arm_func_start sub_0206FDB0
sub_0206FDB0: ; 0x0206FDB0
	stmdb sp!, {r3, lr}
	ldr r0, _0206FDD8 ; =_022B9208
	ldrsb r1, [r0, #0x2a]
	cmp r1, #1
	ldrnesb r0, [r0, #0xf5]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0206FDDC ; =_022B9234
	bl sub_02079940
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206FDD8: .word _022B9208
_0206FDDC: .word _022B9234
	arm_func_end sub_0206FDB0

	arm_func_start sub_0206FDE0
sub_0206FDE0: ; 0x0206FDE0
	stmdb sp!, {r3, lr}
	ldr r2, _0206FE4C ; =DRIVER_WORK
	ldr r1, _0206FE50 ; =_022B9208
	ldrb ip, [r2, #0x738]
	mov r3, #0
	ldr r0, _0206FE54 ; =_022B9234
	bic ip, ip, #6
	strb ip, [r2, #0x738]
	ldrb ip, [r2, #0x739]
	strb r3, [r1, #0x29]
	mov r3, #1
	orr ip, ip, #6
	strb ip, [r2, #0x739]
	strb r3, [r1, #0x2a]
	bl sub_02079940
	ldr r0, _0206FE54 ; =_022B9234
	bl sub_02079800
	ldr r1, _0206FE50 ; =_022B9208
	mov r2, #0
	ldr r0, _0206FE58 ; =_022B9300
	strb r2, [r1, #0xf5]
	mov r2, #1
	strb r2, [r1, #0xf6]
	bl sub_02079940
	ldr r0, _0206FE58 ; =_022B9300
	bl sub_02079800
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206FE4C: .word DRIVER_WORK
_0206FE50: .word _022B9208
_0206FE54: .word _022B9234
_0206FE58: .word _022B9300
	arm_func_end sub_0206FDE0

	arm_func_start sub_0206FE5C
sub_0206FE5C: ; 0x0206FE5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldrsb r0, [sl, #0x12]
	cmp r0, #1
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsb r0, [sl, #0x15]
	add r5, sl, #0x1b8
	cmp r0, #1
	bne _0206FEB0
	ldr r1, [r5, #0xc]
	ldr r2, [r5]
	mov r0, #0
	bl ArrayFill32Fast
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	bl sub_0207A2DC
	mov r0, #0
	strb r0, [sl, #0x15]
_0206FEB0:
	mov r0, #0
	strb r0, [r5, #0x2c]
	ldr r1, [sl, #0x3c]
	ldr r0, _02070080 ; =0x00FFB0FF
	bl _u32_div_f
	mov r4, r0
	ldr r1, [r5, #8]
	ldr r0, _02070084 ; =_022B9208
	mul r1, r4, r1
	mov r1, r1, lsr #6
	str r0, [sp]
	ldr r3, _02070088 ; =sub_0206FDB0
	mov r2, r1
	mov r0, #2
	bl sub_0207C984
	ldr r0, [sl, #0x2c]
	ldrb r1, [sl, #0xbc]
	mov r0, r0, asr #0x10
	ldrb r2, [sl, #0x22]
	mul r0, r1, r0
	mul r6, r2, r0
	ldr r2, _0207008C ; =0x82061029
	ldr r0, _02070090 ; =0x04000208
	smull r1, r7, r2, r6
	ldr r3, [r5, #4]
	add r7, r6, r7
	mov r1, r6, lsr #0x1f
	add r7, r1, r7, asr #13
	ldrh r1, [r0]
	mul r6, r7, r7
	ldr r2, _02070094 ; =0x81020409
	str r1, [sp, #4]
	smull r1, sb, r2, r6
	add sb, r6, sb
	mov r1, r6, lsr #0x1f
	mov r6, #0
	strh r6, [r0]
	ldrb r0, [sl, #0x1f]
	mov r8, r3, lsr #2
	add sb, r1, sb, asr #6
	cmp r0, #0
	ble _0207000C
	mvn fp, #0xc0000000
_0206FF5C:
	add r0, r5, r6, lsl #2
	ldr r7, [r0, #0x20]
	mov r0, #0x1000
	strh r0, [r7, #4]
	mov r0, #1
	strb r0, [r7, #0xc]
	strb r0, [r7, #0x1f]
	ldrb r0, [sl, #0x1e]
	cmp r0, #1
	moveq r0, #0
	movne r0, r6
	add r0, r5, r0, lsl #2
	ldr r0, [r0, #0x10]
	str r0, [r7, #0x30]
	mov r0, #0
	str r0, [r7, #0x34]
	str r8, [r7, #0x38]
	mov r0, #1
	strb r0, [r7, #0x21]
	str r4, [r7, #0x13c]
	str sb, [r7, #0x140]
	ldrb r0, [sl, #0x1e]
	cmp r0, #1
	ldrne r0, _02070098 ; =DRIVER_WORK
	ldrneb r0, [r0, #0x39]
	cmpne r0, #1
	moveq r0, #0x40
	streq r0, [r7, #0x144]
	beq _0206FFE0
	tst r6, #1
	moveq r0, #0
	movne r0, #0x7f
	str r0, [r7, #0x144]
_0206FFE0:
	add r0, r7, #0x3c
	mov r1, fp
	bl SoundEnvelope_ForceVolume
	add r0, r7, #0x5c
	bl SoundLfoBank_Reset
	mov r0, #1
	strh r0, [r7, #6]
	ldrb r0, [sl, #0x1f]
	add r6, r6, #1
	cmp r6, r0
	blt _0206FF5C
_0207000C:
	ldr r1, _02070098 ; =DRIVER_WORK
	ldr r3, _02070090 ; =0x04000208
	ldrb r4, [r1, #0x739]
	mov r2, #1
	mov r0, #0
	bic r4, r4, #4
	strb r4, [r1, #0x739]
	ldrb r4, [r1, #0x738]
	orr r4, r4, #4
	strb r4, [r1, #0x738]
	ldrh r1, [r3]
	ldr r1, [sp, #4]
	strh r1, [r3]
	strb r2, [sl, #0x12]
	ldrb r1, [sl, #0x1e]
	cmp r1, #0
	ble _02070074
	mov r2, r0
_02070054:
	add r1, sl, r0, lsl #2
	add r1, r1, #0x200
	strh r2, [r1, #0x10]
	strh r2, [r1, #0x12]
	ldrb r1, [sl, #0x1e]
	add r0, r0, #1
	cmp r0, r1
	blt _02070054
_02070074:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02070080: .word 0x00FFB0FF
_02070084: .word _022B9208
_02070088: .word sub_0206FDB0
_0207008C: .word 0x82061029
_02070090: .word 0x04000208
_02070094: .word 0x81020409
_02070098: .word DRIVER_WORK
	arm_func_end sub_0206FE5C

	arm_func_start sub_0207009C
sub_0207009C: ; 0x0207009C
	ldr r3, _0207011C ; =0x04000208
	mov ip, #0
	ldrh r1, [r3]
	strh ip, [r3]
	ldrsb r2, [r0, #0x12]
	cmp r2, #0
	bne _020700C8
	ldrh r0, [r3]
	mov r0, ip
	strh r1, [r3]
	bx lr
_020700C8:
	strb ip, [r0, #0x12]
	ldrb r2, [r0, #0x1f]
	cmp r2, #0
	ble _020700F8
	mov r3, #2
_020700DC:
	add r2, r0, ip, lsl #2
	ldr r2, [r2, #0x1d8]
	add ip, ip, #1
	strh r3, [r2, #6]
	ldrb r2, [r0, #0x1f]
	cmp ip, r2
	blt _020700DC
_020700F8:
	ldr r2, _02070120 ; =DRIVER_WORK
	ldr r3, _0207011C ; =0x04000208
	ldrb ip, [r2, #0x739]
	mov r0, #0
	orr ip, ip, #4
	strb ip, [r2, #0x739]
	ldrh r2, [r3]
	strh r1, [r3]
	bx lr
	.align 2, 0
_0207011C: .word 0x04000208
_02070120: .word DRIVER_WORK
	arm_func_end sub_0207009C

	arm_func_start sub_02070124
sub_02070124: ; 0x02070124
	stmdb sp!, {r3, lr}
	ldr r0, _02070144 ; =_022B7A30
	mov r1, #0
	strh r1, [r0, #0xe]
	strh r1, [r0, #0x10]
	bl sub_020701F8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070144: .word _022B7A30
	arm_func_end sub_02070124

	arm_func_start sub_02070148
sub_02070148: ; 0x02070148
	stmdb sp!, {r3, lr}
	bl sub_0207028C
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02070148

	arm_func_start sub_02070158
sub_02070158: ; 0x02070158
	stmdb sp!, {r3, lr}
	ldr r0, _02070184 ; =_022B7A30
	ldrh r0, [r0, #0xe]
	cmp r0, #0
	beq _0207017C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl sub_020702F8
_0207017C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070184: .word _022B7A30
	arm_func_end sub_02070158

	arm_func_start sub_02070188
sub_02070188: ; 0x02070188
	stmdb sp!, {r3, lr}
	ldr r0, _020701A8 ; =_022B9484
	ldrsb r0, [r0, #0x24]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _020701AC ; =_022B9484
	bl sub_020708F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_020701A8: .word _022B9484
_020701AC: .word _022B9484
	arm_func_end sub_02070188

	arm_func_start sub_020701B0
sub_020701B0: ; 0x020701B0
	stmdb sp!, {r3, lr}
	ldr r0, _020701F0 ; =_022B9484
	ldrsb r0, [r0, #0x24]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _020701F4 ; =_022B9484
	mov r1, #0
	mov r2, #1
	bl FlushChannels
	ldr r0, _020701F4 ; =_022B9484
	mov r1, #1
	mov r2, #3
	bl FlushChannels
	ldr r0, _020701F4 ; =_022B9484
	bl sub_020706E8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020701F0: .word _022B9484
_020701F4: .word _022B9484
	arm_func_end sub_020701B0

	arm_func_start sub_020701F8
sub_020701F8: ; 0x020701F8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r3, _02070278 ; =_022B9484
	mov ip, #0
	str ip, [r3]
	str ip, [r3, #8]
	strb ip, [r3, #0x24]
	strb ip, [r3, #0x25]
	ldr r2, _0207027C ; =0x78667473
	mov r0, #0x400
	mov r1, #0x10
	strb ip, [r3, #0x26]
	bl DseMem_AllocateThreadStack
	ldr r2, _02070278 ; =_022B9484
	mov r1, #0x400
	str r0, [r2, #0x34]
	ldr r0, _02070280 ; =_022B8330
	str r1, [sp]
	ldrb r3, [r0, #0xd10]
	ldr r0, _02070284 ; =_022B94BC
	ldr r1, _02070288 ; =sub_020709A0
	add r3, r3, #1
	str r3, [sp, #4]
	ldr r3, [r2, #0x34]
	mov r2, #0
	add r3, r3, #0x400
	bl StartThread
	ldr r0, _02070284 ; =_022B94BC
	bl sub_02079940
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070278: .word _022B9484
_0207027C: .word 0x78667473
_02070280: .word _022B8330
_02070284: .word _022B94BC
_02070288: .word sub_020709A0
	arm_func_end sub_020701F8

	arm_func_start sub_0207028C
sub_0207028C: ; 0x0207028C
	stmdb sp!, {r4, lr}
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl sub_020702F8
	ldr r0, _020702EC ; =_022B9484
	mov r1, #1
	ldr r2, _020702F0 ; =0x04000208
	strb r1, [r0, #0x26]
	ldrh r4, [r2]
	mov r1, #0
	ldr r0, _020702F4 ; =_022B94BC
	strh r1, [r2]
	bl sub_02079940
	ldr r2, _020702F0 ; =0x04000208
	ldr r0, _020702F4 ; =_022B94BC
	ldrh r1, [r2]
	strh r4, [r2]
	bl sub_02079800
	ldr r0, _020702EC ; =_022B9484
	ldr r0, [r0, #0x34]
	bl DseMem_Free
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020702EC: .word _022B9484
_020702F0: .word 0x04000208
_020702F4: .word _022B94BC
	arm_func_end sub_0207028C

	arm_func_start sub_020702F8
sub_020702F8: ; 0x020702F8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _02070648 ; =0x0000FFFF
	mov r8, r1
	cmp r8, r3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	ldreq r1, _0207064C ; =_022B9484
	ldreqh r1, [r1, #0x1c]
	cmpeq r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	beq _02070370
	cmp r0, #1
	blo _02070350
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02070350:
	tst r8, #0xff00
	bne _02070370
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02070370:
	cmp r2, #0
	moveq r7, #0
	moveq r6, r7
	moveq r5, r7
	beq _02070390
	ldrb r5, [r2]
	ldrb r6, [r2, #1]
	ldrb r7, [r2, #2]
_02070390:
	mov r1, #0xc
	mul r1, r0, r1
	ldr r2, _02070650 ; =_022B7A3E
	ldr r0, _02070654 ; =_022B9484
	strh r8, [r2, r1]
	add r1, r2, r1
	strh r5, [r1, #2]
	strh r6, [r1, #8]
	strh r7, [r1, #0xa]
	bl sub_020708F4
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0
	strb r1, [r0, #0x24]
	ldr r0, [r0]
	cmp r0, #0
	beq _020703E0
	bl DseMem_Free
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0
	str r1, [r0]
_020703E0:
	ldr r0, _0207064C ; =_022B9484
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02070400
	bl DseMem_Free
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0
	str r1, [r0, #8]
_02070400:
	cmp r8, #0
	bgt _02070410
	beq _0207051C
	b _02070514
_02070410:
	sub r0, r8, #0x300
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02070514
_02070420: ; jump table
	b _02070438 ; case 0
	b _02070458 ; case 1
	b _02070480 ; case 2
	b _020704A8 ; case 3
	b _020704C4 ; case 4
	b _020704EC ; case 5
_02070438:
	ldr r0, _0207064C ; =_022B9484
	ldr r1, _02070658 ; =_02070A44
	strb r5, [r0, #0x1e]
	cmp r6, #0
	moveq r8, #0
	str r1, [r0, #0x30]
	mov r4, #0
	b _0207051C
_02070458:
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0x7f
	strb r1, [r0, #0x1e]
	ldr r1, _0207065C ; =sub_02070A9C
	strb r5, [r0, #0x21]
	cmp r6, #0
	moveq r8, #0
	str r1, [r0, #0x30]
	mov r4, #1
	b _0207051C
_02070480:
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0x7f
	strb r1, [r0, #0x1e]
	ldr r1, _02070660 ; =sub_02070B74
	strb r5, [r0, #0x21]
	cmp r6, #0
	moveq r8, #0
	str r1, [r0, #0x30]
	mov r4, #1
	b _0207051C
_020704A8:
	ldr r0, _0207064C ; =_022B9484
	mov r2, #0x7f
	ldr r1, _02070664 ; =sub_02070C30
	strb r2, [r0, #0x1e]
	str r1, [r0, #0x30]
	mov r4, #0
	b _0207051C
_020704C4:
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0x7f
	strb r1, [r0, #0x1e]
	ldr r1, _02070668 ; =sub_02070C58
	strb r5, [r0, #0x21]
	cmp r6, #0
	moveq r8, #0
	str r1, [r0, #0x30]
	mov r4, #1
	b _0207051C
_020704EC:
	ldr r0, _0207064C ; =_022B9484
	mov r1, #0x7f
	strb r1, [r0, #0x1e]
	ldr r1, _0207066C ; =sub_02070D44
	strb r5, [r0, #0x21]
	cmp r6, #0
	moveq r8, #0
	str r1, [r0, #0x30]
	mov r4, #1
	b _0207051C
_02070514:
	mvn r0, #0x5f
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207051C:
	cmp r8, #0
	beq _02070640
	mov r0, #0xc0
	mul r5, r7, r0
	mov r0, r6, lsl #8
	add r1, r0, r0, lsr #31
	ldr r3, _0207064C ; =_022B9484
	mov r6, r1, asr #1
	str r0, [r3, #0x10]
	add r1, r6, r6, lsr #31
	ldr r2, _02070670 ; =0x81020409
	str r6, [r3, #0x14]
	mov r1, r1, asr #1
	str r1, [r3, #0x18]
	smull r1, r6, r2, r5
	strh r8, [r3, #0x1c]
	add r6, r5, r6
	mov r1, r5, lsr #0x1f
	add r6, r1, r6, asr #6
	strb r7, [r3, #0x1f]
	add r1, r6, #0x40
	strh r1, [r3, #0x22]
	ldr r2, [r3]
	cmp r2, #0
	bne _0207059C
	mov r1, #0x20
	bl DseMem_AllocateUser
	movs r2, r0
	ldr r0, _0207064C ; =_022B9484
	str r2, [r0]
	mvneq r0, #0x7f
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_0207059C:
	ldr r0, _0207064C ; =_022B9484
	cmp r4, #1
	ldr r1, [r0, #0x14]
	add r1, r2, r1
	str r1, [r0, #4]
	bne _02070604
	ldr r0, [r0, #0x10]
	mov r1, #0x20
	bl DseMem_AllocateUser
	ldr r1, _0207064C ; =_022B9484
	cmp r0, #0
	str r0, [r1, #8]
	bne _020705F8
	ldr r0, [r1]
	bl DseMem_Free
	mov r1, #0
	ldr r3, _0207064C ; =_022B9484
	mov r2, r1
	sub r0, r1, #0x80
	str r1, [r3]
	bl Dse_SetError
	mvn r0, #0x7f
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020705F8:
	ldr r2, [r1, #0x14]
	add r0, r0, r2
	str r0, [r1, #0xc]
_02070604:
	ldr r3, _0207064C ; =_022B9484
	mov r1, #0
	ldr r0, _02070654 ; =_022B9484
	mov r2, #1
	strb r1, [r3, #0x20]
	bl FlushChannels
	ldr r0, _02070654 ; =_022B9484
	mov r1, #1
	mov r2, #3
	bl FlushChannels
	ldr r0, _02070654 ; =_022B9484
	bl sub_020706E8
	ldr r0, _0207064C ; =_022B9484
	mov r1, #1
	strb r1, [r0, #0x24]
_02070640:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02070648: .word 0x0000FFFF
_0207064C: .word _022B9484
_02070650: .word _022B7A3E
_02070654: .word _022B9484
_02070658: .word sub_02070A44
_0207065C: .word sub_02070A9C
_02070660: .word sub_02070B74
_02070664: .word sub_02070C30
_02070668: .word sub_02070C58
_0207066C: .word sub_02070D44
_02070670: .word 0x81020409
	arm_func_end sub_020702F8

	arm_func_start FlushChannels
FlushChannels: ; 0x02070674
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _020706E0 ; =_022B7A6C
	mov r3, #0x15c
	mla r5, r2, r3, r4
	ldr r3, _020706E4 ; =0x04000208
	mov r7, r0
	ldrh r4, [r3]
	mov r2, #0
	mov r0, r5
	mov r6, r1
	strh r2, [r3]
	bl DseVoice_Deallocate
	add r0, r5, #0x3c
	mvn r1, #0xc0000000
	bl SoundEnvelope_ForceVolume
	add r0, r5, #0x5c
	bl SoundLfoBank_Reset
	mov r0, #0
	strh r0, [r5, #6]
	mov r0, #0x10
	strb r0, [r5, #0x14e]
	add r0, r7, r6, lsl #2
	ldr r1, _020706E4 ; =0x04000208
	str r5, [r0, #0x28]
	ldrh r0, [r1]
	strh r4, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020706E0: .word _022B7A6C
_020706E4: .word 0x04000208
	arm_func_end FlushChannels

	arm_func_start sub_020706E8
sub_020706E8: ; 0x020706E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r6, [r4, #0x18]
	mov r7, #0
	strb r7, [r4, #0x20]
	ldrh r3, [r4, #0x1c]
	add r5, r6, #0x20
	mov r6, r6, lsr #1
	sub r3, r3, #0x300
	mov r5, r5, lsr #1
	mov r8, r6, lsl #9
	mov r6, r5, lsl #9
	cmp r3, #7
	mov r5, r8, lsr #5
	mov r6, r6, lsr #5
	addls pc, pc, r3, lsl #2
	b _0207077C
_02070730: ; jump table
	b _02070750 ; case 0
	b _02070760 ; case 1
	b _02070760 ; case 2
	b _02070770 ; case 3
	b _02070770 ; case 4
	b _02070770 ; case 5
	b _02070770 ; case 6
	b _02070770 ; case 7
_02070750:
	mov r0, r7
	mov r1, r7
	mov r2, r7
	b _0207077C
_02070760:
	mov r0, #1
	mov r2, r0
	mov r1, #2
	b _0207077C
_02070770:
	mov r0, #1
	mov r2, r0
	mov r1, #2
_0207077C:
	mov r3, r2
	bl sub_0207CB54
	mov r1, #1
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [r4, #0x14]
	ldr r2, [r4]
	mov r1, r0
	mov r3, r3, lsr #2
	bl sub_0207C944
	mov r0, #1
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [r4, #0x14]
	ldr r2, [r4, #4]
	mov r3, r3, lsr #2
	bl sub_0207C944
	ldr r3, _020708E4 ; =sub_0207098C
	mov r1, r6
	mov r2, r5
	mov r0, #4
	str r4, [sp]
	bl sub_0207C984
	ldr r1, _020708E8 ; =0x04000208
	mov sb, #0
	ldrh r0, [r1]
	str r0, [sp, #0xc]
	strh sb, [r1]
	mov r5, #1
	mov r7, sb
	mvn r6, #0xc0000000
	mov r8, #0x1000
	mov fp, r5
_02070810:
	add r0, r4, sb, lsl #2
	ldr sl, [r0, #0x28]
	cmp sb, #0
	strh r8, [sl, #4]
	strb fp, [sl, #0xc]
	strb fp, [sl, #0x1f]
	ldreq r0, [r4]
	mov r1, r6
	ldrne r0, [r4, #4]
	tst sb, #1
	str r0, [sl, #0x30]
	str r7, [sl, #0x34]
	ldr r0, [r4, #0x14]
	mov r0, r0, lsr #2
	str r0, [sl, #0x38]
	mov r0, #1
	strb r0, [sl, #0x21]
	mov r0, #0x200
	str r0, [sl, #0x13c]
	ldrb r0, [r4, #0x1e]
	str r0, [sl, #0x140]
	moveq r0, r7
	movne r0, #0x7f
	str r0, [sl, #0x144]
	add r0, sl, #0x3c
	bl SoundEnvelope_ForceVolume
	add r0, sl, #0x5c
	bl SoundLfoBank_Reset
	add sb, sb, #1
	strh r5, [sl, #6]
	cmp sb, #2
	blt _02070810
	ldr r1, _020708EC ; =DRIVER_WORK
	ldr r0, _020708F0 ; =_022B9484
	ldrb r3, [r1, #0x739]
	strb r5, [r0, #0x25]
	ldr r2, _020708E8 ; =0x04000208
	bic r0, r3, #0x10
	strb r0, [r1, #0x739]
	ldrb r0, [r1, #0x73b]
	bic r0, r0, #3
	strb r0, [r1, #0x73b]
	ldrb r0, [r1, #0x738]
	orr r0, r0, #0x10
	strb r0, [r1, #0x738]
	ldrb r0, [r1, #0x73a]
	orr r0, r0, #3
	strb r0, [r1, #0x73a]
	ldrh r0, [r2]
	ldr r0, [sp, #0xc]
	strh r0, [r2]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020708E4: .word sub_0207098C
_020708E8: .word 0x04000208
_020708EC: .word DRIVER_WORK
_020708F0: .word _022B9484
	arm_func_end sub_020706E8

	arm_func_start sub_020708F4
sub_020708F4: ; 0x020708F4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02070980 ; =_022B9484
	mov r6, r0
	ldrsb r0, [r1, #0x25]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r5, #0
	ldr r0, _02070984 ; =0x04000208
	strb r5, [r1, #0x25]
	ldrh r4, [r0]
	strh r5, [r0]
_02070920:
	add r0, r6, r5, lsl #2
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _02070934
	bl DseVoice_Deallocate
_02070934:
	add r5, r5, #1
	cmp r5, #2
	blt _02070920
	ldr ip, _02070988 ; =DRIVER_WORK
	mov r0, #0
	ldrb r2, [ip, #0x739]
	ldr lr, _02070984 ; =0x04000208
	mov r1, r0
	orr r2, r2, #0x10
	strb r2, [ip, #0x739]
	ldrb r5, [ip, #0x73b]
	mov r2, r0
	mov r3, r0
	orr r5, r5, #3
	strb r5, [ip, #0x73b]
	ldrh ip, [lr]
	strh r4, [lr]
	bl sub_0207CB54
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02070980: .word _022B9484
_02070984: .word 0x04000208
_02070988: .word DRIVER_WORK
	arm_func_end sub_020708F4

	arm_func_start sub_0207098C
sub_0207098C: ; 0x0207098C
	ldr ip, _02070998 ; =sub_02079940
	ldr r0, _0207099C ; =_022B94BC
	bx ip
	.align 2, 0
_02070998: .word sub_02079940
_0207099C: .word _022B94BC
	arm_func_end sub_0207098C

	arm_func_start sub_020709A0
sub_020709A0: ; 0x020709A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, _02070A3C ; =_022B9484
	ldr r4, _02070A40 ; =_022B9484
	mov fp, #1
	mov r6, #0
_020709B4:
	mov r0, r6
	bl sub_02079888
	ldrsb r0, [r4, #0x26]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsb r0, [r4, #0x25]
	cmp r0, #1
	bne _020709B4
	ldrb r7, [r4, #0x20]
	ldr sl, [r4, #0x18]
	ldr sb, [r4]
	cmp r7, #1
	ldr r8, [r4, #4]
	addeq sb, sb, sl
	addeq r8, r8, sl
	ldr ip, [r4, #0x30]
	mov r0, r5
	mov r1, sb
	mov r2, r8
	mov r3, sl
	blx ip
	mov r0, sb
	mov r1, sl
	bl sub_0207A2DC
	mov r0, r8
	mov r1, sl
	bl sub_0207A2DC
	bl sub_0207A300
	cmp r7, #0
	moveq r0, fp
	movne r0, #0
	strb r0, [r4, #0x20]
	b _020709B4
_02070A38:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02070A3C: .word _022B9484
_02070A40: .word _022B9484
	arm_func_end sub_020709A0

	arm_func_start sub_02070A44
sub_02070A44: ; 0x02070A44
	stmdb sp!, {r3, lr}
	ldrb r0, [r0, #0x1f]
	mov ip, r3, asr #1
	cmp ip, #0
	add lr, r0, #0x80
	ldmleia sp!, {r3, pc}
_02070A5C:
	ldrsh r0, [r1]
	sub ip, ip, #1
	cmp ip, #0
	mul r3, r0, lr
	mov r0, r3, asr #7
	add r0, r3, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r1], #2
	ldrsh r0, [r2]
	mul r3, r0, lr
	mov r0, r3, asr #7
	add r0, r3, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r2], #2
	bgt _02070A5C
	ldmia sp!, {r3, pc}
	arm_func_end sub_02070A44

	arm_func_start sub_02070A9C
sub_02070A9C: ; 0x02070A9C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrb r5, [r0, #0x20]
	ldr lr, [r0, #8]
	ldr r4, [r0, #0xc]
	cmp r5, #1
	biceq r5, r3, #1
	ldrh r6, [r0, #0x22]
	ldrb r7, [r0, #0x21]
	addeq lr, lr, r5
	addeq r4, r4, r5
	mov r5, r3, asr #1
	cmp r5, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r3, #0x8000
	rsb r3, r3, #0
	mov ip, r3, lsr #0x11
_02070ADC:
	ldrsh r8, [lr]
	ldrsh r0, [r1]
	sub r5, r5, #1
	mul sl, r8, r6
	mul sb, sl, r7
	mov r8, sl, asr #7
	add r8, sl, r8, lsr #24
	mov r8, r8, asr #8
	add r8, r8, r0, asr #8
	add r0, r0, sb, asr #7
	cmp r0, r3, lsr #17
	strh r8, [lr]
	movgt r0, ip
	bgt _02070B1C
	cmp r0, r3
	movlt r0, r3
_02070B1C:
	strh r0, [r1], #2
	ldrsh r8, [r4]
	ldrsh r0, [r2]
	add lr, lr, #2
	mul sl, r8, r6
	mul sb, sl, r7
	mov r8, sl, asr #7
	add r8, sl, r8, lsr #24
	mov r8, r8, asr #8
	add r8, r8, r0, asr #8
	add r0, r0, sb, asr #7
	cmp r0, r3, lsr #17
	strh r8, [r4]
	movgt r0, ip
	bgt _02070B60
	cmp r0, r3
	movlt r0, r3
_02070B60:
	cmp r5, #0
	strh r0, [r2], #2
	add r4, r4, #2
	bgt _02070ADC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02070A9C

	arm_func_start sub_02070B74
sub_02070B74: ; 0x02070B74
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrb r4, [r0, #0x20]
	ldr lr, [r0, #8]
	ldrh r5, [r0, #0x22]
	cmp r4, #1
	biceq r4, r3, #1
	addeq lr, lr, r4
	mov r4, r3, asr #1
	ldrb r6, [r0, #0x21]
	cmp r4, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, #0x8000
	rsb r0, r0, #0
	mov r3, r0, lsr #0x11
_02070BAC:
	ldrsh r8, [lr]
	ldrsh ip, [r1]
	ldrsh r7, [r2]
	mul sb, r8, r5
	mul sl, sb, r6
	mov r8, sb, asr #7
	add sb, sb, r8, lsr #24
	mov r8, sl, asr #6
	add sl, sl, r8, lsr #25
	add r8, ip, sl, asr #7
	cmp r8, r0, lsr #17
	add ip, ip, r7
	mov sb, sb, asr #8
	add sb, sb, ip, asr #9
	strh sb, [lr]
	sub r4, r4, #1
	movgt r8, r3
	bgt _02070BFC
	cmp r8, r0
	movlt r8, r0
_02070BFC:
	add r7, r7, sl, asr #7
	cmp r7, r0, lsr #17
	strh r8, [r1]
	movgt r7, r3
	bgt _02070C18
	cmp r7, r0
	movlt r7, r0
_02070C18:
	cmp r4, #0
	strh r7, [r2], #2
	add r1, r1, #2
	add lr, lr, #2
	bgt _02070BAC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02070B74

	arm_func_start sub_02070C30
sub_02070C30: ; 0x02070C30
	mov r2, r3, asr #1
	cmp r2, #0
	bxle lr
_02070C3C:
	ldrsh r0, [r1]
	sub r2, r2, #1
	cmp r2, #0
	rsb r0, r0, #0
	strh r0, [r1], #2
	bgt _02070C3C
	bx lr
	arm_func_end sub_02070C30

	arm_func_start sub_02070C58
sub_02070C58: ; 0x02070C58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrb r5, [r0, #0x20]
	ldr lr, [r0, #8]
	ldr r4, [r0, #0xc]
	cmp r5, #1
	biceq r5, r3, #1
	ldrh r6, [r0, #0x22]
	ldrb r7, [r0, #0x21]
	addeq lr, lr, r5
	addeq r4, r4, r5
	mov r5, r3, asr #1
	cmp r5, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r3, #0x8000
	rsb r3, r3, #0
	mov ip, r3, lsr #0x11
_02070C98:
	ldrsh r8, [lr]
	ldrsh r0, [r1]
	sub r5, r5, #1
	mul sl, r8, r6
	mul sb, sl, r7
	mov r8, sl, asr #7
	add r8, sl, r8, lsr #24
	mov r8, r8, asr #8
	add r8, r8, r0, asr #8
	add r0, r0, sb, asr #7
	cmp r0, r3, lsr #17
	strh r8, [lr]
	movgt r0, ip
	bgt _02070CD8
	cmp r0, r3
	movlt r0, r3
_02070CD8:
	strh r0, [r1], #2
	ldrsh r8, [r4]
	ldrsh r0, [r2]
	add lr, lr, #2
	mul sl, r8, r6
	mul sb, sl, r7
	mov r8, sl, asr #7
	add r8, sl, r8, lsr #24
	mov r8, r8, asr #8
	add r8, r8, r0, asr #8
	add r0, r0, sb, asr #7
	cmp r0, r3, lsr #17
	strh r8, [r4]
	movgt r0, ip
	bgt _02070D1C
	cmp r0, r3
	movlt r0, r3
_02070D1C:
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	rsb r0, r0, #0
	cmp r5, #0
	strh r0, [r2], #2
	add r4, r4, #2
	bgt _02070C98
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02070C58

	arm_func_start sub_02070D44
sub_02070D44: ; 0x02070D44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrb r4, [r0, #0x20]
	ldr lr, [r0, #8]
	ldrh r5, [r0, #0x22]
	cmp r4, #1
	biceq r4, r3, #1
	addeq lr, lr, r4
	mov r4, r3, asr #1
	ldrb r6, [r0, #0x21]
	cmp r4, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, #0x8000
	rsb r0, r0, #0
	mov r3, r0, lsr #0x11
_02070D7C:
	ldrsh r8, [lr]
	ldrsh ip, [r1]
	ldrsh r7, [r2]
	mul sb, r8, r5
	mul sl, sb, r6
	mov r8, sb, asr #7
	add sb, sb, r8, lsr #24
	add r8, ip, sl, asr #7
	cmp r8, r0, lsr #17
	add ip, ip, r7
	mov sb, sb, asr #8
	add sb, sb, ip, asr #9
	strh sb, [lr]
	sub r4, r4, #1
	movgt r8, r3
	bgt _02070DC4
	cmp r8, r0
	movlt r8, r0
_02070DC4:
	add r7, r7, sl, asr #7
	cmp r7, r0, lsr #17
	strh r8, [r1]
	movgt r7, r3
	bgt _02070DE0
	cmp r7, r0
	movlt r7, r0
_02070DE0:
	mov r7, r7, lsl #0x10
	mov r7, r7, lsr #0x10
	mov r7, r7, lsl #0x10
	mov r7, r7, asr #0x10
	rsb r7, r7, #0
	cmp r4, #0
	strh r7, [r2], #2
	add lr, lr, #2
	add r1, r1, #2
	bgt _02070D7C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02070D44

	arm_func_start DseDriver_StartMainThread
DseDriver_StartMainThread: ; 0x02070E0C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r3, _02070E90 ; =_022B8330
	ldrb r0, [r3, #0xd10]
	cmp r0, #0
	beq _02070E84
	mov ip, #0
	strb ip, [r3, #0xd12]
	mov r0, #1
	strb r0, [r3, #0xd11]
	ldr r2, _02070E94 ; =0x72637473
	mov r0, #0x800
	mov r1, #0x10
	strb ip, [r3, #0xd13]
	bl DseMem_AllocateThreadStack
	ldr r2, _02070E90 ; =_022B8330
	mov r1, #0x800
	str r0, [r2, #0xdd4]
	str r1, [sp]
	ldrb r3, [r2, #0xd10]
	ldr r0, _02070E98 ; =_022B9044
	ldr r1, _02070E9C ; =DseDriver_Main
	str r3, [sp, #4]
	ldr r3, [r2, #0xdd4]
	mov r2, #0
	add r3, r3, #0x800
	bl StartThread
	ldr r0, _02070E98 ; =_022B9044
	bl sub_02079940
	bl DseDriver_StartTickTimer
_02070E84:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070E90: .word _022B8330
_02070E94: .word 0x72637473
_02070E98: .word _022B9044
_02070E9C: .word DseDriver_Main
	arm_func_end DseDriver_StartMainThread

	arm_func_start sub_02070EA0
sub_02070EA0: ; 0x02070EA0
	stmdb sp!, {r3, lr}
	bl sub_02070F4C
	ldr r1, _02070ED4 ; =_022B8330
	mov r2, #0
	ldr r0, _02070ED8 ; =_022B9044
	strb r2, [r1, #0xd11]
	bl sub_02079940
	ldr r0, _02070ED8 ; =_022B9044
	bl sub_02079800
	ldr r0, _02070ED4 ; =_022B8330
	ldr r0, [r0, #0xdd4]
	bl DseMem_Free
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070ED4: .word _022B8330
_02070ED8: .word _022B9044
	arm_func_end sub_02070EA0

	arm_func_start DseDriver_StartTickTimer
DseDriver_StartTickTimer: ; 0x02070EDC
	stmdb sp!, {r3, lr}
	ldr r0, _02070F3C ; =_022B8330
	add r0, r0, #0xd00
	ldrsb r0, [r0, #0xd8]
	cmp r0, #0
	bne _02070F34
	ldr r1, _02070F40 ; =0x00001474
	ldr ip, _02070F44 ; =DRIVER_WORK
	ldr r3, _02070F48 ; =DseDriver_NotifyTick
	mov r2, r1
	mov r0, #0
	str ip, [sp]
	bl sub_0207C984
	mov r0, #0
	mov r1, r0
	mov r3, r0
	mov r2, #1
	bl sub_0207C8B8
	mov r0, #1
	bl sub_0207CF14
	mov r0, #1
	bl sub_0207CD44
_02070F34:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070F3C: .word _022B8330
_02070F40: .word 0x00001474
_02070F44: .word DRIVER_WORK
_02070F48: .word DseDriver_NotifyTick
	arm_func_end DseDriver_StartTickTimer

	arm_func_start sub_02070F4C
sub_02070F4C: ; 0x02070F4C
	stmdb sp!, {r3, lr}
	mov r1, #0
	ldr r0, _02070FC4 ; =0x0000FFFF
	mov r3, r1
	mov r2, #1
	bl sub_0207C8E0
	ldr r0, _02070FC8 ; =_022B8330
	add r0, r0, #0xd00
	ldrsb r0, [r0, #0xd8]
	cmp r0, #0
	bne _02070F90
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp]
	bl sub_0207C984
_02070F90:
	mov r0, #1
	bl sub_0207CF14
	mov r0, #1
	bl sub_0207CD44
	ldr r2, _02070FCC ; =_022B7A30
	mov r0, #0
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x34]
	ldr r1, _02070FD0 ; =DRIVER_WORK
	strh r0, [r2, #0x32]
	strb r0, [r1, #0x739]
	strb r0, [r1, #0x738]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02070FC4: .word 0x0000FFFF
_02070FC8: .word _022B8330
_02070FCC: .word _022B7A30
_02070FD0: .word DRIVER_WORK
	arm_func_end sub_02070F4C

	arm_func_start DseDriver_NotifyTick
DseDriver_NotifyTick: ; 0x02070FD4
	stmdb sp!, {r3, lr}
	ldr r1, _0207100C ; =_022B8330
	add r0, r1, #0xd00
	ldrsb r2, [r0, #0x11]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #0x13]
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _02071010 ; =_022B9044
	mov r2, #0
	strb r2, [r1, #0xd13]
	bl sub_02079940
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207100C: .word _022B8330
_02071010: .word _022B9044
	arm_func_end DseDriver_NotifyTick

	arm_func_start DseDriver_Main
DseDriver_Main: ; 0x02071014
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r8, _0207114C ; =_022B8330
	ldr r7, _02071150 ; =_022B9130
	ldr r6, _02071154 ; =DRIVER_WORK
	add r4, r8, #0xd00
	add r5, r8, #0xe00
	mov fp, #1
_02071030:
	mov r0, #0
	strb fp, [r8, #0xd13]
	bl sub_02079888
	ldrsb r0, [r5, #0xd0]
	cmp r0, #1
	bne _020710D0
	bl GetTimer0Control
	ldr r2, [r8, #0xec8]
	ldr r1, [r8, #0xecc]
	sub sl, r0, r2
	cmp r1, r2
	sub r1, r1, r2
	addlo r1, r1, #0x10000
	str r0, [r8, #0xec8]
	mov r0, r1
	bl _ffltu
	mov sb, r0
	mov r0, sl
	bl _ffltu
	mov r1, r0
	mov r0, sb
	bl _fdiv
	mov r1, r0
	ldr r0, _02071158 ; =0x42C80000
	bl _fmul
	mov sb, r0
	ldrsh r0, [r7, #0xc4]
	mov r1, sb
	cmp r0, #0
	movlt r0, #0
	strlt r0, [r8, #0xec0]
	str sb, [r8, #0xebc]
	ldr r0, [r8, #0xec0]
	bl _fls
	strlo sb, [r8, #0xec0]
	movlo r0, #0x64
	strloh r0, [r7, #0xc4]
	ldrsh r0, [r7, #0xc4]
	sub r0, r0, #1
	strh r0, [r7, #0xc4]
_020710D0:
	ldrsb r0, [r4, #0x11]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl sub_0207CD44
	ldr r0, [r6, #0x2c]
	add r0, r0, #1
	str r0, [r6, #0x2c]
	ldr r0, [r6, #0x664]
	bl UpdateSequencerTracks
	ldr r0, [r6, #0x668]
	bl UpdateSequencerTracks
	bl sub_0206FBC8
	ldr r0, _0207115C ; =_022B9584
	ldr r0, [r0]
	cmp r0, #0
	beq _02071118
	bl sub_02072BB8
_02071118:
	bl UpdateChannels
	bl DseVoice_UpdateParameters
	bl DseVoice_UpdateHardware
	bl DseVoice_Cleanup
	mov r0, #0
	bl sub_0207CF14
	ldrsb r0, [r5, #0xd0]
	cmp r0, #1
	bne _02071030
	bl GetTimer0Control
	str r0, [r8, #0xecc]
	b _02071030
_02071148:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207114C: .word _022B8330
_02071150: .word _022B9130
_02071154: .word DRIVER_WORK
_02071158: .word 0x42C80000
_0207115C: .word _022B9584
	arm_func_end DseDriver_Main

	arm_func_start DseSequence_TickNotes
DseSequence_TickNotes: ; 0x02071160
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, [r0, #0x24]
	ldrb r0, [r1, #1]
	add r7, r1, #0x10
	str r0, [sp]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov fp, #0
	mvn r6, #0
	mov r5, fp
_02071188:
	ldr r8, [r7, #0xb8]
	add sl, r7, #0xb8
	cmp r8, #0
	beq _02071200
	ldr r4, _02071220 ; =DRIVER_WORK
_0207119C:
	ldmib r8, {r0, sb}
	sub r1, r0, #1
	cmp r1, #0
	bgt _020711E0
	ldrb r0, [r7, #4]
	tst r0, #3
	movne r1, fp
	bne _020711E0
	mov r0, r7
	mov r1, r8
	bl DseVoice_ReleaseNote
	ldr r0, [r4, #0x650]
	mov r1, r6
	str r0, [r8, #8]
	str r8, [r4, #0x650]
	str r6, [r8, #4]
	strb r5, [r8, #1]
_020711E0:
	str r1, [r8, #4]
	cmp r1, #0
	strge r1, [r8, #4]
	strge r8, [sl]
	addge sl, r8, #8
	mov r8, sb
	cmp sb, #0
	bne _0207119C
_02071200:
	mov r0, #0
	str r0, [sl]
	ldr r0, [sp]
	add r7, r7, #0xc8
	subs r0, r0, #1
	str r0, [sp]
	bne _02071188
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02071220: .word DRIVER_WORK
	arm_func_end DseSequence_TickNotes

	arm_func_start ParseDseEvent
ParseDseEvent: ; 0x02071224
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r1
	ldr r1, [r6, #0xc]
	mov r7, r0
	cmp r1, #0
	ldr r5, [r6, #0x1c]
	ldr r4, [r6, #0x54]
	bne _020713C4
_02071248:
	ldrb r3, [r5]
	add r0, r5, #1
	mov r5, r0
	cmp r3, #0x80
	blo _020712A0
	cmp r3, #0x90
	blo _02071288
	ldr r2, _020713DC ; =SMD_EVENTS_FUN_TABLE
	mov r1, r7
	add r2, r2, r3, lsl #2
	ldr r5, [r2, #-0x240]
	mov r2, r6
	mov r3, r4
	blx r5
	mov r5, r0
	b _020713AC
_02071288:
	ldr r0, _020713E0 ; =_020B0B7C
	add r0, r0, r3
	ldrb r0, [r0, #-0x80]
	str r0, [r6, #0x10]
	str r0, [r6, #0xc]
	b _020713AC
_020712A0:
	strb r3, [sp, #3]
	ldrb r1, [r0]
	ldrb r5, [r6, #4]
	mov r3, #0xc
	mov r2, r1, lsl #0x14
	mov r2, r2, asr #0x18
	and r2, r2, #3
	sub r2, r2, #2
	mov r2, r2, lsl #0x18
	add r2, r5, r2, asr #24
	mov r2, r2, lsl #0x18
	mov r5, r2, asr #0x18
	and r2, r1, #0xf
	smlabb r2, r5, r3, r2
	strb r2, [sp, #2]
	mov r1, r1, asr #6
	strb r5, [r6, #4]
	ands r1, r1, #0xff
	add r5, r0, #1
	ldreq r3, [r6, #0x14]
	beq _02071318
	cmp r1, #0
	mov r3, #0
	beq _02071314
_02071300:
	ldrb r0, [r5], #1
	sub r1, r1, #1
	ands r1, r1, #0xff
	add r3, r0, r3, lsl #8
	bne _02071300
_02071314:
	str r3, [r6, #0x14]
_02071318:
	ldrb r2, [r6, #5]
	mov r1, #0
	ldr r0, _020713E4 ; =0x02040811
	mul r2, r3, r2
	umull r0, r3, r2, r0
	sub r0, r2, r3
	add r3, r3, r0, lsr #1
	mov r3, r3, lsr #6
	str r3, [sp, #4]
	strb r1, [sp]
	ldrsb r0, [r6, #8]
	cmp r0, #0
	bne _02071398
	ldrb r0, [r4, #4]
	add r1, sp, #0
	tst r0, #2
	beq _0207136C
	ldrb r2, [r6, #7]
	mov r0, r4
	bl DseChannel_ChangeNote
	b _02071398
_0207136C:
	mov r0, r4
	bl DseChannel_ReleaseNote
	mov r2, #0
	add r1, sp, #0
	mov r0, r4
	str r2, [r4, #0x1c]
	bl DseChannel_AllocateNote
	movs r1, r0
	beq _02071398
	mov r0, r4
	bl DseVoice_PlayNote
_02071398:
	ldrb r0, [sp, #2]
	strb r0, [r6, #7]
	ldrb r0, [r4, #4]
	bic r0, r0, #2
	strb r0, [r4, #4]
_020713AC:
	ldrsb r0, [r6, #2]
	cmp r0, #0
	beq _020713C4
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _02071248
_020713C4:
	ldr r0, [r6, #0xc]
	sub r0, r0, #1
	str r0, [r6, #0xc]
	str r5, [r6, #0x1c]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020713DC: .word SMD_EVENTS_FUN_TABLE
_020713E0: .word _020B0B7C
_020713E4: .word 0x02040811
	arm_func_end ParseDseEvent

	arm_func_start UpdateSequencerTracks
UpdateSequencerTracks: ; 0x020713E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	cmpne sl, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020713F8:
	ldrsb r0, [sl, #5]
	cmp r0, #1
	bne _0207176C
	ldrsh r0, [sl, #0x1a]
	cmp r0, #0
	beq _0207141C
	subgt r0, r0, #1
	strgth r0, [sl, #0x1a]
	b _0207176C
_0207141C:
	ldr r0, [sl, #0x34]
	add r0, r0, #1
	str r0, [sl, #0x34]
	ldrb r0, [sl, #0xc]
	cmp r0, #0
	beq _0207143C
	mov r0, sl
	bl DseSequence_TickFades
_0207143C:
	ldr r1, [sl, #0x3c]
	ldr r0, [sl, #0x40]
	add r1, r1, r0
	str r1, [sl, #0x3c]
	ldr r0, [sl, #0x44]
	cmp r1, r0
	ble _020716B0
	mov r6, #0
	ldr r7, _0207177C ; =0x04000208
	ldr fp, _02071780 ; =0x82061029
	mov r5, r6
	mov r4, r6
_0207146C:
	mov r0, sl
	bl DseSequence_TickNotes
	ldr r2, [sl, #0x24]
	ldrb r0, [r2, #1]
	add r1, r2, #0x10
	cmp r0, #0
	beq _0207162C
_02071488:
	ldrh r3, [r1, #0x28]
	sub r0, r0, #1
	cmp r3, #0
	beq _0207150C
	sub r3, r3, #1
	strh r3, [r1, #0x28]
	ldrh r3, [r1, #0x28]
	cmp r3, #0
	ldreq r3, [r1, #0x24]
	beq _020714BC
	ldr r8, [r1, #0x1c]
	ldr r3, [r1, #0x20]
	add r3, r8, r3
_020714BC:
	str r3, [r1, #0x1c]
	ldrsh r3, [r1, #0x54]
	ldr r8, [r1, #0x1c]
	ldrsh sb, [r2, #4]
	add r3, r3, r8, asr #16
	add r3, sb, r3
	strh r3, [r1, #0x16]
	ldrh r3, [r7]
	strh r6, [r7]
	ldr sb, [r1, #0xb4]
	cmp sb, #0
	beq _02071504
_020714EC:
	ldrh r8, [sb, #6]
	orr r8, r8, #0x10
	strh r8, [sb, #6]
	ldr sb, [sb, #0x154]
	cmp sb, #0
	bne _020714EC
_02071504:
	ldrh r8, [r7]
	strh r3, [r7]
_0207150C:
	ldrh r3, [r1, #0x38]
	cmp r3, #0
	beq _020715A0
	sub r3, r3, #1
	strh r3, [r1, #0x38]
	ldrh r3, [r1, #0x38]
	cmp r3, #0
	ldreq r3, [r1, #0x34]
	beq _0207153C
	ldr r8, [r1, #0x2c]
	ldr r3, [r1, #0x30]
	add r3, r8, r3
_0207153C:
	str r3, [r1, #0x2c]
	ldr r8, [r1, #0x2c]
	ldrb r3, [r1, #0x50]
	mov r8, r8, asr #0x10
	ldrsb sb, [r2, #8]
	mul r3, r8, r3
	mul r8, sb, r3
	smull r3, sb, fp, r8
	add sb, r8, sb
	mov r3, r8, lsr #0x1f
	add sb, r3, sb, asr #13
	strh sb, [r1, #0x18]
	ldrh r3, [r7]
	strh r5, [r7]
	ldr sb, [r1, #0xb4]
	cmp sb, #0
	beq _02071598
_02071580:
	ldrh r8, [sb, #6]
	orr r8, r8, #0x20
	strh r8, [sb, #6]
	ldr sb, [sb, #0x154]
	cmp sb, #0
	bne _02071580
_02071598:
	ldrh r8, [r7]
	strh r3, [r7]
_020715A0:
	ldrh r3, [r1, #0x48]
	cmp r3, #0
	beq _02071620
	sub r3, r3, #1
	strh r3, [r1, #0x48]
	ldrh r3, [r1, #0x48]
	cmp r3, #0
	ldreq r3, [r1, #0x44]
	beq _020715D0
	ldr r8, [r1, #0x3c]
	ldr r3, [r1, #0x40]
	add r3, r8, r3
_020715D0:
	str r3, [r1, #0x3c]
	ldr r3, [r1, #0xc4]
	ldr r8, [r1, #0x3c]
	ldrsb r3, [r3, #7]
	sub r3, r3, #0x40
	add r3, r3, r8, asr #16
	strh r3, [r1, #0x1a]
	ldrh r3, [r7]
	strh r4, [r7]
	ldr sb, [r1, #0xb4]
	cmp sb, #0
	beq _02071618
_02071600:
	ldrh r8, [sb, #6]
	orr r8, r8, #0x40
	strh r8, [sb, #6]
	ldr sb, [sb, #0x154]
	cmp sb, #0
	bne _02071600
_02071618:
	ldrh r8, [r7]
	strh r3, [r7]
_02071620:
	cmp r0, #0
	add r1, r1, #0xc8
	bne _02071488
_0207162C:
	mov r0, #0
	strb r0, [sl, #0xd]
	ldrb r0, [sl, #0xf]
	mov sb, #0
	add r8, sl, #0xa8
	cmp r0, #0
	ble _02071688
_02071648:
	ldrsb r0, [r8, #2]
	cmp r0, #1
	bne _02071674
	mov r0, sl
	mov r1, r8
	bl ParseDseEvent
	ldrsb r0, [r8, #2]
	cmp r0, #1
	ldreqb r0, [sl, #0xd]
	addeq r0, r0, #1
	streqb r0, [sl, #0xd]
_02071674:
	ldrb r0, [sl, #0xf]
	add sb, sb, #1
	add r8, r8, #0x5c
	cmp sb, r0
	blt _02071648
_02071688:
	ldr r0, [sl, #0x38]
	add r0, r0, #1
	str r0, [sl, #0x38]
	ldr r1, [sl, #0x3c]
	ldr r0, [sl, #0x44]
	sub r1, r1, r0
	str r1, [sl, #0x3c]
	ldr r0, [sl, #0x44]
	cmp r1, r0
	bgt _0207146C
_020716B0:
	ldrb r0, [sl, #0xd]
	cmp r0, #0
	bne _020716E8
	mov r0, #0
	str r0, [sl, #4]
	ldr r0, [sl, #0x24]
	bl DseSynth_ClearHeldNotes
	ldr r0, [sl, #0x28]
	ldr r3, [sl, #0xa0]
	ldr r4, [sl, #0x9c]
	mov r1, #1
	mov r2, #0
	blx r4
	b _0207176C
_020716E8:
	ldrsb r1, [sl, #7]
	cmp r1, #0
	beq _0207176C
	ldr r0, [sl, #0x68]
	cmp r0, #0
	bne _0207176C
	cmp r1, #1
	bne _02071744
	mov r0, #0
	str r0, [sl, #4]
	ldr r0, [sl, #0x24]
	bl DseSynth_StopChannels
	ldr r0, [sl, #0x28]
	ldr r3, [sl, #0xa0]
	ldr r4, [sl, #0x9c]
	mov r1, #2
	mov r2, #0
	blx r4
	ldrsb r0, [sl, #0xa]
	cmp r0, #1
	moveq r0, #0
	streqb r0, [sl, #0xd]
	b _0207176C
_02071744:
	mov r1, #1
	strb r1, [sl, #6]
	ldr r0, [sl, #0x24]
	bl DseSynth_ResetAllVoiceTimersAndVolumes
	ldr r0, [sl, #0x28]
	ldr r3, [sl, #0xa0]
	ldr r4, [sl, #0x9c]
	mov r1, #3
	mov r2, #0
	blx r4
_0207176C:
	ldr sl, [sl, #0xa4]
	cmp sl, #0
	bne _020713F8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207177C: .word 0x04000208
_02071780: .word 0x82061029
	arm_func_end UpdateSequencerTracks

	arm_func_start DseSequence_TickFades
DseSequence_TickFades: ; 0x02071784
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #0x54]
	cmp r0, #0
	beq _020717F8
	sub r0, r0, #1
	strh r0, [r4, #0x54]
	ldrh r0, [r4, #0x54]
	cmp r0, #0
	ldreq r0, [r4, #0x50]
	beq _020717BC
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	add r0, r1, r0
_020717BC:
	str r0, [r4, #0x48]
	ldr r1, [r4, #0x48]
	ldrb r0, [r4, #0x17]
	mov r1, r1, asr #0x10
	mul r0, r1, r0
	movs r1, r0, lsr #8
	ldr r0, _02071918 ; =0x03938700
	moveq r1, #1
	bl _u32_div_f
	str r0, [r4, #0x44]
	ldrh r0, [r4, #0x54]
	cmp r0, #0
	ldreqb r0, [r4, #0xc]
	biceq r0, r0, #1
	streqb r0, [r4, #0xc]
_020717F8:
	ldrh r0, [r4, #0x64]
	cmp r0, #0
	beq _02071858
	sub r0, r0, #1
	strh r0, [r4, #0x64]
	ldrh r0, [r4, #0x64]
	cmp r0, #0
	ldreq r0, [r4, #0x60]
	beq _02071828
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	add r0, r1, r0
_02071828:
	str r0, [r4, #0x58]
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x24]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl DseSynth_SetBend
	ldrh r0, [r4, #0x64]
	cmp r0, #0
	ldreqb r0, [r4, #0xc]
	biceq r0, r0, #2
	streqb r0, [r4, #0xc]
_02071858:
	ldrh r0, [r4, #0x74]
	cmp r0, #0
	beq _020718B8
	sub r0, r0, #1
	strh r0, [r4, #0x74]
	ldrh r0, [r4, #0x74]
	cmp r0, #0
	ldreq r0, [r4, #0x70]
	beq _02071888
	ldr r1, [r4, #0x68]
	ldr r0, [r4, #0x6c]
	add r0, r1, r0
_02071888:
	str r0, [r4, #0x68]
	ldr r1, [r4, #0x68]
	ldr r0, [r4, #0x24]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	bl DseSynth_SetVolume
	ldrh r0, [r4, #0x74]
	cmp r0, #0
	ldreqb r0, [r4, #0xc]
	biceq r0, r0, #4
	streqb r0, [r4, #0xc]
_020718B8:
	ldrh r0, [r4, #0x84]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r0, #1
	strh r0, [r4, #0x84]
	ldrh r0, [r4, #0x84]
	cmp r0, #0
	ldreq r0, [r4, #0x80]
	beq _020718E8
	ldr r1, [r4, #0x78]
	ldr r0, [r4, #0x7c]
	add r0, r1, r0
_020718E8:
	str r0, [r4, #0x78]
	ldr r1, [r4, #0x78]
	ldr r0, [r4, #0x24]
	mov r1, r1, asr #0x10
	and r1, r1, #0xff
	bl DseSynth_SetPan
	ldrh r0, [r4, #0x84]
	cmp r0, #0
	ldreqb r0, [r4, #0xc]
	biceq r0, r0, #0x10
	streqb r0, [r4, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071918: .word 0x03938700
	arm_func_end DseSequence_TickFades

	arm_func_start DseTrackEvent_Invalid
DseTrackEvent_Invalid: ; 0x0207191C
	mov r1, #0
	strb r1, [r2, #2]
	bx lr
	arm_func_end DseTrackEvent_Invalid

	arm_func_start DseTrackEvent_WaitSame
DseTrackEvent_WaitSame: ; 0x02071928
	ldr r1, [r2, #0x10]
	str r1, [r2, #0xc]
	bx lr
	arm_func_end DseTrackEvent_WaitSame

	arm_func_start DseTrackEvent_WaitDelta
DseTrackEvent_WaitDelta: ; 0x02071934
	ldrsb r1, [r0], #1
	ldr r3, [r2, #0x10]
	add r1, r3, r1
	str r1, [r2, #0x10]
	str r1, [r2, #0xc]
	bx lr
	arm_func_end DseTrackEvent_WaitDelta

	arm_func_start DseTrackEvent_Wait8
DseTrackEvent_Wait8: ; 0x0207194C
	ldrb r1, [r0], #1
	str r1, [r2, #0x10]
	str r1, [r2, #0xc]
	bx lr
	arm_func_end DseTrackEvent_Wait8

	arm_func_start DseTrackEvent_Wait16
DseTrackEvent_Wait16: ; 0x0207195C
	ldrb r3, [r0]
	ldrb r1, [r0, #1]
	add r0, r0, #2
	add r1, r3, r1, lsl #8
	str r1, [r2, #0x10]
	str r1, [r2, #0xc]
	bx lr
	arm_func_end DseTrackEvent_Wait16

	arm_func_start DseTrackEvent_Wait24
DseTrackEvent_Wait24: ; 0x02071978
	ldrb r3, [r0]
	ldrb r1, [r0, #1]
	ldrb ip, [r0, #2]
	add r0, r0, #3
	add r1, r3, r1, lsl #8
	add r1, r1, ip, lsl #16
	str r1, [r2, #0x10]
	str r1, [r2, #0xc]
	bx lr
	arm_func_end DseTrackEvent_Wait24

	arm_func_start DseTrackEvent_WaitUntilFadeout
DseTrackEvent_WaitUntilFadeout: ; 0x0207199C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r3
	mov r4, r2
	bl DseVoice_CountNumActiveInChannel
	cmp r0, #0
	ldrgtb r0, [r5], #-1
	addle r5, r5, #1
	strgt r0, [r4, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_WaitUntilFadeout

	arm_func_start DseTrackEvent_EndTrack
DseTrackEvent_EndTrack: ; 0x020719C8
	stmdb sp!, {r4, lr}
	ldr ip, [r2, #0x20]
	mov r4, r0
	cmp ip, #0
	bne _020719F4
	mov r1, #0
	mov r0, r3
	strb r1, [r2, #2]
	sub r4, r4, #1
	bl DseChannel_DeallocateVoices
	b _02071A0C
_020719F4:
	ldrh r3, [r2, #0xa]
	mov r0, #1
	add r3, r3, #1
	strh r3, [r2, #0xa]
	strb r0, [r1, #3]
	ldr r4, [r2, #0x20]
_02071A0C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_EndTrack

	arm_func_start DseTrackEvent_MainLoopBegin
DseTrackEvent_MainLoopBegin: ; 0x02071A14
	str r0, [r2, #0x20]
	bx lr
	arm_func_end DseTrackEvent_MainLoopBegin

	arm_func_start DseTrackEvent_SubLoopBegin
DseTrackEvent_SubLoopBegin: ; 0x02071A1C
	stmdb sp!, {r4, lr}
	ldrb r4, [r2, #6]
	mov r1, #0xc
	ldrb lr, [r0], #1
	smulbb r1, r4, r1
	add r3, r2, #0x24
	str r0, [r3, r1]
	add ip, r3, r1
	mov r1, #0
	str r1, [ip, #4]
	strb lr, [ip, #8]
	ldrb r3, [r2, #4]
	add r1, r4, #1
	strb r3, [ip, #9]
	strb r1, [r2, #6]
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SubLoopBegin

	arm_func_start DseTrackEvent_SubLoopEnd
DseTrackEvent_SubLoopEnd: ; 0x02071A5C
	ldrb ip, [r2, #6]
	add r3, r2, #0x24
	mov r1, #0xc
	sub ip, ip, #1
	mla r3, ip, r1, r3
	ldrb r1, [r3, #8]
	subs r1, r1, #1
	streqb ip, [r2, #6]
	bxeq lr
	str r0, [r3, #4]
	strb r1, [r3, #8]
	ldrb r0, [r3, #9]
	strb r0, [r2, #4]
	ldr r0, [r3]
	bx lr
	arm_func_end DseTrackEvent_SubLoopEnd

	arm_func_start DseTrackEvent_SubLoopBreakOnLastIteration
DseTrackEvent_SubLoopBreakOnLastIteration: ; 0x02071A98
	ldrb ip, [r2, #6]
	add r3, r2, #0x24
	mov r1, #0xc
	sub ip, ip, #1
	mla r3, ip, r1, r3
	ldrb r1, [r3, #8]
	subs r1, r1, #1
	ldreq r0, [r3, #4]
	streqb ip, [r2, #6]
	bx lr
	arm_func_end DseTrackEvent_SubLoopBreakOnLastIteration

	arm_func_start DseTrackEvent_SetOctave
DseTrackEvent_SetOctave: ; 0x02071AC0
	ldrb r1, [r0], #1
	strb r1, [r2, #4]
	bx lr
	arm_func_end DseTrackEvent_SetOctave

	arm_func_start DseTrackEvent_OctaveDelta
DseTrackEvent_OctaveDelta: ; 0x02071ACC
	ldrb r3, [r2, #4]
	ldrsb r1, [r0], #1
	add r1, r3, r1
	strb r1, [r2, #4]
	bx lr
	arm_func_end DseTrackEvent_OctaveDelta

	arm_func_start DseTrackEvent_SetBpm
DseTrackEvent_SetBpm: ; 0x02071AE0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r0, [r5, #0x48]
	ldrb r4, [r6]
	mov r0, r0, asr #0x10
	mul r1, r0, r4
	movs r1, r1, lsr #8
	ldr r0, _02071B1C ; =0x03938700
	moveq r1, #1
	bl _u32_div_f
	str r0, [r5, #0x44]
	strb r4, [r5, #0x17]
	add r0, r6, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02071B1C: .word 0x03938700
	arm_func_end DseTrackEvent_SetBpm

	arm_func_start DseTrackEvent_SetBpm2
DseTrackEvent_SetBpm2: ; 0x02071B20
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r0, [r5, #0x48]
	ldrb r4, [r6]
	mov r0, r0, asr #0x10
	mul r1, r0, r4
	movs r1, r1, lsr #8
	ldr r0, _02071B5C ; =0x03938700
	moveq r1, #1
	bl _u32_div_f
	str r0, [r5, #0x44]
	strb r4, [r5, #0x17]
	add r0, r6, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02071B5C: .word 0x03938700
	arm_func_end DseTrackEvent_SetBpm2

	arm_func_start DseTrackEvent_SetBank
DseTrackEvent_SetBank: ; 0x02071B60
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	ldrb r1, [r4, #1]
	mov r0, r3
	add r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DseChannel_SetBank
	add r0, r4, #2
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetBank

	arm_func_start DseTrackEvent_SetBankMsb
DseTrackEvent_SetBankMsb: ; 0x02071B8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r1, [r3, #0xe]
	ldrb r2, [r4]
	mov r0, r3
	and r1, r1, #0xff
	add r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DseChannel_SetBank
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetBankMsb

	arm_func_start DseTrackEvent_SetBankLsb
DseTrackEvent_SetBankLsb: ; 0x02071BBC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r2, [r3, #0xe]
	ldrb r1, [r4]
	mov r0, r3
	bic r2, r2, #0xff
	add r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DseChannel_SetBank
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetBankLsb

	arm_func_start DseTrackEvent_Dummy1Byte
DseTrackEvent_Dummy1Byte: ; 0x02071BEC
	add r0, r0, #1
	bx lr
	arm_func_end DseTrackEvent_Dummy1Byte

	arm_func_start DseTrackEvent_SetInstrument
DseTrackEvent_SetInstrument: ; 0x02071BF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r3
	ldrb r1, [r6]
	mov r0, r4
	bl DseChannel_SetInstrument
	movs r2, r0
	bpl _02071C34
	ldrh r1, [r4, #0xe]
	ldr r0, [r5, #0x28]
	ldr r3, [r5, #0xa0]
	ldr ip, [r5, #0x9c]
	rsb r2, r2, r1, lsl #16
	mvn r1, #0xcb
	blx ip
_02071C34:
	add r0, r6, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseTrackEvent_SetInstrument

	arm_func_start DseTrackEvent_SongVolumeFade
DseTrackEvent_SongVolumeFade: ; 0x02071C3C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrb r2, [r5]
	ldrb r0, [r5, #1]
	mov r4, r1
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	movs r1, r0, lsr #0x10
	moveq r6, #0
	beq _02071C84
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _02071CC4 ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _u32_div_f
	mov r0, r0, lsl #0x10
	movs r6, r0, lsr #0x10
	moveq r6, #1
_02071C84:
	ldrb r0, [r5, #2]
	cmp r6, #0
	mov r1, r0, lsl #0x10
	str r1, [r4, #0x70]
	streq r1, [r4, #0x68]
	beq _02071CB8
	ldr r0, [r4, #0x68]
	subs r0, r1, r0
	moveq r6, #0
	beq _02071CB8
	mov r1, r6
	bl _s32_div_f
	str r0, [r4, #0x6c]
_02071CB8:
	strh r6, [r4, #0x74]
	add r0, r5, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02071CC4: .word DRIVER_WORK
	arm_func_end DseTrackEvent_SongVolumeFade

	arm_func_start DseTrackEvent_RestoreEnvelopeDefaults
DseTrackEvent_RestoreEnvelopeDefaults: ; 0x02071CC8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r3, #0x64
	bl SoundEnvelopeParameters_Reset
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_RestoreEnvelopeDefaults

	arm_func_start DseTrackEvent_SetEnvelopeAttackBegin
DseTrackEvent_SetEnvelopeAttackBegin: ; 0x02071CE0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x6c]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeAttackBegin

	arm_func_start DseTrackEvent_SetEnvelopeAttackTime
DseTrackEvent_SetEnvelopeAttackTime: ; 0x02071D00
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x6d]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeAttackTime

	arm_func_start DseTrackEvent_SetEnvelopeHoldTime
DseTrackEvent_SetEnvelopeHoldTime: ; 0x02071D20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x70]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeHoldTime

	arm_func_start DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel
DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel: ; 0x02071D40
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	strneb r0, [r3, #0x6e]
	ldrb r0, [r4, #1]
	cmp r0, #0xff
	strneb r0, [r3, #0x6f]
	add r0, r3, #0x64
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #2
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel

	arm_func_start DseTrackEvent_SetEnvelopeSustainTime
DseTrackEvent_SetEnvelopeSustainTime: ; 0x02071D70
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x71]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeSustainTime

	arm_func_start DseTrackEvent_SetEnvelopeReleaseTime
DseTrackEvent_SetEnvelopeReleaseTime: ; 0x02071D90
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x72]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeReleaseTime

	arm_func_start DseTrackEvent_SetNoteDurationMultiplier
DseTrackEvent_SetNoteDurationMultiplier: ; 0x02071DB0
	ldrb r1, [r0], #1
	strb r1, [r2, #5]
	bx lr
	arm_func_end DseTrackEvent_SetNoteDurationMultiplier

	arm_func_start DseTrackEvent_ForceLfoEnvelopeLevel
DseTrackEvent_ForceLfoEnvelopeLevel: ; 0x02071DBC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r1, [r4]
	mov r0, r3
	bl DseChannel_SetLfoConstEnvelopeLevel
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_ForceLfoEnvelopeLevel

	arm_func_start DseTrackEvent_SetHoldNotes
DseTrackEvent_SetHoldNotes: ; 0x02071DD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	ldr r0, [r2, #0x54]
	cmp r1, #0x40
	ldrb r1, [r0, #4]
	orrhs r1, r1, #1
	strhsb r1, [r0, #4]
	bhs _02071E08
	bic r1, r1, #1
	strb r1, [r0, #4]
	bl DseVoice_ReleaseHeld
_02071E08:
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetHoldNotes

	arm_func_start DseTrackEvent_SetFlagBit1Unknown
DseTrackEvent_SetFlagBit1Unknown: ; 0x02071E10
	ldrb r1, [r3, #4]
	orr r1, r1, #2
	strb r1, [r3, #4]
	bx lr
	arm_func_end DseTrackEvent_SetFlagBit1Unknown

	arm_func_start DseTrackEvent_SetOptionalVolume
DseTrackEvent_SetOptionalVolume: ; 0x02071E20
	ldrb r1, [r0], #1
	strb r1, [r3, #0x58]
	bx lr
	arm_func_end DseTrackEvent_SetOptionalVolume

	arm_func_start DseTrackEvent_Dummy2Bytes
DseTrackEvent_Dummy2Bytes: ; 0x02071E2C
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_Dummy2Bytes

	arm_func_start DseTrackEvent_SetTuning
DseTrackEvent_SetTuning: ; 0x02071E34
	stmdb sp!, {r4, lr}
	ldrsb r1, [r0]
	ldr ip, _02071EB0 ; =0x04000208
	mov r2, #0
	mov r1, r1, lsl #0x18
	mov r4, r1, asr #0x10
	strh r4, [r3, #0x54]
	ldr lr, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh lr, [lr, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, r4, r1, asr #16
	add r1, lr, r1
	strh r1, [r3, #0x16]
	ldrh r4, [ip]
	strh r2, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02071E9C
_02071E84:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02071E84
_02071E9C:
	ldr r2, _02071EB0 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071EB0: .word 0x04000208
	arm_func_end DseTrackEvent_SetTuning

	arm_func_start DseTrackEvent_TuningDeltaCoarse
DseTrackEvent_TuningDeltaCoarse: ; 0x02071EB4
	stmdb sp!, {r4, lr}
	ldrsb r4, [r0]
	ldrsh r1, [r3, #0x54]
	ldr ip, _02071F38 ; =0x04000208
	mov r2, #0
	add r1, r1, r4, lsl #8
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	strh r4, [r3, #0x54]
	ldr lr, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh lr, [lr, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, r4, r1, asr #16
	add r1, lr, r1
	strh r1, [r3, #0x16]
	ldrh r4, [ip]
	strh r2, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02071F24
_02071F0C:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02071F0C
_02071F24:
	ldr r2, _02071F38 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071F38: .word 0x04000208
	arm_func_end DseTrackEvent_TuningDeltaCoarse

	arm_func_start DseTrackEvent_TuningDeltaFine
DseTrackEvent_TuningDeltaFine: ; 0x02071F3C
	stmdb sp!, {r4, lr}
	ldrsb r4, [r0]
	ldrsh r1, [r3, #0x54]
	ldr ip, _02071FC0 ; =0x04000208
	mov r2, #0
	add r1, r1, r4, lsl #2
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	strh r4, [r3, #0x54]
	ldr lr, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh lr, [lr, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, r4, r1, asr #16
	add r1, lr, r1
	strh r1, [r3, #0x16]
	ldrh r4, [ip]
	strh r2, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02071FAC
_02071F94:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02071F94
_02071FAC:
	ldr r2, _02071FC0 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071FC0: .word 0x04000208
	arm_func_end DseTrackEvent_TuningDeltaFine

	arm_func_start DseTrackEvent_TuningDeltaFull
DseTrackEvent_TuningDeltaFull: ; 0x02071FC4
	stmdb sp!, {r3, lr}
	ldrb ip, [r0]
	ldrb r1, [r0, #1]
	ldrsh lr, [r3, #0x54]
	ldr r2, _02072050 ; =0x04000208
	add r1, ip, r1, lsl #8
	add r1, lr, r1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
	strh lr, [r3, #0x54]
	ldr ip, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh ip, [ip, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, lr, r1, asr #16
	add r1, ip, r1
	strh r1, [r3, #0x16]
	ldrh ip, [r2]
	mov r1, #0
	strh r1, [r2]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _0207203C
_02072024:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02072024
_0207203C:
	ldr r2, _02072050 ; =0x04000208
	add r0, r0, #2
	ldrh r1, [r2]
	strh ip, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02072050: .word 0x04000208
	arm_func_end DseTrackEvent_TuningDeltaFull

	arm_func_start DseTrackEvent_TuningFade
DseTrackEvent_TuningFade: ; 0x02072054
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r3
	ldrb r1, [r6, #4]
	ldrb r4, [r7]
	ldrb r0, [r7, #1]
	tst r1, #2
	ldrb r2, [r7, #2]
	add r0, r4, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	ldr r4, [r6, #0xc4]
	moveq r1, #0
	streq r1, [r6, #0x1c]
	ldr r1, [r6, #0x1c]
	mov r0, r2, lsl #0x18
	mov r1, r1, asr #0x10
	add r0, r1, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r0, lsl #0x10
	str r1, [r6, #0x24]
	cmp r5, #0
	streq r1, [r6, #0x1c]
	beq _020720D4
	ldr r0, [r6, #0x1c]
	subs r0, r1, r0
	moveq r5, #0
	beq _020720D4
	mov r1, r5
	bl _s32_div_f
	str r0, [r6, #0x20]
_020720D4:
	strh r5, [r6, #0x28]
	ldr r0, [r6, #0x1c]
	ldrsh r1, [r6, #0x54]
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	ldrsh r2, [r4, #4]
	add r0, r1, r0, lsr #16
	ldr r1, _02072140 ; =0x04000208
	add r0, r2, r0
	strh r0, [r6, #0x16]
	ldrh r3, [r1]
	mov r0, #0
	strh r0, [r1]
	ldr r1, [r6, #0xb4]
	cmp r1, #0
	beq _0207212C
_02072114:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x10
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072114
_0207212C:
	ldr r2, _02072140 ; =0x04000208
	add r0, r7, #3
	ldrh r1, [r2]
	strh r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02072140: .word 0x04000208
	arm_func_end DseTrackEvent_TuningFade

	arm_func_start DseTrackEvent_SetNoteRandomRegion
DseTrackEvent_SetNoteRandomRegion: ; 0x02072144
	ldrb r1, [r0]
	ldrb ip, [r0, #1]
	add r0, r0, #2
	mov r2, r1
	cmp r1, ip
	movhi r2, ip
	movhi ip, r1
	strb r2, [r3, #0xc]
	strb ip, [r3, #0xd]
	bx lr
	arm_func_end DseTrackEvent_SetNoteRandomRegion

	arm_func_start DseTrackEvent_SetTuningJitterAmplitude
DseTrackEvent_SetTuningJitterAmplitude: ; 0x0207216C
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r0, r0, #2
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xa]
	bx lr
	arm_func_end DseTrackEvent_SetTuningJitterAmplitude

	arm_func_start DseTrackEvent_SetKeyBend
DseTrackEvent_SetKeyBend: ; 0x02072184
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	ldrb r1, [r4, #1]
	mov r0, r3
	add r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl DseChannel_SetKeyBend
	add r0, r4, #2
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetKeyBend

	arm_func_start DseTrackEvent_SetUnknown2
DseTrackEvent_SetUnknown2: ; 0x020721B0
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r0, r0, #2
	add r1, r1, r2, lsl #8
	strh r1, [r3, #0x56]
	bx lr
	arm_func_end DseTrackEvent_SetUnknown2

	arm_func_start DseTrackEvent_SetKeyBendRange
DseTrackEvent_SetKeyBendRange: ; 0x020721C8
	ldrb r1, [r0], #1
	strb r1, [r3, #0x59]
	bx lr
	arm_func_end DseTrackEvent_SetKeyBendRange

	arm_func_start DseTrackEvent_SetupKeyBendLfo
DseTrackEvent_SetupKeyBendLfo: ; 0x020721D4
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r4, [r0, #1]
	ldrb lr, [r0, #2]
	ldrb ip, [r0, #3]
	ldrb r2, [r0, #4]
	mov r1, #1
	add r4, r5, r4, lsl #8
	strb r1, [r3, #0x75]
	strb r1, [r3, #0x76]
	mov r1, r4, lsl #0x10
	strb r2, [r3, #0x77]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x78]
	add r1, lr, ip, lsl #8
	strh r1, [r3, #0x7c]
	mov r1, #0
	strh r1, [r3, #0x7e]
	strh r1, [r3, #0x80]
	strb r1, [r3, #0x82]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupKeyBendLfo

	arm_func_start DseTrackEvent_SetupKeyBendLfoEnvelope
DseTrackEvent_SetupKeyBendLfoEnvelope: ; 0x0207222C
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x7e]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x80]
	bx lr
	arm_func_end DseTrackEvent_SetupKeyBendLfoEnvelope

	arm_func_start DseTrackEvent_UseKeyBendLfo
DseTrackEvent_UseKeyBendLfo: ; 0x02072254
	ldrb r1, [r0]
	add r0, r0, #1
	cmp r1, #2
	moveq r1, #1
	strb r1, [r3, #0x75]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strb r1, [r3, #0x76]
	bx lr
	arm_func_end DseTrackEvent_UseKeyBendLfo

	arm_func_start DseTrackEvent_SetVolume
DseTrackEvent_SetVolume: ; 0x0207227C
	stmdb sp!, {r3, r4, r5, lr}
	ldrsb r4, [r0]
	mov r5, #0
	ldr r2, _02072308 ; =0x82061029
	mov r1, r4, lsl #0x10
	str r1, [r3, #0x34]
	str r1, [r3, #0x2c]
	strh r5, [r3, #0x38]
	ldr ip, [r3, #0xc4]
	ldrb r1, [r3, #0x50]
	ldrsb lr, [ip, #8]
	ldr ip, _0207230C ; =0x04000208
	smulbb r1, r4, r1
	mul r4, lr, r1
	smull r1, lr, r2, r4
	add lr, r4, lr
	mov r1, r4, lsr #0x1f
	add lr, r1, lr, asr #13
	strh lr, [r3, #0x18]
	ldrh r4, [ip]
	strh r5, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020722F4
_020722DC:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x20
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _020722DC
_020722F4:
	ldr r2, _0207230C ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02072308: .word 0x82061029
_0207230C: .word 0x04000208
	arm_func_end DseTrackEvent_SetVolume

	arm_func_start DseTrackEvent_VolumeDelta
DseTrackEvent_VolumeDelta: ; 0x02072310
	stmdb sp!, {r3, r4, r5, lr}
	ldrsb r2, [r0]
	ldr r1, [r3, #0x2c]
	add r4, r2, r1, asr #16
	cmp r4, #0x7f
	movgt r4, #0x7f
	bgt _02072334
	cmp r4, #0
	movlt r4, #0
_02072334:
	mov r1, r4, lsl #0x10
	str r1, [r3, #0x34]
	str r1, [r3, #0x2c]
	mov r5, #0
	strh r5, [r3, #0x38]
	ldrb r1, [r3, #0x50]
	ldr ip, [r3, #0xc4]
	ldr r2, _020723B8 ; =0x82061029
	mul r1, r4, r1
	ldrsb lr, [ip, #8]
	ldr ip, _020723BC ; =0x04000208
	mul r4, lr, r1
	smull r1, lr, r2, r4
	add lr, r4, lr
	mov r1, r4, lsr #0x1f
	add lr, r1, lr, asr #13
	strh lr, [r3, #0x18]
	ldrh r4, [ip]
	strh r5, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020723A4
_0207238C:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x20
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _0207238C
_020723A4:
	ldr r2, _020723BC ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020723B8: .word 0x82061029
_020723BC: .word 0x04000208
	arm_func_end DseTrackEvent_VolumeDelta

	arm_func_start DseTrackEvent_VolumeFade
DseTrackEvent_VolumeFade: ; 0x020723C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrsb r1, [r5, #2]
	ldrb r2, [r5]
	ldrb r0, [r5, #1]
	mov r4, r3
	mov r1, r1, lsl #0x10
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	str r1, [r4, #0x34]
	movs r6, r0, lsr #0x10
	streq r1, [r4, #0x2c]
	beq _02072410
	ldr r0, [r4, #0x2c]
	subs r0, r1, r0
	moveq r6, #0
	beq _02072410
	mov r1, r6
	bl _s32_div_f
	str r0, [r4, #0x30]
_02072410:
	strh r6, [r4, #0x38]
	add r0, r5, #3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseTrackEvent_VolumeFade

	arm_func_start DseTrackEvent_SetExpression
DseTrackEvent_SetExpression: ; 0x0207241C
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r4, [r0]
	ldr r2, _020724A0 ; =0x82061029
	ldr lr, _020724A4 ; =0x04000208
	strb r4, [r3, #0x50]
	ldr r1, [r3, #0x2c]
	ldr ip, [r3, #0xc4]
	mov r1, r1, asr #0x10
	mul r4, r1, r4
	ldrsb r1, [ip, #8]
	mov ip, #0
	mul r4, r1, r4
	smull r1, r5, r2, r4
	add r5, r4, r5
	mov r1, r4, lsr #0x1f
	add r5, r1, r5, asr #13
	strh r5, [r3, #0x18]
	ldrh r4, [lr]
	strh ip, [lr]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _0207248C
_02072474:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x20
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02072474
_0207248C:
	ldr r2, _020724A4 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020724A0: .word 0x82061029
_020724A4: .word 0x04000208
	arm_func_end DseTrackEvent_SetExpression

	arm_func_start DseTrackEvent_SetupVolumeLfo
DseTrackEvent_SetupVolumeLfo: ; 0x020724A8
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r1, [r0, #1]
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb ip, [r0, #4]
	mov r2, #1
	add r1, r5, r1, lsl #8
	mov r1, r1, lsl #0x10
	strb r2, [r3, #0x85]
	mov r2, #2
	strb r2, [r3, #0x86]
	strb ip, [r3, #0x87]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x88]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #0x8c]
	mov r1, #0
	strh r1, [r3, #0x8e]
	strh r1, [r3, #0x90]
	strb r1, [r3, #0x92]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupVolumeLfo

	arm_func_start DseTrackEvent_SetupVolumeLfoEnvelope
DseTrackEvent_SetupVolumeLfoEnvelope: ; 0x02072504
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x8e]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x90]
	bx lr
	arm_func_end DseTrackEvent_SetupVolumeLfoEnvelope

	arm_func_start DseTrackEvent_UseVolumeLfo
DseTrackEvent_UseVolumeLfo: ; 0x0207252C
	ldrb r1, [r0]
	add r0, r0, #1
	cmp r1, #2
	moveq r1, #1
	strb r1, [r3, #0x85]
	cmp r1, #0
	moveq r1, #0
	movne r1, #2
	strb r1, [r3, #0x86]
	bx lr
	arm_func_end DseTrackEvent_UseVolumeLfo

	arm_func_start DseTrackEvent_SetPan
DseTrackEvent_SetPan: ; 0x02072554
	stmdb sp!, {r3, lr}
	ldrb lr, [r0]
	mov ip, #0
	cmp lr, #0x7f
	movgt lr, #0x7f
	mov r1, lr, lsl #0x10
	str r1, [r3, #0x44]
	str r1, [r3, #0x3c]
	strh ip, [r3, #0x48]
	ldr r2, [r3, #0xc4]
	ldr r1, _020725D0 ; =0x04000208
	ldrsb r2, [r2, #7]
	sub r2, r2, #0x40
	add r2, lr, r2
	strh r2, [r3, #0x1a]
	ldrh lr, [r1]
	strh ip, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020725BC
_020725A4:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x40
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _020725A4
_020725BC:
	ldr r2, _020725D0 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh lr, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020725D0: .word 0x04000208
	arm_func_end DseTrackEvent_SetPan

	arm_func_start DseTrackEvent_PanDelta
DseTrackEvent_PanDelta: ; 0x020725D4
	stmdb sp!, {r3, lr}
	ldrsb r2, [r0]
	ldr r1, [r3, #0x3c]
	add lr, r2, r1, asr #16
	cmp lr, #0x7f
	movgt lr, #0x7f
	bgt _020725F8
	cmp lr, #0
	movlt lr, #0
_020725F8:
	mov r1, lr, lsl #0x10
	str r1, [r3, #0x44]
	str r1, [r3, #0x3c]
	mov ip, #0
	strh ip, [r3, #0x48]
	ldr r2, [r3, #0xc4]
	ldr r1, _02072664 ; =0x04000208
	ldrsb r2, [r2, #7]
	sub r2, r2, #0x40
	add r2, lr, r2
	strh r2, [r3, #0x1a]
	ldrh lr, [r1]
	strh ip, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02072650
_02072638:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x40
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02072638
_02072650:
	ldr r2, _02072664 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh lr, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02072664: .word 0x04000208
	arm_func_end DseTrackEvent_PanDelta

	arm_func_start DseTrackEvent_PanFade
DseTrackEvent_PanFade: ; 0x02072668
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrsb r1, [r5, #2]
	ldrb r2, [r5]
	ldrb r0, [r5, #1]
	mov r4, r3
	mov r1, r1, lsl #0x10
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	str r1, [r4, #0x44]
	movs r6, r0, lsr #0x10
	streq r1, [r4, #0x3c]
	beq _020726B8
	ldr r0, [r4, #0x3c]
	subs r0, r1, r0
	moveq r6, #0
	beq _020726B8
	mov r1, r6
	bl _s32_div_f
	str r0, [r4, #0x40]
_020726B8:
	strh r6, [r4, #0x48]
	add r0, r5, #3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseTrackEvent_PanFade

	arm_func_start DseTrackEvent_SetupPanLfo
DseTrackEvent_SetupPanLfo: ; 0x020726C4
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r1, [r0, #1]
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb ip, [r0, #4]
	mov r2, #1
	add r1, r5, r1, lsl #8
	mov r1, r1, lsl #0x10
	strb r2, [r3, #0x95]
	mov r2, #3
	strb r2, [r3, #0x96]
	strb ip, [r3, #0x97]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x98]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #0x9c]
	mov r1, #0
	strh r1, [r3, #0x9e]
	strh r1, [r3, #0xa0]
	strb r1, [r3, #0xa2]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupPanLfo

	arm_func_start DseTrackEvent_SetupPanLfoEnvelope
DseTrackEvent_SetupPanLfoEnvelope: ; 0x02072720
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x9e]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xa0]
	bx lr
	arm_func_end DseTrackEvent_SetupPanLfoEnvelope

	arm_func_start DseTrackEvent_UsePanLfo
DseTrackEvent_UsePanLfo: ; 0x02072748
	ldrb r1, [r0]
	add r0, r0, #1
	cmp r1, #2
	moveq r1, #1
	strb r1, [r3, #0x95]
	cmp r1, #0
	moveq r1, #0
	movne r1, #3
	strb r1, [r3, #0x96]
	bx lr
	arm_func_end DseTrackEvent_UsePanLfo

	arm_func_start DseTrackEvent_SetupLfo
DseTrackEvent_SetupLfo: ; 0x02072770
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb ip, [r3, #0x61]
	add r3, r3, #0x74
	add r1, r2, r1, lsl #8
	mov r1, r1, lsl #0x10
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb r2, [r0, #4]
	add r3, r3, ip, lsl #4
	mov r1, r1, asr #0x10
	strb r2, [r3, #3]
	str r1, [r3, #4]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #8]
	mov r1, #0
	strh r1, [r3, #0xa]
	strh r1, [r3, #0xc]
	strb r1, [r3, #0xe]
	add r0, r0, #5
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetupLfo

	arm_func_start DseTrackEvent_SetupLfoEnvelope
DseTrackEvent_SetupLfoEnvelope: ; 0x020727C8
	ldrb ip, [r3, #0x61]
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r3, r3, #0x74
	add r3, r3, ip, lsl #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xa]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xc]
	bx lr
	arm_func_end DseTrackEvent_SetupLfoEnvelope

	arm_func_start DseTrackEvent_SetLfoParameter
DseTrackEvent_SetLfoParameter: ; 0x020727FC
	ldrb r1, [r3, #0x61]
	ldrb ip, [r0]
	add r2, r3, #0x74
	add r1, r2, r1, lsl #4
	ldrb r2, [r0, #1]
	cmp ip, #0xa
	addls pc, pc, ip, lsl #2
	b _02072930
_0207281C: ; jump table
	b _02072930 ; case 0
	b _02072848 ; case 1
	b _02072850 ; case 2
	b _02072858 ; case 3
	b _02072860 ; case 4
	b _02072868 ; case 5
	b _020728E0 ; case 6
	b _020728EC ; case 7
	b _020728FC ; case 8
	b _02072910 ; case 9
	b _02072924 ; case 10
_02072848:
	strb r2, [r3, #0x61]
	b _02072930
_02072850:
	strb r2, [r1, #1]
	b _02072930
_02072858:
	strb r2, [r1, #2]
	b _02072930
_02072860:
	strb r2, [r1, #3]
	b _02072930
_02072868:
	ldrb r3, [r1, #2]
	cmp r3, #4
	addls pc, pc, r3, lsl #2
	b _020728CC
_02072878: ; jump table
	b _020728CC ; case 0
	b _0207288C ; case 1
	b _0207289C ; case 2
	b _020728AC ; case 3
	b _020728BC ; case 4
_0207288C:
	mov r3, #0xa
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_0207289C:
	mvn r3, #0x13
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728AC:
	mov r3, #0x14
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728BC:
	mov r3, #0xa
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728CC:
	mov r3, #0x14
	mul r3, r2, r3
	mov r2, r3
_020728D8:
	str r2, [r1, #4]
	b _02072930
_020728E0:
	add r2, r2, r2, lsl #2
	strh r2, [r1, #8]
	b _02072930
_020728EC:
	mov r3, #0x14
	mul r3, r2, r3
	strh r3, [r1, #0xa]
	b _02072930
_020728FC:
	ldrh r3, [r1, #0xa]
	and r3, r3, #0xff00
	orr r2, r3, r2
	strh r2, [r1, #0xa]
	b _02072930
_02072910:
	ldrh r3, [r1, #0xa]
	and r3, r3, #0xff
	orr r2, r3, r2, lsl #8
	strh r2, [r1, #0xa]
	b _02072930
_02072924:
	mov r3, #0x14
	mul r3, r2, r3
	strh r3, [r1, #0xc]
_02072930:
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_SetLfoParameter

	arm_func_start DseTrackEvent_UseLfo
DseTrackEvent_UseLfo: ; 0x02072938
	stmdb sp!, {r3, lr}
	ldrb ip, [r0, #1]
	ldrb r2, [r0]
	ldrb lr, [r0, #2]
	add r1, r3, #0x74
	cmp ip, #2
	strb r2, [r3, #0x61]
	add r1, r1, r2, lsl #4
	moveq ip, #1
	strb ip, [r1, #1]
	strb lr, [r1, #2]
	add r0, r0, #3
	ldmia sp!, {r3, pc}
	arm_func_end DseTrackEvent_UseLfo

	arm_func_start DseTrackEvent_Signal
DseTrackEvent_Signal: ; 0x0207296C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	mov ip, r1
	mov r1, #8
	strb r2, [ip, #0x16]
	ldr r0, [ip, #0x28]
	ldr r3, [ip, #0xa0]
	ldr ip, [ip, #0x9c]
	blx ip
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_Signal

	arm_func_start DseTrackEvent_Dummy2Bytes2
DseTrackEvent_Dummy2Bytes2: ; 0x0207299C
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_Dummy2Bytes2

	arm_func_start sub_020729A4
sub_020729A4: ; 0x020729A4
	ldr r0, _020729B4 ; =_022B9584
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_020729B4: .word _022B9584
	arm_func_end sub_020729A4

	arm_func_start sub_020729B8
sub_020729B8: ; 0x020729B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr sb, _02072BB4 ; =_022B9584
	ldr r8, [sb]
	ldrb r6, [r8, #0x86]
	cmp r6, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r5, [r8, #0x85]
	mov r1, #0
	cmp r6, #0
	str r1, [sp]
	beq _02072B98
	mov fp, #3
	mov r1, #2
	mov r2, r1
	mov r3, fp
	mov ip, r1
	mov lr, fp
	mov r4, fp
_02072A04:
	ldrb sl, [r8, #0x88]
	add r7, r8, r5
	add r5, r5, #1
	sub r6, r6, #1
	and r5, r5, #0xff
	cmp r5, #0x80
	moveq r5, #0
	ldrb r7, [r7, #4]
	and r6, r6, #0xff
	cmp sl, #0
	bne _02072B28
	tst r7, #0x80
	bne _02072A4C
	add sl, sl, #1
	strb sl, [r8, #0x88]
	ldr r8, [sb]
	strb r7, [r8, #0x8c]
	b _02072B30
_02072A4C:
	and sl, r7, #0xf0
	strb sl, [r8, #0x8a]
	and r8, r7, #0xf
	ldr r7, [sb]
	strb r8, [r7, #0x8b]
	ldr r7, [sb]
	ldrb r8, [r7, #0x8a]
	cmp r8, #0xc0
	bgt _02072AA8
	bge _02072AF8
	cmp r8, #0x90
	bgt _02072A8C
	bge _02072AE0
	cmp r8, #0x80
	beq _02072AD8
	b _02072B1C
_02072A8C:
	cmp r8, #0xa0
	bgt _02072A9C
	beq _02072AE8
	b _02072B1C
_02072A9C:
	cmp r8, #0xb0
	beq _02072AF0
	b _02072B1C
_02072AA8:
	cmp r8, #0xe0
	bgt _02072AC0
	bge _02072B08
	cmp r8, #0xd0
	beq _02072B00
	b _02072B1C
_02072AC0:
	cmp r8, #0xf0
	bgt _02072AD0
	beq _02072B10
	b _02072B1C
_02072AD0:
	cmp r8, #0xff
	b _02072B1C
_02072AD8:
	strb r4, [r7, #0x87]
	b _02072B30
_02072AE0:
	strb lr, [r7, #0x87]
	b _02072B30
_02072AE8:
	strb ip, [r7, #0x87]
	b _02072B30
_02072AF0:
	strb r3, [r7, #0x87]
	b _02072B30
_02072AF8:
	strb r2, [r7, #0x87]
	b _02072B30
_02072B00:
	strb r1, [r7, #0x87]
	b _02072B30
_02072B08:
	strb fp, [r7, #0x87]
	b _02072B30
_02072B10:
	mov r8, #3
	strb r8, [r7, #0x87]
	b _02072B30
_02072B1C:
	mov r8, #0
	strb r8, [r7, #0x87]
	b _02072B30
_02072B28:
	add r8, r8, sl
	strb r7, [r8, #0x8b]
_02072B30:
	ldr r7, [sb]
	ldrb r8, [r7, #0x88]
	add r8, r8, #1
	strb r8, [r7, #0x88]
	ldr r8, [sb]
	ldrb sl, [r8, #0x88]
	ldrb r7, [r8, #0x87]
	cmp sl, r7
	bne _02072B90
	mov r2, #0
	ldr r1, _02072BB4 ; =_022B9584
	strb r2, [r8, #0x88]
	ldr r3, [r1]
	mov r1, #1
	str r1, [sp]
	ldrb r2, [r3, #0x8a]
	ldrb r1, [r3, #0x8b]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #0x8c]
	ldrb r1, [r3, #0x8d]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	b _02072B98
_02072B90:
	cmp r6, #0
	bne _02072A04
_02072B98:
	ldr r1, _02072BB4 ; =_022B9584
	ldr r0, [sp]
	ldr r2, [r1]
	strb r6, [r2, #0x86]
	ldr r1, [r1]
	strb r5, [r1, #0x85]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02072BB4: .word _022B9584
	arm_func_end sub_020729B8

	arm_func_start sub_02072BB8
sub_02072BB8: ; 0x02072BB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r0, _02072D94 ; =_022B9584
	ldr r0, [r0]
	ldr r4, [r0]
	cmp r4, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #8
	bl sub_020729B8
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add sb, r4, #0x10
	mov r6, #0
	ldr r4, _02072D98 ; =_020B0D50
	add r7, sp, #0
	mov r5, #1
	mov r8, r6
	mov fp, #0xc8
_02072C08:
	ldrb r1, [sp, #9]
	ldrb r0, [sp, #8]
	mla sl, r1, fp, sb
	cmp r0, #0xc0
	bgt _02072C4C
	bge _02072D4C
	cmp r0, #0x90
	bgt _02072C38
	bge _02072CC0
	cmp r0, #0x80
	beq _02072C8C
	b _02072D7C
_02072C38:
	cmp r0, #0xa0
	ble _02072D7C
	cmp r0, #0xb0
	beq _02072D2C
	b _02072D7C
_02072C4C:
	cmp r0, #0xf0
	bgt _02072C6C
	bge _02072D7C
	cmp r0, #0xd0
	ble _02072D7C
	cmp r0, #0xe0
	beq _02072D5C
	b _02072D7C
_02072C6C:
	cmp r0, #0xf7
	ble _02072D7C
	cmp r0, #0xff
	bgt _02072D7C
	cmp r0, #0xfe
	blt _02072D7C
	cmpne r0, #0xff
	b _02072D7C
_02072C8C:
	ldrb r1, [sp, #0xa]
	ldrb r0, [sp, #0xb]
	str r8, [sp, #4]
	strb r1, [sp, #2]
	strb r0, [sp, #3]
	strb r8, [sp]
	ldrb r0, [sl, #4]
	tst r0, #1
	bne _02072D7C
	mov r0, sl
	mov r1, r7
	bl DseChannel_ReleaseNoteInternal
	b _02072D7C
_02072CC0:
	ldrb r0, [sp, #0xb]
	ldrb r1, [sp, #0xa]
	str r6, [sp, #4]
	strb r0, [sp, #3]
	strb r1, [sp, #2]
	tst r0, #0xff
	beq _02072D0C
	mov r0, sl
	mov r1, r7
	strb r5, [sp]
	bl DseChannel_ReleaseNote
	mov r0, sl
	mov r1, r7
	bl DseChannel_AllocateNote
	movs r1, r0
	beq _02072D7C
	mov r0, sl
	bl DseVoice_PlayNote
	b _02072D7C
_02072D0C:
	strb r6, [sp]
	ldrb r0, [sl, #4]
	tst r0, #1
	bne _02072D7C
	mov r0, sl
	mov r1, r7
	bl DseChannel_ReleaseNoteInternal
	b _02072D7C
_02072D2C:
	ldrb r0, [sp, #0xa]
	ldr r2, [r4, r0, lsl #2]
	cmp r2, #0
	beq _02072D7C
	ldrb r1, [sp, #0xb]
	mov r0, sl
	blx r2
	b _02072D7C
_02072D4C:
	ldrb r1, [sp, #0xa]
	mov r0, sl
	bl DseChannel_SetInstrument
	b _02072D7C
_02072D5C:
	ldrb r2, [sp, #0xa]
	ldrb r1, [sp, #0xb]
	mov r0, sl
	add r1, r2, r1, lsl #7
	sub r1, r1, #0x2000
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl DseChannel_SetKeyBend
_02072D7C:
	add r0, sp, #8
	bl sub_020729B8
	cmp r0, #0
	bne _02072C08
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02072D94: .word _022B9584
_02072D98: .word _020B0D50
	arm_func_end sub_02072BB8

	arm_func_start sub_02072D9C
sub_02072D9C: ; 0x02072D9C
	ldrh r2, [r0, #0xe]
	ldr ip, _02072DB8 ; =DseChannel_SetBank
	and r2, r2, #0xff
	add r1, r2, r1, lsl #8
	strh r1, [r0, #0xe]
	ldrh r1, [r0, #0xe]
	bx ip
	.align 2, 0
_02072DB8: .word DseChannel_SetBank
	arm_func_end sub_02072D9C

	arm_func_start sub_02072DBC
sub_02072DBC: ; 0x02072DBC
	ldrh r2, [r0, #0xe]
	ldr ip, _02072DD8 ; =DseChannel_SetBank
	bic r2, r2, #0xff
	add r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_02072DD8: .word DseChannel_SetBank
	arm_func_end sub_02072DBC

	arm_func_start sub_02072DDC
sub_02072DDC: ; 0x02072DDC
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	ldr ip, _02072DF0 ; =DseChannel_SetLfoConstEnvelopeLevel
	strb r1, [r0, #0x51]
	bx ip
	.align 2, 0
_02072DF0: .word DseChannel_SetLfoConstEnvelopeLevel
	arm_func_end sub_02072DDC

	arm_func_start sub_02072DF4
sub_02072DF4: ; 0x02072DF4
	mov r2, #0xa
	mul r2, r1, r2
	strh r2, [r0, #0x56]
	bx lr
	arm_func_end sub_02072DF4

	arm_func_start sub_02072E04
sub_02072E04: ; 0x02072E04
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	str r2, [r0, #0x34]
	str r2, [r0, #0x2c]
	mov r4, #0
	strh r4, [r0, #0x38]
	ldrb r3, [r0, #0x50]
	ldr lr, [r0, #0xc4]
	ldr r2, _02072E88 ; =0x82061029
	mul ip, r1, r3
	ldrsb r1, [lr, #8]
	ldr r3, _02072E8C ; =0x04000208
	mul ip, r1, ip
	smull r1, lr, r2, ip
	add lr, ip, lr
	mov r1, ip, lsr #0x1f
	add lr, r1, lr, asr #13
	strh lr, [r0, #0x18]
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r1, [r0, #0xb4]
	cmp r1, #0
	beq _02072E78
_02072E60:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x20
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072E60
_02072E78:
	ldr r1, _02072E8C ; =0x04000208
	ldrh r0, [r1]
	strh r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02072E88: .word 0x82061029
_02072E8C: .word 0x04000208
	arm_func_end sub_02072E04

	arm_func_start sub_02072E90
sub_02072E90: ; 0x02072E90
	mov r1, r1, lsl #0x10
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	mov r2, #0
	ldr r1, _02072EE4 ; =0x04000208
	strh r2, [r0, #0x48]
	ldrh r3, [r1]
	strh r2, [r1]
	ldr r1, [r0, #0xb4]
	cmp r1, #0
	beq _02072ED4
_02072EBC:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x40
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072EBC
_02072ED4:
	ldr r1, _02072EE4 ; =0x04000208
	ldrh r0, [r1]
	strh r3, [r1]
	bx lr
	.align 2, 0
_02072EE4: .word 0x04000208
	arm_func_end sub_02072E90

	arm_func_start sub_02072EE8
sub_02072EE8: ; 0x02072EE8
	ldr r2, _02072F30 ; =0x04000208
	strb r1, [r0, #0x50]
	ldrh r3, [r2]
	mov r1, #0
	strh r1, [r2]
	ldr r1, [r0, #0xb4]
	cmp r1, #0
	beq _02072F20
_02072F08:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x20
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072F08
_02072F20:
	ldr r1, _02072F30 ; =0x04000208
	ldrh r0, [r1]
	strh r3, [r1]
	bx lr
	.align 2, 0
_02072F30: .word 0x04000208
	arm_func_end sub_02072EE8

	arm_func_start sub_02072F34
sub_02072F34: ; 0x02072F34
	strb r1, [r0, #0x58]
	bx lr
	arm_func_end sub_02072F34

	arm_func_start sub_02072F3C
sub_02072F3C: ; 0x02072F3C
	stmdb sp!, {r3, lr}
	cmp r1, #0x40
	ldrb r1, [r0, #4]
	orrhs r1, r1, #1
	strhsb r1, [r0, #4]
	ldmhsia sp!, {r3, pc}
	bic r1, r1, #1
	strb r1, [r0, #4]
	bl DseVoice_ReleaseHeld
	ldmia sp!, {r3, pc}
	arm_func_end sub_02072F3C

	arm_func_start sub_02072F64
sub_02072F64: ; 0x02072F64
	bx lr
	arm_func_end sub_02072F64

	arm_func_start sub_02072F68
sub_02072F68: ; 0x02072F68
	bx lr
	arm_func_end sub_02072F68

	arm_func_start sub_02072F6C
sub_02072F6C: ; 0x02072F6C
	bx lr
	arm_func_end sub_02072F6C

	arm_func_start sub_02072F70
sub_02072F70: ; 0x02072F70
	bx lr
	arm_func_end sub_02072F70

	arm_func_start sub_02072F74
sub_02072F74: ; 0x02072F74
	strb r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x60]
	bx lr
	arm_func_end sub_02072F74

	arm_func_start sub_02072F84
sub_02072F84: ; 0x02072F84
	strb r1, [r0, #0x5a]
	mov r1, #0
	strb r1, [r0, #0x60]
	bx lr
	arm_func_end sub_02072F84

	arm_func_start sub_02072F94
sub_02072F94: ; 0x02072F94
	strb r1, [r0, #0x5b]
	mov r1, #0
	strb r1, [r0, #0x60]
	bx lr
	arm_func_end sub_02072F94

	arm_func_start sub_02072FA4
sub_02072FA4: ; 0x02072FA4
	bx lr
	arm_func_end sub_02072FA4

	arm_func_start sub_02072FA8
sub_02072FA8: ; 0x02072FA8
	bx lr
	arm_func_end sub_02072FA8

	arm_func_start sub_02072FAC
sub_02072FAC: ; 0x02072FAC
	stmdb sp!, {r3, lr}
	ldr r0, _02072FD4 ; =_022B9584
	ldr r0, [r0]
	ldr r0, [r0]
	bl DseSynth_StopChannels
	ldr r0, _02072FD4 ; =_022B9584
	ldr r0, [r0]
	ldr r0, [r0]
	bl DseSynth_ClearHeldNotes
	ldmia sp!, {r3, pc}
	.align 2, 0
_02072FD4: .word _022B9584
	arm_func_end sub_02072FAC

	arm_func_start sub_02072FD8
sub_02072FD8: ; 0x02072FD8
	ldr r0, _02072FF4 ; =_022B9584
	mov r1, #0
	ldr r0, [r0]
	ldr ip, _02072FF8 ; =DseSynth_SetBankAndSequence
	mov r2, r1
	ldr r0, [r0]
	bx ip
	.align 2, 0
_02072FF4: .word _022B9584
_02072FF8: .word DseSynth_SetBankAndSequence
	arm_func_end sub_02072FD8

	arm_func_start sub_02072FFC
sub_02072FFC: ; 0x02072FFC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl DseChannel_DeallocateVoices
	ldr r1, _02073074 ; =0x04000208
	mov r0, #0
	ldrh r5, [r1]
	strh r0, [r1]
	ldr lr, [r4, #0xb8]
	cmp lr, #0
	ldreqh r0, [r1]
	streqh r5, [r1]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, lr
	mvn r1, #0
	mov r3, r0
_02073038:
	str r1, [lr, #4]
	strb r3, [ip, #1]
	ldr r0, [ip, #8]
	cmp r0, #0
	movne ip, r0
	bne _02073038
	ldr r0, _02073078 ; =DRIVER_WORK
	ldr r1, _02073074 ; =0x04000208
	ldr r2, [r0, #0x650]
	str r2, [ip, #8]
	str lr, [r0, #0x650]
	str r3, [r4, #0xb8]
	ldrh r0, [r1]
	strh r5, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073074: .word 0x04000208
_02073078: .word DRIVER_WORK
	arm_func_end sub_02072FFC

	arm_func_start sub_0207307C
sub_0207307C: ; 0x0207307C
	mov r1, #0
	strb r1, [r0, #7]
	bx lr
	arm_func_end sub_0207307C

	arm_func_start sub_02073088
sub_02073088: ; 0x02073088
	mov r1, #1
	strb r1, [r0, #7]
	bx lr
	arm_func_end sub_02073088

	arm_func_start sub_02073094
sub_02073094: ; 0x02073094
	ldr ip, _020730A4 ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x72]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730A4: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_02073094

	arm_func_start sub_020730A8
sub_020730A8: ; 0x020730A8
	ldr ip, _020730B8 ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x6d]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730B8: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_020730A8

	arm_func_start sub_020730BC
sub_020730BC: ; 0x020730BC
	ldr ip, _020730CC ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x6e]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730CC: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_020730BC

	arm_func_start sub_020730D0
sub_020730D0: ; 0x020730D0
	ldr ip, _020730E0 ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x71]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730E0: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_020730D0

	arm_func_start sub_020730E4
sub_020730E4: ; 0x020730E4
	ldrb r2, [r0, #0x61]
	add r1, r1, r1, lsl #2
	add r0, r0, r2, lsl #4
	strh r1, [r0, #0x7c]
	bx lr
	arm_func_end sub_020730E4

	arm_func_start sub_020730F8
sub_020730F8: ; 0x020730F8
	and r3, r1, #2
	add r2, r0, #0x74
	strb r3, [r0, #0x61]
	add r2, r2, r3, lsl #4
	mov r0, r1, asr #2
	strb r0, [r2, #1]
	add r0, r3, #1
	strb r0, [r2, #2]
	bx lr
	arm_func_end sub_020730F8

	arm_func_start sub_0207311C
sub_0207311C: ; 0x0207311C
	ldrb r2, [r0, #0x61]
	add r0, r0, r2, lsl #4
	strb r1, [r0, #0x77]
	bx lr
	arm_func_end sub_0207311C

	arm_func_start sub_0207312C
sub_0207312C: ; 0x0207312C
	ldrb r2, [r0, #0x61]
	add r0, r0, #0x74
	add r0, r0, r2, lsl #4
	ldrb r2, [r0, #2]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _020731AC
_02073148: ; jump table
	b _020731AC ; case 0
	b _0207315C ; case 1
	b _02073170 ; case 2
	b _02073184 ; case 3
	b _02073198 ; case 4
_0207315C:
	mov r2, #0xa
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_02073170:
	mvn r2, #0x13
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_02073184:
	mov r2, #0x14
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_02073198:
	mov r2, #0xa
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_020731AC:
	mov r2, #0x14
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
_020731BC:
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_0207312C

	arm_func_start sub_020731C4
sub_020731C4: ; 0x020731C4
	mov r2, #0x14
	mul r2, r1, r2
	ldrb r1, [r0, #0x61]
	add r0, r0, r1, lsl #4
	strh r2, [r0, #0x7e]
	bx lr
	arm_func_end sub_020731C4

	arm_func_start sub_020731DC
sub_020731DC: ; 0x020731DC
	mov r2, #0x14
	mul r2, r1, r2
	ldrb r1, [r0, #0x61]
	add r0, r0, r1, lsl #4
	strh r2, [r0, #0x80]
	bx lr
	arm_func_end sub_020731DC

	arm_func_start sub_020731F4
sub_020731F4: ; 0x020731F4
	strb r1, [r0, #0x59]
	bx lr
	arm_func_end sub_020731F4

	arm_func_start sub_020731FC
sub_020731FC: ; 0x020731FC
	bx lr
	arm_func_end sub_020731FC

	arm_func_start sub_02073200
sub_02073200: ; 0x02073200
	bx lr
	arm_func_end sub_02073200

	arm_func_start sub_02073204
sub_02073204: ; 0x02073204
	bx lr
	arm_func_end sub_02073204

	arm_func_start DseSynth_Reset
DseSynth_Reset: ; 0x02073208
	stmdb sp!, {r4, lr}
	ldr r1, _02073274 ; =DRIVER_WORK
	mov r2, #1
	ldrsb r3, [r1, #0x41]
	mov r4, #0
	mov r1, #0x7f
	strb r3, [r0, #2]
	strb r2, [r0, #3]
	strh r4, [r0, #4]
	strb r1, [r0, #6]
	mov r1, #0x40
	strb r1, [r0, #7]
	ldrb ip, [r0, #2]
	ldrsb r1, [r0, #6]
	ldr r2, _02073278 ; =0x81020409
	ldr r3, _0207327C ; =_022B7A30
	smulbb ip, ip, r1
	smull r1, lr, r2, ip
	add lr, ip, lr
	mov r1, ip, lsr #0x1f
	add lr, r1, lr, asr #6
	strb lr, [r0, #8]
	strb r4, [r0, #9]
	strb r4, [r0, #0xa]
	ldrh r1, [r3, #0x2e]
	strb r1, [r0, #0xb]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02073274: .word DRIVER_WORK
_02073278: .word 0x81020409
_0207327C: .word _022B7A30
	arm_func_end DseSynth_Reset

	arm_func_start DseSynth_AllocateNew
DseSynth_AllocateNew: ; 0x02073280
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0xc8
	mul r0, r5, r0
	mov r2, r1
	add r0, r0, #0x10
	mov r1, #0x10
	bl DseMem_Allocate
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	strb r1, [r4]
	strb r5, [r4, #1]
	str r1, [r4, #0xc]
	bl DseSynth_Reset
	cmp r5, #0
	add r1, r4, #0x10
	mov r2, #0
	ble _02073300
	mov r0, r2
_020732D4:
	str r0, [r1]
	strb r2, [r1, #5]
	str r0, [r1, #0xb4]
	str r0, [r1, #0xb8]
	str r0, [r1, #0xbc]
	str r0, [r1, #0xc0]
	add r2, r2, #1
	str r4, [r1, #0xc4]
	cmp r2, r5
	add r1, r1, #0xc8
	blt _020732D4
_02073300:
	ldr r1, _02073348 ; =0x04000208
	mov r0, #0
	ldrh r3, [r1]
	ldr r2, _0207334C ; =_022B7988
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	beq _02073330
_02073320:
	add r2, r0, #0xc
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _02073320
_02073330:
	ldr r1, _02073348 ; =0x04000208
	str r4, [r2]
	ldrh r0, [r1]
	mov r0, r4
	strh r3, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073348: .word 0x04000208
_0207334C: .word _022B7988
	arm_func_end DseSynth_AllocateNew

	arm_func_start DseSynth_Unload
DseSynth_Unload: ; 0x02073350
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl DseSynth_StopChannels
	ldr r2, _020733B4 ; =0x04000208
	mov r0, r5
	ldrh r4, [r2]
	mov r1, #0
	strh r1, [r2]
	bl DseSynth_ClearHeldNotes
	ldr r1, _020733B8 ; =_022B7988
	b _02073380
_0207337C:
	add r1, r0, #0xc
_02073380:
	ldr r0, [r1]
	cmp r0, #0
	cmpne r0, r5
	bne _0207337C
	cmp r0, r5
	ldreq r0, [r5, #0xc]
	ldr r2, _020733B4 ; =0x04000208
	streq r0, [r1]
	ldrh r1, [r2]
	mov r0, r5
	strh r4, [r2]
	bl DseMem_Free
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020733B4: .word 0x04000208
_020733B8: .word _022B7988
	arm_func_end DseSynth_Unload

	arm_func_start DseSynth_ClearHeldNotes
DseSynth_ClearHeldNotes: ; 0x020733BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrb r3, [r0, #1]
	add r1, r0, #0x10
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r7, _02073450 ; =0x04000208
	ldr ip, _02073454 ; =DRIVER_WORK
	mvn r5, #0
	mov r4, r2
	mov r6, r2
_020733E8:
	ldrh r3, [r7]
	strh r6, [r7]
	ldr sb, [r1, #0xb8]
	cmp sb, #0
	ldreqh lr, [r7]
	streqh r3, [r7]
	beq _02073438
	mov r8, sb
_02073408:
	str r5, [sb, #4]
	strb r4, [r8, #1]
	ldr lr, [r8, #8]
	cmp lr, #0
	movne r8, lr
	bne _02073408
	ldr lr, [ip, #0x650]
	str lr, [r8, #8]
	str sb, [ip, #0x650]
	str r4, [r1, #0xb8]
	ldrh lr, [r7]
	strh r3, [r7]
_02073438:
	ldrb r3, [r0, #1]
	add r2, r2, #1
	add r1, r1, #0xc8
	cmp r2, r3
	blt _020733E8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02073450: .word 0x04000208
_02073454: .word DRIVER_WORK
	arm_func_end DseSynth_ClearHeldNotes

	arm_func_start DseSynth_ResetAndSetBankAndSequence
DseSynth_ResetAndSetBankAndSequence: ; 0x02073458
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl DseSynth_Reset
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl DseSynth_SetBankAndSequence
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseSynth_ResetAndSetBankAndSequence

	arm_func_start DseSynth_StopChannels
DseSynth_StopChannels: ; 0x02073480
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0, #1]
	add r4, r0, #0x10
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02073494:
	mov r0, r4
	bl DseChannel_DeallocateVoices
	subs r5, r5, #1
	add r4, r4, #0xc8
	bne _02073494
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseSynth_StopChannels

	arm_func_start DseSynth_ResetAllVoiceTimersAndVolumes
DseSynth_ResetAllVoiceTimersAndVolumes: ; 0x020734AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02073500 ; =0x04000208
	mov r2, #0
	ldrh r6, [r3]
	mov r7, r1
	add r4, r0, #0x10
	strh r2, [r3]
	strb r7, [r0, #9]
	ldrb r5, [r0, #1]
	cmp r5, #0
	beq _020734F0
_020734D8:
	mov r0, r4
	mov r1, r7
	bl DseChannel_ResetTimerAndVolumeForVoices
	subs r5, r5, #1
	add r4, r4, #0xc8
	bne _020734D8
_020734F0:
	ldr r1, _02073500 ; =0x04000208
	ldrh r0, [r1]
	strh r6, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02073500: .word 0x04000208
	arm_func_end DseSynth_ResetAllVoiceTimersAndVolumes

	arm_func_start DseSynth_RestoreHeldNotes
DseSynth_RestoreHeldNotes: ; 0x02073504
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02073568 ; =0x04000208
	ldrb r6, [r0, #1]
	ldrh r4, [r2]
	mov r1, #0
	cmp r6, #0
	strh r1, [r2]
	add r5, r0, #0x10
	beq _02073558
_02073528:
	ldr r7, [r5, #0xb8]
	cmp r7, #0
	beq _0207354C
_02073534:
	mov r0, r5
	mov r1, r7
	bl DseVoice_PlayNote
	ldr r7, [r7, #8]
	cmp r7, #0
	bne _02073534
_0207354C:
	subs r6, r6, #1
	add r5, r5, #0xc8
	bne _02073528
_02073558:
	ldr r1, _02073568 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02073568: .word 0x04000208
	arm_func_end DseSynth_RestoreHeldNotes

	arm_func_start DseSynth_SetGlobalVolumeIndex
DseSynth_SetGlobalVolumeIndex: ; 0x0207356C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _02073644 ; =_022B7370
	ldr r4, _02073648 ; =0x81020409
	ldrsb r5, [r3, r1]
	add r3, r0, #0x10
	mov ip, #0
	strb r5, [r0, #2]
	strb r1, [r0, #3]
	ldrb r5, [r0, #2]
	ldrsb r1, [r0, #6]
	smulbb r5, r5, r1
	smull r1, r6, r4, r5
	add r6, r5, r6
	mov r1, r5, lsr #0x1f
	add r6, r1, r6, asr #6
	strb r6, [r0, #8]
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r6, _0207364C ; =0x04000208
	mov r5, ip
_020735C0:
	ldr r4, [r3, #0x2c]
	ldrb r1, [r3, #0x50]
	mov r4, r4, asr #0x10
	ldrsb lr, [r0, #8]
	mul r1, r4, r1
	mul r7, lr, r1
	ldr r4, _02073650 ; =0x82061029
	mov r1, r7, lsr #0x1f
	smull lr, r8, r4, r7
	add r8, r7, r8
	add r8, r1, r8, asr #13
	strh r8, [r3, #0x18]
	cmp r2, #1
	bne _0207362C
	ldrh r7, [r6]
	strh r5, [r6]
	ldr r4, [r3, #0xb4]
	cmp r4, #0
	beq _02073624
_0207360C:
	ldrh r1, [r4, #6]
	orr r1, r1, #0x20
	strh r1, [r4, #6]
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _0207360C
_02073624:
	ldrh r1, [r6]
	strh r7, [r6]
_0207362C:
	ldrb r1, [r0, #1]
	add ip, ip, #1
	add r3, r3, #0xc8
	cmp ip, r1
	blt _020735C0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02073644: .word _022B7370
_02073648: .word 0x81020409
_0207364C: .word 0x04000208
_02073650: .word 0x82061029
	arm_func_end DseSynth_SetGlobalVolumeIndex

	arm_func_start DseSynth_SetBend
DseSynth_SetBend: ; 0x02073654
	stmdb sp!, {r3, r4, r5, lr}
	strh r1, [r0, #4]
	ldrb r3, [r0, #1]
	add r1, r0, #0x10
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr lr, _020736E4 ; =0x04000208
	mov ip, r2
_02073678:
	ldr r3, [r1, #0x1c]
	ldrsh r4, [r1, #0x54]
	mov r3, r3, asr #0x10
	mov r3, r3, lsl #0x10
	ldrsh r5, [r0, #4]
	add r3, r4, r3, asr #16
	add r3, r5, r3
	strh r3, [r1, #0x16]
	ldrh r5, [lr]
	strh ip, [lr]
	ldr r4, [r1, #0xb4]
	cmp r4, #0
	beq _020736C4
_020736AC:
	ldrh r3, [r4, #6]
	orr r3, r3, #0x10
	strh r3, [r4, #6]
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _020736AC
_020736C4:
	ldrh r3, [lr]
	add r2, r2, #1
	add r1, r1, #0xc8
	strh r5, [lr]
	ldrb r3, [r0, #1]
	cmp r2, r3
	blt _02073678
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020736E4: .word 0x04000208
	arm_func_end DseSynth_SetBend

	arm_func_start DseSynth_SetVolume
DseSynth_SetVolume: ; 0x020736E8
	stmdb sp!, {r4, r5, r6, lr}
	strb r1, [r0, #6]
	ldrb r4, [r0, #2]
	ldrsb r2, [r0, #6]
	ldr r3, _020737AC ; =0x81020409
	add r1, r0, #0x10
	smulbb r4, r4, r2
	smull r2, r5, r3, r4
	add r5, r4, r5
	mov r2, r4, lsr #0x1f
	add r5, r2, r5, asr #6
	strb r5, [r0, #8]
	ldrb r3, [r0, #1]
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r4, r5, r6, pc}
	ldr r4, _020737B0 ; =0x04000208
	ldr ip, _020737B4 ; =0x82061029
	mov lr, r2
_02073734:
	ldr r5, [r1, #0x2c]
	ldrb r3, [r1, #0x50]
	mov r5, r5, asr #0x10
	ldrsb r6, [r0, #8]
	mul r3, r5, r3
	mul r5, r6, r3
	smull r3, r6, ip, r5
	add r6, r5, r6
	mov r3, r5, lsr #0x1f
	add r6, r3, r6, asr #13
	strh r6, [r1, #0x18]
	ldrh r6, [r4]
	strh lr, [r4]
	ldr r5, [r1, #0xb4]
	cmp r5, #0
	beq _0207378C
_02073774:
	ldrh r3, [r5, #6]
	orr r3, r3, #0x20
	strh r3, [r5, #6]
	ldr r5, [r5, #0x154]
	cmp r5, #0
	bne _02073774
_0207378C:
	ldrh r3, [r4]
	add r2, r2, #1
	add r1, r1, #0xc8
	strh r6, [r4]
	ldrb r3, [r0, #1]
	cmp r2, r3
	blt _02073734
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020737AC: .word 0x81020409
_020737B0: .word 0x04000208
_020737B4: .word 0x82061029
	arm_func_end DseSynth_SetVolume

	arm_func_start DseSynth_SetPan
DseSynth_SetPan: ; 0x020737B8
	stmdb sp!, {r3, r4, r5, lr}
	strb r1, [r0, #7]
	ldrb r3, [r0, #1]
	add r1, r0, #0x10
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr lr, _02073848 ; =0x04000208
	mov ip, r2
_020737DC:
	ldr r3, [r1, #0xc4]
	ldr r4, [r1, #0x3c]
	ldrsb r3, [r3, #7]
	mov r4, r4, asr #0x10
	and r4, r4, #0xff
	sub r3, r3, #0x40
	add r3, r4, r3
	strh r3, [r1, #0x1a]
	ldrh r5, [lr]
	strh ip, [lr]
	ldr r4, [r1, #0xb4]
	cmp r4, #0
	beq _02073828
_02073810:
	ldrh r3, [r4, #6]
	orr r3, r3, #0x40
	strh r3, [r4, #6]
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _02073810
_02073828:
	ldrh r3, [lr]
	add r2, r2, #1
	add r1, r1, #0xc8
	strh r5, [lr]
	ldrb r3, [r0, #1]
	cmp r2, r3
	blt _020737DC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073848: .word 0x04000208
	arm_func_end DseSynth_SetPan

	arm_func_start DseSynth_SetBankAndSequence
DseSynth_SetBankAndSequence: ; 0x0207384C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r3, _020738D8 ; =DRIVER_WORK
	mov sl, r0
	ldrsb r6, [r3, #0x3d]
	mov r7, #0
	mov sb, r1
	strb r7, [r3, #0x3d]
	ldrb r0, [sl, #1]
	mov r8, r2
	add r5, sl, #0x10
	cmp r0, #0
	ble _020738CC
	mov r0, sb, lsl #0x10
	mov r4, r0, lsr #0x10
_02073884:
	mov r0, r5
	bl DseChannel_DeallocateVoices
	mov r0, r5
	mov r1, r8
	bl DseChannel_Init
	cmp sb, #0
	blt _020738B8
	mov r0, r5
	mov r1, r4
	bl DseChannel_SetBank
	mov r0, r5
	mov r1, r4
	bl DseChannel_SetInstrument
_020738B8:
	ldrb r0, [sl, #1]
	add r7, r7, #1
	add r5, r5, #0xc8
	cmp r7, r0
	blt _02073884
_020738CC:
	ldr r0, _020738D8 ; =DRIVER_WORK
	strb r6, [r0, #0x3d]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020738D8: .word DRIVER_WORK
	arm_func_end DseSynth_SetBankAndSequence

	arm_func_start DseChannel_Init
DseChannel_Init: ; 0x020738DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	str r1, [r4]
	mov r0, #0
	strb r0, [r4, #4]
	strb r0, [r4, #6]
	mov r1, #1
	strb r1, [r4, #7]
	ldr r1, _02073A80 ; =_022B7A30
	strb r0, [r4, #8]
	ldrh r3, [r1, #0x2e]
	ldr r1, _02073A84 ; =DRIVER_WORK
	mov r2, #0x7f
	strb r3, [r4, #9]
	strh r0, [r4, #0xa]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	add r1, r1, #0x600
	ldrsb ip, [r1, #0x74]
	ldrsb r3, [r1, #0x94]
	add r3, r3, ip, lsl #8
	strh r3, [r4, #0xe]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
	str r0, [r4, #0x1c]
	strh r0, [r4, #0x28]
	ldrsb r3, [r1, #0x7b]
	mov r3, r3, lsl #0x10
	str r3, [r4, #0x2c]
	strh r0, [r4, #0x38]
	ldrsb r3, [r1, #0x7e]
	mov r3, r3, lsl #0x10
	str r3, [r4, #0x3c]
	strh r0, [r4, #0x48]
	strh r0, [r4, #0x54]
	ldrsb r3, [r1, #0x7f]
	strb r3, [r4, #0x50]
	ldrsb r1, [r1, #0x75]
	strb r1, [r4, #0x51]
	strh r0, [r4, #0x52]
	strh r0, [r4, #0x56]
	strb r2, [r4, #0x58]
	strb r0, [r4, #0x59]
	strb r0, [r4, #0x5a]
	strb r0, [r4, #0x5b]
	strb r0, [r4, #0x5c]
	strb r0, [r4, #0x5d]
	strb r0, [r4, #0x5e]
	strb r0, [r4, #0x5f]
	strb r0, [r4, #0x60]
	mov r2, r0
_020739A8:
	add r1, r4, r0, lsl #4
	strb r2, [r1, #0x75]
	add r0, r0, #1
	strb r2, [r1, #0x76]
	cmp r0, #4
	blt _020739A8
	add r0, r4, #0x64
	bl SoundEnvelopeParameters_Reset
	mov r0, #0
	ldr r1, _02073A88 ; =0x04000208
	str r0, [r4, #0xb4]
	ldrh r5, [r1]
	strh r0, [r1]
	ldr lr, [r4, #0xb8]
	cmp lr, #0
	ldreqh r0, [r1]
	streqh r5, [r1]
	beq _02073A34
	mov ip, lr
	mvn r1, #0
	mov r3, r0
_020739FC:
	str r1, [lr, #4]
	strb r3, [ip, #1]
	ldr r0, [ip, #8]
	cmp r0, #0
	movne ip, r0
	bne _020739FC
	ldr r0, _02073A84 ; =DRIVER_WORK
	ldr r1, _02073A88 ; =0x04000208
	ldr r2, [r0, #0x650]
	str r2, [ip, #8]
	str lr, [r0, #0x650]
	str r3, [r4, #0xb8]
	ldrh r0, [r1]
	strh r5, [r1]
_02073A34:
	mov r1, #0
	str r1, [r4, #0xbc]
	ldr r0, _02073A84 ; =DRIVER_WORK
	str r1, [r4, #0xc0]
	strh r1, [r4, #0x16]
	add r0, r0, #0x600
	ldrsb r3, [r0, #0x7b]
	ldrsb r0, [r0, #0x7f]
	ldr r1, _02073A8C ; =0x82061029
	mov r2, #0x40
	smulbb r0, r3, r0
	rsb r3, r0, r0, lsl #7
	smull r0, ip, r1, r3
	add ip, r3, ip
	mov r0, r3, lsr #0x1f
	add ip, r0, ip, asr #13
	strh ip, [r4, #0x18]
	strh r2, [r4, #0x1a]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073A80: .word _022B7A30
_02073A84: .word DRIVER_WORK
_02073A88: .word 0x04000208
_02073A8C: .word 0x82061029
	arm_func_end DseChannel_Init

	arm_func_start DseChannel_DeallocateVoices
DseChannel_DeallocateVoices: ; 0x02073A90
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, [r0, #0xb4]
	mov r1, #0
	str r1, [r0, #0xb4]
	cmp r6, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r8, _02073B10 ; =_022B7A30
	mov r5, r1
	mov r4, r1
_02073AB4:
	ldr r7, [r6, #0x154]
	add r0, r6, #0x3c
	strh r5, [r6, #4]
	str r5, [r6, #0x158]
	str r5, [r6, #0x154]
	bl SoundEnvelope_Stop
	ldr r0, [r6, #0x14c]
	cmp r7, #0
	and r0, r0, #0xff
	str r0, [r6, #0x14c]
	str r4, [r6]
	strh r4, [r6, #0x18]
	ldrh r2, [r6, #0xa]
	ldrh r1, [r8, #0x32]
	mov r6, r7
	mvn r0, r2
	and r0, r1, r0
	strh r0, [r8, #0x32]
	ldrh r0, [r8, #0x36]
	orr r0, r0, r2
	strh r0, [r8, #0x36]
	bne _02073AB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02073B10: .word _022B7A30
	arm_func_end DseChannel_DeallocateVoices

	arm_func_start DseChannel_ResetTimerAndVolumeForVoices
DseChannel_ResetTimerAndVolumeForVoices: ; 0x02073B14
	cmp r1, #1
	bne _02073B5C
	ldrb r1, [r0, #4]
	orr r1, r1, #0x40
	strb r1, [r0, #4]
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	bxeq lr
	mov r1, #0
_02073B38:
	str r1, [r2, #0x13c]
	str r1, [r2, #0x140]
	ldrh r0, [r2, #6]
	orr r0, r0, #0x30
	strh r0, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02073B38
	bx lr
_02073B5C:
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	beq _02073B80
_02073B68:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x30
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02073B68
_02073B80:
	ldrb r1, [r0, #4]
	bic r1, r1, #0x40
	strb r1, [r0, #4]
	bx lr
	arm_func_end DseChannel_ResetTimerAndVolumeForVoices

	arm_func_start DseChannel_SetBank
DseChannel_SetBank: ; 0x02073B90
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	strh r1, [r4, #0xe]
	bl DseSwd_GetBankById
	str r0, [r4, #0xbc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0xc0]
	ldmeqia sp!, {r4, pc}
	ldrh r1, [r4, #0x10]
	mov r0, r4
	bl DseChannel_SetInstrument
	ldmia sp!, {r4, pc}
	arm_func_end DseChannel_SetBank

	arm_func_start DseChannel_SetInstrument
DseChannel_SetInstrument: ; 0x02073BC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	ldr r0, [r5, #0xbc]
	mov r4, r1
	cmp r0, #0
	bne _02073BF0
	mov r0, #0
	str r0, [r5, #0xc0]
	strh r0, [r5, #0x10]
	b _02073C4C
_02073BF0:
	mov r0, r4, lsl #0x10
	mov r1, r0, asr #0x10
	strh r1, [r5, #0x10]
	ldr r0, [r5, #0xbc]
	bl DseSwd_GetInstrument
	movs lr, r0
	beq _02073C48
	mov r6, #0
	strb r6, [r5, #0x59]
	add r7, lr, #0x10
	add r8, r5, #0x74
	mov ip, r6
_02073C20:
	ldrb r0, [r7, #1]
	add r6, r6, #1
	cmp r0, #0
	ldmneia r7, {r0, r1, r2, r3}
	stmneia r8, {r0, r1, r2, r3}
	streqb ip, [r8, #1]
	cmp r6, #4
	add r7, r7, #0x10
	add r8, r8, #0x10
	blt _02073C20
_02073C48:
	str lr, [r5, #0xc0]
_02073C4C:
	add r0, r5, #0x64
	bl SoundEnvelopeParameters_Reset
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DseChannel_SetInstrument

	arm_func_start DseChannel_SetLfoConstEnvelopeLevel
DseChannel_SetLfoConstEnvelopeLevel: ; 0x02073C5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	strb r5, [r0, #0x51]
	ldr r4, [r0, #0xb4]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02073C74:
	mov r1, r5
	add r0, r4, #0x5c
	bl SoundLfoBank_SetConstEnvelopes
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _02073C74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseChannel_SetLfoConstEnvelopeLevel

	arm_func_start DseChannel_SetKeyBend
DseChannel_SetKeyBend: ; 0x02073C90
	strh r1, [r0, #0x52]
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	bxeq lr
	mov r3, r1, lsl #8
_02073CA4:
	ldrb r0, [r2, #0xf]
	mul r1, r0, r3
	mov r0, r1, asr #0xc
	add r0, r1, r0, lsr #19
	mov r0, r0, asr #0xd
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #6]
	orr r0, r0, #0x10
	strh r0, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02073CA4
	bx lr
	arm_func_end DseChannel_SetKeyBend

	arm_func_start DseChannel_AllocateNote
DseChannel_AllocateNote: ; 0x02073CD8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrb r2, [r5, #0xd]
	mov r4, r1
	cmp r2, #0
	beq _02073D18
	ldrb r0, [r5, #0xc]
	sub r0, r2, r0
	add r6, r0, #1
	bl DseUtil_GetRandomNumber
	mul r1, r6, r0
	mov r0, r1, asr #0xe
	ldrb r2, [r5, #0xc]
	add r0, r1, r0, lsr #17
	add r0, r2, r0, asr #15
	strb r0, [r4, #2]
_02073D18:
	ldr r1, _02073D64 ; =DRIVER_WORK
	ldr r0, [r1, #0x650]
	cmp r0, #0
	moveq r0, #0
	ldrne r2, [r0, #8]
	strne r2, [r1, #0x650]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r3, [r4]
	ldr r2, [r4, #4]
	mov r1, #1
	str r3, [r0]
	str r2, [r0, #4]
	strb r1, [r0, #1]
	ldr r1, [r5, #0xb8]
	str r1, [r0, #8]
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02073D64: .word DRIVER_WORK
	arm_func_end DseChannel_AllocateNote

	arm_func_start DseChannel_ReleaseNoteInternal
DseChannel_ReleaseNoteInternal: ; 0x02073D68
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r4, [r7, #0xb8]
	mov r6, r1
	cmp r4, #0
	add r5, r7, #0xb8
	beq _02073DE4
	ldrb r1, [r6, #2]
_02073D88:
	ldrb r0, [r4, #2]
	cmp r0, r1
	bne _02073DD4
	ldr r8, [r7, #0xb4]
	cmp r8, #0
	beq _02073DC8
_02073DA0:
	ldrb r1, [r8, #0xd]
	ldrb r0, [r6, #2]
	cmp r1, r0
	bne _02073DBC
	mov r0, r7
	mov r1, r8
	bl DseVoice_Release
_02073DBC:
	ldr r8, [r8, #0x154]
	cmp r8, #0
	bne _02073DA0
_02073DC8:
	ldr r0, [r4, #8]
	str r0, [r5]
	b _02073DE4
_02073DD4:
	add r5, r4, #8
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _02073D88
_02073DE4:
	ldr r0, _02073E0C ; =DRIVER_WORK
	mvn r2, #0
	ldr r3, [r0, #0x650]
	mov r1, #0
	str r3, [r4, #8]
	str r4, [r0, #0x650]
	str r2, [r4, #4]
	mov r0, r4
	strb r1, [r4, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02073E0C: .word DRIVER_WORK
	arm_func_end DseChannel_ReleaseNoteInternal

	arm_func_start DseChannel_ChangeNote
DseChannel_ChangeNote: ; 0x02073E10
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb8]
	cmp r4, #0
	beq _02073E54
_02073E20:
	ldrb r3, [r4, #2]
	cmp r3, r2
	bne _02073E48
	ldr lr, [r1]
	ldr ip, [r1, #4]
	mov r3, #1
	str lr, [r4]
	str ip, [r4, #4]
	strb r3, [r4, #1]
	b _02073E54
_02073E48:
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _02073E20
_02073E54:
	ldr ip, [r0, #0xb4]
	cmp ip, #0
	ldmeqia sp!, {r4, pc}
_02073E60:
	ldrb r0, [ip, #0xd]
	cmp r0, r2
	bne _02073E90
	ldrb r0, [r1, #2]
	strb r0, [ip, #0xd]
	ldrb r3, [r1, #2]
	ldrsh r0, [ip, #0x14]
	add r0, r0, r3, lsl #8
	strh r0, [ip, #0x12]
	ldrh r0, [ip, #6]
	orr r0, r0, #0x10
	strh r0, [ip, #6]
_02073E90:
	ldr ip, [ip, #0x154]
	cmp ip, #0
	bne _02073E60
	ldmia sp!, {r4, pc}
	arm_func_end DseChannel_ChangeNote

	arm_func_start DseChannel_ReleaseNote
DseChannel_ReleaseNote: ; 0x02073EA0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb8]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r3, [r1, #2]
_02073EB4:
	ldrb r1, [r2, #2]
	cmp r1, r3
	bne _02073ECC
	mov r1, r2
	bl DseChannel_ReleaseNoteInternal
	ldmia sp!, {r3, pc}
_02073ECC:
	ldr r2, [r2, #8]
	cmp r2, #0
	bne _02073EB4
	ldmia sp!, {r3, pc}
	arm_func_end DseChannel_ReleaseNote

	arm_func_start DseVoice_PlayNote
DseVoice_PlayNote: ; 0x02073EDC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldrsh r4, [sl, #0xa]
	mov sb, r1
	cmp r4, #0
	moveq r0, #0
	streq r0, [sp]
	beq _02073F28
	bl DseUtil_GetRandomNumber
	mov r1, r4, lsl #1
	mul r2, r1, r0
	mov r0, r2, asr #0xe
	ldrsh r1, [sl, #0xa]
	add r0, r2, r0, lsr #17
	rsb r0, r1, r0, asr #15
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp]
_02073F28:
	ldr r6, [sl, #0xc0]
	cmp r6, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sl, #0xbc]
	mov r5, #0
_02073F40:
	ldrb r2, [sb, #2]
	ldrsb r3, [sb, #3]
	mov r0, r6
	mov r1, r5
	bl DseSwd_GetNextSplitInRange
	movs r5, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r3, [r5, #0x1a]
	ldrb r0, [r7, #0xc]
	ldr r2, [r7, #0x18]
	cmp r3, r0
	movge r3, #0
	add r1, r2, r3, lsl #3
	ldr r2, [r2, r3, lsl #3]
	ldr r1, [r1, #4]
	mov r0, r7
	str r2, [sp, #4]
	str r1, [sp, #8]
	ldrsh r1, [r5, #0x12]
	bl ReadWaviEntry
	movs fp, r0
	beq _02073F40
	ldrb r3, [sl, #5]
	ldrb r2, [r5, #0x1a]
	mov r0, sl
	add r1, sp, #4
	add r8, r2, r3, lsl #8
	ldrb r3, [sp, #7]
	mov r2, r8
	bl DseVoice_Allocate
	movs r4, r0
	beq _02073F40
	mov r0, #0
	strh r0, [r4, #4]
	ldr r0, [sl]
	add fp, fp, #0x10
	str r0, [r4]
	strh r8, [r4, #0x18]
	ldrsh r0, [r5, #0x12]
	add ip, r4, #0x1c
	strb r0, [r4, #0xe]
	ldmia fp!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia fp, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, [r4, #0x30]
	ldr r0, [r7, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x30]
	ldrb r0, [sb, #2]
	strb r0, [r4, #0xd]
	ldrsb r1, [r5, #0x17]
	ldrsh r0, [r5, #0x14]
	add r1, r0, r1, lsl #8
	ldr r0, [sp]
	add r0, r0, r1
	strh r0, [r4, #0x14]
	ldrb r1, [sb, #2]
	ldrsh r0, [r4, #0x14]
	add r0, r0, r1, lsl #8
	strh r0, [r4, #0x12]
	ldrb r0, [r5, #0x19]
	strb r0, [r4, #0x17]
	ldr r0, _02074144 ; =DRIVER_WORK
	ldrb r0, [r0, #0x39]
	cmp r0, #7
	bne _02074084
	ldrb r1, [sl, #0x58]
	ldrb r0, [sb, #3]
	ldrb r2, [r6, #4]
	ldrb r3, [r5, #0x18]
	smulbb r0, r1, r0
	mul r0, r2, r0
	mul r2, r3, r0
	ldr r0, _02074148 ; =0x4186143D
	smull r1, r3, r0, r2
	mov r0, r2, lsr #0x1f
	add r3, r0, r3, asr #19
	strb r3, [r4, #0x16]
	b _020740B0
_02074084:
	ldrb r1, [sb, #3]
	ldrb r0, [r6, #4]
	ldrb r2, [r5, #0x18]
	smulbb r0, r1, r0
	mul r3, r2, r0
	ldr r0, _0207414C ; =0x82061029
	smull r1, r2, r0, r3
	add r2, r3, r2
	mov r0, r3, lsr #0x1f
	add r2, r0, r2, asr #13
	strb r2, [r4, #0x16]
_020740B0:
	ldrb r2, [sl, #0x59]
	ldrsh r3, [sl, #0x52]
	add r0, r4, #0x5c
	cmp r2, #0
	ldreqb r2, [r5, #2]
	mov r3, r3, lsl #8
	add r1, sl, #0x74
	mul r8, r2, r3
	mov r3, r8, asr #0xc
	add r3, r8, r3, lsr #19
	mov r3, r3, asr #0xd
	strh r3, [r4, #0x10]
	strb r2, [r4, #0xf]
	ldrh r2, [r4, #6]
	orr r2, r2, #0xff0
	strh r2, [r4, #6]
	ldrsb r2, [sl, #0x51]
	bl SoundLfoBank_Set
	add r0, r5, #0x20
	add r8, r4, #0x3c
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	mov r0, #1
	strb r0, [r4, #0x3c]
	ldrb r0, [sl, #0x64]
	cmp r0, #0
	beq _02074128
	mov r0, r8
	add r1, sl, #0x64
	bl SoundEnvelope_SetParameters
_02074128:
	mov r1, r4
	mov r0, sl
	ldrb r2, [sp, #7]
	bl DseVoice_Start
	b _02073F40
_0207413C:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02074144: .word DRIVER_WORK
_02074148: .word 0x4186143D
_0207414C: .word 0x82061029
	arm_func_end DseVoice_PlayNote

	arm_func_start DseVoice_ReleaseNote
DseVoice_ReleaseNote: ; 0x02074150
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_02074168:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r5, #2]
	cmp r1, r0
	bne _02074184
	mov r0, r6
	mov r1, r4
	bl DseVoice_Release
_02074184:
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _02074168
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseVoice_ReleaseNote

	arm_func_start DseVoice_UpdateParameters
DseVoice_UpdateParameters: ; 0x02074194
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr fp, _0207431C ; =_022B7A30
	ldr r7, _02074320 ; =_022B7A6C
	ldrh r0, [fp, #0x2e]
	mov sb, #0
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r6, _02074324 ; =_020B1310
	ldr r5, _02074328 ; =_020B1394
	ldr r4, _0207432C ; =0x00FFB0FF
_020741BC:
	ldr r8, [r7, #0x158]
	cmp r8, #0
	beq _02074304
	ldrh sl, [r7, #6]
	cmp sl, #0
	beq _02074300
	tst sl, #0x10
	beq _02074264
	ldrh r2, [r8, #0x16]
	ldrsh r1, [r7, #0x12]
	ldrsh r3, [r7, #0x10]
	ldrsh r0, [r7, #0x5e]
	add r1, r2, r1
	add r1, r3, r1
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, asr #8
	and r0, r0, #0x7f
	ldrb r0, [r6, r0]
	and r2, r1, #0xff
	mov r1, r0, lsl #0x1c
	add r1, r2, r1, lsr #20
	mov r1, r1, lsl #1
	mov r0, r0, asr #4
	ldrh r1, [r5, r1]
	rsbs r0, r0, #4
	movpl r1, r1, lsr r0
	rsbmi r0, r0, #0
	movmi r1, r1, lsl r0
	ldrb r0, [r7, #0x1f]
	cmp r0, #3
	mov r0, r4
	blo _0207425C
	mov r2, r1, asr #3
	add r1, r1, r2, lsr #28
	mov r1, r1, asr #4
	bl _s32_div_f
	str r0, [r7, #0x13c]
	b _02074264
_0207425C:
	bl _s32_div_f
	str r0, [r7, #0x13c]
_02074264:
	tst sl, #0x20
	beq _020742C4
	ldrb r1, [r7, #0x16]
	ldrsh r0, [r7, #0x60]
	add r1, r1, r0, asr #6
	cmp r1, #0x7f
	movgt r1, #0x7f
	bgt _0207428C
	cmp r1, #0
	movlt r1, #0
_0207428C:
	ldrh r0, [r8, #0x18]
	ldrb r2, [r7, #0x14c]
	mul r1, r0, r1
	mul r3, r2, r1
	ldr r0, _02074330 ; =0x828CBFBF
	smull r1, r2, r0, r3
	add r2, r3, r2
	mov r0, r3, lsr #0x1f
	add r2, r0, r2, asr #12
	mul r1, r2, r2
	mov r0, r1, asr #8
	add r0, r1, r0, lsr #23
	mov r0, r0, asr #9
	str r0, [r7, #0x140]
_020742C4:
	tst sl, #0x40
	beq _02074300
	ldrsb r1, [r7, #0x17]
	ldrsh r2, [r8, #0x1a]
	ldrsh r0, [r7, #0x62]
	sub r1, r1, #0x40
	add r1, r2, r1
	adds r1, r1, r0, asr #6
	ldr r0, _02074334 ; =_022B8330
	movmi r1, #0
	cmp r1, #0x7f
	ldr r0, [r0, #0xed4]
	movgt r1, #0x7f
	ldrb r0, [r0, r1]
	str r0, [r7, #0x144]
_02074300:
	strh sl, [r7, #6]
_02074304:
	ldrh r0, [fp, #0x2e]
	add sb, sb, #1
	add r7, r7, #0x15c
	cmp sb, r0
	blt _020741BC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207431C: .word _022B7A30
_02074320: .word _022B7A6C
_02074324: .word _020B1310
_02074328: .word _020B1394
_0207432C: .word 0x00FFB0FF
_02074330: .word 0x828CBFBF
_02074334: .word _022B8330
	arm_func_end DseVoice_UpdateParameters

	arm_func_start DseVoice_ResetAll
DseVoice_ResetAll: ; 0x02074338
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr sl, _020743D0 ; =_022B7A30
	mov r8, #0
	ldrh r0, [sl, #0x2e]
	cmp r0, #0
	ble _020743C0
	ldr sb, _020743D4 ; =_022B7A6C
	mov r7, r8
	mov r6, #1
	mov r5, #0x40
	mov r4, r8
_02074364:
	strh r7, [sb, #4]
	strh r7, [sb, #6]
	mov r0, r6, lsl r8
	strh r8, [sb, #8]
	strh r0, [sb, #0xa]
	str r7, [sb]
	str r7, [sb, #0x14c]
	strb r7, [sb, #0xd]
	strb r7, [sb, #0xe]
	strh r7, [sb, #0x12]
	strb r7, [sb, #0x16]
	add r0, sb, #0x3c
	strb r5, [sb, #0x17]
	bl SoundEnvelope_Reset
	add r0, sb, #0x5c
	bl SoundLfoBank_Reset
	str r4, [sb, #0x154]
	str r4, [sb, #0x158]
	ldrh r0, [sl, #0x2e]
	add r8, r8, #1
	add sb, sb, #0x15c
	cmp r8, r0
	blt _02074364
_020743C0:
	ldr r0, _020743D8 ; =DRIVER_WORK
	mov r1, #0
	str r1, [r0, #0x654]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020743D0: .word _022B7A30
_020743D4: .word _022B7A6C
_020743D8: .word DRIVER_WORK
	arm_func_end DseVoice_ResetAll

	arm_func_start DseVoice_ResetHW
DseVoice_ResetHW: ; 0x020743DC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ble _02074414
	ldr r1, _0207447C ; =_022B7A30
	mov r2, #0x10
	strh r2, [r1, #0x2c]
	cmp r0, #0x10
	movgt r0, r2, lsl #0x10
	ldr r2, _0207447C ; =_022B7A30
	movgt r0, r0, asr #0x10
	strh r0, [r2, #0x2e]
	ldr r1, _02074480 ; =_022B8330
	mov r0, #0
	strb r0, [r1, #0xd0c]
_02074414:
	ldr r2, _0207447C ; =_022B7A30
	mov r0, #0
	strh r0, [r2, #0x32]
	strh r0, [r2, #0x34]
	ldr r1, _02074484 ; =DRIVER_WORK
	strh r0, [r2, #0x36]
	strb r0, [r1, #0x738]
	strb r0, [r1, #0x739]
	ldr ip, _02074480 ; =_022B8330
	strh r0, [r2, #0x30]
	str r0, [ip, #0xcfc]
	str r0, [ip, #0xd00]
	sub r2, r0, #1
	str r2, [ip, #0xd04]
	ldrsh lr, [r1, #0x28]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str lr, [ip, #0xd08]
	bl sub_0207C8B8
	ldr r0, _02074488 ; =0x0000FFFF
	mov r3, #0
	mov r1, r0
	mov r2, r0
	bl sub_0207C8E0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207447C: .word _022B7A30
_02074480: .word _022B8330
_02074484: .word DRIVER_WORK
_02074488: .word 0x0000FFFF
	arm_func_end DseVoice_ResetHW

	arm_func_start UpdateChannels
UpdateChannels: ; 0x0207448C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _02074570 ; =_022B7A30
	mov r7, #0
	ldrh r0, [sb, #0x2e]
	mov r6, r7
	ldr r5, _02074574 ; =_022B7A6C
	cmp r0, #0
	ble _0207452C
	mov r4, #2
_020744B0:
	add r0, r5, #0x3c
	bl SoundEnvelope_Tick
	ldrsb r1, [r5, #0x5a]
	mov r8, r0
	cmp r1, #1
	bne _02074514
	add r0, r5, #0x5c
	bl SoundLfoBank_Tick
	ldrh r1, [r5, #6]
	orr r0, r1, r0
	strh r0, [r5, #6]
	ldrb r0, [r5, #0x58]
	cmp r0, #8
	bne _020744F8
	strb r4, [r5, #0x58]
	ldrh r0, [r5, #6]
	orr r0, r0, #2
	strh r0, [r5, #6]
_020744F8:
	ldrb r0, [r5, #0x14c]
	cmp r0, r8
	ldrneh r0, [r5, #6]
	orrne r0, r0, #0x20
	strneh r0, [r5, #6]
	cmp r8, #0
	addgt r7, r7, #1
_02074514:
	strb r8, [r5, #0x14c]
	ldrh r0, [sb, #0x2e]
	add r6, r6, #1
	add r5, r5, #0x15c
	cmp r6, r0
	blt _020744B0
_0207452C:
	ldr r0, _02074578 ; =_022B8330
	ldr r1, [r0, #0xd04]
	cmp r1, #0
	movlt r1, #0
	strlt r1, [r0, #0xd00]
	ldr r0, _02074578 ; =_022B8330
	str r7, [r0, #0xcfc]
	ldr r1, [r0, #0xd00]
	cmp r1, r7
	strlt r7, [r0, #0xd00]
	movlt r1, #0x64
	strlt r1, [r0, #0xd04]
	ldr r0, _02074578 ; =_022B8330
	ldr r1, [r0, #0xd04]
	sub r1, r1, #1
	str r1, [r0, #0xd04]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02074570: .word _022B7A30
_02074574: .word _022B7A6C
_02074578: .word _022B8330
	arm_func_end UpdateChannels

	arm_func_start DseVoice_Cleanup
DseVoice_Cleanup: ; 0x0207457C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _02074610 ; =_022B7A6C
	bl sub_0207D470
	ldr r4, _02074614 ; =_022B7A30
	mov r0, r0, lsl #0x10
	ldrh r2, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	mov r7, #0
	orr r0, r2, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	cmp r1, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r5, r7
_020745B4:
	ldrsb r0, [r6, #0x5a]
	cmp r0, #1
	bne _020745DC
	tst r8, #1
	bne _020745F0
	add r0, r6, #0x3c
	bl SoundEnvelope_Stop2
	add r0, r6, #0x100
	strh r5, [r0, #0x4c]
	b _020745F0
_020745DC:
	and r0, r8, #1
	cmp r0, #1
	bne _020745F0
	mov r0, r6
	bl DseVoice_FlagForDeactivation
_020745F0:
	ldrh r1, [r4, #0x2e]
	mov r0, r8, lsl #0xf
	add r7, r7, #1
	cmp r7, r1
	mov r8, r0, lsr #0x10
	add r6, r6, #0x15c
	blt _020745B4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02074610: .word _022B7A6C
_02074614: .word _022B7A30
	arm_func_end DseVoice_Cleanup

	arm_func_start DseVoice_Allocate
DseVoice_Allocate: ; 0x02074618
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _02074774 ; =_022B7A30
	mov r3, r3, lsl #0x10
	ldrh r5, [r4, #0x2e]
	add r3, r3, #0xff
	add r8, r3, #0x100
	ldrb r4, [r1, #5]
	sub r5, r5, #1
	ldrb r3, [r0, #7]
	cmp r4, r5
	movgt r4, r5
	ldrb r7, [r1, #4]
	mov r6, #0
	cmp r3, #0
	beq _02074660
	cmp r3, #1
	beq _0207466C
	b _0207476C
_02074660:
	ldr r6, [r0, #0xb4]
	cmp r6, #0
	bne _0207476C
_0207466C:
	ldrb r3, [r1]
	cmp r3, #0
	beq _02074708
	ldr r5, _02074778 ; =_022B7A6C
	mov r3, #0x15c
	mla r3, r7, r3, r5
	mov ip, r7
	mov lr, r4
	mov r5, r8
	cmp r7, r4
	mov r6, #0
	bgt _020746E4
	ldr r0, [r0]
_020746A0:
	ldr sb, [r3]
	cmp sb, r0
	ldreqh sb, [r3, #0x18]
	cmpeq sb, r2
	bne _020746D4
	ldr sb, [r3, #0x14c]
	add r6, r6, #1
	cmp r5, sb
	movhi r5, sb
	ldrb sb, [r1, #2]
	movhi lr, ip
	cmp r6, sb
	bge _020746E4
_020746D4:
	add ip, ip, #1
	cmp ip, r4
	add r3, r3, #0x15c
	ble _020746A0
_020746E4:
	ldrb r0, [r1, #2]
	cmp r6, r0
	blt _02074708
	ldr r1, _02074778 ; =_022B7A6C
	mov r0, #0x15c
	mla r6, lr, r0, r1
	mov r0, r6
	bl DseVoice_Deallocate
	b _0207476C
_02074708:
	cmp r7, r4
	add r2, r4, #1
	bgt _0207474C
	ldr r1, _0207477C ; =DRIVER_WORK
	mov r0, #0x15c
	mla r1, r7, r0, r1
_02074720:
	ldr r0, [r1, #0x888]
	cmp r8, r0
	bls _0207473C
	mov r2, r7
	cmp r0, #0
	beq _0207474C
	mov r8, r0
_0207473C:
	add r7, r7, #1
	cmp r7, r4
	add r1, r1, #0x15c
	ble _02074720
_0207474C:
	cmp r2, r4
	movgt r6, #0
	bgt _0207476C
	ldr r1, _02074778 ; =_022B7A6C
	mov r0, #0x15c
	mla r6, r2, r0, r1
	mov r0, r6
	bl DseVoice_Deallocate
_0207476C:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02074774: .word _022B7A30
_02074778: .word _022B7A6C
_0207477C: .word DRIVER_WORK
	arm_func_end DseVoice_Allocate

	arm_func_start DseVoice_Start
DseVoice_Start: ; 0x02074780
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r3, [r4, #6]
	mov r1, r2, lsl #0x10
	add r1, r1, #0xff
	orr r2, r3, #1
	bic r2, r2, #2
	strh r2, [r4, #6]
	ldr r2, [r4, #0x14c]
	add r1, r1, #0x100
	orr r1, r2, r1
	mov r5, r0
	str r1, [r4, #0x14c]
	add r0, r4, #0x3c
	bl UpdateTrackVolumeEnvelopes
	ldr r0, [r4, #0x158]
	cmp r0, r5
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	str r0, [r4, #0x154]
	str r4, [r5, #0xb4]
	str r5, [r4, #0x158]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseVoice_Start

	arm_func_start DseVoice_ReleaseHeld
DseVoice_ReleaseHeld: ; 0x020747DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	ldrb r0, [r7, #4]
	tst r0, #3
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r4, [r7, #0xb8]
	add r6, r7, #0xb8
	cmp r4, #0
	beq _0207484C
	ldr r8, _02074858 ; =DRIVER_WORK
	mvn sl, #0
	mov sb, #0
_0207480C:
	ldmib r4, {r0, r5}
	cmp r0, #0
	strgt r4, [r6]
	addgt r6, r4, #8
	bgt _02074840
	mov r0, r7
	mov r1, r4
	bl DseChannel_ReleaseNoteInternal
	ldr r0, [r8, #0x650]
	str r0, [r4, #8]
	str r4, [r8, #0x650]
	str sl, [r4, #4]
	strb sb, [r4, #1]
_02074840:
	mov r4, r5
	cmp r5, #0
	bne _0207480C
_0207484C:
	mov r0, #0
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02074858: .word DRIVER_WORK
	arm_func_end DseVoice_ReleaseHeld

	arm_func_start DseVoice_Release
DseVoice_Release: ; 0x0207485C
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldrh r1, [r4, #4]
	orr r1, r1, #2
	strh r1, [r4, #4]
	ldrb r0, [r0, #4]
	tst r0, #1
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0x14c]
	add r0, r4, #0x3c
	and r1, r1, #0xff
	str r1, [r4, #0x14c]
	bl SoundEnvelope_Release
	ldrh r0, [r4, #6]
	bic r0, r0, #1
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	arm_func_end DseVoice_Release

	arm_func_start DseVoice_Deallocate
DseVoice_Deallocate: ; 0x020748A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x158]
	cmp r1, #0
	beq _02074948
	ldr r2, [r1, #0xb4]
	cmp r2, r4
	ldreq r0, [r4, #0x154]
	streq r0, [r1, #0xb4]
	beq _020748F0
	cmp r2, #0
	beq _020748F0
_020748D0:
	ldr r0, [r2, #0x154]
	cmp r0, r4
	ldreq r0, [r4, #0x154]
	streq r0, [r2, #0x154]
	beq _020748F0
	mov r2, r0
	cmp r0, #0
	bne _020748D0
_020748F0:
	mov r0, #0
	strh r0, [r4, #4]
	str r0, [r4, #0x158]
	str r0, [r4, #0x154]
	add r0, r4, #0x3c
	bl SoundEnvelope_Stop
	ldr r1, [r4, #0x14c]
	mov r0, #0
	and r1, r1, #0xff
	str r1, [r4, #0x14c]
	str r0, [r4]
	strh r0, [r4, #0x18]
	ldr r1, _020749A0 ; =_022B7A30
	ldrh r0, [r4, #0xa]
	ldrh r3, [r1, #0x32]
	mvn r2, r0
	and r2, r3, r2
	strh r2, [r1, #0x32]
	ldrh r2, [r1, #0x36]
	orr r2, r2, r0
	strh r2, [r1, #0x36]
	ldmia sp!, {r4, pc}
_02074948:
	mov r0, #0
	strh r0, [r4, #4]
	str r0, [r4, #0x158]
	str r0, [r4, #0x154]
	add r0, r4, #0x3c
	bl SoundEnvelope_Stop
	ldr r1, [r4, #0x14c]
	mov r0, #0
	and r1, r1, #0xff
	str r1, [r4, #0x14c]
	str r0, [r4]
	strh r0, [r4, #0x18]
	ldr r1, _020749A0 ; =_022B7A30
	ldrh r0, [r4, #0xa]
	ldrh r3, [r1, #0x32]
	mvn r2, r0
	and r2, r3, r2
	strh r2, [r1, #0x32]
	ldrh r2, [r1, #0x36]
	orr r2, r2, r0
	strh r2, [r1, #0x36]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020749A0: .word _022B7A30
	arm_func_end DseVoice_Deallocate

	arm_func_start DseVoice_FlagForActivation
DseVoice_FlagForActivation: ; 0x020749A4
	mov r1, #0xff0
	strh r1, [r0, #6]
	ldr r2, [r0, #0x14c]
	ldr r1, _020749F0 ; =_022B7A30
	orr r2, r2, #0xff
	orr r2, r2, #0x100
	str r2, [r0, #0x14c]
	ldrh r3, [r0, #0xa]
	ldrh r0, [r1, #0x34]
	mvn r2, r3
	and r0, r0, r2
	strh r0, [r1, #0x34]
	ldrh r0, [r1, #0x36]
	and r0, r0, r2
	strh r0, [r1, #0x36]
	ldrh r0, [r1, #0x32]
	orr r0, r0, r3
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
_020749F0: .word _022B7A30
	arm_func_end DseVoice_FlagForActivation

	arm_func_start DseVoice_FlagForDeactivation
DseVoice_FlagForDeactivation: ; 0x020749F4
	ldr r2, [r0, #0x14c]
	ldr r1, _02074A28 ; =_022B7A30
	bic r2, r2, #0xff00
	str r2, [r0, #0x14c]
	ldrh r3, [r0, #0xa]
	ldrh r2, [r1, #0x32]
	mvn r0, r3
	and r0, r2, r0
	strh r0, [r1, #0x32]
	ldrh r0, [r1, #0x34]
	orr r0, r0, r3
	strh r0, [r1, #0x34]
	bx lr
	.align 2, 0
_02074A28: .word _022B7A30
	arm_func_end DseVoice_FlagForDeactivation

	arm_func_start DseVoice_CountNumActiveInChannel
DseVoice_CountNumActiveInChannel: ; 0x02074A2C
	ldr r2, [r0, #0xb4]
	mov r0, #0
	cmp r2, #0
	bxeq lr
_02074A3C:
	ldrb r1, [r2, #0x14c]
	ldr r2, [r2, #0x154]
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #0
	bne _02074A3C
	bx lr
	arm_func_end DseVoice_CountNumActiveInChannel

	arm_func_start DseVoice_UpdateHardware
DseVoice_UpdateHardware: ; 0x02074A58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r4, _02074C64 ; =_022B7A30
	ldr r7, _02074C68 ; =_022B7A6C
	ldrh r0, [r4, #0x2e]
	mov r8, #0
	cmp r0, #0
	ble _02074BC8
	mov fp, #2
	mov sl, #1
	mov r6, r8
	mov r5, r8
_02074A88:
	ldrh sb, [r7, #6]
	cmp sb, #0
	beq _02074BB4
	tst sb, #1
	beq _02074B5C
	ldrsb r0, [r7, #0x21]
	ldrb r1, [r7, #0x1f]
	cmp r0, #0
	movne r3, sl
	moveq r3, fp
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02074B50
_02074ABC: ; jump table
	b _02074AD0 ; case 0
	b _02074AD0 ; case 1
	b _02074AD0 ; case 2
	b _02074B0C ; case 3
	b _02074B34 ; case 4
_02074AD0:
	ldr r0, [r7, #0x34]
	str r0, [sp]
	ldr r0, [r7, #0x38]
	str r0, [sp, #4]
	ldr r0, [r7, #0x140]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r7, #0x13c]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x144]
	str r0, [sp, #0x14]
	ldrh r0, [r7, #8]
	ldr r2, [r7, #0x30]
	bl sub_0207CA6C
	b _02074B50
_02074B0C:
	ldr r0, [r7, #0x13c]
	mov r3, #0
	str r0, [sp]
	ldr r0, [r7, #0x144]
	str r0, [sp, #4]
	ldrh r0, [r7, #8]
	ldrb r1, [r7, #0x25]
	ldr r2, [r7, #0x140]
	bl sub_0207CAB8
	b _02074B50
_02074B34:
	ldr r0, [r7, #0x144]
	mov r2, #0
	str r0, [sp]
	ldrh r0, [r7, #8]
	ldr r1, [r7, #0x140]
	ldr r3, [r7, #0x13c]
	bl sub_0207CAE0
_02074B50:
	mov r0, r7
	bl DseVoice_FlagForActivation
	b _02074BB0
_02074B5C:
	tst sb, #2
	beq _02074B70
	mov r0, r7
	bl DseVoice_FlagForDeactivation
	mov sb, #0
_02074B70:
	tst sb, #0x10
	beq _02074B84
	ldrh r0, [r7, #0xa]
	ldr r1, [r7, #0x13c]
	bl sub_0207CA04
_02074B84:
	tst sb, #0x20
	beq _02074B9C
	ldrh r0, [r7, #0xa]
	ldr r1, [r7, #0x140]
	mov r2, #0
	bl sub_0207CA24
_02074B9C:
	tst sb, #0x40
	beq _02074BB0
	ldrh r0, [r7, #0xa]
	ldr r1, [r7, #0x144]
	bl sub_0207CA4C
_02074BB0:
	strh r5, [r7, #6]
_02074BB4:
	ldrh r0, [r4, #0x2e]
	add r8, r8, #1
	add r7, r7, #0x15c
	cmp r8, r0
	blt _02074A88
_02074BC8:
	ldr r1, _02074C64 ; =_022B7A30
	ldr r2, _02074C6C ; =DRIVER_WORK
	ldrh r0, [r1, #0x32]
	strh r0, [r1, #0x30]
	ldrb r1, [r2, #0x73a]
	ldrb r2, [r2, #0x738]
	orr r3, r0, r1
	orrs r3, r2, r3
	beq _02074C0C
	mov r3, #0
	bl sub_0207C8B8
	ldr r1, _02074C6C ; =DRIVER_WORK
	mov r2, #0
	strb r2, [r1, #0x738]
	ldr r0, _02074C64 ; =_022B7A30
	strb r2, [r1, #0x73a]
	strh r2, [r0, #0x32]
_02074C0C:
	ldr r1, _02074C64 ; =_022B7A30
	ldr r0, _02074C6C ; =DRIVER_WORK
	ldrh r4, [r1, #0x34]
	ldrh r3, [r1, #0x36]
	ldrb r1, [r0, #0x73b]
	ldrb r2, [r0, #0x739]
	orr r0, r4, r3
	orr r3, r1, r0
	orrs r3, r2, r3
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, #0
	bl sub_0207C8E0
	ldr r1, _02074C6C ; =DRIVER_WORK
	mov r2, #0
	strb r2, [r1, #0x739]
	ldr r0, _02074C64 ; =_022B7A30
	strb r2, [r1, #0x73b]
	strh r2, [r0, #0x36]
	strh r2, [r0, #0x34]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02074C64: .word _022B7A30
_02074C68: .word _022B7A6C
_02074C6C: .word DRIVER_WORK
	arm_func_end DseVoice_UpdateHardware
