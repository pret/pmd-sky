	.include "asm/macros.inc"
	.include "main_0202BD10.inc"

	.text

	arm_func_start GetAdvancedMenuResult
GetAdvancedMenuResult: ; 0x0202BD10
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	beq _0202BD40
	ldrb r1, [r0, #0x1a1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
_0202BD40:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedMenuResult

	arm_func_start sub_0202BD48
sub_0202BD48: ; 0x0202BD48
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202BD48

	arm_func_start UpdateAdvancedMenu
UpdateAdvancedMenu: ; 0x0202BD64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0202C1D8
_0202BD84: ; jump table
	b _0202BDB0 ; case 0
	b _0202BDC8 ; case 1
	b _0202BDF0 ; case 2
	b _0202BE50 ; case 3
	b _0202C168 ; case 4
	b _0202C178 ; case 5
	b _0202C1AC ; case 6
	b _0202C1D8 ; case 7
	b _0202C1D8 ; case 8
	b _0202C0F8 ; case 9
	b _0202C130 ; case 10
_0202BDB0:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202C1D8
	mov r0, #2
	str r0, [r4, #0x19c]
_0202BDC8:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _0202BDF0
	ldrb r0, [r6, #8]
	bl sub_020287C4
	ldrsb r0, [r6, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _0202C1D8
_0202BDF0:
	mov r0, r6
	bl DrawAdvancedMenu
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202BE2C
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202C1D8
_0202BE2C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202C1D8
_0202BE50:
	mov r0, #0
	str r0, [sp, #8]
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202BEC8
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202BEC8
	mov r3, #0
	ldr r2, _0202C1E0 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202BEC8
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202BEC8:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202BEE8
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202BEE8:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202BF14
	mov r0, r6
	bl DrawAdvancedMenu
_0202BF14:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202BF84
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202BF74
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202BF48
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202BF48:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202BF74:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202C0E8
_0202BF84:
	tst r1, #2
	beq _0202BFC0
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202BFC0:
	tst r1, #0x1000
	beq _0202C00C
	ldr r0, [r4, #0xfc]
	tst r0, #0x2000
	beq _0202C00C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #9
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C00C:
	tst r1, #0x2000
	beq _0202C058
	ldr r0, [r4, #0xfc]
	tst r0, #0x4000
	beq _0202C058
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #0xa
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C058:
	tst r1, #0x200
	ldrne r0, [r4, #0x18c]
	cmpne r0, #0
	add r0, r4, #4
	beq _0202C080
	mov r1, #5
	bl PlayWindowInputSound
	ldr r0, [r4, #0x18c]
	blx r0
	b _0202C0E8
_0202C080:
	bl sub_0203250C
	cmp r0, #0
	beq _0202C0B8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C0B8:
	ldr r0, [sp, #8]
	tst r0, #0x40000
	bne _0202C0CC
	tst r0, #0x80000
	beq _0202C0E8
_0202C0CC:
	tst r0, #0x4000
	bne _0202C0E8
	tst r0, #0x8000
	moveq r0, #1
	streqb r0, [r4, #0x1a0]
	ldreq r0, [sp, #8]
	streq r0, [r4, #0x1a4]
_0202C0E8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202C1D8
_0202C0F8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
	mov r0, r6
	bl DrawAdvancedMenu
	ldr r3, [r4, #0x174]
	cmp r3, #0
	beq _0202C1D8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202C1D8
_0202C130:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
	mov r0, r6
	bl DrawAdvancedMenu
	ldr r3, [r4, #0x17c]
	cmp r3, #0
	beq _0202C1D8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202C1D8
_0202C168:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
_0202C178:
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202C1A4
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202C1A4
	mov r0, r6
	bl DrawAdvancedMenu
	mov r0, #8
	str r0, [r4, #0x19c]
	b _0202C1D8
_0202C1A4:
	mov r0, #6
	str r0, [r4, #0x19c]
_0202C1AC:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202C1D8
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_0202C1D8:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202C1E0: .word 0x00000408
	arm_func_end UpdateAdvancedMenu

	arm_func_start sub_0202C1E4
sub_0202C1E4: ; 0x0202C1E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202C24C
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202C21C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202C21C:
	mov r2, #1
	mov r1, #0
	strb r2, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	mov r0, r5
	sub r1, r1, #4
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #5
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0202C24C:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202C1E4

	arm_func_start DrawAdvancedMenu
DrawAdvancedMenu: ; 0x0202C260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	sub sp, sp, #0x400
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl GetPageStart
	mov r5, r0
	add r0, r4, #4
	bl GetNumItemsOnPage
	ldr r1, [r4, #0xfc]
	mov r6, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	addne sb, r0, r5
	ldrsb r0, [sl, #0x10]
	moveq sb, #0
	bl sub_02027B1C
	cmp r6, #0
	mov r7, #0
	ble _0202C36C
	mov fp, #0x42
	b _0202C364
_0202C2BC:
	ldr r2, [r4, #0x198]
	add r0, sp, #0xc
	mov r1, r5
	blx r2
	mov r8, r0
	mov r1, #0
	cmp sb, #0
	beq _0202C2EC
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
_0202C2EC:
	cmp r8, #0
	beq _0202C35C
	cmp r1, #0
	mov r1, r7
	add r0, r4, #4
	beq _0202C334
	bl GetPageItemYOffset
	str fp, [sp]
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp, #4]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #8]
	ldrsb r0, [sl, #0x10]
	bl sub_02026428
	b _0202C35C
_0202C334:
	bl GetPageItemYOffset
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #4]
	ldrsb r0, [sl, #0x10]
	bl sub_02026358
_0202C35C:
	add r7, r7, #1
	add r5, r5, #1
_0202C364:
	cmp r7, r6
	blt _0202C2BC
_0202C36C:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DrawAdvancedMenu

	arm_func_start sub_0202C38C
sub_0202C38C: ; 0x0202C38C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	ldrne r0, [r0, #0x1a4]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C38C

	arm_func_start CreateCollectionMenu
CreateCollectionMenu: ; 0x0202C3A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	sub sp, sp, #0x400
	mov r4, r0
	mov sl, r1
	mov r0, #0x1cc
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	ldr r1, [sp, #0x450]
	mov r5, r0
	cmp r1, #0
	ldrne r0, _0202C5D4 ; =0x10008004
	orr sl, sl, #0x8000
	orrne sl, sl, r0
	cmp r4, #0
	addne r6, sp, #0x1c
	ldmneia r4, {r0, r1, r2, r3}
	stmneia r6, {r0, r1, r2, r3}
	ldrne r0, _0202C5D8 ; =UpdateCollectionMenu
	strne r0, [sp, #0x1c]
	bne _0202C418
	ldr r0, _0202C5DC ; =COLLECTION_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202C418:
	ldrb r0, [sp, #0x22]
	str r5, [sp, #0x28]
	cmp r0, #0
	bne _0202C484
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x2c
	add fp, sp, #8
	b _0202C464
_0202C43C:
	mov r0, r4
	mov r1, r6
	mov r2, fp
	blx r8
	cmp r0, #0
	beq _0202C460
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_0202C460:
	add r6, r6, #1
_0202C464:
	ldr r0, [sp, #0x454]
	cmp r6, r0
	blt _0202C43C
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202C484:
	ldrb r0, [sp, #0x23]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x54
	bne _0202C4B4
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202C4C4
_0202C4B4:
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202C4C4:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r1, _0202C5D8 ; =UpdateCollectionMenu
	mov r0, #0
	str r1, [r5]
	str sl, [r5, #0xfc]
	strb r0, [r5, #0x1c5]
	cmp sb, #0
	beq _0202C528
	add r6, r5, #0x100
	mov r4, #9
_0202C510:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0202C510
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202C528:
	mov r3, #0
	str r3, [r5, #0x18c]
	ldr r0, [sp, #0x450]
	str r8, [r5, #0x198]
	str r0, [r5, #0x19c]
	str r3, [r5, #0x1a8]
	str r3, [r5, #0x1ac]
	strb r3, [r5, #0x1b0]
	strb r3, [r5, #0x1b1]
	strb r3, [r5, #0x1b2]
	str r3, [r5, #0x1b4]
	str r3, [r5, #0x1b8]
	mov r0, #0xd
	str r0, [r5, #0x1bc]
	strb r3, [r5, #0x1c6]
	ldrb r2, [sp, #0x22]
	add r0, sp, #0x1c
	mov r1, #3
	mov r2, r2, lsl #3
	sub r2, r2, #1
	str r2, [r5, #0x1c0]
	strb r3, [r5, #0x1c4]
	strb r3, [r5, #0x1c8]
	strb r3, [r5, #0x1c9]
	str r3, [r5, #0x1a4]
	str r3, [r5, #0x1a0]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x454]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r4, [sp, #0x458]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202C5D4: .word 0x10008004
_0202C5D8: .word UpdateCollectionMenu
_0202C5DC: .word COLLECTION_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateCollectionMenu
