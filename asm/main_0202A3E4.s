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

	arm_func_start PrintSpecialEpisodeClearMark
PrintSpecialEpisodeClearMark: ; 0x0202A40C
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
	arm_func_end PrintSpecialEpisodeClearMark

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
