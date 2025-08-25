	.include "asm/macros.inc"
	.include "overlay_11_022ECD24.inc"

	.text
    
.public LoadMapType10

	arm_func_start LoadMapType11
LoadMapType11: ; 0x022ED244
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	mov r4, r1
	mvn r1, #0
	mov r7, r2
	cmp r4, r1
	ldrneb r1, [r7]
	mov sl, r0
	mov r6, r3
	cmpne r1, #0xff
	bne _022ED27C
	mov r0, sl
	bl ov11_022EC08C
	b _022ED680
_022ED27C:
	bl ov11_022EBFC8
	mov r1, #2
	strh r1, [sl]
	mov r2, #0
	add r0, sl, #0xea
	strb r2, [sl, #0x1c0]
	add r1, sl, #0x100
	strh r4, [r1, #0xbe]
	strh r2, [r1, #0xea]
	add r0, r0, #0x100
	strh r2, [r0, #2]
	strh r2, [r1, #0xc8]
	add r4, sl, #0x1c8
	strh r2, [r4, #0xa]
	strb r2, [sl, #0x1e0]
	add r5, sl, #0x1e0
	strb r2, [r5, #1]
	strb r2, [r5, #2]
	strb r2, [r5, #3]
	strh r2, [r5, #4]
	strh r2, [r5, #6]
	strh r2, [r5, #8]
	str r2, [sl, #0x1f0]
	str r7, [sp]
	ldr r0, [sl, #0x2d8]
	add r2, sp, #0x28
	add r3, sp, #0x24
	mov r1, #0x40
	bl ov10_022C3E8C
	ldr r0, [sp, #0x28]
	mov r3, #0x40
	strb r0, [r5, #2]
	ldr r1, [sp, #0x24]
	add r0, sp, #0x2c
	strb r1, [r5, #3]
	ldr r2, [sp, #0x28]
	add r1, sl, #0x194
	add r2, r2, r2, lsl #1
	strb r2, [sl, #0x1e0]
	ldr r8, [sp, #0x24]
	ldr r2, _022ED688 ; =0x06018000
	add r8, r8, r8, lsl #1
	strb r8, [r5, #1]
	ldr r8, [sl, #0x2e4]
	str r8, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r3, [r5, #3]
	str r3, [sp, #0x10]
	ldr r3, [sl, #0x2d8]
	str r3, [sp, #0x14]
	ldr r3, [sl, #0x2dc]
	bl ov10_022C3938
	ldr r3, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r2, r5
	str r3, [sl, #0x17c]
	str r0, [sl, #0x180]
	ldr r3, [sp, #0x34]
	add r0, sl, #0x200
	str r3, [sl, #0x1b8]
	ldrsh r3, [r0, #0xce]
	ldr r0, [sl, #0x2d8]
	ldr r5, [sl, #0x2d4]
	mov r1, #0
	blx r5
	mov r1, #0x200
	add r0, sl, #0x100
	strh r1, [r0, #0xc8]
	mov r1, #0
	mov r7, r1
_022ED39C:
	add r0, r4, r1, lsl #1
	add r1, r1, #1
	strh r7, [r0, #2]
	cmp r1, #4
	blt _022ED39C
	mov r0, #0x190
	strh r0, [r4, #0xa]
	add r0, sl, #0x100
	mov r1, #0xc
	strh r1, [r0, #0xea]
	strh r7, [r0, #0xec]
	ldr r6, [sl, #0x1b8]
	cmp r6, #0
	beq _022ED544
	ldr r0, _022ED68C ; =ov11_02324CBC
	ldrb r1, [sl, #0x2bc]
	ldr r5, [r0]
	mov r0, #0x28
	smulbb r4, r1, r0
	ldr r3, _022ED690 ; =ov11_02320BEC
	add r2, sp, #0x18
	mov r8, r7
	add r5, r5, #0x98
	mov r1, #4
_022ED3FC:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED3FC
	b _022ED4C0
_022ED410:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED694 ; =ov11_02320BF4
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add r6, r6, #4
	mov sb, #1
	add fp, sp, #0x20
_022ED438:
	add r3, sp, #0x18
	add r2, sp, #0x1c
	mov r1, #4
_022ED444:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED444
	ldrb r0, [r6]
	add r3, sp, #0x1c
	add r2, sp, #0x20
	strb r0, [sp, #0x1c]
	ldrb r0, [r6, #1]
	mov r1, #4
	strb r0, [sp, #0x1d]
	ldrb r0, [r6, #2]
	strb r0, [sp, #0x1e]
	ldrb r0, [r6, #3]
	strb r0, [sp, #0x1f]
_022ED480:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED480
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	add r6, r6, #4
	blt _022ED438
	add r8, r8, #1
_022ED4C0:
	cmp r8, #0xc
	bge _022ED4D8
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ED410
_022ED4D8:
	add r6, sl, #0x200
	ldr fp, _022ED694 ; =ov11_02320BF4
	b _022ED530
_022ED4E4:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	mov sb, #1
_022ED504:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED698 ; =ov11_02320BE8
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	blt _022ED504
	add r8, r8, #1
_022ED530:
	ldrsh r0, [r6, #0xc4]
	cmp r8, r0
	blt _022ED4E4
	add r0, r5, r4
	bl sub_0200A504
_022ED544:
	mov r1, #0
	strb r1, [sl, #0x1ee]
	ldr r0, _022ED68C ; =ov11_02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov r0, #0x28
	strb r1, [sl, #0x1bc]
	ldr r1, [sl, #0x19c]
	add r4, sl, #4
	cmp r1, #0
	add r3, r3, #0x98
	smulbb r1, r2, r0
	beq _022ED5A0
	add r0, sl, #0x1a0
	add r1, r3, r1
	mov r2, #0x20
	bl sub_02063628
	ldr r1, [sl, #0x19c]
	add r0, sl, #0x1a0
	mov r2, #0x20
	bl sub_02063734
	mov r0, #1
	strb r0, [sl, #0x1bc]
_022ED5A0:
	mov r0, #0
	str r0, [sl, #0x1f4]
	strb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	strb r0, [sl, #0x1fa]
	strb r0, [sl, #0x1fb]
	mov r5, r0
_022ED5BC:
	strh r5, [r4]
	strh r5, [r4, #2]
	add r0, r0, #1
	str r5, [r4, #8]
	str r5, [r4, #4]
	cmp r0, #0x10
	add r4, r4, #0xc
	blt _022ED5BC
	add r3, sl, #0xc4
	mov r1, #0
	mov r0, #0x2c
_022ED5E8:
	mul r2, r5, r0
	strb r1, [r3, r2]
	add r2, r3, r2
	strb r1, [r2, #1]
	strh r1, [r2, #4]
	strh r1, [r2, #2]
	str r1, [r2, #0x10]
	str r1, [r2, #0x18]
	str r1, [r2, #0x14]
	str r1, [r2, #0x20]
	str r1, [r2, #0x1c]
	add r5, r5, #1
	str r1, [r2, #0x24]
	str r1, [r2, #0x28]
	cmp r5, #4
	blt _022ED5E8
	add r2, sl, #0x200
	mov r1, #1
	mov r0, sl
	strh r1, [r2, #0xb8]
	bl ov11_022EE620
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r1, #1
	add r0, sl, #0x184
	strb r1, [sl, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ED668
	add r0, sl, #0x184
	bl UnloadFile
_022ED668:
	add r0, sl, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ED680
	add r0, sl, #0x18c
	bl UnloadFile
_022ED680:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ED688: .word 0x06018000
_022ED68C: .word ov11_02324CBC
_022ED690: .word ov11_02320BEC
_022ED694: .word ov11_02320BF4
_022ED698: .word ov11_02320BE8
	arm_func_end LoadMapType11

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
	bl ov11_022EBFC8
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
	bl ov11_022EE2D4
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
	bl ov11_022EBC18
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
	bl ov11_022EBC18
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
	bl ov11_022EBC18
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

	arm_func_start ov11_022EE2D4
ov11_022EE2D4: ; 0x022EE2D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r5, #0
	b _022EE5C8
_022EE2E4:
	sub r4, r4, r5
	add r4, r0, r4, lsl #2
	ldr sl, [r4, #-4]
	mov r7, #0
	b _022EE588
_022EE2F8:
	cmp r7, #0
	mov r6, #0
	bne _022EE410
	b _022EE400
_022EE308:
	ldrb sb, [r1], #1
	cmp sb, #0xc0
	blt _022EE368
	mov r8, #0xc0
	b _022EE354
_022EE31C:
	ldrb lr, [r1]
	ldrb ip, [r1, #1]
	ldrb r4, [r1, #2]
	add r1, r1, #3
	orr ip, lr, ip, lsl #8
	orr r4, ip, r4, lsl #16
	ldr ip, _022EE5E0 ; =0x00000FFF
	add r8, r8, #1
	and ip, r4, ip
	strh ip, [sl]
	ldr ip, _022EE5E0 ; =0x00000FFF
	and r4, ip, r4, asr #12
	strh r4, [sl, #2]
	add sl, sl, #4
_022EE354:
	cmp r8, sb
	ble _022EE31C
	sub r4, sb, #0xbf
	add r6, r6, r4, lsl #1
	b _022EE400
_022EE368:
	cmp sb, #0x80
	blt _022EE3D4
	ldrb ip, [r1]
	ldrb fp, [r1, #1]
	ldrb r8, [r1, #2]
	add r1, r1, #3
	orr fp, ip, fp, lsl #8
	orr fp, fp, r8, lsl #16
	ldr r8, _022EE5E0 ; =0x00000FFF
	ldr ip, _022EE5E0 ; =0x00000FFF
	and r8, fp, r8
	and fp, ip, fp, asr #12
	mov r8, r8, lsl #0x10
	mov fp, fp, lsl #0x10
	mov r4, #0x80
	mov r8, r8, lsr #0x10
	mov fp, fp, lsr #0x10
	b _022EE3C0
_022EE3B0:
	strh r8, [sl]
	strh fp, [sl, #2]
	add sl, sl, #4
	add r4, r4, #1
_022EE3C0:
	cmp r4, sb
	ble _022EE3B0
	sub r4, sb, #0x7f
	add r6, r6, r4, lsl #1
	b _022EE400
_022EE3D4:
	mov fp, #0
	b _022EE3F0
_022EE3DC:
	mov r4, #0
	strh r4, [sl]
	strh r4, [sl, #2]
	add sl, sl, #4
	add fp, fp, #1
_022EE3F0:
	cmp fp, sb
	ble _022EE3DC
	add r4, sb, #1
	add r6, r6, r4, lsl #1
_022EE400:
	ldrb r4, [r3, #2]
	cmp r6, r4
	blt _022EE308
	b _022EE57C
_022EE410:
	sub sb, sl, #0x80
	b _022EE560
_022EE418:
	ldrb fp, [r1], #1
	cmp fp, #0xc0
	blt _022EE49C
	mov ip, #0xc0
	b _022EE488
_022EE42C:
	ldrb r8, [r1, #1]
	ldrb lr, [r1]
	ldrb r4, [r1, #2]
	str r8, [sp, #0xc]
	ldrh r8, [sb]
	add r1, r1, #3
	add ip, ip, #1
	str r8, [sp, #4]
	ldr r8, [sp, #0xc]
	orr r8, lr, r8, lsl #8
	orr lr, r8, r4, lsl #16
	ldr r4, _022EE5E0 ; =0x00000FFF
	and r8, lr, r4
	ldr r4, [sp, #4]
	eor r4, r4, r8
	strh r4, [sl]
	ldr r4, _022EE5E0 ; =0x00000FFF
	and lr, r4, lr, asr #12
	ldrh r4, [sb, #2]
	add sb, sb, #4
	eor r4, r4, lr
	strh r4, [sl, #2]
	add sl, sl, #4
_022EE488:
	cmp ip, fp
	ble _022EE42C
	sub r4, fp, #0xbf
	add r6, r6, r4, lsl #1
	b _022EE560
_022EE49C:
	cmp fp, #0x80
	blt _022EE524
	ldrb r4, [r1]
	ldrb lr, [r1, #1]
	ldrb r8, [r1, #2]
	add r1, r1, #3
	orr r4, r4, lr, lsl #8
	orr r4, r4, r8, lsl #16
	ldr r8, _022EE5E0 ; =0x00000FFF
	mov ip, #0x80
	and r8, r4, r8
	str r8, [sp]
	ldr r8, _022EE5E0 ; =0x00000FFF
	and r4, r8, r4, asr #12
	str r4, [sp, #8]
	b _022EE510
_022EE4DC:
	ldrh r8, [sb]
	ldr r4, [sp]
	add lr, sb, #2
	eor r4, r8, r4
	strh r4, [sl]
	ldrh lr, [lr]
	ldr r4, [sp, #8]
	add r8, sl, #2
	eor r4, lr, r4
	add sb, sb, #4
	add sl, sl, #4
	strh r4, [r8]
	add ip, ip, #1
_022EE510:
	cmp ip, fp
	ble _022EE4DC
	sub r4, fp, #0x7f
	add r6, r6, r4, lsl #1
	b _022EE560
_022EE524:
	mov r4, #0
	b _022EE550
_022EE52C:
	ldrh ip, [sb]
	add r8, sb, #2
	add sb, sb, #4
	strh ip, [sl]
	ldrh r8, [r8]
	add ip, sl, #2
	add sl, sl, #4
	strh r8, [ip]
	add r4, r4, #1
_022EE550:
	cmp r4, fp
	ble _022EE52C
	add r4, fp, #1
	add r6, r6, r4, lsl #1
_022EE560:
	ldrb r4, [r3, #2]
	cmp r6, r4
	blt _022EE418
	b _022EE57C
_022EE570:
	mov r4, #0
	strh r4, [sl], #2
	add r6, r6, #1
_022EE57C:
	cmp r6, #0x40
	blt _022EE570
	add r7, r7, #1
_022EE588:
	ldrb r4, [r3, #3]
	cmp r7, r4
	blt _022EE2F8
	mov r6, #0
	mov r8, r6
	b _022EE5B8
_022EE5A0:
	mov r4, r8
_022EE5A4:
	add r4, r4, #1
	cmp r4, #0x40
	strh r6, [sl], #2
	blt _022EE5A4
	add r7, r7, #1
_022EE5B8:
	ldrsh r4, [r2, #0x14]
	cmp r7, r4
	blt _022EE5A0
	add r5, r5, #1
_022EE5C8:
	ldrsh r4, [r2, #4]
	cmp r5, r4
	blt _022EE2E4
	mov r0, r1
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE5E0: .word 0x00000FFF
	arm_func_end ov11_022EE2D4

	arm_func_start ov11_022EE5E4
ov11_022EE5E4: ; 0x022EE5E4
	strb r1, [r0, #0x1ee]
	bx lr
	arm_func_end ov11_022EE5E4

	arm_func_start ov11_022EE5EC
ov11_022EE5EC: ; 0x022EE5EC
	ldr r3, [r0, #0x1f4]
	cmp r3, #0
	strneb r1, [r0, #0x1f8]
	strneb r2, [r0, #0x1f9]
	strneb r2, [r0, #0x1fa]
	movne r1, #1
	strneb r1, [r0, #0x1fb]
	bx lr
	arm_func_end ov11_022EE5EC

	arm_func_start ov11_022EE60C
ov11_022EE60C: ; 0x022EE60C
	ldr r1, [r0, #0x1f4]
	cmp r1, #0
	ldrneb r0, [r0, #0x1fb]
	moveq r0, #0
	bx lr
	arm_func_end ov11_022EE60C

	arm_func_start ov11_022EE620
ov11_022EE620: ; 0x022EE620
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mov r5, r1
	cmp r5, #6
	add sb, r4, #0x210
	addls pc, pc, r5, lsl #2
	b _022EE688
_022EE640: ; jump table
	b _022EE65C ; case 0
	b _022EE688 ; case 1
	b _022EE688 ; case 2
	b _022EE6C4 ; case 3
	b _022EE6F4 ; case 4
	b _022EE6F4 ; case 5
	b _022EE6F4 ; case 6
_022EE65C:
	mov r2, #0
	str r2, [r4, #0x1fc]
	str r2, [sp]
	mov r0, sb
	mov r1, r4
	mov r3, r2
	str r2, [sp, #4]
	bl ov11_022EE8CC
	ldr r0, _022EE8AC ; =ov11_022EEA60
	str r0, [sb, #0x18]
	b _022EE760
_022EE688:
	mov r7, #1
	str r7, [r4, #0x1fc]
	add r0, r4, #0x200
	ldrsh r6, [r0, #0xc0]
	cmp r5, #2
	mov r2, #0
	movne r7, #0
	str r6, [sp]
	and r6, r7, #0xff
	mov r0, sb
	mov r1, r4
	mov r3, r2
	str r6, [sp, #4]
	bl ov11_022EE8CC
	b _022EE760
_022EE6C4:
	mov r0, #1
	str r0, [r4, #0x1fc]
	add r0, r4, #0x200
	ldrsh r1, [r0, #0xc0]
	mov r2, #0
	mov r0, sb
	str r1, [sp]
	mov r1, r4
	mov r3, r2
	str r2, [sp, #4]
	bl ov11_022EE8CC
	b _022EE760
_022EE6F4:
	mov r0, #2
	cmp r5, #6
	moveq r3, #1
	str r0, [r4, #0x1fc]
	movne r3, #0
	mov r2, #1
	and r6, r3, #0xff
	str r2, [sp]
	mov r0, sb
	mov r1, r4
	mov r3, #0
	str r6, [sp, #4]
	bl ov11_022EE8CC
	add r0, r4, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r5, #4
	movne r2, #1
	moveq r2, #0
	sub r0, r0, #1
	and r6, r2, #0xff
	str r0, [sp]
	mov r1, r4
	add r0, sb, #0x54
	mov r2, #0
	mov r3, #1
	str r6, [sp, #4]
	bl ov11_022EE8CC
_022EE760:
	cmp r5, #3
	bne _022EE780
	ldr r2, _022EE8B0 ; =ov11_022EEA64
	mov r0, sb
	add r1, r4, #0x200
	str r2, [sb, #0x18]
	bl ov11_022EE9B0
	b _022EE84C
_022EE780:
	ldr r0, _022EE8B4 ; =ov11_02320BE4
	mov sl, #0
	ldr r8, [r0, #0x24]
	ldr r7, [r0, #0x28]
	str r8, [sp, #8]
	str r7, [sp, #0xc]
	add r5, r4, #0x200
	ldr fp, _022EE8B8 ; =ov11_022EEA84
	ldr r6, _022EE8B0 ; =ov11_022EEA64
	b _022EE840
_022EE7A8:
	mov r0, #0x54
	mla r0, sl, r0, sb
	add r1, r4, sl, lsl #3
	str r8, [r1, #0x200]
	str r7, [r1, #0x204]
	ldrsh r1, [r0, #4]
	cmp r1, #1
	beq _022EE7D0
	cmp r1, #2
	beq _022EE804
_022EE7D0:
	ldrsh r1, [r0]
	cmp r1, #0
	beq _022EE7E4
	cmp r1, #1
	beq _022EE7EC
_022EE7E4:
	str r6, [r0, #0x18]
	b _022EE834
_022EE7EC:
	ldrb r1, [r0, #6]
	cmp r1, #0
	ldrne r1, _022EE8BC ; =ov11_022EEBF8
	ldreq r1, _022EE8C0 ; =ov11_022EEAAC
	str r1, [r0, #0x18]
	b _022EE834
_022EE804:
	ldrsh r1, [r0]
	cmp r1, #0
	beq _022EE818
	cmp r1, #1
	beq _022EE820
_022EE818:
	str fp, [r0, #0x18]
	b _022EE834
_022EE820:
	ldrb r1, [r0, #6]
	cmp r1, #0
	ldrne r1, _022EE8C4 ; =ov11_022EEFC0
	ldreq r1, _022EE8C8 ; =ov11_022EED98
	str r1, [r0, #0x18]
_022EE834:
	add r1, r5, sl, lsl #3
	bl ov11_022EE9B0
	add sl, sl, #1
_022EE840:
	ldr r0, [r4, #0x1fc]
	cmp sl, r0
	blt _022EE7A8
_022EE84C:
	ldr r0, _022EE8B4 ; =ov11_02320BE4
	ldr r7, [r4, #0x1fc]
	ldr r6, [r0, #0x24]
	ldr r5, [r0, #0x28]
	str r6, [sp, #0x10]
	str r5, [sp, #0x14]
	mov sl, #0
	mov r8, #0x54
	b _022EE89C
_022EE870:
	mla r0, r7, r8, sb
	add r1, r4, r7, lsl #3
	str r6, [r1, #0x200]
	str r5, [r1, #0x204]
	str sl, [sp]
	mov r1, r4
	mov r2, sl
	mov r3, sl
	str sl, [sp, #4]
	bl ov11_022EE8CC
	add r7, r7, #1
_022EE89C:
	cmp r7, #2
	blt _022EE870
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE8AC: .word ov11_022EEA60
_022EE8B0: .word ov11_022EEA64
_022EE8B4: .word ov11_02320BE4
_022EE8B8: .word ov11_022EEA84
_022EE8BC: .word ov11_022EEBF8
_022EE8C0: .word ov11_022EEAAC
_022EE8C4: .word ov11_022EEFC0
_022EE8C8: .word ov11_022EED98
	arm_func_end ov11_022EE620

	arm_func_start ov11_022EE8CC
ov11_022EE8CC: ; 0x022EE8CC
	stmdb sp!, {r4, r5, r6, lr}
	add r2, r1, #0x200
	ldrsh r2, [r2, #0xb8]
	ldrb r4, [sp, #0x14]
	ldr ip, [sp, #0x10]
	strh r2, [r0]
	strh r3, [r0, #2]
	strh ip, [r0, #4]
	strb r4, [r0, #6]
	ldrb r2, [r1, #0x1e2]
	cmp r4, #0
	str r2, [r0, #8]
	ldrb r2, [r1, #0x1e3]
	str r2, [r0, #0xc]
	ldrb r2, [r1, #0x1e0]
	movne r2, r2, lsl #3
	strne r2, [r0, #0x10]
	ldrneb r2, [r1, #0x1e1]
	movne r2, r2, lsl #3
	bne _022EE934
	mov r2, r2, lsl #3
	sub r2, r2, #0x100
	str r2, [r0, #0x10]
	ldrb r2, [r1, #0x1e1]
	mov r2, r2, lsl #3
	sub r2, r2, #0xc0
_022EE934:
	str r2, [r0, #0x14]
	mov r2, #0
	add lr, r1, #0x200
	b _022EE96C
_022EE944:
	add r6, r1, r3, lsl #2
	ldr r4, [r6, #0x2dc]
	add r5, r0, r2, lsl #2
	str r4, [r5, #0x1c]
	ldr r4, [r6, #0x2e4]
	add r2, r2, #1
	str r4, [r5, #0x24]
	ldr r4, [r6, #0x2ec]
	add r3, r3, #1
	str r4, [r5, #0x2c]
_022EE96C:
	cmp r2, ip
	bge _022EE980
	ldrsh r4, [lr, #0xc0]
	cmp r3, r4
	blt _022EE944
_022EE980:
	mov ip, #0
	b _022EE99C
_022EE988:
	add r3, r0, r2, lsl #2
	str ip, [r3, #0x1c]
	str ip, [r3, #0x24]
	str ip, [r3, #0x2c]
	add r2, r2, #1
_022EE99C:
	cmp r2, #2
	blt _022EE988
	add r1, r1, #0x200
	bl ov11_022EE9B0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022EE8CC

	arm_func_start ov11_022EE9B0
ov11_022EE9B0: ; 0x022EE9B0
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	mov r4, r0
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	str r2, [r4, #0x34]
	mov r0, r0, asr #3
	str r0, [r4, #0x3c]
	ldr r1, [r1, #4]
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	str r1, [r4, #0x38]
	mov r0, r0, asr #3
	str r0, [r4, #0x40]
	ldrsh r0, [r4]
	cmp r0, #0
	beq _022EEA00
	cmp r0, #1
	beq _022EEA18
	ldmia sp!, {r4, pc}
_022EEA00:
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldmia sp!, {r4, pc}
_022EEA18:
	ldr r0, [r4, #0x3c]
	mov r1, #3
	bl _s32_div_f
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl _s32_div_f
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x34]
	mov r1, #0x18
	bl _s32_div_f
	add r0, r1, #0x10
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x38]
	mov r1, #0x18
	bl _s32_div_f
	str r1, [r4, #0x50]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE9B0

	arm_func_start ov11_022EEA60
ov11_022EEA60: ; 0x022EEA60
	bx lr
	arm_func_end ov11_022EEA60

	arm_func_start ov11_022EEA64
ov11_022EEA64: ; 0x022EEA64
	ldr r2, [r0, #0x2c]
	mov r1, #0
	mov r0, r1
_022EEA70:
	add r1, r1, #1
	cmp r1, #0x800
	strh r0, [r2], #2
	blt _022EEA70
	bx lr
	arm_func_end ov11_022EEA64

	arm_func_start ov11_022EEA84
ov11_022EEA84: ; 0x022EEA84
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	mov r1, #0
	mov r0, r1
_022EEA94:
	strh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x800
	strh r0, [r3], #2
	blt _022EEA94
	bx lr
	arm_func_end ov11_022EEA84

	arm_func_start ov11_022EEAAC
ov11_022EEAAC: ; 0x022EEAAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r2, [r0, #0x44]
	ldr r1, [r0, #0x48]
	ldr r3, [r0, #0x24]
	add r1, r2, r1, lsl #6
	add ip, r3, r1, lsl #1
	mov lr, #2
	mov r5, #0
_022EEAD0:
	ldr r4, [r0, #0x2c]
	mov r7, ip
	mov r3, #0
	add r1, sp, #0
_022EEAE0:
	add r2, r4, lr, lsl #1
	str r2, [r1, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	add lr, lr, #0x20
	blt _022EEAE0
	mov r4, #0
	add r2, sp, #0
	mov r3, r4
_022EEB04:
	ldrh r1, [r7], #2
	ldr r6, [r0, #0x1c]
	mov r8, r3
	add r1, r1, r1, lsl #3
	add r6, r6, r1, lsl #1
_022EEB18:
	ldrh sb, [r6]
	ldr r1, [r2, r8, lsl #2]
	add sl, r6, #4
	strh sb, [r1]
	ldrh fp, [r6, #2]
	add sb, r1, #6
	add r6, r6, #6
	strh fp, [r1, #2]
	ldrh sl, [sl]
	strh sl, [r1, #4]
	str sb, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEB18
	add r4, r4, #1
	cmp r4, #0xa
	blt _022EEB04
	mov r3, #0
	add r2, sp, #0
_022EEB64:
	ldr r1, [r2, r3, lsl #2]
	add r1, r1, #0x7c0
	str r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blt _022EEB64
	add r2, sp, #0
	mov r3, #0
	b _022EEBD8
_022EEB88:
	ldrh r1, [r7], #2
	ldr r6, [r0, #0x1c]
	mov r8, r3
	add r1, r1, r1, lsl #3
	add r6, r6, r1, lsl #1
_022EEB9C:
	ldrh sb, [r6]
	ldr r1, [r2, r8, lsl #2]
	add sl, r6, #4
	strh sb, [r1]
	ldrh fp, [r6, #2]
	add sb, r1, #6
	add r6, r6, #6
	strh fp, [r1, #2]
	ldrh sl, [sl]
	strh sl, [r1, #4]
	str sb, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEB9C
	add r4, r4, #1
_022EEBD8:
	cmp r4, #0xc
	blt _022EEB88
	add r5, r5, #1
	cmp r5, #9
	add ip, ip, #0x80
	blt _022EEAD0
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEAAC

	arm_func_start ov11_022EEBF8
ov11_022EEBF8: ; 0x022EEBF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r6, [r0, #0x48]
	ldr r5, [r0, #0x44]
	ldr r2, [r0, #8]
	ldr r3, [r0, #0xc]
	sub r2, r2, r5
	str r2, [sp]
	ldr r4, [r0, #0x24]
	add r1, r5, r6, lsl #6
	add r1, r4, r1, lsl #1
	sub ip, r3, r6
	mov r2, #2
	mov fp, #0
_022EEC30:
	cmp ip, #0
	movgt r4, r1
	subgt ip, ip, #1
	ldrle r3, [r0, #0x44]
	ldrle r1, [r0, #0x24]
	ldr lr, [sp]
	addle r1, r1, r3, lsl #1
	ldrle ip, [r0, #0xc]
	ldr r7, [r0, #0x2c]
	movle r4, r1
	mov r6, #0
	add r3, sp, #4
_022EEC60:
	add r5, r7, r2, lsl #1
	str r5, [r3, r6, lsl #2]
	add r6, r6, #1
	cmp r6, #3
	add r2, r2, #0x20
	blt _022EEC60
	mov r3, #0
_022EEC7C:
	ldrh r5, [r4], #2
	ldr r6, [r0, #0x1c]
	mov sl, #0
	add r5, r5, r5, lsl #3
	add sb, r6, r5, lsl #1
_022EEC90:
	add r6, sp, #4
	ldr r8, [r6, sl, lsl #2]
	ldrh r5, [sb]
	add r6, sb, #4
	strh r5, [r8]
	ldrh r7, [sb, #2]
	add r5, r8, #6
	add sb, sb, #6
	strh r7, [r8, #2]
	ldrh r6, [r6]
	strh r6, [r8, #4]
	add r6, sp, #4
	str r5, [r6, sl, lsl #2]
	add sl, sl, #1
	cmp sl, #3
	blt _022EEC90
	sub lr, lr, #1
	cmp lr, #0
	ldrle lr, [r0, #8]
	add r3, r3, #1
	suble r4, r4, lr, lsl #1
	cmp r3, #0xa
	blt _022EEC7C
	mov r7, #0
	add r6, sp, #4
_022EECF4:
	ldr r5, [r6, r7, lsl #2]
	add r5, r5, #0x7c0
	str r5, [r6, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EECF4
	b _022EED78
_022EED10:
	ldrh r5, [r4], #2
	ldr r6, [r0, #0x1c]
	mov sl, #0
	add r5, r5, r5, lsl #3
	add sb, r6, r5, lsl #1
_022EED24:
	add r6, sp, #4
	ldr r8, [r6, sl, lsl #2]
	ldrh r5, [sb]
	add r6, sb, #4
	strh r5, [r8]
	ldrh r7, [sb, #2]
	add r5, r8, #6
	add sb, sb, #6
	strh r7, [r8, #2]
	ldrh r6, [r6]
	strh r6, [r8, #4]
	add r6, sp, #4
	str r5, [r6, sl, lsl #2]
	add sl, sl, #1
	cmp sl, #3
	blt _022EED24
	sub lr, lr, #1
	cmp lr, #0
	ldrle lr, [r0, #8]
	add r3, r3, #1
	suble r4, r4, lr, lsl #1
_022EED78:
	cmp r3, #0xc
	blt _022EED10
	add fp, fp, #1
	cmp fp, #9
	add r1, r1, #0x80
	blt _022EEC30
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEBF8

	arm_func_start ov11_022EED98
ov11_022EED98: ; 0x022EED98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r3, [r0, #0x44]
	ldr r2, [r0, #0x48]
	ldr r1, [r0, #0x24]
	add r3, r3, r2, lsl #6
	add r1, r1, r3, lsl #1
	ldr r2, [r0, #0x28]
	str r1, [sp, #8]
	add r1, r2, r3, lsl #1
	str r1, [sp, #4]
	mov r1, #0
	mov r3, #2
	str r1, [sp]
_022EEDD0:
	ldr sb, [r0, #0x2c]
	ldr sl, [r0, #0x30]
	ldr r5, [sp, #8]
	ldr r6, [sp, #4]
	mov r8, #0
	add r4, sp, #0x18
	add r1, sp, #0xc
_022EEDEC:
	add r7, sb, r3, lsl #1
	add r2, sl, r3, lsl #1
	str r7, [r4, r8, lsl #2]
	str r2, [r1, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	add r3, r3, #0x20
	blt _022EEDEC
	mov ip, #0
_022EEE10:
	ldrh r2, [r5], #2
	ldrh r1, [r6], #2
	ldr r4, [r0, #0x1c]
	add r2, r2, r2, lsl #3
	add lr, r4, r2, lsl #1
	ldr r2, [r0, #0x20]
	add r1, r1, r1, lsl #3
	add r4, r2, r1, lsl #1
	mov r7, #0
_022EEE34:
	add r1, sp, #0x18
	ldr r2, [r1, r7, lsl #2]
	add r1, sp, #0xc
	ldrh sl, [lr]
	ldr r1, [r1, r7, lsl #2]
	add r8, lr, #4
	strh sl, [r2]
	ldrh sl, [lr, #2]
	add fp, r2, #6
	add sb, r4, #4
	strh sl, [r2, #2]
	ldrh sl, [r8]
	add r8, r1, #6
	add lr, lr, #6
	strh sl, [r2, #4]
	ldrh r2, [r4]
	strh r2, [r1]
	ldrh r2, [r4, #2]
	add r4, r4, #6
	strh r2, [r1, #2]
	ldrh r2, [sb]
	strh r2, [r1, #4]
	add r1, sp, #0x18
	str fp, [r1, r7, lsl #2]
	add r1, sp, #0xc
	str r8, [r1, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EEE34
	add ip, ip, #1
	cmp ip, #0xa
	blt _022EEE10
	mov r8, #0
	add r7, sp, #0x18
	mov r2, r1
_022EEEC0:
	ldr r4, [r7, r8, lsl #2]
	ldr r1, [r2, r8, lsl #2]
	add r4, r4, #0x7c0
	add r1, r1, #0x7c0
	str r4, [r7, r8, lsl #2]
	str r1, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEEC0
	b _022EEF84
_022EEEE8:
	ldrh r2, [r5], #2
	ldrh r1, [r6], #2
	ldr r4, [r0, #0x1c]
	add r2, r2, r2, lsl #3
	add r4, r4, r2, lsl #1
	ldr r2, [r0, #0x20]
	add r1, r1, r1, lsl #3
	add r7, r2, r1, lsl #1
	mov r8, #0
_022EEF0C:
	add r1, sp, #0x18
	ldr r2, [r1, r8, lsl #2]
	add r1, sp, #0xc
	ldrh fp, [r4]
	ldr r1, [r1, r8, lsl #2]
	add sb, r4, #4
	strh fp, [r2]
	ldrh fp, [r4, #2]
	add lr, r2, #6
	add sl, r7, #4
	strh fp, [r2, #2]
	ldrh fp, [sb]
	add sb, r1, #6
	add r4, r4, #6
	strh fp, [r2, #4]
	ldrh r2, [r7]
	strh r2, [r1]
	ldrh r2, [r7, #2]
	add r7, r7, #6
	strh r2, [r1, #2]
	ldrh r2, [sl]
	strh r2, [r1, #4]
	add r1, sp, #0x18
	str lr, [r1, r8, lsl #2]
	add r1, sp, #0xc
	str sb, [r1, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEF0C
	add ip, ip, #1
_022EEF84:
	cmp ip, #0xc
	blt _022EEEE8
	ldr r1, [sp]
	add r1, r1, #1
	str r1, [sp]
	cmp r1, #9
	ldr r1, [sp, #8]
	add r1, r1, #0x80
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0x80
	str r1, [sp, #4]
	blt _022EEDD0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EED98

	arm_func_start ov11_022EEFC0
ov11_022EEFC0: ; 0x022EEFC0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r7, [r0, #0x48]
	ldr r6, [r0, #0x44]
	ldr r1, [r0, #0x28]
	add r5, r6, r7, lsl #6
	add r1, r1, r5, lsl #1
	ldr r4, [r0, #0x24]
	ldr r2, [r0, #8]
	str r1, [sp, #8]
	sub r1, r2, r6
	str r1, [sp]
	mov r1, #0
	ldr r3, [r0, #0xc]
	add fp, r4, r5, lsl #1
	sub r5, r3, r7
	mov lr, #2
	str r1, [sp, #4]
_022EF008:
	cmp r5, #0
	ldr r6, [sp]
	movgt r1, fp
	ldrgt r2, [sp, #8]
	subgt r5, r5, #1
	bgt _022EF044
	ldr r3, [r0, #0x44]
	ldr r1, [r0, #0x24]
	ldr r2, [r0, #0x28]
	add r1, r1, r3, lsl #1
	str r1, [sp, #8]
	add fp, r2, r3, lsl #1
	ldr r5, [r0, #0xc]
	ldr r2, [sp, #8]
	mov r1, fp
_022EF044:
	ldr r4, [r0, #0x2c]
	ldr r7, [r0, #0x30]
	mov r3, #0
	add sl, sp, #0x50
	add r8, sp, #0x44
_022EF058:
	add sb, r4, lr, lsl #1
	str sb, [sl, r3, lsl #2]
	add sb, r7, lr, lsl #1
	str sb, [r8, r3, lsl #2]
	add lr, lr, #0x20
	add r3, r3, #1
	cmp r3, #3
	blt _022EF058
	mov r4, #0
_022EF07C:
	ldrh r7, [r1], #2
	ldrh r3, [r2], #2
	ldr sb, [r0, #0x1c]
	add r7, r7, r7, lsl #3
	add r7, sb, r7, lsl #1
	ldr r8, [r0, #0x20]
	add r3, r3, r3, lsl #3
	add r8, r8, r3, lsl #1
	mov sb, #0
_022EF0A0:
	ldrh sl, [r7]
	add r3, sp, #0x50
	ldr ip, [r3, sb, lsl #2]
	str sl, [sp, #0x2c]
	add sl, r7, #4
	add r3, sp, #0x44
	str sl, [sp, #0xc]
	add sl, r8, #4
	str sl, [sp, #0x10]
	ldr r3, [r3, sb, lsl #2]
	ldr sl, [sp, #0x2c]
	strh sl, [ip]
	ldrh sl, [r7, #2]
	add r7, r7, #6
	str sl, [sp, #0x30]
	add sl, ip, #6
	str sl, [sp, #0x14]
	ldr sl, [sp, #0x30]
	strh sl, [ip, #2]
	ldr sl, [sp, #0xc]
	ldrh sl, [sl]
	str sl, [sp, #0x34]
	add sl, r3, #6
	str sl, [sp, #0x18]
	ldr sl, [sp, #0x34]
	strh sl, [ip, #4]
	ldrh sl, [r8]
	strh sl, [r3]
	ldrh sl, [r8, #2]
	add r8, r8, #6
	strh sl, [r3, #2]
	ldr sl, [sp, #0x10]
	ldrh sl, [sl]
	strh sl, [r3, #4]
	ldr sl, [sp, #0x14]
	add r3, sp, #0x50
	str sl, [r3, sb, lsl #2]
	ldr sl, [sp, #0x18]
	add r3, sp, #0x44
	str sl, [r3, sb, lsl #2]
	add sb, sb, #1
	cmp sb, #3
	blt _022EF0A0
	sub r6, r6, #1
	cmp r6, #0
	ldrle r6, [r0, #8]
	add r4, r4, #1
	suble r1, r1, r6, lsl #1
	suble r2, r2, r6, lsl #1
	cmp r4, #0xa
	blt _022EF07C
	mov r7, #0
	add r3, sp, #0x50
	add sb, sp, #0x44
_022EF178:
	ldr sl, [r3, r7, lsl #2]
	ldr r8, [sb, r7, lsl #2]
	add sl, sl, #0x7c0
	str sl, [r3, r7, lsl #2]
	add r8, r8, #0x7c0
	str r8, [sb, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EF178
	b _022EF288
_022EF1A0:
	ldrh r7, [r1], #2
	ldrh r3, [r2], #2
	ldr sb, [r0, #0x1c]
	add r7, r7, r7, lsl #3
	add r7, sb, r7, lsl #1
	ldr r8, [r0, #0x20]
	add r3, r3, r3, lsl #3
	add r8, r8, r3, lsl #1
	mov sb, #0
_022EF1C4:
	ldrh sl, [r7]
	add r3, sp, #0x50
	ldr ip, [r3, sb, lsl #2]
	str sl, [sp, #0x38]
	add sl, r7, #4
	add r3, sp, #0x44
	str sl, [sp, #0x1c]
	add sl, r8, #4
	str sl, [sp, #0x20]
	ldr r3, [r3, sb, lsl #2]
	ldr sl, [sp, #0x38]
	strh sl, [ip]
	ldrh sl, [r7, #2]
	add r7, r7, #6
	str sl, [sp, #0x3c]
	add sl, ip, #6
	str sl, [sp, #0x24]
	ldr sl, [sp, #0x3c]
	strh sl, [ip, #2]
	ldr sl, [sp, #0x1c]
	ldrh sl, [sl]
	str sl, [sp, #0x40]
	add sl, r3, #6
	str sl, [sp, #0x28]
	ldr sl, [sp, #0x40]
	strh sl, [ip, #4]
	ldrh sl, [r8]
	strh sl, [r3]
	ldrh sl, [r8, #2]
	add r8, r8, #6
	strh sl, [r3, #2]
	ldr sl, [sp, #0x20]
	ldrh sl, [sl]
	strh sl, [r3, #4]
	ldr sl, [sp, #0x24]
	add r3, sp, #0x50
	str sl, [r3, sb, lsl #2]
	ldr sl, [sp, #0x28]
	add r3, sp, #0x44
	str sl, [r3, sb, lsl #2]
	add sb, sb, #1
	cmp sb, #3
	blt _022EF1C4
	sub r6, r6, #1
	cmp r6, #0
	ldrle r6, [r0, #8]
	add r4, r4, #1
	suble r1, r1, r6, lsl #1
	suble r2, r2, r6, lsl #1
_022EF288:
	cmp r4, #0xc
	blt _022EF1A0
	ldr r1, [sp, #4]
	add fp, fp, #0x80
	add r1, r1, #1
	str r1, [sp, #4]
	cmp r1, #9
	ldr r1, [sp, #8]
	add r1, r1, #0x80
	str r1, [sp, #8]
	blt _022EF008
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEFC0

	arm_func_start ov11_022EF2BC
ov11_022EF2BC: ; 0x022EF2BC
	add r0, r0, r1, lsl #3
	ldr r1, [r0, #0x200]
	ldr r0, [r0, #0x204]
	str r1, [r2]
	str r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF2BC

	arm_func_start ov11_022EF2D4
ov11_022EF2D4: ; 0x022EF2D4
	ldr r3, [r2]
	ldr r2, [r2, #4]
	add r0, r0, r1, lsl #3
	str r3, [r0, #0x200]
	str r2, [r0, #0x204]
	bx lr
	arm_func_end ov11_022EF2D4

	arm_func_start ov11_022EF2EC
ov11_022EF2EC: ; 0x022EF2EC
	add r3, r0, #0x210
	mov r0, #0x54
	ldr ip, [r2]
	mla r0, r1, r0, r3
	cmp ip, #0
	bge _022EF334
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF328
_022EF310:
	ldr r3, [r2]
	ldr r1, [r0, #0x10]
	adds r1, r3, r1
	str r1, [r2]
	bmi _022EF310
	b _022EF380
_022EF328:
	mov r1, #0
	str r1, [r2]
	b _022EF380
_022EF334:
	ldr r3, [r0, #0x10]
	cmp ip, r3
	blt _022EF380
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF36C
_022EF34C:
	ldr r3, [r2]
	ldr r1, [r0, #0x10]
	sub r3, r3, r1
	str r3, [r2]
	ldr r1, [r0, #0x10]
	cmp r3, r1
	bge _022EF34C
	b _022EF380
_022EF36C:
	cmp r3, #0
	subgt r1, r3, #1
	strgt r1, [r2]
	movle r1, #0
	strle r1, [r2]
_022EF380:
	ldr r1, [r2, #4]
	cmp r1, #0
	bge _022EF3BC
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF3B0
_022EF398:
	ldr r3, [r2, #4]
	ldr r1, [r0, #0x14]
	adds r1, r3, r1
	str r1, [r2, #4]
	bmi _022EF398
	bx lr
_022EF3B0:
	mov r0, #0
	str r0, [r2, #4]
	bx lr
_022EF3BC:
	ldr r3, [r0, #0x14]
	cmp r1, r3
	bxlt lr
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF3F4
_022EF3D4:
	ldr r3, [r2, #4]
	ldr r1, [r0, #0x14]
	sub r3, r3, r1
	str r3, [r2, #4]
	ldr r1, [r0, #0x14]
	cmp r3, r1
	bge _022EF3D4
	bx lr
_022EF3F4:
	cmp r3, #0
	subgt r0, r3, #1
	strgt r0, [r2, #4]
	movle r0, #0
	strle r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF2EC

	arm_func_start ov11_022EF40C
ov11_022EF40C: ; 0x022EF40C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, #0
	add r5, sp, #0
	mov r4, #1
	b _022EF484
_022EF430:
	add r0, r8, r6, lsl #3
	ldr r3, [r0, #0x200]
	ldr ip, [r0, #0x204]
	mov r0, sb
	str r3, [sp]
	str ip, [sp, #4]
	ldr r2, [r7]
	mov r1, r4
	add r2, r3, r2
	str r2, [sp]
	ldr r3, [r7, #4]
	mov r2, r5
	add r3, ip, r3
	str r3, [sp, #4]
	bl ov11_022EF2EC
	add r2, sb, r6, lsl #3
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r6, r6, #1
	str r1, [r2, #0x200]
	str r0, [r2, #0x204]
_022EF484:
	ldr r0, [sb, #0x1fc]
	cmp r6, r0
	blt _022EF430
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov11_022EF40C

	arm_func_start ov11_022EF498
ov11_022EF498: ; 0x022EF498
	mov r3, #0
	str r3, [r1]
	str r3, [r1, #4]
	ldrb r1, [r0, #0x1e0]
	mov r1, r1, lsl #0xb
	str r1, [r2]
	ldrb r0, [r0, #0x1e1]
	mov r0, r0, lsl #0xb
	str r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF498

	arm_func_start ov11_022EF4C0
ov11_022EF4C0: ; 0x022EF4C0
	stmdb sp!, {r4, lr}
	ldr lr, [r0, #0x2d8]
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr ip, [r2]
	ldr r0, [r2, #4]
	ldr r4, [r3, #4]
	add r0, ip, r0, lsl #8
	add r0, r0, #5
	add r0, r0, #0x400
	add r2, lr, r0
	b _022EF52C
_022EF4F4:
	mov lr, r2
	ldr ip, [r3]
	b _022EF51C
_022EF500:
	ldrb r0, [lr], #1
	and r0, r0, r1
	and r0, r0, #0xff
	cmp r0, r1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	sub ip, ip, #1
_022EF51C:
	cmp ip, #0
	bgt _022EF500
	add r2, r2, #0x100
	sub r4, r4, #1
_022EF52C:
	cmp r4, #0
	bgt _022EF4F4
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EF4C0

	arm_func_start ov11_022EF53C
ov11_022EF53C: ; 0x022EF53C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r1, r4
	mov r0, #2
	bl sub_020091B0
	mov r1, r4
	mov r0, #3
	bl sub_020091B0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EF53C

	arm_func_start ov11_022EF594
ov11_022EF594: ; 0x022EF594
	stmdb sp!, {r3, lr}
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_022EF5A4: ; jump table
	b _022EF5F4 ; case 0
	b _022EF604 ; case 1
	b _022EF610 ; case 2
	b _022EF61C ; case 3
	b _022EF634 ; case 4
	b _022EF628 ; case 5
	b _022EF640 ; case 6
	b _022EF64C ; case 7
	b _022EF664 ; case 8
	b _022EF658 ; case 9
	b _022EF670 ; case 10
	b _022EF67C ; case 11
	b _022EF688 ; case 12
	b _022EF694 ; case 13
	b _022EF6A0 ; case 14
	b _022EF6AC ; case 15
	b _022EF6C0 ; case 16
	b _022EF6D4 ; case 17
	b _022EF6E4 ; case 18
	b _022EF6F0 ; case 19
_022EF5F4:
	mov r1, #3
	mov r2, #0
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF604:
	mov r1, #1
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF610:
	mov r1, #2
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF61C:
	mov r1, #3
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF628:
	mov r1, #3
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF634:
	mov r1, #4
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF640:
	mov r1, #4
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF64C:
	mov r1, #6
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF658:
	mov r1, #6
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF664:
	mov r1, #7
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF670:
	mov r1, #7
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF67C:
	mov r1, #5
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF688:
	mov r1, #5
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF694:
	mov r1, #8
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF6A0:
	mov r1, #8
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF6AC:
	mov r1, r2, lsl #0x10
	mov r2, r1, asr #0x10
	mov r1, #5
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
_022EF6C0:
	mov r1, r2, lsl #0x10
	mov r2, r1, asr #0x10
	mov r1, #8
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
_022EF6D4:
	mov r1, r2
	mov r0, #1
	bl ov11_022F2B00
	ldmia sp!, {r3, pc}
_022EF6E4:
	mov r1, #9
	bl ov11_022E9E74
	ldmia sp!, {r3, pc}
_022EF6F0:
	mov r1, #0xa
	mov r2, #0
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022EF594

	arm_func_start ov11_022EF700
ov11_022EF700: ; 0x022EF700
	ldr ip, _022EF708 ; =ov11_022E9FA4
	bx ip
	.align 2, 0
_022EF708: .word ov11_022E9FA4
	arm_func_end ov11_022EF700

	arm_func_start ov11_022EF70C
ov11_022EF70C: ; 0x022EF70C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sl, r0
	ldrsh r0, [sl]
	sub r0, r0, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	bhi _022EF800
	add r6, sl, #0x210
	mov r8, #0
	add r4, sl, #0x200
	ldr r5, _022EFB64 ; =ov11_02324CBC
	mov fp, #0x1c
	b _022EF7BC
_022EF750:
	ldr r1, _022EFB68 ; =ov11_02320C10
	mov r0, r6
	bl ov11_022EE9B0
	ldrsh r1, [r6, #2]
	ldrsh r0, [r4, #0xbe]
	mov sb, #0
	add r7, r1, r0
	b _022EF7A8
_022EF770:
	ldrb r0, [sl, #0x2bc]
	add r1, r6, #0x4c
	cmp r0, #0
	ldr r0, [r5]
	bne _022EF790
	mla r0, r7, fp, r0
	bl sub_0200B3C0
	b _022EF7A0
_022EF790:
	add r2, r0, #0x38
	mov r0, #0x1c
	mla r0, r7, r0, r2
	bl sub_0200B3C0
_022EF7A0:
	add sb, sb, #1
	add r7, r7, #1
_022EF7A8:
	ldrsh r0, [r6, #4]
	cmp sb, r0
	blt _022EF770
	add r8, r8, #1
	add r6, r6, #0x54
_022EF7BC:
	ldr r0, [sl, #0x1fc]
	cmp r8, r0
	blt _022EF750
	mov r0, #0
	strb r0, [sl, #0x1c1]
	ldrsh r0, [sl]
	cmp r0, #6
	ldreqb r0, [sl, #0x1c0]
	cmpeq r0, #0
	bne _022EF7F4
	bl sub_020163AC
	cmp r0, #1
	moveq r0, #1
	streqb r0, [sl, #0x1c1]
_022EF7F4:
	mov r0, #1
	strb r0, [sl, #0x2ba]
	b _022EFB5C
_022EF800:
	add fp, sl, #0x100
	ldrsh r1, [fp, #0xbe]
	mvn r0, #0
	cmp r1, r0
	beq _022EFB5C
	ldrsh r0, [fp, #0xec]
	cmp r0, #0
	beq _022EF9C4
	ldrb r0, [sl, #0x1ee]
	cmp r0, #0
	bne _022EF9C4
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc2]
	str r0, [sp, #0xc]
	ldr r0, _022EFB64 ; =ov11_02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov sb, #0
	mov r0, #0x28
	str sb, [sp, #8]
	smulbb r4, r2, r0
	mov r1, r1, lsl #0x14
	ldrb r0, [sl, #0x1f9]
	ldr r7, [sl, #0x1f4]
	add r5, r3, #0x98
	add r6, sl, #4
	mov r8, r1, lsr #0x10
	str r0, [sp, #4]
	b _022EF974
_022EF874:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _022EF95C
	ldrsh r0, [r6, #2]
	sub r0, r0, #1
	strh r0, [r6, #2]
	ldrsh r0, [r6, #2]
	cmp r0, #0
	bgt _022EF954
	ldrsh r0, [r6]
	sub r0, r0, #1
	strh r0, [r6]
	ldrsh r0, [r6]
	cmp r0, #0
	bgt _022EF8F4
	ldrb r0, [sl, #0x1f9]
	cmp r0, #0
	beq _022EF8D8
	ldrsh r0, [r7]
	strh r0, [r6, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r6]
	ldr r0, [r6, #4]
	str r0, [r6, #8]
	b _022EF904
_022EF8D8:
	mov r0, #0
	strh r0, [r6]
	mov r0, r0
	strh r0, [r6, #2]
	mov r0, #0
	str r0, [r6, #8]
	b _022EF904
_022EF8F4:
	ldrsh r1, [r7]
	mov r0, #1
	str r0, [sp, #4]
	strh r1, [r6, #2]
_022EF904:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _022EF95C
	mov r0, #1
	str r0, [sp, #8]
	ldr r2, _022EFB6C ; =ov11_02320BF4
	add r0, r5, r4
	mov r1, r8
	bl sub_0200A590
	add r1, r8, #1
	mov r1, r1, lsl #0x10
	ldr r2, [r6, #8]
	add r0, r5, r4
	mov r1, r1, lsr #0x10
	mov r3, #0xf
	bl sub_0200A5B0
	ldr r0, [r6, #8]
	add r0, r0, #0x3c
	str r0, [r6, #8]
	b _022EF95C
_022EF954:
	mov r0, #1
	str r0, [sp, #4]
_022EF95C:
	add sb, sb, #1
	add r6, r6, #0xc
	add r7, r7, #4
	add r0, r8, #0x10
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
_022EF974:
	ldrsh r0, [fp, #0xea]
	cmp sb, r0
	ldrlt r0, [sp, #0xc]
	ldrltsh r0, [r0, #0xc4]
	cmplt sb, r0
	blt _022EF874
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022EF9A0
	add r0, r5, r4
	bl sub_0200A504
_022EF9A0:
	ldrb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	ldrb r0, [sl, #0x1f8]
	cmp r0, #0
	movne r0, #0
	strneb r0, [sl, #0x1fb]
	ldreq r0, [sp, #4]
	streqb r0, [sl, #0x1fb]
	b _022EF9CC
_022EF9C4:
	mov r0, #0
	strb r0, [sl, #0x1fb]
_022EF9CC:
	ldrb r0, [sl, #0x1bc]
	cmp r0, #0
	beq _022EF9F0
	mov r1, #0
	add r0, sl, #0x1a0
	mov r2, #0xa0
	mov r3, #0x20
	str r1, [sp]
	bl sub_02063830
_022EF9F0:
	ldrb r0, [sl, #0x1ee]
	cmp r0, #0
	bne _022EFAA4
	mov r1, #0
	add r0, sl, #0xc4
	mov r6, r1
	mov r5, #1
	mov r3, #0x2c
_022EFA10:
	mul r2, r1, r3
	ldrb r4, [r0, r2]
	add r2, r0, r2
	cmp r4, #0
	beq _022EFA98
	ldrsh r7, [r2, #4]
	sub r4, r7, #1
	strh r4, [r2, #4]
	cmp r7, #0
	bgt _022EFA98
	ldr r4, [r2, #0x18]
	add r4, r4, #4
	str r4, [r2, #0x18]
	ldr r4, [r2, #0x28]
	ldr r7, [r2, #0x20]
	bic r4, r4, #1
	add r4, r7, r4
	str r4, [r2, #0x20]
	ldrsh r4, [r2, #2]
	add r4, r4, #1
	strh r4, [r2, #2]
	ldr r4, [r2, #0x10]
	ldrsh r7, [r2, #2]
	ldrsh r4, [r4, #2]
	cmp r7, r4
	ldrge r4, [r2, #0x14]
	strge r4, [r2, #0x18]
	ldrge r4, [r2, #0x1c]
	strge r4, [r2, #0x20]
	strgeh r6, [r2, #2]
	strb r5, [r2, #1]
	ldr r4, [r2, #0x18]
	ldr r4, [r4]
	strh r4, [r2, #4]
_022EFA98:
	add r1, r1, #1
	cmp r1, #4
	blt _022EFA10
_022EFAA4:
	ldrb r0, [sl, #0x1c0]
	cmp r0, #0
	bne _022EFB5C
	add r5, sl, #0x210
	add r6, sl, #0x200
	mov r8, #0
	b _022EFB48
_022EFAC0:
	mov r0, r5
	mov r1, r6
	bl ov11_022EE9B0
	ldr r1, [r5, #0x18]
	mov r0, r5
	blx r1
	add r0, sl, #0x200
	ldrsh r1, [r5, #2]
	ldrsh r0, [r0, #0xbe]
	mov sb, #0
	ldr r4, _022EFB64 ; =ov11_02324CBC
	add r7, r1, r0
	mov fp, #0x1c
	b _022EFB30
_022EFAF8:
	ldrb r0, [sl, #0x2bc]
	add r1, r5, #0x4c
	cmp r0, #0
	ldr r0, [r4]
	bne _022EFB18
	mla r0, r7, fp, r0
	bl sub_0200B3C0
	b _022EFB28
_022EFB18:
	add r2, r0, #0x38
	mov r0, #0x1c
	mla r0, r7, r0, r2
	bl sub_0200B3C0
_022EFB28:
	add sb, sb, #1
	add r7, r7, #1
_022EFB30:
	ldrsh r0, [r5, #4]
	cmp sb, r0
	blt _022EFAF8
	add r8, r8, #1
	add r5, r5, #0x54
	add r6, r6, #8
_022EFB48:
	ldr r0, [sl, #0x1fc]
	cmp r8, r0
	blt _022EFAC0
	mov r0, #1
	strb r0, [sl, #0x2ba]
_022EFB5C:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EFB64: .word ov11_02324CBC
_022EFB68: .word ov11_02320C10
_022EFB6C: .word ov11_02320BF4
	arm_func_end ov11_022EF70C

	arm_func_start ov11_022EFB70
ov11_022EFB70: ; 0x022EFB70
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	ldrsh r0, [r7]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #6
	beq _022EFBD4
	mov r5, #0
	add r4, r7, #0xc4
	mov sl, r5
	mov sb, #1
	mov r8, #0x2c
_022EFBA0:
	mla r6, r5, r8, r4
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _022EFBC8
	ldr r0, [r6, #0x24]
	ldr r1, [r6, #0x20]
	ldr r2, [r6, #0x28]
	bl Memcpy32
	strb sl, [r6, #1]
	strb sb, [r7, #0x2ba]
_022EFBC8:
	add r5, r5, #1
	cmp r5, #4
	blt _022EFBA0
_022EFBD4:
	ldrb r0, [r7, #0x2ba]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add sb, r7, #0x200
	ldrsh r0, [sb, #0xc0]
	ldrsh r4, [sb, #0xbe]
	mov r5, #0
	cmp r0, #0
	ble _022EFC44
	mov r6, #0x1c
	ldr sl, _022EFC50 ; =ov11_02324CBC
	mov r8, r6
	b _022EFC38
_022EFC08:
	ldrb r0, [r7, #0x2bc]
	cmp r0, #0
	ldr r0, [sl]
	bne _022EFC24
	mla r0, r4, r8, r0
	bl sub_0200B330
	b _022EFC30
_022EFC24:
	add r0, r0, #0x38
	mla r0, r4, r6, r0
	bl sub_0200B330
_022EFC30:
	add r5, r5, #1
	add r4, r4, #1
_022EFC38:
	ldrsh r0, [sb, #0xc0]
	cmp r5, r0
	blt _022EFC08
_022EFC44:
	mov r0, #0
	strb r0, [r7, #0x2ba]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022EFC50: .word ov11_02324CBC
	arm_func_end ov11_022EFB70

	arm_func_start ov11_022EFC54
ov11_022EFC54: ; 0x022EFC54
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov10_022BF864
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl sub_0200A510
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A180
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl sub_0200A510
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A180
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B33C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFCE0: .word ov11_02324CBC
	arm_func_end ov11_022EFC54

	arm_func_start ov11_022EFCE4
ov11_022EFCE4: ; 0x022EFCE4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A184
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A184
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	bl sub_0200B340
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B340
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B340
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B340
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFD58: .word ov11_02324CBC
	arm_func_end ov11_022EFCE4

	arm_func_start ov11_022EFD5C
ov11_022EFD5C: ; 0x022EFD5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrb r1, [r5, #0x2bc]
	mov r2, #0
	str r5, [r0]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
	str r2, [r0, #0x18]
#if defined(EUROPE)
	cmp r1, #0
	add r0, r5, #0x100
	ldrsh r1, [r0, #0xbe]
	moveq r3, #0
	movne r3, #1
	ldr r0, _022F0D74 ; =0x0000017B
	and r4, r3, #0xff
	cmp r1, r0
	bgt _022F085C
	bge _022F0028
	sub r3, r0, #0x4d
	cmp r1, r3
	bgt _022F07A8
	bge _022F0038
	cmp r1, #0xdc
	bgt _022F0730
	bge _022EFFF4
	cmp r1, #0x85
	bgt _022F0724
	bge _022EFFF4
	cmp r1, #8
	beq _022F0008
	b _022F03A8
_022F0724:
	cmp r1, #0xd4
	beq _022EFFF4
	b _022F03A8
_022F0730:
	cmp r1, #0x10c
	bgt _022F0760
	bge _022F03B0
	cmp r1, #0xf5
	bgt _022F03A8
	cmp r1, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r1, #0xf4
	cmpne r1, #0xf5
	beq _022F0028
	b _022F03A8
_022F0760:
	sub r3, r0, #0x6a
	cmp r1, r3
	bgt _022F077C
	sub r0, r0, #0x6a
	cmp r1, r0
	beq _022F0114
	b _022F03A8
_022F077C:
	sub r3, r0, #0x68
	cmp r1, r3
	bgt _022F03A8
	sub r3, r0, #0x69
	cmp r1, r3
	blt _022F03A8
	beq _022EFFF4
	sub r0, r0, #0x68
	cmp r1, r0
	beq _022F038C
	b _022F03A8
_022F07A8:
	sub r3, r0, #0x19
	cmp r1, r3
	bgt _022F081C
	bge _022F0064
	cmp r1, #0x130
	bgt _022F07D4
	bge _022F0054
	sub r0, r0, #0x4c
	cmp r1, r0
	beq _022F0054
	b _022F03A8
_022F07D4:
	sub r0, r0, #0x4a
	sub r0, r1, r0
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022F07E8: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022F081C:
	ldr r0, _022F0D78 ; =0x0000016B
	cmp r1, r0
	bgt _022F083C
	bge _022F00BC
	sub r0, r0, #8
	cmp r1, r0
	beq _022F0008
	b _022F03A8
_022F083C:
	cmp r1, #0x16c
	bgt _022F084C
	beq _022F0114
	b _022F03A8
_022F084C:
	add r0, r0, #0xb
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F085C:
	add r3, r0, #0x3a
	cmp r1, r3
	bgt _022F08F0
	mov r2, r3
	cmp r1, r2
	bge _022EFFF4
	add r2, r0, #0x18
	cmp r1, r2
	bgt _022F08AC
	bge _022EFFF4
	cmp r1, #0x184
	bgt _022F089C
	bge _022EFFF4
	cmp r1, #0x17c
	beq _022F0028
	b _022F03A8
_022F089C:
	add r0, r0, #0x13
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F08AC:
	add r2, r0, #0x26
	cmp r1, r2
	bgt _022F08D0
	add r0, r0, #0x26
	cmp r1, r0
	bge _022EFFF4
	cmp r1, #0x19c
	beq _022F0018
	b _022F03A8
_022F08D0:
	cmp r1, #0x1b0
	bgt _022F08E0
	beq _022F0038
	b _022F03A8
_022F08E0:
	add r0, r0, #0x36
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F08F0:
	add r3, r0, #0x53
	cmp r1, r3
	bgt _022F0944
	mov r2, r3
	cmp r1, r2
	bge _022F0244
	cmp r1, #0x1bc
	bgt _022F0924
	bge _022F0038
	add r0, r0, #0x40
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F0924:
	cmp r1, #0x1cc
	bgt _022F0934
	beq _022F01D0
	b _022F03A8
_022F0934:
	add r0, r0, #0x52
	cmp r1, r0
	beq _022F01D0
	b _022F03A8
_022F0944:
	cmp r1, #0x1d0
	bgt _022F0960
	bge _022F0244
	add r0, r0, #0x54
	cmp r1, r0
	beq _022F0228
	b _022F03A8
_022F0960:
	add r3, r0, #0x57
	cmp r1, r3
	bgt _022F097C
	add r0, r0, #0x57
	cmp r1, r0
	beq _022F02A4
	b _022F03A8
_022F097C:
	add r3, r0, #0x5b
	cmp r1, r3
	bgt _022F03A8
	add r3, r0, #0x58
	cmp r1, r3
	blt _022F03A8
	beq _022F0304
	cmp r1, #0x1d4
	beq _022F0314
	add r0, r0, #0x5b
	cmp r1, r0
	beq _022F032C
	b _022F03A8
#elif defined(JAPAN)
	cmp r1, #0
	add r0, r5, #0x100
	ldrsh r1, [r0, #0xbe]
	moveq r3, #0
	movne r3, #1
	ldr r0, _022F1A08 ; =0x00000165
	and r4, r3, #0xff
	cmp r1, r0
	bgt _022F1524
	bge _022F0114
	sub r3, r0, #0x52
	cmp r1, r3
	bgt _022F1480
	sub r3, r0, #0x53
	cmp r1, r3
	blt _022F1410_JP
	beq _022EFFF4
	sub r0, r0, #0x52
	cmp r1, r0
	beq _022F038C
	b _022F03A8
_022F1410_JP:
	cmp r1, #0xdc
	bgt _022F1440
	bge _022EFFF4
	cmp r1, #0x85
	bgt _022F1434
	bge _022EFFF4
	cmp r1, #8
	beq _022F0008
	b _022F03A8
_022F1434:
	cmp r1, #0xd4
	beq _022EFFF4
	b _022F03A8
_022F1440:
	cmp r1, #0x10c
	bgt _022F1470
	bge _022F03B0
	cmp r1, #0xf5
	bgt _022F03A8
	cmp r1, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r1, #0xf4
	cmpne r1, #0xf5
	beq _022F0028
	b _022F03A8
_022F1470:
	sub r0, r0, #0x54
	cmp r1, r0
	beq _022F0114
	b _022F03A8
_022F1480:
	sub r3, r0, #0x2f
	cmp r1, r3
	bgt _022F14FC
	sub r0, r0, #0x3b
	subs r0, r1, r0
	addpl pc, pc, r0, lsl #2
	b _022F14D0
_022F149C: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022F14D0:
	cmp r1, #0x128
	bgt _022F14EC
	bge _022F0054
	ldr r0, _022F1A0C_JP ; =0x00000127
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F14EC:
	ldr r0, _022F1A10 ; =0x00000129
	cmp r1, r0
	beq _022F0054
	b _022F03A8
_022F14FC:
	cmp r1, #0x15c
	bgt _022F1518
	bge _022F0008
	sub r0, r0, #0xa
	cmp r1, r0
	beq _022F0064
	b _022F03A8
_022F1518:
	cmp r1, #0x164
	beq _022F00BC
	b _022F03A8
_022F1524:
	add r3, r0, #0x35
	cmp r1, r3
	bgt _022F15A4
	mov r2, r3
	cmp r1, r2
	bge _022EFFF4
	add r2, r0, #0x18
	cmp r1, r2
	bgt _022F1578
	bge _022EFFF4
	cmp r1, #0x174
	bgt _022F1568
	bge _022F0028
	add r0, r0, #0xa
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F1568:
	add r0, r0, #0x10
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F1578:
	cmp r1, #0x18c
	bgt _022F1594
	bge _022EFFF4
	add r0, r0, #0x22
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F1594:
	add r0, r0, #0x30
	cmp r1, r0
	beq _022F0018
	b _022F03A8
_022F15A4:
	cmp r1, #0x1b0
	bgt _022F15E0
	bge _022F0038
	add r2, r0, #0x41
	cmp r1, r2
	bgt _022F15D0
	bge _022F0038
	add r0, r0, #0x40
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F15D0:
	add r0, r0, #0x45
	cmp r1, r0
	beq _022EFFF4
	b _022F03A8
_022F15E0:
	add r3, r0, #0x50
	cmp r1, r3
	bgt _022F1608
	mov r2, r3
	cmp r1, r2
	bge _022F01D0
	add r0, r0, #0x4c
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F1608:
	add r0, r0, #0x51
	sub r0, r1, r0
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022F161C: ; jump table
	b _022F01D0 ; case 0
	b _022F0244 ; case 1
	b _022F0228 ; case 2
	b _022F0244 ; case 3
	b _022F03A8 ; case 4
	b _022F02A4 ; case 5
	b _022F0304 ; case 6
	b _022F0314 ; case 7
	b _022F03A8 ; case 8
	b _022F032C ; case 9
#else
	add r0, r5, #0x100
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	ldrsh r0, [r0, #0xbe]
	and r4, r1, #0xff
	cmp r0, #0x160
	bgt _022EFEF0
	bge _022F0114
	ldr r3, _022F03B8 ; =0x00000113
	cmp r0, r3
	bgt _022EFE44
	sub r1, r3, #1
	cmp r0, r1
	blt _022EFDD4
	beq _022EFFF4
	cmp r0, r3
	beq _022F038C
	b _022F03A8
_022EFDD4:
	cmp r0, #0xdc
	bgt _022EFE04
	bge _022EFFF4
	cmp r0, #0x85
	bgt _022EFDF8
	bge _022EFFF4
	cmp r0, #8
	beq _022F0008
	b _022F03A8
_022EFDF8:
	cmp r0, #0xd4
	beq _022EFFF4
	b _022F03A8
_022EFE04:
	cmp r0, #0x10c
	bgt _022EFE34
	bge _022F03B0
	cmp r0, #0xf5
	bgt _022F03A8
	cmp r0, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r0, #0xf4
	cmpne r0, #0xf5
	beq _022F0028
	b _022F03A8
_022EFE34:
	sub r1, r3, #2
	cmp r0, r1
	beq _022F0114
	b _022F03A8
_022EFE44:
	add r1, r3, #0x1e
	cmp r0, r1
	bgt _022EFEC0
	add r1, r3, #0x12
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022EFE94
_022EFE60: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022EFE94:
	ldr r1, _022F03BC ; =0x00000123
	cmp r0, r1
	bgt _022EFEB4
	bge _022F0054
	sub r1, r1, #1
	cmp r0, r1
	beq _022F0038
	b _022F03A8
_022EFEB4:
	cmp r0, #0x124
	beq _022F0054
	b _022F03A8
_022EFEC0:
	add r1, r3, #0x44
	cmp r0, r1
	bgt _022EFEE0
	bge _022F0008
	add r1, r3, #0x43
	cmp r0, r1
	beq _022F0064
	b _022F03A8
_022EFEE0:
	add r1, r3, #0x4c
	cmp r0, r1
	beq _022F00BC
	b _022F03A8
_022EFEF0:
	ldr r3, _022F03C0 ; =0x00000195
	cmp r0, r3
	bgt _022EFF64
	bge _022EFFF4
	cmp r0, #0x178
	bgt _022EFF38
	bge _022EFFF4
	sub r1, r3, #0x26
	cmp r0, r1
	bgt _022EFF2C
	bge _022F0028
	sub r1, r3, #0x2b
	cmp r0, r1
	beq _022F0028
	b _022F03A8
_022EFF2C:
	cmp r0, #0x170
	beq _022F0028
	b _022F03A8
_022EFF38:
	sub r1, r3, #0xe
	cmp r0, r1
	bgt _022EFF58
	bge _022EFFF4
	sub r1, r3, #0x13
	cmp r0, r1
	beq _022F0028
	b _022F03A8
_022EFF58:
	cmp r0, #0x190
	beq _022F0018
	b _022F03A8
_022EFF64:
	add r1, r3, #0x16
	cmp r0, r1
	bgt _022EFFA0
	bge _022F0038
	add r1, r3, #0xc
	cmp r0, r1
	bgt _022EFF90
	bge _022F0038
	cmp r0, #0x1a0
	beq _022F0038
	b _022F03A8
_022EFF90:
	add r1, r3, #0x10
	cmp r0, r1
	beq _022EFFF4
	b _022F03A8
_022EFFA0:
	cmp r0, #0x1b0
	bgt _022EFFB8
	bge _022F01D0
	cmp r0, #0x1ac
	beq _022F0038
	b _022F03A8
_022EFFB8:
	add r1, r3, #0x1c
	sub r0, r0, r1
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022EFFCC: ; jump table
	b _022F01D0 ; case 0
	b _022F0244 ; case 1
	b _022F0228 ; case 2
	b _022F0244 ; case 3
	b _022F03A8 ; case 4
	b _022F02A4 ; case 5
	b _022F0304 ; case 6
	b _022F0314 ; case 7
	b _022F03A8 ; case 8
	b _022F032C ; case 9
#endif
_022EFFF4:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl ov11_022EE5EC
	b _022F03B0
_022F0008:
	mov r0, r5
	mov r1, #2
	bl ov11_022EE620
	b _022F03B0
_022F0018:
	mov r0, r5
	mov r1, #4
	bl ov11_022EE620
	b _022F03B0
_022F0028:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	b _022F03B0
_022F0038:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	b _022F03B0
_022F0048:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
_022F0054:
	mov r0, r5
	mov r1, #4
	bl ov11_022EE620
	b _022F03B0
_022F0064:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x80
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F00BC:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x40
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F0114:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x40
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F016C:
	mov r0, r5
	mov r1, #1
	bl ov11_022EE5EC
	mov r0, r5
	mov r1, #1
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0
	mov r1, #0x80
	bl sub_020094C4
	b _022F03B0
_022F01D0:
	mov r0, r5
	mov r1, #2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	b _022F03B0
_022F0228:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
	mov r1, r4
	mov r0, #2
	bl sub_02009194
	b _022F03B0
_022F0244:
	mov r0, r5
#ifdef EUROPE
	mov r1, #0
#else
	mov r1, r2
#endif
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
#ifdef EUROPE
	mov r2, r4
	mov r0, #4
	mov r1, #2
#else
	mov r0, #4
	mov r1, #2
	mov r2, r4
#endif
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	mov r0, #1
	bl ov11_022F294C
	b _022F03B0
_022F02A4:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	mov r0, #2
	bl ov11_022F294C
	b _022F03B0
_022F0304:
	mov r0, r5
	mov r1, #3
	bl ov11_022EE620
	b _022F03B0
_022F0314:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, #0
	bl ov11_022F294C
	b _022F03B0
_022F032C:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x5a
	mov r1, #0x1e
	bl sub_020094C4
	mov r0, #3
	bl ov11_022F294C
	b _022F03B0
_022F038C:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
	mov r1, r4
	mov r0, #2
	bl sub_02009194
	b _022F03B0
_022F03A8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022F03B0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
_022F0D74: .word 0x0000017B
_022F0D78: .word 0x0000016B
#elif defined(JAPAN)
_022F1A08: .word 0x00000165
_022F1A0C_JP: .word 0x00000127
_022F1A10: .word 0x00000129
#else
_022F03B8: .word 0x00000113
_022F03BC: .word 0x00000123
_022F03C0: .word 0x00000195
#endif
	arm_func_end ov11_022EFD5C

	arm_func_start ov11_022F03C4
ov11_022F03C4: ; 0x022F03C4
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	str r3, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	str r3, [r0, #0xc]
	str r2, [r0, #0x10]
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x18]
	str r2, [r0, #0x14]
	str r1, [r0, #0x18]
	bx lr
	arm_func_end ov11_022F03C4

	arm_func_start ov11_022F03F8
ov11_022F03F8: ; 0x022F03F8
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end ov11_022F03F8

	arm_func_start ov11_022F040C
ov11_022F040C: ; 0x022F040C
	ldr r3, [r1]
	ldr r2, [r1, #4]
	mov r1, #0
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ov11_022F040C

	arm_func_start ov11_022F042C
ov11_022F042C: ; 0x022F042C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r6, r0
	ldr r4, [r6]
	ldr r0, _022F11D4 ; =0x0000016A
	add r2, r4, #0x100
	ldrsh r2, [r2, #0xbe]
	mov r5, r1
	cmp r2, r0
	bgt _022F054C
	bge _022F07FC
#if defined(EUROPE)
	sub r1, r0, #0x4c
	cmp r2, r1
#elif defined(JAPAN)
	cmp r2, #0x128
#else
	sub r1, r0, #0x47
	cmp r2, r1
#endif
	bgt _022F04D4
	bge _022F0C44
	cmp r2, #0x10c
	bgt _022F04A8
	bge _022F0FB4
	cmp r2, #8
	bgt _022F0484
	beq _022F0634
	b _022F11C0
_022F0484:
	cmp r2, #0xf5
	bgt _022F11C0
	cmp r2, #0xf3
	blt _022F11C0
	cmpne r2, #0xf4
	beq _022F07FC
	cmp r2, #0xf5
	beq _022F0AF0
	b _022F11C0
_022F04A8:
#if defined(EUROPE)
	sub r1, r0, #0x6a
#elif defined(JAPAN)
	sub r1, r0, #0x5e
#else
	sub r1, r0, #0x59
#endif
	cmp r2, r1
	bgt _022F04C4
#if defined(EUROPE)
	sub r0, r0, #0x6a
#elif defined(JAPAN)
	sub r0, r0, #0x5e
#else
	sub r0, r0, #0x59
#endif
	cmp r2, r0
	beq _022F0F04
	b _022F11C0
_022F04C4:
#ifdef EUROPE
	sub r0, r0, #0x4d
#else
	sub r0, r0, #0x48
#endif
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F04D4:
#if defined(EUROPE)
	sub r1, r0, #0x18
	cmp r2, r1
	bgt _022F0524
	bge _022F0634
	sub r0, r0, #0x46
	cmp r2, r0
	bgt _022F0514
	subs r0, r2, #0x130
#elif defined(JAPAN)
	cmp r2, #0x15c
	bgt _022F0524
	bge _022F0634
	sub r1, r0, #0x41
	cmp r2, r1
	bgt _022F0514
	sub r0, r0, #0x46
	subs r0, r2, r0
#else
	sub r1, r0, #0x13
	cmp r2, r1
	bgt _022F0524
	bge _022F0634
	sub r0, r0, #0x41
	cmp r2, r0
	bgt _022F0514
	subs r0, r2, #0x124
#endif
	addpl pc, pc, r0, lsl #2
	b _022F11C0
_022F04FC: ; jump table
	b _022F0C44 ; case 0
	b _022F0DA4 ; case 1
	b _022F0C44 ; case 2
	b _022F11C0 ; case 3
	b _022F11C0 ; case 4
	b _022F0DA4 ; case 5
_022F0514:
	ldr r0, _022F11D8 ; =0x00000156
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0524:
#if defined(EUROPE)
	cmp r2, #0x16c
	bgt _022F0540
	bge _022F0F04
	sub r0, r0, #0x10
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0540:
	sub r0, r0, #5
	cmp r2, r0
	beq _022F07FC
	b _022F11C0
_022F054C:
	cmp r2, #0x1bc
	bgt _022F05B0
	bge _022F0C44
	cmp r2, #0x19c
	bgt _022F0594
	bge _022F08F8
	cmp r2, #0x17c
	bgt _022F0588
	beq _022F0700
	b _022F11C0
_022F0588:
	add r0, r0, #0x13
	cmp r2, r0
	beq _022F09F4
	b _022F11C0
_022F0594:
	add r1, r0, #0x36
	cmp r2, r1
	bgt _022F05A4
	add r0, r0, #0x36
	cmp r2, r0
	bge _022F0C44
	cmp r2, #0x1b0
	beq _022F0C44
	b _022F11C0
_022F05A4:
	add r0, r0, #0x40
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F05B0:
	add r1, r0, #0x53
	cmp r2, r1
	bgt _022F05E4
	bge _022F1128
	cmp r2, #0x1cc
	bgt _022F05D8
	beq _022F1090
	b _022F11C0
_022F05D8:
	add r0, r0, #0x52
	cmp r2, r0
	beq _022F1090
#elif defined(JAPAN)
	cmp r2, #0x164
	bgt _022F0540
	beq _022F0700
	b _022F11C0
_022F0540:
	sub r0, r0, #0xa
	cmp r2, r0
	beq _022F0F04
	b _022F11C0
_022F054C:
	add r1, r0, #0x37
	cmp r2, r1
	bgt _022F1BFC
	bge _022F0C44
	add r1, r0, #0x18
	cmp r2, r1
	bgt _022F1BD0
	bge _022F09F4
	cmp r2, #0x174
	bgt _022F1BC0
	beq _022F07FC
	b _022F11C0
_022F1BC0:
	add r0, r0, #6
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F1BD0:
	add r1, r0, #0x26
	cmp r2, r1
	bgt _022F1BEC
	add r0, r0, #0x26
	cmp r2, r0
	beq _022F08F8
	b _022F11C0
_022F1BEC:
	add r0, r0, #0x36
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F1BFC:
	add r1, r0, #0x46
	cmp r2, r1
	bgt _022F05E4
	bge _022F1090
	cmp r2, #0x1b0
	bgt _022F1C1C
	beq _022F0C44
	b _022F11C0
_022F1C1C:
	add r0, r0, #0x42
	cmp r2, r0
	beq _022F0C44
#else
	sub r1, r0, #0xb
	cmp r2, r1
	bgt _022F0540
	sub r0, r0, #0xb
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0540:
	cmp r2, #0x160
	beq _022F0F04
	b _022F11C0
_022F054C:
	add r1, r0, #0x37
	cmp r2, r1
	bgt _022F05B0
	bge _022F0C44
	add r1, r0, #0x18
	cmp r2, r1
	bgt _022F0594
	bge _022F09F4
	add r1, r0, #5
	cmp r2, r1
	bgt _022F0588
	add r0, r0, #5
	cmp r2, r0
	beq _022F07FC
	b _022F11C0
_022F0588:
	cmp r2, #0x170
	beq _022F0700
	b _022F11C0
_022F0594:
	cmp r2, #0x190
	bgt _022F05A4
	beq _022F08F8
	b _022F11C0
_022F05A4:
	cmp r2, #0x1a0
	beq _022F0C44
	b _022F11C0
_022F05B0:
	cmp r2, #0x1b0
	bgt _022F05E4
	bge _022F1090
	add r1, r0, #0x41
	cmp r2, r1
	bgt _022F05D8
	add r0, r0, #0x41
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F05D8:
	cmp r2, #0x1ac
	beq _022F0C44
#endif
	b _022F11C0
_022F05E4:
#ifdef EUROPE
	add r1, r0, #0x57
	cmp r2, r1
	bgt _022F0604
	add r0, r0, #0x57
	cmp r2, r0
	bge _022F0FF8
	cmp r2, #0x1d0
	beq _022F1128
#else
	add r1, r0, #0x48
	cmp r2, r1
	bgt _022F0604
	bge _022F1128
	add r0, r0, #0x47
	cmp r2, r0
	beq _022F1090
#endif
	b _022F11C0
_022F0604:
#ifdef EUROPE
	add r0, r0, #0x5b
	cmp r2, r0
#else
	add r1, r0, #0x50
	cmp r2, r1
	bgt _022F11C0
#ifdef JAPAN
	add r1, r0, #0x4a
	cmp r2, r1
#else
	cmp r2, #0x1b4
#endif
	blt _022F11C0
	beq _022F1128
	add r1, r0, #0x4c
	cmp r2, r1
	addne r0, r0, #0x50
	cmpne r2, r0
#endif
	beq _022F0FF8
	b _022F11C0
_022F0634:
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #0
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x78
	add r0, r1, r0
	str r0, [sp, #0x78]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	mov r0, r4
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x7c]
	bl ov11_022EF2EC
	add r2, sp, #0x78
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F0700:
	ldr r0, [r5]
	add r2, sp, #0x70
	str r0, [sp, #0x70]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x74]
	bl ov11_022EF2EC
	add r2, sp, #0x70
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x70]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x70
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x74]
	bl ov11_022EF2EC
	add r2, sp, #0x70
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F07FC:
	ldr r0, [r5]
	add r2, sp, #0x68
	str r0, [sp, #0x68]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x6c]
	bl ov11_022EF2EC
	add r2, sp, #0x68
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x68]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x68
	add r3, r3, r1
	mov r1, #1
	str r3, [sp, #0x6c]
	bl ov11_022EF2EC
	add r2, sp, #0x68
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F08F8:
	ldr r0, [r5]
	add r2, sp, #0x60
	str r0, [sp, #0x60]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x64]
	bl ov11_022EF2EC
	add r2, sp, #0x60
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	add r1, ip, r1, asr #8
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	add r1, ip, r1, asr #8
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #24
	add r3, ip, r3, ror #24
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #24
	add r3, ip, r3, ror #24
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x60]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x60
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x64]
	bl ov11_022EF2EC
	add r2, sp, #0x60
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F09F4:
	ldr r0, [r5]
	add r2, sp, #0x58
	str r0, [sp, #0x58]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x5c]
	bl ov11_022EF2EC
	add r2, sp, #0x58
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x58]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x58
	add r3, r3, r1
	mov r1, #1
	str r3, [sp, #0x5c]
	bl ov11_022EF2EC
	add r2, sp, #0x58
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0AF0:
	ldr r0, [r5]
	add r2, sp, #0x50
	str r0, [sp, #0x50]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x54]
	bl ov11_022EF2EC
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #4]
	add r2, r1, r0
	str r2, [r6, #0xc]
	mov r0, r2, asr #2
	ldr r1, [r6, #0x14]
	add r0, r2, r0, lsr #29
	add r0, r1, r0, asr #3
	str r0, [r6, #0x14]
	ldr r0, [r6, #0xc]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	str r0, [r6, #0xc]
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	adds r1, r1, r0
	str r1, [sp, #0x50]
	ldr r2, [r6, #0x14]
	ldr r3, [r5, #4]
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	add r0, r3, r0, asr #3
	str r0, [sp, #0x54]
	bpl _022F0BB4
	mov r2, r1, asr #7
	add r2, r1, r2, lsr #24
	mov r3, r1, lsr #0x1f
	mov r2, r2, asr #8
	rsb r1, r3, r1, lsl #24
	sub r2, r2, #1
	add r1, r3, r1, ror #24
	sub r2, r0, r2, lsl #5
	add r0, r1, #0x100
	str r2, [sp, #0x54]
	str r0, [sp, #0x50]
	b _022F0BE0
_022F0BB4:
	cmp r1, #0x100
	blt _022F0BE0
	mov r2, r1, asr #7
	add r2, r1, r2, lsr #24
	mov r3, r1, lsr #0x1f
	mov r2, r2, asr #8
	rsb r1, r3, r1, lsl #24
	sub r2, r0, r2, lsl #5
	add r0, r3, r1, ror #24
	str r2, [sp, #0x54]
	str r0, [sp, #0x50]
_022F0BE0:
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x50
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [sp, #0x50]
	ldr r1, [r6, #0x14]
	ldr r3, [r5, #4]
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	add r3, r3, r0, asr #4
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x54]
	bl ov11_022EF2EC
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0C44:
	ldr r0, [r5]
	add r2, sp, #0x48
	str r0, [sp, #0x48]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x4c]
	bl ov11_022EF2EC
	add r2, sp, #0x48
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #4]
	add r2, sp, #0x48
	add r0, r1, r0
	str r0, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	mov r0, r4
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #0
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	ldr r3, [r6, #0x14]
	str r3, [sp, #0x48]
	str r1, [sp, #0x4c]
	bl ov11_022EF2EC
	ldr r0, [sp, #0x48]
	add r2, sp, #0x48
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x18]
	mov r0, r4
	str r1, [sp, #0x48]
	mov r1, #0
	bl ov11_022EF2EC
	ldr r1, [sp, #0x48]
	mov r0, r4
	str r1, [r6, #0x18]
	ldr r3, [r5]
	ldr r2, [r6, #0x14]
	mov r1, #0
	add r2, r3, r2
	str r2, [sp, #0x48]
	ldr r3, [r5, #4]
	add r2, sp, #0x48
	str r3, [sp, #0x4c]
	bl ov11_022EF2EC
	mov r0, r4
	mov r1, #0
	add r2, sp, #0x48
	bl ov11_022EF2D4
	ldr r1, [r6, #0x18]
	ldr r2, [r5]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x48]
	ldr r2, [r5, #4]
	mov r1, #1
	str r2, [sp, #0x4c]
	add r2, sp, #0x48
	bl ov11_022EF2EC
	add r2, sp, #0x48
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0DA4:
	ldr r0, [r5]
	add r2, sp, #0x40
	str r0, [sp, #0x40]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	add r2, sp, #0x40
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r0, [r6, #4]
	mov r1, #0
	add r0, r2, r0
	str r0, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r0, [r6, #8]
	add r2, sp, #0x40
	add r0, r3, r0
	str r0, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r0, r4
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	str r1, [sp, #0x40]
	ldr r3, [r6, #0x14]
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	ldr r0, [sp, #0x44]
	add r2, sp, #0x40
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x18]
	mov r0, r4
	str r1, [sp, #0x44]
	mov r1, #1
	bl ov11_022EF2EC
	ldr r1, [sp, #0x44]
	mov r0, r4
	str r1, [r6, #0x18]
	ldr r2, [r5]
	mov r1, #0
	str r2, [sp, #0x40]
	ldr ip, [r5, #4]
	ldr r3, [r6, #0x14]
	add r2, sp, #0x40
	add r3, ip, r3
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	mov r0, r4
	mov r1, #0
	add r2, sp, #0x40
	bl ov11_022EF2D4
	ldr r1, [r5]
	mov r0, r4
	str r1, [sp, #0x40]
	ldr r3, [r5, #4]
	ldr r2, [r6, #0x18]
	mov r1, #1
	add r2, r3, r2
	str r2, [sp, #0x44]
	add r2, sp, #0x40
	bl ov11_022EF2EC
	add r2, sp, #0x40
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0F04:
	ldr r1, [r6, #0xc]
	mov r0, r4
	add r3, r1, #2
	str r3, [r6, #0xc]
	mov r1, r3, asr #1
	ldr r2, [r6, #0x14]
	add r1, r3, r1, lsr #30
	add r1, r2, r1, asr #2
	str r1, [r6, #0x14]
	ldr r1, [r6, #0xc]
	add r2, r6, #0x14
	and r1, r1, #3
	str r1, [r6, #0xc]
	mov r1, #0
	bl ov11_022EF2EC
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x38
	add r0, r1, r0
	str r0, [sp, #0x38]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x3c]
	bl ov11_022EF2EC
	add r2, sp, #0x38
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x38
	sub r0, r1, r0
	str r0, [sp, #0x38]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x3c]
	bl ov11_022EF2EC
	add r2, sp, #0x38
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0FB4:
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x30
	add r0, r1, r0
	str r0, [sp, #0x30]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	mov r0, r4
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x34]
	bl ov11_022EF2EC
	add r2, sp, #0x30
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F0FF8:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #0x28]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #7
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0x20
	and r4, r4, #7
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0x2c]
	sub r3, r3, r4
	str r3, [sp, #0x20]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #0x24]
	bl ov11_022F2B28
	b _022F11C8
_022F1090:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #0x18]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #7
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0x10
	and r4, r4, #7
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0x1c]
	sub r3, r3, r4
	str r3, [sp, #0x10]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #0x14]
	bl ov11_022F2B28
	b _022F11C8
_022F1128:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #8]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #1
	add r0, r5, r0, lsr #30
	add r0, ip, r0, asr #2
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #1
	add r0, r5, r0, lsr #30
	add r0, ip, r0, asr #2
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #3
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0
	and r4, r4, #3
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0xc]
	sub r3, r3, r4
	str r3, [sp]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #4]
	bl ov11_022F2B28
	b _022F11C8
_022F11C0:
	mov r0, #1
	b _022F11CC
_022F11C8:
	mov r0, #0
_022F11CC:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#if defined(EUROPE)
_022F11D4: .word 0x0000017B
_022F11D8: .word 0x00000162
#elif defined(JAPAN)
_022F11D4: .word 0x0000016F
_022F11D8: .word 0x0000015B
#else
_022F11D4: .word 0x0000016A
_022F11D8: .word 0x00000156
#endif
	arm_func_end ov11_022F042C

	arm_func_start ov11_022F11DC
ov11_022F11DC: ; 0x022F11DC
	stmdb sp!, {r3, lr}
	mov r0, #0x3c
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F1210 ; =GROUND_STATE_MAP
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	bl ov11_022F2F58
	mov r0, #0
	bl ov11_022F2278
	bl ov11_022F1244
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1210: .word GROUND_STATE_MAP
	arm_func_end ov11_022F11DC

	arm_func_start ov11_022F1214
ov11_022F1214: ; 0x022F1214
	stmdb sp!, {r3, lr}
	bl ov11_022F1244
	bl ov11_022F2FE8
	bl ov11_022F22C8
	ldr r0, _022F1240 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F1240 ; =GROUND_STATE_MAP
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1240: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1214

	arm_func_start ov11_022F1244
ov11_022F1244: ; 0x022F1244
	stmdb sp!, {r3, lr}
	bl ov11_0231145C
	cmp r0, #0
	beq _022F1258
	bl ov11_023113E8
_022F1258:
	bl ov11_0231195C
	cmp r0, #0
	beq _022F1268
	bl ov11_023118E8
_022F1268:
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	mov r2, #0
	ldr r1, [r0, #4]
	strb r2, [r1, #3]
	ldr r0, [r0, #4]
	strb r2, [r0, #2]
	bl ov11_022F3010
	mov r0, #0
	bl ov11_022F22F4
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F12BC: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1244

	arm_func_start ov11_022F12C0
ov11_022F12C0: ; 0x022F12C0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	ldr r1, _022F1534 ; =ov11_02320FB4
	mov r2, r5
	mov r0, #1
	bl Debug_Print
	bl ov11_022F1244
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F1538 ; =GROUND_STATE_MAP
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r5, r1
	strh r5, [r0]
	bne _022F134C
	ldr r0, [r2]
	ldr r1, _022F153C ; =ov11_02320CD8
	bl ov11_022EBC18
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	b _022F14E8
_022F134C:
	mov r0, #0xc
	smulbb r3, r5, r0
	ldr r4, _022F1540 ; =EVENTS
	ldrsh r0, [r4, r3]
	add r4, r4, r3
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022F146C
_022F1370: ; jump table
	b _022F1444 ; case 0
	b _022F146C ; case 1
	b _022F146C ; case 2
	b _022F146C ; case 3
	b _022F146C ; case 4
	b _022F146C ; case 5
	b _022F13A4 ; case 6
	b _022F13A4 ; case 7
	b _022F13A4 ; case 8
	b _022F13A4 ; case 9
	b _022F13A4 ; case 10
	b _022F13C4 ; case 11
	b _022F13C4 ; case 12
_022F13A4:
	ldr r0, [r2]
	ldr r1, _022F1544 ; =ov11_02320CF4
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #2
	bl ov11_022F22F4
	b _022F148C
_022F13C4:
	ldr r6, _022F1548 ; =LEVEL_TILEMAP_LIST
	b _022F1414
_022F13CC:
	cmp r0, r5
	bne _022F1410
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl MemFree
	ldrsh r1, [r4]
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	mov r3, #0
	str r3, [r0]
	cmp r1, #0xb
	moveq r3, #1
	ldr r2, [r6, #4]
	mov r0, r5
	add r1, r6, #2
	and r3, r3, #0xff
	bl GetSpecialLayoutBackground
	b _022F152C
_022F1410:
	add r6, r6, #8
_022F1414:
	ldrsh r0, [r6]
	cmp r0, r1
	bne _022F13CC
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, _022F154C ; =ov11_02320D10
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
	b _022F148C
_022F1444:
	ldr r0, _022F1550 ; =ov11_02320CA8
	ldrsh r3, [r4]
	ldr ip, [r0, #0x1c]
	ldr lr, [r0, #0x18]
	ldr r1, _022F1554 ; =ov11_02320FCC
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_022F146C:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, _022F153C ; =ov11_02320CD8
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
_022F148C:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldrsh r0, [r4, #6]
	mvn r1, #0
	cmp r0, r1
	beq _022F14D4
	bl ov11_022F25A4
_022F14D4:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r2, _022F1558 ; =ov11_02320CA8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F14E8:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	bl ov11_0231145C
	cmp r0, #0
	beq _022F1514
	mov r0, #0
	mov r1, r0
	bl ov11_0230D318
	b _022F152C
_022F1514:
	bl ov11_0231195C
	cmp r0, #0
	beq _022F152C
	mov r0, #0
	mov r1, r0
	bl ov11_0230D318
_022F152C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F1534: .word ov11_02320FB4
_022F1538: .word GROUND_STATE_MAP
_022F153C: .word ov11_02320CD8
_022F1540: .word EVENTS
_022F1544: .word ov11_02320CF4
_022F1548: .word LEVEL_TILEMAP_LIST
_022F154C: .word ov11_02320D10
_022F1550: .word ov11_02320CA8
_022F1554: .word ov11_02320FCC
_022F1558: .word ov11_02320CA8
	arm_func_end ov11_022F12C0

	arm_func_start GetSpecialLayoutBackground
GetSpecialLayoutBackground: ; 0x022F155C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldr r1, _022F16F0 ; =ov11_02320FE8
	mov r2, r8
	mov r0, #1
	mov r5, r3
	bl Debug_Print
	bl ov11_022F1244
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F16F4 ; =GROUND_STATE_MAP
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r8, r1
	strh r8, [r0]
	ldrneb r0, [r7]
	cmpne r0, #0xff
	bne _022F1600
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, _022F16F8 ; =ov11_02320CD8
	ldr r0, [r0]
	bl ov11_022EBC18
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	b _022F16D8
_022F1600:
	mov r0, #0xc
	smulbb r1, r8, r0
	ldr r2, _022F16FC ; =EVENTS
	ldrsh r0, [r2, r1]
	add r4, r2, r1
	cmp r0, #0xa
	cmpne r0, #0xb
	beq _022F1644
	ldr r1, _022F1700 ; =ov11_02320CA8
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _022F1704 ; =ov11_02321004
	mov r2, r8
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_022F1644:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, _022F1708 ; =ov11_02320D10
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
	cmp r5, #0
	beq _022F1688
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	mov r2, r7
	mov r3, r6
	bl LoadMapType11
	b _022F16A0
_022F1688:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	mov r2, r7
	mov r3, r6
	bl LoadMapType10
_022F16A0:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r2, _022F170C ; =ov11_02320CB8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F16D8:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F16F0: .word ov11_02320FE8
_022F16F4: .word GROUND_STATE_MAP
_022F16F8: .word ov11_02320CD8
_022F16FC: .word EVENTS
_022F1700: .word ov11_02320CA8
_022F1704: .word ov11_02321004
_022F1708: .word ov11_02320D10
_022F170C: .word ov11_02320CB8
	arm_func_end GetSpecialLayoutBackground

	arm_func_start ov11_022F1710
ov11_022F1710: ; 0x022F1710
	ldr r0, _022F1734 ; =GROUND_STATE_MAP
	mov r2, #0
	ldr r1, [r0, #4]
	ldr ip, _022F1738 ; =ov11_022EDD14
	strb r2, [r1, #3]
	ldr r1, [r0, #4]
	strb r2, [r1, #2]
	ldr r0, [r0]
	bx ip
	.align 2, 0
_022F1734: .word GROUND_STATE_MAP
_022F1738: .word ov11_022EDD14
	arm_func_end ov11_022F1710

	arm_func_start ov11_022F173C
ov11_022F173C: ; 0x022F173C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022F178C ; =ov11_02321018
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r2, _022F1790 ; =GROUND_STATE_MAP
	ldr r1, _022F1794 ; =EVENTS
	ldr r3, [r2, #4]
	mov r0, #0xc
	strh r4, [r3]
	smlabb r0, r4, r0, r1
	ldrsh r1, [r0, #4]
	ldr r0, [r2]
	bl ov11_022EDD20
	ldr r0, _022F1790 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F178C: .word ov11_02321018
_022F1790: .word GROUND_STATE_MAP
_022F1794: .word EVENTS
	arm_func_end ov11_022F173C

	arm_func_start ov11_022F1798
ov11_022F1798: ; 0x022F1798
	ldr r0, _022F17B0 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	cmp r0, #0
	ldrnesh r0, [r0]
	mvneq r0, #0
	bx lr
	.align 2, 0
_022F17B0: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1798

	arm_func_start ov11_022F17B4
ov11_022F17B4: ; 0x022F17B4
	ldr r0, _022F17E0 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	ldrsh r2, [r0]
	mov r0, #0xc
	ldr r1, _022F17E4 ; =EVENTS
	smulbb r0, r2, r0
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_022F17E0: .word GROUND_STATE_MAP
_022F17E4: .word EVENTS
	arm_func_end ov11_022F17B4

	arm_func_start ov11_022F17E8
ov11_022F17E8: ; 0x022F17E8
	ldr r1, _022F17F8 ; =GROUND_STATE_MAP
	ldr ip, _022F17FC ; =ov11_022ED69C
	ldr r1, [r1]
	bx ip
	.align 2, 0
_022F17F8: .word GROUND_STATE_MAP
_022F17FC: .word ov11_022ED69C
	arm_func_end ov11_022F17E8

.global ov11_022F1800
	arm_func_start ov11_022F1800
ov11_022F1800: ; 0x022F1800
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrsh r4, [r2, #6]
	mov r5, #0
	cmp r4, #0
	mov r4, #0xff
	ble _022F1A3C
	mov r7, r0
	mov r6, r5
_022F1820:
	mov r8, r6
_022F1824:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r7], #1
	blt _022F1824
	add r5, r5, #1
	cmp r5, #4
	blt _022F1820
	ldrb r6, [r2, #1]
	mov r4, #0
	cmp r6, #0
	ble _022F1A0C
	b _022F1A00
_022F1854:
	mov sb, #0
	mov r6, #0xff
_022F185C:
	add sb, sb, #1
	cmp sb, #5
	strb r6, [r7], #1
	blt _022F185C
	cmp r4, #0
	mov lr, #0
	bne _022F1924
	mov r8, lr
	mov ip, #0xc0
	b _022F1914
_022F1884:
	ldrb r6, [r1]
	add sl, r1, #1
	mov r1, sl
	cmp r6, #0xc0
	blt _022F18C0
	mov fp, ip
	b _022F18AC
_022F18A0:
	ldrb sl, [r1], #1
	add fp, fp, #1
	strb sl, [r7], #1
_022F18AC:
	cmp fp, r6
	ble _022F18A0
	sub r6, r6, #0xbf
	add lr, lr, r6
	b _022F1914
_022F18C0:
	cmp r6, #0x80
	blt _022F18F4
	add r1, sl, #1
	ldrb sl, [sl]
	mov fp, #0x80
	b _022F18E0
_022F18D8:
	strb sl, [r7], #1
	add fp, fp, #1
_022F18E0:
	cmp fp, r6
	ble _022F18D8
	sub r6, r6, #0x7f
	add lr, lr, r6
	b _022F1914
_022F18F4:
	mov sl, #0
	b _022F1904
_022F18FC:
	strb r8, [r7], #1
	add sl, sl, #1
_022F1904:
	cmp sl, r6
	ble _022F18FC
	add r6, r6, #1
	add lr, lr, r6
_022F1914:
	ldrb r6, [r2]
	cmp lr, r6
	blt _022F1884
	b _022F19DC
_022F1924:
	sub ip, r7, #0x100
	b _022F19D0
_022F192C:
	ldrb r6, [r1]
	add r8, r1, #1
	mov r1, r8
	cmp r6, #0xc0
	blt _022F1970
	mov r8, #0xc0
	b _022F195C
_022F1948:
	ldrb fp, [r1], #1
	ldrb sl, [ip], #1
	add r8, r8, #1
	eor sl, fp, sl
	strb sl, [r7], #1
_022F195C:
	cmp r8, r6
	ble _022F1948
	sub r6, r6, #0xbf
	add lr, lr, r6
	b _022F19D0
_022F1970:
	cmp r6, #0x80
	blt _022F19AC
	add r1, r8, #1
	ldrb r8, [r8]
	mov sl, #0x80
	b _022F1998
_022F1988:
	ldrb fp, [ip], #1
	add sl, sl, #1
	eor fp, r8, fp
	strb fp, [r7], #1
_022F1998:
	cmp sl, r6
	ble _022F1988
	sub r6, r6, #0x7f
	add lr, lr, r6
	b _022F19D0
_022F19AC:
	mov sl, #0
	b _022F19C0
_022F19B4:
	ldrb r8, [ip], #1
	add sl, sl, #1
	strb r8, [r7], #1
_022F19C0:
	cmp sl, r6
	ble _022F19B4
	add r6, r6, #1
	add lr, lr, r6
_022F19D0:
	ldrb r6, [r2]
	cmp lr, r6
	blt _022F192C
_022F19DC:
	add sb, sb, r6
	mov r6, #0xff
	b _022F19F0
_022F19E8:
	strb r6, [r7], #1
	add sb, sb, #1
_022F19F0:
	cmp sb, #0x100
	blt _022F19E8
	add r4, r4, #1
	add r5, r5, #1
_022F1A00:
	ldrb r6, [r2, #1]
	cmp r4, r6
	blt _022F1854
_022F1A0C:
	mov r4, #0xff
	mov r6, #0
	b _022F1A30
_022F1A18:
	mov r8, r6
_022F1A1C:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r7], #1
	blt _022F1A1C
	add r5, r5, #1
_022F1A30:
	cmp r5, r3
	blt _022F1A18
	b _022F1B10
_022F1A3C:
	mov r6, r0
	mov r7, r5
_022F1A44:
	mov r8, r7
_022F1A48:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r6], #1
	blt _022F1A48
	add r5, r5, #1
	cmp r5, #4
	blt _022F1A44
	ldrb r7, [r2, #1]
	mov r4, #0
	cmp r7, #0
	ble _022F1AE4
	mov r8, #0xff
	mov sb, r4
	mov sl, r8
	mov ip, r4
	b _022F1AD8
_022F1A88:
	mov lr, ip
_022F1A8C:
	add lr, lr, #1
	strb sl, [r6], #1
	cmp lr, #5
	blt _022F1A8C
	mov fp, #0
	b _022F1AAC
_022F1AA4:
	strb sb, [r6], #1
	add fp, fp, #1
_022F1AAC:
	ldrb r7, [r2]
	cmp fp, r7
	blt _022F1AA4
	add lr, lr, r7
	b _022F1AC8
_022F1AC0:
	strb r8, [r6], #1
	add lr, lr, #1
_022F1AC8:
	cmp lr, #0x100
	blt _022F1AC0
	add r4, r4, #1
	add r5, r5, #1
_022F1AD8:
	ldrb r7, [r2, #1]
	cmp r4, r7
	blt _022F1A88
_022F1AE4:
	mov r4, #0xff
	mov r7, #0
	b _022F1B08
_022F1AF0:
	mov r8, r7
_022F1AF4:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r6], #1
	blt _022F1AF4
	add r5, r5, #1
_022F1B08:
	cmp r5, r3
	blt _022F1AF0
_022F1B10:
	ldrsh r3, [r2, #8]
	cmp r3, #0
	ldrgtb r3, [r2, #1]
	addgt r4, r0, #0x400
	movgt r6, #0
	cmpgt r3, #0
	ble _022F1C58
	b _022F1C4C
_022F1B30:
	cmp r6, #0
	add r4, r4, #5
	mov r5, #0
	bne _022F1BA0
	mov r7, #0x80
	b _022F1B90
_022F1B48:
	ldrb sb, [r1], #1
	cmp sb, #0x80
	blt _022F1B84
	mov r8, r7
	b _022F1B70
_022F1B5C:
	mov sl, r4
	ldrb r3, [r4], #1
	add r8, r8, #1
	orr r3, r3, #0x80
	strb r3, [sl]
_022F1B70:
	cmp r8, sb
	ble _022F1B5C
	sub r3, sb, #0x7f
	add r5, r5, r3
	b _022F1B90
_022F1B84:
	add r3, sb, #1
	add r4, r4, r3
	add r5, r5, r3
_022F1B90:
	ldrb r8, [r2]
	cmp r5, r8
	blt _022F1B48
	b _022F1C3C
_022F1BA0:
	sub r7, r4, #0x100
	mov ip, #0x80
	mov r3, r5
	b _022F1C30
_022F1BB0:
	ldrb lr, [r1], #1
	cmp lr, #0x80
	blt _022F1BF8
	mov r8, ip
	b _022F1BE4
_022F1BC4:
	ldrb sb, [r7], #1
	add r8, r8, #1
	tst sb, #0x80
	moveq sl, r4
	ldreqb sb, [r4], #1
	addne r4, r4, #1
	orreq sb, sb, #0x80
	streqb sb, [sl]
_022F1BE4:
	cmp r8, lr
	ble _022F1BC4
	sub r8, lr, #0x7f
	add r5, r5, r8
	b _022F1C30
_022F1BF8:
	mov r8, r3
	b _022F1C20
_022F1C00:
	ldrb sb, [r7], #1
	add r8, r8, #1
	tst sb, #0x80
	movne sl, r4
	ldrneb sb, [r4], #1
	addeq r4, r4, #1
	orrne sb, sb, #0x80
	strneb sb, [sl]
_022F1C20:
	cmp r8, lr
	ble _022F1C00
	add r8, lr, #1
	add r5, r5, r8
_022F1C30:
	ldrb r8, [r2]
	cmp r5, r8
	blt _022F1BB0
_022F1C3C:
	rsb r3, r8, #0x100
	sub r3, r3, #5
	add r4, r4, r3
	add r6, r6, #1
_022F1C4C:
	ldrb r3, [r2, #1]
	cmp r6, r3
	blt _022F1B30
_022F1C58:
	ldrsh r3, [r2, #8]
	cmp r3, #1
	ldrgtb r4, [r2, #1]
	addgt r3, r0, #0x400
	movgt r5, #0
	cmpgt r4, #0
	ble _022F1DA0
	b _022F1D94
_022F1C78:
	cmp r5, #0
	add r3, r3, #5
	mov r4, #0
	bne _022F1CE8
	mov r6, #0x80
	b _022F1CD8
_022F1C90:
	ldrb r8, [r1], #1
	cmp r8, #0x80
	blt _022F1CCC
	mov r7, r6
	b _022F1CB8
_022F1CA4:
	mov sb, r3
	ldrb r0, [r3], #1
	add r7, r7, #1
	orr r0, r0, #0x40
	strb r0, [sb]
_022F1CB8:
	cmp r7, r8
	ble _022F1CA4
	sub r0, r8, #0x7f
	add r4, r4, r0
	b _022F1CD8
_022F1CCC:
	add r0, r8, #1
	add r3, r3, r0
	add r4, r4, r0
_022F1CD8:
	ldrb r8, [r2]
	cmp r4, r8
	blt _022F1C90
	b _022F1D84
_022F1CE8:
	sub r7, r3, #0x100
	mov r0, #0x80
	mov sb, r4
	b _022F1D78
_022F1CF8:
	ldrb r6, [r1], #1
	cmp r6, #0x80
	blt _022F1D40
	mov fp, r0
	b _022F1D2C
_022F1D0C:
	ldrb r8, [r7], #1
	add fp, fp, #1
	tst r8, #0x40
	moveq sl, r3
	ldreqb r8, [r3], #1
	addne r3, r3, #1
	orreq r8, r8, #0x40
	streqb r8, [sl]
_022F1D2C:
	cmp fp, r6
	ble _022F1D0C
	sub r6, r6, #0x7f
	add r4, r4, r6
	b _022F1D78
_022F1D40:
	mov fp, sb
	b _022F1D68
_022F1D48:
	ldrb r8, [r7], #1
	add fp, fp, #1
	tst r8, #0x40
	movne sl, r3
	ldrneb r8, [r3], #1
	addeq r3, r3, #1
	orrne r8, r8, #0x40
	strneb r8, [sl]
_022F1D68:
	cmp fp, r6
	ble _022F1D48
	add r6, r6, #1
	add r4, r4, r6
_022F1D78:
	ldrb r8, [r2]
	cmp r4, r8
	blt _022F1CF8
_022F1D84:
	rsb r0, r8, #0x100
	sub r0, r0, #5
	add r3, r3, r0
	add r5, r5, #1
_022F1D94:
	ldrb r0, [r2, #1]
	cmp r5, r0
	blt _022F1C78
_022F1DA0:
	mov r0, r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022F1800

	arm_func_start ov11_022F1DA8
ov11_022F1DA8: ; 0x022F1DA8
	stmdb sp!, {r3, lr}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_022F1DB8: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _022F1DD0 ; case 1
	b _022F1DE8 ; case 2
	b _022F1E00 ; case 3
	b _022F1E18 ; case 4
	b _022F1E2C ; case 5
_022F1DD0:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1DE8:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1E00:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1E18:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0]
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_022F1E2C:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #0
	ldr r0, [r0]
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1E40: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1DA8

	arm_func_start ov11_022F1E44
ov11_022F1E44: ; 0x022F1E44
	stmdb sp!, {r3, lr}
	cmp r0, #1
	cmpne r0, #3
	bne _022F1E64
	ldr r0, _022F1E6C ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl ov11_022EE60C
	ldmia sp!, {r3, pc}
_022F1E64:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1E6C: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1E44

	arm_func_start ov11_022F1E70
ov11_022F1E70: ; 0x022F1E70
	ldr r1, _022F1E88 ; =GROUND_STATE_MAP
	ldr ip, _022F1E8C ; =ov11_022EF2BC
	mov r2, r0
	ldr r0, [r1]
	mov r1, #0
	bx ip
	.align 2, 0
_022F1E88: .word GROUND_STATE_MAP
_022F1E8C: .word ov11_022EF2BC
	arm_func_end ov11_022F1E70

	arm_func_start ov11_022F1E90
ov11_022F1E90: ; 0x022F1E90
	ldr r3, _022F1EA4 ; =GROUND_STATE_MAP
	ldr ip, _022F1EA8 ; =ov11_022EF40C
	mov r2, r1
	ldr r1, [r3]
	bx ip
	.align 2, 0
_022F1EA4: .word GROUND_STATE_MAP
_022F1EA8: .word ov11_022EF40C
	arm_func_end ov11_022F1E90

	arm_func_start ov11_022F1EAC
ov11_022F1EAC: ; 0x022F1EAC
	ldr r2, _022F1EC4 ; =GROUND_STATE_MAP
	mov r1, r0
	ldr r0, [r2, #4]
	ldr ip, _022F1EC8 ; =ov11_022F03F8
	add r0, r0, #4
	bx ip
	.align 2, 0
_022F1EC4: .word GROUND_STATE_MAP
_022F1EC8: .word ov11_022F03F8
	arm_func_end ov11_022F1EAC

	arm_func_start ov11_022F1ECC
ov11_022F1ECC: ; 0x022F1ECC
	ldr r2, _022F1EE4 ; =GROUND_STATE_MAP
	mov r1, r0
	ldr r0, [r2, #4]
	ldr ip, _022F1EE8 ; =ov11_022F040C
	add r0, r0, #4
	bx ip
	.align 2, 0
_022F1EE4: .word GROUND_STATE_MAP
_022F1EE8: .word ov11_022F040C
	arm_func_end ov11_022F1ECC

	arm_func_start ov11_022F1EEC
ov11_022F1EEC: ; 0x022F1EEC
	ldr r1, _022F1F00 ; =GROUND_STATE_MAP
	ldr ip, _022F1F04 ; =ov11_022F03C4
	ldr r1, [r1, #4]
	add r1, r1, #0x20
	bx ip
	.align 2, 0
_022F1F00: .word GROUND_STATE_MAP
_022F1F04: .word ov11_022F03C4
	arm_func_end ov11_022F1EEC

	arm_func_start ov11_022F1F08
ov11_022F1F08: ; 0x022F1F08
	stmdb sp!, {r3, lr}
	ldr r2, _022F1F38 ; =GROUND_STATE_MAP
	mov r3, r0
	ldr r0, [r2]
	mov r2, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, r3
	bl ov11_022EF498
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1F38: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1F08

	arm_func_start ov11_022F1F3C
ov11_022F1F3C: ; 0x022F1F3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022F2044 ; =GROUND_STATE_MAP
	mov r7, r0
	ldr r0, [r2]
	mov r6, r1
	cmp r0, #0
	ldrne r2, [r2, #4]
	mvnne r1, #0
	ldrnesh r4, [r2]
	cmpne r4, r1
	beq _022F203C
	mov r3, #0xc
	mov r1, r7
	mov r2, r6
	smulbb r4, r4, r3
	ldr r5, _022F2048 ; =EVENTS
	bl ov11_022EF498
	ldr r0, [r7]
	add r0, r0, #0x8000
	str r0, [r7]
	bl ov11_0231145C
	cmp r0, #0
	ldrne r0, [r7, #4]
	addne r0, r0, #0x12000
	strne r0, [r7, #4]
	bne _022F1FC0
	bl ov11_0231195C
	cmp r0, #0
	ldr r0, [r7, #4]
	addne r0, r0, #0x16000
	strne r0, [r7, #4]
	addeq r0, r0, #0x6000
	streq r0, [r7, #4]
_022F1FC0:
	ldr r0, [r6]
	sub r0, r0, #0x8000
	str r0, [r6]
	ldr r0, [r6, #4]
	sub r0, r0, #0x6000
	str r0, [r6, #4]
	ldrsh r0, [r5, r4]
	cmp r0, #0xa
	bne _022F2014
	ldr r0, [r7]
	add r0, r0, #0x1800
	str r0, [r7]
	ldr r0, [r7, #4]
	add r0, r0, #0x1800
	str r0, [r7, #4]
	ldr r0, [r6]
	sub r0, r0, #0x1800
	str r0, [r6]
	ldr r0, [r6, #4]
	sub r0, r0, #0x1800
	str r0, [r6, #4]
_022F2014:
	ldr r1, [r7]
	ldr r0, [r6]
	cmp r1, r0
	strgt r1, [r6]
	ldr r1, [r7, #4]
	ldr r0, [r6, #4]
	cmp r1, r0
	strgt r1, [r6, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022F203C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F2044: .word GROUND_STATE_MAP
_022F2048: .word EVENTS
	arm_func_end ov11_022F1F3C

	arm_func_start ov11_022F204C
ov11_022F204C: ; 0x022F204C
	stmdb sp!, {r3, lr}
	ldr r2, _022F20C8 ; =GROUND_STATE_MAP
	ldr r3, [r0]
	ldr r0, [r0, #4]
	ldr r2, [r2]
	add r0, r3, r0, lsl #8
	add r0, r0, #5
	ldr r2, [r2, #0x2d8]
	ldr r3, [r1, #4]
	add r0, r0, #0x400
	cmp r2, #0
	add r2, r2, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	b _022F20B8
_022F2088:
	mov lr, r2
	ldr ip, [r1]
	b _022F20A8
_022F2094:
	ldrb r0, [lr], #1
	tst r0, #0x88
	movne r0, #1
	ldmneia sp!, {r3, pc}
	sub ip, ip, #1
_022F20A8:
	cmp ip, #0
	bgt _022F2094
	add r2, r2, #0x100
	sub r3, r3, #1
_022F20B8:
	cmp r3, #0
	bgt _022F2088
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F20C8: .word GROUND_STATE_MAP
	arm_func_end ov11_022F204C

	arm_func_start ov11_022F20CC
ov11_022F20CC: ; 0x022F20CC
	stmdb sp!, {r3, lr}
	ldr r2, _022F2148 ; =GROUND_STATE_MAP
	ldr r3, [r0]
	ldr r0, [r0, #4]
	ldr r2, [r2]
	add r0, r3, r0, lsl #8
	add r0, r0, #5
	ldr r2, [r2, #0x2d8]
	ldr r3, [r1, #4]
	add r0, r0, #0x400
	cmp r2, #0
	add r2, r2, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	b _022F2138
_022F2108:
	mov lr, r2
	ldr ip, [r1]
	b _022F2128
_022F2114:
	ldrb r0, [lr], #1
	tst r0, #0x48
	movne r0, #1
	ldmneia sp!, {r3, pc}
	sub ip, ip, #1
_022F2128:
	cmp ip, #0
	bgt _022F2114
	add r2, r2, #0x100
	sub r3, r3, #1
_022F2138:
	cmp r3, #0
	bgt _022F2108
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2148: .word GROUND_STATE_MAP
	arm_func_end ov11_022F20CC

	arm_func_start ov11_022F214C
ov11_022F214C: ; 0x022F214C
	stmdb sp!, {r4, lr}
	ldr ip, _022F2174 ; =GROUND_STATE_MAP
	mov r4, r0
	mov lr, r1
	mov r3, r2
	ldr r0, [ip]
	mov r1, r4
	mov r2, lr
	bl ov11_022EF4C0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F2174: .word GROUND_STATE_MAP
	arm_func_end ov11_022F214C

	arm_func_start ov11_022F2178
ov11_022F2178: ; 0x022F2178
	stmdb sp!, {r3, lr}
	bl ov11_022F27F0
	bl ov11_022F30FC
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022F2178

	arm_func_start ov11_022F2188
ov11_022F2188: ; 0x022F2188
	ldr ip, _022F2190 ; =ov11_022F37D0
	bx ip
	.align 2, 0
_022F2190: .word ov11_022F37D0
	arm_func_end ov11_022F2188

	arm_func_start ov11_022F2194
ov11_022F2194: ; 0x022F2194
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _022F2230
	add r1, sp, #0
	mov r0, #0
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	add r1, sp, #0
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #4
	bl ov11_022F042C
	cmp r0, #0
	beq _022F2214
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F2214:
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
_022F2230:
	bl ov11_022F27F4
	bl ov11_022F3E70
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2240: .word GROUND_STATE_MAP
	arm_func_end ov11_022F2194

	arm_func_start ov11_022F2244
ov11_022F2244: ; 0x022F2244
	stmdb sp!, {r3, lr}
	ldr r0, _022F2274 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	ldrb r1, [r1, #3]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	beq _022F2268
	bl ov11_022EFB70
_022F2268:
	bl ov11_022F2924
	bl ov11_022F4358
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2274: .word GROUND_STATE_MAP
	arm_func_end ov11_022F2244

	arm_func_start ov11_022F2278
ov11_022F2278: ; 0x022F2278
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x28
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F22C4 ; =ov11_02324CC8
	mov ip, #0
	str r0, [r1]
	strb ip, [r0, #9]
	ldr r2, [r1]
	mov r0, r4
	strb ip, [r2, #8]
	ldr r3, [r1]
	sub r2, ip, #1
	str r4, [r3, #4]
	ldr r1, [r1]
	strh r2, [r1]
	bl ov11_022F22F4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F22C4: .word ov11_02324CC8
	arm_func_end ov11_022F2278

	arm_func_start ov11_022F22C8
ov11_022F22C8: ; 0x022F22C8
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov11_022F22F4
	ldr r0, _022F22F0 ; =ov11_02324CC8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F22F0 ; =ov11_02324CC8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F22F0: .word ov11_02324CC8
	arm_func_end ov11_022F22C8

	arm_func_start ov11_022F22F4
ov11_022F22F4: ; 0x022F22F4
	stmdb sp!, {r4, lr}
	ldr r1, _022F2598 ; =ov11_02324CC8
	mov r4, r0
	ldr r0, [r1]
	ldr r2, [r0, #4]
	cmp r2, #3
	bne _022F231C
	ldr r0, [r1, #4]
	bl ov11_022EE138
	b _022F2344
_022F231C:
	sub r0, r2, #4
	cmp r0, #3
	bhi _022F2334
	ldr r0, [r1, #4]
	bl ov11_022EE210
	b _022F2344
_022F2334:
	cmp r2, #8
	bne _022F2344
	ldr r0, [r1, #4]
	bl ov11_022EE2D0
_022F2344:
	ldr r0, _022F2598 ; =ov11_02324CC8
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #1
	strb r3, [r1, #9]
	ldr r1, [r0]
	strb r3, [r1, #8]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	strh r2, [r1]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022F239C
	bl ov11_022EBEAC
	ldr r0, _022F2598 ; =ov11_02324CC8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F2598 ; =ov11_02324CC8
	mov r1, #0
	str r1, [r0, #4]
	bl ov11_022F2AC4
_022F239C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F2598 ; =ov11_02324CC8
	cmp r4, #3
	str r0, [r1, #4]
	bne _022F23F8
	bl ov11_022EE0C8
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F23F8:
	cmp r4, #4
	bne _022F243C
	mov r1, #2
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F243C:
	cmp r4, #5
	bne _022F2480
	mov r1, #3
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2480:
	cmp r4, #6
	bne _022F24C4
	mov r1, #4
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F24C4:
	cmp r4, #7
	bne _022F2508
	mov r1, #1
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2508:
	cmp r4, #8
	bne _022F2548
	bl ov11_022EE268
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2548:
	cmp r4, #1
	ldreq r1, _022F259C ; =ov11_02321040
	ldr r0, _022F2598 ; =ov11_02324CC8
	ldrne r1, _022F25A0 ; =ov11_0232105C
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	ldr r0, _022F2598 ; =ov11_02324CC8
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _022F2598 ; =ov11_02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
_022F2584:
	ldr r0, _022F2598 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F2598: .word ov11_02324CC8
_022F259C: .word ov11_02321040
_022F25A0: .word ov11_0232105C
	arm_func_end ov11_022F22F4

	arm_func_start ov11_022F25A4
ov11_022F25A4: ; 0x022F25A4
	stmdb sp!, {r4, lr}
	ldr r1, _022F26D0 ; =ov11_02324CC8
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _022F26D4 ; =ov11_02321078
	ldr r3, [r0, #4]
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r2, _022F26D0 ; =ov11_02324CC8
	mov r1, #0
	ldr r0, [r2]
	strb r1, [r0, #9]
	ldr r0, [r2]
	strb r1, [r0, #8]
	ldr r0, [r2]
	strh r4, [r0]
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #1
	cmp r4, r0
	bne _022F2628
	ldr r0, [r2, #4]
	sub r1, r1, #1
	bl ov11_022EC27C
	ldr r0, _022F26D0 ; =ov11_02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _022F26BC
_022F2628:
	ldr r1, _022F26D8 ; =GROUND_WEATHER_TABLE
	mov r0, r4, lsl #2
	ldrsh r0, [r1, r0]
	add r4, r1, r4, lsl #2
	ldrsh r1, [r4, #2]
	cmp r0, #2
	ldr r0, [r2, #4]
	bne _022F2650
	bl ov11_022EC240
	b _022F2654
_022F2650:
	bl ov11_022EC27C
_022F2654:
	ldr r0, _022F26D0 ; =ov11_02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	cmp r0, #0
	beq _022F26BC
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	ldrsh r0, [r4]
	cmp r0, #1
	bne _022F26BC
	ldr r0, _022F26D0 ; =ov11_02324CC8
	mov r1, #2
	ldr r0, [r0, #4]
	bl ov11_022EE620
_022F26BC:
	ldr r0, _022F26D0 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F26D0: .word ov11_02324CC8
_022F26D4: .word ov11_02321078
_022F26D8: .word GROUND_WEATHER_TABLE
	arm_func_end ov11_022F25A4

	arm_func_start ov11_022F26DC
ov11_022F26DC: ; 0x022F26DC
	stmdb sp!, {r3, lr}
	cmp r0, #1
	beq _022F26FC
	cmp r0, #2
	beq _022F2714
	cmp r0, #3
	beq _022F272C
	ldmia sp!, {r3, pc}
_022F26FC:
	ldr r0, _022F2744 ; =ov11_02324CC8
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F2714:
	ldr r0, _022F2744 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F272C:
	ldr r0, _022F2744 ; =ov11_02324CC8
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2744: .word ov11_02324CC8
	arm_func_end ov11_022F26DC

	arm_func_start ov11_022F2748
ov11_022F2748: ; 0x022F2748
	ldr r2, _022F2764 ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F2768 ; =ov11_022EE144
	mov r1, r3
	bx ip
	.align 2, 0
_022F2764: .word ov11_02324CC8
_022F2768: .word ov11_022EE144
	arm_func_end ov11_022F2748

	arm_func_start ov11_022F276C
ov11_022F276C: ; 0x022F276C
	ldr r2, _022F2788 ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F278C ; =ov11_022EE15C
	mov r1, r3
	bx ip
	.align 2, 0
_022F2788: .word ov11_02324CC8
_022F278C: .word ov11_022EE15C
	arm_func_end ov11_022F276C

	arm_func_start ov11_022F2790
ov11_022F2790: ; 0x022F2790
	ldr r2, _022F27AC ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F27B0 ; =ov11_022EE17C
	mov r1, r3
	bx ip
	.align 2, 0
_022F27AC: .word ov11_02324CC8
_022F27B0: .word ov11_022EE17C
	arm_func_end ov11_022F2790

	arm_func_start ov11_022F27B4
ov11_022F27B4: ; 0x022F27B4
	ldr r2, _022F27D0 ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F27D4 ; =ov11_022EE230
	mov r1, r3
	bx ip
	.align 2, 0
_022F27D0: .word ov11_02324CC8
_022F27D4: .word ov11_022EE230
	arm_func_end ov11_022F27B4

	arm_func_start ov11_022F27D8
ov11_022F27D8: ; 0x022F27D8
	ldr r0, _022F27E8 ; =ov11_02324CC8
	ldr ip, _022F27EC ; =ov11_022EE21C
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_022F27E8: .word ov11_02324CC8
_022F27EC: .word ov11_022EE21C
	arm_func_end ov11_022F27D8

	arm_func_start ov11_022F27F0
ov11_022F27F0: ; 0x022F27F0
	bx lr
	arm_func_end ov11_022F27F0

	arm_func_start ov11_022F27F4
ov11_022F27F4: ; 0x022F27F4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr r0, _022F2914 ; =ov11_02324CC8
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #0
	beq _022F290C
	ldr r2, [r2, #4]
	sub r1, r2, #3
	cmp r1, #3
	bhi _022F283C
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _022F2914 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _022F290C
_022F283C:
	cmp r2, #7
	cmpne r2, #8
	beq _022F290C
	add r1, sp, #0x10
	mov r0, #0
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp, #0x10]
	streq r0, [sp, #0x14]
	add r0, sp, #8
	bl ov11_022F1E70
	ldr r0, _022F2914 ; =ov11_02324CC8
	add r1, sp, #0x10
	ldr r0, [r0]
	add r2, sp, #8
	add r0, r0, #0xc
	bl ov11_022F042C
	cmp r0, #0
	beq _022F28F0
	ldr r0, _022F2914 ; =ov11_02324CC8
	ldr r1, _022F2918 ; =GROUND_WEATHER_TABLE
	ldr r2, [r0]
	ldrsh r2, [r2]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bne _022F28CC
	add r0, sp, #0
	bl ov11_022F1E70
	ldr r0, _022F2914 ; =ov11_02324CC8
	add r2, sp, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
	b _022F28F0
_022F28CC:
	cmp r1, #2
	ldr r0, [r0, #4]
	mov r1, #0
	bne _022F28E8
	ldr r2, _022F291C ; =ov11_02321038
	bl ov11_022EF2D4
	b _022F28F0
_022F28E8:
	ldr r2, _022F2920 ; =ov11_02321030
	bl ov11_022EF2D4
_022F28F0:
	ldr r0, _022F2914 ; =ov11_02324CC8
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _022F2914 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
_022F290C:
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2914: .word ov11_02324CC8
_022F2918: .word GROUND_WEATHER_TABLE
_022F291C: .word ov11_02321038
_022F2920: .word ov11_02321030
	arm_func_end ov11_022F27F4

	arm_func_start ov11_022F2924
ov11_022F2924: ; 0x022F2924
	stmdb sp!, {r3, lr}
	ldr r0, _022F2948 ; =ov11_02324CC8
	ldr r1, [r0]
	ldrb r1, [r1, #9]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #4]
	bl ov11_022EFB70
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2948: .word ov11_02324CC8
	arm_func_end ov11_022F2924

	arm_func_start ov11_022F294C
ov11_022F294C: ; 0x022F294C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _022F2AA0 ; =ov11_02324CD0
	mvn r3, #0
	str r0, [r2, #0xc]
	strh r3, [r2, #4]
	ldr r0, _022F2AA4 ; =ov11_02321278
	mov r1, #0xd80
	strh r3, [r2, #2]
	bl Debug_Print0
	bl ov11_022F2F1C
	ldr r0, _022F2AA0 ; =ov11_02324CD0
	mov r1, #1
	strb r1, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _022F29A4
	cmp r0, #2
	beq _022F2A14
	cmp r0, #3
	beq _022F2A58
	b _022F2A98
_022F29A4:
	ldr r1, _022F2AA8 ; =ov11_02321298
	add r0, sp, #0
	mov r2, #0
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r1, _022F2AAC ; =ov11_023212B0
	add r0, sp, #0
	mov r2, #0
	bl LoadWteFromRom
	add r0, sp, #0
	mov r1, #0x4000
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _022F2AB0 ; =ov11_023212C8
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =ov11_02324CD0
	str r0, [r1, #8]
	b _022F2A98
_022F2A14:
	ldr r1, _022F2AB4 ; =ov11_023212E0
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _022F2AB8 ; =ov11_023212F8
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =ov11_02324CD0
	str r0, [r1, #8]
	b _022F2A98
_022F2A58:
	ldr r1, _022F2ABC ; =ov11_02321310
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _022F2AC0 ; =ov11_02321328
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =ov11_02324CD0
	str r0, [r1, #8]
_022F2A98:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2AA0: .word ov11_02324CD0
_022F2AA4: .word ov11_02321278
_022F2AA8: .word ov11_02321298
_022F2AAC: .word ov11_023212B0
_022F2AB0: .word ov11_023212C8
_022F2AB4: .word ov11_023212E0
_022F2AB8: .word ov11_023212F8
_022F2ABC: .word ov11_02321310
_022F2AC0: .word ov11_02321328
	arm_func_end ov11_022F294C

	arm_func_start ov11_022F2AC4
ov11_022F2AC4: ; 0x022F2AC4
	stmdb sp!, {r3, lr}
	bl ov11_022F2F1C
	ldr r0, _022F2AF8 ; =ov11_02324CD0
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022F2AFC ; =ov11_02324CD8
	bl sub_0201E020
	ldr r0, _022F2AF8 ; =ov11_02324CD0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2AF8: .word ov11_02324CD0
_022F2AFC: .word ov11_02324CD8
	arm_func_end ov11_022F2AC4

	arm_func_start ov11_022F2B00
ov11_022F2B00: ; 0x022F2B00
	cmp r0, #1
	bxne lr
	ldr r0, _022F2B24 ; =ov11_02324CD0
	ldr r2, [r0, #0xc]
	cmp r2, #3
	streqh r1, [r0, #2]
	ldreqsh r1, [r0, #2]
	streqh r1, [r0, #4]
	bx lr
	.align 2, 0
_022F2B24: .word ov11_02324CD0
	arm_func_end ov11_022F2B00

	arm_func_start ov11_022F2B28
ov11_022F2B28: ; 0x022F2B28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r7, _022F2F04 ; =ov11_02324CD0
	mov r5, r1
	ldr r0, [r7, #0xc]
	cmp r0, #1
	beq _022F2B58
	cmp r0, #2
	beq _022F2C68
	cmp r0, #3
	beq _022F2D7C
	b _022F2ECC
_022F2B58:
	ldr r0, _022F2F08 ; =0x0000049C
	ldr sb, _022F2F0C ; =ov11_023892A0
	rsb r6, r0, #0x39c
	mov r4, #0
	mov fp, r6
_022F2B6C:
	mov r0, #0x48
	mul r8, r4, r0
	ldr r0, [r5]
	mov r1, #0x480
	add sl, sb, r8
	bl _s32_div_f
	ldr r0, _022F2F10 ; =ov11_023210D4
	ldr r0, [r0, r4, lsl #2]
	sub r0, r0, r1
	str r0, [sb, r8]
	ldr r0, [r5, #4]
	ldr r1, _022F2F08 ; =0x0000049C
	bl _s32_div_f
	ldr r0, _022F2F10 ; =ov11_023210D4
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x8c]
	sub r0, r0, r1
	str r0, [sl, #4]
	ldr r0, [sb, r8]
	cmp r0, #0x100
	bgt _022F2BC8
	cmp r0, r6
	bge _022F2BD0
_022F2BC8:
	mov r0, #0x12c
	str r0, [sl]
_022F2BD0:
	ldr r0, [sl, #4]
	cmp r0, #0x100
	bgt _022F2BE4
	cmp r0, fp
	bge _022F2BEC
_022F2BE4:
	mov r0, #0x12c
	str r0, [sl, #4]
_022F2BEC:
	mov r0, #0x48
	mul r8, r4, r0
	add sl, sb, r8
	mov r0, #0
	strb r0, [sl, #0x44]
	ldr r3, _022F2F10 ; =ov11_023210D4
	str r0, [sp]
	str r0, [sp, #4]
	add r3, r3, r4, lsl #2
	ldr r1, [r7, #8]
	ldr r3, [r3, #0x118]
	add r0, sl, #8
	mov r2, #0
	bl sub_0201E7D8
	ldr r0, [sb, r8]
	add r4, r4, #1
	strh r0, [sl, #8]
	ldr r0, [sl, #4]
	cmp r4, #0x23
	strh r0, [sl, #0xa]
	mov r0, #0x34
	strb r0, [sl, #0x37]
	ldrb r0, [sl, #0x45]
	bic r0, r0, #2
	strb r0, [sl, #0x45]
	mov r0, #0x3f
	strb r0, [sl, #0x46]
	mov r0, #0x7e
	strh r0, [sl, #0x32]
	blt _022F2B6C
	b _022F2ECC
_022F2C68:
	ldr r6, _022F2F0C ; =ov11_023892A0
	mov sl, #0
	mvn r4, #0xff
_022F2C74:
	mov r0, #0x48
	mul r8, sl, r0
	mov r0, sl
	mov r1, #5
	add sb, r6, r8
	bl _s32_div_f
	ldr r0, _022F2F14 ; =ov11_023210AC
	ldr r3, [r0, r1, lsl #2]
	ldr r1, [r5]
	mov r0, sl
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #23
	add r1, r2, r1, ror #23
	sub r1, r3, r1
	str r1, [r6, r8]
	mov r1, #5
	bl _s32_div_f
	mov fp, r0
	ldr r0, [r5, #4]
	mov r1, #0x300
	bl _s32_div_f
	ldr r0, _022F2F14 ; =ov11_023210AC
	add r0, r0, fp, lsl #2
	ldr r0, [r0, #0x14]
	sub r0, r0, r1
	str r0, [sb, #4]
	ldr r0, [r6, r8]
	cmp r0, #0x100
	bgt _022F2CF0
	cmp r0, r4
	bge _022F2CF8
_022F2CF0:
	mov r0, #0x12c
	str r0, [sb]
_022F2CF8:
	ldr r0, [sb, #4]
	cmp r0, #0x100
	bgt _022F2D0C
	cmp r0, r4
	bge _022F2D14
_022F2D0C:
	mov r0, #0x12c
	str r0, [sb, #4]
_022F2D14:
	mov r0, #0
	strb r0, [sb, #0x44]
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r1, [r7, #8]
	add r0, sb, #8
	mov r3, r2
	bl sub_0201E7D8
	ldr r0, [sb]
	add sl, sl, #1
	strh r0, [sb, #8]
	ldr r0, [sb, #4]
	cmp sl, #0x19
	strh r0, [sb, #0xa]
	mov r0, #0x80
	strb r0, [sb, #0x37]
	ldrb r0, [sb, #0x45]
	bic r0, r0, #2
	strb r0, [sb, #0x45]
	mov r0, #0x3f
	strb r0, [sb, #0x46]
	mov r0, #0x7e
	strh r0, [sb, #0x32]
	blt _022F2C74
	b _022F2ECC
_022F2D7C:
	ldrsh r1, [r7, #4]
	cmp r1, #0
	blt _022F2DB4
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movle r0, #0
	ble _022F2DB8
	sub r0, r0, #1
	strh r0, [r7, #2]
	ldrsh r2, [r7, #2]
	mov r0, #0xa0
	smulbb r0, r2, r0
	bl _s32_div_f
	b _022F2DB8
_022F2DB4:
	mov r0, #0xa0
_022F2DB8:
	ldr fp, _022F2F0C ; =ov11_023892A0
	mov sl, #0
	and r6, r0, #0xff
	mvn r4, #0xff
_022F2DC8:
	mov r0, #0x48
	mul r8, sl, r0
	mov r0, sl
	mov r1, #5
	add sb, fp, r8
	bl _s32_div_f
	mov r7, r1
	ldr r0, [r5]
	mov r1, #0xf0
	bl _s32_div_f
	ldr r0, _022F2F18 ; =ov11_02321098
	ldr r2, [r0, r7, lsl #2]
	mov r0, sl
	sub r1, r2, r1
	str r1, [fp, r8]
	mov r1, #5
	bl _s32_div_f
	mov r7, r0
	ldr r0, [r5, #4]
	mov r1, #0x300
	bl _s32_div_f
	ldr r0, _022F2F14 ; =ov11_023210AC
	add r0, r0, r7, lsl #2
	ldr r0, [r0, #0x14]
	sub r0, r0, r1
	str r0, [sb, #4]
	ldr r0, [fp, r8]
	cmp r0, #0x100
	bgt _022F2E44
	cmp r0, r4
	bge _022F2E4C
_022F2E44:
	mov r0, #0x12c
	str r0, [sb]
_022F2E4C:
	ldr r0, [sb, #4]
	cmp r0, #0x100
	bgt _022F2E60
	cmp r0, r4
	bge _022F2E68
_022F2E60:
	mov r0, #0x12c
	str r0, [sb, #4]
_022F2E68:
	mov r0, #0
	strb r0, [sb, #0x44]
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, _022F2F04 ; =ov11_02324CD0
	mov r2, #0
	ldr r1, [r1, #8]
	add r0, sb, #8
	mov r3, r2
	bl sub_0201E7D8
	ldr r0, [sb]
	add sl, sl, #1
	strh r0, [sb, #8]
	ldr r0, [sb, #4]
	cmp sl, #0x19
	strh r0, [sb, #0xa]
	strb r6, [sb, #0x37]
	ldrb r0, [sb, #0x45]
	bic r0, r0, #2
	strb r0, [sb, #0x45]
	mov r0, #0x3f
	strb r0, [sb, #0x46]
	mov r0, #0x7e
	strh r0, [sb, #0x32]
	blt _022F2DC8
_022F2ECC:
	ldr r5, _022F2F0C ; =ov11_023892A0
	mov r6, #0
	mov r4, #0x48
_022F2ED8:
	mla r1, r6, r4, r5
	ldrb r0, [r1, #0x45]
	tst r0, #2
	bne _022F2EF0
	add r0, r1, #8
	bl Render3dElement64
_022F2EF0:
	add r6, r6, #1
	cmp r6, #0x30
	blt _022F2ED8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F2F04: .word ov11_02324CD0
_022F2F08: .word 0x0000049C
_022F2F0C: .word ov11_023892A0
_022F2F10: .word ov11_023210D4
_022F2F14: .word ov11_023210AC
_022F2F18: .word ov11_02321098
	arm_func_end ov11_022F2B28

	arm_func_start ov11_022F2F1C
ov11_022F2F1C: ; 0x022F2F1C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _022F2F54 ; =ov11_023892A0
	mov r6, #0
	mov r4, #0x48
_022F2F2C:
	mla r7, r6, r4, r5
	add r0, r7, #8
	bl InitRender3dElement64
	ldrb r0, [r7, #0x45]
	add r6, r6, #1
	cmp r6, #0x30
	orr r0, r0, #2
	strb r0, [r7, #0x45]
	blt _022F2F2C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F2F54: .word ov11_023892A0
	arm_func_end ov11_022F2F1C

	arm_func_start ov11_022F2F58
ov11_022F2F58: ; 0x022F2F58
	stmdb sp!, {r3, lr}
	mov r0, #0x358
	mov r1, #1
	bl MemAlloc
	ldr r2, _022F2FE4 ; =ov11_02324CE0
	mov r1, #0
	str r0, [r2]
	str r1, [r0]
	ldr r0, [r2]
	strh r1, [r0, #4]
	ldr r0, [r2]
	strh r1, [r0, #6]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh r1, [r0, #0x38]
	ldr r0, [r2]
	strb r1, [r0, #0x10]
	ldr r0, [r2]
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	strb r1, [r0, #0x12]
	ldr r0, [r2]
	strb r1, [r0, #0x13]
	ldr r0, [r2]
	strb r1, [r0, #0x14]
	ldr r0, [r2]
	strb r1, [r0, #0x16]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	bl ov11_022F3010
	ldr r0, _022F2FE4 ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x354]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2FE4: .word ov11_02324CE0
	arm_func_end ov11_022F2F58

	arm_func_start ov11_022F2FE8
ov11_022F2FE8: ; 0x022F2FE8
	stmdb sp!, {r3, lr}
	bl ov11_022F3010
	ldr r0, _022F300C ; =ov11_02324CE0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F300C ; =ov11_02324CE0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F300C: .word ov11_02324CE0
	arm_func_end ov11_022F2FE8

	arm_func_start ov11_022F3010
ov11_022F3010: ; 0x022F3010
	stmdb sp!, {r3, lr}
	bl ov11_022F4480
	ldr r2, _022F3050 ; =ov11_02324CE0
	mov r3, #0
	ldr r0, [r2]
	mov r1, #0x10
	str r3, [r0]
	ldr r0, [r2]
	strh r3, [r0, #4]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh r3, [r0, #0x38]
	ldr r0, [r2]
	add r0, r0, #0x344
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F3050: .word ov11_02324CE0
	arm_func_end ov11_022F3010

	arm_func_start ov11_022F3054
ov11_022F3054: ; 0x022F3054
	ldr r0, _022F3088 ; =ov11_02324CE0
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022F3088: .word ov11_02324CE0
	arm_func_end ov11_022F3054

	arm_func_start ov11_022F308C
ov11_022F308C: ; 0x022F308C
	ldr r0, _022F30D0 ; =ov11_02324CE0
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	beq _022F30C8
	ldr r0, [r1]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	bxls lr
_022F30C8:
	mov r0, #0
	bx lr
	.align 2, 0
_022F30D0: .word ov11_02324CE0
	arm_func_end ov11_022F308C

	arm_func_start ov11_022F30D4
ov11_022F30D4: ; 0x022F30D4
	ldr ip, _022F30F8 ; =ov11_02324CE0
	ldr r3, [ip]
	add r3, r3, #0x300
	strh r0, [r3, #0x38]
	ldr r0, [ip]
	str r1, [r0, #0x33c]
	ldr r0, [ip]
	str r2, [r0, #0x340]
	bx lr
	.align 2, 0
_022F30F8: .word ov11_02324CE0
	arm_func_end ov11_022F30D4

	arm_func_start ov11_022F30FC
ov11_022F30FC: ; 0x022F30FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	ldr r6, _022F37C4 ; =ov11_02324CE0
	ldr r2, [r6]
	ldr r0, [r2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022F373C
_022F311C: ; jump table
	b _022F350C ; case 0
	b _022F373C ; case 1
	b _022F3130 ; case 2
	b _022F373C ; case 3
	b _022F373C ; case 4
_022F3130:
	ldrsh r0, [r2, #4]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _022F373C
_022F3140: ; jump table
	b _022F373C ; case 0
	b _022F31A0 ; case 1
	b _022F373C ; case 2
	b _022F373C ; case 3
	b _022F3298 ; case 4
	b _022F3298 ; case 5
	b _022F3298 ; case 6
	b _022F3360 ; case 7
	b _022F373C ; case 8
	b _022F373C ; case 9
	b _022F3474 ; case 10
	b _022F373C ; case 11
	b _022F373C ; case 12
	b _022F3360 ; case 13
	b _022F3360 ; case 14
	b _022F373C ; case 15
	b _022F32FC ; case 16
	b _022F337C ; case 17
	b _022F337C ; case 18
	b _022F3360 ; case 19
	b _022F31A0 ; case 20
	b _022F3298 ; case 21
	b _022F3360 ; case 22
	b _022F3280 ; case 23
_022F31A0:
	add r1, r2, #0x100
	ldrh r3, [r1, #0xae]
	ldr r2, _022F37C8 ; =0x0000F3FF
	mov r4, #0x800
	orr r3, r3, #0x200
	strh r3, [r1, #0xae]
	ldr r1, [r6]
	mov r0, #0
	add r1, r1, #0x100
	strh r2, [r1, #0xa0]
	ldr r3, [r6]
	mov r1, r0
	add r3, r3, #0x100
	strh r4, [r3, #0xa6]
	ldr r5, [r6]
	mov r3, r0
	add r5, r5, #0x100
	strh r2, [r5, #0xa4]
	ldr r5, [r6]
	mov r2, #1
	add r5, r5, #0x100
	strh r4, [r5, #0xaa]
	bl sub_020091F8
	mov r0, #1
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #0
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #1
	str r0, [sp]
	mov r1, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r2, r4
	str r2, [sp, #8]
	bl sub_02009358
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0x800
	mov r2, r4
	add r0, r0, #0x1a0
	bl SetAnimDataFields2
	mov r0, r6
	ldr r3, [r0]
	mov r2, r4
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3280:
	mov r1, #0
	str r1, [r2, #0x32c]
	ldr r0, [r6]
	str r1, [r0, #0x330]
	ldr r0, [r6]
	str r1, [r0, #0x334]
_022F3298:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	ldr r5, _022F37C4 ; =ov11_02324CE0
	mov r6, #0
	str r0, [r5, #4]
	mov r4, #0xc4
_022F32B4:
	ldr r0, [r5, #4]
	ldr r1, [r5]
	mla r0, r6, r4, r0
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F32B4
	ldr r0, _022F37C4 ; =ov11_02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F32FC:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	mov r5, r6
	mov r6, #0
	str r0, [r5, #4]
	mov r4, #0xc4
_022F3318:
	ldr r0, [r5, #4]
	ldr r1, [r5]
	mla r0, r6, r4, r0
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F3318
	ldr r0, _022F37C4 ; =ov11_02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3360:
	strh r0, [r2, #6]
	ldr r0, [r6]
	mov r1, #0
	strh r1, [r0, #4]
	ldr r0, [r6]
	str r1, [r0]
	b _022F373C
_022F337C:
	add r0, r2, #0x1a0
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0x800
	mov r2, #0
	add r0, r0, #0x264
	bl SetAnimDataFields2
	mov r7, r6
	ldr r1, [r7]
	ldr r5, _022F37C8 ; =0x0000F3FF
	add r2, r1, #0x100
	ldrh r3, [r2, #0xae]
	mov r4, #0x800
	mov r0, #0
	orr r3, r3, #0x200
	strh r3, [r2, #0xae]
	ldr r3, [r7]
	mov r1, r0
	add r3, r3, #0x100
	strh r5, [r3, #0xa0]
	ldr r6, [r7]
	mov r2, #1
	add r6, r6, #0x100
	strh r4, [r6, #0xa6]
	ldr r6, [r7]
	mov r3, r0
	add r6, r6, #0x100
	strh r5, [r6, #0xa4]
	ldr r5, [r7]
	add r5, r5, #0x100
	strh r4, [r5, #0xaa]
	bl sub_020091F8
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, r0
	mov r2, r0
	str r0, [sp, #8]
	bl sub_02009358
	mov r0, r7
	ldr r3, [r0]
	mov r2, #0
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3474:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	mov r5, r6
	ldr r6, _022F37CC ; =0x00000802
	mov r8, #0
	str r0, [r5, #4]
	mov sl, r8
	sub r7, r6, #1
	mov r4, #0xc4
_022F349C:
	mul sb, r8, r4
	ldr r0, [r5, #4]
	ldr r1, [r5]
	add r0, r0, sb
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	cmp r8, #4
	movlt r1, r7
	movge r1, r6
	ldr r0, [r5, #4]
	mov r1, r1, lsl #0x10
	mov r2, sl
	add r0, r0, sb
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F349C
	ldr r0, _022F37C4 ; =ov11_02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F350C:
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	beq _022F373C
	strh r0, [r2, #4]
	ldr r2, [r6]
	mov r0, #0
	ldr r1, [r2, #0x33c]
	str r1, [r2, #8]
	ldr r2, [r6]
	ldr r1, [r2, #0x340]
	str r1, [r2, #0xc]
	ldr r1, [r6]
	add r1, r1, #0x300
	strh r0, [r1, #0x38]
	ldr r2, [r6]
	ldrsh r1, [r2, #4]
	cmp r1, #0x22
	addls pc, pc, r1, lsl #2
	b _022F3734
_022F355C: ; jump table
	b _022F3734 ; case 0
	b _022F35F8 ; case 1
	b _022F35F0 ; case 2
	b _022F35E8 ; case 3
	b _022F35F8 ; case 4
	b _022F35F8 ; case 5
	b _022F35F8 ; case 6
	b _022F35F8 ; case 7
	b _022F3734 ; case 8
	b _022F3734 ; case 9
	b _022F35F8 ; case 10
	b _022F3734 ; case 11
	b _022F3734 ; case 12
	b _022F3604 ; case 13
	b _022F35F8 ; case 14
	b _022F3734 ; case 15
	b _022F35F8 ; case 16
	b _022F35F8 ; case 17
	b _022F35F8 ; case 18
	b _022F35F8 ; case 19
	b _022F35F8 ; case 20
	b _022F35F8 ; case 21
	b _022F35F8 ; case 22
	b _022F35F8 ; case 23
	b _022F3610 ; case 24
	b _022F3638 ; case 25
	b _022F3650 ; case 26
	b _022F365C ; case 27
	b _022F3678 ; case 28
	b _022F3698 ; case 29
	b _022F36AC ; case 30
	b _022F36D4 ; case 31
	b _022F36F4 ; case 32
	b _022F3704 ; case 33
	b _022F3714 ; case 34
_022F35E8:
	bl ov11_022F4480
	b _022F373C
_022F35F0:
	bl ov11_022F4480
	b _022F373C
_022F35F8:
	mov r0, #1
	str r0, [r2]
	b _022F373C
_022F3604:
	mov r0, #1
	str r0, [r2]
	b _022F373C
_022F3610:
	mov r0, #1
	bl sub_0206AA5C
	bl sub_0206AB98
	mov r0, #0
	bl ov11_022F44D0
	mov r0, r6
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x354]
	b _022F373C
_022F3638:
	ldrb r1, [r2, #0x354]
	cmp r1, #0
	moveq r0, #1
	and r0, r0, #0xff
	bl ov11_022F44D0
	b _022F373C
_022F3650:
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F365C:
	bl ov10_022C3138
	mov r1, r6
	ldr r1, [r1]
	mov r0, #1
	strb r0, [r1, #0x354]
	bl ov11_022F44D0
	b _022F373C
_022F3678:
	ldr r1, [r2, #0x33c]
	mov r0, #1
	str r1, [r2, #0x344]
	ldr r2, [r6]
	ldr r1, [r2, #0x340]
	str r1, [r2, #0x348]
	bl ov11_022F44D0
	b _022F373C
_022F3698:
	ldr r1, [r2, #0x33c]
	mov r0, #1
	str r1, [r2, #0x34c]
	bl ov11_022F44D0
	b _022F373C
_022F36AC:
	ldr r0, [r2, #0x33c]
	str r0, [r2, #0x350]
	ldr r0, [r6]
	ldr r1, [r0, #0x34c]
	ldr r2, [r0, #0x350]
	add r0, r0, #0x344
	bl ov10_022C328C
	mov r0, #0
	bl ov11_022F44D0
	b _022F373C
_022F36D4:
	ldr r0, [r2, #0x33c]
	str r0, [r2, #0x350]
	ldr r0, [r6]
	ldr r0, [r0, #0x350]
	bl ov10_022C3324
	mov r0, #0
	bl ov11_022F44D0
	b _022F373C
_022F36F4:
	bl ov10_022C3890
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F3704:
	bl ov11_022F4480
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F3714:
	mov r1, #1
	str r1, [r2]
	bl ov11_022F44D0
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0
	strb r1, [r0, #0x354]
	b _022F373C
_022F3734:
	mov r0, #0
	strh r0, [r2, #4]
_022F373C:
	ldr r0, _022F37C4 ; =ov11_02324CE0
	ldr r1, [r0]
	ldrsh r0, [r1, #6]
	sub r0, r0, #0x18
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022F37BC
_022F3758: ; jump table
	b _022F3778 ; case 0
	b _022F3778 ; case 1
	b _022F3794 ; case 2
	b _022F37BC ; case 3
	b _022F379C ; case 4
	b _022F379C ; case 5
	b _022F379C ; case 6
	b _022F379C ; case 7
_022F3778:
	ldrb r0, [r1, #0x354]
	cmp r0, #0
	beq _022F378C
	bl sub_0206AD80
	b _022F37BC
_022F378C:
	bl ov11_022F44F8
	b _022F37BC
_022F3794:
	bl sub_0206ADB8
	b _022F37BC
_022F379C:
	bl ov10_022C3378
	cmp r0, #0
	beq _022F37BC
	sub r0, r0, #2
	cmp r0, #1
	bhi _022F37B8
	bl ov11_022F44F8
_022F37B8:
	bl ov10_022C34F0
_022F37BC:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F37C4: .word ov11_02324CE0
_022F37C8: .word 0x0000F3FF
_022F37CC: .word 0x00000802
	arm_func_end ov11_022F30FC

	arm_func_start ov11_022F37D0
ov11_022F37D0: ; 0x022F37D0
#ifdef EUROPE
#define OV11_022F37D0_LOAD_OFFSET 0x10
#else
#define OV11_022F37D0_LOAD_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #1
	bne _022F3DE0
	ldrsh r0, [r3, #4]
	cmp r0, #0x22
	addls pc, pc, r0, lsl #2
	b _022F3DE0
_022F37F8: ; jump table
	b _022F3DE0 ; case 0
	b _022F38AC ; case 1
	b _022F3DE0 ; case 2
	b _022F3DE0 ; case 3
	b _022F38DC ; case 4
	b _022F393C ; case 5
	b _022F399C ; case 6
	b _022F3B80 ; case 7
	b _022F3DE0 ; case 8
	b _022F3DE0 ; case 9
	b _022F3D50 ; case 10
	b _022F3DE0 ; case 11
	b _022F3DE0 ; case 12
	b _022F3BEC ; case 13
	b _022F3BBC ; case 14
	b _022F3DE0 ; case 15
	b _022F3A44 ; case 16
	b _022F3C64 ; case 17
	b _022F3CD0 ; case 18
	b _022F3A98 ; case 19
	b _022F38AC ; case 20
	b _022F39F0 ; case 21
	b _022F3884 ; case 22
	b _022F399C ; case 23
	b _022F3DE0 ; case 24
	b _022F3DE0 ; case 25
	b _022F3DE0 ; case 26
	b _022F3DE0 ; case 27
	b _022F3DE0 ; case 28
	b _022F3DE0 ; case 29
	b _022F3DE0 ; case 30
	b _022F3DE0 ; case 31
	b _022F3DE0 ; case 32
	b _022F3DE0 ; case 33
	b _022F3DB0 ; case 34
_022F3884:
	mov r0, #0xe
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F38AC:
	ldr r1, _022F3E4C ; =0x0000012D
	ldr r2, _022F3E50 ; =0x08080000
	add r0, r3, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F38DC:
	mov r0, #1
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E50 ; =0x08080000
	ldr r0, [r0]
	mov r1, #0xbd + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F393C:
	mov r0, #2
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E50 ; =0x08080000
	ldr r0, [r0]
	mov r1, #0xbd + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F399C:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #3
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E54 ; =0x08080005
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xb6 + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F39F0:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #4
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E54 ; =0x08080005
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xbe + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3A44:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #0x12
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
#ifdef EUROPE
	mov r1, #0x230
#else
	ldr r1, _022F3E58 ; =0x00000222
#endif
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	mov r2, #0x8000000
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3A98:
	bl ov16_0238CC94
	ldr r1, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r1]
	str r0, [r1, #0x33c]
	bl ov16_0238CCA8
	ldr r1, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r1]
	str r0, [r1, #0x340]
	mov r0, #0x11
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E5C ; =0x0B040000
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	ldr r1, [r0, #0x33c]
	add r0, r0, #0x18
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5BBC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E5C ; =0x0B040000
	ldr r1, [r0]
	add r0, r1, #0xdc
	ldr r1, [r1, #0x340]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5BBC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #4
	add r0, r0, #0x18
	bl SetAnimDataFields2
	bl ov16_0238CCA8
	bl FemaleToMaleForm
	ldr r1, _022F3E60 ; =0x00000807
	bl GetIdleAnimationType
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #0
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl SetAnimDataFields2
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x13]
	ldr r2, [r0]
	strb r3, [r2, #0x14]
	ldr r2, [r0]
	strb r3, [r2, #0x16]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3B80:
	mov r0, #5
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3BBC:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #7
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3BEC:
	bl ov11_02314684
	cmp r0, #0
	beq _022F3C28
	bl ov11_023146B0
	cmp r0, #0
	bne _022F3C10
	ldr r0, _022F3E64 ; =ov11_02321340
	bl Debug_Print0
	b _022F3DE0
_022F3C10:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023146D4
	b _022F3C44
_022F3C28:
	mov r0, #0xc
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
_022F3C44:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3C64:
	mov r0, #0xf
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E68 ; =0x0C080000
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xee + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xef + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x264
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r2, [r0]
	strb r3, [r2, #0x12]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3CD0:
	mov r0, #0x10
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xec + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xed + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x264
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r2, [r0]
	strb r3, [r2, #0x12]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3D50:
	mov r0, #8
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, _022F3E6C ; =0x0000010D
	ldr r0, [r0]
	ldr r2, _022F3E50 ; =0x08080000
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3DB0:
	mov r0, #0xb
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
#ifdef JAPAN
	mov r3, #2
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #0x11]
#else
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
#endif
	bl ov11_022F44F8
_022F3DE0:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldrb r0, [r1, #0x354]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsh r0, [r1, #6]
	sub r0, r0, #0x18
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022F3E34
_022F3E08: ; jump table
	b _022F3E28 ; case 0
	b _022F3E28 ; case 1
	b _022F3E28 ; case 2
	b _022F3E30 ; case 3
	b _022F3E30 ; case 4
	b _022F3E30 ; case 5
	b _022F3E30 ; case 6
	b _022F3E30 ; case 7
_022F3E28:
	bl sub_0206ABB0
	b _022F3E34
_022F3E30:
	bl ov10_022C31A4
_022F3E34:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x354]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F3E48: .word ov11_02324CE0
_022F3E4C: .word 0x0000012D + OV11_022F37D0_LOAD_OFFSET
_022F3E50: .word 0x08080000
_022F3E54: .word 0x08080005
#ifndef EUROPE
_022F3E58: .word 0x00000222
#endif
_022F3E5C: .word 0x0B040000
_022F3E60: .word 0x00000807
_022F3E64: .word ov11_02321340
_022F3E68: .word 0x0C080000
_022F3E6C: .word 0x0000010D + OV11_022F37D0_LOAD_OFFSET
	arm_func_end ov11_022F37D0

	arm_func_start ov11_022F3E70
ov11_022F3E70: ; 0x022F3E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _022F434C ; =ov11_02324CE0
	ldr r2, [r3]
	ldrsh r0, [r2, #6]
	cmp r0, #0x22
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3E8C: ; jump table
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 0
	b _022F3F18 ; case 1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 3
	b _022F3F38 ; case 4
	b _022F3F38 ; case 5
	b _022F3F38 ; case 6
	b _022F41C0 ; case 7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 9
	b _022F426C ; case 10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 11
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 12
	b _022F41C0 ; case 13
	b _022F41C0 ; case 14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 15
	b _022F3FF4 ; case 16
	b _022F41D0 ; case 17
	b _022F41D0 ; case 18
	b _022F40D0 ; case 19
	b _022F3F18 ; case 20
	b _022F3F38 ; case 21
	b _022F41C0 ; case 22
	b _022F3F38 ; case 23
	b _022F41C8 ; case 24
	b _022F41C8 ; case 25
	b _022F41C8 ; case 26
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 27
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 29
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 31
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 32
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 33
	b _022F4344 ; case 34
_022F3F18:
	mov r4, #0x8000
	str r4, [r3, #8]
	add r0, r2, #0x1a0
	ldr r1, _022F4350 ; =ov11_02324CE8
	mov r2, #0
	str r4, [r3, #0xc]
	bl AnimRelatedFunction__022F6F14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3F38:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov sl, #0xc4
	ldr r6, _022F4350 ; =ov11_02324CE8
	ldr r4, _022F434C ; =ov11_02324CE0
	mov r7, r8
	mov r5, r8
	mov sb, sl
_022F3F60:
	mov r0, r8
	bl ov11_0231598C
	ldrh r1, [r0]
	cmp r1, #0xff
	cmpne r1, #0
	beq _022F3FE4
	ldmib r0, {r3, fp}
	mov r2, r3, asr #0xb
	mov r1, fp, asr #0xb
	add r2, r3, r2, lsr #20
	add r1, fp, r1, lsr #20
	mov r2, r2, asr #0xc
	mov r3, r1, asr #0xc
	mov r1, r2, lsl #8
	str r1, [r4, #8]
	mov r1, r3, lsl #8
	str r1, [r4, #0xc]
	ldrh r1, [r0, #0x14]
	cmp r1, #8
	bhs _022F3FD0
	ldr r2, [r4, #4]
	ldr r1, [r0, #0xc]
	mla r0, r8, sl, r2
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r2, r7
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
_022F3FD0:
	ldr r0, [r4, #4]
	mov r1, r6
	mla r0, r8, sb, r0
	mov r2, r5
	bl AnimRelatedFunction__022F6F14
_022F3FE4:
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F3F60
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3FF4:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	mov r5, #0xc4
	ldr r6, _022F434C ; =ov11_02324CE0
	mov fp, sb
	mov r7, #1
	mov r4, r5
_022F4018:
	mov r0, sb
	bl ov11_023159B0
	mov r8, r0
	ldrh r0, [r8]
	cmp r0, #0xff
	beq _022F40C0
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	bne _022F4088
	mul sl, sb, r5
	ldr r0, [r6, #4]
	ldr r1, [r6]
	add r0, r0, sl
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r6, #4]
	ldr r1, [r8, #0xc]
	add r0, r0, sl
	bl ov11_022F4974
	ldr r0, [r6, #4]
	ldrh r1, [r8, #0x14]
	add r0, r0, sl
	mov r2, fp
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	strh r7, [r8, #0x16]
_022F4088:
	ldr r0, [r8, #8]
	cmp r0, #0xf000
	bls _022F40C0
	ldr r0, [r8, #4]
	ldr r1, _022F4350 ; =ov11_02324CE8
	sub r0, r0, #0x2000
	str r0, [r6, #8]
	ldr r0, [r8, #8]
	mov r2, #0
	sub r0, r0, #0x11000
	str r0, [r6, #0xc]
	ldr r0, [r6, #4]
	mla r0, sb, r4, r0
	bl AnimRelatedFunction__022F6F14
_022F40C0:
	add sb, sb, #1
	cmp sb, #0x40
	blt _022F4018
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F40D0:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl ov11_0231598C
	ldr r1, _022F434C ; =ov11_02324CE0
	mov r2, #0x8100
	mov r4, r0
	str r2, [r1, #8]
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _022F414C
	ldr r0, [r1]
	ldr r0, [r0, #0x33c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl FemaleToMaleForm
	ldr r1, _022F4354 ; =0x00000807
	bl GetIdleAnimationType
	ldrh r2, [r4, #0x10]
	ldr r1, _022F434C ; =ov11_02324CE0
	mov r2, r2, lsr #2
	add r2, r2, #4
	and r2, r2, #7
	ldr r3, [r1]
	mov r1, r0, lsl #0x10
	mov r2, r2, lsl #0x18
	add r0, r3, #0x18
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x18
	bl SetAnimDataFields2
_022F414C:
	ldr r1, [r4, #8]
	ldr r0, _022F434C ; =ov11_02324CE0
	rsb r1, r1, #0xf0
	mov r1, r1, lsl #8
	str r1, [r0, #0xc]
	ldr r0, [r0]
	ldr r2, _022F4350 ; =ov11_02324CE8
	ldr r1, [r0, #0x33c]
	add r0, r0, #0x18
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _022F434C ; =ov11_02324CE0
	mov r1, #0x8100
	str r1, [r0, #8]
	ldr r1, [r4, #4]
	ldr r2, _022F4350 ; =ov11_02324CE8
	rsb r1, r1, #0xf0
	mov r1, r1, lsl #8
	str r1, [r0, #0xc]
	ldr r0, [r0]
	mov r3, #0
	ldr r1, [r0, #0x340]
	add r0, r0, #0xdc
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5C94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41C0:
	bl ov11_0231474C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41C8:
	bl sub_0206B9DC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41D0:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl ov11_0231598C
	ldrh r1, [r0]
	cmp r1, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r0, #4]
	ldr r2, _022F434C ; =ov11_02324CE0
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r1, _022F4350 ; =ov11_02324CE8
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r2, #0xc]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x1a0
	bl AnimRelatedFunction__022F6F14
	mov r0, #1
	bl ov11_0231598C
	ldr r1, [r0, #4]
	ldr r2, _022F434C ; =ov11_02324CE0
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r1, _022F4350 ; =ov11_02324CE8
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r2, #0xc]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x264
	bl AnimRelatedFunction__022F6F14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F426C:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r5, #0xc4
	ldr fp, _022F4350 ; =ov11_02324CE8
	ldr r6, _022F434C ; =ov11_02324CE0
	mov r7, r8
	mov r4, r5
_022F4290:
	mov r0, r8
	bl ov11_0231598C
	mov sb, r0
	ldrh r1, [sb]
	cmp r1, #0xff
	beq _022F4334
	ldrh r0, [sb, #0x14]
	cmp r0, #2
	bhs _022F4300
	mul sl, r8, r5
	add r0, r1, #0x800
	ldr r3, [r6, #4]
	mov r1, r0, lsl #0x10
	mov r2, r7
	add r0, r3, sl
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #29
	add r0, r1, r0, ror #29
	ldr r1, [r6, #4]
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r0, r1, sl
	strh r2, [r0, #0x14]
	ldr r0, [r6, #4]
	add r0, r0, sl
	strh r2, [r0, #0x16]
_022F4300:
	ldr r0, [sb, #4]
	mov r1, fp
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #8]
	ldr r0, [sb, #8]
	mov r2, #0
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #0xc]
	ldr r0, [r6, #4]
	mla r0, r8, r4, r0
	bl AnimRelatedFunction__022F6F14
_022F4334:
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F4290
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F4344:
	bl ov11_0231474C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F434C: .word ov11_02324CE0
_022F4350: .word ov11_02324CE8
_022F4354: .word 0x00000807
	arm_func_end ov11_022F3E70

	arm_func_start ov11_022F4358
ov11_022F4358: ; 0x022F4358
	bx lr
	arm_func_end ov11_022F4358

	arm_func_start ov11_022F435C
ov11_022F435C: ; 0x022F435C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x11]
	cmp r1, #0
	beq _022F4388
	mov r1, #0
	strb r1, [r2, #0x11]
	ldr r0, [r0]
	add r0, r0, #0x1a0
	bl ov11_022F6EFC
_022F4388:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x12]
	cmp r1, #0
	beq _022F43B0
	mov r1, #0
	strb r1, [r2, #0x12]
	ldr r0, [r0]
	add r0, r0, #0x264
	bl ov11_022F6EFC
_022F43B0:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x13]
	cmp r1, #0
	beq _022F43D8
	mov r1, #0
	strb r1, [r2, #0x13]
	ldr r0, [r0]
	add r0, r0, #0x18
	bl ov11_022F6EFC
_022F43D8:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	beq _022F4400
	mov r1, #0
	strb r1, [r2, #0x14]
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl ov11_022F6EFC
_022F4400:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x16]
	cmp r1, #0
	beq _022F4430
	mov r1, #0
	strb r1, [r2, #0x16]
	ldr r0, [r0]
	ldr r0, [r0, #0x328]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_022F4430:
	ldr r5, _022F447C ; =ov11_02324CE0
	ldr r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	mov r4, #0xc4
_022F4448:
	ldr r0, [r5, #4]
	mla r0, r6, r4, r0
	bl ov11_022F6EFC
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F4448
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F447C ; =ov11_02324CE0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F447C: .word ov11_02324CE0
	arm_func_end ov11_022F435C

	arm_func_start ov11_022F4480
ov11_022F4480: ; 0x022F4480
	stmdb sp!, {r3, lr}
	ldr r0, _022F44CC ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #6]
	bl sub_0206BA5C
	bl ov10_022C3890
	bl ov11_022F435C
	ldr r0, _022F44CC ; =ov11_02324CE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_023146F8
	ldr r0, _022F44CC ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F44CC: .word ov11_02324CE0
	arm_func_end ov11_022F4480

	arm_func_start ov11_022F44D0
ov11_022F44D0: ; 0x022F44D0
	stmdb sp!, {r3, lr}
	ldr r1, _022F44F4 ; =ov11_02324CE0
	cmp r0, #0
	ldr r1, [r1]
	ldrsh r0, [r1, #4]
	strh r0, [r1, #6]
	ldmeqia sp!, {r3, pc}
	bl ov11_022F44F8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F44F4: .word ov11_02324CE0
	arm_func_end ov11_022F44D0

	arm_func_start ov11_022F44F8
ov11_022F44F8: ; 0x022F44F8
	ldr r0, _022F4514 ; =ov11_02324CE0
	mov r2, #0
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	bx lr
	.align 2, 0
_022F4514: .word ov11_02324CE0
	arm_func_end ov11_022F44F8

	arm_func_start ov11_022F4518
ov11_022F4518: ; 0x022F4518
	stmdb sp!, {r3, lr}
	mov r0, #0x380
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F467C ; =ov11_02324CF0
	mov r1, #0x1c0
	str r0, [r2]
	mov r0, #0x2c0
	mov r2, #0
	bl ov10_022BDA84
	mov r0, #0x8000
	mov r1, #0xb
	bl ov10_022BDB80
	mov r0, #0x3c0
	bl sub_0205882C
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r2, #0x20
	ldr r0, [r0]
	mov r1, #0
	str r2, [sp]
	mov r2, #0x2c0
	add r3, r0, #0x20
	bl ov11_022F5B88
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r2, #0x10
	ldr r3, [r0]
	mov r1, #0
	str r2, [sp]
	add r0, r3, #0x10
	add r3, r3, #0x120
	mov r2, #0x7c
	bl ov11_022F5B88
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r1, #0
	ldr r0, [r0]
	mov r3, r1
	add r2, r0, #0x1a0
_022F45AC:
	add r0, r1, #1
	str r3, [r2]
	add r1, r1, #4
	mov r0, r0, lsl #0x10
	str r1, [r2, #4]
	mov r1, r0, asr #0x10
	str r3, [r2, #8]
	cmp r1, #0x1c
	add r2, r2, #0xc
	blt _022F45AC
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r1, #0
	ldr r0, [r0]
	add r2, r0, #0x2f0
_022F45E4:
	add r0, r3, #1
	stmia r2, {r1, r3}
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	str r1, [r2, #8]
	cmp r3, #0xc
	add r2, r2, #0xc
	blt _022F45E4
	ldr r0, _022F4680 ; =ov11_0238A034
	bl sub_0201C000
	ldr r0, _022F4684 ; =ov11_0238A040
	bl sub_0201C000
	ldr r1, _022F4688 ; =ov11_0238A020
	mov r2, #2
	ldrh ip, [r1, #0x18]
	mov r3, #0
	sub r0, r2, #3
	bic ip, ip, #0xc00
	strh ip, [r1, #0x18]
	ldrh ip, [r1, #0x1e]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x1e]
	ldrh ip, [r1, #0x24]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x24]
	ldrh ip, [r1, #0x2a]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x2a]
	ldrh ip, [r1, #0x2a]
	orr ip, ip, #0x800
	strh ip, [r1, #0x2a]
	str r3, [r1, #4]
	str r2, [r1, #8]
	str r3, [r1]
	bl ov11_022F46B4
	mvn r0, #0
	bl ov11_022F4734
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F467C: .word ov11_02324CF0
_022F4680: .word ov11_0238A034
_022F4684: .word ov11_0238A040
_022F4688: .word ov11_0238A020
	arm_func_end ov11_022F4518

	arm_func_start ov11_022F468C
ov11_022F468C: ; 0x022F468C
	stmdb sp!, {r3, lr}
	mov r2, #0
	ldr r1, _022F46B0 ; =ov11_0238A020
	sub r0, r2, #1
	str r2, [r1]
	bl ov11_022F46B4
	mvn r0, #0
	bl ov11_022F4734
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F46B0: .word ov11_0238A020
	arm_func_end ov11_022F468C

	arm_func_start ov11_022F46B4
ov11_022F46B4: ; 0x022F46B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F472C ; =ov11_0238A05C
	mov r5, r0
	mov r0, r4
	bl sub_0201C000
	mov r0, r5
	bl sub_02065014
	cmp r0, #0
	ldrh r1, [r4, #0xa]
	ldrh r3, [r4, #4]
	beq _022F4700
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	ldr r0, _022F4730 ; =ov11_0238A020
	bic r3, r3, #0xc00
	mov r1, #3
	orr r2, r2, #0xc00
	b _022F471C
_022F4700:
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	ldr r0, _022F4730 ; =ov11_0238A020
	bic r3, r3, #0xc00
	mov r1, #2
	orr r2, r2, #0x800
_022F471C:
	strh r3, [r4, #4]
	strh r2, [r4, #0xa]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F472C: .word ov11_0238A05C
_022F4730: .word ov11_0238A020
	arm_func_end ov11_022F46B4

	arm_func_start ov11_022F4734
ov11_022F4734: ; 0x022F4734
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F47B4 ; =ov11_0238A068
	mov r5, r0
	mov r0, r4
	bl sub_0201C000
	mov r0, r5
	bl sub_02065014
	cmp r0, #0
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #4]
	beq _022F4788
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	bic r2, r2, #0xc00
	ldr r0, _022F47B8 ; =ov11_0238A020
	orr r1, r1, #0xc00
	strh r1, [r4, #0xa]
	strh r2, [r4, #4]
	mov r1, #3
	b _022F47AC
_022F4788:
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	bic r2, r2, #0xc00
	ldr r0, _022F47B8 ; =ov11_0238A020
	orr r1, r1, #0x800
	strh r1, [r4, #0xa]
	strh r2, [r4, #4]
	mov r1, #2
_022F47AC:
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F47B4: .word ov11_0238A068
_022F47B8: .word ov11_0238A020
	arm_func_end ov11_022F4734

	arm_func_start ov11_022F47BC
ov11_022F47BC: ; 0x022F47BC
	ldr r3, _022F47E8 ; =ov11_0238A05C
	ldr r2, _022F47EC ; =ov11_0238A068
	mov r1, #6
_022F47C8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F47C8
	ldr r0, _022F47F0 ; =ov11_0238A020
	ldr r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_022F47E8: .word ov11_0238A05C
_022F47EC: .word ov11_0238A068
_022F47F0: .word ov11_0238A020
	arm_func_end ov11_022F47BC

	arm_func_start ov11_022F47F4
ov11_022F47F4: ; 0x022F47F4
	stmdb sp!, {r3, lr}
	bl ov10_022BDC0C
	ldr r0, _022F4818 ; =ov11_02324CF0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F4818 ; =ov11_02324CF0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F4818: .word ov11_02324CF0
	arm_func_end ov11_022F47F4

	arm_func_start SetAnimDataFields
SetAnimDataFields: ; 0x022F481C
	strh r1, [r0, #0x90]
	ldrh r1, [r0, #0x90]
	tst r1, #0x2000
	bne _022F4860
	tst r1, #2
	movne r2, #0
	moveq r2, #0x38
	tst r1, #4
	movne r3, #0x38
	moveq r3, #0
	tst r1, #1
	movne ip, #8
	moveq ip, #0
	add r1, r3, r2
	add r1, ip, r1
	add r1, r1, #0x38
	str r1, [r0, #0xa8]
_022F4860:
	ldrh r1, [r0, #0x90]
	mov r2, #6
	tst r1, #0x10
	beq _022F488C
	ldr ip, _022F4948 ; =ov11_0238A034
	mov r3, r0
_022F4878:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F4878
	b _022F48EC
_022F488C:
	tst r1, #8
	beq _022F48B0
	ldr ip, _022F494C ; =ov11_0238A040
	mov r3, r0
_022F489C:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F489C
	b _022F48EC
_022F48B0:
	tst r1, #0x8000
	beq _022F48D4
	ldr ip, _022F4950 ; =ov11_0238A068
	mov r3, r0
_022F48C0:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F48C0
	b _022F48EC
_022F48D4:
	ldr ip, _022F4954 ; =ov11_0238A05C
	mov r3, r0
_022F48DC:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F48DC
_022F48EC:
	ldrh r2, [r0]
	ldr r1, _022F4958 ; =0x0000F3FF
	and r2, r2, r1
	strh r2, [r0]
	ldrh r2, [r0, #6]
	and r1, r2, r1
	strh r1, [r0, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x40
	ldrneh r1, [r0, #6]
	orrne r1, r1, #0x400
	strneh r1, [r0, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x20
	beq _022F493C
	ldrsh r1, [r0, #0xb0]
	cmp r1, #0
	ldreqsh r1, [r0, #0xb4]
	streqh r1, [r0, #0xb0]
	bx lr
_022F493C:
	mov r1, #0
	strh r1, [r0, #0xb0]
	bx lr
	.align 2, 0
_022F4948: .word ov11_0238A034
_022F494C: .word ov11_0238A040
_022F4950: .word ov11_0238A068
_022F4954: .word ov11_0238A05C
_022F4958: .word 0x0000F3FF
	arm_func_end SetAnimDataFields

	arm_func_start SetAnimDataFieldsWrapper
SetAnimDataFieldsWrapper: ; 0x022F495C
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	ldr ip, _022F4970 ; =SetAnimDataFields
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_022F4970: .word SetAnimDataFields
	arm_func_end SetAnimDataFieldsWrapper

	arm_func_start ov11_022F4974
ov11_022F4974: ; 0x022F4974
	ldrh r2, [r0, #0x90]
	tst r2, #0x2000
	strne r1, [r0, #0xa8]
	bx lr
	arm_func_end ov11_022F4974

	arm_func_start ov11_022F4984
ov11_022F4984: ; 0x022F4984
	strh r1, [r0, #0xb2]
	strh r2, [r0, #0xb4]
	bx lr
	arm_func_end ov11_022F4984

#ifdef JAPAN
	arm_func_start ov11_022F5FE8_JP
ov11_022F5FE8_JP: ; 0x022F5FE8
	ldrsh r1, [r0, #0x92]
	cmp r1, #0
	bge _022F600C
	ldrsh r0, [r0, #0x8c]
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	bx lr
_022F600C:
	mov r0, #0
	bx lr
	arm_func_end ov11_022F5FE8_JP
#endif

	arm_func_start ov11_022F4990
ov11_022F4990: ; 0x022F4990
	stmdb sp!, {r3, lr}
	ldrsh r1, [r0, #0x92]
	cmp r1, #0
	movlt r0, #0
	ldmltia sp!, {r3, pc}
	add r0, r0, #0xc
	bl sub_0201D1B0
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022F4990

	arm_func_start ov11_022F49B0
ov11_022F49B0: ; 0x022F49B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x9e]
	cmp r0, #0
	beq _022F4A0C
	ldrsh r1, [r4, #0x9c]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrsh r1, [r4, #0xa2]
	cmp r1, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0xa2]
	bl ov10_022BF964
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mvn r0, #0
	strh r0, [r4, #0xa2]
	mov r0, #0
	strh r0, [r4, #0x9e]
_022F4A0C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F49B0

	arm_func_start ov11_022F4A14
ov11_022F4A14: ; 0x022F4A14
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x80
	strh r0, [r4, #0x90]
	mov r0, #0
	ldr r3, _022F4AB4 ; =ov11_0238A05C
	mov r2, r4
	str r0, [r4, #0xa8]
	mov r1, #6
_022F4A38:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F4A38
	mov r1, #0
	str r1, [r4, #0xb8]
	str r1, [r4, #0xbc]
	sub r0, r1, #1
	str r0, [r4, #0xc0]
	strb r1, [r4, #0xb6]
	strh r1, [r4, #0xac]
	strh r1, [r4, #0xae]
	strh r0, [r4, #0x92]
	strh r1, [r4, #0x94]
	strh r0, [r4, #0x96]
	strb r0, [r4, #0x98]
	strh r1, [r4, #0x9a]
	strh r0, [r4, #0x9c]
	strh r1, [r4, #0x9e]
	strb r0, [r4, #0xa0]
	strh r0, [r4, #0xa2]
	mov r1, #0xff
	add r0, r4, #0xc
	strb r1, [r4, #0xa4]
	bl InitAnimationControlWithSet__0201C0B0
	mov r0, #0
	strb r0, [r4, #0x8a]
	strh r0, [r4, #0x8c]
	strh r0, [r4, #0x8e]
	strh r0, [r4, #0x88]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F4AB4: .word ov11_0238A05C
	arm_func_end ov11_022F4A14

	arm_func_start ov11_022F4AB8
ov11_022F4AB8: ; 0x022F4AB8
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r5, r1
	mov r1, r3, lsr #0x10
	mov r6, r0
	mov r4, r2
	bl SetAnimDataFields
	mov r1, #0
	str r1, [r6, #0xb8]
	str r1, [r6, #0xbc]
	sub r0, r1, #1
	str r0, [r6, #0xc0]
	strb r1, [r6, #0xb6]
	strh r1, [r6, #0xac]
	strh r1, [r6, #0xae]
	strh r0, [r6, #0x92]
	strh r1, [r6, #0x94]
	strh r0, [r6, #0x96]
	strb r0, [r6, #0x98]
	strh r1, [r6, #0x9a]
	strh r0, [r6, #0x9c]
	strh r1, [r6, #0x9e]
	strb r0, [r6, #0xa0]
	strh r0, [r6, #0xa2]
	mov r0, #0xff
	strb r0, [r6, #0xa4]
	strh r1, [r6, #0xb0]
	mov r1, #1
	strh r1, [r6, #0xb2]
	add r0, r6, #0xc
	strh r1, [r6, #0xb4]
	bl InitAnimationControlWithSet__0201C0B0
	mov r1, #0
	strh r1, [r6, #0x8c]
	strh r1, [r6, #0x8e]
	ldrh r0, [r6, #0x90]
	tst r0, #0x8000
	movne r1, #1
	strb r1, [r6, #0x8a]
	strh r4, [r6, #0x88]
	ldrsh r1, [r6, #0x88]
	cmp r1, #0
	beq _022F4B88
	add r0, r6, #0xc
	bl SetSpriteIdForAnimationControl
	add r0, r6, #0xc
	bl AnimationControlGetAllocForMaxFrame
	strh r0, [r6, #0x8c]
	add r0, r6, #0xc
	bl sub_0201D100
	strh r0, [r6, #0x8e]
_022F4B88:
	cmp r5, #0
	beq _022F4BB4
	ldrsh r0, [r5, #2]
	cmp r0, #0
	ble _022F4BB4
	ldrh r0, [r5]
	strh r0, [r6, #0x8a]
	ldrh r0, [r5, #2]
	strh r0, [r6, #0x8c]
	ldrh r0, [r5, #4]
	strh r0, [r6, #0x8e]
_022F4BB4:
	ldrsh r0, [r6, #0x8c]
	cmp r0, #0
	mvnle r0, #0
	strleh r0, [r6, #0x8c]
	ldmleia sp!, {r4, r5, r6, pc}
	ldrh r2, [r6, #0xe]
	mov r0, r6
	add r1, r6, #0x8a
	orr r2, r2, #0x10
	strh r2, [r6, #0xe]
	bl ov11_022F4CD4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F4AB8

	arm_func_start ov11_022F4BE4
ov11_022F4BE4: ; 0x022F4BE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #0x90]
	tst r0, #0x200
	ldrnesh r0, [r4, #0x9e]
	cmpne r0, #0
	ldrnesh r1, [r4, #0xa2]
	mvnne r0, #0
	cmpne r1, r0
	beq _022F4C14
	ldrsh r0, [r4, #0xa2]
	bl ov10_022BDE50
_022F4C14:
	ldrh r0, [r4, #0x90]
	tst r0, #0x4000
	beq _022F4C2C
	mov r0, r4
	bl ov11_022F4A14
	ldmia sp!, {r4, pc}
_022F4C2C:
	add r0, r4, #0xc
	bl sub_0201D18C
	ldrsh r1, [r4, #0x88]
	cmp r1, #0
	beq _022F4C54
	ldr r0, _022F4C60 ; =WAN_TABLE
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	mov r0, #0
	strh r0, [r4, #0x88]
_022F4C54:
	mov r0, r4
	bl ov11_022F509C
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F4C60: .word WAN_TABLE
	arm_func_end ov11_022F4BE4

	arm_func_start InitAnimDataFromOtherAnimData
InitAnimDataFromOtherAnimData: ; 0x022F4C64
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov lr, r5
	mov ip, #0xc
_022F4C78:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022F4C78
	ldr r0, [r4]
	mov r2, #0
	str r0, [lr]
	ldrh r3, [r5, #0x90]
	sub r1, r2, #1
	mov r0, #0xff
	orr r3, r3, #0x4000
	strh r3, [r5, #0x90]
	str r2, [r5, #0xb8]
	str r2, [r5, #0xbc]
	str r1, [r5, #0xc0]
	strb r2, [r5, #0xb6]
	strh r2, [r5, #0xac]
	strh r2, [r5, #0xae]
	strh r2, [r5, #0x9e]
	strb r1, [r5, #0xa0]
	strh r1, [r5, #0xa2]
	strb r0, [r5, #0xa4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitAnimDataFromOtherAnimData

	arm_func_start ov11_022F4CD4
ov11_022F4CD4: ; 0x022F4CD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	ldrb r0, [r8, #0x8a]
	mov r7, #0
	ldrsh sb, [r1, #2]
	cmp r0, #0
	ldreq r3, _022F508C ; =ov11_02324CF0
	moveq r0, #0x1c
	ldreq r3, [r3]
	ldrsh r2, [r1, #4]
	addeq r3, r3, #0x1a0
	ldrne r3, _022F508C ; =ov11_02324CF0
	mov r1, #0
	ldrne r3, [r3]
	movne r0, #0xc
	addne r3, r3, #0x2f0
	mov r6, r7
	b _022F4D6C
_022F4D20:
	ldr r4, [r3]
	cmp r4, #0
	bne _022F4D58
	add r1, r1, #1
	cmp r1, r2
	blt _022F4D5C
	sub r4, r1, #1
	mov r0, #0xc
	mul r6, r4, r0
	sub r0, r7, r4
	mov r0, r0, lsl #0x10
	sub r3, r3, r6
	mov r7, r0, asr #0x10
	b _022F4D74
_022F4D58:
	mov r1, r6
_022F4D5C:
	add r4, r7, #1
	mov r4, r4, lsl #0x10
	mov r7, r4, asr #0x10
	add r3, r3, #0xc
_022F4D6C:
	cmp r7, r0
	blt _022F4D20
_022F4D74:
	cmp r1, r2
	blt _022F4DC0
	strh r7, [r8, #0x96]
	ldr r0, [r3, #4]
	mov r6, #1
	strb r0, [r8, #0x98]
	strh r2, [r8, #0x9a]
	str r6, [r3]
	str r8, [r3, #8]
	mov r4, #2
	mov r0, #0xc
	b _022F4DB0
_022F4DA4:
	mul r1, r6, r0
	str r4, [r3, r1]
	add r6, r6, #1
_022F4DB0:
	cmp r6, r2
	blt _022F4DA4
	mov r0, #1
	b _022F4DC4
_022F4DC0:
	mov r0, #0
_022F4DC4:
	cmp r0, #0
	beq _022F4DDC
	ldrsb r0, [r8, #0x98]
	cmp r0, #0x10
	movge sb, sb, lsl #1
	b _022F4DE4
_022F4DDC:
	mov r0, #0
	b _022F5084
_022F4DE4:
	ldrb r0, [r8, #0x8a]
	mov ip, #3
	cmp r0, #0
	ldreq r0, _022F508C ; =ov11_02324CF0
	ldreq r7, [r0]
	ldrne r0, _022F508C ; =ov11_02324CF0
	ldrne r0, [r0]
	addne r7, r0, #0x10
	and r0, ip, #2
	cmp r0, #2
	ldrsh r0, [r7, #0xe]
	bne _022F4F20
	ldr r3, [r7]
	mov r1, sb, lsl #0x10
	mov r6, r1, asr #0x10
	mov r2, r3
	sub r4, ip, #4
	add r0, r0, #1
	ldr lr, [r7, #4]
	mov r1, #0
	b _022F4E64
_022F4E38:
	ldr sl, [r2]
	tst sl, #1
	bne _022F4E5C
	ldrsh sl, [r2, #6]
	cmp sl, r6
	blt _022F4E5C
	cmp sl, r0
	movlt r4, r1
	movlt r0, sl
_022F4E5C:
	add r1, r1, #1
	add r2, r2, #8
_022F4E64:
	cmp r1, lr
	blt _022F4E38
	cmp r4, #0
	blt _022F5024
	add r5, r3, r4, lsl #3
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ble _022F4F10
	add r2, r3, lr, lsl #3
	b _022F4EA4
_022F4E8C:
	ldr r1, [r2, #-8]
	ldr r0, [r2, #-4]
	sub lr, lr, #1
	str r1, [r2]
	str r0, [r2, #4]
	sub r2, r2, #8
_022F4EA4:
	cmp lr, r4
	bgt _022F4E8C
	ldr r0, [r7, #4]
	add r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	cmp r1, r0
	ble _022F4EE8
	ldr r1, _022F5090 ; =ov11_0232134C
	add r0, sp, #0xc
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x18]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r1, _022F5094 ; =ov11_02321388
	ldmib r7, {r2, r3}
	bl Debug_FatalError
_022F4EE8:
	ldr r1, [r7]
	add r0, r4, #1
	add r1, r1, r0, lsl #3
	ldrsh r0, [r1, #4]
	add r0, r0, r6
	strh r0, [r1, #4]
	ldrsh r0, [r1, #6]
	sub r0, r0, r6
	strh r0, [r1, #6]
	strh r6, [r5, #6]
_022F4F10:
	mov r0, #3
	str r0, [r5]
	ldrsh r5, [r5, #4]
	b _022F5050
_022F4F20:
	mov r4, sb, lsl #0x10
	ldmia r7, {r3, lr}
	sub r1, lr, #1
	sub sl, ip, #4
	add r0, r0, #1
	add r2, r3, r1, lsl #3
	mov r6, r4, asr #0x10
	b _022F4F6C
_022F4F40:
	ldr r4, [r2]
	tst r4, #1
	bne _022F4F64
	ldrsh r4, [r2, #6]
	cmp r4, r6
	blt _022F4F64
	cmp r4, r0
	movlt sl, r1
	movlt r0, r4
_022F4F64:
	sub r1, r1, #1
	sub r2, r2, #8
_022F4F6C:
	cmp r1, #0
	bge _022F4F40
	cmp sl, #0
	blt _022F5024
	add r4, r3, sl, lsl #3
	ldrsh r0, [r4, #6]
	cmp r0, r6
	ble _022F5014
	add r2, r3, lr, lsl #3
	b _022F4FAC
_022F4F94:
	ldr r1, [r2, #-8]
	ldr r0, [r2, #-4]
	sub lr, lr, #1
	str r1, [r2]
	str r0, [r2, #4]
	sub r2, r2, #8
_022F4FAC:
	cmp lr, sl
	bgt _022F4F94
	ldr r0, [r7, #4]
	add r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	cmp r1, r0
	ble _022F4FF0
	ldr r1, _022F5090 ; =ov11_0232134C
	add r0, sp, #4
	ldr r2, [r1, #0xc]
	ldr r1, [r1, #8]
	str r2, [sp, #8]
	str r1, [sp, #4]
	ldr r1, _022F5094 ; =ov11_02321388
	ldmib r7, {r2, r3}
	bl Debug_FatalError
_022F4FF0:
	ldrsh r0, [r4, #6]
	sub r0, r0, r6
	strh r0, [r4, #6]
	ldrsh r1, [r4, #4]
	ldrsh r0, [r4, #6]
	add r4, r4, #8
	add r0, r1, r0
	strh r0, [r4, #4]
	strh r6, [r4, #6]
_022F5014:
	mov r0, #3
	str r0, [r4]
	ldrsh r5, [r4, #4]
	b _022F5050
_022F5024:
	ldr r1, _022F5090 ; =ov11_0232134C
	add r0, sp, #0x14
	ldr r4, [r1, #0x14]
	ldr sl, [r1, #0x10]
	ldr r1, _022F5098 ; =ov11_023213B0
	mov r2, r7
	mov r3, r6
	str sl, [sp, #0x14]
	str r4, [sp, #0x18]
	str ip, [sp]
	bl Debug_FatalError
_022F5050:
	cmp r5, #0
	strgeh sb, [r8, #0x94]
	strgeh r5, [r8, #0x92]
	movge r0, #1
	bge _022F5084
	mvn r1, #0
	str r1, [r8, #0xc0]
	mov r0, #0
	strb r0, [r8, #0xb6]
	strh r1, [r8, #0x92]
	strh r0, [r8, #0x94]
	strh r0, [r8, #0xac]
	strh r0, [r8, #0xae]
_022F5084:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F508C: .word ov11_02324CF0
_022F5090: .word ov11_0232134C
_022F5094: .word ov11_02321388
_022F5098: .word ov11_023213B0
	arm_func_end ov11_022F4CD4

	arm_func_start ov11_022F509C
ov11_022F509C: ; 0x022F509C
	stmdb sp!, {r3, r4, r5, lr}
	ldrsh r4, [r0, #0x92]
	cmp r4, #0
	blt _022F51D0
	ldrb r1, [r0, #0x8a]
	mov r3, #0
	cmp r1, #0
	ldreq r1, _022F5270 ; =ov11_02324CF0
	ldreq ip, [r1]
	ldrne r1, _022F5270 ; =ov11_02324CF0
	ldrne r1, [r1]
	addne ip, r1, #0x10
	ldmia ip, {r2, r5}
	b _022F51C8
_022F50D4:
	ldrsh r1, [r2, #4]
	cmp r1, r4
	bne _022F51C0
	mov r1, #0
	str r1, [r2]
	ldr r1, [ip, #4]
	sub r1, r1, #1
	cmp r3, r1
	bge _022F5150
	ldr r4, [r2, #8]
	add r1, r2, #8
	cmp r4, #0
	bne _022F5150
	ldrsh lr, [r2, #6]
	ldrsh r4, [r1, #6]
	add r5, r3, #1
	add r4, lr, r4
	strh r4, [r2, #6]
	ldr r4, [ip, #4]
	sub r4, r4, #1
	str r4, [ip, #4]
	b _022F5144
_022F512C:
	ldr lr, [r1, #8]
	ldr r4, [r1, #0xc]
	add r5, r5, #1
	str lr, [r1]
	str r4, [r1, #4]
	add r1, r1, #8
_022F5144:
	ldr r4, [ip, #4]
	cmp r5, r4
	blt _022F512C
_022F5150:
	cmp r3, #0
	ble _022F51AC
	ldr r1, [r2, #-8]
	sub r4, r2, #8
	cmp r1, #0
	bne _022F51AC
	ldrsh lr, [r4, #6]
	ldrsh r1, [r2, #6]
	add r1, lr, r1
	strh r1, [r4, #6]
	ldr r1, [ip, #4]
	sub r1, r1, #1
	str r1, [ip, #4]
	b _022F51A0
_022F5188:
	ldr lr, [r2, #8]
	ldr r1, [r2, #0xc]
	add r3, r3, #1
	str lr, [r2]
	str r1, [r2, #4]
	add r2, r2, #8
_022F51A0:
	ldr r1, [ip, #4]
	cmp r3, r1
	blt _022F5188
_022F51AC:
	mvn r1, #0
	strh r1, [r0, #0x92]
	mov r1, #0
	strh r1, [r0, #0x94]
	b _022F51D0
_022F51C0:
	add r3, r3, #1
	add r2, r2, #8
_022F51C8:
	cmp r3, r5
	blt _022F50D4
_022F51D0:
	ldrsh r4, [r0, #0x96]
	cmp r4, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldrb r1, [r0, #0x8a]
	cmp r1, #0
	bne _022F5204
	ldr r1, _022F5270 ; =ov11_02324CF0
	mov r2, #0xc
	ldr r3, [r1]
	mov r1, #0x1c
	add r3, r3, #0x1a0
	smlabb r5, r4, r2, r3
	b _022F5218
_022F5204:
	ldr r2, _022F5270 ; =ov11_02324CF0
	mov r1, #0xc
	ldr r2, [r2]
	add r2, r2, #0x2f0
	smlabb r5, r4, r1, r2
_022F5218:
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	mov r3, #0
	str r3, [r5, #8]
	str r3, [r5], #0xc
	mov r4, r2, asr #0x10
	b _022F5250
_022F5234:
	ldr r2, [r5]
	cmp r2, #2
	bne _022F5258
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	str r3, [r5], #0xc
	mov r4, r2, asr #0x10
_022F5250:
	cmp r4, r1
	blt _022F5234
_022F5258:
	mvn r1, #0
	strh r1, [r0, #0x96]
	strb r1, [r0, #0x98]
	mov r1, #0
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F5270: .word ov11_02324CF0
	arm_func_end ov11_022F509C

	arm_func_start ov11_022F5274
ov11_022F5274: ; 0x022F5274
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, #0
	ldr r5, _022F52E0 ; =ov11_0238A04C
	mov r4, r6
_022F5288:
	mov r0, r6
	add r1, r5, r6, lsl #3
	bl ov11_022EB3C8
	cmp r0, #0
	streq r4, [r5, r6, lsl #3]
	addeq r0, r5, r6, lsl #3
	add r6, r6, #1
	streq r4, [r0, #4]
	cmp r6, #2
	blt _022F5288
	bl ov11_022FBA68
	bl ov11_022FD510
	bl ov11_022FE8CC
	ldr r1, _022F52E4 ; =ov11_0238A020
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	strh r2, [sp]
	strh r1, [sp, #2]
	bl ov10_022BF7E0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F52E0: .word ov11_0238A04C
_022F52E4: .word ov11_0238A020
	arm_func_end ov11_022F5274

	arm_func_start SetAnimDataFields2
SetAnimDataFields2: ; 0x022F52E8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldrsh r3, [r6, #0x92]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	bge _022F5324
	ldrsh r1, [r6, #0x8c]
	cmp r1, #0
	ble _022F5400
	add r1, r6, #0x8a
	bl ov11_022F4CD4
	cmp r0, #0
	beq _022F5400
_022F5324:
	tst r5, #0x400
	ldrneh r0, [r6, #0xc]
	bicne r0, r0, #0x1000
	strneh r0, [r6, #0xc]
	bne _022F5400
	mov r1, #1
	and r0, r5, #0x700
	strb r1, [r6, #0xb6]
	sub r1, r1, #2
	str r1, [r6, #0xc0]
	cmp r0, #0x100
	bgt _022F5360
	bge _022F5384
	cmp r0, #0
	b _022F5390
_022F5360:
	cmp r0, #0x200
	bgt _022F5370
	beq _022F539C
	b _022F5390
_022F5370:
	cmp r0, #0x300
	bne _022F5390
	mov r0, #0
	strh r0, [r6, #0xac]
	b _022F53A4
_022F5384:
	mov r0, #0x80
	strh r0, [r6, #0xac]
	b _022F53A4
_022F5390:
	mov r0, #0x100
	strh r0, [r6, #0xac]
	b _022F53A4
_022F539C:
	mov r0, #0x200
	strh r0, [r6, #0xac]
_022F53A4:
	mov r3, #0
	strh r3, [r6, #0xae]
	ldrb r2, [r6, #0x98]
	tst r5, #0x800
	movne r3, #1
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	and r1, r3, #0xff
	str r1, [sp, #8]
	ldrb r3, [r6, #0x8a]
	mov r0, r4, asr #2
	add r1, r4, r0, lsr #29
	str r3, [sp, #0xc]
	and r2, r5, #0xff
	add r1, r2, r1, asr #3
	ldrsh r3, [r6, #0x92]
	add r0, r6, #0xc
	and r2, r4, #7
	bl SetAnimationForAnimationControl
	ldrh r0, [r6, #0xe]
	orr r0, r0, #0x10
	strh r0, [r6, #0xe]
_022F5400:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetAnimDataFields2

	arm_func_start ov11_022F5408
ov11_022F5408: ; 0x022F5408
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh ip, [r6, #0x90]
	mov r5, r1
	mov r4, r2
	tst ip, #0x200
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	streqh r4, [r6, #0x9e]
	ldreq r0, [sp, #0x10]
	streqb r3, [r6, #0xa0]
	streqb r0, [r6, #0xa4]
	beq _022F5458
	bl ov11_022F49B0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #1
	ldrnesh r0, [r6, #0x9e]
	cmpne r4, r0
	ldmneia sp!, {r4, r5, r6, pc}
_022F5458:
	strh r5, [r6, #0x9c]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F5408

	arm_func_start ov11_022F5460
ov11_022F5460: ; 0x022F5460
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x34
	mov r7, r2
	ldr r4, [r7]
	ldr r2, [r7, #4]
	mov r5, r0
	str r4, [r5, #0xb8]
	str r2, [r5, #0xbc]
	mov r2, #0
	str r2, [r5, #0xc0]
	ldrh r0, [r5, #0x90]
	mov r4, r1
	mov r6, r3
	tst r0, #0x200
	beq _022F5624
	ldrsh r0, [r5, #0x9e]
	cmp r0, #0
	beq _022F561C
	ldrsh r0, [r5, #0x9c]
	cmp r0, #1
	bne _022F54E8
	ldrsh r1, [r5, #0xa2]
	sub r0, r2, #1
	cmp r1, r0
	beq _022F54D4
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BDE50
	mvn r0, #0
	strh r0, [r5, #0xa2]
_022F54D4:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	mov r0, #0
	strh r0, [r5, #0x9e]
	b _022F5624
_022F54E8:
	cmp r0, #0
	bne _022F55B4
	ldrsh r1, [r5, #0xa2]
	sub r0, r2, #1
	cmp r1, r0
	bne _022F55A8
	add r0, sp, #8
	bl ov10_022BF274
	ldrsh r1, [r5, #0x9e]
	mov r0, #0
	ldr ip, _022F58F0 ; =0x0000FFFF
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r2, [r7]
	sub lr, r0, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0x14]
	ldr r2, [r7, #4]
	ldr r3, _022F58F4 ; =ov11_0232136C
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0x16]
	add r2, sp, #0x24
	strh r0, [sp, #0x18]
	strh r0, [sp, #0x1a]
	strb lr, [sp, #0x1c]
	str ip, [sp, #0x20]
	mov r1, #6
_022F5568:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F5568
	ldrh r0, [sp, #0x2e]
	orr r0, r0, #0x1c0
	strh r0, [sp, #0x2e]
	ldrh r0, [r5, #0x90]
	tst r0, #0x8000
	movne r1, #1
	moveq r1, #0
	add r0, sp, #8
	bl ov10_022BF2E4
	strh r0, [r5, #0xa2]
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF35C
_022F55A8:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	b _022F5624
_022F55B4:
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF964
	cmp r0, #0
	beq _022F5608
	ldrsh r0, [r5, #0x9c]
	cmp r0, #2
	bne _022F55DC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF394
	b _022F55FC
_022F55DC:
	cmp r0, #3
	bne _022F55FC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF444
	cmp r0, #0
	beq _022F55FC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF3EC
_022F55FC:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	b _022F5624
_022F5608:
	mvn r0, #0
	strh r0, [r5, #0xa2]
	mov r0, #0
	strh r0, [r5, #0x9e]
	b _022F5624
_022F561C:
	sub r0, r2, #1
	strh r0, [r5, #0x9c]
_022F5624:
	ldrsh r0, [r5, #0x92]
	cmp r0, #0
	movlt r0, #0
	blt _022F58E8
	ldrh r0, [r5, #0x90]
	tst r0, #0x80
	movne r0, #0
	bne _022F58E8
	ldr ip, [r7]
	ldr r7, [r7, #4]
	mov r2, ip, asr #7
	mov r3, r7, asr #7
	add r2, ip, r2, lsr #24
	add r3, r7, r3, lsr #24
	tst r0, #0x8000
	movne r1, #1
	mov ip, r2, asr #8
	mov r7, r3, asr #8
	moveq r1, #0
	str ip, [sp]
	str r7, [sp, #4]
	tst r0, #0x800
	bne _022F56A0
	ldr r3, _022F58F8 ; =ov11_0238A04C
	ldr r2, _022F58FC ; =ov11_0238A050
	ldr r3, [r3, r1, lsl #3]
	ldr r1, [r2, r1, lsl #3]
	sub r2, ip, r3
	sub r1, r7, r1
	str r2, [sp]
	str r1, [sp, #4]
_022F56A0:
	mov r1, r6, asr #7
	ldr r7, [sp, #4]
	add r1, r6, r1, lsr #24
	tst r0, #0x400
	sub r6, r7, r1, asr #8
	bne _022F56F4
	ldr r1, [sp]
	mvn r2, #0x3f
	cmp r1, r2
	blt _022F5870
	cmp r1, #0x140
	bge _022F5870
	add r1, r2, #0x30
	cmp r7, r1
	blt _022F5870
	cmp r7, #0xf0
	bge _022F5870
	cmp r6, r1
	blt _022F5870
	cmp r6, #0xf0
	bge _022F5870
_022F56F4:
	tst r0, #0x20
	beq _022F57D8
	ldrsh r1, [r5, #0xb4]
	mov r0, #0
	cmp r1, #0
	bne _022F5720
	ldr r1, _022F5900 ; =ov11_0238A020
	ldr r1, [r1]
	tst r1, #1
	movne r0, #1
	b _022F5768
_022F5720:
	ldrsh r1, [r5, #0xb0]
	cmp r1, #0
	ble _022F574C
	sub r1, r1, #1
	strh r1, [r5, #0xb0]
	ldrsh r1, [r5, #0xb0]
	cmp r1, #0
	ldrlesh r1, [r5, #0xb4]
	rsble r1, r1, #0
	strleh r1, [r5, #0xb0]
	b _022F5768
_022F574C:
	add r0, r1, #1
	strh r0, [r5, #0xb0]
	ldrsh r1, [r5, #0xb0]
	mov r0, #1
	cmp r1, #0
	ldrgesh r1, [r5, #0xb2]
	strgeh r1, [r5, #0xb0]
_022F5768:
	cmp r0, #0
	beq _022F57D8
	mov r0, r5
	mov r1, #0
	bl ov11_022F5904
	mov r0, #0x240
	strh r0, [r5, #0x28]
	mov r0, #0x130
	strh r0, [r5, #0x2a]
	mov r0, #0
	strh r0, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	mov r1, r5
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl sub_0201D110
	add r0, r5, #0xc
	bl sub_0201CF5C
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F57D0
	add r0, r5, #0xc
	bl sub_0201C108
_022F57D0:
	mov r0, #0
	b _022F58E8
_022F57D8:
	ldrb r1, [r5, #0xb6]
	mov r0, r5
	bl ov11_022F5904
	ldrh r0, [r5, #0x90]
	tst r0, #0x2000
	ldrne r2, [r5, #0xa8]
	bne _022F5808
	ldr r0, [r5, #0xa8]
	add r0, r7, r0
	add r2, r0, #2
	cmp r2, #2
	movlt r2, #2
_022F5808:
	ldr r0, [sp]
	mov r1, r5
	strh r0, [r5, #0x28]
	strh r6, [r5, #0x2a]
	strh r2, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl sub_0201D110
	add r0, r5, #0xc
	bl sub_0201CF5C
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F5854
	add r0, r5, #0xc
	bl sub_0201C108
_022F5854:
	cmp r4, #0
	ldrne r1, [sp]
	ldrne r0, [sp, #4]
	strne r1, [r4]
	strne r0, [r4, #4]
	mov r0, #1
	b _022F58E8
_022F5870:
	ldrb r0, [r5, #0xb6]
	cmp r0, #0
	beq _022F58E4
	mov r0, r5
	mov r1, #1
	bl ov11_022F5904
	mov r0, #0x240
	strh r0, [r5, #0x28]
	mov r0, #0x130
	strh r0, [r5, #0x2a]
	mov r0, #0
	strh r0, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	mov r1, r5
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl sub_0201D110
	add r0, r5, #0xc
	bl sub_0201CF5C
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F58DC
	add r0, r5, #0xc
	bl sub_0201C108
_022F58DC:
	mov r0, #0
	b _022F58E8
_022F58E4:
	mov r0, #0
_022F58E8:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F58F0: .word 0x0000FFFF
_022F58F4: .word ov11_0232136C
_022F58F8: .word ov11_0238A04C
_022F58FC: .word ov11_0238A050
_022F5900: .word ov11_0238A020
	arm_func_end ov11_022F5460

	arm_func_start ov11_022F5904
ov11_022F5904: ; 0x022F5904
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _022F5928
	mov r1, #0
	add r0, r4, #0xc
	strh r1, [r4, #0xae]
	bl SwitchAnimationControlToNextFrame
	ldmia sp!, {r4, pc}
_022F5928:
	ldrsh r1, [r4, #0xae]
	ldrsh r0, [r4, #0xac]
	add r0, r1, r0
	strh r0, [r4, #0xae]
	b _022F5950
_022F593C:
	ldrsh r1, [r4, #0xae]
	add r0, r4, #0xc
	sub r1, r1, #0x100
	strh r1, [r4, #0xae]
	bl SwitchAnimationControlToNextFrame
_022F5950:
	ldrsh r0, [r4, #0xae]
	cmp r0, #0x100
	bge _022F593C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F5904

	arm_func_start ov11_022F5960
ov11_022F5960: ; 0x022F5960
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrh lr, [r0, #0x90]
	tst lr, #0x200
	ldrnesh r4, [r0, #0xa2]
	mvnne ip, #0
	cmpne r4, ip
	beq _022F5A5C
	tst lr, #0x8000
	ldr lr, _022F5A68 ; =ov11_0232134C
	movne ip, #1
	ldrh r4, [lr, #4]
	moveq ip, #0
	strh r4, [sp, #4]
	ldrh r4, [lr, #6]
	strh r4, [sp, #6]
	ldr r4, [r1]
	mov lr, r4, asr #7
	add lr, r4, lr, lsr #24
	mov r4, lr, asr #8
	strh r4, [sp, #4]
	ldr lr, [r1, #4]
	mov r1, lr, asr #7
	add r1, lr, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x2000
	ldrne r1, [r0, #0xa8]
	addne ip, r1, #4
	bne _022F5A00
	ldr r1, _022F5A6C ; =ov11_0238A050
	ldrsh lr, [sp, #6]
	ldr r1, [r1, ip, lsl #3]
	ldr ip, [r0, #0xa8]
	sub r1, lr, r1
	add r1, ip, r1
	add ip, r1, #4
	cmp ip, #4
	movlt ip, #4
_022F5A00:
	ldrsh lr, [sp, #6]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	sub r1, lr, r1, asr #8
	strh r1, [sp, #6]
	cmp r2, #0
	beq _022F5A3C
	ldrsh lr, [sp, #4]
	ldr r1, [r2]
	ldrsh r3, [sp, #6]
	add r1, lr, r1
	strh r1, [sp, #4]
	ldr r1, [r2, #4]
	add r1, r3, r1
	strh r1, [sp, #6]
_022F5A3C:
	str r0, [sp]
	ldrsh r0, [r0, #0xa2]
	add r1, sp, #4
	mov r3, ip
	mov r2, #0
	bl ov10_022BF45C
	mov r0, #1
	b _022F5A60
_022F5A5C:
	mov r0, #0
_022F5A60:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5A68: .word ov11_0232134C
_022F5A6C: .word ov11_0238A050
	arm_func_end ov11_022F5960

	arm_func_start ov11_022F5A70
ov11_022F5A70: ; 0x022F5A70
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r3, r0
	ldrh r0, [r3, #0x90]
	tst r0, #0x100
	beq _022F5B58
	ldr r4, [r1]
	tst r0, #0x8000
	mov ip, r4, asr #7
	add ip, r4, ip, lsr #24
	mov r4, ip, asr #8
	strh r4, [sp, #8]
	ldr r4, [r1, #4]
	movne r0, #1
	mov r1, r4, asr #7
	add r1, r4, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	ldrh r1, [r3, #0x90]
	moveq r0, #0
	tst r1, #0x800
	bne _022F5AF0
	ldr ip, _022F5B64 ; =ov11_0238A04C
	ldr r1, _022F5B68 ; =ov11_0238A050
	ldrsh r4, [sp, #8]
	ldr lr, [ip, r0, lsl #3]
	ldrsh ip, [sp, #0xa]
	ldr r0, [r1, r0, lsl #3]
	sub r1, r4, lr
	sub r0, ip, r0
	strh r1, [sp, #8]
	strh r0, [sp, #0xa]
_022F5AF0:
	ldrh r1, [r3, #0x90]
	tst r1, #0x10
	ldrne r0, _022F5B6C ; =ov11_0238A020
	ldrne r4, [r0, #4]
	bne _022F5B28
	tst r1, #8
	ldrne r0, _022F5B6C ; =ov11_0238A020
	ldrne r4, [r0, #8]
	bne _022F5B28
	tst r1, #0x8000
	ldrne r0, _022F5B6C ; =ov11_0238A020
	ldrne r4, [r0, #0x10]
	ldreq r0, _022F5B6C ; =ov11_0238A020
	ldreq r4, [r0, #0xc]
_022F5B28:
	tst r1, #0x40
	movne ip, #1
	moveq ip, #0
	mov r0, r2
	add r2, r3, #0xc
	add r1, sp, #8
	str r4, [sp]
	and ip, ip, #0xff
	mov r3, #1
	str ip, [sp, #4]
	bl sub_02058AFC
	b _022F5B5C
_022F5B58:
	mov r0, #0
_022F5B5C:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022F5B64: .word ov11_0238A04C
_022F5B68: .word ov11_0238A050
_022F5B6C: .word ov11_0238A020
	arm_func_end ov11_022F5A70

	arm_func_start ov11_022F5B70
ov11_022F5B70: ; 0x022F5B70
	ldr r0, _022F5B84 ; =ov11_0238A020
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
_022F5B84: .word ov11_0238A020
	arm_func_end ov11_022F5B70

	arm_func_start ov11_022F5B88
ov11_022F5B88: ; 0x022F5B88
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r3, [r0]
	mov ip, #1
	ldr r3, [sp]
	str ip, [r0, #4]
	str r3, [r0, #8]
	ldr r3, [r0]
	mov r0, #0
	str r0, [r3]
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	bx lr
	arm_func_end ov11_022F5B88

	arm_func_start ov11_022F5BBC
ov11_022F5BBC: ; 0x022F5BBC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r6, r0
	tst r5, #0x80000000
	movne r4, #0xf
	mov r0, r1
	moveq r4, #0xe
	bl GetSpriteIndex__02052724
	mov r2, #0
	str r2, [sp]
	ldr r1, _022F5C38 ; =WAN_TABLE
	mov r2, r0
	ldr r0, [r1]
	mov r3, r4
	mov r1, #2
	bl LoadWanTableEntryFromPack
	mov r2, r0
	mov r0, r6
	mov r3, r5
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r6, #0x92]
	cmp r0, #0
	blt _022F5C30
	mov r0, r6
	mov r1, #0x300
	mov r2, #0
	bl SetAnimDataFields2
_022F5C30:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F5C38: .word WAN_TABLE
	arm_func_end ov11_022F5BBC

	arm_func_start ov11_022F5C3C
ov11_022F5C3C: ; 0x022F5C3C
	ldr ip, _022F5C44 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F5C44: .word ov11_022F4BE4
	arm_func_end ov11_022F5C3C

	arm_func_start ov11_022F5C48
ov11_022F5C48: ; 0x022F5C48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [sp, #0x18]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	bge _022F5C74
	mov r0, r5
	bl ov10_022BF00C
	str r0, [sp, #0x18]
_022F5C74:
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov11_022F5408
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022F5C48

	arm_func_start ov11_022F5C94
ov11_022F5C94: ; 0x022F5C94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r6, r1
	add r1, sp, #0xc
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl ov11_022F5460
	cmp r0, #0
	beq _022F5D48
	ldrsh r1, [r7, #0xa2]
	mvn r0, #0
	cmp r1, r0
	beq _022F5D38
	ldrb r0, [r7, #0xa4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022F5D24
_022F5CDC: ; jump table
	b _022F5CEC ; case 0
	b _022F5CEC ; case 1
	b _022F5CEC ; case 2
	b _022F5CEC ; case 3
_022F5CEC:
	ldrb r2, [r7, #0xa4]
	add r0, sp, #8
	add r1, r7, #0xc
	bl sub_0201CF90
	ldrsh lr, [sp, #8]
	ldrsh ip, [sp, #0xa]
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	mov r3, r4
	str lr, [sp]
	str ip, [sp, #4]
	bl ov11_022F5960
	b _022F5D38
_022F5D24:
	mov r0, r7
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
_022F5D38:
	mov r0, r7
	mov r1, r5
	mov r2, r6
	bl ov11_022F5A70
_022F5D48:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov11_022F5C94

; https://decomp.me/scratch/OsJD0
	arm_func_start GetIdleAnimationType
GetIdleAnimationType: ; 0x022F5D50
	ldr r2, _022F6CF4 ; =0x000002C6
	cmp r0, r2
	bgt _022F6824
	bge _022F6E18
	sub r3, r2, #0xd3
	cmp r0, r3
	bgt _022F654C
	bge _022F6E18
	sub r3, r2, #0x160
	cmp r0, r3
	bgt _022F62EC
	bge _022F6E18
	cmp r0, #0x140
	bgt _022F6244
	bge _022F6E18
	ldr r2, _022F6CF8 ; =0x00000121
	cmp r0, r2
	bgt _022F61D0
	bge _022F6E20
	cmp r0, #0xfa
	bgt _022F6144
	bge _022F6E18
	sub r2, r0, #0xc
	cmp r2, #0xe2
	addls pc, pc, r2, lsl #2
	b _022F6E44
_022F5DB8: ; jump table
	b _022F6E18 ; case 0
	b _022F6E44 ; case 1
	b _022F6E44 ; case 2
	b _022F6E18 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E44 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E18 ; case 10
	b _022F6E44 ; case 11
	b _022F6E44 ; case 12
	b _022F6E44 ; case 13
	b _022F6E44 ; case 14
	b _022F6E44 ; case 15
	b _022F6E44 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E44 ; case 19
	b _022F6E44 ; case 20
	b _022F6E44 ; case 21
	b _022F6E44 ; case 22
	b _022F6E44 ; case 23
	b _022F6E44 ; case 24
	b _022F6E44 ; case 25
	b _022F6E44 ; case 26
	b _022F6E44 ; case 27
	b _022F6E44 ; case 28
	b _022F6E18 ; case 29
	b _022F6E18 ; case 30
	b _022F6E44 ; case 31
	b _022F6E44 ; case 32
	b _022F6E44 ; case 33
	b _022F6E44 ; case 34
	b _022F6E44 ; case 35
	b _022F6E44 ; case 36
	b _022F6E18 ; case 37
	b _022F6E20 ; case 38
	b _022F6E20 ; case 39
	b _022F6E44 ; case 40
	b _022F6E20 ; case 41
	b _022F6E44 ; case 42
	b _022F6E44 ; case 43
	b _022F6E44 ; case 44
	b _022F6E44 ; case 45
	b _022F6E20 ; case 46
	b _022F6E20 ; case 47
	b _022F6E44 ; case 48
	b _022F6E44 ; case 49
	b _022F6E44 ; case 50
	b _022F6E18 ; case 51
	b _022F6E44 ; case 52
	b _022F6E28 ; case 53
	b _022F6E44 ; case 54
	b _022F6E44 ; case 55
	b _022F6E44 ; case 56
	b _022F6E44 ; case 57
	b _022F6E44 ; case 58
	b _022F6E20 ; case 59
	b _022F6E18 ; case 60
	b _022F6E18 ; case 61
	b _022F6E18 ; case 62
	b _022F6E44 ; case 63
	b _022F6E44 ; case 64
	b _022F6E44 ; case 65
	b _022F6E44 ; case 66
	b _022F6E44 ; case 67
	b _022F6E44 ; case 68
	b _022F6E18 ; case 69
	b _022F6E18 ; case 70
	b _022F6E44 ; case 71
	b _022F6E44 ; case 72
	b _022F6E44 ; case 73
	b _022F6E44 ; case 74
	b _022F6E44 ; case 75
	b _022F6E18 ; case 76
	b _022F6E18 ; case 77
	b _022F6E44 ; case 78
	b _022F6E20 ; case 79
	b _022F6E18 ; case 80
	b _022F6E18 ; case 81
	b _022F6E44 ; case 82
	b _022F6E44 ; case 83
	b _022F6E44 ; case 84
	b _022F6E44 ; case 85
	b _022F6E20 ; case 86
	b _022F6E20 ; case 87
	b _022F6E44 ; case 88
	b _022F6E44 ; case 89
	b _022F6E44 ; case 90
	b _022F6E44 ; case 91
	b _022F6E44 ; case 92
	b _022F6E44 ; case 93
	b _022F6E44 ; case 94
	b _022F6E44 ; case 95
	b _022F6E44 ; case 96
	b _022F6E18 ; case 97
	b _022F6E18 ; case 98
	b _022F6E44 ; case 99
	b _022F6E44 ; case 100
	b _022F6E44 ; case 101
	b _022F6E44 ; case 102
	b _022F6E44 ; case 103
	b _022F6E18 ; case 104
	b _022F6E18 ; case 105
	b _022F6E18 ; case 106
	b _022F6E18 ; case 107
	b _022F6E44 ; case 108
	b _022F6E44 ; case 109
	b _022F6E44 ; case 110
	b _022F6E44 ; case 111
	b _022F6E44 ; case 112
	b _022F6E44 ; case 113
	b _022F6E44 ; case 114
	b _022F6E44 ; case 115
	b _022F6E44 ; case 116
	b _022F6E18 ; case 117
	b _022F6E18 ; case 118
	b _022F6E44 ; case 119
	b _022F6E20 ; case 120
	b _022F6E20 ; case 121
	b _022F6E20 ; case 122
	b _022F6E20 ; case 123
	b _022F6E44 ; case 124
	b _022F6E18 ; case 125
	b _022F6E44 ; case 126
	b _022F6E44 ; case 127
	b _022F6E44 ; case 128
	b _022F6E44 ; case 129
	b _022F6E18 ; case 130
	b _022F6E44 ; case 131
	b _022F6E18 ; case 132
	b _022F6E18 ; case 133
	b _022F6E18 ; case 134
	b _022F6E44 ; case 135
	b _022F6E44 ; case 136
	b _022F6E44 ; case 137
	b _022F6E20 ; case 138
	b _022F6E18 ; case 139
	b _022F6E44 ; case 140
	b _022F6E44 ; case 141
	b _022F6E44 ; case 142
	b _022F6E44 ; case 143
	b _022F6E44 ; case 144
	b _022F6E44 ; case 145
	b _022F6E44 ; case 146
	b _022F6E44 ; case 147
	b _022F6E44 ; case 148
	b _022F6E44 ; case 149
	b _022F6E20 ; case 150
	b _022F6E20 ; case 151
	b _022F6E20 ; case 152
	b _022F6E18 ; case 153
	b _022F6E18 ; case 154
	b _022F6E44 ; case 155
	b _022F6E44 ; case 156
	b _022F6E18 ; case 157
	b _022F6E44 ; case 158
	b _022F6E44 ; case 159
	b _022F6E44 ; case 160
	b _022F6E44 ; case 161
	b _022F6E44 ; case 162
	b _022F6E44 ; case 163
	b _022F6E44 ; case 164
	b _022F6E44 ; case 165
	b _022F6E44 ; case 166
	b _022F6E44 ; case 167
	b _022F6E44 ; case 168
	b _022F6E44 ; case 169
	b _022F6E44 ; case 170
	b _022F6E44 ; case 171
	b _022F6E44 ; case 172
	b _022F6E44 ; case 173
	b _022F6E44 ; case 174
	b _022F6E20 ; case 175
	b _022F6E20 ; case 176
	b _022F6E18 ; case 177
	b _022F6E20 ; case 178
	b _022F6E20 ; case 179
	b _022F6E44 ; case 180
	b _022F6E18 ; case 181
	b _022F6E44 ; case 182
	b _022F6E44 ; case 183
	b _022F6E44 ; case 184
	b _022F6E44 ; case 185
	b _022F6E20 ; case 186
	b _022F6E44 ; case 187
	b _022F6E18 ; case 188
	b _022F6E18 ; case 189
	b _022F6E18 ; case 190
	b _022F6E18 ; case 191
	b _022F6E18 ; case 192
	b _022F6E18 ; case 193
	b _022F6E18 ; case 194
	b _022F6E18 ; case 195
	b _022F6E18 ; case 196
	b _022F6E18 ; case 197
	b _022F6E18 ; case 198
	b _022F6E18 ; case 199
	b _022F6E18 ; case 200
	b _022F6E18 ; case 201
	b _022F6E18 ; case 202
	b _022F6E18 ; case 203
	b _022F6E18 ; case 204
	b _022F6E18 ; case 205
	b _022F6E18 ; case 206
	b _022F6E18 ; case 207
	b _022F6E18 ; case 208
	b _022F6E18 ; case 209
	b _022F6E18 ; case 210
	b _022F6E18 ; case 211
	b _022F6E18 ; case 212
	b _022F6E18 ; case 213
	b _022F6E18 ; case 214
	b _022F6E18 ; case 215
	b _022F6E18 ; case 216
	b _022F6E44 ; case 217
	b _022F6E44 ; case 218
	b _022F6E44 ; case 219
	b _022F6E18 ; case 220
	b _022F6E20 ; case 221
	b _022F6E18 ; case 222
	b _022F6E44 ; case 223
	b _022F6E44 ; case 224
	b _022F6E44 ; case 225
	b _022F6E18 ; case 226
_022F6144:
	cmp r0, #0xfd
	bgt _022F6154
	beq _022F6E18
	b _022F6E44
_022F6154:
	sub r1, r0, #0xfe
	cmp r1, #0x1a
	addls pc, pc, r1, lsl #2
	b _022F6E44
_022F6164: ; jump table
	b _022F6E20 ; case 0
	b _022F6E44 ; case 1
	b _022F6E44 ; case 2
	b _022F6E44 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E18 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E44 ; case 10
	b _022F6E44 ; case 11
	b _022F6E44 ; case 12
	b _022F6E44 ; case 13
	b _022F6E44 ; case 14
	b _022F6E44 ; case 15
	b _022F6E44 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E44 ; case 19
	b _022F6E20 ; case 20
	b _022F6E44 ; case 21
	b _022F6E20 ; case 22
	b _022F6E18 ; case 23
	b _022F6E18 ; case 24
	b _022F6E18 ; case 25
	b _022F6E20 ; case 26
_022F61D0:
	ldr r2, _022F6CFC ; =0x00000133
	cmp r0, r2
	bgt _022F6224
	bge _022F6E18
	sub r1, r2, #0xa
	cmp r0, r1
	bgt _022F6214
	sub r1, r2, #0x11
	cmp r0, r1
	blt _022F6E44
	beq _022F6E20
	sub r1, r2, #0xc
	cmp r0, r1
	subne r1, r2, #0xa
	cmpne r0, r1
	beq _022F6E18
	b _022F6E44
_022F6214:
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6224:
	cmp r0, #0x138
	bgt _022F6234
	beq _022F6E18
	b _022F6E44
_022F6234:
	add r1, r2, #0xc
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6244:
	sub r1, r2, #0x16c
	cmp r0, r1
	bgt _022F6298
	bge _022F6E18
	ldr r2, _022F6D00 ; =0x0000014F
	cmp r0, r2
	bgt _022F6274
	bge _022F6E18
	sub r1, r2, #6
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6274:
	add r1, r2, #6
	cmp r0, r1
	bgt _022F6288
	beq _022F6E20
	b _022F6E44
_022F6288:
	add r1, r2, #7
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6298:
	ldr r2, _022F6D04 ; =0x0000015D
	cmp r0, r2
	bgt _022F62C8
	bge _022F6E18
	sub r1, r2, #2
	cmp r0, r1
	bgt _022F62BC
	beq _022F6E18
	b _022F6E44
_022F62BC:
	cmp r0, #0x15c
	beq _022F6E18
	b _022F6E44
_022F62C8:
	add r1, r2, #4
	cmp r0, r1
	bgt _022F62DC
	beq _022F6E18
	b _022F6E44
_022F62DC:
	add r1, r2, #8
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F62EC:
	sub r1, r2, #0xf3
	cmp r0, r1
	bgt _022F64AC
	bge _022F6E18
	ldr r2, _022F6D08 ; =0x000001AB
	cmp r0, r2
	bgt _022F6454
	sub r1, r2, #0x3d
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022F6410
_022F6318: ; jump table
	b _022F6E18 ; case 0
	b _022F6E44 ; case 1
	b _022F6E18 ; case 2
	b _022F6E44 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E18 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E44 ; case 10
	b _022F6E18 ; case 11
	b _022F6E44 ; case 12
	b _022F6E18 ; case 13
	b _022F6E18 ; case 14
	b _022F6E18 ; case 15
	b _022F6E18 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E18 ; case 19
	b _022F6E44 ; case 20
	b _022F6E18 ; case 21
	b _022F6E44 ; case 22
	b _022F6E44 ; case 23
	b _022F6E44 ; case 24
	b _022F6E44 ; case 25
	b _022F6E44 ; case 26
	b _022F6E44 ; case 27
	b _022F6E18 ; case 28
	b _022F6E20 ; case 29
	b _022F6E44 ; case 30
	b _022F6E44 ; case 31
	b _022F6E20 ; case 32
	b _022F6E18 ; case 33
	b _022F6E44 ; case 34
	b _022F6E44 ; case 35
	b _022F6E18 ; case 36
	b _022F6E44 ; case 37
	b _022F6E44 ; case 38
	b _022F6E20 ; case 39
	b _022F6E18 ; case 40
	b _022F6E44 ; case 41
	b _022F6E44 ; case 42
	b _022F6E44 ; case 43
	b _022F6E18 ; case 44
	b _022F6E44 ; case 45
	b _022F6E18 ; case 46
	b _022F6E18 ; case 47
	b _022F6E18 ; case 48
	b _022F6E44 ; case 49
	b _022F6E18 ; case 50
	b _022F6E18 ; case 51
	b _022F6E18 ; case 52
	b _022F6E18 ; case 53
	b _022F6E18 ; case 54
	b _022F6E18 ; case 55
	b _022F6E44 ; case 56
	b _022F6E44 ; case 57
	b _022F6E44 ; case 58
	b _022F6E20 ; case 59
	b _022F6E20 ; case 60
	b _022F6E20 ; case 61
_022F6410:
	ldr r2, _022F6D0C ; =0x0000016A
	cmp r0, r2
	bgt _022F6430
	bge _022F6E20
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6430:
	add r1, r2, #1
	cmp r0, r1
	bgt _022F6444
	beq _022F6E20
	b _022F6E44
_022F6444:
	add r1, r2, #3
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6454:
	add r1, r2, #0x1b
	cmp r0, r1
	bgt _022F6488
	bge _022F6E18
	add r1, r2, #0x10
	cmp r0, r1
	bgt _022F6478
	beq _022F6E20
	b _022F6E44
_022F6478:
	add r1, r2, #0x1a
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6488:
	add r1, r2, #0x1c
	cmp r0, r1
	bgt _022F649C
	beq _022F6E18
	b _022F6E44
_022F649C:
	add r1, r2, #0x27
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F64AC:
	sub r1, r2, #0xe7
	cmp r0, r1
	bgt _022F64F8
	bge _022F6E18
	sub r1, r2, #0xef
	cmp r0, r1
	bgt _022F64D8
	bge _022F6E18
	cmp r0, #0x1d4
	beq _022F6E18
	b _022F6E44
_022F64D8:
	cmp r0, #0x1d8
	bgt _022F64E8
	beq _022F6E20
	b _022F6E44
_022F64E8:
	sub r1, r2, #0xe8
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F64F8:
	sub r1, r2, #0xdc
	cmp r0, r1
	bgt _022F6528
	bge _022F6E20
	cmp r0, #0x1e4
	bgt _022F6518
	beq _022F6E18
	b _022F6E44
_022F6518:
	sub r1, r2, #0xdd
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6528:
	sub r1, r2, #0xd5
	cmp r0, r1
	bgt _022F653C
	beq _022F6E18
	b _022F6E44
_022F653C:
	sub r1, r2, #0xd4
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F654C:
	sub r3, r2, #0x45
	cmp r0, r3
	bgt _022F66B0
	mov r1, r3
	cmp r0, r1
	bge _022F6E18
	cmp r0, #0x214
	bgt _022F6610
	bge _022F6E18
	sub r1, r2, #0xc4
	cmp r0, r1
	bgt _022F65BC
	bge _022F6E18
	cmp r0, #0x1f8
	bgt _022F6598
	bge _022F6E18
	cmp r0, #0x1f4
	beq _022F6E18
	b _022F6E44
_022F6598:
	sub r1, r2, #0xc8
	cmp r0, r1
	bgt _022F65AC
	beq _022F6E18
	b _022F6E44
_022F65AC:
	sub r1, r2, #0xc7
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F65BC:
	sub r1, r2, #0xb9
	cmp r0, r1
	bgt _022F65EC
	bge _022F6E20
	cmp r0, #0x204
	bgt _022F65DC
	beq _022F6E18
	b _022F6E44
_022F65DC:
	sub r1, r2, #0xbd
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F65EC:
	sub r1, r2, #0xb8
	cmp r0, r1
	bgt _022F6600
	beq _022F6E20
	b _022F6E44
_022F6600:
	sub r1, r2, #0xb3
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6610:
	sub r1, r2, #0x91
	cmp r0, r1
	bgt _022F665C
	bge _022F6E20
	sub r1, r2, #0xaf
	cmp r0, r1
	bgt _022F6640
	bge _022F6E20
	sub r1, r2, #0xb1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6640:
	cmp r0, #0x218
	bgt _022F6650
	beq _022F6E18
	b _022F6E44
_022F6650:
	cmp r0, #0x228
	beq _022F6E20
	b _022F6E44
_022F665C:
	cmp r0, #0x264
	bgt _022F668C
	bge _022F6E18
	sub r1, r2, #0x90
	cmp r0, r1
	bgt _022F667C
	beq _022F6E20
	b _022F6E44
_022F667C:
	sub r1, r2, #0x88
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F668C:
	sub r1, r2, #0x5f
	cmp r0, r1
	bgt _022F66A0
	beq _022F6E18
	b _022F6E44
_022F66A0:
	sub r1, r2, #0x58
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F66B0:
	cmp r0, #0x2a0
	bgt _022F6780
	bge _022F6E18
	sub r3, r2, #0x39
	cmp r0, r3
	bgt _022F6718
	mov r1, r3
	cmp r0, r1
	bge _022F6E20
	sub r1, r2, #0x3d
	cmp r0, r1
	bgt _022F66F4
	bge _022F6E18
	sub r1, r2, #0x44
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F66F4:
	sub r1, r2, #0x3c
	cmp r0, r1
	bgt _022F6708
	beq _022F6E20
	b _022F6E44
_022F6708:
	sub r1, r2, #0x3b
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6718:
	sub r3, r2, #0x2f
	cmp r0, r3
	bgt _022F6754
	mov r1, r3
	cmp r0, r1
	bge _022F6E18
	sub r1, r2, #0x34
	cmp r0, r1
	bgt _022F6744
	beq _022F6E20
	b _022F6E44
_022F6744:
	sub r1, r2, #0x33
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6754:
	sub r3, r2, #0x2d
	cmp r0, r3
	bgt _022F6770
	sub r2, r2, #0x2d
	cmp r0, r2
	beq _022F6E28
	b _022F6E44
_022F6770:
	sub r1, r2, #0x27
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6780:
	sub r1, r2, #0x13
	cmp r0, r1
	bgt _022F67D0
	bge _022F6E20
	sub r1, r2, #0x24
	cmp r0, r1
	bgt _022F67B0
	bge _022F6E18
	sub r1, r2, #0x25
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F67B0:
	cmp r0, #0x2b0
	bgt _022F67C0
	beq _022F6E18
	b _022F6E44
_022F67C0:
	sub r1, r2, #0x15
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F67D0:
	sub r1, r2, #0xc
	cmp r0, r1
	bgt _022F6800
	bge _022F6E20
	cmp r0, #0x2b4
	bgt _022F67F0
	beq _022F6E18
	b _022F6E44
_022F67F0:
	sub r1, r2, #0x11
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6800:
	sub r1, r2, #0xb
	cmp r0, r1
	bgt _022F6814
	beq _022F6E20
	b _022F6E44
_022F6814:
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6824:
	add r1, r2, #0xec
	cmp r0, r1
	bgt _022F6AF8
	bge _022F6E18
	add r1, r2, #0x53
	cmp r0, r1
	bgt _022F69A0
	bge _022F6E18
	add r1, r2, #0x34
	cmp r0, r1
	bgt _022F68FC
	bge _022F6E20
	add r1, r2, #0x13
	cmp r0, r1
	bgt _022F68A4
	bge _022F6E18
	add r1, r2, #7
	cmp r0, r1
	bgt _022F6880
	bge _022F6E18
	cmp r0, #0x2cc
	beq _022F6E18
	b _022F6E44
_022F6880:
	add r1, r2, #8
	cmp r0, r1
	bgt _022F6894
	beq _022F6E18
	b _022F6E44
_022F6894:
	add r1, r2, #9
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F68A4:
	add r1, r2, #0x18
	cmp r0, r1
	bgt _022F68D8
	bge _022F6E20
	add r1, r2, #0x14
	cmp r0, r1
	bgt _022F68C8
	beq _022F6E18
	b _022F6E44
_022F68C8:
	add r1, r2, #0x17
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F68D8:
	add r1, r2, #0x19
	cmp r0, r1
	bgt _022F68EC
	beq _022F6E20
	b _022F6E44
_022F68EC:
	add r1, r2, #0x20
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F68FC:
	add r1, r2, #0x3b
	cmp r0, r1
	bgt _022F694C
	bge _022F6E18
	cmp r0, #0x2fc
	bgt _022F6928
	bge _022F6E20
	add r1, r2, #0x35
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6928:
	add r1, r2, #0x37
	cmp r0, r1
	bgt _022F693C
	beq _022F6E18
	b _022F6E44
_022F693C:
	add r1, r2, #0x38
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F694C:
	add r1, r2, #0x4f
	cmp r0, r1
	bgt _022F697C
	bge _022F6E18
	add r1, r2, #0x4d
	cmp r0, r1
	bgt _022F6970
	beq _022F6E20
	b _022F6E44
_022F6970:
	cmp r0, #0x314
	beq _022F6E20
	b _022F6E44
_022F697C:
	add r1, r2, #0x50
	cmp r0, r1
	bgt _022F6990
	beq _022F6E20
	b _022F6E44
_022F6990:
	add r1, r2, #0x51
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69A0:
	cmp r0, #0x370
	bgt _022F6A50
	bge _022F6E20
	add r1, r2, #0x7c
	cmp r0, r1
	bgt _022F69F8
	bge _022F6E18
	cmp r0, #0x320
	bgt _022F69D8
	bge _022F6E18
	add r1, r2, #0x58
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69D8:
	cmp r0, #0x340
	bgt _022F69E8
	beq _022F6E18
	b _022F6E44
_022F69E8:
	add r1, r2, #0x7b
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69F8:
	add r1, r2, #0x8f
	cmp r0, r1
	bgt _022F6A2C
	bge _022F6E18
	add r1, r2, #0x80
	cmp r0, r1
	bgt _022F6A1C
	beq _022F6E18
	b _022F6E44
_022F6A1C:
	add r1, r2, #0x8c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6A2C:
	add r1, r2, #0x90
	cmp r0, r1
	bgt _022F6A40
	beq _022F6E20
	b _022F6E44
_022F6A40:
	add r1, r2, #0xa4
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6A50:
	add r1, r2, #0xc4
	cmp r0, r1
	bgt _022F6AA4
	bge _022F6E18
	add r1, r2, #0xb4
	cmp r0, r1
	bgt _022F6A80
	bge _022F6E20
	add r1, r2, #0xb3
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6A80:
	add r1, r2, #0xb9
	cmp r0, r1
	bgt _022F6A94
	beq _022F6E18
	b _022F6E44
_022F6A94:
	add r1, r2, #0xbb
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6AA4:
	add r1, r2, #0xd1
	cmp r0, r1
	bgt _022F6AD4
	bge _022F6E18
	add r1, r2, #0xc5
	cmp r0, r1
	bgt _022F6AC8
	beq _022F6E18
	b _022F6E44
_022F6AC8:
	cmp r0, #0x390
	beq _022F6E18
	b _022F6E44
_022F6AD4:
	add r1, r2, #0xdb
	cmp r0, r1
	bgt _022F6AE8
	beq _022F6E20
	b _022F6E44
_022F6AE8:
	add r1, r2, #0xe1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6AF8:
	add r1, r2, #0x124
	cmp r0, r1
	bgt _022F6C94
	bge _022F6E18
	ldr r1, _022F6D10 ; =0x000003D1
	cmp r0, r1
	bgt _022F6BD4
	bge _022F6E18
	sub r2, r1, #0x14
	cmp r0, r2
	bgt _022F6B70
	bge _022F6E20
	cmp r0, #0x3b4
	bgt _022F6B44
	bge _022F6E18
	sub r1, r1, #0x1e
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B44:
	sub r2, r1, #0x1c
	cmp r0, r2
	bgt _022F6B60
	sub r1, r1, #0x1c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B60:
	sub r1, r1, #0x18
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B70:
	sub r2, r1, #0xf
	cmp r0, r2
	bgt _022F6BAC
	bge _022F6E20
	sub r2, r1, #0x13
	cmp r0, r2
	bgt _022F6B9C
	sub r1, r1, #0x13
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B9C:
	sub r1, r1, #0x10
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6BAC:
	sub r2, r1, #0xe
	cmp r0, r2
	bgt _022F6BC8
	sub r1, r1, #0xe
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6BC8:
	cmp r0, #0x3c8
	beq _022F6E18
	b _022F6E44
_022F6BD4:
	add r2, r1, #8
	cmp r0, r2
	bgt _022F6C2C
	bge _022F6E18
	cmp r0, #0x3d4
	bgt _022F6C00
	bge _022F6E18
	add r1, r1, #2
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C00:
	add r2, r1, #4
	cmp r0, r2
	bgt _022F6C1C
	add r1, r1, #4
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C1C:
	add r1, r1, #5
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C2C:
	add r2, r1, #0x12
	cmp r0, r2
	bgt _022F6C68
	bge _022F6E20
	add r2, r1, #0xa
	cmp r0, r2
	bgt _022F6C58
	add r1, r1, #0xa
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C58:
	add r1, r1, #0x11
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C68:
	add r2, r1, #0x15
	cmp r0, r2
	bgt _022F6C84
	add r1, r1, #0x15
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6C84:
	add r1, r1, #0x16
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C94:
	cmp r0, #0x430
	bgt _022F6D70
	bge _022F6E20
	ldr r2, _022F6D14 ; =0x00000413
	cmp r0, r2
	bgt _022F6D18
	bge _022F6E20
	sub r1, r2, #0x12
	cmp r0, r1
	bgt _022F6CD0
	bge _022F6E20
	sub r1, r2, #0x26
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6CD0:
	sub r1, r2, #0x11
	cmp r0, r1
	bgt _022F6CE4
	beq _022F6E20
	b _022F6E44
_022F6CE4:
	sub r1, r2, #0x10
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
	.align 2, 0
_022F6CF4: .word 0x000002C6
_022F6CF8: .word 0x00000121
_022F6CFC: .word 0x00000133
_022F6D00: .word 0x0000014F
_022F6D04: .word 0x0000015D
_022F6D08: .word 0x000001AB
_022F6D0C: .word 0x0000016A
_022F6D10: .word 0x000003D1
_022F6D14: .word 0x00000413
_022F6D18:
	add r1, r2, #0x18
	cmp r0, r1
	bgt _022F6D4C
	bge _022F6E18
	add r1, r2, #0xb
	cmp r0, r1
	bgt _022F6D3C
	beq _022F6E18
	b _022F6E44
_022F6D3C:
	add r1, r2, #0x17
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6D4C:
	add r1, r2, #0x19
	cmp r0, r1
	bgt _022F6D60
	beq _022F6E18
	b _022F6E44
_022F6D60:
	add r1, r2, #0x1c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6D70:
	add r1, r2, #0x184
	cmp r0, r1
	bgt _022F6DC4
	bge _022F6E18
	ldr r2, _022F6E4C ; =0x00000441
	cmp r0, r2
	bgt _022F6DA0
	bge _022F6E20
	sub r1, r2, #5
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DA0:
	add r1, r2, #1
	cmp r0, r1
	bgt _022F6DB4
	beq _022F6E20
	b _022F6E44
_022F6DB4:
	add r1, r2, #8
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DC4:
	add r1, r2, #0x190
	cmp r0, r1
	bgt _022F6DF8
	bge _022F6E18
	ldr r1, _022F6E50 ; =0x0000044B
	cmp r0, r1
	bgt _022F6DE8
	beq _022F6E18
	b _022F6E44
_022F6DE8:
	add r1, r1, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DF8:
	ldr r1, _022F6E54 ; =0x00000457
	cmp r0, r1
	bgt _022F6E0C
	beq _022F6E18
	b _022F6E44
_022F6E0C:
	add r1, r1, #3
	cmp r0, r1
	bne _022F6E44
_022F6E18:
	ldr r0, _022F6E58 ; =0x00000807
	bx lr
_022F6E20:
	ldr r0, _022F6E5C ; =0x00000307
	bx lr
_022F6E28:
	ldr r0, _022F6E58 ; =0x00000807
	cmp r1, r0
	subne r0, r0, #0x500
	cmpne r1, r0
	ldreq r0, _022F6E58 ; =0x00000807
	movne r0, #0x300
	bx lr
_022F6E44:
	mov r0, #0x300
	bx lr
	.align 2, 0
_022F6E4C: .word 0x00000441
_022F6E50: .word 0x0000044B
_022F6E54: .word 0x00000457
_022F6E58: .word 0x00000807
_022F6E5C: .word 0x00000307
	arm_func_end GetIdleAnimationType

	arm_func_start LoadObjectAnimData
LoadObjectAnimData: ; 0x022F6E60
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r6, r2
	mov r4, r0
	tst r6, #0x80000000
	movne r5, #0xf
	ldr r2, _022F6EF0 ; =OBJECTS
	mov r0, #0xc
	moveq r5, #0xe
	smlabb r0, r1, r0, r2
	ldr r2, [r0, #4]
	cmp r2, #0
	moveq r2, #0
	beq _022F6EBC
	ldr r1, _022F6EF4 ; =ov11_023213F0
	add r0, sp, #0
	bl sprintf
	ldr r0, _022F6EF8 ; =WAN_TABLE
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, r5
	bl LoadWanTableEntry
	mov r2, r0
_022F6EBC:
	mov r0, r4
	mov r3, r6
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r4, #0x92]
	cmp r0, #0
	blt _022F6EE8
	mov r0, r4
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_022F6EE8:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F6EF0: .word OBJECTS
_022F6EF4: .word ov11_023213F0
_022F6EF8: .word WAN_TABLE
	arm_func_end LoadObjectAnimData

	arm_func_start ov11_022F6EFC
ov11_022F6EFC: ; 0x022F6EFC
	ldr ip, _022F6F04 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F6F04: .word ov11_022F4BE4
	arm_func_end ov11_022F6EFC

	arm_func_start InitAnimDataFromOtherAnimDataVeneer
InitAnimDataFromOtherAnimDataVeneer: ; 0x022F6F08
	ldr ip, _022F6F10 ; =InitAnimDataFromOtherAnimData
	bx ip
	.align 2, 0
_022F6F10: .word InitAnimDataFromOtherAnimData
	arm_func_end InitAnimDataFromOtherAnimDataVeneer

	arm_func_start AnimRelatedFunction__022F6F14
AnimRelatedFunction__022F6F14: ; 0x022F6F14
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end AnimRelatedFunction__022F6F14

	arm_func_start ov11_022F6F4C
ov11_022F6F4C: ; 0x022F6F4C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mvn lr, #0
	mov ip, #1
	mov r3, r2
	add r1, sp, #0
	mov r4, r0
	strh lr, [sp, #2]
	strh ip, [sp, #4]
	mov r2, #0
	bl ov11_022F4AB8
	ldrsh r0, [r4, #0x92]
	cmp r0, #0
	blt _022F6F94
	mov r0, r4
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_022F6F94:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F6F4C

	arm_func_start ov11_022F6F9C
ov11_022F6F9C: ; 0x022F6F9C
	ldr ip, _022F6FA4 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F6FA4: .word ov11_022F4BE4
	arm_func_end ov11_022F6F9C

	arm_func_start ov11_022F6FA8
ov11_022F6FA8: ; 0x022F6FA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F6FA8

	arm_func_start ov11_022F6FE0
ov11_022F6FE0: ; 0x022F6FE0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r3, r1
	mov r5, r0
	mov r4, r2
	ldr r1, _022F7050 ; =ov11_02321400
	add r0, sp, #0
	mov r2, r3
	bl sprintf
	ldr r0, _022F7054 ; =WAN_TABLE
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0xe
	bl LoadWanTableEntry
	mov r2, r0
	mov r3, r4
	mov r0, r5
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r5, #0x92]
	cmp r0, #0
	blt _022F7048
	mov r0, r5
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_022F7048:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7050: .word ov11_02321400
_022F7054: .word WAN_TABLE
	arm_func_end ov11_022F6FE0

	arm_func_start ov11_022F7058
ov11_022F7058: ; 0x022F7058
	ldr ip, _022F7060 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F7060: .word ov11_022F4BE4
	arm_func_end ov11_022F7058

	arm_func_start AnimRelatedFunction__022F7064
AnimRelatedFunction__022F7064: ; 0x022F7064
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end AnimRelatedFunction__022F7064

	arm_func_start ov11_022F709C
ov11_022F709C: ; 0x022F709C
	stmdb sp!, {r3, lr}
	mov r0, #0x124
	mov r1, #6
	bl MemAlloc
	ldr r3, _022F70C8 ; =GROUND_STATE_PTRS
	ldr r1, _022F70CC ; =ov11_02321414
	mov r2, #0
	str r0, [r3]
	bl InitScriptRoutine
	bl ov11_022F7104
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F70C8: .word GROUND_STATE_PTRS
_022F70CC: .word ov11_02321414
	arm_func_end ov11_022F709C

	arm_func_start ov11_022F70D0
ov11_022F70D0: ; 0x022F70D0
	stmdb sp!, {r3, lr}
	bl ov11_022F7104
	ldr r0, _022F7100 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	bl ov11_022DC934
	ldr r0, _022F7100 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F7100 ; =GROUND_STATE_PTRS
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7100: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F70D0

	arm_func_start ov11_022F7104
ov11_022F7104: ; 0x022F7104
	stmdb sp!, {r3, lr}
	ldr r0, _022F713C ; =GROUND_STATE_PTRS
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xf0]
	ldr r1, [r0]
	str r2, [r1, #0x10c]
	ldr r0, [r0]
	bl ov11_022DCAE0
	ldr r0, _022F713C ; =GROUND_STATE_PTRS
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F713C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7104

	arm_func_start ov11_022F7140
ov11_022F7140: ; 0x022F7140
	stmdb sp!, {r3, lr}
	ldr r1, _022F7180 ; =ov11_02321464
	mov r0, #2
	bl Debug_Print
	ldr r1, _022F7184 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r0, [r1]
	mov r3, #0x48
	str r2, [r0, #0x10c]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x100
	strh r3, [r0, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0x11d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7180: .word ov11_02321464
_022F7184: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7140

	arm_func_start ov11_022F7188
ov11_022F7188: ; 0x022F7188
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _022F71DC ; =ov11_023214A0
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022F71E0 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r5, [r0, #0x10]
	ldr r0, [r1]
	strb r4, [r0, #0x11d]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F71DC: .word ov11_023214A0
_022F71E0: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7188

	arm_func_start ov11_022F71E4
ov11_022F71E4: ; 0x022F71E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022F7224 ; =ov11_023214E4
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r0, _022F7228 ; =GROUND_STATE_PTRS
	ldr r2, [r0]
	ldr r1, [r2, #0x10c]
	cmp r1, #1
	movne r1, #3
	strne r1, [r2, #0x10c]
	ldrne r0, [r0]
	addne r0, r0, #0x100
	strneh r4, [r0, #0x12]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7224: .word ov11_023214E4
_022F7228: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F71E4

	arm_func_start ov11_022F722C
ov11_022F722C: ; 0x022F722C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r6, r0
	mov r4, r2
	ldr r1, _022F7298 ; =ov11_0232150C
	mov r2, r6
	mov r3, r5
	mov r0, #2
	str r4, [sp]
	bl Debug_Print
	ldr r1, _022F729C ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7290
	mov r0, #4
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r6, [r0, #0x12]
	ldr r0, [r1]
	strb r5, [r0, #0x11c]
	ldr r0, [r1]
	strb r4, [r0, #0x11d]
_022F7290:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F7298: .word ov11_0232150C
_022F729C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F722C

	arm_func_start ov11_022F72A0
ov11_022F72A0: ; 0x022F72A0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #2
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F72F0
	add r1, sp, #8
	mov r0, r6
	bl ov11_022E466C
	str r5, [sp]
	ldr r1, _022F734C ; =ov11_02321548
	add r3, sp, #8
	mov r2, r7
	mov r0, #2
	str r4, [sp, #4]
	bl Debug_Print
_022F72F0:
	ldr r1, _022F7350 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7344
	mov r0, #5
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r7, [r0, #0x12]
	ldr r3, [r1]
	add r1, r3, #0x114
_022F7324:
	ldrb r0, [r6], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F7324
	ldr r0, _022F7350 ; =GROUND_STATE_PTRS
	strb r5, [r3, #0x11c]
	ldr r0, [r0]
	strb r4, [r0, #0x11d]
_022F7344:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F734C: .word ov11_02321548
_022F7350: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F72A0

	arm_func_start ov11_022F7354
ov11_022F7354: ; 0x022F7354
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #2
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F73A4
	add r1, sp, #8
	mov r0, r6
	bl ov11_022E466C
	str r5, [sp]
	ldr r1, _022F7400 ; =ov11_02321580
	add r3, sp, #8
	mov r2, r7
	mov r0, #2
	str r4, [sp, #4]
	bl Debug_Print
_022F73A4:
	ldr r1, _022F7404 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F73F8
	mov r0, #6
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r7, [r0, #0x12]
	ldr r3, [r1]
	add r1, r3, #0x114
_022F73D8:
	ldrb r0, [r6], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F73D8
	ldr r0, _022F7404 ; =GROUND_STATE_PTRS
	strb r5, [r3, #0x11c]
	ldr r0, [r0]
	strb r4, [r0, #0x11d]
_022F73F8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F7400: .word ov11_02321580
_022F7404: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7354

	arm_func_start ov11_022F7408
ov11_022F7408: ; 0x022F7408
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F7444
	add r1, sp, #0
	mov r0, r5
	bl ov11_022E466C
	ldr r1, _022F7498 ; =ov11_023215B8
	add r2, sp, #0
	mov r0, #2
	bl Debug_Print
_022F7444:
	ldr r1, _022F749C ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7490
	mov r0, #7
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #6
	add r0, r0, #0x100
	strh r2, [r0, #0x1e]
	ldr r3, [r1]
	mov r1, #8
	add r2, r3, #0x114
_022F747C:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022F747C
	strb r4, [r3, #0x11d]
_022F7490:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022F7498: .word ov11_023215B8
_022F749C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7408

	arm_func_start ov11_022F74A0
ov11_022F74A0: ; 0x022F74A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _022F74F8 ; =ov11_023215E4
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022F74FC ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #8
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r5, [r0, #0x1e]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r4, [r0, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F74F8: .word ov11_023215E4
_022F74FC: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F74A0

	arm_func_start ov11_022F7500
ov11_022F7500: ; 0x022F7500
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F7540
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022F758C ; =ov11_02321614
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022F7540:
	ldr r1, _022F7590 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7584
	mov r0, #9
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r5, [r0, #0x12]
	ldr r0, [r1]
	add r1, r0, #0x114
_022F7574:
	ldrb r0, [r4], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F7574
_022F7584:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022F758C: .word ov11_02321614
_022F7590: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7500

	arm_func_start ov11_022F7594
ov11_022F7594: ; 0x022F7594
	stmdb sp!, {r3, lr}
	ldr r1, _022F75BC ; =GROUND_STATE_PTRS
	mov ip, #1
	ldr r3, [r1]
	mov r2, r0
	strb ip, [r3, #0xec]
	ldr r0, [r1]
	mov r1, #0
	bl ov11_022DCCEC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F75BC: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7594

	arm_func_start ov11_022F75C0
ov11_022F75C0: ; 0x022F75C0
	ldr r0, _022F75EC ; =GROUND_STATE_PTRS
	ldr r1, [r0]
	ldr r0, [r1, #0x10c]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldr r0, [r1, #0xf0]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xec]
	bx lr
	.align 2, 0
_022F75EC: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F75C0

	arm_func_start ov11_022F75F0
ov11_022F75F0: ; 0x022F75F0
	stmdb sp!, {r4, lr}
	ldr r1, _022F7624 ; =GROUND_STATE_PTRS
	mov r4, r0
	ldr r0, [r1]
	bl ov11_022DC958
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _022F7624 ; =GROUND_STATE_PTRS
	mov r1, r4
	ldr r0, [r0]
	bl ov11_022DCA58
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7624: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F75F0

	arm_func_start ov11_022F7628
ov11_022F7628: ; 0x022F7628
	stmdb sp!, {r3, lr}
	ldr r0, _022F764C ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldr r1, [r0, #0x10c]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl ov11_022DCA70
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F764C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7628

	arm_func_start UnlockMainRoutine
UnlockMainRoutine: ; 0x022F7650
	ldr r2, _022F7664 ; =GROUND_STATE_PTRS
	ldr ip, _022F7668 ; =UnlockRoutine
	mov r1, r0
	ldr r0, [r2]
	bx ip
	.align 2, 0
_022F7664: .word GROUND_STATE_PTRS
_022F7668: .word UnlockRoutine
	arm_func_end UnlockMainRoutine

	arm_func_start ov11_022F766C
ov11_022F766C: ; 0x022F766C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r1, [r0]
	ldr r0, [r1, #0xf0]
	cmp r0, #2
	bne _022F78F8
	ldr r2, [r1, #0xf4]
	ldr r1, _022F7BBC ; =ov11_02321644
	mov r0, #2
	bl Debug_Print
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r4, #0
	ldr r1, [r0]
	str r4, [r1, #0xf0]
	ldr r1, [r0]
	ldr r0, [r1, #0xf4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022F7B80
_022F76BC: ; jump table
	b _022F7B80 ; case 0
	b _022F7B80 ; case 1
	b _022F7B80 ; case 2
	b _022F76E0 ; case 3
	b _022F773C ; case 4
	b _022F77BC ; case 5
	b _022F783C ; case 6
	b _022F78B0 ; case 7
	b _022F78E0 ; case 8
_022F76E0:
	mov r1, #1
	add r0, sp, #4
	mov r3, r1
	sub r2, r1, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r3, #1
	ldr r0, [r0]
	add r2, sp, #4
	mov r1, r4
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, #0xa
	strb r3, [r2, #0xec]
	bl ov11_022F881C
	b _022F7B80
_022F773C:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	mov r3, r1
	sub r2, r1, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrb r0, [r0, #0x105]
	cmp r0, #0
	bne _022F7B80
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F77BC:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	sub r2, r1, #2
	mov r3, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrb r0, [r0, #0x105]
	cmp r0, #0
	bne _022F7B80
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F783C:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	sub r2, r1, #2
	mov r3, #3
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F78A0
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78A0:
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F78B0:
	ldrb r0, [r1, #0x105]
	cmp r0, #0
	movne r0, #2
	moveq r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E5BF4
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78E0:
	bl ov11_022E5C84
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78F8:
	cmp r0, #0
	bne _022F7B80
	ldr r2, [r1, #0x10c]
	cmp r2, #0
	beq _022F7B80
	ldr r1, _022F7BC0 ; =ov11_02321664
	mov r0, #2
	bl Debug_Print
	ldr ip, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r5, [ip]
	add r4, r5, #0x10c
	add lr, r5, #0xf4
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	mov r1, #1
	str r1, [r5, #0xf0]
	ldr r2, [ip]
	mov r0, #0
	str r0, [r2, #0x10c]
	ldr r3, [ip]
	ldr r2, [r3, #0xf4]
	cmp r2, #9
	addls pc, pc, r2, lsl #2
	b _022F7B78
_022F7960: ; jump table
	b _022F7B78 ; case 0
	b _022F7988 ; case 1
	b _022F7988 ; case 2
	b _022F79E8 ; case 3
	b _022F7A10 ; case 4
	b _022F7A4C ; case 5
	b _022F7A8C ; case 6
	b _022F7ADC ; case 7
	b _022F7B2C ; case 8
	b _022F7B68 ; case 9
_022F7988:
	ldrsh r1, [r3, #0xf8]
	add r0, sp, #4
	bl GetCoroutineInfo
	cmp r0, #0
	beq _022F79D4
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
_022F79D4:
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xf0]
	b _022F7B80
_022F79E8:
	mov r0, r3
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xfa]
	bl ov11_022E5148
	b _022F7B80
_022F7A10:
	ldrb r0, [r3, #0x105]
	cmp r0, #0
	movne r1, #2
	mov r1, r1, lsl #0x10
	mov r0, r3
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xfa]
	bl ov11_022E5148
	b _022F7B80
_022F7A4C:
	ldrb r0, [r3, #0x105]
	cmp r0, #0
	movne r1, #2
	mov r1, r1, lsl #0x10
	mov r0, r3
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r1, [r0]
	ldrsh r0, [r1, #0xfa]
	add r1, r1, #0xfc
	bl ov11_022E5188
	b _022F7B80
_022F7A8C:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r1, #2
	moveq r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r1, [r0]
	ldrsh r0, [r1, #0xfa]
	add r1, r1, #0xfc
	bl ov11_022E5314
	b _022F7B80
_022F7ADC:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r1, #2
	moveq r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #6]
	bl ScriptStationLoadTalk
	b _022F7B80
_022F7B2C:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #6]
	bl ScriptStationLoadTalk
	b _022F7B80
_022F7B68:
	ldrsh r0, [r3, #0xfa]
	add r1, r3, #0xfc
	bl ov11_022E5258
	b _022F7B80
_022F7B78:
	mov r0, #0
	str r0, [r3, #0xf0]
_022F7B80:
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldr r1, [r0, #0xf0]
	cmp r1, #0
	bne _022F7B98
	bl FuncThatCallsRunNextOpcode
_022F7B98:
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	bl ov11_022DC940
	ldr r1, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r1, [r1]
	strb r0, [r1, #0xec]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7BB8: .word GROUND_STATE_PTRS
_022F7BBC: .word ov11_02321644
_022F7BC0: .word ov11_02321664
	arm_func_end ov11_022F766C

	arm_func_start ov11_022F7BC4
ov11_022F7BC4: ; 0x022F7BC4
	stmdb sp!, {r3, lr}
	ldr r0, _022F7CB8 ; =GROUND_STATE_PTRS
	ldr r3, [r0]
	ldr r0, [r3, #0xf0]
	cmp r0, #1
	bne _022F7C9C
	ldr r0, [r3, #0xf4]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F7C8C
_022F7BEC: ; jump table
	b _022F7C8C ; case 0
	b _022F7C8C ; case 1
	b _022F7C8C ; case 2
	b _022F7C14 ; case 3
	b _022F7C20 ; case 4
	b _022F7C2C ; case 5
	b _022F7C44 ; case 6
	b _022F7C5C ; case 7
	b _022F7C68 ; case 8
	b _022F7C7C ; case 9
_022F7C14:
	ldrsh r0, [r3, #0xfa]
	bl ov11_022E544C
	b _022F7C8C
_022F7C20:
	ldrsh r0, [r3, #0xfa]
	bl ov11_022E544C
	b _022F7C8C
_022F7C2C:
	add r1, r3, #0x100
	ldrsh r0, [r3, #0xfa]
	ldrsb r2, [r1, #4]
	add r1, r3, #0xfc
	bl ov11_022E551C
	b _022F7C8C
_022F7C44:
	add r1, r3, #0x100
	ldrsh r0, [r3, #0xfa]
	ldrsb r2, [r1, #4]
	add r1, r3, #0xfc
	bl ov11_022E56B8
	b _022F7C8C
_022F7C5C:
	add r0, r3, #0xfc
	bl ov11_022E584C
	b _022F7C8C
_022F7C68:
	add r1, r3, #0x100
	ldrsh r0, [r1, #6]
	ldrsh r1, [r1, #8]
	bl ov11_022E590C
	b _022F7C8C
_022F7C7C:
	ldrsh r0, [r3, #0xfa]
	add r1, r3, #0xfc
	mov r2, #0
	bl ov11_022E551C
_022F7C8C:
	ldr r0, _022F7CB8 ; =GROUND_STATE_PTRS
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xf0]
_022F7C9C:
	ldr r0, _022F7CB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldr r1, [r0, #0xf0]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	bl ov11_022DD2C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7CB8: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7BC4

	arm_func_start AllocAndInitPartnerFollowDataAndLiveActorList
AllocAndInitPartnerFollowDataAndLiveActorList: ; 0x022F7CBC
	stmdb sp!, {r3, lr}
	mov r0, #0x330
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F7D14 ; =ov11_02324CF8
	mov r1, #6
	str r0, [r2]
	mov r0, #0x3780
	bl MemAlloc
	ldr r1, _022F7D14 ; =ov11_02324CF8
	mov r3, #0
	str r0, [r1, #4]
	mvn r2, #0
_022F7CF0:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #2]
	cmp r3, #0x18
	add r0, r0, #0x250
	blt _022F7CF0
	bl InitPartnerFollowDataAndLiveActorList
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7D14: .word ov11_02324CF8
	arm_func_end AllocAndInitPartnerFollowDataAndLiveActorList

	arm_func_start InitPartnerFollowDataAndLiveActorList
InitPartnerFollowDataAndLiveActorList: ; 0x022F7D18
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022F7DD0 ; =ov11_02324CF8
	mov r5, #0
	ldr r6, [r0, #4]
	mvn r4, #0
_022F7D2C:
	ldrsh r0, [r6, #2]
	cmp r0, r4
	beq _022F7D40
	mov r0, r5
	bl DeleteLiveActor
_022F7D40:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x18
	add r6, r6, #0x250
	blt _022F7D2C
	ldr r2, _022F7DD0 ; =ov11_02324CF8
	mvn lr, #0
	ldr r0, [r2]
	mov r5, #0
	str lr, [r0, #0x24]
	mov r0, r5
	mov r1, #0xc
_022F7D74:
	mul r3, r5, r1
	ldr r4, [r2]
	add r5, r5, #1
	add ip, r4, r3
	str lr, [ip, #8]
	str r0, [r4, r3]
	str r0, [ip, #4]
	cmp r5, #3
	blt _022F7D74
	ldr r2, _022F7DD0 ; =ov11_02324CF8
	mov r3, #0
	mov r1, #0xc
_022F7DA4:
	mul r4, r0, r1
	ldr ip, [r2]
	add r0, r0, #1
	add ip, ip, #0x28
	str r3, [ip, r4]
	add r4, ip, r4
	str r3, [r4, #4]
	str r3, [r4, #8]
	cmp r0, #0x40
	blt _022F7DA4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F7DD0: .word ov11_02324CF8
	arm_func_end InitPartnerFollowDataAndLiveActorList

	arm_func_start ov11_022F7DD4
ov11_022F7DD4: ; 0x022F7DD4
	stmdb sp!, {r3, lr}
	bl InitPartnerFollowDataAndLiveActorList
	ldr r0, _022F7E0C ; =ov11_02324CF8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F7E0C ; =ov11_02324CF8
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F7E0C ; =ov11_02324CF8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7E0C: .word ov11_02324CF8
	arm_func_end ov11_022F7DD4

	arm_func_start GetLiveActorIdxFromScriptEntityId
GetLiveActorIdxFromScriptEntityId: ; 0x022F7E10
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	bl sub_02065050
	ldrsh r3, [sp, #8]
	mvn r0, #0
	cmp r3, r0
	beq _022F7E64
	ldr r1, _022F7E74 ; =ov11_02324CF8
	mov r0, #0
	ldr r2, [r1, #4]
	b _022F7E5C
_022F7E40:
	ldrsh r1, [r2, #2]
	cmp r1, r3
	beq _022F7E68
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add r2, r2, #0x250
_022F7E5C:
	cmp r0, #0x18
	blt _022F7E40
_022F7E64:
	mvn r0, #0
_022F7E68:
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F7E74: .word ov11_02324CF8
	arm_func_end GetLiveActorIdxFromScriptEntityId

	arm_func_start ov11_022F7E78
ov11_022F7E78: ; 0x022F7E78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r8, r1
	ldrh r4, [r8]
	mov sb, r0
	add r0, sp, #0x12
	add r1, sp, #0x10
	strh r4, [sp, #0x12]
	mov sl, r2
	mov fp, r3
	bl sub_0206549C
	mov r6, r0
	ldrsh r1, [sp, #0x12]
	mvn r0, #0
	cmp r1, r0
	beq _022F83D8
	cmp r6, #0
	beq _022F7ED4
	cmp r6, #1
	beq _022F7EDC
	cmp r6, #2
	beq _022F7EE4
	b _022F7EFC
_022F7ED4:
	mov sb, #0
	b _022F7EFC
_022F7EDC:
	mov sb, #1
	b _022F7EFC
_022F7EE4:
	mov r0, #0
	mov r1, #0x35
	bl LoadScriptVariableValue
	cmp r0, #0
	moveq r6, #1
	mov sb, #2
_022F7EFC:
	ldrsh r3, [sp, #0x12]
	ldrsh r4, [sp, #0x10]
	ldr r7, _022F83E0 ; =ENTITIES
	mov ip, #0xc
	ldr r1, _022F83E4 ; =ov11_02321974
	mov r2, sb
	mov r0, #1
	str r4, [sp]
	smlabb r4, r3, ip, r7
	bl Debug_Print
	cmp sb, #0
	bge _022F7FE8
	ldrsh r0, [sp, #0x12]
	cmp r0, #0x3c
	beq _022F7F44
	cmp r0, #0x3f
	beq _022F7F68
	b _022F7F8C
_022F7F44:
	ldr r1, _022F83E8 ; =ov11_02324CF8
	ldr r1, [r1, #4]
	ldrsh r1, [r1, #2]
	cmp r1, #1
	mvneq r0, #0
	beq _022F83D8
	bl GetLiveActorIdxFromScriptEntityId
	mov sb, r0
	b _022F7F94
_022F7F68:
	ldr r1, _022F83E8 ; =ov11_02324CF8
	ldr r1, [r1, #4]
	ldrsh r1, [r1, #2]
	cmp r1, #4
	mvneq r0, #0
	beq _022F83D8
	bl GetLiveActorIdxFromScriptEntityId
	mov sb, r0
	b _022F7F94
_022F7F8C:
	bl GetLiveActorIdxFromScriptEntityId
	mov sb, r0
_022F7F94:
	cmp sb, #0
	bge _022F7FDC
	ldr r0, _022F83E8 ; =ov11_02324CF8
	mov r1, #3
	ldr r0, [r0, #4]
	mvn r2, #0
	add r0, r0, #0x6f0
	b _022F7FD4
_022F7FB4:
	ldrsh r3, [r0, #2]
	cmp r3, r2
	moveq sb, r1
	beq _022F7FDC
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	add r0, r0, #0x250
_022F7FD4:
	cmp r1, #0x18
	blt _022F7FB4
_022F7FDC:
	cmp sb, #0
	mvnlt r0, #0
	blt _022F83D8
_022F7FE8:
	ldr r0, _022F83E8 ; =ov11_02324CF8
	ldrsh r1, [r4]
	ldr r2, [r0, #4]
	mov r0, #0x250
	stmia sp, {r1, sl, fp}
	ldrsh r3, [sp, #0x12]
	smlabb r7, sb, r0, r2
	ldr r1, _022F83EC ; =ov11_023219A4
	mov r2, sb
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r7, #2]
	mvn r0, #0
	cmp r1, r0
	bne _022F803C
	mov r1, #0
	add r0, r7, #0x18c
	strb r1, [r7, #4]
	mov r5, #1
	bl ov11_022F4A14
	b _022F8048
_022F803C:
	ldrsh r0, [sp, #0x12]
	cmp r1, r0
	moveq r5, #0
_022F8048:
	sub r0, sl, #1
	strh sb, [r7]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	ldrsh r1, [sp, #0x12]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0xc]
	strh r1, [r7, #2]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	strlsh sl, [r7, #6]
	strlsb fp, [r7, #8]
	mvnls r0, #0
	strlsb r0, [r7, #9]
	bls _022F809C
	cmp r5, #0
	mvnne r0, #0
	strneh r0, [r7, #6]
	strneb r0, [r7, #8]
	strb fp, [r7, #9]
_022F809C:
	ldrsh r1, [sp, #0x10]
	add r0, r7, #0x12c
	strh r1, [r7, #0xa]
	bl ov11_022EA954
	mov r0, #9
	str r0, [r7, #0x12c]
	mov r2, #0
	str r2, [r7, #0x14c]
	mov r1, #1
	strb r1, [r7, #0x156]
	ldrsh r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _022F8164
_022F80D4: ; jump table
	b _022F8164 ; case 0
	b _022F8104 ; case 1
	b _022F8114 ; case 2
	b _022F8120 ; case 3
	b _022F8164 ; case 4
	b _022F8164 ; case 5
	b _022F8164 ; case 6
	b _022F812C ; case 7
	b _022F8138 ; case 8
	b _022F8144 ; case 9
	b _022F814C ; case 10
	b _022F8158 ; case 11
_022F8104:
	ldr r0, _022F83F0 ; =0x03000743
	str r0, [r7, #0x128]
	str r1, [r7, #0x12c]
	b _022F816C
_022F8114:
	ldr r0, _022F83F4 ; =0x03000002
	str r0, [r7, #0x128]
	b _022F816C
_022F8120:
	ldr r0, _022F83F8 ; =0x03002358
	str r0, [r7, #0x128]
	b _022F816C
_022F812C:
	mov r0, #0x340
	str r0, [r7, #0x128]
	b _022F816C
_022F8138:
	mov r0, #0x20000
	str r0, [r7, #0x128]
	b _022F816C
_022F8144:
	str r2, [r7, #0x128]
	b _022F816C
_022F814C:
	mov r0, #0xc0000
	str r0, [r7, #0x128]
	b _022F816C
_022F8158:
	mov r0, #0x10000
	str r0, [r7, #0x128]
	b _022F816C
_022F8164:
	ldr r0, _022F83F8 ; =0x03002358
	str r0, [r7, #0x128]
_022F816C:
	ldrb r0, [r4, #0xa]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0xc]
	ldrb r0, [r4, #0xb]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r7, #0x18]
	ldrsb r0, [r8, #2]
	strb r0, [r7, #0x1c]
	ldrb r0, [r8, #5]
	tst r0, #4
	bne _022F81D8
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x20]
	ldrb r0, [r8, #5]
	tst r0, #2
	ldrne r0, [r7, #0x20]
	addne r0, r0, #0x400
	strne r0, [r7, #0x20]
_022F81D8:
	ldrb r0, [r8, #6]
	tst r0, #4
	bne _022F8204
	ldrb r0, [r8, #4]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x24]
	ldrb r0, [r8, #6]
	tst r0, #2
	ldrne r0, [r7, #0x24]
	addne r0, r0, #0x400
	strne r0, [r7, #0x24]
_022F8204:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	ldrne r0, [r7, #0x128]
	orrne r0, r0, #0x800000
	strne r0, [r7, #0x128]
	cmp r5, #0
	beq _022F82D4
	ldrsb r1, [r7, #0x1c]
	mov r0, #0
	mov r2, #0xc
	strb r1, [r7, #0x15a]
	ldr r3, [r7, #0x20]
	ldr r1, [r7, #0x14]
	sub r1, r3, r1
	str r1, [r7, #0x15c]
	ldr sl, [r7, #0x20]
	ldr r3, [r7, #0x14]
	add r1, r7, #0x100
	add r3, sl, r3
	str r3, [r7, #0x164]
	ldr fp, [r7, #0x24]
	ldr sl, [r7, #0x18]
	ldr r3, _022F83E8 ; =ov11_02324CF8
	sub sl, fp, sl
	str sl, [r7, #0x160]
	ldr ip, [r7, #0x24]
	ldr fp, [r7, #0x18]
	smulbb sl, r6, r2
	add fp, ip, fp
	str fp, [r7, #0x168]
	str r0, [r7, #0x170]
	str r0, [r7, #0x16c]
	strh r6, [r1, #0x50]
	ldr r3, [r3]
	sub r1, r2, #0xd
	add r2, r3, sl
	str r1, [r2, #8]
	str r0, [r3, sl]
	str r0, [r2, #4]
	ldrsh r0, [r7, #2]
	cmp r0, #0x1e
	blt _022F82C8
	cmp r0, #0x2d
	bgt _022F82C8
	mov r0, #0x12
	bl RandInt
	add r1, r7, #0x100
	strh r0, [r1, #0x58]
	b _022F82D4
_022F82C8:
	add r0, r7, #0x100
	mov r1, #0
	strh r1, [r0, #0x58]
_022F82D4:
	mov r0, #1
	strb r0, [r7, #0x152]
	sub r1, r0, #2
	add r0, r7, #0x100
	strh r1, [r0, #0x54]
	cmp r5, #0
	beq _022F8354
	add r0, r7, #0x28
	add r1, r7, #0x30
	bl ov11_022F1F08
	mvn r6, #0
	strb r6, [r7, #0x175]
	add r0, r7, #0x100
	mov r1, #0x300
	strh r1, [r0, #0x76]
	mov r3, #1
	strh r3, [r0, #0x78]
	mov r2, #0
	ldr r1, _022F83FC ; =0x00000807
	str r2, [r7, #0x17c]
	strh r1, [r0, #0x80]
	strb r3, [r7, #0x174]
	strh r6, [r0, #0x82]
	strh r2, [r0, #0x84]
	ldrsh r1, [r7, #0xa]
	ldr r2, [r7, #0x128]
	add r0, r7, #0x18c
	bl ov11_022F5BBC
	ldr r1, _022F8400 ; =ACTOR_FUNCTION_TABLE
	mov r2, r7
	add r0, r7, #0x38
	bl InitScriptRoutine
_022F8354:
	ldr r0, [r7, #0x160]
	ldr r1, _022F8404 ; =ov11_023219E8
	str r0, [sp]
	ldrsh r2, [r7, #2]
	ldr r3, [r7, #0x15c]
	mov r0, #1
	bl Debug_Print
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ldrlssh r1, [r8, #8]
	addls r0, r7, #0x100
	strlsh r1, [r0, #0x24]
	bls _022F8398
	cmp r5, #0
	addne r0, r7, #0x100
	mvnne r1, #0
	strneh r1, [r0, #0x24]
_022F8398:
	cmp r5, #0
	beq _022F83CC
	ldrsh r0, [r4]
	cmp r0, #1
	bne _022F83CC
	mov r0, #0
	bl ov11_022EB2A4
	cmp r0, #0
	beq _022F83CC
	mov r2, sb
	mov r0, #0
	mov r1, #2
	bl ov11_022EB128
_022F83CC:
	mov r1, #1
	mov r0, sb
	strb r1, [r7, #4]
_022F83D8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F83E0: .word ENTITIES
_022F83E4: .word ov11_02321974
_022F83E8: .word ov11_02324CF8
_022F83EC: .word ov11_023219A4
_022F83F0: .word 0x03000743
_022F83F4: .word 0x03000002
_022F83F8: .word 0x03002358
_022F83FC: .word 0x00000807
_022F8400: .word ACTOR_FUNCTION_TABLE
_022F8404: .word ov11_023219E8
	arm_func_end ov11_022F7E78

	arm_func_start ov11_022F8408
ov11_022F8408: ; 0x022F8408
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022F8568 ; =ov11_02321A14
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022F84D0
	ldr r0, _022F856C ; =ov11_02324CF8
	mvn r4, #1
	ldr r7, [r0, #4]
	ldr fp, _022F8570 ; =ov11_02321A40
	add r5, r4, #1
	mov r6, #1
_022F8464:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F84B4
	ldrsh r2, [r7, #6]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #6]
	cmp sl, r0
	bne _022F84B4
	cmp sb, r4
	ldrnesb r0, [r7, #8]
	cmpne sb, r0
	bne _022F84B4
	mov r0, r8
	bl DeleteLiveActor
_022F84B4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r7, r7, #0x250
	blt _022F8464
	b _022F8560
_022F84D0:
	ldr r0, _022F856C ; =ov11_02324CF8
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0, #4]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022F84EC:
	ldrsh r3, [sl, #2]
	cmp r3, r7
	beq _022F8548
	ldrsb ip, [sl, #9]
	ldr r1, _022F8574 ; =ov11_02321A6C
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl Debug_Print
	ldrsb r0, [sl, #9]
	cmp r0, r6
	beq _022F8534
	cmp sb, r5
	cmpne sb, r0
	bne _022F8548
	mov r0, r8
	bl DeleteLiveActor
	b _022F8548
_022F8534:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	bne _022F8548
	mov r0, r8
	bl DeleteLiveActor
_022F8548:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add sl, sl, #0x250
	blt _022F84EC
_022F8560:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8568: .word ov11_02321A14
_022F856C: .word ov11_02324CF8
_022F8570: .word ov11_02321A40
_022F8574: .word ov11_02321A6C
	arm_func_end ov11_022F8408

	arm_func_start DeleteLiveActor
DeleteLiveActor: ; 0x022F8578
	stmdb sp!, {r4, lr}
	ldr r1, _022F85B8 ; =ov11_02324CF8
	mov r2, r0
	ldr r1, [r1, #4]
	mov r0, #0x250
	smlabb r4, r2, r0, r1
	ldr r1, _022F85BC ; =ov11_02321A8C
	mov r0, #1
	bl Debug_Print
	add r0, r4, #0x18c
	bl ov11_022F5C3C
	add r0, r4, #0x38
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F85B8: .word ov11_02324CF8
_022F85BC: .word ov11_02321A8C
	arm_func_end DeleteLiveActor

	arm_func_start ov11_022F85C0
ov11_022F85C0: ; 0x022F85C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022F8720 ; =ov11_02321AA8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022F8698
	ldr r0, _022F8724 ; =ov11_02324CF8
	mvn r5, #0
	ldr r7, [r0, #4]
	ldr fp, _022F8728 ; =ov11_02321A40
	sub r4, r5, #1
	mov r6, #1
_022F861C:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F867C
	ldrsh r2, [r7, #6]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #6]
	cmp sl, r0
	bne _022F867C
	cmp sb, r4
	ldrnesb r0, [r7, #8]
	cmpne sb, r0
	bne _022F867C
	mov r1, #0
	add r0, r7, #0x38
	bl ov11_022DCFC4
	strh r5, [r7, #6]
	add r0, r7, #0x100
	strh r5, [r0, #0x24]
_022F867C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r7, r7, #0x250
	blt _022F861C
	b _022F8718
_022F8698:
	ldr r0, _022F8724 ; =ov11_02324CF8
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0, #4]
	ldr r6, _022F8728 ; =ov11_02321A40
	sub r4, r5, #1
	mov fp, r7
_022F86B4:
	ldrsh r3, [sl, #2]
	cmp r3, r5
	beq _022F8700
	ldrsh r2, [sl, #6]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	cmp sb, r4
	ldrnesb r0, [sl, #9]
	cmpne sb, r0
	bne _022F8700
	mov r1, fp
	add r0, sl, #0x38
	bl ov11_022DCFC4
	strb r5, [sl, #9]
_022F8700:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add sl, sl, #0x250
	blt _022F86B4
_022F8718:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8720: .word ov11_02321AA8
_022F8724: .word ov11_02324CF8
_022F8728: .word ov11_02321A40
	arm_func_end ov11_022F85C0

	arm_func_start SetAttributeBitfieldLiveActor
SetAttributeBitfieldLiveActor: ; 0x022F872C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F87B4 ; =ov11_02324CF8
	mov r2, #0x250
	ldr r4, [r3, #4]
	mvn ip, #0
	smlabb r4, r0, r2, r4
	ldrsh r0, [r4, #2]
	mov r5, r1
	cmp r0, ip
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x50]
	cmp r1, #0
	bne _022F8774
	tst r5, #2
	beq _022F879C
	bl InitPartnerFollowData
	b _022F879C
_022F8774:
	tst r5, #2
	beq _022F879C
	mov r0, #0xc
	smulbb r1, r1, r0
	ldr r2, [r3]
	mov r0, #0
	add r3, r2, r1
	str ip, [r3, #8]
	str r0, [r2, r1]
	str r0, [r3, #4]
_022F879C:
	ldr r1, [r4, #0x128]
	add r0, r4, #0x18c
	orr r1, r1, r5
	str r1, [r4, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F87B4: .word ov11_02324CF8
	arm_func_end SetAttributeBitfieldLiveActor

	arm_func_start ResetAttributeBitfieldLiveActor
ResetAttributeBitfieldLiveActor: ; 0x022F87B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F8818 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r4, r0, r2, ip
	ldrsh r0, [r4, #2]
	mov r5, r1
	cmp r0, r3
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsh r0, [r0, #0x50]
	cmp r0, #0
	bne _022F87FC
	tst r5, #2
	beq _022F87FC
	bl InitPartnerFollowData
_022F87FC:
	ldr r1, [r4, #0x128]
	mvn r0, r5
	and r1, r1, r0
	add r0, r4, #0x18c
	str r1, [r4, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8818: .word ov11_02324CF8
	arm_func_end ResetAttributeBitfieldLiveActor

	arm_func_start ov11_022F881C
ov11_022F881C: ; 0x022F881C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F8870 ; =ov11_02324CF8
	mov r2, #0x250
	ldr r3, [r3, #4]
	mov r5, r1
	smlabb r4, r0, r2, r3
	mov r0, r5
	bl ov11_022EA920
	ldrsh r1, [r4, #2]
	mvn r0, #0
	cmp r1, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	add r0, r4, #0x12c
	bl ov11_022EA990
	mov r0, #1
	strb r0, [r4, #0x152]
	sub r1, r0, #2
	add r0, r4, #0x100
	strh r1, [r0, #0x54]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8870: .word ov11_02324CF8
	arm_func_end ov11_022F881C

	arm_func_start ov11_022F8874
ov11_022F8874: ; 0x022F8874
	ldr r2, _022F889C ; =ov11_02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r1, r0, r1, r3
	ldrsh r0, [r1, #2]
	cmp r0, r2
	addne r0, r1, #0x38
	moveq r0, #0
	bx lr
	.align 2, 0
_022F889C: .word ov11_02324CF8
	arm_func_end ov11_022F8874

	arm_func_start ov11_022F88A0
ov11_022F88A0: ; 0x022F88A0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	add r0, sp, #0x10
	bl sub_02065050
	ldrsh r1, [sp, #0x10]
	mvn r0, #0
	cmp r1, r0
	beq _022F890C
	ldr r0, _022F891C ; =ov11_02324CF8
	mov r5, #0
	ldr r4, [r0, #4]
	b _022F8904
_022F88D0:
	ldrsh r1, [r4, #2]
	ldrsh r0, [sp, #0x10]
	cmp r1, r0
	bne _022F88F4
	add r0, r4, #0x38
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	bne _022F8910
_022F88F4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	add r4, r4, #0x250
_022F8904:
	cmp r5, #0x18
	blt _022F88D0
_022F890C:
	mov r0, #0
_022F8910:
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F891C: .word ov11_02324CF8
	arm_func_end ov11_022F88A0

	arm_func_start ov11_022F8920
ov11_022F8920: ; 0x022F8920
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r3, _022F8988 ; =ov11_02324CF8
	mov r5, r2
	ldr ip, [r3, #4]
	mov r3, #0x250
	smlabb r4, r0, r3, ip
	str r5, [sp]
	mov r6, r1
	mov r2, r0
	ldrsh r3, [r4, #2]
	ldr r1, _022F898C ; =ov11_02321AD4
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r4, #2]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	beq _022F8980
	mov r1, r6
	mov r2, r5
	add r0, r4, #0x38
	bl ov11_022DCCEC
	mov r0, #1
_022F8980:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F8988: .word ov11_02324CF8
_022F898C: .word ov11_02321AD4
	arm_func_end ov11_022F8920

	arm_func_start ov11_022F8990
ov11_022F8990: ; 0x022F8990
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	add r0, sp, #0x10
	mov r4, r1
	bl sub_02065050
	ldrsh r1, [sp, #0x10]
	mvn r0, #0
	cmp r1, r0
	beq _022F8A0C
	ldr r0, _022F8A1C ; =ov11_02324CF8
	mov r6, #0
	ldr r5, [r0, #4]
	b _022F8A04
_022F89C4:
	ldrsh r1, [r5, #2]
	ldrsh r0, [sp, #0x10]
	cmp r1, r0
	bne _022F89F4
	add r0, r5, #0x38
	bl ov11_022DC958
	cmp r0, #0
	beq _022F89F4
	mov r1, r4
	add r0, r5, #0x38
	bl ov11_022DCA58
	b _022F8A10
_022F89F4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x250
_022F8A04:
	cmp r6, #0x18
	blt _022F89C4
_022F8A0C:
	mov r0, #1
_022F8A10:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F8A1C: .word ov11_02324CF8
	arm_func_end ov11_022F8990

	arm_func_start ov11_022F8A20
ov11_022F8A20: ; 0x022F8A20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022F8AA0 ; =ov11_02324CF8
	mov r2, r0
	ldr r1, [r1, #4]
	mov r0, #0x250
	smlabb r4, r2, r0, r1
	ldrsh r3, [r4, #6]
	add r0, r4, #0x100
	ldr r1, _022F8AA4 ; =ov11_02321AFC
	str r3, [sp]
	ldrsh r3, [r0, #0x24]
	mov r0, #1
	str r3, [sp, #4]
	ldrsh r3, [r4, #2]
	bl Debug_Print
	ldrsh r0, [r4, #2]
	mvn r2, #0
	cmp r0, r2
	addne r1, r4, #0x100
	ldrnesh r1, [r1, #0x24]
	cmpne r1, r2
	moveq r0, #0
	beq _022F8A98
	bl SetActorTalkSub
	add r1, r4, #0x100
	ldrsh r0, [r4, #6]
	ldrsh r1, [r1, #0x24]
	bl ov11_022F74A0
	mov r0, #1
_022F8A98:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8AA0: .word ov11_02324CF8
_022F8AA4: .word ov11_02321AFC
	arm_func_end ov11_022F8A20

	arm_func_start ov11_022F8AA8
ov11_022F8AA8: ; 0x022F8AA8
	stmdb sp!, {r3, lr}
	add r2, r0, #0x100
	mov r3, #0x300
	strh r3, [r2, #0x76]
	mov lr, #1
	strh lr, [r2, #0x78]
	mov r3, #0
	str r3, [r0, #0x17c]
	ldrsh ip, [r2, #0x80]
	ldr r3, _022F8AF0 ; =0x00000807
	cmp ip, r3
	strneh r3, [r2, #0x80]
	strneb lr, [r0, #0x174]
	mov r0, r1
	mov r1, #0
	bl ov11_022F7188
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F8AF0: .word 0x00000807
	arm_func_end ov11_022F8AA8

	arm_func_start ov11_022F8AF4
ov11_022F8AF4: ; 0x022F8AF4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	cmpge r4, #0
	blt _022F8B48
	ldr r2, _022F8B50 ; =ov11_02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #2]
	cmp r0, r2
	beq _022F8B48
	bl SetActorTalkMain
	mov r0, r4
	bl ov11_022F8A20
	cmp r0, #0
	beq _022F8B48
	bl KeyWaitInit
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8B48:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8B50: .word ov11_02324CF8
	arm_func_end ov11_022F8AF4

	arm_func_start ov11_022F8B54
ov11_022F8B54: ; 0x022F8B54
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	cmpge r4, #0
	blt _022F8BA8
	ldr r2, _022F8BB0 ; =ov11_02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #2]
	cmp r0, r2
	beq _022F8BA8
	bl SetActorTalkMain
	mov r0, r4
	bl ov11_022FC83C
	cmp r0, #0
	beq _022F8BA8
	bl KeyWaitInit
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8BA8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8BB0: .word ov11_02324CF8
	arm_func_end ov11_022F8B54

	arm_func_start ov11_022F8BB4
ov11_022F8BB4: ; 0x022F8BB4
	stmdb sp!, {r4, lr}
	cmp r0, #0
	cmpge r1, #0
	blt _022F8C0C
	ldr r3, _022F8C14 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r4, r0, r2, ip
	ldrsh r0, [r4, #2]
	cmp r0, r3
	beq _022F8C0C
	mov r0, r1
	bl ov11_022FED74
	cmp r0, #0
	beq _022F8C0C
	bl KeyWaitInit
	ldrsh r0, [r4, #2]
	mvn r1, #0
	bl SetActorTalkMainAndActorTalkSub
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8C0C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8C14: .word ov11_02324CF8
	arm_func_end ov11_022F8BB4

	arm_func_start ov11_022F8C18
ov11_022F8C18: ; 0x022F8C18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022F8D64
	ldr r1, _022F8E5C ; =ov11_02321B40
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8E60 ; =ov11_02324CF8
	mvn r4, #1
	ldr r6, [r0, #4]
	ldr fp, _022F8E64 ; =ENTITIES
	mov r7, r8
	add r5, r4, #1
_022F8C74:
	ldrsh r3, [r6, #2]
	cmp r3, r5
	beq _022F8D48
	ldrsh r0, [r6, #6]
	cmp r0, sl
	bne _022F8D48
	cmp sb, r4
	ldrnesb r0, [r6, #8]
	cmpne r0, sb
	bne _022F8D48
	ldr r1, _022F8E68 ; =ov11_02321B80
	mov r0, #1
	mov r2, r7
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r6, #2]
	add r0, sp, #4
	mov r1, #3
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	bne _022F8D04
	ldrsh r1, [r6, #2]
	mov r0, #0xc
	smulbb r0, r1, r0
	ldrsh r0, [fp, r0]
	add r1, sp, #4
	cmp r0, #1
	cmpne r0, #2
	mov r0, #0
	beq _022F8CFC
	mov r2, #0xc
	bl ov11_022DCAB0
	b _022F8D04
_022F8CFC:
	mov r2, #0xe
	bl ov11_022DCAB0
_022F8D04:
	mov r0, #0
	strh r0, [sp, #0x1c]
	add r0, r6, #0x38
	add r1, sp, #4
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022F8D48
	add r0, r6, #0x28
	add r1, r6, #0x30
	bl ov11_022F1F08
	add r0, r6, #0x38
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x174]
_022F8D48:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add r6, r6, #0x250
	blt _022F8C74
	b _022F8E50
_022F8D64:
	ldr r1, _022F8E6C ; =ov11_02321B94
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8E60 ; =ov11_02324CF8
	mvn r4, #1
	ldr r7, [r0, #4]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022F8D8C:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F8E38
	cmp sb, r4
	ldrnesb r0, [r7, #9]
	cmpne r0, sb
	bne _022F8E38
	ldr r1, _022F8E68 ; =ov11_02321B80
	mov r0, #1
	mov r2, r6
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r7, #2]
	add r0, sp, #4
	mov r1, #3
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F8DFC
	add r0, r7, #0x38
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x174]
	b _022F8E38
_022F8DFC:
	cmp sl, #3
	bne _022F8E38
	mov r0, #0
	add r1, sp, #4
	mov r2, #6
	bl ov11_022DCAB0
	mov r0, #1
	strh r0, [sp, #0x1c]
	add r0, r7, #0x38
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x174]
_022F8E38:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x18
	add r7, r7, #0x250
	blt _022F8D8C
_022F8E50:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8E5C: .word ov11_02321B40
_022F8E60: .word ov11_02324CF8
_022F8E64: .word ENTITIES
_022F8E68: .word ov11_02321B80
_022F8E6C: .word ov11_02321B94
	arm_func_end ov11_022F8C18

	arm_func_start ov11_022F8E70
ov11_022F8E70: ; 0x022F8E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022F8F28
	ldr r1, _022F8FB4 ; =ov11_02321BD4
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8FB8 ; =ov11_02324CF8
	mvn r4, #1
	ldr r6, [r0, #4]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022F8EC8:
	ldrsh r3, [r6, #2]
	cmp r3, r5
	beq _022F8F0C
	ldrsh r0, [r6, #6]
	cmp sl, r0
	bne _022F8F0C
	cmp sb, r4
	ldrnesb r0, [r6, #8]
	cmpne sb, r0
	bne _022F8F0C
	ldr r1, _022F8FBC ; =ov11_02321B80
	mov r0, fp
	mov r2, r7
	bl Debug_Print
	add r0, r6, #0x38
	bl ov11_022DCAE0
	orr r8, r8, r0
_022F8F0C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add r6, r6, #0x250
	blt _022F8EC8
	b _022F8FAC
_022F8F28:
	ldr r1, _022F8FC0 ; =ov11_02321C14
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8FB8 ; =ov11_02324CF8
	mvn r5, #0
	ldr sl, [r0, #4]
	ldr fp, _022F8FBC ; =ov11_02321B80
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022F8F54:
	ldrsh r3, [sl, #2]
	cmp r3, r5
	beq _022F8F94
	ldrsb r0, [sl, #9]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022F8F94
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl Debug_Print
	add r0, sl, #0x38
	bl ov11_022DD080
	strb r5, [sl, #9]
	orr r8, r8, r0
_022F8F94:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add sl, sl, #0x250
	blt _022F8F54
_022F8FAC:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8FB4: .word ov11_02321BD4
_022F8FB8: .word ov11_02324CF8
_022F8FBC: .word ov11_02321B80
_022F8FC0: .word ov11_02321C14
	arm_func_end ov11_022F8E70

	arm_func_start ov11_022F8FC4
ov11_022F8FC4: ; 0x022F8FC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022F9014 ; =ov11_02324CF8
	mov r4, #0
	ldr r7, [r0, #4]
	mov r6, r4
	mvn r5, #0
_022F8FDC:
	ldrsh r0, [r7, #2]
	cmp r0, r5
	beq _022F8FF4
	add r0, r7, #0x38
	bl ov11_022DCB00
	orr r4, r4, r0
_022F8FF4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x18
	add r7, r7, #0x250
	blt _022F8FDC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F9014: .word ov11_02324CF8
	arm_func_end ov11_022F8FC4

	arm_func_start UnlockActorRoutines
UnlockActorRoutines: ; 0x022F9018
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022F9070 ; =ov11_02324CF8
	mov r5, #0
	ldr r4, [r1, #4]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022F9034:
	ldrsh r0, [r4, #2]
	cmp r0, r7
	beq _022F9050
	mov r1, r6
	add r0, r4, #0x38
	bl UnlockRoutine
	orr r5, r5, r0
_022F9050:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r4, r4, #0x250
	blt _022F9034
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F9070: .word ov11_02324CF8
	arm_func_end UnlockActorRoutines

	arm_func_start ov11_022F9074
ov11_022F9074: ; 0x022F9074
	stmdb sp!, {r3, lr}
	ldr r1, _022F90B0 ; =ov11_02324CF8
	mvn r0, #0
	ldr r2, [r1, #4]
	ldrsh r1, [r2, #2]
	cmp r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x12c
	bl ov11_022EA9E4
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F90B0: .word ov11_02324CF8
	arm_func_end ov11_022F9074

	arm_func_start ov11_022F90B4
ov11_022F90B4: ; 0x022F90B4
	ldr r3, _022F90F0 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #2]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	ldrne r2, [ip, #0xc]
	ldrne r0, [ip, #0x10]
	strne r2, [r1]
	str r0, [r1, #4]
	ldrsh r0, [ip, #2]
	bx lr
	.align 2, 0
_022F90F0: .word ov11_02324CF8
	arm_func_end ov11_022F90B4

	arm_func_start ov11_022F90F4
ov11_022F90F4: ; 0x022F90F4
	ldr r3, _022F9144 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #2]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022F9138
	ldr r2, [ip, #0x15c]
	ldr r0, [ip, #0x14]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x160]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
_022F9138:
	str r0, [r1, #4]
	ldrsh r0, [ip, #2]
	bx lr
	.align 2, 0
_022F9144: .word ov11_02324CF8
	arm_func_end ov11_022F90F4

	arm_func_start ov11_022F9148
ov11_022F9148: ; 0x022F9148
	ldr r3, _022F917C ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r2, r0, r2, ip
	ldrsh r0, [r2, #2]
	cmp r0, r3
	streqb r3, [r1]
	addne r0, r2, #0x100
	ldrnesb r0, [r0, #0x5a]
	strneb r0, [r1]
	ldrsh r0, [r2, #2]
	bx lr
	.align 2, 0
_022F917C: .word ov11_02324CF8
	arm_func_end ov11_022F9148

	arm_func_start GetCollidingActorId
GetCollidingActorId: ; 0x022F9180
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022F9218 ; =ov11_02324CF8
	mov ip, #0
	ldr lr, [r4, #4]
	mvn r4, #0
	b _022F9208
_022F9198:
	cmp ip, r0
	ldrnesh r5, [lr, #2]
	cmpne r5, r4
	beq _022F91F8
	ldr r5, [lr, #0x128]
	tst r5, r1
	beq _022F91F8
	ldr r6, [lr, #0x15c]
	ldr r5, [r3]
	cmp r6, r5
	bge _022F91F8
	ldr r6, [lr, #0x164]
	ldr r5, [r2]
	cmp r6, r5
	ble _022F91F8
	ldr r6, [lr, #0x160]
	ldr r5, [r3, #4]
	cmp r6, r5
	bge _022F91F8
	ldr r6, [lr, #0x168]
	ldr r5, [r2, #4]
	cmp r6, r5
	movgt r0, ip
	ldmgtia sp!, {r4, r5, r6, pc}
_022F91F8:
	add ip, ip, #1
	mov ip, ip, lsl #0x10
	mov ip, ip, asr #0x10
	add lr, lr, #0x250
_022F9208:
	cmp ip, #0x18
	blt _022F9198
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F9218: .word ov11_02324CF8
	arm_func_end GetCollidingActorId

	arm_func_start ov11_022F921C
ov11_022F921C: ; 0x022F921C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r6, r0
	add r0, r6, #0x38
	mov r5, r1
	mov r4, r2
	bl ov11_022DC958
	cmp r0, #0
	bne _022F93B8
	ldr r1, _022F93C4 ; =ov11_02321684
	add r0, sp, #0x10
	ldr r2, [r1, #0x114]
	ldr r1, [r1, #0x110]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r3, [r5]
	add r1, sp, #0
	mov r2, r3, asr #2
	add r2, r3, r2, lsr #29
	mov r3, r2, asr #3
	mov r2, r3, asr #7
	add ip, r3, r2, lsr #24
	mov r2, ip, asr #8
	str r2, [sp, #0x10]
	ldr r3, [r5, #4]
	mov r2, r3, asr #2
	add r2, r3, r2, lsr #29
	mov r3, r2, asr #3
	mov r2, r3, asr #7
	add lr, r3, r2, lsr #24
	mov r2, lr, asr #8
	str r2, [sp, #0x14]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	sub r8, r3, #1
	sub r7, r2, #1
	mov r2, r8, asr #2
	mov r3, r7, asr #2
	add r2, r8, r2, lsr #29
	add r3, r7, r3, lsr #29
	mov sb, r2, asr #3
	mov r8, r3, asr #3
	mov r2, sb, asr #7
	add r2, sb, r2, lsr #24
	mov r3, r2, asr #8
	mov r7, r8, asr #7
	add r2, r8, r7, lsr #24
	mov r2, r2, asr #8
	sub ip, r3, ip, asr #8
	sub r7, r2, lr, asr #8
	add ip, ip, #1
	add r7, r7, #1
	str ip, [sp]
	str r7, [sp, #4]
	ldr r7, [r6, #0x128]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	tst r7, #0x40
	beq _022F9318
	bl ov11_022F204C
	cmp r0, #0
	movne r0, #0x40
	bne _022F93BC
_022F9318:
	ldr r0, [r6, #0x128]
	tst r0, #0x80
	beq _022F933C
	add r0, sp, #0x10
	add r1, sp, #0
	bl ov11_022F20CC
	cmp r0, #0
	movne r0, #0x40
	bne _022F93BC
_022F933C:
	ldr r0, [r6, #0x128]
	tst r0, #0x100
	beq _022F9368
	ldrsh r0, [r6]
	mov r2, r5
	mov r3, r4
	mov r1, #0x100
	bl GetCollidingActorId
	cmp r0, #0
	movge r0, #0x100
	bge _022F93BC
_022F9368:
	ldr r0, [r6, #0x128]
	tst r0, #0x200
	beq _022F9390
	mov r1, r5
	mov r2, r4
	mov r0, #0x100
	bl GetCollidingObjectId
	cmp r0, #0
	movge r0, #0x200
	bge _022F93BC
_022F9390:
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F93B8
	mov r1, r5
	mov r2, r4
	mov r0, #0x1000
	bl GetCollidingEventId
	cmp r0, #0
	movge r0, #0x400
	bge _022F93BC
_022F93B8:
	mov r0, #0
_022F93BC:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F93C4: .word ov11_02321684
	arm_func_end ov11_022F921C

	arm_func_start ChangeActorAnimation
ChangeActorAnimation: ; 0x022F93C8
	stmdb sp!, {r4, lr}
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	mov r4, r0
	tst r1, #0x800
	mov r2, r2, lsr #0x10
	beq _022F9400
	add r0, r4, #0x100
	mov r1, #0x400
	strh r1, [r0, #0x80]
	mov r0, #1
	strb r0, [r4, #0x174]
	ldmia sp!, {r4, pc}
_022F9400:
	cmp r3, #0
	addne r0, r4, #0x100
	strneh r3, [r0, #0x78]
	cmp r2, #0
	addne r0, r4, #0x100
	strneh r2, [r0, #0x76]
	add r2, r4, #0x100
	ldrh r3, [r2, #0x78]
	cmp r3, #1
	bne _022F9450
	cmp r1, #0x1000
	moveq r0, #4
	streq r0, [r4, #0x17c]
	moveq r0, #0x800
	beq _022F9498
	ldr r0, [r4, #0x17c]
	cmp r0, #0
	movgt r0, #0x800
	ldrle r0, _022F9520 ; =0x00000807
	b _022F9498
_022F9450:
	cmp r3, #2
	bne _022F948C
	cmp r1, #0x1000
	moveq r0, #4
	streq r0, [r4, #0x17c]
	moveq r0, #0x800
	beq _022F9498
	ldr r0, [r4, #0x17c]
	cmp r0, #0
	movgt r0, #0x800
	bgt _022F9498
	ldrsh r0, [r4, #0xa]
	ldrsh r1, [r2, #0x80]
	bl GetIdleAnimationType
	b _022F9498
_022F948C:
	ldr r0, _022F9524 ; =SETANIMATION_TABLE
	mov r1, r3, lsl #1
	ldrsh r0, [r0, r1]
_022F9498:
	tst r0, #0x700
	bne _022F94F0
	add r1, r4, #0x100
	ldrh r1, [r1, #0x76]
	cmp r1, #0x200
	bgt _022F94C8
	bge _022F94E4
	cmp r1, #0x100
	orreq r0, r0, #0x300
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	b _022F94F0
_022F94C8:
	cmp r1, #0x300
	ble _022F94F0
	cmp r1, #0x400
	orreq r0, r0, #0x200
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	b _022F94F0
_022F94E4:
	orr r0, r0, #0x100
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_022F94F0:
	add r1, r4, #0x100
	ldrsh r2, [r1, #0x80]
	cmp r2, r0
	strneh r0, [r1, #0x80]
	movne r0, #1
	strneb r0, [r4, #0x174]
	bne _022F9518
	tst r2, #0x1000
	movne r0, #1
	strneb r0, [r4, #0x174]
_022F9518:
	ldrb r0, [r4, #0x174]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9520: .word 0x00000807
_022F9524: .word SETANIMATION_TABLE
	arm_func_end ChangeActorAnimation

	arm_func_start SetPositionLiveActor
SetPositionLiveActor: ; 0x022F9528
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _022F9634 ; =ov11_02321684
	mov r4, r0
	ldr r0, [r2, #0x6c]
	ldr r3, [r2, #0x68]
	str r0, [sp, #0xc]
	str r3, [sp, #8]
	ldr ip, [r1]
	ldr r3, [r4, #0x14]
	add r0, r4, #0x38
	sub r3, ip, r3
	str r3, [sp, #8]
	ldr ip, [r1, #4]
	ldr r3, [r4, #0x18]
	sub r3, ip, r3
	str r3, [sp, #0xc]
	ldr r3, [r2, #0xd8]
	ldr r2, [r2, #0xdc]
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, [r4, #0x14]
	add r2, r3, r2
	str r2, [sp]
	ldr r2, [r1, #4]
	ldr r1, [r4, #0x18]
	add r1, r2, r1
	str r1, [sp, #4]
	bl ov11_022DC958
	cmp r0, #0
	bne _022F9608
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022F95E8
	ldr r1, [sp]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022F95E8
	ldr r1, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022F95E8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022F95F0
_022F95E8:
	mov r0, #0x40
	b _022F962C
_022F95F0:
	add r1, sp, #8
	add r2, sp, #0
	mov r0, r4
	bl ov11_022F921C
	cmp r0, #0
	bne _022F962C
_022F9608:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #0
	str r2, [r4, #0x15c]
	str r1, [r4, #0x160]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r4, #0x164]
	str r1, [r4, #0x168]
_022F962C:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9634: .word ov11_02321684
	arm_func_end SetPositionLiveActor

	arm_func_start ov11_022F9638
ov11_022F9638: ; 0x022F9638
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	ldr r2, _022F99C4 ; =ov11_02321684
	mov r6, r0
	ldr r0, [r2, #0xc4]
	ldr r3, [r2, #0xc0]
	str r0, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r3, [r6, #0x15c]
	ldr r0, [r1]
	add r0, r3, r0
	str r0, [sp, #0x24]
	ldr r4, [r6, #0x160]
	ldr r3, [r1, #4]
	add r3, r4, r3
	str r3, [sp, #0x28]
	ldr r3, [r2, #0x40]
	ldr r2, [r2, #0x44]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r3, [r6, #0x164]
	ldr r2, [r1]
	add r3, r3, r2
	str r3, [sp, #0x1c]
	ldr r2, [r6, #0x168]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0x20]
	ldr r1, [r6, #0x28]
	cmp r0, r1
	bge _022F96CC
	str r1, [sp, #0x24]
	ldr r1, [r6, #0x28]
	ldr r0, [r6, #0xc]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	b _022F96E8
_022F96CC:
	ldr r1, [r6, #0x30]
	cmp r3, r1
	ldrge r0, [r6, #0xc]
	subge r0, r1, r0
	strge r0, [sp, #0x24]
	ldrge r0, [r6, #0x30]
	strge r0, [sp, #0x1c]
_022F96E8:
	ldr r1, [r6, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bge _022F9710
	str r1, [sp, #0x28]
	ldr r1, [r6, #0x2c]
	ldr r0, [r6, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x20]
	b _022F9730
_022F9710:
	ldr r1, [r6, #0x34]
	ldr r0, [sp, #0x20]
	cmp r0, r1
	ldrge r0, [r6, #0x10]
	subge r0, r1, r0
	strge r0, [sp, #0x28]
	ldrge r0, [r6, #0x34]
	strge r0, [sp, #0x20]
_022F9730:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	sub r5, r1, #1
	sub r4, r0, #1
	ldr lr, [sp, #0x24]
	ldr ip, [sp, #0x28]
	mov r2, r5, asr #2
	mov r3, r4, asr #2
	mov r0, lr, asr #2
	add r2, r5, r2, lsr #29
	mov r1, ip, asr #2
	add r3, r4, r3, lsr #29
	add r0, lr, r0, lsr #29
	mov r5, r2, asr #3
	add r1, ip, r1, lsr #29
	mov r4, r3, asr #3
	mov lr, r0, asr #3
	mov r2, r5, asr #7
	mov ip, r1, asr #3
	mov r3, r4, asr #7
	mov r0, lr, asr #7
	add r2, r5, r2, lsr #24
	mov r1, ip, asr #7
	add r3, r4, r3, lsr #24
	add r0, lr, r0, lsr #24
	mov r5, r2, asr #8
	mov r4, r3, asr #8
	add r1, ip, r1, lsr #24
	mov lr, r0, asr #8
	mov ip, r1, asr #8
	sub r3, r5, r0, asr #8
	sub r2, r4, r1, asr #8
	add r1, r3, #1
	add r0, r2, #1
	str r1, [sp, #0x10]
	str lr, [sp]
	str ip, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x128]
	str r5, [sp, #8]
	tst r0, #0x40
	str r4, [sp, #0xc]
	add r0, sp, #0
	add r1, sp, #0x10
	beq _022F97F4
	bl ov11_022F204C
	cmp r0, #0
	movne r5, #1
	bne _022F9910
_022F97F4:
	ldr r0, [r6, #0x128]
	tst r0, #0x80
	beq _022F9818
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov11_022F20CC
	cmp r0, #0
	movne r5, #1
	bne _022F9910
_022F9818:
	ldr r0, [r6, #0x128]
	tst r0, #0x100
	beq _022F9878
	ldrsh r0, [r6]
	add r2, sp, #0x24
	add r3, sp, #0x1c
	mov r1, #0x1100
	bl GetCollidingActorId
	movs r1, r0
	bmi _022F9878
	ldr r2, _022F99C8 ; =ov11_02324CF8
	mov r0, #0x250
	ldr r2, [r2, #4]
	smlabb r0, r1, r0, r2
	ldr r0, [r0, #0x128]
	tst r0, #0x1000
	beq _022F9870
	ldrsh r0, [r6]
	bl ov11_022F8AF4
	cmp r0, #0
	movne r5, #2
	bne _022F9910
_022F9870:
	mov r5, #1
	b _022F9910
_022F9878:
	ldr r0, [r6, #0x128]
	tst r0, #0x200
	beq _022F98D0
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x1100
	bl GetCollidingObjectId
	movs r4, r0
	bmi _022F98D0
	add r1, sp, #0x18
	bl ov11_022FCCA0
	ldr r0, [sp, #0x18]
	tst r0, #0x1000
	beq _022F98C8
	ldrsh r0, [r6]
	mov r1, r4
	bl ov11_022F8B54
	cmp r0, #0
	movne r5, #2
	bne _022F9910
_022F98C8:
	mov r5, #1
	b _022F9910
_022F98D0:
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F990C
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x1000
	bl GetCollidingEventId
	movs r1, r0
	bmi _022F990C
	ldrsh r0, [r6]
	bl ov11_022F8BB4
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	b _022F9910
_022F990C:
	mov r5, #0
_022F9910:
	cmp r5, #0
	bne _022F99B8
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	str r1, [r6, #0x15c]
	str r0, [r6, #0x160]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	str r1, [r6, #0x164]
	str r0, [r6, #0x168]
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F99B0
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x800
	bl GetCollidingEventId
	movs r4, r0
	bmi _022F999C
	ldrb r0, [r6, #0x152]
	cmp r0, #0
	add r0, r6, #0x100
	strneh r4, [r0, #0x54]
	bne _022F99A8
	ldrsh r0, [r0, #0x54]
	cmp r0, r4
	beq _022F99A8
	ldrsh r0, [r6]
	mov r1, r4
	bl ov11_022F8BB4
	cmp r0, #0
	addne r0, r6, #0x100
	strneh r4, [r0, #0x54]
	movne r5, #2
	b _022F99A8
_022F999C:
	add r0, r6, #0x100
	mvn r1, #0
	strh r1, [r0, #0x54]
_022F99A8:
	mov r0, #0
	strb r0, [r6, #0x152]
_022F99B0:
	mov r0, r5
	b _022F99BC
_022F99B8:
	mov r0, r5
_022F99BC:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F99C4: .word ov11_02321684
_022F99C8: .word ov11_02324CF8
	arm_func_end ov11_022F9638

	arm_func_start ov11_022F99CC
ov11_022F99CC: ; 0x022F99CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	ldmia r3, {r4, sb}
	ldr r3, [sp, #0x48]
	str r4, [sp, #0x20]
	str sb, [sp, #0x24]
	ldr lr, [r3]
	ldr r3, [r3, #4]
	sub r8, lr, #1
	sub r7, r3, #1
	mov ip, r8, asr #0xa
	mov r6, r7, asr #0xa
	mov sl, r4, asr #0xa
	mov r5, sb, asr #0xa
	add r8, r8, ip, lsr #21
	add r6, r7, r6, lsr #21
	mov ip, r8, asr #0xb
	add r5, sb, r5, lsr #21
	add r4, r4, sl, lsr #21
	mov r7, r6, asr #0xb
	sub r6, ip, r4, asr #11
	mov sb, r4, asr #0xb
	sub sl, r7, r5, asr #11
	mov r8, r5, asr #0xb
	add r6, r6, #1
	add sl, sl, #1
	str r3, [sp, #0x1c]
	mov r4, r2
	mov r5, r1
	str lr, [sp, #0x18]
	str sb, [sp, #0x10]
	str r8, [sp, #0x14]
	str r6, [sp]
	str sl, [sp, #4]
	ldrsh r0, [r0]
	add r2, sp, #0x20
	add r3, sp, #0x18
	mov r1, #0x2000
	str ip, [sp, #8]
	str r7, [sp, #0xc]
	bl GetCollidingActorId
	cmp r0, #0
	blt _022F9A88
	cmp r5, r0
	moveq r0, #3
	movne r0, #0
	b _022F9ACC
_022F9A88:
	add r1, sp, #0x20
	add r2, sp, #0x18
	mov r0, #0x2000
	bl GetCollidingObjectId
	cmp r0, #0
	blt _022F9AB0
	cmp r4, r0
	moveq r0, #3
	movne r0, #0
	b _022F9ACC
_022F9AB0:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, #0x10
	bl ov11_022F214C
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
_022F9ACC:
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov11_022F99CC

	arm_func_start ov11_022F9AD4
ov11_022F9AD4: ; 0x022F9AD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov r6, r1
	mov sl, r0
	mov sb, r2
	add r1, sp, #0x2c
	mov r0, r6
	mov r2, #0x100
	mov r8, r3
	bl sub_02005494
	ldr r1, _022F9F54 ; =ov11_02321684
	ldr r7, [sp, #0x2c]
	ldr r0, [r1, #0x9c]
	ldr r2, [r1, #0x98]
	str r0, [sp, #0x28]
	str r2, [sp, #0x24]
	ldr r0, [sl, #0x15c]
	ldr r5, [sp, #0x30]
	add r0, r0, r7
	str r0, [sp, #0x24]
	ldr r2, [sl, #0x160]
	add r3, sp, #0x24
	add r2, r2, r5
	str r2, [sp, #0x28]
	ldr fp, [r1, #0x90]
	ldr r2, [r1, #0x94]
	add r4, sp, #0x1c
	str r2, [sp, #0x20]
	str fp, [sp, #0x1c]
	ldr fp, [sl, #0x164]
	mov r0, sl
	add r7, fp, r7
	str r7, [sp, #0x1c]
	ldr r7, [sl, #0x168]
	mov r1, sb
	add r5, r7, r5
	str r5, [sp, #0x20]
	mov r2, r8
	str r4, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9B8C
	ldr r0, _022F9F58 ; =ov11_02321C54
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9B8C:
	ldr r1, [sl, #0xc]
	ldr r3, _022F9F54 ; =ov11_02321684
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	ldr r2, [sp, #0x2c]
	add r1, r1, #0x200
	mul r4, r2, r1
	ldr r2, [sl, #0x10]
	mov r1, r4, asr #7
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	add r1, r4, r1, lsr #24
	mov ip, r1, asr #8
	ldr r7, [r3, #0x80]
	ldr r5, [r3, #0x84]
	ldr r3, [sp, #0x30]
	add r2, r2, #0x200
	mul r4, r3, r2
	mov r2, r4, asr #7
	add r2, r4, r2, lsr #24
	ldr r4, _022F9F5C ; =ov11_023217F8
	mov fp, r2, asr #8
	str fp, [sp, #0x18]
	str r7, [sp, #0xc]
	str r5, [sp, #0x10]
	ldr r7, [sl, #0x15c]
	ldr r5, [sl, #0x14]
	ldr r3, _022F9F60 ; =ov11_02321818
	add r5, r7, r5
	add r1, r5, r1, asr #8
	sub r5, r1, #0x300
	str r5, [sp, #0xc]
	ldr r7, [sl, #0x160]
	ldr r1, [sl, #0x18]
	add r5, r5, #0x600
	add r1, r7, r1
	add r1, r1, r2, asr #8
	sub r2, r1, #0x300
	add r1, r2, #0x600
	str r5, [sp, #4]
	ldr lr, _022F9F64 ; =ov11_02321838
	str ip, [sp, #0x14]
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	ldr r4, [r4, r6, lsl #2]
	ldr r5, [r3, r6, lsl #2]
	ldr r6, [lr, r6, lsl #2]
	add fp, sp, #4
	mov r7, #0x200
	b _022F9D20
_022F9C54:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9C94
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9C94
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9C94
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9CA8
_022F9C94:
	ldr r0, _022F9F68 ; =ov11_02321C68
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9CA8:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	add r3, sp, #0xc
	str fp, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9CDC
	ldr r0, _022F9F6C ; =ov11_02321C88
	mov r1, r7
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9CDC:
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	add ip, r2, r3
	add r1, r1, r3
	ldr r3, [sp, #0x30]
	ldr r2, [sp, #0x10]
	str ip, [sp, #0xc]
	ldr ip, [sp, #8]
	str r1, [sp, #4]
	add r2, r2, r3
	add r1, ip, r3
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	cmp r0, #6
	beq _022F9D28
	add r7, r7, #0x100
_022F9D20:
	cmp r7, r4
	blt _022F9C54
_022F9D28:
	cmp r0, #6
	beq _022F9D44
	ldr r0, _022F9F70 ; =ov11_02321CA0
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9D44:
	add r8, sp, #4
	mvn r4, #0
	b _022F9E1C
_022F9D50:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9D90
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9D90
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9D90
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9DA4
_022F9D90:
	ldr r0, _022F9F74 ; =ov11_02321CBC
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9DA4:
	mov r0, sl
	mov r1, sb
	mov r2, r4
	add r3, sp, #0xc
	str r8, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9DD8
	ldr r0, _022F9F78 ; =ov11_02321CDC
	mov r1, r7
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9DD8:
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	add r2, r2, r3
	add fp, r1, r3
	ldr r1, [sp, #0x30]
	ldr ip, [sp, #0x10]
	ldr r3, [sp, #8]
	str r2, [sp, #0xc]
	add r2, ip, r1
	add r1, r3, r1
	str r2, [sp, #0x10]
	str fp, [sp, #4]
	str r1, [sp, #8]
	cmp r0, #6
	bne _022F9E24
	add r7, r7, #0x100
_022F9E1C:
	cmp r7, r5
	blt _022F9D50
_022F9E24:
	cmp r0, #6
	bne _022F9E40
	ldr r0, _022F9F7C ; =ov11_02321CF4
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9E40:
	mov r8, #0
	add r7, sp, #4
	mvn r5, #0
	add r4, sp, #0xc
	b _022F9F34
_022F9E54:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9E94
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9E94
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9E94
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9EA8
_022F9E94:
	ldr r0, _022F9F80 ; =ov11_02321D10
	mov r1, r8
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9EA8:
	mov r0, sl
	mov r1, sb
	mov r2, r5
	mov r3, r4
	str r7, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9EDC
	ldr r0, _022F9F84 ; =ov11_02321D30
	mov r1, r8
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9EDC:
	cmp r0, #6
	bne _022F9EF8
	ldr r0, _022F9F88 ; =ov11_02321D48
	mov r1, r8
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9EF8:
	ldr r2, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	add r0, r0, r2
	add r2, r1, r2
	ldr fp, [sp, #0x30]
	ldr r3, [sp, #0x10]
	ldr r1, [sp, #8]
	add r3, r3, fp
	add r1, r1, fp
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r2, [sp, #4]
	str r1, [sp, #8]
	add r8, r8, #0x100
_022F9F34:
	cmp r8, r6
	blt _022F9E54
	ldr r0, _022F9F8C ; =ov11_02321D6C
	mov r1, r8
	bl Debug_Print0
	mov r0, #0
_022F9F4C:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F9F54: .word ov11_02321684
_022F9F58: .word ov11_02321C54
_022F9F5C: .word ov11_023217F8
_022F9F60: .word ov11_02321818
_022F9F64: .word ov11_02321838
_022F9F68: .word ov11_02321C68
_022F9F6C: .word ov11_02321C88
_022F9F70: .word ov11_02321CA0
_022F9F74: .word ov11_02321CBC
_022F9F78: .word ov11_02321CDC
_022F9F7C: .word ov11_02321CF4
_022F9F80: .word ov11_02321D10
_022F9F84: .word ov11_02321D30
_022F9F88: .word ov11_02321D48
_022F9F8C: .word ov11_02321D6C
	arm_func_end ov11_022F9AD4

	arm_func_start ov11_022F9F90
ov11_022F9F90: ; 0x022F9F90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	movs r5, r1
	mov r6, r0
	mov r4, r2
	bmi _022FA028
	add r1, sp, #0x10
	mov r0, r5
	bl ov11_022F90F4
	ldr r1, [r6, #0x15c]
	ldr r0, [r6, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	sub r0, r2, r0
	str r0, [sp, #8]
	ldr r1, [r6, #0x160]
	ldr r0, [r6, #0x18]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	sub r1, r2, r0
	add r0, sp, #8
	str r1, [sp, #0xc]
	bl sub_020055C8
	mov r7, r0
	mvn r1, #0
	cmp r7, r1
	beq _022FA028
	add r1, sp, #0
	mov r2, #0x100
	bl sub_02005494
	mov r0, r6
	mov r1, r7
	mov r2, r5
	mvn r3, #0
	bl ov11_022F9AD4
	cmp r0, #0
	movne r0, #1
	bne _022FA0B4
_022FA028:
	cmp r4, #0
	blt _022FA0B0
	add r1, sp, #0x10
	mov r0, r4
	bl ov11_022FCCC4
	ldr r1, [r6, #0x15c]
	ldr r0, [r6, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	sub r0, r2, r0
	str r0, [sp, #8]
	ldr r1, [r6, #0x160]
	ldr r0, [r6, #0x18]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	sub r1, r2, r0
	add r0, sp, #8
	str r1, [sp, #0xc]
	bl sub_020055C8
	mvn r1, #0
	cmp r0, r1
	beq _022FA0B0
	add r1, sp, #0
	mov r2, #0x100
	bl sub_02005494
	add r0, r6, #0x100
	ldrsb r1, [r0, #0x5a]
	mov r0, r6
	mov r3, r4
	mvn r2, #0
	bl ov11_022F9AD4
	cmp r0, #0
	movne r0, #1
	bne _022FA0B4
_022FA0B0:
	mov r0, #0
_022FA0B4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022F9F90

	arm_func_start ov11_022FA0BC
ov11_022FA0BC: ; 0x022FA0BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	ldr r4, [r2]
	ldr r2, [r2, #4]
	mov r5, r4, asr #0xa
	str r4, [sp, #0x20]
	str r2, [sp, #0x24]
	ldr lr, [r3]
	ldr ip, [r3, #4]
	sub sb, lr, #1
	sub r8, ip, #1
	mov r3, sb, asr #0xa
	mov r7, r8, asr #0xa
	mov r6, r2, asr #0xa
	add r3, sb, r3, lsr #21
	add r5, r4, r5, lsr #21
	mov r4, r1
	mov r3, r3, asr #0xb
	add r7, r8, r7, lsr #21
	add r6, r2, r6, lsr #21
	mov r2, r7, asr #0xb
	sub r8, r3, r5, asr #11
	mov r1, r5, asr #0xb
	mov sb, r6, asr #0xb
	sub r7, r2, r6, asr #11
	add r8, r8, #1
	add r6, r7, #1
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r5, r0
	str lr, [sp, #0x18]
	str ip, [sp, #0x1c]
	str r1, [sp, #0x10]
	str sb, [sp, #0x14]
	str r8, [sp]
	str r6, [sp, #4]
	tst r4, #0x100
	add r2, sp, #0x20
	add r3, sp, #0x18
	beq _022FA184
	ldrsh r0, [r5]
	mov r1, #0x2000
	bl GetCollidingActorId
	movs r1, r0
	bmi _022FA184
	ldrsh r0, [r5]
	bl ov11_022F8AF4
	cmp r0, #0
	movne r0, #3
	bne _022FA1D4
_022FA184:
	tst r4, #0x200
	beq _022FA1B8
	add r1, sp, #0x20
	add r2, sp, #0x18
	mov r0, #0x2000
	bl GetCollidingObjectId
	movs r1, r0
	bmi _022FA1B8
	ldrsh r0, [r5]
	bl ov11_022F8B54
	cmp r0, #0
	movne r0, #3
	bne _022FA1D4
_022FA1B8:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, #0x10
	bl ov11_022F214C
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
_022FA1D4:
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov11_022FA0BC

	arm_func_start ov11_022FA1DC
ov11_022FA1DC: ; 0x022FA1DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x58
	mov r4, r0
	add r0, r4, #0x100
	mov r5, #0x300
	mvn r7, #0
	strh r5, [r0, #0x76]
	mov r5, #1
	strh r5, [r0, #0x78]
	str r1, [r4, #0x14c]
	cmp r2, r7
	beq _022FA21C
	cmp r3, #0
	mov r5, r2
	strneb r2, [r4, #0x15a]
	b _022FA220
_022FA21C:
	ldrsb r5, [r0, #0x5a]
_022FA220:
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _022FA924
_022FA22C: ; jump table
	b _022FA924 ; case 0
	b _022FA2A4 ; case 1
	b _022FA27C ; case 2
	b _022FA2CC ; case 3
	b _022FA2CC ; case 4
	b _022FA2CC ; case 5
	b _022FA2CC ; case 6
	b _022FA2CC ; case 7
	b _022FA2CC ; case 8
	b _022FA47C ; case 9
	b _022FA4C8 ; case 10
	b _022FA4A4 ; case 11
	b _022FA924 ; case 12
	b _022FA924 ; case 13
	b _022FA924 ; case 14
	b _022FA924 ; case 15
	b _022FA924 ; case 16
	b _022FA924 ; case 17
	b _022FA8F0 ; case 18
	b _022FA914 ; case 19
_022FA27C:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA2A4:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	mov r7, #0x300
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA2CC:
	mvn r0, #0
	cmp r2, r0
	beq _022FA450
	mov sb, #4
	str sb, [r4, #0x17c]
	cmp r1, #8
	mov r8, #0
	addls pc, pc, r1, lsl #2
	b _022FA334
_022FA2F0: ; jump table
	b _022FA334 ; case 0
	b _022FA334 ; case 1
	b _022FA334 ; case 2
	b _022FA314 ; case 3
	b _022FA320 ; case 4
	b _022FA32C ; case 5
	b _022FA314 ; case 6
	b _022FA320 ; case 7
	b _022FA32C ; case 8
_022FA314:
	mov r7, #0x900
	mov sb, #1
	b _022FA340
_022FA320:
	mov r7, #0x800
	mov sb, #2
	b _022FA340
_022FA32C:
	mov r7, #0xa00
	b _022FA340
_022FA334:
	mov sb, #0
	ldr r7, _022FA9C4 ; =0x00000807
	str sb, [r4, #0x17c]
_022FA340:
	mov r0, r2
	add r1, sp, #0x50
	mov r2, #0x100
	bl sub_02005494
	ldr r0, _022FA9C8 ; =ov11_02321684
	mov sl, #0
	ldr r6, [r0, #0x30]
	ldr r2, [r0, #0x34]
	ldr r1, [r0, #0x20]
	ldr r5, [r0, #0x24]
	str r6, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp]
	str r5, [sp, #4]
	add fp, sp, #0x50
	b _022FA408
_022FA380:
	mov r0, r4
	mov r1, fp
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	bne _022FA3A4
	add r0, r4, #0x12c
	bl ov11_022EAF60
	b _022FA410
_022FA3A4:
	cmp r8, #1
	bne _022FA404
	ldr r1, [sp, #0x54]
	add r0, r4, #0x12c
	str r6, [sp, #0x48]
	str r1, [sp, #0x4c]
	bl ov11_022EAF60
	mov r0, r4
	add r1, sp, #0x48
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	beq _022FA410
	cmp r8, #1
	bne _022FA404
	ldr r2, [sp, #0x50]
	mov r0, r4
	add r1, sp, #0x40
	str r5, [sp, #0x44]
	str r2, [sp, #0x40]
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	beq _022FA410
_022FA404:
	add sl, sl, #1
_022FA408:
	cmp sl, sb
	blt _022FA380
_022FA410:
	cmp r8, #2
	ldr r0, [r4, #0x128]
	bne _022FA438
	mvn r7, #0
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA438:
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA450:
	mov r0, #0
	str r0, [r4, #0x14c]
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA47C:
	ldrsh r0, [r4, #2]
	mov r1, #0xa
	bl SetActorTalkMainAndActorTalkSub
	mov r0, r4
	mov r1, #0xa
	bl ov11_022F8AA8
	mov r0, #0
	mov r1, #0xb
	bl ov11_022F881C
	b _022FA93C
_022FA4A4:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA4C8
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FA4C8:
	add r1, sp, #0x10
	mov r0, r5
	mov r2, #0x100
	bl sub_02005494
	ldr r0, _022FA9C8 ; =ov11_02321684
	ldr r1, [sp, #0x10]
	ldr r2, [r0, #0x5c]
	ldr r3, [r0, #0x58]
	str r2, [sp, #0x1c]
	str r3, [sp, #0x18]
	ldr r2, [r4, #0x15c]
	ldr r6, [sp, #0x14]
	add r2, r2, r1
	str r2, [sp, #0x18]
	ldr r3, [r4, #0x160]
	add r2, sp, #0x18
	add r3, r3, r6
	str r3, [sp, #0x1c]
	ldr r8, [r0, #0x50]
	ldr r0, [r0, #0x54]
	add r3, sp, #0x20
	str r0, [sp, #0x24]
	str r8, [sp, #0x20]
	ldr r8, [r4, #0x164]
	mov r0, r4
	add r1, r8, r1
	str r1, [sp, #0x20]
	ldr r8, [r4, #0x168]
	mov r1, #0x300
	add r6, r8, r6
	str r6, [sp, #0x24]
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA55C
	ldr r0, _022FA9CC ; =ov11_02321C54
	bl Debug_Print0
	b _022FA93C
_022FA55C:
	ldr r1, [r4, #0xc]
	ldr sl, _022FA9D0 ; =ov11_023217F8
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	ldr r2, [sp, #0x10]
	add r1, r1, #0x200
	mul r8, r2, r1
	ldr r2, [r4, #0x10]
	mov r1, r8, asr #7
	add r2, r2, r2, lsr #31
	ldr r3, _022FA9C8 ; =ov11_02321684
	mov r6, r2, asr #1
	add r8, r8, r1, lsr #24
	ldr sb, [sp, #0x14]
	ldr r2, [r3, #0x160]
	ldr r1, [r3, #0x164]
	add r3, r6, #0x200
	mul r6, sb, r3
	mov r3, r6, asr #7
	add sb, r6, r3, lsr #24
	mov r6, r8, asr #8
	mov r3, sb, asr #8
	str r2, [sp, #0x30]
	str r1, [sp, #0x34]
	ldr r2, [r4, #0x15c]
	ldr r1, [r4, #0x14]
	str r6, [sp, #0x28]
	add r1, r2, r1
	add r1, r1, r8, asr #8
	sub r2, r1, #0x300
	str r2, [sp, #0x30]
	ldr fp, _022FA9D4 ; =ov11_02321838
	ldr r6, [r4, #0x160]
	ldr r1, [r4, #0x18]
	add r2, r2, #0x600
	add r1, r6, r1
	add r1, r1, sb, asr #8
	sub r6, r1, #0x300
	ldr ip, _022FA9D8 ; =ov11_02321818
	add r1, r6, #0x600
	str r6, [sp, #0x34]
	ldr r8, [fp, r5, lsl #2]
	str r3, [sp, #0x2c]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	ldr sl, [sl, r5, lsl #2]
	ldr sb, [ip, r5, lsl #2]
	add r5, sp, #0x30
	add fp, sp, #0x38
	mov r6, #0x200
	b _022FA6E8
_022FA628:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA668
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA668
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA668
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA678
_022FA668:
	ldr r0, _022FA9DC ; =ov11_02321C68
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA678:
	mov r0, r4
	mov r1, #0x300
	mov r2, r5
	mov r3, fp
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA6A4
	ldr r0, _022FA9E0 ; =ov11_02321C88
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA6A4:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add ip, r2, r3
	add r1, r1, r3
	ldr r3, [sp, #0x14]
	ldr r2, [sp, #0x34]
	str ip, [sp, #0x30]
	ldr ip, [sp, #0x3c]
	str r1, [sp, #0x38]
	add r2, r2, r3
	add r1, ip, r3
	str r2, [sp, #0x34]
	str r1, [sp, #0x3c]
	cmp r0, #6
	beq _022FA6F0
	add r6, r6, #0x100
_022FA6E8:
	cmp r6, sl
	blt _022FA628
_022FA6F0:
	cmp r0, #6
	beq _022FA708
	ldr r0, _022FA9E4 ; =ov11_02321CA0
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA708:
	mov sl, #0x100
	add r5, sp, #0x30
	b _022FA7D4
_022FA714:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA754
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA754
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA754
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA764
_022FA754:
	ldr r0, _022FA9E8 ; =ov11_02321CBC
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA764:
	mov r0, r4
	mov r1, sl
	mov r2, r5
	add r3, sp, #0x38
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA790
	ldr r0, _022FA9EC ; =ov11_02321CDC
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA790:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add r2, r2, r3
	add fp, r1, r3
	ldr r1, [sp, #0x14]
	ldr ip, [sp, #0x34]
	ldr r3, [sp, #0x3c]
	str r2, [sp, #0x30]
	add r2, ip, r1
	add r1, r3, r1
	str r2, [sp, #0x34]
	str fp, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r0, #6
	bne _022FA7DC
	add r6, r6, #0x100
_022FA7D4:
	cmp r6, sb
	blt _022FA714
_022FA7DC:
	cmp r0, #6
	bne _022FA7F4
	ldr r0, _022FA9F0 ; =ov11_02321CF4
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA7F4:
	mov sl, #0
	mov sb, #0x100
	add r6, sp, #0x30
	add r5, sp, #0x38
	b _022FA8D8
_022FA808:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA848
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA848
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA848
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA858
_022FA848:
	ldr r0, _022FA9F4 ; =ov11_02321D10
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA858:
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, r5
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA884
	ldr r0, _022FA9F8 ; =ov11_02321D30
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA884:
	cmp r0, #6
	bne _022FA89C
	ldr r0, _022FA9FC ; =ov11_02321D48
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA89C:
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add r0, r0, r2
	add r2, r1, r2
	ldr fp, [sp, #0x14]
	ldr r3, [sp, #0x34]
	ldr r1, [sp, #0x3c]
	add r3, r3, fp
	add r1, r1, fp
	str r0, [sp, #0x30]
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	add sl, sl, #0x100
_022FA8D8:
	cmp sl, r8
	blt _022FA808
	ldr r0, _022FAA00 ; =ov11_02321D6C
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA8F0:
	bl KeyWaitInit
	mov r0, #4
	bl PlaySeVolumeWrapper
	bl sub_020676AC
	bl ov11_02300D5C
	add r0, r4, #0x12c
	mov r1, #6
	bl ov11_022EA990
	b _022FA93C
_022FA914:
	mov r0, r4
	mov r1, #0x2ac
	bl ov11_022F8AA8
	b _022FA93C
_022FA924:
	ldr r0, [r4, #0x128]
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FA93C:
	mvn r0, #0
	cmp r7, r0
	addne r2, r4, #0x100
	ldrnesh r0, [r2, #0x80]
	cmpne r7, r0
	beq _022FA97C
	mov r0, #0
	strb r0, [r4, #0x174]
	ldrsb r1, [r2, #0x5a]
	add r0, r4, #0x18c
	strb r1, [r4, #0x175]
	strh r7, [r2, #0x80]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
	b _022FA9BC
_022FA97C:
	ldrb r0, [r4, #0x174]
	cmp r0, #0
	addeq r0, r4, #0x100
	ldreqsb r1, [r0, #0x75]
	ldreqsb r0, [r0, #0x5a]
	cmpeq r1, r0
	beq _022FA9BC
	mov r0, #0
	strb r0, [r4, #0x174]
	add r2, r4, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r4, #0x18c
	strb r1, [r4, #0x175]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
_022FA9BC:
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FA9C4: .word 0x00000807
_022FA9C8: .word ov11_02321684
_022FA9CC: .word ov11_02321C54
_022FA9D0: .word ov11_023217F8
_022FA9D4: .word ov11_02321838
_022FA9D8: .word ov11_02321818
_022FA9DC: .word ov11_02321C68
_022FA9E0: .word ov11_02321C88
_022FA9E4: .word ov11_02321CA0
_022FA9E8: .word ov11_02321CBC
_022FA9EC: .word ov11_02321CDC
_022FA9F0: .word ov11_02321CF4
_022FA9F4: .word ov11_02321D10
_022FA9F8: .word ov11_02321D30
_022FA9FC: .word ov11_02321D48
_022FAA00: .word ov11_02321D6C
	arm_func_end ov11_022FA1DC

	arm_func_start GetIdLiveActor
GetIdLiveActor: ; 0x022FAA04
	ldrsh r0, [r0]
	bx lr
	arm_func_end GetIdLiveActor

	arm_func_start GetCollisionBoxLiveActor
GetCollisionBoxLiveActor: ; 0x022FAA0C
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x10]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxLiveActor

	arm_func_start SetPositionInitialLiveActor
SetPositionInitialLiveActor: ; 0x022FAA20
	cmp r1, #0
	beq _022FAA6C
	ldr r3, [r1]
	ldr r2, [r0, #0x14]
	sub r2, r3, r2
	str r2, [r0, #0x15c]
	ldr r3, [r1]
	ldr r2, [r0, #0x14]
	add r2, r3, r2
	str r2, [r0, #0x164]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x160]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x18]
	add r1, r2, r1
	str r1, [r0, #0x168]
	bx lr
_022FAA6C:
	ldr r3, [r0, #0x20]
	ldr r1, [r0, #0x14]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x15c]
	ldr r3, [r0, #0x20]
	ldr r1, [r0, #0x14]
	add r1, r3, r1
	str r1, [r0, #0x164]
	ldr ip, [r0, #0x24]
	ldr r3, [r0, #0x18]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x160]
	ldr ip, [r0, #0x24]
	ldr r3, [r0, #0x18]
	add r3, ip, r3
	str r3, [r0, #0x168]
	str r2, [r0, #0x170]
	str r2, [r0, #0x16c]
	ldrsb r2, [r1, #0x5a]
	ldrsb r1, [r0, #0x1c]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x174]
	ldrsb r1, [r0, #0x1c]
	strb r1, [r0, #0x15a]
	bx lr
	arm_func_end SetPositionInitialLiveActor

	arm_func_start SetMovementRangeLiveActor
SetMovementRangeLiveActor: ; 0x022FAADC
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x28]
	str r1, [r0, #0x2c]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end SetMovementRangeLiveActor

	arm_func_start GetCollisionBoxCenterLiveActor
GetCollisionBoxCenterLiveActor: ; 0x022FAB00
	ldr r3, [r0, #0x15c]
	ldr r2, [r0, #0x14]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x160]
	ldr r0, [r0, #0x18]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxCenterLiveActor

	arm_func_start SetPositionLiveActorVeneer
SetPositionLiveActorVeneer: ; 0x022FAB24
	ldr ip, _022FAB2C ; =SetPositionLiveActor
	bx ip
	.align 2, 0
_022FAB2C: .word SetPositionLiveActor
	arm_func_end SetPositionLiveActorVeneer

	arm_func_start GetHeightLiveActor
GetHeightLiveActor: ; 0x022FAB30
	ldr r3, [r0, #0x16c]
	str r3, [r1]
	ldr r0, [r0, #0x170]
	str r0, [r2]
	bx lr
	arm_func_end GetHeightLiveActor

	arm_func_start SetHeightLiveActor
SetHeightLiveActor: ; 0x022FAB44
	str r1, [r0, #0x16c]
	bx lr
	arm_func_end SetHeightLiveActor

	arm_func_start GetDirectionLiveActor
GetDirectionLiveActor: ; 0x022FAB4C
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x5a]
	strb r0, [r1]
	bx lr
	arm_func_end GetDirectionLiveActor

	arm_func_start SetDirectionLiveActor
SetDirectionLiveActor: ; 0x022FAB5C
	mvn r2, #0
	cmp r1, r2
	strneb r1, [r0, #0x15a]
	addne r1, r0, #0x100
	ldrnesb r2, [r1, #0x75]
	ldrnesb r1, [r1, #0x5a]
	cmpne r2, r1
	movne r1, #1
	strneb r1, [r0, #0x174]
	bx lr
	arm_func_end SetDirectionLiveActor

	arm_func_start SetAnimationLiveActor
SetAnimationLiveActor: ; 0x022FAB84
	ldrh r2, [r0]
	cmp r2, #2
	bhi _022FABC0
	ldrsh r3, [r0, #0xa]
	ldr r2, _022FABC8 ; =0x00000119
	cmp r3, r2
	addne r2, r2, #0x258
	cmpne r3, r2
	bne _022FABC0
	and r2, r1, #0xff
	cmp r2, #0x16
	andhs r1, r1, #0x1f00
	orrhs r1, r1, #0x53
	movhs r1, r1, lsl #0x10
	movhs r1, r1, lsr #0x10
_022FABC0:
	ldr ip, _022FABCC ; =ChangeActorAnimation
	bx ip
	.align 2, 0
_022FABC8: .word 0x00000119
_022FABCC: .word ChangeActorAnimation
	arm_func_end SetAnimationLiveActor

	arm_func_start SetEffectLiveActor
SetEffectLiveActor: ; 0x022FABD0
	add ip, r0, #0x100
	strh r1, [ip, #0x82]
	strh r2, [ip, #0x84]
	str r3, [r0, #0x188]
	bx lr
	arm_func_end SetEffectLiveActor

	arm_func_start GetAnimationStatusLiveActor
GetAnimationStatusLiveActor: ; 0x022FABE4
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x174]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x18c
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end GetAnimationStatusLiveActor

	arm_func_start GetEffectStatusLiveActor
GetEffectStatusLiveActor: ; 0x022FAC04
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r1, [r1, #0x84]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x18c
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end GetEffectStatusLiveActor

	arm_func_start GetAttributeBitfieldLiveActor
GetAttributeBitfieldLiveActor: ; 0x022FAC28
	ldr r0, [r0, #0x128]
	str r0, [r1]
	bx lr
	arm_func_end GetAttributeBitfieldLiveActor

	arm_func_start SetAttributeBitfieldLiveActorWrapper
SetAttributeBitfieldLiveActorWrapper: ; 0x022FAC34
	ldr ip, _022FAC40 ; =SetAttributeBitfieldLiveActor
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_022FAC40: .word SetAttributeBitfieldLiveActor
	arm_func_end SetAttributeBitfieldLiveActorWrapper

	arm_func_start ResetAttributeBitfieldLiveActorWrapper
ResetAttributeBitfieldLiveActorWrapper: ; 0x022FAC44
	ldr ip, _022FAC50 ; =ResetAttributeBitfieldLiveActor
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_022FAC50: .word ResetAttributeBitfieldLiveActor
	arm_func_end ResetAttributeBitfieldLiveActorWrapper

	arm_func_start SetBlinkLiveActor
SetBlinkLiveActor: ; 0x022FAC54
	ldr ip, _022FAC60 ; =ov11_022F4984
	add r0, r0, #0x18c
	bx ip
	.align 2, 0
_022FAC60: .word ov11_022F4984
	arm_func_end SetBlinkLiveActor

	arm_func_start SetPositionOffsetLiveActor
SetPositionOffsetLiveActor: ; 0x022FAC64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r2, _022FAE54 ; =ov11_02321684
	mov r5, r0
	ldr r0, [r2, #0xd4]
	ldr r3, [r2, #0xd0]
	str r0, [sp, #4]
	str r3, [sp]
	ldr r4, [r5, #0x15c]
	ldr r3, [r1]
	add r0, r5, #0x38
	add r3, r4, r3
	str r3, [sp]
	ldr r4, [r5, #0x160]
	ldr r3, [r1, #4]
	add r3, r4, r3
	str r3, [sp, #4]
	ldr r3, [r2, #0xc8]
	ldr r2, [r2, #0xcc]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r5, #0x164]
	ldr r2, [r1]
	add r2, r3, r2
	str r2, [sp, #8]
	ldr r2, [r5, #0x168]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0xc]
	bl ov11_022DC958
	cmp r0, #0
	bne _022FAE0C
	ldr r1, [r5, #0x28]
	ldr r0, [sp]
	mov r4, #0
	cmp r0, r1
	bge _022FAD14
	str r1, [sp]
	ldr r1, [r5, #0x28]
	ldr r0, [r5, #0xc]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #8]
	b _022FAD3C
_022FAD14:
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #8]
	cmp r0, r1
	blt _022FAD3C
	ldr r0, [r5, #0xc]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #0x30]
	str r0, [sp, #8]
_022FAD3C:
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #4]
	cmp r0, r1
	bge _022FAD68
	str r1, [sp, #4]
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x10]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #0xc]
	b _022FAD90
_022FAD68:
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _022FAD90
	ldr r0, [r5, #0x10]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0xc]
_022FAD90:
	add r1, sp, #0
	add r2, sp, #8
	mov r0, r5
	bl ov11_022F921C
	movs r6, r0
	beq _022FADC4
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE48
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FAE48
_022FADC4:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r4, #0
	str r1, [r5, #0x15c]
	str r0, [r5, #0x160]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x164]
	str r0, [r5, #0x168]
	beq _022FAE2C
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE04
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FAE04:
	mov r6, #0x40
	b _022FAE48
_022FAE0C:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [r5, #0x15c]
	str r0, [r5, #0x160]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x164]
	str r0, [r5, #0x168]
_022FAE2C:
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE44
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FAE44:
	mov r6, #0
_022FAE48:
	mov r0, r6
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FAE54: .word ov11_02321684
	arm_func_end SetPositionOffsetLiveActor

	arm_func_start ov11_022FAE58
ov11_022FAE58: ; 0x022FAE58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x9c
	ldr r1, _022FBA18 ; =ov11_02324CF8
	mvn r2, #0
	ldmia r1, {r0, r5}
	add r0, r0, #0x300
	strh r2, [r0, #0x28]
	ldr r0, [r1]
	mov r4, #0
	ldr fp, _022FBA1C ; =ov11_02321684
	str r4, [r0, #0x32c]
	ldr sl, [fp, #0xb8]
	ldr sb, [fp, #0xbc]
	ldr r8, [fp, #8]
	ldr r7, [fp, #0xc]
	ldr r6, [fp, #0x150]
	ldr r3, [fp, #0x154]
	ldr r2, [fp, #0xb0]
	ldr r1, [fp, #0xb4]
	ldr r0, [fp, #0x158]
	ldr fp, [fp, #0x15c]
	str sl, [sp, #0x2c]
	str sb, [sp, #0x30]
	str r8, [sp, #0x24]
	str r7, [sp, #0x28]
	str r6, [sp, #0x1c]
	str r3, [sp, #0x20]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0xc]
	str fp, [sp, #0x10]
_022FAED4:
	ldrsh r1, [r5, #2]
	mvn r0, #0
	cmp r1, r0
	ldrneb r0, [r5, #4]
	cmpne r0, #0
	beq _022FB894
	add r0, r5, #0x38
	bl FuncThatCallsRunNextOpcode
	cmp r0, #0
	beq _022FAF24
	mov r1, #1
	strb r1, [r5, #0x152]
	strb r1, [r5, #0x156]
	mov r1, #0
	str r1, [r5, #0x14c]
	cmp r0, #6
	bne _022FB864
	mov r0, r4
	bl DeleteLiveActor
	b _022FB894
_022FAF24:
	ldrsh r1, [r5, #6]
	mvn r0, #0
	cmp r1, r0
	bne _022FAF4C
	mov r0, #1
	strb r0, [r5, #0x152]
	strb r0, [r5, #0x156]
	mov r0, #0
	str r0, [r5, #0x14c]
	b _022FB864
_022FAF4C:
	ldr r1, [r5, #0x128]
	tst r1, #1
	beq _022FB39C
	mov r1, #0
	str r1, [sp, #0x98]
	strb r0, [sp, #8]
	str r1, [sp, #0x94]
	bl ov11_022F9074
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x152]
	streqb r0, [r5, #0x156]
	beq _022FAFA0
	ldrb r0, [r5, #0x156]
	cmp r0, #0
	beq _022FAFA0
	bl sub_02006DC8
	add r0, r5, #0x12c
	bl ov11_022EAF60
	mov r0, #0
	strb r0, [r5, #0x156]
_022FAFA0:
	ldr r2, _022FBA18 ; =ov11_02324CF8
	add r3, sp, #0x8c
	ldr r0, [r2]
	add r1, sp, #0x98
	add r0, r0, #0x300
	strh r4, [r0, #0x28]
	ldr r0, [r2]
	add r2, sp, #8
	str r5, [r0, #0x32c]
	str r3, [sp]
	ldr r6, [r5, #0x128]
	add r3, sp, #0x94
	add r0, r5, #0x12c
	str r6, [sp, #4]
	bl ov11_022EAA24
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022FB864
_022FAFE8: ; jump table
	b _022FB864 ; case 0
	b _022FB00C ; case 1
	b _022FB090 ; case 2
	b _022FB108 ; case 3
	b _022FB270 ; case 4
	b _022FB864 ; case 5
	b _022FB068 ; case 6
	b _022FB864 ; case 7
	b _022FB068 ; case 8
_022FB00C:
	ldr r0, [sp, #0x98]
	cmp r0, #0
	beq _022FB024
	sub r0, r0, #3
	cmp r0, #2
	bhi _022FB040
_022FB024:
	ldrsb r1, [sp, #8]
	mvn r0, #0
	cmp r1, r0
	beq _022FB048
	add r0, r5, #0x12c
	bl ov11_022EAF60
	b _022FB048
_022FB040:
	add r0, r5, #0x12c
	bl ov11_022EAF60
_022FB048:
	ldr r1, [sp, #0x94]
	mov r0, r5
	str r1, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB068:
	add r0, r5, #0x12c
	bl ov11_022EAF60
	ldr r1, [sp, #0x94]
	mov r0, r5
	str r1, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB090:
	ldr r1, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r2, [sp, #0x90]
	add r1, r1, r0
	mov r0, r1, asr #7
	ldr r3, [sp, #0x8c]
	add r0, r1, r0, lsr #24
	sub r0, r3, r0, asr #8
	str r0, [sp, #0x84]
	ldr r1, [r5, #0x160]
	ldr r0, [r5, #0x18]
	add r2, r2, #8
	add r1, r1, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	sub r1, r2, r0, asr #8
	add r0, sp, #0x84
	str r1, [sp, #0x88]
	bl sub_020054C0
	strb r0, [sp, #8]
	add r0, r5, #0x12c
	bl ov11_022EAF60
	mov r0, #0
	str r0, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r0, r5
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB108:
	ldr r1, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r3, [sp, #0x90]
	add r1, r1, r0
	mov r0, r1, asr #7
	ldr r2, [sp, #0x8c]
	add r0, r1, r0, lsr #24
	sub r0, r2, r0, asr #8
	str r0, [sp, #0x7c]
	ldr r2, [r5, #0x160]
	ldr r1, [r5, #0x18]
	add r3, r3, #8
	add r2, r2, r1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	sub r2, r3, r1, asr #8
	str r2, [sp, #0x80]
	ldr r1, [r5, #0x14c]
	sub r1, r1, #3
	cmp r1, #2
	bhi _022FB194
	mvn r1, #3
	cmp r0, r1
	blt _022FB1CC
	cmp r0, #4
	bgt _022FB1CC
	cmp r2, r1
	blt _022FB1CC
	cmp r2, #4
	bgt _022FB1CC
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB194:
	mvn r1, #0xb
	cmp r0, r1
	blt _022FB1CC
	cmp r0, #0xc
	bgt _022FB1CC
	cmp r2, r1
	blt _022FB1CC
	cmp r2, #0xc
	bgt _022FB1CC
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB1CC:
	add r0, sp, #0x7c
	bl sub_020054C0
	strb r0, [sp, #8]
	ldrsb r2, [sp, #8]
	mvn r0, #0
	cmp r2, r0
	beq _022FB264
	ldr r0, [sp, #0x98]
	cmp r0, #0xc
	beq _022FB208
	cmp r0, #0xd
	beq _022FB224
	cmp r0, #0xe
	beq _022FB240
	b _022FB25C
_022FB208:
	mov r6, #0
	mov r0, r5
	mov r1, #3
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB224:
	mov r6, #0
	mov r0, r5
	mov r1, #4
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB240:
	mov r6, #0
	mov r0, r5
	mov r1, #5
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB25C:
	mov r0, #0
	str r0, [r5, #0x14c]
_022FB264:
	add r0, r5, #0x12c
	bl ov11_022EAF60
	b _022FB864
_022FB270:
	ldr r0, [sp, #0x94]
	ldr r6, [sp, #0x90]
	cmp r0, #0
	ldr r2, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r3, [sp, #0x8c]
	add r2, r2, r0
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	sub r0, r3, r0, asr #8
	str r0, [sp, #0x74]
	ldr r3, [r5, #0x160]
	ldr r2, [r5, #0x18]
	movne r1, #1
	add r3, r3, r2
	mov r2, r3, asr #7
	add r6, r6, #8
	add r2, r3, r2, lsr #24
	sub r3, r6, r2, asr #8
	moveq r1, #0
	mvn r2, #1
	str r3, [sp, #0x78]
	cmp r0, r2
	and r6, r1, #0xff
	blt _022FB300
	cmp r0, #2
	bgt _022FB300
	cmp r3, r2
	blt _022FB300
	cmp r3, #2
	bgt _022FB300
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB300:
	add r0, sp, #0x74
	bl sub_020054C0
	strb r0, [sp, #8]
	ldrsb r2, [sp, #8]
	mvn r0, #0
	cmp r2, r0
	beq _022FB864
	ldr r0, [sp, #0x98]
	cmp r0, #0xf
	beq _022FB33C
	cmp r0, #0x10
	beq _022FB358
	cmp r0, #0x11
	beq _022FB374
	b _022FB390
_022FB33C:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #6
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB358:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #7
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB374:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #8
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB390:
	mov r0, #0
	str r0, [r5, #0x14c]
	b _022FB864
_022FB39C:
	tst r1, #2
	beq _022FB864
	mov r0, #0
	str r0, [r5, #0x14c]
	add r1, r5, #0x100
	ldr r3, _022FBA18 ; =ov11_02324CF8
	ldrsh r8, [r1, #0x50]
	ldr r6, [r3]
	mov r2, #0xc
	smlabb r7, r8, r2, r6
	cmp r8, #0
	beq _022FB864
	mov r2, #0x300
	strh r2, [r1, #0x76]
	mov r2, #1
	strh r2, [r1, #0x78]
	ldr r8, [r5, #0x15c]
	ldr r6, [r5, #0x14]
	ldr r2, [r5, #0x160]
	ldr r1, [r5, #0x18]
	add r6, r8, r6
	add r2, r2, r1
	str r6, [sp, #0x3c]
	str r2, [sp, #0x40]
	ldr r1, [r7, #8]
	str r6, [sp, #0x34]
	str r2, [sp, #0x38]
	cmp r1, #0
	bge _022FB42C
	ldr r1, [r3]
	ldr r1, [r1, #0x24]
	cmp r1, #0
	blt _022FB864
	str r1, [r7, #8]
	str r0, [r7]
	str r0, [r7, #4]
_022FB42C:
	ldr sl, [r7]
	mov sb, #1
	ldr lr, _022FBA18 ; =ov11_02324CF8
	mov fp, #0xc
	b _022FB570
_022FB440:
	ldr ip, [lr]
	ldr r0, [r7, #8]
	add r1, ip, #0x28
	mla r8, r0, fp, r1
	ldr r6, [r8, #4]
	ldr r2, [sp, #0x3c]
	ldr r1, [r8, #8]
	sub r3, r6, r2
	str r3, [sp, #0x44]
	cmp r3, #0
	ldr r0, [sp, #0x40]
	sub r0, r1, r0
	str r0, [sp, #0x48]
	ble _022FB494
	cmp r3, sl
	addgt r0, r2, sl
	strgt r0, [sp, #0x3c]
	movgt sb, #0
	strle r6, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	b _022FB4C4
_022FB494:
	cmp r3, #0
	bge _022FB4C0
	rsb r0, sl, #0
	cmp r3, r0
	sublt r0, r2, sl
	strlt r0, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	movlt sb, #0
	strge r6, [sp, #0x3c]
	rsb r1, r0, #0
	b _022FB4C4
_022FB4C0:
	mov r1, #0
_022FB4C4:
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _022FB4FC
	cmp r0, sl
	ldrgt r0, [sp, #0x40]
	movgt sb, #0
	addgt r0, r0, sl
	strgt r0, [sp, #0x40]
	bgt _022FB530
	ldr r2, [r8, #8]
	cmp r0, r1
	str r2, [sp, #0x40]
	movgt r1, r0
	b _022FB530
_022FB4FC:
	bge _022FB530
	rsb r2, sl, #0
	cmp r0, r2
	ldrlt r0, [sp, #0x40]
	movlt sb, #0
	sublt r0, r0, sl
	strlt r0, [sp, #0x40]
	blt _022FB530
	ldr r3, [r8, #8]
	rsb r2, r1, #0
	cmp r0, r2
	str r3, [sp, #0x40]
	rsblt r1, r0, #0
_022FB530:
	cmp sb, #0
	beq _022FB570
	sub sl, sl, r1
	cmp sl, #0
	movle sb, #0
	ble _022FB570
	ldr r0, [ip, #0x24]
	ldr r1, [r7, #8]
	cmp r1, r0
	moveq sb, #0
	beq _022FB570
	add r0, r1, #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r0, r1, r0, ror #26
	str r0, [r7, #8]
_022FB570:
	cmp sb, #0
	bne _022FB440
	ldr r0, _022FBA18 ; =ov11_02324CF8
	ldr r3, [r7, #8]
	ldr r1, [r0]
	mov r6, #0
	ldr r0, [r1, #0x24]
	cmp r0, r3
	ble _022FB5BC
	add sb, r3, #1
	mov r2, #0xc
	b _022FB5B0
_022FB5A0:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB5B0:
	cmp sb, r0
	blt _022FB5A0
	b _022FB608
_022FB5BC:
	bge _022FB608
	add sb, r3, #1
	mov r2, #0xc
	b _022FB5DC
_022FB5CC:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB5DC:
	cmp sb, #0x40
	blt _022FB5CC
	mov sb, #0
	mov r2, #0xc
	b _022FB600
_022FB5F0:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB600:
	cmp sb, r0
	blt _022FB5F0
_022FB608:
	ldr r0, _022FBA18 ; =ov11_02324CF8
	ldr lr, [sp, #0x14]
	ldr r2, [r0]
	ldr ip, [sp, #0x18]
	add r8, r5, #0x100
	add r0, r2, #0x28
	mov r1, #0xc
	mla r0, r3, r1, r0
	ldrsh r3, [r8, #0x50]
	ldr sl, _022FBA20 ; =ov11_023217EC
	ldr r8, [sp, #0x40]
	mla r2, r3, r1, r2
	ldmib r0, {r1, sb}
	ldr r0, [sp, #0x3c]
	sub r8, sb, r8
	sub r0, r1, r0
	ldr r2, [r2, #-8]
	ldr r1, [sl, r3, lsl #2]
	str r8, [sp, #0x50]
	str lr, [sp, #0x54]
	str r0, [sp, #0x4c]
	str ip, [sp, #0x58]
	add r8, r2, r1
	bl abs
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x50]
	bl abs
	ldr r1, [sp, #0x54]
	str r0, [sp, #0x58]
	cmp r1, r0
	movle r1, r0
	add r1, r6, r1
	str r1, [r7, #4]
	cmp r1, r8
	bgt _022FB6A8
	ldr r0, [r7]
	cmp r0, #0
	subgt r0, r0, #0x100
	strgt r0, [r7]
	b _022FB700
_022FB6A8:
	add r0, r5, #0x100
	ldrsh r2, [r0, #0x50]
	mov r0, #0x1800
	mul r0, r2, r0
	cmp r1, r0
	bgt _022FB6D4
	ldr r0, [r7]
	cmp r0, #0x100
	addlt r0, r0, #0x100
	strlt r0, [r7]
	b _022FB700
_022FB6D4:
	ldr r1, _022FBA18 ; =ov11_02324CF8
	mov r0, #0xc
	ldr r1, [r1]
	mla r0, r2, r0, r1
	ldr r1, [r0, #-0xc]
	ldr r0, [r7]
	cmp r1, #0x100
	movlt r1, #0x100
	cmp r0, r1
	addlt r0, r0, #0x100
	strlt r0, [r7]
_022FB700:
	ldr r2, _022FBA18 ; =ov11_02324CF8
	ldr r0, [r7, #8]
	ldr r1, [r2]
	ldr r3, [r1, #0x24]
	add r1, r3, #0x40
	sub r0, r1, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r0, r1, r0, ror #26
	cmp r0, #0x3c
	blt _022FB75C
	add r0, r3, #5
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r3, r1, r0, ror #26
	str r3, [r7, #8]
	ldr r1, [r2]
	mov r0, #0xc
	mla r0, r3, r0, r1
	ldr r1, [r0, #0x2c]
	ldr r0, [r0, #0x30]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
_022FB75C:
	add r1, sp, #0x3c
	mov r0, r5
	bl SetPositionLiveActor
	cmp r0, #0
	bne _022FB864
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x38]
	sub r2, r3, r2
	sub r1, r1, r0
	add r0, sp, #0x5c
	str r2, [sp, #0x5c]
	str r1, [sp, #0x60]
	bl sub_020054C0
	add r2, r5, #0x100
	mov r1, r0
	ldrsb r0, [r2, #0x5a]
	bl sub_02005430
	strb r0, [r5, #0x15a]
	ldr r0, [r7]
	cmp r0, #0
	ble _022FB7F4
	mov r0, #4
	str r0, [r5, #0x17c]
	ldr r0, [r7]
	ldr r1, [r5, #0x128]
	cmp r0, #0x200
	movgt r0, #0xa00
	movle r0, #0x800
	mov r0, r0, lsl #0x10
	tst r1, #0x20
	mov r6, r0, asr #0x10
	beq _022FB818
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FB818
_022FB7F4:
	mov r0, #0
	str r0, [r5, #0x17c]
	ldr r0, [r5, #0x128]
	ldr r6, _022FBA24 ; =0x00000807
	tst r0, #0x20
	beq _022FB818
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FB818:
	ldrb r0, [r5, #0x174]
	cmp r0, #0
	addeq r0, r5, #0x100
	ldreqsh r1, [r0, #0x80]
	cmpeq r6, r1
	ldreqsb r1, [r0, #0x75]
	ldreqsb r0, [r0, #0x5a]
	cmpeq r1, r0
	beq _022FB864
	mov r0, #0
	strb r0, [r5, #0x174]
	add r2, r5, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r5, #0x18c
	strb r1, [r5, #0x175]
	strh r6, [r2, #0x80]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
_022FB864:
	ldrb r0, [r5, #0x174]
	cmp r0, #0
	beq _022FB894
	mov r0, #0
	strb r0, [r5, #0x174]
	add r2, r5, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r5, #0x18c
	strb r1, [r5, #0x175]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
_022FB894:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x18
	add r5, r5, #0x250
	blt _022FAED4
	ldr r7, _022FBA18 ; =ov11_02324CF8
	mov r2, #0
	ldr r5, [r7]
	ldr r1, [r7, #4]
	sub r0, r2, #1
	str r2, [r5]
	str r2, [r5, #4]
	ldrsh r3, [r1, #2]
	cmp r3, r0
	bne _022FB8DC
	bl InitPartnerFollowData
	b _022FBA10
_022FB8DC:
	ldr r0, [r1, #0x128]
	tst r0, #2
	beq _022FBA0C
	ldr r0, [r7]
	ldr r6, [r0, #0x24]
	cmp r6, #0
	bge _022FB948
	str r2, [r0, #0x24]
	str r2, [r0, #0x28]
	ldr r4, [r1, #0x15c]
	ldr r3, [r1, #0x14]
	add r3, r4, r3
	str r3, [r0, #0x2c]
	ldr r3, [r1, #0x160]
	ldr r1, [r1, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x30]
	ldr r1, [r7]
	mov r0, r2
_022FB928:
	str r0, [r1, #8]
	str r0, [r1]
	add r2, r2, #1
	str r0, [r1, #4]
	cmp r2, #3
	add r1, r1, #0xc
	blt _022FB928
	b _022FBA10
_022FB948:
	add r2, r6, #1
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #26
	add r2, r3, r2, ror #26
	str r2, [r0, #0x24]
	ldr r3, [r7]
	mov r0, #0xc
	ldr r2, [r3, #0x24]
	add r3, r3, #0x28
	mla r4, r2, r0, r3
	ldr r8, [r1, #0x15c]
	ldr r3, [r1, #0x14]
	ldr r2, _022FBA1C ; =ov11_02321684
	add r3, r8, r3
	str r3, [r4, #4]
	ldr r3, [r1, #0x160]
	ldr r1, [r1, #0x18]
	add r1, r3, r1
	str r1, [r4, #8]
	ldr r1, [r7]
	ldr r3, [r2, #0x18]
	add r1, r1, #0x28
	mla r7, r6, r0, r1
	ldr r1, [r2, #0x1c]
	ldr r0, [r7, #8]
	ldr r2, [r4, #8]
	ldr r8, [r4, #4]
	sub r2, r2, r0
	ldr r7, [r7, #4]
	str r2, [sp, #0x70]
	sub r0, r8, r7
	str r3, [sp, #0x64]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x68]
	bl abs
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x70]
	bl abs
	ldr r1, [sp, #0x64]
	str r0, [sp, #0x68]
	cmp r1, r0
	movle r1, r0
	cmp r1, #0
	ldrle r0, _022FBA18 ; =ov11_02324CF8
	str r1, [r4]
	ldrle r0, [r0]
	strle r6, [r0, #0x24]
	strgt r1, [r5]
	b _022FBA10
_022FBA0C:
	bl InitPartnerFollowData
_022FBA10:
	add sp, sp, #0x9c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBA18: .word ov11_02324CF8
_022FBA1C: .word ov11_02321684
_022FBA20: .word ov11_023217EC
_022FBA24: .word 0x00000807
	arm_func_end ov11_022FAE58

	arm_func_start InitPartnerFollowData
InitPartnerFollowData: ; 0x022FBA28
	ldr r0, _022FBA64 ; =ov11_02324CF8
	mvn r2, #0
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0x24]
	ldr r1, [r0]
	mov r0, r3
_022FBA44:
	str r2, [r1, #8]
	str r0, [r1]
	add r3, r3, #1
	str r0, [r1, #4]
	cmp r3, #3
	add r1, r1, #0xc
	blt _022FBA44
	bx lr
	.align 2, 0
_022FBA64: .word ov11_02324CF8
	arm_func_end InitPartnerFollowData

	arm_func_start ov11_022FBA68
ov11_022FBA68: ; 0x022FBA68
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FBBC0 ; =ov11_02321684
	ldr r1, _022FBBC4 ; =ov11_02324CF8
	ldr r8, [r0, #0x48]
	ldr r7, [r0, #0x4c]
	mov sb, #0
	ldr sl, [r1, #4]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FBA98:
	ldrsh r0, [sl, #2]
	cmp r0, r4
	ldrneb r0, [sl, #4]
	cmpne r0, #0
	beq _022FBBA0
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r1, [sl, #0x15c]
	ldr r0, [sl, #0x14]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [sl, #0x160]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sl, #0x17c]
	ldr r6, [sl, #0x16c]
	cmp r0, #0
	ldr r5, [sl, #0x170]
	ble _022FBB20
	sub r0, r0, #1
	str r0, [sl, #0x17c]
	cmp r0, #0
	bgt _022FBB20
	add r0, sl, #0x100
	ldrh r1, [r0, #0x78]
	add r0, r1, #0xff
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022FBB20
	mov r0, sl
	bl ChangeActorAnimation
_022FBB20:
#ifdef JAPAN
	add r0, sl, #0x18c
	bl ov11_022F5FE8_JP
	cmp r0, #0
	beq _022FBB54
#else
	add r0, sl, #0x200
	ldrsh r1, [r0, #0x1e]
	cmp r1, #0
	bge _022FBB54
	ldrsh r0, [r0, #0x18]
	cmp r0, #0
	ble _022FBB54
#endif
	strb fp, [sl, #0x174]
	add r0, sl, #0x100
	ldrsh r1, [r0, #0x80]
	ldrsb r2, [r0, #0x75]
	add r0, sl, #0x18c
	bl SetAnimDataFields2
_022FBB54:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x82]
	cmp r1, r4
	beq _022FBB8C
	ldr r2, [sl, #0x188]
	add r0, sl, #0x18c
	str r2, [sp]
	ldrsh r2, [r3, #0x84]
	ldrsb r3, [r3, #0x5a]
	bl ov11_022F5C48
	add r1, sl, #0x100
	strh r4, [r1, #0x82]
	mov r0, #0
	strh r0, [r1, #0x84]
_022FBB8C:
	ldrsh r1, [sl, #0xa]
	add r2, sp, #0xc
	add r0, sl, #0x18c
	add r3, r6, r5
	bl ov11_022F5C94
_022FBBA0:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x18
	add sl, sl, #0x250
	blt _022FBA98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBBC0: .word ov11_02321684
_022FBBC4: .word ov11_02324CF8
	arm_func_end ov11_022FBA68

	arm_func_start ov11_022FBBC8
ov11_022FBBC8: ; 0x022FBBC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl ov11_022EB3C8
	ldr r1, [sp]
	ldr r0, [r5]
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	add r0, r1, r0
	str r0, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022FBBC8

	arm_func_start ov11_022FBC0C
ov11_022FBC0C: ; 0x022FBC0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr sb, _022FBDB8 ; =ov11_02324CF8
	ldmia r1, {r2, r3}
	add r7, r3, #8
	ldr r8, [sb]
	sub r6, r2, #0xc
	add r3, r2, #0xc
	add r1, r7, #0x14
	ldr fp, [r8, #0x32c]
	mov ip, r6, lsl #8
	sub r4, r7, #4
	mov r6, r4, lsl #8
	mov r3, r3, lsl #8
	mov lr, r1, lsl #8
	mov r5, #0
	str ip, [sp, #0x10]
	str r3, [sp, #8]
	str r6, [sp, #0x14]
	str lr, [sp, #0xc]
	str r5, [sp, #4]
	str r2, [sp, #0x18]
	ldr r2, [sb, #4]
	mov r4, r0
	mov r1, r5
	str r7, [sp, #0x1c]
	add r8, r8, #0x300
	mvn sb, #0
	b _022FBD1C
_022FBC80:
	ldrsh r0, [r2, #2]
	cmp r0, sb
	beq _022FBD0C
	ldr sl, [r2, #0x15c]
	cmp sl, r3
	bge _022FBD0C
	ldr sl, [r2, #0x164]
	cmp sl, ip
	ble _022FBD0C
	ldr sl, [r2, #0x160]
	cmp sl, lr
	bge _022FBD0C
	ldr sl, [r2, #0x168]
	cmp sl, r6
	ble _022FBD0C
	ldrsh sl, [r8, #0x28]
	cmp r1, sl
	moveq r5, #1
	beq _022FBD0C
	cmp r0, #0xd
	moveq r0, #1
	streq r0, [sp, #4]
	beq _022FBD0C
	ldr r0, [r2, #0x128]
	tst r0, #0x2000
	beq _022FBD0C
	add r2, sp, #8
	str r2, [sp]
	add r3, sp, #0x10
	mov r0, fp
	mvn r2, #0
	bl ov11_022F9F90
	strb r0, [r4]
	mov r0, #0
	b _022FBDB0
_022FBD0C:
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r2, r2, #0x250
_022FBD1C:
	cmp r1, #0x18
	blt _022FBC80
	ldr r0, [sp, #0x18]
	sub r1, r7, #6
	sub r3, r0, #6
	mov r6, r1, lsl #8
	add r2, r0, #6
	add r0, r7, #6
	mov r8, r3, lsl #8
	mov r7, r2, lsl #8
	mov r3, r0, lsl #8
	add r1, sp, #0x10
	add r2, sp, #8
	mov r0, #0x2000
	str r8, [sp, #0x10]
	str r7, [sp, #8]
	str r6, [sp, #0x14]
	str r3, [sp, #0xc]
	bl ov11_022FCDB0
	movs r2, r0
	bmi _022FBD94
	add r1, sp, #8
	str r1, [sp]
	add r3, sp, #0x10
	mov r0, fp
	mvn r1, #0
	bl ov11_022F9F90
	strb r0, [r4]
	mov r0, #1
	b _022FBDB0
_022FBD94:
	cmp r5, #0
	movne r0, #2
	bne _022FBDB0
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #3
	mvneq r0, #0
_022FBDB0:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBDB8: .word ov11_02324CF8
	arm_func_end ov11_022FBC0C

	arm_func_start ov11_022FBDBC
ov11_022FBDBC: ; 0x022FBDBC
	stmdb sp!, {r3, lr}
	mov r0, #0x2180
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FBE00 ; =ov11_02324D00
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FBDDC:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #6]
	cmp r3, #0x10
	add r0, r0, #0x218
	blt _022FBDDC
	bl ov11_022FBE04
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE00: .word ov11_02324D00
	arm_func_end ov11_022FBDBC

	arm_func_start ov11_022FBE04
ov11_022FBE04: ; 0x022FBE04
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FBE48 ; =ov11_02324D00
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FBE18:
	ldrsh r0, [r6, #6]
	cmp r0, r4
	beq _022FBE2C
	mov r0, r5
	bl DeleteLiveObject
_022FBE2C:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x10
	add r6, r6, #0x218
	blt _022FBE18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FBE48: .word ov11_02324D00
	arm_func_end ov11_022FBE04

	arm_func_start ov11_022FBE4C
ov11_022FBE4C: ; 0x022FBE4C
	stmdb sp!, {r3, lr}
	bl ov11_022FBE04
	ldr r0, _022FBE70 ; =ov11_02324D00
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FBE70 ; =ov11_02324D00
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE70: .word ov11_02324D00
	arm_func_end ov11_022FBE4C

	arm_func_start ov11_022FBE74
ov11_022FBE74: ; 0x022FBE74
	mvn r1, #0
	cmp r0, r1
	beq _022FBEB8
	ldr r1, _022FBEC0 ; =ov11_02324D00
	mov r3, #0
	ldr r2, [r1]
	b _022FBEB0
_022FBE90:
	ldrsh r1, [r2, #6]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r2, r2, #0x218
_022FBEB0:
	cmp r3, #0x10
	blt _022FBE90
_022FBEB8:
	mvn r0, #0
	bx lr
	.align 2, 0
_022FBEC0: .word ov11_02324D00
	arm_func_end ov11_022FBE74

	arm_func_start ov11_022FBEC4
ov11_022FBEC4: ; 0x022FBEC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrsh r4, [r8]
	ldr r5, _022FC2C0 ; =OBJECTS
	mov r1, #0xc
	mov sb, r0
	smlabb r5, r4, r1, r5
	mov r7, r2
	mov sl, r3
	cmp sb, #0
	bge _022FBF58
	cmp r4, #5
	bne _022FBF08
	mov r0, r4
	bl ov11_022FBE74
	mov sb, r0
_022FBF08:
	cmp sb, #0
	bge _022FBF4C
	ldr r0, _022FC2C4 ; =ov11_02324D00
	mov r3, #0
	ldr r2, [r0]
	mvn r1, #0
	b _022FBF44
_022FBF24:
	ldrsh r0, [r2, #6]
	cmp r0, r1
	moveq sb, r3
	beq _022FBF4C
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x218
_022FBF44:
	cmp r3, #0x10
	blt _022FBF24
_022FBF4C:
	cmp sb, #0
	mvnlt r0, #0
	blt _022FC2B8
_022FBF58:
	ldr r0, _022FC2C4 ; =ov11_02324D00
	ldrh r1, [r8]
	ldr r2, [r0]
	mov r0, #0x218
	str r1, [sp]
	ldrsh r1, [r5]
	smlabb r6, sb, r0, r2
	stmib sp, {r1, r7}
	ldr r1, _022FC2C8 ; =ov11_02321E4C
	mov r2, sb
	mov r3, r4
	str sl, [sp, #0xc]
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r6, #6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	ands fp, r0, #0xff
	beq _022FBFBC
	mov r1, #0
	add r0, r6, #0x154
	strb r1, [r6, #8]
	bl ov11_022F4A14
_022FBFBC:
	sub r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	strh sb, [r6, #4]
	mov r0, r0, lsr #0x10
	cmp r0, #1
	strh r4, [r6, #6]
	strlsh r7, [r6, #0xa]
	strlsb sl, [r6, #0xc]
	mvnls r0, #0
	strlsb r0, [r6, #0xd]
	bls _022FC004
	cmp fp, #0
	mvnne r0, #0
	strneh r0, [r6, #0xa]
	strneb r0, [r6, #0xc]
	strb sl, [r6, #0xd]
_022FC004:
	ldrsh r0, [r5]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _022FC100
_022FC014: ; jump table
	b _022FC100 ; case 0
	b _022FC058 ; case 1
	b _022FC0F4 ; case 2
	b _022FC0B8 ; case 3
	b _022FC0C4 ; case 4
	b _022FC0C4 ; case 5
	b _022FC0D0 ; case 6
	b _022FC0DC ; case 7
	b _022FC0E8 ; case 8
	b _022FC0AC ; case 9
	b _022FC064 ; case 10
	b _022FC058 ; case 11
	b _022FC070 ; case 12
	b _022FC0A0 ; case 13
	b _022FC094 ; case 14
	b _022FC088 ; case 15
	b _022FC07C ; case 16
_022FC058:
	mov r0, #0
	str r0, [r6, #0x12c]
	b _022FC108
_022FC064:
	mov r0, #0x20000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC070:
	mov r0, #0x40000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC07C:
	mov r0, #0x20000000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC088:
	mov r0, #0x20c0000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC094:
	mov r0, #0x20c0000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0A0:
	mov r0, #0x10000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0AC:
	mov r0, #0x140
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0B8:
	ldr r0, _022FC2CC ; =0x02006100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0C4:
	mov r0, #0x6100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0D0:
	mov r0, #0x1100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0DC:
	mov r0, #0x2100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0E8:
	mov r0, #0x6000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0F4:
	ldr r0, _022FC2D0 ; =0x02003100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC100:
	ldr r0, _022FC2D4 ; =0x02006140
	str r0, [r6, #0x12c]
_022FC108:
	ldrb r0, [r5, #8]
	cmp r0, #0
	ldrne r0, [r6, #0x12c]
	orrne r0, r0, #0x80000000
	strne r0, [r6, #0x12c]
	ldrb r0, [r5, #2]
	cmp r0, #0
	ldreqb r0, [r8, #3]
	moveq r0, r0, lsl #0xb
	streq r0, [r6, #0x10]
	ldreqb r0, [r8, #4]
	movne r0, r0, lsl #0xb
	strne r0, [r6, #0x10]
	ldrneb r0, [r5, #3]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x14]
	ldr r0, [r6, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x14]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r6, #0x1c]
	ldrsb r0, [r8, #2]
	strb r0, [r6, #0x20]
	ldrb r0, [r8, #7]
	tst r0, #4
	bne _022FC19C
	ldrb r0, [r8, #5]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x24]
	ldrb r0, [r8, #7]
	tst r0, #2
	ldrne r0, [r6, #0x24]
	addne r0, r0, #0x400
	strne r0, [r6, #0x24]
_022FC19C:
	ldrb r0, [r8, #8]
	tst r0, #4
	bne _022FC1C8
	ldrb r0, [r8, #6]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x28]
	ldrb r0, [r8, #8]
	tst r0, #2
	ldrne r0, [r6, #0x28]
	addne r0, r0, #0x400
	strne r0, [r6, #0x28]
_022FC1C8:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	ldrne r0, [r6, #0x12c]
	orrne r0, r0, #0x800000
	strne r0, [r6, #0x12c]
	cmp fp, #0
	beq _022FC2A0
	ldrsb r0, [r6, #0x20]
	mov r2, #0
	strb r0, [r6, #0x130]
	ldr r3, [r6, #0x24]
	ldr r1, [r6, #0x18]
	add r0, r6, #0x2c
	sub r1, r3, r1
	str r1, [r6, #0x134]
	ldr r4, [r6, #0x24]
	ldr r3, [r6, #0x18]
	add r1, r6, #0x34
	add r3, r4, r3
	str r3, [r6, #0x13c]
	ldr r4, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	sub r3, r4, r3
	str r3, [r6, #0x138]
	ldr r4, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	add r3, r4, r3
	str r3, [r6, #0x140]
	str r2, [r6, #0x148]
	str r2, [r6, #0x144]
	bl ov11_022F1F08
	add r0, r6, #0x100
	mov r2, #0x800
	mov r1, #1
	strh r2, [r0, #0x4e]
	strb r1, [r6, #0x14c]
	sub r1, r1, #2
	strh r1, [r0, #0x50]
	mov r1, #0
	strh r1, [r0, #0x52]
	ldrsh r1, [r6, #6]
	ldr r2, [r6, #0x12c]
	add r0, r6, #0x154
	bl LoadObjectAnimData
	ldr r1, _022FC2D8 ; =OBJECT_FUNCTION_TABLE
	mov r2, r6
	add r0, r6, #0x3c
	bl InitScriptRoutine
	ldrsh r0, [r5]
	cmp r0, #0x10
	bne _022FC2A0
	add r0, r6, #0x154
	mov r1, #0
	bl ov11_022F4974
_022FC2A0:
	ldrsh r2, [r8, #0xa]
	add r0, r6, #0x100
	mov r1, #1
	strh r2, [r0, #0x28]
	mov r0, sb
	strb r1, [r6, #8]
_022FC2B8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC2C0: .word OBJECTS
_022FC2C4: .word ov11_02324D00
_022FC2C8: .word ov11_02321E4C
_022FC2CC: .word 0x02006100
_022FC2D0: .word 0x02003100
_022FC2D4: .word 0x02006140
_022FC2D8: .word OBJECT_FUNCTION_TABLE
	arm_func_end ov11_022FBEC4

	arm_func_start ov11_022FC2DC
ov11_022FC2DC: ; 0x022FC2DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FC43C ; =ov11_02321E98
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FC3A4
	ldr r0, _022FC440 ; =ov11_02324D00
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FC444 ; =ov11_02321EC4
	add r5, r4, #1
	mov r6, #1
_022FC338:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FC388
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FC388
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FC388
	mov r0, r8
	bl DeleteLiveObject
_022FC388:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x218
	blt _022FC338
	b _022FC434
_022FC3A4:
	ldr r0, _022FC440 ; =ov11_02324D00
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022FC3C0:
	ldrsh r3, [sl, #6]
	cmp r3, r7
	beq _022FC41C
	ldrsb ip, [sl, #0xd]
	ldr r1, _022FC448 ; =ov11_02321EF0
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl Debug_Print
	ldrsb r0, [sl, #0xd]
	cmp r0, r6
	beq _022FC408
	cmp sb, r5
	cmpne sb, r0
	bne _022FC41C
	mov r0, r8
	bl DeleteLiveObject
	b _022FC41C
_022FC408:
	ldrsh r0, [sl, #0xa]
	cmp r0, r4
	bne _022FC41C
	mov r0, r8
	bl DeleteLiveObject
_022FC41C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x218
	blt _022FC3C0
_022FC434:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC43C: .word ov11_02321E98
_022FC440: .word ov11_02324D00
_022FC444: .word ov11_02321EC4
_022FC448: .word ov11_02321EF0
	arm_func_end ov11_022FC2DC

	arm_func_start DeleteLiveObject
DeleteLiveObject: ; 0x022FC44C
	stmdb sp!, {r4, lr}
	ldr r1, _022FC48C ; =ov11_02324D00
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x218
	smlabb r4, r2, r0, r1
	ldr r1, _022FC490 ; =ov11_02321F10
	mov r0, #1
	bl Debug_Print
	add r0, r4, #0x154
	bl ov11_022F6EFC
	add r0, r4, #0x3c
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FC48C: .word ov11_02324D00
_022FC490: .word ov11_02321F10
	arm_func_end DeleteLiveObject

	arm_func_start ov11_022FC494
ov11_022FC494: ; 0x022FC494
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FC5EC ; =ov11_02321F2C
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FC564
	ldr r0, _022FC5F0 ; =ov11_02324D00
	mvn r5, #0
	ldr r7, [r0]
	ldr fp, _022FC5F4 ; =ov11_02321EC4
	sub r4, r5, #1
	mov r6, #1
_022FC4F0:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FC548
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FC548
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FC548
	mov r1, #0
	add r0, r7, #0x3c
	bl ov11_022DCFC4
	strh r5, [r7, #0xa]
_022FC548:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x218
	blt _022FC4F0
	b _022FC5E4
_022FC564:
	ldr r0, _022FC5F0 ; =ov11_02324D00
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0]
	ldr r6, _022FC5F4 ; =ov11_02321EC4
	sub r4, r5, #1
	mov fp, r7
_022FC580:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FC5CC
	ldrsh r2, [sl, #0xa]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	cmp sb, r4
	ldrnesb r0, [sl, #0xd]
	cmpne sb, r0
	bne _022FC5CC
	mov r1, fp
	add r0, sl, #0x3c
	bl ov11_022DCFC4
	strb r5, [sl, #0xd]
_022FC5CC:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x218
	blt _022FC580
_022FC5E4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC5EC: .word ov11_02321F2C
_022FC5F0: .word ov11_02324D00
_022FC5F4: .word ov11_02321EC4
	arm_func_end ov11_022FC494

	arm_func_start SetAttributeBitfieldLiveObject
SetAttributeBitfieldLiveObject: ; 0x022FC5F8
	stmdb sp!, {r3, lr}
	ldr r3, _022FC634 ; =ov11_02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x12c]
	add r0, ip, #0x154
	orr r1, r2, r1
	str r1, [ip, #0x12c]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FC634: .word ov11_02324D00
	arm_func_end SetAttributeBitfieldLiveObject

	arm_func_start ResetAttributeBitfieldLiveObject
ResetAttributeBitfieldLiveObject: ; 0x022FC638
	stmdb sp!, {r3, lr}
	ldr r3, _022FC678 ; =ov11_02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x12c]
	eor r0, r1, r3
	and r1, r2, r0
	add r0, ip, #0x154
	str r1, [ip, #0x12c]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FC678: .word ov11_02324D00
	arm_func_end ResetAttributeBitfieldLiveObject

	arm_func_start ov11_022FC67C
ov11_022FC67C: ; 0x022FC67C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FC6D8
	ldr r0, _022FC6E0 ; =ov11_02324D00
	mov r6, #0
	ldr r5, [r0]
	b _022FC6D0
_022FC6A0:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FC6C0
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FC6C0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x218
_022FC6D0:
	cmp r6, #0x10
	blt _022FC6A0
_022FC6D8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FC6E0: .word ov11_02324D00
	arm_func_end ov11_022FC67C

	arm_func_start ov11_022FC6E4
ov11_022FC6E4: ; 0x022FC6E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FC740
	ldr r0, _022FC748 ; =ov11_02324D00
	mov r6, #0
	ldr r5, [r0]
	b _022FC738
_022FC708:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FC728
	add r0, r5, #0x3c
	bl ov11_022DC9A0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FC728:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x218
_022FC738:
	cmp r6, #0x10
	blt _022FC708
_022FC740:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FC748: .word ov11_02324D00
	arm_func_end ov11_022FC6E4

	arm_func_start ov11_022FC74C
ov11_022FC74C: ; 0x022FC74C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0
	sub r3, r0, #1
	mov r8, r1
	mov r7, r2
	cmp sb, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _022FC7B8 ; =ov11_02324D00
	mov r6, r0
	ldr r5, [r1]
	mov r4, #1
_022FC77C:
	ldrsh r1, [r5, #6]
	cmp r1, sb
	bne _022FC79C
	mov r1, r8
	mov r2, r7
	add r0, r5, #0x3c
	bl ov11_022DCCEC
	mov r0, r4
_022FC79C:
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r6, r1, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x218
	blt _022FC77C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC7B8: .word ov11_02324D00
	arm_func_end ov11_022FC74C

	arm_func_start ov11_022FC7BC
ov11_022FC7BC: ; 0x022FC7BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	mov sb, r0
	sub r0, r7, #2
	mov r8, r1
	cmp sb, r0
	beq _022FC830
	ldr r0, _022FC838 ; =ov11_02324D00
	mov r6, #0
	ldr r5, [r0]
	mov r4, r6
_022FC7E8:
	ldrsh r0, [r5, #6]
	cmp r0, sb
	bne _022FC818
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	beq _022FC818
	mov r1, r8
	add r0, r5, #0x3c
	bl ov11_022DCA58
	cmp r0, #0
	moveq r7, r4
_022FC818:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x218
	blt _022FC7E8
_022FC830:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC838: .word ov11_02324D00
	arm_func_end ov11_022FC7BC

	arm_func_start ov11_022FC83C
ov11_022FC83C: ; 0x022FC83C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022FC8BC ; =ov11_02324D00
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x218
	smlabb r4, r2, r0, r1
	ldrsh r3, [r4, #0xa]
	add r0, r4, #0x100
	ldr r1, _022FC8C0 ; =ov11_02321F58
	str r3, [sp]
	ldrsh r3, [r0, #0x28]
	mov r0, #1
	str r3, [sp, #4]
	ldrsh r3, [r4, #6]
	bl Debug_Print
	ldrsh r1, [r4, #6]
	mvn r0, #0
	cmp r1, r0
	addne r1, r4, #0x100
	ldrnesh r1, [r1, #0x28]
	cmpne r1, r0
	moveq r0, #0
	beq _022FC8B4
	bl SetActorTalkSub
	add r1, r4, #0x100
	ldrsh r0, [r4, #0xa]
	ldrsh r1, [r1, #0x28]
	bl ov11_022F74A0
	mov r0, #1
_022FC8B4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FC8BC: .word ov11_02324D00
_022FC8C0: .word ov11_02321F58
	arm_func_end ov11_022FC83C

	arm_func_start ov11_022FC8C4
ov11_022FC8C4: ; 0x022FC8C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FC9D4
	ldr r1, _022FCA8C ; =ov11_02321FA0
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCA90 ; =ov11_02324D00
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, r8
_022FC920:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FC9B8
	ldrsh r0, [r6, #0xa]
	cmp r0, sl
	bne _022FC9B8
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne r0, sb
	bne _022FC9B8
	ldr r1, _022FCA94 ; =ov11_02321FE0
	mov r0, #1
	mov r2, r7
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r6, #6]
	add r0, sp, #4
	mov r1, #4
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FC9B8
	add r0, r6, #0x3c
	add r1, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022FC9B8
	add r0, r6, #0x2c
	add r1, r6, #0x34
	bl ov11_022F1F08
	add r0, r6, #0x3c
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x14c]
_022FC9B8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x218
	blt _022FC920
	b _022FCA80
_022FC9D4:
	ldr r1, _022FCA98 ; =ov11_02321FF4
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCA90 ; =ov11_02324D00
	mvn r4, #1
	ldr r7, [r0]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022FC9FC:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FCA68
	cmp sb, r4
	ldrnesb r0, [r7, #0xd]
	cmpne r0, sb
	bne _022FCA68
	ldr r1, _022FCA94 ; =ov11_02321FE0
	mov r0, #1
	mov r2, r6
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r7, #6]
	add r0, sp, #4
	mov r1, #4
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FCA68
	add r0, r7, #0x3c
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x14c]
_022FCA68:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x218
	blt _022FC9FC
_022FCA80:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCA8C: .word ov11_02321FA0
_022FCA90: .word ov11_02324D00
_022FCA94: .word ov11_02321FE0
_022FCA98: .word ov11_02321FF4
	arm_func_end ov11_022FC8C4

	arm_func_start ov11_022FCA9C
ov11_022FCA9C: ; 0x022FCA9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FCB54
	ldr r1, _022FCBE0 ; =ov11_02322034
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCBE4 ; =ov11_02324D00
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022FCAF4:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FCB38
	ldrsh r0, [r6, #0xa]
	cmp sl, r0
	bne _022FCB38
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne sb, r0
	bne _022FCB38
	ldr r1, _022FCBE8 ; =ov11_02321FE0
	mov r0, fp
	mov r2, r7
	bl Debug_Print
	add r0, r6, #0x3c
	bl ov11_022DCAE0
	orr r8, r8, r0
_022FCB38:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x218
	blt _022FCAF4
	b _022FCBD8
_022FCB54:
	ldr r1, _022FCBEC ; =ov11_02322074
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FCBE4 ; =ov11_02324D00
	mvn r5, #0
	ldr sl, [r0]
	ldr fp, _022FCBE8 ; =ov11_02321FE0
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022FCB80:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FCBC0
	ldrsb r0, [sl, #0xd]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022FCBC0
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl Debug_Print
	add r0, sl, #0x3c
	bl ov11_022DD080
	strb r5, [sl, #0xd]
	orr r8, r8, r0
_022FCBC0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add sl, sl, #0x218
	blt _022FCB80
_022FCBD8:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCBE0: .word ov11_02322034
_022FCBE4: .word ov11_02324D00
_022FCBE8: .word ov11_02321FE0
_022FCBEC: .word ov11_02322074
	arm_func_end ov11_022FCA9C

	arm_func_start ov11_022FCBF0
ov11_022FCBF0: ; 0x022FCBF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FCC40 ; =ov11_02324D00
	mov r4, #0
	ldr r7, [r0]
	mov r6, r4
	mvn r5, #0
_022FCC08:
	ldrsh r0, [r7, #6]
	cmp r0, r5
	beq _022FCC20
	add r0, r7, #0x3c
	bl ov11_022DCB00
	orr r4, r4, r0
_022FCC20:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x218
	blt _022FCC08
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FCC40: .word ov11_02324D00
	arm_func_end ov11_022FCBF0

	arm_func_start UnlockObjectRoutines
UnlockObjectRoutines: ; 0x022FCC44
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022FCC9C ; =ov11_02324D00
	mov r5, #0
	ldr r4, [r1]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022FCC60:
	ldrsh r0, [r4, #6]
	cmp r0, r7
	beq _022FCC7C
	mov r1, r6
	add r0, r4, #0x3c
	bl UnlockRoutine
	orr r5, r5, r0
_022FCC7C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r4, r4, #0x218
	blt _022FCC60
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FCC9C: .word ov11_02324D00
	arm_func_end UnlockObjectRoutines

	arm_func_start ov11_022FCCA0
ov11_022FCCA0: ; 0x022FCCA0
	ldr r3, _022FCCC0 ; =ov11_02324D00
	mov r2, #0x218
	ldr r3, [r3]
	smlabb r2, r0, r2, r3
	ldr r0, [r2, #0x12c]
	str r0, [r1]
	ldrsh r0, [r2, #6]
	bx lr
	.align 2, 0
_022FCCC0: .word ov11_02324D00
	arm_func_end ov11_022FCCA0

	arm_func_start ov11_022FCCC4
ov11_022FCCC4: ; 0x022FCCC4
	ldr r3, _022FCD14 ; =ov11_02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022FCD08
	ldr r2, [ip, #0x134]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x138]
	ldr r0, [ip, #0x1c]
	add r0, r2, r0
_022FCD08:
	str r0, [r1, #4]
	ldrsh r0, [ip, #6]
	bx lr
	.align 2, 0
_022FCD14: .word ov11_02324D00
	arm_func_end ov11_022FCCC4

	arm_func_start GetCollidingObjectId
GetCollidingObjectId: ; 0x022FCD18
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FCDAC ; =ov11_02324D00
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FCD9C
_022FCD30:
	ldrsh r4, [ip, #6]
	cmp r4, lr
	beq _022FCD8C
	ldr r4, [ip, #0x12c]
	tst r4, r0
	beq _022FCD8C
	ldr r5, [ip, #0x134]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FCD8C
	ldr r5, [ip, #0x13c]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FCD8C
	ldr r5, [ip, #0x138]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FCD8C
	ldr r5, [ip, #0x140]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FCD8C:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x218
_022FCD9C:
	cmp r3, #0x10
	blt _022FCD30
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FCDAC: .word ov11_02324D00
	arm_func_end GetCollidingObjectId

	arm_func_start ov11_022FCDB0
ov11_022FCDB0: ; 0x022FCDB0
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FCE44 ; =ov11_02324D00
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FCE34
_022FCDC8:
	ldrsh r4, [ip, #6]
	cmp r4, lr
	beq _022FCE24
	ldr r4, [ip, #0x12c]
	tst r4, r0
	beq _022FCE24
	ldr r5, [ip, #0x134]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FCE24
	ldr r5, [ip, #0x13c]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FCE24
	ldr r5, [ip, #0x138]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FCE24
	ldr r5, [ip, #0x140]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FCE24:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x218
_022FCE34:
	cmp r3, #0x10
	blt _022FCDC8
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FCE44: .word ov11_02324D00
	arm_func_end ov11_022FCDB0

	arm_func_start ov11_022FCE48
ov11_022FCE48: ; 0x022FCE48
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, _022FCF6C ; =ov11_02321D88
	mov r5, r1
	ldr r1, [r3, #0xc]
	ldr r3, [r3, #8]
	str r1, [sp, #0x14]
	str r3, [sp, #0x10]
	ldr r1, [r5]
	mov r6, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r1, r0, asr #3
	mov r0, r1, asr #7
	add r1, r1, r0, lsr #24
	mov r0, r1, asr #8
	str r0, [sp, #0x10]
	ldr r3, [r5, #4]
	mov r4, r2
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	mov r2, r0, asr #3
	mov r0, r2, asr #7
	add r2, r2, r0, lsr #24
	mov r0, r2, asr #8
	str r0, [sp, #0x14]
	ldr r3, [r4]
	ldr r0, [r4, #4]
	sub lr, r3, #1
	sub ip, r0, #1
	mov r0, lr, asr #2
	mov r3, ip, asr #2
	add r0, lr, r0, lsr #29
	add r3, ip, r3, lsr #29
	mov lr, r0, asr #3
	mov ip, r3, asr #3
	mov r0, lr, asr #7
	mov r3, ip, asr #7
	add r0, lr, r0, lsr #24
	mov r0, r0, asr #8
	add r3, ip, r3, lsr #24
	mov ip, r3, asr #8
	sub r3, r0, r1, asr #8
	sub r1, ip, r2, asr #8
	add r2, r3, #1
	add r1, r1, #1
	str r0, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	ldr r1, [r6, #0x12c]
	str ip, [sp, #0xc]
	tst r1, #0x40
	add r0, sp, #0x10
	add r1, sp, #0
	beq _022FCF34
	bl ov11_022F204C
	cmp r0, #0
	movne r0, #0x40
	bne _022FCF64
_022FCF34:
	ldr r0, [r6, #0x12c]
	tst r0, #0x100
	beq _022FCF60
	mov r2, r5
	mov r3, r4
	mvn r0, #0
	mov r1, #0x100
	bl GetCollidingActorId
	cmp r0, #0
	movge r0, #0x100
	bge _022FCF64
_022FCF60:
	mov r0, #0
_022FCF64:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FCF6C: .word ov11_02321D88
	arm_func_end ov11_022FCE48

	arm_func_start SetPositionLiveObject
SetPositionLiveObject: ; 0x022FCF70
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r5, _022FD05C ; =ov11_02321D88
	mov r4, r0
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x30]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	ldr r3, [r1]
	ldr r2, [r4, #0x18]
	add lr, sp, #8
	sub ip, r3, r2
	str ip, [sp, #8]
	ldr r6, [r1, #4]
	ldr r3, [r4, #0x1c]
	add r2, sp, #0
	sub r3, r6, r3
	str r3, [sp, #0xc]
	ldr r6, [r5, #0x28]
	ldr r5, [r5, #0x2c]
	str r6, [sp]
	str r5, [sp, #4]
	ldr r6, [r1]
	ldr r5, [r4, #0x18]
	add r6, r6, r5
	str r6, [sp]
	ldr r5, [r1, #4]
	ldr r1, [r4, #0x1c]
	add r5, r5, r1
	str r5, [sp, #4]
	ldr r1, [r4, #0x2c]
	cmp ip, r1
	blt _022FD018
	ldr r1, [r4, #0x34]
	cmp r6, r1
	bge _022FD018
	ldr r1, [r4, #0x30]
	cmp r3, r1
	blt _022FD018
	ldr r1, [r4, #0x38]
	cmp r5, r1
	blt _022FD020
_022FD018:
	mov r0, #0x40
	b _022FD054
_022FD020:
	mov r1, lr
	bl ov11_022FCE48
	cmp r0, #0
	bne _022FD054
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #0
	str r2, [r4, #0x134]
	str r1, [r4, #0x138]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r4, #0x13c]
	str r1, [r4, #0x140]
_022FD054:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FD05C: .word ov11_02321D88
	arm_func_end SetPositionLiveObject

	arm_func_start GetIdLiveObject
GetIdLiveObject: ; 0x022FD060
	ldrsh r0, [r0, #4]
	bx lr
	arm_func_end GetIdLiveObject

	arm_func_start GetCollisionBoxLiveObject
GetCollisionBoxLiveObject: ; 0x022FD068
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxLiveObject

	arm_func_start SetPositionInitialLiveObject
SetPositionInitialLiveObject: ; 0x022FD07C
	cmp r1, #0
	beq _022FD0C8
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x134]
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r0, #0x13c]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x1c]
	sub r2, r3, r2
	str r2, [r0, #0x138]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x140]
	bx lr
_022FD0C8:
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x134]
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x13c]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x138]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r3, ip, r3
	str r3, [r0, #0x140]
	str r2, [r0, #0x148]
	str r2, [r0, #0x144]
	ldrsb r2, [r1, #0x30]
	ldrsb r1, [r0, #0x20]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x14c]
	ldrsb r1, [r0, #0x20]
	strb r1, [r0, #0x130]
	bx lr
	arm_func_end SetPositionInitialLiveObject

	arm_func_start SetMovementRangeLiveObject
SetMovementRangeLiveObject: ; 0x022FD138
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x34]
	str r1, [r0, #0x38]
	bx lr
	arm_func_end SetMovementRangeLiveObject

	arm_func_start GetCollisionBoxCenterLiveObject
GetCollisionBoxCenterLiveObject: ; 0x022FD15C
	ldr r3, [r0, #0x134]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x138]
	ldr r0, [r0, #0x1c]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxCenterLiveObject

	arm_func_start SetPositionLiveObjectVeneer
SetPositionLiveObjectVeneer: ; 0x022FD180
	ldr ip, _022FD188 ; =SetPositionLiveObject
	bx ip
	.align 2, 0
_022FD188: .word SetPositionLiveObject
	arm_func_end SetPositionLiveObjectVeneer

	arm_func_start GetHeightLiveObject
GetHeightLiveObject: ; 0x022FD18C
	ldr r3, [r0, #0x144]
	str r3, [r1]
	ldr r0, [r0, #0x148]
	str r0, [r2]
	bx lr
	arm_func_end GetHeightLiveObject

	arm_func_start SetHeightLiveObject
SetHeightLiveObject: ; 0x022FD1A0
	str r1, [r0, #0x144]
	bx lr
	arm_func_end SetHeightLiveObject

	arm_func_start GetDirectionLiveObject
GetDirectionLiveObject: ; 0x022FD1A8
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x30]
	strb r0, [r1]
	bx lr
	arm_func_end GetDirectionLiveObject

	arm_func_start SetDirectionLiveObject
SetDirectionLiveObject: ; 0x022FD1B8
	mvn r2, #0
	cmp r1, r2
	strneb r1, [r0, #0x130]
	bx lr
	arm_func_end SetDirectionLiveObject

	arm_func_start SetAnimationLiveObject
SetAnimationLiveObject: ; 0x022FD1C8
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	tst r1, #0x800
	mov ip, r2, lsr #0x10
	beq _022FD1F8
	add r1, r0, #0x100
	mov r2, #0x400
	strh r2, [r1, #0x4e]
	mov r1, #1
	strb r1, [r0, #0x14c]
	bx lr
_022FD1F8:
	cmp r3, #0
	ldrne r1, _022FD284 ; =ov11_02321DC8
	movne r2, r3, lsl #1
	ldrnesh r3, [r1, r2]
	addeq r1, r0, #0x100
	ldreqsh r3, [r1, #0x4e]
	cmp ip, #0x200
	bgt _022FD230
	bge _022FD24C
	cmp ip, #0x100
	orreq r1, r3, #0x300
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FD258
_022FD230:
	cmp ip, #0x300
	ble _022FD258
	cmp ip, #0x400
	orreq r1, r3, #0x200
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FD258
_022FD24C:
	orr r1, r3, #0x100
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_022FD258:
	add r1, r0, #0x100
	ldrsh r2, [r1, #0x4e]
	cmp r2, r3
	strneh r3, [r1, #0x4e]
	movne r1, #1
	strneb r1, [r0, #0x14c]
	bxne lr
	tst r2, #0x1000
	movne r1, #1
	strneb r1, [r0, #0x14c]
	bx lr
	.align 2, 0
_022FD284: .word ov11_02321DC8
	arm_func_end SetAnimationLiveObject

	arm_func_start SetEffectLiveObject
SetEffectLiveObject: ; 0x022FD288
	add r0, r0, #0x100
	strh r1, [r0, #0x50]
	strh r2, [r0, #0x52]
	bx lr
	arm_func_end SetEffectLiveObject

	arm_func_start GetAnimationStatusLiveObject
GetAnimationStatusLiveObject: ; 0x022FD298
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x14c]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x154
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end GetAnimationStatusLiveObject

	arm_func_start GetEffectStatusLiveObject
GetEffectStatusLiveObject: ; 0x022FD2B8
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r1, [r1, #0x52]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x154
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end GetEffectStatusLiveObject

	arm_func_start GetAttributeBitfieldLiveObject
GetAttributeBitfieldLiveObject: ; 0x022FD2DC
	ldr r0, [r0, #0x12c]
	str r0, [r1]
	bx lr
	arm_func_end GetAttributeBitfieldLiveObject

	arm_func_start SetAttributeBitfieldLiveObjectWrapper
SetAttributeBitfieldLiveObjectWrapper: ; 0x022FD2E8
	ldr ip, _022FD2F4 ; =SetAttributeBitfieldLiveObject
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FD2F4: .word SetAttributeBitfieldLiveObject
	arm_func_end SetAttributeBitfieldLiveObjectWrapper

	arm_func_start ResetAttributeBitfieldLiveObjectWrapper
ResetAttributeBitfieldLiveObjectWrapper: ; 0x022FD2F8
	ldr ip, _022FD304 ; =ResetAttributeBitfieldLiveObject
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FD304: .word ResetAttributeBitfieldLiveObject
	arm_func_end ResetAttributeBitfieldLiveObjectWrapper

	arm_func_start SetBlinkLiveObject
SetBlinkLiveObject: ; 0x022FD308
	ldr ip, _022FD314 ; =ov11_022F4984
	add r0, r0, #0x154
	bx ip
	.align 2, 0
_022FD314: .word ov11_022F4984
	arm_func_end SetBlinkLiveObject

	arm_func_start SetPositionOffsetLiveObject
SetPositionOffsetLiveObject: ; 0x022FD318
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r2, _022FD478 ; =ov11_02321D88
	mov r5, r0
	ldr r0, [r2, #4]
	ldr r3, [r2]
	str r0, [sp, #4]
	str r3, [sp]
	ldr r3, [r5, #0x134]
	ldr r0, [r1]
	mov r4, #0
	add r0, r3, r0
	str r0, [sp]
	ldr ip, [r5, #0x138]
	ldr r3, [r1, #4]
	add r3, ip, r3
	str r3, [sp, #4]
	ldr r3, [r2, #0x38]
	ldr r2, [r2, #0x3c]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r5, #0x13c]
	ldr r2, [r1]
	add r3, r3, r2
	str r3, [sp, #8]
	ldr r2, [r5, #0x140]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r1, [r5, #0x2c]
	cmp r0, r1
	bge _022FD3B4
	str r1, [sp]
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x10]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #8]
	b _022FD3D8
_022FD3B4:
	ldr r1, [r5, #0x34]
	cmp r3, r1
	blt _022FD3D8
	ldr r0, [r5, #0x10]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #0x34]
	str r0, [sp, #8]
_022FD3D8:
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #4]
	cmp r0, r1
	bge _022FD404
	str r1, [sp, #4]
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x14]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #0xc]
	b _022FD42C
_022FD404:
	ldr r1, [r5, #0x38]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _022FD42C
	ldr r0, [r5, #0x14]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #0x38]
	str r0, [sp, #0xc]
_022FD42C:
	add r1, sp, #0
	add r2, sp, #8
	mov r0, r5
	bl ov11_022FCE48
	cmp r0, #0
	bne _022FD470
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r4, #0
	str r1, [r5, #0x134]
	str r0, [r5, #0x138]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x13c]
	str r0, [r5, #0x140]
	movne r0, #0x40
	moveq r0, #0
_022FD470:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FD478: .word ov11_02321D88
	arm_func_end SetPositionOffsetLiveObject

	arm_func_start ov11_022FD47C
ov11_022FD47C: ; 0x022FD47C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FD50C ; =ov11_02324D00
	mov r4, #0
	ldr r5, [r0]
	mov r7, r4
	mvn r6, #0
_022FD494:
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ldrneb r0, [r5, #8]
	cmpne r0, #0
	beq _022FD4F0
	add r0, r5, #0x3c
	bl FuncThatCallsRunNextOpcode
	cmp r0, #0
	beq _022FD4CC
	cmp r0, #6
	bne _022FD4CC
	mov r0, r4
	bl DeleteLiveObject
	b _022FD4F0
_022FD4CC:
	ldrb r0, [r5, #0x14c]
	cmp r0, #0
	beq _022FD4F0
	strb r7, [r5, #0x14c]
	add r0, r5, #0x100
	ldrsh r1, [r0, #0x4e]
	mov r2, r7
	add r0, r5, #0x154
	bl SetAnimDataFields2
_022FD4F0:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	add r5, r5, #0x218
	blt _022FD494
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FD50C: .word ov11_02324D00
	arm_func_end ov11_022FD47C

	arm_func_start ov11_022FD510
ov11_022FD510: ; 0x022FD510
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FD61C ; =ov11_02321D88
	ldr r1, _022FD620 ; =ov11_02324D00
	ldr r8, [r0, #0x10]
	ldr r7, [r0, #0x14]
	mov sb, #0
	ldr sl, [r1]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FD540:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	ldrneb r0, [sl, #8]
	cmpne r0, #0
	beq _022FD5FC
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r2, [sl, #0x134]
	ldr r1, [sl, #0x18]
#ifdef JAPAN
	add r0, sl, #0x154
#else
	add r0, sl, #0x100
#endif
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r2, [sl, #0x138]
	ldr r1, [sl, #0x1c]
	add r1, r2, r1
	str r1, [sp, #0x10]
#ifndef JAPAN
	ldrsh r1, [r0, #0xe6]
#endif
	ldr r6, [sl, #0x144]
	ldr r5, [sl, #0x148]
#ifdef JAPAN
	bl ov11_022F5FE8_JP
	cmp r0, #0
	beq _022FD5B4
	strb fp, [sl, #0x14c]
	add r0, sl, #0x100
#else
	cmp r1, #0
	bge _022FD5B4
	ldrsh r1, [r0, #0xe0]
	cmp r1, #0
	ble _022FD5B4
	strb fp, [sl, #0x14c]
#endif
	ldrsh r1, [r0, #0x4e]
	mov r2, fp
	add r0, sl, #0x154
	bl SetAnimDataFields2
_022FD5B4:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x50]
	cmp r1, r4
	beq _022FD5EC
	mov r0, #0
	str r0, [sp]
	ldrsh r2, [r3, #0x52]
	ldrsb r3, [r3, #0x30]
	add r0, sl, #0x154
	bl ov11_022F5408
	add r1, sl, #0x100
	strh r4, [r1, #0x50]
	mov r0, #0
	strh r0, [r1, #0x52]
_022FD5EC:
	add r1, sp, #0xc
	add r0, sl, #0x154
	add r2, r6, r5
	bl AnimRelatedFunction__022F6F14
_022FD5FC:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	add sl, sl, #0x218
	blt _022FD540
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FD61C: .word ov11_02321D88
_022FD620: .word ov11_02324D00
	arm_func_end ov11_022FD510

	arm_func_start ov11_022FD624
ov11_022FD624: ; 0x022FD624
	stmdb sp!, {r3, lr}
	mov r0, #0x2140
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FD668 ; =ov11_02324D04
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FD644:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #6]
	cmp r3, #0x10
	add r0, r0, #0x214
	blt _022FD644
	bl ov11_022FD66C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FD668: .word ov11_02324D04
	arm_func_end ov11_022FD624

	arm_func_start ov11_022FD66C
ov11_022FD66C: ; 0x022FD66C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FD6B0 ; =ov11_02324D04
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FD680:
	ldrsh r0, [r6, #6]
	cmp r0, r4
	beq _022FD694
	mov r0, r5
	bl DeleteLivePerformer
_022FD694:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x10
	add r6, r6, #0x214
	blt _022FD680
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FD6B0: .word ov11_02324D04
	arm_func_end ov11_022FD66C

	arm_func_start ov11_022FD6B4
ov11_022FD6B4: ; 0x022FD6B4
	stmdb sp!, {r3, lr}
	bl ov11_022FD66C
	ldr r0, _022FD6D8 ; =ov11_02324D04
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FD6D8 ; =ov11_02324D04
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FD6D8: .word ov11_02324D04
	arm_func_end ov11_022FD6B4

	arm_func_start ov11_022FD6DC
ov11_022FD6DC: ; 0x022FD6DC
	mvn r1, #0
	cmp r0, r1
	beq _022FD720
	ldr r1, _022FD728 ; =ov11_02324D04
	mov r3, #0
	ldr r2, [r1]
	b _022FD718
_022FD6F8:
	ldrsh r1, [r2, #6]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r2, r2, #0x214
_022FD718:
	cmp r3, #0x10
	blt _022FD6F8
_022FD720:
	mvn r0, #0
	bx lr
	.align 2, 0
_022FD728: .word ov11_02324D04
	arm_func_end ov11_022FD6DC

	arm_func_start ov11_022FD72C
ov11_022FD72C: ; 0x022FD72C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r8, r1
	ldrh r5, [r8]
	ldr r1, _022FDA68 ; =ov11_02320858
	movs sb, r0
	mov r7, r2
	mov r6, r3
	add r4, r1, r5, lsl #2
	bpl _022FD7C0
	ldrsb r0, [r4]
	cmp r0, #1
	bne _022FD770
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FD6DC
	mov sb, r0
_022FD770:
	cmp sb, #0
	bge _022FD7B4
	ldr r0, _022FDA6C ; =ov11_02324D04
	mov r3, #0
	ldr r2, [r0]
	mvn r1, #0
	b _022FD7AC
_022FD78C:
	ldrsh r0, [r2, #6]
	cmp r0, r1
	moveq sb, r3
	beq _022FD7B4
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x214
_022FD7AC:
	cmp r3, #0x10
	blt _022FD78C
_022FD7B4:
	cmp sb, #0
	mvnlt r0, #0
	blt _022FDA60
_022FD7C0:
	ldr r0, _022FDA6C ; =ov11_02324D04
	ldrsb r1, [r4]
	ldr r2, [r0]
	mov r0, #0x214
	stmia sp, {r1, r7}
	str r6, [sp, #8]
	ldrh r3, [r8]
	smlabb r5, sb, r0, r2
	ldr r1, _022FDA70 ; =ov11_02322160
	mov r2, sb
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r5, #6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	ands sl, r0, #0xff
	beq _022FD81C
	mov r1, #0
	add r0, r5, #0x150
	strb r1, [r5, #8]
	bl ov11_022F4A14
_022FD81C:
	sub r0, r7, #1
	strh sb, [r5, #4]
	mov r0, r0, lsl #0x10
	ldrh r1, [r8]
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	strh r1, [r5, #6]
	strlsh r7, [r5, #0xa]
	strlsb r6, [r5, #0xc]
	mvnls r0, #0
	strlsb r0, [r5, #0xd]
	bls _022FD868
	cmp sl, #0
	mvnne r0, #0
	strneh r0, [r5, #0xa]
	strneb r0, [r5, #0xc]
	strb r6, [r5, #0xd]
_022FD868:
	ldrsb r0, [r4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022FD8CC
_022FD878: ; jump table
	b _022FD8CC ; case 0
	b _022FD890 ; case 1
	b _022FD89C ; case 2
	b _022FD8A8 ; case 3
	b _022FD8B4 ; case 4
	b _022FD8C0 ; case 5
_022FD890:
	mov r0, #0x800000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD89C:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8A8:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8B4:
	mov r0, #0x2000000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8C0:
	ldr r0, _022FDA74 ; =0x02020000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8CC:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
_022FD8D4:
	ldrb r0, [r4, #3]
	cmp r0, #0
	ldrne r0, [r5, #0x128]
	orrne r0, r0, #0x80000000
	strne r0, [r5, #0x128]
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldreqb r0, [r8, #3]
	moveq r0, r0, lsl #0xb
	streq r0, [r5, #0x10]
	ldreqb r0, [r8, #4]
	movne r0, r0, lsl #0xb
	strne r0, [r5, #0x10]
	ldrneb r0, [r4, #2]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x14]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r5, #0x1c]
	ldrsb r0, [r8, #2]
	strb r0, [r5, #0x20]
	ldrb r0, [r8, #7]
	tst r0, #4
	bne _022FD968
	ldrb r0, [r8, #5]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x24]
	ldrb r0, [r8, #7]
	tst r0, #2
	ldrne r0, [r5, #0x24]
	addne r0, r0, #0x400
	strne r0, [r5, #0x24]
_022FD968:
	ldrb r0, [r8, #8]
	tst r0, #4
	bne _022FD994
	ldrb r0, [r8, #6]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x28]
	ldrb r0, [r8, #8]
	tst r0, #2
	ldrne r0, [r5, #0x28]
	addne r0, r0, #0x400
	strne r0, [r5, #0x28]
_022FD994:
	ldrb r0, [sp, #0x30]
	cmp r0, #0
	ldrne r0, [r5, #0x128]
	orrne r0, r0, #0x800000
	strne r0, [r5, #0x128]
	cmp sl, #0
	beq _022FDA54
	ldrsb r0, [r5, #0x20]
	mov r2, #0
	strb r0, [r5, #0x12c]
	ldr r3, [r5, #0x24]
	ldr r1, [r5, #0x18]
	add r0, r5, #0x2c
	sub r1, r3, r1
	str r1, [r5, #0x130]
	ldr r4, [r5, #0x24]
	ldr r3, [r5, #0x18]
	add r1, r5, #0x34
	add r3, r4, r3
	str r3, [r5, #0x138]
	ldr r4, [r5, #0x28]
	ldr r3, [r5, #0x1c]
	sub r3, r4, r3
	str r3, [r5, #0x134]
	ldr r4, [r5, #0x28]
	ldr r3, [r5, #0x1c]
	add r3, r4, r3
	str r3, [r5, #0x13c]
	str r2, [r5, #0x144]
	str r2, [r5, #0x140]
	bl ov11_022F1F08
	add r0, r5, #0x100
	mov r2, #0x800
	mov r1, #1
	strh r2, [r0, #0x4a]
	strb r1, [r5, #0x148]
	sub r1, r1, #2
	strh r1, [r0, #0x4c]
	mov r1, #0
	strh r1, [r0, #0x4e]
	ldrsh r1, [r5, #6]
	ldr r2, [r5, #0x128]
	add r0, r5, #0x150
	bl ov11_022F6F4C
	ldr r1, _022FDA78 ; =PERFORMER_FUNCTION_TABLE
	mov r2, r5
	add r0, r5, #0x3c
	bl InitScriptRoutine
_022FDA54:
	mov r1, #1
	mov r0, sb
	strb r1, [r5, #8]
_022FDA60:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FDA68: .word ov11_02320858
_022FDA6C: .word ov11_02324D04
_022FDA70: .word ov11_02322160
_022FDA74: .word 0x02020000
_022FDA78: .word PERFORMER_FUNCTION_TABLE
	arm_func_end ov11_022FD72C

	arm_func_start ov11_022FDA7C
ov11_022FDA7C: ; 0x022FDA7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FDBDC ; =ov11_023221A8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FDB44
	ldr r0, _022FDBE0 ; =ov11_02324D04
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FDBE4 ; =ov11_023221D8
	add r5, r4, #1
	mov r6, #1
_022FDAD8:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FDB28
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FDB28
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FDB28
	mov r0, r8
	bl DeleteLivePerformer
_022FDB28:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDAD8
	b _022FDBD4
_022FDB44:
	ldr r0, _022FDBE0 ; =ov11_02324D04
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022FDB60:
	ldrsh r3, [sl, #6]
	cmp r3, r7
	beq _022FDBBC
	ldrsb ip, [sl, #0xd]
	ldr r1, _022FDBE8 ; =ov11_02322204
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl Debug_Print
	ldrsb r0, [sl, #0xd]
	cmp r0, r6
	beq _022FDBA8
	cmp sb, r5
	cmpne sb, r0
	bne _022FDBBC
	mov r0, r8
	bl DeleteLivePerformer
	b _022FDBBC
_022FDBA8:
	ldrsh r0, [sl, #0xa]
	cmp r0, r4
	bne _022FDBBC
	mov r0, r8
	bl DeleteLivePerformer
_022FDBBC:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x214
	blt _022FDB60
_022FDBD4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDBDC: .word ov11_023221A8
_022FDBE0: .word ov11_02324D04
_022FDBE4: .word ov11_023221D8
_022FDBE8: .word ov11_02322204
	arm_func_end ov11_022FDA7C

	arm_func_start DeleteLivePerformer
DeleteLivePerformer: ; 0x022FDBEC
	stmdb sp!, {r4, lr}
	ldr r1, _022FDC2C ; =ov11_02324D04
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x214
	smlabb r4, r2, r0, r1
	ldr r1, _022FDC30 ; =ov11_02322224
	mov r0, #1
	bl Debug_Print
	add r0, r4, #0x150
	bl ov11_022F6F9C
	add r0, r4, #0x3c
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FDC2C: .word ov11_02324D04
_022FDC30: .word ov11_02322224
	arm_func_end DeleteLivePerformer

	arm_func_start ov11_022FDC34
ov11_022FDC34: ; 0x022FDC34
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FDD8C ; =ov11_023221A8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FDD04
	ldr r0, _022FDD90 ; =ov11_02324D04
	mvn r5, #0
	ldr r7, [r0]
	ldr fp, _022FDD94 ; =ov11_023221D8
	sub r4, r5, #1
	mov r6, #1
_022FDC90:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FDCE8
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FDCE8
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FDCE8
	mov r1, #0
	add r0, r7, #0x3c
	bl ov11_022DCFC4
	strh r5, [r7, #0xa]
_022FDCE8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDC90
	b _022FDD84
_022FDD04:
	ldr r0, _022FDD90 ; =ov11_02324D04
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0]
	ldr r6, _022FDD94 ; =ov11_023221D8
	sub r4, r5, #1
	mov fp, r7
_022FDD20:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FDD6C
	ldrsh r2, [sl, #0xa]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	cmp sb, r4
	ldrnesb r0, [sl, #0xd]
	cmpne sb, r0
	bne _022FDD6C
	mov r1, fp
	add r0, sl, #0x3c
	bl ov11_022DCFC4
	strb r5, [sl, #0xd]
_022FDD6C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x214
	blt _022FDD20
_022FDD84:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDD8C: .word ov11_023221A8
_022FDD90: .word ov11_02324D04
_022FDD94: .word ov11_023221D8
	arm_func_end ov11_022FDC34

	arm_func_start SetAttributeBitfieldLivePerformer
SetAttributeBitfieldLivePerformer: ; 0x022FDD98
	stmdb sp!, {r3, lr}
	ldr r3, _022FDDD4 ; =ov11_02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x128]
	add r0, ip, #0x150
	orr r1, r2, r1
	str r1, [ip, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FDDD4: .word ov11_02324D04
	arm_func_end SetAttributeBitfieldLivePerformer

	arm_func_start ResetAttributeBitfieldLivePerformer
ResetAttributeBitfieldLivePerformer: ; 0x022FDDD8
	stmdb sp!, {r3, lr}
	ldr r3, _022FDE18 ; =ov11_02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x128]
	eor r0, r1, r3
	and r1, r2, r0
	add r0, ip, #0x150
	str r1, [ip, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FDE18: .word ov11_02324D04
	arm_func_end ResetAttributeBitfieldLivePerformer

	arm_func_start ov11_022FDE1C
ov11_022FDE1C: ; 0x022FDE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FDE78
	ldr r0, _022FDE80 ; =ov11_02324D04
	mov r6, #0
	ldr r5, [r0]
	b _022FDE70
_022FDE40:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FDE60
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FDE60:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x214
_022FDE70:
	cmp r6, #0x10
	blt _022FDE40
_022FDE78:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FDE80: .word ov11_02324D04
	arm_func_end ov11_022FDE1C

	arm_func_start ov11_022FDE84
ov11_022FDE84: ; 0x022FDE84
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FDEE0
	ldr r0, _022FDEE8 ; =ov11_02324D04
	mov r6, #0
	ldr r5, [r0]
	b _022FDED8
_022FDEA8:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FDEC8
	add r0, r5, #0x3c
	bl ov11_022DC9A0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FDEC8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x214
_022FDED8:
	cmp r6, #0x10
	blt _022FDEA8
_022FDEE0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FDEE8: .word ov11_02324D04
	arm_func_end ov11_022FDE84

	arm_func_start ov11_022FDEEC
ov11_022FDEEC: ; 0x022FDEEC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mvn r0, #0
	mov r5, r1
	mov r4, r2
	cmp r6, r0
	beq _022FDF48
	ldr r0, _022FDF50 ; =ov11_02324D04
	mov r8, #0
	ldr r7, [r0]
_022FDF14:
	ldrsh r0, [r7, #6]
	cmp r0, r6
	bne _022FDF30
	mov r1, r5
	mov r2, r4
	add r0, r7, #0x3c
	bl ov11_022DCCEC
_022FDF30:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDF14
_022FDF48:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FDF50: .word ov11_02324D04
	arm_func_end ov11_022FDEEC

	arm_func_start ov11_022FDF54
ov11_022FDF54: ; 0x022FDF54
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	mov sb, r0
	sub r0, r7, #2
	mov r8, r1
	cmp sb, r0
	beq _022FDFC8
	ldr r0, _022FDFD0 ; =ov11_02324D04
	mov r6, #0
	ldr r5, [r0]
	mov r4, r6
_022FDF80:
	ldrsh r0, [r5, #6]
	cmp r0, sb
	bne _022FDFB0
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	beq _022FDFB0
	mov r1, r8
	add r0, r5, #0x3c
	bl ov11_022DCA58
	cmp r0, #0
	moveq r7, r4
_022FDFB0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x214
	blt _022FDF80
_022FDFC8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FDFD0: .word ov11_02324D04
	arm_func_end ov11_022FDF54

	arm_func_start ov11_022FDFD4
ov11_022FDFD4: ; 0x022FDFD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FE0E4
	ldr r1, _022FE19C ; =ov11_02322244
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE1A0 ; =ov11_02324D04
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, r8
_022FE030:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FE0C8
	ldrsh r0, [r6, #0xa]
	cmp r0, sl
	bne _022FE0C8
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne r0, sb
	bne _022FE0C8
	ldr r1, _022FE1A4 ; =ov11_02322288
	mov r0, #1
	mov r2, r7
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r6, #6]
	add r0, sp, #4
	mov r1, #5
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FE0C8
	add r0, r6, #0x3c
	add r1, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022FE0C8
	add r0, r6, #0x2c
	add r1, r6, #0x34
	bl ov11_022F1F08
	add r0, r6, #0x3c
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x148]
_022FE0C8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x214
	blt _022FE030
	b _022FE190
_022FE0E4:
	ldr r1, _022FE1A8 ; =ov11_0232229C
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE1A0 ; =ov11_02324D04
	mvn r4, #1
	ldr r7, [r0]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022FE10C:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FE178
	cmp sb, r4
	ldrnesb r0, [r7, #0xd]
	cmpne r0, sb
	bne _022FE178
	ldr r1, _022FE1A4 ; =ov11_02322288
	mov r0, #1
	mov r2, r6
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r7, #6]
	add r0, sp, #4
	mov r1, #5
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FE178
	add r0, r7, #0x3c
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x148]
_022FE178:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x214
	blt _022FE10C
_022FE190:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE19C: .word ov11_02322244
_022FE1A0: .word ov11_02324D04
_022FE1A4: .word ov11_02322288
_022FE1A8: .word ov11_0232229C
	arm_func_end ov11_022FDFD4

	arm_func_start ov11_022FE1AC
ov11_022FE1AC: ; 0x022FE1AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FE264
	ldr r1, _022FE2F0 ; =ov11_023222E0
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE2F4 ; =ov11_02324D04
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022FE204:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FE248
	ldrsh r0, [r6, #0xa]
	cmp sl, r0
	bne _022FE248
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne sb, r0
	bne _022FE248
	ldr r1, _022FE2F8 ; =ov11_02322288
	mov r0, fp
	mov r2, r7
	bl Debug_Print
	add r0, r6, #0x3c
	bl ov11_022DCAE0
	orr r8, r8, r0
_022FE248:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x214
	blt _022FE204
	b _022FE2E8
_022FE264:
	ldr r1, _022FE2FC ; =ov11_02322324
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022FE2F4 ; =ov11_02324D04
	mvn r5, #0
	ldr sl, [r0]
	ldr fp, _022FE2F8 ; =ov11_02322288
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022FE290:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FE2D0
	ldrsb r0, [sl, #0xd]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022FE2D0
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl Debug_Print
	add r0, sl, #0x3c
	bl ov11_022DD080
	strb r5, [sl, #0xd]
	orr r8, r8, r0
_022FE2D0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add sl, sl, #0x214
	blt _022FE290
_022FE2E8:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE2F0: .word ov11_023222E0
_022FE2F4: .word ov11_02324D04
_022FE2F8: .word ov11_02322288
_022FE2FC: .word ov11_02322324
	arm_func_end ov11_022FE1AC

	arm_func_start ov11_022FE300
ov11_022FE300: ; 0x022FE300
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FE350 ; =ov11_02324D04
	mov r4, #0
	ldr r7, [r0]
	mov r6, r4
	mvn r5, #0
_022FE318:
	ldrsh r0, [r7, #6]
	cmp r0, r5
	beq _022FE330
	add r0, r7, #0x3c
	bl ov11_022DCB00
	orr r4, r4, r0
_022FE330:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x214
	blt _022FE318
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE350: .word ov11_02324D04
	arm_func_end ov11_022FE300

	arm_func_start UnlockPerformerRoutines
UnlockPerformerRoutines: ; 0x022FE354
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022FE3AC ; =ov11_02324D04
	mov r5, #0
	ldr r4, [r1]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022FE370:
	ldrsh r0, [r4, #6]
	cmp r0, r7
	beq _022FE38C
	mov r1, r6
	add r0, r4, #0x3c
	bl UnlockRoutine
	orr r5, r5, r0
_022FE38C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r4, r4, #0x214
	blt _022FE370
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FE3AC: .word ov11_02324D04
	arm_func_end UnlockPerformerRoutines

	arm_func_start ov11_022FE3B0
ov11_022FE3B0: ; 0x022FE3B0
	ldr r3, _022FE400 ; =ov11_02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022FE3F4
	ldr r2, [ip, #0x130]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x134]
	ldr r0, [ip, #0x1c]
	add r0, r2, r0
_022FE3F4:
	str r0, [r1, #4]
	ldrsh r0, [ip, #6]
	bx lr
	.align 2, 0
_022FE400: .word ov11_02324D04
	arm_func_end ov11_022FE3B0

	arm_func_start SetPositionLivePerformer
SetPositionLivePerformer: ; 0x022FE404
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r5, [r0, #0x18]
	ldr r3, [r1]
	ldr lr, [r0, #0x1c]
	ldr r2, [r1, #4]
	sub r4, r3, r5
	ldr r1, [r0, #0x2c]
	sub ip, r2, lr
	add r3, r3, r5
	add r2, r2, lr
	str r4, [sp, #8]
	str ip, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	cmp r4, r1
	blt _022FE46C
	ldr r1, [r0, #0x34]
	cmp r3, r1
	bge _022FE46C
	ldr r1, [r0, #0x30]
	cmp ip, r1
	blt _022FE46C
	ldr r1, [r0, #0x38]
	cmp r2, r1
	blt _022FE474
_022FE46C:
	mov r0, #0x40
	b _022FE488
_022FE474:
	str r4, [r0, #0x130]
	str ip, [r0, #0x134]
	str r3, [r0, #0x138]
	str r2, [r0, #0x13c]
	mov r0, #0
_022FE488:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetPositionLivePerformer

	arm_func_start GetIdLivePerformer
GetIdLivePerformer: ; 0x022FE490
	ldrsh r0, [r0, #4]
	bx lr
	arm_func_end GetIdLivePerformer

	arm_func_start GetCollisionBoxLivePerformer
GetCollisionBoxLivePerformer: ; 0x022FE498
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxLivePerformer

	arm_func_start SetPositionInitialLivePerformer
SetPositionInitialLivePerformer: ; 0x022FE4AC
	cmp r1, #0
	beq _022FE4F8
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x130]
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r0, #0x138]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x1c]
	sub r2, r3, r2
	str r2, [r0, #0x134]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x13c]
	bx lr
_022FE4F8:
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x130]
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x138]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x134]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r3, ip, r3
	str r3, [r0, #0x13c]
	str r2, [r0, #0x144]
	str r2, [r0, #0x140]
	ldrsb r2, [r1, #0x2c]
	ldrsb r1, [r0, #0x20]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x148]
	ldrsb r1, [r0, #0x20]
	strb r1, [r0, #0x12c]
	bx lr
	arm_func_end SetPositionInitialLivePerformer

	arm_func_start SetMovementRangeLivePerformer
SetMovementRangeLivePerformer: ; 0x022FE568
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x34]
	str r1, [r0, #0x38]
	bx lr
	arm_func_end SetMovementRangeLivePerformer

	arm_func_start GetCollisionBoxCenterLivePerformer
GetCollisionBoxCenterLivePerformer: ; 0x022FE58C
	ldr r3, [r0, #0x130]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x134]
	ldr r0, [r0, #0x1c]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxCenterLivePerformer

	arm_func_start SetPositionLivePerformerVeneer
SetPositionLivePerformerVeneer: ; 0x022FE5B0
	ldr ip, _022FE5B8 ; =SetPositionLivePerformer
	bx ip
	.align 2, 0
_022FE5B8: .word SetPositionLivePerformer
	arm_func_end SetPositionLivePerformerVeneer

	arm_func_start GetHeightLivePerformer
GetHeightLivePerformer: ; 0x022FE5BC
	ldr r3, [r0, #0x140]
	str r3, [r1]
	ldr r0, [r0, #0x144]
	str r0, [r2]
	bx lr
	arm_func_end GetHeightLivePerformer

	arm_func_start SetHeightLivePerformer
SetHeightLivePerformer: ; 0x022FE5D0
	str r1, [r0, #0x140]
	bx lr
	arm_func_end SetHeightLivePerformer

	arm_func_start GetDirectionLivePerformer
GetDirectionLivePerformer: ; 0x022FE5D8
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x2c]
	strb r0, [r1]
	bx lr
	arm_func_end GetDirectionLivePerformer

	arm_func_start SetDirectionLivePerformer
SetDirectionLivePerformer: ; 0x022FE5E8
	mvn r2, #0
	cmp r1, r2
	strneb r1, [r0, #0x12c]
	bx lr
	arm_func_end SetDirectionLivePerformer

	arm_func_start SetAnimationLivePerformer
SetAnimationLivePerformer: ; 0x022FE5F8
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	tst r1, #0x800
	mov ip, r2, lsr #0x10
	beq _022FE628
	add r1, r0, #0x100
	mov r2, #0x400
	strh r2, [r1, #0x4a]
	mov r1, #1
	strb r1, [r0, #0x148]
	bx lr
_022FE628:
	cmp r3, #0
	ldrne r1, _022FE6B4 ; =ov11_023220DC
	movne r2, r3, lsl #1
	ldrnesh r3, [r1, r2]
	addeq r1, r0, #0x100
	ldreqsh r3, [r1, #0x4a]
	cmp ip, #0x200
	bgt _022FE660
	bge _022FE67C
	cmp ip, #0x100
	orreq r1, r3, #0x300
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FE688
_022FE660:
	cmp ip, #0x300
	ble _022FE688
	cmp ip, #0x400
	orreq r1, r3, #0x200
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FE688
_022FE67C:
	orr r1, r3, #0x100
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_022FE688:
	add r1, r0, #0x100
	ldrsh r2, [r1, #0x4a]
	cmp r2, r3
	strneh r3, [r1, #0x4a]
	movne r1, #1
	strneb r1, [r0, #0x148]
	bxne lr
	tst r2, #0x1000
	movne r1, #1
	strneb r1, [r0, #0x148]
	bx lr
	.align 2, 0
_022FE6B4: .word ov11_023220DC
	arm_func_end SetAnimationLivePerformer

	arm_func_start SetEffectLivePerformer
SetEffectLivePerformer: ; 0x022FE6B8
	add r0, r0, #0x100
	strh r1, [r0, #0x4c]
	strh r2, [r0, #0x4e]
	bx lr
	arm_func_end SetEffectLivePerformer

	arm_func_start GetAnimationStatusLivePerformer
GetAnimationStatusLivePerformer: ; 0x022FE6C8
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x148]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x150
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end GetAnimationStatusLivePerformer

	arm_func_start GetEffectStatusLivePerformer
GetEffectStatusLivePerformer: ; 0x022FE6E8
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r3, [r1, #0x4c]
	mvn r2, #0
	cmp r3, r2
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldrsh r1, [r1, #0x4e]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x150
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end GetEffectStatusLivePerformer

	arm_func_start GetAttributeBitfieldLivePerformer
GetAttributeBitfieldLivePerformer: ; 0x022FE720
	ldr r0, [r0, #0x128]
	str r0, [r1]
	bx lr
	arm_func_end GetAttributeBitfieldLivePerformer

	arm_func_start SetAttributeBitfieldLivePerformerWrapper
SetAttributeBitfieldLivePerformerWrapper: ; 0x022FE72C
	ldr ip, _022FE738 ; =SetAttributeBitfieldLivePerformer
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FE738: .word SetAttributeBitfieldLivePerformer
	arm_func_end SetAttributeBitfieldLivePerformerWrapper

	arm_func_start ResetAttributeBitfieldLivePerformerWrapper
ResetAttributeBitfieldLivePerformerWrapper: ; 0x022FE73C
	ldr ip, _022FE748 ; =ResetAttributeBitfieldLivePerformer
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FE748: .word ResetAttributeBitfieldLivePerformer
	arm_func_end ResetAttributeBitfieldLivePerformerWrapper

	arm_func_start SetBlinkLivePerformer
SetBlinkLivePerformer: ; 0x022FE74C
	ldr ip, _022FE758 ; =ov11_022F4984
	add r0, r0, #0x150
	bx ip
	.align 2, 0
_022FE758: .word ov11_022F4984
	arm_func_end SetBlinkLivePerformer

	arm_func_start SetPositionOffsetLivePerformer
SetPositionOffsetLivePerformer: ; 0x022FE75C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr ip, [r1]
	ldr r2, [r0, #0x130]
	ldr lr, [r1, #4]
	add r4, r2, ip
	ldr r1, [r0, #0x13c]
	ldr r3, [r0, #0x138]
	ldr r2, [r0, #0x2c]
	add r3, r3, ip
	add r1, r1, lr
	ldr ip, [r0, #0x134]
	str r1, [sp, #0xc]
	cmp r4, r2
	ldrlt r1, [r0, #0x10]
	add ip, ip, lr
	str r4, [sp]
	str r3, [sp, #8]
	addlt r1, r2, r1
	str ip, [sp, #4]
	strlt r2, [sp]
	strlt r1, [sp, #8]
	blt _022FE7D0
	ldr r2, [r0, #0x34]
	cmp r3, r2
	ldrge r1, [r0, #0x10]
	strge r2, [sp, #8]
	subge r1, r2, r1
	strge r1, [sp]
_022FE7D0:
	ldr r2, [r0, #0x30]
	ldr r1, [sp, #4]
	cmp r1, r2
	ldrlt r1, [r0, #0x14]
	strlt r2, [sp, #4]
	addlt r1, r2, r1
	strlt r1, [sp, #0xc]
	blt _022FE80C
	ldr r2, [r0, #0x38]
	ldr r1, [sp, #0xc]
	cmp r1, r2
	ldrge r1, [r0, #0x14]
	strge r2, [sp, #0xc]
	subge r1, r2, r1
	strge r1, [sp, #4]
_022FE80C:
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r0, #0x130]
	ldr r2, [sp, #8]
	str r1, [r0, #0x134]
	ldr r1, [sp, #0xc]
	str r2, [r0, #0x138]
	str r1, [r0, #0x13c]
	mov r0, #0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end SetPositionOffsetLivePerformer

	arm_func_start ov11_022FE838
ov11_022FE838: ; 0x022FE838
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FE8C8 ; =ov11_02324D04
	mov r4, #0
	ldr r5, [r0]
	mov r7, r4
	mvn r6, #0
_022FE850:
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ldrneb r0, [r5, #8]
	cmpne r0, #0
	beq _022FE8AC
	add r0, r5, #0x3c
	bl FuncThatCallsRunNextOpcode
	cmp r0, #0
	beq _022FE888
	cmp r0, #6
	bne _022FE888
	mov r0, r4
	bl DeleteLivePerformer
	b _022FE8AC
_022FE888:
	ldrb r0, [r5, #0x148]
	cmp r0, #0
	beq _022FE8AC
	strb r7, [r5, #0x148]
	add r0, r5, #0x100
	ldrsh r1, [r0, #0x4a]
	mov r2, r7
	add r0, r5, #0x150
	bl SetAnimDataFields2
_022FE8AC:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	add r5, r5, #0x214
	blt _022FE850
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE8C8: .word ov11_02324D04
	arm_func_end ov11_022FE838

	arm_func_start ov11_022FE8CC
ov11_022FE8CC: ; 0x022FE8CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FE9D8 ; =ov11_023220B4
	ldr r1, _022FE9DC ; =ov11_02324D04
	ldr r8, [r0, #0x18]
	ldr r7, [r0, #0x1c]
	mov sb, #0
	ldr sl, [r1]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FE8FC:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	ldrneb r0, [sl, #8]
	cmpne r0, #0
	beq _022FE9B8
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r2, [sl, #0x130]
	ldr r1, [sl, #0x18]
#ifdef JAPAN
	add r0, sl, #0x150
#else
	add r0, sl, #0x100
#endif
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r2, [sl, #0x134]
	ldr r1, [sl, #0x1c]
	add r1, r2, r1
	str r1, [sp, #0x10]
#ifdef JAPAN
	ldr r6, [sl, #0x140]
	ldr r5, [sl, #0x144]
	bl ov11_022F5FE8_JP
	cmp r0, #0
	beq _022FE970
	strb fp, [sl, #0x148]
	add r0, sl, #0x100
#else
	ldrsh r1, [r0, #0xe2]
	ldr r6, [sl, #0x140]
	ldr r5, [sl, #0x144]
	cmp r1, #0
	bge _022FE970
	ldrsh r1, [r0, #0xdc]
	cmp r1, #0
	ble _022FE970
	strb fp, [sl, #0x148]
#endif
	ldrsh r1, [r0, #0x4a]
	mov r2, fp
	add r0, sl, #0x150
	bl SetAnimDataFields2
_022FE970:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x4c]
	cmp r1, r4
	beq _022FE9A8
	mov r0, #0
	str r0, [sp]
	ldrsh r2, [r3, #0x4e]
	ldrsb r3, [r3, #0x2c]
	add r0, sl, #0x150
	bl ov11_022F5408
	add r1, sl, #0x100
	strh r4, [r1, #0x4c]
	mov r0, #0
	strh r0, [r1, #0x4e]
_022FE9A8:
	add r1, sp, #0xc
	add r0, sl, #0x150
	add r2, r6, r5
	bl ov11_022F6FA8
_022FE9B8:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	add sl, sl, #0x214
	blt _022FE8FC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE9D8: .word ov11_023220B4
_022FE9DC: .word ov11_02324D04
	arm_func_end ov11_022FE8CC

	arm_func_start ov11_022FE9E0
ov11_022FE9E0: ; 0x022FE9E0
	stmdb sp!, {r3, lr}
	mov r0, #0x400
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FEA24 ; =ov11_02324D08
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FEA00:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #2]
	cmp r3, #0x20
	add r0, r0, #0x20
	blt _022FEA00
	bl ov11_022FEA28
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FEA24: .word ov11_02324D08
	arm_func_end ov11_022FE9E0

	arm_func_start ov11_022FEA28
ov11_022FEA28: ; 0x022FEA28
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FEA6C ; =ov11_02324D08
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FEA3C:
	ldrsh r0, [r6, #2]
	cmp r0, r4
	beq _022FEA50
	mov r0, r5
	bl DeleteLiveEvent
_022FEA50:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x20
	add r6, r6, #0x20
	blt _022FEA3C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FEA6C: .word ov11_02324D08
	arm_func_end ov11_022FEA28

	arm_func_start ov11_022FEA70
ov11_022FEA70: ; 0x022FEA70
	stmdb sp!, {r3, lr}
	bl ov11_022FEA28
	ldr r0, _022FEA94 ; =ov11_02324D08
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FEA94 ; =ov11_02324D08
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FEA94: .word ov11_02324D08
	arm_func_end ov11_022FEA70

	arm_func_start ov11_022FEA98
ov11_022FEA98: ; 0x022FEA98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bpl _022FEB00
	ldr r0, _022FEBF4 ; =ov11_02324D08
	mov r2, #0
	ldr r4, [r0]
	mvn r1, #0
	b _022FEAE8
_022FEAC8:
	ldrsh r0, [r4, #2]
	cmp r0, r1
	moveq sl, r2
	beq _022FEAF0
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r4, r4, #0x20
_022FEAE8:
	cmp r2, #0x20
	blt _022FEAC8
_022FEAF0:
	cmp sl, #0
	bge _022FEB0C
	mvn r0, #0
	b _022FEBEC
_022FEB00:
	ldr r0, _022FEBF4 ; =ov11_02324D08
	ldr r0, [r0]
	add r4, r0, sl, lsl #5
_022FEB0C:
	str r8, [sp]
	str r7, [sp, #4]
	ldrsh r3, [sb]
	ldr r1, _022FEBF8 ; =ov11_02322368
	mov r2, sl
	mov r0, #1
	bl Debug_Print
	ldrsh r0, [sb]
	bl ov11_022E7FA8
	strh sl, [r4]
	ldrsh r1, [sb]
	strh r1, [r4, #2]
	strh r8, [r4, #4]
	strb r7, [r4, #6]
	ldrsh r1, [sb, #8]
	strh r1, [r4, #8]
	ldrsh r0, [r0, #2]
	cmp r0, #1
	cmpne r0, #2
	beq _022FEB64
	cmp r0, #7
	b _022FEB70
_022FEB64:
	mov r0, #0x1800
	str r0, [r4, #0xc]
	b _022FEB78
_022FEB70:
	mov r0, #0x800
	str r0, [r4, #0xc]
_022FEB78:
	ldrb r2, [sb, #2]
	ldrb r0, [sb, #3]
	ldrb r1, [sb, #6]
	mov r2, r2, lsl #0xb
	mov r0, r0, lsl #0xb
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	tst r1, #4
	bne _022FEBAC
	ldrb r0, [sb, #4]
	tst r1, #2
	mov r5, r0, lsl #0xb
	addne r5, r5, #0x400
_022FEBAC:
	ldrb r1, [sb, #7]
	tst r1, #4
	bne _022FEBC8
	ldrb r0, [sb, #5]
	tst r1, #2
	mov r6, r0, lsl #0xb
	addne r6, r6, #0x400
_022FEBC8:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r5, [r4, #0x10]
	add r1, r5, r1
	str r1, [r4, #0x18]
	str r6, [r4, #0x14]
	add r1, r6, r0
	mov r0, sl
	str r1, [r4, #0x1c]
_022FEBEC:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FEBF4: .word ov11_02324D08
_022FEBF8: .word ov11_02322368
	arm_func_end ov11_022FEA98

	arm_func_start ov11_022FEBFC
ov11_022FEBFC: ; 0x022FEBFC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _022FEC64 ; =ov11_02324D08
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	mov r5, #0
	mvn r8, #0
_022FEC18:
	ldrsh r0, [r4, #2]
	cmp r0, r8
	beq _022FEC48
	ldrsh r0, [r4, #4]
	cmp r0, r7
	bne _022FEC48
	cmp r6, r8
	ldrnesb r0, [r4, #6]
	cmpne r6, r0
	bne _022FEC48
	mov r0, r5
	bl DeleteLiveEvent
_022FEC48:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x20
	add r4, r4, #0x20
	blt _022FEC18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FEC64: .word ov11_02324D08
	arm_func_end ov11_022FEBFC

	arm_func_start DeleteLiveEvent
DeleteLiveEvent: ; 0x022FEC68
	stmdb sp!, {r4, lr}
	ldr r1, _022FEC94 ; =ov11_02324D08
	mov r2, r0
	ldr r3, [r1]
	ldr r1, _022FEC98 ; =ov11_023223A4
	mov r0, #1
	add r4, r3, r2, lsl #5
	bl Debug_Print
	mvn r0, #0
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FEC94: .word ov11_02324D08
_022FEC98: .word ov11_023223A4
	arm_func_end DeleteLiveEvent

	arm_func_start ov11_022FEC9C
ov11_022FEC9C: ; 0x022FEC9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FED68 ; =ov11_023223C0
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022FED60
	ldr r0, _022FED6C ; =ov11_02324D08
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FED70 ; =ov11_023223EC
	mov r8, #0
	add r5, r4, #1
	mov r6, #1
_022FECF8:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022FED48
	ldrsh r2, [r7, #4]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #6]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #4]
	cmp sl, r0
	bne _022FED48
	cmp sb, r4
	ldrnesb r0, [r7, #6]
	cmpne sb, r0
	bne _022FED48
	mov r0, r8
	bl DeleteLiveEvent
_022FED48:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x20
	add r7, r7, #0x20
	blt _022FECF8
_022FED60:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FED68: .word ov11_023223C0
_022FED6C: .word ov11_02324D08
_022FED70: .word ov11_023223EC
	arm_func_end ov11_022FEC9C

	arm_func_start ov11_022FED74
ov11_022FED74: ; 0x022FED74
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022FEDF0 ; =ov11_02324D08
	mov r2, r0
	ldr r0, [r1]
	ldr r1, _022FEDF4 ; =ov11_02322418
	add r4, r0, r2, lsl #5
	ldrsh r3, [r4, #4]
	mov r0, #1
	str r3, [sp]
	ldrsh r3, [r4, #8]
	str r3, [sp, #4]
	ldrsh r3, [r4, #2]
	bl Debug_Print
	ldrsh r0, [r4, #2]
	mvn r2, #0
	cmp r0, r2
	beq _022FEDE4
	ldrsh r1, [r4, #8]
	cmp r1, r2
	bne _022FEDD4
	mov r1, #0
	bl ov11_022F7188
	b _022FEDDC
_022FEDD4:
	ldrsh r0, [r4, #4]
	bl ov11_022F74A0
_022FEDDC:
	mov r0, #1
	b _022FEDE8
_022FEDE4:
	mov r0, #0
_022FEDE8:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FEDF0: .word ov11_02324D08
_022FEDF4: .word ov11_02322418
	arm_func_end ov11_022FED74

	arm_func_start GetCollidingEventId
GetCollidingEventId: ; 0x022FEDF8
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FEE8C ; =ov11_02324D08
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FEE7C
_022FEE10:
	ldrsh r4, [ip, #2]
	cmp r4, lr
	beq _022FEE6C
	ldr r4, [ip, #0xc]
	tst r4, r0
	beq _022FEE6C
	ldr r5, [ip, #0x10]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FEE6C
	ldr r5, [ip, #0x18]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FEE6C
	ldr r5, [ip, #0x14]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FEE6C
	ldr r5, [ip, #0x1c]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FEE6C:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x20
_022FEE7C:
	cmp r3, #0x20
	blt _022FEE10
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FEE8C: .word ov11_02324D08
	arm_func_end GetCollidingEventId

	arm_func_start ov11_022FEE90
ov11_022FEE90: ; 0x022FEE90
	bx lr
	arm_func_end ov11_022FEE90

	arm_func_start CreateTeamInfoBox
CreateTeamInfoBox: ; 0x022FEE94
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r0, #0x378
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	bl GetGameMode
	cmp r0, #3
	ldreq r0, _022FEF18 ; =ov11_0232246C
	add r5, sp, #0
	ldrne r0, _022FEF1C ; =TEAM_INFO_BOX_DEFAULT_WINDOW_PARAMS
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r2, _022FEF20 ; =UpdateTeamInfoBox
	str r4, [sp, #0xc]
	add r0, sp, #0
	mov r1, #1
	str r2, [r4]
	bl NewWindowScreenCheck
	mov r2, #1
	mov r5, r0
	mov r1, #0
	str r2, [r4, #0x370]
	str r1, [r4, #0x374]
	sub r1, r1, #2
	add r0, r4, #8
	strb r1, [r4, #4]
	bl InitPortraitParams
	mov r1, #3
	mov r0, r5
	str r1, [r4, #0x18]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FEF18: .word ov11_0232246C
_022FEF1C: .word TEAM_INFO_BOX_DEFAULT_WINDOW_PARAMS
_022FEF20: .word UpdateTeamInfoBox
	arm_func_end CreateTeamInfoBox

	arm_func_start ov11_022FEF24
ov11_022FEF24: ; 0x022FEF24
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #4
	str r1, [r0, #0x370]
	ldrsb r0, [r0, #4]
	sub r1, r1, #6
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F954
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FEF24

	arm_func_start CloseTeamInfoBox
CloseTeamInfoBox: ; 0x022FEF4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4, #4]
	mvn r1, #1
	cmp r0, r1
	beq _022FEF70
	bl CloseTextBox
_022FEF70:
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseTeamInfoBox

	arm_func_start IsTeamInfoBoxActive
IsTeamInfoBoxActive: ; 0x022FEF84
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x370]
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamInfoBoxActive

	arm_func_start UpdateTeamInfoBox
UpdateTeamInfoBox: ; 0x022FEFA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r8, r0
	ldr r4, [r8, #0xc]
	ldr r0, [r4, #0x370]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022FF1B4
_022FEFC8: ; jump table
	b _022FF1B4 ; case 0
	b _022FEFDC ; case 1
	b _022FEFFC ; case 2
	b _022FF1B4 ; case 3
	b _022FF17C ; case 4
_022FEFDC:
	ldrsb r0, [r8, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _022FF1B4
	mov r0, #2
	str r0, [r4, #0x370]
	mov r0, #1
	str r0, [r4, #0x374]
_022FEFFC:
	ldr r6, [r8, #0xc]
	bl GetGameMode
	mov r5, r0
	ldrsb r0, [r8, #0x10]
	bl sub_02027B1C
	cmp r5, #3
	beq _022FF118
	bl GetRank
	str r0, [sp, #0x14]
	bl GetRankupPoints
	cmp r0, #0
	ldreq r7, _022FF1C0 ; =0x00000222
	str r0, [sp, #0x28]
	add ip, sp, #4
	ldr r2, _022FF1C4 ; =0x0000021F
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	ldrne r7, _022FF1CC ; =0x00000221
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x54
	bl sub_020265A8
	ldrsb r0, [r8, #0x10]
	mov r1, #0x3a
#ifdef EUROPE
	mov r2, #0xe
#else
	mov r2, #4
#endif
	add r3, sp, #0x54
	bl DrawTextInWindow
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _022FF0AC
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _022FF1D0 ; =0x00000226
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	mov r1, #0x28
	mov r2, #0x16
	bl DrawTextInWindow
_022FF0AC:
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r2, r7
	mov r1, #0x100
	bl PreprocessStringFromId
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	mov r1, #0x3a
#ifdef EUROPE
	mov r2, #0x1a
#else
	mov r2, #0x16
#endif
	bl DrawTextInWindow
	ldrsb r0, [r6, #4]
	mvn r1, #1
	cmp r0, r1
	beq _022FF0F8
	bl CloseTextBox
	mvn r0, #1
	strb r0, [r6, #4]
_022FF0F8:
	bl GetRank
	mov r1, #3
	mov r3, r1
	mov r2, #0x12
	bl PrintBadgeMark
	strb r0, [r6, #4]
	ldrsb r0, [r8, #0x10]
	bl UpdateWindow
_022FF118:
	bl GetMoneyCarried
	str r0, [sp, #0x28]
	add r6, sp, #4
#ifdef JAPAN
	ldr r2, _0230083C ; =0x0000042B
#endif
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
#ifndef JAPAN
	mov r2, #0x224
#endif
	str r6, [sp]
	bl PreprocessStringFromId
	cmp r5, #3
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
#ifdef EUROPE
	mov r2, #2
	beq _022FF15C
	mov r1, #0xaa
#else
	beq _022FF15C
	mov r1, #0x9a
	mov r2, #4
#endif
	bl DrawTextInWindow
	b _022FF168
_022FF15C:
	mov r1, #0x10
#ifndef EUROPE
	mov r2, #2
#endif
	bl DrawTextInWindow
_022FF168:
	mov r0, #3
	str r0, [r4, #0x370]
	sub r0, r0, #4
	str r0, [r8, #0xb8]
	b _022FF1B4
_022FF17C:
	mov r1, #4
	str r1, [r4, #0x374]
	ldrsb r0, [r4, #4]
	sub r1, r1, #6
	cmp r0, r1
	beq _022FF198
	bl sub_0202F954
_022FF198:
	ldrsb r0, [r8, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r8, #0xb8]
	movne r0, #5
	strne r0, [r4, #0x370]
_022FF1B4:
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_022FF1C0: .word 0x00000429
_022FF1C4: .word 0x00000426
_022FF1C8: .word 0x0000C402
_022FF1CC: .word 0x00000428
_022FF1D0: .word 0x0000042D
_0230083C: .word 0x0000042B
#else
_022FF1C0: .word 0x00000222
_022FF1C4: .word 0x0000021F
_022FF1C8: .word 0x0000C402
_022FF1CC: .word 0x00000221
_022FF1D0: .word 0x00000226
#endif
	arm_func_end UpdateTeamInfoBox

	arm_func_start ov11_022FF1D4
ov11_022FF1D4: ; 0x022FF1D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022FF20C ; =ov11_0232247C
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FF210 ; =ov11_02324D0C
	ldr r0, _022FF214 ; =ov11_0238A074
	ldr r2, _022FF218 ; =0x000002BD
	strh r4, [r1]
	strh r5, [r0]
	strh r2, [r1, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF20C: .word ov11_0232247C
_022FF210: .word ov11_02324D0C
_022FF214: .word ov11_0238A074
_022FF218: .word 0x000002BD
	arm_func_end ov11_022FF1D4

	arm_func_start ov11_022FF21C
ov11_022FF21C: ; 0x022FF21C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r0, #0x620
	mov r1, #8
	mov r4, #0
	bl MemAlloc
	ldr r1, _022FF304 ; =ov11_02324D0C
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl sub_02034A38
	ldr r3, _022FF304 ; =ov11_02324D0C
	mov r1, r4
	ldr ip, [r3, #4]
	ldr r2, _022FF308 ; =ov11_0238A074
	str r0, [ip, #8]
	ldrsh r2, [r2]
	ldr r0, [r3, #4]
	ldr lr, _022FF30C ; =C_ROUTINES
	strh r2, [r0, #0xa4]
	ldr r0, _022FF310 ; =0x000002BD
	mov r5, r1
_022FF270:
	ldr r6, [r3, #4]
	ldrsh ip, [lr, #2]
	ldrsh r2, [r6, #0xa4]
	cmp ip, r2
	bne _022FF29C
	ldrsh r2, [r3]
	cmp r2, r5
	add r2, r6, r1, lsl #1
	moveq r4, r1
	strh r5, [r2, #0xa6]
	add r1, r1, #1
_022FF29C:
	add r5, r5, #1
	cmp r5, r0
	add lr, lr, #8
	blt _022FF270
	ldr r2, _022FF304 ; =ov11_02324D0C
	mov r3, #0xa
	ldr ip, [r2, #4]
	ldr r0, _022FF314 ; =ov11_0232248C
	str r4, [ip, #0xc]
	stmia sp, {r1, r3}
	ldr r1, [r2, #4]
	ldr r3, _022FF318 ; =ov11_022FF438
	add r2, r1, #0xc
	mov r1, #0x33
	bl CreateAdvancedMenu
	ldr r1, _022FF304 ; =ov11_02324D0C
	mov r4, #0
	ldr r3, [r1, #4]
	ldr r2, _022FF310 ; =0x000002BD
	strb r0, [r3]
	ldr r3, [r1, #4]
	mov r0, #1
	str r4, [r3, #4]
	strh r2, [r1, #2]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FF304: .word ov11_02324D0C
_022FF308: .word ov11_0238A074
_022FF30C: .word C_ROUTINES
_022FF310: .word 0x000002BD
_022FF314: .word ov11_0232248C
_022FF318: .word ov11_022FF438
	arm_func_end ov11_022FF21C

	arm_func_start ov11_022FF31C
ov11_022FF31C: ; 0x022FF31C
	stmdb sp!, {r3, lr}
	ldr r0, _022FF354 ; =ov11_02324D0C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF354 ; =ov11_02324D0C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FF354 ; =ov11_02324D0C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF354: .word ov11_02324D0C
	arm_func_end ov11_022FF31C

	arm_func_start ov11_022FF358
ov11_022FF358: ; 0x022FF358
	stmdb sp!, {r3, lr}
	ldr r0, _022FF434 ; =ov11_02324D0C
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _022FF384
	cmp r1, #1
	beq _022FF3A4
	cmp r1, #2
	beq _022FF3FC
	b _022FF42C
_022FF384:
	ldrsb r0, [r2]
	bl IsAdvancedMenuActive
	cmp r0, #0
	ldreq r0, _022FF434 ; =ov11_02324D0C
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _022FF42C
_022FF3A4:
	ldrsb r0, [r2]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF42C
	ldr r0, _022FF434 ; =ov11_02324D0C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	ldrlt r0, _022FF434 ; =ov11_02324D0C
	mvnlt r1, #0
	strlth r1, [r0, #2]
	ldrge r1, _022FF434 ; =ov11_02324D0C
	ldrge r2, [r1, #4]
	addge r0, r2, r0, lsl #1
	ldrgesh r0, [r0, #0xa6]
	strgeh r0, [r1, #2]
	ldr r0, _022FF434 ; =ov11_02324D0C
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF42C
_022FF3FC:
	mov r1, #3
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _022FF424
	ldrsh r1, [r0, #2]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_022FF424:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022FF42C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF434: .word ov11_02324D0C
	arm_func_end ov11_022FF358

	arm_func_start ov11_022FF438
ov11_022FF438: ; 0x022FF438
	ldr r0, _022FF458 ; =ov11_02324D0C
	ldr r2, _022FF45C ; =C_ROUTINES
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #1
	ldrsh r0, [r0, #0xa6]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022FF458: .word ov11_02324D0C
_022FF45C: .word C_ROUTINES
	arm_func_end ov11_022FF438

	arm_func_start ov11_022FF460
ov11_022FF460: ; 0x022FF460
	ldr r2, _022FF488 ; =ov11_02324D0C
	ldr r1, _022FF48C ; =0x000002BD
	ldrsh r3, [r2, #2]
	strh r3, [r0]
	ldrsh r0, [r2, #2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022FF488: .word ov11_02324D0C
_022FF48C: .word 0x000002BD
	arm_func_end ov11_022FF460

	arm_func_start ov11_022FF490
ov11_022FF490: ; 0x022FF490
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, _022FF4F0 ; =ov11_0232249C
	mov r5, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
#ifdef JAPAN
	ldr r0, _022FF4F8 ; =ov11_02324D14
	mov r1, #0x1b4
	strh r1, [r0, #2]
	cmp r5, #0
#else
	ldr r1, _022FF4F4 ; =0x000001AF
	ldr r0, _022FF4F8 ; =ov11_02324D14
	cmp r5, #0
	strh r1, [r0, #2]
#endif
	bne _022FF4CC
	ldr r0, _022FF4FC ; =ov11_0238A078
	bl ov11_022E45F4
	b _022FF4E4
_022FF4CC:
	ldr r2, _022FF4FC ; =ov11_0238A078
	mov r1, #8
_022FF4D4:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF4D4
_022FF4E4:
	ldr r0, _022FF4F8 ; =ov11_02324D14
	strh r4, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF4F0: .word ov11_0232249C
#if defined(EUROPE)
_022FF4F4: .word 0x000001CB
#elif !defined(JAPAN)
_022FF4F4: .word 0x000001AF
#endif
_022FF4F8: .word ov11_02324D14
_022FF4FC: .word ov11_0238A078
	arm_func_end ov11_022FF490

	arm_func_start ov11_022FF500
ov11_022FF500: ; 0x022FF500
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	mov r1, #8
	bl MemAlloc
	ldr r1, _022FF57C ; =ov11_02324D14
	mvn r2, #1
	str r0, [r1, #4]
	strb r2, [r0]
	ldrsh ip, [r1]
	add r0, r2, #1
	ldr r3, _022FF580 ; =ov11_0238A078
	cmp ip, r0
	ldr r0, [r1, #4]
	moveq r1, #0
	movne r1, #2
	str r1, [r0, #4]
	ldr r0, _022FF57C ; =ov11_02324D14
	mov r1, #8
	ldr r2, [r0, #4]
	strh ip, [r2, #0x1c]
	ldr r0, [r0, #4]
	add r2, r0, #0x14
_022FF558:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF558
#ifdef JAPAN
	ldr r0, _022FF57C ; =ov11_02324D14
	mov r1, #0x1b4
	strh r1, [r0, #2]
	mov r0, #1
#else
	ldr r2, _022FF584 ; =0x000001AF
	ldr r1, _022FF57C ; =ov11_02324D14
	mov r0, #1
	strh r2, [r1, #2]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF57C: .word ov11_02324D14
_022FF580: .word ov11_0238A078
#if defined(EUROPE)
_022FF584: .word 0x000001CB
#elif !defined(JAPAN)
_022FF584: .word 0x000001AF
#endif
	arm_func_end ov11_022FF500

	arm_func_start ov11_022FF588
ov11_022FF588: ; 0x022FF588
	stmdb sp!, {r3, lr}
	ldr r0, _022FF5CC ; =ov11_02324D14
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _022FF5B0
	bl CloseAdvancedMenu
_022FF5B0:
	ldr r0, _022FF5CC ; =ov11_02324D14
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FF5CC ; =ov11_02324D14
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF5CC: .word ov11_02324D14
	arm_func_end ov11_022FF588

	arm_func_start ov11_022FF5D0
ov11_022FF5D0: ; 0x022FF5D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x128
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022FF9D4
_022FF5F0: ; jump table
	b _022FF608 ; case 0
	b _022FF694 ; case 1
	b _022FF724 ; case 2
	b _022FF8B8 ; case 3
	b _022FF950 ; case 4
	b _022FF9C4 ; case 5
_022FF608:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF644
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF644:
	ldr r0, _022FF9E0 ; =ov11_02324D14
#ifdef JAPAN
	mov r1, #0x1b4
#else
	ldr r1, _022FF9E4 ; =0x000001AF
#endif
	ldr r2, [r0, #4]
	ldr r0, _022FF9E8 ; =ov11_023224AC
	ldrsh r4, [r2, #0x1c]
	ldr r3, _022FF9EC ; =ov11_022FF9FC
	add r2, sp, #0x90
	str r4, [sp, #0x90]
	str r1, [sp]
	mov r4, #0xa
	mov r1, #0x33
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _022FF9E0 ; =ov11_02324D14
	mov r2, #1
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _022FF9D4
_022FF694:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	bge _022FF6EC
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r2, #0
	ldr r1, [r0, #4]
	strh r2, [r1, #0x1c]
	ldr r0, [r0, #4]
	add r0, r0, #0x14
	bl ov11_022E45F4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF6EC:
	ldr r1, _022FF9E0 ; =ov11_02324D14
	ldr r3, [r1, #4]
	ldrsh r2, [r3, #0x1c]
	cmp r2, r0
	beq _022FF710
	strh r0, [r3, #0x1c]
	ldr r0, [r1, #4]
	add r0, r0, #0x14
	bl ov11_022E45F4
_022FF710:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF724:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF760
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF760:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0x1c]
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022FF9F0 ; =ov11_023224BC
	add r0, sp, #0x10
	mov r3, r2
	mov r5, #0
	bl sprintf
	add r0, sp, #0x10
	bl sub_02008BA8
	cmp r0, #0
	ldrle r0, _022FF9E0 ; =ov11_02324D14
	movle r1, r5
	ldrle r0, [r0, #4]
	strle r1, [r0, #4]
	ble _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	add r1, sp, #0x10
	ldr r0, [r0, #4]
	mov r2, #8
	add r0, r0, #8
	bl LoadFileFromRomVeneer
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	ldrh r1, [r1]
	str r1, [r2, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bgt _022FF800
	add r0, r1, #8
	bl UnloadFile
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mov r1, r5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF800:
	add r0, r1, #0x14
	bl ov11_022E4630
	cmp r0, #0
	bne _022FF86C
	ldr r8, _022FF9E0 ; =ov11_02324D14
	mov r7, r5
	ldr r0, [r8, #4]
	add r4, sp, #8
	ldr r6, [r0, #8]
	b _022FF85C
_022FF828:
	mov r0, r7, lsl #3
	add r1, r0, #2
	mov r0, r4
	add r1, r6, r1
	bl ov11_022E4600
	ldr r1, [r8, #4]
	mov r0, r4
	add r1, r1, #0x14
	bl ov11_022E465C
	cmp r0, #0
	movne r5, r7
	bne _022FF86C
	add r7, r7, #1
_022FF85C:
	ldr r0, [r8, #4]
	ldr r0, [r0, #0x10]
	cmp r7, r0
	blt _022FF828
_022FF86C:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	str r5, [sp, #0x90]
	ldr r1, [r0, #4]
	ldr r0, _022FF9E8 ; =ov11_023224AC
	ldr r1, [r1, #0x10]
	ldr r3, _022FF9F4 ; =ov11_022FFA14
	str r1, [sp]
	mov r4, #0xa
	add r2, sp, #0x90
	mov r1, #0x33
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _022FF9E0 ; =ov11_02324D14
	mov r2, #3
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _022FF9D4
_022FF8B8:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	ldrlt r0, _022FF9E0 ; =ov11_02324D14
	movlt r1, #0
	ldrlt r0, [r0, #4]
	strlt r1, [r0, #4]
	blt _022FF93C
	ldr r1, _022FF9E0 ; =ov11_02324D14
	mov r0, r0, lsl #3
	ldr r3, [r1, #4]
	add r1, r0, #2
	ldr r2, [r3, #8]
	add r0, r3, #0x14
	add r1, r2, r1
	bl ov11_022E4600
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r2, _022FF9F8 ; =ov11_0238A078
	ldr r4, [r0, #4]
	mov r1, #8
	add r3, r4, #0x14
_022FF924:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF924
	mov r0, #4
	str r0, [r4, #4]
_022FF93C:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl UnloadFile
	b _022FF9D4
_022FF950:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF98C
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _022FF9E0 ; =ov11_02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF98C:
	ldr r0, _022FF9E0 ; =ov11_02324D14
	ldr r2, _022FF9F8 ; =ov11_0238A078
	ldr r5, [r0, #4]
	mov r1, #8
	ldrsh r4, [r5, #0x1c]
	add r3, r5, #0x14
	strh r4, [r0, #2]
_022FF9A8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF9A8
	mov r0, #5
	str r0, [r5, #4]
	b _022FF9D4
_022FF9C4:
	mov r0, #6
	str r0, [r1, #4]
	mov r0, #4
	b _022FF9D8
_022FF9D4:
	mov r0, #1
_022FF9D8:
	add sp, sp, #0x128
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FF9E0: .word ov11_02324D14
#if defined(EUROPE)
_022FF9E4: .word 0x000001CB
#elif !defined(JAPAN)
_022FF9E4: .word 0x000001AF
#endif
_022FF9E8: .word ov11_023224AC
_022FF9EC: .word ov11_022FF9FC
_022FF9F0: .word ov11_023224BC
_022FF9F4: .word ov11_022FFA14
_022FF9F8: .word ov11_0238A078
	arm_func_end ov11_022FF5D0

	arm_func_start ov11_022FF9FC
ov11_022FF9FC: ; 0x022FF9FC
	ldr r2, _022FFA10 ; =EVENTS
	mov r0, #0xc
	mla r0, r1, r0, r2
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022FFA10: .word EVENTS
	arm_func_end ov11_022FF9FC

	arm_func_start ov11_022FFA14
ov11_022FFA14: ; 0x022FFA14
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _022FFA58 ; =ov11_02324D14
	mov r1, r1, lsl #3
	ldr r2, [r2, #4]
	mov r4, r0
	ldr r2, [r2, #8]
	add r1, r1, #2
	add r0, sp, #0
	add r1, r2, r1
	bl ov11_022E4600
	add r0, sp, #0
	mov r1, r4
	bl ov11_022E466C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FFA58: .word ov11_02324D14
	arm_func_end ov11_022FFA14

	arm_func_start ov11_022FFA5C
ov11_022FFA5C: ; 0x022FFA5C
	ldr r2, _022FFAA0 ; =ov11_02324D14
	ldr r3, _022FFAA4 ; =ov11_0238A078
	ldrsh ip, [r2, #2]
	mov r2, #8
	strh ip, [r0]
_022FFA70:
	ldrb r0, [r3], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022FFA70
#ifdef JAPAN
	ldr r0, _022FFAA0 ; =ov11_02324D14
	ldrsh r0, [r0, #2]
	cmp r0, #0x1b4
#else
	ldr r1, _022FFAA0 ; =ov11_02324D14
	ldr r0, _022FFAA8 ; =0x000001AF
	ldrsh r1, [r1, #2]
	cmp r1, r0
#endif
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022FFAA0: .word ov11_02324D14
_022FFAA4: .word ov11_0238A078
#if defined(EUROPE)
_022FFAA8: .word 0x000001CB
#elif !defined(JAPAN)
_022FFAA8: .word 0x000001AF
#endif
	arm_func_end ov11_022FFA5C

	arm_func_start ov11_022FFAAC
ov11_022FFAAC: ; 0x022FFAAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022FFAE4 ; =ov11_023224FC
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FFAE8 ; =ov11_0238A080
	ldr r0, _022FFAEC ; =ov11_02324D1C
	str r5, [r1]
	strh r4, [r0, #2]
	mov r1, #0xd5
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FFAE4: .word ov11_023224FC
_022FFAE8: .word ov11_0238A080
_022FFAEC: .word ov11_02324D1C
	arm_func_end ov11_022FFAAC

	arm_func_start ov11_022FFAF0
ov11_022FFAF0: ; 0x022FFAF0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _022FFE60 ; =0x00000518
	mov r1, #8
	mov r4, #0
	bl MemAlloc
	ldr r1, _022FFE64 ; =ov11_0238A080
	ldr r2, _022FFE68 ; =ov11_02324D1C
	ldr r1, [r1]
	str r0, [r2, #4]
	str r1, [r0, #8]
	ldr r1, [r2, #4]
	ldr r0, [r1, #8]
	cmp r0, #0
	cmpne r0, #4
	moveq r0, #1
	streqb r0, [r1, #0xc]
	beq _022FFB48
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r1, #0xc]
	movne r0, r4
	strneb r0, [r1, #0xc]
_022FFB48:
	ldr r5, _022FFE68 ; =ov11_02324D1C
	ldr r0, [r5, #4]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _022FFBA8
	mov r6, #0
_022FFB60:
	add r0, r6, #0xb4
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #0
	beq _022FFB98
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #1
	strh r7, [r1, #0x18]
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFB98:
	add r6, r6, #1
	cmp r6, #0xb
	blt _022FFB60
	b _022FFE08
_022FFBA8:
	cmp r0, #3
	bne _022FFBFC
	mov r6, #0
_022FFBB4:
	add r0, r6, #0xbf
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #0
	beq _022FFBEC
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #1
	strh r7, [r1, #0x18]
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFBEC:
	add r6, r6, #1
	cmp r6, #0xa
	blt _022FFBB4
	b _022FFE08
_022FFBFC:
	cmp r0, #4
	bne _022FFCB4
	mov r6, #0
_022FFC08:
	mov r0, r6, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x6f
	blt _022FFC20
	cmp r7, #0xa4
	ble _022FFCA4
_022FFC20:
	mov r0, r7
	bl GetDungeonMode
	mov r8, r0
	mov r0, r7
	bl DungeonSwapIdxToId
	bl GetMaxReachedFloor
	cmp r0, #0
	ble _022FFCA4
	cmp r7, #0x26
	cmpne r7, #0x29
	bne _022FFC78
	sub r0, r8, #2
	cmp r0, #1
	bhi _022FFCA4
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #1
	strh r7, [r0, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str r8, [r0, #0x1c4]
	add r4, r4, #1
	b _022FFCA4
_022FFC78:
	cmp r7, #0x36
	beq _022FFCA4
	cmp r8, #3
	bne _022FFCA4
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #1
	strh r7, [r0, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str r8, [r0, #0x1c4]
	add r4, r4, #1
_022FFCA4:
	add r6, r6, #1
	cmp r6, #0xae
	ble _022FFC08
	b _022FFE08
_022FFCB4:
	cmp r0, #1
	mov r5, #0
	bne _022FFD08
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022FFD08
_022FFCD0: ; jump table
	b _022FFCE4 ; case 0
	b _022FFCEC ; case 1
	b _022FFCF4 ; case 2
	b _022FFCFC ; case 3
	b _022FFD04 ; case 4
_022FFCE4:
	ldr r5, _022FFE6C ; =ov11_023224D0
	b _022FFD08
_022FFCEC:
	ldr r5, _022FFE70 ; =ov11_023224DC
	b _022FFD08
_022FFCF4:
	ldr r5, _022FFE74 ; =ov11_023224EA
	b _022FFD08
_022FFCFC:
	ldr r5, _022FFE78 ; =ov11_0232251C
	b _022FFD08
_022FFD04:
	ldr r5, _022FFE7C ; =ov11_02322548
_022FFD08:
	cmp r5, #0
	beq _022FFD60
	ldr r7, _022FFE68 ; =ov11_02324D1C
	mvn r6, #0
	b _022FFD50
_022FFD1C:
	ldrsh r8, [r5], #2
	mov r0, r8
	bl GetDungeonMode
	cmp r0, #1
	cmpne r0, #3
	bne _022FFD50
	ldr r1, [r7, #4]
	add r1, r1, r4, lsl #1
	strh r8, [r1, #0x18]
	ldr r1, [r7, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFD50:
	ldrsh r0, [r5]
	cmp r0, r6
	bne _022FFD1C
	b _022FFE08
_022FFD60:
	mov r7, #0xd4
	ldr r5, _022FFE68 ; =ov11_02324D1C
	mov r8, #0
	mov r6, r7
_022FFD70:
	ldr r1, [r5, #4]
	mov r0, r8, lsl #0x10
	ldr r1, [r1, #8]
	mov sb, r0, asr #0x10
	cmp r1, #0
	bne _022FFDA0
	cmp sb, #0xb0
	beq _022FFDFC
	cmp sb, #0x7b
	blt _022FFDA0
	cmp sb, #0xa4
	ble _022FFDFC
_022FFDA0:
	mov r0, sb
	bl GetDungeonMode
	mov sl, r0
	cmp sl, #1
	cmpne sl, #3
	bne _022FFDFC
	ldr r0, [r5, #4]
	cmp sb, #6
	add r0, r0, r4, lsl #1
	strh sb, [r0, #0x18]
	bne _022FFDEC
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #1
	cmpne r0, #3
	ldreq r1, [r5, #4]
	moveq sl, r0
	addeq r0, r1, r4, lsl #1
	streqh r6, [r0, #0x18]
_022FFDEC:
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str sl, [r0, #0x1c4]
	add r4, r4, #1
_022FFDFC:
	add r8, r8, #1
	cmp r8, #0xb4
	blt _022FFD70
_022FFE08:
	ldr r0, _022FFE68 ; =ov11_02324D1C
	mvn r2, #1
	ldr r1, [r0, #4]
	cmp r4, #0
	strb r2, [r1]
	ldr r1, [r0, #4]
	strb r2, [r1, #1]
	ldr r1, [r0, #4]
	strb r2, [r1, #2]
	ldr r1, [r0, #4]
	str r4, [r1, #0x14]
	addeq r1, r2, #1
	streqh r1, [r0]
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	mov r1, #0xd5
	strh r1, [r0]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FFE60: .word 0x00000518
_022FFE64: .word ov11_0238A080
_022FFE68: .word ov11_02324D1C
_022FFE6C: .word ov11_023224D0
_022FFE70: .word ov11_023224DC
_022FFE74: .word ov11_023224EA
_022FFE78: .word ov11_0232251C
_022FFE7C: .word ov11_02322548
	arm_func_end ov11_022FFAF0

	arm_func_start ov11_022FFE80
ov11_022FFE80: ; 0x022FFE80
	stmdb sp!, {r3, lr}
	ldr r0, _022FFEFC ; =ov11_02324D1C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _022FFEA8
	bl CloseAdvancedMenu
_022FFEA8:
	ldr r0, _022FFEFC ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _022FFEC4
	bl CloseDialogueBox
_022FFEC4:
	ldr r0, _022FFEFC ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _022FFEE0
	bl CloseParentMenu
_022FFEE0:
	ldr r0, _022FFEFC ; =ov11_02324D1C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FFEFC ; =ov11_02324D1C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FFEFC: .word ov11_02324D1C
	arm_func_end ov11_022FFE80

	arm_func_start ov11_022FFF00
ov11_022FFF00: ; 0x022FFF00
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xf0
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r2, [r0, #4]
	ldr r0, [r2, #4]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02300570
_022FFF20: ; jump table
	b _022FFF4C ; case 0
	b _022FFF90 ; case 1
	b _02300024 ; case 2
	b _02300040 ; case 3
	b _0230018C ; case 4
	b _02300218 ; case 5
	b _02300300 ; case 6
	b _02300570 ; case 7
	b _023003E4 ; case 8
	b _02300458 ; case 9
	b _02300560 ; case 10
_022FFF4C:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _022FFF84
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	mov r0, #2
	bl WorldMapSetMode
	bl ov11_0230E964
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_022FFF84:
	mov r0, #3
	str r0, [r2, #4]
	b _02300570
_022FFF90:
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #0
	ldr lr, [r0, #4]
	mov r2, r1
	ldrsh r3, [r0, #2]
	ldr ip, [lr, #0x14]
	b _022FFFD0
_022FFFB8:
	add r0, lr, r2, lsl #1
	ldrsh r0, [r0, #0x18]
	cmp r3, r0
	moveq r1, r2
	beq _022FFFD8
	add r2, r2, #1
_022FFFD0:
	cmp r2, ip
	blt _022FFFB8
_022FFFD8:
	add r0, lr, r1, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r2, [r1, #4]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl WorldMapSetCamera
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300024:
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02300040:
	ldr r2, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr ip, [r2, #4]
	ldrsb r0, [ip, #1]
	cmp r0, r1
	ldreqsb r3, [ip, #2]
	cmpeq r3, r1
	beq _023000F8
	mvn r1, #1
	cmp r0, r1
	beq _02300078
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02300570
_02300078:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0230009C
	bl IsParentMenuActive
	cmp r0, #0
	bne _02300570
_0230009C:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023000C8
	bl CloseDialogueBox
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_023000C8:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02300570
	bl CloseParentMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	b _02300570
_023000F8:
	ldrsb r0, [ip]
	cmp r0, r1
	bne _02300178
	mov r1, #0
	str r1, [sp, #0x58]
	ldrsh r2, [r2, #2]
	ldr r3, [ip, #0x14]
	b _02300130
_02300118:
	add r0, ip, r1, lsl #1
	ldrsh r0, [r0, #0x18]
	cmp r2, r0
	streq r1, [sp, #0x58]
	beq _02300138
	add r1, r1, #1
_02300130:
	cmp r1, r3
	blt _02300118
_02300138:
	ldr r1, _02300580 ; =0x0000022E
	mov r0, #0x10
	strh r1, [sp, #0x60]
	str r0, [sp, #0x64]
	ldr ip, [ip, #0x14]
	ldr r0, _02300584 ; =ov11_0232250C
	str ip, [sp]
	mov ip, #8
	ldr r1, _02300588 ; =0x00801833
	ldr r3, _0230058C ; =ov11_023005A0
	add r2, sp, #0x58
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	strb r0, [r1]
_02300178:
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_0230018C:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _023001F4
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r2, [r1, #4]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl WorldMapSetCamera
_023001F4:
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300218:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _0230027C
	ldrsb r0, [r2]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r3, [r1, #4]
	ldrsh r2, [r3, #0xe]
	cmp r2, r0
	beq _0230027C
	strh r0, [r3, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #0xc
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F138
_0230027C:
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	bge _023002E4
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _023002C4
	bl ov11_0230CFF4
_023002C4:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r3, #0
	ldr r2, [r0, #4]
	mov r1, #9
	str r3, [r2, #0x10]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_023002E4:
	ldr r1, _0230057C ; =ov11_02324D1C
	mov r2, #6
	ldr r3, [r1, #4]
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _02300570
_02300300:
	ldrsb r0, [r2]
	mvn r1, #1
	cmp r0, r1
	beq _02300340
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
	b _02300570
_02300340:
	ldrsb r0, [r2, #1]
	cmp r0, r1
	bne _02300398
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r2, [r1, #4]
	strb r0, [r2, #1]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0x10]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	strh r0, [r1, #2]
	bl DungeonSwapIdxToId
#ifdef JAPAN
	ldr r2, _0230057C ; =ov11_02324D1C
	ldr r1, _02300590 ; =0x00000408
	ldr r2, [r2, #4]
	str r0, [sp, #0x18]
	ldrsb r0, [r2, #1]
	add r3, sp, #8
	add r2, r1, #0x2e
#else
	ldr r1, _0230057C ; =ov11_02324D1C
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	ldr r1, _02300590 ; =0x00000408
	ldrsb r0, [r0, #1]
	ldr r2, _02300594 ; =0x0000022F
	add r3, sp, #8
#endif
	bl ShowStringIdInDialogueBox
_02300398:
	ldr r1, _0230057C ; =ov11_02324D1C
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #2]
	cmp r1, r0
	bne _023003D0
	mov r0, #0
	ldr r1, _02300598 ; =0x00400013
	ldr r3, _0230059C ; =ov11_02322530
	mov r2, r0
	bl CreateParentMenuFromStringIds
	ldr r1, _0230057C ; =ov11_02324D1C
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
_023003D0:
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_023003E4:
	ldrsb r0, [r2, #2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl sub_0202ABB0
	cmp r0, #2
	bne _02300430
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _0230057C ; =ov11_02324D1C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300430:
	cmp r0, #1
	ldreq r0, _0230057C ; =ov11_02324D1C
	moveq r1, #3
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	ldrne r0, _0230057C ; =ov11_02324D1C
	movne r1, #9
	ldrne r0, [r0, #4]
	strne r1, [r0, #4]
	b _02300570
_02300458:
	ldrsb r0, [r2]
	mvn r1, #1
	cmp r0, r1
	beq _02300494
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_02300494:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023004B8
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02300570
_023004B8:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _023004DC
	bl IsParentMenuActive
	cmp r0, #0
	bne _02300570
_023004DC:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02300508
	bl CloseDialogueBox
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_02300508:
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02300534
	bl CloseParentMenu
	ldr r0, _0230057C ; =ov11_02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
_02300534:
	ldr r0, _0230057C ; =ov11_02324D1C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	mvnlt r1, #0
	addge r1, r2, r1, lsl #1
	ldrgesh r1, [r1, #0x18]
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r2, #4]
	b _02300570
_02300560:
	mov r0, #0xb
	str r0, [r2, #4]
	mov r0, #4
	b _02300574
_02300570:
	mov r0, #1
_02300574:
	add sp, sp, #0xf0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230057C: .word ov11_02324D1C
#ifdef JAPAN
_02300580: .word 0x00000435
#else
_02300580: .word 0x0000022E
#endif
_02300584: .word ov11_0232250C
_02300588: .word 0x00801833
_0230058C: .word ov11_023005A0
_02300590: .word 0x00000408
#ifndef JAPAN
_02300594: .word 0x0000022F
#endif
_02300598: .word 0x00400013
_0230059C: .word ov11_02322530
	arm_func_end ov11_022FFF00

	arm_func_start ov11_023005A0
ov11_023005A0: ; 0x023005A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r2, _02300660 ; =ov11_02324D1C
	mov r8, r0
	ldr r2, [r2, #4]
	add r0, r2, r1, lsl #1
	ldrsh r4, [r0, #0x18]
	add r0, r2, r1, lsl #2
	ldr r5, [r0, #0x1c4]
	mov r0, r4
	bl DungeonSwapIdxToId
	ldr r1, _02300660 ; =ov11_02324D1C
	mov r6, r0
	ldr r1, [r1, #4]
	ldr r7, _02300664 ; =ov11_0232256C
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _0230060C
	cmp r5, #1
	ldreq r7, _02300668 ; =ov11_02322574
	beq _02300630
	cmp r5, #3
	bne _02300630
	bl AnyDungeonRequestsDone
	cmp r0, #0
	ldrne r7, _0230066C ; =ov11_02322580
	b _02300630
_0230060C:
	sub r0, r1, #2
	cmp r0, #1
	bhi _02300630
	cmp r4, #0xbe
	beq _02300630
	mov r0, r4
	bl sub_0204CF0C
	cmp r0, #0
	ldrne r7, _02300670 ; =ov11_0232258C
_02300630:
	ldr r2, _02300674 ; =ov11_02322598
	ldr r3, _02300678 ; =0x0000C402
	add r4, sp, #4
	mov r0, r8
	str r6, [sp, #0x14]
	str r7, [sp, #0x3c]
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r0, r8
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02300660: .word ov11_02324D1C
_02300664: .word ov11_0232256C
_02300668: .word ov11_02322574
_0230066C: .word ov11_02322580
_02300670: .word ov11_0232258C
_02300674: .word ov11_02322598
_02300678: .word 0x0000C402
	arm_func_end ov11_023005A0

	arm_func_start ov11_0230067C
ov11_0230067C: ; 0x0230067C
	ldr r1, _023006A0 ; =ov11_02324D1C
	ldrsh r2, [r1]
	strh r2, [r0]
	ldrsh r0, [r1]
	cmp r0, #0xd5
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023006A0: .word ov11_02324D1C
	arm_func_end ov11_0230067C

	arm_func_start ov11_023006A4
ov11_023006A4: ; 0x023006A4
	stmdb sp!, {r3, lr}
	ldr r0, _023006D8 ; =ov11_02324D24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x460
	mov r1, #8
	bl MemAlloc
	ldr r1, _023006D8 ; =ov11_02324D24
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023006D8: .word ov11_02324D24
	arm_func_end ov11_023006A4

	arm_func_start ov11_023006DC
ov11_023006DC: ; 0x023006DC
	stmdb sp!, {r3, lr}
	ldr r0, _02300720 ; =ov11_02324D24
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _02300724 ; =ov11_023225BC
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300720: .word ov11_02324D24
_02300724: .word ov11_023225BC
	arm_func_end ov11_023006DC

	arm_func_start ov11_02300728
ov11_02300728: ; 0x02300728
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov11_023006A4
	ldr r0, _023007A4 ; =ov11_02324D24
	mov r1, r7
	ldr r0, [r0, #4]
	add r0, r0, #0x58
	bl strcpy
	ldr r0, _023007A4 ; =ov11_02324D24
	mov r1, r6
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl sub_020236FC
	ldr r1, _023007A4 ; =ov11_02324D24
	ldr r0, _023007A8 ; =ov11_023225BC
	ldr r3, [r1, #4]
	mov r2, #2
	str r5, [r3, #0x458]
	ldr r3, [r1, #4]
	str r4, [r3, #0x45c]
	ldr r1, [r1, #4]
	str r2, [r1]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _023007A8 ; =ov11_023225BC
	bl sub_020348E4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023007A4: .word ov11_02324D24
_023007A8: .word ov11_023225BC
	arm_func_end ov11_02300728

	arm_func_start ov11_023007AC
ov11_023007AC: ; 0x023007AC
	stmdb sp!, {r3, lr}
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r1, _023007E8 ; =ov11_02324D24
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r0, _023007EC ; =ov11_023225CC
	bl CreateDialogueBox
	ldr r1, _023007E8 ; =ov11_02324D24
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023007E8: .word ov11_02324D24
_023007EC: .word ov11_023225CC
	arm_func_end ov11_023007AC

	arm_func_start ov11_023007F0
ov11_023007F0: ; 0x023007F0
	stmdb sp!, {r3, lr}
	ldr r0, _02300848 ; =ov11_02324D24
	ldr r0, [r0]
	cmp r0, #0
	beq _02300824
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02300848 ; =ov11_02324D24
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300848 ; =ov11_02324D24
	mov r1, #0
	str r1, [r0]
_02300824:
	ldr r0, _02300848 ; =ov11_02324D24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02300848 ; =ov11_02324D24
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300848: .word ov11_02324D24
	arm_func_end ov11_023007F0

	arm_func_start ov11_0230084C
ov11_0230084C: ; 0x0230084C
	stmdb sp!, {r3, lr}
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02300A18
_02300868: ; jump table
	b _02300880 ; case 0
	b _023008A4 ; case 1
	b _02300964 ; case 2
	b _02300990 ; case 3
	b _023009C4 ; case 4
	b _023009F4 ; case 5
_02300880:
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _02300A18
	mov r1, #1
	mov r0, #0
	str r1, [r3, #4]
	bl ov11_022E9BD0
	b _02300A18
_023008A4:
	ldr r2, [r0, #4]
	ldr r1, _02300A24 ; =0x00000408
	ldr r0, [r2, #0x45c]
	cmp r0, #0
	ldr r0, [r2]
	movge r1, #0x20
	cmp r0, #1
	beq _023008D0
	cmp r0, #2
	beq _023008EC
	b _02300904
_023008D0:
	ldr r2, _02300A20 ; =ov11_02324D24
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	add r3, r3, #8
	bl ShowStringIdInDialogueBox
	b _02300904
_023008EC:
	ldr r2, _02300A20 ; =ov11_02324D24
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	add r2, r3, #0x58
	add r3, r3, #8
	bl ShowStringInDialogueBox
_02300904:
	ldr r0, _02300A20 ; =ov11_02324D24
	ldmia r0, {r1, r2}
	ldr r2, [r2, #0x458]
	str r2, [r1, #8]
	ldmia r0, {r1, r2}
	ldr r2, [r2, #0x45c]
	str r2, [r1, #0xc]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x45c]
	cmp r1, #0
	blt _02300940
	ldr r0, [r0]
	mov r2, r1
	ldrsb r0, [r0]
	bl sub_0202F190
_02300940:
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_022E9B84
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_02300964:
	bl ov11_022E9F48
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r2, #3
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F3F8
	b _02300A18
_02300990:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_022E9BD0
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_023009C4:
	bl ov11_022E9F48
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =ov11_02324D24
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02300A20 ; =ov11_02324D24
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_023009F4:
	ldrsb r0, [r3]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	bne _02300A18
	mov r0, #0
	bl ov11_022E9B84
	mov r0, #4
	ldmia sp!, {r3, pc}
_02300A18:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300A20: .word ov11_02324D24
_02300A24: .word 0x00000408
	arm_func_end ov11_0230084C

	arm_func_start ov11_02300A28
ov11_02300A28: ; 0x02300A28
	stmdb sp!, {r3, lr}
	ldr r0, _02300A5C ; =ov11_02324D2C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x460
	mov r1, #8
	bl MemAlloc
	ldr r1, _02300A5C ; =ov11_02324D2C
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300A5C: .word ov11_02324D2C
	arm_func_end ov11_02300A28

	arm_func_start ov11_02300A60
ov11_02300A60: ; 0x02300A60
	stmdb sp!, {r3, lr}
	ldr r0, _02300AC4 ; =ov11_02324D2C
	ldr r1, [r0]
	ldr r0, [r0, #4]
	cmp r1, #0
	beq _02300A8C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	ldmia sp!, {r3, pc}
_02300A8C:
	cmp r0, #0
	beq _02300AA8
	ldr r0, [r0]
	cmp r0, #0
	beq _02300ABC
	mov r0, #1
	ldmia sp!, {r3, pc}
_02300AA8:
	ldr r0, _02300AC8 ; =ov11_023225DC
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02300ABC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300AC4: .word ov11_02324D2C
_02300AC8: .word ov11_023225DC
	arm_func_end ov11_02300A60

	arm_func_start ov11_02300ACC
ov11_02300ACC: ; 0x02300ACC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov11_02300A28
	ldr r0, _02300B48 ; =ov11_02324D2C
	mov r1, r7
	ldr r0, [r0, #4]
	add r0, r0, #0x58
	bl strcpy
	ldr r0, _02300B48 ; =ov11_02324D2C
	mov r1, r6
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl sub_020236FC
	ldr r1, _02300B48 ; =ov11_02324D2C
	ldr r0, _02300B4C ; =ov11_023225DC
	ldr r3, [r1, #4]
	mov r2, #2
	str r5, [r3, #0x458]
	ldr r3, [r1, #4]
	str r4, [r3, #0x45c]
	ldr r1, [r1, #4]
	str r2, [r1]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02300B4C ; =ov11_023225DC
	bl sub_020348E4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02300B48: .word ov11_02324D2C
_02300B4C: .word ov11_023225DC
	arm_func_end ov11_02300ACC

	arm_func_start ov11_02300B50
ov11_02300B50: ; 0x02300B50
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _02300B94 ; =ov11_02324D2C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, _02300B98 ; =ov11_023225EC
	strb r2, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _02300B94 ; =ov11_02324D2C
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300B94: .word ov11_02324D2C
_02300B98: .word ov11_023225EC
	arm_func_end ov11_02300B50

	arm_func_start ov11_02300B9C
ov11_02300B9C: ; 0x02300B9C
	stmdb sp!, {r3, lr}
	ldr r0, _02300BF4 ; =ov11_02324D2C
	ldr r0, [r0]
	cmp r0, #0
	beq _02300BD0
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02300BF4 ; =ov11_02324D2C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300BF4 ; =ov11_02324D2C
	mov r1, #0
	str r1, [r0]
_02300BD0:
	ldr r0, _02300BF4 ; =ov11_02324D2C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02300BF4 ; =ov11_02324D2C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300BF4: .word ov11_02324D2C
	arm_func_end ov11_02300B9C

	arm_func_start ov11_02300BF8
ov11_02300BF8: ; 0x02300BF8
	stmdb sp!, {r3, lr}
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #0
	beq _02300C24
	cmp r1, #1
	beq _02300CC8
	cmp r1, #2
	beq _02300D38
	b _02300D50
_02300C24:
	ldr r0, [r0, #4]
	ldr r2, [r0]
	cmp r2, #0
	beq _02300D50
	ldr r0, [r0, #0x458]
	mov r1, #0x218
	cmp r0, #0
	movge r1, #0x20
	cmp r2, #1
	beq _02300C58
	cmp r2, #2
	beq _02300C74
	b _02300C8C
_02300C58:
	ldr r2, _02300D58 ; =ov11_02324D2C
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	add r3, r3, #8
	bl ShowStringIdInDialogueBox
	b _02300C8C
_02300C74:
	ldr r2, _02300D58 ; =ov11_02324D2C
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	add r2, r3, #0x58
	add r3, r3, #8
	bl ShowStringInDialogueBox
_02300C8C:
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x458]
	cmp r1, #0
	blt _02300CB0
	ldr r0, [r0]
	ldr r2, [r2, #0x45c]
	ldrsb r0, [r0]
	bl sub_0202F190
_02300CB0:
	ldr r0, _02300D58 ; =ov11_02324D2C
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #8]
	ldr r0, [r0]
	str r2, [r0, #4]
_02300CC8:
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsDialogueBoxActive
	ldr r1, _02300D58 ; =ov11_02324D2C
	cmp r0, #0
	ldr r2, [r1]
	strb r0, [r2, #8]
	bne _02300D50
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl sub_0202F16C
	cmp r0, #0x10
	cmpne r0, #0
	bne _02300D24
	ldr r0, _02300D58 ; =ov11_02324D2C
	mov r3, #2
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
	b _02300D50
_02300D24:
	ldr r0, _02300D58 ; =ov11_02324D2C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F2C4
	b _02300D50
_02300D38:
	ldrsb r0, [r3]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
_02300D50:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300D58: .word ov11_02324D2C
	arm_func_end ov11_02300BF8

	arm_func_start ov11_02300D5C
ov11_02300D5C: ; 0x02300D5C
	stmdb sp!, {r3, lr}
	ldr r0, _02300D80 ; =ov11_0232260C
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _02300D84 ; =ov11_02324D34
	movne r1, #0
	strne r1, [r0, #8]
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300D80: .word ov11_0232260C
_02300D84: .word ov11_02324D34
	arm_func_end ov11_02300D5C

	arm_func_start CreateTopGroundMenu
CreateTopGroundMenu: ; 0x02300D88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x98
	bl GetGameMode
	mov r4, r0
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	add r2, r4, #0xff
	ldr r1, _02300ED8 ; =ov11_02324D34
	and r2, r2, #0xff
	cmp r2, #1
	str r0, [r1]
	ldrls r8, _02300EDC ; =ov11_02322684
	bls _02300DCC
	cmp r4, #3
	ldreq r8, _02300EE0 ; =ov11_02322654
	ldrne r8, _02300EE4 ; =ov11_0232262C
_02300DCC:
	ldr r0, _02300ED8 ; =ov11_02324D34
	mov fp, #1
	ldr r0, [r0]
	mov sb, r8
	add sl, r0, #8
	add r0, r4, #0xff
	mov r4, #0
	str sl, [sp, #0x60]
	and r6, r0, #0xff
	mov r5, r4
	mov r7, fp
	b _02300E5C
_02300DFC:
	ldr r0, [sb, #4]
	cmp r0, #2
	beq _02300E1C
	cmp r0, #3
	beq _02300E24
	cmp r0, #4
	beq _02300E2C
	b _02300E44
_02300E1C:
	bl IsBagNotEmpty
	b _02300E48
_02300E24:
	mov r0, r7
	b _02300E48
_02300E2C:
	cmp r6, #1
	movhi r0, r4
	bhi _02300E48
	mov r0, r5
	bl ov11_0230488C
	b _02300E48
_02300E44:
	mov r0, fp
_02300E48:
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	strb r0, [sl], #1
	add sb, sb, #8
_02300E5C:
	ldrh r0, [sb]
	cmp r0, #0
	bne _02300DFC
	ldr r0, _02300EE8 ; =ov11_023225FC
	ldr r1, _02300EEC ; =0x00400213
	add r2, sp, #0
	mov r3, r8
	bl CreateParentMenuFromStringIds
	ldr r2, _02300ED8 ; =ov11_02324D34
	mov r1, #0x13
	ldr r3, [r2]
	mov r2, #0
	strb r0, [r3]
	ldr r0, _02300EF0 ; =ov11_0232261C
	mov r3, #0x10000
	bl CreateAreaNameBox
	ldr r1, _02300ED8 ; =ov11_02324D34
	ldr r1, [r1]
	strb r0, [r1, #1]
	bl CreateTeamInfoBox
	ldr r1, _02300ED8 ; =ov11_02324D34
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2, #2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #8]
	str r3, [r1, #4]
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02300ED8: .word ov11_02324D34
_02300EDC: .word ov11_02322684
_02300EE0: .word ov11_02322654
_02300EE4: .word ov11_0232262C
_02300EE8: .word ov11_023225FC
_02300EEC: .word 0x00400213
_02300EF0: .word ov11_0232261C
	arm_func_end CreateTopGroundMenu

	arm_func_start CloseTopGroundMenu
CloseTopGroundMenu: ; 0x02300EF4
	stmdb sp!, {r3, lr}
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseAreaNameBox
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseTeamInfoBox
	ldr r0, _02300F4C ; =ov11_02324D34
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300F4C ; =ov11_02324D34
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300F4C: .word ov11_02324D34
	arm_func_end CloseTopGroundMenu

	arm_func_start UpdateTopGroundMenu
UpdateTopGroundMenu: ; 0x02300F50
	stmdb sp!, {r3, lr}
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02301130
_02300F6C: ; jump table
	b _02300F80 ; case 0
	b _02300FA4 ; case 1
	b _0230100C ; case 2
	b _02301060 ; case 3
	b _023010B0 ; case 4
_02300F80:
	bl ov11_0230D220
	cmp r0, #0
	bne _02301130
	bl ov11_0230D000
	ldr r0, _02301138 ; =ov11_02324D34
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_02300FA4:
	ldrsb r0, [r2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _02301138 ; =ov11_02324D34
	cmp r0, #1
	str r0, [r1, #8]
	ldr r0, [r1]
	movne r1, #2
	strne r1, [r0, #4]
	bne _02301130
	ldrsb r0, [r0, #1]
	bl SetAreaNameBoxState3
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF24
	ldr r0, _02301138 ; =ov11_02324D34
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_0230100C:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl SetParentMenuState7
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl SetAreaNameBoxState3
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF24
	ldr r0, _02301138 ; =ov11_02324D34
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_02301060:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsAreaNameBoxActive
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =ov11_02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl IsTeamInfoBoxActive
	cmp r0, #0
	ldreq r0, _02301138 ; =ov11_02324D34
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02301130
_023010B0:
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0, #8]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230111C
_023010C8: ; jump table
	b _0230111C ; case 0
	b _0230111C ; case 1
	b _023010E8 ; case 2
	b _023010F4 ; case 3
	b _02301100 ; case 4
	b _02301110 ; case 5
	b _0230111C ; case 6
	b _0230111C ; case 7
_023010E8:
	bl ov11_02304AE0
	mov r0, #4
	ldmia sp!, {r3, pc}
_023010F4:
	bl ov11_02304BC4
	mov r0, #4
	ldmia sp!, {r3, pc}
_02301100:
	mov r0, #0
	bl ov11_023048AC
	mov r0, #4
	ldmia sp!, {r3, pc}
_02301110:
	bl ov11_02301174
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230111C:
	ldr r1, _02301138 ; =ov11_02324D34
	mov r0, #4
	ldr r2, [r1, #8]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
_02301130:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301138: .word ov11_02324D34
	arm_func_end UpdateTopGroundMenu

	arm_func_start ov11_0230113C
ov11_0230113C: ; 0x0230113C
	ldr r1, _02301148 ; =ov11_02324D34
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_02301148: .word ov11_02324D34
	arm_func_end ov11_0230113C

	arm_func_start ov11_0230114C
ov11_0230114C: ; 0x0230114C
	ldr r1, _02301170 ; =ov11_02324D34
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02301170: .word ov11_02324D34
	arm_func_end ov11_0230114C

	arm_func_start ov11_02301174
ov11_02301174: ; 0x02301174
	stmdb sp!, {r3, lr}
	ldr r0, _02301194 ; =ov11_023226C4
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _02301198 ; =ov11_02324D40
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301194: .word ov11_023226C4
_02301198: .word ov11_02324D40
	arm_func_end ov11_02301174

	arm_func_start ov11_0230119C
ov11_0230119C: ; 0x0230119C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _0230120C ; =ov11_02324D40
	ldr r4, _02301210 ; =0x00000227
	str r0, [r1, #4]
	mov lr, #0x10
	mov ip, #0
	ldr r0, _02301214 ; =ov11_023226B4
	ldr r1, _02301218 ; =0x00001813
	ldr r3, _0230121C ; =ov11_023226D4
	add r2, sp, #0
	strh r4, [sp, #8]
	str lr, [sp, #0xc]
	str ip, [sp]
	bl CreateParentMenuFromStringIds
	ldr r1, _0230120C ; =ov11_02324D40
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230120C: .word ov11_02324D40
#ifdef JAPAN
_02301210: .word 0x0000042E
#else
_02301210: .word 0x00000227
#endif
_02301214: .word ov11_023226B4
_02301218: .word 0x00001813
_0230121C: .word ov11_023226D4
	arm_func_end ov11_0230119C

	arm_func_start ov11_02301220
ov11_02301220: ; 0x02301220
	stmdb sp!, {r3, lr}
	ldr r0, _02301258 ; =ov11_02324D40
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _02301258 ; =ov11_02324D40
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02301258 ; =ov11_02324D40
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301258: .word ov11_02324D40
	arm_func_end ov11_02301220

	arm_func_start ov11_0230125C
ov11_0230125C: ; 0x0230125C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x130
	ldr r0, _02301398 ; =ov11_02324D40
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _0230128C
	cmp r1, #1
	beq _023012AC
	cmp r1, #2
	beq _023012E4
	b _0230138C
_0230128C:
	ldrsb r0, [r2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	ldreq r0, _02301398 ; =ov11_02324D40
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _0230138C
_023012AC:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0230138C
	ldr r0, _02301398 ; =ov11_02324D40
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _02301398 ; =ov11_02324D40
	mov r2, #2
	str r0, [r1]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _0230138C
_023012E4:
	mov r1, #3
	str r1, [r2, #4]
	ldr r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230137C
_023012FC: ; jump table
	b _0230137C ; case 0
	b _0230131C ; case 1
	b _02301328 ; case 2
	b _0230134C ; case 3
	b _0230137C ; case 4
	b _0230137C ; case 5
	b _0230137C ; case 6
	b _02301370 ; case 7
_0230131C:
	bl ov11_02300D5C
	mov r0, #4
	b _02301390
_02301328:
	ldr r3, _0230139C ; =ov11_023013A0
	mov r2, #0
	add r1, sp, #0x98
	mov r0, #0x100
	str r3, [sp, #0x11c]
	str r2, [sp, #0x120]
	bl sub_0203559C
	mov r0, #4
	b _02301390
_0230134C:
	ldr r3, _0230139C ; =ov11_023013A0
	mov r0, #0
	add r2, sp, #0
	mov r1, #0x100
	str r3, [sp, #0x84]
	str r0, [sp, #0x88]
	bl sub_02035CE4
	mov r0, #4
	b _02301390
_02301370:
	bl ov11_0230A07C
	mov r0, #4
	b _02301390
_0230137C:
	mov r0, #1
	bl ov11_0230113C
	mov r0, #4
	b _02301390
_0230138C:
	mov r0, #1
_02301390:
	add sp, sp, #0x130
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301398: .word ov11_02324D40
_0230139C: .word ov11_023013A0
	arm_func_end ov11_0230125C

	arm_func_start ov11_023013A0
ov11_023013A0: ; 0x023013A0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	beq _023013B8
	mov r0, #1
	bl ov11_0230113C
	ldmia sp!, {r3, pc}
_023013B8:
	ldr r0, _023013D4 ; =ov11_023226C4
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _023013D8 ; =ov11_02324D40
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023013D4: .word ov11_023226C4
_023013D8: .word ov11_02324D40
	arm_func_end ov11_023013A0

	arm_func_start ov11_023013DC
ov11_023013DC: ; 0x023013DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x258
	mov r1, #6
	bl MemAlloc
	ldr r1, _023014A8 ; =ov11_02324D48
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #0x1c]
	ldr r0, [r1]
	str r2, [r0, #0x184]
	ldr r0, [r1]
	str r2, [r0, #0xc]
	ldr r0, [r1]
	add r0, r0, #0x188
	bl InitPreprocessorArgs
	ldr r1, _023014A8 ; =ov11_02324D48
	ldrsh r2, [r5, #4]
	ldr r0, [r1]
	cmp r4, #0
	add r0, r0, #0x200
	strh r2, [r0, #0x4c]
	ldrb r2, [r5, #1]
	ldr r0, [r1]
	str r2, [r0, #0x250]
	ldreq r0, [r1]
	mov r2, #0
	streqb r2, [r0, #0x24]
	beq _02301468
	ldrb r0, [r5, #2]
	ldr r3, [r1]
	strb r0, [r3, #0x24]
	ldrb r0, [r5, #3]
	strb r0, [r3, #0x25]
_02301468:
	ldr r0, [r1]
	mvn r3, #1
	strb r2, [r0, #0x25]
	ldr r2, _023014A8 ; =ov11_02324D48
	mov r0, #0
	ldr r4, [r2]
	add r1, r4, #0x200
	ldrsh r1, [r1, #0x4c]
	str r1, [r4, #0x188]
	ldr r1, [r2]
	strb r3, [r1, #0x254]
	ldr r1, [r2]
	strb r3, [r1, #0x255]
	bl ov11_023014AC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023014A8: .word ov11_02324D48
	arm_func_end ov11_023013DC

	arm_func_start ov11_023014AC
ov11_023014AC: ; 0x023014AC
	stmdb sp!, {r3, lr}
	ldr r3, _02301A10 ; =ov11_02324D48
	ldr r1, [r3]
	str r0, [r1]
	ldr r2, [r3]
	ldr r0, [r2]
	cmp r0, #0x16
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_023014D0: ; jump table
	b _0230152C ; case 0
	b _023015BC ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _023015F0 ; case 3
	b _02301618 ; case 4
	b _023017B4 ; case 5
	b _0230187C ; case 6
	b _023015D8 ; case 7
	b _023016E8 ; case 8
	b _02301680 ; case 9
	b _02301780 ; case 10
	ldmia sp!, {r3, pc} ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	b _02301658 ; case 14
	ldmia sp!, {r3, pc} ; case 15
	ldmia sp!, {r3, pc} ; case 16
	b _0230191C ; case 17
	b _02301938 ; case 18
	b _023019A0 ; case 19
	b _023019DC ; case 20
	b _023019F8 ; case 21
	b _02301A04 ; case 22
_0230152C:
	add r0, r2, #0x200
	ldrsb r1, [r0, #0x54]
	mvn r0, #1
	cmp r1, r0
	bne _02301554
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x254]
_02301554:
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	cmp r1, #0x214
	bne _0230157C
	mov r0, #8
	str r0, [r2]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230157C:
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x6e
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, _02301A14 ; =0x000002A5
	ldr ip, [r0]
	mov r1, #8
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_023015BC:
	bl ov11_02302618
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_023015D8:
	mov r1, #2
	str r1, [r2, #0x20]
	ldr r0, [r3]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_023015F0:
	ldr r0, _02301A18 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301A1C ; =0x00300011
	ldr r3, _02301A20 ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301618:
	mov r0, #0xc
	str r0, [r2]
	ldr r0, [r3]
	mov r1, #0xe
	str r1, [r0, #4]
	ldr ip, [r3]
	ldr r2, _02301A24 ; =0x0000038F
	ldrsh r0, [ip, #0x14]
	mov r1, #8
	str r0, [ip, #0x19c]
	ldr r3, [r3]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301658:
	ldr r0, _02301A18 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301A1C ; =0x00300011
	ldr r3, _02301A20 ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301680:
	add r0, r2, #0x1d8
	bl sub_0206351C
	ldr r1, _02301A10 ; =ov11_02324D48
	mov ip, #6
	ldr r2, [r1]
	ldr r3, _02301A28 ; =ov11_023226F4
	add r0, r2, #0x200
	ldrsh lr, [r0, #0x4c]
	add r0, r2, #0x100
	mov r2, #0
	strh lr, [r0, #0xfc]
	ldr r0, [r1]
	strb ip, [r0, #0x1da]
	ldr ip, [r1]
	str r3, [sp]
	add r0, ip, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, ip, #0x204
	add r3, ip, #0x24
	bl sub_02052E2C
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x204
	bl ov11_023061E4
	ldmia sp!, {r3, pc}
_023016E8:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _02301730
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02301730
	mov r0, #5
	str r0, [r1]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301730:
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301768
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301768:
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301780:
	mov r0, #0xc
	str r0, [r2]
	ldr r0, [r3]
	mov r1, #0
	str r1, [r0, #4]
#ifdef JAPAN
	ldr r1, [r3]
	ldr r2, _02303080 ; =0x00003288
	add r0, r1, #0x200
	add r3, r1, #0x188
	ldrsb r0, [r0, #0x54]
	mov r1, #0x18
#else
	ldr r2, [r3]
	mov r1, #0x18
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r2, #0x188
	mov r2, #0x3a4
#endif
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_023017B4:
	mov r1, #1
	mov r0, #0x214
	str r1, [r2, #0x20]
	bl GetFirstMatchingMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301804
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0
	ldr r2, [r0]
	ldr r3, _02301A28 ; =ov11_023226F4
	str r1, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301A10 ; =ov11_02324D48
	b _0230180C
_02301804:
	bl GetTeamMember
	ldr r1, _02301A10 ; =ov11_02324D48
_0230180C:
	ldr r1, [r1]
	str r0, [r1, #0x248]
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230187C:
	mov r0, #1
	str r0, [r2, #0x20]
	ldr r2, [r3]
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	ldr r3, _02301A28 ; =ov11_023226F4
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301A10 ; =ov11_02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230191C:
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
_02301938:
	bl ov11_02310BDC
	ldr r0, _02301A10 ; =ov11_02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x4e
	str r3, [r1, #4]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r3, #0x6e
	bl GetNameWithGender
	ldr r0, _02301A10 ; =ov11_02324D48
	ldr r2, _02301A2C ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x18
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_023019A0:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl CloseDialogueBox
	ldr r1, _02301A10 ; =ov11_02324D48
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x254]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x6e
	add r1, r3, #0x100
	add r3, r3, #0x100
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_023019DC:
	add r0, r2, #0x6e
	add r1, r2, #0x46
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_023019F8:
	mov r0, #0
	str r0, [r2, #0xc]
	ldmia sp!, {r3, pc}
_02301A04:
	add r0, r2, #0x26
	bl sub_0203909C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301A10: .word ov11_02324D48
#ifdef JAPAN
_02301A14: .word 0x00002479
#else
_02301A14: .word 0x000002A5
#endif
_02301A18: .word ov11_023226FC
_02301A1C: .word 0x00300011
_02301A20: .word ov11_0232271C
#ifdef JAPAN
_02301A24: .word 0x00003273
_02301A28: .word ov11_023226F4
_02303080: .word 0x00003288
_02301A2C: .word 0x00003287
#else
_02301A24: .word 0x0000038F
_02301A28: .word ov11_023226F4
_02301A2C: .word 0x000003A3
#endif
	arm_func_end ov11_023014AC

	arm_func_start ov11_02301A30
ov11_02301A30: ; 0x02301A30
	stmdb sp!, {r3, lr}
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_02301A4C: ; jump table
	b _02301AA8 ; case 0
	b _02301B38 ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _02301B6C ; case 3
	b _02301B94 ; case 4
	b _02301D30 ; case 5
	b _02301DF8 ; case 6
	b _02301B54 ; case 7
	b _02301C64 ; case 8
	b _02301BFC ; case 9
	b _02301CFC ; case 10
	ldmia sp!, {r3, pc} ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	b _02301BD4 ; case 14
	ldmia sp!, {r3, pc} ; case 15
	ldmia sp!, {r3, pc} ; case 16
	b _02301E98 ; case 17
	b _02301EB4 ; case 18
	b _02301F1C ; case 19
	b _02301F58 ; case 20
	b _02301F74 ; case 21
	b _02301F80 ; case 22
_02301AA8:
	add r0, r2, #0x200
	ldrsb r1, [r0, #0x54]
	mvn r0, #1
	cmp r1, r0
	bne _02301AD0
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x254]
_02301AD0:
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	cmp r1, #0x214
	bne _02301AF8
	mov r0, #8
	str r0, [r2]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301AF8:
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x6e
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, _02301F90 ; =0x000002A5
	ldr ip, [r0]
	mov r1, #8
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301B38:
	bl ov11_02302618
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301B54:
	mov r1, #2
	str r1, [r2, #0x20]
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301B6C:
	ldr r0, _02301F94 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301F98 ; =0x00300011
	ldr r3, _02301F9C ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301B94:
	mov r1, #0xc
	str r1, [r2]
	ldr r1, [r0]
	mov r2, #0xe
	str r2, [r1, #4]
	ldr ip, [r0]
	ldr r2, _02301FA0 ; =0x0000038F
	ldrsh r3, [ip, #0x14]
	mov r1, #8
	str r3, [ip, #0x19c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301BD4:
	ldr r0, _02301F94 ; =ov11_023226FC
	mov r2, #0
	ldr r1, _02301F98 ; =0x00300011
	ldr r3, _02301F9C ; =ov11_0232271C
	str r2, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301BFC:
	add r0, r2, #0x1d8
	bl sub_0206351C
	ldr r1, _02301F8C ; =ov11_02324D48
	mov ip, #6
	ldr r2, [r1]
	ldr r3, _02301FA4 ; =ov11_023226F4
	add r0, r2, #0x200
	ldrsh lr, [r0, #0x4c]
	add r0, r2, #0x100
	mov r2, #0
	strh lr, [r0, #0xfc]
	ldr r0, [r1]
	strb ip, [r0, #0x1da]
	ldr ip, [r1]
	str r3, [sp]
	add r0, ip, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, ip, #0x204
	add r3, ip, #0x24
	bl sub_02052E2C
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x204
	bl ov11_023061E4
	ldmia sp!, {r3, pc}
_02301C64:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _02301CAC
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02301CAC
	mov r0, #5
	str r0, [r1]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CAC:
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301CE4
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CE4:
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CFC:
	mov r1, #0xc
	str r1, [r2]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #4]
#ifdef JAPAN
	ldr r1, [r0]
	ldr r2, _02303600 ; =0x00003288
	add r0, r1, #0x200
	add r3, r1, #0x188
	ldrsb r0, [r0, #0x54]
	mov r1, #0x18
#else
	ldr r2, [r0]
	mov r1, #0x18
	add r0, r2, #0x200
	add r3, r2, #0x188
	ldrsb r0, [r0, #0x54]
	mov r2, #0x3a4
#endif
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301D30:
	mov r1, #1
	mov r0, #0x214
	str r1, [r2, #0x20]
	bl GetFirstMatchingMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301D80
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0
	ldr r2, [r0]
	ldr r3, _02301FA4 ; =ov11_023226F4
	str r1, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301F8C ; =ov11_02324D48
	b _02301D88
_02301D80:
	bl GetTeamMember
	ldr r1, _02301F8C ; =ov11_02324D48
_02301D88:
	ldr r1, [r1]
	str r0, [r1, #0x248]
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301DF8:
	mov r1, #1
	str r1, [r2, #0x20]
	ldr r2, [r0]
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	ldr r3, _02301FA4 ; =ov11_023226F4
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301F8C ; =ov11_02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301E98:
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
_02301EB4:
	bl ov11_02310BDC
	ldr r0, _02301F8C ; =ov11_02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x4e
	str r3, [r1, #4]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r3, #0x6e
	bl GetNameWithGender
	ldr r0, _02301F8C ; =ov11_02324D48
	ldr r2, _02301FA8 ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x18
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowStringIdInDialogueBox
	ldmia sp!, {r3, pc}
_02301F1C:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl CloseDialogueBox
	ldr r1, _02301F8C ; =ov11_02324D48
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x254]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x6e
	add r1, r3, #0x100
	add r3, r3, #0x100
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_02301F58:
	add r0, r2, #0x6e
	add r1, r2, #0x46
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_02301F74:
	mov r0, #0
	str r0, [r2, #0xc]
	ldmia sp!, {r3, pc}
_02301F80:
	add r0, r2, #0x26
	bl sub_0203909C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301F8C: .word ov11_02324D48
#ifdef JAPAN
_02301F90: .word 0x00002479
#else
_02301F90: .word 0x000002A5
#endif
_02301F94: .word ov11_023226FC
_02301F98: .word 0x00300011
_02301F9C: .word ov11_0232271C
#ifdef JAPAN
_02301FA0: .word 0x00003273
_02301FA4: .word ov11_023226F4
_02303600: .word 0x00003288
_02301FA8: .word 0x00003287
#else
_02301FA0: .word 0x0000038F
_02301FA4: .word ov11_023226F4
_02301FA8: .word 0x000003A3
#endif
	arm_func_end ov11_02301A30

	arm_func_start ov11_02301FAC
ov11_02301FAC: ; 0x02301FAC
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02302000 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02302000 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDialogueBox
	ldr r0, _02302000 ; =ov11_02324D48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov11_023014AC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302000: .word ov11_02324D48
	arm_func_end ov11_02301FAC

	arm_func_start ov11_02302004
ov11_02302004: ; 0x02302004
	stmdb sp!, {r3, lr}
	ldr r0, _0230202C ; =ov11_02324D48
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230202C ; =ov11_02324D48
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230202C: .word ov11_02324D48
	arm_func_end ov11_02302004

	arm_func_start ov11_02302030
ov11_02302030: ; 0x02302030
	stmdb sp!, {r4, lr}
	ldr r1, _023025E4 ; =ov11_02324D48
	ldr r0, [r1]
	ldr r2, [r0, #0x184]
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _023025DC
_0230204C: ; jump table
	b _0230205C ; case 0
	b _02302068 ; case 1
	b _023025A4 ; case 2
	b _023025CC ; case 3
_0230205C:
	mov r1, #1
	str r1, [r0, #0x184]
	b _023025DC
_02302068:
	ldr r2, [r0]
	cmp r2, #0x19
	addls pc, pc, r2, lsl #2
	b _02302550
_02302078: ; jump table
	b _023020E0 ; case 0
	b _02302550 ; case 1
	b _023022D4 ; case 2
	b _02302114 ; case 3
	b _0230228C ; case 4
	b _02302550 ; case 5
	b _02302550 ; case 6
	b _02302550 ; case 7
	b _02302550 ; case 8
	b _023021A4 ; case 9
	b _02302550 ; case 10
	b _023022E0 ; case 11
	b _02302550 ; case 12
	b _02302550 ; case 13
	b _0230228C ; case 14
	b _02302480 ; case 15
	b _023024C4 ; case 16
	b _023024EC ; case 17
	b _02302504 ; case 18
	b _0230232C ; case 19
	b _0230232C ; case 20
	b _02302390 ; case 21
	b _023023B8 ; case 22
	b _02302460 ; case 23
	b _02302378 ; case 24
	b _0230250C ; case 25
_023020E0:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02302554
	mov r0, #3
	bl ov11_023014AC
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDialogueBox
	b _02302554
_02302114:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _02302170
	cmp r0, #4
	beq _0230213C
	cmp r0, #5
	beq _02302170
	b _02302554
_0230213C:
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	bl ov11_02302618
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0xf
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0]
	b _02302554
_02302170:
	bl ov11_02302618
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02302198
	mov r0, #0xa
	bl ov11_023014AC
	b _02302554
_02302198:
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023021A4:
	bl ov11_02306C9C
	cmp r0, #3
	beq _023021D4
	cmp r0, #4
	bne _02302554
	bl ov11_02306C64
	ldr r1, _023025E4 ; =ov11_02324D48
	ldr r1, [r1]
	str r0, [r1, #0x248]
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023021D4:
	bl ov11_02306C64
	ldr r1, _023025E4 ; =ov11_02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	ldr r0, [r2, #0x248]
	cmp r0, #0
	bne _0230221C
	add r0, r2, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02302210
	mov r0, #0xa
	bl ov11_023014AC
	b _02302554
_02302210:
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_0230221C:
	mov r0, #1
	str r0, [r2, #0x20]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ApplyLevelUpBoostsToGroundMonster
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	str r2, [r1, #0xc]
	bl ov11_023014AC
	b _02302554
_0230228C:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _023022C4
	cmp r0, #4
	beq _023022B4
	cmp r0, #5
	beq _023022C4
	b _02302554
_023022B4:
	bl ov11_02302618
	mov r0, #8
	bl ov11_023014AC
	b _02302554
_023022C4:
	bl ov11_02302618
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023022D4:
	bl ov11_0230D71C
	mov r0, #3
	b _02302558
_023022E0:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02302554
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDialogueBox
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0x1a
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _02302554
_0230232C:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02302554
	bl GetKeyboardStringResult
	ldr r1, _023025E4 ; =ov11_02324D48
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x26
	mov r2, #0x10
	bl StrncpySimpleNoPadSafe
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x46
	bl StrcpySimple
	mov r0, #0x18
	bl ov11_023014AC
	b _02302554
_02302378:
	bl sub_02037468
	cmp r0, #0
	beq _02302554
	mov r0, #0x15
	bl ov11_023014AC
	b _02302554
_02302390:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	ble _02302554
	mov r0, #0x16
	bl ov11_023014AC
	b _02302554
_023023B8:
	bl sub_0203931C
	cmp r0, #0
	bne _0230243C
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #1
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x46
	bl StrcpySimple
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0xa
	ldr r1, [r0]
	ldr r0, [r1, #0x248]
	add r1, r1, #0x6e
	add r0, r0, #0x3a
	add r1, r1, #0x100
	bl StrncpySimple
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl sub_02065BC8
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, #0xf
	ldr r0, [r0]
	add r0, r0, #0x46
	bl sub_02065C08
	mov r0, #0x17
	bl ov11_023014AC
	b _02302554
_0230243C:
	cmp r0, #1
	bne _02302554
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r2, #0x14
	ldr r1, [r0]
	mov r0, #0x17
	str r2, [r1, #8]
	bl ov11_023014AC
	b _02302554
_02302460:
	bl sub_02039218
	cmp r0, #0
	beq _02302554
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_023014AC
	b _02302554
_02302480:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	cmpne r0, #2
	beq _02302554
	cmp r0, #3
	bne _02302554
	ldr r0, [r1, #4]
	bl ov11_023014AC
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _02302554
_023024C4:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	ble _02302554
	mov r0, #0x11
	bl ov11_023014AC
	b _02302554
_023024EC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02302554
	mov r0, #0x12
	bl ov11_023014AC
	b _02302554
_02302504:
	bl ov11_02301FAC
	b _02302554
_0230250C:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _02302534
	cmp r0, #0xa
	beq _02302544
	b _02302554
_02302534:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _02302554
_02302544:
	mov r0, #0x13
	bl ov11_023014AC
	b _02302554
_02302550:
	bl ov11_02301FAC
_02302554:
	mov r0, #0
_02302558:
	cmp r0, #3
	bne _023025DC
	ldr r0, _023025E4 ; =ov11_02324D48
	mov r3, #2
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0x184]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	cmp r0, r1
	beq _023025DC
	bl sub_0202836C
	ldr r0, _023025E4 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _023025DC
_023025A4:
	mov r2, #3
	str r2, [r0, #0x184]
	ldr r0, [r1]
	sub r1, r2, #5
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	cmp r0, r1
	beq _023025DC
	bl CloseDialogueBox
	b _023025DC
_023025CC:
	ldr r0, [r0, #0x20]
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r4, pc}
_023025DC:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_023025E4: .word ov11_02324D48
	arm_func_end ov11_02302030

	arm_func_start ov11_023025E8
ov11_023025E8: ; 0x023025E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02302614 ; =ov11_0232270C
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov11_023013DC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302614: .word ov11_0232270C
	arm_func_end ov11_023025E8

	arm_func_start ov11_02302618
ov11_02302618: ; 0x02302618
	stmdb sp!, {r3, lr}
	ldr r0, _02302664 ; =ov11_02324D48
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02302664 ; =ov11_02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl CloseSimpleMenu
	ldr r0, _02302664 ; =ov11_02324D48
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x255]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302664: .word ov11_02324D48
	arm_func_end ov11_02302618

	arm_func_start ov11_02302668
ov11_02302668: ; 0x02302668
	stmdb sp!, {r3, lr}
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _023027D0
_02302684: ; jump table
	b _023027D0 ; case 0
	b _02302744 ; case 1
	b _0230283C ; case 2
	b _023027D0 ; case 3
	b _023027D0 ; case 4
	b _023027D0 ; case 5
	b _023027D0 ; case 6
	b _023026B8 ; case 7
	b _0230274C ; case 8
	b _023027D0 ; case 9
	b _023027D0 ; case 10
	b _023027D0 ; case 11
	b _0230278C ; case 12
_023026B8:
	bl ov11_02305B98
	cmp r0, #1
	beq _0230283C
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	add r0, r0, #0xfe
	bl ov11_02305B40
	cmp r0, #3
	beq _023026E8
	cmp r0, #5
	beq _0230271C
	b _0230283C
_023026E8:
	ldr r1, _02302844 ; =ov11_02324D4C
	mov r3, #1
	ldr r0, [r1]
	ldr r2, _02302848 ; =0x00000276
	str r3, [r0, #0x20]
	ldr ip, [r1]
	mov r0, #4
	ldrsh r3, [ip, #0xfe]
	str r3, [ip, #0x44]
	ldr r1, [r1]
	str r2, [r1, #0xf8]
	bl ov11_02302850
	b _0230283C
_0230271C:
	ldr r0, _02302844 ; =ov11_02324D4C
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _0230284C ; =0x00000287
	str r3, [r1, #0x20]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0xf8]
	bl ov11_02302850
	b _0230283C
_02302744:
	mov r0, #3
	ldmia sp!, {r3, pc}
_0230274C:
	ldrsb r0, [r2, #0xfc]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0230283C
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl ShowDialogueBox
	ldr r0, _02302844 ; =ov11_02324D4C
	mov r2, #0xd
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl sub_0202F2C4
	b _0230283C
_0230278C:
	ldr r1, [r2, #0xc]
	add r1, r1, #1
	str r1, [r2, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	cmpne r0, #2
	beq _0230283C
	cmp r0, #3
	bne _0230283C
	ldr r0, [r1, #4]
	bl ov11_02302850
	ldr r0, _02302844 ; =ov11_02324D4C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0230283C
_023027D0:
	ldrsb r0, [r2, #0xfc]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0230283C
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl ShowDialogueBox
	ldr r0, _02302844 ; =ov11_02324D4C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	cmp r0, r1
	beq _0230282C
	bl sub_0202F2C4
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl CloseDialogueBox
	ldr r0, _02302844 ; =ov11_02324D4C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xfc]
_0230282C:
	ldr r0, _02302844 ; =ov11_02324D4C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov11_02302850
_0230283C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302844: .word ov11_02324D4C
#ifdef JAPAN
_02302848: .word 0x0000244A
_0230284C: .word 0x0000245B
#else
_02302848: .word 0x00000276
_0230284C: .word 0x00000287
#endif
	arm_func_end ov11_02302668

	arm_func_start ov11_02302850
ov11_02302850: ; 0x02302850
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r1, _02302A44 ; =ov11_02324D4C
	ldr r2, [r1]
	str r0, [r2]
	ldr ip, [r1]
	ldr r0, [ip]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_02302878: ; jump table
	b _023028A8 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302998 ; case 4
	b _023028B4 ; case 5
	b _023028EC ; case 6
	b _023028C0 ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_023028A8:
	mov r0, #1
	str r0, [ip]
	b _02302A3C
_023028B4:
	mov r0, #1
	str r0, [ip, #4]
	b _02302A3C
_023028C0:
	ldr r0, [ip, #0xf4]
	ldrsh r1, [ip, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #0
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_023028EC:
	mov r2, #7
	str r2, [ip]
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_02302908: ; jump table
	b _02302938 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302988 ; case 4
	b _02302944 ; case 5
	b _0230297C ; case 6
	b _02302950 ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_02302938:
	mov r0, #1
	str r0, [r1]
	b _02302A3C
_02302944:
	mov r0, #1
	str r0, [r1, #4]
	b _02302A3C
_02302950:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #6
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #6
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_0230297C:
	str r2, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302988:
	mov r0, #0
	str r0, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302998:
	mov r3, #0
	str r3, [ip]
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_023029B4: ; jump table
	b _023029E4 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302A34 ; case 4
	b _023029F0 ; case 5
	b _02302A24 ; case 6
	b _023029FC ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_023029E4:
	mov r0, #1
	str r0, [r1]
	b _02302A3C
_023029F0:
	mov r0, #1
	str r0, [r1, #4]
	b _02302A3C
_023029FC:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0xc
	mov r2, r2, asr #0x10
	bl sub_0200CF6C
	add r0, sp, #0xc
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_02302A24:
	mov r0, #7
	str r0, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302A34:
	str r3, [r1]
	bl ov11_02302A48
_02302A3C:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02302A44: .word ov11_02324D4C
	arm_func_end ov11_02302850

	arm_func_start ov11_02302A48
ov11_02302A48: ; 0x02302A48
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _02302C34 ; =ov11_02324D4C
	ldr ip, [r0]
	ldr r1, [ip]
	cmp r1, #0xb
	addls pc, pc, r1, lsl #2
	b _02302C2C
_02302A68: ; jump table
	b _02302A98 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302B88 ; case 4
	b _02302AA4 ; case 5
	b _02302ADC ; case 6
	b _02302AB0 ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302A98:
	mov r0, #1
	str r0, [ip]
	b _02302C2C
_02302AA4:
	mov r0, #1
	str r0, [ip, #4]
	b _02302C2C
_02302AB0:
	ldr r0, [ip, #0xf4]
	ldrsh r1, [ip, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0xc
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #0xc
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302ADC:
	mov r2, #7
	str r2, [ip]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302C2C
_02302AF8: ; jump table
	b _02302B28 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302B78 ; case 4
	b _02302B34 ; case 5
	b _02302B6C ; case 6
	b _02302B40 ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302B28:
	mov r0, #1
	str r0, [r1]
	b _02302C2C
_02302B34:
	mov r0, #1
	str r0, [r1, #4]
	b _02302C2C
_02302B40:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #6
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #6
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302B6C:
	str r2, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302B78:
	mov r0, #0
	str r0, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302B88:
	mov r3, #0
	str r3, [ip]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302C2C
_02302BA4: ; jump table
	b _02302BD4 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302C24 ; case 4
	b _02302BE0 ; case 5
	b _02302C14 ; case 6
	b _02302BEC ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302BD4:
	mov r0, #1
	str r0, [r1]
	b _02302C2C
_02302BE0:
	mov r0, #1
	str r0, [r1, #4]
	b _02302C2C
_02302BEC:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0
	mov r2, r2, asr #0x10
	bl sub_0200CF6C
	add r0, sp, #0
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302C14:
	mov r0, #7
	str r0, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302C24:
	str r3, [r1]
	bl ov11_02302A48
_02302C2C:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02302C34: .word ov11_02324D4C
	arm_func_end ov11_02302A48

	arm_func_start ov11_02302C38
ov11_02302C38: ; 0x02302C38
	stmdb sp!, {r3, lr}
	ldr r0, _02302C60 ; =ov11_02324D4C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02302C60 ; =ov11_02324D4C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302C60: .word ov11_02324D4C
	arm_func_end ov11_02302C38

	arm_func_start ov11_02302C64
ov11_02302C64: ; 0x02302C64
	stmdb sp!, {r3, lr}
	ldr r0, _02302CDC ; =ov11_02324D4C
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02302CD4
_02302C80: ; jump table
	b _02302C90 ; case 0
	b _02302C9C ; case 1
	b _02302CB8 ; case 2
	b _02302CC4 ; case 3
_02302C90:
	mov r0, #1
	str r0, [r1, #0x28]
	b _02302CD4
_02302C9C:
	bl ov11_02302668
	cmp r0, #3
	ldreq r0, _02302CDC ; =ov11_02324D4C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0x28]
	b _02302CD4
_02302CB8:
	mov r0, #3
	str r0, [r1, #0x28]
	b _02302CD4
_02302CC4:
	ldr r0, [r1, #0x20]
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02302CD4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302CDC: .word ov11_02324D4C
	arm_func_end ov11_02302C64

	arm_func_start ov11_02302CE0
ov11_02302CE0: ; 0x02302CE0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02302D84 ; =ov11_02322740
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x104
	mov r1, #6
	bl MemAlloc
	ldr r2, _02302D88 ; =ov11_02324D4C
	mov r1, #0
	str r0, [r2]
	str r1, [r0, #0x1c]
	ldr r0, [r2]
	sub r3, r1, #2
	str r1, [r0, #0x28]
	ldr r0, [r2]
	str r1, [r0, #0xc]
	ldrsh ip, [r5, #4]
	ldr r0, [r2]
	strh ip, [r0, #0xf0]
	ldrh ip, [r5, #2]
	ldr r0, [r2]
	str ip, [r0, #0xf4]
	ldr r0, [r2]
	strb r4, [r0, #0x100]
	ldr r0, [r2]
	strh r1, [r0, #0xfe]
	ldr r0, [r2]
	strb r3, [r0, #0xfc]
	ldr r0, [r2]
	add r0, r0, #0x2c
	bl InitPreprocessorArgs
	ldr r0, _02302D88 ; =ov11_02324D4C
	ldrsh r2, [r5, #4]
	ldr r1, [r0]
	mov r0, #7
	str r2, [r1, #0x3c]
	bl ov11_02302850
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302D84: .word ov11_02322740
_02302D88: .word ov11_02324D4C
	arm_func_end ov11_02302CE0

	arm_func_start ov11_02302D8C
ov11_02302D8C: ; 0x02302D8C
	stmdb sp!, {r3, lr}
	ldr r0, _02302DB4 ; =ov11_02324D4C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02302DB4 ; =ov11_02324D4C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302DB4: .word ov11_02324D4C
	arm_func_end ov11_02302D8C

	arm_func_start ov11_02302DB8
ov11_02302DB8: ; 0x02302DB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _023031E4 ; =ov11_02324D4C
#ifdef JAPAN
	ldr r1, [sb, #4]
	ldr r0, [r1]
#else
	ldr r3, [sb, #4]
	ldr r0, [r3]
#endif
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _023031DC
_02302DD4: ; jump table
	b _02302E0C ; case 0
	b _02302E4C ; case 1
	b _02302E74 ; case 2
	b _02302EA8 ; case 3
	b _02302F4C ; case 4
	b _02302FF4 ; case 5
	b _0230301C ; case 6
	b _02303050 ; case 7
	b _02303088 ; case 8
	b _023030F4 ; case 9
	b _0230311C ; case 10
	b _0230313C ; case 11
	b _023031A4 ; case 12
	b _023031C0 ; case 13
_02302E0C:
#ifdef JAPAN
	add r0, r1, #0x3c
	str r0, [r1, #0x174]
#else
	add r0, r3, #0x3c
	str r0, [r3, #0x174]
#endif
	ldr r1, [sb, #4]
	mvn r0, #1
	ldrsb r1, [r1, #9]
	cmp r1, r0
	bne _023031DC
	mov r0, #0
	bl CreateDialogueBox
	mov r1, sb
	ldr r3, [r1, #4]
	mov r2, #1
	strb r0, [r3, #9]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02302E4C:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	ldr r2, _023031E8 ; =0x000002C5
	mov r1, #0x10
	mov r3, #0
	bl ShowStringIdInDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0]
	b _023031DC
_02302E74:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl ShowDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #3
	str r1, [r0]
	b _023031DC
_02302EA8:
#ifdef JAPAN
	add r0, r1, #0x3c
	mov r7, #0
	ldr r5, _023031EC ; =ov11_02322780
	str r0, [r1, #0x174]
#else
	add r0, r3, #0x3c
	mov r7, #0
	ldr r5, _023031EC ; =ov11_02322780
	str r0, [r3, #0x174]
#endif
	mov r6, #0x100
	mov r4, r7
_02302EC0:
	ldr r3, [sb, #4]
	mov r0, r7, lsl #3
	add r1, r3, #0x13c
	str r1, [sp]
	ldrh r2, [r5, r0]
	add r8, r7, r7, lsl #6
	add r0, r3, #0x18c
	mov r1, r6
	mov r3, r4
	add r0, r0, r8, lsl #2
	bl PreprocessStringFromId
	add r1, r5, r7, lsl #3
	ldr r0, [sb, #4]
	add r7, r7, #1
	ldr r1, [r1, #4]
	add r0, r0, r8, lsl #2
	str r1, [r0, #0x28c]
	cmp r7, #3
	blt _02302EC0
	mov r1, #3
	ldr r0, _023031E4 ; =ov11_02324D4C
	str r1, [sp]
	ldr r2, [r0, #4]
	ldr r0, _023031F0 ; =ov11_02322750
	ldr r1, _023031F4 ; =0x00300011
	add r3, r2, #0x18c
	mov r2, #0
	bl CreateSimpleMenu
	ldr r1, _023031E4 ; =ov11_02324D4C
	mov r2, #4
	ldr r3, [r1, #4]
	strb r0, [r3, #0xa]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02302F4C:
#ifdef JAPAN
	ldrsb r0, [r1, #0xa]
#else
	ldrsb r0, [r3, #0xa]
#endif
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0xa]
	bl GetSimpleMenuResult
	mov r1, sb
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #0xa]
	bl CloseSimpleMenu
	mov r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02302FA8
	cmp r0, #1
	beq _02302FC4
	cmp r0, #2
	b _02302FE8
_02302FA8:
	ldrsb r0, [r1, #9]
	bl CloseDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #0xb
	str r1, [r0]
	b _023031DC
_02302FC4:
	ldrsb r0, [r1, #9]
	bl CloseDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl ov11_02302CE0
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02302FE8:
	mov r0, #5
	str r0, [r1]
	b _023031DC
_02302FF4:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
	ldr r2, _023031F8 ; =0x000002C9
	add r3, r1, #0x13c
#else
	ldrsb r0, [r3, #9]
	ldr r2, _023031F8 ; =0x000002C9
	add r3, r3, #0x13c
#endif
	mov r1, #0x10
	bl ShowStringIdInDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #6
	str r1, [r0]
	b _023031DC
_0230301C:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl ShowDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #7
	str r1, [r0]
	b _023031DC
_02303050:
	ldr r0, _023031FC ; =ov11_02322760
	mov r4, #2
	ldr r1, _02303200 ; =0x00300013
	ldr r3, _02303204 ; =ov11_02322798
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	mov r1, sb
	ldr r3, [r1, #4]
	mov r2, #8
	strb r0, [r3, #0xa]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02303088:
#ifdef JAPAN
	ldrsb r0, [r1, #0xa]
#else
	ldrsb r0, [r3, #0xa]
#endif
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0xa]
	bl GetSimpleMenuResult
	mov r1, sb
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #0xa]
	bl CloseSimpleMenu
	mov r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #3
	beq _023030DC
	cmp r0, #4
	b _023030E8
_023030DC:
	mov r0, #9
	str r0, [r1]
	b _023031DC
_023030E8:
	mov r0, #1
	str r0, [r1]
	b _023031DC
_023030F4:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
	ldr r2, _02304864_JP ; =0x00002FEA
	add r3, r1, #0x13c
	mov r1, #0x218
#else
	ldrsb r0, [r3, #9]
	mov r1, #0x218
	add r2, r1, #0xb2
	add r3, r3, #0x13c
#endif
	bl ShowStringIdInDialogueBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #0xa
	str r1, [r0]
	b _023031DC
_0230311C:
#ifdef JAPAN
	ldrsb r0, [r1, #9]
#else
	ldrsb r0, [r3, #9]
#endif
	bl IsDialogueBoxActive
	cmp r0, #0
	moveq r0, sb
	ldreq r0, [r0, #4]
	moveq r1, #0xd
	streq r1, [r0]
	b _023031DC
_0230313C:
#ifdef JAPAN
	add r0, r1, #0x10
#else
	add r0, r3, #0x10
#endif
	bl sub_0206351C
	mov r0, sb
	ldr r1, [r0, #4]
	mov r3, #1
	str r3, [r1, #0x1c]
	ldr r2, [r0, #4]
	ldr r1, [r2, #0xc]
	ldrh r0, [r1]
	strh r0, [r2, #0x20]
	ldrh r0, [r1, #2]
	strh r0, [r2, #0x22]
	ldrh r0, [r1, #4]
	mov r1, #0
	strh r0, [r2, #0x24]
	ldrb r0, [r2, #8]
	cmp r0, #0
	movne r3, #8
	add r0, r2, #0x10
	orr r2, r3, #6
	bl sub_0203D438
	ldr r0, _023031E4 ; =ov11_02324D4C
	mov r1, #0xc
	ldr r0, [r0, #4]
	str r1, [r0]
	b _023031DC
_023031A4:
	bl sub_0203D538
	cmp r0, #1
	bne _023031DC
	bl sub_0203EFD4
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_023031C0:
	bl ov11_022E6E68
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl CloseDialogueBox
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_023031DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023031E4: .word ov11_02324D4C
#ifdef JAPAN
_023031E8: .word 0x00002FE5
#else
_023031E8: .word 0x000002C5
#endif
_023031EC: .word ov11_02322780
_023031F0: .word ov11_02322750
_023031F4: .word 0x00300011
#ifdef JAPAN
_023031F8: .word 0x00002FE9
#else
_023031F8: .word 0x000002C9
#endif
_023031FC: .word ov11_02322760
_02303200: .word 0x00300013
_02303204: .word ov11_02322798
#ifdef JAPAN
_02304864_JP: .word 0x00002FEA
#endif
	arm_func_end ov11_02302DB8

	arm_func_start ov11_02303208
ov11_02303208: ; 0x02303208
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _023032B4 ; =ov11_02322770
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _023032B8 ; =ov11_02324D4C
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02303248
	ldr r0, _023032BC ; =0x00000498
	mov r1, #6
	bl MemAlloc
	ldr r1, _023032B8 ; =ov11_02324D4C
	str r0, [r1, #4]
_02303248:
	ldr r0, _023032B8 ; =ov11_02324D4C
	mvn r3, #1
	ldr r2, [r0, #4]
	mov r1, #0
	strb r3, [r2, #9]
	ldr r3, [r0, #4]
	ldr r2, _023032C0 ; =ov11_02322734
	str r5, [r3, #0xc]
	ldr r5, [r0, #4]
	mov r3, #1
	strb r4, [r5, #8]
	ldr r0, [r0, #4]
	str r1, [sp]
	ldr r1, [r0, #0xc]
	add r0, r0, #0x3c
	bl sub_0200D310
	ldr r0, _023032B8 ; =ov11_02324D4C
	ldr r0, [r0, #4]
	add r0, r0, #0x13c
	bl InitPreprocessorArgs
	ldr r0, _023032B8 ; =ov11_02324D4C
	cmp r4, #0
	movne r1, #0xb
	ldr r0, [r0, #4]
	moveq r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023032B4: .word ov11_02322770
_023032B8: .word ov11_02324D4C
_023032BC: .word 0x00000498
_023032C0: .word ov11_02322734
	arm_func_end ov11_02303208

	arm_func_start ov11_023032C4
ov11_023032C4: ; 0x023032C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0xc80
	mov r1, #6
	bl MemAlloc
	ldr r2, _023033F0 ; =ov11_02324D54
	mov r1, #0x5c
	str r0, [r2]
	mov r0, #0
	bl LoadScriptVariableValue
	ldr r1, _023033F0 ; =ov11_02324D54
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r1, [r1]
	sub r2, r3, #2
	ldr r0, [r1, #0x10]
	cmp r0, #0
	movle r0, #5
	strle r0, [r1, #0x10]
	ldr r0, _023033F0 ; =ov11_02324D54
	ldr r1, [r0]
	str r3, [r1, #0x1c]
	ldr r1, [r0]
	str r3, [r1, #0xc24]
	ldr r1, [r0]
	str r3, [r1, #0x14]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #0xc7d]
	ldr r0, [r0]
	add r0, r0, #0x28
	add r0, r0, #0xc00
	bl InitPreprocessorArgs
	ldr r0, _023033F0 ; =ov11_02324D54
#ifdef JAPAN
	ldr r2, _02304A54 ; =0x000032FC
	ldr r1, [r0]
	ldr r3, _023033F4 ; =0x0000C402
	add r0, r1, #0x28
	add r4, r0, #0xc00
	add r0, r1, #0x24
	mov r1, #0x400
#else
	mov r1, #0x400
	ldr r2, [r0]
	ldr r3, _023033F4 ; =0x0000C402
	add r0, r2, #0x28
	add r4, r0, #0xc00
	add r0, r2, #0x24
	add r2, r1, #0x4a
#endif
	str r4, [sp]
	bl PreprocessStringFromId
	ldr r6, _023033F8 ; =ov11_023227B0
	ldr r5, _023033F4 ; =0x0000C402
	ldr r4, _023033F0 ; =ov11_02324D54
	mov r8, #0
	mov r7, #0x400
_02303390:
	ldr r3, [r4]
	mov r1, r7
	add r0, r3, #0x28
	add r0, r0, #0xc00
	str r0, [sp]
	ldr r2, [r3, #4]
	add r0, r3, #0x24
	mov r2, r2, lsl #1
	ldrh r2, [r6, r2]
	add ip, r0, #0x400
	mov r3, r5
	add r0, r8, r2
	mov r2, r0, lsl #0x10
	add r0, ip, r8, lsl #6
	mov r2, r2, lsr #0x10
	bl PreprocessStringFromId
	add r8, r8, #1
	cmp r8, #0x1e
	blt _02303390
	mov r0, #0
	bl ov11_023035C0
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023033F0: .word ov11_02324D54
#ifdef JAPAN
_02304A54: .word 0x000032FC
#endif
_023033F4: .word 0x0000C402
_023033F8: .word ov11_023227B0
	arm_func_end ov11_023032C4

	arm_func_start ov11_023033FC
ov11_023033FC: ; 0x023033FC
	stmdb sp!, {r3, lr}
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _02303538
_02303418: ; jump table
	b _0230344C ; case 0
	b _02303538 ; case 1
	b _023034A0 ; case 2
	b _023035B4 ; case 3
	b _02303538 ; case 4
	b _02303538 ; case 5
	b _02303538 ; case 6
	b _02303538 ; case 7
	b _023034A8 ; case 8
	b _02303538 ; case 9
	b _02303538 ; case 10
	b _02303538 ; case 11
	b _023034F4 ; case 12
_0230344C:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl GetAdvancedMenuResult
	ldr r1, _023035BC ; =ov11_02324D54
	add r2, r0, #1
	ldr r0, [r1]
	str r2, [r0, #0x18]
	ldr r0, [r1]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl CloseAdvancedMenu
	mov r0, #2
	bl ov11_023035C0
	b _023035B4
_023034A0:
	mov r0, #3
	ldmia sp!, {r3, pc}
_023034A8:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl ShowDialogueBox
	ldr r0, _023035BC ; =ov11_02324D54
	mov r2, #0xd
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl sub_0202F2C4
	b _023035B4
_023034F4:
	ldr r1, [r2, #0x14]
	add r1, r1, #1
	str r1, [r2, #0x14]
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	cmp r0, #1
	cmpne r0, #2
	beq _023035B4
	cmp r0, #3
	bne _023035B4
	ldr r0, [r1, #8]
	bl ov11_023035C0
	ldr r0, _023035BC ; =ov11_02324D54
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _023035B4
_02303538:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl ShowDialogueBox
	ldr r0, _023035BC ; =ov11_02324D54
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	cmp r0, r1
	beq _023035A4
	bl sub_0202F2C4
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl CloseDialogueBox
	ldr r0, _023035BC ; =ov11_02324D54
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc7d]
_023035A4:
	ldr r0, _023035BC ; =ov11_02324D54
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_023035C0
_023035B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023035BC: .word ov11_02324D54
	arm_func_end ov11_023033FC

	arm_func_start ov11_023035C0
ov11_023035C0: ; 0x023035C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r1, _02303724 ; =ov11_02324D54
	ldr r2, [r1]
	str r0, [r2]
	ldr r3, [r1]
	ldr r0, [r3]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0230371C
_023035E8: ; jump table
	b _02303618 ; case 0
	b _023036A4 ; case 1
	b _023036C0 ; case 2
	b _023036E8 ; case 3
	b _0230371C ; case 4
	b _02303700 ; case 5
	b _023036CC ; case 6
	b _0230371C ; case 7
	b _0230371C ; case 8
	b _0230371C ; case 9
	b _0230371C ; case 10
	b _023036F4 ; case 11
_02303618:
	ldr r0, [r3, #4]
	mov r1, #0
#ifdef JAPAN
	add r0, r0, #0xfe
	add r2, r0, #0x3200
#else
	add r0, r0, #0x4c
	add r2, r0, #0x400
#endif
	mov r0, #0x10
	strh r2, [sp, #0x10]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x84]
	str r0, [sp, #0x14]
	ldr r0, [r3, #4]
	ldr ip, [r3, #0x10]
	cmp r0, #2
	ldr r1, _02303728 ; =0x00001813
	add r2, sp, #8
	beq _0230367C
	ldr r0, _0230372C ; =ov11_023227D8
	str ip, [sp]
	mov ip, #8
	ldr r3, _02303730 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02303724 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _0230371C
_0230367C:
	ldr r0, _02303734 ; =ov11_023227B8
	str ip, [sp]
	mov ip, #8
	ldr r3, _02303730 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02303724 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _0230371C
_023036A4:
	ldr r0, _02303738 ; =ov11_023227E8
	bl Debug_Print0
	ldr r0, _02303724 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0230371C
_023036C0:
	ldr r0, _0230373C ; =ov11_02322808
	bl Debug_Print0
	b _0230371C
_023036CC:
	ldr r0, _02303740 ; =ov11_02322828
	bl Debug_Print0
	ldr r0, _02303724 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230371C
_023036E8:
	ldr r0, _02303744 ; =ov11_02322850
	bl Debug_Print0
	b _0230371C
_023036F4:
	ldr r0, _02303748 ; =ov11_0232287C
	bl Debug_Print0
	b _0230371C
_02303700:
	ldr r0, _0230374C ; =ov11_02322894
	bl Debug_Print0
	ldr r0, _02303724 ; =ov11_02324D54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230377C
_0230371C:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303724: .word ov11_02324D54
_02303728: .word 0x00001813
_0230372C: .word ov11_023227D8
_02303730: .word ov11_02303750
_02303734: .word ov11_023227B8
_02303738: .word ov11_023227E8
_0230373C: .word ov11_02322808
_02303740: .word ov11_02322828
_02303744: .word ov11_02322850
_02303748: .word ov11_0232287C
_0230374C: .word ov11_02322894
	arm_func_end ov11_023035C0

	arm_func_start ov11_02303750
ov11_02303750: ; 0x02303750
	stmdb sp!, {r4, lr}
	ldr r2, _02303778 ; =ov11_02324D54
	mov r4, r0
	ldr r2, [r2]
	add r2, r2, #0x24
	add r2, r2, #0x400
	add r1, r2, r1, lsl #6
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02303778: .word ov11_02324D54
	arm_func_end ov11_02303750

	arm_func_start ov11_0230377C
ov11_0230377C: ; 0x0230377C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r0, _023038D8 ; =ov11_02324D54
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _023038D0
_0230379C: ; jump table
	b _023037CC ; case 0
	b _02303858 ; case 1
	b _02303874 ; case 2
	b _0230389C ; case 3
	b _023038D0 ; case 4
	b _023038B4 ; case 5
	b _02303880 ; case 6
	b _023038D0 ; case 7
	b _023038D0 ; case 8
	b _023038D0 ; case 9
	b _023038D0 ; case 10
	b _023038A8 ; case 11
_023037CC:
	ldr r0, [r3, #4]
	mov r1, #0
#ifdef JAPAN
	add r0, r0, #0xfe
	add r2, r0, #0x3200
#else
	add r0, r0, #0x4c
	add r2, r0, #0x400
#endif
	mov r0, #0x10
	strh r2, [sp, #0x10]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x84]
	str r0, [sp, #0x14]
	ldr r0, [r3, #4]
	ldr ip, [r3, #0x10]
	cmp r0, #2
	ldr r1, _023038DC ; =0x00001813
	add r2, sp, #8
	beq _02303830
	ldr r0, _023038E0 ; =ov11_023227D8
	str ip, [sp]
	mov ip, #8
	ldr r3, _023038E4 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _023038D8 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _023038D0
_02303830:
	ldr r0, _023038E8 ; =ov11_023227B8
	str ip, [sp]
	mov ip, #8
	ldr r3, _023038E4 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _023038D8 ; =ov11_02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _023038D0
_02303858:
	ldr r0, _023038EC ; =ov11_023227E8
	bl Debug_Print0
	ldr r0, _023038D8 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _023038D0
_02303874:
	ldr r0, _023038F0 ; =ov11_02322808
	bl Debug_Print0
	b _023038D0
_02303880:
	ldr r0, _023038F4 ; =ov11_02322828
	bl Debug_Print0
	ldr r0, _023038D8 ; =ov11_02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023038D0
_0230389C:
	ldr r0, _023038F8 ; =ov11_02322850
	bl Debug_Print0
	b _023038D0
_023038A8:
	ldr r0, _023038FC ; =ov11_0232287C
	bl Debug_Print0
	b _023038D0
_023038B4:
	ldr r0, _02303900 ; =ov11_02322894
	bl Debug_Print0
	ldr r0, _023038D8 ; =ov11_02324D54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230377C
_023038D0:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023038D8: .word ov11_02324D54
_023038DC: .word 0x00001813
_023038E0: .word ov11_023227D8
_023038E4: .word ov11_02303750
_023038E8: .word ov11_023227B8
_023038EC: .word ov11_023227E8
_023038F0: .word ov11_02322808
_023038F4: .word ov11_02322828
_023038F8: .word ov11_02322850
_023038FC: .word ov11_0232287C
_02303900: .word ov11_02322894
	arm_func_end ov11_0230377C

	arm_func_start ov11_02303904
ov11_02303904: ; 0x02303904
	stmdb sp!, {r3, lr}
	ldr r0, _0230392C ; =ov11_02324D54
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230392C ; =ov11_02324D54
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230392C: .word ov11_02324D54
	arm_func_end ov11_02303904

	arm_func_start ov11_02303930
ov11_02303930: ; 0x02303930
	stmdb sp!, {r3, lr}
	ldr r0, _023039A8 ; =ov11_02324D54
	ldr r1, [r0]
	ldr r0, [r1, #0xc24]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _023039A0
_0230394C: ; jump table
	b _0230395C ; case 0
	b _02303968 ; case 1
	b _02303984 ; case 2
	b _02303990 ; case 3
_0230395C:
	mov r0, #1
	str r0, [r1, #0xc24]
	b _023039A0
_02303968:
	bl ov11_023033FC
	cmp r0, #3
	ldreq r0, _023039A8 ; =ov11_02324D54
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0xc24]
	b _023039A0
_02303984:
	mov r0, #3
	str r0, [r1, #0xc24]
	b _023039A0
_02303990:
	ldr r0, [r1, #0x18]
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_023039A0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023039A8: .word ov11_02324D54
	arm_func_end ov11_02303930

	arm_func_start ov11_023039AC
ov11_023039AC: ; 0x023039AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023039D0 ; =ov11_023227C8
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov11_023032C4
	ldmia sp!, {r4, pc}
	.align 2, 0
_023039D0: .word ov11_023227C8
	arm_func_end ov11_023039AC

	arm_func_start ov11_023039D4
ov11_023039D4: ; 0x023039D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x21c
	mov r1, #8
	bl MemAlloc
	ldr r1, _02303AF8 ; =ov11_02324D58
	cmp r4, #0
	str r0, [r1, #4]
	str r4, [r0, #0x14]
	bne _02303A14
	ldr r0, [r1, #4]
	add r0, r0, #0x60
	bl sub_02034A38
	ldr r1, _02303AF8 ; =ov11_02324D58
	ldr r1, [r1, #4]
	str r0, [r1, #0x5c]
_02303A14:
	mov r2, #0
	ldr r0, _02303AF8 ; =ov11_02324D58
	mov r3, r2
_02303A20:
	ldr r1, [r0, #4]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str r3, [r1, #0x38]
	cmp r2, #8
	blt _02303A20
	ldr r2, _02303AF8 ; =ov11_02324D58
	mov lr, #1
	ldr r0, [r2, #4]
	mov ip, #4
	str r3, [r0, #0x18]
	ldr r1, [r2, #4]
	ldr r0, _02303AFC ; =ov11_023228E0
	str r3, [r1, #0x1c]
	ldr r3, [r2, #4]
	ldr r1, _02303B00 ; =ov11_023042A8
	str lr, [r3, #0x20]
	ldr r3, [r2, #4]
	str lr, [r3, #0x24]
	ldr r3, [r2, #4]
	str lr, [r3, #0x28]
	ldr r3, [r2, #4]
	str lr, [r3, #0x2c]
	ldr r3, [r2, #4]
	str lr, [r3, #0x30]
	ldr r3, [r2, #4]
	str lr, [r3, #0x34]
	ldr r3, [r2, #4]
	str ip, [r3, #0x40]
	ldr r3, [r2, #4]
	ldr r2, [r3, #0x40]
	sub r2, r2, #2
	str r2, [r3, #0x10]
	bl CreateTextBox
	ldr r1, _02303AF8 ; =ov11_02324D58
	mov r2, #1
	ldr r3, [r1, #4]
	strb r0, [r3, #1]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	bl ov11_02303BC0
	ldr r0, _02303AF8 ; =ov11_02324D58
	ldr r0, [r0, #4]
	add r0, r0, #0x1bc
	bl InitPreprocessorArgs
	ldr r1, _02303AF8 ; =ov11_02324D58
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	strb r3, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02303AF8: .word ov11_02324D58
_02303AFC: .word ov11_023228E0
_02303B00: .word ov11_023042A8
	arm_func_end ov11_023039D4

	arm_func_start ov11_02303B04
ov11_02303B04: ; 0x02303B04
	stmdb sp!, {r3, lr}
	ldr r0, _02303B4C ; =ov11_02324D58
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #1]
	bl sub_0202836C
	ldr r0, _02303B4C ; =ov11_02324D58
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseTextBox
	ldr r0, _02303B4C ; =ov11_02324D58
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02303B4C ; =ov11_02324D58
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303B4C: .word ov11_02324D58
	arm_func_end ov11_02303B04

	arm_func_start ov11_02303B50
ov11_02303B50: ; 0x02303B50
	stmdb sp!, {r3, lr}
	ldr r0, _02303BBC ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02303B7C
	cmp r1, #1
	beq _02303BB4
	cmp r1, #2
	beq _02303B84
	b _02303BB4
_02303B7C:
	bl ov11_02303D80
	b _02303BB4
_02303B84:
	mov r1, #3
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x5c]
	tst r1, #0x100
	beq _02303BAC
	ldrb r1, [r0]
	ldr r0, [r2, #0xe8]
	ldr r2, [r2, #0xe4]
	blx r2
_02303BAC:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02303BB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303BBC: .word ov11_02324D58
	arm_func_end ov11_02303B50

	arm_func_start ov11_02303BC0
ov11_02303BC0: ; 0x02303BC0
	stmdb sp!, {r3, lr}
	ldr r1, _02303D68 ; =ov11_02324D58
	ldr r2, [r1, #4]
	str r0, [r2, #8]
	ldr r3, [r1, #4]
	ldr r0, [r3, #8]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02303BE4: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _02303BFC ; case 1
	b _02303C5C ; case 2
	b _02303C94 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	b _02303D4C ; case 5
_02303BFC:
	ldr r2, _02303D6C ; =0x00003CFF
	add r0, r3, #0x100
	strh r2, [r0]
	ldr r0, [r1, #4]
	mov r2, #0x10
	str r2, [r0, #0x104]
	ldr ip, [r1, #4]
	mov r2, #4
	ldr r3, [ip, #0x3c]
	ldr r0, _02303D70 ; =ov11_023228D0
	str r3, [ip, #0xf8]
	str r2, [sp]
	ldr r1, [r1, #4]
	ldr r3, _02303D74 ; =ov11_023228F0
	add r2, r1, #0xf8
	mov r1, #0x33
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02303D68 ; =ov11_02324D58
	ldr r2, [r1, #4]
	strb r0, [r2, #2]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	ldmia sp!, {r3, pc}
_02303C5C:
	ldr r2, [r3, #0x40]
	mov r0, #3
	str r2, [r3, #0xf8]
	str r0, [sp]
	ldr r1, [r1, #4]
	ldr r0, _02303D70 ; =ov11_023228D0
	add r2, r1, #0xf8
	ldr r3, _02303D78 ; =ov11_02322910
	mov r1, #0x33
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02303D68 ; =ov11_02324D58
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
	ldmia sp!, {r3, pc}
_02303C94:
	mov r0, #0
	str r0, [r3, #0x198]
	ldr r0, [r1, #4]
	mov r2, #0x50
	str r2, [r0, #0x1b0]
	ldr r0, [r1, #4]
	mov r2, #4
	str r2, [r0, #0x1b4]
	ldr r0, [r1, #4]
	mov ip, #0x12
	str ip, [r0, #0x1a8]
	ldr r0, [r1, #4]
	mov r3, #0xc
	str r3, [r0, #0x1ac]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _02303CF4
	mov r0, #0x1f
	str r0, [r2, #0x19c]
	ldr r0, [r1, #4]
	ldr r1, _02303D7C ; =0x0000FFF2
	str r1, [r0, #0x1a0]
	b _02303D24
_02303CF4:
	cmp r0, #1
	addne r0, ip, #0x470
	strne r0, [r2, #0x19c]
	ldrne r0, [r1, #4]
	rsbne r1, r3, #0x10000
	strne r1, [r0, #0x1a0]
	bne _02303D24
	mov r0, #0x14
	str r0, [r2, #0x19c]
	ldr r0, [r1, #4]
	ldr r1, _02303D7C ; =0x0000FFF2
	str r1, [r0, #0x1a0]
_02303D24:
	ldr r0, _02303D68 ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x18]
	str r1, [r2, #0x194]
	ldr r0, [r0, #4]
	add r0, r0, #0x190
	bl sub_02039460
	ldmia sp!, {r3, pc}
_02303D4C:
	ldrsb r0, [r3, #2]
	bl CloseSimpleMenu
	ldr r0, _02303D68 ; =ov11_02324D58
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303D68: .word ov11_02324D58
#if defined(EUROPE)
_02303D6C: .word 0x00003D01
#elif defined(JAPAN)
_02303D6C: .word 0x000004A6
#else
_02303D6C: .word 0x00003CFF
#endif
_02303D70: .word ov11_023228D0
_02303D74: .word ov11_023228F0
_02303D78: .word ov11_02322910
_02303D7C: .word 0x0000FFF2
	arm_func_end ov11_02303BC0

	arm_func_start ov11_02303D80
ov11_02303D80: ; 0x02303D80
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xa8
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0230428C
_02303DA0: ; jump table
	b _0230428C ; case 0
	b _02303DBC ; case 1
	b _0230406C ; case 2
	b _0230417C ; case 3
	b _02304250 ; case 4
	b _02304268 ; case 5
	b _0230422C ; case 6
_02303DBC:
	ldrsb r0, [r2, #2]
	bl GetSimpleMenuResult
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0230428C
_02303DD0: ; jump table
	b _0230428C ; case 0
	b _0230404C ; case 1
	b _02303DE8 ; case 2
	b _02303E10 ; case 3
	b _02303E38 ; case 4
	b _02303E60 ; case 5
_02303DE8:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, #5
	ldr r2, [r1, #4]
	mov r3, #2
	str r4, [r2, #8]
	ldr r2, [r1, #4]
	str r3, [r2, #0xc]
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	b _0230428C
_02303E10:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, #5
	ldr r2, [r1, #4]
	mov r3, #3
	str r4, [r2, #8]
	ldr r2, [r1, #4]
	str r3, [r2, #0xc]
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	b _0230428C
_02303E38:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r4, [r1, #4]
	mov r2, #1
	str r0, [r4, #0x3c]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	b _0230428C
_02303E60:
	ldr r1, _02304298 ; =ov11_02324D58
	ldr r2, [r1, #4]
	str r0, [r2, #0x3c]
	ldr r3, [r1, #4]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _02303E90
	cmp r0, #1
	beq _02303F30
	cmp r0, #2
	beq _02303FD0
	b _0230402C
_02303E90:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	bne _02303F00
	bl GetHero
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _0230429C ; =ov11_02322978
	ldr r2, [r0, #0x18]
	add r0, sp, #6
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #6
	add r0, r4, #0x3a
	mov r2, #0xa
	bl StrncpyName
	ldrsh r2, [r4, #4]
	mov r0, #0
	mov r1, #0x3e
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x3f
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	bl sub_020572EC
	b _0230402C
_02303F00:
	add r0, sp, #0x1c
	bl sub_02048764
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r1, _0230429C ; =ov11_02322978
	ldr r2, [r0, #4]
	add r0, sp, #0x1c
	ldr r2, [r2, #0x18]
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [sp, #0x1c]
	bl sub_02048794
	b _0230402C
_02303F30:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	bne _02303FA0
	bl GetPartner
	ldr r1, _02304298 ; =ov11_02324D58
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _023042A0 ; =ov11_02322930
	ldr r2, [r0, #0x1c]
	add r0, sp, #6
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #6
	add r0, r4, #0x3a
	mov r2, #0xa
	bl StrncpyName
	ldrsh r2, [r4, #4]
	mov r0, #0
	mov r1, #0x40
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x41
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	bl sub_020572EC
	b _0230402C
_02303FA0:
	add r0, sp, #0x58
	bl sub_02048764
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r1, _023042A0 ; =ov11_02322930
	ldr r2, [r0, #4]
	add r0, sp, #0x58
	ldr r2, [r2, #0x1c]
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [sp, #0x5a]
	bl sub_02048794
	b _0230402C
_02303FD0:
	ldr r1, _023042A4 ; =ov11_023228BC
	add r0, sp, #0x94
	ldrb r2, [r1]
	strb r2, [sp, #4]
	ldrb r1, [r1, #1]
	strb r1, [sp, #5]
	ldr r1, [r3, #0x20]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl GetNameRaw
	add r0, sp, #0x94
	mov r1, r0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	mov r3, #0
	ldr r0, _02304298 ; =ov11_02324D58
	str r3, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0x94
	ldr r0, [r0, #0x20]
	add r2, sp, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055DD0
_0230402C:
	ldr r0, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0230428C
_0230404C:
	ldr r0, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r2, [r0, #4]
	mov r1, #6
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0230428C
_0230406C:
	ldrsb r0, [r2, #2]
	bl GetSimpleMenuResult
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0230428C
_02304080: ; jump table
	b _0230428C ; case 0
	b _02304150 ; case 1
	b _02304094 ; case 2
	b _023040D4 ; case 3
	b _02304110 ; case 4
_02304094:
	ldr r1, _02304298 ; =ov11_02324D58
	mov ip, #0
	ldr r2, [r1, #4]
	mov r3, #5
	str r0, [r2, #0x40]
	ldr r0, [r1, #4]
	mov r2, #1
	str ip, [r0, #0x10]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_023040D4:
	ldr r1, _02304298 ; =ov11_02324D58
	mov r3, #1
	ldr ip, [r1, #4]
	mov r2, #5
	str r0, [ip, #0x40]
	ldr r0, [r1, #4]
	str r3, [r0, #0x10]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	str r3, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_02304110:
	ldr r1, _02304298 ; =ov11_02324D58
	mov ip, #2
	ldr r2, [r1, #4]
	mov r3, #5
	str r0, [r2, #0x40]
	ldr r0, [r1, #4]
	mov r2, #1
	str ip, [r0, #0x10]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_02304150:
	ldr r0, _02304298 ; =ov11_02324D58
	mov r3, #5
	ldr r1, [r0, #4]
	mov r2, #1
	str r3, [r1, #8]
	ldr r1, [r0, #4]
	str r2, [r1, #0xc]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_0230417C:
	add r0, r2, #0x190
	ldr r4, [r2, #0x190]
	bl sub_02039528
	mvn r1, #1
	cmp r0, r1
	beq _023041D8
	add r1, r1, #1
	cmp r0, r1
	ldr r1, _02304298 ; =ov11_02324D58
	ldreq r0, _02304298 ; =ov11_02324D58
	ldr lr, [r1, #4]
	ldreq r0, [r0, #4]
	ldr ip, [lr, #0x10]
	ldreq r0, [r0, #0x194]
	add ip, lr, ip, lsl #2
	str r0, [ip, #0x18]
	ldr r0, [r1, #4]
	mov r3, #4
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	mov r2, #1
	str r2, [r0, #0xc]
	b _0230428C
_023041D8:
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r0, [r0, #4]
	ldr r3, [r0, #0x190]
	cmp r4, r3
	bne _023041F8
	ldr r0, [r0, #0x58]
	cmp r0, #0xff
	bne _0230428C
_023041F8:
	ldr r0, _02304298 ; =ov11_02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	add r1, r2, r1, lsl #2
	str r3, [r1, #0x18]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	ldr r0, _02304298 ; =ov11_02324D58
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x58]
	b _0230428C
_0230422C:
	mov r1, #2
	str r1, [r2, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _02304248
	bl ov11_02303B04
_02304248:
	mvn r0, #0
	b _02304290
_02304250:
	ldr r1, [r2, #0xc]
	str r1, [r2, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	bl ov11_02303BC0
	b _0230428C
_02304268:
	ldrsb r0, [r2, #2]
	bl CloseSimpleMenu
	ldr r0, _02304298 ; =ov11_02324D58
	mvn r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2, #2]
	ldr r0, [r0, #4]
	str r1, [r0, #8]
_0230428C:
	mov r0, #0
_02304290:
	add sp, sp, #0xa8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304298: .word ov11_02324D58
_0230429C: .word ov11_02322978
_023042A0: .word ov11_02322930
_023042A4: .word ov11_023228BC
	arm_func_end ov11_02303D80

	arm_func_start ov11_023042A8
ov11_023042A8: ; 0x023042A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	ldr r0, _02304390 ; =ov11_02324D58
	ldr r2, _02304394 ; =ov11_02324D60
	ldr r1, [r0, #4]
	mov r0, r4
	ldr r3, [r1, #0x10]
	mov r1, #1
	ldr r3, [r2, r3, lsl #2]
	mov r2, #3
	bl DrawTextInWindow
	ldr r0, _02304390 ; =ov11_02324D58
	ldr r3, [r0, #4]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _02304300
	cmp r0, #1
	beq _02304314
	b _02304328
_02304300:
	ldr r1, [r3, #0x18]
	ldr r0, _02304398 ; =ov11_02322978
	mov r1, r1, lsl #1
	ldrsh r2, [r0, r1]
	b _02304334
_02304314:
	ldr r1, [r3, #0x1c]
	ldr r0, _0230439C ; =ov11_02322930
	mov r1, r1, lsl #1
	ldrsh r2, [r0, r1]
	b _02304334
_02304328:
	ldr r0, [r3, #0x20]
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_02304334:
	ldr r0, _02304390 ; =ov11_02324D58
	str r2, [r3, #0x1bc]
	ldr r1, [r0, #4]
	orr r2, r2, #0x10000
	str r2, [r1, #0x1cc]
	ldr r1, [r0, #4]
	ldr r2, _023043A0 ; =ov11_023229B8
	add ip, r1, #0x1bc
	ldr r3, _023043A4 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #4
	mov r0, r4
	mov r1, #0x3c
	mov r2, #3
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #4
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02304390: .word ov11_02324D58
_02304394: .word ov11_02324D60
_02304398: .word ov11_02322978
_0230439C: .word ov11_02322930
_023043A0: .word ov11_023229B8
_023043A4: .word 0x0000C402
	arm_func_end ov11_023042A8

	arm_func_start ov11_023043A8
ov11_023043A8: ; 0x023043A8
	ldr ip, _023043B4 ; =sub_020348E4
	ldr r0, _023043B8 ; =ov11_023229DC
	bx ip
	.align 2, 0
_023043B4: .word sub_020348E4
_023043B8: .word ov11_023229DC
	arm_func_end ov11_023043A8

	arm_func_start ov11_023043BC
ov11_023043BC: ; 0x023043BC
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _023043E4 ; =ov11_02324D6C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023043E4: .word ov11_02324D6C
	arm_func_end ov11_023043BC

	arm_func_start ov11_023043E8
ov11_023043E8: ; 0x023043E8
	stmdb sp!, {r3, lr}
	ldr r0, _02304410 ; =ov11_02324D6C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304410 ; =ov11_02324D6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304410: .word ov11_02324D6C
	arm_func_end ov11_023043E8

	arm_func_start ov11_02304414
ov11_02304414: ; 0x02304414
	stmdb sp!, {r3, lr}
	ldr r0, _02304510 ; =ov11_02324D6C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304440
	cmp r0, #1
	beq _02304478
	cmp r0, #2
	beq _023044C4
	b _02304508
_02304440:
	mov r0, #9
	bl sub_02067584
	cmp r0, #0
	beq _02304460
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304460:
	bl ov11_0230D71C
	ldr r0, _02304510 ; =ov11_02324D6C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304508
_02304478:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304508
	mov r0, #9
	bl sub_020668B4
	cmp r0, #0
	bne _023044AC
	bl sub_02067664
	mvn r0, #0
	bl ov11_022E6E8C
	bl ov11_0230D000
	mov r0, #4
	ldmia sp!, {r3, pc}
_023044AC:
	bl ov11_02310BDC
	ldr r0, _02304510 ; =ov11_02324D6C
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304508
_023044C4:
	bl sub_02066A44
	cmp r0, #0
	beq _02304508
	mvn r1, #0
	cmp r0, r1
	bne _023044E8
	mov r0, r1
	bl ov11_022E6E8C
	b _023044F8
_023044E8:
	cmp r0, #1
	bne _023044F8
	bl sub_020674CC
	bl ov11_022E6E8C
_023044F8:
	bl sub_02067664
	bl ov11_0230D000
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304508:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304510: .word ov11_02324D6C
	arm_func_end ov11_02304414

	arm_func_start ov11_02304514
ov11_02304514: ; 0x02304514
	ldr ip, _02304520 ; =sub_020348E4
	ldr r0, _02304524 ; =ov11_023229EC
	bx ip
	.align 2, 0
_02304520: .word sub_020348E4
_02304524: .word ov11_023229EC
	arm_func_end ov11_02304514

	arm_func_start ov11_02304528
ov11_02304528: ; 0x02304528
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _02304550 ; =ov11_02324D70
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304550: .word ov11_02324D70
	arm_func_end ov11_02304528

	arm_func_start ov11_02304554
ov11_02304554: ; 0x02304554
	stmdb sp!, {r3, lr}
	ldr r0, _0230457C ; =ov11_02324D70
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230457C ; =ov11_02324D70
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230457C: .word ov11_02324D70
	arm_func_end ov11_02304554

	arm_func_start ov11_02304580
ov11_02304580: ; 0x02304580
	stmdb sp!, {r3, lr}
	ldr r0, _02304660 ; =ov11_02324D70
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023045AC
	cmp r0, #1
	beq _023045E0
	cmp r0, #2
	beq _02304630
	b _02304658
_023045AC:
	bl ov11_022E8340
	cmp r0, #0
	bne _023045CC
	bl ov11_022E84AC
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_023045CC:
	ldr r0, _02304660 ; =ov11_02324D70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304658
_023045E0:
	bl ov11_022E83F8
	cmp r0, #0
	beq _02304658
	cmp r0, #1
	bne _02304608
	mvn r0, #0
	bl ov11_022E6E8C
	bl ov11_022E84AC
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304608:
	cmp r0, #2
	bne _02304658
	ldr r0, _02304660 ; =ov11_02324D70
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304658
_02304630:
	ldr r0, [r1, #8]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r1, #8]
	bgt _02304658
	bl ov11_022E84AC
	mov r0, #0
	bl ov11_022E6EE8
	mov r0, #3
	ldmia sp!, {r3, pc}
_02304658:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304660: .word ov11_02324D70
	arm_func_end ov11_02304580

	arm_func_start ov11_02304664
ov11_02304664: ; 0x02304664
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02304684 ; =ov11_023229FC
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _02304688 ; =ov11_0238A084
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304684: .word ov11_023229FC
_02304688: .word ov11_0238A084
	arm_func_end ov11_02304664

	arm_func_start ov11_0230468C
ov11_0230468C: ; 0x0230468C
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _023046B4 ; =ov11_02324D74
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023046B4: .word ov11_02324D74
	arm_func_end ov11_0230468C

	arm_func_start ov11_023046B8
ov11_023046B8: ; 0x023046B8
	stmdb sp!, {r3, lr}
	ldr r0, _023046E0 ; =ov11_02324D74
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _023046E0 ; =ov11_02324D74
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023046E0: .word ov11_02324D74
	arm_func_end ov11_023046B8

	arm_func_start ov11_023046E4
ov11_023046E4: ; 0x023046E4
	stmdb sp!, {r3, lr}
	ldr r0, _02304880 ; =ov11_02324D74
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02304878
_02304700: ; jump table
	b _02304718 ; case 0
	b _0230473C ; case 1
	b _023047AC ; case 2
	b _023047C8 ; case 3
	b _023047EC ; case 4
	b _02304810 ; case 5
_02304718:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	bl ov11_0230D71C
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_0230473C:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304884 ; =ov11_0238A084
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bl sub_020664B8
	cmp r0, #0
	bne _0230477C
	bl sub_02066888
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230477C:
	ldr r0, _02304884 ; =ov11_0238A084
	ldr r0, [r0]
	cmp r0, #0
	bne _02304794
	bl ov11_02310BF0
	b _02304798
_02304794:
	bl ov11_02310C04
_02304798:
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_023047AC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_023047C8:
	bl sub_02066510
	cmp r0, #0
	beq _02304878
	ldr r1, _02304880 ; =ov11_02324D74
	mov r2, #4
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0, #4]
_023047EC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	bl ov11_0230D71C
	ldr r0, _02304880 ; =ov11_02324D74
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_02304810:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304880 ; =ov11_02324D74
	ldr r1, _02304888 ; =ov11_02322A0C
	ldr r2, [r0]
	b _0230483C
_0230482C:
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _02304848
	add r1, r1, #8
_0230483C:
	ldr r3, [r1]
	cmp r3, #0
	bne _0230482C
_02304848:
	cmp r3, #0
	beq _02304864
	ldrsh r0, [r1, #4]
	bl sub_0206C110
	mov r0, #1
	bl ov11_022E6E8C
	b _0230486C
_02304864:
	mov r0, #0
	bl ov11_022E6E8C
_0230486C:
	bl sub_02066888
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304878:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304880: .word ov11_02324D74
_02304884: .word ov11_0238A084
_02304888: .word ov11_02322A0C
	arm_func_end ov11_023046E4

	arm_func_start ov11_0230488C
ov11_0230488C: ; 0x0230488C
	stmdb sp!, {r3, lr}
	mov r0, #0xe
	bl sub_02067584
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230488C

	arm_func_start ov11_023048AC
ov11_023048AC: ; 0x023048AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023048CC ; =ov11_02322AB4
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _023048D0 ; =ov11_0238A088
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023048CC: .word ov11_02322AB4
_023048D0: .word ov11_0238A088
	arm_func_end ov11_023048AC

	arm_func_start ov11_023048D4
ov11_023048D4: ; 0x023048D4
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _023048FC ; =ov11_02324D78
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023048FC: .word ov11_02324D78
	arm_func_end ov11_023048D4

	arm_func_start ov11_02304900
ov11_02304900: ; 0x02304900
	stmdb sp!, {r3, lr}
	ldr r0, _02304928 ; =ov11_02324D78
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304928 ; =ov11_02324D78
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304928: .word ov11_02324D78
	arm_func_end ov11_02304900

	arm_func_start ov11_0230492C
ov11_0230492C: ; 0x0230492C
	stmdb sp!, {r3, lr}
	ldr r0, _02304ABC ; =ov11_02324D78
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02304AB4
_02304948: ; jump table
	b _02304960 ; case 0
	b _023049A4 ; case 1
	b _023049D0 ; case 2
	b _023049EC ; case 3
	b _02304A10 ; case 4
	b _02304A34 ; case 5
_02304960:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	mov r0, #0xe
	bl sub_02067584
	cmp r0, #0
	beq _0230498C
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230498C:
	bl ov11_0230D71C
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_023049A4:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	mov r0, #0xe
	bl sub_020668B4
	bl ov11_02310BDC
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_023049D0:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_023049EC:
	bl sub_02066A44
	cmp r0, #0
	beq _02304AB4
	ldr r1, _02304ABC ; =ov11_02324D78
	mov r2, #4
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0, #4]
_02304A10:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	bl ov11_0230D71C
	ldr r0, _02304ABC ; =ov11_02324D78
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_02304A34:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	ldr r1, _02304ABC ; =ov11_02324D78
	mvn r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, r0
	bne _02304A60
	bl ov11_02300D5C
	b _02304AA8
_02304A60:
	ldr r1, _02304AC0 ; =ov11_02322AC4
	b _02304A78
_02304A68:
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _02304A84
	add r1, r1, #8
_02304A78:
	ldr r3, [r1]
	cmp r3, #0
	bne _02304A68
_02304A84:
	cmp r3, #0
	beq _02304AA0
	ldrsh r0, [r1, #4]
	bl sub_0206C110
	mov r0, #6
	bl ov11_0230113C
	b _02304AA8
_02304AA0:
	mov r0, #1
	bl ov11_0230113C
_02304AA8:
	bl sub_02067664
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304AB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304ABC: .word ov11_02324D78
_02304AC0: .word ov11_02322AC4
	arm_func_end ov11_0230492C

	arm_func_start IsBagNotEmpty
IsBagNotEmpty: ; 0x02304AC4
	stmdb sp!, {r3, lr}
	bl GetNbItemsInBag
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsBagNotEmpty

	arm_func_start ov11_02304AE0
ov11_02304AE0: ; 0x02304AE0
	ldr ip, _02304AEC ; =sub_020348E4
	ldr r0, _02304AF0 ; =ov11_02322B6C
	bx ip
	.align 2, 0
_02304AEC: .word sub_020348E4
_02304AF0: .word ov11_02322B6C
	arm_func_end ov11_02304AE0

	arm_func_start ov11_02304AF4
ov11_02304AF4: ; 0x02304AF4
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02304B1C ; =ov11_02324D7C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304B1C: .word ov11_02324D7C
	arm_func_end ov11_02304AF4

	arm_func_start ov11_02304B20
ov11_02304B20: ; 0x02304B20
	stmdb sp!, {r3, lr}
	ldr r0, _02304B48 ; =ov11_02324D7C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304B48 ; =ov11_02324D7C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304B48: .word ov11_02324D7C
	arm_func_end ov11_02304B20

	arm_func_start ov11_02304B4C
ov11_02304B4C: ; 0x02304B4C
	stmdb sp!, {r3, lr}
	ldr r0, _02304BC0 ; =ov11_02324D7C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304B70
	cmp r0, #1
	beq _02304B9C
	b _02304BB8
_02304B70:
	bl ov11_02307244
	cmp r0, #0
	bne _02304B88
	bl ov11_02308D1C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304B88:
	ldr r0, _02304BC0 ; =ov11_02324D7C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304BB8
_02304B9C:
	bl ov11_02307334
	cmp r0, #0
	beq _02304BB8
	bl ov11_02300D5C
	bl ov11_02308D1C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304BB8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304BC0: .word ov11_02324D7C
	arm_func_end ov11_02304B4C

	arm_func_start ov11_02304BC4
ov11_02304BC4: ; 0x02304BC4
	ldr ip, _02304BD0 ; =sub_020348E4
	ldr r0, _02304BD4 ; =ov11_02322B7C
	bx ip
	.align 2, 0
_02304BD0: .word sub_020348E4
_02304BD4: .word ov11_02322B7C
	arm_func_end ov11_02304BC4

	arm_func_start ov11_02304BD8
ov11_02304BD8: ; 0x02304BD8
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02304C00 ; =ov11_02324D80
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304C00: .word ov11_02324D80
	arm_func_end ov11_02304BD8

	arm_func_start ov11_02304C04
ov11_02304C04: ; 0x02304C04
	stmdb sp!, {r3, lr}
	ldr r0, _02304C2C ; =ov11_02324D80
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304C2C ; =ov11_02324D80
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304C2C: .word ov11_02324D80
	arm_func_end ov11_02304C04

	arm_func_start ov11_02304C30
ov11_02304C30: ; 0x02304C30
	stmdb sp!, {r3, lr}
	ldr r0, _02304CA8 ; =ov11_02324D80
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304C54
	cmp r0, #1
	beq _02304C84
	b _02304CA0
_02304C54:
	mov r0, #0
	bl ov11_02309040
	cmp r0, #0
	bne _02304C70
	bl ov11_02309DF8
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304C70:
	ldr r0, _02304CA8 ; =ov11_02324D80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304CA0
_02304C84:
	bl ov11_023090DC
	cmp r0, #0
	beq _02304CA0
	bl ov11_02309DF8
	bl ov11_02300D5C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304CA0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304CA8: .word ov11_02324D80
	arm_func_end ov11_02304C30

	arm_func_start ov11_02304CAC
ov11_02304CAC: ; 0x02304CAC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02304D8C ; =ov11_02324D84
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	bne _02304CDC
	ldr r0, _02304D90 ; =0x000004C4
	mov r1, #8
	bl MemAlloc
	ldr r1, _02304D8C ; =ov11_02324D84
	str r0, [r1]
_02304CDC:
	ldr r0, _02304D8C ; =ov11_02324D84
	ldrh r1, [r5]
	ldr r2, [r0]
	strh r1, [r2]
	ldrh r1, [r5, #2]
	add r0, r2, #0x54
	strh r1, [r2, #2]
	ldrh r1, [r5, #4]
	strh r1, [r2, #4]
	bl ItemZInit
	ldr r0, _02304D8C ; =ov11_02324D84
	ldr r0, [r0]
	add r0, r0, #0x15c
	bl InitPreprocessorArgs
	ldr r0, _02304D8C ; =ov11_02324D84
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #2
	str r3, [r1, #0x50]
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r1, [r0]
	strb r2, [r1, #0x4a]
	ldr r1, [r0]
	strb r2, [r1, #0x49]
	ldr r1, [r0]
	strb r2, [r1, #0x4b]
	ldr r1, [r0]
	str r3, [r1, #0x44]
_02304D50:
	ldr r1, [r0]
	add r1, r1, r3
	strb r3, [r1, #0x4bc]
	add r3, r3, #1
	cmp r3, #5
	blt _02304D50
	ldr r1, _02304D8C ; =ov11_02324D84
	mov r0, #0
	ldr r2, [r1]
	str r0, [r2, #0x1ac]
	ldr r1, [r1]
	strb r4, [r1, #0x4c]
	bl ov11_02304DC8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02304D8C: .word ov11_02324D84
_02304D90: .word 0x000004C4
	arm_func_end ov11_02304CAC

	arm_func_start ov11_02304D94
ov11_02304D94: ; 0x02304D94
	stmdb sp!, {r4, lr}
	ldr ip, _02304DC4 ; =ov11_02324D84
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add ip, r2, r1
	mov r2, #1
	mov r4, r0
	strb lr, [ip, #6]
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304DC4: .word ov11_02324D84
	arm_func_end ov11_02304D94

	arm_func_start ov11_02304DC8
ov11_02304DC8: ; 0x02304DC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x198
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r4, [r1]
	ldr r0, [r4, #0x38]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _0230543C
_02304DF0: ; jump table
	b _02304E50 ; case 0
	b _02304EA8 ; case 1
	b _02304EDC ; case 2
	b _02304F24 ; case 3
	b _0230527C ; case 4
	b _023052D0 ; case 5
	b _023050BC ; case 6
	b _0230543C ; case 7
	b _0230543C ; case 8
	b _0230543C ; case 9
	b _0230543C ; case 10
	b _02305138 ; case 11
	b _0230523C ; case 12
	b _02305300 ; case 13
	b _02305310 ; case 14
	b _02305374 ; case 15
	b _023053CC ; case 16
	b _0230543C ; case 17
	b _0230543C ; case 18
	b _02305348 ; case 19
	b _02304FE4 ; case 20
	b _0230508C ; case 21
	b _0230543C ; case 22
	b _02305408 ; case 23
_02304E50:
	bl IsBagFull
	cmp r0, #0
	beq _02304E90
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r1, [r0]
	ldrb r0, [r1, #0x4c]
	cmp r0, #0
	beq _02304E80
	mov r0, #0x17
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _0230543C
_02304E80:
	mov r0, #1
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02304EA8
_02304E90:
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_02304EA8:
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305448 ; =0x000002D7
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_02304EDC:
	mov r0, #3
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _02306AB0 ; =0x00002FB1
#else
	rsb r2, r3, #0x2e0
#endif
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_02304F24:
#ifdef JAPAN
	ldr r1, _02306AB4 ; =0x00002FAC
	add r0, r4, #0x1b0
#else
	add r0, r4, #0x1b0
	mov r1, #0x2d8
#endif
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x18
	str r1, [r4, #0x2b0]
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _02305444 ; =ov11_02324D84
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _0230544C ; =ov11_02322B8C
	add r0, r1, #0x5a
	mov r3, #1
	bl sub_0200D310
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305450 ; =0x000002D9
	ldr r5, [r0]
	add ip, sp, #0x18
	ldrsh r3, [r5, #4]
	add r0, r4, #0x2b4
	mov r1, #0x100
	orr r3, r3, #0x10000
	str r3, [sp, #0x28]
	ldrh lr, [r5, #2]
	mov r3, #0
	str lr, [sp, #0x3c]
	ldrb lr, [r5]
	str lr, [sp, #0x40]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r2, #3
	str r2, [r4, #0x3b4]
	mov r0, #0
	strb r0, [r4, #0x3b8]
	mov r1, #1
	str r1, [r4, #0x4b8]
	str r2, [sp]
	ldr r3, _02305444 ; =ov11_02324D84
	mov r1, #0x11
	ldr r3, [r3]
	mov r2, r0
	add r3, r3, #0x1b0
	bl CreateSimpleMenu
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02304FE4:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305444 ; =ov11_02324D84
	mov r4, #0
	ldr lr, [r0]
	mov r3, #0x15
	ldrh ip, [lr, #0x54]
	ldr r2, _0230544C ; =ov11_02322B8C
	add r1, sp, #0xc
	strh ip, [sp, #0xc]
	ldrh ip, [lr, #0x56]
	strh ip, [sp, #0xe]
	ldrh ip, [lr, #0x58]
	strh ip, [sp, #0x10]
	strb r4, [sp, #0xc]
	str r3, [lr, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0xda
	bl sub_0200D670
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r1, [r0]
	add r0, r1, #0xda
	str r0, [r1, #0x194]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mov r4, #0x15
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02306AC0 ; =0x00002FC5
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	add r2, r4, #0x2bc
#endif
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_0230508C:
	mov r4, #3
	str r4, [sp, #0x68]
	ldr r0, _02305454 ; =ov11_02322B98
	ldr r1, _02305458 ; =0x00300033
	ldr r3, _0230545C ; =ov11_02322BC8
	add r2, sp, #0x68
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_023050BC:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r4, _02305444 ; =ov11_02324D84
	ldr r0, _02305460 ; =ov11_02322BA8
	ldr lr, [r4]
	ldr r1, _02305464 ; =0x00001013
	ldrsh ip, [lr, #0x58]
	ldr r3, _02305468 ; =0x000008E4
	mov r2, #0
	str ip, [lr, #0x16c]
	ldr lr, [r4]
	ldrh ip, [lr, #0x56]
	add ip, ip, #0xbc
	str ip, [lr, #0x174]
	ldr r4, [r4]
	add ip, r4, #0x15c
	str ip, [sp]
	ldrsh r4, [r4, #0x58]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0230543C
_02305138:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #0
	ldr r2, [r0]
	ldrh r0, [r2, #0x54]
	strh r0, [sp, #0x12]
	ldrh r0, [r2, #0x56]
	strh r0, [sp, #0x14]
	ldrh r0, [r2, #0x58]
	strh r0, [sp, #0x16]
	strb r1, [sp, #0x12]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldrsh r3, [sp, #0x16]
	ldr r2, [r0]
	add r1, sp, #0x12
	str r3, [r2, #0x16c]
	ldr r0, [r0]
	ldr r2, _0230544C ; =ov11_02322B8C
	add r0, r0, #0x5a
	bl sub_0200D670
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _0230544C ; =ov11_02322B8C
	ldr r3, [r0]
	add r1, r3, #0x5a
	str r1, [r3, #0x194]
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	add r0, r1, #0xda
	bl sub_0200D670
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _0230546C ; =0x000002DF
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0xda
	str r3, [r4, #0x198]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	bl AddItemToBagNoHeld
	cmp r0, #0
	ldrne r0, _02305444 ; =ov11_02324D84
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0, #0x3c]
	ldreq r0, _02305444 ; =ov11_02324D84
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0x3c]
	b _0230543C
_0230523C:
	mov r0, r4
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _02305264
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_02305264:
	ldr r0, _02305444 ; =ov11_02324D84
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_0230527C:
	add r0, r4, #0x5a
	str r0, [r4, #0x19c]
	ldr r0, [r1]
	mov r1, #5
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mov r3, #5
	ldr r1, [r0]
	ldr r2, _02305470 ; =0x000002D6
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_023052D0:
	mov r4, #3
	str r4, [sp, #0x100]
	ldr r0, _02305454 ; =ov11_02322B98
	ldr r1, _02305458 ; =0x00300033
	ldr r3, _0230545C ; =ov11_02322BC8
	add r2, sp, #0x100
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02305300:
	mov r0, #9
	str r0, [r4, #0x38]
	bl ov11_02305488
	b _0230543C
_02305310:
	mov r0, #0xa
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305474 ; =0x000002DE
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x5a
	str r3, [r4, #0x19c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _0230543C
_02305348:
	ldr r0, _02305478 ; =ov11_02322BB8
	mov r4, #3
	ldr r3, _0230547C ; =ov11_02322BE0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02305374:
	ldrsb r0, [r4, #0x48]
	bl CloseDialogueBox
	ldr r0, _02305444 ; =ov11_02324D84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r4, [r0]
	bl GetNbItemsInBag
	ldr r2, _02305480 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _0230543C
_023053CC:
	bl GetNbItemsInBag
	ldr r2, _02305480 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305444 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _0230543C
_02305408:
	mov r0, #0xf
	str r0, [r4, #0x3c]
	ldr r0, [r1]
	mov r1, #0x16
	str r1, [r0, #0x38]
	bl ov11_02306194
	ldr r0, _02305444 ; =ov11_02324D84
	ldr r2, _02305484 ; =0x000002DA
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
_0230543C:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV11_02304DC8_OFFSET 0x2CD4
#else
#define OV11_02304DC8_OFFSET 0
#endif
_02305444: .word ov11_02324D84
_02305448: .word 0x000002D7 + OV11_02304DC8_OFFSET
#ifdef JAPAN
_02306AB0: .word 0x00002FB1
_02306AB4: .word 0x00002FAC
#endif
_0230544C: .word ov11_02322B8C
_02305450: .word 0x000002D9 + OV11_02304DC8_OFFSET
#ifdef JAPAN
_02306AC0: .word 0x00002FC5
#endif
_02305454: .word ov11_02322B98
_02305458: .word 0x00300033
_0230545C: .word ov11_02322BC8
_02305460: .word ov11_02322BA8
_02305464: .word 0x00001013
#ifdef JAPAN
_02305468: .word 0x00001D3C
_0230546C: .word 0x00002FB3
_02305470: .word 0x00002FCA
#else
_02305468: .word 0x000008E4
_0230546C: .word 0x000002DF
_02305470: .word 0x000002D6
#endif
_02305474: .word 0x000002DE + OV11_02304DC8_OFFSET
_02305478: .word ov11_02322BB8
_0230547C: .word ov11_02322BE0
_02305480: .word ov11_02304D94
_02305484: .word 0x000002DA + OV11_02304DC8_OFFSET
	arm_func_end ov11_02304DC8

	arm_func_start ov11_02305488
ov11_02305488: ; 0x02305488
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x198
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r4, [r0]
	ldr r1, [r4, #0x38]
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _02305AF4
_023054A8: ; jump table
	b _02305508 ; case 0
	b _02305560 ; case 1
	b _02305594 ; case 2
	b _023055DC ; case 3
	b _02305934 ; case 4
	b _02305988 ; case 5
	b _02305774 ; case 6
	b _02305AF4 ; case 7
	b _02305AF4 ; case 8
	b _02305AF4 ; case 9
	b _02305AF4 ; case 10
	b _023057F0 ; case 11
	b _023058F4 ; case 12
	b _023059B8 ; case 13
	b _023059C8 ; case 14
	b _02305A2C ; case 15
	b _02305A84 ; case 16
	b _02305AF4 ; case 17
	b _02305AF4 ; case 18
	b _02305A00 ; case 19
	b _0230569C ; case 20
	b _02305744 ; case 21
	b _02305AF4 ; case 22
	b _02305AC0 ; case 23
_02305508:
	bl IsBagFull
	cmp r0, #0
	beq _02305548
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r1, [r0]
	ldrb r0, [r1, #0x4c]
	cmp r0, #0
	beq _02305538
	mov r0, #0x17
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305538:
	mov r0, #1
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02305560
_02305548:
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305560:
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B00 ; =0x000002D7
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305594:
	mov r0, #3
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	ldr r2, _02307174 ; =0x00002FB1
#else
	rsb r2, r3, #0x2e0
#endif
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_023055DC:
#ifdef JAPAN
	ldr r1, _02307178 ; =0x00002FAC
	add r0, r4, #0x1b0
#else
	add r0, r4, #0x1b0
	mov r1, #0x2d8
#endif
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x148
	str r1, [r4, #0x2b0]
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _02305AFC ; =ov11_02324D84
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _02305B04 ; =ov11_02322B8C
	add r0, r1, #0x5a
	mov r3, #1
	bl sub_0200D310
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B08 ; =0x000002D9
	ldr r5, [r0]
	add ip, sp, #0x148
	ldrsh r3, [r5, #4]
	add r0, r4, #0x2b4
	mov r1, #0x100
	orr r3, r3, #0x10000
	str r3, [sp, #0x158]
	ldrh lr, [r5, #2]
	mov r3, #0
	str lr, [sp, #0x16c]
	ldrb lr, [r5]
	str lr, [sp, #0x170]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r2, #3
	str r2, [r4, #0x3b4]
	mov r0, #0
	strb r0, [r4, #0x3b8]
	mov r1, #1
	str r1, [r4, #0x4b8]
	str r2, [sp]
	ldr r3, _02305AFC ; =ov11_02324D84
	mov r1, #0x11
	ldr r3, [r3]
	mov r2, r0
	add r3, r3, #0x1b0
	bl CreateSimpleMenu
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_0230569C:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r4, #0
	ldr lr, [r0]
	mov r3, #0x15
	ldrh ip, [lr, #0x54]
	ldr r2, _02305B04 ; =ov11_02322B8C
	add r1, sp, #0x12
	strh ip, [sp, #0x12]
	ldrh ip, [lr, #0x56]
	strh ip, [sp, #0x14]
	ldrh ip, [lr, #0x58]
	strh ip, [sp, #0x16]
	strb r4, [sp, #0x12]
	str r3, [lr, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0xda
	bl sub_0200D670
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r1, [r0]
	add r0, r1, #0xda
	str r0, [r1, #0x194]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r4, #0x15
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02307184 ; =0x00002FC5
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	add r2, r4, #0x2bc
#endif
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305744:
	mov r4, #3
	str r4, [sp, #0xb0]
	ldr r0, _02305B0C ; =ov11_02322B98
	ldr r1, _02305B10 ; =0x00300033
	ldr r3, _02305B14 ; =ov11_02322BC8
	add r2, sp, #0xb0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_02305774:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r4, _02305AFC ; =ov11_02324D84
	ldr r0, _02305B18 ; =ov11_02322BA8
	ldr lr, [r4]
	ldr r1, _02305B1C ; =0x00001013
	ldrsh ip, [lr, #0x58]
	ldr r3, _02305B20 ; =0x000008E4
	mov r2, #0
	str ip, [lr, #0x16c]
	ldr lr, [r4]
	ldrh ip, [lr, #0x56]
	add ip, ip, #0xbc
	str ip, [lr, #0x174]
	ldr r4, [r4]
	add ip, r4, #0x15c
	str ip, [sp]
	ldrsh r4, [r4, #0x58]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _02305AF4
_023057F0:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #0
	ldr r2, [r0]
	ldrh r0, [r2, #0x54]
	strh r0, [sp, #0xc]
	ldrh r0, [r2, #0x56]
	strh r0, [sp, #0xe]
	ldrh r0, [r2, #0x58]
	strh r0, [sp, #0x10]
	strb r1, [sp, #0xc]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldrsh r3, [sp, #0x10]
	ldr r2, [r0]
	add r1, sp, #0xc
	str r3, [r2, #0x16c]
	ldr r0, [r0]
	ldr r2, _02305B04 ; =ov11_02322B8C
	add r0, r0, #0x5a
	bl sub_0200D670
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B04 ; =ov11_02322B8C
	ldr r3, [r0]
	add r1, r3, #0x5a
	str r1, [r3, #0x194]
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	add r0, r1, #0xda
	bl sub_0200D670
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B24 ; =0x000002DF
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0xda
	str r3, [r4, #0x198]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	bl AddItemToBagNoHeld
	cmp r0, #0
	ldrne r0, _02305AFC ; =ov11_02324D84
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0, #0x3c]
	ldreq r0, _02305AFC ; =ov11_02324D84
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0x3c]
	b _02305AF4
_023058F4:
	mov r0, r4
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _0230591C
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_0230591C:
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305934:
	add r1, r4, #0x5a
	str r1, [r4, #0x19c]
	ldr r0, [r0]
	mov r1, #5
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mov r3, #5
	ldr r1, [r0]
	ldr r2, _02305B28 ; =0x000002D6
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305988:
	mov r4, #3
	str r4, [sp, #0x18]
	ldr r0, _02305B0C ; =ov11_02322B98
	ldr r1, _02305B10 ; =0x00300033
	ldr r3, _02305B14 ; =ov11_02322BC8
	add r2, sp, #0x18
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_023059B8:
	mov r0, #9
	str r0, [r4, #0x38]
	bl ov11_02305488
	b _02305AF4
_023059C8:
	mov r0, #0xa
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B2C ; =0x000002DE
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x5a
	str r3, [r4, #0x19c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
	b _02305AF4
_02305A00:
	ldr r0, _02305B30 ; =ov11_02322BB8
	mov r4, #3
	ldr r3, _02305B34 ; =ov11_02322BE0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_02305A2C:
	ldrsb r0, [r4, #0x48]
	bl CloseDialogueBox
	ldr r0, _02305AFC ; =ov11_02324D84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r4, [r0]
	bl GetNbItemsInBag
	ldr r2, _02305B38 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _02305AF4
_02305A84:
	bl GetNbItemsInBag
	ldr r2, _02305B38 ; =ov11_02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305AFC ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _02305AF4
_02305AC0:
	mov r1, #0xf
	str r1, [r4, #0x3c]
	ldr r0, [r0]
	mov r1, #0x16
	str r1, [r0, #0x38]
	bl ov11_02306194
	ldr r0, _02305AFC ; =ov11_02324D84
	ldr r2, _02305B3C ; =0x000002DA
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowStringIdInDialogueBox
_02305AF4:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define OV11_02305488_OFFSET 0x2CD4
#else
#define OV11_02305488_OFFSET 0
#endif
_02305AFC: .word ov11_02324D84
_02305B00: .word 0x000002D7 + OV11_02305488_OFFSET
#ifdef JAPAN
_02307174: .word 0x00002FB1
_02307178: .word 0x00002FAC
#endif
_02305B04: .word ov11_02322B8C
_02305B08: .word 0x000002D9 + OV11_02305488_OFFSET
#ifdef JAPAN
_02307184: .word 0x00002FC5
#endif
_02305B0C: .word ov11_02322B98
_02305B10: .word 0x00300033
_02305B14: .word ov11_02322BC8
_02305B18: .word ov11_02322BA8
_02305B1C: .word 0x00001013
#ifdef JAPAN
_02305B20: .word 0x00001D3C
_02305B24: .word 0x00002FB3
_02305B28: .word 0x00002FCA
#else
_02305B20: .word 0x000008E4
_02305B24: .word 0x000002DF
_02305B28: .word 0x000002D6
#endif
_02305B2C: .word 0x000002DE + OV11_02305488_OFFSET
_02305B30: .word ov11_02322BB8
_02305B34: .word ov11_02322BE0
_02305B38: .word ov11_02304D94
_02305B3C: .word 0x000002DA + OV11_02305488_OFFSET
	arm_func_end ov11_02305488

	arm_func_start ov11_02305B40
ov11_02305B40: ; 0x02305B40
	stmdb sp!, {r4, lr}
	ldr r1, _02305B94 ; =ov11_02324D84
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _02305B84
	cmp r0, #0
	ldr r4, [r1, #0x1ac]
	ldrnesh r1, [r1, #0x58]
	strneh r1, [r0]
	ldr r0, _02305B94 ; =ov11_02324D84
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02305B94 ; =ov11_02324D84
	mov r1, #0
	str r1, [r0]
	b _02305B8C
_02305B84:
	cmp r0, #0
	strneh r4, [r0]
_02305B8C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02305B94: .word ov11_02324D84
	arm_func_end ov11_02305B40

	arm_func_start ov11_02305B98
ov11_02305B98: ; 0x02305B98
	stmdb sp!, {r3, lr}
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r3, [r0]
	ldr r1, [r3, #0x50]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02306140
_02305BB4: ; jump table
	b _02305BC4 ; case 0
	b _02305BD0 ; case 1
	b _02306120 ; case 2
	b _02306138 ; case 3
_02305BC4:
	mov r0, #1
	str r0, [r3, #0x50]
	b _02306140
_02305BD0:
	ldr r1, [r3, #0x38]
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	b _02306090
_02305BE0: ; jump table
	b _023060C0 ; case 0
	b _02306090 ; case 1
	b _02306090 ; case 2
	b _02305C3C ; case 3
	b _02306090 ; case 4
	b _02305CC4 ; case 5
	b _02305FE0 ; case 6
	b _0230602C ; case 7
	b _02306038 ; case 8
	b _02306044 ; case 9
	b _02306044 ; case 10
	b _02306090 ; case 11
	b _023060C0 ; case 12
	b _02306090 ; case 13
	b _02306090 ; case 14
	b _02305D08 ; case 15
	b _02305D08 ; case 16
	b _02305ECC ; case 17
	b _02305F00 ; case 18
	b _02305F24 ; case 19
	b _02306090 ; case 20
	b _02305C80 ; case 21
	b _02306050 ; case 22
_02305C3C:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _02305C70
	cmp r0, #2
	beq _02305C60
	cmp r0, #3
	beq _02305C70
	b _023060C0
_02305C60:
	bl ov11_0230614C
	mov r0, #0x17
	bl ov11_02304DC8
	b _023060C0
_02305C70:
	bl ov11_0230614C
	mov r0, #4
	bl ov11_02304DC8
	b _023060C0
_02305C80:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _02305CB4
	cmp r0, #2
	beq _02305CA4
	cmp r0, #3
	beq _02305CB4
	b _023060C0
_02305CA4:
	bl ov11_0230614C
	mov r0, #0xb
	bl ov11_02304DC8
	b _023060C0
_02305CB4:
	bl ov11_0230614C
	mov r0, #0x17
	bl ov11_02304DC8
	b _023060C0
_02305CC4:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _02305CF8
	cmp r0, #2
	beq _02305CE8
	cmp r0, #3
	beq _02305CF8
	b _023060C0
_02305CE8:
	bl ov11_0230614C
	mov r0, #0xe
	bl ov11_02304DC8
	b _023060C0
_02305CF8:
	bl ov11_0230614C
	mov r0, #0
	bl ov11_02304DC8
	b _023060C0
_02305D08:
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _02305D9C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl IsInventoryMenuState3
	cmp r0, #0
	beq _02305D9C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCDA8
	cmp r0, #0
	blt _02305D9C
	ldr r1, _02306148 ; =ov11_02324D84
	ldr r1, [r1]
	str r0, [r1, #0x44]
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCD10
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #6
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305D9C:
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl IsInventoryMenuState3
	cmp r0, #0
	beq _02305E44
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl PopInventoryMenuField0x1A3
	ldrh r1, [sp]
	tst r1, #4
	cmpeq r0, #0
	beq _02305E44
	cmp r0, #0
	bne _02305DE4
	mov r0, #5
	bl PlaySeVolumeWrapper
_02305DE4:
	bl SortItemsInBag
	bl GetNbItemsInBag
	ldr r2, _02306148 ; =ov11_02324D84
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCC60
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCCB0
	bl IsBagFull
	cmp r0, #0
	bne _02305E44
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x11
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305E44:
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl CheckInventoryMenuField0x1A0
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCDBC
	mvn r1, #0
	cmp r0, r1
	bne _02305EB4
	ldr r1, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r2, [r1]
	mov r0, #0x11
	str r3, [r2, #0x40]
	ldr r1, [r1]
	str r3, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305EB4:
	ldr r1, _02306148 ; =ov11_02324D84
	ldr r1, [r1]
	str r0, [r1, #0x44]
	mov r0, #0x13
	bl ov11_02304DC8
	b _023060C0
_02305ECC:
	ldr r2, [r3, #0x40]
	sub r1, r2, #1
	str r1, [r3, #0x40]
	cmp r2, #0
	bne _023060C0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl CloseInventoryMenu
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F00:
	ldr r2, [r3, #0x40]
	sub r1, r2, #1
	str r1, [r3, #0x40]
	cmp r2, #0
	bne _023060C0
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F24:
	ldrsb r0, [r3, #0x4a]
	bl GetSimpleMenuResult
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _023060C0
_02305F38: ; jump table
	b _023060C0 ; case 0
	b _02305FBC ; case 1
	b _023060C0 ; case 2
	b _023060C0 ; case 3
	b _02305F54 ; case 4
	b _02305F80 ; case 5
	b _02305FBC ; case 6
_02305F54:
	bl ov11_0230614C
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x11
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F80:
	bl ov11_0230614C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl SetInventoryMenuState6
	ldr r0, _02306148 ; =ov11_02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #6
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305FBC:
	bl ov11_0230614C
	ldr r0, _02306148 ; =ov11_02324D84
	mov r2, #0xf
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCC7C
	b _023060C0
_02305FE0:
	ldrsb r0, [r3, #0x4b]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4b]
	bl CloseScrollBox
	ldr r0, _02306148 ; =ov11_02324D84
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0xf
	strb r3, [r1, #0x4b]
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl SetInventoryMenuState0
	b _023060C0
_0230602C:
	bl ov11_022DC504
	mov r2, #3
	b _023060C4
_02306038:
	bl ov11_022DC504
	mov r2, #2
	b _023060C4
_02306044:
	bl ov11_022DC504
	mov r2, #5
	b _023060C4
_02306050:
	ldrsb r0, [r3, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02306148 ; =ov11_02324D84
	mov r2, #0x18
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	b _023060C0
_02306090:
	ldrsb r0, [r3, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
_023060C0:
	mov r2, #1
_023060C4:
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r1, [r0]
	str r2, [r1, #0x1ac]
	ldr r2, [r0]
	ldr r1, [r2, #0x1ac]
	cmp r1, #1
	beq _02306140
	cmp r1, #2
	moveq r1, #3
	streq r1, [r2, #0x1ac]
	ldreq r0, [r0]
	streq r1, [r0, #0x50]
	beq _02306140
	mov r1, #2
	str r1, [r2, #0x50]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202836C
	ldr r0, _02306148 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	b _02306140
_02306120:
	mov r1, #3
	str r1, [r3, #0x50]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl CloseDialogueBox
	b _02306140
_02306138:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02306140:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02306148: .word ov11_02324D84
	arm_func_end ov11_02305B98

	arm_func_start ov11_0230614C
ov11_0230614C: ; 0x0230614C
	stmdb sp!, {r3, lr}
	ldr r0, _02306190 ; =ov11_02324D84
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02306190 ; =ov11_02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	bl CloseSimpleMenu
	ldr r0, _02306190 ; =ov11_02324D84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4a]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02306190: .word ov11_02324D84
	arm_func_end ov11_0230614C

	arm_func_start ov11_02306194
ov11_02306194: ; 0x02306194
	stmdb sp!, {r3, lr}
	ldr r1, _023061C8 ; =ov11_02324D84
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x48]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _023061C8 ; =ov11_02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x48]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023061C8: .word ov11_02324D84
	arm_func_end ov11_02306194

	arm_func_start ov11_023061CC
ov11_023061CC: ; 0x023061CC
	ldr ip, _023061E0 ; =ov11_023061FC
#ifdef JAPAN
	mov r1, #0
	mov r2, #1
#else
	mov r2, #1
	mov r3, r2
	mov r1, #3
#endif
	bx ip
	.align 2, 0
_023061E0: .word ov11_023061FC
	arm_func_end ov11_023061CC

	arm_func_start ov11_023061E4
ov11_023061E4: ; 0x023061E4
	ldr ip, _023061F8 ; =ov11_023061FC
	mov r2, r1
	mov r1, #3
#ifndef JAPAN
	mov r3, #0
#endif
	bx ip
	.align 2, 0
_023061F8: .word ov11_023061FC
	arm_func_end ov11_023061E4

	arm_func_start ov11_023061FC
ov11_023061FC: ; 0x023061FC
#ifdef JAPAN
#define OV11_023061FC_OFFSET -4
#else
#define OV11_023061FC_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _023062B8 ; =ov11_02324D88
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	mov r4, r2
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _023062B8 ; =ov11_02324D88
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	mov r5, r2
	mov r4, r3
#endif
	cmp r0, #0
	bne _02306234
	mov r0, #0x124 + OV11_023061FC_OFFSET
	mov r1, #8
	bl MemAlloc
	ldr r1, _023062B8 ; =ov11_02324D88
	str r0, [r1]
_02306234:
	ldr r0, _023062B8 ; =ov11_02324D88
	mov r2, #0
	ldr r1, [r0]
#ifdef JAPAN
	str r5, [r1, #0x84]
	ldr r1, [r0]
	strb r4, [r1, #0x20]
	ldr r1, [r0]
	str r6, [r1]
#else
	str r4, [r1, #0x24]
	ldr r1, [r0]
	str r6, [r1, #0x88]
	ldr r1, [r0]
	strb r5, [r1, #0x20]
	ldr r1, [r0]
	str r7, [r1]
#endif
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	add r0, r0, #0x30 + OV11_023061FC_OFFSET
	bl InitPreprocessorArgs
	ldr r1, _023062B8 ; =ov11_02324D88
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #2
	str r0, [r2, #0x7c + OV11_023061FC_OFFSET]
	ldr r2, [r1]
	str r0, [r2, #0x30 + OV11_023061FC_OFFSET]
	ldr r2, [r1]
	str r0, [r2, #0x28 + OV11_023061FC_OFFSET]
	ldr r2, [r1]
	strb r3, [r2, #0x21]
	ldr r2, [r1]
	strb r3, [r2, #0x22]
	ldr r1, [r1]
	str r0, [r1, #0x80 + OV11_023061FC_OFFSET]
	bl ov11_023062BC
	mov r0, #1
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_023062B8: .word ov11_02324D88
	arm_func_end ov11_023061FC

	arm_func_start ov11_023062BC
ov11_023062BC: ; 0x023062BC
#ifdef JAPAN
#define OV11_023062BC_OFFSET -4
#else
#define OV11_023062BC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x7c
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	ldr r0, [r2, #0x10]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _02306760
_023062E4: ; jump table
	b _02306344 ; case 0
	b _02306388 ; case 1
	b _023063BC ; case 2
	b _02306404 ; case 3
	b _02306430 ; case 4
	b _02306474 ; case 5
	b _023064B8 ; case 6
	b _02306760 ; case 7
	b _02306760 ; case 8
	b _02306760 ; case 9
	b _02306760 ; case 10
	b _02306524 ; case 11
	b _023065CC ; case 12
	b _02306760 ; case 13
	b _02306600 ; case 14
	b _023066F4 ; case 15
	b _02306760 ; case 16
	b _0230671C ; case 17
	b _02306760 ; case 18
	b _02306610 ; case 19
	b _0230663C ; case 20
	b _0230666C ; case 21
	b _02306760 ; case 22
	b _0230672C ; case 23
_02306344:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02306370
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306388
_02306370:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306760
_02306388:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _02307D74 ; =0x00002FB4
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	ldr r3, [r0]
	mov r2, #0x2e0
#endif
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306760
_023063BC:
	mov r0, #3
	str r0, [r2, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	rsb r2, r3, #0x2fc0
#else
	rsb r2, r3, #0x2ec
#endif
	str r3, [r1, #0x14]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306760
_02306404:
	ldr r0, _0230676C ; =ov11_02322C10
	mov r4, #3
	ldr r1, _02306770 ; =0x00300011
	ldr r3, _02306774 ; =ov11_02322C38
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306760
_02306430:
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r2, _02306778 ; =0x000002EA
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306474:
	mov r0, #3
	str r0, [r2, #0x8c + OV11_023062BC_OFFSET]
	mov r0, #2
	str r0, [sp]
	ldr r2, [r1]
	ldr r0, _0230676C ; =ov11_02322C10
	ldr r1, _0230677C ; =0x00300031
	ldr r3, _02306780 ; =ov11_02322C20
	add r2, r2, #0x8c + OV11_023062BC_OFFSET
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306768 ; =ov11_02324D88
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #0x22]
	ldr r0, [r1]
	str r2, [r0, #0x14]
	b _02306760
_023064B8:
	ldrsb r0, [r2, #0x22]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02306760
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl GetSimpleMenuResult
	ldr r1, _02306768 ; =ov11_02324D88
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x22]
	bl CloseSimpleMenu
	cmp r4, #2
	beq _023064FC
	cmp r4, #3
	b _02306510
_023064FC:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306510:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306524:
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	beq _02306538
	mov r0, #3
	bl sub_02017C50
_02306538:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x2c + OV11_023062BC_OFFSET]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _02307D90_JP ; =0x00002FB8
	ldr ip, [r0]
	mov r1, #0x218
#else
	mov r1, #0x218
	ldr ip, [r0]
	mov r2, #0x2e4
#endif
	ldr r3, [ip, #4]
	ldrsh r3, [r3, #4]
	str r3, [ip, #0x30 + OV11_023062BC_OFFSET]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl sub_02055B20
#ifndef JAPAN
	bl sub_0203AF0C
#endif
	bl sub_02057180
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r1, #8]
	beq _02306760
	bl sub_02055D4C
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
	b _02306760
_023065CC:
	ldr r0, [r2]
	cmp r0, #0
	beq _023065E8
	bl sub_02055D4C
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
_023065E8:
	ldr r0, _02306768 ; =ov11_02324D88
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306760
_02306600:
	mov r0, #0xa
	str r0, [r2, #0x10]
	bl ov11_02306794
	b _02306760
_02306610:
	ldr r0, _02306784 ; =ov11_02322C00
	mov ip, #4
	ldr r3, _02306788 ; =ov11_02322C50
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306760
_0230663C:
	ldrsh r1, [r2, #0xc]
	add r0, sp, #4
	bl sub_0205B028
	ldr r1, _02306768 ; =ov11_02324D88
	add r0, sp, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x88 + OV11_023062BC_OFFSET]
	bl sub_0203F150
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x84 + OV11_023062BC_OFFSET]
	b _02306760
_0230666C:
#ifdef JAPAN
	ldr r0, _0230678C ; =TEAM_MEMBER_TABLE_PTR
	ldrsh r2, [r2, #0xc]
	ldr r1, [r0]
	mov r0, #0x44
#else
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _023066C0
	bl sub_0205633C
	cmp r0, #0
	beq _023066C0
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _023066C0
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	b _02306760
_023066C0:
	ldr r1, _02306768 ; =ov11_02324D88
	ldr r0, _0230678C ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	ldr r1, [r0]
	ldrsh r2, [r2, #0xc]
	mov r0, #0x44
	mov r3, #0
#endif
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
#ifdef JAPAN
	mov r3, #0
#endif
	bl PrintIqSkillsMenu
	b _02306760
_023066F4:
	ldrsb r0, [r2, #0x21]
	bl CloseDialogueBox
	ldr r0, _02306768 ; =ov11_02324D88
	mvn r3, #1
	ldr r2, [r0]
	mov r0, #4
	mov r1, #0
	strb r3, [r2, #0x21]
	bl sub_02039C2C
	b _02306760
_0230671C:
	mov r0, #4
	mov r1, #0
	bl sub_02039C2C
	b _02306760
_0230672C:
	mov r0, #0xf
	str r0, [r2, #0x14]
	ldr r0, [r1]
	mov r1, #0x16
	str r1, [r0, #0x10]
	bl ov11_0230720C
	ldr r0, _02306768 ; =ov11_02324D88
	ldr r2, _02306790 ; =0x000002E3
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_023062BC_OFFSET
	bl ShowStringIdInDialogueBox
_02306760:
	add sp, sp, #0x7c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02306768: .word ov11_02324D88
#ifdef JAPAN
_02307D74: .word 0x00002FB4
#endif
_0230676C: .word ov11_02322C10
_02306770: .word 0x00300011
_02306774: .word ov11_02322C38
#ifdef JAPAN
_02306778: .word 0x00002FBE
#else
_02306778: .word 0x000002EA
#endif
_0230677C: .word 0x00300031
_02306780: .word ov11_02322C20
#ifdef JAPAN
_02307D90_JP: .word 0x00002FB8
#endif
_02306784: .word ov11_02322C00
_02306788: .word ov11_02322C50
_0230678C: .word TEAM_MEMBER_TABLE_PTR
#ifdef JAPAN
_02306790: .word 0x00002FB7
#else
_02306790: .word 0x000002E3
#endif
	arm_func_end ov11_023062BC

	arm_func_start ov11_02306794
ov11_02306794: ; 0x02306794
#ifdef JAPAN
#define OV11_02306794_OFFSET -4
#else
#define OV11_02306794_OFFSET 0
#endif
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x7c
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r2, [r0]
	ldr r1, [r2, #0x10]
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _02306C30
_023067B4: ; jump table
	b _02306814 ; case 0
	b _02306858 ; case 1
	b _0230688C ; case 2
	b _023068D4 ; case 3
	b _02306900 ; case 4
	b _02306944 ; case 5
	b _02306988 ; case 6
	b _02306C30 ; case 7
	b _02306C30 ; case 8
	b _02306C30 ; case 9
	b _02306C30 ; case 10
	b _023069F4 ; case 11
	b _02306A9C ; case 12
	b _02306C30 ; case 13
	b _02306AD0 ; case 14
	b _02306BC4 ; case 15
	b _02306C30 ; case 16
	b _02306BEC ; case 17
	b _02306C30 ; case 18
	b _02306AE0 ; case 19
	b _02306B0C ; case 20
	b _02306B3C ; case 21
	b _02306C30 ; case 22
	b _02306BFC ; case 23
_02306814:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02306840
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306858
_02306840:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306C30
_02306858:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _023081EC ; =0x00002FB4
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	ldr r3, [r0]
	mov r2, #0x2e0
#endif
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306C30
_0230688C:
	mov r0, #3
	str r0, [r2, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r3, #3
	ldr r1, [r0]
#ifdef JAPAN
	rsb r2, r3, #0x2fc0
#else
	rsb r2, r3, #0x2ec
#endif
	str r3, [r1, #0x14]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	b _02306C30
_023068D4:
	ldr r0, _02306C3C ; =ov11_02322C10
	mov r4, #3
	ldr r1, _02306C40 ; =0x00300011
	ldr r3, _02306C44 ; =ov11_02322C38
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306C30
_02306900:
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r2, _02306C48 ; =0x000002EA
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_02306944:
	mov r1, #3
	str r1, [r2, #0x8c + OV11_02306794_OFFSET]
	mov r1, #2
	str r1, [sp]
	ldr r2, [r0]
	ldr r0, _02306C3C ; =ov11_02322C10
	ldr r1, _02306C4C ; =0x00300031
	ldr r3, _02306C50 ; =ov11_02322C20
	add r2, r2, #0x8c + OV11_02306794_OFFSET
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306C38 ; =ov11_02324D88
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #0x22]
	ldr r0, [r1]
	str r2, [r0, #0x14]
	b _02306C30
_02306988:
	ldrsb r0, [r2, #0x22]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02306C30
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl GetSimpleMenuResult
	ldr r1, _02306C38 ; =ov11_02324D88
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x22]
	bl CloseSimpleMenu
	cmp r4, #2
	beq _023069CC
	cmp r4, #3
	b _023069E0
_023069CC:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_023069E0:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_023069F4:
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	beq _02306A08
	mov r0, #3
	bl sub_02017C50
_02306A08:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x2c + OV11_02306794_OFFSET]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
#ifdef JAPAN
	ldr r2, _02308208 ; =0x00002FB8
	ldr ip, [r0]
	mov r1, #0x218
#else
	mov r1, #0x218
	ldr ip, [r0]
	mov r2, #0x2e4
#endif
	ldr r3, [ip, #4]
	ldrsh r3, [r3, #4]
	str r3, [ip, #0x30 + OV11_02306794_OFFSET]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl sub_02055B20
#ifndef JAPAN
	bl sub_0203AF0C
#endif
	bl sub_02057180
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r1, #8]
	beq _02306C30
	bl sub_02055D4C
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
	b _02306C30
_02306A9C:
	ldr r0, [r2]
	cmp r0, #0
	beq _02306AB8
	bl sub_02055D4C
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
_02306AB8:
	ldr r0, _02306C38 ; =ov11_02324D88
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306C30
_02306AD0:
	mov r0, #0xa
	str r0, [r2, #0x10]
	bl ov11_02306794
	b _02306C30
_02306AE0:
	ldr r0, _02306C54 ; =ov11_02322C00
	mov ip, #4
	ldr r3, _02306C58 ; =ov11_02322C50
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306C30
_02306B0C:
	ldrsh r1, [r2, #0xc]
	add r0, sp, #4
	bl sub_0205B028
	ldr r1, _02306C38 ; =ov11_02324D88
	add r0, sp, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x88 + OV11_02306794_OFFSET]
	bl sub_0203F150
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x84 + OV11_02306794_OFFSET]
	b _02306C30
_02306B3C:
#ifdef JAPAN
	ldr r0, _02306C5C ; =TEAM_MEMBER_TABLE_PTR
	ldrsh r2, [r2, #0xc]
	ldr r1, [r0]
	mov r0, #0x44
#else
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _02306B90
	bl sub_0205633C
	cmp r0, #0
	beq _02306B90
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _02306B90
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	b _02306C30
_02306B90:
	ldr r1, _02306C38 ; =ov11_02324D88
	ldr r0, _02306C5C ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	ldr r1, [r0]
	ldrsh r2, [r2, #0xc]
	mov r0, #0x44
	mov r3, #0
#endif
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
#ifdef JAPAN
	mov r3, #0
#endif
	bl PrintIqSkillsMenu
	b _02306C30
_02306BC4:
	ldrsb r0, [r2, #0x21]
	bl CloseDialogueBox
	ldr r0, _02306C38 ; =ov11_02324D88
	mvn r3, #1
	ldr r2, [r0]
	mov r0, #4
	mov r1, #0
	strb r3, [r2, #0x21]
	bl sub_02039C2C
	b _02306C30
_02306BEC:
	mov r0, #4
	mov r1, #0
	bl sub_02039C2C
	b _02306C30
_02306BFC:
	mov r1, #0xf
	str r1, [r2, #0x14]
	ldr r0, [r0]
	mov r1, #0x16
	str r1, [r0, #0x10]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =ov11_02324D88
	ldr r2, _02306C60 ; =0x000002E3
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30 + OV11_02306794_OFFSET
	bl ShowStringIdInDialogueBox
_02306C30:
	add sp, sp, #0x7c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02306C38: .word ov11_02324D88
#ifdef JAPAN
_023081EC: .word 0x00002FB4
#endif
_02306C3C: .word ov11_02322C10
_02306C40: .word 0x00300011
_02306C44: .word ov11_02322C38
#ifdef JAPAN
_02306C48: .word 0x00002FBE
#else
_02306C48: .word 0x000002EA
#endif
_02306C4C: .word 0x00300031
_02306C50: .word ov11_02322C20
#ifdef JAPAN
_02308208: .word 0x00002FB8
#endif
_02306C54: .word ov11_02322C00
_02306C58: .word ov11_02322C50
_02306C5C: .word TEAM_MEMBER_TABLE_PTR
#ifdef JAPAN
_02306C60: .word 0x00002FB7
#else
_02306C60: .word 0x000002E3
#endif
	arm_func_end ov11_02306794

	arm_func_start ov11_02306C64
ov11_02306C64: ; 0x02306C64
	stmdb sp!, {r4, lr}
	ldr r0, _02306C98 ; =ov11_02324D88
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _02306C90
	ldr r4, [r0, #8]
	bl MemFree
	ldr r0, _02306C98 ; =ov11_02324D88
	mov r1, #0
	str r1, [r0]
_02306C90:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02306C98: .word ov11_02324D88
	arm_func_end ov11_02306C64

	arm_func_start ov11_02306C9C
ov11_02306C9C: ; 0x02306C9C
#ifdef JAPAN
#define OV11_02306C9C_OFFSET -4
#else
#define OV11_02306C9C_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r2, [r0]
	ldr r1, [r2, #0x28 + OV11_02306C9C_OFFSET]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _023071B8
_02306CB8: ; jump table
	b _02306CC8 ; case 0
	b _02306CD4 ; case 1
	b _0230717C ; case 2
	b _023071B0 ; case 3
_02306CC8:
	mov r0, #1
	str r0, [r2, #0x28 + OV11_02306C9C_OFFSET]
	b _023071B8
_02306CD4:
	ldr r0, [r2, #0x10]
	cmp r0, #0x16
	addls pc, pc, r0, lsl #2
	b _023070B0
_02306CE4: ; jump table
	b _02307120 ; case 0
	b _023070B0 ; case 1
	b _023070B0 ; case 2
	b _02306D40 ; case 3
	b _023070B0 ; case 4
	b _023070B0 ; case 5
	b _023070B0 ; case 6
	b _023070E4 ; case 7
	b _02307058 ; case 8
	b _02307060 ; case 9
	b _02307068 ; case 10
	b _023070B0 ; case 11
	b _02307120 ; case 12
	b _02307104 ; case 13
	b _023070B0 ; case 14
	b _02306DE8 ; case 15
	b _02306DDC ; case 16
	b _02306DE8 ; case 17
	b _02306ED0 ; case 18
	b _02306EFC ; case 19
	b _02306FDC ; case 20
	b _02307018 ; case 21
	b _02307070 ; case 22
_02306D40:
	ldrsb r0, [r2, #0x22]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _023071C0 ; =ov11_02324D88
	ldrne r1, [r1]
	strne r0, [r1, #0x1c]
	cmp r0, #1
	beq _02306D84
	cmp r0, #2
	beq _02306D74
	cmp r0, #3
	beq _02306D84
	b _02307120
_02306D74:
	bl ov11_023071C4
	mov r0, #0x17
	bl ov11_023062BC
	b _02307120
_02306D84:
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	beq _02306DA0
	mov r0, #3
	bl sub_02017C50
_02306DA0:
	bl ov11_023071C4
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl CloseDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0xa
	strb r3, [r1, #0x21]
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #0x2c + OV11_02306C9C_OFFSET]
	bl ov11_023062BC
	b _02307120
_02306DDC:
	mov r0, #0x11
	bl ov11_023062BC
	b _02307120
_02306DE8:
	bl sub_0203A5A8
	cmp r0, #0
	beq _02306E70
	bl sub_0203A9EC
	cmp r0, #0
	beq _02307120
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _02307120
	bl sub_0203AAB0
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	strh r0, [r1, #0xc]
	bl GetTeamMember
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #4]
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_0203A5F0
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #0xc
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306E70:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _02306EA8
	bl sub_0203A51C
	ldr r1, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r2, [r1]
	mov r0, #0x12
	str r3, [r2, #0x18]
	ldr r1, [r1]
	str r3, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306EA8:
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	strh r0, [r1, #0xc]
	bl GetTeamMember
	ldr r1, _023071C0 ; =ov11_02324D88
	ldr r1, [r1]
	str r0, [r1, #4]
	mov r0, #0x13
	bl ov11_023062BC
	b _02307120
_02306ED0:
	ldr r1, [r2, #0x18]
	sub r0, r1, #1
	str r0, [r2, #0x18]
	cmp r1, #0
	bne _02307120
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov11_023062BC
	b _02307120
_02306EFC:
	ldrsb r0, [r2, #0x22]
	bl GetSimpleMenuResult
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02307120
_02306F10: ; jump table
	b _02307120 ; case 0
	b _02306FC0 ; case 1
	b _02307120 ; case 2
	b _02307120 ; case 3
	b _02306F30 ; case 4
	b _02306F60 ; case 5
	b _02306F90 ; case 6
	b _02306FC0 ; case 7
_02306F30:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #4
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306F60:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306F90:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x15
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306FC0:
	bl ov11_023071C4
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl sub_0203A638
	b _02307120
_02306FDC:
	bl sub_0203F398
	cmp r0, #1
	bne _02307120
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x84 + OV11_02306C9C_OFFSET]
	bl sub_0202836C
	bl sub_0203F990
	ldr r0, _023071C0 ; =ov11_02324D88
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1, #0x84 + OV11_02306C9C_OFFSET]
	bl ov11_023062BC
	b _02307120
_02307018:
	bl sub_02041B7C
	cmp r0, #1
	bne _02307120
	bl sub_020420F4
#ifndef JAPAN
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _0230704C
	bl sub_0205633C
	cmp r0, #0
	bne _0230704C
#endif
	bl sub_020572EC
_0230704C:
	mov r0, #0x10
	bl ov11_023062BC
	b _02307120
_02307058:
	mov r2, #3
	b _02307124
_02307060:
	mov r2, #2
	b _02307124
_02307068:
	mov r2, #4
	b _02307124
_02307070:
	ldrsb r0, [r2, #0x21]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02307120
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	mov r2, #0x18
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl sub_0202F2C4
	b _02307120
_023070B0:
	ldrsb r0, [r2, #0x21]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02307120
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov11_023062BC
	b _02307120
_023070E4:
	ldr r1, [r2, #0x2c + OV11_02306C9C_OFFSET]
	sub r0, r1, #1
	str r0, [r2, #0x2c + OV11_02306C9C_OFFSET]
	cmp r1, #0
	bgt _02307120
	mov r0, #8
	bl ov11_023062BC
	b _02307120
_02307104:
	ldr r1, [r2, #0x2c + OV11_02306C9C_OFFSET]
	sub r0, r1, #1
	str r0, [r2, #0x2c + OV11_02306C9C_OFFSET]
	cmp r1, #0
	bgt _02307120
	mov r0, #0xe
	bl ov11_023062BC
_02307120:
	mov r2, #1
_02307124:
	ldr r0, _023071C0 ; =ov11_02324D88
	ldr r1, [r0]
	str r2, [r1, #0x80 + OV11_02306C9C_OFFSET]
	ldr r2, [r0]
	ldr r1, [r2, #0x80 + OV11_02306C9C_OFFSET]
	cmp r1, #1
	beq _023071B8
	cmp r1, #2
	moveq r1, #3
	streq r1, [r2, #0x80 + OV11_02306C9C_OFFSET]
	ldreq r0, [r0]
	streq r1, [r0, #0x28 + OV11_02306C9C_OFFSET]
	beq _023071B8
	mov r1, #2
	str r1, [r2, #0x28 + OV11_02306C9C_OFFSET]
	ldr r0, [r0]
	sub r1, r1, #4
	ldrsb r0, [r0, #0x21]
	cmp r0, r1
	beq _023071B8
	bl sub_0202F2C4
	b _023071B8
_0230717C:
	mov r1, #3
	str r1, [r2, #0x28 + OV11_02306C9C_OFFSET]
	ldr r0, [r0]
	sub r1, r1, #5
	ldrsb r0, [r0, #0x21]
	cmp r0, r1
	beq _023071B8
	bl CloseDialogueBox
	ldr r0, _023071C0 ; =ov11_02324D88
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x21]
	b _023071B8
_023071B0:
	ldr r0, [r2, #0x80 + OV11_02306C9C_OFFSET]
	ldmia sp!, {r3, pc}
_023071B8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023071C0: .word ov11_02324D88
	arm_func_end ov11_02306C9C

	arm_func_start ov11_023071C4
ov11_023071C4: ; 0x023071C4
	stmdb sp!, {r3, lr}
	ldr r0, _02307208 ; =ov11_02324D88
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02307208 ; =ov11_02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl CloseSimpleMenu
	ldr r0, _02307208 ; =ov11_02324D88
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x22]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02307208: .word ov11_02324D88
	arm_func_end ov11_023071C4

	arm_func_start ov11_0230720C
ov11_0230720C: ; 0x0230720C
	stmdb sp!, {r3, lr}
	ldr r1, _02307240 ; =ov11_02324D88
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x21]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02307240 ; =ov11_02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x21]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02307240: .word ov11_02324D88
	arm_func_end ov11_0230720C

	arm_func_start ov11_02307244
ov11_02307244: ; 0x02307244
	stmdb sp!, {r3, lr}
	mov r0, #0x330
	mov r1, #8
	bl MemAlloc
	ldr r1, _023072FC ; =ov11_02324D8C
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x31c
	bl sub_020580C4
	ldr r2, _023072FC ; =ov11_02324D8C
	mvn lr, #1
	ldr r0, [r2]
	add ip, lr, #1
	strb lr, [r0, #4]
	ldr r0, [r2]
	mov r3, #0
	strb lr, [r0, #5]
	ldr r1, [r2]
	mov r0, #1
	strb lr, [r1, #6]
	ldr r1, [r2]
	strb lr, [r1, #7]
	ldr r1, [r2]
	strb lr, [r1, #8]
	ldr r1, [r2]
	strb lr, [r1, #9]
	ldr r1, [r2]
	strb lr, [r1, #0xa]
	ldr r1, [r2]
	strb lr, [r1, #0xb]
	ldr r1, [r2]
	strb lr, [r1, #0xc]
	ldr r1, [r2]
	str ip, [r1, #0x18]
	ldr r1, [r2]
	str r3, [r1, #0x10]
	ldr r1, [r2]
	add r1, r1, #0x200
	strh ip, [r1, #0x54]
	ldr r1, [r2]
	str r3, [r1]
	ldr r1, [r2]
	str r3, [r1, #0x324]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023072FC: .word ov11_02324D8C
	arm_func_end ov11_02307244

	arm_func_start ov11_02307300
ov11_02307300: ; 0x02307300
	stmdb sp!, {r4, lr}
	ldr ip, _02307330 ; =ov11_02324D8C
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add ip, r2, r1
	mov r2, #1
	mov r4, r0
	strb lr, [ip, #0x104]
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02307330: .word ov11_02324D8C
	arm_func_end ov11_02307300

	arm_func_start ov11_02307334
ov11_02307334: ; 0x02307334
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x5a0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r4, [r0]
	ldr r1, [r4]
	cmp r1, #0x29
	addls pc, pc, r1, lsl #2
	b _02308CF0
_02307354: ; jump table
	b _023073FC ; case 0
	b _023074B8 ; case 1
	b _02307464 ; case 2
	b _023078D4 ; case 3
	b _02308844 ; case 4
	b _02308940 ; case 5
	b _023089C0 ; case 6
	b _02308A14 ; case 7
	b _02308A54 ; case 8
	b _02308A88 ; case 9
	b _02308AB4 ; case 10
	b _02308B70 ; case 11
	b _02308BB0 ; case 12
	b _02308C4C ; case 13
	b _02308C84 ; case 14
	b _02308C90 ; case 15
	b _02308CE8 ; case 16
	b _02307A14 ; case 17
	b _02307A30 ; case 18
	b _02307C14 ; case 19
	b _02307CD0 ; case 20
	b _02307D08 ; case 21
	b _02307E68 ; case 22
	b _02307F20 ; case 23
	b _02307F58 ; case 24
	b _02307F84 ; case 25
	b _02308658 ; case 26
	b _0230871C ; case 27
	b _02308748 ; case 28
	b _023087A0 ; case 29
	b _023087D4 ; case 30
	b _023081D0 ; case 31
	b _02308214 ; case 32
	b _02308054 ; case 33
	b _023080BC ; case 34
	b _023083E0 ; case 35
	b _02308450 ; case 36
	b _02308470 ; case 37
	b _023084AC ; case 38
	b _023085C8 ; case 39
	b _02308614 ; case 40
	b _0230880C ; case 41
_023073FC:
	bl GetNbItemsInBag
	ldr r2, _023082B8 ; =ov11_02307300
	add r1, r4, #0x31c
	str r2, [sp]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x10]
	add r3, r4, #0x104
	bl ov10_022BD474
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r2, [r2]
	strb r0, [r2, #4]
	ldr r0, _023082BC ; =ov11_02322C88
	bl CreateTextBox
	ldr r1, _023082B4 ; =ov11_02324D8C
	mvn r3, #0
	ldr r4, [r1]
	mov r2, #1
	strb r0, [r4, #5]
	ldr r0, [r1]
	str r3, [r0, #0x18]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02307464:
	bl IsBagNotEmpty
	cmp r0, #0
	bne _02307494
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl SetInventoryMenuState6
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307494:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCC7C
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023074B8:
	add r1, sp, #0xe
	mov r0, #0
	bl GetPressedButtons
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl PopInventoryMenuField0x1A3
	ldrh r1, [sp, #0xe]
	tst r1, #4
	bne _023074EC
	tst r1, #0x800
	cmpeq r0, #0
	beq _02307548
_023074EC:
	cmp r0, #0
	bne _023074FC
	mov r0, #5
	bl PlaySeVolumeWrapper
_023074FC:
	bl SortItemsInBag
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl GetNbItemsInBag
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #4]
	bl ov10_022BCC60
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x18]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCCB0
	b _02308CF0
_02307548:
	ldr r1, _023082B4 ; =ov11_02324D8C
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r5, [r1, #5]
	cmp r5, r0
	beq _0230760C
	ldrsb r0, [r1, #4]
	bl ov10_022BCDA8
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r4, r0
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	cmp r0, r4
	beq _0230760C
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r6, r0
	ldr r1, [r1]
	mov r0, r5
	str r4, [r1, #0x18]
	bl sub_02027B1C
	ldrb r0, [r6]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023075E4
	ldrsh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0x4b
	add r0, r0, #0x2f00
#elif defined(JAPAN)
	add r0, r0, #0x41
	add r0, r0, #0x1d00
#else
	add r0, r0, #0x49
	add r0, r0, #0x2f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	add r0, sp, #0x20
	bl strcpy
	b _023075F0
_023075E4:
	ldr r1, _023082C0 ; =ov11_02322DB0
	add r0, sp, #0x20
	bl strcpy
_023075F0:
	mov r1, #2
	add r3, sp, #0x20
	mov r0, r5
	mov r2, r1
	bl DrawTextInWindow
	mov r0, r5
	bl UpdateWindow
_0230760C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _02307840
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCDBC
	cmp r0, #0
	blt _0230781C
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r4, r0
	ldr r0, [r1]
	ldrsh r1, [r4, #4]
	add r0, r0, #0x200
	strh r1, [r0, #0x4e]
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrne r0, _023082B4 ; =ov11_02324D8C
	ldrnesh r1, [r4, #4]
	ldreq r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	moveq r1, #0
	add r0, r0, #0x200
	strh r1, [r0, #0x4e]
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl GetItemCategoryVeneer
	mov r5, r0
	bl GetGameMode
	mov r6, r0
	cmp r5, #5
	bne _0230777C
	cmp r6, #4
	cmpne r6, #5
	beq _0230777C
	mov sb, #0
	mov r8, sb
	mov r7, #3
	ldr r6, _023082C4 ; =ov11_02322D38
	ldr r5, _023082B4 ; =ov11_02324D8C
	ldr r4, _023082C8 ; =0x000002B6
	b _02307734
_023076F4:
	ldr r0, [r5]
	cmp r1, r4
	add r0, r0, sb
	strb r8, [r0, #0x276]
	bne _02307728
	ldr r0, [r5]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl ov11_02309E48
	cmp r0, #0
	ldreq r0, [r5]
	addeq r0, r0, sb
	streqb r7, [r0, #0x276]
_02307728:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02307734:
	mov r0, sb, lsl #3
	ldrh r1, [r6, r0]
	cmp r1, #0
	bne _023076F4
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r0, _023082CC ; =ov11_02322CB8
	ldr r2, [r1]
	ldr r1, _023082D0 ; =0x00400213
	add r2, r2, #0x76
	add r4, r2, #0x200
	add r2, sp, #0x470
	mov r3, r6
	str r4, [sp, #0x4d0]
	bl CreateParentMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _02307808
_0230777C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl IsGummi
	cmp r0, #0
	cmpne r6, #4
	cmpne r6, #5
	ldr r1, _023082D4 ; =0x00400013
	beq _023077C4
	ldr r0, _023082CC ; =ov11_02322CB8
	ldr r3, _023082D8 ; =ov11_02322D88
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _02307808
_023077C4:
	ldrb r0, [r4, #1]
	mov r2, #0
	cmp r0, #0
	beq _023077F0
	ldr r0, _023082DC ; =ov11_02322CA8
	ldr r3, _023082E0 ; =ov11_02322D10
	bl CreateParentMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _02307808
_023077F0:
	ldr r0, _023082DC ; =ov11_02322CA8
	ldr r3, _023082E4 ; =ov11_02322D60
	bl CreateParentMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
_02307808:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_0230781C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCD10
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0xe
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307840:
	add r1, sp, #0xc
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0xc]
	tst r0, #8
	beq _02308CF0
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCDF4
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCDA8
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseInventoryMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0xa
	strb r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023078D4:
	ldrsb r0, [r4, #6]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_0202ABB0
	cmp r0, #8
	beq _023079E4
	ldr r1, _023082B4 ; =ov11_02324D8C
	cmp r0, #0
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bne _02307928
	bl ov11_02308D48
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307928:
	cmp r0, #1
	bne _02307948
	bl ov11_02308D48
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307948:
	cmp r0, #2
	bne _0230798C
	add r2, sp, #0x500
	mov r4, #5
	ldr r0, _023082E8 ; =ov11_02322C98
	ldr r3, _023082EC ; =ov11_02322CD8
	add r2, r2, #8
	mov r1, #0x33
	str r4, [sp, #0x508]
	bl CreateParentMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #7]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_0230798C:
	cmp r0, #6
	bne _023079AC
	bl ov11_02308D48
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023079AC:
	cmp r0, #7
	bne _023079CC
	bl ov11_02308D48
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x18
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023079CC:
	bl ov11_02308D48
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023079E4:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl CloseParentMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #6]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307A14:
	mov r0, #1
	bl ov11_02309040
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307A30:
	bl ov11_023090DC
	cmp r0, #0
	beq _02308CF0
	bl ov11_02309E24
	mvn r1, #0
	cmp r0, r1
	beq _02307BFC
	ldr r1, _023082B4 ; =ov11_02324D8C
	add r0, sp, #0x18
	ldr r4, [r1]
	add r5, r4, #0x238
	bl ov11_02309DAC
	add r1, sp, #0x18
	mov r0, r5
	bl ov11_02308F4C
	ldr r2, [r5, #0x10]
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldrsh r1, [r5, #8]
	ldr r0, [r0]
	ldrsh r2, [r2]
	add r0, r0, #0x280
	bl GetLearnableIqSkills
	ldr r1, _023082B4 ; =ov11_02324D8C
	mvn r2, #0
	ldr r3, [r1]
	str r0, [r3, #0x30c]
	ldr r0, [r1]
	add r0, r0, #0x200
	strh r2, [r0, #0x50]
	ldr r2, [r5, #0x10]
	ldr r0, [r1]
	ldrsh r2, [r2]
	str r2, [r0, #0x318]
	ldr r6, [r1]
	ldr r1, [r4, #0x238]
	add r0, r6, #0x200
	cmp r1, #0
	ldrsh r4, [r0, #0x4e]
	bne _02307AE8
	ldrsh r0, [r5, #4]
	bl GetTeamMember
	mov r1, r4
	add r3, r6, #0x250
	mov r2, #1
	bl ApplyGummiBoostsToGroundMonster
	b _02307B08
_02307AE8:
	cmp r1, #1
	bne _02307B08
	ldrsh r0, [r5, #4]
	bl GetActiveTeamMember
	mov r1, r4
	add r3, r6, #0x250
	mov r2, #1
	bl ApplyGummiBoostsToTeamMember
_02307B08:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r1, [r5, #0x10]
	ldr r2, [r0]
	ldrsh r0, [r1]
	ldr r1, [r2, #0x318]
	sub r0, r1, r0
	str r0, [r2, #0x318]
	bl ov11_022DC504
	ldr r0, [r5]
	cmp r0, #1
	bne _02307B3C
	ldrsh r0, [r5, #4]
	bl sub_02058794
_02307B3C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, [r5, #0x10]
	ldr r0, [r0]
	ldrsh r1, [r5, #8]
	add r0, r0, #0xc5
	ldrsh r2, [r2]
	add r0, r0, #0x200
	bl GetLearnableIqSkills
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #1
	ldr r3, [r1]
	str r0, [r3, #0x310]
	ldr r0, [r1]
	str r2, [r0, #0x314]
	ldr r0, [r1]
	add r0, r0, #0x200
	ldrsh r4, [r0, #0x50]
	bl ov11_02308EDC
	cmp r4, #0
	blt _02307BCC
	cmp r4, #3
	bgt _02307BCC
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHoleCheck
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #0x13
	str r3, [r2, #0x18]
	ldr r0, [r0]
	str r1, [r0]
	b _02307C0C
_02307BCC:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, _023082F0 ; =0x000002BE
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _02307C0C
_02307BFC:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
_02307C0C:
	bl ov11_02309DF8
	b _02308CF0
_02307C14:
	add r0, r4, #0x200
	ldrsh r1, [r0, #0x50]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02307C58
_02307C28: ; jump table
	b _02307C38 ; case 0
	b _02307C40 ; case 1
	b _02307C48 ; case 2
	b _02307C50 ; case 3
_02307C38:
	ldr r5, _023082F4 ; =0x000002B9
	b _02307C5C
_02307C40:
	ldr r5, _023082F8 ; =0x000002BA
	b _02307C5C
_02307C48:
	ldr r5, _023082FC ; =0x000002BB
	b _02307C5C
_02307C50:
#ifdef JAPAN
	ldr r5, _02309898 ; =0x00002FDC
#else
	mov r5, #0x2bc
#endif
	b _02307C5C
_02307C58:
	mov r5, #0
_02307C5C:
	ldr r0, [r4, #0x318]
	cmp r0, #0
	bne _02307C78
	cmp r1, #0
	blt _02307C78
	cmp r1, #3
	ldrle r5, _02308300 ; =0x000002BD
_02307C78:
	cmp r5, #0
	moveq r0, #0x10
	streq r0, [r4]
	beq _02308CF0
	add r0, r4, #0x238
	bl ov11_0230901C
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	str r0, [r1, #0xb4]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r2, r5
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307CD0:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307D08:
	mov r2, #1
	mov r1, #0
	mov r0, r2
	mov r3, r1
_02307D18:
	ldr r6, _023082B4 ; =ov11_02324D8C
	mov r5, r3
	ldr ip, [r6]
	mov r6, r3
	mov sb, r3
	ldr lr, [ip, #0x30c]
	b _02307D50
_02307D34:
	add r7, ip, sb
	ldrb r7, [r7, #0x280]
	ldr r8, [ip, #0x314]
	cmp r8, r7
	moveq r5, r2
	beq _02307D58
	add sb, sb, #1
_02307D50:
	cmp sb, lr
	blt _02307D34
_02307D58:
	ldr r8, _023082B4 ; =ov11_02324D8C
	mov r7, r1
	ldr ip, [r8]
	ldr lr, [ip, #0x310]
	b _02307D88
_02307D6C:
	add r8, ip, r7
	ldrb r8, [r8, #0x2c5]
	ldr sb, [ip, #0x314]
	cmp sb, r8
	moveq r6, r0
	beq _02307D90
	add r7, r7, #1
_02307D88:
	cmp r7, lr
	blt _02307D6C
_02307D90:
	cmp r5, r6
	beq _02307E2C
	add r0, r4, #0x238
	bl ov11_0230901C
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r2, [r1]
	str r0, [r2, #0xb4]
	ldr r2, [r1]
	mov r0, #4
	ldr r1, [r2, #0x314]
	str r1, [r2, #0xc4]
	bl sub_02017C50
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, _02308304 ; =0x000002BF
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r1, [r0]
	ldr r0, [r1, #0x244]
	ldr r1, [r1, #0x314]
	and r1, r1, #0xff
	bl EnableIqSkill
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308FD0
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x14
	ldr r3, [r0]
	ldr r2, [r3, #0x314]
	add r2, r2, #1
	str r2, [r3, #0x314]
	ldr r0, [r0]
	str r1, [r0]
	b _02307E4C
_02307E2C:
	ldr r6, [r4, #0x314]
	ldr r5, _023082B4 ; =ov11_02324D8C
	add r6, r6, #1
	str r6, [r4, #0x314]
	ldr r4, [r5]
	ldr r5, [r4, #0x314]
	cmp r5, #0x45
	blt _02307D18
_02307E4C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r1, [r0]
	ldr r0, [r1, #0x314]
	cmp r0, #0x45
	movge r0, #0x16
	strge r0, [r1]
	b _02308CF0
_02307E68:
	add r0, r4, #0x200
	ldrh r0, [r0, #0x52]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02307EC8
_02307E7C: ; jump table
	b _02307EA0 ; case 0
	b _02307EA8 ; case 1
	b _02307EB0 ; case 2
	b _02307EC8 ; case 3
	b _02307EB8 ; case 4
	b _02307EC8 ; case 5
	b _02307EC8 ; case 6
	b _02307EC8 ; case 7
	b _02307EC0 ; case 8
_02307EA0:
	mov r0, #0
	b _02307ECC
_02307EA8:
	ldr r0, _02308308 ; =0x000002C1
	b _02307ECC
_02307EB0:
	ldr r0, _0230830C ; =0x000002C2
	b _02307ECC
_02307EB8:
	ldr r0, _02308310 ; =0x000002C3
	b _02307ECC
_02307EC0:
#ifdef JAPAN
	ldr r0, _023098B0 ; =0x00002FE4
	b _02307ECC
_02307EC8:
	ldr r0, _023098B4 ; =0x00002FE0
#else
	mov r0, #0x2c4
	b _02307ECC
_02307EC8:
	mov r0, #0x2c0
#endif
_02307ECC:
	cmp r0, #0
	moveq r0, #0x10
	streq r0, [r4]
	beq _02308CF0
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, _02308304 ; =0x000002BF
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x17
	ldr r3, [r0]
	ldr r2, [r3, #0x314]
	add r2, r2, #1
	str r2, [r3, #0x314]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307F20:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307F58:
	ldr r0, [r4, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	bl ov11_02309084
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x19
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307F84:
	bl ov11_023090DC
	cmp r0, #0
	beq _02308CF0
	bl ov11_02309E24
	mvn r1, #0
	cmp r0, r1
	beq _0230803C
	ldr r1, _023082B4 ; =ov11_02324D8C
	add r0, sp, #0x10
	ldr r4, [r1]
	bl ov11_02309DAC
	add r1, sp, #0x10
	add r0, r4, #0x238
	bl ov11_02308F4C
	add r0, r4, #0x238
	bl ov11_02308FEC
	bl sub_020415BC
	cmp r0, #0
	ldrne r0, _023082B4 ; =ov11_02324D8C
	movne r1, #0x1d
	ldrne r0, [r0]
	strne r1, [r0]
	bne _0230804C
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl IsHM
	cmp r0, #0
	bne _02308028
	ldrsh r2, [r4, #4]
	mov r0, r4
	mov r1, #0xbb
	sub r2, r2, #0xbc
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl SetItemAcquired
_02308028:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0]
	b _0230804C
_0230803C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
_0230804C:
	bl ov11_02309DF8
	b _02308CF0
_02308054:
	add r0, r4, #0x200
	ldrsh r2, [r0, #0x40]
	ldrb r3, [r4, #0x242]
	add r0, r4, #0x328
	mov r1, #2
	bl sub_02053CA0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl GetItemMoveId16
	bl sub_0203FD14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	add r3, r0, #0x328
	mov r0, #6
	bl sub_0204019C
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #0x22
	ldr r3, [r1]
	strb r0, [r3, #0xa]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_023080BC:
	bl sub_020407EC
	cmp r0, #1
	beq _023080F0
	cmp r0, #2
	beq _023080DC
	cmp r0, #7
	beq _02308124
	b _02308CF0
_023080DC:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x1f
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023080F0:
	bl sub_020407C0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x18
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308124:
	bl sub_02041094
	cmp r0, #4
	bge _02308168
	bl sub_0203FD38
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl memcpy
	bl sub_02041094
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	add r1, r1, #0x200
	strh r0, [r1, #0x54]
	b _0230819C
_02308168:
	bl sub_0203FD2C
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #8
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl memcpy
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x200
	strh r1, [r0, #0x54]
_0230819C:
	bl sub_020407C0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x27
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023081D0:
	mov r1, #1
	str r1, [r4, #0x1c]
	mov r1, #3
	str r1, [sp]
	ldr r1, [r0]
	ldr r0, _02308314 ; =ov11_02322CC8
	ldr r3, _02308318 ; =ov11_02322CF0
	add r2, r1, #0x1c
	mov r1, #0x33
	bl CreateSimpleMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #0x20
	ldr r3, [r1]
	strb r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308214:
	ldrsb r0, [r4, #0xc]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc]
	bl GetSimpleMenuResult
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0xc]
	bl CloseSimpleMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	cmp r4, #0
	strb r1, [r0, #0xc]
	beq _02308274
	cmp r4, #1
	beq _0230831C
	cmp r4, #2
	beq _023083C8
	b _02308CF0
_02308274:
	bl sub_02041094
	ldr r2, _023082B4 ; =ov11_02324D8C
	ldr r1, [r2]
	add r1, r1, #0x200
	strh r0, [r1, #0x4c]
	ldr r0, [r2]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x23
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
	.align 2, 0
#ifdef JAPAN
#define OV11_02307334_OFFSET 0x2D20
#else
#define OV11_02307334_OFFSET 0
#endif
_023082B4: .word ov11_02324D8C
_023082B8: .word ov11_02307300
_023082BC: .word ov11_02322C88
_023082C0: .word ov11_02322DB0
_023082C4: .word ov11_02322D38
_023082C8: .word 0x000002B6 + OV11_02307334_OFFSET
_023082CC: .word ov11_02322CB8
_023082D0: .word 0x00400213
_023082D4: .word 0x00400013
_023082D8: .word ov11_02322D88
_023082DC: .word ov11_02322CA8
_023082E0: .word ov11_02322D10
_023082E4: .word ov11_02322D60
_023082E8: .word ov11_02322C98
_023082EC: .word ov11_02322CD8
_023082F0: .word 0x000002BE + OV11_02307334_OFFSET
_023082F4: .word 0x000002B9 + OV11_02307334_OFFSET
_023082F8: .word 0x000002BA + OV11_02307334_OFFSET
_023082FC: .word 0x000002BB + OV11_02307334_OFFSET
#ifdef JAPAN
_02309898: .word 0x00002FDC
#endif
_02308300: .word 0x000002BD + OV11_02307334_OFFSET
_02308304: .word 0x000002BF + OV11_02307334_OFFSET
_02308308: .word 0x000002C1 + OV11_02307334_OFFSET
_0230830C: .word 0x000002C2 + OV11_02307334_OFFSET
_02308310: .word 0x000002C3 + OV11_02307334_OFFSET
#ifdef JAPAN
_023098B0: .word 0x00002FE4
_023098B4: .word 0x00002FE0
#endif
_02308314: .word ov11_02322CC8
_02308318: .word ov11_02322CF0
_0230831C:
	bl sub_02041094
	cmp r0, #4
	bge _02308360
	bl sub_0203FD38
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl memcpy
	bl sub_02041094
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	add r1, r1, #0x200
	strh r0, [r1, #0x54]
	b _02308394
_02308360:
	bl sub_0203FD2C
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #8
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl memcpy
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x200
	strh r1, [r0, #0x54]
_02308394:
	bl sub_020407C0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x27
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023083C8:
	bl sub_020416FC
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x22
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023083E0:
	add r0, r4, #0x200
	ldrsh r0, [r0, #0x4c]
	bl sub_02041154
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r4, _02308CFC ; =0x000008D7
	ldr r2, [r1]
	str r0, [r2, #0xc4]
	ldr r0, [r1]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #3
	bge _0230841C
	bl sub_02041364
	cmp r0, #0
	subne r4, r4, #1
_0230841C:
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r2, r4
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x24
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308450:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _023082B4 ; =ov11_02324D8C
	moveq r1, #0x25
	ldreq r0, [r0]
	streq r1, [r0]
	b _02308CF0
_02308470:
	add r2, sp, #0x500
	mov r4, #5
	ldr r3, _023082EC ; =ov11_02322CD8
	add r2, r2, #8
	mov r0, #0
	mov r1, #0x33
	str r4, [sp, #0x508]
	bl CreateParentMenuFromStringIds
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #0x26
	ldr r3, [r1]
	strb r0, [r3, #7]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_023084AC:
	ldrsb r0, [r4, #7]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202ABB0
	cmp r0, #4
	bne _02308570
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl IsHM
	cmp r0, #0
	bne _0230852C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02308510
	bl sub_020582E0
_02308510:
	ldrsh r2, [r4, #4]
	mov r0, r4
	mov r1, #0xbb
	sub r2, r2, #0xbc
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl SetItemAcquired
_0230852C:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r2, #0x1a
	ldr r1, [r0]
	str r2, [r1]
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #4
	movge r0, #0x1b
	strge r0, [r1]
	bge _02308594
	bl sub_02041484
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0]
	b _02308594
_02308570:
	bl sub_020407C0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308FEC
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0]
_02308594:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl CloseParentMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #7]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl ov11_02308F14
	b _02308CF0
_023085C8:
	add r0, r4, #0x200
	ldrsh r0, [r0, #0x54]
	mov r3, #1
	cmp r0, #0
	movlt r2, #0
	movge r2, r0
	cmp r0, #0
	movlt r1, #1
	add r0, r4, #0x56
	movge r1, #4
	add r0, r0, #0x200
	bl sub_020417A8
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #0x28
	ldr r3, [r1]
	strb r0, [r3, #0xb]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308614:
	ldrsb r0, [r4, #0xb]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl CloseScrollBox
	bl sub_02041A00
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x21
	strb r3, [r2, #0xb]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308658:
	add r0, r4, #0x200
	ldrsh r0, [r0, #0x4e]
	bl GetItemMoveId16
	mov r4, r0
	ldr r0, _02308D00 ; =0x0000131B
	mov r1, #0x100
	bl sub_02017C74
	mov r0, r4
	bl sub_02041614
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r1, [r0]
	ldr r0, [r1, #0x238]
	add r1, r1, #0x238
	cmp r0, #0
	bne _023086A0
	ldrsh r0, [r1, #4]
	bl sub_0203FD80
	b _023086B0
_023086A0:
	cmp r0, #1
	bne _023086B0
	ldrsh r0, [r1, #4]
	bl sub_0203FDEC
_023086B0:
	bl sub_020407C0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r1, [r0]
	str r4, [r1, #0xc4]
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308DD8
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	str r0, [r1, #0xec]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, _02308D04 ; =0x00000F23
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308FD0
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x29
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_0230871C:
	bl sub_020407C0
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x1c
	ldr r0, [r0]
	str r1, [r0]
	bl sub_020037A4
	ldr r1, _023082B4 ; =ov11_02324D8C
	add r2, r0, #0xa
	ldr r0, [r1]
	str r2, [r0, #0x32c]
	b _02308CF0
_02308748:
	bl sub_020037A4
	ldr r1, [r4, #0x32c]
	cmp r0, r1
	ble _02308CF0
	add r0, r4, #0x238
	bl ov11_02308DD8
	ldr r1, _023082B4 ; =ov11_02324D8C
	ldr r1, [r1]
	str r0, [r1, #0xec]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, _02308D08 ; =0x00000F24
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x29
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023087A0:
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
#ifdef JAPAN
	ldr r2, _0230A2B0_JP ; =0x0000248F
	ldr r0, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r0, [r0]
	add r2, r1, #0xf10
#endif
	ldrsb r0, [r0, #8]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x1e
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023087D4:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_0230880C:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308844:
	ldrsb r0, [r4, #7]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202ABB0
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r3, #2
	ldr r2, [r1]
	cmp r0, #8
	str r3, [r2]
	beq _02308900
	cmp r0, #4
	bne _02308900
	ldr r3, [r1]
	mov r2, #0
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x4e]
	str r0, [r3, #0xc4]
	ldr r0, [r1]
	str r2, [r0, #0xd8]
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHoleCheck
	bl ov11_022DC504
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x18]
	bl GetNbItemsInBag
	ldr r2, _023082B4 ; =ov11_02324D8C
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #4]
	bl ov10_022BCC60
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl SetInventoryMenuState6
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
_02308900:
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl CloseParentMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #7]
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl CloseParentMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
	b _02308CF0
_02308940:
	ldrsb r0, [r4, #4]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseInventoryMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r2, _02308D0C ; =0x000002CB
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023089C0:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl IsBagNotEmpty
	cmp r0, #0
	ldreq r0, _023082B4 ; =ov11_02324D8C
	moveq r1, #0xc
	ldreq r0, [r0]
	streq r1, [r0]
	beq _02308CF0
	bl ov11_02308F14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308A14:
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r4, #0x10]
	mov r3, r2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #2
	bl sub_02044688
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #8
	ldr r3, [r1]
	str r0, [r3, #0x324]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308A54:
	ldr r0, [r4, #0x324]
	bl sub_02044800
	cmp r0, #1
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x324
	bl sub_020448EC
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308A88:
	ldr r0, [r4, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	bl sub_020582E0
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308AB4:
	ldr r0, [r4, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrne r0, _023082B4 ; =ov11_02324D8C
	ldrnesh r1, [r4, #4]
	ldreq r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	moveq r1, #0
	add r0, r0, #0x200
	strh r1, [r0, #0x4e]
	add r0, sp, #0x420
	bl InitPreprocessorArgs
	ldr r0, _023082B4 ; =ov11_02324D8C
	add r6, sp, #0x420
	ldr r1, [r0]
	ldr r0, _02308D10 ; =ov11_02322C78
	add r5, r1, #0x200
	ldrsh r2, [r5, #0x4e]
	ldr r1, _02308D14 ; =0x00001013
	ldr r3, _02308D18 ; =0x000008E4
	str r2, [sp, #0x430]
	ldrh r4, [r4, #2]
	mov r2, #0
	add r4, r4, #0xbc
	str r4, [sp, #0x438]
	str r6, [sp]
	ldrsh r4, [r5, #0x4e]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, r6}
	bl CreateScrollBoxSingle
	ldr r1, _023082B4 ; =ov11_02324D8C
	mov r2, #0xb
	ldr r3, [r1]
	strb r0, [r3, #9]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308B70:
	ldrsb r0, [r4, #9]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #9]
	bl CloseScrollBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #9]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308BB0:
	ldrsb r0, [r4, #5]
	mvn r1, #1
	cmp r0, r1
	beq _02308BD4
	bl CloseTextBox2
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
_02308BD4:
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _02308C00
	bl CloseInventoryMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_02308C00:
	ldr r1, _023082B4 ; =ov11_02324D8C
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _02308C1C
	bl ov11_02308EDC
_02308C1C:
	ldr r0, _023082B4 ; =ov11_02324D8C
#ifdef JAPAN
	ldr r2, _0230A2C4_JP ; =0x00002FD4
	ldr r0, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r0, [r0]
	mov r2, #0x2b4
#endif
	ldrsb r0, [r0, #8]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308C4C:
	ldrsb r0, [r4, #8]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDialogueBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =ov11_02324D8C
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308C84:
	mov r0, #0xf
	str r0, [r4]
	b _02308CF0
_02308C90:
	ldrsb r0, [r4, #4]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _02308CE8
	ldr r0, _023082B4 ; =ov11_02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseInventoryMenu
	ldr r0, _023082B4 ; =ov11_02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x10
	strb r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
_02308CE8:
	mov r0, #1
	b _02308CF4
_02308CF0:
	mov r0, #0
_02308CF4:
	add sp, sp, #0x5a0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02308CFC: .word 0x00001D2F
_02308D00: .word 0x0000131B
_02308D04: .word 0x0000248A
_02308D08: .word 0x0000248B
_0230A2B0_JP: .word 0x0000248F
#else
_02308CFC: .word 0x000008D7
_02308D00: .word 0x0000131B
_02308D04: .word 0x00000F23
_02308D08: .word 0x00000F24
#endif
_02308D0C: .word 0x000002CB + OV11_02307334_OFFSET
_02308D10: .word ov11_02322C78
_02308D14: .word 0x00001013
#ifdef JAPAN
_02308D18: .word 0x00001D3C
_0230A2C4_JP: .word 0x00002FD4
#else
_02308D18: .word 0x000008E4
#endif
	arm_func_end ov11_02307334

	arm_func_start ov11_02308D1C
ov11_02308D1C: ; 0x02308D1C
	stmdb sp!, {r3, lr}
	ldr r0, _02308D44 ; =ov11_02324D8C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02308D44 ; =ov11_02324D8C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308D44: .word ov11_02324D8C
	arm_func_end ov11_02308D1C

	arm_func_start ov11_02308D48
ov11_02308D48: ; 0x02308D48
	stmdb sp!, {r3, lr}
	ldr r0, _02308DD4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _02308D78
	bl CloseParentMenu
	ldr r0, _02308DD4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
_02308D78:
	ldr r0, _02308DD4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	beq _02308DA4
	bl CloseTextBox2
	ldr r0, _02308DD4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
_02308DA4:
	ldr r0, _02308DD4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseInventoryMenu
	ldr r0, _02308DD4 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308DD4: .word ov11_02324D8C
	arm_func_end ov11_02308D48

	arm_func_start ov11_02308DD8
ov11_02308DD8: ; 0x02308DD8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, [r0]
	cmp r1, #0
	bne _02308E20
	ldrsh r0, [r0, #4]
	bl GetTeamMember
	mov r4, r0
	bl sub_02055894
	bl sub_020564B0
	ldr r1, _02308EAC ; =ov11_02324D8C
	mov r2, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x36
	add r0, r0, #0x100
	bl sub_02056094
	b _02308E94
_02308E20:
	cmp r1, #1
	bne _02308E94
	ldrsh r0, [r0, #4]
	bl GetActiveTeamMember
	mov r4, r0
	add r0, sp, #0
	add r1, r4, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldrb r0, [r4]
	mov r2, #0x44
	ldr r1, _02308EB0 ; =ov11_02322DB8
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrb r0, [r4, #1]
	movne r2, #0x46
	add r3, sp, #0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldr r0, _02308EAC ; =ov11_02324D8C
	movne r2, #0x59
	ldr r0, [r0]
	add r0, r0, #0x36
	add r0, r0, #0x100
	bl ov11_02308EB4
_02308E94:
	ldr r0, _02308EAC ; =ov11_02324D8C
	ldr r0, [r0]
	add r0, r0, #0x36
	add r0, r0, #0x100
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02308EAC: .word ov11_02324D8C
_02308EB0: .word ov11_02322DB8
	arm_func_end ov11_02308DD8

	arm_func_start ov11_02308EB4
ov11_02308EB4: ; 0x02308EB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov11_02308EB4

	arm_func_start ov11_02308EDC
ov11_02308EDC: ; 0x02308EDC
	stmdb sp!, {r3, lr}
	ldr r1, _02308F10 ; =ov11_02324D8C
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #8]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02308F10 ; =ov11_02324D8C
	ldr r1, [r1]
	strb r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308F10: .word ov11_02324D8C
	arm_func_end ov11_02308EDC

	arm_func_start ov11_02308F14
ov11_02308F14: ; 0x02308F14
	stmdb sp!, {r3, lr}
	ldr r0, _02308F48 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseDialogueBox
	ldr r0, _02308F48 ; =ov11_02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308F48: .word ov11_02324D8C
	arm_func_end ov11_02308F14

	arm_func_start ov11_02308F4C
ov11_02308F4C: ; 0x02308F4C
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	ldr r1, [r1, #4]
	mov r4, r0
	str r2, [r4]
	str r1, [r4, #4]
	ldr r0, [r4]
	cmp r0, #0
	bne _02308F9C
	ldrsh r0, [r4, #4]
	bl GetTeamMember
	ldrsh r3, [r0, #4]
	add r2, r0, #0x14
	add r1, r0, #8
	strh r3, [r4, #8]
	ldrb r0, [r0, #2]
	strb r0, [r4, #0xa]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	ldmia sp!, {r4, pc}
_02308F9C:
	cmp r0, #1
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #4]
	bl GetActiveTeamMember
	ldrsh r3, [r0, #0xc]
	add r2, r0, #0x4c
	add r1, r0, #6
	strh r3, [r4, #8]
	ldrb r0, [r0, #3]
	strb r0, [r4, #0xa]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_02308F4C

	arm_func_start ov11_02308FD0
ov11_02308FD0: ; 0x02308FD0
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #1
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl sub_02058794
	ldmia sp!, {r3, pc}
	arm_func_end ov11_02308FD0

	arm_func_start ov11_02308FEC
ov11_02308FEC: ; 0x02308FEC
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _02309008
	ldrsh r0, [r0, #4]
	bl sub_0203FA64
	ldmia sp!, {r3, pc}
_02309008:
	cmp r1, #1
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl sub_0203FBD4
	ldmia sp!, {r3, pc}
	arm_func_end ov11_02308FEC

	arm_func_start ov11_0230901C
ov11_0230901C: ; 0x0230901C
	ldr r1, [r0]
	cmp r1, #0
	ldreqsh r0, [r0, #4]
	orreq r0, r0, #0x20000
	bxeq lr
	cmp r1, #1
	ldreqsh r0, [r0, #4]
	orreq r0, r0, #0x30000
	bx lr
	arm_func_end ov11_0230901C

	arm_func_start ov11_02309040
ov11_02309040: ; 0x02309040
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230907C ; =0x00000794
	mov r1, #8
	bl MemAlloc
	ldr r1, _02309080 ; =ov11_02324D90
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
#ifdef JAPAN
	strne r4, [r0, #0xf4]
#else
	strne r4, [r0, #0x114]
#endif
	ldrne r0, [r1]
	movne r1, #0
	strne r1, [r0]
	movne r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0230907C: .word 0x00000774
#else
_0230907C: .word 0x00000794
#endif
_02309080: .word ov11_02324D90
	arm_func_end ov11_02309040

	arm_func_start ov11_02309084
ov11_02309084: ; 0x02309084
#ifdef JAPAN
#define OV11_02309084_OFFSET -0x20
#else
#define OV11_02309084_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023090D4 ; =0x00000794
	mov r1, #8
	bl MemAlloc
	ldr r1, _023090D8 ; =ov11_02324D90
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #2
	str r2, [r0, #0x114 + OV11_02309084_OFFSET]
	ldr r0, [r1]
	mov r2, #0
	str r2, [r0]
	ldr r1, [r1]
	mov r0, #1
#ifdef JAPAN
	strh r4, [r1, #0xf8]
#else
	add r1, r1, #0x100
	strh r4, [r1, #0x18]
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_023090D4: .word 0x00000774
#else
_023090D4: .word 0x00000794
#endif
_023090D8: .word ov11_02324D90
	arm_func_end ov11_02309084

	arm_func_start ov11_023090DC
ov11_023090DC: ; 0x023090DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x124
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #0x1b
	addls pc, pc, r0, lsl #2
	b _02309D74
_023090FC: ; jump table
	b _0230916C ; case 0
	b _0230955C ; case 1
	b _02309518 ; case 2
	b _02309724 ; case 3
	b _023097EC ; case 4
	b _0230984C ; case 5
	b _0230987C ; case 6
	b _023098A8 ; case 7
	b _023098E4 ; case 8
	b _023099B0 ; case 9
	b _023099CC ; case 10
	b _023099F8 ; case 11
	b _02309A2C ; case 12
	b _02309A68 ; case 13
	b _02309A8C ; case 14
	b _02309AB4 ; case 15
	b _02309AD0 ; case 16
	b _02309B40 ; case 17
	b _02309B5C ; case 18
	b _02309BA4 ; case 19
	b _02309C04 ; case 20
	b _02309CA4 ; case 21
	b _02309CE0 ; case 22
	b _02309CF8 ; case 23
	b _02309D20 ; case 24
	b _02309D38 ; case 25
	b _02309D54 ; case 26
	b _02309D6C ; case 27
_0230916C:
	ldr r5, [r3, #0x114 + OV11_02309084_OFFSET]
	mov r0, #0
	str r0, [sp, #4]
	ldr r8, [sp, #4]
	add r4, r3, #0x11c + OV11_02309084_OFFSET
	mov r2, r8
#ifdef JAPAN
	str r2, [sp, #8]
	ldrsh r2, [r3, #0xf8]
#else
	add r3, r3, #0x100
	str r2, [sp, #8]
	ldrsh r2, [r3, #0x18]
#endif
	mov r0, r4
	mov r1, r5
	str r2, [sp, #0x10]
	ldr r2, _02309D84 ; =0x00401833
	add r7, r4, #0x38
	str r2, [sp, #0x14]
	bl ov11_02309EE4
	mov r2, #0
	mov r1, r2
	b _023091C4
_023091B8:
	add r0, r4, r2
	strb r1, [r0, #0x70]
	add r2, r2, #1
_023091C4:
	ldr r0, [r4, #0x30]
	cmp r2, r0
	blt _023091B8
	cmp r5, #2
	bne _023092FC
	mov sl, #0
	b _023092F0
_023091E0:
	ldr r0, [sp, #0x10]
	add fp, r4, sl, lsl #3
	bl GetItemMoveId16
	ldr r1, [r4, sl, lsl #3]
	mov r6, r0
	cmp r1, #1
	bne _02309258
	ldrsh r0, [fp, #4]
	bl GetTeamMember
	ldrsh r1, [r0, #4]
	mov sb, #0
	mov r3, sb
	str r1, [sp, #0xc]
	mov fp, #1
	mov r1, #6
	b _0230924C
_02309220:
	mla ip, sb, r1, r0
	ldrb r2, [ip, #0x22]
	tst r2, #1
	movne r2, fp
	moveq r2, r3
	tst r2, #0xff
	beq _02309248
	ldrh r2, [ip, #0x24]
	cmp r6, r2
	beq _023092B8
_02309248:
	add sb, sb, #1
_0230924C:
	cmp sb, #4
	blt _02309220
	b _023092B8
_02309258:
	cmp r1, #2
	bne _023092B8
	ldrsh r0, [fp, #4]
	bl GetActiveTeamMember
	ldrsh r1, [r0, #0xc]
	mov sb, #0
	mov r2, sb
	str r1, [sp, #0xc]
	mov r3, #1
	b _023092B0
_02309280:
	add r1, r0, sb, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _023092AC
	add r1, r0, sb, lsl #3
	ldrh r1, [r1, #0x20]
	cmp r6, r1
	beq _023092B8
_023092AC:
	add sb, sb, #1
_023092B0:
	cmp sb, #4
	blt _02309280
_023092B8:
	ldr r1, [sp, #0xc]
	mov r0, r6
	bl sub_02053D1C
	cmp r0, #0
	beq _023092E0
	cmp sb, #4
	addlt r0, r4, sl
	movlt r1, #3
	strltb r1, [r0, #0x70]
	b _023092EC
_023092E0:
	add r0, r4, sl
	mov r1, #3
	strb r1, [r0, #0x70]
_023092EC:
	add sl, sl, #1
_023092F0:
	ldr r0, [r4, #0x30]
	cmp sl, r0
	blt _023091E0
_023092FC:
	mov sl, #0
	add r6, r4, #0x76
	add fp, sp, #0x5c
	b _02309450
_0230930C:
	add sb, r4, sl, lsl #3
	ldr r0, [r4, sl, lsl #3]
	cmp r0, #1
	bne _0230935C
	ldrsh r0, [sb, #4]
	bl GetTeamMember
	ldrsh r1, [sb, #4]
	mov sb, r0
	orr r0, r1, #0x20000
	str r0, [sp, #0x5c]
	ldrsh r0, [sb, #4]
	bl GetDexNumber
	str r0, [sp, #0x80]
	add r1, sb, #0x3a
	add r0, sp, #0x1a
	mov r2, #0
	bl sub_02054F44
	add r0, sp, #0x1a
	str r0, [sp, #0x94]
	b _023093A0
_0230935C:
	cmp r0, #2
	bne _023093A0
	ldrsh r0, [sb, #4]
	bl GetActiveTeamMember
	ldrsh r1, [sb, #4]
	mov sb, r0
	orr r0, r1, #0x30000
	str r0, [sp, #0x5c]
	ldrsh r0, [sb, #0xc]
	bl GetDexNumber
	str r0, [sp, #0x80]
	add r1, sb, #0x5e
	add r0, sp, #0x1a
	mov r2, #0
	bl sub_02054F44
	add r0, sp, #0x1a
	str r0, [sp, #0x94]
_023093A0:
	cmp r5, #1
	mov r1, #0x100
	mov r3, #0
	bne _023093C8
	ldr r2, _02309D88 ; =ov11_02322E58
	add r0, r6, r8, lsl #8
	str fp, [sp]
	mov sb, r8, lsl #8
	bl PreprocessString
	b _0230941C
_023093C8:
	cmp r5, #2
	bne _02309408
	add r0, r4, sl
	ldrb r0, [r0, #0x70]
	mov sb, r8, lsl #8
	tst r0, #2
	str fp, [sp]
	beq _023093F8
	ldr r2, _02309D8C ; =ov11_02322E7C
	add r0, r6, r8, lsl #8
	bl PreprocessString
	b _0230941C
_023093F8:
	ldr r2, _02309D88 ; =ov11_02322E58
	add r0, r6, r8, lsl #8
	bl PreprocessString
	b _0230941C
_02309408:
	ldr r2, _02309D90 ; =ov11_02322EA0
	add r0, r6, r8, lsl #8
	str fp, [sp]
	mov sb, r8, lsl #8
	bl PreprocessString
_0230941C:
	add r0, r4, sl
	ldrb r0, [r0, #0x70]
	add r8, r8, #1
	cmp r0, #0
	ldreq r0, [sp, #4]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #4]
	add r0, r6, sb
	stmia r7, {r0, sl}
	streq sl, [sp, #8]
	add r7, r7, #8
	add sl, sl, #1
_02309450:
	ldr r0, [r4, #0x30]
	cmp sl, r0
	blt _0230930C
	mov r3, #0
	str r3, [r7]
	sub r0, r3, #1
	str r0, [r7, #4]
	ldr r0, [sp, #8]
	ldr r1, _02309D80 ; =ov11_02324D90
	str r0, [r4, #0x34]
	ldr r0, [r1]
	mov r2, #0x10
	str r2, [r0, #0x88 + OV11_02309084_OFFSET]
	ldr r0, [r1]
	str r3, [r0, #0x7c + OV11_02309084_OFFSET]
	ldr r3, [r1]
	ldr r0, [r3, #0x114 + OV11_02309084_OFFSET]
	cmp r0, #1
	ldreq r0, _02309D94 ; =0x000002F2
	streqh r0, [r3, #0x84 + OV11_02309084_OFFSET]
	beq _023094E0
	cmp r0, #2
	ldrne r0, _02309D98 ; =0x00000A3A
	strneh r0, [r3, #0x84 + OV11_02309084_OFFSET]
	bne _023094E0
	ldr r2, _02309D94 ; =0x000002F2
	ldr r0, [sp, #0x14]
	strh r2, [r3, #0x84 + OV11_02309084_OFFSET]
	orr r0, r0, #0x200
	ldr r2, [r1]
	str r0, [sp, #0x14]
	add r0, r2, #0x18c + OV11_02309084_OFFSET
	str r0, [r2, #0xdc + OV11_02309084_OFFSET]
	ldr r1, [r1]
	ldr r0, [r1, #0x150 + OV11_02309084_OFFSET]
	str r0, [r1, #0x7c + OV11_02309084_OFFSET]
_023094E0:
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r0, _02309D9C ; =ov11_02322DD0
	ldr r3, [r1]
	ldr r1, [sp, #0x14]
	add r2, r3, #0x7c + OV11_02309084_OFFSET
	add r3, r3, #0x154 + OV11_02309084_OFFSET
	bl CreateParentMenu
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3, #4]
	ldr r0, [r1]
	str r2, [r0]
	b _02309D74
_02309518:
	ldrsb r0, [r3, #4]
	bl sub_02028354
	cmp r0, #3
	bne _02309538
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202810C
_02309538:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ResumeParentMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_0230955C:
	add r1, sp, #0x18
	mov r0, #0
	ldr r5, [r3, #0x114 + OV11_02309084_OFFSET]
	bl GetPressedButtons
	ldrh r0, [sp, #0x18]
	tst r0, #8
	beq _02309584
	cmp r5, #0
	moveq r0, #1
	beq _02309588
_02309584:
	mov r0, #0
_02309588:
	cmp r0, #0
	beq _023095E0
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r4, [r0]
	ldrsb r0, [r4, #4]
	bl sub_0202AB80
	add r0, r4, r0, lsl #3
	ldr r1, [r0, #0x158 + OV11_02309084_OFFSET]
	ldr r0, _02309D80 ; =ov11_02324D90
	str r1, [r4, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202B030
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202812C
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023095E0:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202ABB0
	cmp r0, #0
	blt _02309704
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r1, [r1]
	add r2, r1, #0x11c + OV11_02309084_OFFSET
	ldr r1, [r2, r0, lsl #3]
	add r5, r2, r0, lsl #3
	cmp r1, #1
	bne _02309644
	ldrsh r0, [r5, #4]
	bl GetTeamMember
	ldrsh r4, [r0, #4]
	b _02309658
_02309644:
	cmp r1, #2
	bne _02309658
	ldrsh r0, [r5, #4]
	bl GetActiveTeamMember
	ldrsh r4, [r0, #0xc]
_02309658:
	mov r0, r5
	bl ov11_0230A044
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r5, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x114 + OV11_02309084_OFFSET]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #0x1a
	strls r0, [r1]
	bls _02309D74
	bl GetGameMode
	cmp r0, #5
	beq _023096D0
	cmp r4, #0x140
	bne _023096D0
	mov r0, r5
	mov r1, r4
	bl StrcmpMonsterName
	cmp r0, #0
	beq _023096D0
	ldr r0, _02309DA0 ; =ov11_02322DE0
	ldr r3, _02309DA4 ; =ov11_02322E28
	mov r1, #0x13
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r1, [r1]
	strb r0, [r1, #5]
	b _023096F0
_023096D0:
	ldr r0, _02309DA0 ; =ov11_02322DE0
	ldr r3, _02309DA8 ; =ov11_02322E00
	mov r1, #0x13
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r1, [r1]
	strb r0, [r1, #5]
_023096F0:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309704:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r3, #0x1a
	ldr r2, [r0]
	sub r1, r3, #0x1b
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _02309D74
_02309724:
	ldrsb r0, [r3, #5]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202ABB0
	mvn r1, #0
	cmp r0, r1
	beq _023097C8
	ldr r1, _02309D80 ; =ov11_02324D90
	cmp r0, #3
	ldr r2, [r1]
	str r0, [r2, #0x14]
	addls pc, pc, r0, lsl #2
	b _023097B4
_02309768: ; jump table
	b _02309778 ; case 0
	b _02309788 ; case 1
	b _02309798 ; case 2
	b _023097A8 ; case 3
_02309778:
	ldr r0, [r1]
	mov r1, #4
	str r1, [r0]
	b _023097B4
_02309788:
	ldr r0, [r1]
	mov r1, #7
	str r1, [r0]
	b _023097B4
_02309798:
	ldr r0, [r1]
	mov r1, #0xc
	str r1, [r0]
	b _023097B4
_023097A8:
	ldr r0, [r1]
	mov r1, #0xe
	str r1, [r0]
_023097B4:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202812C
	b _023097D8
_023097C8:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
_023097D8:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl CloseParentMenu
	b _02309D74
_023097EC:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c + OV11_02309084_OFFSET
	add r4, r1, r0, lsl #3
	ldrsh r0, [r4, #4]
	bl GetActiveTeamMember
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r5, #1
	ldrsh r0, [r4, #4]
	moveq r5, #0
	bl GetActiveTeamMember
	mov r1, r0
	add r0, sp, #0xac
	and r2, r5, #0xff
	bl CreateMonsterSummaryFromTeamMember
	add r0, sp, #0xac
	mov r1, #3
	bl sub_0203F150
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #5
	ldr r3, [r1]
	strb r0, [r3, #9]
	ldr r0, [r1]
	str r2, [r0]
_0230984C:
	bl sub_0203F398
	cmp r0, #1
	bne _02309D74
	bl sub_0203F974
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2, #0x18]
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_0230987C:
	ldr r1, [r3, #0x18]
	sub r0, r1, #1
	str r0, [r3, #0x18]
	cmp r1, #0
	bne _02309D74
	bl sub_0203F990
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023098A8:
	ldr r0, [r3, #0x10]
#ifdef JAPAN
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
#else
	add r0, r3, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20]
#endif
	bl sub_0203FBD4
	mov r1, #0
	mov r2, r1
	mov r0, #9
	bl sub_0204018C
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #8
	ldr r3, [r1]
	strb r0, [r3, #0xa]
	ldr r0, [r1]
	str r2, [r0]
_023098E4:
	bl sub_020407EC
	cmp r0, #1
	bne _02309934
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	add r0, r1, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20 + OV11_02309084_OFFSET]
	bl sub_0203FDEC
	bl sub_020407C0
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309934:
	cmp r0, #2
	cmpne r0, #7
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	add r1, r1, #0x11c + OV11_02309084_OFFSET
	add r4, r1, r0, lsl #3
	bl sub_0203FD38
	ldr r2, _02309D80 ; =ov11_02324D90
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x1e
	bl MemcpySimple
	bl sub_02041094
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r1, [r1]
	strh r0, [r1, #0x1c]
	ldrsh r0, [r4, #4]
	bl sub_0203FDEC
	bl sub_020407C0
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023099B0:
	ldrsb r0, [r3, #0xa]
	bl sub_020307EC
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023099CC:
	ldrsh r2, [r3, #0x1c]
	add r0, r3, #0x1e
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #0xb
	ldr r3, [r1]
	strb r0, [r3, #0xb]
	ldr r0, [r1]
	str r2, [r0]
_023099F8:
	bl sub_02041A18
	cmp r0, #1
	bne _02309D74
	bl sub_02041A00
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl CloseScrollBox
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309A2C:
	ldr r0, [r3, #0x10]
	add r0, r3, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20 + OV11_02309084_OFFSET]
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
_02309A68:
	bl sub_02041B7C
	cmp r0, #1
	bne _02309D74
	bl sub_020420F4
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309A8C:
	bl ov11_0230D92C
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseParentMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309AB4:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0x10
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309AD0:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c + OV11_02309084_OFFSET
	add r0, r1, r0, lsl #3
	bl ov11_0230A044
	ldr r2, _02309D80 ; =ov11_02324D90
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	add r0, r0, #0x3e
	bl StrncpySimpleNoPad
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r1, [r0]
#ifdef JAPAN
	add r0, r1, #0x48
#else
	add r0, r1, #0x52
#endif
	add r1, r1, #0x3e
	bl StrcpySimple
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, #2
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e
#ifdef JAPAN
	add r3, r3, #0x48
#else
	add r3, r3, #0x52
#endif
	bl ShowKeyboard
	bl ov11_02310BDC
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309B40:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0x12
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309B5C:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x18]
	bl GetKeyboardStringResult
	ldr r2, _02309D80 ; =ov11_02324D90
	mov r1, r0
	ldr r0, [r2]
	add r0, r0, #0x3e
	bl StrcpySimple
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x13
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309BA4:
	bl sub_02037468
	cmp r0, #0
	beq _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	sub r1, r2, #1
	str r1, [r3, #0x18]
	cmp r2, #0
	bgt _02309D74
	ldr r1, [r0]
	mov r2, #0xa
#ifdef JAPAN
	add r0, r1, #0x52
#else
	add r0, r1, #0x66
#endif
	add r1, r1, #0x3e
	bl StrncpySimpleNoPadSafe
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x52
#else
	add r0, r0, #0x66
#endif
	bl sub_0203909C
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309C04:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c + OV11_02309084_OFFSET
	add r4, r1, r0, lsl #3
	mov r0, r4
	bl ov11_0230A044
	mov r5, r0
	bl sub_0203931C
	mvn r1, #0
	cmp r0, r1
	beq _02309D74
	cmp r0, #0
	beq _02309C4C
	cmp r0, #1
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0x15
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309C4C:
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0xa
	add r1, r1, #0x3e
	bl StrncpySimple
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0xa
	add r1, r1, #0x3e
	bl StrncpySimple
	ldr r0, [r4]
	cmp r0, #2
	bne _02309C90
	ldrsh r0, [r4, #4]
	bl sub_02058794
_02309C90:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CA4:
	bl sub_02039218
	cmp r0, #0
	beq _02309D74
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, #2
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e
#ifdef JAPAN
	add r3, r3, #0x48
#else
	add r3, r3, #0x52
#endif
	bl ShowKeyboard
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CE0:
	bl ov11_0230D92C
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CF8:
	bl ov11_0230D220
	cmp r0, #0
	bne _02309D74
	bl sub_02039218
	cmp r0, #0
	ldrne r0, _02309D80 ; =ov11_02324D90
	movne r1, #0x18
	ldrne r0, [r0]
	strne r1, [r0]
	b _02309D74
_02309D20:
	bl ov11_0230D000
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x19
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309D38:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309D54:
	ldrsb r0, [r3, #4]
	bl CloseParentMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x1b
	ldr r0, [r0]
	str r1, [r0]
_02309D6C:
	mov r0, #1
	b _02309D78
_02309D74:
	mov r0, #0
_02309D78:
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02309D80: .word ov11_02324D90
_02309D84: .word 0x00401833
_02309D88: .word ov11_02322E58
_02309D8C: .word ov11_02322E7C
_02309D90: .word ov11_02322EA0
#ifdef JAPAN
_02309D94: .word 0x00002FF2
_02309D98: .word 0x00000875
#else
_02309D94: .word 0x000002F2
_02309D98: .word 0x00000A3A
#endif
_02309D9C: .word ov11_02322DD0
_02309DA0: .word ov11_02322DE0
_02309DA4: .word ov11_02322E28
_02309DA8: .word ov11_02322E00
	arm_func_end ov11_023090DC

	arm_func_start ov11_02309DAC
ov11_02309DAC: ; 0x02309DAC
	ldr r1, _02309DF4 ; =ov11_02324D90
	ldr r1, [r1]
	ldr r2, [r1, #0x10]
#ifdef JAPAN
	add r3, r1, #0xfc
#else
	add r3, r1, #0x11c
#endif
	ldr r1, [r3, r2, lsl #3]
	add r2, r3, r2, lsl #3
	cmp r1, #1
	moveq r1, #0
	streq r1, [r0]
	ldreqsh r1, [r2, #4]
	streqh r1, [r0, #4]
	bxeq lr
	cmp r1, #2
	moveq r1, #1
	streq r1, [r0]
	ldreqsh r1, [r2, #4]
	streqh r1, [r0, #4]
	bx lr
	.align 2, 0
_02309DF4: .word ov11_02324D90
	arm_func_end ov11_02309DAC

	arm_func_start ov11_02309DF8
ov11_02309DF8: ; 0x02309DF8
	stmdb sp!, {r3, lr}
	ldr r0, _02309E20 ; =ov11_02324D90
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02309E20 ; =ov11_02324D90
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02309E20: .word ov11_02324D90
	arm_func_end ov11_02309DF8

	arm_func_start ov11_02309E24
ov11_02309E24: ; 0x02309E24
	ldr r0, _02309E44 ; =ov11_02324D90
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0x10]
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	mvneq r0, #0
	bx lr
	.align 2, 0
_02309E44: .word ov11_02324D90
	arm_func_end ov11_02309E24

	arm_func_start ov11_02309E48
ov11_02309E48: ; 0x02309E48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0x34
	mov r1, #0
	mov r5, #1
	bl MemAlloc
	mov r1, #2
	mov r4, r0
	bl ov11_02309EE4
	mov r6, #0
	b _02309EBC
_02309E74:
	ldr r0, [r4, r6, lsl #3]
	add r1, r4, r6, lsl #3
	cmp r0, #1
	bne _02309E9C
	ldrsh r0, [r1, #4]
	mov r1, r7
	bl sub_02055FCC
	cmp r0, #0
	bne _02309EC8
	b _02309EB8
_02309E9C:
	cmp r0, #2
	bne _02309EB8
	ldrsh r0, [r1, #4]
	mov r1, r7
	bl sub_020586F0
	cmp r0, #0
	bne _02309EC8
_02309EB8:
	add r6, r6, #1
_02309EBC:
	ldr r0, [r4, #0x30]
	cmp r6, r0
	blt _02309E74
_02309EC8:
	ldr r0, [r4, #0x30]
	cmp r6, r0
	mov r0, r4
	moveq r5, #0
	bl MemFree
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_02309E48

	arm_func_start ov11_02309EE4
ov11_02309EE4: ; 0x02309EE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov sl, r0
	mov r5, r1
	mov r1, r4
	str r4, [sl, #0x30]
	mov r0, r4
_02309F00:
	str r0, [sl, r1, lsl #3]
	add r1, r1, #1
	cmp r1, #6
	blt _02309F00
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _02309F2C
	bl sub_0205633C
	cmp r0, #0
	moveq r4, #1
_02309F2C:
	cmp r4, #0
	beq _02309FD4
	sub r0, r5, #1
	cmp r0, #1
	bhi _02309FD4
	bl GetGameMode
	cmp r0, #1
	ldrls sb, _0230A03C ; =ov11_02322DC8
	mov fp, #2
	ldrhi sb, _0230A040 ; =ov11_02322DF0
	mov r5, #1
	mvn r4, #0
	b _02309FB8
_02309F60:
	ldrsh r0, [sb], #2
	bl GetActorMatchingStorageId
	ldr r1, [sl, #0x30]
	mov r7, r0
	cmp r7, r4
	add r8, sl, r1, lsl #3
	beq _02309FB8
	bl GetActiveRosterIndex
	mov r6, r0
	cmp r6, r4
	streq r5, [r8]
	streqh r7, [r8, #4]
	beq _02309FAC
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	streq fp, [r8]
	streqh r6, [r8, #4]
_02309FAC:
	ldr r0, [sl, #0x30]
	add r0, r0, #1
	str r0, [sl, #0x30]
_02309FB8:
	ldrsh r0, [sb]
	cmp r0, r4
	beq _0230A034
	ldr r0, [sl, #0x30]
	cmp r0, #6
	blt _02309F60
	b _0230A034
_02309FD4:
	mov r7, #0
	mov r8, sl
	mov r5, r7
	mov r6, #1
	mov r4, #2
_02309FE8:
	mov r0, r7
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0230A020
	str r4, [r8]
	strh r7, [r8, #4]
	ldr r0, [sl, #0x30]
	add r8, r8, #8
	add r0, r0, #1
	str r0, [sl, #0x30]
_0230A020:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _02309FE8
_0230A034:
	ldr r0, [sl, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230A03C: .word ov11_02322DC8
_0230A040: .word ov11_02322DF0
	arm_func_end ov11_02309EE4

	arm_func_start ov11_0230A044
ov11_0230A044: ; 0x0230A044
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #1
	bne _0230A064
	ldrsh r0, [r0, #4]
	bl GetTeamMember
	add r0, r0, #0x3a
	ldmia sp!, {r3, pc}
_0230A064:
	cmp r1, #2
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl GetActiveTeamMember
	add r0, r0, #0x5e
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230A044

	arm_func_start ov11_0230A07C
ov11_0230A07C: ; 0x0230A07C
	stmdb sp!, {r3, lr}
	ldr r0, _0230A0CC ; =ov11_02322ECC
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230A0D0 ; =ov11_02324D94
	mov r3, #0
	str r0, [r1]
	str r3, [r0, #4]
	ldr r0, [r1]
	sub r2, r3, #2
	str r3, [r0, #8]
	ldr r0, [r1]
	strb r2, [r0]
	ldr r0, [r1]
	strb r2, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230A0CC: .word ov11_02322ECC
_0230A0D0: .word ov11_02324D94
	arm_func_end ov11_0230A07C

	arm_func_start ov11_0230A0D4
ov11_0230A0D4: ; 0x0230A0D4
	stmdb sp!, {r3, lr}
	ldr r0, _0230A0FC ; =ov11_02324D94
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230A0FC ; =ov11_02324D94
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230A0FC: .word ov11_02324D94
	arm_func_end ov11_0230A0D4

	arm_func_start ov11_0230A100
ov11_0230A100: ; 0x0230A100
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x138
	ldr r0, _0230A2B0 ; =ov11_02324D94
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0230A2A4
_0230A120: ; jump table
	b _0230A13C ; case 0
	b _0230A184 ; case 1
	b _0230A13C ; case 2
	b _0230A1F4 ; case 3
	b _0230A258 ; case 4
	b _0230A298 ; case 5
	b _0230A298 ; case 6
_0230A13C:
	ldr lr, [r2, #4]
	ldr ip, _0230A2B4 ; =0x00003FB8
	mov r4, #0x10
	ldr r0, _0230A2B8 ; =ov11_02322EAC
	ldr r1, _0230A2BC ; =0x00401833
	ldr r3, _0230A2C0 ; =ov11_02322EDC
	add r2, sp, #0xa0
	str lr, [sp, #0xa0]
	strh ip, [sp, #0xa8]
	str r4, [sp, #0xac]
	bl CreateParentMenuFromStringIds
	ldr r1, _0230A2B0 ; =ov11_02324D94
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0230A2A4
_0230A184:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0230A2A4
	ldr r0, _0230A2B0 ; =ov11_02324D94
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _0230A2B0 ; =ov11_02324D94
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _0230A2B0 ; =ov11_02324D94
	mvn r2, #1
	ldr r1, [r0]
	cmp r4, #0
	strb r2, [r1]
	ldrlt r0, [r0]
	movlt r1, #6
	strlt r1, [r0, #8]
	blt _0230A2A4
	ldr r2, [r0]
	mov r1, #3
	str r4, [r2, #4]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230A2A4
_0230A1F4:
	mov r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, [r2, #4]
	ldr r0, _0230A2C0 ; =ov11_02322EDC
	mov r1, r1, lsl #3
	ldrh r1, [r0, r1]
	mov r4, #8
	ldr r0, _0230A2C4 ; =ov11_02322EBC
	strh r1, [sp, #0x10]
	ldr r2, [r2, #4]
	ldr r1, _0230A2C8 ; =0x00009833
	str r2, [sp, #8]
	str r4, [sp]
	mov r4, #1
	ldr r3, _0230A2CC ; =ov11_0230A2D0
	add r2, sp, #8
	str r4, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _0230A2B0 ; =ov11_02324D94
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0230A2A4
_0230A258:
	ldrsb r0, [r2, #1]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _0230A2A4
	ldr r0, _0230A2B0 ; =ov11_02324D94
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseAdvancedTextBox
	ldr r0, _0230A2B0 ; =ov11_02324D94
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #1]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230A2A4
_0230A298:
	bl ov11_02301174
	mov r0, #4
	b _0230A2A8
_0230A2A4:
	mov r0, #1
_0230A2A8:
	add sp, sp, #0x138
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230A2B0: .word ov11_02324D94
#if defined(EUROPE)
_0230A2B4: .word 0x00003FBA
#elif defined(JAPAN)
_0230A2B4: .word 0x000049BB
#else
_0230A2B4: .word 0x00003FB8
#endif
_0230A2B8: .word ov11_02322EAC
_0230A2BC: .word 0x00401833
_0230A2C0: .word ov11_02322EDC
_0230A2C4: .word ov11_02322EBC
_0230A2C8: .word 0x00009833
_0230A2CC: .word ov11_0230A2D0
	arm_func_end ov11_0230A100

	arm_func_start ov11_0230A2D0
ov11_0230A2D0: ; 0x0230A2D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02030A18
	mov r4, r0
	ldr r0, _0230A318 ; =ov11_02322EDC
	mov r1, r4, lsl #3
	ldrh r1, [r0, r1]
	mov r0, r5
	bl sub_02030A2C
#if defined(EUROPE)
	add r0, r4, #0xc3
	add r0, r0, #0x3f00
#elif defined(JAPAN)
	add r0, r4, #0x1c4
	add r0, r0, #0x4800
#else
	add r0, r4, #0xc1
	add r0, r0, #0x3f00
#endif
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r3, r1, lsr #0x10
	mov r1, #4
	mov r2, #0x10
	bl sub_02026268
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230A318: .word ov11_02322EDC
	arm_func_end ov11_0230A2D0

	arm_func_start ov11_0230A31C
ov11_0230A31C: ; 0x0230A31C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x148
	mov r1, #8
	bl MemAlloc
	ldr r2, _0230A38C ; =ov11_02324D98
	mov r1, #0x148
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0230A38C ; =ov11_02324D98
	mov ip, #4
	ldr r4, [r0, #4]
	stmib r4, {r5, r6}
	add lr, r4, #0xc
_0230A358:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230A358
	ldr r1, [r6]
	mvn r0, #1
	str r1, [lr]
	strb r0, [r4, #0x74]
	strb r0, [r4, #0x78]
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x144]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230A38C: .word ov11_02324D98
	arm_func_end ov11_0230A31C

	arm_func_start ov11_0230A390
ov11_0230A390: ; 0x0230A390
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1b4
	ldr r0, _0230AD0C ; =ov11_02324D98
	ldr sb, [r0, #4]
	ldr r0, [sb]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0230AD00
_0230A3B0: ; jump table
	b _0230A3EC ; case 0
	b _0230A41C ; case 1
	b _0230A4B8 ; case 2
	b _0230A510 ; case 3
	b _0230A68C ; case 4
	b _0230A68C ; case 5
	b _0230A6C8 ; case 6
	b _0230A6E4 ; case 7
	b _0230A750 ; case 8
	b _0230A844 ; case 9
	b _0230A958 ; case 10
	b _0230A98C ; case 11
	b _0230A9D0 ; case 12
	b _0230AB1C ; case 13
	b _0230ACE4 ; case 14
_0230A3EC:
	ldr r0, [sb, #8]
	ldrb r0, [r0, #1]
	cmp r0, #0x64
	bhs _0230A410
	ldr r0, [sb, #4]
	cmp r0, #0
	ble _0230A410
	mov r0, #1
	bl sub_02017C50
_0230A410:
	mov r0, #1
	str r0, [sb]
	b _0230AD00
_0230A41C:
	ldr r5, [sb, #8]
	ldrb r2, [r5, #1]
	cmp r2, #0x64
	bhs _0230A440
	ldrb r1, [sb, #0xd]
	ldr r0, [sb, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _0230A44C
_0230A440:
	mov r0, #0xd
	str r0, [sb]
	b _0230AD00
_0230A44C:
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, r5
	bl sub_020546E8
	add r0, sp, #0x164
	bl InitPreprocessorArgs
	mov r0, r5
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r4
	mov r1, r5
	bl sub_02056094
	str r4, [sp, #0x19c]
	ldrb r2, [r5, #1]
	ldr r1, _0230AD10 ; =0x000004A6
	mov r0, #0x1c
	str r2, [sp, #0x188]
	add r2, sp, #0x164
	bl sub_02046BE8
	mov r0, r4
	bl MemFree
	mov r0, #2
	str r0, [sb]
	b _0230AD00
_0230A4B8:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	bne _0230AD00
#ifdef JAPAN
	ldr r0, [sb, #8]
	ldr r3, _0230C2B4 ; =0x000003E7
	ldrsh r1, [r0, #4]
	ldrb r2, [r0, #1]
	add r0, sb, #0x54
#else
	ldr r3, [sb, #8]
	add r0, sb, #0x54
	ldrsh r1, [r3, #4]
	ldrb r2, [r3, #1]
	ldrsh r3, [r3, #8]
#endif
	bl sub_02053A0C
	strh r0, [sb, #0x50]
	mov r0, #0
	strh r0, [sb, #0x52]
	ldrh r0, [sb, #0x50]
	cmp r0, #0
	movne r0, #3
	strne r0, [sb]
	moveq r0, #1
	streq r0, [sb]
	b _0230AD00
_0230A510:
	ldrh r1, [sb, #0x52]
	ldrh r0, [sb, #0x50]
	ldr r4, [sb, #8]
	mov r8, #0
	cmp r1, r0
	movhs r0, #1
	sub r5, r8, #1
	strhs r0, [sb]
	bhs _0230AD00
	mov sl, r8
	add r2, sb, r1, lsl #1
	mov r6, r8
	mov r7, #1
	mov r0, #6
	b _0230A58C
_0230A54C:
	mla r3, sl, r0, r4
	ldrb r1, [r3, #0x22]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _0230A580
	ldrh r3, [r3, #0x24]
	ldrh r1, [r2, #0x54]
	cmp r3, r1
	bne _0230A588
	mov r8, #1
	b _0230A594
_0230A580:
	cmp r5, #0
	movlt r5, sl
_0230A588:
	add sl, sl, #1
_0230A58C:
	cmp sl, #4
	blt _0230A54C
_0230A594:
	cmp r8, #0
	ldrneh r0, [sb, #0x52]
	addne r0, r0, #1
	strneh r0, [sb, #0x52]
	bne _0230AD00
	add r0, sp, #0x114
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	mov r0, r4
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl sub_02056094
	str r6, [sp, #0x14c]
	cmp r5, #0
	blt _0230A644
	ldrh r1, [sb, #0x52]
	add r2, r4, #0x22
	mov r0, #6
	add r1, sb, r1, lsl #1
	mla r0, r5, r0, r2
	ldrh r1, [r1, #0x54]
	bl GetInfoMoveGround
	ldrh r2, [sb, #0x52]
	ldr r0, _0230AD14 ; =0x0000131B
	mov r1, #0x100
	add r2, sb, r2, lsl #1
	ldrh r2, [r2, #0x54]
	str r2, [sp, #0x124]
	bl sub_02017C74
	ldr r1, _0230AD18 ; =0x000004A8
	add r2, sp, #0x114
	mov r0, #0x1c
	bl sub_02046BE8
	ldrh r1, [sb, #0x52]
	mov r0, #4
	add r1, r1, #1
	strh r1, [sb, #0x52]
	b _0230A67C
_0230A644:
	ldrsh r2, [r4, #4]
	ldr r0, _0230AD1C ; =0xFFFFFE5E
	ldr r1, _0230AD20 ; =0x000004A9
#ifdef JAPAN
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	addls r1, r1, #1
#else
	add r2, r2, r0
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #3
	rsbls r1, r0, #0x308
#endif
	add r2, sp, #0x114
	mov r0, #0x1c
	bl sub_02046BE8
	mov r0, #5
_0230A67C:
	str r0, [sb]
	mov r0, r6
	bl MemFree
	b _0230AD00
_0230A68C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	bne _0230AD00
	ldr r0, [sb]
	cmp r0, #5
	moveq r0, #0
	streqh r0, [sb, #0x76]
	moveq r0, #6
	streq r0, [sb]
	movne r0, #1
	strne r0, [sb]
	b _0230AD00
_0230A6C8:
	bl sub_02046D20
	mov r0, #7
	str r0, [sb]
	bl sub_020037A4
	add r0, r0, #0xa
	str r0, [sb, #0x144]
	b _0230AD00
_0230A6E4:
	bl sub_020037A4
	ldr r1, [sb, #0x144]
	cmp r1, r0
	bge _0230AD00
	ldr r1, _0230AD0C ; =ov11_02324D98
	mvn r0, #1
	ldr r4, [r1, #4]
	ldrsb r1, [r4, #0x74]
	cmp r1, r0
	bne _0230A744
	ldrh r0, [r4, #0x52]
	add r0, r4, r0, lsl #1
	ldrh r0, [r0, #0x54]
	bl sub_0203FD14
	ldr r0, [r4, #8]
	bl sub_02055894
	bl sub_0203FA64
	mov r1, #0
	mov r2, r1
	mov r0, #3
	bl sub_0204018C
	strb r0, [r4, #0x74]
	ldrsh r0, [r4, #0x76]
	bl sub_020410A4
_0230A744:
	mov r0, #8
	str r0, [sb]
	b _0230AD00
_0230A750:
	bl sub_020407EC
	cmp r0, #1
	beq _0230AD00
	cmp r0, #7
	bne _0230A7A4
	bl sub_02041094
	strh r0, [sb, #0x76]
	bl sub_0203FD38
	mov r1, r0
	add r0, sb, #0x7a
	mov r2, #0x20
	bl MemcpySimple
	ldrh r1, [sb, #0x52]
	add r0, sb, #0x9a
	add r1, sb, r1, lsl #1
	ldrh r1, [r1, #0x54]
	bl InitMove
	bl ov11_0230ADCC
	mov r0, #0xa
	str r0, [sb]
	b _0230AD00
_0230A7A4:
	cmp r0, #2
	bne _0230AD00
	bl sub_02041094
	strh r0, [sb, #0x76]
	add r0, sb, #0xa4
	mov r1, #0x98
	bl MemZero
	mov r2, #0
	mov r1, r2
_0230A7C8:
	add r0, sb, r2
	add r2, r2, #1
	strb r1, [r0, #0x13c]
	cmp r2, #5
	blt _0230A7C8
	ldrsh r0, [sb, #0x76]
	cmp r0, #4
	bge _0230A7F4
	bl sub_02041364
	cmp r0, #0
	bne _0230A7FC
_0230A7F4:
	mov r0, #3
	strb r0, [sb, #0x13d]
_0230A7FC:
	ldr r0, _0230AD0C ; =ov11_02324D98
	ldr r1, _0230AD24 ; =ov11_02322F5C
	ldrsb r3, [r0]
	add r2, sb, #0x13c
	ldr r0, _0230AD28 ; =ov11_02322F58
	ldr r3, [r1, r3, lsl #3]
	mov r1, #0
	str r3, [sb, #0xa4]
	str r2, [sb, #0x104]
	stmia sp, {r0, r1}
	ldr r0, _0230AD2C ; =ov11_02322F30
	ldr r2, _0230AD30 ; =0x00000233
	add r3, sb, #0xa4
	str r1, [sp, #8]
	bl sub_02046A20
	mov r0, #9
	str r0, [sb]
	b _0230AD00
_0230A844:
	bl ov11_0230AD94
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _0230AD0C ; =ov11_02324D98
	cmp r4, #6
	strb r0, [r1]
	bne _0230A870
	bl sub_020416FC
	mov r0, #6
	str r0, [sb]
	b _0230AD00
_0230A870:
	cmp r4, #1
	bne _0230A8F8
	ldrsh r0, [sb, #0x76]
	cmp r0, #4
	bge _0230A890
	bl sub_02041364
	cmp r0, #0
	bne _0230A898
_0230A890:
	ldr r4, _0230AD34 ; =0x000004AC
	b _0230A89C
_0230A898:
	ldr r4, _0230AD38 ; =0x000004AB
_0230A89C:
	add r0, sp, #0xc4
	bl InitPreprocessorArgs
	ldrsh r0, [sb, #0x76]
	bl sub_02041154
	str r0, [sp, #0xd4]
	bl ov11_0230ADCC
	add r0, sb, #0xa4
	mov r1, #0x98
	bl MemZero
	mov r0, #5
	str r0, [sb, #0xa4]
	ldr r1, _0230AD3C ; =ov11_02322F40
	add r0, sp, #0xc4
	stmia sp, {r1, r4}
	str r0, [sp, #8]
	mov r0, #0
	mov r1, r0
	mov r2, #0x33
	add r3, sb, #0xa4
	bl sub_02046A20
	mov r0, #0xc
	str r0, [sb]
	b _0230AD00
_0230A8F8:
	cmp r4, #2
	bne _0230A918
	ldrsh r0, [sb, #0x76]
	bl sub_02041394
	bl ov11_0230ADCC
	mov r0, #6
	str r0, [sb]
	b _0230AD00
_0230A918:
	cmp r4, #3
	bne _0230AD00
	bl sub_0203FD38
	mov r1, r0
	add r0, sb, #0x7a
	mov r2, #0x20
	bl MemcpySimple
	ldrh r1, [sb, #0x52]
	add r0, sb, #0x9a
	add r1, sb, r1, lsl #1
	ldrh r1, [r1, #0x54]
	bl InitMove
	bl ov11_0230ADCC
	mov r0, #0xa
	str r0, [sb]
	b _0230AD00
_0230A958:
	ldrsb r1, [sb, #0x78]
	mvn r0, #1
	cmp r1, r0
	bne _0230A980
	ldrsh r2, [sb, #0x76]
	add r0, sb, #0x7a
	mov r1, #5
	mov r3, #1
	bl sub_020417A8
	strb r0, [sb, #0x78]
_0230A980:
	mov r0, #0xb
	str r0, [sb]
	b _0230AD00
_0230A98C:
	bl sub_02041A18
	cmp r0, #1
	bne _0230AD00
	ldr r1, _0230AD0C ; =ov11_02324D98
	mvn r0, #1
	ldr r4, [r1, #4]
	ldrsb r1, [r4, #0x78]
	cmp r1, r0
	beq _0230A9C4
	bl sub_02041A00
	ldrsb r0, [r4, #0x78]
	bl CloseScrollBox
	mvn r0, #1
	strb r0, [r4, #0x78]
_0230A9C4:
	mov r0, #6
	str r0, [sb]
	b _0230AD00
_0230A9D0:
	bl ov11_0230AD94
	cmp r0, #4
	bne _0230AB08
	ldrsh r0, [sb, #0x76]
	cmp r0, #4
	blt _0230AA00
	ldrh r1, [sb, #0x52]
	mov r0, #1
	add r1, r1, #1
	strh r1, [sb, #0x52]
	str r0, [sb]
	b _0230AAFC
_0230AA00:
	ldr r7, [sb, #8]
	mvn r5, #0
	bl sub_02041484
	bl sub_0203FD38
	mov r6, r0
	mov r8, #0
	add r4, r7, #0x22
	mov fp, #6
_0230AA20:
	mul sl, r8, fp
	add r0, r4, sl
	add r1, r6, r8, lsl #3
	bl DungeonMoveToGroundMove
	cmp r5, #0
	bge _0230AA54
	add r0, r7, sl
	ldrb r0, [r0, #0x22]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r5, r8
_0230AA54:
	add r8, r8, #1
	cmp r8, #4
	blt _0230AA20
	add r0, sp, #0x74
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, r7
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r4
	mov r1, r7
	bl sub_02056094
	add r1, r7, #0x22
	mov r0, #6
	str r4, [sp, #0xac]
	mla r0, r5, r0, r1
	ldrh r1, [sb, #0x52]
	add r1, sb, r1, lsl #1
	ldrh r1, [r1, #0x54]
	bl GetInfoMoveGround
	ldrh r2, [sb, #0x52]
	ldr r0, _0230AD14 ; =0x0000131B
	mov r1, #0x100
	add r2, sb, r2, lsl #1
	ldrh r2, [r2, #0x54]
	str r2, [sp, #0x84]
	bl sub_02017C74
	ldr r1, _0230AD18 ; =0x000004A8
	mov r0, #0x1c
	add r2, sp, #0x74
	bl sub_02046BE8
	ldrh r2, [sb, #0x52]
	mov r0, r4
	mov r1, #4
	add r2, r2, #1
	strh r2, [sb, #0x52]
	str r1, [sb]
	bl MemFree
_0230AAFC:
	mov r0, #0
	bl sub_020410A4
	b _0230AD00
_0230AB08:
	sub r0, r0, #5
	cmp r0, #1
	movls r0, #6
	strls r0, [sb]
	b _0230AD00
_0230AB1C:
	mov r0, #0x400
	mov r1, #0xf
	ldr r6, [sb, #8]
	mov r7, #0
	bl MemAlloc
	mov r4, r0
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	str r0, [sp, #0xc]
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r0, r7
	strb r0, [r4]
	mov r0, r6
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r5
	mov r1, r6
	bl sub_02056094
	add r0, sp, #0x24
	bl InitPreprocessorArgs
	mov r8, r7
	ldrb r1, [r6, #0xc]
	ldrb r0, [sb, #0x18]
	ldrsh r3, [r6, #0xa]
	ldrsh r2, [sb, #0x16]
	sub r0, r1, r0
	str r0, [sp, #0x14]
	sub r2, r3, r2
	str r2, [sp, #0x10]
	ldrb r1, [r6, #0xe]
	ldrb r0, [sb, #0x1a]
	ldrb r3, [r6, #0xd]
	ldrb r2, [sb, #0x19]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	sub r2, r3, r2
	ldrb r1, [r6, #0xf]
	ldrb r0, [sb, #0x1b]
	str r2, [sp, #0x18]
	mov sl, r8
	sub r0, r1, r0
	str r0, [sp, #0x20]
_0230ABD8:
	add r0, sp, #0x10
	ldr fp, [r0, sl, lsl #2]
	cmp fp, #0
	ble _0230AC58
	cmp r7, #0
	beq _0230AC10
	cmp r8, #3
	beq _0230AC04
	ldr r1, _0230AD40 ; =ov11_02322F80
	mov r0, r4
	bl strcat
_0230AC04:
	ldr r1, _0230AD44 ; =ov11_02322F84
	mov r0, r4
	bl strcat
_0230AC10:
	add r0, sp, #0x24
	ldr r2, _0230AD48 ; =ov11_02322F24
	mov r3, sl, lsl #1
	ldrh r2, [r2, r3]
	str r5, [sp, #0x5c]
	add r0, r0, sl, lsl #2
	str fp, [r0, #0x24]
	add r0, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	ldr r1, [sp, #0xc]
	mov r0, r4
	bl strcat
	mov r7, #1
	add r8, r8, #1
_0230AC58:
	add sl, sl, #1
	cmp sl, #5
	blt _0230ABD8
	ldr r1, _0230AD44 ; =ov11_02322F84
	mov r0, r4
	bl strcat
	cmp r7, #0
	beq _0230AC8C
	add r2, sp, #0x24
	mov r1, r4
	mov r0, #0x1c
	bl sub_02046C30
	b _0230ACB4
_0230AC8C:
	ldrb r1, [r6, #1]
	ldrb r0, [sb, #0xd]
	cmp r1, r0
	bne _0230ACB4
	ldr r1, _0230AD4C ; =0x000004A7
	add r2, sp, #0x24
	mov r0, #0x1c
	str r5, [sp, #0x5c]
	bl sub_02046BE8
	mov r7, #1
_0230ACB4:
	mov r0, r4
	bl MemFree
	ldr r0, [sp, #0xc]
	bl MemFree
	mov r0, r5
	bl MemFree
	cmp r7, #0
	movne r0, #0xe
	strne r0, [sb]
	bne _0230AD00
	mov r0, #1
	b _0230AD04
_0230ACE4:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	moveq r0, #1
	beq _0230AD04
_0230AD00:
	mov r0, #0
_0230AD04:
	add sp, sp, #0x1b4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV11_0230A390_OFFSET 0x3725
#else
#define OV11_0230A390_OFFSET 0
#endif
_0230AD0C: .word ov11_02324D98
_0230AD10: .word 0x000004A6 + OV11_0230A390_OFFSET
#ifdef JAPAN
_0230C2B4: .word 0x000003E7
#endif
_0230AD14: .word 0x0000131B
_0230AD18: .word 0x000004A8 + OV11_0230A390_OFFSET
_0230AD1C: .word 0xFFFFFE5E
_0230AD20: .word 0x000004A9 + OV11_0230A390_OFFSET
_0230AD24: .word ov11_02322F5C
_0230AD28: .word ov11_02322F58
_0230AD2C: .word ov11_02322F30
_0230AD30: .word 0x00000233
_0230AD34: .word 0x000004AC + OV11_0230A390_OFFSET
_0230AD38: .word 0x000004AB + OV11_0230A390_OFFSET
_0230AD3C: .word ov11_02322F40
_0230AD40: .word ov11_02322F80
_0230AD44: .word ov11_02322F84
_0230AD48: .word ov11_02322F24
_0230AD4C: .word 0x000004A7 + OV11_0230A390_OFFSET
	arm_func_end ov11_0230A390

	arm_func_start ov11_0230AD50
ov11_0230AD50: ; 0x0230AD50
	stmdb sp!, {r3, lr}
	ldr r0, _0230AD78 ; =ov11_02324D98
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230AD78 ; =ov11_02324D98
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230AD78: .word ov11_02324D98
	arm_func_end ov11_0230AD50

	arm_func_start ov11_0230AD7C
ov11_0230AD7C: ; 0x0230AD7C
	ldrb r0, [r0, #1]
	cmp r0, #0x64
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov11_0230AD7C

	arm_func_start ov11_0230AD94
ov11_0230AD94: ; 0x0230AD94
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r2, #0
	cmp r0, r2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	sub r1, r2, #1
	cmp r0, r1
	moveq r0, #6
	ldmeqia sp!, {r3, pc}
	sub r1, r2, #2
	cmp r0, r1
	moveq r0, #6
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230AD94

	arm_func_start ov11_0230ADCC
ov11_0230ADCC: ; 0x0230ADCC
	stmdb sp!, {r4, lr}
	ldr r1, _0230AE0C ; =ov11_02324D98
	mvn r0, #1
	ldr r4, [r1, #4]
	ldrsb r1, [r4, #0x74]
	cmp r1, r0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	bl sub_02055894
	bl sub_0203FD80
	bl sub_020407C0
	ldrsb r0, [r4, #0x74]
	bl CloseAdvancedTextBox
	mvn r0, #1
	strb r0, [r4, #0x74]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230AE0C: .word ov11_02324D98
	arm_func_end ov11_0230ADCC

	arm_func_start ov11_0230AE10
ov11_0230AE10: ; 0x0230AE10
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	cmp r0, #0
	cmpne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0x10
	mov r1, #8
	bl MemAlloc
	ldr r2, _0230AE78 ; =ov11_02324DA0
	mov r1, #0x10
	str r0, [r2]
	bl MemZero
	ldr r0, _0230AE78 ; =ov11_02324DA0
	ldmia r5, {r1, r2}
	ldr r4, [r0]
	str r1, [r4]
	add r0, r4, #0xc
	add r1, r4, #0xe
	str r2, [r4, #4]
	bl ov11_0230C050
	ldr r1, _0230AE7C ; =ov11_02322F98
	ldr r2, _0230AE80 ; =GetExclusiveItemRequirements
	add r0, r4, #8
	bl sub_0204707C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230AE78: .word ov11_02324DA0
_0230AE7C: .word ov11_02322F98
_0230AE80: .word GetExclusiveItemRequirements
	arm_func_end ov11_0230AE10

	arm_func_start ov11_0230AE84
ov11_0230AE84: ; 0x0230AE84
	stmdb sp!, {r3, lr}
	ldr r0, _0230AECC ; =ov11_02324DA0
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #8]
	cmpne r0, #0
	beq _0230AEC4
	bl sub_020470D0
	ldr r0, _0230AECC ; =ov11_02324DA0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_02047148
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0230AEC4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230AECC: .word ov11_02324DA0
	arm_func_end ov11_0230AE84

	arm_func_start ov11_0230AED0
ov11_0230AED0: ; 0x0230AED0
	stmdb sp!, {r3, lr}
	ldr r0, _0230AF08 ; =ov11_02324DA0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #8
	bl sub_02047150
	ldr r0, _0230AF08 ; =ov11_02324DA0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230AF08 ; =ov11_02324DA0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230AF08: .word ov11_02324DA0
	arm_func_end ov11_0230AED0

	arm_func_start ov11_0230AF0C
ov11_0230AF0C: ; 0x0230AF0C
	ldr r1, _0230AF30 ; =ov11_02324DA0
	ldr r2, [r0]
	ldr r3, [r1]
	ldr r1, [r0, #4]
	ldr ip, _0230AF34 ; =sub_02047188
	str r2, [r3]
	add r0, r3, #8
	str r1, [r3, #4]
	bx ip
	.align 2, 0
_0230AF30: .word ov11_02324DA0
_0230AF34: .word sub_02047188
	arm_func_end ov11_0230AF0C

	arm_func_start GetExclusiveItemRequirements
GetExclusiveItemRequirements: ; 0x0230AF38
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x15c
	ldr r1, _0230B1DC ; =ov11_02324DA0
	mov r7, r0
	ldr r6, [r1]
	add r0, sp, #0xa
	ldrsh r8, [r6, #4]
	mov r2, #0
	mov r3, #1
	add r1, sp, #4
	strh r8, [sp, #8]
	strh r2, [sp, #6]
	strb r3, [sp, #4]
	mov sb, #0x10
	bl sub_0200D670
	add r0, sp, #0x10c
	bl InitPreprocessorArgs
	mov r0, r7
	mov r1, #0x18
	mov r2, sb
	add r3, sp, #0xa
	bl DrawTextInWindow
	mov r0, r8
	bl ov11_0230C068
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230AFF8
_0230AFA4: ; jump table
	b _0230AFB4 ; case 0
	b _0230AFB4 ; case 1
	b _0230AFCC ; case 2
	b _0230AFE4 ; case 3
_0230AFB4:
	ldr r3, _0230B1E0 ; =ov11_02322FA8
	mov r0, r7
	mov r1, #0x6c
	mov r2, sb
	bl DrawTextInWindow
	b _0230AFF8
_0230AFCC:
	ldr r3, _0230B1E4 ; =ov11_02322FB0
	mov r0, r7
	mov r1, #0x6c
	mov r2, sb
	bl DrawTextInWindow
	b _0230AFF8
_0230AFE4:
	ldr r3, _0230B1E8 ; =ov11_02322FC0
	mov r0, r7
	mov r1, #0x6c
	mov r2, sb
	bl DrawTextInWindow
_0230AFF8:
	ldr r0, [r6]
	cmp r0, #0
	bne _0230B144
	ldr r3, _0230B1EC ; =0x000004B2
	mov r0, r7
	mov r1, #0x18
	mov r2, #0x28
	mov r4, #0
	bl sub_02026268
	ldr r3, _0230B1F0 ; =0x000004B3
	mov r0, r7
	mov r1, #0x7a
	mov r2, #0x28
	bl sub_02026268
	mov r0, r8
	add sb, sb, #0x30
	bl GetExclusiveItemType
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0230B0E0
_0230B048: ; jump table
	b _0230B0E0 ; case 0
	b _0230B0E0 ; case 1
	b _0230B0E0 ; case 2
	b _0230B074 ; case 3
	b _0230B088 ; case 4
	b _0230B0E0 ; case 5
	b _0230B0E0 ; case 6
	b _0230B074 ; case 7
	b _0230B088 ; case 8
	b _0230B0E0 ; case 9
	b _0230B09C ; case 10
_0230B074:
	sub r0, r8, #2
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r4, #2
	b _0230B0E0
_0230B088:
	sub r0, r8, #3
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r4, #3
	b _0230B0E0
_0230B09C:
	sub r0, r8, #0x1bc
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #7
	ldrls r5, _0230B1F4 ; =0x000002FE
	movls r4, #3
	bls _0230B0E0
	sub r0, r8, #0x1c4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	ldrls r5, _0230B1F8 ; =0x00000336
	movls r4, #3
_0230B0E0:
	mov sl, #0
	add fp, sp, #0x10c
	b _0230B138
_0230B0EC:
	mov r0, r5
	str r5, [sp, #0x11c]
	bl CountNbItemsOfTypeInBag
	mov r8, r0
	mov r0, r5
	bl CountNbItemsOfTypeInStorage
	add r0, r8, r0
	str r0, [sp, #0x130]
	ldr r3, _0230B1FC ; =0x000004B5
	mov r0, r7
	mov r1, #0x18
	mov r2, sb
	str fp, [sp]
	bl sub_020262E0
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	add sb, sb, #0xc
	mov r5, r0, asr #0x10
	add sl, sl, #1
_0230B138:
	cmp sl, r4
	blt _0230B0EC
	b _0230B184
_0230B144:
	cmp r0, #1
	bne _0230B184
	ldr r3, _0230B1EC ; =0x000004B2
	mov r0, r7
	mov r1, #0x18
	mov r2, #0x28
	bl sub_02026268
	ldrh r0, [r6, #6]
	ldr r3, _0230B200 ; =0x000004B4
	add r4, sp, #0x10c
	str r0, [sp, #0x130]
	mov r0, r7
	mov r1, #0x18
	mov r2, #0x40
	str r4, [sp]
	bl sub_020262E0
_0230B184:
	ldrh r0, [r6, #0xc]
	add r1, sp, #0x10c
	ldr r3, _0230B204 ; =0x000004B6
	str r0, [sp, #0x130]
	str r1, [sp]
	mov r0, r7
	mov r1, #0x1c
	mov r2, #0x7e
	bl sub_020262E0
	ldrh r0, [r6, #0xe]
	ldr r3, _0230B208 ; =0x000004B7
	add r4, sp, #0x10c
	str r0, [sp, #0x130]
	mov r0, r7
	mov r1, #0x1c
	mov r2, #0x8a
	str r4, [sp]
	bl sub_020262E0
	mov r0, r7
	bl UpdateWindow
	add sp, sp, #0x15c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET 0x3528
#else
#define GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET 0
#endif
_0230B1DC: .word ov11_02324DA0
_0230B1E0: .word ov11_02322FA8
_0230B1E4: .word ov11_02322FB0
_0230B1E8: .word ov11_02322FC0
_0230B1EC: .word 0x000004B2 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B1F0: .word 0x000004B3 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B1F4: .word 0x000002FE
_0230B1F8: .word 0x00000336
_0230B1FC: .word 0x000004B5 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B200: .word 0x000004B4 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B204: .word 0x000004B6 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B208: .word 0x000004B7 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
	arm_func_end GetExclusiveItemRequirements

	arm_func_start ov11_0230B20C
ov11_0230B20C: ; 0x0230B20C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r2, _0230B664 ; =ov11_02324DA4
	mov r4, r0
	ldr r0, [r2, #4]
	mov r8, r1
	cmp r0, #0
	ldr r5, _0230B668 ; =0x00401A33
	mov r6, #0
	ldr r7, _0230B66C ; =ov11_0230BD5C
	bne _0230B24C
	ldr r0, _0230B670 ; =0x000046D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230B664 ; =ov11_02324DA4
	str r0, [r1, #4]
_0230B24C:
	ldr r0, _0230B664 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	str r4, [r0]
	bl ov11_0230BF98
	bl LoadSynthBin
	ldr sb, _0230B664 ; =ov11_02324DA4
	mov r2, #0
	ldr r3, [sb, #4]
	mov r1, #0x10
	add r3, r3, #0x4000
	strb r0, [r3, #0x6c4]
	ldr r0, [sb, #4]
	cmp r4, #3
	add r0, r0, #0x4000
	str r2, [r0, #0x6c8]
	ldr r0, [sb, #4]
	add r0, r0, #0x4000
	str r2, [r0, #0x6cc]
	ldr r0, [sb, #4]
	add r0, r0, #0x4000
	str r1, [r0, #0x638]
	addls pc, pc, r4, lsl #2
	b _0230B474
_0230B2A8: ; jump table
	b _0230B2B8 ; case 0
	b _0230B2EC ; case 1
	b _0230B308 ; case 2
	b _0230B428 ; case 3
_0230B2B8:
	bl ov11_0230C3CC
	bl ov11_0230C61C
	mov r0, sb
	ldr r0, [r0, #4]
	add r0, r0, #0xe6
	add r0, r0, #0x4500
	bl sub_020130B8
	mov r0, sb
	ldr r0, [r0, #4]
	ldr r1, _0230B674 ; =0x000003A6
	add r0, r0, #0x4600
	strh r1, [r0, #0x34]
	b _0230B474
_0230B2EC:
	bl ov11_0230C4D4
	mov r0, sb
	ldr r0, [r0, #4]
	ldr r1, _0230B678 ; =0x000003A7
	add r0, r0, #0x4600
	strh r1, [r0, #0x34]
	b _0230B474
_0230B308:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02011420
	mov sb, #0
	mov sl, sb
	str r0, [sp, #0x14]
	mov fp, sb
	b _0230B370
_0230B328:
	ldr r1, [r1]
	mov r0, sl, lsl #1
	ldrsh r0, [r1, r0]
	bl GetExclusiveItemType
	cmp r0, #1
	blt _0230B348
	cmp r0, #4
	ble _0230B36C
_0230B348:
	ldr r1, [sp, #0x14]
	mov r0, sb, lsl #0x10
	ldr r2, [r1]
	mov r1, sl, lsl #1
	ldrh r2, [r2, r1]
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add sb, sb, #1
_0230B36C:
	add sl, sl, #1
_0230B370:
	ldr r1, [sp, #0x14]
	ldr r0, [r1, #4]
	cmp sl, r0
	blt _0230B328
	mov sl, #0
	mov fp, sl
	b _0230B3D4
_0230B38C:
	ldr r1, [r0]
	mov r0, sl, lsl #1
	ldrsh r0, [r1, r0]
	bl GetExclusiveItemType
	cmp r0, #1
	blt _0230B3D0
	cmp r0, #4
	bgt _0230B3D0
	ldr r1, [sp, #0x14]
	mov r0, sb, lsl #0x10
	ldr r2, [r1]
	mov r1, sl, lsl #1
	ldrh r2, [r2, r1]
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add sb, sb, #1
_0230B3D0:
	add sl, sl, #1
_0230B3D4:
	ldr r0, [sp, #0x14]
	ldr r2, [r0, #4]
	cmp sl, r2
	blt _0230B38C
	ldr r1, _0230B664 ; =ov11_02324DA4
	add r0, sp, #0x14
	ldr r1, [r1, #4]
	add r1, r1, #0x4600
	strh r2, [r1, #0x26]
	bl sub_020114F8
	ldr r1, _0230B664 ; =ov11_02324DA4
	mov r0, r8, lsl #0x10
	ldr r2, [r1, #4]
	mov r3, r0, asr #0x10
	add r0, r2, #0x4000
	str r3, [r0, #0x63c]
	ldr r0, [r1, #4]
#ifdef JAPAN
	ldr r1, _0230CC20_JP ; =0x000032B2
#else
	mov r1, #0x3a8
#endif
	add r0, r0, #0x4600
	strh r1, [r0, #0x34]
	b _0230B474
_0230B428:
	add r1, sp, #0xc
	add r2, sp, #0xe
	mov r0, #1
	bl ov11_0230C1D0
	mov r3, sb
	ldr r1, [r3, #4]
	ldr r7, _0230B67C ; =0x0000032F
	add r1, r1, #0x4600
	strh r0, [r1, #0x26]
	ldr r0, [r3, #4]
	ldr r2, _0230B680 ; =0x80040004
	add r0, r0, #0x4600
	strh r7, [r0, #0x34]
	ldr r0, [r3, #4]
	ldr r6, _0230B684 ; =ov11_0230B78C
	add r0, r0, #0x4600
	ldr r7, _0230B688 ; =ov11_0230BE34
	strh r8, [r0, #0x28]
	orr r5, r5, r2
_0230B474:
	cmp r4, #0
	bne _0230B5A8
	ldr r0, _0230B664 ; =ov11_02324DA4
	mov r1, #6
	ldrsh r2, [r0]
	ldr r0, [r0, #4]
	add r0, r0, #0xe6
	smulbb r8, r2, r1
	add sb, r0, #0x1400
	ldrh r0, [sb, r8]
	add sl, sb, r8
	bl ov11_0230C9EC
	ldr r1, _0230B664 ; =ov11_02324DA4
	str r0, [sp, #0x18]
	ldrh r0, [r1]
	bl ov11_0230C970
	strh r0, [sp, #0x1c]
	ldrh r0, [sb, r8]
	cmp r0, #1
	movne r0, #0
	strneh r0, [sp, #0x1e]
	bne _0230B4E8
	ldr r0, _0230B664 ; =ov11_02324DA4
	ldrh r1, [sl, #2]
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #3
	add r0, r0, #0x4500
	ldrh r0, [r0, #0xea]
	strh r0, [sp, #0x1e]
_0230B4E8:
	add r0, sp, #0x18
	bl ov11_0230AE10
	ldr r0, _0230B664 ; =ov11_02324DA4
	add r1, sp, #0x12
	ldr r2, [r0, #4]
	ldrsh r8, [r0]
	add r3, r2, #0x4600
	add r2, sp, #0x10
	mov r0, #0
	strh r8, [r3, #0xd0]
	bl ov11_0230C1D0
	ldr fp, _0230B664 ; =ov11_02324DA4
	ldrh r2, [sp, #0x12]
	ldr r0, [fp, #4]
	ldrh r1, [sp, #0x10]
	add r0, r0, #0x4600
	ldrh r8, [r0, #0x26]
	add sb, r2, r1
	mov sl, #0
	b _0230B5A0
_0230B538:
	mov r0, sl, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r2, [fp, #4]
	mov r0, #6
	mla r0, r1, r0, r2
	add r0, r0, #0x1400
	ldrh r0, [r0, #0xe6]
	bl ov11_0230C9EC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bne _0230B59C
	ldr r0, [fp, #4]
	mov r1, #6
	mla r1, sl, r1, r0
	add r1, r1, #0x1400
	ldrh r1, [r1, #0xe8]
	add r1, r0, r1, lsl #3
	add r1, r1, #0x4500
	ldrh r1, [r1, #0xea]
	cmp r1, sb
	addgt r0, r0, sl
	addgt r1, r0, #0x1000
	movgt r0, #2
	strgtb r0, [r1, #0xb8]
_0230B59C:
	add sl, sl, #1
_0230B5A0:
	cmp sl, r8
	blt _0230B538
_0230B5A8:
	ldr r8, _0230B664 ; =ov11_02324DA4
	mov r1, r5
	ldr sb, [r8, #4]
	mov r3, r7
	add r2, sb, #0x4600
	ldrh r2, [r2, #0x26]
	ldr r0, _0230B68C ; =ov11_02322FE4
	mov r5, #8
	str r2, [sb, #4]
	ldr r2, [r8, #4]
	ldrsh r7, [r8]
	add r2, r2, #0x4000
	str r7, [r2, #0x62c]
	ldr sb, [r8, #4]
	add r2, sb, #0xb8
	add r7, r2, #0x1000
	add r2, sb, #0x4000
	str r7, [r2, #0x68c]
	ldr r2, [r8, #4]
	str r6, [sp]
	ldr r6, [r2, #4]
	add r2, r2, #0x22c
	str r6, [sp, #4]
	add r2, r2, #0x4400
	str r5, [sp, #8]
	bl CreateCollectionMenu
	mov r2, r8
	ldr r1, [r2, #4]
	cmp r4, #3
	add r1, r1, #0x1000
	strb r0, [r1, #0x4e4]
	bne _0230B65C
	ldr r0, [r2, #4]
	mov r1, #1
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl SetCollectionMenuField0x1C8
	mov r0, r8
	ldr r0, [r0, #4]
	ldr r1, _0230B690 ; =ov11_0230BF38
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl SetCollectionMenuField0x1A4
	bl ov11_0230CAA4
	bl ov11_0230C9F8
_0230B65C:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230B664: .word ov11_02324DA4
_0230B668: .word 0x00401A33
_0230B66C: .word ov11_0230BD5C
_0230B670: .word 0x000046D4
#ifdef JAPAN
_0230B674: .word 0x000032B0
_0230B678: .word 0x000032B1
_0230CC20_JP: .word 0x000032B2
_0230B67C: .word 0x000031F4
#else
_0230B674: .word 0x000003A6
_0230B678: .word 0x000003A7
_0230B67C: .word 0x0000032F
#endif
_0230B680: .word 0x80040004
_0230B684: .word ov11_0230B78C
_0230B688: .word ov11_0230BE34
_0230B68C: .word ov11_02322FE4
_0230B690: .word ov11_0230BF38
	arm_func_end ov11_0230B20C

	arm_func_start ov11_0230B694
ov11_0230B694: ; 0x0230B694
	stmdb sp!, {r4, lr}
	ldr r0, _0230B71C ; =ov11_02324DA4
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0230B6BC
	ldr r0, _0230B720 ; =0x000046D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230B71C ; =ov11_02324DA4
	str r0, [r1, #4]
_0230B6BC:
	bl LoadSynthBin
	mov r4, r0
	bl ov11_0230BF98
	bl ov11_0230C3CC
	bl ov11_0230C61C
	mov r0, #0
	bl sub_020130B8
	ldr r1, _0230B71C ; =ov11_02324DA4
	cmp r4, #0
	ldr r1, [r1, #4]
	add r1, r1, #0x4600
	ldrh r1, [r1, #0x26]
	add r4, r1, r0
	beq _0230B6F8
	bl CloseSynthBin
_0230B6F8:
	ldr r0, _0230B71C ; =ov11_02324DA4
	ldr r0, [r0, #4]
	bl MemFree
	ldr r1, _0230B71C ; =ov11_02324DA4
	mov r0, #0
	str r0, [r1, #4]
	cmp r4, #0
	movne r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230B71C: .word ov11_02324DA4
_0230B720: .word 0x000046D4
	arm_func_end ov11_0230B694

	arm_func_start ov11_0230B724
ov11_0230B724: ; 0x0230B724
	stmdb sp!, {r4, lr}
	ldr r0, _0230B784 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0230B74C
	ldr r0, _0230B788 ; =0x000046D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230B784 ; =ov11_02324DA4
	str r0, [r1, #4]
_0230B74C:
	bl ov11_0230BF98
	bl ov11_0230C4D4
	ldr r0, _0230B784 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r1, r0, #0x4600
	ldrh r4, [r1, #0x26]
	bl MemFree
	ldr r0, _0230B784 ; =ov11_02324DA4
	mov r1, #0
	str r1, [r0, #4]
	cmp r4, #0
	movne r1, #1
	and r0, r1, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230B784: .word ov11_02324DA4
_0230B788: .word 0x000046D4
	arm_func_end ov11_0230B724

	arm_func_start ov11_0230B78C
ov11_0230B78C: ; 0x0230B78C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230B870 ; =ov11_02324DA4
	tst r0, #0x400
	ldr r4, [r1, #4]
	beq _0230B868
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202C748
	add r1, r4, #0xe6
	add r2, r1, #0x1400
	mov r1, #6
	mla r5, r0, r1, r2
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0230B7E8
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r1, #0
	strb r1, [r5, #4]
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D07C
	b _0230B83C
_0230B7E8:
	bl ov11_0230B874
	add r1, r4, #0x4600
	ldrh r1, [r1, #0x28]
	cmp r0, r1
	bge _0230B834
	mov r0, #6
	bl PlaySeVolumeWrapper
	mov r0, #1
	strb r0, [r5, #4]
	bl ov11_0230B874
	add r1, r4, #0x4600
	ldrh r1, [r1, #0x28]
	cmp r1, r0
	bne _0230B83C
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	mov r1, #1
	bl sub_0202D07C
	b _0230B83C
_0230B834:
	mov r0, #2
	bl PlaySeVolumeWrapper
_0230B83C:
	ldr r0, _0230B870 ; =ov11_02324DA4
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6c8]
	cmp r0, #0
	beq _0230B860
	add r0, r1, #0x2c8
	add r0, r0, #0x4400
	bl sub_02047188
_0230B860:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0230B868:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230B870: .word ov11_02324DA4
	arm_func_end ov11_0230B78C

	arm_func_start ov11_0230B874
ov11_0230B874: ; 0x0230B874
	stmdb sp!, {r3, lr}
	ldr r1, _0230B8BC ; =ov11_02324DA4
	mov r0, #0
	ldr ip, [r1, #4]
	mov r3, r0
	add r1, ip, #0x4600
	ldrh lr, [r1, #0x26]
	mov r1, #6
	b _0230B8B0
_0230B898:
	mla r2, r3, r1, ip
	add r2, r2, #0x1000
	ldrb r2, [r2, #0x4ea]
	add r3, r3, #1
	cmp r2, #0
	addne r0, r0, #1
_0230B8B0:
	cmp r3, lr
	blt _0230B898
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230B8BC: .word ov11_02324DA4
	arm_func_end ov11_0230B874

	arm_func_start ov11_0230B8C0
ov11_0230B8C0: ; 0x0230B8C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230B910 ; =ov11_02324DA4
	mov r4, r0
	ldr r0, [r1, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	mov r5, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov11_0230C970
	ldr r1, _0230B910 ; =ov11_02324DA4
	strh r0, [r4]
	ldr r0, [r1, #4]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x2d00
	ldrh r0, [r0, #0xee]
	strh r0, [r4, #2]
	ldrsh r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230B910: .word ov11_02324DA4
	arm_func_end ov11_0230B8C0

	arm_func_start ov11_0230B914
ov11_0230B914: ; 0x0230B914
	stmdb sp!, {r3, lr}
	ldr r0, _0230B954 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	ldr r1, _0230B954 ; =ov11_02324DA4
	mov r0, r0, lsl #0x10
	ldr r2, [r1, #4]
	mov r1, r0, lsr #0x10
	mov r0, #6
	mla r0, r1, r0, r2
	add r0, r0, #0x1400
	ldrh r0, [r0, #0xe6]
	bl ov11_0230C9EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230B954: .word ov11_02324DA4
	arm_func_end ov11_0230B914

	arm_func_start ov11_0230B958
ov11_0230B958: ; 0x0230B958
	stmdb sp!, {r3, lr}
	ldr r0, _0230B9B8 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	ldr r2, _0230B9B8 ; =ov11_02324DA4
	mov r1, r0, lsl #0x10
	mov r3, r1, lsr #0x10
	ldr ip, [r2, #4]
	mov r1, #6
	mla r2, r3, r1, ip
	add r2, r2, #0x1400
	ldrh r2, [r2, #0xe6]
	cmp r2, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mla r1, r0, r1, ip
	add r0, r1, #0x1400
	ldrh r0, [r0, #0xe8]
	add r0, ip, r0, lsl #3
	add r0, r0, #0x4500
	ldrh r0, [r0, #0xea]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230B9B8: .word ov11_02324DA4
	arm_func_end ov11_0230B958

	arm_func_start ov11_0230B9BC
ov11_0230B9BC: ; 0x0230B9BC
	stmdb sp!, {r3, lr}
	ldr r0, _0230BA60 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_0230AED0
	bl ov11_0230CAE4
	bl ov11_0230CA38
	ldr r0, _0230BA60 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0x6c4]
	cmp r0, #0
	beq _0230B9F8
	bl CloseSynthBin
_0230B9F8:
	ldr r0, _0230BA60 ; =ov11_02324DA4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	cmp r0, r1
	beq _0230BA44
	bl sub_0202D0EC
	ldr r1, _0230BA60 ; =ov11_02324DA4
	strh r0, [r1]
	ldr r0, [r1, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202836C
	ldr r0, _0230BA60 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl CloseCollectionMenu
_0230BA44:
	ldr r0, _0230BA60 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230BA60 ; =ov11_02324DA4
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BA60: .word ov11_02324DA4
	arm_func_end ov11_0230B9BC

	arm_func_start ov11_0230BA64
ov11_0230BA64: ; 0x0230BA64
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r0, _0230BB18 ; =ov11_02324DA4
	ldr r4, [r0, #4]
	cmp r4, #0
	moveq r0, #0
	beq _0230BB10
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	mov r5, r0
	bl ov11_0230AE84
	cmp r0, #0
	addne r0, r4, #0x4600
	ldrneh r0, [r0, #0xd0]
	cmpne r0, r5
	beq _0230BAD8
	bl ov11_0230B914
	mov r1, r5, lsl #0x10
	str r0, [sp]
	mov r0, r1, lsr #0x10
	bl ov11_0230C970
	strh r0, [sp, #4]
	bl ov11_0230B958
	strh r0, [sp, #6]
	add r0, sp, #0
	bl ov11_0230AF0C
	add r0, r4, #0x4600
	strh r5, [r0, #0xd0]
_0230BAD8:
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _0230BB0C
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202C75C
	mvn r1, #0
	cmp r0, r1
	moveq r0, #2
	movne r0, #3
	b _0230BB10
_0230BB0C:
	mov r0, #0
_0230BB10:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230BB18: .word ov11_02324DA4
	arm_func_end ov11_0230BA64

	arm_func_start ov11_0230BB1C
ov11_0230BB1C: ; 0x0230BB1C
	stmdb sp!, {r3, lr}
	ldr r0, _0230BB94 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x1400
	ldrnesb r0, [r0, #0xe4]
	mvnne r1, #1
	cmpne r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202D0EC
	ldr r1, _0230BB94 ; =ov11_02324DA4
	strh r0, [r1]
	bl ov11_0230CA38
	bl ov11_0230CAE4
	ldr r0, _0230BB94 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202836C
	ldr r0, _0230BB94 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl CloseCollectionMenu
	ldr r0, _0230BB94 ; =ov11_02324DA4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x1000
	strb r1, [r0, #0x4e4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BB94: .word ov11_02324DA4
	arm_func_end ov11_0230BB1C

	arm_func_start ov11_0230BB98
ov11_0230BB98: ; 0x0230BB98
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r0, _0230BCD8 ; =ov11_02324DA4
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _0230BCD0
	add r0, r2, #0x1400
	ldrsb r1, [r0, #0xe4]
	mvn r0, #1
	cmp r1, r0
	bne _0230BCD0
	ldr r0, [r2]
	ldr r1, _0230BCDC ; =0x00401833
	ldr r3, _0230BCE0 ; =ov11_0230BD5C
	cmp r0, #3
	mov r5, #0
	addls pc, pc, r0, lsl #2
	b _0230BC00
_0230BBE0: ; jump table
	b _0230BC00 ; case 0
	b _0230BC00 ; case 1
	b _0230BC00 ; case 2
	b _0230BBF0 ; case 3
_0230BBF0:
	ldr r0, _0230BCE4 ; =0x80040004
	ldr r5, _0230BCE8 ; =ov11_0230B78C
	ldr r3, _0230BCEC ; =ov11_0230BE34
	orr r1, r1, r0
_0230BC00:
	ldr ip, _0230BCD8 ; =ov11_02324DA4
	add r2, r2, #0x4000
	ldrsh r4, [ip]
	ldr r0, _0230BCF0 ; =ov11_02322FE4
	mov lr, #8
	str r4, [r2, #0x62c]
	ldr r2, [ip, #4]
	str r5, [sp]
	ldr ip, [r2, #4]
	add r2, r2, #0x22c
	add r2, r2, #0x4400
	stmib sp, {ip, lr}
	bl CreateCollectionMenu
	ldr r2, _0230BCD8 ; =ov11_02324DA4
	ldr r1, [r2, #4]
	add r1, r1, #0x1000
	strb r0, [r1, #0x4e4]
	ldr r1, [r2, #4]
	ldr r0, [r1]
	cmp r0, #3
	bne _0230BCD0
	add r0, r1, #0x1400
	ldrsb r0, [r0, #0xe4]
	mov r1, #1
	bl SetCollectionMenuField0x1C8
	ldr r0, _0230BCD8 ; =ov11_02324DA4
	ldr r1, _0230BCF4 ; =ov11_0230BF38
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl SetCollectionMenuField0x1A4
	bl ov11_0230CAA4
	bl ov11_0230C9F8
	ldr r0, _0230BCD8 ; =ov11_02324DA4
	ldr r4, [r0, #4]
	ldr r0, [r4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230BCD0
_0230BC9C: ; jump table
	b _0230BCD0 ; case 0
	b _0230BCD0 ; case 1
	b _0230BCD0 ; case 2
	b _0230BCAC ; case 3
_0230BCAC:
	bl ov11_0230B874
	add r1, r4, #0x4600
	ldrh r1, [r1, #0x28]
	cmp r1, r0
	bne _0230BCD0
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	mov r1, #1
	bl sub_0202D07C
_0230BCD0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230BCD8: .word ov11_02324DA4
_0230BCDC: .word 0x00401833
_0230BCE0: .word ov11_0230BD5C
_0230BCE4: .word 0x80040004
_0230BCE8: .word ov11_0230B78C
_0230BCEC: .word ov11_0230BE34
_0230BCF0: .word ov11_02322FE4
_0230BCF4: .word ov11_0230BF38
	arm_func_end ov11_0230BB98

	arm_func_start ov11_0230BCF8
ov11_0230BCF8: ; 0x0230BCF8
	stmdb sp!, {r3, lr}
	ldr r0, _0230BD24 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x1400
	ldrnesb r0, [r0, #0xe4]
	mvnne r1, #1
	cmpne r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202C620
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BD24: .word ov11_02324DA4
	arm_func_end ov11_0230BCF8

	arm_func_start ov11_0230BD28
ov11_0230BD28: ; 0x0230BD28
	stmdb sp!, {r3, lr}
	ldr r0, _0230BD58 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x1400
	ldrnesb r0, [r0, #0xe4]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsCollectionMenuState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BD58: .word ov11_02324DA4
	arm_func_end ov11_0230BD28

	arm_func_start ov11_0230BD5C
ov11_0230BD5C: ; 0x0230BD5C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r5, r1
	mov r1, r5, lsl #0x10
	mov r6, r0
	mov r0, r1, lsr #0x10
	mov r4, r2
	bl ov11_0230C970
	ldr r1, _0230BE28 ; =ov11_02324DA4
	strh r0, [sp, #4]
	ldr r3, [r1, #4]
	mov r1, #1
	add r0, r3, r5, lsl #1
	add r0, r0, #0x2d00
	ldrh r2, [r0, #0xee]
	add r0, r3, r5
	add r0, r0, #0x1000
	strh r2, [sp, #2]
	strb r1, [sp]
	ldrb r0, [r0, #0xb8]
	add r1, sp, #0
	mov r2, #0
	tst r0, #2
	beq _0230BDEC
	add r0, sp, #6
	bl sub_0200D65C
	ldr r1, _0230BE2C ; =ov11_02323004
	mov r0, r6
	bl strcpy
	add r1, sp, #6
	mov r0, r6
	bl strcat
	ldr r1, _0230BE30 ; =ov11_0232300C
	mov r0, r6
	bl strcat
	b _0230BDF4
_0230BDEC:
	mov r0, r6
	bl sub_0200D670
_0230BDF4:
	ldr r1, _0230BE28 ; =ov11_02324DA4
	mov r0, #6
	ldr r1, [r1, #4]
	mla r0, r5, r0, r1
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x4ea]
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r6
	str r1, [r4]
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230BE28: .word ov11_02324DA4
_0230BE2C: .word ov11_02323004
_0230BE30: .word ov11_0232300C
	arm_func_end ov11_0230BD5C

	arm_func_start ov11_0230BE34
ov11_0230BE34: ; 0x0230BE34
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _0230BF28 ; =ov11_02324DA4
	mov r5, r1
	mov r1, r5, lsl #0x10
	mov r6, r0
	mov r0, r1, lsr #0x10
	ldr r3, [r3, #4]
	mov r1, #6
	mla r1, r0, r1, r3
	add r1, r1, #0x1400
	ldrh r1, [r1, #0xe6]
	mov r4, r2
	cmp r1, #4
	moveq r0, #0
	beq _0230BF20
	bl ov11_0230C970
	ldr r1, _0230BF28 ; =ov11_02324DA4
	strh r0, [sp, #4]
	ldr r0, [r1, #4]
	add r1, sp, #0
	add r0, r0, r5, lsl #1
	add r0, r0, #0x2d00
	ldrh ip, [r0, #0xee]
	mov r3, #1
	mov r0, r6
	mov r2, #0
	strh ip, [sp, #2]
	strb r3, [sp]
	bl sub_0200D670
	ldrsh r0, [sp, #4]
	bl ov11_0230C068
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230BEE8
_0230BEC0: ; jump table
	b _0230BED0 ; case 0
	b _0230BED0 ; case 1
	b _0230BED8 ; case 2
	b _0230BEE0 ; case 3
_0230BED0:
	ldr r1, _0230BF2C ; =ov11_02323014
	b _0230BEEC
_0230BED8:
	ldr r1, _0230BF30 ; =ov11_0232302C
	b _0230BEEC
_0230BEE0:
	ldr r1, _0230BF34 ; =ov11_02323048
	b _0230BEEC
_0230BEE8:
	mov r1, #0
_0230BEEC:
	mov r0, r6
	bl strcat
	ldr r1, _0230BF28 ; =ov11_02324DA4
	mov r0, #6
	ldr r1, [r1, #4]
	mla r0, r5, r0, r1
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x4ea]
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r6
	str r1, [r4]
_0230BF20:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230BF28: .word ov11_02324DA4
_0230BF2C: .word ov11_02323014
_0230BF30: .word ov11_0232302C
_0230BF34: .word ov11_02323048
	arm_func_end ov11_0230BE34

	arm_func_start ov11_0230BF38
ov11_0230BF38: ; 0x0230BF38
	stmdb sp!, {r3, lr}
	ldr r3, _0230BF8C ; =ov11_02324DA4
	mov r2, r2, lsl #0x10
	ldr ip, [r3, #4]
	mov r3, r2, lsr #0x10
	mov r2, #6
	mla r2, r3, r2, ip
	add r2, r2, #0x1400
	ldrh r2, [r2, #0xe6]
	mov r3, r0
	cmp r2, #2
	ldreq r0, _0230BF90 ; =0x0000032F
	streqh r0, [r1, #0x1c]
	beq _0230BF7C
	cmp r2, #3
	ldreq r0, _0230BF94 ; =0x00004623
	streqh r0, [r1, #0x1c]
_0230BF7C:
	mov r0, r1
	mov r1, r3
	bl sub_0202A03C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BF8C: .word ov11_02324DA4
#if defined(EUROPE)
_0230BF90: .word 0x0000032F
_0230BF94: .word 0x00004642
#elif defined(JAPAN)
_0230BF90: .word 0x000031F4
_0230BF94: .word 0x00001CDF
#else
_0230BF90: .word 0x0000032F
_0230BF94: .word 0x00004623
#endif
	arm_func_end ov11_0230BF38

	arm_func_start ov11_0230BF98
ov11_0230BF98: ; 0x0230BF98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r3, _0230C048 ; =ov11_02324DA4
	ldr r2, _0230C04C ; =0x0000042C
	mov r0, r4
_0230BFAC:
	ldr r1, [r3, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #8]
	ldr r1, [r3, #4]
	add r1, r1, r4
	add r1, r1, #0x1000
	add r4, r4, #1
	strb r0, [r1, #0xb8]
	cmp r4, r2
	blt _0230BFAC
	ldr r2, _0230C048 ; =ov11_02324DA4
	mov r5, #0
_0230BFDC:
	ldr r1, [r2, #4]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x3e00
	strh r5, [r1, #0x16]
	ldr r1, [r2, #4]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x3600
	add r0, r0, #1
	strh r5, [r1, #0x46]
	cmp r0, #0x3e8
	blt _0230BFDC
	ldr r7, _0230C048 ; =ov11_02324DA4
	ldr r6, _0230C04C ; =0x0000042C
	mov r4, #0
_0230C014:
	ldr r1, [r7, #4]
	mov r0, r5, lsl #0x10
	add r1, r1, r5, lsl #1
	add r3, r1, #0x2d00
	mov r1, r4
	mov r2, r4
	mov r0, r0, lsr #0x10
	strh r4, [r3, #0xee]
	bl ov11_0230C924
	add r5, r5, #1
	cmp r5, r6
	blt _0230C014
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230C048: .word ov11_02324DA4
_0230C04C: .word 0x0000042C
	arm_func_end ov11_0230BF98

	arm_func_start ov11_0230C050
ov11_0230C050: ; 0x0230C050
	ldr ip, _0230C064 ; =ov11_0230C1D0
	mov r2, r1
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_0230C064: .word ov11_0230C1D0
	arm_func_end ov11_0230C050

	arm_func_start ov11_0230C068
ov11_0230C068: ; 0x0230C068
	cmp r0, #0x1bc
	blt _0230C080
	ldr r1, _0230C0FC ; =0x000001C3
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C080:
	cmp r0, #0x1c4
	blt _0230C098
	ldr r1, _0230C100 ; =0x000001C7
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C098:
	cmp r0, #0x1c8
	blt _0230C0B0
	ldr r1, _0230C104 ; =0x000001D7
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C0B0:
	cmp r0, #0x1d8
	blt _0230C0C8
	ldr r1, _0230C108 ; =0x000001F9
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C0C8:
	ldr r1, _0230C10C ; =0x000003F6
	cmp r0, r1
	blt _0230C0E4
	ldr r1, _0230C110 ; =0x00000547
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C0E4:
	ldr r1, _0230C114 ; =0xFFFFFE06
	add r0, r0, r1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	bx lr
	.align 2, 0
_0230C0FC: .word 0x000001C3
_0230C100: .word 0x000001C7
_0230C104: .word 0x000001D7
_0230C108: .word 0x000001F9
_0230C10C: .word 0x000003F6
_0230C110: .word 0x00000547
_0230C114: .word 0xFFFFFE06
	arm_func_end ov11_0230C068

	arm_func_start ov11_0230C118
ov11_0230C118: ; 0x0230C118
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r6, _0230C1CC ; =ov11_02324DA4
	mov lr, #0
	ldr r7, [r6, #4]
	mov r4, lr
	add r6, r7, #0xe6
	add ip, r6, #0x1400
	add r6, r7, #0x4600
	mov r5, lr
	mov r7, #6
	b _0230C1AC
_0230C144:
	mla sb, r5, r7, ip
	ldrb r8, [sb, #4]
	cmp r8, #0
	beq _0230C1A8
	ldrh r8, [sb]
	cmp r8, #2
	beq _0230C16C
	cmp r8, #3
	beq _0230C18C
	b _0230C1A8
_0230C16C:
	cmp r1, #0
	ldrneh sb, [sb, #2]
	movne r8, lr, lsl #1
	strneh sb, [r1, r8]
	add r8, lr, #1
	mov lr, r8, lsl #0x10
	mov lr, lr, lsr #0x10
	b _0230C1A8
_0230C18C:
	cmp r3, #0
	movne r8, r4, lsl #1
	ldrneh sb, [sb, #2]
	add r4, r4, #1
	mov r4, r4, lsl #0x10
	strneh sb, [r3, r8]
	mov r4, r4, lsr #0x10
_0230C1A8:
	add r5, r5, #1
_0230C1AC:
	ldrh r8, [r6, #0x26]
	cmp r5, r8
	blt _0230C144
	cmp r0, #0
	strneh lr, [r0]
	cmp r2, #0
	strneh r4, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230C1CC: .word ov11_02324DA4
	arm_func_end ov11_0230C118

	arm_func_start ov11_0230C1D0
ov11_0230C1D0: ; 0x0230C1D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GetCurrentBagCapacity
	mov fp, r0
	bl sub_0200FD48
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov sl, r8
	cmp r5, #0
	beq _0230C288
	b _0230C278
_0230C208:
	ldr r0, _0230C3C4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r0]
	mov r0, #6
	mul r0, sl, r0
	ldr r1, [r1, #0x384]
	add r2, r1, r0
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230C274
	ldrsh r1, [r2, #4]
	cmp r1, #0x1bc
	blt _0230C274
	ldr r0, _0230C3C8 ; =0x00000547
	cmp r1, r0
	bgt _0230C274
	cmp r6, #0
	beq _0230C270
	mov r0, r8, lsl #0x10
	mov r2, sl, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #2
	mov r2, r2, lsr #0x10
	bl ov11_0230C924
_0230C270:
	add r8, r8, #1
_0230C274:
	add sl, sl, #1
_0230C278:
	cmp sl, fp
	blt _0230C208
	mov sl, r8
	strh r8, [r5]
_0230C288:
	cmp r4, #0
	beq _0230C3BC
	ldr r0, _0230C3C4 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r2, [r0]
	ldr r0, _0230C3C8 ; =0x00000547
	b _0230C2CC
_0230C2A4:
	add r1, r2, r5, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r1, #0
	beq _0230C2D4
	cmp r1, #0x1bc
	blt _0230C2C8
	cmp r1, r0
	ble _0230C2D4
_0230C2C8:
	add r5, r5, #1
_0230C2CC:
	cmp r5, r7
	blt _0230C2A4
_0230C2D4:
	cmp r5, r7
	bge _0230C31C
	add r0, r2, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _0230C31C
	tst r8, #7
	cmpne r6, #0
	beq _0230C31C
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #4
	mov r2, #0
	bl ov11_0230C924
	add r8, r8, #1
	add r0, r8, #7
	bic sl, r0, #7
_0230C31C:
	ldr fp, _0230C3C4 ; =BAG_ITEMS_PTR_MIRROR
	b _0230C37C
_0230C324:
	ldr r0, [fp]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x8a]
	cmp r1, #0
	beq _0230C384
	cmp r1, #0x1bc
	blt _0230C378
	ldr r0, _0230C3C8 ; =0x00000547
	cmp r1, r0
	bgt _0230C378
	cmp r6, #0
	beq _0230C374
	add r0, sl, sb
	mov r0, r0, lsl #0x10
	mov r2, r5, lsl #0x10
	mov r1, #3
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	bl ov11_0230C924
_0230C374:
	add sb, sb, #1
_0230C378:
	add r5, r5, #1
_0230C37C:
	cmp r5, r7
	blt _0230C324
_0230C384:
	strh sb, [r4]
	cmp r8, #0
	ble _0230C3B8
	tst sb, #7
	cmpne r6, #0
	beq _0230C3B8
	add r0, sl, sb
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #4
	mov r2, #0
	bl ov11_0230C924
	add sb, sb, #1
_0230C3B8:
	add sl, sl, sb
_0230C3BC:
	mov r0, sl
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230C3C4: .word BAG_ITEMS_PTR_MIRROR
_0230C3C8: .word 0x00000547
	arm_func_end ov11_0230C1D0

	arm_func_start ov11_0230C3CC
ov11_0230C3CC: ; 0x0230C3CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl GetCurrentBagCapacity
	mov r7, r0
	bl sub_0200FD48
	mov sb, #0
	mov r8, r0
	mov sl, sb
	mov fp, #1
	ldr r6, _0230C4C8 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #6
	ldr r4, _0230C4CC ; =0x000003F5
	b _0230C450
_0230C3FC:
	mul r1, sl, r5
	ldr r0, [r6]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _0230C44C
	ldrsh r0, [r1, #4]
	cmp r0, r4, lsr #1
	blt _0230C44C
	cmp r0, r4
	bgt _0230C44C
	ldrh r1, [r1, #2]
	mov r2, sb
	bl ov11_0230C5A0
	cmp r0, #0
	addne sb, sb, #1
_0230C44C:
	add sl, sl, #1
_0230C450:
	cmp sl, r7
	blt _0230C3FC
	mov r4, #0
	ldr r6, _0230C4C8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r5, _0230C4CC ; =0x000003F5
	b _0230C4AC
_0230C468:
	ldr r0, [r6]
	add r1, r0, r4, lsl #1
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _0230C4B4
	cmp r0, r5, lsr #1
	blt _0230C4A8
	cmp r0, r5
	bgt _0230C4A8
	add r1, r1, #0xb00
	ldrh r1, [r1, #0x5a]
	mov r2, sb
	bl ov11_0230C5A0
	cmp r0, #0
	addne sb, sb, #1
_0230C4A8:
	add r4, r4, #1
_0230C4AC:
	cmp r4, r8
	blt _0230C468
_0230C4B4:
	ldr r0, _0230C4D0 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x4600
	strh sb, [r0, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230C4C8: .word BAG_ITEMS_PTR_MIRROR
_0230C4CC: .word 0x000003F5
_0230C4D0: .word ov11_02324DA4
	arm_func_end ov11_0230C3CC

	arm_func_start ov11_0230C4D4
ov11_0230C4D4: ; 0x0230C4D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl GetCurrentBagCapacity
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov r4, #6
	ldr r6, _0230C594 ; =BAG_ITEMS_PTR_MIRROR
	ldr r5, _0230C598 ; =ov11_02324DA4
	ldr fp, _0230C59C ; =0x0000018F
	b _0230C578
_0230C4FC:
	mul sl, sb, r4
	ldr r0, [r6]
	ldr r1, [r0, #0x384]
	ldrb r0, [r1, sl]
	add r1, r1, sl
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230C574
	ldrsh r0, [r1, #4]
	cmp r0, #0x16c
	blt _0230C574
	cmp r0, fp
	bgt _0230C574
	mov r0, r8, lsl #0x10
	mov r2, sb, lsl #0x10
	mov r1, #2
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	bl ov11_0230C924
	ldr r1, [r6]
	ldr r0, [r5, #4]
	ldr r1, [r1, #0x384]
	add r0, r0, r8, lsl #1
	add r1, r1, sl
	ldrh r1, [r1, #2]
	add r0, r0, #0x2d00
	add r8, r8, #1
	strh r1, [r0, #0xee]
_0230C574:
	add sb, sb, #1
_0230C578:
	cmp sb, r7
	blt _0230C4FC
	ldr r0, _0230C598 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x4600
	strh r8, [r0, #0x26]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230C594: .word BAG_ITEMS_PTR_MIRROR
_0230C598: .word ov11_02324DA4
_0230C59C: .word 0x0000018F
	arm_func_end ov11_0230C4D4

	arm_func_start ov11_0230C5A0
ov11_0230C5A0: ; 0x0230C5A0
	stmdb sp!, {r4, lr}
	cmp r2, #0
	beq _0230C5EC
	ldr r3, _0230C618 ; =ov11_02324DA4
	mov lr, #0
	ldr r4, [r3, #4]
	b _0230C5E4
_0230C5BC:
	add ip, r4, lr, lsl #1
	add r3, ip, #0x3600
	ldrh r3, [r3, #0x46]
	cmp r0, r3
	addeq r3, ip, #0x3e00
	ldreqh r3, [r3, #0x16]
	cmpeq r1, r3
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add lr, lr, #1
_0230C5E4:
	cmp lr, r2
	blt _0230C5BC
_0230C5EC:
	ldr ip, _0230C618 ; =ov11_02324DA4
	ldr r3, [ip, #4]
	add r3, r3, r2, lsl #1
	add r3, r3, #0x3600
	strh r0, [r3, #0x46]
	ldr r3, [ip, #4]
	mov r0, #1
	add r2, r3, r2, lsl #1
	add r2, r2, #0x3e00
	strh r1, [r2, #0x16]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230C618: .word ov11_02324DA4
	arm_func_end ov11_0230C5A0

	arm_func_start ov11_0230C61C
ov11_0230C61C: ; 0x0230C61C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0230C8DC ; =0x000001FA
	mov r5, #0
_0230C628:
	ldr r0, _0230C8E0 ; =ov11_02324DA4
	ldr lr, [r0, #4]
	add r0, lr, #0x4600
	ldrh ip, [r0, #0x28]
	cmp ip, #0
	moveq r0, #0
	beq _0230C6C0
	mov r0, r4, lsl #0x10
	mov r3, #0
	mov r2, r0, asr #0x10
	add r1, r2, #1
	add r0, r2, #2
	mov r7, r3
	mov r8, r3
	mov sb, r3
	b _0230C698
_0230C668:
	add r6, lr, r3, lsl #1
	add r6, r6, #0x3600
	ldrh r6, [r6, #0x46]
	cmp r2, r6
	moveq r2, sb
	beq _0230C694
	cmp r1, r6
	moveq r1, r8
	beq _0230C694
	cmp r0, r6
	moveq r0, r7
_0230C694:
	add r3, r3, #1
_0230C698:
	cmp r3, ip
	blt _0230C668
	cmp r2, #0
	cmpeq r1, #0
	bne _0230C6BC
	cmp r0, #0
	moveq r0, #2
	movne r0, #1
	b _0230C6C0
_0230C6BC:
	mov r0, #0
_0230C6C0:
	cmp r0, #1
	beq _0230C834
	cmp r0, #2
	bne _0230C86C
	add r0, lr, r5, lsl #1
	ldr r2, _0230C8E4 ; =0x000002FE
	add r0, r0, #0x2d00
	mov r1, #0
	strh r1, [r0, #0xee]
	cmp r4, r2
	bne _0230C7AC
	mov r0, r5, lsl #0x10
	ldr r2, _0230C8E8 ; =0x000001BD
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	ldr r2, _0230C8EC ; =0x000001BE
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	ldr r2, _0230C8F0 ; =0x000001BF
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	mov r2, #0x1c0
	bl ov11_0230C924
	add r0, r5, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	ldr r2, _0230C8F4 ; =0x000001C1
	bl ov11_0230C924
	add r0, r5, #5
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	ldr r2, _0230C8F8 ; =0x000001C2
	bl ov11_0230C924
	add r0, r5, #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	ldr r2, _0230C8FC ; =0x000001C3
	bl ov11_0230C924
	add r0, r5, #7
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add r5, r5, #8
	mov r1, #0
	mov r2, #0x1bc
	bl ov11_0230C924
	b _0230C834
_0230C7AC:
	add r0, r2, #0x38
	cmp r4, r0
	bne _0230C818
	mov r0, r5, lsl #0x10
	ldr r2, _0230C900 ; =0x000001C5
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	ldr r2, _0230C904 ; =0x000001C6
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	ldr r2, _0230C908 ; =0x000001C7
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	mov r2, #0x1c4
	add r5, r5, #4
	bl ov11_0230C924
	b _0230C834
_0230C818:
	add r2, r4, #3
	mov r0, r5, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	add r5, r5, #1
	bl ov11_0230C924
_0230C834:
	add r1, r4, #2
	mov r0, r5, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, r1, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	ldr r0, _0230C8E0 ; =ov11_02324DA4
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x2d00
	strh r1, [r0, #0xee]
	add r5, r5, #1
_0230C86C:
	ldr r0, _0230C90C ; =0x000003F6
	add r4, r4, #4
	cmp r4, r0
	blt _0230C628
	ldr r0, _0230C8E0 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0xe6
	add r0, r0, #0x4500
	bl sub_020130B8
	mov r6, r0
	mov r7, #0
	mov r4, #1
	b _0230C8C0
_0230C8A0:
	mov r0, r5, lsl #0x10
	mov r2, r7, lsl #0x10
	mov r1, r4
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	add r5, r5, #1
	bl ov11_0230C924
	add r7, r7, #1
_0230C8C0:
	cmp r7, r6
	blt _0230C8A0
	ldr r0, _0230C8E0 ; =ov11_02324DA4
	ldr r0, [r0, #4]
	add r0, r0, #0x4600
	strh r5, [r0, #0x26]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230C8DC: .word 0x000001FA
_0230C8E0: .word ov11_02324DA4
_0230C8E4: .word 0x000002FE
_0230C8E8: .word 0x000001BD
_0230C8EC: .word 0x000001BE
_0230C8F0: .word 0x000001BF
_0230C8F4: .word 0x000001C1
_0230C8F8: .word 0x000001C2
_0230C8FC: .word 0x000001C3
_0230C900: .word 0x000001C5
_0230C904: .word 0x000001C6
_0230C908: .word 0x000001C7
_0230C90C: .word 0x000003F6
	arm_func_end ov11_0230C61C

	arm_func_start ov11_0230C910
ov11_0230C910: ; 0x0230C910
	ldr r0, _0230C920 ; =ov11_02324DA4
	mov r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_0230C920: .word ov11_02324DA4
	arm_func_end ov11_0230C910

	arm_func_start ov11_0230C924
ov11_0230C924: ; 0x0230C924
	stmdb sp!, {r3, lr}
	mov r3, #6
	mul lr, r0, r3
	ldr r3, _0230C96C ; =ov11_02324DA4
	mov ip, #0
	ldr r0, [r3, #4]
	add r0, r0, lr
	add r0, r0, #0x1400
	strh r1, [r0, #0xe6]
	ldr r0, [r3, #4]
	add r0, r0, lr
	add r0, r0, #0x1400
	strh r2, [r0, #0xe8]
	ldr r0, [r3, #4]
	add r0, r0, lr
	add r0, r0, #0x1000
	strb ip, [r0, #0x4ea]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230C96C: .word ov11_02324DA4
	arm_func_end ov11_0230C924

	arm_func_start ov11_0230C970
ov11_0230C970: ; 0x0230C970
	stmdb sp!, {r3, lr}
	mov r1, #6
	ldr r2, _0230C9E8 ; =ov11_02324DA4
	mul r1, r0, r1
	ldr r3, [r2, #4]
	add r0, r3, #0xe6
	add r2, r0, #0x1400
	ldrh r0, [r2, r1]
	add r1, r2, r1
	cmp r0, #1
	beq _0230C9B0
	cmp r0, #2
	beq _0230C9C4
	cmp r0, #3
	beq _0230C9D4
	b _0230C9E0
_0230C9B0:
	ldrh r0, [r1, #2]
	add r0, r3, r0, lsl #3
	add r0, r0, #0x4500
	ldrsh r0, [r0, #0xe6]
	ldmia sp!, {r3, pc}
_0230C9C4:
	ldrsh r0, [r1, #2]
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	ldmia sp!, {r3, pc}
_0230C9D4:
	ldrsh r0, [r1, #2]
	bl sub_02010044
	ldmia sp!, {r3, pc}
_0230C9E0:
	ldrsh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230C9E8: .word ov11_02324DA4
	arm_func_end ov11_0230C970

	arm_func_start ov11_0230C9EC
ov11_0230C9EC: ; 0x0230C9EC
	cmp r0, #4
	moveq r0, #4
	bx lr
	arm_func_end ov11_0230C9EC

	arm_func_start ov11_0230C9F8
ov11_0230C9F8: ; 0x0230C9F8
	stmdb sp!, {r3, lr}
	ldr r0, _0230CA2C ; =ov11_02324DA4
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6cc]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r1, #0x2cc
	ldr r1, _0230CA30 ; =ov11_02322FF4
	ldr r2, _0230CA34 ; =ov11_0230CA7C
	add r0, r0, #0x4400
	bl sub_0204707C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CA2C: .word ov11_02324DA4
_0230CA30: .word ov11_02322FF4
_0230CA34: .word ov11_0230CA7C
	arm_func_end ov11_0230C9F8

	arm_func_start ov11_0230CA38
ov11_0230CA38: ; 0x0230CA38
	stmdb sp!, {r3, lr}
	ldr r0, _0230CA78 ; =ov11_02324DA4
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6cc]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x2cc
	add r0, r0, #0x4400
	bl sub_02047150
	ldr r0, _0230CA78 ; =ov11_02324DA4
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	str r1, [r0, #0x6cc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CA78: .word ov11_02324DA4
	arm_func_end ov11_0230CA38

	arm_func_start ov11_0230CA7C
ov11_0230CA7C: ; 0x0230CA7C
	stmdb sp!, {r4, lr}
	ldr r3, _0230CAA0 ; =0x000003A9
	mov r4, r0
	mov r1, #6
	mov r2, #2
	bl sub_02026268
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0230CAA0: .word 0x000032B3
#else
_0230CAA0: .word 0x000003A9
#endif
	arm_func_end ov11_0230CA7C

	arm_func_start ov11_0230CAA4
ov11_0230CAA4: ; 0x0230CAA4
	stmdb sp!, {r3, lr}
	ldr r0, _0230CAD8 ; =ov11_02324DA4
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6c8]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r1, #0x2c8
	ldr r1, _0230CADC ; =ov11_02322FD4
	ldr r2, _0230CAE0 ; =ov11_0230CB28
	add r0, r0, #0x4400
	bl sub_0204707C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CAD8: .word ov11_02324DA4
_0230CADC: .word ov11_02322FD4
_0230CAE0: .word ov11_0230CB28
	arm_func_end ov11_0230CAA4

	arm_func_start ov11_0230CAE4
ov11_0230CAE4: ; 0x0230CAE4
	stmdb sp!, {r3, lr}
	ldr r0, _0230CB24 ; =ov11_02324DA4
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6c8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x2c8
	add r0, r0, #0x4400
	bl sub_02047150
	ldr r0, _0230CB24 ; =ov11_02324DA4
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	str r1, [r0, #0x6c8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CB24: .word ov11_02324DA4
	arm_func_end ov11_0230CAE4

	arm_func_start ov11_0230CB28
ov11_0230CB28: ; 0x0230CB28
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	bl ov11_0230B874
	ldr r1, _0230CB84 ; =ov11_02324DA4
	str r0, [sp, #0x28]
	ldr r0, [r1, #4]
#ifdef JAPAN
	add r2, sp, #4
	add r0, r0, #0x4600
	ldrh r1, [r0, #0x28]
	ldr r3, _0230E130 ; =0x000032B4
	mov r0, r4
	str r1, [sp, #0x2c]
	str r2, [sp]
	mov r1, #6
	mov r2, #2
#else
	mov r2, #2
	add r0, r0, #0x4600
	ldrh r3, [r0, #0x28]
	add r1, sp, #4
	mov r0, r4
	str r3, [sp, #0x2c]
	str r1, [sp]
	add r3, r2, #0x3a8
	mov r1, #6
#endif
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0230CB84: .word ov11_02324DA4
#ifdef JAPAN
_0230E130: .word 0x000032B4
#endif
	arm_func_end ov11_0230CB28

	arm_func_start ov11_0230CB88
ov11_0230CB88: ; 0x0230CB88
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230CBAC ; =OVERLAY11_OVERLAY_LOAD_TABLE
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl EntryOverlay13
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230CBAC: .word OVERLAY11_OVERLAY_LOAD_TABLE
	arm_func_end ov11_0230CB88

	arm_func_start ov11_0230CBB0
ov11_0230CBB0: ; 0x0230CBB0
	ldr ip, _0230CBBC ; =sub_020348E4
	ldr r0, _0230CBC0 ; =ov11_0232307C
	bx ip
	.align 2, 0
_0230CBBC: .word sub_020348E4
_0230CBC0: .word ov11_0232307C
	arm_func_end ov11_0230CBB0

	arm_func_start ov11_0230CBC4
ov11_0230CBC4: ; 0x0230CBC4
	ldr ip, _0230CBD0 ; =sub_020348E4
	ldr r0, _0230CBD4 ; =ov11_0232308C
	bx ip
	.align 2, 0
_0230CBD0: .word sub_020348E4
_0230CBD4: .word ov11_0232308C
	arm_func_end ov11_0230CBC4

	arm_func_start ov11_0230CBD8
ov11_0230CBD8: ; 0x0230CBD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230CBF8 ; =ov11_0232309C
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _0230CBFC ; =ov11_0238A08C
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230CBF8: .word ov11_0232309C
_0230CBFC: .word ov11_0238A08C
	arm_func_end ov11_0230CBD8

	arm_func_start ov11_0230CC00
ov11_0230CC00: ; 0x0230CC00
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230CC20 ; =ov11_023230AC
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _0230CC24 ; =ov11_0238A090
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230CC20: .word ov11_023230AC
_0230CC24: .word ov11_0238A090
	arm_func_end ov11_0230CC00

	arm_func_start ov11_0230CC28
ov11_0230CC28: ; 0x0230CC28
	stmdb sp!, {r3, lr}
	ldr r0, _0230CC44 ; =ov11_023230CC
	bl sub_020348E4
	ldr r0, _0230CC48 ; =ov11_02324DAC
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CC44: .word ov11_023230CC
_0230CC48: .word ov11_02324DAC
	arm_func_end ov11_0230CC28

	arm_func_start ov11_0230CC4C
ov11_0230CC4C: ; 0x0230CC4C
	stmdb sp!, {r3, lr}
	ldr r0, _0230CC68 ; =ov11_023230BC
	bl sub_020348E4
	ldr r0, _0230CC6C ; =ov11_02324DAC
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CC68: .word ov11_023230BC
_0230CC6C: .word ov11_02324DAC
	arm_func_end ov11_0230CC4C

	arm_func_start ov11_0230CC70
ov11_0230CC70: ; 0x0230CC70
	ldr r0, _0230CC7C ; =ov11_02324DAC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0230CC7C: .word ov11_02324DAC
	arm_func_end ov11_0230CC70

	arm_func_start ov11_0230CC80
ov11_0230CC80: ; 0x0230CC80
	stmdb sp!, {r3, lr}
	bl sub_020017EC
	ldr r0, _0230CCA0 ; =ov11_023230EC
	bl sub_020348E4
	ldr r0, _0230CCA4 ; =ov11_02324DB4
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CCA0: .word ov11_023230EC
_0230CCA4: .word ov11_02324DB4
	arm_func_end ov11_0230CC80

	arm_func_start ov11_0230CCA8
ov11_0230CCA8: ; 0x0230CCA8
	stmdb sp!, {r3, lr}
	ldr r0, _0230CCD4 ; =ov11_023230EC
	bl sub_02034840
	cmp r0, #0
	bne _0230CCC4
	ldr r0, _0230CCD8 ; =ov11_023230DC
	bl sub_020348E4
_0230CCC4:
	ldr r0, _0230CCDC ; =ov11_02324DB4
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CCD4: .word ov11_023230EC
_0230CCD8: .word ov11_023230DC
_0230CCDC: .word ov11_02324DB4
	arm_func_end ov11_0230CCA8

	arm_func_start ov11_0230CCE0
ov11_0230CCE0: ; 0x0230CCE0
	ldr r0, _0230CCEC ; =ov11_02324DB4
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0230CCEC: .word ov11_02324DB4
	arm_func_end ov11_0230CCE0

	arm_func_start ov11_0230CCF0
ov11_0230CCF0: ; 0x0230CCF0
	stmdb sp!, {r4, lr}
	ldr r1, _0230CD3C ; =ov11_02324DB4
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230CD34
	ldr lr, _0230CD40 ; =ov11_0238A098
	mov ip, #9
_0230CD10:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230CD10
	ldr r2, _0230CD44 ; =ov11_0238A094
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldr r0, [r2]
	ldmia sp!, {r4, pc}
_0230CD34:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230CD3C: .word ov11_02324DB4
_0230CD40: .word ov11_0238A098
_0230CD44: .word ov11_0238A094
	arm_func_end ov11_0230CCF0

	arm_func_start ov11_0230CD48
ov11_0230CD48: ; 0x0230CD48
	ldr ip, _0230CD54 ; =sub_020348E4
	ldr r0, _0230CD58 ; =ov11_023230FC
	bx ip
	.align 2, 0
_0230CD54: .word sub_020348E4
_0230CD58: .word ov11_023230FC
	arm_func_end ov11_0230CD48

	arm_func_start ov11_0230CD5C
ov11_0230CD5C: ; 0x0230CD5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230CD7C ; =ov11_0232310C
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _0230CD80 ; =ov11_0238A130
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230CD7C: .word ov11_0232310C
_0230CD80: .word ov11_0238A130
	arm_func_end ov11_0230CD5C

	arm_func_start ov11_0230CD84
ov11_0230CD84: ; 0x0230CD84
	ldr r1, _0230CD98 ; =ov11_0238A134
	ldr ip, _0230CD9C ; =sub_020348E4
	str r0, [r1]
	ldr r0, _0230CDA0 ; =ov11_0232311C
	bx ip
	.align 2, 0
_0230CD98: .word ov11_0238A134
_0230CD9C: .word sub_020348E4
_0230CDA0: .word ov11_0232311C
	arm_func_end ov11_0230CD84

	arm_func_start ov11_0230CDA4
ov11_0230CDA4: ; 0x0230CDA4
	ldr ip, _0230CDB0 ; =sub_020348E4
	ldr r0, _0230CDB4 ; =ov11_0232312C
	bx ip
	.align 2, 0
_0230CDB0: .word sub_020348E4
_0230CDB4: .word ov11_0232312C
	arm_func_end ov11_0230CDA4

	arm_func_start ov11_0230CDB8
ov11_0230CDB8: ; 0x0230CDB8
	ldr ip, _0230CDC4 ; =sub_020348E4
	ldr r0, _0230CDC8 ; =ov11_0232313C
	bx ip
	.align 2, 0
_0230CDC4: .word sub_020348E4
_0230CDC8: .word ov11_0232313C
	arm_func_end ov11_0230CDB8

	arm_func_start ov11_0230CDCC
ov11_0230CDCC: ; 0x0230CDCC
	ldr ip, _0230CDD8 ; =sub_020348E4
	ldr r0, _0230CDDC ; =ov11_0232314C
	bx ip
	.align 2, 0
_0230CDD8: .word sub_020348E4
_0230CDDC: .word ov11_0232314C
	arm_func_end ov11_0230CDCC

	arm_func_start ov11_0230CDE0
ov11_0230CDE0: ; 0x0230CDE0
	ldr ip, _0230CDEC ; =sub_020348E4
	ldr r0, _0230CDF0 ; =ov11_0232315C
	bx ip
	.align 2, 0
_0230CDEC: .word sub_020348E4
_0230CDF0: .word ov11_0232315C
	arm_func_end ov11_0230CDE0

	arm_func_start ov11_0230CDF4
ov11_0230CDF4: ; 0x0230CDF4
	ldr ip, _0230CE00 ; =sub_020348E4
	ldr r0, _0230CE04 ; =ov11_0232316C
	bx ip
	.align 2, 0
_0230CE00: .word sub_020348E4
_0230CE04: .word ov11_0232316C
	arm_func_end ov11_0230CDF4

	arm_func_start ov11_0230CE08
ov11_0230CE08: ; 0x0230CE08
	ldr ip, _0230CE14 ; =sub_020348E4
	ldr r0, _0230CE18 ; =ov11_0232317C
	bx ip
	.align 2, 0
_0230CE14: .word sub_020348E4
_0230CE18: .word ov11_0232317C
	arm_func_end ov11_0230CE08

	arm_func_start ov11_0230CE1C
ov11_0230CE1C: ; 0x0230CE1C
	ldr ip, _0230CE28 ; =sub_020348E4
	ldr r0, _0230CE2C ; =ov11_0232318C
	bx ip
	.align 2, 0
_0230CE28: .word sub_020348E4
_0230CE2C: .word ov11_0232318C
	arm_func_end ov11_0230CE1C

	arm_func_start ov11_0230CE30
ov11_0230CE30: ; 0x0230CE30
	ldr ip, _0230CE3C ; =sub_020348E4
	ldr r0, _0230CE40 ; =ov11_0232319C
	bx ip
	.align 2, 0
_0230CE3C: .word sub_020348E4
_0230CE40: .word ov11_0232319C
	arm_func_end ov11_0230CE30

	arm_func_start ov11_0230CE44
ov11_0230CE44: ; 0x0230CE44
	ldr ip, _0230CE50 ; =sub_020348E4
	ldr r0, _0230CE54 ; =ov11_023231AC
	bx ip
	.align 2, 0
_0230CE50: .word sub_020348E4
_0230CE54: .word ov11_023231AC
	arm_func_end ov11_0230CE44

	arm_func_start ov11_0230CE58
ov11_0230CE58: ; 0x0230CE58
	ldr ip, _0230CE70 ; =sub_02034974
	mov r3, r0
	mov r2, r1
	ldr r0, _0230CE74 ; =ov11_023231AC
	mov r1, r3
	bx ip
	.align 2, 0
_0230CE70: .word sub_02034974
_0230CE74: .word ov11_023231AC
	arm_func_end ov11_0230CE58

	arm_func_start ov11_0230CE78
ov11_0230CE78: ; 0x0230CE78
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x54
	mov r1, #1
	bl MemAlloc
	mov r5, r0
	ldr r0, _0230CECC ; =ov11_02324DBC
	ldr r4, _0230CED0 ; =ov11_023231BC
	str r5, [r0]
	add lr, r5, #0x2c
	mov ip, #2
_0230CEA0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230CEA0
	ldr r1, [r4]
	mov r0, #0
	str r1, [lr]
	str r0, [r5, #0x50]
	bl ov11_02312B40
	bl ov11_0230CF00
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230CECC: .word ov11_02324DBC
_0230CED0: .word ov11_023231BC
	arm_func_end ov11_0230CE78

	arm_func_start ov11_0230CED4
ov11_0230CED4: ; 0x0230CED4
	stmdb sp!, {r3, lr}
	bl ov11_0230CF00
	bl ov11_02312BCC
	ldr r0, _0230CEFC ; =ov11_02324DBC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230CEFC ; =ov11_02324DBC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CEFC: .word ov11_02324DBC
	arm_func_end ov11_0230CED4

	arm_func_start ov11_0230CF00
ov11_0230CF00: ; 0x0230CF00
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	ldr r0, _0230CFEC ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #2
	bne _0230CF48
	ldr r0, _0230CFF0 ; =ov11_023231BC
	mov r1, r4
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230CF48
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230CF48
	mov r0, #1
	blx r1
_0230CF48:
	ldr r0, _0230CFEC ; =ov11_02324DBC
	mov r2, #0
	ldr r1, [r0]
	ldr r6, _0230CFF0 ; =ov11_023231BC
	strb r2, [r1]
	ldr r1, [r0]
	add lr, sp, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov r5, #2
	strb r2, [r0, #0x29]
_0230CF74:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230CF74
	ldr r0, _0230CFEC ; =ov11_02324DBC
	ldr r1, [r6]
	ldr ip, [r0]
	str r1, [lr]
	add r6, sp, #0
	add lr, ip, #4
	mov r5, #2
_0230CFA0:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230CFA0
	ldr r0, [r6]
	add r5, sp, #0
	str r0, [lr]
	mov lr, #2
_0230CFC0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0230CFC0
	ldr r1, [r5]
	mov r0, #0
	str r1, [r4]
	str r0, [ip, #0x50]
	bl ov11_02312BF4
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0230CFEC: .word ov11_02324DBC
_0230CFF0: .word ov11_023231BC
	arm_func_end ov11_0230CF00

	arm_func_start ov11_0230CFF4
ov11_0230CFF4: ; 0x0230CFF4
	ldr ip, _0230CFFC ; =ov11_0230D71C
	bx ip
	.align 2, 0
_0230CFFC: .word ov11_0230D71C
	arm_func_end ov11_0230CFF4

	arm_func_start ov11_0230D000
ov11_0230D000: ; 0x0230D000
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	ldr r1, _0230D084 ; =ov11_02324DBC
	mov r2, #1
	ldr r1, [r1]
	cmp r0, #4
	strb r2, [r1, #0x29]
	addls pc, pc, r0, lsl #2
	b _0230D07C
_0230D024: ; jump table
	b _0230D040 ; case 0
	b _0230D074 ; case 1
	b _0230D06C ; case 2
	b _0230D048 ; case 3
	b _0230D038 ; case 4
_0230D038:
	bl ov11_02316440
	ldmia sp!, {r3, pc}
_0230D040:
	bl ov11_0230E48C
	ldmia sp!, {r3, pc}
_0230D048:
	bl sub_0204AFD0
	cmp r0, #0
	beq _0230D064
	mov r0, #0
	bl WorldMapSetMode
	bl ov11_0230ED28
	ldmia sp!, {r3, pc}
_0230D064:
	bl ov11_02310680
	ldmia sp!, {r3, pc}
_0230D06C:
	bl ov11_0230DFF4
	ldmia sp!, {r3, pc}
_0230D074:
	bl ov11_0231391C
	ldmia sp!, {r3, pc}
_0230D07C:
	bl ov11_0230D730
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D084: .word ov11_02324DBC
	arm_func_end ov11_0230D000

	arm_func_start ov11_0230D088
ov11_0230D088: ; 0x0230D088
	stmdb sp!, {r3, lr}
	bl sub_0204AEA0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0230D0F4
_0230D09C: ; jump table
	b _0230D0B8 ; case 0
	b _0230D0EC ; case 1
	b _0230D0E4 ; case 2
	b _0230D0C0 ; case 3
	b _0230D0B0 ; case 4
_0230D0B0:
	bl ov11_0231642C
	ldmia sp!, {r3, pc}
_0230D0B8:
	bl ov11_0230E478
	ldmia sp!, {r3, pc}
_0230D0C0:
	bl sub_0204AFD0
	cmp r0, #0
	beq _0230D0DC
	mov r0, #0
	bl WorldMapSetMode
	bl ov11_0230E964
	ldmia sp!, {r3, pc}
_0230D0DC:
	bl ov11_0231066C
	ldmia sp!, {r3, pc}
_0230D0E4:
	bl ov11_0230DFE0
	ldmia sp!, {r3, pc}
_0230D0EC:
	bl ov11_02313908
	ldmia sp!, {r3, pc}
_0230D0F4:
	bl ov11_0230D71C
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230D088

	arm_func_start ov11_0230D0FC
ov11_0230D0FC: ; 0x0230D0FC
	cmp r0, #0
	ldreq r0, _0230D16C ; =ov11_023231BC
	cmp r1, #0
	ldreq r1, _0230D16C ; =ov11_023231BC
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r3, [r0, #0x18]
	ldreq r2, [r1, #0x18]
	cmpeq r3, r2
	ldreq r3, [r0, #0x14]
	ldreq r2, [r1, #0x14]
	cmpeq r3, r2
	ldreq r3, [r0, #0x1c]
	ldreq r2, [r1, #0x1c]
	cmpeq r3, r2
	ldreq r2, [r0, #0x20]
	ldreq r0, [r1, #0x20]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0230D16C: .word ov11_023231BC
	arm_func_end ov11_0230D0FC

	arm_func_start ov11_0230D170
ov11_0230D170: ; 0x0230D170
	ldr ip, _0230D178 ; =ov11_0230D220
	bx ip
	.align 2, 0
_0230D178: .word ov11_0230D220
	arm_func_end ov11_0230D170

	arm_func_start ov11_0230D17C
ov11_0230D17C: ; 0x0230D17C
	stmdb sp!, {r4, lr}
	ldr r1, _0230D218 ; =ov11_02324DBC
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0230D1D0
	cmp r4, #0
	beq _0230D1B8
	add r1, r2, #4
	bl ov11_0230D0FC
	cmp r0, #0
	beq _0230D1D0
	mov r0, #1
	ldmia sp!, {r4, pc}
_0230D1B8:
	ldr r0, _0230D21C ; =ov11_023231BC
	add r1, r2, #4
	bl ov11_0230D0FC
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0230D1D0:
	cmp r4, #0
	beq _0230D1F0
	ldr r1, _0230D218 ; =ov11_02324DBC
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl ov11_0230D0FC
	ldmia sp!, {r4, pc}
_0230D1F0:
	ldr r1, _0230D218 ; =ov11_02324DBC
	ldr r0, _0230D21C ; =ov11_023231BC
	ldr r1, [r1]
	add r1, r1, #4
	bl ov11_0230D0FC
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230D218: .word ov11_02324DBC
_0230D21C: .word ov11_023231BC
	arm_func_end ov11_0230D17C

	arm_func_start ov11_0230D220
ov11_0230D220: ; 0x0230D220
	stmdb sp!, {r3, lr}
	ldr r0, _0230D26C ; =ov11_02324DBC
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	ldreqb r0, [r1, #0x28]
	cmpeq r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x50]
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r0, #2
	ldrneb r0, [r1, #0x29]
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x38]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D26C: .word ov11_02324DBC
	arm_func_end ov11_0230D220

	arm_func_start ov11_0230D270
ov11_0230D270: ; 0x0230D270
	stmdb sp!, {r4, lr}
	ldr r1, _0230D314 ; =ov11_02324DBC
	mov r4, r0
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230D300
	ldr r0, _0230D314 ; =ov11_02324DBC
	ldr r2, [r0]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0230D2B8
	mov r0, r4
	add r1, r2, #4
	bl ov11_0230D0FC
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D2B8:
	mov r1, #1
	strb r1, [r2]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r1, [r0]
	mov ip, #2
	strb r2, [r1, #0x29]
	ldr r0, [r0]
	add lr, r0, #4
_0230D2E0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D2E0
	ldr r1, [r4]
	mov r0, #1
	str r1, [lr]
	ldmia sp!, {r4, pc}
_0230D300:
	ldr r1, _0230D314 ; =ov11_02324DBC
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1, #0x29]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230D314: .word ov11_02324DBC
	arm_func_end ov11_0230D270

	arm_func_start ov11_0230D318
ov11_0230D318: ; 0x0230D318
	stmdb sp!, {r3, lr}
	ldr r2, _0230D33C ; =ov11_02324DBC
	ldr r3, [r2]
	ldr r2, [r3, #0x50]
	cmp r2, #2
	ldmneia sp!, {r3, pc}
	ldr r2, [r3, #0x3c]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D33C: .word ov11_02324DBC
	arm_func_end ov11_0230D318

	arm_func_start ov11_0230D340
ov11_0230D340: ; 0x0230D340
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	ldr r0, _0230D568 ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #1
	beq _0230D55C
	cmp r0, #2
	bne _0230D410
	add ip, sp, #0
	mov lr, r4
	mov r5, #2
_0230D374:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230D374
	ldr r0, [lr]
	str r0, [ip]
	ldr r0, [r4, #0x14]
	blx r0
	cmp r0, #1
	bne _0230D410
	add r1, sp, #0
	mov r0, r4
	bl ov11_0230D0FC
	cmp r0, #0
	beq _0230D410
	ldr r0, _0230D568 ; =ov11_02324DBC
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x50]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230D3D4
	mov r0, #1
	blx r1
_0230D3D4:
	ldr r5, _0230D56C ; =ov11_023231BC
	mov lr, r4
	mov ip, #2
_0230D3E0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D3E0
	ldr r1, [r5]
	ldr r0, _0230D568 ; =ov11_02324DBC
	str r1, [lr]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	str r2, [r0, #0x50]
_0230D410:
	ldr r0, _0230D568 ; =ov11_02324DBC
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	beq _0230D43C
	ldrb r0, [r1]
	cmp r0, #0
	ldreqb r0, [r1, #0x28]
	cmpeq r0, #0
	bne _0230D43C
	bl ov11_0230D088
_0230D43C:
	ldr r0, _0230D568 ; =ov11_02324DBC
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230D4E8
	ldr r0, _0230D56C ; =ov11_023231BC
	mov r1, r4
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230D480
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230D480
	mov r0, #0
	blx r1
	cmp r0, #0
	beq _0230D55C
_0230D480:
	ldr r0, _0230D568 ; =ov11_02324DBC
	mov ip, #2
	ldr r5, [r0]
	add lr, r5, #4
_0230D490:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D490
	ldr r0, [lr]
	mov r1, #0
	str r0, [r4]
	ldr r0, _0230D568 ; =ov11_02324DBC
	strb r1, [r5]
	ldr r5, [r0]
	ldr lr, _0230D56C ; =ov11_023231BC
	add ip, r5, #4
	mov r4, #2
_0230D4C4:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0230D4C4
	ldr r1, [lr]
	mov r0, #1
	str r1, [ip]
	str r0, [r5, #0x50]
	b _0230D55C
_0230D4E8:
	ldrb r0, [r1, #0x28]
	cmp r0, #0
	beq _0230D55C
	ldr r0, _0230D56C ; =ov11_023231BC
	mov r1, r4
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230D524
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230D524
	mov r0, #0
	blx r1
	cmp r0, #0
	beq _0230D55C
_0230D524:
	ldr lr, _0230D56C ; =ov11_023231BC
	mov ip, #2
_0230D52C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D52C
	ldr r1, [lr]
	ldr r0, _0230D568 ; =ov11_02324DBC
	str r1, [r4]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	str r2, [r0, #0x50]
_0230D55C:
	bl ov11_02312D00
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230D568: .word ov11_02324DBC
_0230D56C: .word ov11_023231BC
	arm_func_end ov11_0230D340

	arm_func_start ov11_0230D570
ov11_0230D570: ; 0x0230D570
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0230D6BC ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #2
	bne _0230D5A0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0230D6B4
	blx r0
	b _0230D6B4
_0230D5A0:
	cmp r0, #1
	bne _0230D6B4
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	beq _0230D5C4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0230D5C4
	bl ov11_0230D088
_0230D5C4:
	ldr r0, _0230D6BC ; =ov11_02324DBC
	ldr ip, [r0]
	ldrb r0, [ip]
	cmp r0, #0
	beq _0230D628
	mov lr, r4
	add r6, ip, #4
	mov r5, #2
_0230D5E4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230D5E4
	ldr r0, [r6]
	ldr r6, _0230D6C0 ; =ov11_023231BC
	str r0, [lr]
	add lr, ip, #4
	mov r5, #2
_0230D608:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230D608
	ldr r1, [r6]
	mov r0, #0
	str r1, [lr]
	strb r0, [ip]
_0230D628:
	ldr r0, _0230D6BC ; =ov11_02324DBC
	ldr ip, [r0]
	ldrb r0, [ip, #0x28]
	cmp r0, #0
	beq _0230D674
	ldr r5, _0230D6C0 ; =ov11_023231BC
	mov lr, #2
_0230D644:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0230D644
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
	ldr r0, _0230D6BC ; =ov11_02324DBC
	strb r1, [ip, #0x28]
	ldr r0, [r0]
	str r1, [r0, #0x50]
	b _0230D6B4
_0230D674:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0230D6AC
	blx r0
	cmp r0, #0
	ldreq r0, _0230D6BC ; =ov11_02324DBC
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #0x50]
	ldrne r0, _0230D6BC ; =ov11_02324DBC
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x50]
	b _0230D6B4
_0230D6AC:
	mov r0, #2
	str r0, [ip, #0x50]
_0230D6B4:
	bl ov11_023130AC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230D6BC: .word ov11_02324DBC
_0230D6C0: .word ov11_023231BC
	arm_func_end ov11_0230D570

	arm_func_start ov11_0230D6C4
ov11_0230D6C4: ; 0x0230D6C4
	stmdb sp!, {r3, lr}
	ldr r0, _0230D6EC ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	cmp r0, #2
	bne _0230D6E4
	ldr r0, [r1, #0x48]
	blx r0
_0230D6E4:
	bl ov11_02313488
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D6EC: .word ov11_02324DBC
	arm_func_end ov11_0230D6C4

	arm_func_start ov11_0230D6F0
ov11_0230D6F0: ; 0x0230D6F0
	stmdb sp!, {r3, lr}
	ldr r0, _0230D718 ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	cmp r0, #2
	bne _0230D710
	ldr r0, [r1, #0x4c]
	blx r0
_0230D710:
	bl ov11_02313794
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D718: .word ov11_02324DBC
	arm_func_end ov11_0230D6F0

	arm_func_start ov11_0230D71C
ov11_0230D71C: ; 0x0230D71C
	ldr ip, _0230D728 ; =ov11_0230D270
	ldr r0, _0230D72C ; =ov11_023231E0
	bx ip
	.align 2, 0
_0230D728: .word ov11_0230D270
_0230D72C: .word ov11_023231E0
	arm_func_end ov11_0230D71C

	arm_func_start ov11_0230D730
ov11_0230D730: ; 0x0230D730
	ldr ip, _0230D73C ; =ov11_0230D17C
	ldr r0, _0230D740 ; =ov11_023231E0
	bx ip
	.align 2, 0
_0230D73C: .word ov11_0230D17C
_0230D740: .word ov11_023231E0
	arm_func_end ov11_0230D730

	arm_func_start ov11_0230D744
ov11_0230D744: ; 0x0230D744
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230D76C ; =ov11_02324DC0
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D76C: .word ov11_02324DC0
	arm_func_end ov11_0230D744

	arm_func_start ov11_0230D770
ov11_0230D770: ; 0x0230D770
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230D794
	ldr r0, _0230D7B4 ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #6
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230D794:
	ldr r0, _0230D7B4 ; =ov11_02324DC0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230D7B4 ; =ov11_02324DC0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D7B4: .word ov11_02324DC0
	arm_func_end ov11_0230D770

	arm_func_start ov11_0230D7B8
ov11_0230D7B8: ; 0x0230D7B8
	ldr r0, _0230D7D8 ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #6
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0230D7D8: .word ov11_02324DC0
	arm_func_end ov11_0230D7B8

	arm_func_start ov11_0230D7DC
ov11_0230D7DC: ; 0x0230D7DC
	stmdb sp!, {r3, lr}
	ldr r0, _0230D8A8 ; =ov11_02324DC0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0230D8A0
_0230D7F8: ; jump table
	b _0230D810 ; case 0
	b _0230D874 ; case 1
	b _0230D8A0 ; case 2
	b _0230D890 ; case 3
	b _0230D8A0 ; case 4
	b _0230D890 ; case 5
_0230D810:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230D8A0
	bl ov11_022EA014
	cmp r0, #0x100
	ldreq r0, _0230D8A8 ; =ov11_02324DC0
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230D8A0
	bl ov11_022EA014
	mvn r1, #0xff
	cmp r0, r1
	ldreq r0, _0230D8A8 ; =ov11_02324DC0
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230D8A0
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230D8A8 ; =ov11_02324DC0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0230D8A0
_0230D874:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldreq r0, _0230D8A8 ; =ov11_02324DC0
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0230D8A0
_0230D890:
	mov r0, #6
	str r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
_0230D8A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D8A8: .word ov11_02324DC0
	arm_func_end ov11_0230D7DC

	arm_func_start ov11_0230D8AC
ov11_0230D8AC: ; 0x0230D8AC
	ldr r0, _0230D8CC ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0230D8CC: .word ov11_02324DC0
	arm_func_end ov11_0230D8AC

	arm_func_start ov11_0230D8D0
ov11_0230D8D0: ; 0x0230D8D0
	stmdb sp!, {r3, lr}
	ldr r0, _0230D928 ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	ldmneia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
	ldr r0, _0230D928 ; =ov11_02324DC0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #2
	moveq r0, #3
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D928: .word ov11_02324DC0
	arm_func_end ov11_0230D8D0

	arm_func_start ov11_0230D92C
ov11_0230D92C: ; 0x0230D92C
	ldr ip, _0230D938 ; =ov11_0230D270
	ldr r0, _0230D93C ; =ov11_02323204
	bx ip
	.align 2, 0
_0230D938: .word ov11_0230D270
_0230D93C: .word ov11_02323204
	arm_func_end ov11_0230D92C

	arm_func_start ov11_0230D940
ov11_0230D940: ; 0x0230D940
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230D968 ; =ov11_02324DC4
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D968: .word ov11_02324DC4
	arm_func_end ov11_0230D940

	arm_func_start ov11_0230D96C
ov11_0230D96C: ; 0x0230D96C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230D990
	ldr r0, _0230D9B0 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230D990:
	ldr r0, _0230D9B0 ; =ov11_02324DC4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230D9B0 ; =ov11_02324DC4
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D9B0: .word ov11_02324DC4
	arm_func_end ov11_0230D96C

	arm_func_start ov11_0230D9B4
ov11_0230D9B4: ; 0x0230D9B4
	ldr r0, _0230D9D4 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0230D9D4: .word ov11_02324DC4
	arm_func_end ov11_0230D9B4

	arm_func_start ov11_0230D9D8
ov11_0230D9D8: ; 0x0230D9D8
	stmdb sp!, {r3, lr}
	ldr r0, _0230DAD4 ; =ov11_02324DC4
	ldr r2, [r0]
	ldr r0, [r2]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230DACC
_0230D9F4: ; jump table
	b _0230DA14 ; case 0
	b _0230DA8C ; case 1
	b _0230DACC ; case 2
	b _0230DAB4 ; case 3
	b _0230DACC ; case 4
	b _0230DA78 ; case 5
	b _0230DAB4 ; case 6
	b _0230DAA8 ; case 7
_0230DA14:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230DACC
	bl ov11_022EA014
	cmp r0, #0x100
	ldreq r0, _0230DAD4 ; =ov11_02324DC4
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230DACC
	bl ov11_022EA014
	mvn r1, #0xff
	cmp r0, r1
	ldreq r0, _0230DAD4 ; =ov11_02324DC4
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230DACC
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230DAD4 ; =ov11_02324DC4
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0230DACC
_0230DA78:
	mov r1, #7
	mov r0, #0x10
	str r1, [r2]
	bl ov11_022E9CB0
	b _0230DACC
_0230DA8C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldreq r0, _0230DAD4 ; =ov11_02324DC4
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0230DACC
_0230DAA8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230DACC
_0230DAB4:
	ldr r0, _0230DAD4 ; =ov11_02324DC4
	mov r2, #8
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r3, pc}
_0230DACC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DAD4: .word ov11_02324DC4
	arm_func_end ov11_0230D9D8

	arm_func_start ov11_0230DAD8
ov11_0230DAD8: ; 0x0230DAD8
	ldr r0, _0230DAF8 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0230DAF8: .word ov11_02324DC4
	arm_func_end ov11_0230DAD8

	arm_func_start ov11_0230DAFC
ov11_0230DAFC: ; 0x0230DAFC
	stmdb sp!, {r3, lr}
	ldr r0, _0230DB54 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	ldmneia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
	ldr r0, _0230DB54 ; =ov11_02324DC4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #2
	moveq r0, #3
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DB54: .word ov11_02324DC4
	arm_func_end ov11_0230DAFC

	arm_func_start ov11_0230DB58
ov11_0230DB58: ; 0x0230DB58
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230DB90 ; =ov11_02323244
	bl ov11_0230D270
	cmp r0, #0
	ldrne r0, _0230DB94 ; =ov11_02324DC8
	strne r4, [r0, #8]
	ldmneia sp!, {r4, pc}
	ldr r0, _0230DB94 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r1, #8]
	cmp r0, r4
	strne r4, [r1, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230DB90: .word ov11_02323244
_0230DB94: .word ov11_02324DC8
	arm_func_end ov11_0230DB58

	arm_func_start ov11_0230DB98
ov11_0230DB98: ; 0x0230DB98
	stmdb sp!, {r3, lr}
	mov r0, #0x18
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230DBE4 ; =ov11_02324DC8
	str r0, [r1, #4]
	bl ov11_0230DC3C
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _0230DBE4 ; =ov11_02324DC8
	mov r3, #0
	ldmib r1, {r2, ip}
	str ip, [r2, #0x10]
	ldr r2, [r1, #4]
	mov r0, #1
	strb r3, [r2, #0x14]
	ldr r1, [r1, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DBE4: .word ov11_02324DC8
	arm_func_end ov11_0230DB98

	arm_func_start ov11_0230DBE8
ov11_0230DBE8: ; 0x0230DBE8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230DC14
	ldr r0, _0230DC38 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0x14]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230DC14:
	bl ov11_0230DC3C
	ldr r0, _0230DC38 ; =ov11_02324DC8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230DC38 ; =ov11_02324DC8
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DC38: .word ov11_02324DC8
	arm_func_end ov11_0230DBE8

	arm_func_start ov11_0230DC3C
ov11_0230DC3C: ; 0x0230DC3C
	stmdb sp!, {r3, lr}
	ldr r1, _0230DCB4 ; =ov11_02324DC8
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #0xc]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	ldr r0, [r0]
	cmp r0, #0
	beq _0230DCA0
	bl ov11_022EBEAC
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	mov r1, #0
	str r1, [r0]
_0230DCA0:
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DCB4: .word ov11_02324DC8
	arm_func_end ov11_0230DC3C

	arm_func_start ov11_0230DCB8
ov11_0230DCB8: ; 0x0230DCB8
	ldr r0, _0230DCD4 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0230DCD4: .word ov11_02324DC8
	arm_func_end ov11_0230DCB8

	arm_func_start ov11_0230DCD8
ov11_0230DCD8: ; 0x0230DCD8
	stmdb sp!, {r3, lr}
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230DE78
_0230DCF4: ; jump table
	b _0230DD14 ; case 0
	b _0230DD3C ; case 1
	b _0230DE78 ; case 2
	b _0230DE78 ; case 3
	b _0230DDD4 ; case 4
	b _0230DE00 ; case 5
	b _0230DE4C ; case 6
	b _0230DE68 ; case 7
_0230DD14:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #0xc]
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DD3C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230DE80 ; =ov11_02324DC8
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #0xc]
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	beq _0230DD94
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #6
	strb r3, [r2, #0xc]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _0230DE78
_0230DD94:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _0230DE78
	str r1, [r2, #8]
	ldr r1, [r0, #4]
	mov r2, #1
	strb r2, [r1, #0xc]
	ldr r1, [r0, #4]
	mov r2, #0
	str r2, [r1, #0x10]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _0230DE78
_0230DDD4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230DE80 ; =ov11_02324DC8
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #0xc]
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DE00:
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldreq r0, [r1, #0x10]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #0xc]
	beq _0230DE78
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
	b _0230DE78
_0230DE4C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #7
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DE68:
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
_0230DE78:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DE80: .word ov11_02324DC8
	arm_func_end ov11_0230DCD8

	arm_func_start ov11_0230DE84
ov11_0230DE84: ; 0x0230DE84
	stmdb sp!, {r3, lr}
	ldr r0, _0230DEF0 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1, #0xc]
	bl ov11_0230DC3C
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0230DEF0 ; =ov11_02324DC8
	ldr r1, _0230DEF4 ; =ov11_02323228
	str r0, [r2]
	bl ov11_022EBC18
	ldr r0, _0230DEF0 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [r1, #8]
	ldmia r2, {r1, r2}
	bl ov11_022EDE64
	ldr r0, _0230DEF0 ; =ov11_02324DC8
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DEF0: .word ov11_02324DC8
_0230DEF4: .word ov11_02323228
	arm_func_end ov11_0230DE84

	arm_func_start ov11_0230DEF8
ov11_0230DEF8: ; 0x0230DEF8
	stmdb sp!, {r3, lr}
	ldr r0, _0230DF58 ; =ov11_02324DC8
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #3
	bne _0230DF50
	mov r1, #1
	strb r1, [r2, #0xc]
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _0230DF58 ; =ov11_02324DC8
	mov r2, #1
	ldr r1, [r0, #4]
	mov r0, #0x10
	strb r2, [r1]
	bl ov11_022E9C98
	ldr r0, _0230DF58 ; =ov11_02324DC8
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DF50:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DF58: .word ov11_02324DC8
	arm_func_end ov11_0230DEF8

	arm_func_start ov11_0230DF5C
ov11_0230DF5C: ; 0x0230DF5C
	stmdb sp!, {r3, lr}
	ldr r0, _0230DFDC ; =ov11_02324DC8
	ldr r2, [r0, #4]
	ldrb r1, [r2]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0230DF98
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
_0230DF98:
	ldr r0, _0230DFDC ; =ov11_02324DC8
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	ldr r0, [r0]
	cmp r0, #0
	bne _0230DFBC
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
_0230DFBC:
	ldr r0, _0230DFDC ; =ov11_02324DC8
	ldr r0, [r0]
	bl ov11_022EFB70
	ldr r0, _0230DFDC ; =ov11_02324DC8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DFDC: .word ov11_02324DC8
	arm_func_end ov11_0230DF5C

	arm_func_start ov11_0230DFE0
ov11_0230DFE0: ; 0x0230DFE0
	ldr ip, _0230DFEC ; =ov11_0230D270
	ldr r0, _0230DFF0 ; =ov11_02323284
	bx ip
	.align 2, 0
_0230DFEC: .word ov11_0230D270
_0230DFF0: .word ov11_02323284
	arm_func_end ov11_0230DFE0

	arm_func_start ov11_0230DFF4
ov11_0230DFF4: ; 0x0230DFF4
	ldr ip, _0230E000 ; =ov11_0230D17C
	ldr r0, _0230E004 ; =ov11_02323284
	bx ip
	.align 2, 0
_0230E000: .word ov11_0230D17C
_0230E004: .word ov11_02323284
	arm_func_end ov11_0230DFF4

	arm_func_start ov11_0230E008
ov11_0230E008: ; 0x0230E008
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230E05C ; =ov11_02324DD4
	str r0, [r1, #4]
	bl ov11_0230E0D8
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _0230E05C ; =ov11_02324DD4
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1, #4]
	strb r0, [r2, #0xa]
	ldr r2, [r1, #4]
	strb r3, [r2, #0xb]
	ldr r1, [r1, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E05C: .word ov11_02324DD4
	arm_func_end ov11_0230E008

	arm_func_start ov11_0230E060
ov11_0230E060: ; 0x0230E060
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230E08C
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230E08C:
	bl ov11_0230E0D8
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	mov r2, #7
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0230E0B4
	bl sub_020483D8
_0230E0B4:
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E0D4: .word ov11_02324DD4
	arm_func_end ov11_0230E060

	arm_func_start ov11_0230E0D8
ov11_0230E0D8: ; 0x0230E0D8
	stmdb sp!, {r3, lr}
	ldr r1, _0230E150 ; =ov11_02324DD4
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _0230E150 ; =ov11_02324DD4
	ldr r0, [r0]
	cmp r0, #0
	beq _0230E13C
	bl ov11_022EBEAC
	ldr r0, _0230E150 ; =ov11_02324DD4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230E150 ; =ov11_02324DD4
	mov r1, #0
	str r1, [r0]
_0230E13C:
	ldr r0, _0230E150 ; =ov11_02324DD4
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E150: .word ov11_02324DD4
	arm_func_end ov11_0230E0D8

	arm_func_start ov11_0230E154
ov11_0230E154: ; 0x0230E154
	ldr r0, _0230E170 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_0230E170: .word ov11_02324DD4
	arm_func_end ov11_0230E154

	arm_func_start ov11_0230E174
ov11_0230E174: ; 0x0230E174
	bx lr
	arm_func_end ov11_0230E174

	arm_func_start ov11_0230E178
ov11_0230E178: ; 0x0230E178
	stmdb sp!, {r3, lr}
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230E338
_0230E194: ; jump table
	b _0230E1B4 ; case 0
	b _0230E1DC ; case 1
	b _0230E338 ; case 2
	b _0230E338 ; case 3
	b _0230E26C ; case 4
	b _0230E298 ; case 5
	b _0230E2E4 ; case 6
	b _0230E328 ; case 7
_0230E1B4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E340 ; =ov11_02324DD4
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E1DC:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E340 ; =ov11_02324DD4
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _0230E234
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #6
	strb r3, [r2, #9]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _0230E338
_0230E234:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _0230E338
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0, #4]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _0230E338
_0230E26C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E340 ; =ov11_02324DD4
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E298:
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _0230E338
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
	b _0230E338
_0230E2E4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0230E318
	bl sub_020483D8
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_0230E318:
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #7
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E328:
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
_0230E338:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E340: .word ov11_02324DD4
	arm_func_end ov11_0230E178

	arm_func_start ov11_0230E344
ov11_0230E344: ; 0x0230E344
	stmdb sp!, {r3, lr}
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1, #9]
	bl ov11_0230E0D8
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0230E3D8 ; =ov11_02324DD4
	ldr r1, _0230E3DC ; =ov11_02323268
	str r0, [r2]
	bl ov11_022EBC18
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	ldr r1, _0230E3E0 ; =ov11_023232A8
	ldr r0, [r0]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0230E3C4
	bl sub_02048384
	bl sub_020483B8
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_0230E3C4:
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E3D8: .word ov11_02324DD4
_0230E3DC: .word ov11_02323268
_0230E3E0: .word ov11_023232A8
	arm_func_end ov11_0230E344

	arm_func_start ov11_0230E3E4
ov11_0230E3E4: ; 0x0230E3E4
	stmdb sp!, {r3, lr}
	ldr r0, _0230E430 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	cmp r1, #3
	bne _0230E428
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _0230E430 ; =ov11_02324DD4
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E428:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E430: .word ov11_02324DD4
	arm_func_end ov11_0230E3E4

	arm_func_start ov11_0230E434
ov11_0230E434: ; 0x0230E434
	stmdb sp!, {r3, lr}
	ldr r0, _0230E474 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _0230E474 ; =ov11_02324DD4
	mov r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x10
	strb r2, [r1]
	bl ov11_022E9C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E474: .word ov11_02324DD4
	arm_func_end ov11_0230E434

	arm_func_start ov11_0230E478
ov11_0230E478: ; 0x0230E478
	ldr ip, _0230E484 ; =ov11_0230D270
	ldr r0, _0230E488 ; =ov11_023232D8
	bx ip
	.align 2, 0
_0230E484: .word ov11_0230D270
_0230E488: .word ov11_023232D8
	arm_func_end ov11_0230E478

	arm_func_start ov11_0230E48C
ov11_0230E48C: ; 0x0230E48C
	ldr ip, _0230E498 ; =ov11_0230D17C
	ldr r0, _0230E49C ; =ov11_023232D8
	bx ip
	.align 2, 0
_0230E498: .word ov11_0230D17C
_0230E49C: .word ov11_023232D8
	arm_func_end ov11_0230E48C

	arm_func_start ov11_0230E4A0
ov11_0230E4A0: ; 0x0230E4A0
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230E4F8 ; =ov11_02324DDC
	str r0, [r1, #4]
	bl ov11_0230E578
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _0230E4F8 ; =ov11_02324DDC
	mvn r3, #1
	ldr r2, [r1, #4]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1, #4]
	mov r3, #0
	strb r0, [r2, #0xa]
	ldr r2, [r1, #4]
	strb r3, [r2, #0xb]
	ldr r1, [r1, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E4F8: .word ov11_02324DDC
	arm_func_end ov11_0230E4A0

	arm_func_start ov11_0230E4FC
ov11_0230E4FC: ; 0x0230E4FC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230E528
	ldr r0, _0230E574 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230E528:
	bl ov11_0230E578
	ldr r0, _0230E574 ; =ov11_02324DDC
	mov r3, #8
	ldr r2, [r0, #4]
	sub r1, r3, #0xa
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0230E554
	bl CloseControlsChart
_0230E554:
	ldr r0, _0230E574 ; =ov11_02324DDC
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230E574 ; =ov11_02324DDC
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E574: .word ov11_02324DDC
	arm_func_end ov11_0230E4FC

	arm_func_start ov11_0230E578
ov11_0230E578: ; 0x0230E578
	stmdb sp!, {r3, lr}
	ldr r1, _0230E5F0 ; =ov11_02324DDC
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	ldr r0, [r0]
	cmp r0, #0
	beq _0230E5DC
	bl ov11_022EBEAC
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	mov r1, #0
	str r1, [r0]
_0230E5DC:
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E5F0: .word ov11_02324DDC
	arm_func_end ov11_0230E578

	arm_func_start ov11_0230E5F4
ov11_0230E5F4: ; 0x0230E5F4
	ldr r0, _0230E610 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_0230E610: .word ov11_02324DDC
	arm_func_end ov11_0230E5F4

	arm_func_start ov11_0230E614
ov11_0230E614: ; 0x0230E614
	bx lr
	arm_func_end ov11_0230E614

	arm_func_start HandleControlsTopScreenGround
HandleControlsTopScreenGround: ; 0x0230E618
	stmdb sp!, {r3, lr}
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0230E7E0
_0230E634: ; jump table
	b _0230E658 ; case 0
	b _0230E680 ; case 1
	b _0230E7E0 ; case 2
	b _0230E7E0 ; case 3
	b _0230E7E0 ; case 4
	b _0230E710 ; case 5
	b _0230E73C ; case 6
	b _0230E788 ; case 7
	b _0230E7D0 ; case 8
_0230E658:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E680:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E7E8 ; =ov11_02324DDC
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _0230E6D8
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #7
	strb r3, [r2, #9]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _0230E7E0
_0230E6D8:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _0230E7E0
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0, #4]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _0230E7E0
_0230E710:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E7E8 ; =ov11_02324DDC
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #6
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E73C:
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _0230E7E0
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
	b _0230E7E0
_0230E788:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0230E7C0
	bl CloseControlsChart
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_0230E7C0:
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E7D0:
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
_0230E7E0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E7E8: .word ov11_02324DDC
	arm_func_end HandleControlsTopScreenGround

	arm_func_start ov11_0230E7EC
ov11_0230E7EC: ; 0x0230E7EC
	stmdb sp!, {r3, lr}
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	ldr r3, [r0, #4]
	ldr r1, [r3, #4]
	cmp r1, #2
	bne _0230E854
	mov r2, #1
	strb r2, [r3, #9]
	ldr r1, [r0, #4]
	sub r0, r2, #3
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _0230E840
	mov r0, #0
	ldr r3, _0230E8C4 ; =0x00003FCA
	mov r1, r0
	mov r2, r0
	bl CreateControlsChart
	ldr r1, _0230E8C0 ; =ov11_02324DDC
	ldr r1, [r1, #4]
	strb r0, [r1, #8]
_0230E840:
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
_0230E854:
	cmp r1, #3
	ldmneia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r3, #9]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #8]
	bl IsControlsChartActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov11_0230E578
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0230E8C0 ; =ov11_02324DDC
	ldr r1, _0230E8C8 ; =ov11_023232BC
	str r0, [r2]
	bl ov11_022EBC18
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	ldr r1, _0230E8CC ; =ov11_023232FC
	ldr r0, [r0]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E8C0: .word ov11_02324DDC
#if defined(EUROPE)
_0230E8C4: .word 0x00003FCC
#elif defined(JAPAN)
_0230E8C4: .word 0x000049CD
#else
_0230E8C4: .word 0x00003FCA
#endif
_0230E8C8: .word ov11_023232BC
_0230E8CC: .word ov11_023232FC
	arm_func_end ov11_0230E7EC

	arm_func_start ov11_0230E8D0
ov11_0230E8D0: ; 0x0230E8D0
	stmdb sp!, {r3, lr}
	ldr r0, _0230E91C ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	cmp r1, #4
	bne _0230E914
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _0230E91C ; =ov11_02324DDC
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #5
	strb r3, [r2]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E914:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E91C: .word ov11_02324DDC
	arm_func_end ov11_0230E8D0

	arm_func_start ov11_0230E920
ov11_0230E920: ; 0x0230E920
	stmdb sp!, {r3, lr}
	ldr r0, _0230E960 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _0230E960 ; =ov11_02324DDC
	mov r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x10
	strb r2, [r1]
	bl ov11_022E9C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E960: .word ov11_02324DDC
	arm_func_end ov11_0230E920

	arm_func_start ov11_0230E964
ov11_0230E964: ; 0x0230E964
	ldr ip, _0230E970 ; =ov11_0230D270
	ldr r0, _0230E974 ; =ov11_02323350
	bx ip
	.align 2, 0
_0230E970: .word ov11_0230D270
_0230E974: .word ov11_02323350
	arm_func_end ov11_0230E964

	arm_func_start ov11_0230E978
ov11_0230E978: ; 0x0230E978
	stmdb sp!, {r3, lr}
	ldr r0, _0230EB50 ; =0x0000FF94
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	str r0, [r1, #8]
	bl GetExecuteSpecialEpisodeType
	mvn r1, #0
	cmp r0, r1
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	movne r2, #1
	mov ip, #1
	ldr r1, [r0, #8]
	moveq r2, #0
	strb r2, [r1]
	ldr r1, [r0, #8]
	sub r3, ip, #2
	strb ip, [r1, #0xc]
	ldr r1, [r0, #8]
	mov r2, #0
	strh r3, [r1, #2]
	ldr r1, [r0, #8]
	strb r2, [r1, #4]
	ldr r1, [r0, #8]
	strb r2, [r1, #5]
	ldr r1, [r0, #8]
	ldrb r0, [r1]
	cmp r0, #0
	addne r0, r1, #0xf000
	strneb r2, [r0, #0x999]
	bne _0230EA08
	bl sub_0204CDCC
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
_0230EA08:
	ldr ip, _0230EB54 ; =WORLD_MAP_MODE
	mvn r0, #0
	ldr r2, [ip, #8]
	mov r1, #0
	add r2, r2, #0xf900
	strh r0, [r2, #0x9c]
	ldr r2, [ip, #8]
	ldr r3, _0230EB58 ; =0x00000136
	add r2, r2, #0xf900
	strh r0, [r2, #0x9e]
	ldr r2, [ip, #8]
	add r2, r2, #0xf000
	strb r1, [r2, #0xe8c]
	ldr r2, [ip, #8]
	add r2, r2, #0xf000
	strb r1, [r2, #0xe88]
	ldr r2, [ip, #8]
	add r2, r2, #0xf000
	strb r1, [r2, #0x9ac]
_0230EA54:
	ldr r2, [ip, #8]
	add r2, r2, r1, lsl #2
	add r2, r2, #0xf000
	add r1, r1, #1
	str r0, [r2, #0x9b0]
	cmp r1, r3
	blt _0230EA54
	ldr r2, _0230EB54 ; =WORLD_MAP_MODE
	mov ip, #0
	ldr r1, [r2, #8]
	sub r3, ip, #2
	add r1, r1, #0xf000
	strb ip, [r1, #0xf90]
	ldr r1, [r2, #8]
	add r1, r1, #0xf000
	strb r3, [r1, #0x998]
	ldr r1, [r2, #8]
	str ip, [r1, #0x2c]
	bl ov11_022F4734
	mov r0, #0
	bl ov11_02312844
	bl ov11_0230EC00
	bl GetMainCharacter1
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	ldrsh r2, [r0, #4]
	ldr r0, [r1, #8]
	mov r3, #0
	add r0, r0, #0x500
	strh r2, [r0, #0x2e]
	ldr r0, [r1, #8]
	ldr r2, _0230EB5C ; =0xA0080000
	strb r3, [r0, #0x530]
	ldr r1, [r1, #8]
	add r0, r1, #0x134
	add r0, r0, #0x400
	add r1, r1, #0x500
	ldrsh r1, [r1, #0x2e]
	bl ov11_022F5BBC
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	mov r1, #0xa
	ldr r0, [r0, #8]
	add r0, r0, #0x134
	add r0, r0, #0x400
	bl ov11_022F4974
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	mov r1, #0x9b
	ldr r0, [r0, #8]
	ldr r2, _0230EB5C ; =0xA0080000
	add r0, r0, #0x1f8
	add r0, r0, #0x400
	bl LoadObjectAnimData
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	mov r1, #8
	ldr r0, [r0, #8]
	add r0, r0, #0x1f8
	add r0, r0, #0x400
	bl ov11_022F4974
	mov r2, #0
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	mov r0, #1
	ldr r1, [r1, #8]
	strb r2, [r1, #0x6bc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230EB50: .word 0x0000FF94
_0230EB54: .word WORLD_MAP_MODE
_0230EB58: .word 0x00000136
_0230EB5C: .word 0xA0080000
	arm_func_end ov11_0230E978

	arm_func_start ov11_0230EB60
ov11_0230EB60: ; 0x0230EB60
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230EB90
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r0, [r1, #8]
	cmp r0, #9
	addne r0, r1, #0xf000
	movne r1, #1
	strneb r1, [r0, #0xf90]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230EB90:
	bl ov11_0230EC00
	bl ov11_02312894
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	add r0, r0, #0x134
	add r0, r0, #0x400
	bl ov11_022F5C3C
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	add r0, r0, #0x1f8
	add r0, r0, #0x400
	bl ov11_022F6EFC
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0x6bc]
	cmp r0, #0
	beq _0230EBDC
	add r0, r1, #0x6c0
	bl ov11_022F6EFC
_0230EBDC:
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	mov r1, #0
	str r1, [r0, #8]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230EBFC: .word WORLD_MAP_MODE
	arm_func_end ov11_0230EB60

	arm_func_start ov11_0230EC00
ov11_0230EC00: ; 0x0230EC00
	stmdb sp!, {r3, lr}
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	mov r3, #1
	ldr r1, [r0, #8]
	mov r2, #0
	strb r2, [r1, #6]
	ldr r2, [r0, #8]
	sub r1, r3, #3
	str r3, [r2, #8]
	ldr r2, [r0, #8]
	strb r3, [r2, #0xc]
	ldr r0, [r0, #8]
	add r0, r0, #0xf900
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	beq _0230EC58
	bl CloseAreaNameBox
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x998]
_0230EC58:
	mov ip, #0
	ldr r2, _0230ED20 ; =WORLD_MAP_MODE
	ldr r1, _0230ED24 ; =0x00000136
	mov r0, ip
_0230EC68:
	ldr r3, [r2, #8]
	add r3, r3, ip, lsl #2
	add ip, ip, #1
	str r0, [r3, #0x54]
	cmp ip, r1
	blt _0230EC68
	ldr r1, _0230ED20 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r1, #8]
	add r1, r1, #0x500
	strh r2, [r1, #0x2c]
	bl ov11_023128C0
	ldr r1, _0230ED20 ; =WORLD_MAP_MODE
	mvn ip, #0
	ldr r0, [r1, #8]
	mov r3, #0
	strh ip, [r0, #0x30]
	ldr r2, [r1, #8]
	mov r0, #1
	str r3, [r2, #0x34]
	ldr r2, [r1, #8]
	str r3, [r2, #0x38]
	ldr r2, [r1, #8]
	str r3, [r2, #0x3c]
	ldr r2, [r1, #8]
	str r3, [r2, #0x40]
	ldr r2, [r1, #8]
	str r3, [r2, #0x44]
	ldr r1, [r1, #8]
	strb ip, [r1, #0x50]
	bl ov11_022EAFF8
	mov r0, #1
	mov r1, #6
	bl ov11_022EB0C0
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230ED20: .word WORLD_MAP_MODE
_0230ED24: .word 0x00000136
	arm_func_end ov11_0230EC00

	arm_func_start ov11_0230ED28
ov11_0230ED28: ; 0x0230ED28
	ldr r0, _0230ED44 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0230ED44: .word WORLD_MAP_MODE
	arm_func_end ov11_0230ED28

	arm_func_start GetDungeonMapPos
GetDungeonMapPos: ; 0x0230ED48
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0230EDAC ; =WORLD_MAP_MODE
	mov r4, r0
	ldr r2, [r2, #8]
	mov r0, r1
	ldrsh r1, [r2, #2]
	add r2, sp, #0
	bl sub_0206A96C
	mvn r1, #0
	cmp r0, r1
	beq _0230EDA0
	ldr r0, [sp]
	cmp r0, #0
	blt _0230EDA0
	mov r0, r0, lsl #8
	str r0, [r4]
	ldr r1, [sp, #4]
	mov r0, #1
	mov r1, r1, lsl #8
	str r1, [r4, #4]
	b _0230EDA4
_0230EDA0:
	mov r0, #0
_0230EDA4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230EDAC: .word WORLD_MAP_MODE
	arm_func_end GetDungeonMapPos

	arm_func_start ov11_0230EDB0
ov11_0230EDB0: ; 0x0230EDB0
	ldr r1, _0230EDD8 ; =WORLD_MAP_MODE
	mov r3, #0
	ldr r2, [r1, #8]
	str r3, [r2, #0x34]
	ldr r2, [r1, #8]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r2, #0x48]
	str r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_0230EDD8: .word WORLD_MAP_MODE
	arm_func_end ov11_0230EDB0

	arm_func_start ov11_0230EDDC
ov11_0230EDDC: ; 0x0230EDDC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	mov r0, #0
	ldr r1, [r1, #8]
	sub r2, r0, #1
	add r1, r1, #0xf900
	ldrsh r1, [r1, #0x9c]
	cmp r1, r2
	beq _0230EE74
	add r0, sp, #0
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230EE5C
	mov r0, #1
	mov r1, #6
	bl ov11_022EB0C0
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0xf900
	ldrsh r0, [r0, #0x9c]
	strh r0, [r2, #0x30]
	ldr r0, [r1, #8]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	cmpne r0, #1
	beq _0230EE54
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB2F4
_0230EE54:
	add r0, sp, #0
	bl ov11_0230EDB0
_0230EE5C:
	ldr r0, _0230EF44 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r0, #8]
	mov r0, #1
	add r1, r1, #0xf900
	strh r2, [r1, #0x9c]
_0230EE74:
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r1, #8]
	add r1, r1, #0xf900
	ldrsh r1, [r1, #0x9e]
	cmp r1, r2
	beq _0230EF3C
	add r0, sp, #0
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230EF24
	mov r0, #1
	mov r1, #6
	bl ov11_022EB0C0
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0xf900
	ldrsh r0, [r0, #0x9e]
	strh r0, [r2, #0x30]
	ldr r0, [r1, #8]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	cmpne r0, #1
	beq _0230EEE0
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB2F4
_0230EEE0:
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0xf000
	ldr r0, [r0, #0x9a0]
	str r0, [r2, #0x34]
	ldr ip, [r1, #8]
	ldr r3, [sp]
	ldr r2, [sp, #4]
	add r0, ip, #0xf000
	str r3, [ip, #0x48]
	str r2, [ip, #0x4c]
	ldr r0, [r0, #0x9a4]
	str r0, [ip, #0x38]
	ldr r1, [r1, #8]
	add r0, r1, #0xf000
	ldr r0, [r0, #0x9a8]
	str r0, [r1, #0x3c]
_0230EF24:
	ldr r0, _0230EF44 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r0, #8]
	mov r0, #1
	add r1, r1, #0xf900
	strh r2, [r1, #0x9e]
_0230EF3C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230EF44: .word WORLD_MAP_MODE
	arm_func_end ov11_0230EDDC

	arm_func_start ov11_0230EF48
ov11_0230EF48: ; 0x0230EF48
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _0230EFFC ; =WORLD_MAP_MODE
	mov r4, r2
	ldr r2, [r3, #8]
	mov r5, r1
	ldrsh r1, [r2, #2]
	add r2, sp, #0
	bl sub_0206A96C
	mvn r1, #0
	cmp r0, r1
	cmpne r5, #0
	beq _0230EFF4
	ldr r1, _0230EFFC ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, r0, lsl #2
	ldr r1, [r1, #0x54]
	cmp r1, r5
	blt _0230EF9C
	cmp r4, #0
	beq _0230EFF4
_0230EF9C:
	ldr r2, _0230EFFC ; =WORLD_MAP_MODE
	mov r1, #0xc4
	ldr r3, [r2, #8]
	mul r4, r0, r1
	add r0, r3, r0, lsl #2
	str r5, [r0, #0x54]
	ldr r1, [r2, #8]
	add r0, r3, #0x384
	add r6, r0, #0x400
	add r1, r1, #0x1f8
	add r0, r6, r4
	add r1, r1, #0x400
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, r6, r4
	mov r1, #8
	bl ov11_022F4974
	ldr r0, _0230F000 ; =ov11_02323310
	mov r1, r5, lsl #1
	ldrsh r1, [r0, r1]
	add r0, r6, r4
	mov r2, #0
	bl SetAnimDataFields2
_0230EFF4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230EFFC: .word WORLD_MAP_MODE
_0230F000: .word ov11_02323310
	arm_func_end ov11_0230EF48

	arm_func_start WorldMapSetMode
WorldMapSetMode: ; 0x0230F004
	ldr r1, _0230F04C ; =WORLD_MAP_MODE
	str r0, [r1]
	ldr r3, [r1, #8]
	cmp r3, #0
	ldrne r2, [r3, #0x2c]
	cmpne r2, r0
	bxeq lr
	ldrsb r2, [r3, #4]
	add r0, r3, #0xf000
	mov r3, #0
	strb r2, [r0, #0x999]
	ldr r0, [r1, #8]
	mov r2, #1
	add r0, r0, #0xf000
	strb r3, [r0, #0x99a]
	ldr r0, [r1, #8]
	strb r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F04C: .word WORLD_MAP_MODE
	arm_func_end WorldMapSetMode

	arm_func_start ov11_0230F050
ov11_0230F050: ; 0x0230F050
	ldr r2, _0230F088 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
	ldr r0, [r2, #8]
	mov r1, #0
	add r0, r0, #0xf000
	strb r1, [r0, #0x99a]
	ldr r0, [r2, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F088: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F050

	arm_func_start ov11_0230F08C
ov11_0230F08C: ; 0x0230F08C
	ldr r2, _0230F0C0 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
	ldr r0, [r2, #8]
	mov r1, #1
	add r0, r0, #0xf000
	strb r1, [r0, #0x99a]
	ldr r0, [r2, #8]
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F0C0: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F08C

	arm_func_start WorldMapSetCamera
WorldMapSetCamera: ; 0x0230F0C4
	ldr r2, _0230F0E8 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	addne r1, r1, #0xf900
	strneh r0, [r1, #0x9c]
	ldrne r0, [r2, #8]
	movne r1, #1
	strneb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F0E8: .word WORLD_MAP_MODE
	arm_func_end WorldMapSetCamera

	arm_func_start ov11_0230F0EC
ov11_0230F0EC: ; 0x0230F0EC
	ldr r2, _0230F134 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf900
	strh r0, [r1, #0x9e]
	ldr r0, [r2, #8]
	mov r1, #2
	add r0, r0, #0xf000
	str r1, [r0, #0x9a0]
	ldr r0, [r2, #8]
	mov r1, #0x200
	add r0, r0, #0xf000
	str r1, [r0, #0x9a4]
	ldr r0, [r2, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F134: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F0EC

	arm_func_start ov11_0230F138
ov11_0230F138: ; 0x0230F138
	ldr r3, _0230F17C ; =WORLD_MAP_MODE
	ldr r2, [r3, #8]
	cmp r2, #0
	bxeq lr
	add r2, r2, #0xf900
	strh r0, [r2, #0x9e]
	ldr r0, [r3, #8]
	mov r2, #3
	add r0, r0, #0xf000
	str r2, [r0, #0x9a0]
	ldr r0, [r3, #8]
	mov r2, #1
	add r0, r0, #0xf000
	str r1, [r0, #0x9a8]
	ldr r0, [r3, #8]
	strb r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F17C: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F138

	arm_func_start ov11_0230F180
ov11_0230F180: ; 0x0230F180
	ldr r1, _0230F1B0 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	cmp r2, #0
	bxeq lr
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf000
	mov r2, #1
	str r2, [r0, #0x9b0]
	ldr r0, [r1, #8]
	add r0, r0, #0xf000
	strb r2, [r0, #0x9ac]
	bx lr
	.align 2, 0
_0230F1B0: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F180

	arm_func_start ov11_0230F1B4
ov11_0230F1B4: ; 0x0230F1B4
	ldr r1, _0230F1E8 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	cmp r2, #0
	bxeq lr
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf000
	mov r2, #2
	str r2, [r0, #0x9b0]
	ldr r0, [r1, #8]
	mov r1, #1
	add r0, r0, #0xf000
	strb r1, [r0, #0x9ac]
	bx lr
	.align 2, 0
_0230F1E8: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F1B4

	arm_func_start ov11_0230F1EC
ov11_0230F1EC: ; 0x0230F1EC
	ldr r2, _0230F218 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xfe00
	strh r0, [r1, #0x8a]
	ldr r0, [r2, #8]
	mov r1, #1
	add r0, r0, #0xf000
	strb r1, [r0, #0xe88]
	bx lr
	.align 2, 0
_0230F218: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F1EC

	arm_func_start ov11_0230F21C
ov11_0230F21C: ; 0x0230F21C
	ldr r2, _0230F258 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf000
	mov r3, #1
	strb r3, [r1, #0xe8c]
	ldr r1, [r2, #8]
	mov r3, #0
	add r1, r1, #0xfe00
	strh r0, [r1, #0x8e]
	ldr r0, [r2, #8]
	add r0, r0, #0xf000
	strb r3, [r0, #0xe90]
	bx lr
	.align 2, 0
_0230F258: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F21C

	arm_func_start ov11_0230F25C
ov11_0230F25C: ; 0x0230F25C
	ldr r1, _0230F288 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldr r2, [r1, #0x40]
	ldr r1, [r1, #0x44]
	str r2, [r0]
	str r1, [r0, #4]
	mov r0, #1
	bx lr
	.align 2, 0
_0230F288: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F25C

	arm_func_start ov11_0230F28C
ov11_0230F28C: ; 0x0230F28C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0230F358 ; =WORLD_MAP_MODE
	mov r5, r0
	ldr r0, [r2, #4]
	mov r4, r1
	cmp r0, #0
	beq _0230F350
	ldr r1, [r2, #8]
	ldrsh r2, [r1, #2]
	cmp r2, #0x10c
	bne _0230F2E0
	mov r0, #0x8000
	str r0, [r5]
	mov r0, #0x6000
	str r0, [r5, #4]
	mov r0, #0x17800
	str r0, [r4]
	mov r0, #0xf000
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0230F2E0:
	mvn r1, #0
	cmp r2, r1
	beq _0230F350
	mov r1, r5
	mov r2, r4
	bl ov11_022EF498
	ldr r0, [r5]
	add r0, r0, #0x8000
	str r0, [r5]
	ldr r0, [r5, #4]
	add r0, r0, #0x6000
	str r0, [r5, #4]
	ldr r0, [r4]
	sub r0, r0, #0x8000
	str r0, [r4]
	ldr r0, [r4, #4]
	sub r0, r0, #0x6000
	str r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, [r4]
	cmp r1, r0
	strgt r1, [r4]
	ldr r1, [r5, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	strgt r1, [r4, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0230F350:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230F358: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F28C

	arm_func_start ov11_0230F35C
ov11_0230F35C: ; 0x0230F35C
	ldr r0, _0230F374 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	cmp r0, #0
	ldrneb r0, [r0, #0xc]
	moveq r0, #0
	bx lr
	.align 2, 0
_0230F374: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F35C

	arm_func_start ov11_0230F378
ov11_0230F378: ; 0x0230F378
	bx lr
	arm_func_end ov11_0230F378

	arm_func_start ov11_0230F37C
ov11_0230F37C: ; 0x0230F37C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x4c
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0230FDB0
_0230F39C: ; jump table
	b _0230F3C4 ; case 0
	b _0230F3EC ; case 1
	b _0230FDB0 ; case 2
	b _0230FDB0 ; case 3
	b _0230F7D0 ; case 4
	b _0230F900 ; case 5
	b _0230F640 ; case 6
	b _0230F66C ; case 7
	b _0230FD84 ; case 8
	b _0230FDA0 ; case 9
_0230F3C4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #1
	ldrne r0, [r0, #8]
	strneb r1, [r0, #0xc]
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_0230F3EC:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	movne r1, #1
	ldrne r0, [r0, #8]
	strneb r1, [r0, #0xc]
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0x6bc]
	cmp r0, #0
	beq _0230F434
	add r0, r1, #0x6c0
	bl ov11_022F6EFC
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x6bc]
_0230F434:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0]
	cmp r1, #0
	bne _0230F4D4
	ldr r1, [r0, #8]
	ldrb r0, [r1]
	cmp r0, #0
	addne r0, r1, #0xf000
	movne r1, #0
	strneb r1, [r0, #0x999]
	bne _0230F4A0
	mov r0, #0x3e8
	bl sub_0206A878
	ldr r1, _02310054 ; =0x0000010D
	cmp r0, r1
	bne _0230F48C
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x999]
	b _0230F4A0
_0230F48C:
	bl sub_0204CDCC
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
_0230F4A0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf900
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	beq _0230F4D4
	bl CloseAreaNameBox
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x998]
_0230F4D4:
	ldr r3, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r3, #8]
	add r1, r0, #0xf000
	ldrb r1, [r1, #0xf90]
	cmp r1, #0
	beq _0230F514
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r3, #1
	ldr r2, [r0, #8]
	mov r1, #8
	strb r3, [r2, #0xc]
	ldr r0, [r0, #8]
	str r1, [r0, #8]
	b _0230FDB0
_0230F514:
	add r2, r0, #0xf900
	ldrsb r1, [r2, #0x99]
	cmp r1, #0
	blt _0230F604
	ldr r2, [r3]
	mvn r1, #0
	str r2, [r0, #0x2c]
	ldr r4, [r3, #8]
	mov r2, #1
	add r0, r4, #0xf900
	ldrsb r0, [r0, #0x99]
	strb r0, [r4, #4]
	ldr r0, [r3, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x999]
	ldr r0, [r3, #8]
	strb r2, [r0, #0xc]
	ldr r1, [r3, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230F588
	bl sub_0206A9DC
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mov r2, #2
	ldr r3, [r1, #8]
	strh r0, [r3, #2]
	ldr r0, [r1, #8]
	str r2, [r0, #8]
	b _0230F5BC
_0230F588:
	ldrsb r0, [r1, #4]
	cmp r0, #0
	movne r0, #0x10c
	strneh r0, [r1, #2]
	ldrne r0, [r3, #8]
	movne r1, #2
	strne r1, [r0, #8]
	bne _0230F5BC
	add r0, r2, #0x10c
	strh r0, [r1, #2]
	ldr r0, [r3, #8]
	mov r1, #2
	str r1, [r0, #8]
_0230F5BC:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r2, #0
	ldr r1, [r0, #8]
	strb r2, [r1, #5]
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x2c]
	cmp r0, #3
	bne _0230F5F0
	ldrsb r0, [r1, #4]
	cmp r0, #1
	addgt r0, r1, #0xf000
	ldrgtb r0, [r0, #0x99a]
	strgtb r0, [r1, #5]
_0230F5F0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F604:
	ldrsh r3, [r2, #0x9c]
	mvn r1, #0
	cmp r3, r1
	ldreqsh r2, [r2, #0x9e]
	cmpeq r2, r1
	moveq r1, #0
	streqb r1, [r0, #0xc]
	beq _0230FDB0
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mov r2, #5
	str r2, [r0, #8]
	ldr r0, [r1, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F640:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	movne r1, #1
	ldrne r0, [r0, #8]
	strneb r1, [r0, #0xc]
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #7
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_0230F66C:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	add r0, r1, #0xf000
	ldrb r0, [r0, #0xf90]
	cmp r0, #0
	bne _0230F694
	add r0, r1, #0xf900
	ldrsb r0, [r0, #0x99]
	cmp r0, #0
	blt _0230F6BC
_0230F694:
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r3, #0
	ldr r2, [r0, #8]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F6BC:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _0230F764
	mov r0, #0
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	add r0, sp, #0x44
	mov r1, r4
	bl GetDungeonMapPos
	cmp r0, #0
	ldreq r0, _02310050 ; =WORLD_MAP_MODE
	moveq r1, #0
	ldreq r0, [r0, #8]
	streqb r1, [r0, #0xc]
	beq _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrsh r0, [r1, #0x30]
	cmp r0, r4
	beq _0230F758
	mov r1, r4
	bl sub_0206A8A0
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	ldrne r0, [r0, #8]
	strneh r4, [r0, #0x30]
	bne _0230FDB0
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r3, #0
	ldr r2, [r0, #8]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F758:
	mov r0, #0
	strb r0, [r1, #0xc]
	b _0230FDB0
_0230F764:
	bl ov11_0230EDDC
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	add r0, r2, #0xf000
	ldrb r1, [r0, #0x9ac]
	cmp r1, #0
	ldreqb r1, [r0, #0xe88]
	cmpeq r1, #0
	beq _0230F7A4
	mov r1, #5
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F7A4:
	ldr r1, [r2, #0x2c]
	cmp r1, #3
	bne _0230F7C4
	ldr r0, [r0, #0x990]
	cmp r0, #0
	movgt r0, #1
	strgtb r0, [r2, #0xc]
	bgt _0230FDB0
_0230F7C4:
	mov r0, #0
	strb r0, [r2, #0xc]
	b _0230FDB0
_0230F7D0:
	add r0, sp, #0x3c
	mov r1, #0x3e8
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230F7F0
	add r0, sp, #0x3c
	bl ov11_0230EDB0
	b _0230F8A8
_0230F7F0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230F860
	bl sub_0206AA40
	add r2, sp, #4
	mvn r1, #0
	bl sub_0206A96C
	mvn r1, #0
	cmp r0, r1
	beq _0230F848
	ldr r1, [sp, #4]
	cmp r1, #0
	blt _0230F848
	ldr r0, [sp, #8]
	mov r1, r1, lsl #8
	mov r0, r0, lsl #8
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	mov r0, #1
	b _0230F84C
_0230F848:
	mov r0, #0
_0230F84C:
	cmp r0, #0
	beq _0230F8A8
	add r0, sp, #0x3c
	bl ov11_0230EDB0
	b _0230F8A8
_0230F860:
	ldrsh r1, [r1, #2]
	ldr r0, _02310054 ; =0x0000010D
	cmp r1, r0
	add r0, sp, #0x3c
	bne _0230F890
	mov r1, #0xc1
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230F8A8
	add r0, sp, #0x3c
	bl ov11_0230EDB0
	b _0230F8A8
_0230F890:
	mov r1, #0xb8
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230F8A8
	add r0, sp, #0x3c
	bl ov11_0230EDB0
_0230F8A8:
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0x500
	ldrsh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0230F900
	mov r0, #0
	strb r0, [r2, #0x530]
	ldr r0, [r1, #8]
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #0x2c]
	ldr r3, [r1, #8]
	cmp r0, #0
	ldreq r0, _02310058 ; =0x00000807
	movne r0, #0x800
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, r3, #0x500
	ldrsb r2, [r0, #0x30]
	add r0, r3, #0x134
	add r0, r0, #0x400
	bl SetAnimDataFields2
_0230F900:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	ldrsb r0, [r2, #4]
	cmp r0, #0
	ble _0230F978
	ldr r0, _0231005C ; =ov11_02323310
	mov r3, #0x150
	ldr r1, [r0, #0x14]
	ldr r0, [r0, #0x10]
	str r1, [sp, #0x38]
	str r0, [sp, #0x34]
	ldrsb r0, [r2, #4]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	cmp r0, #1
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	moveq r1, #0
	movne r1, #0x1f8
	str r1, [sp, #0x34]
	ldr r0, [r0, #8]
	add r1, sp, #0x34
	ldrsb r2, [r0, #4]
	add r0, r0, #0x10
	sub r2, r2, #1
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	mul r3, r2, r3
	str r3, [sp, #0x38]
	bl ov11_022F040C
_0230F978:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r4, [r2, #8]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0230FB38
	ldrsb r1, [r4, #4]
	ldr r3, _02310060 ; =ov11_023233E8
	mov r0, #0x18
	sub r1, r1, #2
	mla r3, r1, r0, r3
	add r0, r4, #0xf000
	str r3, [r0, #0x994]
	ldr r0, [r2, #8]
	ldr r4, _02310064 ; =ov11_02323374
	ldrsb r3, [r0, #4]
	add r1, r0, #0xf000
	mov r0, #0
	sub r3, r3, #2
	ldrb r3, [r4, r3]
	str r3, [r1, #0x668]
	ldr r1, [r2, #8]
	ldrsb r1, [r1, #4]
	subs r3, r1, #2
	beq _0230F9F4
	mov r2, r0
	b _0230F9EC
_0230F9E0:
	ldrb r1, [r4, r2]
	add r2, r2, #1
	add r0, r0, r1
_0230F9EC:
	cmp r2, r3
	bne _0230F9E0
_0230F9F4:
	mov r7, #0
	ldr r5, _02310068 ; =ov11_02323490
	mov r2, #0x18
	ldr r3, _02310050 ; =WORLD_MAP_MODE
	b _0230FA20
_0230FA08:
	add r1, r7, r0
	mla r4, r1, r2, r5
	add r1, r6, r7, lsl #2
	add r1, r1, #0xf000
	str r4, [r1, #0x980]
	add r7, r7, #1
_0230FA20:
	ldr r6, [r3, #8]
	add r1, r6, #0xf000
	ldr r4, [r1, #0x668]
	cmp r7, r4
	bne _0230FA08
	ldr r0, [r1, #0x994]
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #0x10]
	mov r3, #0
	str r0, [r1, #0x990]
	ldr r4, [r2, #8]
	add r0, r4, #0xf000
	strb r3, [r0, #0x5a0]
	ldr r1, [r2, #8]
	add r4, r4, #0x1a4
	ldrb r0, [r1, #5]
	cmp r0, #0
	ldrneb r0, [r1, #0x6bc]
	cmpne r0, #0
	beq _0230FB24
	add r0, r4, #0xf400
	add r1, r1, #0x6c0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, r4, #0xf400
	mov r1, #0xe
	bl ov11_022F4974
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	add r0, r4, #0xf400
	ldr r1, [r1, #8]
	mov r2, #0
	add r1, r1, #0xf000
	ldr r1, [r1, #0x994]
	ldrsh r1, [r1, #0x14]
	bl SetAnimDataFields2
	mov r5, #0
	mov r4, r5
	ldr r7, _02310050 ; =WORLD_MAP_MODE
	mov r6, #0xc4
	b _0230FB08
_0230FABC:
	mul r8, r5, r6
	ldr r1, [r7, #8]
	add r0, r1, #0x670
	add sb, r0, #0xf000
	add r0, sb, r8
	add r1, r1, #0x6c0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, sb, r8
	rsb r1, r5, #0x20
	bl ov11_022F4974
	ldr r1, [r7, #8]
	mov r2, r4
	add r0, sb, r8
	add r1, r1, r5, lsl #2
	add r1, r1, #0xf000
	ldr r1, [r1, #0x980]
	ldrsh r1, [r1, #0x14]
	bl SetAnimDataFields2
	add r5, r5, #1
_0230FB08:
	ldr r0, [r7, #8]
	add r0, r0, #0xf000
	ldr r1, [r0, #0x668]
	cmp r5, r1
	bne _0230FABC
	mov r1, #1
	strb r1, [r0, #0x5a0]
_0230FB24:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #5]
	b _0230FB44
_0230FB38:
	add r0, r4, #0xf000
	mov r1, #0
	str r1, [r0, #0x990]
_0230FB44:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x2c]
	cmp r0, #4
	beq _0230FB9C
	mov r6, #1
	mov r5, r6
	mov r4, #0
_0230FB64:
	sub r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDungeonMode
	cmp r0, #0
	beq _0230FB90
	mov r0, r6, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r0, r0, asr #0x10
	bl ov11_0230EF48
_0230FB90:
	add r6, r6, #1
	cmp r6, #0xb4
	ble _0230FB64
_0230FB9C:
	mov sb, #0
	mov r6, #1
	ldr r4, _02310050 ; =WORLD_MAP_MODE
	ldr sl, _0231006C ; =0x00000136
	mov r5, sb
	mov r8, r6
	mvn r7, #0
_0230FBB8:
	ldr r2, [r4, #8]
	add r0, r2, sb, lsl #2
	add r0, r0, #0xf000
	ldr r1, [r0, #0x9b0]
	cmp r1, r7
	beq _0230FBF4
	mov r0, sb, lsl #0x10
	mov r2, r8
	mov r0, r0, asr #0x10
	bl ov11_0230EF48
	ldr r0, [r4, #8]
	add r0, r0, sb, lsl #2
	add r0, r0, #0xf000
	str r7, [r0, #0x9b0]
	b _0230FC28
_0230FBF4:
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	beq _0230FC28
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0204CE00
	cmp r0, #0
	beq _0230FC28
	mov r0, sb, lsl #0x10
	mov r1, r6
	mov r2, r5
	mov r0, r0, asr #0x10
	bl ov11_0230EF48
_0230FC28:
	add sb, sb, #1
	cmp sb, sl
	blt _0230FBB8
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x2c]
	cmp r0, #4
	cmpne r0, #3
	beq _0230FC7C
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230FC6C
	bl sub_0206AA40
	mov r1, #1
	mov r2, #0
	bl ov11_0230EF48
	b _0230FC7C
_0230FC6C:
	mov r0, #0xb8
	mov r1, #1
	mov r2, #0
	bl ov11_0230EF48
_0230FC7C:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r4, [r2, #8]
	add r0, r4, #0xf000
	ldrb r0, [r0, #0xe88]
	cmp r0, #0
	beq _0230FCEC
	add r0, r4, #0xfe00
	add r1, r4, #0x500
	ldrsh r3, [r0, #0x8a]
	ldrsh r0, [r1, #0x2c]
	add r4, r4, #0xdc
	cmp r0, r3
	mvnne r0, #0
	strneh r3, [r1, #0x2c]
	cmpne r3, r0
	beq _0230FCEC
	ldr r1, [r2, #8]
	add r0, r4, #0xf400
	add r1, r1, #0x1f8
	add r1, r1, #0x400
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, r4, #0xf400
	mov r1, #0xc
	bl ov11_022F4974
	ldr r1, _02310070 ; =0x0000080D
	add r0, r4, #0xf400
	mov r2, #0
	bl SetAnimDataFields2
_0230FCEC:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	mov r0, #0
	ldr r1, [r2, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x9ac]
	ldr r1, [r2, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0xe88]
	ldr r1, [r2, #8]
	ldr r1, [r1, #0x2c]
	cmp r1, #0
	bne _0230FD34
	mov r1, #0x20
	bl LoadScriptVariableValue
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf900
	strh r0, [r1, #0x9c]
_0230FD34:
	bl ov11_0230EDDC
	cmp r0, #0
	beq _0230FD5C
	mov r0, #0x10
	bl ov11_022E9C98
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #6
	ldr r0, [r0, #8]
	str r1, [r0, #8]
	b _0230FDB0
_0230FD5C:
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mvn r0, #0
	ldr r2, [r1, #8]
	ldrsh r1, [r2, #0x30]
	cmp r1, r0
	movne r0, #7
	strne r0, [r2, #8]
	moveq r0, #1
	streq r0, [r2, #8]
	b _0230FDB0
_0230FD84:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #9
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_0230FDA0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
_0230FDB0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r3, [r1, #0x40]
	ldr r2, [r1, #0x44]
	ldr r0, [r1, #0x34]
	str r3, [sp, #0x2c]
	str r2, [sp, #0x30]
	cmp r0, #1
	beq _0230FDE8
	cmp r0, #2
	beq _0230FE78
	cmp r0, #3
	beq _0230FF04
	b _0230FF64
_0230FDE8:
	ldr r2, _0231005C ; =ov11_02323310
	add r0, sp, #0x1c
	ldr r3, [r2, #0x2c]
	ldr r2, [r2, #0x28]
	str r3, [sp, #0x20]
	str r2, [sp, #0x1c]
	ldr r3, [r1, #0x48]
	ldr r2, [r1, #0x40]
	sub r2, r3, r2
	str r2, [sp, #0x1c]
	ldr r3, [r1, #0x4c]
	ldr r2, [r1, #0x44]
	sub r2, r3, r2
	str r2, [sp, #0x20]
	ldr r1, [r1, #0x38]
	bl ClampComponentAbs
	ldr r3, [sp, #0x1c]
	cmp r3, #0
	ldreq r0, [sp, #0x20]
	cmpeq r0, #0
	ldreq r0, _02310050 ; =WORLD_MAP_MODE
	moveq r1, #0
	ldreq r0, [r0, #8]
	streq r1, [r0, #0x34]
	beq _0230FF74
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	ldr r1, [r2, #0x40]
	add r1, r1, r3
	str r1, [r2, #0x40]
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x20]
	ldr r1, [r2, #0x44]
	add r0, r1, r0
	str r0, [r2, #0x44]
	b _0230FF74
_0230FE78:
	ldr r2, _0231005C ; =ov11_02323310
	add r0, sp, #0x14
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #8]
	str r3, [sp, #0x18]
	str r2, [sp, #0x14]
	ldr r3, [r1, #0x48]
	ldr r2, [r1, #0x40]
	sub r2, r3, r2
	str r2, [sp, #0x14]
	ldr r2, [r1, #0x4c]
	ldr r1, [r1, #0x44]
	sub r1, r2, r1
	str r1, [sp, #0x18]
	bl EuclideanNorm__020050B0
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mov r4, r0
	ldr r5, [r1, #8]
	ldr r0, [r5, #0x38]
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fdiv
	bl _ffix
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	str r0, [r5, #0x3c]
	ldr r1, [r1, #8]
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	movle r0, #1
	strle r0, [r1, #0x3c]
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #3
	ldr r0, [r0, #8]
	str r1, [r0, #0x34]
_0230FF04:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r2, [r0, #8]
	add r0, sp, #0xc
	str r1, [sp]
	ldr r3, [r2, #0x3c]
	add r1, r2, #0x40
	add r2, r2, #0x48
	bl sub_0200514C
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [sp, #0xc]
	ldr r3, [r0, #8]
	ldr r1, [sp, #0x10]
	str r2, [r3, #0x40]
	str r1, [r3, #0x44]
	ldr r1, [r3, #0x3c]
	sub r1, r1, #1
	str r1, [r3, #0x3c]
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	movle r0, #0
	strle r0, [r1, #0x34]
	b _0230FF74
_0230FF64:
	ldr r2, [r1, #0x48]
	ldr r0, [r1, #0x4c]
	str r2, [r1, #0x40]
	str r0, [r1, #0x44]
_0230FF74:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r3, [r0, #8]
	ldr r0, [r3, #0x34]
	cmp r0, #0
	mvneq r0, #0
	streqb r0, [r3, #0x50]
	beq _0230FFC4
	ldr r2, [r3, #0x40]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	sub r0, r2, r0
	str r0, [sp, #0x24]
	ldr r2, [r3, #0x44]
	add r0, sp, #0x24
	sub r1, r2, r1
	str r1, [sp, #0x28]
	bl sub_020055C8
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	strb r0, [r1, #0x50]
_0230FFC4:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r4, [r2, #8]
	add r1, r4, #0x500
	ldrsh r0, [r1, #0x2e]
	cmp r0, #0
	ldrnesb r3, [r4, #0x50]
	mvnne r0, #0
	cmpne r3, r0
	ldrnesb r0, [r1, #0x30]
	cmpne r0, r3
	beq _0231002C
	strb r3, [r4, #0x530]
	ldr r0, [r2, #8]
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #0x2c]
	ldr r3, [r1, #8]
	cmp r0, #0
	ldreq r0, _02310058 ; =0x00000807
	movne r0, #0x800
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, r3, #0x500
	ldrsb r2, [r0, #0x30]
	add r0, r3, #0x134
	add r0, r0, #0x400
	bl SetAnimDataFields2
_0231002C:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x34]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r1, #0xc]
	mov r0, #0
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02310050: .word WORLD_MAP_MODE
_02310054: .word 0x0000010D
_02310058: .word 0x00000807
_0231005C: .word ov11_02323310
_02310060: .word ov11_023233E8
_02310064: .word ov11_02323374
_02310068: .word ov11_02323490
_0231006C: .word 0x00000136
_02310070: .word 0x0000080D
	arm_func_end ov11_0230F37C

	arm_func_start ov11_02310074
ov11_02310074: ; 0x02310074
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _0231031C ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	ldr r0, [r2, #8]
	cmp r0, #2
	bne _02310250
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r2, [r1, #8]
	ldr r1, _02310320 ; =ov11_02323730
	ldrsh r5, [r2, #2]
	mov r2, r5
	bl Debug_Print
	bl ov11_0230EC00
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #0
	str r0, [r2, #4]
	ldr r0, [r2, #8]
	cmp r5, r1
	strh r5, [r0, #2]
	bne _02310108
	ldr r0, [r2, #4]
	ldr r1, _02310324 ; =ov11_02323394
	bl ov11_022EBC18
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldmib r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	b _023101EC
_02310108:
	mov r0, #0xc
	smulbb r1, r5, r0
	ldr r3, _02310328 ; =EVENTS
	ldrsh r0, [r3, r1]
	add r4, r3, r1
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _023101A0
_0231012C: ; jump table
	b _02310178 ; case 0
	b _023101A0 ; case 1
	b _023101A0 ; case 2
	b _023101A0 ; case 3
	b _023101A0 ; case 4
	b _023101A0 ; case 5
	b _02310160 ; case 6
	b _02310160 ; case 7
	b _02310160 ; case 8
	b _02310160 ; case 9
	b _02310160 ; case 10
	b _02310178 ; case 11
	b _02310178 ; case 12
_02310160:
	ldr r0, [r2, #4]
	ldr r1, _0231032C ; =ov11_023233B0
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	b _023101B8
_02310178:
	ldr r0, _02310330 ; =ov11_02323310
	ldrsh r3, [r4]
	ldr ip, [r0, #0x1c]
	ldr lr, [r0, #0x18]
	ldr r1, _02310334 ; =ov11_02323750
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_023101A0:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r1, _02310324 ; =ov11_02323394
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_023128C0
_023101B8:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldmib r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r2, _02310338 ; =ov11_02323330
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_023101EC:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	ldrb r1, [r2, #5]
	cmp r1, #0
	beq _02310240
	mov r1, #3
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r2, _0231033C ; =0xA4080000
	add r0, r0, #0x6c0
	mov r1, #0x9a
	bl LoadObjectAnimData
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #8
	ldr r0, [r0, #8]
	add r0, r0, #0x6c0
	bl ov11_022F4974
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x6bc]
_02310240:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #4
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_02310250:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	add r0, r1, #0xf000
	ldrb r0, [r0, #0xe8c]
	cmp r0, #0
	beq _02310314
	add r0, r1, #0xf900
	ldrsb r0, [r0, #0x98]
	mvn r1, #1
	cmp r0, r1
	beq _023102B0
	bl IsAreaNameBoxActive
	cmp r0, #0
	bne _023102B0
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	add r0, r0, #0xf900
	ldrsb r0, [r0, #0x98]
	bl CloseAreaNameBox
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x998]
_023102B0:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r2, [r0, #8]
	add r0, r2, #0xf900
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	bne _02310314
	add r0, r2, #0xfe00
	ldrsh r3, [r0, #0x8e]
	add r0, r1, #1
	cmp r3, r0
	beq _02310300
	ldr r0, _02310340 ; =ov11_02323340
	mov r1, #0x13
	mov r2, #0
	bl CreateAreaNameBox
	ldr r1, _0231031C ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x998]
_02310300:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0xe8c]
_02310314:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231031C: .word WORLD_MAP_MODE
_02310320: .word ov11_02323730
_02310324: .word ov11_02323394
_02310328: .word EVENTS
_0231032C: .word ov11_023233B0
_02310330: .word ov11_02323310
_02310334: .word ov11_02323750
_02310338: .word ov11_02323330
_0231033C: .word 0xA4080000
_02310340: .word ov11_02323340
	arm_func_end ov11_02310074

	arm_func_start ov11_02310344
ov11_02310344: ; 0x02310344
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	cmp r0, #7
	cmpne r0, #6
	cmpne r0, #0
	cmpne r0, #5
	bne _02310614
	add r1, sp, #0x10
	mov r0, #1
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp, #0x10]
	streq r0, [sp, #0x14]
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r1, [r0, #0x2c]
	cmp r1, #3
	bne _023104A4
	add r1, r0, #0xf000
	ldr r2, [r1, #0x990]
	cmp r2, #0
	ble _023104A4
	ldr r1, [r1, #0x994]
	add r0, r0, #0xf000
	ldr r1, [r1, #0x10]
	sub r1, r1, r2
	subs sb, r1, #0x1e
	ldr r2, [r0, #0x990]
	ldr r1, _02310624 ; =WORLD_MAP_MODE
	sub r2, r2, #1
	str r2, [r0, #0x990]
	ldr r2, [r1, #8]
	movmi sb, #0
	add r0, r2, #0xf000
	ldr r4, [r0, #0x994]
	add r2, r2, #0x1a4
	ldr r3, [r4, #8]
	ldr r5, [r4]
	mul r4, r3, sb
	add r3, r4, r5, lsl #8
	str r3, [sp, #8]
	ldr r3, [r0, #0x994]
	add r0, r2, #0xf400
	ldr r2, [r3, #0xc]
	ldr r4, [r3, #4]
	mul r3, r2, sb
	add r3, r3, r4, lsl #8
	add r1, sp, #8
	mov r2, #0
	str r3, [sp, #0xc]
	bl AnimRelatedFunction__022F6F14
	mov r8, #0
	add r7, sp, #8
	mov r6, r8
	ldr r5, _02310624 ; =WORLD_MAP_MODE
	mov r4, #0xc4
	b _02310490
_02310438:
	ldr r3, [r5, #8]
	mov r1, r7
	add r0, r3, r8, lsl #2
	add r2, r0, #0xf000
	ldr sl, [r2, #0x980]
	add r0, r3, #0x670
	ldr r3, [sl, #8]
	add r0, r0, #0xf000
	mul r3, sb, r3
	ldr sl, [sl]
	mla r0, r8, r4, r0
	add r3, r3, sl, lsl #8
	str r3, [sp, #8]
	ldr sl, [r2, #0x980]
	mov r2, r6
	ldr r3, [sl, #0xc]
	ldr sl, [sl, #4]
	mul r3, sb, r3
	add r3, r3, sl, lsl #8
	str r3, [sp, #0xc]
	bl AnimRelatedFunction__022F6F14
	add r8, r8, #1
_02310490:
	ldr r0, [r5, #8]
	add r1, r0, #0xf000
	ldr r1, [r1, #0x668]
	cmp r8, r1
	bne _02310438
_023104A4:
	ldr r1, [r0, #0x2c]
	mov sb, #0
	cmp r1, #1
	bhi _023104F8
	add r0, r0, #0x500
	ldrsh r0, [r0, #0x2e]
	cmp r0, #0
	beq _023104F8
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r2, sp, #0
	ldr r5, [r0, #8]
	mov r3, sb
	ldr r4, [r5, #0x40]
	ldr r0, [r5, #0x44]
	add r1, r5, #0x500
	str r0, [sp, #4]
	str r4, [sp]
	add r0, r5, #0x134
	ldrsh r1, [r1, #0x2e]
	add r0, r0, #0x400
	bl ov11_022F5C94
_023104F8:
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r0, [r0, #8]
	add r0, r0, #0x500
	ldrsh r1, [r0, #0x2c]
	cmp r1, r2
	beq _02310540
	add r0, sp, #0
	bl GetDungeonMapPos
	cmp r0, #0
	beq _02310540
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r1, sp, #0
	ldr r0, [r0, #8]
	mov r2, #0
	add r0, r0, #0xdc
	add r0, r0, #0xf400
	bl AnimRelatedFunction__022F6F14
_02310540:
	mov sl, #0
	add r8, sp, #0
	mov fp, sl
	ldr r7, _02310624 ; =WORLD_MAP_MODE
	mov r5, #0xc4
	mvn r6, #0
	ldr r4, _02310628 ; =0x00000136
	b _023105BC
_02310560:
	ldr r0, [r7, #8]
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x54]
	cmp r0, #0
	cmpne r0, r6
	beq _023105B8
	mov r1, sl, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl GetDungeonMapPos
	cmp r0, #0
	beq _023105B8
	ldr r0, [r7, #8]
	mov r1, r8
	add r0, r0, #0x384
	add r0, r0, #0x400
	mla r0, sl, r5, r0
	mov r2, fp
	bl AnimRelatedFunction__022F6F14
	add sb, sb, #1
	cmp sb, #0x64
	bgt _023105C4
_023105B8:
	add sl, sl, #1
_023105BC:
	cmp sl, r4
	blt _02310560
_023105C4:
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r1, sp, #0x10
	ldr r0, [r0, #8]
	mov r2, #0
	add r0, r0, #0x10
	bl ov11_022F042C
	cmp r0, #0
	beq _023105F8
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r2, sp, #0x10
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_023105F8:
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #6]
_02310614:
	bl ov11_02312A74
	mov r0, #0
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02310624: .word WORLD_MAP_MODE
_02310628: .word 0x00000136
	arm_func_end ov11_02310344

	arm_func_start ov11_0231062C
ov11_0231062C: ; 0x0231062C
	stmdb sp!, {r3, lr}
	ldr r0, _02310668 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r1, [r1, #6]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02310660
	bl ov11_022EFB70
	ldr r0, _02310668 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #6]
_02310660:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310668: .word WORLD_MAP_MODE
	arm_func_end ov11_0231062C

	arm_func_start ov11_0231066C
ov11_0231066C: ; 0x0231066C
	ldr ip, _02310678 ; =ov11_0230D270
	ldr r0, _0231067C ; =ov11_02323788
	bx ip
	.align 2, 0
_02310678: .word ov11_0230D270
_0231067C: .word ov11_02323788
	arm_func_end ov11_0231066C

	arm_func_start ov11_02310680
ov11_02310680: ; 0x02310680
	ldr ip, _0231068C ; =ov11_0230D17C
	ldr r0, _02310690 ; =ov11_02323788
	bx ip
	.align 2, 0
_0231068C: .word ov11_0230D17C
_02310690: .word ov11_02323788
	arm_func_end ov11_02310680

	arm_func_start ov11_02310694
ov11_02310694: ; 0x02310694
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r0, #0x6f0
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0231072C ; =ov11_02324DF0
	mov r2, #1
	str r0, [r1]
	strb r2, [r0, #0x6ec]
	bl ov11_023107BC
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r0, _0231072C ; =ov11_02324DF0
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0
	strb r2, [r1, #0x6ed]
	ldr r1, [r0]
	ldr r6, _02310730 ; =0xA0080000
	strb r4, [r1, #0x6ee]
	ldr r1, [r0]
	mov r7, #0x9c
	str r2, [r1, #4]
	ldr r0, [r0]
	mov r5, #8
	add r8, r0, #8
_023106F8:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl LoadObjectAnimData
	mov r0, r8
	mov r1, r5
	bl ov11_022F4974
	add r4, r4, #1
	cmp r4, #9
	add r8, r8, #0xc4
	blt _023106F8
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0231072C: .word ov11_02324DF0
_02310730: .word 0xA0080000
	arm_func_end ov11_02310694

	arm_func_start ov11_02310734
ov11_02310734: ; 0x02310734
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	bne _02310760
	ldr r0, _023107B8 ; =ov11_02324DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0x6ee]
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02310760:
	bl ov11_023107BC
	ldr r0, _023107B8 ; =ov11_02324DF0
	mov r2, #8
	ldr r1, [r0]
	mov r5, #0
	str r2, [r1, #4]
	ldr r0, [r0]
	add r4, r0, #8
_02310780:
	mov r0, r4
	bl ov11_022F6EFC
	add r5, r5, #1
	cmp r5, #9
	add r4, r4, #0xc4
	blt _02310780
	ldr r0, _023107B8 ; =ov11_02324DF0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023107B8 ; =ov11_02324DF0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023107B8: .word ov11_02324DF0
	arm_func_end ov11_02310734

	arm_func_start ov11_023107BC
ov11_023107BC: ; 0x023107BC
	stmdb sp!, {r3, lr}
	ldr r1, _02310834 ; =ov11_02324DF0
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1]
	strb r3, [r1, #0x6ec]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02310834 ; =ov11_02324DF0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02310820
	bl ov11_022EBEAC
	ldr r0, _02310834 ; =ov11_02324DF0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02310834 ; =ov11_02324DF0
	mov r1, #0
	str r1, [r0, #4]
_02310820:
	ldr r0, _02310834 ; =ov11_02324DF0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x6ed]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310834: .word ov11_02324DF0
	arm_func_end ov11_023107BC

	arm_func_start ov11_02310838
ov11_02310838: ; 0x02310838
	ldr r0, _02310848 ; =ov11_02324DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0x6ec]
	bx lr
	.align 2, 0
_02310848: .word ov11_02324DF0
	arm_func_end ov11_02310838

	arm_func_start ov11_0231084C
ov11_0231084C: ; 0x0231084C
	bx lr
	arm_func_end ov11_0231084C

	arm_func_start ov11_02310850
ov11_02310850: ; 0x02310850
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02310A48
_0231086C: ; jump table
	b _02310890 ; case 0
	b _023108B8 ; case 1
	b _02310A48 ; case 2
	b _02310A48 ; case 3
	b _02310948 ; case 4
	b _023109A4 ; case 5
	b _023109D0 ; case 6
	b _02310A1C ; case 7
	b _02310A38 ; case 8
_02310890:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310A50 ; =ov11_02324DF0
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x6ec]
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r0, [r0]
	str r1, [r0, #4]
_023108B8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310A50 ; =ov11_02324DF0
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x6ec]
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r2, [r0]
	ldrb r1, [r2, #0x6ee]
	cmp r1, #0
	beq _02310910
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #0x6ec]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02310A48
_02310910:
	ldrb r1, [r2, #0x6ed]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #0x6ec]
	beq _02310A48
	mov r1, #1
	strb r1, [r2, #0x6ec]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x6ed]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _02310A48
_02310948:
	mov r7, #0
	ldr r6, _02310A54 ; =ov11_023237AC
	add r5, r1, #8
	mov r4, r7
_02310958:
	ldrsh r1, [r6, #8]
	mov r0, r5
	mov r2, r4
	bl SetAnimDataFields2
	add r7, r7, #1
	cmp r7, #9
	add r5, r5, #0xc4
	add r6, r6, #0xc
	blt _02310958
	mov r0, #0x10
	bl ov11_022E9C98
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r3, #5
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x6ec]
	b _02310A48
_023109A4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310A50 ; =ov11_02324DF0
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x6ec]
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
_023109D0:
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x6ee]
	cmp r0, #0
	ldreqb r0, [r1, #0x6ed]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #0x6ec]
	beq _02310A48
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x6ec]
	b _02310A48
_02310A1C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
_02310A38:
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x6ec]
_02310A48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02310A50: .word ov11_02324DF0
_02310A54: .word ov11_023237AC
	arm_func_end ov11_02310850

	arm_func_start ov11_02310A58
ov11_02310A58: ; 0x02310A58
	stmdb sp!, {r3, lr}
	ldr r0, _02310AC0 ; =ov11_02324DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1, #0x6ec]
	bl ov11_023107BC
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02310AC0 ; =ov11_02324DF0
	ldr r1, _02310AC4 ; =ov11_0232376C
	str r0, [r2, #4]
	bl ov11_022EBC18
	ldr r0, _02310AC0 ; =ov11_02324DF0
	ldr r1, _02310AC8 ; =ov11_02323818
	ldr r0, [r0, #4]
	ldr r2, _02310ACC ; =ov11_0232382C
	bl ov11_022EDE64
	ldr r0, _02310AC0 ; =ov11_02324DF0
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310AC0: .word ov11_02324DF0
_02310AC4: .word ov11_0232376C
_02310AC8: .word ov11_02323818
_02310ACC: .word ov11_0232382C
	arm_func_end ov11_02310A58

	arm_func_start ov11_02310AD0
ov11_02310AD0: ; 0x02310AD0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r0, _02310B98 ; =ov11_02324DF0
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #6
	cmpne r1, #5
	cmpne r1, #0
	bne _02310B58
	mov r6, #0
	ldr r5, _02310B9C ; =ov11_023237AC
	add r4, r2, #8
	add r8, sp, #0
	mov r7, r6
_02310B08:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	mov ip, r1, lsl #8
	mov r3, r0, lsl #8
	mov r0, r4
	mov r1, r8
	mov r2, r7
	str ip, [sp]
	str r3, [sp, #4]
	bl AnimRelatedFunction__022F6F14
	add r6, r6, #1
	cmp r6, #9
	add r4, r4, #0xc4
	add r5, r5, #0xc
	blt _02310B08
	ldr r0, _02310B98 ; =ov11_02324DF0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	b _02310B8C
_02310B58:
	cmp r1, #3
	bne _02310B8C
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _02310B98 ; =ov11_02324DF0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
_02310B8C:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02310B98: .word ov11_02324DF0
_02310B9C: .word ov11_023237AC
	arm_func_end ov11_02310AD0

	arm_func_start ov11_02310BA0
ov11_02310BA0: ; 0x02310BA0
	stmdb sp!, {r3, lr}
	ldr r0, _02310BD8 ; =ov11_02324DF0
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _02310BD8 ; =ov11_02324DF0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310BD8: .word ov11_02324DF0
	arm_func_end ov11_02310BA0

	arm_func_start ov11_02310BDC
ov11_02310BDC: ; 0x02310BDC
	ldr ip, _02310BE8 ; =ov11_0230DB58
	ldr r0, _02310BEC ; =ov11_02323840
	bx ip
	.align 2, 0
_02310BE8: .word ov11_0230DB58
_02310BEC: .word ov11_02323840
	arm_func_end ov11_02310BDC

	arm_func_start ov11_02310BF0
ov11_02310BF0: ; 0x02310BF0
	ldr ip, _02310BFC ; =ov11_0230DB58
	ldr r0, _02310C00 ; =ov11_02323864
	bx ip
	.align 2, 0
_02310BFC: .word ov11_0230DB58
_02310C00: .word ov11_02323864
	arm_func_end ov11_02310BF0

	arm_func_start ov11_02310C04
ov11_02310C04: ; 0x02310C04
	ldr ip, _02310C10 ; =ov11_0230DB58
	ldr r0, _02310C14 ; =ov11_0232385C
	bx ip
	.align 2, 0
_02310C10: .word ov11_0230DB58
_02310C14: .word ov11_0232385C
	arm_func_end ov11_02310C04

	arm_func_start ov11_02310C18
ov11_02310C18: ; 0x02310C18
	ldr ip, _02310C24 ; =ov11_0230DB58
	ldr r0, _02310C28 ; =ov11_02323894
	bx ip
	.align 2, 0
_02310C24: .word ov11_0230DB58
_02310C28: .word ov11_02323894
	arm_func_end ov11_02310C18

	arm_func_start ov11_02310C2C
ov11_02310C2C: ; 0x02310C2C
	ldr ip, _02310C38 ; =ov11_0230DB58
	ldr r0, _02310C3C ; =ov11_023238B0
	bx ip
	.align 2, 0
_02310C38: .word ov11_0230DB58
_02310C3C: .word ov11_023238B0
	arm_func_end ov11_02310C2C

	arm_func_start ov11_02310C40
ov11_02310C40: ; 0x02310C40
	ldr ip, _02310C4C ; =ov11_0230D270
	ldr r0, _02310C50 ; =ov11_023238DC
	bx ip
	.align 2, 0
_02310C4C: .word ov11_0230D270
_02310C50: .word ov11_023238DC
	arm_func_end ov11_02310C40

	arm_func_start ov11_02310C54
ov11_02310C54: ; 0x02310C54
	stmdb sp!, {r3, lr}
	mov r0, #0x30
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02310CA0 ; =ov11_02324DF8
	mvn r3, #0
	str r0, [r1]
	strh r3, [r0]
	ldr r2, [r1]
	mov r0, #0
	strh r3, [r2, #0x2c]
	ldr r2, [r1]
	strh r3, [r2, #2]
	ldr r1, [r1]
	strh r3, [r1, #0x2e]
	bl ov11_02312844
	bl ov11_02310CD4
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310CA0: .word ov11_02324DF8
	arm_func_end ov11_02310C54

	arm_func_start ov11_02310CA4
ov11_02310CA4: ; 0x02310CA4
	stmdb sp!, {r3, lr}
	bl ov11_02310CD4
	bl ov11_02312894
	ldr r0, _02310CD0 ; =ov11_02324DF8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02310CD0 ; =ov11_02324DF8
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310CD0: .word ov11_02324DF8
	arm_func_end ov11_02310CA4

	arm_func_start ov11_02310CD4
ov11_02310CD4: ; 0x02310CD4
	stmdb sp!, {r3, lr}
	ldr r0, _02310D40 ; =ov11_02324DF8
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	strb r2, [r0, #0xc]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02310D40 ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _02310D40 ; =ov11_02324DF8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02310D40 ; =ov11_02324DF8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310D40: .word ov11_02324DF8
	arm_func_end ov11_02310CD4

	arm_func_start ov11_02310D44
ov11_02310D44: ; 0x02310D44
	ldr r0, _02310D60 ; =ov11_02324DF8
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02310D60: .word ov11_02324DF8
	arm_func_end ov11_02310D44

	arm_func_start ov11_02310D64
ov11_02310D64: ; 0x02310D64
	stmdb sp!, {r3, lr}
	ldr r1, _02310D9C ; =ov11_02324DF8
	ldr r1, [r1, #4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	cmpne r0, #3
	bne _02310D94
	mov r0, r1
	bl ov11_022EE60C
	ldmia sp!, {r3, pc}
_02310D94:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310D9C: .word ov11_02324DF8
	arm_func_end ov11_02310D64

	arm_func_start ov11_02310DA0
ov11_02310DA0: ; 0x02310DA0
	ldr r2, _02310DB8 ; =ov11_02324DF8
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02310DBC ; =ov11_022F03F8
	add r0, r0, #0x10
	bx ip
	.align 2, 0
_02310DB8: .word ov11_02324DF8
_02310DBC: .word ov11_022F03F8
	arm_func_end ov11_02310DA0

	arm_func_start ov11_02310DC0
ov11_02310DC0: ; 0x02310DC0
	ldr r2, _02310DD8 ; =ov11_02324DF8
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02310DDC ; =ov11_022F040C
	add r0, r0, #0x10
	bx ip
	.align 2, 0
_02310DD8: .word ov11_02324DF8
_02310DDC: .word ov11_022F040C
	arm_func_end ov11_02310DC0

	arm_func_start ov11_02310DE0
ov11_02310DE0: ; 0x02310DE0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02310EC0 ; =ov11_02324DF8
	mov r6, r0
	ldr r0, [r2, #4]
	mov r5, r1
	cmp r0, #0
	ldrne r2, [r2]
	mvnne r1, #0
	ldrnesh r4, [r2]
	cmpne r4, r1
	beq _02310EB8
	mov r1, r6
	mov r2, r5
	bl ov11_022EF498
	ldr r1, [r6]
	mov r0, #0xc
	add r1, r1, #0x8000
	str r1, [r6]
	ldr r2, [r6, #4]
	smulbb r1, r4, r0
	add r0, r2, #0x6000
	str r0, [r6, #4]
	ldr r2, [r5]
	ldr r0, _02310EC4 ; =EVENTS
	sub r2, r2, #0x8000
	str r2, [r5]
	ldr r2, [r5, #4]
	ldrsh r0, [r0, r1]
	sub r1, r2, #0x6000
	str r1, [r5, #4]
	cmp r0, #0xa
	bne _02310E90
	ldr r0, [r6]
	add r0, r0, #0x1800
	str r0, [r6]
	ldr r0, [r6, #4]
	add r0, r0, #0x1800
	str r0, [r6, #4]
	ldr r0, [r5]
	sub r0, r0, #0x1800
	str r0, [r5]
	ldr r0, [r5, #4]
	sub r0, r0, #0x1800
	str r0, [r5, #4]
_02310E90:
	ldr r1, [r6]
	ldr r0, [r5]
	cmp r1, r0
	strgt r1, [r5]
	ldr r1, [r6, #4]
	ldr r0, [r5, #4]
	cmp r1, r0
	strgt r1, [r5, #4]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02310EB8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02310EC0: .word ov11_02324DF8
_02310EC4: .word EVENTS
	arm_func_end ov11_02310DE0

	arm_func_start ov11_02310EC8
ov11_02310EC8: ; 0x02310EC8
	ldr r0, _02310EE4 ; =ov11_02324DF8
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02310EE4: .word ov11_02324DF8
	arm_func_end ov11_02310EC8

	arm_func_start ov11_02310EE8
ov11_02310EE8: ; 0x02310EE8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _02310F08
	cmp r0, #1
	beq _02310F24
	cmp r0, #2
	beq _02310F40
	ldmia sp!, {r3, pc}
_02310F08:
	ldr r0, _02310FBC ; =ov11_02324DF8
	mov r2, #1
	ldr r3, [r0]
	strh r1, [r3, #0x2c]
	ldr r0, [r0]
	strb r2, [r0, #0xc]
	ldmia sp!, {r3, pc}
_02310F24:
	ldr r0, _02310FBC ; =ov11_02324DF8
	mov r2, #1
	ldr r3, [r0]
	strh r1, [r3, #0x2e]
	ldr r0, [r0]
	strb r2, [r0, #0xc]
	ldmia sp!, {r3, pc}
_02310F40:
	cmp r1, #1
	beq _02310F5C
	cmp r1, #2
	beq _02310F7C
	cmp r1, #3
	beq _02310F9C
	ldmia sp!, {r3, pc}
_02310F5C:
	ldr r0, _02310FBC ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02310F7C:
	ldr r0, _02310FBC ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02310F9C:
	ldr r0, _02310FBC ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310FBC: .word ov11_02324DF8
	arm_func_end ov11_02310EE8

	arm_func_start ov11_02310FC0
ov11_02310FC0: ; 0x02310FC0
	stmdb sp!, {r3, lr}
	ldr r0, _02311070 ; =ov11_02324DF8
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #1
	cmpne r0, #4
	bne _02311068
	ldrsh r0, [r2, #0x2c]
	mvn ip, #0
	cmp r0, ip
	beq _02311028
	mov r1, #1
	ldr r0, _02311070 ; =ov11_02324DF8
	strb r1, [r2, #0xc]
	ldr r3, [r0]
	mov r2, #2
	ldrsh r1, [r3, #0x2c]
	strh r1, [r3]
	ldr r1, [r0]
	strh ip, [r1, #0x2c]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	ldrsh r0, [r0]
	bl ov11_022F4734
	b _02311068
_02311028:
	ldrsh r0, [r2, #0x2e]
	cmp r0, ip
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _02311068
	mov r1, #1
	strb r1, [r2, #0xc]
	ldr r0, _02311070 ; =ov11_02324DF8
	mov r1, #3
	ldr r3, [r0]
	ldrsh r2, [r3, #0x2e]
	strh r2, [r3, #2]
	ldr r2, [r0]
	strh ip, [r2, #0x2e]
	ldr r0, [r0]
	str r1, [r0, #8]
_02311068:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311070: .word ov11_02324DF8
	arm_func_end ov11_02310FC0

	arm_func_start ov11_02311074
ov11_02311074: ; 0x02311074
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _0231126C ; =ov11_02324DF8
	ldr r2, [r1]
	ldr r0, [r2, #8]
	cmp r0, #2
	bne _0231122C
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r2, [r1]
	ldr r1, _02311270 ; =ov11_02323974
	ldrsh r5, [r2]
	mov r2, r5
	bl Debug_Print
	bl ov11_02310CD4
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0231126C ; =ov11_02324DF8
	mvn r1, #0
	str r0, [r2, #4]
	ldr r0, [r2]
	cmp r5, r1
	strh r5, [r0]
	bne _0231110C
	ldr r0, [r2, #4]
	ldr r1, _02311274 ; =ov11_02323920
	bl ov11_022EBC18
	ldr r0, _0231126C ; =ov11_02324DF8
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0x10
	bl ov11_022EFD5C
	b _0231120C
_0231110C:
	mov r0, #0xc
	smulbb r1, r5, r0
	ldr r3, _02311278 ; =EVENTS
	ldrsh r0, [r3, r1]
	add r4, r3, r1
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _023111BC
_02311130: ; jump table
	b _02311194 ; case 0
	b _023111BC ; case 1
	b _023111BC ; case 2
	b _023111BC ; case 3
	b _023111BC ; case 4
	b _023111BC ; case 5
	b _02311164 ; case 6
	b _02311164 ; case 7
	b _02311164 ; case 8
	b _02311164 ; case 9
	b _02311164 ; case 10
	b _0231117C ; case 11
	b _0231117C ; case 12
_02311164:
	ldr r0, [r2, #4]
	ldr r1, _0231127C ; =ov11_0232393C
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	b _023111D4
_0231117C:
	ldr r0, [r2, #4]
	ldr r1, _02311280 ; =ov11_02323958
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_023128C0
	b _023111D4
_02311194:
	ldr r0, _02311284 ; =ov11_023238CC
	ldrsh r3, [r4]
	ldr ip, [r0, #0xc]
	ldr lr, [r0, #8]
	ldr r1, _02311288 ; =ov11_02323998
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_023111BC:
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r1, _02311274 ; =ov11_02323920
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_023128C0
_023111D4:
	ldr r0, _0231126C ; =ov11_02324DF8
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0x10
	bl ov11_022EFD5C
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r2, _0231128C ; =ov11_023238CC
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_0231120C:
	ldr r0, _0231126C ; =ov11_02324DF8
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0]
	strb r1, [r0, #0xc]
	b _02311264
_0231122C:
	cmp r0, #3
	bne _02311264
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r0, [r1]
	ldrsh r0, [r0, #2]
	bl ov11_0231297C
	ldr r0, _0231126C ; =ov11_02324DF8
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0]
	strb r1, [r0, #0xc]
_02311264:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231126C: .word ov11_02324DF8
_02311270: .word ov11_02323974
_02311274: .word ov11_02323920
_02311278: .word EVENTS
_0231127C: .word ov11_0232393C
_02311280: .word ov11_02323958
_02311284: .word ov11_023238CC
_02311288: .word ov11_02323998
_0231128C: .word ov11_023238CC
	arm_func_end ov11_02311074

	arm_func_start ov11_02311290
ov11_02311290: ; 0x02311290
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02311328 ; =ov11_02324DF8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #4
	bne _02311318
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _02311328 ; =ov11_02324DF8
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x10
	bl ov11_022F042C
	cmp r0, #0
	beq _023112FC
	ldr r0, _02311328 ; =ov11_02324DF8
	add r2, sp, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_023112FC:
	ldr r0, _02311328 ; =ov11_02324DF8
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02311328 ; =ov11_02324DF8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_02311318:
	bl ov11_02312A74
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311328: .word ov11_02324DF8
	arm_func_end ov11_02311290

	arm_func_start ov11_0231132C
ov11_0231132C: ; 0x0231132C
	stmdb sp!, {r3, lr}
	ldr r0, _02311368 ; =ov11_02324DF8
	ldr r1, [r0]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02311360
	bl ov11_022EFB70
	ldr r0, _02311368 ; =ov11_02324DF8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #4]
_02311360:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311368: .word ov11_02324DF8
	arm_func_end ov11_0231132C

	arm_func_start ov11_0231136C
ov11_0231136C: ; 0x0231136C
	ldr ip, _02311378 ; =ov11_0230D270
	ldr r0, _0231137C ; =ov11_023239C4
	bx ip
	.align 2, 0
_02311378: .word ov11_0230D270
_0231137C: .word ov11_023239C4
	arm_func_end ov11_0231136C

	arm_func_start ov11_02311380
ov11_02311380: ; 0x02311380
	stmdb sp!, {r3, lr}
	mov r0, #0x2c
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023113B4 ; =ov11_02324E00
	mov r2, #0
	str r0, [r1]
	strb r2, [r0, #0x28]
	mov r0, r2
	bl ov11_02312844
	bl ov11_023113E8
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023113B4: .word ov11_02324E00
	arm_func_end ov11_02311380

	arm_func_start ov11_023113B8
ov11_023113B8: ; 0x023113B8
	stmdb sp!, {r3, lr}
	bl ov11_023113E8
	bl ov11_02312894
	ldr r0, _023113E4 ; =ov11_02324E00
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023113E4 ; =ov11_02324E00
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023113E4: .word ov11_02324E00
	arm_func_end ov11_023113B8

	arm_func_start ov11_023113E8
ov11_023113E8: ; 0x023113E8
	stmdb sp!, {r3, lr}
	ldr r0, _02311458 ; =ov11_02324E00
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #8]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	mov r1, #5
	bl ov11_022EB0C0
	ldr r0, _02311458 ; =ov11_02324E00
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _02311458 ; =ov11_02324E00
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02311458 ; =ov11_02324E00
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311458: .word ov11_02324E00
	arm_func_end ov11_023113E8

	arm_func_start ov11_0231145C
ov11_0231145C: ; 0x0231145C
	ldr r0, _02311478 ; =ov11_02324E00
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02311478: .word ov11_02324E00
	arm_func_end ov11_0231145C

	arm_func_start ov11_0231147C
ov11_0231147C: ; 0x0231147C
	stmdb sp!, {r3, lr}
	ldr r1, _02311528 ; =ov11_02324E00
	ldr r2, [r1, #4]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0231149C: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _023114B4 ; case 1
	b _023114D0 ; case 2
	b _023114EC ; case 3
	b _02311508 ; case 4
	b _02311518 ; case 5
_023114B4:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023114D0:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023114EC:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r2
	mov r1, #0
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02311508:
	mov r0, r2
	mov r1, #1
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_02311518:
	mov r0, r2
	mov r1, #0
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311528: .word ov11_02324E00
	arm_func_end ov11_0231147C

	arm_func_start ov11_0231152C
ov11_0231152C: ; 0x0231152C
	ldr r0, _02311548 ; =ov11_02324E00
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	bx lr
	.align 2, 0
_02311548: .word ov11_02324E00
	arm_func_end ov11_0231152C

	arm_func_start ov11_0231154C
ov11_0231154C: ; 0x0231154C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _02311564
	cmp r0, #1
	beq _02311580
	ldmia sp!, {r3, pc}
_02311564:
	ldr r0, _0231158C ; =ov11_02324E00
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	strb r2, [r0, #8]
	ldmia sp!, {r3, pc}
_02311580:
	and r0, r1, #0xff
	bl ov11_0231147C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231158C: .word ov11_02324E00
	arm_func_end ov11_0231154C

	arm_func_start ov11_02311590
ov11_02311590: ; 0x02311590
	stmdb sp!, {r3, lr}
	ldr r0, _023115F0 ; =ov11_02324E00
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #1
	cmpne r0, #3
	bne _023115E8
	ldrb r0, [r2, #0x28]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r2, #8]
	beq _023115E8
	ldr r0, _023115F0 ; =ov11_02324E00
	mov r1, #1
	strb r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	bl ov11_022F47BC
_023115E8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023115F0: .word ov11_02324E00
	arm_func_end ov11_02311590

	arm_func_start ov11_023115F4
ov11_023115F4: ; 0x023115F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _0231179C
	mov r0, #1
	strb r0, [r1, #8]
	bl ov11_022F1798
	mov r4, r0
	ldr r1, _023117A8 ; =ov11_02323A58
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	bl ov11_023113E8
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _023117A4 ; =ov11_02324E00
	mvn r1, #0
	str r0, [r2, #4]
	cmp r4, r1
	bne _02311684
	ldr r1, _023117AC ; =ov11_02323A04
	bl ov11_022EBC18
	ldr r0, _023117A4 ; =ov11_02324E00
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _02311780
_02311684:
	bl ov11_022F17B4
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02311730
_02311698: ; jump table
	b _0231170C ; case 0
	b _02311730 ; case 1
	b _02311730 ; case 2
	b _02311730 ; case 3
	b _02311730 ; case 4
	b _02311730 ; case 5
	b _023116CC ; case 6
	b _023116CC ; case 7
	b _023116CC ; case 8
	b _023116CC ; case 9
	b _023116CC ; case 10
	b _023116E8 ; case 11
	b _023116E8 ; case 12
_023116CC:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, _023117B0 ; =ov11_02323A20
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	b _02311750
_023116E8:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, _023117B4 ; =ov11_02323A3C
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
	b _02311750
_0231170C:
	ldr r1, _023117B8 ; =ov11_023239B4
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _023117BC ; =ov11_02323A7C
	mov r2, r4
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_02311730:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, _023117AC ; =ov11_02323A04
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
_02311750:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r0, [r0, #4]
	bl ov11_022F17E8
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov11_022F1EEC
_02311780:
	ldr r0, _023117A4 ; =ov11_02324E00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
_0231179C:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_023117A4: .word ov11_02324E00
_023117A8: .word ov11_02323A58
_023117AC: .word ov11_02323A04
_023117B0: .word ov11_02323A20
_023117B4: .word ov11_02323A3C
_023117B8: .word ov11_023239B4
_023117BC: .word ov11_02323A7C
	arm_func_end ov11_023115F4

	arm_func_start ov11_023117C0
ov11_023117C0: ; 0x023117C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _02311824 ; =ov11_02324E00
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #3
	bne _02311818
	ldr r0, _02311828 ; =ov11_023239B4
	add r1, sp, #0
	ldr r3, [r0, #4]
	ldr r0, [r0]
	str r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r2, #4]
	bl ov11_022F1E90
	ldr r0, _02311824 ; =ov11_02324E00
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02311824 ; =ov11_02324E00
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02311818:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311824: .word ov11_02324E00
_02311828: .word ov11_023239B4
	arm_func_end ov11_023117C0

	arm_func_start ov11_0231182C
ov11_0231182C: ; 0x0231182C
	stmdb sp!, {r3, lr}
	ldr r0, _02311868 ; =ov11_02324E00
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02311860
	bl ov11_022EFB70
	ldr r0, _02311868 ; =ov11_02324E00
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
_02311860:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311868: .word ov11_02324E00
	arm_func_end ov11_0231182C

	arm_func_start ov11_0231186C
ov11_0231186C: ; 0x0231186C
	ldr ip, _02311878 ; =ov11_0230D270
	ldr r0, _0231187C ; =ov11_02323AA8
	bx ip
	.align 2, 0
_02311878: .word ov11_0230D270
_0231187C: .word ov11_02323AA8
	arm_func_end ov11_0231186C

	arm_func_start ov11_02311880
ov11_02311880: ; 0x02311880
	stmdb sp!, {r3, lr}
	mov r0, #0x2c
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023118B4 ; =ov11_02324E08
	mov r2, #0
	str r0, [r1]
	strb r2, [r0, #0x28]
	mov r0, r2
	bl ov11_02312844
	bl ov11_023118E8
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023118B4: .word ov11_02324E08
	arm_func_end ov11_02311880

	arm_func_start ov11_023118B8
ov11_023118B8: ; 0x023118B8
	stmdb sp!, {r3, lr}
	bl ov11_023118E8
	bl ov11_02312894
	ldr r0, _023118E4 ; =ov11_02324E08
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023118E4 ; =ov11_02324E08
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023118E4: .word ov11_02324E08
	arm_func_end ov11_023118B8

	arm_func_start ov11_023118E8
ov11_023118E8: ; 0x023118E8
	stmdb sp!, {r3, lr}
	ldr r0, _02311958 ; =ov11_02324E08
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #8]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	mov r1, #5
	bl ov11_022EB0C0
	ldr r0, _02311958 ; =ov11_02324E08
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _02311958 ; =ov11_02324E08
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02311958 ; =ov11_02324E08
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311958: .word ov11_02324E08
	arm_func_end ov11_023118E8

	arm_func_start ov11_0231195C
ov11_0231195C: ; 0x0231195C
	ldr r0, _02311978 ; =ov11_02324E08
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02311978: .word ov11_02324E08
	arm_func_end ov11_0231195C

	arm_func_start ov11_0231197C
ov11_0231197C: ; 0x0231197C
	stmdb sp!, {r3, lr}
	ldr r1, _02311A28 ; =ov11_02324E08
	ldr r2, [r1, #4]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0231199C: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _023119B4 ; case 1
	b _023119D0 ; case 2
	b _023119EC ; case 3
	b _02311A08 ; case 4
	b _02311A18 ; case 5
_023119B4:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023119D0:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023119EC:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r2
	mov r1, #0
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02311A08:
	mov r0, r2
	mov r1, #1
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_02311A18:
	mov r0, r2
	mov r1, #0
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311A28: .word ov11_02324E08
	arm_func_end ov11_0231197C

	arm_func_start ov11_02311A2C
ov11_02311A2C: ; 0x02311A2C
	ldr r0, _02311A48 ; =ov11_02324E08
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	bx lr
	.align 2, 0
_02311A48: .word ov11_02324E08
	arm_func_end ov11_02311A2C

	arm_func_start ov11_02311A4C
ov11_02311A4C: ; 0x02311A4C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _02311A64
	cmp r0, #1
	beq _02311A80
	ldmia sp!, {r3, pc}
_02311A64:
	ldr r0, _02311A8C ; =ov11_02324E08
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	strb r2, [r0, #8]
	ldmia sp!, {r3, pc}
_02311A80:
	and r0, r1, #0xff
	bl ov11_0231197C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311A8C: .word ov11_02324E08
	arm_func_end ov11_02311A4C

	arm_func_start ov11_02311A90
ov11_02311A90: ; 0x02311A90
	stmdb sp!, {r3, lr}
	ldr r0, _02311AF0 ; =ov11_02324E08
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #1
	cmpne r0, #3
	bne _02311AE8
	ldrb r0, [r2, #0x28]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r2, #8]
	beq _02311AE8
	ldr r0, _02311AF0 ; =ov11_02324E08
	mov r1, #1
	strb r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	bl ov11_022F47BC
_02311AE8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311AF0: .word ov11_02324E08
	arm_func_end ov11_02311A90

	arm_func_start ov11_02311AF4
ov11_02311AF4: ; 0x02311AF4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _02311C9C
	mov r0, #1
	strb r0, [r1, #8]
	bl ov11_022F1798
	mov r4, r0
	ldr r1, _02311CA8 ; =ov11_02323B3C
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	bl ov11_023118E8
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02311CA4 ; =ov11_02324E08
	mvn r1, #0
	str r0, [r2, #4]
	cmp r4, r1
	bne _02311B84
	ldr r1, _02311CAC ; =ov11_02323AE8
	bl ov11_022EBC18
	ldr r0, _02311CA4 ; =ov11_02324E08
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _02311C80
_02311B84:
	bl ov11_022F17B4
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02311C30
_02311B98: ; jump table
	b _02311C0C ; case 0
	b _02311C30 ; case 1
	b _02311C30 ; case 2
	b _02311C30 ; case 3
	b _02311C30 ; case 4
	b _02311C30 ; case 5
	b _02311BCC ; case 6
	b _02311BCC ; case 7
	b _02311BCC ; case 8
	b _02311BCC ; case 9
	b _02311BCC ; case 10
	b _02311BE8 ; case 11
	b _02311BE8 ; case 12
_02311BCC:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, _02311CB0 ; =ov11_02323B04
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	b _02311C50
_02311BE8:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, _02311CB4 ; =ov11_02323B20
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
	b _02311C50
_02311C0C:
	ldr r1, _02311CB8 ; =ov11_02323A98
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _02311CBC ; =ov11_02323B60
	mov r2, r4
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_02311C30:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, _02311CAC ; =ov11_02323AE8
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
_02311C50:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r0, [r0, #4]
	bl ov11_022F17E8
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov11_022F1EEC
_02311C80:
	ldr r0, _02311CA4 ; =ov11_02324E08
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
_02311C9C:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02311CA4: .word ov11_02324E08
_02311CA8: .word ov11_02323B3C
_02311CAC: .word ov11_02323AE8
_02311CB0: .word ov11_02323B04
_02311CB4: .word ov11_02323B20
_02311CB8: .word ov11_02323A98
_02311CBC: .word ov11_02323B60
	arm_func_end ov11_02311AF4

	arm_func_start ov11_02311CC0
ov11_02311CC0: ; 0x02311CC0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _02311D24 ; =ov11_02324E08
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #3
	bne _02311D18
	ldr r0, _02311D28 ; =ov11_02323A98
	add r1, sp, #0
	ldr r3, [r0, #4]
	ldr r0, [r0]
	str r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r2, #4]
	bl ov11_022F1E90
	ldr r0, _02311D24 ; =ov11_02324E08
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02311D24 ; =ov11_02324E08
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02311D18:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311D24: .word ov11_02324E08
_02311D28: .word ov11_02323A98
	arm_func_end ov11_02311CC0

	arm_func_start ov11_02311D2C
ov11_02311D2C: ; 0x02311D2C
	stmdb sp!, {r3, lr}
	ldr r0, _02311D68 ; =ov11_02324E08
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02311D60
	bl ov11_022EFB70
	ldr r0, _02311D68 ; =ov11_02324E08
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
_02311D60:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311D68: .word ov11_02324E08
	arm_func_end ov11_02311D2C

	arm_func_start ov11_02311D6C
ov11_02311D6C: ; 0x02311D6C
	ldr ip, _02311D78 ; =ov11_0230D270
	ldr r0, _02311D7C ; =ov11_02323B98
	bx ip
	.align 2, 0
_02311D78: .word ov11_0230D270
_02311D7C: .word ov11_02323B98
	arm_func_end ov11_02311D6C

	arm_func_start ov11_02311D80
ov11_02311D80: ; 0x02311D80
	stmdb sp!, {r4, lr}
	mov r0, #0x30
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02311E28 ; =ov11_02324E10
	str r0, [r1, #4]
	bl ov11_02311EA4
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r0, _02311E28 ; =ov11_02324E10
	mov r3, #1
	ldr r1, [r0, #4]
	mov r2, #0
	strb r3, [r1, #0xa]
	ldr r1, [r0, #4]
	strb r3, [r1, #0xb]
	ldr r1, [r0, #4]
	strb r2, [r1, #0xc]
	ldr r1, [r0, #4]
	str r3, [r1, #4]
	ldr r0, [r0, #4]
	strb r2, [r0, #8]
	bl ov11_022E8168
	movs r4, r0
	beq _02311E20
	ldr ip, _02311E28 ; =ov11_02324E10
	ldmia r4!, {r0, r1, r2, r3}
	ldr ip, [ip, #4]
	add lr, ip, #0x10
	mov ip, lr
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r0, ip
	mov r1, #0
	bl CreateJobSummary
	ldr r0, _02311E28 ; =ov11_02324E10
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_02311E20:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02311E28: .word ov11_02324E10
	arm_func_end ov11_02311D80

	arm_func_start ov11_02311E2C
ov11_02311E2C: ; 0x02311E2C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _02311E58
	ldr r0, _02311EA0 ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0xc]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02311E58:
	bl ov11_02311EA4
	ldr r0, _02311EA0 ; =ov11_02324E10
	mov r2, #7
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _02311E80
	bl sub_02069904
_02311E80:
	ldr r0, _02311EA0 ; =ov11_02324E10
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02311EA0 ; =ov11_02324E10
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311EA0: .word ov11_02324E10
	arm_func_end ov11_02311E2C

	arm_func_start ov11_02311EA4
ov11_02311EA4: ; 0x02311EA4
	stmdb sp!, {r3, lr}
	ldr r1, _02311F1C ; =ov11_02324E10
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02311F1C ; =ov11_02324E10
	ldr r0, [r0]
	cmp r0, #0
	beq _02311F08
	bl ov11_022EBEAC
	ldr r0, _02311F1C ; =ov11_02324E10
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02311F1C ; =ov11_02324E10
	mov r1, #0
	str r1, [r0]
_02311F08:
	ldr r0, _02311F1C ; =ov11_02324E10
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xb]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311F1C: .word ov11_02324E10
	arm_func_end ov11_02311EA4

	arm_func_start ov11_02311F20
ov11_02311F20: ; 0x02311F20
	ldr r0, _02311F3C ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_02311F3C: .word ov11_02324E10
	arm_func_end ov11_02311F20

	arm_func_start ov11_02311F40
ov11_02311F40: ; 0x02311F40
	bx lr
	arm_func_end ov11_02311F40

	arm_func_start ov11_02311F44
ov11_02311F44: ; 0x02311F44
	stmdb sp!, {r3, lr}
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _023120F4
_02311F60: ; jump table
	b _02311F80 ; case 0
	b _02311FA8 ; case 1
	b _023120F4 ; case 2
	b _023120F4 ; case 3
	b _02312038 ; case 4
	b _02312064 ; case 5
	b _023120A8 ; case 6
	b _023120E4 ; case 7
_02311F80:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _023120FC ; =ov11_02324E10
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02311FA8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _023120FC ; =ov11_02324E10
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0xc]
	cmp r1, #0
	beq _02312000
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _023120FC ; =ov11_02324E10
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #6
	strb r3, [r2, #9]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _023120F4
_02312000:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _023120F4
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0, #4]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _023120F4
_02312038:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _023120FC ; =ov11_02324E10
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02312064:
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _023120F4
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _023120FC ; =ov11_02324E10
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
	b _023120F4
_023120A8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _023120D4
	mov r0, #0
	strb r0, [r1, #8]
	bl sub_02069904
_023120D4:
	ldr r0, _023120FC ; =ov11_02324E10
	mov r1, #7
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_023120E4:
	ldr r0, _023120FC ; =ov11_02324E10
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
_023120F4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023120FC: .word ov11_02324E10
	arm_func_end ov11_02311F44

	arm_func_start ov11_02312100
ov11_02312100: ; 0x02312100
	stmdb sp!, {r3, lr}
	ldr r0, _02312164 ; =ov11_02324E10
	ldr r3, [r0, #4]
	ldr r0, [r3, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0x2f4
	mov r1, #0xf
	strb r2, [r3, #9]
	bl MemAlloc
	ldr r2, _02312164 ; =ov11_02324E10
	ldr r1, _02312168 ; =ov11_02323B7C
	str r0, [r2]
	bl ov11_022EBC18
	ldr r0, _02312164 ; =ov11_02324E10
	ldr r1, _0231216C ; =ov11_02323BBC
	ldr r0, [r0]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _02312164 ; =ov11_02324E10
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312164: .word ov11_02324E10
_02312168: .word ov11_02323B7C
_0231216C: .word ov11_02323BBC
	arm_func_end ov11_02312100

	arm_func_start ov11_02312170
ov11_02312170: ; 0x02312170
	stmdb sp!, {r3, lr}
	ldr r0, _023121FC ; =ov11_02324E10
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #3
	bne _023121C4
	mov r1, #1
	strb r1, [r2, #9]
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #0x10
	bl ov11_022E9C98
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _023121FC ; =ov11_02324E10
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_023121C4:
	ldr r0, _023121FC ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023121E4
	sub r0, r0, #4
	cmp r0, #2
	bhi _023121F4
_023121E4:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _023121F4
	bl sub_020698B8
_023121F4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023121FC: .word ov11_02324E10
	arm_func_end ov11_02312170

	arm_func_start ov11_02312200
ov11_02312200: ; 0x02312200
	stmdb sp!, {r3, lr}
	ldr r0, _0231224C ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	ldr r0, _0231224C ; =ov11_02324E10
	ldr r0, [r0]
	bl ov11_022EFB70
	ldr r0, _0231224C ; =ov11_02324E10
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231224C: .word ov11_02324E10
	arm_func_end ov11_02312200

	arm_func_start ov11_02312250
ov11_02312250: ; 0x02312250
	ldr ip, _0231225C ; =ov11_0230D270
	ldr r0, _02312260 ; =ov11_02323BF8
	bx ip
	.align 2, 0
_0231225C: .word ov11_0230D270
_02312260: .word ov11_02323BF8
	arm_func_end ov11_02312250

	arm_func_start ov11_02312264
ov11_02312264: ; 0x02312264
	stmdb sp!, {r3, lr}
#ifdef JAPAN
	mov r0, #0xf4
#else
	mov r0, #0x1b8
#endif
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0231233C ; =ov11_02324E18
#if defined(EUROPE)
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	bl GetLanguage
	mov r2, r0, lsl #1
	ldr r0, _02312D14 ; =0x0232473C
	ldr ip, _02312D18 ; =0x00000115
	ldr r1, _0231233C ; =ov11_02324E18
	ldrsh r2, [r0, r2]
	ldr r0, [r1, #4]
	rsb r3, ip, #0x114
	strh r2, [r0, #0x2c]
	ldr r2, [r1, #4]
	mov r0, #0
	strh ip, [r2, #0x2c]
	ldr r2, [r1, #4]
#elif defined(JAPAN)
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	mov r0, #0
	mov r1, #0x46
	bl LoadScriptVariableValue
	cmp r0, #1
	ldreq r0, _0231233C ; =ov11_02324E18
	ldreq r1, _023138CC ; =0x00000116
	ldrne r0, _0231233C ; =ov11_02324E18
	ldrne r1, _023138D0_JP ; =0x00000115
	ldr r0, [r0, #4]
	mvn r3, #0
	strh r1, [r0, #0x2c]
	ldr r1, _0231233C ; =ov11_02324E18
	mov r0, #0
	ldr r2, [r1, #4]
#else
	mvn r3, #0
	str r0, [r1, #4]
	strh r3, [r0]
	ldr r0, [r1, #4]
	rsb r2, r3, #0x114
	strh r2, [r0, #0x2c]
	ldr r2, [r1, #4]
	mov r0, #0
#endif
	strh r3, [r2, #2]
	ldr r1, [r1, #4]
	strh r3, [r1, #0x2e]
	bl ov11_02312844
#ifdef EUROPE
	bl GetLanguage
	ldr r1, _0231233C ; =0x02325958
	mov r2, r0, lsl #1
	ldr r0, [r1, #4]
	ldr r1, _02312D1C ; =0x02324728
	add r0, r0, #0x30
	ldrsh r1, [r1, r2]
	ldr r2, _02312340 ; =0xA0080000
#else
	ldr r0, _0231233C ; =ov11_02324E18
	ldr r2, _02312340 ; =0xA0080000
	ldr r0, [r0, #4]
	mov r1, #0xa7
	add r0, r0, #0x30
#endif
	bl LoadObjectAnimData
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #8
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	bl ov11_022F4974
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x30
	bl SetAnimDataFields2
#ifndef JAPAN
#ifdef EUROPE
	bl GetLanguage
	mov r2, r0, lsl #1
#endif
	ldr r0, _0231233C ; =ov11_02324E18
	ldr r1, _02312344 ; =0x00000179
	ldr r0, [r0, #4]
#ifdef EUROPE
	ldrsh r1, [r1, r2]
#endif
	ldr r2, _02312340 ; =0xA0080000
	add r0, r0, #0xf4
	bl LoadObjectAnimData
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #0xa
	ldr r0, [r0, #4]
	add r0, r0, #0xf4
	bl ov11_022F4974
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xf4
	bl SetAnimDataFields2
#endif
	bl ov11_02312398
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231233C: .word ov11_02324E18
#if defined(EUROPE)
_02312D14: .word 0x0232473C
_02312D18: .word 0x00000115
_02312D1C: .word 0x02324728
_02312340: .word 0xA0080000
_02312344: .word 0x02324732
#elif defined(JAPAN)
_023138CC: .word 0x00000116
_023138D0_JP: .word 0x00000115
_02312340: .word 0xA0080000
#else
_02312340: .word 0xA0080000
_02312344: .word 0x00000179
#endif
	arm_func_end ov11_02312264

	arm_func_start ov11_02312348
ov11_02312348: ; 0x02312348
	stmdb sp!, {r3, lr}
	bl ov11_02312398
	bl ov11_02312894
	ldr r0, _02312394 ; =ov11_02324E18
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	bl ov11_022F6EFC
	ldr r0, _02312394 ; =ov11_02324E18
#ifndef JAPAN
	ldr r0, [r0, #4]
	add r0, r0, #0xf4
	bl ov11_022F6EFC
	ldr r0, _02312394 ; =ov11_02324E18
#endif
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02312394 ; =ov11_02324E18
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312394: .word ov11_02324E18
	arm_func_end ov11_02312348

	arm_func_start ov11_02312398
ov11_02312398: ; 0x02312398
	stmdb sp!, {r3, lr}
	ldr r0, _02312414 ; =ov11_02324E18
	mov r3, #0
	ldr r1, [r0, #4]
	mov r2, #1
	strb r3, [r1, #4]
	ldr r1, [r0, #4]
	str r2, [r1, #8]
	ldr r0, [r0, #4]
	strb r2, [r0, #0xc]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	bl ov11_022EAFF8
	mov r0, #1
	ldr r2, _02312418 ; =ov11_02323BE0
	mov r1, r0
	bl ov11_022EB0E4
	ldr r0, _02312414 ; =ov11_02324E18
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _02312414 ; =ov11_02324E18
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02312414 ; =ov11_02324E18
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312414: .word ov11_02324E18
#ifdef JAPAN
_02312418: .word ov11_02323BD8
#else
_02312418: .word ov11_02323BE0
#endif
	arm_func_end ov11_02312398

	arm_func_start ov11_0231241C
ov11_0231241C: ; 0x0231241C
	ldr r0, _02312438 ; =ov11_02324E18
	ldr r1, [r0, #4]
	ldrb r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02312438: .word ov11_02324E18
	arm_func_end ov11_0231241C

	arm_func_start ov11_0231243C
ov11_0231243C: ; 0x0231243C
	cmp r0, #0
	beq _02312450
	cmp r0, #1
	beq _0231246C
	bx lr
_02312450:
	ldr r0, _02312488 ; =ov11_02324E18
	mov r2, #1
	ldr r3, [r0, #4]
	strh r1, [r3, #0x2c]
	ldr r0, [r0, #4]
	strb r2, [r0, #0xc]
	bx lr
_0231246C:
	ldr r0, _02312488 ; =ov11_02324E18
	mov r2, #1
	ldr r3, [r0, #4]
	strh r1, [r3, #0x2e]
	ldr r0, [r0, #4]
	strb r2, [r0, #0xc]
	bx lr
	.align 2, 0
_02312488: .word ov11_02324E18
	arm_func_end ov11_0231243C

	arm_func_start ov11_0231248C
ov11_0231248C: ; 0x0231248C
	stmdb sp!, {r3, lr}
	ldr r0, _0231253C ; =ov11_02324E18
	ldr r2, [r0, #4]
	ldr r0, [r2, #8]
	cmp r0, #1
	cmpne r0, #4
	bne _02312534
	ldrsh r0, [r2, #0x2c]
	mvn ip, #0
	cmp r0, ip
	beq _023124F4
	mov r1, #1
	ldr r0, _0231253C ; =ov11_02324E18
	strb r1, [r2, #0xc]
	ldr r3, [r0, #4]
	mov r2, #2
	ldrsh r1, [r3, #0x2c]
	strh r1, [r3]
	ldr r1, [r0, #4]
	strh ip, [r1, #0x2c]
	ldr r1, [r0, #4]
	str r2, [r1, #8]
	ldr r0, [r0, #4]
	ldrsh r0, [r0]
	bl ov11_022F4734
	b _02312534
_023124F4:
	ldrsh r0, [r2, #0x2e]
	cmp r0, ip
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _02312534
	mov r1, #1
	strb r1, [r2, #0xc]
	ldr r0, _0231253C ; =ov11_02324E18
	mov r1, #3
	ldr r3, [r0, #4]
	ldrsh r2, [r3, #0x2e]
	strh r2, [r3, #2]
	ldr r2, [r0, #4]
	strh ip, [r2, #0x2e]
	ldr r0, [r0, #4]
	str r1, [r0, #8]
_02312534:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231253C: .word ov11_02324E18
	arm_func_end ov11_0231248C

	arm_func_start ov11_02312540
ov11_02312540: ; 0x02312540
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _02312710 ; =ov11_02324E18
	ldr r2, [r1, #4]
	ldr r0, [r2, #8]
	cmp r0, #2
	bne _023126D0
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r2, [r1, #4]
	ldr r1, _02312714 ; =ov11_02323C8C
	ldrsh r5, [r2]
	mov r2, r5
	bl Debug_Print
	bl ov11_02312398
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02312710 ; =ov11_02324E18
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r5, r1
	strh r5, [r0]
	bne _023125D4
	ldr r0, [r2]
	ldr r1, _02312718 ; =ov11_02323C38
	bl ov11_022EBC18
	ldr r0, _02312710 ; =ov11_02324E18
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _02312710 ; =ov11_02324E18
	ldmia r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	b _023126B0
_023125D4:
	mov r0, #0xc
	smulbb r1, r5, r0
	ldr r3, _0231271C ; =EVENTS
	ldrsh r0, [r3, r1]
	add r4, r3, r1
	add r0, r0, #1
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02312664
_023125F8: ; jump table
	b _0231263C ; case 0
	b _02312664 ; case 1
	b _02312664 ; case 2
	b _02312664 ; case 3
	b _02312664 ; case 4
	b _02312664 ; case 5
	b _02312624 ; case 6
	b _02312624 ; case 7
	b _02312624 ; case 8
	b _02312624 ; case 9
	b _02312624 ; case 10
_02312624:
	ldr r0, [r2]
	ldr r1, _02312720 ; =ov11_02323C54
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_022EF53C
	b _0231267C
_0231263C:
	ldr r0, _02312724 ; =ov11_02323BD0
	ldrsh r3, [r4]
#ifdef JAPAN
	ldr ip, [r0, #4]
	ldr lr, [r0]
#else
	ldr ip, [r0, #0x24]
	ldr lr, [r0, #0x20]
#endif
	ldr r1, _02312728 ; =ov11_02323CAC
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_02312664:
	ldr r0, _02312710 ; =ov11_02324E18
	ldr r1, _02312718 ; =ov11_02323C38
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #1
	bl ov11_023128C0
_0231267C:
	ldr r0, _02312710 ; =ov11_02324E18
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _02312710 ; =ov11_02324E18
	ldmia r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	ldr r0, _02312710 ; =ov11_02324E18
	ldr r2, _0231272C ; =ov11_02323BD0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_023126B0:
	ldr r0, _02312710 ; =ov11_02324E18
	mov r3, #4
	ldr r2, [r0, #4]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
	b _02312708
_023126D0:
	cmp r0, #3
	bne _02312708
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #2]
	bl ov11_0231297C
	ldr r0, _02312710 ; =ov11_02324E18
	mov r3, #4
	ldr r2, [r0, #4]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
_02312708:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02312710: .word ov11_02324E18
_02312714: .word ov11_02323C8C
_02312718: .word ov11_02323C38
_0231271C: .word EVENTS
_02312720: .word ov11_02323C54
_02312724: .word ov11_02323BD0
_02312728: .word ov11_02323CAC
#ifdef JAPAN
_0231272C: .word ov11_02323BE0
#else
_0231272C: .word ov11_02323BD0
#endif
	arm_func_end ov11_02312540

	arm_func_start ov11_02312730
ov11_02312730: ; 0x02312730
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _023127F8 ; =ov11_02324E18
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #4
	bne _023127E8
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _023127F8 ; =ov11_02324E18
	ldr r1, _023127FC ; =ov11_02323BE8
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x30
	bl AnimRelatedFunction__022F6F14
	ldr r0, _023127F8 ; =ov11_02324E18
#ifndef JAPAN
	ldr r1, _02312800 ; =ov11_02323BD8
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xf4
	bl AnimRelatedFunction__022F6F14
	ldr r0, _023127F8 ; =ov11_02324E18
#endif
	add r1, sp, #0
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x10
	bl ov11_022F042C
	cmp r0, #0
	beq _023127CC
	ldr r0, _023127F8 ; =ov11_02324E18
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_023127CC:
	ldr r0, _023127F8 ; =ov11_02324E18
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _023127F8 ; =ov11_02324E18
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #4]
_023127E8:
	bl ov11_02312A74
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_023127F8: .word ov11_02324E18
_023127FC: .word ov11_02323BE8
#ifndef JAPAN
_02312800: .word ov11_02323BD8
#endif
	arm_func_end ov11_02312730

	arm_func_start ov11_02312804
ov11_02312804: ; 0x02312804
	stmdb sp!, {r3, lr}
	ldr r0, _02312840 ; =ov11_02324E18
	ldr r1, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	beq _02312838
	bl ov11_022EFB70
	ldr r0, _02312840 ; =ov11_02324E18
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #4]
_02312838:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312840: .word ov11_02324E18
	arm_func_end ov11_02312804

	arm_func_start ov11_02312844
ov11_02312844: ; 0x02312844
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x34
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02312890 ; =ov11_02324E20
	mov ip, #0
	str r0, [r1, #4]
	strb ip, [r0, #4]
	ldr r2, [r1, #4]
	mov r0, r4
	strb ip, [r2, #3]
	ldr r3, [r1, #4]
	sub r2, ip, #1
	strb ip, [r3, #2]
	ldr r1, [r1, #4]
	strh r2, [r1]
	bl ov11_023128C0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02312890: .word ov11_02324E20
	arm_func_end ov11_02312844

	arm_func_start ov11_02312894
ov11_02312894: ; 0x02312894
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov11_023128C0
	ldr r0, _023128BC ; =ov11_02324E20
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _023128BC ; =ov11_02324E20
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023128BC: .word ov11_02324E20
	arm_func_end ov11_02312894

	arm_func_start ov11_023128C0
ov11_023128C0: ; 0x023128C0
	stmdb sp!, {r4, lr}
	ldr r1, _02312974 ; =ov11_02324E20
	mov r3, #0
	ldr r2, [r1, #4]
	mov r4, r0
	strb r3, [r2, #4]
	ldr r0, [r1, #4]
	sub r2, r3, #1
	strb r3, [r0, #3]
	ldr r0, [r1, #4]
	strb r4, [r0, #2]
	ldr r0, [r1, #4]
	strh r2, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _0231291C
	bl ov11_022EBEAC
	ldr r0, _02312974 ; =ov11_02324E20
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02312974 ; =ov11_02324E20
	mov r1, #0
	str r1, [r0]
_0231291C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02312974 ; =ov11_02324E20
	ldr r1, _02312978 ; =ov11_02323CD0
	str r0, [r2]
	bl ov11_022EBC18
	ldr r0, _02312974 ; =ov11_02324E20
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _02312974 ; =ov11_02324E20
	ldmia r0, {r1, r2}
	add r0, r2, #0x18
	bl ov11_022EFD5C
	ldr r0, _02312974 ; =ov11_02324E20
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02312974: .word ov11_02324E20
_02312978: .word ov11_02323CD0
	arm_func_end ov11_023128C0

	arm_func_start ov11_0231297C
ov11_0231297C: ; 0x0231297C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02312A68 ; =ov11_02324E20
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _02312A6C ; =ov11_02323CEC
	ldrb r3, [r0, #2]
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _02312A68 ; =ov11_02324E20
	mov r2, #0
	ldr r0, [r1, #4]
	strb r2, [r0, #4]
	ldr r0, [r1, #4]
	strb r2, [r0, #3]
	ldr r0, [r1, #4]
	strh r4, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	sub r0, r2, #1
	cmp r4, r0
	bne _023129FC
	ldr r0, [r1]
	sub r1, r2, #1
	bl ov11_022EC27C
	ldr r0, _02312A68 ; =ov11_02324E20
	ldmia r0, {r1, r2}
	add r0, r2, #0x18
	bl ov11_022EFD5C
	b _02312A54
_023129FC:
	ldr r5, _02312A70 ; =GROUND_WEATHER_TABLE
	ldr r0, [r1]
	add r1, r5, r4, lsl #2
	ldrsh r1, [r1, #2]
	mov r4, r4, lsl #2
	bl ov11_022EC27C
	ldr r0, _02312A68 ; =ov11_02324E20
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #8]
	ldr r1, [r0, #4]
	str r2, [r1, #0xc]
	ldr r1, [r0, #4]
	str r2, [r1, #0x10]
	ldr r1, [r0, #4]
	str r2, [r1, #0x14]
	ldrsh r1, [r5, r4]
	cmp r1, #1
	bne _02312A54
	ldr r0, [r0]
	mov r1, #2
	bl ov11_022EE620
_02312A54:
	ldr r0, _02312A68 ; =ov11_02324E20
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02312A68: .word ov11_02324E20
_02312A6C: .word ov11_02323CEC
_02312A70: .word GROUND_WEATHER_TABLE
	arm_func_end ov11_0231297C

	arm_func_start ov11_02312A74
ov11_02312A74: ; 0x02312A74
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02312B0C ; =ov11_02324E20
	ldr r1, [r0, #4]
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _02312B04
	ldrsh r1, [r1]
	mvn r0, #0
	cmp r1, r0
	beq _02312AD4
	ldr r0, _02312B10 ; =GROUND_WEATHER_TABLE
	mov r1, r1, lsl #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _02312AD4
	add r0, sp, #0
	bl ov11_022F1E70
	ldr r0, _02312B0C ; =ov11_02324E20
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
	b _02312AE8
_02312AD4:
	ldr r0, _02312B0C ; =ov11_02324E20
	ldr r2, _02312B14 ; =ov11_02323CC8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_02312AE8:
	ldr r0, _02312B0C ; =ov11_02324E20
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _02312B0C ; =ov11_02324E20
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #4]
_02312B04:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312B0C: .word ov11_02324E20
_02312B10: .word GROUND_WEATHER_TABLE
_02312B14: .word ov11_02323CC8
	arm_func_end ov11_02312A74

	arm_func_start ov11_02312B18
ov11_02312B18: ; 0x02312B18
	stmdb sp!, {r3, lr}
	ldr r0, _02312B3C ; =ov11_02324E20
	ldr r1, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	bl ov11_022EFB70
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312B3C: .word ov11_02324E20
	arm_func_end ov11_02312B18

	arm_func_start ov11_02312B40
ov11_02312B40: ; 0x02312B40
	stmdb sp!, {r3, lr}
	ldr r0, _02312BC4 ; =0x00000584
	mov r1, #1
	bl MemAlloc
	ldr r2, _02312BC8 ; =ov11_02324E28
	mov r1, #0
	str r0, [r2, #4]
	str r1, [r0]
	ldr r0, [r2, #4]
	strh r1, [r0, #4]
	ldr r0, [r2, #4]
	strh r1, [r0, #6]
	ldr r0, [r2, #4]
	add r0, r0, #0x500
	strh r1, [r0, #0x78]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x10]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x570]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x571]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x572]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x573]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x574]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x575]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x576]
	bl ov11_02312BF4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312BC4: .word 0x00000584
_02312BC8: .word ov11_02324E28
	arm_func_end ov11_02312B40

	arm_func_start ov11_02312BCC
ov11_02312BCC: ; 0x02312BCC
	stmdb sp!, {r3, lr}
	bl ov11_02312BF4
	ldr r0, _02312BF0 ; =ov11_02324E28
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02312BF0 ; =ov11_02324E28
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312BF0: .word ov11_02324E28
	arm_func_end ov11_02312BCC

	arm_func_start ov11_02312BF4
ov11_02312BF4: ; 0x02312BF4
	stmdb sp!, {r3, lr}
	bl ov11_02313798
	ldr r0, _02312C54 ; =ov11_02324E28
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _02312C24
	bl ov11_023146F8
	ldr r0, _02312C54 ; =ov11_02324E28
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x10]
_02312C24:
	ldr r0, _02312C54 ; =ov11_02324E28
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r1, [r0, #4]
	strh r2, [r1, #6]
	ldr r0, [r0, #4]
	add r0, r0, #0x500
	strh r2, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312C54: .word ov11_02324E28
	arm_func_end ov11_02312BF4

	arm_func_start ov11_02312C58
ov11_02312C58: ; 0x02312C58
	ldr r0, _02312C8C ; =ov11_02324E28
	ldr r1, [r0, #4]
	add r0, r1, #0x500
	ldrsh r0, [r0, #0x78]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02312C8C: .word ov11_02324E28
	arm_func_end ov11_02312C58

	arm_func_start ov11_02312C90
ov11_02312C90: ; 0x02312C90
	ldr r0, _02312CD4 ; =ov11_02324E28
	ldr r1, [r0, #4]
	add r0, r1, #0x500
	ldrsh r0, [r0, #0x78]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	beq _02312CCC
	ldr r0, [r1]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	bxls lr
_02312CCC:
	mov r0, #0
	bx lr
	.align 2, 0
_02312CD4: .word ov11_02324E28
	arm_func_end ov11_02312C90

	arm_func_start ov11_02312CD8
ov11_02312CD8: ; 0x02312CD8
	ldr ip, _02312CFC ; =ov11_02324E28
	ldr r3, [ip, #4]
	add r3, r3, #0x500
	strh r0, [r3, #0x78]
	ldr r0, [ip, #4]
	str r1, [r0, #0x57c]
	ldr r0, [ip, #4]
	str r2, [r0, #0x580]
	bx lr
	.align 2, 0
_02312CFC: .word ov11_02324E28
	arm_func_end ov11_02312CD8

	arm_func_start ov11_02312D00
ov11_02312D00: ; 0x02312D00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _023130A8 ; =ov11_02324E28
	ldr r2, [r1, #4]
	ldr r0, [r2]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r0, #2
	beq _02312D2C
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	b _02312F9C
_02312D2C:
	ldrsh r0, [r2, #4]
	cmp r0, #0x10
	bgt _02312D88
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312D44: ; jump table
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 0
	b _02312DA4 ; case 1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 3
	b _02312E8C ; case 4
	b _02312E8C ; case 5
	b _02312E8C ; case 6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 7
	b _02312E70 ; case 8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 9
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 11
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 12
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 13
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 14
	b _02312E70 ; case 15
	b _02312F24 ; case 16
_02312D88:
	cmp r0, #0x17
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r0, #0x15
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmpne r0, #0x17
	beq _02312E8C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312DA4:
	mov r0, #0x3d40
	mov r1, #1
	bl MemAlloc
	ldr r2, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	str r0, [r2]
	ldr r0, [r2, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xac
	add r0, r0, #0x400
	bl SetAnimDataFields2
	mov r4, #0
	ldr r7, _023130A8 ; =ov11_02324E28
	mov sb, #0x800
	mov r8, r4
	mov r6, #0xc4
_02312E14:
	mul r5, r4, r6
	ldmia r7, {r0, r1}
	add r0, r0, r5
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r7]
	mov r1, sb
	mov r2, r8
	add r0, r0, r5
	bl SetAnimDataFields2
	add r4, r4, #1
	cmp r4, #0x50
	blt _02312E14
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r2, #0
	ldr r3, [r0, #4]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312E70:
	strh r0, [r2, #6]
	ldr r0, [r1, #4]
	mov r2, #0
	strh r2, [r0, #4]
	ldr r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312E8C:
	mov r0, #0x3d40
	mov r1, #1
	bl MemAlloc
	ldr r2, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	str r0, [r2]
	ldr r0, [r2, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	mov r4, #0
	ldr r7, _023130A8 ; =ov11_02324E28
	mov sb, #0x800
	mov r8, r4
	mov r6, #0xc4
_02312EC8:
	mul r5, r4, r6
	ldmia r7, {r0, r1}
	add r0, r0, r5
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r7]
	mov r1, sb
	mov r2, r8
	add r0, r0, r5
	bl SetAnimDataFields2
	add r4, r4, #1
	cmp r4, #0x50
	blt _02312EC8
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r2, #0
	ldr r3, [r0, #4]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312F24:
	mov r0, #0x3d40
	mov r1, #1
	bl MemAlloc
	ldr r2, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	str r0, [r2]
	ldr r0, [r2, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r5, _023130A8 ; =ov11_02324E28
	mov r6, #0
	mov r4, #0xc4
_02312F58:
	ldmia r5, {r0, r1}
	mla r0, r6, r4, r0
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	add r6, r6, #1
	cmp r6, #0x50
	blt _02312F58
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r2, #0
	ldr r3, [r0, #4]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312F9C:
	add r0, r2, #0x500
	ldrsh r0, [r0, #0x78]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	strh r0, [r2, #4]
	ldr r3, [r1, #4]
	mov r2, #0
	ldr r0, [r3, #0x57c]
	str r0, [r3, #8]
	ldr r3, [r1, #4]
	ldr r0, [r3, #0x580]
	str r0, [r3, #0xc]
	ldr r0, [r1, #4]
	add r0, r0, #0x500
	strh r2, [r0, #0x78]
	ldr r1, [r1, #4]
	ldrsh r0, [r1, #4]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _0231309C
_02312FEC: ; jump table
	b _0231309C ; case 0
	b _0231304C ; case 1
	b _0231308C ; case 2
	b _02313070 ; case 3
	b _02313058 ; case 4
	b _02313058 ; case 5
	b _02313058 ; case 6
	b _0231309C ; case 7
	b _02313058 ; case 8
	b _0231309C ; case 9
	b _0231309C ; case 10
	b _0231309C ; case 11
	b _0231309C ; case 12
	b _0231309C ; case 13
	b _0231309C ; case 14
	b _0231304C ; case 15
	b _02313064 ; case 16
	b _0231309C ; case 17
	b _0231309C ; case 18
	b _0231309C ; case 19
	b _0231309C ; case 20
	b _02313058 ; case 21
	b _0231309C ; case 22
	b _02313058 ; case 23
_0231304C:
	mov r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02313058:
	mov r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02313064:
	mov r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02313070:
	bl ov11_023146F8
	bl ov11_02313798
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r1, #0
	ldr r0, [r0, #4]
	strh r1, [r0, #6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231308C:
	add r0, r1, #0x324
	bl ov11_022F6EFC
	bl ov11_02313798
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231309C:
	mov r0, #0
	strh r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023130A8: .word ov11_02324E28
	arm_func_end ov11_02312D00

	arm_func_start ov11_023130AC
ov11_023130AC: ; 0x023130AC
#ifdef EUROPE
#define OV11_023130AC_LOAD_OFFSET 0x10
#else
#define OV11_023130AC_LOAD_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	bl GetHero
	mov r5, r0
	bl GetPartner
	ldr r1, _02313464 ; =ov11_02324E28
	mov r4, r0
	ldr ip, [r1, #4]
	ldr r0, [ip]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r0, [ip, #4]
	cmp r0, #0x10
	bgt _02313130
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_023130EC: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _02313150 ; case 1
	ldmia sp!, {r3, r4, r5, pc} ; case 2
	ldmia sp!, {r3, r4, r5, pc} ; case 3
	b _02313404 ; case 4
	b _02313404 ; case 5
	b _023133D4 ; case 6
	ldmia sp!, {r3, r4, r5, pc} ; case 7
	b _023132EC ; case 8
	ldmia sp!, {r3, r4, r5, pc} ; case 9
	ldmia sp!, {r3, r4, r5, pc} ; case 10
	ldmia sp!, {r3, r4, r5, pc} ; case 11
	ldmia sp!, {r3, r4, r5, pc} ; case 12
	ldmia sp!, {r3, r4, r5, pc} ; case 13
	ldmia sp!, {r3, r4, r5, pc} ; case 14
	b _023132A4 ; case 15
	b _02313434 ; case 16
_02313130:
	cmp r0, #0x17
	ldmgtia sp!, {r3, r4, r5, pc}
	cmp r0, #0x15
	ldmltia sp!, {r3, r4, r5, pc}
	beq _02313404
	cmp r0, #0x17
	beq _023133D4
	ldmia sp!, {r3, r4, r5, pc}
_02313150:
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	mov r1, #0xcd + OV11_023130AC_LOAD_OFFSET
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r2, _02313468 ; =0x88080000
	ldr r0, [r0, #4]
	mov r1, #0xa
	add r0, r0, #0x3e8
	bl ov11_022F6FE0
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r2, _0231346C ; =0x08080000
	ldr r0, [r0, #4]
	mov r1, #0xad + OV11_023130AC_LOAD_OFFSET
	add r0, r0, #0xac
	add r0, r0, #0x400
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0x14
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0xd8
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0x19c
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0x260
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x14
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xd8
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x19c
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x260
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r1, [r0, #4]
	strb r3, [r1, #0x570]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x571]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x572]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x573]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x574]
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x575]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x576]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_023132A4:
	mov r3, #0
	strb r3, [ip, #0x570]
	ldr r0, [r1, #4]
	mov r2, #2
	strb r3, [r0, #0x571]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x572]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x573]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x574]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x575]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x576]
	ldr r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_023132EC:
	mov r0, #6
	bl ov11_02314670
	ldr r0, _02313464 ; =ov11_02324E28
	mov r2, #1
	ldr r1, [r0, #4]
	strb r2, [r1, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x57c]
	ldr r1, [r1, #0x580]
	bl ov11_023159CC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r5, #4]
	ldr r0, [r0, #4]
	ldr r2, _02313474 ; =0x8C100000
	add r0, r0, #0x14
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	ldr r2, _02313474 ; =0x8C100000
	add r0, r0, #0xd8
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313478 ; =0x00001013
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x14
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313478 ; =0x00001013
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xd8
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r2, _0231347C ; =0x8C080000
	ldr r0, [r0, #4]
	mov r1, #0xd0 + OV11_023130AC_LOAD_OFFSET
	add r0, r0, #0x324
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313480 ; =0x00000801
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x573]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x574]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_023133D4:
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	mov r1, #0xb6 + OV11_023130AC_LOAD_OFFSET
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_02313404:
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	mov r1, #0xbe + OV11_023130AC_LOAD_OFFSET
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_02313434:
	ldr r1, _02313484 ; =0x00000223
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02313464: .word ov11_02324E28
_02313468: .word 0x88080000
_0231346C: .word 0x08080000
_02313470: .word 0x00000807
_02313474: .word 0x8C100000
_02313478: .word 0x00001013
_0231347C: .word 0x8C080000
_02313480: .word 0x00000801
#ifdef EUROPE
_02313484: .word 0x00000231
#else
_02313484: .word 0x00000223
#endif
	arm_func_end ov11_023130AC

	arm_func_start ov11_02313488
ov11_02313488: ; 0x02313488
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _0231378C ; =ov11_02323D0C
	ldr r1, [r0, #0x1c]
	ldr r0, [r0, #0x18]
	str r1, [sp, #4]
	str r0, [sp]
	bl GetHero
	mov r6, r0
	bl GetPartner
	ldr r1, _02313790 ; =ov11_02324E28
	mov r5, r0
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #6]
	cmp r0, #0x10
	bgt _02313518
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _02313784
_023134D4: ; jump table
	b _02313784 ; case 0
	b _02313534 ; case 1
	b _02313784 ; case 2
	b _02313784 ; case 3
	b _023135DC ; case 4
	b _023135DC ; case 5
	b _023135DC ; case 6
	b _02313784 ; case 7
	b _0231353C ; case 8
	b _02313784 ; case 9
	b _02313784 ; case 10
	b _02313784 ; case 11
	b _02313784 ; case 12
	b _02313784 ; case 13
	b _02313784 ; case 14
	b _02313534 ; case 15
	b _023136AC ; case 16
_02313518:
	cmp r0, #0x17
	bgt _02313784
	cmp r0, #0x15
	blt _02313784
	cmpne r0, #0x17
	beq _023135DC
	b _02313784
_02313534:
	bl SentryUpdateDisplay
	b _02313784
_0231353C:
	bl ov11_0231474C
	cmp r0, #0
	beq _02313784
	mov r0, #0
	bl ov11_0231598C
	ldr r3, [r0, #8]
	mov r2, #0xd800
	add r2, r2, r3, lsl #8
	ldr r4, [r0, #4]
	ldr r1, _02313790 ; =ov11_02324E28
	mov r3, #0x7000
	str r3, [sp]
	str r2, [sp, #4]
	ldr r0, [r1, #4]
	ldrsh r1, [r6, #4]
	add r2, sp, #0
	add r0, r0, #0x14
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _02313790 ; =ov11_02324E28
	mov r1, #0x9000
	str r1, [sp]
	ldr r0, [r0, #4]
	ldrsh r1, [r5, #4]
	add r2, sp, #0
	add r0, r0, #0xd8
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _02313790 ; =ov11_02324E28
	mov r1, #0x14000
	add r2, r1, r4, lsl #8
	ldr r0, [r0, #4]
	mov r1, #0x8000
	str r1, [sp]
	str r2, [sp, #4]
	add r1, sp, #0
	add r0, r0, #0x324
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
	b _02313784
_023135DC:
	bl ov11_02313DC4
	cmp r0, #0
	beq _02313784
	mov sb, #0
	mov r6, #0xc4
	ldr r7, _02313790 ; =ov11_02324E28
	mov r8, sb
	add fp, sp, #0
	mov r4, r6
	mvn r5, #0x4f
_02313604:
	mov r0, sb
	bl ov11_0231598C
	mov sl, r0
	ldrh r0, [sl]
	cmp r0, #0xff
	beq _0231369C
	ldrh r0, [sl, #0x14]
	cmp r0, #8
	bhs _02313648
	ldr r0, [r7]
	ldr r1, [sl, #0xc]
	mla r0, sb, r6, r0
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r2, r8
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
_02313648:
	ldr r0, [sl, #8]
	ldr r3, [sl, #4]
	add r2, r0, #0xd0000
	mov r1, r2, asr #0xb
	mov r0, r3, asr #0xb
	add r1, r2, r1, lsr #20
	add r0, r3, r0, lsr #20
	cmp r5, r1, asr #12
	mov r1, r1, asr #0xc
	mov r2, r0, asr #0xc
	cmplt r1, #0xda
	bge _0231369C
	ldr r0, [r7]
	mov sl, r2, lsl #8
	mla r0, sb, r4, r0
	mov r3, r1, lsl #8
	mov r1, fp
	mov r2, #0
	str sl, [sp]
	str r3, [sp, #4]
	bl AnimRelatedFunction__022F6F14
_0231369C:
	add sb, sb, #1
	cmp sb, #0x50
	blt _02313604
	b _02313784
_023136AC:
	bl ov11_02313DC4
	cmp r0, #0
	beq _02313784
	mov sl, #0
	mov r5, #0xc4
	ldr r6, _02313790 ; =ov11_02324E28
	mov fp, sl
	mov r7, #2
	mov r4, r5
_023136D0:
	mov r0, sl
	bl ov11_023159B0
	mov r8, r0
	ldrh r0, [r8]
	cmp r0, #0xff
	ldrneh r0, [r8, #0x16]
	cmpne r0, #0
	beq _02313778
	cmp r0, #1
	bne _02313740
	mul sb, sl, r5
	ldmia r6, {r0, r1}
	add r0, r0, sb
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r6]
	ldr r1, [r8, #0xc]
	add r0, r0, sb
	bl ov11_022F4974
	ldrh r1, [r8, #0x14]
	ldr r0, [r6]
	mov r2, fp
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	add r0, r0, sb
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	strh r7, [r8, #0x16]
_02313740:
	ldr r0, [r8, #8]
	cmp r0, #0x12000
	bhs _02313778
	ldr r0, [r6]
	ldr r1, [r8, #4]
	mla r0, sl, r4, r0
	sub r1, r1, #0x2000
	str r1, [sp]
	ldr r2, [r8, #8]
	add r1, sp, #0
	sub r3, r2, #0x2000
	mov r2, #0
	str r3, [sp, #4]
	bl AnimRelatedFunction__022F6F14
_02313778:
	add sl, sl, #1
	cmp sl, #0x50
	blt _023136D0
_02313784:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231378C: .word ov11_02323D0C
_02313790: .word ov11_02324E28
	arm_func_end ov11_02313488

	arm_func_start ov11_02313794
ov11_02313794: ; 0x02313794
	bx lr
	arm_func_end ov11_02313794

	arm_func_start ov11_02313798
ov11_02313798: ; 0x02313798
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x570]
	cmp r1, #0
	beq _023137C4
	mov r1, #0
	strb r1, [r2, #0x570]
	ldr r0, [r0, #4]
	add r0, r0, #0x324
	bl ov11_022F6EFC
_023137C4:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x571]
	cmp r1, #0
	beq _023137EC
	mov r1, #0
	strb r1, [r2, #0x571]
	ldr r0, [r0, #4]
	add r0, r0, #0x3e8
	bl ov11_022F7058
_023137EC:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x572]
	cmp r1, #0
	beq _02313818
	mov r1, #0
	strb r1, [r2, #0x572]
	ldr r0, [r0, #4]
	add r0, r0, #0xac
	add r0, r0, #0x400
	bl ov11_022F6EFC
_02313818:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x573]
	cmp r1, #0
	beq _02313840
	mov r1, #0
	strb r1, [r2, #0x573]
	ldr r0, [r0, #4]
	add r0, r0, #0x14
	bl ov11_022F6EFC
_02313840:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x574]
	cmp r1, #0
	beq _02313868
	mov r1, #0
	strb r1, [r2, #0x574]
	ldr r0, [r0, #4]
	add r0, r0, #0xd8
	bl ov11_022F6EFC
_02313868:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x575]
	cmp r1, #0
	beq _02313890
	mov r1, #0
	strb r1, [r2, #0x575]
	ldr r0, [r0, #4]
	add r0, r0, #0x19c
	bl ov11_022F6EFC
_02313890:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x576]
	cmp r1, #0
	beq _023138B8
	mov r1, #0
	strb r1, [r2, #0x576]
	ldr r0, [r0, #4]
	add r0, r0, #0x260
	bl ov11_022F6EFC
_023138B8:
	ldr r5, _02313904 ; =ov11_02324E28
	ldr r0, [r5]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	mov r4, #0xc4
_023138D0:
	ldr r0, [r5]
	mla r0, r6, r4, r0
	bl ov11_022F6EFC
	add r6, r6, #1
	cmp r6, #0x50
	blt _023138D0
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02313904 ; =ov11_02324E28
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02313904: .word ov11_02324E28
	arm_func_end ov11_02313798

	arm_func_start ov11_02313908
ov11_02313908: ; 0x02313908
	ldr ip, _02313914 ; =ov11_0230D270
	ldr r0, _02313918 ; =ov11_02323D2C
	bx ip
	.align 2, 0
_02313914: .word ov11_0230D270
_02313918: .word ov11_02323D2C
	arm_func_end ov11_02313908

	arm_func_start ov11_0231391C
ov11_0231391C: ; 0x0231391C
	ldr ip, _02313928 ; =ov11_0230D17C
	ldr r0, _0231392C ; =ov11_02323D2C
	bx ip
	.align 2, 0
_02313928: .word ov11_0230D17C
_0231392C: .word ov11_02323D2C
	arm_func_end ov11_0231391C

	arm_func_start ov11_02313930
ov11_02313930: ; 0x02313930
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023139C4 ; =ov11_02324E30
	str r0, [r1]
	bl ov11_02313A48
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r2, _023139C4 ; =ov11_02324E30
	mov lr, #0
	ldr r0, [r2]
	mov ip, #1
	strb lr, [r0, #8]
	ldr r1, [r2]
	add r0, sp, #0x10
	strb ip, [r1, #0xa]
	ldr r3, [r2]
	add r1, sp, #0xc
	strb lr, [r3, #0xb]
	ldr r3, [r2]
	add r2, sp, #8
	str ip, [r3, #4]
	bl ov11_022EBAA0
	ldr r1, [sp, #0xc]
	mov r0, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r1, _023139C8 ; =0x06210000
	str r2, [sp, #4]
	ldr r3, [sp, #0x10]
	add r2, r1, #0x8000
	bl ov11_022DC240
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_023139C4: .word ov11_02324E30
_023139C8: .word 0x06210000

	arm_func_start ov11_023139CC
ov11_023139CC: ; 0x023139CC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _023139F8
	ldr r0, _02313A44 ; =ov11_02324E30
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_023139F8:
	bl ov11_02313A48
	ldr r0, _02313A44 ; =ov11_02324E30
	mov r2, #7
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _02313A20
	bl ov11_022DC3FC
_02313A20:
	bl ov11_022DC368
	ldr r0, _02313A44 ; =ov11_02324E30
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02313A44 ; =ov11_02324E30
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313A44: .word ov11_02324E30
	arm_func_end ov11_02313930

	arm_func_start ov11_02313A48
ov11_02313A48: ; 0x02313A48
	stmdb sp!, {r3, lr}
	ldr r1, _02313A94 ; =ov11_02324E30
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02313A94 ; =ov11_02324E30
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313A94: .word ov11_02324E30
	arm_func_end ov11_02313A48

	arm_func_start StatusUpdate
StatusUpdate: ; 0x02313A98
	ldr r0, _02313AB4 ; =ov11_02324E30
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strneb r0, [r1, #0xa]
	moveq r0, #0
	bx lr
	.align 2, 0
_02313AB4: .word ov11_02324E30
	arm_func_end StatusUpdate

	arm_func_start ov11_02313AB8
ov11_02313AB8: ; 0x02313AB8
	ldr r0, _02313AD4 ; =ov11_02324E30
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_02313AD4: .word ov11_02324E30
	arm_func_end ov11_02313AB8

	arm_func_start ov11_02313AD8
ov11_02313AD8: ; 0x02313AD8
	bx lr
	arm_func_end ov11_02313AD8

	arm_func_start HandleTeamStatsGround
HandleTeamStatsGround: ; 0x02313ADC
	stmdb sp!, {r3, lr}
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02313CA4
_02313AF8: ; jump table
	b _02313B18 ; case 0
	b _02313B40 ; case 1
	b _02313CA4 ; case 2
	b _02313CA4 ; case 3
	b _02313BD0 ; case 4
	b _02313BFC ; case 5
	b _02313C58 ; case 6
	b _02313C94 ; case 7
_02313B18:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02313CAC ; =ov11_02324E30
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r0, [r0]
	str r1, [r0, #4]
_02313B40:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02313CAC ; =ov11_02324E30
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r2, [r0]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _02313B98
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	strb r3, [r2, #9]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02313CA4
_02313B98:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _02313CA4
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _02313CA4
_02313BD0:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02313CAC ; =ov11_02324E30
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_02313BFC:
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r1, [r0]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	beq _02313C40
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _02313CA4
_02313C40:
	bl ov11_022DC434
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _02313CA4
_02313C58:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _02313C84
	mov r0, #0
	strb r0, [r1, #8]
	bl ov11_022DC3FC
_02313C84:
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0, #4]
_02313C94:
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
_02313CA4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313CAC: .word ov11_02324E30
	arm_func_end HandleTeamStatsGround

	arm_func_start ov11_02313CB0
ov11_02313CB0: ; 0x02313CB0
	stmdb sp!, {r3, lr}
	ldr r0, _02313D14 ; =ov11_02324E30
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #2
	ldmneia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r2, #9]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _02313CFC
	bl ov11_022DC3A0
	ldr r0, _02313D14 ; =ov11_02324E30
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	bl ov11_02313A48
	b _02313D00
_02313CFC:
	bl ov11_022DC504
_02313D00:
	ldr r0, _02313D14 ; =ov11_02324E30
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313D14: .word ov11_02324E30
	arm_func_end ov11_02313CB0

	arm_func_start ov11_02313D18
ov11_02313D18: ; 0x02313D18
	stmdb sp!, {r3, lr}
	ldr r0, _02313D8C ; =ov11_02324E30
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	bne _02313D54
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _02313D8C ; =ov11_02324E30
	mov r3, #1
	ldr r2, [r0]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
_02313D54:
	ldr r0, _02313D8C ; =ov11_02324E30
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02313D74
	sub r0, r0, #4
	cmp r0, #2
	bhi _02313D84
_02313D74:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _02313D84
	bl ov11_022DC46C
_02313D84:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313D8C: .word ov11_02324E30
	arm_func_end ov11_02313D18

	arm_func_start ov11_02313D90
ov11_02313D90: ; 0x02313D90
	stmdb sp!, {r3, lr}
	ldr r0, _02313DC0 ; =ov11_02324E30
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r0, #0x10
	strb r1, [r2]
	bl ov11_022E9C98
	bl ov11_022DC494
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313DC0: .word ov11_02324E30
	arm_func_end ov11_02313D90

	arm_func_start ov11_02313DC4
ov11_02313DC4: ; 0x02313DC4
	ldr r0, _02313DF0 ; =ov11_02324E34
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02313DF0: .word ov11_02324E34
	arm_func_end ov11_02313DC4

	arm_func_start ov11_02313DF4
ov11_02313DF4: ; 0x02313DF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r7, r1
	mov r5, r2
	bl sub_0201F2E4
	ldr r0, _023145D4 ; =0x00000CB4
	mov r1, #6
	bl MemAlloc
	ldr r4, _023145D8 ; =ov11_02324E34
	mov r6, #0
	str r0, [r4]
	strb r6, [r0, #0xcac]
	ldr r0, [r4]
	mov sb, r6
	str r8, [r0]
	ldr r0, [r4]
	mov r8, #0x28
	str r6, [r0, #4]
	ldr r0, [r4]
	str r6, [r0, #8]
	ldr r0, [r4]
	str r6, [r0, #0xc]
	ldr r0, [r4]
	str r6, [r0, #0x10]
	ldr r0, [r4]
	str r6, [r0, #0x14]
	ldr r0, [r4]
	str r6, [r0, #0x18]
	ldr r0, [r4]
	str r6, [r0, #0x1c]
	ldr r0, [r4]
	str r6, [r0, #0x20]
	ldr r0, [r4]
	str r7, [r0, #0x24]
	ldr r0, [r4]
	str r5, [r0, #0x28]
	mov r5, #0xff
_02313E8C:
	mul r7, r6, r8
	ldr r0, [r4]
	add r0, r0, r7
	strh r5, [r0, #0x2c]
	bl sub_0201F36C
	ldr r1, [r4]
	add r1, r1, r7
	strh r0, [r1, #0x4c]
	ldr r0, [r4]
	add r0, r0, r7
	ldrsh r0, [r0, #0x4c]
	bl sub_0201F324
	ldr r2, [r4]
	mov r1, sb
	add r2, r2, r7
	str r0, [r2, #0x48]
	ldr r0, [r4]
	add r0, r0, r7
	ldrsh r0, [r0, #0x4c]
	bl sub_0201F348
	add r6, r6, #1
	cmp r6, #0x50
	blt _02313E8C
	ldr r4, _023145D8 ; =ov11_02324E34
	ldr r1, [r4]
	ldr r0, [r1]
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _023145CC
_02313F00: ; jump table
	b _023145CC ; case 0
	b _023145CC ; case 1
	b _023145CC ; case 2
	b _02313F50 ; case 3
	b _02314060 ; case 4
	b _0231419C ; case 5
	b _02314210 ; case 6
	b _02314320 ; case 7
	b _02314228 ; case 8
	b _023145CC ; case 9
	b _023145CC ; case 10
	b _023144C0 ; case 11
	b _023144C8 ; case 12
	b _023144D0 ; case 13
	b _023144EC ; case 14
	b _02314548 ; case 15
	b _0231455C ; case 16
	b _0231421C ; case 17
	b _02314570 ; case 18
	b _023145CC ; case 19
_02313F50:
	mov sl, #0
	ldr r8, _023145DC ; =ov11_02323F84
	ldr r7, _023145E0 ; =ov11_02323FD4
	ldr r6, _023145E4 ; =ov11_02323E92
	ldr fp, _023145E8 ; =ov11_02323DEE
	mov r5, #0xc400
	mov sb, sl
_02313F6C:
	ldr r0, _023145EC ; =ov11_02324380
	bl ov11_02314D48
	mov r0, #0x28
	mul r2, sl, r0
	ldr r0, [r4]
	ldr r1, [r8, sl, lsl #2]
	add r0, r0, r2
	str r1, [r0, #0x30]
	mov r0, sl, lsl #1
	ldr r3, [r4]
	ldrh r1, [r6, r0]
	ldr ip, [r7, sl, lsl #2]
	add r0, r3, r2
	str ip, [r0, #0x34]
	ldr r3, [r4]
	add r0, sl, #3
	add r3, r3, r2
	str r1, [r3, #0x38]
	ldr r3, [r4]
	mov r1, r1, lsl #1
	add r3, r3, r2
	strh r0, [r3, #0x2c]
	ldr r3, [r4]
	add r0, sl, sl, lsl #4
	add r3, r3, r2
	strh r5, [r3, #0x3c]
	ldr r3, [r4]
	add sl, sl, #1
	add r3, r3, r2
	strh sb, [r3, #0x40]
	ldr r3, [r4]
	ldrh r1, [fp, r1]
	add r3, r3, r2
	strh r0, [r3, #0x42]
	ldr r0, [r4]
	cmp sl, #0x14
	add r0, r0, r2
	strh r1, [r0, #0x3e]
	ldr r0, [r4]
	add r0, r0, r2
	strh sb, [r0, #0x50]
	blt _02313F6C
	ldr r4, _023145D8 ; =ov11_02324E34
	b _02314024
_0231401C:
	bl ov11_0231474C
	add sb, sb, #1
_02314024:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp sb, r0
	bne _0231401C
	mov r4, #0
	ldr r1, _023145D8 ; =ov11_02324E34
	mov r3, r4
	mov r0, #0x28
_02314044:
	ldr r2, [r1]
	mla r2, r4, r0, r2
	add r4, r4, #1
	strh r3, [r2, #0x40]
	cmp r4, #0x14
	blt _02314044
	b _023145CC
_02314060:
	add r1, sp, #8
	mov r0, #0
	bl ov11_022EB3C8
	mov sl, #0
	ldr r6, _023145F0 ; =ov11_023240E8
	ldr r5, _023145F4 ; =ov11_02324160
	ldr fp, _023145F8 ; =ov11_02323EBC
	mov sb, sl
_02314080:
	ldr r0, _023145EC ; =ov11_02324380
	bl ov11_02314D48
	mov r0, #0x28
	mul r7, sl, r0
	ldr r0, [r4]
	ldr r1, [r6, sl, lsl #2]
	add r0, r0, r7
	str r1, [r0, #0x30]
	ldr r1, [r4]
	mov r0, sl, lsl #1
	ldrh r8, [fp, r0]
	ldr r2, [r5, sl, lsl #2]
	add r1, r1, r7
	str r2, [r1, #0x34]
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, r7
	str r8, [r1, #0x38]
	mov r1, #0xf
	bl _s32_div_f
	ldr r3, [r4]
	ldr r1, _023145FC ; =ov11_02323DD0
	add r3, r3, r7
	strh r0, [r3, #0x2c]
	ldr r0, [r4]
	mov r2, r8, lsl #1
	add r3, r0, r7
	mov r0, #0xbd00
	strh r0, [r3, #0x3c]
	ldr r0, [r4]
	ldrh r1, [r1, r2]
	add r0, r0, r7
	strh sb, [r0, #0x40]
	ldr r0, [r4]
	add r2, sl, sl, lsl #4
	add r0, r0, r7
	strh r2, [r0, #0x42]
	ldr r0, [r4]
	add sl, sl, #1
	add r0, r0, r7
	strh r1, [r0, #0x3e]
	ldr r0, [r4]
	ldr r1, [sp, #8]
	add r0, r0, r7
	strh r1, [r0, #0x50]
	ldr r0, [r4]
	cmp sl, #0x1e
	add r1, r0, r7
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0xc
	strh r0, [r1, #0x4e]
	blt _02314080
	ldr r4, _023145D8 ; =ov11_02324E34
	b _02314160
_02314158:
	bl ov11_0231474C
	add sb, sb, #1
_02314160:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp sb, r0
	bne _02314158
	mov r4, #0
	ldr r1, _023145D8 ; =ov11_02324E34
	mov r3, r4
	mov r0, #0x28
_02314180:
	ldr r2, [r1]
	mla r2, r4, r0, r2
	add r4, r4, #1
	strh r3, [r2, #0x40]
	cmp r4, #0x19
	blt _02314180
	b _023145CC
_0231419C:
	ldr r1, _02314600 ; =ov11_02324B0C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _02314604 ; =ov11_02324B24
	mov r1, #0
	bl sub_0201DF38
	mov r1, r4
	ldr r3, [r1]
	mov r2, #1
	str r0, [r3, #0xcb0]
	ldr r0, [r1]
	ldr r5, _02314608 ; =ov11_023242D8
	mov r6, #0
	strb r2, [r0, #0xcac]
	mov r4, #0x1c
_023141F8:
	mla r0, r6, r4, r5
	bl ov11_02314D48
	add r6, r6, #1
	cmp r6, #6
	blt _023141F8
	b _023145CC
_02314210:
	ldr r0, _0231460C ; =ov11_02323D98
	bl ov11_02314D48
	b _023145CC
_0231421C:
	ldr r0, _02314610 ; =ov11_02323D60
	bl ov11_02314D48
	b _023145CC
_02314228:
	ldr r8, _02314614 ; =ov11_02324700
	ldr r7, _02314618 ; =TRIG_TABLE
	mov sl, #0
	mov fp, #3
	mov r5, #0x28
	mov r6, #0x600
_02314240:
	mov r0, r8
	bl ov11_02314D48
	mul sb, sl, r5
	mov r0, sl
	mov r1, fp
	bl _s32_div_f
	mov r0, sl, asr #2
	add r0, sl, r0, lsr #29
	mov r2, r0, asr #3
	mov r3, sl, lsr #0x1f
	ldr r0, [r4]
	add r2, r2, r2, lsl #1
	add r1, r1, r2
	rsb r2, r3, sl, lsl #30
	add r2, r3, r2, ror #30
	add r0, r0, sb
	strh r1, [r0, #0x2c]
	add r0, r2, #1
	mul r1, r0, r6
	ldr r0, [r4]
	mov r2, sl, lsl #0xb
	add r0, r0, sb
	strh r2, [r0, #0x3c]
	ldr r0, [r4]
	add r1, r1, #0x2400
	add r0, r0, sb
	strh r1, [r0, #0x3e]
	ldr r0, [r4]
	add sl, sl, #1
	add r2, r0, sb
	ldrh r1, [r2, #0x3c]
	ldrh r0, [r2, #0x3e]
	cmp sl, #0x20
	mov r1, r1, asr #4
	mov r1, r1, lsl #1
	mov r0, r0, lsr #9
	mov r3, r1, lsl #1
	ldrsh r3, [r7, r3]
	add r1, r7, r1, lsl #1
	mul ip, r3, r0
	add r3, ip, #0x80000
	str r3, [r2, #0x30]
	ldrsh r2, [r1, #2]
	ldr r1, [r4]
	mul r0, r2, r0
	rsb r2, r0, #0x60000
	add r0, r1, sb
	str r2, [r0, #0x34]
	blt _02314240
	ldr r0, _0231461C ; =ov11_0232471C
	bl ov11_02314D48
	ldr r0, _02314620 ; =ov11_02324738
	bl ov11_02314D48
	ldr r0, _02314624 ; =ov11_02324754
	bl ov11_02314D48
	b _023145CC
_02314320:
	ldr r1, _02314628 ; =ov11_02324B3C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _0231462C ; =ov11_02324B54
	mov r1, #0
	bl sub_0201DF38
	mov r1, r4
	ldr r3, [r1]
	mov r2, #1
	str r0, [r3, #0xcb0]
	ldr r0, [r1]
	mov r6, #0
	strb r2, [r0, #0xcac]
_02314374:
	ldr r0, _02314630 ; =ov11_02323D7C
	bl ov11_02314D48
	mov r0, #0x28
	mul r4, r6, r0
	ldr r1, _023145D8 ; =ov11_02324E34
	ldr r3, _02314634 ; =ov11_02323EFC
	ldr r2, [r1]
	ldr r3, [r3, r6, lsl #2]
	add r2, r2, r4
	ldr r0, _02314638 ; =ov11_02323F40
	str r3, [r2, #0x34]
	ldr r2, [r0, r6, lsl #2]
	ldr r0, [r1]
	add r2, r2, #0x18000
	add r0, r0, r4
	str r2, [r0, #0x30]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, r4
	str r2, [r0, #0x38]
	ldr r3, [r1]
	ldr r5, _0231463C ; =ov11_02323E70
	mov r8, r6, lsl #1
	ldr r0, _02314640 ; =ov11_02323E2C
	ldrh r7, [r5, r8]
	ldr r2, _02314644 ; =ov11_02323E4E
	add r3, r3, r4
	strh r7, [r3, #0x2c]
	ldrh r5, [r2, r8]
	ldr r2, [r1]
	ldrh r0, [r0, r8]
	add r2, r2, r4
	strh r5, [r2, #0x3c]
	ldr r7, [r1]
	mov r1, #0x64
	ldr r2, [r7, #0x24]
	rsb r2, r2, #0x64
	mul r0, r2, r0
	bl _s32_div_f
	mov r1, r5, asr #4
	add r2, r7, r4
	strh r0, [r2, #0x40]
	ldr r5, _023145D8 ; =ov11_02324E34
	mov r3, r1, lsl #1
	ldr r0, [r5]
	ldr r1, _02314618 ; =TRIG_TABLE
	mov r2, #0xf000
	add r0, r0, r4
	strh r2, [r0, #0x3e]
	mov r2, r3, lsl #1
	add r0, r1, r3, lsl #1
	ldrsh r3, [r1, r2]
	ldrsh r1, [r0, #2]
	ldr r2, [r5]
	add r0, r3, r3, lsl #1
	add r1, r1, r1, lsl #1
	mov r8, r0, lsl #0xe
	mov r3, r1, lsl #0xe
	mov r1, r3, asr #0xa
	mov r0, r8, asr #0xa
	add r7, r2, r4
	add r2, r8, r0, lsr #21
	add r3, r3, r1, lsr #21
	ldrh r1, [r7, #0x40]
	mov r0, #0
	b _023144A8
_0231447C:
	ldr r7, [r5]
	add r0, r0, #1
	add r8, r4, r7
	ldr r7, [r8, #0x30]
	sub r7, r7, r2, asr #11
	str r7, [r8, #0x30]
	ldr r7, [r5]
	add r8, r4, r7
	ldr r7, [r8, #0x34]
	add r7, r7, r3, asr #11
	str r7, [r8, #0x34]
_023144A8:
	cmp r0, r1
	bne _0231447C
	add r6, r6, #1
	cmp r6, #0x11
	blt _02314374
	b _023145CC
_023144C0:
	bl ov11_02316330
	b _023145CC
_023144C8:
	bl ov11_02316330
	bl ov11_023163B0
_023144D0:
	ldr r0, _02314648 ; =ov11_02324024
	bl ov11_02314D48
	ldr r0, _0231464C ; =ov11_02324040
	bl ov11_02314D48
	ldr r0, _02314650 ; =ov11_0232405C
	bl ov11_02314D48
	b _023145CC
_023144EC:
	ldr r1, _02314654 ; =ov11_02324B6C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _02314658 ; =ov11_02324B84
	mov r1, #0
	bl sub_0201DF38
	mov r1, r4
	ldr r3, [r1]
	mov r2, #1
	str r0, [r3, #0xcb0]
	ldr r1, [r1]
	ldr r0, _0231465C ; =ov11_02323DB4
	strb r2, [r1, #0xcac]
	bl ov11_02314D48
	b _023145CC
_02314548:
	ldr r0, _02314660 ; =ov11_02324078
	bl ov11_02314D48
	ldr r0, _02314664 ; =ov11_02324094
	bl ov11_02314D48
	b _023145CC
_0231455C:
	ldr r0, _02314668 ; =ov11_023240B0
	bl ov11_02314D48
	ldr r0, _0231466C ; =ov11_023240CC
	bl ov11_02314D48
	b _023145CC
_02314570:
	mov r5, #0
	str r5, [r1, #0xc]
	ldr r0, [r4]
	mov r2, #4
	str r2, [r0, #0x10]
	ldr r0, [r4]
	mov r1, #2
	str r1, [r0, #0x14]
	ldr r0, [r4]
	mov r1, #5
	str r1, [r0, #0x18]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x1c]
	ldr r0, [r4]
	str r2, [r0, #0x20]
	b _023145BC
_023145B4:
	bl ov11_0231474C
	add r5, r5, #1
_023145BC:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp r5, r0
	blt _023145B4
_023145CC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023145D4: .word 0x00000CB4
_023145D8: .word ov11_02324E34
_023145DC: .word ov11_02323F84
_023145E0: .word ov11_02323FD4
_023145E4: .word ov11_02323E92
_023145E8: .word ov11_02323DEE
_023145EC: .word ov11_02324380
_023145F0: .word ov11_023240E8
_023145F4: .word ov11_02324160
_023145F8: .word ov11_02323EBC
_023145FC: .word ov11_02323DD0
_02314600: .word ov11_02324B0C
_02314604: .word ov11_02324B24
_02314608: .word ov11_023242D8
_0231460C: .word ov11_02323D98
_02314610: .word ov11_02323D60
_02314614: .word ov11_02324700
_02314618: .word TRIG_TABLE
_0231461C: .word ov11_0232471C
_02314620: .word ov11_02324738
_02314624: .word ov11_02324754
_02314628: .word ov11_02324B3C
_0231462C: .word ov11_02324B54
_02314630: .word ov11_02323D7C
_02314634: .word ov11_02323EFC
_02314638: .word ov11_02323F40
_0231463C: .word ov11_02323E70
_02314640: .word ov11_02323E2C
_02314644: .word ov11_02323E4E
_02314648: .word ov11_02324024
_0231464C: .word ov11_02324040
_02314650: .word ov11_0232405C
_02314654: .word ov11_02324B6C
_02314658: .word ov11_02324B84
_0231465C: .word ov11_02323DB4
_02314660: .word ov11_02324078
_02314664: .word ov11_02324094
_02314668: .word ov11_023240B0
_0231466C: .word ov11_023240CC
	arm_func_end ov11_02313DF4

	arm_func_start ov11_02314670
ov11_02314670: ; 0x02314670
	ldr ip, _02314680 ; =ov11_02313DF4
	mov r1, #0
	mov r2, r1
	bx ip
	.align 2, 0
_02314680: .word ov11_02313DF4
	arm_func_end ov11_02314670

	arm_func_start ov11_02314684
ov11_02314684: ; 0x02314684
	ldr r0, _023146AC ; =ov11_02324E34
	ldr r0, [r0]
	cmp r0, #0
	beq _023146A4
	ldr r0, [r0]
	cmp r0, #0xb
	moveq r0, #1
	bxeq lr
_023146A4:
	mov r0, #0
	bx lr
	.align 2, 0
_023146AC: .word ov11_02324E34
	arm_func_end ov11_02314684

	arm_func_start ov11_023146B0
ov11_023146B0: ; 0x023146B0
	ldr r0, _023146D0 ; =ov11_02324E34
	ldr r0, [r0]
	ldrb r0, [r0, #0xcac]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023146D0: .word ov11_02324E34
	arm_func_end ov11_023146B0

	arm_func_start ov11_023146D4
ov11_023146D4: ; 0x023146D4
	ldr r2, _023146F0 ; =ov11_02324E34
	ldr ip, _023146F4 ; =ov11_023163B0
	ldr r3, [r2]
	str r0, [r3, #0x24]
	ldr r0, [r2]
	str r1, [r0, #0x28]
	bx ip
	.align 2, 0
_023146F0: .word ov11_02324E34
_023146F4: .word ov11_023163B0
	arm_func_end ov11_023146D4

	arm_func_start ov11_023146F8
ov11_023146F8: ; 0x023146F8
	stmdb sp!, {r3, lr}
	ldr r0, _02314748 ; =ov11_02324E34
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0201F2E4
	ldr r0, _02314748 ; =ov11_02324E34
	ldr r1, [r0]
	ldrb r0, [r1, #0xcac]
	cmp r0, #0
	beq _0231472C
	add r0, r1, #0xcb0
	bl sub_0201E020
_0231472C:
	ldr r0, _02314748 ; =ov11_02324E34
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02314748 ; =ov11_02324E34
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02314748: .word ov11_02324E34
	arm_func_end ov11_023146F8

	arm_func_start ov11_0231474C
ov11_0231474C: ; 0x0231474C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _02314D2C ; =ov11_02324E34
	ldr r0, [r6]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, _02314D30 ; =ov11_02324E38
	mov r4, #0
	mov r5, #0x28
_02314770:
	mul r2, r4, r5
	ldr r3, [r6]
	add r1, r3, r2
	ldrh r0, [r1, #0x2c]
	cmp r0, #0xff
	beq _0231479C
	ldrh r1, [r1, #0x44]
	add r0, r3, #0x2c
	add r0, r0, r2
	ldr r1, [r7, r1, lsl #2]
	blx r1
_0231479C:
	add r4, r4, #1
	cmp r4, #0x50
	blt _02314770
	ldr r0, _02314D2C ; =ov11_02324E34
	ldr r2, [r0]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, #3
	bgt _023147E8
	cmp r0, #1
	blt _02314D24
	beq _023147F4
	cmp r0, #2
	beq _023148CC
	cmp r0, #3
	b _02314D24
_023147E8:
	cmp r0, #0x12
	beq _023149D4
	b _02314D24
_023147F4:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #4]
	add r1, r1, #8
	bl _s32_div_f
	cmp r1, #1
	bne _0231482C
	ldr r0, [r4, #8]
	ldr r2, _02314D34 ; =ov11_02324620
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r1, r1, r0, ror #30
	mov r0, #0x1c
	mla r0, r1, r0, r2
	bl ov11_02314D48
_0231482C:
	ldr r0, _02314D2C ; =ov11_02324E34
	ldr r4, [r0]
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #4]
	add r1, r1, #8
	bl _s32_div_f
	cmp r1, #0
	bne _02314D24
	ldr r1, [r4, #8]
	ldr r0, _02314D2C ; =ov11_02324E34
	add r1, r1, #1
	str r1, [r4, #8]
	ldr r0, [r0]
	ldr r3, _02314D34 ; =ov11_02324620
	ldr r0, [r0, #8]
	mov r2, #0x1c
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	add r1, r0, #4
	mla r0, r1, r2, r3
	bl ov11_02314D48
	ldr r0, _02314D2C ; =ov11_02324E34
	ldr r0, [r0]
	ldr r2, [r0, #8]
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #30
	adds r0, r1, r0, ror #30
	bne _02314D24
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r1, r0, asr #2
	mov r2, r1, lsr #0x1f
	rsb r0, r2, r1, lsl #30
	ldr r3, _02314D38 ; =ov11_02324540
	add r2, r2, r0, ror #30
	mov r0, #0x1c
	mla r0, r2, r0, r3
	bl ov11_02314EF8
	b _02314D24
_023148CC:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #4]
	add r1, r1, #6
	bl _s32_div_f
	cmp r1, #0
	bne _02314D24
	ldr r1, [r4, #8]
	ldr r0, _02314D2C ; =ov11_02324E34
	add r1, r1, #1
	str r1, [r4, #8]
	ldr r0, [r0]
	mov r1, #3
	ldr r4, [r0, #8]
	mov r0, r4
	bl _s32_div_f
	cmp r1, #0
	bne _0231493C
	add r0, r4, r4, lsr #31
	mov r0, r0, asr #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	ldr r2, _02314D38 ; =ov11_02324540
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r2
	mov r1, r4
	bl ov11_02314EF8
_0231493C:
	ldr r0, _02314D2C ; =ov11_02324E34
	mov r1, #3
	ldr r0, [r0]
	ldr r4, [r0, #8]
	mov r0, r4
	bl _s32_div_f
	cmp r1, #0
	bne _02314988
	mov r0, r4
	mov r1, #3
	bl _s32_div_f
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	ldr r2, _02314D3C ; =ov11_02324460
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r2
	bl ov11_02314D48
_02314988:
	ldr r0, _02314D2C ; =ov11_02324E34
	mov r1, #3
	ldr r0, [r0]
	ldr r4, [r0, #8]
	mov r0, r4
	bl _s32_div_f
	cmp r1, #1
	bne _02314D24
	mov r0, r4
	mov r1, #3
	bl _s32_div_f
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	ldr r2, _02314D3C ; =ov11_02324460
	add r1, r1, r0, ror #30
	mov r0, #0x1c
	mla r0, r1, r0, r2
	bl ov11_02314D48
	b _02314D24
_023149D4:
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	add r0, r1, #0xc
	cmp r0, r2
	mov r8, #6
	ble _023149F8
	cmp r1, r2
	bgt _02314D24
	mov r8, #3
_023149F8:
	ldr r0, _02314D40 ; =0x000001BF
	mov r7, #0
	ldr r5, _02314D44 ; =ov11_023247E0
	sub sl, r0, #0xe
	ldr r4, _02314D2C ; =ov11_02324E34
	b _02314D1C
_02314A10:
	cmp r7, #5
	mov r6, #0xff
	addls pc, pc, r7, lsl #2
	b _02314CA0
_02314A20: ; jump table
	b _02314A38 ; case 0
	b _02314A9C ; case 1
	b _02314B04 ; case 2
	b _02314B70 ; case 3
	b _02314BD8 ; case 4
	b _02314C3C ; case 5
_02314A38:
	ldr r2, [r4]
	ldr r0, [r2, #4]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	adds r0, r1, r0, ror #30
	bne _02314CA0
	ldr r0, [r2, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r1, r1, r0, ror #31
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0xc]
	mov r0, #0xb7
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0xc]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0xc]
	b _02314CA0
_02314A9C:
	ldr sb, [r4]
	mov r1, #3
	ldr r0, [sb, #4]
	bl _s32_div_f
	cmp r1, #1
	bne _02314CA0
	ldr r0, [sb, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #2
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x10]
	mov r0, #0x9f
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0x10]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x10]
	b _02314CA0
_02314B04:
	ldr r2, [r4]
	ldr r0, [r2, #4]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	cmp r0, #2
	bne _02314CA0
	ldr r0, [r2, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x14]
	mov r0, #0x92
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0x14]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _02314CA0
_02314B70:
	ldr sb, [r4]
	mov r1, #5
	ldr r0, [sb, #4]
	bl _s32_div_f
	cmp r1, #2
	bne _02314CA0
	ldr r0, [sb, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x14]
	mov r0, #0x9b
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0x18]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x18]
	b _02314CA0
_02314BD8:
	ldr r0, [r4]
	mov r1, #5
	ldr sb, [r0, #8]
	mov r0, sb
	bl _s32_div_f
	cmp r1, #3
	bne _02314CA0
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #6
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x1c]
	mov r1, #0x140
	mul r0, r2, sl
	bl _s32_div_f
	ldr r0, [sb, #0x1c]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x1c]
	b _02314CA0
_02314C3C:
	ldr r0, [r4]
	mov r1, #6
	ldr sb, [r0, #8]
	mov r0, sb
	bl _s32_div_f
	cmp r1, #3
	bne _02314CA0
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #6
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x20]
	ldr r0, _02314D40 ; =0x000001BF
	mov r1, #0x140
	mul r0, r2, r0
	bl _s32_div_f
	ldr r0, [sb, #0x20]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x20]
_02314CA0:
	cmp r6, #0xff
	beq _02314D18
	mov r0, #0x28
	mul r0, r6, r0
	ldr r1, [r4]
	add r1, r1, #0x2c
	strh r6, [r1, r0]
	add r6, r1, r0
	mov r0, fp, lsl #8
	str r0, [r6, #4]
	mov r0, #0x20000
	str r0, [r6, #8]
	ldr r0, [r4]
	ldr r1, [r0, #0x28]
	ldr r2, [r0, #4]
	mov r0, #0x3c00
	mul r0, r2, r0
	mov r1, r1, lsl #5
	bl _s32_div_f
	ldrh r1, [r6, #0x12]
	rsb r0, r0, #0x200
	mul r0, r1, r0
	mov r0, r0, lsl #1
	strh r0, [r6, #0x12]
	mov r0, #0
	strh r0, [r6, #0x16]
	ldr r1, [r4]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
_02314D18:
	add r7, r7, #1
_02314D1C:
	cmp r7, r8
	blt _02314A10
_02314D24:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02314D2C: .word ov11_02324E34
_02314D30: .word ov11_02324E38
_02314D34: .word ov11_02324620
_02314D38: .word ov11_02324540
_02314D3C: .word ov11_02324460
_02314D40: .word 0x000001BF
_02314D44: .word ov11_023247E0
	arm_func_end ov11_0231474C

	arm_func_start ov11_02314D48
ov11_02314D48: ; 0x02314D48
	stmdb sp!, {r4, lr}
	ldr r1, _02314E1C ; =ov11_02324E34
	mov r2, #0
	ldr r4, [r1]
	mov r3, #0x28
	b _02314E0C
_02314D60:
	mul r1, r2, r3
	add lr, r4, r1
	ldrh ip, [lr, #0x2c]
	cmp ip, #0xff
	bne _02314E08
	ldrh ip, [r0]
	ldr r3, _02314E1C ; =ov11_02324E34
	strh ip, [lr, #0x2c]
	ldr ip, [r3]
	ldr lr, [r0, #4]
	add ip, ip, r1
	str lr, [ip, #0x30]
	ldr ip, [r3]
	ldr lr, [r0, #8]
	add ip, ip, r1
	str lr, [ip, #0x34]
	ldr ip, [r3]
	ldr lr, [r0, #0xc]
	add ip, ip, r1
	str lr, [ip, #0x38]
	ldr ip, [r3]
	ldrh lr, [r0, #0x10]
	add ip, ip, r1
	strh lr, [ip, #0x3c]
	ldr ip, [r3]
	ldrh lr, [r0, #0x12]
	add ip, ip, r1
	strh lr, [ip, #0x3e]
	ldr ip, [r3]
	ldrh lr, [r0, #0x14]
	add ip, ip, r1
	strh lr, [ip, #0x40]
	ldr ip, [r3]
	ldrh lr, [r0, #0x16]
	add ip, ip, r1
	strh lr, [ip, #0x42]
	ldrh ip, [r0, #0x18]
	ldr r3, [r3]
	mov r0, r2
	add r1, r3, r1
	strh ip, [r1, #0x44]
	ldmia sp!, {r4, pc}
_02314E08:
	add r2, r2, #1
_02314E0C:
	cmp r2, #0x50
	blt _02314D60
	mov r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02314E1C: .word ov11_02324E34
	arm_func_end ov11_02314D48

	arm_func_start ov11_02314E20
ov11_02314E20: ; 0x02314E20
	stmdb sp!, {r4, lr}
	ldr r1, _02314EF4 ; =ov11_02324E34
	mov r2, #0
	ldr r4, [r1]
	mov r3, #0x28
	b _02314EE4
_02314E38:
	mul r1, r2, r3
	add lr, r4, r1
	ldrh ip, [lr, #0x2c]
	cmp ip, #0xff
	bne _02314EE0
	ldrh ip, [r0]
	ldr r3, _02314EF4 ; =ov11_02324E34
	strh ip, [lr, #0x2c]
	ldr ip, [r3]
	ldr lr, [r0, #4]
	add ip, ip, r1
	str lr, [ip, #0x30]
	ldr ip, [r3]
	ldr lr, [r0, #8]
	add ip, ip, r1
	str lr, [ip, #0x34]
	ldr ip, [r3]
	ldr lr, [r0, #0xc]
	add ip, ip, r1
	str lr, [ip, #0x38]
	ldr ip, [r3]
	ldrh lr, [r0, #0x10]
	add ip, ip, r1
	strh lr, [ip, #0x3c]
	ldr ip, [r3]
	ldrh lr, [r0, #0x12]
	add ip, ip, r1
	strh lr, [ip, #0x3e]
	ldr ip, [r3]
	ldrh lr, [r0, #0x14]
	add ip, ip, r1
	strh lr, [ip, #0x40]
	ldr ip, [r3]
	ldrh lr, [r0, #0x16]
	add ip, ip, r1
	strh lr, [ip, #0x42]
	ldrh ip, [r0, #0x18]
	ldr r3, [r3]
	mov r0, r2
	add r1, r3, r1
	strh ip, [r1, #0x44]
	ldmia sp!, {r4, pc}
_02314EE0:
	add r2, r2, #1
_02314EE4:
	cmp r2, #0x40
	blt _02314E38
	mov r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02314EF4: .word ov11_02324E34
	arm_func_end ov11_02314E20

	arm_func_start ov11_02314EF8
ov11_02314EF8: ; 0x02314EF8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02314FF4 ; =ov11_02324E34
	mov ip, #0
	ldr r5, [r2]
	mov r2, #0x28
	b _02314FE4
_02314F10:
	mul r3, ip, r2
	add r6, r5, r3
	ldrh r4, [r6, #0x2c]
	cmp r4, #0xff
	bne _02314FE0
	ldrh r5, [r0]
	ldr r4, _02314FF4 ; =ov11_02324E34
	and r2, r1, #0x1f
	strh r5, [r6, #0x2c]
	ldr r6, [r0, #4]
	ldr r5, [r4]
	add r6, r6, r2, lsl #12
	add r5, r5, r3
	str r6, [r5, #0x30]
	ldr r5, [r0, #8]
	mov lr, #0x1c00
	mla r6, r2, lr, r5
	ldr r2, [r4]
	mov r5, r1, lsl #0x1c
	add r2, r2, r3
	str r6, [r2, #0x34]
	ldr r6, [r0, #0xc]
	ldr r2, [r4]
	add r6, r6, r1
	and r6, r6, #1
	add r2, r2, r3
	str r6, [r2, #0x38]
	ldrh r6, [r0, #0x10]
	ldr lr, [r4]
	mov r2, r1, lsl #0x1b
	add r5, r6, r5, lsr #21
	add r1, lr, r3
	strh r5, [r1, #0x3c]
	ldrh lr, [r0, #0x12]
	ldr r1, [r4]
	add r2, lr, r2, lsr #21
	add r1, r1, r3
	strh r2, [r1, #0x3e]
	ldr r1, [r4]
	ldrh r2, [r0, #0x14]
	add r1, r1, r3
	strh r2, [r1, #0x40]
	ldr r1, [r4]
	ldrh r2, [r0, #0x16]
	add r1, r1, r3
	strh r2, [r1, #0x42]
	ldrh r2, [r0, #0x18]
	ldr r1, [r4]
	mov r0, ip
	add r1, r1, r3
	strh r2, [r1, #0x44]
	ldmia sp!, {r4, r5, r6, pc}
_02314FE0:
	add ip, ip, #1
_02314FE4:
	cmp ip, #0x50
	bne _02314F10
	mov r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02314FF4: .word ov11_02324E34
	arm_func_end ov11_02314EF8

	arm_func_start ov11_02314FF8
ov11_02314FF8: ; 0x02314FF8
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x10]
	ldr r2, _0231513C ; =TRIG_TABLE
	cmp r1, #0x8000
	sublo r1, r1, #0x90
	addhs r1, r1, #0x90
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	sub r1, r1, #0x18
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0x12]
	cmp r1, #0x18
	movlo r1, #0x30
	strloh r1, [r0, #0x12]
	ldrh r4, [r0, #0x14]
	mov r1, r4, lsl #0x1b
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #4
	mov r1, r1, lsl #2
	ldrsh r3, [r2, r1]
	add r1, r4, #1
	strh r1, [r0, #0x14]
	add r1, r3, r3, lsr #31
	mov r1, r1, asr #1
	cmp r4, #0x200
	mov lr, r1, lsl #0x10
	movhi r1, #0xff
	strhih r1, [r0]
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, pc}
	ldmib r0, {r1, r4}
	mov r3, r1, asr #0xb
	add r3, r1, r3, lsr #20
	mov r5, r3, asr #0xc
	mov ip, r4, asr #0xb
	add r3, r4, ip, lsr #20
	cmp r5, #0x140
	mov r4, r3, asr #0xc
	bgt _023150A0
	mvn r3, #0x3f
	cmp r5, r3
	bge _023150B0
_023150A0:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_023150B0:
	cmp r4, #0x1b8
	bgt _023150C4
	sub r3, r3, #0xc0
	cmp r4, r3
	bge _023150D4
_023150C4:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_023150D4:
	ldrh r3, [r0, #0x10]
	ldrh r5, [r0, #0x12]
	mov r3, r3, asr #4
	mov ip, r3, lsl #1
	mov r3, ip, lsl #1
	ldrsh r4, [r2, r3]
	add r3, ip, #1
	mov ip, r3, lsl #1
	add r3, r4, lr, asr #16
	mul r4, r5, r3
	mov r3, r4, asr #0xb
	add r3, r4, r3, lsr #20
	add r1, r1, r3, asr #12
	str r1, [r0, #4]
	ldrsh r2, [r2, ip]
	ldrh r1, [r0, #0x12]
	ldr ip, [r0, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	mov r1, r1, asr #0xc
	add r1, r1, #0x80
	sub r1, ip, r1
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231513C: .word TRIG_TABLE
	arm_func_end ov11_02314FF8

	arm_func_start ov11_02315140
ov11_02315140: ; 0x02315140
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x12]
	ldr r2, _02315274 ; =TRIG_TABLE
	sub r1, r1, #0x18
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0x12]
	cmp r1, #0x18
	movlo r1, #0x30
	strloh r1, [r0, #0x12]
	ldrh r4, [r0, #0x14]
	mov r1, r4, lsl #0x1b
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #4
	mov r1, r1, lsl #2
	ldrsh r3, [r2, r1]
	add r1, r4, #1
	strh r1, [r0, #0x14]
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, asr #2
	cmp r4, #0x180
	mov lr, r1, lsl #0x10
	movhi r1, #0xff
	strhih r1, [r0]
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, pc}
	ldmib r0, {r1, r4}
	mov r3, r1, asr #0xb
	add r3, r1, r3, lsr #20
	mov r5, r3, asr #0xc
	mov ip, r4, asr #0xb
	add r3, r4, ip, lsr #20
	cmp r5, #0x140
	mov r4, r3, asr #0xc
	bgt _023151D8
	mvn r3, #0x3f
	cmp r5, r3
	bge _023151E8
_023151D8:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_023151E8:
	cmp r4, #0x100
	bgt _023151FC
	sub r3, r3, #0xc0
	cmp r4, r3
	bge _0231520C
_023151FC:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0231520C:
	ldrh r3, [r0, #0x10]
	ldrh r5, [r0, #0x12]
	mov r3, r3, asr #4
	mov ip, r3, lsl #1
	mov r3, ip, lsl #1
	ldrsh r4, [r2, r3]
	add r3, ip, #1
	mov ip, r3, lsl #1
	add r3, r4, lr, asr #16
	mul r4, r5, r3
	mov r3, r4, asr #0xb
	add r3, r4, r3, lsr #20
	add r1, r1, r3, asr #12
	str r1, [r0, #4]
	ldrsh r2, [r2, ip]
	ldrh r1, [r0, #0x12]
	ldr ip, [r0, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	mov r1, r1, asr #0xc
	add r1, r1, #0x80
	sub r1, ip, r1
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02315274: .word TRIG_TABLE
	arm_func_end ov11_02315140

	arm_func_start ov11_02315278
ov11_02315278: ; 0x02315278
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x108
	ldr r3, _023154F8 ; =ov11_023241D8
	add r2, sp, #0x88
	mov r8, r0
	mov r1, #0x40
_02315290:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02315290
	ldr r3, _023154FC ; =ov11_02324258
	add r2, sp, #8
	mov r1, #0x40
_023152AC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023152AC
	ldr r1, [r8, #0xc]
	ldrh r0, [r8, #0x16]
	mov r1, r1, lsr #1
	rsb r1, r1, #0xa
	mov r2, r1, lsl #0x10
	mov r3, r0, lsr #2
	add r1, sp, #0
	mov r0, #0
	mov r4, r2, lsr #0x10
	and r7, r3, #0x3f
	bl ov11_022EB3C8
	ldrsh r3, [r8, #0x24]
	ldr r2, [sp]
	cmp r2, r3
	beq _0231531C
	ldrh r0, [r8]
	cmp r0, #1
	bne _0231531C
	ldr r1, [r8, #4]
	sub r0, r2, r3
	sub r0, r1, r0, lsl #12
	str r0, [r8, #4]
	ldr r0, [sp]
	strh r0, [r8, #0x24]
_0231531C:
	ldrh r2, [r8, #0x14]
	add r0, sp, #0x88
	mov r1, r7, lsl #1
	add r2, r2, #1
	strh r2, [r8, #0x14]
	ldrh r2, [r8, #0x16]
	ldr r6, _02315500 ; =TRIG_TABLE
	add r2, r2, #1
	strh r2, [r8, #0x16]
	ldrh r0, [r0, r1]
	ldmib r8, {r1, lr}
	mov r0, r0, asr #4
	mov r5, r0, lsl #1
	add r3, r5, #1
	ldrh r0, [r8]
	mov r2, r1, asr #0xb
	mov ip, lr, asr #0xb
	mov r5, r5, lsl #1
	add r2, r1, r2, lsr #20
	add ip, lr, ip, lsr #20
	mov r3, r3, lsl #1
	ldrsh r5, [r6, r5]
	cmp r0, #2
	mov r2, r2, asr #0xc
	mov ip, ip, asr #0xc
	ldrsh r6, [r6, r3]
	bhs _0231541C
	cmp r0, #0
	beq _0231539C
	cmp r0, #1
	beq _023153F8
	b _02315440
_0231539C:
	mvn r0, #0x2f
	cmp r2, r0
	addlt r0, r1, #0x154000
	strlt r0, [r8, #4]
	ldrltsh r0, [r8, #0x22]
	movlt r0, r0, lsl #0xc
	strlt r0, [r8, #8]
	mvn r0, #0xdf
	cmp ip, r0
	movlt r0, #0x118000
	strlt r0, [r8, #4]
	ldrltsh r0, [r8, #0x22]
	movlt r0, r0, lsl #0xc
	strlt r0, [r8, #8]
	cmp ip, #0
	ble _02315440
	ldr r0, [r8, #4]
	add r0, r0, #0x100000
	str r0, [r8, #4]
	ldrsh r0, [r8, #0x22]
	mov r0, r0, lsl #0xc
	str r0, [r8, #8]
	b _02315440
_023153F8:
	mvn r0, #0x5f
	cmp r2, r0
	bge _02315440
	add r0, r1, #0x170000
	str r0, [r8, #4]
	ldrsh r0, [r8, #0x22]
	mov r0, r0, lsl #0xc
	str r0, [r8, #8]
	b _02315440
_0231541C:
	mvn r0, #0x2f
	cmp r2, r0
	addlt r0, r1, #0x154000
	strlt r0, [r8, #4]
	mvn r0, #0xdf
	cmp ip, r0
	ldrlt r0, [r8, #8]
	addlt r0, r0, #0x1c0000
	strlt r0, [r8, #8]
_02315440:
	ldrh r0, [r8, #0x10]
	ldr ip, _02315500 ; =TRIG_TABLE
	ldrh r2, [r8, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [ip, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r2, r3, r2
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	ldr r3, [r8, #4]
	ldrsh r1, [ip, r1]
	add r0, r3, r0, asr #12
	str r0, [r8, #4]
	ldrh r0, [r8, #0x12]
	ldr ip, [r8, #8]
	add r2, sp, #8
	mul r3, r1, r0
	mov r0, r3, asr #0xb
	add r0, r3, r0, lsr #20
	sub r0, ip, r0, asr #12
	str r0, [r8, #8]
	mov r0, r7, lsl #1
	mov r1, r4
	ldrh r4, [r2, r0]
	mov r0, #0x1000
	bl _s32_div_f
	mov r1, #0xa
	mul r7, r0, r1
	mul r0, r5, r4
	mov r1, r7
	bl _s32_div_f
	ldr r2, [r8, #4]
	mov r1, r7
	add r2, r2, r0
	mul r0, r6, r4
	str r2, [r8, #4]
	bl _s32_div_f
	ldr r1, [r8, #8]
	sub r0, r1, r0
	str r0, [r8, #8]
	mov r0, #0
	add sp, sp, #0x108
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023154F8: .word ov11_023241D8
_023154FC: .word ov11_02324258
_02315500: .word TRIG_TABLE
	arm_func_end ov11_02315278

	arm_func_start ov11_02315504
ov11_02315504: ; 0x02315504
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, #0
	ldr r1, [r5, #4]
	sub r0, r4, #0x80000
	cmp r1, r0
	bls _02315540
	sub r0, r4, #0x60000
	cmp r1, r0
	movlo r0, #1
	strloh r0, [r5]
	ldrlo r0, [r5, #4]
	addlo r0, r0, #0x180000
	strlo r0, [r5, #4]
_02315540:
	ldrh r0, [r5]
	cmp r0, #0
	ldrh r0, [r5, #0x12]
	moveq r4, #0x20000
	rsbeq r4, r4, #0
	add r0, r0, #0x180
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x12]
	cmp r0, #0x7800
	subhi r0, r0, #0x180
	strhih r0, [r5, #0x12]
	ldrh r0, [r5, #0x12]
	cmp r0, #0x3c00
	bls _023155AC
	mov r0, #0x4000
	ldr r1, [r5, #8]
	rsb r0, r0, #0
	and r0, r1, r0
	str r0, [r5, #8]
	ldrh r0, [r5, #0x14]
	add r0, r0, #1
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x14]
	ldr r1, [r5, #8]
	mov r0, r0, lsl #0x1f
	add r0, r1, r0, lsr #18
	str r0, [r5, #8]
_023155AC:
	ldrh r0, [r5, #0x10]
	ldr ip, _023156B0 ; =TRIG_TABLE
	ldrh r2, [r5, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [ip, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r2, r3, r2
	mov r0, r2, asr #0xb
	ldr r3, [r5, #4]
	add r0, r2, r0, lsr #20
	add r0, r3, r0, asr #12
	str r0, [r5, #4]
	ldrsh r1, [ip, r1]
	ldrh r0, [r5, #0x12]
	ldr r3, [r5, #8]
	mul r2, r1, r0
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	sub r0, r3, r0, asr #12
	str r0, [r5, #8]
	ldrh r6, [r5]
	ldrsh r0, [r5, #0x20]
	mov r1, #1
	cmp r6, #1
	movhi r6, #1
	bl sub_0201F348
	ldr r0, [r5, #0x1c]
	mov r3, #0
	strb r3, [r0, #0x3c]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _023156B4 ; =ov11_02324E34
	ldr r0, [r5, #0x1c]
	ldr r1, [r1]
	mov r2, r6
	ldr r1, [r1, #0xcb0]
	bl sub_0201E7D8
	ldr ip, [r5, #0x1c]
	ldr r0, _023156B4 ; =ov11_02324E34
	ldrb r1, [ip, #0x3d]
	mov r3, #0x3f
	mov r2, #0x7e
	orr r1, r1, #4
	strb r1, [ip, #0x3d]
	ldr ip, [r5, #4]
	ldr r1, [r5, #0x1c]
	add r4, ip, r4
	mov r4, r4, lsr #0xc
	strh r4, [r1]
	ldr r0, [r0]
	ldr r4, [r5, #8]
	ldr r1, [r0, #0x24]
	ldr r0, [r5, #0x1c]
	add r1, r1, r4, lsr #12
	strh r1, [r0, #2]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strb r3, [r1, #0x3e]
	ldr r1, [r5, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023156B0: .word TRIG_TABLE
_023156B4: .word ov11_02324E34
	arm_func_end ov11_02315504

	arm_func_start ov11_023156B8
ov11_023156B8: ; 0x023156B8
	stmdb sp!, {r4, lr}
	ldr r1, _02315750 ; =ov11_02324E34
	ldrh r2, [r0, #0x12]
	ldr r1, [r1]
	ldr lr, _02315754 ; =TRIG_TABLE
	ldr r1, [r1, #0x24]
	add r1, r2, r1, lsl #8
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0x10]
	ldrh r3, [r0, #0x12]
	ldr r4, [r0, #4]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	mov r1, r2, lsl #1
	ldrsh ip, [lr, r1]
	add r1, r2, #1
	mov r2, r1, lsl #1
	mul r3, ip, r3
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	add r1, r4, r1, asr #12
	str r1, [r0, #4]
	ldrsh r2, [lr, r2]
	ldrh r1, [r0, #0x12]
	ldr ip, [r0, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	sub r1, ip, r1, asr #12
	str r1, [r0, #8]
	ldrh r2, [r0, #0x14]
	add r1, r2, #1
	strh r1, [r0, #0x14]
	cmp r2, #0x100
	movhi r1, #0xff
	strhih r1, [r0]
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02315750: .word ov11_02324E34
_02315754: .word TRIG_TABLE
	arm_func_end ov11_023156B8

	arm_func_start ov11_02315758
ov11_02315758: ; 0x02315758
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x16]
	cmp r1, #0
	bne _023157AC
	ldr r2, [r0, #0xc]
	cmp r2, #0x480
	bls _02315794
	ldr r1, _0231581C ; =ov11_02324E34
	ldr r1, [r1]
	ldr r1, [r1, #0x28]
	mov r1, r1, lsl #4
	add r1, r1, #0x380
	sub r1, r2, r1
	str r1, [r0, #0xc]
	b _023157B4
_02315794:
	mov r1, #0x190000
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	mov r0, r1
	ldmia sp!, {r3, r4, r5, pc}
_023157AC:
	sub r1, r1, #1
	strh r1, [r0, #0x16]
_023157B4:
	ldrh r1, [r0, #0x10]
	ldr r5, [r0, #0xc]
	ldr r2, _0231581C ; =ov11_02324E34
	mov r3, r1, asr #4
	mov r4, r3, lsl #1
	add r3, r4, #1
	ldr lr, _02315820 ; =TRIG_TABLE
	mov ip, r4, lsl #1
	mov r3, r3, lsl #1
	ldr r4, [r2]
	ldrsh ip, [lr, ip]
	mov r5, r5, lsr #8
	ldrsh r2, [lr, r3]
	mul lr, ip, r5
	mul r3, r2, r5
	ldrh r5, [r0, #0x12]
	ldr ip, [r4, #0x24]
	add r2, lr, #0xa0000
	add r4, r5, ip, lsl #4
	sub r1, r1, r4
	strh r1, [r0, #0x10]
	str r2, [r0, #4]
	rsb r1, r3, #0x80000
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231581C: .word ov11_02324E34
_02315820: .word TRIG_TABLE
	arm_func_end ov11_02315758

	arm_func_start ov11_02315824
ov11_02315824: ; 0x02315824
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	add r1, sp, #8
	mov r0, #0
	bl ov11_022EB3C8
	ldrh r0, [r5, #0x14]
	cmp r0, #0
	beq _023158AC
	sub r0, r0, #1
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x10]
	ldr r3, _02315984 ; =TRIG_TABLE
	ldr r4, [r5, #4]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r2, [r3, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	add r0, r2, r2, lsl #1
	mov r2, r0, lsl #0xe
	ldrsh r1, [r3, r1]
	mov r0, r2, asr #0xa
	add r0, r2, r0, lsr #21
	add r2, r4, r0, asr #11
	add r0, r1, r1, lsl #1
	str r2, [r5, #4]
	mov r1, r0, lsl #0xe
	mov r0, r1, asr #0xa
	ldr r2, [r5, #8]
	add r0, r1, r0, lsr #21
	sub r0, r2, r0, asr #11
	str r0, [r5, #8]
_023158AC:
	ldr r2, [r5, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r2
	beq _023158D4
	ldr r1, [r5, #4]
	sub r0, r0, r2
	sub r0, r1, r0, lsl #12
	str r0, [r5, #4]
	ldr r0, [sp, #8]
	str r0, [r5, #0xc]
_023158D4:
	ldrsh r0, [r5, #0x20]
	ldrh r4, [r5]
	mov r1, #1
	bl sub_0201F348
	ldr r0, [r5, #0x1c]
	mov r3, #0
	strb r3, [r0, #0x3c]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _02315988 ; =ov11_02324E34
	ldr r0, [r5, #0x1c]
	ldr r1, [r1]
	mov r2, r4
	ldr r1, [r1, #0xcb0]
	bl sub_0201E7D8
	ldr r1, [r5, #0x1c]
	mov lr, #0x18
	ldrb r0, [r1, #0x3d]
	mov ip, #0xff
	rsb r3, r4, #0x3f
	orr r0, r0, #4
	strb r0, [r1, #0x3d]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	mov r1, r1, lsr #0xc
	strh r1, [r0]
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x1c]
	mov r1, r1, lsr #0xc
	strh r1, [r0, #2]
	ldr r0, [r5, #0x1c]
	rsb r2, r4, #0x40
	strh lr, [r0, #8]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strh lr, [r1, #0xa]
	ldr r1, [r5, #0x1c]
	strb ip, [r1, #0x2f]
	ldr r1, [r5, #0x1c]
	strb r3, [r1, #0x3e]
	ldr r1, [r5, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02315984: .word TRIG_TABLE
_02315988: .word ov11_02324E34
	arm_func_end ov11_02315824

	arm_func_start ov11_0231598C
ov11_0231598C: ; 0x0231598C
	ldr r1, _023159AC ; =ov11_02324E34
	ldr r1, [r1]
	cmp r1, #0
	addne r2, r1, #0x2c
	moveq r0, #0
	movne r1, #0x28
	mlane r0, r1, r0, r2
	bx lr
	.align 2, 0
_023159AC: .word ov11_02324E34
	arm_func_end ov11_0231598C

	arm_func_start ov11_023159B0
ov11_023159B0: ; 0x023159B0
	ldr r2, _023159C8 ; =ov11_02324E34
	mov r1, #0x28
	ldr r2, [r2]
	add r2, r2, #0x2c
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_023159C8: .word ov11_02324E34
	arm_func_end ov11_023159B0

	arm_func_start ov11_023159CC
ov11_023159CC: ; 0x023159CC
	ldr r2, _023159E4 ; =ov11_02324E34
	ldr r3, [r2]
	str r0, [r3, #0x24]
	ldr r0, [r2]
	str r1, [r0, #0x28]
	bx lr
	.align 2, 0
_023159E4: .word ov11_02324E34
	arm_func_end ov11_023159CC

	arm_func_start ov11_023159E8
ov11_023159E8: ; 0x023159E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r3, _02315A98 ; =ov11_02324E34
	ldr r3, [r3]
	cmp r3, #0
	beq _02315A90
	add r4, r3, #0x2c
	mov r3, #0x28
	mla r4, r2, r3, r4
	mov r2, r0, asr #7
	add r0, r0, r2, lsr #24
	mov r2, r1, asr #7
	mov r3, r0, asr #8
	add r0, r1, r2, lsr #24
	mov r1, r3, lsl #0xc
	mov r0, r0, asr #8
	str r1, [r4, #4]
	mov r0, r0, lsl #0xc
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	mov r2, #0xa0000
	str r0, [sp]
	ldr r3, [r4, #8]
	mov r0, #0
	mov r1, #0x80000
	str r3, [sp, #4]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldmib r4, {r0, r1}
	sub r0, r0, #0xa0000
	rsb r1, r1, #0x80000
	bl FX_Atan2Idx
	strh r0, [r4, #0x10]
	add r0, sp, #0xc
	add r1, sp, #0
	bl VEC_Distance
	mov r1, r0, asr #3
	add r0, r0, r1, lsr #28
	mov r0, r0, asr #4
	str r0, [r4, #0xc]
_02315A90:
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.align 2, 0
_02315A98: .word ov11_02324E34
	arm_func_end ov11_023159E8

	arm_func_start ov11_02315A9C
ov11_02315A9C: ; 0x02315A9C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #4]
	ldrh r1, [r4, #0x10]
	mov r0, r3, asr #0xb
	add r0, r3, r0, lsr #20
	cmp r1, #0x4000
	mov r2, r0, asr #0xc
	mov r0, #0x1000
	beq _02315AEC
	cmp r1, #0xc000
	bne _02315AF8
	sub r0, r0, #0x1100
	cmp r2, r0
	addlt r0, r3, #0x300000
	strlt r0, [r4, #4]
	mov r0, #0x1000
	rsb r0, r0, #0
	b _02315AF8
_02315AEC:
	cmp r2, #0x200
	subgt r1, r3, #0x300000
	strgt r1, [r4, #4]
_02315AF8:
	ldrh r1, [r4, #0x10]
	ldr lr, _02315C00 ; =TRIG_TABLE
	ldrh r3, [r4, #0x12]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	mov r1, r2, lsl #1
	ldrsh ip, [lr, r1]
	add r1, r2, #1
	mov r2, r1, lsl #1
	mul r3, ip, r3
	mov r1, r3, asr #0xb
	ldr ip, [r4, #4]
	add r1, r3, r1, lsr #20
	add r1, ip, r1, asr #12
	str r1, [r4, #4]
	ldrsh r2, [lr, r2]
	ldrh r1, [r4, #0x12]
	ldr ip, [r4, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	sub r1, ip, r1, asr #12
	str r1, [r4, #8]
	ldrh r1, [r4, #0x16]
	cmp r1, #0
	subne r1, r1, #1
	strneh r1, [r4, #0x16]
	ldrne r1, [r4, #8]
	addne r0, r1, r0
	strne r0, [r4, #8]
	ldrsh r0, [r4, #0x20]
	ldrh r5, [r4]
	mov r1, #1
	bl sub_0201F348
	ldr r0, [r4, #0x1c]
	mov r3, #0
	strb r3, [r0, #0x3c]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _02315C04 ; =ov11_02324E34
	ldr r0, [r4, #0x1c]
	ldr r1, [r1]
	mov r2, r5
	ldr r1, [r1, #0xcb0]
	bl sub_0201E7D8
	ldr ip, [r4, #0x1c]
	mov r3, #0x3f
	ldrb r1, [ip, #0x3d]
	mov r2, #0x7e
	mov r0, #0
	orr r1, r1, #4
	strb r1, [ip, #0x3d]
	ldr ip, [r4, #4]
	ldr r1, [r4, #0x1c]
	mov ip, ip, lsr #0xc
	strh ip, [r1]
	ldr ip, [r4, #8]
	ldr r1, [r4, #0x1c]
	mov ip, ip, lsr #0xc
	strh ip, [r1, #2]
	ldr r1, [r4, #0x1c]
	strb r3, [r1, #0x3e]
	ldr r1, [r4, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02315C00: .word TRIG_TABLE
_02315C04: .word ov11_02324E34
	arm_func_end ov11_02315A9C

	arm_func_start ov11_02315C08
ov11_02315C08: ; 0x02315C08
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	ldr r3, [r8, #4]
	ldrh r1, [r8, #0x10]
	mov r0, r3, asr #0xb
	add r0, r3, r0, lsr #20
	cmp r1, #0x4000
	mov r2, r0, asr #0xc
	beq _02315C4C
	cmp r1, #0xc000
	bne _02315C58
	mvn r0, #0xff
	cmp r2, r0
	addle r0, r3, #0x300000
	strle r0, [r8, #4]
	b _02315C58
_02315C4C:
	cmp r2, #0x200
	subge r0, r3, #0x300000
	strge r0, [r8, #4]
_02315C58:
	ldrh r0, [r8, #0x10]
	ldr r4, _02315E18 ; =TRIG_TABLE
	ldrh r2, [r8, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [r4, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r0, r3, r2
	mov r2, r0, lsl #1
	mov r0, r2, asr #0xb
	ldr r3, [r8, #4]
	add r0, r2, r0, lsr #20
	add r0, r3, r0, asr #12
	str r0, [r8, #4]
	ldrsh r1, [r4, r1]
	ldrh r0, [r8, #0x12]
	ldr r3, [r8, #8]
	mul r2, r1, r0
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	sub r0, r3, r0, asr #12
	str r0, [r8, #8]
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r8, #0x16]
	bne _02315CDC
	ldrh r0, [r8, #0x12]
	cmp r0, #0x4800
	addlo r0, r0, #0x200
	strloh r0, [r8, #0x12]
_02315CDC:
	ldrh r0, [r8, #0x16]
	ldr r6, [r8, #4]
	ldr r4, [r8, #8]
	mov r0, r0, lsl #1
	rsb r0, r0, #0x40
	mov r0, r0, lsl #0x10
	movs r7, r0, asr #0x10
	mov r1, r6, asr #0xb
	add r2, r6, r1, lsr #20
	mov r3, r4, asr #0xb
	ldrsh r0, [r8, #0x20]
	ldrh r5, [r8]
	mov r1, #1
	movmi r7, #0
	mov r6, r2, asr #0xc
	add r4, r4, r3, lsr #20
	bl sub_0201F348
	ldr r0, [r8, #0x1c]
	mov r1, #5
	strb r1, [r0, #0x3c]
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _02315E1C ; =ov11_02324E34
	ldr r0, [r8, #0x1c]
	ldr r1, [r1]
	mov r2, r5
	ldr r1, [r1, #0xcb0]
	mov r3, #0x8000
	bl sub_0201E7D8
	sub r1, r7, #1
	cmp r6, #0x100
	ldr r0, [r8, #0x1c]
	mov r1, r1, lsl #2
	strb r1, [r0, #0x2f]
	ldr r3, [r8, #0x1c]
	mvnge r6, #0xff
	ldrb r2, [r3, #0x3d]
	mov r1, r6, lsl #0x10
	add r0, r7, r7, lsr #31
	orr r2, r2, #4
	strb r2, [r3, #0x3d]
	add r3, r6, #0x100
	ldr r2, [r8, #0x1c]
	mov r1, r1, asr #0x10
	strh r1, [r2]
	mov r0, r0, asr #1
	rsb r2, r0, r4, asr #12
	mov r2, r2, lsl #0x10
	add r0, r0, r4, asr #12
	mov r0, r0, lsl #0x10
	ldr r5, [r8, #0x1c]
	mov r6, r2, asr #0x10
	strh r6, [r5, #2]
	mov r3, r3, lsl #0x10
	mov r5, r3, asr #0x10
	ldr r2, [r8, #0x1c]
	mov r4, r0, asr #0x10
	strh r5, [r2, #4]
	ldr r2, [r8, #0x1c]
	mov r3, #0x3e
	strh r6, [r2, #6]
	ldr r2, [r8, #0x1c]
	strh r1, [r2, #8]
	ldr r1, [r8, #0x1c]
	mov r2, #0x7e
	strh r4, [r1, #0xa]
	ldr r0, [r8, #0x1c]
	strh r5, [r0, #0xc]
	ldr r0, [r8, #0x1c]
	strh r4, [r0, #0xe]
	ldr r1, [r8, #0x1c]
	mov r0, #0
	strb r3, [r1, #0x3e]
	ldr r1, [r8, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02315E18: .word TRIG_TABLE
_02315E1C: .word ov11_02324E34
	arm_func_end ov11_02315C08

	arm_func_start ov11_02315E20
ov11_02315E20: ; 0x02315E20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	beq _02315E68
	rsb r0, r0, #0x30
	mov r0, r0, lsl #2
	rsb r0, r0, #0
	str r0, [r4, #8]
	ldrh r0, [r4, #0x16]
	rsb r0, r0, #0x30
	mov r0, r0, lsl #2
	rsb r0, r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4, #0x16]
	sub r0, r0, #1
	strh r0, [r4, #0x16]
	b _02315ECC
_02315E68:
	ldr r0, _02315ED4 ; =ov11_02324E34
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _02315EB4
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	mov r1, #3
	bl _s32_div_f
	sub r1, r1, #0xc4
	ldr r0, _02315ED4 ; =ov11_02324E34
	str r1, [r4, #8]
	ldr r2, [r0]
	mov r0, #0
	ldr r1, [r2, #0x24]
	sub r1, r1, #1
	str r1, [r2, #0x24]
	ldmia sp!, {r4, pc}
_02315EB4:
	ldr r0, [r4, #8]
	add r0, r0, #2
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #4
	str r0, [r4, #4]
_02315ECC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02315ED4: .word ov11_02324E34
	arm_func_end ov11_02315E20

	arm_func_start ov11_02315ED8
ov11_02315ED8: ; 0x02315ED8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	ldrh r0, [r5, #0x10]
	ldr r4, _02316010 ; =TRIG_TABLE
	ldrh r2, [r5, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [r4, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r2, r3, r2
	mov r0, r2, asr #0xb
	ldr r3, [r5, #4]
	add r0, r2, r0, lsr #20
	add r0, r3, r0, asr #12
	str r0, [r5, #4]
	ldrsh r1, [r4, r1]
	ldrh r0, [r5, #0x12]
	ldr r3, [r5, #8]
	mul r2, r1, r0
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	sub r0, r3, r0, asr #12
	str r0, [r5, #8]
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	ldrh r0, [r5, #0x16]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #25
	add r1, r1, r0, ror #25
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r4, r0, asr #2
	cmp r4, #0x10
	ldrsh r0, [r5, #0x20]
	mov r1, #1
	rsbhi r4, r4, #0x20
	bl sub_0201F348
	mov r2, #0
	ldr r1, [r5, #0x1c]
	ldr r0, _02316014 ; =ov11_02324E34
	strb r2, [r1, #0x3c]
	str r2, [sp]
	str r2, [sp, #4]
	ldr r1, [r0]
	ldr r0, [r5, #0x1c]
	ldr r1, [r1, #0xcb0]
	mov r3, r2
	bl sub_0201E7D8
	ldr r3, [r5, #0x1c]
	mov r0, #6
	mul r1, r4, r0
	ldrb r2, [r3, #0x3d]
	add r1, r1, #0x80
	orr r0, r2, #4
	strb r0, [r3, #0x3d]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	mov r2, r2, lsr #0xc
	strh r2, [r0]
	ldr r2, [r5, #8]
	ldr r0, [r5, #0x1c]
	mov r2, r2, lsr #0xc
	strh r2, [r0, #2]
	ldr r0, [r5, #0x1c]
	strb r1, [r0, #0x2f]
	ldr r0, [r5, #0x1c]
	mov r1, #0x3f
	strb r1, [r0, #0x3e]
	ldr r0, [r5, #0x1c]
	mov r1, #0x7e
	strh r1, [r0, #0x2a]
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02316010: .word TRIG_TABLE
_02316014: .word ov11_02324E34
	arm_func_end ov11_02315ED8

	arm_func_start ov11_02316018
ov11_02316018: ; 0x02316018
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x12]
	ldr r3, [r0, #4]
	add r1, r1, #0x40
	strh r1, [r0, #0x12]
	ldrh r2, [r0]
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	cmp r2, #0
	mov r3, r1, asr #0xc
	bne _02316094
	cmp r3, #8
	bgt _02316068
	ldrh r1, [r0, #0x10]
	cmp r1, #0xc000
	moveq r2, #0
	ldreq r1, _02316160 ; =ov11_02324E34
	streqh r2, [r0, #0x12]
	ldreq r1, [r1]
	streq r2, [r1, #0x24]
_02316068:
	cmp r3, #0xf8
	blt _023160E0
	ldrh r1, [r0, #0x10]
	cmp r1, #0x4000
	bne _023160E0
	mov r2, #0
	ldr r1, _02316160 ; =ov11_02324E34
	strh r2, [r0, #0x12]
	ldr r1, [r1]
	str r2, [r1, #0x24]
	b _023160E0
_02316094:
	mvn r1, #0x5f
	cmp r3, r1
	bgt _023160BC
	ldrh r1, [r0, #0x10]
	cmp r1, #0xc000
	moveq r2, #0
	ldreq r1, _02316160 ; =ov11_02324E34
	streqh r2, [r0, #0x12]
	ldreq r1, [r1]
	streq r2, [r1, #0x24]
_023160BC:
	cmp r3, #0x158
	blt _023160E0
	ldrh r1, [r0, #0x10]
	cmp r1, #0x4000
	moveq r2, #0
	ldreq r1, _02316160 ; =ov11_02324E34
	streqh r2, [r0, #0x12]
	ldreq r1, [r1]
	streq r2, [r1, #0x24]
_023160E0:
	ldrh r1, [r0, #0x10]
	ldr r2, _02316160 ; =ov11_02324E34
	ldr lr, _02316164 ; =TRIG_TABLE
	mov r1, r1, asr #4
	mov r3, r1, lsl #1
	mov r1, r3, lsl #1
	ldrsh ip, [lr, r1]
	ldrh r1, [r0, #0x12]
	ldr r4, [r2]
	add r3, r3, #1
	mul r1, ip, r1
	ldr ip, [r4, #0x24]
	ldr r5, [r0, #4]
	add r4, r1, ip, lsl #8
	mov r1, r4, asr #0xb
	add r1, r4, r1, lsr #20
	add r1, r5, r1, asr #12
	str r1, [r0, #4]
	mov r1, r3, lsl #1
	ldrsh r3, [lr, r1]
	ldrh r1, [r0, #0x12]
	ldr r2, [r2]
	ldr ip, [r0, #8]
	mul r1, r3, r1
	ldr r2, [r2, #0x24]
	add r2, r1, r2, lsl #8
	mov r1, r2, asr #0xb
	add r1, r2, r1, lsr #20
	sub r1, ip, r1, asr #12
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02316160: .word ov11_02324E34
_02316164: .word TRIG_TABLE
	arm_func_end ov11_02316018

	arm_func_start ov11_02316168
ov11_02316168: ; 0x02316168
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x14
	bl OverlayIsLoaded
	cmp r0, #0
	beq _023161BC
	bl ov16_0238CCBC
	cmp r0, #0
	beq _023161BC
	bl ov16_0238CCBC
	cmp r0, #1
	str r0, [r4, #0xc]
	cmpne r0, #2
	beq _023161B0
	cmp r0, #3
	moveq r0, #0
	streqh r0, [r4, #0x16]
	b _023161B8
_023161B0:
	mov r0, #0
	strh r0, [r4, #0x16]
_023161B8:
	bl ov16_0238CCD8
_023161BC:
	ldrh r0, [r4, #0x16]
	add r0, r0, #1
	strh r0, [r4, #0x16]
	ldr r2, [r4, #0xc]
	cmp r2, #5
	addls pc, pc, r2, lsl #2
	b _02316324
_023161D8: ; jump table
	b _023161F0 ; case 0
	b _02316214 ; case 1
	b _0231624C ; case 2
	b _0231626C ; case 3
	b _023162F4 ; case 4
	b _0231631C ; case 5
_023161F0:
	ldr r0, [r4, #8]
	cmp r0, #0x80
	addlo r0, r0, #1
	strlo r0, [r4, #8]
	addhs r0, r2, #1
	strhs r0, [r4, #0xc]
	movhs r0, #0
	strhsh r0, [r4, #0x16]
	b _02316324
_02316214:
	ldrh r0, [r4, #0x10]
	cmp r0, #0x10
	addlo r0, r0, #1
	strloh r0, [r4, #0x10]
	movlo r0, #0
	strloh r0, [r4, #0x16]
	blo _02316324
	add r0, r2, #1
	str r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x100
	strh r0, [r4, #0x12]
	b _02316324
_0231624C:
	ldrh r1, [r4, #0x16]
	ldr r0, _0231632C ; =0x00002710
	cmp r1, r0
	addhi r0, r2, #1
	strhi r0, [r4, #0xc]
	movhi r0, #0
	strhih r0, [r4, #0x16]
	b _02316324
_0231626C:
	ldrh r0, [r4, #0x16]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x17
	add r0, r0, #0x80
	str r0, [r4, #8]
	ldrh r0, [r4, #0x16]
	add r0, r0, #1
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x17
	add r0, r0, #0x80
	str r0, [r4, #4]
	ldrh r0, [r4, #0x16]
	cmp r0, #0xb4
	movlo r0, #0x180
	strlo r0, [r4, #4]
	ldrh r0, [r4, #0x16]
	cmp r0, #0xb4
	bne _023162B8
	bl ov16_0238CCF0
_023162B8:
	ldrh r0, [r4, #0x16]
	cmp r0, #0xc4
	movhi r0, #0x180
	strhi r0, [r4, #8]
	ldrh r0, [r4, #0x16]
	cmp r0, #0xdc
	bls _02316324
	mov r0, #0x180
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	mov r0, #0
	add r1, r1, #1
	str r1, [r4, #0xc]
	strh r0, [r4, #0x16]
	b _02316324
_023162F4:
	mov r0, #0
	strh r0, [r4, #0x12]
	mov r0, #0x80
	str r0, [r4, #4]
	mov r0, #0x180
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _02316324
_0231631C:
	mov r0, #0
	strh r0, [r4, #0x12]
_02316324:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231632C: .word 0x00002710
	arm_func_end ov11_02316168

	arm_func_start ov11_02316330
ov11_02316330: ; 0x02316330
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _023163A4 ; =ov11_02324E34
	ldr r0, [r0]
	ldrb r0, [r0, #0xcac]
	cmp r0, #0
	bne _0231639C
	ldr r1, _023163A8 ; =ov11_02324B9C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	add r0, sp, #0
	mov r1, #0x8000
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _023163AC ; =ov11_02324BB4
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _023163A4 ; =ov11_02324E34
	mov r2, #1
	ldr r3, [r1]
	str r0, [r3, #0xcb0]
	ldr r0, [r1]
	strb r2, [r0, #0xcac]
_0231639C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_023163A4: .word ov11_02324E34
_023163A8: .word ov11_02324B9C
_023163AC: .word ov11_02324BB4
	arm_func_end ov11_02316330

	arm_func_start ov11_023163B0
ov11_023163B0: ; 0x023163B0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _023163DC ; =ov11_023248C0
	mov r6, #0
	mov r4, #0x1c
_023163C0:
	add r1, r6, #3
	mla r0, r1, r4, r5
	bl ov11_02314D48
	add r6, r6, #1
	cmp r6, #0x12
	blt _023163C0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023163DC: .word ov11_023248C0
	arm_func_end ov11_023163B0

	arm_func_start ov11_023163E0
ov11_023163E0: ; 0x023163E0
	ldrh r2, [r0, #0x12]
	ldr r1, [r0, #8]
	cmp r1, r2, lsl #2
	movlo r1, #0xff
	strloh r1, [r0]
	sublo r0, r1, #0x100
	bxlo lr
	sub r1, r1, r2, lsl #2
	str r1, [r0, #8]
	ldrh r1, [r0, #0x12]
	ldr r2, [r0, #4]
	add r1, r2, r1
	str r1, [r0, #4]
	cmp r1, #0x16000
	ldrhi r1, [r0, #4]
	subhi r1, r1, #0x14000
	strhi r1, [r0, #4]
	mov r0, #0
	bx lr
	arm_func_end ov11_023163E0

	arm_func_start ov11_0231642C
ov11_0231642C: ; 0x0231642C
	ldr ip, _02316438 ; =ov11_0230D270
	ldr r0, _0231643C ; =ov11_02324BF8
	bx ip
	.align 2, 0
_02316438: .word ov11_0230D270
_0231643C: .word ov11_02324BF8
	arm_func_end ov11_0231642C

	arm_func_start ov11_02316440
ov11_02316440: ; 0x02316440
	ldr ip, _0231644C ; =ov11_0230D17C
	ldr r0, _02316450 ; =ov11_02324BF8
	bx ip
	.align 2, 0
_0231644C: .word ov11_0230D17C
_02316450: .word ov11_02324BF8
	arm_func_end ov11_02316440

	arm_func_start ov11_02316454
ov11_02316454: ; 0x02316454
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023164A8 ; =ov11_02324E78
	str r0, [r1]
	bl ov11_02316528
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _023164A8 ; =ov11_02324E78
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #8]
	ldr r2, [r1]
	strb r0, [r2, #6]
	ldr r2, [r1]
	strb r3, [r2, #7]
	ldr r1, [r1]
	str r3, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023164A8: .word ov11_02324E78
	arm_func_end ov11_02316454

	arm_func_start ov11_023164AC
ov11_023164AC: ; 0x023164AC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _023164D8
	ldr r0, _02316524 ; =ov11_02324E78
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #7]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_023164D8:
	bl ov11_02316528
	ldr r0, _02316524 ; =ov11_02324E78
	mov r2, #8
	ldr r1, [r0]
	str r2, [r1]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02316504
	add r0, r1, #8
	bl sub_02047150
_02316504:
	ldr r0, _02316524 ; =ov11_02324E78
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02316524 ; =ov11_02324E78
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316524: .word ov11_02324E78
	arm_func_end ov11_023164AC

	arm_func_start ov11_02316528
ov11_02316528: ; 0x02316528
	stmdb sp!, {r3, lr}
	ldr r1, _023165A0 ; =ov11_02324E78
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	strb r2, [r0, #4]
	ldr r2, [r1]
	sub r0, r3, #2
	str r3, [r2]
	ldr r1, [r1]
	strb r3, [r1, #5]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _023165A0 ; =ov11_02324E78
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0231658C
	bl ov11_022EBEAC
	ldr r0, _023165A0 ; =ov11_02324E78
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _023165A0 ; =ov11_02324E78
	mov r1, #0
	str r1, [r0, #4]
_0231658C:
	ldr r0, _023165A0 ; =ov11_02324E78
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023165A0: .word ov11_02324E78
	arm_func_end ov11_02316528

	arm_func_start ov11_023165A4
ov11_023165A4: ; 0x023165A4
	ldr r0, _023165C0 ; =ov11_02324E78
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #5]
	bx lr
	.align 2, 0
_023165C0: .word ov11_02324E78
	arm_func_end ov11_023165A4

	arm_func_start ov11_023165C4
ov11_023165C4: ; 0x023165C4
	bx lr
	arm_func_end ov11_023165C4

	arm_func_start ov11_023165C8
ov11_023165C8: ; 0x023165C8
	stmdb sp!, {r3, lr}
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02316780
_023165E4: ; jump table
	b _02316608 ; case 0
	b _02316630 ; case 1
	b _02316780 ; case 2
	b _02316780 ; case 3
	b _02316780 ; case 4
	b _023166C0 ; case 5
	b _023166EC ; case 6
	b _02316738 ; case 7
	b _02316770 ; case 8
_02316608:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02316788 ; =ov11_02324E78
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r0, [r0]
	str r1, [r0]
_02316630:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02316788 ; =ov11_02324E78
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	cmp r1, #0
	beq _02316688
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02316788 ; =ov11_02324E78
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #5]
	ldr r0, [r0]
	str r1, [r0]
	b _02316780
_02316688:
	ldrb r1, [r2, #6]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #5]
	beq _02316780
	mov r1, #1
	strb r1, [r2, #5]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #6]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0]
	b _02316780
_023166C0:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02316788 ; =ov11_02324E78
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
_023166EC:
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r1, [r0]
	ldrb r0, [r1, #7]
	cmp r0, #0
	ldreqb r0, [r1, #6]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #5]
	beq _02316780
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02316788 ; =ov11_02324E78
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #5]
	b _02316780
_02316738:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02316760
	add r0, r1, #8
	bl sub_02047150
_02316760:
	ldr r0, _02316788 ; =ov11_02324E78
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
_02316770:
	ldr r0, _02316788 ; =ov11_02324E78
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #5]
_02316780:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316788: .word ov11_02324E78
	arm_func_end ov11_023165C8
	; 0x0231678C

	arm_func_start ov11_0231678C
ov11_0231678C: ; 0x0231678C
	stmdb sp!, {r3, lr}
	ldr r0, _02316838 ; =ov11_02324E78
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #2
	bne _023167E0
	mov r1, #1
	strb r1, [r2, #5]
	ldr r3, [r0]
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _023167CC
	ldr r1, _0231683C ; =ov11_02324BCC
	ldr r2, _02316840 ; =ov11_023168E0
	add r0, r3, #8
	bl sub_0204707C
_023167CC:
	ldr r0, _02316838 ; =ov11_02324E78
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
_023167E0:
	cmp r1, #3
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r2, #5]
	bl ov11_02316528
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02316838 ; =ov11_02324E78
	ldr r1, _02316844 ; =ov11_02324BDC
	str r0, [r2, #4]
	bl ov11_022EBC18
	ldr r0, _02316838 ; =ov11_02324E78
	ldr r1, _02316848 ; =ov11_02324C1C
	ldr r0, [r0, #4]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _02316838 ; =ov11_02324E78
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316838: .word ov11_02324E78
_0231683C: .word ov11_02324BCC
_02316840: .word ov11_023168E0
_02316844: .word ov11_02324BDC
_02316848: .word ov11_02324C1C
	arm_func_end ov11_0231678C

	arm_func_start ov11_0231684C
ov11_0231684C: ; 0x0231684C
	stmdb sp!, {r3, lr}
	ldr r0, _02316898 ; =ov11_02324E78
	ldr r1, [r0]
	ldr r1, [r1]
	cmp r1, #4
	bne _02316890
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _02316898 ; =ov11_02324E78
	mov r3, #1
	ldr r2, [r0]
	mov r1, #5
	strb r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
_02316890:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316898: .word ov11_02324E78
	arm_func_end ov11_0231684C

	arm_func_start ov11_0231689C
ov11_0231689C: ; 0x0231689C
	stmdb sp!, {r3, lr}
	ldr r0, _023168DC ; =ov11_02324E78
	ldr r1, [r0]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _023168DC ; =ov11_02324E78
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1, #4]
	bl ov11_022E9C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_023168DC: .word ov11_02324E78
	arm_func_end ov11_0231689C

	arm_func_start ov11_023168E0
ov11_023168E0: ; 0x023168E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl GetGameMode
	mov r4, r0
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	cmp r4, #2
	mov r7, #0
	bne _023169FC
	ldr r4, _02316A2C ; =ov11_02324C38
	ldr r5, _02316A30 ; =ov11_02324C30
	mov r8, r7
	mov fp, #5
_0231691C:
	mov r0, r8, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F0F0
	cmp r0, #0
	bne _023169F0
	mov r0, r8, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sb, r0
	ldrb r0, [sb]
	mov r1, fp
	mov r2, r7
	cmp r0, #5
	moveq r3, r5
	movne r3, r4
	mov r0, sl
	bl DrawTextInWindow
	mov r0, r6
	mov r1, #0x400
	mov r2, sb
	bl sub_02061F44
	mov r0, sl
	mov r1, #0x12
	mov r2, r7
	mov r3, r6
	bl DrawTextInWindow
	mov r0, r6
	mov r1, #0x400
	mov r2, sb
	bl sub_02061F90
	mov r0, sl
	mov r1, #0x40
	add r2, r7, #0xa
	mov r3, r6
	bl DrawTextInWindow
	ldrb r1, [sb, #1]
	cmp r1, #0xe
	bne _023169CC
	ldr r3, _02316A34 ; =0x00003C2A
	mov r0, sl
	mov r1, #0xcc
	add r2, r7, #0xa
	bl sub_02026268
	b _023169EC
_023169CC:
	add r0, sb, #4
	bl sub_02062D9C
	bl sub_02062DB4
	mov r3, r0
	mov r0, sl
	mov r1, #0xcc
	add r2, r7, #0xa
	bl DrawTextInWindow
_023169EC:
	add r7, r7, #0x14
_023169F0:
	add r8, r8, #1
	cmp r8, #8
	blt _0231691C
_023169FC:
	cmp r7, #0
	bne _02316A18
	ldr r3, _02316A38 ; =0x000008DF
	mov r0, sl
	mov r1, #5
	mov r2, #0x48
	bl sub_02026268
_02316A18:
	mov r0, sl
	bl UpdateWindow
	mov r0, r6
	bl MemFree
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02316A2C: .word ov11_02324C38
_02316A30: .word ov11_02324C30
#if defined(EUROPE)
_02316A34: .word 0x00003C2C
_02316A38: .word 0x000008DF
#elif defined(JAPAN)
_02316A34: .word 0x00003868
_02316A38: .word 0x00001D37
#else
_02316A34: .word 0x00003C2A
_02316A38: .word 0x000008DF
#endif
	arm_func_end ov11_023168E0

	.bss
	.global ov11_02324E80
ov11_02324E80:
	.space 0x14
	.global ov11_02324E94
ov11_02324E94:
	.space 0x10
	.global ov11_02324EA4
ov11_02324EA4:
	.space 0x10
	.global LOCK_NOTIFY_ARRAY
LOCK_NOTIFY_ARRAY:
	.space 0x18
	.global ov11_02324ECC
ov11_02324ECC:
	.space 0x50
	.global ov11_02324F1C
ov11_02324F1C:
	.space 0x54
	.global ov11_02324F70
ov11_02324F70:
	.space 0x4
	.global ov11_02324F74
ov11_02324F74:
	.space 0xE
	.global ov11_02324F82
ov11_02324F82:
	.space 0x8
	.global ov11_02324F8A
ov11_02324F8A:
	.space 0xA
	.global ov11_02324F94
ov11_02324F94:
	.space 0x4
	.global ov11_02324F98
ov11_02324F98:
	.space 0x4
	.global ov11_02324F9C
ov11_02324F9C:
	.space 0x4
	.global ov11_02324FA0
ov11_02324FA0:
	.space 0x20
	.global GROUND_MEMORY_ARENA_1
GROUND_MEMORY_ARENA_1:
	.space 0x64000
	.global ov11_02388FC0
ov11_02388FC0:
	.space 0x14
	.global ov11_02388FD4
ov11_02388FD4:
	.space 0x4
	.global ov11_02388FD8
ov11_02388FD8:
	.space 0x40
	.global ov11_02389018
ov11_02389018:
	.space 0x44
	.global ov11_0238905C
ov11_0238905C:
	.space 0x44
	.global ov11_023890A0
ov11_023890A0:
	.space 0x44
	.global ov11_023890E4
ov11_023890E4:
	.space 0x44
	.global ov11_02389128
ov11_02389128:
	.space 0x44
	.global ov11_0238916C
ov11_0238916C:
	.space 0x88
	.global ov11_023891F4
ov11_023891F4:
	.space 0x4
	.global ov11_023891F8
ov11_023891F8:
	.space 0xA8
	.global ov11_023892A0
ov11_023892A0:
	.space 0xD80
	.global ov11_0238A020
ov11_0238A020:
	.space 0x14
	.global ov11_0238A034
ov11_0238A034:
	.space 0xC
	.global ov11_0238A040
ov11_0238A040:
	.space 0xC
	.global ov11_0238A04C
ov11_0238A04C:
	.space 0x4
	.global ov11_0238A050
ov11_0238A050:
	.space 0xC
	.global ov11_0238A05C
ov11_0238A05C:
	.space 0xC
	.global ov11_0238A068
ov11_0238A068:
	.space 0xC
	.global ov11_0238A074
ov11_0238A074:
	.space 0x4
	.global ov11_0238A078
ov11_0238A078:
	.space 0x8
	.global ov11_0238A080
ov11_0238A080:
	.space 0x4
	.global ov11_0238A084
ov11_0238A084:
	.space 0x4
	.global ov11_0238A088
ov11_0238A088:
	.space 0x4
	.global ov11_0238A08C
ov11_0238A08C:
	.space 0x4
	.global ov11_0238A090
ov11_0238A090:
	.space 0x4
	.global ov11_0238A094
ov11_0238A094:
	.space 0x4
	.global ov11_0238A098
ov11_0238A098:
	.space 0x98
	.global ov11_0238A130
ov11_0238A130:
	.space 0x4
	.global ov11_0238A134
ov11_0238A134:
	.space 0xC
