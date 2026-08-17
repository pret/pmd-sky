	.include "asm/macros.inc"
	.include "main_0202C75C.inc"

	.text

	arm_func_start sub_0202C75C
sub_0202C75C: ; 0x0202C75C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1b0]
	cmp r1, #0
	beq _0202C78C
	ldrb r1, [r0, #0x1b1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
_0202C78C:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C75C

	arm_func_start SetCollectionMenuField0x1C8
SetCollectionMenuField0x1C8: ; 0x0202C794
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c8]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1C8

	arm_func_start SetCollectionMenuField0x1A0
SetCollectionMenuField0x1A0: ; 0x0202C7A8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a0]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1A0

	arm_func_start SetCollectionMenuField0x1A4
SetCollectionMenuField0x1A4: ; 0x0202C7BC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a4]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1A4

	arm_func_start SetCollectionMenuVoidFn
SetCollectionMenuVoidFn: ; 0x0202C7D0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a8]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuVoidFn

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

	arm_func_start SetCollectionMenuField0x1B2
SetCollectionMenuField0x1B2: ; 0x0202D0D8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1b2]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1B2

	arm_func_start sub_0202D0EC
sub_0202D0EC: ; 0x0202D0EC
	stmdb sp!, {r3, r4, r5, lr}
	bl GetWindowContents
	mov r5, r0
	add r0, r5, #4
	bl GetSelectedItemOnPage
	mov r4, r0
	add r0, r5, #4
	bl GetPageStart
	add r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D0EC

	arm_func_start IsCollectionMenuState3
IsCollectionMenuState3: ; 0x0202D114
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1ac]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsCollectionMenuState3

	arm_func_start sub_0202D134
sub_0202D134: ; 0x0202D134
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1b0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1b1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x1ac]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D134

	arm_func_start sub_0202D16C
sub_0202D16C: ; 0x0202D16C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	cmp r5, #0
	ldr r0, [r4, #0xfc]
	beq _0202D1BC
	tst r0, #0x10000000
	ldmeqia sp!, {r3, r4, r5, pc}
	bic r2, r0, #0x10000000
	add r0, r4, #4
	mov r1, #0x8000000
	str r2, [r4, #0xfc]
	bl sub_02031C84
	add r0, r4, #4
	mov r1, #0x10000000
	bl sub_02031C84
	mov r0, #1
	strb r0, [r4, #0x1c4]
	ldmia sp!, {r3, r4, r5, pc}
_0202D1BC:
	tst r0, #0x10000000
	ldmneia sp!, {r3, r4, r5, pc}
	orr r2, r0, #0x10000000
	add r0, r4, #4
	mov r1, #0x8000000
	str r2, [r4, #0xfc]
	bl sub_02031C74
	add r0, r4, #4
	mov r1, #0x10000000
	bl sub_02031C74
	mov r0, #1
	strb r0, [r4, #0x1c4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D16C

	arm_func_start CreateOptionsMenu
CreateOptionsMenu: ; 0x0202D1F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x12c
	mov r5, r1
	orr r5, r5, #4
	mov r1, #0
	str r1, [sp, #8]
	tst r5, #0x8000
	mov sl, r3
	mov r4, r2
	mov r6, r0
	ldr r8, [sp, #0x154]
	orrne r5, r5, #0x20000
	mov r2, sl
	ldr r1, [sp, #8]
	b _0202D238
_0202D22C:
	add r1, r1, #1
	str r1, [sp, #8]
	add r2, r2, #0xc
_0202D238:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0202D22C
	ldr r1, [sp, #8]
	mov r0, #0x10c
	add r1, r1, #1
	mul r0, r1, r0
	mov r1, #8
	bl MemAlloc
	mov fp, r0
	mov r7, fp
	and sb, r5, #0x20
	b _0202D300
_0202D26C:
	mov r0, r7
	bl GetStringFromFileVeneer
	ldr r0, [sl, #8]
	str r0, [r7, #0x100]
	ldr r0, [sl, #8]
	cmp r0, #0
	beq _0202D2C4
	ldr r1, [r7, #0x100]
	mov r2, #0
	b _0202D298
_0202D294:
	add r2, r2, #1
_0202D298:
	ldrh r0, [r1], #2
	cmp r0, #0
	bne _0202D294
	ldr r0, [sl, #4]
	cmp r0, #0
	streq r2, [r7, #0x104]
	beq _0202D2CC
	cmp r0, r2
	movle r2, r0
	str r2, [r7, #0x104]
	b _0202D2CC
_0202D2C4:
	ldr r0, [sl, #4]
	str r0, [r7, #0x104]
_0202D2CC:
	cmp sb, #0
	beq _0202D2EC
	ldr r1, [r8]
	ldr r0, [r7, #0x104]
	cmp r1, r0
	movge r1, #0
	str r1, [r7, #0x108]
	b _0202D2F4
_0202D2EC:
	mov r0, #0
	str r0, [r7, #0x108]
_0202D2F4:
	add sl, sl, #0xc
	add r7, r7, #0x10c
	add r8, r8, #4
_0202D300:
	ldrh r1, [sl]
	cmp r1, #0
	bne _0202D26C
	mov r2, #0
	strb r2, [r7]
	str r2, [r7, #0x100]
	str r2, [r7, #0x104]
	mov r0, #0x1b8
	mov r1, #8
	str r2, [r7, #0x108]
	bl MemAlloc
	cmp r6, #0
	mov r7, r0
	addne sb, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia sb, {r0, r1, r2, r3}
	ldrne r0, _0202D528 ; =UpdateOptionsMenu
	mov r8, fp
	strne r0, [sp, #0x1c]
	bne _0202D364
	ldr r0, _0202D52C ; =OPTIONS_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr r5, r5, #0x300000
_0202D364:
	mov r6, #0
	mov sb, r6
	str r7, [sp, #0x28]
	b _0202D3CC
_0202D374:
	mov r0, r8
	bl sub_020265A8
	cmp r0, r6
	ldr sl, [r8, #0x100]
	movgt r6, r0
	cmp sl, #0
	beq _0202D3C0
	b _0202D3B0
_0202D394:
	ldrh r1, [sl], #2
	add r0, sp, #0x2c
	bl GetStringFromFileVeneer
	add r0, sp, #0x2c
	bl sub_020265A8
	cmp r0, sb
	movgt sb, r0
_0202D3B0:
	ldrh r0, [sl]
	cmp r0, #0
	bne _0202D394
	b _0202D3C8
_0202D3C0:
	cmp sb, #0x30
	movlt sb, #0x30
_0202D3C8:
	add r8, r8, #0x10c
_0202D3CC:
	mov r0, r8
	bl IsEmptyString
	cmp r0, #0
	beq _0202D374
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	bne _0202D400
	add r2, r6, sb
	mov r0, r5
	mov r1, r4
	add r2, r2, #0x34
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202D400:
	str r6, [r7, #0x1a8]
	add r0, sb, #4
	str r0, [r7, #0x1ac]
	ldr r0, [r7, #0x1a8]
	add r2, sp, #8
	add r1, r0, #0x15
	str r1, [r7, #0x1b0]
	ldr r0, [r7, #0x1ac]
	add r3, sp, #0x150
	add r0, r1, r0
	add r0, r0, #0xe
	str r0, [r7, #0x1b4]
	ldr r0, [sp, #0x150]
	cmp r0, #0
	ldreq r0, [sp, #8]
	streq r0, [sp, #0x150]
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	mov r0, r5
	bne _0202D460
	mov r1, r4
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202D468
_0202D460:
	mov r1, r4
	bl CalcMenuHeightDiv8__02031AA4
_0202D468:
	tst r5, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst r5, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202D528 ; =UpdateOptionsMenu
	cmp r4, #0
	str r0, [r7]
	str r5, [r7, #0xfc]
	beq _0202D4C4
	add r8, r7, #0x100
	mov r6, #9
_0202D4AC:
	ldmia r4!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202D4AC
	ldmia r4, {r0, r1}
	stmia r8, {r0, r1}
_0202D4C4:
	ldr r0, [sp, #0x154]
	str fp, [r7, #0x198]
	str r0, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [r7, #0x1a5]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #8]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r4, [sp, #0x150]
	mov r1, r5
	add r0, r7, #4
	add r2, r7, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x12c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202D528: .word UpdateOptionsMenu
_0202D52C: .word OPTIONS_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateOptionsMenu

	arm_func_start CloseOptionsMenu
CloseOptionsMenu: ; 0x0202D530
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseOptionsMenu

	arm_func_start IsOptionsMenuActive
IsOptionsMenuActive: ; 0x0202D55C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsOptionsMenuActive

	arm_func_start CheckOptionsMenuField0x1A4
CheckOptionsMenuField0x1A4: ; 0x0202D57C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckOptionsMenuField0x1A4

	arm_func_start sub_0202D59C
sub_0202D59C: ; 0x0202D59C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedItemOnPage
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202D59C

	arm_func_start GetOptionsMenuStates
GetOptionsMenuStates: ; 0x0202D5B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	ldr r4, [r0, #0x198]
	b _0202D5D0
_0202D5C4:
	ldr r0, [r4, #0x108]
	add r4, r4, #0x10c
	str r0, [r5], #4
_0202D5D0:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0202D5C4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetOptionsMenuStates

	arm_func_start GetOptionsMenuResult
GetOptionsMenuResult: ; 0x0202D5E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0202D610
	ldrb r0, [r0, #0x1a5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0202D610:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetOptionsMenuResult

	arm_func_start UpdateOptionsMenu
UpdateOptionsMenu: ; 0x0202D618
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldr r4, [r7, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0202DA5C
_0202D638: ; jump table
	b _0202D650 ; case 0
	b _0202D668 ; case 1
	b _0202D690 ; case 2
	b _0202D6E8 ; case 3
	b _0202D9EC ; case 4
	b _0202DA30 ; case 5
_0202D650:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202DA5C
	mov r0, #2
	str r0, [r4, #0x1a0]
_0202D668:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	bne _0202D690
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x1a0]
	b _0202DA5C
_0202D690:
	mov r0, r7
	bl sub_0202DA64
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202D6C8
	mov r0, #7
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _0202DA5C
_0202D6C8:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _0202DA5C
_0202D6E8:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202D760
	ldr r3, [r4, #0x1b0]
	add r1, sp, #0xc
	add r0, r3, #0xe
	str r0, [sp]
	mov r6, #0
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r6, r0
	bmi _0202D760
	mov r1, r6
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r1, r6
	orr r2, r0, #0x40
	add r0, r4, #4
	str r2, [sp, #8]
	bl sub_020320A8
	mov r5, #1
_0202D760:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202D7C0
	ldr r3, [r4, #0x1b4]
	add r1, sp, #0xc
	add r0, r3, #0xe
	str r0, [sp]
	mov r6, #0
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r6, r0
	bmi _0202D7C0
	mov r1, r6
	add r0, r4, #4
	bl sub_02032684
	ldr r1, [sp, #8]
	add r0, r4, #4
	orr r2, r1, #0x80
	add r1, r6, #0x3e8
	str r2, [sp, #8]
	bl sub_020320A8
	mov r5, #1
_0202D7C0:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202D7E0
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202D7E0:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	ldr r2, [r4, #0xfc]
	ldr r3, [r4, #0x198]
	mov r1, #0x10c
	mla r6, r0, r1, r3
	tst r2, #0x200
	ldrne r1, [r4, #0x160]
	ldrneb r0, [r1, r0]
	moveq r0, #0
	and r0, r0, #0xff
	tst r0, #1
	bne _0202D8E8
	ldr r0, [sp, #8]
	tst r0, #0x40
	beq _0202D878
	ldr r0, [r6, #0x108]
	cmp r0, #0
	add r0, r4, #4
	ble _0202D86C
	mov r1, #3
	bl PlayWindowInputSound
	ldr r0, [sp, #8]
	tst r0, #8
	ldr r0, [r6, #0x108]
	beq _0202D85C
	subs r0, r0, #0xa
	str r0, [r6, #0x108]
	movmi r0, #0
	strmi r0, [r6, #0x108]
	b _0202D864
_0202D85C:
	sub r0, r0, #1
	str r0, [r6, #0x108]
_0202D864:
	mov r5, #1
	b _0202D900
_0202D86C:
	mov r1, #2
	bl PlayWindowInputSound
	b _0202D900
_0202D878:
	tst r0, #0x80
	beq _0202D900
	ldr r0, [r6, #0x104]
	ldr r1, [r6, #0x108]
	sub r0, r0, #1
	cmp r1, r0
	add r0, r4, #4
	bge _0202D8DC
	mov r1, #3
	bl PlayWindowInputSound
	ldr r0, [sp, #8]
	tst r0, #8
	ldr r0, [r6, #0x108]
	beq _0202D8CC
	add r1, r0, #0xa
	str r1, [r6, #0x108]
	ldr r0, [r6, #0x104]
	sub r0, r0, #1
	cmp r1, r0
	strgt r0, [r6, #0x108]
	b _0202D8D4
_0202D8CC:
	add r0, r0, #1
	str r0, [r6, #0x108]
_0202D8D4:
	mov r5, #1
	b _0202D900
_0202D8DC:
	mov r1, #2
	bl PlayWindowInputSound
	b _0202D900
_0202D8E8:
	ldr r0, [sp, #8]
	tst r0, #0xc0
	beq _0202D900
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
_0202D900:
	cmp r5, #0
	beq _0202D910
	mov r0, r7
	bl sub_0202DA64
_0202D910:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [r4, #0x198]
	mov r0, #0x10c
	mla r0, r2, r0, r1
	ldr r1, [sp, #8]
	ldr r3, [r0, #0x108]
	add r0, r4, #4
	bl sub_020323F8
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202D9AC
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202D9DC
	ldr r5, [r4, #0x198]
	ldr r6, [r4, #0x19c]
	b _0202D96C
_0202D960:
	ldr r0, [r5, #0x108]
	add r5, r5, #0x10c
	str r0, [r6], #4
_0202D96C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202D960
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
	b _0202D9DC
_0202D9AC:
	tst r0, #2
	beq _0202D9DC
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
_0202D9DC:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202DA5C
_0202D9EC:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202DA5C
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0202DA28
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202DA28
	mov r0, r7
	bl sub_0202DA64
	mov r0, #7
	str r0, [r4, #0x1a0]
	b _0202DA5C
_0202DA28:
	mov r0, #5
	str r0, [r4, #0x1a0]
_0202DA30:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202DA5C
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1a0]
_0202DA5C:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end UpdateOptionsMenu

	arm_func_start sub_0202DA64
sub_0202DA64: ; 0x0202DA64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x160
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl GetPageStart
	mov r5, r0
	add r0, r4, #4
	bl GetNumItemsOnPage
	ldr r2, [r4, #0xfc]
	str r0, [sp, #0xc]
	tst r2, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne sb, r0, r5
	mov r1, #0x10c
	add r0, r4, #4
	mla r6, r5, r1, r3
	moveq sb, #0
	bl sub_020320C0
	mov fp, r0
	ldrsb r0, [sl, #0x10]
	bl sub_02027B1C
	ldr r0, [sp, #0xc]
	mov r7, #0
	cmp r0, #0
	ble _0202DC1C
	b _0202DC10
_0202DAD4:
	add r0, r4, #4
	mov r1, r7
	bl GetPageItemYOffset
	mov r8, r0
	mov r0, #1
	cmp sb, #0
	mov r1, #0
	str r0, [sp, #8]
	beq _0202DB14
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
	tst r0, #1
	movne r0, #0
	strne r0, [sp, #8]
_0202DB14:
	cmp r1, #0
	movne r0, #0x42
	moveq r0, #0x44
	and r0, r0, #0xff
	str r0, [sp, #4]
	str r0, [sp]
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r2, r8
	mov r3, r6
	bl sub_020263C8
	ldr r2, [r6, #0x100]
	add r0, sp, #0x60
	cmp r2, #0
	ldr r1, [r6, #0x108]
	beq _0202DB64
	mov r1, r1, lsl #1
	ldrh r1, [r2, r1]
	bl GetStringFromFileVeneer
	b _0202DB80
_0202DB64:
	str r1, [sp, #0x34]
	add r1, sp, #0x10
	str r1, [sp]
	ldr r2, _0202DC38 ; =_0209AEE0
	ldr r3, _0202DC3C ; =0x0000C402
	mov r1, #0x100
	bl PreprocessString
_0202DB80:
	add r0, sp, #0x60
	bl sub_020265A8
	ldr r1, [sp, #4]
	mov ip, r0
	str r1, [sp]
	ldr r3, [r4, #0x1ac]
	ldr r1, [r4, #0x1b0]
	sub r3, r3, ip
	add r3, r3, r3, lsr #31
	add r1, r1, r3, asr #1
	ldrsb r0, [sl, #0x10]
	mov r2, r8
	add r1, r1, #0xe
	add r3, sp, #0x60
	bl sub_020263C8
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0202DC04
	cmp r5, fp
	ldreq r3, _0202DC40 ; =_0209AEEC
	ldrsb r0, [sl, #0x10]
	ldrne r3, _0202DC44 ; =_0209AEF4
	ldr r1, [r4, #0x1b0]
	mov r2, r8
	bl DrawTextInWindow
	add r0, r5, #0x3e8
	cmp r0, fp
	ldreq r3, _0202DC48 ; =_0209AEFC
	ldrsb r0, [sl, #0x10]
	ldrne r3, _0202DC4C ; =_0209AF04
	ldr r1, [r4, #0x1b4]
	mov r2, r8
	bl DrawTextInWindow
_0202DC04:
	add r7, r7, #1
	add r5, r5, #1
	add r6, r6, #0x10c
_0202DC10:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _0202DAD4
_0202DC1C:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0x160
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202DC38: .word _0209AEE0
_0202DC3C: .word 0x0000C402
_0202DC40: .word _0209AEEC
_0202DC44: .word _0209AEF4
_0202DC48: .word _0209AEFC
_0202DC4C: .word _0209AF04
	arm_func_end sub_0202DA64

	arm_func_start CreateDebugMenu
CreateDebugMenu: ; 0x0202DC50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r7, r3
	mov r5, r1
	mov sl, r2
	mov r8, r0
	mov r1, r7
	mov r2, #0
	b _0202DC7C
_0202DC74:
	add r1, r1, #2
	add r2, r2, #1
_0202DC7C:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202DC74
	add r0, r2, #1
	add r0, r0, r0, lsl #8
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r6, r4
	b _0202DCB8
_0202DCA4:
	mov r0, r6
	bl GetStringFromFileVeneer
	add r0, r6, #1
	add r7, r7, #2
	add r6, r0, #0x100
_0202DCB8:
	ldrh r1, [r7]
	cmp r1, #0
	bne _0202DCA4
	mov r0, #0
	strb r0, [r6]
	ldr r2, [sp, #0x58]
	mov r0, #0x3b4
	mov r1, #8
	str r2, [sp, #0xc]
	bl MemAlloc
	mov r1, #0
	cmp r8, #0
	addne fp, sp, #0x10
	mov r7, r0
	str r1, [sp, #8]
	ldmneia r8, {r0, r1, r2, r3}
	stmneia fp, {r0, r1, r2, r3}
	ldrne r0, _0202DEE8 ; =UpdateDebugMenu
	mov sb, r4
	orr r5, r5, #4
	ldr r6, [sp, #0x5c]
	strne r0, [sp, #0x10]
	bne _0202DD28
	ldr r0, _0202DEEC ; =DEBUG_MENU_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x10
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r5, r5, #0x300000
_0202DD28:
	str r7, [sp, #0x1c]
	mov r8, #0
	b _0202DD4C
_0202DD34:
	mov r0, sb
	bl sub_020265A8
	cmp r0, r8
	movgt r8, r0
	add r0, sb, #1
	add sb, r0, #0x100
_0202DD4C:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202DD34
	ldrb r0, [sp, #0x16]
	cmp r0, #0
	bne _0202DD7C
	mov r0, r5
	mov r1, sl
	add r2, r8, #0x40
	bl sub_02031A5C
	strb r0, [sp, #0x16]
_0202DD7C:
	str r8, [r7, #0x1a8]
	mov sb, r4
	and r8, r5, #0x20
	mov fp, #0
	b _0202DDB8
_0202DD90:
	cmp r8, #0
	ldrneb r0, [r6]
	add r6, r6, #1
	strneb r0, [sb, #0x100]
	streqb fp, [sb, #0x100]
	ldr r1, [sp, #8]
	add r0, sb, #1
	add r1, r1, #1
	str r1, [sp, #8]
	add sb, r0, #0x100
_0202DDB8:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202DD90
	ldrb r0, [sp, #0x17]
	add r2, sp, #8
	add r3, sp, #0xc
	cmp r0, #0
	mov r0, r5
	bne _0202DDF0
	mov r1, sl
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x17]
	b _0202DDF8
_0202DDF0:
	mov r1, sl
	bl CalcMenuHeightDiv8__02031AA4
_0202DDF8:
	tst r5, #0x200000
	ldrneb r1, [sp, #0x14]
	ldrneb r0, [sp, #0x16]
	subne r0, r1, r0
	strneb r0, [sp, #0x14]
	tst r5, #0x100000
	ldrneb r1, [sp, #0x15]
	ldrneb r0, [sp, #0x17]
	subne r0, r1, r0
	strneb r0, [sp, #0x15]
	ldr r0, _0202DEE8 ; =UpdateDebugMenu
	cmp sl, #0
	str r0, [r7]
	str r5, [r7, #0xfc]
	beq _0202DE54
	add r8, r7, #0x100
	mov r6, #9
_0202DE3C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202DE3C
	ldmia sl, {r0, r1}
	stmia r8, {r0, r1}
_0202DE54:
	ldr r0, [sp, #0x5c]
	str r4, [r7, #0x198]
	str r0, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
#ifdef JAPAN
	add r0, r7, #0x1ac
	mov r1, #0x3bc
#else
	ldr r1, _0202DEF0 ; =0x00003C65
	add r0, r7, #0x1ac
#endif
	strb r2, [r7, #0x1a5]
	bl GetStringFromFileVeneer
	ldr r1, _0202DEF4 ; =0x00003C66
	add r0, r7, #0x2ac
	bl GetStringFromFileVeneer
	add r0, r7, #0x1ac
	bl sub_020265A8
	str r0, [r7, #0x3ac]
	add r0, r7, #0x2ac
	bl sub_020265A8
	str r0, [r7, #0x3b0]
	add r0, sp, #0x10
	mov r1, #3
	bl NewWindowScreenCheck
	add r1, sp, #0x20
	mov r6, r0
	bl GetWindowRectangle
	ldr r2, [sp, #8]
	mov r1, r5
	str r2, [sp]
	ldr r4, [sp, #0xc]
	add r0, r7, #4
	add r2, r7, #0x100
	add r3, sp, #0x20
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202DEE8: .word UpdateDebugMenu
_0202DEEC: .word DEBUG_MENU_DEFAULT_WINDOW_PARAMS
#if defined(EUROPE)
_0202DEF0: .word 0x00003C67
_0202DEF4: .word 0x00003C68
#elif defined(JAPAN)
_0202DEF4: .word 0x000003BD
#else
_0202DEF0: .word 0x00003C65
_0202DEF4: .word 0x00003C66
#endif
	arm_func_end CreateDebugMenu

	arm_func_start CloseDebugMenu
CloseDebugMenu: ; 0x0202DEF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseDebugMenu

	arm_func_start IsDebugMenuActive
IsDebugMenuActive: ; 0x0202DF24
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsDebugMenuActive

	arm_func_start CheckDebugMenuField0x1A4
CheckDebugMenuField0x1A4: ; 0x0202DF44
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckDebugMenuField0x1A4

	arm_func_start sub_0202DF64
sub_0202DF64: ; 0x0202DF64
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0202DF90
	ldrb r0, [r0, #0x1a5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0202DF90:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202DF64

	arm_func_start UpdateDebugMenu
UpdateDebugMenu: ; 0x0202DF98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldr r4, [r7, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0202E294
_0202DFB8: ; jump table
	b _0202DFD0 ; case 0
	b _0202DFE8 ; case 1
	b _0202E010 ; case 2
	b _0202E068 ; case 3
	b _0202E224 ; case 4
	b _0202E268 ; case 5
_0202DFD0:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202E294
	mov r0, #2
	str r0, [r4, #0x1a0]
_0202DFE8:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	bne _0202E010
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x1a0]
	b _0202E294
_0202E010:
	mov r0, r7
	bl sub_0202E29C
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202E048
	mov r0, #7
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _0202E294
_0202E048:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _0202E294
_0202E068:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202E0CC
	mov r3, #0
	add r1, sp, #0xc
	str r3, [sp]
	mov r6, #1
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202E0CC
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, r6
	orr r0, r0, #0x2000
	str r0, [sp, #8]
_0202E0CC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202E0EC
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202E0EC:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	ldr r1, [r4, #0xfc]
	ldr r3, [r4, #0x198]
	tst r1, #0x200
	ldrne r1, [r4, #0x160]
	add r2, r0, r0, lsl #8
	ldrneb r1, [r1, r0]
	ldr r0, [sp, #8]
	add r6, r3, r2
	moveq r1, #0
	and r1, r1, #0xff
	tst r0, #0x2200
	beq _0202E15C
	tst r1, #1
	add r0, r4, #4
	bne _0202E154
	mov r1, #3
	bl PlayWindowInputSound
	ldrb r0, [r6, #0x100]
	mov r5, #1
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r6, #0x100]
	b _0202E15C
_0202E154:
	mov r1, #2
	bl PlayWindowInputSound
_0202E15C:
	cmp r5, #0
	beq _0202E16C
	mov r0, r7
	bl sub_0202E29C
_0202E16C:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202E1E4
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202E214
	ldr r5, [r4, #0x198]
	ldr r6, [r4, #0x19c]
	b _0202E1A4
_0202E194:
	ldrb r1, [r5, #0x100]
	add r0, r5, #1
	add r5, r0, #0x100
	strb r1, [r6], #1
_0202E1A4:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202E194
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
	b _0202E214
_0202E1E4:
	tst r0, #2
	beq _0202E214
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
_0202E214:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202E294
_0202E224:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202E294
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0202E260
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202E260
	mov r0, r7
	bl sub_0202E29C
	mov r0, #7
	str r0, [r4, #0x1a0]
	b _0202E294
_0202E260:
	mov r0, #5
	str r0, [r4, #0x1a0]
_0202E268:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202E294
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1a0]
_0202E294:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end UpdateDebugMenu

	arm_func_start sub_0202E29C
sub_0202E29C: ; 0x0202E29C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl GetPageStart
	mov r7, r0
	add r0, r4, #4
	bl GetNumItemsOnPage
	ldr r1, [r4, #0xfc]
	mov r5, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne r8, r0, r7
	add r2, r7, r7, lsl #8
	ldrsb r0, [sl, #0x10]
	add r6, r3, r2
	moveq r8, #0
	bl sub_02027B1C
	cmp r5, #0
	mov r7, #0
	ble _0202E3B0
	add r0, r4, #0x1ac
	str r0, [sp, #8]
	b _0202E3A8
_0202E304:
	add r0, r4, #4
	mov r1, r7
	bl GetPageItemYOffset
	str r0, [sp, #4]
	ldrb r0, [r6, #0x100]
	mov r1, #0
	cmp r0, #0
	movne sb, #1
	moveq sb, #0
	cmp r8, #0
	beq _0202E340
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0202E340:
	cmp r1, #0
	movne r0, #0x42
	moveq r0, #0x44
	and fp, r0, #0xff
	str fp, [sp]
	ldrsb r0, [sl, #0x10]
	ldr r2, [sp, #4]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	str fp, [sp]
	add r3, r4, sb, lsl #2
	ldr fp, [r3, #0x3ac]
	ldr r3, [sp, #8]
	ldr r1, [r4, #0x1a8]
	add r3, r3, sb, lsl #8
	rsb sb, fp, #0x30
	ldrsb r0, [sl, #0x10]
	ldr r2, [sp, #4]
	add r1, r1, #0xd
	add sb, sb, sb, lsr #31
	add r1, r1, sb, asr #1
	bl sub_020263C8
	add r0, r6, #1
	add r7, r7, #1
	add r6, r0, #0x100
_0202E3A8:
	cmp r7, r5
	blt _0202E304
_0202E3B0:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202E29C

	arm_func_start CreateScrollBoxSingle
CreateScrollBoxSingle: ; 0x0202E3CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r7, r1
	ldr r0, _0202E508 ; =0x00001D6C
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	cmp r8, #0
	ldreq r0, _0202E50C ; =SCROLL_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202E510 ; =UpdateScrollBox
	ldr r1, _0202E510 ; =UpdateScrollBox
	strne r0, [sp]
	ldr r0, _0202E514 ; =0x0D0C8012
	str r4, [sp, #0xc]
	orr r0, r7, r0
	str r1, [r4]
	bic r0, r0, #1
	str r0, [r4, #0xfc]
	cmp r6, #0
	beq _0202E45C
	add ip, r4, #0x100
	mov r7, #9
_0202E444:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _0202E444
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_0202E45C:
	ldr r7, [sp, #0x28]
	add r0, r4, #0x100
	strh r5, [r0, #0xa0]
	cmp r7, #0
	beq _0202E48C
	add r6, r4, #0x1a8
	mov r5, #5
_0202E478:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E478
	b _0202E494
_0202E48C:
	add r0, r4, #0x1a8
	bl InitPreprocessorArgs
_0202E494:
	mov r0, #1
	ldr r7, [sp, #0x30]
	ldrh r1, [sp, #0x2c]
	str r0, [r4, #0x198]
	mov r0, #0
	str r0, [r4, #0x19c]
	add r0, r4, #0x200
	strh r1, [r0, #0xe8]
	cmp r7, #0
	beq _0202E4D8
	add r6, r4, #0x2f0
	mov r5, #5
_0202E4C4:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E4C4
	b _0202E4E0
_0202E4D8:
	add r0, r4, #0x2f0
	bl InitPreprocessorArgs
_0202E4E0:
	mov r3, #0
	str r3, [r4, #0x430]
	add r2, r4, #0x1000
	str r3, [r2, #0x464]
	add r0, sp, #0
	mov r1, #3
	strb r3, [r2, #0x468]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202E508: .word 0x00001D6C
_0202E50C: .word SCROLL_BOX_DEFAULT_WINDOW_PARAMS
_0202E510: .word UpdateScrollBox
_0202E514: .word 0x0D0C8012
	arm_func_end CreateScrollBoxSingle

	arm_func_start CreateScrollBoxMulti
CreateScrollBoxMulti: ; 0x0202E518
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r5, r2
	ldr r2, [sp, #0x44]
	mov sl, r1
	ldr r0, _0202E6A0 ; =0x00001D6C
	mov r1, #8
	mov sb, r3
	ldr r8, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	ldr fp, [sp, #0x40]
	str r2, [sp, #0x44]
	bl MemAlloc
	cmp r6, #0
	mov r4, r0
	ldreq r0, _0202E6A4 ; =SCROLL_BOX_DEFAULT_WINDOW_PARAMS
	addeq r6, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r6, {r0, r1, r2, r3}
	addne ip, sp, #0
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202E6A8 ; =UpdateScrollBox
	ldr r1, _0202E6A8 ; =UpdateScrollBox
	strne r0, [sp]
	ldr r0, _0202E6AC ; =0x0D0C8012
	str r4, [sp, #0xc]
	orr r0, sl, r0
	str r1, [r4]
	bic r0, r0, #1
	str r0, [r4, #0xfc]
	cmp r5, #0
	beq _0202E5C0
	add sl, r4, #0x100
	mov r6, #9
_0202E5A8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202E5A8
	ldmia r5, {r0, r1}
	stmia sl, {r0, r1}
_0202E5C0:
	str sb, [r4, #0x198]
	mov r6, #0
	str r6, [r4, #0x19c]
	b _0202E670
_0202E5D0:
	mov r0, #0x50
	mul r5, r6, r0
	mov r1, r6, lsl #1
	add r0, r4, r6, lsl #1
	ldrh r1, [r8, r1]
	add r0, r0, #0x100
	adds sl, r7, r5
	strh r1, [r0, #0xa0]
	beq _0202E614
	add r0, r4, r5
	add lr, r0, #0x1a8
	mov ip, #5
_0202E600:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202E600
	b _0202E620
_0202E614:
	add r0, r4, #0x1a8
	add r0, r0, r5
	bl InitPreprocessorArgs
_0202E620:
	mov r0, r6, lsl #1
	ldrh r1, [fp, r0]
	add r0, r4, r6, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0xe8]
	ldr r0, [sp, #0x44]
	adds sl, r0, r5
	beq _0202E660
	add r0, r4, r5
	add ip, r0, #0x2f0
	mov r5, #5
_0202E64C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E64C
	b _0202E66C
_0202E660:
	add r0, r4, #0x2f0
	add r0, r0, r5
	bl InitPreprocessorArgs
_0202E66C:
	add r6, r6, #1
_0202E670:
	cmp r6, sb
	blt _0202E5D0
	mov r3, #0
	str r3, [r4, #0x430]
	add r2, r4, #0x1000
	str r3, [r2, #0x464]
	add r0, sp, #0
	mov r1, #3
	strb r3, [r2, #0x468]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202E6A0: .word 0x00001D6C
_0202E6A4: .word SCROLL_BOX_DEFAULT_WINDOW_PARAMS
_0202E6A8: .word UpdateScrollBox
_0202E6AC: .word 0x0D0C8012
	arm_func_end CreateScrollBoxMulti

	arm_func_start SetScrollBoxState7
SetScrollBoxState7: ; 0x0202E6B0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0x1000
	mov r1, #7
	str r1, [r0, #0x464]
	ldmia sp!, {r3, pc}
	arm_func_end SetScrollBoxState7

	arm_func_start CloseScrollBox
CloseScrollBox: ; 0x0202E6C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseScrollBox

	arm_func_start IsScrollBoxActive
IsScrollBoxActive: ; 0x0202E6E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #8
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsScrollBoxActive

	arm_func_start UpdateScrollBox
UpdateScrollBox: ; 0x0202E708
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	mov r4, r0
	ldr r5, [r4, #0xc]
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0202EE74
_0202E72C: ; jump table
	b _0202E74C ; case 0
	b _0202E768 ; case 1
	b _0202E768 ; case 2
	b _0202E768 ; case 3
	b _0202E998 ; case 4
	b _0202E9C0 ; case 5
	b _0202EE38 ; case 6
	b _0202EE54 ; case 7
_0202E74C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202EE74
	add r0, r5, #0x1000
	mov r1, #1
	str r1, [r0, #0x464]
_0202E768:
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #1
	beq _0202E788
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202EE74
_0202E788:
	add r0, r5, #0x34
	ldr r2, [r5, #0x430]
	ldr r1, _0202EE7C ; =0x0000040C
	add r0, r0, #0x400
	add r3, r5, #0x16c
	mla r6, r2, r1, r0
	cmp r2, #0
	add r7, r3, #0x1800
	mov r8, #0
	bne _0202E850
	ldr sl, [r5, #0x19c]
	add r0, r5, sl, lsl #1
	add r0, r0, #0x100
	ldrh r2, [r0, #0xa0]
	cmp r2, #0
	addeq r0, r5, #0x1000
	streqb r8, [r0, #0x56c]
	beq _0202E7F0
	add r1, r5, #0x1a8
	mov r0, #0x50
	mla sb, sl, r0, r1
	mov r1, #0x400
	add r0, r3, #0x1400
	add r3, r1, #4
	str sb, [sp]
	bl PreprocessStringFromId
_0202E7F0:
	ldr r2, [r5, #0x19c]
	mov r0, #0x50
	mla r1, r2, r0, r5
	add r0, r5, #0x6c
	add fp, r1, #0x2f0
	add sl, r0, #0x1400
	mov sb, #5
_0202E80C:
	ldmia fp!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs sb, sb, #1
	bne _0202E80C
	ldr r0, [r5, #0x19c]
	add r1, r5, #0x1000
	add r0, r5, r0, lsl #1
	add r0, r0, #0x200
	ldrh r0, [r0, #0xe8]
	strh r0, [r6]
	ldr r0, [r1, #0x464]
	cmp r0, #1
	moveq r0, #0
	streq r0, [r6, #4]
	subeq r0, r0, #1
	streq r0, [r6, #8]
	b _0202E85C
_0202E850:
	add r0, r3, #0x1400
	add r1, r6, #0xc
	bl strcpy
_0202E85C:
	ldr r0, [r5, #0xfc]
	ldr r1, _0202EE80 ; =0x000001AF
	orr r0, r0, #0x800
	str r0, [r5, #0xfc]
	add r0, r5, #0x100
	strh r1, [r0, #8]
	mov r0, #0x10
	add r3, r5, #0x16c
	str r0, [r5, #0x10c]
	add r0, r3, #0x1400
	str r0, [r5, #0x148]
	ldrh sb, [r6]
	add r0, r5, #0x1000
	add r2, r5, #0x6c
	str sb, [r0, #0x4a0]
	add r0, r2, #0x1400
	str r0, [sp]
	ldrh r2, [r6]
	mov r1, #0x400
	add r0, r3, #0x1800
	add r3, r1, #4
	bl PreprocessStringFromId
	add r0, r5, #0xc4
	add sb, r0, #0x1400
	b _0202E8E0
_0202E8C0:
	add r0, r5, r8, lsl #2
	add r2, r0, #0x1000
	add r1, sb, r8, lsl #2
	mov r0, r7
	str r7, [r2, #0x4e4]
	add r8, r8, #1
	bl sub_02021F44
	mov r7, r0
_0202E8E0:
	cmp r7, #0
	bne _0202E8C0
	add r0, r5, #0x1000
	str r8, [r0, #0x4bc]
	ldr r1, [r0, #0x464]
	cmp r1, #3
	ldreq r1, [r6, #4]
	movne r1, #0
	str r1, [r0, #0x4c0]
	ldr r1, [r5, #0xfc]
	add r0, r5, #0x1000
	orr r1, r1, #8
	str r1, [r5, #0xfc]
	ldr r0, [r0, #0x4bc]
	add r1, sp, #0x38
	cmp r0, #1
	ldrle r0, [r5, #0xfc]
	eorle r0, r0, #8
	strle r0, [r5, #0xfc]
	ldrsb r0, [r4, #0x10]
	bl GetWindowRectangle
	ldr r0, [r5, #0x430]
	add r3, sp, #0x38
	cmp r0, #0
	mov r0, #1
	bne _0202E974
	ldr r1, [r5, #0x198]
	add r2, r5, #0x100
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [r5, #0xfc]
	add r0, r5, #4
	bl InitWindowInput
	ldr r1, [r5, #0x19c]
	add r0, r5, #4
	bl sub_02032684
	b _0202E98C
_0202E974:
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [r5, #0xfc]
	add r0, r5, #4
	add r2, r5, #0x100
	bl InitWindowInput
_0202E98C:
	add r0, r5, #0x1000
	mov r1, #4
	str r1, [r0, #0x464]
_0202E998:
	mov r0, r4
	bl sub_0202EE88
	mov r1, #0
	add r0, r5, #0x1000
	mov r2, #5
	str r2, [r0, #0x464]
	strb r1, [r0, #0x468]
	sub r0, r1, #1
	str r0, [r4, #0xb8]
	b _0202EE74
_0202E9C0:
	add r0, r5, #0x34
	add r8, r0, #0x400
	ldr r7, [r5, #0x430]
	ldr r6, _0202EE7C ; =0x0000040C
	add r1, sp, #0x14
	add r2, sp, #0x48
	add r0, r5, #4
	mov r3, #1
	mla r6, r7, r6, r8
	bl sub_02031C98
	mov r7, r0
	add r0, r5, #4
	bl GetCurrentPage
	mov fp, r0
	add r2, r5, #0x1000
	mov r0, #0
	mov r1, #0x13
	ldr r8, [r2, #0x4c0]
	bl sub_02031914
	add r1, r5, #0x1000
	ldr r1, [r1, #0x4bc]
	mov sb, r0
	cmp r1, #1
	ble _0202EA70
	tst sb, #0x10
	beq _0202EA48
	add r0, r5, #4
	mov r1, #4
	bl PlayWindowInputSound
	subs r8, r8, #1
	addmi r0, r5, #0x1000
	ldrmi r0, [r0, #0x4bc]
	submi r8, r0, #1
	b _0202EA70
_0202EA48:
	tst sb, #0x20
	beq _0202EA70
	add r0, r5, #4
	mov r1, #4
	bl PlayWindowInputSound
	add r0, r5, #0x1000
	ldr r0, [r0, #0x4bc]
	add r8, r8, #1
	cmp r8, r0
	movge r8, #0
_0202EA70:
	ldr r0, [r5, #0x430]
	cmp r0, #0
	bne _0202EA98
	ldr r0, [r5, #0x19c]
	cmp r0, fp
	strne fp, [r5, #0x19c]
	addne r0, r5, #0x1000
	movne r1, #1
	strne r1, [r0, #0x464]
	bne _0202EB54
_0202EA98:
	add r0, r5, #0x1000
	ldr r1, [r0, #0x4c0]
	cmp r1, r8
	beq _0202EAC0
	str r8, [r0, #0x4c0]
	str r8, [r6, #4]
	mvn r0, #0
	str r0, [r6, #8]
	mov r7, #1
	b _0202EB54
_0202EAC0:
	ldr r2, [r0, #0x504]
	cmp r2, #0
	ble _0202EB54
	ldr r0, [sp, #0x14]
	tst r0, #0x2000
	beq _0202EB10
	ldr r0, [r6, #8]
	cmp r0, #0
	sublt r0, r2, #1
	strlt r0, [r6, #8]
	blt _0202EAFC
	mvneq r0, #0
	streq r0, [r6, #8]
	subne r0, r0, #1
	strne r0, [r6, #8]
_0202EAFC:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
	mov r7, #1
	b _0202EB54
_0202EB10:
	tst r0, #0x1000
	beq _0202EB54
	ldr r1, [r6, #8]
	cmp r1, #0
	movlt r0, #0
	strlt r0, [r6, #8]
	blt _0202EB44
	sub r0, r2, #1
	cmp r1, r0
	mvnge r0, #0
	strge r0, [r6, #8]
	addlt r0, r1, #1
	strlt r0, [r6, #8]
_0202EB44:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
	mov r7, #1
_0202EB54:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0202ECC4
	ldrsb r0, [r4, #0x10]
	mvn r2, #0
	add r1, sp, #0x28
	str r2, [sp, #8]
	bl GetWindowRectangle
	add r0, r5, #0x108
	add r0, r0, #0x1400
	str r0, [sp, #0xc]
	add r0, r5, #0x1000
	mov sl, #0
	str r0, [sp, #0x10]
	b _0202EC08
_0202EB90:
	ldr r0, [sp, #0xc]
	mov r1, #0x18
	mla r2, sl, r1, r0
	ldr r1, [sp, #0x28]
	ldr r0, [r2, #8]
	ldr r3, [sp, #0x30]
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr ip, [r2, #0x10]
	add r0, sp, #0x48
	add r1, ip, r1
	str r1, [sp, #0x1c]
	ldr ip, [r2, #4]
	ldr r1, _0202EE84 ; =0x00000408
	add ip, ip, r3
	str ip, [sp, #0x20]
	ldr ip, [r2, #0xc]
	add r2, sp, #0x18
	add r3, ip, r3
	str r3, [sp, #0x24]
	bl sub_02006C8C
	cmp r0, #0
	beq _0202EC04
	add r0, r5, #4
	mov r1, #0
	str sl, [sp, #8]
	bl sub_020320EC
	mov r7, #1
	b _0202EC18
_0202EC04:
	add sl, sl, #1
_0202EC08:
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x504]
	cmp sl, r0
	blt _0202EB90
_0202EC18:
	ldr r0, [sp, #8]
	cmp r0, #0
	strge sl, [r6, #8]
	orrge sb, sb, #1
	bge _0202EC7C
	add r1, sp, #0x14
	add r2, sp, #0x48
	add r0, r5, #4
	bl sub_02033758
	add r1, r5, #0x1000
	ldr r1, [r1, #0x4bc]
	orr r7, r7, r0
	cmp r1, #1
	ble _0202EC7C
	ldr r0, [sp, #0x14]
	tst r0, #0x40000
	beq _0202EC68
	subs r8, r8, #1
	submi r8, r1, #1
	b _0202EC7C
_0202EC68:
	tst r0, #0x80000
	beq _0202EC7C
	add r8, r8, #1
	cmp r8, r1
	movge r8, #0
_0202EC7C:
	ldr r0, [r5, #0x430]
	cmp r0, #0
	bne _0202ECA4
	ldr r0, [r5, #0x19c]
	cmp r0, fp
	strne fp, [r5, #0x19c]
	addne r0, r5, #0x1000
	movne r1, #1
	strne r1, [r0, #0x464]
	bne _0202ECC4
_0202ECA4:
	add r0, r5, #0x1000
	ldr r1, [r0, #0x4c0]
	cmp r1, r8
	strne r8, [r0, #0x4c0]
	strne r8, [r6, #4]
	mvnne r0, #0
	strne r0, [r6, #8]
	movne r7, #1
_0202ECC4:
	cmp r7, #0
	beq _0202ECD4
	mov r0, r4
	bl sub_0202EE88
_0202ECD4:
#ifdef JAPAN
	ldr r0, [r6, #8]
	cmp r0, #0
	blt _0202EDC8
	tst sb, #1
	beq _0202EDC8
	add r1, r5, #0x108
	add r2, r1, #0x1400
	mov r1, #0x18
	mla r7, r0, r1, r2
	ldr sb, [r5, #0x430]
	mov r8, #0
	ldr r1, _0202EE7C ; =0x0000040C
	b _0202F078
_0202F05C:
	mla r2, r8, r1, r5
	add r2, r2, #0x400
	ldrh r3, [r7, #2]
	ldrh r2, [r2, #0x34]
	cmp r3, r2
	beq _0202F080
	add r8, r8, #1
_0202F078:
	cmp r8, sb
	blt _0202F05C
_0202F080:
	cmp sb, #3
	bge _0202EDBC
	ldrh r1, [r7, #2]
	cmp r1, #0
	addne r0, r5, r0
#else
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #5
	bne _0202EE28
	ldr r1, [r6, #8]
	mov r0, #0
	mov r7, r0
	cmp r1, #0
	blt _0202EDC8
	tst sb, #1
	beq _0202EDC8
	add r2, r5, #0x108
	add r3, r2, #0x1400
	mov r2, #0x18
	mla r8, r1, r2, r3
	ldr sl, [r5, #0x430]
	mov r7, #1
	ldr r2, _0202EE7C ; =0x0000040C
	b _0202ED3C
_0202ED20:
	mla r3, r0, r2, r5
	add r3, r3, #0x400
	ldrh sb, [r8, #2]
	ldrh r3, [r3, #0x34]
	cmp sb, r3
	beq _0202ED44
	add r0, r0, #1
_0202ED3C:
	cmp r0, sl
	blt _0202ED20
_0202ED44:
	cmp sl, #3
	bge _0202EDBC
	ldrh r0, [r8, #2]
	cmp r0, #0
	addne r0, r5, r1
#endif
	addne r0, r0, #0x1000
	ldrneb r0, [r0, #0x568]
	cmpne r0, #0
	beq _0202EDBC
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
	ldr r0, [r5, #0x430]
	add r2, r6, #0x18
	add r0, r0, #1
	str r0, [r5, #0x430]
	mov r3, #0
#ifdef JAPAN
	ldrh r8, [r7, #2]
	add r0, r6, #0x400
	mov r1, r7
	strh r8, [r0, #0xc]
#else
	ldrh sb, [r8, #2]
	add r0, r6, #0x400
	mov r1, r8
	strh sb, [r0, #0xc]
#endif
	str r3, [r6, #0x410]
	sub r3, r3, #1
	add r0, r2, #0x400
	str r3, [r6, #0x414]
	bl sub_0202202C
	add r0, r5, #0x1000
	mov r1, #2
	str r1, [r0, #0x464]
	b _0202EDC8
_0202EDBC:
	add r0, r5, #4
	mov r1, #2
	bl PlayWindowInputSound
_0202EDC8:
#ifdef JAPAN
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #5
#else
	cmp r7, #0
#endif
	bne _0202EE28
	ldr r0, [sp, #0x14]
	tst r0, #2
	beq _0202EE28
	add r0, r5, #4
	mov r1, #1
	bl PlayWindowInputSound
	ldr r0, [r5, #0x430]
	cmp r0, #0
	ble _0202EE0C
	sub r0, r0, #1
	str r0, [r5, #0x430]
	add r0, r5, #0x1000
	mov r1, #3
	str r1, [r0, #0x464]
	b _0202EE28
_0202EE0C:
	mov r1, #1
	add r0, r5, #0x1000
	strb r1, [r0, #0x468]
	sub r1, r1, #6
	str r1, [r4, #0xb8]
	mov r1, #6
	str r1, [r0, #0x464]
_0202EE28:
	ldrsb r0, [r4, #0x10]
	add r1, r5, #4
	bl sub_02028948
	b _0202EE74
_0202EE38:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202EE74
	add r0, r5, #0x1000
	mov r1, #7
	str r1, [r0, #0x464]
_0202EE54:
	ldrsb r0, [r4, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r4, #0xb8]
	addne r0, r5, #0x1000
	movne r1, #8
	strne r1, [r0, #0x464]
_0202EE74:
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202EE7C: .word 0x0000040C
#ifdef JAPAN
_0202EE80: .word 0x000003B7
#else
_0202EE80: .word 0x000001AF
#endif
_0202EE84: .word 0x00000408
	arm_func_end UpdateScrollBox

	arm_func_start sub_0202EE88
sub_0202EE88: ; 0x0202EE88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x124
	mov sl, r0
	ldr r5, [sl, #0xc]
	ldrsb r0, [sl, #0x10]
	add r1, r5, #0x34
	ldr r4, [r5, #0x430]
	ldr r2, _0202F0A4 ; =0x0000040C
	add r1, r1, #0x400
	add r3, r5, #0x1000
	mla r6, r4, r2, r1
	ldr r4, [r3, #0x4c0]
	bl sub_02027B1C
	ldrsb r1, [sl, #0x10]
	add r0, sp, #8
	bl sub_02025E84
	add r0, r5, #4
	mov r1, #0
	bl GetPageItemYOffset
	mov r2, r0
	add r0, sp, #8
	mov r1, #4
	bl sub_0202614C
	add r0, r5, r4, lsl #2
	add r0, r0, #0x1000
	ldr r2, [r0, #0x4e4]
	ldr r1, _0202F0A8 ; =0x0000C406
	add r0, sp, #8
	bl sub_02026194
	add r0, sp, #8
	bl sub_02026204
	add r1, r5, #0x108
	add r0, sp, #8
	add r1, r1, #0x1400
	bl sub_020261F4
	add r1, r5, #0x1000
	str r0, [r1, #0x504]
	ldr r0, [r5, #0x430]
	cmp r0, #3
	bge _0202EFA0
	mov r8, #0
	mov r0, #1
	mov lr, r8
	ldr sb, _0202F0A4 ; =0x0000040C
	mov ip, #0x18
	b _0202EF90
_0202EF40:
	mla r2, r8, ip, r5
	add r3, r2, #0x1500
	mov r4, r0
	mov r2, lr
	ldrh r3, [r3, #0xa]
	ldr r7, [r5, #0x430]
	b _0202EF78
_0202EF5C:
	mla fp, r2, sb, r5
	add fp, fp, #0x400
	ldrh fp, [fp, #0x34]
	cmp r3, fp
	moveq r4, #0
	beq _0202EF80
	add r2, r2, #1
_0202EF78:
	cmp r2, r7
	blt _0202EF5C
_0202EF80:
	add r2, r5, r8
	add r2, r2, #0x1000
	strb r4, [r2, #0x568]
	add r8, r8, #1
_0202EF90:
	ldr r3, [r1, #0x504]
	cmp r8, r3
	blt _0202EF40
	b _0202EFC8
_0202EFA0:
	mov r4, #0
	mov r2, r4
	b _0202EFBC
_0202EFAC:
	add r0, r5, r4
	add r0, r0, #0x1000
	strb r2, [r0, #0x568]
	add r4, r4, #1
_0202EFBC:
	ldr r3, [r1, #0x504]
	cmp r4, r3
	blt _0202EFAC
_0202EFC8:
	add r0, r5, #0x108
	cmp r3, #0
	add r7, r0, #0x1400
	mov r8, #0
	ble _0202F088
	add r4, r5, #0x1000
	mov fp, #0x2e
	b _0202F07C
_0202EFE8:
	add r0, r5, r8
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x568]
	ldrsb r1, [sl, #0x10]
	cmp r0, #0
	movne sb, #0x4c
	add r0, sp, #8
	moveq sb, #0x57
	bl sub_02025E84
	add r0, sp, #8
	ldmib r7, {r1, r2}
	bl sub_0202614C
	ldr r1, _0202F0AC ; =0x0000C506
	ldr r2, [r7, #0x14]
	add r0, sp, #8
	bl sub_02026194
	mov r1, sb
	add r0, sp, #8
	bl sub_02026174
	add r0, sp, #8
	bl sub_02026204
	ldr r0, [r6, #8]
	cmp r0, r8
	bne _0202F074
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _0202F074
	sub r3, r0, r1
	ldr r2, [r7, #8]
	ldr r0, [r7, #0x10]
	sub r0, r0, r2
	stmia sp, {r0, fp}
	ldrsb r0, [sl, #0x10]
	bl sub_02025D90
_0202F074:
	add r8, r8, #1
	add r7, r7, #0x18
_0202F07C:
	ldr r0, [r4, #0x504]
	cmp r8, r0
	blt _0202EFE8
_0202F088:
	ldrsb r1, [sl, #0x10]
	add r0, r5, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202F0A4: .word 0x0000040C
_0202F0A8: .word 0x0000C406
_0202F0AC: .word 0x0000C506
	arm_func_end sub_0202EE88

	arm_func_start CreateDialogueBox
CreateDialogueBox: ; 0x0202F0B0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r0, _0202F13C ; =0x00000528
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r6, #0
	ldreq r0, _0202F140 ; =DIALOGUE_BOX_DEFAULT_WINDOW_PARAMS
	add r5, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r5, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r5, {r0, r1, r2, r3}
	ldrne r0, _0202F144 ; =UpdateDialogueBox
	ldr r1, _0202F144 ; =UpdateDialogueBox
	strne r0, [sp]
	str r4, [sp, #0xc]
	str r1, [r4]
	mov r2, #1
	add r0, sp, #0
	mov r1, #3
	strb r2, [r4, #0xa]
	bl NewWindowScreenCheck
	mov r5, r0
	mov r1, r5
	add r0, r4, #0xc
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	strb r1, [r4, #8]
	mov r0, r5
	strb r1, [r4, #9]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202F13C: .word 0x00000528
_0202F140: .word DIALOGUE_BOX_DEFAULT_WINDOW_PARAMS
_0202F144: .word UpdateDialogueBox
	arm_func_end CreateDialogueBox

	arm_func_start CloseDialogueBox
CloseDialogueBox: ; 0x0202F148
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseDialogueBox

	arm_func_start sub_0202F16C
sub_0202F16C: ; 0x0202F16C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0xc
	bl sub_020261D4
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F16C
