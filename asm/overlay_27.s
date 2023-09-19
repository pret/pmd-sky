	.include "asm/macros.inc"
	.include "overlay_27.inc"

	.text

	arm_func_start ov27_0238A140
ov27_0238A140: ; 0x0238A140
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	ldr r0, _0238A37C ; =0x02324DB8
	ldr r1, [r0]
	cmp r1, #0
	ldrne r0, _0238A380 ; =ov27_0238CE80
	strne r1, [r0]
	bne _0238A370
	ldr r0, _0238A384 ; =0x000008D4
	mov r1, #8
	bl MemAlloc
	ldr r3, _0238A380 ; =ov27_0238CE80
	ldr r2, _0238A37C ; =0x02324DB8
	add r1, r0, #0x3c
	str r0, [r3]
	str r0, [r2]
	add r0, r1, #0x800
	bl sub_02034A38
	ldr r1, _0238A380 ; =ov27_0238CE80
	mov r3, #0
	ldr r4, [r1]
	sub r2, r3, #2
	str r0, [r4, #0x838]
	ldr r0, [r1]
	str r3, [r0]
	ldr r0, [r1]
	str r3, [r0, #4]
	ldr r0, [r1]
	strb r2, [r0, #8]
	ldr r0, [r1]
	strb r2, [r0, #9]
	bl ov27_0238A8EC
	bl GetGold
	ldr r1, _0238A380 ; =ov27_0238CE80
	ldr r1, [r1]
	str r0, [r1, #0xc]
	bl sub_0201070C
	ldr r1, _0238A380 ; =ov27_0238CE80
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	bl sub_02010758
	bl sub_0201070C
	ldr r1, _0238A380 ; =ov27_0238CE80
	ldr r2, [r1]
	str r0, [r2, #0x14]
	ldr r3, [r1]
	ldr r2, [r3, #0x14]
	ldr r0, [r3, #0x10]
	sub r0, r2, r0
	str r0, [r3, #0x18]
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	rsb r0, r0, #0
	bl AddMoneyCarried
	bl GetNbItemsInBag
	ldr r1, _0238A380 ; =ov27_0238CE80
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	bl sub_0200FD48
	ldr r1, _0238A380 ; =ov27_0238CE80
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bl sub_0200FD78
	ldr r7, _0238A380 ; =ov27_0238CE80
	mov r6, #0
	ldr r1, [r7]
	str r0, [r1, #0x24]
	ldr r0, [r7]
	str r6, [r0, #0x28]
	ldr r0, [r7]
	ldr r5, [r0, #0x1c]
	cmp r5, #0
	ble _0238A2C0
	add r4, sp, #6
	b _0238A2B8
_0238A274:
	mov r0, r6, lsl #0x10
	mov r1, r4
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	cmp r0, #0
	beq _0238A2B4
	ldrsh r0, [sp, #0xa]
	bl IsStorableItem
	cmp r0, #0
	ldreq r1, [r7]
	sub r5, r5, #1
	ldreq r0, [r1, #0x28]
	addeq r0, r0, #1
	streq r0, [r1, #0x28]
	cmp r5, #0
	ble _0238A2C0
_0238A2B4:
	add r6, r6, #1
_0238A2B8:
	cmp r6, #0x3e8
	blt _0238A274
_0238A2C0:
	ldr r0, _0238A380 ; =ov27_0238CE80
	ldr r3, [r0]
	ldr r4, [r3, #0x1c]
	ldr r0, [r3, #0x28]
	ldr r2, [r3, #0x20]
	ldr r1, [r3, #0x24]
	sub r0, r4, r0
	sub r1, r2, r1
	cmp r1, r0
	blt _0238A368
	cmp r4, #0
	ble _0238A354
	mov r6, #0
	add r5, sp, #0
	b _0238A348
_0238A2FC:
	mov r0, r6, lsl #0x10
	mov r1, r5
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	cmp r0, #0
	beq _0238A344
	ldrsh r0, [sp, #4]
	bl IsStorableItem
	cmp r0, #0
	beq _0238A338
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
	mov r0, r5
	bl sub_020103AC
_0238A338:
	sub r4, r4, #1
	cmp r4, #0
	ble _0238A350
_0238A344:
	add r6, r6, #1
_0238A348:
	cmp r6, #0x3e8
	blt _0238A2FC
_0238A350:
	bl RemoveEmptyItemsInBag
_0238A354:
	ldr r0, _0238A380 ; =ov27_0238CE80
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x2c]
	b _0238A370
_0238A368:
	mov r0, #1
	strb r0, [r3, #0x2c]
_0238A370:
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0238A37C: .word 0x02324DB8
_0238A380: .word ov27_0238CE80
_0238A384: .word 0x000008D4
	arm_func_end ov27_0238A140

	arm_func_start ov27_0238A388
ov27_0238A388: ; 0x0238A388
	ldr r0, _0238A3A0 ; =ov27_0238CE80
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0]
	bx lr
	.align 2, 0
_0238A3A0: .word ov27_0238CE80
	arm_func_end ov27_0238A388

	arm_func_start ov27_0238A3A4
ov27_0238A3A4: ; 0x0238A3A4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x18c
	ldr r0, _0238A8DC ; =ov27_0238CE80
	ldr ip, [r0]
	ldr r1, [ip]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0238A8D0
_0238A3C4: ; jump table
	b _0238A3E4 ; case 0
	b _0238A3F0 ; case 1
	b _0238A63C ; case 2
	b _0238A6A0 ; case 3
	b _0238A728 ; case 4
	b _0238A7FC ; case 5
	b _0238A818 ; case 6
	b _0238A8B0 ; case 7
_0238A3E4:
	mov r0, #1
	str r0, [ip]
	b _0238A8D0
_0238A3F0:
	ldr r1, [ip, #4]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0238A8D0
_0238A400: ; jump table
	b _0238A41C ; case 0
	b _0238A490 ; case 1
	b _0238A4E8 ; case 2
	b _0238A594 ; case 3
	b _0238A5E8 ; case 4
	b _0238A630 ; case 5
	b _0238A630 ; case 6
_0238A41C:
	ldr r1, [ip, #0xc]
	cmp r1, #0
	ldreq r1, [ip, #0x1c]
	cmpeq r1, #0
	bne _0238A448
	mov r1, #2
	str r1, [ip]
	ldr r0, [r0]
	mov r1, #5
	str r1, [r0, #4]
	b _0238A8D0
_0238A448:
	ldr r3, _0238A8E0 ; =0x00000408
	mov r1, #0x400
	strh r3, [ip, #0x34]
	mov r2, #0
	ldr r0, _0238A8DC ; =ov27_0238CE80
	str r2, [sp]
	ldr r0, [r0]
	add r2, r1, #0xb8
	arm_func_end ov27_0238A3A4

	arm_func_start ov27_0238A468
ov27_0238A468: ; 0x0238A468
	add r0, r0, #0x38
	bl PreprocessStringFromMessageId
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r3, #4
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238A8D0
_0238A490:
	ldr r1, [ip, #0x18]
	cmp r1, #0
	ble _0238A4D4
	str r1, [sp, #0xc8]
	mov r3, #8
	add r1, sp, #0xa4
	strh r3, [ip, #0x34]
	str r1, [sp]
	ldr r0, [r0]
	mov r1, #0x400
	add r0, r0, #0x38
	add r2, r1, #0xb9
	bl PreprocessStringFromMessageId
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
_0238A4D4:
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238A8D0
_0238A4E8:
	ldrb r1, [ip, #0x2c]
	cmp r1, #0
	beq _0238A53C
	ldr r2, _0238A8E4 ; =0x00000618
	add r1, sp, #0xa4
	strh r2, [ip, #0x34]
	str r1, [sp]
	ldr r0, [r0]
	mov r1, #0x400
	add r0, r0, #0x38
	add r2, r1, #0xba
	add r3, r1, #8
	bl PreprocessStringFromMessageId
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r3, #4
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238A8D0
_0238A53C:
	ldr r1, [ip, #0x1c]
	cmp r1, #0
	movle r0, #4
	strle r0, [ip, #4]
	ble _0238A8D0
	ldr r3, _0238A8E0 ; =0x00000408
	add r1, sp, #0xa4
	strh r3, [ip, #0x34]
	str r1, [sp]
	ldr r0, [r0]
	mov r1, #0x400
	add r0, r0, #0x38
	add r2, r1, #0xbc
	bl PreprocessStringFromMessageId
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r3, #4
	ldr r2, [r0]
	mov r1, #3
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238A8D0
_0238A594:
	ldr r1, [ip, #0x28]
	cmp r1, #0
	movle r0, #4
	strle r0, [ip, #4]
	ble _0238A8D0
	ldr r3, _0238A8E0 ; =0x00000408
	add r1, sp, #0xa4
	strh r3, [ip, #0x34]
	str r1, [sp]
	ldr r0, [r0]
	mov r1, #0x400
	add r0, r0, #0x38
	add r2, r1, #0xbb
	bl PreprocessStringFromMessageId
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r2, #4
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	str r2, [r0, #4]
	b _0238A8D0
_0238A5E8:
	ldr r2, _0238A8E4 ; =0x00000618
	mov r1, #0x400
	strh r2, [ip, #0x34]
	mov r2, #0
	str r2, [sp]
	ldr r0, [r0]
	add r2, r1, #0xbd
	add r0, r0, #0x38
	add r3, r1, #8
	bl PreprocessStringFromMessageId
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r3, #4
	ldr r2, [r0]
	mov r1, #5
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238A8D0
_0238A630:
	mov r0, #2
	str r0, [ip]
	b _0238A8D0
_0238A63C:
	ldrsb r0, [ip, #8]
	mvn r1, #1
	cmp r0, r1
	beq _0238A660
	bl FreeDBox
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
_0238A660:
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #9]
	cmp r0, r1
	beq _0238A68C
	bl FreePortraitBox
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
_0238A68C:
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _0238A8D0
_0238A6A0:
	add r0, ip, #0x3c
	ldr r4, [ip, #4]
	ldr r5, [ip, #0x838]
	add r6, sp, #0xf4
	add r7, r0, #0x800
	mov lr, #9
_0238A6B8:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0238A6B8
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	mov r0, ip
	bl MemFree
	ldr r2, _0238A8DC ; =ov27_0238CE80
	mov r1, #0
	ldr r0, _0238A8E8 ; =0x02324DB8
	str r1, [r2]
	str r1, [r0]
	cmp r4, #6
	bne _0238A704
	add r1, sp, #0xf4
	mov r0, r5
	bl ov11_0230CE58
	b _0238A720
_0238A704:
	tst r5, #0x100
	beq _0238A71C
	ldr r0, [sp, #0x17c]
	ldr r2, [sp, #0x178]
	blx r2
	b _0238A720
_0238A71C:
	bl ov11_022E6E68
_0238A720:
	mov r0, #4
	b _0238A8D4
_0238A728:
	ldr r0, [ip, #0x838]
	tst r0, #0x100
	bne _0238A740
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238A8D0
_0238A740:
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r1, #0
	ldr r3, [r0]
	ldr r2, [r3, #0x30]
	cmp r2, #0
	movne r1, #1
	cmp r1, #0
	beq _0238A78C
	cmp r2, #1
	mvn r0, #0
	beq _0238A778
	cmp r2, #2
	moveq r0, #0x33
	b _0238A77C
_0238A778:
	mov r0, #0x32
_0238A77C:
	ldr r1, [r3, #0x838]
	tst r1, #0x100
	bne _0238A78C
	bl ov11_022E6E8C
_0238A78C:
	add r0, sp, #0x54
	mov r4, #0
	bl InitPreprocessorArgs
	ldr r0, _0238A8DC ; =ov27_0238CE80
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0202A66C
	cmp r0, #0
	bne _0238A7D4
	bl ov27_0238A960
	ldr r0, _0238A8DC ; =ov27_0238CE80
	add r3, sp, #0x54
	ldr r2, [r0]
	ldrsb r0, [r2, #8]
	ldrh r1, [r2, #0x34]
	add r2, r2, #0x38
	bl sub_0202F23C
	mov r4, #1
_0238A7D4:
	cmp r4, #0
	ldrne r0, _0238A8DC ; =ov27_0238CE80
	movne r1, #5
	ldrne r0, [r0]
	strne r1, [r0]
	ldreq r0, _0238A8DC ; =ov27_0238CE80
	moveq r1, #6
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238A8D0
_0238A7FC:
	bl ov27_0238A928
	cmp r0, #0
	ldreq r0, _0238A8DC ; =ov27_0238CE80
	moveq r1, #6
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238A8D0
_0238A818:
	ldr r0, [ip, #0x838]
	tst r0, #0x100
	bne _0238A830
	bl ov11_022E6EC8
	cmp r0, #0
	beq _0238A8D0
_0238A830:
	add r0, sp, #4
	mov r4, #0
	bl InitPreprocessorArgs
	ldr r0, _0238A8DC ; =ov27_0238CE80
	ldr r0, [r0]
	add r0, r0, #0x38
	add r0, r0, #0x400
	bl sub_0202A66C
	cmp r0, #0
	bne _0238A880
	bl ov27_0238A960
	ldr r0, _0238A8DC ; =ov27_0238CE80
	add r3, sp, #4
	ldr r1, [r0]
	add r2, r1, #0x38
	ldrsb r0, [r1, #8]
	ldrh r1, [r1, #0x36]
	add r2, r2, #0x400
	bl sub_0202F23C
	mov r4, #1
_0238A880:
	cmp r4, #0
	ldrne r0, _0238A8DC ; =ov27_0238CE80
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0]
	bne _0238A8D0
	bl ov27_0238A8EC
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0238A8D0
_0238A8B0:
	bl ov27_0238A928
	cmp r0, #0
	beq _0238A8D0
	bl ov27_0238A8EC
	ldr r0, _0238A8DC ; =ov27_0238CE80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
_0238A8D0:
	mov r0, #1
_0238A8D4:
	add sp, sp, #0x18c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0238A8DC: .word ov27_0238CE80
_0238A8E0: .word 0x00000408
_0238A8E4: .word 0x00000618
_0238A8E8: .word 0x02324DB8

	arm_func_start ov27_0238A8EC
ov27_0238A8EC: ; 0x0238A8EC
	ldr r0, _0238A924 ; =ov27_0238CE80
	mov r3, #8
	ldr r1, [r0]
	mov r2, #0
	strh r3, [r1, #0x34]
	ldr r1, [r0]
	strh r3, [r1, #0x36]
	ldr r1, [r0]
	strb r2, [r1, #0x38]
	ldr r1, [r0]
	strb r2, [r1, #0x438]
	ldr r0, [r0]
	str r2, [r0, #0x30]
	bx lr
	.align 2, 0
_0238A924: .word ov27_0238CE80
	arm_func_end ov27_0238A8EC

	arm_func_start ov27_0238A928
ov27_0238A928: ; 0x0238A928
	stmdb sp!, {r3, lr}
	ldr r0, _0238A95C ; =ov27_0238CE80
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0238A954
	bl IsDBoxActive
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_0238A954:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A95C: .word ov27_0238CE80
	arm_func_end ov27_0238A928

	arm_func_start ov27_0238A960
ov27_0238A960: ; 0x0238A960
	stmdb sp!, {r3, lr}
	ldr r1, _0238A994 ; =ov27_0238CE80
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #8]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDBox
	ldr r1, _0238A994 ; =ov27_0238CE80
	ldr r1, [r1]
	strb r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A994: .word ov27_0238CE80
	arm_func_end ov27_0238A960

	arm_func_start ov27_0238A998
ov27_0238A998: ; 0x0238A998
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x30c
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r2, [r1]
	str r0, [r2]
	ldr r2, [r1]
	ldr r0, [r2]
	cmp r0, #0x2d
	addls pc, pc, r0, lsl #2
	b _0238BA74
_0238A9C0: ; jump table
	b _0238AA78 ; case 0
	b _0238AB60 ; case 1
	b _0238ABAC ; case 2
	b _0238ABFC ; case 3
	b _0238AE50 ; case 4
	b _0238AC4C ; case 5
	b _0238AC9C ; case 6
	b _0238ACEC ; case 7
	b _0238AD3C ; case 8
	b _0238AD8C ; case 9
	b _0238AE00 ; case 10
	b _0238AE5C ; case 11
	b _0238AEAC ; case 12
	b _0238AEF8 ; case 13
	b _0238AF48 ; case 14
	b _0238AF94 ; case 15
	b _0238B014 ; case 16
	b _0238B050 ; case 17
	b _0238B134 ; case 18
	b _0238B1B0 ; case 19
	b _0238B294 ; case 20
	b _0238B34C ; case 21
	b _0238B3C4 ; case 22
	b _0238B418 ; case 23
	b _0238B468 ; case 24
	b _0238B4C0 ; case 25
	b _0238B508 ; case 26
	b _0238B53C ; case 27
	b _0238B578 ; case 28
	b _0238B628 ; case 29
	b _0238B6DC ; case 30
	b _0238B78C ; case 31
	b _0238B820 ; case 32
	b _0238BA74 ; case 33
	b _0238AAE0 ; case 34
	b _0238BA74 ; case 35
	b _0238B758 ; case 36
	b _0238B6A8 ; case 37
	b _0238B260 ; case 38
	b _0238B22C ; case 39
	b _0238B890 ; case 40
	b _0238B8EC ; case 41
	b _0238BA2C ; case 42
	b _0238BA74 ; case 43
	b _0238BA74 ; case 44
	b _0238B4A0 ; case 45
_0238AA78:
	mov r1, #1
	mov r0, #0
	strb r1, [r2, #0x80]
	bl CreateDBox
	ldr r2, _0238B920 ; =0x0238CE84
	mov r1, #0x73
	ldr r3, [r2]
	strb r0, [r3, #0x8d]
	ldr r0, [r2]
	str r1, [r0, #0x94]
	ldr r0, [r2]
	add r0, r0, #0x1a4
	bl InitPortraitBoxWithMonsterId
	ldr r0, _0238B920 ; =0x0238CE84
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a4
	bl SetPortraitLayout
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r2, _0238B924 ; =0x000004BE
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AAE0:
	ldr r0, _0238B928 ; =0x0238CA8C
	bl DebugPrint0
	ldr r1, _0238B920 ; =0x0238CE84
	mov r3, #0
	ldr r4, [r1]
	mov r0, #1
	add r2, r4, #0x88
	str r2, [sp, #0x6c]
	strb r3, [r4, #0x88]
	ldr r2, [r1]
	strb r3, [r2, #0x89]
	ldr r2, [r1]
	strb r3, [r2, #0x8a]
	ldr r1, [r1]
	strb r3, [r1, #0x8b]
	bl sub_02043320
	cmp r0, #0
	ldrne r0, _0238B920 ; =0x0238CE84
	movne r1, #3
	ldrne r0, [r0]
	ldr r3, _0238B92C ; =0x0238C9B4
	strneb r1, [r0, #0x89]
	mov r4, #4
	ldr r1, _0238B930 ; =0x00000211
	add r2, sp, #0xc
	mov r0, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238AB60:
	ldr r0, _0238B934 ; =0x0238CAA4
	bl DebugPrint0
	bl sub_02042AF8
	bl sub_020434D4
	bl ov27_0238C900
	mov r3, #0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r4, #0x73
	ldr r2, [r0]
	mov r1, #8
	strb r3, [r2, #0x80]
	ldr r3, [r0]
	ldr r2, _0238B924 ; =0x000004BE
	str r4, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238ABAC:
	ldr r0, _0238B938 ; =0x0238CAB8
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	mov r1, #0x18
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0x4c0
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238ABFC:
	ldr r0, _0238B93C ; =0x0238CAD0
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #4
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xa5
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AC4C:
	ldr r0, _0238B944 ; =0x0238CAE4
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
	str r2, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	rsb r2, r3, #0x398
	str r3, [r1, #0x94]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AC9C:
	ldr r0, _0238B948 ; =0x0238CAFC
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	ldr r2, _0238B94C ; =0x00000326
	str r3, [r1, #0x94]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238ACEC:
	ldr r0, _0238B950 ; =0x0238CB14
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	ldr r2, _0238B954 ; =0x000004D7
	str r3, [r1, #0x94]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AD3C:
	ldr r0, _0238B958 ; =0x0238CB30
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #1
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xab
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AD8C:
	ldr r0, _0238B95C ; =0x0238CB4C
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0xe
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	str r3, [r1, #0x94]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r2, _0238B964 ; =0x000004CA
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x124
	str r3, [r4, #0xcc]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	arm_func_end ov27_0238A998

	arm_func_start ov27_0238ADFC
ov27_0238ADFC: ; 0x0238ADFC
	b _0238BA74
_0238AE00:
	ldr r0, _0238B968 ; =0x0238CB64
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #0xe
	ldr r1, [r0]
	mov r3, #0x73
	str r2, [r1, #4]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	rsb r2, r3, #0x39c
	str r3, [r1, #0x94]
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AE50:
	ldr r0, _0238B96C ; =0x0238CB7C
	bl DebugPrint0
	b _0238BA74
_0238AE5C:
	ldr r0, _0238B970 ; =0x0238CB8C
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0xd
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xac
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AEAC:
	ldr r0, _0238B974 ; =0x0238CBA4
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0xe
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xb5
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238AEF8:
	ldr r0, _0238B978 ; =0x0238CBBC
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	bl sub_02042730
	mov r0, #3
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x8f]
	b _0238BA74
_0238AF48:
	ldr r0, _0238B97C ; =0x0238CBD4
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	mov r0, #3
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x8f]
	b _0238BA74
_0238AF94:
	ldr r0, _0238B980 ; =0x0238CBF0
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r1, [r0]
	add r0, r1, #0x88
	str r0, [sp, #0x104]
	ldrsh r0, [r1, #0x14]
	bl IsStorableItem
	cmp r0, #0
	ldrne r0, _0238B920 ; =0x0238CE84
	movne r1, #0
	ldreq r0, _0238B920 ; =0x0238CE84
	moveq r1, #3
	ldr r0, [r0]
	mov r2, #0
	strb r1, [r0, #0x88]
	ldr r0, _0238B920 ; =0x0238CE84
	mov r4, #3
	ldr r1, [r0]
	ldr r3, _0238B984 ; =0x0238C994
	strb r2, [r1, #0x89]
	ldr r1, [r0]
	ldr r0, _0238B988 ; =0x0238CA4C
	strb r2, [r1, #0x8a]
	add r2, sp, #0xa4
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B014:
	ldr r0, _0238B98C ; =0x0238CC0C
	bl DebugPrint0
	ldr r0, _0238B990 ; =0x0238C94C
	mov r4, #3
	str r0, [sp, #0x19c]
	ldr r0, _0238B988 ; =0x0238CA4C
	ldr r3, _0238B984 ; =0x0238C994
	add r2, sp, #0x13c
	add r1, r4, #0x210
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B050:
	ldr r0, _0238B994 ; =0x0238CC28
	bl DebugPrint0
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r0, _0238B998 ; =0x0238CC40
	ldr r2, [r1]
	ldrsh r1, [r2, #0x14]
	ldrh r2, [r2, #0x12]
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov lr, #0
	ldr ip, [r0]
	ldr r2, _0238B99C ; =0x0238CC50
	ldrh r4, [ip, #0x12]
	ldr r3, _0238B9A0 ; =0x0000C402
	mov r1, #0x400
	str r4, [ip, #0x94]
	ldr ip, [r0]
	ldrsh r4, [ip, #0x14]
	str r4, [ip, #0xa4]
	ldr ip, [r0]
	ldrh r4, [ip, #0x12]
	str r4, [ip, #0xb8]
	ldr r4, [r0]
	ldrh ip, [r4, #0x12]
	add ip, ip, #0xbc
	str ip, [r4, #0xac]
	ldr ip, [r0]
	str lr, [ip, #0xc0]
	ldr r0, [r0]
	add ip, r0, #0x94
	add r0, r0, #0xe4
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x1d4
	bl InitPreprocessorArgs
	ldr r0, _0238B920 ; =0x0238CE84
	add r1, sp, #0x1d4
	ldr r3, [r0]
	ldr r0, _0238B9A4 ; =0x0238CA6C
	add r2, r3, #0xe4
	str r2, [sp, #0x20c]
	str r1, [sp]
	ldrsh r2, [r3, #0x14]
	add r3, r3, #0x94
	ldr r1, _0238B9A8 ; =0x00001013
	add r2, r2, #0xd1
	add r2, r2, #0x2900
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	stmib sp, {r2, r3}
	ldr r3, _0238B9AC ; =0x00000315
	mov r2, #0
	bl sub_0202E3CC
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x92]
	b _0238BA74
_0238B134:
	ldr r0, _0238B9B0 ; =0x0238CC5C
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0
	ldr r1, [r0]
	mov r2, #0x23
	strb r3, [r1, #0x80]
	ldr r1, [r0]
	mov r3, #0x27
	str r2, [r1]
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	str r3, [r1, #4]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	mov ip, #0x73
	ldr r3, [r0]
	ldr r2, _0238B9B4 ; =0x000004C9
	add r1, r3, #0x124
	str r1, [r3, #0xcc]
	ldr r3, [r0]
	mov r1, #8
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B1B0:
	ldr r0, _0238B9B8 ; =0x0238CC78
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0
	ldr r1, [r0]
	mov r2, #0x23
	strb r3, [r1, #0x80]
	ldr r1, [r0]
	mov r3, #0x26
	str r2, [r1]
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	str r3, [r1, #4]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	mov ip, #0x73
	ldr r3, [r0]
	mov r1, #8
	add r2, r3, #0x124
	str r2, [r3, #0xcc]
	ldr r3, [r0]
	add r2, r1, #0x4c0
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B22C:
	ldr r0, _0238B9BC ; =0x0238CC94
	bl DebugPrint0
	mov ip, #2
	ldr r0, _0238B9C0 ; =0x0238CA5C
	ldr r1, _0238B9C4 ; =0x00300013
	ldr r3, _0238B9C8 ; =0x0238C95C
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B260:
	ldr r0, _0238B9CC ; =0x0238CCAC
	bl DebugPrint0
	mov ip, #2
	ldr r0, _0238B9C0 ; =0x0238CA5C
	ldr r1, _0238B9C4 ; =0x00300013
	ldr r3, _0238B9C8 ; =0x0238C95C
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B294:
	ldr r0, _0238B9D0 ; =0x0238CCC0
	bl DebugPrint0
	bl ov11_022DC504
	bl GetNbItemsInBag
	cmp r0, #0
	ldreq r0, _0238B920 ; =0x0238CE84
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #4]
	beq _0238B2E8
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	ldrne r0, _0238B920 ; =0x0238CE84
	movne r1, #1
	ldrne r0, [r0]
	strne r1, [r0, #4]
	ldreq r0, _0238B920 ; =0x0238CE84
	moveq r1, #0xc
	ldreq r0, [r0]
	streq r1, [r0, #4]
_0238B2E8:
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	strb r3, [r1, #0x80]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r1, _0238B940 ; =0x00000418
	ldr r3, [r0]
	mov ip, #0x73
	add r2, r3, #0x124
	str r2, [r3, #0xcc]
	ldr r3, [r0]
	add r2, r1, #0xb3
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B34C:
	ldr r0, _0238B9D4 ; =0x0238CCDC
	bl DebugPrint0
	bl ov11_022DC504
	bl GetNbItemsInBag
	cmp r0, #0
	ldreq r0, _0238B920 ; =0x0238CE84
	moveq r1, #3
	beq _0238B37C
	mov r0, #0
	bl sub_02043380
	ldr r0, _0238B920 ; =0x0238CE84
	mov r1, #1
_0238B37C:
	ldr r0, [r0]
	str r1, [r0, #4]
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xb4
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B3C4:
	ldr r0, _0238B9D8 ; =0x0238CCF8
	bl DebugPrint0
	bl sub_02043218
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #0x18
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #4]
	add r1, r2, #0x400
	ldr r2, [r0]
	mov ip, #0x73
	strb r3, [r2, #0x80]
	ldr r3, [r0]
	ldr r2, _0238B9DC ; =0x000004CE
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B418:
	ldr r0, _0238B9E0 ; =0x0238CD10
	bl DebugPrint0
	bl ov27_0238C900
	ldr r0, _0238B920 ; =0x0238CE84
	mov ip, #0x18
	ldr r1, [r0]
	mov r2, #0
	str ip, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	ldr r2, _0238B9E4 ; =0x000004D6
	str r3, [r1, #0x94]
	ldr r3, [r0]
	add r1, ip, #0x400
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B468:
	ldr r0, _0238B9E8 ; =0x0238CD28
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #0x2d
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	b _0238BA74
_0238B4A0:
	mov r0, #4
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x90]
	b _0238BA74
_0238B4C0:
	ldr r0, _0238B9EC ; =0x0238CD40
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	mov r0, #4
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x90]
	b _0238BA74
_0238B508:
	ldr r0, _0238B9F0 ; =0x0238CD5C
	bl DebugPrint0
	mov ip, #3
	ldr r0, _0238B988 ; =0x0238CA4C
	ldr r3, _0238B9F4 ; =0x0238C974
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B53C:
	ldr r0, _0238B9F0 ; =0x0238CD5C
	bl DebugPrint0
	ldr r0, _0238B9F8 ; =0x0238C948
	mov ip, #3
	str r0, [sp, #0x284]
	ldr r0, _0238B988 ; =0x0238CA4C
	ldr r3, _0238B9F4 ; =0x0238C974
	add r2, sp, #0x224
	add r1, ip, #0x210
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B578:
	ldr r0, _0238B9FC ; =0x0238CD78
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	ldr r2, _0238B99C ; =0x0238CC50
	ldr lr, [r0]
	ldr r3, _0238B9A0 ; =0x0000C402
	ldrh ip, [lr, #0x12]
	mov r1, #0x400
	str ip, [lr, #0x94]
	ldr lr, [r0]
	ldrsh ip, [lr, #0x14]
	str ip, [lr, #0xa4]
	ldr lr, [r0]
	ldrh ip, [lr, #0x12]
	str ip, [lr, #0xb8]
	ldr r0, [r0]
	add ip, r0, #0x94
	add r0, r0, #0xe4
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x2bc
	bl InitPreprocessorArgs
	ldr r0, _0238B920 ; =0x0238CE84
	add r1, sp, #0x2bc
	ldr r3, [r0]
	ldr r0, _0238B9A4 ; =0x0238CA6C
	add r2, r3, #0xe4
	str r2, [sp, #0x2f4]
	str r1, [sp]
	ldrsh r2, [r3, #0x14]
	add r3, r3, #0x94
	ldr r1, _0238B9A8 ; =0x00001013
	add r2, r2, #0xd1
	add r2, r2, #0x2900
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	stmib sp, {r2, r3}
	ldr r3, _0238B9AC ; =0x00000315
	mov r2, #0
	bl sub_0202E3CC
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x92]
	b _0238BA74
_0238B628:
	ldr r0, _0238BA00 ; =0x0238CD90
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	strb r3, [r1, #0x80]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	mov ip, #0x73
	ldr r3, [r0]
	add r2, ip, #0x460
	add r1, r3, #0x124
	str r1, [r3, #0xcc]
	ldr r3, [r0]
	mov r1, #8
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0x23
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238BA74
_0238B6A8:
	ldr r0, _0238BA04 ; =0x0238CDAC
	bl DebugPrint0
	mov ip, #2
	ldr r0, _0238B9C0 ; =0x0238CA5C
	ldr r1, _0238B9C4 ; =0x00300013
	ldr r3, _0238B9C8 ; =0x0238C95C
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B6DC:
	ldr r0, _0238BA08 ; =0x0238CDC4
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0
	ldr r1, [r0]
	mov r2, #0x23
	strb r3, [r1, #0x80]
	ldr r1, [r0]
	mov r3, #0x24
	str r2, [r1]
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	str r3, [r1, #4]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	mov ip, #0x73
	ldr r3, [r0]
	ldr r2, _0238BA0C ; =0x000004D2
	add r1, r3, #0x124
	str r1, [r3, #0xcc]
	ldr r3, [r0]
	mov r1, #8
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B758:
	ldr r0, _0238BA10 ; =0x0238CDE0
	bl DebugPrint0
	mov ip, #2
	ldr r0, _0238B9C0 ; =0x0238CA5C
	ldr r1, _0238B9C4 ; =0x00300013
	ldr r3, _0238B9C8 ; =0x0238C95C
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
_0238B78C:
	ldr r0, _0238BA14 ; =0x0238CDF4
	bl DebugPrint0
	bl ov11_022DC504
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	ldrne r0, _0238B920 ; =0x0238CE84
	movne r1, #1
	ldreq r0, _0238B920 ; =0x0238CE84
	moveq r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #4]
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _0238B960 ; =0x0238C950
	strb r3, [r1, #0x80]
	ldr r1, [r0]
	add r0, r1, #0x124
	add r1, r1, #0x10
	bl sub_0200D670
	ldr r0, _0238B920 ; =0x0238CE84
	mov ip, #0x73
	ldr r3, [r0]
	ldr r1, _0238B940 ; =0x00000418
	add r2, r3, #0x124
	str r2, [r3, #0xcc]
	ldr r3, [r0]
	add r2, r1, #0xbc
	str ip, [r3, #0x94]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B820:
	ldr r0, _0238BA18 ; =0x0238CE10
	bl DebugPrint0
	bl ov11_022DC504
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	ldrne r0, _0238B920 ; =0x0238CE84
	movne r1, #1
	ldreq r0, _0238B920 ; =0x0238CE84
	moveq r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #4]
	bl sub_02042AF8
	bl sub_020434D4
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xbd
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	b _0238BA74
_0238B890:
	ldr r0, _0238BA1C ; =0x0238CE2C
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r1, [r0]
	ldr r2, _0238BA20 ; =0x000004D9
	str r3, [r1, #0x94]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #0x23
	ldr r2, [r0]
	mov r1, #0x29
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238BA74
_0238B8EC:
	ldr r0, _0238BA24 ; =0x0238CE44
	bl DebugPrint0
	mov ip, #2
	ldr r0, _0238B9C0 ; =0x0238CA5C
	ldr r1, _0238B9C4 ; =0x00300013
	ldr r3, _0238B9C8 ; =0x0238C95C
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _0238B920 ; =0x0238CE84
	ldr r1, [r1]
	strb r0, [r1, #0x91]
	b _0238BA74
	.align 2, 0
_0238B920: .word 0x0238CE84
_0238B924: .word 0x000004BE
_0238B928: .word 0x0238CA8C
_0238B92C: .word 0x0238C9B4
_0238B930: .word 0x00000211
_0238B934: .word 0x0238CAA4
_0238B938: .word 0x0238CAB8
_0238B93C: .word 0x0238CAD0
_0238B940: .word 0x00000418
_0238B944: .word 0x0238CAE4
_0238B948: .word 0x0238CAFC
_0238B94C: .word 0x00000326
_0238B950: .word 0x0238CB14
_0238B954: .word 0x000004D7
_0238B958: .word 0x0238CB30
_0238B95C: .word 0x0238CB4C
_0238B960: .word 0x0238C950
_0238B964: .word 0x000004CA
_0238B968: .word 0x0238CB64
_0238B96C: .word 0x0238CB7C
_0238B970: .word 0x0238CB8C
_0238B974: .word 0x0238CBA4
_0238B978: .word 0x0238CBBC
_0238B97C: .word 0x0238CBD4
_0238B980: .word 0x0238CBF0
_0238B984: .word 0x0238C994
_0238B988: .word 0x0238CA4C
_0238B98C: .word 0x0238CC0C
_0238B990: .word 0x0238C94C
_0238B994: .word 0x0238CC28
_0238B998: .word 0x0238CC40
_0238B99C: .word 0x0238CC50
_0238B9A0: .word 0x0000C402
_0238B9A4: .word 0x0238CA6C
_0238B9A8: .word 0x00001013
_0238B9AC: .word 0x00000315
_0238B9B0: .word 0x0238CC5C
_0238B9B4: .word 0x000004C9
_0238B9B8: .word 0x0238CC78
_0238B9BC: .word 0x0238CC94
_0238B9C0: .word 0x0238CA5C
_0238B9C4: .word 0x00300013
_0238B9C8: .word 0x0238C95C
_0238B9CC: .word 0x0238CCAC
_0238B9D0: .word 0x0238CCC0
_0238B9D4: .word 0x0238CCDC
_0238B9D8: .word 0x0238CCF8
_0238B9DC: .word 0x000004CE
_0238B9E0: .word 0x0238CD10
_0238B9E4: .word 0x000004D6
_0238B9E8: .word 0x0238CD28
_0238B9EC: .word 0x0238CD40
_0238B9F0: .word 0x0238CD5C
_0238B9F4: .word 0x0238C974
_0238B9F8: .word 0x0238C948
_0238B9FC: .word 0x0238CD78
_0238BA00: .word 0x0238CD90
_0238BA04: .word 0x0238CDAC
_0238BA08: .word 0x0238CDC4
_0238BA0C: .word 0x000004D2
_0238BA10: .word 0x0238CDE0
_0238BA14: .word 0x0238CDF4
_0238BA18: .word 0x0238CE10
_0238BA1C: .word 0x0238CE2C
_0238BA20: .word 0x000004D9
_0238BA24: .word 0x0238CE44
_0238BA28: .word 0x0238CE58
_0238BA2C:
	ldr r0, _0238BA28 ; =0x0238CE58
	bl DebugPrint0
	ldr r0, _0238B920 ; =0x0238CE84
	mov r3, #3
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1, #4]
	ldr r1, [r0]
	mov r3, #0x73
	strb r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, _0238B940 ; =0x00000418
	str r3, [r2, #0x94]
	ldr r3, [r0]
	add r2, r1, #0xc4
	ldrsb r0, [r3, #0x8d]
	add r3, r3, #0x94
	bl ShowMessageInDBox
_0238BA74:
	add sp, sp, #0x30c
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov27_0238ADFC

	arm_func_start ov27_0238BA7C
ov27_0238BA7C: ; 0x0238BA7C
	stmdb sp!, {r3, lr}
	bl sub_02044094
	bl sub_020440DC
	bl sub_02042B98
	mov r0, #0x250
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238BB50 ; =0x0238CE84
	str r0, [r1]
	add r0, r0, #0x1b8
	bl sub_02034A38
	ldr r1, _0238BB50 ; =0x0238CE84
	mov r2, #0
	ldr r3, [r1]
	str r0, [r3, #0x1b4]
	ldr r0, [r1]
	str r2, [r0, #0x20]
	ldr r0, [r1]
	str r2, [r0, #0x24]
	ldr r0, [r1]
	str r2, [r0, #0x28]
	ldr r0, [r1]
	str r2, [r0, #0x84]
	ldr r0, [r1]
	add r0, r0, #0x94
	bl InitPreprocessorArgs
	ldr r1, _0238BB50 ; =0x0238CE84
	mov r2, #0x73
	ldr r0, [r1]
	mov r3, #0
	str r2, [r0, #0xe0]
	ldr r0, [r1]
	str r2, [r0, #0x94]
	ldr r0, [r1]
	str r3, [r0, #8]
	mov r0, r3
_0238BB0C:
	ldr r2, [r1]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0x88]
	cmp r3, #5
	blt _0238BB0C
	ldr r1, _0238BB50 ; =0x0238CE84
	mvn r3, #1
	ldr r2, [r1]
	strb r3, [r2, #0x8f]
	ldr r2, [r1]
	strb r3, [r2, #0x90]
	ldr r1, [r1]
	strb r0, [r1, #0x80]
	bl ov27_0238A998
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238BB50: .word 0x0238CE84
	arm_func_end ov27_0238BA7C

	arm_func_start ov27_0238BB54
ov27_0238BB54: ; 0x0238BB54
	stmdb sp!, {r3, lr}
	ldr r0, _0238BB7C ; =0x0238CE84
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238BB7C ; =0x0238CE84
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238BB7C: .word 0x0238CE84
	arm_func_end ov27_0238BB54

	arm_func_start ov27_0238BB80
ov27_0238BB80: ; 0x0238BB80
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r1, [r0]
	ldr r2, [r1, #0x84]
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _0238C8EC
_0238BBA0: ; jump table
	b _0238BBB0 ; case 0
	b _0238BBBC ; case 1
	b _0238C89C ; case 2
	b _0238C8C0 ; case 3
_0238BBB0:
	mov r0, #1
	str r0, [r1, #0x84]
	b _0238C8EC
_0238BBBC:
	ldr r2, [r1]
	cmp r2, #0x2f
	addls pc, pc, r2, lsl #2
	b _0238C830
_0238BBCC: ; jump table
	b _0238BCB0 ; case 0
	b _0238BCB0 ; case 1
	b _0238C830 ; case 2
	b _0238C830 ; case 3
	b _0238C644 ; case 4
	b _0238C830 ; case 5
	b _0238C830 ; case 6
	b _0238C830 ; case 7
	b _0238C830 ; case 8
	b _0238C830 ; case 9
	b _0238C830 ; case 10
	b _0238C830 ; case 11
	b _0238C830 ; case 12
	b _0238BCDC ; case 13
	b _0238BCDC ; case 14
	b _0238BE28 ; case 15
	b _0238BE28 ; case 16
	b _0238BF64 ; case 17
	b _0238BFA0 ; case 18
	b _0238C078 ; case 19
	b _0238C830 ; case 20
	b _0238C830 ; case 21
	b _0238C830 ; case 22
	b _0238C830 ; case 23
	b _0238C818 ; case 24
	b _0238C17C ; case 25
	b _0238C2F0 ; case 26
	b _0238C2F0 ; case 27
	b _0238C3B0 ; case 28
	b _0238C3EC ; case 29
	b _0238C494 ; case 30
	b _0238C830 ; case 31
	b _0238C830 ; case 32
	b _0238C650 ; case 33
	b _0238C690 ; case 34
	b _0238C830 ; case 35
	b _0238C494 ; case 36
	b _0238C3EC ; case 37
	b _0238C078 ; case 38
	b _0238BFA0 ; case 39
	b _0238C59C ; case 40
	b _0238C59C ; case 41
	b _0238C830 ; case 42
	b _0238C760 ; case 43
	b _0238C7BC ; case 44
	b _0238C17C ; case 45
	b _0238BC8C ; case 46
	b _0238C824 ; case 47
_0238BC8C:
	ldr r3, [r1, #0xc]
	sub r2, r3, #1
	str r2, [r1, #0xc]
	cmp r3, #0
	bne _0238C860
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov27_0238A998
	b _0238C860
_0238BCB0:
	ldrsb r0, [r1, #0x8d]
	bl IsDBoxActive
	cmp r0, #0
	bne _0238C860
	mov r0, #0x22
	bl ov27_0238A998
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	b _0238C860
_0238BCDC:
	bl sub_020426B4
	cmp r0, #2
	beq _0238BCF4
	cmp r0, #3
	beq _0238BD24
	b _0238BD84
_0238BCF4:
	bl sub_02042664
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #0x2c
	strb r2, [r1, #0x8f]
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238C860
_0238BD24:
	bl sub_02042B20
	cmp r0, #1
	ble _0238BD3C
	mov r0, #0x10
	bl ov27_0238A998
	b _0238C860
_0238BD3C:
	bne _0238BD4C
	bl sub_02042B50
	ldr r1, _0238C8F8 ; =0x0238CE84
	b _0238BD54
_0238BD4C:
	bl sub_02042ADC
	ldr r1, _0238C8F8 ; =0x0238CE84
_0238BD54:
	ldr r1, [r1]
	str r0, [r1, #0x18]
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r1, [r0]
	ldr r0, [r1, #0x18]
	add r1, r1, #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	mov r0, #0xf
	bl ov27_0238A998
	b _0238C860
_0238BD84:
	bl sub_02042AAC
	cmp r0, #0
	beq _0238C860
	mov r0, #0
	add r1, sp, #0
	strh r0, [sp]
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _0238C860
	mov r0, #0
	bl sub_02017CCC
	bl sub_02042ADC
	ldr r1, _0238C8F8 ; =0x0238CE84
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r1, [r1]
	ldr r0, [r1, #0x18]
	add r1, r1, #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	bl sub_02042664
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x8f]
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #5
	strb r2, [r1, #0x8f]
	ldr r1, [r0]
	mov r2, #0x11
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0x2e
	str r2, [r1, #4]
	bl ov27_0238A998
	b _0238C860
_0238BE28:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238BF48
	cmp r0, #2
	beq _0238BE4C
	cmp r0, #6
	beq _0238BF00
	b _0238C860
_0238BE4C:
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xf
	bne _0238BEB0
	ldrsh r0, [r2, #0x14]
	bl IsStorableItem
	cmp r0, #0
	bne _0238BE90
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r3, #9
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238BEC4
_0238BE90:
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r3, #0x2c
	ldr r2, [r0]
	mov r1, #0x12
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238BEC4
_0238BEB0:
	mov r1, #0x2c
	str r1, [r2]
	ldr r0, [r0]
	mov r1, #0x13
	str r1, [r0, #4]
_0238BEC4:
	bl ov27_0238C900
	bl sub_02042664
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x8f]
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x2c
	strb r3, [r2, #0x8f]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238BF00:
	bl ov27_0238C900
	bl sub_02042664
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x8f]
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #0x11
	strb r2, [r1, #0x8f]
	ldr r2, [r0]
	mov r1, #0x2c
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238BF48:
	bl ov27_0238C900
	bl sub_02042744
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r1, #0xe
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238BF64:
	ldrsb r0, [r1, #0x92]
	bl sub_0202E6E4
	cmp r0, #0
	bne _0238C860
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x92]
	bl sub_0202E6C8
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xe
	strb r2, [r1, #0x92]
	bl ov27_0238A998
	b _0238C860
_0238BFA0:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238C038
	cmp r0, #4
	beq _0238BFC4
	cmp r0, #5
	beq _0238C038
	b _0238C860
_0238BFC4:
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0238BFFC
	bl sub_020582E0
	cmp r0, #0
	bne _0238BFFC
	bl sub_02042AF8
	b _0238C028
_0238BFFC:
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	add r0, r0, #0x10
	bl sub_020103AC
	bl sub_02042AF8
_0238C028:
	bl ov27_0238C900
	mov r0, #0x14
	bl ov27_0238A998
	b _0238C860
_0238C038:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0xe
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C078:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238C13C
	cmp r0, #4
	beq _0238C09C
	cmp r0, #5
	beq _0238C13C
	b _0238C860
_0238C09C:
	mov r5, #0
	add r4, sp, #4
_0238C0A4:
	mov r0, r5
	bl sub_02042B84
	tst r0, #1
	beq _0238C0F8
	mov r0, r5, lsl #0x10
	mov r1, r4
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	cmp r0, #0
	beq _0238C0F8
	ldrb r0, [sp, #5]
	cmp r0, #0
	beq _0238C0E4
	bl sub_020582E0
	cmp r0, #0
	beq _0238C0F8
_0238C0E4:
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
	mov r0, r4
	bl sub_020103AC
_0238C0F8:
	add r5, r5, #1
	cmp r5, #0x32
	blt _0238C0A4
	bl RemoveEmptyItemsInBag
	bl sub_020434D4
	bl ov27_0238C900
	bl sub_02042AF8
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r3, #6
	ldr r1, [r0]
	mov r2, #0x15
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0x2e
	str r2, [r1, #4]
	bl ov27_0238A998
	b _0238C860
_0238C13C:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0xe
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C17C:
	bl sub_02043468
	mov r4, r0
	bl sub_02043400
	cmp r0, #0
	bne _0238C234
	mvn r0, #0
	cmp r4, r0
	bne _0238C1D0
	bl sub_0204317C
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #1
	strb r2, [r1, #0x90]
	ldr r2, [r0]
	mov r1, #0x2b
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C1D0:
	bl sub_020434FC
	mov r5, r0
	mov r0, r4
	bl sub_0204323C
	cmp r5, #1
	ble _0238C1F4
	mov r0, #0x1b
	bl ov27_0238A998
	b _0238C860
_0238C1F4:
	ldrne r0, _0238C8F8 ; =0x0238CE84
	ldrne r0, [r0]
	strneh r4, [r0, #0x1c]
	bne _0238C214
	bl sub_0204352C
	ldr r1, _0238C8F8 ; =0x0238CE84
	ldr r1, [r1]
	strh r0, [r1, #0x1c]
_0238C214:
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r1, [r0]
	ldrsh r0, [r1, #0x1c]
	add r1, r1, #0x10
	bl sub_0200FFF4
	mov r0, #0x1a
	bl ov27_0238A998
	b _0238C860
_0238C234:
	bl sub_02043434
	cmp r0, #0
	beq _0238C860
	mov r0, #0
	add r1, sp, #2
	strh r0, [sp, #2]
	bl GetPressedButtons
	ldrh r0, [sp, #2]
	tst r0, #8
	beq _0238C860
	mov r0, #0
	bl sub_02017CCC
	mov r0, r4
	bl sub_0204323C
	ldr r2, _0238C8F8 ; =0x0238CE84
	ldr r1, _0238C8FC ; =0x020AF6B8
	ldr r0, [r2]
	mov r3, #0
	strh r4, [r0, #0x1c]
	ldr ip, [r2]
	ldr r4, [r1]
	ldrsh r0, [ip, #0x1c]
	add r0, r4, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	strh r0, [ip, #0x14]
	ldr r4, [r2]
	ldr r1, [r1]
	ldrsh r0, [r4, #0x1c]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	strh r0, [r4, #0x12]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	bl sub_0204317C
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0x1c
	strb r3, [r1, #0x90]
	ldr r1, [r0]
	mov r0, #0x2b
	str r2, [r1, #4]
	bl ov27_0238A998
	b _0238C860
_0238C2F0:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238C394
	cmp r0, #3
	beq _0238C314
	cmp r0, #6
	beq _0238C35C
	b _0238C860
_0238C314:
	bl ov27_0238C900
	bl sub_0204317C
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x90]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0x1a
	moveq r0, #0x1d
	movne r0, #0x1e
	str r0, [r1, #4]
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r1, #0x2b
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C35C:
	bl ov27_0238C900
	bl sub_0204317C
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #0x1c
	strb r2, [r1, #0x90]
	ldr r2, [r0]
	mov r1, #0x2b
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C394:
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r1, #0x19
	ldr r0, [r0]
	str r1, [r0]
	bl ov27_0238C900
	bl sub_020433C0
	b _0238C860
_0238C3B0:
	ldrsb r0, [r1, #0x92]
	bl sub_0202E6E4
	cmp r0, #0
	bne _0238C860
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x92]
	bl sub_0202E6C8
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x19
	strb r2, [r1, #0x92]
	bl ov27_0238A998
	b _0238C860
_0238C3EC:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238C454
	cmp r0, #4
	beq _0238C410
	cmp r0, #5
	beq _0238C454
	b _0238C860
_0238C410:
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsh r0, [r0, #0x1c]
	bl sub_02010154
	bl sub_020434D4
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x1f
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C454:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x18
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C494:
	ldrsb r0, [r1, #0x8d]
	bl IsDBoxActive
	cmp r0, #0
	bne _0238C860
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238C55C
	cmp r0, #4
	beq _0238C4D0
	cmp r0, #5
	beq _0238C55C
	b _0238C860
_0238C4D0:
	mov r5, #0
	add r4, sp, #0xa
_0238C4D8:
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02043568
	tst r0, #1
	beq _0238C510
	mov r0, r5, lsl #0x10
	mov r1, r4
	mov r0, r0, asr #0x10
	bl sub_0200FFAC
	cmp r0, #0
	beq _0238C510
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020101A0
_0238C510:
	add r5, r5, #1
	cmp r5, #0x3e8
	blt _0238C4D8
	bl RemoveEmptyItemsInBag
	bl sub_0201007C
	bl sub_02042AF8
	bl ov27_0238C900
	bl sub_020434D4
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x20
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C55C:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C59C:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _0238C604
	cmp r0, #4
	beq _0238C5C0
	cmp r0, #5
	beq _0238C604
	b _0238C860
_0238C5C0:
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsh r0, [r0, #0x1c]
	bl sub_02010154
	bl sub_020434D4
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #0x2a
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C604:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #5
	ldr r1, [r0]
	mov r3, #1
	str r2, [r1, #0xc]
	ldr r2, [r0]
	mov r1, #0x2e
	str r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _0238C860
_0238C644:
	bl ov11_022DC504
	mov r0, #3
	b _0238C864
_0238C650:
	ldrsb r0, [r1, #0x8d]
	bl IsDBoxActive
	cmp r0, #0
	bne _0238C860
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #0x30
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	b _0238C860
_0238C690:
	ldrsb r0, [r1, #0x91]
	bl GetNormalMenuResult
	cmp r0, #1
	ldrne r1, _0238C8F8 ; =0x0238CE84
	ldrne r1, [r1]
	strne r0, [r1, #0x20]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238C860
_0238C6B4: ; jump table
	b _0238C860 ; case 0
	b _0238C750 ; case 1
	b _0238C6D0 ; case 2
	b _0238C714 ; case 3
	b _0238C860 ; case 4
	b _0238C860 ; case 5
	b _0238C740 ; case 6
_0238C6D0:
	bl ov27_0238C900
	bl GetNbItemsInBag
	cmp r0, #0
	bne _0238C6EC
	mov r0, #5
	bl ov27_0238A998
	b _0238C860
_0238C6EC:
	mov r0, #0
	bl sub_02043380
	cmp r0, #0
	beq _0238C708
	mov r0, #8
	bl ov27_0238A998
	b _0238C860
_0238C708:
	mov r0, #0xb
	bl ov27_0238A998
	b _0238C860
_0238C714:
	bl ov27_0238C900
	mov r0, #1
	bl sub_02043320
	cmp r0, #0
	beq _0238C734
	mov r0, #7
	bl ov27_0238A998
	b _0238C860
_0238C734:
	mov r0, #0x16
	bl ov27_0238A998
	b _0238C860
_0238C740:
	bl ov27_0238C900
	mov r0, #2
	bl ov27_0238A998
	b _0238C860
_0238C750:
	bl ov27_0238C900
	mov r0, #0x28
	bl ov27_0238A998
	b _0238C860
_0238C760:
	ldr r2, [r1, #8]
	add r2, r2, #1
	str r2, [r1, #8]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	beq _0238C788
	cmp r0, #3
	beq _0238C7A0
	b _0238C860
_0238C788:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x90]
	b _0238C860
_0238C7A0:
	ldr r0, [r1, #4]
	bl ov27_0238A998
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238C860
_0238C7BC:
	ldr r2, [r1, #8]
	add r2, r2, #1
	str r2, [r1, #8]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	beq _0238C7E4
	cmp r0, #3
	beq _0238C7FC
	b _0238C860
_0238C7E4:
	bl ov27_0238C900
	ldr r0, _0238C8F8 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x8f]
	b _0238C860
_0238C7FC:
	ldr r0, [r1, #4]
	bl ov27_0238A998
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0238C860
_0238C818:
	ldr r0, [r1, #4]
	bl ov27_0238A998
	b _0238C860
_0238C824:
	mov r0, #0xe
	str r0, [r1]
	b _0238C860
_0238C830:
	ldrsb r0, [r1, #0x8d]
	bl IsDBoxActive
	cmp r0, #0
	bne _0238C860
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl ShowDBox
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov27_0238A998
_0238C860:
	mov r0, #0
_0238C864:
	cmp r0, #3
	bne _0238C8EC
	ldr r0, _0238C8F8 ; =0x0238CE84
	mov r2, #2
	ldr r1, [r0]
	str r2, [r1, #0x84]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202F2C4
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl sub_0202836C
	b _0238C8EC
_0238C89C:
	mov r0, #3
	str r0, [r1, #0x84]
	bl sub_020440B8
	bl sub_02042BBC
	ldr r0, _0238C8F8 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x8d]
	bl FreeDBox
	b _0238C8EC
_0238C8C0:
	ldr r0, [r1, #0x1b4]
	tst r0, #0x100
	beq _0238C8E0
	ldr r0, [r1, #0x240]
	ldr r2, [r1, #0x23c]
	mov r1, #0
	blx r2
	b _0238C8E4
_0238C8E0:
	bl ov11_022E6E68
_0238C8E4:
	mov r0, #4
	b _0238C8F0
_0238C8EC:
	mov r0, #1
_0238C8F0:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238C8F8: .word 0x0238CE84
_0238C8FC: .word 0x020AF6B8
	arm_func_end ov27_0238BB80

	arm_func_start ov27_0238C900
ov27_0238C900: ; 0x0238C900
	stmdb sp!, {r3, lr}
	ldr r0, _0238C944 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x91]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0238C944 ; =0x0238CE84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x91]
	bl FreeNormalMenu
	ldr r0, _0238C944 ; =0x0238CE84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x91]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C944: .word 0x0238CE84
	arm_func_end ov27_0238C900
	; 0x0238C948

	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDA, 0x04, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xDB, 0x04, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCF, 0x04, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xD0, 0x04, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xD1, 0x04, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC5, 0x04, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xC6, 0x04, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xC7, 0x04, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBF, 0x04, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xC0, 0x04, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xC1, 0x04, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xC2, 0x04, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xBE, 0x04, 0xBE, 0x04, 0xBD, 0x04, 0xC4, 0x04, 0xCD, 0x04, 0xC9, 0x04
	.byte 0xC8, 0x04, 0xCB, 0x04, 0xCC, 0x04, 0xCE, 0x04, 0xD6, 0x04, 0xD3, 0x04, 0xD2, 0x04, 0xD4, 0x04
	.byte 0xD5, 0x04, 0x25, 0x03, 0x26, 0x03, 0xD7, 0x04, 0xCA, 0x04, 0x29, 0x03, 0xC3, 0x04, 0xD9, 0x04
	.byte 0xDC, 0x04, 0xD8, 0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x10, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x12, 0x02, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x0F, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x53, 0x45
	.byte 0x4C, 0x45, 0x43, 0x54, 0x4D, 0x45, 0x4E, 0x55, 0x3A, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x45, 0x58, 0x50, 0x4C, 0x41, 0x4E
	.byte 0x41, 0x54, 0x49, 0x4F, 0x4E, 0x3A, 0x0A, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x3A, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x49, 0x54, 0x45, 0x4D, 0x5F, 0x4E, 0x4F, 0x4E, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x49, 0x54
	.byte 0x45, 0x4D, 0x5F, 0x4D, 0x41, 0x58, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x5F, 0x57, 0x41, 0x52, 0x45, 0x48, 0x4F, 0x55, 0x53, 0x45
	.byte 0x5F, 0x4E, 0x4F, 0x4E, 0x0A, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x57, 0x41, 0x52, 0x45, 0x48, 0x4F, 0x55, 0x53, 0x45, 0x5F, 0x46, 0x55, 0x4C, 0x4C
	.byte 0x3A, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x5F, 0x50
	.byte 0x55, 0x54, 0x5F, 0x42, 0x41, 0x44, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x46, 0x55, 0x4C, 0x4C, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x51, 0x55
	.byte 0x49, 0x54, 0x0A, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55
	.byte 0x54, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55
	.byte 0x54, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x52, 0x45, 0x53, 0x45, 0x4C, 0x45
	.byte 0x43, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x31
	.byte 0x3A, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55
	.byte 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x41, 0x3A, 0x0A, 0x00, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x45, 0x58
	.byte 0x50, 0x4C, 0x41, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x49, 0x74, 0x65, 0x6D, 0x25, 0x64, 0x20, 0x43
	.byte 0x6F, 0x75, 0x6E, 0x74, 0x25, 0x64, 0x0A, 0x00, 0x5B, 0x69, 0x74, 0x65, 0x6D, 0x3A, 0x30, 0x5D
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55
	.byte 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x5F, 0x31, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x43, 0x4F
	.byte 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x5F, 0x41, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x5F, 0x53, 0x45, 0x4C
	.byte 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x5F, 0x31, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52
	.byte 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x50, 0x55, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x5F, 0x31, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x50, 0x55
	.byte 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x5F, 0x41, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x53, 0x54
	.byte 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x3A, 0x0A, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x53, 0x45
	.byte 0x4C, 0x45, 0x43, 0x54, 0x3A, 0x0A, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x52, 0x45, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x5F, 0x47
	.byte 0x45, 0x54, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x31, 0x0A, 0x00, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x45, 0x58
	.byte 0x50, 0x4C, 0x41, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x5F, 0x31, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D
	.byte 0x5F, 0x4E, 0x45, 0x57, 0x5F, 0x31, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52
	.byte 0x4D, 0x5F, 0x41, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x43, 0x4F, 0x4E
	.byte 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E
	.byte 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53
	.byte 0x5F, 0x31, 0x3A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64
	.byte 0x65, 0x5F, 0x47, 0x45, 0x54, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x5F, 0x41, 0x3A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x5F, 0x45
	.byte 0x4E, 0x44, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x0A, 0x00, 0x5F, 0x45, 0x4E, 0x44
	.byte 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x00, 0x00
	.byte 0x5F, 0x4D, 0x65, 0x6E, 0x75, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x45, 0x4E, 0x44, 0x5F, 0x54, 0x48
	.byte 0x41, 0x4E, 0x4B, 0x53, 0x3A, 0x0A, 0x00, 0x00

	.data
	.global ov27_0238CE80
ov27_0238CE80:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
