	.include "asm/macros.inc"
	.include "overlay_10_022BCDF4.inc"

	.text

	arm_func_start ov10_022BCDF4
ov10_022BCDF4: ; 0x022BCDF4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r1, #0
	strb r0, [r4, #0x1a0]
	mov r0, r5
	strb r1, [r4, #0x1a1]
	sub r1, r1, #4
	bl sub_0202830C
	ldr r0, [r4, #0xf8]
	tst r0, #0x400000
	beq _022BCE38
	mov r0, r5
	add r1, r4, #4
	bl sub_02028980
_022BCE38:
	mov r0, #5
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov10_022BCDF4

	arm_func_start ov10_022BCE44
ov10_022BCE44: ; 0x022BCE44
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02033414
	ldmia sp!, {r3, pc}
	arm_func_end ov10_022BCE44

	arm_func_start PopInventoryMenuField0x1A3
PopInventoryMenuField0x1A3: ; 0x022BCE58
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r2, [r0, #0x1a3]
	mov r1, #0
	strb r1, [r0, #0x1a3]
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end PopInventoryMenuField0x1A3

	arm_func_start UpdateInventoryMenu
UpdateInventoryMenu: ; 0x022BCE74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x30
	mov r8, r0
	ldr r4, [r8, #0xc]
	ldr r0, [r4, #0xf8]
	tst r0, #0x2000
	movne r1, #1
	moveq r1, #0
	ldrsb r0, [r8, #0x10]
	and r5, r1, #0xff
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02033414
	cmp r0, #0
	beq _022BCEC8
	ldr r0, [r4, #0xf8]
	bic r0, r0, #0x2000
	str r0, [r4, #0xf8]
	ldr r0, [r4, #0x14]
	bic r0, r0, #0x2000
	str r0, [r4, #0x14]
_022BCEC8:
	ldr r0, [r4, #0x19c]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022BD200
_022BCED8: ; jump table
	b _022BCEF4 ; case 0
	b _022BCF0C ; case 1
	b _022BCF34 ; case 2
	b _022BCF8C ; case 3
	b _022BD170 ; case 4
	b _022BD190 ; case 5
	b _022BD1D4 ; case 6
_022BCEF4:
	ldrsb r0, [r8, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _022BD200
	mov r0, #2
	str r0, [r4, #0x19c]
_022BCF0C:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _022BCF34
	ldrb r0, [r8, #8]
	bl sub_020287C4
	ldrsb r0, [r8, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _022BD200
_022BCF34:
	mov r0, r8
	bl ov10_022BD22C
	ldr r0, [r4, #0xf8]
	tst r0, #0x800000
	beq _022BCF6C
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	sub r0, r0, #4
	str r0, [r8, #0xb8]
	b _022BD200
_022BCF6C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	sub r0, r0, #1
	str r0, [r8, #0xb8]
	b _022BD200
_022BCF8C:
	ldrsb r0, [r8, #0x10]
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02033414
	mov r7, r0
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02032BB8
	ldr r1, [sp, #8]
	mov r6, r0
	cmp r1, #0
	bne _022BD010
	ldr r0, [r4, #0xf8]
	tst r0, #1
	beq _022BD010
	mov r3, #0
	ldr r2, _022BD228 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032E0C
	movs r1, r0
	bmi _022BD010
	add r0, r4, #4
	bl sub_020330EC
	ldr r0, [sp, #8]
	mov r6, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_022BD010:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022BD030
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033F30
	orr r6, r6, r0
_022BD030:
	add r0, r4, #4
	bl sub_02033064
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_02032F5C
	orrs r0, r6, r0
	beq _022BD05C
	mov r0, r8
	bl ov10_022BD22C
_022BD05C:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _022BD0C4
	add r0, r4, #4
	bl sub_02032FD8
	cmp r0, #0
	beq _022BD0B4
	ldr r0, [r4, #0xf8]
	tst r0, #0x80000000
	bne _022BD090
	add r0, r4, #4
	mov r1, #0
	bl sub_020333D8
_022BD090:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	sub r0, r0, #4
	str r0, [r8, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _022BD138
_022BD0B4:
	add r0, r4, #4
	mov r1, #2
	bl sub_020333D8
	b _022BD138
_022BD0C4:
	tst r0, #2
	beq _022BD0F8
	add r0, r4, #4
	mov r1, #1
	bl sub_020333D8
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	sub r0, r0, #6
	str r0, [r8, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _022BD138
_022BD0F8:
	tst r0, #0x1000
	beq _022BD138
	ldr r0, [r4, #0xf8]
	tst r0, #0x2000
	beq _022BD138
	add r0, r4, #4
	mov r1, #5
	bl sub_020333D8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	sub r0, r0, #4
	str r0, [r8, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
_022BD138:
	ldrsb r0, [r8, #0x10]
	add r1, r4, #4
	bl sub_02028980
	cmp r5, #0
	beq _022BD200
	ldrsb r0, [r8, #0x10]
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02033414
	cmp r7, r0
	beq _022BD200
	ldrsb r0, [r8, #0x10]
	bl ov10_022BCCB0
	b _022BD200
_022BD170:
	add r0, r4, #4
	bl sub_02032DB0
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r4, #0x1a3]
	moveq r0, #3
	streq r0, [r4, #0x19c]
	b _022BD200
_022BD190:
	add r0, r4, #4
	bl sub_02032DB0
	cmp r0, #0
	bne _022BD200
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _022BD1CC
	ldr r0, [r4, #0xf8]
	tst r0, #0x400000
	beq _022BD1CC
	mov r0, r8
	bl ov10_022BD22C
	mov r0, #8
	str r0, [r4, #0x19c]
	b _022BD200
_022BD1CC:
	mov r0, #6
	str r0, [r4, #0x19c]
_022BD1D4:
	ldrsb r0, [r8, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _022BD200
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r8, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_022BD200:
	cmp r5, #0
	beq _022BD220
	ldr r0, [r4, #0xf8]
	orr r0, r0, #0x2000
	str r0, [r4, #0xf8]
	ldr r0, [r4, #0x14]
	orr r0, r0, #0x2000
	str r0, [r4, #0x14]
_022BD220:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022BD228: .word 0x00000408
	arm_func_end UpdateInventoryMenu

	arm_func_start ov10_022BD22C
ov10_022BD22C: ; 0x022BD22C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	sub sp, sp, #0x400
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02033054
	ldr r1, [r4, #0xf8]
	mov r5, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x15c]
	ldr r6, [r4, #0xc4]
	addne r8, r0, r5
	ldrsb r0, [sl, #0x10]
	moveq r8, #0
	bl sub_02027B1C
	add r0, r4, #4
	bl sub_02033414
	cmp r0, #0
	beq _022BD2C4
	ldr r2, [r4, #0x198]
	ldr r3, [r4, #0x194]
	add r0, sp, #4
	mvn r1, #0
	blx r3
	movs r5, r0
	beq _022BD354
	add r0, r4, #4
	mov r1, #0
	bl sub_02033350
	mov r1, #0x44
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r3, r5
	mov r1, #0xe
	bl sub_020263C8
	b _022BD354
_022BD2C4:
	cmp r6, #0
	mov r7, #0
	ble _022BD354
	b _022BD34C
_022BD2D4:
	ldr r2, [r4, #0x198]
	ldr r3, [r4, #0x194]
	add r0, sp, #4
	mov r1, r5
	blx r3
	mov fp, r0
	mov r1, #0
	cmp r8, #0
	beq _022BD308
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_022BD308:
	cmp fp, #0
	beq _022BD344
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	add r0, r4, #4
	mov r1, r7
	bl sub_02033350
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r3, fp
	mov r1, #7
	bl sub_020263C8
_022BD344:
	add r7, r7, #1
	add r5, r5, #1
_022BD34C:
	cmp r7, r6
	blt _022BD2D4
_022BD354:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A0B0
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #4
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov10_022BD22C

	arm_func_start IsInventoryMenuState3
IsInventoryMenuState3: ; 0x022BD374
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsInventoryMenuState3

	arm_func_start ov10_022BD394
ov10_022BD394: ; 0x022BD394
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r1, r1, lsl #0x10
	mov r4, r0
	mov r0, r1, asr #0x10
	mov r7, r2
	mov r6, r3
	bl GetItemAtIdx
	mov r5, r0
	ldrb r0, [r5]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022BD428
	mov ip, #1
	ldr r2, _022BD43C ; =ov10_022C43A4
	add r0, sp, #4
	mov r1, r5
	mov r3, r7
	str ip, [sp]
	bl MaybeGetFormattedItemName
	ldrb r0, [r5, #1]
	cmp r0, #0
	ldrneb r2, [r6, r0]
	cmpne r2, #0
	beq _022BD414
	ldr r1, _022BD440 ; =ov10_022C43F0
	add r3, sp, #4
	mov r0, r4
	bl SprintfStatic__022BD44C
	b _022BD434
_022BD414:
	ldr r1, _022BD444 ; =ov10_022C43F8
	add r2, sp, #4
	mov r0, r4
	bl SprintfStatic__022BD44C
	b _022BD434
_022BD428:
	ldr r1, _022BD448 ; =ov10_022C4404
	mov r0, r4
	bl strcpy
_022BD434:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022BD43C: .word ov10_022C43A4
_022BD440: .word ov10_022C43F0
_022BD444: .word ov10_022C43F8
_022BD448: .word ov10_022C4404
	arm_func_end ov10_022BD394

	arm_func_start SprintfStatic__022BD44C
SprintfStatic__022BD44C: ; 0x022BD44C
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
	arm_func_end SprintfStatic__022BD44C

	arm_func_start CreateInventoryMenuOuter
CreateInventoryMenuOuter: ; 0x022BD474
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xa8
#ifdef JAPAN
	ldr lr, _022BECF4 ; =0x00001D38
#endif
	mov ip, #0
	mov r7, #0x10
	mov r6, #0xd
#ifndef JAPAN
	mov lr, #0x8e0
#endif
	mov r5, r0
	mov r4, r1
	str r7, [sp, #0x1c]
	str r2, [sp, #0x10]
	str r3, [sp, #0x70]
	str r6, [sp, #0x14]
	strh lr, [sp, #0x18]
	str ip, [sp, #0x84]
	str ip, [sp, #0x8c]
	bl GetCurrentBagCapacity
	cmp r0, #2
	bge _022BD508
	cmp r4, #0
	movne r5, #0
	ldr r2, [sp, #0xc4]
	moveq r5, #0x2000
	cmp r4, #0
	ldrne r0, _022BD554 ; =ov10_022C43C0
	ldr r1, _022BD558 ; =0x00481C33
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldrb r4, [sp, #0xc8]
	ldreq r0, _022BD55C ; =ov10_022C43D0
	ldr r3, [sp, #0xc0]
	add r2, sp, #0x10
	orr r1, r5, r1
	str r4, [sp, #0xc]
	bl CreateInventoryMenu
	b _022BD54C
_022BD508:
	cmp r4, #0
	movne r6, #0
	ldr r2, [sp, #0xc4]
	moveq r6, #0x2000
	cmp r4, #0
	ldrne r0, _022BD560 ; =ov10_022C43E0
	ldr r1, _022BD564 ; =0x00489E33
	stmia sp, {r2, r5}
	mov r2, #8
	str r2, [sp, #8]
	ldrb r4, [sp, #0xc8]
	ldreq r0, _022BD568 ; =ov10_022C43B0
	ldr r3, [sp, #0xc0]
	add r2, sp, #0x10
	orr r1, r6, r1
	str r4, [sp, #0xc]
	bl CreateInventoryMenu
_022BD54C:
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_022BECF4: .word 0x00001D38
#endif
_022BD554: .word ov10_022C43C0
_022BD558: .word 0x00481C33
_022BD55C: .word ov10_022C43D0
_022BD560: .word ov10_022C43E0
_022BD564: .word 0x00489E33
_022BD568: .word ov10_022C43B0
	arm_func_end CreateInventoryMenuOuter

	arm_func_start ov10_022BD56C
ov10_022BD56C: ; 0x022BD56C
	stmdb sp!, {r3, lr}
	ldr r0, _022BD5A8 ; =ov10_022DC220
	ldr r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0xa4
	mov r1, #8
	bl MemAlloc
	ldr r1, _022BD5A8 ; =ov10_022DC220
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	ldr r0, [r1]
	str r2, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD5A8: .word ov10_022DC220
	arm_func_end ov10_022BD56C

	arm_func_start ov10_022BD5AC
ov10_022BD5AC: ; 0x022BD5AC
	stmdb sp!, {r3, lr}
	ldr r0, _022BD710 ; =ov10_022DC220
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022BD708
_022BD5C8: ; jump table
	b _022BD67C ; case 0
	b _022BD6AC ; case 1
	b _022BD6C8 ; case 2
	b _022BD700 ; case 3
	b _022BD700 ; case 4
_022BD5DC:
	ldr r0, _022BD714 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x68
	ldr r0, [r0]
	ldr r2, _022BD710 ; =ov10_022DC220
	add r0, r0, #0x9000
	ldr r0, [r0, #0x84c]
	mla r0, r3, r1, r0
	str r0, [ip, #0x4c]
	ldr r0, [r2]
	ldr r0, [r0, #0x4c]
	ldrsh r0, [r0, #8]
	bl sub_020562B8
	cmp r0, #0
	beq _022BD668
	ldr r0, _022BD710 ; =ov10_022DC220
	ldr r0, [r0]
	ldr r1, [r0, #0x4c]
	add r0, r0, #8
	bl sub_020534BC
	ldr r0, _022BD710 ; =ov10_022DC220
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0xe]
	ldr r1, [r0]
	strb r2, [r1, #0xf]
	ldr r0, [r0]
	add r0, r0, #8
	bl sub_02055CCC
	mvn r1, #0
	cmp r0, r1
	ldreq r0, _022BD710 ; =ov10_022DC220
	moveq r1, #1
	ldreq r0, [r0]
	streq r1, [r0]
	beq _022BD690
_022BD668:
	ldr r0, _022BD710 ; =ov10_022DC220
	ldr r1, [r0]
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
_022BD67C:
	ldr r0, _022BD710 ; =ov10_022DC220
	ldr ip, [r0]
	ldr r3, [ip, #4]
	cmp r3, #4
	blt _022BD5DC
_022BD690:
	ldr r0, _022BD710 ; =ov10_022DC220
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #4
	movge r0, #3
	strge r0, [r1]
	b _022BD708
_022BD6AC:
	add r0, r1, #8
	bl ov11_023061CC
	ldr r0, _022BD710 ; =ov10_022DC220
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _022BD708
_022BD6C8:
	bl ov11_02306C9C
	cmp r0, #3
	cmpne r0, #4
	bne _022BD708
	bl ov11_02306C64
	ldr r0, _022BD710 ; =ov10_022DC220
	mov r1, #0
	ldr r3, [r0]
	ldr r2, [r3, #4]
	add r2, r2, #1
	str r2, [r3, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _022BD708
_022BD700:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022BD708:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD710: .word ov10_022DC220
_022BD714: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ov10_022BD5AC

	arm_func_start ov10_022BD718
ov10_022BD718: ; 0x022BD718
	stmdb sp!, {r3, lr}
	ldr r0, _022BD740 ; =ov10_022DC220
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _022BD740 ; =ov10_022DC220
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BD740: .word ov10_022DC220
	arm_func_end ov10_022BD718

; https://decomp.me/scratch/bBFFj
	arm_func_start ov10_022BD744
ov10_022BD744: ; 0x022BD744
	ldr r0, _022BD758 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	bx lr
	.align 2, 0
_022BD758: .word ov10_022DC1C0
	arm_func_end ov10_022BD744

	arm_func_start LoadPaletteBase
LoadPaletteBase: ; 0x022BD75C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	cmp r1, #1
	bne _022BD7A0
	ldr r1, _022BD824 ; =WAN_TABLE
	ldr r3, _022BD828 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r4, [r1]
	mov r1, #0x38
	smlabb r0, r0, r1, r4
	ldr r0, [r0, #0x30]
	mov r2, r2, lsl #0x10
	ldr r1, [r0, #4]
	ldr r0, [r3]
	ldr r1, [r1, #4]
	mov r2, r2, lsr #0x10
	bl LoadObjPalette
	b _022BD81C
_022BD7A0:
	cmp r1, #0
	bne _022BD81C
	ldr r2, _022BD824 ; =WAN_TABLE
	mov r1, #0x38
	ldr r2, [r2]
	ldr r4, _022BD828 ; =OBJ_GRAPHICS_CONTROLS_PTR
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	mov sl, #0
	ldr r0, [r0, #4]
	mov r8, #0x10
	ldr sb, [r0, #4]
	mov r7, #0xff
	add r6, sp, #8
	mov r5, #1
_022BD7DC:
	str r8, [sp]
	str r7, [sp, #4]
	ldr r1, [sb]
	mov r0, r6
	mov r2, r5
	mov r3, r8
	add r1, r1, sl, lsl #6
	bl FillPaletteInitInfo
	mov r2, sl, lsl #0x10
	ldr r0, [r4]
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadObjPalette
	add sl, sl, #1
	cmp sl, #0xd
	blt _022BD7DC
_022BD81C:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022BD824: .word WAN_TABLE
_022BD828: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end LoadPaletteBase

	arm_func_start ov10_022BD82C
ov10_022BD82C: ; 0x022BD82C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022BDA78 ; =ov10_022DC1C0
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _022BD84C
	bl ov10_022BDC0C
_022BD84C:
	ldr r0, _022BDA7C ; =0x000027A4
	mov r1, #0xb
	bl MemAlloc
	ldr r2, _022BDA78 ; =ov10_022DC1C0
	ldr r1, _022BDA7C ; =0x000027A4
	str r0, [r2]
	bl MemZero
	bl sub_0206395C
	ldr r1, _022BDA78 ; =ov10_022DC1C0
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r4, [r0, #0x784]
	ldr r1, [r1]
	mvn r0, #0
_022BD888:
	add r2, r2, #1
	str r0, [r1, #0xc]
	cmp r2, #0x20
	add r1, r1, #0x13c
	blt _022BD888
	ldr r2, _022BDA78 ; =ov10_022DC1C0
	ldr r3, [sp, #0x10]
	ldr r0, [r2]
	ldr r1, [sp, #0x14]
	add r0, r0, #0x2000
	str r3, [r0, #0x78c]
	ldr r0, [r2]
	mov r3, #0
	add r0, r0, #0x2000
	str r1, [r0, #0x794]
	ldr r1, [r2]
	mov r0, r4
	add r1, r1, #0x2000
	strb r3, [r1, #0x79e]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r3, [r1, #0x79f]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r3, [r1, #0x7a0]
	bl ov10_022BFF30
	bl ov10_022C04D8
	ldr r0, _022BDA78 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	cmp r0, #0
	beq _022BD9D0
	cmp r0, #1
	bne _022BDA70
	mov r3, #0
	ldr r0, _022BDA80 ; =WAN_TABLE
	str r3, [sp]
	ldr r0, [r0]
	mov r1, #3
	mov r2, #0x124
	bl LoadWanTableEntryFromPack
	mov r1, #0
	mov r2, r1
	mov r4, r0
	bl LoadPaletteBase
	ldr r0, _022BDA80 ; =WAN_TABLE
	mov r1, r4
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	mov r3, #0
	ldr r0, _022BDA80 ; =WAN_TABLE
	str r3, [sp]
	ldr r0, [r0]
	mov r1, #3
	mov r2, #1
	bl LoadWanTableEntryFromPack
	mov r4, r0
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r1, _022BDA78 ; =ov10_022DC1C0
	mov r3, #1
	ldr r1, [r1]
	add r1, r1, #0x2000
	ldr r1, [r1, #0x78c]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0201D9C8
	mov r0, r4
	mov r1, #1
	ldrsh r2, [sp, #0x18]
	bl LoadPaletteBase
	ldr r1, _022BDA78 ; =ov10_022DC1C0
	ldrsh r2, [sp, #0x18]
	ldr r0, [r1]
	add r0, r0, #0x2700
	strh r4, [r0, #0x88]
	ldr r0, [r1]
	add r0, r0, #0x2700
	strh r2, [r0, #0x90]
	b _022BDA70
_022BD9D0:
	mov r3, #0
	ldr r0, _022BDA80 ; =WAN_TABLE
	str r3, [sp]
	ldr r0, [r0]
	mov r1, #3
	mov r2, #0x124
	bl LoadWanTableEntryFromPack
	ldr r1, _022BDA78 ; =ov10_022DC1C0
	mov r2, #0
	ldr r1, [r1]
	mov r3, r2
	add r1, r1, #0x2000
	ldr r1, [r1, #0x78c]
	mov r4, r0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0201DBB8
	mov r1, #0
	mov r0, r4
	mov r2, r1
	bl LoadPaletteBase
	ldr r0, _022BDA80 ; =WAN_TABLE
	mov r1, r4
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	mov r2, #0
	str r2, [sp]
	ldr r0, _022BDA80 ; =WAN_TABLE
	mov r1, #3
	ldr r0, [r0]
	mov r3, r2
	bl LoadWanTableEntryFromPack
	ldr r2, _022BDA78 ; =ov10_022DC1C0
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x2700
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	add r0, r0, #0x2700
	strh r3, [r0, #0x90]
_022BDA70:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BDA78: .word ov10_022DC1C0
_022BDA7C: .word 0x000027A4
_022BDA80: .word WAN_TABLE
	arm_func_end ov10_022BD82C

	arm_func_start ov10_022BDA84
ov10_022BDA84: ; 0x022BDA84
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	stmia sp, {r0, r1}
	mov r1, #0
	str r2, [sp, #8]
	mov r2, r1
	mov r3, r1
	mov r0, #1
	bl ov10_022BD82C
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov10_022BDA84

	arm_func_start ov10_022BDAB0
ov10_022BDAB0: ; 0x022BDAB0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	str r0, [sp]
	mov r0, #0
	stmib sp, {r1, r2}
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl ov10_022BD82C
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov10_022BDAB0

	arm_func_start ov10_022BDADC
ov10_022BDADC: ; 0x022BDADC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022BDB50 ; =ov10_022DC1C0
	ldr r3, [r0]
	add r1, r3, #0x2000
	ldr r0, [r1, #0x784]
	cmp r0, #0
	beq _022BDB48
	cmp r0, #1
	bne _022BDB48
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	add r0, r3, #0x2700
	ldr r1, [r1, #0x78c]
	ldrsh r0, [r0, #0x88]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r3, #1
	bl sub_0201D9C8
	ldr r0, _022BDB50 ; =ov10_022DC1C0
	mov r1, #1
	ldr r0, [r0]
	add r2, r0, #0x2700
	ldrsh r0, [r2, #0x88]
	ldrsh r2, [r2, #0x90]
	bl LoadPaletteBase
_022BDB48:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDB50: .word ov10_022DC1C0
	arm_func_end ov10_022BDADC

	arm_func_start ov10_022BDB54
ov10_022BDB54: ; 0x022BDB54
	ldr ip, _022BDB5C ; =sub_02063A0C
	bx ip
	.align 2, 0
_022BDB5C: .word sub_02063A0C
	arm_func_end ov10_022BDB54

	arm_func_start ov10_022BDB60
ov10_022BDB60: ; 0x022BDB60
	cmp r3, #0
	moveq r3, #0
	beq _022BDB74
	cmp r3, #1
	moveq r3, #1
_022BDB74:
	ldr ip, _022BDB7C ; =sub_020639B4
	bx ip
	.align 2, 0
_022BDB7C: .word sub_020639B4
	arm_func_end ov10_022BDB60

	arm_func_start ov10_022BDB80
ov10_022BDB80: ; 0x022BDB80
	ldr r3, _022BDBA0 ; =ov10_022DC1C0
	ldr r2, [r3]
	add r2, r2, #0x2000
	str r0, [r2, #0x798]
	ldr r0, [r3]
	add r0, r0, #0x2700
	strh r1, [r0, #0x9c]
	bx lr
	.align 2, 0
_022BDBA0: .word ov10_022DC1C0
	arm_func_end ov10_022BDB80

	arm_func_start ov10_022BDBA4
ov10_022BDBA4: ; 0x022BDBA4
	ldr ip, _022BDBAC ; =sub_020639E8
	bx ip
	.align 2, 0
_022BDBAC: .word sub_020639E8
	arm_func_end ov10_022BDBA4

	arm_func_start ov10_022BDBB0
ov10_022BDBB0: ; 0x022BDBB0
	ldr r1, _022BDBC4 ; =ov10_022DC1C0
	ldr r1, [r1]
	add r1, r1, #0x2000
	strb r0, [r1, #0x7a0]
	bx lr
	.align 2, 0
_022BDBC4: .word ov10_022DC1C0
	arm_func_end ov10_022BDBB0

	arm_func_start ov10_022BDBC8
ov10_022BDBC8: ; 0x022BDBC8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022BDC08 ; =ov10_022DC1C0
	mov r6, #0
	ldr r5, [r0]
	mvn r4, #0
_022BDBDC:
	ldr r0, [r5, #0xc]
	cmp r0, r4
	beq _022BDBF4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_022BDBF4:
	add r6, r6, #1
	cmp r6, #0x20
	add r5, r5, #0x13c
	blt _022BDBDC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BDC08: .word ov10_022DC1C0
	arm_func_end ov10_022BDBC8

	arm_func_start ov10_022BDC0C
ov10_022BDC0C: ; 0x022BDC0C
	stmdb sp!, {r3, lr}
	bl ov10_022BDBC8
	ldr r0, _022BDC60 ; =ov10_022DC1C0
	ldr r1, _022BDC64 ; =WAN_TABLE
	ldr r2, [r0]
	ldr r0, [r1]
	add r1, r2, #0x2700
	ldrsh r1, [r1, #0x88]
	bl DeleteWanTableEntryVeneer
	bl ov10_022C055C
	bl ov10_022BFF78
	ldr r0, _022BDC60 ; =ov10_022DC1C0
	ldr r0, [r0]
	cmp r0, #0
	beq _022BDC58
	bl MemFree
	ldr r0, _022BDC60 ; =ov10_022DC1C0
	mov r1, #0
	str r1, [r0]
_022BDC58:
	bl sub_02063DE4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDC60: .word ov10_022DC1C0
_022BDC64: .word WAN_TABLE
	arm_func_end ov10_022BDC0C

	arm_func_start ov10_022BDC68
ov10_022BDC68: ; 0x022BDC68
	stmdb sp!, {r3, lr}
	bl ov10_022BDBC8
	ldr r0, _022BDCA0 ; =ov10_022DC1C0
	mov r2, #0
	ldr r1, [r0]
	mvn r0, #0
_022BDC80:
	add r2, r2, #1
	str r0, [r1, #0xc]
	cmp r2, #0x20
	add r1, r1, #0x13c
	blt _022BDC80
	bl ov10_022BFFA4
	bl ov10_022C0588
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BDCA0: .word ov10_022DC1C0
	arm_func_end ov10_022BDC68

	arm_func_start ov10_022BDCA4
ov10_022BDCA4: ; 0x022BDCA4
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #1
	moveq r0, #1
	bx lr
	arm_func_end ov10_022BDCA4

	arm_func_start ov10_022BDCBC
ov10_022BDCBC: ; 0x022BDCBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _022BDE44 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	mla r4, r0, r1, r2
	ldr r0, [r4, #0x40]
	sub r0, r0, #5
	cmp r0, #1
	bhi _022BDD38
	mov r0, #0
	bl ov10_022BDCA4
	bl sub_02063E44
	ldr r2, _022BDE44 ; =ov10_022DC1C0
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x79e]
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r1, [r1, #0x784]
	cmp r1, #0
	bne _022BDD30
	mov r1, r0
	bl UnkMapRelatedFunc
_022BDD30:
	add r0, r4, #0xe8
	bl sub_0206423C
_022BDD38:
	ldr r0, [r4, #0x40]
	cmp r0, #3
	bne _022BDD90
	ldr r1, [r4]
	mov r0, #0
	bl ov10_022C07D0
	mov r6, r0
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _022BDD6C
	ldr r0, _022BDE48 ; =ov10_022C79D8
	bl Debug_Print0
	b _022BDE34
_022BDD6C:
	sub r1, r1, #1
	ldr r0, _022BDE4C ; =ov10_022C7A18
	str r1, [r6, #4]
	bl Debug_Print0
	ldr r0, [r6, #4]
	cmp r0, #0
	mvneq r0, #0
	streq r0, [r6]
	b _022BDE34
_022BDD90:
	cmp r0, #4
	bne _022BDDF4
	ldr r1, [r4]
	mov r0, #1
	bl ov10_022C07D0
	mov r6, r0
	ldr r1, [r6]
	ldr r0, [r4, #0x44]
	cmp r1, r0
	bne _022BDE34
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _022BDDD0
	ldr r0, _022BDE48 ; =ov10_022C79D8
	bl Debug_Print0
	b _022BDE34
_022BDDD0:
	sub r1, r1, #1
	ldr r0, _022BDE4C ; =ov10_022C7A18
	str r1, [r6, #4]
	bl Debug_Print0
	ldr r0, [r6, #4]
	cmp r0, #0
	mvneq r0, #0
	streq r0, [r6]
	b _022BDE34
_022BDDF4:
	cmp r0, #6
	ldr r1, [r4]
	bne _022BDE1C
	mov r0, #3
	bl ov10_022C07D0
	mov r1, #0
	str r1, [r0, #4]
	sub r1, r1, #1
	str r1, [r0]
	b _022BDE34
_022BDE1C:
	mov r0, #2
	bl ov10_022C07D0
	mov r1, #0
	str r1, [r0, #4]
	sub r1, r1, #1
	str r1, [r0]
_022BDE34:
	mov r0, r4
	mov r1, r5
	bl ov10_022BDEC4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BDE44: .word ov10_022DC1C0
_022BDE48: .word ov10_022C79D8
_022BDE4C: .word ov10_022C7A18
	arm_func_end ov10_022BDCBC

	arm_func_start ov10_022BDE50
ov10_022BDE50: ; 0x022BDE50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov10_022BE9A0
	mvn r2, #0
	cmp r0, r2
	ldmeqia sp!, {r4, pc}
	ldr r3, _022BDEB0 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r3, [r3]
	mla r1, r0, r1, r3
	ldr r0, [r1, #0xc]
	cmp r0, r2
	ldmeqia sp!, {r4, pc}
	ldr r0, [r1, #8]
	sub r0, r0, #1
	cmp r0, #1
	mov r0, r4
	bhi _022BDEA4
	mov r1, #0
	bl ov10_022BDCBC
	ldmia sp!, {r4, pc}
_022BDEA4:
	mov r1, #1
	bl ov10_022BDCBC
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BDEB0: .word ov10_022DC1C0
	arm_func_end ov10_022BDE50

	arm_func_start GetEffectAnimationField0x19
GetEffectAnimationField0x19: ; 0x022BDEB4
	stmdb sp!, {r3, lr}
	bl GetEffectAnimation
	ldrsb r0, [r0, #0x19]
	ldmia sp!, {r3, pc}
	arm_func_end GetEffectAnimationField0x19

	arm_func_start ov10_022BDEC4
ov10_022BDEC4: ; 0x022BDEC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mvn r0, #0
	str r0, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0x60]
	ldr r0, [r4, #8]
	sub r0, r0, #5
	cmp r0, #1
	bhi _022BDF00
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0xe4]
	bl ov10_022C04CC
	ldmia sp!, {r4, pc}
_022BDF00:
	ldrsh r2, [r4, #0x64]
	cmp r2, #0
	ldmeqia sp!, {r4, pc}
	cmp r1, #0
	beq _022BDF24
	ldr r0, _022BDF30 ; =WAN_TABLE
	mov r1, r2
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
_022BDF24:
	mov r0, #0
	strh r0, [r4, #0x64]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BDF30: .word WAN_TABLE
	arm_func_end ov10_022BDEC4

	arm_func_start ov10_022BDF34
ov10_022BDF34: ; 0x022BDF34
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0xe8
	bl sub_020642A8
	cmp r0, #0
	bne _022BDFB4
	mov r0, r4
	mov r1, #1
	bl ov10_022BDEC4
	ldr r2, _022BDFBC ; =ov10_022DC1C0
	ldr r0, [r4]
	ldr r3, [r2]
	mov r1, #0
	add r0, r3, r0
	add r0, r0, #0x2000
	strb r1, [r0, #0x79e]
	ldr r0, [r2]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	cmp r0, #0
	bne _022BDF90
	mov r0, #0xd
	bl UnkMapRelatedFunc
_022BDF90:
	ldr r1, [r4]
	mov r0, #2
	bl ov10_022C07D0
	mov r2, #0
	str r2, [r0, #4]
	sub r1, r2, #1
	str r1, [r0]
	mov r0, r2
	ldmia sp!, {r4, pc}
_022BDFB4:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BDFBC: .word ov10_022DC1C0
	arm_func_end ov10_022BDF34

	arm_func_start ov10_022BDFC0
ov10_022BDFC0: ; 0x022BDFC0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	ldr r0, [r7, #0x14]
	mov r6, r1
	bl GetEffectAnimation
	mov r1, #0
	mov r4, r0
	strb r1, [r7, #0x13a]
	ldr r0, [r4]
	mov r5, #1
	str r0, [r7, #0x40]
	ldr r0, [r4, #4]
	str r0, [r7, #0x44]
	ldr r0, [r4, #0x10]
	str r0, [r7, #0x58]
	ldr r1, [r7, #0x18]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r7, #0x5c]
	ldrb r0, [r4, #0x1b]
	strb r0, [r7, #0x61]
	ldrb r0, [r4, #0x1a]
	strb r0, [r7, #0x60]
	ldr r0, [r7, #0x40]
	cmp r0, #5
	cmpne r0, #6
	beq _022BE03C
	ldrsh r0, [r7, #0x64]
	bl sub_0201DA20
	str r0, [r7, #0x10]
_022BE03C:
	ldr r1, [r4, #0xc]
	mvn r0, #0
	str r1, [r7, #0x50]
	ldr r2, [r7, #0x1c]
	cmp r2, r0
	beq _022BE070
	ldr r0, [r7, #0x10]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	adds r0, r1, r0, ror #29
	ldreq r0, [r7, #0x50]
	addeq r0, r0, r2
	streq r0, [r7, #0x50]
_022BE070:
	mov r0, #0
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x40]
	cmp r0, #1
	cmpne r0, #2
	beq _022BE0A0
	ldr r1, [r7, #0x44]
	mov r2, r6
	bl ov10_022C05E0
	mvn r1, #2
	cmp r0, r1
	moveq r5, #1
_022BE0A0:
	ldr r0, [r7, #0x40]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022BE1F0
_022BE0B0: ; jump table
	b _022BE1F0 ; case 0
	b _022BE1A4 ; case 1
	b _022BE1D4 ; case 2
	b _022BE0CC ; case 3
	b _022BE0EC ; case 4
	b _022BE124 ; case 5
	b _022BE18C ; case 6
_022BE0CC:
	ldr r0, _022BE448 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x794]
	str r0, [r7, #0x54]
	ldr r0, [r4, #8]
	str r0, [r7, #0x48]
	b _022BE1F0
_022BE0EC:
	ldr r0, _022BE448 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x798]
	bl sub_0201E184
	ldr r1, _022BE448 ; =ov10_022DC1C0
	str r0, [r7, #0x54]
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, #0x2700
	ldrsh r0, [r0, #0x9c]
	str r0, [r7, #0x4c]
	str r1, [r7, #0x48]
	b _022BE1F0
_022BE124:
	cmp r6, #0
	bne _022BE158
	mvn r0, #0
	str r0, [r7, #0x54]
	ldr r1, [r4, #8]
	ldr r0, _022BE448 ; =ov10_022DC1C0
	str r1, [r7, #0x48]
	ldr r0, [r0]
	ldrb r1, [r4, #0x18]
	add r0, r0, r6
	add r0, r0, #0x2000
	strb r1, [r0, #0x79e]
	b _022BE1F0
_022BE158:
	cmp r6, #1
	bne _022BE1F0
	mvn r0, #0
	str r0, [r7, #0x54]
	ldr r1, [r4, #8]
	ldr r0, _022BE448 ; =ov10_022DC1C0
	str r1, [r7, #0x48]
	ldr r0, [r0]
	ldrb r1, [r4, #0x18]
	add r0, r0, r6
	add r0, r0, #0x2000
	strb r1, [r0, #0x79e]
	b _022BE1F0
_022BE18C:
	cmp r6, #0
	mvneq r0, #0
	streq r0, [r7, #0x54]
	ldreq r0, [r4, #8]
	streq r0, [r7, #0x48]
	b _022BE1F0
_022BE1A4:
	ldr r1, _022BE448 ; =ov10_022DC1C0
	ldr r0, [r1]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x78c]
	str r0, [r7, #0x54]
	ldr r0, [r1]
	add r0, r0, #0x2700
	ldrsh r0, [r0, #0x9c]
	str r0, [r7, #0x48]
	ldr r0, [r4, #8]
	str r0, [r7, #0x48]
	b _022BE1F0
_022BE1D4:
	ldr r0, _022BE448 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x78c]
	str r0, [r7, #0x54]
	ldr r0, [r4, #8]
	str r0, [r7, #0x48]
_022BE1F0:
	ldr r0, [r7, #0x40]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022BE440
_022BE200: ; jump table
	b _022BE440 ; case 0
	b _022BE21C ; case 1
	b _022BE280 ; case 2
	b _022BE300 ; case 3
	b _022BE36C ; case 4
	b _022BE3E4 ; case 5
	b _022BE418 ; case 6
_022BE21C:
	add r0, r7, #0x68
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x64]
	add r0, r7, #0x68
	bl SetSpriteIdForAnimationControl
	add r0, r7, #0x68
	bl sub_0201C108
	ldr r0, [r7, #0x48]
	mov r2, #0
	and r0, r0, #0xff
	stmia sp, {r0, r2}
	ldrb r1, [r7, #0x61]
	add r0, r7, #0x68
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r7, #0x54]
	ldr r1, [r7, #0x50]
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	bl SetAnimationForAnimationControl
	ldrh r0, [r7, #0x6a]
	orr r0, r0, #0x30
	orr r0, r0, #0x1000
	strh r0, [r7, #0x6a]
	b _022BE440
_022BE280:
	add r0, r7, #0x68
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x64]
	add r0, r7, #0x68
	bl SetSpriteIdForAnimationControl
	add r0, r7, #0x68
	bl sub_0201C108
	ldr r0, [r7, #0x48]
	mov r2, #0
	and r0, r0, #0xff
	stmia sp, {r0, r2}
	ldrb r1, [r7, #0x61]
	add r0, r7, #0x68
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r7, #0x54]
	ldr r1, [r7, #0x50]
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	bl SetAnimationForAnimationControl
	ldr r0, _022BE448 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2700
	ldrsh r0, [r0, #0x90]
	and r0, r0, #0xff
	and r0, r0, #0xf
	strb r0, [r7, #0xaa]
	ldrh r0, [r7, #0x6a]
	orr r0, r0, #0x30
	orr r0, r0, #0x1000
	strh r0, [r7, #0x6a]
	b _022BE440
_022BE300:
	add r0, r7, #0x68
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x64]
	add r0, r7, #0x68
	bl SetSpriteIdForAnimationControl
	ldr r0, [r7, #0x48]
	mov r2, #0
	and r0, r0, #0xff
	stmia sp, {r0, r2}
	ldrb r1, [r7, #0x61]
	add r0, r7, #0x68
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r7, #0x54]
	ldr r1, [r7, #0x50]
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	bl SetAnimationForAnimationControl
	ldrh r0, [r7, #0x6a]
	cmp r5, #0
	orr r0, r0, #0x30
	orr r0, r0, #0x1000
	strh r0, [r7, #0x6a]
	bne _022BE440
	add r0, r7, #0x68
	bl sub_0201C108
	b _022BE440
_022BE36C:
	add r0, r7, #0x68
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x64]
	add r0, r7, #0x68
	bl SetSpriteIdForAnimationControl
	ldr r0, [r7, #0x48]
	mov r2, #0
	and r0, r0, #0xff
	stmia sp, {r0, r2}
	ldrb r1, [r7, #0x61]
	add r0, r7, #0x68
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r7, #0x54]
	ldr r1, [r7, #0x50]
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	bl SetAnimationForAnimationControl
	ldrh r1, [r7, #0x6a]
	add r0, r7, #0x68
	orr r1, r1, #0x10
	strh r1, [r7, #0x6a]
	ldr r1, [r7, #0x4c]
	and r1, r1, #0xff
	bl sub_0201D0F8
	cmp r5, #0
	bne _022BE440
	add r0, r7, #0x68
	bl sub_0201C108
	b _022BE440
_022BE3E4:
	add r0, r7, #0xe8
	bl sub_020640BC
	ldrsh r1, [r7, #0xe4]
	add r0, r7, #0xe8
	bl sub_020640CC
	cmp r6, #1
	moveq r1, #1
	movne r1, #0
	add r0, r7, #0xe8
	bl sub_020640DC
	mov r0, #0
	strb r0, [r7, #0x104]
	b _022BE440
_022BE418:
	add r0, r7, #0xe8
	bl sub_020640BC
	ldrsh r1, [r7, #0xe4]
	add r0, r7, #0xe8
	bl sub_020640CC
	add r0, r7, #0xe8
	mov r1, #2
	bl sub_020640DC
	mov r0, #0
	strb r0, [r7, #0x104]
_022BE440:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022BE448: .word ov10_022DC1C0
	arm_func_end ov10_022BDFC0

	arm_func_start ov10_022BE44C
ov10_022BE44C: ; 0x022BE44C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	ldr r0, [sb]
	mov r8, r2
	bl GetEffectAnimation
	ldr r1, [sb]
	mov r7, r0
	cmp r1, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r7]
	cmp r1, #2
	bne _022BE4A0
	ldr r0, _022BE72C ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	cmp r0, #1
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022BE4A0:
	cmp r1, #1
	bne _022BE4C4
	ldr r0, _022BE72C ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	cmp r0, #0
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022BE4C4:
	cmp r1, #3
	bne _022BE53C
	ldr r0, _022BE72C ; =ov10_022DC1C0
	mov r5, #0
	ldr r6, [r0]
	mov fp, #1
	mvn r4, #0
_022BE4E0:
	ldr r0, [r6, #0xc]
	cmp r0, r4
	beq _022BE528
	ldr r0, [r6, #8]
	cmp r0, #3
	bne _022BE528
	ldr r0, [r6, #0x14]
	ldr r1, [sb]
	cmp r0, r1
	beq _022BE528
	bl GetEffectAnimation
	ldr r1, [r0, #4]
	ldr r0, [r7, #4]
	cmp r1, r0
	beq _022BE528
	mov r0, r6
	mov r1, fp
	bl ov10_022BDEC4
_022BE528:
	add r5, r5, #1
	cmp r5, #0x20
	add r6, r6, #0x13c
	blt _022BE4E0
	b _022BE59C
_022BE53C:
	cmp r1, #4
	bne _022BE59C
	ldr r0, _022BE72C ; =ov10_022DC1C0
	mov r5, #0
	ldr r4, [r0]
	mov r7, #1
	mvn r6, #0
_022BE558:
	ldr r0, [r4, #0xc]
	cmp r0, r6
	beq _022BE58C
	ldr r0, [r4, #8]
	cmp r0, #4
	bne _022BE58C
	ldr r1, [r4, #0x14]
	ldr r0, [sb]
	cmp r1, r0
	beq _022BE58C
	mov r0, r4
	mov r1, r7
	bl ov10_022BDEC4
_022BE58C:
	add r5, r5, #1
	cmp r5, #0x20
	add r4, r4, #0x13c
	blt _022BE558
_022BE59C:
	ldr r0, _022BE72C ; =ov10_022DC1C0
	mov r2, #0
	ldr r5, [r0]
	mvn r0, #0
	b _022BE71C
_022BE5B0:
	ldr r1, [r5, #0xc]
	cmp r1, r0
	bne _022BE714
	mov r0, r5
	mov r1, #0x13c
	bl MemZero
	mov r0, #0
	strh r0, [r5, #0x64]
	str r8, [r5]
	ldr r0, [sb]
	bl GetEffectAnimation
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #5
	bne _022BE618
	ldr r1, [r4, #4]
	bl ov10_022C0450
	strh r0, [r5, #0xe4]
	ldrsh r0, [r5, #0xe4]
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, r8
	ldmia r4, {r1, r2}
	bl ov10_022C01FC
	b _022BE6B8
_022BE618:
	cmp r0, #6
	bne _022BE64C
	ldr r1, [r4, #4]
	bl ov10_022C0450
	strh r0, [r5, #0xe4]
	ldrsh r0, [r5, #0xe4]
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, r8
	ldmia r4, {r1, r2}
	bl ov10_022C0280
	b _022BE6B8
_022BE64C:
	sub r1, r0, #1
	cmp r1, #1
	ldrls r0, _022BE72C ; =ov10_022DC1C0
	ldrls r0, [r0]
	addls r0, r0, #0x2700
	ldrlssh r0, [r0, #0x88]
	bls _022BE670
	ldr r1, [r4, #4]
	bl ov10_022C03F4
_022BE670:
	strh r0, [r5, #0x64]
	ldrsh r0, [r5, #0x64]
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4]
	sub r1, r1, #3
	cmp r1, #1
	bhi _022BE6B8
	mov r1, #0
	str r1, [sp]
	ldr r2, _022BE72C ; =ov10_022DC1C0
	ldr r1, [r4]
	ldr r3, [r2]
	ldr r2, [r4, #4]
	add r3, r3, #0x2000
	ldr r3, [r3, #0x794]
	bl ov10_022C0114
_022BE6B8:
	ldr r1, [r4]
	ldr r0, _022BE72C ; =ov10_022DC1C0
	str r1, [r5, #8]
	str sl, [r5, #4]
	ldr r0, [r0]
	add r6, r5, #0x14
	add r0, r0, #0x2000
	ldr r1, [r0, #0x780]
	mov r4, #2
	mov r2, r1
	add r1, r1, #1
	str r1, [r0, #0x780]
	str r2, [r5, #0xc]
_022BE6EC:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BE6EC
	ldmia sb, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	ldr r0, [r5, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022BE714:
	add r2, r2, #1
	add r5, r5, #0x13c
_022BE71C:
	cmp r2, #0x20
	blt _022BE5B0
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022BE72C: .word ov10_022DC1C0
	arm_func_end ov10_022BE44C

	arm_func_start ov10_022BE730
ov10_022BE730: ; 0x022BE730
	stmdb sp!, {r4, lr}
	bl ov10_022BE44C
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BE9A0
	mov r1, #0x13c
	ldr r2, _022BE77C ; =ov10_022DC1C0
	mul r3, r0, r1
	ldr r0, [r2]
	ldr r1, [r0, r3]
	add r0, r0, r3
	bl ov10_022BDFC0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022BE77C: .word ov10_022DC1C0
	arm_func_end ov10_022BE730

	arm_func_start ov10_022BE780
ov10_022BE780: ; 0x022BE780
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r3, _022BE998 ; =ov10_022DC1C0
	mov sl, r0
	ldr r0, [r3]
	mov sb, r1
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	mov r8, r2
	cmp r0, #0
	bne _022BE980
	bl sub_02001808
	mov r4, r0
	ldr r0, [sb]
	bl GetEffectAnimation
	ldr r1, _022BE998 ; =ov10_022DC1C0
	mov r5, r0
	ldr r0, [r1]
	ldr r1, [sb]
	add r0, r0, #0x2000
	ldrb r0, [r0, #0x7a0]
	cmp r0, #0
	beq _022BE800
	cmp r1, #0xef
	cmpne r1, #0x14c
	ldrne r0, _022BE99C ; =0x00000287
	cmpne r1, r0
	subne r0, r0, #0x13c
	cmpne r1, r0
	bne _022BE830
	mvn r0, #0
	b _022BE990
_022BE800:
	cmp r1, #0xef
	cmpne r1, #0x14c
	ldrne r0, _022BE99C ; =0x00000287
	cmpne r1, r0
	subne r0, r0, #0x13c
	cmpne r1, r0
	bne _022BE830
	mov r0, #0x10c00
	bl ov10_022BFE6C
	cmp r0, #0
	mvnne r0, #0
	bne _022BE990
_022BE830:
	ldr r0, [r5]
	cmp r0, #5
	bne _022BE8A0
	ldr r1, [r5, #4]
	mov r0, #3
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	add r1, r1, #0x10c
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DirectoryFileMngr_GetDirectoryFileSize
	cmp r4, r0
	bge _022BE980
	add r5, sp, #0x30
	mov r4, #2
_022BE86C:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BE86C
	ldmia sb, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	mov r3, #8
	add r1, sp, #0x30
	mov r0, sl
	mov r2, r8
	str r3, [sp, #0x30]
	bl ov10_022BE730
	b _022BE990
_022BE8A0:
	cmp r0, #3
	bne _022BE980
	ldr r0, _022BE998 ; =ov10_022DC1C0
	mov fp, #0
	ldr r6, [r0]
	mvn r0, #0
	mov r7, fp
	str r0, [sp]
	b _022BE910
_022BE8C4:
	ldr r1, [r6, #0xc]
	ldr r0, [sp]
	cmp r1, r0
	beq _022BE908
	ldr r0, [r6, #8]
	cmp r0, #3
	bne _022BE908
	ldr r0, [r6, #0x14]
	ldr r1, [sb]
	cmp r0, r1
	beq _022BE908
	bl GetEffectAnimation
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	cmp r1, r0
	moveq fp, #1
	beq _022BE918
_022BE908:
	add r7, r7, #1
	add r6, r6, #0x13c
_022BE910:
	cmp r7, #0x20
	blt _022BE8C4
_022BE918:
	cmp fp, #0
	bne _022BE980
	ldr r1, [r5, #4]
	mov r0, #3
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DirectoryFileMngr_GetDirectoryFileSize
	cmp r4, r0
	bge _022BE980
	add r5, sp, #4
	mov r4, #2
_022BE94C:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BE94C
	ldmia sb, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	mov r3, #8
	add r1, sp, #4
	mov r0, sl
	mov r2, r8
	str r3, [sp, #4]
	bl ov10_022BE730
	b _022BE990
_022BE980:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl ov10_022BE730
_022BE990:
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022BE998: .word ov10_022DC1C0
_022BE99C: .word 0x00000287
	arm_func_end ov10_022BE780

	arm_func_start ov10_022BE9A0
ov10_022BE9A0: ; 0x022BE9A0
	mvn r1, #0
	cmp r0, r1
	beq _022BE9DC
	ldr r1, _022BE9E4 ; =ov10_022DC1C0
	mov r2, #0
	ldr r3, [r1]
	b _022BE9D4
_022BE9BC:
	ldr r1, [r3, #0xc]
	cmp r1, r0
	moveq r0, r2
	bxeq lr
	add r2, r2, #1
	add r3, r3, #0x13c
_022BE9D4:
	cmp r2, #0x20
	blt _022BE9BC
_022BE9DC:
	mvn r0, #0
	bx lr
	.align 2, 0
_022BE9E4: .word ov10_022DC1C0
	arm_func_end ov10_022BE9A0

	arm_func_start ov10_022BE9E8
ov10_022BE9E8: ; 0x022BE9E8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	ldr lr, _022BEB20 ; =ov10_022C78D0
	add ip, sp, #0
	mov r6, r0
	mov r5, r1
	mov r4, #2
_022BEA04:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BEA04
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldrh r0, [r6]
	bl GetMoveAnimation
	ldrsh r0, [r0, #6]
	str r0, [sp]
	ldr r0, [r6, #0x10]
	str r0, [sp, #4]
	ldr r0, [r6, #0xc]
	str r0, [sp, #8]
	ldrh r0, [r6, #4]
	strh r0, [sp, #0xc]
	ldrh r0, [r6, #6]
	strh r0, [sp, #0xe]
	ldrh r0, [r6, #8]
	strh r0, [sp, #0x10]
	ldrh r0, [r6, #0xa]
	strh r0, [sp, #0x12]
	ldrsh r0, [r6, #2]
	ldrh r1, [r6]
	bl ov10_022BF088
	ldr r3, _022BEB24 ; =ov10_022C7884
	add r2, sp, #0x1c
	strb r0, [sp, #0x14]
	mov r1, #6
_022BEA78:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BEA78
	add r1, sp, #0
	mov r0, #2
	mov r2, #0
	bl ov10_022BE780
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022BEB18
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	moveq r0, r1
	beq _022BEB18
	ldr r2, _022BEB28 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r3, [r2]
	ldrh r2, [r6, #4]
	mla r3, r0, r1, r3
	add r1, r3, #0x100
	strh r2, [r1, #0x28]
	ldrh r2, [r6, #6]
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	strh r2, [r1, #0x2a]
	ldrh r2, [r5]
	strh r2, [r1, #0x2c]
	ldrh r2, [r5, #2]
	strh r2, [r1, #0x2e]
	ldrsh r2, [r6, #2]
	strh r2, [r1, #0x30]
	ldrh r2, [r3, #0x24]
	strh r2, [r1, #0x32]
	ldrh r2, [r3, #0x26]
	strh r2, [r1, #0x34]
_022BEB18:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022BEB20: .word ov10_022C78D0
_022BEB24: .word ov10_022C7884
_022BEB28: .word ov10_022DC1C0
	arm_func_end ov10_022BE9E8

	arm_func_start ov10_022BEB2C
ov10_022BEB2C: ; 0x022BEB2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _022BEC04 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r3, [r2]
	ldrh r2, [r6]
	mla r4, r0, r1, r3
	strh r2, [r4, #0x20]
	ldrh r1, [r6, #2]
	add r0, r4, #0x100
	strh r1, [r4, #0x22]
	ldrsh r1, [r0, #0x2e]
	ldrsh r0, [r0, #0x2a]
	sub r0, r1, r0
	bl abs
	add r1, r4, #0x100
	ldrsh r2, [r1, #0x2c]
	ldrsh r1, [r1, #0x28]
	mov r6, r0
	sub r0, r2, r1
	bl abs
	cmp r0, r6
	movle r0, r6
	mov r1, r0, asr #1
	add r0, r0, r1, lsr #30
	ldrsh r2, [r4, #0x26]
	mov r0, r0, asr #2
	sub r6, r0, #1
	add r1, r2, #9
	strh r1, [r4, #0x26]
	ldrsh r1, [r4, #0x24]
	mul r0, r1, r6
	strh r0, [r4, #0x24]
	ldrsh r0, [r4, #0x26]
	add r1, r6, #1
	mul r2, r0, r6
	strh r2, [r4, #0x26]
	ldrsh r0, [r4, #0x24]
	bl _s32_div_f
	strh r0, [r4, #0x24]
	ldrsh r0, [r4, #0x26]
	add r1, r6, #1
	bl _s32_div_f
	strh r0, [r4, #0x26]
	ldrsh r0, [r4, #0x26]
	sub r0, r0, #9
	strh r0, [r4, #0x26]
	str r5, [r4, #0x2c]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BEC04: .word ov10_022DC1C0
	arm_func_end ov10_022BEB2C

	arm_func_start ov10_022BEC08
ov10_022BEC08: ; 0x022BEC08
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	ldr r4, _022BEC8C ; =ov10_022C78FC
	add lr, sp, #0
	mov r6, r0
	mov r5, r1
	mov ip, #2
_022BEC24:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022BEC24
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	mov r0, r6
	bl GetTrapAnimation
	str r0, [sp]
	ldrh r0, [r5]
	ldr r3, _022BEC90 ; =ov10_022C7884
	add r2, sp, #0x1c
	strh r0, [sp, #0xc]
	ldrh r0, [r5, #2]
	mov r1, #6
	strh r0, [sp, #0xe]
_022BEC64:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BEC64
	add r1, sp, #0
	mov r0, #3
	mov r2, #0
	bl ov10_022BE780
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022BEC8C: .word ov10_022C78FC
_022BEC90: .word ov10_022C7884
	arm_func_end ov10_022BEC08

	arm_func_start ov10_022BEC94
ov10_022BEC94: ; 0x022BEC94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x2c
	movs r5, r3
	mov r7, r1
	mov r6, r2
	beq _022BECB4
	bl GetItemAnimation1
	b _022BECB8
_022BECB4:
	bl GetItemAnimation2
_022BECB8:
	mov r4, r0
	mov r0, r4
	bl GetEffectAnimation
	ldrsb ip, [r0, #0x19]
	ldr sb, _022BED88 ; =ov10_022C7928
	add r8, sp, #0
	mov lr, #2
_022BECD4:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _022BECD4
	ldmia sb, {r0, r1, r2}
	stmia r8, {r0, r1, r2}
	str r4, [sp]
	ldrh r0, [r7]
	ldr r3, _022BED8C ; =ov10_022C7884
	add r2, sp, #0x1c
	strh r0, [sp, #0xc]
	ldrh r0, [r7, #2]
	mov r1, #6
	strh r0, [sp, #0xe]
_022BED0C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BED0C
	ldr r0, [sp, #0x48]
	cmp r5, #0
	str r0, [sp, #0x18]
	beq _022BED58
	mvn r0, #0
	cmp ip, r0
	beq _022BED70
	strb ip, [sp, #0x14]
	mov r0, ip, lsl #2
	ldrh r0, [r6, r0]
	add r1, r6, ip, lsl #2
	strh r0, [sp, #0x10]
	ldrh r0, [r1, #2]
	strh r0, [sp, #0x12]
	b _022BED70
_022BED58:
	mov r0, #3
	strb r0, [sp, #0x14]
	ldrh r0, [r6, #0xc]
	strh r0, [sp, #0x10]
	ldrh r0, [r6, #0xe]
	strh r0, [sp, #0x12]
_022BED70:
	add r1, sp, #0
	mov r0, #4
	mov r2, #0
	bl ov10_022BE780
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022BED88: .word ov10_022C7928
_022BED8C: .word ov10_022C7884
	arm_func_end ov10_022BEC94

	arm_func_start ov10_022BED90
ov10_022BED90: ; 0x022BED90
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1b8
	mov sb, r0
	ldrh r0, [sb]
	cmp r0, #0x52
	bne _022BEF1C
	ldr r3, _022BEFC4 ; =ov10_022C78B0
	add r2, sp, #0x38
	mov r1, #0x10
_022BEDB4:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BEDB4
	mov r7, #0
	ldr r3, _022BEFC8 ; =ov10_022C7884
	add r2, sp, #0
	mov r6, r7
	mov r1, #6
_022BEDD8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BEDD8
_022BEDE8:
	mov r0, #0x2c
	mul r4, r6, r0
	add r5, sp, #0x58
	add r8, r5, r4
	mov r0, r8
	bl ov10_022BF274
	ldrh r0, [sb]
	bl GetMoveAnimation
	ldrsh r0, [r0, #2]
	add r1, sp, #0x38
	mov r2, r6, lsl #2
	str r0, [r5, r4]
	ldr r3, [sb, #0x10]
	add r0, r1, r6, lsl #2
	str r3, [r8, #4]
	ldr r3, [sb, #0xc]
	ldrsh r1, [r1, r2]
	str r3, [r8, #8]
	ldrh r3, [sb, #4]
	ldrsh r0, [r0, #2]
	strh r3, [r8, #0xc]
	ldrh r2, [sb, #6]
	sub r0, r0, #0x40
	strh r2, [r8, #0xe]
	ldrsh r2, [r8, #0xe]
	add r2, r2, #0x40
	strh r2, [r8, #0xe]
	ldrh r2, [sb, #8]
	strh r2, [r8, #0x10]
	ldrh r2, [sb, #0xa]
	strh r2, [r8, #0x12]
	ldrsh r2, [r8, #0x10]
	add r1, r2, r1
	strh r1, [r8, #0x10]
	ldrsh r1, [r8, #0x12]
	add r0, r1, r0
	strh r0, [r8, #0x12]
	ldrsh r0, [sb, #2]
	ldrh r1, [sb]
	bl ov10_022BF088
	ldr r1, _022BEFCC ; =0x0000FFFF
	strb r0, [r8, #0x14]
	str r1, [r8, #0x18]
	add r3, sp, #0
	add r2, r8, #0x1c
	mov r1, #6
_022BEEA0:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BEEA0
	mov r2, #0
	mov r1, r8
	mov r0, #1
	str r2, [r8, #0x28]
	bl ov10_022BE780
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	beq _022BEEFC
	ldr r2, _022BEFD0 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	mov r3, #6
	mla r1, r0, r1, r2
	add r0, r1, #0x100
	strh r3, [r0, #0x36]
_022BEEFC:
	cmp r6, #0
	add r6, r6, #1
	moveq r7, r4
	cmp r6, #8
	blt _022BEDE8
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	b _022BEFBC
_022BEF1C:
	ldr r6, _022BEFD4 ; =ov10_022C7954
	add r5, sp, #0xc
	mov r4, #2
_022BEF28:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _022BEF28
	ldmia r6, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	ldrh r0, [sb]
	bl GetMoveAnimation
	ldrsh r0, [r0, #2]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	str r0, [sp, #0x10]
	ldr r0, [sb, #0xc]
	str r0, [sp, #0x14]
	ldrh r0, [sb, #4]
	strh r0, [sp, #0x18]
	ldrh r0, [sb, #6]
	strh r0, [sp, #0x1a]
	ldrh r0, [sb, #8]
	strh r0, [sp, #0x1c]
	ldrh r0, [sb, #0xa]
	strh r0, [sp, #0x1e]
	ldrsh r0, [sb, #2]
	ldrh r1, [sb]
	bl ov10_022BF088
	ldr r3, _022BEFC8 ; =ov10_022C7884
	add r2, sp, #0x28
	strb r0, [sp, #0x20]
	mov r1, #6
_022BEF9C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BEF9C
	add r1, sp, #0xc
	mov r0, #1
	mov r2, #0
	bl ov10_022BE780
_022BEFBC:
	add sp, sp, #0x1b8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022BEFC4: .word ov10_022C78B0
_022BEFC8: .word ov10_022C7884
_022BEFCC: .word 0x0000FFFF
_022BEFD0: .word ov10_022DC1C0
_022BEFD4: .word ov10_022C7954
	arm_func_end ov10_022BED90

	arm_func_start ov10_022BEFD8
ov10_022BEFD8: ; 0x022BEFD8
	stmdb sp!, {r3, lr}
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	beq _022BF000
	ldr r2, _022BF008 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	mla r1, r0, r1, r2
	ldrsb r1, [r1, #0x28]
_022BF000:
	mov r0, r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF008: .word ov10_022DC1C0
	arm_func_end ov10_022BEFD8

	arm_func_start ov10_022BF00C
ov10_022BF00C: ; 0x022BF00C
	stmdb sp!, {r3, lr}
	bl GetEffectAnimation
	ldrsb r0, [r0, #0x19]
	ldmia sp!, {r3, pc}
	arm_func_end ov10_022BF00C

	arm_func_start ov10_022BF01C
ov10_022BF01C: ; 0x022BF01C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, r1
	bl GetMoveAnimation
	mov r4, r0
	ldrh r0, [r4, #0x16]
	bl GetSpecialMonsterMoveAnimation
	mov r5, r0
	mov r0, r6
	mov r1, #0x258
	bl _s32_div_f
	mov r1, r1, lsl #0x10
	ldrsh r3, [r4, #0x14]
	mov r2, #0
	b _022BF078
_022BF058:
	ldrsh r0, [r5]
	cmp r0, r1, asr #16
	ldreqsb r0, [r5, #3]
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r5, r5, #6
_022BF078:
	cmp r2, r3
	blt _022BF058
	ldrsb r0, [r4, #0x11]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov10_022BF01C

	arm_func_start ov10_022BF088
ov10_022BF088: ; 0x022BF088
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, r1
	bl GetMoveAnimation
	mov r4, r0
	ldrh r0, [r4, #0x16]
	bl GetSpecialMonsterMoveAnimation
	mov r5, r0
	mov r0, r6
	mov r1, #0x258
	bl _s32_div_f
	mov r1, r1, lsl #0x10
	ldrsh r3, [r4, #0x14]
	mov r2, #0
	b _022BF0E4
_022BF0C4:
	ldrsh r0, [r5]
	cmp r0, r1, asr #16
	ldreqsb r0, [r5, #3]
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r5, r5, #6
_022BF0E4:
	cmp r2, r3
	blt _022BF0C4
	ldrsb r0, [r4, #0x11]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov10_022BF088

	arm_func_start ov10_022BF0F4
ov10_022BF0F4: ; 0x022BF0F4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, r1
	bl GetMoveAnimation
	mov r4, r0
	ldrh r0, [r4, #0x16]
	bl GetSpecialMonsterMoveAnimation
	mov r5, r0
	mov r0, r6
	mov r1, #0x258
	bl _s32_div_f
	mov r1, r1, lsl #0x10
	ldrsh r3, [r4, #0x14]
	mov r2, #0
	b _022BF150
_022BF130:
	ldrsh r0, [r5]
	cmp r0, r1, asr #16
	ldreqsh r0, [r5, #4]
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r5, r5, #6
_022BF150:
	cmp r2, r3
	blt _022BF130
	ldrh r0, [r4, #0x12]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov10_022BF0F4

	arm_func_start ov10_022BF160
ov10_022BF160: ; 0x022BF160
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldrh r0, [r5]
	mov r4, #0
	bl GetMoveAnimation
	ldrsh r1, [r0]
	ldrh r0, [r5]
	str r1, [sp]
	bl GetMoveAnimation
	ldrsh r1, [r0, #2]
	ldrh r0, [r5]
	str r1, [sp, #4]
	bl GetMoveAnimation
	ldrsh r1, [r0, #4]
	ldrh r0, [r5]
	str r1, [sp, #8]
	bl GetMoveAnimation
	ldrsh r0, [r0, #6]
	mov r8, r4
	add r7, sp, #0
	str r0, [sp, #0xc]
	mov r5, r4
	mov r6, #1
	b _022BF1E8
_022BF1C4:
	ldr r0, [r7, r8, lsl #2]
	bl GetEffectAnimation
	ldr r0, [r0]
	cmp r0, #5
	moveq r0, r6
	movne r0, r5
	ands r4, r0, #0xff
	bne _022BF1F0
	add r8, r8, #1
_022BF1E8:
	cmp r8, #4
	blt _022BF1C4
_022BF1F0:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov10_022BF160

	arm_func_start ov10_022BF1FC
ov10_022BF1FC: ; 0x022BF1FC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldrh r0, [r5]
	mov r4, r1
	bl GetMoveAnimation
	ldrsh r1, [r0]
	ldrh r0, [r5]
	str r1, [sp]
	bl GetMoveAnimation
	ldrsh r1, [r0, #2]
	ldrh r0, [r5]
	str r1, [sp, #4]
	bl GetMoveAnimation
	ldrsh r1, [r0, #4]
	ldrh r0, [r5]
	str r1, [sp, #8]
	bl GetMoveAnimation
	ldrsh r1, [r0, #6]
	add r0, sp, #0
	str r1, [sp, #0xc]
	ldr r0, [r0, r4, lsl #2]
	bl GetEffectAnimation
	ldr r0, [r0]
	cmp r0, #5
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov10_022BF1FC

	arm_func_start ov10_022BF274
ov10_022BF274: ; 0x022BF274
	stmdb sp!, {r4, lr}
	mov r1, #0x2c
	mov r4, r0
	bl MemZero
	mvn r0, #0
	strb r0, [r4, #0x14]
	add r0, r0, #0x10000
	str r0, [r4, #0x18]
	strh r0, [r4, #0x1c]
	strh r0, [r4, #0x1e]
	strh r0, [r4, #0x20]
	mov r0, #0
	strh r0, [r4, #0x22]
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022BF274

	arm_func_start ov10_022BF2B4
ov10_022BF2B4: ; 0x022BF2B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, r1
	bl GetEffectAnimation
	ldrsb r3, [r0, #0x19]
	mov r1, r5
	mov r2, r4
	mov r0, #7
	strb r3, [r5, #0x14]
	bl ov10_022BE780
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov10_022BF2B4

	arm_func_start ov10_022BF2E4
ov10_022BF2E4: ; 0x022BF2E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, r1
	bl GetEffectAnimation
	ldrsb r3, [r0, #0x19]
	mov r1, r5
	mov r2, r4
	mov r0, #7
	strb r3, [r5, #0x14]
	bl ov10_022BE44C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov10_022BF2E4

	arm_func_start ov10_022BF314
ov10_022BF314: ; 0x022BF314
	stmdb sp!, {r3, lr}
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov10_022BE9A0
	ldr r2, _022BF358 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	mla r0, r1, r0, r2
	ldr r1, [r0, #4]
	cmp r1, #0
	ldrne r2, [r0, #0xc]
	mvnne r1, #0
	cmpne r2, r1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF358: .word ov10_022DC1C0
	arm_func_end ov10_022BF314

	arm_func_start ov10_022BF35C
ov10_022BF35C: ; 0x022BF35C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov10_022BF314
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrb r1, [r0, #0x13a]
	cmp r1, #0
	beq _022BF388
	mov r0, r4
	bl ov10_022BF3EC
	ldmia sp!, {r4, pc}
_022BF388:
	ldr r1, [r0]
	bl ov10_022BDFC0
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022BF35C

	arm_func_start ov10_022BF394
ov10_022BF394: ; 0x022BF394
	stmdb sp!, {r4, lr}
	bl ov10_022BF314
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	mov r0, #1
	strb r0, [r4, #0x13a]
	ldr r0, [r4, #0x40]
	bl ov10_022BFE54
	cmp r0, #0
	beq _022BF3CC
	add r0, r4, #0xe8
	mov r1, #1
	bl sub_020640D4
	ldmia sp!, {r4, pc}
_022BF3CC:
	ldr r0, [r4, #0x40]
	bl ov10_022BFE3C
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x68
	mov r1, #1
	bl SetAnimationControlPausedFlag
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022BF394

	arm_func_start ov10_022BF3EC
ov10_022BF3EC: ; 0x022BF3EC
	stmdb sp!, {r4, lr}
	bl ov10_022BF314
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	strb r0, [r4, #0x13a]
	ldr r0, [r4, #0x40]
	bl ov10_022BFE54
	cmp r0, #0
	beq _022BF424
	add r0, r4, #0xe8
	mov r1, #0
	bl sub_020640D4
	ldmia sp!, {r4, pc}
_022BF424:
	ldr r0, [r4, #0x40]
	bl ov10_022BFE3C
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x68
	mov r1, #0
	bl SetAnimationControlPausedFlag
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022BF3EC

	arm_func_start ov10_022BF444
ov10_022BF444: ; 0x022BF444
	stmdb sp!, {r3, lr}
	bl ov10_022BF314
	cmp r0, #0
	ldrneb r0, [r0, #0x13a]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov10_022BF444

	arm_func_start ov10_022BF45C
ov10_022BF45C: ; 0x022BF45C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _022BF4E8 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	cmp r6, #0
	mla r1, r0, r1, r2
	ldrneh r0, [r6]
	ldr r3, [sp, #0x10]
	strneh r0, [r1, #0x20]
	ldrneh r0, [r6, #2]
	strneh r0, [r1, #0x22]
	cmp r5, #0
	ldrneh r0, [r5]
	strneh r0, [r1, #0x24]
	ldrneh r0, [r5, #2]
	strneh r0, [r1, #0x26]
	ldr r0, _022BF4EC ; =0x0000FFFF
	cmp r4, r0
	strne r4, [r1, #0x2c]
	cmp r3, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r2, r1, #0x30
	mov r1, #6
_022BF4D4:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BF4D4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022BF4E8: .word ov10_022DC1C0
_022BF4EC: .word 0x0000FFFF
	arm_func_end ov10_022BF45C

	arm_func_start ov10_022BF4F0
ov10_022BF4F0: ; 0x022BF4F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r3, [r6, #0xc]
	mvn r2, #0
	mov r4, r1
	cmp r3, r2
	beq _022BF750
	ldr r2, [r6, #0x18]
	cmp r2, #0
	bgt _022BF6D4
	ldr r2, [r6, #0x40]
	cmp r2, #5
	bne _022BF52C
	bl ov10_022BDF34
	b _022BF6D4
_022BF52C:
	cmp r2, #6
	bne _022BF53C
	bl ov10_022BDF34
	b _022BF6D4
_022BF53C:
	add r0, r6, #0x68
	bl sub_0201D1B0
	cmp r0, #0
	bne _022BF598
	ldr r0, [r6, #8]
	sub r0, r0, #3
	cmp r0, #2
	bhi _022BF580
	ldr r0, [r6, #0x3c]
	tst r0, #1
	bne _022BF6D4
	ldr r0, [r6, #0xc]
	mov r1, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDCBC
	b _022BF6D4
_022BF580:
	ldr r0, [r6, #0xc]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDCBC
	b _022BF6D4
_022BF598:
	add r0, r6, #0x68
	bl SwitchAnimationControlToNextFrame
	ldr r1, [r6, #0x10]
	mov r0, #0
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	adds r1, r2, r1, ror #29
	bne _022BF5DC
	ldr r1, [r6, #0x1c]
	cmp r1, #3
	cmpne r1, #4
	cmpne r1, #5
	bne _022BF5D4
	sub r0, r0, #3
	b _022BF5E0
_022BF5D4:
	add r0, r0, #3
	b _022BF5E0
_022BF5DC:
	add r0, r0, #3
_022BF5E0:
	ldr r1, _022BF758 ; =ov10_022C7870
	ldrsb r2, [r6, #0x28]
	ldrh r5, [r1, #0xc]
	ldrh r3, [r1, #0xe]
	mvn r1, #0
	cmp r2, r1
	ldrnesh r2, [r6, #0x24]
	strh r5, [sp]
	ldrnesh r1, [r6, #0x26]
	strh r3, [sp, #2]
	strneh r2, [sp]
	strneh r1, [sp, #2]
	ldrsh r1, [sp]
	cmp r1, #0x63
	ldrnesh r1, [sp, #2]
	cmpne r1, #0x63
	beq _022BF6D4
	ldr r5, [r6, #0x2c]
	ldr r2, _022BF75C ; =0x0000FFFF
	cmp r5, r2
	bne _022BF648
	ldrsh r3, [r6, #0x22]
	ldrsh r2, [r4, #2]
	sub r2, r3, r2
	add r2, r2, r2, lsr #31
	add r5, r0, r2, asr #1
_022BF648:
	add r2, r6, #0x100
	ldrsh r7, [r6, #0x20]
	ldrsh r0, [r2, #0x36]
	ldrsh lr, [r4]
	ldrsh ip, [r6, #0x22]
	ldrsh r4, [r4, #2]
	add r3, r7, r0
	ldrsh r0, [sp]
	strh r3, [r6, #0x20]
	sub r7, r7, lr
	sub lr, ip, r4
	ldrsh ip, [r6, #0x22]
	ldrsh r3, [r2, #0x38]
	add r4, r0, r7
	mvn r2, #0x3f
	add r0, ip, r3
	strh r0, [r6, #0x22]
	cmp r4, r2
	add r7, r1, lr
	ble _022BF6D4
	rsb r0, r2, #0xff
	cmp r4, r0
	bge _022BF6D4
	cmp r7, r2
	ble _022BF6D4
	cmp r7, #0x100
	bge _022BF6D4
	add r0, r6, #0x68
	add r1, r6, #0x30
	bl FillOamAttributeInfo
	strh r4, [r6, #0x84]
	strh r7, [r6, #0x86]
	add r0, r6, #0x68
	strh r5, [r6, #0xa0]
	bl DisplayAndSwitchAnimationControlCurrentFrame
_022BF6D4:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r6, #0x18]
	ldr r1, [r6, #0x58]
	mvn r0, #0
	cmp r1, r0
	beq _022BF730
	ldr r0, [r6, #0x5c]
	cmp r0, #0
	bne _022BF730
	ldr r0, _022BF760 ; =ov10_022DC1C0
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x784]
	cmp r0, #0
	bne _022BF724
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	bl PlaySeByIdVolumeWrapper
_022BF724:
	mvn r0, #0
	str r0, [r6, #0x58]
	str r0, [r6, #0x5c]
_022BF730:
	ldr r0, [r6, #0x5c]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r6, #0x5c]
	ldrb r0, [r6, #0x60]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022BF750:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022BF758: .word ov10_022C7870
_022BF75C: .word 0x0000FFFF
_022BF760: .word ov10_022DC1C0
	arm_func_end ov10_022BF4F0

	arm_func_start ov10_022BF764
ov10_022BF764: ; 0x022BF764
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _022BF7CC ; =ov10_022DC1C0
	mov r4, r0
	ldr r6, [r1]
	cmp r6, #0
	moveq r0, #0
	beq _022BF7C4
	ldr r0, _022BF7D0 ; =ov10_022C7870
	add r2, sp, #0
	ldrh r1, [r0, #0x10]
	cmp r4, #0
	moveq r4, r2
	strh r1, [sp]
	ldrh r0, [r0, #0x12]
	mov r5, #0
	strh r0, [sp, #2]
_022BF7A8:
	mov r0, r6
	mov r1, r4
	bl ov10_022BF4F0
	add r5, r5, #1
	cmp r5, #0x20
	add r6, r6, #0x13c
	blt _022BF7A8
_022BF7C4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022BF7CC: .word ov10_022DC1C0
_022BF7D0: .word ov10_022C7870
	arm_func_end ov10_022BF764

	arm_func_start ov10_022BF7D4
ov10_022BF7D4: ; 0x022BF7D4
	ldr ip, _022BF7DC ; =ov10_022C039C
	bx ip
	.align 2, 0
_022BF7DC: .word ov10_022C039C
	arm_func_end ov10_022BF7D4

	arm_func_start ov10_022BF7E0
ov10_022BF7E0: ; 0x022BF7E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022BF85C ; =ov10_022DC1C0
	mov r6, r0
	ldr r5, [r1]
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022BF860 ; =ov10_022C7870
	add r2, sp, #0
	ldrh r1, [r0, #8]
	cmp r6, #0
	mov r4, #0
	strh r1, [sp]
	ldrh r0, [r0, #0xa]
	moveq r6, r2
	mov r7, #0
	strh r0, [sp, #2]
_022BF824:
	ldr r0, [r5, #0x40]
	bl ov10_022BFE3C
	cmp r0, #0
	beq _022BF844
	mov r0, r5
	mov r1, r6
	bl ov10_022BF4F0
	mov r4, r0
_022BF844:
	add r7, r7, #1
	cmp r7, #0x20
	add r5, r5, #0x13c
	blt _022BF824
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022BF85C: .word ov10_022DC1C0
_022BF860: .word ov10_022C7870
	arm_func_end ov10_022BF7E0

	arm_func_start ov10_022BF864
ov10_022BF864: ; 0x022BF864
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022BF8E0 ; =ov10_022DC1C0
	mov r6, r0
	ldr r5, [r1]
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022BF8E4 ; =ov10_022C7870
	add r2, sp, #0
	ldrh r1, [r0]
	cmp r6, #0
	mov r4, #0
	strh r1, [sp]
	ldrh r0, [r0, #2]
	moveq r6, r2
	mov r7, #0
	strh r0, [sp, #2]
_022BF8A8:
	ldr r0, [r5, #0x40]
	bl ov10_022BFE54
	cmp r0, #0
	beq _022BF8C8
	mov r0, r5
	mov r1, r6
	bl ov10_022BF4F0
	mov r4, r0
_022BF8C8:
	add r7, r7, #1
	cmp r7, #0x20
	add r5, r5, #0x13c
	blt _022BF8A8
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022BF8E0: .word ov10_022DC1C0
_022BF8E4: .word ov10_022C7870
	arm_func_end ov10_022BF864

	arm_func_start ScreenEffectActive
ScreenEffectActive: ; 0x022BF8E8
	ldr r1, _022BF900 ; =ov10_022DC1C0
	ldr r1, [r1]
	add r0, r1, r0
	add r0, r0, #0x2000
	ldrb r0, [r0, #0x79e]
	bx lr
	.align 2, 0
_022BF900: .word ov10_022DC1C0
	arm_func_end ScreenEffectActive

	arm_func_start AnimationHasMoreFrames
AnimationHasMoreFrames: ; 0x022BF904
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r1, _022BF960 ; =ov10_022DC1C0
	mov r2, #0
	ldr r3, [r1]
	b _022BF950
_022BF924:
	ldr r1, [r3, #0xc]
	cmp r1, r0
	bne _022BF948
	ldrb r0, [r3, #0x60]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
_022BF948:
	add r2, r2, #1
	add r3, r3, #0x13c
_022BF950:
	cmp r2, #0x20
	blt _022BF924
	mov r0, #0
	bx lr
	.align 2, 0
_022BF960: .word ov10_022DC1C0
	arm_func_end AnimationHasMoreFrames

	arm_func_start ov10_022BF964
ov10_022BF964: ; 0x022BF964
	stmdb sp!, {r3, lr}
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	beq _022BF9C0
	ldr r2, _022BF9C8 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x18]
	cmp r0, #0
	movgt r0, #1
	ldmgtia sp!, {r3, pc}
	ldr r0, [r1, #0x40]
	sub r0, r0, #5
	cmp r0, #1
	movls r0, #1
	ldmlsia sp!, {r3, pc}
	add r0, r1, #0x68
	bl sub_0201D1B0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_022BF9C0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BF9C8: .word ov10_022DC1C0
	arm_func_end ov10_022BF964

	arm_func_start ov10_022BF9CC
ov10_022BF9CC: ; 0x022BF9CC
	stmdb sp!, {r3, lr}
	ldr r2, _022BFA38 ; =ov10_022DC1C0
	mov ip, #0
	ldr lr, [r2]
	mvn r2, #0
	b _022BFA14
_022BF9E4:
	ldr r3, [lr, #0xc]
	cmp r3, r2
	beq _022BFA0C
	cmp r0, #0
	bne _022BFA04
	ldrb r3, [lr, #0x60]
	cmp r3, #0
	bne _022BFA0C
_022BFA04:
	mov r0, #1
	ldmia sp!, {r3, pc}
_022BFA0C:
	add ip, ip, #1
	add lr, lr, #0x13c
_022BFA14:
	cmp ip, #0x20
	blt _022BF9E4
	mov r0, #2
	bl ov10_022C07E8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022BFA38: .word ov10_022DC1C0
	arm_func_end ov10_022BF9CC

	arm_func_start ov10_022BFA3C
ov10_022BFA3C: ; 0x022BFA3C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, r1
	bl GetMoveAnimation
	mov r4, r0
	ldrh r0, [r4, #0x16]
	bl GetSpecialMonsterMoveAnimation
	mov r5, r0
	mov r0, r6
	mov r1, #0x258
	bl _s32_div_f
	mov r1, r1, lsl #0x10
	ldrsh r3, [r4, #0x14]
	mov r2, #0
	b _022BFA98
_022BFA78:
	ldrsh r0, [r5]
	cmp r0, r1, asr #16
	ldreqb r0, [r5, #2]
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r5, r5, #6
_022BFA98:
	cmp r2, r3
	blt _022BFA78
	ldrb r0, [r4, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov10_022BFA3C

	arm_func_start ov10_022BFAA8
ov10_022BFAA8: ; 0x022BFAA8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x2c
	ldr r5, _022BFB64 ; =ov10_022C7980
	add lr, sp, #0
	mov r4, r0
	mov ip, #2
_022BFAC0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022BFAC0
	ldmia r5, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldrh r0, [r4]
	bl GetMoveAnimation
	ldrsh r0, [r0]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	ldrh r0, [r4, #4]
	strh r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	strh r0, [sp, #0xe]
	ldrh r0, [r4, #8]
	strh r0, [sp, #0x10]
	ldrh r0, [r4, #0xa]
	strh r0, [sp, #0x12]
	ldrh r0, [r4]
	bl GetMoveAnimation
	ldrsh r0, [r0]
	bl GetEffectAnimation
	ldrsb r0, [r0, #0x19]
	ldr r3, _022BFB68 ; =ov10_022C7884
	add r2, sp, #0x1c
	strb r0, [sp, #0x14]
	mov r1, #6
_022BFB3C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BFB3C
	add r1, sp, #0
	mov r0, #5
	mov r2, #0
	bl ov10_022BE780
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022BFB64: .word ov10_022C7980
_022BFB68: .word ov10_022C7884
	arm_func_end ov10_022BFAA8

	arm_func_start ov10_022BFB6C
ov10_022BFB6C: ; 0x022BFB6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x20
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov10_022BE9A0
	mvn r1, #0
	cmp r0, r1
	beq _022BFC4C
	ldr r2, _022BFC54 ; =ov10_022DC1C0
	mov r1, #0x13c
	ldr r2, [r2]
	mla ip, r0, r1, r2
	add r0, ip, #0x100
	ldrsh r1, [r0, #0x36]
	cmp r1, #0
	ldreqsh r0, [r0, #0x38]
	cmpeq r0, #0
	ldreqh r0, [r6]
	streqh r0, [ip, #0x20]
	ldreqh r0, [r6, #2]
	streqh r0, [ip, #0x22]
	ldr r0, [ip, #4]
	cmp r0, #6
	addeq r0, r4, #1
	streq r0, [ip, #0x2c]
	beq _022BFC24
	ldr r0, [ip, #0x10]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	adds r0, r1, r0, ror #29
	addne r0, r4, #1
	strne r0, [ip, #0x2c]
	bne _022BFC24
	ldr r6, _022BFC58 ; =ov10_022C7890
	add r7, sp, #0
	ldmia r6!, {r0, r1, r2, r3}
	mov lr, r7
	stmia r7!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	ldr r6, [sp, #0x38]
	and r0, r6, #7
	ldr r0, [lr, r0, lsl #2]
	add r0, r4, r0
	str r0, [ip, #0x2c]
_022BFC24:
	ldrsb r1, [ip, #0x28]
	mvn r0, #0
	cmp r1, r0
	ldrneh r0, [r5]
	strneh r0, [ip, #0x24]
	ldrneh r0, [r5, #2]
	strneh r0, [ip, #0x26]
	moveq r0, #0
	streqh r0, [ip, #0x24]
	streqh r0, [ip, #0x26]
_022BFC4C:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022BFC54: .word ov10_022DC1C0
_022BFC58: .word ov10_022C7890
	arm_func_end ov10_022BFB6C

	arm_func_start ov10_022BFC5C
ov10_022BFC5C: ; 0x022BFC5C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x2c
	ldr r5, _022BFD18 ; =ov10_022C79AC
	add lr, sp, #0
	mov r4, r0
	mov ip, #2
_022BFC74:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022BFC74
	ldmia r5, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldrh r0, [r4]
	bl GetMoveAnimation
	ldrsh r0, [r0, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	ldrh r0, [r4, #4]
	strh r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	strh r0, [sp, #0xe]
	ldrh r0, [r4, #8]
	strh r0, [sp, #0x10]
	ldrh r0, [r4, #0xa]
	strh r0, [sp, #0x12]
	ldrh r0, [r4]
	bl GetMoveAnimation
	ldrsh r0, [r0, #4]
	bl GetEffectAnimation
	ldrsb r0, [r0, #0x19]
	ldr r3, _022BFD1C ; =ov10_022C7884
	add r2, sp, #0x1c
	strb r0, [sp, #0x14]
	mov r1, #6
_022BFCF0:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022BFCF0
	add r1, sp, #0
	mov r0, #6
	mov r2, #0
	bl ov10_022BE780
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022BFD18: .word ov10_022C79AC
_022BFD1C: .word ov10_022C7884
	arm_func_end ov10_022BFC5C

	arm_func_start ov10_022BFD20
ov10_022BFD20: ; 0x022BFD20
	stmdb sp!, {r4, lr}
	mov r0, #2
	mov r1, #0
	bl ov10_022C07E8
	mov r4, r0
	mov r0, #2
	mov r1, #1
	bl ov10_022C07E8
	orr r4, r4, r0
	mov r0, #3
	mov r1, #0
	bl ov10_022C07E8
	orr r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end ov10_022BFD20
