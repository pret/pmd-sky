	.include "asm/macros.inc"
	.include "overlay_17.inc"

	.text

	arm_func_start ov17_0238A140
ov17_0238A140: ; 0x0238A140
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_0203C760
	mov r0, #0x26c
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A270 ; =ov17_0238BE00
	mov r2, #1
	str r0, [r1]
	strb r2, [r0, #9]
	ldr r0, [r1]
	add r0, r0, #0xc
	bl InitPreprocessorArgs
	ldr lr, _0238A270 ; =ov17_0238BE00
	mov r2, #0
	ldr r0, [lr]
	mov r4, #2
	str r2, [r0, #0x6c]
	ldr r0, [lr]
	sub r1, r2, #1
	str r2, [r0, #0x70]
	ldr r5, [lr]
	ldr ip, _0238A274 ; =0x0238A08C
	ldr r3, [r5, #0x70]
	sub r0, r4, #4
	str r3, [r5, #0x78]
	ldr r3, [lr]
	str r2, [r3, #0x74]
	ldr r3, [lr]
	strh r2, [r3, #0x7c]
	ldr r3, [lr]
	strh r2, [r3, #0x7e]
	ldr r3, [lr]
	add r3, r3, #0x200
	strh r1, [r3, #0x58]
	ldr r3, [lr]
	str r2, [r3, #0x80]
	ldr r3, [lr]
	add r3, r3, #0x200
	strh r4, [r3, #0x5a]
	ldr r3, [lr]
	add r3, r3, #0x200
	strh r4, [r3, #0x5c]
	ldr r3, [lr]
	str r2, [r3, #0x264]
	ldr r2, [lr]
	add r2, r2, #0x200
	strh r1, [r2, #0x68]
	ldr r2, [ip]
	ldr r1, [lr]
	str r2, [r1, #0x260]
	ldr r1, [lr]
	strb r0, [r1]
	ldr r1, [lr]
	strb r0, [r1, #1]
	ldr r1, [lr]
	strb r0, [r1, #2]
	ldr r1, [lr]
	strb r0, [r1, #3]
	ldr r1, [lr]
	strb r0, [r1, #4]
	ldr r1, [lr]
	strb r0, [r1, #5]
	ldr r1, [lr]
	strb r0, [r1, #6]
	ldr r1, [lr]
	strb r0, [r1, #7]
	ldr r1, [lr]
	strb r0, [r1, #8]
	ldr r0, [lr]
	add r0, r0, #0x84
	bl sub_02034A38
	ldr r1, _0238A270 ; =ov17_0238BE00
	ldr r1, [r1]
	str r0, [r1, #0x80]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238A270: .word ov17_0238BE00
_0238A274: .word 0x0238A08C
	arm_func_end ov17_0238A140

	arm_func_start ov17_0238A278
ov17_0238A278: ; 0x0238A278
	stmdb sp!, {r3, lr}
	ldr r0, _0238A360 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #1
	bne _0238A2A4
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A2A4
	bl sub_0202F334
_0238A2A4:
	ldr r0, _0238A360 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #2
	bne _0238A2CC
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A2CC
	bl HidePortraitBox
_0238A2CC:
	ldr r0, _0238A360 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrh r0, [r0, #0x7e]
	tst r0, #0x20
	bne _0238A2E4
	bl sub_0203A618
_0238A2E4:
	ldr r0, _0238A360 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x40
	bne _0238A30C
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	beq _0238A30C
	bl sub_0203088C
_0238A30C:
	ldr r0, _0238A360 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x80
	bne _0238A334
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	beq _0238A334
	bl sub_0203088C
_0238A334:
	ldr r0, _0238A360 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x100
	ldmneia sp!,  {r3, pc}
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202E6B0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A360: .word ov17_0238BE00
	arm_func_end ov17_0238A278

	arm_func_start ov17_0238A364
ov17_0238A364: ; 0x0238A364
	stmdb sp!, {r3, lr}
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #1
	bne _0238A3D0
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A3C4
	bl IsDBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A3C4
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl FreeDBox
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0]
_0238A3C4:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A3D0:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #2
	bne _0238A438
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A42C
	bl sub_0202F66C
	cmp r0, #0
	movne r2, #0
	bne _0238A42C
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl FreePortraitBox
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #1]
_0238A42C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A438:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #4
	bne _0238A4A0
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A494
	bl IsNormalMenuActive
	cmp r0, #0
	arm_func_end ov17_0238A364

	arm_func_start ov17_0238A468
ov17_0238A468: ; 0x0238A468
	movne r2, #0
	bne _0238A494
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl FreeNormalMenu
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #2]
_0238A494:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A4A0:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x10
	bne _0238A508
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A4FC
	bl IsNormalMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A4FC
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl FreeNormalMenu
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #3]
_0238A4FC:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A508:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrh r0, [r0, #0x7e]
	tst r0, #0x20
	bne _0238A540
	bl sub_0203A9B8
	cmp r0, #0
	movne r0, #0
	bne _0238A534
	bl sub_0203A51C
	mov r0, #1
_0238A534:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A540:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #8
	bne _0238A5A8
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A59C
	bl IsNormalMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A59C
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl FreeNormalMenu
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #4]
_0238A59C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A5A8:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r3, [r0]
	ldrh r2, [r3, #0x7e]
	tst r2, #0x40
	bne _0238A5DC
	ldrsb r1, [r3, #5]
	mvn r0, #1
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A5DC:
	tst r2, #0x80
	bne _0238A63C
	ldrsb r0, [r3, #6]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A630
	bl sub_020308C4
	cmp r0, #0
	movne r2, #0
	bne _0238A630
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_020308A0
	bl sub_020407C0
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #6]
_0238A630:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A63C:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x100
	bne _0238A6A8
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A69C
	bl sub_0202E6E4
	cmp r0, #0
	movne r2, #0
	bne _0238A69C
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202E6C8
	bl sub_02041A00
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #7]
_0238A69C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A6A8:
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x200
	bne _0238A710
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A704
	bl IsNormalMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A704
	ldr r0, _0238A718 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl FreeNormalMenu
	ldr r0, _0238A718 ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #8]
_0238A704:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A710:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A718: .word ov17_0238BE00
	arm_func_end ov17_0238A468

	arm_func_start ov17_0238A71C
ov17_0238A71C: ; 0x0238A71C
	stmdb sp!, {r3, lr}
	ldr r0, _0238A750 ; =ov17_0238BE00
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0203C760
	ldr r0, _0238A750 ; =ov17_0238BE00
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238A750 ; =ov17_0238BE00
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A750: .word ov17_0238BE00
	arm_func_end ov17_0238A71C

	arm_func_start ov17_0238A754
ov17_0238A754: ; 0x0238A754
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x124
	bl sub_0203C9E4
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r4, [r0]
	ldr r1, [r4, #0x6c]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238AF90
_0238A778: ; jump table
	b _0238A788 ; case 0
	b _0238AF18 ; case 1
	b _0238AF4C ; case 2
	b _0238AF90 ; case 3
_0238A788:
	ldr r7, _0238AFA0 ; =0x0238BD44
	add r6, sp, #4
	mov r5, #0xa
_0238A794:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0238A794
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	ldr r0, [r4, #0x74]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238AF10
_0238A7BC: ; jump table
	b _0238A7CC ; case 0
	b _0238A840 ; case 1
	b _0238AEC8 ; case 2
	b _0238A7CC ; case 3
_0238A7CC:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r1, #0
	str r1, [r4, #0x74]
	ldr r1, [r0]
	add r0, sp, #4
	ldr r1, [r1, #0x70]
	ldr r0, [r0, r1, lsl #2]
	blx r0
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r3, [r0]
	ldr r1, [r3, #0x70]
	ldr r2, [r3, #0x78]
	cmp r1, r2
	beq _0238AF10
	ldr r1, [r3, #0x74]
	cmp r1, #3
	bne _0238A828
	str r2, [r3, #0x70]
	ldr r1, [r0]
	add r0, sp, #4
	ldr r1, [r1, #0x70]
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0238A828:
	bl ov17_0238A278
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x74]
	b _0238AF10
_0238A840:
	bl ov17_0238A364
	cmp r0, #0
	beq _0238AF10
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r2, [r0]
	ldrh r0, [r2, #0x7e]
	tst r0, #1
	beq _0238AA30
	ldrsb r1, [r2]
	mvn r0, #1
	ldrh r5, [r2, #0x7c]
	cmp r1, r0
	ldr r4, _0238AFA4 ; =0x00003008
	bne _0238A898
	ldr r0, _0238AFA8 ; =0x0238BB64
	bl CreateDBox
	ldr r1, _0238AF9C ; =ov17_0238BE00
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	strh r2, [r0, #0x7c]
_0238A898:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDBox
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r0]
	ldr r0, [r1, #0x70]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _0238A9F8
_0238A8C0: ; jump table
	b _0238A968 ; case 0
	b _0238A9F8 ; case 1
	b _0238A9F8 ; case 2
	b _0238A9F8 ; case 3
	b _0238A9AC ; case 4
	b _0238A9AC ; case 5
	b _0238A97C ; case 6
	b _0238A97C ; case 7
	b _0238A988 ; case 8
	b _0238A994 ; case 9
	b _0238A994 ; case 10
	b _0238A9A0 ; case 11
	b _0238A9F8 ; case 12
	b _0238A9F8 ; case 13
	b _0238A9F8 ; case 14
	b _0238A9F8 ; case 15
	b _0238A9B8 ; case 16
	b _0238A9B8 ; case 17
	b _0238A9B8 ; case 18
	b _0238A9C4 ; case 19
	b _0238A9C4 ; case 20
	b _0238A9D0 ; case 21
	b _0238A9D0 ; case 22
	b _0238A9D0 ; case 23
	b _0238A9DC ; case 24
	b _0238A9DC ; case 25
	b _0238A9DC ; case 26
	b _0238A9E4 ; case 27
	b _0238A9E4 ; case 28
	b _0238A9E4 ; case 29
	b _0238A9F8 ; case 30
	b _0238A9F8 ; case 31
	b _0238A9F8 ; case 32
	b _0238A9F8 ; case 33
	b _0238A9F8 ; case 34
	b _0238A9F8 ; case 35
	b _0238A9F8 ; case 36
	b _0238A9F8 ; case 37
	b _0238A9F8 ; case 38
	b _0238A9F8 ; case 39
	b _0238A9F0 ; case 40
	b _0238A9F0 ; case 41
_0238A968:
	ldrb r0, [r1, #9]
	cmp r0, #0
	ldrne r5, _0238AFAC ; =0x0000041E
	ldreq r5, _0238AFB0 ; =0x0000041F
	b _0238A9F8
_0238A97C:
	ldr r5, _0238AFB4 ; =0x00000425
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A988:
	ldr r5, _0238AFBC ; =0x00000426
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A994:
	ldr r5, _0238AFC0 ; =0x00000427
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9A0:
	ldr r5, _0238AFC4 ; =0x00000428
	rsb r4, r5, #0x3440
	b _0238A9F8
_0238A9AC:
	ldr r5, _0238AFC8 ; =0x00000429
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9B8:
	mov r5, #0x420
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9C4:
	ldr r5, _0238AFCC ; =0x00000422
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9D0:
	ldr r5, _0238AFD0 ; =0x00000421
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9DC:
	ldr r5, _0238AFD4 ; =0x00000423
	b _0238A9F8
_0238A9E4:
	ldr r5, _0238AFD8 ; =0x00000424
	ldr r4, _0238AFB8 ; =0x00003018
	b _0238A9F8
_0238A9F0:
	ldr r5, _0238AFDC ; =0x0000042A
	ldr r4, _0238AFB8 ; =0x00003018
_0238A9F8:
	ldrh r0, [r1, #0x7c]
	cmp r0, r5
	beq _0238AA30
	ldr r0, _0238AF9C ; =ov17_0238BE00
	strh r5, [r1, #0x7c]
	ldr r2, [r0]
	ldr r3, _0238AFE0 ; =0x00000186
	mov r1, r4
	str r3, [r2, #0x58]
	ldr r3, [r0]
	ldrsb r0, [r3]
	ldrh r2, [r3, #0x7c]
	add r3, r3, #0xc
	bl ShowMessageInDBox
_0238AA30:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #2
	beq _0238AABC
	ldrsb r1, [r1, #1]
	mvn r0, #1
	cmp r1, r0
	bne _0238AABC
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238AF9C ; =ov17_0238BE00
	ldr r1, _0238AFE0 ; =0x00000186
	ldr r3, [r2]
	strb r0, [r3, #1]
	ldr r0, [r2]
	add r0, r0, #0x5c
	bl InitPortraitBoxWithMonsterId
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x5c
	bl SetPortraitUnknownAttr
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x5c
	bl SetPortraitExpressionId
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r0]
	ldrsb r0, [r1, #1]
	add r1, r1, #0x5c
	bl ShowPortraitBox
_0238AABC:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #4
	beq _0238AB04
	ldrsb r1, [r1, #2]
	mvn r0, #1
	cmp r1, r0
	bne _0238AB04
	ldr r0, _0238AFE4 ; =0x0238BB34
	mov r2, #0
	ldr r1, _0238AFE8 ; =0x00300013
	ldr r3, _0238AFEC ; =0x0238BBB4
	str r2, [sp]
	bl CreateNormalMenu
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #2]
_0238AB04:
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r3, [r1]
	ldrh r0, [r3, #0x7e]
	tst r0, #0x10
	beq _0238AB5C
	ldrsb r2, [r3, #3]
	mvn r0, #1
	cmp r2, r0
	bne _0238AB5C
	mov r0, #1
	str r0, [r3, #0x1b4]
	mov r0, #0
	str r0, [sp]
	ldr r2, [r1]
	ldr r0, _0238AFF0 ; =0x0238BB54
	ldr r1, _0238AFF4 ; =0x00300033
	ldr r3, _0238AFF8 ; =0x0238BB84
	add r2, r2, #0x1b4
	bl CreateNormalMenu
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #3]
_0238AB5C:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r0, [r0]
	ldrh r0, [r0, #0x7e]
	tst r0, #0x20
	beq _0238AB94
	bl sub_0203A998
	cmp r0, #0
	bne _0238AB94
	ldr r1, _0238AF9C ; =ov17_0238BE00
	mov r0, #1
	ldr r1, [r1]
	add r1, r1, #0x5a
	add r1, r1, #0x200
	bl sub_02039C3C
_0238AB94:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r2, [r0]
	ldrh r0, [r2, #0x7e]
	tst r0, #8
	beq _0238AD90
	ldrsb r1, [r2, #4]
	mvn r0, #1
	cmp r1, r0
	bne _0238AD90
	add r0, r2, #0x200
	ldrsh r6, [r0, #0x58]
	mov r0, r6
	bl GetTeamMember
	mov r4, r0
	mov r0, r6
	bl sub_020564B0
	cmp r0, #0
	ldrne r7, _0238AFFC ; =0x0238BBD4
	bne _0238ACEC
	mov r0, r6
	bl IsMainCharacter
	mov r8, r0
	mov r0, r6
	bl sub_02056410
	mov r7, r0
	mov r5, #0
	bl GetGameMode
	cmp r0, #4
	beq _0238AC14
	bl GetGameMode
	cmp r0, #5
	bne _0238AC1C
_0238AC14:
	mov r5, #1
	b _0238AC28
_0238AC1C:
	ldrsh r0, [r4, #4]
	cmp r0, #0x214
	moveq r5, #1
_0238AC28:
	mov r0, #0x14
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0238AC84
	bl GetGameMode
	cmp r0, #3
	beq _0238AC84
	cmp r8, #0
	beq _0238AC5C
	cmp r7, #0
	ldrne r7, _0238B000 ; =0x0238BCCC
	ldreq r7, _0238B004 ; =0x0238BC2C
	b _0238ACEC
_0238AC5C:
	cmp r5, #0
	beq _0238AC74
	cmp r7, #0
	ldrne r7, _0238B000 ; =0x0238BCCC
	ldreq r7, _0238B004 ; =0x0238BC2C
	b _0238ACEC
_0238AC74:
	cmp r7, #0
	ldrne r7, _0238B008 ; =0x0238BD04
	ldreq r7, _0238B00C ; =0x0238BC94
	b _0238ACEC
_0238AC84:
	cmp r8, #0
	beq _0238ACC8
	bl GetGameMode
	cmp r0, #4
	beq _0238ACA4
	bl GetGameMode
	cmp r0, #5
	bne _0238ACC0
_0238ACA4:
	bl GetPartnerMemberIdx
	cmp r6, r0
	bne _0238ACC0
	cmp r7, #0
	ldrne r7, _0238B010 ; =0x0238BBFC
	ldreq r7, _0238B004 ; =0x0238BC2C
	b _0238ACEC
_0238ACC0:
	ldr r7, _0238AFFC ; =0x0238BBD4
	b _0238ACEC
_0238ACC8:
	cmp r5, #0
	beq _0238ACE0
	cmp r7, #0
	ldrne r7, _0238B010 ; =0x0238BBFC
	ldreq r7, _0238B004 ; =0x0238BC2C
	b _0238ACEC
_0238ACE0:
	cmp r7, #0
	ldrne r7, _0238B014 ; =0x0238BC5C
	ldreq r7, _0238B00C ; =0x0238BC94
_0238ACEC:
	mov r8, #0
	mov r4, r8
	mov r5, #3
	ldr sb, _0238AF9C ; =ov17_0238BE00
	b _0238AD4C
_0238AD00:
	mov r1, r8, lsl #3
	ldrh r0, [r7, r1]
	cmp r0, #0
	beq _0238AD54
	add r0, r7, r1
	ldr r0, [r0, #4]
	cmp r0, #6
	bne _0238AD3C
	mov r0, r6
	bl sub_02056F60
	cmp r0, #0
	ldreq r0, [sb]
	addeq r0, r0, r8
	streqb r5, [r0, #0x24c]
	beq _0238AD48
_0238AD3C:
	ldr r0, [sb]
	add r0, r0, r8
	strb r4, [r0, #0x24c]
_0238AD48:
	add r8, r8, #1
_0238AD4C:
	cmp r8, #0xc
	blt _0238AD00
_0238AD54:
	ldr r1, _0238AF9C ; =ov17_0238BE00
	mov r2, #0
	ldr r4, [r1]
	ldr r0, _0238B018 ; =0x0238BB44
	add r3, r4, #0x24c
	str r3, [r4, #0x17c]
	str r2, [sp]
	ldr r2, [r1]
	ldr r1, _0238B01C ; =0x00000213
	mov r3, r7
	add r2, r2, #0x11c
	bl CreateNormalMenu
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #4]
_0238AD90:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r2, [r0]
	ldrh r0, [r2, #0x7e]
	tst r0, #0x40
	beq _0238ADDC
	ldrsb r1, [r2, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238ADDC
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x58]
	add r0, sp, #0xac
	bl sub_0205B028
	add r0, sp, #0xac
	mov r1, #3
	bl sub_0203F150
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #5]
_0238ADDC:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x80
	beq _0238AE24
	ldrsb r1, [r1, #6]
	mvn r0, #1
	cmp r1, r0
	arm_func_end ov17_0238A754

	arm_func_start ov17_0238ADFC
ov17_0238ADFC: ; 0x0238ADFC
	bne _0238AE20
	mov r1, #0
	mov r2, r1
	mov r0, #8
	bl sub_0204018C
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _0238AE24
_0238AE20:
	bl sub_02041178
_0238AE24:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r3, [r0]
	ldrh r0, [r3, #0x7e]
	tst r0, #0x100
	beq _0238AE6C
	ldrsb r1, [r3, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238AE6C
	add r0, r3, #0x200
	ldrsh r2, [r0, #0x68]
	ldr r0, [r3, #0x264]
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #7]
_0238AE6C:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r0]
	ldrh r0, [r1, #0x7e]
	tst r0, #0x200
	beq _0238AEB4
	ldrsb r1, [r1, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0238AEB4
	ldr r0, _0238B020 ; =0x0238BB74
	mov r2, #0
	ldr r3, _0238B024 ; =0x0238BB9C
	mov r1, #0x13
	str r2, [sp]
	bl CreateNormalMenu
	ldr r1, _0238AF9C ; =ov17_0238BE00
	ldr r1, [r1]
	strb r0, [r1, #8]
_0238AEB4:
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x74]
	b _0238AF10
_0238AEC8:
	ldrh r0, [r4, #0x7e]
	tst r0, #1
	beq _0238AEE8
	ldrsb r0, [r4]
	bl IsDBoxActive
	cmp r0, #0
	movne r0, #0
	bne _0238AEEC
_0238AEE8:
	mov r0, #1
_0238AEEC:
	cmp r0, #0
	beq _0238AF10
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x74]
	ldr r1, [r0]
	ldr r0, [r1, #0x78]
	str r0, [r1, #0x70]
_0238AF10:
	mov r0, #1
	b _0238AF94
_0238AF18:
	bl sub_0203C874
	bl ov17_0238A364
	cmp r0, #0
	beq _0238AF90
	bl sub_0203C8E0
	cmp r0, #0
	bne _0238AF90
	bl sub_0203C940
	ldr r0, _0238AF9C ; =ov17_0238BE00
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x6c]
	b _0238AF90
_0238AF4C:
	mov r1, #3
	str r1, [r4, #0x6c]
	ldr r1, [r0]
	ldr r0, [r1, #0x260]
	cmp r0, #2
	bne _0238AF84
	ldr r0, [r1, #0x80]
	tst r0, #0x100
	beq _0238AF88
	ldr r0, [r1, #0x10c]
	ldr r2, [r1, #0x108]
	mov r1, #0
	blx r2
	b _0238AF88
_0238AF84:
	bl ov00_022E6E68
_0238AF88:
	mov r0, #4
	b _0238AF94
_0238AF90:
	mov r0, #1
_0238AF94:
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238AF9C: .word ov17_0238BE00
_0238AFA0: .word 0x0238BD44
_0238AFA4: .word 0x00003008
_0238AFA8: .word 0x0238BB64
_0238AFAC: .word 0x0000041E
_0238AFB0: .word 0x0000041F
_0238AFB4: .word 0x00000425
_0238AFB8: .word 0x00003018
_0238AFBC: .word 0x00000426
_0238AFC0: .word 0x00000427
_0238AFC4: .word 0x00000428
_0238AFC8: .word 0x00000429
_0238AFCC: .word 0x00000422
_0238AFD0: .word 0x00000421
_0238AFD4: .word 0x00000423
_0238AFD8: .word 0x00000424
_0238AFDC: .word 0x0000042A
_0238AFE0: .word 0x00000186
_0238AFE4: .word 0x0238BB34
_0238AFE8: .word 0x00300013
_0238AFEC: .word 0x0238BBB4
_0238AFF0: .word 0x0238BB54
_0238AFF4: .word 0x00300033
_0238AFF8: .word 0x0238BB84
_0238AFFC: .word 0x0238BBD4
_0238B000: .word 0x0238BCCC
_0238B004: .word 0x0238BC2C
_0238B008: .word 0x0238BD04
_0238B00C: .word 0x0238BC94
_0238B010: .word 0x0238BBFC
_0238B014: .word 0x0238BC5C
_0238B018: .word 0x0238BB44
_0238B01C: .word 0x00000213
_0238B020: .word 0x0238BB74
_0238B024: .word 0x0238BB9C
	arm_func_end ov17_0238ADFC

	arm_func_start ov17_0238B028
ov17_0238B028: ; 0x0238B028
	ldr r1, _0238B044 ; =ov17_0238BE00
	mov r3, #3
	ldr r2, [r1]
	str r3, [r2, #0x74]
	ldr r1, [r1]
	str r0, [r1, #0x78]
	bx lr
	.align 2, 0
_0238B044: .word ov17_0238BE00
	arm_func_end ov17_0238B028

	arm_func_start ov17_0238B048
ov17_0238B048: ; 0x0238B048
	ldr r0, _0238B074 ; =ov17_0238BE00
	mov r2, #3
	ldr r1, [r0]
	ldr r3, _0238B078 ; =0x00000186
	strh r2, [r1, #0x7e]
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B074: .word ov17_0238BE00
_0238B078: .word 0x00000186
	arm_func_end ov17_0238B048

	arm_func_start ov17_0238B07C
ov17_0238B07C: ; 0x0238B07C
	stmdb sp!, {r3, lr}
	ldr r0, _0238B0B0 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0238B09C
	bl GetMainCharacter1MemberIdx
	bl sub_0203C7E4
_0238B09C:
	ldr r0, _0238B0B0 ; =ov17_0238BE00
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B0B0: .word ov17_0238BE00
	arm_func_end ov17_0238B07C

	arm_func_start ov17_0238B0B4
ov17_0238B0B4: ; 0x0238B0B4
	stmdb sp!, {r3, lr}
	ldr r0, _0238B108 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0238B0E8
	bl sub_0203C910
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _0238B108 ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
_0238B0E8:
	ldr r0, _0238B108 ; =ov17_0238BE00
	mov r3, #7
	ldr r2, [r0]
	mov r1, #3
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B108: .word ov17_0238BE00
	arm_func_end ov17_0238B0B4

	arm_func_start ov17_0238B10C
ov17_0238B10C: ; 0x0238B10C
	stmdb sp!, {r3, lr}
	ldr r0, _0238B190 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl IsNormalMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B190 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl GetNormalMenuResult
	cmp r0, #2
	beq _0238B150
	cmp r0, #3
	beq _0238B15C
	cmp r0, #4
	b _0238B184
_0238B150:
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B15C:
	bl GetGameMode
	cmp r0, #4
	cmpne r0, #5
	bne _0238B178
	mov r0, #9
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B178:
	mov r0, #6
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B184:
	mov r0, #4
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B190: .word ov17_0238BE00
	arm_func_end ov17_0238B10C

	arm_func_start ov17_0238B194
ov17_0238B194: ; 0x0238B194
	ldr r0, _0238B1B4 ; =ov17_0238BE00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #5
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B1B4: .word ov17_0238BE00
	arm_func_end ov17_0238B194

	arm_func_start ov17_0238B1B8
ov17_0238B1B8: ; 0x0238B1B8
	stmdb sp!, {r3, lr}
	ldr r0, _0238B1E4 ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #0x7e]
	bl ov17_0238A278
	ldr r0, _0238B1E4 ; =ov17_0238BE00
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x6c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B1E4: .word ov17_0238BE00
	arm_func_end ov17_0238B1B8

	arm_func_start ov17_0238B1E8
ov17_0238B1E8: ; 0x0238B1E8
	ldr r0, _0238B208 ; =ov17_0238BE00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #7
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B208: .word ov17_0238BE00
	arm_func_end ov17_0238B1E8

	arm_func_start ov17_0238B20C
ov17_0238B20C: ; 0x0238B20C
	ldr r0, _0238B220 ; =ov17_0238BE00
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B220: .word ov17_0238BE00
	arm_func_end ov17_0238B20C

	arm_func_start ov17_0238B224
ov17_0238B224: ; 0x0238B224
	ldr r0, _0238B238 ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B238: .word ov17_0238BE00
	arm_func_end ov17_0238B224

	arm_func_start ov17_0238B23C
ov17_0238B23C: ; 0x0238B23C
	ldr r0, _0238B25C ; =ov17_0238BE00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0xa
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B25C: .word ov17_0238BE00
	arm_func_end ov17_0238B23C

	arm_func_start ov17_0238B260
ov17_0238B260: ; 0x0238B260
	ldr r0, _0238B274 ; =ov17_0238BE00
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B274: .word ov17_0238BE00
	arm_func_end ov17_0238B260

	arm_func_start ov17_0238B278
ov17_0238B278: ; 0x0238B278
	ldr r0, _0238B28C ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B28C: .word ov17_0238BE00
	arm_func_end ov17_0238B278

	arm_func_start ov17_0238B290
ov17_0238B290: ; 0x0238B290
	ldr r0, _0238B2B0 ; =ov17_0238BE00
	mov r3, #0x20
	ldr r2, [r0]
	mov r1, #0xd
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B2B0: .word ov17_0238BE00
	arm_func_end ov17_0238B290

	arm_func_start ov17_0238B2B4
ov17_0238B2B4: ; 0x0238B2B4
	stmdb sp!, {r3, lr}
	bl sub_0203A5A8
	cmp r0, #0
	beq _0238B31C
	bl sub_0203A9EC
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl sub_02017CCC
	bl sub_0203AAB0
	ldr r1, _0238B368 ; =ov17_0238BE00
	ldr r1, [r1]
	add r1, r1, #0x200
	strh r0, [r1, #0x58]
	bl sub_0203A5F0
	ldr r0, _0238B368 ; =ov17_0238BE00
	mov r1, #0x1e
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
_0238B31C:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _0238B33C
	bl sub_0203A51C
	mov r0, #0
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B33C:
	ldr r2, _0238B368 ; =ov17_0238BE00
	ldr r1, [r2]
	add r1, r1, #0x200
	strh r0, [r1, #0x58]
	ldr r0, [r2]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_0203FA64
	mov r0, #0xe
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B368: .word ov17_0238BE00
	arm_func_end ov17_0238B2B4

	arm_func_start ov17_0238B36C
ov17_0238B36C: ; 0x0238B36C
	ldr r0, _0238B38C ; =ov17_0238BE00
	mov r3, #0x28
	ldr r2, [r0]
	mov r1, #0xf
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B38C: .word ov17_0238BE00
	arm_func_end ov17_0238B36C

	arm_func_start ov17_0238B390
ov17_0238B390: ; 0x0238B390
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0238B4CC ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl IsNormalMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _0238B4CC ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetNormalMenuResult
	sub r0, r0, #5
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0238B4BC
_0238B3CC: ; jump table
	b _0238B3EC ; case 0
	b _0238B3F8 ; case 1
	b _0238B46C ; case 2
	b _0238B478 ; case 3
	b _0238B484 ; case 4
	b _0238B490 ; case 5
	b _0238B49C ; case 6
	b _0238B4BC ; case 7
_0238B3EC:
	mov r0, #0x10
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B3F8:
	mov sl, #0
	ldr r6, _0238B4CC ; =ov17_0238BE00
	ldr r4, _0238B4D0 ; =0x0000022B
	ldr r7, _0238B4D4 ; =0x020B0A48
	mov r8, sl
	mov sb, #1
	mov r5, #0x44
_0238B414:
	smulbb r0, sl, r5
	ldr r1, [r7]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	ldrne r0, [r6]
	addne r0, r0, #0x200
	ldrnesh r0, [r0, #0x58]
	cmpne r0, sl
	beq _0238B44C
	mov r0, sl
	bl sub_02056410
_0238B44C:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov sl, r0, asr #0x10
	bgt _0238B414
	mov r0, #0x13
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B46C:
	mov r0, #0x15
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B478:
	mov r0, #0x18
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B484:
	mov r0, #0x1e
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B490:
	mov r0, #0x20
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B49C:
	ldr r0, _0238B4CC ; =ov17_0238BE00
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x22
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0238B4BC:
	bl sub_0203A638
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238B4CC: .word ov17_0238BE00
_0238B4D0: .word 0x0000022B
_0238B4D4: .word 0x020B0A48
	arm_func_end ov17_0238B390

	arm_func_start ov17_0238B4D8
ov17_0238B4D8: ; 0x0238B4D8
	ldr r1, _0238B50C ; =ov17_0238BE00
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0x11
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B50C: .word ov17_0238BE00
	arm_func_end ov17_0238B4D8

	arm_func_start ov17_0238B510
ov17_0238B510: ; 0x0238B510
	stmdb sp!, {r3, lr}
	mov r0, #5
	bl sub_02017C50
	ldr r0, _0238B530 ; =ov17_0238BE00
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B530: .word ov17_0238BE00
	arm_func_end ov17_0238B510

	arm_func_start ov17_0238B534
ov17_0238B534: ; 0x0238B534
	stmdb sp!, {r3, lr}
	mov r0, #5
	bl sub_02017C10
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B578 ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_02056754
	bl sub_02057444
	bl ov11_022DC504
	ldr r0, _0238B578 ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B578: .word ov17_0238BE00
	arm_func_end ov17_0238B534

	arm_func_start ov17_0238B57C
ov17_0238B57C: ; 0x0238B57C
	stmdb sp!, {r3, lr}
	ldr r1, _0238B5D8 ; =ov17_0238BE00
	mov r3, #3
	ldr r0, [r1]
	add r2, r3, #0x1400
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x30]
	ldr r0, [r1]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_02056554
	bl sub_02057444
	ldr r0, _0238B5D8 ; =ov17_0238BE00
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B5D8: .word ov17_0238BE00
	arm_func_end ov17_0238B57C

	arm_func_start ov17_0238B5DC
ov17_0238B5DC: ; 0x0238B5DC
	stmdb sp!, {r3, lr}
	bl ov11_022DC504
	ldr r0, _0238B5F8 ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B5F8: .word ov17_0238BE00
	arm_func_end ov17_0238B5DC

	arm_func_start ov17_0238B5FC
ov17_0238B5FC: ; 0x0238B5FC
	stmdb sp!, {r3, lr}
	ldr r1, _0238B684 ; =ov17_0238BE00
	mov r3, #3
	ldr r2, [r1]
	mov r0, #7
	strh r3, [r2, #0x7e]
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrsh r1, [r1, #0x58]
	orr r1, r1, #0x20000
	str r1, [r2, #0xc]
	bl sub_02017C10
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B684 ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _0238B670
	bl sub_02058138
	ldr r0, _0238B684 ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_020566C4
	bl sub_02057444
_0238B670:
	ldr r0, _0238B684 ; =ov17_0238BE00
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B684: .word ov17_0238BE00
	arm_func_end ov17_0238B5FC

	arm_func_start ov17_0238B688
ov17_0238B688: ; 0x0238B688
	stmdb sp!, {r3, lr}
	mov r0, #7
	bl sub_02017C50
	ldr r0, _0238B6A8 ; =ov17_0238BE00
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B6A8: .word ov17_0238BE00
	arm_func_end ov17_0238B688

	arm_func_start ov17_0238B6AC
ov17_0238B6AC: ; 0x0238B6AC
	stmdb sp!, {r3, lr}
	mov r0, #7
	bl sub_02017C10
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B6D8 ; =ov17_0238BE00
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bl ov11_022DC504
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B6D8: .word ov17_0238BE00
	arm_func_end ov17_0238B6AC

	arm_func_start ov17_0238B6DC
ov17_0238B6DC: ; 0x0238B6DC
	ldr r1, _0238B710 ; =ov17_0238BE00
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0x19
	strh r3, [r0, #0x7e]
	ldr r3, [r1]
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x58]
	orr r0, r0, #0x20000
	str r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B710: .word ov17_0238BE00
	arm_func_end ov17_0238B6DC

	arm_func_start ov17_0238B714
ov17_0238B714: ; 0x0238B714
	ldr r0, _0238B734 ; =ov17_0238BE00
	mov r3, #0x13
	ldr r2, [r0]
	mov r1, #0x1a
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B734: .word ov17_0238BE00
	arm_func_end ov17_0238B714

	arm_func_start ov17_0238B738
ov17_0238B738: ; 0x0238B738
	stmdb sp!, {r3, lr}
	ldr r0, _0238B7A4 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl IsNormalMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238B7A4 ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetNormalMenuResult
	cmp r0, #0
	beq _0238B780
	cmp r0, #1
	ldmneia sp!,  {r3, pc}
	mov r0, #0
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
_0238B780:
	ldr r1, _0238B7A4 ; =ov17_0238BE00
	mov r0, #0x1b
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrsh r1, [r1, #0x58]
	orr r1, r1, #0x20000
	str r1, [r2, #0xc]
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B7A4: .word ov17_0238BE00
	arm_func_end ov17_0238B738

	arm_func_start ov17_0238B7A8
ov17_0238B7A8: ; 0x0238B7A8
	ldr r0, _0238B7C8 ; =ov17_0238BE00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x1c
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B7C8: .word ov17_0238BE00
	arm_func_end ov17_0238B7A8

	arm_func_start ov17_0238B7CC
ov17_0238B7CC: ; 0x0238B7CC
	stmdb sp!, {r3, lr}
	ldr r1, _0238B850 ; =ov17_0238BE00
	mov r0, #3
	ldr r1, [r1]
	strh r0, [r1, #0x7e]
	bl sub_02017C50
	ldr r0, _0238B850 ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _0238B81C
	bl sub_02058138
	ldr r0, _0238B850 ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_020566C4
_0238B81C:
	ldr r0, _0238B850 ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_02055B20
	bl sub_0203C9C4
	bl sub_0203AF0C
	bl sub_02057180
	ldr r0, _0238B850 ; =ov17_0238BE00
	mov r1, #0x1d
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B850: .word ov17_0238BE00
	arm_func_end ov17_0238B7CC

	arm_func_start ov17_0238B854
ov17_0238B854: ; 0x0238B854
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl sub_02017C10
	cmp r0, #0
	ldreq r0, _0238B878 ; =ov17_0238BE00
	moveq r1, #0
	ldreq r0, [r0]
	streq r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B878: .word ov17_0238BE00
	arm_func_end ov17_0238B854

	arm_func_start ov17_0238B87C
ov17_0238B87C: ; 0x0238B87C
	ldr r0, _0238B89C ; =ov17_0238BE00
	mov r3, #0x40
	ldr r2, [r0]
	mov r1, #0x1f
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B89C: .word ov17_0238BE00
	arm_func_end ov17_0238B87C

	arm_func_start ov17_0238B8A0
ov17_0238B8A0: ; 0x0238B8A0
	stmdb sp!, {r3, lr}
	bl sub_0203F398
	cmp r0, #1
	ldmneia sp!,  {r3, pc}
	bl sub_0203F990
	ldr r0, _0238B8D0 ; =ov17_0238BE00
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xc
	strb r2, [r1, #5]
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B8D0: .word ov17_0238BE00
	arm_func_end ov17_0238B8A0

	arm_func_start ov17_0238B8D4
ov17_0238B8D4: ; 0x0238B8D4
	ldr r0, _0238B8F4 ; =ov17_0238BE00
	mov r3, #0x80
	ldr r2, [r0]
	mov r1, #0x21
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B8F4: .word ov17_0238BE00
	arm_func_end ov17_0238B8D4

	arm_func_start ov17_0238B8F8
ov17_0238B8F8: ; 0x0238B8F8
	stmdb sp!, {r4, lr}
	bl sub_020407EC
	movs r4, r0
	beq _0238B91C
	ldr r0, _0238B95C ; =ov17_0238BE00
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x58]
	bl sub_0203FD80
_0238B91C:
	cmp r4, #1
	beq _0238B944
	cmp r4, #2
	beq _0238B938
	cmp r4, #7
	beq _0238B950
	ldmia sp!, {r4, pc}
_0238B938:
	mov r0, #0x24
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
_0238B944:
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
_0238B950:
	mov r0, #0x26
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238B95C: .word ov17_0238BE00
	arm_func_end ov17_0238B8F8

	arm_func_start ov17_0238B960
ov17_0238B960: ; 0x0238B960
	stmdb sp!, {r3, lr}
	ldr r1, _0238B9AC ; =ov17_0238BE00
	ldr r0, _0238B9B0 ; =0x020B0A48
	ldr r2, [r1]
	ldr r1, [r0]
	add r0, r2, #0x200
	ldrsh r2, [r0, #0x58]
	mov r0, #0x44
	mov r3, #0
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	bl PrintIqSkillsMenu
	ldr r0, _0238B9AC ; =ov17_0238BE00
	mov r1, #0x23
	ldr r0, [r0]
	str r1, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B9AC: .word ov17_0238BE00
_0238B9B0: .word 0x020B0A48
	arm_func_end ov17_0238B960

	arm_func_start ov17_0238B9B4
ov17_0238B9B4: ; 0x0238B9B4
	stmdb sp!, {r3, lr}
	bl sub_02041B7C
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl sub_020420F4
	bl sub_020572EC
	mov r0, #0xc
	bl ov17_0238B028
	ldmia sp!, {r3, pc}
	arm_func_end ov17_0238B9B4

	arm_func_start ov17_0238B9D8
ov17_0238B9D8: ; 0x0238B9D8
	ldr r0, _0238B9F8 ; =ov17_0238BE00
	mov r3, #0x280
	ldr r2, [r0]
	mov r1, #0x25
	strh r3, [r2, #0x7e]
	ldr r0, [r0]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
_0238B9F8: .word ov17_0238BE00
	arm_func_end ov17_0238B9D8

	arm_func_start ov17_0238B9FC
ov17_0238B9FC: ; 0x0238B9FC
	stmdb sp!, {r4, lr}
	ldr r0, _0238BA7C ; =ov17_0238BE00
	mov r4, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl IsNormalMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	ldr r0, _0238BA7C ; =ov17_0238BE00
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl GetNormalMenuResult
	cmp r0, #3
	beq _0238BA3C
	cmp r0, #4
	b _0238BA48
_0238BA3C:
	mov r0, #0x26
	bl ov17_0238B028
	b _0238BA4C
_0238BA48:
	mov r4, #1
_0238BA4C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _0238BA7C ; =ov17_0238BE00
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _0238BA70
	bl sub_020307EC
_0238BA70:
	mov r0, #0x20
	bl ov17_0238B028
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238BA7C: .word ov17_0238BE00
	arm_func_end ov17_0238B9FC
	; 0x0238BA80

	.byte 0x08, 0x40, 0x2D, 0xE9, 0xAB, 0xD0, 0xF2, 0xEB, 0x34, 0x10, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5
	.byte 0x64, 0x02, 0x81, 0xE5, 0x7E, 0xD5, 0xF2, 0xEB, 0x24, 0x20, 0x9F, 0xE5, 0x01, 0xCC, 0xA0, 0xE3
	.byte 0x00, 0x10, 0x92, 0xE5, 0x27, 0x30, 0xA0, 0xE3, 0x02, 0x1C, 0x81, 0xE2, 0xB8, 0x06, 0xC1, 0xE1
	.byte 0x00, 0x00, 0x92, 0xE5, 0xBE, 0xC7, 0xC0, 0xE1, 0x00, 0x00, 0x92, 0xE5, 0x78, 0x30, 0x80, 0xE5
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x00, 0xBE, 0x38, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0xD1, 0xD7, 0xF2, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x08, 0x20, 0x00, 0xA0, 0xE3, 0x51, 0xFD, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x2C, 0x10, 0x9F, 0xE5, 0x03, 0x30, 0xA0, 0xE3, 0x00, 0x00, 0x91, 0xE5
	.byte 0x29, 0x20, 0xA0, 0xE3, 0xBE, 0x37, 0xC0, 0xE1, 0x00, 0x30, 0x91, 0xE5, 0x02, 0x0C, 0x83, 0xE2
	.byte 0xF8, 0x05, 0xD0, 0xE1, 0x02, 0x08, 0x80, 0xE3, 0x0C, 0x00, 0x83, 0xE5, 0x00, 0x00, 0x91, 0xE5
	.byte 0x78, 0x20, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0x00, 0xBE, 0x38, 0x02, 0x0C, 0x00, 0x9F, 0xE5
	.byte 0x0C, 0x10, 0xA0, 0xE3, 0x00, 0x00, 0x90, 0xE5, 0x78, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x00, 0xBE, 0x38, 0x02, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x02, 0x0B, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x11, 0x1C, 0x05, 0x00, 0xFD, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x11, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x04, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x04, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x15, 0x04, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x13, 0x04, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x04, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x15, 0x04, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x18, 0x04, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x17, 0x04, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x18, 0x04, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x19, 0x04, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x17, 0x04, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x19, 0x04, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x16, 0x04, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x18, 0x04, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x16, 0x04, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x18, 0x04, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x19, 0x04, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x1C, 0x04, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x1D, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x48, 0xB0, 0x38, 0x02, 0x7C, 0xB0, 0x38, 0x02, 0xB4, 0xB0, 0x38, 0x02
	.byte 0x0C, 0xB1, 0x38, 0x02, 0x94, 0xB1, 0x38, 0x02, 0xB8, 0xB1, 0x38, 0x02, 0xE8, 0xB1, 0x38, 0x02
	.byte 0x0C, 0xB2, 0x38, 0x02, 0x24, 0xB2, 0x38, 0x02, 0x3C, 0xB2, 0x38, 0x02, 0x60, 0xB2, 0x38, 0x02
	.byte 0x78, 0xB2, 0x38, 0x02, 0x90, 0xB2, 0x38, 0x02, 0xB4, 0xB2, 0x38, 0x02, 0x6C, 0xB3, 0x38, 0x02
	.byte 0x90, 0xB3, 0x38, 0x02, 0xD8, 0xB4, 0x38, 0x02, 0x10, 0xB5, 0x38, 0x02, 0x34, 0xB5, 0x38, 0x02
	.byte 0x7C, 0xB5, 0x38, 0x02, 0xDC, 0xB5, 0x38, 0x02, 0xFC, 0xB5, 0x38, 0x02, 0x88, 0xB6, 0x38, 0x02
	.byte 0xAC, 0xB6, 0x38, 0x02, 0xDC, 0xB6, 0x38, 0x02, 0x14, 0xB7, 0x38, 0x02, 0x38, 0xB7, 0x38, 0x02
	.byte 0xA8, 0xB7, 0x38, 0x02, 0xCC, 0xB7, 0x38, 0x02, 0x54, 0xB8, 0x38, 0x02, 0x7C, 0xB8, 0x38, 0x02
	.byte 0xA0, 0xB8, 0x38, 0x02, 0xD4, 0xB8, 0x38, 0x02, 0xF8, 0xB8, 0x38, 0x02, 0x60, 0xB9, 0x38, 0x02
	.byte 0xB4, 0xB9, 0x38, 0x02, 0xD8, 0xB9, 0x38, 0x02, 0xFC, 0xB9, 0x38, 0x02, 0x80, 0xBA, 0x38, 0x02
	.byte 0xC8, 0xBA, 0x38, 0x02, 0xE4, 0xBA, 0x38, 0x02, 0x1C, 0xBB, 0x38, 0x02
	
	.data
	.global ov17_0238BE00
ov17_0238BE00:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
