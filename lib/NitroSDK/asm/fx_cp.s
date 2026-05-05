	.include "asm/macros.inc"
	.include "include/fx_cp.inc"

	.text

    arm_func_start FX_Div
FX_Div: ; 0x02075B38
	stmdb sp!, {r3, lr}
	bl FX_DivAsync
	bl FX_GetDivResult
	ldmia sp!, {r3, pc}
	arm_func_end FX_Div

	arm_func_start FX_GetDivResultFx64c
FX_GetDivResultFx64c: ; 0x02075B48
	ldr r1, _02075B64 ; =0x04000280
_02075B4C:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _02075B4C
	ldr r1, _02075B68 ; =0x040002A0
	ldmia r1, {r0, r1}
	bx lr
	.align 2, 0
_02075B64: .word 0x04000280
_02075B68: .word 0x040002A0
	arm_func_end FX_GetDivResultFx64c

	arm_func_start FX_GetDivResult
FX_GetDivResult: ; 0x02075B6C
	ldr r1, _02075B9C ; =0x04000280
_02075B70:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _02075B70
	ldr r0, _02075BA0 ; =0x040002A0
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r2, r1, #0x80000
	adc r1, r0, #0
	mov r0, r2, lsr #0x14
	orr r0, r0, r1, lsl #12
	bx lr
	.align 2, 0
_02075B9C: .word 0x04000280
_02075BA0: .word 0x040002A0
	arm_func_end FX_GetDivResult

	arm_func_start FX_InvAsync
FX_InvAsync: ; 0x02075BA4
	ldr r2, _02075BD0 ; =0x04000280
	mov r1, #1
	strh r1, [r2]
	mov r1, #0
	str r1, [r2, #0x10]
	mov r1, #0x1000
	str r1, [r2, #0x14]
	str r0, [r2, #0x18]
	mov r0, #0
	str r0, [r2, #0x1c]
	bx lr
	.align 2, 0
_02075BD0: .word 0x04000280
	arm_func_end FX_InvAsync

	arm_func_start FX_DivAsync
FX_DivAsync: ; 0x02075BD4
	ldr r3, _02075BF8 ; =0x04000280
	mov r2, #1
	strh r2, [r3]
	mov r2, #0
	str r2, [r3, #0x10]
	str r0, [r3, #0x14]
	str r1, [r3, #0x18]
	str r2, [r3, #0x1c]
	bx lr
	.align 2, 0
_02075BF8: .word 0x04000280
	arm_func_end FX_DivAsync

	arm_func_start FX_DivS32
FX_DivS32: ; 0x02075BFC
	ldr r2, _02075C30 ; =0x04000280
	mov r3, #0
	strh r3, [r2]
	str r0, [r2, #0x10]
	str r1, [r2, #0x18]
	mov r0, r3
	str r0, [r2, #0x1c]
_02075C18:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _02075C18
	ldr r0, _02075C34 ; =0x040002A0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_02075C30: .word 0x04000280
_02075C34: .word 0x040002A0
	arm_func_end FX_DivS32

	arm_func_start FX_ModS32
FX_ModS32: ; 0x02075C38
	ldr r2, _02075C6C ; =0x04000280
	mov r3, #0
	strh r3, [r2]
	str r0, [r2, #0x10]
	str r1, [r2, #0x18]
	mov r0, r3
	str r0, [r2, #0x1c]
_02075C54:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _02075C54
	ldr r0, _02075C70 ; =0x040002A8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_02075C6C: .word 0x04000280
_02075C70: .word 0x040002A8
	arm_func_end FX_ModS32
