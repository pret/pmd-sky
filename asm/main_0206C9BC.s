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
	bl OS_WakeupThreadDirect
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
	bl OS_WakeupThreadDirect
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
	bl OS_SleepThread
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
	bl OS_WakeupThreadDirect
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
	bl OS_WakeupThreadDirect
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
	bl OS_WakeupThreadDirect
	ldr r0, _0206FE54 ; =_022B9234
	bl sub_02079800
	ldr r1, _0206FE50 ; =_022B9208
	mov r2, #0
	ldr r0, _0206FE58 ; =_022B9300
	strb r2, [r1, #0xf5]
	mov r2, #1
	strb r2, [r1, #0xf6]
	bl OS_WakeupThreadDirect
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
	bl DC_FlushRange
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
	bl OS_WakeupThreadDirect
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
	bl OS_WakeupThreadDirect
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
	ldr ip, _02070998 ; =OS_WakeupThreadDirect
	ldr r0, _0207099C ; =_022B94BC
	bx ip
	.align 2, 0
_02070998: .word OS_WakeupThreadDirect
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
	bl OS_SleepThread
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
	bl DC_FlushRange
	mov r0, r8
	mov r1, sl
	bl DC_FlushRange
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
	bl OS_WakeupThreadDirect
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
	bl OS_WakeupThreadDirect
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
	bl OS_WakeupThreadDirect
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
	bl OS_SleepThread
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
