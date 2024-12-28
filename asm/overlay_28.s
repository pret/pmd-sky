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

	arm_func_start ov28_0238A58C
ov28_0238A58C: ; 0x0238A58C
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov28_0238AB5C
	bl sub_02025C14
	bl sub_02027170
	bl sub_02027228
	ldr r0, _0238A5C8 ; =ov28_0238AD80
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238A5C8 ; =ov28_0238AD80
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A5C8: .word ov28_0238AD80
	arm_func_end ov28_0238A58C

	arm_func_start ov28_0238A5CC
ov28_0238A5CC: ; 0x0238A5CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	ldr r6, _0238AB50 ; =ov28_0238AD80
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238AB44
_0238A5EC: ; jump table
	b _0238A608 ; case 0
	b _0238A6BC ; case 1
	b _0238A6C8 ; case 2
	b _0238A6A0 ; case 3
	b _0238A678 ; case 4
	b _0238AAC0 ; case 5
	b _0238AA90 ; case 6
_0238A608:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238AB44
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	mov r1, r6
	ldr r0, [r0]
	cmp r0, #0
	bne _0238A648
	ldr r2, [r1]
	mov r0, #1
	add r2, r2, #0x58
	add r3, r2, #0x800
	mov r1, #0x10
	mov r2, #0x68
	bl ov28_0238ABD4
	b _0238A664
_0238A648:
	ldr r2, [r1]
	mov r0, #0
	add r2, r2, #0x58
	add r3, r2, #0x800
	mov r1, #0x10
	mov r2, #0x60
	bl ov28_0238ABD4
_0238A664:
	ldr r0, _0238AB50 ; =ov28_0238AD80
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _0238AB44
_0238A678:
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238AB44
	mov r0, #1
	bl ov11_022E6E8C
	mov r0, r6
	ldr r0, [r0]
	mov r1, #3
	str r1, [r0]
	b _0238AB44
_0238A6A0:
	bl ov11_022E6EC8
	cmp r0, #0
	movne r0, r6
	ldrne r0, [r0]
	movne r1, #1
	strne r1, [r0]
	b _0238AB44
_0238A6BC:
	mov r0, #2
	str r0, [r1]
	b _0238AB44
_0238A6C8:
	mov r4, #0
	mvn r7, #1
_0238A6D0:
	ldr r0, [r6]
	add r0, r0, r4
	ldrsb r8, [r0, #9]
	cmp r8, r7
	beq _0238A718
	mov r0, r8
	bl sub_02028354
	cmp r0, #2
	bne _0238A718
	mov r0, r8
	bl sub_02028FA0
	cmp r0, #0
	bne _0238A718
	mov r0, r8
	bl sub_0202822C
	ldr r0, [r6]
	add r0, r0, r4
	strb r7, [r0, #9]
_0238A718:
	add r4, r4, #1
	cmp r4, #0x14
	blt _0238A6D0
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	ldr r2, [r0]
	cmp r2, #0
	bne _0238A854
	ldr r0, _0238AB50 ; =ov28_0238AD80
	ldr r0, [r0]
	add r0, r0, #0x20
	bl ov28_0238A184
	ldr r1, _0238AB50 ; =ov28_0238AD80
	mov r5, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x24]
	mov r0, r0, asr #0x10
	cmp r0, #0xc0
	blt _0238A774
	add r0, r1, #0x3c
	add r0, r0, #0x400
	bl ov28_0238A184
	orr r5, r5, r0
	b _0238AA48
_0238A774:
	add r4, r1, #0x3c
	ldr r0, [r4, #0x410]
	cmp r0, #0
	beq _0238A790
	cmp r0, #1
	beq _0238A814
	b _0238AA48
_0238A790:
	mvn r0, #3
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x404]
	add r1, sp, #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x40c]
	and r0, r0, #0xff
	bl sub_02028F88
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	ldr r1, _0238AB58 ; =ov28_0238AD0C
	ldr r0, [r0]
	ldr r2, [r4, #0x404]
	ldr r0, [r1, r0, lsl #2]
	add r0, r2, r0
	str r0, [r4, #0x404]
	ldr r0, [sp, #0x14]
	cmp r0, #0x88
	ble _0238AA48
	ldr r0, [r4, #0x40c]
	mov r2, #0x20
	add r1, sp, #0x10
	mov r3, r2
	and r0, r0, #0xff
	bl sub_02028EE8
	ldr r0, [r4, #0x40c]
	mov r1, #1
	and r0, r0, #0xff
	bl sub_0202825C
	ldr r0, [r4, #0x410]
	add r0, r0, #1
	str r0, [r4, #0x410]
	b _0238AA48
_0238A814:
	ldr r1, [r4, #0x40c]
	add r0, r4, #0x400
	and r1, r1, #0xff
	bl ov28_0238A140
	mvn r1, #3
	mov r0, #0
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x40c]
	add r1, sp, #0x10
	and r0, r0, #0xff
	bl sub_02028F88
	ldr r0, [r4, #0x410]
	add r0, r0, #1
	str r0, [r4, #0x410]
	b _0238AA48
_0238A854:
	ldr r0, _0238AB50 ; =ov28_0238AD80
	ldr r4, [r0]
	ldr r0, [r4, #0x24]
	mov r0, r0, asr #0x10
	cmp r0, #8
	blt _0238A87C
	add r0, r4, #0x20
	bl ov28_0238A184
	mov r5, r0
	b _0238A924
_0238A87C:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0238A8A4
	cmp r0, #1
	ldreq r0, _0238AB58 ; =ov28_0238AD0C
	ldreq r1, [r4, #0x24]
	ldreq r0, [r0, r2, lsl #2]
	addeq r0, r1, r0
	streq r0, [r4, #0x24]
	b _0238A924
_0238A8A4:
	mvn r0, #3
	str r0, [sp, #8]
	ldr r0, [r4, #0x24]
	add r1, sp, #8
	mov r0, r0, asr #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	and r0, r0, #0xff
	bl sub_02028F88
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	ldr r1, _0238AB58 ; =ov28_0238AD0C
	ldr r0, [r0]
	ldr r2, [r4, #0x24]
	ldr r0, [r1, r0, lsl #2]
	add r0, r2, r0
	str r0, [r4, #0x24]
	ldr r0, [sp, #0xc]
	cmp r0, #0x88
	ble _0238A924
	ldr r0, [r4, #0x2c]
	mov r2, #0x20
	add r1, sp, #8
	mov r3, r2
	and r0, r0, #0xff
	bl sub_02028EE8
	ldr r0, [r4, #0x2c]
	mov r1, #1
	and r0, r0, #0xff
	bl sub_0202825C
	ldr r0, [r4, #0x30]
	add r0, r0, #1
	str r0, [r4, #0x30]
_0238A924:
	ldr r0, _0238AB50 ; =ov28_0238AD80
	ldr r4, [r0]
	ldr r0, [r4, #0x24]
	mov r0, r0, asr #0x10
	cmp r0, #0x60
	blt _0238AA48
	ldr r0, [r4, #0x440]
	mov r0, r0, asr #0x10
	cmp r0, #0x68
	blt _0238A960
	add r0, r4, #0x3c
	add r0, r0, #0x400
	bl ov28_0238A184
	orr r5, r5, r0
	b _0238AA48
_0238A960:
	ldr r0, [r4, #0x44c]
	cmp r0, #0
	beq _0238A980
	cmp r0, #1
	beq _0238A9A8
	cmp r0, #2
	beq _0238AA2C
	b _0238AA48
_0238A980:
	add r0, r4, #0x58
	mov r1, #0x10
	sub r2, r1, #0x50
	add r3, r0, #0x800
	mov r0, #1
	bl ov28_0238ABD4
	ldr r0, [r4, #0x44c]
	add r0, r0, #1
	str r0, [r4, #0x44c]
	b _0238AA48
_0238A9A8:
	mvn r0, #3
	str r0, [sp]
	ldr r0, [r4, #0x440]
	add r1, sp, #0
	mov r0, r0, asr #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x448]
	and r0, r0, #0xff
	bl sub_02028F88
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	ldr r1, _0238AB58 ; =ov28_0238AD0C
	ldr r0, [r0]
	ldr r2, [r4, #0x440]
	ldr r0, [r1, r0, lsl #2]
	add r0, r2, r0
	str r0, [r4, #0x440]
	ldr r0, [sp, #4]
	cmp r0, #0xd0
	ble _0238AA48
	ldr r0, [r4, #0x448]
	mov r2, #0x20
	add r1, sp, #0
	mov r3, r2
	and r0, r0, #0xff
	bl sub_02028EE8
	ldr r0, [r4, #0x448]
	mov r1, #1
	and r0, r0, #0xff
	bl sub_0202825C
	ldr r0, [r4, #0x44c]
	add r0, r0, #1
	str r0, [r4, #0x44c]
	b _0238AA48
_0238AA2C:
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	ldr r1, _0238AB58 ; =ov28_0238AD0C
	ldr r0, [r0]
	ldr r2, [r4, #0x440]
	ldr r0, [r1, r0, lsl #2]
	add r0, r2, r0
	str r0, [r4, #0x440]
_0238AA48:
	ldr r0, _0238AB50 ; =ov28_0238AD80
	ldr r2, [r0]
	ldrb r0, [r2, #8]
	cmp r0, #0
	bne _0238AA78
	ldr r0, [r2, #0x20]
	cmp r0, #3
	blt _0238AA78
	mov r1, #1
	mov r0, #2
	strb r1, [r2, #8]
	bl ov11_022E6E8C
_0238AA78:
	cmp r5, #0
	ldreq r0, _0238AB50 ; =ov28_0238AD80
	moveq r1, #6
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238AB44
_0238AA90:
	mov r0, #0
	mov r1, #1
	bl sub_0202825C
	mov r0, #1
	mov r1, r0
	bl sub_0202825C
	mov r0, #0
	bl sub_02025B80
	mov r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	b _0238AB48
_0238AAC0:
	mvn r0, #3
	bl ov28_0238AB5C
	mov r0, #0
	bl ov11_022E6E8C
	ldr r0, _0238AB54 ; =ov28_0238ADA0
	ldr r0, [r0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0238AB2C
_0238AAE4: ; jump table
	b _0238AAFC ; case 0
	b _0238AB04 ; case 1
	b _0238AB0C ; case 2
	b _0238AB14 ; case 3
	b _0238AB1C ; case 4
	b _0238AB24 ; case 5
_0238AAFC:
	mov r0, #0
	b _0238AB30
_0238AB04:
	mov r0, #1
	b _0238AB30
_0238AB0C:
	mov r0, #2
	b _0238AB30
_0238AB14:
	mov r0, #3
	b _0238AB30
_0238AB1C:
	mov r0, #4
	b _0238AB30
_0238AB24:
	mov r0, #5
	b _0238AB30
_0238AB2C:
	mvn r0, #0
_0238AB30:
	bl sub_02025B90
	ldr r0, _0238AB50 ; =ov28_0238AD80
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
_0238AB44:
	mov r0, #1
_0238AB48:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238AB50: .word ov28_0238AD80
_0238AB54: .word ov28_0238ADA0
_0238AB58: .word ov28_0238AD0C
	arm_func_end ov28_0238A5CC

	arm_func_start ov28_0238AB5C
ov28_0238AB5C: ; 0x0238AB5C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r2, #0x20
	mov r4, r0
	mov r0, #0
	add r1, sp, #0
	mov r3, r2
	str r0, [sp]
	str r0, [sp, #4]
	bl sub_02028EE8
	mov r2, #0x20
	add r1, sp, #0
	mov r3, r2
	mov r0, #1
	bl sub_02028EE8
	add r1, sp, #0
	mov r0, #0
	str r4, [sp]
	bl sub_02028F88
	add r1, sp, #0
	mov r0, #1
	bl sub_02028F88
	mov r0, #0
	mov r1, #1
	bl sub_0202825C
	mov r0, #1
	mov r1, r0
	bl sub_0202825C
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov28_0238AB5C

	arm_func_start ov28_0238ABD4
ov28_0238ABD4: ; 0x0238ABD4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r5, r1
	mov r1, r5, asr #2
	mov r7, #0
	mov r6, r0
	add r1, r5, r1, lsr #29
	mov r1, r1, asr #3
	mov r4, r2, asr #2
	add r4, r2, r4, lsr #29
	mov lr, r4, asr #3
	mov r8, r2, lsr #0x1f
	sub r0, r7, #5
	rsb r2, r8, r2, lsl #29
	and ip, r1, #0xff
	strb r0, [sp, #9]
	rsb ip, ip, #0x1d
	str r7, [sp]
	str r7, [sp, #0xc]
	adds r8, r8, r2, ror #29
	ldr r0, _0238ACF8 ; =ov28_0238AD80
	movne r7, #1
	strb r1, [sp, #4]
	add r1, r7, #2
	ldr r2, [r0]
	mov r4, r3
	strb r6, [sp, #8]
	strb lr, [sp, #5]
	strb ip, [sp, #6]
	strb r1, [sp, #7]
	mov r7, #0
	mvn r0, #1
	b _0238AC6C
_0238AC58:
	add r1, r2, r7
	ldrsb r1, [r1, #9]
	cmp r1, r0
	beq _0238AC74
	add r7, r7, #1
_0238AC6C:
	cmp r7, #0x14
	blt _0238AC58
_0238AC74:
	mov r0, r6
	bl sub_02028270
	ldrb r2, [sp, #6]
	ldrb r1, [sp, #7]
	mla r0, r2, r1, r0
	cmp r0, #0x300
	blt _0238AC9C
	mov r0, r6
	mov r1, #1
	bl sub_0202825C
_0238AC9C:
	add r0, sp, #0
	mov r1, #3
	bl NewWindow
	ldr r1, _0238ACF8 ; =ov28_0238AD80
	ldr r2, [r1]
	add r2, r2, r7
	strb r0, [r2, #9]
	ldr r0, [r1]
	add r0, r0, r7
	ldrsb r0, [r0, #9]
	bl sub_0202810C
	ldr r0, _0238ACF8 ; =ov28_0238AD80
	mov r6, r5, lsr #0x1f
	ldr r0, [r0]
	rsb r1, r6, r5, lsl #29
	add r0, r0, r7
	ldrsb r0, [r0, #9]
	mov r2, r8
	mov r3, r4
	add r1, r6, r1, ror #29
	bl DrawTextInWindow
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0238ACF8: .word ov28_0238AD80
	arm_func_end ov28_0238ABD4
	; 0x0238ACFC

	.rodata
	.global ov28_0238ACFC
ov28_0238ACFC:
	.byte 0x0D, 0x00, 0x00, 0x00
	.word ov28_0238A490
	.word ov28_0238A58C
	.word ov28_0238A5CC
	.global ov28_0238AD0C
ov28_0238AD0C:
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.global ov28_0238AD24
ov28_0238AD24:
#if defined(EUROPE)
#define OV28_DATA_OFFSET_1 2
#define OV28_DATA_OFFSET_2 0x1F
#define OV28_DATA_OFFSET_3 OV28_DATA_OFFSET_2
#define OV28_DATA_OFFSET_4 OV28_DATA_OFFSET_2
#define OV28_DATA_OFFSET_5 OV28_DATA_OFFSET_2
#define OV28_DATA_OFFSET_6 OV28_DATA_OFFSET_2
#elif defined(JAPAN)
#define OV28_DATA_OFFSET_1 -0x14C8
#define OV28_DATA_OFFSET_2 -0x14EF
#define OV28_DATA_OFFSET_3 -0xC49
#define OV28_DATA_OFFSET_4 -0xD5D
#define OV28_DATA_OFFSET_5 -0xC86
#define OV28_DATA_OFFSET_6 -0xB72
#else
#define OV28_DATA_OFFSET_1 0
#define OV28_DATA_OFFSET_2 0
#define OV28_DATA_OFFSET_3 0
#define OV28_DATA_OFFSET_4 0
#define OV28_DATA_OFFSET_5 0
#define OV28_DATA_OFFSET_6 0
#endif
	.word 0x44BF + OV28_DATA_OFFSET_1
	.global ov28_0238AD28
ov28_0238AD28:
	.word 0x44C0 + OV28_DATA_OFFSET_1
	.global ov28_0238AD2C
ov28_0238AD2C:
	.word 0x4575 + OV28_DATA_OFFSET_2, 0x4629 + OV28_DATA_OFFSET_3, 0x462A + OV28_DATA_OFFSET_3, 0x4684 + OV28_DATA_OFFSET_3
	.word 0x4799 + OV28_DATA_OFFSET_4, 0x479A + OV28_DATA_OFFSET_4, 0x4813 + OV28_DATA_OFFSET_4, 0x473D + OV28_DATA_OFFSET_5
	.word 0x473E + OV28_DATA_OFFSET_5, 0x4798 + OV28_DATA_OFFSET_5, 0x4685 + OV28_DATA_OFFSET_6, 0x4686 + OV28_DATA_OFFSET_6
	.word 0x46E0 + OV28_DATA_OFFSET_6, 0x46E1 + OV28_DATA_OFFSET_6, 0x46E2 + OV28_DATA_OFFSET_6, 0x473C + OV28_DATA_OFFSET_6

	.data
	.global ov28_0238AD80
ov28_0238AD80:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov28_0238ADA0
ov28_0238ADA0:
	.space 0x20
