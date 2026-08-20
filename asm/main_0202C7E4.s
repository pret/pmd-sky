	.include "asm/macros.inc"
	.include "main_0202C7E4.inc"

	.text

	arm_func_start sub_0202C7E4
sub_0202C7E4: ; 0x0202C7E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x1ac]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x1ac]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C7E4

	arm_func_start UpdateCollectionMenu
UpdateCollectionMenu: ; 0x0202C808
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r4, r0
	ldrsb r0, [r4, #0x10]
	ldr r5, [r4, #0xc]
	bl sub_02028354
	cmp r0, #3
	moveq r1, #1
	movne r1, #0
	ldr r0, [r5, #0x1ac]
	and fp, r1, #0xff
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0202CE40
_0202C840: ; jump table
	b _0202C86C ; case 0
	b _0202C884 ; case 1
	b _0202C8C0 ; case 2
	b _0202C918 ; case 3
	b _0202CDC8 ; case 4
	b _0202CE0C ; case 5
	b _0202CE40 ; case 6
	b _0202CE40 ; case 7
	b _0202CCA4 ; case 8
	b _0202CD14 ; case 9
	b _0202CD74 ; case 10
_0202C86C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202CE40
	mov r0, #2
	str r0, [r5, #0x1ac]
_0202C884:
	ldr r0, [r5, #0x1ac]
	cmp r0, #1
	bne _0202C8C0
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202C8A4
	mov r0, r4
	bl sub_0202CEA0
_0202C8A4:
	ldrb r0, [r4, #8]
	bl sub_020287C4
	ldrsb r0, [r4, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202C8C0:
	mov r0, r4
	bl sub_0202CEA0
	ldr r0, [r5, #0xfc]
	tst r0, #0x800000
	beq _0202C8F8
	mov r0, #7
	str r0, [r5, #0x1ac]
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	b _0202CE40
_0202C8F8:
	mov r1, #3
	mov r0, #0
	str r1, [r5, #0x1ac]
	strb r0, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #1
	str r0, [r4, #0xb8]
	b _0202CE40
_0202C918:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r5, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r6, #0
	cmp r1, #0
	movne r6, #1
	mov r8, r0
	cmp r1, #0
	bne _0202CA70
	ldr r0, [r5, #0xfc]
	tst r0, #1
	beq _0202CA70
	mov r3, #0
	str r3, [sp]
	ldr r2, _0202CE9C ; =0x00000408
	add r1, sp, #0xc
	add r0, r5, #4
	str r3, [sp, #4]
	bl sub_02032160
	movs r7, r0
	bmi _0202CA70
	ldrb r0, [r5, #0x1b2]
	cmp r0, #0
	beq _0202C994
	add r0, r5, #4
	bl GetSelectedMenuItemIdx
	cmp r7, r0
	bne _0202CA54
_0202C994:
	ldr r0, [r5, #0x19c]
	cmp r0, #0
	ldrne r0, [sp, #8]
	orrne r0, r0, #4
	orrne r0, r0, #0x400
	strne r0, [sp, #8]
	bne _0202CA60
	ldr r1, [sp, #8]
	add r0, r5, #4
	orr r1, r1, #1
	str r1, [sp, #8]
	ldr r8, [r5, #0xc]
	ldr sb, [r5, #0x10]
	bl GetPageStart
	mov r1, r0
	add r0, r5, #4
	sub r1, r7, r1
	bl GetPageItemYOffset
	ldr r1, [r5, #4]
	add sl, r1, r0
	add r0, r5, #4
	bl GetPageStart
	sub r0, r7, r0
	add r1, r0, #1
	add r0, r5, #4
	bl GetPageItemYOffset
	ldr r2, [r5, #4]
	mov r1, #6
	str r1, [r5, #0xdc]
	sub r1, r1, #7
	str r1, [r5, #0xe0]
	mov r1, #0
	str r1, [r5, #0xe4]
	ldr r1, [r5, #0xc]
	add r0, r2, r0
	sub r1, r8, r1
	str r1, [r5, #0xf0]
	ldr r1, [r5, #0xc]
	sub r0, r0, #2
	sub r1, sb, r1
	str r1, [r5, #0xf4]
	ldr r1, [r5, #4]
	sub r1, sl, r1
	str r1, [r5, #0xe8]
	ldr r1, [r5, #4]
	sub r0, r0, r1
	str r0, [r5, #0xec]
	b _0202CA60
_0202CA54:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
_0202CA60:
	mov r1, r7
	add r0, r5, #4
	bl sub_02032684
	mov r8, #1
_0202CA70:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202CA90
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r5, #4
	bl sub_02033758
	orr r8, r8, r0
_0202CA90:
	add r0, r5, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r5, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r8, r0
	ldreqb r0, [r5, #0x1c4]
	cmpeq r0, #0
	beq _0202CACC
	mov r1, #0
	mov r0, r4
	strb r1, [r5, #0x1c4]
	bl sub_0202CEA0
_0202CACC:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202CB44
	cmp r6, #0
	add r0, r5, #4
	beq _0202CAEC
	bl sub_020324C4
	b _0202CAF0
_0202CAEC:
	bl IsMenuOptionActive
_0202CAF0:
	cmp r0, #0
	beq _0202CB34
	ldr r0, [r5, #0xfc]
	tst r0, #0x80000000
	bne _0202CB10
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202CB10:
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #4
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CB34:
	add r0, r5, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202CC94
_0202CB44:
	tst r0, #2
	beq _0202CB94
	add r0, r5, #4
	mov r1, #1
	bl PlayWindowInputSound
	ldr r1, [r5, #0x1a0]
	cmp r1, #0
	beq _0202CB74
	ldrsb r0, [r4, #0x10]
	blx r1
	cmp r0, #0
	bne _0202CE40
_0202CB74:
	mov r0, #1
	strb r0, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #6
	str r0, [r4, #0xb8]
	mov r0, #4
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CB94:
	tst r0, #0x1000
	beq _0202CBE8
	ldr r1, [r5, #0xfc]
	tst r1, #0x2000
	beq _0202CBE8
	ldr r0, [r5, #0x174]
	cmp r0, #0
	beq _0202CBC0
	add r0, r5, #4
	mov r1, #5
	bl PlayWindowInputSound
_0202CBC0:
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #8
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CBE8:
	tst r0, #0x2000
	beq _0202CC30
	ldr r1, [r5, #0xfc]
	tst r1, #0x4000
	beq _0202CC30
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #9
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CC30:
	tst r0, #0x200
	ldrne r1, [r5, #0x18c]
	cmpne r1, #0
	beq _0202CC74
	add r0, r5, #4
	mov r1, #5
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #0xa
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CC74:
	ldr r1, [r5, #0x19c]
	cmp r1, #0
	beq _0202CC94
	blx r1
	cmp r0, #0
	beq _0202CC94
	mov r0, r4
	bl sub_0202CEA0
_0202CC94:
	ldrsb r0, [r4, #0x10]
	add r1, r5, #4
	bl sub_02028948
	b _0202CE40
_0202CCA4:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x174]
	cmp r0, #0
	beq _0202CD04
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CCEC
	mov r0, r4
	bl sub_0202CEA0
_0202CCEC:
	mov r0, #0
	ldr r3, [r5, #0x174]
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202CE40
_0202CD04:
	mov r0, #1
	strb r0, [r5, #0x1c5]
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202CD14:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x17c]
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CD5C
	mov r0, r4
	bl sub_0202CEA0
_0202CD5C:
	mov r0, #0
	ldr r3, [r5, #0x17c]
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202CE40
_0202CD74:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x18c]
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CDBC
	mov r0, r4
	bl sub_0202CEA0
_0202CDBC:
	ldr r0, [r5, #0x18c]
	blx r0
	b _0202CE40
_0202CDC8:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1b1]
	cmp r0, #0
	bne _0202CE04
	ldr r0, [r5, #0xfc]
	tst r0, #0x400000
	beq _0202CE04
	mov r0, r4
	bl sub_0202CEA0
	mov r0, #7
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202CE04:
	mov r0, #5
	str r0, [r5, #0x1ac]
_0202CE0C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1b1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r4, #0xb8]
	mov r0, #6
	str r0, [r5, #0x1ac]
	mov r0, #1
	strb r0, [r5, #0x1c6]
_0202CE40:
	mov r0, #0
	strb r0, [r5, #0x1c6]
	cmp fp, #0
	beq _0202CE6C
	ldr r0, [r5, #0x1ac]
	cmp r0, #1
	bne _0202CE6C
	mov r0, r4
	bl sub_0202CEA0
	mov r0, #1
	strb r0, [r5, #0x1c6]
_0202CE6C:
	ldr r0, [r5, #0x1a8]
	cmp r0, #0
	ldrne r0, [r5, #0x1ac]
	cmpne r0, #8
	cmpne r0, #9
	beq _0202CE94
	add r0, r5, #4
	bl GetSelectedMenuItemIdx
	ldr r1, [r5, #0x1a8]
	blx r1
_0202CE94:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202CE9C: .word 0x00000408
	arm_func_end UpdateCollectionMenu

	arm_func_start sub_0202CEA0
sub_0202CEA0: ; 0x0202CEA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x410
	mov r5, r0
	ldr r6, [r5, #0xc]
	add r0, r6, #4
	bl GetPageStart
	mov r7, r0
	add r0, r6, #4
	bl GetNumItemsOnPage
	ldr r1, [r6, #0xfc]
	mov r8, r0
	tst r1, #0x200
	ldrne r0, [r6, #0x160]
	addne r4, r0, r7
	ldrsb r0, [r5, #0x10]
	moveq r4, #0
	bl sub_02027B1C
	mov sb, #0
	mov fp, #0x42
	b _0202D020
_0202CEF0:
	ldr r3, [r6, #0x198]
	add r0, sp, #0x10
	mov r1, r7
	add r2, sp, #0xc
	blx r3
	mov sl, r0
	cmp r4, #0
	mov r1, #0
	beq _0202CF24
	ldrb r0, [r4]
	add r4, r4, #1
	tst r0, #2
	movne r1, #1
_0202CF24:
	cmp sl, #0
	beq _0202CFF4
	cmp r1, #0
	add r0, r6, #4
	mov r1, sb
	beq _0202CF6C
	bl GetPageItemYOffset
	str fp, [sp]
	mov r2, r0
	ldr r0, [r6, #0x1b4]
	mov r3, sl
	str r0, [sp, #4]
	ldr r0, [r6, #0x1b8]
	str r0, [sp, #8]
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1bc]
	bl sub_02026428
	b _0202CF94
_0202CF6C:
	bl GetPageItemYOffset
	mov r2, r0
	ldr r0, [r6, #0x1b4]
	mov r3, sl
	str r0, [sp]
	ldr r0, [r6, #0x1b8]
	str r0, [sp, #4]
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1bc]
	bl sub_02026358
_0202CF94:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0202D018
	ldr r1, [r6, #0x104]
	mov sl, #0xc
	cmp r1, #0
	ble _0202CFBC
	ldr r0, [r6, #0xfc]
	tst r0, #0x400
	subne sl, r1, #2
_0202CFBC:
	add r0, r6, #4
	mov r1, sb
	bl GetPageItemYOffset
	str sl, [sp]
	mov r1, #0x24
	str r1, [sp, #4]
	mov r2, r0
	ldr sl, [r6, #0x1bc]
	ldr r3, [r6, #0x1c0]
	ldrsb r0, [r5, #0x10]
	sub r1, sl, #4
	sub r3, r3, sl
	bl sub_02025D90
	b _0202D018
_0202CFF4:
	ldrb r0, [r6, #0x1c8]
	cmp r0, #0
	beq _0202D018
	str sb, [r6, #0xc4]
	ldr r0, [r6, #0xc0]
	cmp r0, sb
	subge r0, sb, #1
	strge r0, [r6, #0xc0]
	b _0202D028
_0202D018:
	add sb, sb, #1
	add r7, r7, #1
_0202D020:
	cmp sb, r8
	blt _0202CEF0
_0202D028:
	ldr r4, [r6, #0x1a4]
	cmp r4, #0
	beq _0202D04C
	ldrsb r0, [r5, #0x10]
	mov r3, sb
	add r1, r6, #4
	sub r2, r7, sb
	blx r4
	b _0202D058
_0202D04C:
	ldrsb r1, [r5, #0x10]
	add r0, r6, #4
	bl sub_0202A03C
_0202D058:
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	add sp, sp, #0x410
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202CEA0

	arm_func_start sub_0202D068
sub_0202D068: ; 0x0202D068
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x18c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202D068

	arm_func_start sub_0202D07C
sub_0202D07C: ; 0x0202D07C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	ldr r1, [r0, #0xfc]
	ands r2, r1, #0x10000000
	cmpne r4, #0
	beq _0202D0B0
	eor r1, r1, #0x10000000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	mov r1, #0x10000000
	bl sub_02031C84
	ldmia sp!, {r4, pc}
_0202D0B0:
	cmp r2, #0
	cmpeq r4, #0
	ldmneia sp!, {r4, pc}
	ldr r2, [r0, #0xfc]
	mov r1, #0x10000000
	orr r2, r2, #0x10000000
	str r2, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02031C74
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202D07C
