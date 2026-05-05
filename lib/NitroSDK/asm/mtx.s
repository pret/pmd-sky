	.include "asm/macros.inc"
	.include "include/mtx.inc"

	.text

	arm_func_start MTX_LookAt
MTX_LookAt: ; 0x02075828
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r6, r0
	ldr r5, [r6]
	ldr r4, [r2]
	add r0, sp, #0x18
	sub r4, r5, r4
	str r4, [sp, #0x18]
	ldr ip, [r6, #4]
	ldr r4, [r2, #4]
	mov r5, r1
	sub r1, ip, r4
	str r1, [sp, #0x1c]
	ldr r4, [r6, #8]
	ldr r2, [r2, #8]
	mov r1, r0
	sub r2, r4, r2
	mov r4, r3
	str r2, [sp, #0x20]
	bl VEC_Normalize
	add r1, sp, #0x18
	add r2, sp, #0xc
	mov r0, r5
	bl VEC_CrossProduct
	add r0, sp, #0xc
	mov r1, r0
	bl VEC_Normalize
	add r0, sp, #0x18
	add r1, sp, #0xc
	add r2, sp, #0
	bl VEC_CrossProduct
	ldr r1, [sp, #0xc]
	mov r0, r6
	str r1, [r4]
	ldr r2, [sp]
	add r1, sp, #0xc
	str r2, [r4, #4]
	ldr r2, [sp, #0x18]
	str r2, [r4, #8]
	ldr r2, [sp, #0x10]
	str r2, [r4, #0xc]
	ldr r2, [sp, #4]
	str r2, [r4, #0x10]
	ldr r2, [sp, #0x1c]
	str r2, [r4, #0x14]
	ldr r2, [sp, #0x14]
	str r2, [r4, #0x18]
	ldr r2, [sp, #8]
	str r2, [r4, #0x1c]
	ldr r2, [sp, #0x20]
	str r2, [r4, #0x20]
	bl VEC_DotProduct
	rsb r0, r0, #0
	str r0, [r4, #0x24]
	mov r0, r6
	add r1, sp, #0
	bl VEC_DotProduct
	rsb r0, r0, #0
	str r0, [r4, #0x28]
	mov r0, r6
	add r1, sp, #0x18
	bl VEC_DotProduct
	rsb r0, r0, #0
	str r0, [r4, #0x2c]
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end MTX_LookAt

	arm_func_start MTX_OrthoW
MTX_OrthoW: ; 0x02075930
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	str r2, [sp]
	mov sl, r0
	ldr r0, [sp]
	mov r2, r3
	sub r0, r2, r0
	ldr r8, [sp, #0x3c]
	str r3, [sp, #4]
	mov fp, r1
	ldr sb, [sp, #0x38]
	bl FX_InvAsync
	mov r0, #0
	str r0, [r8, #4]
	str r0, [r8, #8]
	str r0, [r8, #0xc]
	str r0, [r8, #0x10]
	str r0, [r8, #0x18]
	str r0, [r8, #0x1c]
	str r0, [r8, #0x20]
	str r0, [r8, #0x24]
	str r0, [r8, #0x2c]
	str sb, [r8, #0x3c]
	bl FX_GetDivResultFx64c
	mov r6, r1
	mov r4, r0
	ldr r1, _02075B34 ; =0x04000290
	mov r3, #0
	mov r2, #0x1000
	str r3, [r1]
	sub r0, sl, fp
	str r2, [r1, #4]
	str r0, [r1, #8]
	mov r0, r3
	cmp sb, #0x1000
	str r0, [r1, #0xc]
	beq _020759E0
	mov r5, sb, asr #0x1f
	umull r0, r1, r4, sb
	mla r1, r4, r5, r1
	mla r1, r6, sb, r1
	bl _ll_sdiv
	mov r4, r0
	mov r6, r1
_020759E0:
	mov r1, r6, lsl #0xd
	mov r0, #0x80000000
	orr r1, r1, r4, lsr #19
	adds r0, r0, r4, lsl #13
	adc r0, r1, #0
	str r0, [r8]
	bl FX_GetDivResultFx64c
	mov r5, r0
	mov r7, r1
	mov r3, #0
	ldr ip, _02075B34 ; =0x04000290
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x34]
	str r3, [ip]
	mov r2, #0x1000
	str r2, [ip, #4]
	sub r0, r1, r0
	mov lr, r3
	str r0, [ip, #8]
	cmp sb, #0x1000
	str lr, [ip, #0xc]
	beq _02075A54
	mov ip, sb, asr #0x1f
	umull r0, r1, r5, sb
	mla r1, r5, ip, r1
	mla r1, r7, sb, r1
	bl _ll_sdiv
	mov r5, r0
	mov r7, r1
_02075A54:
	mov r1, r7, lsl #0xd
	mov r0, #0x80000000
	orr r1, r1, r5, lsr #19
	adds r0, r0, r5, lsl #13
	adc r0, r1, #0
	str r0, [r8, #0x14]
	bl FX_GetDivResultFx64c
	cmp sb, #0x1000
	beq _02075A9C
	mov r2, sb, asr #0x1f
	umull ip, r3, r0, sb
	mla r3, r0, r2, r3
	mla r3, r1, sb, r3
	mov r0, ip
	mov r1, r3
	mov r2, #0x1000
	mov r3, #0
	bl _ll_sdiv
_02075A9C:
	ldr r3, [sp, #4]
	ldr r2, [sp]
	add r2, r3, r2
	rsb ip, r2, #0
	add r2, sl, fp
	rsb r3, r2, #0
	ldr sl, [sp, #0x34]
	ldr r2, [sp, #0x30]
	mov sb, ip, asr #0x1f
	add r2, sl, r2
	umull fp, sl, r4, ip
	mla sl, r4, sb, sl
	mov r4, #0x80000000
	mla sl, r6, ip, sl
	adds r4, r4, r0, lsl #13
	mov sb, r1, lsl #0xd
	mov r6, r3, asr #0x1f
	umull ip, r4, r5, r3
	mla r4, r5, r6, r4
	orr sb, sb, r0, lsr #19
	mla r4, r7, r3, r4
	adc r3, sb, #0
	str r3, [r8, #0x28]
	adds r3, fp, #0x80000000
	adc r7, sl, #0
	adds r3, ip, #0x80000000
	mov r3, r2, asr #0x1f
	umull r6, r5, r0, r2
	mla r5, r0, r3, r5
	adc r3, r4, #0
	str r7, [r8, #0x30]
	mla r5, r1, r2, r5
	adds r0, r6, #0x80000000
	str r3, [r8, #0x34]
	adc r0, r5, #0
	str r0, [r8, #0x38]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02075B34: .word 0x04000290
	arm_func_end MTX_OrthoW

