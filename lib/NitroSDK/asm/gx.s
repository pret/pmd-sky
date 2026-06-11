	.include "asm/macros.inc"
	.include "include/gx.inc"

	.text

    arm_func_start GX_Init
GX_Init: ; 0x02076074
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0207619C ; =0x04000304
	ldr r0, _020761A0 ; =0xFFFFFDF1
	ldrh r1, [r2]
	orr r1, r1, #0x8000
	strh r1, [r2]
	ldrh r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0xe
	orr r0, r0, #0x200
	strh r0, [r2]
	ldrh r0, [r2]
	orr r0, r0, #1
	strh r0, [r2]
	bl GX_InitGXState
	ldr r5, _020761A4 ; =sDispMode
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _020760E8
	mvn r4, #2
_020760C4:
	bl OS_GetLockID
	mov r6, r0
	cmp r6, r4
	bne _020760D8
	bl WaitForever2
_020760D8:
	strh r6, [r5, #2]
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020760C4
_020760E8:
	ldr r0, _020761A8 ; =0x04000004
	mov r2, #0
	mov r3, #0x4000000
	strh r2, [r0]
	ldr r0, _020761AC ; =sIsDispOn
	str r2, [r3]
	ldr r0, [r0, #4]
	sub r1, r3, #0x4000001
	cmp r0, r1
	beq _02076140
	add r1, r3, #8
	mov r3, #0x60
	bl MI_DmaFill32
	ldr r1, _020761B0 ; =0x0400006C
	mov r2, #0
	ldr r0, _020761AC ; =sIsDispOn
	strh r2, [r1]
	ldr r0, [r0, #4]
	ldr r1, _020761B4 ; =0x04001000
	mov r3, #0x70
	bl MI_DmaFill32
	b _02076168
_02076140:
	mov r0, r2
	add r1, r3, #8
	mov r2, #0x60
	bl MTi_CpuClear32
	ldr r3, _020761B0 ; =0x0400006C
	mov r0, #0
	ldr r1, _020761B4 ; =0x04001000
	mov r2, #0x70
	strh r0, [r3]
	bl MTi_CpuClear32
_02076168:
	ldr r0, _020761B8 ; =0x04000020
	mov r2, #0x100
	strh r2, [r0]
	strh r2, [r0, #6]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x16]
	add r1, r0, #0x1000
	ldr r0, _020761BC ; =0x04001026
	strh r2, [r1]
	strh r2, [r0]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207619C: .word 0x04000304
_020761A0: .word 0xFFFFFDF1
_020761A4: .word sDispMode
_020761A8: .word 0x04000004
_020761AC: .word sIsDispOn
_020761B0: .word 0x0400006C
_020761B4: .word 0x04001000
_020761B8: .word 0x04000020
_020761BC: .word 0x04001026
	arm_func_end GX_Init

	arm_func_start GX_HBlankIntr
GX_HBlankIntr: ; 0x020761C0
	ldr r3, _020761E4 ; =0x04000004
	mov r1, r0, lsl #0x18
	ldrh r2, [r3]
	and ip, r0, #0x100
	and r0, r2, #0x3f
	orr r0, r0, r1, lsr #16
	orr r0, r0, ip, asr #1
	strh r0, [r3]
	bx lr
	.align 2, 0
_020761E4: .word 0x04000004
	arm_func_end GX_HBlankIntr

	arm_func_start GX_VBlankIntr
GX_VBlankIntr: ; 0x020761E8
	ldr r2, _02076218 ; =0x04000004
	cmp r0, #0
	ldrh r0, [r2]
	ldreqh r1, [r2]
	and r0, r0, #8
	biceq r1, r1, #8
	streqh r1, [r2]
	bxeq lr
	ldrh r1, [r2]
	orr r1, r1, #8
	strh r1, [r2]
	bx lr
	.align 2, 0
_02076218: .word 0x04000004
	arm_func_end GX_VBlankIntr

	arm_func_start GX_DispOff
GX_DispOff: ; 0x0207621C
	stmdb sp!, {r3, lr}
	mov lr, #0x4000000
	ldr ip, [lr]
	ldr r1, _02076250 ; =sIsDispOn
	and r2, ip, #0x30000
	mov r3, #0
	ldr r0, _02076254 ; =sDispMode
	mov r2, r2, lsr #0x10
	strh r3, [r1]
	strh r2, [r0]
	bic r0, ip, #0x30000
	str r0, [lr]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076250: .word sIsDispOn
_02076254: .word sDispMode
	arm_func_end GX_DispOff

	arm_func_start GX_DispOn
GX_DispOn: ; 0x02076258
	ldr r0, _02076298 ; =sDispMode
	ldr r1, _0207629C ; =sIsDispOn
	ldrh r2, [r0]
	mov r0, #1
	strh r0, [r1]
	mov r1, #0x4000000
	cmp r2, #0
	ldreq r0, [r1]
	orreq r0, r0, #0x10000
	streq r0, [r1]
	bxeq lr
	ldr r0, [r1]
	bic r0, r0, #0x30000
	orr r0, r0, r2, lsl #16
	str r0, [r1]
	bx lr
	.align 2, 0
_02076298: .word sDispMode
_0207629C: .word sIsDispOn
	arm_func_end GX_DispOn

	arm_func_start GX_SetGraphicsMode
GX_SetGraphicsMode: ; 0x020762A0
	stmdb sp!, {r3, lr}
	ldr r3, _020762FC ; =sIsDispOn
	mov lr, #0x4000000
	ldrh ip, [r3]
	ldr lr, [lr]
	ldr r3, _02076300 ; =sDispMode
	cmp ip, #0
	strh r0, [r3]
	ldr r3, _02076304 ; =0xFFF0FFF0
	moveq r0, #0
	and r3, lr, r3
	orr r0, r3, r0, lsl #16
	orr r0, r1, r0
	orr r1, r0, r2, lsl #3
	mov ip, #0x4000000
	ldr r0, _02076300 ; =sDispMode
	str r1, [ip]
	ldrh r0, [r0]
	cmp r0, #0
	ldreq r0, _020762FC ; =sIsDispOn
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020762FC: .word sIsDispOn
_02076300: .word sDispMode
_02076304: .word 0xFFF0FFF0
	arm_func_end GX_SetGraphicsMode

	arm_func_start GXS_SetGraphicsMode
GXS_SetGraphicsMode: ; 0x02076308
	ldr r2, _02076320 ; =0x04001000
	ldr r1, [r2]
	bic r1, r1, #7
	orr r0, r1, r0
	str r0, [r2]
	bx lr
	.align 2, 0
_02076320: .word 0x04001000
	arm_func_end GXS_SetGraphicsMode

	arm_func_start GXx_SetMasterBrightness_
GXx_SetMasterBrightness_: ; 0x02076324
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0]
	bxeq lr
	orrgt r1, r1, #0x4000
	strgth r1, [r0]
	rsble r1, r1, #0
	orrle r1, r1, #0x8000
	strleh r1, [r0]
	bx lr
	arm_func_end GXx_SetMasterBrightness_

