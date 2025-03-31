	.include "asm/macros.inc"
	.include "overlay_10.inc"

	.text

	arm_func_start CreateInventoryMenu
CreateInventoryMenu: ; 0x022BCA80
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	ldr r7, [sp, #0x450]
	mov r0, #0x1a4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r4, r0
	cmp r6, #0
	ldreq r0, _022BCC58 ; =INVENTORY_MENU_DEFAULT_WINDOW_PARAMS
	str r7, [r4, #0x198]
	add r5, sp, #0x1c
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r5, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r5, {r0, r1, r2, r3}
	ldrne r0, _022BCC5C ; =UpdateInventoryMenu
	orreq sl, sl, #0x300000
	strne r0, [sp, #0x1c]
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _022BCB44
	mov r6, #0
	mov r5, r6
	add fp, sp, #0x2c
	b _022BCB24
_022BCAFC:
	mov r0, fp
	mov r1, r5
	mov r2, r7
	blx r8
	cmp r0, #0
	beq _022BCB20
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
_022BCB20:
	add r5, r5, #1
_022BCB24:
	ldr r0, [sp, #0x454]
	cmp r5, r0
	blt _022BCAFC
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_0203299C
	strb r0, [sp, #0x22]
_022BCB44:
	ldrb r0, [sp, #0x23]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x54
	bne _022BCB74
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__020329E4
	strb r0, [sp, #0x23]
	b _022BCB84
_022BCB74:
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__020329E4
_022BCB84:
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
	ldr r1, _022BCC5C ; =UpdateInventoryMenu
	mov r0, #0
	str r1, [r4]
	strb r0, [r4, #0x1a3]
	str sl, [r4, #0xf8]
	cmp sb, #0
	beq _022BCBE8
	add r6, r4, #0xfc
	mov r5, #9
_022BCBD0:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _022BCBD0
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_022BCBE8:
	str r8, [r4, #0x194]
	mov r0, #0
	str r0, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldrb r2, [sp, #0x45c]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [r4, #0x1a2]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x454]
	ldrb r5, [sp, #0x45c]
	str r0, [sp]
	ldr r0, [sp, #0x458]
	add r3, sp, #0xc
	str r0, [sp, #4]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0xfc
	str r5, [sp, #8]
	bl InitInventoryMenuInput
	mov r0, r6
	add sp, sp, #0x2c
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022BCC58: .word INVENTORY_MENU_DEFAULT_WINDOW_PARAMS
_022BCC5C: .word UpdateInventoryMenu
	arm_func_end CreateInventoryMenu

