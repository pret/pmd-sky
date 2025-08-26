	.include "asm/macros.inc"
	.include "overlay_11_022ECD24.inc"

	.text
    
.public LoadMapType10
.public LoadMapType11

	arm_func_start ov11_022ED69C
ov11_022ED69C: ; 0x022ED69C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	mov sb, r1
	add r1, sb, #0x100
	ldrsh r2, [r1, #0xbe]
	mvn r1, #0
	mov sl, r0
	cmp r2, r1
	bne _022ED6CC
	bl ov11_022EC08C
	mov r0, #0
	b _022EDCFC
_022ED6CC:
	bl GroundBg_CloseOpenedFiles
	ldr r0, [sb, #0x174]
	add r1, sl, #0x100
	str r0, [sp, #8]
	mov r0, #3
	strh r0, [sl]
	mov r0, #0
	strb r0, [sl, #0x1c0]
	add r0, sb, #0x100
	ldrsh r2, [r0, #0xbe]
	add r0, sp, #0x18
	strh r2, [r1, #0xbe]
	ldr r2, [sb, #0x1c4]
	str r2, [sl, #0x1c4]
	ldrsh r1, [r1, #0xbe]
	bl LoadBackgroundAttributes
	add r2, sb, #0x100
	ldrsh r3, [r2, #0xea]
	add r1, sb, #0xea
	add r2, sl, #0x100
	strh r3, [r2, #0xea]
	add r1, r1, #0x100
	add r0, sl, #0xea
	ldrsh r1, [r1, #2]
	add r6, r0, #0x100
	mov r5, #0
	strh r1, [r6, #2]
	add r2, sl, #0x1c8
	add r1, sb, #0x1c8
	mov r0, r5
	mov r8, #0xc
_022ED748:
	mul fp, r5, r8
	ldrsh r4, [r1, fp]
	mov r7, r0
	add r3, r2, fp
	strh r4, [r2, fp]
	add r4, r1, fp
_022ED760:
	add fp, r4, r7, lsl #1
	ldrsh ip, [fp, #2]
	add fp, r3, r7, lsl #1
	add r7, r7, #1
	strh ip, [fp, #2]
	cmp r7, #4
	blt _022ED760
	ldrsh r4, [r4, #0xa]
	add r5, r5, #1
	cmp r5, #2
	strh r4, [r3, #0xa]
	blt _022ED748
	ldrb r2, [sb, #0x1e0]
	add r0, sb, #0x1e0
	add r1, sl, #0x1e0
	strb r2, [sl, #0x1e0]
	ldrb r3, [r0, #1]
	add r2, sl, #0x200
	str r2, [sp, #0x10]
	strb r3, [r1, #1]
	ldrb r5, [r0, #2]
	ldr r2, [sp, #8]
	ldr r4, _022EDD04 ; =ov11_02324CBC
	strb r5, [r1, #2]
	add fp, r2, #4
	ldrb r2, [r0, #3]
	mov r3, #0x28
	mov r8, #0
	strb r2, [r1, #3]
	ldrsh r2, [r0, #4]
	strh r2, [r1, #4]
	ldrsh r2, [r0, #6]
	strh r2, [r1, #6]
	ldrsh r0, [r0, #8]
	strh r0, [r1, #8]
	ldr r0, [sp, #0x10]
	ldr r2, [r4]
	ldrsh r0, [r0, #0xc2]
	ldrb r1, [sl, #0x2bc]
	add r5, r2, #0x98
	mov r0, r0, lsl #0x14
	smulbb r4, r1, r3
	mov r7, r0, lsr #0x10
	b _022ED854
_022ED810:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	ldr r2, _022EDD08 ; =ov11_02320BF4
	add r0, r5, r4
	bl sub_0200A590
	add r0, r5, r4
	mov r1, r7
	mov r2, fp
	mov r3, #0xf
	bl sub_0200A5B0
	add r0, r7, #0xf
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	add fp, fp, #0x3c
	add r8, r8, #1
_022ED854:
	ldrsh r0, [r6]
	cmp r8, r0
	bge _022ED870
	ldr r0, [sp, #0x10]
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ED810
_022ED870:
	add r0, sl, #0x200
	str r0, [sp, #0x14]
	b _022ED8C8
_022ED87C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	ldr r2, _022EDD08 ; =ov11_02320BF4
	add r0, r5, r4
	bl sub_0200A590
	mov fp, #1
_022ED89C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	ldr r2, _022EDD0C ; =ov11_02320BE8
	add r0, r5, r4
	bl sub_0200A590
	add fp, fp, #1
	cmp fp, #0x10
	blt _022ED89C
	add r8, r8, #1
_022ED8C8:
	ldr r0, [sp, #0x14]
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ED87C
	add r0, r5, r4
	bl sub_0200A504
	ldrsh r2, [r6, #2]
	add r0, sl, #4
	mov r1, #0
	cmp r2, #0
	beq _022ED99C
	ldrsh r5, [r6]
	ldr r2, [sp, #8]
	mov r3, #1
	add r4, r2, #4
	rsb r2, r5, r5, lsl #4
	add r2, r4, r2, lsl #2
	str r2, [sl, #0x1f4]
	strb r3, [sl, #0x1fb]
	strb r1, [sl, #0x1bc]
	ldrb r4, [sb, #0x1f8]
	add r3, r2, r5, lsl #2
	mov r8, r1
	strb r4, [sl, #0x1f8]
	ldrb r4, [sb, #0x1fa]
	mov r7, r1
	strb r4, [sl, #0x1f9]
	ldrb r4, [sb, #0x1fa]
	strb r4, [sl, #0x1fa]
	ldrb r4, [sb, #0x1ee]
	strb r4, [sl, #0x1ee]
	add r4, sl, #0x200
	b _022ED980
_022ED94C:
	ldrsh r5, [r2, #2]
	add r1, r1, #1
	cmp r5, #0
	strgt r3, [r0, #4]
	ldrgtsh r5, [r2, #2]
	add r2, r2, #4
	strle r8, [r0, #4]
	strh r7, [r0]
	rsbgt r5, r5, r5, lsl #4
	strh r7, [r0, #2]
	str r7, [r0, #8]
	addgt r3, r3, r5, lsl #2
	add r0, r0, #0xc
_022ED980:
	ldrsh r5, [r6]
	cmp r1, r5
	bge _022ED9B4
	ldrsh r5, [r4, #0xc4]
	cmp r1, r5
	blt _022ED94C
	b _022ED9B4
_022ED99C:
	str r1, [sl, #0x1f4]
	strb r1, [sl, #0x1f8]
	strb r1, [sl, #0x1f9]
	strb r1, [sl, #0x1fa]
	strb r1, [sl, #0x1fb]
	strb r1, [sl, #0x1bc]
_022ED9B4:
	mov r2, #0
	b _022ED9D4
_022ED9BC:
	strh r2, [r0]
	strh r2, [r0, #2]
	str r2, [r0, #8]
	str r2, [r0, #4]
	add r1, r1, #1
	add r0, r0, #0xc
_022ED9D4:
	cmp r1, #0x10
	blt _022ED9BC
	mov r8, #0
	add r6, sl, #0xc4
	mov r5, r8
	mov r4, r8
	mov fp, #0x2c
_022ED9F0:
	mul r0, r8, fp
	add r7, r6, r0
	strb r5, [r6, r0]
	strb r5, [r7, #1]
	strh r5, [r7, #4]
	strh r5, [r7, #2]
	add r0, r7, #8
	bl ZInit8
	str r4, [r7, #0x10]
	str r4, [r7, #0x18]
	str r4, [r7, #0x14]
	str r4, [r7, #0x20]
	str r4, [r7, #0x1c]
	add r8, r8, #1
	str r4, [r7, #0x24]
	str r4, [r7, #0x28]
	cmp r8, #4
	blt _022ED9F0
	add r0, sl, #0x200
	ldrsh r3, [r0, #0xbe]
	b _022EDB58
_022EDA44:
	mov r0, #0xc
	mul r2, r4, r0
	add r0, sl, #0x200
	ldrb r7, [sl, #0x2bc]
	ldr r6, _022EDD10 ; =ov11_02320C18
	cmp r4, #0
	add r6, r6, r7, lsl #3
	moveq r8, #0
	movne r8, #2
	cmp r4, #0
	moveq fp, #0
	add r5, sl, #0x1c8
	ldrsh r1, [r0, #0xc6]
	ldrsh r0, [r5, r2]
	ldr r7, [r6, r3, lsl #2]
	add r6, r5, r2
	add r0, r1, r0
	add r5, r7, r0, lsl #5
	add r0, sl, #0xc4
	movne fp, #4
	mov r7, #0
	add lr, sb, #0xc4
	str r0, [sp, #0xc]
_022EDAA0:
	mov r0, #0x2c
	mul r1, r8, r0
	ldr r0, [sp, #0xc]
	add r2, lr, r1
	add r1, r0, r1
	mov ip, #0xa
	add r0, sp, #0x18
	mla r0, fp, ip, r0
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0
	beq _022EDB3C
	ldr r0, [r2, #8]
	ldr ip, [r2, #0xc]
	add r2, r6, r7, lsl #1
	str r0, [r1, #8]
	str ip, [r1, #0xc]
	mov r0, #1
	strb r0, [r1]
	strb r0, [r1, #1]
	ldr ip, [r1, #8]
	str ip, [r1, #0x10]
	add r0, ip, #4
	ldrsh ip, [ip, #2]
	str r0, [r1, #0x18]
	add ip, r0, ip, lsl #2
	str r0, [r1, #0x14]
	str ip, [r1, #0x20]
	str ip, [r1, #0x1c]
	mov r0, #0
	strh r0, [r1, #2]
	ldr r0, [r1, #0x18]
	ldr r0, [r0]
	strh r0, [r1, #4]
	str r5, [r1, #0x24]
	ldrsh r0, [r2, #2]
	mov r0, r0, lsl #5
	str r0, [r1, #0x28]
	ldrsh r0, [r2, #2]
	add r5, r5, r0, lsl #5
_022EDB3C:
	add r7, r7, #1
	cmp r7, #2
	add fp, fp, #1
	add r8, r8, #1
	blt _022EDAA0
	add r4, r4, #1
	add r3, r3, #1
_022EDB58:
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc0]
	cmp r4, r1
	blt _022EDA44
	ldrsh r5, [r0, #0xbe]
	mov r4, #0
	b _022EDBF0
_022EDB74:
	mov r0, #0xc
	mul r0, r4, r0
	add r1, sb, #0x1c8
	ldrsh r2, [r1, r0]
	add r3, r1, r0
	mov r1, #0
_022EDB8C:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #2]
	add r1, r1, #1
	cmp r1, #4
	add r2, r2, r0
	blt _022EDB8C
	cmp r2, #0
	ble _022EDBD0
	ldrb r0, [sl, #0x2bc]
	ldr r3, _022EDD10 ; =ov11_02320C18
	ldrb r1, [sb, #0x2bc]
	add r0, r3, r0, lsl #3
	ldr r0, [r0, r5, lsl #2]
	add r1, r3, r1, lsl #3
	ldr r1, [r1, r5, lsl #2]
	mov r2, r2, lsl #5
	bl Memcpy16
_022EDBD0:
	add r2, sb, r4, lsl #2
	ldr r0, [r2, #0x2dc]
	add r1, sl, r4, lsl #2
	str r0, [r1, #0x2dc]
	ldr r0, [r2, #0x2e4]
	add r4, r4, #1
	str r0, [r1, #0x2e4]
	add r5, r5, #1
_022EDBF0:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r4, r0
	blt _022EDB74
	ldr r0, [sb, #0x1fc]
	add r4, sb, #0x210
	str r0, [sl, #0x1fc]
	add r5, sl, #0x210
	mov r6, #0
	b _022EDCB8
_022EDC18:
	mov sb, r4
	mov r8, r5
	mov r7, #5
_022EDC24:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _022EDC24
	ldr r1, [sb]
	mov r0, #0
	str r1, [r8]
	ldrsh r7, [r5, #2]
	add r1, sl, #0x200
	b _022EDC64
_022EDC4C:
	add r2, sl, r7, lsl #2
	ldr r3, [r2, #0x2ec]
	add r2, r5, r0, lsl #2
	str r3, [r2, #0x2c]
	add r0, r0, #1
	add r7, r7, #1
_022EDC64:
	ldrsh r2, [r5, #4]
	cmp r0, r2
	bge _022EDC7C
	ldrsh r2, [r1, #0xc0]
	cmp r7, r2
	blt _022EDC4C
_022EDC7C:
	mov r2, #0
	b _022EDC98
_022EDC84:
	add r1, r5, r0, lsl #2
	str r2, [r1, #0x1c]
	str r2, [r1, #0x24]
	str r2, [r1, #0x2c]
	add r0, r0, #1
_022EDC98:
	cmp r0, #2
	blt _022EDC84
	mov r0, r5
	add r1, sl, #0x200
	bl ov11_022EE9B0
	add r6, r6, #1
	add r5, r5, #0x54
	add r4, r4, #0x54
_022EDCB8:
	ldr r0, [sl, #0x1fc]
	cmp r6, r0
	blt _022EDC18
	mov r4, #0
	b _022EDCF0
_022EDCCC:
	str r4, [sp]
	mov r0, r5
	mov r1, sl
	mov r2, r4
	mov r3, r4
	str r4, [sp, #4]
	bl ov11_022EE8CC
	add r6, r6, #1
	add r5, r5, #0x54
_022EDCF0:
	cmp r6, #2
	blt _022EDCCC
	mov r0, #1
_022EDCFC:
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EDD04: .word ov11_02324CBC
_022EDD08: .word ov11_02320BF4
_022EDD0C: .word ov11_02320BE8
_022EDD10: .word ov11_02320C18
	arm_func_end ov11_022ED69C

	arm_func_start ov11_022EDD14
ov11_022EDD14: ; 0x022EDD14
	mov r1, #1
	strb r1, [r0, #0x1c0]
	bx lr
	arm_func_end ov11_022EDD14

	arm_func_start ov11_022EDD20
ov11_022EDD20: ; 0x022EDD20
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xf0
	mov r5, r0
	add r0, r5, #0x18c
	mov r4, r1
	bl PointsToZero
	cmp r0, #0
	bne _022EDD48
	add r0, r5, #0x18c
	bl UnloadFile
_022EDD48:
	add r0, r5, #0x100
	strh r4, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0x80
	bl LoadBackgroundAttributes
	ldr r1, _022EDE5C ; =ov11_02320C80
	add r0, sp, #0
	add r2, sp, #0x94
	bl sprintf
	ldr r2, _022EDE60 ; =0x0000030F
	add r1, sp, #0
	add r0, r5, #0x18c
	bl LoadFileFromRom
	ldr lr, [r5, #0x18c]
	add r4, r5, #0x1e0
	ldrb r2, [lr]
	add r0, r5, #0x2e4
	add r1, lr, #0xc
	strb r2, [r5, #0x1e0]
	ldrb ip, [lr, #1]
	add r2, r5, #0x2bc
	mov r3, r4
	strb ip, [r4, #1]
	ldrb ip, [lr, #4]
	strb ip, [r4, #2]
	ldrb ip, [lr, #5]
	strb ip, [r4, #3]
	ldrb ip, [lr, #6]
	strh ip, [r4, #4]
	ldrb ip, [lr, #8]
	strh ip, [r4, #6]
	ldrb ip, [lr, #0xa]
	strh ip, [r4, #8]
	bl BmaLayerNrlDecompressor
	mov r1, r0
	str r1, [r5, #0x1f0]
	ldr r0, [r5, #0x2d8]
	cmp r0, #0
	beq _022EDDF8
	add r2, r5, #0x200
	ldrsh r3, [r2, #0xce]
	ldr ip, [r5, #0x2d4]
	mov r2, r4
	blx ip
_022EDDF8:
	add r0, r5, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r0, #0
	mov r0, r5
	ble _022EDE18
	mov r1, #1
	bl ov11_022EE620
	b _022EDE20
_022EDE18:
	mov r1, #0
	bl ov11_022EE620
_022EDE20:
	ldr r1, [r5, #0x228]
	add r0, r5, #0x210
	blx r1
	mov r1, #1
	add r0, r5, #0x18c
	strb r1, [r5, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022EDE4C
	add r0, r5, #0x18c
	bl UnloadFile
_022EDE4C:
	mov r0, #0
	strb r0, [r5, #0x1c0]
	add sp, sp, #0xf0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDE5C: .word ov11_02320C80
_022EDE60: .word 0x0000030F
	arm_func_end ov11_022EDD20

	arm_func_start ov11_022EDE64
ov11_022EDE64: ; 0x022EDE64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	bl ov11_022EC08C
	mov r1, #4
	strh r1, [sl]
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r0, #1
	mov r0, sl
	bne _022EDEA4
	mov r1, #1
	bl ov11_022EE620
	b _022EDEA8
_022EDEA4:
	bl ov11_022EE620
_022EDEA8:
	ldr r3, _022EE0B8 ; =ov11_02320BF0
	add r2, sp, #0xc
	mov r6, #0
	mov r1, #4
_022EDEB8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022EDEB8
	b _022EE0A0
_022EDECC:
	cmp r6, #0
	ldreq r1, [sp]
	ldrne r1, [sp, #4]
	cmp r1, #0
	beq _022EE074
	ldr r2, _022EE0BC ; =0x0000030F
	add r0, sp, #0x18
	bl LoadFileFromRom
	ldr r0, [sp, #0x18]
	bl GetAtSize
	mov r4, r0
	cmp r4, #0
	ldrle r0, [sp, #0x1c]
	ldrle r5, [sp, #0x18]
	strle r0, [sp, #8]
	ble _022EDF34
	ldr r1, _022EE0BC ; =0x0000030F
	bl MemAlloc
	ldr r2, [sp, #0x18]
	mov r1, r4
	mov r5, r0
	bl DecompressAtNormalVeneer
	ldr r1, [r5, #0xc]
	add r0, sp, #0x18
	str r1, [sp, #8]
	bl UnloadFile
_022EDF34:
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc2]
	ldr r0, _022EE0C0 ; =ov11_02324CBC
	ldr r2, [r5]
	ldr r4, [r0]
	mov r1, r1, lsl #0x14
	ldrb r3, [sl, #0x2bc]
	mov r0, #0x28
	add r4, r4, #0x98
	smulbb fp, r3, r0
	mov r7, r1, lsr #0x10
	add sb, r5, r2
	mov r8, #0
	b _022EDFE8
_022EDF6C:
	add r3, sp, #0xc
	add r2, sp, #0x10
	mov r1, #4
_022EDF78:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022EDF78
	ldrb r0, [sb]
	add r3, sp, #0x10
	add r2, sp, #0x14
	strb r0, [sp, #0x10]
	ldrb r0, [sb, #1]
	mov r1, #4
	strb r0, [sp, #0x11]
	ldrb r0, [sb, #2]
	strb r0, [sp, #0x12]
	ldrb r0, [sb, #3]
	strb r0, [sp, #0x13]
_022EDFB4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022EDFB4
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	add r0, r4, fp
	add r2, sp, #0x14
	bl sub_0200A590
	add r8, r8, #1
	add sb, sb, #4
_022EDFE8:
	ldr r1, [r5, #4]
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	cmp r8, r0, asr #2
	blt _022EDF6C
	add r0, r4, fp
	bl sub_0200A504
	add r0, sl, #0x200
	ldrsh r2, [r0, #0xbe]
	ldr r1, [r5, #8]
	ldrb r7, [sl, #0x2bc]
	ldr r4, _022EE0C4 ; =ov11_02320C18
	add r3, r2, r6
	add r2, r4, r7, lsl #3
	ldr r3, [r2, r3, lsl #2]
	ldrsh r0, [r0, #0xc6]
	ldr r2, [sp, #8]
	add r1, r5, r1
	add r0, r3, r0, lsl #5
	bl Memcpy16
	add r0, sl, r6, lsl #2
	ldr r1, [r5, #0x10]
	ldr r3, [r0, #0x2ec]
	add r2, r5, r1
	mov r1, #0
_022EE04C:
	ldrh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x400
	strh r0, [r3], #2
	blt _022EE04C
	mov r1, #1
	mov r0, r5
	strb r1, [sl, #0x2ba]
	bl MemFree
	b _022EE09C
_022EE074:
	add r0, sl, r6, lsl #2
	ldr r2, [r0, #0x2ec]
	mov r1, #0
	mov r0, r1
_022EE084:
	add r1, r1, #1
	cmp r1, #0x400
	strh r0, [r2], #2
	blt _022EE084
	mov r0, #1
	strb r0, [sl, #0x2ba]
_022EE09C:
	add r6, r6, #1
_022EE0A0:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r6, r0
	blt _022EDECC
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE0B8: .word ov11_02320BF0
_022EE0BC: .word 0x0000030F
_022EE0C0: .word ov11_02324CBC
_022EE0C4: .word ov11_02320C18
	arm_func_end ov11_022EDE64

	arm_func_start ov11_022EE0C8
ov11_022EE0C8: ; 0x022EE0C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _022EE12C ; =ov11_02320C28
	mov r4, r0
	bl GroundBg_Init
	mov r0, r4
	bl ov11_022EC08C
	mov r2, #5
	mov r0, r4
	mov r1, #1
	strh r2, [r4]
	bl ov11_022EE620
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldr r0, _022EE130 ; =ov11_02324CBC
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xe
	str r2, [sp]
	stmib sp, {r0, r2}
	ldr r0, _022EE134 ; =0x06010000
	add r3, r1, #0x98
	bl sub_02016300
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022EE12C: .word ov11_02320C28
_022EE130: .word ov11_02324CBC
_022EE134: .word 0x06010000
	arm_func_end ov11_022EE0C8

	arm_func_start ov11_022EE138
ov11_022EE138: ; 0x022EE138
	ldr ip, _022EE140 ; =sub_020163E4
	bx ip
	.align 2, 0
_022EE140: .word sub_020163E4
	arm_func_end ov11_022EE138

	arm_func_start ov11_022EE144
ov11_022EE144: ; 0x022EE144
	ldr ip, _022EE158 ; =sub_02016378
	mov r0, r1
	mov r1, r2
	mov r2, #3
	bx ip
	.align 2, 0
_022EE158: .word sub_02016378
	arm_func_end ov11_022EE144

	arm_func_start ov11_022EE15C
ov11_022EE15C: ; 0x022EE15C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	bl sub_02016468
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE15C

	arm_func_start ov11_022EE17C
ov11_022EE17C: ; 0x022EE17C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_0201641C
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE17C

	arm_func_start ov11_022EE198
ov11_022EE198: ; 0x022EE198
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r4, r1
	ldr r1, _022EE204 ; =ov11_02320C28
	mov r5, r0
	bl GroundBg_Init
	mov r0, r5
	bl ov11_022EC08C
	mov r2, #6
	mov r0, r5
	mov r1, #1
	strh r2, [r5]
	bl ov11_022EE620
	mov r0, #1
	strb r0, [r5, #0x1c0]
	strb r0, [r5, #0x1c1]
	ldr r0, _022EE208 ; =ov11_02324CBC
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xe
	str r2, [sp]
	stmib sp, {r0, r4}
	ldr r0, _022EE20C ; =0x06010000
	add r3, r1, #0x98
	bl sub_02016300
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022EE204: .word ov11_02320C28
_022EE208: .word ov11_02324CBC
_022EE20C: .word 0x06010000
	arm_func_end ov11_022EE198

	arm_func_start ov11_022EE210
ov11_022EE210: ; 0x022EE210
	ldr ip, _022EE218 ; =sub_020163E4
	bx ip
	.align 2, 0
_022EE218: .word sub_020163E4
	arm_func_end ov11_022EE210

	arm_func_start ov11_022EE21C
ov11_022EE21C: ; 0x022EE21C
	ldrsh r1, [r0]
	cmp r1, #6
	ldreqb r0, [r0, #0x1c1]
	movne r0, #0
	bx lr
	arm_func_end ov11_022EE21C

	arm_func_start ov11_022EE230
ov11_022EE230: ; 0x022EE230
	stmdb sp!, {r4, lr}
	cmp r1, #5
	moveq r3, #4
	mov r4, r0
	mov r0, r1
	movne r3, #3
	mov r1, r2
	mov r2, r3
	bl sub_02016378
	mov r0, #0
	strb r0, [r4, #0x1c0]
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE230

	arm_func_start ov11_022EE268
ov11_022EE268: ; 0x022EE268
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _022EE2C4 ; =ov11_02320C28
	mov r4, r0
	bl GroundBg_Init
	mov r0, r4
	bl ov11_022EC08C
	mov r2, #5
	mov r0, r4
	mov r1, #1
	strh r2, [r4]
	bl ov11_022EE620
	ldr r0, _022EE2C8 ; =ov11_02324CBC
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xe
	str r2, [sp]
	stmib sp, {r0, r2}
	ldr r0, _022EE2CC ; =0x06010000
	add r3, r1, #0x98
	bl sub_02015328
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022EE2C4: .word ov11_02320C28
_022EE2C8: .word ov11_02324CBC
_022EE2CC: .word 0x06010000
	arm_func_end ov11_022EE268

	arm_func_start ov11_022EE2D0
ov11_022EE2D0: ; 0x022EE2D0
	bx lr
	arm_func_end ov11_022EE2D0
