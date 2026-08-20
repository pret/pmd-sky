	.include "asm/macros.inc"
	.include "main_0202BA20.inc"

	.text

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
