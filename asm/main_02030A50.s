	.include "asm/macros.inc"
	.include "main_02030A50.inc"

	.text

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
