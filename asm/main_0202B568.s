	.include "asm/macros.inc"
	.include "main_0202B568.inc"

	.text

	arm_func_start sub_0202B568
sub_0202B568: ; 0x0202B568
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetMaxItemsOnPage
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B568

	arm_func_start GetSimpleMenuResult__0202B870
GetSimpleMenuResult__0202B870: ; 0x0202B57C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	ldr r4, [r0, #0x198]
	cmp r1, #0
	beq _0202B5C0
	ldrb r1, [r0, #0x1a1]
	add r0, r0, #4
	cmp r1, #0
	beq _0202B5AC
	bl GetTotalNumMenuItems
	b _0202B5B0
_0202B5AC:
	bl GetSelectedMenuItemIdx
_0202B5B0:
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0202B5C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetSimpleMenuResult__0202B870

	arm_func_start UpdateSimpleMenu
UpdateSimpleMenu: ; 0x0202B5C8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0202B928
_0202B5E8: ; jump table
	b _0202B604 ; case 0
	b _0202B624 ; case 1
	b _0202B640 ; case 2
	b _0202B6A4 ; case 3
	b _0202B704 ; case 4
	b _0202B8B8 ; case 5
	b _0202B8FC ; case 6
_0202B604:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202B928
	ldr r1, [r4, #0x1ac]
	mov r0, #2
	str r1, [r4, #0x1b0]
	str r0, [r4, #0x19c]
_0202B624:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	ldreq r1, [r4, #0x1ac]
	moveq r0, #2
	streq r1, [r4, #0x1b0]
	streq r0, [r4, #0x19c]
	beq _0202B928
_0202B640:
	ldr r0, [r4, #0x1ac]
	cmp r0, #0
	ble _0202B69C
	ldr r0, [r4, #0x1b0]
	mov r1, #0x4000000
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r4, #0x1b0]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	add r0, r4, #4
	ble _0202B698
	bl sub_02031C74
	mov r1, #0
	strb r1, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	str r1, [r4, #0x1a8]
	sub r1, r1, #1
	mov r0, r6
	str r1, [r6, #0xb8]
	bl sub_0202B934
	b _0202B928
_0202B698:
	bl sub_02031C84
_0202B69C:
	mov r0, #3
	str r0, [r4, #0x19c]
_0202B6A4:
	mov r0, r6
	bl sub_0202B934
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202B6E0
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a8]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202B928
_0202B6E0:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a8]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202B928
_0202B704:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	str r1, [r4, #0x1a4]
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202B77C
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202B77C
	mov r3, #0
	ldr r2, _0202B930 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202B77C
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202B77C:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202B79C
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202B79C:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202B7C8
	mov r0, r6
	bl sub_0202B934
_0202B7C8:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202B838
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202B828
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202B7FC
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202B7FC:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202B8A8
_0202B828:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202B8A8
_0202B838:
	tst r1, #2
	add r0, r4, #4
	beq _0202B874
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202B8A8
_0202B874:
	bl sub_0203250C
	cmp r0, #0
	beq _0202B8A8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
_0202B8A8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202B928
_0202B8B8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202B928
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202B8F4
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202B8F4
	mov r0, r6
	bl sub_0202B934
	mov r0, #8
	str r0, [r4, #0x19c]
	b _0202B928
_0202B8F4:
	mov r0, #6
	str r0, [r4, #0x19c]
_0202B8FC:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202B928
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_0202B928:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202B930: .word 0x00000408
	arm_func_end UpdateSimpleMenu

	arm_func_start sub_0202B934
sub_0202B934: ; 0x0202B934
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl GetPageStart
	mov r7, r0
	add r0, r4, #4
	bl GetNumItemsOnPage
	ldr r2, [r4, #0xfc]
	mov r5, r0
	tst r2, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne r8, r0, r7
	add r1, r7, r7, lsl #6
	ldrsb r0, [sl, #0x10]
	add r6, r3, r1, lsl #2
	moveq r8, #0
	bl sub_02027B1C
	cmp r5, #0
	mov r7, #0
	ble _0202B9F4
	mov fp, r7
	b _0202B9EC
_0202B994:
	mov r1, fp
	cmp r8, #0
	beq _0202B9B0
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0202B9B0:
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r4, #4
	bl GetPageItemYOffset
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	add r7, r7, #1
	add r6, r6, #0x104
_0202B9EC:
	cmp r7, r5
	blt _0202B994
_0202B9F4:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202B934
