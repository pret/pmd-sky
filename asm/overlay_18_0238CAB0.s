	.include "asm/macros.inc"
	.include "overlay_18_0238CAB0.inc"

	.text

	arm_func_start ov18_0238CAB0
ov18_0238CAB0: ; 0x0238CAB0
	ldr r0, _0238CAD0 ; =LINK_SHOP_PTR
	mov r3, #0x1000
	ldr r2, [r0]
	mov r1, #0x35
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CAD0: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CAB0

	arm_func_start ov18_0238CAD4
ov18_0238CAD4: ; 0x0238CAD4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldr r0, _0238CBD8 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0238CBD8 ; =LINK_SHOP_PTR
	ldr r2, [r1]
	strh r0, [r2, #0x8c]
	ldrh r0, [sp]
	tst r0, #8
	beq _0238CB8C
	ldr r1, [r1]
	ldrsb r0, [r1, #0xb]
	ldrsh r4, [r1, #0x8c]
	bl sub_0202C1E4
	ldr r0, _0238CBD8 ; =LINK_SHOP_PTR
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ADA8
	ldr r2, _0238CBD8 ; =LINK_SHOP_PTR
	mov lr, #0
	ldr r1, [r2]
	mov ip, #1
	str lr, [r1, #0x3a0]
	ldr r1, [r2]
	mov r3, #0x38
	add r1, r1, #0x300
	strh r0, [r1, #0xaa]
	ldr r0, [r2]
	strb ip, [r0, #0x3a6]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh lr, [r0, #0xa8]
	ldr r0, [r2]
	strb ip, [r0, #0x3ac]
	ldr r0, [r2]
	strb lr, [r0, #0x3ad]
	ldr r0, [r2]
	str r3, [r0, #0x80]
	b _0238CBD0
_0238CB8C:
	ldr r0, [r1]
	ldrsb r0, [r0, #0xb]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _0238CBD0
	ldr r0, _0238CBD8 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetAdvancedMenuResult
	mvn r1, #0
	cmp r0, r1
	bne _0238CBC8
	mov r0, #0x11
	bl ov18_0238BE28
	b _0238CBD0
_0238CBC8:
	mov r0, #0x36
	bl ov18_0238BE28
_0238CBD0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238CBD8: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CAD4

	arm_func_start ov18_0238CBDC
ov18_0238CBDC: ; 0x0238CBDC
	ldr r0, _0238CBFC ; =LINK_SHOP_PTR
	mov r3, #0x3000
	ldr r2, [r0]
	mov r1, #0x37
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CBFC: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CBDC

	arm_func_start ov18_0238CC00
ov18_0238CC00: ; 0x0238CC00
	stmdb sp!, {r4, lr}
	ldr r0, _0238CD84 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetAdvancedMenuResult
	ldr r1, _0238CD84 ; =LINK_SHOP_PTR
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0xc]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	ldr r0, _0238CD84 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc]
	bl GetSimpleMenuResult__0202B870
	sub r0, r0, #4
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0238CD5C
_0238CC50: ; jump table
	b _0238CCF0 ; case 0
	b _0238CD5C ; case 1
	b _0238CD5C ; case 2
	b _0238CD5C ; case 3
	b _0238CD5C ; case 4
	b _0238CD5C ; case 5
	b _0238CD5C ; case 6
	b _0238CD5C ; case 7
	b _0238CD5C ; case 8
	b _0238CC78 ; case 9
_0238CC78:
	ldr r1, _0238CD84 ; =LINK_SHOP_PTR
	mov r0, r4, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ADA8
	ldr r1, _0238CD84 ; =LINK_SHOP_PTR
	mov r4, r0
	ldr r0, [r1]
	str r4, [r0, #0x24]
	bl sub_020415BC
	cmp r0, #0
	mov r0, r4
	beq _0238CCCC
	bl sub_0203FD14
	ldr r0, _0238CD84 ; =LINK_SHOP_PTR
	mov r1, #0x3c
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
_0238CCCC:
	bl sub_02041614
	ldr r0, _0238CD84 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	mov r0, #0x3a
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CCF0:
	ldr r1, _0238CD84 ; =LINK_SHOP_PTR
	mov r0, r4, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ADA8
	ldr r2, _0238CD84 ; =LINK_SHOP_PTR
	mov r4, #0
	ldr r1, [r2]
	mov r3, #1
	str r4, [r1, #0x3a0]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0xaa]
	ldr r1, [r2]
	mov r0, #0x38
	strb r3, [r1, #0x3a6]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r4, [r1, #0xa8]
	ldr r1, [r2]
	strb r3, [r1, #0x3ac]
	ldr r1, [r2]
	strb r4, [r1, #0x3ad]
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CD5C:
	ldr r0, _0238CD84 ; =LINK_SHOP_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	cmp r0, r1
	beq _0238CD78
	bl ResumeAdvancedMenu
_0238CD78:
	mov r0, #0x34
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238CD84: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CC00

	arm_func_start ov18_0238CD88
ov18_0238CD88: ; 0x0238CD88
	ldr r0, _0238CDA8 ; =LINK_SHOP_PTR
	mov r3, #0x400
	ldr r2, [r0]
	mov r1, #0x39
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CDA8: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CD88

	arm_func_start ov18_0238CDAC
ov18_0238CDAC: ; 0x0238CDAC
	stmdb sp!, {r3, lr}
	bl sub_02041A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x34
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	arm_func_end ov18_0238CDAC

	arm_func_start ov18_0238CDC8
ov18_0238CDC8: ; 0x0238CDC8
	ldr r0, _0238CDE8 ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x3b
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CDE8: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CDC8

	arm_func_start ov18_0238CDEC
ov18_0238CDEC: ; 0x0238CDEC
	ldr ip, _0238CDF8 ; =ov18_0238BE28
	mov r0, #0x11
	bx ip
	.align 2, 0
_0238CDF8: .word ov18_0238BE28
	arm_func_end ov18_0238CDEC

	arm_func_start ov18_0238CDFC
ov18_0238CDFC: ; 0x0238CDFC
	ldr r0, _0238CE1C ; =LINK_SHOP_PTR
	mov r3, #0x14000
	ldr r2, [r0]
	mov r1, #0x3d
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CE1C: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CDFC

	arm_func_start ov18_0238CE20
ov18_0238CE20: ; 0x0238CE20
	stmdb sp!, {r4, lr}
	bl sub_020407EC
	movs r4, r0
	beq _0238CE44
	ldr r0, _0238CE84 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
_0238CE44:
	cmp r4, #1
	beq _0238CE6C
	cmp r4, #2
	beq _0238CE60
	cmp r4, #7
	beq _0238CE78
	ldmia sp!, {r4, pc}
_0238CE60:
	mov r0, #0x3e
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CE6C:
	mov r0, #0x11
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CE78:
	mov r0, #0x40
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238CE84: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CE20

	arm_func_start ov18_0238CE88
ov18_0238CE88: ; 0x0238CE88
	stmdb sp!, {r3, lr}
	ldr r0, _0238CED4 ; =LINK_SHOP_PTR
	mov r1, #0xc000
	ldr r0, [r0]
	str r1, [r0, #0x88]
	bl sub_02041094
	bl sub_02041154
	ldr r1, _0238CED4 ; =LINK_SHOP_PTR
	ldr r1, [r1]
	str r0, [r1, #0x24]
	mov r0, #4
	bl sub_02041154
	ldr r1, _0238CED4 ; =LINK_SHOP_PTR
	mov r2, #0x3f
	ldr r3, [r1]
	str r0, [r3, #0x28]
	ldr r0, [r1]
	str r2, [r0, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CED4: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CE88

	arm_func_start ov18_0238CED8
ov18_0238CED8: ; 0x0238CED8
	stmdb sp!, {r3, lr}
	bl sub_02041094
	ldr r0, _0238CF94 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xe]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	bl sub_0203FD38
	ldr r0, _0238CF94 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xe]
	bl GetSimpleMenuResult__0202B870
	sub r0, r0, #4
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238CF6C
_0238CF1C: ; jump table
	b _0238CF60 ; case 0
	b _0238CF6C ; case 1
	b _0238CF6C ; case 2
	b _0238CF6C ; case 3
	b _0238CF6C ; case 4
	b _0238CF6C ; case 5
	b _0238CF38 ; case 6
_0238CF38:
	bl sub_02041094
	bl sub_02041364
	cmp r0, #0
	beq _0238CF54
	mov r0, #0x42
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238CF54:
	mov r0, #0x45
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238CF60:
	mov r0, #0x40
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238CF6C:
	ldr r0, _0238CF94 ; =LINK_SHOP_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	cmp r0, r1
	beq _0238CF88
	bl ResumeAdvancedMenu
_0238CF88:
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CF94: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CED8

	arm_func_start ov18_0238CF98
ov18_0238CF98: ; 0x0238CF98
	stmdb sp!, {r4, lr}
	bl sub_0203FD38
	mov r4, r0
	bl sub_02041094
	cmp r0, #4
	blt _0238CFF0
	bl sub_0203FD2C
	ldr r2, _0238D030 ; =LINK_SHOP_PTR
	mov r1, r0
	ldr r0, [r2]
	mov r2, #8
	add r0, r0, #0xa6
	add r0, r0, #0x300
	bl memcpy
	ldr r0, _0238D030 ; =LINK_SHOP_PTR
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x3a0]
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r2, [r0, #0xa4]
	b _0238D010
_0238CFF0:
	ldr r0, _0238D030 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	str r4, [r0, #0x3a0]
	bl sub_02041094
	ldr r1, _0238D030 ; =LINK_SHOP_PTR
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xa4]
_0238D010:
	ldr r0, _0238D030 ; =LINK_SHOP_PTR
	mov r3, #0x400
	ldr r2, [r0]
	mov r1, #0x41
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D030: .word LINK_SHOP_PTR
	arm_func_end ov18_0238CF98

	arm_func_start ov18_0238D034
ov18_0238D034: ; 0x0238D034
	stmdb sp!, {r3, lr}
	bl sub_02041A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	arm_func_end ov18_0238D034

	arm_func_start ov18_0238D050
ov18_0238D050: ; 0x0238D050
	ldr r0, _0238D070 ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x43
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D070: .word LINK_SHOP_PTR
	arm_func_end ov18_0238D050

	arm_func_start ov18_0238D074
ov18_0238D074: ; 0x0238D074
	ldr r0, _0238D094 ; =LINK_SHOP_PTR
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x44
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D094: .word LINK_SHOP_PTR
	arm_func_end ov18_0238D074

	arm_func_start ov18_0238D098
ov18_0238D098: ; 0x0238D098
	stmdb sp!, {r4, lr}
	ldr r0, _0238D128 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238D128 ; =LINK_SHOP_PTR
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #0
	beq _0238D0E0
	cmp r0, #1
	beq _0238D11C
	ldmia sp!, {r4, pc}
_0238D0E0:
	mov r0, r4
	bl sub_02041484
	bl sub_0203FD2C
	ldrh r0, [r0, #4]
	bl sub_02041614
	ldr r0, _0238D128 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	ldr r0, _0238D128 ; =LINK_SHOP_PTR
	mov r1, #0x48
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
_0238D11C:
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D128: .word LINK_SHOP_PTR
	arm_func_end ov18_0238D098

	arm_func_start ov18_0238D12C
ov18_0238D12C: ; 0x0238D12C
	ldr r0, _0238D14C ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x46
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D14C: .word LINK_SHOP_PTR
	arm_func_end ov18_0238D12C

	arm_func_start ov18_0238D150
ov18_0238D150: ; 0x0238D150
	ldr r0, _0238D170 ; =LINK_SHOP_PTR
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x47
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D170: .word LINK_SHOP_PTR
	arm_func_end ov18_0238D150

	arm_func_start ov18_0238D174
ov18_0238D174: ; 0x0238D174
	stmdb sp!, {r4, lr}
	ldr r0, _0238D204 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238D204 ; =LINK_SHOP_PTR
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #0
	beq _0238D1BC
	cmp r0, #1
	beq _0238D1F8
	ldmia sp!, {r4, pc}
_0238D1BC:
	mov r0, r4
	bl sub_02041484
	bl sub_0203FD2C
	ldrh r0, [r0, #4]
	bl sub_02041614
	ldr r0, _0238D204 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	ldr r0, _0238D204 ; =LINK_SHOP_PTR
	mov r1, #0x4a
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
_0238D1F8:
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D204: .word LINK_SHOP_PTR
	arm_func_end ov18_0238D174
	; 0x0238D208

	.rodata
	.global ov18_0238D208
ov18_0238D208:
	.byte 0x18, 0x00, 0x9F, 0xE5, 0x03, 0x30, 0xA0, 0xE3, 0x00, 0x20, 0x90, 0xE5, 0x49, 0x10, 0xA0, 0xE3
	.byte 0x88, 0x30, 0x82, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x80, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1
	.word LINK_SHOP_PTR
	.global ov18_0238D22C
ov18_0238D22C:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x11, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1
	.word ov18_0238BE28
	.global ov18_0238D23C
ov18_0238D23C:
	.byte 0x18, 0x00, 0x9F, 0xE5, 0x03, 0x30, 0xA0, 0xE3, 0x00, 0x20, 0x90, 0xE5
	.byte 0x4B, 0x10, 0xA0, 0xE3, 0x88, 0x30, 0x82, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x80, 0x10, 0x80, 0xE5
	.byte 0x1E, 0xFF, 0x2F, 0xE1
	.word LINK_SHOP_PTR
	.global ov18_0238D260
ov18_0238D260:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x11, 0x00, 0xA0, 0xE3
	.byte 0x1C, 0xFF, 0x2F, 0xE1
	.word ov18_0238BE28
	.global LINK_SHOP_WINDOW_PARAMS_1
LINK_SHOP_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x04
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_2
LINK_SHOP_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_3
LINK_SHOP_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_4
LINK_SHOP_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_5
LINK_SHOP_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_6
LINK_SHOP_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_7
LINK_SHOP_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x0B, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_8
LINK_SHOP_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x02, 0x0B, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_9
LINK_SHOP_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_10
LINK_SHOP_WINDOW_PARAMS_10:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x12, 0x1C, 0x04
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_11
LINK_SHOP_WINDOW_PARAMS_11:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x11, 0x1C, 0x05
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_MENU_ITEMS_CONFIRM
LINK_SHOP_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV18_DATA_OFFSET 0x3926
#define OV18_DATA_OFFSET_2 -0x1C5
#else
#define OV18_DATA_OFFSET 0
#define OV18_DATA_OFFSET_2 0
#define OV18_DATA_OFFSET_2 0
#endif
	.word 0x3E7 + OV18_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x3E8 + OV18_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_1
LINK_SHOP_SUBMENU_ITEMS_1:
	.word 0x3F3 + OV18_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_2
LINK_SHOP_SUBMENU_ITEMS_2:
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_MAIN_MENU_ITEMS
LINK_SHOP_MAIN_MENU_ITEMS:
	.word 0x3EA + OV18_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_3
LINK_SHOP_SUBMENU_ITEMS_3:
	.word 0x3ED + OV18_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3F3 + OV18_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3E9 + OV18_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_4
LINK_SHOP_SUBMENU_ITEMS_4:
	.word 0x3F4 + OV18_DATA_OFFSET
	.byte 0x0E, 0x00, 0x00, 0x00
	.word 0x3F5 + OV18_DATA_OFFSET
	.byte 0x0F, 0x00, 0x00, 0x00
	.word 0x3F6 + OV18_DATA_OFFSET
	.byte 0x10, 0x00, 0x00, 0x00
	.word 0x3F3 + OV18_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_5
LINK_SHOP_SUBMENU_ITEMS_5:
	.word 0x3ED + OV18_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3EF + OV18_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0xA3F + OV18_DATA_OFFSET_2
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0xA40 + OV18_DATA_OFFSET_2
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_6
LINK_SHOP_SUBMENU_ITEMS_6:
	.word 0x3F1 + OV18_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3EF + OV18_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0xA3F + OV18_DATA_OFFSET_2
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0xA40 + OV18_DATA_OFFSET_2
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_7
LINK_SHOP_SUBMENU_ITEMS_7:
	.word 0x3F2 + OV18_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3EF + OV18_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0xA3F + OV18_DATA_OFFSET_2
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0xA40 + OV18_DATA_OFFSET_2
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.global OVERLAY18_FUNCTION_POINTER_TABLE
OVERLAY18_FUNCTION_POINTER_TABLE:
	.word ov18_0238BE48
	.word ov18_0238BE6C
	.word ov18_0238BE90
	.word ov18_0238BF0C
	.word ov18_0238BF30
	.word ov18_0238BF60
	.word ov18_0238BF84
	.word ov18_0238BFA8
	.word ov18_0238C03C
	.word ov18_0238C060
	.word ov18_0238C078
	.word ov18_0238C060
	.word ov18_0238C09C
	.word ov18_0238C0C0
	.word ov18_0238C0D8
	.word ov18_0238C0FC
	.word ov18_0238C114
	.word ov18_0238C13C
	.word ov18_0238C164
	.word ov18_0238C21C
	.word ov18_0238C240
	.word ov18_0238C258
	.word ov18_0238C27C
	.word ov18_0238C340
	.word ov18_0238C364
	.word ov18_0238C398
	.word ov18_0238C3C0
	.word ov18_0238C428
	.word ov18_0238C47C
	.word ov18_0238C4A0
	.word ov18_0238C4E8
	.word ov18_0238C504
	.word ov18_0238C528
	.word ov18_0238C720
	.word ov18_0238C78C
	.word ov18_0238C7B0
	.word ov18_0238C7C0
	.word ov18_0238C7E4
	.word ov18_0238C808
	.word ov18_0238C888
	.word ov18_0238C8AC
	.word ov18_0238C8D0
	.word ov18_0238C950
	.word ov18_0238C974
	.word ov18_0238C984
	.word ov18_0238C9A8
	.word ov18_0238C9B8
	.word ov18_0238CA18
	.word ov18_0238CA3C
	.word ov18_0238CA4C
	.word ov18_0238CA70
	.word ov18_0238CA80
	.word ov18_0238CAB0
	.word ov18_0238CAD4
	.word ov18_0238CBDC
	.word ov18_0238CC00
	.word ov18_0238CD88
	.word ov18_0238CDAC
	.word ov18_0238CDC8
	.word ov18_0238CDEC
	.word ov18_0238CDFC
	.word ov18_0238CE20
	.word ov18_0238CE88
	.word ov18_0238CED8
	.word ov18_0238CF98
	.word ov18_0238D034
	.word ov18_0238D050
	.word ov18_0238D074
	.word ov18_0238D098
	.word ov18_0238D12C
	.word ov18_0238D150
	.word ov18_0238D174
	.word ov18_0238D208
	.word ov18_0238D22C
	.word ov18_0238D23C
	.word ov18_0238D260
	.global ov18_0238D5F8
ov18_0238D5F8:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x25, 0x63, 0x5D, 0x25, 0x73, 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00, 0x00
	.global ov18_0238D608
ov18_0238D608:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x56, 0x5D, 0x5B, 0x67, 0x6F, 0x6C, 0x64, 0x3A, 0x30, 0x5D, 0x5B, 0x43
	.byte 0x52, 0x5D, 0x00, 0x00

	.data
	.global LINK_SHOP_PTR
LINK_SHOP_PTR:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
