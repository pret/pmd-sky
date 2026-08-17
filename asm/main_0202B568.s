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

	arm_func_start SetSimpleMenuField0x1AC
SetSimpleMenuField0x1AC: ; 0x0202BA0C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1ac]
	ldmia sp!, {r4, pc}
	arm_func_end SetSimpleMenuField0x1AC

	arm_func_start CreateAdvancedMenu
CreateAdvancedMenu: ; 0x0202BA20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b0
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r5, r0
	cmp r6, #0
	ldreq r0, _0202BBE8 ; =ADVANCED_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _0202BBEC ; =UpdateAdvancedMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	orreq sl, sl, #0x300000
	str r5, [sp, #0x24]
	cmp r0, #0
	bne _0202BADC
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x28
	b _0202BABC
_0202BA98:
	mov r0, r4
	mov r1, r6
	blx r8
	cmp r0, #0
	beq _0202BAB8
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_0202BAB8:
	add r6, r6, #1
_0202BABC:
	ldr r0, [sp, #0x448]
	cmp r6, r0
	blt _0202BA98
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1e]
_0202BADC:
	ldrb r0, [sp, #0x1f]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x48
	bne _0202BB0C
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1f]
	b _0202BB1C
_0202BB0C:
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202BB1C:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _0202BBEC ; =UpdateAdvancedMenu
	cmp sb, #0
	str r0, [r5]
	str sl, [r5, #0xfc]
	beq _0202BB78
	add r6, r5, #0x100
	mov r4, #9
_0202BB60:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0202BB60
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202BB78:
	mov r2, #0
	str r2, [r5, #0x18c]
	str r8, [r5, #0x198]
	str r2, [r5, #0x1a4]
	str r2, [r5, #0x19c]
	strb r2, [r5, #0x1a0]
	strb r2, [r5, #0x1a1]
	str r2, [r5, #0x1a8]
	add r0, sp, #0x18
	mov r1, #3
	str r2, [r5, #0x1ac]
	bl NewWindowScreenCheck
	add r1, sp, #8
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x448]
	add r3, sp, #8
	str r0, [sp]
	ldr r4, [sp, #0x44c]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x28
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202BBE8: .word ADVANCED_MENU_DEFAULT_WINDOW_PARAMS
_0202BBEC: .word UpdateAdvancedMenu
	arm_func_end CreateAdvancedMenu

	arm_func_start ResumeAdvancedMenu
ResumeAdvancedMenu: ; 0x0202BBF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	str r1, [r0, #0x1a4]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeAdvancedMenu

	arm_func_start sub_0202BC28
sub_0202BC28: ; 0x0202BC28
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x19c]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x19c]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202BC28

	arm_func_start CloseAdvancedMenu
CloseAdvancedMenu: ; 0x0202BC44
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAdvancedMenu

	arm_func_start sub_0202BC60
sub_0202BC60: ; 0x0202BC60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #3
	cmpne r0, #4
	cmpne r0, #0xa
	cmpne r0, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	strb r0, [r4, #0x1a0]
	mov r2, #0
	strb r0, [r4, #0x1a1]
	mov r0, r5
	sub r1, r2, #5
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #6
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202BC60

	arm_func_start IsAdvancedMenuActive2
IsAdvancedMenuActive2: ; 0x0202BCBC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive2

	arm_func_start IsAdvancedMenuActive
IsAdvancedMenuActive: ; 0x0202BCDC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive
