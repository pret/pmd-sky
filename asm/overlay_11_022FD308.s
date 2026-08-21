	.include "asm/macros.inc"
	.include "overlay_11_022FD308.inc"

	.text

	arm_func_start SetBlinkLiveObject
SetBlinkLiveObject: ; 0x022FD308
	ldr ip, _022FD314 ; =ov11_022F4984
	add r0, r0, #0x154
	bx ip
	.align 2, 0
_022FD314: .word ov11_022F4984
	arm_func_end SetBlinkLiveObject

	arm_func_start SetPositionOffsetLiveObject
SetPositionOffsetLiveObject: ; 0x022FD318
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r2, _022FD478 ; =ov11_02321D88
	mov r5, r0
	ldr r0, [r2, #4]
	ldr r3, [r2]
	str r0, [sp, #4]
	str r3, [sp]
	ldr r3, [r5, #0x134]
	ldr r0, [r1]
	mov r4, #0
	add r0, r3, r0
	str r0, [sp]
	ldr ip, [r5, #0x138]
	ldr r3, [r1, #4]
	add r3, ip, r3
	str r3, [sp, #4]
	ldr r3, [r2, #0x38]
	ldr r2, [r2, #0x3c]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r5, #0x13c]
	ldr r2, [r1]
	add r3, r3, r2
	str r3, [sp, #8]
	ldr r2, [r5, #0x140]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r1, [r5, #0x2c]
	cmp r0, r1
	bge _022FD3B4
	str r1, [sp]
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x10]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #8]
	b _022FD3D8
_022FD3B4:
	ldr r1, [r5, #0x34]
	cmp r3, r1
	blt _022FD3D8
	ldr r0, [r5, #0x10]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #0x34]
	str r0, [sp, #8]
_022FD3D8:
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #4]
	cmp r0, r1
	bge _022FD404
	str r1, [sp, #4]
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x14]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #0xc]
	b _022FD42C
_022FD404:
	ldr r1, [r5, #0x38]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _022FD42C
	ldr r0, [r5, #0x14]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #0x38]
	str r0, [sp, #0xc]
_022FD42C:
	add r1, sp, #0
	add r2, sp, #8
	mov r0, r5
	bl ov11_022FCE48
	cmp r0, #0
	bne _022FD470
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r4, #0
	str r1, [r5, #0x134]
	str r0, [r5, #0x138]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x13c]
	str r0, [r5, #0x140]
	movne r0, #0x40
	moveq r0, #0
_022FD470:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FD478: .word ov11_02321D88
	arm_func_end SetPositionOffsetLiveObject

	arm_func_start ov11_022FD47C
ov11_022FD47C: ; 0x022FD47C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FD50C ; =ov11_02324D00
	mov r4, #0
	ldr r5, [r0]
	mov r7, r4
	mvn r6, #0
_022FD494:
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ldrneb r0, [r5, #8]
	cmpne r0, #0
	beq _022FD4F0
	add r0, r5, #0x3c
	bl FuncThatCallsRunNextOpcode
	cmp r0, #0
	beq _022FD4CC
	cmp r0, #6
	bne _022FD4CC
	mov r0, r4
	bl DeleteLiveObject
	b _022FD4F0
_022FD4CC:
	ldrb r0, [r5, #0x14c]
	cmp r0, #0
	beq _022FD4F0
	strb r7, [r5, #0x14c]
	add r0, r5, #0x100
	ldrsh r1, [r0, #0x4e]
	mov r2, r7
	add r0, r5, #0x154
	bl SetAnimDataFields2
_022FD4F0:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	add r5, r5, #0x218
	blt _022FD494
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FD50C: .word ov11_02324D00
	arm_func_end ov11_022FD47C

	arm_func_start ov11_022FD510
ov11_022FD510: ; 0x022FD510
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FD61C ; =ov11_02321D88
	ldr r1, _022FD620 ; =ov11_02324D00
	ldr r8, [r0, #0x10]
	ldr r7, [r0, #0x14]
	mov sb, #0
	ldr sl, [r1]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FD540:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	ldrneb r0, [sl, #8]
	cmpne r0, #0
	beq _022FD5FC
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r2, [sl, #0x134]
	ldr r1, [sl, #0x18]
#ifdef JAPAN
	add r0, sl, #0x154
#else
	add r0, sl, #0x100
#endif
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r2, [sl, #0x138]
	ldr r1, [sl, #0x1c]
	add r1, r2, r1
	str r1, [sp, #0x10]
#ifndef JAPAN
	ldrsh r1, [r0, #0xe6]
#endif
	ldr r6, [sl, #0x144]
	ldr r5, [sl, #0x148]
#ifdef JAPAN
	bl ov11_022F5FE8_JP
	cmp r0, #0
	beq _022FD5B4
	strb fp, [sl, #0x14c]
	add r0, sl, #0x100
#else
	cmp r1, #0
	bge _022FD5B4
	ldrsh r1, [r0, #0xe0]
	cmp r1, #0
	ble _022FD5B4
	strb fp, [sl, #0x14c]
#endif
	ldrsh r1, [r0, #0x4e]
	mov r2, fp
	add r0, sl, #0x154
	bl SetAnimDataFields2
_022FD5B4:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x50]
	cmp r1, r4
	beq _022FD5EC
	mov r0, #0
	str r0, [sp]
	ldrsh r2, [r3, #0x52]
	ldrsb r3, [r3, #0x30]
	add r0, sl, #0x154
	bl ov11_022F5408
	add r1, sl, #0x100
	strh r4, [r1, #0x50]
	mov r0, #0
	strh r0, [r1, #0x52]
_022FD5EC:
	add r1, sp, #0xc
	add r0, sl, #0x154
	add r2, r6, r5
	bl AnimRelatedFunction__022F6F14
_022FD5FC:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	add sl, sl, #0x218
	blt _022FD540
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FD61C: .word ov11_02321D88
_022FD620: .word ov11_02324D00
	arm_func_end ov11_022FD510

	arm_func_start ov11_022FD624
ov11_022FD624: ; 0x022FD624
	stmdb sp!, {r3, lr}
	mov r0, #0x2140
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FD668 ; =ov11_02324D04
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FD644:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #6]
	cmp r3, #0x10
	add r0, r0, #0x214
	blt _022FD644
	bl ov11_022FD66C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FD668: .word ov11_02324D04
	arm_func_end ov11_022FD624

	arm_func_start ov11_022FD66C
ov11_022FD66C: ; 0x022FD66C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FD6B0 ; =ov11_02324D04
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FD680:
	ldrsh r0, [r6, #6]
	cmp r0, r4
	beq _022FD694
	mov r0, r5
	bl DeleteLivePerformer
_022FD694:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x10
	add r6, r6, #0x214
	blt _022FD680
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FD6B0: .word ov11_02324D04
	arm_func_end ov11_022FD66C

	arm_func_start ov11_022FD6B4
ov11_022FD6B4: ; 0x022FD6B4
	stmdb sp!, {r3, lr}
	bl ov11_022FD66C
	ldr r0, _022FD6D8 ; =ov11_02324D04
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FD6D8 ; =ov11_02324D04
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FD6D8: .word ov11_02324D04
	arm_func_end ov11_022FD6B4

	arm_func_start ov11_022FD6DC
ov11_022FD6DC: ; 0x022FD6DC
	mvn r1, #0
	cmp r0, r1
	beq _022FD720
	ldr r1, _022FD728 ; =ov11_02324D04
	mov r3, #0
	ldr r2, [r1]
	b _022FD718
_022FD6F8:
	ldrsh r1, [r2, #6]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r2, r2, #0x214
_022FD718:
	cmp r3, #0x10
	blt _022FD6F8
_022FD720:
	mvn r0, #0
	bx lr
	.align 2, 0
_022FD728: .word ov11_02324D04
	arm_func_end ov11_022FD6DC

	arm_func_start ov11_022FD72C
ov11_022FD72C: ; 0x022FD72C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r8, r1
	ldrh r5, [r8]
	ldr r1, _022FDA68 ; =ov11_02320858
	movs sb, r0
	mov r7, r2
	mov r6, r3
	add r4, r1, r5, lsl #2
	bpl _022FD7C0
	ldrsb r0, [r4]
	cmp r0, #1
	bne _022FD770
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FD6DC
	mov sb, r0
_022FD770:
	cmp sb, #0
	bge _022FD7B4
	ldr r0, _022FDA6C ; =ov11_02324D04
	mov r3, #0
	ldr r2, [r0]
	mvn r1, #0
	b _022FD7AC
_022FD78C:
	ldrsh r0, [r2, #6]
	cmp r0, r1
	moveq sb, r3
	beq _022FD7B4
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x214
_022FD7AC:
	cmp r3, #0x10
	blt _022FD78C
_022FD7B4:
	cmp sb, #0
	mvnlt r0, #0
	blt _022FDA60
_022FD7C0:
	ldr r0, _022FDA6C ; =ov11_02324D04
	ldrsb r1, [r4]
	ldr r2, [r0]
	mov r0, #0x214
	stmia sp, {r1, r7}
	str r6, [sp, #8]
	ldrh r3, [r8]
	smlabb r5, sb, r0, r2
	ldr r1, _022FDA70 ; =ov11_02322160
	mov r2, sb
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r5, #6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	ands sl, r0, #0xff
	beq _022FD81C
	mov r1, #0
	add r0, r5, #0x150
	strb r1, [r5, #8]
	bl ov11_022F4A14
_022FD81C:
	sub r0, r7, #1
	strh sb, [r5, #4]
	mov r0, r0, lsl #0x10
	ldrh r1, [r8]
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	strh r1, [r5, #6]
	strlsh r7, [r5, #0xa]
	strlsb r6, [r5, #0xc]
	mvnls r0, #0
	strlsb r0, [r5, #0xd]
	bls _022FD868
	cmp sl, #0
	mvnne r0, #0
	strneh r0, [r5, #0xa]
	strneb r0, [r5, #0xc]
	strb r6, [r5, #0xd]
_022FD868:
	ldrsb r0, [r4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022FD8CC
_022FD878: ; jump table
	b _022FD8CC ; case 0
	b _022FD890 ; case 1
	b _022FD89C ; case 2
	b _022FD8A8 ; case 3
	b _022FD8B4 ; case 4
	b _022FD8C0 ; case 5
_022FD890:
	mov r0, #0x800000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD89C:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8A8:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8B4:
	mov r0, #0x2000000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8C0:
	ldr r0, _022FDA74 ; =0x02020000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8CC:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
_022FD8D4:
	ldrb r0, [r4, #3]
	cmp r0, #0
	ldrne r0, [r5, #0x128]
	orrne r0, r0, #0x80000000
	strne r0, [r5, #0x128]
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldreqb r0, [r8, #3]
	moveq r0, r0, lsl #0xb
	streq r0, [r5, #0x10]
	ldreqb r0, [r8, #4]
	movne r0, r0, lsl #0xb
	strne r0, [r5, #0x10]
	ldrneb r0, [r4, #2]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x14]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r5, #0x1c]
	ldrsb r0, [r8, #2]
	strb r0, [r5, #0x20]
	ldrb r0, [r8, #7]
	tst r0, #4
	bne _022FD968
	ldrb r0, [r8, #5]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x24]
	ldrb r0, [r8, #7]
	tst r0, #2
	ldrne r0, [r5, #0x24]
	addne r0, r0, #0x400
	strne r0, [r5, #0x24]
_022FD968:
	ldrb r0, [r8, #8]
	tst r0, #4
	bne _022FD994
	ldrb r0, [r8, #6]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x28]
	ldrb r0, [r8, #8]
	tst r0, #2
	ldrne r0, [r5, #0x28]
	addne r0, r0, #0x400
	strne r0, [r5, #0x28]
_022FD994:
	ldrb r0, [sp, #0x30]
	cmp r0, #0
	ldrne r0, [r5, #0x128]
	orrne r0, r0, #0x800000
	strne r0, [r5, #0x128]
	cmp sl, #0
	beq _022FDA54
	ldrsb r0, [r5, #0x20]
	mov r2, #0
	strb r0, [r5, #0x12c]
	ldr r3, [r5, #0x24]
	ldr r1, [r5, #0x18]
	add r0, r5, #0x2c
	sub r1, r3, r1
	str r1, [r5, #0x130]
	ldr r4, [r5, #0x24]
	ldr r3, [r5, #0x18]
	add r1, r5, #0x34
	add r3, r4, r3
	str r3, [r5, #0x138]
	ldr r4, [r5, #0x28]
	ldr r3, [r5, #0x1c]
	sub r3, r4, r3
	str r3, [r5, #0x134]
	ldr r4, [r5, #0x28]
	ldr r3, [r5, #0x1c]
	add r3, r4, r3
	str r3, [r5, #0x13c]
	str r2, [r5, #0x144]
	str r2, [r5, #0x140]
	bl ov11_022F1F08
	add r0, r5, #0x100
	mov r2, #0x800
	mov r1, #1
	strh r2, [r0, #0x4a]
	strb r1, [r5, #0x148]
	sub r1, r1, #2
	strh r1, [r0, #0x4c]
	mov r1, #0
	strh r1, [r0, #0x4e]
	ldrsh r1, [r5, #6]
	ldr r2, [r5, #0x128]
	add r0, r5, #0x150
	bl ov11_022F6F4C
	ldr r1, _022FDA78 ; =PERFORMER_FUNCTION_TABLE
	mov r2, r5
	add r0, r5, #0x3c
	bl InitScriptRoutine
_022FDA54:
	mov r1, #1
	mov r0, sb
	strb r1, [r5, #8]
_022FDA60:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FDA68: .word ov11_02320858
_022FDA6C: .word ov11_02324D04
_022FDA70: .word ov11_02322160
_022FDA74: .word 0x02020000
_022FDA78: .word PERFORMER_FUNCTION_TABLE
	arm_func_end ov11_022FD72C

	arm_func_start ov11_022FDA7C
ov11_022FDA7C: ; 0x022FDA7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FDBDC ; =ov11_023221A8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FDB44
	ldr r0, _022FDBE0 ; =ov11_02324D04
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FDBE4 ; =ov11_023221D8
	add r5, r4, #1
	mov r6, #1
_022FDAD8:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FDB28
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FDB28
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FDB28
	mov r0, r8
	bl DeleteLivePerformer
_022FDB28:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDAD8
	b _022FDBD4
_022FDB44:
	ldr r0, _022FDBE0 ; =ov11_02324D04
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022FDB60:
	ldrsh r3, [sl, #6]
	cmp r3, r7
	beq _022FDBBC
	ldrsb ip, [sl, #0xd]
	ldr r1, _022FDBE8 ; =ov11_02322204
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl Debug_Print
	ldrsb r0, [sl, #0xd]
	cmp r0, r6
	beq _022FDBA8
	cmp sb, r5
	cmpne sb, r0
	bne _022FDBBC
	mov r0, r8
	bl DeleteLivePerformer
	b _022FDBBC
_022FDBA8:
	ldrsh r0, [sl, #0xa]
	cmp r0, r4
	bne _022FDBBC
	mov r0, r8
	bl DeleteLivePerformer
_022FDBBC:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x214
	blt _022FDB60
_022FDBD4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDBDC: .word ov11_023221A8
_022FDBE0: .word ov11_02324D04
_022FDBE4: .word ov11_023221D8
_022FDBE8: .word ov11_02322204
	arm_func_end ov11_022FDA7C

	arm_func_start DeleteLivePerformer
DeleteLivePerformer: ; 0x022FDBEC
	stmdb sp!, {r4, lr}
	ldr r1, _022FDC2C ; =ov11_02324D04
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x214
	smlabb r4, r2, r0, r1
	ldr r1, _022FDC30 ; =ov11_02322224
	mov r0, #1
	bl Debug_Print
	add r0, r4, #0x150
	bl ov11_022F6F9C
	add r0, r4, #0x3c
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FDC2C: .word ov11_02324D04
_022FDC30: .word ov11_02322224
	arm_func_end DeleteLivePerformer

	arm_func_start ov11_022FDC34
ov11_022FDC34: ; 0x022FDC34
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FDD8C ; =ov11_023221A8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FDD04
	ldr r0, _022FDD90 ; =ov11_02324D04
	mvn r5, #0
	ldr r7, [r0]
	ldr fp, _022FDD94 ; =ov11_023221D8
	sub r4, r5, #1
	mov r6, #1
_022FDC90:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FDCE8
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FDCE8
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FDCE8
	mov r1, #0
	add r0, r7, #0x3c
	bl ov11_022DCFC4
	strh r5, [r7, #0xa]
_022FDCE8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDC90
	b _022FDD84
_022FDD04:
	ldr r0, _022FDD90 ; =ov11_02324D04
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0]
	ldr r6, _022FDD94 ; =ov11_023221D8
	sub r4, r5, #1
	mov fp, r7
_022FDD20:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FDD6C
	ldrsh r2, [sl, #0xa]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	cmp sb, r4
	ldrnesb r0, [sl, #0xd]
	cmpne sb, r0
	bne _022FDD6C
	mov r1, fp
	add r0, sl, #0x3c
	bl ov11_022DCFC4
	strb r5, [sl, #0xd]
_022FDD6C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x214
	blt _022FDD20
_022FDD84:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDD8C: .word ov11_023221A8
_022FDD90: .word ov11_02324D04
_022FDD94: .word ov11_023221D8
	arm_func_end ov11_022FDC34

	arm_func_start SetAttributeBitfieldLivePerformer
SetAttributeBitfieldLivePerformer: ; 0x022FDD98
	stmdb sp!, {r3, lr}
	ldr r3, _022FDDD4 ; =ov11_02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x128]
	add r0, ip, #0x150
	orr r1, r2, r1
	str r1, [ip, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FDDD4: .word ov11_02324D04
	arm_func_end SetAttributeBitfieldLivePerformer

	arm_func_start ResetAttributeBitfieldLivePerformer
ResetAttributeBitfieldLivePerformer: ; 0x022FDDD8
	stmdb sp!, {r3, lr}
	ldr r3, _022FDE18 ; =ov11_02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x128]
	eor r0, r1, r3
	and r1, r2, r0
	add r0, ip, #0x150
	str r1, [ip, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FDE18: .word ov11_02324D04
	arm_func_end ResetAttributeBitfieldLivePerformer

	arm_func_start ov11_022FDE1C
ov11_022FDE1C: ; 0x022FDE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FDE78
	ldr r0, _022FDE80 ; =ov11_02324D04
	mov r6, #0
	ldr r5, [r0]
	b _022FDE70
_022FDE40:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FDE60
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FDE60:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x214
_022FDE70:
	cmp r6, #0x10
	blt _022FDE40
_022FDE78:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FDE80: .word ov11_02324D04
	arm_func_end ov11_022FDE1C

	arm_func_start ov11_022FDE84
ov11_022FDE84: ; 0x022FDE84
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FDEE0
	ldr r0, _022FDEE8 ; =ov11_02324D04
	mov r6, #0
	ldr r5, [r0]
	b _022FDED8
_022FDEA8:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FDEC8
	add r0, r5, #0x3c
	bl ov11_022DC9A0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FDEC8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x214
_022FDED8:
	cmp r6, #0x10
	blt _022FDEA8
_022FDEE0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FDEE8: .word ov11_02324D04
	arm_func_end ov11_022FDE84

	arm_func_start ov11_022FDEEC
ov11_022FDEEC: ; 0x022FDEEC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mvn r0, #0
	mov r5, r1
	mov r4, r2
	cmp r6, r0
	beq _022FDF48
	ldr r0, _022FDF50 ; =ov11_02324D04
	mov r8, #0
	ldr r7, [r0]
_022FDF14:
	ldrsh r0, [r7, #6]
	cmp r0, r6
	bne _022FDF30
	mov r1, r5
	mov r2, r4
	add r0, r7, #0x3c
	bl ov11_022DCCEC
_022FDF30:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDF14
_022FDF48:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FDF50: .word ov11_02324D04
	arm_func_end ov11_022FDEEC

	arm_func_start ov11_022FDF54
ov11_022FDF54: ; 0x022FDF54
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	mov sb, r0
	sub r0, r7, #2
	mov r8, r1
	cmp sb, r0
	beq _022FDFC8
	ldr r0, _022FDFD0 ; =ov11_02324D04
	mov r6, #0
	ldr r5, [r0]
	mov r4, r6
_022FDF80:
	ldrsh r0, [r5, #6]
	cmp r0, sb
	bne _022FDFB0
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	beq _022FDFB0
	mov r1, r8
	add r0, r5, #0x3c
	bl ov11_022DCA58
	cmp r0, #0
	moveq r7, r4
_022FDFB0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x214
	blt _022FDF80
_022FDFC8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FDFD0: .word ov11_02324D04
	arm_func_end ov11_022FDF54

	arm_func_start ov11_022FDFD4
ov11_022FDFD4: ; 0x022FDFD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FE0E4
	ldr r1, _022FE19C ; =ov11_02322244
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE1A0 ; =ov11_02324D04
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, r8
_022FE030:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FE0C8
	ldrsh r0, [r6, #0xa]
	cmp r0, sl
	bne _022FE0C8
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne r0, sb
	bne _022FE0C8
	ldr r1, _022FE1A4 ; =ov11_02322288
	mov r0, #1
	mov r2, r7
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r6, #6]
	add r0, sp, #4
	mov r1, #5
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FE0C8
	add r0, r6, #0x3c
	add r1, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022FE0C8
	add r0, r6, #0x2c
	add r1, r6, #0x34
	bl ov11_022F1F08
	add r0, r6, #0x3c
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x148]
_022FE0C8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x214
	blt _022FE030
	b _022FE190
_022FE0E4:
	ldr r1, _022FE1A8 ; =ov11_0232229C
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE1A0 ; =ov11_02324D04
	mvn r4, #1
	ldr r7, [r0]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022FE10C:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FE178
	cmp sb, r4
	ldrnesb r0, [r7, #0xd]
	cmpne r0, sb
	bne _022FE178
	ldr r1, _022FE1A4 ; =ov11_02322288
	mov r0, #1
	mov r2, r6
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r7, #6]
	add r0, sp, #4
	mov r1, #5
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FE178
	add r0, r7, #0x3c
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x148]
_022FE178:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x214
	blt _022FE10C
_022FE190:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE19C: .word ov11_02322244
_022FE1A0: .word ov11_02324D04
_022FE1A4: .word ov11_02322288
_022FE1A8: .word ov11_0232229C
	arm_func_end ov11_022FDFD4

	arm_func_start ov11_022FE1AC
ov11_022FE1AC: ; 0x022FE1AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FE264
	ldr r1, _022FE2F0 ; =ov11_023222E0
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE2F4 ; =ov11_02324D04
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022FE204:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FE248
	ldrsh r0, [r6, #0xa]
	cmp sl, r0
	bne _022FE248
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne sb, r0
	bne _022FE248
	ldr r1, _022FE2F8 ; =ov11_02322288
	mov r0, fp
	mov r2, r7
	bl Debug_Print
	add r0, r6, #0x3c
	bl ov11_022DCAE0
	orr r8, r8, r0
_022FE248:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x214
	blt _022FE204
	b _022FE2E8
_022FE264:
	ldr r1, _022FE2FC ; =ov11_02322324
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE2F4 ; =ov11_02324D04
	mvn r5, #0
	ldr sl, [r0]
	ldr fp, _022FE2F8 ; =ov11_02322288
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022FE290:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FE2D0
	ldrsb r0, [sl, #0xd]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022FE2D0
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl Debug_Print
	add r0, sl, #0x3c
	bl ov11_022DD080
	strb r5, [sl, #0xd]
	orr r8, r8, r0
_022FE2D0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add sl, sl, #0x214
	blt _022FE290
_022FE2E8:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE2F0: .word ov11_023222E0
_022FE2F4: .word ov11_02324D04
_022FE2F8: .word ov11_02322288
_022FE2FC: .word ov11_02322324
	arm_func_end ov11_022FE1AC

	arm_func_start ov11_022FE300
ov11_022FE300: ; 0x022FE300
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FE350 ; =ov11_02324D04
	mov r4, #0
	ldr r7, [r0]
	mov r6, r4
	mvn r5, #0
_022FE318:
	ldrsh r0, [r7, #6]
	cmp r0, r5
	beq _022FE330
	add r0, r7, #0x3c
	bl ov11_022DCB00
	orr r4, r4, r0
_022FE330:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x214
	blt _022FE318
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE350: .word ov11_02324D04
	arm_func_end ov11_022FE300

	arm_func_start UnlockPerformerRoutines
UnlockPerformerRoutines: ; 0x022FE354
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022FE3AC ; =ov11_02324D04
	mov r5, #0
	ldr r4, [r1]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022FE370:
	ldrsh r0, [r4, #6]
	cmp r0, r7
	beq _022FE38C
	mov r1, r6
	add r0, r4, #0x3c
	bl UnlockRoutine
	orr r5, r5, r0
_022FE38C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r4, r4, #0x214
	blt _022FE370
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FE3AC: .word ov11_02324D04
	arm_func_end UnlockPerformerRoutines

	arm_func_start ov11_022FE3B0
ov11_022FE3B0: ; 0x022FE3B0
	ldr r3, _022FE400 ; =ov11_02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022FE3F4
	ldr r2, [ip, #0x130]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x134]
	ldr r0, [ip, #0x1c]
	add r0, r2, r0
_022FE3F4:
	str r0, [r1, #4]
	ldrsh r0, [ip, #6]
	bx lr
	.align 2, 0
_022FE400: .word ov11_02324D04
	arm_func_end ov11_022FE3B0

	arm_func_start SetPositionLivePerformer
SetPositionLivePerformer: ; 0x022FE404
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r5, [r0, #0x18]
	ldr r3, [r1]
	ldr lr, [r0, #0x1c]
	ldr r2, [r1, #4]
	sub r4, r3, r5
	ldr r1, [r0, #0x2c]
	sub ip, r2, lr
	add r3, r3, r5
	add r2, r2, lr
	str r4, [sp, #8]
	str ip, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	cmp r4, r1
	blt _022FE46C
	ldr r1, [r0, #0x34]
	cmp r3, r1
	bge _022FE46C
	ldr r1, [r0, #0x30]
	cmp ip, r1
	blt _022FE46C
	ldr r1, [r0, #0x38]
	cmp r2, r1
	blt _022FE474
_022FE46C:
	mov r0, #0x40
	b _022FE488
_022FE474:
	str r4, [r0, #0x130]
	str ip, [r0, #0x134]
	str r3, [r0, #0x138]
	str r2, [r0, #0x13c]
	mov r0, #0
_022FE488:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetPositionLivePerformer
