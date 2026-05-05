	.include "asm/macros.inc"
	.include "include/fx_vec.inc"

	.text

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
