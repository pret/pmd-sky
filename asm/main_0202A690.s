	.include "asm/macros.inc"
	.include "main_0202A690.inc"

	.text

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
