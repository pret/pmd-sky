	.include "asm/macros.inc"
	.include "overlay_29_022ED030.inc"

	.text

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

	arm_func_start GetTrapName
GetTrapName: ; 0x022ED82C
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
	arm_func_end GetTrapName

	arm_func_start BindTrapToTile
BindTrapToTile: ; 0x022ED858
	cmp r1, #0
	strne r1, [r0, #0x10]
	strneb r2, [r1, #0x20]
	bx lr
	arm_func_end BindTrapToTile
