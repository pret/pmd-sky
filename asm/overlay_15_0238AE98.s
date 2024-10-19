	.include "asm/macros.inc"
	.include "overlay_15_0238AE98.inc"

	.text

	arm_func_start ov15_0238AE98
ov15_0238AE98: ; 0x0238AE98
	stmdb sp!, {r3, lr}
	ldr r0, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r1, [r0, #0x80]
	mvn r0, #1
	cmp r1, r0
	beq _0238AEC4
	ldr r0, _0238AF44 ; =ov15_0238B11C
	bl Debug_Print0
_0238AEC4:
	ldr r1, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x82]
	cmp r1, r0
	beq _0238AEE4
	ldr r0, _0238AF48 ; =ov15_0238B12C
	bl Debug_Print0
_0238AEE4:
	ldr r1, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x83]
	cmp r1, r0
	beq _0238AF04
	ldr r0, _0238AF4C ; =ov15_0238B13C
	bl Debug_Print0
_0238AF04:
	ldr r1, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x84]
	cmp r1, r0
	beq _0238AF24
	ldr r0, _0238AF50 ; =ov15_0238B150
	bl Debug_Print0
_0238AF24:
	ldr r0, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238AF40 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238AF40: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
_0238AF44: .word ov15_0238B11C
_0238AF48: .word ov15_0238B12C
_0238AF4C: .word ov15_0238B13C
_0238AF50: .word ov15_0238B150
	arm_func_end ov15_0238AE98

	arm_func_start ov15_0238AF54
ov15_0238AF54: ; 0x0238AF54
	stmdb sp!, {r3, lr}
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0238B048
_0238AF70: ; jump table
	b _0238AF88 ; case 0
	b _0238AF94 ; case 1
	b _0238AFB0 ; case 2
	b _0238B03C ; case 3
	b _0238B048 ; case 4
	b _0238AFF4 ; case 5
_0238AF88:
	mov r0, #1
	str r0, [r1]
	b _0238B048
_0238AF94:
	bl ov15_0238A234
	cmp r0, #3
	ldreq r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0238B048
_0238AFB0:
	ldrsb r0, [r1, #0x80]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0238B048
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl HidePortraitBox
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl sub_0202F2C4
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _0238B048
_0238AFF4:
	ldrsb r0, [r1, #0x80]
	bl sub_0202836C
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x81]
	bl ClosePortraitBox
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	ldr r0, [r0]
	ldrsb r0, [r0, #0x80]
	bl CloseDialogueBox
	ldr r0, _0238B050 ; =OVERLAY15_UNKNOWN_POINTER__NA_238B180
	mov r3, #3
	ldr r2, [r0]
	sub r1, r3, #5
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #0x80]
	b _0238B048
_0238B03C:
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, pc}
_0238B048:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B050: .word OVERLAY15_UNKNOWN_POINTER__NA_238B180
	arm_func_end ov15_0238AF54
	; 0x0238B054

	.global BANK_MAIN_MENU_ITEMS
BANK_MAIN_MENU_ITEMS:
#ifdef JAPAN
#define OV15_DATA_OFFSET 0x2EC5
#else
#define OV15_DATA_OFFSET 0
#endif
	.word 0x36F + OV15_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x370 + OV15_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x371 + OV15_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x372 + OV15_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x12, 0x1E, 0x05
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_2
BANK_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x1C, 0x03
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_3
BANK_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x08, 0x0B, 0x07
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global BANK_WINDOW_PARAMS_4
BANK_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0A, 0x05
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
#ifndef EUROPE
	.global ov15_0238B0CC
ov15_0238B0CC:
	.byte 0x43, 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00
#endif
	.global ov15_0238B0D4
ov15_0238B0D4:
	.byte 0x52, 0x2D, 0x43, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov15_0238B0E0
ov15_0238B0E0:
	.byte 0x4D, 0x2D, 0x4F, 0x70
	.byte 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B0E8
ov15_0238B0E8:
	.byte 0x53, 0x2D, 0x43, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov15_0238B0F4
ov15_0238B0F4:
	.byte 0x4D, 0x65, 0x6E, 0x75, 0x5F, 0x42, 0x61, 0x6E, 0x6B, 0x5F, 0x4D, 0x6F, 0x64, 0x65, 0x5F, 0x43
	.byte 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00, 0x00
	.global ov15_0238B10C
ov15_0238B10C:
	.byte 0x50, 0x2D, 0x4F, 0x70, 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B114
ov15_0238B114:
	.byte 0x47, 0x2D, 0x4F, 0x70, 0x65, 0x6E, 0x0A, 0x00
	.global ov15_0238B11C
ov15_0238B11C:
	.byte 0x6D, 0x65, 0x73, 0x20, 0x6E, 0x6F, 0x74, 0x20
	.byte 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00
	.global ov15_0238B12C
ov15_0238B12C:
	.byte 0x73, 0x75, 0x62, 0x20, 0x6E, 0x6F, 0x74, 0x20
	.byte 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00
	.global ov15_0238B13C
ov15_0238B13C:
	.byte 0x73, 0x65, 0x6C, 0x65, 0x63, 0x74, 0x20, 0x6E
	.byte 0x6F, 0x74, 0x20, 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00
	.global ov15_0238B150
ov15_0238B150:
	.byte 0x49, 0x6E, 0x70, 0x75
	.byte 0x74, 0x20, 0x6E, 0x6F, 0x74, 0x20, 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x0A, 0x00, 0x00, 0x00, 0x00

	.data
	.global OVERLAY15_UNKNOWN_POINTER__NA_238B180
OVERLAY15_UNKNOWN_POINTER__NA_238B180:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
