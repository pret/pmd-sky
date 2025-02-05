	.include "asm/macros.inc"
	.include "overlay_22.inc"

	.text

	arm_func_start ov22_0238A140
ov22_0238A140: ; 0x0238A140
	stmdb sp!, {r3, lr}
	bl ov22_0238A320
	bl ov22_0238A150
	ldmia sp!, {r3, pc}
	arm_func_end ov22_0238A140

	arm_func_start ov22_0238A150
ov22_0238A150: ; 0x0238A150
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0238A210 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r2, _0238A214 ; =0x0000032D
	ldr r1, [r0, #4]
	mov r3, #0x10
	strh r2, [r1, #8]
	ldr r1, [r0, #4]
	mov r2, #0xd
	str r3, [r1, #0xc]
	ldr r1, [r0, #4]
	mov r0, #0x12
	str r2, [r1, #4]
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r2, _0238A210 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r1, _0238A218 ; =ov22_0238A67C
	ldr ip, [r2, #4]
	mov r3, #8
	str r0, [ip]
	str r1, [sp]
	ldr r1, [r2, #4]
	ldr r0, _0238A21C ; =SHOP_WINDOW_PARAMS_1
	ldr ip, [r1, #0x9c]
	ldr r1, _0238A220 ; =0x00401C33
	str ip, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r2, #4]
	ldr r3, _0238A224 ; =ov22_0238A640
	bl CreateCollectionMenu
	ldr r2, _0238A210 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r1, #0x76
	ldr r3, [r2, #4]
	strb r0, [r3, #0x98]
	ldr r0, [r2, #4]
	ldrsb r0, [r0, #0x98]
	bl SetCollectionMenuWidth
	ldr r0, _0238A210 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r1, _0238A228 ; =ov22_0238A774
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl SetCollectionMenuVoidFn
	mov r0, #0
	bl sub_0204440C
	ldr r0, _0238A210 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0238A210: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
#ifdef JAPAN
_0238A214: .word 0x000031F2
#else
_0238A214: .word 0x0000032D
#endif
_0238A218: .word ov22_0238A67C
_0238A21C: .word SHOP_WINDOW_PARAMS_1
_0238A220: .word 0x00401C33
_0238A224: .word ov22_0238A640
_0238A228: .word ov22_0238A774
	arm_func_end ov22_0238A150

	arm_func_start ov22_0238A22C
ov22_0238A22C: ; 0x0238A22C
	bx lr
	arm_func_end ov22_0238A22C

	arm_func_start ov22_0238A230
ov22_0238A230: ; 0x0238A230
	stmdb sp!, {r3, lr}
	ldr r0, _0238A2A8 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #0x98]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _0238A284
	ldr r0, _0238A2A8 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202C75C
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0238A2A8 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	moveq r0, #2
	strneh r0, [r1]
	movne r0, #3
	ldmia sp!, {r3, pc}
_0238A284:
	ldr r0, _0238A2A8 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202C748
	and r1, r0, #0xff
	mov r0, #0x12
	bl Arm9StoreUnkFieldNa0x2029ED8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A2A8: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A230

	arm_func_start ov22_0238A2AC
ov22_0238A2AC: ; 0x0238A2AC
	ldr r0, _0238A2BC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldrsh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0238A2BC: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A2AC

	arm_func_start ov22_0238A2C0
ov22_0238A2C0: ; 0x0238A2C0
	stmdb sp!, {r3, lr}
	mov r0, #0x398
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A2F0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	str r0, [r1, #4]
	bl ov22_0238A320
	ldr r0, _0238A2F0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x98]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A2F0: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A2C0

	arm_func_start ov22_0238A2F4
ov22_0238A2F4: ; 0x0238A2F4
	stmdb sp!, {r3, lr}
	ldr r0, _0238A31C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238A31C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A31C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A2F4

	arm_func_start ov22_0238A320
ov22_0238A320: ; 0x0238A320
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x64
	mov r3, #0
	ldr r0, _0238A4C0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r2, r3
_0238A334:
	ldr r1, [r0, #4]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0x390]
	cmp r3, #8
	blt _0238A334
	bl sub_02010830
	mov sl, #0
	ldr r4, _0238A4C0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r8, #3
	ldr r1, [r4, #4]
	mov r7, #1
	str r0, [r1, #0x9c]
	mov r6, sl
	mov r5, #0x6a
	mov fp, sl
	b _0238A488
_0238A378:
	and r0, sl, #0xff
	bl sub_02010898
	ldrsh r1, [r0]
	strh r1, [sp, #4]
	ldrh r1, [r0, #2]
	add r0, sp, #0
	strh r1, [sp, #2]
	strb r8, [sp]
	str r7, [sp, #8]
	strb r6, [sp, #0xc]
	strh r5, [sp, #0xe]
	strb r7, [sp, #0x10]
	bl GetActualBuyPrice
	ldr r1, [r4, #4]
	add r1, r1, sl, lsl #2
	str r0, [r1, #0x370]
	bl GetMoneyCarried
	ldr r1, [r4, #4]
	add r2, sp, #8
	add r1, r1, sl, lsl #2
	ldr r1, [r1, #0x370]
	cmp r1, r0
	add r0, sp, #0x14
	add r1, sp, #0
	bgt _0238A40C
	bl sub_0200D670
	mov r0, #0x50
	mul sb, sl, r0
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r0, r0, #0xe8
	add r0, r0, sb
	bl strcpy
	ldr r0, [r4, #4]
	add r0, r0, sl
	strb fp, [r0, #0x368]
	b _0238A464
_0238A40C:
	bl sub_0200D65C
	mov r0, #0x50
	mul sb, sl, r0
	ldr r0, [r4, #4]
	ldr r1, _0238A4C4 ; =ov22_0238E82C
	add r0, r0, #0xe8
	add r0, r0, sb
	bl strcpy
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r0, r0, #0xe8
	add r0, r0, sb
	bl strcat
	ldr r0, [r4, #4]
	ldr r1, _0238A4C8 ; =ov22_0238E834
	add r0, r0, #0xe8
	add r0, r0, sb
	bl strcat
	ldr r0, [r4, #4]
	add r1, r0, sl
	mov r0, #0
	strb r0, [r1, #0x368]
_0238A464:
	ldr r2, [r4, #4]
	add r0, r2, #0xe8
	add r1, r0, sb
	add r0, r2, sl, lsl #3
	str r1, [r0, #0xa0]
	ldr r0, [r4, #4]
	add r0, r0, sl, lsl #3
	str sl, [r0, #0xa4]
	add sl, sl, #1
_0238A488:
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x9c]
	cmp sl, r0
	blt _0238A378
	mov r2, #0
	add r1, r1, sl, lsl #3
	ldr r0, _0238A4C0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	str r2, [r1, #0xa0]
	ldr r0, [r0, #4]
	sub r1, r2, #1
	add r0, r0, sl, lsl #3
	str r1, [r0, #0xa4]
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238A4C0: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
_0238A4C4: .word ov22_0238E82C
_0238A4C8: .word ov22_0238E834
	arm_func_end ov22_0238A320

	arm_func_start ov22_0238A4CC
ov22_0238A4CC: ; 0x0238A4CC
	ldr r1, _0238A504 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r0, #0
	ldr r3, [r1, #4]
	mov r2, r0
	ldr ip, [r3, #0x9c]
	b _0238A4F8
_0238A4E4:
	add r1, r3, r2
	ldrb r1, [r1, #0x390]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
_0238A4F8:
	cmp r2, ip
	blt _0238A4E4
	bx lr
	.align 2, 0
_0238A504: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A4CC

	arm_func_start ov22_0238A508
ov22_0238A508: ; 0x0238A508
	ldr r1, _0238A540 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r0, #0
	ldr r2, [r1, #4]
	ldr r3, [r2, #0x9c]
	b _0238A530
_0238A51C:
	add r1, r2, r0
	ldrb r1, [r1, #0x390]
	cmp r1, #0
	bxne lr
	add r0, r0, #1
_0238A530:
	cmp r0, r3
	blt _0238A51C
	mvn r0, #0
	bx lr
	.align 2, 0
_0238A540: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A508

	arm_func_start ov22_0238A544
ov22_0238A544: ; 0x0238A544
	ldr r1, _0238A584 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r0, #0
	ldr r3, [r1, #4]
	mov r2, r0
	ldr ip, [r3, #0x9c]
	b _0238A578
_0238A55C:
	add r1, r3, r2
	ldrb r1, [r1, #0x390]
	cmp r1, #0
	addne r1, r3, r2, lsl #2
	ldrne r1, [r1, #0x370]
	add r2, r2, #1
	addne r0, r0, r1
_0238A578:
	cmp r2, ip
	blt _0238A55C
	bx lr
	.align 2, 0
_0238A584: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A544

	arm_func_start ov22_0238A588
ov22_0238A588: ; 0x0238A588
	stmdb sp!, {r4, lr}
	mov r4, r0
	and r0, r4, #0xff
	bl sub_02010898
	bl SpecialProcAddItemToBag
	and r0, r4, #0xff
	bl RemoveItemFromKecleonShop1
	ldr r0, _0238A5C8 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x370]
	rsb r0, r0, #0
	bl AddMoneyCarried
	bl sub_020108B4
	bl ov22_0238A320
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238A5C8: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A588

	arm_func_start ov22_0238A5CC
ov22_0238A5CC: ; 0x0238A5CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r5, r4
	ldr r6, _0238A63C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	b _0238A618
_0238A5E0:
	add r0, r1, r5
	ldrb r0, [r0, #0x390]
	cmp r0, #0
	beq _0238A614
	and r0, r5, #0xff
	bl sub_02010898
	bl SpecialProcAddItemToBag
	ldr r1, [r6, #4]
	and r0, r5, #0xff
	add r1, r1, r5, lsl #2
	ldr r1, [r1, #0x370]
	add r4, r4, r1
	bl RemoveItemFromKecleonShop1
_0238A614:
	add r5, r5, #1
_0238A618:
	ldr r1, [r6, #4]
	ldr r0, [r1, #0x9c]
	cmp r5, r0
	blt _0238A5E0
	rsb r0, r4, #0
	bl AddMoneyCarried
	bl sub_020108B4
	bl ov22_0238A320
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0238A63C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A5CC

	arm_func_start ov22_0238A640
ov22_0238A640: ; 0x0238A640
	ldr r0, _0238A678 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	add r0, r0, r1
	ldrb r0, [r0, #0x390]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r2]
	ldr r2, _0238A678 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r0, #0x50
	ldr r2, [r2, #4]
	add r2, r2, #0xe8
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_0238A678: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A640

	arm_func_start ov22_0238A67C
ov22_0238A67C: ; 0x0238A67C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	tst r0, #0x400
	mov r4, #0
	beq _0238A730
	ldr r0, _0238A770 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202C748
	ldr r1, _0238A770 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r5, r0
	ldr r0, [r1, #4]
	add r2, r0, #0x390
	ldrb r0, [r2, r5]
	cmp r0, #0
	beq _0238A6D0
	mov r1, r4
	mov r0, #6
	strb r1, [r2, r5]
	bl PlaySeVolumeWrapper
	mov r4, #1
	b _0238A730
_0238A6D0:
	bl GetCurrentBagCapacity
	mov r7, r0
	bl ov22_0238A4CC
	mov r6, r0
	bl GetNbItemsInBag
	add r0, r6, r0
	cmp r0, r7
	blt _0238A6F8
	cmp r6, #0
	bne _0238A728
_0238A6F8:
	ldr r0, _0238A770 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	ldr r0, [r0, #4]
	add r2, r0, r5
	ldrb r0, [r2, #0x368]
	cmp r0, #0
	bne _0238A728
	mov r1, #1
	mov r0, #6
	strb r1, [r2, #0x390]
	bl PlaySeVolumeWrapper
	mov r4, #1
	b _0238A730
_0238A728:
	mov r0, #2
	bl PlaySeVolumeWrapper
_0238A730:
	bl ov22_0238A4CC
	cmp r0, #0
	ble _0238A754
	ldr r0, _0238A770 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202D16C
	b _0238A768
_0238A754:
	ldr r0, _0238A770 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	mov r1, #0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202D16C
_0238A768:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0238A770: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC60
	arm_func_end ov22_0238A67C

	arm_func_start ov22_0238A774
ov22_0238A774: ; 0x0238A774
	stmdb sp!, {r3, lr}
	and r0, r0, #0xff
	bl sub_02010898
	ldrsh r0, [r0]
	bl sub_020444B0
	ldmia sp!, {r3, pc}
	arm_func_end ov22_0238A774

	arm_func_start ov22_0238A78C
ov22_0238A78C: ; 0x0238A78C
	stmdb sp!, {r3, lr}
	bl ov22_0238A96C
	bl ov22_0238A79C
	ldmia sp!, {r3, pc}
	arm_func_end ov22_0238A78C

	arm_func_start ov22_0238A79C
ov22_0238A79C: ; 0x0238A79C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0238A85C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r2, _0238A860 ; =0x0000032E
	ldr r1, [r0, #4]
	mov r3, #0x10
	strh r2, [r1, #8]
	ldr r1, [r0, #4]
	mov r2, #0xd
	str r3, [r1, #0xc]
	ldr r1, [r0, #4]
	mov r0, #0x13
	str r2, [r1, #4]
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r2, _0238A85C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r1, _0238A864 ; =ov22_0238ACC8
	ldr ip, [r2, #4]
	mov r3, #8
	str r0, [ip]
	str r1, [sp]
	ldr r1, [r2, #4]
	ldr r0, _0238A868 ; =SHOP_WINDOW_PARAMS_2
	ldr ip, [r1, #0x9c]
	ldr r1, _0238A86C ; =0x00401C33
	str ip, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r2, #4]
	ldr r3, _0238A870 ; =ov22_0238AC8C
	bl CreateCollectionMenu
	ldr r2, _0238A85C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r1, #0x76
	ldr r3, [r2, #4]
	strb r0, [r3, #0x98]
	ldr r0, [r2, #4]
	ldrsb r0, [r0, #0x98]
	bl SetCollectionMenuWidth
	ldr r0, _0238A85C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r1, _0238A874 ; =ov22_0238ADC0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl SetCollectionMenuVoidFn
	mov r0, #0
	bl sub_0204440C
	ldr r0, _0238A85C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0238A85C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
#ifdef JAPAN
_0238A860: .word 0x000031F3
#else
_0238A860: .word 0x0000032E
#endif
_0238A864: .word ov22_0238ACC8
_0238A868: .word SHOP_WINDOW_PARAMS_2
_0238A86C: .word 0x00401C33
_0238A870: .word ov22_0238AC8C
_0238A874: .word ov22_0238ADC0
	arm_func_end ov22_0238A79C

	arm_func_start ov22_0238A878
ov22_0238A878: ; 0x0238A878
	bx lr
	arm_func_end ov22_0238A878

	arm_func_start ov22_0238A87C
ov22_0238A87C: ; 0x0238A87C
	stmdb sp!, {r3, lr}
	ldr r0, _0238A8F4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #0x98]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _0238A8D0
	ldr r0, _0238A8F4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202C75C
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0238A8F4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	moveq r0, #2
	strneh r0, [r1]
	movne r0, #3
	ldmia sp!, {r3, pc}
_0238A8D0:
	ldr r0, _0238A8F4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202C748
	and r1, r0, #0xff
	mov r0, #0x13
	bl Arm9StoreUnkFieldNa0x2029ED8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A8F4: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238A87C

	arm_func_start ov22_0238A8F8
ov22_0238A8F8: ; 0x0238A8F8
	ldr r0, _0238A908 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldrsh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0238A908: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238A8F8

	arm_func_start ov22_0238A90C
ov22_0238A90C: ; 0x0238A90C
	stmdb sp!, {r3, lr}
	mov r0, #0x234
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A93C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	str r0, [r1, #4]
	bl ov22_0238A96C
	ldr r0, _0238A93C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x98]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A93C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238A90C

	arm_func_start ov22_0238A940
ov22_0238A940: ; 0x0238A940
	stmdb sp!, {r3, lr}
	ldr r0, _0238A968 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238A968 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A968: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238A940

	arm_func_start ov22_0238A96C
ov22_0238A96C: ; 0x0238A96C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x64
	mov r3, #0
	ldr r0, _0238AB0C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r2, r3
_0238A980:
	ldr r1, [r0, #4]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0x230]
	cmp r3, #4
	blt _0238A980
	bl sub_02010B3C
	mov sl, #0
	ldr r4, _0238AB0C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r8, #3
	ldr r1, [r4, #4]
	mov r7, #1
	str r0, [r1, #0x9c]
	mov r6, sl
	mov r5, #0x6a
	mov fp, sl
	b _0238AAD4
_0238A9C4:
	and r0, sl, #0xff
	bl sub_02010BA4
	ldrsh r1, [r0]
	strh r1, [sp, #4]
	ldrh r1, [r0, #2]
	add r0, sp, #0
	strh r1, [sp, #2]
	strb r8, [sp]
	str r7, [sp, #8]
	strb r6, [sp, #0xc]
	strh r5, [sp, #0xe]
	strb r7, [sp, #0x10]
	bl GetActualBuyPrice
	ldr r1, [r4, #4]
	add r1, r1, sl, lsl #2
	str r0, [r1, #0x210]
	bl GetMoneyCarried
	ldr r1, [r4, #4]
	add r2, sp, #8
	add r1, r1, sl, lsl #2
	ldr r1, [r1, #0x210]
	cmp r1, r0
	add r0, sp, #0x14
	add r1, sp, #0
	bgt _0238AA58
	bl sub_0200D670
	mov r0, #0x50
	mul sb, sl, r0
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r0, r0, #0xc8
	add r0, r0, sb
	bl strcpy
	ldr r0, [r4, #4]
	add r0, r0, sl
	strb fp, [r0, #0x208]
	b _0238AAB0
_0238AA58:
	bl sub_0200D65C
	mov r0, #0x50
	mul sb, sl, r0
	ldr r0, [r4, #4]
	ldr r1, _0238AB10 ; =ov22_0238E84C
	add r0, r0, #0xc8
	add r0, r0, sb
	bl strcpy
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r0, r0, #0xc8
	add r0, r0, sb
	bl strcat
	ldr r0, [r4, #4]
	ldr r1, _0238AB14 ; =ov22_0238E854
	add r0, r0, #0xc8
	add r0, r0, sb
	bl strcat
	ldr r0, [r4, #4]
	add r1, r0, sl
	mov r0, #0
	strb r0, [r1, #0x208]
_0238AAB0:
	ldr r2, [r4, #4]
	add r0, r2, #0xc8
	add r1, r0, sb
	add r0, r2, sl, lsl #3
	str r1, [r0, #0xa0]
	ldr r0, [r4, #4]
	add r0, r0, sl, lsl #3
	str sl, [r0, #0xa4]
	add sl, sl, #1
_0238AAD4:
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x9c]
	cmp sl, r0
	blt _0238A9C4
	mov r2, #0
	add r1, r1, sl, lsl #3
	ldr r0, _0238AB0C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	str r2, [r1, #0xa0]
	ldr r0, [r0, #4]
	sub r1, r2, #1
	add r0, r0, sl, lsl #3
	str r1, [r0, #0xa4]
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238AB0C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
_0238AB10: .word ov22_0238E84C
_0238AB14: .word ov22_0238E854
	arm_func_end ov22_0238A96C

	arm_func_start ov22_0238AB18
ov22_0238AB18: ; 0x0238AB18
	ldr r1, _0238AB50 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r0, #0
	ldr r3, [r1, #4]
	mov r2, r0
	ldr ip, [r3, #0x9c]
	b _0238AB44
_0238AB30:
	add r1, r3, r2
	ldrb r1, [r1, #0x230]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
_0238AB44:
	cmp r2, ip
	blt _0238AB30
	bx lr
	.align 2, 0
_0238AB50: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238AB18

	arm_func_start ov22_0238AB54
ov22_0238AB54: ; 0x0238AB54
	ldr r1, _0238AB8C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r0, #0
	ldr r2, [r1, #4]
	ldr r3, [r2, #0x9c]
	b _0238AB7C
_0238AB68:
	add r1, r2, r0
	ldrb r1, [r1, #0x230]
	cmp r1, #0
	bxne lr
	add r0, r0, #1
_0238AB7C:
	cmp r0, r3
	blt _0238AB68
	mvn r0, #0
	bx lr
	.align 2, 0
_0238AB8C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238AB54

	arm_func_start ov22_0238AB90
ov22_0238AB90: ; 0x0238AB90
	ldr r1, _0238ABD0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r0, #0
	ldr r3, [r1, #4]
	mov r2, r0
	ldr ip, [r3, #0x9c]
	b _0238ABC4
_0238ABA8:
	add r1, r3, r2
	ldrb r1, [r1, #0x230]
	cmp r1, #0
	addne r1, r3, r2, lsl #2
	ldrne r1, [r1, #0x210]
	add r2, r2, #1
	addne r0, r0, r1
_0238ABC4:
	cmp r2, ip
	blt _0238ABA8
	bx lr
	.align 2, 0
_0238ABD0: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238AB90

	arm_func_start ov22_0238ABD4
ov22_0238ABD4: ; 0x0238ABD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	and r0, r4, #0xff
	bl sub_02010BA4
	bl SpecialProcAddItemToBag
	and r0, r4, #0xff
	bl RemoveItemFromKecleonShop2
	ldr r0, _0238AC14 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x210]
	rsb r0, r0, #0
	bl AddMoneyCarried
	bl sub_02010BC0
	bl ov22_0238A96C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238AC14: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238ABD4

	arm_func_start ov22_0238AC18
ov22_0238AC18: ; 0x0238AC18
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r5, r4
	ldr r6, _0238AC88 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	b _0238AC64
_0238AC2C:
	add r0, r1, r5
	ldrb r0, [r0, #0x230]
	cmp r0, #0
	beq _0238AC60
	and r0, r5, #0xff
	bl sub_02010BA4
	bl SpecialProcAddItemToBag
	ldr r1, [r6, #4]
	and r0, r5, #0xff
	add r1, r1, r5, lsl #2
	ldr r1, [r1, #0x210]
	add r4, r4, r1
	bl RemoveItemFromKecleonShop2
_0238AC60:
	add r5, r5, #1
_0238AC64:
	ldr r1, [r6, #4]
	ldr r0, [r1, #0x9c]
	cmp r5, r0
	blt _0238AC2C
	rsb r0, r4, #0
	bl AddMoneyCarried
	bl sub_02010BC0
	bl ov22_0238A96C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0238AC88: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238AC18

	arm_func_start ov22_0238AC8C
ov22_0238AC8C: ; 0x0238AC8C
	ldr r0, _0238ACC4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	add r0, r0, r1
	ldrb r0, [r0, #0x230]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r2]
	ldr r2, _0238ACC4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r0, #0x50
	ldr r2, [r2, #4]
	add r2, r2, #0xc8
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_0238ACC4: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238AC8C

	arm_func_start ov22_0238ACC8
ov22_0238ACC8: ; 0x0238ACC8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	tst r0, #0x400
	mov r4, #0
	beq _0238AD7C
	ldr r0, _0238ADBC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202C748
	ldr r1, _0238ADBC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r5, r0
	ldr r0, [r1, #4]
	add r2, r0, #0x230
	ldrb r0, [r2, r5]
	cmp r0, #0
	beq _0238AD1C
	mov r1, r4
	mov r0, #6
	strb r1, [r2, r5]
	bl PlaySeVolumeWrapper
	mov r4, #1
	b _0238AD7C
_0238AD1C:
	bl GetCurrentBagCapacity
	mov r7, r0
	bl ov22_0238AB18
	mov r6, r0
	bl GetNbItemsInBag
	add r0, r6, r0
	cmp r0, r7
	blt _0238AD44
	cmp r6, #0
	bne _0238AD74
_0238AD44:
	ldr r0, _0238ADBC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	ldr r0, [r0, #4]
	add r2, r0, r5
	ldrb r0, [r2, #0x208]
	cmp r0, #0
	bne _0238AD74
	mov r1, #1
	mov r0, #6
	strb r1, [r2, #0x230]
	bl PlaySeVolumeWrapper
	mov r4, #1
	b _0238AD7C
_0238AD74:
	mov r0, #2
	bl PlaySeVolumeWrapper
_0238AD7C:
	bl ov22_0238AB18
	cmp r0, #0
	ble _0238ADA0
	ldr r0, _0238ADBC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202D16C
	b _0238ADB4
_0238ADA0:
	ldr r0, _0238ADBC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	mov r1, #0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0x98]
	bl sub_0202D16C
_0238ADB4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0238ADBC: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC68
	arm_func_end ov22_0238ACC8

	arm_func_start ov22_0238ADC0
ov22_0238ADC0: ; 0x0238ADC0
	stmdb sp!, {r3, lr}
	and r0, r0, #0xff
	bl sub_02010BA4
	ldrsh r0, [r0]
	bl sub_020444B0
	ldmia sp!, {r3, pc}
	arm_func_end ov22_0238ADC0

	arm_func_start ov22_0238ADD8
ov22_0238ADD8: ; 0x0238ADD8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xac
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	ldr r0, [r2, #0x10]
	cmp r0, #0x30
	addls pc, pc, r0, lsl #2
	b _0238C16C
_0238AE00: ; jump table
	b _0238AEC4 ; case 0
	b _0238AF18 ; case 1
	b _0238AFB0 ; case 2
	b _0238B000 ; case 3
	b _0238B3C4 ; case 4
	b _0238B050 ; case 5
	b _0238B0A0 ; case 6
	b _0238B0F0 ; case 7
	b _0238B13C ; case 8
	b _0238B188 ; case 9
	b _0238B1D4 ; case 10
	b _0238B220 ; case 11
	b _0238B26C ; case 12
	b _0238B2BC ; case 13
	b _0238B30C ; case 14
	b _0238B374 ; case 15
	b _0238B3E0 ; case 16
	b _0238B43C ; case 17
	b _0238B748 ; case 18
	b _0238B498 ; case 19
	b _0238B510 ; case 20
	b _0238B594 ; case 21
	b _0238B680 ; case 22
	b _0238B5DC ; case 23
	b _0238BA48 ; case 24
	b _0238BC40 ; case 25
	b _0238C038 ; case 26
	b _0238C0A0 ; case 27
	b _0238B7D8 ; case 28
	b _0238B834 ; case 29
	b _0238BB58 ; case 30
	b _0238B890 ; case 31
	b _0238B8F0 ; case 32
	b _0238B958 ; case 33
	b _0238BA7C ; case 34
	b _0238B98C ; case 35
	b _0238BA14 ; case 36
	b _0238BEA4 ; case 37
	b _0238C06C ; case 38
	b _0238C110 ; case 39
	b _0238BBD8 ; case 40
	b _0238BFB4 ; case 41
	b _0238BFE8 ; case 42
	b _0238C16C ; case 43
	b _0238AF70 ; case 44
	b _0238C16C ; case 45
	b _0238C16C ; case 46
	b _0238C16C ; case 47
	b _0238AFA4 ; case 48
_0238AEC4:
	ldr r0, _0238BD64 ; =ov22_0238E9D0
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
	bl sub_02042AF8
	bl ov22_0238D554
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD68 ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BD6C ; =OVERLAY22_UNKNOWN_STRING_IDS
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238AF18:
	ldr r0, _0238BD70 ; =ov22_0238E9D8
	bl Debug_Print0
	bl sub_02042AF8
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, _0238BD74 ; =0x0000017F
	ldr r0, [r0]
	str r1, [r0, #0x50]
	bl ov22_0238D554
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD68 ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BD78 ; =ov22_0238E8F2
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238AF70:
	ldr r0, _0238BD7C ; =ov22_0238E9E4
	bl Debug_Print0
	mov r4, #5
	ldr r0, _0238BD80 ; =SHOP_WINDOW_PARAMS_6
	ldr r1, _0238BD84 ; =0x00300013
	ldr r3, _0238BD88 ; =SHOP_MAIN_MENU_ITEMS_3
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238AFA4:
	mov r0, #0
	str r0, [r2, #0xc]
	b _0238C16C
_0238AFB0:
	ldr r0, _0238BD8C ; =ov22_0238E9F4
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BD94 ; =ov22_0238E91E
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B000:
	ldr r0, _0238BD98 ; =ov22_0238EA04
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #4
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BD9C ; =ov22_0238E8F4
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B050:
	ldr r0, _0238BDA0 ; =ov22_0238EA10
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDA4 ; =ov22_0238E90A
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B0A0:
	ldr r0, _0238BDA8 ; =ov22_0238EA1C
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x11
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDAC ; =ov22_0238E90C
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B0F0:
	ldr r0, _0238BDB0 ; =ov22_0238EA28
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDB4 ; =ov22_0238E90E
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B13C:
	ldr r0, _0238BDB8 ; =ov22_0238EA34
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDBC ; =ov22_0238E91C
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B188:
	ldr r0, _0238BDC0 ; =ov22_0238EA40
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDC4 ; =ov22_0238E910
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B1D4:
	ldr r0, _0238BDC8 ; =ov22_0238EA4C
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDCC ; =ov22_0238E912
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B220:
	ldr r0, _0238BDD0 ; =ov22_0238EA58
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDD4 ; =ov22_0238E914
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B26C:
	ldr r0, _0238BDD8 ; =ov22_0238EA64
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDDC ; =ov22_0238E916
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B2BC:
	ldr r0, _0238BDE0 ; =ov22_0238EA70
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x11
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDE4 ; =ov22_0238E918
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B30C:
	ldr r0, _0238BDE8 ; =ov22_0238EA7C
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x1d
	ldr r4, [r1]
	mov r0, #1
	ldrsh r3, [r4, #0x30]
	str r3, [r4, #0x64]
	ldr r4, [r1]
	ldrh r3, [r4, #0x2e]
	str r3, [r4, #0x78]
	ldr r1, [r1]
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDEC ; =ov22_0238E91A
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B374:
	ldr r0, _0238BDF0 ; =ov22_0238EA88
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x1d
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDBC ; =ov22_0238E91C
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B3C4:
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _0238B3D8
	bl ov22_0238A22C
	b _0238C16C
_0238B3D8:
	bl ov22_0238A878
	b _0238C16C
_0238B3E0:
	ldr r0, _0238BDF4 ; =ov22_0238EA94
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x13
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BDF8 ; =ov22_0238E8F6
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B43C:
	ldr r0, _0238BDFC ; =ov22_0238EAA8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x14
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238BE00 ; =ov22_0238E8F8
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD90 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B498:
	ldr r0, _0238BE04 ; =ov22_0238EAB8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238B4EC
	bl ov22_0238A140
	b _0238B4F0
_0238B4EC:
	bl ov22_0238A78C
_0238B4F0:
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	mov r0, #0
	bl sub_0204426C
	mov r0, #0
	bl sub_02044568
	b _0238C16C
_0238B510:
	ldr r0, _0238BE08 ; =ov22_0238EAC8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238BD74 ; =0x0000017F
	ldr r1, [r0]
	str r2, [r1, #0x9c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238B570
	bl ov22_0238A150
	b _0238B574
_0238B570:
	bl ov22_0238A79C
_0238B574:
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	mov r0, #0
	bl sub_0204426C
	mov r0, #0
	bl sub_02044568
	b _0238C16C
_0238B594:
	ldr r0, _0238BE0C ; =ov22_0238EAD8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r3, _0238BE10 ; =SHOP_MAIN_MENU_ITEMS_2
	ldr r0, [r0]
	mov r4, #3
	ldrb r0, [r0, #8]
	mov r1, #0x13
	mov r2, #0
	cmp r0, #0
	ldrne r0, _0238BE14 ; =SHOP_WINDOW_PARAMS_7
	str r4, [sp]
	ldreq r0, _0238BE18 ; =SHOP_WINDOW_PARAMS_10
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238B5DC:
	ldr r0, _0238BE1C ; =ov22_0238EAE8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238BE20 ; =OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
	ldr r1, [r0]
	add r0, r1, #0xe0
	add r1, r1, #0x2c
	bl sub_0200D670
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r3, [r1]
	add r2, r3, #0xe0
	str r2, [r3, #0x88]
	ldr r3, [r1]
	ldrsh r2, [r3, #0x30]
	str r2, [r3, #0x64]
	ldr r3, [r1]
	ldrh r2, [r3, #0x2e]
	str r2, [r3, #0x78]
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	str r1, [r2, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD68 ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BE24 ; =ov22_0238E8FA
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x2f
	ldr r2, [r0]
	mov r1, #0x18
	str r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238C16C
_0238B680:
	ldrsh r1, [r2, #0x30]
	ldrh r2, [r2, #0x2e]
	ldr r0, _0238BE28 ; =ov22_0238EAF8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	add r0, r0, #0x50
	bl InitPreprocessorArgs
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238BE2C ; =ov22_0238EB14
	ldr r5, [r0]
	ldr r3, _0238BE30 ; =0x0000C402
	ldrh r4, [r5, #0x2e]
	mov r1, #0x400
	str r4, [r5, #0x50]
	ldr r5, [r0]
	ldrsh r4, [r5, #0x30]
	str r4, [r5, #0x60]
	ldr r5, [r0]
	ldrh r4, [r5, #0x2e]
	str r4, [r5, #0x74]
	ldr r0, [r0]
	add r4, r0, #0x50
	add r0, r0, #0xa0
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0xc
	bl InitPreprocessorArgs
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	add r1, sp, #0xc
	ldr r3, [r0]
	ldr r0, _0238BE34 ; =SHOP_WINDOW_PARAMS_9
	add r2, r3, #0xa0
	str r2, [sp, #0x44]
	str r1, [sp]
	ldrsh r2, [r3, #0x30]
	add r3, r3, #0x50
	ldr r1, _0238BE38 ; =0x00001013
#if defined(EUROPE)
	add r2, r2, #0xd3
	add r2, r2, #0x2900
#elif defined(JAPAN)
	add r2, r2, #0xce
	add r2, r2, #0x4100
#else
	add r2, r2, #0xd1
	add r2, r2, #0x2900
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	stmib sp, {r2, r3}
	ldr r3, _0238BE3C ; =0x0000033E
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4d]
	b _0238C16C
_0238B748:
	ldr r0, _0238BE40 ; =ov22_0238EB20
	bl Debug_Print0
	bl ov22_0238D528
	cmp r0, #0
	bne _0238B790
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238B778
	bl ov22_0238A22C
	b _0238B77C
_0238B778:
	bl ov22_0238A878
_0238B77C:
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238B7A0
_0238B790:
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0, #0x14]
_0238B7A0:
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238BE44 ; =ov22_0238E8FE
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD90 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B7D8:
	ldr r0, _0238BE48 ; =ov22_0238EB30
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x1f
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BE4C ; =ov22_0238E900
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B834:
	ldr r0, _0238BE50 ; =ov22_0238EB40
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x20
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238BE54 ; =ov22_0238E902
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD90 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238B890:
	ldr r0, _0238BE58 ; =ov22_0238EB50
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	bl sub_02042730
	mov r0, #4
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0238C16C
_0238B8F0:
	ldr r0, _0238BE5C ; =ov22_0238EB60
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238BD74 ; =0x0000017F
	ldr r1, [r0]
	str r2, [r1, #0x9c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	mov r0, #4
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0238C16C
_0238B958:
	ldr r0, _0238BE60 ; =ov22_0238EB70
	bl Debug_Print0
	mov r4, #3
	ldr r0, _0238BE14 ; =SHOP_WINDOW_PARAMS_7
	ldr r3, _0238BE64 ; =SHOP_MAIN_MENU_ITEMS_1
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238B98C:
	ldr r0, _0238BE68 ; =ov22_0238EB80
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238BE20 ; =OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
	ldr r1, [r0]
	add r0, r1, #0xe0
	add r1, r1, #0x2c
	bl sub_0200D670
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r4, #0x2f
	ldr r3, [r1]
	mov r2, #0x24
	add r0, r3, #0xe0
	str r0, [r3, #0x88]
	ldr r5, [r1]
	mov r0, #0
	ldr r3, [r5, #0x1c]
	str r3, [r5, #0x74]
	ldr r3, [r1]
	str r4, [r3, #0x10]
	ldr r1, [r1]
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD68 ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BE6C ; =ov22_0238E904
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238BA14:
	ldr r0, _0238BE70 ; =ov22_0238EB90
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238BE74 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238BD84 ; =0x00300013
	ldr r3, _0238BE78 ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238BA48:
	ldr r0, _0238BE7C ; =ov22_0238EBA4
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238BE74 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238BD84 ; =0x00300013
	ldr r3, _0238BE78 ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238BA7C:
	ldr r0, _0238BE80 ; =ov22_0238EBB8
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	add r0, r0, #0x50
	bl InitPreprocessorArgs
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r5, #0
	ldr r6, [r0]
	ldr r2, _0238BE2C ; =ov22_0238EB14
	ldrh r4, [r6, #0x2e]
	ldr r3, _0238BE30 ; =0x0000C402
	mov r1, #0x400
	str r4, [r6, #0x50]
	ldr r6, [r0]
	ldrsh r4, [r6, #0x30]
	str r4, [r6, #0x60]
	ldr r6, [r0]
	ldrh r4, [r6, #0x2e]
	str r4, [r6, #0x74]
	ldr r6, [r0]
	ldrh r4, [r6, #0x2e]
	add r4, r4, #0xbc
	str r4, [r6, #0x68]
	ldr r4, [r0]
	str r5, [r4, #0x7c]
	ldr r0, [r0]
	add r4, r0, #0x50
	add r0, r0, #0xa0
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0x5c
	bl InitPreprocessorArgs
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	add r1, sp, #0x5c
	ldr r3, [r0]
	ldr r0, _0238BE34 ; =SHOP_WINDOW_PARAMS_9
	add r2, r3, #0xa0
	str r2, [sp, #0x94]
	str r1, [sp]
	ldrsh r2, [r3, #0x30]
	add r3, r3, #0x50
	ldr r1, _0238BE38 ; =0x00001013
#if defined(EUROPE)
	add r2, r2, #0xd3
	add r2, r2, #0x2900
#elif defined(JAPAN)
	add r2, r2, #0xce
	add r2, r2, #0x4100
#else
	add r2, r2, #0xd1
	add r2, r2, #0x2900
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	stmib sp, {r2, r3}
	ldr r3, _0238BE3C ; =0x0000033E
	mov r2, r5
	bl CreateScrollBoxSingle
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4d]
	b _0238C16C
_0238BB58:
	ldr r0, _0238BE84 ; =ov22_0238EBC8
	bl Debug_Print0
	bl GetNbItemsInBag
	cmp r0, #0
	beq _0238BB7C
	bl GetMoneyCarried
	ldr r1, _0238BE88 ; =0x0001869F
	cmp r0, r1
	blt _0238BB90
_0238BB7C:
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238BBA0
_0238BB90:
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x1d
	ldr r0, [r0]
	str r1, [r0, #0x14]
_0238BBA0:
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238BE8C ; =ov22_0238E908
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD90 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238BBD8:
	ldr r0, _0238BE90 ; =ov22_0238EBD8
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x28]
	str r1, [r2, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x2f
	ldr r1, [r0]
	mov r3, #0x29
	str r2, [r1, #0x10]
	ldr r2, [r0]
	ldr r1, _0238BD68 ; =0x00003008
	str r3, [r2, #0x14]
	ldr r3, [r0]
	mov r2, #0x30
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BE94 ; =ov22_0238E906
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238BC40:
	ldr r0, _0238BE98 ; =ov22_0238EBE4
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238BC7C
	bl ov22_0238A4CC
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bl ov22_0238A544
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	b _0238BC94
_0238BC7C:
	bl ov22_0238AB18
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bl ov22_0238AB90
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238BC94:
	ldr r1, [r1]
	str r0, [r1, #0x28]
	bl GetMoneyCarried
	cmp r0, #0
	bne _0238BCCC
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #6
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x14]
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov22_0238C184
	b _0238C16C
_0238BCCC:
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r5, [r0]
	ldr r4, [r5, #0x28]
	bl GetMoneyCarried
	cmp r4, r0
	ble _0238BD04
	mov r1, #0xd
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	str r1, [r5, #0x14]
	ldr r0, [r0]
	mov r1, #0x30
	str r1, [r0, #0x10]
	bl ov22_0238C184
	b _0238C16C
_0238BD04:
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r1, [r1]
	str r4, [r1, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x2f
	ldr r1, [r0]
	mov r3, #0x1a
	str r2, [r1, #0x10]
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x14]
	ldr r4, [r0]
	ldr r2, _0238BE9C ; =ov22_0238E8FC
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD68 ; =0x00003008
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
	.align 2, 0
_0238BD60: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238BD64: .word ov22_0238E9D0
_0238BD68: .word 0x00003008
_0238BD6C: .word OVERLAY22_UNKNOWN_STRING_IDS
_0238BD70: .word ov22_0238E9D8
_0238BD74: .word 0x0000017F
_0238BD78: .word ov22_0238E8F2
_0238BD7C: .word ov22_0238E9E4
_0238BD80: .word SHOP_WINDOW_PARAMS_6
_0238BD84: .word 0x00300013
_0238BD88: .word SHOP_MAIN_MENU_ITEMS_3
_0238BD8C: .word ov22_0238E9F4
_0238BD90: .word 0x00003018
_0238BD94: .word ov22_0238E91E
_0238BD98: .word ov22_0238EA04
_0238BD9C: .word ov22_0238E8F4
_0238BDA0: .word ov22_0238EA10
_0238BDA4: .word ov22_0238E90A
_0238BDA8: .word ov22_0238EA1C
_0238BDAC: .word ov22_0238E90C
_0238BDB0: .word ov22_0238EA28
_0238BDB4: .word ov22_0238E90E
_0238BDB8: .word ov22_0238EA34
_0238BDBC: .word ov22_0238E91C
_0238BDC0: .word ov22_0238EA40
_0238BDC4: .word ov22_0238E910
_0238BDC8: .word ov22_0238EA4C
_0238BDCC: .word ov22_0238E912
_0238BDD0: .word ov22_0238EA58
_0238BDD4: .word ov22_0238E914
_0238BDD8: .word ov22_0238EA64
_0238BDDC: .word ov22_0238E916
_0238BDE0: .word ov22_0238EA70
_0238BDE4: .word ov22_0238E918
_0238BDE8: .word ov22_0238EA7C
_0238BDEC: .word ov22_0238E91A
_0238BDF0: .word ov22_0238EA88
_0238BDF4: .word ov22_0238EA94
_0238BDF8: .word ov22_0238E8F6
_0238BDFC: .word ov22_0238EAA8
_0238BE00: .word ov22_0238E8F8
_0238BE04: .word ov22_0238EAB8
_0238BE08: .word ov22_0238EAC8
_0238BE0C: .word ov22_0238EAD8
_0238BE10: .word SHOP_MAIN_MENU_ITEMS_2
_0238BE14: .word SHOP_WINDOW_PARAMS_7
_0238BE18: .word SHOP_WINDOW_PARAMS_10
_0238BE1C: .word ov22_0238EAE8
_0238BE20: .word OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
_0238BE24: .word ov22_0238E8FA
_0238BE28: .word ov22_0238EAF8
_0238BE2C: .word ov22_0238EB14
_0238BE30: .word 0x0000C402
_0238BE34: .word SHOP_WINDOW_PARAMS_9
_0238BE38: .word 0x00001013
#ifdef JAPAN
_0238BE3C: .word 0x00003203
#else
_0238BE3C: .word 0x0000033E
#endif
_0238BE40: .word ov22_0238EB20
_0238BE44: .word ov22_0238E8FE
_0238BE48: .word ov22_0238EB30
_0238BE4C: .word ov22_0238E900
_0238BE50: .word ov22_0238EB40
_0238BE54: .word ov22_0238E902
_0238BE58: .word ov22_0238EB50
_0238BE5C: .word ov22_0238EB60
_0238BE60: .word ov22_0238EB70
_0238BE64: .word SHOP_MAIN_MENU_ITEMS_1
_0238BE68: .word ov22_0238EB80
_0238BE6C: .word ov22_0238E904
_0238BE70: .word ov22_0238EB90
_0238BE74: .word SHOP_WINDOW_PARAMS_8
_0238BE78: .word SHOP_MENU_ITEMS_CONFIRM
_0238BE7C: .word ov22_0238EBA4
_0238BE80: .word ov22_0238EBB8
_0238BE84: .word ov22_0238EBC8
_0238BE88: .word 0x0001869F
_0238BE8C: .word ov22_0238E908
_0238BE90: .word ov22_0238EBD8
_0238BE94: .word ov22_0238E906
_0238BE98: .word ov22_0238EBE4
_0238BE9C: .word ov22_0238E8FC
_0238BEA0: .word ov22_0238EBF0
_0238BEA4:
	ldr r0, _0238BEA0 ; =ov22_0238EBF0
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r8, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r6, #0
	ldr r0, [r8]
	mov r4, r6
	str r6, [r0, #0x24]
	ldr r0, [r8]
	mov r5, #1
	str r6, [r0, #0x28]
	mov r7, #6
_0238BED4:
	ldr r0, [r8]
	mul r1, r6, r7
	ldr r0, [r0, #0x44]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sb, r2, r1
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0238BF48
	ldrsh r0, [sb, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _0238BF48
	mov r0, r6
	bl sub_02042B84
	cmp r0, #0
	beq _0238BF48
	mov r0, sb
	bl GetActualSellPrice
	ldr r2, [r8]
	ldr r1, [r2, #0x28]
	add r0, r1, r0
	str r0, [r2, #0x28]
	ldr r1, [r8]
	ldr r0, [r1, #0x24]
	add r0, r0, #1
	str r0, [r1, #0x24]
_0238BF48:
	add r6, r6, #1
	cmp r6, #0x32
	blt _0238BED4
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x28]
	str r1, [r2, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x2f
	ldr r1, [r0]
	mov r3, #0x26
	str r2, [r1, #0x10]
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x14]
	ldr r4, [r0]
	ldr r2, _0238BE94 ; =ov22_0238E906
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD68 ; =0x00003008
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238BFB4:
	ldr r0, _0238C174 ; =ov22_0238EC00
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238BE74 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238BD84 ; =0x00300013
	ldr r3, _0238BE78 ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238BFE8:
	ldr r0, _0238C178 ; =ov22_0238EC10
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238BE8C ; =ov22_0238E908
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD90 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238C038:
	ldr r0, _0238C174 ; =ov22_0238EC00
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238BE74 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238BD84 ; =0x00300013
	ldr r3, _0238BE78 ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238C06C:
	ldr r0, _0238C174 ; =ov22_0238EC00
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238BE74 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238BD84 ; =0x00300013
	ldr r3, _0238BE78 ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238C16C
_0238C0A0:
	ldr r0, _0238C17C ; =ov22_0238EC24
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	bl ov22_0238D528
	cmp r0, #0
	ldreq r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	moveq r1, #0xc
	ldrne r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	movne r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x14]
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238BE44 ; =ov22_0238E8FE
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238BD90 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238C16C
_0238C110:
	ldr r0, _0238C180 ; =ov22_0238EC38
	bl Debug_Print0
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238BD60 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238BD90 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238BE8C ; =ov22_0238E908
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	bl sub_02042AF8
_0238C16C:
	add sp, sp, #0xac
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238C174: .word ov22_0238EC00
_0238C178: .word ov22_0238EC10
_0238C17C: .word ov22_0238EC24
_0238C180: .word ov22_0238EC38
	arm_func_end ov22_0238ADD8

	arm_func_start ov22_0238C184
ov22_0238C184: ; 0x0238C184
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xac
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, #0x30
	addls pc, pc, r0, lsl #2
	b _0238D510
_0238C1A4: ; jump table
	b _0238C268 ; case 0
	b _0238C2BC ; case 1
	b _0238C354 ; case 2
	b _0238C3A4 ; case 3
	b _0238C768 ; case 4
	b _0238C3F4 ; case 5
	b _0238C444 ; case 6
	b _0238C494 ; case 7
	b _0238C4E0 ; case 8
	b _0238C52C ; case 9
	b _0238C578 ; case 10
	b _0238C5C4 ; case 11
	b _0238C610 ; case 12
	b _0238C660 ; case 13
	b _0238C6B0 ; case 14
	b _0238C718 ; case 15
	b _0238C784 ; case 16
	b _0238C7E0 ; case 17
	b _0238CAEC ; case 18
	b _0238C83C ; case 19
	b _0238C8B4 ; case 20
	b _0238C938 ; case 21
	b _0238CA24 ; case 22
	b _0238C980 ; case 23
	b _0238CDEC ; case 24
	b _0238CFE4 ; case 25
	b _0238D3DC ; case 26
	b _0238D444 ; case 27
	b _0238CB7C ; case 28
	b _0238CBD8 ; case 29
	b _0238CEFC ; case 30
	b _0238CC34 ; case 31
	b _0238CC94 ; case 32
	b _0238CCFC ; case 33
	b _0238CE20 ; case 34
	b _0238CD30 ; case 35
	b _0238CDB8 ; case 36
	b _0238D248 ; case 37
	b _0238D410 ; case 38
	b _0238D4B4 ; case 39
	b _0238CF7C ; case 40
	b _0238D358 ; case 41
	b _0238D38C ; case 42
	b _0238D510 ; case 43
	b _0238C314 ; case 44
	b _0238D510 ; case 45
	b _0238D510 ; case 46
	b _0238D510 ; case 47
	b _0238C348 ; case 48
_0238C268:
	ldr r0, _0238D108 ; =ov22_0238E9D0
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
	bl sub_02042AF8
	bl ov22_0238D554
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D10C ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D110 ; =OVERLAY22_UNKNOWN_STRING_IDS
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C2BC:
	ldr r0, _0238D114 ; =ov22_0238E9D8
	bl Debug_Print0
	bl sub_02042AF8
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, _0238D118 ; =0x0000017F
	ldr r0, [r0]
	str r1, [r0, #0x50]
	bl ov22_0238D554
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D10C ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D11C ; =ov22_0238E8F2
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C314:
	ldr r0, _0238D120 ; =ov22_0238E9E4
	bl Debug_Print0
	mov r4, #5
	ldr r0, _0238D124 ; =SHOP_WINDOW_PARAMS_6
	ldr r1, _0238D128 ; =0x00300013
	ldr r3, _0238D12C ; =SHOP_MAIN_MENU_ITEMS_3
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238C348:
	mov r0, #0
	str r0, [r2, #0xc]
	b _0238D510
_0238C354:
	ldr r0, _0238D130 ; =ov22_0238E9F4
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D138 ; =ov22_0238E91E
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C3A4:
	ldr r0, _0238D13C ; =ov22_0238EA04
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #4
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D140 ; =ov22_0238E8F4
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C3F4:
	ldr r0, _0238D144 ; =ov22_0238EA10
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D148 ; =ov22_0238E90A
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C444:
	ldr r0, _0238D14C ; =ov22_0238EA1C
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x11
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D150 ; =ov22_0238E90C
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C494:
	ldr r0, _0238D154 ; =ov22_0238EA28
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D158 ; =ov22_0238E90E
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C4E0:
	ldr r0, _0238D15C ; =ov22_0238EA34
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D160 ; =ov22_0238E91C
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C52C:
	ldr r0, _0238D164 ; =ov22_0238EA40
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D168 ; =ov22_0238E910
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C578:
	ldr r0, _0238D16C ; =ov22_0238EA4C
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D170 ; =ov22_0238E912
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C5C4:
	ldr r0, _0238D174 ; =ov22_0238EA58
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #1
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D178 ; =ov22_0238E914
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C610:
	ldr r0, _0238D17C ; =ov22_0238EA64
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D180 ; =ov22_0238E916
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C660:
	ldr r0, _0238D184 ; =ov22_0238EA70
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x11
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D188 ; =ov22_0238E918
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C6B0:
	ldr r0, _0238D18C ; =ov22_0238EA7C
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x1d
	ldr r4, [r1]
	mov r0, #1
	ldrsh r3, [r4, #0x30]
	str r3, [r4, #0x64]
	ldr r4, [r1]
	ldrh r3, [r4, #0x2e]
	str r3, [r4, #0x78]
	ldr r1, [r1]
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D190 ; =ov22_0238E91A
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C718:
	ldr r0, _0238D194 ; =ov22_0238EA88
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x1d
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D160 ; =ov22_0238E91C
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C768:
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _0238C77C
	bl ov22_0238A22C
	b _0238D510
_0238C77C:
	bl ov22_0238A878
	b _0238D510
_0238C784:
	ldr r0, _0238D198 ; =ov22_0238EA94
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x13
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D19C ; =ov22_0238E8F6
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C7E0:
	ldr r0, _0238D1A0 ; =ov22_0238EAA8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x14
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238D1A4 ; =ov22_0238E8F8
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D134 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238C83C:
	ldr r0, _0238D1A8 ; =ov22_0238EAB8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238C890
	bl ov22_0238A140
	b _0238C894
_0238C890:
	bl ov22_0238A78C
_0238C894:
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	mov r0, #0
	bl sub_0204426C
	mov r0, #0
	bl sub_02044568
	b _0238D510
_0238C8B4:
	ldr r0, _0238D1AC ; =ov22_0238EAC8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238D118 ; =0x0000017F
	ldr r1, [r0]
	str r2, [r1, #0x9c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238C914
	bl ov22_0238A150
	b _0238C918
_0238C914:
	bl ov22_0238A79C
_0238C918:
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	mov r0, #0
	bl sub_0204426C
	mov r0, #0
	bl sub_02044568
	b _0238D510
_0238C938:
	ldr r0, _0238D1B0 ; =ov22_0238EAD8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r3, _0238D1B4 ; =SHOP_MAIN_MENU_ITEMS_2
	ldr r0, [r0]
	mov r4, #3
	ldrb r0, [r0, #8]
	mov r1, #0x13
	mov r2, #0
	cmp r0, #0
	ldrne r0, _0238D1B8 ; =SHOP_WINDOW_PARAMS_7
	str r4, [sp]
	ldreq r0, _0238D1BC ; =SHOP_WINDOW_PARAMS_10
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238C980:
	ldr r0, _0238D1C0 ; =ov22_0238EAE8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238D1C4 ; =OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
	ldr r1, [r0]
	add r0, r1, #0xe0
	add r1, r1, #0x2c
	bl sub_0200D670
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r3, [r1]
	add r2, r3, #0xe0
	str r2, [r3, #0x88]
	ldr r3, [r1]
	ldrsh r2, [r3, #0x30]
	str r2, [r3, #0x64]
	ldr r3, [r1]
	ldrh r2, [r3, #0x2e]
	str r2, [r3, #0x78]
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	str r1, [r2, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D10C ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D1C8 ; =ov22_0238E8FA
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x2f
	ldr r2, [r0]
	mov r1, #0x18
	str r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238D510
_0238CA24:
	ldrsh r1, [r2, #0x30]
	ldrh r2, [r2, #0x2e]
	ldr r0, _0238D1CC ; =ov22_0238EAF8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	add r0, r0, #0x50
	bl InitPreprocessorArgs
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238D1D0 ; =ov22_0238EB14
	ldr r5, [r0]
	ldr r3, _0238D1D4 ; =0x0000C402
	ldrh r4, [r5, #0x2e]
	mov r1, #0x400
	str r4, [r5, #0x50]
	ldr r5, [r0]
	ldrsh r4, [r5, #0x30]
	str r4, [r5, #0x60]
	ldr r5, [r0]
	ldrh r4, [r5, #0x2e]
	str r4, [r5, #0x74]
	ldr r0, [r0]
	add r4, r0, #0x50
	add r0, r0, #0xa0
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0x5c
	bl InitPreprocessorArgs
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	add r1, sp, #0x5c
	ldr r3, [r0]
	ldr r0, _0238D1D8 ; =SHOP_WINDOW_PARAMS_9
	add r2, r3, #0xa0
	str r2, [sp, #0x94]
	str r1, [sp]
	ldrsh r2, [r3, #0x30]
	add r3, r3, #0x50
	ldr r1, _0238D1DC ; =0x00001013
#if defined(EUROPE)
	add r2, r2, #0xd3
	add r2, r2, #0x2900
#elif defined(JAPAN)
	add r2, r2, #0xce
	add r2, r2, #0x4100
#else
	add r2, r2, #0xd1
	add r2, r2, #0x2900
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	stmib sp, {r2, r3}
	ldr r3, _0238D1E0 ; =0x0000033E
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4d]
	b _0238D510
_0238CAEC:
	ldr r0, _0238D1E4 ; =ov22_0238EB20
	bl Debug_Print0
	bl ov22_0238D528
	cmp r0, #0
	bne _0238CB34
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238CB1C
	bl ov22_0238A22C
	b _0238CB20
_0238CB1C:
	bl ov22_0238A878
_0238CB20:
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238CB44
_0238CB34:
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0, #0x14]
_0238CB44:
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238D1E8 ; =ov22_0238E8FE
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D134 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238CB7C:
	ldr r0, _0238D1EC ; =ov22_0238EB30
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x1f
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D1F0 ; =ov22_0238E900
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238CBD8:
	ldr r0, _0238D1F4 ; =ov22_0238EB40
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #0x20
	ldr r1, [r0]
	mov r2, #0x2e
	str r3, [r1, #0x14]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x10]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238D1F8 ; =ov22_0238E902
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D134 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238CC34:
	ldr r0, _0238D1FC ; =ov22_0238EB50
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	bl sub_02042730
	mov r0, #4
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0238D510
_0238CC94:
	ldr r0, _0238D200 ; =ov22_0238EB60
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238D118 ; =0x0000017F
	ldr r1, [r0]
	str r2, [r1, #0x9c]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	mov r0, #4
	mov r1, #0
	mov r2, #8
	mov r3, #1
	bl sub_02042258
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0238D510
_0238CCFC:
	ldr r0, _0238D204 ; =ov22_0238EB70
	bl Debug_Print0
	mov r4, #3
	ldr r0, _0238D1B8 ; =SHOP_WINDOW_PARAMS_7
	ldr r3, _0238D208 ; =SHOP_MAIN_MENU_ITEMS_1
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238CD30:
	ldr r0, _0238D20C ; =ov22_0238EB80
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, _0238D1C4 ; =OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
	ldr r1, [r0]
	add r0, r1, #0xe0
	add r1, r1, #0x2c
	bl sub_0200D670
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r4, #0x2f
	ldr r3, [r1]
	mov r2, #0x24
	add r0, r3, #0xe0
	str r0, [r3, #0x88]
	ldr r5, [r1]
	mov r0, #0
	ldr r3, [r5, #0x1c]
	str r3, [r5, #0x74]
	ldr r3, [r1]
	str r4, [r3, #0x10]
	ldr r1, [r1]
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D10C ; =0x00003008
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D210 ; =ov22_0238E904
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238CDB8:
	ldr r0, _0238D214 ; =ov22_0238EB90
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238D218 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238D128 ; =0x00300013
	ldr r3, _0238D21C ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238CDEC:
	ldr r0, _0238D220 ; =ov22_0238EBA4
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238D218 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238D128 ; =0x00300013
	ldr r3, _0238D21C ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238CE20:
	ldr r0, _0238D224 ; =ov22_0238EBB8
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	add r0, r0, #0x50
	bl InitPreprocessorArgs
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r5, #0
	ldr r6, [r0]
	ldr r2, _0238D1D0 ; =ov22_0238EB14
	ldrh r4, [r6, #0x2e]
	ldr r3, _0238D1D4 ; =0x0000C402
	mov r1, #0x400
	str r4, [r6, #0x50]
	ldr r6, [r0]
	ldrsh r4, [r6, #0x30]
	str r4, [r6, #0x60]
	ldr r6, [r0]
	ldrh r4, [r6, #0x2e]
	str r4, [r6, #0x74]
	ldr r6, [r0]
	ldrh r4, [r6, #0x2e]
	add r4, r4, #0xbc
	str r4, [r6, #0x68]
	ldr r4, [r0]
	str r5, [r4, #0x7c]
	ldr r0, [r0]
	add r4, r0, #0x50
	add r0, r0, #0xa0
	str r4, [sp]
	bl PreprocessString
	add r0, sp, #0xc
	bl InitPreprocessorArgs
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	add r1, sp, #0xc
	ldr r3, [r0]
	ldr r0, _0238D1D8 ; =SHOP_WINDOW_PARAMS_9
	add r2, r3, #0xa0
	str r2, [sp, #0x44]
	str r1, [sp]
	ldrsh r2, [r3, #0x30]
	add r3, r3, #0x50
	ldr r1, _0238D1DC ; =0x00001013
#if defined(EUROPE)
	add r2, r2, #0xd3
	add r2, r2, #0x2900
#elif defined(JAPAN)
	add r2, r2, #0xce
	add r2, r2, #0x4100
#else
	add r2, r2, #0xd1
	add r2, r2, #0x2900
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	stmib sp, {r2, r3}
	ldr r3, _0238D1E0 ; =0x0000033E
	mov r2, r5
	bl CreateScrollBoxSingle
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4d]
	b _0238D510
_0238CEFC:
	ldr r0, _0238D228 ; =ov22_0238EBC8
	bl Debug_Print0
	bl GetNbItemsInBag
	cmp r0, #0
	beq _0238CF20
	bl GetMoneyCarried
	ldr r1, _0238D22C ; =0x0001869F
	cmp r0, r1
	blt _0238CF34
_0238CF20:
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238CF44
_0238CF34:
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x1d
	ldr r0, [r0]
	str r1, [r0, #0x14]
_0238CF44:
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238D230 ; =ov22_0238E908
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D134 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238CF7C:
	ldr r0, _0238D234 ; =ov22_0238EBD8
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x28]
	str r1, [r2, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x2f
	ldr r1, [r0]
	mov r3, #0x29
	str r2, [r1, #0x10]
	ldr r2, [r0]
	ldr r1, _0238D10C ; =0x00003008
	str r3, [r2, #0x14]
	ldr r3, [r0]
	mov r2, #0x30
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D238 ; =ov22_0238E906
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238CFE4:
	ldr r0, _0238D23C ; =ov22_0238EBE4
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238D020
	bl ov22_0238A4CC
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bl ov22_0238A544
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	b _0238D038
_0238D020:
	bl ov22_0238AB18
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x20]
	bl ov22_0238AB90
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238D038:
	ldr r1, [r1]
	str r0, [r1, #0x28]
	bl GetMoneyCarried
	cmp r0, #0
	bne _0238D070
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r3, #6
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x14]
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov22_0238C184
	b _0238D510
_0238D070:
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r5, [r0]
	ldr r4, [r5, #0x28]
	bl GetMoneyCarried
	cmp r4, r0
	ble _0238D0A8
	mov r1, #0xd
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	str r1, [r5, #0x14]
	ldr r0, [r0]
	mov r1, #0x30
	str r1, [r0, #0x10]
	bl ov22_0238C184
	b _0238D510
_0238D0A8:
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r1, [r1]
	str r4, [r1, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x2f
	ldr r1, [r0]
	mov r3, #0x1a
	str r2, [r1, #0x10]
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x14]
	ldr r4, [r0]
	ldr r2, _0238D240 ; =ov22_0238E8FC
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D10C ; =0x00003008
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
	.align 2, 0
_0238D104: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238D108: .word ov22_0238E9D0
_0238D10C: .word 0x00003008
_0238D110: .word OVERLAY22_UNKNOWN_STRING_IDS
_0238D114: .word ov22_0238E9D8
_0238D118: .word 0x0000017F
_0238D11C: .word ov22_0238E8F2
_0238D120: .word ov22_0238E9E4
_0238D124: .word SHOP_WINDOW_PARAMS_6
_0238D128: .word 0x00300013
_0238D12C: .word SHOP_MAIN_MENU_ITEMS_3
_0238D130: .word ov22_0238E9F4
_0238D134: .word 0x00003018
_0238D138: .word ov22_0238E91E
_0238D13C: .word ov22_0238EA04
_0238D140: .word ov22_0238E8F4
_0238D144: .word ov22_0238EA10
_0238D148: .word ov22_0238E90A
_0238D14C: .word ov22_0238EA1C
_0238D150: .word ov22_0238E90C
_0238D154: .word ov22_0238EA28
_0238D158: .word ov22_0238E90E
_0238D15C: .word ov22_0238EA34
_0238D160: .word ov22_0238E91C
_0238D164: .word ov22_0238EA40
_0238D168: .word ov22_0238E910
_0238D16C: .word ov22_0238EA4C
_0238D170: .word ov22_0238E912
_0238D174: .word ov22_0238EA58
_0238D178: .word ov22_0238E914
_0238D17C: .word ov22_0238EA64
_0238D180: .word ov22_0238E916
_0238D184: .word ov22_0238EA70
_0238D188: .word ov22_0238E918
_0238D18C: .word ov22_0238EA7C
_0238D190: .word ov22_0238E91A
_0238D194: .word ov22_0238EA88
_0238D198: .word ov22_0238EA94
_0238D19C: .word ov22_0238E8F6
_0238D1A0: .word ov22_0238EAA8
_0238D1A4: .word ov22_0238E8F8
_0238D1A8: .word ov22_0238EAB8
_0238D1AC: .word ov22_0238EAC8
_0238D1B0: .word ov22_0238EAD8
_0238D1B4: .word SHOP_MAIN_MENU_ITEMS_2
_0238D1B8: .word SHOP_WINDOW_PARAMS_7
_0238D1BC: .word SHOP_WINDOW_PARAMS_10
_0238D1C0: .word ov22_0238EAE8
_0238D1C4: .word OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
_0238D1C8: .word ov22_0238E8FA
_0238D1CC: .word ov22_0238EAF8
_0238D1D0: .word ov22_0238EB14
_0238D1D4: .word 0x0000C402
_0238D1D8: .word SHOP_WINDOW_PARAMS_9
_0238D1DC: .word 0x00001013
#ifdef JAPAN
_0238D1E0: .word 0x00003203
#else
_0238D1E0: .word 0x0000033E
#endif
_0238D1E4: .word ov22_0238EB20
_0238D1E8: .word ov22_0238E8FE
_0238D1EC: .word ov22_0238EB30
_0238D1F0: .word ov22_0238E900
_0238D1F4: .word ov22_0238EB40
_0238D1F8: .word ov22_0238E902
_0238D1FC: .word ov22_0238EB50
_0238D200: .word ov22_0238EB60
_0238D204: .word ov22_0238EB70
_0238D208: .word SHOP_MAIN_MENU_ITEMS_1
_0238D20C: .word ov22_0238EB80
_0238D210: .word ov22_0238E904
_0238D214: .word ov22_0238EB90
_0238D218: .word SHOP_WINDOW_PARAMS_8
_0238D21C: .word SHOP_MENU_ITEMS_CONFIRM
_0238D220: .word ov22_0238EBA4
_0238D224: .word ov22_0238EBB8
_0238D228: .word ov22_0238EBC8
_0238D22C: .word 0x0001869F
_0238D230: .word ov22_0238E908
_0238D234: .word ov22_0238EBD8
_0238D238: .word ov22_0238E906
_0238D23C: .word ov22_0238EBE4
_0238D240: .word ov22_0238E8FC
_0238D244: .word ov22_0238EBF0
_0238D248:
	ldr r0, _0238D244 ; =ov22_0238EBF0
	bl Debug_Print0
	bl ov22_0238E7E4
	ldr r8, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r6, #0
	ldr r0, [r8]
	mov r4, r6
	str r6, [r0, #0x24]
	ldr r0, [r8]
	mov r5, #1
	str r6, [r0, #0x28]
	mov r7, #6
_0238D278:
	ldr r0, [r8]
	mul r1, r6, r7
	ldr r0, [r0, #0x44]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sb, r2, r1
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0238D2EC
	ldrsh r0, [sb, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _0238D2EC
	mov r0, r6
	bl sub_02042B84
	cmp r0, #0
	beq _0238D2EC
	mov r0, sb
	bl GetActualSellPrice
	ldr r2, [r8]
	ldr r1, [r2, #0x28]
	add r0, r1, r0
	str r0, [r2, #0x28]
	ldr r1, [r8]
	ldr r0, [r1, #0x24]
	add r0, r0, #1
	str r0, [r1, #0x24]
_0238D2EC:
	add r6, r6, #1
	cmp r6, #0x32
	blt _0238D278
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x28]
	str r1, [r2, #0x74]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x2f
	ldr r1, [r0]
	mov r3, #0x26
	str r2, [r1, #0x10]
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x14]
	ldr r4, [r0]
	ldr r2, _0238D238 ; =ov22_0238E906
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D10C ; =0x00003008
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238D358:
	ldr r0, _0238D518 ; =ov22_0238EC00
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238D218 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238D128 ; =0x00300013
	ldr r3, _0238D21C ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238D38C:
	ldr r0, _0238D51C ; =ov22_0238EC10
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238D230 ; =ov22_0238E908
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D134 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238D3DC:
	ldr r0, _0238D518 ; =ov22_0238EC00
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238D218 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238D128 ; =0x00300013
	ldr r3, _0238D21C ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238D410:
	ldr r0, _0238D518 ; =ov22_0238EC00
	bl Debug_Print0
	mov r4, #2
	ldr r0, _0238D218 ; =SHOP_WINDOW_PARAMS_8
	ldr r1, _0238D128 ; =0x00300013
	ldr r3, _0238D21C ; =SHOP_MENU_ITEMS_CONFIRM
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	b _0238D510
_0238D444:
	ldr r0, _0238D520 ; =ov22_0238EC24
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	bl ov22_0238D528
	cmp r0, #0
	ldreq r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	moveq r1, #0xc
	ldrne r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	movne r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x14]
	mov r0, #0
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x30
	ldr r4, [r0]
	ldr r2, _0238D1E8 ; =ov22_0238E8FE
	ldr r3, [r4]
	ldrsb r0, [r4, #0x48]
	mul r1, r3, r1
	ldrh r2, [r2, r1]
	ldr r1, _0238D134 ; =0x00003018
	add r3, r4, #0x50
	bl ShowStringIdInDialogueBox
	b _0238D510
_0238D4B4:
	ldr r0, _0238D524 ; =ov22_0238EC38
	bl Debug_Print0
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x14]
	bl ov22_0238D5F4
	ldr r0, _0238D104 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x30
	ldr r3, [r0]
	ldr r1, _0238D134 ; =0x00003018
	ldrsb r0, [r3, #0x48]
	ldr r4, [r3], #0x50
	mul r5, r4, r2
	ldr r2, _0238D230 ; =ov22_0238E908
	ldrh r2, [r2, r5]
	bl ShowStringIdInDialogueBox
	bl sub_02042AF8
_0238D510:
	add sp, sp, #0xac
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238D518: .word ov22_0238EC00
_0238D51C: .word ov22_0238EC10
_0238D520: .word ov22_0238EC24
_0238D524: .word ov22_0238EC38
	arm_func_end ov22_0238C184

	arm_func_start ov22_0238D528
ov22_0238D528: ; 0x0238D528
	stmdb sp!, {r3, lr}
	ldr r0, _0238D550 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238D548
	bl sub_02010830
	ldmia sp!, {r3, pc}
_0238D548:
	bl sub_02010B3C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D550: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	arm_func_end ov22_0238D528

	arm_func_start ov22_0238D554
ov22_0238D554: ; 0x0238D554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r8, _0238D5F0 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r6, #0
	ldr r0, [r8]
	mov r4, r6
	str r6, [r0, #0x24]
	ldr r0, [r8]
	mov r5, #1
	str r6, [r0, #0x28]
	mov r7, #6
_0238D57C:
	ldr r0, [r8]
	mul r1, r6, r7
	ldr r0, [r0, #0x44]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sb, r2, r1
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0238D5E0
	ldrsh r0, [sb, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _0238D5E0
	mov r0, sb
	bl GetActualSellPrice
	ldr r2, [r8]
	ldr r1, [r2, #0x28]
	add r0, r1, r0
	str r0, [r2, #0x28]
	ldr r1, [r8]
	ldr r0, [r1, #0x24]
	add r0, r0, #1
	str r0, [r1, #0x24]
_0238D5E0:
	add r6, r6, #1
	cmp r6, #0x32
	blt _0238D57C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238D5F0: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	arm_func_end ov22_0238D554

	arm_func_start ov22_0238D5F4
ov22_0238D5F4: ; 0x0238D5F4
	stmdb sp!, {r3, lr}
	ldr r2, _0238D63C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r3, [r2]
	ldrb r2, [r3, #8]
	cmp r2, #0
	beq _0238D614
	b _0238D614
_0238D614:
	cmp r0, #1
	moveq r1, #3
	add r0, r3, #0x1e0
	bl SetPortraitEmotion
	ldr r0, _0238D63C ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r0]
	ldrsb r0, [r1, #0x49]
	add r1, r1, #0x1e0
	bl ShowPortraitInPortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D63C: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	arm_func_end ov22_0238D5F4

	arm_func_start ov22_0238D640
ov22_0238D640: ; 0x0238D640
	stmdb sp!, {r4, lr}
	ldr r2, _0238D7A0 ; =ov11_0238A130
	mov r0, #0x1f0
	mov r1, #8
	ldr r4, [r2]
	bl MemAlloc
	ldr r1, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	str r0, [r1]
	add r0, r0, #0x50
	bl InitPreprocessorArgs
	mov r0, #0
	bl CreateDialogueBox
	ldr r2, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #3
	ldr r3, [r2]
	mov r2, #1
	strb r0, [r3, #0x48]
	mov r0, #0
	bl CreatePortraitBox
	ldr r1, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	bl sub_02042B98
	ldr r2, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r0, [r2]
	sub ip, r1, #2
	str r1, [r0, #0x38]
	ldr r3, [r2]
	ldr r0, _0238D7A8 ; =BAG_ITEMS_PTR_MIRROR
	str r1, [r3, #0x3c]
	ldr lr, [r2]
	ldr r3, _0238D7AC ; =0x0000017F
	str r1, [lr, #0x40]
	ldr lr, [r2]
	str r4, [lr]
	ldr r4, [r2]
	str r1, [r4, #4]
	ldr r4, [r2]
	strb ip, [r4, #0x4a]
	ldr r4, [r2]
	strb ip, [r4, #0x4b]
	ldr r4, [r2]
	strb ip, [r4, #0x4c]
	ldr r4, [r0]
	ldr r0, [r2]
	str r4, [r0, #0x44]
	ldr r0, [r2]
	str r3, [r0, #0x9c]
	ldr r2, [r2]
	ldr r0, [r2]
	cmp r0, #0
	beq _0238D720
	cmp r0, #1
	beq _0238D740
	b _0238D758
_0238D720:
	mov r0, #1
	strb r0, [r2, #8]
	bl ov22_0238A2C0
	ldr r0, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, _0238D7AC ; =0x0000017F
	ldr r0, [r0]
	str r1, [r0, #0x50]
	b _0238D758
_0238D740:
	strb r1, [r2, #8]
	bl ov22_0238A90C
	ldr r0, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x180
	ldr r0, [r0]
	str r1, [r0, #0x50]
_0238D758:
	ldr r0, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	add r0, r0, #0x1e0
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1e0
	bl SetPortraitLayout
	ldr r0, _0238D7A4 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1e0
	bl SetPortraitEmotion
	mov r0, #0
	bl ov22_0238ADD8
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D7A0: .word ov11_0238A130
_0238D7A4: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238D7A8: .word BAG_ITEMS_PTR_MIRROR
_0238D7AC: .word 0x0000017F
	arm_func_end ov22_0238D640

	arm_func_start ov22_0238D7B0
ov22_0238D7B0: ; 0x0238D7B0
	stmdb sp!, {r3, lr}
	ldr r0, _0238D7FC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238D7D8
	bl ov22_0238A2F4
	b _0238D7DC
_0238D7D8:
	bl ov22_0238A940
_0238D7DC:
	bl sub_02042BBC
	ldr r0, _0238D7FC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238D7FC ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D7FC: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	arm_func_end ov22_0238D7B0

	arm_func_start ov22_0238D800
ov22_0238D800: ; 0x0238D800
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238E7DC
_0238D81C: ; jump table
	b _0238D82C ; case 0
	b _0238D838 ; case 1
	b _0238E750 ; case 2
	b _0238E7A8 ; case 3
_0238D82C:
	mov r0, #1
	str r0, [r2, #4]
	b _0238E7DC
_0238D838:
	ldr r1, [r2, #0x10]
	cmp r1, #0x30
	addls pc, pc, r1, lsl #2
	b _0238E704
_0238D848: ; jump table
	b _0238D90C ; case 0
	b _0238D90C ; case 1
	b _0238E704 ; case 2
	b _0238E704 ; case 3
	b _0238E5DC ; case 4
	b _0238E704 ; case 5
	b _0238E704 ; case 6
	b _0238E704 ; case 7
	b _0238E704 ; case 8
	b _0238E704 ; case 9
	b _0238E704 ; case 10
	b _0238E704 ; case 11
	b _0238E704 ; case 12
	b _0238E704 ; case 13
	b _0238E704 ; case 14
	b _0238E704 ; case 15
	b _0238E704 ; case 16
	b _0238E704 ; case 17
	b _0238E704 ; case 18
	b _0238DAB8 ; case 19
	b _0238DAB8 ; case 20
	b _0238DFA0 ; case 21
	b _0238E564 ; case 22
	b _0238E164 ; case 23
	b _0238E164 ; case 24
	b _0238E704 ; case 25
	b _0238E39C ; case 26
	b _0238E704 ; case 27
	b _0238E704 ; case 28
	b _0238E704 ; case 29
	b _0238E704 ; case 30
	b _0238DDF8 ; case 31
	b _0238DDF8 ; case 32
	b _0238E07C ; case 33
	b _0238E5A0 ; case 34
	b _0238E1F0 ; case 35
	b _0238E1F0 ; case 36
	b _0238E704 ; case 37
	b _0238E418 ; case 38
	b _0238E704 ; case 39
	b _0238E704 ; case 40
	b _0238E280 ; case 41
	b _0238E704 ; case 42
	b _0238E6F8 ; case 43
	b _0238D938 ; case 44
	b _0238E704 ; case 45
	b _0238E5E8 ; case 46
	b _0238E704 ; case 47
	b _0238E638 ; case 48
_0238D90C:
	ldrsb r0, [r2, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238E734
	mov r0, #0x2c
	bl ov22_0238ADD8
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	b _0238E734
_0238D938:
	ldrsb r0, [r2, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	ldrne r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldrne r1, [r1]
	strne r0, [r1, #0x38]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0238E734
_0238D95C: ; jump table
	b _0238E734 ; case 0
	b _0238DA9C ; case 1
	b _0238D97C ; case 2
	b _0238D9B0 ; case 3
	b _0238DA20 ; case 4
	b _0238E734 ; case 5
	b _0238E734 ; case 6
	b _0238DA90 ; case 7
_0238D97C:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
	bl ov22_0238D528
	cmp r0, #0
	bne _0238D9A4
	mov r0, #5
	bl ov22_0238ADD8
	b _0238E734
_0238D9A4:
	mov r0, #0x10
	bl ov22_0238ADD8
	b _0238E734
_0238D9B0:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
	bl GetNbItemsInBag
	cmp r0, #0
	bne _0238D9D8
	mov r0, #0xa
	bl ov22_0238ADD8
	b _0238E734
_0238D9D8:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _0238D9F8
	mov r0, #9
	bl ov22_0238ADD8
	b _0238E734
_0238D9F8:
	bl GetMoneyCarried
	ldr r1, _0238E798 ; =0x0001869F
	cmp r0, r1
	blt _0238DA14
	mov r0, #7
	bl ov22_0238ADD8
	b _0238E734
_0238DA14:
	mov r0, #0x1c
	bl ov22_0238ADD8
	b _0238E734
_0238DA20:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
	bl GetNbItemsInBag
	cmp r0, #0
	bne _0238DA48
	mov r0, #0xa
	bl ov22_0238ADD8
	b _0238E734
_0238DA48:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _0238DA68
	mov r0, #9
	bl ov22_0238ADD8
	b _0238E734
_0238DA68:
	bl GetMoneyCarried
	ldr r1, _0238E798 ; =0x0001869F
	cmp r0, r1
	ble _0238DA84
	mov r0, #7
	bl ov22_0238ADD8
	b _0238E734
_0238DA84:
	mov r0, #0x28
	bl ov22_0238ADD8
	b _0238E734
_0238DA90:
	mov r0, #2
	bl ov22_0238ADD8
	b _0238E734
_0238DA9C:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4c]
	bl sub_0202836C
	mov r0, #3
	bl ov22_0238ADD8
	b _0238E734
_0238DAB8:
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _0238DACC
	bl ov22_0238A230
	b _0238DAD0
_0238DACC:
	bl ov22_0238A87C
_0238DAD0:
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0238DD34
_0238DADC: ; jump table
	b _0238DD34 ; case 0
	b _0238E734 ; case 1
	b _0238DCF4 ; case 2
	b _0238DAF0 ; case 3
	b _0238DC54 ; case 4
_0238DAF0:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238DBAC
	bl ov22_0238A4CC
	cmp r0, #1
	ble _0238DB2C
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x19
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238DB2C:
	bne _0238DB3C
	bl ov22_0238A508
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	b _0238DB44
_0238DB3C:
	bl ov22_0238A2AC
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238DB44:
	ldr r1, [r1]
	strb r0, [r1, #0x32]
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #0x32]
	bl sub_02010898
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r4, r0
	ldr r0, [r1]
	ldrsh r1, [r4]
	add r0, r0, #0x2c
	mov r2, #0
	bl InitStandardItem
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldrh r2, [r4, #2]
	ldr r1, [r0]
	strh r2, [r1, #0x2e]
	ldr r0, [r0]
	add r0, r0, #0x2c
	bl GetActualBuyPrice
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	mov r0, #0x15
	bl ov22_0238ADD8
	b _0238E734
_0238DBAC:
	bl ov22_0238AB18
	cmp r0, #1
	ble _0238DBD4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x19
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238DBD4:
	bne _0238DBE4
	bl ov22_0238AB54
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	b _0238DBEC
_0238DBE4:
	bl ov22_0238A8F8
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238DBEC:
	ldr r1, [r1]
	strb r0, [r1, #0x33]
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #0x33]
	bl sub_02010BA4
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r4, r0
	ldr r0, [r1]
	ldrsh r1, [r4]
	add r0, r0, #0x2c
	mov r2, #0
	bl InitStandardItem
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldrh r2, [r4, #2]
	ldr r1, [r0]
	strh r2, [r1, #0x2e]
	ldr r0, [r0]
	add r0, r0, #0x2c
	bl GetActualBuyPrice
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	mov r0, #0x15
	bl ov22_0238ADD8
	b _0238E734
_0238DC54:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238DC88
	bl ov22_0238A2AC
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r1]
	strb r0, [r2, #0x32]
	ldr r0, [r1]
	ldrb r0, [r0, #0x32]
	bl sub_02010898
	b _0238DCA4
_0238DC88:
	bl ov22_0238A8F8
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r1]
	strb r0, [r2, #0x33]
	ldr r0, [r1]
	ldrb r0, [r0, #0x33]
	bl sub_02010BA4
_0238DCA4:
	mov r4, r0
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldrsh r1, [r4]
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x2c
	bl InitStandardItem
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldrh r2, [r4, #2]
	ldr r1, [r0]
	strh r2, [r1, #0x2e]
	ldr r0, [r0]
	add r0, r0, #0x2c
	bl GetActualBuyPrice
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	mov r0, #0x16
	bl ov22_0238ADD8
	b _0238E734
_0238DCF4:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238DD10
	bl ov22_0238A22C
	b _0238DD14
_0238DD10:
	bl ov22_0238A878
_0238DD14:
	bl ov22_0238E7E4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238DD34:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	bl IsCollectionMenuState3
	cmp r0, #0
	beq _0238E734
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _0238E734
	ldr r0, _0238E79C ; =0x00003F02
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	ldrsb r0, [r1, #0x4a]
	beq _0238DDA8
	bl sub_0202C748
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r1]
	strb r0, [r2, #0x32]
	ldr r0, [r1]
	ldrb r0, [r0, #0x32]
	bl sub_02010898
	b _0238DDC4
_0238DDA8:
	bl sub_0202C748
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r2, [r1]
	strb r0, [r2, #0x33]
	ldr r0, [r1]
	ldrb r0, [r0, #0x33]
	bl sub_02010BA4
_0238DDC4:
	ldr r2, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldrsh r1, [r0]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x2c
	bl InitStandardItem
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x16
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238DDF8:
	bl sub_020426B4
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238DF04
_0238DE08: ; jump table
	b _0238DF04 ; case 0
	b _0238E734 ; case 1
	b _0238DED0 ; case 2
	b _0238DE18 ; case 3
_0238DE18:
	bl sub_02042B20
	cmp r0, #1
	ble _0238DE58
	bl ov22_0238E7E4
	bl sub_02042664
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x30
	strb r2, [r1, #0x4b]
	bl ov22_0238ADD8
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x25
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238E734
_0238DE58:
	bne _0238DE68
	bl sub_02042B50
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	b _0238DE70
_0238DE68:
	bl sub_02042ADC
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238DE70:
	ldr r1, [r1]
	str r0, [r1, #0x34]
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r0, #6
	ldr r4, [r1]
	ldr r1, [r4, #0x34]
	ldr r3, [r4, #0x44]
	mul r2, r1, r0
	ldr r3, [r3, #0x384]
	add r0, r4, #0x2c
	ldrh r1, [r3, r2]
	add r2, r3, r2
	strh r1, [r4, #0x2c]
	ldrh r1, [r2, #2]
	strh r1, [r4, #0x2e]
	ldrh r1, [r2, #4]
	strh r1, [r4, #0x30]
	bl GetActualSellPrice
	ldr r1, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	mov r0, #0x21
	bl ov22_0238ADD8
	b _0238E734
_0238DED0:
	bl ov22_0238E7E4
	bl sub_02042664
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x30
	strb r2, [r1, #0x4b]
	bl ov22_0238ADD8
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _0238E734
_0238DF04:
	bl sub_02042AAC
	cmp r0, #0
	beq _0238E734
	add r1, sp, #2
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #2]
	tst r0, #8
	beq _0238E734
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_02042ADC
	ldr r2, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #6
	ldr r3, [r2]
	str r0, [r3, #0x34]
	ldr r3, [r2]
	ldr r0, [r3, #0x34]
	ldr r2, [r3, #0x44]
	mul r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	strh r0, [r3, #0x2c]
	ldrh r0, [r1, #2]
	strh r0, [r3, #0x2e]
	ldrh r0, [r1, #4]
	strh r0, [r3, #0x30]
	bl sub_02042664
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0x22
	strb r3, [r1, #0x4b]
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238DFA0:
	ldrsb r0, [r2, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E058
	cmp r0, #2
	beq _0238DFC4
	cmp r0, #7
	beq _0238E038
	b _0238E734
_0238DFC4:
	bl ov22_0238E7E4
	bl GetMoneyCarried
	cmp r0, #0
	ldreq r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	moveq r1, #6
	ldreq r0, [r0]
	streq r1, [r0, #0x14]
	beq _0238E02C
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r4, [r0]
	bl GetMoneyCarried
	ldr r1, [r4, #0x1c]
	cmp r1, r0
	movgt r0, #0xd
	strgt r0, [r4, #0x14]
	bgt _0238E02C
	bl IsBagFull
	cmp r0, #0
	ldrne r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	movne r1, #0xb
	ldrne r0, [r0]
	strne r1, [r0, #0x14]
	ldreq r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	moveq r1, #0x17
	ldreq r0, [r0]
	streq r1, [r0, #0x14]
_0238E02C:
	mov r0, #0x30
	bl ov22_0238ADD8
	b _0238E734
_0238E038:
	bl ov22_0238E7E4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x16
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238E058:
	bl ov22_0238E7E4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x14
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	bl sub_0202C620
	b _0238E734
_0238E07C:
	ldrsb r0, [r2, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E148
	cmp r0, #3
	beq _0238E0A0
	cmp r0, #7
	beq _0238E118
	b _0238E734
_0238E0A0:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsh r0, [r0, #0x30]
	bl IsShoppableItem
	cmp r0, #0
	ldreq r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	moveq r1, #0xe
	ldreq r0, [r0]
	streq r1, [r0, #0x14]
	beq _0238E0F4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r4, [r0]
	bl GetMoneyCarried
	ldr r2, [r4, #0x1c]
	ldr r1, _0238E798 ; =0x0001869F
	add r0, r2, r0
	cmp r0, r1
	movgt r0, #0xf
	strgt r0, [r4, #0x14]
	movle r0, #0x23
	strle r0, [r4, #0x14]
_0238E0F4:
	bl ov22_0238E7E4
	bl sub_02042664
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x30
	strb r2, [r1, #0x4b]
	bl ov22_0238ADD8
	b _0238E734
_0238E118:
	bl ov22_0238E7E4
	bl sub_02042664
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0x22
	strb r3, [r1, #0x4b]
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238E148:
	bl ov22_0238E7E4
	bl sub_02042744
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _0238E734
_0238E164:
	ldrsb r0, [r2, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238E734
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E1E0
	cmp r0, #5
	beq _0238E1A0
	cmp r0, #6
	beq _0238E1E0
	b _0238E734
_0238E1A0:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0238E1C0
	ldrb r0, [r1, #0x32]
	bl ov22_0238A588
	b _0238E1C8
_0238E1C0:
	ldrb r0, [r1, #0x33]
	bl ov22_0238ABD4
_0238E1C8:
	ldr r0, _0238E7A0 ; =0x00001308
	bl sub_02017C80
	bl ov22_0238E7E4
	mov r0, #0x12
	bl ov22_0238ADD8
	b _0238E734
_0238E1E0:
	bl ov22_0238E7E4
	mov r0, #0x11
	bl ov22_0238ADD8
	b _0238E734
_0238E1F0:
	ldrsb r0, [r2, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238E734
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E270
	cmp r0, #5
	beq _0238E22C
	cmp r0, #6
	beq _0238E270
	b _0238E734
_0238E22C:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl AddMoneyCarried
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHoleCheck
	bl sub_02042AF8
	ldr r0, _0238E7A0 ; =0x00001308
	bl sub_02017C80
	bl ov22_0238E7E4
	mov r0, #0x1e
	bl ov22_0238ADD8
	b _0238E734
_0238E270:
	bl ov22_0238E7E4
	mov r0, #0x1d
	bl ov22_0238ADD8
	b _0238E734
_0238E280:
	ldrsb r0, [r2, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E38C
	cmp r0, #5
	beq _0238E2A4
	cmp r0, #6
	beq _0238E38C
	b _0238E734
_0238E2A4:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r4, [r0]
	bl GetMoneyCarried
	ldr r2, [r4, #0x28]
	ldr r1, _0238E798 ; =0x0001869F
	add r0, r2, r0
	cmp r0, r1
	ble _0238E2D8
	mov r1, #8
	mov r0, #0x30
	str r1, [r4, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238E2D8:
	ldr r0, _0238E7A0 ; =0x00001308
	bl sub_02017C80
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl AddMoneyCarried
	mov r4, #0
	mov r5, r4
	mov r6, #1
_0238E2FC:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r7, r0
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0238E368
	ldrsh r0, [r7, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _0238E368
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0238E35C
	bl sub_020582E0
	cmp r0, #0
	beq _0238E368
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
	b _0238E368
_0238E35C:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
_0238E368:
	add r4, r4, #1
	cmp r4, #0x32
	blt _0238E2FC
	bl RemoveEmptyItemsInBag
	bl sub_02042AF8
	bl ov22_0238E7E4
	mov r0, #0x2a
	bl ov22_0238ADD8
	b _0238E734
_0238E38C:
	bl ov22_0238E7E4
	mov r0, #1
	bl ov22_0238ADD8
	b _0238E734
_0238E39C:
	ldrsb r0, [r2, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E3F8
	cmp r0, #5
	beq _0238E3C0
	cmp r0, #6
	beq _0238E3F8
	b _0238E734
_0238E3C0:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0238E3DC
	bl ov22_0238A5CC
	b _0238E3E0
_0238E3DC:
	bl ov22_0238AC18
_0238E3E0:
	ldr r0, _0238E7A0 ; =0x00001308
	bl sub_02017C80
	bl ov22_0238E7E4
	mov r0, #0x1b
	bl ov22_0238ADD8
	b _0238E734
_0238E3F8:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	bl ov22_0238E7E4
	mov r0, #0x11
	bl ov22_0238ADD8
	b _0238E734
_0238E418:
	ldrsb r0, [r2, #0x4c]
	bl GetSimpleMenuResult
	cmp r0, #1
	beq _0238E544
	cmp r0, #5
	beq _0238E43C
	cmp r0, #6
	beq _0238E544
	b _0238E734
_0238E43C:
	bl GetMoneyCarried
	ldr r2, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r1, _0238E798 ; =0x0001869F
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	add r0, r2, r0
	cmp r0, r1
	ble _0238E480
	bl sub_02042AF8
	bl ov22_0238E7E4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #8
	ldr r1, [r0]
	mov r0, #0x30
	str r2, [r1, #0x14]
	bl ov22_0238ADD8
	b _0238E734
_0238E480:
	ldr r0, _0238E7A0 ; =0x00001308
	bl sub_02017C80
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bl AddMoneyCarried
	mov r4, #0
	mov r5, r4
	mov r6, #1
_0238E4A4:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r7, r0
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0238E520
	ldrsh r0, [r7, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _0238E520
	mov r0, r4
	bl sub_02042B84
	cmp r0, #0
	beq _0238E520
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0238E514
	bl sub_020582E0
	cmp r0, #0
	beq _0238E520
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
	b _0238E520
_0238E514:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
_0238E520:
	add r4, r4, #1
	cmp r4, #0x32
	blt _0238E4A4
	bl RemoveEmptyItemsInBag
	bl sub_02042AF8
	bl ov22_0238E7E4
	mov r0, #0x27
	bl ov22_0238ADD8
	b _0238E734
_0238E544:
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	bl ov22_0238E7E4
	mov r0, #0x1d
	bl ov22_0238ADD8
	b _0238E734
_0238E564:
	ldrsb r0, [r2, #0x4d]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238E734
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4d]
	bl CloseScrollBox
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x14
	strb r2, [r1, #0x4d]
	bl ov22_0238ADD8
	b _0238E734
_0238E5A0:
	ldrsb r0, [r2, #0x4d]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0238E734
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4d]
	bl CloseScrollBox
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x20
	strb r2, [r1, #0x4d]
	bl ov22_0238ADD8
	b _0238E734
_0238E5DC:
	bl ov11_022DC504
	mov r0, #3
	b _0238E738
_0238E5E8:
	ldrsb r0, [r2, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238E734
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r2, #0x10
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	b _0238E734
_0238E638:
	ldr r1, [r2, #0xc]
	add r1, r1, #1
	str r1, [r2, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _0238E660
	cmp r0, #3
	beq _0238E6CC
	b _0238E734
_0238E660:
	ldrb r0, [r1, #8]
	cmp r0, #0
	ldrsb r0, [r1, #0x4a]
	mvn r1, #1
	beq _0238E6A0
	cmp r0, r1
	beq _0238E690
	bl CloseCollectionMenu
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4a]
_0238E690:
	bl sub_02044474
	bl sub_020442CC
	bl sub_020445C8
	b _0238E734
_0238E6A0:
	cmp r0, r1
	beq _0238E6BC
	bl CloseCollectionMenu
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4a]
_0238E6BC:
	bl sub_02044474
	bl sub_020442CC
	bl sub_020445C8
	b _0238E734
_0238E6CC:
	ldr r0, _0238E7A4 ; =ov22_0238EC4C
	bl Debug_Print0
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov22_0238ADD8
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0238E734
_0238E6F8:
	mov r0, #0x20
	str r0, [r2, #0x10]
	b _0238E734
_0238E704:
	ldrsb r0, [r2, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238E734
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDialogueBox
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov22_0238ADD8
_0238E734:
	mov r0, #0
_0238E738:
	cmp r0, #3
	ldreq r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _0238E7DC
_0238E750:
	ldrsb r0, [r2, #0x48]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238E7DC
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl HidePortraitBox
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0238E7DC
	.align 2, 0
_0238E794: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
_0238E798: .word 0x0001869F
_0238E79C: .word 0x00003F02
_0238E7A0: .word 0x00001308
_0238E7A4: .word ov22_0238EC4C
_0238E7A8:
	ldrsb r0, [r2, #0x48]
	bl sub_0202836C
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ClosePortraitBox
	ldr r0, _0238E794 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl CloseDialogueBox
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0238E7DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov22_0238D800

	arm_func_start ov22_0238E7E4
ov22_0238E7E4: ; 0x0238E7E4
	stmdb sp!, {r3, lr}
	ldr r0, _0238E818 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4c]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseSimpleMenu
	ldr r0, _0238E818 ; =OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238E818: .word OVERLAY22_UNKNOWN_POINTER__NA_238EC70
	arm_func_end ov22_0238E7E4
	; 0x0238E81C

	.rodata
	.global SHOP_WINDOW_PARAMS_1
SHOP_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238E82C
ov22_0238E82C:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x57, 0x5D, 0x00, 0x00
	.global ov22_0238E834
ov22_0238E834:
	.byte 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00, 0x00, 0x00
	.global SHOP_WINDOW_PARAMS_2
SHOP_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238E84C
ov22_0238E84C:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x57, 0x5D, 0x00, 0x00
	.global ov22_0238E854
ov22_0238E854:
	.byte 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY22_UNKNOWN_STRUCT__NA_238E85C
OVERLAY22_UNKNOWN_STRUCT__NA_238E85C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global SHOP_MENU_ITEMS_CONFIRM
SHOP_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV22_DATA_OFFSET 0x2EC5
#else
#define OV22_DATA_OFFSET 0
#endif
	.word 0x336 + OV22_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x337 + OV22_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global SHOP_MAIN_MENU_ITEMS_1
SHOP_MAIN_MENU_ITEMS_1:
	.word 0x338 + OV22_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x33B + OV22_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x33D + OV22_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global SHOP_MAIN_MENU_ITEMS_2
SHOP_MAIN_MENU_ITEMS_2:
	.word 0x339 + OV22_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x33B + OV22_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x33D + OV22_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global SHOP_MAIN_MENU_ITEMS_3
SHOP_MAIN_MENU_ITEMS_3:
	.word 0x339 + OV22_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x338 + OV22_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x33A + OV22_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x33B + OV22_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x33C + OV22_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global OVERLAY22_UNKNOWN_STRING_IDS
OVERLAY22_UNKNOWN_STRING_IDS:
	.hword 0x33F + OV22_DATA_OFFSET
	.global ov22_0238E8F2
ov22_0238E8F2:
	.hword 0x340 + OV22_DATA_OFFSET
	.global ov22_0238E8F4
ov22_0238E8F4:
	.hword 0x341 + OV22_DATA_OFFSET
	.global ov22_0238E8F6
ov22_0238E8F6:
	.hword 0x342 + OV22_DATA_OFFSET
	.global ov22_0238E8F8
ov22_0238E8F8:
	.hword 0x343 + OV22_DATA_OFFSET
	.global ov22_0238E8FA
ov22_0238E8FA:
	.hword 0x344 + OV22_DATA_OFFSET
	.global ov22_0238E8FC
ov22_0238E8FC:
	.hword 0x345 + OV22_DATA_OFFSET
	.global ov22_0238E8FE
ov22_0238E8FE:
	.hword 0x346 + OV22_DATA_OFFSET
	.global ov22_0238E900
ov22_0238E900:
	.hword 0x347 + OV22_DATA_OFFSET
	.global ov22_0238E902
ov22_0238E902:
	.hword 0x348 + OV22_DATA_OFFSET
	.global ov22_0238E904
ov22_0238E904:
	.hword 0x349 + OV22_DATA_OFFSET
	.global ov22_0238E906
ov22_0238E906:
	.hword 0x34A + OV22_DATA_OFFSET
	.global ov22_0238E908
ov22_0238E908:
	.hword 0x34B + OV22_DATA_OFFSET
	.global ov22_0238E90A
ov22_0238E90A:
	.hword 0x34C + OV22_DATA_OFFSET
	.global ov22_0238E90C
ov22_0238E90C:
	.hword 0x34D + OV22_DATA_OFFSET
	.global ov22_0238E90E
ov22_0238E90E:
	.hword 0x34E + OV22_DATA_OFFSET
	.global ov22_0238E910
ov22_0238E910:
	.hword 0x34F + OV22_DATA_OFFSET
	.global ov22_0238E912
ov22_0238E912:
	.hword 0x350 + OV22_DATA_OFFSET
	.global ov22_0238E914
ov22_0238E914:
	.hword 0x351 + OV22_DATA_OFFSET
	.global ov22_0238E916
ov22_0238E916:
	.hword 0x352 + OV22_DATA_OFFSET
	.global ov22_0238E918
ov22_0238E918:
	.hword 0x353 + OV22_DATA_OFFSET
	.global ov22_0238E91A
ov22_0238E91A:
	.hword 0x354 + OV22_DATA_OFFSET
	.global ov22_0238E91C
ov22_0238E91C:
	.hword 0x355 + OV22_DATA_OFFSET
	.global ov22_0238E91E
ov22_0238E91E:
	.hword 0x356 + OV22_DATA_OFFSET, 0x357 + OV22_DATA_OFFSET, 0x358 + OV22_DATA_OFFSET, 0x359 + OV22_DATA_OFFSET, 0x35A + OV22_DATA_OFFSET, 0x35B + OV22_DATA_OFFSET, 0x35C + OV22_DATA_OFFSET
	.hword 0x35D + OV22_DATA_OFFSET, 0x35E + OV22_DATA_OFFSET, 0x35F + OV22_DATA_OFFSET, 0x360 + OV22_DATA_OFFSET, 0x361 + OV22_DATA_OFFSET, 0x362 + OV22_DATA_OFFSET, 0x363 + OV22_DATA_OFFSET, 0x364 + OV22_DATA_OFFSET
	.hword 0x365 + OV22_DATA_OFFSET, 0x366 + OV22_DATA_OFFSET, 0x367 + OV22_DATA_OFFSET, 0x368 + OV22_DATA_OFFSET, 0x369 + OV22_DATA_OFFSET, 0x36A + OV22_DATA_OFFSET, 0x36B + OV22_DATA_OFFSET, 0x36C + OV22_DATA_OFFSET
	.hword 0x36D + OV22_DATA_OFFSET, 0x36E + OV22_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x10, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x12, 0x02, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x0F, 0x08, 0x03, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global SHOP_WINDOW_PARAMS_6
SHOP_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global SHOP_WINDOW_PARAMS_7
SHOP_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global SHOP_WINDOW_PARAMS_8
SHOP_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global SHOP_WINDOW_PARAMS_9
SHOP_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global SHOP_WINDOW_PARAMS_10
SHOP_WINDOW_PARAMS_10:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov22_0238E9D0
ov22_0238E9D0:
	.byte 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x0A, 0x00
	.global ov22_0238E9D8
ov22_0238E9D8:
	.byte 0x5F, 0x52, 0x45, 0x53
	.byte 0x54, 0x41, 0x52, 0x54, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238E9E4
ov22_0238E9E4:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x4D
	.byte 0x45, 0x4E, 0x55, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238E9F4
ov22_0238E9F4:
	.byte 0x5F, 0x45, 0x58, 0x50, 0x4C, 0x41, 0x4E, 0x41
	.byte 0x54, 0x49, 0x4F, 0x4E, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EA04
ov22_0238EA04:
	.byte 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EA10
ov22_0238EA10:
	.byte 0x5F, 0x53, 0x48, 0x4F, 0x50, 0x5F, 0x4E, 0x4F, 0x4E, 0x0A, 0x00, 0x00
	.global ov22_0238EA1C
ov22_0238EA1C:
	.byte 0x5F, 0x47, 0x4F, 0x4C, 0x44, 0x5F, 0x4E, 0x4F, 0x4E, 0x0A, 0x00, 0x00
	.global ov22_0238EA28
ov22_0238EA28:
	.byte 0x5F, 0x47, 0x4F, 0x4C
	.byte 0x44, 0x5F, 0x4D, 0x41, 0x58, 0x0A, 0x00, 0x00
	.global ov22_0238EA34
ov22_0238EA34:
	.byte 0x5F, 0x47, 0x4F, 0x4C, 0x44, 0x5F, 0x46, 0x55
	.byte 0x4C, 0x4C, 0x0A, 0x00
	.global ov22_0238EA40
ov22_0238EA40:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x4E, 0x4F, 0x4E, 0x0A, 0x00, 0x00
	.global ov22_0238EA4C
ov22_0238EA4C:
	.byte 0x5F, 0x49, 0x54, 0x45, 0x4D, 0x5F, 0x4E, 0x4F, 0x4E, 0x0A, 0x00, 0x00
	.global ov22_0238EA58
ov22_0238EA58:
	.byte 0x5F, 0x49, 0x54, 0x45
	.byte 0x4D, 0x5F, 0x4D, 0x41, 0x58, 0x0A, 0x00, 0x00
	.global ov22_0238EA64
ov22_0238EA64:
	.byte 0x5F, 0x53, 0x4F, 0x4C, 0x44, 0x5F, 0x4F, 0x55
	.byte 0x54, 0x0A, 0x00, 0x00
	.global ov22_0238EA70
ov22_0238EA70:
	.byte 0x5F, 0x42, 0x55, 0x59, 0x5F, 0x50, 0x4F, 0x4F, 0x52, 0x0A, 0x00, 0x00
	.global ov22_0238EA7C
ov22_0238EA7C:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x42, 0x41, 0x44, 0x0A, 0x00, 0x00
	.global ov22_0238EA88
ov22_0238EA88:
	.byte 0x5F, 0x53, 0x45, 0x4C
	.byte 0x4C, 0x5F, 0x46, 0x55, 0x4C, 0x4C, 0x0A, 0x00
	.global ov22_0238EA94
ov22_0238EA94:
	.byte 0x5F, 0x4D, 0x4F, 0x44, 0x45, 0x5F, 0x42, 0x55
	.byte 0x59, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EAA8
ov22_0238EAA8:
	.byte 0x5F, 0x42, 0x55, 0x59
	.byte 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52, 0x54, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EAB8
ov22_0238EAB8:
	.byte 0x5F, 0x42, 0x55, 0x59
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EAC8
ov22_0238EAC8:
	.byte 0x5F, 0x42, 0x55, 0x59
	.byte 0x5F, 0x52, 0x45, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54, 0x0A, 0x00, 0x00
	.global ov22_0238EAD8
ov22_0238EAD8:
	.byte 0x5F, 0x53, 0x55, 0x42
	.byte 0x5F, 0x4D, 0x45, 0x4E, 0x55, 0x5F, 0x42, 0x55, 0x59, 0x0A, 0x00, 0x00
	.global ov22_0238EAE8
ov22_0238EAE8:
	.byte 0x5F, 0x42, 0x55, 0x59
	.byte 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EAF8
ov22_0238EAF8:
	.byte 0x5F, 0x42, 0x55, 0x59
	.byte 0x5F, 0x45, 0x58, 0x50, 0x4C, 0x41, 0x20, 0x49, 0x74, 0x65, 0x6D, 0x25, 0x64, 0x20, 0x43, 0x6F
	.byte 0x75, 0x6E, 0x74, 0x25, 0x64, 0x0A, 0x00, 0x00
	.global ov22_0238EB14
ov22_0238EB14:
	.byte 0x5B, 0x69, 0x74, 0x65, 0x6D, 0x3A, 0x30, 0x5D
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EB20
ov22_0238EB20:
	.byte 0x5F, 0x42, 0x55, 0x59, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EB30
ov22_0238EB30:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x53, 0x54, 0x41, 0x52, 0x54, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EB40
ov22_0238EB40:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x52, 0x45, 0x53, 0x54, 0x41, 0x52
	.byte 0x54, 0x0A, 0x00, 0x00
	.global ov22_0238EB50
ov22_0238EB50:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x53, 0x45, 0x4C, 0x45, 0x43, 0x54
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EB60
ov22_0238EB60:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x52, 0x45, 0x53, 0x45, 0x4C, 0x45
	.byte 0x43, 0x54, 0x0A, 0x00
	.global ov22_0238EB70
ov22_0238EB70:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x53, 0x55, 0x42, 0x5F, 0x4D, 0x45
	.byte 0x4E, 0x55, 0x0A, 0x00
	.global ov22_0238EB80
ov22_0238EB80:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52
	.byte 0x4D, 0x0A, 0x00, 0x00
	.global ov22_0238EB90
ov22_0238EB90:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52
	.byte 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x00
	.global ov22_0238EBA4
ov22_0238EBA4:
	.byte 0x5F, 0x42, 0x55, 0x59, 0x5F, 0x43, 0x4F, 0x4E
	.byte 0x46, 0x49, 0x52, 0x4D, 0x20, 0x4E, 0x45, 0x57, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EBB8
ov22_0238EBB8:
	.byte 0x5F, 0x53, 0x45, 0x4C
	.byte 0x4C, 0x5F, 0x45, 0x58, 0x50, 0x4C, 0x41, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EBC8
ov22_0238EBC8:
	.byte 0x5F, 0x53, 0x45, 0x4C
	.byte 0x4C, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EBD8
ov22_0238EBD8:
	.byte 0x5F, 0x53, 0x45, 0x4C
	.byte 0x4C, 0x5F, 0x41, 0x4C, 0x4C, 0x0A, 0x00, 0x00
	.global ov22_0238EBE4
ov22_0238EBE4:
	.byte 0x5F, 0x42, 0x55, 0x54, 0x5F, 0x4D, 0x55, 0x4C
	.byte 0x54, 0x49, 0x0A, 0x00
	.global ov22_0238EBF0
ov22_0238EBF0:
	.byte 0x5F, 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x4D, 0x55, 0x4C, 0x54, 0x49, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EC00
ov22_0238EC00:
	.byte 0x5F, 0x41, 0x4C, 0x4C, 0x5F, 0x43, 0x4F, 0x4E, 0x46, 0x49, 0x52, 0x4D
	.byte 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EC10
ov22_0238EC10:
	.byte 0x53, 0x45, 0x4C, 0x4C, 0x5F, 0x41, 0x4C, 0x4C, 0x5F, 0x54, 0x48, 0x41
	.byte 0x4E, 0x4B, 0x53, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov22_0238EC24
ov22_0238EC24:
	.byte 0x42, 0x55, 0x59, 0x5F, 0x4D, 0x55, 0x4C, 0x54
	.byte 0x49, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x0A, 0x00, 0x00, 0x00
	.global ov22_0238EC38
ov22_0238EC38:
	.byte 0x53, 0x45, 0x4C, 0x4C
	.byte 0x5F, 0x4D, 0x55, 0x4C, 0x54, 0x49, 0x5F, 0x54, 0x48, 0x41, 0x4E, 0x4B, 0x53, 0x0A, 0x00, 0x00
	.global ov22_0238EC4C
ov22_0238EC4C:
	.byte 0x43, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x4A, 0x6F, 0x62, 0x0A, 0x00, 0x00

	.data
	.global OVERLAY22_UNKNOWN_POINTER__NA_238EC60
OVERLAY22_UNKNOWN_POINTER__NA_238EC60:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY22_UNKNOWN_POINTER__NA_238EC68
OVERLAY22_UNKNOWN_POINTER__NA_238EC68:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY22_UNKNOWN_POINTER__NA_238EC70
OVERLAY22_UNKNOWN_POINTER__NA_238EC70:
	.byte 0x00, 0x00, 0x00, 0x00
