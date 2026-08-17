	.include "asm/macros.inc"
	.include "main_020308A0.inc"

	.text

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

	arm_func_start GetDigitInputResult
GetDigitInputResult: ; 0x02030940
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
	arm_func_end GetDigitInputResult

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
