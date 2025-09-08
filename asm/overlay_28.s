	.include "asm/macros.inc"
	.include "overlay_28.inc"

	.text

	arm_func_start ov28_0238A140
ov28_0238A140: ; 0x0238A140
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #0x10]
	str r1, [r0, #0xc]
	str r2, [r0, #4]
	sub r2, r2, #1
	ldr r1, _0238A17C ; =ov28_0238ADA0
	str r2, [r0, #8]
	ldr r2, [r1]
	mov r1, #0xc
	mul r3, r2, r1
	ldr r1, _0238A180 ; =ov28_0238AD28
	ldr r1, [r1, r3]
	strh r1, [r0, #0x18]
	bx lr
	.align 2, 0
_0238A17C: .word ov28_0238ADA0
_0238A180: .word ov28_0238AD28
	arm_func_end ov28_0238A140

; https://decomp.me/scratch/NY3Ql
	arm_func_start ov28_0238A184
ov28_0238A184: ; 0x0238A184
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r0, [r5]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0238A448
_0238A1A0: ; jump table
	b _0238A1B4 ; case 0
	b _0238A2A4 ; case 1
	b _0238A338 ; case 2
	b _0238A398 ; case 3
	b _0238A41C ; case 4
_0238A1B4:
	ldr r0, _0238A454 ; =ov28_0238ADA0
	ldr r1, _0238A458 ; =ov28_0238AD80
	ldr r2, [r0]
	mov r0, #0xc
	mul r3, r2, r0
	ldr r0, _0238A45C ; =ov28_0238AD24
	ldr r4, [r1]
	ldr r1, [r0, r3]
	ldrh r2, [r5, #0x18]
	add r0, r4, #0x58
	add r3, r0, #0x800
	sub r1, r2, r1
	add r0, r5, #0x1a
	add r1, r3, r1, lsl #6
	bl strcpy
	ldr r0, [r5, #4]
	mov r2, #0
	mov r3, r0, asr #0x10
	mov r1, r3, lsr #0x1f
	rsb r0, r1, r3, lsl #24
	str r3, [r5, #8]
	add r0, r1, r0, ror #24
	add r0, r0, #0xc0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r4, r1, r0, ror #24
	mov r0, r4, asr #2
	add r0, r4, r0, lsr #29
	mov r0, r0, asr #3
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	and r0, r0, #0xff
	mov r2, #0x20
	mov r3, #2
	bl sub_02028EE8
	add r1, r5, #0x1a
	b _0238A260
_0238A250:
	ldrb r0, [r1], #1
	cmp r0, #0x20
	movne r0, #0
	bne _0238A270
_0238A260:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0238A250
	mov r0, #1
_0238A270:
	cmp r0, #0
	bne _0238A290
	ldr r0, [r5, #0xc]
	mov r2, r4
	and r0, r0, #0xff
	add r3, r5, #0x1a
	mov r1, #0x10
	bl ov28_0238ABD4
_0238A290:
	ldrh r1, [r5, #0x18]
	mov r0, #1
	add r1, r1, #1
	strh r1, [r5, #0x18]
	str r0, [r5]
_0238A2A4:
	mvn r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	add r1, sp, #8
	mov r0, r0, asr #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	and r0, r0, #0xff
	bl sub_02028F88
	ldr r2, _0238A454 ; =ov28_0238ADA0
	ldr r0, _0238A460 ; =ov28_0238AD0C
	ldr r1, [r2]
	ldr r3, [r5, #4]
	ldr r0, [r0, r1, lsl #2]
	add r4, r3, r0
	mov r3, r4, asr #0x10
	mov r1, r3, lsr #0x1f
	rsb r0, r1, r3, lsl #28
	str r4, [r5, #4]
	adds r0, r1, r0, ror #28
	bne _0238A448
	ldr r0, [r5, #8]
	cmp r0, r3
	beq _0238A448
	ldr r1, [r2]
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _0238A464 ; =ov28_0238AD2C
	ldrh r1, [r5, #0x18]
	ldr r0, [r0, r2]
	cmp r1, r0
	mov r0, #0
	strgt r0, [r5, #0x14]
	movgt r0, #3
	strgt r0, [r5]
	strle r0, [r5]
	b _0238A448
_0238A338:
	ldr r0, [r5, #4]
	mov r2, #0
	mov r3, r0, asr #0x10
	mov r1, r3, lsr #0x1f
	rsb r0, r1, r3, lsl #24
	add r0, r1, r0, ror #24
	add r0, r0, #0xc0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r1, r1, r0, ror #24
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	str r3, [r5, #8]
	mov r0, r0, asr #3
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	and r0, r0, #0xff
	mov r2, #0x20
	mov r3, #2
	bl sub_02028EE8
	mov r0, #3
	str r0, [r5]
_0238A398:
	mvn r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	add r1, sp, #8
	mov r0, r0, asr #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	and r0, r0, #0xff
	bl sub_02028F88
	ldr r0, _0238A454 ; =ov28_0238ADA0
	ldr r1, _0238A460 ; =ov28_0238AD0C
	ldr r0, [r0]
	ldr r2, [r5, #4]
	ldr r0, [r1, r0, lsl #2]
	add r3, r2, r0
	mov r2, r3, asr #0x10
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #28
	str r3, [r5, #4]
	adds r0, r1, r0, ror #28
	bne _0238A448
	ldr r0, [r5, #8]
	cmp r0, r2
	beq _0238A448
	ldr r0, [r5, #0x14]
	add r0, r0, #1
	str r0, [r5, #0x14]
	cmp r0, #0xc
	movge r0, #4
	strge r0, [r5]
	movlt r0, #2
	strlt r0, [r5]
	b _0238A448
_0238A41C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	and r0, r0, #0xff
	mov r2, #0x20
	mov r3, #0x18
	bl sub_02028EE8
	mov r0, #0
	b _0238A44C
_0238A448:
	mov r0, #1
_0238A44C:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238A454: .word ov28_0238ADA0
_0238A458: .word ov28_0238AD80
_0238A45C: .word ov28_0238AD24
_0238A460: .word ov28_0238AD0C
_0238A464: .word ov28_0238AD2C
	arm_func_end ov28_0238A184

	arm_func_start ov28_0238A468
ov28_0238A468: ; 0x0238A468
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0238A488 ; =ov28_0238ACFC
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _0238A48C ; =ov28_0238ADA0
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238A488: .word ov28_0238ACFC
_0238A48C: .word ov28_0238ADA0
	arm_func_end ov28_0238A468

	arm_func_start ov28_0238A490
ov28_0238A490: ; 0x0238A490
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0238A578 ; =0x00003618
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A57C ; =ov28_0238AD80
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r0, #0x20
	mov r1, #0
	bl ov28_0238A140
	ldr r0, _0238A57C ; =ov28_0238AD80
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3c
	add r0, r0, #0x400
	bl ov28_0238A140
	ldr r0, _0238A57C ; =ov28_0238AD80
	mov r3, #0
	mvn r2, #1
_0238A4E4:
	ldr r1, [r0]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #9]
	cmp r3, #0x14
	blt _0238A4E4
	ldr r1, _0238A580 ; =ov28_0238ADA0
	mov r0, #0xc
	ldr r2, [r1]
	ldr r1, _0238A584 ; =ov28_0238AD24
	mul r3, r2, r0
	ldr r6, [r1, r3]
	ldr r0, _0238A588 ; =ov28_0238AD2C
	mov r4, r6
	ldr r5, [r0, r3]
	ldr r7, _0238A57C ; =ov28_0238AD80
	b _0238A54C
_0238A528:
	ldr r0, [r7]
	mov r1, r4, lsl #0x10
	add r0, r0, #0x58
	add r2, r0, #0x800
	sub r0, r4, r6
	add r0, r2, r0, lsl #6
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	add r4, r4, #1
_0238A54C:
	cmp r4, r5
	ble _0238A528
	ldr r0, _0238A57C ; =ov28_0238AD80
	mov r3, #5
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1]
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
_0238A578: .word 0x00003D58
#elif defined(JAPAN)
_0238A578: .word 0x00002C58
#else
_0238A578: .word 0x00003618
#endif
_0238A57C: .word ov28_0238AD80
_0238A580: .word ov28_0238ADA0
_0238A584: .word ov28_0238AD24
_0238A588: .word ov28_0238AD2C
	arm_func_end ov28_0238A490
