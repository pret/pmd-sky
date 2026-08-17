	.include "asm/macros.inc"
	.include "main_0202C5F4.inc"

	.text

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
