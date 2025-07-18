	.include "asm/macros.inc"
	.include "overlay_31_0238367C.inc"

	.text

	arm_func_start ov31_0238367C
ov31_0238367C: ; 0x0238367C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x5c
	bl GetLeader
	mov r1, #0
	mov r2, #0xb
	bl GetItemToUse
	ldrsh r1, [r0, #4]
	mov r2, #0
	add lr, sp, #0xc
	str r1, [sp, #0x1c]
	ldrh r4, [r0, #2]
	ldr r1, _02383720 ; =0x00001013
	ldr r3, _02383724 ; =0x000008E4
	str r4, [sp, #0x30]
	ldrh r4, [r0, #2]
	add r4, r4, #0xbc
	str r4, [sp, #0x24]
	str r2, [sp, #0x38]
	str lr, [sp]
	ldrsh r4, [r0, #4]
	ldr r0, _02383728 ; =DUNGEON_WINDOW_PARAMS_8
#if defined(EUROPE)
	add ip, r4, #0xd3
	add r4, ip, #0x2900
#elif defined(JAPAN)
	add ip, r4, #0xce
	add r4, ip, #0x4100
#else
	add ip, r4, #0xd1
	add r4, ip, #0x2900
#endif
	mov ip, r4, lsl #0x10
	mov r4, ip, lsr #0x10
	stmib sp, {r4, lr}
	bl CreateScrollBoxSingle
	mov r5, r0
	mov r4, #0x16
_023836F0:
	mov r0, r4
	bl AdvanceFrame
	mov r0, r5
	bl IsScrollBoxActive
	cmp r0, #0
	bne _023836F0
	mov r0, r5
	bl CloseScrollBox
	mov r0, #0x16
	bl AdvanceFrame
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02383720: .word 0x00001013
#ifdef JAPAN
_02383724: .word 0x00001D3C
#else
_02383724: .word 0x000008E4
#endif
_02383728: .word DUNGEON_WINDOW_PARAMS_8
	arm_func_end ov31_0238367C

	arm_func_start ov31_0238372C
ov31_0238372C: ; 0x0238372C
	stmdb sp!, {r3, lr}
	ldr r1, _02383764 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r1, [r1, #0x1b1]
	cmp r1, #0
	beq _0238375C
	add r0, r0, #4
	bl PositionHasItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_0238375C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383764: .word OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	arm_func_end ov31_0238372C

	arm_func_start ov31_02383768
ov31_02383768: ; 0x02383768
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsb r0, [r7]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov10_022BCD10
	cmp r0, #0
	beq _023837B4
	mvn r4, #3
	sub r5, r4, #1
	mov r6, #0x62
_02383798:
	mov r0, r6
	bl AdvanceFrame
	ldrsb r0, [r7]
	bl sub_020282F4
	cmp r0, r5
	cmpne r0, r4
	bne _02383798
_023837B4:
	ldrsb r0, [r7]
	bl CloseInventoryMenu
	mvn r0, #1
	strb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov31_02383768

	arm_func_start ov31_023837C8
ov31_023837C8: ; 0x023837C8
	stmdb sp!, {r3, lr}
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x92
	add r0, r0, #0x1100
	bl ov29_0234E988
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x94]
	cmp r0, r1
	beq _02383800
	bl CloseTextBox2
_02383800:
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x95]
	cmp r0, r1
	beq _02383820
	bl CloseTextBox2
_02383820:
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x93
	add r0, r0, #0x1100
	bl ov31_02383768
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383850: .word OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	arm_func_end ov31_023837C8

