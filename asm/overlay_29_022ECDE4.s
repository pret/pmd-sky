	.include "asm/macros.inc"
	.include "overlay_29_022ECDE4.inc"

	.text

	arm_func_start ov29_022ECDE4
ov29_022ECDE4: ; 0x022ECDE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _022ECF34 ; =DUNGEON_PTR
	mov r6, r1
	ldr r1, [r4]
	mov sb, r0
#ifdef JAPAN
	add r1, r1, #0x168
#else
	add r1, r1, #0x20c
#endif
	mov r0, r6
	mov r8, r2
	mov r7, r3
	add r4, r1, #0x2c800
	mov r5, #0
	bl EntityIsValid__022ECDC0
	cmp r0, #0
	beq _022ECE28
	ldr r0, [r6]
	cmp r0, #1
	ldreq r5, [r6, #0xb4]
_022ECE28:
	cmp r5, #0
	ldr r6, [r8, #0xb4]
	beq _022ECE44
	mov r0, r4
	mov r1, r5
	bl GetMonsterName
	b _022ECE6C
_022ECE44:
	ldr r1, _022ECF38 ; =ov29_0237C974
	ldrb r0, [r1]
	cmp r0, #0
	beq _022ECE60
	mov r0, r4
	bl strcpy
	b _022ECE6C
_022ECE60:
	ldr r1, _022ECF3C ; =0x00000A41
	mov r0, r4
	bl GetStringFromFileVeneer
_022ECE6C:
	mov r1, r6
	add r0, r4, #0x1e
	bl GetMonsterName
	cmp r7, #0
	moveq r0, #0
	streqb r0, [r4, #0x3c]
	beq _022ECE94
	mov r1, r7
	add r0, r4, #0x3c
	bl strcpy
_022ECE94:
	mov r1, r8
	add r0, r4, #0x70
	bl CreateMonsterSummaryFromMonster
	strh sb, [r4, #0x5a]
	ldrh r1, [r6, #0x62]
	ldr r0, _022ECF40 ; =0x000003E7
	ldr r3, _022ECF34 ; =DUNGEON_PTR
	strh r1, [r4, #0x5e]
	ldrh r1, [r6, #0x64]
	strh r1, [r4, #0x60]
	ldrh r1, [r6, #0x66]
	strh r1, [r4, #0x62]
	ldr r1, [r6, #0x20]
	str r1, [r4, #0x64]
	ldrb r1, [r6, #0xa]
	strb r1, [r4, #0x6e]
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x68]
	ldrb r1, [r6, #0x1a]
	ldr r0, _022ECF38 ; =ov29_0237C974
	mov r2, #0x28
	strb r1, [r4, #0x6a]
	ldrb r5, [r6, #0x1b]
	mov r1, #0
	strb r5, [r4, #0x6b]
	ldrb r5, [r6, #0x1c]
	strb r5, [r4, #0x6c]
	ldrb r5, [r6, #0x1d]
	strb r5, [r4, #0x6d]
	ldr r5, [r3]
	ldrb r3, [r5, #0x748]
	strb r3, [r4, #0x5c]
	ldrb r3, [r5, #0x749]
	strb r3, [r4, #0x5d]
	bl memset
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022ECF34: .word DUNGEON_PTR
_022ECF38: .word ov29_0237C974
#ifdef JAPAN
_022ECF3C: .word 0x00000889
#else
_022ECF3C: .word 0x00000A41
#endif
_022ECF40: .word 0x000003E7
	arm_func_end ov29_022ECDE4

	arm_func_start IsDungeonEndReasonFailure
IsDungeonEndReasonFailure: ; 0x022ECF44
	ldr r1, _022ECF6C ; =DUNGEON_PTR
	ldr r0, _022ECF70 ; =0x0002CA66
	ldr r2, [r1]
	ldr r1, _022ECF74 ; =0x00000279
	ldrsh r0, [r2, r0]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022ECF6C: .word DUNGEON_PTR
#ifdef JAPAN
_022ECF70: .word 0x0002C9C2
#else
_022ECF70: .word 0x0002CA66
#endif
_022ECF74: .word 0x00000279
	arm_func_end IsDungeonEndReasonFailure

	arm_func_start ov29_022ECF78
ov29_022ECF78: ; 0x022ECF78
	ldr r1, _022ECFAC ; =DUNGEON_PTR
	ldr r0, _022ECFB0 ; =0x0002CA66
	ldr r2, [r1]
	ldr r1, _022ECFB4 ; =0x0000027A
	ldrsh r2, [r2, r0]
	cmp r2, r1
	addne r0, r1, #3
	cmpne r2, r0
	addne r0, r1, #1
	cmpne r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022ECFAC: .word DUNGEON_PTR
#ifdef JAPAN
_022ECFB0: .word 0x0002C9C2
#else
_022ECFB0: .word 0x0002CA66
#endif
_022ECFB4: .word 0x0000027A
	arm_func_end ov29_022ECF78

	arm_func_start ov29_022ECFB8
ov29_022ECFB8: ; 0x022ECFB8
	stmdb sp!, {r4, lr}
	ldr r1, _022ED004 ; =DUNGEON_PTR
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _022ECFF8
#ifdef JAPAN
	add r0, r1, #0x168
#else
	add r0, r1, #0x20c
#endif
	add lr, r0, #0x2c800
	mov ip, #0xe
_022ECFDC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022ECFDC
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldmia sp!, {r4, pc}
_022ECFF8:
	mov r1, #0xe8
	bl MemZero
	ldmia sp!, {r4, pc}
	.align 2, 0
_022ED004: .word DUNGEON_PTR
	arm_func_end ov29_022ECFB8

	arm_func_start SetForcedLossReason
SetForcedLossReason: ; 0x022ED008
	ldr r1, _022ED018 ; =DUNGEON_PTR
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bx lr
	.align 2, 0
_022ED018: .word DUNGEON_PTR
	arm_func_end SetForcedLossReason

	arm_func_start GetForcedLossReason
GetForcedLossReason: ; 0x022ED01C
	ldr r0, _022ED02C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022ED02C: .word DUNGEON_PTR
	arm_func_end GetForcedLossReason

	arm_func_start ov29_022ED030
ov29_022ED030: ; 0x022ED030
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _022ED0A0 ; =ov29_02352690
	ldr r2, _022ED0A4 ; =0x00000401
	ldr r3, [r1, #4]
	ldr ip, [r1]
	str r3, [sp, #4]
	add r0, sp, #0
	mov r1, #4
	mov r3, #0x300
	str ip, [sp]
	bl LoadWteFromFileDirectory
	ldr r0, [sp, #4]
	mov r1, #0x400
	mov r2, #0x1d
	mov r3, #0
	bl ProcessWte
	ldr r1, [sp, #4]
	ldr r0, [sp]
	ldrh r2, [r1, #0xc]
	ldr r1, _022ED0A8 ; =ov29_0237C99C
	strh r2, [r1]
	bl sub_0201E080
	ldr r0, _022ED0AC ; =ov29_0235359C
	mov r1, #1
	strb r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022ED0A0: .word ov29_02352690
#ifdef JAPAN
_022ED0A4: .word 0x000003F5
#else
_022ED0A4: .word 0x00000401
#endif
_022ED0A8: .word ov29_0237C99C
_022ED0AC: .word ov29_0235359C
	arm_func_end ov29_022ED030

	arm_func_start ov29_022ED0B0
ov29_022ED0B0: ; 0x022ED0B0
	ldr r0, _022ED0C0 ; =ov29_0235359C
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_022ED0C0: .word ov29_0235359C
	arm_func_end ov29_022ED0B0

	arm_func_start ov29_022ED0C4
ov29_022ED0C4: ; 0x022ED0C4
	ldr r0, _022ED0D0 ; =ov29_0235359C
	ldrb r0, [r0, #4]
	bx lr
	.align 2, 0
_022ED0D0: .word ov29_0235359C
	arm_func_end ov29_022ED0C4

	arm_func_start ov29_022ED0D4
ov29_022ED0D4: ; 0x022ED0D4
	cmp r0, #0
	movlt r0, #0
	cmp r0, #0xff
	ldr r1, _022ED0F0 ; =ov29_0235359C
	movgt r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_022ED0F0: .word ov29_0235359C
	arm_func_end ov29_022ED0D4

	arm_func_start ov29_022ED0F4
ov29_022ED0F4: ; 0x022ED0F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022ED180 ; =ov29_0235359C
	mov r4, r0
	ldrb r7, [r1, #4]
	cmp r7, #0x80
	ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0x80
	mov r6, #0x80
	mov r5, #0x68
	ble _022ED174
	b _022ED144
_022ED120:
	sub r0, r7, r4
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x80
	movle r7, r6
	mov r0, r7
	bl ov29_022ED0D4
	mov r0, r5
	bl AdvanceFrame
_022ED144:
	cmp r7, #0x80
	bne _022ED120
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022ED150:
	add r0, r7, r4
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x80
	movge r7, r6
	mov r0, r7
	bl ov29_022ED0D4
	mov r0, r5
	bl AdvanceFrame
_022ED174:
	cmp r7, #0x80
	bne _022ED150
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022ED180: .word ov29_0235359C
	arm_func_end ov29_022ED0F4

	arm_func_start ov29_022ED184
ov29_022ED184: ; 0x022ED184
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x88
	ldr r3, _022ED7F0 ; =ov29_0235359C
	ldrb r3, [r3]
	cmp r3, #0
	beq _022ED7E8
	ldrb r4, [r2, #0x34]
	cmp r4, #0
	bne _022ED1D0
	ldrb r3, [r2, #0x23]
	cmp r3, #0
	ldreqb r3, [r2, #0x24]
	cmpeq r3, #0
	ldreqb r3, [r2, #0x30]
	cmpeq r3, #0
	movne r3, #1
	moveq r3, #0
	cmp r3, #0
	bne _022ED7E8
_022ED1D0:
	cmp r4, #0
	bne _022ED1E0
	cmp r1, #0xff
	bne _022ED370
_022ED1E0:
	add r0, sp, #0x48
	bl InitRender3dElement64
	ldr r1, _022ED7F4 ; =ov29_0237C99C
	ldr r0, _022ED7F8 ; =_020AFC70
	ldrh r2, [r1]
	mov r3, #5
	mov r1, #0x400
	strb r3, [sp, #0x84]
	strh r2, [sp, #0x5c]
	ldr r0, [r0]
	str r1, [sp, #0x68]
	ldr r1, [r0, #0xe0]
	ldr r0, _022ED7F0 ; =ov29_0235359C
	add r1, r1, #0x3a00
	str r1, [sp, #0x6c]
	ldrb r6, [r0, #4]
	mov r5, #0
	mov r3, #0x30
	mov r4, #4
	mov r1, #0x100
	mov r2, #0x22
	add r0, sp, #0x48
	strb r6, [sp, #0x77]
	strh r5, [sp, #0x5e]
	strh r5, [sp, #0x60]
	strh r4, [sp, #0x62]
	strh r4, [sp, #0x64]
	strh r3, [sp, #0x72]
	strb r2, [sp, #0x86]
	strh r5, [sp, #0x48]
	strh r5, [sp, #0x4a]
	strh r1, [sp, #0x4c]
	strh r5, [sp, #0x4e]
	strh r5, [sp, #0x50]
	strh r3, [sp, #0x52]
	strh r1, [sp, #0x54]
	strh r3, [sp, #0x56]
	bl sub_0201F2A0
	mov r4, r5
	mov r3, #0x90
	mov r2, #0x100
	mov r1, #0xc0
	add r0, sp, #0x48
	strh r4, [sp, #0x48]
	strh r3, [sp, #0x4a]
	strh r2, [sp, #0x4c]
	strh r3, [sp, #0x4e]
	strh r4, [sp, #0x50]
	strh r1, [sp, #0x52]
	strh r2, [sp, #0x54]
	strh r1, [sp, #0x56]
	bl sub_0201F2A0
	mov r3, #0x30
	mov r2, #0x50
	mov r1, #0x90
	add r0, sp, #0x48
	strh r4, [sp, #0x48]
	strh r3, [sp, #0x4a]
	strh r2, [sp, #0x4c]
	strh r3, [sp, #0x4e]
	strh r4, [sp, #0x50]
	strh r1, [sp, #0x52]
	strh r2, [sp, #0x54]
	strh r1, [sp, #0x56]
	bl sub_0201F2A0
	mov r3, #0xb0
	mov r2, #0x30
	mov r1, #0x100
	mov r0, #0x90
	strh r3, [sp, #0x48]
	strh r2, [sp, #0x4a]
	strh r1, [sp, #0x4c]
	strh r2, [sp, #0x4e]
	strh r3, [sp, #0x50]
	strh r0, [sp, #0x52]
	strh r1, [sp, #0x54]
	strh r0, [sp, #0x56]
	add r0, sp, #0x48
	bl sub_0201F2A0
	mov r6, #0x50
	mov r5, #0x30
	mov r4, #0xb0
	mov r3, #0x90
	mov r2, #0
	mov r1, #0x60
	add r0, sp, #0x48
	strh r6, [sp, #0x48]
	strh r5, [sp, #0x4a]
	strh r4, [sp, #0x4c]
	strh r5, [sp, #0x4e]
	strh r6, [sp, #0x50]
	strh r3, [sp, #0x52]
	strh r4, [sp, #0x54]
	strh r3, [sp, #0x56]
	strh r2, [sp, #0x5e]
	strh r2, [sp, #0x60]
	strh r1, [sp, #0x62]
	strh r1, [sp, #0x64]
	bl sub_0201F2A0
	b _022ED7E8
_022ED370:
	ldr r6, _022ED7FC ; =ov29_02352698
	add r5, sp, #0
	mov r4, #4
_022ED37C:
	ldrh r3, [r6], #2
	subs r4, r4, #1
	strh r3, [r5], #2
	bne _022ED37C
	mov r3, #0x1c
	smlabb r3, r1, r3, r0
	ldr r1, [r3, #0xc]
	add r0, sp, #8
	strh r1, [sp]
	ldr r1, [r3, #0x10]
	strh r1, [sp, #2]
	ldr r1, [r3, #0x14]
	strh r1, [sp, #4]
	ldr r1, [r3, #0x18]
	strh r1, [sp, #6]
	ldrsh r5, [r2, #0xa]
	ldrsh r4, [r2, #8]
	bl InitRender3dElement64
	ldrsh r3, [sp, #2]
	ldrsh r6, [sp, #4]
	ldrsh lr, [sp]
	sub r3, r3, r5
	ldrsh r2, [sp, #6]
	mov r1, #5
	mov r0, #0x400
	ldr ip, _022ED7F8 ; =_020AFC70
	mov r3, r3, lsl #0x10
	sub r6, r6, r4
	sub lr, lr, r4
	mov r4, r3, asr #0x10
	sub r5, r2, r5
	mov r3, r6, lsl #0x10
	mov r6, r5, lsl #0x10
	ldr r7, _022ED7F4 ; =ov29_0237C99C
	strb r1, [sp, #0x44]
	ldrh r1, [r7]
	ldr r5, [ip]
	str r0, [sp, #0x28]
	ldr r0, [r5, #0xe0]
	mov r2, lr, lsl #0x10
	add r5, r0, #0x3a00
	str r5, [sp, #0x2c]
	strh r1, [sp, #0x1c]
	ldr r0, _022ED7F0 ; =ov29_0235359C
	mov r1, #0
	ldrb ip, [r0, #4]
	mov r7, #4
	mov r5, #0x30
	mov r0, #0x22
	strh r5, [sp, #0x32]
	strb ip, [sp, #0x37]
	strh r1, [sp, #0x1e]
	strh r1, [sp, #0x20]
	strh r7, [sp, #0x22]
	strh r7, [sp, #0x24]
	strb r0, [sp, #0x46]
	cmp r4, #0
	mov r5, r2, asr #0x10
	mov r7, r3, asr #0x10
	mov r6, r6, asr #0x10
	ble _022ED4A4
	mov r0, r4, lsl #0x10
	mov r2, r0, asr #0x10
	mov r3, #0x100
	add r0, sp, #8
	strh r1, [sp, #8]
	strh r1, [sp, #0xa]
	strh r3, [sp, #0xc]
	strh r1, [sp, #0xe]
	strh r1, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r3, [sp, #0x14]
	strh r2, [sp, #0x16]
	bl sub_0201F2A0
_022ED4A4:
	cmp r6, #0
	movlt r0, #0
	movge r0, r6
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	rsb r0, r1, #0xc0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	ble _022ED508
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	mov ip, #0
	mov r3, #0x100
	add r0, sp, #8
	strh ip, [sp, #8]
	strh r1, [sp, #0xa]
	strh r3, [sp, #0xc]
	strh r1, [sp, #0xe]
	strh ip, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r3, [sp, #0x14]
	strh r2, [sp, #0x16]
	bl sub_0201F2A0
_022ED508:
	cmp r4, #0
	movlt r0, #0
	movge r0, r4
	mov r0, r0, lsl #0x10
	sub r1, r6, r0, asr #16
	cmp r1, #0xc0
	movgt r1, #0xc0
	mov ip, r0, asr #0x10
	cmp r5, #0
	mov r0, r1, lsl #0x10
	ble _022ED574
	add r1, ip, r0, asr #16
	mov r0, r5, lsl #0x10
	mov r2, r0, asr #0x10
	mov r3, #0
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, sp, #8
	strh r3, [sp, #8]
	strh ip, [sp, #0xa]
	strh r2, [sp, #0xc]
	strh ip, [sp, #0xe]
	strh r3, [sp, #0x10]
	strh r1, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r1, [sp, #0x16]
	bl sub_0201F2A0
_022ED574:
	cmp r4, #0
	movlt r0, #0
	movge r0, r4
	mov r0, r0, lsl #0x10
	rsb r1, r7, #0x100
	mov r2, r1, lsl #0x10
	sub r3, r6, r0, asr #16
	cmp r3, #0xc0
	mov r2, r2, asr #0x10
	movgt r3, #0xc0
	mov r1, r0, asr #0x10
	cmp r2, #0
	mov r0, r3, lsl #0x10
	ble _022ED5EC
	add r3, r7, r2
	add r2, r1, r0, asr #16
	mov r0, r3, lsl #0x10
	mov r3, r0, asr #0x10
	mov r0, r2, lsl #0x10
	mov r2, r0, asr #0x10
	add r0, sp, #8
	strh r7, [sp, #8]
	strh r1, [sp, #0xa]
	strh r3, [sp, #0xc]
	strh r1, [sp, #0xe]
	strh r7, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r3, [sp, #0x14]
	strh r2, [sp, #0x16]
	bl sub_0201F2A0
_022ED5EC:
	mvn r0, #0x1f
	cmp r5, r0
	cmpgt r4, r0
	ble _022ED660
	cmp r5, #0x120
	cmplt r4, #0xe0
	bge _022ED660
	add r0, r5, #0x20
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	mov ip, #0
	mov r3, #0x30
	add r1, r4, #0x20
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, sp, #8
	strh ip, [sp, #0x1e]
	strh ip, [sp, #0x20]
	strh r3, [sp, #0x22]
	strh r3, [sp, #0x24]
	strh r5, [sp, #8]
	strh r4, [sp, #0xa]
	strh r2, [sp, #0xc]
	strh r4, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r1, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r1, [sp, #0x16]
	bl sub_0201F2A0
_022ED660:
	sub r7, r7, #0x20
	mov r0, r7, lsl #0x10
	mvn r1, #0x1f
	cmp r1, r0, asr #16
	mov r2, r0, asr #0x10
	bge _022ED6E4
	cmp r4, r1
	ble _022ED6E4
	cmp r2, #0x120
	cmplt r4, #0xe0
	bge _022ED6E4
	add r0, r2, #0x20
	mov r0, r0, lsl #0x10
	mov ip, r0, asr #0x10
	mov r1, #0x30
	add r3, r4, #0x20
	mov r0, r3, lsl #0x10
	mov r3, r0, asr #0x10
	mov lr, #0
	add r0, sp, #8
	strh r1, [sp, #0x1e]
	strh lr, [sp, #0x20]
	strh r1, [sp, #0x22]
	strh r1, [sp, #0x24]
	strh r2, [sp, #8]
	strh r4, [sp, #0xa]
	strh ip, [sp, #0xc]
	strh r4, [sp, #0xe]
	strh r2, [sp, #0x10]
	strh r3, [sp, #0x12]
	strh ip, [sp, #0x14]
	strh r3, [sp, #0x16]
	bl sub_0201F2A0
_022ED6E4:
	sub r4, r6, #0x20
	mov r0, r4, lsl #0x10
	mvn r2, #0x1f
	mov r1, r0, asr #0x10
	cmp r5, r2
	cmpgt r1, r2
	ble _022ED764
	cmp r5, #0x120
	cmplt r1, #0xe0
	bge _022ED764
	add r0, r5, #0x20
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	mov r6, #0x30
	add r2, r1, #0x20
	mov r0, r2, lsl #0x10
	mov r2, r0, asr #0x10
	mov ip, #0
	add r0, sp, #8
	strh ip, [sp, #0x1e]
	strh r6, [sp, #0x20]
	strh r6, [sp, #0x22]
	strh r6, [sp, #0x24]
	strh r5, [sp, #8]
	strh r1, [sp, #0xa]
	strh r3, [sp, #0xc]
	strh r1, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r3, [sp, #0x14]
	strh r2, [sp, #0x16]
	bl sub_0201F2A0
_022ED764:
	mov r0, r7, lsl #0x10
	mov r1, r4, lsl #0x10
	mvn r2, #0x1f
	cmp r2, r0, asr #16
	mov r5, r0, asr #0x10
	mov r4, r1, asr #0x10
	bge _022ED7E8
	cmp r4, r2
	ble _022ED7E8
	cmp r5, #0x120
	cmplt r4, #0xe0
	bge _022ED7E8
	add r0, r5, #0x20
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	mov r3, #0x30
	add r1, r4, #0x20
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, sp, #8
	strh r3, [sp, #0x1e]
	strh r3, [sp, #0x20]
	strh r3, [sp, #0x22]
	strh r3, [sp, #0x24]
	strh r5, [sp, #8]
	strh r4, [sp, #0xa]
	strh r2, [sp, #0xc]
	strh r4, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r1, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r1, [sp, #0x16]
	bl sub_0201F2A0
_022ED7E8:
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022ED7F0: .word ov29_0235359C
_022ED7F4: .word ov29_0237C99C
_022ED7F8: .word _020AFC70
_022ED7FC: .word ov29_02352698
	arm_func_end ov29_022ED184

	arm_func_start ov29_022ED800
ov29_022ED800: ; 0x022ED800
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r3, r0, #0xe900
	ldrh r3, [r3, #0xec]
	tst r3, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x224
	add r0, r0, #0xac00
	bl ov29_022ED184
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022ED800

	arm_func_start ov29_022ED82C
ov29_022ED82C: ; 0x022ED82C
	stmdb sp!, {r4, lr}
#if defined(EUROPE)
	add r1, r1, #0xc3
	add r1, r1, #0x3400
#elif defined(JAPAN)
	add r1, r1, #0x46
	add r1, r1, #0x4700
#else
	add r1, r1, #0xc1
	add r1, r1, #0x3400
#endif
	mov r1, r1, lsl #0x10
	mov r4, r0
	mov r0, r1, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022ED82C

	arm_func_start BindTrapToTile
BindTrapToTile: ; 0x022ED858
	cmp r1, #0
	strne r1, [r0, #0x10]
	strneb r2, [r1, #0x20]
	bx lr
	arm_func_end BindTrapToTile

	arm_func_start AreLateGameTrapsEnabledWrapper
AreLateGameTrapsEnabledWrapper: ; 0x022ED868
	ldr r0, _022ED880 ; =DUNGEON_PTR
	ldr ip, _022ED884 ; =AreLateGameTrapsEnabled
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bx ip
	.align 2, 0
_022ED880: .word DUNGEON_PTR
_022ED884: .word AreLateGameTrapsEnabled
	arm_func_end AreLateGameTrapsEnabledWrapper

	arm_func_start ov29_022ED888
ov29_022ED888: ; 0x022ED888
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _022ED96C ; =ov29_023526A0
	mov sl, #0
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	add r6, sp, #4
	strh r1, [sp]
	strh r0, [sp, #2]
	mov r4, #6
	mov fp, #2
	mov r7, sl
_022ED8B8:
	mov r0, sl, lsl #0x10
	mov r8, r7
	mov r5, r0, asr #0x10
_022ED8C4:
	mov r0, r8
	mov r1, sl
	bl GetTileSafe
	mov sb, r0
	ldrh r0, [sb, #2]
	tst r0, #4
	beq _022ED94C
	strh r8, [sp, #4]
	strh r5, [sp, #6]
	ldrh r0, [sb, #2]
	tst r0, #0x40
	movne r0, r4
	bne _022ED8FC
	bl ov29_022E7A30
_022ED8FC:
	cmp r0, #0x11
	mov r1, r6
	bne _022ED92C
	mov r2, fp
	mov r3, #0
	bl SpawnTrap
	movs r1, r0
	beq _022ED94C
	mov r0, sb
	mov r2, #1
	bl BindTrapToTile
	b _022ED94C
_022ED92C:
	mov r2, #0
	mov r3, r2
	bl SpawnTrap
	movs r1, r0
	beq _022ED94C
	mov r0, sb
	mov r2, #0
	bl BindTrapToTile
_022ED94C:
	add r8, r8, #1
	cmp r8, #0x38
	blt _022ED8C4
	add sl, sl, #1
	cmp sl, #0x20
	blt _022ED8B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ED96C: .word ov29_023526A0
	arm_func_end ov29_022ED888

	arm_func_start SpawnEnemyTrapAtPos
SpawnEnemyTrapAtPos: ; 0x022ED970
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r1
	mov r6, r2
	mov r8, r0
	mov r0, r7
	mov r1, r6
	mov r5, r3
	bl GetTileSafe
	mov r4, r0
	add r1, sp, #0
	mov r0, r8
	mov r3, r5
	mov r2, #0
	strh r7, [sp]
	strh r6, [sp, #2]
	bl SpawnTrap
	movs r1, r0
	beq _022ED9C8
	ldrb r2, [sp, #0x20]
	mov r0, r4
	bl BindTrapToTile
_022ED9C8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end SpawnEnemyTrapAtPos

	arm_func_start ov29_022ED9D0
ov29_022ED9D0: ; 0x022ED9D0
#ifdef JAPAN
#define OV29_022ED9D0_OFFSET -0xA4
#else
#define OV29_022ED9D0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _022EDBB8 ; =DUNGEON_PTR
	ldr r1, _022EDBBC ; =0x0001A21E
	ldr r0, [r0]
	ldrsh r2, [r0, r1]
	add r1, r0, #0x1a000
	ldrb r8, [r1, #0x244 + OV29_022ED9D0_OFFSET]
	sub sb, r2, #5
	b _022EDB9C
_022ED9F8:
	ldr r1, _022EDBC0 ; =0x0001A21C
	mov r2, #0x18
	ldrsh r0, [r0, r1]
	mul sl, sb, r2
	sub r7, r0, #6
	mov r0, r1
	add fp, r0, #8
	ldr r0, _022EDBC4 ; =0x0000013E
	ldr r6, _022EDBC8 ; =ov29_0237C864
	sub r0, r0, #0x1f
	str r0, [sp, #4]
	mov r0, r1
	add r5, r0, #0xa
	ldr r4, _022EDBCC ; =0xFFFF000F
	b _022EDB7C
_022EDA34:
	mov r0, #0
	str r0, [sp]
	mov r0, r7
	mov r1, sb
	bl GetTile
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _022EDA74
	ldr r1, [r2]
	cmp r1, #2
	bne _022EDA74
	ldrb r1, [r2, #0x20]
	cmp r1, #0
	cmpeq r8, #0
	movne r1, #1
	strne r1, [sp]
_022EDA74:
	ldrh r0, [r0]
	tst r0, #0x200
	movne r0, #1
	strne r0, [sp]
	ldr r0, [sp]
	cmp r0, #0
	beq _022EDB78
	ldr r0, _022EDBB8 ; =DUNGEON_PTR
	ldr r3, [r0]
	mov r0, #0x18
	mul r2, r7, r0
	ldrsh r1, [r3, fp]
	ldrsh r0, [r3, r5]
	sub r1, r2, r1
	sub r2, sl, r0
	cmp r1, r4, asr #11
	cmpge r2, r4, asr #11
	blt _022EDB78
	ldr r0, [sp, #4]
	cmp r1, r0
	cmple r2, #0xe0
	bgt _022EDB78
	ldrh ip, [r6]
	add r0, r2, #4
	add r1, r1, #4
	bic ip, ip, #0xc00
	strh ip, [r6]
	ldrh ip, [r6, #6]
	and r3, r1, r4, lsr #23
	mov r0, r0, lsl #0x14
	and ip, ip, r4
	strh ip, [r6, #6]
	ldrh ip, [r6, #6]
	mov r1, r6
	mov r2, #0
	orr r0, ip, r0, lsr #16
	strh r0, [r6, #6]
	ldrh r0, [r6, #2]
	and r0, r0, r4, asr #7
	strh r0, [r6, #2]
	ldrh r0, [r6, #2]
	orr r0, r0, r3
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	bic r0, r0, #0xc00
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	orr r0, r0, #0xc00
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	bic r0, r0, #0xf000
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	orr r0, r0, #0xa000
	strh r0, [r6, #4]
	ldrh r0, [r6, #4]
	and r0, r0, r4, asr #6
	strh r0, [r6, #4]
	ldrh r3, [r6, #4]
	orr r0, r3, #0x3e
	orr r0, r0, #0x100
	strh r0, [r6, #4]
	ldr r0, _022EDBD0 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201B9F8
_022EDB78:
	add r7, r7, #1
_022EDB7C:
	ldr r0, _022EDBB8 ; =DUNGEON_PTR
	ldr r1, _022EDBC0 ; =0x0001A21C
	ldr r0, [r0]
	ldrsh r1, [r0, r1]
	add r1, r1, #6
	cmp r7, r1
	blt _022EDA34
	add sb, sb, #1
_022EDB9C:
	ldr r1, _022EDBBC ; =0x0001A21E
	ldrsh r1, [r0, r1]
	add r1, r1, #5
	cmp sb, r1
	blt _022ED9F8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EDBB8: .word DUNGEON_PTR
_022EDBBC: .word 0x0001A21E + OV29_022ED9D0_OFFSET
_022EDBC0: .word 0x0001A21C + OV29_022ED9D0_OFFSET
_022EDBC4: .word 0x0000013E
_022EDBC8: .word ov29_0237C864
_022EDBCC: .word 0xFFFF000F
_022EDBD0: .word _020AFC4C
	arm_func_end ov29_022ED9D0

	arm_func_start PrepareTrapperTrap
PrepareTrapperTrap: ; 0x022EDBD4
#ifdef JAPAN
#define PREPARE_TRAPPER_TRAP_OFFSET -0xA4
#else
#define PREPARE_TRAPPER_TRAP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _022EDC28 ; =DUNGEON_PTR
	ldrsh r5, [r0]
	ldr r3, _022EDC2C ; =0x00012AAA
	ldr r4, [lr]
	add ip, r3, #2
	strh r5, [r4, r3]
	ldrsh r4, [r0, #2]
	ldr r0, [lr]
	mov r3, #1
	strh r4, [r0, ip]
	ldr r0, [lr]
	add r0, r0, #0x12000
	strb r1, [r0, #0xaae + PREPARE_TRAPPER_TRAP_OFFSET]
	ldr r0, [lr]
	add r0, r0, #0x12000
	strb r2, [r0, #0xaaf + PREPARE_TRAPPER_TRAP_OFFSET]
	ldr r0, [lr]
	add r0, r0, #0x12000
	strb r3, [r0, #0xaa8 + PREPARE_TRAPPER_TRAP_OFFSET]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDC28: .word DUNGEON_PTR
_022EDC2C: .word 0x00012AAA + PREPARE_TRAPPER_TRAP_OFFSET
	arm_func_end PrepareTrapperTrap

	arm_func_start ov29_022EDC30
ov29_022EDC30: ; 0x022EDC30
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldrsh r0, [r1]
	ldrsh r1, [r1, #2]
	bl GetTileSafe
	ldrh r2, [r0]
	tst r2, #0x200
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst r2, #8
	movne r0, #0
	ldmneia sp!, {r3, pc}
	tst r2, #0x20
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _022EDCB4
	ldr r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_022EDCB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022EDC30

	arm_func_start TrySpawnTrap
TrySpawnTrap: ; 0x022EDCBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	ldrsh r0, [r8]
	ldrsh r1, [r8, #2]
	mov r6, r2
	mov r5, r3
	bl GetTileSafe
	mov r4, r0
	cmp r7, #0x19
	blo _022EDD14
	mov sb, #0
	b _022EDD04
_022EDCF0:
	bl ov29_022E7A30
	mov r7, r0
	cmp r7, #0x11
	bne _022EDD0C
	add sb, sb, #1
_022EDD04:
	cmp sb, #0x1e
	blt _022EDCF0
_022EDD0C:
	cmp sb, #0x1e
	moveq r7, #0x10
_022EDD14:
	ldrh r1, [r4]
	tst r1, #0x200
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r1, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r1, #0x20
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrh r0, [r4]
	and r0, r0, #3
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022EDDA0
	ldr r1, [r0]
	cmp r1, #2
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetTrapInfo
	strb r7, [r0]
	ldr r0, [r4, #0x10]
	bl GetTrapInfo
	strb r6, [r0, #1]
	ldr r1, [r4, #0x10]
	mov r0, #1
	strb r5, [r1, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022EDDA0:
	mov r0, r7
	mov r1, r8
	mov r2, r6
	mov r3, #0
	bl SpawnTrap
	movs r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	mov r2, r5
	bl BindTrapToTile
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end TrySpawnTrap

	arm_func_start TrySpawnTrapperTrap
TrySpawnTrapperTrap: ; 0x022EDDD4
#ifdef JAPAN
#define TRY_SPAWN_TRAPPER_TRAP_OFFSET -0xA4
#else
#define TRY_SPAWN_TRAPPER_TRAP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022EDE6C ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x12000
	ldrb r2, [r0, #0xaa8 + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, #0
	strb r2, [r0, #0xaa8 + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	ldr r3, [r1]
	ldr r0, _022EDE70 ; =0x00012AAA
	add r2, r3, #0x12000
	ldrb r1, [r2, #0xaae + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	ldrb r2, [r2, #0xaaf + TRY_SPAWN_TRAPPER_TRAP_OFFSET]
	add r0, r3, r0
	mov r3, #1
	bl TrySpawnTrap
	movs r4, r0
	ldr r1, _022EDE70 ; =0x00012AAA
	beq _022EDE48
	ldr r0, _022EDE6C ; =DUNGEON_PTR
	ldr r2, _022EDE74 ; =0x00000E57
	ldr r3, [r0]
	mov r0, r5
	add r1, r3, r1
	bl LogMessageByIdWithPopupCheckUserUnknown
	b _022EDE60
_022EDE48:
	ldr r0, _022EDE6C ; =DUNGEON_PTR
	ldr r2, _022EDE78 ; =0x00000E58
	ldr r3, [r0]
	mov r0, r5
	add r1, r3, r1
	bl LogMessageByIdWithPopupCheckUserUnknown
_022EDE60:
	bl UpdateTrapsVisibility
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDE6C: .word DUNGEON_PTR
_022EDE70: .word 0x00012AAA + TRY_SPAWN_TRAPPER_TRAP_OFFSET
#ifdef JAPAN
_022EDE74: .word 0x00000B99
_022EDE78: .word 0x00000B9A
#else
_022EDE74: .word 0x00000E57
_022EDE78: .word 0x00000E58
#endif
	arm_func_end TrySpawnTrapperTrap

	arm_func_start TryRemoveTrap
TryRemoveTrap: ; 0x022EDE7C
	stmdb sp!, {r4, lr}
	mov r2, r0
	mov r4, r1
	ldrsh r0, [r2]
	ldrsh r1, [r2, #2]
	bl GetTileSafe
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _022EDED4
	ldr r1, [r2]
	cmp r1, #2
	bne _022EDECC
	mov r1, #0
	str r1, [r2]
	str r1, [r0, #0x10]
	cmp r4, #0
	beq _022EDEC4
	bl UpdateTrapsVisibility
_022EDEC4:
	mov r0, #1
	ldmia sp!, {r4, pc}
_022EDECC:
	mov r0, #0
	ldmia sp!, {r4, pc}
_022EDED4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end TryRemoveTrap

	arm_func_start ov29_022EDEDC
ov29_022EDEDC: ; 0x022EDEDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTile
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _022EDF50
	ldr r0, [r1]
	cmp r0, #2
	bne _022EDF48
	ldr r0, _022EDF58 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	bne _022EDF34
	mov r0, #1
	strb r0, [r1, #0x20]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl DrawMinimapTile
_022EDF34:
	cmp r4, #0
	beq _022EDF40
	bl UpdateTrapsVisibility
_022EDF40:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022EDF48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_022EDF50:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDF58: .word DUNGEON_PTR
	arm_func_end ov29_022EDEDC

	arm_func_start ov29_022EDF5C
ov29_022EDF5C: ; 0x022EDF5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_02024FC8
	bl ov29_0234B034
	add r0, r0, r5, lsl #2
	str r4, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022EDF5C

	arm_func_start ov29_022EDF7C
ov29_022EDF7C: ; 0x022EDF7C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl sub_02024FC8
	add r0, r6, r5, lsl #2
	str r4, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022EDF7C

	arm_func_start TryTriggerTrap
TryTriggerTrap: ; 0x022EDFA0
#ifdef JAPAN
#define TRY_TRIGGER_TRAP_OFFSET -4
#else
#define TRY_TRIGGER_TRAP_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x14 + TRY_TRIGGER_TRAP_OFFSET
	mov sb, r1
	mov sl, r0
	ldrsh r0, [sb]
	ldrsh r1, [sb, #2]
	mov fp, r2
	mov r7, r3
	bl GetTileSafe
	ldr r4, [r0, #0x10]
	str r0, [sp, #0x10 + TRY_TRIGGER_TRAP_OFFSET]
	cmp r4, #0
	beq _022EE2F4
	ldr r0, [r4]
	cmp r0, #2
	bne _022EE2F4
	mov r0, r4
	bl GetTrapInfo
	mov r6, r0
	ldrb r1, [r6]
	mov r0, #0
	bl ov29_022EDF5C
	ldr r0, [sp, #0x10 + TRY_TRIGGER_TRAP_OFFSET]
	ldr r5, [r0, #0xc]
	cmp r5, #0
	ldrne r0, [r5]
	cmpne r0, #1
	ldrb r0, [r4, #0x20]
	movne r5, #0
	cmp r5, #0
	str r0, [sp, #0xc + TRY_TRIGGER_TRAP_OFFSET]
	mov r0, #1
	strb r0, [r4, #0x20]
	beq _022EE1D8
	mov r0, r5
	bl ov29_022F9840
	cmp r7, #0
	ldrneb r0, [r6]
	cmpne r0, #0x11
	beq _022EE148
	cmp r0, #0x17
	mov r8, #0
	moveq r7, #0x64
	beq _022EE05C
	mov r0, #0x64
	bl DungeonRandInt
	mov r7, r0
_022EE05C:
	mov r0, r5
	mov r1, #0x23
	bl ItemIsActive__022EE318
	cmp r0, #0
	ldrne r8, _022EE2FC ; =0x00000E59
	bne _022EE0C8
	mov r0, r5
	mov r1, #0x26
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022EE0C8
	mov r0, #0x32
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _022EE0C8
	mov r1, sl
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldrne r8, _022EE300 ; =0x00000E5B
	bne _022EE0C8
	mov r0, sb
	mov r1, #1
	bl TryRemoveTrap
	ldr r8, _022EE304 ; =0x00000E5A
_022EE0C8:
	ldr r0, [sp, #0xc + TRY_TRIGGER_TRAP_OFFSET]
	cmp r0, #1
	beq _022EE0EC
	ldr r0, _022EE308 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a0]
#else
	ldrb r0, [r0, #0x244]
#endif
	cmp r0, #0
	beq _022EE100
_022EE0EC:
	cmp r7, #0
	bge _022EE110
	cmp r8, #0
	ldreq r8, _022EE30C ; =0x00000E5C
	b _022EE110
_022EE100:
	cmp r7, #0xf
	bge _022EE110
	cmp r8, #0
	ldreq r8, _022EE30C ; =0x00000E5C
_022EE110:
	cmp r8, #0
	beq _022EE1D8
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	beq _022EE12C
	bl UpdateTrapsVisibility
_022EE12C:
	mov r0, sl
	mov r1, r5
	mov r2, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp fp, #0
	bne _022EE1D8
	b _022EE2F4
_022EE148:
	mov r0, r5
	mov r1, #0x26
	mov r7, #0
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022EE1D8
	ldr r0, _022EE310 ; =TRAP_BUSTER_ACTIVATION_CHANCE
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _022EE1A4
	mov r1, sl
	mov r0, #1
	mov r2, r7
	bl SubstitutePlaceholderStringTags
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldrne r7, _022EE300 ; =0x00000E5B
	bne _022EE1A4
	mov r0, sb
	mov r1, #1
	bl TryRemoveTrap
	ldr r7, _022EE304 ; =0x00000E5A
_022EE1A4:
	cmp r7, #0
	beq _022EE1D8
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	beq _022EE1C0
	bl UpdateTrapsVisibility
_022EE1C0:
	mov r0, sl
	mov r1, r5
	mov r2, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp fp, #0
	beq _022EE2F4
_022EE1D8:
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	beq _022EE264
	mov r0, #0
	mov r1, #0x11c
	bl ov29_022E56A0
	bl UpdateTrapsVisibility
	ldrb r2, [r6]
	mov r0, sl
	mov r1, sb
	bl ov29_022E58B0
	mov r0, r4
	bl GetTrapInfo
	mov r6, r0
	mov r0, #0
	ldrb r1, [r6]
	bl ov29_022EDF5C
	ldr r0, _022EE308 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	beq _022EE248
	ldr r1, _022EE314 ; =0x00000E5D
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022EE264
_022EE248:
	ldrb r1, [r6]
	mov r0, sl
#ifdef JAPAN
	add r1, r1, #0x53
	add r1, r1, #0x600
#else
	add r1, r1, #0x51
	add r1, r1, #0xb00
#endif
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl LogMessageByIdWithPopupCheckUser
_022EE264:
	cmp r5, #0
	beq _022EE29C
	ldrb r0, [r6, #1]
	cmp r0, #2
	bne _022EE288
	mov r0, r5
	mov r1, #1
	bl UpdateShopkeeperModeAfterTrap
	b _022EE29C
_022EE288:
	cmp r0, #1
	bne _022EE29C
	mov r0, r5
	mov r1, #0
	bl UpdateShopkeeperModeAfterTrap
_022EE29C:
	str sb, [sp]
	ldrb r6, [r6]
#ifdef JAPAN
	ldr r3, [sp, #0xc]
	mov r0, r4
#else
	mov r0, r4
	ldr r3, [sp, #0x10]
#endif
	mov r1, sl
	mov r2, r5
	str r6, [sp, #4]
#ifndef JAPAN
	mov r4, #0
	str r4, [sp, #8]
#endif
	bl ApplyTrapEffect
	mov r4, r0
	mov r0, r5
	bl EntityIsValid__022EE348
	cmp r0, #0
	beq _022EE2E0
	mov r0, r5
	bl EnemyEvolution
_022EE2E0:
	cmp r4, #0
	beq _022EE2F4
	mov r0, sb
	mov r1, #1
	bl TryRemoveTrap
_022EE2F4:
	add sp, sp, #0x14 + TRY_TRIGGER_TRAP_OFFSET
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
#ifdef JAPAN
#define TRY_TRIGGER_TRAP_DATA_OFFSET -0x2BE
#else
#define TRY_TRIGGER_TRAP_DATA_OFFSET 0
#endif
_022EE2FC: .word 0x00000E59 + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE300: .word 0x00000E5B + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE304: .word 0x00000E5A + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE308: .word DUNGEON_PTR
_022EE30C: .word 0x00000E5C + TRY_TRIGGER_TRAP_DATA_OFFSET
_022EE310: .word TRAP_BUSTER_ACTIVATION_CHANCE
_022EE314: .word 0x00000E5D + TRY_TRIGGER_TRAP_DATA_OFFSET
	arm_func_end TryTriggerTrap
