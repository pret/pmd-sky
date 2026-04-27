	.include "asm/macros.inc"
	.include "main_0202A3E4.inc"

	.text

	arm_func_start PrintClearMark
PrintClearMark: ; 0x0202A3E4
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0
	bl PrintMark
	ldmia sp!, {r3, pc}
	arm_func_end PrintClearMark

	arm_func_start sub_0202A40C
sub_0202A40C: ; 0x0202A40C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #1
	bl PrintMark
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A40C

	arm_func_start PrintBadgeMark
PrintBadgeMark: ; 0x0202A434
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #2
	bl PrintMark
	ldmia sp!, {r3, pc}
	arm_func_end PrintBadgeMark

	arm_func_start PrintMark
PrintMark: ; 0x0202A45C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x70
	mov sl, r0
	mov r4, r1
	mov sb, r2
	mov r8, r3
	ldr r7, [sp, #0x90]
	bl FileRom_InitDataTransfer
	add r0, sp, #0x28
	bl FileRom_Veneer_FileInit
	ldr r1, _0202A5C0 ; =_020AFDAC
	add r0, sp, #0x28
	ldr r1, [r1, sl, lsl #2]
	bl FileRom_HandleOpen
	mov r1, r4, lsl #3
	add r0, sp, #0x28
	mov r2, #0
	bl FileRom_HandleSeek
	add r0, sp, #0x28
	add r1, sp, #8
	mov r2, #0x10
	bl FileRom_HandleRead
	ldr r6, [sp, #8]
	ldr r1, [sp, #0x10]
	mov r0, r6
	sub r4, r1, r6
	ldr r1, [sp, #0xc]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r4
	mov r1, #8
	bl MemAlloc
	movs r5, r0
	beq _0202A504
	add r0, sp, #0x28
	mov r1, r6
	mov r2, #0
	bl FileRom_HandleSeek
	add r0, sp, #0x28
	mov r1, r5
	mov r2, r4
	bl FileRom_HandleRead
_0202A504:
	add r0, sp, #0x28
	bl FileClose
	bl FileRom_StopDataTransfer
	cmp sl, #2
	ldreq r0, _0202A5C4 ; =_0209AE44
	add r4, sp, #0x18
	ldrne r0, _0202A5C8 ; =_0209AE34
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	mvn r0, #0
	ldrb r2, [sp, #4]
	ldrb r1, [sp, #5]
	cmp r7, r0
	ldreqb r0, [sp, #6]
	strb sb, [sp, #0x1c]
	strb r8, [sp, #0x1d]
	strb r2, [sp, #0x1e]
	strb r1, [sp, #0x1f]
	addeq r7, r0, #3
	beq _0202A564
	sub r0, r0, #1
	cmp r7, r0
	ldreqb r0, [sp, #6]
	addeq r7, r0, #0x11
_0202A564:
	add r0, sp, #0x18
	mov r1, #0
	bl CreateTextBox
	mov r1, #0
	mov r4, r0
	bl sub_02027A08
	cmp r5, #0
	beq _0202A5B4
	mov r0, r4
	mov r1, r5
	mov r2, r7, lsl #4
	bl sub_02027040
	mov r0, r4
	mov r2, r7
	add r1, r5, #0x30
	bl sub_02026E3C
	mov r0, r4
	bl UpdateWindow
	mov r0, r5
	bl MemFree
_0202A5B4:
	mov r0, r4
	add sp, sp, #0x70
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202A5C0: .word _020AFDAC
_0202A5C4: .word _0209AE44
_0202A5C8: .word _0209AE34
	arm_func_end PrintMark

	arm_func_start CreateParentMenuFromStringIds
CreateParentMenuFromStringIds: ; 0x0202A5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0202A5F4
_0202A5EC:
	add r1, r1, #8
	add r2, r2, #1
_0202A5F4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202A5EC
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202A638
_0202A620:
	mov r0, r5
	bl GetStringFromFileVeneer
	ldr r0, [r6, #4]
	add r6, r6, #8
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0202A638:
	ldrh r1, [r6]
	cmp r1, #0
	bne _0202A620
	mov r0, #0
	strb r0, [r5]
	ldr r6, [r6, #4]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [r5, #0x100]
	bl CreateParentMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CreateParentMenuFromStringIds

	arm_func_start IsEmptyString
IsEmptyString: ; 0x0202A66C
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsEmptyString

	arm_func_start CreateParentMenu
CreateParentMenu: ; 0x0202A690
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0202A6B8
_0202A6B0:
	add r1, r1, #8
	add r2, r2, #1
_0202A6B8:
	ldr r0, [r1]
	cmp r0, #0
	bne _0202A6B0
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202A6FC
_0202A6E4:
	mov r0, r5
	bl strcpy
	ldr r0, [r6, #4]
	add r6, r6, #8
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0202A6FC:
	ldr r1, [r6]
	cmp r1, #0
	bne _0202A6E4
	mov r0, #0
	strb r0, [r5]
	ldr r6, [r6, #4]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [r5, #0x100]
	bl CreateParentMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CreateParentMenu

	arm_func_start CreateParentMenuWrapper
CreateParentMenuWrapper: ; 0x0202A730
	stmdb sp!, {r4, lr}
	bl CreateParentMenu
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	beq _0202A754
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1b0]
_0202A754:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end CreateParentMenuWrapper

	arm_func_start CreateParentMenuInternal
CreateParentMenuInternal: ; 0x0202A75C
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
	ldrne r0, _0202A94C ; =UpdateParentMenu
	mov r5, r8
	strne r0, [sp, #0x1c]
	bne _0202A7CC
	ldr r0, _0202A950 ; =PARENT_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202A7CC:
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _0202A81C
	mov r6, #0
	b _0202A7F8
_0202A7E4:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
	add r5, r5, #0x104
_0202A7F8:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202A7E4
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202A81C:
	mov r5, r8
	and r6, sl, #0x20
	b _0202A84C
_0202A828:
	cmp r6, #0
	beq _0202A83C
	ldr r0, [r5, #0x100]
	cmp r0, r7
	ldreq fp, [sp, #8]
_0202A83C:
	ldr r0, [sp, #8]
	add r5, r5, #0x104
	add r0, r0, #1
	str r0, [sp, #8]
_0202A84C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202A828
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	bne _0202A880
	add r2, sp, #8
	mov r0, sl
	mov r1, sb
	mov r3, r2
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
_0202A880:
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
	ldr r0, _0202A94C ; =UpdateParentMenu
	cmp sb, #0
	str r0, [r4]
	str sl, [r4, #0xfc]
	beq _0202A8DC
	add r6, r4, #0x100
	mov r5, #9
_0202A8C4:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202A8C4
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202A8DC:
	str fp, [r4, #0x100]
	str r8, [r4, #0x198]
	mov r2, #0
	str r2, [r4, #0x19c]
	strb r2, [r4, #0x1a0]
	strb r2, [r4, #0x1a1]
	str r2, [r4, #0x1a4]
	str r2, [r4, #0x1a8]
	str r2, [r4, #0x1ac]
	strb r2, [r4, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r5, [sp, #8]
	add r3, sp, #0xc
	str r5, [sp]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0x100
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202A94C: .word UpdateParentMenu
_0202A950: .word PARENT_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateParentMenuInternal

	arm_func_start ResumeParentMenu
ResumeParentMenu: ; 0x0202A954
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
	arm_func_end ResumeParentMenu

	arm_func_start sub_0202A98C
sub_0202A98C: ; 0x0202A98C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mov sb, r1
	mov r5, #0
	bl GetWindow
	mov r7, r0
	mov r1, sb
	ldr r8, [r7, #0xc]
	b _0202A9BC
_0202A9B4:
	add r1, r1, #8
	add r5, r5, #1
_0202A9BC:
	ldr r0, [r1]
	cmp r0, #0
	bne _0202A9B4
	ldr r0, [r8, #0x198]
	cmp r0, #0
	beq _0202A9D8
	bl MemFree
_0202A9D8:
	add r0, r5, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r6, r5
	b _0202AA10
_0202A9F8:
	mov r0, r6
	bl strcpy
	ldr r0, [sb, #4]
	add sb, sb, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0202AA10:
	ldr r1, [sb]
	cmp r1, #0
	bne _0202A9F8
	mov sl, #0
	strb sl, [r6]
	ldr r0, [sb, #4]
	mov sb, r5
	str r0, [r6, #0x100]
	b _0202AA3C
_0202AA34:
	add sb, sb, #0x104
	add sl, sl, #1
_0202AA3C:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202AA34
	str r5, [r8, #0x198]
	ldrb r0, [r7, #8]
	bl sub_020287C4
	mov r0, r4
	bl UpdateWindow
	mov r0, #3
	str r0, [r8, #0x19c]
	mov r2, #0
	strb r2, [r8, #0x1a0]
	strb r2, [r8, #0x1a1]
	add r1, sp, #8
	mov r0, r4
	str r2, [r8, #0x1a4]
	bl GetWindowRectangle
	str sl, [sp]
	str sl, [sp, #4]
	ldr r1, [r8, #0xfc]
	add r0, r8, #4
	add r2, r8, #0x100
	add r3, sp, #8
	bl InitWindowInput
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0202A98C

	arm_func_start SetParentMenuState7
SetParentMenuState7: ; 0x0202AAA8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #7
	str r1, [r0, #0x19c]
	ldmia sp!, {r3, pc}
	arm_func_end SetParentMenuState7

	arm_func_start CloseParentMenu
CloseParentMenu: ; 0x0202AABC
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
	arm_func_end CloseParentMenu

	arm_func_start sub_0202AAE8
sub_0202AAE8: ; 0x0202AAE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #9
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
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202AAE8

	arm_func_start IsParentMenuActive
IsParentMenuActive: ; 0x0202AB40
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #8
	cmpne r0, #9
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsParentMenuActive

	arm_func_start CheckParentMenuField0x1A0
CheckParentMenuField0x1A0: ; 0x0202AB60
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckParentMenuField0x1A0

	arm_func_start GetWindowIdSelectedItemOnPage
GetWindowIdSelectedItemOnPage: ; 0x0202AB80
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedItemOnPage
	ldmia sp!, {r3, pc}
	arm_func_end GetWindowIdSelectedItemOnPage

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

	arm_func_start CloseSimpleMenu
CloseSimpleMenu: ; 0x0202B4C4
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
	arm_func_end CloseSimpleMenu

	arm_func_start IsSimpleMenuActive
IsSimpleMenuActive: ; 0x0202B4F0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsSimpleMenuActive

	arm_func_start CheckSimpleMenuField0x1A0
CheckSimpleMenuField0x1A0: ; 0x0202B510
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckSimpleMenuField0x1A0

	arm_func_start sub_0202B530
sub_0202B530: ; 0x0202B530
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedItemOnPage
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B530

	arm_func_start sub_0202B544
sub_0202B544: ; 0x0202B544
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetCurrentPage
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B544

	arm_func_start GetSimpleMenuField0x1A4
GetSimpleMenuField0x1A4: ; 0x0202B558
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a4]
	ldmia sp!, {r3, pc}
	arm_func_end GetSimpleMenuField0x1A4

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

	arm_func_start GetAdvancedMenuCurrentOption
GetAdvancedMenuCurrentOption: ; 0x0202BCFC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedMenuCurrentOption

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

	arm_func_start SetCollectionMenuField0x1BC
SetCollectionMenuField0x1BC: ; 0x0202C5E0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1bc]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1BC

	arm_func_start SetCollectionMenuWidth
SetCollectionMenuWidth: ; 0x0202C5F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindow
	ldr r1, [r0, #0xc]
	str r4, [r1, #0x1c0]
	ldrb r0, [r0, #6]
	mov r0, r0, lsl #3
	sub r0, r0, #1
	cmp r4, r0
	strgt r0, [r1, #0x1c0]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuWidth

	arm_func_start sub_0202C620
sub_0202C620: ; 0x0202C620
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1ac]
	mov r1, #0
	strb r1, [r0, #0x1b0]
	strb r1, [r0, #0x1b1]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C620

	arm_func_start sub_0202C654
sub_0202C654: ; 0x0202C654
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	str r0, [r4, #0x1ac]
	mov r0, #0
	strb r0, [r4, #0x1b0]
	strb r0, [r4, #0x1b1]
	cmp r5, #0
	bne _0202C6A4
	mov r0, r8
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	str r0, [r4, #0x100]
_0202C6A4:
	add r1, sp, #8
	mov r0, r8
	bl GetWindowRectangle
	str r7, [sp]
	str r6, [sp, #4]
	ldr r1, [r4, #0xfc]
	add r3, sp, #8
	add r0, r4, #4
	add r2, r4, #0x100
	bl InitWindowInput
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0202C654

	arm_func_start sub_0202C6D4
sub_0202C6D4: ; 0x0202C6D4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_0203271C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202C6D4

	arm_func_start sub_0202C6F0
sub_0202C6F0: ; 0x0202C6F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	str r5, [r0, #0x1b4]
	str r4, [r0, #0x1b8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202C6F0

	arm_func_start CloseCollectionMenu
CloseCollectionMenu: ; 0x0202C70C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseCollectionMenu

	arm_func_start IsCollectionMenuActive
IsCollectionMenuActive: ; 0x0202C728
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1ac]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsCollectionMenuActive

	arm_func_start sub_0202C748
sub_0202C748: ; 0x0202C748
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C748

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

	arm_func_start IsDialogueBoxActive
IsDialogueBoxActive: ; 0x0202F180
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end IsDialogueBoxActive

	arm_func_start sub_0202F190
sub_0202F190: ; 0x0202F190
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r5
	mov r2, r4
	add r0, r0, #0xc
	bl sub_02026184
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202F190

	arm_func_start ShowStringIdInDialogueBox
ShowStringIdInDialogueBox: ; 0x0202F1B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F1EC
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F200
_0202F1EC:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F200
	add r0, r4, #0x128
	bl sub_02048240
_0202F200:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessStringFromId
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringIdInDialogueBox

	arm_func_start ShowStringInDialogueBox
ShowStringInDialogueBox: ; 0x0202F23C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F274
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F288
_0202F274:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F288
	add r0, r4, #0x128
	bl sub_02048240
_0202F288:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessString
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringInDialogueBox

	arm_func_start sub_0202F2C4
sub_0202F2C4: ; 0x0202F2C4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F31C
_0202F2E0: ; jump table
	b _0202F31C ; case 0
	b _0202F2F4 ; case 1
	b _0202F308 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F2F4:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F308:
	add r0, r4, #0xc
	bl sub_020261A4
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F31C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F2C4

	arm_func_start sub_0202F334
sub_0202F334: ; 0x0202F334
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F38C
_0202F350: ; jump table
	b _0202F38C ; case 0
	b _0202F364 ; case 1
	b _0202F378 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F364:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F378:
	mov r0, #3
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F38C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F334

	arm_func_start ShowDialogueBox
ShowDialogueBox: ; 0x0202F3A4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F3E0
_0202F3C0: ; jump table
	b _0202F3E0 ; case 0
	b _0202F3D4 ; case 1
	b _0202F3D4 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F3D4:
	add r0, r4, #0xc
	bl sub_020261C4
	ldmia sp!, {r4, pc}
_0202F3E0:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end ShowDialogueBox

	arm_func_start sub_0202F3F8
sub_0202F3F8: ; 0x0202F3F8
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F434
_0202F414: ; jump table
	b _0202F434 ; case 0
	b _0202F428 ; case 1
	b _0202F428 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F428:
	add r0, r4, #0xc
	bl sub_020261B4
	ldmia sp!, {r4, pc}
_0202F434:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F3F8

	arm_func_start ReadStringFromDialogueBox
ReadStringFromDialogueBox: ; 0x0202F44C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r0
	mov r0, r5
	mov r2, r4
	add r1, r1, #0x128
	bl MemcpySimple
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadStringFromDialogueBox

	arm_func_start sub_0202F474
sub_0202F474: ; 0x0202F474
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xa]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F474

	arm_func_start UpdateDialogueBox
UpdateDialogueBox: ; 0x0202F488
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F4A4: ; jump table
	b _0202F4B8 ; case 0
	b _0202F4E4 ; case 1
	b _0202F504 ; case 2
	b _0202F568 ; case 3
	b _0202F57C ; case 4
_0202F4B8:
	add r0, r4, #0xc
	bl sub_020261D4
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F4E4:
	mov r0, #1
	strb r0, [r4, #8]
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F504:
	add r0, r4, #0xc
	bl sub_02026204
	cmp r0, #0x10
	moveq r0, #3
	streq r0, [r4, #4]
	moveq r0, #1
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r5, [r4, #8]
	add r0, r4, #0xc
	bl sub_020261E4
	strb r0, [r4, #8]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #8]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x128
	bl sub_02048240
	mov r0, #0
	strb r0, [r4, #9]
	ldmia sp!, {r3, r4, r5, pc}
_0202F568:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
_0202F57C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateDialogueBox

	arm_func_start CreatePortraitBox
CreatePortraitBox: ; 0x0202F5AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r4, r1
	mov r0, #0x380
	mov r1, #8
	mov r6, r2
	bl MemAlloc
	ldr r1, _0202F648 ; =PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
	mov r5, r0
	add ip, sp, #0
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, _0202F64C ; =UpdatePortraitBox
	cmp r6, #0
	str r0, [sp]
	mvnne r0, #3
	mvneq r0, #6
	strb r0, [sp, #9]
	str r5, [sp, #0xc]
	strb r7, [sp, #8]
	add r0, sp, #0
	strb r6, [r5, #0x2a]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r5]
	mov r1, #0
	add r0, r5, #8
	str r1, [r5, #4]
	bl InitPortraitParams
	add r0, r5, #0x18
	bl InitPortraitParams
	str r4, [r5, #0x2c]
	mov r0, #0
	strb r0, [r5, #0x28]
	strb r0, [r5, #0x29]
	ldrsb r0, [r5]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202F648: .word PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
_0202F64C: .word UpdatePortraitBox
	arm_func_end CreatePortraitBox

	arm_func_start ClosePortraitBox
ClosePortraitBox: ; 0x0202F650
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end ClosePortraitBox

	arm_func_start PortraitBoxNeedsUpdate
PortraitBoxNeedsUpdate: ; 0x0202F66C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end PortraitBoxNeedsUpdate

	arm_func_start ShowPortraitInPortraitBox
ShowPortraitInPortraitBox: ; 0x0202F690
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #1
	strne r0, [r4, #4]
	cmp r5, #0
	addne ip, r4, #0x18
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	bne _0202F6D0
	add r0, r4, #0x18
	bl InitPortraitParams
_0202F6D0:
	mov r0, #1
	strb r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShowPortraitInPortraitBox

	arm_func_start HidePortraitBox
HidePortraitBox: ; 0x0202F6DC
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	bl InitPortraitParams
	ldr r0, [r4, #4]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x29]
	ldmia sp!, {r4, pc}
	arm_func_end HidePortraitBox

	arm_func_start UpdatePortraitBox
UpdatePortraitBox: ; 0x0202F70C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F728: ; jump table
	b _0202F73C ; case 0
	b _0202F760 ; case 1
	b _0202F778 ; case 2
	b _0202F86C ; case 3
	b _0202F894 ; case 4
_0202F73C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	mov r0, #1
	strb r1, [r4, #0x28]
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F760:
	ldrsb r0, [r5, #0x10]
	bl sub_0202811C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F778:
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	add ip, r4, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	bne _0202F86C
	mov r0, ip
	bl IsValidPortrait
	cmp r0, #0
	beq _0202F854
	add r0, r4, #8
	add r1, r4, #0x30
	bl LoadPortrait
	cmp r0, #0
	beq _0202F824
	ldr r2, [r4, #0x2c]
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0x30
	mov r2, r2, lsl #4
	bl sub_02027040
	ldrsb r0, [r5, #0x10]
	ldr r2, [r4, #0x2c]
	add r1, r4, #0x60
	bl sub_02026E3C
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x11]
	ldrb r0, [r4, #0x2a]
	cmp r0, #0
	ldrsb r0, [r4]
	beq _0202F808
	mvn r1, #3
	bl sub_02028080
	b _0202F810
_0202F808:
	mvn r1, #6
	bl sub_02028080
_0202F810:
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0xc
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F824:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	ldrsb r0, [r4]
	mov r1, #0
	bl sub_02028080
	add r1, r4, #0xc
	ldrsb r0, [r5, #0x10]
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F854:
	mov r0, #1
	strb r0, [r4, #0x29]
_0202F85C:
	mov r0, #3
	str r0, [r4, #4]
	sub r0, r0, #4
	str r0, [r5, #0xb8]
_0202F86C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	movne r0, #4
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0202F894:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl InitPortraitParams
	mov r0, #0
	strb r0, [r4, #0x29]
	str r0, [r4, #4]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdatePortraitBox

	arm_func_start CreateTextBox
CreateTextBox: ; 0x0202F8C4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl CreateTextBoxInternal
	str r4, [r0, #4]
	ldrsb r0, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end CreateTextBox

	arm_func_start CreateTextBoxWithArg
CreateTextBoxWithArg: ; 0x0202F8DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r5, r1
	bl CreateTextBoxInternal
	str r4, [r0, #0x14]
	str r5, [r0, #8]
	ldrsb r0, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CreateTextBoxWithArg

	arm_func_start CloseTextBox
CloseTextBox: ; 0x0202F8FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox

	arm_func_start CloseTextBox2
CloseTextBox2: ; 0x0202F918
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl sub_0202836C
	mov r0, r4
	bl sub_02027B1C
	mov r0, r4
	bl sub_0202F954
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox2

	arm_func_start sub_0202F954
sub_0202F954: ; 0x0202F954
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0202F9AC
_0202F96C: ; jump table
	b _0202F9AC ; case 0
	b _0202F988 ; case 1
	b _0202F994 ; case 2
	b _0202F9A0 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	ldmia sp!, {r3, pc} ; case 5
	ldmia sp!, {r3, pc} ; case 6
_0202F988:
	mov r1, #5
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F994:
	mov r1, #3
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9A0:
	mov r1, #4
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9AC:
	mov r1, #0
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F954

	arm_func_start sub_0202F9B8
sub_0202F9B8: ; 0x0202F9B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x10]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F9B8

	arm_func_start CreateTextBoxInternal
CreateTextBoxInternal: ; 0x0202F9DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x18
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r5, #0
	ldreq r0, _0202FA54 ; =TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _0202FA58 ; =UpdateTextBox
	add r0, sp, #0
	str r1, [sp]
	str r4, [sp, #0xc]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0x14]
	str r0, [r4, #0x10]
	ldr r1, _0202FA58 ; =UpdateTextBox
	mov r0, r4
	str r1, [r4, #0xc]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202FA54: .word TEXT_BOX_DEFAULT_WINDOW_PARAMS
_0202FA58: .word UpdateTextBox
	arm_func_end CreateTextBoxInternal

	arm_func_start UpdateTextBox
UpdateTextBox: ; 0x0202FA5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldr r0, [r4, #0x10]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202FA84: ; jump table
	b _0202FAA0 ; case 0
	b _0202FAB0 ; case 1
	b _0202FAC8 ; case 2
	b _0202FB04 ; case 3
	b _0202FB50 ; case 4
	b _0202FB68 ; case 5
	b _0202FB88 ; case 6
_0202FAA0:
	mvn r0, #0
	str r0, [r5, #0xb8]
	mov r0, #1
	str r0, [r4, #0x10]
_0202FAB0:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #0x10]
_0202FAC8:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _0202FAE4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x14]
	blx r2
	b _0202FAF8
_0202FAE4:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0202FAF8
	ldrsb r0, [r5, #0x10]
	blx r1
_0202FAF8:
	mov r0, #3
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB04:
	ldrb r0, [r5, #8]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp]
	tst r0, #2
	ldrnesb r2, [r5, #9]
	mvnne r1, #1
	cmpne r2, r1
	subne r0, r1, #3
	cmpne r2, r0
	subne r0, r1, #6
	cmpne r2, r0
	subne r0, r1, #7
	cmpne r2, r0
	movne r0, #4
	strne r0, [r4, #0x10]
	ldr r0, [r4, #0x10]
	cmp r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
_0202FB50:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #0x10]
_0202FB68:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	movne r0, #6
	strne r0, [r4, #0x10]
	subne r0, r0, #0xc
	strne r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB88:
	mvn r0, #4
	str r0, [r5, #0xb8]
	mov r0, #7
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateTextBox

	arm_func_start IsTextBoxActive
IsTextBoxActive: ; 0x0202FB9C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x10]
	cmp r0, #7
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTextBoxActive

	arm_func_start CreateAreaNameBox
CreateAreaNameBox: ; 0x0202FBBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x64
	mov r7, r0
	mov r6, r1
	mov r0, #0x1b4
	mov r1, #8
	mov r5, r2
	mov r8, r3
	bl MemAlloc
	mov r4, r0
	str r8, [r4, #0xa4]
	add r0, sp, #0x14
	str r8, [sp, #0x24]
	str r0, [sp]
	ldr r2, _0202FD2C ; =_0209AF6C
	ldr r3, _0202FD30 ; =0x0000C402
	add r0, r4, #0xac
	mov r1, #0x100
	bl PreprocessString
	add r0, r4, #0xac
	bl sub_020265A8
	mov ip, r0
	cmp r7, #0
	str ip, [r4, #0xa8]
	addne lr, sp, #4
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FD34 ; =UpdateAreaNameBox
	strne r0, [sp, #4]
	bne _0202FC48
	ldr r0, _0202FD38 ; =AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	add r7, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	orr r6, r6, #0x300000
_0202FC48:
	ldrb r0, [sp, #0xa]
	str r4, [sp, #0x10]
	cmp r0, #0
	addeq r1, ip, #7
	moveq r0, r1, asr #2
	addeq r0, r1, r0, lsr #29
	moveq r0, r0, asr #3
	streqb r0, [sp, #0xa]
	ldrb r0, [sp, #0xb]
	cmp r0, #0
	moveq r0, #2
	streqb r0, [sp, #0xb]
	tst r6, #0x200000
	ldrneb r1, [sp, #8]
	ldrneb r0, [sp, #0xa]
	subne r0, r1, r0
	strneb r0, [sp, #8]
	tst r6, #0x100000
	ldrneb r1, [sp, #9]
	ldrneb r0, [sp, #0xb]
	subne r0, r1, r0
	strneb r0, [sp, #9]
	ldrb r1, [sp, #0xa]
	ldr r0, [r4, #0xa8]
	rsb r0, r0, r1, lsl #3
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1b0]
	ldrb r0, [sp, #0xb]
	mov r0, r0, lsl #3
	sub r0, r0, #0xc
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [r4, #0x1b0]
	ldr r0, _0202FD34 ; =UpdateAreaNameBox
	cmp r5, #0
	stmia r4, {r0, r6}
	beq _0202FD10
	add r7, r4, #8
	mov r6, #9
_0202FCF8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202FCF8
	ldmia r5, {r0, r1}
	stmia r7, {r0, r1}
_0202FD10:
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r2, [r4, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202FD2C: .word _0209AF6C
_0202FD30: .word 0x0000C402
_0202FD34: .word UpdateAreaNameBox
_0202FD38: .word AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAreaNameBox

	arm_func_start SetAreaNameBoxState3
SetAreaNameBoxState3: ; 0x0202FD3C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #3
	str r1, [r0, #0xa0]
	ldmia sp!, {r3, pc}
	arm_func_end SetAreaNameBoxState3

	arm_func_start CloseAreaNameBox
CloseAreaNameBox: ; 0x0202FD50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAreaNameBox

	arm_func_start IsAreaNameBoxActive
IsAreaNameBoxActive: ; 0x0202FD6C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAreaNameBoxActive

	arm_func_start UpdateAreaNameBox
UpdateAreaNameBox: ; 0x0202FD8C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FDA8: ; jump table
	b _0202FDB8 ; case 0
	b _0202FDD0 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FE0C ; case 3
_0202FDB8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FDD0:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1b0]
	ldr r2, [r6, #0x1ac]
	add r3, r6, #0xac
	bl DrawTextInWindow
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FE0C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateAreaNameBox

	arm_func_start CreateControlsChart
CreateControlsChart: ; 0x0202FE2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r5, r1
	mov r0, #0xa8
	mov r1, #8
	mov r4, r2
	mov r6, r3
	bl MemAlloc
	mov ip, r0
	cmp r7, #0
	ldreq r0, _0202FECC ; =CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
	strh r6, [ip, #0xa4]
	add lr, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia lr, {r0, r1, r2, r3}
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FED0 ; =UpdateControlsChart
	str ip, [sp, #0xc]
	strne r0, [sp]
	ldr r0, _0202FED0 ; =UpdateControlsChart
	cmp r4, #0
	stmia ip, {r0, r5}
	beq _0202FEB0
	add lr, ip, #8
	mov r5, #9
_0202FE98:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202FE98
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_0202FEB0:
	mov r2, #0
	add r0, sp, #0
	mov r1, #3
	str r2, [ip, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202FECC: .word CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
_0202FED0: .word UpdateControlsChart
	arm_func_end CreateControlsChart

	arm_func_start CloseControlsChart
CloseControlsChart: ; 0x0202FED4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseControlsChart

	arm_func_start IsControlsChartActive
IsControlsChartActive: ; 0x0202FEF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsControlsChartActive

	arm_func_start UpdateControlsChart
UpdateControlsChart: ; 0x0202FF10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FF2C: ; jump table
	b _0202FF3C ; case 0
	b _0202FF54 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FF90 ; case 3
_0202FF3C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FF54:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldrh r3, [r6, #0xa4]
	mov r1, #4
	mov r2, #2
	bl sub_02026268
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FF90:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateControlsChart

	arm_func_start CreateAlertBox
CreateAlertBox: ; 0x0202FFB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x650
	mov r1, #8
	bl MemAlloc
	mov r1, #0x650
	mov r4, r0
	bl MemZero
	cmp r5, #0
	ldreq r0, _0203003C ; =ALERT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030040 ; =UpdateAlertBox
	str r4, [sp, #0xc]
	strne r0, [sp]
	add r0, sp, #0
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	ldrsb r1, [r4]
	add r0, r4, #8
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	add r0, r4, #0x600
	strh r1, [r0, #0x44]
	strh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsb r0, [r4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203003C: .word ALERT_BOX_DEFAULT_WINDOW_PARAMS
_02030040: .word UpdateAlertBox
	arm_func_end CreateAlertBox

	arm_func_start CloseAlertBox
CloseAlertBox: ; 0x02030044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4]
	bl sub_0202836C
	add r0, r4, #8
	bl sub_0202613C
	mov r0, r5
	bl GetWindowContents
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAlertBox

	arm_func_start sub_0203007C
sub_0203007C: ; 0x0203007C
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x44]
	add r1, r1, #1
	strh r1, [r0, #0x44]
	ldrsh r1, [r0, #0x44]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x44]
	bx lr
	arm_func_end sub_0203007C

	arm_func_start sub_020300A0
sub_020300A0: ; 0x020300A0
	add r0, r0, #0x600
	ldrsh r0, [r0, #0x44]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	movge r0, #0
	bx lr
	arm_func_end sub_020300A0

	arm_func_start sub_020300C0
sub_020300C0: ; 0x020300C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add ip, sp, #0
	str r1, [sp]
	mov r1, ip
	add r0, r5, #0xc
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02020B60
	ldr r1, _02030108 ; =0x0000C402
	mov r2, r4
	add r0, r5, #0xc
	bl sub_02020BC4
	add r0, r5, #0xc
	bl AnalyzeText
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02030108: .word 0x0000C402
	arm_func_end sub_020300C0

	arm_func_start AddMessageToAlertBox
AddMessageToAlertBox: ; 0x0203010C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	beq _02030144
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
_02030144:
	mov r0, r4
	bl sub_020300A0
	add r1, r4, #0x600
	ldrsh r2, [r1, #0x46]
	cmp r2, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r5, [sp]
	ldrsh r1, [r1, #0x44]
	add r0, r4, #0x29
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r0, r1, r0, r2
	mov r2, r6
	mov r3, r7
	mov r1, #0x140
	bl PreprocessString
	add r1, r4, #0x600
	add r0, r4, #0x29
	ldrsh r1, [r1, #0x44]
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r2, r1, r0, r2
	mov r1, r7
	add r0, r4, #8
	bl sub_02026194
	add r1, r4, #0x600
	ldrsh r0, [r1, #0x44]
	mov r2, #0x148
	mov r6, #0
	smlabb r0, r0, r2, r4
	add r0, r0, #0x200
	strh r7, [r0, #0x6a]
	ldrsh r5, [r1, #0x44]
	ldrb r3, [sp, #0x18]
	mov r0, r4
	smlabb r5, r5, r2, r4
	str r6, [r5, #0x124]
	ldrsh r1, [r1, #0x44]
	smlabb r1, r1, r2, r4
	strb r3, [r1, #0x128]
	bl sub_0203007C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end AddMessageToAlertBox

	arm_func_start IsAlertBoxActive
IsAlertBoxActive: ; 0x020301F4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAlertBoxActive

	arm_func_start sub_02030214
sub_02030214: ; 0x02030214
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030260
_02030230: ; jump table
	b _02030260 ; case 0
	b _02030248 ; case 1
	b _02030254 ; case 2
	b _02030254 ; case 3
	ldmia sp!, {r4, pc} ; case 4
	ldmia sp!, {r4, pc} ; case 5
_02030248:
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030254:
	mov r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030260:
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030214

	arm_func_start UpdateAlertBox
UpdateAlertBox: ; 0x02030274
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030290: ; jump table
	b _020302A8 ; case 0
	b _020302C8 ; case 1
	b _020302E0 ; case 2
	b _02030438 ; case 3
	b _0203056C ; case 4
	b _02030588 ; case 5
_020302A8:
	add r0, r4, #8
	bl sub_020261D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_020302C8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020302E0:
	ldrsb r0, [r5, #0x10]
	bl GetWindowContents
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x46]
	ldrsh r0, [r0, #0x44]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsb r4, [r5, #0x10]
	mov r0, r4
	bl GetWindowContents
	mov r6, r0
	add r3, r6, #0x600
	ldr r1, [r6, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r5, [r6, #0x10]
	mov r8, r1, asr #0x10
	mla r1, r2, r8, r5
	ldr r2, [r6, #0xc]
	mov r7, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	ldrsh r3, [r3, #0x46]
	mov r1, #0x148
	add r5, r6, #0x124
	smulbb r3, r3, r1
	ldr r1, [r5, r3]
	add r5, r5, r3
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov r7, r7, asr #0x10
	bne _02030388
	mov r5, #0x17
	mov r0, r4
	add r2, r7, r8
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
	b _020303C4
_02030388:
	mov r2, r7
	add r3, r5, #5
	bl sub_020300C0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _020303C4
	cmp r7, r8
	blt _020303C4
	mov r5, #0x17
	mov r0, r4
	sub r2, r7, #2
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
_020303C4:
	mov r0, r4
	bl UpdateWindow
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsh r1, [r0, #0x46]
	add r1, r1, #1
	strh r1, [r0, #0x46]
	ldrsh r1, [r0, #0x46]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x46]
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x4a]
	cmp r1, #3
	movge r1, #3
	strge r1, [r6, #4]
	movge r1, #0
	strgeh r1, [r0, #0x4c]
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r6, #0xa0]
	ldr r0, [r6, #0x10]
	add r2, r1, r8
	mov r1, r8
	sub r0, r2, r0
	bl _s32_div_f
	add r1, r6, #0x600
	strh r0, [r1, #0x4a]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030438:
	ldrsb r5, [r5, #0x10]
	mov r0, r5
	bl GetWindowContents
	mov r7, r0
	add r3, r7, #0x600
	ldr r1, [r7, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r6, [r7, #0x10]
	mov r8, r1, asr #0x10
	ldr r1, [r7, #0xc]
	mla r6, r2, r8, r6
	ldrsh sb, [r3, #0x4c]
	mov r2, r1, lsl #0x10
	ldrsh ip, [r3, #0x48]
	mov r1, #0x148
	add r3, sb, r6
	mov r3, r3, lsl #0x10
	smulbb r6, ip, r1
	add sb, r7, #0x124
	ldr r1, [sb, r6]
	add r6, sb, r6
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov sb, r3, asr #0x10
	bne _020304C0
	mov r6, #0x17
	mov r0, r5
	add r2, sb, r8
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
	b _020304FC
_020304C0:
	mov r2, sb
	add r3, r6, #5
	bl sub_020300C0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _020304FC
	cmp sb, r8
	blt _020304FC
	mov r6, #0x17
	mov r0, r5
	sub r2, sb, #2
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
_020304FC:
	add r0, r7, #0x600
	ldrsh r0, [r0, #0x4c]
	add r0, r0, r8
	cmp r0, #1
	mov r0, r5
	bne _02030528
	bl sub_01FF9128
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #1
	b _02030538
_02030528:
	bl sub_01FF929C
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #2
_02030538:
	strh r1, [r0, #0x4c]
	add r0, r7, #0x600
	ldrsh r2, [r0, #0x4c]
	rsb r1, r8, #0
	cmp r2, r1
	movle r1, #3
	strleh r1, [r0, #0x4a]
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0203056C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030588:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r1, #0
	add r0, r4, #8
	str r1, [r4, #4]
	bl sub_0202613C
	mvn r0, #5
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end UpdateAlertBox

	arm_func_start CreateAdvancedTextBox
CreateAdvancedTextBox: ; 0x020305B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	add r1, r0, #0x100
	str r4, [r0, #0x1a4]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBox

	arm_func_start CreateAdvancedTextBoxWithArg
CreateAdvancedTextBoxWithArg: ; 0x020305E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	ldr r2, [sp, #0x10]
	str r4, [r0, #0x1a8]
	add r1, r0, #0x100
	str r2, [r0, #0x1ac]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBoxWithArg

	arm_func_start CreateAdvancedTextBoxInternal
CreateAdvancedTextBoxInternal: ; 0x0203061C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r8, r0
	mov r7, r1
	mov r0, #0x1c8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x1a4]
	str r0, [r4, #0x1a8]
	str r0, [r4, #0x1ac]
	str r0, [r4, #0x1b8]
	mov r0, #1
	cmp r8, #0
	strb r0, [r4, #0x1c4]
	addne ip, sp, #0x18
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030774 ; =UpdateAdvancedTextBox
	strne r0, [sp, #0x18]
	bne _02030690
	ldr r0, _02030778 ; =ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x18
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r7, r7, #0x300000
_02030690:
	tst r7, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	str r4, [sp, #0x24]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst r7, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02030774 ; =UpdateAdvancedTextBox
	cmp r6, #0
	str r0, [r4]
	str r7, [r4, #0x104]
	beq _020306F0
	add ip, r4, #0x108
	mov r8, #9
_020306D8:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _020306D8
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_020306F0:
	mov r2, #0
	str r2, [r4, #0x1bc]
	strb r2, [r4, #0x1c0]
	strb r2, [r4, #0x1c1]
	strb r2, [r4, #0x1c2]
	str r2, [r4, #0x1b0]
	str r2, [r4, #0x1b4]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r4, #0x1c3]
	bl NewWindowScreenCheck
	add r1, sp, #8
	strb r0, [r4, #0x1a0]
	bl GetWindowRectangle
	mov r1, #0x100
	strh r1, [r4, #0xfc]
	tst r7, #0x8000
	moveq r5, #0
	streq r5, [sp, #0x40]
	strh r1, [r4, #0xfe]
	add r0, r4, #0x100
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #0x40]
	add r3, sp, #8
	mov r1, r7
	add r0, r4, #4
	add r2, r4, #0x108
	stmia sp, {r5, r6}
	bl InitWindowInput
	mov r0, r4
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02030774: .word UpdateAdvancedTextBox
_02030778: .word ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAdvancedTextBoxInternal

	arm_func_start SetAdvancedTextBoxPartialMenu
SetAdvancedTextBoxPartialMenu: ; 0x0203077C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c3]
	ldr r1, [r0, #0x104]
	tst r4, #0xff
	orrne r1, r1, #0x400000
	biceq r1, r1, #0x400000
	str r1, [r0, #0x104]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxPartialMenu

	arm_func_start SetAdvancedTextBoxField0x1C4
SetAdvancedTextBoxField0x1C4: ; 0x020307A4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c4]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxField0x1C4

	arm_func_start sub_020307B8
sub_020307B8: ; 0x020307B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1bc]
	mov r1, #0
	strb r1, [r0, #0x1c0]
	strb r1, [r0, #0x1c1]
	ldr r1, [r0, #0x104]
	bic r1, r1, #0x800000
	str r1, [r0, #0x104]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_020307B8

	arm_func_start sub_020307EC
sub_020307EC: ; 0x020307EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #7
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _02030828
	mov r0, r5
	bl sub_020307B8
	ldmia sp!, {r3, r4, r5, pc}
_02030828:
	ldr r0, [r4, #0x1bc]
	cmp r0, #6
	moveq r0, #0
	streq r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020307EC

	arm_func_start SetAdvancedTextBoxField0x1C2
SetAdvancedTextBoxField0x1C2: ; 0x0203083C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1c2]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxField0x1C2

	arm_func_start CloseAdvancedTextBox2
CloseAdvancedTextBox2: ; 0x02030850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0202836C
	mov r0, r5
	bl sub_020288DC
	mov r0, r5
	bl sub_0202812C
	mov r0, r5
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox2

	arm_func_start SetAdvancedTextBoxState5
SetAdvancedTextBoxState5: ; 0x0203088C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #5
	str r1, [r0, #0x1bc]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxState5

	arm_func_start CloseAdvancedTextBox
CloseAdvancedTextBox: ; 0x020308A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox

	arm_func_start IsAdvancedTextBoxActive
IsAdvancedTextBoxActive: ; 0x020308C4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedTextBoxActive

#ifndef JAPAN
	arm_func_start sub_020308E4
sub_020308E4: ; 0x020308E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	ldrneb r0, [r0, #0x1c1]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020308E4
#endif

	arm_func_start sub_02030908
sub_02030908: ; 0x02030908
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030938
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedItemOnPage
	ldmia sp!, {r3, pc}
_02030938:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030908

	arm_func_start sub_02030940
sub_02030940: ; 0x02030940
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030970
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
_02030970:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030940

	arm_func_start sub_02030978
sub_02030978: ; 0x02030978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetWindowContents
	mov r1, r0
	strh r5, [r1, #0xfc]
	strh r4, [r1, #0xfe]
	mov r0, r7
	mov r2, r6
	mov r3, r5
	add r1, r1, #4
	str r4, [sp]
	bl sub_020289B8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02030978

	arm_func_start sub_020309B8
sub_020309B8: ; 0x020309B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r1, r0
	strh r6, [r1, #0xfc]
	ldr r4, [sp, #0x28]
	strh r5, [r1, #0xfe]
	add ip, r1, #0x100
	ldr lr, [sp, #0x2c]
	strh r4, [ip]
	strh lr, [ip, #2]
	str r5, [sp]
	mov r0, r8
	add r1, r1, #4
	mov r2, r7
	mov r3, r6
	stmib sp, {r4, lr}
	bl sub_02028A08
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020309B8

	arm_func_start GetWindowIdPageStart
GetWindowIdPageStart: ; 0x02030A18
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetPageStart
	ldmia sp!, {r3, pc}
	arm_func_end GetWindowIdPageStart

	arm_func_start sub_02030A2C
sub_02030A2C: ; 0x02030A2C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strh r4, [r0, #0x20]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A2C

	arm_func_start GetAdvancedTextBoxFlags2
GetAdvancedTextBoxFlags2: ; 0x02030A40
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1b0]
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedTextBoxFlags2

	arm_func_start sub_02030A50
sub_02030A50: ; 0x02030A50
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0xc0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A50

	arm_func_start sub_02030A64
sub_02030A64: ; 0x02030A64
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030A64

	arm_func_start sub_02030A74
sub_02030A74: ; 0x02030A74
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02031C74
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A74

	arm_func_start sub_02030A90
sub_02030A90: ; 0x02030A90
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02031C84
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A90

	arm_func_start sub_02030AAC
sub_02030AAC: ; 0x02030AAC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xf8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030AAC

	arm_func_start SetUnkAdvancedTextBoxFn
SetUnkAdvancedTextBoxFn: ; 0x02030AC0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1b4]
	ldmia sp!, {r4, pc}
	arm_func_end SetUnkAdvancedTextBoxFn

	arm_func_start SetUnkAdvancedTextBoxWindowFn
SetUnkAdvancedTextBoxWindowFn: ; 0x02030AD4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1b8]
	ldmia sp!, {r4, pc}
	arm_func_end SetUnkAdvancedTextBoxWindowFn

	arm_func_start UpdateAdvancedTextBox
UpdateAdvancedTextBox: ; 0x02030AE8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r7, r0
	ldr r4, [r7, #0xc]
	mov r5, #0
	str r5, [r4, #0x1b0]
	ldr r0, [r4, #0x1bc]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030E88
_02030B10: ; jump table
	b _02030B28 ; case 0
	b _02030B40 ; case 1
	b _02030B48 ; case 2
	b _02030BA0 ; case 3
	b _02030E0C ; case 4
	b _02030E5C ; case 5
_02030B28:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _02030E88
	mov r0, #2
	str r0, [r4, #0x1bc]
_02030B40:
	mov r0, #2
	str r0, [r4, #0x1bc]
_02030B48:
	mov r0, r7
	bl sub_02030E94
	ldr r0, [r4, #0x104]
	tst r0, #0x800000
	beq _02030B80
	mov r0, #7
	str r0, [r4, #0x1bc]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _02030E88
_02030B80:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1bc]
	strb r0, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _02030E88
_02030BA0:
	ldr r2, [r4, #0x1b4]
	ldrb r6, [r4, #0x1c2]
	cmp r2, #0
	beq _02030BF0
	add r0, sp, #0x1c
	add r1, sp, #0x18
	blx r2
	ldrsb r0, [r7, #0x10]
	bl sub_02028324
	cmp r0, #0
	moveq r3, #1
	movne r3, r5
	ldr ip, [sp, #0x1c]
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	and r3, r3, #0xff
	str ip, [sp]
	bl sub_02031E80
	b _02030C18
_02030BF0:
	ldrsb r0, [r7, #0x10]
	bl sub_02028324
	cmp r0, #0
	moveq r3, #1
	movne r3, r5
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	and r3, r3, #0xff
	bl sub_02031C98
_02030C18:
	orr r6, r6, r0
	mov r0, #0
	strb r0, [r4, #0x1c2]
	ldr r2, [r4, #0x1b4]
	cmp r2, #0
	beq _02030CAC
	add r0, sp, #0x14
	add r1, sp, #0x10
	blx r2
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	bne _02030CAC
	ldr r0, [r4, #0x104]
	tst r0, #1
	beq _02030CAC
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _02030E90 ; =0x00000408
	str r0, [sp, #8]
	ldr ip, [sp, #0x10]
	add r1, sp, #0x20
	add r0, r4, #4
	str ip, [sp, #0xc]
	bl sub_020322B0
	movs r1, r0
	bmi _02030CAC
	ldr r2, [sp, #0x14]
	add r0, r4, #4
	bl sub_020326F8
	ldr r0, [r4, #0x1b0]
	mov r6, #1
	orr r0, r0, #1
	mov r5, r6
	str r0, [r4, #0x1b0]
_02030CAC:
	ldrb r0, [r4, #0xf8]
	cmp r0, #0
	bne _02030CC4
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	bne _02030CD8
_02030CC4:
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	bl sub_02033758
	orr r6, r6, r0
_02030CD8:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [r4, #0x1b0]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r6, r0
	beq _02030D04
	mov r0, r7
	bl sub_02030E94
_02030D04:
	ldr r0, [r4, #0x1b0]
	tst r0, #1
	beq _02030D74
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _02030DB0
	ldr r0, [r4, #0x104]
	tst r0, #0x80000000
	bne _02030D38
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_02030D38:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1bc]
	ldr r2, [r4, #0x1b8]
	cmp r2, #0
	beq _02030DB0
	ldrsb r0, [r7, #0x10]
	mov r1, r5
	blx r2
	b _02030DB0
_02030D74:
	tst r0, #2
	beq _02030DB0
	ldrb r0, [r4, #0x1c4]
	cmp r0, #0
	beq _02030D94
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
_02030D94:
	mov r0, #1
	strb r0, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1bc]
_02030DB0:
	ldrsh r0, [r4, #0xfe]
	cmp r0, #0x100
	str r0, [sp]
	bne _02030DD8
	ldrsb r0, [r7, #0x10]
	ldrsh r3, [r4, #0xfc]
	ldr r2, [r7, #0xbc]
	add r1, r4, #4
	bl sub_020289B8
	b _02030E00
_02030DD8:
	add r0, r4, #0x100
	ldrsh r2, [r0]
	add r1, r4, #4
	str r2, [sp, #4]
	ldrsh r0, [r0, #2]
	str r0, [sp, #8]
	ldrsb r0, [r7, #0x10]
	ldrsh r3, [r4, #0xfc]
	ldr r2, [r7, #0xbc]
	bl sub_02028A08
_02030E00:
	ldr r0, [r4, #0x1bc]
	cmp r0, #4
	bne _02030E88
_02030E0C:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _02030E88
	ldrb r0, [r4, #0x1c1]
	cmp r0, #0
	beq _02030E34
	ldrb r0, [r4, #0x1c3]
	cmp r0, #0
	beq _02030E54
_02030E34:
	ldr r0, [r4, #0x104]
	tst r0, #0x400000
	beq _02030E54
	mov r0, r7
	bl sub_02030E94
	mov r0, #7
	str r0, [r4, #0x1bc]
	b _02030E88
_02030E54:
	mov r0, #5
	str r0, [r4, #0x1bc]
_02030E5C:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _02030E88
	ldrb r0, [r4, #0x1c1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1bc]
_02030E88:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02030E90: .word 0x00000408
	arm_func_end UpdateAdvancedTextBox

	arm_func_start sub_02030E94
sub_02030E94: ; 0x02030E94
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrsb r0, [r5, #0x10]
	ldr r4, [r5, #0xc]
	bl sub_02027B1C
	ldr r2, [r4, #0x1a8]
	cmp r2, #0
	beq _02030EC4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x1ac]
	blx r2
	b _02030ED8
_02030EC4:
	ldr r1, [r4, #0x1a4]
	cmp r1, #0
	beq _02030ED8
	ldrsb r0, [r5, #0x10]
	blx r1
_02030ED8:
	ldrsb r1, [r5, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02030E94

	arm_func_start sub_02030EF0
sub_02030EF0: ; 0x02030EF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1c0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1c1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02030EF0

	arm_func_start PlayAdvancedTextBoxInputSound
PlayAdvancedTextBoxInputSound: ; 0x02030F28
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl PlayWindowInputSound
	ldmia sp!, {r4, pc}
	arm_func_end PlayAdvancedTextBoxInputSound

	arm_func_start CreateTeamSelectionMenu
CreateTeamSelectionMenu: ; 0x02030F44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r5, r0
	cmp r6, #0
	ldreq r0, _02031114 ; =TEAM_SELECTION_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _02031118 ; =UpdateTeamSelectionMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	orreq sl, sl, #0x300000
	str r5, [sp, #0x24]
	cmp r0, #0
	bne _02031000
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x28
	b _02030FE0
_02030FBC:
	mov r0, r4
	mov r1, r6
	blx r8
	cmp r0, #0
	beq _02030FDC
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_02030FDC:
	add r6, r6, #1
_02030FE0:
	ldr r0, [sp, #0x448]
	cmp r6, r0
	blt _02030FBC
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1e]
_02031000:
	ldrb r0, [sp, #0x1f]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x48
	bne _02031030
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1f]
	b _02031040
_02031030:
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_02031040:
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
	ldr r0, _02031118 ; =UpdateTeamSelectionMenu
	cmp sb, #0
	str r0, [r5]
	str sl, [r5, #0xfc]
	beq _0203109C
	add r6, r5, #0x100
	mov r4, #9
_02031084:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02031084
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0203109C:
	mov r2, #0
	str r2, [r5, #0x18c]
	str r2, [r5, #0x190]
	str r8, [r5, #0x198]
	str r2, [r5, #0x19c]
	strb r2, [r5, #0x1a0]
	strb r2, [r5, #0x1a1]
	str r2, [r5, #0x1a4]
	str r2, [r5, #0x1a8]
	str r2, [r5, #0x1ac]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r5, #0x1b0]
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
_02031114: .word TEAM_SELECTION_MENU_DEFAULT_WINDOW_PARAMS
_02031118: .word UpdateTeamSelectionMenu
	arm_func_end CreateTeamSelectionMenu

	arm_func_start sub_0203111C
sub_0203111C: ; 0x0203111C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	str r0, [r4, #0x19c]
	mov r0, #0
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x800000
	str r0, [r4, #0xfc]
	bl sub_0203C984
	add r0, r4, #4
	bl sub_02032984
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203111C

	arm_func_start sub_0203115C
sub_0203115C: ; 0x0203115C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x19c]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x19c]
	bl sub_0203C984
	ldmia sp!, {r3, pc}
	arm_func_end sub_0203115C

	arm_func_start sub_0203117C
sub_0203117C: ; 0x0203117C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_0203271C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203117C

	arm_func_start CloseTeamSelectionMenu
CloseTeamSelectionMenu: ; 0x02031198
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTeamSelectionMenu

	arm_func_start IsTeamSelectionMenuActive
IsTeamSelectionMenuActive: ; 0x020311B4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamSelectionMenuActive

	arm_func_start sub_020311D4
sub_020311D4: ; 0x020311D4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
	arm_func_end sub_020311D4

	arm_func_start sub_020311E8
sub_020311E8: ; 0x020311E8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	beq _02031218
	ldrb r1, [r0, #0x1a1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
_02031218:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020311E8

	arm_func_start sub_02031220
sub_02031220: ; 0x02031220
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_02031220

	arm_func_start UpdateTeamSelectionMenu
UpdateTeamSelectionMenu: ; 0x0203123C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldrsb r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	bl sub_02028354
	cmp r0, #3
	moveq r1, #1
	movne r1, #0
	ldr r0, [r4, #0x19c]
	and r5, r1, #0xff
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02031714
_02031274: ; jump table
	b _0203129C ; case 0
	b _020312B4 ; case 1
	b _020312F0 ; case 2
	b _02031350 ; case 3
	b _020316A4 ; case 4
	b _020316E8 ; case 5
	b _02031714 ; case 6
	b _02031714 ; case 7
	b _020315D4 ; case 8
	b _0203163C ; case 9
_0203129C:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _02031714
	mov r0, #2
	str r0, [r4, #0x19c]
_020312B4:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _020312F0
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _020312D4
	mov r0, r7
	bl sub_0203175C
_020312D4:
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _02031714
_020312F0:
	mov r0, r7
	bl sub_0203175C
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0203132C
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _02031714
_0203132C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _02031714
_02031350:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r6, r0
	cmp r1, #0
	bne _020313DC
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _020313DC
	mov r3, #0
	ldr r2, _02031758 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _020313C4
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r6, #1
	orr r0, r0, #1
	str r0, [sp, #8]
	b _020313F0
_020313C4:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r6, r6, r0
	b _020313F0
_020313DC:
	cmp r1, #4
	cmpne r1, #8
	cmpne r1, #0xc
	beq _020313F0
	bl sub_0203C984
_020313F0:
	cmp r6, #0
	beq _02031400
	mov r0, r7
	bl sub_0203175C
_02031400:
	add r0, r4, #4
	bl GetSelectedMenuItemIdx
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0203148C
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0203147C
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _02031450
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_02031450:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _020315C4
_0203147C:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _020315C4
_0203148C:
	tst r1, #2
	beq _020314C8
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _020315C4
_020314C8:
	tst r1, #0x1000
	beq _02031518
	ldr r0, [r4, #0xfc]
	tst r0, #0x2000
	beq _02031518
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r2, #1
	mov r0, #0
	strb r2, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	strb r2, [r4, #0x1b1]
	str r0, [r7, #0xb8]
	mov r0, #8
	str r0, [r4, #0x19c]
	b _020315C4
_02031518:
	tst r1, #0x2000
	beq _02031568
	ldr r0, [r4, #0xfc]
	tst r0, #0x4000
	beq _02031568
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r2, #1
	mov r0, #0
	strb r2, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	strb r2, [r4, #0x1b1]
	str r0, [r7, #0xb8]
	mov r0, #9
	str r0, [r4, #0x19c]
	b _020315C4
_02031568:
	tst r1, #0x200
	ldrne r0, [r4, #0x18c]
	cmpne r0, #0
	add r0, r4, #4
	beq _02031590
	mov r1, #5
	bl PlayWindowInputSound
	ldr r0, [r4, #0x18c]
	blx r0
	b _020315C4
_02031590:
	bl sub_0203250C
	cmp r0, #0
	beq _020315C4
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
_020315C4:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _02031714
_020315D4:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	beq _020315F0
	mov r0, r7
	bl sub_0203175C
	b _02031714
_020315F0:
	ldrb r0, [r4, #0x1b1]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x1b1]
	movne r0, #1
	strneb r0, [r4, #0x1b0]
	ldr r3, [r4, #0x174]
	cmp r3, #0
	beq _02031714
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _02031714
	mov r0, r7
	bl sub_0203175C
	b _02031714
_0203163C:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	beq _02031658
	mov r0, r7
	bl sub_0203175C
	b _02031714
_02031658:
	ldrb r0, [r4, #0x1b1]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x1b1]
	movne r0, #1
	strneb r0, [r4, #0x1b0]
	ldr r3, [r4, #0x17c]
	cmp r3, #0
	beq _02031714
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _02031714
	mov r0, r7
	bl sub_0203175C
	b _02031714
_020316A4:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _02031714
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _020316E0
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _020316E0
	mov r0, r7
	bl sub_0203175C
	mov r0, #7
	str r0, [r4, #0x19c]
	b _02031714
_020316E0:
	mov r0, #5
	str r0, [r4, #0x19c]
_020316E8:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _02031714
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x19c]
_02031714:
	mov r0, #0
	strb r0, [r4, #0x1b0]
	cmp r5, #0
	beq _02031740
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _02031740
	mov r0, r7
	bl sub_0203175C
	mov r0, #1
	strb r0, [r4, #0x1b0]
_02031740:
	ldr r0, [r4, #0x190]
	cmp r0, #0
	beq _02031750
	blx r0
_02031750:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02031758: .word 0x00000408
	arm_func_end UpdateTeamSelectionMenu

	arm_func_start sub_0203175C
sub_0203175C: ; 0x0203175C
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
	ble _02031868
	mov fp, #0x42
	b _02031860
_020317B8:
	ldr r2, [r4, #0x198]
	add r0, sp, #0xc
	mov r1, r5
	blx r2
	mov r8, r0
	mov r1, #0
	cmp sb, #0
	beq _020317E8
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
_020317E8:
	cmp r8, #0
	beq _02031858
	cmp r1, #0
	mov r1, r7
	add r0, r4, #4
	beq _02031830
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
	b _02031858
_02031830:
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
_02031858:
	add r7, r7, #1
	add r5, r5, #1
_02031860:
	cmp r7, r6
	blt _020317B8
_02031868:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0203175C

	arm_func_start sub_02031888
sub_02031888: ; 0x02031888
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x18c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02031888

	arm_func_start sub_0203189C
sub_0203189C: ; 0x0203189C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x190]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203189C

	arm_func_start IsTeamSelectionMenuState3
IsTeamSelectionMenuState3: ; 0x020318B0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamSelectionMenuState3

	arm_func_start sub_020318D0
sub_020318D0: ; 0x020318D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1a0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1a1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020318D0

	arm_func_start sub_02031908
sub_02031908: ; 0x02031908
	ldr ip, _02031910 ; =KeyWaitInit
	bx ip
	.align 2, 0
_02031910: .word KeyWaitInit
	arm_func_end sub_02031908

	arm_func_start sub_02031914
sub_02031914: ; 0x02031914
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, #0
	mov r6, r1
	mov r4, r0
	add r1, sp, #4
	mov r0, r5
	bl GetHeldButtons
	add r1, sp, #2
	mov r0, r5
	bl GetPressedButtons
	ldrh r1, [sp, #2]
	tst r1, #1
	orrne r5, r5, #1
	tst r1, #2
	orrne r5, r5, #2
	tst r1, #0x800
	orrne r5, r5, #0x1000
	tst r1, #0x400
	orrne r5, r5, #0x2000
	tst r1, #0x200
	beq _0203197C
	ldrh r0, [sp, #4]
	tst r0, #0x100
	orrne r5, r5, #0x800
	orr r5, r5, #0x400
_0203197C:
	tst r1, #8
	orrne r5, r5, #0x100
	tst r1, #4
	orrne r5, r5, #0x200
	cmp r5, #0
	mov r0, #0
	beq _020319A0
	bl sub_020063A0
	b _020319F8
_020319A0:
	add r1, sp, #0
	bl sub_020063F4
	tst r6, #8
	beq _020319D4
	ldrh r0, [sp, #4]
	tst r0, #0x100
	beq _020319D4
	ldrh r0, [sp]
	tst r0, #0x40
	orrne r5, r5, #0x4000
	tst r0, #0x80
	orrne r5, r5, #0x8000
	b _020319E8
_020319D4:
	ldrh r0, [sp]
	tst r0, #0x40
	orrne r5, r5, #0x10
	tst r0, #0x80
	orrne r5, r5, #0x20
_020319E8:
	tst r0, #0x20
	orrne r5, r5, #0x40
	tst r0, #0x10
	orrne r5, r5, #0x80
_020319F8:
	ldrh r0, [sp, #4]
	tst r0, #0x200
	orrne r5, r5, #4
	tst r0, #0x100
	orrne r5, r5, #8
	cmp r4, #0
	beq _02031A30
	bl IsTouchScreenNotOff
	cmp r0, #0
	mov r0, r4
	beq _02031A2C
	bl GetReleasedStylus
	b _02031A30
_02031A2C:
	bl sub_02006BFC
_02031A30:
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02031914

	arm_func_start sub_02031A3C
sub_02031A3C: ; 0x02031A3C
	stmdb sp!, {r3, lr}
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02031A3C

	arm_func_start sub_02031A5C
sub_02031A5C: ; 0x02031A5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02031A5C

	arm_func_start CalcMenuHeightDiv8__02031AA4
CalcMenuHeightDiv8__02031AA4: ; 0x02031AA4
	tst r0, #0x40000
	bne _02031ABC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_02031ABC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__02031AA4

	arm_func_start InitWindowInput
InitWindowInput: ; 0x02031AF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02031B28:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02031B28
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	str r1, [r7, #0xd0]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02031B90
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02031B98
_02031B90:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02031B98:
	mov r0, r7
	bl sub_02032754
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02031C2C
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02031C20
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02031C20:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02031C34
_02031C2C:
	mov r0, r7
	bl sub_02032894
_02031C34:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02031C4C
	ldr r1, [r6]
	mov r0, r7
	bl sub_02032684
_02031C4C:
	bl sub_02031908
	mov r1, #0
	strb r1, [r7, #0xf4]
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_02032984
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitWindowInput

	arm_func_start sub_02031C74
sub_02031C74: ; 0x02031C74
	ldr r2, [r0, #0x10]
	orr r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02031C74

	arm_func_start sub_02031C84
sub_02031C84: ; 0x02031C84
	ldr r2, [r0, #0x10]
	mvn r1, r1
	and r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02031C84

	arm_func_start sub_02031C98
sub_02031C98: ; 0x02031C98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #0
	ldr r4, [r8, #0xc8]
	ldr r5, [r8, #0xbc]
	add r0, sp, #0
	beq _02031DD4
	ldr r1, [r8, #0x10]
	bl sub_02031914
	ldr r1, [r8, #0x10]
	mov sb, r0
	tst r1, #0x8000
	beq _02031D18
	tst r1, #0x20000
	beq _02031D18
	tst r1, #0x2000000
	bne _02031D18
	tst sb, #8
	beq _02031D18
	tst sb, #0x10
	beq _02031D04
	mov r0, r8
	bl sub_0203280C
	b _02031D44
_02031D04:
	tst sb, #0x20
	beq _02031D44
	mov r0, r8
	bl sub_020327E4
	b _02031D44
_02031D18:
	tst r1, #0x1000000
	bne _02031D44
	tst sb, #0x10
	beq _02031D34
	mov r0, r8
	bl sub_0203261C
	b _02031D44
_02031D34:
	tst sb, #0x20
	beq _02031D44
	mov r0, r8
	bl sub_020325AC
_02031D44:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02031DBC
	tst r0, #0x20000
	bne _02031DBC
	tst r0, #0x2000000
	bne _02031DBC
	tst r0, #0x10000
	beq _02031D98
	tst sb, #8
	beq _02031D98
	tst sb, #0x40
	beq _02031D84
	mov r0, r8
	bl sub_02032864
	b _02031DBC
_02031D84:
	tst sb, #0x80
	beq _02031DBC
	mov r0, r8
	bl sub_0203282C
	b _02031DBC
_02031D98:
	tst sb, #0x40
	beq _02031DAC
	mov r0, r8
	bl sub_0203280C
	b _02031DBC
_02031DAC:
	tst sb, #0x80
	beq _02031DBC
	mov r0, r8
	bl sub_020327E4
_02031DBC:
	ldr r0, [r8, #0x10]
	tst r0, #1
	biceq sb, sb, #1
	tst r0, #2
	biceq sb, sb, #2
	b _02031DDC
_02031DD4:
	mov sb, #0
	bl sub_02006BFC
_02031DDC:
	cmp r7, #0
	strne sb, [r7]
	cmp r6, #0
	beq _02031E0C
	add ip, sp, #0
	mov r7, #2
_02031DF4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _02031DF4
	ldr r0, [ip]
	str r0, [r6]
_02031E0C:
	ldr r0, [r8, #0xc8]
	cmp r4, r0
	beq _02031E2C
	mov r0, r8
	mov r1, #4
	bl PlayWindowInputSound
	mov r0, #1
	b _02031E78
_02031E2C:
	ldr r0, [r8, #0xbc]
	cmp r5, r0
	beq _02031E44
	mov r0, r8
	mov r1, #3
	bl PlayWindowInputSound
_02031E44:
	ldr r0, [r8, #0xd8]
	cmp r0, #0
	ble _02031E74
	subs r0, r0, #1
	str r0, [r8, #0xd8]
	bne _02031E74
	mvn r0, #0
	str r0, [r8, #0xdc]
	mov r0, #0
	str r0, [r8, #0xe0]
	mov r0, #1
	b _02031E78
_02031E74:
	mov r0, #0
_02031E78:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02031C98

	arm_func_start sub_02031E80
sub_02031E80: ; 0x02031E80
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #0
	ldr r4, [r8, #0xc8]
	ldr r5, [r8, #0xbc]
	add r0, sp, #0
	beq _02031FC4
	ldr r1, [r8, #0x10]
	bl sub_02031914
	ldr r1, [r8, #0x10]
	mov sb, r0
	tst r1, #0x8000
	beq _02031F00
	tst r1, #0x20000
	beq _02031F00
	tst r1, #0x2000000
	bne _02031F00
	tst sb, #8
	beq _02031F00
	tst sb, #0x10
	beq _02031EEC
	mov r0, r8
	bl sub_0203280C
	b _02031F34
_02031EEC:
	tst sb, #0x20
	beq _02031F34
	mov r0, r8
	bl sub_020327E4
	b _02031F34
_02031F00:
	tst r1, #0x1000000
	bne _02031F34
	tst sb, #0x10
	beq _02031F20
	ldr r1, [sp, #0x40]
	mov r0, r8
	bl sub_02032654
	b _02031F34
_02031F20:
	tst sb, #0x20
	beq _02031F34
	ldr r1, [sp, #0x40]
	mov r0, r8
	bl sub_020325E8
_02031F34:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02031FAC
	tst r0, #0x20000
	bne _02031FAC
	tst r0, #0x2000000
	bne _02031FAC
	tst r0, #0x10000
	beq _02031F88
	tst sb, #8
	beq _02031F88
	tst sb, #0x40
	beq _02031F74
	mov r0, r8
	bl sub_02032864
	b _02031FAC
_02031F74:
	tst sb, #0x80
	beq _02031FAC
	mov r0, r8
	bl sub_0203282C
	b _02031FAC
_02031F88:
	tst sb, #0x40
	beq _02031F9C
	mov r0, r8
	bl sub_0203280C
	b _02031FAC
_02031F9C:
	tst sb, #0x80
	beq _02031FAC
	mov r0, r8
	bl sub_020327E4
_02031FAC:
	ldr r0, [r8, #0x10]
	tst r0, #1
	biceq sb, sb, #1
	tst r0, #2
	biceq sb, sb, #2
	b _02031FCC
_02031FC4:
	mov sb, #0
	bl sub_02006BFC
_02031FCC:
	cmp r7, #0
	strne sb, [r7]
	cmp r6, #0
	beq _02031FFC
	add ip, sp, #0
	mov r7, #2
_02031FE4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _02031FE4
	ldr r0, [ip]
	str r0, [r6]
_02031FFC:
	ldr r0, [r8, #0xc8]
	cmp r4, r0
	beq _0203201C
	mov r0, r8
	mov r1, #4
	bl PlayWindowInputSound
	mov r0, #1
	b _02032068
_0203201C:
	ldr r0, [r8, #0xbc]
	cmp r5, r0
	beq _02032034
	mov r0, r8
	mov r1, #3
	bl PlayWindowInputSound
_02032034:
	ldr r0, [r8, #0xd8]
	cmp r0, #0
	ble _02032064
	subs r0, r0, #1
	str r0, [r8, #0xd8]
	bne _02032064
	mvn r0, #0
	str r0, [r8, #0xdc]
	mov r0, #0
	str r0, [r8, #0xe0]
	mov r0, #1
	b _02032068
_02032064:
	mov r0, #0
_02032068:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02031E80

	arm_func_start sub_02032070
sub_02032070: ; 0x02032070
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _020320A0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _020320A0
	mov r0, #1
	bx lr
_020320A0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032070

	arm_func_start sub_020320A8
sub_020320A8: ; 0x020320A8
	mov r2, #6
	str r2, [r0, #0xd8]
	str r1, [r0, #0xdc]
	mov r1, #0
	str r1, [r0, #0xe0]
	bx lr
	arm_func_end sub_020320A8

	arm_func_start sub_020320C0
sub_020320C0: ; 0x020320C0
	ldr r0, [r0, #0xdc]
	bx lr
	arm_func_end sub_020320C0

	arm_func_start sub_020320C8
sub_020320C8: ; 0x020320C8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_020320C8

	arm_func_start sub_020320EC
sub_020320EC: ; 0x020320EC
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r3, r2, #7
	str r3, [r0, #0xdc]
	mov r2, #0
	str r2, [r0, #0xe0]
	cmp r1, #0
	streq r3, [r0, #0xe8]
	streq r3, [r0, #0xe4]
	streq r3, [r0, #0xf0]
	streq r3, [r0, #0xec]
	bxeq lr
	ldr r3, [r1, #8]
	ldr r2, [r0, #8]
	sub r2, r3, r2
	str r2, [r0, #0xec]
	ldr r3, [r1, #0xc]
	ldr r2, [r0, #8]
	sub r2, r3, r2
	str r2, [r0, #0xf0]
	ldr r3, [r1]
	ldr r2, [r0]
	sub r2, r3, r2
	str r2, [r0, #0xe4]
	ldr r2, [r1, #4]
	ldr r1, [r0]
	sub r1, r2, r1
	str r1, [r0, #0xe8]
	bx lr
	arm_func_end sub_020320EC

	arm_func_start sub_02032160
sub_02032160: ; 0x02032160
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _020322A4
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _0203229C
_020321BC:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032298
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032288
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032288:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _020322A8
_02032298:
	add r6, r6, #1
_0203229C:
	cmp r6, r5
	blt _020321BC
_020322A4:
	mvn r0, #0
_020322A8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032160

	arm_func_start sub_020322B0
sub_020322B0: ; 0x020322B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov sb, r1
	ldrh r1, [sb]
	mov r8, r2
	mov sl, r0
	tst r1, r8
	ldr r7, [sp, #0x38]
	beq _020323EC
	cmp r3, #0
	ldrge r0, [sl, #8]
	ldr r1, [sp, #0x30]
	ldrlt r0, [sl, #0xc]
	cmp r1, #0
	add r0, r0, r3
	str r0, [sp, #8]
	ldrgt r0, [sl, #8]
	mov r5, #0
	ldrle r0, [sl, #0xc]
	add r4, sp, #0
	add r1, r0, r1
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0xc]
	mov r6, r0, lsl #8
	b _020323E4
_02032314:
	mul r3, r5, r6
	add r0, r5, #1
	mul r2, r0, r6
	mov r0, r3, asr #7
	mov r1, r2, asr #7
	ldr ip, [sl, #0xb4]
	add r0, r3, r0, lsr #24
	ldr r3, [sl]
	add r0, ip, r0, asr #8
	add r0, r3, r0
	str r0, [sp]
	ldr r3, [sl, #0xb4]
	add r0, r2, r1, lsr #24
	ldr r1, [sl]
	add r0, r3, r0, asr #8
	add r0, r1, r0
	sub r3, r0, #2
	mov r0, sb
	mov r1, r8
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _020323E0
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _020323D8
	mov r0, #6
	str r0, [sl, #0xd8]
	sub r0, r0, #7
	str r0, [sl, #0xdc]
	mov r0, #0
	str r0, [sl, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sl, #8]
	sub r0, r1, r0
	str r0, [sl, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #8]
	sub r0, r1, r0
	str r0, [sl, #0xf0]
	ldr r1, [sp]
	ldr r0, [sl]
	sub r0, r1, r0
	str r0, [sl, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sl]
	sub r0, r1, r0
	str r0, [sl, #0xe8]
_020323D8:
	mov r0, r5
	b _020323F0
_020323E0:
	add r5, r5, #1
_020323E4:
	cmp r5, r7
	blt _02032314
_020323EC:
	mvn r0, #0
_020323F0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020322B0

	arm_func_start sub_020323F8
sub_020323F8: ; 0x020323F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032440
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032440
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032440:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020323F8

	arm_func_start IsMenuOptionActive
IsMenuOptionActive: ; 0x02032474
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _020324BC
	tst r1, #0x8000000
	bne _020324BC
	tst r1, #0x200
	beq _020324B4
	bl GetSelectedMenuItemIdx
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _020324BC
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324B4:
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324BC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsMenuOptionActive

	arm_func_start sub_020324C4
sub_020324C4: ; 0x020324C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _02032504
	tst r1, #0x200
	beq _020324FC
	bl GetSelectedMenuItemIdx
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _02032504
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324FC:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02032504:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020324C4

	arm_func_start sub_0203250C
sub_0203250C: ; 0x0203250C
	ldr r3, [r0, #0x10]
	tst r3, #0x2000
	beq _02032530
	tst r1, #0x1000
	beq _02032530
	ldr r2, [r0, #0x88]
	cmp r2, #0
	moveq r0, #1
	bxeq lr
_02032530:
	tst r3, #0x4000
	beq _02032550
	tst r1, #0x2000
	beq _02032550
	ldr r0, [r0, #0x90]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
_02032550:
	mov r0, #0
	bx lr
	arm_func_end sub_0203250C

	arm_func_start GetSelectedItemOnPage
GetSelectedItemOnPage: ; 0x02032558
	ldr r0, [r0, #0xbc]
	bx lr
	arm_func_end GetSelectedItemOnPage

	arm_func_start GetCurrentPage
GetCurrentPage: ; 0x02032560
	ldr r0, [r0, #0xc8]
	bx lr
	arm_func_end GetCurrentPage

	arm_func_start GetPageStart
GetPageStart: ; 0x02032568
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end GetPageStart

	arm_func_start GetSelectedMenuItemIdx
GetSelectedMenuItemIdx: ; 0x02032578
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end GetSelectedMenuItemIdx

	arm_func_start GetTotalNumMenuItems
GetTotalNumMenuItems: ; 0x0203258C
	ldr r0, [r0, #0xd0]
	bx lr
	arm_func_end GetTotalNumMenuItems

	arm_func_start GetNumItemsOnPage
GetNumItemsOnPage: ; 0x02032594
	ldr r0, [r0, #0xc0]
	bx lr
	arm_func_end GetNumItemsOnPage

	arm_func_start GetMaxItemsOnPage
GetMaxItemsOnPage: ; 0x0203259C
	ldr r0, [r0, #0xc4]
	bx lr
	arm_func_end GetMaxItemsOnPage

	arm_func_start GetTotalNumPages
GetTotalNumPages: ; 0x020325A4
	ldr r0, [r0, #0xcc]
	bx lr
	arm_func_end GetTotalNumPages

	arm_func_start sub_020325AC
sub_020325AC: ; 0x020325AC
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325AC

	arm_func_start sub_020325E8
sub_020325E8: ; 0x020325E8
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r2, [r0, #0xbc]
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0, #0xbc]
	subge r1, r1, #1
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325E8

	arm_func_start sub_0203261C
sub_0203261C: ; 0x0203261C
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_0203261C

	arm_func_start sub_02032654
sub_02032654: ; 0x02032654
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	movmi r1, #0
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032654

	arm_func_start sub_02032684
sub_02032684: ; 0x02032684
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	strb r0, [r5, #0xd4]
	movs r4, r1
	ldr r0, [r5, #0x10]
	movmi r4, #0
	tst r0, #0x8000
	beq _020326E0
	ldr r0, [r5, #0xd0]
	ldr r1, [r5, #0xc4]
	cmp r4, r0
	subge r4, r0, #1
	mov r0, r4
	bl _s32_div_f
	str r0, [r5, #0xc8]
	ldr r1, [r5, #0xc4]
	mov r0, r4
	bl _s32_div_f
	mov r0, r5
	str r1, [r5, #0xbc]
	bl sub_02032754
	ldmia sp!, {r3, r4, r5, pc}
_020326E0:
	ldr r0, [r5, #0xc0]
	cmp r4, r0
	subge r0, r0, #1
	strge r0, [r5, #0xbc]
	strlt r4, [r5, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02032684

	arm_func_start sub_020326F8
sub_020326F8: ; 0x020326F8
	mov r3, #1
	cmp r1, #0
	movlt r1, #0
	strb r3, [r0, #0xd4]
	cmp r1, r2
	ldrge r1, [r0, #0xc0]
	subge r1, r1, #1
	str r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020326F8

	arm_func_start sub_0203271C
sub_0203271C: ; 0x0203271C
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_02032754
	ldr r0, [r4, #0xcc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	orrge r0, r0, #0x10000
	biclt r0, r0, #0x10000
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203271C

	arm_func_start sub_02032754
sub_02032754: ; 0x02032754
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldr r1, [r4, #0xc8]
	sub r0, r0, #1
	cmp r1, r0
	strge r0, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032754

	arm_func_start sub_020327CC
sub_020327CC: ; 0x020327CC
	str r1, [r0, #0xd0]
	str r2, [r0, #0xc4]
	mov r1, #0
	str r1, [r0, #0xbc]
	str r1, [r0, #0xc8]
	bx lr
	arm_func_end sub_020327CC

	arm_func_start sub_020327E4
sub_020327E4: ; 0x020327E4
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _02032808 ; =sub_02032754
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032808: .word sub_02032754
	arm_func_end sub_020327E4

	arm_func_start sub_0203280C
sub_0203280C: ; 0x0203280C
	ldr r1, [r0, #0xc8]
	ldr ip, _02032828 ; =sub_02032754
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032828: .word sub_02032754
	arm_func_end sub_0203280C

	arm_func_start sub_0203282C
sub_0203282C: ; 0x0203282C
	ldr r2, [r0, #0xcc]
	ldr r1, [r0, #0xc8]
	sub r2, r2, #1
	cmp r1, r2
	movge r1, #0
	strge r1, [r0, #0xc8]
	bge _02032858
	add r1, r1, #0xa
	cmp r1, r2
	movle r2, r1
	str r2, [r0, #0xc8]
_02032858:
	ldr ip, _02032860 ; =sub_02032754
	bx ip
	.align 2, 0
_02032860: .word sub_02032754
	arm_func_end sub_0203282C

	arm_func_start sub_02032864
sub_02032864: ; 0x02032864
	ldr r1, [r0, #0xc8]
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	suble r1, r1, #1
	strle r1, [r0, #0xc8]
	ble _02032888
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
_02032888:
	ldr ip, _02032890 ; =sub_02032754
	bx ip
	.align 2, 0
_02032890: .word sub_02032754
	arm_func_end sub_02032864

	arm_func_start sub_02032894
sub_02032894: ; 0x02032894
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _020328B4
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _020328D0
_020328B4:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_020328D0:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032894

	arm_func_start GetPageItemYOffset
GetPageItemYOffset: ; 0x020328D8
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end GetPageItemYOffset

	arm_func_start sub_020328F4
sub_020328F4: ; 0x020328F4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032910
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032910:
	mov r0, #0
	bx lr
	arm_func_end sub_020328F4

	arm_func_start sub_02032918
sub_02032918: ; 0x02032918
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032934
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032934:
	mov r0, #0
	bx lr
	arm_func_end sub_02032918

	arm_func_start sub_0203293C
sub_0203293C: ; 0x0203293C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032958
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032958:
	mov r0, #0
	bx lr
	arm_func_end sub_0203293C

	arm_func_start PlayWindowInputSound
PlayWindowInputSound: ; 0x02032960
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end PlayWindowInputSound

	arm_func_start sub_02032984
sub_02032984: ; 0x02032984
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_02032984

	arm_func_start sub_0203299C
sub_0203299C: ; 0x0203299C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0203299C

	arm_func_start CalcMenuHeightDiv8__020329E4
CalcMenuHeightDiv8__020329E4: ; 0x020329E4
	tst r0, #0x40000
	bne _020329FC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_020329FC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__020329E4

	arm_func_start InitInventoryMenuInput
InitInventoryMenuInput: ; 0x02032A38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02032A68:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02032A68
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	ldrb r0, [sp, #0x28]
	str r1, [r7, #0xd0]
	strb r0, [r7, #0xd5]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02032AD8
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02032AE0
_02032AD8:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02032AE0:
	mov r0, r7
	bl sub_020331D4
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02032B74
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02032B68
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02032B68:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02032B7C
_02032B74:
	mov r0, r7
	bl sub_0203330C
_02032B7C:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02032B94
	ldr r1, [r6]
	mov r0, r7
	bl sub_020330EC
_02032B94:
	bl sub_02031908
	mov r1, #0
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_020333FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitInventoryMenuInput

	arm_func_start sub_02032BB8
sub_02032BB8: ; 0x02032BB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x24
	mov sb, r0
	mov r6, r3
	mov r8, r1
	mov r7, r2
	ldr r4, [sb, #0xc8]
	ldr r5, [sb, #0xbc]
	bl sub_02033414
	mov sl, r0
	cmp r6, #0
	add r0, sp, #0
	beq _02032D04
	ldr r1, [sb, #0x10]
	bl sub_02031914
	ldr r1, [sb, #0x10]
	mov r6, r0
	tst r1, #0x8000
	beq _02032C44
	tst r1, #0x20000
	beq _02032C44
	tst r1, #0x2000000
	bne _02032C44
	tst r6, #8
	beq _02032C44
	tst r6, #0x10
	beq _02032C30
	mov r0, sb
	bl sub_020332AC
	b _02032C74
_02032C30:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033284
	b _02032C74
_02032C44:
	tst r1, #0x1000000
	cmpeq sl, #0
	bne _02032C74
	tst r6, #0x10
	beq _02032C64
	mov r0, sb
	bl sub_020330B4
	b _02032C74
_02032C64:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033078
_02032C74:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _02032CEC
	tst r0, #0x20000
	bne _02032CEC
	tst r0, #0x2000000
	bne _02032CEC
	tst r0, #0x10000
	beq _02032CC8
	tst r6, #8
	beq _02032CC8
	tst r6, #0x40
	beq _02032CB4
	mov r0, sb
	bl sub_020332F0
	b _02032CEC
_02032CB4:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl sub_020332CC
	b _02032CEC
_02032CC8:
	tst r6, #0x40
	beq _02032CDC
	mov r0, sb
	bl sub_020332AC
	b _02032CEC
_02032CDC:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl sub_02033284
_02032CEC:
	ldr r0, [sb, #0x10]
	tst r0, #1
	biceq r6, r6, #1
	tst r0, #2
	biceq r6, r6, #2
	b _02032D0C
_02032D04:
	mov r6, #0
	bl sub_02006BFC
_02032D0C:
	cmp r8, #0
	strne r6, [r8]
	cmp r7, #0
	beq _02032D3C
	add r8, sp, #0
	mov r6, #2
_02032D24:
	ldmia r8!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _02032D24
	ldr r0, [r8]
	str r0, [r7]
_02032D3C:
	ldr r0, [sb, #0xc8]
	cmp r4, r0
	beq _02032D5C
	mov r0, sb
	mov r1, #4
	bl sub_020333D8
	mov r0, #1
	b _02032DA8
_02032D5C:
	ldr r0, [sb, #0xbc]
	cmp r5, r0
	beq _02032D74
	mov r0, sb
	mov r1, #3
	bl sub_020333D8
_02032D74:
	ldr r0, [sb, #0xd8]
	cmp r0, #0
	ble _02032DA4
	subs r0, r0, #1
	str r0, [sb, #0xd8]
	bne _02032DA4
	mvn r0, #0
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	mov r0, #1
	b _02032DA8
_02032DA4:
	mov r0, #0
_02032DA8:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02032BB8

	arm_func_start sub_02032DB0
sub_02032DB0: ; 0x02032DB0
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _02032DE0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _02032DE0
	mov r0, #1
	bx lr
_02032DE0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032DB0

	arm_func_start sub_02032DE8
sub_02032DE8: ; 0x02032DE8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_02032DE8

	arm_func_start sub_02032E0C
sub_02032E0C: ; 0x02032E0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _02032F50
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _02032F48
_02032E68:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032F44
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032F34
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032F34:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _02032F54
_02032F44:
	add r6, r6, #1
_02032F48:
	cmp r6, r5
	blt _02032E68
_02032F50:
	mvn r0, #0
_02032F54:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032E0C

	arm_func_start sub_02032F5C
sub_02032F5C: ; 0x02032F5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032FA4
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032FA4
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032FA4:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02032F5C

	arm_func_start sub_02032FD8
sub_02032FD8: ; 0x02032FD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _0203304C
	tst r1, #0x8000000
	bne _0203304C
	tst r1, #0x200
	beq _02033044
	bl sub_02033414
	cmp r0, #0
	bne _02033028
	mov r0, r4
	bl sub_02033064
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _0203304C
	mov r0, #1
	ldmia sp!, {r4, pc}
_02033028:
	ldr r0, [r4, #0xac]
	ldrb r0, [r0, #0x7f]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_02033044:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203304C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032FD8

	arm_func_start sub_02033054
sub_02033054: ; 0x02033054
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end sub_02033054

	arm_func_start sub_02033064
sub_02033064: ; 0x02033064
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end sub_02033064

	arm_func_start sub_02033078
sub_02033078: ; 0x02033078
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02033078

	arm_func_start sub_020330B4
sub_020330B4: ; 0x020330B4
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020330B4

	arm_func_start sub_020330EC
sub_020330EC: ; 0x020330EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #1
	strb r0, [r4, #0xd4]
	movs r5, r1
	ldr r0, [r4, #0x10]
	movmi r5, #0
	tst r0, #0x8000
	beq _02033194
	ldr r1, [r4, #0xd0]
	cmp r5, r1
	blt _02033168
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	beq _02033140
	ldr r1, [r4, #0xcc]
	mov r0, #0
	sub r1, r1, #1
	str r1, [r4, #0xc8]
	str r0, [r4, #0xbc]
	b _02033188
_02033140:
	sub r5, r1, #1
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
	b _02033188
_02033168:
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
_02033188:
	mov r0, r4
	bl sub_020331D4
	ldmia sp!, {r3, r4, r5, pc}
_02033194:
	ldr r0, [r4, #0xc0]
	cmp r5, r0
	subge r0, r0, #1
	strge r0, [r4, #0xbc]
	strlt r5, [r4, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020330EC

	arm_func_start sub_020331AC
sub_020331AC: ; 0x020331AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_020331D4
	mov r0, r4
	bl sub_02033064
	mov r1, r0
	mov r0, r4
	bl sub_020330EC
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331AC

	arm_func_start sub_020331D4
sub_020331D4: ; 0x020331D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	ldrne r0, [r4, #0xcc]
	addne r0, r0, #1
	strne r0, [r4, #0xcc]
	ldr r1, [r4, #0xcc]
	ldr r0, [r4, #0xc8]
	sub r1, r1, #1
	cmp r0, r1
	strge r1, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	mov r0, r4
	bl sub_02033414
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0xbc]
	movne r0, #1
	strne r0, [r4, #0xc0]
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331D4

	arm_func_start sub_02033284
sub_02033284: ; 0x02033284
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _020332A8 ; =sub_020331D4
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332A8: .word sub_020331D4
	arm_func_end sub_02033284

	arm_func_start sub_020332AC
sub_020332AC: ; 0x020332AC
	ldr r1, [r0, #0xc8]
	ldr ip, _020332C8 ; =sub_020331D4
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332C8: .word sub_020331D4
	arm_func_end sub_020332AC

	arm_func_start sub_020332CC
sub_020332CC: ; 0x020332CC
	ldr r2, [r0, #0xc8]
	ldr r1, [r0, #0xcc]
	add r2, r2, #0xa
	cmp r2, r1
	subge r2, r1, #1
	ldr ip, _020332EC ; =sub_020331D4
	str r2, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332EC: .word sub_020331D4
	arm_func_end sub_020332CC

	arm_func_start sub_020332F0
sub_020332F0: ; 0x020332F0
	ldr r1, [r0, #0xc8]
	ldr ip, _02033308 ; =sub_020331D4
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02033308: .word sub_020331D4
	arm_func_end sub_020332F0

	arm_func_start sub_0203330C
sub_0203330C: ; 0x0203330C
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _0203332C
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _02033348
_0203332C:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_02033348:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203330C

	arm_func_start sub_02033350
sub_02033350: ; 0x02033350
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end sub_02033350

	arm_func_start sub_0203336C
sub_0203336C: ; 0x0203336C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02033388
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02033388:
	mov r0, #0
	bx lr
	arm_func_end sub_0203336C

	arm_func_start sub_02033390
sub_02033390: ; 0x02033390
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333AC
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333AC:
	mov r0, #0
	bx lr
	arm_func_end sub_02033390

	arm_func_start sub_020333B4
sub_020333B4: ; 0x020333B4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333D0
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333D0:
	mov r0, #0
	bx lr
	arm_func_end sub_020333B4

	arm_func_start sub_020333D8
sub_020333D8: ; 0x020333D8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020333D8

	arm_func_start sub_020333FC
sub_020333FC: ; 0x020333FC
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_020333FC

	arm_func_start sub_02033414
sub_02033414: ; 0x02033414
	ldrb r1, [r0, #0xd5]
	cmp r1, #0
	beq _02033438
	ldr r1, [r0, #0xc8]
	ldr r2, [r0, #0xcc]
	add r0, r1, #1
	cmp r2, r0
	moveq r0, #1
	bxeq lr
_02033438:
	mov r0, #0
	bx lr
	arm_func_end sub_02033414

	arm_func_start sub_02033440
sub_02033440: ; 0x02033440
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r5, r0
	tst r5, #0x800
	mov r4, #0
	beq _02033498
	ldrh r2, [r1, #8]
	cmp r2, #0
	moveq r0, r4
	beq _02033488
	ldr r3, _020334A4 ; =0x0000C402
	add ip, r1, #0x10
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #4
	bl sub_020265A8
_02033488:
	tst r5, #0x8000
	addne r0, r0, #0x40
	cmp r0, #0
	movgt r4, r0
_02033498:
	mov r0, r4
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020334A4: .word 0x0000C402
	arm_func_end sub_02033440

	arm_func_start sub_020334A8
sub_020334A8: ; 0x020334A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r0, [r5, #0x10]
	mov r4, r1
	tst r0, #0x800
	beq _02033598
	ldrh r2, [r5, #0x1c]
	cmp r2, #0
	beq _020334FC
	ldr r3, _020335A0 ; =0x0000C402
	add ip, r5, #0x24
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
_020334FC:
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_020328F4
	cmp r0, #0
	beq _02033598
	mov r0, r5
	bl GetCurrentPage
	add r1, r0, #1
	mov r0, r5
	str r1, [sp, #0x28]
	bl GetTotalNumPages
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _020335A4 ; =_0209AFC4
	ldr r3, _020335A0 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov ip, r0
	ldr r3, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r3, r1
	mov r2, #0
	sub r1, r1, ip
	add r3, sp, #0x54
	bl DrawTextInWindow
_02033598:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020335A0: .word 0x0000C402
_020335A4: .word _0209AFC4
	arm_func_end sub_020334A8

	arm_func_start sub_020335A8
sub_020335A8: ; 0x020335A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r2, [r5, #0x10]
	mov r4, r1
	tst r2, #0x800
	beq _020336E8
	bl sub_02033414
	cmp r0, #0
	beq _02033610
	ldr r3, _020336F0 ; =0x000008E3
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl sub_02026268
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	b _020336E8
_02033610:
	add r0, r5, #0x24
	str r0, [sp]
	ldrh r2, [r5, #0x1c]
	ldr r3, _020336F4 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_0203336C
	cmp r0, #0
	beq _020336E8
	ldr r0, [r5, #0xc8]
	ldr r2, _020336F8 ; =_0209AFC4
	add r0, r0, #1
	str r0, [sp, #0x28]
	ldrb r0, [r5, #0xd5]
	ldr r3, _020336F4 ; =0x0000C402
	add ip, sp, #4
	cmp r0, #0
	movne r1, #1
	ldr r0, [r5, #0xcc]
	moveq r1, #0
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov r2, r0
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	add r3, sp, #0x54
	sub r1, r1, r0
	sub r1, r1, r2
	mov r0, r4
	mov r2, #0
	bl DrawTextInWindow
_020336E8:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_020336F0: .word 0x00001D3B
#else
_020336F0: .word 0x000008E3
#endif
_020336F4: .word 0x0000C402
_020336F8: .word _0209AFC4
	arm_func_end sub_020335A8

	arm_func_start sub_020336FC
sub_020336FC: ; 0x020336FC
	tst r0, #0x1000
	mov r1, #0
	beq _02033750
	mov r2, #4
	tst r0, #0x2000
	addne r2, r2, #0x12
	tst r0, #0x4000
	addne r2, r2, #0x14
	tst r0, #0x20000
	addne r2, r2, #0x1f
	bne _02033738
	tst r0, #0x8000
	addne r2, r2, #0x3e
	tst r0, #8
	addne r2, r2, #0x1f
_02033738:
	tst r0, #4
	addne r2, r2, #0x12
	tst r0, #2
	addne r2, r2, #0x12
	cmp r2, #0
	movgt r1, r2
_02033750:
	mov r0, r1
	bx lr
	arm_func_end sub_020336FC

	arm_func_start sub_02033758
sub_02033758: ; 0x02033758
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	ldrb r0, [sb, #0xf4]
	mov r8, r1
	ldr r1, [sb, #0x10]
	cmp r0, #0
	ldrne r0, _02033BBC ; =0x00001002
	mov r7, r2
	moveq r0, #2
	mov r0, r0, lsl #0x10
	mov r4, #0
	tst r1, #0x1000
	mov r5, r0, lsr #0x10
	beq _02033B98
	ldrh r0, [r7]
	tst r0, r5
	beq _02033B98
	ldmib sb, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [sb, #4]
	add r6, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sb, #0x10]
	tst r0, #0x2000
	beq _0203380C
	mov r0, #0x12
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r8]
	add r6, r6, #0x12
_0203380C:
	ldr r0, [sb, #0x10]
	tst r0, #0x4000
	beq _0203385C
	mov r0, #0x13
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r8]
	add r6, r6, #0x14
_0203385C:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _020339C8
	tst r0, #0x20000
	bne _020339C8
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _020339C4
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _020338D4
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _020338D4
	mov r0, sb
	bl sub_02032864
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r8]
_020338D4:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _0203392C
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _0203392C
	mov r0, sb
	bl sub_0203282C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r8]
_0203392C:
	add ip, r6, #0x1f
	add r3, r6, #0x2a
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033978
	mov r0, sb
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r8]
_02033978:
	add ip, r6, #0x2d
	add r3, r6, #0x38
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _020339C4
	mov r0, sb
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r8]
_020339C4:
	add r6, r6, #0x3e
_020339C8:
	ldr r0, [sb, #0x10]
	tst r0, #8
	bne _020339EC
	tst r0, #0x20000
	beq _02033AE0
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _02033AE0
_020339EC:
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000000
	bne _02033A64
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033A64
	ldr r0, [r8]
	orr r0, r0, #0x40000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033A58
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x4000
	str r0, [r8]
	b _02033A60
_02033A58:
	mov r1, #0
	bl PlayWindowInputSound
_02033A60:
	mov r4, #1
_02033A64:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x40000000
	bne _02033AE0
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033AE0
	ldr r0, [r8]
	orr r0, r0, #0x80000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033AD4
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x8000
	str r0, [r8]
	b _02033ADC
_02033AD4:
	mov r1, #0
	bl PlayWindowInputSound
_02033ADC:
	mov r4, #1
_02033AE0:
	ldr r1, [sb, #0xc]
	ldr r0, [sb, #0x10]
	add r6, r1, #4
	tst r0, #2
	beq _02033B2C
	sub r6, r6, #0x12
	add r3, r6, #0xb
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r8]
_02033B2C:
	ldr r0, [sb, #0x10]
	tst r0, #4
	beq _02033B98
	sub ip, r6, #0x12
	sub r3, r6, #7
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033B98
	ldr r0, [sb, #0x10]
	tst r0, #0x18000000
	ldreq r0, [r8]
	orreq r0, r0, #1
	orreq r0, r0, #0x10000
	streq r0, [r8]
	beq _02033B94
	ldr r1, [r8]
	mov r0, sb
	orr r2, r1, #0x10000
	mov r1, #2
	str r2, [r8]
	bl PlayWindowInputSound
_02033B94:
	mov r4, #1
_02033B98:
	ldr r1, [r8]
	cmp r1, #0
	beq _02033BB0
	mov r0, sb
	bl sub_020320C8
	mov r4, #1
_02033BB0:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02033BBC: .word 0x00001002
	arm_func_end sub_02033758

	arm_func_start sub_02033BC0
sub_02033BC0: ; 0x02033BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02033ECC
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033C44
	tst r4, #0x1000000
	ldrne r3, _02033ED4 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _02033ED8 ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
	add r6, r6, #0x12
_02033C44:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02033C70
	tst r4, #0x2000000
	ldrne r3, _02033EDC ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02033EE0 ; =_0209AFF4
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	add r6, r6, #0x14
_02033C70:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02033D74
	tst r0, #0x20000
	bne _02033D74
	mov r0, r8
	bl sub_020328F4
	cmp r0, #0
	beq _02033D70
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02033D08
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033CB8
	tst r4, #0x400000
	beq _02033CD4
_02033CB8:
	tst r4, #0x400000
	ldrne r3, _02033EE4 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _02033EE8 ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033CD4:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033CEC
	tst r4, #0x800000
	beq _02033D08
_02033CEC:
	tst r4, #0x800000
	ldrne r3, _02033EEC ; =_0209B00C
	mov r0, r7
	ldreq r3, _02033EF0 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033D08:
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033D20
	tst r4, #0x100000
	beq _02033D3C
_02033D20:
	tst r4, #0x100000
	ldrne r3, _02033EF4 ; =_0209B01C
	mov r0, r7
	ldreq r3, _02033EF8 ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_02033D3C:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033D54
	tst r4, #0x200000
	beq _02033D70
_02033D54:
	tst r4, #0x200000
	ldrne r3, _02033EFC ; =_0209B02C
	mov r0, r7
	ldreq r3, _02033F00 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_02033D70:
	add r6, r6, #0x3e
_02033D74:
	ldr r1, [r8, #0x10]
	ldr r0, _02033F04 ; =0x00020008
	tst r1, r0
	beq _02033E40
	tst r4, #0x40000
	beq _02033DA4
	ldr r3, _02033F08 ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033DE0
_02033DA4:
	tst r1, #0x20000000
	bne _02033DE0
	tst r1, #8
	bne _02033DCC
	tst r1, #0x20000
	beq _02033DE0
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	beq _02033DE0
_02033DCC:
	ldr r3, _02033F0C ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033DE0:
	tst r4, #0x80000
	beq _02033E00
	ldr r3, _02033F10 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033E40
_02033E00:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02033E40
	tst r0, #8
	bne _02033E2C
	tst r0, #0x20000
	beq _02033E40
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	beq _02033E40
_02033E2C:
	ldr r3, _02033F14 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033E40:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02033E7C
	tst r4, #0x20000
	ldrne r3, _02033F18 ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _02033F1C ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033E7C:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02033ECC
	tst r0, #0x18000000
	beq _02033EB0
	tst r4, #0x10000
	ldrne r3, _02033F20 ; =_0209B06C
	mov r0, r7
	ldreq r3, _02033F24 ; =_0209B074
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033ECC
_02033EB0:
	tst r4, #0x10000
	ldrne r3, _02033F28 ; =_0209B07C
	mov r0, r7
	ldreq r3, _02033F2C ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02033ECC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02033ED4: .word _0209AFDC
_02033ED8: .word _0209AFE4
_02033EDC: .word _0209AFEC
_02033EE0: .word _0209AFF4
_02033EE4: .word _0209AFFC
_02033EE8: .word _0209B004
_02033EEC: .word _0209B00C
_02033EF0: .word _0209B014
_02033EF4: .word _0209B01C
_02033EF8: .word _0209B024
_02033EFC: .word _0209B02C
_02033F00: .word _0209B034
_02033F04: .word 0x00020008
_02033F08: .word _0209B03C
_02033F0C: .word _0209B044
_02033F10: .word _0209B04C
_02033F14: .word _0209B054
_02033F18: .word _0209B05C
_02033F1C: .word _0209B064
_02033F20: .word _0209B06C
_02033F24: .word _0209B074
_02033F28: .word _0209B07C
_02033F2C: .word _0209B084
	arm_func_end sub_02033BC0

	arm_func_start sub_02033F30
sub_02033F30: ; 0x02033F30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	mov r6, r2
	tst r0, #0x1000
	mov r4, #0
	beq _0203433C
	ldrh r0, [r6]
	tst r0, #2
	beq _0203433C
	ldmib r8, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [r8, #4]
	add r5, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033FC8
	mov r0, #0x12
	str r5, [sp, #8]
	bl sub_02026594
	add r0, r5, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r7]
_02033FC8:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _0203401C
	add r1, r5, #0x12
	mov r0, #0x13
	str r1, [sp, #8]
	bl sub_02026594
	add r1, r5, #0x12
	add r0, r1, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r7]
_0203401C:
	ldr r0, [r8, #0x10]
	add r5, r5, #0x26
	tst r0, #0x8000
	beq _0203418C
	tst r0, #0x20000
	bne _0203418C
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _02034188
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02034098
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034098
	mov r0, r8
	bl sub_020332F0
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r7]
_02034098:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020340F0
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020340F0
	mov r0, r8
	bl sub_020332CC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r7]
_020340F0:
	add ip, r5, #0x1f
	add r3, r5, #0x2a
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0203413C
	mov r0, r8
	bl sub_020332AC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r7]
_0203413C:
	add ip, r5, #0x2d
	add r3, r5, #0x38
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02034188
	mov r0, r8
	bl sub_02033284
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r7]
_02034188:
	add r5, r5, #0x3e
_0203418C:
	ldr r1, [r8, #0x10]
	ands r0, r1, #8
	beq _020342AC
	cmp r0, #0
	bne _020341B8
	tst r1, #0x20000
	beq _020342AC
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _020342AC
_020341B8:
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02034230
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034230
	ldr r0, [r7]
	orr r0, r0, #0x40000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _02034224
	bl sub_020332AC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x4000
	str r0, [r7]
	b _0203422C
_02034224:
	mov r1, #0
	bl sub_020333D8
_0203422C:
	mov r4, #1
_02034230:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000000
	bne _020342AC
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020342AC
	ldr r0, [r7]
	orr r0, r0, #0x80000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _020342A0
	bl sub_02033284
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x8000
	str r0, [r7]
	b _020342A8
_020342A0:
	mov r1, #0
	bl sub_020333D8
_020342A8:
	mov r4, #1
_020342AC:
	ldr r1, [r8, #0xc]
	ldr r0, [r8, #0x10]
	add r5, r1, #4
	tst r0, #2
	beq _020342F8
	sub r5, r5, #0x12
	add r3, r5, #0xb
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r5, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r7]
_020342F8:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _0203433C
	sub ip, r5, #0x12
	sub r3, r5, #7
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #1
	orrne r0, r0, #0x10000
	strne r0, [r7]
_0203433C:
	ldr r1, [r7]
	cmp r1, #0
	beq _02034354
	mov r0, r8
	bl sub_02032DE8
	mov r4, #1
_02034354:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02033F30

	arm_func_start sub_02034360
sub_02034360: ; 0x02034360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02034660
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _020343E0
	tst r4, #0x1000000
	ldrne r3, _02034668 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _0203466C ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
_020343E0:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02034408
	tst r4, #0x2000000
	ldrne r3, _02034670 ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02034674 ; =_0209AFF4
	add r2, r5, #3
	mov r1, #0x16
	bl DrawTextInWindow
_02034408:
	ldr r0, [r8, #0x10]
	add r6, r6, #0x26
	tst r0, #0x8000
	beq _02034510
	tst r0, #0x20000
	bne _02034510
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _0203450C
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020344A4
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _02034454
	tst r4, #0x400000
	beq _02034470
_02034454:
	tst r4, #0x400000
	ldrne r3, _02034678 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _0203467C ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034470:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _02034488
	tst r4, #0x800000
	beq _020344A4
_02034488:
	tst r4, #0x800000
	ldrne r3, _02034680 ; =_0209B00C
	mov r0, r7
	ldreq r3, _02034684 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020344A4:
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _020344BC
	tst r4, #0x100000
	beq _020344D8
_020344BC:
	tst r4, #0x100000
	ldrne r3, _02034688 ; =_0209B01C
	mov r0, r7
	ldreq r3, _0203468C ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_020344D8:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _020344F0
	tst r4, #0x200000
	beq _0203450C
_020344F0:
	tst r4, #0x200000
	ldrne r3, _02034690 ; =_0209B02C
	mov r0, r7
	ldreq r3, _02034694 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_0203450C:
	add r6, r6, #0x3e
_02034510:
	ldr r1, [r8, #0x10]
	ldr r0, _02034698 ; =0x00020008
	tst r1, r0
	beq _020345DC
	tst r4, #0x40000
	beq _02034540
	ldr r3, _0203469C ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _0203457C
_02034540:
	tst r1, #0x20000000
	bne _0203457C
	tst r1, #8
	bne _02034568
	tst r1, #0x20000
	beq _0203457C
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	beq _0203457C
_02034568:
	ldr r3, _020346A0 ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_0203457C:
	tst r4, #0x80000
	beq _0203459C
	ldr r3, _020346A4 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _020345DC
_0203459C:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _020345DC
	tst r0, #8
	bne _020345C8
	tst r0, #0x20000
	beq _020345DC
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	beq _020345DC
_020345C8:
	ldr r3, _020346A8 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020345DC:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02034618
	tst r4, #0x20000
	ldrne r3, _020346AC ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _020346B0 ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034618:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02034660
	tst r0, #0x18000000
	beq _02034644
	ldr r3, _020346B4 ; =_0209B074
	mov r0, r7
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02034660
_02034644:
	tst r4, #0x10000
	ldrne r3, _020346B8 ; =_0209B07C
	mov r0, r7
	ldreq r3, _020346BC ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02034660:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02034668: .word _0209AFDC
_0203466C: .word _0209AFE4
_02034670: .word _0209AFEC
_02034674: .word _0209AFF4
_02034678: .word _0209AFFC
_0203467C: .word _0209B004
_02034680: .word _0209B00C
_02034684: .word _0209B014
_02034688: .word _0209B01C
_0203468C: .word _0209B024
_02034690: .word _0209B02C
_02034694: .word _0209B034
_02034698: .word 0x00020008
_0203469C: .word _0209B03C
_020346A0: .word _0209B044
_020346A4: .word _0209B04C
_020346A8: .word _0209B054
_020346AC: .word _0209B05C
_020346B0: .word _0209B064
_020346B4: .word _0209B074
_020346B8: .word _0209B07C
_020346BC: .word _0209B084
	arm_func_end sub_02034360

	arm_func_start sub_020346C0
sub_020346C0: ; 0x020346C0
	stmdb sp!, {r4, lr}
	mov r0, #0xdc
	mov r1, #1
	bl MemAlloc
	mov r4, r0
	ldr ip, _02034708 ; =_020AFDB8
	ldr r0, _0203470C ; =NULL_OVERLAY_LOAD_ENTRY
	str r4, [ip]
	add lr, r4, #0xc4
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r1, #0
	str r1, [r4, #0xd4]
	ldr r0, [ip]
	strb r1, [r0, #0xd8]
	bl sub_02034710
	bl sub_020469BC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02034708: .word _020AFDB8
_0203470C: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_020346C0

	arm_func_start sub_02034710
sub_02034710: ; 0x02034710
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r1, _02034798 ; =_020AFDB8
	ldr r0, _0203479C ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r1, [r1]
	add r4, r1, #0xc4
	mov r1, r4
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _0203473C
	bl FreeActiveMenu
_0203473C:
	ldr r0, _0203479C ; =NULL_OVERLAY_LOAD_ENTRY
	add r7, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	ldr ip, _02034798 ; =_020AFDB8
	ldmia r7, {r0, r1, r2, r3}
	ldr r5, [ip]
	mov r6, #0
	stmia r5, {r0, r1, r2, r3}
	strb r6, [r5, #0x10]
	ldr r5, [ip]
	ldmia r7, {r0, r1, r2, r3}
	add lr, r5, #0x14
	stmia lr, {r0, r1, r2, r3}
	str r6, [r5, #0x24]
	ldr r0, [ip]
	strb r6, [r0, #0xc0]
	ldmia r7, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	str r6, [r0, #0xd4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02034798: .word _020AFDB8
_0203479C: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_02034710

	arm_func_start OverlayLoadEntriesEqual
OverlayLoadEntriesEqual: ; 0x020347A0
	cmp r0, #0
	ldreq r0, _020347EC ; =NULL_OVERLAY_LOAD_ENTRY
	cmp r1, #0
	ldreq r1, _020347EC ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r2, [r0, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020347EC: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end OverlayLoadEntriesEqual

	arm_func_start FreeActiveMenu
FreeActiveMenu: ; 0x020347F0
	stmdb sp!, {r4, lr}
	ldr r0, _0203483C ; =_020AFDB8
	ldr r4, [r0]
	ldr r0, [r4, #0xcc]
	cmp r0, #0
	beq _0203480C
	blx r0
_0203480C:
	ldr r0, _0203483C ; =_020AFDB8
	ldr r0, [r0]
	ldrb r0, [r0, #0xd8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc4]
	bl UnloadOverlay
	ldr r0, _0203483C ; =_020AFDB8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203483C: .word _020AFDB8
	arm_func_end FreeActiveMenu

	arm_func_start sub_02034840
sub_02034840: ; 0x02034840
	stmdb sp!, {r4, lr}
	ldr r1, _020348DC ; =_020AFDB8
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _02034894
	cmp r4, #0
	beq _0203487C
	add r1, r2, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	beq _02034894
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203487C:
	ldr r0, _020348E0 ; =NULL_OVERLAY_LOAD_ENTRY
	add r1, r2, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02034894:
	cmp r4, #0
	beq _020348B4
	ldr r1, _020348DC ; =_020AFDB8
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0xc4
	bl OverlayLoadEntriesEqual
	ldmia sp!, {r4, pc}
_020348B4:
	ldr r1, _020348DC ; =_020AFDB8
	ldr r0, _020348E0 ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r1, [r1]
	add r1, r1, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_020348DC: .word _020AFDB8
_020348E0: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_02034840
