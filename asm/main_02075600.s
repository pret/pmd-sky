	.include "asm/macros.inc"
	.include "main_02075600.inc"

	.text

	arm_func_start sub_02075600
sub_02075600: ; 0x02075600
	ldr r0, _0207561C ; =_022B9208
	mov r2, #0
	strb r2, [r0, #4]
	mov r1, #1
	str r1, [r0]
	strb r2, [r0, #8]
	bx lr
	.align 2, 0
_0207561C: .word _022B9208
	arm_func_end sub_02075600

	arm_func_start sub_02075620
sub_02075620: ; 0x02075620
	stmdb sp!, {r4, lr}
	ldr r0, _020756E4 ; =_022B9208
	ldr r0, [r0, #0x1cc]
	cmp r0, #0
	beq _02075648
_02075634:
	ldr r4, [r0, #0x500]
	bl DseMem_Free
	mov r0, r4
	cmp r4, #0
	bne _02075634
_02075648:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x1cc]
	ldr r0, [r0, #0xec]
	cmp r0, #0
	beq _02075664
	bl DseMem_Free
_02075664:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0xec]
	ldr r0, [r0, #0x1b8]
	cmp r0, #0
	beq _02075680
	bl DseMem_Free
_02075680:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x1b8]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0207569C
	bl sub_0206FD88
_0207569C:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x24]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _020756B8
	bl sub_0206FD88
_020756B8:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _020756D4
	bl sub_0206FD88
_020756D4:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x1c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020756E4: .word _022B9208
	arm_func_end sub_02075620

	arm_func_start sub_020756E8
sub_020756E8: ; 0x020756E8
	stmdb sp!, {r3, lr}
	ldr r0, _0207571C ; =_022B9208
	ldrsb r0, [r0, #4]
	cmp r0, #0
	mvneq r0, #0x59
	ldmeqia sp!, {r3, pc}
	bl sub_0206F808
	bl sub_0206FDE0
	bl sub_02075620
	ldr r1, _0207571C ; =_022B9208
	mov r0, #0
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207571C: .word _022B9208
	arm_func_end sub_020756E8

	arm_func_start CRYPTO_RC4Init
CRYPTO_RC4Init: ; 0x02075720
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r3, #0
	strb r3, [r0]
	cmp r2, #0x10
	strb r3, [r0, #1]
	movhi r2, #0x10
	add r0, r0, #4
_02075740:
	strb r3, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _02075740
	mov r6, #0
	mov r7, r6
	mov r4, r6
	mov r3, r6
	and ip, r2, #0xff
_02075764:
	ldrb r5, [r0, r4]
	ldrb lr, [r1, r7]
	add r2, r7, #1
	and r7, r2, #0xff
	add r2, r5, lr
	add r2, r6, r2
	and r6, r2, #0xff
	ldrb r2, [r0, r6]
	add lr, r0, r4
	add r4, r4, #1
	strb r2, [lr]
	cmp r7, ip
	moveq r7, r3
	cmp r4, #0x100
	strb r5, [r0, r6]
	blt _02075764
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end CRYPTO_RC4Init

	arm_func_start sub_020757B0
sub_020757B0: ; 0x020757B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	ldrb r7, [r0]
	ldrb r6, [r0, #1]
	add r0, r0, #4
	mov lr, #0x1000000
	add r7, lr, r7, lsl #24
	mov r6, r6, lsl #0x18
	ldrb sb, [r0, r7, lsr #24]
	subs r2, r2, #1
	bmi _02075810
_020757D8:
	add r6, r6, sb, lsl #24
	subs r2, r2, #1
	ldrb r8, [r0, r6, lsr #24]
	ldrb r5, [r1], #1
	strb r8, [r0, r7, lsr #24]
	strb sb, [r0, r6, lsr #24]
	add r4, sb, r8
	and r4, r4, #0xff
	add r7, r7, lr
	ldrb r4, [r0, r4]
	ldrb sb, [r0, r7, lsr #24]
	eor r5, r5, r4
	strb r5, [r3], #1
	bge _020757D8
_02075810:
	sub r7, r7, lr
	mov r7, r7, lsr #0x18
	mov r6, r6, lsr #0x18
	strb r7, [r0, #-4]
	strb r6, [r0, #-3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020757B0

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

	arm_func_start VEC_DotProduct
VEC_DotProduct: ; 0x02075C74
	stmdb sp!, {r4, lr}
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	ldr ip, [r0]
	smull r4, lr, r3, r2
	ldr r2, [r1]
	ldr r3, [r0, #8]
	smlal r4, lr, ip, r2
	ldr r0, [r1, #8]
	smlal r4, lr, r3, r0
	adds r0, r4, #0x800
	adc r1, lr, #0
	mov r0, r0, lsr #0xc
	orr r0, r0, r1, lsl #20
	ldmia sp!, {r4, pc}
	arm_func_end VEC_DotProduct

	arm_func_start VEC_CrossProduct
VEC_CrossProduct: ; 0x02075CB0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldmia r0, {r5, lr}
	ldr r6, [r1, #8]
	ldr r0, [r0, #8]
	ldmia r1, {r4, ip}
	smull r8, r7, lr, r6
	smull r3, r1, r0, ip
	subs r3, r8, r3
	sbc r1, r7, r1
	adds r3, r3, #0x800
	smull r8, r7, r0, r4
	smull r6, r0, r5, r6
	adc r1, r1, #0
	subs r6, r8, r6
	mov r3, r3, lsr #0xc
	orr r3, r3, r1, lsl #20
	sbc r7, r7, r0
	adds r0, r6, #0x800
	smull ip, r6, r5, ip
	adc r5, r7, #0
	smull r4, r1, lr, r4
	mov r7, r0, lsr #0xc
	subs r4, ip, r4
	sbc r0, r6, r1
	adds r1, r4, #0x800
	str r3, [r2]
	orr r7, r7, r5, lsl #20
	adc r0, r0, #0
	mov r1, r1, lsr #0xc
	str r7, [r2, #4]
	orr r1, r1, r0, lsl #20
	str r1, [r2, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end VEC_CrossProduct

	arm_func_start VEC_Normalize
VEC_Normalize: ; 0x02075D34
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, [r0, #4]
	ldr r3, [r0]
	smull r6, r5, r2, r2
	smlal r6, r5, r3, r3
	ldr r2, [r0, #8]
	ldr r4, _02075E40 ; =0x04000280
	smlal r6, r5, r2, r2
	mov r3, #2
	strh r3, [r4]
	mov r3, #0
	str r3, [r4, #0x10]
	mov r3, #0x1000000
	str r3, [r4, #0x14]
	str r6, [r4, #0x18]
	mov r2, r5, lsl #2
	str r5, [r4, #0x1c]
	mov r3, #1
	strh r3, [r4, #0x30]
	mov r3, r6, lsl #2
	str r3, [r4, #0x38]
	orr r2, r2, r6, lsr #30
	str r2, [r4, #0x3c]
_02075D90:
	ldrh r2, [r4, #0x30]
	tst r2, #0x8000
	bne _02075D90
	ldr r2, _02075E44 ; =0x040002B4
	ldr ip, [r2]
	sub r3, r2, #0x34
_02075DA8:
	ldrh r2, [r3]
	tst r2, #0x8000
	bne _02075DA8
	ldr sb, _02075E48 ; =0x040002A0
	ldr r5, [r0]
	ldr r8, [sb]
	mov r7, ip, asr #0x1f
	umull r3, r2, r8, ip
	umull r6, lr, r3, r5
	mov r4, r5, asr #0x1f
	mla r2, r8, r7, r2
	ldr r7, [sb, #4]
	mla lr, r3, r4, lr
	mla r2, r7, ip, r2
	mla lr, r2, r5, lr
	adds r4, r6, #0
	adc r4, lr, #0x1000
	mov r4, r4, asr #0xd
	str r4, [r1]
	ldr ip, [r0, #4]
	umull r5, lr, r3, ip
	mov r4, ip, asr #0x1f
	mla lr, r3, r4, lr
	mla lr, r2, ip, lr
	adds r4, r5, #0
	adc r4, lr, #0x1000
	mov r4, r4, asr #0xd
	str r4, [r1, #4]
	ldr ip, [r0, #8]
	umull r4, lr, r3, ip
	mov r0, ip, asr #0x1f
	mla lr, r3, r0, lr
	mla lr, r2, ip, lr
	adds r0, r4, #0
	adc r0, lr, #0x1000
	mov r0, r0, asr #0xd
	str r0, [r1, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02075E40: .word 0x04000280
_02075E44: .word 0x040002B4
_02075E48: .word 0x040002A0
	arm_func_end VEC_Normalize

	arm_func_start VEC_Distance
VEC_Distance: ; 0x02075E4C
	stmdb sp!, {r4, lr}
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	ldr r4, [r0]
	sub r2, r3, r2
	smull ip, r3, r2, r2
	ldr lr, [r1]
	ldr r2, [r0, #8]
	sub r4, r4, lr
	ldr r0, [r1, #8]
	smlal ip, r3, r4, r4
	sub r0, r2, r0
	smlal ip, r3, r0, r0
	mov r0, r3, lsl #2
	ldr r2, _02075EC0 ; =0x040002B0
	mov r1, #1
	strh r1, [r2]
	mov r1, ip, lsl #2
	str r1, [r2, #8]
	orr r0, r0, ip, lsr #30
	str r0, [r2, #0xc]
_02075EA0:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _02075EA0
	ldr r0, _02075EC4 ; =0x040002B4
	ldr r0, [r0]
	add r0, r0, #1
	mov r0, r0, asr #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02075EC0: .word 0x040002B0
_02075EC4: .word 0x040002B4
	arm_func_end VEC_Distance

	arm_func_start FX_Atan2Idx
FX_Atan2Idx: ; 0x02075EC8
	stmdb sp!, {r4, lr}
	cmp r0, #0
	ble _02075F5C
	cmp r1, #0
	ble _02075F14
	cmp r1, r0
	ble _02075EF4
	mov r2, r0
	mov r4, #0
	mov r0, #1
	b _0207600C
_02075EF4:
	bge _02075F0C
	mov r2, r1
	mov r1, r0
	mov r4, #0x4000
	mov r0, #0
	b _0207600C
_02075F0C:
	mov r0, #0x2000
	ldmia sp!, {r4, pc}
_02075F14:
	bge _02075F54
	rsb r1, r1, #0
	cmp r1, r0
	bge _02075F38
	mov r2, r1
	mov r1, r0
	mov r4, #0x4000
	mov r0, #1
	b _0207600C
_02075F38:
	ble _02075F4C
	mov r2, r0
	mov r4, #0x8000
	mov r0, #0
	b _0207600C
_02075F4C:
	mov r0, #0x6000
	ldmia sp!, {r4, pc}
_02075F54:
	mov r0, #0x4000
	ldmia sp!, {r4, pc}
_02075F5C:
	bge _02075FFC
	cmp r1, #0
	rsb r0, r0, #0
	bge _02075FB0
	rsb r1, r1, #0
	cmp r1, r0
	ble _02075F8C
	mov r4, #0x8000
	mov r2, r0
	rsb r4, r4, #0
	mov r0, #1
	b _0207600C
_02075F8C:
	bge _02075FA8
	mov r4, #0x4000
	mov r2, r1
	mov r1, r0
	rsb r4, r4, #0
	mov r0, #0
	b _0207600C
_02075FA8:
	mov r0, #0xa000
	ldmia sp!, {r4, pc}
_02075FB0:
	cmp r1, #0
	ble _02075FF4
	cmp r1, r0
	bge _02075FD8
	mov r4, #0x4000
	mov r2, r1
	mov r1, r0
	rsb r4, r4, #0
	mov r0, #1
	b _0207600C
_02075FD8:
	ble _02075FEC
	mov r4, #0
	mov r2, r0
	mov r0, r4
	b _0207600C
_02075FEC:
	mov r0, #0xe000
	ldmia sp!, {r4, pc}
_02075FF4:
	mov r0, #0xc000
	ldmia sp!, {r4, pc}
_02075FFC:
	cmp r1, #0
	movge r0, #0
	movlt r0, #0x8000
	ldmia sp!, {r4, pc}
_0207600C:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r0, #0
	mov r0, r2
	beq _02076048
	bl FX_Div
	mov r1, r0, asr #5
	ldr r0, _0207606C ; =FX_AtanIdxTable_
	mov r1, r1, lsl #1
	ldrsh r0, [r0, r1]
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
_02076048:
	bl FX_Div
	mov r1, r0, asr #5
	ldr r0, _0207606C ; =FX_AtanIdxTable_
	mov r1, r1, lsl #1
	ldrsh r0, [r0, r1]
	sub r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207606C: .word FX_AtanIdxTable_
	arm_func_end FX_Atan2Idx

	arm_func_start sub_02076070
sub_02076070: ; 0x02076070
	bx lr
	arm_func_end sub_02076070

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
	bl sub_0207BC4C
	ldr r1, _020761B0 ; =0x0400006C
	mov r2, #0
	ldr r0, _020761AC ; =sIsDispOn
	strh r2, [r1]
	ldr r0, [r0, #4]
	ldr r1, _020761B4 ; =0x04001000
	mov r3, #0x70
	bl sub_0207BC4C
	b _02076168
_02076140:
	mov r0, r2
	add r1, r3, #8
	mov r2, #0x60
	bl ArrayFill32
	ldr r3, _020761B0 ; =0x0400006C
	mov r0, #0
	ldr r1, _020761B4 ; =0x04001000
	mov r2, #0x70
	strh r0, [r3]
	bl ArrayFill32
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

	arm_func_start GX_InitGXState
GX_InitGXState: ; 0x0207634C
	ldr r0, _020763A4 ; =gGXState
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x16]
	ldr r1, _020763A8 ; =0x04000240
	strh r2, [r0, #0x18]
	str r2, [r1]
	strb r2, [r1, #4]
	strb r2, [r1, #5]
	strb r2, [r1, #6]
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_020763A4: .word gGXState
_020763A8: .word 0x04000240
	arm_func_end GX_InitGXState

	arm_func_start GX_VRAMCNT_SetLCDC_
GX_VRAMCNT_SetLCDC_: ; 0x020763AC
	tst r0, #1
	ldrne r1, _02076440 ; =0x04000240
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #2
	ldrne r1, _02076444 ; =0x04000241
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #4
	ldrne r1, _02076448 ; =0x04000242
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #8
	ldrne r1, _0207644C ; =0x04000243
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x10
	ldrne r1, _02076450 ; =0x04000244
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x20
	ldrne r1, _02076454 ; =0x04000245
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x40
	ldrne r1, _02076458 ; =0x04000246
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x80
	ldrne r1, _0207645C ; =0x04000248
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x100
	ldrne r0, _02076460 ; =0x04000249
	movne r1, #0x80
	strneb r1, [r0]
	bx lr
	.align 2, 0
_02076440: .word 0x04000240
_02076444: .word 0x04000241
_02076448: .word 0x04000242
_0207644C: .word 0x04000243
_02076450: .word 0x04000244
_02076454: .word 0x04000245
_02076458: .word 0x04000246
_0207645C: .word 0x04000248
_02076460: .word 0x04000249
	arm_func_end GX_VRAMCNT_SetLCDC_

	arm_func_start GX_SetBankForBG
GX_SetBankForBG: ; 0x02076464
	stmdb sp!, {r3, lr}
	ldr r1, _020766D4 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	cmp r0, #0x40
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #2]
	bgt _0207653C
	cmp r0, #0x40
	bge _020766B8
	cmp r0, #0x20
	bgt _02076530
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _020766C4
_020764AC: ; jump table
	b _020766C4 ; case 0
	b _020765D8 ; case 1
	b _020765A4 ; case 2
	b _020765CC ; case 3
	b _0207657C ; case 4
	b _02076614 ; case 5
	b _02076598 ; case 6
	b _020765C0 ; case 7
	b _02076560 ; case 8
	b _0207662C ; case 9
	b _02076644 ; case 10
	b _020765E8 ; case 11
	b _02076570 ; case 12
	b _02076608 ; case 13
	b _0207658C ; case 14
	b _020765B4 ; case 15
	b _02076674 ; case 16
	b _020766C4 ; case 17
	b _020766C4 ; case 18
	b _020766C4 ; case 19
	b _020766C4 ; case 20
	b _020766C4 ; case 21
	b _020766C4 ; case 22
	b _020766C4 ; case 23
	b _020766C4 ; case 24
	b _020766C4 ; case 25
	b _020766C4 ; case 26
	b _020766C4 ; case 27
	b _020766C4 ; case 28
	b _020766C4 ; case 29
	b _020766C4 ; case 30
	b _020766C4 ; case 31
	b _020766A8 ; case 32
_02076530:
	cmp r0, #0x30
	beq _02076668
	b _020766C4
_0207653C:
	cmp r0, #0x60
	bgt _02076554
	bge _0207669C
	cmp r0, #0x50
	beq _02076684
	b _020766C4
_02076554:
	cmp r0, #0x70
	beq _0207665C
	b _020766C4
_02076560:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_02076570:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x89
	strb r1, [r0]
_0207657C:
	ldr r0, _020766DC ; =0x04000242
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_0207658C:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x91
	strb r1, [r0]
_02076598:
	ldr r0, _020766DC ; =0x04000242
	mov r1, #0x89
	strb r1, [r0]
_020765A4:
	ldr r0, _020766E0 ; =0x04000241
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_020765B4:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x99
	strb r1, [r0]
_020765C0:
	ldr r0, _020766DC ; =0x04000242
	mov r1, #0x91
	strb r1, [r0]
_020765CC:
	ldr r0, _020766E0 ; =0x04000241
	mov r1, #0x89
	strb r1, [r0]
_020765D8:
	ldr r0, _020766E4 ; =0x04000240
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_020765E8:
	ldr r1, _020766E4 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #1]
	mov r0, #0x91
	strb r0, [r1, #3]
	b _020766C4
_02076608:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x91
	strb r1, [r0]
_02076614:
	ldr r1, _020766E4 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #2]
	b _020766C4
_0207662C:
	ldr r1, _020766E4 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #3]
	b _020766C4
_02076644:
	ldr r1, _020766E0 ; =0x04000241
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #2]
	b _020766C4
_0207665C:
	ldr r0, _020766E8 ; =0x04000246
	mov r1, #0x99
	strb r1, [r0]
_02076668:
	ldr r0, _020766EC ; =0x04000245
	mov r1, #0x91
	strb r1, [r0]
_02076674:
	ldr r0, _020766F0 ; =0x04000244
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_02076684:
	ldr r1, _020766E8 ; =0x04000246
	mov r0, #0x91
	strb r0, [r1]
	mov r0, #0x81
	strb r0, [r1, #-2]
	b _020766C4
_0207669C:
	ldr r0, _020766E8 ; =0x04000246
	mov r1, #0x89
	strb r1, [r0]
_020766A8:
	ldr r0, _020766EC ; =0x04000245
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_020766B8:
	ldr r0, _020766E8 ; =0x04000246
	mov r1, #0x81
	strb r1, [r0]
_020766C4:
	ldr r0, _020766D4 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020766D4: .word gGXState
_020766D8: .word 0x04000243
_020766DC: .word 0x04000242
_020766E0: .word 0x04000241
_020766E4: .word 0x04000240
_020766E8: .word 0x04000246
_020766EC: .word 0x04000245
_020766F0: .word 0x04000244
	arm_func_end GX_SetBankForBG

	arm_func_start GX_SetBankForOBJ
GX_SetBankForOBJ: ; 0x020766F4
	stmdb sp!, {r3, lr}
	ldr r1, _0207682C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #4]
	cmp r0, #0x30
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #4]
	bgt _0207675C
	cmp r0, #0x30
	bge _020767D0
	cmp r0, #0x10
	bgt _02076750
	bge _020767DC
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0207681C
_02076740: ; jump table
	b _0207681C ; case 0
	b _020767A4 ; case 1
	b _020767B4 ; case 2
	b _02076798 ; case 3
_02076750:
	cmp r0, #0x20
	beq _02076810
	b _0207681C
_0207675C:
	cmp r0, #0x50
	bgt _0207677C
	bge _020767EC
	cmp r0, #0x40
	ldreq r0, _02076830 ; =0x04000246
	moveq r1, #0x82
	streqb r1, [r0]
	b _0207681C
_0207677C:
	cmp r0, #0x60
	bgt _0207678C
	beq _02076804
	b _0207681C
_0207678C:
	cmp r0, #0x70
	beq _020767C4
	b _0207681C
_02076798:
	ldr r0, _02076834 ; =0x04000241
	mov r1, #0x8a
	strb r1, [r0]
_020767A4:
	ldr r0, _02076838 ; =0x04000240
	mov r1, #0x82
	strb r1, [r0]
	b _0207681C
_020767B4:
	ldr r0, _02076834 ; =0x04000241
	mov r1, #0x82
	strb r1, [r0]
	b _0207681C
_020767C4:
	ldr r0, _02076830 ; =0x04000246
	mov r1, #0x9a
	strb r1, [r0]
_020767D0:
	ldr r0, _0207683C ; =0x04000245
	mov r1, #0x92
	strb r1, [r0]
_020767DC:
	ldr r0, _02076840 ; =0x04000244
	mov r1, #0x82
	strb r1, [r0]
	b _0207681C
_020767EC:
	ldr r1, _02076830 ; =0x04000246
	mov r0, #0x92
	strb r0, [r1]
	mov r0, #0x82
	strb r0, [r1, #-2]
	b _0207681C
_02076804:
	ldr r0, _02076830 ; =0x04000246
	mov r1, #0x8a
	strb r1, [r0]
_02076810:
	ldr r0, _0207683C ; =0x04000245
	mov r1, #0x82
	strb r1, [r0]
_0207681C:
	ldr r0, _0207682C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207682C: .word gGXState
_02076830: .word 0x04000246
_02076834: .word 0x04000241
_02076838: .word 0x04000240
_0207683C: .word 0x04000245
_02076840: .word 0x04000244
	arm_func_end GX_SetBankForOBJ

	arm_func_start GX_SetBankForBGExtPltt
GX_SetBankForBGExtPltt: ; 0x02076844
	stmdb sp!, {r3, lr}
	ldr r1, _02076938 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xe]
	cmp r0, #0x20
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xe]
	bgt _02076894
	cmp r0, #0x20
	bge _020768F8
	cmp r0, #0
	bgt _02076888
	beq _02076918
	b _02076928
_02076888:
	cmp r0, #0x10
	beq _020768B0
	b _02076928
_02076894:
	cmp r0, #0x40
	bgt _020768A4
	beq _020768CC
	b _02076928
_020768A4:
	cmp r0, #0x60
	beq _020768EC
	b _02076928
_020768B0:
	mov r2, #0x4000000
	ldr r1, [r2]
	mov r0, #0x84
	orr r1, r1, #0x40000000
	str r1, [r2]
	strb r0, [r2, #0x244]
	b _02076928
_020768CC:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _0207693C ; =0x04000246
	orr r1, r1, #0x40000000
	str r1, [r2]
	mov r1, #0x8c
	strb r1, [r0]
	b _02076928
_020768EC:
	ldr r0, _0207693C ; =0x04000246
	mov r1, #0x8c
	strb r1, [r0]
_020768F8:
	ldr r0, _02076940 ; =0x04000245
	mov r1, #0x84
	strb r1, [r0]
	mov r1, #0x4000000
	ldr r0, [r1]
	orr r0, r0, #0x40000000
	str r0, [r1]
	b _02076928
_02076918:
	mov r1, #0x4000000
	ldr r0, [r1]
	bic r0, r0, #0x40000000
	str r0, [r1]
_02076928:
	ldr r0, _02076938 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076938: .word gGXState
_0207693C: .word 0x04000246
_02076940: .word 0x04000245
	arm_func_end GX_SetBankForBGExtPltt

	arm_func_start GX_SetBankForOBJExtPltt
GX_SetBankForOBJExtPltt: ; 0x02076944
	stmdb sp!, {r3, lr}
	ldr r1, _020769E4 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x10]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x10]
	beq _020769C4
	cmp r0, #0x20
	beq _02076984
	cmp r0, #0x40
	beq _020769A4
	b _020769D4
_02076984:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020769E8 ; =0x04000245
	orr r1, r1, #0x80000000
	str r1, [r2]
	mov r1, #0x85
	strb r1, [r0]
	b _020769D4
_020769A4:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020769EC ; =0x04000246
	orr r1, r1, #0x80000000
	str r1, [r2]
	mov r1, #0x85
	strb r1, [r0]
	b _020769D4
_020769C4:
	mov r1, #0x4000000
	ldr r0, [r1]
	bic r0, r0, #0x80000000
	str r0, [r1]
_020769D4:
	ldr r0, _020769E4 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020769E4: .word gGXState
_020769E8: .word 0x04000245
_020769EC: .word 0x04000246
	arm_func_end GX_SetBankForOBJExtPltt

	arm_func_start GX_SetBankForTex
GX_SetBankForTex: ; 0x020769F0
	stmdb sp!, {r3, lr}
	ldr r1, _02076BAC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #8]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #8]
	ldr r2, _02076BB0 ; =0x04000060
	bne _02076A34
	ldrh r1, [r2]
	ldr r0, _02076BB4 ; =0x0000CFFE
	and r0, r1, r0
	strh r0, [r2]
	b _02076B9C
_02076A34:
	ldrh r1, [r2]
	cmp r0, #0xf
	bic r1, r1, #0x3000
	orr r1, r1, #1
	strh r1, [r2]
	addls pc, pc, r0, lsl #2
	b _02076B9C
_02076A50: ; jump table
	b _02076B9C ; case 0
	b _02076B90 ; case 1
	b _02076B5C ; case 2
	b _02076B84 ; case 3
	b _02076B34 ; case 4
	b _02076A90 ; case 5
	b _02076B50 ; case 6
	b _02076B78 ; case 7
	b _02076B18 ; case 8
	b _02076AA8 ; case 9
	b _02076AC0 ; case 10
	b _02076AD8 ; case 11
	b _02076B28 ; case 12
	b _02076AF8 ; case 13
	b _02076B44 ; case 14
	b _02076B6C ; case 15
_02076A90:
	mov r1, #0x83
	ldr r0, _02076BB8 ; =0x04000242
	strb r1, [r2, #0x1e0]
	mov r1, #0x8b
	strb r1, [r0]
	b _02076B9C
_02076AA8:
	mov r1, #0x83
	ldr r0, _02076BBC ; =0x04000243
	strb r1, [r2, #0x1e0]
	mov r1, #0x8b
	strb r1, [r0]
	b _02076B9C
_02076AC0:
	ldr r1, _02076BC0 ; =0x04000241
	mov r0, #0x83
	strb r0, [r1]
	mov r0, #0x8b
	strb r0, [r1, #2]
	b _02076B9C
_02076AD8:
	mov r0, #0x83
	ldr r1, _02076BC0 ; =0x04000241
	strb r0, [r2, #0x1e0]
	mov r0, #0x8b
	strb r0, [r1]
	mov r0, #0x93
	strb r0, [r1, #2]
	b _02076B9C
_02076AF8:
	mov r0, #0x83
	ldr r1, _02076BB8 ; =0x04000242
	strb r0, [r2, #0x1e0]
	mov r0, #0x8b
	strb r0, [r1]
	mov r0, #0x93
	strb r0, [r1, #1]
	b _02076B9C
_02076B18:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x83
	strb r1, [r0]
	b _02076B9C
_02076B28:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x8b
	strb r1, [r0]
_02076B34:
	ldr r0, _02076BB8 ; =0x04000242
	mov r1, #0x83
	strb r1, [r0]
	b _02076B9C
_02076B44:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x93
	strb r1, [r0]
_02076B50:
	ldr r0, _02076BB8 ; =0x04000242
	mov r1, #0x8b
	strb r1, [r0]
_02076B5C:
	ldr r0, _02076BC0 ; =0x04000241
	mov r1, #0x83
	strb r1, [r0]
	b _02076B9C
_02076B6C:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x9b
	strb r1, [r0]
_02076B78:
	ldr r0, _02076BB8 ; =0x04000242
	mov r1, #0x93
	strb r1, [r0]
_02076B84:
	ldr r0, _02076BC0 ; =0x04000241
	mov r1, #0x8b
	strb r1, [r0]
_02076B90:
	ldr r0, _02076BC4 ; =0x04000240
	mov r1, #0x83
	strb r1, [r0]
_02076B9C:
	ldr r0, _02076BAC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076BAC: .word gGXState
_02076BB0: .word 0x04000060
_02076BB4: .word 0x0000CFFE
_02076BB8: .word 0x04000242
_02076BBC: .word 0x04000243
_02076BC0: .word 0x04000241
_02076BC4: .word 0x04000240
	arm_func_end GX_SetBankForTex

	arm_func_start GX_SetBankForTexPltt
GX_SetBankForTexPltt: ; 0x02076BC8
	stmdb sp!, {r3, lr}
	ldr r1, _02076CA0 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xa]
	cmp r0, #0x30
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xa]
	bgt _02076C1C
	cmp r0, #0x30
	bge _02076C78
	cmp r0, #0x10
	bgt _02076C10
	bge _02076C84
	cmp r0, #0
	b _02076C90
_02076C10:
	cmp r0, #0x20
	beq _02076C4C
	b _02076C90
_02076C1C:
	cmp r0, #0x60
	bgt _02076C34
	bge _02076C40
	cmp r0, #0x40
	beq _02076C5C
	b _02076C90
_02076C34:
	cmp r0, #0x70
	beq _02076C6C
	b _02076C90
_02076C40:
	ldr r0, _02076CA4 ; =0x04000246
	mov r1, #0x8b
	strb r1, [r0]
_02076C4C:
	ldr r0, _02076CA8 ; =0x04000245
	mov r1, #0x83
	strb r1, [r0]
	b _02076C90
_02076C5C:
	ldr r0, _02076CA4 ; =0x04000246
	mov r1, #0x83
	strb r1, [r0]
	b _02076C90
_02076C6C:
	ldr r0, _02076CA4 ; =0x04000246
	mov r1, #0x9b
	strb r1, [r0]
_02076C78:
	ldr r0, _02076CA8 ; =0x04000245
	mov r1, #0x93
	strb r1, [r0]
_02076C84:
	ldr r0, _02076CAC ; =0x04000244
	mov r1, #0x83
	strb r1, [r0]
_02076C90:
	ldr r0, _02076CA0 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076CA0: .word gGXState
_02076CA4: .word 0x04000246
_02076CA8: .word 0x04000245
_02076CAC: .word 0x04000244
	arm_func_end GX_SetBankForTexPltt

	arm_func_start GX_SetBankForClearImage
GX_SetBankForClearImage: ; 0x02076CB0
	stmdb sp!, {r3, lr}
	ldr r1, _02076DCC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xc]
	cmp r0, #0xc
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xc]
	addls pc, pc, r0, lsl #2
	b _02076DBC
_02076CE0: ; jump table
	b _02076D6C ; case 0
	b _02076D80 ; case 1
	b _02076D20 ; case 2
	b _02076D14 ; case 3
	b _02076DA0 ; case 4
	b _02076DBC ; case 5
	b _02076DBC ; case 6
	b _02076DBC ; case 7
	b _02076D4C ; case 8
	b _02076DBC ; case 9
	b _02076DBC ; case 10
	b _02076DBC ; case 11
	b _02076D40 ; case 12
_02076D14:
	ldr r0, _02076DD0 ; =0x04000240
	mov r1, #0x93
	strb r1, [r0]
_02076D20:
	ldr r0, _02076DD4 ; =0x04000241
	mov r2, #0x9b
	ldr r1, _02076DD8 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076D40:
	ldr r0, _02076DDC ; =0x04000242
	mov r1, #0x93
	strb r1, [r0]
_02076D4C:
	ldr r0, _02076DE0 ; =0x04000243
	mov r2, #0x9b
	ldr r1, _02076DD8 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076D6C:
	ldr r1, _02076DD8 ; =0x04000060
	ldrh r0, [r1]
	bic r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076D80:
	ldr r0, _02076DD0 ; =0x04000240
	mov r1, #0x9b
	strb r1, [r0]
	sub r1, r0, #0x1e0
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076DA0:
	ldr r0, _02076DDC ; =0x04000242
	mov r2, #0x9b
	ldr r1, _02076DD8 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
_02076DBC:
	ldr r0, _02076DCC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076DCC: .word gGXState
_02076DD0: .word 0x04000240
_02076DD4: .word 0x04000241
_02076DD8: .word 0x04000060
_02076DDC: .word 0x04000242
_02076DE0: .word 0x04000243
	arm_func_end GX_SetBankForClearImage

	arm_func_start GX_SetBankForARM7
GX_SetBankForARM7: ; 0x02076DE4
	stmdb sp!, {r3, lr}
	ldr r1, _02076E84 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #6]
	cmp r0, #8
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #6]
	bgt _02076E38
	cmp r0, #8
	bge _02076E68
	cmp r0, #4
	bgt _02076E74
	cmp r0, #0
	blt _02076E74
	beq _02076E74
	cmp r0, #4
	beq _02076E58
	b _02076E74
_02076E38:
	cmp r0, #0xc
	bne _02076E74
	ldr r1, _02076E88 ; =0x04000243
	mov r0, #0x8a
	strb r0, [r1]
	mov r0, #0x82
	strb r0, [r1, #-1]
	b _02076E74
_02076E58:
	ldr r0, _02076E8C ; =0x04000242
	mov r1, #0x82
	strb r1, [r0]
	b _02076E74
_02076E68:
	ldr r0, _02076E88 ; =0x04000243
	mov r1, #0x82
	strb r1, [r0]
_02076E74:
	ldr r0, _02076E84 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076E84: .word gGXState
_02076E88: .word 0x04000243
_02076E8C: .word 0x04000242
	arm_func_end GX_SetBankForARM7

	arm_func_start GX_SetBankForLCDC
GX_SetBankForLCDC: ; 0x02076E90
	ldr r1, _02076EA8 ; =gGXState
	ldr ip, _02076EAC ; =GX_VRAMCNT_SetLCDC_
	ldrh r2, [r1]
	orr r2, r2, r0
	strh r2, [r1]
	bx ip
	.align 2, 0
_02076EA8: .word gGXState
_02076EAC: .word GX_VRAMCNT_SetLCDC_
	arm_func_end GX_SetBankForLCDC

	arm_func_start GX_SetBankForSubBG
GX_SetBankForSubBG: ; 0x02076EB0
	stmdb sp!, {r3, lr}
	ldr r1, _02076F48 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x12]
	cmp r0, #0x80
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x12]
	bgt _02076F04
	cmp r0, #0x80
	bge _02076F2C
	cmp r0, #4
	bgt _02076F38
	cmp r0, #0
	blt _02076F38
	beq _02076F38
	cmp r0, #4
	beq _02076F10
	b _02076F38
_02076F04:
	cmp r0, #0x180
	beq _02076F20
	b _02076F38
_02076F10:
	ldr r0, _02076F4C ; =0x04000242
	mov r1, #0x84
	strb r1, [r0]
	b _02076F38
_02076F20:
	ldr r0, _02076F50 ; =0x04000249
	mov r1, #0x81
	strb r1, [r0]
_02076F2C:
	ldr r0, _02076F54 ; =0x04000248
	mov r1, #0x81
	strb r1, [r0]
_02076F38:
	ldr r0, _02076F48 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076F48: .word gGXState
_02076F4C: .word 0x04000242
_02076F50: .word 0x04000249
_02076F54: .word 0x04000248
	arm_func_end GX_SetBankForSubBG

	arm_func_start GX_SetBankForSubOBJ
GX_SetBankForSubOBJ: ; 0x02076F58
	stmdb sp!, {r3, lr}
	ldr r1, _02076FBC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x14]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x14]
	beq _02076FAC
	cmp r0, #8
	beq _02076FA0
	cmp r0, #0x100
	ldreq r0, _02076FC0 ; =0x04000249
	moveq r1, #0x82
	streqb r1, [r0]
	b _02076FAC
_02076FA0:
	ldr r0, _02076FC4 ; =0x04000243
	mov r1, #0x84
	strb r1, [r0]
_02076FAC:
	ldr r0, _02076FBC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076FBC: .word gGXState
_02076FC0: .word 0x04000249
_02076FC4: .word 0x04000243
	arm_func_end GX_SetBankForSubOBJ

	arm_func_start GX_SetBankForSubBGExtPltt
GX_SetBankForSubBGExtPltt: ; 0x02076FC8
	stmdb sp!, {r3, lr}
	ldr r1, _0207703C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x16]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x16]
	beq _0207701C
	cmp r0, #0x80
	bne _0207702C
	ldr r3, _02077040 ; =0x04001000
	ldr r0, _02077044 ; =0x04000248
	ldr r2, [r3]
	mov r1, #0x82
	orr r2, r2, #0x40000000
	str r2, [r3]
	strb r1, [r0]
	b _0207702C
_0207701C:
	ldr r1, _02077040 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x40000000
	str r0, [r1]
_0207702C:
	ldr r0, _0207703C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207703C: .word gGXState
_02077040: .word 0x04001000
_02077044: .word 0x04000248
	arm_func_end GX_SetBankForSubBGExtPltt

	arm_func_start GX_SetBankForSubOBJExtPltt
GX_SetBankForSubOBJExtPltt: ; 0x02077048
	stmdb sp!, {r3, lr}
	ldr r1, _020770BC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x18]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x18]
	beq _0207709C
	cmp r0, #0x100
	bne _020770AC
	ldr r3, _020770C0 ; =0x04001000
	ldr r0, _020770C4 ; =0x04000249
	ldr r2, [r3]
	mov r1, #0x83
	orr r2, r2, #0x80000000
	str r2, [r3]
	strb r1, [r0]
	b _020770AC
_0207709C:
	ldr r1, _020770C0 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x80000000
	str r0, [r1]
_020770AC:
	ldr r0, _020770BC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020770BC: .word gGXState
_020770C0: .word 0x04001000
_020770C4: .word 0x04000249
	arm_func_end GX_SetBankForSubOBJExtPltt

	arm_func_start resetBankForX_
resetBankForX_: ; 0x020770C8
	stmdb sp!, {r4, lr}
	ldrh r4, [r0]
	mov r2, #0
	ldr r1, _020770F8 ; =gGXState
	strh r2, [r0]
	ldrh r2, [r1]
	mov r0, r4
	orr r2, r2, r4
	strh r2, [r1]
	bl GX_VRAMCNT_SetLCDC_
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020770F8: .word gGXState
	arm_func_end resetBankForX_

	arm_func_start GX_ResetBankForBGExtPltt
GX_ResetBankForBGExtPltt: ; 0x020770FC
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _02077118 ; =resetBankForX_
	bic r1, r1, #0x40000000
	ldr r0, _0207711C ; =_022B959A
	str r1, [r2]
	bx ip
	.align 2, 0
_02077118: .word resetBankForX_
_0207711C: .word _022B959A
	arm_func_end GX_ResetBankForBGExtPltt

	arm_func_start GX_ResetBankForOBJExtPltt
GX_ResetBankForOBJExtPltt: ; 0x02077120
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _0207713C ; =resetBankForX_
	bic r1, r1, #0x80000000
	ldr r0, _02077140 ; =_022B959C
	str r1, [r2]
	bx ip
	.align 2, 0
_0207713C: .word resetBankForX_
_02077140: .word _022B959C
	arm_func_end GX_ResetBankForOBJExtPltt

	arm_func_start GX_ResetBankForTex
GX_ResetBankForTex: ; 0x02077144
	ldr ip, _02077150 ; =resetBankForX_
	ldr r0, _02077154 ; =_022B9594
	bx ip
	.align 2, 0
_02077150: .word resetBankForX_
_02077154: .word _022B9594
	arm_func_end GX_ResetBankForTex

	arm_func_start GX_ResetBankForTexPltt
GX_ResetBankForTexPltt: ; 0x02077158
	ldr ip, _02077164 ; =resetBankForX_
	ldr r0, _02077168 ; =_022B9596
	bx ip
	.align 2, 0
_02077164: .word resetBankForX_
_02077168: .word _022B9596
	arm_func_end GX_ResetBankForTexPltt

	arm_func_start GX_ResetBankForSubBGExtPltt
GX_ResetBankForSubBGExtPltt: ; 0x0207716C
	ldr r2, _02077188 ; =0x04001000
	ldr ip, _0207718C ; =resetBankForX_
	ldr r1, [r2]
	ldr r0, _02077190 ; =_022B95A2
	bic r1, r1, #0x40000000
	str r1, [r2]
	bx ip
	.align 2, 0
_02077188: .word 0x04001000
_0207718C: .word resetBankForX_
_02077190: .word _022B95A2
	arm_func_end GX_ResetBankForSubBGExtPltt

	arm_func_start GX_ResetBankForSubOBJExtPltt
GX_ResetBankForSubOBJExtPltt: ; 0x02077194
	ldr r2, _020771B0 ; =0x04001000
	ldr ip, _020771B4 ; =resetBankForX_
	ldr r1, [r2]
	ldr r0, _020771B8 ; =_022B95A4
	bic r1, r1, #0x80000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020771B0: .word 0x04001000
_020771B4: .word resetBankForX_
_020771B8: .word _022B95A4
	arm_func_end GX_ResetBankForSubOBJExtPltt

	arm_func_start disableBankForX_
disableBankForX_: ; 0x020771BC
	stmdb sp!, {r4, lr}
	ldrh r4, [r0]
	mov r1, #0
	strh r1, [r0]
	tst r4, #1
	ldrne r0, _02077274 ; =0x04000240
	strneb r1, [r0]
	tst r4, #2
	ldrne r0, _02077278 ; =0x04000241
	movne r1, #0
	strneb r1, [r0]
	tst r4, #4
	ldrne r0, _0207727C ; =0x04000242
	movne r1, #0
	strneb r1, [r0]
	tst r4, #8
	ldrne r0, _02077280 ; =0x04000243
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x10
	ldrne r0, _02077284 ; =0x04000244
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x20
	ldrne r0, _02077288 ; =0x04000245
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x40
	ldrne r0, _0207728C ; =0x04000246
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x80
	ldrne r0, _02077290 ; =0x04000248
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x100
	ldrne r0, _02077294 ; =0x04000249
	movne r1, #0
	strneb r1, [r0]
	ldr r1, _02077298 ; =GXi_VRamLockId
	mov r0, r4, lsl #0x10
	ldrh r1, [r1]
	mov r0, r0, lsr #0x10
	bl sub_0207BAC8
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077274: .word 0x04000240
_02077278: .word 0x04000241
_0207727C: .word 0x04000242
_02077280: .word 0x04000243
_02077284: .word 0x04000244
_02077288: .word 0x04000245
_0207728C: .word 0x04000246
_02077290: .word 0x04000248
_02077294: .word 0x04000249
_02077298: .word GXi_VRamLockId
	arm_func_end disableBankForX_

	arm_func_start GX_DisableBankForBG
GX_DisableBankForBG: ; 0x0207729C
	ldr ip, _020772A8 ; =disableBankForX_
	ldr r0, _020772AC ; =_022B958E
	bx ip
	.align 2, 0
_020772A8: .word disableBankForX_
_020772AC: .word _022B958E
	arm_func_end GX_DisableBankForBG

	arm_func_start GX_DisableBankForOBJ
GX_DisableBankForOBJ: ; 0x020772B0
	ldr ip, _020772BC ; =disableBankForX_
	ldr r0, _020772C0 ; =_022B9590
	bx ip
	.align 2, 0
_020772BC: .word disableBankForX_
_020772C0: .word _022B9590
	arm_func_end GX_DisableBankForOBJ

	arm_func_start GX_DisableBankForBGExtPltt
GX_DisableBankForBGExtPltt: ; 0x020772C4
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _020772E0 ; =disableBankForX_
	bic r1, r1, #0x40000000
	ldr r0, _020772E4 ; =_022B959A
	str r1, [r2]
	bx ip
	.align 2, 0
_020772E0: .word disableBankForX_
_020772E4: .word _022B959A
	arm_func_end GX_DisableBankForBGExtPltt

	arm_func_start GX_DisableBankForOBJExtPltt
GX_DisableBankForOBJExtPltt: ; 0x020772E8
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _02077304 ; =disableBankForX_
	bic r1, r1, #0x80000000
	ldr r0, _02077308 ; =_022B959C
	str r1, [r2]
	bx ip
	.align 2, 0
_02077304: .word disableBankForX_
_02077308: .word _022B959C
	arm_func_end GX_DisableBankForOBJExtPltt

	arm_func_start GX_DisableBankForTex
GX_DisableBankForTex: ; 0x0207730C
	ldr ip, _02077318 ; =disableBankForX_
	ldr r0, _0207731C ; =_022B9594
	bx ip
	.align 2, 0
_02077318: .word disableBankForX_
_0207731C: .word _022B9594
	arm_func_end GX_DisableBankForTex

	arm_func_start GX_DisableBankForTexPltt
GX_DisableBankForTexPltt: ; 0x02077320
	ldr ip, _0207732C ; =disableBankForX_
	ldr r0, _02077330 ; =_022B9596
	bx ip
	.align 2, 0
_0207732C: .word disableBankForX_
_02077330: .word _022B9596
	arm_func_end GX_DisableBankForTexPltt

	arm_func_start GX_DisableBankForClearImage
GX_DisableBankForClearImage: ; 0x02077334
	ldr ip, _02077340 ; =disableBankForX_
	ldr r0, _02077344 ; =_022B9598
	bx ip
	.align 2, 0
_02077340: .word disableBankForX_
_02077344: .word _022B9598
	arm_func_end GX_DisableBankForClearImage

	arm_func_start GX_DisableBankForARM7
GX_DisableBankForARM7: ; 0x02077348
	ldr ip, _02077354 ; =disableBankForX_
	ldr r0, _02077358 ; =_022B9592
	bx ip
	.align 2, 0
_02077354: .word disableBankForX_
_02077358: .word _022B9592
	arm_func_end GX_DisableBankForARM7

	arm_func_start GX_DisableBankForLCDC
GX_DisableBankForLCDC: ; 0x0207735C
	ldr ip, _02077368 ; =disableBankForX_
	ldr r0, _0207736C ; =gGXState
	bx ip
	.align 2, 0
_02077368: .word disableBankForX_
_0207736C: .word gGXState
	arm_func_end GX_DisableBankForLCDC

	arm_func_start GX_DisableBankForSubBG
GX_DisableBankForSubBG: ; 0x02077370
	ldr ip, _0207737C ; =disableBankForX_
	ldr r0, _02077380 ; =_022B959E
	bx ip
	.align 2, 0
_0207737C: .word disableBankForX_
_02077380: .word _022B959E
	arm_func_end GX_DisableBankForSubBG

	arm_func_start GX_DisableBankForSubOBJ
GX_DisableBankForSubOBJ: ; 0x02077384
	ldr ip, _02077390 ; =disableBankForX_
	ldr r0, _02077394 ; =_022B95A0
	bx ip
	.align 2, 0
_02077390: .word disableBankForX_
_02077394: .word _022B95A0
	arm_func_end GX_DisableBankForSubOBJ

	arm_func_start GX_DisableBankForSubBGExtPltt
GX_DisableBankForSubBGExtPltt: ; 0x02077398
	ldr r2, _020773B4 ; =0x04001000
	ldr ip, _020773B8 ; =disableBankForX_
	ldr r1, [r2]
	ldr r0, _020773BC ; =_022B95A2
	bic r1, r1, #0x40000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020773B4: .word 0x04001000
_020773B8: .word disableBankForX_
_020773BC: .word _022B95A2
	arm_func_end GX_DisableBankForSubBGExtPltt

	arm_func_start GX_DisableBankForSubOBJExtPltt
GX_DisableBankForSubOBJExtPltt: ; 0x020773C0
	ldr r2, _020773DC ; =0x04001000
	ldr ip, _020773E0 ; =disableBankForX_
	ldr r1, [r2]
	ldr r0, _020773E4 ; =_022B95A4
	bic r1, r1, #0x80000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020773DC: .word 0x04001000
_020773E0: .word disableBankForX_
_020773E4: .word _022B95A4
	arm_func_end GX_DisableBankForSubOBJExtPltt

	arm_func_start G2_GetBG0ScrPtr
G2_GetBG0ScrPtr: ; 0x020773E8
	ldr r1, _02077418 ; =0x04000008
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x38000000
	mov r0, r0, lsr #0x1b
	and r1, r1, #0x1f00
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
	.align 2, 0
_02077418: .word 0x04000008
	arm_func_end G2_GetBG0ScrPtr

	arm_func_start G2S_GetBG0ScrPtr
G2S_GetBG0ScrPtr: ; 0x0207741C
	ldr r0, _02077438 ; =0x04001008
	ldrh r0, [r0]
	and r0, r0, #0x1f00
	mov r0, r0, asr #8
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_02077438: .word 0x04001008
	arm_func_end G2S_GetBG0ScrPtr

	arm_func_start G2_GetBG1ScrPtr
G2_GetBG1ScrPtr: ; 0x0207743C
	ldr r1, _0207746C ; =0x0400000A
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x38000000
	mov r0, r0, lsr #0x1b
	and r1, r1, #0x1f00
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
	.align 2, 0
_0207746C: .word 0x0400000A
	arm_func_end G2_GetBG1ScrPtr

	arm_func_start G2S_GetBG1ScrPtr
G2S_GetBG1ScrPtr: ; 0x02077470
	ldr r0, _0207748C ; =0x0400100A
	ldrh r0, [r0]
	and r0, r0, #0x1f00
	mov r0, r0, asr #8
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_0207748C: .word 0x0400100A
	arm_func_end G2S_GetBG1ScrPtr

	arm_func_start G2_GetBG2ScrPtr
G2_GetBG2ScrPtr: ; 0x02077490
	mov r0, #0x4000000
	ldr r1, [r0]
	ldrh r3, [r0, #0xc]
	ldr r0, [r0]
	and ip, r1, #7
	and r0, r0, #0x38000000
	mov r1, r0, lsr #0x1b
	and r0, r3, #0x1f00
	mov r2, r1, lsl #0x10
	cmp ip, #6
	mov r1, r0, lsr #8
	addls pc, pc, ip, lsl #2
	b _0207750C
_020774C4: ; jump table
	b _020774E0 ; case 0
	b _020774E0 ; case 1
	b _020774E0 ; case 2
	b _020774E0 ; case 3
	b _020774E0 ; case 4
	b _020774EC ; case 5
	b _02077504 ; case 6
_020774E0:
	add r0, r2, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
_020774EC:
	tst r3, #0x80
	movne r0, r1, lsl #0xe
	addne r0, r0, #0x6000000
	addeq r0, r2, #0x6000000
	addeq r0, r0, r1, lsl #11
	bx lr
_02077504:
	mov r0, #0x6000000
	bx lr
_0207750C:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG2ScrPtr

	arm_func_start G2_GetBG3ScrPtr
G2_GetBG3ScrPtr: ; 0x02077514
	mov r0, #0x4000000
	ldr r1, [r0]
	ldrh r3, [r0, #0xe]
	ldr r0, [r0]
	and ip, r1, #7
	and r0, r0, #0x38000000
	mov r1, r0, lsr #0x1b
	and r0, r3, #0x1f00
	mov r2, r1, lsl #0x10
	cmp ip, #6
	mov r1, r0, lsr #8
	addls pc, pc, ip, lsl #2
	b _02077590
_02077548: ; jump table
	b _02077564 ; case 0
	b _02077564 ; case 1
	b _02077564 ; case 2
	b _02077570 ; case 3
	b _02077570 ; case 4
	b _02077570 ; case 5
	b _02077588 ; case 6
_02077564:
	add r0, r2, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
_02077570:
	tst r3, #0x80
	movne r0, r1, lsl #0xe
	addne r0, r0, #0x6000000
	addeq r0, r2, #0x6000000
	addeq r0, r0, r1, lsl #11
	bx lr
_02077588:
	mov r0, #0
	bx lr
_02077590:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG3ScrPtr

	arm_func_start G2_GetBG0CharPtr
G2_GetBG0CharPtr: ; 0x02077598
	ldr r1, _020775C8 ; =0x04000008
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	and r1, r1, #0x3c
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #2
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #14
	bx lr
	.align 2, 0
_020775C8: .word 0x04000008
	arm_func_end G2_GetBG0CharPtr

	arm_func_start G2S_GetBG0CharPtr
G2S_GetBG0CharPtr: ; 0x020775CC
	ldr r0, _020775E8 ; =0x04001008
	ldrh r0, [r0]
	and r0, r0, #0x3c
	mov r0, r0, asr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_020775E8: .word 0x04001008
	arm_func_end G2S_GetBG0CharPtr

	arm_func_start G2_GetBG1CharPtr
G2_GetBG1CharPtr: ; 0x020775EC
	ldr r1, _0207761C ; =0x0400000A
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	and r1, r1, #0x3c
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #2
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #14
	bx lr
	.align 2, 0
_0207761C: .word 0x0400000A
	arm_func_end G2_GetBG1CharPtr

	arm_func_start G2S_GetBG1CharPtr
G2S_GetBG1CharPtr: ; 0x02077620
	ldr r0, _0207763C ; =0x0400100A
	ldrh r0, [r0]
	and r0, r0, #0x3c
	mov r0, r0, asr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_0207763C: .word 0x0400100A
	arm_func_end G2S_GetBG1CharPtr

	arm_func_start G2_GetBG2CharPtr
G2_GetBG2CharPtr: ; 0x02077640
	mov r1, #0x4000000
	ldr r0, [r1]
	ldrh r2, [r1, #0xc]
	and r0, r0, #7
	cmp r0, #5
	blt _02077660
	tst r2, #0x80
	bne _02077688
_02077660:
	mov r0, #0x4000000
	ldr r1, [r0]
	and r0, r2, #0x3c
	and r1, r1, #0x7000000
	mov r1, r1, lsr #0x18
	mov r1, r1, lsl #0x10
	add r1, r1, #0x6000000
	mov r0, r0, lsr #2
	add r0, r1, r0, lsl #14
	bx lr
_02077688:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG2CharPtr

	arm_func_start G2_GetBG3CharPtr
G2_GetBG3CharPtr: ; 0x02077690
	mov r1, #0x4000000
	ldr r0, [r1]
	ldrh r2, [r1, #0xe]
	and r0, r0, #7
	cmp r0, #3
	blt _020776B8
	cmp r0, #6
	bge _020776E0
	tst r2, #0x80
	bne _020776E0
_020776B8:
	mov r0, #0x4000000
	ldr r1, [r0]
	and r0, r2, #0x3c
	and r1, r1, #0x7000000
	mov r1, r1, lsr #0x18
	mov r1, r1, lsl #0x10
	add r1, r1, #0x6000000
	mov r0, r0, lsr #2
	add r0, r1, r0, lsl #14
	bx lr
_020776E0:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG3CharPtr

	arm_func_start G2x_SetBlendAlpha_
G2x_SetBlendAlpha_: ; 0x020776E8
	ldr ip, [sp]
	orr r1, r1, #0x40
	orr r2, r1, r2, lsl #8
	orr r1, r3, ip, lsl #8
	orr r1, r2, r1, lsl #16
	str r1, [r0]
	bx lr
	arm_func_end G2x_SetBlendAlpha_

	arm_func_start G2x_SetBlendBrightness_
G2x_SetBlendBrightness_: ; 0x02077704
	cmp r2, #0
	orrge r1, r1, #0x80
	strgeh r1, [r0]
	strgeh r2, [r0, #4]
	bxge lr
	orr r1, r1, #0xc0
	strh r1, [r0]
	rsb r1, r2, #0
	strh r1, [r0, #4]
	bx lr
	arm_func_end G2x_SetBlendBrightness_

	arm_func_start G2x_ChangeBlendBrightness_
G2x_ChangeBlendBrightness_: ; 0x0207772C
	ldrh r3, [r0]
	cmp r1, #0
	and r2, r3, #0xc0
	bge _02077758
	cmp r2, #0x80
	biceq r2, r3, #0xc0
	orreq r2, r2, #0xc0
	streqh r2, [r0]
	rsb r1, r1, #0
	strh r1, [r0, #4]
	bx lr
_02077758:
	cmp r2, #0xc0
	biceq r2, r3, #0xc0
	orreq r2, r2, #0x80
	streqh r2, [r0]
	strh r1, [r0, #4]
	bx lr
	arm_func_end G2x_ChangeBlendBrightness_

	arm_func_start G3_LoadMtx44
G3_LoadMtx44: ; 0x02077770
	ldr r1, _02077784 ; =0x04000400
	mov r2, #0x16
	ldr ip, _02077788 ; =GX_SendFifo64B
	str r2, [r1]
	bx ip
	.align 2, 0
_02077784: .word 0x04000400
_02077788: .word GX_SendFifo64B
	arm_func_end G3_LoadMtx44

	arm_func_start G3_LoadMtx43
G3_LoadMtx43: ; 0x0207778C
	ldr r1, _020777A0 ; =0x04000400
	mov r2, #0x17
	ldr ip, _020777A4 ; =GeomGxFifoSendMtx4x3
	str r2, [r1]
	bx ip
	.align 2, 0
_020777A0: .word 0x04000400
_020777A4: .word GeomGxFifoSendMtx4x3
	arm_func_end G3_LoadMtx43

	arm_func_start G3_MultMtx43
G3_MultMtx43: ; 0x020777A8
	ldr r1, _020777BC ; =0x04000400
	mov r2, #0x19
	ldr ip, _020777C0 ; =GeomGxFifoSendMtx4x3
	str r2, [r1]
	bx ip
	.align 2, 0
_020777BC: .word 0x04000400
_020777C0: .word GeomGxFifoSendMtx4x3
	arm_func_end G3_MultMtx43

	arm_func_start G3X_Init
G3X_Init: ; 0x020777C4
	stmdb sp!, {r3, lr}
	bl G3X_ClearFifo
	ldr r1, _020778B0 ; =0x04000504
	mov r0, #0
	str r0, [r1]
_020777D8:
	ldr r0, [r1, #0xfc]
	tst r0, #0x8000000
	bne _020777D8
	ldr r0, _020778B4 ; =0x04000060
	mov r2, #0
	strh r2, [r0]
	str r2, [r1, #0xfc]
	str r2, [r0, #-0x50]
	ldrh ip, [r0]
	ldr r2, _020778B8 ; =0xFFFFCFFD
	ldr r3, _020778BC ; =0x0000CFFB
	orr ip, ip, #0x2000
	strh ip, [r0]
	ldrh ip, [r0]
	orr ip, ip, #0x1000
	strh ip, [r0]
	ldrh ip, [r0]
	and r2, ip, r2
	strh r2, [r0]
	ldrh r2, [r0]
	bic r2, r2, #0x3000
	orr r2, r2, #0x10
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r2, r3
	strh r2, [r0]
	ldr r0, [r1, #0xfc]
	orr r0, r0, #0x8000
	str r0, [r1, #0xfc]
	ldr r0, [r1, #0xfc]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x80000000
	str r0, [r1, #0xfc]
	bl G3X_InitMtxStack
	ldr r1, _020778C0 ; =0x04000350
	mov r2, #0
	ldr r0, _020778C4 ; =0x00007FFF
	str r2, [r1]
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	str r2, [r1, #8]
	strh r2, [r1, #0xc]
	sub r1, r1, #0x348
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	bl G3X_InitTable
	ldr r2, _020778C8 ; =0x001F0080
	ldr r1, _020778CC ; =0x040004A4
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020778B0: .word 0x04000504
_020778B4: .word 0x04000060
_020778B8: .word 0xFFFFCFFD
_020778BC: .word 0x0000CFFB
_020778C0: .word 0x04000350
_020778C4: .word 0x00007FFF
_020778C8: .word 0x001F0080
_020778CC: .word 0x040004A4
	arm_func_end G3X_Init

	arm_func_start G3X_Reset
G3X_Reset: ; 0x020778D0
	stmdb sp!, {r3, lr}
	ldr r2, _0207792C ; =0x04000600
_020778D8:
	ldr r0, [r2]
	tst r0, #0x8000000
	bne _020778D8
	ldr r0, [r2]
	ldr r1, _02077930 ; =0x04000060
	orr r0, r0, #0x8000
	str r0, [r2]
	ldrh r0, [r1]
	orr r0, r0, #0x2000
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x1000
	strh r0, [r1]
	bl G3X_ResetMtxStack
	ldr r2, _02077934 ; =0x001F0080
	ldr r1, _02077938 ; =0x040004A4
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207792C: .word 0x04000600
_02077930: .word 0x04000060
_02077934: .word 0x001F0080
_02077938: .word 0x040004A4
	arm_func_end G3X_Reset

	arm_func_start G3X_ClearFifo
G3X_ClearFifo: ; 0x0207793C
	stmdb sp!, {r3, lr}
	ldr r0, _0207795C ; =0x04000400
	bl GXi_NopClearFifo128_
	ldr r1, _02077960 ; =0x04000600
_0207794C:
	ldr r0, [r1]
	tst r0, #0x8000000
	bne _0207794C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207795C: .word 0x04000400
_02077960: .word 0x04000600
	arm_func_end G3X_ClearFifo

	arm_func_start G3X_InitMtxStack
G3X_InitMtxStack: ; 0x02077964
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _020779F0 ; =0x04000600
	ldr r0, [r1]
	orr r0, r0, #0x8000
	str r0, [r1]
	add r4, sp, #4
_02077980:
	mov r0, r4
	bl G3X_GetMtxStackLevelPV
	cmp r0, #0
	bne _02077980
	add r4, sp, #0
_02077994:
	mov r0, r4
	bl G3X_GetMtxStackLevelPJ
	cmp r0, #0
	bne _02077994
	ldr r1, _020779F4 ; =0x04000440
	mov r0, #3
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x14]
	str r0, [r1]
	ldr r0, [sp]
	mov r2, #0
	cmp r0, #0
	strne r0, [r1, #8]
	ldr r1, _020779F8 ; =0x04000454
	mov r0, #2
	str r2, [r1]
	str r0, [r1, #-0x14]
	ldr r0, [sp, #4]
	str r0, [r1, #-0xc]
	str r2, [r1]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020779F0: .word 0x04000600
_020779F4: .word 0x04000440
_020779F8: .word 0x04000454
	arm_func_end G3X_InitMtxStack

	arm_func_start G3X_ResetMtxStack
G3X_ResetMtxStack: ; 0x020779FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02077A84 ; =0x04000600
	ldr r0, [r1]
	orr r0, r0, #0x8000
	str r0, [r1]
	add r4, sp, #4
_02077A18:
	mov r0, r4
	bl G3X_GetMtxStackLevelPV
	cmp r0, #0
	bne _02077A18
	add r4, sp, #0
_02077A2C:
	mov r0, r4
	bl G3X_GetMtxStackLevelPJ
	cmp r0, #0
	bne _02077A2C
	ldr r1, _02077A88 ; =0x04000440
	mov r0, #3
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x14]
	str r0, [r1]
	ldr r0, [sp]
	ldr r2, _02077A88 ; =0x04000440
	cmp r0, #0
	strne r0, [r1, #8]
	mov r0, #2
	str r0, [r2]
	ldr r1, [sp, #4]
	mov r0, #0
	str r1, [r2, #8]
	str r0, [r2, #0x14]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077A84: .word 0x04000600
_02077A88: .word 0x04000440
	arm_func_end G3X_ResetMtxStack

	arm_func_start G3X_SetClearColor
G3X_SetClearColor: ; 0x02077A8C
	ldr ip, [sp]
	orr r0, r0, r1, lsl #16
	orr r1, r0, r3, lsl #24
	cmp ip, #0
	ldr r0, _02077AB0 ; =0x04000350
	orrne r1, r1, #0x8000
	str r1, [r0]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
_02077AB0: .word 0x04000350
	arm_func_end G3X_SetClearColor

	arm_func_start G3X_InitTable
G3X_InitTable: ; 0x02077AB4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02077B44 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	ldr r1, _02077B48 ; =0x04000330
	beq _02077B04
	mov r2, #0
	str r2, [sp]
	mov r3, #0x10
	str r2, [sp, #4]
	bl sub_0207BDA8
	ldr r0, _02077B44 ; =GXi_DmaId
	ldr r1, _02077B4C ; =0x04000360
	ldr r0, [r0]
	mov r2, #0
	mov r3, #0x60
	bl sub_0207BC4C
	b _02077B20
_02077B04:
	mov r0, #0
	mov r2, #0x10
	bl ArrayFill32
	ldr r1, _02077B4C ; =0x04000360
	mov r0, #0
	mov r2, #0x60
	bl ArrayFill32
_02077B20:
	mov r2, #0
	ldr r0, _02077B50 ; =0x040004D0
	mov r1, r2
_02077B2C:
	add r2, r2, #1
	str r1, [r0]
	cmp r2, #0x20
	blt _02077B2C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077B44: .word GXi_DmaId
_02077B48: .word 0x04000330
_02077B4C: .word 0x04000360
_02077B50: .word 0x040004D0
	arm_func_end G3X_InitTable

	arm_func_start G3X_GetMtxStackLevelPV
G3X_GetMtxStackLevelPV: ; 0x02077B54
	ldr r2, _02077B80 ; =0x04000600
	ldr r1, [r2]
	tst r1, #0x4000
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #0x1f00
	mov r1, r1, lsr #8
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_02077B80: .word 0x04000600
	arm_func_end G3X_GetMtxStackLevelPV

	arm_func_start G3X_GetMtxStackLevelPJ
G3X_GetMtxStackLevelPJ: ; 0x02077B84
	ldr r2, _02077BB0 ; =0x04000600
	ldr r1, [r2]
	tst r1, #0x4000
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #0x2000
	mov r1, r1, lsr #0xd
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_02077BB0: .word 0x04000600
	arm_func_end G3X_GetMtxStackLevelPJ

	arm_func_start GXi_NopClearFifo128_
GXi_NopClearFifo128_: ; 0x02077BB4
	mov r1, #0
	mov r2, #0
	mov r3, #0
	mov ip, #0
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	bx lr
	arm_func_end GXi_NopClearFifo128_

	arm_func_start G3i_OrthoW_
G3i_OrthoW_: ; 0x02077C48
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x50
	ldr ip, [sp, #0x58]
	ldr lr, [sp, #0x5c]
	str ip, [sp]
	ldr r4, [sp, #0x68]
	ldr ip, [sp, #0x60]
	str lr, [sp, #4]
	cmp r4, #0
	addeq r4, sp, #0x10
	str ip, [sp, #8]
	str r4, [sp, #0xc]
	bl MTX_OrthoW
	ldr r0, [sp, #0x64]
	cmp r0, #0
	addeq sp, sp, #0x50
	ldmeqia sp!, {r4, pc}
	ldr r1, _02077CA8 ; =0x04000440
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx44
	add sp, sp, #0x50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077CA8: .word 0x04000440
	arm_func_end G3i_OrthoW_

	arm_func_start G3i_LookAt_
G3i_LookAt_: ; 0x02077CAC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x40]
	mov r5, r3
	cmp r4, #0
	addeq r4, sp, #0
	mov r3, r4
	bl MTX_LookAt
	cmp r5, #0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _02077CF4 ; =0x04000440
	mov r2, #2
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx43
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02077CF4: .word 0x04000440
	arm_func_end G3i_LookAt_

	arm_func_start GX_LoadBGPltt
GX_LoadBGPltt: ; 0x02077CF8
	stmdb sp!, {r4, lr}
	ldr r3, _02077D48 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _02077D34
	cmp r3, #0x1c
	bls _02077D34
	mov r1, r4
	add r2, lr, #0x5000000
	bl sub_0207BD3C
	ldmia sp!, {r4, pc}
_02077D34:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077D48: .word GXi_DmaId
	arm_func_end GX_LoadBGPltt

	arm_func_start GXS_LoadBGPltt
GXS_LoadBGPltt: ; 0x02077D4C
	stmdb sp!, {r3, lr}
	ldr r3, _02077DA0 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077D88
	cmp r3, #0x1c
	bls _02077D88
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x5000000
	bl sub_0207BD3C
	ldmia sp!, {r3, pc}
_02077D88:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077DA0: .word GXi_DmaId
	arm_func_end GXS_LoadBGPltt

	arm_func_start GX_LoadOBJPltt
GX_LoadOBJPltt: ; 0x02077DA4
	stmdb sp!, {r3, lr}
	ldr r3, _02077DF8 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077DE0
	cmp r3, #0x1c
	bls _02077DE0
	add r2, r1, #0x200
	mov r1, lr
	add r2, r2, #0x5000000
	bl sub_0207BD3C
	ldmia sp!, {r3, pc}
_02077DE0:
	add r1, r1, #0x200
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077DF8: .word GXi_DmaId
	arm_func_end GX_LoadOBJPltt

	arm_func_start GXS_LoadOBJPltt
GXS_LoadOBJPltt: ; 0x02077DFC
	stmdb sp!, {r3, lr}
	ldr r3, _02077E50 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077E38
	cmp r3, #0x1c
	bls _02077E38
	add r2, r1, #0x600
	mov r1, lr
	add r2, r2, #0x5000000
	bl sub_0207BD3C
	ldmia sp!, {r3, pc}
_02077E38:
	add r1, r1, #0x600
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077E50: .word GXi_DmaId
	arm_func_end GXS_LoadOBJPltt

	arm_func_start GX_LoadOAM
GX_LoadOAM: ; 0x02077E54
	stmdb sp!, {r4, lr}
	ldr r3, _02077EA4 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _02077E90
	cmp r3, #0x30
	bls _02077E90
	mov r1, r4
	add r2, lr, #0x7000000
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077E90:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x7000000
	bl ArrayCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077EA4: .word GXi_DmaId
	arm_func_end GX_LoadOAM

	arm_func_start GXS_LoadOAM
GXS_LoadOAM: ; 0x02077EA8
	stmdb sp!, {r3, lr}
	ldr r3, _02077EFC ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077EE4
	cmp r3, #0x30
	bls _02077EE4
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x7000000
	bl sub_0207BCCC
	ldmia sp!, {r3, pc}
_02077EE4:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x7000000
	bl ArrayCopy32
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077EFC: .word GXi_DmaId
	arm_func_end GXS_LoadOAM

	arm_func_start GX_LoadOBJ
GX_LoadOBJ: ; 0x02077F00
	stmdb sp!, {r4, lr}
	ldr r3, _02077F54 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6400000
	beq _02077F40
	cmp r3, #0x30
	bls _02077F40
	mov r1, r4
	add r2, ip, lr
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077F40:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl ArrayCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077F54: .word GXi_DmaId
	arm_func_end GX_LoadOBJ

	arm_func_start GXS_LoadOBJ
GXS_LoadOBJ: ; 0x02077F58
	stmdb sp!, {r4, lr}
	ldr r3, _02077FAC ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6600000
	beq _02077F98
	cmp r3, #0x30
	bls _02077F98
	mov r1, r4
	add r2, ip, lr
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077F98:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl ArrayCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077FAC: .word GXi_DmaId
	arm_func_end GXS_LoadOBJ

	arm_func_start GX_LoadBG0Scr
GX_LoadBG0Scr: ; 0x02077FB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0ScrPtr
	ldr r1, _0207800C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02077FF8
	cmp r4, #0x1c
	bls _02077FF8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BD3C
	ldmia sp!, {r4, r5, r6, pc}
_02077FF8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207800C: .word GXi_DmaId
	arm_func_end GX_LoadBG0Scr

	arm_func_start GX_LoadBG1Scr
GX_LoadBG1Scr: ; 0x02078010
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1ScrPtr
	ldr r1, _0207806C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078058
	cmp r4, #0x1c
	bls _02078058
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BD3C
	ldmia sp!, {r4, r5, r6, pc}
_02078058:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207806C: .word GXi_DmaId
	arm_func_end GX_LoadBG1Scr

	arm_func_start GXS_LoadBG1Scr
GXS_LoadBG1Scr: ; 0x02078070
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1ScrPtr
	ldr r1, _020780CC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020780B8
	cmp r4, #0x1c
	bls _020780B8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BD3C
	ldmia sp!, {r4, r5, r6, pc}
_020780B8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020780CC: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Scr

	arm_func_start GX_LoadBG2Scr
GX_LoadBG2Scr: ; 0x020780D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2ScrPtr
	ldr r1, _0207812C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078118
	cmp r4, #0x1c
	bls _02078118
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BD3C
	ldmia sp!, {r4, r5, r6, pc}
_02078118:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207812C: .word GXi_DmaId
	arm_func_end GX_LoadBG2Scr

	arm_func_start GX_LoadBG3Scr
GX_LoadBG3Scr: ; 0x02078130
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3ScrPtr
	ldr r1, _0207818C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078178
	cmp r4, #0x1c
	bls _02078178
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BD3C
	ldmia sp!, {r4, r5, r6, pc}
_02078178:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207818C: .word GXi_DmaId
	arm_func_end GX_LoadBG3Scr

	arm_func_start GX_LoadBG0Char
GX_LoadBG0Char: ; 0x02078190
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG0CharPtr
	ldr r1, _020781EC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020781D8
	cmp r4, #0x30
	bls _020781D8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020781D8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020781EC: .word GXi_DmaId
	arm_func_end GX_LoadBG0Char

	arm_func_start GXS_LoadBG0Char
GXS_LoadBG0Char: ; 0x020781F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0CharPtr
	ldr r1, _0207824C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078238
	cmp r4, #0x30
	bls _02078238
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078238:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207824C: .word GXi_DmaId
	arm_func_end GXS_LoadBG0Char

	arm_func_start GX_LoadBG1Char
GX_LoadBG1Char: ; 0x02078250
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1CharPtr
	ldr r1, _020782AC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078298
	cmp r4, #0x30
	bls _02078298
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078298:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020782AC: .word GXi_DmaId
	arm_func_end GX_LoadBG1Char

	arm_func_start GXS_LoadBG1Char
GXS_LoadBG1Char: ; 0x020782B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1CharPtr
	ldr r1, _0207830C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020782F8
	cmp r4, #0x30
	bls _020782F8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020782F8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207830C: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Char

	arm_func_start GX_LoadBG2Char
GX_LoadBG2Char: ; 0x02078310
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2CharPtr
	ldr r1, _0207836C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078358
	cmp r4, #0x30
	bls _02078358
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078358:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207836C: .word GXi_DmaId
	arm_func_end GX_LoadBG2Char

	arm_func_start GX_LoadBG3Char
GX_LoadBG3Char: ; 0x02078370
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3CharPtr
	ldr r1, _020783CC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020783B8
	cmp r4, #0x30
	bls _020783B8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020783B8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020783CC: .word GXi_DmaId
	arm_func_end GX_LoadBG3Char

	arm_func_start GX_BeginLoadBGExtPltt
GX_BeginLoadBGExtPltt: ; 0x020783D0
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForBGExtPltt
	ldr r1, _02078460 ; =sSubBGExtPltt
	cmp r0, #0x20
	str r0, [r1, #0x14]
	bgt _02078404
	cmp r0, #0x20
	bge _02078448
	cmp r0, #0
	ldmleia sp!, {r3, pc}
	cmp r0, #0x10
	beq _02078420
	ldmia sp!, {r3, pc}
_02078404:
	cmp r0, #0x40
	bgt _02078414
	beq _02078434
	ldmia sp!, {r3, pc}
_02078414:
	cmp r0, #0x60
	beq _02078448
	ldmia sp!, {r3, pc}
_02078420:
	ldr r2, _02078464 ; =0x06880000
	mov r0, #0
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02078434:
	ldr r2, _02078468 ; =0x06894000
	mov r0, #0x4000
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02078448:
	ldr r2, _0207846C ; =0x06890000
	ldr r0, _02078460 ; =sSubBGExtPltt
	mov r1, #0
	str r2, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078460: .word sSubBGExtPltt
_02078464: .word 0x06880000
_02078468: .word 0x06894000
_0207846C: .word 0x06890000
	arm_func_end GX_BeginLoadBGExtPltt

	arm_func_start GX_EndLoadBGExtPltt
GX_EndLoadBGExtPltt: ; 0x02078470
	stmdb sp!, {r3, lr}
	ldr r0, _020784B0 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _0207848C
	bl sub_0207C0FC
_0207848C:
	ldr r0, _020784B4 ; =sSubBGExtPltt
	ldr r0, [r0, #0x14]
	bl GX_SetBankForBGExtPltt
	ldr r0, _020784B4 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020784B0: .word GXi_DmaId
_020784B4: .word sSubBGExtPltt
	arm_func_end GX_EndLoadBGExtPltt

	arm_func_start GX_BeginLoadOBJExtPltt
GX_BeginLoadOBJExtPltt: ; 0x020784B8
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForOBJExtPltt
	ldr r1, _020784F4 ; =sSubBGExtPltt
	cmp r0, #0
	str r0, [r1, #8]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x20
	beq _020784E8
	cmp r0, #0x40
	ldreq r0, _020784F8 ; =0x06894000
	streq r0, [r1, #4]
	ldmia sp!, {r3, pc}
_020784E8:
	ldr r0, _020784FC ; =0x06890000
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020784F4: .word sSubBGExtPltt
_020784F8: .word 0x06894000
_020784FC: .word 0x06890000
	arm_func_end GX_BeginLoadOBJExtPltt

	arm_func_start GX_EndLoadOBJExtPltt
GX_EndLoadOBJExtPltt: ; 0x02078500
	stmdb sp!, {r3, lr}
	ldr r0, _0207853C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _0207851C
	bl sub_0207C0FC
_0207851C:
	ldr r0, _02078540 ; =sSubBGExtPltt
	ldr r0, [r0, #8]
	bl GX_SetBankForOBJExtPltt
	ldr r0, _02078540 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207853C: .word GXi_DmaId
_02078540: .word sSubBGExtPltt
	arm_func_end GX_EndLoadOBJExtPltt

	arm_func_start GXS_BeginLoadBGExtPltt
GXS_BeginLoadBGExtPltt: ; 0x02078544
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubBGExtPltt
	ldr r1, _02078558 ; =sSubBGExtPltt
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078558: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadBGExtPltt

	arm_func_start GXS_EndLoadBGExtPltt
GXS_EndLoadBGExtPltt: ; 0x0207855C
	stmdb sp!, {r3, lr}
	ldr r0, _02078594 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078578
	bl sub_0207C0FC
_02078578:
	ldr r0, _02078598 ; =sSubBGExtPltt
	ldr r0, [r0]
	bl GX_SetBankForSubBGExtPltt
	ldr r0, _02078598 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078594: .word GXi_DmaId
_02078598: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadBGExtPltt

	arm_func_start GXS_BeginLoadOBJExtPltt
GXS_BeginLoadOBJExtPltt: ; 0x0207859C
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubOBJExtPltt
	ldr r1, _020785B0 ; =sSubBGExtPltt
	str r0, [r1, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020785B0: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadOBJExtPltt

	arm_func_start GXS_EndLoadOBJExtPltt
GXS_EndLoadOBJExtPltt: ; 0x020785B4
	stmdb sp!, {r3, lr}
	ldr r0, _020785EC ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020785D0
	bl sub_0207C0FC
_020785D0:
	ldr r0, _020785F0 ; =sSubBGExtPltt
	ldr r0, [r0, #0x18]
	bl GX_SetBankForSubOBJExtPltt
	ldr r0, _020785F0 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020785EC: .word GXi_DmaId
_020785F0: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadOBJExtPltt

	arm_func_start GX_BeginLoadTex
GX_BeginLoadTex: ; 0x020785F4
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTex
	mov r1, #6
	mul lr, r0, r1
	ldr r2, _02078640 ; =sTexStartAddrTable
	ldr r1, _02078644 ; =sTexStartAddrTable + 2
	ldrh ip, [r2, lr]
	ldr r2, _02078648 ; =sTexStartAddrTable + 4
	ldrh r3, [r1, lr]
	ldr r1, _0207864C ; =sClrImg
	ldrh r2, [r2, lr]
	str r0, [r1, #0x14]
	mov r0, ip, lsl #0xc
	str r0, [r1, #4]
	mov r0, r3, lsl #0xc
	str r0, [r1, #0x18]
	mov r0, r2, lsl #0xc
	str r0, [r1, #0x1c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078640: .word sTexStartAddrTable
_02078644: .word sTexStartAddrTable + 2
_02078648: .word sTexStartAddrTable + 4
_0207864C: .word sClrImg
	arm_func_end GX_BeginLoadTex

	arm_func_start GX_LoadTex
GX_LoadTex: ; 0x02078650
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02078788 ; =sClrImg
	mov r7, r0
	ldr r4, [r3, #0x18]
	mov ip, r1
	cmp r4, #0
	ldreq r0, [r3, #4]
	mov r6, r2
	addeq r2, r0, ip
	beq _0207873C
	ldr r2, [r3, #0x1c]
	add r0, ip, r6
	cmp r0, r2
	ldrlo r0, [r3, #4]
	addlo r2, r0, ip
	blo _0207873C
	cmp ip, r2
	addhs r0, r4, ip
	subhs r2, r0, r2
	bhs _0207873C
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	sub r5, r2, ip
	cmp r0, r1
	ldr lr, [r3, #4]
	beq _020786DC
	cmp r5, #0x30
	bls _020786DC
	mov r1, r7
	mov r3, r5
	add r2, lr, ip
	bl sub_0207BCCC
	b _020786EC
_020786DC:
	mov r0, r7
	mov r2, r5
	add r1, lr, ip
	bl ArrayCopy32
_020786EC:
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078724
	mov ip, #0
	str ip, [sp]
	mov r2, r4
	add r1, r7, r5
	sub r3, r6, r5
	str ip, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02078724:
	mov r1, r4
	add r0, r7, r5
	sub r2, r6, r5
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207873C:
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078770
	mov r4, #0
	str r4, [sp]
	mov r1, r7
	mov r3, r6
	str r4, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02078770:
	mov r1, r2
	mov r0, r7
	mov r2, r6
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02078788: .word sClrImg
_0207878C: .word GXi_DmaId
	arm_func_end GX_LoadTex

	arm_func_start GX_EndLoadTex
GX_EndLoadTex: ; 0x02078790
	stmdb sp!, {r3, lr}
	ldr r0, _020787D4 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020787AC
	bl sub_0207C0FC
_020787AC:
	ldr r0, _020787D8 ; =sClrImg
	ldr r0, [r0, #0x14]
	bl GX_SetBankForTex
	ldr r0, _020787D8 ; =sClrImg
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020787D4: .word GXi_DmaId
_020787D8: .word sClrImg
	arm_func_end GX_EndLoadTex

	arm_func_start GX_BeginLoadTexPltt
GX_BeginLoadTexPltt: ; 0x020787DC
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTexPltt
	mov r3, r0, asr #4
	ldr r1, _02078808 ; =sClrImg
	ldr r2, _0207880C ; =sTexPlttStartAddrTable
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	str r0, [r1, #0xc]
	mov r0, r2, lsl #0xc
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078808: .word sClrImg
_0207880C: .word sTexPlttStartAddrTable
	arm_func_end GX_BeginLoadTexPltt

	arm_func_start GX_LoadTexPltt
GX_LoadTexPltt: ; 0x02078810
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _02078874 ; =GXi_DmaId
	ldr lr, _02078878 ; =sClrImg
	ldr r4, [r3]
	mvn ip, #0
	mov r6, r0
	mov r5, r1
	mov r3, r2
	cmp r4, ip
	ldr lr, [lr, #8]
	beq _02078864
	mov ip, #0
	str ip, [sp]
	mov r0, r4
	mov r1, r6
	add r2, lr, r5
	str ip, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_02078864:
	add r1, lr, r5
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02078874: .word GXi_DmaId
_02078878: .word sClrImg
	arm_func_end GX_LoadTexPltt

	arm_func_start GX_EndLoadTexPltt
GX_EndLoadTexPltt: ; 0x0207887C
	stmdb sp!, {r3, lr}
	ldr r0, _020788B8 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078898
	bl sub_0207C0FC
_02078898:
	ldr r0, _020788BC ; =sClrImg
	ldr r0, [r0, #0xc]
	bl GX_SetBankForTexPltt
	ldr r0, _020788BC ; =sClrImg
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020788B8: .word GXi_DmaId
_020788BC: .word sClrImg
	arm_func_end GX_EndLoadTexPltt

	arm_func_start GeomGxFifoSendMtx4x3
GeomGxFifoSendMtx4x3: ; 0x020788C0
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	bx lr
	arm_func_end GeomGxFifoSendMtx4x3

	arm_func_start GX_SendFifo64B
GX_SendFifo64B: ; 0x020788E4
	stmdb sp!, {r4, r5, r6, r7, r8}
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, ip}
	stmia r1, {r2, r3, r4, r5, r6, r7, r8, ip}
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, ip}
	stmia r1, {r2, r3, r4, r5, r6, r7, r8, ip}
	ldmia sp!, {r4, r5, r6, r7, r8}
	bx lr
	arm_func_end GX_SendFifo64B

	arm_func_start sub_02078900
sub_02078900: ; 0x02078900
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	cmp r5, #0
	beq _02078930
	ldr r1, _0207896C ; =OS_IRQTable
	mvn r2, r4
	add r1, r1, #0x3000
	ldr r3, [r1, #0xff8]
	and r2, r3, r2
	str r2, [r1, #0xff8]
_02078930:
	bl SetIrqFlag
	ldr r1, _0207896C ; =OS_IRQTable
	add r0, r1, #0x3000
	ldr r0, [r0, #0xff8]
	tst r4, r0
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r1, #0x3f8
	ldr r5, _02078970 ; =DTCM_BSS
	add r6, r0, #0x3c00
_02078954:
	mov r0, r5
	bl sub_02079888
	ldr r0, [r6]
	tst r4, r0
	beq _02078954
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207896C: .word OS_IRQTable
_02078970: .word DTCM_BSS
	arm_func_end sub_02078900

	arm_func_start sub_02078974
sub_02078974: ; 0x02078974
	bx lr
	arm_func_end sub_02078974

	arm_func_start sub_02078978
sub_02078978: ; 0x02078978
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _020789EC ; =_022B95E4
	ldr r3, _020789F0 ; =_020B2B9C
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _020789BC
	ldr r0, _020789F4 ; =_022B95EC
	ldr r0, [r0, r5]
	blx r1
_020789BC:
	ldr r0, _020789F8 ; =OS_IRQTable
	ldr r1, _020789FC ; =_022B95E8
	add r0, r0, #0x3000
	ldr r2, [r0, #0xff8]
	ldr r1, [r1, r5]
	orr r2, r2, r4
	str r2, [r0, #0xff8]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl sub_02078C98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020789EC: .word _022B95E4
_020789F0: .word _020B2B9C
_020789F4: .word _022B95EC
_020789F8: .word OS_IRQTable
_020789FC: .word _022B95E8
	arm_func_end sub_02078978

	arm_func_start sub_02078A00
sub_02078A00: ; 0x02078A00
	ldr ip, _02078A0C ; =sub_02078978
	mov r0, #0
	bx ip
	.align 2, 0
_02078A0C: .word sub_02078978
	arm_func_end sub_02078A00

	arm_func_start sub_02078A10
sub_02078A10: ; 0x02078A10
	ldr ip, _02078A1C ; =sub_02078978
	mov r0, #1
	bx ip
	.align 2, 0
_02078A1C: .word sub_02078978
	arm_func_end sub_02078A10

	arm_func_start sub_02078A20
sub_02078A20: ; 0x02078A20
	ldr ip, _02078A2C ; =sub_02078978
	mov r0, #2
	bx ip
	.align 2, 0
_02078A2C: .word sub_02078978
	arm_func_end sub_02078A20

	arm_func_start sub_02078A30
sub_02078A30: ; 0x02078A30
	ldr ip, _02078A3C ; =sub_02078978
	mov r0, #3
	bx ip
	.align 2, 0
_02078A3C: .word sub_02078978
	arm_func_end sub_02078A30

	arm_func_start sub_02078A40
sub_02078A40: ; 0x02078A40
	ldr ip, _02078A4C ; =sub_02078978
	mov r0, #4
	bx ip
	.align 2, 0
_02078A4C: .word sub_02078978
	arm_func_end sub_02078A40

	arm_func_start sub_02078A50
sub_02078A50: ; 0x02078A50
	ldr ip, _02078A5C ; =sub_02078978
	mov r0, #5
	bx ip
	.align 2, 0
_02078A5C: .word sub_02078978
	arm_func_end sub_02078A50

	arm_func_start sub_02078A60
sub_02078A60: ; 0x02078A60
	ldr ip, _02078A6C ; =sub_02078978
	mov r0, #6
	bx ip
	.align 2, 0
_02078A6C: .word sub_02078978
	arm_func_end sub_02078A60

	arm_func_start sub_02078A70
sub_02078A70: ; 0x02078A70
	ldr ip, _02078A7C ; =sub_02078978
	mov r0, #7
	bx ip
	.align 2, 0
_02078A7C: .word sub_02078978
	arm_func_end sub_02078A70

	arm_func_start sub_02078A80
sub_02078A80: ; 0x02078A80
	ldr r0, _02078A94 ; =DTCM_BSS
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	bx lr
	.align 2, 0
_02078A94: .word DTCM_BSS
	arm_func_end sub_02078A80

	arm_func_start sub_02078A98
sub_02078A98: ; 0x02078A98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, #0
	mov r2, #0xc
	ldr r4, _02078B18 ; =OS_IRQTable
	ldr r6, _02078B1C ; =_022B95E4
	mov r7, r8
	mov lr, r8
	mov ip, #1
	mov r3, r2
_02078ABC:
	tst r0, #1
	beq _02078B04
	mov sb, r7
	cmp r8, #8
	blt _02078AE0
	cmp r8, #0xb
	suble r5, r8, #8
	mlale sb, r5, r3, r6
	ble _02078AFC
_02078AE0:
	cmp r8, #3
	blt _02078AF8
	cmp r8, #6
	addle r5, r8, #1
	mlale sb, r5, r2, r6
	ble _02078AFC
_02078AF8:
	str r1, [r4, r8, lsl #2]
_02078AFC:
	cmp sb, #0
	stmneia sb, {r1, ip, lr}
_02078B04:
	add r8, r8, #1
	cmp r8, #0x16
	mov r0, r0, lsr #1
	blt _02078ABC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02078B18: .word OS_IRQTable
_02078B1C: .word _022B95E4
	arm_func_end sub_02078A98

	arm_func_start sub_02078B20
sub_02078B20: ; 0x02078B20
	ldr r2, _02078BA4 ; =OS_IRQTable
	mov r1, #0
_02078B28:
	tst r0, #1
	beq _02078B88
	cmp r1, #8
	blt _02078B58
	cmp r1, #0xb
	bgt _02078B58
	sub r1, r1, #8
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _02078BA8 ; =_022B95E4
	ldr r0, [r0, r2]
	bx lr
_02078B58:
	cmp r1, #3
	blt _02078B80
	cmp r1, #6
	bgt _02078B80
	add r1, r1, #1
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _02078BA8 ; =_022B95E4
	ldr r0, [r0, r2]
	bx lr
_02078B80:
	ldr r0, [r2]
	bx lr
_02078B88:
	add r1, r1, #1
	cmp r1, #0x16
	mov r0, r0, lsr #1
	add r2, r2, #4
	blt _02078B28
	mov r0, #0
	bx lr
	.align 2, 0
_02078BA4: .word OS_IRQTable
_02078BA8: .word _022B95E4
	arm_func_end sub_02078B20

	arm_func_start sub_02078BAC
sub_02078BAC: ; 0x02078BAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0xc
	mul r6, r0, r3
	ldr ip, _02078BE8 ; =_022B95E4
	add r4, r0, #8
	mov r5, #1
	mov r0, r5, lsl r4
	ldr r3, _02078BEC ; =_022B95EC
	str r1, [ip, r6]
	str r2, [r3, r6]
	bl sub_02078C68
	and r1, r0, r5, lsl r4
	ldr r0, _02078BF0 ; =_022B95E8
	str r1, [r0, r6]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02078BE8: .word _022B95E4
_02078BEC: .word _022B95EC
_02078BF0: .word _022B95E8
	arm_func_end sub_02078BAC

	arm_func_start sub_02078BF4
sub_02078BF4: ; 0x02078BF4
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _02078C30 ; =_022B9614
	add r0, r0, #3
	mov r3, #1
	mov r0, r3, lsl r0
	ldr r3, _02078C34 ; =_022B961C
	str r1, [ip, r4]
	str r2, [r3, r4]
	bl sub_02078C68
	ldr r0, _02078C38 ; =_022B9618
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02078C30: .word _022B9614
_02078C34: .word _022B961C
_02078C38: .word _022B9618
	arm_func_end sub_02078BF4

	arm_func_start sub_02078C3C
sub_02078C3C: ; 0x02078C3C
	ldr r3, _02078C64 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #8]
	str r0, [r3, #8]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078C64: .word 0x04000208
	arm_func_end sub_02078C3C

	arm_func_start sub_02078C68
sub_02078C68: ; 0x02078C68
	ldr r3, _02078C94 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #8]
	orr r0, r1, r0
	str r0, [r3, #8]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078C94: .word 0x04000208
	arm_func_end sub_02078C68

	arm_func_start sub_02078C98
sub_02078C98: ; 0x02078C98
	ldr ip, _02078CC4 ; =0x04000208
	mov r2, #0
	ldrh r3, [ip]
	mvn r1, r0
	strh r2, [ip]
	ldr r0, [ip, #8]
	and r1, r0, r1
	str r1, [ip, #8]
	ldrh r1, [ip]
	strh r3, [ip]
	bx lr
	.align 2, 0
_02078CC4: .word 0x04000208
	arm_func_end sub_02078C98

	arm_func_start sub_02078CC8
sub_02078CC8: ; 0x02078CC8
	ldr r3, _02078CF0 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #0xc]
	str r0, [r3, #0xc]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078CF0: .word 0x04000208
	arm_func_end sub_02078CC8

	arm_func_start sub_02078CF4
sub_02078CF4: ; 0x02078CF4
	ldr ip, _02078D18 ; =OS_IRQTable
	ldr r3, _02078D1C ; =0xFDDB597D
	add r0, ip, #0x3000
	ldr r2, _02078D20 ; =0x7BF9DD5B
	ldr r1, _02078D24 ; =0x00000800
	str r3, [r0, #0xf7c]
	add r0, ip, #0x3f80
	str r2, [r0, -r1]
	bx lr
	.align 2, 0
_02078D18: .word OS_IRQTable
_02078D1C: .word 0xFDDB597D
_02078D20: .word 0x7BF9DD5B
_02078D24: .word 0x00000800
	arm_func_end sub_02078CF4

	arm_func_start sub_02078D28
sub_02078D28: ; 0x02078D28
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02078DE4 ; =_022B9644
	ldr r0, [r3]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _02078DE8 ; =0x027FFFF0
	mov r4, #1
	mov r2, #0
	mov r0, #0x7e
	str r4, [r3]
	str r2, [r1]
	bl sub_02078E40
	ldr r5, _02078DE8 ; =0x027FFFF0
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _02078D80
	mov r4, #0x400
_02078D6C:
	mov r0, r4
	blx SVC_WaitByLoop
	ldrh r0, [r5, #6]
	cmp r0, #0
	bne _02078D6C
_02078D80:
	ldr ip, _02078DEC ; =0x027FFFB0
	mvn r0, #0
	str r0, [ip]
	mov r3, r0, lsl #0x10
	add r1, ip, #0x10
	mov r0, #0
	mov r2, #0x28
	str r3, [ip, #4]
	bl ArrayFill32
	ldr ip, _02078DF0 ; =0x04000204
	ldr r1, _02078DE8 ; =0x027FFFF0
	ldrh r3, [ip]
	mov r0, #0x7e
	mov r2, #0
	orr r3, r3, #0x800
	strh r3, [ip]
	ldrh r3, [ip]
	orr r3, r3, #0x80
	strh r3, [ip]
	bl sub_02078EC4
	ldr r1, _02078DE8 ; =0x027FFFF0
	mov r0, #0x7f
	mov r2, #0
	bl sub_02078E40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02078DE4: .word _022B9644
_02078DE8: .word 0x027FFFF0
_02078DEC: .word 0x027FFFB0
_02078DF0: .word 0x04000204
	arm_func_end sub_02078D28

	arm_func_start sub_02078DF4
sub_02078DF4: ; 0x02078DF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_02078ED4
	cmp r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r4, #0x400
_02078E18:
	mov r0, r4
	blx SVC_WaitByLoop
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl sub_02078ED4
	cmp r0, #0
	bgt _02078E18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02078DF4

	arm_func_start sub_02078E40
sub_02078E40: ; 0x02078E40
	ldr ip, _02078E4C ; =sub_02078DF4
	mov r3, #0
	bx ip
	.align 2, 0
_02078E4C: .word sub_02078DF4
	arm_func_end sub_02078E40

	arm_func_start sub_02078E50
sub_02078E50: ; 0x02078E50
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	mov r5, r3
	cmp r0, r1
	mvnne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	beq _02078E80
	bl EnableIrqFiqFlags
	b _02078E84
_02078E80:
	bl EnableIrqFlag
_02078E84:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _02078E9C
	blx r6
_02078E9C:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _02078EB8
	bl SetIrqFiqFlags
	b _02078EBC
_02078EB8:
	bl SetIrqFlag
_02078EBC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02078E50

	arm_func_start sub_02078EC4
sub_02078EC4: ; 0x02078EC4
	ldr ip, _02078ED0 ; =sub_02078E50
	mov r3, #0
	bx ip
	.align 2, 0
_02078ED0: .word sub_02078E50
	arm_func_end sub_02078EC4

	arm_func_start sub_02078ED4
sub_02078ED4: ; 0x02078ED4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _02078EF4
	bl EnableIrqFiqFlags
	b _02078EF8
_02078EF4:
	bl EnableIrqFlag
_02078EF8:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl AtomicExchange
	movs r4, r0
	bne _02078F20
	cmp r7, #0
	beq _02078F1C
	blx r7
_02078F1C:
	strh sb, [r8, #4]
_02078F20:
	cmp r6, #0
	mov r0, r5
	beq _02078F34
	bl SetIrqFiqFlags
	b _02078F38
_02078F34:
	bl SetIrqFlag
_02078F38:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02078ED4

	arm_func_start sub_02078F40
sub_02078F40: ; 0x02078F40
	ldr ip, _02078F54 ; =sub_02078E50
	ldr r1, _02078F58 ; =0x027FFFE8
	ldr r2, _02078F5C ; =sub_02078FA4
	mov r3, #1
	bx ip
	.align 2, 0
_02078F54: .word sub_02078E50
_02078F58: .word 0x027FFFE8
_02078F5C: .word sub_02078FA4
	arm_func_end sub_02078F40

	arm_func_start sub_02078F60
sub_02078F60: ; 0x02078F60
	ldr r1, _02078F68 ; =sub_02078F40
	bx r1
	.align 2, 0
_02078F68: .word sub_02078F40
	arm_func_end sub_02078F60

	arm_func_start sub_02078F6C
sub_02078F6C: ; 0x02078F6C
	ldr ip, _02078F80 ; =sub_02078ED4
	ldr r1, _02078F84 ; =0x027FFFE8
	ldr r2, _02078F88 ; =sub_02078F8C
	mov r3, #1
	bx ip
	.align 2, 0
_02078F80: .word sub_02078ED4
_02078F84: .word 0x027FFFE8
_02078F88: .word sub_02078F8C
	arm_func_end sub_02078F6C

	arm_func_start sub_02078F8C
sub_02078F8C: ; 0x02078F8C
	ldr r1, _02078FA0 ; =0x04000204
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_02078FA0: .word 0x04000204
	arm_func_end sub_02078F8C

	arm_func_start sub_02078FA4
sub_02078FA4: ; 0x02078FA4
	ldr r1, _02078FB8 ; =0x04000204
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_02078FB8: .word 0x04000204
	arm_func_end sub_02078FA4

	arm_func_start sub_02078FBC
sub_02078FBC: ; 0x02078FBC
	ldr ip, _02078FCC ; =sub_02078E40
	ldr r1, _02078FD0 ; =0x027FFFE0
	ldr r2, _02078FD4 ; =sub_02078FF4
	bx ip
	.align 2, 0
_02078FCC: .word sub_02078E40
_02078FD0: .word 0x027FFFE0
_02078FD4: .word sub_02078FF4
	arm_func_end sub_02078FBC

	arm_func_start sub_02078FD8
sub_02078FD8: ; 0x02078FD8
	ldr ip, _02078FE8 ; =sub_02078EC4
	ldr r1, _02078FEC ; =0x027FFFE0
	ldr r2, _02078FF0 ; =sub_0207900C
	bx ip
	.align 2, 0
_02078FE8: .word sub_02078EC4
_02078FEC: .word 0x027FFFE0
_02078FF0: .word sub_0207900C
	arm_func_end sub_02078FD8

	arm_func_start sub_02078FF4
sub_02078FF4: ; 0x02078FF4
	ldr r1, _02079008 ; =0x04000204
	ldrh r0, [r1]
	bic r0, r0, #0x800
	strh r0, [r1]
	bx lr
	.align 2, 0
_02079008: .word 0x04000204
	arm_func_end sub_02078FF4

	arm_func_start sub_0207900C
sub_0207900C: ; 0x0207900C
	ldr r1, _02079020 ; =0x04000204
	ldrh r0, [r1]
	orr r0, r0, #0x800
	strh r0, [r1]
	bx lr
	.align 2, 0
_02079020: .word 0x04000204
	arm_func_end sub_0207900C

	arm_func_start sub_02079024
sub_02079024: ; 0x02079024
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end sub_02079024

	arm_func_start OS_GetLockID
OS_GetLockID: ; 0x0207902C
	ldr r3, _0207908C ; =0x027FFFB0
	ldr r1, [r3]
	clz r2, r1
	cmp r2, #0x20
	bne _02079044
	b _02079048
_02079044:
	mov r0, #0x40
_02079048:
	bne _02079070
	add r3, r3, #4
	ldr r1, [r3]
	clz r2, r1
	cmp r2, #0x20
	ldr r0, _02079090 ; =0xFFFFFFFD
	beq _02079068
	b _0207906C
_02079068:
	bx lr
_0207906C:
	mov r0, #0x60
_02079070:
	add r0, r0, r2
	mov r1, #0x80000000
	mov r1, r1, lsr r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_0207908C: .word 0x027FFFB0
_02079090: .word 0xFFFFFFFD
	arm_func_end OS_GetLockID

	arm_func_start sub_02079094
sub_02079094: ; 0x02079094
	ldr r3, _020790D8 ; =0x027FFFB0
	cmp r0, #0x60
	bpl _020790A4
	b _020790A8
_020790A4:
	add r3, r3, #4
_020790A8:
	bpl _020790B0
	b _020790B4
_020790B0:
	sub r0, r0, #0x60
_020790B4:
	bmi _020790BC
	b _020790C0
_020790BC:
	sub r0, r0, #0x40
_020790C0:
	mov r1, #0x80000000
	mov r1, r1, lsr r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_020790D8: .word 0x027FFFB0
	arm_func_end sub_02079094

	arm_func_start sub_020790DC
sub_020790DC: ; 0x020790DC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl sub_02079104
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_020790DC

	arm_func_start sub_02079104
sub_02079104: ; 0x02079104
	ldr ip, _02079118 ; =sub_02079144
	mov r3, r2
	mov r2, r1
	mvn r1, #0x80000000
	bx ip
	.align 2, 0
_02079118: .word sub_02079144
	arm_func_end sub_02079104

	arm_func_start sub_0207911C
sub_0207911C: ; 0x0207911C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl sub_02079144
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0207911C

	arm_func_start sub_02079144
sub_02079144: ; 0x02079144
	ldr ip, _0207914C ; =sub_02085BD4
	bx ip
	.align 2, 0
_0207914C: .word sub_02085BD4
	arm_func_end sub_02079144

	arm_func_start IncrementThreadCount
IncrementThreadCount: ; 0x02079150
	ldr r1, _02079164 ; =THREAD_INFO_STRUCT
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	bx lr
	.align 2, 0
_02079164: .word THREAD_INFO_STRUCT
	arm_func_end IncrementThreadCount

	arm_func_start sub_02079168
sub_02079168: ; 0x02079168
	ldr ip, [r0]
	b _0207917C
_02079170:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x80]
_0207917C:
	cmp ip, #0
	beq _02079194
	ldr r3, [ip, #0x70]
	ldr r2, [r1, #0x70]
	cmp r3, r2
	bls _02079170
_02079194:
	cmp ip, #0
	bne _020791C0
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	mov r2, #0
	str r2, [r1, #0x80]
	str r1, [r0, #4]
	bx lr
_020791C0:
	ldr r2, [ip, #0x7c]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	str ip, [r1, #0x80]
	str r1, [ip, #0x7c]
	bx lr
	arm_func_end sub_02079168

	arm_func_start sub_020791E0
sub_020791E0: ; 0x020791E0
	ldr r2, [r0]
	cmp r2, #0
	beq _0207920C
	ldr r1, [r2, #0x80]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x7c]
	moveq r1, #0
	streq r1, [r0, #4]
	streq r1, [r2, #0x78]
_0207920C:
	mov r0, r2
	bx lr
	arm_func_end sub_020791E0

	arm_func_start sub_02079214
sub_02079214: ; 0x02079214
	ldr ip, [r0]
	mov r2, ip
	cmp ip, #0
	beq _02079260
_02079224:
	cmp r2, r1
	ldr r3, [r2, #0x80]
	bne _02079254
	cmp ip, r2
	ldr ip, [r2, #0x7c]
	streq r3, [r0]
	strne r3, [ip, #0x80]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x7c]
	b _02079260
_02079254:
	mov r2, r3
	cmp r3, #0
	bne _02079224
_02079260:
	mov r0, r2
	bx lr
	arm_func_end sub_02079214

	arm_func_start sub_02079268
sub_02079268: ; 0x02079268
	ldr r2, [r0]
	cmp r2, #0
	beq _02079290
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_02079290:
	mov r0, r2
	bx lr
	arm_func_end sub_02079268

	arm_func_start InsertThreadIntoList
InsertThreadIntoList: ; 0x02079298
	stmdb sp!, {r3, lr}
	ldr r1, _020792F4 ; =THREAD_INFO_STRUCT
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _020792B8
_020792B0:
	mov ip, r3
	ldr r3, [r3, #0x68]
_020792B8:
	cmp r3, #0
	beq _020792D0
	ldr r2, [r3, #0x70]
	ldr r1, [r0, #0x70]
	cmp r2, r1
	blo _020792B0
_020792D0:
	cmp ip, #0
	ldrne r1, [ip, #0x68]
	strne r1, [r0, #0x68]
	strne r0, [ip, #0x68]
	ldmneia sp!, {r3, pc}
	ldr r1, _020792F4 ; =THREAD_INFO_STRUCT
	str lr, [r0, #0x68]
	str r0, [r1, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020792F4: .word THREAD_INFO_STRUCT
	arm_func_end InsertThreadIntoList

	arm_func_start sub_020792F8
sub_020792F8: ; 0x020792F8
	ldr r1, _0207933C ; =THREAD_INFO_STRUCT
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _02079310
_02079308:
	mov r2, r1
	ldr r1, [r1, #0x68]
_02079310:
	cmp r1, #0
	cmpne r1, r0
	bne _02079308
	cmp r2, #0
	ldrne r0, [r0, #0x68]
	strne r0, [r2, #0x68]
	bxne lr
	ldr r1, [r0, #0x68]
	ldr r0, _0207933C ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
_0207933C: .word THREAD_INFO_STRUCT
	arm_func_end sub_020792F8

	arm_func_start sub_02079340
sub_02079340: ; 0x02079340
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r0, #0x26]
	ldr r4, _02079404 ; =_022B966C
	cmp r0, #0
	bne _02079370
	bl GetProcessorMode
	cmp r0, #0x12
	bne _0207937C
_02079370:
	mov r0, #1
	strh r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
_0207937C:
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl sub_02079968
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r6, #0x64]
	cmp r0, #2
	beq _020793B8
	mov r0, r6
	bl sub_02079D08
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_020793B8:
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r2, [r0]
	cmp r2, #0
	beq _020793D4
	mov r0, r6
	mov r1, r5
	blx r2
_020793D4:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _020793EC
	mov r0, r6
	mov r1, r5
	blx r2
_020793EC:
	ldr r1, _02079400 ; =THREAD_INFO_STRUCT
	mov r0, r5
	str r5, [r1, #0x28]
	bl sub_02079D54
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02079400: .word THREAD_INFO_STRUCT
_02079404: .word _022B966C
	arm_func_end sub_02079340

	arm_func_start sub_02079408
sub_02079408: ; 0x02079408
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02079518 ; =THREAD_INFO_STRUCT
	ldr r1, [r0, #0xc]
	cmp r1, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	mov r2, #1
	ldr r1, _0207951C ; =_022B9670
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	mov r1, #0x10
	str r1, [r0, #0x164]
	mov r3, #0
	str r3, [r0, #0x160]
	str r2, [r0, #0x158]
	str r3, [r0, #0x15c]
	ldr r2, _02079520 ; =0x00000000
	ldr r1, _02079524 ; =_022B973C
	str r3, [r0, #0x168]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _02079528 ; =SDK_SECTION_ARENA_DTCM_START
	ble _0207947C
	ldr r1, _0207952C ; =OS_IRQTable
	ldr r0, _02079530 ; =0x00000800
	add r1, r1, #0x3f80
	sub r0, r1, r0
_0207947C:
	ldr r1, _0207952C ; =OS_IRQTable
	sub ip, r0, r2
	add r2, r1, #0x3f80
	ldr r0, _02079530 ; =0x00000800
	ldr r1, _02079518 ; =THREAD_INFO_STRUCT
	sub r3, r2, r0
	str r3, [r1, #0x188]
	str ip, [r1, #0x184]
	mov r0, #0
	ldr r2, _02079534 ; =0xFDDB597D
	str r0, [r1, #0x18c]
	str r2, [r3, #-4]
	ldr r2, [r1, #0x184]
	ldr ip, _02079538 ; =0x7BF9DD5B
	ldr r3, _0207953C ; =_022B966C
	str ip, [r2]
	str r0, [r1, #0x194]
	str r0, [r1, #0x190]
	strh r0, [r1, #0x24]
	ldr r2, _02079540 ; =0x027FFFA0
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl sub_02079BDC
	mov r2, #0xc8
	str r2, [sp]
	mov ip, #0x1f
	ldr r0, _02079544 ; =_022B967C
	ldr r1, _02079548 ; =_02079C04
	ldr r3, _0207954C ; =_022B98C4
	mov r2, #0
	str ip, [sp, #4]
	bl StartThread
	ldr r0, _02079518 ; =THREAD_INFO_STRUCT
	mov r1, #0x20
	str r1, [r0, #0xa4]
	mov r1, #1
	str r1, [r0, #0x98]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02079518: .word THREAD_INFO_STRUCT
_0207951C: .word _022B9670
_02079520: .word 0x00000000
_02079524: .word _022B973C
_02079528: .word SDK_SECTION_ARENA_DTCM_START
_0207952C: .word OS_IRQTable
_02079530: .word 0x00000800
_02079534: .word 0xFDDB597D
_02079538: .word 0x7BF9DD5B
_0207953C: .word _022B966C
_02079540: .word 0x027FFFA0
_02079544: .word _022B967C
_02079548: .word sub_02079C04
_0207954C: .word _022B98C4
	arm_func_end sub_02079408

	arm_func_start sub_02079550
sub_02079550: ; 0x02079550
	ldr r0, _0207955C ; =_022B9654
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0207955C: .word _022B9654
	arm_func_end sub_02079550

	arm_func_start StartThread
StartThread: ; 0x02079560
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl EnableIrqFlag
	mov r4, r0
	bl IncrementThreadCount
	ldr r2, [sp, #0x1c]
	mov r1, #0
	str r2, [r8, #0x70]
	str r0, [r8, #0x6c]
	str r1, [r8, #0x64]
	mov r0, r8
	str r1, [r8, #0x74]
	bl InsertThreadIntoList
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x94]
	sub r5, r6, r0
	sub r2, r6, #4
	mov ip, #0
	str r5, [r8, #0x90]
	str ip, [r8, #0x98]
	ldr r6, _02079650 ; =0xFDDB597D
	ldr r0, [r8, #0x94]
	ldr r3, _02079654 ; =0x7BF9DD5B
	str r6, [r0, #-4]
	ldr r0, [r8, #0x90]
	str r3, [r0]
	str ip, [r8, #0xa0]
	mov r0, r8
	str ip, [r8, #0x9c]
	bl InitThread
	ldr r2, _02079658 ; =ThreadExit
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl ArrayFill32
	mov r1, #0
	str r1, [r8, #0x84]
	str r1, [r8, #0x88]
	mov r0, r8
	str r1, [r8, #0x8c]
	bl SetThreadField0xB4
	mov r0, #0
	str r0, [r8, #0x78]
	str r0, [r8, #0x80]
	add r1, r8, #0xa4
	mov r2, #0xc
	str r0, [r8, #0x7c]
	bl ArrayFill32
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0xb0]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079650: .word 0xFDDB597D
_02079654: .word 0x7BF9DD5B
_02079658: .word ThreadExit
	arm_func_end StartThread

	arm_func_start ThreadExit
ThreadExit: ; 0x0207965C
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r0, _02079678 ; =THREAD_INFO_STRUCT
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl sub_0207967C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02079678: .word THREAD_INFO_STRUCT
	arm_func_end ThreadExit

	arm_func_start sub_0207967C
sub_0207967C: ; 0x0207967C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020796D0 ; =THREAD_INFO_STRUCT
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _020796C4
	ldr r1, _020796D4 ; =sub_020796D8
	bl InitThread
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x64]
	bl sub_02079D54
	ldmia sp!, {r3, r4, r5, pc}
_020796C4:
	mov r0, r4
	bl sub_020796D8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020796D0: .word THREAD_INFO_STRUCT
_020796D4: .word sub_020796D8
	arm_func_end sub_0207967C

	arm_func_start sub_020796D8
sub_020796D8: ; 0x020796D8
	stmdb sp!, {r3, lr}
	ldr r1, _0207970C ; =THREAD_INFO_STRUCT
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02079704
	mov r1, #0
	str r1, [r3, #0xb4]
	blx r2
	bl EnableIrqFlag
_02079704:
	bl sub_02079710
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207970C: .word THREAD_INFO_STRUCT
	arm_func_end sub_020796D8

	arm_func_start sub_02079710
sub_02079710: ; 0x02079710
	stmdb sp!, {r4, lr}
	ldr r0, _02079768 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl sub_02079C14
	mov r0, r4
	bl sub_0207A128
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _02079740
	mov r1, r4
	bl sub_02079214
_02079740:
	mov r0, r4
	bl sub_020792F8
	mov r1, #2
	add r0, r4, #0x9c
	str r1, [r4, #0x64]
	bl sub_020798D8
	bl sub_02079C48
	bl sub_02079990
	bl WaitForever2
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079768: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079710

	arm_func_start sub_0207976C
sub_0207976C: ; 0x0207976C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _020797E4 ; =THREAD_INFO_STRUCT
	mov r4, r0
	ldr r0, [r1, #0x28]
	cmp r0, r5
	bne _02079790
	bl sub_02079710
_02079790:
	bl sub_02079C14
	mov r0, r5
	bl sub_0207A128
	mov r0, r5
	bl sub_020797E8
	ldr r0, [r5, #0x78]
	cmp r0, #0
	beq _020797B8
	mov r1, r5
	bl sub_02079214
_020797B8:
	mov r0, r5
	bl sub_020792F8
	mov r1, #2
	add r0, r5, #0x9c
	str r1, [r5, #0x64]
	bl sub_020798D8
	bl sub_02079C48
	mov r0, r4
	bl SetIrqFlag
	bl sub_02079990
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020797E4: .word THREAD_INFO_STRUCT
	arm_func_end sub_0207976C

	arm_func_start sub_020797E8
sub_020797E8: ; 0x020797E8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0207B1E8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020797E8

	arm_func_start sub_02079800
sub_02079800: ; 0x02079800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5, #0x64]
	mov r4, r0
	cmp r1, #2
	beq _02079824
	add r0, r5, #0x9c
	bl sub_02079888
_02079824:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02079800

	arm_func_start sub_02079830
sub_02079830: ; 0x02079830
	ldr r0, [r0, #0x64]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_02079830

	arm_func_start sub_02079844
sub_02079844: ; 0x02079844
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	bl EnableIrqFlag
	mov r4, r0
	cmp r5, #0
	beq _02079870
	mov r0, r5
	mov r1, r6
	str r5, [r6, #0x78]
	bl sub_02079168
_02079870:
	mov r0, #0
	str r0, [r6, #0x64]
	bl sub_02079340
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02079844

	arm_func_start sub_02079888
sub_02079888: ; 0x02079888
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, _020798D4 ; =THREAD_INFO_STRUCT
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _020798BC
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x78]
	bl sub_02079168
_020798BC:
	mov r0, #0
	str r0, [r5, #0x64]
	bl sub_02079340
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020798D4: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079888

	arm_func_start sub_020798D8
sub_020798D8: ; 0x020798D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl EnableIrqFlag
	ldr r1, [r7]
	mov r6, r0
	cmp r1, #0
	beq _02079934
	beq _02079924
	mov r5, #1
	mov r4, #0
_02079900:
	mov r0, r7
	bl sub_020791E0
	str r5, [r0, #0x64]
	str r4, [r0, #0x78]
	str r4, [r0, #0x80]
	str r4, [r0, #0x7c]
	ldr r0, [r7]
	cmp r0, #0
	bne _02079900
_02079924:
	mov r0, #0
	str r0, [r7, #4]
	str r0, [r7]
	bl sub_02079340
_02079934:
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020798D8

	arm_func_start sub_02079940
sub_02079940: ; 0x02079940
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x64]
	bl sub_02079340
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02079940

	arm_func_start sub_02079968
sub_02079968: ; 0x02079968
	ldr r0, _0207998C ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #0x2c]
	b _02079978
_02079974:
	ldr r0, [r0, #0x68]
_02079978:
	cmp r0, #0
	ldrne r1, [r0, #0x64]
	cmpne r1, #1
	bne _02079974
	bx lr
	.align 2, 0
_0207998C: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079968

	arm_func_start sub_02079990
sub_02079990: ; 0x02079990
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl sub_02079340
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	arm_func_end sub_02079990

	arm_func_start sub_020799AC
sub_020799AC: ; 0x020799AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02079A60 ; =THREAD_INFO_STRUCT
	mov r4, #0
	mov r5, r4
	mov r6, r4
	ldr r8, [r0, #0x28]
	bl EnableIrqFlag
	ldr r1, _02079A60 ; =THREAD_INFO_STRUCT
	mov r7, r0
	ldr r1, [r1, #0x2c]
	mov r0, r4
	cmp r1, #0
	beq _02079A0C
	ldr r2, [r8, #0x70]
_020799E4:
	cmp r1, r8
	moveq r4, r0
	ldr r0, [r1, #0x70]
	cmp r2, r0
	moveq r5, r1
	mov r0, r1
	ldr r1, [r1, #0x68]
	addeq r6, r6, #1
	cmp r1, #0
	bne _020799E4
_02079A0C:
	cmp r6, #1
	ble _02079A1C
	cmp r5, r8
	bne _02079A28
_02079A1C:
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02079A28:
	cmp r4, #0
	ldrne r0, [r8, #0x68]
	strne r0, [r4, #0x68]
	bne _02079A44
	ldr r1, [r8, #0x68]
	ldr r0, _02079A60 ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
_02079A44:
	ldr r0, [r5, #0x68]
	str r0, [r8, #0x68]
	str r8, [r5, #0x68]
	bl sub_02079340
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079A60: .word THREAD_INFO_STRUCT
	arm_func_end sub_020799AC

	arm_func_start sub_02079A64
sub_02079A64: ; 0x02079A64
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02079B04 ; =THREAD_INFO_STRUCT
	mov r7, r0
	mov r6, r1
	ldr r8, [r2, #0x2c]
	mov r4, #0
	bl EnableIrqFlag
	mov r5, r0
	b _02079A90
_02079A88:
	mov r4, r8
	ldr r8, [r8, #0x68]
_02079A90:
	cmp r8, #0
	cmpne r8, r7
	bne _02079A88
	cmp r8, #0
	ldrne r0, _02079B08 ; =_022B967C
	cmpne r8, r0
	bne _02079ABC
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02079ABC:
	ldr r0, [r8, #0x70]
	cmp r0, r6
	beq _02079AF4
	cmp r4, #0
	ldrne r0, [r7, #0x68]
	strne r0, [r4, #0x68]
	bne _02079AE4
	ldr r1, [r7, #0x68]
	ldr r0, _02079B04 ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
_02079AE4:
	mov r0, r7
	str r6, [r7, #0x70]
	bl InsertThreadIntoList
	bl sub_02079340
_02079AF4:
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079B04: .word THREAD_INFO_STRUCT
_02079B08: .word _022B967C
	arm_func_end sub_02079A64

	arm_func_start sub_02079B0C
sub_02079B0C: ; 0x02079B0C
	ldr r0, [r0, #0x70]
	bx lr
	arm_func_end sub_02079B0C

	arm_func_start sub_02079B14
sub_02079B14: ; 0x02079B14
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r4, r0
	add r0, sp, #8
	bl sub_0207B040
	ldr r0, _02079BB0 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl EnableIrqFlag
	ldr r1, _02079BB4 ; =0x000082EA
	mov r2, #0
	umull r5, r3, r4, r1
	mla r3, r4, r2, r3
	mla r3, r2, r1, r3
	mov r1, r5, lsr #6
	mov r4, r0
	ldr r5, [sp, #4]
	add r0, sp, #8
	add r2, sp, #4
	str r0, [r5, #0xb0]
	str r2, [sp]
	mov r2, r3, lsr #6
	orr r1, r1, r3, lsl #26
	ldr r3, _02079BB8 ; =sub_02079BBC
	bl sub_0207B17C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02079BA0
	mov r5, #0
_02079B8C:
	mov r0, r5
	bl sub_02079888
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02079B8C
_02079BA0:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02079BB0: .word THREAD_INFO_STRUCT
_02079BB4: .word 0x000082EA
_02079BB8: .word sub_02079BBC
	arm_func_end sub_02079B14

	arm_func_start sub_02079BBC
sub_02079BBC: ; 0x02079BBC
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _02079BD8 ; =sub_02079940
	mov r0, r2
	str r1, [r2, #0xb0]
	bx ip
	.align 2, 0
_02079BD8: .word sub_02079940
	arm_func_end sub_02079BBC

	arm_func_start sub_02079BDC
sub_02079BDC: ; 0x02079BDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _02079C00 ; =THREAD_INFO_STRUCT
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02079C00: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079BDC

	arm_func_start sub_02079C04
sub_02079C04: ; 0x02079C04
	stmdb sp!, {r3, lr}
	bl ClearIrqFlag
_02079C0C:
	bl WaitForInterrupt
	b _02079C0C
	arm_func_end sub_02079C04

	arm_func_start sub_02079C14
sub_02079C14: ; 0x02079C14
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r2, _02079C44 ; =THREAD_INFO_STRUCT
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	movlo r4, r3
	strlo r1, [r2, #4]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079C44: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079C14

	arm_func_start sub_02079C48
sub_02079C48: ; 0x02079C48
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _02079C78 ; =THREAD_INFO_STRUCT
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	movne r4, r3
	strne r2, [r1, #4]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079C78: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079C48

	arm_func_start SetThreadField0xB4
SetThreadField0xB4: ; 0x02079C7C
	str r1, [r0, #0xb4]
	bx lr
	arm_func_end SetThreadField0xB4

	arm_func_start InitThread
InitThread: ; 0x02079C84
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	bne _02079CA0
	b _02079CA4
_02079CA0:
	sub r2, r2, #4
_02079CA4:
	str r2, [r0, #0x38]
	ands r1, r1, #1
	bne _02079CB4
	b _02079CB8
_02079CB4:
	mov r1, #0x3f
_02079CB8:
	beq _02079CC0
	b _02079CC4
_02079CC0:
	mov r1, #0x1f
_02079CC4:
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end InitThread

	arm_func_start sub_02079D08
sub_02079D08: ; 0x02079D08
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D50 ; =sub_02080EF0
	blx r1
	ldmia sp!, {r0, lr}
	add r1, r0, #0
	mrs r2, cpsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 ; =_02079D50
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	.align 2, 0
_02079D50: .word sub_02080EF0
	arm_func_end sub_02079D08

	arm_func_start sub_02079D54
sub_02079D54: ; 0x02079D54
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D94 ; =sub_02080F30
	blx r1
	ldmia sp!, {r0, lr}
	mrs r1, cpsr
	bic r1, r1, #0x1f
	orr r1, r1, #0xd3
	msr cpsr_c, r1
	ldr r1, [r0], #4
	msr spsr_fsxc, r1
	ldr sp, [r0, #0x40]
	ldr lr, [r0, #0x3c]
	ldmia r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	subs pc, lr, #4
	.align 2, 0
_02079D94: .word sub_02080F30
	arm_func_end sub_02079D54

	arm_func_start sub_02079D98
sub_02079D98: ; 0x02079D98
	mov r0, #0
	bx lr
	arm_func_end sub_02079D98

	arm_func_start sub_02079DA0
sub_02079DA0: ; 0x02079DA0
	ldr r0, _02079DB0 ; =0x82000001
	ldr r1, _02079DB4 ; =_020B2BAC
	str r0, [r1]
	bx lr
	.align 2, 0
_02079DB0: .word 0x82000001
_02079DB4: .word _020B2BAC
	arm_func_end sub_02079DA0

	arm_func_start sub_02079DB8
sub_02079DB8: ; 0x02079DB8
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0]
	str r3, [r0, #0xc]
	str r3, [r0, #8]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	bx lr
	arm_func_end sub_02079DB8

	arm_func_start sub_02079DE0
sub_02079DE0: ; 0x02079DE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r2, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	mov r6, r0
	cmp r1, r2
	bgt _02079E3C
	and r7, r7, #1
_02079E0C:
	cmp r7, #0
	bne _02079E24
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079E24:
	mov r0, r5
	bl sub_02079888
	ldr r2, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	cmp r1, r2
	ble _02079E0C
_02079E3C:
	ldr r0, [r5, #0x18]
	add r0, r0, r2
	bl _s32_div_f
	ldr r2, [r5, #0x10]
	add r0, r5, #8
	str r4, [r2, r1, lsl #2]
	ldr r1, [r5, #0x1c]
	add r1, r1, #1
	str r1, [r5, #0x1c]
	bl sub_020798D8
	mov r0, r6
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079DE0

	arm_func_start sub_02079E74
sub_02079E74: ; 0x02079E74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _02079EC8
	and r7, r7, #1
_02079E9C:
	cmp r7, #0
	bne _02079EB4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079EB4:
	add r0, r6, #8
	bl sub_02079888
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02079E9C
_02079EC8:
	cmp r5, #0
	beq _02079EE0
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x18]
	ldr r0, [r1, r0, lsl #2]
	str r0, [r5]
_02079EE0:
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_020798D8
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079E74

	arm_func_start sub_02079F18
sub_02079F18: ; 0x02079F18
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x14]
	ldr r2, [r6, #0x1c]
	mov r4, r0
	cmp r1, r2
	bgt _02079F74
	and r7, r7, #1
_02079F44:
	cmp r7, #0
	bne _02079F5C
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079F5C:
	mov r0, r6
	bl sub_02079888
	ldr r1, [r6, #0x14]
	ldr r0, [r6, #0x1c]
	cmp r1, r0
	ble _02079F44
_02079F74:
	ldr r0, [r6, #0x18]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r1, [r6, #0x18]
	ldr r0, [r6, #0x10]
	str r5, [r0, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r0, r6, #8
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_020798D8
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079F18

	arm_func_start sub_02079FB4
sub_02079FB4: ; 0x02079FB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _0207A008
	and r7, r7, #1
_02079FDC:
	cmp r7, #0
	bne _02079FF4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079FF4:
	add r0, r6, #8
	bl sub_02079888
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02079FDC
_0207A008:
	cmp r5, #0
	beq _0207A020
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x18]
	ldr r0, [r1, r0, lsl #2]
	str r0, [r5]
_0207A020:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079FB4

	arm_func_start sub_0207A030
sub_0207A030: ; 0x0207A030
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0207A030

	arm_func_start sub_0207A048
sub_0207A048: ; 0x0207A048
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A0C8 ; =_022B966C
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_0207A064:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0207A090
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl sub_0207A1D8
	b _0207A0BC
_0207A090:
	cmp r0, r7
	bne _0207A0A8
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0207A0BC
_0207A0A8:
	mov r0, r5
	str r5, [r7, #0x84]
	bl sub_02079888
	str r6, [r7, #0x84]
	b _0207A064
_0207A0BC:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A0C8: .word _022B966C
	arm_func_end sub_0207A048

	arm_func_start sub_0207A0CC
sub_0207A0CC: ; 0x0207A0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A124 ; =_022B966C
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _0207A118
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _0207A118
	mov r1, r5
	bl sub_0207A1FC
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl sub_020798D8
_0207A118:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A124: .word _022B966C
	arm_func_end sub_0207A0CC

	arm_func_start sub_0207A128
sub_0207A128: ; 0x0207A128
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x88]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
_0207A140:
	add r0, r5, #0x88
	bl sub_02079268
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl sub_020798D8
	ldr r0, [r5, #0x88]
	cmp r0, #0
	bne _0207A140
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207A128

	arm_func_start sub_0207A164
sub_0207A164: ; 0x0207A164
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r2, [r5, #8]
	ldr r1, _0207A1D4 ; =_022B966C
	mov r4, r0
	cmp r2, #0
	ldr r0, [r1, #4]
	bne _0207A1A8
	str r0, [r5, #8]
	ldr r2, [r5, #0xc]
	mov r1, r5
	add r2, r2, #1
	str r2, [r5, #0xc]
	bl sub_0207A1D8
	mov r6, #1
	b _0207A1C4
_0207A1A8:
	cmp r2, r0
	movne r6, #0
	bne _0207A1C4
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
_0207A1C4:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207A1D4: .word _022B966C
	arm_func_end sub_0207A164

	arm_func_start sub_0207A1D8
sub_0207A1D8: ; 0x0207A1D8
	ldr r2, [r0, #0x8c]
	cmp r2, #0
	streq r1, [r0, #0x88]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x8c]
	bx lr
	arm_func_end sub_0207A1D8

	arm_func_start sub_0207A1FC
sub_0207A1FC: ; 0x0207A1FC
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x8c]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x88]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end sub_0207A1FC

	arm_func_start sub_0207A220
sub_0207A220: ; 0x0207A220
	mrc p15, 0, r1, c1, c0, 0
	and r0, r1, #4
	mov r0, r0, lsr #2
	orr r1, r1, #4
	mcr p15, 0, r1, c1, c0, 0
	bx lr
	arm_func_end sub_0207A220

	arm_func_start sub_0207A238
sub_0207A238: ; 0x0207A238
	mov r0, #0
	mcr p15, 0, r0, c7, c6, 0
	bx lr
	arm_func_end sub_0207A238

	arm_func_start sub_0207A244
sub_0207A244: ; 0x0207A244
	mov r1, #0
_0207A248:
	mov r0, #0
_0207A24C:
	orr r2, r1, r0
	mcr p15, 0, r2, c7, c10, 2
	add r0, r0, #0x20
	cmp r0, #0x400
	blt _0207A24C
	add r1, r1, #0x40000000
	cmp r1, #0
	bne _0207A248
	bx lr
	arm_func_end sub_0207A244

	arm_func_start sub_0207A270
sub_0207A270: ; 0x0207A270
	mov ip, #0
	mov r1, #0
_0207A278:
	mov r0, #0
_0207A27C:
	orr r2, r1, r0
	mcr p15, 0, ip, c7, c10, 4
	mcr p15, 0, r2, c7, c14, 2
	add r0, r0, #0x20
	cmp r0, #0x400
	blt _0207A27C
	add r1, r1, #0x40000000
	cmp r1, #0
	bne _0207A278
	bx lr
	arm_func_end sub_0207A270

	arm_func_start sub_0207A2A4
sub_0207A2A4: ; 0x0207A2A4
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2AC:
	mcr p15, 0, r0, c7, c6, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2AC
	bx lr
	arm_func_end sub_0207A2A4

	arm_func_start sub_0207A2C0
sub_0207A2C0: ; 0x0207A2C0
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2C8:
	mcr p15, 0, r0, c7, c10, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2C8
	bx lr
	arm_func_end sub_0207A2C0

	arm_func_start sub_0207A2DC
sub_0207A2DC: ; 0x0207A2DC
	mov ip, #0
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2E8:
	mcr p15, 0, ip, c7, c10, 4
	mcr p15, 0, r0, c7, c14, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2E8
	bx lr
	arm_func_end sub_0207A2DC

	arm_func_start sub_0207A300
sub_0207A300: ; 0x0207A300
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4
	bx lr
	arm_func_end sub_0207A300

	arm_func_start sub_0207A30C
sub_0207A30C: ; 0x0207A30C
	mrc p15, 0, r1, c1, c0, 0
	and r0, r1, #0x1000
	mov r0, r0, lsr #0xc
	orr r1, r1, #0x1000
	mcr p15, 0, r1, c1, c0, 0
	bx lr
	arm_func_end sub_0207A30C

	arm_func_start sub_0207A324
sub_0207A324: ; 0x0207A324
	mov r0, #0
	mcr p15, 0, r0, c7, c5, 0
	bx lr
	arm_func_end sub_0207A324

	arm_func_start sub_0207A330
sub_0207A330: ; 0x0207A330
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A338:
	mcr p15, 0, r0, c7, c5, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A338
	bx lr
	arm_func_end sub_0207A330

	arm_func_start sub_0207A34C
sub_0207A34C: ; 0x0207A34C
	mov ip, #0x4000000
	ldr r1, [ip, #0x208]
	str ip, [ip, #0x208]
_0207A358:
	ldrh r0, [ip, #6]
	cmp r0, #0
	bne _0207A358
	str r1, [ip, #0x208]
	bx lr
	arm_func_end sub_0207A34C

	arm_func_start sub_0207A36C
sub_0207A36C: ; 0x0207A36C
	stmdb sp!, {r3, lr}
	bl sub_0207A3B4
	bl sub_0207D9A4
	bl sub_02078D28
	bl sub_0207A4B8
	bl sub_02078A80
	bl sub_02078CF4
	bl sub_0207AB24
	bl sub_0207C7C4
	bl sub_0207B370
	bl sub_0207BA94
	bl sub_02079408
	bl sub_0207B87C
	bl sub_02084A4C
	bl sub_02084304
	bl sub_02081AC4
	bl sub_0207A34C
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207A36C

	arm_func_start sub_0207A3B4
sub_0207A3B4: ; 0x0207A3B4
	stmdb sp!, {r3, lr}
	ldr r1, _0207A4B4 ; =_022B98C4
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	str r2, [r1]
	bl sub_0207A54C
	mov r1, r0
	mov r0, #0
	bl sub_0207A6D8
	mov r0, #0
	bl sub_0207A630
	mov r1, r0
	mov r0, #0
	bl sub_0207A6EC
	mov r0, #2
	mov r1, #0
	bl sub_0207A6EC
	mov r0, #2
	mov r1, #0
	bl sub_0207A6D8
	mov r0, #3
	bl sub_0207A54C
	mov r1, r0
	mov r0, #3
	bl sub_0207A6D8
	mov r0, #3
	bl sub_0207A630
	mov r1, r0
	mov r0, #3
	bl sub_0207A6EC
	mov r0, #4
	bl sub_0207A54C
	mov r1, r0
	mov r0, #4
	bl sub_0207A6D8
	mov r0, #4
	bl sub_0207A630
	mov r1, r0
	mov r0, #4
	bl sub_0207A6EC
	mov r0, #5
	bl sub_0207A54C
	mov r1, r0
	mov r0, #5
	bl sub_0207A6D8
	mov r0, #5
	bl sub_0207A630
	mov r1, r0
	mov r0, #5
	bl sub_0207A6EC
	mov r0, #6
	bl sub_0207A54C
	mov r1, r0
	mov r0, #6
	bl sub_0207A6D8
	mov r0, #6
	bl sub_0207A630
	mov r1, r0
	mov r0, #6
	bl sub_0207A6EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A4B4: .word _022B98C4
	arm_func_end sub_0207A3B4

	arm_func_start sub_0207A4B8
sub_0207A4B8: ; 0x0207A4B8
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl sub_0207A54C
	mov r1, r0
	mov r0, #2
	bl sub_0207A6D8
	mov r0, #2
	bl sub_0207A630
	mov r1, r0
	mov r0, #2
	bl sub_0207A6EC
	ldr r0, _0207A518 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A504
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	ldmneia sp!, {r3, pc}
_0207A504:
	ldr r0, _0207A51C ; =_0200002B
	bl sub_0207AB14
	ldr r0, _0207A520 ; =0x023E0021
	bl sub_0207AB1C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A518: .word _022B98C4
_0207A51C: .word _0200002B
_0207A520: .word 0x023E0021
	arm_func_end sub_0207A4B8

	arm_func_start sub_0207A524
sub_0207A524: ; 0x0207A524
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end sub_0207A524

	arm_func_start sub_0207A538
sub_0207A538: ; 0x0207A538
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end sub_0207A538

	arm_func_start sub_0207A54C
sub_0207A54C: ; 0x0207A54C
	stmdb sp!, {r3, lr}
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0207A608
_0207A55C: ; jump table
	b _0207A578 ; case 0
	b _0207A608 ; case 1
	b _0207A580 ; case 2
	b _0207A5B0 ; case 3
	b _0207A5B8 ; case 4
	b _0207A5F8 ; case 5
	b _0207A600 ; case 6
_0207A578:
	ldr r0, _0207A610 ; =SDK_SECTION_ARENA_EX_START
	ldmia sp!, {r3, pc}
_0207A580:
	ldr r0, _0207A614 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A5A0
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	bne _0207A5A8
_0207A5A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207A5A8:
	mov r0, #0x2700000
	ldmia sp!, {r3, pc}
_0207A5B0:
	mov r0, #0x2000000
	ldmia sp!, {r3, pc}
_0207A5B8:
	ldr r0, _0207A618 ; =OS_IRQTable
	ldr r1, _0207A61C ; =0x00000000
	ldr r2, _0207A620 ; =0x00000800
	add r3, r0, #0x3f80
	cmp r1, #0
	sub r2, r3, r2
	bne _0207A5E4
	ldr r1, _0207A624 ; =SDK_SECTION_ARENA_DTCM_START
	cmp r0, r1
	movlo r0, r1
	ldmia sp!, {r3, pc}
_0207A5E4:
	cmp r1, #0
	ldrlt r0, _0207A624 ; =SDK_SECTION_ARENA_DTCM_START
	sublt r0, r0, r1
	subge r0, r2, r1
	ldmia sp!, {r3, pc}
_0207A5F8:
	ldr r0, _0207A628 ; =0x027FF680
	ldmia sp!, {r3, pc}
_0207A600:
	ldr r0, _0207A62C ; =0x037F8000
	ldmia sp!, {r3, pc}
_0207A608:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A610: .word SDK_SECTION_ARENA_EX_START
_0207A614: .word _022B98C4
_0207A618: .word OS_IRQTable
_0207A61C: .word 0x00000000
_0207A620: .word 0x00000800
_0207A624: .word SDK_SECTION_ARENA_DTCM_START
_0207A628: .word 0x027FF680
_0207A62C: .word 0x037F8000
	arm_func_end sub_0207A54C

	arm_func_start sub_0207A630
sub_0207A630: ; 0x0207A630
	stmdb sp!, {r3, lr}
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0207A6B4
_0207A640: ; jump table
	b _0207A65C ; case 0
	b _0207A6B4 ; case 1
	b _0207A664 ; case 2
	b _0207A694 ; case 3
	b _0207A69C ; case 4
	b _0207A6A4 ; case 5
	b _0207A6AC ; case 6
_0207A65C:
	ldr r0, _0207A6BC ; =SDK_MAIN_ARENA_LO
	ldmia sp!, {r3, pc}
_0207A664:
	ldr r0, _0207A6C0 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A684
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	bne _0207A68C
_0207A684:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207A68C:
	ldr r0, _0207A6C4 ; =SDK_SECTION_ARENA_EX_START
	ldmia sp!, {r3, pc}
_0207A694:
	ldr r0, _0207A6C8 ; =SDK_SECTION_ARENA_ITCM_START
	ldmia sp!, {r3, pc}
_0207A69C:
	ldr r0, _0207A6CC ; =SDK_SECTION_ARENA_DTCM_START
	ldmia sp!, {r3, pc}
_0207A6A4:
	ldr r0, _0207A6D0 ; =0x027FF000
	ldmia sp!, {r3, pc}
_0207A6AC:
	ldr r0, _0207A6D4 ; =0x037F8000
	ldmia sp!, {r3, pc}
_0207A6B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A6BC: .word SDK_MAIN_ARENA_LO
_0207A6C0: .word _022B98C4
_0207A6C4: .word SDK_SECTION_ARENA_EX_START
_0207A6C8: .word SDK_SECTION_ARENA_ITCM_START
_0207A6CC: .word SDK_SECTION_ARENA_DTCM_START
_0207A6D0: .word 0x027FF000
_0207A6D4: .word 0x037F8000
	arm_func_end sub_0207A630

	arm_func_start sub_0207A6D8
sub_0207A6D8: ; 0x0207A6D8
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xdc4]
	bx lr
	arm_func_end sub_0207A6D8

	arm_func_start sub_0207A6EC
sub_0207A6EC: ; 0x0207A6EC
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end sub_0207A6EC

	arm_func_start sub_0207A700
sub_0207A700: ; 0x0207A700
	str r0, [r1, #4]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	strne r1, [r0]
	mov r0, r1
	bx lr
	arm_func_end sub_0207A700

	arm_func_start sub_0207A71C
sub_0207A71C: ; 0x0207A71C
	ldr r3, [r1, #4]
	cmp r3, #0
	ldrne r2, [r1]
	strne r2, [r3]
	ldr r2, [r1]
	cmp r2, #0
	ldreq r0, [r1, #4]
	ldrne r1, [r1, #4]
	strne r1, [r2, #4]
	bx lr
	arm_func_end sub_0207A71C

	arm_func_start sub_0207A744
sub_0207A744: ; 0x0207A744
	stmdb sp!, {r3, lr}
	mov lr, r0
	cmp r0, #0
	mov ip, #0
	beq _0207A770
_0207A758:
	cmp r1, lr
	bls _0207A770
	mov ip, lr
	ldr lr, [lr, #4]
	cmp lr, #0
	bne _0207A758
_0207A770:
	stmia r1, {ip, lr}
	cmp lr, #0
	beq _0207A7AC
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _0207A7AC
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_0207A7AC:
	cmp ip, #0
	beq _0207A7E4
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	ldmneia sp!, {r3, pc}
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	ldmia sp!, {r3, pc}
_0207A7E4:
	mov r0, r1
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207A744

	arm_func_start sub_0207A7EC
sub_0207A7EC: ; 0x0207A7EC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, _0207A8F0 ; =_022B98CC
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _0207A820
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207A820:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	cmp r0, #0
	bic r7, r1, #0x1f
	beq _0207A864
_0207A84C:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _0207A864
	ldr r5, [r5, #4]
	cmp r5, #0
	bne _0207A84C
_0207A864:
	cmp r5, #0
	bne _0207A87C
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207A87C:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _0207A89C
	mov r1, r5
	bl sub_0207A71C
	str r0, [r4, #4]
	b _0207A8D0
_0207A89C:
	str r7, [r5, #8]
	add r2, r5, r7
	str r1, [r2, #8]
	ldr r0, [r5]
	str r0, [r5, r7]
	ldr r0, [r5, #4]
	str r0, [r2, #4]
	cmp r0, #0
	strne r2, [r0]
	ldr r0, [r2]
	cmp r0, #0
	strne r2, [r0, #4]
	streq r2, [r4, #4]
_0207A8D0:
	ldr r0, [r4, #8]
	mov r1, r5
	bl sub_0207A700
	str r0, [r4, #8]
	mov r0, r6
	bl SetIrqFlag
	add r0, r5, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A8F0: .word _022B98CC
	arm_func_end sub_0207A7EC

	arm_func_start sub_0207A8F4
sub_0207A8F4: ; 0x0207A8F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r1, _0207A958 ; =_022B98CC
	mov r4, r0
	ldr r0, [r1, r7, lsl #2]
	cmp r6, #0
	ldrlt r6, [r0]
	ldr r1, [r0, #0x10]
	mov r0, #0xc
	mla r7, r6, r0, r1
	sub r5, r5, #0x20
	ldr r0, [r7, #8]
	mov r1, r5
	bl sub_0207A71C
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl sub_0207A744
	str r0, [r7, #4]
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A958: .word _022B98CC
	arm_func_end sub_0207A8F4

	arm_func_start sub_0207A95C
sub_0207A95C: ; 0x0207A95C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _0207A988 ; =_022B98CC
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A988: .word _022B98CC
	arm_func_end sub_0207A95C

	arm_func_start sub_0207A98C
sub_0207A98C: ; 0x0207A98C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl EnableIrqFlag
	ldr r2, _0207AA30 ; =_022B98CC
	mov r1, #0xc
	str r5, [r2, r7, lsl #2]
	add r2, r5, #0x14
	str r2, [r5, #0x10]
	mul r1, r6, r1
	str r6, [r5, #4]
	cmp r6, #0
	mov lr, #0
	ble _0207AA00
	mov r6, lr
	mvn ip, #0
	mov r3, lr
_0207A9D8:
	ldr r2, [r5, #0x10]
	add lr, lr, #1
	str ip, [r2, r6]
	add r2, r2, r6
	str r3, [r2, #8]
	str r3, [r2, #4]
	ldr r2, [r5, #4]
	add r6, r6, #0xc
	cmp lr, r2
	blt _0207A9D8
_0207AA00:
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl SetIrqFlag
	ldr r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207AA30: .word _022B98CC
	arm_func_end sub_0207A98C

	arm_func_start sub_0207AA34
sub_0207AA34: ; 0x0207AA34
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r2, _0207AAC8 ; =_022B98CC
	add r1, r6, #0x1f
	ldr r2, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr ip, [r2, #4]
	bic r5, r5, #0x1f
	cmp ip, #0
	mov r4, #0
	ble _0207AABC
	ldr r3, [r2, #0x10]
_0207AA70:
	ldr r1, [r3]
	cmp r1, #0
	bge _0207AAAC
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_0207AAAC:
	add r4, r4, #1
	cmp r4, ip
	add r3, r3, #0xc
	blt _0207AA70
_0207AABC:
	bl SetIrqFlag
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AAC8: .word _022B98CC
	arm_func_end sub_0207AA34

	arm_func_start sub_0207AACC
sub_0207AACC: ; 0x0207AACC
	mrc p15, 0, r0, c9, c1, 0
	ldr r1, _0207AADC ; =0xFFFFF000
	and r0, r0, r1
	bx lr
	.align 2, 0
_0207AADC: .word 0xFFFFF000
	arm_func_end sub_0207AACC

	arm_func_start sub_0207AAE0
sub_0207AAE0: ; 0x0207AAE0
	mrc p15, 0, r0, c1, c0, 0
	orr r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	arm_func_end sub_0207AAE0

	arm_func_start sub_0207AAF0
sub_0207AAF0: ; 0x0207AAF0
	mrc p15, 0, r0, c1, c0, 0
	bic r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	arm_func_end sub_0207AAF0

	arm_func_start sub_0207AB00
sub_0207AB00: ; 0x0207AB00
	mrc p15, 0, r2, c5, c0, 2
	bic r2, r2, r0
	orr r2, r2, r1
	mcr p15, 0, r2, c5, c0, 2
	bx lr
	arm_func_end sub_0207AB00

	arm_func_start sub_0207AB14
sub_0207AB14: ; 0x0207AB14
	mcr p15, 0, r0, c6, c1, 0
	bx lr
	arm_func_end sub_0207AB14

	arm_func_start sub_0207AB1C
sub_0207AB1C: ; 0x0207AB1C
	mcr p15, 0, r0, c6, c2, 0
	bx lr
	arm_func_end sub_0207AB1C

	arm_func_start sub_0207AB24
sub_0207AB24: ; 0x0207AB24
	ldr r0, _0207AB84 ; =0x027FFD9C
	ldr r1, [r0]
	cmp r1, #0x2600000
	blo _0207AB44
	cmp r1, #0x2800000
	ldrlo r0, _0207AB88 ; =_022B98F0
	strlo r1, [r0]
	blo _0207AB50
_0207AB44:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0]
_0207AB50:
	ldr r0, _0207AB88 ; =_022B98F0
	ldr r0, [r0]
	cmp r0, #0
	bne _0207AB74
	ldr r2, _0207AB8C ; =sub_0207AB94
	ldr r1, _0207AB84 ; =0x027FFD9C
	ldr r0, _0207AB90 ; =0x027E3000
	str r2, [r1]
	str r2, [r0, #0xfdc]
_0207AB74:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0207AB84: .word 0x027FFD9C
_0207AB88: .word _022B98F0
_0207AB8C: .word sub_0207AB94
_0207AB90: .word 0x027E3000
	arm_func_end sub_0207AB24

	arm_func_start sub_0207AB94
sub_0207AB94: ; 0x0207AB94
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
	bne _0207ABA8
	b _0207ABAC
_0207ABA8:
	mov lr, pc
_0207ABAC:
	bne _0207ABB4
	b _0207ABB8
_0207ABB4:
	bx ip
_0207ABB8:
	ldr ip, _0207AC14 ; =_02000000
	stmdb ip!, {r0, r1, r2, r3, sp, lr}
	and r0, sp, #1
	mov sp, ip
	mrs r1, cpsr
	and r1, r1, #0x1f
	teq r1, #0x17
	bne _0207ABE0
	bl sub_0207AC18
	b _0207ABEC
_0207ABE0:
	teq r1, #0x1b
	bne _0207ABEC
	bl sub_0207AC18
_0207ABEC:
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
_0207ABF8:
	beq _0207ABF8
_0207ABFC:
	mov r0, r0
	b _0207ABFC
_0207AC04:
	ldmia sp!, {r0, r1, r2, r3, ip, lr}
	mov sp, ip
	bx lr
	.align 2, 0
_0207AC10: .word _022B98F0
_0207AC14: .word _secure
	arm_func_end sub_0207AB94

	arm_func_start sub_0207AC18
sub_0207AC18: ; 0x0207AC18
	stmdb sp!, {r0, lr}
	bl sub_0207AC2C
	bl sub_0207ACBC
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_0207AC18

	arm_func_start sub_0207AC2C
sub_0207AC2C: ; 0x0207AC2C
	ldr r1, _0207ACB8 ; =_022B991C
	mrs r2, cpsr
	str r2, [r1, #0x74]
	str r0, [r1, #0x6c]
	ldr r0, [ip]
	str r0, [r1, #4]
	ldr r0, [ip, #4]
	str r0, [r1, #8]
	ldr r0, [ip, #8]
	str r0, [r1, #0xc]
	ldr r0, [ip, #0xc]
	str r0, [r1, #0x10]
	ldr r2, [ip, #0x10]
	bic r2, r2, #1
	add r0, r1, #0x14
	stmia r0, {r4, r5, r6, r7, r8, sb, sl, fp}
	str ip, [r1, #0x70]
	ldr r0, [r2]
	str r0, [r1, #0x64]
	ldr r3, [r2, #4]
	str r3, [r1]
	ldr r0, [r2, #8]
	str r0, [r1, #0x34]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x40]
	mrs r0, cpsr
	orr r3, r3, #0x80
	bic r3, r3, #0x20
	msr cpsr_fsxc, r3
	str sp, [r1, #0x38]
	str lr, [r1, #0x3c]
	mrs r2, spsr
	str r2, [r1, #0x7c]
	msr cpsr_fsxc, r0
	bx lr
	.align 2, 0
_0207ACB8: .word _022B991C
	arm_func_end sub_0207AC2C

	arm_func_start sub_0207ACBC
sub_0207ACBC: ; 0x0207ACBC
	stmdb sp!, {r3, lr}
	ldr r0, _0207AD20 ; =_022B98F0
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mrs r2, cpsr
	mov r0, sp
	ldr r1, _0207AD24 ; =0x0000009F
	msr cpsr_fsxc, r1
	mov r1, sp
	mov sp, r0
	stmdb sp!, {r1, r2}
	bl sub_0207AAE0
	ldr r0, _0207AD28 ; =_022B991C
	ldr r1, _0207AD2C ; =_022B98F4
	ldr r1, [r1]
	ldr ip, _0207AD30 ; =_022B98F8
	ldr ip, [ip]
	ldr lr, _0207AD34 ; =_0207AD0C
	bx ip
_0207AD0C:
	bl sub_0207AAF0
	ldmia sp!, {r1, r2}
	mov sp, r1
	msr cpsr_fsxc, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207AD20: .word _022B98F0
_0207AD24: .word 0x0000009F
_0207AD28: .word _022B991C
_0207AD2C: .word _022B98F4
_0207AD30: .word _022B98F8
_0207AD34: .word _0207AD0C
	arm_func_end sub_0207ACBC

	arm_func_start sub_0207AD38
sub_0207AD38: ; 0x0207AD38
	ldr r1, _0207AD50 ; =_022B999C
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0207AD50: .word _022B999C
	arm_func_end sub_0207AD38

	arm_func_start sub_0207AD54
sub_0207AD54: ; 0x0207AD54
	stmdb sp!, {r3, lr}
	ldr r1, _0207ADC0 ; =_022B99A0
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl sub_0207AD38
	ldr r0, _0207ADC0 ; =_022B99A0
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _0207ADC4 ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _0207ADC8 ; =sub_0207ADDC
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl sub_02078A98
	mov r0, #8
	bl sub_02078C68
	ldr r0, _0207ADC0 ; =_022B99A0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207ADC0: .word _022B99A0
_0207ADC4: .word 0x04000102
_0207ADC8: .word sub_0207ADDC
	arm_func_end sub_0207AD54

	arm_func_start sub_0207ADCC
sub_0207ADCC: ; 0x0207ADCC
	ldr r0, _0207ADD8 ; =_022B99A0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207ADD8: .word _022B99A0
	arm_func_end sub_0207ADCC

	arm_func_start sub_0207ADDC
sub_0207ADDC: ; 0x0207ADDC
	ldr r0, _0207AE34 ; =_022B99A0
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0207AE20
	ldr r2, _0207AE38 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_0207AE20:
	ldr ip, _0207AE3C ; =sub_02078BF4
	mov r0, #0
	ldr r1, _0207AE40 ; =sub_0207ADDC
	mov r2, r0
	bx ip
	.align 2, 0
_0207AE34: .word _022B99A0
_0207AE38: .word 0x04000102
_0207AE3C: .word sub_02078BF4
_0207AE40: .word sub_0207ADDC
	arm_func_end sub_0207ADDC

	arm_func_start sub_0207AE44
sub_0207AE44: ; 0x0207AE44
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl EnableIrqFlag
	ldr lr, _0207AED8 ; =0x04000100
	ldr r2, _0207AEDC ; =0x0000FFFF
	ldrh ip, [lr]
	ldr r3, _0207AEE0 ; =_022B99A0
	sub r1, r2, #0x10000
	strh ip, [sp]
	ldr ip, [r3, #8]
	ldr r3, [r3, #0xc]
	and ip, ip, r1
	and r1, r3, r2
	str ip, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [lr, #0x114]
	tst r1, #8
	beq _0207AEB0
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _0207AEB0
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_0207AEB0:
	bl SetIrqFlag
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	mov r1, r1, lsl #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0207AED8: .word 0x04000100
_0207AEDC: .word 0x0000FFFF
_0207AEE0: .word _022B99A0
	arm_func_end sub_0207AE44

	arm_func_start GetTimer0Control
GetTimer0Control: ; 0x0207AEE4
	ldr r0, _0207AEF0 ; =0x04000100
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207AEF0: .word 0x04000100
	arm_func_end GetTimer0Control

	arm_func_start sub_0207AEF4
sub_0207AEF4: ; 0x0207AEF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	mov r3, r5, lsr #0x10
	mov ip, #1
	rsb r1, ip, #0x10000
	ldr lr, _0207AF58 ; =0x04000214
	mov r6, #8
	ldr r2, _0207AF5C ; =_022B99A0
	str r6, [lr]
	str ip, [r2, #4]
	orr r3, r3, r4, lsl #16
	str r3, [r2, #8]
	mov r4, r4, lsr #0x10
	ldr r3, _0207AF60 ; =0x04000102
	str r4, [r2, #0xc]
	mov r2, #0
	strh r2, [r3]
	and r1, r5, r1
	strh r1, [r3, #-2]
	mov r1, #0xc1
	strh r1, [r3]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AF58: .word 0x04000214
_0207AF5C: .word _022B99A0
_0207AF60: .word 0x04000102
	arm_func_end sub_0207AEF4

	arm_func_start sub_0207AF64
sub_0207AF64: ; 0x0207AF64
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_0207AE44
	ldr r3, _0207AFE0 ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _0207AFE4 ; =sub_0207B270
	mov r0, #1
	bl sub_02078BF4
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _0207AFE8 ; =0x0000FFFE
	blt _0207AFC4
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	bge _0207AFC4
	mvn r0, r5
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
_0207AFC4:
	ldr r2, _0207AFEC ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl sub_02078C68
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207AFE0: .word 0x04000106
_0207AFE4: .word sub_0207B270
_0207AFE8: .word 0x0000FFFE
_0207AFEC: .word 0x04000104
	arm_func_end sub_0207AF64

	arm_func_start sub_0207AFF0
sub_0207AFF0: ; 0x0207AFF0
	stmdb sp!, {r3, lr}
	ldr r1, _0207B02C ; =_022B99B0
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	bl sub_0207AD38
	ldr r1, _0207B02C ; =_022B99B0
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl sub_02078C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B02C: .word _022B99B0
	arm_func_end sub_0207AFF0

	arm_func_start sub_0207B030
sub_0207B030: ; 0x0207B030
	ldr r0, _0207B03C ; =_022B99B0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207B03C: .word _022B99B0
	arm_func_end sub_0207B030

	arm_func_start sub_0207B040
sub_0207B040: ; 0x0207B040
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0207B040

	arm_func_start sub_0207B050
sub_0207B050: ; 0x0207B050
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _0207B0C4
	bl sub_0207AE44
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _0207B0C4
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl _ll_udiv
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_0207B0C4:
	str r7, [r8, #0xc]
	ldr r0, _0207B178 ; =_022B99B0
	str r6, [r8, #0x10]
	ldr r5, [r0, #4]
	cmp r5, #0
	beq _0207B140
	mov r2, #0
	mov r1, r2
_0207B0E4:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _0207B134
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r1, _0207B178 ; =_022B99B0
	mov r0, r8
	str r8, [r1, #4]
	bl sub_0207AF64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207B134:
	ldr r5, [r5, #0x18]
	cmp r5, #0
	bne _0207B0E4
_0207B140:
	ldr r1, _0207B178 ; =_022B99B0
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl sub_0207AF64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207B178: .word _022B99B0
	arm_func_end sub_0207B050

	arm_func_start sub_0207B17C
sub_0207B17C: ; 0x0207B17C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _0207B1A0
	ldr r0, [r6]
	cmp r0, #0
	beq _0207B1A4
_0207B1A0:
	bl WaitForever2
_0207B1A4:
	bl EnableIrqFlag
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl sub_0207AE44
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl sub_0207B050
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207B17C

	arm_func_start sub_0207B1E8
sub_0207B1E8: ; 0x0207B1E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B20C
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B20C:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	bne _0207B22C
	ldr r2, [r5, #0x14]
	ldr r1, _0207B26C ; =_022B99B0
	str r2, [r1, #8]
_0207B22C:
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _0207B250
	ldr r1, _0207B26C ; =_022B99B0
	cmp r0, #0
	str r0, [r1, #4]
	beq _0207B250
	bl sub_0207AF64
_0207B250:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B26C: .word _022B99B0
	arm_func_end sub_0207B1E8

	arm_func_start sub_0207B270
sub_0207B270: ; 0x0207B270
	stmdb sp!, {r0, lr}
	bl sub_0207B280
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_0207B270

	arm_func_start sub_0207B280
sub_0207B280: ; 0x0207B280
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0207B364 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl sub_02078C98
	ldr r0, _0207B368 ; =OS_IRQTable
	add r0, r0, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #0x10
	str r1, [r0, #0xff8]
	bl sub_0207AE44
	ldr r2, _0207B36C ; =_022B99B0
	ldr r4, [r2, #4]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _0207B2E0
	mov r0, r4
	bl sub_0207AF64
	ldmia sp!, {r3, r4, r5, pc}
_0207B2E0:
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r1, [r2, #4]
	cmp r1, #0
	streq r0, [r2, #8]
	strne r0, [r1, #0x14]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	ldr r5, [r4]
	mov r0, #0
	cmpeq r1, #0
	streq r0, [r4]
	cmp r5, #0
	beq _0207B324
	ldr r0, [r4, #4]
	blx r5
_0207B324:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _0207B34C
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl sub_0207B050
_0207B34C:
	ldr r0, _0207B36C ; =_022B99B0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_0207AF64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B364: .word 0x04000106
_0207B368: .word OS_IRQTable
_0207B36C: .word _022B99B0
	arm_func_end sub_0207B280

	arm_func_start sub_0207B370
sub_0207B370: ; 0x0207B370
	stmdb sp!, {r3, lr}
	ldr r1, _0207B3B4 ; =_022B99BC
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl sub_02078C98
	ldr r0, _0207B3B4 ; =_022B99BC
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B3B4: .word _022B99BC
	arm_func_end sub_0207B370

	arm_func_start sub_0207B3B8
sub_0207B3B8: ; 0x0207B3B8
	stmdb sp!, {r3, lr}
	ldr r1, _0207B430 ; =_022B99BC
	ldr r3, [r1, #0xc]
	cmp r3, #0
	beq _0207B428
	ldr ip, [r0, #0xc]
_0207B3D0:
	ldr r1, [r3, #0xc]
	cmp r1, ip
	blo _0207B41C
	bne _0207B3F0
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _0207B41C
_0207B3F0:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	ldmneia sp!, {r3, pc}
	ldr r1, _0207B430 ; =_022B99BC
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
_0207B41C:
	ldr r3, [r3, #0x18]
	cmp r3, #0
	bne _0207B3D0
_0207B428:
	bl sub_0207B434
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B430: .word _022B99BC
	arm_func_end sub_0207B3B8

	arm_func_start sub_0207B434
sub_0207B434: ; 0x0207B434
	stmdb sp!, {r3, lr}
	ldr r1, _0207B468 ; =_022B99BC
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	ldmneia sp!, {r3, pc}
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B468: .word _022B99BC
	arm_func_end sub_0207B434

	arm_func_start sub_0207B46C
sub_0207B46C: ; 0x0207B46C
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0207B4A0: .word _022B99BC
	arm_func_end sub_0207B46C

	arm_func_start sub_0207B4A4
sub_0207B4A4: ; 0x0207B4A4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_0207B4A4

	arm_func_start sub_0207B4B8
sub_0207B4B8: ; 0x0207B4B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r8, #0
	beq _0207B4E8
	ldr r0, [r8]
	cmp r0, #0
	beq _0207B4EC
_0207B4E8:
	bl WaitForever2
_0207B4EC:
	ldr r0, _0207B540 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_0207B790
	mov r1, #1
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r1, [sp, #0x20]
	str r5, [r8]
	str r1, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl sub_0207B3B8
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0207B540: .word 0x04000006
	arm_func_end sub_0207B4B8

	arm_func_start sub_0207B544
sub_0207B544: ; 0x0207B544
	stmdb sp!, {r4, lr}
	ldr r1, _0207B57C ; =sub_0207B5CC
	mov r4, r0
	mov r0, #4
	bl sub_02078A98
	ldrsh r0, [r4, #0x10]
	bl GX_HBlankIntr
	ldr r2, _0207B580 ; =0x04000004
	mov r0, #4
	ldrh r1, [r2]
	orr r1, r1, #0x20
	strh r1, [r2]
	bl sub_02078C68
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B57C: .word sub_0207B5CC
_0207B580: .word 0x04000004
	arm_func_end sub_0207B544

	arm_func_start sub_0207B584
sub_0207B584: ; 0x0207B584
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B5B0
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B5B0:
	mov r0, r5
	bl sub_0207B46C
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207B584

	arm_func_start sub_0207B5CC
sub_0207B5CC: ; 0x0207B5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl sub_02078C98
	ldr r2, _0207B734 ; =0x04000004
	ldr r0, _0207B738 ; =OS_IRQTable
	ldrh r1, [r2]
	add r0, r0, #0x3000
	bic r1, r1, #0x20
	strh r1, [r2]
	ldr r1, [r0, #0xff8]
	orr r1, r1, #4
	str r1, [r0, #0xff8]
	ldrh r0, [r2]
	mov r1, r0, asr #8
	mov r0, r0, lsl #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl sub_0207B790
	ldr r4, _0207B73C ; =_022B99BC
	ldr sl, [r4, #0xc]
	cmp sl, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, _0207B740 ; =0x04000006
	mov fp, #4
	sub r6, sb, #2
	mov r5, #0
_0207B63C:
	ldrh r8, [sb]
	mov r0, r8
	bl sub_0207B790
	mov r7, r0
	mov r0, sl
	mov r1, r7
	mov r2, r8
	bl sub_0207B744
	cmp r0, #0
	beq _0207B678
	cmp r0, #1
	beq _0207B6B4
	cmp r0, #2
	beq _0207B708
	b _0207B724
_0207B678:
	mov r0, sl
	bl sub_0207B544
	ldrh r1, [sb]
	ldrsh r0, [sl, #0x10]
	cmp r0, r1
	ldreq r0, [sl, #0xc]
	cmpeq r0, r7
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, fp
	bl sub_02078C98
	ldrh r1, [r6]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r6]
	bl sub_02078CC8
_0207B6B4:
	ldr r7, [sl]
	mov r0, sl
	bl sub_0207B46C
	str r5, [sl]
	cmp r7, #0
	beq _0207B6D4
	ldr r0, [sl, #4]
	blx r7
_0207B6D4:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _0207B724
	ldr r0, [sl, #0x24]
	cmp r0, #0
	bne _0207B724
	str r7, [sl]
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
	b _0207B724
_0207B708:
	mov r0, sl
	bl sub_0207B46C
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
_0207B724:
	ldr sl, [r4, #0xc]
	cmp sl, #0
	bne _0207B63C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207B734: .word 0x04000004
_0207B738: .word OS_IRQTable
_0207B73C: .word _022B99BC
_0207B740: .word 0x04000006
	arm_func_end sub_0207B5CC

	arm_func_start sub_0207B744
sub_0207B744: ; 0x0207B744
	ldrsh r3, [r0, #0x10]
	ldr ip, [r0, #0xc]
	subs r1, r1, ip
	sub r2, r2, r3
	bmi _0207B768
	cmp r1, #0
	bne _0207B770
	cmp r2, #0
	bge _0207B770
_0207B768:
	mov r0, #0
	bx lr
_0207B770:
	ldrsh r0, [r0, #0x12]
	cmp r2, #0
	addlt r1, r2, #7
	addlt r2, r1, #0x100
	cmp r2, r0
	movle r0, #1
	movgt r0, #2
	bx lr
	arm_func_end sub_0207B744

	arm_func_start sub_0207B790
sub_0207B790: ; 0x0207B790
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207B7CC ; =_022B99BC
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _0207B7CC ; =_022B99BC
	str r4, [r1, #4]
	bl SetIrqFlag
	ldr r0, _0207B7CC ; =_022B99BC
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B7CC: .word _022B99BC
	arm_func_end sub_0207B790
