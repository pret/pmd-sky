	.include "asm/macros.inc"
	.include "overlay_34_022DCBCC.inc"

	.text

	arm_func_start ov34_022DCBCC
ov34_022DCBCC: ; 0x022DCBCC
	stmdb sp!, {r3, lr}
	ldr r0, _022DCBEC ; =OVERLAY34_UNKNOWN_STRUCT__NA_22DD014
	bl InitMenu
	cmp r0, #0
	ldrne r0, _022DCBF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	movne r1, #0
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCBEC: .word OVERLAY34_UNKNOWN_STRUCT__NA_22DD014
_022DCBF0: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	arm_func_end ov34_022DCBCC

	arm_func_start ov34_022DCBF4
ov34_022DCBF4: ; 0x022DCBF4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _022DCC84 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	mov ip, #1
	str r0, [r1]
	ldr r3, _022DCC88 ; =START_MENU_ITEMS_CONFIRM
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x31
	str ip, [sp]
	bl CreateParentMenuFromStringIds
	ldr r1, _022DCC84 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _022DCC84 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r1, _022DCC8C ; =0x00000408
	ldr ip, [r3]
#ifdef JAPAN
	add r2, r1, #0xde
#else
	ldr r2, _022DCC90 ; =0x00000255
#endif
	strb r0, [ip, #1]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowStringIdInDialogueBox
	ldr r1, _022DCC84 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	add sp, sp, #0x98
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCC84: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD084
_022DCC88: .word START_MENU_ITEMS_CONFIRM
_022DCC8C: .word 0x00000408
#ifndef JAPAN
_022DCC90: .word 0x00000255
#endif
	arm_func_end ov34_022DCBF4

	arm_func_start ov34_022DCC94
ov34_022DCC94: ; 0x022DCC94
	stmdb sp!, {r3, lr}
	ldr r0, _022DCCDC ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _022DCCDC ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _022DCCDC ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DCCDC ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCCDC: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	arm_func_end ov34_022DCC94

	arm_func_start ov34_022DCCE0
ov34_022DCCE0: ; 0x022DCCE0
	stmdb sp!, {r3, lr}
	ldr r0, _022DCDC8 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _022DCD0C
	cmp r1, #1
	beq _022DCD54
	cmp r1, #2
	beq _022DCD8C
	b _022DCDC0
_022DCD0C:
	ldrsb r0, [r2]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _022DCDC0
	ldr r0, _022DCDC8 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _022DCDC8 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	str r0, [r1, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _022DCDC8 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _022DCDC0
_022DCD54:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _022DCDC0
	ldr r0, _022DCDC8 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _022DCDC8 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _022DCDC0
_022DCD8C:
	mov r1, #3
	str r1, [r2, #4]
	ldr r0, [r0, #4]
	cmp r0, #2
	bne _022DCDA8
	mov r0, #2
	b _022DCDAC
_022DCDA8:
	mov r0, #1
_022DCDAC:
	cmp r0, #0
	beq _022DCDB8
	bl ov34_022DC718
_022DCDB8:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022DCDC0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCDC8: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD084
	arm_func_end ov34_022DCCE0

	arm_func_start ov34_022DCDCC
ov34_022DCDCC: ; 0x022DCDCC
	stmdb sp!, {r3, lr}
	ldr r0, _022DCDEC ; =OVERLAY34_UNKNOWN_STRUCT__NA_22DD03C
	bl InitMenu
	cmp r0, #0
	ldrne r0, _022DCDF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	movne r1, #0
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCDEC: .word OVERLAY34_UNKNOWN_STRUCT__NA_22DD03C
_022DCDF0: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	arm_func_end ov34_022DCDCC

	arm_func_start ov34_022DCDF4
ov34_022DCDF4: ; 0x022DCDF4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _022DCE7C ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r3, _022DCE80 ; =DUNGEON_DEBUG_MENU_ITEMS
	str r0, [r1]
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x11
	bl CreateParentMenuFromStringIds
	ldr r1, _022DCE7C ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _022DCE7C ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r1, _022DCE84 ; =0x00000408
	ldr ip, [r3]
	ldr r2, _022DCE88 ; =0x00003D1C
	strb r0, [ip, #1]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0, #1]
	bl ShowStringIdInDialogueBox
	ldr r1, _022DCE7C ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	add sp, sp, #0x98
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCE7C: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
_022DCE80: .word DUNGEON_DEBUG_MENU_ITEMS
_022DCE84: .word 0x00000408
#if defined(EUROPE)
_022DCE88: .word 0x00003D1E
#elif defined(JAPAN)
_022DCE88: .word 0x0000050E
#else
_022DCE88: .word 0x00003D1C
#endif
	arm_func_end ov34_022DCDF4

	arm_func_start ov34_022DCE8C
ov34_022DCE8C: ; 0x022DCE8C
	stmdb sp!, {r3, lr}
	ldr r0, _022DCED4 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _022DCED4 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _022DCED4 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DCED4 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCED4: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	arm_func_end ov34_022DCE8C

	arm_func_start ov34_022DCED8
ov34_022DCED8: ; 0x022DCED8
	stmdb sp!, {r3, lr}
	ldr r0, _022DCFF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #0
	beq _022DCF04
	cmp r1, #1
	beq _022DCF4C
	cmp r1, #2
	beq _022DCF84
	b _022DCFE8
_022DCF04:
	ldrsb r0, [r3]
	bl CheckParentMenuField0x1A0
	cmp r0, #0
	bne _022DCFE8
	ldr r0, _022DCFF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _022DCFF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	str r0, [r1, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _022DCFF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _022DCFE8
_022DCF4C:
	ldrsb r0, [r3]
	bl IsParentMenuActive
	cmp r0, #0
	bne _022DCFE8
	ldr r0, _022DCFF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _022DCFF0 ; =OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _022DCFE8
_022DCF84:
	mov r2, #3
	str r2, [r3, #4]
	ldr r1, [r0, #4]
	mov r0, #0
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _022DCFD4
_022DCFA0: ; jump table
	b _022DCFD4 ; case 0
	b _022DCFD4 ; case 1
	b _022DCFB8 ; case 2
	b _022DCFC0 ; case 3
	b _022DCFC8 ; case 4
	b _022DCFD0 ; case 5
_022DCFB8:
	mov r0, r2
	b _022DCFD4
_022DCFC0:
	mov r0, #4
	b _022DCFD4
_022DCFC8:
	mov r0, #5
	b _022DCFD4
_022DCFD0:
	mov r0, #6
_022DCFD4:
	cmp r0, #0
	beq _022DCFE0
	bl ov34_022DC718
_022DCFE0:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022DCFE8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DCFF0: .word OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
	arm_func_end ov34_022DCED8
	; 0x022DCFF4

	.rodata
	.global ov34_022DCFF4
ov34_022DCFF4:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x6E, 0x5F, 0x6C, 0x6F, 0x67, 0x6F, 0x2E, 0x62, 0x67, 0x70, 0x00
#ifdef NORTH_AMERICA
	.global ov34_022DD004
ov34_022DD004:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x77, 0x5F, 0x65, 0x73, 0x72, 0x62, 0x2E, 0x62, 0x67, 0x70, 0x00
#endif
	.global OVERLAY34_UNKNOWN_STRUCT__NA_22DD014
OVERLAY34_UNKNOWN_STRUCT__NA_22DD014:
	.byte 0x0F, 0x00, 0x00, 0x00
	.word ov34_022DCBF4
	.word ov34_022DCC94
	.word ov34_022DCCE0
	.global START_MENU_ITEMS_CONFIRM
START_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
	.byte 0xE7, 0x04, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0xE8, 0x04, 0x00, 0x00
#else
	.byte 0x56, 0x02, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x57, 0x02, 0x00, 0x00
#endif
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global OVERLAY34_UNKNOWN_STRUCT__NA_22DD03C
OVERLAY34_UNKNOWN_STRUCT__NA_22DD03C:
	.byte 0x0F, 0x00, 0x00, 0x00
	.word ov34_022DCDF4
	.word ov34_022DCE8C
	.word ov34_022DCED8
	.global DUNGEON_DEBUG_MENU_ITEMS
DUNGEON_DEBUG_MENU_ITEMS:
#if defined(EUROPE)
#define DUNGEON_DEBUG_MENU_OFFSET 2
#elif defined(JAPAN)
#define DUNGEON_DEBUG_MENU_OFFSET -0x380E
#else
#define DUNGEON_DEBUG_MENU_OFFSET 0
#endif
	.word 0x3D1D + DUNGEON_DEBUG_MENU_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x3D1E + DUNGEON_DEBUG_MENU_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x3D1F + DUNGEON_DEBUG_MENU_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3D20 + DUNGEON_DEBUG_MENU_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

	.data
	.global OVERLAY34_UNKNOWN_POINTER__NA_22DD080
OVERLAY34_UNKNOWN_POINTER__NA_22DD080:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY34_UNKNOWN_POINTER__NA_22DD084
OVERLAY34_UNKNOWN_POINTER__NA_22DD084:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY34_UNKNOWN_POINTER__NA_22DD08C
OVERLAY34_UNKNOWN_POINTER__NA_22DD08C:
	.byte 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov34_022DD0A0
ov34_022DD0A0:
	.space 0x10
	.global ov34_022DD0B0
ov34_022DD0B0:
	.space 0x10
	.global ov34_022DD0C0
ov34_022DD0C0:
	.space 0x44
	.global ov34_022DD104
ov34_022DD104:
	.space 0x5C
