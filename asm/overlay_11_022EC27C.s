	.include "asm/macros.inc"
	.include "overlay_11_022EC27C.inc"

	.text

	arm_func_start ov11_022EC27C
ov11_022EC27C: ; 0x022EC27C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x13c
	mov sl, r0
	ldrb r0, [sl, #0x2bc]
	mov r4, r1
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp]
	movne r0, #0xf
	strne r0, [sp]
	mvn r0, #0
	cmp r4, r0
	mov r0, sl
	bne _022EC2BC
	bl ov11_022EC08C
	b _022ECCF4
_022EC2BC:
	bl CloseOpenedGroundBgFiles
	mov r0, #1
	strh r0, [sl]
	mov r0, #0
	strb r0, [sl, #0x1c0]
	add r0, sl, #0x100
	strh r4, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0xcc
	bl LoadBackgroundAttributes
	ldr r1, _022ECCFC ; =ov11_02320C58
	add r0, sp, #0x4c
	add r2, sp, #0xcc
	bl sprintf
	ldr r2, [sp]
	add r1, sp, #0x4c
	add r0, sl, #0x174
	bl LoadFileFromRom
	ldr r1, _022ECD00 ; =ov11_02320C6C
	add r0, sp, #0x4c
	add r2, sp, #0xd6
	bl sprintf
	ldr r2, _022ECD04 ; =0x0000030F
	add r0, sl, #0x184
	add r1, sp, #0x4c
	bl LoadFileFromRom
	ldr r1, _022ECD08 ; =ov11_02320C80
	add r0, sp, #0x4c
	add r2, sp, #0xe0
	bl sprintf
	ldr r2, _022ECD04 ; =0x0000030F
	add r0, sl, #0x18c
	add r1, sp, #0x4c
	bl LoadFileFromRom
	ldr r1, [sl, #0x184]
	ldr r0, [sl, #0x174]
	ldrh r2, [r1]
	str r0, [sp, #0x28]
	ldr r5, [sl, #0x18c]
	cmp r2, #0
	beq _022EC3A0
	ldrh r0, [r1, #2]
	mov r2, r2, lsr #1
	add r2, r1, r2, lsl #1
	cmp r0, #0
	str r2, [sp, #0x44]
	moveq r2, #0
	moveq r0, #1
	streq r2, [sp, #0x48]
	streq r0, [sl, #0x1c4]
	beq _022EC3B0
	mov r0, r0, lsr #1
	add r2, r1, r0, lsl #1
	mov r0, #2
	str r2, [sp, #0x48]
	str r0, [sl, #0x1c4]
	b _022EC3B0
_022EC3A0:
	mov r0, #0
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sl, #0x1c4]
_022EC3B0:
	ldr r0, [sp, #0x28]
	add r2, sl, #0xea
	ldrb r3, [r0]
	add r0, sl, #0x100
	add r1, r1, #4
	strh r3, [r0, #0xea]
	ldr r0, [sp, #0x28]
	ldrb r3, [r0, #2]
	add r0, r2, #0x100
	str r0, [sp, #0x40]
	strh r3, [r0, #2]
	mov r0, #0
_022EC3E0:
	add r4, sl, #0x1c8
	mov r2, #0xc
	add r3, sp, #0x44
	ldr r3, [r3, r0, lsl #2]
	mla r4, r0, r2, r4
	cmp r3, #0
	mov r6, #0
	beq _022EC42C
	ldrh r2, [r1], #2
	strh r2, [r4]
_022EC408:
	ldrh r3, [r1], #2
	add r2, r4, r6, lsl #1
	add r6, r6, #1
	strh r3, [r2, #2]
	cmp r6, #4
	blt _022EC408
	ldrh r2, [r1], #2
	strh r2, [r4, #0xa]
	b _022EC44C
_022EC42C:
	strh r6, [r4]
	mov r3, r6
_022EC434:
	add r2, r4, r6, lsl #1
	add r6, r6, #1
	strh r3, [r2, #2]
	cmp r6, #4
	blt _022EC434
	strh r3, [r4, #0xa]
_022EC44C:
	add r0, r0, #1
	cmp r0, #2
	blt _022EC3E0
	ldrb r1, [r5]
	add r0, sl, #0x200
	str r0, [sp, #0x34]
	strb r1, [sl, #0x1e0]
	ldrb r0, [r5, #1]
	add r4, sl, #0x1e0
	ldr r2, _022ECD0C ; =ov11_02324CBC
	strb r0, [r4, #1]
	ldrb r3, [r5, #4]
	ldr r0, [sp, #0x28]
	mov r1, #0x28
	add r0, r0, #4
	strb r3, [r4, #2]
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #5]
	mov sb, #0
	strb r0, [r4, #3]
	ldrb r0, [r5, #6]
	strh r0, [r4, #4]
	ldrb r0, [r5, #8]
	strh r0, [r4, #6]
	ldrb r0, [r5, #0xa]
	strh r0, [r4, #8]
	ldr r0, [sp, #0x34]
	ldrb r3, [sl, #0x2bc]
	ldrsh r0, [r0, #0xc2]
	ldr r2, [r2]
	smulbb r6, r3, r1
	mov r0, r0, lsl #0x14
	add r7, r2, #0x98
	mov r8, r0, lsr #0x10
	b _022EC524
_022EC4D8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, _022ECD10 ; =ov11_02320BF4
	add r0, r7, r6
	bl sub_0200A590
	ldr r2, [sp, #0x1c]
	add r0, r7, r6
	mov r1, r8
	mov r3, #0xf
	bl sub_0200A5B0
	add r0, r8, #0xf
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	ldr r0, [sp, #0x1c]
	add sb, sb, #1
	add r0, r0, #0x3c
	str r0, [sp, #0x1c]
_022EC524:
	ldr r0, [sp, #0x40]
	ldrsh r0, [r0]
	cmp sb, r0
	bge _022EC544
	ldr r0, [sp, #0x34]
	ldrsh r0, [r0, #0xc4]
	cmp sb, r0
	blt _022EC4D8
_022EC544:
	add r0, sl, #0x200
	str r0, [sp, #0x38]
	b _022EC5A8
_022EC550:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, _022ECD10 ; =ov11_02320BF4
	add r0, r7, r6
	bl sub_0200A590
	mov r0, #1
	str r0, [sp, #0x18]
_022EC574:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, _022ECD14 ; =ov11_02320BE8
	add r0, r7, r6
	bl sub_0200A590
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0x10
	blt _022EC574
	add sb, sb, #1
_022EC5A8:
	ldr r0, [sp, #0x38]
	ldrsh r0, [r0, #0xc4]
	cmp sb, r0
	blt _022EC550
	add r0, r7, r6
	bl sub_0200A504
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xbe]
	mov r8, #0
	str r0, [sp, #0x20]
	b _022EC9A0
_022EC5D4:
	add r0, sp, #0x44
	ldr r0, [r0, r8, lsl #2]
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _022EC990
	mov r0, #0xc
	mul r1, r8, r0
	add r0, sl, #0x200
	ldrsh r2, [r0, #0xc6]
	add r6, sl, #0x1c8
	add sb, r6, r1
	ldrsh r1, [r6, r1]
	ldrb r3, [sl, #0x2bc]
	ldr r0, _022ECD18 ; =ov11_02320C18
	mov r7, #0
	add r3, r0, r3, lsl #3
	ldr r0, [sp, #0x20]
	ldr r6, [sp, #0x24]
	ldr r0, [r3, r0, lsl #2]
	str r7, [sp, #0x14]
	add fp, r0, r2, lsl #5
	add r0, fp, r1, lsl #5
	str r0, [sp, #0x10]
	mov r3, r7
	mov r2, r7
	mov r1, r7
	mov r0, r7
_022EC640:
	strh r0, [fp], #2
	add r1, r1, #1
	cmp r1, #0x10
	blt _022EC640
	b _022EC774
_022EC654:
	ldrb r0, [r6]
	add r1, r6, #1
	mov r6, r1
	cmp r0, #0x80
	bge _022EC6D8
	cmp r0, #0x7f
	ldreqb ip, [r1, #1]
	ldreqb r0, [r1]
	addeq r6, r1, #2
	orreq r0, r0, ip, lsl #8
	beq _022EC68C
	cmp r0, #0x7e
	ldreqb r0, [r1]
	addeq r6, r1, #1
_022EC68C:
	cmp r3, #0
	ldrneb r1, [r6], #1
	movne r3, #0
	subne r0, r0, #1
	orrne r1, r2, r1, lsl #8
	strneh r1, [fp], #2
	mov r1, #0
	b _022EC6C4
_022EC6AC:
	ldrb lr, [r6, #1]
	ldrb ip, [r6], #2
	add r1, r1, #2
	str ip, [sp, #0x2c]
	orr ip, ip, lr, lsl #8
	strh ip, [fp], #2
_022EC6C4:
	cmp r1, r0
	blt _022EC6AC
	movle r3, #1
	ldrleb r2, [r6], #1
	b _022EC774
_022EC6D8:
	cmp r0, #0xc0
	bge _022EC6FC
	cmp r0, #0xbf
	ldreqb r0, [r1]
	addeq r6, r1, #1
	str r7, [sp, #0x14]
	subne r0, r0, #0x80
	ldrb r7, [r6], #1
	b _022EC734
_022EC6FC:
	cmp r0, #0xe0
	bge _022EC718
	cmp r0, #0xdf
	ldreqb r0, [r1]
	addeq r6, r1, #1
	subne r0, r0, #0xc0
	b _022EC734
_022EC718:
	cmp r0, #0xff
	ldreqb r0, [r1]
	addeq r6, r1, #1
	ldr r1, [sp, #0x14]
	subne r0, r0, #0xe0
	str r7, [sp, #0x14]
	mov r7, r1
_022EC734:
	cmp r3, #0
	orrne r1, r2, r7, lsl #8
	strneh r1, [fp], #2
	orr r1, r7, r7, lsl #8
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	movne r3, #0
	subne r0, r0, #1
	mov r1, #0
	b _022EC764
_022EC75C:
	strh r2, [fp], #2
	add r1, r1, #2
_022EC764:
	cmp r1, r0
	blt _022EC75C
	movle r3, #1
	movle r2, r7
_022EC774:
	ldr r0, [sp, #0x10]
	cmp fp, r0
	blo _022EC654
	ldr r0, [sp, #0x24]
	ldrsh r7, [sb]
	sub r0, r6, r0
	tst r0, #1
	addne r6, r6, #1
	add r0, sl, #0x200
	ldr r2, _022ECD1C ; =0x0000FFFF
	mov r3, #0
	b _022EC7BC
_022EC7A4:
	mov r1, r3
_022EC7A8:
	strh r2, [fp], #2
	add r1, r1, #1
	cmp r1, #0x10
	blt _022EC7A8
	add r7, r7, #1
_022EC7BC:
	ldrsh r1, [r0, #0xc8]
	cmp r7, r1
	blt _022EC7A4
	add r0, sl, #0x200
	add r1, sl, r8, lsl #2
	ldr ip, [r1, #0x2dc]
	ldrsh r7, [r0, #0xc2]
	ldrsh r2, [r0, #0xc6]
	mov r1, #1
	mov r3, ip
	strh r1, [r0, #0xb8]
	orr r0, r2, r7, lsl #12
	mov r0, r0, lsl #0x10
	ldrsh r1, [sb, #0xa]
	str r0, [sp, #0x3c]
	sub r0, r1, #1
	add r0, r0, r0, lsl #3
	add r7, ip, r0, lsl #1
	mov r0, #0
	b _022EC890
_022EC80C:
	ldrb r1, [r6]
	add r2, r6, #1
	mov r6, r2
	cmp r1, #0xc0
	blt _022EC844
	mov r2, #0xc0
	b _022EC838
_022EC828:
	ldrb fp, [r6], #1
	add r2, r2, #1
	mov fp, fp, lsl #8
	strh fp, [r3], #2
_022EC838:
	cmp r2, r1
	ble _022EC828
	b _022EC890
_022EC844:
	cmp r1, #0x80
	blt _022EC878
	ldrb fp, [r2]
	add r6, r2, #1
	mov r2, #0x80
	mov fp, fp, lsl #0x18
	mov fp, fp, lsr #0x10
	b _022EC86C
_022EC864:
	strh fp, [r3], #2
	add r2, r2, #1
_022EC86C:
	cmp r2, r1
	ble _022EC864
	b _022EC890
_022EC878:
	mov r2, #0
	b _022EC888
_022EC880:
	strh r0, [r3], #2
	add r2, r2, #1
_022EC888:
	cmp r2, r1
	ble _022EC880
_022EC890:
	cmp r3, r7
	blo _022EC80C
	mov r3, ip
	b _022EC928
_022EC8A0:
	ldrb r2, [r6]
	add r0, r6, #1
	mov r6, r0
	cmp r2, #0xc0
	blt _022EC8E4
	mov r0, #0xc0
	b _022EC8D8
_022EC8BC:
	str r3, [sp, #0xc]
	ldrh fp, [r3], #2
	ldrb r1, [r6], #1
	add r0, r0, #1
	orr fp, fp, r1
	ldr r1, [sp, #0xc]
	strh fp, [r1]
_022EC8D8:
	cmp r0, r2
	ble _022EC8BC
	b _022EC928
_022EC8E4:
	cmp r2, #0x80
	blt _022EC920
	add r6, r0, #1
	ldrb lr, [r0]
	mov fp, #0x80
	b _022EC914
_022EC8FC:
	str r3, [sp, #8]
	ldrh r0, [r3], #2
	add fp, fp, #1
	orr r1, r0, lr
	ldr r0, [sp, #8]
	strh r1, [r0]
_022EC914:
	cmp fp, r2
	ble _022EC8FC
	b _022EC928
_022EC920:
	add r0, r2, #1
	add r3, r3, r0, lsl #1
_022EC928:
	cmp r3, r7
	blo _022EC8A0
	ldrsh r0, [sb, #0xa]
	mov r3, #1
	add r0, r0, r0, lsl #3
	add r1, ip, r0, lsl #1
	mov r0, #0
	b _022EC96C
_022EC948:
	mov r2, r0
_022EC94C:
	ldrh fp, [r7, #-2]!
	ldr r6, [sp, #0x3c]
	add r2, r2, #1
	add r6, fp, r6, lsr #16
	cmp r2, #9
	strh r6, [r1, #-2]!
	blt _022EC94C
	add r3, r3, #1
_022EC96C:
	ldrsh r2, [sb, #0xa]
	cmp r3, r2
	blt _022EC948
	mov r1, #0
	mov r0, r1
_022EC980:
	add r1, r1, #1
	cmp r1, #9
	strh r0, [ip], #2
	blt _022EC980
_022EC990:
	ldr r0, [sp, #0x20]
	add r8, r8, #1
	add r0, r0, #1
	str r0, [sp, #0x20]
_022EC9A0:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r8, r0
	blt _022EC5D4
	add r0, sl, #0x2e4
	add r1, r5, #0xc
	add r2, sl, #0x2bc
	add r3, sl, #0x1e0
	bl BmaLayerNrlDecompressor
	mov r1, r0
	str r1, [sl, #0x1f0]
	ldr r0, [sl, #0x2d8]
	cmp r0, #0
	beq _022EC9EC
	add r2, sl, #0x200
	ldrsh r3, [r2, #0xce]
	ldr r5, [sl, #0x2d4]
	mov r2, r4
	blx r5
_022EC9EC:
	mov r1, #0
	ldr r0, [sp, #0x40]
	strb r1, [sl, #0x1ee]
	ldrsh r2, [r0, #2]
	add r0, sl, #4
	cmp r2, #0
	beq _022ECAA4
	ldr r2, [sp, #0x40]
	mov r3, #1
	ldrsh r5, [r2]
	ldr r2, [sp, #0x28]
	mov r7, r1
	add r4, r2, #4
	rsb r2, r5, r5, lsl #4
	add r2, r4, r2, lsl #2
	str r2, [sl, #0x1f4]
	strb r3, [sl, #0x1f8]
	strb r3, [sl, #0x1f9]
	strb r3, [sl, #0x1fa]
	strb r3, [sl, #0x1fb]
	add r3, r2, r5, lsl #2
	strb r1, [sl, #0x1bc]
	add r5, sl, #0x200
	mov r6, r1
	b _022ECA84
_022ECA50:
	ldrsh r4, [r2, #2]
	add r1, r1, #1
	cmp r4, #0
	strgt r3, [r0, #4]
	ldrgtsh r4, [r2, #2]
	add r2, r2, #4
	strle r7, [r0, #4]
	strh r6, [r0]
	rsbgt r4, r4, r4, lsl #4
	strh r6, [r0, #2]
	str r6, [r0, #8]
	addgt r3, r3, r4, lsl #2
	add r0, r0, #0xc
_022ECA84:
	ldr r4, [sp, #0x40]
	ldrsh r4, [r4]
	cmp r1, r4
	bge _022ECABC
	ldrsh r4, [r5, #0xc4]
	cmp r1, r4
	blt _022ECA50
	b _022ECABC
_022ECAA4:
	str r1, [sl, #0x1f4]
	strb r1, [sl, #0x1f8]
	strb r1, [sl, #0x1f9]
	strb r1, [sl, #0x1fa]
	strb r1, [sl, #0x1fb]
	strb r1, [sl, #0x1bc]
_022ECABC:
	mov r2, #0
	b _022ECADC
_022ECAC4:
	strh r2, [r0]
	strh r2, [r0, #2]
	str r2, [r0, #8]
	str r2, [r0, #4]
	add r1, r1, #1
	add r0, r0, #0xc
_022ECADC:
	cmp r1, #0x10
	blt _022ECAC4
	mov r7, #0
	add r4, sl, #0xc4
	mov sb, r7
	mov r5, r7
	mov r8, #0x2c
_022ECAF8:
	mul r0, r7, r8
	add r6, r4, r0
	strb sb, [r4, r0]
	strb sb, [r6, #1]
	strh sb, [r6, #4]
	strh sb, [r6, #2]
	add r0, r6, #8
	bl ZInit8
	str r5, [r6, #0x10]
	str r5, [r6, #0x18]
	str r5, [r6, #0x14]
	str r5, [r6, #0x20]
	str r5, [r6, #0x1c]
	add r7, r7, #1
	str r5, [r6, #0x24]
	str r5, [r6, #0x28]
	cmp r7, #4
	blt _022ECAF8
	add r0, sl, #0x200
	ldrsh r7, [r0, #0xbe]
	b _022ECC80
_022ECB4C:
	mov r0, #0xc
	mul r2, r5, r0
	add r0, sl, #0x200
	add r3, sl, #0x1c8
	ldrsh r1, [r0, #0xc6]
	ldrsh r0, [r3, r2]
	cmp r5, #0
	moveq r8, #0
	add r1, r1, r0
	add r0, r3, r2
	movne r8, #2
	cmp r5, #0
	moveq sb, #0
	str r0, [sp, #4]
	add r0, sl, #0xc4
	ldrb r6, [sl, #0x2bc]
	ldr r4, _022ECD18 ; =ov11_02320C18
	movne sb, #4
	add r4, r4, r6, lsl #3
	ldr r4, [r4, r7, lsl #2]
	mov r6, #0
	add fp, r4, r1, lsl #5
	str r0, [sp, #0x30]
_022ECBA8:
	ldr r0, [sp, #0x30]
	mov r1, #0x2c
	mla r4, r8, r1, r0
	mov r0, #0xa
	mul r0, sb, r0
	add r1, sp, #0xcc
	add r1, r1, r0
	ldrsb r1, [r1, #0x1e]
	cmp r1, #0
	beq _022ECC64
	ldrb r1, [sl, #0x2bc]
	cmp r1, #0
	bne _022ECC64
	add r1, sp, #0xea
	add r2, r1, r0
	ldr r1, _022ECD20 ; =ov11_02320C94
	add r0, sp, #0x4c
	bl sprintf
	ldr r2, [sp]
	add r0, r4, #8
	add r1, sp, #0x4c
	bl LoadFileFromRom
	mov r0, #1
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r3, [r4, #8]
	ldr r0, [sp, #4]
	str r3, [r4, #0x10]
	add r1, r0, r6, lsl #1
	ldrsh r0, [r3, #2]
	add r2, r3, #4
	str r2, [r4, #0x18]
	add r0, r2, r0, lsl #2
	str r2, [r4, #0x14]
	str r0, [r4, #0x20]
	str r0, [r4, #0x1c]
	mov r0, #0
	strh r0, [r4, #2]
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #4]
	str fp, [r4, #0x24]
	ldrsh r0, [r1, #2]
	mov r0, r0, lsl #5
	str r0, [r4, #0x28]
	ldrsh r0, [r1, #2]
	add fp, fp, r0, lsl #5
_022ECC64:
	add r6, r6, #1
	cmp r6, #2
	add sb, sb, #1
	add r8, r8, #1
	blt _022ECBA8
	add r5, r5, #1
	add r7, r7, #1
_022ECC80:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r5, r0
	blt _022ECB4C
	cmp r0, #0
	mov r0, sl
	ble _022ECCA8
	mov r1, #1
	bl ov11_022EE620
	b _022ECCB0
_022ECCA8:
	mov r1, #0
	bl ov11_022EE620
_022ECCB0:
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r1, #1
	add r0, sl, #0x184
	strb r1, [sl, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ECCDC
	add r0, sl, #0x184
	bl UnloadFile
_022ECCDC:
	add r0, sl, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ECCF4
	add r0, sl, #0x18c
	bl UnloadFile
_022ECCF4:
	add sp, sp, #0x13c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ECCFC: .word ov11_02320C58
_022ECD00: .word ov11_02320C6C
_022ECD04: .word 0x0000030F
_022ECD08: .word ov11_02320C80
_022ECD0C: .word ov11_02324CBC
_022ECD10: .word ov11_02320BF4
_022ECD14: .word ov11_02320BE8
_022ECD18: .word ov11_02320C18
_022ECD1C: .word 0x0000FFFF
_022ECD20: .word ov11_02320C94
	arm_func_end ov11_022EC27C

	arm_func_start LoadMapType10
LoadMapType10: ; 0x022ECD24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x128
	mov r6, r1
	mvn r7, #0
	mov r5, r2
	cmp r6, r7
	ldrneb r2, [r5]
	mov sl, r0
	mov r4, r3
	cmpne r2, #0xff
	bne _022ECD5C
	mov r0, sl
	bl ov11_022EC08C
	b _022ED214
_022ECD5C:
	bl ov11_022EC27C
	mov r0, sl
	bl CloseOpenedGroundBgFiles
	mov r0, #2
	strh r0, [sl]
	mov r0, #0
	strb r0, [sl, #0x1c0]
	add r0, sl, #0x100
	strh r6, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0xb8
	bl LoadBackgroundAttributes
	ldr r1, _022ED21C ; =ov11_02320C58
	add r0, sp, #0x38
	add r2, sp, #0xb8
	bl sprintf
	add r0, sl, #0x174
	add r1, sp, #0x38
	mov r2, #6
	bl LoadFileFromRom
	ldr r1, _022ED220 ; =ov11_02320C6C
	add r0, sp, #0x38
	add r2, sp, #0xc2
	bl sprintf
	ldr r2, _022ED224 ; =0x0000030F
	add r0, sl, #0x184
	add r1, sp, #0x38
	bl LoadFileFromRom
	ldr r1, _022ED228 ; =ov11_02320C80
	add r0, sp, #0x38
	add r2, sp, #0xcc
	bl sprintf
	add r0, sl, #0x18c
	add r1, sp, #0x38
	mov r2, #6
	bl LoadFileFromRom
	add r1, sl, #0xea
	ldr r0, [sl, #0x184]
	ldr sb, [sl, #0x174]
	add fp, r1, #0x100
	ldrb r1, [sb]
	ldr r6, [sl, #0x18c]
	add r3, sl, #0x100
	strh r1, [r3, #0xea]
	ldrb sb, [sb, #2]
	add r2, r0, #2
	add r8, sl, #0x1c8
	strh sb, [fp, #2]
	ldrsh r0, [r0]
	add r7, sl, #0x1e0
	mov r1, #0
	strh r0, [r3, #0xc8]
_022ECE2C:
	ldrh r3, [r2], #2
	add r0, r8, r1, lsl #1
	add r1, r1, #1
	strh r3, [r0, #2]
	cmp r1, #4
	blt _022ECE2C
	ldrh r1, [r2]
	ldr sb, _022ED22C ; =ov11_02320BE4
	add r0, sp, #0x24
	strh r1, [r8, #0xa]
	ldrb r3, [r6]
	add r1, r6, #0xc
	add r2, sl, #0x2bc
	strb r3, [r7]
	ldrb fp, [r6, #1]
	add r3, sl, #0x1e0
	strb fp, [r7, #1]
	ldrb fp, [r6, #4]
	strb fp, [r7, #2]
	ldrb fp, [r6, #5]
	strb fp, [r7, #3]
	ldrb fp, [r6, #6]
	strh fp, [r7, #4]
	ldrb fp, [r6, #8]
	strh fp, [r7, #6]
	ldrb r6, [r6, #0xa]
	strh r6, [r7, #8]
	ldr r6, [sb, #0x20]
	ldr sb, [sb, #0x1c]
	str r6, [sp, #0x28]
	str sb, [sp, #0x24]
	ldr r6, [sl, #0x2d8]
	str r6, [sp, #0x24]
	bl BmaLayerNrlDecompressor
	mov r6, r0
	str r6, [sl, #0x1f0]
	ldr r1, [sl, #0x2e4]
	mov r0, #0x40
	stmia sp, {r1, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r7, #3]
	ldr r2, _022ED230 ; =0x06018000
	add r0, sp, #0x2c
	str r1, [sp, #0x10]
	ldr r3, [sl, #0x2d8]
	add r1, sl, #0x194
	str r3, [sp, #0x14]
	ldr r3, [sl, #0x2dc]
	bl ov10_022C3938
	ldr r2, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r1, r6
	str r2, [sl, #0x17c]
	str r0, [sl, #0x180]
	ldr r2, [sp, #0x34]
	add r0, sl, #0x200
	str r2, [sl, #0x1b8]
	ldrsh r3, [r0, #0xce]
	ldr r0, [sl, #0x2d8]
	ldr r4, [sl, #0x2d4]
	mov r2, r7
	blx r4
	mov r0, #0x200
	mov r1, #0
	strh r0, [r8]
	mov r7, r1
_022ECF38:
	add r0, r8, r1, lsl #1
	add r1, r1, #1
	strh r7, [r0, #2]
	cmp r1, #4
	blt _022ECF38
	mov r0, #0x190
	strh r0, [r8, #0xa]
	add r0, sl, #0x100
	mov r1, #0xc
	strh r1, [r0, #0xea]
	strh r7, [r0, #0xec]
	ldr r6, [sl, #0x1b8]
	cmp r6, #0
	beq _022ED0E0
	ldr r0, _022ED234 ; =ov11_02324CBC
	ldrb r1, [sl, #0x2bc]
	ldr r5, [r0]
	mov r0, #0x28
	smulbb r4, r1, r0
	ldr r3, _022ED238 ; =ov11_02320BE4
	add r2, sp, #0x18
	mov r8, r7
	add r5, r5, #0x98
	mov r1, #4
_022ECF98:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ECF98
	b _022ED05C
_022ECFAC:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED23C ; =ov11_02320BF4
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add r6, r6, #4
	mov sb, #1
	add fp, sp, #0x20
_022ECFD4:
	add r3, sp, #0x18
	add r2, sp, #0x1c
	mov r1, #4
_022ECFE0:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ECFE0
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
_022ED01C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED01C
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
	blt _022ECFD4
	add r8, r8, #1
_022ED05C:
	cmp r8, #0xc
	bge _022ED074
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ECFAC
_022ED074:
	add r6, sl, #0x200
	ldr fp, _022ED23C ; =ov11_02320BF4
	b _022ED0CC
_022ED080:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	mov sb, #1
_022ED0A0:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED240 ; =ov11_02320BE8
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	blt _022ED0A0
	add r8, r8, #1
_022ED0CC:
	ldrsh r0, [r6, #0xc4]
	cmp r8, r0
	blt _022ED080
	add r0, r5, r4
	bl sub_0200A504
_022ED0E0:
	mov r1, #0
	strb r1, [sl, #0x1ee]
	ldr r0, _022ED234 ; =ov11_02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov r0, #0x28
	strb r1, [sl, #0x1bc]
	ldr r1, [sl, #0x19c]
	add r4, sl, #4
	cmp r1, #0
	add r3, r3, #0x98
	smulbb r1, r2, r0
	beq _022ED13C
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
_022ED13C:
	mov r0, #0
	str r0, [sl, #0x1f4]
	strb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	strb r0, [sl, #0x1fa]
	strb r0, [sl, #0x1fb]
	mov r5, r0
_022ED158:
	strh r5, [r4]
	strh r5, [r4, #2]
	add r0, r0, #1
	str r5, [r4, #8]
	str r5, [r4, #4]
	cmp r0, #0x10
	add r4, r4, #0xc
	blt _022ED158
	add r3, sl, #0xc4
	mov r1, #0
	mov r0, #0x2c
_022ED184:
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
	blt _022ED184
	mov r0, sl
	mov r1, #1
	bl ov11_022EE620
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r1, #1
	add r0, sl, #0x184
	strb r1, [sl, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ED1FC
	add r0, sl, #0x184
	bl UnloadFile
_022ED1FC:
	add r0, sl, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ED214
	add r0, sl, #0x18c
	bl UnloadFile
_022ED214:
	add sp, sp, #0x128
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ED21C: .word ov11_02320C58
_022ED220: .word ov11_02320C6C
_022ED224: .word 0x0000030F
_022ED228: .word ov11_02320C80
_022ED22C: .word ov11_02320BE4
_022ED230: .word 0x06018000
_022ED234: .word ov11_02324CBC
_022ED238: .word ov11_02320BE4
_022ED23C: .word ov11_02320BF4
_022ED240: .word ov11_02320BE8
	arm_func_end LoadMapType10

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
	bl CloseOpenedGroundBgFiles
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
	bl CloseOpenedGroundBgFiles
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
	bl GroundBgInit
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
	bl GroundBgInit
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
	bl GroundBgInit
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
