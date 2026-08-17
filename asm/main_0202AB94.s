	.include "asm/macros.inc"
	.include "main_0202AB94.inc"

	.text

	arm_func_start sub_0202AB94
sub_0202AB94: ; 0x0202AB94
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202AB94

	arm_func_start GetSimpleMenuResult__0202AEA4
GetSimpleMenuResult__0202AEA4: ; 0x0202ABB0
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	ldr r4, [r0, #0x198]
	cmp r1, #0
	beq _0202ABF4
	ldrb r1, [r0, #0x1a1]
	add r0, r0, #4
	cmp r1, #0
	beq _0202ABE0
	bl GetTotalNumMenuItems
	b _0202ABE4
_0202ABE0:
	bl GetSelectedMenuItemIdx
_0202ABE4:
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0202ABF4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetSimpleMenuResult__0202AEA4

	arm_func_start UpdateParentMenu
UpdateParentMenu: ; 0x0202ABFC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0202AF6C
_0202AC1C: ; jump table
	b _0202AC3C ; case 0
	b _0202AC5C ; case 1
	b _0202AC78 ; case 2
	b _0202ACDC ; case 3
	b _0202AD3C ; case 4
	b _0202AEE8 ; case 5
	b _0202AEF8 ; case 6
	b _0202AF40 ; case 7
_0202AC3C:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202AF6C
	ldr r1, [r4, #0x1a8]
	mov r0, #2
	str r1, [r4, #0x1ac]
	str r0, [r4, #0x19c]
_0202AC5C:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	ldreq r1, [r4, #0x1a8]
	moveq r0, #2
	streq r1, [r4, #0x1ac]
	streq r0, [r4, #0x19c]
	beq _0202AF6C
_0202AC78:
	ldr r0, [r4, #0x1a8]
	cmp r0, #0
	ble _0202ACD4
	ldr r0, [r4, #0x1ac]
	mov r1, #0x4000000
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1ac]
	cmp r0, #0
	add r0, r4, #4
	ble _0202ACD0
	bl sub_02031C74
	mov r1, #0
	strb r1, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	str r1, [r4, #0x1a4]
	sub r1, r1, #1
	mov r0, r6
	str r1, [r6, #0xb8]
	bl sub_0202AF78
	b _0202AF6C
_0202ACD0:
	bl sub_02031C84
_0202ACD4:
	mov r0, #3
	str r0, [r4, #0x19c]
_0202ACDC:
	mov r0, r6
	bl sub_0202AF78
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202AD18
	mov r0, #9
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202AF6C
_0202AD18:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202AF6C
_0202AD3C:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202ADAC
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202ADAC
	mov r3, #0
	ldr r2, _0202AF74 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202ADAC
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202ADAC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202ADCC
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202ADCC:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202ADF8
	mov r0, r6
	bl sub_0202AF78
_0202ADF8:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202AE68
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202AE58
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202AE2C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202AE2C:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202AED8
_0202AE58:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202AED8
_0202AE68:
	tst r1, #2
	add r0, r4, #4
	beq _0202AEA4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202AED8
_0202AEA4:
	bl sub_0203250C
	cmp r0, #0
	beq _0202AED8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
_0202AED8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202AF6C
_0202AEE8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202AF6C
_0202AEF8:
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202AF24
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202AF38
	mov r0, r6
	bl sub_0202AF78
	mov r0, #9
	str r0, [r4, #0x19c]
	b _0202AF6C
_0202AF24:
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	movne r0, #9
	strne r0, [r4, #0x19c]
	bne _0202AF6C
_0202AF38:
	mov r0, #7
	str r0, [r4, #0x19c]
_0202AF40:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202AF6C
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #8
	str r0, [r4, #0x19c]
_0202AF6C:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202AF74: .word 0x00000408
	arm_func_end UpdateParentMenu

	arm_func_start sub_0202AF78
sub_0202AF78: ; 0x0202AF78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r5, [sl, #0xc]
	mov r7, #0
	ldr r0, [r5, #0xfc]
	ldr r6, [r5, #0x198]
	tst r0, #0x200
	ldrne r8, [r5, #0x160]
	ldrsb r0, [sl, #0x10]
	moveq r8, #0
	bl sub_02027B1C
	mov fp, #1
	mov r4, r7
	b _0202B008
_0202AFB0:
	mov r1, r4
	cmp r8, #0
	beq _0202AFCC
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, fp
_0202AFCC:
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r5, #4
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
_0202B008:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0202AFB0
	ldrsb r1, [sl, #0x10]
	add r0, r5, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202AF78

	arm_func_start sub_0202B030
sub_0202B030: ; 0x0202B030
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202B094
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202B068
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202B068:
	mov r2, #1
	mov r1, #0
	strb r2, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	mov r0, r5
	sub r1, r1, #4
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #6
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
_0202B094:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202B030

	arm_func_start sub_0202B0A4
sub_0202B0A4: ; 0x0202B0A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	cmp r5, #0
	add r0, r4, #4
	mov r1, #0xb000000
	beq _0202B0D8
	bl sub_02031C74
	add r0, r4, #4
	mov r1, #0x10
	bl sub_02031C84
	ldmia sp!, {r3, r4, r5, pc}
_0202B0D8:
	bl sub_02031C84
	add r0, r4, #4
	mov r1, #0x10
	bl sub_02031C74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202B0A4

	arm_func_start CreateSimpleMenuFromStringIds
CreateSimpleMenuFromStringIds: ; 0x0202B0EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r3
	mov sb, r1
	mov r8, r2
	mov sl, r0
	mov r1, r7
	mov r2, #0
	b _0202B114
_0202B10C:
	add r1, r1, #8
	add r2, r2, #1
_0202B114:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202B10C
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r6, r5
	mov r4, #0
	mov fp, #0x100
	b _0202B16C
_0202B148:
	ldr r3, _0202B1A8 ; =0x0000C402
	mov r0, r6
	mov r1, fp
	str r4, [sp]
	bl PreprocessStringFromId
	ldr r0, [r7, #4]
	add r7, r7, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0202B16C:
	ldrh r2, [r7]
	cmp r2, #0
	bne _0202B148
	mov r0, #0
	strb r0, [r6]
	ldr r0, [r7, #4]
	ldr r4, [sp, #0x28]
	str r0, [r6, #0x100]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r5
	str r4, [sp]
	bl CreateSimpleMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202B1A8: .word 0x0000C402
	arm_func_end CreateSimpleMenuFromStringIds

	arm_func_start CreateSimpleMenu
CreateSimpleMenu: ; 0x0202B1AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r4, r6
	mov r5, #0
	b _0202B1D8
_0202B1D0:
	add r4, r4, #0x104
	add r5, r5, #1
_0202B1D8:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0202B1D0
	add r0, r5, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202B234
_0202B208:
	mov sl, r6
	mov ip, r5
	add r6, r6, #0x104
	add r5, r5, #0x104
	mov lr, #0x10
_0202B21C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0202B21C
	ldr r0, [sl]
	str r0, [ip]
_0202B234:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0202B208
	mov ip, #0x10
_0202B248:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202B248
	ldr r0, [r6]
	ldr r6, [sp, #0x28]
	str r0, [r5]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [sp]
	bl CreateSimpleMenuInternal
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end CreateSimpleMenu

	arm_func_start CreateSimpleMenuInternal
CreateSimpleMenuInternal: ; 0x0202B284
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	tst sl, #0x20
	ldrne r7, [sb]
	mov fp, #0
	moveq r7, #0
	cmp r6, #0
	str fp, [sp, #8]
	mov r4, r0
	addne ip, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202B488 ; =UpdateSimpleMenu
	mov r5, r8
	orr sl, sl, #0x8000
	strne r0, [sp, #0x1c]
	bne _0202B2F8
	ldr r0, _0202B48C ; =SIMPLE_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202B2F8:
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _0202B348
	mov r6, #0
	b _0202B324
_0202B310:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
	add r5, r5, #0x104
_0202B324:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202B310
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202B348:
	mov r5, r8
	b _0202B36C
_0202B350:
	ldr r0, [r5, #0x100]
	add r5, r5, #0x104
	cmp r0, r7
	ldr r0, [sp, #8]
	ldreq fp, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0202B36C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202B350
	ldr r0, [sp, #0x50]
	add r2, sp, #8
	cmp r0, #0
	ldrle r0, [sp, #8]
	add r3, sp, #0x50
	strle r0, [sp, #0x50]
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	mov r0, sl
	bne _0202B3B4
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202B3BC
_0202B3B4:
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202B3BC:
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
	ldr r0, _0202B488 ; =UpdateSimpleMenu
	cmp sb, #0
	str r0, [r4]
	str sl, [r4, #0xfc]
	beq _0202B418
	add r6, r4, #0x100
	mov r5, #9
_0202B400:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202B400
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202B418:
	str fp, [r4, #0x100]
	str r8, [r4, #0x198]
	mov r2, #0
	str r2, [r4, #0x19c]
	strb r2, [r4, #0x1a0]
	strb r2, [r4, #0x1a1]
	str r2, [r4, #0x1a4]
	str r2, [r4, #0x1ac]
	str r2, [r4, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #8]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r5, [sp, #0x50]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0x100
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202B488: .word UpdateSimpleMenu
_0202B48C: .word SIMPLE_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateSimpleMenuInternal

	arm_func_start ResumeSimpleMenu
ResumeSimpleMenu: ; 0x0202B490
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeSimpleMenu
