	.include "asm/function.inc"
	.include "arm7.inc"

	.text

	arm_func_start sub_02000000
sub_02000000: @ 0x02000000
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _020000E4 @ =0x023801E8
	mov r0, #0x3800000
	cmp r0, r1
	bpl _0200001C
	b _02000020
_0200001C:
	mov r1, r0
_02000020:
	ldr r2, _020000E8 @ =0x0380FF00
	mov r0, #0
_02000028:
	cmp r1, r2
	blt _02000034
	b _02000038
_02000034:
	stm r1!, {r0}
_02000038:
	blt _02000028
	mov r0, #0x13
	msr cpsr_c, r0
	ldr sp, _020000EC @ =0x0380FFC0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _020000F0 @ =0x0380FF80
	mov sp, r0
	ldr r1, _020000F4 @ =0x00000400
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	ldr r0, _020000F8 @ =0x023FE940
	ldr r1, _020000FC @ =0x027FFA80
	add r2, r1, #0x160
_02000078:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02000078
	ldr r0, _02000100 @ =0x023FE904
	add r2, r1, #0x20
_02000090:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, r2
	bmi _02000090
	bl sub_02000118
	ldr r0, _02000104 @ =0x023801D0
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r0, #0
_020000B4:
	cmp r1, r2
	blo _020000C0
	b _020000C4
_020000C0:
	str r0, [r1], #4
_020000C4:
	blo _020000B4
	bl sub_0200018C
	ldr r1, _02000108 @ =0x0380FFFC
	ldr r0, _0200010C @ =0x037FB488
	str r0, [r1]
	ldr r1, _02000110 @ =FUN_037F8000
	ldr lr, _02000114 @ =0xFFFF0000
	bx r1
	.align 2, 0
_020000E4: .4byte 0x023801E8
_020000E8: .4byte 0x0380FF00
_020000EC: .4byte 0x0380FFC0
_020000F0: .4byte 0x0380FF80
_020000F4: .4byte 0x00000400
_020000F8: .4byte 0x023FE940
_020000FC: .4byte 0x027FFA80
_02000100: .4byte 0x023FE904
_02000104: .4byte 0x023801D0
_02000108: .4byte 0x0380FFFC
_0200010C: .4byte 0x037FB488
_02000110: .4byte FUN_037F8000
_02000114: .4byte 0xFFFF0000
	arm_func_end sub_02000000

	arm_func_start sub_02000118
sub_02000118: ; 0x02000118
	ldr r0, _02000184 ; =0x023801D0
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02000128:
	cmp r1, r2
	beq _02000180
	ldr r4, [r1], #4
	ldr r5, [r1], #4
	add r6, r4, r5
_0200013C:
	cmp r4, r6
	bmi _02000148
	b _0200014C
_02000148:
	ldr r7, [r3], #4
_0200014C:
	bmi _02000154
	b _02000158
_02000154:
	str r7, [r4], #4
_02000158:
	bmi _0200013C
	ldr r5, [r1], #4
	add r6, r4, r5
	mov r7, #0
_02000168:
	cmp r4, r6
	blo _02000174
	b _02000178
_02000174:
	str r7, [r4], #4
_02000178:
	blo _02000168
	beq _02000128
_02000180:
	b _02000188
	.align 2, 0
_02000184: .word 0x023801D0
_02000188:
	bx lr
	arm_func_end sub_02000118

	arm_func_start sub_0200018C
sub_0200018C: ; 0x0200018C
	mov r0, #1
	mov r1, #0
	ldr r2, _020001CC ; =0x027FFFFA
	sub r3, r2, #0x400000
_0200019C:
	strh r1, [r2]
	ldrh ip, [r3]
	cmp r1, ip
	bne _020001B0
	b _020001B4
_020001B0:
	mov r0, #2
_020001B4:
	bne _020001C4
	add r1, r1, #1
	cmp r1, #2
	bne _0200019C
_020001C4:
	strh r0, [r2]
	bx lr
	.align 2, 0
_020001CC: .word 0x027FFFFA
	arm_func_end sub_0200018C
_020001D0:
	.byte 0x68, 0x70, 0x3A, 0x02, 0x80, 0x70, 0x3A, 0x02, 0xE8, 0x01, 0x38, 0x02, 0xE8, 0x01, 0x38, 0x02
	.byte 0xE8, 0x01, 0x38, 0x02, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x4F, 0x2D, 0xE9, 0x21, 0xDE, 0x4D, 0xE2
	.byte 0x77, 0x12, 0x00, 0xEB, 0xD4, 0x0F, 0x00, 0xEB, 0x04, 0x20, 0x8D, 0xE2, 0x20, 0x00, 0xA0, 0xE3
	.byte 0x02, 0x10, 0xA0, 0xE3, 0x65, 0xF5, 0xBF, 0xEB, 0x04, 0x00, 0x9D, 0xE5, 0x10, 0x20, 0x8D, 0xE2
	.byte 0x80, 0x01, 0xA0, 0xE1, 0x04, 0x00, 0x8D, 0xE5, 0x01, 0x1C, 0xA0, 0xE3, 0x5F, 0xF5, 0xBF, 0xEB
	.byte 0x04, 0x00, 0x9D, 0xE5, 0x11, 0x2E, 0x8D, 0xE2, 0x01, 0x0C, 0x80, 0xE2, 0x01, 0x1C, 0xA0, 0xE3
	.byte 0x5A, 0xF5, 0xBF, 0xEB, 0x1D, 0x00, 0xA0, 0xE3, 0x01, 0x10, 0xA0, 0xE3, 0x00, 0x20, 0x8D, 0xE2
	.byte 0x00, 0x60, 0xA0, 0xE3, 0x55, 0xF5, 0xBF, 0xEB, 0x00, 0x00, 0xDD, 0xE5, 0xFF, 0x00, 0x50, 0xE3
	.byte 0x06, 0x00, 0xA0, 0x01, 0x02, 0x00, 0x00, 0x0A, 0x50, 0x00, 0x10, 0xE3, 0x01, 0x00, 0xA0, 0x13
	.byte 0x06, 0x00, 0xA0, 0x01, 0x00, 0x00, 0x50, 0xE3, 0x32, 0x00, 0x00, 0x0A, 0xFE, 0x00, 0x00, 0xEB
	.byte 0x00, 0x80, 0xA0, 0xE1, 0x01, 0xB0, 0xA0, 0xE3, 0x40, 0x70, 0x08, 0xE2, 0x00, 0xA0, 0xA0, 0xE3
	.byte 0x10, 0x50, 0x8D, 0xE2, 0x0B, 0x40, 0xA0, 0xE1, 0x27, 0x00, 0x00, 0xEA, 0xA8, 0x03, 0x9F, 0xE5
	.byte 0x0A, 0x94, 0x85, 0xE0, 0x09, 0x10, 0xA0, 0xE1, 0x70, 0x20, 0xA0, 0xE3, 0xEC, 0x00, 0x00, 0xEB
	.byte 0x09, 0x20, 0xA0, 0xE1, 0xB2, 0x17, 0xD2, 0xE1, 0x01, 0x00, 0x50, 0xE1, 0x1B, 0x00, 0x00, 0x1A
	.byte 0xB0, 0x07, 0xD2, 0xE1, 0x80, 0x00, 0x50, 0xE3, 0x18, 0x00, 0x00, 0x2A, 0x78, 0x03, 0x9F, 0xE5
	.byte 0x8A, 0x20, 0xA0, 0xE3, 0x74, 0x10, 0x89, 0xE2, 0xE1, 0x00, 0x00, 0xEB, 0x09, 0x20, 0xA0, 0xE1
	.byte 0xBE, 0x1F, 0xD2, 0xE1, 0x01, 0x00, 0x50, 0xE1, 0x10, 0x00, 0x00, 0x1A, 0xB6, 0x17, 0xD2, 0xE1
	.byte 0x75, 0x00, 0xD2, 0xE5, 0x14, 0x00, 0x11, 0xE1, 0x0C, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x18, 0xE1
	.byte 0xB4, 0x16, 0xD9, 0x11, 0x07, 0x00, 0x00, 0x12, 0x07, 0x10, 0xC1, 0x13, 0x00, 0x00, 0x81, 0x11
	.byte 0xB4, 0x06, 0xC9, 0x11, 0x0A, 0x04, 0x85, 0xE0, 0xB6, 0x07, 0xD0, 0xE1, 0x00, 0x00, 0xE0, 0xE1
	.byte 0x00, 0x00, 0x17, 0xE1, 0x03, 0x60, 0xA0, 0x13, 0x2E, 0x00, 0x00, 0x1A, 0x1B, 0x6A, 0x86, 0xE1
	.byte 0x01, 0x00, 0x8A, 0xE2, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0xA8, 0xA0, 0xE1, 0x02, 0x00, 0x5A, 0xE3
	.byte 0xD5, 0xFF, 0xFF, 0x3A, 0x18, 0x00, 0x00, 0xEA, 0xCB, 0x00, 0x00, 0xEB, 0x40, 0x00, 0x10, 0xE3
	.byte 0x03, 0x60, 0xA0, 0x13, 0x23, 0x00, 0x00, 0x1A, 0xEC, 0x82, 0x9F, 0xE5, 0x00, 0x90, 0xA0, 0xE3
	.byte 0x10, 0x70, 0x8D, 0xE2, 0x01, 0x40, 0xA0, 0xE3, 0x70, 0x50, 0xA0, 0xE3, 0x08, 0x00, 0xA0, 0xE1
	.byte 0x05, 0x20, 0xA0, 0xE1, 0x09, 0x14, 0x87, 0xE0, 0xB9, 0x00, 0x00, 0xEB, 0x09, 0x24, 0x87, 0xE0
	.byte 0xB2, 0x17, 0xD2, 0xE1, 0x01, 0x00, 0x50, 0xE1, 0x02, 0x00, 0x00, 0x1A, 0xB0, 0x07, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x50, 0xE3, 0x14, 0x69, 0x86, 0x31, 0x01, 0x00, 0x89, 0xE2, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x98, 0xA0, 0xE1, 0x02, 0x00, 0x59, 0xE3, 0xEF, 0xFF, 0xFF, 0x3A, 0x01, 0x00, 0x56, 0xE3
	.byte 0x02, 0x00, 0x56, 0x13, 0x0B, 0x00, 0x00, 0x0A, 0x03, 0x00, 0x56, 0xE3, 0x08, 0x00, 0x00, 0x1A
	.byte 0xB0, 0x18, 0xDD, 0xE1, 0x01, 0x0C, 0x8D, 0xE2, 0x01, 0x10, 0x81, 0xE2, 0xB0, 0x08, 0xD0, 0xE1
	.byte 0x7F, 0x10, 0x01, 0xE2, 0x00, 0x00, 0x51, 0xE1, 0x02, 0x60, 0xA0, 0x03, 0x01, 0x60, 0xA0, 0x13
	.byte 0x00, 0x00, 0x00, 0xEA, 0x00, 0x60, 0xA0, 0xE3, 0x03, 0x00, 0x56, 0xE3, 0x04, 0x00, 0x00, 0xBA
	.byte 0x58, 0x12, 0x9F, 0xE5, 0x00, 0x00, 0xE0, 0xE3, 0x74, 0x20, 0xA0, 0xE3, 0x71, 0x17, 0x00, 0xEB
	.byte 0x2E, 0x00, 0x00, 0xEA, 0x00, 0x00, 0x56, 0xE3, 0x28, 0x00, 0x00, 0x0A, 0x40, 0x02, 0x9F, 0xE5
	.byte 0x06, 0x14, 0xA0, 0xE1, 0x00, 0x00, 0x8D, 0xE0, 0x06, 0x04, 0xD0, 0xE7, 0x0A, 0x00, 0x50, 0xE3
	.byte 0x0A, 0x00, 0x00, 0x2A, 0x10, 0x00, 0x8D, 0xE2, 0x0A, 0x30, 0xA0, 0xE3, 0x00, 0x20, 0xA0, 0xE3
	.byte 0x01, 0x10, 0x80, 0xE0, 0x02, 0x00, 0x00, 0xEA, 0x83, 0x00, 0x81, 0xE0, 0xBC, 0x2F, 0x40, 0xE1
	.byte 0x01, 0x30, 0x43, 0xE2, 0xE6, 0x00, 0x51, 0xE5, 0x00, 0x00, 0x53, 0xE1, 0xF9, 0xFF, 0xFF, 0xCA
	.byte 0x00, 0x02, 0x9F, 0xE5, 0x06, 0x14, 0xA0, 0xE1, 0x00, 0x00, 0x8D, 0xE0, 0x06, 0x04, 0xD0, 0xE7
	.byte 0x1A, 0x00, 0x50, 0xE3, 0x0A, 0x00, 0x00, 0x2A, 0x10, 0x00, 0x8D, 0xE2, 0x1A, 0x30, 0xA0, 0xE3
	.byte 0x00, 0x20, 0xA0, 0xE3, 0x01, 0x10, 0x80, 0xE0, 0x02, 0x00, 0x00, 0xEA, 0x83, 0x00, 0x81, 0xE0
	.byte 0xB6, 0x2E, 0x40, 0xE1, 0x01, 0x30, 0x43, 0xE2, 0xB0, 0x00, 0x51, 0xE5, 0x00, 0x00, 0x53, 0xE1
	.byte 0xF9, 0xFF, 0xFF, 0xCA, 0xB4, 0x11, 0x9F, 0xE5, 0x10, 0x20, 0x8D, 0xE2, 0x01, 0x00, 0x46, 0xE2
	.byte 0x00, 0x04, 0x82, 0xE0, 0x74, 0x20, 0xA0, 0xE3, 0x4D, 0x17, 0x00, 0xEB, 0x03, 0x00, 0x00, 0xEA
	.byte 0x98, 0x11, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x74, 0x20, 0xA0, 0xE3, 0x41, 0x17, 0x00, 0xEB
	.byte 0x08, 0x20, 0x8D, 0xE2, 0x36, 0x00, 0xA0, 0xE3, 0x06, 0x10, 0xA0, 0xE3, 0xB7, 0xF4, 0xBF, 0xEB
	.byte 0x78, 0x41, 0x9F, 0xE5, 0x08, 0x00, 0x8D, 0xE2, 0x74, 0x10, 0x84, 0xE2, 0x06, 0x20, 0xA0, 0xE3
	.byte 0x8F, 0x17, 0x00, 0xEB, 0x02, 0x20, 0x8D, 0xE2, 0x3C, 0x00, 0xA0, 0xE3, 0x02, 0x10, 0xA0, 0xE3
	.byte 0xAE, 0xF4, 0xBF, 0xEB, 0xB2, 0x00, 0xDD, 0xE1, 0x80, 0x07, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x31, 0x3C, 0x00, 0xEB, 0xBA, 0x07, 0xC4, 0xE1, 0xE7, 0x17, 0x00, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xDD, 0x11, 0x00, 0xEB, 0x00, 0x40, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3, 0xDF, 0x11, 0x00, 0xEB
	.byte 0x00, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3, 0x01, 0x30, 0xA0, 0xE3
	.byte 0xB9, 0x12, 0x00, 0xEB, 0x00, 0x40, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3, 0xD2, 0x11, 0x00, 0xEB
	.byte 0x04, 0x20, 0x40, 0xE0, 0x04, 0x00, 0xA0, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0x45, 0x17, 0x00, 0xEB
	.byte 0x04, 0x10, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3, 0x0A, 0x12, 0x00, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xC9, 0x11, 0x00, 0xEB, 0x00, 0x40, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3, 0xCB, 0x11, 0x00, 0xEB
	.byte 0x00, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3, 0xD0, 0x12, 0x00, 0xEB
	.byte 0x00, 0x40, 0xB0, 0xE1, 0x00, 0x00, 0x00, 0x5A, 0xB6, 0x16, 0x00, 0xEB, 0x04, 0x10, 0xA0, 0xE1
	.byte 0x08, 0x00, 0xA0, 0xE3, 0x93, 0x12, 0x00, 0xEB, 0x04, 0x10, 0xA0, 0xE1, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xEF, 0x12, 0x00, 0xEB, 0x21, 0x0C, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x2A, 0xAD, 0x16, 0x00, 0xEB
	.byte 0x06, 0x00, 0xA0, 0xE3, 0xCD, 0x1A, 0x00, 0xEB, 0x7E, 0x18, 0x00, 0xEB, 0x98, 0x10, 0x9F, 0xE5
	.byte 0x01, 0x00, 0xA0, 0xE3, 0xFA, 0x0C, 0x00, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0x45, 0x0D, 0x00, 0xEB
	.byte 0x88, 0x30, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE3, 0xB0, 0x10, 0xD3, 0xE1, 0xB0, 0x10, 0xD3, 0xE1
	.byte 0x81, 0x2F, 0x83, 0xE2, 0x08, 0x10, 0x81, 0xE3, 0xB0, 0x10, 0xC3, 0xE1, 0xB0, 0x10, 0xD2, 0xE1
	.byte 0xB0, 0x00, 0xC2, 0xE1, 0x3A, 0x16, 0x00, 0xEB, 0x00, 0x00, 0xE0, 0xE3, 0x83, 0x28, 0x00, 0xEB
	.byte 0x0F, 0x00, 0xA0, 0xE3, 0xB3, 0x28, 0x00, 0xEB, 0x0C, 0x00, 0xA0, 0xE3, 0x2A, 0xF6, 0xBF, 0xEB
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x89, 0x33, 0x00, 0xEB, 0x02, 0x00, 0xA0, 0xE3, 0x12, 0x2D, 0x00, 0xEB
	.byte 0x00, 0x40, 0xA0, 0xE3, 0x11, 0x00, 0x00, 0xEB, 0x5F, 0x16, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x00, 0x0A, 0x04, 0x00, 0xA0, 0xE1, 0x72, 0x38, 0x00, 0xEB, 0x6B, 0x16, 0x00, 0xEB
	.byte 0xFE, 0x38, 0x00, 0xEB, 0x9A, 0x2C, 0x00, 0xEB, 0xF5, 0xFF, 0xFF, 0xEA, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x80, 0xFC, 0x7F, 0x02, 0x2A, 0xFF, 0xFF, 0xFF, 0x60, 0xFF, 0xFF, 0xFF, 0xBC, 0x84, 0x7F, 0x03
	.byte 0x04, 0x00, 0x00, 0x04, 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1, 0x05, 0x38, 0x80, 0x03

	arm_func_start sub_02000660
sub_02000660: ; 0x02000660
	ldr ip, _02000668 ; =sub_038037D2
	bx ip
	.align 2, 0
_02000668: .word sub_038037D2
	arm_func_end sub_02000660
_0200066C:
	.byte 0x2C, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xD1, 0xE5, 0x80, 0x00, 0x51, 0xE3, 0x40, 0x00, 0x80, 0x03
	.byte 0x00, 0x08, 0xA0, 0x01, 0x20, 0x08, 0xA0, 0x01, 0x1E, 0xFF, 0x2F, 0x01, 0x40, 0x00, 0x51, 0xE3
	.byte 0x80, 0x00, 0x80, 0x03, 0x00, 0x08, 0xA0, 0x01, 0x20, 0x08, 0xA0, 0x01, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x1D, 0xFE, 0x7F, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x14, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5
	.byte 0x00, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x09, 0x33, 0x00, 0xEB, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x50, 0x9E, 0x80, 0x03, 0xF8, 0x43, 0x2D, 0xE9, 0xA0, 0x70, 0x9F, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x80, 0x97, 0xE5, 0x98, 0x40, 0x9F, 0xE5, 0xB0, 0x01, 0xC8, 0xE1
	.byte 0x94, 0x90, 0x9F, 0xE5, 0xB4, 0x01, 0xC8, 0xE1, 0x00, 0x60, 0x8D, 0xE2, 0x00, 0x50, 0xA0, 0xE1
	.byte 0x00, 0x00, 0x97, 0xE5, 0x06, 0x10, 0xA0, 0xE1, 0x08, 0x03, 0x90, 0xE5, 0x05, 0x20, 0xA0, 0xE1
	.byte 0x90, 0x10, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0x06, 0x00, 0xA0, 0xE1
	.byte 0x75, 0x00, 0x00, 0xEB, 0x04, 0x00, 0xA0, 0xE1, 0xFC, 0x0C, 0x00, 0xEB, 0xB0, 0x11, 0xD8, 0xE1
	.byte 0xB2, 0x11, 0xC8, 0xE1, 0x81, 0x10, 0xA0, 0xE1, 0xB1, 0x10, 0x98, 0xE1, 0x09, 0x00, 0x51, 0xE1
	.byte 0x04, 0x00, 0x00, 0x1A, 0xB0, 0x11, 0xD8, 0xE1, 0x01, 0x10, 0x81, 0xE2, 0xB0, 0x11, 0xC8, 0xE1
	.byte 0xE4, 0x0C, 0x00, 0xEB, 0xE9, 0xFF, 0xFF, 0xEA, 0xE2, 0x0C, 0x00, 0xEB, 0xB2, 0x01, 0xD8, 0xE1
	.byte 0x38, 0x00, 0x00, 0xEB, 0xB4, 0x01, 0xC8, 0xE1, 0xB4, 0x01, 0xD8, 0xE1, 0x80, 0x01, 0x88, 0xE0
	.byte 0xC0, 0x00, 0x90, 0xE5, 0x0F, 0xE0, 0xA0, 0xE1, 0x10, 0xFF, 0x2F, 0xE1, 0xB4, 0x91, 0xC8, 0xE1
	.byte 0xDE, 0xFF, 0xFF, 0xEA, 0xF4, 0xFF, 0x80, 0x03, 0x10, 0x00, 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x00

	arm_func_start sub_02000780
sub_02000780: ; 0x02000780
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02000830 ; =0x0380FFF4
	mov r7, r0
	ldr r4, [r2]
	ldr r0, _02000834 ; =0x01000010
	mov r6, r1
	add r5, r4, #0xbc
	bl sub_02003B10
	add r2, r5, r6, lsl #3
	ldrh r1, [r2, #2]
	mov ip, r6, lsl #3
	cmp r1, #0
	bne _020007F8
	mov r3, #1
	strh r3, [r2, #2]
	rsb r1, r3, #0x10000
	strh r1, [r5, ip]
	add r1, r4, r7, lsl #1
	ldrh r2, [r1, #8]
	rsb r1, r3, #0x10000
	cmp r2, r1
	mov r1, r7, lsl #1
	streqh r6, [r4, r1]
	addne r1, r4, r2, lsl #3
	strneh r6, [r1, #0xbc]
	add r1, r4, r7, lsl #1
	strh r6, [r1, #8]
	ldrh r1, [r4, #0x10]
	cmp r7, r1
	strlth r7, [r4, #0x10]
_020007F8:
	bl sub_02003AD8
	cmp r7, #3
	beq _02000828
	ldrh r0, [r4, #0x12]
	cmp r0, #3
	bne _02000828
	ldr r0, _02000830 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	ldr r0, [r0, #0x308]
	bl sub_020048BC
_02000828:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02000830: .word 0x0380FFF4
_02000834: .word 0x01000010
	arm_func_end sub_02000780

	arm_func_start sub_02000838
sub_02000838: ; 0x02000838
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020008A4 ; =0x0380FFF4
	mov r5, r0
	ldr r0, _020008A8 ; =0x01000010
	ldr r4, [r1]
	bl sub_02003B10
	mov lr, r5, lsl #1
	ldrh r5, [r4, lr]
	ldr r2, _020008AC ; =0x0000FFFF
	cmp r5, r2
	beq _02000894
	add ip, r4, #0xbc
	add r1, ip, r5, lsl #3
	mov r3, #0
	strh r3, [r1, #2]
	mov r3, r5, lsl #3
	ldrh r1, [ip, r3]
	cmp r1, r2
	streqh r2, [r4, lr]
	addeq r1, r4, lr
	streqh r2, [r1, #8]
	strneh r1, [r4, lr]
	strneh r2, [ip, r3]
_02000894:
	bl sub_02003AD8
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020008A4: .word 0x0380FFF4
_020008A8: .word 0x01000010
_020008AC: .word 0x0000FFFF
	arm_func_end sub_02000838

	arm_func_start sub_020008B0
sub_020008B0: ; 0x020008B0
	stmdb sp!, {r3, lr}
	ldr r0, _020008E8 ; =0x0380FFF4
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #1
	ldr r0, [r0, #0x308]
	bl sub_02004948
	add r0, sp, #0
	bl sub_020008EC
	mov r0, #3
	mov r1, #0xc
	bl sub_02000780
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020008E8: .word 0x0380FFF4
	arm_func_end sub_020008B0

	arm_func_start sub_020008EC
sub_020008EC: ; 0x020008EC
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _02000918
	ldr r0, _02000920 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x200
	bl sub_02000924
	mov r0, #2
	mov r1, #0xb
	bl sub_02000780
_02000918:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02000920: .word 0x0380FFF4
	arm_func_end sub_020008EC

	arm_func_start sub_02000924
sub_02000924: ; 0x02000924
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x1000000
	mov r4, r1
	bl sub_02003B10
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r4]
	streq r4, [r5]
	ldrne r1, [r5, #4]
	strne r1, [r4]
	strne r4, [r1, #4]
	mvn r1, #0
	str r1, [r4, #4]
	ldrh r2, [r5, #0xa]
	ldr r1, _02000990 ; =0x0000BF1D
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
	str r4, [r5, #4]
	ldrh r1, [r5, #8]
	add r1, r1, #1
	strh r1, [r5, #8]
	bl sub_02003AD8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02000990: .word 0x0000BF1D
	arm_func_end sub_02000924

	arm_func_start sub_02000994
sub_02000994: ; 0x02000994
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r2, [r4, #0xa]
	ldr r1, _02000A50 ; =0x0000BF1D
	mov r5, r0
	cmp r2, r1
	movne r0, #1
	bne _02000A48
	ldrh r1, [r4, #8]
	ldrh r0, [r5, #0xa]
	cmp r1, r0
	movne r0, #2
	bne _02000A48
	mov r0, #0x1000000
	bl sub_02003B10
	ldrh r1, [r5, #8]
	sub r1, r1, #1
	strh r1, [r5, #8]
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r5]
	streq r1, [r5, #4]
	beq _02000A38
	ldr r1, [r5]
	cmp r4, r1
	ldreq r2, [r4, #4]
	mvneq r1, #0
	streq r2, [r5]
	streq r1, [r2]
	beq _02000A38
	ldr r1, [r5, #4]
	ldr r2, [r4]
	cmp r4, r1
	streq r2, [r5, #4]
	mvneq r1, #0
	streq r1, [r2, #4]
	ldrne r1, [r4, #4]
	strne r2, [r1]
	ldmneia r4, {r1, r2}
	strne r2, [r1, #4]
_02000A38:
	mov r1, #0
	strh r1, [r4, #8]
	bl sub_02003AD8
	mov r0, #0
_02000A48:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02000A50: .word 0x0000BF1D
	arm_func_end sub_02000994

	arm_func_start sub_02000A54
sub_02000A54: ; 0x02000A54
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02000AE8 ; =0x0380FFF4
	movs r3, r1
	ldr r1, [r2]
	mov r5, r0
	moveq r0, #0
	beq _02000AE0
	ldr r0, [r1, #0x17c]
	cmp r0, #0
	beq _02000A88
	cmp r0, #1
	beq _02000AA0
	b _02000AB4
_02000A88:
	ldr r0, [r1, #0x180]
	ldr r1, [r1, #0x184]
	add r2, r3, #0xc
	bl sub_02004E5C
	mov r4, r0
	b _02000AB4
_02000AA0:
	ldr r1, [r1, #0x180]
	add r0, r3, #0xc
	mov lr, pc
	bx r1
_02000AB0:
	.byte 0x00, 0x40, 0xA0, 0xE1
_02000AB4:
	cmp r4, #0
	moveq r0, #0
	beq _02000AE0
	ldr r1, _02000AEC ; =0x0000BF1D
	mov r0, r5
	strh r1, [r4, #0xa]
	mov r2, #0
	mov r1, r4
	strh r2, [r4, #8]
	bl sub_02000BDC
	mov r0, r4
_02000AE0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02000AE8: .word 0x0380FFF4
_02000AEC: .word 0x0000BF1D
	arm_func_end sub_02000A54

	arm_func_start sub_02000AF0
sub_02000AF0: ; 0x02000AF0
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	ldr r5, _02000B68 ; =0x0380FFF4
	ldrh r3, [r4, #0xa]
	ldr r2, _02000B6C ; =0x0000BF1D
	ldr r5, [r5]
	cmp r3, r2
	movne r0, #1
	bne _02000B60
	bl sub_02000994
	movs r6, r0
	bne _02000B5C
	ldr r0, [r5, #0x17c]
	cmp r0, #0
	beq _02000B38
	cmp r0, #1
	beq _02000B4C
	b _02000B5C
_02000B38:
	ldr r0, [r5, #0x180]
	ldr r1, [r5, #0x184]
	mov r2, r4
	bl sub_02004F6C
	b _02000B5C
_02000B4C:
	ldr r1, [r5, #0x184]
	mov r0, r4
	mov lr, pc
	bx r1
_02000B5C:
	mov r0, r6
_02000B60:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02000B68: .word 0x0380FFF4
_02000B6C: .word 0x0000BF1D
	arm_func_end sub_02000AF0

	arm_func_start sub_02000B70
sub_02000B70: ; 0x02000B70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldrh r3, [r6, #0xa]
	ldr r2, _02000BD8 ; =0x0000BF1D
	mov r4, r0
	cmp r3, r2
	mov r7, r1
	movne r0, #1
	bne _02000BD0
	mov r0, #0x1000000
	bl sub_02003B10
	mov r5, r0
	mov r0, r4
	mov r1, r6
	bl sub_02000994
	movs r4, r0
	bne _02000BC4
	mov r0, r7
	mov r1, r6
	bl sub_02000BDC
	mov r4, r0
_02000BC4:
	mov r0, r5
	bl sub_02003AD8
	mov r0, r4
_02000BD0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02000BD8: .word 0x0000BF1D
	arm_func_end sub_02000B70

	arm_func_start sub_02000BDC
sub_02000BDC: ; 0x02000BDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r2, [r4, #0xa]
	ldr r1, _02000C64 ; =0x0000BF1D
	mov r5, r0
	cmp r2, r1
	movne r0, #1
	bne _02000C5C
	ldrh r0, [r4, #8]
	cmp r0, #0
	movne r0, #2
	bne _02000C5C
	mov r0, #0x1000000
	bl sub_02003B10
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r4]
	streq r4, [r5]
	ldrne r1, [r5, #4]
	strne r1, [r4]
	strne r4, [r1, #4]
	mvn r1, #0
	str r1, [r4, #4]
	ldrh r1, [r5, #0xa]
	strh r1, [r4, #8]
	str r4, [r5, #4]
	ldrh r1, [r5, #8]
	add r1, r1, #1
	strh r1, [r5, #8]
	bl sub_02003AD8
	mov r0, #0
_02000C5C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02000C64: .word 0x0000BF1D
	arm_func_end sub_02000BDC
_02000C68:
	.byte 0x04, 0x00, 0x90, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02000C70
sub_02000C70: ; 0x02000C70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02000F20 ; =0x0380FFF4
	mov r3, #0
	ldr r2, [r4]
	mov r6, r3
	add r0, r2, #0x24
	add r5, r0, #0x400
	ldrh r0, [r5, #4]
	cmp r0, #0
	bne _02000F18
	ldr r0, [r2, #0x200]
	sub r2, r3, #1
	str r0, [r5]
	cmp r0, r2
	beq _02000F18
	ldr r2, [r4]
	ldrh r4, [r0, #0xe]
	add ip, r2, #0x300
	ldrh r2, [ip, #0x3e]
	add r4, r0, r4, lsl #1
	cmp r2, #0
	movne r0, #1
	strneh r0, [r4, #0x12]
	movne r0, #6
	strneh r0, [r4, #0x14]
	bne _02000ED0
	ldrh r7, [r0, #0xc]
	ldrh r2, [r4, #0x10]
	cmp r7, r2
	movne r0, #0xd
	strneh r0, [r4, #0x14]
	bne _02000ED0
	and r2, r7, #0xff00
	cmp r2, #0x100
	bgt _02000D0C
	bge _02000D58
	cmp r2, #0
	beq _02000D28
	b _02000E38
_02000D0C:
	cmp r2, #0x200
	bgt _02000D1C
	beq _02000D78
	b _02000E38
_02000D1C:
	cmp r2, #0x300
	beq _02000E24
	b _02000E38
_02000D28:
	ldrh r6, [r5, #4]
	ldr r1, _02000F24 ; =0x027F7648
	tst r6, #1
	and r2, r7, #0xff
	mov r6, #1
	mov lr, #0xb
	movne r3, #2
	bne _02000E40
	ldrh r7, [ip, #0x4c]
	cmp r7, #0x20
	movlo r3, r6
	b _02000E40
_02000D58:
	ldrh r6, [ip, #0x4c]
	ldr r1, _02000F28 ; =0x027F75C0
	cmp r6, #0x40
	and r2, r7, #0xff
	mov r6, #2
	mov lr, #5
	movne r3, #1
	b _02000E40
_02000D78:
	and r2, r7, #0xff
	cmp r2, #0x40
	bhs _02000DA0
	ldrh r1, [ip, #0x4c]
	mov r6, #4
	cmp r1, #0x10
	ldr r1, _02000F2C ; =0x027F77B0
	movlo r3, #1
	mov lr, #0x17
	b _02000E40
_02000DA0:
	cmp r2, #0x80
	bhs _02000DD0
	ldrh r1, [ip, #0x4c]
	mov r6, #8
	cmp r1, #0x40
	sub r1, r2, #0x40
	mov r2, r1, lsl #0x10
	ldr r1, _02000F30 ; =0x027F7618
	movne r3, #1
	mov r2, r2, lsr #0x10
	mov lr, #6
	b _02000E40
_02000DD0:
	ldrh r1, [ip, #0x4c]
	cmp r2, #0xc0
	bhs _02000E00
	cmp r1, #0x10
	sub r1, r2, #0x80
	mov r2, r1, lsl #0x10
	ldr r1, _02000F34 ; =0x027F76F8
	movlo r3, #1
	mov r2, r2, lsr #0x10
	mov r6, #0x10
	mov lr, #0x17
	b _02000E40
_02000E00:
	cmp r1, #0x10
	sub r1, r2, #0xc0
	mov r2, r1, lsl #0x10
	ldr r1, _02000F38 ; =0x027F75E8
	movlo r3, #1
	mov r2, r2, lsr #0x10
	mov r6, #0x20
	mov lr, #6
	b _02000E40
_02000E24:
	ldr r1, _02000F3C ; =0x027F76A0
	and r2, r7, #0xff
	mov r6, #0x40
	mov lr, #0xb
	b _02000E40
_02000E38:
	mov r2, #1
	mov lr, #0
_02000E40:
	cmp r2, lr
	movhi r3, #3
	bhi _02000E70
	mov lr, r2, lsl #3
	ldrh r7, [r0, #0xe]
	ldrh ip, [r1, lr]
	cmp r7, ip
	addhs ip, r1, lr
	ldrhsh lr, [r4, #0x12]
	ldrhsh ip, [ip, #2]
	cmphs lr, ip
	movlo r3, #4
_02000E70:
	cmp r3, #0
	movne r0, #1
	strneh r0, [r4, #0x12]
	strneh r3, [r4, #0x14]
	bne _02000ED0
	ldrh r3, [r5, #4]
	add r1, r1, r2, lsl #3
	orr r2, r3, r6
	strh r2, [r5, #4]
	ldr r2, [r1, #4]
	add r1, r4, #0x10
	mov lr, pc
	bx r2
_02000EA4:
	.byte 0xB4, 0x01, 0xC4, 0xE1, 0xB4, 0x01, 0xD4, 0xE1, 0x80, 0x00, 0x50, 0xE3
	.byte 0x18, 0x00, 0x00, 0x0A, 0x81, 0x00, 0x50, 0xE3, 0x04, 0x00, 0x00, 0x1A, 0xB4, 0x10, 0xD5, 0xE1
	.byte 0x06, 0x00, 0xE0, 0xE1, 0x00, 0x00, 0x01, 0xE0, 0xB4, 0x00, 0xC5, 0xE1, 0x08, 0x00, 0x00, 0xEA
_02000ED0:
	ldrh r1, [r5, #4]
	mvn r0, r6
	and r0, r1, r0
	strh r0, [r5, #4]
	ldr r0, _02000F20 ; =0x0380FFF4
	ldr r1, [r5]
	ldr r0, [r0]
	add r0, r0, #0x200
	bl sub_02000F40
	ldr r0, _02000F20 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _02000F18
	mov r0, #2
	mov r1, #0xb
	bl sub_02000780
_02000F18:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02000F20: .word 0x0380FFF4
_02000F24: .word 0x027F7648
_02000F28: .word 0x027F75C0
_02000F2C: .word 0x027F77B0
_02000F30: .word 0x027F7618
_02000F34: .word 0x027F76F8
_02000F38: .word 0x027F75E8
_02000F3C: .word 0x027F76A0
	arm_func_end sub_02000C70

	arm_func_start sub_02000F40
sub_02000F40: ; 0x02000F40
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02000FC4 ; =0x0380FFF4
	mov r5, r0
	ldr r3, [r2]
	mov r4, r1
	add r2, r3, #0x100
	ldrh r2, [r2, #0xfc]
	cmp r2, #0
	beq _02000F80
	mov r2, r4
	add r1, r3, #0x1f4
	bl sub_02000B70
	mov r0, #2
	mov r1, #0x13
	bl sub_02000780
	b _02000FBC
_02000F80:
	ldr r0, [r3, #0x304]
	mov r2, #0
	bl sub_020048BC
	cmp r0, #0
	beq _02000FA4
	mov r0, r5
	mov r1, r4
	bl sub_02000994
	b _02000FBC
_02000FA4:
	ldr r1, _02000FC4 ; =0x0380FFF4
	mov r0, r5
	ldr r1, [r1]
	mov r2, r4
	add r1, r1, #0x1f4
	bl sub_02000B70
_02000FBC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02000FC4: .word 0x0380FFF4
	arm_func_end sub_02000F40

	arm_func_start sub_02000FC8
sub_02000FC8: ; 0x02000FC8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _02001334 ; =0x0380FFF4
	ldr r0, [r0]
	add r6, r0, #0x344
	add r4, r0, #0x31c
	bl sub_02001380
	ldr r1, _02001338 ; =0x04808044
	ldrh r2, [r1]
	ldrh r0, [r1]
	ldrh r1, [r1]
	add r0, r2, r0, lsl #8
	bl sub_00FF2F54
	mov r0, #1
	strh r0, [r6, #0x7c]
	ldrh r0, [r4, #0x1e]
	ldr r2, _0200133C ; =0x04808032
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	ldreqh r0, [r6, #0x7c]
	ldr r1, _02001340 ; =0x04808134
	orreq r0, r0, #0x20
	streqh r0, [r6, #0x7c]
	ldrh r0, [r4, #0x18]
	mov r4, #0
	cmp r0, #0
	ldrneh r0, [r6, #0x7c]
	mov r3, #0x8000
	orrne r0, r0, #0x10
	strneh r0, [r6, #0x7c]
	strh r4, [r6, #0x12]
	ldr r0, _02001344 ; =0x0000FFFF
	strh r3, [r2]
	strh r0, [r1]
	strh r4, [r2, #-8]
	sub r0, r1, #0x10c
	strh r4, [r0]
	mov r0, #0xf
	strh r0, [r1, #-0xfc]
	bl sub_00FF46F8
	bl sub_00FFCEA8
	bl sub_020030A8
	bl sub_020033C8
	ldr r2, _02001348 ; =0x04808030
	mov r1, #0x8000
	strh r1, [r2]
	ldr r0, _02001344 ; =0x0000FFFF
	ldr r1, _0200134C ; =0x048081AE
	strh r0, [r2, #-0x20]
	sub r2, r0, #0xe000
	ldr r0, _02001334 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	movne r0, #0x400
	strneh r0, [r1, #-4]
	moveq r0, r4
	streqh r0, [r1, #-4]
	ldr r2, _02001350 ; =0x04808008
	mov r3, #0
	strh r3, [r2]
	strh r3, [r2, #2]
	ldrh r0, [r6, #0xc]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020012F8
_020010DC: ; jump table
	b _020010F0 ; case 0
	b _02001120 ; case 1
	b _02001204 ; case 2
	b _02001284 ; case 3
	b _020012DC ; case 4
_020010F0:
	ldr r0, _02001344 ; =0x0000FFFF
	mov r1, #0x3f
	strh r1, [r2, #0xa]
	strh r0, [r2, #0xc8]
	mov r0, #8
	strh r0, [r2, #0xd8]
	strh r3, [r2]
	strh r3, [r2, #2]
	strh r3, [r2, #0xe0]
	mov r0, #1
	strh r0, [r2, #-4]
	b _020012F8
_02001120:
	ldr r3, _02001354 ; =0x0000703F
	ldr r0, _02001358 ; =0x00001FFF
	ldr r1, _0200134C ; =0x048081AE
	strh r3, [r2, #0xa]
	strh r0, [r1]
	rsb r0, r0, #0x2300
	strh r0, [r1, #-0xde]
	mov r0, #0xd
	strh r0, [r1, #-0xce]
	mov r0, #0xe000
	strh r0, [r2]
	mov r0, #1
	strh r0, [r2, #-4]
	ldrh r0, [r1, #-0xb6]
	add r7, sp, #0
	strh r0, [r7]
	ldrh r0, [r1, #-0xb4]
	mov r4, #0
	strh r0, [r7, #2]
	ldrh r2, [r1, #-0xb2]
	ldr r0, [sp]
	strh r2, [r7, #4]
	ldrh r1, [r1, #-0xb0]
	mov r3, r4
	strh r1, [r7, #6]
	ldrh r2, [r6, #0x6e]
	ldr r1, [sp, #4]
	mov r5, r2, lsl #0xa
	mov r2, r5
	bl sub_0200ED68
	adds r3, r0, #1
	umull r2, r0, r3, r5
	mla r0, r3, r4, r0
	adc r1, r1, #0
	mla r0, r1, r5, r0
	str r0, [sp, #4]
	ldrh r0, [r7, #6]
	ldr r3, _0200135C ; =0x048080F6
	str r2, [sp]
	strh r0, [r3]
	ldrh r0, [r7, #4]
	mov r1, #1
	strh r0, [r3, #-2]
	ldrh r2, [r7, #2]
	mov r0, #0x40
	strh r2, [r3, #-4]
	ldrh r2, [r7]
	orr r2, r2, #1
	strh r2, [r3, #-6]
	strh r1, [r3, #-0xe]
	strh r1, [r3, #-0xc]
	bl sub_02001420
	bl sub_00FF9384
	ldr r0, _02001360 ; =0x048080AE
	mov r1, #2
	strh r1, [r0]
	b _020012F8
_02001204:
	ldr r1, _02001364 ; =0x0000E0BF
	ldr r0, _02001334 ; =0x0380FFF4
	strh r1, [r2, #0xa]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x20
	beq _02001240
	ldrh r0, [r2, #0xa]
	ldr r1, _02001368 ; =0x048081AA
	orr r0, r0, #0x40
	strh r0, [r2, #0xa]
	ldrh r0, [r1]
	orr r0, r0, #0x68
	strh r0, [r1]
_02001240:
	ldrh r0, [r6, #0x64]
	tst r0, #1
	ldr r0, _0200136C ; =0x048080D0
	ldrne r1, _02001370 ; =0x00000581
	strneh r1, [r0]
	ldreq r1, _02001374 ; =0x00000181
	streqh r1, [r0]
	ldr r2, _02001378 ; =0x048080E0
	mov r0, #0xb
	strh r0, [r2]
	mov r1, #1
	strh r1, [r2, #-0xdc]
	strh r1, [r2, #8]
	mov r0, #0x20
	strh r1, [r2, #0xa]
	bl sub_02001420
	b _020012F8
_02001284:
	ldr r1, _02001344 ; =0x0000FFFF
	strh r1, [r2, #8]
	sub r0, r1, #0x3fc0
	strh r0, [r2, #0xa]
	ldrh r0, [r6, #0x64]
	tst r0, #1
	rsbne r0, r1, #0x10400
	strneh r0, [r2, #0xc8]
	moveq r0, #1
	streqh r0, [r2, #0xc8]
	ldr r2, _02001378 ; =0x048080E0
	mov r0, #0xb
	strh r0, [r2]
	mov r0, #1
	strh r0, [r2, #-0xdc]
	strh r0, [r2, #8]
	strh r0, [r2, #0xa]
	mov r1, #0
	mov r0, #0x20
	strh r1, [r2, #-0x98]
	bl sub_02001420
	b _020012F8
_020012DC:
	ldr r0, _0200134C ; =0x048081AE
	strh r3, [r2, #0xa]
	strh r3, [r0]
	mov r1, #1
	mov r0, #0x20
	strh r1, [r2, #-4]
	bl sub_02001420
_020012F8:
	ldr r0, _0200137C ; =0x04808048
	mov r1, #0
	strh r1, [r0]
	bl sub_00FF207C
	ldr r1, _02001360 ; =0x048080AE
	mov r0, #2
	strh r0, [r1]
	ldrh r1, [r6, #0xe]
	cmp r1, #1
	bne _02001324
	bl sub_00FF1E9C
_02001324:
	bl sub_020034E8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02001334: .word 0x0380FFF4
_02001338: .word 0x04808044
_0200133C: .word 0x04808032
_02001340: .word 0x04808134
_02001344: .word 0x0000FFFF
_02001348: .word 0x04808030
_0200134C: .word 0x048081AE
_02001350: .word 0x04808008
_02001354: .word 0x0000703F
_02001358: .word 0x00001FFF
_0200135C: .word 0x048080F6
_02001360: .word 0x048080AE
_02001364: .word 0x0000E0BF
_02001368: .word 0x048081AA
_0200136C: .word 0x048080D0
_02001370: .word 0x00000581
_02001374: .word 0x00000181
_02001378: .word 0x048080E0
_0200137C: .word 0x04808048
	arm_func_end sub_02000FC8

	arm_func_start sub_02001380
sub_02001380: ; 0x02001380
	stmdb sp!, {r4, lr}
	ldr r0, _02001410 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x208
	add r0, r0, #0x400
	add r4, r1, #0x344
	bl sub_020057A8
	ldr r0, _02001410 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_020057A8
	mov r0, #0x20
	bl sub_02001420
	mov r1, #0
	strh r1, [r4, #0xa4]
	ldr r0, _02001414 ; =0x04808012
	strh r1, [r4, #0x12]
	strh r1, [r0]
	strh r1, [r0, #-0xe]
	strh r1, [r0, #0xd8]
	strh r1, [r0, #0xd6]
	strh r1, [r0, #-0xa]
	strh r1, [r0, #-8]
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _020013F0
	bl sub_00FF93C4
_020013F0:
	ldr r1, _02001418 ; =0x0000FFFF
	ldr r0, _0200141C ; =0x048080AC
	strh r1, [r0]
	strh r1, [r0, #8]
	bl sub_00FF90F0
	bl sub_00FF0F2C
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02001410: .word 0x0380FFF4
_02001414: .word 0x04808012
_02001418: .word 0x0000FFFF
_0200141C: .word 0x048080AC
	arm_func_end sub_02001380

	arm_func_start sub_02001420
sub_02001420: ; 0x02001420
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020014B8 ; =0x0380FFF4
	mov r5, r0
	ldr r1, [r1]
	add r4, r1, #0x344
	ldrh r0, [r4, #8]
	cmp r0, r5
	beq _020014B0
	cmp r0, #0x40
	bne _02001454
	add r0, r1, #0x234
	add r0, r0, #0x400
	bl sub_020057A8
_02001454:
	cmp r5, #0
	beq _02001470
	cmp r5, #0x10
	beq _02001478
	cmp r5, #0x40
	beq _02001490
	b _020014AC
_02001470:
	bl sub_00FF1EDC
	b _020014AC
_02001478:
	ldr r0, _020014BC ; =0x04808040
	mov r1, #0
	strh r1, [r0]
	bl sub_02001380
	bl sub_00FF1F64
	b _020014AC
_02001490:
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _020014A0
	bl sub_00FF20C8
_020014A0:
	ldr r1, _020014C0 ; =0x027EAA6C
	mov r0, #0x64
	bl sub_00FF2BA4
_020014AC:
	strh r5, [r4, #8]
_020014B0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020014B8: .word 0x0380FFF4
_020014BC: .word 0x04808040
_020014C0: .word 0x027EAA6C
	arm_func_end sub_02001420

	arm_func_start sub_020014C4
sub_020014C4: ; 0x020014C4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _02001590 ; =0x04808010
	mov r4, #1
_020014D0:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	ands r6, r1, r0
	beq _02001578
	tst r6, #0x80
	beq _020014EC
	bl sub_02002404
_020014EC:
	tst r6, #0x40
	beq _020014F8
	bl sub_02002510
_020014F8:
	tst r6, #0x8000
	beq _02001504
	bl sub_02001598
_02001504:
	tst r6, #0x4000
	beq _02001510
	bl sub_02001624
_02001510:
	tst r6, #0x2000
	beq _0200151C
	bl sub_020018C8
_0200151C:
	tst r6, #0x800
	beq _02001528
	bl sub_00FF3A18
_02001528:
	tst r6, #8
	beq _02001534
	bl sub_02001964
_02001534:
	tst r6, #4
	beq _02001540
	bl sub_02001A74
_02001540:
	tst r6, #1
	beq _0200154C
	bl sub_02001E58
_0200154C:
	tst r6, #0x30
	beq _02001558
	bl sub_02001934
_02001558:
	tst r6, #2
	beq _02001564
	bl sub_02001BF0
_02001564:
	tst r6, #0x1000
	beq _020014D0
	mov r0, r4
	bl sub_02002314
	b _020014D0
_02001578:
	ldr r1, _02001594 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x1000000
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02001590: .word 0x04808010
_02001594: .word 0x0380FFF8
	arm_func_end sub_020014C4

	arm_func_start sub_02001598
sub_02001598: ; 0x02001598
	stmdb sp!, {r4, lr}
	ldr r1, _0200161C ; =0x0380FFF4
	ldr r0, _02001620 ; =0x04808010
	ldr r2, [r1]
	mov r1, #0x8000
	strh r1, [r0]
	add r4, r2, #0x344
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	bne _0200160C
	ldrh r0, [r4, #0x7e]
	cmp r0, #0
	beq _0200160C
	ldrh r1, [r4, #0x72]
	ldrh r0, [r4, #0x70]
	cmp r1, r0
	bne _0200160C
	ldrh r0, [r4, #0x80]
	add r0, r0, #1
	strh r0, [r4, #0x80]
	ldrh r1, [r4, #0x80]
	ldrh r0, [r4, #0x7e]
	cmp r1, r0
	bls _0200160C
	mov r2, #0
	mov r0, #1
	mov r1, #0xd
	strh r2, [r4, #0x80]
	bl sub_02000780
_0200160C:
	mov r0, #1
	strh r0, [r4, #0x10]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200161C: .word 0x0380FFF4
_02001620: .word 0x04808010
	arm_func_end sub_02001598

	arm_func_start sub_02001624
sub_02001624: ; 0x02001624
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r6, _020018A8 ; =0x0380FFF4
	ldr r2, _020018AC ; =0x04808010
	ldr r3, [r6]
	mov r0, #0x4000
	strh r0, [r2]
	add r4, r3, #0x344
	ldrh r1, [r4, #0xc]
	add r0, r3, #0x2c
	cmp r1, #1
	add r5, r3, #0x31c
	add r7, r0, #0x400
	beq _0200166C
	cmp r1, #2
	beq _02001720
	cmp r1, #3
	beq _02001764
	b _020018A0
_0200166C:
	ldr r1, [r7, #0x80]
	ldrh r6, [r6, #-4]
	ldrh r0, [r4, #0x96]
	add r1, r1, #0x24
	add r8, r1, r0
	add r0, r8, #8
	and r1, r6, #0xff
	bl sub_00FF2F0C
	mov r1, r6, lsr #8
	add r0, r8, #9
	and r1, r1, #0xff
	bl sub_00FF2F0C
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _020016C0
	ldr r1, _020018B0 ; =0x04808134
	ldrh r2, [r5, #0x20]
	ldrh r0, [r1]
	add r0, r2, r0
	add r0, r0, #1
	strh r0, [r1]
_020016C0:
	ldr r0, _020018A8 ; =0x0380FFF4
	ldr r1, _020018B4 ; =0x048080B6
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r3, [r0, #0x2e]
	ldrh r2, [r0, #0x32]
	mvn r3, r3
	orr r2, r3, r2
	strh r2, [r0, #0x30]
	ldrh r0, [r1]
	tst r0, #0x18
	bne _020016FC
	and r0, r0, #6
	cmp r0, #2
	bne _02001710
_020016FC:
	ldr r0, [r7, #0x8c]
	bic r0, r0, #2
	str r0, [r7, #0x8c]
	bl sub_02002780
	b _020018A0
_02001710:
	ldr r0, [r7, #0x8c]
	orr r0, r0, #2
	str r0, [r7, #0x8c]
	b _020018A0
_02001720:
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	ldreq r1, _020018B8 ; =0x0000FFFF
	addeq r0, r2, #0x124
	streqh r1, [r0]
	beq _02001750
	add r1, r2, #0x124
	ldrh r2, [r5, #0x20]
	ldrh r0, [r1]
	add r0, r2, r0
	add r0, r0, #1
	strh r0, [r1]
_02001750:
	ldrh r0, [r4, #0x1a]
	cmp r0, #2
	bne _02001764
	mov r0, #2
	bl sub_00FF1E9C
_02001764:
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	movne r1, #1
	bne _020017B0
	ldrh r0, [r4, #0x72]
	mov r1, #0
	cmp r0, #1
	ldrh r0, [r4, #0x14]
	moveq r1, #1
	cmp r0, #0
	beq _020017B0
	ldrh r0, [r4, #0x76]
	cmp r0, #1
	beq _020017AC
	cmp r0, #0
	ldreqh r0, [r4, #0x74]
	cmpeq r0, #1
	bne _020017B0
_020017AC:
	mov r1, #1
_020017B0:
	cmp r1, #0
	ldr r1, _020018BC ; =0x04808038
	ldrneh r0, [r1]
	orrne r0, r0, #1
	strneh r0, [r1]
	ldreqh r0, [r1]
	biceq r0, r0, #1
	streqh r0, [r1]
	ldr r1, _020018C0 ; =0x04808118
	mov r8, #0
	ldrh r0, [r1]
	mov r6, #2
	cmp r0, #0xa
	movhi r0, #0
	strhih r0, [r1, #-0xd0]
	ldrh r0, [r4, #0x72]
	mov r5, r8
	sub r0, r0, #1
	strh r0, [r4, #0x72]
	ldrh r0, [r4, #0x72]
	mov sl, #0x14
	cmp r0, #0
	ldreqh r0, [r4, #0x70]
	streqh r0, [r4, #0x72]
	ldrh r1, [r4, #0x76]
	sub r0, r1, #1
	strh r0, [r4, #0x76]
	cmp r1, #0
	ldreqh r0, [r4, #0x74]
	subeq r0, r0, #1
	streqh r0, [r4, #0x76]
	mov r4, #0xe
_02001830:
	mul r1, r8, sl
	ldrh r0, [r7, r1]
	add sb, r7, r1
	cmp r0, #0
	beq _02001888
	ldr r0, [sb, #0xc]
	ldrh r1, [r0, #8]
	cmp r1, #0
	bne _02001888
	bl sub_00FF8464
	cmp r0, #0
	beq _02001888
	mov r0, r8
	bl sub_00FF8EBC
	ldr r1, [sb, #8]
	mov r0, r5
	strh r6, [r1]
	mov r1, r4
	bl sub_02000780
	ldrh r0, [r7, #0xae]
	add r0, r0, #1
	strh r0, [r7, #0xae]
_02001888:
	add r8, r8, #1
	cmp r8, #2
	blo _02001830
	ldr r0, _020018C4 ; =0x048080AE
	mov r1, #0xd
	strh r1, [r0]
_020018A0:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_020018A8: .word 0x0380FFF4
_020018AC: .word 0x04808010
_020018B0: .word 0x04808134
_020018B4: .word 0x048080B6
_020018B8: .word 0x0000FFFF
_020018BC: .word 0x04808038
_020018C0: .word 0x04808118
_020018C4: .word 0x048080AE
	arm_func_end sub_02001624

	arm_func_start sub_020018C8
sub_020018C8: ; 0x020018C8
	ldr r0, _0200192C ; =0x0380FFF4
	ldr r1, _02001930 ; =0x04808010
	ldr r2, [r0]
	mov r0, #0x2000
	strh r0, [r1]
	mov r0, #0xd
	add r2, r2, #0x344
	strh r0, [r1, #0x9c]
	ldrh r0, [r2, #0x1a]
	cmp r0, #1
	moveq r0, #2
	streqh r0, [r2, #0x1a]
	bxeq lr
	cmp r0, #2
	moveq r0, #0
	streqh r0, [r2, #0x1a]
	bxeq lr
	ldrh r0, [r2, #0xc]
	cmp r0, #2
	bxne lr
	ldrh r0, [r2, #8]
	cmp r0, #0x40
	movne r0, #0
	strneh r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0200192C: .word 0x0380FFF4
_02001930: .word 0x04808010
	arm_func_end sub_020018C8

	arm_func_start sub_02001934
sub_02001934: ; 0x02001934
	stmdb sp!, {r3, lr}
	bl sub_00FF2394
	ldr r1, _0200195C ; =0x048081AC
	ldr r2, _02001960 ; =0x0000FFFF
	sub r0, r1, #0x19c
	strh r2, [r1]
	mov r1, #0x30
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200195C: .word 0x048081AC
_02001960: .word 0x0000FFFF
	arm_func_end sub_02001934

	arm_func_start sub_02001964
sub_02001964: ; 0x02001964
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02001A68 ; =0x04808010
	mov r2, #8
	ldr r0, _02001A6C ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _020019AC
	add r0, r1, #0x18c
	ldrh r0, [r0]
	tst r0, #1
	addeq r1, r1, #0x280
	ldreqh r0, [r1]
	eoreq r0, r0, #1
	streqh r0, [r1]
_020019AC:
	ldr r0, _02001A6C ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _02001A60
	ldr r4, _02001A70 ; =0x04808032
	add r0, r1, #0x2c
	mov r2, #0
	add r1, r1, #0x344
	add r3, r0, #0x400
	mov r5, r2
	mov lr, #0x8000
	mov ip, #0x14
_020019E4:
	mul r6, r2, ip
	ldrh r0, [r3, r6]
	add r6, r3, r6
	cmp r0, #0
	beq _02001A54
	ldr r0, [r6, #8]
	ldrh r6, [r0, #0xc]
	tst r6, #0x4000
	beq _02001A54
	ldrh r6, [r0, #4]
	tst r6, #0xff
	beq _02001A54
	ldrh r6, [r0, #0xa]
	add r7, r0, #0xc
	add r6, r7, r6
	sub r6, r6, #7
	bic r7, r6, #1
	ldrh r6, [r7]
	cmp r6, #0
	ldreqh r6, [r7, #2]
	cmpeq r6, #0
	bne _02001A54
	strh r5, [r0, #4]
	strh r5, [r4]
	strh lr, [r4]
	ldrh r0, [r1, #0xba]
	add r0, r0, #1
	strh r0, [r1, #0xba]
_02001A54:
	add r2, r2, #1
	cmp r2, #3
	blo _020019E4
_02001A60:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02001A68: .word 0x04808010
_02001A6C: .word 0x0380FFF4
_02001A70: .word 0x04808032
	arm_func_end sub_02001964

	arm_func_start sub_02001A74
sub_02001A74: ; 0x02001A74
	stmdb sp!, {r3, lr}
	ldr r1, _02001BD4 ; =0x0380FFF4
	ldr ip, _02001BD8 ; =0x04808010
	ldr r2, [r1]
	mov r0, #4
	strh r0, [ip]
	ldr r0, [r1]
	add r1, ip, #0x198
	add r0, r0, #0x600
	ldrh r3, [r0, #0x90]
	add r0, r2, #0xdc
	add r2, r2, #0x2c
	ldrh r1, [r1]
	tst r3, #8
	add r0, r0, #0x400
	add r3, r2, #0x400
	beq _02001B64
	tst r1, #0x400
	beq _02001B64
	ldrh ip, [ip, #0xa0]
	tst ip, #1
	ldrneh r2, [r3]
	cmpne r2, #0
	bne _02001B20
	tst ip, #4
	ldrneh r2, [r3, #0x14]
	cmpne r2, #0
	bne _02001B20
	tst ip, #8
	ldrneh r2, [r3, #0x28]
	cmpne r2, #0
	bne _02001B20
	ldr r2, _02001BDC ; =0x0480819C
	ldrh r2, [r2]
	tst r2, #1
	bne _02001B20
	ldr r3, _02001BE0 ; =0x04808032
	mov ip, #0
	strh ip, [r3]
	mov r2, #0x8000
	strh r2, [r3]
	strh ip, [r0, #2]
	b _02001B64
_02001B20:
	ldrh r3, [r0, #2]
	add r2, r3, #1
	strh r2, [r0, #2]
	cmp r3, #0xc
	bls _02001B64
	ldr r3, _02001BE0 ; =0x04808032
	mov r2, #0
	strh r2, [r0, #2]
	strh r2, [r3]
	mov r2, #0x8000
	ldr r0, _02001BD4 ; =0x0380FFF4
	strh r2, [r3]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0xfe]
	add r2, r2, #1
	strh r2, [r0, #0xfe]
_02001B64:
	ldr r0, _02001BD4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #1
	beq _02001BCC
	tst r1, #0x60
	beq _02001BCC
	ldr r2, _02001BE4 ; =0x04808054
	ldrh r1, [r2]
	ldrh r0, [r2, #-2]
	sub r0, r0, #0x4000
	add r0, r0, r0, lsr #31
	cmp r1, r0, asr #1
	bge _02001BB4
	ldrh r0, [r2, #-4]
	sub r0, r0, #0x4000
	add r0, r0, r0, lsr #31
	cmp r1, r0, asr #1
	bge _02001BC8
_02001BB4:
	ldr r2, _02001BE8 ; =0x0480805A
	ldr r0, _02001BEC ; =0x00008001
	ldrh r1, [r2]
	strh r1, [r2, #-4]
	strh r0, [r2, #-0x2a]
_02001BC8:
	bl sub_00FF3158
_02001BCC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02001BD4: .word 0x0380FFF4
_02001BD8: .word 0x04808010
_02001BDC: .word 0x0480819C
_02001BE0: .word 0x04808032
_02001BE4: .word 0x04808054
_02001BE8: .word 0x0480805A
_02001BEC: .word 0x00008001
	arm_func_end sub_02001A74

	arm_func_start sub_02001BF0
sub_02001BF0: ; 0x02001BF0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02001E38 ; =0x0380FFF4
	ldr r0, _02001E3C ; =0x04808010
	ldr r2, [r3]
	mov r1, #2
	strh r1, [r0]
	ldr r3, [r3]
	add r2, r2, #0x2c
	add r3, r3, #0x300
	ldrh r3, [r3, #0x4c]
	add r4, r2, #0x400
	cmp r3, #0x12
	bne _02001C2C
	bl sub_00FF76A8
	b _02001E30
_02001C2C:
	ldrh r2, [r0, #0xa8]
	and r5, r2, #0xf00
	cmp r5, #0x300
	beq _02001C50
	cmp r5, #0x800
	beq _02001C84
	cmp r5, #0xb00
	beq _02001CC0
	b _02001DBC
_02001C50:
	ldr r0, [r4, #0x8c]
	tst r0, #2
	beq _02001C60
	bl sub_02002780
_02001C60:
	ldr r1, _02001E38 ; =0x0380FFF4
	mov r0, #0
	ldr r3, [r1]
	mov r1, #8
	ldr r2, [r3, #0x558]
	add r2, r2, #1
	str r2, [r3, #0x558]
	bl sub_02000780
	b _02001DBC
_02001C84:
	ldr r2, [r4, #0x44]
	ldrh r3, [r4, #0x9e]
	ldrh r2, [r2, #4]
	and r2, r2, #0xff
	mov r2, r2, lsl #0x10
	cmp r3, r2, lsr #16
	strlsh r1, [r0, #0x9c]
	ldrlsh r0, [r4, #0xa8]
	addls r0, r0, #1
	strlsh r0, [r4, #0xa8]
	ldr r1, [r4, #0x90]
	ldrh r0, [r1, #0x18]
	add r0, r0, #1
	strh r0, [r1, #0x18]
	b _02001DBC
_02001CC0:
	ldr r3, _02001E40 ; =0x0000FFFF
	ldr r2, _02001E44 ; =0x04805F70
	ldr r1, _02001E48 ; =0x0480824E
	strh r3, [r2]
	strh r3, [r2, #2]
	add r0, r0, #0x23c
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02001D18
	ldr r1, [r4, #0x44]
	ldrh r0, [r1, #0x22]
	cmp r0, r3
	bne _02001D18
	ldrh r0, [r1, #4]
	cmp r0, #0
	movne r0, #0
	strneh r0, [r1, #4]
	ldrneh r1, [r4, #0x98]
	ldrne r0, [r4, #0x44]
	strneh r1, [r0, #2]
_02001D18:
	ldr r0, [r4, #0x44]
	ldr r2, [r4, #0x90]
	ldrh r1, [r0, #2]
	ldrh r0, [r4, #0x98]
	cmp r1, #1
	add r2, r2, #0x1a
	bls _02001D68
	ldr r3, _02001E38 ; =0x0380FFF4
	ldr r3, [r3]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1b
	movs r3, r3, lsr #0x1f
	beq _02001D68
	ldr ip, _02001E4C ; =0x0480819C
	ldrh r3, [ip]
	tst r3, #1
	ldreqh r3, [ip, #0xf4]
	eoreq r3, r3, #1
	streqh r3, [ip, #0xf4]
_02001D68:
	ldr r3, _02001E38 ; =0x0380FFF4
	ldr r3, [r3]
	add r3, r3, #0x600
	ldrh r3, [r3, #0x90]
	tst r3, #0x40
	beq _02001DBC
	b _02001DB4
_02001D84:
	mov r1, r1, lsl #0xf
	mov r1, r1, lsr #0x10
	tst r1, #1
	ldrneh r3, [r2, #6]
	mov r0, r0, lsl #0xf
	addne r3, r3, #1
	mov r0, r0, lsr #0x10
	strneh r3, [r2, #6]
	tst r0, #1
	ldrne r3, [r4, #0x90]
	ldrneh r3, [r3, #0x16]
	addne r2, r2, r3
_02001DB4:
	cmp r1, #1
	bhi _02001D84
_02001DBC:
	cmp r5, #0x800
	beq _02001E24
	ldr r2, _02001E50 ; =0x048080B0
	ldrh r0, [r2]
	tst r0, #2
	bne _02001E24
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02001E18
	mov r0, #2
	strh r0, [r2, #4]
	mov r1, #0
	strh r1, [r2, #-0x68]
	ldrh r1, [r2, #-0xa0]
	tst r1, #0x1000
	ldrneh r0, [r4, #0xac]
	addne r0, r0, #1
	strneh r0, [r4, #0xac]
	bne _02001E0C
	bl sub_02002314
_02001E0C:
	ldrh r0, [r4, #0xaa]
	add r0, r0, #1
	strh r0, [r4, #0xaa]
_02001E18:
	ldr r0, _02001E54 ; =0x048080AE
	mov r1, #2
	strh r1, [r0]
_02001E24:
	mov r0, #0
	mov r1, #0xe
	bl sub_02000780
_02001E30:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02001E38: .word 0x0380FFF4
_02001E3C: .word 0x04808010
_02001E40: .word 0x0000FFFF
_02001E44: .word 0x04805F70
_02001E48: .word 0x0480824E
_02001E4C: .word 0x0480819C
_02001E50: .word 0x048080B0
_02001E54: .word 0x048080AE
	arm_func_end sub_02001BF0

	arm_func_start sub_02001E58
sub_02001E58: ; 0x02001E58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	ldr r0, _020022E8 ; =0x0380FFF4
	ldr r2, _020022EC ; =0x04808010
	ldr r3, [r0]
	mov r1, #1
	add r0, r3, #0x600
	ldrh r4, [r0, #0x90]
	add r6, r3, #0x344
	strh r1, [r2]
	ldrh r1, [r6, #0xc]
	add r0, r3, #0xdc
	cmp r1, #0
	add r7, r0, #0x400
	ldreqh r0, [r2, #0x44]
	and r4, r4, #1
	streqh r0, [r2, #0x4a]
	ldr r0, _020022F0 ; =0x04808098
	sub fp, r0, #0x70
	add r0, r0, #0x1b4
	str r0, [sp, #0x24]
	ldr r0, _020022F4 ; =0x0480824E
	sub r0, r0, #0x154
	str r0, [sp, #0x14]
	ldr r0, _020022F0 ; =0x04808098
	sub r0, r0, #0x44
	str r0, [sp, #0x10]
	ldr r0, _020022F8 ; =0x000008EF
	sub r0, r0, #0x29
	str r0, [sp, #0x28]
	ldr r0, _020022F8 ; =0x000008EF
	add r0, r0, #0x3d
	str r0, [sp, #0x2c]
	ldr r0, _020022FC ; =0x04805F7E
	sub r0, r0, #0x24
	str r0, [sp, #0x30]
	ldr r0, _020022F8 ; =0x000008EF
	add r0, r0, #0x710
	str r0, [sp, #0x34]
_02001EF4:
	ldr r0, [sp, #0x10]
	ldrh sb, [r7, #4]
	ldrh sl, [r0]
	cmp sb, sl
	beq _02002268
	ldr r0, _020022F0 ; =0x04808098
	ldr r1, [sp, #0x14]
	ldrh r0, [r0, #0x60]
	ldrh r3, [r1]
	ldr r1, _020022F0 ; =0x04808098
	ldrh r2, [r1, #0x60]
	ldr r1, [sp, #0x14]
	cmp r0, r2
	ldrh r1, [r1]
	movhi r0, r1, lsl #0xc
	orrhi r0, r0, r2, lsr #4
	strhi r0, [sp, #4]
	movls r1, r3, lsl #0xc
	orrls r0, r1, r0, lsr #4
	strls r0, [sp, #4]
	ldr r0, [sp, #0x28]
	cmp sb, r0
	blo _02001F60
	ldr r0, _020022F8 ; =0x000008EF
	cmp sb, r0
	bhi _02001F60
	bl sub_00FF2394
_02001F60:
	mov r0, sb, lsl #1
	str r0, [sp, #0x18]
	add r0, r0, #0x4000
	add r8, r0, #0x4800000
	add r0, r8, #2
	bl sub_020028B0
	mov r5, r0
	add r0, r5, #2
	bl sub_020028B0
	str r0, [sp, #0x1c]
	add r0, r0, #4
	bl sub_020028B0
	str r0, [sp, #0x20]
	add r0, r8, #0xe
	bl sub_020028B0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	ldrh r1, [r5]
	add r0, r0, #0x4800000
	add r0, r0, #0x4000
	mov r1, r1, lsl #1
	ldrh r2, [r0]
	and r1, r1, #0x400
	orr r1, r2, r1
	strh r1, [r0]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x1c]
	strh r1, [r0]
	ldr r0, [sp, #0x20]
	ldrh r1, [r0]
	add r0, r1, sb, lsl #1
	add r0, r0, #0xf
	mov r0, r0, lsr #2
	mov sb, r0, lsl #1
	cmp sb, #0xfb0
	ldrhsh r0, [r6, #0x9a]
	subhs sb, sb, r0, lsr #1
	ldr r0, [sp, #0x2c]
	cmp r1, r0
	bls _0200201C
	ldr r0, _02002300 ; =0x0000FFFF
	mov sb, sl
	strh r0, [r8]
	ldrh r0, [r6, #0xb4]
	add r0, r0, #1
	strh r0, [r6, #0xb4]
	b _020020A4
_0200201C:
	cmp r4, #0
	cmpne sb, sl
	beq _020020A4
	ldr r3, [sp, #0x30]
	mov r2, sb, lsl #1
	add r0, r2, #0x4000
	add r0, r0, #0x4800000
	cmp r0, r3
	ldrloh r0, [r0, #6]
	add r2, r2, #0x4800000
	add r2, r2, #0x4000
	ldrhsh r3, [r6, #0x9a]
	andlo r0, r0, #0xff
	subhs r0, r0, r3
	ldrh r2, [r2]
	ldrhsh r0, [r0, #6]
	tst r2, #0x7c00
	bne _0200207C
	cmp r0, #0xa
	cmpne r0, #0x14
	bne _0200207C
	ldr r0, [sp, #0x34]
	cmp r1, r0
	bls _020020A4
_0200207C:
	ldrh r0, [r6, #0xb4]
	ldr r1, _02002300 ; =0x0000FFFF
	add r0, r0, #1
	strh r0, [r6, #0xb4]
	mov r0, sl, lsl #0x10
	strh r1, [r8]
	mov r0, r0, lsr #0x10
	strh r0, [r7, #4]
	strh r0, [r5]
	b _02002268
_020020A4:
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, #0xc
	bne _02002204
	add r0, r8, #0xc
	bl sub_020028B0
	ldrh r0, [r0]
	str r0, [sp, #8]
	add r0, r8, #0x22
	bl sub_020028B0
	ldrh sl, [r0]
	ldrh r0, [r7]
	cmp r0, sl
	bne _02002108
	ldr r0, [sp, #8]
	tst r0, #0x800
	beq _02002108
	ldr r0, _020022E8 ; =0x0380FFF4
	ldr r1, [r0]
	ldr r0, [r1, #0x57c]
	add r0, r0, #1
	str r0, [r1, #0x57c]
	ldr r0, _02002300 ; =0x0000FFFF
	strh r0, [r8]
	b _020021DC
_02002108:
	ldr r0, _020022E8 ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x300
	ldrh r2, [r1, #0x3a]
	mov r2, r2, lsl #0x18
	movs r2, r2, lsr #0x1f
	ldreqh r1, [r1, #0x4c]
	cmpeq r1, #0x40
	bne _020021DC
	ldrh r1, [fp]
	cmp r1, #0
	beq _020021B4
	ldr r1, _020022F0 ; =0x04808098
	ldrh r1, [r1]
	tst r1, #0x8000
	beq _020021B4
	add r0, r0, #0x660
	bl sub_020057A8
	ldr r0, [sp, #0xc]
	mov r3, #0
	ldrh r1, [r0]
	ldr r0, _02002304 ; =0x000082EA
	mov r2, #0x3e8
	umull ip, r8, r1, r0
	mov r0, r3
	mla r8, r1, r0, r8
	mov r0, ip, lsr #6
	ldr r1, _02002304 ; =0x000082EA
	mov ip, r3
	mla r8, ip, r1, r8
	mov r1, r8, lsr #6
	orr r0, r0, r8, lsl #26
	bl sub_0200ED68
	mov r2, #0
	str r2, [sp]
	mov r2, r1
	mov r1, r0
	ldr r0, _020022E8 ; =0x0380FFF4
	ldr r3, _02002308 ; =0x027EA0BC
	ldr r0, [r0]
	add r0, r0, #0x660
	bl sub_020056C4
	b _020021DC
_020021B4:
	ldr r1, _02002300 ; =0x0000FFFF
	ldr r0, _020022FC ; =0x04805F7E
	mov sl, r1
	strh r1, [r0]
	ldr r0, [sp, #0x24]
	strh r1, [r0]
	ldr r0, _020022F4 ; =0x0480824E
	strh r1, [r0]
	mov r0, r1
	strh r0, [r8]
_020021DC:
	strh sl, [r7]
	bl sub_020028D8
	tst r0, #1
	beq _02002254
	ldr r0, _020022E8 ; =0x0380FFF4
	ldr r1, [r0]
	ldr r0, [r1, #0x5a8]
	add r0, r0, #1
	str r0, [r1, #0x5a8]
	b _02002254
_02002204:
	cmp r0, #0xd
	bne _02002254
	ldr r0, _020022E8 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3a]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	ldreqh r0, [r0, #0x4c]
	cmpeq r0, #0x40
	bne _02002254
	ldrh r0, [fp]
	cmp r0, #0
	beq _0200224C
	ldr r0, _020022F0 ; =0x04808098
	ldrh r0, [r0]
	tst r0, #0x8000
	bne _02002254
_0200224C:
	ldr r0, _02002300 ; =0x0000FFFF
	strh r0, [r8]
_02002254:
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [r7, #4]
	strh r0, [r5]
	b _02001EF4
_02002268:
	cmp r4, #0
	beq _020022BC
	ldr r0, _0200230C ; =0x04808054
	ldrh r4, [r0]
	bl sub_020028D8
	mov r0, r0, lsl #0x10
	movs r1, r0, lsr #0x10
	beq _020022BC
	ldr r0, _0200230C ; =0x04808054
	ldrh r0, [r0]
	cmp r4, r0
	bne _020022BC
	tst r1, #2
	beq _020022AC
	mov r0, #0x80
	bl sub_00FF3254
	b _020022BC
_020022AC:
	tst r1, #1
	beq _020022BC
	mov r0, #0x100
	bl sub_00FF3254
_020022BC:
	ldr r0, _02002310 ; =0x0480805A
	ldrh r1, [r0]
	ldrh r0, [r0, #-6]
	cmp r1, r0
	beq _020022DC
	mov r0, #0
	mov r1, #0xf
	bl sub_02000780
_020022DC:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020022E8: .word 0x0380FFF4
_020022EC: .word 0x04808010
_020022F0: .word 0x04808098
_020022F4: .word 0x0480824E
_020022F8: .word 0x000008EF
_020022FC: .word 0x04805F7E
_02002300: .word 0x0000FFFF
_02002304: .word 0x000082EA
_02002308: .word 0x027EA0BC
_0200230C: .word 0x04808054
_02002310: .word 0x0480805A
	arm_func_end sub_02001E58

	arm_func_start sub_02002314
sub_02002314: ; 0x02002314
	stmdb sp!, {r3, lr}
	ldr ip, _020023F8 ; =0x0380FFF4
	ldr r2, _020023FC ; =0x04808010
	ldr r1, [ip]
	mov r3, #0x1000
	add r1, r1, #0x2c
	strh r3, [r2]
	add r3, r1, #0x400
	ldrh r1, [r3, #0x3c]
	cmp r1, #0
	beq _020023F0
	ldr r1, [ip]
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #0x10
	cmpne r0, #0
	beq _020023E4
	add r0, r2, #0x204
	ldrh r1, [r2, #0xa6]
	ldrh r0, [r0]
	cmp r0, #3
	cmpne r0, #5
	bne _020023E4
	cmp r1, #0
	bne _020023E4
	ldr r3, [r3, #0x44]
	mov r2, #0
	ldrh r0, [r3, #2]
	b _02002398
_02002388:
	and r1, r0, #1
	mov r0, r0, lsl #0xf
	add r2, r2, r1
	mov r0, r0, lsr #0x10
_02002398:
	cmp r0, #0
	bne _02002388
	ldrh r0, [r3, #0x24]
	ldrh r1, [r3, #0xa]
	add r0, r0, #0xa
	mul r0, r2, r0
	add r0, r0, #0xc0
	add r0, r0, r1, lsl #2
	mov r0, r0, lsl #0x10
	ldr r1, _02002400 ; =0x037FA660
	mov r0, r0, lsr #0x10
	bl sub_00FF2D44
	ldr r0, _020023F8 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	b _020023F0
_020023E4:
	mov r0, #0
	mov r1, #0x10
	bl sub_02000780
_020023F0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020023F8: .word 0x0380FFF4
_020023FC: .word 0x04808010
_02002400: .word 0x037FA660
	arm_func_end sub_02002314

	arm_func_start sub_02002404
sub_02002404: ; 0x02002404
	stmdb sp!, {r3, lr}
	ldr r3, _02002500 ; =0x0380FFF4
	ldr r0, _02002504 ; =0x04808010
	ldr r2, [r3]
	mov r1, #0x80
	strh r1, [r0]
	ldr r1, [r3]
	add r2, r2, #0x2c
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #0x20
	beq _02002498
	add r1, r0, #0x204
	ldrh r3, [r1]
	add r1, r0, #0x258
	and r3, r3, #0xff
	ldrh ip, [r1]
	cmp r3, #3
	blo _02002498
	cmp r3, #5
	bhi _02002498
	ldr r3, [r2, #0x458]
	ldr r1, _02002508 ; =0x00000FFF
	and r3, r1, r3, lsr #1
	cmp ip, r3
	blo _02002498
	ldr r2, [r2, #0x430]
	and r1, r1, r2, lsr #1
	cmp ip, r1
	bhi _02002498
	add r1, r0, #0x234
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_02002498:
	ldr r1, _0200250C ; =0x04808000
	ldrh r0, [r1]
	cmp r0, #0x1440
	beq _020024F8
	add r0, r1, #0x19c
	ldrh r0, [r0]
	and r0, r0, #0x42
	cmp r0, #0x42
	bne _020024F8
	add r1, r1, #0x2b8
	ldrh r2, [r1]
	cmp r2, #0
	beq _020024F8
	mov r3, #0
	b _020024EC
_020024D4:
	cmp r3, #0x3e8
	add r3, r3, #1
	bls _020024EC
	mov r0, #0x40
	bl sub_00FF3254
	b _020024F8
_020024EC:
	ldrh r0, [r1]
	cmp r2, r0
	beq _020024D4
_020024F8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02002500: .word 0x0380FFF4
_02002504: .word 0x04808010
_02002508: .word 0x00000FFF
_0200250C: .word 0x04808000
	arm_func_end sub_02002404

	arm_func_start sub_02002510
sub_02002510: ; 0x02002510
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02002764 ; =0x0380FFF4
	ldr r0, _02002768 ; =0x04808010
	ldr r3, [r2]
	mov r1, #0x40
	strh r1, [r0]
	ldr r2, [r2]
	add r1, r3, #0x2c
	add r2, r2, #0x600
	ldrh r2, [r2, #0x90]
	add r4, r3, #0x344
	tst r2, #0x20
	add r5, r1, #0x400
	beq _0200275C
	ldrh r2, [r5, #0xa4]
	ldr r1, _0200276C ; =0x0000FFFF
	cmp r2, r1
	addeq r2, r0, #0x18c
	ldreqh r2, [r2]
	andeq r2, r2, #3
	cmpeq r2, #3
	bne _0200275C
	add r2, r0, #0x258
	ldrh r3, [r2]
	ldrh r2, [r0, #0x40]
	sub r1, r1, #0xf000
	and r1, r1, r2, lsr #1
	cmp r3, r1
	blt _0200275C
	ldrh r7, [r0, #0x44]
	mov r0, r7, lsl #1
	add r0, r0, #0x4000
	add r0, r0, #0x4800000
	add r0, r0, #8
	bl sub_020028B0
	add r0, r0, #4
	bl sub_020028B0
	ldrh r2, [r0]
	ldr r1, _02002770 ; =0x0000E7FF
	and r1, r2, r1
	cmp r1, #0x228
	bne _0200275C
	add r0, r0, #2
	bl sub_020028B0
	ldr r2, _02002774 ; =0x048080F8
	ldrh r1, [r2]
	sub r6, r1, #0x10000
	add r1, r2, #0x170
_020025D0:
	ldrh r3, [r1]
	sub r3, r3, r7
	mov r3, r3, lsl #0x10
	mov r8, r3, lsr #0x10
	tst r8, #0x8000
	ldrneh r3, [r4, #0x9a]
	addne r3, r8, r3, lsr #1
	movne r3, r3, lsl #0x10
	movne r8, r3, lsr #0x10
	cmp r8, #0xe
	bhi _02002618
	ldrh r3, [r2]
	sub r3, r3, r6
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0x40
	bhi _0200275C
	b _020025D0
_02002618:
	add r0, r0, #8
	mov r8, #0
	b _02002640
_02002624:
	bl sub_020028B0
	add r1, r4, r8, lsl #1
	ldrh r2, [r0], #2
	ldrh r1, [r1, #0x64]
	cmp r2, r1
	bne _0200275C
	add r8, r8, #1
_02002640:
	cmp r8, #3
	blo _02002624
	add r0, r0, #0xa
	bl sub_020028B0
	ldr r3, _02002774 ; =0x048080F8
	add r1, r3, #0x170
_02002658:
	ldrh r2, [r1]
	sub r2, r2, r7
	mov r2, r2, lsl #0x10
	mov r8, r2, lsr #0x10
	tst r8, #0x8000
	ldrneh r2, [r4, #0x9a]
	addne r2, r8, r2, lsr #1
	movne r2, r2, lsl #0x10
	movne r8, r2, lsr #0x10
	cmp r8, #0x14
	bhi _020026A0
	ldrh r2, [r3]
	sub r2, r2, r6
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #0x70
	bhi _0200275C
	b _02002658
_020026A0:
	ldr r2, _02002778 ; =0x04808028
	ldrh r3, [r0]
	ldrh r0, [r2]
	mov r1, #1
	tst r3, r1, lsl r0
	bne _0200275C
	ldrh r1, [r2, #0x70]
	mov r0, #0x40
	strh r1, [r5, #0xa4]
	strh r0, [r2, #0x8c]
	ldrh r0, [r4, #0xbe]
	add r1, r2, #0x174
	add r0, r0, #1
	strh r0, [r4, #0xbe]
_020026D8:
	ldrh r0, [r1]
	and r0, r0, #3
	cmp r0, #3
	beq _020026D8
	ldr r0, _0200277C ; =0x04808244
	mov r2, #8
	ldrh r1, [r0]
	sub r3, r0, #0x1c
	orr r1, r1, #0x40
	strh r1, [r0]
	ldrh r4, [r0]
	ldr r1, _02002764 ; =0x0380FFF4
	bic r4, r4, #0x40
	strh r4, [r0]
	strh r2, [r3]
	mov r2, #0
	strh r2, [r3]
	ldr r1, [r1]
	ldr r2, _0200276C ; =0x0000FFFF
	add r1, r1, #0x2c
	add r6, r1, #0x400
	ldrh r5, [r6, #0xa4]
	cmp r5, r2
	beq _0200275C
	sub r4, r0, #0x1b0
	ldrh r3, [r4]
	sub r1, r0, #0x214
	strh r5, [r4]
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	strh r3, [r4]
	strh r2, [r6, #0xa4]
_0200275C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02002764: .word 0x0380FFF4
_02002768: .word 0x04808010
_0200276C: .word 0x0000FFFF
_02002770: .word 0x0000E7FF
_02002774: .word 0x048080F8
_02002778: .word 0x04808028
_0200277C: .word 0x04808244
	arm_func_end sub_02002510

	arm_func_start sub_02002780
sub_02002780: ; 0x02002780
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02002844 ; =0x0380FFF4
	mov r0, #2
	ldr r1, [r1]
	mov r5, #0
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_00FF8EBC
	mov r0, #1
	bl sub_00FF8EBC
	mov r0, r5
	bl sub_00FF8EBC
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _020027D4
	ldr r0, [r4, #0x30]
	ldrh r0, [r0]
	cmp r0, #0
	movne r5, #1
	moveq r0, r5
	streqh r0, [r4, #0x28]
_020027D4:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _020027F8
	ldr r0, [r4, #0x1c]
	ldrh r0, [r0]
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4, #0x14]
	movne r5, #1
_020027F8:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0200281C
	ldr r0, [r4, #8]
	ldrh r0, [r0]
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4]
	movne r5, #1
_0200281C:
	cmp r5, #0
	beq _02002830
	mov r0, #0
	mov r1, #0xe
	bl sub_02000780
_02002830:
	mov r0, #0
	mov r1, #0x14
	bl sub_02000780
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02002844: .word 0x0380FFF4
	arm_func_end sub_02002780

	arm_func_start sub_02002848
sub_02002848: ; 0x02002848
	stmdb sp!, {r4, lr}
	mov r0, #0x1000000
	bl sub_02003B10
	ldr r2, _020028A8 ; =0x04808210
	mov r1, #0x1000
	ldrh r3, [r2]
	mov r4, r0
	strh r1, [r2, #0x34]
	mov r1, #0x64
	b _02002880
_02002870:
	ldrh r0, [r2]
	cmp r3, r0
	bne _02002888
	sub r1, r1, #1
_02002880:
	cmp r1, #0
	bne _02002870
_02002888:
	ldr r1, _020028AC ; =0x04808244
	mov r0, #0
	strh r0, [r1]
	bl sub_02002314
	mov r0, r4
	bl sub_02003AD8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020028A8: .word 0x04808210
_020028AC: .word 0x04808244
	arm_func_end sub_02002848

	arm_func_start sub_020028B0
sub_020028B0: ; 0x020028B0
	ldr r1, _020028D0 ; =0x04805F60
	cmp r0, r1
	ldrhs r1, _020028D4 ; =0x0380FFF4
	ldrhs r1, [r1]
	addhs r1, r1, #0x300
	ldrhsh r1, [r1, #0xde]
	subhs r0, r0, r1
	bx lr
	.align 2, 0
_020028D0: .word 0x04805F60
_020028D4: .word 0x0380FFF4
	arm_func_end sub_020028B0

	arm_func_start sub_020028D8
sub_020028D8: ; 0x020028D8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0200290C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x2c
	add r5, r0, #0x400
	add r0, r5, #0x50
	bl sub_00FF3A2C
	mov r4, r0
	add r0, r5, #0x64
	bl sub_00FF3A2C
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200290C: .word 0x0380FFF4
	arm_func_end sub_020028D8

	arm_func_start sub_02002910
sub_02002910: ; 0x02002910
	stmdb sp!, {r3, lr}
	ldr r0, _02002958 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xe8]
	cmp r0, #0
	beq _02002930
	bl sub_00FF9760
_02002930:
	ldr r0, _02002958 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	beq _02002950
	bl sub_00FF611C
_02002950:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02002958: .word 0x0380FFF4
	arm_func_end sub_02002910

	arm_func_start sub_0200295C
sub_0200295C: ; 0x0200295C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, _02002B28 ; =0x0380FFF4
	mov sl, #2
	ldr r1, [r7]
	mov fp, #0
	add r0, r1, #0x2c
	add r8, r0, #0x400
	ldr r0, _02002B2C ; =0x04808032
	add r6, r1, #0x344
	add r4, r0, #0x6e
_02002984:
	mov r0, #0x14
	mov r5, sl, lsl #2
	mla sb, sl, r0, r8
	add r0, r5, #0x4800000
	add r0, r0, #0x8000
	ldrh r0, [r0, #0xa0]
	tst r0, #0x8000
	bne _02002B18
	ldrh r0, [sb]
	cmp r0, #0
	beq _02002B18
	ldr r1, [sb, #0xc]
	cmp r1, #0
	beq _02002AF8
	ldr r0, [sb, #8]
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r1, [sb, #8]
	ldr r0, [sb, #0xc]
	ldrh r1, [r1, #0xc]
	strh r1, [r0, #0x14]
	ldr r0, [sb, #8]
	ldrh r1, [r0, #0xc]
	tst r1, #0x4000
	beq _02002AC4
	ldr r1, [r7]
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #8
	beq _02002AA8
	ldrh r1, [r0, #0xa]
	add r2, r0, #0xc
	add r1, r2, r1
	sub r1, r1, #7
	bic r2, r1, #1
	ldrh r1, [r2]
	cmp r1, #0
	ldreqh r1, [r2, #2]
	cmpeq r1, #0
	bne _02002AA8
	ldr r0, _02002B2C ; =0x04808032
	mov r1, #0x8000
	strh fp, [r0]
	strh r1, [r0]
	ldrh r0, [r6, #0xba]
	add r0, r0, #1
	strh r0, [r6, #0xba]
	ldr r0, [sb, #0xc]
	bl sub_00FF8464
	cmp r0, #0
	beq _02002A8C
	ldr r2, [sb, #0xc]
	mov r0, #2
	strh r0, [r2, #8]
	ldrh r0, [sb, #4]
	mov r1, #1
	add r0, r0, #1
	strh r0, [sb, #4]
	ldrh r0, [r8, #0xae]
	add r0, r0, #1
	strh r0, [r8, #0xae]
	ldr r0, [sb, #0xc]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
_02002A88:
	.byte 0x22, 0x00, 0x00, 0xEA
_02002A8C:
	ldr r1, [sb, #0xc]
	mov r0, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, r4]
	orr r0, r0, #0x8000
	strh r0, [r5, r4]
	b _02002B18
_02002AA8:
	ldrh r0, [r0, #4]
	ldr r2, [sb, #0xc]
	and r0, r0, #0xff
	ldrh r1, [r2, #0xc]
	add r0, r1, r0
	strh r0, [r2, #0xc]
	b _02002AD4
_02002AC4:
	ldrh r1, [r0, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, #0xff
	strh r1, [r0, #0xc]
_02002AD4:
	ldrh r0, [sb, #4]
	mov r1, #2
	add r0, r0, #1
	strh r0, [sb, #4]
	ldr r0, [sb, #0xc]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
_02002AF4:
	.byte 0x07, 0x00, 0x00, 0xEA
_02002AF8:
	ldrh r0, [sb, #4]
	mov r1, #3
	add r0, r0, #1
	strh r0, [sb, #4]
	ldr r0, [sb, #8]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
_02002B18:
	subs sl, sl, #1
	bpl _02002984
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02002B28: .word 0x0380FFF4
_02002B2C: .word 0x04808032
	arm_func_end sub_0200295C

	arm_func_start sub_02002B30
sub_02002B30: ; 0x02002B30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02002E80 ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0xdc
	add r5, r0, #0x400
_02002B44:
	ldr r1, _02002E84 ; =0x0480805A
	ldrh r0, [r5, #4]
	ldrh r6, [r1]
	cmp r6, r0
	beq _02002E78
	ldr r0, _02002E88 ; =0x000008C6
	cmp r6, r0
	blo _02002B68
	bl sub_00FF2394
_02002B68:
	mov r6, r6, lsl #1
	add r0, r6, #0x4000
	add r7, r0, #0x4800000
	add r0, r7, #2
	bl sub_020028B0
	add r1, r6, #0x4800000
	add r1, r1, #0x4000
	ldrh r2, [r1]
	ldr r1, _02002E8C ; =0x0000FFFF
	ldrh r6, [r0]
	cmp r2, r1
	ldreq r0, _02002E84 ; =0x0480805A
	streqh r6, [r0]
	beq _02002B44
	add r0, r7, #8
	bl sub_020028B0
	ldrh r1, [r0]
	mov r0, r7
	bl sub_02003038
	ldr r1, _02002E84 ; =0x0480805A
	movs r8, r0
	strh r6, [r1]
	bne _02002BEC
	ldrh r0, [r7]
	and r0, r0, #0xf
	cmp r0, #0xc
	bne _02002BE0
	mov r0, #0x10
	bl sub_00FF3254
	b _02002B44
_02002BE0:
	mov r0, #8
	bl sub_00FF3254
	b _02002B44
_02002BEC:
	ldr r0, _02002E80 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _02002C14
	ldrh r0, [r8, #0x14]
	tst r0, #0x4000
	movne r0, #0
	strneh r0, [r5, #2]
_02002C14:
	ldrh r0, [r8, #8]
	mov r6, #1
	tst r0, #0x200
	beq _02002C6C
	ldrh r0, [r8, #0x14]
	mov r0, r0, lsl #0x15
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	beq _02002C48
	ldrh r0, [r8, #0x2a]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	beq _02002E18
_02002C48:
	add r0, r4, #0x188
	add r1, r4, #0x1e8
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_02000B70
	mov r0, #2
	mov r1, #9
	bl sub_02000780
	b _02002E18
_02002C6C:
	and r0, r0, #0xf
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _02002E18
_02002C7C: ; jump table
	b _02002D08 ; case 0
	b _02002CF0 ; case 1
	b _02002E18 ; case 2
	b _02002E18 ; case 3
	b _02002E18 ; case 4
	b _02002D38 ; case 5
	b _02002E18 ; case 6
	b _02002E18 ; case 7
	b _02002CBC ; case 8
	b _02002E18 ; case 9
	b _02002E18 ; case 10
	b _02002E18 ; case 11
	b _02002D90 ; case 12
	b _02002DE4 ; case 13
	b _02002D70 ; case 14
	b _02002D70 ; case 15
_02002CBC:
	ldrh r0, [r8, #0x14]
	and r0, r0, #0xf
	cmp r0, #8
	bne _02002E18
	add r0, r4, #0x188
	add r1, r4, #0x1c4
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_02000B70
	mov r0, #2
	mov r1, #6
	bl sub_02000780
	b _02002E18
_02002CF0:
	ldrh r0, [r8, #0x14]
	cmp r0, #0x80
	bne _02002E18
	mov r0, r8
	bl sub_00FFAA28
	b _02002E18
_02002D08:
	ldrh r0, [r8, #0x14]
	tst r0, #0xf
	bne _02002E18
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_02000B70
	mov r0, #1
	mov r1, #7
	bl sub_02000780
	b _02002E18
_02002D38:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0xa4
	bne _02002E18
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_02000B70
	mov r0, #1
	mov r1, #7
	bl sub_02000780
	b _02002E18
_02002D70:
	ldrh r1, [r8, #0x14]
	ldr r0, _02002E90 ; =0x0000E7BF
	and r0, r1, r0
	cmp r0, #0x118
	bne _02002E18
	mov r0, r8
	bl sub_00FFA7A8
	b _02002E18
_02002D90:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0x228
	bne _02002E18
	ldr r0, _02002E80 ; =0x0380FFF4
	ldr r1, _02002E80 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x54]
	cmp r0, #0
	ldreq r0, _02002E94 ; =0x0480803C
	streqh r6, [r0]
	ldr r2, [r1]
	mov r0, r8
	ldr r1, [r2, #0x5ac]
	add r1, r1, #1
	str r1, [r2, #0x5ac]
	bl sub_00FFA62C
	mov r6, r0
	b _02002E18
_02002DE4:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0x218
	bne _02002E18
	ldr r1, _02002E80 ; =0x0380FFF4
	mov r0, r8
	ldr r2, [r1]
	ldr r1, [r2, #0x5b0]
	add r1, r1, #1
	str r1, [r2, #0x5b0]
	bl sub_00FFA954
	mov r6, r0
_02002E18:
	cmp r6, #0
	beq _02002E2C
	add r0, r4, #0x188
	sub r1, r8, #0x10
	bl sub_02000AF0
_02002E2C:
	ldr r3, _02002E80 ; =0x0380FFF4
	ldr r0, [r3]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #1
	beq _02002B44
	ldr r2, _02002E8C ; =0x0000FFFF
	ldr r1, _02002E98 ; =0x04805F60
	mov r6, #0
_02002E50:
	cmp r7, r1
	ldrhs r0, [r3]
	add r6, r6, #1
	addhs r0, r0, #0x300
	ldrhsh r0, [r0, #0xde]
	subhs r7, r7, r0
	cmp r6, #7
	strh r2, [r7], #2
	blo _02002E50
	b _02002B44
_02002E78:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02002E80: .word 0x0380FFF4
_02002E84: .word 0x0480805A
_02002E88: .word 0x000008C6
_02002E8C: .word 0x0000FFFF
_02002E90: .word 0x0000E7BF
_02002E94: .word 0x0480803C
_02002E98: .word 0x04805F60
	arm_func_end sub_02002B30

	arm_func_start sub_02002E9C
sub_02002E9C: ; 0x02002E9C
	stmdb sp!, {r4, lr}
	ldr r0, _02002F74 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x2c
	add r4, r0, #0x400
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02002F6C
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x44]
	ldrh r1, [r1, #0x10]
	ldrh r0, [r0, #2]
	cmp r1, r0
	beq _02002ED8
	bl sub_02002B30
_02002ED8:
	ldr r0, [r4, #0x44]
	ldrh r0, [r0, #4]
	ands r2, r0, #0xff
	ldr r0, _02002F74 ; =0x0380FFF4
	ldrne r1, [r0]
	ldrne r0, [r1, #0x5a0]
	addne r0, r0, r2
	ldreq r1, [r0]
	ldreq r0, [r1, #0x5a0]
	addeq r0, r0, #1
	str r0, [r1, #0x5a0]
	ldrh r1, [r4, #0x40]
	ldr r0, _02002F74 ; =0x0380FFF4
	add r1, r1, #1
	strh r1, [r4, #0x40]
	ldr ip, [r4, #0x90]
	ldr r1, [r4, #0x44]
	ldrh r3, [ip, #0x10]
	ldrh r2, [r1, #2]
	mov r1, #0
	eor r2, r3, r2
	strh r2, [ip, #0x12]
	ldr r2, [r4, #0x90]
	ldrh r2, [r2, #0x10]
	strh r2, [r4, #0xa0]
	strh r1, [r4, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xea]
	cmp r0, #0
	beq _02002F58
	bl sub_00FF207C
_02002F58:
	ldr r0, _02002F74 ; =0x0380FFF4
	ldr r1, [r4, #0x90]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_02000F40
_02002F6C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02002F74: .word 0x0380FFF4
	arm_func_end sub_02002E9C

	arm_func_start sub_02002F78
sub_02002F78: ; 0x02002F78
	stmdb sp!, {r4, lr}
	ldr r0, _0200302C ; =0x0380FFF4
	ldr r2, _02003030 ; =0x04808088
	ldr r1, [r0]
	ldrh r0, [r2]
	add r4, r1, #0x17c
	cmp r0, #0
	bne _02002FB8
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _02002FB8
	mov r1, #8
	mov r0, #2
	strh r1, [r2, #0x26]
	bl sub_00FF80DC
	b _02003024
_02002FB8:
	add r0, r1, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _02002FF0
	ldr r0, _02003034 ; =0x048080AE
	mov r1, #8
	strh r1, [r0]
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _02002FF0
	mov r0, #2
	bl sub_00FF80DC
_02002FF0:
	ldr r0, _02003034 ; =0x048080AE
	mov r1, #5
	strh r1, [r0]
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _02003010
	mov r0, #1
	bl sub_00FF80DC
_02003010:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _02003024
	mov r0, #0
	bl sub_00FF80DC
_02003024:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200302C: .word 0x0380FFF4
_02003030: .word 0x04808088
_02003034: .word 0x048080AE
	arm_func_end sub_02002F78

	arm_func_start sub_02003038
sub_02003038: ; 0x02003038
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020030A4 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	add r1, r5, #0x22
	bl sub_02000A54
	movs r4, r0
	moveq r0, #0
	beq _0200309C
	mov r1, r6
	add r0, r4, #0x18
	add r2, r5, #0xc
	bl sub_00FF2DE8
	sub r0, r5, #0x18
	strh r0, [r4, #0x16]
	ldrh r0, [r4, #0x22]
	ldrh r1, [r4, #0x1e]
	and r0, r0, #0xff
	and r1, r1, #0xff
	mov r0, r0, lsl #0x10
	orr r0, r1, r0, lsr #8
	strh r0, [r4, #0x1e]
	add r0, r4, #0x10
_0200309C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020030A4: .word 0x0380FFF4
	arm_func_end sub_02003038

	arm_func_start sub_020030A8
sub_020030A8: ; 0x020030A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02003378 ; =0x0380FFF4
	mov r0, #0
	ldr r7, [r1]
	mov r2, #0xb0
	add r1, r7, #0x2c
	add r4, r1, #0x400
	mov r1, r4
	add r5, r7, #0x344
	add r6, r7, #0x31c
	bl sub_020061B8
	add r0, r7, #0x400
	mov r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r4, #0xc]
	strh r1, [r4, #0x14]
	str r1, [r4, #0x20]
	strh r1, [r4, #0x28]
	ldr r0, _0200337C ; =0x0000FFFF
	str r1, [r4, #0x34]
	strh r0, [r4, #0xa2]
	strh r0, [r4, #0xa4]
	ldrh r0, [r5, #0xc]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0200335C
_02003110: ; jump table
	b _02003120 ; case 0
	b _0200319C ; case 1
	b _02003238 ; case 2
	b _020032E4 ; case 3
_02003120:
	ldr r7, _02003380 ; =0x04804170
	ldr r0, _02003384 ; =0x04804026
	str r7, [r4, #8]
	sub r1, r7, #0x148
	str r1, [r4, #0x1c]
	sub r2, r7, #0x170
	ldr r1, _02003388 ; =0x027F02FC
	str r2, [r4, #0x30]
	ldr r2, _0200338C ; =0x027F0478
	str r1, [r4, #0x10]
	ldr r1, _02003390 ; =0x027F0944
	str r2, [r4, #0x24]
	ldr r3, _02003394 ; =0x0000B6B8
	str r1, [r4, #0x38]
	sub r1, r7, #0x14c
	ldr r2, _02003398 ; =0x00001D46
	strh r3, [r1]
	strh r2, [r0]
	strh r3, [r7, #-4]
	add r0, r0, #0x148
	strh r2, [r0]
	add r1, r7, #0x620
	ldr r0, _0200339C ; =0x04804792
	strh r3, [r1]
	strh r2, [r0]
	mov r1, #8
	ldr r0, _020033A0 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #1
	strh r1, [r0]
	b _0200335C
_0200319C:
	ldr r3, _020033A4 ; =0x04804AA0
	ldr r2, _020033A8 ; =0x04804334
	str r3, [r4, #8]
	sub r0, r3, #0x148
	str r0, [r4, #0x1c]
	ldr r0, _02003388 ; =0x027F02FC
	str r2, [r4, #0x30]
	ldr r1, _0200338C ; =0x027F0478
	str r0, [r4, #0x10]
	ldr r0, _020033AC ; =0x027F09AC
	str r1, [r4, #0x24]
	ldr ip, _020033B0 ; =0x04804956
	str r0, [r4, #0x38]
	sub r1, r2, #0xfc
	str r1, [r4, #0x80]
	sub r7, r2, #0x334
	ldr r0, _02003394 ; =0x0000B6B8
	str r7, [r4, #0x44]
	sub r7, r2, #0x100
	ldr lr, _02003398 ; =0x00001D46
	strh r0, [r7]
	strh lr, [r2, #-0xfe]
	strh r0, [r2, #-4]
	strh lr, [r2, #-2]
	add r2, r2, #0x620
	strh r0, [r2]
	strh lr, [ip]
	strh r0, [r3, #-4]
	add r2, ip, #0x148
	strh lr, [r2]
	add r3, r3, #0x620
	ldr r2, _020033B4 ; =0x048050C2
	strh r0, [r3]
	strh lr, [r2]
	mov r0, #0x208
	strh r0, [r5, #0x8a]
	str r1, [r4, #0x80]
	bl sub_00FF93EC
	b _0200335C
_02003238:
	ldr r1, _020033B8 ; =0x048045D8
	ldr r3, _020033BC ; =0x04804232
	str r1, [r4, #8]
	sub r0, r1, #0x148
	str r0, [r4, #0x1c]
	sub r2, r1, #0x170
	ldr ip, _020033C0 ; =0x04804000
	ldr r0, _02003388 ; =0x027F02FC
	str r2, [r4, #0x30]
	ldr r2, _0200338C ; =0x027F0478
	str r0, [r4, #0x10]
	ldr r0, _02003390 ; =0x027F0944
	str r2, [r4, #0x24]
	str r0, [r4, #0x38]
	str ip, [r4, #0x58]
	add r2, ip, #0x234
	ldr r0, _02003394 ; =0x0000B6B8
	str r2, [r4, #0x6c]
	add r2, ip, #0x230
	ldr r4, _02003398 ; =0x00001D46
	strh r0, [r2]
	strh r4, [r3]
	sub r2, r1, #0x174
	strh r0, [r2]
	add r2, r3, #0x234
	strh r4, [r2]
	sub r2, r1, #0x14c
	strh r0, [r2]
	add r2, r3, #0x25c
	strh r4, [r2]
	strh r0, [r1, #-4]
	add r2, r3, #0x3a4
	strh r4, [r2]
	add r2, r1, #0x620
	ldr r1, _020033C4 ; =0x04804BFA
	strh r0, [r2]
	strh r4, [r1]
	mov r1, #0x108
	ldr r0, _020033A0 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #0xd
	strh r1, [r0]
	b _0200335C
_020032E4:
	ldr ip, _02003380 ; =0x04804170
	ldr r0, _02003384 ; =0x04804026
	str ip, [r4, #8]
	sub r1, ip, #0x148
	str r1, [r4, #0x1c]
	sub r2, ip, #0x170
	ldr r1, _02003388 ; =0x027F02FC
	str r2, [r4, #0x30]
	ldr r2, _0200338C ; =0x027F0478
	str r1, [r4, #0x10]
	ldr r1, _02003390 ; =0x027F0944
	str r2, [r4, #0x24]
	ldr r3, _02003394 ; =0x0000B6B8
	str r1, [r4, #0x38]
	sub r1, ip, #0x14c
	ldr r2, _02003398 ; =0x00001D46
	strh r3, [r1]
	strh r2, [r0]
	strh r3, [ip, #-4]
	add r0, r0, #0x148
	strh r2, [r0]
	add r1, ip, #0x620
	ldr r0, _0200339C ; =0x04804792
	strh r3, [r1]
	strh r2, [r0]
	mov r1, #0x108
	ldr r0, _020033A0 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #0xd
	strh r1, [r0]
_0200335C:
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	ldrneh r0, [r5, #0x8a]
	orrne r0, r0, #0x4000
	strneh r0, [r5, #0x8a]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02003378: .word 0x0380FFF4
_0200337C: .word 0x0000FFFF
_02003380: .word 0x04804170
_02003384: .word 0x04804026
_02003388: .word 0x027F02FC
_0200338C: .word 0x027F0478
_02003390: .word 0x027F0944
_02003394: .word 0x0000B6B8
_02003398: .word 0x00001D46
_0200339C: .word 0x04804792
_020033A0: .word 0x048080AE
_020033A4: .word 0x04804AA0
_020033A8: .word 0x04804334
_020033AC: .word 0x027F09AC
_020033B0: .word 0x04804956
_020033B4: .word 0x048050C2
_020033B8: .word 0x048045D8
_020033BC: .word 0x04804232
_020033C0: .word 0x04804000
_020033C4: .word 0x04804BFA
	arm_func_end sub_020030A8

	arm_func_start sub_020033C8
sub_020033C8: ; 0x020033C8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _020034C0 ; =0x0380FFF4
	mov r0, #0
	ldr r3, [r1]
	mov r2, #0x50
	add r1, r3, #0xdc
	add r5, r1, #0x400
	mov r1, r5
	add r4, r3, #0x344
	bl sub_020061B8
	ldr r1, _020034C4 ; =0x04808030
	mov r2, #0x8000
	ldr r0, _020034C0 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02003444
_02003418: ; jump table
	b _02003428 ; case 0
	b _02003430 ; case 1
	b _02003438 ; case 2
	b _02003440 ; case 3
_02003428:
	ldr r6, _020034C8 ; =0x00000794
	b _02003444
_02003430:
	ldr r6, _020034CC ; =0x000010C4
	b _02003444
_02003438:
	ldr r6, _020034D0 ; =0x00000BFC
	b _02003444
_02003440:
	ldr r6, _020034C8 ; =0x00000794
_02003444:
	ldr r3, _020034D4 ; =0x04808050
	add r0, r6, #0x4000
	ldr r1, _020034D8 ; =0x00005F60
	add r2, r0, #0x4800000
	mov r0, r6, lsl #0xf
	strh r2, [r3]
	mov r0, r0, lsr #0x10
	strh r0, [r3, #6]
	strh r1, [r3, #2]
	strh r0, [r3, #0xa]
	ldr r2, _020034DC ; =0x0000FFFF
	strh r0, [r5, #4]
	sub r0, r1, #0x4000
	strh r2, [r5]
	sub r0, r0, r6
	strh r0, [r4, #0x9a]
	sub r0, r1, #2
	strh r0, [r3, #0x12]
	rsb r0, r2, #0x18000
	strh r0, [r3, #-0x20]
	add r0, r3, #0x1fc
	ldr r1, _020034E0 ; =0x0480824E
	strh r2, [r0]
	ldr r0, _020034E4 ; =0x04805F70
	strh r2, [r1]
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #0xe]
	strh r2, [r0, #6]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020034C0: .word 0x0380FFF4
_020034C4: .word 0x04808030
_020034C8: .word 0x00000794
_020034CC: .word 0x000010C4
_020034D0: .word 0x00000BFC
_020034D4: .word 0x04808050
_020034D8: .word 0x00005F60
_020034DC: .word 0x0000FFFF
_020034E0: .word 0x0480824E
_020034E4: .word 0x04805F70
	arm_func_end sub_020033C8

	arm_func_start sub_020034E8
sub_020034E8: ; 0x020034E8
	ldr r1, _02003510 ; =0x0480819C
	mov r2, #0xfa0
	b _02003504
_020034F4:
	ldrh r0, [r1]
	tst r0, #0x80
	bxne lr
	sub r2, r2, #1
_02003504:
	cmp r2, #0
	bne _020034F4
	bx lr
	.align 2, 0
_02003510: .word 0x0480819C
	arm_func_end sub_020034E8

	arm_func_start sub_02003514
sub_02003514: ; 0x02003514
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r2, _02003594 ; =0x000082EA
	mov r3, #0
	umull lr, ip, r0, r2
	mla ip, r0, r3, ip
	mov r0, r3
	mla ip, r0, r2, ip
	mov r0, lr, lsr #6
	mov r4, #1
	mov r5, r1
	mov r1, ip, lsr #6
	orr r0, r0, ip, lsl #26
	mov r2, #0x3e8
	str r4, [sp, #4]
	bl sub_0200ED68
	add r3, sp, #4
	str r3, [sp]
	ldr r2, _02003598 ; =0x0380FFF4
	mov r3, r5
	ldr r2, [r2]
	add ip, r2, #0x234
	mov r2, r1
	mov r1, r0
	add r0, ip, #0x400
	bl sub_020056C4
_0200357C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0200357C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02003594: .word 0x000082EA
_02003598: .word 0x0380FFF4
	arm_func_end sub_02003514
_0200359C:
	.byte 0x38, 0x40, 0x2D, 0xE9
	.byte 0x58, 0x10, 0x9F, 0xE5, 0x58, 0xE0, 0x9F, 0xE5, 0x01, 0x50, 0xA0, 0xE3, 0x7B, 0x2F, 0x81, 0xE2
	.byte 0x5D, 0x3F, 0x81, 0xE2, 0x00, 0xC0, 0xA0, 0xE3, 0x0C, 0x00, 0x00, 0xEA, 0xB0, 0x40, 0xDE, 0xE1
	.byte 0xB0, 0xC0, 0xCE, 0xE1, 0xB0, 0x00, 0xD3, 0xE1, 0x03, 0x00, 0x00, 0xE2, 0x03, 0x00, 0x50, 0xE3
	.byte 0xB0, 0x00, 0xD2, 0x11, 0x05, 0x00, 0x50, 0x13, 0x07, 0x00, 0x50, 0x13, 0x08, 0x00, 0x50, 0x13
	.byte 0xB0, 0xC0, 0xC1, 0x11, 0xB0, 0x00, 0xDE, 0xE1, 0x0C, 0x50, 0xA0, 0x11, 0xB0, 0x40, 0xCE, 0xE1
	.byte 0x00, 0x00, 0x55, 0xE3, 0xF0, 0xFF, 0xFF, 0x1A, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x28, 0x80, 0x80, 0x04, 0x08, 0x02, 0x00, 0x04, 0x28, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3
	.byte 0x04, 0x00, 0x00, 0xEA, 0xB0, 0x00, 0xD1, 0xE1, 0x01, 0x00, 0x10, 0xE3, 0x00, 0x00, 0xA0, 0x03
	.byte 0x1E, 0xFF, 0x2F, 0x01, 0x01, 0x20, 0x82, 0xE2, 0x0A, 0x0B, 0x52, 0xE3, 0xF8, 0xFF, 0xFF, 0x3A
	.byte 0x01, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1, 0x5E, 0x81, 0x80, 0x04, 0x28, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x20, 0xA0, 0xE3, 0x04, 0x00, 0x00, 0xEA, 0xB0, 0x00, 0xD1, 0xE1, 0x01, 0x00, 0x10, 0xE3
	.byte 0x00, 0x00, 0xA0, 0x03, 0x1E, 0xFF, 0x2F, 0x01, 0x01, 0x20, 0x82, 0xE2, 0x0A, 0x0B, 0x52, 0xE3
	.byte 0xF8, 0xFF, 0xFF, 0x3A, 0x01, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1, 0x80, 0x81, 0x80, 0x04
	.byte 0x00, 0x40, 0x2D, 0xE9, 0x01, 0xC3, 0xA0, 0xE3, 0x21, 0xCE, 0x8C, 0xE2, 0x08, 0x10, 0x1C, 0xE5
	.byte 0x00, 0x00, 0x51, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x00, 0x80, 0xBD, 0xE8
	.byte 0x06, 0x00, 0x9C, 0xE8, 0x02, 0x10, 0x11, 0xE0, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x00, 0x80, 0xBD, 0xE8, 0x01, 0x30, 0xA0, 0xE3, 0x00, 0x00, 0xA0, 0xE3, 0x13, 0x20, 0x11, 0xE0
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x80, 0xE2, 0xFA, 0xFF, 0xFF, 0x0A
	.byte 0x04, 0x20, 0x8C, 0xE5, 0x08, 0x10, 0x9F, 0xE5, 0x00, 0x01, 0x91, 0xE7, 0x04, 0xE0, 0x9F, 0xE5
	.byte 0x10, 0xFF, 0x2F, 0xE1, 0xF4, 0x74, 0x80, 0x03, 0xF4, 0xB4, 0x7F, 0x03, 0x34, 0xC1, 0x9F, 0xE5
	.byte 0x00, 0x30, 0xA0, 0xE3, 0x00, 0xC0, 0x9C, 0xE5, 0x01, 0x20, 0xA0, 0xE3, 0x00, 0x00, 0x5C, 0xE3
	.byte 0x0D, 0x00, 0x00, 0x0A, 0x48, 0x20, 0x8C, 0xE5, 0x5C, 0x30, 0x8C, 0xE5, 0x60, 0x30, 0x8C, 0xE5
	.byte 0x64, 0x00, 0x9C, 0xE5, 0x64, 0x30, 0x8C, 0xE5, 0x00, 0xC0, 0xA0, 0xE1, 0x00, 0x00, 0x5C, 0xE3
	.byte 0xF7, 0xFF, 0xFF, 0x1A, 0xFC, 0xC0, 0x9F, 0xE5, 0x00, 0x30, 0x8C, 0xE5, 0x04, 0x30, 0x8C, 0xE5
	.byte 0xF4, 0xC0, 0x9F, 0xE5, 0x01, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xCC, 0xE1, 0xE8, 0xC0, 0x9F, 0xE5
	.byte 0xB0, 0x10, 0xDC, 0xE1, 0x00, 0x00, 0x51, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x04, 0xF0, 0x9D, 0xE4, 0x00, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xCC, 0xE1, 0xD2, 0x30, 0xA0, 0xE3
	.byte 0x03, 0xF0, 0x21, 0xE1, 0x08, 0x20, 0x8C, 0xE2, 0x00, 0x10, 0x92, 0xE5, 0x00, 0x00, 0x51, 0xE3
	.byte 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA, 0xB8, 0x04, 0xD1, 0xE1, 0x00, 0x00, 0x00, 0x1A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x4C, 0x10, 0x91, 0xE5, 0xF4, 0xFF, 0xFF, 0x1A, 0x00, 0x00, 0x51, 0xE3, 0x02, 0x00, 0x00, 0x1A
	.byte 0x92, 0x30, 0xA0, 0xE3, 0x03, 0xF0, 0x21, 0xE1, 0x04, 0xF0, 0x9D, 0xE4, 0x04, 0x00, 0x9C, 0xE5
	.byte 0x00, 0x00, 0x51, 0xE1, 0xF9, 0xFF, 0xFF, 0x0A, 0x0C, 0x30, 0x9C, 0xE5, 0x00, 0x00, 0x53, 0xE3
	.byte 0x03, 0x00, 0x00, 0x0A, 0x03, 0x10, 0x2D, 0xE9, 0x0F, 0xE0, 0xA0, 0xE1, 0x13, 0xFF, 0x2F, 0xE1
	.byte 0x03, 0x10, 0xBD, 0xE8, 0x04, 0x10, 0x8C, 0xE5, 0x00, 0x20, 0x4F, 0xE1, 0x00, 0x20, 0xA0, 0xE5
	.byte 0x0C, 0x00, 0xBD, 0xE9, 0x0C, 0x00, 0xA0, 0xE9, 0x0C, 0x50, 0xBD, 0xE9, 0xFC, 0x7F, 0xE0, 0xE9
	.byte 0x00, 0x40, 0xA0, 0xE9, 0xD3, 0x30, 0xA0, 0xE3, 0x03, 0xF0, 0x21, 0xE1, 0x00, 0x20, 0xA0, 0xE9
	.byte 0x44, 0xD0, 0x91, 0xE5, 0xD2, 0x30, 0xA0, 0xE3, 0x03, 0xF0, 0x21, 0xE1, 0x00, 0x20, 0xB1, 0xE5
	.byte 0x02, 0xF0, 0x69, 0xE1, 0x40, 0xE0, 0x91, 0xE5, 0xFF, 0x7F, 0xD1, 0xE9, 0x00, 0x00, 0xA0, 0xE1
	.byte 0x0F, 0x50, 0x2D, 0xE8, 0x00, 0x80, 0xBD, 0xE8, 0x08, 0x76, 0x80, 0x03, 0xA4, 0x76, 0x80, 0x03
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02003824
sub_02003824: ; 0x02003824
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _0200389C ; =0x03807610
	ldr r3, _020038A0 ; =0x038074E0
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _0200386C
	ldr r0, _020038A4 ; =0x03807618
	ldr r0, [r0, r5]
	mov lr, pc
	bx r1
_0200386C:
	ldr r2, _020038A8 ; =0x0380FFF8
	ldr r0, _020038AC ; =0x03807614
	ldr r1, [r2]
	orr r1, r1, r4
	str r1, [r2]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _02003894
	mov r0, r4
	bl sub_02003B10
_02003894:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200389C: .word 0x03807610
_020038A0: .word 0x038074E0
_020038A4: .word 0x03807618
_020038A8: .word 0x0380FFF8
_020038AC: .word 0x03807614
	arm_func_end sub_02003824
_020038B0:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x02, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x03, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x04, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x05, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x06, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x07, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0x3C, 0xB6, 0x7F, 0x03
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x38, 0x20, 0x9F, 0xE5, 0x38, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0x92, 0xE5
	.byte 0x60, 0x30, 0x90, 0xE5, 0x01, 0x00, 0x81, 0xE2, 0x00, 0x00, 0x82, 0xE5, 0x00, 0x00, 0x53, 0xE3
	.byte 0x01, 0x00, 0x00, 0x0A, 0x0F, 0xE0, 0xA0, 0xE1, 0x13, 0xFF, 0x2F, 0xE1, 0x18, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x91, 0xE5, 0x01, 0x00, 0x80, 0xE3, 0x00, 0x00, 0x81, 0xE5, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x3C, 0xFC, 0x7F, 0x02, 0x10, 0x76, 0x80, 0x03, 0xF8, 0xFF, 0x80, 0x03

	arm_func_start sub_02003980
sub_02003980: ; 0x02003980
	ldr r0, _0200399C ; =0x03807608
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _020039A0 ; =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_0200399C: .word 0x03807608
_020039A0: .word 0x027FFC3C
	arm_func_end sub_02003980

	arm_func_start sub_020039A4
sub_020039A4: ; 0x020039A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _02003A34 ; =0x038074F4
	mov sb, #0
	mov r2, #0xc
	ldr r5, _02003A38 ; =0x03807670
	ldr r7, _02003A3C ; =0x03807610
	mov r8, sb
	mov lr, sb
	mov ip, #1
	mov r3, r2
_020039CC:
	tst r0, #1
	beq _02003A1C
	mov sl, r8
	cmp sb, #8
	blt _020039F0
	cmp sb, #0xb
	suble r6, sb, #8
	mlale sl, r6, r3, r7
	ble _02003A14
_020039F0:
	cmp sb, #3
	blt _02003A08
	cmp sb, #6
	addle r6, sb, #1
	mlale sl, r6, r2, r7
	ble _02003A14
_02003A08:
	cmp sb, #0
	strne r1, [r4, sb, lsl #2]
	moveq sl, r5
_02003A14:
	cmp sl, #0
	stmneia sl, {r1, ip, lr}
_02003A1C:
	add sb, sb, #1
	cmp sb, #0x19
	mov r0, r0, lsr #1
	blt _020039CC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02003A34: .word 0x038074F4
_02003A38: .word 0x03807670
_02003A3C: .word 0x03807610
	arm_func_end sub_020039A4

	arm_func_start sub_02003A40
sub_02003A40: ; 0x02003A40
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _02003A80 ; =0x03807640
	ldr r3, _02003A84 ; =0x03807648
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	mov r0, r1, lsl r0
	str r2, [r3, r4]
	bl sub_02003AD8
	ldr r0, _02003A88 ; =0x03807644
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02003A80: .word 0x03807640
_02003A84: .word 0x03807648
_02003A88: .word 0x03807644
	arm_func_end sub_02003A40

	arm_func_start sub_02003A8C
sub_02003A8C: ; 0x02003A8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AC0
	ldr r1, _02003ABC ; =0x04000210
	ldr r3, [r1]
	sub r2, r1, #8
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02003ABC: .word 0x04000210
	arm_func_end sub_02003A8C

	arm_func_start sub_02003AC0
sub_02003AC0: ; 0x02003AC0
	ldr r2, _02003AD4 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_02003AD4: .word 0x04000208
	arm_func_end sub_02003AC0

	arm_func_start sub_02003AD8
sub_02003AD8: ; 0x02003AD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AC0
	ldr ip, _02003B0C ; =0x04000210
	ldr r3, [ip]
	sub r2, ip, #8
	orr r1, r3, r4
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02003B0C: .word 0x04000210
	arm_func_end sub_02003AD8

	arm_func_start sub_02003B10
sub_02003B10: ; 0x02003B10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AC0
	ldr ip, _02003B48 ; =0x04000210
	mvn r1, r4
	ldr r3, [ip]
	sub r2, ip, #8
	and r1, r3, r1
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02003B48: .word 0x04000210
	arm_func_end sub_02003B10

	arm_func_start sub_02003B4C
sub_02003B4C: ; 0x02003B4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AC0
	ldr r1, _02003B7C ; =0x04000214
	ldr r3, [r1]
	sub r2, r1, #0xc
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02003B7C: .word 0x04000214
	arm_func_end sub_02003B4C

	arm_func_start sub_02003B80
sub_02003B80: ; 0x02003B80
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02003BE8 ; =0x0380767C
	ldr r1, [r0]
	cmp r1, #0
	bne _02003BE0
	ldr r4, _02003BEC ; =0x027FFFF0
	mov r2, #1
	mov r1, #0
	str r2, [r0]
	strh r1, [r4, #6]
	mov r5, #0x400
	b _02003BB8
_02003BB0:
	mov r0, r5
	bl sub_02003BF4
_02003BB8:
	ldrh r0, [r4, #4]
	cmp r0, #0x7f
	bne _02003BB0
	ldr r1, _02003BF0 ; =0x027FFFB8
	mvn r0, #0
	str r0, [r1]
	mov r0, r0, lsl #0x10
	str r0, [r1, #4]
	mov r0, #0xbf
	strh r0, [r4, #6]
_02003BE0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02003BE8: .word 0x0380767C
_02003BEC: .word 0x027FFFF0
_02003BF0: .word 0x027FFFB8
	arm_func_end sub_02003B80

	arm_func_start sub_02003BF4
sub_02003BF4: ; 0x02003BF4
	ldr ip, _02003BFC ; =sub_038037B8
	bx ip
	.align 2, 0
_02003BFC: .word sub_038037B8
	arm_func_end sub_02003BF4

	arm_func_start sub_02003C00
sub_02003C00: ; 0x02003C00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	cmp r0, r1
	mov r5, r3
	mvnne r0, #1
	bne _02003C74
	cmp r5, #0
	beq _02003C30
	bl sub_02005F14
	b _02003C34
_02003C30:
	bl sub_02005EE8
_02003C34:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _02003C50
	mov lr, pc
	bx r6
_02003C50:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _02003C6C
	bl sub_02005F28
	b _02003C70
_02003C6C:
	bl sub_02005EFC
_02003C70:
	mov r0, #0
_02003C74:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02003C00

	arm_func_start sub_02003C7C
sub_02003C7C: ; 0x02003C7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _02003C9C
	bl sub_02005F14
	b _02003CA0
_02003C9C:
	bl sub_02005EE8
_02003CA0:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl sub_02006494
	movs r4, r0
	bne _02003CCC
	cmp r7, #0
	beq _02003CC8
	mov lr, pc
	bx r7
_02003CC8:
	strh sb, [r8, #4]
_02003CCC:
	cmp r6, #0
	mov r0, r5
	beq _02003CE0
	bl sub_02005F28
	b _02003CE4
_02003CE0:
	bl sub_02005EFC
_02003CE4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end sub_02003C7C

	arm_func_start sub_02003CF0
sub_02003CF0: ; 0x02003CF0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _02003D38 ; =0x027FFFE8
	ldr r5, _02003D3C ; =0x037FBBA4
	mov r8, r0
	mov r7, #0x400
	mov r4, #1
	b _02003D14
_02003D0C:
	mov r0, r7
	bl sub_02003BF4
_02003D14:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl sub_02003C7C
	cmp r0, #0
	bgt _02003D0C
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02003D38: .word 0x027FFFE8
_02003D3C: .word 0x037FBBA4
	arm_func_end sub_02003CF0

	arm_func_start sub_02003D40
sub_02003D40: ; 0x02003D40
	ldr ip, _02003D54 ; =sub_037FBA18
	ldr r1, _02003D58 ; =0x027FFFE8
	ldr r2, _02003D5C ; =0x037FBBA8
	mov r3, #1
	bx ip
	.align 2, 0
_02003D54: .word sub_037FBA18
_02003D58: .word 0x027FFFE8
_02003D5C: .word 0x037FBBA8
	arm_func_end sub_02003D40

	arm_func_start sub_02003D60
sub_02003D60: ; 0x02003D60
	ldr r1, _02003D68 ; =sub_037FBB58
	bx r1
	.align 2, 0
_02003D68: .word sub_037FBB58
	arm_func_end sub_02003D60

	arm_func_start sub_02003D6C
sub_02003D6C: ; 0x02003D6C
	ldr ip, _02003D80 ; =sub_037FBA94
	ldr r1, _02003D84 ; =0x027FFFE8
	ldr r2, _02003D88 ; =0x037FBBA4
	mov r3, #1
	bx ip
	.align 2, 0
_02003D80: .word sub_037FBA94
_02003D84: .word 0x027FFFE8
_02003D88: .word 0x037FBBA4
	arm_func_end sub_02003D6C
_02003D8C:
	.byte 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02003D94
sub_02003D94: ; 0x02003D94
	ldr ip, _02003DA8 ; =sub_037FBA18
	ldr r1, _02003DAC ; =0x027FFFE0
	ldr r2, _02003DB0 ; =0x037FBBF0
	mov r3, #0
	bx ip
	.align 2, 0
_02003DA8: .word sub_037FBA18
_02003DAC: .word 0x027FFFE0
_02003DB0: .word 0x037FBBF0
	arm_func_end sub_02003D94

	arm_func_start sub_02003DB4
sub_02003DB4: ; 0x02003DB4
	ldr ip, _02003DC8 ; =sub_037FBA94
	ldr r1, _02003DCC ; =0x027FFFE0
	ldr r2, _02003DD0 ; =0x037FBBEC
	mov r3, #0
	bx ip
	.align 2, 0
_02003DC8: .word sub_037FBA94
_02003DCC: .word 0x027FFFE0
_02003DD0: .word 0x037FBBEC
	arm_func_end sub_02003DB4
_02003DD4:
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02003DDC
sub_02003DDC: ; 0x02003DDC
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end sub_02003DDC

	arm_func_start sub_02003DE4
sub_02003DE4: ; 0x02003DE4
	ldr r3, _02003E84 ; =0x027FFFB8
	ldr r1, [r3]
	mov r2, #0
	mov r0, #0x80000000
_02003DF4:
	tst r1, r0
	bne _02003E10
	add r2, r2, #1
	cmp r2, #0x20
	beq _02003E10
	mov r0, r0, lsr #1
	b _02003DF4
_02003E10:
	cmp r2, #0x20
	bne _02003E1C
	b _02003E20
_02003E1C:
	mov r0, #0x80
_02003E20:
	bne _02003E68
	add r3, r3, #4
	ldr r1, [r3]
	mov r2, #0
	mov r0, #0x80000000
_02003E34:
	tst r1, r0
	bne _02003E50
	add r2, r2, #1
	cmp r2, #0x20
	beq _02003E50
	mov r0, r0, lsr #1
	b _02003E34
_02003E50:
	cmp r2, #0x20
	ldr r0, _02003E88 ; =0xFFFFFFFD
	beq _02003E60
	b _02003E64
_02003E60:
	bx lr
_02003E64:
	mov r0, #0xa0
_02003E68:
	add r0, r0, r2
	mov r1, #0x80000000
	mov r1, r1, lsr r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_02003E84: .word 0x027FFFB8
_02003E88: .word 0xFFFFFFFD
	arm_func_end sub_02003DE4

	arm_func_start sub_02003E8C
sub_02003E8C: ; 0x02003E8C
	ldr r3, _02003ED0 ; =0x027FFFB8
	cmp r0, #0xa0
	bpl _02003E9C
	b _02003EA0
_02003E9C:
	add r3, r3, #4
_02003EA0:
	bpl _02003EA8
	b _02003EAC
_02003EA8:
	sub r0, r0, #0xa0
_02003EAC:
	bmi _02003EB4
	b _02003EB8
_02003EB4:
	sub r0, r0, #0x80
_02003EB8:
	mov r1, #0x80000000
	mov r1, r1, lsr r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_02003ED0: .word 0x027FFFB8
	arm_func_end sub_02003E8C

	arm_func_start sub_02003ED4
sub_02003ED4: ; 0x02003ED4
	ldr ip, [r0]
	b _02003EE8
_02003EDC:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x64]
_02003EE8:
	cmp ip, #0
	beq _02003F00
	ldr r3, [ip, #0x54]
	ldr r2, [r1, #0x54]
	cmp r3, r2
	bls _02003EDC
_02003F00:
	cmp ip, #0
	bne _02003F2C
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	mov r2, #0
	str r2, [r1, #0x64]
	str r1, [r0, #4]
	bx lr
_02003F2C:
	ldr r2, [ip, #0x60]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	str ip, [r1, #0x64]
	str r1, [ip, #0x60]
	bx lr
	arm_func_end sub_02003ED4

	arm_func_start sub_02003F4C
sub_02003F4C: ; 0x02003F4C
	stmdb sp!, {r3, lr}
	ldr lr, [r0]
	mov r2, lr
	b _02003F90
_02003F5C:
	ldr r3, [r2, #0x64]
	cmp r2, r1
	bne _02003F8C
	ldr ip, [r2, #0x60]
	cmp lr, r2
	streq r3, [r0]
	strne r3, [ip, #0x64]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x60]
	b _02003F98
_02003F8C:
	mov r2, r3
_02003F90:
	cmp r2, #0
	bne _02003F5C
_02003F98:
	mov r0, r2
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02003F4C
_02003FA4:
	.byte 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0x52, 0xE3, 0x06, 0x00, 0x00, 0x0A
	.byte 0x10, 0x10, 0x92, 0xE5, 0x00, 0x10, 0x80, 0xE5, 0x00, 0x00, 0x51, 0xE3, 0x00, 0x00, 0xA0, 0x13
	.byte 0x14, 0x00, 0x81, 0x15, 0x00, 0x10, 0xA0, 0x03, 0x04, 0x10, 0x80, 0x05, 0x02, 0x00, 0xA0, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02003FD4
sub_02003FD4: ; 0x02003FD4
	stmdb sp!, {r3, lr}
	ldr r1, _02004030 ; =0x03807680
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _02003FF4
_02003FEC:
	mov ip, r3
	ldr r3, [r3, #0x4c]
_02003FF4:
	cmp r3, #0
	beq _0200400C
	ldr r2, [r3, #0x54]
	ldr r1, [r0, #0x54]
	cmp r2, r1
	blo _02003FEC
_0200400C:
	cmp ip, #0
	ldreq r1, _02004030 ; =0x03807680
	streq lr, [r0, #0x4c]
	streq r0, [r1, #0x2c]
	ldrne r1, [ip, #0x4c]
	strne r1, [r0, #0x4c]
	strne r0, [ip, #0x4c]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02004030: .word 0x03807680
	arm_func_end sub_02003FD4
_02004034:
	.byte 0x38, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x2C, 0x10, 0x91, 0xE5
	.byte 0x01, 0x00, 0x00, 0xEA, 0x01, 0x20, 0xA0, 0xE1, 0x4C, 0x10, 0x91, 0xE5, 0x00, 0x00, 0x51, 0xE3
	.byte 0x00, 0x00, 0x51, 0x11, 0xFA, 0xFF, 0xFF, 0x1A, 0x00, 0x00, 0x52, 0xE3, 0x4C, 0x10, 0x90, 0x05
	.byte 0x0C, 0x00, 0x9F, 0x05, 0x2C, 0x10, 0x80, 0x05, 0x4C, 0x00, 0x90, 0x15, 0x4C, 0x00, 0x82, 0x15
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x80, 0x76, 0x80, 0x03

	arm_func_start sub_02004078
sub_02004078: ; 0x02004078
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02004144 ; =0x03807680
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _0200413C
	ldrh r0, [r0, #0x26]
	ldr r4, _02004148 ; =0x038076A4
	cmp r0, #0
	bne _020040A8
	bl sub_02005F40
	cmp r0, #0x12
	bne _020040B4
_020040A8:
	mov r0, #1
	strh r0, [r4]
	b _0200413C
_020040B4:
	ldr r0, _02004144 ; =0x03807680
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl sub_02004580
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	beq _0200413C
	ldr r0, [r6, #0x48]
	cmp r0, #2
	beq _020040F0
	mov r0, r6
	bl sub_02004834
	cmp r0, #0
	bne _0200413C
_020040F0:
	ldr r0, _02004144 ; =0x03807680
	ldr r2, [r0]
	cmp r2, #0
	beq _02004110
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_02004110:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _0200412C
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_0200412C:
	ldr r1, _02004144 ; =0x03807680
	mov r0, r5
	str r5, [r1, #0x28]
	bl sub_02004868
_0200413C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02004144: .word 0x03807680
_02004148: .word 0x038076A4
	arm_func_end sub_02004078

	arm_func_start sub_0200414C
sub_0200414C: ; 0x0200414C
	stmdb sp!, {r3, lr}
	ldr r0, _02004210 ; =0x03807680
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _02004208
	ldr r1, _02004214 ; =0x038076A8
	mov r2, #1
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	mov r1, #0x10
	str r1, [r0, #0x12c]
	mov r3, #0
	str r3, [r0, #0x128]
	str r2, [r0, #0x120]
	str r3, [r0, #0x124]
	ldr r2, _02004218 ; =0x00000400
	ldr r1, _0200421C ; =0x03807758
	str r3, [r0, #0x130]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _02004220 ; =0x037F8000
	ldrgt r1, _02004224 ; =0x00000400
	ldrgt r0, _02004228 ; =0x0380FF80
	subgt r0, r0, r1
	sub ip, r0, r2
	ldr r2, _02004224 ; =0x00000400
	ldr r0, _02004228 ; =0x0380FF80
	ldr r1, _02004210 ; =0x03807680
	sub r3, r0, r2
	str r3, [r1, #0x150]
	str ip, [r1, #0x14c]
	mov r0, #0
	ldr r2, _0200422C ; =0xD73BFDF7
	str r0, [r1, #0x154]
	str r2, [r3, #-4]
	ldr r2, [r1, #0x14c]
	ldr ip, _02004230 ; =0xFBDD37BB
	ldr r3, _02004234 ; =0x038076A4
	str ip, [r2]
	str r0, [r1, #0x15c]
	str r0, [r1, #0x158]
	strh r0, [r1, #0x24]
	ldr r2, _02004238 ; =0x027FFFA4
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl sub_02004714
_02004208:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02004210: .word 0x03807680
_02004214: .word 0x038076A8
_02004218: .word 0x00000400
_0200421C: .word 0x03807758
_02004220: .word 0x037F8000
_02004224: .word 0x00000400
_02004228: .word 0x0380FF80
_0200422C: .word 0xD73BFDF7
_02004230: .word 0xFBDD37BB
_02004234: .word 0x038076A4
_02004238: .word 0x027FFFA4
	arm_func_end sub_0200414C

	arm_func_start sub_0200423C
sub_0200423C: ; 0x0200423C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl sub_02005EE8
	ldr r1, _02004334 ; =0x03807680
	ldr r2, [sp, #0x1c]
	ldr r3, [r1, #0x20]
	mov r4, r0
	add r0, r3, #1
	str r0, [r1, #0x20]
	str r2, [r8, #0x54]
	str r0, [r8, #0x50]
	mov r1, #0
	str r1, [r8, #0x48]
	mov r0, r8
	str r1, [r8, #0x58]
	bl sub_02003FD4
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x78]
	sub r5, r6, r0
	sub r2, r6, #4
	str r5, [r8, #0x74]
	mov ip, #0
	str ip, [r8, #0x7c]
	ldr r6, _02004338 ; =0xD73BFDF7
	ldr r0, [r8, #0x78]
	ldr r3, _0200433C ; =0xFBDD37BB
	str r6, [r0, #-4]
	ldr r0, [r8, #0x74]
	str r3, [r0]
	str ip, [r8, #0x84]
	mov r0, r8
	str ip, [r8, #0x80]
	bl sub_020047B0
	ldr r2, _02004340 ; =0x037FC15C
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl sub_020061B8
	mov r0, #0
	str r0, [r8, #0x68]
	str r0, [r8, #0x6c]
	str r0, [r8, #0x70]
	str r0, [r8, #0x98]
	str r0, [r8, #0x5c]
	str r0, [r8, #0x64]
	str r0, [r8, #0x60]
	add r1, r8, #0x88
	mov r2, #0xc
	bl sub_020061B8
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0x94]
	bl sub_02005EFC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02004334: .word 0x03807680
_02004338: .word 0xD73BFDF7
_0200433C: .word 0xFBDD37BB
_02004340: .word 0x037FC15C
	arm_func_end sub_0200423C
_02004344:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xE6, 0x06, 0x00, 0xEB, 0x10, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x28, 0x00, 0x90, 0xE5, 0x02, 0x00, 0x00, 0xEB, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x80, 0x76, 0x80, 0x03, 0x38, 0x40, 0x2D, 0xE9, 0x4C, 0x20, 0x9F, 0xE5
	.byte 0x00, 0x50, 0xA0, 0xE1, 0x1C, 0x20, 0x92, 0xE5, 0x01, 0x40, 0xA0, 0xE1, 0x00, 0x00, 0x52, 0xE3
	.byte 0x0A, 0x00, 0x00, 0x0A, 0x38, 0x10, 0x9F, 0xE5, 0x08, 0x01, 0x00, 0xEB, 0x04, 0x40, 0x85, 0xE5
	.byte 0x00, 0x10, 0x95, 0xE5, 0x05, 0x00, 0xA0, 0xE1, 0x80, 0x10, 0x81, 0xE3, 0x00, 0x10, 0x85, 0xE5
	.byte 0x01, 0x10, 0xA0, 0xE3, 0x48, 0x10, 0x85, 0xE5, 0x2E, 0x01, 0x00, 0xEB, 0x01, 0x00, 0x00, 0xEA
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x03, 0x00, 0x00, 0xEB, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x80, 0x76, 0x80, 0x03, 0xE0, 0xC1, 0x7F, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x30, 0x10, 0x9F, 0xE5
	.byte 0x08, 0x10, 0x91, 0xE5, 0x00, 0x30, 0x91, 0xE5, 0x98, 0x20, 0x93, 0xE5, 0x00, 0x00, 0x52, 0xE3
	.byte 0x04, 0x00, 0x00, 0x0A, 0x00, 0x10, 0xA0, 0xE3, 0x98, 0x10, 0x83, 0xE5, 0x0F, 0xE0, 0xA0, 0xE1
	.byte 0x12, 0xFF, 0x2F, 0xE1, 0xBB, 0x06, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEB, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x80, 0x76, 0x80, 0x03, 0x10, 0x40, 0x2D, 0xE9, 0x60, 0x00, 0x9F, 0xE5
	.byte 0x08, 0x00, 0x90, 0xE5, 0x00, 0x40, 0x90, 0xE5, 0xC8, 0x00, 0x00, 0xEB, 0x04, 0x00, 0xA0, 0xE1
	.byte 0xCB, 0x01, 0x00, 0xEB, 0x5C, 0x00, 0x94, 0xE5, 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A
	.byte 0x04, 0x10, 0xA0, 0xE1, 0xC4, 0xFE, 0xFF, 0xEB, 0x04, 0x00, 0xA0, 0xE1, 0xFC, 0xFE, 0xFF, 0xEB
	.byte 0x02, 0x10, 0xA0, 0xE3, 0x80, 0x00, 0x84, 0xE2, 0x48, 0x10, 0x84, 0xE5, 0x1E, 0x00, 0x00, 0xEB
	.byte 0xC8, 0x00, 0x00, 0xEB, 0xA3, 0x06, 0x00, 0xEB, 0x00, 0x40, 0xA0, 0xE1, 0x05, 0xFF, 0xFF, 0xEB
	.byte 0x04, 0x00, 0xA0, 0xE1, 0xA4, 0x06, 0x00, 0xEB, 0xFA, 0x06, 0x00, 0xEB, 0x10, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x80, 0x76, 0x80, 0x03

	arm_func_start sub_02004478
sub_02004478: ; 0x02004478
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl sub_02005EE8
	ldr r1, _020044C8 ; =0x03807680
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _020044AC
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x5c]
	bl sub_02003ED4
_020044AC:
	mov r0, #0
	str r0, [r5, #0x48]
	bl sub_02004078
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020044C8: .word 0x03807680
	arm_func_end sub_02004478

	arm_func_start sub_020044CC
sub_020044CC: ; 0x020044CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02005EE8
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	beq _02004544
	mov r2, #0
	mov r3, r2
	mov r1, #1
	mov r0, r2
	b _02004528
_020044FC:
	beq _02004518
	ldr ip, [lr, #0x64]
	str ip, [r5]
	cmp ip, #0
	strne r3, [ip, #0x60]
	streq r2, [r5, #4]
	streq r2, [lr, #0x5c]
_02004518:
	str r1, [lr, #0x48]
	str r0, [lr, #0x5c]
	str r0, [lr, #0x64]
	str r0, [lr, #0x60]
_02004528:
	ldr lr, [r5]
	cmp lr, #0
	bne _020044FC
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	bl sub_02004078
_02004544:
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020044CC

	arm_func_start sub_02004554
sub_02004554: ; 0x02004554
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02005EE8
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x48]
	bl sub_02004078
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02004554

	arm_func_start sub_02004580
sub_02004580: ; 0x02004580
	ldr r0, _020045A4 ; =0x03807680
	ldr r0, [r0, #0x2c]
	b _02004590
_0200458C:
	ldr r0, [r0, #0x4c]
_02004590:
	cmp r0, #0
	ldrne r1, [r0, #0x48]
	cmpne r1, #1
	bne _0200458C
	bx lr
	.align 2, 0
_020045A4: .word 0x03807680
	arm_func_end sub_02004580

	arm_func_start sub_020045A8
sub_020045A8: ; 0x020045A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02004648 ; =0x03807680
	mov r7, r0
	ldr r8, [r2, #0x2c]
	mov r6, r1
	mov r4, #0
	bl sub_02005EE8
	mov r5, r0
	b _020045D4
_020045CC:
	mov r4, r8
	ldr r8, [r8, #0x4c]
_020045D4:
	cmp r8, #0
	cmpne r8, r7
	bne _020045CC
	cmp r8, #0
	ldrne r0, _0200464C ; =0x038076B4
	cmpne r8, r0
	bne _02004600
	mov r0, r5
	bl sub_02005EFC
	mov r0, #0
	b _02004640
_02004600:
	ldr r0, [r8, #0x54]
	cmp r0, r6
	beq _02004634
	cmp r4, #0
	ldreq r1, [r7, #0x4c]
	ldreq r0, _02004648 ; =0x03807680
	streq r1, [r0, #0x2c]
	ldrne r0, [r7, #0x4c]
	strne r0, [r4, #0x4c]
	mov r0, r7
	str r6, [r7, #0x54]
	bl sub_02003FD4
	bl sub_02004078
_02004634:
	mov r0, r5
	bl sub_02005EFC
	mov r0, #1
_02004640:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02004648: .word 0x03807680
_0200464C: .word 0x038076B4
	arm_func_end sub_020045A8

	arm_func_start sub_02004650
sub_02004650: ; 0x02004650
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r4, r0
	add r0, sp, #8
	bl sub_02005588
	ldr r0, _020046E8 ; =0x03807680
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl sub_02005EE8
	ldr r1, _020046EC ; =0x000082EA
	mov r2, #0
	umull ip, r3, r4, r1
	mla r3, r4, r2, r3
	mla r3, r2, r1, r3
	mov r5, r0
	mov r1, ip, lsr #6
	ldr r4, [sp, #4]
	add r0, sp, #8
	str r0, [r4, #0x94]
	add r2, sp, #4
	str r2, [sp]
	mov r2, r3, lsr #6
	orr r1, r1, r3, lsl #26
	ldr r3, _020046F0 ; =0x037FC50C
	bl sub_020056C4
	mov r4, #0
	b _020046C8
_020046C0:
	mov r0, r4
	bl sub_02004478
_020046C8:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _020046C0
	mov r0, r5
	bl sub_02005EFC
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_020046E8: .word 0x03807680
_020046EC: .word 0x000082EA
_020046F0: .word 0x037FC50C
	arm_func_end sub_02004650
_020046F4:
	.byte 0x00, 0x20, 0x90, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x10, 0x80, 0xE5
	.byte 0x08, 0xC0, 0x9F, 0xE5, 0x02, 0x00, 0xA0, 0xE1, 0x94, 0x10, 0x82, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x6C, 0xC3, 0x7F, 0x03

	arm_func_start sub_02004714
sub_02004714: ; 0x02004714
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02005EE8
	ldr r1, _0200473C ; =0x03807680
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl sub_02005EFC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200473C: .word 0x03807680
	arm_func_end sub_02004714

	arm_func_start sub_02004740
sub_02004740: ; 0x02004740
	stmdb sp!, {r4, lr}
	bl sub_02005EE8
	ldr r2, _02004774 ; =0x03807680
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	strlo r1, [r2, #4]
	movlo r4, r3
	bl sub_02005EFC
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02004774: .word 0x03807680
	arm_func_end sub_02004740

	arm_func_start sub_02004778
sub_02004778: ; 0x02004778
	stmdb sp!, {r4, lr}
	bl sub_02005EE8
	ldr r1, _020047AC ; =0x03807680
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	strne r2, [r1, #4]
	movne r4, r3
	bl sub_02005EFC
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020047AC: .word 0x03807680
	arm_func_end sub_02004778

	arm_func_start sub_020047B0
sub_020047B0: ; 0x020047B0
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	bne _020047CC
	b _020047D0
_020047CC:
	sub r2, r2, #4
_020047D0:
	str r2, [r0, #0x38]
	ands r1, r1, #1
	bne _020047E0
	b _020047E4
_020047E0:
	mov r1, #0x3f
_020047E4:
	beq _020047EC
	b _020047F0
_020047EC:
	mov r1, #0x1f
_020047F0:
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end sub_020047B0

	arm_func_start sub_02004834
sub_02004834: ; 0x02004834
	add r1, r0, #0
	mrs r2, cpsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 ; =sub_02004868
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	arm_func_end sub_02004834

	arm_func_start sub_02004868
sub_02004868: ; 0x02004868
	mrs r1, cpsr
	bic r1, r1, #0x1f
	orr r1, r1, #0xd3
	msr cpsr_c, r1
	ldr r1, [r0], #4
	msr spsr_fsxc, r1
	ldr sp, [r0, #0x40]
	ldr lr, [r0, #0x3c]
	ldmia r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	subs pc, lr, #4
	arm_func_end sub_02004868

	arm_func_start sub_02004894
sub_02004894: ; 0x02004894
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0]
	str r3, [r0, #0xc]
	str r3, [r0, #8]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	bx lr
	arm_func_end sub_02004894

	arm_func_start sub_020048BC
sub_020048BC: ; 0x020048BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl sub_02005EE8
	mov r4, r0
	and r7, r7, #1
	b _020048FC
_020048DC:
	cmp r7, #0
	bne _020048F4
	mov r0, r4
	bl sub_02005EFC
	mov r0, #0
	b _02004940
_020048F4:
	mov r0, r6
	bl sub_02004478
_020048FC:
	ldr r2, [r6, #0x1c]
	ldr r1, [r6, #0x14]
	cmp r1, r2
	ble _020048DC
	ldr r0, [r6, #0x18]
	add r0, r0, r2
	bl sub_0200EDB0
	ldr r2, [r6, #0x10]
	add r0, r6, #8
	str r5, [r2, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_020044CC
	mov r0, r4
	bl sub_02005EFC
	mov r0, #1
_02004940:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020048BC

	arm_func_start sub_02004948
sub_02004948: ; 0x02004948
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl sub_02005EE8
	mov r4, r0
	and r7, r7, #1
	b _02004988
_02004968:
	cmp r7, #0
	bne _02004980
	mov r0, r4
	bl sub_02005EFC
	mov r0, #0
	b _020049DC
_02004980:
	add r0, r6, #8
	bl sub_02004478
_02004988:
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02004968
	cmp r5, #0
	ldrne r1, [r6, #0x10]
	ldrne r0, [r6, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r5]
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl sub_0200EDB0
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_020044CC
	mov r0, r4
	bl sub_02005EFC
	mov r0, #1
_020049DC:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02004948

	arm_func_start sub_020049E4
sub_020049E4: ; 0x020049E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	mov r7, r0
	mov r4, r1
	bl sub_02005EE8
	mov r5, r0
	and r6, r6, #1
	b _02004A24
_02004A04:
	cmp r6, #0
	bne _02004A1C
	mov r0, r5
	bl sub_02005EFC
	mov r0, #0
	b _02004A50
_02004A1C:
	add r0, r7, #8
	bl sub_02004478
_02004A24:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _02004A04
	cmp r4, #0
	ldrne r1, [r7, #0x10]
	ldrne r0, [r7, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r4]
	mov r0, r5
	bl sub_02005EFC
	mov r0, #1
_02004A50:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020049E4
_02004A58:
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x04, 0x10, 0x80, 0xE5
	.byte 0x00, 0x10, 0x80, 0xE5, 0x08, 0x10, 0x80, 0xE5, 0x0C, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02004A70
sub_02004A70: ; 0x02004A70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl sub_02005EE8
	ldr r1, _02004AF0 ; =0x038076A4
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_02004A8C:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02004AB8
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl sub_02004B8C
	b _02004AE0
_02004AB8:
	cmp r0, r7
	ldreq r0, [r5, #0xc]
	addeq r0, r0, #1
	streq r0, [r5, #0xc]
	beq _02004AE0
	str r5, [r7, #0x68]
	mov r0, r5
	bl sub_02004478
	str r6, [r7, #0x68]
	b _02004A8C
_02004AE0:
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02004AF0: .word 0x038076A4
	arm_func_end sub_02004A70

	arm_func_start sub_02004AF4
sub_02004AF4: ; 0x02004AF4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02005EE8
	ldr r1, _02004B50 ; =0x038076A4
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _02004B40
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _02004B40
	mov r1, r5
	bl sub_02004BB0
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl sub_020044CC
_02004B40:
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02004B50: .word 0x038076A4
	arm_func_end sub_02004AF4
_02004B54:
	.byte 0x38, 0x40, 0x2D, 0xE9, 0x00, 0x50, 0xA0, 0xE1, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x04, 0x00, 0x00, 0xEA, 0x6C, 0x00, 0x85, 0xE2, 0x0D, 0xFD, 0xFF, 0xEB, 0x0C, 0x40, 0x80, 0xE5
	.byte 0x08, 0x40, 0x80, 0xE5, 0x54, 0xFE, 0xFF, 0xEB, 0x6C, 0x00, 0x95, 0xE5, 0x00, 0x00, 0x50, 0xE3
	.byte 0xF7, 0xFF, 0xFF, 0x1A, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02004B8C
sub_02004B8C: ; 0x02004B8C
	ldr r2, [r0, #0x70]
	cmp r2, #0
	streq r1, [r0, #0x6c]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x70]
	bx lr
	arm_func_end sub_02004B8C

	arm_func_start sub_02004BB0
sub_02004BB0: ; 0x02004BB0
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x70]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x6c]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end sub_02004BB0

	arm_func_start sub_02004BD4
sub_02004BD4: ; 0x02004BD4
	stmdb sp!, {r3, lr}
	bl sub_02004C04
	bl sub_0200649C
	bl sub_02003B80
	bl sub_02003980
	bl sub_02005310
	bl sub_02005534
	bl sub_0200414C
	bl sub_02005F64
	bl sub_0200E570
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02004BD4

	arm_func_start sub_02004C04
sub_02004C04: ; 0x02004C04
	stmdb sp!, {r3, lr}
	ldr r1, _02004C3C ; =0x038077FC
	ldr r0, [r1]
	cmp r0, #0
	bne _02004C34
	mov r0, #1
	str r0, [r1]
	bl sub_02004C40
	mov r0, #7
	bl sub_02004C40
	mov r0, #8
	bl sub_02004C40
_02004C34:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02004C3C: .word 0x038077FC
	arm_func_end sub_02004C04

	arm_func_start sub_02004C40
sub_02004C40: ; 0x02004C40
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02004CA4
	mov r1, r4, lsl #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xdc4]
	mov r0, r4
	bl sub_02004D20
	mov r1, r4, lsl #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xda0]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02004C40
_02004C7C:
	.byte 0x00, 0x01, 0xA0, 0xE1
	.byte 0x27, 0x06, 0x80, 0xE2, 0xFF, 0x0A, 0x80, 0xE2, 0xC4, 0x0D, 0x90, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x00, 0x01, 0xA0, 0xE1, 0x27, 0x06, 0x80, 0xE2, 0xFF, 0x0A, 0x80, 0xE2, 0xA0, 0x0D, 0x90, 0xE5
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02004CA4
sub_02004CA4: ; 0x02004CA4
	cmp r0, #1
	beq _02004CC0
	cmp r0, #7
	beq _02004CC8
	cmp r0, #8
	beq _02004CD0
	b _02004D04
_02004CC0:
	ldr r0, _02004D0C ; =0x027FF000
	bx lr
_02004CC8:
	mov r0, #0x3800000
	bx lr
_02004CD0:
	ldr r2, _02004D10 ; =0x00000400
	ldr r0, _02004D14 ; =0x0380FF80
	ldr r1, _02004D18 ; =0x0380B488
	sub r2, r0, r2
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	ldr r1, _02004D1C ; =0x00000400
	cmp r1, #0
	bxeq lr
	sublt r0, r0, r1
	subge r0, r2, r1
	bx lr
_02004D04:
	mov r0, #0
	bx lr
	.align 2, 0
_02004D0C: .word 0x027FF000
_02004D10: .word 0x00000400
_02004D14: .word 0x0380FF80
_02004D18: .word 0x0380B488
_02004D1C: .word 0x00000400
	arm_func_end sub_02004CA4

	arm_func_start sub_02004D20
sub_02004D20: ; 0x02004D20
	cmp r0, #1
	beq _02004D3C
	cmp r0, #7
	beq _02004D44
	cmp r0, #8
	beq _02004D54
	b _02004D68
_02004D3C:
	ldr r0, _02004D70 ; =0x027F91E0
	bx lr
_02004D44:
	ldr r0, _02004D74 ; =0x0380B488
	cmp r0, #0x3800000
	movhi r0, #0x3800000
	bx lr
_02004D54:
	ldr r1, _02004D74 ; =0x0380B488
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	bx lr
_02004D68:
	mov r0, #0
	bx lr
	.align 2, 0
_02004D70: .word 0x027F91E0
_02004D74: .word 0x0380B488
	arm_func_end sub_02004D20
_02004D78:
	.byte 0x00, 0x01, 0xA0, 0xE1, 0x27, 0x06, 0x80, 0xE2
	.byte 0xFF, 0x0A, 0x80, 0xE2, 0xA0, 0x1D, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02004D8C
sub_02004D8C: ; 0x02004D8C
	ldr r3, [r1, #4]
	cmp r3, #0
	ldrne r2, [r1]
	strne r2, [r3]
	ldr r2, [r1]
	cmp r2, #0
	ldreq r0, [r1, #4]
	ldrne r1, [r1, #4]
	strne r1, [r2, #4]
	bx lr
	arm_func_end sub_02004D8C

	arm_func_start sub_02004DB4
sub_02004DB4: ; 0x02004DB4
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, #0
	b _02004DD4
_02004DC4:
	cmp r1, lr
	bls _02004DDC
	mov ip, lr
	ldr lr, [lr, #4]
_02004DD4:
	cmp lr, #0
	bne _02004DC4
_02004DDC:
	stmia r1, {ip, lr}
	cmp lr, #0
	beq _02004E18
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _02004E18
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_02004E18:
	cmp ip, #0
	beq _02004E50
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	bne _02004E54
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	b _02004E54
_02004E50:
	mov r0, r1
_02004E54:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02004DB4

	arm_func_start sub_02004E5C
sub_02004E5C: ; 0x02004E5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl sub_02005EE8
	ldr r1, _02004F68 ; =0x03807800
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _02004E90
	bl sub_02005EFC
	mov r0, #0
	b _02004F60
_02004E90:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	bic r7, r1, #0x1f
	b _02004EC8
_02004EB8:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _02004ED0
	ldr r5, [r5, #4]
_02004EC8:
	cmp r5, #0
	bne _02004EB8
_02004ED0:
	cmp r5, #0
	bne _02004EE8
	mov r0, r6
	bl sub_02005EFC
	mov r0, #0
	b _02004F60
_02004EE8:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _02004F08
	mov r1, r5
	bl sub_02004D8C
	str r0, [r4, #4]
	b _02004F3C
_02004F08:
	str r7, [r5, #8]
	add r2, r5, r7
	str r1, [r2, #8]
	ldr r0, [r5]
	str r0, [r5, r7]
	ldr r0, [r5, #4]
	str r0, [r2, #4]
	cmp r0, #0
	strne r2, [r0]
	ldr r0, [r2]
	cmp r0, #0
	strne r2, [r0, #4]
	streq r2, [r4, #4]
_02004F3C:
	ldr r1, [r4, #8]
	mov r0, #0
	stmia r5, {r0, r1}
	cmp r1, #0
	strne r5, [r1]
	mov r0, r6
	str r5, [r4, #8]
	bl sub_02005EFC
	add r0, r5, #0x20
_02004F60:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02004F68: .word 0x03807800
	arm_func_end sub_02004E5C

	arm_func_start sub_02004F6C
sub_02004F6C: ; 0x02004F6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02005EE8
	ldr r1, _02004FD4 ; =0x03807800
	mov r4, r0
	ldr r0, [r1, r7, lsl #2]
	cmp r6, #0
	ldrlt r6, [r0]
	ldr r1, [r0, #0x10]
	mov r0, #0xc
	mla r7, r6, r0, r1
	sub r5, r5, #0x20
	ldr r0, [r7, #8]
	mov r1, r5
	bl sub_02004D8C
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl sub_02004DB4
	str r0, [r7, #4]
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02004FD4: .word 0x03807800
	arm_func_end sub_02004F6C

	arm_func_start sub_02004FD8
sub_02004FD8: ; 0x02004FD8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl sub_02005EE8
	ldr r1, _02005008 ; =0x03807800
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl sub_02005EFC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02005008: .word 0x03807800
	arm_func_end sub_02004FD8

	arm_func_start sub_0200500C
sub_0200500C: ; 0x0200500C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl sub_02005EE8
	ldr r2, _020050B0 ; =0x03807800
	mov r1, #0xc
	str r5, [r2, r7, lsl #2]
	add r2, r5, #0x14
	str r2, [r5, #0x10]
	mov r7, #0
	mul r1, r6, r1
	str r6, [r5, #4]
	mvn lr, #0
	mov ip, r7
	mov r2, #0xc
	b _02005070
_02005054:
	mul r3, r7, r2
	ldr r6, [r5, #0x10]
	add r7, r7, #1
	str lr, [r6, r3]
	add r3, r6, r3
	str ip, [r3, #8]
	str ip, [r3, #4]
_02005070:
	ldr r3, [r5, #4]
	cmp r7, r3
	blt _02005054
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl sub_02005EFC
	ldr r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_020050B0: .word 0x03807800
	arm_func_end sub_0200500C

	arm_func_start sub_020050B4
sub_020050B4: ; 0x020050B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl sub_02005EE8
	ldr r2, _02005150 ; =0x03807800
	add r1, r6, #0x1f
	ldr lr, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr r7, [lr, #4]
	bic r5, r5, #0x1f
	mov r4, #0
	mov r1, #0xc
	b _02005138
_020050EC:
	mul r3, r4, r1
	ldr ip, [lr, #0x10]
	ldr r2, [ip, r3]
	add r3, ip, r3
	cmp r2, #0
	bge _02005134
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl sub_02005EFC
	mov r0, r4
	b _02005148
_02005134:
	add r4, r4, #1
_02005138:
	cmp r4, r7
	blt _020050EC
	bl sub_02005EFC
	mvn r0, #0
_02005148:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02005150: .word 0x03807800
	arm_func_end sub_020050B4

	arm_func_start sub_02005154
sub_02005154: ; 0x02005154
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r4
	sub r6, r4, #1
	bl sub_02005EE8
	ldr r1, _020052F0 ; =0x03807800
	mvn r2, #0
	ldr r1, [r1, r8, lsl #2]
	cmp r7, r2
	ldr ip, [r1, #0x10]
	ldreq r7, [r1]
	cmp ip, #0
	beq _020052E0
	cmp r7, #0
	blt _020052E0
	ldr r2, [r1, #4]
	cmp r7, r2
	bge _020052E0
	mov r2, #0xc
	mul r3, r7, r2
	ldr r2, [ip, r3]
	add r7, ip, r3
	cmp r2, #0
	blt _020052E0
	ldr ip, [r7, #8]
	cmp ip, #0
	ldrne r3, [ip]
	cmpne r3, #0
	bne _020052E0
	b _02005234
_020051D4:
	ldr r3, [r1, #8]
	cmp r3, ip
	bhi _020052E0
	ldr r3, [r1, #0xc]
	cmp ip, r3
	bhs _020052E0
	tst ip, #0x1f
	bne _020052E0
	ldr lr, [ip, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, ip
	bne _020052E0
	ldr r3, [ip, #8]
	cmp r3, #0x40
	blo _020052E0
	tst r3, #0x1f
	bne _020052E0
	add r4, r4, r3
	cmp r4, #0
	ble _020052E0
	cmp r4, r2
	bgt _020052E0
	mov ip, lr
_02005234:
	cmp ip, #0
	bne _020051D4
	ldr lr, [r7, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, #0
	bne _020052E0
	b _020052D0
_02005254:
	ldr r3, [r1, #8]
	cmp r3, lr
	bhi _020052E0
	ldr r3, [r1, #0xc]
	cmp lr, r3
	bhs _020052E0
	tst lr, #0x1f
	bne _020052E0
	ldr r7, [lr, #4]
	cmp r7, #0
	ldrne r3, [r7]
	cmpne r3, lr
	bne _020052E0
	ldr ip, [lr, #8]
	cmp ip, #0x40
	blo _020052E0
	tst ip, #0x1f
	bne _020052E0
	cmp r7, #0
	beq _020052B0
	add r3, lr, ip
	cmp r3, r7
	bhs _020052E0
_020052B0:
	add r4, r4, ip
	sub r3, ip, #0x20
	cmp r4, #0
	add r5, r5, r3
	ble _020052E0
	cmp r4, r2
	bgt _020052E0
	mov lr, r7
_020052D0:
	cmp lr, #0
	bne _02005254
	cmp r4, r2
	moveq r6, r5
_020052E0:
	bl sub_02005EFC
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020052F0: .word 0x03807800
	arm_func_end sub_02005154

	arm_func_start sub_020052F4
sub_020052F4: ; 0x020052F4
	ldr r1, _0200530C ; =0x03807824
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200530C: .word 0x03807824
	arm_func_end sub_020052F4

	arm_func_start sub_02005310
sub_02005310: ; 0x02005310
	stmdb sp!, {r3, lr}
	ldr r1, _02005380 ; =0x03807828
	ldrh r0, [r1]
	cmp r0, #0
	bne _02005378
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl sub_020052F4
	ldr r0, _02005380 ; =0x03807828
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _02005384 ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _02005388 ; =0x037FD1B4
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl sub_020039A4
	mov r0, #8
	bl sub_02003AD8
	ldr r0, _02005380 ; =0x03807828
	mov r1, #0
	str r1, [r0, #4]
_02005378:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02005380: .word 0x03807828
_02005384: .word 0x04000102
_02005388: .word 0x037FD1B4
	arm_func_end sub_02005310

	arm_func_start sub_0200538C
sub_0200538C: ; 0x0200538C
	ldr r0, _02005398 ; =0x03807828
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02005398: .word 0x03807828
	arm_func_end sub_0200538C
_0200539C:
	.byte 0x50, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x30, 0xA0, 0xE3, 0x08, 0x20, 0x90, 0xE5, 0x0C, 0x10, 0x90, 0xE5, 0x01, 0x20, 0x92, 0xE2
	.byte 0x08, 0x20, 0x80, 0xE5, 0x00, 0x10, 0xA1, 0xE2, 0x0C, 0x10, 0x80, 0xE5, 0x04, 0x10, 0x90, 0xE5
	.byte 0x00, 0x00, 0x51, 0xE3, 0x05, 0x00, 0x00, 0x0A, 0x28, 0x20, 0x9F, 0xE5, 0xC1, 0x10, 0xA0, 0xE3
	.byte 0xB0, 0x30, 0xC2, 0xE1, 0xB2, 0x30, 0x42, 0xE1, 0xB0, 0x10, 0xC2, 0xE1, 0x04, 0x30, 0x80, 0xE5
	.byte 0x14, 0xC0, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x10, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE1
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0x28, 0x78, 0x80, 0x03, 0x02, 0x01, 0x00, 0x04, 0x58, 0xB8, 0x7F, 0x03
	.byte 0xB4, 0xD1, 0x7F, 0x03

	arm_func_start sub_02005404
sub_02005404: ; 0x02005404
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_02005EE8
	ldr lr, _0200549C ; =sub_04000100
	ldr r1, _020054A0 ; =0x03807828
	ldrh r3, [lr]
	ldr r2, _020054A4 ; =0x0000FFFF
	strh r3, [sp]
	ldr ip, [r1, #8]
	ldr r3, [r1, #0xc]
	sub r1, r2, #0x10000
	and ip, ip, r1
	and r1, r3, r2
	str ip, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [lr, #0x114]
	tst r1, #8
	beq _02005470
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _02005470
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_02005470:
	bl sub_02005EFC
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	mov r1, r1, lsl #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_0200549C: .word sub_04000100
_020054A0: .word 0x03807828
_020054A4: .word 0x0000FFFF
	arm_func_end sub_02005404

	arm_func_start sub_020054A8
sub_020054A8: ; 0x020054A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_02005404
	ldr r3, _02005524 ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _02005528 ; =0x037FD648
	mov r0, #1
	bl sub_02003A40
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _0200552C ; =0x0000FFFE
	blt _02005504
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	mvnlt r0, r5
	movlt r0, r0, lsl #0x10
	movlt r3, r0, lsr #0x10
_02005504:
	ldr r2, _02005530 ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl sub_02003AD8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02005524: .word 0x04000106
_02005528: .word 0x037FD648
_0200552C: .word 0x0000FFFE
_02005530: .word 0x04000104
	arm_func_end sub_020054A8

	arm_func_start sub_02005534
sub_02005534: ; 0x02005534
	stmdb sp!, {r3, lr}
	ldr r1, _02005574 ; =0x03807838
	ldrh r0, [r1]
	cmp r0, #0
	bne _0200556C
	mov r0, #1
	strh r0, [r1]
	bl sub_020052F4
	ldr r1, _02005574 ; =0x03807838
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl sub_02003B10
_0200556C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02005574: .word 0x03807838
	arm_func_end sub_02005534

	arm_func_start sub_02005578
sub_02005578: ; 0x02005578
	ldr r0, _02005584 ; =0x03807838
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02005584: .word 0x03807838
	arm_func_end sub_02005578

	arm_func_start sub_02005588
sub_02005588: ; 0x02005588
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_02005588

	arm_func_start sub_02005598
sub_02005598: ; 0x02005598
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _0200560C
	bl sub_02005404
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _0200560C
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl sub_0200ED68
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_0200560C:
	str r7, [r8, #0xc]
	ldr r0, _020056C0 ; =0x03807838
	str r6, [r8, #0x10]
	mov r2, #0
	ldr r5, [r0, #4]
	mov r1, r2
	b _0200567C
_02005628:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _02005678
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _020056B8
	ldr r1, _020056C0 ; =0x03807838
	mov r0, r8
	str r8, [r1, #4]
	bl sub_020054A8
	b _020056B8
_02005678:
	ldr r5, [r5, #0x18]
_0200567C:
	cmp r5, #0
	bne _02005628
	ldr r1, _020056C0 ; =0x03807838
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _020056B8
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl sub_020054A8
_020056B8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020056C0: .word 0x03807838
	arm_func_end sub_02005598

	arm_func_start sub_020056C4
sub_020056C4: ; 0x020056C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _020056E8
	ldr r0, [r6]
	cmp r0, #0
	beq _020056EC
_020056E8:
	bl sub_02006058
_020056EC:
	bl sub_02005EE8
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl sub_02005404
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl sub_02005598
	mov r0, r7
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020056C4

	arm_func_start sub_02005734
sub_02005734: ; 0x02005734
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, [sp, #0x18]
	movs r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	beq _0200575C
	ldr r0, [r4]
	cmp r0, #0
	beq _02005760
_0200575C:
	bl sub_02006058
_02005760:
	bl sub_02005EE8
	str r6, [r4, #0x1c]
	str r5, [r4, #0x20]
	str r8, [r4, #0x24]
	mov r1, #0
	mov r5, r0
	ldr r0, [sp, #0x1c]
	str r7, [r4, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [r4]
	mov r0, r4
	mov r2, r1
	str r3, [r4, #4]
	bl sub_02005598
	mov r0, r5
	bl sub_02005EFC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_02005734

	arm_func_start sub_020057A8
sub_020057A8: ; 0x020057A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02005EE8
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _020057CC
	bl sub_02005EFC
	b _02005824
_020057CC:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldreq r2, [r5, #0x14]
	ldreq r1, _0200582C ; =0x03807838
	streq r2, [r1, #8]
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _0200580C
	ldr r1, _0200582C ; =0x03807838
	cmp r0, #0
	str r0, [r1, #4]
	beq _0200580C
	bl sub_020054A8
_0200580C:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl sub_02005EFC
_02005824:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200582C: .word 0x03807838
	arm_func_end sub_020057A8
_02005830:
	.byte 0x01, 0x40, 0x2D, 0xE9, 0x01, 0x00, 0x00, 0xEB, 0x01, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02005840
sub_02005840: ; 0x02005840
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02005928 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl sub_02003B10
	ldr r1, _0200592C ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x10
	str r0, [r1]
	bl sub_02005404
	ldr r2, _02005930 ; =0x03807838
	ldr r4, [r2, #4]
	cmp r4, #0
	beq _02005920
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _0200589C
	mov r0, r4
	bl sub_020054A8
	b _02005920
_0200589C:
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r1, [r2, #4]
	cmp r1, #0
	streq r0, [r2, #8]
	strne r0, [r1, #0x14]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	ldr r5, [r4]
	mov r0, #0
	cmpeq r1, #0
	streq r0, [r4]
	cmp r5, #0
	beq _020058E4
	ldr r0, [r4, #4]
	mov lr, pc
	bx r5
_020058E4:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _0200590C
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl sub_02005598
_0200590C:
	ldr r0, _02005930 ; =0x03807838
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02005920
	bl sub_020054A8
_02005920:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02005928: .word 0x04000106
_0200592C: .word 0x0380FFF8
_02005930: .word 0x03807838
	arm_func_end sub_02005840

	arm_func_start sub_02005934
sub_02005934: ; 0x02005934
	stmdb sp!, {r3, lr}
	ldr r1, _0200597C ; =0x03807844
	ldrh r0, [r1]
	cmp r0, #0
	bne _02005974
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl sub_02003B10
	ldr r0, _0200597C ; =0x03807844
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_02005974:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200597C: .word 0x03807844
	arm_func_end sub_02005934

	arm_func_start sub_02005980
sub_02005980: ; 0x02005980
	ldr r0, _0200598C ; =0x03807844
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0200598C: .word 0x03807844
	arm_func_end sub_02005980

	arm_func_start sub_02005990
sub_02005990: ; 0x02005990
	stmdb sp!, {r3, lr}
	ldr r1, _02005A30 ; =0x03807844
	ldr r3, [r1, #0xc]
	b _020059F4
_020059A0:
	ldr r2, [r0, #0xc]
	ldr r1, [r3, #0xc]
	cmp r1, r2
	blo _020059F0
	bne _020059C4
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _020059F0
_020059C4:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _02005A28
	ldr r1, _02005A30 ; =0x03807844
	str r0, [r1, #0xc]
	bl sub_02005BA0
	b _02005A28
_020059F0:
	ldr r3, [r3, #0x18]
_020059F4:
	cmp r3, #0
	bne _020059A0
	ldr r1, _02005A30 ; =0x03807844
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	bne _02005A28
	str r0, [r1, #0xc]
	bl sub_02005BA0
_02005A28:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02005A30: .word 0x03807844
	arm_func_end sub_02005990

	arm_func_start sub_02005A34
sub_02005A34: ; 0x02005A34
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _02005A68 ; =0x03807844
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _02005A68 ; =0x03807844
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_02005A68: .word 0x03807844
	arm_func_end sub_02005A34

	arm_func_start sub_02005A6C
sub_02005A6C: ; 0x02005A6C
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02005A6C

	arm_func_start sub_02005A80
sub_02005A80: ; 0x02005A80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_02005EE8
	mov r4, r0
	cmp r8, #0
	beq _02005AB0
	ldr r0, [r8]
	cmp r0, #0
	beq _02005AB4
_02005AB0:
	bl sub_02006058
_02005AB4:
	ldr r0, _02005B0C ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_02005E90
	mov r1, #0
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r0, [sp, #0x20]
	str r5, [r8]
	str r0, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl sub_02005990
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02005B0C: .word 0x04000006
	arm_func_end sub_02005A80

	arm_func_start sub_02005B10
sub_02005B10: ; 0x02005B10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_02005EE8
	mov r4, r0
	cmp r8, #0
	beq _02005B40
	ldr r0, [r8]
	cmp r0, #0
	beq _02005B44
_02005B40:
	bl sub_02006058
_02005B44:
	ldr r0, _02005B9C ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_02005E90
	mov r1, #1
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r0, [sp, #0x20]
	str r5, [r8]
	str r0, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl sub_02005990
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02005B9C: .word 0x04000006
	arm_func_end sub_02005B10

	arm_func_start sub_02005BA0
sub_02005BA0: ; 0x02005BA0
	stmdb sp!, {r4, lr}
	ldr r1, _02005BF4 ; =0x037FDAF8
	mov r4, r0
	mov r0, #4
	bl sub_020039A4
	ldrsh r3, [r4, #0x10]
	ldr r2, _02005BF8 ; =0x04000004
	mov r0, r3, lsl #0x18
	ldrh r1, [r2]
	and r3, r3, #0x100
	and r1, r1, #0x3f
	orr r0, r1, r0, lsr #16
	orr r0, r0, r3, asr #1
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, #4
	orr r1, r1, #0x20
	strh r1, [r2]
	bl sub_02003AD8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02005BF4: .word 0x037FDAF8
_02005BF8: .word 0x04000004
	arm_func_end sub_02005BA0

	arm_func_start sub_02005BFC
sub_02005BFC: ; 0x02005BFC
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bne _02005C10
	bl sub_02006058
_02005C10:
	cmp r5, #0
	strne r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02005BFC

	arm_func_start sub_02005C20
sub_02005C20: ; 0x02005C20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02005EE8
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _02005C4C
	bl sub_02005EFC
	b _02005C64
_02005C4C:
	mov r0, r5
	bl sub_02005A34
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl sub_02005EFC
_02005C64:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02005C20

	arm_func_start sub_02005C6C
sub_02005C6C: ; 0x02005C6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl sub_02005EE8
	mov r5, r0
	cmp r7, #0
	bne _02005C88
	bl sub_02006058
_02005C88:
	ldr r0, _02005CDC ; =0x03807844
	mov r4, #0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r6, [r0, #0x18]
	moveq r6, #0
	b _02005CC4
_02005CA4:
	ldr r1, [r0, #8]
	cmp r1, r7
	bne _02005CB4
	bl sub_02005C20
_02005CB4:
	mov r0, r6
	cmp r6, #0
	ldrne r6, [r6, #0x18]
	moveq r6, r4
_02005CC4:
	cmp r0, #0
	bne _02005CA4
	mov r0, r5
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02005CDC: .word 0x03807844
	arm_func_end sub_02005C6C

	arm_func_start sub_02005CE0
sub_02005CE0: ; 0x02005CE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl sub_02003B10
	ldr r2, _02005E80 ; =0x04000004
	ldr r1, _02005E84 ; =0x0380FFF8
	ldrh r0, [r2]
	bic r0, r0, #0x20
	strh r0, [r2]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
	ldrh r0, [r2]
	mov r1, r0, asr #8
	mov r0, r0, lsl #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl sub_02005E90
	ldr sl, _02005E88 ; =0x04000006
	mov r6, #0
	ldr r5, _02005E8C ; =0x03807844
	sub r7, sl, #2
	mov fp, #1
	mov r8, r6
	b _02005E6C
_02005D48:
	ldrh sb, [sl]
	mov r0, sb
	bl sub_02005E90
	ldrsh r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	sub r1, sb, r1
	mov sb, r0
	subs r0, sb, r2
	bmi _02005D7C
	cmp r0, #0
	bne _02005D84
	cmp r1, #0
	bge _02005D84
_02005D7C:
	mov r0, r8
	b _02005DA0
_02005D84:
	cmp r1, #0
	addlt r0, r1, #7
	addlt r1, r0, #0x100
	ldrsh r0, [r4, #0x12]
	cmp r1, r0
	movle r0, fp
	movgt r0, #2
_02005DA0:
	cmp r0, #0
	beq _02005DBC
	cmp r0, #1
	beq _02005DF8
	cmp r0, #2
	beq _02005E50
	b _02005E6C
_02005DBC:
	mov r0, r4
	bl sub_02005BA0
	ldrh r1, [sl]
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	ldreq r0, [r4, #0xc]
	cmpeq r0, sb
	bne _02005E78
	mov r0, #4
	bl sub_02003B10
	ldrh r1, [r7]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r7]
	bl sub_02003B4C
_02005DF8:
	ldr sb, [r4]
	mov r0, r4
	bl sub_02005A34
	str r6, [r4]
	cmp sb, #0
	beq _02005E1C
	ldr r0, [r4, #4]
	mov lr, pc
	bx sb
_02005E1C:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02005E6C
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02005E6C
	str sb, [r4]
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl sub_02005990
	b _02005E6C
_02005E50:
	mov r0, r4
	bl sub_02005A34
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl sub_02005990
_02005E6C:
	ldr r4, [r5, #0xc]
	cmp r4, #0
	bne _02005D48
_02005E78:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02005E80: .word 0x04000004
_02005E84: .word 0x0380FFF8
_02005E88: .word 0x04000006
_02005E8C: .word 0x03807844
	arm_func_end sub_02005CE0

	arm_func_start sub_02005E90
sub_02005E90: ; 0x02005E90
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02005EE8
	ldr r1, _02005ED0 ; =0x03807844
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _02005ED0 ; =0x03807844
	str r4, [r1, #4]
	bl sub_02005EFC
	ldr r0, _02005ED0 ; =0x03807844
	ldr r0, [r0, #8]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02005ED0: .word 0x03807844
	arm_func_end sub_02005E90
_02005ED4:
	.byte 0x00, 0x00, 0x0F, 0xE1, 0x80, 0x10, 0xC0, 0xE3, 0x01, 0xF0, 0x21, 0xE1
	.byte 0x80, 0x00, 0x00, 0xE2, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02005EE8
sub_02005EE8: ; 0x02005EE8
	mrs r0, cpsr
	orr r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end sub_02005EE8

	arm_func_start sub_02005EFC
sub_02005EFC: ; 0x02005EFC
	mrs r1, cpsr
	bic r2, r1, #0x80
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0x80
	bx lr
	arm_func_end sub_02005EFC

	arm_func_start sub_02005F14
sub_02005F14: ; 0x02005F14
	mrs r0, cpsr
	orr r1, r0, #0xc0
	msr cpsr_c, r1
	and r0, r0, #0xc0
	bx lr
	arm_func_end sub_02005F14

	arm_func_start sub_02005F28
sub_02005F28: ; 0x02005F28
	mrs r1, cpsr
	bic r2, r1, #0xc0
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0xc0
	bx lr
	arm_func_end sub_02005F28

	arm_func_start sub_02005F40
sub_02005F40: ; 0x02005F40
	mrs r0, cpsr
	and r0, r0, #0x1f
	bx lr
	arm_func_end sub_02005F40

	arm_func_start sub_02005F4C
sub_02005F4C: ; 0x02005F4C
	ldr ip, _02005F60 ; =sub_038037B8
	mov r1, r0, asr #1
	add r0, r0, r1, lsr #30
	mov r0, r0, asr #2
	bx ip
	.align 2, 0
_02005F60: .word sub_038037B8
	arm_func_end sub_02005F4C

	arm_func_start sub_02005F64
sub_02005F64: ; 0x02005F64
	stmdb sp!, {r3, lr}
	ldr r2, _02005F94 ; =0x03807858
	ldrh r0, [r2]
	cmp r0, #0
	bne _02005F8C
	ldr r1, _02005F98 ; =0x037FDDC4
	mov r3, #1
	mov r0, #0xc
	strh r3, [r2]
	bl sub_02006584
_02005F8C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02005F94: .word 0x03807858
_02005F98: .word 0x037FDDC4
	arm_func_end sub_02005F64
_02005F9C:
	.byte 0x04, 0x00, 0x9F, 0xE5
	.byte 0xB2, 0x00, 0xD0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0x58, 0x78, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x7F, 0x0C, 0x01, 0xE2, 0x00, 0x04, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0x10, 0x00, 0x50, 0xE3
	.byte 0x14, 0x00, 0x9F, 0x05, 0x01, 0x10, 0xA0, 0x03, 0xB2, 0x10, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x0A
	.byte 0x20, 0x00, 0x00, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x58, 0x78, 0x80, 0x03
	.byte 0x70, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0xA0, 0xE3, 0x3B, 0x00, 0x00, 0xEB, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x39, 0x00, 0x00, 0xEB, 0x02, 0x00, 0xA0, 0xE3, 0x37, 0x00, 0x00, 0xEB, 0x03, 0x00, 0xA0, 0xE3
	.byte 0x35, 0x00, 0x00, 0xEB, 0x01, 0x07, 0xA0, 0xE3, 0x9F, 0xF6, 0xFF, 0xEB, 0x00, 0x00, 0xE0, 0xE3
	.byte 0xCD, 0xF6, 0xFF, 0xEB, 0x20, 0x02, 0x00, 0xEB, 0x0C, 0x60, 0xA0, 0xE3, 0x01, 0x5A, 0xA0, 0xE3
	.byte 0x00, 0x40, 0xA0, 0xE3, 0x06, 0x00, 0xA0, 0xE1, 0x05, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1
	.byte 0x70, 0x01, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0xF9, 0xFF, 0xFF, 0x1A, 0x10, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x16, 0x25, 0x00, 0xEB, 0x70, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x08, 0x02, 0x00, 0x04

	arm_func_start sub_02006058
sub_02006058: ; 0x02006058
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_0200E7F8
_02006064:
	bl sub_02005EE8
	bl sub_02000660
	b _02006064
	arm_func_end sub_02006058

	arm_func_start sub_02006070
sub_02006070: ; 0x02006070
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02005EE8
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	mov r1, r1, lsl #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_02006090:
	ldr r1, [r2]
	tst r1, #0x80000000
	bne _02006090
	cmp r4, #0
	bne _020060CC
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _020060D8 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_020060CC:
	bl sub_02005EFC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020060D8: .word 0x81400001
	arm_func_end sub_02006070

	arm_func_start sub_020060DC
sub_020060DC: ; 0x020060DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02005EE8
	mov r1, #6
	mul r1, r4, r1
	add r1, r1, #5
	mov r1, r1, lsl #1
	add r1, r1, #0x4000000
	ldrh r2, [r1, #0xb0]
	cmp r4, #0
	bic r2, r2, #0x3200
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	bic r2, r2, #0x8000
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	ldrh r1, [r1, #0xb0]
	bne _0200614C
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _02006158 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_0200614C:
	bl sub_02005EFC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02006158: .word 0x81400001
	arm_func_end sub_020060DC
_0200615C:
	.byte 0x00, 0x30, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x53, 0xE1, 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xEA, 0xB3, 0x00, 0x81, 0xE1
	.byte 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xEA, 0x02, 0x30, 0x83, 0xE2, 0xF7, 0xFF, 0xFF, 0xBA
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x00, 0xC0, 0xA0, 0xE3, 0x02, 0x00, 0x5C, 0xE1, 0x00, 0x00, 0x00, 0xBA
	.byte 0x00, 0x00, 0x00, 0xEA, 0xBC, 0x30, 0x90, 0xE1, 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xEA
	.byte 0xBC, 0x30, 0x81, 0xE1, 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xEA, 0x02, 0xC0, 0x8C, 0xE2
	.byte 0xF4, 0xFF, 0xFF, 0xBA, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_020061B8
sub_020061B8: ; 0x020061B8
	add ip, r1, r2
_020061BC:
	cmp r1, ip
	blt _020061C8
	b _020061CC
_020061C8:
	stmia r1!, {r0}
_020061CC:
	blt _020061BC
	bx lr
	arm_func_end sub_020061B8
_020061D4:
	.byte 0x02, 0xC0, 0x81, 0xE0, 0x0C, 0x00, 0x51, 0xE1, 0x00, 0x00, 0x00, 0xBA
	.byte 0x00, 0x00, 0x00, 0xEA, 0x04, 0x00, 0xB0, 0xE8, 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xEA
	.byte 0x04, 0x00, 0xA1, 0xE8, 0xF7, 0xFF, 0xFF, 0xBA, 0x1E, 0xFF, 0x2F, 0xE1, 0xF0, 0x03, 0x2D, 0xE9
	.byte 0x02, 0x90, 0x81, 0xE0, 0xA2, 0xC2, 0xA0, 0xE1, 0x8C, 0xC2, 0x81, 0xE0, 0x00, 0x20, 0xA0, 0xE1
	.byte 0x02, 0x30, 0xA0, 0xE1, 0x02, 0x40, 0xA0, 0xE1, 0x02, 0x50, 0xA0, 0xE1, 0x02, 0x60, 0xA0, 0xE1
	.byte 0x02, 0x70, 0xA0, 0xE1, 0x02, 0x80, 0xA0, 0xE1, 0x0C, 0x00, 0x51, 0xE1, 0x00, 0x00, 0x00, 0xBA
	.byte 0x00, 0x00, 0x00, 0xEA, 0xFD, 0x01, 0xA1, 0xE8, 0xFA, 0xFF, 0xFF, 0xBA, 0x09, 0x00, 0x51, 0xE1
	.byte 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA1, 0xE8, 0xFA, 0xFF, 0xFF, 0xBA
	.byte 0xF0, 0x03, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x00, 0x00, 0x52, 0xE3, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x00, 0x10, 0xE3, 0x08, 0x00, 0x00, 0x0A
	.byte 0xB1, 0xC0, 0x50, 0xE1, 0xFF, 0xC0, 0x0C, 0xE2, 0x01, 0x34, 0x8C, 0xE1, 0xB1, 0x30, 0x40, 0xE1
	.byte 0x01, 0x00, 0x80, 0xE2, 0x01, 0x20, 0x52, 0xE2, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x02, 0x00, 0x52, 0xE3, 0x13, 0x00, 0x00, 0x3A, 0x01, 0x14, 0x81, 0xE1
	.byte 0x02, 0x00, 0x10, 0xE3, 0x04, 0x00, 0x00, 0x0A, 0xB2, 0x10, 0xC0, 0xE0, 0x02, 0x20, 0x52, 0xE2
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x18, 0x81, 0xE1
	.byte 0x03, 0x30, 0xD2, 0xE3, 0x04, 0x00, 0x00, 0x0A, 0x03, 0x20, 0x42, 0xE0, 0x00, 0xC0, 0x83, 0xE0
	.byte 0x04, 0x10, 0x80, 0xE4, 0x0C, 0x00, 0x50, 0xE1, 0xFC, 0xFF, 0xFF, 0x3A, 0x02, 0x00, 0x12, 0xE3
	.byte 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA, 0xB2, 0x10, 0xC0, 0xE0, 0x01, 0x00, 0x12, 0xE3
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x30, 0xD0, 0xE1
	.byte 0xFF, 0x3C, 0x03, 0xE2, 0xFF, 0x10, 0x01, 0xE2, 0x03, 0x10, 0x81, 0xE1, 0xB0, 0x10, 0xC0, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x00, 0x00, 0x52, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x00, 0x11, 0xE3, 0x13, 0x00, 0x00, 0x0A, 0xB1, 0xC0, 0x51, 0xE1
	.byte 0xFF, 0xC0, 0x0C, 0xE2, 0x01, 0x00, 0x10, 0xE3, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA
	.byte 0xB1, 0x30, 0x50, 0xE1, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA, 0x23, 0x34, 0xA0, 0xE1
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0xB0, 0x30, 0xD0, 0xE1, 0x03, 0x34, 0x8C, 0xE1
	.byte 0xB1, 0x30, 0x41, 0xE1, 0x01, 0x00, 0x80, 0xE2, 0x01, 0x10, 0x81, 0xE2, 0x01, 0x20, 0x52, 0xE2
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0x00, 0xC0, 0x21, 0xE0
	.byte 0x01, 0x00, 0x1C, 0xE3, 0x13, 0x00, 0x00, 0x0A, 0x01, 0x00, 0xC0, 0xE3, 0xB2, 0xC0, 0xD0, 0xE0
	.byte 0x2C, 0x34, 0xA0, 0xE1, 0x02, 0x20, 0x52, 0xE2, 0x05, 0x00, 0x00, 0x3A, 0xB2, 0xC0, 0xD0, 0xE0
	.byte 0x0C, 0xC4, 0x83, 0xE1, 0xB2, 0xC0, 0xC1, 0xE0, 0x2C, 0x38, 0xA0, 0xE1, 0x02, 0x20, 0x52, 0xE2
	.byte 0xF9, 0xFF, 0xFF, 0x2A, 0x01, 0x00, 0x12, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0xC0, 0xD1, 0xE1, 0xFF, 0xCC, 0x0C, 0xE2, 0x03, 0xC0, 0x8C, 0xE1
	.byte 0xB0, 0xC0, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0x02, 0x00, 0x1C, 0xE3, 0x08, 0x00, 0x00, 0x0A
	.byte 0x01, 0x30, 0xD2, 0xE3, 0x1F, 0x00, 0x00, 0x0A, 0x03, 0x20, 0x42, 0xE0, 0x01, 0xC0, 0x83, 0xE0
	.byte 0xB2, 0x30, 0xD0, 0xE0, 0xB2, 0x30, 0xC1, 0xE0, 0x0C, 0x00, 0x51, 0xE1, 0xFB, 0xFF, 0xFF, 0x3A
	.byte 0x18, 0x00, 0x00, 0xEA, 0x02, 0x00, 0x52, 0xE3, 0x16, 0x00, 0x00, 0x3A, 0x02, 0x00, 0x11, 0xE3
	.byte 0x05, 0x00, 0x00, 0x0A, 0xB2, 0x30, 0xD0, 0xE0, 0xB2, 0x30, 0xC1, 0xE0, 0x02, 0x20, 0x52, 0xE2
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0x03, 0x30, 0xD2, 0xE3
	.byte 0x05, 0x00, 0x00, 0x0A, 0x03, 0x20, 0x42, 0xE0, 0x01, 0xC0, 0x83, 0xE0, 0x04, 0x30, 0x90, 0xE4
	.byte 0x04, 0x30, 0x81, 0xE4, 0x0C, 0x00, 0x51, 0xE1, 0xFB, 0xFF, 0xFF, 0x3A, 0x02, 0x00, 0x12, 0xE3
	.byte 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA, 0xB2, 0x30, 0xD0, 0xE0, 0x00, 0x00, 0x00, 0x1A
	.byte 0x00, 0x00, 0x00, 0xEA, 0xB2, 0x30, 0xC1, 0xE0, 0x01, 0x00, 0x12, 0xE3, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x20, 0xD1, 0xE1, 0xB0, 0x00, 0xD0, 0xE1
	.byte 0xFF, 0x2C, 0x02, 0xE2, 0xFF, 0x00, 0x00, 0xE2, 0x00, 0x00, 0x82, 0xE1, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02006494
sub_02006494: ; 0x02006494
	.word 0xE1010090
	bx lr
	arm_func_end sub_02006494

	arm_func_start sub_0200649C
sub_0200649C: ; 0x0200649C
	ldr ip, _020064A4 ; =sub_037FE2C0
	bx ip
	.align 2, 0
_020064A4: .word sub_037FE2C0
	arm_func_end sub_0200649C

	arm_func_start sub_020064A8
sub_020064A8: ; 0x020064A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl sub_02005EE8
	ldr r1, _02006568 ; =0x0380785C
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _02006558
	ldr r0, _0200656C ; =0x027FFC00
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	str r2, [r0, #0x38c]
	ldr r0, _02006570 ; =0x03807860
	mov r1, r2
_020064E0:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _020064E0
	ldr r2, _02006574 ; =0x0000C408
	ldr r1, _02006578 ; =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl sub_02003B4C
	ldr r1, _0200657C ; =0x037FE4A8
	mov r0, #0x40000
	bl sub_020039A4
	mov r0, #0x40000
	bl sub_02003AD8
	mov r5, #8
	ldr r8, _02006580 ; =0x04000180
	mov r6, r5
	mov r7, #0x3e8
	b _02006550
_0200652C:
	mov r0, r5, lsl #8
	strh r0, [r8]
	mov r0, r7
	bl sub_02005F4C
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, r5
	movne r5, r6
	sub r5, r5, #1
_02006550:
	cmp r5, #0
	bge _0200652C
_02006558:
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02006568: .word 0x0380785C
_0200656C: .word 0x027FFC00
_02006570: .word 0x03807860
_02006574: .word 0x0000C408
_02006578: .word 0x04000184
_0200657C: .word 0x037FE4A8
_02006580: .word 0x04000180
	arm_func_end sub_020064A8

	arm_func_start sub_02006584
sub_02006584: ; 0x02006584
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl sub_02005EE8
	ldr r1, _020065CC ; =0x03807860
	ldr r3, _020065D0 ; =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x38c]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	ldreq r2, [r3, #0x38c]
	mvneq r1, r1, lsl r4
	andeq r1, r2, r1
	str r1, [r3, #0x38c]
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020065CC: .word 0x03807860
_020065D0: .word 0x027FFC00
	arm_func_end sub_02006584

	arm_func_start sub_020065D4
sub_020065D4: ; 0x020065D4
	ldr r2, _020065F4 ; =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_020065F4: .word 0x027FFC00
	arm_func_end sub_020065D4

	arm_func_start sub_020065F8
sub_020065F8: ; 0x020065F8
	stmdb sp!, {r3, lr}
	ldr r3, [sp]
	and r0, r0, #0x1f
	bic r3, r3, #0x1f
	orr r0, r3, r0
	bic r3, r0, #0x20
	mov r0, r2, lsl #0x1f
	orr r0, r3, r0, lsr #26
	and r0, r0, #0x3f
	orr r0, r0, r1, lsl #6
	str r0, [sp]
	bl sub_02006630
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_020065F8

	arm_func_start sub_02006630
sub_02006630: ; 0x02006630
	stmdb sp!, {r4, lr}
	ldr r2, _0200668C ; =0x04000184
	mov r4, r0
	ldrh r0, [r2]
	tst r0, #0x4000
	ldrneh r1, [r2]
	mvnne r0, #0
	orrne r1, r1, #0xc000
	strneh r1, [r2]
	bne _02006684
	bl sub_02005EE8
	ldr r2, _0200668C ; =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _02006678
	bl sub_02005EFC
	mvn r0, #1
	b _02006684
_02006678:
	str r4, [r2, #4]
	bl sub_02005EFC
	mov r0, #0
_02006684:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200668C: .word 0x04000184
	arm_func_end sub_02006630

	arm_func_start sub_02006690
sub_02006690: ; 0x02006690
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r6, [sp]
	mvn r8, #3
	ldr r4, _02006768 ; =0x03807860
	ldr sb, _0200676C ; =0x04000184
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_020066B4:
	ldrh r0, [sb]
	tst r0, #0x4000
	ldrneh r0, [sb]
	addne r1, r8, #1
	orrne r0, r0, #0xc000
	strneh r0, [sb]
	bne _020066FC
	bl sub_02005EE8
	ldrh r1, [sb]
	tst r1, #0x100
	beq _020066EC
	bl sub_02005EFC
	mov r1, r8
	b _020066FC
_020066EC:
	ldr r6, [r7]
	str r6, [sp]
	bl sub_02005EFC
	mov r1, r5
_020066FC:
	cmp r1, r8
	beq _0200675C
	cmp r1, sl
	beq _020066B4
	mov r0, r6, lsl #0x1b
	movs r0, r0, lsr #0x1b
	beq _020066B4
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _0200673C
	mov r2, r6, lsl #0x1a
	mov r1, r6, lsr #6
	mov r2, r2, lsr #0x1f
	mov lr, pc
	bx r3
_02006738:
	.byte 0xDD, 0xFF, 0xFF, 0xEA
_0200673C:
	mov r0, r6, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _020066B4
	orr r6, r6, #0x20
	mov r0, r6
	str r6, [sp]
	bl sub_02006630
	b _020066B4
_0200675C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02006768: .word 0x03807860
_0200676C: .word 0x04000184
	arm_func_end sub_02006690

	arm_func_start sub_02006770
sub_02006770: ; 0x02006770
	ldr r2, _0200678C ; =0x04000134
	mvn r3, r0
	ldrh r0, [r2]
	and r0, r3, r0
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200678C: .word 0x04000134
	arm_func_end sub_02006770

	arm_func_start sub_02006790
sub_02006790: ; 0x02006790
	ldr ip, _020067A4 ; =sub_037FE588
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0xc000
	bx ip
	.align 2, 0
_020067A4: .word sub_037FE588
	arm_func_end sub_02006790

	arm_func_start sub_020067A8
sub_020067A8: ; 0x020067A8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_0200538C
	cmp r0, #0
	beq _020067C8
	bl sub_02005578
	cmp r0, #0
	bne _020067D0
_020067C8:
	mov r0, #0
	b _02006828
_020067D0:
	ldr r0, _02006834 ; =0x038078E0
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _02006828
	ldr r0, _02006838 ; =0x038078E4
	bl sub_02005588
	bl sub_02005404
	ldr r2, _0200683C ; =0x037FE65C
	ldr r3, _02006840 ; =0x0000082E
	str r2, [sp, #4]
	adds ip, r0, r3
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r0, _02006838 ; =0x038078E4
	mov r1, ip
	str lr, [sp]
	bl sub_02005734
	ldr r1, _02006834 ; =0x038078E0
	mov r0, #1
	str r0, [r1]
_02006828:
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_02006834: .word 0x038078E0
_02006838: .word 0x038078E4
_0200683C: .word 0x037FE65C
_02006840: .word 0x0000082E
	arm_func_end sub_020067A8

	arm_func_start sub_02006844
sub_02006844: ; 0x02006844
	stmdb sp!, {r4, lr}
	mov r0, #0x8000
	mov r4, #0
	bl sub_02006790
	ldr r0, _0200687C ; =0x04000136
	ldrh r1, [r0]
	ldr r0, _02006880 ; =0x027FFFA8
	tst r1, #0x80
	movne r4, #0x8000
	and r1, r1, #0xb
	orr r1, r4, r1, lsl #10
	strh r1, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200687C: .word 0x04000136
_02006880: .word 0x027FFFA8
	arm_func_end sub_02006844
_02006884:
	.byte 0x0C, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0xD1, 0xE5, 0x80, 0x00, 0x80, 0xE3
	.byte 0x00, 0x00, 0xC1, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x05, 0x00, 0x04, 0x38, 0x40, 0x2D, 0xE9
	.byte 0x40, 0x10, 0x9F, 0xE5, 0x00, 0x50, 0xA0, 0xE3, 0x00, 0x00, 0xD1, 0xE5, 0x80, 0x00, 0xC0, 0xE3
	.byte 0x00, 0x00, 0xC1, 0xE5, 0x01, 0x40, 0xA0, 0xE3, 0x05, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE1
	.byte 0xD0, 0x00, 0x00, 0xEB, 0x01, 0x50, 0x85, 0xE2, 0x10, 0x00, 0x55, 0xE3, 0xF9, 0xFF, 0xFF, 0xBA
	.byte 0x14, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x10, 0xC0, 0xE5, 0x01, 0x10, 0xC0, 0xE5
	.byte 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x05, 0x00, 0x04, 0x08, 0x05, 0x00, 0x04

	arm_func_start sub_020068F0
sub_020068F0: ; 0x020068F0
	stmdb sp!, {r3, lr}
	ldr r2, _02006934 ; =0x04000501
	mov r0, #0x80
	ldrb r1, [r2]
	bic r1, r1, #0x80
	strb r1, [r2]
	bl sub_0200693C
	mov r0, #0x40000
	bl sub_02005F4C
	mov r0, #1
	bl sub_0200CF4C
	ldr r1, _02006938 ; =0x04000304
	ldrh r0, [r1]
	bic r0, r0, #1
	strh r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02006934: .word 0x04000501
_02006938: .word 0x04000304
	arm_func_end sub_020068F0

	arm_func_start sub_0200693C
sub_0200693C: ; 0x0200693C
	ldr ip, _02006944 ; =sub_038037E6
	bx ip
	.align 2, 0
_02006944: .word sub_038037E6
	arm_func_end sub_0200693C

	arm_func_start sub_02006948
sub_02006948: ; 0x02006948
	stmdb sp!, {r3, lr}
	ldr r2, _0200698C ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	bl sub_0200CF28
	mov r0, #0x100
	bl sub_02006998
	ldr r0, _02006990 ; =0x0007AB80
	bl sub_02005F4C
	ldr r1, _02006994 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200698C: .word 0x04000304
_02006990: .word 0x0007AB80
_02006994: .word 0x04000501
	arm_func_end sub_02006948

	arm_func_start sub_02006998
sub_02006998: ; 0x02006998
	ldr ip, _020069A0 ; =sub_038037DE
	bx ip
	.align 2, 0
_020069A0: .word sub_038037DE
	arm_func_end sub_02006998
_020069A4:
	.byte 0x04, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0xC1, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x00, 0x05, 0x00, 0x04, 0x2C, 0xC0, 0x9F, 0xE5, 0x83, 0x32, 0xA0, 0xE1, 0x00, 0xC0, 0xDC, 0xE5
	.byte 0x80, 0x00, 0x1C, 0xE3, 0x01, 0xC0, 0xA0, 0x13, 0x00, 0xC0, 0xA0, 0x03, 0x8C, 0x33, 0x83, 0xE1
	.byte 0x02, 0x22, 0x83, 0xE1, 0x01, 0x21, 0x82, 0xE1, 0x08, 0x10, 0x9F, 0xE5, 0x02, 0x00, 0x80, 0xE1
	.byte 0x00, 0x00, 0xC1, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x05, 0x00, 0x04

	arm_func_start sub_020069EC
sub_020069EC: ; 0x020069EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _02006AA4 ; =0x03807558
	mov r8, r1
	ldr lr, [r4]
	ldr r1, _02006AA8 ; =0x03807910
	mov r7, r2
	ldr r5, [sp, #0x2c]
	ldr r4, _02006AAC ; =0x03807914
	ldr ip, [sp, #0x20]
	ldr r2, _02006AB0 ; =0x03807924
	strb r5, [r4, r0]
	cmp lr, #0
	ldr r1, [r1]
	movge r5, lr
	mov r6, r3
	mov r4, r0, lsl #4
	strb ip, [r2, r0]
	cmp r1, #0
	ble _02006A58
	ldr r1, _02006AB4 ; =0x0000FFF5
	mov r2, #1
	tst r1, r2, lsl r0
	beq _02006A58
	mov r0, ip
	mov r1, r5
	bl sub_02006E28
	mov ip, r0
_02006A58:
	ldr r2, [sp, #0x24]
	mov r0, r6, lsl #0x1b
	orr r0, r0, r7, lsl #29
	orr r1, r0, r5, lsl #16
	ldr r0, [sp, #0x28]
	orr r2, r1, r2, lsl #8
	add r1, r4, #0x4000000
	orr r2, ip, r2
	str r2, [r1, #0x400]
	ldr r3, [sp, #0x18]
	rsb r2, r0, #0x10000
	add r0, r1, #0x400
	strh r2, [r0, #8]
	ldr r2, [sp, #0x1c]
	strh r3, [r0, #0xa]
	str r2, [r1, #0x40c]
	str r8, [r1, #0x404]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02006AA4: .word 0x03807558
_02006AA8: .word 0x03807910
_02006AAC: .word 0x03807914
_02006AB0: .word 0x03807924
_02006AB4: .word 0x0000FFF5
	arm_func_end sub_020069EC

	arm_func_start sub_02006AB8
sub_02006AB8: ; 0x02006AB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02006B50 ; =0x03807558
	mov r7, r1
	ldr ip, [r4]
	ldr r1, _02006B54 ; =0x03807910
	mov r6, r3
	ldr r3, _02006B58 ; =0x03807924
	ldr r5, [sp, #0x1c]
	ldr r4, _02006B5C ; =0x03807914
	ldr r1, [r1]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r2, [r3, r0]
	cmp r1, #0
	ble _02006B1C
	ldr r1, _02006B60 ; =0x0000FFF5
	mov r3, #1
	tst r1, r3, lsl r0
	beq _02006B1C
	mov r0, r2
	mov r1, r5
	bl sub_02006E28
	mov r2, r0
_02006B1C:
	mov r0, r7, lsl #0x18
	orr r0, r0, #0x60000000
	orr r0, r0, r5, lsl #16
	ldr r1, [sp, #0x18]
	orr r3, r0, r6, lsl #8
	add r0, r4, #0x4000000
	orr r2, r2, r3
	str r2, [r0, #0x400]
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02006B50: .word 0x03807558
_02006B54: .word 0x03807910
_02006B58: .word 0x03807924
_02006B5C: .word 0x03807914
_02006B60: .word 0x0000FFF5
	arm_func_end sub_02006AB8

	arm_func_start sub_02006B64
sub_02006B64: ; 0x02006B64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02006BF4 ; =0x03807558
	mov r7, r2
	ldr ip, [r4]
	ldr r2, _02006BF8 ; =0x03807910
	mov r6, r3
	ldr r3, _02006BFC ; =0x03807924
	ldr r5, [sp, #0x18]
	ldr r4, _02006C00 ; =0x03807914
	ldr r2, [r2]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r1, [r3, r0]
	cmp r2, #0
	ble _02006BC8
	ldr r2, _02006C04 ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _02006BC8
	mov r0, r1
	mov r1, r5
	bl sub_02006E28
	mov r1, r0
_02006BC8:
	mov r0, r5, lsl #0x10
	orr r0, r0, #0x60000000
	orr r2, r0, r7, lsl #8
	add r0, r4, #0x4000000
	orr r1, r1, r2
	str r1, [r0, #0x400]
	rsb r1, r6, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02006BF4: .word 0x03807558
_02006BF8: .word 0x03807910
_02006BFC: .word 0x03807924
_02006C00: .word 0x03807914
_02006C04: .word 0x0000FFF5
	arm_func_end sub_02006B64

	arm_func_start sub_02006C08
sub_02006C08: ; 0x02006C08
	mov r3, r0, lsl #4
	add r0, r3, #0x4000000
	ldr r2, [r0, #0x400]
	add r0, r3, #0x400
	tst r1, #1
	bic r1, r2, #0x80000000
	add r0, r0, #0x4000000
	orrne r1, r1, #0x8000
	str r1, [r0]
	bx lr
	arm_func_end sub_02006C08

	arm_func_start sub_02006C30
sub_02006C30: ; 0x02006C30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02006C9C ; =0x03807910
	ldr ip, _02006CA0 ; =0x03807924
	ldr r3, [r3]
	mov r5, r0
	mov r4, r2
	strb r1, [ip, r5]
	cmp r3, #0
	ble _02006C80
	ldr r0, _02006CA4 ; =0x0000FFF5
	mov r2, #1
	tst r0, r2, lsl r5
	beq _02006C80
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	ldrb r2, [r0, #0x402]
	mov r0, r1
	mov r1, r2
	bl sub_02006E28
	mov r1, r0
_02006C80:
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	orr r1, r1, r4, lsl #8
	add r0, r0, #0x400
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02006C9C: .word 0x03807910
_02006CA0: .word 0x03807924
_02006CA4: .word 0x0000FFF5
	arm_func_end sub_02006C30

	arm_func_start sub_02006CA8
sub_02006CA8: ; 0x02006CA8
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	bx lr
	arm_func_end sub_02006CA8

	arm_func_start sub_02006CC0
sub_02006CC0: ; 0x02006CC0
	stmdb sp!, {r4, lr}
	ldr r2, _02006D24 ; =0x03807558
	ldr r3, _02006D28 ; =0x03807914
	ldr r2, [r2]
	strb r1, [r3, r0]
	cmp r2, #0
	ldr r3, _02006D2C ; =0x03807910
	mov r4, r0, lsl #4
	movge r1, r2
	add r2, r4, #0x4000000
	strb r1, [r2, #0x402]
	ldr r2, [r3]
	cmp r2, #0
	ble _02006D1C
	ldr r2, _02006D30 ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _02006D1C
	ldr r2, _02006D34 ; =0x03807924
	ldrb r0, [r2, r0]
	bl sub_02006E28
	add r1, r4, #0x4000000
	strb r0, [r1, #0x400]
_02006D1C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02006D24: .word 0x03807558
_02006D28: .word 0x03807914
_02006D2C: .word 0x03807910
_02006D30: .word 0x0000FFF5
_02006D34: .word 0x03807924
	arm_func_end sub_02006CC0

	arm_func_start sub_02006D38
sub_02006D38: ; 0x02006D38
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x403]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_02006D38
_02006D54:
	.byte 0x54, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x81, 0xE5
	.byte 0x08, 0x00, 0x00, 0xBA, 0x00, 0x20, 0xA0, 0xE3, 0xFF, 0x10, 0x00, 0xE2, 0x02, 0x02, 0xA0, 0xE1
	.byte 0x01, 0x03, 0x80, 0xE2, 0x01, 0x20, 0x82, 0xE2, 0x02, 0x14, 0xC0, 0xE5, 0x10, 0x00, 0x52, 0xE3
	.byte 0xF9, 0xFF, 0xFF, 0xBA, 0x1E, 0xFF, 0x2F, 0xE1, 0x24, 0x20, 0x9F, 0xE5, 0x00, 0x30, 0xA0, 0xE3
	.byte 0x03, 0x10, 0xD2, 0xE7, 0x03, 0x02, 0xA0, 0xE1, 0x01, 0x03, 0x80, 0xE2, 0x01, 0x30, 0x83, 0xE2
	.byte 0x02, 0x14, 0xC0, 0xE5, 0x10, 0x00, 0x53, 0xE3, 0xF8, 0xFF, 0xFF, 0xBA, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x58, 0x75, 0x80, 0x03, 0x14, 0x79, 0x80, 0x03, 0x00, 0x02, 0xA0, 0xE1, 0x01, 0x03, 0x80, 0xE2
	.byte 0x00, 0x04, 0x90, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02006DC8
sub_02006DC8: ; 0x02006DC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _02006E1C ; =0x03807910
	ldr r5, _02006E20 ; =0x03807924
	ldr r4, _02006E24 ; =0x0000FFF5
	str r0, [r1]
	mov r7, #0
	mov r6, #1
_02006DE4:
	tst r4, r6, lsl r7
	beq _02006E08
	mov r8, r7, lsl #4
	add r0, r8, #0x4000000
	ldrb r1, [r0, #0x402]
	ldrb r0, [r5, r7]
	bl sub_02006E28
	add r1, r8, #0x4000000
	strb r0, [r1, #0x400]
_02006E08:
	add r7, r7, #1
	cmp r7, #0x10
	blt _02006DE4
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02006E1C: .word 0x03807910
_02006E20: .word 0x03807924
_02006E24: .word 0x0000FFF5
	arm_func_end sub_02006DC8

	arm_func_start sub_02006E28
sub_02006E28: ; 0x02006E28
	cmp r1, #0x18
	bge _02006E58
	ldr r2, _02006E8C ; =0x03807910
	add r3, r1, #0x28
	ldr ip, [r2]
	ldr r1, _02006E90 ; =0x00007FFF
	mul r2, ip, r3
	sub r1, r1, ip
	add r1, r2, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
_02006E58:
	cmp r1, #0x68
	bxle lr
	ldr r2, _02006E8C ; =0x03807910
	sub r1, r1, #0x28
	ldr ip, [r2]
	rsb r2, ip, #0
	mul r3, r2, r1
	add r1, ip, #0xff
	add r1, r1, #0x7f00
	add r1, r3, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
	.align 2, 0
_02006E8C: .word 0x03807910
_02006E90: .word 0x00007FFF
	arm_func_end sub_02006E28

	arm_func_start sub_02006E94
sub_02006E94: ; 0x02006E94
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	rsb r0, r1, #0
	mov r4, #0
	b _02006EB0
_02006EA8:
	sub r4, r4, #1
	add r0, r0, #0x300
_02006EB0:
	cmp r0, #0
	blt _02006EA8
	b _02006EC4
_02006EBC:
	add r4, r4, #1
	sub r0, r0, #0x300
_02006EC4:
	cmp r0, #0x300
	bge _02006EBC
	bl sub_02006FB4
	adds r3, r0, #0x10000
	mov r0, r5, asr #0x1f
	umull r2, r1, r3, r5
	mov ip, #0
	mla r1, r3, r0, r1
	adc r3, ip, #0
	sub r0, r4, #0x10
	mla r1, r3, r5, r1
	cmp r0, #0
	mov r4, #0x10000
	bgt _02006F1C
	rsb r3, r0, #0
	mov r4, r2, lsr r3
	rsb r0, r3, #0x20
	orr r4, r4, r1, lsl r0
	sub r0, r3, #0x20
	mov r3, r1, lsr r3
	orr r4, r4, r1, lsr r0
	b _02006F78
_02006F1C:
	cmp r0, #0x20
	bge _02006F70
	rsb r5, r0, #0x20
	sub lr, ip, #1
	mov r6, lr, lsl r5
	rsb r3, r5, #0x20
	orr r6, r6, lr, lsr r3
	sub r3, r5, #0x20
	orr r6, r6, lr, lsl r3
	and r3, r1, r6
	and r6, r2, lr, lsl r5
	cmp r3, ip
	cmpeq r6, ip
	subne r0, r4, #1
	bne _02006FA8
	mov r3, r1, lsl r0
	orr r3, r3, r2, lsr r5
	sub r1, r0, #0x20
	mov r4, r2, lsl r0
	orr r3, r3, r2, lsl r1
	b _02006F78
_02006F70:
	sub r0, r4, #1
	b _02006FA8
_02006F78:
	mov r0, #0x10
	cmp r3, #0
	cmpeq r4, #0x10
	mov r1, #0
	movlo r4, r0
	blo _02006FA0
	ldr r0, _02006FB0 ; =0x0000FFFF
	cmp r3, r1
	cmpeq r4, r0
	movhi r4, r0
_02006FA0:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
_02006FA8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02006FB0: .word 0x0000FFFF
	arm_func_end sub_02006E94

	arm_func_start sub_02006FB4
sub_02006FB4: ; 0x02006FB4
	ldr ip, _02006FBC ; =sub_03803828
	bx ip
	.align 2, 0
_02006FBC: .word sub_03803828
	arm_func_end sub_02006FB4

	arm_func_start sub_02006FC0
sub_02006FC0: ; 0x02006FC0
	stmdb sp!, {r4, lr}
	ldr r1, _02007030 ; =0xFFFFFD2D
	mov r4, r0
	cmp r4, r1
	movlt r4, r1
	blt _02006FE0
	cmp r4, #0
	movgt r4, #0
_02006FE0:
	add r0, r4, #0xd3
	add r0, r0, #0x200
	bl sub_02007034
	mvn r2, #0xef
	cmp r4, r2
	movlt r1, #3
	blt _0200701C
	add r1, r2, #0x78
	cmp r4, r1
	movlt r1, #2
	blt _0200701C
	add r1, r2, #0xb4
	cmp r4, r1
	movlt r1, #1
	movge r1, #0
_0200701C:
	orr r0, r0, r1, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02007030: .word 0xFFFFFD2D
	arm_func_end sub_02006FC0

	arm_func_start sub_02007034
sub_02007034: ; 0x02007034
	ldr ip, _0200703C ; =sub_0380382C
	bx ip
	.align 2, 0
_0200703C: .word sub_0380382C
	arm_func_end sub_02007034

	arm_func_start sub_02007040
sub_02007040: ; 0x02007040
	cmp r0, #0x20
	ldrlt r1, _020070A8 ; =0x03806FB8
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x40
	ldrlt r1, _020070A8 ; =0x03806FB8
	rsblt r0, r0, #0x40
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x60
	bge _02007088
	ldr r1, _020070A8 ; =0x03806FB8
	sub r0, r0, #0x40
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
_02007088:
	ldr r1, _020070A8 ; =0x03806FB8
	sub r0, r0, #0x60
	rsb r0, r0, #0x20
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
	.align 2, 0
_020070A8: .word 0x03806FB8
	arm_func_end sub_02007040

	arm_func_start sub_020070AC
sub_020070AC: ; 0x020070AC
	ldr r2, _020070D4 ; =0x0380755C
	ldr r0, _020070D8 ; =0x0019660D
	ldr r3, [r2]
	ldr r1, _020070DC ; =0x3C6EF35F
	mla r1, r3, r0, r1
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	str r1, [r2]
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020070D4: .word 0x0380755C
_020070D8: .word 0x0019660D
_020070DC: .word 0x3C6EF35F
	arm_func_end sub_020070AC

	arm_func_start sub_020070E0
sub_020070E0: ; 0x020070E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _0200713C ; =0x03807934
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _02007130
	mov r0, #1
	str r0, [r1]
	bl sub_0200A0C0
	mov r0, #0x400
	str r0, [sp]
	ldr r0, _02007140 ; =0x038079A4
	ldr r1, _02007144 ; =0x037FF008
	ldr r3, _02007148 ; =0x03807E48
	mov r2, #0
	str r4, [sp, #4]
	bl sub_0200423C
	ldr r0, _02007140 ; =0x038079A4
	bl sub_02004554
_02007130:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200713C: .word 0x03807934
_02007140: .word 0x038079A4
_02007144: .word 0x037FF008
_02007148: .word 0x03807E48
	arm_func_end sub_020070E0

	arm_func_start sub_0200714C
sub_0200714C: ; 0x0200714C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_02005404
	ldr r3, _02007190 ; =0x037FEFEC
	adds ip, r0, #0x10000
	str r3, [sp, #4]
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r3, _02007194 ; =0x00000AA8
	ldr r0, _02007198 ; =0x03807978
	mov r1, ip
	str lr, [sp]
	bl sub_02005734
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_02007190: .word 0x037FEFEC
_02007194: .word 0x00000AA8
_02007198: .word 0x03807978
	arm_func_end sub_0200714C
_0200719C:
	.byte 0x04, 0xC0, 0x9F, 0xE5
	.byte 0x04, 0x00, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1, 0xC0, 0xD5, 0x7F, 0x03, 0x78, 0x79, 0x80, 0x03
	.byte 0x0C, 0xC0, 0x9F, 0xE5, 0x0C, 0x00, 0x9F, 0xE5, 0x02, 0x10, 0xA0, 0xE3, 0x00, 0x20, 0xA0, 0xE3
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0xD4, 0xC6, 0x7F, 0x03, 0x58, 0x79, 0x80, 0x03

	arm_func_start sub_020071CC
sub_020071CC: ; 0x020071CC
	bx lr
	arm_func_end sub_020071CC

	arm_func_start sub_020071D0
sub_020071D0: ; 0x020071D0
	bx lr
	arm_func_end sub_020071D0
_020071D4:
	.byte 0x0C, 0xC0, 0x9F, 0xE5, 0x0C, 0x00, 0x9F, 0xE5, 0x01, 0x10, 0xA0, 0xE3
	.byte 0x00, 0x20, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0xD4, 0xC6, 0x7F, 0x03, 0x58, 0x79, 0x80, 0x03
	.byte 0xF8, 0x43, 0x2D, 0xE9, 0x10, 0xD0, 0x4D, 0xE2, 0xD0, 0x00, 0x9F, 0xE5, 0xD0, 0x10, 0x9F, 0xE5
	.byte 0x08, 0x20, 0xA0, 0xE3, 0xA2, 0xF5, 0xFF, 0xEB, 0xC8, 0x00, 0x9F, 0xE5, 0xDD, 0xF8, 0xFF, 0xEB
	.byte 0x4D, 0x00, 0x00, 0xEB, 0xAF, 0x03, 0x00, 0xEB, 0x3B, 0x0B, 0x00, 0xEB, 0x98, 0xFD, 0xFF, 0xEB
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE1, 0x00, 0x20, 0xA0, 0xE1, 0x00, 0x30, 0xA0, 0xE1
	.byte 0xDF, 0xFD, 0xFF, 0xEB, 0x7F, 0x00, 0xA0, 0xE3, 0xD9, 0xFD, 0xFF, 0xEB, 0x70, 0xF8, 0xFF, 0xEB
	.byte 0x94, 0x20, 0x9F, 0xE5, 0x01, 0x48, 0x90, 0xE2, 0x04, 0x20, 0x8D, 0xE5, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x08, 0x00, 0x8D, 0xE5, 0x00, 0x00, 0x8D, 0xE5, 0x00, 0x20, 0xA1, 0xE2, 0x7C, 0x30, 0x9F, 0xE5
	.byte 0x70, 0x00, 0x9F, 0xE5, 0x04, 0x10, 0xA0, 0xE1, 0x31, 0xF9, 0xFF, 0xEB, 0x5C, 0x70, 0x9F, 0xE5
	.byte 0x01, 0x40, 0xA0, 0xE3, 0x0C, 0x60, 0x8D, 0xE2, 0x00, 0x80, 0xA0, 0xE3, 0x04, 0x50, 0xA0, 0xE1
	.byte 0x07, 0x00, 0xA0, 0xE1, 0x06, 0x10, 0xA0, 0xE1, 0x05, 0x20, 0xA0, 0xE1, 0x08, 0x90, 0xA0, 0xE1
	.byte 0xAC, 0xF5, 0xFF, 0xEB, 0x0C, 0x00, 0x9D, 0xE5, 0x01, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A
	.byte 0x02, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0xEA, 0x04, 0x90, 0xA0, 0xE1, 0x3D, 0x00, 0x00, 0xEB
	.byte 0x93, 0x0B, 0x00, 0xEB, 0x09, 0x00, 0xA0, 0xE1, 0x9F, 0x03, 0x00, 0xEB, 0x09, 0x00, 0xA0, 0xE1
	.byte 0xB3, 0x00, 0x00, 0xEB, 0xEA, 0x0A, 0x00, 0xEB, 0x77, 0xFF, 0xFF, 0xEB, 0xEB, 0xFF, 0xFF, 0xEA
	.byte 0x58, 0x79, 0x80, 0x03, 0x38, 0x79, 0x80, 0x03, 0x78, 0x79, 0x80, 0x03, 0xEC, 0xEF, 0x7F, 0x03
	.byte 0xA8, 0x0A, 0x00, 0x00, 0x38, 0x40, 0x2D, 0xE9, 0x10, 0x40, 0x9D, 0xE5, 0x80, 0x51, 0xA0, 0xE1
	.byte 0x00, 0x00, 0x54, 0xE3, 0x00, 0x40, 0xA0, 0x13, 0x01, 0x40, 0xA0, 0x03, 0x04, 0xC1, 0xA0, 0xE1
	.byte 0x14, 0xE0, 0x9D, 0xE5, 0x81, 0x11, 0x8C, 0xE1, 0x8E, 0xC0, 0x81, 0xE1, 0x18, 0x40, 0x9D, 0xE5
	.byte 0x01, 0x03, 0x80, 0xE2, 0x0C, 0x40, 0x84, 0xE1, 0x08, 0x45, 0xC0, 0xE5, 0x01, 0x13, 0x85, 0xE2
	.byte 0x10, 0x25, 0x81, 0xE5, 0x05, 0x0C, 0x81, 0xE2, 0xB4, 0x31, 0xC0, 0xE1, 0x38, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x03, 0x80, 0xE2, 0x08, 0x05, 0xD0, 0xE5, 0x80, 0x00, 0x10, 0xE3
	.byte 0x01, 0x00, 0xA0, 0x13, 0x00, 0x00, 0xA0, 0x03, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0200734C
sub_0200734C: ; 0x0200734C
	stmdb sp!, {r3, lr}
	ldr r3, _020073A0 ; =0x03807E70
	mov lr, #0
	mov r0, #0x54
_0200735C:
	mul r1, lr, r0
	add ip, r3, r1
	strb lr, [r3, r1]
	ldrb r1, [ip, #3]
	add lr, lr, #1
	bic r2, r1, #0xf8
	and r1, r2, #0xff
	bic r1, r1, #1
	strb r1, [ip, #3]
	cmp lr, #0x10
	blt _0200735C
	ldr r0, _020073A4 ; =0x03807E48
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020073A0: .word 0x03807E70
_020073A4: .word 0x03807E48
	arm_func_end sub_0200734C

	arm_func_start sub_020073A8
sub_020073A8: ; 0x020073A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	ldr r7, _02007590 ; =0x03807E70
	mov sb, #0
	mov r4, #2
	mov r5, #1
	mov r6, sb
	mov sl, #0x54
_020073C8:
	mla r8, sb, sl, r7
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _02007528
	tst r0, #2
	beq _020073F0
	mov r0, sb
	mov r1, r6
	bl sub_02006C08
_020073F0:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #1
	beq _020074CC
	ldrb r0, [r8, #1]
	cmp r0, #0
	beq _02007424
	cmp r0, #1
	beq _0200747C
	cmp r0, #2
	beq _020074A8
	b _02007528
_02007424:
	ldrb r0, [r8, #0x39]
	ldrh ip, [r8, #0x24]
	cmp r0, #0
	ldrh r0, [r8, #0x3e]
	movne r3, r5
	str r0, [sp]
	ldr r2, [r8, #0x40]
	and r1, ip, #0xff
	str r2, [sp, #4]
	str r1, [sp, #8]
	mov r0, ip, asr #8
	str r0, [sp, #0xc]
	ldrh r1, [r8, #0x26]
	moveq r3, r4
	str r1, [sp, #0x10]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp, #0x14]
	ldr r1, [r8, #0x44]
	ldrb r2, [r8, #0x38]
	bl sub_020069EC
	b _02007528
_0200747C:
	ldrh r3, [r8, #0x24]
	ldrh r1, [r8, #0x26]
	mov r0, sb
	str r1, [sp]
	ldrb r1, [r8, #0x23]
	and r2, r3, #0xff
	str r1, [sp, #4]
	ldr r1, [r8, #0x44]
	mov r3, r3, asr #8
	bl sub_02006AB8
	b _02007528
_020074A8:
	ldrh r2, [r8, #0x24]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp]
	ldrh r3, [r8, #0x26]
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_02006B64
	b _02007528
_020074CC:
	tst r0, #4
	beq _020074E0
	ldrh r1, [r8, #0x26]
	mov r0, sb
	bl sub_02006CA8
_020074E0:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #8
	beq _02007508
	ldrh r2, [r8, #0x24]
	mov r0, sb
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_02006C30
_02007508:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #0x10
	beq _02007528
	ldrb r1, [r8, #0x23]
	mov r0, sb
	bl sub_02006CC0
_02007528:
	add sb, sb, #1
	cmp sb, #0x10
	blt _020073C8
	ldr r3, _02007590 ; =0x03807E70
	mov r4, #0
	mov r1, #0x54
_02007540:
	mla r5, r4, r1, r3
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _02007578
	tst r0, #1
	movne r0, r4, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r2, [r0, #0x403]
	orrne r2, r2, #0x80
	strneb r2, [r0, #0x403]
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	strb r0, [r5, #3]
_02007578:
	add r4, r4, #1
	cmp r4, #0x10
	blt _02007540
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02007590: .word 0x03807E70
	arm_func_end sub_020073A8

	arm_func_start sub_02007594
sub_02007594: ; 0x02007594
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, #0x8000
	mov sl, r0
	mov r5, #0
	rsb fp, fp, #0
_020075A8:
	ldr r0, _02007938 ; =0x03807E70
	mov r1, #0x54
	mla r4, r5, r1, r0
	ldrb r2, [r4, #3]
	mov r6, #0
	mov r0, r2, lsl #0x1f
	mov r7, r6
	mov r8, r6
	movs r0, r0, lsr #0x1f
	beq _02007924
	mov r0, r2, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _0200760C
	bic r1, r2, #0xf8
	mov r0, r2, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #1
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r4, #3]
	and r0, r0, #0xff
	bic r0, r0, #2
	strb r0, [r4, #3]
	b _0200765C
_0200760C:
	mov r0, r5
	bl sub_02006D38
	cmp r0, #0
	bne _0200765C
	ldr r3, [r4, #0x48]
	cmp r3, #0
	moveq r0, r6
	streqb r0, [r4, #0x22]
	beq _02007644
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #1
	mov lr, pc
	bx r3
_02007644:
	mov r0, #0
	strh r0, [r4, #0x24]
	ldrb r0, [r4, #3]
	bic r0, r0, #1
	strb r0, [r4, #3]
	b _02007924
_0200765C:
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #8]
	mov r2, r0, lsl #1
	ldr r0, _0200793C ; =0x03806FDC
	ldrsh r2, [r0, r2]
	ldrb r0, [r4, #5]
	add r6, r6, r2
	sub r0, r1, r0
	add r7, r7, r0, lsl #6
	mov r0, r4
	mov r1, sl
	bl sub_02007A14
	ldrsh r3, [r4, #0x32]
	add r6, r6, r0
	cmp r3, #0
	moveq r0, #0
	beq _020076E4
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	cmp r0, r2
	movge r0, #0
	bge _020076E4
	sub r0, r2, r0
	smull r0, r1, r3, r0
	mov r3, r2, asr #0x1f
	bl sub_0200EBB8
	cmp sl, #0
	beq _020076E4
	ldrb r1, [r4, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	ldrne r1, [r4, #0x14]
	addne r1, r1, #1
	strne r1, [r4, #0x14]
_020076E4:
	ldrsh r1, [r4, #0xc]
	add r2, r7, r0
	ldrsh r0, [r4, #6]
	add r1, r6, r1
	add r6, r1, r0
	ldrsh r1, [r4, #0xe]
	add r0, r4, #0x28
	add r7, r2, r1
	bl sub_02007FFC
	mov r1, r0, asr #0x1f
	cmp r1, #0
	mov sb, r0
	cmpeq r0, #0
	beq _02007778
	ldrb r2, [r4, #0x28]
	cmp r2, #0
	beq _02007764
	cmp r2, #1
	beq _02007744
	cmp r2, #2
	moveq r1, r1, lsl #6
	orreq r1, r1, r0, lsr #26
	moveq sb, r0, lsl #6
	b _02007770
_02007744:
	mov r2, #0x3c
	umull sb, r3, r0, r2
	mov r2, #0
	mla r3, r0, r2, r3
	mov r0, #0x3c
	mla r3, r1, r0, r3
	mov r1, r3
	b _02007770
_02007764:
	mov r1, r1, lsl #6
	orr r1, r1, r0, lsr #26
	mov sb, r0, lsl #6
_02007770:
	mov sb, sb, lsr #0xe
	orr sb, sb, r1, lsl #18
_02007778:
	cmp sl, #0
	beq _02007788
	add r0, r4, #0x28
	bl sub_02007F9C
_02007788:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	beq _020077B4
	cmp r0, #1
	beq _020077A8
	cmp r0, #2
	addeq r8, r8, sb
	b _020077B8
_020077A8:
	cmp r6, fp
	addgt r6, r6, sb
	b _020077B8
_020077B4:
	add r7, r7, sb
_020077B8:
	ldrsb r1, [r4, #0xa]
	ldrb r0, [r4, #4]
	add r8, r8, r1
	cmp r0, #0x7f
	mulne r0, r8, r0
	addne r0, r0, #0x40
	movne r8, r0, asr #7
	ldrsb r1, [r4, #0xb]
	ldrb r0, [r4, #2]
	add r8, r8, r1
	cmp r0, #3
	bne _02007844
	ldr r0, _02007940 ; =0xFFFFFD2D
	cmp r6, r0
	bgt _02007844
	ldrb r0, [r4, #3]
	bic r0, r0, #0xf8
	orr r0, r0, #0x10
	strb r0, [r4, #3]
	ldr r3, [r4, #0x48]
	cmp r3, #0
	moveq r0, #0
	streqb r0, [r4, #0x22]
	beq _0200782C
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #1
	mov lr, pc
	bx r3
_0200782C:
	mov r0, #0
	strh r0, [r4, #0x24]
	ldrb r0, [r4, #3]
	bic r0, r0, #1
	strb r0, [r4, #3]
	b _02007924
_02007844:
	mov r0, r6
	bl sub_02006FC0
	mov r6, r0
	ldrh r0, [r4, #0x3c]
	mov r1, r7
	bl sub_02006E94
	ldrb r1, [r4, #1]
	cmp r1, #1
	ldreq r1, _02007944 ; =0x0000FFFC
	andeq r0, r0, r1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	adds r8, r8, #0x40
	movmi r8, #0
	bmi _02007888
	cmp r8, #0x7f
	movgt r8, #0x7f
_02007888:
	ldrh r1, [r4, #0x24]
	cmp r6, r1
	beq _020078BC
	strh r6, [r4, #0x24]
	ldrb r1, [r4, #3]
	bic r2, r1, #0xf8
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x1b
	orr r1, r1, #8
	and r1, r1, #0xff
	mov r1, r1, lsl #0x1b
	orr r1, r2, r1, lsr #24
	strb r1, [r4, #3]
_020078BC:
	ldrh r1, [r4, #0x26]
	cmp r0, r1
	beq _020078F0
	strh r0, [r4, #0x26]
	ldrb r0, [r4, #3]
	bic r1, r0, #0xf8
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #4
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r4, #3]
_020078F0:
	ldrb r0, [r4, #0x23]
	cmp r8, r0
	beq _02007924
	strb r8, [r4, #0x23]
	ldrb r0, [r4, #3]
	bic r1, r0, #0xf8
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #0x10
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r4, #3]
_02007924:
	add r5, r5, #1
	cmp r5, #0x10
	blt _020075A8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02007938: .word 0x03807E70
_0200793C: .word 0x03806FDC
_02007940: .word 0xFFFFFD2D
_02007944: .word 0x0000FFFC
	arm_func_end sub_02007594

	arm_func_start sub_02007948
sub_02007948: ; 0x02007948
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #1]
	mov lr, r2
	add ip, r4, #0x38
	ldmia r1, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	mov r0, r4
	mov r1, r3
	str lr, [r4, #0x44]
	bl sub_020080A0
	mov r0, #1
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02007948

	arm_func_start sub_02007984
sub_02007984: ; 0x02007984
	stmdb sp!, {r3, lr}
	ldrb r3, [r0]
	cmp r3, #8
	movlo r0, #0
	blo _020079C4
	cmp r3, #0xd
	movhi r0, #0
	bhi _020079C4
	mov r3, #1
	strb r3, [r0, #1]
	str r1, [r0, #0x44]
	ldr r3, _020079CC ; =0x00001F46
	mov r1, r2
	strh r3, [r0, #0x3c]
	bl sub_020080A0
	mov r0, #1
_020079C4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020079CC: .word 0x00001F46
	arm_func_end sub_02007984

	arm_func_start sub_020079D0
sub_020079D0: ; 0x020079D0
	stmdb sp!, {r3, lr}
	ldrb r2, [r0]
	cmp r2, #0xe
	movlo r0, #0
	blo _02007A08
	cmp r2, #0xf
	movhi r0, #0
	bhi _02007A08
	ldr r2, _02007A10 ; =0x00001F46
	mov r3, #2
	strb r3, [r0, #1]
	strh r2, [r0, #0x3c]
	bl sub_020080A0
	mov r0, #1
_02007A08:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02007A10: .word 0x00001F46
	arm_func_end sub_020079D0

	arm_func_start sub_02007A14
sub_02007A14: ; 0x02007A14
	cmp r1, #0
	beq _02007AAC
	ldrb r1, [r0, #2]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02007AAC
_02007A2C: ; jump table
	b _02007A3C ; case 0
	b _02007A64 ; case 1
	b _02007AAC ; case 2
	b _02007A9C ; case 3
_02007A3C:
	ldr r2, [r0, #0x10]
	ldrb r1, [r0, #0x1c]
	rsb r2, r2, #0
	mul r1, r2, r1
	mov r1, r1, asr #8
	rsbs r1, r1, #0
	str r1, [r0, #0x10]
	moveq r1, #1
	streqb r1, [r0, #2]
	b _02007AAC
_02007A64:
	ldrb r2, [r0, #0x1d]
	ldr r1, _02007AB8 ; =0x03806FDC
	mov r2, r2, lsl #1
	ldrsh r3, [r1, r2]
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x1e]
	mov ip, r3, lsl #7
	sub r1, r2, r1
	str r1, [r0, #0x10]
	cmp r1, r3, lsl #7
	strle ip, [r0, #0x10]
	movle r1, #2
	strleb r1, [r0, #2]
	b _02007AAC
_02007A9C:
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r0, #0x10]
_02007AAC:
	ldr r0, [r0, #0x10]
	mov r0, r0, asr #7
	bx lr
	.align 2, 0
_02007AB8: .word 0x03806FDC
	arm_func_end sub_02007A14

	arm_func_start sub_02007ABC
sub_02007ABC: ; 0x02007ABC
	cmp r1, #0x6d
	ldrge r2, _02007AD8 ; =0x038071F0
	rsblt r1, r1, #0xff
	rsbge r1, r1, #0x7f
	ldrgeb r1, [r2, r1]
	strb r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_02007AD8: .word 0x038071F0
	arm_func_end sub_02007ABC

	arm_func_start sub_02007ADC
sub_02007ADC: ; 0x02007ADC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_0200804C
	strh r0, [r4, #0x1e]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02007ADC

	arm_func_start sub_02007AF8
sub_02007AF8: ; 0x02007AF8
	strb r1, [r0, #0x1d]
	bx lr
	arm_func_end sub_02007AF8

	arm_func_start sub_02007B00
sub_02007B00: ; 0x02007B00
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_0200804C
	strh r0, [r4, #0x20]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02007B00

	arm_func_start sub_02007B1C
sub_02007B1C: ; 0x02007B1C
	mov r1, #3
	strb r1, [r0, #2]
	bx lr
	arm_func_end sub_02007B1C

	arm_func_start sub_02007B28
sub_02007B28: ; 0x02007B28
	ldrb r0, [r0, #3]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	bx lr
	arm_func_end sub_02007B28

	arm_func_start sub_02007B38
sub_02007B38: ; 0x02007B38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02007CF0 ; =0x03807E48
	mov r6, r1
	ldr r1, [r4, #4]
	mov r5, r3
	mvn r1, r1
	cmp r2, #0
	and r0, r0, r1
	ldreq r1, [r4]
	mov r4, #0
	mvneq r1, r1
	andeq r0, r0, r1
	ldr r3, _02007CF4 ; =0x038071DC
	ldr r8, _02007CF8 ; =0x038071E0
	mov sb, r4
	mvn r1, #0
	mov fp, #1
_02007B7C:
	ldrb ip, [r8, sb]
	tst r0, fp, lsl ip
	beq _02007BFC
	ldr r2, _02007CFC ; =0x03807E70
	mov r7, #0x54
	mla sl, ip, r7, r2
	cmp r4, #0
	moveq r4, sl
	beq _02007BFC
	ldrb r7, [r4, #0x22]
	ldrb r2, [sl, #0x22]
	cmp r2, r7
	bhi _02007BFC
	bne _02007BF8
	ldrh r2, [r4, #0x24]
	ldrh r7, [sl, #0x24]
	mov ip, r2, lsl #0x18
	mov ip, ip, lsr #0x14
	ldrb r2, [r3, r2, asr #8]
	mov lr, r7, lsl #0x18
	mov r2, ip, asr r2
	mov ip, lr, lsr #0x14
	ldrb r7, [r3, r7, asr #8]
	cmp r2, ip, asr r7
	beq _02007BEC
	movlt r2, fp
	movge r2, r1
	b _02007BF0
_02007BEC:
	mov r2, #0
_02007BF0:
	cmp r2, #0
	bge _02007BFC
_02007BF8:
	mov r4, sl
_02007BFC:
	add sb, sb, #1
	cmp sb, #0x10
	blt _02007B7C
	cmp r4, #0
	moveq r0, #0
	beq _02007CE8
	ldrb r0, [r4, #0x22]
	cmp r6, r0
	movlt r0, #0
	blt _02007CE8
	ldr r3, [r4, #0x48]
	cmp r3, #0
	beq _02007C44
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #0
	mov lr, pc
	bx r3
_02007C44:
	ldrb r0, [r4, #3]
	mov r7, #0
	bic r0, r0, #0xf8
	orr r1, r0, #0x10
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r4, #3]
	str r7, [r4, #0x50]
	ldr r0, [sp, #0x28]
	str r5, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r7, [r4, #0x34]
	strb r6, [r4, #0x22]
	mov r3, #0x7f
	strh r3, [r4, #0x24]
	ldrb r1, [r4, #3]
	mov r0, #0x3c
	bic r2, r1, #2
	and r1, r2, #0xff
	orr r1, r1, #4
	strb r1, [r4, #3]
	strb r0, [r4, #8]
	strb r0, [r4, #5]
	strb r3, [r4, #9]
	strb r7, [r4, #0xa]
	strh r7, [r4, #0xc]
	strh r7, [r4, #6]
	strh r7, [r4, #0xe]
	strb r7, [r4, #0xb]
	strb r3, [r4, #4]
	strh r7, [r4, #0x32]
	str r7, [r4, #0x18]
	str r7, [r4, #0x14]
	ldr r1, _02007D00 ; =0x0000FFFF
	strb r7, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	strb r3, [r4, #0x1d]
	add r0, r4, #0x28
	strh r1, [r4, #0x20]
	bl sub_02007F78
	mov r0, r4
_02007CE8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02007CF0: .word 0x03807E48
_02007CF4: .word 0x038071DC
_02007CF8: .word 0x038071E0
_02007CFC: .word 0x03807E70
_02007D00: .word 0x0000FFFF
	arm_func_end sub_02007B38

	arm_func_start sub_02007D04
sub_02007D04: ; 0x02007D04
	cmp r0, #0
	movne r1, #0
	strne r1, [r0, #0x48]
	strne r1, [r0, #0x4c]
	bx lr
	arm_func_end sub_02007D04

	arm_func_start sub_02007D18
sub_02007D18: ; 0x02007D18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	ldr r7, _02007DC0 ; =0x03807E70
	ldr r4, _02007DC4 ; =0x03807E48
	mov sl, r0
	mov r5, sb
	mov r6, #1
	mov fp, #0x54
	b _02007DA8
_02007D3C:
	tst sl, #1
	beq _02007DA0
	ldr r0, [r4, #4]
	mla r8, sb, fp, r7
	tst r0, r6, lsl sb
	bne _02007DA0
	ldr r3, [r8, #0x48]
	cmp r3, #0
	beq _02007D74
	ldr r2, [r8, #0x4c]
	mov r0, r8
	mov r1, #0
	mov lr, pc
	bx r3
_02007D74:
	mov r0, sb
	mov r1, #0
	bl sub_02006C08
	strb r5, [r8, #0x22]
	mov r0, r8
	bl sub_02007D04
	ldrb r0, [r8, #3]
	bic r1, r0, #0xf8
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r8, #3]
_02007DA0:
	add sb, sb, #1
	mov sl, sl, lsr #1
_02007DA8:
	cmp sb, #0x10
	bge _02007DB8
	cmp sl, #0
	bne _02007D3C
_02007DB8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02007DC0: .word 0x03807E70
_02007DC4: .word 0x03807E48
	arm_func_end sub_02007D18
_02007DC8:
	.byte 0xF8, 0x4F, 0x2D, 0xE9, 0x00, 0xA0, 0xA0, 0xE1
	.byte 0x00, 0x80, 0xA0, 0xE3, 0xC4, 0x50, 0x9F, 0xE5, 0x01, 0x90, 0xA0, 0xE1, 0x0A, 0x70, 0xA0, 0xE1
	.byte 0x08, 0xB0, 0xA0, 0xE1, 0x01, 0x40, 0xA0, 0xE3, 0x1D, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x17, 0xE3
	.byte 0x19, 0x00, 0x00, 0x0A, 0xA8, 0x00, 0x9F, 0xE5, 0x04, 0x10, 0x90, 0xE5, 0x54, 0x00, 0xA0, 0xE3
	.byte 0x98, 0x50, 0x26, 0xE0, 0x14, 0x08, 0x11, 0xE1, 0x13, 0x00, 0x00, 0x1A, 0x48, 0x30, 0x96, 0xE5
	.byte 0x00, 0x00, 0x53, 0xE3, 0x04, 0x00, 0x00, 0x0A, 0x4C, 0x20, 0x96, 0xE5, 0x06, 0x00, 0xA0, 0xE1
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x0F, 0xE0, 0xA0, 0xE1, 0x13, 0xFF, 0x2F, 0xE1, 0x08, 0x00, 0xA0, 0xE1
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x73, 0xFB, 0xFF, 0xEB, 0x22, 0xB0, 0xC6, 0xE5, 0x06, 0x00, 0xA0, 0xE1
	.byte 0xAF, 0xFF, 0xFF, 0xEB, 0x03, 0x00, 0xD6, 0xE5, 0xF8, 0x00, 0xC0, 0xE3, 0x03, 0x00, 0xC6, 0xE5
	.byte 0xFF, 0x00, 0x00, 0xE2, 0x01, 0x00, 0xC0, 0xE3, 0x03, 0x00, 0xC6, 0xE5, 0x01, 0x80, 0x88, 0xE2
	.byte 0xA7, 0x70, 0xA0, 0xE1, 0x10, 0x00, 0x58, 0xE3, 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x57, 0xE3
	.byte 0xDD, 0xFF, 0xFF, 0x1A, 0x01, 0x00, 0x19, 0xE3, 0x24, 0x00, 0x9F, 0x15, 0x00, 0x10, 0x90, 0x15
	.byte 0x0A, 0x10, 0x81, 0x11, 0x00, 0x10, 0x80, 0x15, 0x14, 0x00, 0x9F, 0x05, 0x04, 0x10, 0x90, 0x05
	.byte 0x0A, 0x10, 0x81, 0x01, 0x04, 0x10, 0x80, 0x05, 0xF8, 0x4F, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x70, 0x7E, 0x80, 0x03, 0x48, 0x7E, 0x80, 0x03, 0x01, 0x00, 0x11, 0xE3, 0x28, 0x10, 0x9F, 0x05
	.byte 0x00, 0x00, 0xE0, 0x01, 0x04, 0x20, 0x91, 0x05, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00, 0x81, 0x05
	.byte 0x1E, 0xFF, 0x2F, 0x01, 0x10, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0xE0, 0xE1, 0x00, 0x20, 0x91, 0xE5
	.byte 0x00, 0x00, 0x02, 0xE0, 0x00, 0x00, 0x81, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0x48, 0x7E, 0x80, 0x03
	.byte 0x01, 0x00, 0x10, 0xE3, 0x0C, 0x00, 0x9F, 0x15, 0x00, 0x00, 0x90, 0x15, 0x04, 0x00, 0x9F, 0x05
	.byte 0x04, 0x00, 0x90, 0x05, 0x1E, 0xFF, 0x2F, 0xE1, 0x48, 0x7E, 0x80, 0x03, 0xF8, 0x43, 0x2D, 0xE9
	.byte 0x6C, 0x50, 0x9F, 0xE5, 0x00, 0x60, 0xA0, 0xE3, 0x00, 0x80, 0xA0, 0xE1, 0x01, 0x70, 0xA0, 0xE1
	.byte 0x06, 0x40, 0xA0, 0xE1, 0x54, 0x90, 0xA0, 0xE3, 0x96, 0x59, 0x22, 0xE0, 0x03, 0x10, 0xD2, 0xE5
	.byte 0x81, 0x0F, 0xA0, 0xE1, 0xA0, 0x0F, 0xB0, 0xE1, 0x0B, 0x00, 0x00, 0x0A, 0x01, 0x00, 0xD2, 0xE5
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x00, 0x00, 0x1A, 0x44, 0x00, 0x92, 0xE5, 0x00, 0x00, 0x58, 0xE1
	.byte 0x07, 0x00, 0x50, 0x91, 0x04, 0x00, 0x00, 0x8A, 0x02, 0x30, 0xC1, 0xE3, 0x06, 0x00, 0xA0, 0xE1
	.byte 0x04, 0x10, 0xA0, 0xE1, 0x03, 0x30, 0xC2, 0xE5, 0x2A, 0xFB, 0xFF, 0xEB, 0x01, 0x00, 0x86, 0xE2
	.byte 0xFF, 0x60, 0x00, 0xE2, 0x10, 0x00, 0x56, 0xE3, 0xEA, 0xFF, 0xFF, 0x3A, 0xF8, 0x43, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x70, 0x7E, 0x80, 0x03

	arm_func_start sub_02007F78
sub_02007F78: ; 0x02007F78
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #2]
	mov r1, #1
	strb r1, [r0, #3]
	mov r1, #0x10
	strb r1, [r0, #1]
	strh r2, [r0, #4]
	bx lr
	arm_func_end sub_02007F78

	arm_func_start sub_02007F9C
sub_02007F9C: ; 0x02007F9C
	ldrh r2, [r0, #6]
	ldrh r1, [r0, #4]
	cmp r2, r1
	addlo r1, r2, #1
	strloh r1, [r0, #6]
	bxlo lr
	ldrh r1, [r0, #8]
	ldrb r2, [r0, #1]
	add r1, r1, r2, lsl #6
	mov r3, r1, lsr #8
	b _02007FCC
_02007FC8:
	sub r3, r3, #0x80
_02007FCC:
	cmp r3, #0x80
	bhs _02007FC8
	ldrh r1, [r0, #8]
	add r1, r1, r2, lsl #6
	strh r1, [r0, #8]
	ldrh r1, [r0, #8]
	and r1, r1, #0xff
	strh r1, [r0, #8]
	ldrh r1, [r0, #8]
	orr r1, r1, r3, lsl #8
	strh r1, [r0, #8]
	bx lr
	arm_func_end sub_02007F9C

	arm_func_start sub_02007FFC
sub_02007FFC: ; 0x02007FFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #2]
	cmp r0, #0
	moveq r0, #0
	beq _02008044
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #4]
	cmp r1, r0
	movlo r0, #0
	blo _02008044
	ldrh r0, [r4, #8]
	mov r0, r0, lsr #8
	bl sub_02007040
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	mul r0, r1, r0
	mul r0, r2, r0
_02008044:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02007FFC

	arm_func_start sub_0200804C
sub_0200804C: ; 0x0200804C
	stmdb sp!, {r3, lr}
	cmp r0, #0x7f
	ldreq r0, _0200809C ; =0x0000FFFF
	beq _02008094
	cmp r0, #0x7e
	moveq r0, #0x3c00
	beq _02008094
	cmp r0, #0x32
	movlt r0, r0, lsl #1
	addlt r0, r0, #1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _02008094
	rsb r1, r0, #0x7e
	mov r0, #0x1e00
	bl sub_0200EDB0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_02008094:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200809C: .word 0x0000FFFF
	arm_func_end sub_0200804C

	arm_func_start sub_020080A0
sub_020080A0: ; 0x020080A0
	ldr r3, _020080D4 ; =0xFFFE9680
	mov r2, #0
	str r3, [r0, #0x10]
	strb r2, [r0, #2]
	str r1, [r0, #0x34]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	ldrb r1, [r0, #3]
	orr r2, r1, #2
	bic r1, r2, #1
	orr r1, r1, #1
	strb r1, [r0, #3]
	bx lr
	.align 2, 0
_020080D4: .word 0xFFFE9680
	arm_func_end sub_020080A0

	arm_func_start sub_020080D8
sub_020080D8: ; 0x020080D8
	stmdb sp!, {r3, lr}
	ldr r3, _02008134 ; =0x038083B0
	mov lr, #0
	mov r0, #0x24
_020080E8:
	mul r2, lr, r0
	ldrb r1, [r3, r2]
	add ip, r3, r2
	bic r1, r1, #1
	strb r1, [r3, r2]
	strb lr, [ip, #1]
	add lr, lr, #1
	cmp lr, #0x10
	blt _020080E8
	ldr r1, _02008138 ; =0x038085F0
	mov r2, #0
_02008114:
	ldrb r0, [r1, r2, lsl #6]
	bic r0, r0, #1
	strb r0, [r1, r2, lsl #6]
	add r2, r2, #1
	cmp r2, #0x20
	blt _02008114
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02008134: .word 0x038083B0
_02008138: .word 0x038085F0
	arm_func_end sub_020080D8

	arm_func_start sub_0200813C
sub_0200813C: ; 0x0200813C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov sb, r0
	mov r5, r6
_0200814C:
	mov r0, #0x24
	mul r0, r5, r0
	ldr r2, _02008294 ; =0x038083B0
	ldrb r1, [r2, r0]
	add r4, r2, r0
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _02008270
	mov r0, r1, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _0200825C
	cmp sb, #0
	beq _02008228
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _02008228
	mov r8, #0
	b _020081A4
_02008194:
	ldrh r0, [r4, #0x1c]
	add r8, r8, #1
	sub r0, r0, #0xf0
	strh r0, [r4, #0x1c]
_020081A4:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0xf0
	bhs _02008194
	mov r7, #0
	mov sl, #1
	b _020081E0
_020081BC:
	mov r0, r4
	mov r1, sl
	bl sub_02008ED8
	cmp r0, #0
	beq _020081DC
	mov r0, r4
	bl sub_02008CE8
	b _020081E8
_020081DC:
	add r7, r7, #1
_020081E0:
	cmp r7, r8
	blt _020081BC
_020081E8:
	ldr r0, _02008298 ; =0x03807E6C
	ldr r2, [r0]
	cmp r2, #0
	beq _02008210
	ldrb r1, [r4, #1]
	mov r0, #0x24
	mla r2, r1, r0, r2
	ldr r0, [r2, #0x40]
	add r0, r0, r7
	str r0, [r2, #0x40]
_02008210:
	ldrh r2, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r4, #0x1c]
	mul r1, r2, r1
	add r0, r0, r1, asr #8
	strh r0, [r4, #0x1c]
_02008228:
	mov r8, #0
	mov r7, #1
_02008230:
	mov r0, r4
	mov r1, r8
	bl sub_02008C64
	cmp r0, #0
	beq _02008250
	mov r1, r4
	mov r2, r7
	bl sub_02008D80
_02008250:
	add r8, r8, #1
	cmp r8, #0x10
	blt _02008230
_0200825C:
	ldrb r0, [r4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	orrne r6, r6, r0, lsl r5
_02008270:
	add r5, r5, #1
	cmp r5, #0x10
	blt _0200814C
	ldr r0, _02008298 ; =0x03807E6C
	ldr r0, [r0]
	cmp r0, #0
	strne r6, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02008294: .word 0x038083B0
_02008298: .word 0x03807E6C
	arm_func_end sub_0200813C

	arm_func_start sub_0200829C
sub_0200829C: ; 0x0200829C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x24
	mul r5, sb, r0
	ldr r6, _0200846C ; =0x038083B0
	mov r8, r1
	ldrb r0, [r6, r5]
	mov r7, r2
	mov r0, r0, lsl #0x1f
	mov r4, r3
	add r5, r6, r5
	movs r0, r0, lsr #0x1f
	beq _020082D8
	mov r0, r5
	bl sub_02008CE8
_020082D8:
	ldrb r1, [r5]
	mov r0, #0x78
	bic r1, r1, #4
	strb r1, [r5]
	str r4, [r5, #0x20]
	strh r0, [r5, #0x18]
	mov r0, #0x100
	strh r0, [r5, #0x1a]
	mov r0, #0xf0
	strh r0, [r5, #0x1c]
	mov r0, #0x7f
	strb r0, [r5, #5]
	mov r2, #0
	strh r2, [r5, #6]
	mov r0, #0x40
	strb r0, [r5, #4]
	mov r1, #0xff
_0200831C:
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0x10
	blt _0200831C
	ldr r1, _02008470 ; =0x03807E6C
	ldr r3, [r1]
	cmp r3, #0
	beq _0200837C
	ldrb r2, [r5, #1]
	mov r0, #0x24
	mla r0, r2, r0, r3
	mov r6, #0
	str r6, [r0, #0x40]
	mvn r4, #0
	mov r0, #0x24
_0200835C:
	ldr r2, [r1]
	ldrb r3, [r5, #1]
	mla r2, r3, r0, r2
	add r2, r2, r6, lsl #1
	add r6, r6, #1
	strh r4, [r2, #0x20]
	cmp r6, #0x10
	blt _0200835C
_0200837C:
	bl sub_02009A6C
	movs r4, r0
	bmi _02008464
	ldr r0, _02008474 ; =0x038085F0
	add r6, r0, r4, lsl #6
	mov r0, r6
	bl sub_02008AD8
	str r8, [r6, #0x24]
	add r0, r8, r7
	str r0, [r6, #0x28]
	strb r4, [r5, #8]
	ldr r0, [r6, #0x28]
	bl sub_0200896C
	mov r0, r6
	bl sub_02008478
	cmp r0, #0xfe
	ldrne r0, [r6, #0x28]
	subne r0, r0, #1
	strne r0, [r6, #0x28]
	bne _02008430
	mov r0, r6
	bl sub_02008478
	mov r4, r0
	mov r0, r6
	bl sub_02008478
	orr r0, r4, r0, lsl #8
	mov r0, r0, lsl #0x10
	ldr r4, _02008474 ; =0x038085F0
	mov r8, r0, lsr #0x11
	mov r7, #1
	b _02008428
_020083F8:
	tst r8, #1
	beq _0200841C
	bl sub_02009A6C
	movs r6, r0
	bmi _02008430
	add r0, r4, r6, lsl #6
	bl sub_02008AD8
	add r0, r5, r7
	strb r6, [r0, #8]
_0200841C:
	mov r0, r8, lsl #0xf
	add r7, r7, #1
	mov r8, r0, lsr #0x10
_02008428:
	cmp r8, #0
	bne _020083F8
_02008430:
	ldrb r1, [r5]
	ldr r0, _02008470 ; =0x03807E6C
	bic r1, r1, #1
	ldr r2, [r0]
	orr r1, r1, #1
	and r0, r1, #0xff
	bic r0, r0, #2
	strb r0, [r5]
	cmp r2, #0
	ldrne r1, [r2, #4]
	movne r0, #1
	orrne r0, r1, r0, lsl sb
	strne r0, [r2, #4]
_02008464:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200846C: .word 0x038083B0
_02008470: .word 0x03807E6C
_02008474: .word 0x038085F0
	arm_func_end sub_0200829C

	arm_func_start sub_02008478
sub_02008478: ; 0x02008478
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020084D0 ; =0x03807E50
	mov r5, r0
	ldr r4, [r5, #0x28]
	ldr r0, [r1, #4]
	cmp r4, r0
	blo _020084A0
	ldr r0, [r1, #8]
	cmp r4, r0
	blo _020084A8
_020084A0:
	mov r0, r4
	bl sub_0200896C
_020084A8:
	ldr r0, _020084D0 ; =0x03807E50
	ldr r1, [r5, #0x28]
	ldr r2, [r0, #4]
	ldr r0, _020084D4 ; =0x03807E5C
	sub r2, r4, r2
	ldrb r0, [r0, r2]
	add r1, r1, #1
	str r1, [r5, #0x28]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020084D0: .word 0x03807E50
_020084D4: .word 0x03807E5C
	arm_func_end sub_02008478
_020084D8:
	.byte 0x24, 0x10, 0xA0, 0xE3, 0x90, 0x01, 0x01, 0xE0
	.byte 0x0C, 0x20, 0x9F, 0xE5, 0x01, 0x00, 0xD2, 0xE7, 0x02, 0x00, 0x80, 0xE3, 0x01, 0x00, 0xC2, 0xE7
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03, 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x40, 0xA0, 0xE1
	.byte 0x65, 0xFF, 0xFF, 0xEB, 0x24, 0x00, 0xA0, 0xE3, 0x94, 0x00, 0x01, 0xE0, 0x10, 0x20, 0x9F, 0xE5
	.byte 0x01, 0x00, 0xD2, 0xE7, 0x02, 0x00, 0x80, 0xE3, 0x01, 0x00, 0xC2, 0xE7, 0x10, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03, 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x40, 0xA0, 0xE1
	.byte 0x24, 0x00, 0xA0, 0xE3, 0x94, 0x00, 0x01, 0xE0, 0x3C, 0x20, 0x9F, 0xE5, 0x01, 0x00, 0xD2, 0xE7
	.byte 0x80, 0x0F, 0xA0, 0xE1, 0xA0, 0x0F, 0xB0, 0xE1, 0x09, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x82, 0xE0
	.byte 0xE4, 0x01, 0x00, 0xEB, 0x24, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0x52, 0xE3
	.byte 0x01, 0x00, 0xA0, 0x13, 0x04, 0x10, 0x92, 0x15, 0x10, 0x04, 0xE0, 0x11, 0x00, 0x00, 0x01, 0x10
	.byte 0x04, 0x00, 0x82, 0x15, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03
	.byte 0x6C, 0x7E, 0x80, 0x03, 0xF0, 0x41, 0x2D, 0xE9, 0x24, 0x20, 0xA0, 0xE3, 0x90, 0x02, 0x04, 0xE0
	.byte 0x60, 0x50, 0x9F, 0xE5, 0xFF, 0x00, 0x01, 0xE2, 0x04, 0x20, 0xD5, 0xE7, 0x80, 0x0F, 0xA0, 0xE1
	.byte 0x04, 0x20, 0xC2, 0xE3, 0xA0, 0x0E, 0x82, 0xE1, 0x04, 0x00, 0xC5, 0xE7, 0x00, 0x00, 0x51, 0xE3
	.byte 0x0E, 0x00, 0x00, 0x0A, 0x00, 0x80, 0xA0, 0xE3, 0x7F, 0x60, 0xA0, 0xE3, 0x08, 0x10, 0xA0, 0xE1
	.byte 0x04, 0x00, 0x85, 0xE0, 0xA6, 0x01, 0x00, 0xEB, 0x00, 0x70, 0xB0, 0xE1, 0x04, 0x00, 0x00, 0x0A
	.byte 0x06, 0x20, 0xA0, 0xE1, 0x04, 0x10, 0x85, 0xE0, 0x7A, 0x01, 0x00, 0xEB, 0x07, 0x00, 0xA0, 0xE1
	.byte 0x92, 0x01, 0x00, 0xEB, 0x01, 0x80, 0x88, 0xE2, 0x10, 0x00, 0x58, 0xE3, 0xF2, 0xFF, 0xFF, 0xBA
	.byte 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03, 0xF0, 0x41, 0x2D, 0xE9
	.byte 0xB8, 0x30, 0x9F, 0xE5, 0x24, 0x20, 0xA0, 0xE3, 0x90, 0x32, 0x26, 0xE0, 0x01, 0x80, 0xA0, 0xE1
	.byte 0x00, 0x70, 0xA0, 0xE3, 0x7F, 0x40, 0xA0, 0xE3, 0x06, 0x00, 0xA0, 0xE1, 0x07, 0x10, 0xA0, 0xE1
	.byte 0x8F, 0x01, 0x00, 0xEB, 0x00, 0x50, 0xB0, 0xE1, 0x04, 0x00, 0x00, 0x0A, 0x06, 0x10, 0xA0, 0xE1
	.byte 0x04, 0x20, 0xA0, 0xE1, 0x63, 0x01, 0x00, 0xEB, 0x05, 0x00, 0xA0, 0xE1, 0x7B, 0x01, 0x00, 0xEB
	.byte 0x01, 0x70, 0x87, 0xE2, 0x10, 0x00, 0x57, 0xE3, 0xF2, 0xFF, 0xFF, 0xBA, 0xD2, 0xFA, 0xFF, 0xEB
	.byte 0x00, 0x40, 0xA0, 0xE3, 0x04, 0x50, 0xA0, 0xE1, 0x08, 0x00, 0x00, 0xEA, 0x06, 0x00, 0xA0, 0xE1
	.byte 0x05, 0x10, 0xA0, 0xE1, 0x1B, 0x02, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x02, 0x00, 0x00, 0x0A
	.byte 0x06, 0x00, 0xA0, 0xE1, 0x9B, 0x01, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEA, 0x01, 0x40, 0x84, 0xE2
	.byte 0x08, 0x00, 0x54, 0xE1, 0xF4, 0xFF, 0xFF, 0x3A, 0xAF, 0xFA, 0xFF, 0xEB, 0x30, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x30, 0x90, 0xE5, 0x00, 0x00, 0x53, 0xE3, 0x06, 0x00, 0x00, 0x0A, 0x01, 0x10, 0xD6, 0xE5
	.byte 0x24, 0x00, 0xA0, 0xE3, 0x91, 0x00, 0x02, 0xE0, 0x40, 0x10, 0x83, 0xE2, 0x02, 0x00, 0x91, 0xE7
	.byte 0x04, 0x00, 0x80, 0xE0, 0x02, 0x00, 0x81, 0xE7, 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xB0, 0x83, 0x80, 0x03, 0x6C, 0x7E, 0x80, 0x03, 0xF0, 0x41, 0x2D, 0xE9, 0x24, 0x30, 0xA0, 0xE3
	.byte 0x90, 0x03, 0x04, 0xE0, 0x54, 0x50, 0x9F, 0xE5, 0x01, 0x80, 0xA0, 0xE1, 0x02, 0x70, 0xA0, 0xE1
	.byte 0x00, 0x60, 0xA0, 0xE3, 0x0B, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x18, 0xE3, 0x07, 0x00, 0x00, 0x0A
	.byte 0x06, 0x10, 0xA0, 0xE1, 0x04, 0x00, 0x85, 0xE0, 0x59, 0x01, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x00, 0x0A, 0x07, 0x20, 0xA0, 0xE1, 0x04, 0x10, 0x85, 0xE0, 0xE7, 0x04, 0x00, 0xEB
	.byte 0x01, 0x60, 0x86, 0xE2, 0xA8, 0x80, 0xA0, 0xE1, 0x10, 0x00, 0x56, 0xE3, 0x01, 0x00, 0x00, 0xAA
	.byte 0x00, 0x00, 0x58, 0xE3, 0xEF, 0xFF, 0xFF, 0x1A, 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xB0, 0x83, 0x80, 0x03, 0xF0, 0x41, 0x2D, 0xE9, 0x24, 0x30, 0xA0, 0xE3, 0x90, 0x03, 0x04, 0xE0
	.byte 0x02, 0x08, 0xA0, 0xE1, 0x54, 0x50, 0x9F, 0xE5, 0x01, 0x70, 0xA0, 0xE1, 0x00, 0x60, 0xA0, 0xE3
	.byte 0x20, 0x88, 0xA0, 0xE1, 0x0B, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x17, 0xE3, 0x07, 0x00, 0x00, 0x0A
	.byte 0x06, 0x10, 0xA0, 0xE1, 0x04, 0x00, 0x85, 0xE0, 0x3D, 0x01, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0xBE, 0x81, 0xC0, 0x11, 0x00, 0x10, 0xD0, 0x15, 0x80, 0x10, 0x81, 0x13, 0x00, 0x10, 0xC0, 0x15
	.byte 0x01, 0x60, 0x86, 0xE2, 0xA7, 0x70, 0xA0, 0xE1, 0x10, 0x00, 0x56, 0xE3, 0x01, 0x00, 0x00, 0xAA
	.byte 0x00, 0x00, 0x57, 0xE3, 0xEF, 0xFF, 0xFF, 0x1A, 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xB0, 0x83, 0x80, 0x03, 0xF8, 0x4F, 0x2D, 0xE9, 0x7C, 0x60, 0x9F, 0xE5, 0x00, 0x70, 0xA0, 0xE3
	.byte 0x00, 0xA0, 0xA0, 0xE1, 0x01, 0x90, 0xA0, 0xE1, 0x07, 0xB0, 0xA0, 0xE1, 0x24, 0x40, 0xA0, 0xE3
	.byte 0x97, 0x04, 0x05, 0xE0, 0x05, 0x00, 0xD6, 0xE7, 0x80, 0x0F, 0xA0, 0xE1, 0xA0, 0x0F, 0xB0, 0xE1
	.byte 0x10, 0x00, 0x00, 0x0A, 0x0B, 0x80, 0xA0, 0xE1, 0x0C, 0x00, 0x00, 0xEA, 0x08, 0x10, 0xA0, 0xE1
	.byte 0x05, 0x00, 0x86, 0xE0, 0x1E, 0x01, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x06, 0x00, 0x00, 0x0A
	.byte 0x28, 0x00, 0x90, 0xE5, 0x00, 0x00, 0x5A, 0xE1, 0x09, 0x00, 0x50, 0x91, 0x02, 0x00, 0x00, 0x8A
	.byte 0x05, 0x00, 0x86, 0xE0, 0x37, 0x01, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEA, 0x01, 0x80, 0x88, 0xE2
	.byte 0x10, 0x00, 0x58, 0xE3, 0xF0, 0xFF, 0xFF, 0xBA, 0x01, 0x70, 0x87, 0xE2, 0x10, 0x00, 0x57, 0xE3
	.byte 0xE6, 0xFF, 0xFF, 0xBA, 0xF8, 0x4F, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03
	.byte 0xF0, 0x41, 0x2D, 0xE9, 0x4C, 0x40, 0x9F, 0xE5, 0x00, 0x70, 0xA0, 0xE1, 0x01, 0x60, 0xA0, 0xE1
	.byte 0x00, 0x50, 0xA0, 0xE3, 0x24, 0x80, 0xA0, 0xE3, 0x95, 0x08, 0x00, 0xE0, 0x00, 0x10, 0xD4, 0xE7
	.byte 0x00, 0x00, 0x84, 0xE0, 0x81, 0x1F, 0xA0, 0xE1, 0xA1, 0x1F, 0xB0, 0xE1, 0x04, 0x00, 0x00, 0x0A
	.byte 0x20, 0x10, 0x90, 0xE5, 0x01, 0x00, 0x57, 0xE1, 0x06, 0x00, 0x51, 0x91, 0x00, 0x00, 0x00, 0x8A
	.byte 0x1C, 0x01, 0x00, 0xEB, 0x01, 0x50, 0x85, 0xE2, 0x10, 0x00, 0x55, 0xE3, 0xF1, 0xFF, 0xFF, 0xBA
	.byte 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x34, 0xE0, 0x9F, 0xE5, 0x24, 0xC0, 0xA0, 0xE3, 0x90, 0xEC, 0x2C, 0xE0, 0x01, 0x00, 0x53, 0xE3
	.byte 0x04, 0x00, 0x00, 0x0A, 0x02, 0x00, 0x53, 0xE3, 0x04, 0x00, 0x00, 0x0A, 0x04, 0x00, 0x53, 0xE3
	.byte 0x01, 0x20, 0x8C, 0x07, 0x02, 0x00, 0x00, 0xEA, 0x01, 0x20, 0xCC, 0xE7, 0x00, 0x00, 0x00, 0xEA
	.byte 0xB1, 0x20, 0x8C, 0xE1, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03
	.byte 0xF8, 0x4F, 0x2D, 0xE9, 0x24, 0x40, 0xA0, 0xE3, 0x90, 0x04, 0x05, 0xE0, 0x03, 0x80, 0xA0, 0xE1
	.byte 0x08, 0x08, 0xA0, 0xE1, 0x28, 0x70, 0x9D, 0xE5, 0x01, 0xA0, 0xA0, 0xE1, 0x02, 0x90, 0xA0, 0xE1
	.byte 0x00, 0x60, 0xA0, 0xE3, 0x20, 0xB8, 0xA0, 0xE1, 0xFF, 0x40, 0x08, 0xE2, 0x13, 0x00, 0x00, 0xEA
	.byte 0x01, 0x00, 0x1A, 0xE3, 0x0F, 0x00, 0x00, 0x0A, 0x58, 0x00, 0x9F, 0xE5, 0x06, 0x10, 0xA0, 0xE1
	.byte 0x05, 0x00, 0x80, 0xE0, 0xD2, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x09, 0x00, 0x00, 0x0A
	.byte 0x01, 0x00, 0x57, 0xE3, 0x04, 0x00, 0x00, 0x0A, 0x02, 0x00, 0x57, 0xE3, 0x04, 0x00, 0x00, 0x0A
	.byte 0x04, 0x00, 0x57, 0xE3, 0x09, 0x80, 0x80, 0x07, 0x02, 0x00, 0x00, 0xEA, 0x09, 0x40, 0xC0, 0xE7
	.byte 0x00, 0x00, 0x00, 0xEA, 0xB9, 0xB0, 0x80, 0xE1, 0x01, 0x60, 0x86, 0xE2, 0xAA, 0xA0, 0xA0, 0xE1
	.byte 0x10, 0x00, 0x56, 0xE3, 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x5A, 0xE3, 0xE7, 0xFF, 0xFF, 0x1A
	.byte 0xF8, 0x4F, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xB0, 0x83, 0x80, 0x03

	arm_func_start sub_0200896C
sub_0200896C: ; 0x0200896C
	ldr r1, _020089A4 ; =0x03807E50
	bic r2, r0, #3
	str r2, [r1, #4]
	add r0, r2, #0x10
	str r0, [r1, #8]
	ldr r0, [r2]
	str r0, [r1, #0xc]
	ldr r0, [r2, #4]
	str r0, [r1, #0x10]
	ldr r0, [r2, #8]
	str r0, [r1, #0x14]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_020089A4: .word 0x03807E50
	arm_func_end sub_0200896C

	arm_func_start sub_020089A8
sub_020089A8: ; 0x020089A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02008478
	mov r4, r0
	mov r0, r5
	bl sub_02008478
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl sub_02008478
	orr r0, r4, r0, lsl #16
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020089A8

	arm_func_start sub_020089D8
sub_020089D8: ; 0x020089D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _02008ACC
_020089F0: ; jump table
	b _02008A04 ; case 0
	b _02008A10 ; case 1
	b _02008A30 ; case 2
	b _02008A6C ; case 3
	b _02008A50 ; case 4
_02008A04:
	bl sub_02008478
	mov r5, r0
	b _02008ACC
_02008A10:
	bl sub_02008478
	mov r5, r0
	mov r0, r4
	bl sub_02008478
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	b _02008ACC
_02008A30:
	mov r5, #0
_02008A34:
	mov r0, r4
	bl sub_02008478
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _02008A34
	b _02008ACC
_02008A50:
	bl sub_02008478
	mov r1, r0
	mov r0, r6
	bl sub_02009A28
	cmp r0, #0
	ldrnesh r5, [r0]
	b _02008ACC
_02008A6C:
	bl sub_02008478
	mov r5, r0
	mov r0, r4
	bl sub_02008478
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r4
	mov r5, r1, lsl #0x10
	bl sub_02008478
	mov r6, r0
	mov r0, r4
	bl sub_02008478
	orr r0, r6, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl sub_020070AC
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	add r5, r0, r5, asr #16
_02008ACC:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_020089D8

	arm_func_start sub_02008AD8
sub_02008AD8: ; 0x02008AD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	ldrb r1, [r4]
	mov r2, #0xff
	orr r1, r1, #2
	bic ip, r1, #4
	strb r1, [r4]
	and r1, ip, #0xff
	bic r3, r1, #8
	strb ip, [r4]
	and r1, r3, #0xff
	bic ip, r1, #0x10
	strb r3, [r4]
	and r1, ip, #0xff
	bic r3, r1, #0x20
	and r1, r3, #0xff
	orr r1, r1, #0x40
	strb ip, [r4]
	bic r1, r1, #0x80
	strb r1, [r4]
	strb r0, [r4, #0x3b]
	strh r0, [r4, #2]
	mov r1, #0x40
	strb r1, [r4, #0x12]
	mov r1, #0x7f
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strh r0, [r4, #0xa]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #6]
	strh r0, [r4, #0xc]
	strb r2, [r4, #0xe]
	strb r2, [r4, #0xf]
	strb r2, [r4, #0x10]
	strb r2, [r4, #0x11]
	strb r1, [r4, #1]
	mov r1, #2
	strb r1, [r4, #7]
	mov r1, #0x3c
	strb r1, [r4, #0x14]
	strb r0, [r4, #0x15]
	strh r0, [r4, #0x16]
	strb r0, [r4, #0x13]
	add r0, r2, #0xff00
	strh r0, [r4, #0x1e]
	add r0, r4, #0x18
	bl sub_02007F78
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02008AD8

	arm_func_start sub_02008BB8
sub_02008BB8: ; 0x02008BB8
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end sub_02008BB8

	arm_func_start sub_02008BC8
sub_02008BC8: ; 0x02008BC8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl sub_02008D80
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _02008C20
_02008BEC:
	mov r0, r5
	bl sub_02007B28
	cmp r0, #0
	beq _02008C1C
	cmp r7, #0
	blt _02008C10
	mov r0, r5
	mov r1, r6
	bl sub_02007B00
_02008C10:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl sub_02007B1C
_02008C1C:
	ldr r5, [r5, #0x50]
_02008C20:
	cmp r5, #0
	bne _02008BEC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02008BC8

	arm_func_start sub_02008C30
sub_02008C30: ; 0x02008C30
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _02008C4C
_02008C40:
	mov r0, r4
	bl sub_02007D04
	ldr r4, [r4, #0x50]
_02008C4C:
	cmp r4, #0
	bne _02008C40
	mov r0, #0
	str r0, [r5, #0x3c]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02008C30

	arm_func_start sub_02008C64
sub_02008C64: ; 0x02008C64
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _02008C8C ; =0x038085F0
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_02008C8C: .word 0x038085F0
	arm_func_end sub_02008C64

	arm_func_start sub_02008C90
sub_02008C90: ; 0x02008C90
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl sub_02008C64
	movs r5, r0
	beq _02008CDC
	mov r1, r6
	mvn r2, #0
	bl sub_02008BC8
	mov r0, r5
	bl sub_02008C30
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _02008CE4 ; =0x038085F0
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_02008CDC:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02008CE4: .word 0x038085F0
	arm_func_end sub_02008C90

	arm_func_start sub_02008CE8
sub_02008CE8: ; 0x02008CE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_02008CF4:
	mov r0, r5
	mov r1, r4
	bl sub_02008C90
	add r4, r4, #1
	cmp r4, #0x10
	blt _02008CF4
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02008CE8

	arm_func_start sub_02008D20
sub_02008D20: ; 0x02008D20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _02008D40
	mov r1, #0
	strb r1, [r5, #0x22]
	bl sub_02007D04
_02008D40:
	ldr r1, [r4, #0x3c]
	cmp r1, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r4, #0x3c]
	beq _02008D78
	b _02008D6C
_02008D58:
	cmp r0, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r1, #0x50]
	beq _02008D78
	mov r1, r0
_02008D6C:
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _02008D58
_02008D78:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02008D20

	arm_func_start sub_02008D80
sub_02008D80: ; 0x02008D80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #7]
	ldrb r6, [sl, #4]
	ldrb r3, [sl, #5]
	ldrb fp, [r1, #5]
	mov r5, r0, lsl #6
	mov r8, r3, lsl #1
	ldrb r4, [sl, #1]
	ldrsb r7, [sl, #6]
	mov sb, r6, lsl #1
	ldr r0, _02008ED4 ; =0x03806FDC
	mul r6, r7, r5
	mov r3, fp, lsl #1
	ldrsh sb, [r0, sb]
	ldrsh r7, [r0, r8]
	ldrsh r0, [r0, r3]
	add r8, sb, r7
	ldrsb r3, [sl, #8]
	cmp r4, #0x7f
	mulne r4, r3, r4
	addne r3, r4, #0x40
	mov r4, #0x8000
	ldrsh r5, [sl, #0xc]
	mov sb, r2
	add r2, r5, r6, asr #7
	ldrsh r7, [sl, #0xa]
	ldrsh r1, [r1, #6]
	ldrsb r5, [sl, #9]
	movne r3, r3, asr #7
	add r0, r0, r8
	rsb r4, r4, #0
	cmp r0, r4
	movlt r0, r4
	mov r4, #0x8000
	add r1, r7, r1
	rsb r4, r4, #0
	cmp r1, r4
	movlt r1, r4
	add r3, r3, r5
	mvn r4, #0x7f
	cmp r3, r4
	movlt r3, r4
	blt _02008E38
	cmp r3, #0x7f
	movgt r3, #0x7f
_02008E38:
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x18
	mov r1, r1, lsl #0x10
	ldr r8, [sl, #0x3c]
	mov r6, r0, asr #0x10
	mov r5, r2, asr #0x10
	mov r4, r3, asr #0x18
	mov r7, r1, asr #0x10
	mov fp, #1
	b _02008EC4
_02008E64:
	strh r7, [r8, #6]
	ldrb r0, [r8, #2]
	cmp r0, #3
	beq _02008EC0
	strh r6, [r8, #0xc]
	strh r5, [r8, #0xe]
	strb r4, [r8, #0xb]
	ldrb r0, [sl, #1]
	strb r0, [r8, #4]
	ldrh r0, [sl, #0x18]
	strh r0, [r8, #0x28]
	ldrh r0, [sl, #0x1a]
	strh r0, [r8, #0x2a]
	ldrh r0, [sl, #0x1c]
	strh r0, [r8, #0x2c]
	ldr r0, [r8, #0x34]
	cmp r0, #0
	bne _02008EC0
	cmp sb, #0
	beq _02008EC0
	mov r0, r8
	strb fp, [r8, #0x22]
	bl sub_02007B1C
_02008EC0:
	ldr r8, [r8, #0x50]
_02008EC4:
	cmp r8, #0
	bne _02008E64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02008ED4: .word 0x03806FDC
	arm_func_end sub_02008D80

	arm_func_start sub_02008ED8
sub_02008ED8: ; 0x02008ED8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_02008EF4:
	mov r0, r7
	mov r1, sl
	bl sub_02008C64
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	beq _020099F4
	ldr r0, [r8, #0x3c]
	b _02008F50
_02008F18:
	ldr r1, [r0, #0x34]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x34]
	ldrb r1, [r0, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	bne _02008F4C
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #0x14]
_02008F4C:
	ldr r0, [r0, #0x50]
_02008F50:
	cmp r0, #0
	bne _02008F18
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _02008F80
	ldr r0, [r8, #0x3c]
	cmp r0, #0
	movne r0, #0
	bne _020099D8
	bic r0, r1, #0x10
	strb r0, [r8]
_02008F80:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x20]
	cmpgt r0, #0
	movgt r0, #0
	bgt _020099D8
	ldr r0, [r8, #0x28]
	bl sub_0200896C
	ldr r0, _02009A1C ; =0x0000FFFF
	sub fp, r0, #0x10000
	b _020099B8
_02008FB0:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl sub_02008478
	mov r6, r0
	cmp r6, #0xa2
	bne _02008FE4
	mov r0, r8
	bl sub_02008478
	mov r6, r0
	ldrb r0, [r8]
	mov r0, r0, lsl #0x19
	mov r4, r0, lsr #0x1f
_02008FE4:
	cmp r6, #0xa0
	bne _02009000
	mov r0, r8
	bl sub_02008478
	mov r6, r0
	mov r5, #3
	mov sb, #1
_02009000:
	cmp r6, #0xa1
	bne _0200901C
	mov r0, r8
	bl sub_02008478
	mov r6, r0
	mov r5, #4
	mov sb, #1
_0200901C:
	tst r6, #0x80
	bne _020092A0
	mov r0, r8
	bl sub_02008478
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl sub_020089D8
	cmp r4, #0
	mov r4, r0
	ldrsb r0, [r8, #0x13]
	add sb, r6, r0
	beq _020099B8
	cmp sb, #0
	movlt sb, #0
	blt _02009070
	cmp sb, #0x7f
	movgt sb, #0x7f
_02009070:
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _02009274
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02009274
	mov r0, r1, lsl #0x1c
	mov r6, #0
	movs r0, r0, lsr #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strneb sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strneb r0, [r6, #9]
	cmp r6, #0
	bne _020091A4
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl sub_02009B30
	cmp r0, #0
	beq _02009274
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02009274
_020090E0: ; jump table
	b _02009274 ; case 0
	b _020090F4 ; case 1
	b _020090FC ; case 2
	b _02009104 ; case 3
	b _020090F4 ; case 4
_020090F4:
	ldr r1, _02009A1C ; =0x0000FFFF
	b _02009108
_020090FC:
	mov r1, #0x3f00
	b _02009108
_02009104:
	mov r1, #0xc000
_02009108:
	ldrh r0, [r8, #0x1e]
	ldr r3, _02009A20 ; =0x03800B38
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	mov r2, r2, lsl #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	mov r2, r2, lsr #0x1f
	add r1, r6, r1
	bl sub_02007B38
	movs r6, r0
	beq _02009274
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	movne r3, fp
	bne _0200915C
	cmp r4, #0
	movgt r3, r4
	movle r3, fp
_0200915C:
	ldr r2, [sp, #0xc]
	ldr r1, [r7, #0x20]
	mov r0, r6
	str r1, [sp]
	add r1, sp, #0x16
	str r1, [sp, #4]
	mov r1, sb
	bl sub_02009CF0
	cmp r0, #0
	bne _02009198
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl sub_02007D04
	b _02009274
_02009198:
	ldr r0, [r8, #0x3c]
	str r0, [r6, #0x50]
	str r6, [r8, #0x3c]
_020091A4:
	ldrb r1, [r8, #0xe]
	cmp r1, #0xff
	beq _020091B8
	mov r0, r6
	bl sub_02007ABC
_020091B8:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _020091CC
	mov r0, r6
	bl sub_02007ADC
_020091CC:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _020091E0
	mov r0, r6
	bl sub_02007AF8
_020091E0:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _020091F4
	mov r0, r6
	bl sub_02007B00
_020091F4:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _02009224
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	mov r0, r0, lsl #0x16
	add r0, r1, r0, asr #16
	strh r0, [r6, #0x32]
_02009224:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	bne _02009250
	cmp r4, #0
	movgt r0, r4
	movle r0, fp
	str r0, [r6, #0x18]
	ldrb r0, [r6, #3]
	bic r0, r0, #4
	strb r0, [r6, #3]
	b _0200926C
_02009250:
	mul r1, r0, r0
	ldrsh r0, [r6, #0x32]
	cmp r0, #0
	rsblt r0, r0, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xb
	str r0, [r6, #0x18]
_0200926C:
	mov r0, #0
	str r0, [r6, #0x14]
_02009274:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _020099B8
	str r4, [r8, #0x20]
	cmp r4, #0
	ldreqb r0, [r8]
	orreq r0, r0, #0x10
	streqb r0, [r8]
	b _020099B8
_020092A0:
	and r0, r6, #0xf0
	cmp r0, #0xc0
	bgt _020092D4
	bge _0200941C
	cmp r0, #0x90
	bgt _020092C8
	bge _02009340
	cmp r0, #0x80
	beq _020092F8
	b _020099B8
_020092C8:
	cmp r0, #0xb0
	beq _020096CC
	b _020099B8
_020092D4:
	cmp r0, #0xe0
	bgt _020092EC
	bge _02009678
	cmp r0, #0xd0
	beq _0200941C
	b _020099B8
_020092EC:
	cmp r0, #0xf0
	beq _02009914
	b _020099B8
_020092F8:
	cmp sb, #0
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl sub_020089D8
	cmp r4, #0
	beq _020099B8
	cmp r6, #0x80
	beq _0200932C
	cmp r6, #0x81
	beq _02009334
	b _020099B8
_0200932C:
	str r0, [r8, #0x20]
	b _020099B8
_02009334:
	cmp r0, #0x10000
	strlth r0, [r8, #2]
	b _020099B8
_02009340:
	cmp r6, #0x93
	beq _0200935C
	cmp r6, #0x94
	beq _020093BC
	cmp r6, #0x95
	beq _020093D8
	b _020099B8
_0200935C:
	mov r0, r8
	bl sub_02008478
	mov r6, r0
	mov r0, r8
	bl sub_020089A8
	cmp r4, #0
	mov sb, r0
	beq _020099B8
	mov r1, r6
	mov r0, r7
	bl sub_02008C64
	movs r4, r0
	cmpne r4, r8
	beq _020099B8
	mov r1, r7
	mov r2, fp
	bl sub_02008BC8
	mov r0, r4
	bl sub_02008C30
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl sub_02008BB8
	b _020099B8
_020093BC:
	mov r0, r8
	bl sub_020089A8
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _020099B8
_020093D8:
	mov r0, r8
	bl sub_020089A8
	cmp r4, #0
	beq _020099B8
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _020099B8
	add r1, r8, r1, lsl #2
	ldr r2, [r8, #0x28]
	str r2, [r1, #0x2c]
	ldrb r1, [r8, #0x3b]
	add r1, r1, #1
	strb r1, [r8, #0x3b]
	ldr r1, [r8, #0x24]
	add r0, r1, r0
	str r0, [r8, #0x28]
	b _020099B8
_0200941C:
	cmp sb, #0
	movne r2, r5
	moveq r2, #0
	mov r0, r8
	mov r1, r7
	bl sub_020089D8
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _020099B8
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _020099B8
_02009450: ; jump table
	b _02009648 ; case 0
	b _020094B0 ; case 1
	b _020094C8 ; case 2
	b _02009630 ; case 3
	b _0200963C ; case 4
	b _020094D4 ; case 5
	b _020094E0 ; case 6
	b _020094EC ; case 7
	b _020095AC ; case 8
	b _020095F4 ; case 9
	b _02009514 ; case 10
	b _02009520 ; case 11
	b _0200952C ; case 12
	b _02009538 ; case 13
	b _02009614 ; case 14
	b _02009508 ; case 15
	b _02009544 ; case 16
	b _02009550 ; case 17
	b _0200955C ; case 18
	b _02009568 ; case 19
	b _02009574 ; case 20
	b _020094BC ; case 21
	b _02009658 ; case 22
	b _020095E0 ; case 23
_020094B0:
	and r0, r0, #0xff
	strb r0, [r8, #4]
	b _020099B8
_020094BC:
	and r0, r0, #0xff
	strb r0, [r8, #5]
	b _020099B8
_020094C8:
	and r0, r0, #0xff
	strb r0, [r7, #5]
	b _020099B8
_020094D4:
	and r0, r0, #0xff
	strb r0, [r8, #7]
	b _020099B8
_020094E0:
	and r0, r0, #0xff
	strb r0, [r8, #0x12]
	b _020099B8
_020094EC:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #2
	orr r0, r1, r0, lsr #30
	strb r0, [r8]
	b _020099B8
_02009508:
	and r0, r0, #0xff
	strb r0, [r8, #0x15]
	b _020099B8
_02009514:
	and r0, r0, #0xff
	strb r0, [r8, #0x1a]
	b _020099B8
_02009520:
	and r0, r0, #0xff
	strb r0, [r8, #0x19]
	b _020099B8
_0200952C:
	and r0, r0, #0xff
	strb r0, [r8, #0x18]
	b _020099B8
_02009538:
	and r0, r0, #0xff
	strb r0, [r8, #0x1b]
	b _020099B8
_02009544:
	and r0, r0, #0xff
	strb r0, [r8, #0xe]
	b _020099B8
_02009550:
	and r0, r0, #0xff
	strb r0, [r8, #0xf]
	b _020099B8
_0200955C:
	and r0, r0, #0xff
	strb r0, [r8, #0x10]
	b _020099B8
_02009568:
	and r0, r0, #0xff
	strb r0, [r8, #0x11]
	b _020099B8
_02009574:
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _020099B8
	add r2, r8, r1, lsl #2
	and r1, r0, #0xff
	ldr r0, [r8, #0x28]
	str r0, [r2, #0x2c]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0
	strb r1, [r0, #0x38]
	ldrb r0, [r8, #0x3b]
	add r0, r0, #1
	strb r0, [r8, #0x3b]
	b _020099B8
_020095AC:
	and r0, r0, #0xff
	mov r1, r0, lsl #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl sub_02008BC8
	mov r0, r8
	bl sub_02008C30
	b _020099B8
_020095E0:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl sub_02009AB0
	b _020099B8
_020095F4:
	and r1, r0, #0xff
	ldrsb r0, [r8, #0x13]
	add r0, r1, r0
	strb r0, [r8, #0x14]
	ldrb r0, [r8]
	orr r0, r0, #0x20
	strb r0, [r8]
	b _020099B8
_02009614:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #0x20
	orr r0, r1, r0, lsr #26
	strb r0, [r8]
	b _020099B8
_02009630:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #0x13]
	b _020099B8
_0200963C:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #6]
	b _020099B8
_02009648:
	and r0, r0, #0xff
	sub r0, r0, #0x40
	strb r0, [r8, #8]
	b _020099B8
_02009658:
	ldr r1, _02009A24 ; =0x03807E50
	ldr r1, [r1]
	cmp r1, #0
	beq _020099B8
	and r1, r0, #0xff
	mov r0, r7
	bl sub_02009A28
	b _020099B8
_02009678:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl sub_020089D8
	mov r0, r0, lsl #0x10
	cmp r4, #0
	mov r0, r0, asr #0x10
	beq _020099B8
	cmp r6, #0xe0
	beq _020096C4
	cmp r6, #0xe1
	beq _020096BC
	cmp r6, #0xe3
	streqh r0, [r8, #0x16]
	b _020099B8
_020096BC:
	strh r0, [r7, #0x18]
	b _020099B8
_020096C4:
	strh r0, [r8, #0x1c]
	b _020099B8
_020096CC:
	mov r0, r8
	bl sub_02008478
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl sub_020089D8
	mov r0, r0, lsl #0x10
	mov r1, sb
	mov sb, r0, asr #0x10
	mov r0, r7
	bl sub_02009A28
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _020099B8
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _020099B8
_02009724: ; jump table
	b _0200975C ; case 0
	b _02009764 ; case 1
	b _02009774 ; case 2
	b _02009784 ; case 3
	b _02009794 ; case 4
	b _020097B0 ; case 5
	b _020097D4 ; case 6
	b _020099B8 ; case 7
	b _0200980C ; case 8
	b _02009838 ; case 9
	b _02009864 ; case 10
	b _02009890 ; case 11
	b _020098BC ; case 12
	b _020098E8 ; case 13
_0200975C:
	strh sb, [r4]
	b _020099B8
_02009764:
	ldrsh r0, [r4]
	add r0, r0, sb
	strh r0, [r4]
	b _020099B8
_02009774:
	ldrsh r0, [r4]
	sub r0, r0, sb
	strh r0, [r4]
	b _020099B8
_02009784:
	ldrsh r0, [r4]
	mul r1, r0, sb
	strh r1, [r4]
	b _020099B8
_02009794:
	cmp sb, #0
	beq _020099B8
	mov r1, sb
	ldrsh r0, [r4]
	bl sub_0200EDB0
	strh r0, [r4]
	b _020099B8
_020097B0:
	cmp sb, #0
	ldrgesh r0, [r4]
	movge r0, r0, lsl sb
	strgeh r0, [r4]
	ldrltsh r1, [r4]
	rsblt r0, sb, #0
	movlt r0, r1, asr r0
	strlth r0, [r4]
	b _020099B8
_020097D4:
	cmp sb, #0
	rsblt r0, sb, #0
	movlt r0, r0, lsl #0x10
	mov r6, #0
	movlt sb, r0, asr #0x10
	movlt r6, #1
	bl sub_020070AC
	add r1, sb, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	cmp r6, #0
	rsbne r0, r0, #0
	strh r0, [r4]
	b _020099B8
_0200980C:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _020099B8
_02009838:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _020099B8
_02009864:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _020099B8
_02009890:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _020099B8
_020098BC:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _020099B8
_020098E8:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _020099B8
_02009914:
	cmp r4, #0
	beq _020099B8
	sub r0, r6, #0xfc
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020099B8
_0200992C: ; jump table
	b _02009964 ; case 0
	b _0200993C ; case 1
	b _020099B8 ; case 2
	b _020099B0 ; case 3
_0200993C:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _020099B8
	sub r0, r0, #1
	strb r0, [r8, #0x3b]
	and r0, r0, #0xff
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x2c]
	str r0, [r8, #0x28]
	b _020099B8
_02009964:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _020099B8
	add r1, r8, r0
	ldrb r0, [r1, #0x37]
	cmp r0, #0
	beq _02009998
	sub r0, r0, #1
	ands r0, r0, #0xff
	ldreqb r0, [r8, #0x3b]
	subeq r0, r0, #1
	streqb r0, [r8, #0x3b]
	beq _020099B8
_02009998:
	strb r0, [r1, #0x37]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x28]
	str r0, [r8, #0x28]
	b _020099B8
_020099B0:
	mvn r0, #0
	b _020099D8
_020099B8:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	bne _020099D4
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _02008FB0
_020099D4:
	mov r0, #0
_020099D8:
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _020099F4
	mov r0, r7
	mov r1, sl
	bl sub_02008C90
_020099F4:
	add sl, sl, #1
	cmp sl, #0x10
	blt _02008EF4
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02009A1C: .word 0x0000FFFF
_02009A20: .word 0x03800B38
_02009A24: .word 0x03807E50
	arm_func_end sub_02008ED8

	arm_func_start sub_02009A28
sub_02009A28: ; 0x02009A28
	ldr r2, _02009A68 ; =0x03807E6C
	ldr r3, [r2]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r1, #0x10
	addge r2, r3, #0x260
	subge r0, r1, #0x10
	addge r0, r2, r0, lsl #1
	bxge lr
	ldrb r2, [r0, #1]
	add r3, r3, #0x20
	mov r0, #0x24
	mla r0, r2, r0, r3
	add r0, r0, r1, lsl #1
	bx lr
	.align 2, 0
_02009A68: .word 0x03807E6C
	arm_func_end sub_02009A28

	arm_func_start sub_02009A6C
sub_02009A6C: ; 0x02009A6C
	ldr ip, _02009AAC ; =0x038085F0
	mov r0, #0
	b _02009A9C
_02009A78:
	ldrb r1, [ip, r0, lsl #6]
	mov r3, r0, lsl #6
	mov r2, r1, lsl #0x1f
	movs r2, r2, lsr #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	streqb r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_02009A9C:
	cmp r0, #0x20
	blt _02009A78
	mvn r0, #0
	bx lr
	.align 2, 0
_02009AAC: .word 0x038085F0
	arm_func_end sub_02009A6C

	arm_func_start sub_02009AB0
sub_02009AB0: ; 0x02009AB0
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _02009B28
_02009AC4: ; jump table
	b _02009AD4 ; case 0
	b _02009AE4 ; case 1
	b _02009AF4 ; case 2
	b _02009B0C ; case 3
_02009AD4:
	ldrb r0, [r4]
	bic r0, r0, #4
	strb r0, [r4]
	b _02009B28
_02009AE4:
	ldrb r0, [r4]
	orr r0, r0, #4
	strb r0, [r4]
	b _02009B28
_02009AF4:
	ldrb r3, [r4]
	mvn r2, #0
	orr r3, r3, #4
	strb r3, [r4]
	bl sub_02008BC8
	b _02009B28
_02009B0C:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl sub_02008BC8
	mov r0, r4
	bl sub_02008C30
_02009B28:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02009AB0

	arm_func_start sub_02009B30
sub_02009B30: ; 0x02009B30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _02009CA8
	bl sub_020071CC
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _02009B68
	bl sub_020071D0
	mov r0, #0
	b _02009CA8
_02009B68:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	mov r1, r1, lsr #8
	addls pc, pc, r0, lsl #2
	b _02009C94
_02009B88: ; jump table
	b _02009C94 ; case 0
	b _02009BD0 ; case 1
	b _02009BD0 ; case 2
	b _02009BD0 ; case 3
	b _02009BD0 ; case 4
	b _02009BD0 ; case 5
	b _02009C94 ; case 6
	b _02009C94 ; case 7
	b _02009C94 ; case 8
	b _02009C94 ; case 9
	b _02009C94 ; case 10
	b _02009C94 ; case 11
	b _02009C94 ; case 12
	b _02009C94 ; case 13
	b _02009C94 ; case 14
	b _02009C94 ; case 15
	b _02009BF0 ; case 16
	b _02009C40 ; case 17
_02009BD0:
	add r3, r6, r1
	add r2, r4, #2
	mov r1, #5
_02009BDC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02009BDC
	b _02009CA0
_02009BF0:
	ldrb r0, [r6, r1]
	add r2, r6, r1
	ldrb r1, [r2, #1]
	cmp r5, r0
	blt _02009C0C
	cmp r5, r1
	ble _02009C18
_02009C0C:
	bl sub_020071D0
	mov r0, #0
	b _02009CA8
_02009C18:
	sub r1, r5, r0
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #2
	mov r1, #6
_02009C2C:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _02009C2C
	b _02009CA0
_02009C40:
	add r2, r6, r1
	mov r1, #0
	b _02009C64
_02009C4C:
	add r1, r1, #1
	cmp r1, #8
	blt _02009C64
	bl sub_020071D0
	mov r0, #0
	b _02009CA8
_02009C64:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bgt _02009C4C
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #8
	mov r1, #6
_02009C80:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _02009C80
	b _02009CA0
_02009C94:
	bl sub_020071D0
	mov r0, #0
	b _02009CA8
_02009CA0:
	bl sub_020071D0
	mov r0, #1
_02009CA8:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02009B30

	arm_func_start sub_02009CB0
sub_02009CB0: ; 0x02009CB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020071CC
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _02009CDC
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _02009CE0
_02009CDC:
	mov r4, #0
_02009CE0:
	bl sub_020071D0
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02009CB0

	arm_func_start sub_02009CF0
sub_02009CF0: ; 0x02009CF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, [sp, #0x24]
	mov sb, r0
	ldrb r4, [r5, #0xa]
	ldrb r0, [r5]
	cmp r4, #0xff
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mvneq r6, #0
	moveq r4, #0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02009DD0
_02009D28: ; jump table
	b _02009DD0 ; case 0
	b _02009D3C ; case 1
	b _02009DAC ; case 2
	b _02009DC0 ; case 3
	b _02009D3C ; case 4
_02009D3C:
	cmp r0, #1
	bne _02009D80
	ldr r2, [sp, #0x20]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #2]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #0x18]
	cmp r0, #0
	moveq r1, #0
	beq _02009D8C
	ldr r2, [r0, #0x38]
	cmp r1, r2
	movhs r1, #0
	bhs _02009D8C
	bl sub_02009CB0
	mov r1, r0
	b _02009D8C
_02009D80:
	ldrh r1, [r5, #4]
	ldrh r0, [r5, #2]
	orr r1, r0, r1, lsl #16
_02009D8C:
	cmp r1, #0
	moveq r0, #0
	beq _02009DD4
	mov r0, sb
	mov r3, r6
	add r2, r1, #0xc
	bl sub_02007948
	b _02009DD4
_02009DAC:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl sub_02007984
	b _02009DD4
_02009DC0:
	mov r0, sb
	mov r1, r6
	bl sub_020079D0
	b _02009DD4
_02009DD0:
	mov r0, #0
_02009DD4:
	cmp r0, #0
	moveq r0, #0
	beq _02009E30
	strb r8, [sb, #8]
	ldrb r1, [r5, #6]
	mov r0, sb
	strb r1, [sb, #5]
	strb r7, [sb, #9]
	ldrb r1, [r5, #7]
	bl sub_02007ABC
	ldrb r1, [r5, #8]
	mov r0, sb
	bl sub_02007ADC
	ldrb r1, [r5, #9]
	mov r0, sb
	bl sub_02007AF8
	mov r0, sb
	mov r1, r4
	bl sub_02007B00
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_02009E30:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end sub_02009CF0
_02009E38:
	.byte 0x14, 0xC0, 0x9F, 0xE5, 0x24, 0x30, 0xA0, 0xE3
	.byte 0x00, 0xC0, 0x9C, 0xE5, 0x90, 0xC3, 0x23, 0xE0, 0x81, 0x00, 0x83, 0xE0, 0xB0, 0x22, 0xC0, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x6C, 0x7E, 0x80, 0x03, 0x10, 0x20, 0x9F, 0xE5, 0x00, 0x20, 0x92, 0xE5
	.byte 0x80, 0x00, 0x82, 0xE0, 0x02, 0x0C, 0x80, 0xE2, 0xB0, 0x16, 0xC0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x6C, 0x7E, 0x80, 0x03, 0xF8, 0x40, 0x2D, 0xE9, 0x88, 0x00, 0x9F, 0xE5, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x00, 0x00, 0x90, 0xE5, 0x04, 0x50, 0xA0, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x1B, 0x00, 0x00, 0x0A
	.byte 0x04, 0x70, 0xA0, 0xE1, 0x01, 0x60, 0xA0, 0xE3, 0x07, 0x00, 0xA0, 0xE1, 0xA5, 0xF3, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x16, 0x07, 0x84, 0x11, 0x00, 0x08, 0xA0, 0x11, 0x01, 0x70, 0x87, 0xE2
	.byte 0x20, 0x48, 0xA0, 0x11, 0x10, 0x00, 0x57, 0xE3, 0xF6, 0xFF, 0xFF, 0xBA, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x1B, 0xF5, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x85, 0x13, 0x00, 0x08, 0xA0, 0x11
	.byte 0x20, 0x58, 0xA0, 0x11, 0x01, 0x00, 0xA0, 0xE3, 0x15, 0xF5, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x85, 0x13, 0x00, 0x08, 0xA0, 0x11, 0x20, 0x58, 0xA0, 0x11, 0x14, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x10, 0x90, 0xE5, 0xB8, 0x40, 0xC1, 0xE1, 0x00, 0x00, 0x90, 0xE5, 0xBA, 0x50, 0xC0, 0xE1
	.byte 0xF8, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x6C, 0x7E, 0x80, 0x03, 0x20, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x30, 0xA0, 0xE3, 0x03, 0x20, 0xA0, 0xE1, 0x03, 0x03, 0x81, 0xE0, 0x80, 0x2F, 0xC0, 0xE5
	.byte 0x01, 0x30, 0x83, 0xE2, 0x81, 0x2F, 0xC0, 0xE5, 0x08, 0x00, 0x53, 0xE3, 0xF9, 0xFF, 0xFF, 0xBA
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x70, 0x7E, 0x80, 0x03, 0xF0, 0x41, 0x2D, 0xE9, 0x4C, 0xE0, 0x9F, 0xE5
	.byte 0x18, 0x40, 0x9D, 0xE5, 0x00, 0xC3, 0xDE, 0xE7, 0x01, 0x70, 0xA0, 0xE1, 0x02, 0x60, 0xA0, 0xE1
	.byte 0x03, 0x50, 0xA0, 0xE1, 0x00, 0x00, 0x5C, 0xE3, 0x00, 0x83, 0x8E, 0xE0, 0x03, 0x00, 0x00, 0x0A
	.byte 0x14, 0x00, 0x88, 0xE2, 0x0F, 0xEE, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0xC8, 0xE5
	.byte 0x04, 0x70, 0x88, 0xE5, 0x08, 0x60, 0x88, 0xE5, 0x0C, 0x50, 0x88, 0xE5, 0x1C, 0x00, 0x9D, 0xE5
	.byte 0x10, 0x40, 0x88, 0xE5, 0x01, 0x00, 0xC8, 0xE5, 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF0, 0x8D, 0x80, 0x03, 0xF0, 0x43, 0x2D, 0xE9, 0x0C, 0xD0, 0x4D, 0xE2, 0xA4, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x90, 0xA0, 0xE1, 0x09, 0x03, 0xD1, 0xE7, 0x09, 0x83, 0x81, 0xE0, 0x00, 0x00, 0x50, 0xE3
	.byte 0x03, 0x00, 0x00, 0x0A, 0x14, 0x00, 0x88, 0xE2, 0xFA, 0xED, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x00, 0x00, 0xC8, 0xE5, 0x01, 0x10, 0xD8, 0xE5, 0x0C, 0x70, 0x98, 0xE5, 0x10, 0x60, 0x98, 0xE5
	.byte 0x14, 0x00, 0x88, 0xE2, 0x04, 0x50, 0x98, 0xE5, 0x08, 0x40, 0x98, 0xE5, 0x01, 0x94, 0x89, 0xE1
	.byte 0x68, 0xED, 0xFF, 0xEB, 0x00, 0x00, 0x56, 0xE3, 0x00, 0x00, 0x57, 0x03, 0x06, 0x00, 0x00, 0x1A
	.byte 0x54, 0x30, 0x9F, 0xE5, 0x05, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1, 0x14, 0x00, 0x88, 0xE2
	.byte 0x00, 0x90, 0x8D, 0xE5, 0xAE, 0xED, 0xFF, 0xEB, 0x09, 0x00, 0x00, 0xEA, 0xFC, 0xEC, 0xFF, 0xEB
	.byte 0x34, 0x20, 0x9F, 0xE5, 0x00, 0x00, 0x95, 0xE0, 0x04, 0x02, 0x8D, 0xE9, 0x01, 0x20, 0xA4, 0xE0
	.byte 0x00, 0x10, 0xA0, 0xE1, 0x07, 0x30, 0xA0, 0xE1, 0x14, 0x00, 0x88, 0xE2, 0x00, 0x60, 0x8D, 0xE5
	.byte 0xBF, 0xED, 0xFF, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0xC8, 0xE5, 0x0C, 0xD0, 0x8D, 0xE2
	.byte 0xF0, 0x43, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF0, 0x8D, 0x80, 0x03, 0xA8, 0x1E, 0x80, 0x03
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x30, 0x20, 0x9F, 0xE5, 0x00, 0x13, 0xD2, 0xE7, 0x00, 0x43, 0x82, 0xE0
	.byte 0x00, 0x00, 0x51, 0xE3, 0x06, 0x00, 0x00, 0x0A, 0x14, 0x00, 0x84, 0xE2, 0xCD, 0xED, 0xFF, 0xEB
	.byte 0x01, 0x10, 0xD4, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x01, 0x10, 0x81, 0xE2, 0x01, 0x10, 0xC4, 0xE5
	.byte 0x00, 0x00, 0xC4, 0xE5, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF0, 0x8D, 0x80, 0x03
	.byte 0x70, 0x40, 0x2D, 0xE9, 0x00, 0x60, 0xA0, 0xE1, 0x07, 0x50, 0xA0, 0xE3, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x05, 0x00, 0xA0, 0xE1, 0x06, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1, 0x51, 0xF1, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0xF9, 0xFF, 0xFF, 0xBA, 0x70, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0200A0C0
sub_0200A0C0: ; 0x0200A0C0
	stmdb sp!, {r3, lr}
	ldr r0, _0200A0F4 ; =0x03808FF0
	ldr r1, _0200A0F8 ; =0x03809010
	mov r2, #8
	bl sub_02004894
	ldr r1, _0200A0FC ; =0x038025CC
	mov r0, #7
	bl sub_02006584
	ldr r0, _0200A100 ; =0x03807E6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200A0F4: .word 0x03808FF0
_0200A0F8: .word 0x03809010
_0200A0FC: .word 0x038025CC
_0200A100: .word 0x03807E6C
	arm_func_end sub_0200A0C0
_0200A104:
	.byte 0xF0, 0x4F, 0x2D, 0xE9, 0x34, 0xD0, 0x4D, 0xE2, 0x9A, 0x01, 0x00, 0xEA
	.byte 0x88, 0xA6, 0x9F, 0xE5, 0x18, 0x60, 0x9D, 0xE5, 0x01, 0x40, 0x4A, 0xE2, 0x8F, 0x01, 0x00, 0xEA
	.byte 0x1C, 0x50, 0x8D, 0xE2, 0x0F, 0x00, 0xB6, 0xE8, 0x0F, 0x00, 0xA5, 0xE8, 0x03, 0x00, 0x96, 0xE8
	.byte 0x03, 0x00, 0x85, 0xE8, 0x20, 0x00, 0x9D, 0xE5, 0x21, 0x00, 0x50, 0xE3, 0x00, 0xF1, 0x8F, 0x90
	.byte 0x85, 0x01, 0x00, 0xEA, 0x20, 0x00, 0x00, 0xEA, 0x25, 0x00, 0x00, 0xEA, 0x27, 0x00, 0x00, 0xEA
	.byte 0x2C, 0x00, 0x00, 0xEA, 0x2E, 0x00, 0x00, 0xEA, 0x31, 0x00, 0x00, 0xEA, 0x34, 0x00, 0x00, 0xEA
	.byte 0x39, 0x00, 0x00, 0xEA, 0x42, 0x00, 0x00, 0xEA, 0x46, 0x00, 0x00, 0xEA, 0x4A, 0x00, 0x00, 0xEA
	.byte 0x50, 0x00, 0x00, 0xEA, 0x55, 0x00, 0x00, 0xEA, 0x86, 0x00, 0x00, 0xEA, 0xFC, 0x00, 0x00, 0xEA
	.byte 0x1B, 0x01, 0x00, 0xEA, 0x28, 0x01, 0x00, 0xEA, 0xAB, 0x00, 0x00, 0xEA, 0xBC, 0x00, 0x00, 0xEA
	.byte 0xC5, 0x00, 0x00, 0xEA, 0xD4, 0x00, 0x00, 0xEA, 0xE5, 0x00, 0x00, 0xEA, 0x2E, 0x01, 0x00, 0xEA
	.byte 0x30, 0x01, 0x00, 0xEA, 0x32, 0x01, 0x00, 0xEA, 0x34, 0x01, 0x00, 0xEA, 0x39, 0x01, 0x00, 0xEA
	.byte 0x3C, 0x01, 0x00, 0xEA, 0x3F, 0x01, 0x00, 0xEA, 0x4E, 0x01, 0x00, 0xEA, 0x41, 0x01, 0x00, 0xEA
	.byte 0x44, 0x01, 0x00, 0xEA, 0x47, 0x01, 0x00, 0xEA, 0x4E, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5
	.byte 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5, 0x30, 0x30, 0x9D, 0xE5, 0xC5, 0xF8, 0xFF, 0xEB
	.byte 0x5D, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0xCE, 0xF8, 0xFF, 0xEB, 0x5A, 0x01, 0x00, 0xEA
	.byte 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5, 0x30, 0x30, 0x9D, 0xE5
	.byte 0x25, 0xF8, 0xFF, 0xEB, 0x54, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0xB1, 0xF8, 0xFF, 0xEB
	.byte 0x51, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5, 0xD8, 0xF8, 0xFF, 0xEB
	.byte 0x4D, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5, 0xF2, 0xF8, 0xFF, 0xEB
	.byte 0x49, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5
	.byte 0x30, 0x30, 0x9D, 0xE5, 0x90, 0xF9, 0xFF, 0xEB, 0x43, 0x01, 0x00, 0xEA, 0x24, 0x10, 0x9D, 0xE5
	.byte 0x21, 0x0C, 0xA0, 0xE1, 0xFF, 0x00, 0x00, 0xE2, 0x00, 0x00, 0x8D, 0xE5, 0xFF, 0x04, 0xC1, 0xE3
	.byte 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5, 0x30, 0x30, 0x9D, 0xE5, 0x97, 0xF9, 0xFF, 0xEB
	.byte 0x39, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5
	.byte 0x10, 0xF9, 0xFF, 0xEB, 0x34, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0x2C, 0x20, 0x9D, 0xE5, 0x26, 0xF9, 0xFF, 0xEB, 0x2F, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5
	.byte 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5, 0x02, 0x28, 0xA0, 0xE1, 0x42, 0x28, 0xA0, 0xE1
	.byte 0xE0, 0xFE, 0xFF, 0xEB, 0x28, 0x01, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0x01, 0x18, 0xA0, 0xE1, 0x41, 0x18, 0xA0, 0xE1, 0xE2, 0xFE, 0xFF, 0xEB, 0x22, 0x01, 0x00, 0xEA
	.byte 0x2C, 0x70, 0x9D, 0xE5, 0x28, 0x60, 0x9D, 0xE5, 0x24, 0x50, 0x9D, 0xE5, 0x01, 0xEF, 0xFF, 0xEB
	.byte 0x00, 0x80, 0xA0, 0xE1, 0x00, 0x20, 0xA0, 0xE3, 0x07, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x15, 0xE3
	.byte 0x02, 0x02, 0xA0, 0x11, 0x01, 0x03, 0x80, 0x12, 0x03, 0x14, 0xD0, 0x15, 0x01, 0x20, 0x82, 0xE2
	.byte 0x80, 0x10, 0x81, 0x13, 0x03, 0x14, 0xC0, 0x15, 0xA5, 0x50, 0xA0, 0xE1, 0x10, 0x00, 0x52, 0xE3
	.byte 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x55, 0xE3, 0xF3, 0xFF, 0xFF, 0x1A, 0x01, 0x00, 0x16, 0xE3
	.byte 0x08, 0x00, 0x00, 0x0A, 0x02, 0x00, 0x16, 0xE3, 0xB0, 0x10, 0xD4, 0x11, 0x80, 0x00, 0x81, 0x13
	.byte 0x02, 0x09, 0x80, 0x13, 0xB0, 0x00, 0xC4, 0x11, 0x00, 0x00, 0xD4, 0x05, 0x80, 0x00, 0x80, 0x03
	.byte 0x00, 0x00, 0xC4, 0x05, 0x03, 0x00, 0x00, 0xEA, 0x02, 0x00, 0x16, 0xE3, 0x00, 0x00, 0xDA, 0x15
	.byte 0x80, 0x00, 0x80, 0x13, 0x00, 0x00, 0xCA, 0x15, 0x00, 0x50, 0xA0, 0xE3, 0x05, 0x00, 0x00, 0xEA
	.byte 0x01, 0x00, 0x17, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0x05, 0x00, 0xA0, 0xE1, 0x08, 0xFF, 0xFF, 0xEB
	.byte 0x01, 0x50, 0x85, 0xE2, 0xA7, 0x70, 0xA0, 0xE1, 0x08, 0x00, 0x55, 0xE3, 0x01, 0x00, 0x00, 0xAA
	.byte 0x00, 0x00, 0x57, 0xE3, 0xF5, 0xFF, 0xFF, 0x1A, 0x08, 0x00, 0xA0, 0xE1, 0xDA, 0xEE, 0xFF, 0xEB
	.byte 0xB7, 0xFE, 0xFF, 0xEB, 0xF0, 0x00, 0x00, 0xEA, 0x30, 0x90, 0x9D, 0xE5, 0x2C, 0x70, 0x9D, 0xE5
	.byte 0x28, 0x60, 0x9D, 0xE5, 0x24, 0x50, 0x9D, 0xE5, 0xCE, 0xEE, 0xFF, 0xEB, 0x00, 0xB0, 0xA0, 0xE1
	.byte 0x00, 0x80, 0xA0, 0xE3, 0x05, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x17, 0xE3, 0x01, 0x00, 0x00, 0x0A
	.byte 0x08, 0x00, 0xA0, 0xE1, 0x21, 0xFF, 0xFF, 0xEB, 0x01, 0x80, 0x88, 0xE2, 0xA7, 0x70, 0xA0, 0xE1
	.byte 0x08, 0x00, 0x58, 0xE3, 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x57, 0xE3, 0xF5, 0xFF, 0xFF, 0x1A
	.byte 0x00, 0x70, 0xA0, 0xE3, 0x06, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x15, 0xE3, 0x02, 0x00, 0x00, 0x0A
	.byte 0x07, 0x00, 0xA0, 0xE1, 0x09, 0x10, 0xA0, 0xE1, 0x02, 0xF2, 0xFF, 0xEB, 0x01, 0x70, 0x87, 0xE2
	.byte 0xA5, 0x50, 0xA0, 0xE1, 0x10, 0x00, 0x57, 0xE3, 0x01, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x55, 0xE3
	.byte 0xF4, 0xFF, 0xFF, 0x1A, 0x01, 0x00, 0x16, 0xE3, 0x00, 0x00, 0xA0, 0x13, 0x00, 0x00, 0xC4, 0x15
	.byte 0x02, 0x00, 0x16, 0xE3, 0x00, 0x00, 0xA0, 0x13, 0x00, 0x00, 0xCA, 0x15, 0x0B, 0x00, 0xA0, 0xE1
	.byte 0xB1, 0xEE, 0xFF, 0xEB, 0x8E, 0xFE, 0xFF, 0xEB, 0xC7, 0x00, 0x00, 0xEA, 0x2C, 0x10, 0x9D, 0xE5
	.byte 0xA1, 0x0E, 0xA0, 0xE1, 0x01, 0x00, 0x00, 0xE2, 0x00, 0x00, 0x8D, 0xE5, 0x21, 0x0E, 0xA0, 0xE1
	.byte 0x01, 0x00, 0x00, 0xE2, 0x04, 0x00, 0x8D, 0xE5, 0xA1, 0x0D, 0xA0, 0xE1, 0x01, 0x00, 0x00, 0xE2
	.byte 0x08, 0x00, 0x8D, 0xE5, 0xA1, 0x0F, 0xA0, 0xE1, 0x01, 0x00, 0x00, 0xE2, 0x21, 0x1F, 0xA0, 0xE1
	.byte 0x01, 0x10, 0x01, 0xE2, 0x24, 0x20, 0x9D, 0xE5, 0x28, 0x30, 0x9D, 0xE5, 0x98, 0xF3, 0xFF, 0xEB
	.byte 0xB5, 0x00, 0x00, 0xEA, 0x30, 0x00, 0x9D, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x04, 0x00, 0x8D, 0xE5
	.byte 0x2C, 0x30, 0x9D, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0x8D, 0xE5, 0x24, 0x00, 0x9D, 0xE5
	.byte 0x28, 0x10, 0x9D, 0xE5, 0xA3, 0xFE, 0xFF, 0xEB, 0xAB, 0x00, 0x00, 0xEA, 0x28, 0x60, 0x9D, 0xE5
	.byte 0x24, 0x50, 0x9D, 0xE5, 0x00, 0x70, 0xA0, 0xE3, 0x06, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x15, 0xE3
	.byte 0x02, 0x00, 0x00, 0x0A, 0x07, 0x00, 0xA0, 0xE1, 0x06, 0x10, 0xA0, 0xE1, 0xF5, 0xF1, 0xFF, 0xEB
	.byte 0x01, 0x70, 0x87, 0xE2, 0xA5, 0x50, 0xA0, 0xE1, 0x10, 0x00, 0x57, 0xE3, 0x9E, 0x00, 0x00, 0xAA
	.byte 0x00, 0x00, 0x55, 0xE3, 0xF4, 0xFF, 0xFF, 0x1A, 0x9B, 0x00, 0x00, 0xEA, 0x2C, 0x70, 0x9D, 0xE5
	.byte 0x28, 0x60, 0x9D, 0xE5, 0x24, 0x50, 0x9D, 0xE5, 0x00, 0x80, 0xA0, 0xE3, 0x07, 0x00, 0x00, 0xEA
	.byte 0x01, 0x00, 0x15, 0xE3, 0x03, 0x00, 0x00, 0x0A, 0x08, 0x00, 0xA0, 0xE1, 0x06, 0x10, 0xA0, 0xE1
	.byte 0x07, 0x20, 0xA0, 0xE1, 0xC5, 0xF1, 0xFF, 0xEB, 0x01, 0x80, 0x88, 0xE2, 0xA5, 0x50, 0xA0, 0xE1
	.byte 0x10, 0x00, 0x58, 0xE3, 0x8C, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x55, 0xE3, 0xF3, 0xFF, 0xFF, 0x1A
	.byte 0x89, 0x00, 0x00, 0xEA, 0x28, 0x60, 0x9D, 0xE5, 0x24, 0x50, 0x9D, 0xE5, 0x00, 0x70, 0xA0, 0xE3
	.byte 0x06, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x15, 0xE3, 0x02, 0x00, 0x00, 0x0A, 0x07, 0x00, 0xA0, 0xE1
	.byte 0x06, 0x10, 0xA0, 0xE1, 0xD9, 0xF1, 0xFF, 0xEB, 0x01, 0x70, 0x87, 0xE2, 0xA5, 0x50, 0xA0, 0xE1
	.byte 0x10, 0x00, 0x57, 0xE3, 0x7C, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x55, 0xE3, 0xF4, 0xFF, 0xFF, 0x1A
	.byte 0x79, 0x00, 0x00, 0xEA, 0x30, 0x30, 0x9D, 0xE5, 0x24, 0x00, 0x9D, 0xE5, 0x03, 0x18, 0xA0, 0xE1
	.byte 0x2C, 0x20, 0x9D, 0xE5, 0x21, 0x18, 0xA0, 0xE1, 0x00, 0x10, 0x8D, 0xE5, 0x10, 0x12, 0x9F, 0xE5
	.byte 0x01, 0x10, 0x02, 0xE0, 0x04, 0x10, 0x8D, 0xE5, 0x22, 0x1C, 0xA0, 0xE1, 0x7F, 0x10, 0x01, 0xE2
	.byte 0x08, 0x10, 0x8D, 0xE5, 0x22, 0x1B, 0xA0, 0xE1, 0x03, 0x10, 0x01, 0xE2, 0x0C, 0x10, 0x8D, 0xE5
	.byte 0x20, 0x18, 0xA0, 0xE1, 0x01, 0x18, 0xA0, 0xE1, 0x21, 0x18, 0xA0, 0xE1, 0x10, 0x10, 0x8D, 0xE5
	.byte 0x23, 0x18, 0xA0, 0xE1, 0x23, 0x2C, 0xA0, 0xE1, 0x7F, 0x10, 0x01, 0xE2, 0x14, 0x10, 0x8D, 0xE5
	.byte 0x28, 0x10, 0x9D, 0xE5, 0x00, 0x08, 0xA0, 0xE1, 0x23, 0x3D, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x3E, 0x13, 0xC1, 0xE3, 0x03, 0x20, 0x02, 0xE2, 0x03, 0x30, 0x03, 0xE2, 0xFE, 0xF0, 0xFF, 0xEB
	.byte 0x59, 0x00, 0x00, 0xEA, 0x2C, 0x10, 0x9D, 0xE5, 0x28, 0x30, 0x9D, 0xE5, 0x01, 0x04, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0x00, 0x00, 0x8D, 0xE5, 0x7F, 0x00, 0x01, 0xE2, 0x04, 0x00, 0x8D, 0xE5
	.byte 0x24, 0x00, 0x9D, 0xE5, 0x30, 0x10, 0x9D, 0xE5, 0x7F, 0x20, 0x03, 0xE2, 0x23, 0x34, 0xA0, 0xE1
	.byte 0x03, 0x30, 0x03, 0xE2, 0x23, 0xF1, 0xFF, 0xEB, 0x4B, 0x00, 0x00, 0xEA, 0x2C, 0x10, 0x9D, 0xE5
	.byte 0x28, 0x20, 0x9D, 0xE5, 0x7F, 0x00, 0x01, 0xE2, 0x00, 0x00, 0x8D, 0xE5, 0x01, 0x04, 0xA0, 0xE1
	.byte 0x20, 0x38, 0xA0, 0xE1, 0x24, 0x00, 0x9D, 0xE5, 0x7F, 0x10, 0x02, 0xE2, 0x22, 0x24, 0xA0, 0xE1
	.byte 0x03, 0x20, 0x02, 0xE2, 0x42, 0xF1, 0xFF, 0xEB, 0x3F, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5
	.byte 0xD8, 0xF1, 0xFF, 0xEB, 0x3C, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0xCC, 0xF0, 0xFF, 0xEB
	.byte 0x39, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0xB5, 0xF1, 0xFF, 0xEB, 0x36, 0x00, 0x00, 0xEA
	.byte 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5, 0x2C, 0x20, 0x9D, 0xE5, 0x30, 0x30, 0x9D, 0xE5
	.byte 0xC7, 0xF0, 0xFF, 0xEB, 0x30, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0xC8, 0xF5, 0xFF, 0xEB, 0x2C, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0xFC, 0xF5, 0xFF, 0xEB, 0x28, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0x94, 0xF5, 0xFF, 0xEB, 0x24, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0x33, 0xF8, 0xFF, 0xEB, 0x20, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0x52, 0xF8, 0xFF, 0xEB, 0x1C, 0x00, 0x00, 0xEA, 0x24, 0x00, 0x9D, 0xE5, 0x28, 0x10, 0x9D, 0xE5
	.byte 0x01, 0xF6, 0xFF, 0xEB, 0x18, 0x00, 0x00, 0xEA, 0x24, 0x10, 0x9D, 0xE5, 0xA4, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x10, 0x80, 0xE5, 0x14, 0x00, 0x00, 0xEA, 0x24, 0x50, 0x9D, 0xE5, 0x98, 0x00, 0x9F, 0xE5
	.byte 0x05, 0x10, 0xA0, 0xE1, 0x46, 0x2D, 0xA0, 0xE3, 0xAD, 0xEE, 0xFF, 0xEB, 0x88, 0x00, 0x9F, 0xE5
	.byte 0x01, 0x1A, 0x85, 0xE2, 0xC0, 0x01, 0x81, 0xE5, 0x00, 0x60, 0xA0, 0xE3, 0x06, 0x00, 0xA0, 0xE1
	.byte 0xA0, 0xF1, 0xFF, 0xEB, 0x06, 0x11, 0x85, 0xE0, 0x01, 0x1A, 0x81, 0xE2, 0x80, 0x01, 0x81, 0xE5
	.byte 0x01, 0x60, 0x86, 0xE2, 0x10, 0x00, 0x56, 0xE3, 0xF7, 0xFF, 0xFF, 0xBA, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xE2, 0xF5, 0xFF, 0xEB, 0x01, 0x1A, 0x85, 0xE2, 0xC4, 0x01, 0x81, 0xE5, 0x1C, 0x60, 0x9D, 0xE5
	.byte 0x00, 0x00, 0x56, 0xE3, 0x6D, 0xFE, 0xFF, 0x1A, 0x38, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0x90, 0xE5
	.byte 0x00, 0x00, 0x91, 0xE5, 0x01, 0x00, 0x80, 0xE2, 0x00, 0x00, 0x81, 0xE5, 0x2C, 0x00, 0x9F, 0xE5
	.byte 0x18, 0x10, 0x8D, 0xE2, 0x00, 0x20, 0xA0, 0xE3, 0x6E, 0xE8, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x5E, 0xFE, 0xFF, 0x1A, 0x34, 0xD0, 0x8D, 0xE2, 0xF0, 0x4F, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x09, 0x05, 0x00, 0x04, 0xFF, 0xFF, 0x3F, 0x00, 0x6C, 0x7E, 0x80, 0x03, 0x70, 0x7E, 0x80, 0x03
	.byte 0xF0, 0x8F, 0x80, 0x03, 0x38, 0x40, 0x2D, 0xE9, 0x01, 0x50, 0xA0, 0xE1, 0xC9, 0xED, 0xFF, 0xEB
	.byte 0x00, 0x40, 0xA0, 0xE1, 0x02, 0x04, 0x55, 0xE3, 0x04, 0x00, 0x00, 0x3A, 0x28, 0x00, 0x9F, 0xE5
	.byte 0x05, 0x10, 0xA0, 0xE1, 0x00, 0x20, 0xA0, 0xE3, 0x37, 0xE8, 0xFF, 0xEB, 0x02, 0x00, 0x00, 0xEA
	.byte 0x00, 0x00, 0x55, 0xE3, 0x00, 0x00, 0x00, 0x1A, 0x70, 0xF2, 0xFF, 0xEB, 0x04, 0x00, 0xA0, 0xE1
	.byte 0xC1, 0xED, 0xFF, 0xEB, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF0, 0x8F, 0x80, 0x03
	.byte 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1, 0x68, 0x31, 0x80, 0x03

	arm_func_start sub_0200A80C
sub_0200A80C: ; 0x0200A80C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _0200A8B0 ; =0x03809060
	mov r2, #0
	mvn r1, #2
	str r1, [r4, #0xc]
	mov r0, #4
	str r0, [r4, #0xf0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x1c]
	str r2, [r4]
	str r2, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x14]
	str r2, [r4, #0xf8]
	str r2, [r4, #0xf4]
	mov r0, #0x400
	str r0, [sp]
	ldr ip, [r4, #0xf0]
	ldr r1, _0200A8B4 ; =0x038032B8
	ldr r3, _0200A8B8 ; =0x03809660
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl sub_0200423C
	add r0, r4, #0x48
	bl sub_02004554
	ldr r1, _0200A8BC ; =0x038031D4
	mov r0, #0xb
	bl sub_02006584
	ldr r0, _0200A8C0 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _0200A8C4 ; =0x03809040
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200A8B0: .word 0x03809060
_0200A8B4: .word 0x038032B8
_0200A8B8: .word 0x03809660
_0200A8BC: .word 0x038031D4
_0200A8C0: .word 0x027FFC40
_0200A8C4: .word 0x03809040
	arm_func_end sub_0200A80C

	arm_func_start sub_0200A8C8
sub_0200A8C8: ; 0x0200A8C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _0200A904 ; =0x03809060
	mov r7, r0
	bl sub_02005EE8
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl sub_020045A8
	mov r0, r4
	bl sub_02005EFC
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200A904: .word 0x03809060
	arm_func_end sub_0200A8C8

	arm_func_start sub_0200A908
sub_0200A908: ; 0x0200A908
	ldr r0, _0200A910 ; =0x027FFA80
	bx lr
	.align 2, 0
_0200A910: .word 0x027FFA80
	arm_func_end sub_0200A908

	arm_func_start sub_0200A914
sub_0200A914: ; 0x0200A914
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _0200A9AC
	cmp r5, #0
	beq _0200A934
	bl sub_02004650
_0200A934:
	cmp r4, #0
	beq _0200A988
	sub r7, r4, r5
	mov r4, #0
	mov r5, #1
	mov r6, #5
	b _0200A968
_0200A950:
	cmp r7, #5
	movlt r8, r7
	movge r8, r6
	mov r0, r8
	bl sub_02004650
	sub r7, r7, r8
_0200A968:
	bl sub_0200A9B8
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _0200A988
	cmp r7, #0
	bgt _0200A950
_0200A988:
	bl sub_0200A9B8
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _0200A9B4 ; =0x03809060
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_0200A9AC:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0200A9B4: .word 0x03809060
	arm_func_end sub_0200A914

	arm_func_start sub_0200A9B8
sub_0200A9B8: ; 0x0200A9B8
	stmdb sp!, {r3, lr}
	ldr ip, _0200A9FC ; =0x03809660
	mov lr, #2
	ldr r0, _0200AA00 ; =0x0380720C
	ldr r3, _0200AA04 ; =0x03802924
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl sub_0200AA48
	ldr r3, _0200AA08 ; =0x038028E4
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl sub_0200AA48
	ldrb r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200A9FC: .word 0x03809660
_0200AA00: .word 0x0380720C
_0200AA04: .word 0x03802924
_0200AA08: .word 0x038028E4
	arm_func_end sub_0200A9B8

	arm_func_start sub_0200AA0C
sub_0200AA0C: ; 0x0200AA0C
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl sub_0200A914
	ldr r0, _0200AA44 ; =0x03809060
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #4
	moveq r0, #6
	streq r0, [r1]
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200AA44: .word 0x03809060
	arm_func_end sub_0200AA0C

	arm_func_start sub_0200AA48
sub_0200AA48: ; 0x0200AA48
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _0200AAC0 ; =0x03809664
	ldr r8, _0200AAC4 ; =0x0000A040
	ldr r4, _0200AAC8 ; =0x040001A0
	stmib r5, {r0, r1}
	strh r8, [r4]
	mov r7, r2
	mov r6, r3
	mov r8, #0xa000
	b _0200AA9C
_0200AA70:
	ldr r0, [r5]
	subs r0, r0, #1
	str r0, [r5]
	streqh r8, [r4]
_0200AA80:
	ldrh r0, [r4]
	tst r0, #0x80
	bne _0200AA80
	mov r0, r5
	mov lr, pc
	bx r6
_0200AA98:
	.byte 0x01, 0x70, 0x47, 0xE2
_0200AA9C:
	cmp r7, #0
	bne _0200AA70
	ldr r0, [r5]
	cmp r0, #0
	ldreq r0, _0200AAC8 ; =0x040001A0
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0200AAC0: .word 0x03809664
_0200AAC4: .word 0x0000A040
_0200AAC8: .word 0x040001A0
	arm_func_end sub_0200AA48
_0200AACC:
	.byte 0x34, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x20, 0xA0, 0xE3, 0xB0, 0x20, 0xC1, 0xE1, 0x02, 0x20, 0x41, 0xE2, 0xB0, 0x10, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x11, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x18, 0x20, 0x9F, 0xE5, 0x08, 0x10, 0x90, 0xE5
	.byte 0xB0, 0x20, 0xD2, 0xE1, 0x00, 0x20, 0xC1, 0xE5, 0x08, 0x10, 0x90, 0xE5, 0x01, 0x10, 0x81, 0xE2
	.byte 0x08, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0xA2, 0x01, 0x00, 0x04, 0x08, 0x00, 0x2D, 0xE9
	.byte 0x04, 0xD0, 0x4D, 0xE2, 0x04, 0x10, 0x90, 0xE5, 0x38, 0x20, 0x9F, 0xE5, 0x00, 0x10, 0xD1, 0xE5
	.byte 0xB0, 0x10, 0xC2, 0xE1, 0x04, 0x10, 0x90, 0xE5, 0x01, 0x10, 0x81, 0xE2, 0x04, 0x10, 0x80, 0xE5
	.byte 0x02, 0x10, 0x42, 0xE2, 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A
	.byte 0x10, 0x00, 0x9F, 0xE5, 0xB0, 0x00, 0xD0, 0xE1, 0xB0, 0x00, 0xCD, 0xE1, 0x04, 0xD0, 0x8D, 0xE2
	.byte 0x08, 0x00, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xA2, 0x01, 0x00, 0x04, 0x58, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x20, 0xA0, 0xE3, 0xB0, 0x20, 0xC1, 0xE1, 0x02, 0x20, 0x41, 0xE2, 0xB0, 0x10, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x11, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x3C, 0x20, 0x9F, 0xE5, 0x04, 0x10, 0x90, 0xE5
	.byte 0xB0, 0x20, 0xD2, 0xE1, 0x00, 0x10, 0xD1, 0xE5, 0xFF, 0x20, 0x02, 0xE2, 0x01, 0x00, 0x52, 0xE1
	.byte 0x05, 0x00, 0x00, 0x0A, 0x00, 0x10, 0xA0, 0xE3, 0x0C, 0x10, 0x80, 0xE5, 0x00, 0x10, 0x90, 0xE5
	.byte 0x01, 0x00, 0x51, 0xE3, 0x01, 0x10, 0xA0, 0x83, 0x00, 0x10, 0x80, 0x85, 0x04, 0x10, 0x90, 0xE5
	.byte 0x01, 0x10, 0x81, 0xE2, 0x04, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0xA2, 0x01, 0x00, 0x04

	arm_func_start sub_0200ABC0
sub_0200ABC0: ; 0x0200ABC0
	stmdb sp!, {r3, lr}
	ldr ip, _0200ABE8 ; =0x03809660
	mov r2, #1
	ldr r0, _0200ABEC ; =0x03807204
	ldr r3, _0200ABF0 ; =0x03802924
	mov r1, #0
	str r2, [ip, #4]
	bl sub_0200AA48
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200ABE8: .word 0x03809660
_0200ABEC: .word 0x03807204
_0200ABF0: .word 0x03802924
	arm_func_end sub_0200ABC0

	arm_func_start sub_0200ABF4
sub_0200ABF4: ; 0x0200ABF4
	stmdb sp!, {r3, lr}
	ldr r2, _0200AC8C ; =0x03809060
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	cmp r2, #1
	beq _0200AC20
	cmp r2, #2
	beq _0200AC3C
	cmp r2, #3
	beq _0200AC54
	b _0200AC70
_0200AC20:
	mov r3, r0, lsr #5
	and r3, r3, #8
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _0200AC70
_0200AC3C:
	and r3, r0, #0xff00
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _0200AC70
_0200AC54:
	mov r3, r0, lsr #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_0200AC70:
	ldr r3, _0200AC90 ; =0x03802924
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl sub_0200AA48
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200AC8C: .word 0x03809060
_0200AC90: .word 0x03802924
	arm_func_end sub_0200ABF4

	arm_func_start sub_0200AC94
sub_0200AC94: ; 0x0200AC94
	stmdb sp!, {r4, lr}
	ldr r0, _0200ACE4 ; =0x03809060
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _0200ACDC
	ldr r0, _0200ACE8 ; =0x03809660
	ldr r0, [r0]
	cmp r0, #0
	bne _0200ACDC
	bl sub_0200A9B8
	cmp r4, r0
	beq _0200ACD0
	mov r0, r4
	bl sub_0200B0EC
_0200ACD0:
	ldr r0, _0200ACE8 ; =0x03809660
	mov r1, #1
	str r1, [r0]
_0200ACDC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200ACE4: .word 0x03809060
_0200ACE8: .word 0x03809660
	arm_func_end sub_0200AC94

	arm_func_start sub_0200ACEC
sub_0200ACEC: ; 0x0200ACEC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200AD44
	ldr r0, _0200AD4C ; =0x03809060
	ldr r2, _0200AD50 ; =0x03809660
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl sub_0200ABF4
	ldr r3, _0200AD54 ; =0x038028E4
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl sub_0200AA48
_0200AD44:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0200AD4C: .word 0x03809060
_0200AD50: .word 0x03809660
_0200AD54: .word 0x038028E4
	arm_func_end sub_0200ACEC

	arm_func_start sub_0200AD58
sub_0200AD58: ; 0x0200AD58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200ADFC
	ldr r0, _0200AE04 ; =0x03809060
	ldr fp, _0200AE08 ; =0x03809660
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _0200ADF4
_0200AD8C:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl sub_0200ABC0
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl sub_0200ABF4
	ldr r3, _0200AE0C ; =0x03802924
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl sub_0200AA48
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl sub_0200A914
	ldr r0, [r5]
	cmp r0, #0
	bne _0200ADFC
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_0200ADF4:
	cmp r8, #0
	bne _0200AD8C
_0200ADFC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200AE04: .word 0x03809060
_0200AE08: .word 0x03809660
_0200AE0C: .word 0x03802924
	arm_func_end sub_0200AD58

	arm_func_start sub_0200AE10
sub_0200AE10: ; 0x0200AE10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200AEB4
	ldr r0, _0200AEBC ; =0x03809060
	ldr fp, _0200AEC0 ; =0x03809660
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _0200AEAC
_0200AE44:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl sub_0200ABC0
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl sub_0200ABF4
	ldr r3, _0200AEC4 ; =0x03802924
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl sub_0200AA48
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl sub_0200A914
	ldr r0, [r5]
	cmp r0, #0
	bne _0200AEB4
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_0200AEAC:
	cmp r8, #0
	bne _0200AE44
_0200AEB4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200AEBC: .word 0x03809060
_0200AEC0: .word 0x03809660
_0200AEC4: .word 0x03802924
	arm_func_end sub_0200AE10

	arm_func_start sub_0200AEC8
sub_0200AEC8: ; 0x0200AEC8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200AF44
	ldr r0, _0200AF4C ; =0x03809060
	ldr r2, _0200AF50 ; =0x03809660
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl sub_0200ABF4
	ldr r3, _0200AF54 ; =0x03802974
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl sub_0200AA48
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _0200AF50 ; =0x03809660
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_0200AF44:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200AF4C: .word 0x03809060
_0200AF50: .word 0x03809660
_0200AF54: .word 0x03802974
	arm_func_end sub_0200AEC8

	arm_func_start sub_0200AF58
sub_0200AF58: ; 0x0200AF58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0200AFEC ; =0x03809060
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x1c]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _0200AFE4
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200AFE4
	ldr r8, _0200AFF0 ; =0x03809660
	mov sb, #0xd8
	b _0200AFDC
_0200AFA0:
	bl sub_0200ABC0
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl sub_0200ABF4
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl sub_0200A914
	ldr r0, [r4]
	cmp r0, #0
	bne _0200AFE4
	add r7, r7, r5
	sub r6, r6, r5
_0200AFDC:
	cmp r6, #0
	bne _0200AFA0
_0200AFE4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200AFEC: .word 0x03809060
_0200AFF0: .word 0x03809660
	arm_func_end sub_0200AF58

	arm_func_start sub_0200AFF4
sub_0200AFF4: ; 0x0200AFF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0200B088 ; =0x03809060
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x20]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _0200B080
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200B080
	ldr r8, _0200B08C ; =0x03809660
	mov sb, #0x20
	b _0200B078
_0200B03C:
	bl sub_0200ABC0
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl sub_0200ABF4
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl sub_0200A914
	ldr r0, [r4]
	cmp r0, #0
	bne _0200B080
	add r7, r7, r5
	sub r6, r6, r5
_0200B078:
	cmp r6, #0
	bne _0200B03C
_0200B080:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200B088: .word 0x03809060
_0200B08C: .word 0x03809660
	arm_func_end sub_0200AFF4

	arm_func_start sub_0200B090
sub_0200B090: ; 0x0200B090
	stmdb sp!, {r4, lr}
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200B0D4
	ldr r0, _0200B0DC ; =0x03809060
	ldr r4, [r0]
	bl sub_0200ABC0
	ldr r1, _0200B0E0 ; =0x03809660
	mov r2, #1
	ldr r0, _0200B0E4 ; =0x03807208
	ldr r3, _0200B0E8 ; =0x03802924
	str r2, [r1, #4]
	mov r1, #0
	bl sub_0200AA48
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl sub_0200A914
_0200B0D4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200B0DC: .word 0x03809060
_0200B0E0: .word 0x03809660
_0200B0E4: .word 0x03807208
_0200B0E8: .word 0x03802924
	arm_func_end sub_0200B090

	arm_func_start sub_0200B0EC
sub_0200B0EC: ; 0x0200B0EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl sub_0200AA0C
	cmp r0, #0
	beq _0200B170
	ldr r0, _0200B178 ; =0x03809060
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _0200B17C ; =0x03802924
	ldr r4, _0200B180 ; =0x03809660
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_0200B130:
	bl sub_0200ABC0
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl sub_0200AA48
	mov r0, fp
	mov r1, #0
	bl sub_0200A914
	ldr r0, [sb]
	cmp r0, #4
	bne _0200B170
	sub sl, sl, #1
	cmp sl, #0
	bgt _0200B130
_0200B170:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200B178: .word 0x03809060
_0200B17C: .word 0x03802924
_0200B180: .word 0x03809660
	arm_func_end sub_0200B0EC

	arm_func_start sub_0200B184
sub_0200B184: ; 0x0200B184
	ldr r3, _0200B1DC ; =0x040001A4
_0200B188:
	ldr r2, [r3]
	tst r2, #0x80000000
	bne _0200B188
	ldr r3, _0200B1E0 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_0200B1DC: .word 0x040001A4
_0200B1E0: .word 0x040001A1
	arm_func_end sub_0200B184

	arm_func_start sub_0200B1E4
sub_0200B1E4: ; 0x0200B1E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0200B254 ; =0x03809060
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl sub_02005EE8
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl sub_020044CC
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _0200B230
	add r0, r4, #0x48
	bl sub_02004554
_0200B230:
	mov r0, r5
	bl sub_02005EFC
	cmp r7, #0
	beq _0200B24C
	mov r0, r6
	mov lr, pc
	bx r7
_0200B24C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200B254: .word 0x03809060
	arm_func_end sub_0200B1E4

	arm_func_start sub_0200B258
sub_0200B258: ; 0x0200B258
	ldr r1, _0200B274 ; =0x03807560
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_0200B274: .word 0x03807560
	arm_func_end sub_0200B258
_0200B278:
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0200B27C
sub_0200B27C: ; 0x0200B27C
	stmdb sp!, {r3, lr}
	mov r0, #0xb8000000
	mov r1, #0
	bl sub_0200B184
	mov r0, #0x7000000
	bl sub_0200B258
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _0200B2C4 ; =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_0200B2A8:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _0200B2A8
	ldr r0, _0200B2C8 ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200B2C4: .word 0x040001A4
_0200B2C8: .word 0x04100010
	arm_func_end sub_0200B27C

	arm_func_start sub_0200B2CC
sub_0200B2CC: ; 0x0200B2CC
	stmdb sp!, {r4, lr}
	ldr r0, _0200B2F8 ; =0x03809060
	mov r1, #0
	mov r2, r1
	bl sub_0200B2FC
	bl sub_0200B27C
	mov r4, r0
	bl sub_0200B1E4
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200B2F8: .word 0x03809060
	arm_func_end sub_0200B2CC

	arm_func_start sub_0200B2FC
sub_0200B2FC: ; 0x0200B2FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02005EE8
	mov r4, r0
	b _0200B320
_0200B318:
	add r0, r7, #0xf4
	bl sub_02004478
_0200B320:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _0200B318
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_0200B2FC

	arm_func_start sub_0200B350
sub_0200B350: ; 0x0200B350
	stmdb sp!, {r3, lr}
	ldr ip, _0200B3B0 ; =0x03809060
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _0200B3A8
	ldr r0, _0200B3B4 ; =0x03809680
	mov r2, #0
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0xfc]
	str r2, [ip, #0x28]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r1, [ip, #0x2c]
	str r2, [ip, #0x3c]
	str r2, [ip, #0x40]
	str r2, [r0]
	bl sub_0200A80C
	ldr r1, _0200B3B8 ; =0x03803090
	ldr r0, _0200B3B4 ; =0x03809680
	str r1, [r0, #0x20]
	bl sub_0200B6D4
_0200B3A8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200B3B0: .word 0x03809060
_0200B3B4: .word 0x03809680
_0200B3B8: .word 0x03803090
	arm_func_end sub_0200B350

	arm_func_start sub_0200B3BC
sub_0200B3BC: ; 0x0200B3BC
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	bne _0200B494
	cmp r2, #0
	beq _0200B494
	ldr r0, _0200B49C ; =0x03809060
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _0200B460
_0200B3F0: ; jump table
	b _0200B430 ; case 0
	b _0200B460 ; case 1
	b _0200B454 ; case 2
	b _0200B454 ; case 3
	b _0200B454 ; case 4
	b _0200B454 ; case 5
	b _0200B454 ; case 6
	b _0200B454 ; case 7
	b _0200B454 ; case 8
	b _0200B454 ; case 9
	b _0200B454 ; case 10
	b _0200B454 ; case 11
	b _0200B454 ; case 12
	b _0200B454 ; case 13
	b _0200B454 ; case 14
	b _0200B454 ; case 15
_0200B430:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _0200B460
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _0200B460
_0200B454:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_0200B460:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _0200B494
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl sub_02004554
_0200B494:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200B49C: .word 0x03809060
	arm_func_end sub_0200B3BC

	arm_func_start sub_0200B4A0
sub_0200B4A0: ; 0x0200B4A0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _0200B6D0 ; =0x03809060
_0200B4A8:
	mov r5, #0
	bl sub_02005EE8
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_0200B4BC:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _0200B4F4
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _0200B500
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _0200B510
_0200B4F4:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _0200B510
_0200B500:
	mov r0, r7
	str r8, [r4, #0xec]
	bl sub_02004478
	b _0200B4BC
_0200B510:
	mov r0, r6
	bl sub_02005EFC
	cmp r5, #0
	beq _0200B6BC
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x58]
	mov r0, #1
	tst r1, r0, lsl r2
	moveq r0, #3
	streq r0, [r3]
	beq _0200B660
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _0200B658
_0200B558: ; jump table
	b _0200B660 ; case 0
	b _0200B660 ; case 1
	b _0200B598 ; case 2
	b _0200B5A0 ; case 3
	b _0200B5B0 ; case 4
	b _0200B658 ; case 5
	b _0200B5BC ; case 6
	b _0200B5D0 ; case 7
	b _0200B5E4 ; case 8
	b _0200B5F8 ; case 9
	b _0200B658 ; case 10
	b _0200B60C ; case 11
	b _0200B62C ; case 12
	b _0200B634 ; case 13
	b _0200B648 ; case 14
	b _0200B61C ; case 15
_0200B598:
	bl sub_0200AC94
	b _0200B660
_0200B5A0:
	bl sub_0200B27C
	ldr r1, [r4]
	str r0, [r1, #8]
	b _0200B660
_0200B5B0:
	mov r0, #3
	str r0, [r3]
	b _0200B660
_0200B5BC:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl sub_0200ACEC
	b _0200B660
_0200B5D0:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_0200AE10
	b _0200B660
_0200B5E4:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_0200AD58
	b _0200B660
_0200B5F8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_0200AEC8
	b _0200B660
_0200B60C:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl sub_0200AF58
	b _0200B660
_0200B61C:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl sub_0200AFF4
	b _0200B660
_0200B62C:
	bl sub_0200B090
	b _0200B660
_0200B634:
	bl sub_0200A9B8
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _0200B660
_0200B648:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl sub_0200B0EC
	b _0200B660
_0200B658:
	mov r0, #3
	str r0, [r3]
_0200B660:
	mov r6, #0xb
	mov r5, #1
_0200B668:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl sub_020065F8
	cmp r0, #0
	blt _0200B668
	bl sub_02005EE8
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl sub_020044CC
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _0200B6B0
	add r0, r4, #0x48
	bl sub_02004554
_0200B6B0:
	mov r0, r5
	bl sub_02005EFC
	b _0200B4A8
_0200B6BC:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
_0200B6CC:
	.byte 0x75, 0xFF, 0xFF, 0xEA
_0200B6D0: .word 0x03809060
	arm_func_end sub_0200B4A0

	arm_func_start sub_0200B6D4
sub_0200B6D4: ; 0x0200B6D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0200B724 ; =0x038098C0
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0200B71C
	mov r1, #1
	str r1, [r0, #8]
	bl sub_0200649C
	mov r5, #0xe
	mov r4, #0
_0200B6FC:
	mov r0, r5
	mov r1, r4
	bl sub_020065D4
	cmp r0, #0
	beq _0200B6FC
	ldr r1, _0200B728 ; =0x03803544
	mov r0, #0xe
	bl sub_02006584
_0200B71C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200B724: .word 0x038098C0
_0200B728: .word 0x03803544
	arm_func_end sub_0200B6D4

	arm_func_start sub_0200B72C
sub_0200B72C: ; 0x0200B72C
	stmdb sp!, {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0200B784
	mov r0, #0
	bl sub_020060DC
	mov r0, #1
	bl sub_020060DC
	mov r0, #2
	bl sub_020060DC
	mov r0, #3
	bl sub_020060DC
	mov r0, #0
	bl sub_0200E7F8
	bl sub_02005EE8
	mov r4, r0
	bl sub_020068F0
	bl sub_0200D474
	mov r0, r4
	bl sub_02005EFC
	bl sub_02006058
	b _0200B788
_0200B784:
	bl sub_02006058
_0200B788:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0200B72C

	arm_func_start sub_0200B790
sub_0200B790: ; 0x0200B790
	stmdb sp!, {r3, lr}
	ldr r0, _0200B7D0 ; =0x038098C0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0200B7C0
	ldr r0, _0200B7D4 ; =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _0200B7BC
	bl sub_0200B7D8
	b _0200B7C0
_0200B7BC:
	bl sub_0200B878
_0200B7C0:
	ldr r0, _0200B7D0 ; =0x038098C0
	ldr r0, [r0, #0xc]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200B7D0: .word 0x038098C0
_0200B7D4: .word 0x027FFE1F
	arm_func_end sub_0200B790

	arm_func_start sub_0200B7D8
sub_0200B7D8: ; 0x0200B7D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl sub_02003DE4
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _0200B850
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02003DB4
	cmp r0, #0
	bne _0200B844
	ldr r1, _0200B870 ; =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl sub_0200B2CC
	ldr r1, [sp]
	cmp r0, r1
	mov r0, r4, lsl #0x10
	moveq r5, #1
	mov r0, r0, lsr #0x10
	movne r5, #0
	bl sub_02003D94
_0200B844:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02003E8C
_0200B850:
	ldr r1, _0200B874 ; =0x038098C0
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200B870: .word 0x027FFC10
_0200B874: .word 0x038098C0
	arm_func_end sub_0200B7D8

	arm_func_start sub_0200B878
sub_0200B878: ; 0x0200B878
	ldr r0, _0200B89C ; =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _0200B8A0 ; =0x038098C0
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_0200B89C: .word 0x04000214
_0200B8A0: .word 0x038098C0
	arm_func_end sub_0200B878

	arm_func_start sub_0200B8A4
sub_0200B8A4: ; 0x0200B8A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200B990 ; =0x038098C0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0200B988
	ldr r2, _0200B994 ; =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _0200B988
	ldr r1, _0200B998 ; =0x03807564
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _0200B988
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _0200B988
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl sub_0200B790
	cmp r0, #0
	beq _0200B938
	ldr r0, _0200B990 ; =0x038098C0
	mov r1, #1
	str r1, [r0, #4]
	bl sub_0200A908
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0200B938
	ldr r0, _0200B998 ; =0x03807564
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0200B988
_0200B938:
	ldr r0, _0200B990 ; =0x038098C0
	ldr r1, _0200B998 ; =0x03807564
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _0200B988
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _0200B970
_0200B968:
	mov r0, r7
	bl sub_02003BF4
_0200B970:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	bne _0200B968
_0200B988:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200B990: .word 0x038098C0
_0200B994: .word 0x027FFC40
_0200B998: .word 0x03807564
	arm_func_end sub_0200B8A4
_0200B99C:
	.byte 0x00, 0xDF, 0x70, 0x47
	.byte 0x03, 0xDF, 0x70, 0x47, 0x02, 0x4A, 0x94, 0x46, 0x00, 0x22, 0x04, 0xDF, 0x70, 0x47, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x04, 0x00, 0x22, 0x05, 0xDF, 0x70, 0x47, 0x06, 0xDF, 0x70, 0x47, 0x07, 0xDF
	.byte 0x70, 0x47, 0x08, 0xDF, 0x70, 0x47, 0x01, 0x1C, 0x01, 0x20, 0x08, 0xDF, 0x70, 0x47, 0x01, 0x1C
	.byte 0x00, 0x20, 0x08, 0xDF, 0x70, 0x47, 0x09, 0xDF, 0x70, 0x47, 0x09, 0xDF, 0x08, 0x1C, 0x70, 0x47
	.byte 0x0B, 0xDF, 0x70, 0x47, 0x0C, 0xDF, 0x70, 0x47, 0x0D, 0xDF, 0x70, 0x47, 0x0E, 0xDF, 0x70, 0x47
	.byte 0x0F, 0xDF, 0x70, 0x47, 0x10, 0xDF, 0x70, 0x47, 0x11, 0xDF, 0x70, 0x47, 0x12, 0xDF, 0x70, 0x47
	.byte 0x13, 0xDF, 0x70, 0x47, 0x14, 0xDF, 0x70, 0x47, 0x15, 0xDF, 0x70, 0x47, 0x1A, 0xDF, 0x70, 0x47
	.byte 0x1B, 0xDF, 0x70, 0x47, 0x1C, 0xDF, 0x70, 0x47, 0x30, 0x10, 0x9F, 0xE5, 0x30, 0x20, 0x9F, 0xE5
	.byte 0xA0, 0x10, 0x01, 0xE0, 0x01, 0x10, 0x40, 0xE0, 0x28, 0x00, 0x9F, 0xE5, 0x02, 0x30, 0x01, 0xE0
	.byte 0x21, 0x11, 0x02, 0xE0, 0x01, 0x10, 0x83, 0xE0, 0x21, 0x12, 0x81, 0xE0, 0x00, 0x00, 0x01, 0xE0
	.byte 0x20, 0x04, 0x80, 0xE0, 0x20, 0x08, 0x80, 0xE0, 0xFF, 0x00, 0x00, 0xE2, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x55, 0x55, 0x55, 0x55, 0x33, 0x33, 0x33, 0x33, 0x0F, 0x0F, 0x0F, 0x0F, 0xF8, 0x43, 0x2D, 0xE9
	.byte 0x08, 0xD0, 0x4D, 0xE2, 0xEC, 0x10, 0x9F, 0xE5, 0x00, 0x40, 0xA0, 0xE1, 0xB0, 0x00, 0xD1, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x34, 0x00, 0x00, 0x1A, 0x01, 0x00, 0xA0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x04, 0x00, 0x81, 0xE5, 0x05, 0x00, 0xA0, 0xE3, 0x08, 0x00, 0x81, 0xE5
	.byte 0x28, 0x01, 0x00, 0xEB, 0xBE, 0xC5, 0xBF, 0xEB, 0xAA, 0x06, 0x00, 0xEB, 0xFA, 0x03, 0x00, 0xEB
	.byte 0x7D, 0xEA, 0xFF, 0xEB, 0xB0, 0x10, 0x9F, 0xE5, 0x06, 0x00, 0xA0, 0xE3, 0xB4, 0xEA, 0xFF, 0xEB
	.byte 0xA4, 0x10, 0x9F, 0xE5, 0x09, 0x00, 0xA0, 0xE3, 0xB1, 0xEA, 0xFF, 0xEB, 0x98, 0x10, 0x9F, 0xE5
	.byte 0x08, 0x00, 0xA0, 0xE3, 0xAE, 0xEA, 0xFF, 0xEB, 0x8C, 0x10, 0x9F, 0xE5, 0x04, 0x00, 0xA0, 0xE3
	.byte 0xAB, 0xEA, 0xFF, 0xEB, 0x84, 0x00, 0x9F, 0xE5, 0x84, 0x10, 0x9F, 0xE5, 0x10, 0x20, 0xA0, 0xE3
	.byte 0x6B, 0xE3, 0xFF, 0xEB, 0x00, 0x90, 0xA0, 0xE3, 0x18, 0x60, 0xA0, 0xE3, 0x74, 0x80, 0x9F, 0xE5
	.byte 0x09, 0x70, 0xA0, 0xE1, 0x06, 0x50, 0xA0, 0xE1, 0x99, 0x85, 0x20, 0xE0, 0x07, 0x10, 0xA0, 0xE1
	.byte 0x06, 0x20, 0xA0, 0xE1, 0xD3, 0xE9, 0xFF, 0xEB, 0x01, 0x90, 0x89, 0xE2, 0x10, 0x00, 0x59, 0xE3
	.byte 0xF8, 0xFF, 0xFF, 0xBA, 0x3C, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x90, 0x24, 0x80, 0xE5
	.byte 0x98, 0x24, 0x80, 0xE5, 0x94, 0x24, 0x80, 0xE5, 0x02, 0x0C, 0xA0, 0xE3, 0x00, 0x00, 0x8D, 0xE5
	.byte 0x34, 0x00, 0x9F, 0xE5, 0x34, 0x10, 0x9F, 0xE5, 0x20, 0x30, 0x9F, 0xE5, 0x04, 0x40, 0x8D, 0xE5
	.byte 0xBD, 0xE1, 0xFF, 0xEB, 0x20, 0x00, 0x9F, 0xE5, 0x81, 0xE2, 0xFF, 0xEB, 0x08, 0xD0, 0x8D, 0xE2
	.byte 0xF8, 0x43, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xD0, 0x98, 0x80, 0x03, 0xE8, 0x3C, 0x80, 0x03
	.byte 0x80, 0x9B, 0x80, 0x03, 0xA0, 0x9B, 0x80, 0x03, 0xE0, 0x9B, 0x80, 0x03, 0xDC, 0x98, 0x80, 0x03
	.byte 0x7C, 0x3C, 0x80, 0x03, 0x70, 0x40, 0x2D, 0xE9, 0x48, 0x50, 0x9F, 0xE5, 0x48, 0x40, 0x9F, 0xE5
	.byte 0x00, 0x60, 0xA0, 0xE1, 0xD7, 0xE8, 0xFF, 0xEB, 0x04, 0x10, 0x94, 0xE5, 0x00, 0x00, 0x51, 0xE3
	.byte 0x03, 0x00, 0x00, 0x0A, 0xD8, 0xE8, 0xFF, 0xEB, 0x05, 0x00, 0xA0, 0xE1, 0x35, 0xE2, 0xFF, 0xEB
	.byte 0xF7, 0xFF, 0xFF, 0xEA, 0x20, 0x10, 0x9F, 0xE5, 0x01, 0x20, 0xA0, 0xE3, 0x04, 0x20, 0x81, 0xE5
	.byte 0x04, 0x20, 0xA0, 0xE3, 0x08, 0x20, 0x81, 0xE5, 0x9C, 0x64, 0x81, 0xE5, 0xCE, 0xE8, 0xFF, 0xEB
	.byte 0x70, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x64, 0x9D, 0x80, 0x03, 0xD0, 0x98, 0x80, 0x03
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x4C, 0x10, 0x9F, 0xE5, 0x04, 0x20, 0x91, 0xE5, 0x00, 0x00, 0x52, 0xE3
	.byte 0x0E, 0x00, 0x00, 0x0A, 0x08, 0x20, 0x91, 0xE5, 0x04, 0x00, 0x52, 0xE3, 0x9C, 0x14, 0x91, 0x05
	.byte 0x00, 0x00, 0x51, 0x01, 0x09, 0x00, 0x00, 0x1A, 0xBA, 0xE8, 0xFF, 0xEB, 0x24, 0x10, 0x9F, 0xE5
	.byte 0x05, 0x20, 0xA0, 0xE3, 0x08, 0x20, 0x81, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x04, 0x20, 0x81, 0xE5
	.byte 0x9C, 0x24, 0x81, 0xE5, 0xB8, 0xE8, 0xFF, 0xEB, 0x0C, 0x00, 0x9F, 0xE5, 0x2A, 0xE2, 0xFF, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xD0, 0x98, 0x80, 0x03, 0x64, 0x9D, 0x80, 0x03

	arm_func_start sub_0200BC30
sub_0200BC30: ; 0x0200BC30
	stmdb sp!, {r4, r5, r6, lr}
	and r2, r0, #0x70
	cmp r2, #0x30
	bgt _0200BC68
	bge _0200BCB4
	cmp r2, #0x10
	bgt _0200BC5C
	bge _0200BC9C
	cmp r2, #0
	beq _0200BC9C
	b _0200BCB8
_0200BC5C:
	cmp r2, #0x20
	beq _0200BCB4
	b _0200BCB8
_0200BC68:
	cmp r2, #0x50
	bgt _0200BC80
	bge _0200BCA4
	cmp r2, #0x40
	beq _0200BCA4
	b _0200BCB8
_0200BC80:
	cmp r2, #0x60
	bgt _0200BC90
	beq _0200BCAC
	b _0200BCB8
_0200BC90:
	cmp r2, #0x70
	beq _0200BCAC
	b _0200BCB8
_0200BC9C:
	mov r4, #6
	b _0200BCB8
_0200BCA4:
	mov r4, #9
	b _0200BCB8
_0200BCAC:
	mov r4, #8
	b _0200BCB8
_0200BCB4:
	mov r4, #4
_0200BCB8:
	and r0, r0, #0xff
	orr r0, r0, #0x80
	mov r0, r0, lsl #8
	orr r2, r0, #0x3000000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #0
_0200BCD4:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_020065F8
	cmp r0, #0
	blt _0200BCD4
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0200BC30

	arm_func_start sub_0200BCF4
sub_0200BCF4: ; 0x0200BCF4
	ldr r0, _0200BD0C ; =0x038098D0
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0200BD0C: .word 0x038098D0
	arm_func_end sub_0200BCF4

	arm_func_start sub_0200BD10
sub_0200BD10: ; 0x0200BD10
	ldr r1, _0200BD24 ; =0x038098D0
	mov r2, #1
	str r2, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0200BD24: .word 0x038098D0
	arm_func_end sub_0200BD10

	arm_func_start sub_0200BD28
sub_0200BD28: ; 0x0200BD28
	stmdb sp!, {r3, lr}
	ldr r1, _0200BD5C ; =0x038098D0
	ldr r2, [r1, #8]
	cmp r2, r0
	bne _0200BD54
	ldr r0, _0200BD60 ; =0x03809D64
	mov r2, #5
	str r2, [r1, #8]
	mov r2, #0
	str r2, [r1, #4]
	bl sub_020044CC
_0200BD54:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200BD5C: .word 0x038098D0
_0200BD60: .word 0x03809D64
	arm_func_end sub_0200BD28

	arm_func_start sub_0200BD64
sub_0200BD64: ; 0x0200BD64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r2, [sp, #0x18]
	mov r5, r0
	cmp r2, #4
	mov r4, r1
	movhi r0, #0
	bhi _0200BE24
	bl sub_02005EE8
	ldr r3, _0200BE30 ; =0x038098D0
	add r2, sp, #0x18
	ldr ip, [r3, #0x490]
	mov r1, #0x18
	mul r6, ip, r1
	ldr lr, _0200BE34 ; =0x03809BE0
	ldr ip, _0200BE38 ; =0x03809BE4
	str r5, [lr, r6]
	ldr r5, [r3, #0x490]
	bic r2, r2, #3
	mul lr, r5, r1
	str r4, [ip, lr]
	add r6, r2, #4
	ldrh r1, [sp, #0x18]
	ldr r5, _0200BE3C ; =0x038098D4
	mov lr, #0
	mov r2, #0x18
	b _0200BDEC
_0200BDD0:
	ldr ip, [r3, #0x490]
	add r6, r6, #4
	mla r4, ip, r2, r5
	add r4, r4, lr, lsl #2
	ldr ip, [r6, #-4]
	add lr, lr, #1
	str ip, [r4, #0x314]
_0200BDEC:
	cmp lr, r1
	blt _0200BDD0
	ldr r1, _0200BE30 ; =0x038098D0
	ldr r4, [r1, #0x490]
	add r2, r4, #1
	and r2, r2, #0xf
	str r2, [r1, #0x490]
	bl sub_02005EFC
	ldr r1, _0200BE34 ; =0x03809BE0
	mov r0, #0x18
	mla r1, r4, r0, r1
	ldr r0, _0200BE40 ; =0x03809B80
	mov r2, #0
	bl sub_020048BC
_0200BE24:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0200BE30: .word 0x038098D0
_0200BE34: .word 0x03809BE0
_0200BE38: .word 0x03809BE4
_0200BE3C: .word 0x038098D4
_0200BE40: .word 0x03809B80
	arm_func_end sub_0200BD64
_0200BE44:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x10, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0x8D, 0xE2
	.byte 0x00, 0x20, 0xA0, 0xE3, 0xE2, 0xE2, 0xFF, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x80, 0x9B, 0x80, 0x03, 0x78, 0x40, 0x2D, 0xE9, 0x04, 0xD0, 0x4D, 0xE2, 0x58, 0x60, 0x9F, 0xE5
	.byte 0x00, 0x50, 0x8D, 0xE2, 0x01, 0x40, 0xA0, 0xE3, 0x06, 0x00, 0xA0, 0xE1, 0x05, 0x10, 0xA0, 0xE1
	.byte 0x04, 0x20, 0xA0, 0xE1, 0xAF, 0xE2, 0xFF, 0xEB, 0x00, 0x00, 0x9D, 0xE5, 0x00, 0x10, 0x90, 0xE5
	.byte 0x03, 0x00, 0x51, 0xE3, 0x01, 0xF1, 0x8F, 0x90, 0xF6, 0xFF, 0xFF, 0xEA, 0x02, 0x00, 0x00, 0xEA
	.byte 0x07, 0x00, 0x00, 0xEA, 0x02, 0x00, 0x00, 0xEA, 0x03, 0x00, 0x00, 0xEA, 0xDF, 0x00, 0x00, 0xEB
	.byte 0xF0, 0xFF, 0xFF, 0xEA, 0x90, 0x06, 0x00, 0xEB, 0xEE, 0xFF, 0xFF, 0xEA, 0x70, 0x03, 0x00, 0xEB
	.byte 0xEC, 0xFF, 0xFF, 0xEA, 0x26, 0xC5, 0xBF, 0xEB, 0xEA, 0xFF, 0xFF, 0xEA, 0x80, 0x9B, 0x80, 0x03
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0x52, 0xE3, 0x14, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x40, 0xE2
	.byte 0x05, 0x00, 0x50, 0xE3, 0x00, 0xF1, 0x8F, 0x90, 0x10, 0x00, 0x00, 0xEA, 0x0D, 0x00, 0x00, 0xEA
	.byte 0x0E, 0x00, 0x00, 0xEA, 0x02, 0x00, 0x00, 0xEA, 0x0C, 0x00, 0x00, 0xEA, 0x06, 0x00, 0x00, 0xEA
	.byte 0x02, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE1, 0x4E, 0x00, 0x00, 0xEB, 0x07, 0x00, 0x00, 0xEA
	.byte 0x01, 0x00, 0xA0, 0xE1, 0x9D, 0x05, 0x00, 0xEB, 0x04, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE1
	.byte 0xE8, 0x02, 0x00, 0xEB, 0x01, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE1, 0xA2, 0xC4, 0xBF, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0200BF38
sub_0200BF38: ; 0x0200BF38
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _0200C004 ; =0x03809D70
	mov r3, #0
	str r3, [r0, #0x24]
	mov r1, #0x14
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	ldr r0, _0200C008 ; =0x03809D74
	mov r2, r3
_0200BF5C:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0200BF5C
	bl sub_02005980
	cmp r0, #0
	bne _0200BF80
	bl sub_02005934
_0200BF80:
	ldr r7, _0200C00C ; =0x03809DA0
	ldr r5, _0200C010 ; =0x54505641
	mov r8, #0
	mov r4, #0x28
_0200BF90:
	mul r6, r8, r4
	add r0, r7, r6
	bl sub_02005A6C
	mov r1, r5
	add r0, r7, r6
	bl sub_02005BFC
	add r8, r8, #1
	cmp r8, #4
	blt _0200BF90
	ldr r2, _0200C014 ; =0x040001C0
_0200BFB8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0200BFB8
	ldr r1, _0200C018 ; =0x00008A01
	ldr r0, _0200C01C ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_0200BFDC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200BFDC
	bl sub_0200C024
	ldr r1, _0200C020 ; =0x00008201
	ldr r0, _0200C014 ; =0x040001C0
	strh r1, [r0]
	bl sub_0200C024
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0200C004: .word 0x03809D70
_0200C008: .word 0x03809D74
_0200C00C: .word 0x03809DA0
_0200C010: .word 0x54505641
_0200C014: .word 0x040001C0
_0200C018: .word 0x00008A01
_0200C01C: .word 0x040001C2
_0200C020: .word 0x00008201
	arm_func_end sub_0200BF38

	arm_func_start sub_0200C024
sub_0200C024: ; 0x0200C024
	ldr r0, _0200C044 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_0200C034:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200C034
	bx lr
	.align 2, 0
_0200C044: .word 0x040001C2
	arm_func_end sub_0200C024

	arm_func_start sub_0200C048
sub_0200C048: ; 0x0200C048
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _0200C078
	ldr r1, _0200C224 ; =0x03809D74
	mov r4, #0
	mov r3, r4
_0200C064:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0200C064
_0200C078:
	ldr r1, _0200C224 ; =0x03809D74
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _0200C218
	ldr r2, _0200C228 ; =0x03809D70
	ldrh r1, [r2, #4]
	and r0, r1, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _0200C20C
_0200C0B4: ; jump table
	b _0200C0F8 ; case 0
	b _0200C120 ; case 1
	b _0200C1BC ; case 2
	b _0200C0C4 ; case 3
_0200C0C4:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	mov r0, #3
	bne _0200C0E4
	mov r1, #2
	bl sub_0200BC30
	b _0200C218
_0200C0E4:
	str r3, [r2, #0x28]
	mov r1, #0
	str r3, [r2, #0x2c]
	bl sub_0200BC30
	b _0200C218
_0200C0F8:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl sub_0200BD64
	cmp r0, #0
	bne _0200C218
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200C218
_0200C120:
	ldr r0, [r2, #0x24]
	cmp r0, #0
	beq _0200C13C
	mov r0, r4
	mov r1, #3
	bl sub_0200BC30
	b _0200C218
_0200C13C:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	beq _0200C154
	cmp r3, #4
	bls _0200C164
_0200C154:
	mov r0, r4
	mov r1, #2
	bl sub_0200BC30
	b _0200C218
_0200C164:
	ldrh ip, [r2, #6]
	ldr r0, _0200C22C ; =0x00000107
	cmp ip, r0
	blo _0200C184
	mov r0, r4
	mov r1, #2
	bl sub_0200BC30
	b _0200C218
_0200C184:
	mov r1, r4
	mov r0, #0
	mov r2, #2
	str ip, [sp]
	bl sub_0200BD64
	cmp r0, #0
	ldrne r0, _0200C228 ; =0x03809D70
	movne r1, #1
	strne r1, [r0, #0x24]
	bne _0200C218
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200C218
_0200C1BC:
	ldr r0, [r2, #0x24]
	cmp r0, #2
	beq _0200C1D8
	mov r0, r4
	mov r1, #3
	bl sub_0200BC30
	b _0200C218
_0200C1D8:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl sub_0200BD64
	cmp r0, #0
	ldrne r0, _0200C228 ; =0x03809D70
	movne r1, #3
	strne r1, [r0, #0x24]
	bne _0200C218
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200C218
_0200C20C:
	mov r0, r4
	mov r1, #1
	bl sub_0200BC30
_0200C218:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_0200C224: .word 0x03809D74
_0200C228: .word 0x03809D70
_0200C22C: .word 0x00000107
	arm_func_end sub_0200C048

	arm_func_start sub_0200C230
sub_0200C230: ; 0x0200C230
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r1, [sl, #4]
	cmp r1, #2
	bhi _0200C264
	cmp r1, #0
	beq _0200C27C
	cmp r1, #1
	beq _0200C3E8
	cmp r1, #2
	beq _0200C4B0
	b _0200C4FC
_0200C264:
	cmp r1, #0x10
	bne _0200C4FC
	ldr r0, _0200C508 ; =0x03809D70
	ldr r0, [r0, #0x24]
	cmp r0, #2
	bne _0200C4FC
_0200C27C:
	bl sub_02005EE8
	mov r4, r0
	mov r0, #0
	bl sub_0200BCF4
	cmp r0, #0
	bne _0200C2B4
	mov r0, r4
	bl sub_02005EFC
	ldr r0, [sl, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	b _0200C4FC
_0200C2B4:
	mov r0, #0
	bl sub_0200BD10
	mov r0, r4
	bl sub_02005EFC
	ldr r1, _0200C508 ; =0x03809D70
	add r0, sp, #8
	ldr r1, [r1, #0x28]
	add r2, sp, #4
	bl sub_0200C894
	ldr r0, [sp, #8]
	ldrh r2, [sp, #4]
	mov r1, r0, lsl #7
	movs r1, r1, lsr #0x1f
	ldreq r0, _0200C508 ; =0x03809D70
	moveq r1, #0
	streqb r1, [r0, #1]
	streqb r1, [r0]
	beq _0200C394
	mov r0, r0, lsl #5
	movs r0, r0, lsr #0x1e
	beq _0200C344
	ldr r0, _0200C508 ; =0x03809D70
	mov r3, #0
	strb r3, [r0]
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	cmp r1, #4
	blo _0200C394
	strb r3, [r0, #1]
	ldr r1, [r0, #0x28]
	cmp r1, #0x23
	addlt r1, r1, #1
	strlt r1, [r0, #0x28]
	b _0200C394
_0200C344:
	ldr r0, _0200C508 ; =0x03809D70
	mov r4, #0
	strb r4, [r0, #1]
	ldr r3, [r0, #0x28]
	cmp r2, r3, asr #1
	strgeb r4, [r0]
	bge _0200C394
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #4
	blo _0200C394
	strb r4, [r0]
	ldr r1, [r0, #0x2c]
	cmp r3, r1
	subgt r1, r3, #1
	strgt r1, [r0, #0x28]
	movgt r1, #3
	strgtb r1, [r0, #1]
_0200C394:
	ldrh r0, [sp, #8]
	ldr r1, _0200C50C ; =0x027FFFAA
	strh r0, [r1]
	ldrh r0, [sp, #0xa]
	strh r0, [r1, #2]
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _0200C3C8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_0200BC30
	b _0200C3DC
_0200C3C8:
	ldr r1, [sl, #8]
	mov r0, r0, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
_0200C3DC:
	mov r0, #0
	bl sub_0200BD28
	b _0200C4FC
_0200C3E8:
	ldr r0, _0200C508 ; =0x03809D70
	ldr r0, [r0, #0x24]
	cmp r0, #1
	bne _0200C49C
	ldr r8, _0200C510 ; =0x00000107
	ldr r6, _0200C514 ; =0x03809D74
	ldr r5, _0200C518 ; =0x03809DA0
	mov sb, #0
	mov r7, #0xd7
	mov fp, #0xa
	mov r4, #0x28
	b _0200C46C
_0200C418:
	mul r0, sb, r8
	bl sub_0200EFBC
	ldr r2, [sl, #0xc]
	mov r1, r8
	add r0, r2, r0
	bl sub_0200EFBC
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xc8
	blo _0200C448
	cmp r0, #0xd7
	movlo r0, r7
_0200C448:
	add r1, r6, sb, lsl #1
	strh r0, [r1, #0xcc]
	str sb, [sp]
	mla r0, sb, r4, r5
	ldrsh r1, [r1, #0xcc]
	ldr r3, _0200C51C ; =0x0380433C
	mov r2, fp
	bl sub_02005B10
	add sb, sb, #1
_0200C46C:
	ldr r1, [sl, #8]
	cmp sb, r1
	blo _0200C418
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	ldr r0, _0200C508 ; =0x03809D70
	mov r1, #2
	str r1, [r0, #0x24]
	b _0200C4FC
_0200C49C:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_0200BC30
	b _0200C4FC
_0200C4B0:
	ldr r0, _0200C508 ; =0x03809D70
	ldr r0, [r0, #0x24]
	cmp r0, #3
	bne _0200C4EC
	ldr r0, _0200C520 ; =0x54505641
	bl sub_02005C6C
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	ldr r0, _0200C508 ; =0x03809D70
	mov r1, #0
	str r1, [r0, #0x24]
	b _0200C4FC
_0200C4EC:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_0200BC30
_0200C4FC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200C508: .word 0x03809D70
_0200C50C: .word 0x027FFFAA
_0200C510: .word 0x00000107
_0200C514: .word 0x03809D74
_0200C518: .word 0x03809DA0
_0200C51C: .word 0x0380433C
_0200C520: .word 0x54505641
	arm_func_end sub_0200C230

	arm_func_start sub_0200C524
sub_0200C524: ; 0x0200C524
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r4
	mov r0, #0
	mov r1, #0x10
	mov r2, #1
	bl sub_0200BD64
	cmp r0, #0
	bne _0200C57C
	ldr r0, [sp]
	ldr r3, _0200C588 ; =0x027FFFAA
	bic r0, r0, #0x6000000
	orr r0, r0, #0x6000000
	str r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	strh r0, [r3]
	and r1, r4, #0xff
	mov r0, #0x10
	strh r2, [r3, #2]
	bl sub_0200BC30
_0200C57C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_0200C588: .word 0x027FFFAA
	arm_func_end sub_0200C524

	arm_func_start sub_0200C58C
sub_0200C58C: ; 0x0200C58C
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl sub_02006790
	ldr r2, _0200C668 ; =0x040001C0
_0200C59C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0200C59C
	ldr r1, _0200C66C ; =0x00008A01
	ldr r0, _0200C670 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_0200C5C0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200C5C0
	bl sub_0200C680
	ldr r1, _0200C674 ; =0x00008201
	ldr r0, _0200C668 ; =0x040001C0
	strh r1, [r0]
	bl sub_0200C680
	ldr r0, _0200C678 ; =0x03809E48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0200C608
	ldr r0, _0200C67C ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	moveq r0, #1
	movne r0, #0
	b _0200C660
_0200C608:
	ldr r2, _0200C67C ; =0x04000136
	ldrh r0, [r2]
	tst r0, #0x40
	moveq r0, #1
	beq _0200C660
	ldr r1, _0200C66C ; =0x00008A01
	mov r0, #0x84
	strh r1, [r2, #0x8a]
	strh r0, [r2, #0x8c]
_0200C62C:
	ldrh r0, [r2, #0x8a]
	tst r0, #0x80
	bne _0200C62C
	bl sub_0200C680
	ldr r1, _0200C674 ; =0x00008201
	ldr r0, _0200C668 ; =0x040001C0
	strh r1, [r0]
	bl sub_0200C680
	ldr r0, _0200C67C ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	movne r0, #0
	moveq r0, #2
_0200C660:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200C668: .word 0x040001C0
_0200C66C: .word 0x00008A01
_0200C670: .word 0x040001C2
_0200C674: .word 0x00008201
_0200C678: .word 0x03809E48
_0200C67C: .word 0x04000136
	arm_func_end sub_0200C58C

	arm_func_start sub_0200C680
sub_0200C680: ; 0x0200C680
	ldr r0, _0200C6A0 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_0200C690:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200C690
	bx lr
	.align 2, 0
_0200C6A0: .word 0x040001C2
	arm_func_end sub_0200C680

	arm_func_start sub_0200C6A4
sub_0200C6A4: ; 0x0200C6A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	cmp r2, #0
	ldr r2, _0200C880 ; =0x040001C0
	mov r5, r3
	moveq r3, #0xd1
	moveq r4, #1
	mov r7, r0
	mov r6, r1
	movne r3, #0x91
	movne r4, #2
_0200C6D0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0200C6D0
	ldr r1, _0200C884 ; =0x00008A01
	ldr r0, _0200C888 ; =0x040001C2
	strh r1, [r2]
	and r2, r3, #0xff
	strh r2, [r0]
	sub r1, r0, #2
_0200C6F4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200C6F4
	mov r0, r2, lsl #0x10
	ldr r2, _0200C880 ; =0x040001C0
	mov ip, #0
	ldr r8, _0200C88C ; =0x00007FF8
	add r1, sp, #0
	mov r0, r0, lsr #0x10
	mov r3, ip
_0200C71C:
	strh r3, [r2, #2]
_0200C720:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _0200C720
	ldrh sb, [r2, #2]
	and sb, sb, #0xff
	mov lr, sb, lsl #0x10
	mov sb, lr, lsr #8
	str sb, [r1, ip, lsl #2]
	strh r0, [r2, #2]
_0200C744:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _0200C744
	ldrh lr, [r2, #2]
	ldr sb, [r1, ip, lsl #2]
	and lr, lr, #0xff
	mov lr, lr, lsl #0x10
	orr sb, sb, lr, lsr #16
	and lr, sb, r8
	mov lr, lr, asr #3
	str lr, [r1, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #5
	blt _0200C71C
	ldr r0, _0200C890 ; =0x00008201
	strh r0, [r2]
	bl sub_0200C680
	mov r8, #0
	mov sb, r8
	add r2, sp, #0
_0200C794:
	ldr r1, [r2, sb, lsl #2]
	add r3, sb, #1
	b _0200C7B8
_0200C7A0:
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	subs r0, r1, r0
	rsbmi r0, r0, #0
	cmp r0, r8
	movgt r8, r0
_0200C7B8:
	cmp r3, #5
	blt _0200C7A0
	add sb, sb, #1
	cmp sb, #4
	blt _0200C794
	strh r8, [r5]
	mov r8, #0
	add r0, sp, #0
	b _0200C850
_0200C7DC:
	ldr r3, [r0, r8, lsl #2]
	add sb, r8, #1
	b _0200C844
_0200C7E8:
	ldr r2, [r0, sb, lsl #2]
	subs r1, r3, r2
	rsbmi r1, r1, #0
	cmp r1, r6
	bgt _0200C840
	add r1, sb, #1
	b _0200C838
_0200C804:
	ldr r5, [r0, r1, lsl #2]
	subs ip, r3, r5
	rsbmi ip, ip, #0
	cmp ip, r6
	bgt _0200C834
	add r0, r2, r3, lsl #1
	add r0, r5, r0
	mov r0, r0, asr #2
	bic r0, r0, #7
	strh r0, [r7]
	mov r0, #0
	b _0200C874
_0200C834:
	add r1, r1, #1
_0200C838:
	cmp r1, #5
	blt _0200C804
_0200C840:
	add sb, sb, #1
_0200C844:
	cmp sb, #4
	blt _0200C7E8
	add r8, r8, #1
_0200C850:
	cmp r8, #3
	blt _0200C7DC
	ldr r2, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r4
	add r1, r2, r1
	mov r1, r1, asr #1
	bic r1, r1, #7
	strh r1, [r7]
_0200C874:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200C880: .word 0x040001C0
_0200C884: .word 0x00008A01
_0200C888: .word 0x040001C2
_0200C88C: .word 0x00007FF8
_0200C890: .word 0x00008201
	arm_func_end sub_0200C6A4

	arm_func_start sub_0200C894
sub_0200C894: ; 0x0200C894
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r6, r1
	mov r5, r2
	mov r1, #0
	mov r7, r0
	strh r1, [r5]
	rsbmi r6, r6, #0
	bl sub_0200C58C
	movs r4, r0
	bne _0200C8FC
	ldr r1, [r7]
	mov r0, #0x1000
	rsb r0, r0, #0
	and r1, r1, r0
	ldr r0, _0200CA78 ; =0xFF000FFF
	and r0, r1, r0
	bic r1, r0, #0x1000000
	bic r0, r1, #0x6000000
	str r1, [r7]
	orr r1, r0, #0x6000000
	str r1, [r7]
	ldr r0, _0200CA7C ; =0x03809E48
	mov r1, #0
	strh r1, [r0]
	b _0200CA6C
_0200C8FC:
	add r0, sp, #4
	add r3, sp, #2
	mov r1, r6
	mov r2, #0
	bl sub_0200C6A4
	ldr r1, [r7]
	mov r0, r0, lsl #0x1e
	bic r1, r1, #0x6000000
	orr ip, r1, r0, lsr #5
	str ip, [r7]
	mov r1, #0x1000
	rsb r1, r1, #0
	ldrh r2, [sp, #4]
	and ip, ip, r1
	and r1, r2, r1, lsr #20
	orr ip, ip, r1
	add r0, sp, #4
	add r3, sp, #0
	mov r1, r6
	mov r2, #1
	str ip, [r7]
	bl sub_0200C6A4
	cmp r0, #2
	bne _0200C97C
	ldr r1, [r7]
	mov r0, r1, lsl #5
	mov r0, r0, lsr #0x1e
	orr r0, r0, #2
	bic r1, r1, #0x6000000
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #5
	str r0, [r7]
_0200C97C:
	ldrh r1, [sp, #4]
	ldr r2, [r7]
	ldr r0, _0200CA78 ; =0xFF000FFF
	mov r1, r1, lsl #0x14
	and r0, r2, r0
	orr r2, r0, r1, lsr #8
	ldr r1, _0200CA80 ; =0x00008A01
	ldr r0, _0200CA84 ; =0x040001C0
	str r2, [r7]
	strh r1, [r0]
	mov r6, #0
_0200C9A8:
	bl sub_0200C680
	add r6, r6, #1
	cmp r6, #0xc
	blt _0200C9A8
	ldr r1, _0200CA88 ; =0x00008201
	ldr r0, _0200CA84 ; =0x040001C0
	strh r1, [r0]
	bl sub_0200C680
	cmp r4, #2
	ldreq r0, [r7]
	biceq r0, r0, #0x6000000
	orreq r0, r0, #0x6000000
	streq r0, [r7]
	bl sub_0200C58C
	cmp r0, #0
	beq _0200CA4C
	cmp r0, #1
	beq _0200CA1C
	cmp r0, #2
	bne _0200CA68
	ldr r1, [r7]
	ldr r0, _0200CA7C ; =0x03809E48
	orr r2, r1, #0x1000000
	bic r1, r2, #0x6000000
	orr r1, r1, #0x6000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _0200CA6C
_0200CA1C:
	ldr r1, [r7]
	ldr r0, _0200CA7C ; =0x03809E48
	orr r1, r1, #0x1000000
	str r1, [r7]
	mov r2, #1
	ldrh r1, [sp]
	ldrh r3, [sp, #2]
	strh r2, [r0]
	cmp r3, r1
	movlo r3, r1
	strh r3, [r5]
	b _0200CA6C
_0200CA4C:
	ldr r1, [r7]
	ldr r0, _0200CA7C ; =0x03809E48
	bic r1, r1, #0x1000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _0200CA6C
_0200CA68:
	bl sub_02006058
_0200CA6C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200CA78: .word 0xFF000FFF
_0200CA7C: .word 0x03809E48
_0200CA80: .word 0x00008A01
_0200CA84: .word 0x040001C0
_0200CA88: .word 0x00008201
	arm_func_end sub_0200C894
_0200CA8C:
	.byte 0x2C, 0x00, 0x9F, 0xE5
	.byte 0x01, 0x10, 0xA0, 0xE3, 0x04, 0x10, 0x80, 0xE5, 0x00, 0x30, 0xA0, 0xE3, 0x28, 0x30, 0x80, 0xE5
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x03, 0x20, 0xA0, 0xE1, 0x83, 0x10, 0xA0, 0xE1, 0x01, 0x30, 0x83, 0xE2
	.byte 0xB1, 0x20, 0x80, 0xE1, 0x10, 0x00, 0x53, 0xE3, 0xFA, 0xFF, 0xFF, 0xBA, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x4C, 0x9E, 0x80, 0x03, 0x54, 0x9E, 0x80, 0x03, 0x18, 0x40, 0x2D, 0xE9, 0x04, 0xD0, 0x4D, 0xE2
	.byte 0x02, 0x04, 0x10, 0xE3, 0x07, 0x00, 0x00, 0x0A, 0x9C, 0x11, 0x9F, 0xE5, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x04, 0x30, 0xA0, 0xE1, 0x84, 0x20, 0xA0, 0xE1, 0x01, 0x40, 0x84, 0xE2, 0xB2, 0x30, 0x81, 0xE1
	.byte 0x10, 0x00, 0x54, 0xE3, 0xFA, 0xFF, 0xFF, 0xBA, 0x7C, 0x11, 0x9F, 0xE5, 0x0F, 0x28, 0x00, 0xE2
	.byte 0x22, 0x28, 0xA0, 0xE1, 0x82, 0x20, 0xA0, 0xE1, 0xB2, 0x00, 0x81, 0xE1, 0x01, 0x04, 0x10, 0xE3
	.byte 0x56, 0x00, 0x00, 0x0A, 0x64, 0x11, 0x9F, 0xE5, 0xB8, 0x20, 0xD1, 0xE1, 0xFF, 0x0C, 0x02, 0xE2
	.byte 0x00, 0x04, 0xA0, 0xE1, 0x20, 0x48, 0xA0, 0xE1, 0x60, 0x00, 0x44, 0xE2, 0x07, 0x00, 0x50, 0xE3
	.byte 0x00, 0xF1, 0x8F, 0x90, 0x4A, 0x00, 0x00, 0xEA, 0x06, 0x00, 0x00, 0xEA, 0x09, 0x00, 0x00, 0xEA
	.byte 0x47, 0x00, 0x00, 0xEA, 0x2D, 0x00, 0x00, 0xEA, 0x13, 0x00, 0x00, 0xEA, 0x1F, 0x00, 0x00, 0xEA
	.byte 0x37, 0x00, 0x00, 0xEA, 0x3C, 0x00, 0x00, 0xEA, 0x60, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x32, 0xFC, 0xFF, 0xEB, 0x41, 0x00, 0x00, 0xEA, 0xBA, 0xC0, 0xD1, 0xE1, 0x04, 0x10, 0xA0, 0xE1
	.byte 0xFF, 0x30, 0x02, 0xE2, 0x03, 0x00, 0xA0, 0xE3, 0x02, 0x20, 0xA0, 0xE3, 0x00, 0xC0, 0x8D, 0xE5
	.byte 0x77, 0xFC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x38, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1
	.byte 0x04, 0x10, 0xA0, 0xE3, 0x25, 0xFC, 0xFF, 0xEB, 0x34, 0x00, 0x00, 0xEA, 0xBA, 0xC0, 0xD1, 0xE1
	.byte 0x04, 0x10, 0xA0, 0xE1, 0xFF, 0x30, 0x02, 0xE2, 0x03, 0x00, 0xA0, 0xE3, 0x02, 0x20, 0xA0, 0xE3
	.byte 0x00, 0xC0, 0x8D, 0xE5, 0x6A, 0xFC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x2B, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE3, 0x18, 0xFC, 0xFF, 0xEB, 0x27, 0x00, 0x00, 0xEA
	.byte 0x02, 0x08, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE1, 0x20, 0x38, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE3
	.byte 0x01, 0x20, 0xA0, 0xE3, 0x5E, 0xFC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x1F, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE3, 0x0C, 0xFC, 0xFF, 0xEB, 0x1B, 0x00, 0x00, 0xEA
	.byte 0xBA, 0x00, 0xD1, 0xE1, 0x02, 0x2C, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE1, 0x22, 0x34, 0x80, 0xE1
	.byte 0x03, 0x00, 0xA0, 0xE3, 0x01, 0x20, 0xA0, 0xE3, 0x51, 0xFC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x12, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE3, 0xFF, 0xFB, 0xFF, 0xEB
	.byte 0x0E, 0x00, 0x00, 0xEA, 0xFF, 0x00, 0x02, 0xE2, 0xF1, 0x01, 0x00, 0xEB, 0x66, 0x00, 0xA0, 0xE3
	.byte 0x00, 0x10, 0xA0, 0xE3, 0xF9, 0xFB, 0xFF, 0xEB, 0x08, 0x00, 0x00, 0xEA, 0xF3, 0x01, 0x00, 0xEB
	.byte 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x18, 0xA0, 0xE1, 0x67, 0x00, 0xA0, 0xE3, 0xF3, 0xFB, 0xFF, 0xEB
	.byte 0x02, 0x00, 0x00, 0xEA, 0x04, 0x00, 0xA0, 0xE1, 0x01, 0x10, 0xA0, 0xE3, 0xEF, 0xFB, 0xFF, 0xEB
	.byte 0x04, 0xD0, 0x8D, 0xE2, 0x18, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x54, 0x9E, 0x80, 0x03
	.byte 0x4C, 0x9E, 0x80, 0x03, 0x38, 0x40, 0x2D, 0xE9, 0x00, 0x40, 0xA0, 0xE1, 0x95, 0xE4, 0xFF, 0xEB
	.byte 0x00, 0x50, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE3, 0x15, 0xFC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x07, 0x00, 0x00, 0x1A, 0x05, 0x00, 0xA0, 0xE1, 0x93, 0xE4, 0xFF, 0xEB, 0x04, 0x00, 0x94, 0xE5
	.byte 0x04, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0xDB, 0xFB, 0xFF, 0xEB
	.byte 0x48, 0x00, 0x00, 0xEA, 0x03, 0x00, 0xA0, 0xE3, 0x10, 0xFC, 0xFF, 0xEB, 0x05, 0x00, 0xA0, 0xE1
	.byte 0x89, 0xE4, 0xFF, 0xEB, 0x04, 0x10, 0x94, 0xE5, 0x61, 0x00, 0x41, 0xE2, 0x05, 0x00, 0x50, 0xE3
	.byte 0x00, 0xF1, 0x8F, 0x90, 0x39, 0x00, 0x00, 0xEA, 0x04, 0x00, 0x00, 0xEA, 0x37, 0x00, 0x00, 0xEA
	.byte 0x29, 0x00, 0x00, 0xEA, 0x0A, 0x00, 0x00, 0xEA, 0x18, 0x00, 0x00, 0xEA, 0x30, 0x00, 0x00, 0xEA
	.byte 0xE8, 0x00, 0x9F, 0xE5, 0x01, 0x10, 0xA0, 0xE3, 0x28, 0x10, 0x80, 0xE5, 0x08, 0x10, 0x94, 0xE5
	.byte 0xB2, 0x10, 0xC0, 0xE1, 0x0C, 0x10, 0x94, 0xE5, 0xB0, 0x10, 0xC0, 0xE1, 0xF8, 0x00, 0x00, 0xEB
	.byte 0x2E, 0x00, 0x00, 0xEA, 0xC4, 0x20, 0x9F, 0xE5, 0x04, 0x00, 0xA0, 0xE3, 0x28, 0x00, 0x82, 0xE5
	.byte 0x08, 0x00, 0x94, 0xE5, 0x30, 0x00, 0x82, 0xE5, 0x0C, 0x30, 0x94, 0xE5, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0xFF, 0x10, 0x03, 0xE2, 0x2C, 0x30, 0x82, 0xE5, 0x39, 0x00, 0x00, 0xEB
	.byte 0x64, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3, 0xB4, 0xFB, 0xFF, 0xEB, 0x1F, 0x00, 0x00, 0xEA
	.byte 0x88, 0x10, 0x9F, 0xE5, 0x03, 0x00, 0xA0, 0xE3, 0x28, 0x00, 0x81, 0xE5, 0x08, 0x20, 0x94, 0xE5
	.byte 0x02, 0x08, 0xA0, 0xE1, 0x20, 0x48, 0xA0, 0xE1, 0x04, 0x00, 0xA0, 0xE1, 0x30, 0x20, 0x81, 0xE5
	.byte 0x4B, 0x00, 0x00, 0xEB, 0x70, 0x10, 0x84, 0xE2, 0x01, 0x28, 0xA0, 0xE1, 0x00, 0x10, 0xA0, 0xE1
	.byte 0x22, 0x08, 0xA0, 0xE1, 0xA5, 0xFB, 0xFF, 0xEB, 0x10, 0x00, 0x00, 0xEA, 0x4C, 0x10, 0x9F, 0xE5
	.byte 0x02, 0x00, 0xA0, 0xE3, 0x28, 0x00, 0x81, 0xE5, 0x08, 0x00, 0x94, 0xE5, 0x2C, 0x00, 0x81, 0xE5
	.byte 0x70, 0x00, 0x00, 0xEB, 0x63, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3, 0x9B, 0xFB, 0xFF, 0xEB
	.byte 0x06, 0x00, 0x00, 0xEA, 0x08, 0x00, 0x94, 0xE5, 0xB3, 0x00, 0x00, 0xEB, 0x03, 0x00, 0x00, 0xEA
	.byte 0x01, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0x01, 0x10, 0xA0, 0xE3, 0x93, 0xFB, 0xFF, 0xEB
	.byte 0x03, 0x00, 0xA0, 0xE3, 0xCF, 0xFB, 0xFF, 0xEB, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x4C, 0x9E, 0x80, 0x03

	arm_func_start sub_0200CDF4
sub_0200CDF4: ; 0x0200CDF4
	stmdb sp!, {r4, r5, r6, lr}
	and r1, r1, #0x3f0000
	and r3, r0, #0x3c00000
	mov r1, r1, lsl #0x10
	mov r0, r2, lsl #0x10
	orr r1, r1, r3, lsl #22
	orr r6, r1, r0, lsr #16
	mov r5, #8
	mov r4, #0
_0200CE18:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	bne _0200CE18
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0200CDF4

	arm_func_start sub_0200CE38
sub_0200CE38: ; 0x0200CE38
	stmdb sp!, {r4, lr}
	ldr r2, _0200CE84 ; =0x040001C0
	mov r4, r1
_0200CE44:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0200CE44
	ldr r1, _0200CE88 ; =0x00008202
	and r0, r0, #0xff
	strh r1, [r2]
	add r1, r1, #0x600
	strh r1, [r2]
	bl sub_0200CE90
	ldr r2, _0200CE8C ; =0x00008002
	ldr r1, _0200CE84 ; =0x040001C0
	and r0, r4, #0xff
	strh r2, [r1]
	strh r0, [r1, #2]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200CE84: .word 0x040001C0
_0200CE88: .word 0x00008202
_0200CE8C: .word 0x00008002
	arm_func_end sub_0200CE38

	arm_func_start sub_0200CE90
sub_0200CE90: ; 0x0200CE90
	ldr r1, _0200CEB0 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_0200CEA0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200CEA0
	bx lr
	.align 2, 0
_0200CEB0: .word 0x040001C2
	arm_func_end sub_0200CE90

	arm_func_start sub_0200CEB4
sub_0200CEB4: ; 0x0200CEB4
	stmdb sp!, {r3, lr}
	ldr r2, _0200CF18 ; =0x040001C0
_0200CEBC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0200CEBC
	ldr r1, _0200CF1C ; =0x00008202
	orr r0, r0, #0x80
	strh r1, [r2]
	add r1, r1, #0x600
	and r0, r0, #0xff
	strh r1, [r2]
	bl sub_0200CE90
	ldr r2, _0200CF20 ; =0x00008002
	ldr r1, _0200CF18 ; =0x040001C0
	mov r0, #0
	strh r2, [r1]
	strh r0, [r1, #2]
_0200CEF8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200CEF8
	ldr r0, _0200CF24 ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200CF18: .word 0x040001C0
_0200CF1C: .word 0x00008202
_0200CF20: .word 0x00008002
_0200CF24: .word 0x040001C2
	arm_func_end sub_0200CEB4

	arm_func_start sub_0200CF28
sub_0200CF28: ; 0x0200CF28
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_0200CEB4
	orr r1, r0, r4
	mov r0, #0
	bl sub_0200CE38
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0200CF28

	arm_func_start sub_0200CF4C
sub_0200CF4C: ; 0x0200CF4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_0200CEB4
	mvn r1, r4
	and r0, r0, r1
	and r1, r0, #0xff
	mov r0, #0
	bl sub_0200CE38
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0200CF4C

	arm_func_start sub_0200CF78
sub_0200CF78: ; 0x0200CF78
	stmdb sp!, {r3, lr}
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0200D094
_0200CF88: ; jump table
	b _0200D094 ; case 0
	b _0200CFC8 ; case 1
	b _0200CFDC ; case 2
	b _0200CFF0 ; case 3
	b _0200D004 ; case 4
	b _0200D010 ; case 5
	b _0200D01C ; case 6
	b _0200D028 ; case 7
	b _0200D034 ; case 8
	b _0200D040 ; case 9
	b _0200D04C ; case 10
	b _0200D058 ; case 11
	b _0200D064 ; case 12
	b _0200D070 ; case 13
	b _0200D088 ; case 14
	b _0200D07C ; case 15
_0200CFC8:
	mov r0, #1
	bl sub_0200D404
	mov r0, #1
	bl sub_0200D09C
	b _0200D094
_0200CFDC:
	mov r0, #3
	bl sub_0200D404
	mov r0, #3
	bl sub_0200D09C
	b _0200D094
_0200CFF0:
	mov r0, #2
	bl sub_0200D404
	mov r0, #2
	bl sub_0200D09C
	b _0200D094
_0200D004:
	mov r0, #4
	bl sub_0200CF28
	b _0200D094
_0200D010:
	mov r0, #4
	bl sub_0200CF4C
	b _0200D094
_0200D01C:
	mov r0, #8
	bl sub_0200CF28
	b _0200D094
_0200D028:
	mov r0, #8
	bl sub_0200CF4C
	b _0200D094
_0200D034:
	mov r0, #0xc
	bl sub_0200CF28
	b _0200D094
_0200D040:
	mov r0, #0xc
	bl sub_0200CF4C
	b _0200D094
_0200D04C:
	mov r0, #1
	bl sub_0200CF28
	b _0200D094
_0200D058:
	mov r0, #1
	bl sub_0200CF4C
	b _0200D094
_0200D064:
	mov r0, #2
	bl sub_0200CF4C
	b _0200D094
_0200D070:
	mov r0, #2
	bl sub_0200CF28
	b _0200D094
_0200D07C:
	mov r0, #0x40
	bl sub_0200CF4C
	b _0200D094
_0200D088:
	bl sub_020068F0
	mov r0, #0x40
	bl sub_0200CF28
_0200D094:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0200CF78

	arm_func_start sub_0200D09C
sub_0200D09C: ; 0x0200D09C
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #1
	beq _0200D0C0
	cmp r4, #2
	beq _0200D0D8
	cmp r4, #3
	beq _0200D0CC
	b _0200D0EC
_0200D0C0:
	mov r0, #0x10
	bl sub_0200CF4C
	b _0200D0F0
_0200D0CC:
	mov r0, #0x30
	bl sub_0200CF28
	b _0200D0F0
_0200D0D8:
	mov r0, #0x20
	bl sub_0200CF4C
	mov r0, #0x10
	bl sub_0200CF28
	b _0200D0F0
_0200D0EC:
	bl sub_02006058
_0200D0F0:
	ldr r0, _0200D100 ; =0x0380756C
	str r4, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200D100: .word 0x0380756C
	arm_func_end sub_0200D09C

	arm_func_start sub_0200D104
sub_0200D104: ; 0x0200D104
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _0200D2C0 ; =0x04000208
	mov r8, #0
	ldrh sb, [r0]
	strh r8, [r0]
	bl sub_02005EE8
	mov r4, r0
	mvn r0, #0xfe000000
	bl sub_02003B10
	mov r5, r0
	mov r0, r8
	bl sub_0200CEB4
	mov r6, r0
	mov r0, #2
	bl sub_0200D404
	mov r0, #2
	bl sub_0200D09C
	mov r0, #2
	bl sub_0200D09C
	bl sub_020068F0
	mov r0, #1
	bl sub_0200CF4C
	ldr r0, _0200D2C4 ; =0x03809E4E
	ldrh r0, [r0]
	tst r0, #1
	beq _0200D188
	ldr r0, _0200D2C8 ; =0x03809E4C
	ldr r1, _0200D2CC ; =0x04000132
	ldrh r2, [r0]
	mov r0, #0x1000
	orr r2, r2, #0x4000
	strh r2, [r1]
	bl sub_02003AD8
_0200D188:
	ldr r0, _0200D2C4 ; =0x03809E4E
	ldrh r0, [r0]
	tst r0, #4
	beq _0200D1A0
	mov r0, #0x400000
	bl sub_02003AD8
_0200D1A0:
	ldr r0, _0200D2C4 ; =0x03809E4E
	ldrh r0, [r0]
	tst r0, #2
	beq _0200D1E4
	ldr r1, _0200D2D0 ; =0x04000134
	mov r0, #0x8000
	ldrh r7, [r1]
	mov r8, #1
	bl sub_02006790
	mov r0, #0x40
	mov r1, #0
	bl sub_02006770
	mov r0, #0x100
	mov r1, r0
	bl sub_02006770
	mov r0, #0x80
	bl sub_02003AD8
_0200D1E4:
	ldr r0, _0200D2C4 ; =0x03809E4E
	ldrh r0, [r0]
	tst r0, #8
	beq _0200D1FC
	mov r0, #0x100000
	bl sub_02003AD8
_0200D1FC:
	ldr r0, _0200D2C4 ; =0x03809E4E
	ldrh r0, [r0]
	tst r0, #0x10
	beq _0200D214
	mov r0, #0x2000
	bl sub_02003AD8
_0200D214:
	mov r0, r4
	bl sub_02005EFC
	ldr r2, _0200D2C0 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl sub_0200D2D8
	mov r1, r6
	mov r0, #0
	bl sub_0200CE38
	ldr r0, _0200D2C4 ; =0x03809E4E
	ldrh r1, [r0]
	tst r1, #0x20
	movne r0, #6
	moveq r0, #7
	tst r1, #0x40
	movne r6, #4
	moveq r6, #5
	bl sub_0200CF78
	mov r0, r6
	bl sub_0200CF78
	cmp r8, #0
	ldrne r0, _0200D2D0 ; =0x04000134
	strneh r7, [r0]
	mov r0, #1
	bl sub_0200CF28
	bl sub_02006948
	mov r1, #0
	ldr r3, _0200D2D4 ; =0x03809E54
	mov r2, r1
	mov r0, #0x62
	str r1, [r3, #0x20]
	bl sub_0200CDF4
	bl sub_02005EE8
	mov r0, r5
	bl sub_02003A8C
	mov r0, r4
	bl sub_02005EFC
	ldr r1, _0200D2C0 ; =0x04000208
	ldrh r0, [r1]
	strh sb, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200D2C0: .word 0x04000208
_0200D2C4: .word 0x03809E4E
_0200D2C8: .word 0x03809E4C
_0200D2CC: .word 0x04000132
_0200D2D0: .word 0x04000134
_0200D2D4: .word 0x03809E54
	arm_func_end sub_0200D104

	arm_func_start sub_0200D2D8
sub_0200D2D8: ; 0x0200D2D8
	ldr ip, _0200D2E0 ; =sub_038037D6
	bx ip
	.align 2, 0
_0200D2E0: .word sub_038037D6
	arm_func_end sub_0200D2D8

	arm_func_start sub_0200D2E4
sub_0200D2E4: ; 0x0200D2E4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200D3F8 ; =0x03809E80
	ldr r3, [r1, #4]
	cmp r3, #0
	bne _0200D320
	mov r2, #1
	mov r3, r2
	mov r0, #3
	mov r1, #0x66
	bl sub_0200BD64
	cmp r0, #0
	beq _0200D3F0
	mov r0, #1
	bl sub_0200D404
	b _0200D3F0
_0200D320:
	cmp r3, #4
	bge _0200D34C
	ldr r0, _0200D3FC ; =0x0380756C
	ldr r0, [r0]
	cmp r3, r0
	beq _0200D3F0
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl sub_0200BD64
	b _0200D3F0
_0200D34C:
	sub r2, r3, #4
	mov r0, #0xc
	mul r4, r2, r0
	ldr r5, _0200D400 ; =0x03807570
	ldr r0, [r1]
	add r6, r5, r4
	ldrh r1, [r6, #0xa]
	bl sub_0200EFBC
	mov r1, #0
	mov r3, r1, lsr r0
	ldr ip, [r6, #4]
	mov r2, #0x80000000
	rsb r1, r0, #0x20
	orr r3, r3, r2, lsl r1
	sub r1, r0, #0x20
	and ip, ip, r2, lsr r0
	orr r3, r3, r2, lsr r1
	ldr r0, [r5, r4]
	cmp ip, #0
	and r0, r0, r3
	cmpeq r0, #0
	movne r3, #1
	ldrh r2, [r6, #8]
	ldrh r1, [r6, #0xa]
	ldr r0, _0200D3F8 ; =0x03809E80
	mul r1, r2, r1
	ldr r2, [r0]
	moveq r3, #2
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0]
	movhs r1, #0
	strhs r1, [r0]
	ldr r0, _0200D3FC ; =0x0380756C
	ldr r0, [r0]
	cmp r3, r0
	beq _0200D3F0
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl sub_0200BD64
_0200D3F0:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0200D3F8: .word 0x03809E80
_0200D3FC: .word 0x0380756C
_0200D400: .word 0x03807570
	arm_func_end sub_0200D2E4

	arm_func_start sub_0200D404
sub_0200D404: ; 0x0200D404
	cmp r0, #0xf
	ldrle r1, _0200D41C ; =0x03809E80
	movle r2, #0
	strle r0, [r1, #4]
	strle r2, [r1]
	bx lr
	.align 2, 0
_0200D41C: .word 0x03809E80
	arm_func_end sub_0200D404
_0200D420:
	.byte 0x04, 0x00, 0x9F, 0xE5, 0x04, 0x00, 0x90, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0x80, 0x9E, 0x80, 0x03
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x40, 0xA0, 0xE1, 0x2C, 0x30, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x28, 0x00, 0x9F, 0xE5, 0xA4, 0x20, 0xA0, 0xE3, 0x12, 0x00, 0x83, 0xE9, 0x81, 0xE3, 0xFF, 0xEB
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x12, 0x00, 0x00, 0xEB, 0x0C, 0x00, 0x9F, 0xE5, 0x03, 0x10, 0xA0, 0xE3
	.byte 0x00, 0x10, 0xC0, 0xE5, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x88, 0x9E, 0x80, 0x03
	.byte 0x98, 0x9E, 0x80, 0x03

	arm_func_start sub_0200D474
sub_0200D474: ; 0x0200D474
	stmdb sp!, {r3, lr}
	ldr r2, _0200D4A0 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	bl sub_0200D404
	mov r0, #1
	bl sub_0200D09C
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200D4A0: .word 0x04000304
	arm_func_end sub_0200D474

	arm_func_start sub_0200D4A4
sub_0200D4A4: ; 0x0200D4A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	str r0, [sp, #0x44]
	ldr r0, _0200D53C ; =0x0380AAFC
	mov sb, #4
	mov r7, #8
	mov r4, #3
	ldr r1, _0200D540 ; =0x0380AAFC
	ldr r6, _0200D544 ; =0x03809F3C
	mov sl, #0x600
	mov r8, #0
	mov r5, #0x1c0
	mov lr, #0x40
	mov ip, #5
	mov r3, #7
	mov r2, #9
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	add r0, sp, #0x1c
	add r1, sp, #0
	str sl, [sp, #0x24]
	str sb, [sp, #0x28]
	str r8, [sp, #0x3c]
	str r7, [sp, #0x40]
	str r6, [sp, #0x48]
	str r5, [sp, #0x4c]
	str r4, [sp]
	str lr, [sp, #0x38]
	str r4, [sp, #8]
	str sb, [sp, #0x18]
	str ip, [sp, #0x10]
	str r3, [sp, #4]
	str r7, [sp, #0x14]
	str r2, [sp, #0xc]
	bl sub_00FE81E8
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0200D53C: .word 0x0380AAFC
_0200D540: .word 0x0380AAFC
_0200D544: .word 0x03809F3C
	arm_func_end sub_0200D4A4
_0200D548:
	.byte 0x34, 0x00, 0x9F, 0xE5, 0x00, 0x30, 0xA0, 0xE3
	.byte 0x20, 0x30, 0x80, 0xE5, 0x2C, 0x00, 0x9F, 0xE5, 0x03, 0x20, 0xA0, 0xE1, 0x83, 0x10, 0xA0, 0xE1
	.byte 0x01, 0x30, 0x83, 0xE2, 0xB1, 0x20, 0x80, 0xE1, 0x10, 0x00, 0x53, 0xE3, 0xFA, 0xFF, 0xFF, 0xBA
	.byte 0x14, 0x10, 0x9F, 0xE5, 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0xC0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xFC, 0xB1, 0x80, 0x03, 0xFC, 0xB1, 0x80, 0x03, 0x0E, 0x01, 0x00, 0x04
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x02, 0x04, 0x10, 0xE3, 0x07, 0x00, 0x00, 0x0A, 0xA4, 0x12, 0x9F, 0xE5
	.byte 0x00, 0x40, 0xA0, 0xE3, 0x04, 0x30, 0xA0, 0xE1, 0x84, 0x20, 0xA0, 0xE1, 0x01, 0x40, 0x84, 0xE2
	.byte 0xB2, 0x30, 0x81, 0xE1, 0x10, 0x00, 0x54, 0xE3, 0xFA, 0xFF, 0xFF, 0xBA, 0x84, 0x12, 0x9F, 0xE5
	.byte 0x0F, 0x28, 0x00, 0xE2, 0x22, 0x28, 0xA0, 0xE1, 0x82, 0x20, 0xA0, 0xE1, 0xB2, 0x00, 0x81, 0xE1
	.byte 0x01, 0x04, 0x10, 0xE3, 0x99, 0x00, 0x00, 0x0A, 0x6C, 0x12, 0x9F, 0xE5, 0xB0, 0x20, 0xD1, 0xE1
	.byte 0xFF, 0x0C, 0x02, 0xE2, 0x00, 0x04, 0xA0, 0xE1, 0x20, 0x48, 0xA0, 0xE1, 0x40, 0x00, 0x44, 0xE2
	.byte 0x03, 0x00, 0x50, 0xE3, 0x00, 0xF1, 0x8F, 0x90, 0x8D, 0x00, 0x00, 0xEA, 0x02, 0x00, 0x00, 0xEA
	.byte 0x10, 0x00, 0x00, 0xEA, 0x50, 0x00, 0x00, 0xEA, 0x68, 0x00, 0x00, 0xEA, 0x04, 0x10, 0xA0, 0xE1
	.byte 0xFF, 0x30, 0x02, 0xE2, 0x02, 0x00, 0xA0, 0xE3, 0x01, 0x20, 0xA0, 0xE3, 0xD0, 0xF9, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x02, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE3
	.byte 0x7E, 0xF9, 0xFF, 0xEB, 0x14, 0x02, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1
	.byte 0x04, 0x10, 0x00, 0xE5, 0x7D, 0x00, 0x00, 0xEA, 0x20, 0x00, 0x91, 0xE5, 0x00, 0x00, 0x50, 0xE3
	.byte 0x03, 0x00, 0x00, 0x0A, 0x04, 0x00, 0xA0, 0xE1, 0x03, 0x10, 0xA0, 0xE3, 0x73, 0xF9, 0xFF, 0xEB
	.byte 0x76, 0x00, 0x00, 0xEA, 0xFF, 0x00, 0x02, 0xE2, 0xB4, 0x02, 0xC1, 0xE1, 0xB2, 0x20, 0xD1, 0xE1
	.byte 0xB4, 0x00, 0xD1, 0xE1, 0x02, 0x38, 0x80, 0xE1, 0x02, 0x04, 0x53, 0xE3, 0x01, 0x00, 0x00, 0x3A
	.byte 0x09, 0x05, 0x53, 0xE3, 0x03, 0x00, 0x00, 0x3A, 0x04, 0x00, 0xA0, 0xE1, 0x02, 0x10, 0xA0, 0xE3
	.byte 0x66, 0xF9, 0xFF, 0xEB, 0x69, 0x00, 0x00, 0xEA, 0x28, 0x30, 0x81, 0xE5, 0xB6, 0x20, 0xD1, 0xE1
	.byte 0xB8, 0x00, 0xD1, 0xE1, 0x02, 0x28, 0x80, 0xE1, 0x02, 0x00, 0x83, 0xE0, 0x09, 0x05, 0x50, 0xE3
	.byte 0x03, 0x00, 0x00, 0x9A, 0x04, 0x00, 0xA0, 0xE1, 0x02, 0x10, 0xA0, 0xE3, 0x5B, 0xF9, 0xFF, 0xEB
	.byte 0x5E, 0x00, 0x00, 0xEA, 0x30, 0x20, 0x81, 0xE5, 0xBA, 0x20, 0xD1, 0xE1, 0xBC, 0x00, 0xD1, 0xE1
	.byte 0x02, 0x08, 0x80, 0xE1, 0x5F, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x02, 0x10, 0xA0, 0xE3, 0x50, 0xF9, 0xFF, 0xEB, 0x53, 0x00, 0x00, 0xEA
	.byte 0x54, 0x31, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x2C, 0x20, 0x83, 0xE5, 0xB4, 0x02, 0xD3, 0xE1
	.byte 0x04, 0x10, 0xA0, 0xE1, 0x07, 0xC0, 0x00, 0xE2, 0x02, 0x00, 0xA0, 0xE3, 0xB6, 0xC2, 0xC3, 0xE1
	.byte 0x93, 0xF9, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1
	.byte 0x04, 0x10, 0xA0, 0xE3, 0x41, 0xF9, 0xFF, 0xEB, 0x44, 0x00, 0x00, 0xEA, 0x1C, 0x11, 0x9F, 0xE5
	.byte 0x00, 0x20, 0xA0, 0xE3, 0xB0, 0x20, 0xC1, 0xE1, 0x0C, 0x01, 0x9F, 0xE5, 0x04, 0x20, 0x01, 0xE5
	.byte 0x01, 0x10, 0xA0, 0xE3, 0x20, 0x10, 0x80, 0xE5, 0x3C, 0x00, 0x00, 0xEA, 0x20, 0x00, 0x91, 0xE5
	.byte 0x02, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x0A, 0x04, 0x00, 0xA0, 0xE1, 0x03, 0x10, 0xA0, 0xE3
	.byte 0x32, 0xF9, 0xFF, 0xEB, 0x35, 0x00, 0x00, 0xEA, 0x04, 0x10, 0xA0, 0xE1, 0x02, 0x00, 0xA0, 0xE3
	.byte 0x00, 0x20, 0xA0, 0xE3, 0x7A, 0xF9, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE3, 0x28, 0xF9, 0xFF, 0xEB, 0x2B, 0x00, 0x00, 0xEA
	.byte 0xB4, 0x00, 0x9F, 0xE5, 0x03, 0x20, 0xA0, 0xE3, 0xB4, 0x10, 0x9F, 0xE5, 0x20, 0x20, 0x80, 0xE5
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0xC0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1, 0x23, 0x00, 0x00, 0xEA
	.byte 0x20, 0x00, 0x91, 0xE5, 0x02, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x0A, 0x04, 0x00, 0xA0, 0xE1
	.byte 0x03, 0x10, 0xA0, 0xE3, 0x19, 0xF9, 0xFF, 0xEB, 0x1C, 0x00, 0x00, 0xEA, 0xB2, 0x20, 0xD1, 0xE1
	.byte 0xB4, 0x00, 0xD1, 0xE1, 0x02, 0x08, 0x80, 0xE1, 0x1E, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x03, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1, 0x02, 0x10, 0xA0, 0xE3, 0x0F, 0xF9, 0xFF, 0xEB
	.byte 0x12, 0x00, 0x00, 0xEA, 0xBB, 0xE1, 0xFF, 0xEB, 0x54, 0x30, 0x9F, 0xE5, 0x48, 0x10, 0x9F, 0xE5
	.byte 0xB0, 0x20, 0xD3, 0xE1, 0x80, 0x20, 0xC2, 0xE3, 0xB0, 0x20, 0xC3, 0xE1, 0xB4, 0x23, 0xD1, 0xE1
	.byte 0xB2, 0x20, 0x43, 0xE1, 0xB6, 0x13, 0xD1, 0xE1, 0xC0, 0x10, 0x81, 0xE3, 0xB0, 0x10, 0xC3, 0xE1
	.byte 0xB5, 0xE1, 0xFF, 0xEB, 0x04, 0x00, 0xA0, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0xFF, 0xF8, 0xFF, 0xEB
	.byte 0x02, 0x00, 0x00, 0xEA, 0x04, 0x00, 0xA0, 0xE1, 0x01, 0x10, 0xA0, 0xE3, 0xFB, 0xF8, 0xFF, 0xEB
	.byte 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xFC, 0xB1, 0x80, 0x03, 0xFC, 0xB1, 0x80, 0x03
	.byte 0x94, 0xFF, 0x7F, 0x02, 0x0E, 0x01, 0x00, 0x04, 0x01, 0x08, 0x50, 0xE3, 0x06, 0x00, 0x00, 0x2A
	.byte 0x90, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0xB6, 0x23, 0xC1, 0xE1, 0x01, 0x08, 0x60, 0xE2
	.byte 0xB4, 0x03, 0xC1, 0xE1, 0x01, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x05, 0x50, 0xE3
	.byte 0x07, 0x00, 0x00, 0x2A, 0x6C, 0x10, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0x20, 0x03, 0xA0, 0xE1
	.byte 0x01, 0x28, 0x60, 0xE2, 0xB6, 0x33, 0xC1, 0xE1, 0x03, 0x00, 0xA0, 0xE1, 0xB4, 0x23, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x04, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x2A, 0x44, 0x10, 0x9F, 0xE5
	.byte 0x02, 0x20, 0xA0, 0xE3, 0x20, 0x04, 0xA0, 0xE1, 0xB6, 0x23, 0xC1, 0xE1, 0x01, 0x08, 0x60, 0xE2
	.byte 0xB4, 0x03, 0xC1, 0xE1, 0x01, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1, 0x01, 0x03, 0x50, 0xE3
	.byte 0x00, 0x00, 0xA0, 0x23, 0x1E, 0xFF, 0x2F, 0x21, 0x18, 0x10, 0x9F, 0xE5, 0x03, 0x20, 0xA0, 0xE3
	.byte 0x20, 0x05, 0xA0, 0xE1, 0xB6, 0x23, 0xC1, 0xE1, 0x01, 0x08, 0x60, 0xE2, 0xB4, 0x03, 0xC1, 0xE1
	.byte 0x01, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1, 0xFC, 0xB1, 0x80, 0x03, 0x38, 0x40, 0x2D, 0xE9
	.byte 0x00, 0x40, 0xA0, 0xE1, 0x04, 0x20, 0x94, 0xE5, 0x40, 0x00, 0x52, 0xE3, 0x04, 0x00, 0x00, 0x0A
	.byte 0x41, 0x00, 0x52, 0xE3, 0x2E, 0x00, 0x00, 0x0A, 0x42, 0x00, 0x52, 0xE3, 0x52, 0x00, 0x00, 0x0A
	.byte 0x78, 0x00, 0x00, 0xEA, 0x6F, 0xE1, 0xFF, 0xEB, 0x00, 0x50, 0xA0, 0xE1, 0x02, 0x00, 0xA0, 0xE3
	.byte 0xEF, 0xF8, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A, 0x05, 0x00, 0xA0, 0xE1
	.byte 0x6D, 0xE1, 0xFF, 0xEB, 0x04, 0x00, 0x94, 0xE5, 0x04, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0xB5, 0xF8, 0xFF, 0xEB, 0x6A, 0x00, 0x00, 0xEA, 0x02, 0x00, 0xA0, 0xE3
	.byte 0xEA, 0xF8, 0xFF, 0xEB, 0x05, 0x00, 0xA0, 0xE1, 0x63, 0xE1, 0xFF, 0xEB, 0x08, 0x00, 0x94, 0xE5
	.byte 0x01, 0x00, 0x00, 0xE2, 0x01, 0x00, 0x50, 0xE3, 0x04, 0x00, 0x00, 0x1A, 0x32, 0x01, 0x00, 0xEB
	.byte 0x08, 0x10, 0x94, 0xE5, 0x02, 0x00, 0x11, 0xE3, 0x02, 0x09, 0x20, 0x12, 0x03, 0x00, 0x00, 0xEA
	.byte 0xD8, 0x00, 0x00, 0xEB, 0x08, 0x10, 0x94, 0xE5, 0x02, 0x00, 0x11, 0xE3, 0x80, 0x00, 0x20, 0x12
	.byte 0x68, 0x11, 0x9F, 0xE5, 0x00, 0x08, 0xA0, 0x11, 0x20, 0x08, 0xA0, 0x11, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0x04, 0x10, 0x01, 0xE5, 0x04, 0x00, 0x94, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0x99, 0xF8, 0xFF, 0xEB, 0x02, 0x00, 0xA0, 0xE3, 0xD5, 0xF8, 0xFF, 0xEB
	.byte 0x4C, 0x00, 0x00, 0xEA, 0x38, 0x01, 0x9F, 0xE5, 0x20, 0x10, 0x90, 0xE5, 0x01, 0x00, 0x51, 0xE3
	.byte 0x1C, 0x00, 0x00, 0x1A, 0x00, 0x10, 0xA0, 0xE3, 0xBA, 0x13, 0xC0, 0xE1, 0xB8, 0x13, 0xC0, 0xE1
	.byte 0x3C, 0xE1, 0xFF, 0xEB, 0x00, 0x50, 0xA0, 0xE1, 0x40, 0x00, 0xA0, 0xE3, 0x35, 0xD8, 0xFF, 0xEB
	.byte 0x10, 0x11, 0x9F, 0xE5, 0x40, 0x00, 0xA0, 0xE3, 0x5C, 0x01, 0x00, 0xEB, 0x65, 0x01, 0x00, 0xEB
	.byte 0xFC, 0x10, 0x9F, 0xE5, 0x00, 0x21, 0x9F, 0xE5, 0xB4, 0x33, 0xD1, 0xE1, 0x05, 0x00, 0xA0, 0xE1
	.byte 0xB0, 0x30, 0xC2, 0xE1, 0xB6, 0x13, 0xD1, 0xE1, 0xC0, 0x10, 0x81, 0xE3, 0xB2, 0x10, 0xC2, 0xE1
	.byte 0x31, 0xE1, 0xFF, 0xEB, 0x04, 0x00, 0x94, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0x79, 0xF8, 0xFF, 0xEB, 0xC4, 0x00, 0x9F, 0xE5, 0x02, 0x10, 0xA0, 0xE3
	.byte 0x20, 0x10, 0x80, 0xE5, 0x2B, 0x00, 0x00, 0xEA, 0x02, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x03, 0x10, 0xA0, 0xE3, 0x71, 0xF8, 0xFF, 0xEB, 0x26, 0x00, 0x00, 0xEA, 0xA0, 0x00, 0x9F, 0xE5
	.byte 0x20, 0x10, 0x90, 0xE5, 0x03, 0x00, 0x41, 0xE2, 0x01, 0x00, 0x50, 0xE3, 0x19, 0x00, 0x00, 0x8A
	.byte 0x98, 0x10, 0x9F, 0xE5, 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0xC0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0x14, 0xE1, 0xFF, 0xEB, 0x00, 0x40, 0xA0, 0xE1, 0x40, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x36, 0x01, 0x00, 0xEB, 0x57, 0x01, 0x00, 0xEB, 0x04, 0x00, 0xA0, 0xE1, 0x12, 0xE1, 0xFF, 0xEB
	.byte 0x5C, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x20, 0x00, 0x90, 0xE5, 0x03, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x00, 0x1A, 0x42, 0x00, 0xA0, 0xE3, 0x58, 0xF8, 0xFF, 0xEB, 0x01, 0x00, 0x00, 0xEA
	.byte 0x51, 0x00, 0xA0, 0xE3, 0x55, 0xF8, 0xFF, 0xEB, 0x34, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x20, 0x10, 0x80, 0xE5, 0x07, 0x00, 0x00, 0xEA, 0x03, 0x00, 0x51, 0xE3, 0x03, 0x10, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x00, 0x1A, 0x42, 0x00, 0xA0, 0xE3, 0x4C, 0xF8, 0xFF, 0xEB, 0x01, 0x00, 0x00, 0xEA
	.byte 0x51, 0x00, 0xA0, 0xE3, 0x49, 0xF8, 0xFF, 0xEB, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x94, 0xFF, 0x7F, 0x02, 0xFC, 0xB1, 0x80, 0x03, 0x3C, 0x59, 0x80, 0x03, 0x0C, 0x01, 0x00, 0x04
	.byte 0x0E, 0x01, 0x00, 0x04, 0x08, 0x40, 0x2D, 0xE9, 0x0A, 0x00, 0x00, 0xEB, 0x1C, 0x30, 0x9F, 0xE5
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0x93, 0xE5, 0x40, 0x10, 0xA0, 0xE3, 0x40, 0x20, 0x82, 0xE3
	.byte 0x00, 0x20, 0x83, 0xE5, 0x00, 0x10, 0x80, 0xE5, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF8, 0xFF, 0x80, 0x03, 0x14, 0x02, 0x00, 0x04, 0xF0, 0x40, 0x2D, 0xE9, 0x84, 0x41, 0x9F, 0xE5
	.byte 0xB6, 0x52, 0xD4, 0xE1, 0x04, 0x00, 0x05, 0xE2, 0x04, 0x00, 0x50, 0xE3, 0xB8, 0x63, 0xD4, 0xE1
	.byte 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA, 0xBA, 0x73, 0xD4, 0xE1, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x60, 0x71, 0x9F, 0xE5, 0xAD, 0xF8, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x17, 0x00, 0x00, 0x1A, 0x02, 0x00, 0xA0, 0xE3, 0x55, 0xF8, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x13, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x05, 0xE2, 0x01, 0x00, 0x50, 0xE3, 0x08, 0x00, 0x00, 0x1A
	.byte 0xA5, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x15, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x00, 0x70, 0xA0, 0xE1, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA, 0x02, 0x79, 0x20, 0xE2
	.byte 0x07, 0x00, 0x00, 0xEA, 0x47, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x15, 0xE3, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x00, 0x70, 0xA0, 0xE1, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x80, 0x70, 0x20, 0xE2, 0x01, 0x00, 0x05, 0xE2, 0xF0, 0x30, 0x9F, 0xE5, 0x2C, 0x10, 0x94, 0xE5
	.byte 0x01, 0x00, 0x50, 0xE3, 0x06, 0x00, 0x00, 0x1A, 0x28, 0x20, 0x94, 0xE5, 0xB1, 0x70, 0xA2, 0xE1
	.byte 0x90, 0x23, 0x83, 0xE5, 0xE5, 0x3F, 0x83, 0xE2, 0xB0, 0x70, 0xC3, 0xE1, 0x02, 0x10, 0x81, 0xE2
	.byte 0x0D, 0x00, 0x00, 0xEA, 0xFF, 0x70, 0x07, 0xE2, 0x01, 0x00, 0x11, 0xE3, 0x02, 0x00, 0x00, 0x1A
	.byte 0x07, 0x60, 0xA0, 0xE1, 0x01, 0x10, 0x81, 0xE2, 0x07, 0x00, 0x00, 0xEA, 0x07, 0x04, 0x86, 0xE1
	.byte 0x28, 0x20, 0x94, 0xE5, 0x01, 0x10, 0x41, 0xE2, 0xB1, 0x00, 0xA2, 0xE1, 0x90, 0x23, 0x83, 0xE5
	.byte 0xE5, 0x3F, 0x83, 0xE2, 0xB0, 0x00, 0xC3, 0xE1, 0x02, 0x10, 0x81, 0xE2, 0xB8, 0x63, 0xC4, 0xE1
	.byte 0xBA, 0x73, 0xC4, 0xE1, 0x30, 0x00, 0x94, 0xE5, 0x00, 0x00, 0x51, 0xE1, 0x00, 0x00, 0x00, 0x2A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x00, 0x10, 0xA0, 0xE3, 0x2C, 0x10, 0x84, 0xE5, 0x17, 0x00, 0x00, 0x3A
	.byte 0xB4, 0x02, 0xD4, 0xE1, 0x10, 0x00, 0x00, 0xE2, 0x10, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x1A
	.byte 0x51, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3, 0xE4, 0xF7, 0xFF, 0xEB, 0x0F, 0x00, 0x00, 0xEA
	.byte 0x02, 0x00, 0xA0, 0xE3, 0x42, 0x10, 0xA0, 0xE3, 0x00, 0x20, 0xA0, 0xE3, 0x2C, 0xF8, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x1A, 0x51, 0x00, 0xA0, 0xE3, 0x04, 0x10, 0xA0, 0xE3
	.byte 0xDA, 0xF7, 0xFF, 0xEB, 0x05, 0x00, 0x00, 0xEA, 0x04, 0x00, 0xA0, 0xE3, 0x20, 0x00, 0x84, 0xE5
	.byte 0x1C, 0x10, 0x9F, 0xE5, 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0xC0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0xF0, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xFC, 0xB1, 0x80, 0x03, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0xFC, 0x7F, 0x02, 0x0E, 0x01, 0x00, 0x04, 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x21, 0x9F, 0xE5
	.byte 0xB0, 0x00, 0xD2, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0xF4, 0x10, 0x9F, 0xE5
	.byte 0xF4, 0x00, 0x9F, 0xE5, 0xB0, 0x10, 0xC2, 0xE1, 0xEC, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1
	.byte 0x02, 0x10, 0x40, 0xE2, 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A
	.byte 0x39, 0x00, 0x00, 0xEB, 0xD4, 0x20, 0x9F, 0xE5, 0xC4, 0x10, 0x9F, 0xE5, 0x00, 0x4C, 0xA0, 0xE1
	.byte 0xB0, 0x20, 0xC1, 0xE1, 0x34, 0x00, 0x00, 0xEB, 0xC4, 0x20, 0x9F, 0xE5, 0xC4, 0x10, 0x9F, 0xE5
	.byte 0x24, 0x08, 0x80, 0xE1, 0x01, 0x10, 0x00, 0xE0, 0x10, 0x00, 0x92, 0xE5, 0x81, 0x14, 0xA0, 0xE1
	.byte 0x21, 0x38, 0x80, 0xE0, 0x10, 0x30, 0x82, 0xE5, 0x0C, 0x00, 0x92, 0xE5, 0x01, 0x00, 0x80, 0xE2
	.byte 0x0C, 0x00, 0x82, 0xE5, 0x01, 0x0A, 0x50, 0xE3, 0x15, 0x00, 0x00, 0x3A, 0xD0, 0x40, 0xD2, 0xE1
	.byte 0x23, 0x06, 0xA0, 0xE1, 0x80, 0x00, 0x40, 0xE2, 0x00, 0x0C, 0xA0, 0xE1, 0x40, 0x0C, 0x54, 0xE1
	.byte 0x40, 0x0C, 0xA0, 0xE1, 0x0C, 0x00, 0x54, 0xB3, 0x01, 0x00, 0x84, 0xB2, 0x00, 0x00, 0xC2, 0xB5
	.byte 0x07, 0x00, 0x00, 0xBA, 0x04, 0x00, 0x50, 0xE1, 0x05, 0x00, 0x00, 0xAA, 0x0B, 0x00, 0xE0, 0xE3
	.byte 0x00, 0x00, 0x54, 0xE1, 0x58, 0x00, 0x9F, 0xC5, 0xD0, 0x20, 0xD0, 0xC1, 0x01, 0x20, 0x42, 0xC2
	.byte 0x00, 0x20, 0xC0, 0xC5, 0x48, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x0C, 0x20, 0x80, 0xE5
	.byte 0x10, 0x20, 0x80, 0xE5, 0x38, 0x00, 0x9F, 0xE5, 0xD0, 0x00, 0xD0, 0xE1, 0x21, 0x08, 0x60, 0xE0
	.byte 0xFF, 0x00, 0x50, 0xE3, 0xFF, 0x00, 0xA0, 0xC3, 0x01, 0x00, 0x00, 0xCA, 0x00, 0x00, 0x50, 0xE3
	.byte 0x00, 0x00, 0xA0, 0xB3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0x10, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xC0, 0x01, 0x00, 0x04, 0x01, 0x8A, 0x00, 0x00, 0xC2, 0x01, 0x00, 0x04
	.byte 0x01, 0x82, 0x00, 0x00, 0x38, 0xB2, 0x80, 0x03, 0x80, 0x7F, 0x00, 0x00, 0x24, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2, 0xB0, 0x00, 0xD1, 0xE1
	.byte 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x08, 0x00, 0x9F, 0xE5, 0xB0, 0x00, 0xD0, 0xE1
	.byte 0xFF, 0x00, 0x00, 0xE2, 0x1E, 0xFF, 0x2F, 0xE1, 0xC2, 0x01, 0x00, 0x04, 0x10, 0x40, 0x2D, 0xE9
	.byte 0x0C, 0x21, 0x9F, 0xE5, 0xB0, 0x00, 0xD2, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A
	.byte 0x00, 0x11, 0x9F, 0xE5, 0x00, 0x01, 0x9F, 0xE5, 0xB0, 0x10, 0xC2, 0xE1, 0xE4, 0x10, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2, 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3
	.byte 0xFC, 0xFF, 0xFF, 0x1A, 0xE4, 0xFF, 0xFF, 0xEB, 0xE0, 0x20, 0x9F, 0xE5, 0xD0, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x4C, 0xA0, 0xE1, 0xB0, 0x20, 0xC1, 0xE1, 0xDF, 0xFF, 0xFF, 0xEB, 0xD0, 0x30, 0x9F, 0xE5
	.byte 0xD0, 0x10, 0x9F, 0xE5, 0x24, 0x08, 0x80, 0xE1, 0x01, 0x20, 0x00, 0xE0, 0x04, 0x00, 0x93, 0xE5
	.byte 0x82, 0x28, 0xA0, 0xE1, 0x22, 0x48, 0x80, 0xE0, 0x04, 0x40, 0x83, 0xE5, 0x08, 0x00, 0x93, 0xE5
	.byte 0x01, 0x00, 0x80, 0xE2, 0x08, 0x00, 0x83, 0xE5, 0x01, 0x0C, 0x50, 0xE3, 0x17, 0x00, 0x00, 0x3A
	.byte 0x81, 0x00, 0xA0, 0xE1, 0x24, 0x04, 0x00, 0xE0, 0xF2, 0x40, 0xD3, 0xE1, 0x02, 0x09, 0x40, 0xE2
	.byte 0x00, 0x08, 0xA0, 0xE1, 0x40, 0x08, 0x54, 0xE1, 0x40, 0x18, 0xA0, 0xE1, 0x03, 0x0B, 0x54, 0xB3
	.byte 0x10, 0x00, 0x84, 0xB2, 0xB2, 0x00, 0xC3, 0xB1, 0x08, 0x00, 0x00, 0xBA, 0x04, 0x00, 0x51, 0xE1
	.byte 0x06, 0x00, 0x00, 0xAA, 0x03, 0x0B, 0xA0, 0xE3, 0x00, 0x00, 0x60, 0xE2, 0x00, 0x00, 0x54, 0xE1
	.byte 0x5C, 0x00, 0x9F, 0xC5, 0xF2, 0x10, 0xD0, 0xC1, 0x10, 0x10, 0x41, 0xC2, 0xB2, 0x10, 0xC0, 0xC1
	.byte 0x4C, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x08, 0x10, 0x80, 0xE5, 0x04, 0x10, 0x80, 0xE5
	.byte 0x3C, 0x10, 0x9F, 0xE5, 0x40, 0x00, 0x9F, 0xE5, 0xF2, 0x10, 0xD1, 0xE1, 0x22, 0x18, 0x61, 0xE0
	.byte 0x00, 0x00, 0x51, 0xE1, 0x00, 0x10, 0xA0, 0xC1, 0x01, 0x00, 0x00, 0xCA, 0x00, 0x00, 0x51, 0xE3
	.byte 0x00, 0x10, 0xA0, 0xB3, 0x01, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0x10, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xC0, 0x01, 0x00, 0x04, 0x01, 0x8A, 0x00, 0x00, 0xC2, 0x01, 0x00, 0x04
	.byte 0x01, 0x82, 0x00, 0x00, 0x38, 0xB2, 0x80, 0x03, 0xF8, 0x7F, 0x00, 0x00, 0xF0, 0xFF, 0x00, 0x00
	.byte 0x1C, 0x20, 0x9F, 0xE5, 0x00, 0x30, 0xA0, 0xE3, 0x01, 0x00, 0x10, 0xE3, 0x03, 0x11, 0x82, 0x17
	.byte 0x01, 0x30, 0x83, 0xE2, 0x19, 0x00, 0x53, 0xE3, 0xA0, 0x00, 0xA0, 0xE1, 0xF9, 0xFF, 0xFF, 0xBA
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0x74, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x48, 0x30, 0x9F, 0xE5
	.byte 0x48, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0x93, 0xE5, 0x00, 0x00, 0x52, 0xE1, 0x0C, 0x00, 0x00, 0x0A
	.byte 0x3C, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x10, 0x80, 0xE5, 0x5F, 0x1F, 0x43, 0xE2
	.byte 0x04, 0x10, 0x80, 0xE5, 0x40, 0x10, 0xA0, 0xE3, 0x08, 0x10, 0x80, 0xE5, 0x0C, 0x20, 0x80, 0xE5
	.byte 0xC0, 0xDF, 0xFF, 0xEB, 0x14, 0x20, 0x9F, 0xE5, 0x0C, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0x81, 0xE5
	.byte 0xC1, 0xDF, 0xFF, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xFC, 0xFF, 0x80, 0x03
	.byte 0x64, 0x5E, 0x80, 0x03, 0x4C, 0xB2, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x2C, 0x10, 0x9F, 0xE5
	.byte 0x2C, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5, 0x00, 0x00, 0x51, 0xE1, 0x05, 0x00, 0x00, 0x1A
	.byte 0xB0, 0xDF, 0xFF, 0xEB, 0x1C, 0x10, 0x9F, 0xE5, 0x10, 0x20, 0x9F, 0xE5, 0x0C, 0x10, 0x91, 0xE5
	.byte 0x00, 0x10, 0x82, 0xE5, 0xB0, 0xDF, 0xFF, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xFC, 0xFF, 0x80, 0x03, 0x64, 0x5E, 0x80, 0x03, 0x4C, 0xB2, 0x80, 0x03, 0x01, 0xC3, 0xA0, 0xE3
	.byte 0x82, 0x1F, 0x8C, 0xE2, 0xB0, 0x00, 0xD1, 0xE1, 0x00, 0x00, 0x10, 0xE1, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1, 0x10, 0x32, 0x9C, 0xE5, 0x14, 0x12, 0x9C, 0xE5
	.byte 0x03, 0x20, 0x11, 0xE0, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xE0, 0x01, 0x9F, 0xE5, 0x00, 0x00, 0x12, 0xE1, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x14, 0x22, 0x8C, 0xE5, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0200E0A0
sub_0200E0A0: ; 0x0200E0A0
	stmdb sp!, {lr}
	mrs r0, spsr
	stmdb sp!, {r0}
	stmdb sp, {sp, lr} ^
	sub sp, sp, #8
	mov r0, #0x9f
	msr cpsr_c, r0
	ldr r1, _0200E26C ; =0x038076A4
	ldrh r0, [r1, #2]
	add r0, r0, #1
	strh r0, [r1, #2]
	ldr r1, _0200E270 ; =0x0380B24C
	cmp r0, #1
	beq _0200E0DC
	b _0200E0E0
_0200E0DC:
	mov r0, sp
_0200E0E0:
	beq _0200E0E8
	b _0200E0EC
_0200E0E8:
	ldr sp, [r1, #4]
_0200E0EC:
	beq _0200E0F4
	b _0200E0F8
_0200E0F4:
	str r0, [r1, #4]
_0200E0F8:
	stmdb sp!, {r3}
	ldr r1, _0200E274 ; =0x03807210
	ldr r0, [r1]
	tst r0, r2
	bne _0200E110
	b _0200E114
_0200E110:
	str r0, [ip, #0x214]
_0200E114:
	bne _0200E11C
	b _0200E120
_0200E11C:
	ldr r0, [r1, #4]
_0200E120:
	bne _0200E128
	b _0200E12C
_0200E128:
	ldr r3, _0200E278 ; =0x038074F4
_0200E12C:
	bne _0200E134
	b _0200E138
_0200E134:
	ldr r0, [r3, r0, lsl #2]
_0200E138:
	bne _0200E1A8
	mov r3, #1
_0200E140:
	ldr r0, [r1, r3, lsl #3]
	tst r0, r2
	beq _0200E150
	b _0200E154
_0200E150:
	add r3, r3, #1
_0200E154:
	beq _0200E140
	str r0, [ip, #0x214]
	add r0, r1, r3, lsl #3
	ldr r2, [r0, #4]
	ldr r3, _0200E278 ; =0x038074F4
	ldr r0, [r3, r2, lsl #2]
	ldr r2, _0200E26C ; =0x038076A4
	ldrh r3, [r2, #2]
	cmp r3, #1
	beq _0200E180
	b _0200E184
_0200E180:
	ldr r2, [r1]
_0200E184:
	beq _0200E18C
	b _0200E190
_0200E18C:
	str r2, [ip, #0x210]
_0200E190:
	beq _0200E198
	b _0200E19C
_0200E198:
	mov r2, #0x1f
_0200E19C:
	beq _0200E1A4
	b _0200E1A8
_0200E1A4:
	msr cpsr_c, r2
_0200E1A8:
	ldr r1, [ip, #0x210]
	stmdb sp!, {r1}
	add lr, pc, #0x0 ; =0x0200E1B8
	bx r0
_0200E1B8:
	.byte 0x9F, 0x00, 0xA0, 0xE3, 0x00, 0xF0, 0x21, 0xE1
	.byte 0x01, 0xC3, 0xA0, 0xE3, 0x01, 0x00, 0xBD, 0xE8, 0x10, 0x12, 0x9C, 0xE5, 0x01, 0x20, 0x20, 0xE0
	.byte 0x01, 0x10, 0x02, 0xE0, 0x00, 0x00, 0x02, 0xE0, 0x08, 0x00, 0xBD, 0xE8, 0x01, 0x30, 0x83, 0xE1
	.byte 0x00, 0x30, 0xC3, 0xE1, 0x10, 0x32, 0x8C, 0xE5, 0x7C, 0x20, 0x9F, 0xE5, 0x7C, 0x30, 0x9F, 0xE5
	.byte 0xB2, 0x00, 0xD2, 0xE1, 0x01, 0x10, 0x50, 0xE2, 0xB2, 0x10, 0xC2, 0xE1, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x0D, 0x00, 0xA0, 0xE1, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x04, 0xD0, 0x93, 0xE5, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x04, 0x00, 0x83, 0xE5
	.byte 0x92, 0x00, 0xA0, 0xE3, 0x00, 0xF0, 0x21, 0xE1, 0x00, 0x60, 0xDD, 0xE8, 0x00, 0x00, 0xA0, 0xE1
	.byte 0x08, 0xD0, 0x8D, 0xE2, 0x01, 0x00, 0xBD, 0xE8, 0x00, 0xF0, 0x69, 0xE1, 0x01, 0x00, 0x11, 0xE1
	.byte 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA, 0x2C, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0xEA, 0x00, 0xE0, 0x8F, 0xE2, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEA
	.byte 0x10, 0xFF, 0x2F, 0xE1, 0x00, 0x80, 0xBD, 0xE8, 0xFF, 0x3F, 0xDF, 0x01
_0200E26C: .word 0x038076A4
_0200E270: .word 0x0380B24C
_0200E274: .word 0x03807210
_0200E278: .word 0x038074F4
	arm_func_end sub_0200E0A0
_0200E27C:
	.byte 0xF4, 0xB4, 0x7F, 0x03

	arm_func_start sub_0200E280
sub_0200E280: ; 0x0200E280
	stmdb sp!, {r3, lr}
	ldr r1, _0200E2B0 ; =0x0380B260
	mov r3, #0
	ldr r2, _0200E2B4 ; =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl sub_0200E2BC
	bl sub_02003DE4
	ldr r1, _0200E2B8 ; =0x0380B25C
	strh r0, [r1, #6]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200E2B0: .word 0x0380B260
_0200E2B4: .word 0x05000001
_0200E2B8: .word 0x0380B25C
	arm_func_end sub_0200E280

	arm_func_start sub_0200E2BC
sub_0200E2BC: ; 0x0200E2BC
	ldr ip, _0200E2C4 ; =sub_038037F8
	bx ip
	.align 2, 0
_0200E2C4: .word sub_038037F8
	arm_func_end sub_0200E2BC

	arm_func_start sub_0200E2C8
sub_0200E2C8: ; 0x0200E2C8
	stmdb sp!, {r3, lr}
	ldr r2, _0200E310 ; =0x027FFC30
	ldr r0, _0200E314 ; =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	beq _0200E308
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _0200E2F8
	bl sub_0200E318
_0200E2F8:
	ldr r0, _0200E310 ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
_0200E308:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200E310: .word 0x027FFC30
_0200E314: .word 0x0000FFFF
	arm_func_end sub_0200E2C8

	arm_func_start sub_0200E318
sub_0200E318: ; 0x0200E318
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _0200E430 ; =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	moveq r0, #0
	beq _0200E424
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	moveq r0, #0
	beq _0200E424
	ldr r0, _0200E434 ; =0x0380B25C
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_0200E4B8
	cmp r0, #0
	bne _0200E37C
	ldr r0, [sp, #0xc]
	bl sub_02005EFC
	mov r0, r4
	b _0200E424
_0200E37C:
	add r0, sp, #0
	bl sub_0200E43C
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _0200E3A8
	ldr r1, _0200E430 ; =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _0200E3EC
_0200E3A8:
	cmp r2, #0x96
	ldrne r1, _0200E430 ; =0x027FFC30
	ldrne r0, _0200E438 ; =0x0801FFFE
	ldrneh r1, [r1]
	ldrneh r0, [r0]
	cmpne r1, r0
	bne _0200E3EC
	ldr r2, _0200E430 ; =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _0200E400
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _0200E400
_0200E3EC:
	ldr r1, _0200E430 ; =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_0200E400:
	ldr r0, [sp]
	bl sub_0200E480
	ldr r0, [sp, #4]
	bl sub_0200E49C
	ldr r0, _0200E434 ; =0x0380B25C
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_0200E508
	mov r0, r4
_0200E424:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200E430: .word 0x027FFC30
_0200E434: .word 0x0380B25C
_0200E438: .word 0x0801FFFE
	arm_func_end sub_0200E318

	arm_func_start sub_0200E43C
sub_0200E43C: ; 0x0200E43C
	stmdb sp!, {r3, lr}
	ldr r2, _0200E47C ; =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	mov r1, r1, asr #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	mov r1, r1, asr #4
	str r1, [r0, #4]
	mov r0, #3
	bl sub_0200E480
	mov r0, #0
	bl sub_0200E49C
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200E47C: .word 0x04000204
	arm_func_end sub_0200E43C

	arm_func_start sub_0200E480
sub_0200E480: ; 0x0200E480
	ldr r2, _0200E498 ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0xc
	orr r0, r1, r0, lsl #2
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200E498: .word 0x04000204
	arm_func_end sub_0200E480

	arm_func_start sub_0200E49C
sub_0200E49C: ; 0x0200E49C
	ldr r2, _0200E4B4 ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0x10
	orr r0, r1, r0, lsl #4
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200E4B4: .word 0x04000204
	arm_func_end sub_0200E49C

	arm_func_start sub_0200E4B8
sub_0200E4B8: ; 0x0200E4B8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl sub_02005EE8
	str r0, [r4, #4]
	ldr r0, _0200E504 ; =0x027FFFE8
	bl sub_02003DDC
	ands r0, r0, #0x80
	str r0, [r4]
	bne _0200E4F0
	mov r0, r5
	bl sub_02003D6C
	cmp r0, #0
	bne _0200E4F8
_0200E4F0:
	mov r0, #1
	b _0200E4FC
_0200E4F8:
	mov r0, #0
_0200E4FC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200E504: .word 0x027FFFE8
	arm_func_end sub_0200E4B8

	arm_func_start sub_0200E508
sub_0200E508: ; 0x0200E508
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _0200E520
	bl sub_02003D60
_0200E520:
	ldr r0, [r4, #4]
	bl sub_02005EFC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0200E508

	arm_func_start sub_0200E530
sub_0200E530: ; 0x0200E530
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
	b _0200E550
_0200E548:
	mov r0, r6
	bl sub_02003BF4
_0200E550:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	bne _0200E548
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_0200E530

	arm_func_start sub_0200E570
sub_0200E570: ; 0x0200E570
	stmdb sp!, {r3, lr}
	bl sub_02005310
	bl sub_02005534
	ldr r0, _0200E5F8 ; =0x0380B294
	bl sub_02005588
	ldr r0, _0200E5FC ; =0x0380B264
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _0200E5F0
	mov r1, #1
	str r1, [r0, #0x14]
	bl sub_0200E280
	bl sub_02003DE4
	mvn r1, #2
	cmp r0, r1
	beq _0200E5F0
	ldr r1, _0200E5FC ; =0x0380B264
	strh r0, [r1]
	bl sub_0200649C
	ldr r1, _0200E600 ; =0x0380659C
	mov r0, #0xd
	bl sub_02006584
	bl sub_0200E610
	ldr r1, _0200E604 ; =0x038065CC
	mov r0, #0xd
	bl sub_02006584
	ldr r1, _0200E608 ; =0x03806600
	mov r0, #0x10
	bl sub_02006584
	ldr r1, _0200E60C ; =0x03806944
	mov r0, #0x11
	bl sub_02006584
_0200E5F0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200E5F8: .word 0x0380B294
_0200E5FC: .word 0x0380B264
_0200E600: .word 0x0380659C
_0200E604: .word 0x038065CC
_0200E608: .word 0x03806600
_0200E60C: .word 0x03806944
	arm_func_end sub_0200E570

	arm_func_start sub_0200E610
sub_0200E610: ; 0x0200E610
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0200E76C ; =0x0380B264
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0200E764
	ldr r1, _0200E770 ; =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0, #8]
	tst r1, #1
	beq _0200E764
	mov r0, #0x40000
	bl sub_02003A8C
	ldr r2, _0200E774 ; =0x04000208
	mov r1, #1
	ldrh sb, [r2]
	ldr r5, _0200E76C ; =0x0380B264
	mov r4, r0
	strh r1, [r2]
	mov r6, #0x100
	b _0200E66C
_0200E664:
	mov r0, r6
	bl sub_02003BF4
_0200E66C:
	ldr r0, [r5, #0x28]
	cmp r0, #1
	bne _0200E664
	ldr r0, _0200E76C ; =0x0380B264
	mov r1, #0x8000000
	ldr r2, [r0, #0x18]
	ldr r0, _0200E778 ; =0x01FFFFC0
	add r8, r1, #4
	and r0, r2, r0
	mov r0, r0, lsr #6
	mov r0, r0, lsl #5
	add r5, r0, #0x2000000
	mov r6, #1
	bl sub_02003DE4
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r0, r7
	bl sub_02003CF0
	ldr ip, _0200E77C ; =0x0000FFFF
	mov sl, #0
	eor r0, ip, #3
	eor r1, ip, #0x84
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r3, r1, lsr #0x10
	b _0200E714
_0200E6D8:
	mov lr, ip
	cmp sl, #0x4c
	moveq lr, r3
	beq _0200E6F0
	cmp sl, #0x4d
	moveq lr, r2
_0200E6F0:
	add r0, r5, sl, lsl #1
	mov r1, sl, lsl #1
	ldrh r0, [r0, #4]
	ldrh r1, [r8, r1]
	and r0, lr, r0
	cmp r0, r1
	movne r6, #0
	bne _0200E71C
	add sl, sl, #1
_0200E714:
	cmp sl, #0x4e
	blt _0200E6D8
_0200E71C:
	mov r0, r7
	bl sub_02003D60
	mov r0, r7
	bl sub_02003E8C
	ldr r2, _0200E780 ; =0x027FFC30
	and r0, r6, #0xff
	ldrb r1, [r2, #5]
	and r0, r0, #1
	bic r1, r1, #1
	orr r1, r1, r0
	mov r0, #1
	strb r1, [r2, #5]
	bl sub_0200E530
	ldr r2, _0200E774 ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh sb, [r2]
	bl sub_02003A8C
_0200E764:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0200E76C: .word 0x0380B264
_0200E770: .word 0x04000300
_0200E774: .word 0x04000208
_0200E778: .word 0x01FFFFC0
_0200E77C: .word 0x0000FFFF
_0200E780: .word 0x027FFC30
	arm_func_end sub_0200E610

	arm_func_start sub_0200E784
sub_0200E784: ; 0x0200E784
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	ldreq r0, _0200E7B0 ; =0x0380B264
	moveq r2, #1
	streq r1, [r0, #0x18]
	streq r2, [r0, #0x28]
	beq _0200E7A8
	bl sub_02006058
_0200E7A8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200E7B0: .word 0x0380B264
	arm_func_end sub_0200E784

	arm_func_start sub_0200E7B4
sub_0200E7B4: ; 0x0200E7B4
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #2
	bne _0200E7DC
	mov r0, #0
	bl sub_0200E7F8
	bl sub_020068F0
	bl sub_0200D474
	bl sub_02006058
	b _0200E7E0
_0200E7DC:
	bl sub_02006058
_0200E7E0:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0200E7B4
_0200E7E8:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE1
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0x10, 0x66, 0x80, 0x03

	arm_func_start sub_0200E7F8
sub_0200E7F8: ; 0x0200E7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r5, r0
	beq _0200E834
	ldr r0, [r5]
	cmp r0, #0
	bne _0200E834
	ldr r0, [r5, #0x44]
	add r0, r0, #1
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x40]
	cmp r1, #0
	beq _0200E834
	ldr r0, [r5, #0x44]
	cmp r0, r1
	movhi r5, #0
_0200E834:
	cmp r5, #0
	ldrne r0, [r5, #0x3c]
	cmpne r0, #0
	bne _0200E8D8
	bl sub_02005EE8
	ldr r4, _0200EA14 ; =0x0380B264
	mov sb, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _0200E8C4
	mov sl, #0
	ldr r7, _0200EA18 ; =0x027FFFE8
	ldr r5, _0200EA1C ; =0x08001000
	mov r6, sl
	mov fp, #1
	b _0200E8BC
_0200E874:
	mov r0, r7
	bl sub_02003DDC
	ands r8, r0, #0x80
	bne _0200E894
	ldrh r0, [r4]
	bl sub_02003D6C
	cmp r0, #0
	bne _0200E8B4
_0200E894:
	str r6, [r4, #4]
	mov sl, fp
	strh r6, [r5]
	cmp r8, #0
	bne _0200E8BC
	ldrh r0, [r4]
	bl sub_02003D40
	b _0200E8BC
_0200E8B4:
	ldr r0, _0200EA20 ; =0x000080E8
	bl sub_02005F4C
_0200E8BC:
	cmp sl, #0
	beq _0200E874
_0200E8C4:
	ldr r0, _0200EA24 ; =0x0380B294
	bl sub_020057A8
	mov r0, sb
	bl sub_02005EFC
	b _0200EA0C
_0200E8D8:
	cmp r5, #0
	beq _0200EA0C
	ldr r0, _0200EA18 ; =0x027FFFE8
	bl sub_02003DDC
	ands r4, r0, #0x80
	bne _0200E904
	ldr r0, _0200EA14 ; =0x0380B264
	ldrh r0, [r0]
	bl sub_02003D6C
	cmp r0, #0
	bne _0200E9F4
_0200E904:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _0200E94C
	ldr r0, _0200EA14 ; =0x0380B264
	mov r2, #0
	ldr r1, _0200EA1C ; =0x08001000
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5, #8]
	ldr r0, _0200EA24 ; =0x0380B294
	ldr r3, _0200EA28 ; =0x03806610
	mov r2, #0
	bl sub_020056C4
	mov r0, #0
	str r0, [r5]
	b _0200E9DC
_0200E94C:
	tst r1, #1
	ldr r1, _0200EA1C ; =0x08001000
	beq _0200E99C
	ldr r0, _0200EA14 ; =0x0380B264
	mov r2, #0
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _0200EA24 ; =0x0380B294
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0x24]
	ldr r3, _0200EA28 ; =0x03806610
	mov r2, #0
	bl sub_020056C4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0200E9DC
_0200E99C:
	ldr r0, _0200EA14 ; =0x0380B264
	mov r2, #2
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _0200EA24 ; =0x0380B294
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0xc]
	ldr r3, _0200EA28 ; =0x03806610
	mov r2, #0
	bl sub_020056C4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0200E9DC:
	cmp r4, #0
	bne _0200EA0C
	ldr r0, _0200EA14 ; =0x0380B264
	ldrh r0, [r0]
	bl sub_02003D40
	b _0200EA0C
_0200E9F4:
	ldr r0, _0200EA24 ; =0x0380B294
	ldr r1, _0200EA2C ; =0x0000020B
	ldr r3, _0200EA28 ; =0x03806610
	mov r2, #0
	str r5, [sp]
	bl sub_020056C4
_0200EA0C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200EA14: .word 0x0380B264
_0200EA18: .word 0x027FFFE8
_0200EA1C: .word 0x08001000
_0200EA20: .word 0x000080E8
_0200EA24: .word 0x0380B294
_0200EA28: .word 0x03806610
_0200EA2C: .word 0x0000020B
	arm_func_end sub_0200E7F8

	arm_func_start sub_0200EA30
sub_0200EA30: ; 0x0200EA30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0200EB20 ; =0x03807600
	mvn r0, #0
	ldr r3, [r1, #4]
	cmp r3, r0
	ldreq r0, _0200EB24 ; =0x027FFC3C
	ldreq r0, [r0]
	addeq r0, r0, #0xa
	streq r0, [r1, #4]
	beq _0200EB18
	ldr r0, _0200EB28 ; =0x0380B264
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _0200EB18
	ldr r2, _0200EB24 ; =0x027FFC3C
	ldr r0, [r2]
	cmp r0, r3
	blo _0200EB18
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1, #4]
	bl sub_0200E2C8
	ldr r1, _0200EB28 ; =0x0380B264
	str r0, [r1, #0xc]
	bl sub_0200E318
	cmp r0, #0
	bne _0200EAC8
	ldr r0, _0200EB20 ; =0x03807600
	mov r1, #1
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, _0200EB28 ; =0x0380B264
	strne r1, [r0, #0x10]
	bne _0200EB18
	ldr r0, _0200EB28 ; =0x0380B264
	str r1, [r0, #0xc]
_0200EAC8:
	ldr r0, _0200EB28 ; =0x0380B264
	ldr r1, _0200EB20 ; =0x03807600
	ldr r0, [r0, #0xc]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _0200EB18
	mov r7, #0x64
	mov r6, #0xd
	mov r5, #0x11
	mov r4, r2
	b _0200EB00
_0200EAF8:
	mov r0, r7
	bl sub_02004650
_0200EB00:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	bne _0200EAF8
_0200EB18:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200EB20: .word 0x03807600
_0200EB24: .word 0x027FFC3C
_0200EB28: .word 0x0380B264
	arm_func_end sub_0200EA30

	arm_func_start sub_0200EB2C
sub_0200EB2C: ; 0x0200EB2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	and r0, r1, #0x3f
	cmp r0, #3
	bne _0200EB94
	ldr r3, _0200EBA0 ; =0x04000204
	ldr r0, _0200EBA4 ; =0x01FFFFC0
	ldrh r2, [r3]
	and r0, r1, r0
	mov r1, r0, lsr #6
	bic r0, r2, #0x60
	orr r0, r0, r1, lsl #5
	strh r0, [r3]
	mov r7, #1
	mov r6, #0x11
	mov r5, #0x12
	mov r4, #0
	b _0200EB78
_0200EB70:
	mov r0, r7
	bl sub_02003BF4
_0200EB78:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	bne _0200EB70
	b _0200EB98
_0200EB94:
	bl sub_02006058
_0200EB98:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200EBA0: .word 0x04000204
_0200EBA4: .word 0x01FFFFC0
	arm_func_end sub_0200EB2C
_0200EBA8:
	.byte 0xF0, 0x58, 0x2D, 0xE9, 0x01, 0x40, 0xA0, 0xE1
	.byte 0x01, 0x40, 0x84, 0xE3, 0x03, 0x00, 0x00, 0xEA

	arm_func_start sub_0200EBB8
sub_0200EBB8: ; 0x0200EBB8
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
	orrs r5, r3, r2
	bne _0200EBD8
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0200EBD8:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _0200EC0C
	mov r1, r2
	bl sub_0200EDB0
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0200EC0C:
	cmp r1, #0
	bge _0200EC1C
	rsbs r0, r0, #0
	rsc r1, r1, #0
_0200EC1C:
	cmp r3, #0
	bge _0200EC2C
	rsbs r2, r2, #0
	rsc r3, r3, #0
_0200EC2C:
	orrs r5, r1, r0
	beq _0200ED50
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _0200EC58
_0200EC44:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _0200EC44
	add r6, r6, r5
_0200EC58:
	cmp r1, #0
	blt _0200EC78
_0200EC60:
	cmp r6, #1
	beq _0200EC78
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _0200EC60
_0200EC78:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _0200ECA0
_0200EC88:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _0200ECF8
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_0200ECA0:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _0200EC88
_0200ECBC:
	subs r6, r6, #1
	beq _0200ECF0
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _0200EC88
	b _0200ECBC
_0200ECF0:
	adds r0, r0, r2
	adc r1, r1, r3
_0200ECF8:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _0200ED30
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _0200ED54
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _0200ED30
_0200ED28:
	.byte 0x31, 0x07, 0xA0, 0xE1, 0x00, 0x10, 0xA0, 0xE3
_0200ED30:
	cmp r4, #0
	blt _0200ED40
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0200ED40:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0200ED50:
	mov r0, #0
_0200ED54:
	mov r1, #0
	cmp r4, #0
	blt _0200ED40
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end sub_0200EBB8

	arm_func_start sub_0200ED68
sub_0200ED68: ; 0x0200ED68
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _0200ED7C
_0200ED74:
	.byte 0xF0, 0x58, 0x2D, 0xE9, 0x01, 0x40, 0xA0, 0xE3
_0200ED7C:
	orrs r5, r3, r2
	bne _0200ED8C
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0200ED8C:
	orrs r5, r1, r3
	bne _0200EC2C
	mov r1, r2
	bl sub_0200EFC4
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end sub_0200ED68

	arm_func_start sub_0200EDB0
sub_0200EDB0: ; 0x0200EDB0
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _0200EFA8
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _0200EFA8
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
_0200EFA8:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr
	arm_func_end sub_0200EDB0

	arm_func_start sub_0200EFBC
sub_0200EFBC: ; 0x0200EFBC
	cmp r1, #0
	bxeq lr
	arm_func_end sub_0200EFBC

	arm_func_start sub_0200EFC4
sub_0200EFC4: ; 0x0200EFC4
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	bxlo lr
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
	bx lr
	arm_func_end sub_0200EFC4
_0200F1A0:
	.byte 0x00, 0x06, 0x0C, 0x13, 0x19, 0x1F, 0x25, 0x2B, 0x31, 0x36, 0x3C, 0x41, 0x47, 0x4C, 0x51, 0x55
	.byte 0x5A, 0x5E, 0x62, 0x66, 0x6A, 0x6D, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7B, 0x7D, 0x7E, 0x7E, 0x7F
	.byte 0x7F, 0x00, 0x00, 0x00, 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD
	.byte 0xEE, 0xFD, 0x09, 0xFE, 0x20, 0xFE, 0x34, 0xFE, 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE
	.byte 0x81, 0xFE, 0x8D, 0xFE, 0x98, 0xFE, 0xA3, 0xFE, 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE
	.byte 0xCF, 0xFE, 0xD7, 0xFE, 0xDF, 0xFE, 0xE6, 0xFE, 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE
	.byte 0x05, 0xFF, 0x0B, 0xFF, 0x11, 0xFF, 0x16, 0xFF, 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF
	.byte 0x2E, 0xFF, 0x33, 0xFF, 0x37, 0xFF, 0x3C, 0xFF, 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF
	.byte 0x50, 0xFF, 0x53, 0xFF, 0x57, 0xFF, 0x5B, 0xFF, 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF
	.byte 0x6B, 0xFF, 0x6F, 0xFF, 0x72, 0xFF, 0x75, 0xFF, 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF
	.byte 0x83, 0xFF, 0x86, 0xFF, 0x89, 0xFF, 0x8C, 0xFF, 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF
	.byte 0x99, 0xFF, 0x9B, 0xFF, 0x9D, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF
	.byte 0xAB, 0xFF, 0xAE, 0xFF, 0xB0, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF
	.byte 0xBC, 0xFF, 0xBE, 0xFF, 0xC0, 0xFF, 0xC2, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF
	.byte 0xCC, 0xFF, 0xCE, 0xFF, 0xCF, 0xFF, 0xD1, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF
	.byte 0xDA, 0xFF, 0xDC, 0xFF, 0xDD, 0xFF, 0xDF, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF
	.byte 0xE7, 0xFF, 0xE9, 0xFF, 0xEA, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF
	.byte 0xF3, 0xFF, 0xF5, 0xFF, 0xF6, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x5B, 0xFE, 0x97, 0xFE, 0xBB, 0xFE, 0xD4, 0xFE, 0xE7, 0xFE
	.byte 0xF7, 0xFE, 0x04, 0xFF, 0x10, 0xFF, 0x1A, 0xFF, 0x23, 0xFF, 0x2C, 0xFF, 0x33, 0xFF, 0x3A, 0xFF
	.byte 0x40, 0xFF, 0x46, 0xFF, 0x4C, 0xFF, 0x51, 0xFF, 0x56, 0xFF, 0x5B, 0xFF, 0x5F, 0xFF, 0x64, 0xFF
	.byte 0x68, 0xFF, 0x6C, 0xFF, 0x6F, 0xFF, 0x73, 0xFF, 0x76, 0xFF, 0x7A, 0xFF, 0x7D, 0xFF, 0x80, 0xFF
	.byte 0x83, 0xFF, 0x86, 0xFF, 0x88, 0xFF, 0x8B, 0xFF, 0x8E, 0xFF, 0x90, 0xFF, 0x92, 0xFF, 0x95, 0xFF
	.byte 0x97, 0xFF, 0x99, 0xFF, 0x9C, 0xFF, 0x9E, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA4, 0xFF, 0xA6, 0xFF
	.byte 0xA8, 0xFF, 0xAA, 0xFF, 0xAB, 0xFF, 0xAD, 0xFF, 0xAF, 0xFF, 0xB1, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF
	.byte 0xB6, 0xFF, 0xB7, 0xFF, 0xB9, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBD, 0xFF, 0xBF, 0xFF, 0xC0, 0xFF
	.byte 0xC2, 0xFF, 0xC3, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC7, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCB, 0xFF
	.byte 0xCC, 0xFF, 0xCD, 0xFF, 0xCF, 0xFF, 0xD0, 0xFF, 0xD1, 0xFF, 0xD2, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF
	.byte 0xD6, 0xFF, 0xD7, 0xFF, 0xD8, 0xFF, 0xD9, 0xFF, 0xDA, 0xFF, 0xDB, 0xFF, 0xDC, 0xFF, 0xDD, 0xFF
	.byte 0xDE, 0xFF, 0xDF, 0xFF, 0xE0, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE3, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF
	.byte 0xE6, 0xFF, 0xE7, 0xFF, 0xE8, 0xFF, 0xE9, 0xFF, 0xE9, 0xFF, 0xEA, 0xFF, 0xEB, 0xFF, 0xEC, 0xFF
	.byte 0xED, 0xFF, 0xEE, 0xFF, 0xEF, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF1, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF
	.byte 0xF4, 0xFF, 0xF4, 0xFF, 0xF5, 0xFF, 0xF6, 0xFF, 0xF7, 0xFF, 0xF7, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF
	.byte 0xFA, 0xFF, 0xFA, 0xFF, 0xFB, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x02, 0x04, 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x0E, 0x0C, 0x0F, 0x0D, 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F
	.byte 0x49, 0x54, 0x5C, 0x64, 0x6D, 0x74, 0x7B, 0x7F, 0x84, 0x89, 0x8F, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0xC7, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x01, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x00, 0x17, 0x00, 0x00, 0x00, 0x01, 0xC3, 0xA0, 0xE3, 0x08, 0xC2, 0x8C, 0xE5
	.byte 0x58, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0x81, 0xE5, 0x50, 0x10, 0x9F, 0xE5
	.byte 0x01, 0x0C, 0xA0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1, 0xB0, 0x00, 0xD1, 0xE1, 0x0F, 0x00, 0x00, 0xE2
	.byte 0x01, 0x00, 0x50, 0xE3, 0xFB, 0xFF, 0xFF, 0x1A, 0x34, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xB0, 0x00, 0xC1, 0xE1, 0xB0, 0x00, 0xD1, 0xE1, 0x01, 0x00, 0x50, 0xE3, 0xFC, 0xFF, 0xFF, 0x0A
	.byte 0x20, 0x30, 0x9F, 0xE5, 0x34, 0xC0, 0x93, 0xE5, 0x0C, 0xE0, 0xA0, 0xE1, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x20, 0xA0, 0xE3, 0x00, 0x30, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xFC, 0xFF, 0x80, 0x03, 0x80, 0x01, 0x00, 0x04, 0x00, 0xFE, 0x7F, 0x02, 0xF8, 0x40, 0x2D, 0xE9
	.byte 0x00, 0x70, 0xA0, 0xE1, 0x01, 0x6C, 0xA0, 0xE3, 0x0A, 0x50, 0xA0, 0xE3, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x01, 0x00, 0x00, 0xEA, 0x06, 0x00, 0xA0, 0xE1, 0xAD, 0xD1, 0xFF, 0xEB, 0x05, 0x00, 0xA0, 0xE1
	.byte 0x07, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1, 0x2A, 0xDC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0xF7, 0xFF, 0xFF, 0xBA, 0x08, 0x00, 0x9F, 0xE5, 0x65, 0xD5, 0xFF, 0xEB, 0xF8, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xA0, 0x8D, 0x7F, 0x02, 0x38, 0x40, 0x2D, 0xE9, 0x3C, 0x00, 0x9F, 0xE5
	.byte 0x3E, 0xD5, 0xFF, 0xEB, 0x38, 0x40, 0x9F, 0xE5, 0x01, 0x5C, 0xA0, 0xE3, 0x01, 0x00, 0x00, 0xEA
	.byte 0x05, 0x00, 0xA0, 0xE1, 0x9A, 0xD1, 0xFF, 0xEB, 0xB0, 0x10, 0xD4, 0xE1, 0x01, 0x00, 0x11, 0xE3
	.byte 0xFA, 0xFF, 0xFF, 0x1A, 0x1C, 0x00, 0x9F, 0xE5, 0x01, 0x10, 0x81, 0xE3, 0xB0, 0x10, 0xC4, 0xE1
	.byte 0x4C, 0x05, 0x90, 0xE5, 0x08, 0x00, 0x90, 0xE5, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xA0, 0x8D, 0x7F, 0x02, 0x96, 0xFF, 0x7F, 0x02, 0x78, 0x88, 0x7F, 0x02, 0x70, 0x40, 0x2D, 0xE9
	.byte 0xFC, 0x10, 0x9F, 0xE5, 0x01, 0x00, 0x00, 0xE0, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x28, 0xB0, 0xE1
	.byte 0x00, 0x00, 0xA0, 0x03, 0x38, 0x00, 0x00, 0x0A, 0x00, 0x10, 0xA0, 0xE3, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x00, 0xEA, 0x10, 0x01, 0x12, 0xE1, 0x02, 0x00, 0x00, 0x1A, 0x01, 0x10, 0x81, 0xE2
	.byte 0x10, 0x00, 0x51, 0xE3, 0xFA, 0xFF, 0xFF, 0xBA, 0x0F, 0x00, 0xA0, 0xE3, 0x01, 0x30, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x00, 0xEA, 0x13, 0x00, 0x12, 0xE1, 0x02, 0x00, 0x00, 0x1A, 0x01, 0x00, 0x40, 0xE2
	.byte 0x00, 0x00, 0x50, 0xE3, 0xFA, 0xFF, 0xFF, 0x1A, 0x01, 0x60, 0x40, 0xE0, 0x05, 0x00, 0x56, 0xE3
	.byte 0x01, 0x00, 0xA0, 0xB3, 0x10, 0x01, 0xA0, 0xB1, 0x00, 0x08, 0xA0, 0xB1, 0x20, 0x08, 0xA0, 0xB1
	.byte 0x21, 0x00, 0x00, 0xBA, 0x01, 0x30, 0x80, 0xE0, 0xA3, 0x3F, 0x83, 0xE0, 0xC3, 0x40, 0xA0, 0xE1
	.byte 0x00, 0x50, 0xA0, 0xE3, 0x01, 0xE0, 0xA0, 0xE3, 0x08, 0x00, 0x00, 0xEA, 0xA5, 0xCF, 0xA0, 0xE1
	.byte 0x85, 0x3F, 0x6C, 0xE0, 0xE3, 0x3F, 0x8C, 0xE0, 0x83, 0x30, 0xA0, 0xE1, 0x01, 0x30, 0x43, 0xE2
	.byte 0x95, 0x43, 0x24, 0xE0, 0x1E, 0x04, 0x12, 0xE1, 0x02, 0x00, 0x00, 0x1A, 0x01, 0x50, 0x85, 0xE2
	.byte 0x06, 0x00, 0x55, 0xE1, 0xF4, 0xFF, 0xFF, 0xBA, 0x04, 0x20, 0x40, 0xE0, 0x05, 0x00, 0x52, 0xE3
	.byte 0x01, 0x20, 0x44, 0xA0, 0x05, 0x00, 0x52, 0xA3, 0x05, 0x00, 0x00, 0xAA, 0x01, 0x20, 0xA0, 0xE3
	.byte 0x12, 0x00, 0xA0, 0xE1, 0x12, 0x01, 0x80, 0xE1, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x05, 0x00, 0x00, 0xEA, 0x01, 0x30, 0xA0, 0xE3, 0x13, 0x24, 0xA0, 0xE1, 0x13, 0x00, 0x82, 0xE1
	.byte 0x13, 0x01, 0x80, 0xE1, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0x70, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xFF, 0x1F, 0x00, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0xB7, 0x7F, 0x03
	.byte 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x08, 0xB7, 0x7F, 0x03, 0x18, 0xB7, 0x7F, 0x03
	.byte 0x28, 0xB7, 0x7F, 0x03, 0x38, 0xB7, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0xC8, 0xB6, 0x7F, 0x03
	.byte 0xD8, 0xB6, 0x7F, 0x03, 0xE8, 0xB6, 0x7F, 0x03, 0xF8, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03
	.byte 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03
	.byte 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03
	.byte 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03, 0x38, 0xB6, 0x7F, 0x03
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x78, 0x56, 0x34, 0x12, 0x00, 0xFE, 0x7F, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA
	.byte 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x08, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE3, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xF0, 0xF0, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3E, 0xF8
	.byte 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x0C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC0, 0xFF, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF
	.byte 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x20, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xC3, 0x28, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x38, 0x40, 0x2D, 0xE9, 0x08, 0xD0, 0x4D, 0xE2, 0x01, 0x40, 0xA0, 0xE1, 0x00, 0x10, 0x94, 0xE5
	.byte 0x74, 0x31, 0x9F, 0xE5, 0x00, 0x50, 0xA0, 0xE1, 0x40, 0x15, 0x83, 0xE5, 0x24, 0x10, 0x95, 0xE5
	.byte 0x68, 0x01, 0x9F, 0xE5, 0x44, 0x15, 0x83, 0xE5, 0x28, 0x20, 0x95, 0xE5, 0x60, 0x11, 0x9F, 0xE5
	.byte 0x48, 0x25, 0x83, 0xE5, 0x00, 0xC0, 0xA0, 0xE3, 0x4C, 0xC5, 0x83, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0x50, 0xC5, 0x83, 0xE5, 0x98, 0x71, 0x40, 0xEB, 0x48, 0x01, 0x9F, 0xE5, 0x48, 0x11, 0x9F, 0xE5
	.byte 0x04, 0x20, 0xA0, 0xE3, 0x94, 0x71, 0x40, 0xEB, 0x40, 0x01, 0x9F, 0xE5, 0x40, 0x11, 0x9F, 0xE5
	.byte 0x04, 0x20, 0xA0, 0xE3, 0x90, 0x71, 0x40, 0xEB, 0x38, 0x01, 0x9F, 0xE5, 0x38, 0x11, 0x9F, 0xE5
	.byte 0x20, 0x20, 0xA0, 0xE3, 0x8C, 0x71, 0x40, 0xEB, 0x10, 0x11, 0x9F, 0xE5, 0x14, 0x01, 0x9F, 0xE5
	.byte 0x10, 0x10, 0x85, 0xE5, 0x14, 0x00, 0x85, 0xE5, 0x08, 0x20, 0x94, 0xE5, 0xF8, 0x10, 0x9F, 0xE5
	.byte 0x18, 0x01, 0x9F, 0xE5, 0x78, 0x25, 0x81, 0xE5, 0x18, 0x20, 0x94, 0xE5, 0x7C, 0x25, 0x81, 0xE5
	.byte 0x10, 0x20, 0x94, 0xE5, 0x80, 0x25, 0x81, 0xE5, 0x04, 0x20, 0x94, 0xE5, 0x84, 0x25, 0x81, 0xE5
	.byte 0x14, 0x20, 0x94, 0xE5, 0x88, 0x25, 0x81, 0xE5, 0x0C, 0x20, 0x94, 0xE5, 0x8C, 0x25, 0x81, 0xE5
	.byte 0xEA, 0x71, 0x40, 0xEB, 0x01, 0x0B, 0xA0, 0xE3, 0x00, 0x00, 0x8D, 0xE5, 0x04, 0x10, 0x94, 0xE5
	.byte 0xDC, 0x00, 0x9F, 0xE5, 0x04, 0x10, 0x8D, 0xE5, 0xD8, 0x10, 0x9F, 0xE5, 0xCC, 0x30, 0x9F, 0xE5
	.byte 0x00, 0x20, 0xA0, 0xE3, 0xDA, 0x6F, 0x40, 0xEB, 0xC4, 0x00, 0x9F, 0xE5, 0x9E, 0x70, 0x40, 0xEB
	.byte 0x01, 0x0A, 0xA0, 0xE3, 0x00, 0x00, 0x8D, 0xE5, 0x0C, 0x10, 0x94, 0xE5, 0xB8, 0x00, 0x9F, 0xE5
	.byte 0x04, 0x10, 0x8D, 0xE5, 0xB4, 0x10, 0x9F, 0xE5, 0xB4, 0x30, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3
	.byte 0xCF, 0x6F, 0x40, 0xEB, 0xA0, 0x00, 0x9F, 0xE5, 0x93, 0x70, 0x40, 0xEB, 0x00, 0x30, 0xA0, 0xE3
	.byte 0x68, 0x10, 0x9F, 0xE5, 0x03, 0x20, 0xA0, 0xE1, 0x03, 0x00, 0x81, 0xE0, 0x01, 0x0A, 0x80, 0xE2
	.byte 0x01, 0x30, 0x83, 0xE2, 0x54, 0x25, 0xC0, 0xE5, 0x20, 0x00, 0x53, 0xE3, 0xF9, 0xFF, 0xFF, 0xBA
	.byte 0x44, 0x00, 0x9F, 0xE5, 0x74, 0x25, 0x80, 0xE5, 0x92, 0x75, 0x40, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x00, 0x00, 0x00, 0x1A, 0x7C, 0x75, 0x40, 0xEB, 0x55, 0x78, 0x40, 0xEB, 0x64, 0x10, 0x9F, 0xE5
	.byte 0x0A, 0x00, 0xA0, 0xE3, 0x8C, 0x78, 0x40, 0xEB, 0x02, 0x00, 0xA0, 0xE3, 0x18, 0x00, 0x85, 0xE5
	.byte 0x14, 0x10, 0x94, 0xE5, 0x05, 0x00, 0xA0, 0xE1, 0x0C, 0x10, 0x85, 0xE5, 0x17, 0x22, 0x00, 0xEB
	.byte 0x08, 0xD0, 0x8D, 0xE2, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x78, 0x88, 0x7F, 0x02
	.byte 0x78, 0x78, 0x7F, 0x02, 0x98, 0x78, 0x7F, 0x02, 0xA0, 0x78, 0x7F, 0x02, 0xC0, 0x78, 0x7F, 0x02
	.byte 0xD0, 0x78, 0x7F, 0x02, 0xF0, 0x78, 0x7F, 0x02, 0x00, 0x79, 0x7F, 0x02, 0x20, 0x79, 0x7F, 0x02
	.byte 0xA0, 0x8D, 0x7F, 0x02, 0x64, 0xB3, 0x80, 0x03, 0x98, 0x08, 0x7E, 0x02, 0xC0, 0xB2, 0x80, 0x03
	.byte 0xC0, 0x1C, 0x7E, 0x02, 0xA0, 0x89, 0x7F, 0x02, 0x44, 0x02, 0x7E, 0x02

	arm_func_start sub_0200F9BC
sub_0200F9BC: ; 0x0200F9BC
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _0200FA2C ; =0x027F7878
	mov r2, #1
	bl sub_0302BEC4
	ldr r0, _0200FA30 ; =0x027F78D0
	add r1, sp, #0
	mov r2, #1
	bl sub_0302BF50
	ldr r1, [sp]
	ldrh r0, [r1, #0xe]
	add r0, r1, r0, lsl #1
	ldrh r0, [r0, #0x14]
	cmp r0, #0xe
	bne _0200FA20
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0x13
	strh r1, [r0, #2]
	mov r1, #0x18
	strh r1, [r0, #4]
	bl sub_03036B24
	bl sub_0302DEF8
	bl sub_0302D660
_0200FA20:
	ldr r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200FA2C: .word 0x027F7878
_0200FA30: .word 0x027F78D0
	arm_func_end sub_0200F9BC

	arm_func_start sub_0200FA34
sub_0200FA34: ; 0x0200FA34
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r2, #0
	bne _0200FA8C
	ldr r0, _0200FA94 ; =0x027F7900
	mov r2, #0
	bl sub_0302BEC4
	cmp r0, #0
	bne _0200FA8C
	ldr r0, _0200FA98 ; =0x027F8878
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _0200FA8C
	bl sub_03036B70
	ldrh r2, [r4]
	mov r1, #8
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	bl sub_03036B24
_0200FA8C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200FA94: .word 0x027F7900
_0200FA98: .word 0x027F8878
	arm_func_end sub_0200FA34

	arm_func_start sub_0200FA9C
sub_0200FA9C: ; 0x0200FA9C
	ldr r1, _0200FAF8 ; =0x027F8878
	ldrb r2, [r0]
	ldr r3, [r1, #0x550]
	ldrb r1, [r3, #0xe0]
	cmp r2, r1
	ldreqb r2, [r0, #1]
	ldreqb r1, [r3, #0xe1]
	cmpeq r2, r1
	ldreqb r2, [r0, #2]
	ldreqb r1, [r3, #0xe2]
	cmpeq r2, r1
	ldreqb r2, [r0, #3]
	ldreqb r1, [r3, #0xe3]
	cmpeq r2, r1
	ldreqb r2, [r0, #4]
	ldreqb r1, [r3, #0xe4]
	cmpeq r2, r1
	ldreqb r1, [r0, #5]
	ldreqb r0, [r3, #0xe5]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0200FAF8: .word 0x027F8878
	arm_func_end sub_0200FA9C

	arm_func_start sub_0200FAFC
sub_0200FAFC: ; 0x0200FAFC
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #8]
	mov r2, r0
	str r3, [r2, #4]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #8]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	movne r3, #2
	ldrh r0, [r1, #0xe]
	moveq r3, #0
	cmp r0, #0
	movne ip, #1
	ldrh r0, [r1, #0x14]
	moveq ip, #0
	cmp r0, #0
	movne lr, #4
	moveq lr, #0
	orr r0, ip, r3
	orr r0, lr, r0
	strb r0, [r2, #0xb]
	ldrh r3, [r1, #4]
	mov r0, #1
	strb r3, [r2, #0xa]
	strh r0, [r2]
	strb r0, [r2, #2]
	mov r0, #0
	strb r0, [r2, #3]
	ldrh r0, [r1, #0x34]
	strh r0, [r2, #0xc]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	beq _0200FB90
	ldrh r0, [r1, #0x36]
	cmp r0, #8
	movhs r0, #8
	bhs _0200FB94
_0200FB90:
	ldrh r0, [r1, #0x36]
_0200FB94:
	strh r0, [r2, #0xe]
	ldrb r3, [r2, #0xa]
	cmp r3, #0
	beq _0200FBB8
	ldr r0, [r1]
	add r3, r3, #1
	add r1, r2, #0x10
	bic r2, r3, #1
	bl sub_0302D91C
_0200FBB8:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0200FAFC

	arm_func_start sub_0200FBC0
sub_0200FBC0: ; 0x0200FBC0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0200FD08 ; =0x027F8878
	mov r5, r1
	ldr r4, [r2, #0x550]
	mov r6, r0
	add r0, r4, #0xe0
	add r1, r5, #0x10
	mov r2, #6
	bl sub_0302D91C
	mov r0, #7
	strh r0, [r5, #0x16]
	add r0, r4, #0x100
	ldrh r1, [r0, #0xf4]
	strh r1, [r5, #0x18]
	ldrh r1, [r0, #0xec]
	strh r1, [r5, #0x1e]
	ldrh r1, [r4, #0xe6]
	strh r1, [r5, #0x1c]
	ldr r1, [r4, #0x198]
	cmp r1, #0
	bne _0200FC34
	mov r0, #0
	strh r0, [r5, #0x20]
	add r1, r5, #0x24
	mov r2, #0x50
	strh r0, [r5, #0x22]
	bl sub_0302D764
	mov r0, #0
	b _0200FC58
_0200FC34:
	ldrh r1, [r0, #0x96]
	add r0, r4, #0x19c
	strh r1, [r5, #0x20]
	ldrh r2, [r4, #0xc4]
	add r1, r5, #0x24
	strh r2, [r5, #0x22]
	mov r2, #0x50
	bl sub_0302D91C
	mov r0, #1
_0200FC58:
	strh r0, [r5, #0x9e]
	mov r0, #1
	strh r0, [r5, #0x74]
	strh r0, [r5, #0x76]
	ldrh r0, [r4, #0xe6]
	add r1, r5, #0x7c
	cmp r0, #1
	moveq r0, #0
	movne r0, #0x10
	strh r0, [r5, #0x78]
	mov r0, #0xa
	strh r0, [r5, #0x7a]
	cmp r6, #0x26
	mov r0, #0
	bne _0200FCA0
	mov r2, #0x20
	bl sub_0302D764
	b _0200FCB8
_0200FCA0:
	mov r2, #8
	bl sub_0302D764
	ldr r0, _0200FD0C ; =0x0000FFFF
	add r1, r5, #0x84
	mov r2, #0x18
	bl sub_0302D764
_0200FCB8:
	add r0, r4, #0x100
	ldrh r1, [r0, #0xee]
	mov r0, r5
	strh r1, [r5, #0x9c]
	bl sub_02011BF4
	ldrh r4, [r0, #4]
	cmp r4, #0
	moveq r0, #1
	beq _0200FD00
	bl sub_03036B70
	strh r6, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x200
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	mov r0, #0
_0200FD00:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0200FD08: .word 0x027F8878
_0200FD0C: .word 0x0000FFFF
	arm_func_end sub_0200FBC0

	arm_func_start sub_0200FD10
sub_0200FD10: ; 0x0200FD10
	ldr r1, _0200FD48 ; =0x027F8878
	ldr r3, _0200FD4C ; =0x027F8DCC
	ldr ip, [r1, #0x574]
	ldr r2, _0200FD50 ; =0x027FFF98
	strb r0, [r3, ip]
	ldr r3, [r1, #0x574]
	add r3, r3, #1
	and r3, r3, #0x1f
	str r3, [r1, #0x574]
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200FD48: .word 0x027F8878
_0200FD4C: .word 0x027F8DCC
_0200FD50: .word 0x027FFF98
	arm_func_end sub_0200FD10

	arm_func_start sub_0200FD54
sub_0200FD54: ; 0x0200FD54
	ldr r2, _0200FD84 ; =0x027F7878
	mov r3, #0
_0200FD5C:
	add r1, r2, r3
	add r1, r1, #0x1000
	add r3, r3, #1
	strb r0, [r1, #0x554]
	cmp r3, #0x20
	blt _0200FD5C
	ldr r0, _0200FD88 ; =0x027F8878
	mov r1, #0
	str r1, [r0, #0x574]
	bx lr
	.align 2, 0
_0200FD84: .word 0x027F7878
_0200FD88: .word 0x027F8878
	arm_func_end sub_0200FD54

	arm_func_start sub_0200FD8C
sub_0200FD8C: ; 0x0200FD8C
	ldr r1, _0200FDC0 ; =0x027F7878
	mov r3, #0
	mov r2, r3
_0200FD98:
	add r0, r1, r2
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x554]
	add r2, r2, #1
	cmp r2, #0x20
	add r3, r3, r0
	blt _0200FD98
	ldr ip, _0200FDC4 ; =sub_027E05D8
	mov r0, r3, lsr #5
	bx ip
	.align 2, 0
_0200FDC0: .word 0x027F7878
_0200FDC4: .word sub_027E05D8
	arm_func_end sub_0200FD8C

	arm_func_start sub_0200FDC8
sub_0200FDC8: ; 0x0200FDC8
	ldr r1, _0200FE2C ; =0x027F8878
	ldr r1, [r1, #0x54c]
	ldrb r1, [r1, #0x53]
	cmp r1, #8
	bne _0200FE04
	cmp r0, #0x16
	movlo r0, #0
	bxlo lr
	cmp r0, #0x1c
	movlo r0, #1
	bxlo lr
	cmp r0, #0x22
	movlo r0, #2
	movhs r0, #3
	bx lr
_0200FE04:
	cmp r0, #8
	movlo r0, #0
	bxlo lr
	cmp r0, #0xe
	movlo r0, #1
	bxlo lr
	cmp r0, #0x14
	movlo r0, #2
	movhs r0, #3
	bx lr
	.align 2, 0
_0200FE2C: .word 0x027F8878
	arm_func_end sub_0200FDC8

	arm_func_start sub_0200FE30
sub_0200FE30: ; 0x0200FE30
	stmdb sp!, {r4, lr}
	bl sub_0302D4F0
	mov r4, r0
	bl sub_0302BD48
	ldr r1, _0200FE84 ; =0x027F8878
	ldr r0, _0200FE88 ; =0x0380B2C0
	ldr r1, [r1, #0x58c]
	bl sub_0302BBB0
	bl sub_020183A0
	ldr r1, _0200FE84 ; =0x027F8878
	ldr r1, [r1, #0x588]
	bl sub_0302BBB0
	ldr r1, _0200FE84 ; =0x027F8878
	ldr r0, _0200FE8C ; =0x0380B364
	ldr r1, [r1, #0x584]
	bl sub_0302BBB0
	bl sub_0302BD80
	mov r0, r4
	bl sub_0302D504
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200FE84: .word 0x027F8878
_0200FE88: .word 0x0380B2C0
_0200FE8C: .word 0x0380B364
	arm_func_end sub_0200FE30

	arm_func_start sub_0200FE90
sub_0200FE90: ; 0x0200FE90
	stmdb sp!, {r4, lr}
	bl sub_0302D4F0
	mov r4, r0
	bl sub_0302BD48
	ldr r1, _0200FEE4 ; =0x027F8878
	ldr r0, _0200FEE8 ; =0x0380B364
	ldr r1, [r1, #0x578]
	bl sub_0302BBB0
	bl sub_020183A0
	ldr r1, _0200FEE4 ; =0x027F8878
	ldr r1, [r1, #0x57c]
	bl sub_0302BBB0
	ldr r1, _0200FEE4 ; =0x027F8878
	ldr r0, _0200FEEC ; =0x0380B2C0
	ldr r1, [r1, #0x580]
	bl sub_0302BBB0
	bl sub_0302BD80
	mov r0, r4
	bl sub_0302D504
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200FEE4: .word 0x027F8878
_0200FEE8: .word 0x0380B364
_0200FEEC: .word 0x0380B2C0
	arm_func_end sub_0200FE90

	arm_func_start sub_0200FEF0
sub_0200FEF0: ; 0x0200FEF0
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_0302D4F0
	ldr r1, _0200FF58 ; =0x027F8878
	ldr r2, [r1, #0x54c]
	cmp r2, #0
	beq _0200FF48
	mov r3, r4
	b _0200FF40
_0200FF14:
	add r1, r2, r3, lsl #4
	ldr r1, [r1, #0xd0]
	tst r1, #0x8000
	beq _0200FF3C
	add r2, r2, #0xd0
	ldr r1, [r2, r3, lsl #4]
	add r4, r2, r3, lsl #4
	bic r1, r1, #0x8000
	str r1, [r2, r3, lsl #4]
	b _0200FF48
_0200FF3C:
	add r3, r3, #1
_0200FF40:
	cmp r3, #0x20
	blt _0200FF14
_0200FF48:
	bl sub_0302D504
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200FF58: .word 0x027F8878
	arm_func_end sub_0200FEF0

	arm_func_start sub_0200FF5C
sub_0200FF5C: ; 0x0200FF5C
	ldr r0, _0200FF8C ; =0x027F8878
	mov r1, #0
	ldr r0, [r0, #0x550]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x30]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3c]
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	bx lr
	.align 2, 0
_0200FF8C: .word 0x027F8878
	arm_func_end sub_0200FF5C

	arm_func_start sub_0200FF90
sub_0200FF90: ; 0x0200FF90
	ldr r1, _0200FFDC ; =0x027F8878
	cmp r0, #0x200
	ldr r2, [r1, #0x550]
	movhi r0, #0x200
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x34]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #4
	cmp r1, #0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	streqh r0, [r2, #0x3c]
	streqh r0, [r2, #0x38]
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strneh r0, [r2, #0x3e]
	strneh r0, [r2, #0x3a]
	bx lr
	.align 2, 0
_0200FFDC: .word 0x027F8878
	arm_func_end sub_0200FF90

	arm_func_start sub_0200FFE0
sub_0200FFE0: ; 0x0200FFE0
	ldr r1, _0201002C ; =0x027F8878
	cmp r0, #0x200
	ldr r2, [r1, #0x550]
	movhi r0, #0x200
	strh r0, [r2, #0x36]
	strh r0, [r2, #0x32]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #2
	cmp r1, #0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	streqh r0, [r2, #0x3e]
	streqh r0, [r2, #0x3a]
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strneh r0, [r2, #0x3c]
	strneh r0, [r2, #0x38]
	bx lr
	.align 2, 0
_0201002C: .word 0x027F8878
	arm_func_end sub_0200FFE0

	arm_func_start sub_02010030
sub_02010030: ; 0x02010030
	ldr r1, _02010058 ; =0x027F8878
	ldr r2, [r1, #0x550]
	strh r0, [r2, #0x30]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #4
	cmp r1, #0
	streqh r0, [r2, #0x38]
	strneh r0, [r2, #0x3a]
	bx lr
	.align 2, 0
_02010058: .word 0x027F8878
	arm_func_end sub_02010030

	arm_func_start sub_0201005C
sub_0201005C: ; 0x0201005C
	ldr r1, _02010084 ; =0x027F8878
	ldr r2, [r1, #0x550]
	strh r0, [r2, #0x32]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #2
	cmp r1, #0
	streqh r0, [r2, #0x3a]
	strneh r0, [r2, #0x38]
	bx lr
	.align 2, 0
_02010084: .word 0x027F8878
	arm_func_end sub_0201005C

	arm_func_start sub_02010088
sub_02010088: ; 0x02010088
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
_02010090:
	ldr r0, _02010EE0 ; =0x027F7878
	add r1, sp, #0x1c
	add r0, r0, #0x28
	mov r2, #1
	bl sub_0302BF50
	ldr sb, [sp, #0x1c]
	cmp sb, #0
	bne _020100B8
	bl sub_0302B94C
	b _020111E0
_020100B8:
	ldrh r1, [sb, #0xc]
	and r0, r1, #0xff00
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	and r1, r1, #0xff
	cmpne r0, #0x100
	bne _020111C8
	tst r1, #0x80
	beq _020111C8
	ldr r0, _02010EE4 ; =0x027F8878
	ldr r1, [r0, #0x54c]
	cmp r1, #0
	ldrne r8, [r0, #0x550]
	ldrneh r3, [r8]
	cmpne r3, #1
	beq _02010090
	ldrh r2, [sb, #0xc]
	ldr r1, _02010EE8 ; =0x00000182
	cmp r2, r1
	bgt _02010154
	bge _0201080C
	cmp r2, #0x8d
	bgt _02010148
	subs r0, r2, #0x84
	addpl pc, pc, r0, lsl #2
	b _020111BC
_02010120: ; jump table
	b _02010180 ; case 0
	b _020101A4 ; case 1
	b _02010430 ; case 2
	b _02010594 ; case 3
	b _020105B8 ; case 4
	b _020111BC ; case 5
	b _020111BC ; case 6
	b _020105DC ; case 7
	b _0201060C ; case 8
	b _0201063C ; case 9
_02010148:
	cmp r2, #0x180
	beq _02010754
	b _020111BC
_02010154:
	add r0, r1, #3
	cmp r2, r0
	bgt _02010170
	bge _02010E60
	cmp r2, #0x184
	beq _02010B08
	b _020111BC
_02010170:
	add r0, r1, #4
	cmp r2, r0
	beq _020110C4
	b _020111BC
_02010180:
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x13
	strh r1, [r0, #4]
	bl sub_03036B24
	b _020111BC
_020101A4:
	cmp r3, #7
	cmpne r3, #9
	bne _0201032C
	add r1, sp, #0x14
	add r0, sb, #0x10
	mov r2, #6
	bl sub_0302D91C
	mov r6, #0
	mov r5, r6
	add r4, r8, #0x100
	mov sl, #1
	b _020102A4
_020101D4:
	bl sub_0302D4F0
	ldrh r2, [r4, #0x82]
	add r1, r5, #1
	mov r7, r0
	tst r2, sl, lsl r1
	beq _02010298
	mov r0, #6
	mul r2, r5, r0
	add r0, r8, r2
	ldrb fp, [sp, #0x14]
	ldrb r3, [r0, #0x128]
	cmp fp, r3
	ldreqb fp, [sp, #0x15]
	ldreqb r3, [r0, #0x129]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x16]
	ldreqb r3, [r0, #0x12a]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x17]
	ldreqb r3, [r0, #0x12b]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x18]
	ldreqb r3, [r0, #0x12c]
	cmpeq fp, r3
	ldreqb r3, [sp, #0x19]
	ldreqb r0, [r0, #0x12d]
	cmpeq r3, r0
	bne _02010298
	add r3, r8, #0x100
	mov r0, r1, lsl #0x10
	mov r6, r0, lsr #0x10
	ldrh r0, [r3, #0x82]
	mvn r1, sl, lsl r6
	and r0, r0, r1
	strh r0, [r3, #0x82]
	ldrh r0, [r8, #0x86]
	add r3, r8, r6, lsl #3
	and r1, r0, r1
	add r0, r8, #0x128
	strh r1, [r8, #0x86]
	mov r1, #0
	str r1, [r3, #0x738]
	add r0, r0, r2
	mov r2, #6
	str r1, [r3, #0x73c]
	bl sub_0302D860
	mov r0, r7
	bl sub_0302D504
	b _020102AC
_02010298:
	mov r0, r7
	bl sub_0302D504
	add r5, r5, #1
_020102A4:
	cmp r5, #0xf
	blt _020101D4
_020102AC:
	cmp r6, #0
	beq _020111BC
	bl sub_03036B70
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldrh r1, [sb, #0x16]
	add r0, sb, #0x10
	strh r1, [r4, #0x12]
	strh r6, [r4, #0x10]
	add r1, r4, #0xa
	mov r2, #6
	bl sub_0302D91C
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_03036B24
	ldr r0, [r8, #0xc]
	cmp r0, #1
	bne _020111BC
	mov r0, #1
	mov r0, r0, lsl r6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0201700C
	b _020111BC
_0201032C:
	mov r5, #0
	bl sub_0302D4F0
	add r1, r8, #0x100
	ldrh r1, [r1, #0x82]
	mov r4, r0
	cmp r1, #0
	bne _02010350
	bl sub_0302D504
	b _020111BC
_02010350:
	ldr r0, [r8, #0xc]
	cmp r0, #1
	bne _02010370
	mov r0, r5
	str r0, [r8, #0xc]
	mov r5, #1
	bl sub_0201537C
	bl sub_0200FE30
_02010370:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r8, #0x86]
	str r1, [r8, #0x14]
	str r1, [r8, #0x10]
	str r1, [r8, #0x1c]
	str r1, [r8, #0x198]
	strh r1, [r0, #0x96]
	add r0, r8, #0x19c
	mov r2, #0x50
	bl sub_0302D860
	bl sub_0200FF5C
	mov r0, #0
	strh r0, [r8, #0xc2]
	mov r1, #3
	mov r0, r4
	strh r1, [r8]
	bl sub_0302D504
	bl sub_03036B70
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldrh r1, [sb, #0x16]
	add r0, r8, #0x100
	strh r1, [r4, #0xc]
	ldrh r1, [r0, #0x88]
	add r0, r8, #0x8a
	strh r1, [r4, #0xa]
	add r0, r0, #0x100
	add r1, r4, #0x10
	mov r2, #6
	bl sub_0302D91C
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x18]
	bl sub_03036B24
	cmp r5, #0
	beq _020111BC
	mov r0, #1
	bl sub_0201700C
	b _020111BC
_02010430:
	ldrh r5, [sb, #0x16]
	cmp r5, #0
	beq _020111BC
	cmp r5, #0x10
	bhs _020111BC
	ldrh r0, [r8, #0xf6]
	cmp r0, #0
	bne _020104BC
	bl sub_0200FEF0
	movs r4, r0
	moveq r0, #0
	beq _02010488
	mov r3, #0x22
	add r0, sb, #0x10
	add r1, r4, #4
	mov r2, #6
	str r3, [r4]
	bl sub_0302D91C
	ldr r0, _02010EEC ; =0x027F7900
	mov r1, r4
	mov r2, #0
	bl sub_0302BEC4
_02010488:
	cmp r0, #0
	bne _020111BC
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x22
	strh r1, [r0, #6]
	bl sub_03036B24
	b _020111BC
_020104BC:
	bl sub_0302D4F0
	add r1, r8, #0x100
	mov r4, #1
	ldrh r3, [r1, #0x82]
	mvn r2, r4, lsl r5
	orr r3, r3, r4, lsl r5
	strh r3, [r1, #0x82]
	ldrh r1, [r8, #0x86]
	mov r4, r0
	and r0, r1, r2
	strh r0, [r8, #0x86]
	bl sub_0302CA0C
	orr r2, r0, #1
	add r0, r8, r5, lsl #3
	add r3, r8, #0x128
	str r2, [r0, #0x738]
	orr r1, r1, #0
	str r1, [r0, #0x73c]
	sub r0, r5, #1
	mov r2, #6
	mla r1, r0, r2, r3
	add r0, sb, #0x10
	bl sub_0302D91C
	mov r0, r4
	bl sub_0302D504
	mov r0, #1
	add r1, r8, #0x1f8
	add r1, r1, r5, lsl #4
	mov r2, #0x10
	bl sub_0302D764
	bl sub_03036B70
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #7
	strh r0, [r4, #8]
	add r0, sb, #0x10
	add r1, r4, #0xa
	mov r2, #6
	bl sub_0302D91C
	strh r5, [r4, #0x10]
	add r0, sb, #0x22
	add r1, r4, #0x14
	mov r2, #0x18
	bl sub_0302D78C
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_03036B24
	b _020111BC
_02010594:
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x12
	strh r1, [r0, #4]
	bl sub_03036B24
	b _020111BC
_020105B8:
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x11
	strh r1, [r0, #4]
	bl sub_03036B24
	b _020111BC
_020105DC:
	ldrh r0, [r8, #0xc2]
	cmp r0, #0
	beq _020111BC
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #8
	strh r1, [r0, #8]
	bl sub_03036B24
	b _020111BC
_0201060C:
	ldrh r0, [r8, #0xc2]
	cmp r0, #0
	beq _020111BC
	bl sub_03036B70
	mov r1, #8
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #2
	strh r1, [r0, #8]
	bl sub_03036B24
	b _020111BC
_0201063C:
	ldrb r0, [sb, #0x1f]
	bl sub_02011230
	ldr r2, _02010EF0 ; =0x027FFF98
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	ldrh r0, [r8]
	cmp r0, #8
	cmpne r0, #0xa
	bne _020111BC
	ldrh r1, [r8, #0xba]
	ldrh r0, [sb, #0x44]
	cmp r1, r0
	beq _020106E0
	bl sub_0200FEF0
	movs r1, r0
	moveq r0, #0
	beq _020106AC
	mov r0, #0x25
	str r0, [r1]
	mov r0, #1
	ldr r3, _02010EF4 ; =0x00008002
	str r0, [r1, #4]
	ldr r0, _02010EEC ; =0x027F7900
	mov r2, #0
	str r3, [r1, #8]
	bl sub_0302BEC4
_020106AC:
	cmp r0, #0
	bne _020111BC
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03036B24
	b _020111BC
_020106E0:
	ldr r0, _02010EE4 ; =0x027F8878
	ldr r0, [r0, #0x550]
	ldrh r0, [r0, #0xc2]
	cmp r0, #0
	beq _020111BC
	bl sub_03036B70
	mov r4, r0
	mov r0, #0x80
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #0x10
	strh r0, [r4, #4]
	ldrh r0, [sb, #0x44]
	strh r0, [r4, #6]
	ldrh r0, [r8]
	strh r0, [r4, #8]
	ldrh r0, [sb, #0x16]
	strh r0, [r4, #0xa]
	cmp r0, #0x80
	bhi _02010748
	add r2, r0, #1
	add r0, sb, #0x3c
	add r1, r4, #0xc
	bic r2, r2, #1
	bl sub_0302D78C
_02010748:
	mov r0, r4
	bl sub_03036B24
	b _020111BC
_02010754:
	ldr r0, [r8, #0x10]
	cmp r0, #0
	beq _020111BC
	ldrb r0, [sb, #0x1f]
	bl sub_02011230
	bl sub_0200FD10
	bl sub_0200FD8C
	strh r0, [r8, #0xbc]
	add r0, sb, #0x2e
	bl sub_0200FA9C
	cmp r0, #1
	beq _020111BC
	ldrh r1, [sb, #0x16]
	ldr r0, _02010EF8 ; =0x000005E4
	cmp r1, r0
	bhi _020111BC
	ldrh r1, [r8, #0xae]
	add r0, sb, #0x10
	eor r1, r1, #1
	strh r1, [r8, #0xae]
	ldrh r2, [r8, #0xae]
	ldrh r1, [sb, #0x16]
	add r2, r8, r2, lsl #2
	ldr r4, [r2, #0xb0]
	add r2, r1, #0x2d
	mov r1, r4
	bic r2, r2, #1
	bl sub_0302D91C
	add r0, sb, #0x28
	add r1, r4, #0x18
	mov r2, #6
	bl sub_0302D91C
	add r0, sb, #0x2e
	add r1, r4, #0x1e
	mov r2, #6
	bl sub_0302D91C
	bl sub_03036B70
	mov r1, #0x11
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xf
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03036B24
	b _020111BC
_0201080C:
	ldrb r0, [sb, #0x1f]
	bl sub_02011230
	ldrh r1, [r8, #0xbe]
	cmp r1, r0
	strhih r0, [r8, #0xbe]
	ldr r0, [r8, #0xc]
	cmp r0, #0
	beq _020111BC
	ldrh r0, [r8, #0x60]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r8, #0x60]
	ldrh r0, [r8, #0x70]
	ldrh sl, [r8, #0x8e]
	eor r0, r0, #1
	strh r0, [r8, #0x70]
	ldrh r0, [r8, #0x70]
	ldrh r1, [sb, #0x16]
	add r3, r8, r0, lsl #2
	ldrh r0, [r8, #0x72]
	add r2, r1, #0x30
	ldr r4, [r3, #0x74]
	cmp r0, r2
	movlo r2, r0
	mov r1, r4
	add r0, sb, #0x10
	bl sub_0302D91C
	bl sub_0302D4F0
	ldrh r1, [r8, #0x84]
	mov fp, r0
	cmp r1, #1
	mov r5, #0
	bne _0201089C
	ldr r0, _02010EFC ; =0x0380B408
	mov r5, #1
	bl sub_0302CDB0
_0201089C:
	mov r7, #1
	strh r7, [r8, #0x84]
	ldrh r0, [r4, #0xa]
	mov ip, #0
	strh r0, [r8, #0x82]
	ldrh r6, [sb, #0x18]
	ldr r0, _02010F00 ; =0x000082EA
	tst r6, #0x2000
	moveq r7, #0
	strh r7, [r8, #0x90]
	str ip, [sp]
	ldrh r2, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	sub r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	add r1, r1, #0x80
	mov r1, r1, lsl #4
	umull r3, r2, r1, r0
	mla r2, r1, ip, r2
	mov r1, r1, asr #0x1f
	mla r2, r1, r0, r2
	mov r0, r3, lsr #6
	orr r0, r0, r2, lsl #26
	mov r3, r2, lsr #6
	mov r1, r0, lsr #0xa
	ldr r0, _02010EFC ; =0x0380B408
	mov r2, r3, lsr #0xa
	orr r1, r1, r3, lsl #22
	ldr r3, _02010F04 ; =0x027E1B68
	bl sub_0302CCCC
	and r0, r6, #0x2800
	cmp r0, #0x2800
	moveq r1, #1
	and r0, r6, #0x6000
	movne r1, #0
	cmp r0, #0x6000
	moveq r2, #1
	movne r2, #0
	cmp r2, #0
	movne r0, #0
	strneh r0, [r8, #0x8a]
	cmp r1, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x8e]
	cmp r2, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x8c]
	cmp r7, #0
	beq _020109A8
	ldrh r0, [r4, #0x2c]
	sub r1, r0, #0x66
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	subs r1, r0, #0x20
	bmi _020109A8
	ldrh r0, [r8, #0x32]
	cmp r1, #0x200
	movgt r1, #0x200
	cmp r1, r0
	beq _020109A8
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0201005C
_020109A8:
	mov r0, fp
	bl sub_0302D504
	cmp r5, #0
	beq _020109F4
	cmp sl, #1
	bne _020109CC
	mov r0, r5
	mov r1, #0
	bl sub_02016CDC
_020109CC:
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #9
	strh r1, [r0, #2]
	mov r1, #0xd
	strh r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	bl sub_03036B24
_020109F4:
	cmp r7, #0
	bne _02010A20
	ldrh r0, [r4, #6]
	cmp r0, #2
	blo _020111BC
	ldrh r0, [r4, #0x30]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x5e]
	b _020111BC
_02010A20:
	add r0, sb, #0x28
	add r1, r4, #0x18
	mov r2, #6
	bl sub_0302D91C
	add r0, sb, #0x2e
	add r1, r4, #0x1e
	mov r2, #6
	bl sub_0302D91C
	ldrh r0, [r4, #6]
	cmp r0, #2
	blo _02010AB0
	sub r0, r0, #2
	strh r0, [r4, #6]
	ldrh r0, [r4, #0x30]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x5e]
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xc
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03036B24
	ldrh r3, [r4, #6]
	cmp r3, #0
	beq _02010ADC
	str r4, [sp]
	ldrh r1, [r4, #0x30]
	add r2, r4, #0x32
	mov r0, #0
	bl sub_02017200
	b _02010ADC
_02010AB0:
	mov r0, #0
	strh r0, [r4, #6]
	strh r0, [r8, #0x5e]
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #0xc
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03036B24
_02010ADC:
	ldr r0, [r8, #0x7bc]
	ldr r1, [r8, #0x7b8]
	cmp r0, #0
	cmpeq r1, #0
	beq _020111BC
	bl sub_0302CA0C
	orr r0, r0, #1
	str r0, [r8, #0x738]
	orr r0, r1, #0
	str r0, [r8, #0x73c]
	b _020111BC
_02010B08:
	ldr r0, [r8, #0xc]
	mov fp, #0
	cmp r0, #0
	beq _020111BC
	ldrh r0, [sb, #0x12]
	cmp r0, #0
	bne _02010B3C
	ldrh r1, [r8, #0x66]
	cmp r1, #1
	bne _02010B44
	ldrh r0, [sb, #0x10]
	cmp r0, #0
	beq _02010B44
_02010B3C:
	bl sub_02011244
	b _020111BC
_02010B44:
	cmp r1, #0
	movne r0, #0
	strneh r0, [r8, #0x66]
	ldrh r1, [sb, #0x16]
	ldrh r0, [sb, #0x14]
	ldrh r3, [r8, #0x70]
	mul r2, r1, r0
	add r1, r8, r3, lsl #2
	ldr r4, [r1, #0x74]
	ldrh r0, [r8, #0x72]
	add r2, r2, #0xa
	cmp r0, r2
	movlo r2, r0
	mov r1, r4
	add r0, sb, #0x10
	bl sub_0302D91C
	ldr r0, _02010EE4 ; =0x027F8878
	ldrh r1, [r4]
	ldr r7, [r0, #0x550]
	cmp r1, #0
	ldrh r5, [r7, #0xbe]
	bne _02010BE0
	ldrh r0, [sb, #0x14]
	cmp r0, #1
	blo _02010BE0
	add sl, sb, #0x1a
	mov r6, #0
	b _02010BD0
_02010BB4:
	ldrh r1, [sb, #0x16]
	mla r0, r1, r6, sl
	ldrb r0, [r0, #3]
	bl sub_02011230
	cmp r0, r5
	movlo r5, r0
	add r6, r6, #1
_02010BD0:
	ldrh r0, [sb, #0x14]
	cmp r6, r0
	blt _02010BB4
	strh r5, [r7, #0xbe]
_02010BE0:
	bl sub_0302CA0C
	orr r0, r0, #1
	str r0, [sp, #8]
	ldr r0, _02010F08 ; =0x00008001
	orr r1, r1, #0
	rsb r0, r0, #0x18000
	ldrh r6, [r4]
	str r1, [sp, #0xc]
	add r5, r4, #0xa
	mov sl, #0
	str r0, [sp, #0x10]
	b _02010D78
_02010C10:
	ldrh r7, [r5, #4]
	ldrh r1, [r5]
	cmp r7, #1
	blo _02010D64
	cmp r7, #0xf
	bhi _02010D64
	cmp r1, #2
	blo _02010C8C
	ldr r0, [sp, #0x10]
	cmp r1, r0
	beq _02010C8C
	sub r0, r1, #2
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	strh r3, [r5]
	ldrh r2, [r8, #0x86]
	mov r1, #1
	orr r1, r2, r1, lsl r7
	strh r1, [r8, #0x86]
	ldr r1, [sp, #8]
	add r0, r8, r7, lsl #3
	str r1, [r0, #0x738]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x73c]
	beq _02010D64
	mov r0, r7
	str r4, [sp]
	ldrh r1, [r5, #8]
	add r2, r5, #0xa
	bl sub_02017200
	b _02010D64
_02010C8C:
	cmp r1, #0
	bne _02010D64
	add r0, r8, r7, lsl #3
	ldr r2, [r0, #0x738]
	ldr r1, [r0, #0x73c]
	mov r0, #1
	mov r0, r0, lsl r7
	str r0, [sp, #4]
	mov r0, #1
	orr r6, r6, r0, lsl r7
	ldr ip, [r8, #0x7bc]
	ldr r0, [r8, #0x7b8]
	cmp ip, #0
	mov r3, #0
	cmpeq r0, #0
	beq _02010D64
	cmp r1, r3
	cmpeq r2, r3
	beq _02010D64
	ldr r3, [sp, #8]
	subs r3, r3, r2
	ldr r2, [sp, #0xc]
	sbc r1, r2, r1
	cmp r1, ip
	cmpeq r3, r0
	bls _02010D64
	bl sub_0200FEF0
	movs r1, r0
	add r2, r8, r7, lsl #3
	mov r0, #0
	str r0, [r2, #0x738]
	str r0, [r2, #0x73c]
	beq _02010D34
	mov r0, #0x25
	str r0, [r1]
	ldr r0, [sp, #4]
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _02010F08 ; =0x00008001
	str r0, [r1, #8]
	ldr r0, _02010EEC ; =0x027F7900
	bl sub_0302BEC4
_02010D34:
	cmp r0, #0
	bne _02010D64
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03036B24
_02010D64:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
	ldrh r0, [r4, #6]
	add r5, r5, r0
_02010D78:
	ldrh r0, [r4, #4]
	cmp sl, r0
	blo _02010C10
	mov r0, r6, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0
	bl sub_02016CDC
	ldrh r0, [r4]
	cmp r0, #0
	movne fp, #1
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xb
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_03036B24
	ldrh r0, [r8, #0x70]
	eor r0, r0, #1
	strh r0, [r8, #0x70]
	bl sub_0302D4F0
	cmp fp, #0
	ldreqsh r1, [r8, #0x62]
	subeq r1, r1, #1
	streqh r1, [r8, #0x62]
	ldrsh r1, [r8, #0x64]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r8, #0x64]
	ldrsh r1, [r8, #0x62]
	cmp r1, #0
	ldrgtsh r1, [r8, #0x64]
	cmpgt r1, #0
	movgt r4, #1
	movle r4, #0
	bl sub_0302D504
	cmp r4, #0
	beq _020111BC
	cmp fp, #1
	ldreqh r4, [sb, #0x10]
	ldrh r0, [r8, #0x44]
	ldrne r4, _02010F0C ; =0x0000FFFF
	cmp r0, #0
	beq _02010E54
	ldr r0, _02010F10 ; =0x0380B434
	bl sub_0302CDB0
	str r4, [sp]
	ldr r1, [r8, #0x48]
	ldr r2, [r8, #0x4c]
	ldr r0, _02010F10 ; =0x0380B434
	ldr r3, _02010F14 ; =0x027E1AD4
	bl sub_0302CCCC
	b _020111BC
_02010E54:
	mov r0, r4
	bl sub_020112D8
	b _020111BC
_02010E60:
	ldr r0, [r8, #0xc]
	mov r5, #0
	cmp r0, #0
	beq _020111BC
	ldrh r0, [sb, #0xe]
	cmp r0, #0
	bne _02010EC0
	ldr r1, _02010F18 ; =0x048080F8
	mov r4, #1
	ldrh r0, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1]
	cmp r0, r2
	ldrhih r3, [r1, #2]
	mov r0, r2, asr #4
	orr r0, r0, r3, lsl #12
	ldrh r1, [r8, #0x82]
	mov r0, r0, lsl #0x10
	rsb r0, r1, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	ble _020111BC
	b _02010EC4
_02010EC0:
	mov r4, r5
_02010EC4:
	bl sub_0302D4F0
	ldrh r1, [r8, #0x84]
	mov r7, r0
	cmp r1, #0
	bne _02010F1C
	bl sub_0302D504
	b _020111BC
	.align 2, 0
_02010EE0: .word 0x027F7878
_02010EE4: .word 0x027F8878
_02010EE8: .word 0x00000182
_02010EEC: .word 0x027F7900
_02010EF0: .word 0x027FFF98
_02010EF4: .word 0x00008002
_02010EF8: .word 0x000005E4
_02010EFC: .word 0x0380B408
_02010F00: .word 0x000082EA
_02010F04: .word 0x027E1B68
_02010F08: .word 0x00008001
_02010F0C: .word 0x0000FFFF
_02010F10: .word 0x0380B434
_02010F14: .word 0x027E1AD4
_02010F18: .word 0x048080F8
_02010F1C:
	ldr r0, _02010EFC ; =0x0380B408
	mov r1, #0
	strh r1, [r8, #0x84]
	ldrh r6, [r8, #0x90]
	bl sub_0302CDB0
	mov r0, r7
	bl sub_0302D504
	ldrh r3, [r8, #0x8c]
	mov r2, #1
	cmp r3, #0
	beq _02010F68
	cmp r4, #0
	bne _02010F64
	add r0, r8, #0x100
	ldrh r1, [sb, #0x3e]
	ldrh r0, [r0, #0x88]
	tst r1, r2, lsl r0
	bne _02010F68
_02010F64:
	mov r2, #0
_02010F68:
	cmp r3, #0
	movne r0, #0
	strneh r0, [r8, #0x8c]
	ldrh r0, [r8, #0x8e]
	cmp r0, #0
	beq _02010FA4
	mov r0, #0
	strh r0, [r8, #0x8e]
	cmp r2, #0
	movne r0, #1
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl sub_02016CDC
	mov r5, r0
_02010FA4:
	cmp r6, #0
	beq _020111BC
	bl sub_03036B70
	mov r7, r0
	mov r0, #0xe
	strh r0, [r7]
	cmp r4, #0
	movne r0, #9
	strneh r0, [r7, #2]
	bne _02010FF0
	add r0, r8, #0x100
	ldrh r2, [sb, #0x3e]
	ldrh r0, [r0, #0x88]
	mov r1, #1
	tst r2, r1, lsl r0
	movne r0, #0xf
	strneh r0, [r7, #2]
	moveq r0, #0
	streqh r0, [r7, #2]
_02010FF0:
	mov r0, #0xd
	strh r0, [r7, #4]
	mov r0, #0
	str r0, [r7, #8]
	cmp r4, #0
	bne _02011050
	ldrh r1, [sb, #0x1c]
	add r0, sb, #0x28
	strh r1, [r7, #0xc]
	ldrh r2, [sb, #0x1e]
	add r1, r7, #0x10
	strh r2, [r7, #0xe]
	mov r2, #6
	bl sub_0302D91C
	add r0, sb, #0x2e
	add r1, r7, #0x16
	mov r2, #6
	bl sub_0302D91C
	ldrh r0, [sb, #0x3a]
	strh r0, [r7, #0x1c]
	ldrh r0, [sb, #0x3c]
	strh r0, [r7, #0x1e]
	ldrh r0, [sb, #0x3e]
	strh r0, [r7, #0x20]
_02011050:
	mov r0, r7
	bl sub_03036B24
	cmp r6, #0
	beq _020111BC
	cmp r5, #1
	ldrneh r0, [r8, #0x5e]
	cmpne r0, #0
	bne _020110AC
	ldrh r0, [r8, #0x46]
	cmp r0, #0
	beq _020110A4
	ldr r0, _02010F10 ; =0x0380B434
	bl sub_0302CDB0
	mov r0, #0
	str r0, [sp]
	ldr r1, [r8, #0x50]
	ldr r2, [r8, #0x54]
	ldr r0, _02010F10 ; =0x0380B434
	ldr r3, _020111EC ; =0x027E1C00
	bl sub_0302CCCC
	b _020111BC
_020110A4:
	bl sub_020113FC
	b _020111BC
_020110AC:
	mov r1, #0
	strh r1, [r8, #0x5e]
	mov r0, #1
	strh r0, [r8, #0x60]
	strh r1, [r8, #0x88]
	b _020111BC
_020110C4:
	add r0, r8, #0x700
	ldrh r0, [r0, #0xcc]
	cmp r0, #1
	ldreqh r0, [sb, #0x10]
	cmpeq r0, #0x20
	bne _02011138
	bl sub_0302D4F0
	mov r4, r0
	ldr r0, _02010EFC ; =0x0380B408
	bl sub_0302CDB0
	mov r1, #0
	mov r0, r4
	strh r1, [r8, #0x84]
	bl sub_0302D504
	mov r1, #0
	strh r1, [r8, #0x8a]
	mov r0, #1
	bl sub_02016CDC
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x17
	strh r1, [r0, #4]
	mov r1, #1
	strh r1, [r0, #6]
	bl sub_03036B24
	b _020111BC
_02011138:
	bl sub_0200FEF0
	movs r1, r0
	moveq r0, #0
	beq _0201118C
	ldr r0, _020111F0 ; =0x00008003
	mov r2, #0x25
	str r2, [r1]
	str r0, [r1, #8]
	ldrh r0, [r8]
	cmp r0, #9
	cmpne r0, #7
	ldreq r0, _020111F4 ; =0x00007FFE
	streq r0, [r1, #4]
	beq _02011180
	cmp r0, #0xa
	cmpne r0, #8
	moveq r0, #1
	streq r0, [r1, #4]
_02011180:
	ldr r0, _02010EEC ; =0x027F7900
	mov r2, #0
	bl sub_0302BEC4
_0201118C:
	cmp r0, #0
	bne _020111BC
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03036B24
_020111BC:
	mov r0, sb
	bl sub_020111F8
	b _02010090
_020111C8:
	ldr r0, _02010EE0 ; =0x027F7878
	mov r1, sb
	add r0, r0, #0x58
	mov r2, #1
	bl sub_0302BEC4
	b _02010090
_020111E0:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020111EC: .word 0x027E1C00
_020111F0: .word 0x00008003
_020111F4: .word 0x00007FFE
	arm_func_end sub_02010088

	arm_func_start sub_020111F8
sub_020111F8: ; 0x020111F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0302D4F0
	ldr r1, _0201122C ; =0x027F8878
	mov r4, r0
	ldr r0, [r1, #0x544]
	ldr r1, [r1, #0x548]
	mov r2, r5
	bl sub_0302C574
	mov r0, r4
	bl sub_0302D504
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201122C: .word 0x027F8878
	arm_func_end sub_020111F8

	arm_func_start sub_02011230
sub_02011230: ; 0x02011230
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02011230

	arm_func_start sub_02011244
sub_02011244: ; 0x02011244
	stmdb sp!, {r4, lr}
	ldr r0, _020112BC ; =0x027F8878
	ldr r4, [r0, #0x550]
	bl sub_0200FEF0
	movs r1, r0
	moveq r0, #0
	beq _0201127C
	mov r0, #0x2d
	str r0, [r1]
	ldrh r3, [r4, #0x68]
	ldr r0, _020112C0 ; =0x027F7900
	mov r2, #0
	str r3, [r1, #4]
	bl sub_0302BEC4
_0201127C:
	cmp r0, #0
	movne r0, #1
	strneh r0, [r4, #0x66]
	bne _020112B4
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2d
	strh r1, [r0, #6]
	bl sub_03036B24
_020112B4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020112BC: .word 0x027F8878
_020112C0: .word 0x027F7900
	arm_func_end sub_02011244
_020112C4:
	.byte 0x08, 0xC0, 0x9F, 0xE5, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0xE8, 0x1A, 0x7E, 0x02

	arm_func_start sub_020112D8
sub_020112D8: ; 0x020112D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0200FEF0
	movs r1, r0
	ldr r4, _02011354 ; =0x027F7878
	moveq r0, #0
	beq _0201130C
	mov r0, #0x2b
	str r0, [r1]
	add r0, r4, #0x88
	mov r2, #0
	str r5, [r1, #4]
	bl sub_0302BEC4
_0201130C:
	cmp r0, #0
	bne _0201134C
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _0201134C
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2b
	strh r1, [r0, #6]
	bl sub_03036B24
_0201134C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02011354: .word 0x027F7878
	arm_func_end sub_020112D8

	arm_func_start sub_02011358
sub_02011358: ; 0x02011358
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020113E0 ; =0x027F8878
	mov r2, #0x40
	ldr r0, [r1, #0x544]
	ldr r1, [r1, #0x548]
	ldr r5, _020113E4 ; =0x027F7878
	bl sub_0302C464
	mov r4, r0
	ldr r1, _020113E8 ; =0x00000185
	ldr r0, _020113EC ; =0x027F78A0
	strh r1, [r4, #0xc]
	mov r2, #0
	mov r1, r4
	strh r2, [r4, #0xe]
	bl sub_0302BEC4
	cmp r0, #0
	bne _020113D8
	mov r0, r4
	bl sub_020111F8
	add r0, r5, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _020113D8
	bl sub_03036B70
	mov r2, #0x80
	strh r2, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	bl sub_03036B24
_020113D8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020113E0: .word 0x027F8878
_020113E4: .word 0x027F7878
_020113E8: .word 0x00000185
_020113EC: .word 0x027F78A0
	arm_func_end sub_02011358
_020113F0:
	.byte 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1, 0x0C, 0x1C, 0x7E, 0x02

	arm_func_start sub_020113FC
sub_020113FC: ; 0x020113FC
	stmdb sp!, {r4, lr}
	bl sub_0200FEF0
	ldr r2, _02011484 ; =0x027F8878
	movs r1, r0
	ldr r0, [r2, #0x550]
	mov r2, #0
	strh r2, [r0, #0x5e]
	strh r2, [r0, #0x60]
	ldr r4, _02011488 ; =0x027F7878
	strh r2, [r0, #0x88]
	beq _0201143C
	mov r3, #0x2c
	add r0, r4, #0x88
	str r3, [r1]
	bl sub_0302BEC4
	mov r2, r0
_0201143C:
	cmp r2, #0
	bne _0201147C
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _0201147C
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2c
	strh r1, [r0, #6]
	bl sub_03036B24
_0201147C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011484: .word 0x027F8878
_02011488: .word 0x027F7878
	arm_func_end sub_020113FC

	arm_func_start sub_0201148C
sub_0201148C: ; 0x0201148C
	stmdb sp!, {r3, lr}
	ldr r0, _020114A8 ; =0x0380B434
	bl sub_0302CB90
	ldr r0, _020114AC ; =0x0380B408
	bl sub_0302CB90
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020114A8: .word 0x0380B434
_020114AC: .word 0x0380B408
	arm_func_end sub_0201148C

	arm_func_start sub_020114B0
sub_020114B0: ; 0x020114B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _02011548 ; =0x027F8878
	mov r6, #1
	ldr r8, _0201154C ; =0x027F7878
	ldr sb, [r0, #0x550]
	ldr r5, _02011550 ; =0x027F7184
	add r7, sp, #0
	mov r4, #0
	mov fp, r6
_020114D4:
	mov r1, r7
	mov r2, fp
	add r0, r8, #0x88
	bl sub_0302BF50
	ldr r0, [sp]
	cmp r0, #0
	bne _020114F8
	bl sub_0302B94C
	b _02011540
_020114F8:
	ldrh sl, [r0]
	tst sl, #0x8000
	bicne r0, sl, #0x8000
	movne r0, r0, lsl #0x10
	movne sl, r0, lsr #0x10
	cmp sl, #0x2e
	bhs _02011530
	str r6, [sb, #4]
	strh sl, [sb, #2]
	ldr r0, [sp]
	ldr r1, [r5, sl, lsl #2]
	mov lr, pc
	bx r1
_0201152C:
	.byte 0x04, 0x40, 0x89, 0xE5
_02011530:
	ldr r0, [sp]
	orr r1, sl, #0x8000
	strh r1, [r0]
	b _020114D4
_02011540:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02011548: .word 0x027F8878
_0201154C: .word 0x027F7878
_02011550: .word 0x027F7184
	arm_func_end sub_020114B0
_02011554:
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02011558
sub_02011558: ; 0x02011558
	stmdb sp!, {r4, lr}
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02011558

	arm_func_start sub_020115AC
sub_020115AC: ; 0x020115AC
	stmdb sp!, {r4, lr}
	mov r4, #0
	strh r4, [r0]
	strh r4, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	mov ip, #1
	strh ip, [r0, #0xc]
	mov r4, #3
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh ip, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_020115AC

	arm_func_start sub_0201160C
sub_0201160C: ; 0x0201160C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r5, #2
	mov r7, r1
	mov r0, r2
	strh r5, [r4, #0xc]
	mov r5, #0x1f
	add r1, r4, #0x10
	mov r2, #6
	mov r6, r3
	strh r5, [r4, #0xe]
	bl sub_0302D78C
	ldr r0, [sp, #0x18]
	add r1, r4, #0x18
	mov r2, #0x20
	strh r6, [r4, #0x16]
	bl sub_0302D78C
	ldrh r2, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r1, r4, #0x3a
	strh r2, [r4, #0x38]
	mov r2, #0x10
	bl sub_0302D78C
	ldrh r1, [sp, #0x24]
	mov r0, r7, lsr #1
	strh r1, [r4, #0x4a]
	mov r1, #0
	strh r1, [r4, #0x4c]
	ldrh r2, [r4, #0xe]
	ldrh r1, [r4, #0xc]
	add r5, r4, r2, lsl #1
	strh r1, [r5, #0x10]
	sub r1, r0, #0x2c
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_0201160C

	arm_func_start sub_020116C4
sub_020116C4: ; 0x020116C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r3, #0
	strh r3, [r4]
	strh r3, [r4, #2]
	strh r3, [r4, #4]
	strh r3, [r4, #6]
	strh r3, [r4, #8]
	strh r3, [r4, #0xa]
	mov r0, #3
	strh r0, [r4, #0xc]
	mov r0, #0x22
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r0, r2
	strh r3, [r4, #0x12]
	add r1, r4, #0x14
	mov r2, #0x44
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #5
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020116C4

	arm_func_start sub_0201173C
sub_0201173C: ; 0x0201173C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r0, #4
	strh r0, [r4, #0xc]
	mov r5, #5
	mov r6, r2
	mov r0, r1
	strh r5, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #6
	mov r5, r3
	bl sub_0302D78C
	strh r6, [r4, #0x16]
	strh r5, [r4, #0x18]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #6
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0201173C

	arm_func_start sub_020117BC
sub_020117BC: ; 0x020117BC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r0, #5
	strh r0, [r4, #0xc]
	mov r3, #4
	mov r5, r2
	mov r0, r1
	strh r3, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #6
	bl sub_0302D78C
	strh r5, [r4, #0x16]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #4
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020117BC

	arm_func_start sub_02011834
sub_02011834: ; 0x02011834
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	mov r6, r2
	strh r0, [r4, #0xa]
	mov r2, #6
	mov r0, r1
	strh r2, [r4, #0xc]
	mov r1, #5
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r5, r3
	bl sub_0302D78C
	strh r6, [r4, #0x16]
	strh r5, [r4, #0x18]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #3
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_02011834

	arm_func_start sub_020118B0
sub_020118B0: ; 0x020118B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov ip, #0
	strh ip, [r4]
	strh ip, [r4, #2]
	strh ip, [r4, #4]
	strh ip, [r4, #6]
	ldrh r0, [sp, #0x20]
	strh ip, [r4, #8]
	add r0, r0, #1
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	mov r0, r2
	strh ip, [r4, #0xa]
	mov r2, #9
	strh r2, [r4, #0xc]
	add r2, r5, #0x17
	strh r2, [r4, #0xe]
	strh r1, [r4, #0x10]
	add r1, r4, #0x12
	mov r2, #0x20
	mov r5, r3
	bl sub_0302D78C
	ldrh r1, [sp, #0x10]
	strh r5, [r4, #0x32]
	ldrh r0, [sp, #0x14]
	strh r1, [r4, #0x34]
	ldrh r1, [sp, #0x18]
	strh r0, [r4, #0x36]
	ldrh r0, [sp, #0x1c]
	strh r1, [r4, #0x38]
	ldrh r2, [sp, #0x20]
	strh r0, [r4, #0x3a]
	ldr r0, [sp, #0x24]
	strh r2, [r4, #0x3c]
	add r1, r4, #0x3e
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020118B0

	arm_func_start sub_02011970
sub_02011970: ; 0x02011970
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, #0
	strh r5, [r4]
	strh r5, [r4, #2]
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	mov r0, #0xa
	strh r0, [r4, #0xc]
	mov r0, #0xc
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r1, [r4, #0x12]
	strh r2, [r4, #0x14]
	ldr r0, [sp, #0x10]
	strh r3, [r4, #0x16]
	add r1, r4, #0x18
	mov r2, #0x10
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #0x12
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02011970

	arm_func_start sub_020119F0
sub_020119F0: ; 0x020119F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r5, r1
	mov r0, #0x100
	strh r0, [r4, #0xc]
	mov r1, #0x18
	mov r0, r5
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #0x30
	bl sub_0302D78C
	mov r0, #0
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	strh r0, [r5, #0xc]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x16]
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	strh r0, [r5, #0x28]
	strh r0, [r5, #0x2a]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #2
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020119F0

	arm_func_start sub_02011A9C
sub_02011A9C: ; 0x02011A9C
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _02011B00 ; =0x00000101
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #4
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011B00: .word 0x00000101
	arm_func_end sub_02011A9C

	arm_func_start sub_02011B04
sub_02011B04: ; 0x02011B04
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _02011B98 ; =0x00000102
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #0xa
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldrh r2, [sp, #8]
	strh r3, [r0, #0x14]
	ldrh r1, [sp, #0xc]
	strh r2, [r0, #0x16]
	ldrh r2, [sp, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [sp, #0x14]
	strh r2, [r0, #0x1a]
	ldrh r2, [sp, #0x18]
	strh r1, [r0, #0x1c]
	ldr r1, [sp, #0x1c]
	strh r2, [r0, #0x1e]
	str r1, [r0, #0x20]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011B98: .word 0x00000102
	arm_func_end sub_02011B04

	arm_func_start sub_02011B9C
sub_02011B9C: ; 0x02011B9C
	stmdb sp!, {r4, lr}
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	mov r2, #0x104
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02011B9C

	arm_func_start sub_02011BF4
sub_02011BF4: ; 0x02011BF4
	stmdb sp!, {r4, lr}
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r1, #0x200
	mov r2, #0x48
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02011BF4

	arm_func_start sub_02011C48
sub_02011C48: ; 0x02011C48
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011CA0 ; =0x00000207
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011CA0: .word 0x00000207
	arm_func_end sub_02011C48

	arm_func_start sub_02011CA4
sub_02011CA4: ; 0x02011CA4
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011CFC ; =0x0000020B
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011CFC: .word 0x0000020B
	arm_func_end sub_02011CA4

	arm_func_start sub_02011D00
sub_02011D00: ; 0x02011D00
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	ldr r2, _02011D70 ; =0x0000020D
	strh r0, [r4, #0xa]
	mov r0, r1
	strh r2, [r4, #0xc]
	mov r1, #0x10
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #0x20
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02011D70: .word 0x0000020D
	arm_func_end sub_02011D00

	arm_func_start sub_02011D74
sub_02011D74: ; 0x02011D74
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011DCC ; =0x0000020E
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011DCC: .word 0x0000020E
	arm_func_end sub_02011D74

	arm_func_start sub_02011DD0
sub_02011DD0: ; 0x02011DD0
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _02011E34 ; =0x00000211
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #3
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011E34: .word 0x00000211
	arm_func_end sub_02011DD0

	arm_func_start sub_02011E38
sub_02011E38: ; 0x02011E38
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011E90 ; =0x00000212
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011E90: .word 0x00000212
	arm_func_end sub_02011E38

	arm_func_start sub_02011E94
sub_02011E94: ; 0x02011E94
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011EEC ; =0x00000215
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011EEC: .word 0x00000215
	arm_func_end sub_02011E94

	arm_func_start sub_02011EF0
sub_02011EF0: ; 0x02011EF0
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011F48 ; =0x00000216
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011F48: .word 0x00000216
	arm_func_end sub_02011EF0

	arm_func_start sub_02011F4C
sub_02011F4C: ; 0x02011F4C
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _02011FA4 ; =0x00000242
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02011FA4: .word 0x00000242
	arm_func_end sub_02011F4C

	arm_func_start sub_02011FA8
sub_02011FA8: ; 0x02011FA8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov ip, #0
	strh ip, [r4]
	strh ip, [r4, #2]
	strh ip, [r4, #4]
	strh ip, [r4, #6]
	strh ip, [r4, #8]
	add r0, r1, #1
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	mov r0, r2
	ldr r5, _02012028 ; =0x00000245
	strh ip, [r4, #0xa]
	strh r5, [r4, #0xc]
	add r2, r3, #1
	strh r2, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r2, r1
	add r1, r4, #0x12
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0200F9BC
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02012028: .word 0x00000245
	arm_func_end sub_02011FA8

	arm_func_start sub_0201202C
sub_0201202C: ; 0x0201202C
	ldr ip, _0201203C ; =sub_027E29A8
	ldr r1, _02012040 ; =0x00000281
	mov r2, #4
	bx ip
	.align 2, 0
_0201203C: .word sub_027E29A8
_02012040: .word 0x00000281
	arm_func_end sub_0201202C

	arm_func_start sub_02012044
sub_02012044: ; 0x02012044
	ldr ip, _02012054 ; =sub_027E29A8
	ldr r1, _02012058 ; =0x00000283
	mov r2, #3
	bx ip
	.align 2, 0
_02012054: .word sub_027E29A8
_02012058: .word 0x00000283
	arm_func_end sub_02012044

	arm_func_start sub_0201205C
sub_0201205C: ; 0x0201205C
	ldr ip, _0201206C ; =sub_027E29A8
	mov r1, #0x284
	mov r2, #2
	bx ip
	.align 2, 0
_0201206C: .word sub_027E29A8
	arm_func_end sub_0201205C

	arm_func_start sub_02012070
sub_02012070: ; 0x02012070
	ldr ip, _02012080 ; =sub_027E29A8
	ldr r1, _02012084 ; =0x00000301
	mov r2, #1
	bx ip
	.align 2, 0
_02012080: .word sub_027E29A8
_02012084: .word 0x00000301
	arm_func_end sub_02012070

	arm_func_start sub_02012088
sub_02012088: ; 0x02012088
	ldr ip, _02012098 ; =sub_027E29A8
	ldr r1, _0201209C ; =0x00000302
	mov r2, #1
	bx ip
	.align 2, 0
_02012098: .word sub_027E29A8
_0201209C: .word 0x00000302
	arm_func_end sub_02012088

	arm_func_start sub_020120A0
sub_020120A0: ; 0x020120A0
	ldr ip, _020120B0 ; =sub_027E29A8
	ldr r1, _020120B4 ; =0x00000303
	mov r2, #1
	bx ip
	.align 2, 0
_020120B0: .word sub_027E29A8
_020120B4: .word 0x00000303
	arm_func_end sub_020120A0

	arm_func_start sub_020120B8
sub_020120B8: ; 0x020120B8
	ldr ip, _020120C8 ; =sub_027E29A8
	mov r1, #0x304
	mov r2, #1
	bx ip
	.align 2, 0
_020120C8: .word sub_027E29A8
	arm_func_end sub_020120B8

	arm_func_start sub_020120CC
sub_020120CC: ; 0x020120CC
	ldr ip, _020120DC ; =sub_027E29A8
	ldr r1, _020120E0 ; =0x00000305
	mov r2, #1
	bx ip
	.align 2, 0
_020120DC: .word sub_027E29A8
_020120E0: .word 0x00000305
	arm_func_end sub_020120CC

	arm_func_start sub_020120E4
sub_020120E4: ; 0x020120E4
	ldr ip, _020120F4 ; =sub_027E29A8
	ldr r1, _020120F8 ; =0x00000306
	mov r2, #9
	bx ip
	.align 2, 0
_020120F4: .word sub_027E29A8
_020120F8: .word 0x00000306
	arm_func_end sub_020120E4

	arm_func_start sub_020120FC
sub_020120FC: ; 0x020120FC
	ldr ip, _0201210C ; =sub_027E29A8
	ldr r1, _02012110 ; =0x00000307
	mov r2, #0x5c
	bx ip
	.align 2, 0
_0201210C: .word sub_027E29A8
_02012110: .word 0x00000307
	arm_func_end sub_020120FC

	arm_func_start sub_02012114
sub_02012114: ; 0x02012114
	ldr ip, _02012124 ; =sub_027E29A8
	mov r1, #0x308
	mov r2, #2
	bx ip
	.align 2, 0
_02012124: .word sub_027E29A8
	arm_func_end sub_02012114

	arm_func_start sub_02012128
sub_02012128: ; 0x02012128
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _02012194 ; =0x00000309
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #4
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldrh r1, [sp, #8]
	strh r3, [r0, #0x14]
	strh r1, [r0, #0x16]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02012194: .word 0x00000309
	arm_func_end sub_02012128

	arm_func_start sub_02012198
sub_02012198: ; 0x02012198
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r3, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r3, lsl #1
	strh r1, [r4, #0x10]
	strh r2, [r4, #0x12]
	bl sub_0200F9BC
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02012198

	arm_func_start sub_020121E0
sub_020121E0: ; 0x020121E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, [r0, #4]
	ldr r1, _0201227C ; =0x027F8878
	str r4, [r1, #0x54c]
	ldr r2, [r0, #8]
	str r2, [r1, #0x550]
	str r2, [r4]
	ldr r1, [r0, #0xc]
	str r1, [r4, #8]
	ldr r0, [r0, #0x10]
	bl sub_02017638
	add r0, sp, #2
	add r1, sp, #0
	bl sub_020178F4
	cmp r0, #0
	bne _02012250
	bl sub_03036B70
	mov r1, #0
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	ldrh r1, [sp, #2]
	strh r1, [r0, #4]
	ldrh r1, [sp]
	strh r1, [r0, #6]
	bl sub_03036B24
	b _02012270
_02012250:
	ldr r0, [r4]
	mov r1, #2
	strh r1, [r0]
	bl sub_03036B70
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	bl sub_03036B24
_02012270:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_0201227C: .word 0x027F8878
	arm_func_end sub_020121E0

	arm_func_start sub_02012280
sub_02012280: ; 0x02012280
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	ldr r0, _0201264C ; =0x027F8878
	mov r4, #0
	ldr r8, [r0, #0x550]
	bl sub_0302D4F0
	ldr r1, [r8, #0xc]
	mov r5, r0
	cmp r1, #1
	bne _020122DC
	mov r0, r4
	str r0, [r8, #0xc]
	mov r4, #1
	bl sub_0201537C
	bl sub_0200FE30
	ldrh r0, [r8]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r8]
	beq _020122DC
	cmp r0, #9
	moveq r0, #7
	streqh r0, [r8]
_020122DC:
	ldrh r1, [r8]
	add r0, r1, #0xf9
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _02012310
	add r0, r8, #0x100
	cmp r1, #7
	moveq sl, #1
	ldrh sb, [r0, #0x82]
	movne sl, #0
	b _02012314
_02012310:
	mov sb, #0
_02012314:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r8, #0x86]
	str r1, [r8, #0x14]
	str r1, [r8, #0x10]
	str r1, [r8, #0x1c]
	mov r0, r5
	strh r1, [r8, #0xc2]
	bl sub_0302D504
	cmp r4, #0
	beq _0201234C
	ldr r0, _02012650 ; =0x0000FFFF
	bl sub_0201700C
_0201234C:
	cmp sl, #0
	movne r0, #0
	strneh r0, [r8, #0xf6]
	cmp sb, #0
	beq _020123A8
	mov r7, #0
	add r5, r8, #0x128
	add r4, r8, #0x8a
	mov r6, #1
	mov fp, #6
_02012374:
	tst sb, r6, lsl r7
	beq _0201239C
	cmp r7, #0
	addeq r2, r4, #0x100
	subne r0, r7, #1
	mlane r2, r0, fp, r5
	mov r1, r7, lsl #0x10
	mov r0, sl
	mov r1, r1, lsr #0x10
	bl sub_02014278
_0201239C:
	add r7, r7, #1
	cmp r7, #0x10
	blt _02012374
_020123A8:
	add r0, r8, #0x128
	mov r1, #0
	mov r2, #0x5a
	bl sub_0302D860
	add r0, sp, #0x10
	bl sub_02012114
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020123D8
	mov r0, #0x308
	bl sub_02012660
	b _02012640
_020123D8:
	ldrh r4, [r0, #6]
	add r0, sp, #0x10
	bl sub_0201205C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020123FC
	mov r0, #0x284
	bl sub_02012660
	b _02012640
_020123FC:
	ldrh r1, [r0, #6]
	cmp r4, #0x20
	bgt _02012440
	bge _02012514
	cmp r4, #0
	bgt _0201241C
	beq _02012538
	b _02012618
_0201241C:
	cmp r4, #0x12
	bgt _02012618
	cmp r4, #0x10
	blt _02012618
	beq _02012558
	cmp r4, #0x11
	cmpne r4, #0x12
	beq _020125B0
	b _02012618
_02012440:
	cmp r4, #0x30
	bgt _02012450
	beq _02012458
	b _02012618
_02012450:
	cmp r4, #0x40
	bne _02012618
_02012458:
	add r0, r1, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _020124DC
	add r0, r8, #0x8a
	add r1, sp, #0xa
	add r0, r0, #0x100
	mov r2, #6
	bl sub_0302D91C
	mov r6, #0
	add r5, sp, #0xa
	mov r4, #3
	b _020124D0
_02012494:
	add r0, sp, #0x10
	mov r1, r5
	mov r2, r4
	bl sub_020117BC
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _020124C0
	cmp r0, #7
	cmpne r0, #0xc
	beq _020124CC
	b _02012514
_020124C0:
	mov r0, #3
	strh r0, [r8]
	b _02012514
_020124CC:
	add r6, r6, #1
_020124D0:
	cmp r6, #2
	blt _02012494
	b _02012514
_020124DC:
	cmp r1, #1
	bne _02012514
	add r0, sp, #4
	mov r1, #0xff
	mov r2, #6
	bl sub_0302D860
	add r1, sp, #4
	add r0, sp, #0x10
	mov r2, #3
	bl sub_020117BC
	ldrh r0, [r0, #4]
	cmp r0, #0
	moveq r0, #3
	streqh r0, [r8]
_02012514:
	add r0, sp, #0x10
	mov r1, #1
	bl sub_02011558
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02012538
	mov r0, #0
	bl sub_02012660
	b _02012640
_02012538:
	add r0, sp, #0x10
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02012558
	ldr r0, _02012654 ; =0x00000302
	bl sub_02012660
	b _02012640
_02012558:
	add r0, r8, #0x100
	ldrh r0, [r0, #0xee]
	cmp r0, #0
	bne _02012598
	add r0, sp, #0x10
	mov r1, #1
	bl sub_02011D74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0201258C
	ldr r0, _02012658 ; =0x0000020E
	bl sub_02012660
	b _02012640
_0201258C:
	add r0, r8, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_02012598:
	mov r0, #2
	strh r0, [r8]
	mov r0, #0
	str r0, [r8, #0x198]
	bl sub_0200FF5C
	b _02012628
_020125B0:
	cmp r1, #0
	bne _020125EC
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	add r0, sp, #0x10
	mov r2, r1
	mov r3, #0x14
	bl sub_02012128
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020125EC
	ldr r0, _0201265C ; =0x00000309
	bl sub_02012660
	b _02012640
_020125EC:
	add r0, sp, #0x10
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0201260C
	ldr r0, _02012654 ; =0x00000302
	bl sub_02012660
	b _02012640
_0201260C:
	mov r0, #2
	strh r0, [r8]
	b _02012628
_02012618:
	mov r0, #0x308
	mov r1, #0
	bl sub_02012660
	b _02012640
_02012628:
	bl sub_03036B70
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02012640:
	add sp, sp, #0x210
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201264C: .word 0x027F8878
_02012650: .word 0x0000FFFF
_02012654: .word 0x00000302
_02012658: .word 0x0000020E
_0201265C: .word 0x00000309
	arm_func_end sub_02012280

	arm_func_start sub_02012660
sub_02012660: ; 0x02012660
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03036B70
	mov r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02012660

	arm_func_start sub_02012690
sub_02012690: ; 0x02012690
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _0201273C ; =0x027F8878
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #2
	beq _020126C8
	bl sub_03036B70
	mov r1, #2
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02012730
_020126C8:
	add r0, sp, #0
	bl sub_02012070
	ldrh r5, [r0, #4]
	cmp r5, #0
	beq _02012704
	bl sub_03036B70
	mov r2, #2
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x300
	strh r1, [r0, #4]
	strh r5, [r0, #6]
	bl sub_03036B24
	b _02012730
_02012704:
	mov r0, #1
	strh r0, [r4]
	bl sub_03034A0C
	mov r0, #0
	strh r0, [r4]
	bl sub_03036B70
	mov r1, #2
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02012730:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201273C: .word 0x027F8878
	arm_func_end sub_02012690

	arm_func_start sub_02012740
sub_02012740: ; 0x02012740
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, _020127F8 ; =0x027F8878
	ldr r0, [r0, #4]
	ldr r4, [r1, #0x550]
	mov r2, #0x40
	add r1, r4, #0xe8
	bl sub_0302D91C
	add r0, r4, #0x100
	ldrh r1, [r0, #0x1a]
	ldrh r0, [r0, #0xf4]
	mov r2, #1
	tst r0, r2, lsl r1
	bne _02012794
	bl sub_03036B70
	mov r1, #7
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	bl sub_03036B24
	b _020127EC
_02012794:
	ldrh r1, [r4, #0xf8]
	add r0, sp, #0
	bl sub_02011E38
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _020127D4
	bl sub_03036B70
	mov r1, #7
	strh r1, [r0]
	mov r2, #1
	ldr r1, _020127FC ; =0x00000212
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	b _020127EC
_020127D4:
	bl sub_03036B70
	mov r1, #7
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_020127EC:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020127F8: .word 0x027F8878
_020127FC: .word 0x00000212
	arm_func_end sub_02012740

	arm_func_start sub_02012800
sub_02012800: ; 0x02012800
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x2b8
	ldr r1, _02012A84 ; =0x027F8878
	add r5, sp, #0xb8
	ldr r4, [r1, #0x550]
	ldrh r1, [r4]
	cmp r1, #2
	bne _0201282C
	ldr r1, [r4, #0xc8]
	tst r1, #1
	beq _02012850
_0201282C:
	bl sub_03036B70
	mov r1, #8
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02012A78
_02012850:
	add r1, r4, #0x100
	ldrh r2, [r1, #0x1a]
	mov r3, #1
	ldrh ip, [r1, #0xf6]
	mov r2, r3, lsl r2
	ldr r6, [r0, #4]
	tst ip, r2, asr #1
	bne _02012894
	bl sub_03036B70
	mov r1, #8
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02012A78
_02012894:
	strh r3, [r4, #0xe6]
	mov r0, #0
	strh r0, [r1, #0x88]
	bl sub_0302D4F0
	add r1, r4, #0x100
	mov r2, #0
	strh r2, [r1, #0x82]
	strh r2, [r4, #0x86]
	bl sub_0302D504
	mov r1, r5
	add r2, r4, #0x100
	mov r3, #1
	mov r0, #8
	strh r3, [r2, #0xee]
	bl sub_0200FBC0
	cmp r0, #0
	beq _02012A78
	mov r0, r5
	bl sub_020120A0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020128F8
	ldr r0, _02012A88 ; =0x00000303
	bl sub_02012A8C
	b _02012A78
_020128F8:
	cmp r6, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	mov r0, r5
	mov r1, r6
	mov r2, #0
	mov r3, #1
	bl sub_020115AC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02012938
	mov r0, #1
	bl sub_02012A8C
	b _02012A78
_02012938:
	strh r6, [r4, #0xc6]
	add r1, sp, #0x38
	mov r0, #0
	mov r2, #0x80
	add r6, r4, #0xe8
	bl sub_0302D764
	add r0, sp, #0x38
	mov r1, r6
	bl sub_0200FAFC
	add r1, sp, #0x18
	mov r0, #0
	mov r2, #0x20
	bl sub_0302D764
	ldr r1, [r6, #8]
	mov r0, r5
	strh r1, [sp, #0x18]
	ldr r2, [r6, #8]
	mov r3, #0
	mov r2, r2, lsr #0x10
	strh r2, [sp, #0x1a]
	ldrh r5, [r6, #0xc]
	mov r2, #2
	strh r5, [sp, #0x1c]
	strh r3, [sp, #0x1e]
	str r2, [sp]
	ldrh r3, [r6, #0x32]
	mov r2, #3
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldrh r2, [r6, #4]
	add r3, sp, #0x38
	add r2, r2, #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldrh r3, [r6, #0x18]
	mov r1, #0x20
	add r2, sp, #0x18
	bl sub_020118B0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020129F4
	mov r0, #9
	bl sub_02012A8C
	b _02012A78
_020129F4:
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	ldrh r0, [r6, #0x34]
	movne r1, #0x2a
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200FF90
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	movne r1, #6
	ldrh r0, [r6, #0x36]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200FFE0
	bl sub_03036B70
	mov r1, #7
	strh r1, [r4]
	mov r1, #8
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #8]
	ldrh r1, [r4, #0x30]
	strh r1, [r0, #0x2c]
	ldrh r1, [r4, #0x32]
	strh r1, [r0, #0x2e]
	bl sub_03036B24
	mov r0, #1
	strh r0, [r4, #0xc2]
_02012A78:
	add sp, sp, #0x2b8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02012A84: .word 0x027F8878
_02012A88: .word 0x00000303
	arm_func_end sub_02012800

	arm_func_start sub_02012A8C
sub_02012A8C: ; 0x02012A8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03036B70
	mov r1, #8
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02012A8C

	arm_func_start sub_02012AC8
sub_02012AC8: ; 0x02012AC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x208
	ldr r0, _02012C84 ; =0x027F8878
	ldr sl, [r0, #0x550]
	ldrh r0, [sl]
	cmp r0, #7
	beq _02012B00
	bl sub_03036B70
	mov r1, #9
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02012C78
_02012B00:
	mov r0, #0
	strh r0, [sl, #0xf6]
	mov r8, #1
_02012B0C:
	add r0, sl, #0x100
	ldrh r0, [r0, #0x82]
	mov r7, #1
	tst r0, r7, lsl r8
	beq _02012BDC
	add r0, sl, #0x128
	sub r1, r8, #1
	mov r2, #6
	mla r0, r1, r2, r0
	add r1, sp, #0
	bl sub_0302D91C
	mov sb, #0
	add r6, sp, #8
	add r5, sp, #0
	mov r4, #3
	b _02012B78
_02012B4C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020117BC
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _02012B80
	cmp r0, #7
	cmpne r0, #0xc
	bne _02012B80
	add sb, sb, #1
_02012B78:
	cmp sb, #2
	blt _02012B4C
_02012B80:
	bl sub_0302D4F0
	add r1, sl, #0x100
	ldrh r2, [r1, #0x82]
	tst r2, r7, lsl r8
	beq _02012BD8
	mvn r3, r7, lsl r8
	and r2, r2, r3
	strh r2, [r1, #0x82]
	ldrh r2, [sl, #0x86]
	add r1, sl, r8, lsl #3
	and r2, r2, r3
	strh r2, [sl, #0x86]
	mov r2, #0
	str r2, [r1, #0x738]
	str r2, [r1, #0x73c]
	bl sub_0302D504
	mov r0, r8, lsl #0x10
	mov r1, r0, lsr #0x10
	add r2, sp, #0
	mov r0, #1
	bl sub_02014278
	b _02012BDC
_02012BD8:
	bl sub_0302D504
_02012BDC:
	add r8, r8, #1
	cmp r8, #0x10
	blt _02012B0C
	add r0, sp, #8
	mov r1, #1
	bl sub_02011558
	ldrh r1, [r0, #4]
	mov r0, #0
	cmp r1, #0
	beq _02012C0C
	bl sub_02012C8C
	b _02012C78
_02012C0C:
	strh r0, [sl, #0xc2]
	mov r1, #3
	strh r1, [sl]
	add r0, sp, #8
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02012C38
	ldr r0, _02012C88 ; =0x00000302
	bl sub_02012C8C
	b _02012C78
_02012C38:
	mov r0, #2
	strh r0, [sl]
	mov r1, #0
	str r1, [sl, #0x198]
	add r0, sl, #0x100
	strh r1, [r0, #0x96]
	add r0, sl, #0x19c
	mov r2, #0x50
	bl sub_0302D860
	bl sub_0200FF5C
	bl sub_03036B70
	mov r1, #9
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02012C78:
	add sp, sp, #0x208
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02012C84: .word 0x027F8878
_02012C88: .word 0x00000302
	arm_func_end sub_02012AC8

	arm_func_start sub_02012C8C
sub_02012C8C: ; 0x02012C8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03036B70
	mov r1, #9
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02012C8C

	arm_func_start sub_02012CC0
sub_02012CC0: ; 0x02012CC0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x248
	ldr r1, _02013010 ; =0x027F8878
	add r4, sp, #0x48
	ldr r7, [r1, #0x550]
	ldrh r1, [r7]
	cmp r1, #2
	cmpne r1, #3
	cmpne r1, #5
	beq _02012D0C
	bl sub_03036B70
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013004
_02012D0C:
	ldr r1, [r0, #4]
	add r2, r7, #0x100
	str r1, [r7, #0x184]
	ldrh r5, [r0, #2]
	add r1, sp, #0x10
	strh r5, [r2, #0x90]
	ldrh r6, [r0, #8]
	add r0, r0, #0xa
	mov r2, #6
	bl sub_0302D91C
	ldrh r1, [sp, #0x10]
	ldr r0, _02013014 ; =0x0000FFFF
	cmp r1, r0
	beq _02012D50
	tst r1, #1
	bicne r0, r1, #1
	strneh r0, [sp, #0x10]
_02012D50:
	cmp r5, #0
	bne _02012D7C
	bl sub_03036B70
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013004
_02012D7C:
	add r0, r7, #0x100
	ldrh r0, [r0, #0xf4]
	mov r1, #1
	tst r0, r1, lsl r5
	bne _02012DB4
	bl sub_03036B70
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013004
_02012DB4:
	mov r0, #2
	strh r0, [r7, #0xe6]
	mov r0, r4
	bl sub_02012114
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02012DE0
	mov r0, #0x308
	mov r2, #0
	bl sub_02013564
	b _02013004
_02012DE0:
	ldrh r0, [r0, #6]
	cmp r0, #0x10
	bne _02012E5C
	mov r1, r4
	mov r0, #0xa
	bl sub_0200FBC0
	cmp r0, #0
	beq _02013004
	mov r0, r4
	bl sub_020120A0
	ldrh r1, [r0, #4]
	mov r2, #0
	cmp r1, #0
	beq _02012E24
	ldr r0, _02013018 ; =0x00000303
	bl sub_02013564
	b _02013004
_02012E24:
	mov r0, #3
	mov r1, #1
	strh r0, [r7]
	mov r0, r4
	mov r3, r1
	bl sub_020115AC
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _02012E58
	mov r2, #0
	bl sub_02013564
	b _02013004
_02012E58:
	strh r0, [r7, #0xc6]
_02012E5C:
	ldr r0, _02013014 ; =0x0000FFFF
	mov r3, #5
	strh r3, [r7]
	add r1, sp, #0x26
	mov r2, #0x20
	bl sub_0302D764
	add r0, sp, #0x17
	mov r1, #0
	mov r2, #0xf
	strb r5, [sp, #0x16]
	bl sub_0302D860
	add r1, sp, #0x26
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r0, sp, #0x16
	str r0, [sp, #8]
	ldr r1, _0201301C ; =0x0000011E
	add r2, sp, #0x10
	str r6, [sp, #0xc]
	mov r0, r4
	mov r3, #0
	bl sub_0201160C
	mov r4, r0
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _02012ED8
	mov r0, #2
	mov r2, #0
	bl sub_02013564
	b _02013004
_02012ED8:
	bl sub_03036B70
	ldrh r1, [r4, #8]
	mov r6, r0
	cmp r1, #0
	bne _02012F10
	mov r0, #0xa
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r5, [r6, #0x10]
	strh r1, [r6, #0x12]
	b _02012FFC
_02012F10:
	ldr r1, [r7, #0x184]
	mov r0, #0
	add r1, r1, #0x40
	mov r2, #0x80
	bl sub_0302D764
	ldrh r2, [r4, #0xa]
	ldr r1, [r7, #0x184]
	add r0, r4, #0xa
	mov r2, r2, lsl #1
	bl sub_0302D91C
	mov r0, #0xa
	strh r0, [r6]
	mov r0, #0
	strh r0, [r6, #2]
	mov r0, #5
	strh r0, [r6, #8]
	ldrh r0, [r4, #0x40]
	strh r0, [r6, #0x10]
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl sub_02013020
	mov r7, r0
	bl sub_0200FDC8
	strh r0, [r6, #0x12]
	mov r0, r7
	bl sub_02013034
	ldrh r1, [r4, #0x14]
	add r0, r4, #0xe
	strh r1, [r6, #0x14]
	add r1, r6, #0xa
	mov r2, #6
	bl sub_0302D91C
	add r0, r4, #0x16
	add r1, r6, #0x16
	mov r2, #0x20
	bl sub_0302D78C
	ldrh r0, [r4, #0x46]
	strh r0, [r6, #0x36]
	cmp r0, #0x80
	bls _02012FD4
	mov r0, #0xa
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r5, [r6, #0x10]
	strh r1, [r6, #0x12]
	b _02012FFC
_02012FD4:
	add r1, r6, #0x38
	mov r0, #0
	mov r2, #0x80
	bl sub_0302D764
	ldrh r1, [r6, #0x36]
	add r0, r4, #0x4a
	add r2, r1, #1
	add r1, r6, #0x38
	bic r2, r2, #1
	bl sub_0302D78C
_02012FFC:
	mov r0, r6
	bl sub_03036B24
_02013004:
	add sp, sp, #0x248
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02013010: .word 0x027F8878
_02013014: .word 0x0000FFFF
_02013018: .word 0x00000303
_0201301C: .word 0x0000011E
	arm_func_end sub_02012CC0

	arm_func_start sub_02013020
sub_02013020: ; 0x02013020
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02013020

	arm_func_start sub_02013034
sub_02013034: ; 0x02013034
	ldr r2, _0201304C ; =0x027FFF98
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	bx lr
	.align 2, 0
_0201304C: .word 0x027FFF98
	arm_func_end sub_02013034

	arm_func_start sub_02013050
sub_02013050: ; 0x02013050
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	sub sp, sp, #0x400
	ldr r1, _02013550 ; =0x027F8878
	mov sb, r0
	ldr r8, [r1, #0x550]
	ldrh r0, [r8]
	cmp r0, #2
	cmpne r0, #3
	cmpne r0, #5
	beq _020130A0
	bl sub_03036B70
	mov r1, #0x26
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013540
_020130A0:
	ldr r0, [sb, #4]
	add r1, sp, #0x18
	str r0, [r8, #0x184]
	ldrh sl, [sb, #2]
	add r0, r8, #0x100
	strh sl, [r0, #0x90]
	ldrh r3, [sb, #0xa]
	add r0, sb, #0xc
	str r3, [sp, #0x10]
	mov r2, #6
	bl sub_0302D91C
	ldrh r5, [sb, #0x12]
	ldrh fp, [sb, #0x36]
	cmp r5, #2
	beq _020130E8
	cmp r5, #3
	beq _020130F4
	b _02013100
_020130E8:
	mov r6, #1
	mov r5, #0
	b _02013104
_020130F4:
	mov r6, #1
	mov r5, r6
	b _02013104
_02013100:
	mov r6, #0
_02013104:
	add r1, sp, #0x4e
	add r0, sb, #0x16
	mov r2, #0x20
	ldrh r4, [sb, #0x14]
	bl sub_0302D91C
	ldrh r1, [sp, #0x18]
	ldr r0, _02013554 ; =0x0000FFFF
	ldrh r7, [sb, #8]
	cmp r1, r0
	beq _02013138
	tst r1, #1
	bicne r0, r1, #1
	strneh r0, [sp, #0x18]
_02013138:
	add r0, r8, #0x100
	ldrh r1, [r0, #0xf4]
	mov r0, sl, lsl #0x11
	ands sl, r1, r0, lsr #16
	beq _0201317C
	ldr r0, [r8, #0xc8]
	tst r0, #1
	cmpne r5, #1
	bne _0201317C
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _0201317C
	tst r0, #3
	bne _0201317C
	ldrh r0, [sb, #8]
	cmp r0, #0x40
	bhs _020131A0
_0201317C:
	bl sub_03036B70
	mov r1, #0x26
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013540
_020131A0:
	mov r0, #2
	strh r0, [r8, #0xe6]
	add r0, sp, #0x70
	bl sub_02012114
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020131CC
	mov r0, #0x308
	mov r2, #1
	bl sub_02013564
	b _02013540
_020131CC:
	ldrh r0, [r0, #6]
	cmp r0, #0x10
	bne _0201324C
	add r1, sp, #0x70
	mov r0, #0x26
	bl sub_0200FBC0
	cmp r0, #0
	beq _02013540
	add r0, sp, #0x70
	bl sub_020120A0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013210
	ldr r0, _02013558 ; =0x00000303
	mov r2, #1
	bl sub_02013564
	b _02013540
_02013210:
	mov r0, #3
	mov r1, #1
	strh r0, [r8]
	add r0, sp, #0x70
	mov r3, r1
	mov r2, #0
	bl sub_020115AC
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _02013248
	mov r2, r0
	bl sub_02013564
	b _02013540
_02013248:
	strh r0, [r8, #0xc6]
_0201324C:
	add r0, r8, #0x100
	ldrh r0, [r0, #0xee]
	cmp r5, #0
	bne _0201329C
	cmp r0, #1
	bne _020132D8
	add r0, sp, #0x70
	mov r1, #0
	bl sub_02011D74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0201328C
	ldr r0, _0201355C ; =0x0000020E
	mov r2, #1
	bl sub_02013564
	b _02013540
_0201328C:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0xee]
	b _020132D8
_0201329C:
	cmp r0, #0
	bne _020132D8
	add r0, sp, #0x70
	mov r1, #1
	bl sub_02011D74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020132CC
	ldr r0, _0201355C ; =0x0000020E
	mov r2, #1
	bl sub_02013564
	b _02013540
_020132CC:
	add r0, r8, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_020132D8:
	cmp r6, #1
	bne _02013330
	add r0, sp, #0x2e
	mov r1, #0xff
	mov r2, #0x20
	bl sub_0302D860
	cmp fp, #0x20
	bhi _02013308
	add r0, sp, #0x2e
	mov r2, fp
	mov r1, #0
	bl sub_0302D860
_02013308:
	add r1, sp, #0x2e
	add r0, sp, #0x70
	bl sub_02011D00
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013330
	ldr r0, _02013560 ; =0x0000020D
	mov r2, #1
	bl sub_02013564
	b _02013540
_02013330:
	mov r6, #0
	mov r3, #5
	add r0, sp, #0x1e
	mov r1, r6
	mov r2, #0x10
	strh r3, [r8]
	bl sub_0302D860
	mov r3, #1
	add r1, sp, #0x1e
	mov r2, r3
_02013358:
	tst sl, r2, lsl r3
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	strneb r3, [r1, r6]
	movne r6, r0, lsr #0x10
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	cmp r3, #0xf
	blo _02013358
	sub r0, r7, #0x40
	mov r1, #0x42
	bl sub_030365C4
	add r2, sp, #0x4e
	stmia sp, {r2, r5}
	add r1, sp, #0x1e
	str r1, [sp, #8]
	ldr r1, [sp, #0x10]
	sub r5, r7, r0, lsl #1
	str r1, [sp, #0xc]
	add r2, sp, #0x18
	add r0, sp, #0x70
	mov r3, r4
	add r1, r5, #0x5e
	bl sub_0201160C
	mov r5, r0
	ldrh r1, [r5, #4]
	cmp r1, #0
	beq _020133DC
	mov r0, #2
	mov r2, #1
	bl sub_02013564
	b _02013540
_020133DC:
	bl sub_03036B70
	ldrh r1, [r5, #8]
	mov r6, r0
	cmp r1, #0
	bne _02013418
	mov r0, #0x26
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r1, [r6, #0xe]
	mov r0, sl, asr #1
	strh r0, [r6, #0xa]
	b _02013538
_02013418:
	ldr sb, [r8, #0x184]
	mov r2, r7
	mov r1, sb
	mov r0, #0
	add r8, r5, #0xa
	bl sub_0302D764
	mov r7, #0
	b _02013504
_02013438:
	ldrh r1, [r8]
	mov r0, r8
	mov r1, r1, lsl #0x11
	mov fp, r1, lsr #0x10
	mov r1, sb
	mov r2, fp
	bl sub_0302D91C
	cmp r4, #0
	beq _020134C0
	ldrh r2, [sb, #0xa]
	cmp r2, #0
	moveq r0, #0
	beq _020134A4
	cmp r2, #0x20
	movhi r0, #0
	bhi _020134A4
	mov r1, #0
	b _02013498
_02013480:
	add r0, sb, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	movne r0, #1
	bne _020134A4
	add r1, r1, #1
_02013498:
	cmp r1, r2
	blt _02013480
	mov r0, #0
_020134A4:
	cmp r0, #0
	bne _020134C0
	add r0, sp, #0x4e
	add r1, sb, #0xc
	mov r2, #0x20
	strh r4, [sb, #0xa]
	bl sub_0302D91C
_020134C0:
	add r0, r6, r7, lsl #2
	str sb, [r0, #0x10]
	ldrh r0, [r8, #2]
	and r0, r0, #0xff
	bl sub_02013020
	str r0, [sp, #0x14]
	bl sub_0200FDC8
	add r1, r6, r7, lsl #1
	strh r0, [r1, #0x50]
	ldr r0, [sp, #0x14]
	bl sub_02013034
	add sb, sb, fp
	tst sb, #2
	addne r0, sb, #2
	add r8, r8, fp
	bicne sb, r0, #3
	add r7, r7, #1
_02013504:
	ldrh r0, [r5, #8]
	cmp r7, r0
	blt _02013438
	mov r0, #0x26
	strh r0, [r6]
	mov r0, #0
	strh r0, [r6, #2]
	mov r0, #5
	strh r0, [r6, #8]
	ldrh r1, [r5, #8]
	mov r0, sl, asr #1
	strh r1, [r6, #0xe]
	strh r0, [r6, #0xa]
_02013538:
	mov r0, r6
	bl sub_03036B24
_02013540:
	add sp, sp, #0xc8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02013550: .word 0x027F8878
_02013554: .word 0x0000FFFF
_02013558: .word 0x00000303
_0201355C: .word 0x0000020E
_02013560: .word 0x0000020D
	arm_func_end sub_02013050

	arm_func_start sub_02013564
sub_02013564: ; 0x02013564
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r6, r0
	mov r5, r1
	bl sub_03036B70
	cmp r4, #0
	movne r1, #0x26
	moveq r1, #0xa
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_02013564

	arm_func_start sub_020135AC
sub_020135AC: ; 0x020135AC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _02013674 ; =0x027F8878
	add r4, sp, #0
	ldr r5, [r0, #0x550]
	ldrh r0, [r5]
	cmp r0, #5
	beq _020135E8
	bl sub_03036B70
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02013668
_020135E8:
	mov r0, r4
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013608
	ldr r0, _02013678 ; =0x00000302
	bl sub_02013680
	b _02013668
_02013608:
	mov r0, #2
	strh r0, [r5]
	add r0, r5, #0x100
	ldrh r0, [r0, #0xee]
	cmp r0, #0
	bne _02013650
	mov r0, r4
	mov r1, #1
	bl sub_02011D74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013644
	ldr r0, _0201367C ; =0x0000020E
	bl sub_02013680
	b _02013668
_02013644:
	add r0, r5, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_02013650:
	bl sub_03036B70
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02013668:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02013674: .word 0x027F8878
_02013678: .word 0x00000302
_0201367C: .word 0x0000020E
	arm_func_end sub_020135AC

	arm_func_start sub_02013680
sub_02013680: ; 0x02013680
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03036B70
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02013680

	arm_func_start sub_020136B4
sub_020136B4: ; 0x020136B4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x250
	ldr r1, _02013C44 ; =0x027F8878
	add r4, sp, #0x50
	ldr r7, [r1, #0x550]
	ldr r5, [r1, #0x54c]
	ldrh r1, [r7]
	mov r6, r0
	cmp r1, #2
	bne _020136E8
	ldr r0, [r7, #0xc8]
	tst r0, #1
	beq _0201370C
_020136E8:
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013C38
_0201370C:
	ldr r0, [r6, #4]
	add r1, r5, #0x10
	mov r2, #0xc0
	bl sub_0302D91C
	ldrh r0, [r5, #0x4c]
	cmp r0, #0x10
	blo _02013758
	ldrb r0, [r5, #0x5b]
	tst r0, #1
	bne _02013758
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0xb
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013C38
_02013758:
	ldrh r1, [r5, #0x46]
	add r0, r7, #0x100
	mov r2, #1
	ldrh r0, [r0, #0xf4]
	mov r1, r2, lsl r1
	tst r1, r0
	beq _02013780
	rsb r0, r2, #0x2000
	tst r0, r1, asr #1
	bne _020137A0
_02013780:
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013C38
_020137A0:
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03036B24
	add r0, r7, #0x100
	ldrh r1, [r0, #0xec]
	cmp r1, #1
	ldrh r1, [r5, #0x3e]
	bne _020137E8
	tst r1, #1
	movne r1, #1
	strneh r1, [r0, #0xec]
	moveq r1, #2
	b _020137F8
_020137E8:
	tst r1, #2
	movne r1, #2
	strneh r1, [r0, #0xec]
	moveq r1, #1
_020137F8:
	streqh r1, [r0, #0xec]
	ldrh r0, [r5, #0x3c]
	tst r0, #0x20
	movne r1, #1
	add r0, r7, #0x100
	moveq r1, #0
	strh r1, [r0, #0xee]
	ldrh r0, [r5, #0x4c]
	mov r1, r4
	cmp r0, #0
	moveq r0, #3
	movne r0, #2
	strh r0, [r7, #0xe6]
	mov r0, #0xc
	bl sub_0200FBC0
	cmp r0, #0
	beq _02013C38
	mov r0, r4
	mov r1, #0
	bl sub_02011EF0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013864
	ldr r0, _02013C48 ; =0x00000216
	mov r2, #0
	bl sub_02013C58
	b _02013C38
_02013864:
	ldrh r0, [r5, #0x4c]
	cmp r0, #0x10
	bhs _020138C0
	ldrh r1, [r5, #0x42]
	cmp r1, #0
	moveq r0, #1
	beq _0201388C
	ldr r0, _02013C4C ; =0x00002710
	bl sub_030363B8
	add r0, r0, #1
_0201388C:
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	cmp r1, #0xff
	movhi r1, #0xff
	mov r0, r4
	bl sub_02011CA4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020138C0
	ldr r0, _02013C50 ; =0x0000020B
	mov r2, #0
	bl sub_02013C58
	b _02013C38
_020138C0:
	mov r0, r4
	bl sub_020120A0
	ldrh r1, [r0, #4]
	mov r2, #0
	cmp r1, #0
	beq _020138E4
	ldr r0, _02013C54 ; =0x00000303
	bl sub_02013C58
	b _02013C38
_020138E4:
	mov r0, #3
	strh r0, [r7]
	ldr r0, [r6, #0x20]
	mov r3, #1
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r0, r4
	mov r1, r8
	bl sub_020115AC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013930
	mov r0, #1
	mov r2, #0
	bl sub_02013C58
	b _02013C38
_02013930:
	strh r8, [r7, #0xc6]
	add r1, sp, #0xc
	add r0, r5, #0x10
	mov r2, #0x40
	bl sub_0302D91C
	ldrh r0, [r7, #0xe6]
	cmp r0, #2
	bne _0201398C
	mov r0, #0x20
	strh r0, [sp, #0x16]
	ldr r0, [r5, #0x54]
	add r1, sp, #0x20
	strh r0, [sp, #0x18]
	ldr r2, [r5, #0x54]
	add r0, r6, #8
	mov r2, r2, lsr #0x10
	strh r2, [sp, #0x1a]
	ldrh ip, [r5, #0x58]
	mov r3, #0
	mov r2, #0x18
	strh ip, [sp, #0x1c]
	strh r3, [sp, #0x1e]
	bl sub_0302D91C
_0201398C:
	add r2, sp, #0xc
	mov r0, r4
	mov r1, #0x7d0
	bl sub_020116C4
	ldrh r1, [r0, #4]
	cmp r1, #0
	ldreqh r2, [r0, #6]
	cmpeq r2, #0
	beq _020139C0
	ldrh r2, [r0, #6]
	mov r0, #3
	bl sub_02013C58
	b _02013C38
_020139C0:
	add r1, r7, #0x8a
	add r0, r0, #8
	add r1, r1, #0x100
	mov r2, #6
	bl sub_0302D91C
	add r0, r7, #0x8a
	add r1, sp, #6
	add r0, r0, #0x100
	mov r2, #6
	bl sub_0302D91C
	ldrh r2, [r6, #0x26]
	add r1, sp, #6
	mov r0, r4
	mov r3, #0x7d0
	bl sub_0201173C
	ldrh r1, [r0, #4]
	cmp r1, #0xc
	ldreqh r2, [r0, #6]
	cmpeq r2, #0x13
	bne _02013A30
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013C38
_02013A30:
	cmp r1, #0
	ldreqh r2, [r0, #6]
	cmpeq r2, #0
	beq _02013A50
	ldrh r2, [r0, #6]
	mov r0, #4
	bl sub_02013C58
	b _02013C38
_02013A50:
	add r0, r7, #0x8a
	add r1, sp, #0
	add r0, r0, #0x100
	mov r2, #6
	bl sub_0302D91C
	add r1, sp, #0
	mov r0, r4
	mov r2, #1
	mov r3, #0x7d0
	bl sub_02011834
	mov r4, r0
	bl sub_0302D4F0
	ldrh r2, [r4, #4]
	mov r6, r0
	cmp r2, #0xc
	ldreqh r1, [r4, #6]
	cmpeq r1, #0x13
	bne _02013ABC
	bl sub_0302D504
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_03036B24
	b _02013C38
_02013ABC:
	cmp r2, #0
	ldreqh r0, [r4, #6]
	cmpeq r0, #0
	beq _02013AE8
	mov r0, r6
	bl sub_0302D504
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #6]
	mov r0, #6
	bl sub_02013C58
	b _02013C38
_02013AE8:
	ldrh r1, [r4, #8]
	add r0, r7, #0x100
	strh r1, [r0, #0x88]
	ldrh r0, [r5, #0x58]
	add r1, r7, #0x1f8
	strh r0, [r7, #0xba]
	mov r0, #1
	mov r2, #0x10
	bl sub_0302D764
	ldrh r0, [r5, #0x12]
	and r0, r0, #0xff
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r4, r0, #0xff
	mov r0, r4
	bl sub_0200FDC8
	strh r0, [r7, #0xbc]
	mov r0, r4
	bl sub_0200FD54
	bl sub_0302D4F0
	add r1, r7, #0x100
	mov r2, #1
	strh r2, [r1, #0x82]
	strh r2, [r7, #0x86]
	ldr r1, [r7, #0x7bc]
	ldr r2, [r7, #0x7b8]
	cmp r1, #0
	mov r4, r0
	cmpeq r2, #0
	beq _02013B78
	bl sub_0302CA0C
	orr r0, r0, #1
	str r0, [r7, #0x738]
	orr r0, r1, #0
	str r0, [r7, #0x73c]
_02013B78:
	mov r0, #8
	strh r0, [r7]
	ldrb r0, [r5, #0x5b]
	tst r0, #4
	movne r1, #0x2a
	ldrh r0, [r5, #0x5c]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200FF90
	ldrb r0, [r5, #0x5b]
	tst r0, #4
	movne r1, #6
	ldrh r0, [r5, #0x5e]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200FFE0
	mov r0, r4
	bl sub_0302D504
	mov r0, #1
	strh r0, [r7, #0xc2]
	bl sub_03036B70
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #7
	strh r0, [r4, #8]
	add r0, r7, #0x100
	ldrh r2, [r0, #0x88]
	add r1, r7, #0x8a
	strh r2, [r4, #0xa]
	add r0, r1, #0x100
	add r1, r4, #0x10
	mov r2, #6
	bl sub_0302D91C
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x18]
	bl sub_03036B24
	mov r0, r6
	bl sub_0302D504
_02013C38:
	add sp, sp, #0x250
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02013C44: .word 0x027F8878
_02013C48: .word 0x00000216
_02013C4C: .word 0x00002710
_02013C50: .word 0x0000020B
_02013C54: .word 0x00000303
	arm_func_end sub_020136B4

	arm_func_start sub_02013C58
sub_02013C58: ; 0x02013C58
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_03036B70
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xe]
	bl sub_03036B24
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_02013C58

	arm_func_start sub_02013C94
sub_02013C94: ; 0x02013C94
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	add r2, sp, #0
	mov r3, r1, lsl #0x10
	mov r1, #0
	mov r4, r3, lsr #0x10
	bl sub_02013CEC
	cmp r0, #1
	bne _02013CE0
	bl sub_03036B70
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r4, [r0, #8]
	ldrh r1, [sp]
	strh r1, [r0, #0xa]
	bl sub_03036B24
_02013CE0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_02013C94

	arm_func_start sub_02013CEC
sub_02013CEC: ; 0x02013CEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x220
	ldr r3, _02014270 ; =0x027F8878
	ldr r4, [r0, #4]
	movs sl, r1
	ldrne r0, [r0, #8]
	mov r1, r4, lsl #0x10
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov fp, #0
	ldr r7, [r3, #0x550]
	mov r8, r1, lsr #0x10
	ldrh r1, [r7]
	mov r0, r0, lsr #0x10
	cmp r1, #9
	str r2, [sp]
	mov r5, fp
	str r0, [sp, #8]
	cmpne r1, #7
	bne _02013D4C
	ldr r0, [r7, #0xc]
	cmp r0, #1
	moveq r5, #1
	b _02013E44
_02013D4C:
	cmp r1, #0xa
	cmpne r1, #8
	bne _02013E08
	bl sub_0302D4F0
	add r1, r7, #0x100
	ldrh r1, [r1, #0x82]
	mov r4, r0
	cmp r1, #0
	bne _02013DB0
	bl sub_0302D504
	cmp sl, #0
	bne _02013DA8
	bl sub_03036B70
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r8, [r0, #8]
	strh r1, [r0, #0xa]
	bl sub_03036B24
_02013DA8:
	mov r0, #0
	b _02014264
_02013DB0:
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _02013DE0
	mov r0, #0
	str r0, [r7, #0xc]
	mov r5, #1
	bl sub_0201537C
	bl sub_0200FE30
	ldrh r0, [r7]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r7]
_02013DE0:
	add r0, r7, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r7, #0x86]
	str r1, [r7, #0x14]
	str r1, [r7, #0x10]
	mov r0, r4
	str r1, [r7, #0x1c]
	bl sub_0302D504
	b _02013E44
_02013E08:
	cmp sl, #0
	bne _02013E3C
	bl sub_03036B70
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, fp
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r8, [r0, #8]
	strh r1, [r0, #0xa]
	bl sub_03036B24
_02013E3C:
	mov r0, #0
	b _02014264
_02013E44:
	ldrh r0, [r7]
	cmp r0, #0xa
	cmpne r0, #8
	bne _0201406C
	add r0, r7, #0x8a
	add r1, sp, #0x1a
	add r0, r0, #0x100
	mov r2, #6
	bl sub_0302D91C
	mov sb, #0
	add r6, sp, #0x1a
	mov r4, #3
	b _02013EFC
_02013E78:
	add r0, sp, #0x20
	mov r1, r6
	mov r2, r4
	bl sub_020117BC
	ldrh r1, [r0, #4]
	cmp r1, #7
	bgt _02013EB4
	bge _02013EBC
	cmp r1, #1
	bgt _02013EC4
	cmp r1, #0
	blt _02013EC4
	cmpne r1, #1
	beq _02013F04
	b _02013EC4
_02013EB4:
	cmp r1, #0xc
	bne _02013EC4
_02013EBC:
	add sb, sb, #1
	b _02013EFC
_02013EC4:
	cmp sl, #0
	mov r2, r8
	mov r0, #5
	mov r3, #0
	beq _02013EE0
	bl sub_02014380
	b _02013EE4
_02013EE0:
	bl sub_0201433C
_02013EE4:
	cmp r5, #0
	beq _02013EF4
	mov r0, #1
	bl sub_0201700C
_02013EF4:
	mov r0, #0
	b _02014264
_02013EFC:
	cmp sb, #2
	blt _02013E78
_02013F04:
	mov r0, #0
	strh r0, [r7, #0xc2]
	mov r0, #3
	mov fp, #1
	strh r0, [r7]
	add r0, sp, #0x20
	mov r1, fp
	bl sub_02011558
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013F68
	cmp sl, #0
	mov r2, r8
	mov r0, #0
	mov r3, fp
	beq _02013F4C
	bl sub_02014380
	b _02013F50
_02013F4C:
	bl sub_0201433C
_02013F50:
	cmp r5, #0
	beq _02013F60
	mov r0, #1
	bl sub_0201700C
_02013F60:
	mov r0, #0
	b _02014264
_02013F68:
	add r0, sp, #0x20
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02013FB8
	ldr r0, _02014274 ; =0x00000302
	cmp sl, #0
	mov r2, r8
	beq _02013F98
	mov r3, fp
	bl sub_02014380
	b _02013FA0
_02013F98:
	mov r3, fp
	bl sub_0201433C
_02013FA0:
	cmp r5, #0
	beq _02013FB0
	mov r0, #1
	bl sub_0201700C
_02013FB0:
	mov r0, #0
	b _02014264
_02013FB8:
	mov r0, #2
	strh r0, [r7]
	mov r1, #0
	str r1, [r7, #0x198]
	add r3, r7, #0x100
	add r0, r7, #0x19c
	mov r2, #0x50
	strh r1, [r3, #0x96]
	bl sub_0302D860
	bl sub_0200FF5C
	cmp sl, #1
	bne _02014048
	bl sub_03036B70
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	mov r2, #6
	strh r0, [r4, #0xc]
	add r0, r7, #0x100
	ldrh r1, [r0, #0x88]
	add r0, sp, #0x1a
	strh r1, [r4, #0xa]
	add r1, r4, #0x10
	bl sub_0302D91C
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x18]
	bl sub_03036B24
	b _02014058
_02014048:
	mov r0, #0
	add r2, sp, #0x1a
	mov r1, r0
	bl sub_02014278
_02014058:
	cmp r5, #0
	beq _02014254
	mov r0, #1
	bl sub_0201700C
	b _02014254
_0201406C:
	mov r6, #1
	b _0201424C
_02014074:
	add r0, r7, #0x100
	ldrh r0, [r0, #0x82]
	mov r1, #1
	mov sb, r1, lsl r6
	and r0, r0, r8
	tst sb, r0
	beq _02014248
	sub r1, r6, #1
	mov r2, #6
	mul r0, r1, r2
	str r0, [sp, #0x10]
	add r0, r7, #0x128
	str r0, [sp, #0xc]
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	add r1, sp, #0x14
	bl sub_0302D91C
	mov r4, #0
	b _02014138
_020140D0:
	add r0, sp, #0x20
	add r1, sp, #0x14
	mov r2, #3
	bl sub_020117BC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02014140
	cmp r1, #7
	cmpne r1, #0xc
	bne _02014100
	add r4, r4, #1
	b _02014138
_02014100:
	cmp sl, #0
	mov r2, r8
	mov r0, #5
	mov r3, fp
	beq _0201411C
	bl sub_02014380
	b _02014120
_0201411C:
	bl sub_0201433C
_02014120:
	cmp r5, #0
	beq _02014130
	mov r0, #1
	bl sub_0201700C
_02014130:
	mov r0, #0
	b _02014264
_02014138:
	cmp r4, #2
	blt _020140D0
_02014140:
	bl sub_0302D4F0
	mov r4, r0
	add r1, r7, #0x100
	ldrh r3, [r1, #0x82]
	tst r3, sb
	beq _02014244
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov ip, #1
	add r0, r2, r0
	ldr r2, [sp, #4]
	orr r2, fp, ip, lsl r2
	mov r2, r2, lsl #0x10
	mov fp, r2, lsr #0x10
	mvn r2, sb
	and r3, r3, r2
	strh r3, [r1, #0x82]
	ldrh r3, [r7, #0x86]
	mov r1, #0
	and r2, r3, r2
	strh r2, [r7, #0x86]
	ldr r2, [sp, #4]
	add r2, r7, r2, lsl #3
	str r1, [r2, #0x738]
	str r1, [r2, #0x73c]
	mov r2, #6
	bl sub_0302D860
	mov r0, r4
	bl sub_0302D504
	cmp sl, #1
	bne _02014218
	bl sub_03036B70
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	add r1, r4, #0xa
	strh r0, [r4, #0x12]
	ldr r0, [sp, #4]
	mov r2, #6
	strh r0, [r4, #0x10]
	add r0, sp, #0x14
	bl sub_0302D91C
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_03036B24
	b _0201422C
_02014218:
	mov r0, r6, lsl #0x10
	mov r1, r0, lsr #0x10
	add r2, sp, #0x14
	mov r0, #1
	bl sub_02014278
_0201422C:
	cmp r5, #0
	beq _02014248
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0201700C
	b _02014248
_02014244:
	bl sub_0302D504
_02014248:
	add r6, r6, #1
_0201424C:
	cmp r6, #0x10
	blt _02014074
_02014254:
	ldr r0, [sp]
	cmp r0, #0
	strneh fp, [r0]
	mov r0, #1
_02014264:
	add sp, sp, #0x220
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02014270: .word 0x027F8878
_02014274: .word 0x00000302
	arm_func_end sub_02013CEC

	arm_func_start sub_02014278
sub_02014278: ; 0x02014278
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _02014334 ; =0x027F8878
	mov r8, r0
	ldr r5, [r3, #0x550]
	mov r7, r1
	mov r6, r2
	bl sub_03036B70
	mov r4, r0
	mov r0, #0
	strh r0, [r4, #2]
	cmp r8, #0
	mov r1, #0x1a
	mov r2, #6
	beq _020142E8
	mov r0, #8
	strh r0, [r4]
	strh r1, [r4, #8]
	ldr r0, _02014338 ; =0x0000F001
	add r1, r4, #0xa
	strh r0, [r4, #0x12]
	strh r7, [r4, #0x10]
	mov r0, r6
	bl sub_0302D91C
	ldrh r0, [r5, #0x30]
	strh r0, [r4, #0x2c]
	ldrh r0, [r5, #0x32]
	strh r0, [r4, #0x2e]
	b _02014324
_020142E8:
	mov r0, #0xc
	strh r0, [r4]
	ldr r0, _02014338 ; =0x0000F001
	strh r1, [r4, #8]
	strh r0, [r4, #0xc]
	add r0, r5, #0x100
	ldrh r1, [r0, #0x88]
	mov r0, r6
	strh r1, [r4, #0xa]
	add r1, r4, #0x10
	bl sub_0302D91C
	ldrh r0, [r5, #0x30]
	strh r0, [r4, #0x16]
	ldrh r0, [r5, #0x32]
	strh r0, [r4, #0x18]
_02014324:
	mov r0, r4
	bl sub_03036B24
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02014334: .word 0x027F8878
_02014338: .word 0x0000F001
	arm_func_end sub_02014278

	arm_func_start sub_0201433C
sub_0201433C: ; 0x0201433C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_03036B70
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	strh r5, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_0201433C

	arm_func_start sub_02014380
sub_02014380: ; 0x02014380
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_03036B70
	mov r1, #0x25
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	strh r5, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_02014380

	arm_func_start sub_020143C4
sub_020143C4: ; 0x020143C4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x204
	ldr r1, _0201474C ; =0x027F8878
	mov sl, r0
	ldr r8, [r1, #0x550]
	ldr fp, [sl, #4]
	ldrh r1, [r8, #0x9c]
	ldr r4, [sl, #8]
	ldr r5, [sl, #0xc]
	ldr r6, [sl, #0x10]
	ldr r0, _02014750 ; =0x027F7878
	cmp r1, #0
	mov r7, #0
	bne _02014448
	ldrh r1, [r8, #0x3c]
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	cmp r6, r1
	add r1, r8, #0x100
	ldrh r1, [r1, #0x88]
	movlo r7, #6
	cmp r1, #0
	ldrneh r1, [r8, #0x3e]
	addne r1, r1, #0x51
	bne _0201443C
	ldrh r2, [r8, #0x3e]
	ldrh r1, [r8, #0xf8]
	add r2, r2, #0xc
	mul r1, r2, r1
	add r1, r1, #0x29
_0201443C:
	bic r1, r1, #0x1f
	cmp r4, r1
	movlo r7, #6
_02014448:
	ldrh r1, [r8, #0xe6]
	cmp r1, #2
	bne _02014478
	add r0, r0, #0x1000
	ldr r1, [r0, #0x54c]
	add r0, r8, #0x100
	ldrh r1, [r1, #0x46]
	ldrh r3, [r0, #0xf6]
	mov r2, #1
	mov r0, r2, lsl r1
	tst r3, r0, asr #1
	moveq r7, #6
_02014478:
	cmp r7, #0
	beq _020144A0
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	strh r7, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_03036B24
	b _02014740
_020144A0:
	ldr r0, [r8, #0xc]
	mov r1, #0
	cmp r0, #0
	strne r1, [r8, #0xc]
	movne r1, #1
	cmp r1, #0
	beq _020144C4
	ldr r0, _02014754 ; =0x0000FFFF
	bl sub_0201700C
_020144C4:
	bl sub_02015B60
	bl sub_0302D4F0
	str r0, [sp]
	add r0, sl, #0x14
	mov r1, #0
	bl sub_02017C0C
	ldr r0, _0201474C ; =0x027F8878
	ldr r7, [sl, #0x30]
	ldr sb, [r0, #0x550]
	ldrh r0, [sb]
	cmp r0, #9
	cmpne r0, #0xa
	beq _020145B8
	bl sub_0302D4F0
	tst r7, #4
	ldrneh r2, [sl, #0x38]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x5c]
	cmp r2, #0
	moveq r2, #0x10
	tst r7, #1
	ldrneh r3, [sl, #0x34]
	ldreqh r3, [sb, #0x58]
	cmp r3, #0
	moveq r3, #0x10
	cmp r3, r2
	movhi r3, r2
	tst r7, #2
	ldrneh ip, [sl, #0x36]
	ldreqh ip, [sb, #0x5a]
	strh r2, [r1, #0xc4]
	cmp ip, #0
	moveq ip, #0x10
	cmp ip, r2
	strh r3, [r1, #0xc0]
	movhi ip, r2
	strh ip, [r1, #0xc2]
	ldrsh r1, [sb, #0x62]
	cmp r1, r2
	strgth r2, [sb, #0x62]
	tst r7, #0x200
	ldrneh r2, [sl, #0x3a]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x98]
	tst r7, #0x400
	strh r2, [r1, #0xca]
	ldrneb r2, [sl, #0x3c]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x92]
	tst r7, #0x800
	strh r2, [r1, #0xc6]
	ldrneb r2, [sl, #0x3d]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x94]
	tst r7, #0x1000
	strh r2, [r1, #0xc8]
	ldrneb r2, [sl, #0x3e]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x9a]
	strh r2, [r1, #0xcc]
	bl sub_0302D504
_020145B8:
	ldrh r0, [r8]
	add r0, r0, #0xf9
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _02014718
	mov r2, #0
	strh r2, [r8, #0x84]
	strh r2, [r8, #0x5e]
	mov r1, #1
	strh r1, [r8, #0x60]
	strh r2, [r8, #0x88]
	strh r2, [r8, #0x9e]
	mov r0, #0x3c
	strh r0, [r8, #0xa0]
	str r2, [r8, #0x734]
	strh r2, [r8, #0x8a]
	strh r2, [r8, #0x8c]
	strh r2, [r8, #0x8e]
	strh r2, [r8, #0x90]
	strh r2, [r8, #0x66]
	str fp, [r8, #0x74]
	strh r4, [r8, #0x72]
	add r0, fp, r4
	str r0, [r8, #0x78]
	strh r2, [r8, #0x70]
	str r5, [r8, #0x7c]
	strh r6, [r8, #0x80]
	strh r2, [r8, #0x62]
	strh r2, [r8, #0x64]
	strh r2, [r8, #0x68]
	strh r2, [r8, #0x6a]
	rsb r0, r1, #0x10000
	strh r0, [r8, #0xbe]
	strh r1, [r8, #0xc0]
	bl sub_0302CA0C
	orr r1, r1, #0
	orr r2, r0, #1
	mov r3, #0
_02014658:
	add r0, r8, r3, lsl #3
	str r2, [r0, #0x738]
	add r3, r3, #1
	str r1, [r0, #0x73c]
	cmp r3, #0x10
	blt _02014658
	bl sub_0200FE90
	mov r0, #0
	strh r0, [r8, #0xce]
	bl sub_02015390
	ldrh r0, [r8]
	cmp r0, #8
	moveq r0, #0xa
	streqh r0, [r8]
	beq _020146A0
	cmp r0, #7
	moveq r0, #9
	streqh r0, [r8]
_020146A0:
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_03036B24
	mov r1, #1
	ldr r0, [sp]
	str r1, [r8, #0xc]
	bl sub_0302D504
	add r0, sp, #4
	mov r1, #1
	bl sub_02011EF0
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02014740
	bl sub_03036B70
	mov r2, #0xe
	strh r2, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	add r1, r2, #0x208
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
	bl sub_03036B24
	b _02014740
_02014718:
	ldr r0, [sp]
	bl sub_0302D504
	bl sub_03036B70
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_03036B24
_02014740:
	add sp, sp, #0x204
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201474C: .word 0x027F8878
_02014750: .word 0x027F7878
_02014754: .word 0x0000FFFF
	arm_func_end sub_020143C4

	arm_func_start sub_02014758
sub_02014758: ; 0x02014758
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _0201488C ; =0x027F8878
	ldr r2, [r0, #0x10]
	ldr sl, [r1, #0x550]
	ldr r5, [r0, #8]
	add r4, sl, #0x100
	ldr r3, [r0, #0x14]
	ldrh r8, [r4, #0x88]
	mov r1, r5, lsl #0x10
	ldrh sb, [r4, #0x82]
	ldr fp, [r0, #4]
	ldr r5, [r0, #0xc]
	cmp r8, #0
	ldr r6, [r0, #0x18]
	ldr r7, [r0, #0x1c]
	mov r2, r2, lsl #0x10
	mov r0, r2, lsr #0x10
	str r0, [sp, #0x10]
	ldr r0, [sl, #0xc]
	movne r5, #1
	cmp r0, #0
	mov r3, r3, lsl #0x10
	mov r4, r1, lsr #0x10
	mov r1, r3, lsr #0x10
	moveq r8, #3
	beq _020147EC
	tst r5, sb
	moveq r8, #0
	beq _020147EC
	str fp, [sp]
	stmib sp, {r4, r6, r7}
	ldr r2, [sp, #0x10]
	mov r0, sb
	mov r3, r5
	bl sub_02016BA8
	mov r8, r0
_020147EC:
	cmp r8, #2
	beq _02014880
	bl sub_03036B70
	mov r1, #0x81
	strh r1, [r0]
	strh r8, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldr r1, [sp, #0x10]
	cmp r8, #0xa
	strh r1, [r0, #0xa]
	andeq r1, r5, sb
	strh r5, [r0, #0xc]
	movne r1, #0
	strh r1, [r0, #0xe]
	mov r1, #0
	strh r1, [r0, #0x10]
	strh r4, [r0, #0x18]
	str fp, [r0, #0x14]
	str r6, [r0, #0x1c]
	ldr r1, _02014890 ; =0x0000FFFF
	str r7, [r0, #0x20]
	strh r1, [r0, #0x1a]
	add r1, sl, #0x100
	ldrh r1, [r1, #0x88]
	ldrh r2, [sl, #0x30]
	cmp r1, #0
	ldrh r3, [sl, #0x32]
	moveq r1, r2
	movne r1, r3
	strh r1, [r0, #0x24]
	add r1, sl, #0x100
	ldrh r1, [r1, #0x88]
	cmp r1, #0
	movne r3, r2
	strh r3, [r0, #0x26]
	bl sub_03036B24
_02014880:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201488C: .word 0x027F8878
_02014890: .word 0x0000FFFF
	arm_func_end sub_02014758

	arm_func_start sub_02014894
sub_02014894: ; 0x02014894
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x200
	ldr r0, _020149A4 ; =0x027F8878
	mov r4, #0
	ldr r6, [r0, #0x550]
	ldrh r0, [r6]
	cmp r0, #9
	cmpne r0, #0xa
	beq _020148D4
	bl sub_03036B70
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02014998
_020148D4:
	bl sub_0302D4F0
	ldr r1, [r6, #0xc]
	mov r5, r0
	mov r0, #0
	cmp r1, #1
	str r0, [r6, #0xc]
	moveq r4, #1
	bl sub_0201537C
	bl sub_0200FE30
	ldrh r0, [r6]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r6]
	beq _02014918
	cmp r0, #9
	moveq r0, #7
	streqh r0, [r6]
_02014918:
	mov r0, r5
	bl sub_0302D504
	add r0, sp, #0
	mov r1, #0
	bl sub_02011EF0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02014944
	ldr r0, _020149A8 ; =0x00000216
	bl sub_020149B0
	b _02014998
_02014944:
	add r0, sp, #0
	mov r1, #7
	bl sub_02011B9C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02014968
	mov r0, #0x104
	bl sub_020149B0
	b _02014998
_02014968:
	mov r0, #0
	strh r0, [r6, #0x8a]
	cmp r4, #0
	beq _02014980
	ldr r0, _020149AC ; =0x0000FFFF
	bl sub_0201700C
_02014980:
	bl sub_03036B70
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02014998:
	add sp, sp, #0x200
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020149A4: .word 0x027F8878
_020149A8: .word 0x00000216
_020149AC: .word 0x0000FFFF
	arm_func_end sub_02014894

	arm_func_start sub_020149B0
sub_020149B0: ; 0x020149B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03036B70
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020149B0

	arm_func_start sub_020149E4
sub_020149E4: ; 0x020149E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02014A6C ; =0x027F8878
	ldr r2, [r0, #8]
	ldr r4, [r1, #0x550]
	mov r5, r2, lsl #0x10
	ldr r6, [r0, #4]
	mov r7, r5, lsr #0x10
	bl sub_0302D4F0
	str r6, [r4, #0xb0]
	strh r7, [r4, #0xb8]
	add r1, r6, r5, lsr #16
	str r1, [r4, #0xb4]
	mov r1, #0
	strh r1, [r4, #0xae]
	str r1, [r4, #0xa8]
	strh r1, [r4, #0xac]
	str r1, [r4, #0x18]
	mov r1, #0xb
	strh r1, [r4]
	mov r5, r0
	bl sub_03036B70
	mov r1, #0x11
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xe
	strh r1, [r0, #4]
	bl sub_03036B24
	mov r1, #1
	mov r0, r5
	str r1, [r4, #0x10]
	bl sub_0302D504
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02014A6C: .word 0x027F8878
	arm_func_end sub_020149E4

	arm_func_start sub_02014A70
sub_02014A70: ; 0x02014A70
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x230
	ldr r1, _02014B64 ; =0x027F8878
	mov r5, r0
	ldr r4, [r1, #0x550]
	add r0, r5, #4
	add r1, r4, #0xa2
	mov r2, #6
	bl sub_0302D91C
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	str r0, [r4, #0xa8]
	ldr r2, [r5, #0x10]
	mov r0, #1
	strh r2, [r4, #0xac]
	str r0, [r4, #0x18]
	mov r0, #0
	mov r2, #0x30
	bl sub_0302D764
	mov r0, #0
	strh r0, [sp]
	ldr r1, [r5, #0x10]
	add r0, r4, #0x100
	strh r1, [sp, #6]
	ldrh r0, [r0, #0xec]
	add r1, sp, #0x18
	cmp r0, #2
	moveq r3, #0x14
	movne r3, #0xa
	add r0, r5, #4
	mov r2, #6
	strb r3, [sp, #0xe]
	bl sub_0302D91C
	add r1, sp, #0x1e
	add r0, r4, #0xe0
	mov r2, #6
	bl sub_0302D91C
	ldr r2, [r5, #0xc]
	add r0, sp, #0x30
	add r1, sp, #0
	str r2, [sp, #0x2c]
	bl sub_020119F0
	mov r4, r0
	bl sub_03036B70
	mov r1, #0x12
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	cmp r1, #0
	movne r1, #0x100
	strneh r1, [r0, #4]
	ldrneh r1, [r4, #4]
	strneh r1, [r0, #6]
	bl sub_03036B24
	add sp, sp, #0x230
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02014B64: .word 0x027F8878
	arm_func_end sub_02014A70

	arm_func_start sub_02014B68
sub_02014B68: ; 0x02014B68
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r0, _02014C20 ; =0x027F8878
	ldr r4, [r0, #0x550]
	bl sub_0302D4F0
	ldrh r1, [r4]
	cmp r1, #0xb
	beq _02014BA8
	bl sub_0302D504
	bl sub_03036B70
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02014C14
_02014BA8:
	mov r1, #0
	str r1, [r4, #0x10]
	mov r1, #8
	strh r1, [r4]
	bl sub_0302D504
	add r0, sp, #0
	mov r1, #7
	bl sub_02011B9C
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _02014BFC
	bl sub_03036B70
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x104
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	b _02014C14
_02014BFC:
	bl sub_03036B70
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02014C14:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02014C20: .word 0x027F8878
	arm_func_end sub_02014B68

	arm_func_start sub_02014C24
sub_02014C24: ; 0x02014C24
	stmdb sp!, {r3, lr}
	ldr r1, _02014CC8 ; =0x027F8878
	ldr r2, [r0, #4]
	ldr r3, [r1, #0x550]
	add r1, r3, #0x100
	strh r2, [r1, #0x96]
	ldrh r1, [r1, #0x96]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02014C74
_02014C4C: ; jump table
	b _02014C5C ; case 0
	b _02014C68 ; case 1
	b _02014C68 ; case 2
	b _02014C68 ; case 3
_02014C5C:
	mov r1, #0
	str r1, [r3, #0x198]
	b _02014C7C
_02014C68:
	mov r1, #1
	str r1, [r3, #0x198]
	b _02014C7C
_02014C74:
	mov r1, #0
	str r1, [r3, #0x198]
_02014C7C:
	ldr r1, [r3, #0x198]
	mov r2, #0x50
	cmp r1, #1
	bne _02014C9C
	ldr r0, [r0, #8]
	add r1, r3, #0x19c
	bl sub_0302D91C
	b _02014CA8
_02014C9C:
	add r0, r3, #0x19c
	mov r1, #0
	bl sub_0302D860
_02014CA8:
	bl sub_03036B70
	mov r1, #0x14
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02014CC8: .word 0x027F8878
	arm_func_end sub_02014C24

	arm_func_start sub_02014CCC
sub_02014CCC: ; 0x02014CCC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r1, _02014DC0 ; =0x027F8878
	mov r5, r0
	ldr r4, [r1, #0x550]
	ldr r1, [r5, #4]
	add r0, r4, #0x100
	strh r1, [r0, #0x96]
	ldrh r0, [r0, #0x96]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02014D24
_02014CFC: ; jump table
	b _02014D0C ; case 0
	b _02014D18 ; case 1
	b _02014D18 ; case 2
	b _02014D18 ; case 3
_02014D0C:
	mov r0, #0
	str r0, [r4, #0x198]
	b _02014D2C
_02014D18:
	mov r0, #1
	str r0, [r4, #0x198]
	b _02014D2C
_02014D24:
	mov r0, #0
	str r0, [r4, #0x198]
_02014D2C:
	ldr r0, [r4, #0x198]
	mov r2, #0x50
	cmp r0, #1
	bne _02014D4C
	ldr r0, [r5, #8]
	add r1, r4, #0x19c
	bl sub_0302D91C
	b _02014D58
_02014D4C:
	add r0, r4, #0x19c
	mov r1, #0
	bl sub_0302D860
_02014D58:
	ldr r1, [r5, #0xc]
	add r0, sp, #0
	strh r1, [r4, #0xc4]
	ldrh r1, [r4, #0xc4]
	bl sub_02011C48
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _02014D9C
	bl sub_03036B70
	mov r2, #0x14
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	rsb r1, r1, #0x208
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
_02014D9C:
	bl sub_03036B70
	mov r1, #0x27
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02014DC0: .word 0x027F8878
	arm_func_end sub_02014CCC

	arm_func_start sub_02014DC4
sub_02014DC4: ; 0x02014DC4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x280
	ldr r1, _02014EB0 ; =0x027F8878
	ldr r2, [r0, #4]
	ldr r4, [r1, #0x550]
	str r2, [r4, #0xe8]
	ldr r1, [r0, #8]
	strh r1, [r4, #0xec]
	ldr r1, [r0, #0xc]
	str r1, [r4, #0xf0]
	ldr r1, [r0, #0x10]
	strh r1, [r4, #0xf4]
	ldr r0, [r0, #0x14]
	and r0, r0, #0xff
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xf6]
	tst r0, #2
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xfa]
	tst r0, #4
	movne r1, #1
	moveq r1, #0
	tst r0, #8
	strh r1, [r4, #0xfc]
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xfe]
	add r0, sp, #0
	add r1, r4, #0xe8
	bl sub_0200FAFC
	ldrh r1, [r4, #0xec]
	add r0, sp, #0x80
	add r1, r1, #0x10
	mov r1, r1, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_02011FA8
	mov r4, r0
	bl sub_03036B70
	mov r1, #0x18
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	cmp r1, #0
	ldrne r1, _02014EB4 ; =0x00000245
	strneh r1, [r0, #4]
	ldrneh r1, [r4, #4]
	strneh r1, [r0, #6]
	bl sub_03036B24
	add sp, sp, #0x280
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02014EB0: .word 0x027F8878
_02014EB4: .word 0x00000245
	arm_func_end sub_02014DC4

	arm_func_start sub_02014EB8
sub_02014EB8: ; 0x02014EB8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, [r0, #4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_02011E94
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _02014F08
	bl sub_03036B70
	mov r2, #0x19
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x214
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	b _02014F20
_02014F08:
	bl sub_03036B70
	mov r1, #0x19
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02014F20:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02014EB8

	arm_func_start sub_02014F2C
sub_02014F2C: ; 0x02014F2C
	stmdb sp!, {r3, lr}
	bl sub_03036B70
	mov r1, #0x1a
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03036B24
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02014F2C

	arm_func_start sub_02014F50
sub_02014F50: ; 0x02014F50
	stmdb sp!, {r3, lr}
	bl sub_03036B70
	mov r1, #0x1b
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03036B24
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02014F50

	arm_func_start sub_02014F74
sub_02014F74: ; 0x02014F74
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x200
	ldmib r0, {r1, r2, r3}
	ldr r0, [r0, #0x10]
	mov r1, r1, lsl #0x10
	mov r4, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	ldr ip, _02015094 ; =0x027F8878
	mov r5, r4, lsr #0x10
	add r0, sp, #0
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	mov r3, r3, lsr #0x10
	ldr r4, [ip, #0x550]
	bl sub_02011DD0
	ldrh r6, [r0, #4]
	cmp r6, #0
	beq _02014FE8
	bl sub_03036B70
	mov r2, #0x1d
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x210
	strh r1, [r0, #4]
	strh r6, [r0, #6]
	bl sub_03036B24
	b _02015088
_02014FE8:
	ldr r0, _02015098 ; =0x0000FFFF
	cmp r5, r0
	beq _0201503C
	cmp r5, #0
	moveq r1, #1
	moveq r0, #0
	beq _02015030
	mov r0, #0x64
	mul r2, r5, r0
	ldr r0, _0201509C ; =0x000082EA
	mov r1, #0
	umull ip, r3, r2, r0
	mla r3, r2, r1, r3
	mov r1, r2, asr #0x1f
	mla r3, r1, r0, r3
	mov r1, ip, lsr #6
	mov r0, r3, lsr #6
	orr r1, r1, r3, lsl #26
_02015030:
	str r1, [r4, #0x7b8]
	str r0, [r4, #0x7bc]
	b _02015048
_0201503C:
	mov r0, #0
	str r0, [r4, #0x7b8]
	str r0, [r4, #0x7bc]
_02015048:
	bl sub_0302CA0C
	orr r1, r1, #0
	orr r2, r0, #1
	mov r3, #0
_02015058:
	add r0, r4, r3, lsl #3
	str r2, [r0, #0x738]
	add r3, r3, #1
	str r1, [r0, #0x73c]
	cmp r3, #0x10
	blt _02015058
	bl sub_03036B70
	mov r1, #0x1d
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02015088:
	add sp, sp, #0x200
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02015094: .word 0x027F8878
_02015098: .word 0x0000FFFF
_0201509C: .word 0x000082EA
	arm_func_end sub_02014F74

	arm_func_start sub_020150A0
sub_020150A0: ; 0x020150A0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x214
	ldr r1, _0201523C ; =0x027F8878
	mov r7, r0
	ldr r6, [r1, #0x550]
	add r4, sp, #0x14
	ldrh r0, [r6]
	cmp r0, #2
	beq _020150E0
	bl sub_03036B70
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02015230
_020150E0:
	mov r0, r4
	bl sub_02012114
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02015100
	mov r0, #0x308
	bl sub_02015248
	b _02015230
_02015100:
	ldrh r1, [r0, #6]
	mov r0, #2
	strh r0, [r6, #0xe6]
	cmp r1, #0x10
	bne _02015180
	mov r1, r4
	mov r0, #0xa
	bl sub_0200FBC0
	cmp r0, #0
	beq _02015230
	mov r0, r4
	bl sub_020120A0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02015148
	ldr r0, _02015240 ; =0x00000303
	bl sub_02015248
	b _02015230
_02015148:
	mov r0, #3
	mov r1, #1
	strh r0, [r6]
	mov r0, r4
	mov r3, r1
	mov r2, #0
	bl sub_020115AC
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _0201517C
	bl sub_02015248
	b _02015230
_0201517C:
	strh r0, [r6, #0xc6]
_02015180:
	ldrh r8, [r7, #2]
	ldrh sb, [r7, #4]
	ldrh r5, [r7, #6]
	ldrh r7, [r7, #8]
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x10
	bl sub_0302D860
	strb r5, [sp, #4]
	add r0, sp, #4
	str r0, [sp]
	mov r0, r4
	mov r1, r8
	mov r2, sb
	mov r3, r7
	bl sub_02011970
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020151D8
	mov r0, #0xa
	bl sub_02015248
	b _02015230
_020151D8:
	ldrh r1, [r0, #8]
	mov r0, r4
	and r4, r1, #0xff
	mov r1, r1, lsl #8
	mov r5, r1, lsr #0x10
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02015208
	ldr r0, _02015244 ; =0x00000302
	bl sub_02015248
	b _02015230
_02015208:
	mov r0, #2
	strh r0, [r6]
	bl sub_03036B70
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r4, [r0, #8]
	strh r5, [r0, #0xa]
	bl sub_03036B24
_02015230:
	add sp, sp, #0x214
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0201523C: .word 0x027F8878
_02015240: .word 0x00000303
_02015244: .word 0x00000302
	arm_func_end sub_020150A0

	arm_func_start sub_02015248
sub_02015248: ; 0x02015248
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_03036B70
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02015248

	arm_func_start sub_0201527C
sub_0201527C: ; 0x0201527C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	add r0, sp, #0
	bl sub_020120CC
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _020152C0
	bl sub_03036B70
	mov r2, #0x1f
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x304
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	b _020152D8
_020152C0:
	bl sub_03036B70
	mov r1, #0x1f
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_020152D8:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0201527C

	arm_func_start sub_020152E4
sub_020152E4: ; 0x020152E4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	add r0, sp, #0
	bl sub_020120FC
	mov r5, r0
	ldrh r4, [r5, #4]
	cmp r4, #0
	beq _0201532C
	bl sub_03036B70
	mov r2, #0x20
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	rsb r1, r1, #0x308
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	b _0201535C
_0201532C:
	bl sub_03036B70
	mov r4, r0
	mov r0, #0x20
	strh r0, [r4]
	mov r3, #0
	add r0, r5, #8
	add r1, r4, #8
	mov r2, #0xb4
	strh r3, [r4, #2]
	bl sub_0302D78C
	mov r0, r4
	bl sub_03036B24
_0201535C:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020152E4

	arm_func_start sub_02015368
sub_02015368: ; 0x02015368
	ldr ip, _02015374 ; =sub_037FD884
	ldr r0, _02015378 ; =0x0380B460
	bx ip
	.align 2, 0
_02015374: .word sub_037FD884
_02015378: .word 0x0380B460
	arm_func_end sub_02015368

	arm_func_start sub_0201537C
sub_0201537C: ; 0x0201537C
	ldr ip, _02015388 ; =sub_037FDA38
	ldr r0, _0201538C ; =0x0380B460
	bx ip
	.align 2, 0
_02015388: .word sub_037FDA38
_0201538C: .word 0x0380B460
	arm_func_end sub_0201537C

	arm_func_start sub_02015390
sub_02015390: ; 0x02015390
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _02015430 ; =0x027F8878
	ldr r0, _02015434 ; =0x0380B460
	ldr r4, [r1, #0x550]
	ldrh r1, [r4, #0xe6]
	cmp r1, #1
	bne _020153E0
	ldr r1, [r0]
	cmp r1, #0
	beq _020153C0
	bl sub_0302D228
_020153C0:
	ldr r0, _02015434 ; =0x0380B460
	mov r1, #0xcb
	mov ip, #3
	ldr r3, _02015438 ; =0x027E5F8C
	add r2, r1, #0x3c
	str ip, [sp]
	bl sub_0302D088
	b _02015424
_020153E0:
	cmp r1, #2
	bne _02015424
	mov r1, #0
	str r1, [r4, #0x1c]
	ldr r1, [r0]
	cmp r1, #0
	beq _02015400
	bl sub_0302D228
_02015400:
	ldr r0, _02015434 ; =0x0380B460
	mov r2, #1
	mov r1, #0xc8
	ldr r3, _0201543C ; =0x027E5C50
	str r2, [sp]
	add r2, r1, #0x3f
	bl sub_0302D088
	mov r0, #0
	str r0, [r4, #0xd8]
_02015424:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_02015430: .word 0x027F8878
_02015434: .word 0x0380B460
_02015438: .word 0x027E5F8C
_0201543C: .word 0x027E5C50
	arm_func_end sub_02015390

	arm_func_start sub_02015440
sub_02015440: ; 0x02015440
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _0201557C ; =0x027F8878
	ldr r2, _02015580 ; =0x0380FFF0
	ldr r0, [r1, #0x550]
	ldrh r3, [r2]
	str r3, [r0, #0xd0]
	ldr r2, [r0, #0xd4]
	cmp r2, r3
	beq _02015520
	str r3, [r0, #0xd4]
	ldr r1, [r1, #0x550]
	ldr r3, _02015584 ; =0x048080F8
	ldr r2, [r1, #0xd0]
	mov r2, r2, lsl #6
	str r2, [r1, #0xd0]
	ldrh r2, [r3]
	ldrh lr, [r3, #2]
	ldrh r4, [r3]
	cmp r2, r4
	ldrhih lr, [r3, #2]
	ldr r3, _02015588 ; =0x04000006
	ldr r2, _0201558C ; =0x00000107
	ldrh ip, [r3]
	ldr r3, _02015590 ; =0x003FFFC0
	sub ip, r2, ip
	orr lr, r4, lr, lsl #16
	ldr r2, [r1, #0xd0]
	and lr, lr, r3
	rsb ip, ip, ip, lsl #7
	add ip, ip, lr, lsl #1
	and lr, r3, ip, lsr #1
	cmp r2, lr
	movhi r2, #0
	strhi r2, [r1, #0xd8]
	bhi _02015520
	mov ip, #1
	b _02015510
_020154D8:
	ldr r2, [r1, #0xd0]
	add r2, r2, #0x4b
	add r3, r2, #0x4100
	str r3, [r1, #0xd0]
	cmp r3, lr
	bls _0201550C
	ldr r2, _02015594 ; =0x0000400E
	sub r3, r3, lr
	cmp r3, r2
	str r3, [r1, #0xd8]
	movhi r2, #0
	strhi r2, [r1, #0xd8]
	b _02015520
_0201550C:
	add ip, ip, #1
_02015510:
	cmp ip, #0x1e
	blt _020154D8
	mov r2, #0
	str r2, [r1, #0xd8]
_02015520:
	ldr r1, [r0, #0xd8]
	cmp r1, #0x7f
	bls _0201554C
	ldr r0, _02015598 ; =0x0380B460
	mov r1, #0xd0
	mov ip, #2
	ldr r3, _0201559C ; =0x027E5DB4
	add r2, r1, #0x37
	str ip, [sp]
	bl sub_0302D088
	b _02015570
_0201554C:
	mov r2, #1
	str r2, [r0, #0x1c]
	mov r1, #4
	str r1, [sp]
	ldrsh r1, [r0, #0x42]
	ldr r0, _02015598 ; =0x0380B460
	ldr r3, _020155A0 ; =0x027E5E74
	rsb r2, r2, #0x108
	bl sub_0302D088
_02015570:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_0201557C: .word 0x027F8878
_02015580: .word 0x0380FFF0
_02015584: .word 0x048080F8
_02015588: .word 0x04000006
_0201558C: .word 0x00000107
_02015590: .word 0x003FFFC0
_02015594: .word 0x0000400E
_02015598: .word 0x0380B460
_0201559C: .word 0x027E5DB4
_020155A0: .word 0x027E5E74
	arm_func_end sub_02015440

	arm_func_start sub_020155A4
sub_020155A4: ; 0x020155A4
	stmdb sp!, {r3, lr}
	ldr r1, _02015650 ; =0x04000006
	ldr r0, _02015654 ; =0x027F8878
	ldrh ip, [r1]
	ldr r0, [r0, #0x550]
	cmp ip, #0xd0
	blt _0201561C
	cmp ip, #0xd2
	bge _0201561C
	ldr r1, [r0, #0xd8]
	cmp r1, #0x7f
	blo _0201561C
	mov r3, #1
	b _020155F4
_020155DC:
	ldr r2, [r0, #0xd8]
	rsb r1, r3, r3, lsl #6
	add r1, r1, #0x7f
	cmp r2, r1
	blo _020155FC
	add r3, r3, #1
_020155F4:
	cmp r3, #7
	blt _020155DC
_020155FC:
	ldr r1, _02015650 ; =0x04000006
	rsb r2, r3, #1
	add r2, ip, r2
	strh r2, [r1]
	ldr r2, [r0, #0xd8]
	rsb r1, r3, r3, lsl #6
	sub r1, r2, r1
	str r1, [r0, #0xd8]
_0201561C:
	ldr r1, [r0, #0xd8]
	ldr r2, _02015658 ; =0x00000107
	cmp r1, #0x7f
	movhs r1, #0
	strhs r1, [r0, #0x1c]
	mov r1, #4
	str r1, [sp]
	ldrsh r1, [r0, #0x42]
	ldr r0, _0201565C ; =0x0380B460
	ldr r3, _02015660 ; =0x027E5E74
	bl sub_0302D088
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02015650: .word 0x04000006
_02015654: .word 0x027F8878
_02015658: .word 0x00000107
_0201565C: .word 0x0380B460
_02015660: .word 0x027E5E74
	arm_func_end sub_020155A4

	arm_func_start sub_02015664
sub_02015664: ; 0x02015664
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _02015768 ; =0x027F8878
	ldr r4, [r0, #0x550]
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _0201575C
	ldr r0, _0201576C ; =0x0380B460
	mov r2, #1
	mov r1, #0xc8
	ldr r3, _02015770 ; =0x027E5C50
	str r2, [sp]
	add r2, r1, #0x3f
	bl sub_0302D088
	ldr r0, [r4, #0x7bc]
	ldr r1, [r4, #0x7b8]
	cmp r0, #0
	cmpeq r1, #0
	beq _02015758
	bl sub_0302CA0C
	ldr r3, [r4, #0x73c]
	ldr ip, [r4, #0x738]
	cmp r3, #0
	cmpeq ip, #0
	orr lr, r1, #0
	orr r1, r0, #1
	mov r0, #0
	beq _02015758
	ldr r2, [r4, #0x7b8]
	subs ip, r1, ip
	ldr r1, [r4, #0x7bc]
	sbc r3, lr, r3
	cmp r3, r1
	cmpeq ip, r2
	bls _02015758
	str r0, [r4, #0x738]
	str r0, [r4, #0x73c]
	bl sub_0200FEF0
	movs r1, r0
	moveq r0, #0
	beq _02015724
	mov r0, #0x25
	str r0, [r1]
	ldr r3, _02015774 ; =0x00008001
	mov r2, #0
	ldr r0, _02015778 ; =0x027F7900
	stmib r1, {r2, r3}
	bl sub_0302BEC4
_02015724:
	cmp r0, #0
	bne _0201575C
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_03036B24
	b _0201575C
_02015758:
	bl sub_02015880
_0201575C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_02015768: .word 0x027F8878
_0201576C: .word 0x0380B460
_02015770: .word 0x027E5C50
_02015774: .word 0x00008001
_02015778: .word 0x027F7900
	arm_func_end sub_02015664

	arm_func_start sub_0201577C
sub_0201577C: ; 0x0201577C
	stmdb sp!, {r3, lr}
	ldr r0, _0201581C ; =0x027F8878
	ldr r0, [r0, #0x550]
	ldrh r1, [r0, #0xdc]
	cmp r1, #0x3c
	blo _020157B8
	ldr r2, _02015820 ; =0x04000006
	ldrh r1, [r2]
	cmp r1, #0xcb
	blt _020157C0
	cmp r1, #0xd2
	strlth r1, [r2]
	movlt r1, #0
	strlth r1, [r0, #0xdc]
	b _020157C0
_020157B8:
	add r1, r1, #1
	strh r1, [r0, #0xdc]
_020157C0:
	ldr r1, _02015820 ; =0x04000006
	ldr r2, _02015824 ; =0x048080F8
	ldrh lr, [r1]
	ldrh r1, [r2]
	ldrh r3, [r2, #2]
	ldrh ip, [r2]
	cmp r1, ip
	ldrhih r3, [r2, #2]
	ldr r1, _02015828 ; =0x0380FFF0
	orr r3, ip, r3, lsl #16
	rsb r2, lr, lr, lsl #7
	rsb r2, r2, r3, lsl #1
	mov r3, r2, lsr #7
	strh r3, [r1]
	mov r2, #5
	str r2, [sp]
	ldrsh r1, [r0, #0x40]
	ldr r0, _0201582C ; =0x0380B460
	ldr r3, _02015830 ; =0x027E6044
	rsb r2, r2, #0x10c
	bl sub_0302D088
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201581C: .word 0x027F8878
_02015820: .word 0x04000006
_02015824: .word 0x048080F8
_02015828: .word 0x0380FFF0
_0201582C: .word 0x0380B460
_02015830: .word 0x027E6044
	arm_func_end sub_0201577C

	arm_func_start sub_02015834
sub_02015834: ; 0x02015834
	stmdb sp!, {r3, lr}
	ldr r0, _02015874 ; =0x027F8878
	ldr r0, [r0, #0x550]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _0201586C
	ldr r0, _02015878 ; =0x0380B460
	mov r1, #0xcb
	mov ip, #3
	ldr r3, _0201587C ; =0x027E5F8C
	add r2, r1, #0x3c
	str ip, [sp]
	bl sub_0302D088
	bl sub_02015880
_0201586C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02015874: .word 0x027F8878
_02015878: .word 0x0380B460
_0201587C: .word 0x027E5F8C
	arm_func_end sub_02015834

	arm_func_start sub_02015880
sub_02015880: ; 0x02015880
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02015928 ; =0x027F8878
	ldr r4, _0201592C ; =0x027F7878
	ldr r5, [r0, #0x550]
	bl sub_0302D4F0
	ldrh r1, [r5, #0xce]
	cmp r1, #1
	bne _020158A8
	bl sub_0302D504
	b _02015920
_020158A8:
	mov r1, #1
	strh r1, [r5, #0xce]
	bl sub_0302D504
	bl sub_0200FEF0
	movs r1, r0
	moveq r0, #0
	beq _020158D8
	mov r3, #0x1c
	add r0, r4, #0x88
	mov r2, #0
	str r3, [r1]
	bl sub_0302BEC4
_020158D8:
	cmp r0, #0
	bne _02015920
	mov r0, #0
	strh r0, [r5, #0xce]
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _02015920
	bl sub_03036B70
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x1c
	strh r1, [r0, #6]
	bl sub_03036B24
_02015920:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02015928: .word 0x027F8878
_0201592C: .word 0x027F7878
	arm_func_end sub_02015880

	arm_func_start sub_02015930
sub_02015930: ; 0x02015930
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02015AC8 ; =0x027F8878
	mov r1, #0
	ldr r4, [r0, #0x550]
	mov r2, #1
	strh r1, [r4, #0xce]
	strh r2, [r4, #0x88]
	ldrh r0, [r4, #0xc0]
	sub r0, r0, #1
	strh r0, [r4, #0xc0]
	ldrh r0, [r4, #0xc0]
	cmp r0, #0
	bne _0201599C
	ldrh r1, [r4, #0xbe]
	rsb r0, r2, #0x10000
	cmp r1, r0
	moveq r0, #4
	streqh r0, [r4, #0xbe]
	ldrh r0, [r4, #0xbe]
	and r0, r0, #0xff
	bl sub_0200FD10
	bl sub_0200FD8C
	strh r0, [r4, #0xbc]
	ldr r1, _02015ACC ; =0x0000FFFF
	mov r0, #1
	strh r1, [r4, #0xbe]
	strh r0, [r4, #0xc0]
_0201599C:
	ldrh r0, [r4]
	cmp r0, #9
	bne _02015A8C
	bl sub_0302D4F0
	add r1, r4, #0x100
	ldrh r1, [r1, #0x82]
	cmp r1, #0
	bne _020159CC
	mov r1, #0
	strh r1, [r4, #0x62]
	bl sub_0302D504
	b _02015AC0
_020159CC:
	ldrsh r2, [r4, #0x62]
	mov r3, #1
	cmp r2, #0
	ldrgtsh r1, [r4, #0x64]
	cmpgt r1, #0
	movgt r3, #0
	cmp r2, #0
	movlt r1, #0
	strlth r1, [r4, #0x62]
	add r1, r4, #0x700
	ldrsh r2, [r4, #0x62]
	ldrsh r1, [r1, #0xc2]
	add r1, r2, r1
	strh r1, [r4, #0x62]
	ldrsh r1, [r4, #0x62]
	cmp r1, #0x100
	movgt r1, #0x100
	strgth r1, [r4, #0x62]
	add r1, r4, #0x700
	ldrh r1, [r1, #0xc4]
	cmp r3, #0
	strh r1, [r4, #0x64]
	beq _02015A40
	ldrsh r1, [r4, #0x62]
	cmp r1, #0
	ldrgtsh r1, [r4, #0x64]
	cmpgt r1, #0
	movgt r5, #1
	bgt _02015A44
_02015A40:
	mov r5, #0
_02015A44:
	bl sub_0302D504
	cmp r5, #0
	beq _02015A58
	ldr r0, _02015ACC ; =0x0000FFFF
	bl sub_02016110
_02015A58:
	add r0, r4, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #1
	ldreqh r0, [r4, #0xa0]
	subeq r0, r0, #1
	streqh r0, [r4, #0xa0]
	ldreqh r0, [r4, #0xa0]
	cmpeq r0, #0
	moveq r0, #1
	streqh r0, [r4, #0x9e]
	moveq r0, #0x3c
	streqh r0, [r4, #0xa0]
	b _02015AC0
_02015A8C:
	cmp r0, #0xa
	bne _02015AC0
	mov r5, #0
	bl sub_0302D4F0
	ldr r1, [r4, #0x734]
	cmp r1, #1
	movne r1, r5
	movne r5, #1
	strneh r1, [r4, #0x60]
	bl sub_0302D504
	cmp r5, #1
	bne _02015AC0
	bl sub_02015C18
_02015AC0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02015AC8: .word 0x027F8878
_02015ACC: .word 0x0000FFFF
	arm_func_end sub_02015930

	arm_func_start sub_02015AD0
sub_02015AD0: ; 0x02015AD0
	stmdb sp!, {r3, lr}
	ldr r1, _02015B00 ; =0x027F8878
	ldr r1, [r1, #0x550]
	ldrh r1, [r1]
	cmp r1, #9
	bne _02015AF8
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02016110
_02015AF8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02015B00: .word 0x027F8878
	arm_func_end sub_02015AD0
_02015B04:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x18, 0x00, 0x9F, 0xE5, 0x50, 0x05, 0x90, 0xE5
	.byte 0xB0, 0x00, 0xD0, 0xE1, 0x0A, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x1A, 0x3D, 0x00, 0x00, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x78, 0x88, 0x7F, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x24, 0x10, 0x9F, 0xE5, 0x50, 0x15, 0x91, 0xE5, 0xB0, 0x10, 0xD1, 0xE1, 0x09, 0x00, 0x51, 0xE3
	.byte 0x03, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x90, 0xE5, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0xD8, 0x03, 0x00, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x78, 0x88, 0x7F, 0x02

	arm_func_start sub_02015B60
sub_02015B60: ; 0x02015B60
	stmdb sp!, {r4, lr}
	ldr r0, _02015C10 ; =0x027F8878
	ldr r4, [r0, #0x550]
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_0302C078
	add r1, r4, #0x2f8
	mov r0, #0
	mov r2, #0x400
	bl sub_0302D764
	mov r3, #0
_02015B8C:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r4, r3, lsl #5
	mov r3, r0, lsr #0x10
	add r0, r1, #0x200
	strh r3, [r0, #0xf8]
	cmp r3, #0x1f
	blo _02015B8C
	ldr r2, _02015C14 ; =0x0000FFFF
	add r0, r4, r3, lsl #5
	add r0, r0, #0x200
	strh r2, [r0, #0xf8]
	add r0, r4, #0x600
	mov ip, #0
	strh ip, [r0, #0xf8]
	strh r3, [r0, #0xfa]
_02015BCC:
	add r1, r4, ip, lsl #2
	add r0, r1, #0x700
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	add r0, r1, #0x600
	add r1, ip, #1
	strh r2, [r0, #0xfc]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	strh r2, [r0, #0xfe]
	cmp ip, #4
	blo _02015BCC
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02015C10: .word 0x027F8878
_02015C14: .word 0x0000FFFF
	arm_func_end sub_02015B60

	arm_func_start sub_02015C18
sub_02015C18: ; 0x02015C18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x260
	ldr r1, _02016108 ; =0x027F8878
	ldr fp, [r1, #0x550]
	add r0, fp, #0x100
	ldrh r0, [r0, #0x82]
	cmp r0, #0
	beq _020160FC
	mov r0, #1
	strh r0, [fp, #0x8a]
	str r0, [sp, #0x14]
	mov r0, #0
	strh r0, [sp, #0x5c]
	ldr r8, [r1, #0x550]
	add r1, sp, #0x5c
	ldrh sb, [r8, #0x38]
	str r1, [sp, #0x34]
	add r1, sb, #0x1f
	ldrh r2, [r8, #0x80]
	bic r1, r1, #0x1f
	ldr r7, [r8, #0x7c]
	cmp r2, r1
	blt _020160A8
	add r1, r8, #0x100
	ldrh r1, [r1, #0x88]
	cmp r1, #0x10
	bhs _020160A8
	ldrh r1, [r8]
	cmp r1, #9
	beq _02015C9C
	cmp r1, #0xa
	streq r0, [sp, #0x14]
	bne _020160A8
_02015C9C:
	ldr r0, [sp, #0x34]
	mov r6, #0
	strh r6, [r0]
	mov r0, #1
	cmp sb, #0
	strlt r0, [sp, #0x14]
	blt _020160A8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02015CDC
	add r0, r8, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #0
	strne r6, [sp, #0x18]
	b _02015CE0
_02015CDC:
	str r6, [sp, #0x18]
_02015CE0:
	add r0, r8, #0x31c
	mov r1, #0
	str r1, [sp, #0xc]
	mov r1, #1
	add r0, r0, #0x400
	str r1, [sp, #0x10]
	bl sub_0302C078
	ldr r0, [r8, #0x734]
	cmp r0, #1
	bne _02015D20
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	mov r0, #1
	str r0, [sp, #0x14]
	b _020160A8
_02015D20:
	mov r0, #1
	str r0, [r8, #0x734]
	add r0, r8, #0x2f8
	str r0, [sp, #0x1c]
	mov r5, #0
	b _02016084
_02015D38:
	add r0, r8, #0x30c
	add r0, r0, #0x400
	mov r1, r5, lsl #2
	ldrh sl, [r0, r1]
	add r0, r0, r5, lsl #2
	str r0, [sp, #0x20]
	add r0, r8, #0x2fc
	add r0, r0, #0x400
	add r0, r0, r5, lsl #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x28]
	ldr r0, _0201610C ; =0x0000FFFF
	str r0, [sp, #0x2c]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	add r0, r8, #0x100
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x2c]
	sub r0, r0, #0x8000
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x48]
	add r0, r8, #0x700
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	b _0201606C
_02015DB0:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	add r4, r0, sl, lsl #5
	ldrh r0, [r4, #2]
	mov r1, #1
	str r0, [sp, #8]
	tst r2, r1, lsl r0
	bne _02016030
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldr r0, [sp, #8]
	orr r0, r2, r1, lsl r0
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	and r1, r0, r1
	str r1, [sp, #0x30]
	beq _02015DFC
	bics r1, r1, #1
	bne _02016030
_02015DFC:
	ldr r1, [sp, #8]
	tst r1, #8
	movne r1, #1
	strne r1, [sp, #4]
	moveq r1, #0
	streq r1, [sp, #4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	orrne r1, r0, #1
	ldrne r0, [sp, #0x3c]
	cmpne r1, r0
	movne r0, #1
	strne r0, [sp]
	moveq r0, #0
	streq r0, [sp]
	ldrh r0, [r4, #0xe]
	and r1, r0, #1
	cmp r1, #1
	addeq r0, r0, #1
	streqh r0, [r4, #0xe]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	cmp r1, #0
	movne r3, #0
	ldr r1, [sp]
	moveq r3, #2
	ldrh r2, [r4, #0xe]
	cmp r1, #0
	movne r1, #2
	add r2, r2, r3
	moveq r1, #0
	add r0, r2, r0
	add r0, r1, r0
	cmp r0, sb
	bgt _02016030
	ldr r0, [sp, #0x10]
	cmp r0, #0
	streq r7, [sp, #0x34]
	moveq r0, #0
	streqh r0, [r7], #2
	ldr r0, [sp, #0x34]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #0xe]
	mov r2, r2, lsl #8
	mov r1, r1, lsr #1
	ldrh r0, [r0]
	and r2, r2, #0xf00
	and r1, r1, #0xff
	orr r1, r2, r1
	orr r1, r0, r1
	ldr r0, [sp, #0x34]
	addeq r6, r6, #2
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	ldrh r2, [r4, #0xe]
	mov r1, r7
	subeq sb, sb, #2
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldr r0, [sp, #4]
	add r6, r6, r1
	cmp r0, #1
	bic r0, r1, #1
	add r7, r7, r0
	sub sb, sb, r1
	bne _02015F64
	ldrh r0, [r4, #0x10]
	tst r0, #1
	moveq r2, r0, asr #1
	beq _02015F50
	ldr r0, [sp, #0x40]
	ldrh r1, [r4, #2]
	ldrh r0, [r0, #0x88]
	mov r1, r1, lsl #0x1d
	add r0, r8, r0, lsl #4
	add r0, r0, r1, lsr #28
	add r0, r0, #0x100
	ldrh r2, [r0, #0xf8]
	add r1, r2, #1
	strh r1, [r0, #0xf8]
	mov r0, r2, lsl #1
	strh r0, [r4, #0x10]
_02015F50:
	ldr r0, [sp, #0x44]
	add r6, r6, #2
	and r0, r2, r0
	strh r0, [r7], #2
	sub sb, sb, #2
_02015F64:
	ldr r0, [sp]
	cmp r0, #1
	bne _02015F94
	ldr r0, [sp, #0x34]
	add r6, r6, #2
	ldrh r0, [r0]
	sub sb, sb, #2
	orr r1, r0, #0x1000
	ldr r0, [sp, #0x34]
	strh r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r7], #2
_02015F94:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldrh r0, [r0, #2]
	cmp r0, sl
	ldreq r1, [sp, #0x2c]
	ldreq r0, [sp, #0x20]
	streqh r1, [r0, #2]
	ldrh r1, [r4]
	ldr r0, [sp, #0x28]
	strh r1, [r0]
	ldr r0, [sp, #0x38]
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	ldrh r1, [r0, #2]
	ldr r0, [sp, #0x48]
	cmp r1, r0
	ldreq r0, [sp, #0x24]
	movne r1, r1, lsl #5
	streqh sl, [r0]
	ldrne r0, [sp, #0x1c]
	strneh sl, [r0, r1]
	ldr r0, [sp, #8]
	mov r1, #1
	mvn r1, r1, lsl r0
	ldr r0, [sp, #0xc]
	and r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	strh sl, [r0, #2]
	ldr r0, [sp, #0x30]
	ldr sl, [sp, #0x2c]
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x4c]
	ldrh r0, [r0, #0xc8]
	cmp r0, #1
	beq _02016094
_02016030:
	ldr r0, [sp, #0x50]
	str sl, [sp, #0x2c]
	cmp sl, r0
	ldrne r0, [sp, #0x1c]
	addne r0, r0, sl, lsl #5
	strne r0, [sp, #0x28]
	ldreq r0, [sp, #0x20]
	streq r0, [sp, #0x28]
	ldr r0, [sp, #0x54]
	cmp sl, r0
	ldrne r0, [sp, #0x1c]
	movne r1, sl, lsl #5
	ldrneh sl, [r0, r1]
	ldreq r0, [sp, #0x20]
	ldreqh sl, [r0]
_0201606C:
	ldr r0, [sp, #0x58]
	cmp sl, r0
	beq _02016080
	cmp sb, #2
	bgt _02015DB0
_02016080:
	add r5, r5, #1
_02016084:
	cmp r5, #4
	bhs _02016094
	cmp sb, #2
	bgt _02015D38
_02016094:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	mov r0, #0
	str r0, [sp, #0x14]
_020160A8:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [fp, #0x8a]
	beq _020160FC
	ldr r0, [fp, #0x1c]
	mov r1, r6, lsl #0x10
	cmp r0, #1
	ldreqh r0, [sp, #0x5c]
	mov r1, r1, lsr #0x10
	orreq r0, r0, #0x8000
	streqh r0, [sp, #0x5c]
	ldrh r2, [sp, #0x5c]
	ldr r3, [fp, #0x7c]
	add r0, sp, #0x60
	bl sub_02011A9C
	ldrh r0, [r0, #4]
	cmp r0, #0
	cmpne r0, #8
	movne r0, #0
	strneh r0, [fp, #0x8a]
_020160FC:
	add sp, sp, #0x260
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02016108: .word 0x027F8878
_0201610C: .word 0x0000FFFF
	arm_func_end sub_02015C18

	arm_func_start sub_02016110
sub_02016110: ; 0x02016110
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c8
	ldr r1, _02016AA8 ; =0x027F8878
	str r0, [sp, #0x18]
	ldr r7, [r1, #0x550]
	bl sub_0302D4F0
	add r1, r7, #0x100
	ldrh r1, [r1, #0x82]
	ldrh r4, [r7, #0x86]
	str r1, [sp, #0x74]
	bl sub_0302D504
	mov r1, #0
	strh r1, [sp, #0xc4]
	ldrh r0, [r7, #0x88]
	cmp r0, #1
	ldreq r0, _02016AAC ; =0x0000FFFF
	streq r0, [sp, #0x18]
	streqh r1, [r7, #0x88]
	ldrh r0, [r7, #0x9e]
	cmp r0, #0
	bne _020169F8
	ldr r1, _02016AA8 ; =0x027F8878
	ldrh r0, [r7, #0x3a]
	ldr r8, [r1, #0x550]
	str r0, [sp, #0x24]
	add r0, sp, #0xc4
	ldrh sb, [r8, #0x38]
	str r0, [sp, #0x70]
	add r0, sb, #0x1f
	ldrh r1, [r8, #0x80]
	bic r0, r0, #0x1f
	cmp r1, r0
	ldr r6, [r8, #0x7c]
	movlt r0, #1
	blt _02016638
	add r0, r8, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0x10
	movhs r0, #1
	bhs _02016638
	ldrh r0, [r8]
	cmp r0, #9
	moveq r0, #1
	streq r0, [sp, #0x48]
	beq _020161DC
	cmp r0, #0xa
	moveq r0, #0
	streq r0, [sp, #0x48]
	beq _020161DC
	mov r0, #1
	b _02016638
_020161DC:
	ldr r0, [sp, #0x70]
	mov r5, #0
	mov sl, r5
	mov fp, r5
	strh r5, [r0]
	cmp sb, #0
	movlt r0, #1
	blt _02016638
	ldr r0, [sp, #0x48]
	str r4, [sp, #0x50]
	cmp r0, #0
	mov r0, #1
	str r0, [sp, #0x4c]
	beq _02016230
	add r0, r8, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #0
	ldrne r0, [sp, #0x74]
	strne r5, [sp, #0x4c]
	strne r0, [sp, #0x50]
	b _02016234
_02016230:
	str r5, [sp, #0x4c]
_02016234:
	ldr r0, [sp, #0x18]
	and r4, r4, r0
	mov r0, #0
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x44]
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_0302C078
	ldr r0, [r8, #0x734]
	cmp r0, #1
	bne _02016278
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	mov r0, #1
	b _02016638
_02016278:
	mvn r0, r4
	str r0, [sp, #0x2c]
	mov r0, #1
	str r0, [r8, #0x734]
	add r0, r8, #0x2f8
	str r0, [sp, #0x54]
	mov r0, #0
	str r0, [sp, #0x58]
	b _02016610
_0201629C:
	ldr r0, [sp, #0x58]
	mov r2, r0, lsl #2
	add r0, r8, #0x30c
	add r1, r0, #0x400
	ldr r0, [sp, #0x58]
	ldrh sl, [r1, r2]
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x5c]
	add r0, r8, #0x2fc
	add r1, r0, #0x400
	ldr r0, [sp, #0x58]
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x64]
	ldr r0, _02016AAC ; =0x0000FFFF
	str r0, [sp, #0x68]
	str r0, [sp, #0x78]
	str r0, [sp, #0x8c]
	add r0, r8, #0x100
	str r0, [sp, #0x90]
	ldr r0, [sp, #0x68]
	sub r0, r0, #0x8000
	str r0, [sp, #0x94]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0x98]
	add r0, r8, #0x700
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0xa0]
	str r0, [sp, #0xa4]
	str r0, [sp, #0xa8]
	b _020165F0
_02016320:
	ldr r0, [sp, #0x54]
	ldr r2, [sp, #0x40]
	add r4, r0, sl, lsl #5
	ldrh r0, [r4, #2]
	mov r1, #1
	str r0, [sp, #0x28]
	tst r2, r1, lsl r0
	bne _020165B4
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	ldr r0, [sp, #0x28]
	orr r0, r2, r1, lsl r0
	str r0, [sp, #0x40]
	ldrh r0, [r4, #6]
	ldr r1, [sp, #0x50]
	and r1, r0, r1
	str r1, [sp, #0x6c]
	beq _02016378
	mov r2, r1
	ldr r1, [sp, #0x2c]
	tst r2, r1
	bne _020165B4
_02016378:
	ldr r1, [sp, #0x28]
	tst r1, #8
	movne r1, #1
	strne r1, [sp, #0x20]
	moveq r1, #0
	streq r1, [sp, #0x20]
	ldr r1, [sp, #0x48]
	cmp r1, #0
	orrne r1, r0, #1
	ldrne r0, [sp, #0x8c]
	cmpne r1, r0
	movne r0, #1
	strne r0, [sp, #0x1c]
	moveq r0, #0
	streq r0, [sp, #0x1c]
	ldrh r0, [r4, #0xe]
	and r1, r0, #1
	cmp r1, #1
	addeq r0, r0, #1
	streqh r0, [r4, #0xe]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x44]
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	cmp r1, #0
	movne r3, #0
	ldr r1, [sp, #0x1c]
	moveq r3, #2
	ldrh r2, [r4, #0xe]
	cmp r1, #0
	movne r1, #2
	add r2, r2, r3
	moveq r1, #0
	add r0, r2, r0
	add r0, r1, r0
	cmp r0, sb
	bgt _020165B4
	ldr r0, [sp, #0x44]
	cmp r0, #0
	streq r6, [sp, #0x70]
	moveq r0, #0
	streqh r0, [r6], #2
	ldr r0, [sp, #0x70]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #0xe]
	mov r2, r2, lsl #8
	mov r1, r1, lsr #1
	ldrh r0, [r0]
	and r2, r2, #0xf00
	and r1, r1, #0xff
	orr r1, r2, r1
	orr r1, r0, r1
	ldr r0, [sp, #0x70]
	addeq fp, fp, #2
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	ldrh r2, [r4, #0xe]
	mov r1, r6
	subeq sb, sb, #2
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	ldr r0, [sp, #0x20]
	add fp, fp, r1
	cmp r0, #1
	bic r0, r1, #1
	add r6, r6, r0
	sub sb, sb, r1
	bne _020164E0
	ldrh r0, [r4, #0x10]
	tst r0, #1
	moveq r2, r0, asr #1
	beq _020164CC
	ldr r0, [sp, #0x90]
	ldrh r1, [r4, #2]
	ldrh r0, [r0, #0x88]
	mov r1, r1, lsl #0x1d
	add r0, r8, r0, lsl #4
	add r0, r0, r1, lsr #28
	add r0, r0, #0x100
	ldrh r2, [r0, #0xf8]
	add r1, r2, #1
	strh r1, [r0, #0xf8]
	mov r0, r2, lsl #1
	strh r0, [r4, #0x10]
_020164CC:
	ldr r0, [sp, #0x94]
	add fp, fp, #2
	and r0, r2, r0
	strh r0, [r6], #2
	sub sb, sb, #2
_020164E0:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _02016510
	ldr r0, [sp, #0x70]
	add fp, fp, #2
	ldrh r0, [r0]
	sub sb, sb, #2
	orr r1, r0, #0x1000
	ldr r0, [sp, #0x70]
	strh r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r6], #2
_02016510:
	ldr r0, [sp, #0x44]
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0x44]
	ldr r0, [sp, #0x5c]
	ldrh r0, [r0, #2]
	cmp r0, sl
	ldreq r1, [sp, #0x68]
	ldreq r0, [sp, #0x5c]
	streqh r1, [r0, #2]
	ldrh r1, [r4]
	ldr r0, [sp, #0x64]
	strh r1, [r0]
	ldr r0, [sp, #0x78]
	strh r0, [r4]
	ldr r0, [sp, #0x60]
	ldrh r1, [r0, #2]
	ldr r0, [sp, #0x98]
	cmp r1, r0
	ldreq r0, [sp, #0x60]
	movne r1, r1, lsl #5
	streqh sl, [r0]
	ldrne r0, [sp, #0x54]
	strneh sl, [r0, r1]
	ldr r0, [sp, #0x28]
	mov r1, #1
	mvn r1, r1, lsl r0
	ldr r0, [sp, #0x40]
	and r0, r0, r1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x60]
	strh sl, [r0, #2]
	ldr r0, [sp, #0x6c]
	ldr sl, [sp, #0x68]
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #4]
	orr r5, r5, r0
	ldr r0, [sp, #0x9c]
	ldrh r0, [r0, #0xc8]
	cmp r0, #1
	beq _02016624
_020165B4:
	ldr r0, [sp, #0xa0]
	str sl, [sp, #0x68]
	cmp sl, r0
	ldrne r0, [sp, #0x54]
	addne r0, r0, sl, lsl #5
	strne r0, [sp, #0x64]
	ldreq r0, [sp, #0x5c]
	streq r0, [sp, #0x64]
	ldr r0, [sp, #0xa4]
	cmp sl, r0
	ldrne r0, [sp, #0x54]
	movne r1, sl, lsl #5
	ldrneh sl, [r0, r1]
	ldreq r0, [sp, #0x5c]
	ldreqh sl, [r0]
_020165F0:
	ldr r0, [sp, #0xa8]
	cmp sl, r0
	beq _02016604
	cmp sb, #2
	bgt _02016320
_02016604:
	ldr r0, [sp, #0x58]
	add r0, r0, #1
	str r0, [sp, #0x58]
_02016610:
	ldr r0, [sp, #0x58]
	cmp r0, #4
	bhs _02016624
	cmp sb, #2
	bgt _0201629C
_02016624:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	mov sl, fp
	bl sub_0302C0FC
	mov r0, #0
_02016638:
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r7, #0x62]
	streqh r0, [r7, #0x64]
	beq _02016A9C
	add r0, r7, #0x700
	ldrh r1, [r0, #0xc6]
	ldr r0, [sp, #0x24]
	cmp r1, #1
	add r4, r0, #2
	ldrne r5, [sp, #0x18]
	ldr r0, [sp, #0x74]
	and r5, r5, r0
	mov r0, r5
	bl sub_03033020
	ldr r1, [sp, #0x24]
	add r1, r1, #0xc
	mul r0, r1, r0
	add r0, r0, #0x29
	ldrh r1, [r7, #0x72]
	bic r0, r0, #0x1f
	cmp r1, r0
	bge _020169B8
	ldr r0, _02016AA8 ; =0x027F8878
	ldr sb, [r0, #0x550]
	ldrh r0, [sb]
	add r8, sb, #0x2f8
	cmp r0, #9
	moveq r4, #1
	beq _020166BC
	cmp r0, #0xa
	bne _020169A8
	mov r4, #0
_020166BC:
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_0302C078
	ldr r0, [sb, #0x734]
	cmp r0, #0
	bne _020166E4
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	b _020169A8
_020166E4:
	cmp r4, #0
	moveq r0, #1
	streq r0, [sp, #0x3c]
	beq _02016708
	bl sub_0302D4F0
	add r1, sb, #0x100
	ldrh r1, [r1, #0x82]
	str r1, [sp, #0x3c]
	bl sub_0302D504
_02016708:
	mov r0, r5, lsl #0x10
	mvn r0, r0, lsr #16
	str r0, [sp, #0x30]
	mov sl, #0
_02016718:
	ldr r0, _02016AAC ; =0x0000FFFF
	add fp, sb, #0x600
	str r0, [sp, #0x38]
	add r0, sb, #0x2fc
	add r1, r0, #0x400
	mov r0, sl, lsl #2
	ldrh r5, [r1, r0]
	ldr r0, [sp, #0x38]
	add r6, r1, sl, lsl #2
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x7c]
	str r0, [sp, #0x80]
	str r0, [sp, #0x84]
	str r0, [sp, #0x88]
	str r0, [sp, #0xac]
	str r0, [sp, #0xb0]
	add r0, sb, #0x100
	str r0, [sp, #0xb4]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
	str r0, [sp, #0xc0]
	b _02016934
_02016778:
	add r4, r8, r5, lsl #5
	ldrh r1, [r4, #0xa]
	ldr r0, [sp, #0x30]
	ldrh r2, [r4, #8]
	and r0, r1, r0
	orr r0, r2, r0
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #6]
	mvn r0, r0
	and r0, r1, r0
	strh r0, [r4, #6]
	ldrh r1, [r4, #6]
	ldr r0, [sp, #0x3c]
	and r0, r1, r0
	strh r0, [r4, #6]
	mov r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _02016848
	ldrh r0, [r4, #2]
	tst r0, #8
	ldreqh r0, [r4, #0x12]
	cmpeq r0, #0
	beq _02016848
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r4, #0x12]
	ldrh r1, [r4]
	ldr r0, [sp, #0xac]
	cmp r1, r0
	ldreq r0, [sp, #0x7c]
	streqh r0, [r6, #2]
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0xb0]
	cmp r1, r0
	ldrh r0, [r4]
	strh r0, [r6]
	ldr r0, [sp, #0x80]
	strh r0, [r4]
	moveq r0, r5, lsl #0x10
	moveq r0, r0, lsr #0x10
	streq r0, [sp, #0x34]
	ldrne r0, [sp, #0x38]
	movne r0, r0, lsl #5
	strneh r5, [r8, r0]
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x38]
	b _02016930
_02016848:
	bl sub_03036B70
	mov r1, #0x81
	strh r1, [r0]
	ldrh r1, [r4, #6]
	ldr r3, [sp, #0xb4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #0xf
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r4, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r4, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r4, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r4, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r4, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [sb, #0x30]
	cmp r3, #0
	ldrh r2, [sb, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0xb4]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_03036B24
	ldrh r1, [r4]
	ldr r0, [sp, #0xb8]
	cmp r1, r0
	ldreq r0, [sp, #0x84]
	streqh r0, [r6, #2]
	ldrh r0, [r4]
	strh r0, [r6]
	ldr r0, [sp, #0x88]
	strh r0, [r4]
	ldrh r1, [fp, #0xfa]
	ldr r0, [sp, #0xbc]
	cmp r1, r0
	streqh r5, [fp, #0xf8]
	movne r0, r1, lsl #5
	strneh r5, [r8, r0]
	strh r5, [fp, #0xfa]
_02016930:
	ldrh r5, [r6]
_02016934:
	ldr r0, [sp, #0xc0]
	cmp r5, r0
	bne _02016778
	ldr r2, _02016AAC ; =0x0000FFFF
	ldr r0, [sp, #0x38]
	cmp r0, r2
	beq _02016988
	add r0, sb, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #0x38]
	ldrh r3, [r1, #0xc]
	mov r0, r0, lsl #5
	strh r3, [r8, r0]
	ldrh r0, [r1, #0xe]
	cmp r0, r2
	ldreq r0, [sp, #0x38]
	streqh r0, [r1, #0xe]
	add r0, sb, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #0x34]
	strh r0, [r1, #0xc]
_02016988:
	add sl, sl, #1
	cmp sl, #4
	blt _02016718
	add r0, sb, #0x31c
	mov r1, #0
	add r0, r0, #0x400
	str r1, [sb, #0x734]
	bl sub_0302C0FC
_020169A8:
	mov r0, #0
	strh r0, [r7, #0x62]
	strh r0, [r7, #0x64]
	b _02016A9C
_020169B8:
	ldrsh r0, [r7, #0x62]
	cmp r0, #1
	ldrnesh r0, [r7, #0x64]
	cmpne r0, #1
	movne r6, #0
	bne _02016A38
	ldrh r3, [r7, #0x40]
	mov r0, sl
	mov r1, r4
	mov r2, r5
	bl sub_02017404
	ldrh r1, [sp, #0xc4]
	mov r6, r0
	orr r0, r1, #0x8000
	strh r0, [sp, #0xc4]
	b _02016A38
_020169F8:
	mov r6, #0
	strh r6, [r7, #0x9e]
	ldrh r0, [sp, #0xc4]
	ldr r5, [sp, #0x74]
	bic r0, r0, #0x8000
	strh r0, [sp, #0xc4]
	mov sl, r6
	ldr r4, _02016AB0 ; =0x000080D6
	bl sub_0302D4F0
	ldrsh r1, [r7, #0x62]
	add r1, r1, #1
	strh r1, [r7, #0x62]
	ldrsh r1, [r7, #0x64]
	add r1, r1, #1
	strh r1, [r7, #0x64]
	bl sub_0302D504
_02016A38:
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp]
	ldr r0, _02016AB4 ; =0x048080F8
	str r6, [sp, #4]
	ldrh r1, [r0]
	mov r0, sl, lsl #0x10
	str r1, [sp, #8]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0xc]
	ldrh r0, [sp, #0xc4]
	mov r3, r4, lsl #0x10
	str r0, [sp, #0x10]
	ldr r2, [r7, #0x7c]
	mov r1, #0
	str r2, [sp, #0x14]
	add r0, sp, #0xc8
	mov r2, r1
	mov r3, r3, lsr #0x10
	bl sub_02011B04
	strh r5, [r7, #0x68]
	ldrh r0, [sp, #0xc4]
	strh r0, [r7, #0x6a]
	strh r4, [r7, #0x6c]
	strh sl, [r7, #0x6e]
_02016A9C:
	add sp, sp, #0x2c8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02016AA8: .word 0x027F8878
_02016AAC: .word 0x0000FFFF
_02016AB0: .word 0x000080D6
_02016AB4: .word 0x048080F8
	arm_func_end sub_02016110

	arm_func_start sub_02016AB8
sub_02016AB8: ; 0x02016AB8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x218
	ldr r1, _02016B9C ; =0x027F8878
	mov r4, r0
	ldr r7, [r1, #0x550]
	bl sub_0302D4F0
	bl sub_0302D504
	add r0, r7, #0x100
	ldrh r0, [r0, #0x82]
	ldr r1, _02016BA0 ; =0x048080F8
	and r4, r4, r0
	ldrh r8, [r7, #0x3a]
	mov r0, r4
	ldrh r5, [r1]
	ldrh r6, [r7, #0x6a]
	bl sub_03033020
	add r1, r8, #0xc
	mul r0, r1, r0
	add r0, r0, #0x29
	ldrh r1, [r7, #0x72]
	bic r0, r0, #0x1f
	cmp r1, r0
	bge _02016B24
	mov r0, #2
	bl sub_0302BC58
	bl sub_02011244
	b _02016B90
_02016B24:
	ldrsh r0, [r7, #0x62]
	cmp r0, #1
	ldrnesh r0, [r7, #0x64]
	cmpne r0, #1
	bicne r6, r6, #0x8000
	movne r0, #0
	bne _02016B58
	ldrh r0, [r7, #0x6e]
	ldrh r1, [r7, #0x6c]
	ldrh r3, [r7, #0x40]
	mov r2, r4
	bl sub_02017404
	orr r6, r6, #0x8000
_02016B58:
	mov r1, r4, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp]
	stmib sp, {r0, r5}
	mov r2, #0
	mov r0, r6, lsl #0x10
	str r2, [sp, #0xc]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x10]
	ldr r1, _02016BA4 ; =0x0000800C
	add r0, sp, #0x18
	mov r3, r2
	str r2, [sp, #0x14]
	bl sub_02011B04
_02016B90:
	add sp, sp, #0x218
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02016B9C: .word 0x027F8878
_02016BA0: .word 0x048080F8
_02016BA4: .word 0x0000800C
	arm_func_end sub_02016AB8

	arm_func_start sub_02016BA8
sub_02016BA8: ; 0x02016BA8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _02016CD4 ; =0x027F8878
	ldrh r8, [sp, #0x24]
	ldr r4, [r4, #0x550]
	mov r7, r0
	add r0, r4, #0x30c
	add r0, r0, #0x400
	cmp r8, #0
	add sb, r0, r1, lsl #2
	mov r6, r2
	mov r5, r3
	add r8, r4, #0x2f8
	moveq r0, #6
	beq _02016CCC
	ldrh r0, [sp, #0x24]
	tst r6, #8
	movne r1, #2
	moveq r1, #0
	add r0, r0, r1
	cmp r0, #0x204
	movgt r0, #6
	bgt _02016CCC
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_0302C078
	add r2, r4, #0x600
	ldrh r1, [r2, #0xf8]
	ldr r3, _02016CD8 ; =0x0000FFFF
	cmp r1, r3
	bne _02016C34
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	mov r0, #0xa
	b _02016CCC
_02016C34:
	mov r0, r1, lsl #5
	ldrh ip, [r8, r0]
	add r0, r8, r1, lsl #5
	strh ip, [r2, #0xf8]
	ldrh ip, [r2, #0xfa]
	cmp ip, r1
	streqh r3, [r2, #0xfa]
	strh r6, [r0, #2]
	strh r5, [r0, #4]
	and r2, r5, r7
	strh r2, [r0, #6]
	mov r2, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r3, [sp, #0x20]
	ldrh r2, [sp, #0x24]
	str r3, [r0, #0x14]
	strh r2, [r0, #0xe]
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldr r3, _02016CD8 ; =0x0000FFFF
	add r2, r4, #0x700
	strh r3, [r0]
	strh r3, [r0, #0x10]
	ldrh r2, [r2, #0xca]
	strh r2, [r0, #0x12]
	ldrh r0, [sb, #2]
	cmp r0, r3
	streqh r1, [sb]
	movne r0, r0, lsl #5
	strneh r1, [r8, r0]
	add r0, r4, #0x31c
	add r0, r0, #0x400
	strh r1, [sb, #2]
	bl sub_0302C0FC
	mov r0, #2
_02016CCC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02016CD4: .word 0x027F8878
_02016CD8: .word 0x0000FFFF
	arm_func_end sub_02016BA8

	arm_func_start sub_02016CDC
sub_02016CDC: ; 0x02016CDC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	ldr r2, _02017004 ; =0x027F8878
	str r0, [sp]
	ldr r8, [r2, #0x550]
	mov r5, r1
	ldrh r1, [r8]
	mov r0, #0
	cmp r1, #9
	add r4, r8, #0x2f8
	str r0, [sp, #0xc]
	moveq r6, #1
	beq _02016D1C
	cmp r1, #0xa
	moveq r6, r0
	bne _02016FF8
_02016D1C:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_0302C078
	ldr r0, [r8, #0x734]
	cmp r0, #0
	bne _02016D48
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	mov r0, #0
	b _02016FF8
_02016D48:
	cmp r6, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _02016D6C
	bl sub_0302D4F0
	add r1, r8, #0x100
	ldrh r1, [r1, #0x82]
	str r1, [sp, #0x10]
	bl sub_0302D504
_02016D6C:
	mvn r0, r5
	str r0, [sp, #4]
	mov sl, #0
_02016D78:
	add r0, r8, #0x2fc
	add r1, r0, #0x400
	ldr sb, _02017008 ; =0x0000FFFF
	mov r0, sl, lsl #2
	ldrh r5, [r1, r0]
	add r0, r8, #0x100
	str sb, [sp, #8]
	add r6, r1, sl, lsl #2
	str sb, [sp, #0x14]
	str sb, [sp, #0x18]
	str sb, [sp, #0x1c]
	str sb, [sp, #0x20]
	str sb, [sp, #0x24]
	str sb, [sp, #0x28]
	str r0, [sp, #0x2c]
	str sb, [sp, #0x30]
	add fp, r8, #0x600
	str sb, [sp, #0x34]
	str sb, [sp, #0x38]
	b _02016F8C
_02016DC8:
	ldr r0, [sp]
	add r7, r4, r5, lsl #5
	cmp r0, #0
	bne _02016E04
	ldrh r1, [r7, #0xa]
	ldr r0, [sp, #4]
	ldrh r2, [r7, #8]
	and r0, r1, r0
	orr r0, r2, r0
	strh r0, [r7, #8]
	ldrh r0, [r7, #8]
	ldrh r1, [r7, #6]
	mvn r0, r0
	and r0, r1, r0
	strh r0, [r7, #6]
_02016E04:
	ldrh r1, [r7, #6]
	ldr r0, [sp, #0x10]
	and r0, r1, r0
	strh r0, [r7, #6]
	mov r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #6]
	cmp r0, #0
	beq _02016EA0
	ldrh r0, [r7, #2]
	tst r0, #8
	ldreqh r0, [r7, #0x12]
	cmpeq r0, #0
	beq _02016EA0
	mov r0, #1
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x12]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r7, #0x12]
	ldrh r1, [r7]
	ldr r0, [sp, #0x24]
	cmp r1, r0
	ldreq r0, [sp, #0x14]
	streqh r0, [r6, #2]
	ldr r0, [sp, #0x28]
	cmp sb, r0
	ldrh r0, [r7]
	strh r0, [r6]
	ldr r0, [sp, #0x18]
	strh r0, [r7]
	moveq r0, r5, lsl #0x10
	moveq r0, r0, lsr #0x10
	streq r0, [sp, #8]
	movne r0, sb, lsl #5
	strneh r5, [r4, r0]
	mov r0, r5, lsl #0x10
	mov sb, r0, lsr #0x10
	b _02016F88
_02016EA0:
	bl sub_03036B70
	mov r1, #0x81
	strh r1, [r0]
	ldrh r1, [r7, #6]
	ldr r3, [sp, #0x2c]
	cmp r1, #0
	moveq r1, #0
	movne r1, #0xf
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r7, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r7, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r7, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r7, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r7, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r7, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r7, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [r8, #0x30]
	cmp r3, #0
	ldrh r2, [r8, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0x2c]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_03036B24
	ldrh r1, [r7]
	ldr r0, [sp, #0x30]
	cmp r1, r0
	ldreq r0, [sp, #0x1c]
	streqh r0, [r6, #2]
	ldrh r0, [r7]
	strh r0, [r6]
	ldr r0, [sp, #0x20]
	strh r0, [r7]
	ldrh r1, [fp, #0xfa]
	ldr r0, [sp, #0x34]
	cmp r1, r0
	streqh r5, [fp, #0xf8]
	movne r0, r1, lsl #5
	strneh r5, [r4, r0]
	strh r5, [fp, #0xfa]
_02016F88:
	ldrh r5, [r6]
_02016F8C:
	ldr r0, [sp, #0x38]
	cmp r5, r0
	bne _02016DC8
	ldr r1, _02017008 ; =0x0000FFFF
	cmp sb, r1
	beq _02016FD4
	add r0, r8, sl, lsl #2
	add r0, r0, #0x700
	ldrh r3, [r0, #0xc]
	mov r2, sb, lsl #5
	strh r3, [r4, r2]
	ldrh r2, [r0, #0xe]
	cmp r2, r1
	streqh sb, [r0, #0xe]
	add r0, r8, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #8]
	strh r0, [r1, #0xc]
_02016FD4:
	add sl, sl, #1
	cmp sl, #4
	blt _02016D78
	add r0, r8, #0x31c
	mov r1, #0
	add r0, r0, #0x400
	str r1, [r8, #0x734]
	bl sub_0302C0FC
	ldr r0, [sp, #0xc]
_02016FF8:
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02017004: .word 0x027F8878
_02017008: .word 0x0000FFFF
	arm_func_end sub_02016CDC

	arm_func_start sub_0201700C
sub_0201700C: ; 0x0201700C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _020171F8 ; =0x027F8878
	mvn r2, r0
	ldr sb, [r1, #0x550]
	add r0, sb, #0x100
	ldrh r1, [r0, #0x82]
	add r0, sb, #0x31c
	add r0, r0, #0x400
	add r5, sb, #0x2f8
	and fp, r2, r1
	bl sub_0302C078
	add r0, sb, #0x30c
	add r0, r0, #0x400
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
_02017050:
	add r0, sb, #0x100
	str r0, [sp, #0x10]
	mov r6, #0
	add r4, sb, #0x600
_02017060:
	ldr r0, [sp, #8]
	mov r1, r6, lsl #2
	add r7, r0, r6, lsl #2
	ldrh sl, [r0, r1]
	ldr r0, _020171FC ; =0x0000FFFF
	str r7, [sp, #4]
	str r0, [sp]
	b _020171B4
_02017080:
	add r8, r5, sl, lsl #5
	ldrh r0, [r8, #6]
	and r0, r0, fp
	strh r0, [r8, #6]
	ldrh r0, [r8, #0xa]
	and r0, r0, fp
	strh r0, [r8, #0xa]
	ldrh r0, [r8, #6]
	cmp r0, #0
	bne _02017188
	bl sub_03036B70
	mov r1, #0x81
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r8, #2]
	ldr r3, [sp, #0x10]
	strh r1, [r0, #0xa]
	ldrh r1, [r8, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r8, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r8, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r8, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r8, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r8, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r8, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r8, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [sb, #0x30]
	cmp r3, #0
	ldrh r2, [sb, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0x10]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_03036B24
	ldrh r1, [r8]
	ldr r0, _020171FC ; =0x0000FFFF
	cmp r1, r0
	ldreq r0, [sp]
	streqh r0, [r7, #2]
	ldrh r1, [r8]
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, _020171FC ; =0x0000FFFF
	strh r0, [r8]
	ldrh r1, [r4, #0xfa]
	cmp r1, r0
	streqh sl, [r4, #0xf8]
	movne r0, r1, lsl #5
	strneh sl, [r5, r0]
	strh sl, [r4, #0xfa]
	ldr sl, [sp]
_02017188:
	ldr r0, _020171FC ; =0x0000FFFF
	str sl, [sp]
	cmp sl, r0
	addne r0, r5, sl, lsl #5
	strne r0, [sp, #4]
	ldr r0, _020171FC ; =0x0000FFFF
	streq r7, [sp, #4]
	cmp sl, r0
	movne r0, sl, lsl #5
	ldrneh sl, [r5, r0]
	ldreqh sl, [r7]
_020171B4:
	ldr r0, _020171FC ; =0x0000FFFF
	cmp sl, r0
	bne _02017080
	add r6, r6, #1
	cmp r6, #4
	blt _02017060
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #2
	blt _02017050
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_0302C0FC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020171F8: .word 0x027F8878
_020171FC: .word 0x0000FFFF
	arm_func_end sub_0201700C

	arm_func_start sub_02017200
sub_02017200: ; 0x02017200
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, _020173FC ; =0x027F8878
	ldr r1, [sp, #0x40]
	ldr r5, [r4, #0x550]
	movs sb, r3
	str r1, [sp, #0x40]
	mov sl, r0
	str r2, [sp]
	beq _020173EC
	cmp sb, #0x204
	bhi _020173EC
	add r4, r5, #0x100
	ldrh r0, [r4, #0x88]
	cmp sl, r0
	beq _020173EC
	cmp sl, #0x10
	bhs _020173EC
	tst sb, #1
	bne _020173EC
	add r0, r5, #0x1f8
	add r8, r0, sl, lsl #4
	mov r0, #1
	str r0, [sp, #8]
	b _020173E4
_02017268:
	ldr r0, [sp, #8]
	ldr r7, _02017400 ; =0x0000FFFF
	cmp r0, #1
	addeq r1, sp, #0x34
	moveq r0, #0
	ldrne r1, [sp]
	streq r0, [sp, #8]
	movne r0, r1
	addne r0, r0, #2
	ldrh r1, [r1]
	strne r0, [sp]
	mov r0, r1, lsl #0x18
	subne sb, sb, #2
	movs r6, r0, lsr #0x17
	moveq r6, #0x200
	tst r1, #0x1000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x800
	movne r3, #1
	moveq r3, #0
	cmp r2, #0
	movne fp, #2
	moveq fp, #0
	cmp r3, #0
	movne r0, #2
	moveq r0, #0
	add r0, r6, r0
	add r0, r0, fp
	subs sb, sb, r0
	bmi _020173EC
	and r1, r1, #0xf00
	cmp r3, #1
	mov r1, r1, lsl #8
	ldr r3, [sp]
	mov fp, r1, lsr #0x10
	ldr r1, [sp]
	add r0, r3, r0
	str r1, [sp, #4]
	add r1, r1, r6
	str r0, [sp]
	bne _0201734C
	mov r0, fp, lsl #0x1d
	mov r0, r0, lsr #0x1c
	ldrh r3, [r8, r0]
	ldrh r7, [r1], #2
	tst r3, #1
	movne r3, r7, lsl #1
	strneh r3, [r8, r0]
	bne _0201734C
	mov r7, r7, lsl #1
	sub r3, r3, r7
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0x100
	blo _020173E4
	strh r7, [r8, r0]
_0201734C:
	cmp r2, #1
	bne _02017368
	ldrh r2, [r1]
	ldrh r1, [r4, #0x88]
	mov r0, #1
	tst r2, r0, lsl r1
	beq _020173E4
_02017368:
	cmp r6, #0
	ble _020173E4
	bl sub_03036B70
	mov r1, #0x82
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x15
	strh r1, [r0, #4]
	ldr r1, [sp, #0x40]
	strh fp, [r0, #6]
	str r1, [r0, #8]
	ldr r1, [sp, #4]
	str r1, [r0, #0xc]
	strh r6, [r0, #0x10]
	strh sl, [r0, #0x12]
	ldrh r1, [r4, #0x88]
	strh r1, [r0, #0x20]
	strh r7, [r0, #0x1a]
	ldrh r1, [r4, #0x88]
	ldrh r2, [r5, #0x30]
	cmp r1, #0
	ldrh r3, [r5, #0x32]
	moveq r1, r2
	movne r1, r3
	strh r1, [r0, #0x40]
	ldrh r1, [r4, #0x88]
	cmp r1, #0
	movne r3, r2
	strh r3, [r0, #0x42]
	bl sub_03036B24
_020173E4:
	cmp sb, #0
	bgt _02017268
_020173EC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020173FC: .word 0x027F8878
_02017400: .word 0x0000FFFF
	arm_func_end sub_02017200

	arm_func_start sub_02017404
sub_02017404: ; 0x02017404
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r0
	tst r6, #0x8000
	ldrne r0, _020174A0 ; =0x00007FFF
	mov r4, r3
	andne r6, r6, r0
	addeq r0, r6, #0x1c
	moveq r0, r0, lsl #2
	addeq r6, r0, #0x66
	mov r0, r2
	bl sub_03033020
	mul r2, r6, r0
	ldr r1, _020174A4 ; =0x04000006
	add r0, r5, #0x22
	mov r3, r0, lsl #2
	ldrh r1, [r1]
	sub r0, r4, #2
	add r3, r3, #0x60
	add r2, r2, #0x388
	add r4, r3, r2
	subs r3, r0, r1
	bpl _0201746C
_02017460:
	add r0, r3, #7
	adds r3, r0, #0x100
	bmi _02017460
_0201746C:
	ldr r2, _020174A8 ; =0x66666667
	rsb r1, r3, r3, lsl #7
	mov r0, r1, lsr #0x1f
	smull r1, r3, r2, r1
	add r3, r0, r3, asr #3
	mov r0, #0xa
	mul r0, r3, r0
	cmp r0, r4
	movlo r3, #0
	mov r0, r3, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020174A0: .word 0x00007FFF
_020174A4: .word 0x04000006
_020174A8: .word 0x66666667
	arm_func_end sub_02017404

	arm_func_start sub_020174AC
sub_020174AC: ; 0x020174AC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x280
	ldr r1, _02017538 ; =0x027F8878
	ldr r2, [r0, #4]
	ldr r4, [r1, #0x550]
	add r0, sp, #0
	strh r2, [r4, #0xf6]
	add r1, r4, #0xe8
	bl sub_0200FAFC
	ldrh r1, [r4, #0xec]
	add r0, sp, #0x80
	add r1, r1, #0x10
	mov r1, r1, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_02011FA8
	mov r4, r0
	bl sub_03036B70
	mov r1, #0x21
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #2]
	beq _02017528
	mov r1, #1
	strh r1, [r0, #2]
	add r1, r1, #0x244
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
_02017528:
	bl sub_03036B24
	add sp, sp, #0x280
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02017538: .word 0x027F8878
	arm_func_end sub_020174AC

	arm_func_start sub_0201753C
sub_0201753C: ; 0x0201753C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x208
	add r1, sp, #0
	add r0, r0, #4
	mov r2, #6
	bl sub_0302D91C
	mov r8, #0
	add r7, sp, #8
	add r6, sp, #0
	mov r5, #0x13
	b _02017598
_02017568:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_020117BC
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _020175A0
	cmp r0, #7
	cmpne r0, #0xc
	bne _020175A0
	add r8, r8, #1
_02017598:
	cmp r8, #2
	blt _02017568
_020175A0:
	bl sub_03036B70
	mov r1, #0x22
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #2]
	beq _020175D8
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #5
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
_020175D8:
	bl sub_03036B24
	add sp, sp, #0x208
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_0201753C

	arm_func_start sub_020175E8
sub_020175E8: ; 0x020175E8
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #4]
	ldr r1, _02017634 ; =0x027F8878
	str r3, [r1, #0x54c]
	ldr r2, [r0, #8]
	str r2, [r1, #0x550]
	str r2, [r3]
	ldr r1, [r0, #0xc]
	str r1, [r3, #8]
	ldr r0, [r0, #0x10]
	bl sub_02017638
	bl sub_03036B70
	mov r1, #3
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02017634: .word 0x027F8878
	arm_func_end sub_020175E8

	arm_func_start sub_02017638
sub_02017638: ; 0x02017638
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _020177D8 ; =0x027F8878
	mov r8, r0
	ldr r7, [r1, #0x550]
	ldr r4, [r1, #0x54c]
	mov r5, #0
	bl sub_0302D4F0
	ldr r1, [r7, #0xc]
	mov r6, r0
	cmp r1, #1
	bne _02017678
	mov r0, r5
	str r0, [r7, #0xc]
	mov r5, #1
	bl sub_0201537C
	bl sub_0200FE30
_02017678:
	add ip, r7, #0x100
	mov r1, #0
	strh r1, [ip, #0x82]
	strh r1, [r7, #0x86]
	str r1, [r7, #0x14]
	str r1, [r7, #0x10]
	str r1, [r7, #0x1c]
	strh r1, [r7, #0xce]
	strh r1, [r7, #0xc2]
	mov r0, #1
	strh r0, [r7, #0x58]
	strh r0, [r7, #0x5a]
	mov r0, #6
	strh r0, [r7, #0x5c]
	strh r1, [r7, #0x98]
	strh r1, [r7, #0x92]
	strh r1, [r7, #0x94]
	strh r1, [r7, #0x9a]
	strh r1, [r7, #0x9c]
	ldrh r0, [r7, #0x58]
	add r3, r7, #0x700
	strh r0, [r3, #0xc0]
	ldrh r2, [r7, #0x5a]
	add r0, r7, #0x19c
	strh r2, [r3, #0xc2]
	ldrh lr, [r7, #0x5c]
	mov r2, #0x50
	strh lr, [r3, #0xc4]
	ldrh lr, [r7, #0x98]
	strh lr, [r3, #0xca]
	ldrh lr, [r7, #0x92]
	strh lr, [r3, #0xc6]
	ldrh lr, [r7, #0x94]
	strh lr, [r3, #0xc8]
	ldrh lr, [r7, #0x9a]
	strh lr, [r3, #0xcc]
	str r1, [r7, #0x198]
	strh r1, [ip, #0x96]
	bl sub_0302D860
	bl sub_0200FF5C
	mov r0, #0x104
	strh r0, [r7, #0x40]
	mov r0, #0xf0
	strh r0, [r7, #0x42]
	mov r0, #0x3e8
	strh r0, [r7, #0x44]
	mov r1, #0
	ldr r0, _020177DC ; =0x0000020B
	strh r1, [r7, #0x46]
	str r0, [r7, #0x48]
	str r1, [r7, #0x4c]
	str r1, [r7, #0x50]
	str r1, [r7, #0x54]
	strh r1, [r7, #0xc6]
	add r0, r7, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
	mov r0, r6
	str r8, [r7, #0xc8]
	bl sub_0302D504
	cmp r5, #0
	beq _02017778
	ldr r0, _020177E0 ; =0x0000FFFF
	bl sub_0201700C
_02017778:
	mov r2, #0
	mov r1, #0x8000
_02017780:
	add r0, r4, r2, lsl #4
	add r2, r2, #1
	str r1, [r0, #0xd0]
	cmp r2, #0x20
	blt _02017780
	add r1, r7, #0x1f8
	mov r0, #1
	mov r2, #0x100
	bl sub_0302D764
	bl sub_0201148C
	add r0, r7, #0x31c
	add r0, r0, #0x400
	bl sub_0302C060
	bl sub_02015368
	tst r8, #2
	bne _020177C8
	mov r0, #0xf
	bl sub_03034A0C
_020177C8:
	mov r0, #1
	strh r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020177D8: .word 0x027F8878
_020177DC: .word 0x0000020B
_020177E0: .word 0x0000FFFF
	arm_func_end sub_02017638

	arm_func_start sub_020177E4
sub_020177E4: ; 0x020177E4
	stmdb sp!, {r4, lr}
	ldr r0, _02017848 ; =0x027F8878
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #1
	beq _02017818
	bl sub_03036B70
	mov r1, #4
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02017840
_02017818:
	mov r0, #1
	bl sub_03034A0C
	mov r0, #0
	strh r0, [r4]
	bl sub_03036B70
	mov r1, #4
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02017840:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02017848: .word 0x027F8878
	arm_func_end sub_020177E4

	arm_func_start sub_0201784C
sub_0201784C: ; 0x0201784C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020178F0 ; =0x027F8878
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #1
	beq _02017884
	bl sub_03036B70
	mov r1, #5
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _020178E4
_02017884:
	add r0, sp, #2
	add r1, sp, #0
	bl sub_020178F4
	cmp r0, #0
	bne _020178C4
	bl sub_03036B70
	mov r1, #5
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	ldrh r1, [sp, #2]
	strh r1, [r0, #4]
	ldrh r1, [sp]
	strh r1, [r0, #6]
	bl sub_03036B24
	b _020178E4
_020178C4:
	mov r0, #2
	strh r0, [r4]
	bl sub_03036B70
	mov r1, #5
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_020178E4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_020178F0: .word 0x027F8878
	arm_func_end sub_0201784C

	arm_func_start sub_020178F4
sub_020178F4: ; 0x020178F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x200
	ldr r2, _02017ADC ; =0x027F8878
	mov r7, r0
	add r0, sp, #0
	mov r6, r1
	ldr r5, [r2, #0x550]
	bl sub_020120B8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02017938
	mov r1, #0x304
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _02017AD0
_02017938:
	add r0, sp, #0
	bl sub_02012088
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02017964
	ldr r1, _02017AE0 ; =0x00000302
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _02017AD0
_02017964:
	ldr r2, _02017AE4 ; =0x04808124
	mov r0, #0xc8
	strh r0, [r2]
	mov r0, #0x7d0
	strh r0, [r2, #4]
	ldr r1, _02017AE8 ; =0x00000202
	add r0, sp, #0
	strh r1, [r2, #0x2c]
	bl sub_02012044
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _020179AC
	ldr r1, _02017AEC ; =0x00000283
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _02017AD0
_020179AC:
	ldrh r2, [r0, #6]
	add r0, r5, #0x100
	mov r1, r2, lsl #0xf
	strh r2, [r0, #0xf4]
	mov r0, r1, lsr #0x10
	bl sub_03036BC4
	add r1, r5, #0x100
	strh r0, [r1, #0xf6]
	ldr r1, _02017AF0 ; =0x0000FFFF
	add r0, sp, #0
	mov r2, #0x28
	mov r3, #5
	bl sub_02011DD0
	ldr r1, _02017AF4 ; =0x001FF621
	mov r0, #0
	str r1, [r5, #0x7b8]
	str r0, [r5, #0x7bc]
	add r1, r5, #0x100
	mov r2, #2
	strh r2, [r1, #0xec]
	mov r2, #1
	add r0, sp, #0
	strh r2, [r1, #0xee]
	bl sub_020120E4
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02017A34
	ldr r1, _02017AF8 ; =0x00000306
	mov r0, #0
	strh r1, [r7]
	ldrh r1, [r4, #4]
	strh r1, [r6]
	b _02017AD0
_02017A34:
	add r0, r4, #6
	add r1, r5, #0x20
	mov r2, #8
	bl sub_0302D78C
	ldrh r1, [r4, #0xe]
	add r0, sp, #0
	strh r1, [r5, #0x28]
	ldrh r1, [r4, #0x10]
	strh r1, [r5, #0x2c]
	ldrh r1, [r4, #0x12]
	strh r1, [r5, #0x2e]
	ldrh r1, [r4, #0x14]
	strh r1, [r5, #0x2a]
	bl sub_0201202C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02017A90
	ldr r1, _02017AFC ; =0x00000281
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _02017AD0
_02017A90:
	add r0, r0, #6
	add r1, r5, #0xe0
	mov r2, #6
	bl sub_0302D91C
	add r0, sp, #0
	mov r1, #1
	bl sub_02011E94
	ldrh r1, [r0, #4]
	cmp r1, #0
	moveq r0, #1
	beq _02017AD0
	ldr r1, _02017B00 ; =0x00000215
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
_02017AD0:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02017ADC: .word 0x027F8878
_02017AE0: .word 0x00000302
_02017AE4: .word 0x04808124
_02017AE8: .word 0x00000202
_02017AEC: .word 0x00000283
_02017AF0: .word 0x0000FFFF
_02017AF4: .word 0x001FF621
_02017AF8: .word 0x00000306
_02017AFC: .word 0x00000281
_02017B00: .word 0x00000215
	arm_func_end sub_020178F4

	arm_func_start sub_02017B04
sub_02017B04: ; 0x02017B04
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _02017BAC ; =0x027F8878
	ldr r5, [r0, #0x550]
	ldrh r0, [r5]
	cmp r0, #2
	beq _02017B3C
	bl sub_03036B70
	mov r1, #6
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_03036B24
	b _02017BA0
_02017B3C:
	add r0, sp, #0
	bl sub_02012070
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02017B80
	bl sub_03036B70
	mov r2, #6
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x300
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
	bl sub_03036B24
	b _02017BA0
_02017B80:
	mov r0, #1
	strh r0, [r5]
	bl sub_03036B70
	mov r1, #6
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02017BA0:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02017BAC: .word 0x027F8878
	arm_func_end sub_02017B04

	arm_func_start sub_02017BB0
sub_02017BB0: ; 0x02017BB0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	mov r6, r0
	add r1, sp, #0
	add r0, r6, #4
	bl sub_02017C0C
	mov r5, r0
	bl sub_03036B70
	mov r4, r0
	mov r0, #0x23
	strh r0, [r4]
	strh r5, [r4, #2]
	ldr r3, [r6, #4]
	add r0, sp, #0
	add r1, r4, #8
	mov r2, #0x1c
	str r3, [r4, #4]
	bl sub_0302D91C
	mov r0, r4
	bl sub_03036B24
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	arm_func_end sub_02017BB0

	arm_func_start sub_02017C0C
sub_02017C0C: ; 0x02017C0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _02017F1C ; =0x027F8878
	mov r4, r0
	ldr r8, [r2, #0x550]
	ldr r7, [r4]
	ldrh r0, [r8]
	mov sb, r1
	add r0, r0, #0xf7
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r6, #0
	bhi _02017C50
	tst r7, #0x2c00
	bicne r7, r7, #0x2c00
	movne r6, #3
_02017C50:
	bl sub_0302D4F0
	mov r5, r0
	cmp sb, #0
	beq _02017CD8
	ldr r0, _02017F20 ; =0x00003FFF
	str r0, [sb]
	ldrh r0, [r8, #0x58]
	strh r0, [sb, #4]
	ldrh r0, [r8, #0x5a]
	strh r0, [sb, #6]
	ldrh r0, [r8, #0x5c]
	strh r0, [sb, #8]
	ldrh r0, [r8, #0x30]
	strh r0, [sb, #0xa]
	ldrh r0, [r8, #0x32]
	strh r0, [sb, #0xc]
	ldrh r0, [r8, #0x44]
	strh r0, [sb, #0xe]
	ldrh r0, [r8, #0x46]
	strh r0, [sb, #0x10]
	ldrh r0, [r8, #0x40]
	strh r0, [sb, #0x12]
	ldrh r0, [r8, #0x42]
	strh r0, [sb, #0x14]
	ldrh r0, [r8, #0x98]
	strh r0, [sb, #0x16]
	ldrh r0, [r8, #0x92]
	strb r0, [sb, #0x18]
	ldrh r0, [r8, #0x94]
	strb r0, [sb, #0x19]
	ldrh r0, [r8, #0x9a]
	strb r0, [sb, #0x1a]
	ldrh r0, [r8, #0x9c]
	strb r0, [sb, #0x1b]
_02017CD8:
	tst r7, #1
	beq _02017CF8
	ldrh r1, [r4, #4]
	add r0, r8, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r8, #0x58]
	strh r1, [r0, #0xc0]
_02017CF8:
	tst r7, #2
	beq _02017D24
	ldrh r1, [r4, #6]
	add r0, r8, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r8, #0x5a]
	strh r1, [r0, #0xc2]
	ldrsh r0, [r8, #0x62]
	cmp r0, r1
	strgth r1, [r8, #0x62]
_02017D24:
	tst r7, #4
	beq _02017D50
	ldrh r1, [r4, #8]
	add r0, r8, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r8, #0x5c]
	strh r1, [r0, #0xc4]
	ldrsh r0, [r8, #0x62]
	cmp r0, r1
	strgth r1, [r8, #0x62]
_02017D50:
	tst r7, #8
	beq _02017D7C
	ldrh r0, [r4, #0xa]
	ldrh r2, [r8, #0x34]
	add r1, r0, #1
	bic r1, r1, #1
	mov r1, r1, lsl #0x10
	cmp r2, r1, lsr #16
	movlo r6, #6
	blo _02017D7C
	bl sub_02010030
_02017D7C:
	tst r7, #0x10
	beq _02017DA8
	ldrh r0, [r4, #0xc]
	add r1, r0, #1
	bic r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #0x200
	movhi r6, #6
	bhi _02017DA8
	bl sub_0201005C
_02017DA8:
	tst r7, #0x20
	beq _02017DFC
	ldrh r0, [r4, #0xe]
	ldr r1, _02017F24 ; =0x00002710
	cmp r0, r1
	movhi r6, #6
	bhi _02017DFC
	ldr r1, _02017F28 ; =0x000082EA
	mov r2, #0
	umull sb, r3, r0, r1
	mla r3, r0, r2, r3
	mla r3, r2, r1, r3
	mov r2, sb, lsr #6
	orr r2, r2, r3, lsl #26
	mov r1, r3, lsr #6
	mov r2, r2, lsr #0xa
	strh r0, [r8, #0x44]
	orr r2, r2, r1, lsl #22
	str r2, [r8, #0x48]
	mov r0, r1, lsr #0xa
	str r0, [r8, #0x4c]
_02017DFC:
	tst r7, #0x40
	beq _02017E50
	ldrh r0, [r4, #0x10]
	ldr r1, _02017F24 ; =0x00002710
	cmp r0, r1
	movhi r6, #6
	bhi _02017E50
	ldr r1, _02017F28 ; =0x000082EA
	mov r2, #0
	umull sb, r3, r0, r1
	mla r3, r0, r2, r3
	mla r3, r2, r1, r3
	mov r2, sb, lsr #6
	orr r2, r2, r3, lsl #26
	mov r1, r3, lsr #6
	mov r2, r2, lsr #0xa
	strh r0, [r8, #0x46]
	orr r2, r2, r1, lsl #22
	str r2, [r8, #0x50]
	mov r0, r1, lsr #0xa
	str r0, [r8, #0x54]
_02017E50:
	tst r7, #0x80
	beq _02017E84
	ldrh r1, [r4, #0x12]
	cmp r1, #0xbe
	bls _02017E78
	cmp r1, #0xdc
	blo _02017E80
	ldr r0, _02017F2C ; =0x00000106
	cmp r1, r0
	bhi _02017E80
_02017E78:
	strh r1, [r8, #0x40]
	b _02017E84
_02017E80:
	mov r6, #6
_02017E84:
	tst r7, #0x100
	beq _02017EB8
	ldrh r1, [r4, #0x14]
	cmp r1, #0xbe
	bls _02017EAC
	cmp r1, #0xdc
	blo _02017EB4
	ldr r0, _02017F2C ; =0x00000106
	cmp r1, r0
	bhi _02017EB4
_02017EAC:
	strh r1, [r8, #0x42]
	b _02017EB8
_02017EB4:
	mov r6, #6
_02017EB8:
	tst r7, #0x200
	ldrneh r1, [r4, #0x16]
	addne r0, r8, #0x700
	strneh r1, [r8, #0x98]
	strneh r1, [r0, #0xca]
	tst r7, #0x400
	ldrneb r0, [r4, #0x18]
	strneh r0, [r8, #0x92]
	tst r7, #0x800
	ldrneb r0, [r4, #0x19]
	strneh r0, [r8, #0x94]
	tst r7, #0x1000
	ldrneb r1, [r4, #0x1a]
	addne r0, r8, #0x700
	strneh r1, [r8, #0x9a]
	ldrneh r1, [r8, #0x9a]
	strneh r1, [r0, #0xcc]
	tst r7, #0x2000
	ldrneb r0, [r4, #0x1b]
	strneh r0, [r8, #0x9c]
	mov r0, r5
	bl sub_0302D504
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02017F1C: .word 0x027F8878
_02017F20: .word 0x00003FFF
_02017F24: .word 0x00002710
_02017F28: .word 0x000082EA
_02017F2C: .word 0x00000106
	arm_func_end sub_02017C0C

	arm_func_start sub_02017F30
sub_02017F30: ; 0x02017F30
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, [r0, #4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_02011F4C
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _02017F80
	bl sub_03036B70
	mov r1, #0x24
	strh r1, [r0]
	mov r2, #1
	ldr r1, _02017FA4 ; =0x00000242
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_03036B24
	b _02017F98
_02017F80:
	bl sub_03036B70
	mov r1, #0x24
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_03036B24
_02017F98:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02017FA4: .word 0x00000242
	arm_func_end sub_02017F30
_02017FA8:
	.byte 0x08, 0xC0, 0x9F, 0xE5, 0x01, 0x10, 0xA0, 0xE3
	.byte 0x00, 0x20, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0xFC, 0x44, 0x7E, 0x02, 0xF8, 0x40, 0x2D, 0xE9
	.byte 0x23, 0xDE, 0x4D, 0xE2, 0x6C, 0x11, 0x9F, 0xE5, 0x00, 0x70, 0xA0, 0xE1, 0x50, 0x65, 0x91, 0xE5
	.byte 0x30, 0x50, 0x8D, 0xE2, 0xE5, 0x7A, 0x40, 0xEB, 0x00, 0x40, 0xA0, 0xE1, 0x28, 0x10, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC4, 0xE1, 0xB0, 0x10, 0xD6, 0xE1, 0x0B, 0x00, 0x51, 0xE3, 0x03, 0x00, 0x00, 0x0A
	.byte 0x03, 0x10, 0xA0, 0xE3, 0xB2, 0x10, 0xC4, 0xE1, 0xC9, 0x7A, 0x40, 0xEB, 0x4A, 0x00, 0x00, 0xEA
	.byte 0x04, 0x00, 0x97, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x01, 0x00, 0x50, 0xE3, 0x01, 0x00, 0xA0, 0x03
	.byte 0x00, 0x00, 0xA0, 0x13, 0x00, 0x18, 0xA0, 0xE1, 0x05, 0x00, 0xA0, 0xE1, 0x21, 0x18, 0xA0, 0xE1
	.byte 0x01, 0x30, 0xA0, 0xE3, 0x60, 0xE5, 0xFF, 0xEB, 0xB4, 0x10, 0xD0, 0xE1, 0x00, 0x00, 0x51, 0xE3
	.byte 0x07, 0x00, 0x00, 0x0A, 0x01, 0x10, 0xA0, 0xE3, 0xB2, 0x10, 0xC4, 0xE1, 0xB4, 0x10, 0xC4, 0xE1
	.byte 0xB4, 0x10, 0xD0, 0xE1, 0x04, 0x00, 0xA0, 0xE1, 0xB6, 0x10, 0xC4, 0xE1, 0xB4, 0x7A, 0x40, 0xEB
	.byte 0x35, 0x00, 0x00, 0xEA, 0xDC, 0x00, 0x9F, 0xE5, 0x06, 0x20, 0xA0, 0xE3, 0x50, 0x55, 0x90, 0xE5
	.byte 0x8A, 0x00, 0x85, 0xE2, 0x01, 0x0C, 0x80, 0xE2, 0xA2, 0x10, 0x85, 0xE2, 0x2A, 0x56, 0x40, 0xEB
	.byte 0x30, 0x10, 0x8D, 0xE2, 0xA8, 0x10, 0x85, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0xBC, 0x0A, 0xC5, 0xE1
	.byte 0x01, 0x20, 0xA0, 0xE3, 0x18, 0x20, 0x85, 0xE5, 0x00, 0x10, 0x8D, 0xE2, 0x30, 0x20, 0xA0, 0xE3
	.byte 0xB3, 0x55, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0xB0, 0x00, 0xCD, 0xE1, 0xB6, 0x00, 0xCD, 0xE1
	.byte 0x01, 0x0C, 0x85, 0xE2, 0xBC, 0x0E, 0xD0, 0xE1, 0x18, 0x10, 0x8D, 0xE2, 0x02, 0x00, 0x50, 0xE3
	.byte 0x14, 0x30, 0xA0, 0x03, 0x8A, 0x00, 0x85, 0xE2, 0x0A, 0x30, 0xA0, 0x13, 0x01, 0x0C, 0x80, 0xE2
	.byte 0x06, 0x20, 0xA0, 0xE3, 0x0E, 0x30, 0xCD, 0xE5, 0x13, 0x56, 0x40, 0xEB, 0x1E, 0x10, 0x8D, 0xE2
	.byte 0xE0, 0x00, 0x85, 0xE2, 0x06, 0x20, 0xA0, 0xE3, 0x0F, 0x56, 0x40, 0xEB, 0x30, 0x00, 0x8D, 0xE2
	.byte 0x2C, 0x00, 0x8D, 0xE5, 0x00, 0x10, 0x8D, 0xE2, 0x40, 0xE6, 0xFF, 0xEB, 0xB4, 0x10, 0xD0, 0xE1
	.byte 0x00, 0x00, 0x51, 0xE3, 0x08, 0x00, 0x00, 0x0A, 0x01, 0x10, 0xA0, 0xE3, 0xB2, 0x10, 0xC4, 0xE1
	.byte 0x01, 0x1C, 0xA0, 0xE3, 0xB4, 0x10, 0xC4, 0xE1, 0xB4, 0x10, 0xD0, 0xE1, 0x04, 0x00, 0xA0, 0xE1
	.byte 0xB6, 0x10, 0xC4, 0xE1, 0x82, 0x7A, 0x40, 0xEB, 0x03, 0x00, 0x00, 0xEA, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x04, 0x00, 0xA0, 0xE1, 0xB2, 0x10, 0xC4, 0xE1, 0x7D, 0x7A, 0x40, 0xEB, 0x23, 0xDE, 0x8D, 0xE2
	.byte 0xF8, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x78, 0x88, 0x7F, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x8A, 0x7A, 0x40, 0xEB, 0x29, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x04, 0x10, 0xA0, 0xE3
	.byte 0xB2, 0x10, 0xC0, 0xE1, 0x72, 0x7A, 0x40, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02018160
sub_02018160: ; 0x02018160
	stmdb sp!, {r3, lr}
	bl sub_03036B70
	mov r1, #0x2a
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_03036B24
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02018160

	arm_func_start sub_02018184
sub_02018184: ; 0x02018184
	stmdb sp!, {r3, lr}
	bl sub_0201A3D0
	bl sub_020194E4
	bl sub_02019F10
	bl sub_02018534
	bl sub_020183B4
	ldr r0, _020181CC ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x300
	ldr r0, [r0, #0x31c]
	ldrh r1, [r1, #0x20]
	bl sub_020185CC
	bl sub_0201BED4
	bl sub_0201D8A0
	bl sub_0201BC64
	bl sub_02018FA0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020181CC: .word 0x0380FFF4
	arm_func_end sub_02018184

	arm_func_start sub_020181D0
sub_020181D0: ; 0x020181D0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	ldr r1, [r4]
	ldr r3, _02018390 ; =0x0380FFF4
	ldr r2, _02018394 ; =0x00000694
	mov r0, #0
	str r1, [r3]
	bl sub_0302D804
	bl sub_0302B3EC
	ldr r2, _02018390 ; =0x0380FFF4
	ldr r1, [r2]
	str r0, [r1, #0x314]
	ldr r1, [r4, #0x18]
	ldr r0, [r2]
	str r1, [r0, #0x30c]
	ldr r1, [r4, #0x1c]
	ldr r0, [r2]
	mov r1, r1, lsr #1
	str r1, [r0, #0x310]
	ldr r1, [r2]
	ldr r0, [r1, #0x310]
	cmp r0, #0
	mvneq r0, #0
	streq r0, [r1, #0x310]
	add r0, r4, #0x20
	bl sub_0201845C
	bl sub_020246B0
	ldr r3, _02018398 ; =0x04000304
	ldr r1, _02018390 ; =0x0380FFF4
	ldrh r2, [r3]
	mov r0, #0x30
	orr r2, r2, #2
	strh r2, [r3]
	strh r0, [r3, #-0xfe]
	ldr r0, [r1]
	mov r2, #3
	str r2, [r0, #0x68c]
	ldr r1, [r1]
	mov r0, #0x3c
	add r1, r1, #0x92
	add r2, r1, #0x600
	mov r1, #2
	bl sub_02024600
	ldr r1, _02018390 ; =0x0380FFF4
	mov r0, #0x3e
	ldr r2, [r1]
	mov r1, #2
	add r2, r2, #0x690
	bl sub_02024600
	ldr r2, _02018390 ; =0x0380FFF4
	ldr r3, [r4, #0x10]
	ldr r0, [r2]
	mov r1, #0x1c
	str r3, [r0, #0x308]
	ldr r0, [r2]
	ldr r2, [r4, #0x14]
	str r2, [r0, #0x304]
	ldr r0, [r4, #0x30]
	bl sub_030365C4
	mov r1, r0
	ldr r0, [r4, #0x2c]
	bl sub_020185CC
	bl sub_020183B4
	bl sub_0201BED4
	bl sub_0201D8A0
	bl sub_0201BC64
	bl sub_0201A138
	add r0, sp, #8
	bl sub_0202451C
	cmp r0, #0
	beq _0201830C
	ldr r0, _02018390 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #0x80
	strh r1, [r0, #0x3e]
	b _02018334
_0201830C:
	bl sub_02019EA0
	bl sub_0201AA10
	bl sub_0201956C
	bl sub_02019F10
	bl sub_02019FB0
	bl sub_0201ABB4
	bl sub_0201AD40
	bl sub_02019F48
	bl sub_02018FA0
	bl sub_020194E4
_02018334:
	ldr r1, [r4, #8]
	ldr r0, _02018390 ; =0x0380FFF4
	str r1, [sp]
	ldr r2, [r4, #0xc]
	ldr r1, _0201839C ; =0x037F84E0
	str r2, [sp, #4]
	ldr r0, [r0]
	ldr r3, [r4, #4]
	add r0, r0, #0x18
	mov r2, #0
	bl sub_0302B844
	ldr r0, _02018390 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x18
	bl sub_0302BB5C
	bl sub_0201B0AC
	ldr r0, _02018390 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3e]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_02018390: .word 0x0380FFF4
_02018394: .word 0x00000694
_02018398: .word 0x04000304
_0201839C: .word 0x037F84E0
	arm_func_end sub_020181D0

	arm_func_start sub_020183A0
sub_020183A0: ; 0x020183A0
	ldr r0, _020183B0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x18
	bx lr
	.align 2, 0
_020183B0: .word 0x0380FFF4
	arm_func_end sub_020183A0

	arm_func_start sub_020183B4
sub_020183B4: ; 0x020183B4
	stmdb sp!, {r4, lr}
	ldr r0, _02018434 ; =0x0380FFF4
	mov r3, #0
	ldr lr, [r0]
	ldr r2, _02018438 ; =0x0000FFFF
	strh r3, [lr, #0x10]
	strh r3, [lr, #0x12]
_020183D0:
	add r0, lr, r3, lsl #1
	strh r2, [r0, #8]
	ldrh r0, [r0, #8]
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r0, [lr, r1]
	cmp r3, #4
	blo _020183D0
	ldr ip, _02018438 ; =0x0000FFFF
	mov r4, #0
	ldr r1, _0201843C ; =0x027F723C
	mov r2, r4
_02018400:
	add r3, lr, r4, lsl #3
	strh ip, [r3, #0xbc]
	ldr r0, [r1, r4, lsl #2]
	strh r2, [r3, #0xbe]
	add r4, r4, #1
	str r0, [r3, #0xc0]
	cmp r4, #0x18
	blo _02018400
	mov r0, #3
	mov r1, #0xc
	bl sub_03027D88
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02018434: .word 0x0380FFF4
_02018438: .word 0x0000FFFF
_0201843C: .word 0x027F723C
	arm_func_end sub_020183B4

	arm_func_start sub_02018440
sub_02018440: ; 0x02018440
	mvn r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	mov r2, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_02018440

	arm_func_start sub_0201845C
sub_0201845C: ; 0x0201845C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018530 ; =0x0380FFF4
	ldr r2, [r0]
	ldr r4, [r1]
	mov r1, #2
	str r2, [r4, #0x17c]
	ldr r2, [r0, #4]
	add r5, r4, #0x344
	str r2, [r4, #0x180]
	ldr r2, [r0, #8]
	add r0, r4, #0x188
	str r2, [r4, #0x184]
	bl sub_02018440
	add r0, r4, #0x194
	mov r1, #3
	bl sub_02018440
	add r0, r4, #0x1a0
	mov r1, #4
	bl sub_02018440
	add r0, r4, #0x1ac
	mov r1, #5
	bl sub_02018440
	add r0, r4, #0x1b8
	mov r1, #6
	bl sub_02018440
	add r0, r4, #0x1c4
	mov r1, #7
	bl sub_02018440
	add r0, r4, #0x1d0
	mov r1, #8
	bl sub_02018440
	add r0, r4, #0x1dc
	mov r1, #9
	bl sub_02018440
	add r0, r4, #0x1e8
	mov r1, #0xa
	bl sub_02018440
	add r0, r4, #0x1f4
	mov r1, #0xb
	bl sub_02018440
	add r0, r4, #0x200
	mov r1, #0xc
	bl sub_02018440
	add r0, r4, #0x188
	mov r1, #0x81
	bl sub_0302805C
	add r0, r0, #0xc
	str r0, [r5, #0x9c]
	mov r0, #0
	strh r0, [r5, #0xa0]
	strh r0, [r5, #0xa4]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02018530: .word 0x0380FFF4
	arm_func_end sub_0201845C

	arm_func_start sub_02018534
sub_02018534: ; 0x02018534
	stmdb sp!, {r4, lr}
	ldr r0, _02018588 ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0x194
	bl sub_0201858C
	add r0, r4, #0x1a0
	bl sub_0201858C
	add r0, r4, #0x1ac
	bl sub_0201858C
	add r0, r4, #0x1b8
	bl sub_0201858C
	add r0, r4, #0x1c4
	bl sub_0201858C
	add r0, r4, #0x1d0
	bl sub_0201858C
	add r0, r4, #0x1dc
	bl sub_0201858C
	add r0, r4, #0x1e8
	bl sub_0201858C
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02018588: .word 0x0380FFF4
	arm_func_end sub_02018534

	arm_func_start sub_0201858C
sub_0201858C: ; 0x0201858C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh r0, [r6, #8]
	ldr r1, [r6]
	cmp r0, #0
	beq _020185C4
	mvn r4, #0
	b _020185BC
_020185AC:
	ldr r5, [r1, #4]
	mov r0, r6
	bl sub_030280F8
	mov r1, r5
_020185BC:
	cmp r1, r4
	bne _020185AC
_020185C4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0201858C

	arm_func_start sub_020185CC
sub_020185CC: ; 0x020185CC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02018648 ; =0x0380FFF4
	mov r5, r0
	ldr r3, [r2]
	mov r6, r1
	add r1, r3, #0x31c
	mov r0, #0
	mov r2, #0x28
	ldr r4, [r3, #0x3e0]
	bl sub_0302D764
	ldr r1, _02018648 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0xc0
	add r1, r1, #0x344
	bl sub_0302D764
	ldr r3, _02018648 ; =0x0380FFF4
	mov r0, r6, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	str r5, [r2, #0x31c]
	ldr r0, [r3]
	add r0, r0, #0x300
	strh r1, [r0, #0x20]
	ldr r0, [r3]
	add r0, r0, #0x300
	strh r1, [r0, #0x22]
	ldr r0, [r3]
	str r4, [r0, #0x3e0]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02018648: .word 0x0380FFF4
	arm_func_end sub_020185CC

	arm_func_start sub_0201864C
sub_0201864C: ; 0x0201864C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #1
	movne r0, #5
	bne _0201869C
	ldr r0, _020186A4 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x324
	bl sub_020198D0
	ldr r0, _020186A8 ; =0x04808018
	mov r1, r4
	bl sub_020198D0
	ldr r1, _020186A4 ; =0x0380FFF4
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x340]
	orr r1, r1, #2
	str r1, [r2, #0x340]
_0201869C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020186A4: .word 0x0380FFF4
_020186A8: .word 0x04808018
	arm_func_end sub_0201864C

	arm_func_start sub_020186AC
sub_020186AC: ; 0x020186AC
	cmp r0, #0xff
	movhi r0, #5
	bxhi lr
	ldr r1, _020186D8 ; =0x0380FFF4
	ldr r2, _020186DC ; =0x0480802C
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x2a]
	strh r0, [r2]
	mov r0, #0
	bx lr
	.align 2, 0
_020186D8: .word 0x0380FFF4
_020186DC: .word 0x0480802C
	arm_func_end sub_020186AC

	arm_func_start sub_020186E0
sub_020186E0: ; 0x020186E0
	ldr r1, _02018718 ; =0x00007FFE
	tst r0, r1
	moveq r0, #5
	bxeq lr
	ldr r2, _0201871C ; =0x0380FFF4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x2c]
	ldr r2, [r2]
	mov r0, #0
	ldr r1, [r2, #0x340]
	orr r1, r1, #4
	str r1, [r2, #0x340]
	bx lr
	.align 2, 0
_02018718: .word 0x00007FFE
_0201871C: .word 0x0380FFF4
	arm_func_end sub_020186E0

	arm_func_start sub_02018720
sub_02018720: ; 0x02018720
	stmdb sp!, {r3, lr}
	cmp r0, #3
	movhi r0, #5
	bhi _0201878C
	ldr ip, _02018794 ; =0x0380FFF4
	ldr r3, _02018798 ; =0x04808006
	ldr r1, [ip]
	ldr r2, _0201879C ; =0x0000FFF8
	add r1, r1, #0x300
	strh r0, [r1, #0x2e]
	ldr r1, [ip]
	add r1, r1, #0x300
	strh r0, [r1, #0x50]
	ldrh r1, [r3]
	and r1, r1, r2
	orr r0, r1, r0
	strh r0, [r3]
	ldr r0, [ip]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x52]
	bl sub_0201943C
	ldr r1, _02018794 ; =0x0380FFF4
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x340]
	orr r1, r1, #8
	str r1, [r2, #0x340]
_0201878C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02018794: .word 0x0380FFF4
_02018798: .word 0x04808006
_0201879C: .word 0x0000FFF8
	arm_func_end sub_02018720

	arm_func_start sub_020187A0
sub_020187A0: ; 0x020187A0
	stmdb sp!, {r3, lr}
	cmp r0, #2
	movhi r0, #5
	bhi _020187C8
	ldr r1, _020187D0 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x30]
	bl sub_020193BC
	mov r0, #0
_020187C8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020187D0: .word 0x0380FFF4
	arm_func_end sub_020187A0

	arm_func_start sub_020187D4
sub_020187D4: ; 0x020187D4
	ldr r1, _02018868 ; =0x0380FFF4
	cmp r0, #3
	ldr r1, [r1]
	movhi r0, #5
	add r2, r1, #0x344
	bxhi lr
	add r1, r1, #0x300
	strh r0, [r1, #0x34]
	ldrh r1, [r2, #0x7c]
	cmp r0, #0
	biceq r1, r1, #0x10
	streqh r1, [r2, #0x7c]
	ldreqh r1, [r2, #0x8a]
	ldr r3, _0201886C ; =0x04808006
	biceq r1, r1, #0x4000
	orrne r1, r1, #0x10
	strneh r1, [r2, #0x7c]
	ldrneh r1, [r2, #0x8a]
	orrne r1, r1, #0x4000
	strh r1, [r2, #0x8a]
	ldrh r1, [r2, #8]
	cmp r1, #0x40
	cmpeq r0, #1
	ldreq r1, _02018868 ; =0x0380FFF4
	ldreqh r2, [r2, #0x7c]
	ldreq r1, [r1]
	ldreq r1, [r1, #0x4ac]
	streqh r2, [r1, #0x2e]
	cmp r0, #0
	ldr r1, _02018870 ; =0x0000FFC7
	ldrh r2, [r3]
	moveq r0, #1
	and r1, r2, r1
	orr r0, r1, r0, lsl #3
	strh r0, [r3]
	mov r0, #0
	bx lr
	.align 2, 0
_02018868: .word 0x0380FFF4
_0201886C: .word 0x04808006
_02018870: .word 0x0000FFC7
	arm_func_end sub_020187D4

	arm_func_start sub_02018874
sub_02018874: ; 0x02018874
	cmp r0, #3
	ldrls r1, _02018894 ; =0x0380FFF4
	movhi r0, #5
	ldrls r1, [r1]
	addls r1, r1, #0x300
	strlsh r0, [r1, #0x36]
	movls r0, #0
	bx lr
	.align 2, 0
_02018894: .word 0x0380FFF4
	arm_func_end sub_02018874

	arm_func_start sub_02018898
sub_02018898: ; 0x02018898
	stmdb sp!, {r4, lr}
	ldr r1, _020188E8 ; =0x04805F80
	mov r2, #0x14
	mov r4, r0
	bl sub_0302D78C
	ldr r1, _020188EC ; =0x04805FA0
	add r0, r4, #0x14
	mov r2, #0x14
	bl sub_0302D78C
	ldr r1, _020188F0 ; =0x04805FC0
	add r0, r4, #0x28
	mov r2, #0x14
	bl sub_0302D78C
	ldr r1, _020188F4 ; =0x04805FE0
	add r0, r4, #0x3c
	mov r2, #0x14
	bl sub_0302D78C
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020188E8: .word 0x04805F80
_020188EC: .word 0x04805FA0
_020188F0: .word 0x04805FC0
_020188F4: .word 0x04805FE0
	arm_func_end sub_02018898

	arm_func_start sub_020188F8
sub_020188F8: ; 0x020188F8
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _0201892C ; =0x0380FFF4
	and r2, r0, #1
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x300
	ldrh r3, [r1, #0x3a]
	bic r3, r3, #1
	orr r2, r3, r2
	strh r2, [r1, #0x3a]
	bx lr
	.align 2, 0
_0201892C: .word 0x0380FFF4
	arm_func_end sub_020188F8

	arm_func_start sub_02018930
sub_02018930: ; 0x02018930
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _02018964 ; =0x0380FFF4
	mov r2, r0, lsl #0x1f
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x300
	ldrh r3, [r1, #0x3a]
	bic r3, r3, #2
	orr r2, r3, r2, lsr #30
	strh r2, [r1, #0x3a]
	bx lr
	.align 2, 0
_02018964: .word 0x0380FFF4
	arm_func_end sub_02018930

	arm_func_start sub_02018968
sub_02018968: ; 0x02018968
	cmp r0, #0xff
	movhi r0, #5
	bxhi lr
	ldr r2, _0201899C ; =0x0380FFF4
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r3, [r1, #0xc4]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0xc2]
	mov r0, r3
	bx lr
	.align 2, 0
_0201899C: .word 0x0380FFF4
	arm_func_end sub_02018968

	arm_func_start sub_020189A0
sub_020189A0: ; 0x020189A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	cmp r4, #0xa
	movlo r0, #5
	blo _02018A40
	ldr r0, _02018A48 ; =0x0380FFF4
	cmp r1, #0
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r4, [r0, #0x3c]
	ldrne r0, _02018A4C ; =0x04808134
	strneh r4, [r0]
	ldr r0, _02018A48 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x400
	ldrh r0, [r0, #0xa4]
	cmp r0, #0
	beq _02018A3C
	ldr r2, [r1, #0x4ac]
	add r0, r1, #0x300
	ldrh r1, [r0, #0x52]
	ldrh r0, [r0, #0xda]
	add r2, r2, #0x24
	add r5, r2, r0
	cmp r1, #1
	add r0, r5, #6
	bne _02018A28
	and r1, r4, #0xff
	bl sub_0201A514
	mov r1, r4, asr #8
	add r0, r5, #7
	and r1, r1, #0xff
	bl sub_0201A514
	b _02018A3C
_02018A28:
	mov r1, #0xff
	bl sub_0201A514
	add r0, r5, #7
	mov r1, #0xff
	bl sub_0201A514
_02018A3C:
	mov r0, #0
_02018A40:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02018A48: .word 0x0380FFF4
_02018A4C: .word 0x04808134
	arm_func_end sub_020189A0

	arm_func_start sub_02018A50
sub_02018A50: ; 0x02018A50
	ldr r1, _02018A7C ; =0x0380FFF4
	mov r2, #0
	ldr r1, [r1]
	add r3, r1, #0x384
_02018A60:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r2, #0x10
	strh r1, [r3], #2
	blo _02018A60
	mov r0, #0
	bx lr
	.align 2, 0
_02018A7C: .word 0x0380FFF4
	arm_func_end sub_02018A50

	arm_func_start sub_02018A80
sub_02018A80: ; 0x02018A80
	stmdb sp!, {r3, lr}
	ldr r1, _02018B20 ; =0x0380FFF4
	cmp r0, #1
	ldr r2, [r1]
	movhi r0, #5
	add r1, r2, #0x344
	bhi _02018B18
	add r2, r2, #0x300
	ldrh ip, [r2, #0x3a]
	mov r3, r0, lsl #0x1f
	bic ip, ip, #4
	orr r3, ip, r3, lsr #29
	strh r3, [r2, #0x3a]
	ldrh r2, [r1, #0x7c]
	cmp r0, #0
	biceq r2, r2, #0x20
	orrne r2, r2, #0x20
	strh r2, [r1, #0x7c]
	ldrh r2, [r1, #8]
	cmp r2, #0x40
	ldreq r2, _02018B20 ; =0x0380FFF4
	ldreq r3, [r2]
	addeq r2, r3, #0x300
	ldreqh r2, [r2, #0x2e]
	cmpeq r2, #1
	ldreqh r2, [r1, #0x7c]
	ldreq r1, [r3, #0x4ac]
	streqh r2, [r1, #0x2e]
	ldr r1, _02018B24 ; =0x048080BC
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #6
	streqh r0, [r1]
	ldrneh r0, [r1]
	orrne r0, r0, #6
	strneh r0, [r1]
	bl sub_020193BC
	mov r0, #0
_02018B18:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02018B20: .word 0x0380FFF4
_02018B24: .word 0x048080BC
	arm_func_end sub_02018A80

	arm_func_start sub_02018B28
sub_02018B28: ; 0x02018B28
	cmp r0, #1
	ldrls r1, _02018B48 ; =0x0380FFF4
	movhi r0, #5
	ldrls r1, [r1]
	addls r1, r1, #0x300
	strlsh r0, [r1, #0x32]
	movls r0, #0
	bx lr
	.align 2, 0
_02018B48: .word 0x0380FFF4
	arm_func_end sub_02018B28

	arm_func_start sub_02018B4C
sub_02018B4C: ; 0x02018B4C
	stmdb sp!, {r4, lr}
	cmp r0, #3
	mov r4, r1
	movhi r0, #5
	bhi _02018B88
	cmp r4, #0x3f
	movhi r0, #5
	bhi _02018B88
	mov r1, r0
	mov r0, #0x13
	bl sub_02019DE0
	mov r1, r4
	mov r0, #0x35
	bl sub_02019DE0
	mov r0, #0
_02018B88:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02018B4C

	arm_func_start sub_02018B90
sub_02018B90: ; 0x02018B90
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r3, _02018BF0 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strh r1, [r0, #0x3a]
	ldr r0, [r3]
	ldr r1, _02018BF4 ; =0x04808290
	add r0, r0, #0x300
	ldrh r3, [r0, #0x3a]
	mov r0, #0
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1]
	bx lr
	.align 2, 0
_02018BF0: .word 0x0380FFF4
_02018BF4: .word 0x04808290
	arm_func_end sub_02018B90

	arm_func_start sub_02018BF8
sub_02018BF8: ; 0x02018BF8
	cmp r0, #1
	cmpls r1, #1
	movhi r0, #5
	bxhi lr
	cmp r0, #0
	beq _02018C1C
	cmp r0, #1
	beq _02018C48
	b _02018C70
_02018C1C:
	ldr r2, _02018CC4 ; =0x0380FFF4
	mov r1, r1, lsl #0x10
	ldr r3, [r2]
	mov r2, r1, lsr #0x10
	add r1, r3, #0x300
	ldrh r3, [r1, #0x3a]
	mov r2, r2, lsl #0x1f
	bic r3, r3, #0x20
	orr r2, r3, r2, lsr #26
	strh r2, [r1, #0x3a]
	b _02018C70
_02018C48:
	ldr r1, _02018CC4 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x2e]
	cmp r2, #1
	movne r0, #0xb
	bxne lr
	ldrh r2, [r1, #0x3a]
	bic r2, r2, #0x20
	strh r2, [r1, #0x3a]
_02018C70:
	ldr r3, _02018CC4 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #0x10
	orr r1, r2, r1, lsr #27
	strh r1, [r0, #0x3a]
	ldr r0, [r3]
	ldr r1, _02018CC8 ; =0x04808290
	add r0, r0, #0x300
	ldrh r3, [r0, #0x3a]
	mov r0, #0
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1]
	bx lr
	.align 2, 0
_02018CC4: .word 0x0380FFF4
_02018CC8: .word 0x04808290
	arm_func_end sub_02018BF8

	arm_func_start sub_02018CCC
sub_02018CCC: ; 0x02018CCC
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _02018D08 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #0x40
	orr r1, r2, r1, lsr #25
	strh r1, [r0, #0x3a]
	mov r0, #0
	bx lr
	.align 2, 0
_02018D08: .word 0x0380FFF4
	arm_func_end sub_02018CCC

	arm_func_start sub_02018D0C
sub_02018D0C: ; 0x02018D0C
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r2, _02018D54 ; =0x0380FFF4
	mov r1, r0, lsl #0x10
	ldr r3, [r2]
	mov r2, r1, lsr #0x10
	add r1, r3, #0x300
	ldrh r3, [r1, #0x3a]
	mov r2, r2, lsl #0x1f
	bic r3, r3, #0x80
	orr r2, r3, r2, lsr #24
	strh r2, [r1, #0x3a]
	ldreq r1, _02018D58 ; =0x0480802A
	ldreqh r0, [r1]
	streqh r0, [r1, #-2]
	mov r0, #0
	bx lr
	.align 2, 0
_02018D54: .word 0x0380FFF4
_02018D58: .word 0x0480802A
	arm_func_end sub_02018D0C

	arm_func_start sub_02018D5C
sub_02018D5C: ; 0x02018D5C
	stmdb sp!, {r4, lr}
	ldr r1, _02018DB4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x3a8
	bl sub_020198D0
	ldr r0, _02018DB8 ; =0x04808020
	mov r1, r4
	bl sub_020198D0
	ldrh r0, [r4]
	ldr r1, _02018DBC ; =0x048080D0
	tst r0, #1
	ldrneh r0, [r1]
	bicne r0, r0, #0x400
	strneh r0, [r1]
	ldreqh r0, [r1]
	orreq r0, r0, #0x400
	streqh r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02018DB4: .word 0x0380FFF4
_02018DB8: .word 0x04808020
_02018DBC: .word 0x048080D0
	arm_func_end sub_02018D5C

	arm_func_start sub_02018DC0
sub_02018DC0: ; 0x02018DC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _02018ECC ; =0x0380FFF4
	mov r8, r0
	ldr r2, [r2]
	cmp r8, #0x20
	mov r7, r1
	add r4, r2, #0x344
	mov r6, #0
	movhi r0, #5
	bhi _02018EC4
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	addeq r0, r2, #0x300
	ldreqh r0, [r0, #0x2e]
	cmpeq r0, #1
	bne _02018E1C
	ldrh r0, [r4, #0x1e]
	cmp r0, r8
	movne r0, #6
	bne _02018EC4
	ldrh r0, [r4, #0x92]
	cmp r0, #0
	movne r6, #1
_02018E1C:
	mov r5, #0
	add sb, r4, #0x20
	b _02018E44
_02018E28:
	mov r0, r7
	bl sub_0201A540
	mov r1, r0
	add r0, sb, r5
	bl sub_0201A514
	add r7, r7, #1
	add r5, r5, #1
_02018E44:
	cmp r5, r8
	blo _02018E28
	add sb, r4, #0x20
	mov r7, #0
	b _02018E68
_02018E58:
	mov r1, r7
	add r0, sb, r5
	bl sub_0201A514
	add r5, r5, #1
_02018E68:
	cmp r5, #0x20
	blo _02018E58
	strh r8, [r4, #0x1e]
	cmp r6, #0
	beq _02018EC0
	ldr r1, _02018ECC ; =0x0380FFF4
	ldrh r0, [r4, #0x92]
	ldr r1, [r1]
	mov r5, #0
	ldr r1, [r1, #0x4ac]
	add r4, r4, #0x20
	add r1, r1, #0x26
	add r6, r1, r0
	b _02018EB8
_02018EA0:
	add r0, r4, r5
	bl sub_0201A540
	mov r1, r0
	add r0, r6, r5
	bl sub_0201A514
	add r5, r5, #1
_02018EB8:
	cmp r5, r8
	blo _02018EA0
_02018EC0:
	mov r0, #0
_02018EC4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02018ECC: .word 0x0380FFF4
	arm_func_end sub_02018DC0

	arm_func_start sub_02018ED0
sub_02018ED0: ; 0x02018ED0
	stmdb sp!, {r3, lr}
	cmp r0, #0xa
	blo _02018EE4
	cmp r0, #0x3e8
	bls _02018EEC
_02018EE4:
	mov r0, #5
	b _02018F18
_02018EEC:
	ldr r3, _02018F20 ; =0x0380FFF4
	ldr r2, _02018F24 ; =0x0480808C
	ldr r1, [r3]
	add r1, r1, #0x300
	strh r0, [r1, #0xb2]
	strh r0, [r2]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x38]
	bl sub_02019620
	mov r0, #0
_02018F18:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02018F20: .word 0x0380FFF4
_02018F24: .word 0x0480808C
	arm_func_end sub_02018ED0

	arm_func_start sub_02018F28
sub_02018F28: ; 0x02018F28
	cmp r0, #1
	blo _02018F38
	cmp r0, #0xff
	bls _02018F40
_02018F38:
	mov r0, #5
	bx lr
_02018F40:
	ldr r1, _02018F64 ; =0x0380FFF4
	ldr r2, _02018F68 ; =0x0480808E
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xb8]
	strh r0, [r2]
	mov r0, #0
	strh r0, [r2, #-6]
	bx lr
	.align 2, 0
_02018F64: .word 0x0380FFF4
_02018F68: .word 0x0480808E
	arm_func_end sub_02018F28
_02018F6C:
	.byte 0x01, 0x00, 0x50, 0xE3
	.byte 0x01, 0x00, 0x00, 0x3A, 0xFF, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x9A, 0x05, 0x00, 0xA0, 0xE3
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x10, 0x10, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5, 0x03, 0x1C, 0x81, 0xE2
	.byte 0xB4, 0x0B, 0xC1, 0xE1, 0x00, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03

	arm_func_start sub_02018FA0
sub_02018FA0: ; 0x02018FA0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r2, sp, #2
	mov r0, #0x36
	mov r1, #6
	bl sub_02024600
	add r2, sp, #0
	mov r0, #0x3c
	mov r1, #2
	bl sub_02024600
	add r0, sp, #2
	bl sub_0201864C
	mov r0, #7
	bl sub_020186AC
	ldrh r1, [sp]
	ldr r0, _020190D4 ; =0x00007FFE
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020186E0
	mov r0, #2
	bl sub_02018720
	mov r0, #0
	bl sub_020187A0
	mov r0, #0
	bl sub_020187D4
	mov r0, #0
	bl sub_02018874
	ldr r0, _020190D8 ; =0x027F7300
	bl sub_02018898
	mov r0, #0x1f4
	bl sub_02018ED0
	mov r0, #0
	bl sub_020188F8
	mov r0, #0
	bl sub_02018930
	mov r0, #0x10
	bl sub_02018968
	ldr r0, _020190DC ; =0x0000FFFF
	mov r1, #0
	bl sub_020189A0
	ldr r0, _020190E0 ; =0x027F72A0
	bl sub_02018A50
	mov r0, #1
	bl sub_02018A80
	mov r0, #0
	bl sub_02018B28
	ldr r0, _020190E4 ; =0x027F729C
	bl sub_0201937C
	mov r0, #0
	mov r1, #0x1f
	bl sub_02018B4C
	mov r0, #5
	bl sub_02019620
	mov r0, #0
	mov r1, r0
	bl sub_02018BF8
	mov r0, #0
	bl sub_02018B90
	mov r0, #0
	bl sub_02018CCC
	mov r0, #0
	bl sub_02018D0C
	ldr r1, _020190E8 ; =0x04808044
	ldrh r2, [r1]
	ldrh r0, [r1]
	ldrh r1, [r1]
	add r0, r2, r0, lsl #8
	bl sub_0201A55C
	ldr r0, _020190EC ; =0x0380FFF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r1, [r0, #0x58]
	add sp, sp, #8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020190D4: .word 0x00007FFE
_020190D8: .word 0x027F7300
_020190DC: .word 0x0000FFFF
_020190E0: .word 0x027F72A0
_020190E4: .word 0x027F729C
_020190E8: .word 0x04808044
_020190EC: .word 0x0380FFF4
	arm_func_end sub_02018FA0

	arm_func_start sub_020190F0
sub_020190F0: ; 0x020190F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r0, _0201936C ; =0x0380FFF4
	cmp r1, #0
	ldr r0, [r0]
	ldrne sb, _02019370 ; =0x027F4E70
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2c]
	ldreq sb, _02019374 ; =sub_027F4E10
	mov r2, #1
	tst r0, r2, lsl sl
	moveq r0, #5
	beq _02019360
	ldr r1, _02019378 ; =0x04808040
	add r0, r2, #0x8000
	ldrh r6, [r1]
	strh r0, [r1]
	sub r3, r1, #4
	add r1, r1, #0x1d4
_02019140:
	ldrh r2, [r3]
	ldrh r0, [r1]
	mov r2, r2, asr #8
	cmp r2, #2
	bne _02019140
	cmp r0, #0
	cmpne r0, #9
	bne _02019140
	ldr r5, _0201936C ; =0x0380FFF4
	ldr r0, [r5]
	add r0, r0, #0x300
	strh sl, [r0, #0xbe]
	ldr r0, [r5]
	add r0, r0, #0x500
	ldrh r1, [r0, #0xf8]
	cmp r1, #2
	beq _02019194
	cmp r1, #3
	beq _02019264
	cmp r1, #5
	bne _0201934C
_02019194:
	sub r4, sl, #1
	mov r0, #6
	mul r5, r4, r0
	mov r0, #0
	str r0, [sp, #4]
	add r2, sp, #4
	add r0, r5, #0xf2
	mov r1, #3
	mov lr, pc
	bx sb
_020191BC:
	.byte 0x04, 0x00, 0x9D, 0xE5
	.byte 0x12, 0x03, 0x00, 0xEB, 0x04, 0x20, 0x8D, 0xE2, 0xF5, 0x00, 0x85, 0xE2, 0x03, 0x10, 0xA0, 0xE3
	.byte 0x0F, 0xE0, 0xA0, 0xE1, 0x19, 0xFF, 0x2F, 0xE1, 0x04, 0x00, 0x9D, 0xE5, 0x0B, 0x03, 0x00, 0xEB
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x80, 0x01, 0x9F, 0xE5, 0x04, 0x10, 0x8D, 0xE5, 0x00, 0x00, 0x90, 0xE5
	.byte 0x04, 0x06, 0x90, 0xE5, 0x01, 0x08, 0x10, 0xE3, 0x0F, 0x00, 0x00, 0x0A, 0x02, 0x09, 0x10, 0xE3
	.byte 0x51, 0x00, 0x00, 0x1A, 0x04, 0x20, 0x8D, 0xE2, 0x55, 0x0F, 0x84, 0xE2, 0x01, 0x10, 0xA0, 0xE3
	.byte 0x0F, 0xE0, 0xA0, 0xE1, 0x19, 0xFF, 0x2F, 0xE1, 0x4C, 0x11, 0x9F, 0xE5, 0x04, 0x00, 0x9D, 0xE5
	.byte 0x00, 0x10, 0x91, 0xE5, 0x80, 0x0D, 0xA0, 0xE1, 0x04, 0x16, 0x91, 0xE5, 0xA0, 0x08, 0x81, 0xE1
	.byte 0x04, 0x00, 0x8D, 0xE5, 0xF5, 0x02, 0x00, 0xEB, 0x43, 0x00, 0x00, 0xEA, 0x46, 0x00, 0x84, 0xE2
	.byte 0x04, 0x20, 0x8D, 0xE2, 0x01, 0x0C, 0x80, 0xE2, 0x01, 0x10, 0xA0, 0xE3, 0x0F, 0xE0, 0xA0, 0xE1
	.byte 0x19, 0xFF, 0x2F, 0xE1, 0x04, 0x10, 0x9D, 0xE5, 0x1E, 0x00, 0xA0, 0xE3, 0xDF, 0x02, 0x00, 0xEB
	.byte 0x39, 0x00, 0x00, 0xEA
_02019264:
	ldrh r0, [r0, #0xfc]
	mov r8, #0
	add r7, r0, #0xcf
	mov r4, r8
	mov fp, #1
	b _020192C0
_0201927C:
	mov r0, r7
	mov r1, fp
	add r2, sp, #0
	str r4, [sp, #4]
	str r4, [sp]
	mov lr, pc
	bx sb
_02019298:
	.byte 0x0A, 0x00, 0x87, 0xE0, 0x01, 0x10, 0xA0, 0xE3
	.byte 0x04, 0x20, 0x8D, 0xE2, 0x0F, 0xE0, 0xA0, 0xE1, 0x19, 0xFF, 0x2F, 0xE1, 0x00, 0x00, 0x9D, 0xE5
	.byte 0x04, 0x10, 0x9D, 0xE5, 0xC9, 0x02, 0x00, 0xEB, 0x0F, 0x70, 0x87, 0xE2, 0x01, 0x80, 0x88, 0xE2
_020192C0:
	ldr r0, [r5]
	add r0, r0, #0x600
	ldrh r0, [r0]
	cmp r8, r0
	blo _0201927C
	mov r8, #0
	ldr r4, _0201936C ; =0x0380FFF4
	mov r5, r8
	mov fp, #1
	b _02019338
_020192E8:
	str r5, [sp, #4]
	mov r0, r7
	mov r1, fp
	add r2, sp, #4
	mov lr, pc
	bx sb
_02019300:
	.byte 0x04, 0x10, 0x9D, 0xE5, 0x0A, 0x00, 0x87, 0xE0, 0x01, 0x14, 0xA0, 0xE1, 0x04, 0x10, 0x8D, 0xE5
	.byte 0x01, 0x10, 0xA0, 0xE3, 0x04, 0x20, 0x8D, 0xE2, 0x0F, 0xE0, 0xA0, 0xE1, 0x19, 0xFF, 0x2F, 0xE1
	.byte 0x04, 0x00, 0x9D, 0xE5, 0x05, 0x08, 0x80, 0xE3, 0x04, 0x00, 0x8D, 0xE5, 0xB7, 0x02, 0x00, 0xEB
	.byte 0x0F, 0x70, 0x87, 0xE2, 0x01, 0x80, 0x88, 0xE2
_02019338:
	ldr r0, [r4]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xfe]
	cmp r8, r0
	blo _020192E8
_0201934C:
	ldr r1, _02019378 ; =0x04808040
	mov r0, #3
	strh r6, [r1]
	strh r0, [r1, #8]
	mov r0, #0
_02019360:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201936C: .word 0x0380FFF4
_02019370: .word 0x027F4E70
_02019374: .word sub_027F4E10
_02019378: .word 0x04808040
	arm_func_end sub_020190F0

	arm_func_start sub_0201937C
sub_0201937C: ; 0x0201937C
	stmdb sp!, {r3, lr}
	ldr r1, _020193B8 ; =0x0380FFF4
	ldrh r2, [r0]
	ldr r3, [r1]
	add r1, r3, #0x300
	strh r2, [r1, #0xa4]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	add r2, r3, #0x3a4
	orr r0, r1, r0
	strh r0, [r2, #2]
	bl sub_020193BC
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020193B8: .word 0x0380FFF4
	arm_func_end sub_0201937C

	arm_func_start sub_020193BC
sub_020193BC: ; 0x020193BC
	stmdb sp!, {r3, lr}
	ldr r0, _02019430 ; =0x0000E2E2
	add r2, sp, #0
	str r0, [sp]
	mov r0, #0x58
	mov r1, #2
	bl sub_02024600
	ldr r0, [sp]
	add r0, r0, #2
	add r0, r0, #0x200
	str r0, [sp]
	bl sub_02019D68
	cmp r0, #0x14
	bne _0201941C
	ldr r1, [sp]
	ldr r0, _02019434 ; =0x048080BC
	sub r1, r1, #0x61
	sub r1, r1, #0x6100
	str r1, [sp]
	ldrh r0, [r0]
	tst r0, #2
	subne r0, r1, #0x60
	subne r0, r0, #0x6000
	strne r0, [sp]
_0201941C:
	ldr r1, [sp]
	ldr r0, _02019438 ; =0x04808140
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02019430: .word 0x0000E2E2
_02019434: .word 0x048080BC
_02019438: .word 0x04808140
	arm_func_end sub_020193BC

	arm_func_start sub_0201943C
sub_0201943C: ; 0x0201943C
	stmdb sp!, {r3, lr}
	ldr r1, _0201949C ; =0x0380FFF4
	cmp r0, #0
	ldr r2, [r1]
	add r1, r2, #0x300
	add r3, r2, #0x31c
	strh r0, [r1, #0x52]
	ldrneh r0, [r3, #0x12]
	cmpne r0, #1
	ldrne r1, _020194A0 ; =0x04808006
	ldrneh r0, [r1]
	orrne r0, r0, #0x40
	strneh r0, [r1]
	bne _02019490
	ldr r2, _020194A0 ; =0x04808006
	mov r1, #0
	ldrh r0, [r2]
	bic r0, r0, #0x40
	strh r0, [r2]
	ldrh r0, [r3, #0x20]
	bl sub_020189A0
_02019490:
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201949C: .word 0x0380FFF4
_020194A0: .word 0x04808006
	arm_func_end sub_0201943C

	arm_func_start sub_020194A4
sub_020194A4: ; 0x020194A4
	ldr r1, _020194C8 ; =0x0380FFF4
	ldr r2, _020194CC ; =0x0480803C
	ldr r1, [r1]
	mov r3, r0, lsr #1
	add r1, r1, #0x300
	strh r3, [r1, #0x54]
	strh r0, [r2]
	mov r0, #0
	bx lr
	.align 2, 0
_020194C8: .word 0x0380FFF4
_020194CC: .word 0x0480803C
	arm_func_end sub_020194A4

	arm_func_start sub_020194D0
sub_020194D0: ; 0x020194D0
	ldr r1, _020194E0 ; =0x04808040
	strh r0, [r1]
	mov r0, #0
	bx lr
	.align 2, 0
_020194E0: .word 0x04808040
	arm_func_end sub_020194D0

	arm_func_start sub_020194E4
sub_020194E4: ; 0x020194E4
	stmdb sp!, {r3, lr}
	ldr r0, _0201954C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	cmp r0, #2
	bne _02019508
	ldr r0, _02019550 ; =0x0000C008
	bl sub_02019E10
_02019508:
	ldr r1, _02019554 ; =0x0000601E
	ldr r0, _02019558 ; =0x04808158
	strh r1, [r0]
	bl sub_0302AC10
	ldr r1, _0201955C ; =0x0480815C
	mov r0, #0x1e
	ldrh r1, [r1]
	orr r1, r1, #0x3f
	bl sub_02019DE0
	ldr r2, _02019560 ; =0x0000800D
	ldr r1, _02019564 ; =0x04808168
	ldr r0, _02019568 ; =0x04808036
	strh r2, [r1]
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201954C: .word 0x0380FFF4
_02019550: .word 0x0000C008
_02019554: .word 0x0000601E
_02019558: .word 0x04808158
_0201955C: .word 0x0480815C
_02019560: .word 0x0000800D
_02019564: .word 0x04808168
_02019568: .word 0x04808036
	arm_func_end sub_020194E4

	arm_func_start sub_0201956C
sub_0201956C: ; 0x0201956C
	stmdb sp!, {r4, lr}
	ldr r2, _02019604 ; =0x04808036
	mov r3, #0
	ldr r1, _02019608 ; =0x027EA99C
	mov r0, #0x1f40
	strh r3, [r2]
	bl sub_0302AB1C
	ldr r1, _0201960C ; =0x04808168
	mov r2, #0
	ldr r0, _02019610 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	cmp r0, #2
	beq _020195B8
	cmp r0, #3
	beq _020195F8
	b _020195FC
_020195B8:
	ldr r0, _02019614 ; =0x00006001
	strh r0, [r1, #-0x10]
	bl sub_0302AC10
	ldr r1, _02019618 ; =0x0480815C
	mov r0, #1
	ldrh r4, [r1]
	and r1, r4, #0x7f
	bl sub_02019DE0
	mov r1, r4
	mov r0, #1
	bl sub_02019DE0
	ldr r0, _0201961C ; =0x00009C40
	ldr r1, _02019608 ; =0x027EA99C
	bl sub_0302AB1C
	bl sub_02019FB0
	b _020195FC
_020195F8:
	bl sub_02019FB0
_020195FC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02019604: .word 0x04808036
_02019608: .word 0x027EA99C
_0201960C: .word 0x04808168
_02019610: .word 0x0380FFF4
_02019614: .word 0x00006001
_02019618: .word 0x0480815C
_0201961C: .word 0x00009C40
	arm_func_end sub_0201956C

	arm_func_start sub_02019620
sub_02019620: ; 0x02019620
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0201967C ; =0x0380FFF4
	ldr r1, _02019680 ; =0x0000FFFF
	ldr r2, [r2]
	mov r6, r0
	add r5, r2, #0x31c
	cmp r6, r1
	streqh r1, [r5, #0x1c]
	add r4, r2, #0x344
	streqh r1, [r4, #0x8c]
	beq _02019670
	ldrh r0, [r4, #0x6e]
	mov r1, #0x64
	mul r0, r6, r0
	bl sub_030365C4
	cmp r0, #0x10000
	movhi r0, #5
	bhi _02019674
	strh r6, [r5, #0x1c]
	strh r0, [r4, #0x8c]
_02019670:
	mov r0, #0
_02019674:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201967C: .word 0x0380FFF4
_02019680: .word 0x0000FFFF
	arm_func_end sub_02019620

	arm_func_start sub_02019684
sub_02019684: ; 0x02019684
	ldr r1, _020196C8 ; =0x0380FFF4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x300
	strh r2, [r0, #0xea]
	ldr r0, [r1]
	add r0, r0, #0x400
	ldrh r0, [r0, #0x68]
	cmp r0, #0
	bxne lr
	ldr r2, _020196CC ; =0x04808038
	mov r0, #0
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	strh r0, [r2, #0x10]
	bx lr
	.align 2, 0
_020196C8: .word 0x0380FFF4
_020196CC: .word 0x04808038
	arm_func_end sub_02019684

	arm_func_start sub_020196D0
sub_020196D0: ; 0x020196D0
	ldr r0, _020196F8 ; =0x0380FFF4
	ldr r1, _020196FC ; =0x04808038
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x300
	strh r2, [r0, #0xea]
	ldrh r0, [r1]
	orr r0, r0, #2
	strh r0, [r1]
	bx lr
	.align 2, 0
_020196F8: .word 0x0380FFF4
_020196FC: .word 0x04808038
	arm_func_end sub_020196D0

	arm_func_start sub_02019700
sub_02019700: ; 0x02019700
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02019740 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	cmp r5, #0x80
	add r4, r0, #0x344
	movhi r0, #4
	bhi _02019738
	mov r0, r1
	ldr r1, [r4, #0x9c]
	add r2, r5, #1
	bl sub_0302D78C
	strh r5, [r4, #0xa0]
	mov r0, #0
_02019738:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02019740: .word 0x0380FFF4
	arm_func_end sub_02019700

	arm_func_start sub_02019744
sub_02019744: ; 0x02019744
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _020197EC ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r2]
	mov r8, r1
	cmp r4, #0x80
	add r5, r0, #0x344
	movhi r0, #4
	bhi _020197E4
	cmp r4, #0
	beq _020197D4
	ldrh r0, [r5, #0xa2]
	tst r0, #1
	beq _020197C4
	ldr r6, [r5, #0x9c]
	mov r1, #0xff
	mov r0, r6
	bl sub_0201A514
	add r6, r6, #1
	mov r7, #0
	b _020197B8
_02019798:
	mov r0, r8
	bl sub_0201A540
	mov r1, r0
	mov r0, r6
	bl sub_0201A514
	add r6, r6, #1
	add r8, r8, #1
	add r7, r7, #1
_020197B8:
	cmp r7, r4
	blo _02019798
	b _020197D4
_020197C4:
	ldr r1, [r5, #0x9c]
	mov r0, r8
	add r2, r4, #1
	bl sub_0302D78C
_020197D4:
	strh r4, [r5, #0xa0]
	mov r0, #1
	strh r0, [r5, #0xa4]
	mov r0, #0
_020197E4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020197EC: .word 0x0380FFF4
	arm_func_end sub_02019744

	arm_func_start sub_020197F0
sub_020197F0: ; 0x020197F0
	ldr r3, _02019824 ; =0x0380FFF4
	ldr r2, _02019828 ; =0x0480802A
	ldr r1, [r3]
	add r1, r1, #0x300
	strh r0, [r1, #0xae]
	strh r0, [r2]
	ldr r1, [r3]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x3a]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	strneh r0, [r2, #-2]
	bx lr
	.align 2, 0
_02019824: .word 0x0380FFF4
_02019828: .word 0x0480802A
	arm_func_end sub_020197F0

	arm_func_start sub_0201982C
sub_0201982C: ; 0x0201982C
	stmdb sp!, {r4, lr}
	ldr r1, _02019880 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	add r4, r1, #0x344
	strh r0, [r4, #0x6a]
	bl sub_0302ABA4
	ldr r0, _02019884 ; =0x0480802A
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r4, #0x88]
	cmp r0, #0
	beq _02019878
	bl sub_02020550
	ldrh r0, [r4, #0x88]
	mov r1, #0x20
	bl sub_0201B434
	mov r0, #0
	strh r0, [r4, #0x88]
_02019878:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02019880: .word 0x0380FFF4
_02019884: .word 0x0480802A
	arm_func_end sub_0201982C
_02019888:
	.byte 0x14, 0x00, 0x9F, 0xE5, 0x14, 0x10, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBE, 0x0A, 0xD0, 0xE1, 0xB0, 0x00, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x28, 0x80, 0x80, 0x04

	arm_func_start sub_020198AC
sub_020198AC: ; 0x020198AC
	stmdb sp!, {r3, lr}
	ldr r0, _020198CC ; =0x04808094
	ldrh r0, [r0]
	tst r0, #0x8000
	bne _020198C4
	bl sub_0302ABA4
_020198C4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020198CC: .word 0x04808094
	arm_func_end sub_020198AC

	arm_func_start sub_020198D0
sub_020198D0: ; 0x020198D0
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	bx lr
	arm_func_end sub_020198D0

	arm_func_start sub_020198EC
sub_020198EC: ; 0x020198EC
	ldrh r3, [r1]
	strh r3, [r0]
	ldrh r3, [r1, #2]
	strh r3, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldrh r1, [r2]
	strh r1, [r0, #6]
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_020198EC

	arm_func_start sub_02019920
sub_02019920: ; 0x02019920
	ldrh ip, [r1]
	strh ip, [r0]
	ldrh ip, [r1, #2]
	strh ip, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldrh r1, [r2]
	strh r1, [r0, #6]
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
	ldrh r1, [r3]
	strh r1, [r0, #0xc]
	ldrh r1, [r3, #2]
	strh r1, [r0, #0xe]
	ldrh r1, [r3, #4]
	strh r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02019920

	arm_func_start sub_0201996C
sub_0201996C: ; 0x0201996C
	stmdb sp!, {r3, lr}
	bl sub_0201999C
	ldr r1, _02019998 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0xb4
	add r1, r1, #0x13c
	add r1, r1, #0x400
	bl sub_0302D7C0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02019998: .word 0x0380FFF4
	arm_func_end sub_0201996C

	arm_func_start sub_0201999C
sub_0201999C: ; 0x0201999C
	ldr r1, _02019B8C ; =0x0380FFF4
	ldr r0, _02019B90 ; =0x048081B0
	ldr r1, [r1]
	ldrh r2, [r0]
	ldr r3, [r1, #0x58c]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x58c]
	ldrh ip, [r0, #2]
	ldr r3, [r1, #0x588]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x588]
	ldr r3, [r1, #0x598]
	add r2, r3, r2
	str r2, [r1, #0x598]
	ldrh ip, [r0, #4]
	ldr r3, [r1, #0x594]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x594]
	ldr r3, [r1, #0x590]
	add r2, r3, r2
	str r2, [r1, #0x590]
	ldrh ip, [r0, #6]
	ldr r3, [r1, #0x59c]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x59c]
	ldr r3, [r1, #0x574]
	add r2, r3, r2
	str r2, [r1, #0x574]
	ldrh r2, [r0, #8]
	ldr r3, [r1, #0x584]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x584]
	ldrh r2, [r0, #0xa]
	ldr r3, [r1, #0x55c]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x55c]
	ldrh ip, [r0, #0xc]
	ldr r3, [r1, #0x56c]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x56c]
	ldr r3, [r1, #0x580]
	add r2, r3, r2
	str r2, [r1, #0x580]
	ldrh ip, [r0, #0xe]
	ldr r3, [r1, #0x578]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x578]
	ldr r2, [r1, #0x57c]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x57c]
	ldrh r2, [r0, #0x10]
	ldr r3, [r1, #0x548]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x548]
	ldrh r3, [r0, #0x20]
	ldr r2, [r1, #0x5b4]
	add r2, r2, r3, asr #8
	str r2, [r1, #0x5b4]
	ldrh ip, [r0, #0x22]
	ldr r3, [r1, #0x5b8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5b8]
	ldr r2, [r1, #0x5bc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5bc]
	ldrh ip, [r0, #0x24]
	ldr r3, [r1, #0x5c0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5c0]
	ldr r2, [r1, #0x5c4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5c4]
	ldrh ip, [r0, #0x26]
	ldr r3, [r1, #0x5c8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5c8]
	ldr r2, [r1, #0x5cc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5cc]
	ldrh ip, [r0, #0x28]
	ldr r3, [r1, #0x5d0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5d0]
	ldr r2, [r1, #0x5d4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5d4]
	ldrh ip, [r0, #0x2a]
	ldr r3, [r1, #0x5d8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5d8]
	ldr r2, [r1, #0x5dc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5dc]
	ldrh ip, [r0, #0x2c]
	ldr r3, [r1, #0x5e0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5e0]
	ldr r2, [r1, #0x5e4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5e4]
	ldrh r3, [r0, #0x2e]
	ldr r2, [r1, #0x5e8]
	and r0, r3, #0xff
	add r0, r2, r0
	str r0, [r1, #0x5e8]
	ldr r0, [r1, #0x5ec]
	add r0, r0, r3, asr #8
	str r0, [r1, #0x5ec]
	bx lr
	.align 2, 0
_02019B8C: .word 0x0380FFF4
_02019B90: .word 0x048081B0
	arm_func_end sub_0201999C

	arm_func_start sub_02019B94
sub_02019B94: ; 0x02019B94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _02019C60 ; =0x0380FFF4
	mov sb, r0
	ldr r0, [r2]
	mov r8, r1
	cmp sb, #0x20
	add r2, r0, #0x344
	movhi r0, #0
	bhi _02019C58
	ldrh r1, [r2, #0x1e]
	cmp r1, #0
	moveq r0, #1
	beq _02019C58
	add r0, r0, #0x400
	ldrh r0, [r0, #4]
	cmp r0, #0x13
	bne _02019BEC
	cmp sb, r1
	movlo r0, #0
	blo _02019C58
	mov sb, r1
	b _02019BF8
_02019BEC:
	cmp sb, r1
	movne r0, #0
	bne _02019C58
_02019BF8:
	add r5, r2, #0x20
	add r6, r2, #0x40
	mov r7, #0
	b _02019C4C
_02019C08:
	mov r0, r6
	bl sub_0201A540
	mov r4, r0
	mov r0, r8
	add r6, r6, #1
	bl sub_0201A540
	mov sl, r0
	mov r0, r5
	add r8, r8, #1
	bl sub_0201A540
	orr r1, sl, r4
	orr r0, r0, r4
	cmp r1, r0
	add r5, r5, #1
	movne r0, #0
	bne _02019C58
	add r7, r7, #1
_02019C4C:
	cmp r7, sb
	blo _02019C08
	mov r0, #1
_02019C58:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02019C60: .word 0x0380FFF4
	arm_func_end sub_02019B94

	arm_func_start sub_02019C64
sub_02019C64: ; 0x02019C64
	ldrh r3, [r0, #4]
	ldrh r2, [r1, #4]
	cmp r3, r2
	ldreqh r3, [r0, #2]
	ldreqh r2, [r1, #2]
	cmpeq r3, r2
	ldreqh r2, [r0]
	ldreqh r0, [r1]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_02019C64

	arm_func_start sub_02019C94
sub_02019C94: ; 0x02019C94
	ldr r1, _02019CB0 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2c]
	and r0, r1, r2, lsl r0
	bx lr
	.align 2, 0
_02019CB0: .word 0x0380FFF4
	arm_func_end sub_02019C94

	arm_func_start sub_02019CB4
sub_02019CB4: ; 0x02019CB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r1, #0
	mov r4, r0
	strh r1, [sb]
	add r0, r4, #1
	strh r1, [sb, #2]
	bl sub_0201A540
	add r6, r4, #2
	ldr r5, _02019D64 ; =0x027F73B4
	mov r8, r0
	mov r7, #0
	mov r4, #1
	b _02019D54
_02019CEC:
	add r0, r6, r7
	bl sub_0201A540
	and r1, r0, #0x7f
	sub r1, r1, #1
	cmp r1, #0x78
	bhs _02019D34
	mov r1, r1, lsl #1
	ldrh r2, [r5, r1]
	cmp r2, #0xff
	beq _02019D34
	ldrh r1, [sb, #2]
	tst r0, #0x80
	orr r0, r1, r4, lsl r2
	strh r0, [sb, #2]
	ldrneh r0, [sb]
	orrne r0, r0, r4, lsl r2
	strneh r0, [sb]
	b _02019D50
_02019D34:
	ldrh r1, [sb, #2]
	tst r0, #0x80
	orr r0, r1, #0x8000
	strh r0, [sb, #2]
	ldrneh r0, [sb]
	orrne r0, r0, #0x8000
	strneh r0, [sb]
_02019D50:
	add r7, r7, #1
_02019D54:
	cmp r7, r8
	blo _02019CEC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02019D64: .word 0x027F73B4
	arm_func_end sub_02019CB4

	arm_func_start sub_02019D68
sub_02019D68: ; 0x02019D68
	ldr r0, _02019DB0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x30]
	cmp r1, #0
	beq _02019D8C
	cmp r1, #1
	beq _02019DA0
	b _02019DA8
_02019D8C:
	ldrh r0, [r0, #0xa4]
	tst r0, #1
	beq _02019DA8
	mov r0, #0xa
	bx lr
_02019DA0:
	mov r0, #0xa
	bx lr
_02019DA8:
	mov r0, #0x14
	bx lr
	.align 2, 0
_02019DB0: .word 0x0380FFF4
	arm_func_end sub_02019D68

	arm_func_start sub_02019DB4
sub_02019DB4: ; 0x02019DB4
	stmdb sp!, {r3, lr}
	ldr r1, _02019DD8 ; =0x04808158
	orr r0, r0, #0x6000
	strh r0, [r1]
	bl sub_0302AC10
	ldr r0, _02019DDC ; =0x0480815C
	ldrh r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02019DD8: .word 0x04808158
_02019DDC: .word 0x0480815C
	arm_func_end sub_02019DB4

	arm_func_start sub_02019DE0
sub_02019DE0: ; 0x02019DE0
	stmdb sp!, {r3, lr}
	ldr r2, _02019E0C ; =0x0480815A
	orr r0, r0, #0x5000
	strh r1, [r2]
	strh r0, [r2, #-2]
	bl sub_0302AC10
	cmp r0, #0
	mvnne r0, #0
	moveq r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02019E0C: .word 0x0480815A
	arm_func_end sub_02019DE0

	arm_func_start sub_02019E10
sub_02019E10: ; 0x02019E10
	ldr r2, _02019E28 ; =0x0480817E
	ldr ip, _02019E2C ; =sub_037FB454
	strh r0, [r2]
	mov r1, r0, lsr #0x10
	strh r1, [r2, #-2]
	bx ip
	.align 2, 0
_02019E28: .word 0x0480817E
_02019E2C: .word sub_037FB454
	arm_func_end sub_02019E10

	arm_func_start sub_02019E30
sub_02019E30: ; 0x02019E30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, #0
	str r8, [sp]
	mov r7, r8
	mov r6, #0x64
	add r4, sp, #0
	mov r5, #1
_02019E50:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02024600
	cmp r7, #1
	ldreq r0, [sp]
	mov r1, r8
	andeq r0, r0, #0x80
	streq r0, [sp]
	ldr r0, [sp]
	and r0, r0, #0xff
	bl sub_0201A5D8
	add r7, r7, #1
	mov r8, r0
	cmp r7, #0x69
	add r6, r6, #1
	blo _02019E50
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_02019E30

	arm_func_start sub_02019EA0
sub_02019EA0: ; 0x02019EA0
	stmdb sp!, {r4, lr}
	ldr r1, _02019F0C ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x1f8
	add r4, r1, #0x400
	mov r1, r4
	bl sub_0302D764
	mov r2, r4
	mov r0, #0x40
	mov r1, #1
	bl sub_02024600
	add r2, r4, #2
	mov r0, #0x41
	mov r1, #1
	bl sub_02024600
	add r2, r4, #4
	mov r0, #0x42
	mov r1, #1
	bl sub_02024600
	add r2, r4, #6
	mov r0, #0x43
	mov r1, #1
	bl sub_02024600
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02019F0C: .word 0x0380FFF4
	arm_func_end sub_02019EA0

	arm_func_start sub_02019F10
sub_02019F10: ; 0x02019F10
	ldr r2, _02019F44 ; =0x027F7350
	mov r3, #0
_02019F18:
	mov r0, r3, lsl #2
	ldrh r0, [r2, r0]
	add r1, r2, r3, lsl #2
	add r0, r0, #0x4800000
	add r3, r3, #1
	ldrh r1, [r1, #2]
	add r0, r0, #0x8000
	strh r1, [r0]
	cmp r3, #0x19
	blo _02019F18
	bx lr
	.align 2, 0
_02019F44: .word 0x027F7350
	arm_func_end sub_02019F10

	arm_func_start sub_02019F48
sub_02019F48: ; 0x02019F48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02019FAC ; =0x04808160
	mov r1, #0x100
	strh r1, [r0]
	mov r6, #0
	str r6, [sp]
	mov r7, #0x64
	add r4, sp, #0
	mov r5, #1
_02019F6C:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_02024600
	ldr r1, [sp]
	mov r0, r6
	bl sub_02019DE0
	add r6, r6, #1
	cmp r6, #0x69
	add r7, r7, #1
	blo _02019F6C
	mov r0, #0x5a
	mov r1, #2
	bl sub_02019DE0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02019FAC: .word 0x04808160
	arm_func_end sub_02019F48

	arm_func_start sub_02019FB0
sub_02019FB0: ; 0x02019FB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r0, _0201A12C ; =0x0380FFF4
	ldr r5, _0201A130 ; =0x027F72E0
	ldr r0, [r0]
	mov r8, #0
	add r0, r0, #0x1f8
	str r8, [sp]
	add r4, r0, #0x400
	add r6, sp, #0
	mov r7, #2
_02019FDC:
	mov r0, r8, lsl #1
	mov r1, r7
	mov r2, r6
	add r0, r0, #0x44
	bl sub_02024600
	mov r0, r8, lsl #1
	ldrh r0, [r5, r0]
	add r8, r8, #1
	add r0, r0, #0x4800000
	ldr r1, [sp]
	add r0, r0, #0x8000
	strh r1, [r0]
	cmp r8, #0x10
	blo _02019FDC
	ldrh r1, [r4, #2]
	ldr r0, _0201A134 ; =0x04808184
	mov r2, r1, lsr #7
	mov r1, r2, lsl #8
	str r1, [sp, #4]
	ldrh r1, [r4, #2]
	mov r7, #0xce
	and r1, r1, #0x7f
	orr r1, r1, r2, lsl #8
	str r1, [sp, #4]
	strh r1, [r0]
	ldrh r0, [r4, #2]
	ldrh r1, [r4]
	and r0, r0, #0x7f
	add r2, r0, #7
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	ldrh r8, [r4, #4]
	cmp r1, #3
	mov r6, r0, asr #3
	bne _0201A0CC
	add r0, r8, #0xce
	add r2, r4, #8
	mov r1, #1
	bl sub_02024600
	mov sb, #0
	add r4, sp, #4
	mov r6, sb
	mov r5, #1
	b _0201A0C0
_0201A08C:
	str r6, [sp, #4]
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_02024600
	mov r0, sb, lsl #8
	ldr r1, [sp, #4]
	add r0, r0, #0x50000
	orr r0, r1, r0
	str r0, [sp, #4]
	bl sub_02019E10
	add sb, sb, #1
	add r7, r7, #1
_0201A0C0:
	cmp sb, r8
	blo _0201A08C
	b _0201A120
_0201A0CC:
	mov r0, #0
	str r0, [sp, #4]
	add r5, sp, #4
	b _0201A118
_0201A0DC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_02024600
	ldr r0, [sp, #4]
	bl sub_02019E10
	ldrh r0, [r4]
	sub r8, r8, #1
	cmp r0, #2
	ldreq r1, [sp, #4]
	add r7, r7, r6
	moveq r0, r1, lsr #0x12
	cmpeq r0, #9
	biceq r0, r1, #0x7c00
	streq r0, [r4, #0xc]
_0201A118:
	cmp r8, #0
	bne _0201A0DC
_0201A120:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0201A12C: .word 0x0380FFF4
_0201A130: .word 0x027F72E0
_0201A134: .word 0x04808184
	arm_func_end sub_02019FB0

	arm_func_start sub_0201A138
sub_0201A138: ; 0x0201A138
	stmdb sp!, {r4, lr}
	ldr r0, _0201A188 ; =0x0380FFF4
	ldr r4, [r0]
	bl sub_0302CB80
	cmp r0, #0
	addeq r0, r4, #0x300
	ldreqh r1, [r0, #0x3e]
	orreq r1, r1, #0x40
	streqh r1, [r0, #0x3e]
	beq _0201A180
	add r0, r4, #0x208
	add r0, r0, #0x400
	bl sub_0302CB90
	add r0, r4, #0x234
	add r0, r0, #0x400
	bl sub_0302CB90
	add r0, r4, #0x660
	bl sub_0302CB90
_0201A180:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201A188: .word 0x0380FFF4
	arm_func_end sub_0201A138
_0201A18C:
	.byte 0x00, 0x10, 0xA0, 0xE3
	.byte 0x00, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0x04, 0xC0, 0x9F, 0xE5, 0x04, 0x10, 0x9F, 0xE5
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0x2C, 0xB3, 0x7F, 0x03, 0x9C, 0xA9, 0x7E, 0x02, 0x78, 0x40, 0x2D, 0xE9
	.byte 0x0C, 0xD0, 0x4D, 0xE2, 0x78, 0x20, 0x9F, 0xE5, 0x00, 0x50, 0xA0, 0xE1, 0x00, 0x00, 0x92, 0xE5
	.byte 0x01, 0x40, 0xA0, 0xE1, 0x82, 0x0F, 0x80, 0xE2, 0x01, 0x0B, 0x80, 0xE2, 0xF7, 0x4A, 0x40, 0xEB
	.byte 0x60, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x95, 0x30, 0x82, 0xE0, 0x95, 0x21, 0x22, 0xE0
	.byte 0x01, 0x50, 0xA0, 0xE1, 0x95, 0x20, 0x22, 0xE0, 0x23, 0x63, 0xA0, 0xE1, 0x02, 0x6D, 0x86, 0xE1
	.byte 0x05, 0x4A, 0x40, 0xEB, 0x00, 0x00, 0x96, 0xE0, 0x00, 0x20, 0xA1, 0xE2, 0x00, 0x10, 0xA0, 0xE1
	.byte 0x04, 0x40, 0x8D, 0xE5, 0x05, 0x00, 0xA0, 0xE1, 0x08, 0x00, 0x8D, 0xE5, 0x20, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x50, 0x8D, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x06, 0x30, 0xA0, 0xE1, 0x82, 0x0F, 0x80, 0xE2
	.byte 0x01, 0x0B, 0x80, 0xE2, 0xC4, 0x4A, 0x40, 0xEB, 0x0C, 0xD0, 0x8D, 0xE2, 0x78, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0xEA, 0x82, 0x00, 0x00, 0x10, 0x00, 0x9F, 0xE5
	.byte 0x10, 0xC0, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x82, 0x0F, 0x80, 0xE2, 0x01, 0x0B, 0x80, 0xE2
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0xC0, 0xD5, 0x7F, 0x03, 0x10, 0x40, 0x2D, 0xE9
	.byte 0x70, 0x10, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE3, 0x00, 0x40, 0x91, 0xE5, 0x0A, 0x10, 0xA0, 0xE3
	.byte 0xEC, 0x23, 0x94, 0xE5, 0x01, 0x20, 0x82, 0xE2, 0xEC, 0x23, 0x84, 0xE5, 0xC1, 0x36, 0x40, 0xEB
	.byte 0x02, 0x00, 0xA0, 0xE3, 0x12, 0x10, 0xA0, 0xE3, 0xBE, 0x36, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x11, 0x10, 0xA0, 0xE3, 0xBB, 0x36, 0x40, 0xEB, 0x01, 0x0C, 0x84, 0xE2, 0xBC, 0x0F, 0xD0, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x02, 0x00, 0x00, 0x0A, 0x02, 0x00, 0xA0, 0xE3, 0x13, 0x10, 0xA0, 0xE3
	.byte 0xB4, 0x36, 0x40, 0xEB, 0x03, 0x0C, 0x84, 0xE2, 0xB4, 0x0F, 0xD0, 0xE1, 0x00, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x00, 0x0A, 0x02, 0x00, 0xA0, 0xE3, 0x15, 0x10, 0xA0, 0xE3, 0xAD, 0x36, 0x40, 0xEB
	.byte 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03

	arm_func_start sub_0201A2DC
sub_0201A2DC: ; 0x0201A2DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0201A344 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_0302CDB0
	mov r3, #0
	ldr r0, _0201A348 ; =0x000082EA
	mov r1, r3
	umull r2, ip, r5, r0
	mla ip, r5, r3, ip
	mla ip, r1, r0, ip
	mov r1, r2, lsr #6
	str r3, [sp]
	ldr r0, _0201A344 ; =0x0380FFF4
	mov r3, r4
	ldr r0, [r0]
	mov r2, ip, lsr #6
	add r0, r0, #0x234
	add r0, r0, #0x400
	orr r1, r1, ip, lsl #26
	bl sub_0302CCCC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201A344: .word 0x0380FFF4
_0201A348: .word 0x000082EA
	arm_func_end sub_0201A2DC

	arm_func_start sub_0201A34C
sub_0201A34C: ; 0x0201A34C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0201A3C8 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_0302CDB0
	ldr r0, _0201A3CC ; =0x000082EA
	mov r3, #0
	umull ip, r2, r5, r0
	mla r2, r5, r3, r2
	mov r1, r3
	mla r2, r1, r0, r2
	mov r0, ip, lsr #6
	mov r1, r2, lsr #6
	orr r0, r0, r2, lsl #26
	mov r2, #0x3e8
	bl sub_03036370
	mov r2, r1
	mov r1, r0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0201A3C8 ; =0x0380FFF4
	mov r3, r4
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_0302CCCC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201A3C8: .word 0x0380FFF4
_0201A3CC: .word 0x000082EA
	arm_func_end sub_0201A34C

	arm_func_start sub_0201A3D0
sub_0201A3D0: ; 0x0201A3D0
	ldr r0, _0201A3E8 ; =0x0380FFF4
	ldr ip, _0201A3EC ; =sub_037FD5C0
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bx ip
	.align 2, 0
_0201A3E8: .word 0x0380FFF4
_0201A3EC: .word sub_037FD5C0
	arm_func_end sub_0201A3D0

	arm_func_start sub_0201A3F0
sub_0201A3F0: ; 0x0201A3F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0201A464 ; =0x04805F60
	add r2, r2, #1
	mov r5, r1
	bic r2, r2, #1
	add r1, r5, r2
	cmp r1, r3
	mov r6, r0
	subhi r4, r3, r5
	subhi r7, r2, r4
	movls r4, r2
	movls r7, #0
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_0302D78C
	cmp r7, #0
	beq _0201A45C
	ldr r0, _0201A468 ; =0x0380FFF4
	add r3, r5, r4
	ldr r0, [r0]
	mov r2, r7
	add r0, r0, #0x300
	ldrh r0, [r0, #0xde]
	add r1, r6, r4
	sub r0, r3, r0
	bl sub_0302D78C
_0201A45C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201A464: .word 0x04805F60
_0201A468: .word 0x0380FFF4
	arm_func_end sub_0201A3F0

	arm_func_start sub_0201A46C
sub_0201A46C: ; 0x0201A46C
	ldr ip, _0201A488 ; =sub_037FDF9C
	mov r3, r0
	add r2, r2, #1
	mov r0, r1
	mov r1, r3
	bic r2, r2, #1
	bx ip
	.align 2, 0
_0201A488: .word sub_037FDF9C
	arm_func_end sub_0201A46C

	arm_func_start sub_0201A48C
sub_0201A48C: ; 0x0201A48C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r2
	mov r0, r1
	mov r4, r3
	mov r1, r6
	mov r2, #0x24
	bl sub_0302D78C
	cmp r4, #0
	beq _0201A4C8
	add r2, r4, #1
	mov r0, r5
	add r1, r6, #0x24
	bic r2, r2, #1
	bl sub_0302D78C
_0201A4C8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0201A48C

	arm_func_start sub_0201A4D0
sub_0201A4D0: ; 0x0201A4D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r2
	mov r0, r1
	mov r4, r3
	mov r1, r6
	mov r2, #0x24
	bl sub_0302D78C
	cmp r4, #0
	beq _0201A50C
	add r2, r4, #1
	mov r0, r5
	add r1, r6, #0x28
	bic r2, r2, #1
	bl sub_0302D78C
_0201A50C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0201A4D0

	arm_func_start sub_0201A514
sub_0201A514: ; 0x0201A514
	tst r0, #1
	ldrneh r2, [r0, #-1]
	andne r2, r2, #0xff
	orrne r1, r2, r1, lsl #8
	strneh r1, [r0, #-1]
	ldreqh r2, [r0]
	andeq r1, r1, #0xff
	andeq r2, r2, #0xff00
	orreq r1, r2, r1
	streqh r1, [r0]
	bx lr
	arm_func_end sub_0201A514

	arm_func_start sub_0201A540
sub_0201A540: ; 0x0201A540
	tst r0, #1
	ldrneh r0, [r0, #-1]
	movne r0, r0, asr #8
	ldreqh r0, [r0]
	and r0, r0, #0xff
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0201A540

	arm_func_start sub_0201A55C
sub_0201A55C: ; 0x0201A55C
	ldr r3, _0201A588 ; =0x0380FFF4
	ldr r2, _0201A58C ; =0x0000FFF8
	ldr r3, [r3]
	and r0, r0, r2
	add r2, r0, #5
	add r0, r3, #0x500
	strh r2, [r0, #0xf0]
	add r2, r3, #0x5f0
	orr r0, r1, #1
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_0201A588: .word 0x0380FFF4
_0201A58C: .word 0x0000FFF8
	arm_func_end sub_0201A55C

	arm_func_start sub_0201A590
sub_0201A590: ; 0x0201A590
	ldr r1, _0201A5A4 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	strh r0, [r1, #0xf4]
	bx lr
	.align 2, 0
_0201A5A4: .word 0x0380FFF4
	arm_func_end sub_0201A590

	arm_func_start sub_0201A5A8
sub_0201A5A8: ; 0x0201A5A8
	ldr r0, _0201A5D4 ; =0x0380FFF4
	ldr r0, [r0]
	add r3, r0, #0x5f0
	add r0, r0, #0x500
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	ldrh r0, [r0, #0xf0]
	mla r0, r1, r0, r2
	strh r0, [r3, #4]
	ldrh r0, [r3, #4]
	bx lr
	.align 2, 0
_0201A5D4: .word 0x0380FFF4
	arm_func_end sub_0201A5A8

	arm_func_start sub_0201A5D8
sub_0201A5D8: ; 0x0201A5D8
	stmdb sp!, {r4, lr}
	ldr r2, _0201A650 ; =0x027F72C0
	mov r4, r1, lsl #0x1c
	ldr r3, _0201A654 ; =0x00000FFF
	mov r4, r4, lsr #0x1b
	mov ip, r0, lsl #0x1c
	mov lr, ip, lsr #0x1b
	and r1, r3, r1, asr #4
	ldrh r4, [r2, r4]
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #4
	mov r0, r0, lsl #0x1c
	mov ip, r0, lsr #0x1b
	ldrh r0, [r2, lr]
	eor r1, r4, r1, lsr #16
	eor r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, lsl #0x1c
	mov r0, r0, lsr #0x1b
	and r1, r3, r1, asr #4
	ldrh r3, [r2, r0]
	mov r0, r1, lsl #0x10
	ldrh r1, [r2, ip]
	eor r0, r3, r0, lsr #16
	eor r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201A650: .word 0x027F72C0
_0201A654: .word 0x00000FFF
	arm_func_end sub_0201A5D8

	arm_func_start sub_0201A658
sub_0201A658: ; 0x0201A658
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #8]
	ldr r1, _0201A6CC ; =0x0000B6B8
	ldrh r2, [r4, #-4]
	sub lr, r4, #4
	cmp r2, r1
	ldreqh r2, [lr, #2]
	ldreq r1, _0201A6D0 ; =0x00001D46
	cmpeq r2, r1
	moveq r0, #0
	beq _0201A6C4
	ldr r3, _0201A6CC ; =0x0000B6B8
	mov ip, #1
	strh ip, [r4, #0xa]
	ldr r2, _0201A6D0 ; =0x00001D46
	strh r3, [lr]
	strh r2, [lr, #2]
	ldr r1, [r0, #8]
	ldr r0, _0201A6D4 ; =0x0380FFF4
	strh r3, [r1, #0xc]
	strh r2, [r1, #0xe]
	ldr r1, [r0]
	mov r0, ip
	add r1, r1, #0x300
	ldrh r2, [r1, #0xfa]
	add r2, r2, #1
	strh r2, [r1, #0xfa]
_0201A6C4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201A6CC: .word 0x0000B6B8
_0201A6D0: .word 0x00001D46
_0201A6D4: .word 0x0380FFF4
	arm_func_end sub_0201A658
_0201A6D8:
	.byte 0x30, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC0, 0xE1, 0x10, 0x20, 0xA0, 0xE3, 0x21, 0x1E, 0x80, 0xE2, 0x04, 0x00, 0x00, 0xEA
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x09, 0x00, 0x50, 0x13, 0x1E, 0xFF, 0x2F, 0x01
	.byte 0x01, 0x20, 0x42, 0xE2, 0x00, 0x00, 0x52, 0xE3, 0xF8, 0xFF, 0xFF, 0x1A, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x04, 0x80, 0x80, 0x04, 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x40, 0xA0, 0xE1, 0xB0, 0x00, 0xD4, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x0A, 0x00, 0x00, 0x0A, 0xEA, 0xFF, 0xFF, 0xEB, 0x0C, 0x10, 0x94, 0xE5
	.byte 0x08, 0x00, 0x94, 0xE5, 0x10, 0x10, 0x41, 0xE2, 0x71, 0x14, 0x00, 0xEB, 0x18, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x1F, 0xD0, 0xE1, 0x01, 0x10, 0x81, 0xE2
	.byte 0xBC, 0x1F, 0xC0, 0xE1, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x38, 0x40, 0x2D, 0xE9, 0xE8, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0x90, 0xE5, 0x03, 0x0C, 0x82, 0xE2
	.byte 0xB0, 0x15, 0xD0, 0xE1, 0x2C, 0x00, 0x82, 0xE2, 0x01, 0x00, 0x51, 0xE3, 0xD1, 0x4F, 0x82, 0xE2
	.byte 0x01, 0x5B, 0x80, 0xE2, 0x03, 0x00, 0x00, 0x0A, 0x02, 0x00, 0x51, 0xE3, 0x0E, 0x00, 0x00, 0x0A
	.byte 0x03, 0x00, 0x51, 0xE3, 0x1B, 0x00, 0x00, 0xEA, 0x78, 0x00, 0x85, 0xE2, 0xAD, 0xFF, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0xCA, 0xFF, 0xFF, 0xEB, 0x90, 0x18, 0x00, 0xEB
	.byte 0x28, 0x00, 0x85, 0xE2, 0xA7, 0xFF, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x11, 0x00, 0x00, 0x0A
	.byte 0x28, 0x00, 0x85, 0xE2, 0xD2, 0xFF, 0xFF, 0xEB, 0x0E, 0x00, 0x00, 0xEA, 0x64, 0x00, 0x85, 0xE2
	.byte 0xA0, 0xFF, 0xFF, 0xEB, 0x28, 0x00, 0x85, 0xE2, 0x9E, 0xFF, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x08, 0x00, 0x00, 0x0A, 0xB8, 0x02, 0xD5, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x0A
	.byte 0xB8, 0xFF, 0xFF, 0xEB, 0xBA, 0x06, 0xD4, 0xE1, 0xD0, 0x1B, 0x00, 0xEB, 0xB8, 0x0B, 0xD4, 0xE1
	.byte 0x01, 0x00, 0x80, 0xE2, 0xB8, 0x0B, 0xC4, 0xE1, 0x14, 0x00, 0x85, 0xE2, 0x91, 0xFF, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0x14, 0x00, 0x85, 0xE2, 0xBC, 0xFF, 0xFF, 0xEB
	.byte 0x05, 0x00, 0xA0, 0xE1, 0x8B, 0xFF, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A
	.byte 0x05, 0x00, 0xA0, 0xE1, 0xB6, 0xFF, 0xFF, 0xEB, 0x18, 0x10, 0x9F, 0xE5, 0xB0, 0x00, 0xD1, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0xA0, 0x03, 0xB0, 0x00, 0xC1, 0x01, 0x38, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x04, 0x80, 0x80, 0x04

	arm_func_start sub_0201A85C
sub_0201A85C: ; 0x0201A85C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x1000000
	bl sub_0302B118
	ldr r1, _0201A89C ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r2, [r1, #0xf4]
	orr r2, r2, r4
	strh r2, [r1, #0xf4]
	bl sub_0302B0E0
	mov r0, #2
	mov r1, #0x15
	bl sub_03027D88
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201A89C: .word 0x0380FFF4
	arm_func_end sub_0201A85C

	arm_func_start sub_0201A8A0
sub_0201A8A0: ; 0x0201A8A0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201A918 ; =0x0380FFF4
	ldr r1, [r0]
	add r4, r1, #0x344
	ldrh r0, [r4, #0xb0]
	cmp r0, #0
	beq _0201A910
	add r0, r1, #0x188
	mov r1, #0x12
	bl sub_0302805C
	movs r5, r0
	beq _0201A910
	ldr r1, _0201A91C ; =0x00000186
	mov r0, #1
	strh r1, [r5, #0xc]
	strh r0, [r5, #0xe]
	mov r0, #0x1000000
	bl sub_0302B118
	ldrh r2, [r4, #0xb0]
	mov r1, #0
	strh r2, [r5, #0x10]
	strh r1, [r4, #0xb0]
	bl sub_0302B0E0
	ldr r0, _0201A918 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
_0201A910:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201A918: .word 0x0380FFF4
_0201A91C: .word 0x00000186
	arm_func_end sub_0201A8A0

	arm_func_start sub_0201A920
sub_0201A920: ; 0x0201A920
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0201A9B8 ; =0x0380FFF4
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #0x8000
	strh r1, [r0, #0x3e]
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	beq _0201A98C
	bl sub_03028988
	ldr r2, _0201A9B8 ; =0x0380FFF4
	ldr r0, [r2]
	add r0, r0, #0x400
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0201A988
	mov r1, #0
	strh r1, [r0, #4]
	ldr r0, [r2]
	mov r1, #6
	ldr r0, [r0, #0x420]
	strh r1, [r0, #4]
	bl sub_0201D304
_0201A988:
	bl sub_020194E4
_0201A98C:
	ldr r4, _0201A9BC ; =0x0000FFFF
	mov r5, #3
_0201A994:
	mov r0, r5
	bl sub_03027E40
	cmp r0, r4
	bne _0201A994
	mov r0, #3
	mov r1, #0x17
	bl sub_03027D88
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201A9B8: .word 0x0380FFF4
_0201A9BC: .word 0x0000FFFF
	arm_func_end sub_0201A920

	arm_func_start sub_0201A9C0
sub_0201A9C0: ; 0x0201A9C0
	stmdb sp!, {r4, lr}
	ldr r0, _0201AA0C ; =0x0380FFF4
	ldr r4, [r0]
	bl sub_0201B0D0
	ldr r1, _0201AA0C ; =0x0380FFF4
	add r0, r4, #0x188
	ldr r1, [r1]
	ldr r1, [r1, #0x318]
	sub r1, r1, #0xc
	bl sub_030280F8
	ldr r1, _0201AA0C ; =0x0380FFF4
	add r0, r4, #0x188
	ldr r1, [r1]
	ldr r1, [r1, #0x3e0]
	sub r1, r1, #0xc
	bl sub_030280F8
	bl sub_0302B94C
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201AA0C: .word 0x0380FFF4
	arm_func_end sub_0201A9C0

	arm_func_start sub_0201AA10
sub_0201AA10: ; 0x0201AA10
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r0, _0201ABA4 ; =0x027F7554
	ldr r6, _0201ABA8 ; =0x027F74E4
	mov r3, ip
	mov r1, ip
	b _0201AA84
_0201AA2C:
	mov r4, r3, lsl #1
	ldrh r5, [r6, r4]
	mov r2, r1
	b _0201AA78
_0201AA3C:
	mov lr, r2, lsl #2
	add r4, r0, r2, lsl #2
	ldrh lr, [r0, lr]
	ldrh r4, [r4, #2]
	add lr, lr, #0x4800000
	and r4, r5, r4
	add lr, lr, #0x8000
	strh r4, [lr]
	ldrh lr, [lr]
	cmp lr, r4
	beq _0201AA74
	cmp ip, #0x20
	add ip, ip, #1
	bhi _0201AB7C
_0201AA74:
	add r2, r2, #1
_0201AA78:
	cmp r2, #0x1b
	blo _0201AA3C
	add r3, r3, #1
_0201AA84:
	cmp r3, #3
	blo _0201AA2C
	ldr r4, _0201ABAC ; =0x00001234
	ldr r3, _0201ABA4 ; =0x027F7554
	mov r5, #0
_0201AA98:
	mov r0, r5, lsl #2
	add r1, r3, r5, lsl #2
	ldrh r0, [r3, r0]
	ldrh r2, [r1, #2]
	add r1, r4, #0x234
	add r0, r0, #0x4800000
	add r1, r1, #0x1000
	add r5, r5, #1
	and r2, r4, r2
	add r0, r0, #0x8000
	mov r1, r1, lsl #0x10
	strh r2, [r0]
	cmp r5, #0x1b
	mov r4, r1, lsr #0x10
	blo _0201AA98
	ldr r5, _0201ABAC ; =0x00001234
	ldr r3, _0201ABA4 ; =0x027F7554
	mov r4, #0
	b _0201AB2C
_0201AAE4:
	mov r0, r4, lsl #2
	ldrh r0, [r3, r0]
	add r1, r3, r4, lsl #2
	add r0, r0, #0x4800000
	add r0, r0, #0x8000
	ldrh r1, [r1, #2]
	ldrh r2, [r0]
	and r0, r5, r1
	cmp r2, r0
	beq _0201AB18
	cmp ip, #0x20
	add ip, ip, #1
	bhi _0201AB7C
_0201AB18:
	add r0, r5, #0x234
	add r0, r0, #0x1000
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	add r4, r4, #1
_0201AB2C:
	cmp r4, #0x1b
	blo _0201AAE4
	mov r3, #0
	ldr r2, _0201ABA4 ; =0x027F7554
	mov r1, r3
	b _0201AB74
_0201AB44:
	mov r0, r3, lsl #2
	ldrh r0, [r2, r0]
	add r0, r0, #0x4800000
	add r0, r0, #0x8000
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0201AB70
	cmp ip, #0x20
	add ip, ip, #1
	bhi _0201AB7C
_0201AB70:
	add r3, r3, #1
_0201AB74:
	cmp r3, #0x1b
	blo _0201AB44
_0201AB7C:
	cmp ip, #0
	beq _0201AB9C
	ldr r0, _0201ABB0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #1
	strh r1, [r0, #0x3e]
_0201AB9C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201ABA4: .word 0x027F7554
_0201ABA8: .word 0x027F74E4
_0201ABAC: .word 0x00001234
_0201ABB0: .word 0x0380FFF4
	arm_func_end sub_0201AA10

	arm_func_start sub_0201ABB4
sub_0201ABB4: ; 0x0201ABB4
	stmdb sp!, {r3, lr}
	ldr lr, _0201AD2C ; =0x04804000
	mov r0, #0
	ldr r3, _0201AD30 ; =0x0000FFFF
	mov r2, r0
_0201ABC8:
	sub r1, r3, #1
	mov ip, r3
	mov r1, r1, lsl #0x10
	add r2, r2, #2
	cmp r2, #0x2000
	mov r3, r1, lsr #0x10
	strh ip, [lr], #2
	blo _0201ABC8
	ldr r2, _0201AD2C ; =0x04804000
	ldr r3, _0201AD30 ; =0x0000FFFF
	mov ip, #0
	b _0201AC24
_0201ABF8:
	ldrh r1, [r2]
	cmp r1, r3
	beq _0201AC10
	cmp r0, #0x20
	add r0, r0, #1
	bhi _0201AD04
_0201AC10:
	sub r1, r3, #1
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_0201AC24:
	cmp ip, #0x2000
	blo _0201ABF8
	ldr r2, _0201AD2C ; =0x04804000
	ldr r3, _0201AD34 ; =0x00005A5A
	mov ip, #0
_0201AC38:
	mvn r1, r3
	add ip, ip, #2
	mov r1, r1, lsl #0x10
	strh r3, [r2], #2
	cmp ip, #0x2000
	mov r3, r1, lsr #0x10
	blo _0201AC38
	ldr r2, _0201AD2C ; =0x04804000
	ldr r3, _0201AD34 ; =0x00005A5A
	mov ip, #0
	b _0201AC90
_0201AC64:
	ldrh r1, [r2]
	cmp r1, r3
	beq _0201AC7C
	cmp r0, #0x20
	add r0, r0, #1
	bhi _0201AD04
_0201AC7C:
	mvn r1, r3
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_0201AC90:
	cmp ip, #0x2000
	blo _0201AC64
	ldr r2, _0201AD2C ; =0x04804000
	ldr r3, _0201AD38 ; =0x0000A5A5
	mov ip, #0
_0201ACA4:
	mvn r1, r3
	add ip, ip, #2
	mov r1, r1, lsl #0x10
	strh r3, [r2], #2
	cmp ip, #0x2000
	mov r3, r1, lsr #0x10
	blo _0201ACA4
	ldr r2, _0201AD2C ; =0x04804000
	ldr r3, _0201AD38 ; =0x0000A5A5
	mov ip, #0
	b _0201ACFC
_0201ACD0:
	ldrh r1, [r2]
	cmp r1, r3
	beq _0201ACE8
	cmp r0, #0x20
	add r0, r0, #1
	bhi _0201AD04
_0201ACE8:
	mvn r1, r3
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_0201ACFC:
	cmp ip, #0x2000
	blo _0201ACD0
_0201AD04:
	cmp r0, #0
	beq _0201AD24
	ldr r0, _0201AD3C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #2
	strh r1, [r0, #0x3e]
_0201AD24:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201AD2C: .word 0x04804000
_0201AD30: .word 0x0000FFFF
_0201AD34: .word 0x00005A5A
_0201AD38: .word 0x0000A5A5
_0201AD3C: .word 0x0380FFF4
	arm_func_end sub_0201ABB4

	arm_func_start sub_0201AD40
sub_0201AD40: ; 0x0201AD40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _0201B014 ; =0x0380FFF4
	mov r7, #0
	ldr r0, [r0]
	mov r6, #0
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	mov r5, #0xff
	cmp r0, #5
	ldreq sl, _0201B018 ; =0x027F74EA
	mvn r4, #0
	ldrne sl, _0201B01C ; =0x027F751C
	b _0201AD90
_0201AD74:
	mov r0, r6
	mov r1, r5
	bl sub_02019DE0
	cmp r0, r4
	moveq r7, #1
	beq _0201AFEC
	add r6, r6, #1
_0201AD90:
	cmp r6, #0x69
	blo _0201AD74
	mov r5, #0
	mov r4, r5
	b _0201ADE0
_0201ADA4:
	mov r0, r4, lsl #1
	ldrh r0, [sl, r0]
	cmp r5, r0
	addeq r4, r4, #1
	beq _0201ADDC
	mov r0, r5
	bl sub_02019DB4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xff
	beq _0201ADDC
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0201AFEC
_0201ADDC:
	add r5, r5, #1
_0201ADE0:
	cmp r5, #0x69
	blo _0201ADA4
	mov r5, #0
	mov r4, r5
_0201ADF0:
	mov r0, r5
	mov r1, r4
	bl sub_02019DE0
	add r5, r5, #1
	cmp r5, #0x69
	blo _0201ADF0
	mov r4, #0
	mov r5, r4
	b _0201AE4C
_0201AE14:
	mov r0, r5, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r5, r5, #1
	beq _0201AE48
	mov r0, r4
	bl sub_02019DB4
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	beq _0201AE48
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0201AFEC
_0201AE48:
	add r4, r4, #1
_0201AE4C:
	cmp r4, #0x69
	blo _0201AE14
	mov r4, #0x55
	mov r5, #0
_0201AE5C:
	mov r0, r5
	mov r1, r4
	bl sub_02019DE0
	mvn r0, r4
	add r5, r5, #1
	mov r0, r0, lsl #0x10
	cmp r5, #0x69
	mov r4, r0, lsr #0x10
	blo _0201AE5C
	mov r4, #0
	mov r6, r4
	mov r5, #0x55
	b _0201AED4
_0201AE90:
	mov r0, r6, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r6, r6, #1
	beq _0201AEC8
	mov r0, r4
	bl sub_02019DB4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r5
	beq _0201AEC8
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0201AFEC
_0201AEC8:
	mvn r0, r5
	and r5, r0, #0xff
	add r4, r4, #1
_0201AED4:
	cmp r4, #0x69
	blo _0201AE90
	mov r5, #0xff
	mov r4, #0
_0201AEE4:
	mov r0, r4
	mov r1, r5
	bl sub_02019DE0
	sub r0, r5, #1
	add r4, r4, #1
	mov r0, r0, lsl #0x10
	cmp r4, #0x69
	mov r5, r0, lsr #0x10
	blo _0201AEE4
	mov r4, #0
	mov r6, r4
	mov r5, #0xff
	b _0201AF60
_0201AF18:
	mov r0, r6, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r6, r6, #1
	beq _0201AF50
	mov r0, r4
	bl sub_02019DB4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r5
	beq _0201AF50
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0201AFEC
_0201AF50:
	sub r0, r5, #1
	mov r0, r0, lsl #0x10
	add r4, r4, #1
	mov r5, r0, lsr #0x10
_0201AF60:
	cmp r4, #0x69
	blo _0201AF18
	mov r8, #0
	mov sb, r8
	mov r4, #1
	mov fp, r8
	b _0201AFE4
_0201AF7C:
	mov r0, sb, lsl #1
	ldrh r0, [sl, r0]
	cmp r8, r0
	addeq sb, sb, #1
	beq _0201AFE0
	mov r6, r4
	mov r5, fp
	b _0201AFD8
_0201AF9C:
	mov r0, r8
	mov r1, r6
	bl sub_02019DE0
	mov r0, r8
	bl sub_02019DB4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r6
	beq _0201AFCC
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0201AFEC
_0201AFCC:
	mov r0, r6, lsl #1
	and r6, r0, #0xff
	add r5, r5, #1
_0201AFD8:
	cmp r5, #9
	blo _0201AF9C
_0201AFE0:
	add r8, r8, #1
_0201AFE4:
	cmp r8, #0x69
	blo _0201AF7C
_0201AFEC:
	cmp r7, #0
	beq _0201B00C
	ldr r0, _0201B014 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #8
	strh r1, [r0, #0x3e]
_0201B00C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201B014: .word 0x0380FFF4
_0201B018: .word 0x027F74EA
_0201B01C: .word 0x027F751C
	arm_func_end sub_0201AD40
_0201B020:
	.byte 0x08, 0x00, 0x9F, 0xE5, 0x02, 0x1B, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x10, 0x80, 0x80, 0x04, 0x10, 0x40, 0x2D, 0xE9, 0xB0, 0x10, 0xD0, 0xE1, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x51, 0xE3, 0x0A, 0x00, 0x00, 0x1A, 0x54, 0x20, 0x9F, 0xE5, 0x08, 0x30, 0x90, 0xE5
	.byte 0x50, 0x10, 0x9F, 0xE5, 0xB0, 0x20, 0xD2, 0xE1, 0x01, 0x10, 0x03, 0xE0, 0xA1, 0x10, 0xA0, 0xE1
	.byte 0x02, 0x19, 0x81, 0xE3, 0x02, 0x00, 0x51, 0xE1, 0x01, 0x10, 0xA0, 0x13, 0xB0, 0x10, 0xC0, 0x11
	.byte 0x01, 0x40, 0x84, 0x13, 0xB0, 0x10, 0xD0, 0xE1, 0x01, 0x00, 0x51, 0xE3, 0x05, 0x00, 0x00, 0x1A
	.byte 0x08, 0x10, 0x90, 0xE5, 0xB0, 0x10, 0xD1, 0xE1, 0x01, 0x00, 0x11, 0xE3, 0x01, 0x00, 0x00, 0x0A
	.byte 0x84, 0x14, 0x00, 0xEB, 0x02, 0x40, 0x84, 0xE3, 0x04, 0x00, 0xA0, 0xE1, 0x10, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x94, 0x80, 0x80, 0x04, 0xFF, 0x3F, 0x00, 0x00

	arm_func_start sub_0201B0AC
sub_0201B0AC: ; 0x0201B0AC
	stmdb sp!, {r3, lr}
	ldr r1, _0201B0CC ; =0x037F92DC
	mov r0, #0x1000000
	bl sub_0302AFAC
	mov r0, #0x1000000
	bl sub_0302B0E0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201B0CC: .word 0x037F92DC
	arm_func_end sub_0201B0AC

	arm_func_start sub_0201B0D0
sub_0201B0D0: ; 0x0201B0D0
	stmdb sp!, {r3, lr}
	mov r0, #0x1000000
	bl sub_0302B118
	mov r0, #0x1000000
	mov r1, #0
	bl sub_0302AFAC
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0201B0D0

	arm_func_start sub_0201B0F0
sub_0201B0F0: ; 0x0201B0F0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #1
	movne r0, #0
	bne _0201B18C
	ldr r4, _0201B194 ; =0x0380FFF4
	ldr r0, [r4]
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp r1, #1
	bls _0201B188
	ldr r1, [r0, #0x31c]
	mov r7, #0
	add r5, r1, #0x1c
	mov r6, #1
	b _0201B178
_0201B134:
	ldrh r1, [r5]
	cmp r1, #0
	beq _0201B170
	mov r1, r8
	add r0, r5, #4
	bl sub_02019C64
	cmp r0, #0
	movne r0, r6
	bne _0201B18C
	ldr r0, [r4]
	add r7, r7, #1
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp r7, r1
	bhs _0201B188
_0201B170:
	add r6, r6, #1
	add r5, r5, #0x1c
_0201B178:
	add r1, r0, #0x300
	ldrh r1, [r1, #0x22]
	cmp r6, r1
	blo _0201B134
_0201B188:
	mov r0, #0xff
_0201B18C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0201B194: .word 0x0380FFF4
	arm_func_end sub_0201B0F0

	arm_func_start sub_0201B198
sub_0201B198: ; 0x0201B198
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r5, _0201B2D4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r5]
	ldrh r1, [r4]
	add r6, r0, #0x31c
	tst r1, #1
	movne r0, #0
	bne _0201B2CC
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	mov r8, #1
	cmp r1, #1
	bls _0201B248
	ldr r1, [r6]
	mov sl, #0
	mov sb, sl
	add r7, r1, #0x1c
	b _0201B234
_0201B1E4:
	ldrh r1, [r7]
	cmp r1, #0
	beq _0201B224
	mov r1, r4
	add r0, r7, #4
	bl sub_02019C64
	cmp r0, #0
	movne r0, r8
	bne _0201B2CC
	ldr r0, [r5]
	add sb, sb, #1
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp sb, r1
	bhs _0201B240
	b _0201B22C
_0201B224:
	cmp sl, #0
	moveq sl, r8
_0201B22C:
	add r8, r8, #1
	add r7, r7, #0x1c
_0201B234:
	ldrh r1, [r6, #6]
	cmp r8, r1
	blo _0201B1E4
_0201B240:
	cmp sl, #0
	movne r8, sl
_0201B248:
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _0201B2BC
	ldr r7, [r6]
	ldrh r5, [r6, #6]
	mov r3, #0x10000
	mov r6, #1
	mov r8, #0
	mov r0, #0x1c
	b _0201B2A8
_0201B274:
	mul r2, r6, r0
	ldrh r1, [r7, r2]
	add r2, r7, r2
	cmp r1, #0x30
	bhs _0201B2A4
	ldrh r1, [r2, #0x16]
	cmp r1, #0
	bne _0201B2A4
	ldrh r1, [r2, #0x18]
	cmp r3, r1
	movhi r3, r1
	movhi r8, r6
_0201B2A4:
	add r6, r6, #1
_0201B2A8:
	cmp r6, r5
	blo _0201B274
	cmp r8, #0
	moveq r0, #0xff
	beq _0201B2CC
_0201B2BC:
	mov r0, r8
	mov r1, r4
	bl sub_0201BD88
	mov r0, r8
_0201B2CC:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0201B2D4: .word 0x0380FFF4
	arm_func_end sub_0201B198

	arm_func_start sub_0201B2D8
sub_0201B2D8: ; 0x0201B2D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0201B330 ; =0x0380FFF4
	mov r7, r0
	ldr r2, [r2]
	mov r0, #0x1000000
	add r4, r2, #0x1ac
	mov r6, r1
	bl sub_0302B118
	ldrh r1, [r4, #8]
	mov r5, r0
	cmp r1, #0
	bne _0201B310
	mov r0, #0
	bl sub_0201B8FC
_0201B310:
	mov r0, r7
	mov r1, r4
	mov r2, r6
	bl sub_03028178
	mov r0, r5
	bl sub_0302B0E0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201B330: .word 0x0380FFF4
	arm_func_end sub_0201B2D8

	arm_func_start sub_0201B334
sub_0201B334: ; 0x0201B334
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0201B3C0 ; =0x0380FFF4
	ldrh r5, [r0, #2]
	ldr r0, [r1]
	mov r1, #0x1c
	ldr r2, [r0, #0x31c]
	mov r0, #0x1000000
	mla r6, r5, r1, r2
	bl sub_0302B118
	ldr r1, _0201B3C0 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldreqh r0, [r6, #0x16]
	cmpeq r0, #0
	bne _0201B384
	mov r0, r5
	bl sub_0201B8FC
_0201B384:
	ldrh r1, [r6, #0x16]
	mov r0, r4
	add r1, r1, #1
	strh r1, [r6, #0x16]
	bl sub_0302B0E0
	ldr r0, _0201B3C0 ; =0x0380FFF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x34]
	tst r0, r1, lsl r5
	ldreqh r0, [r6, #0x1a]
	streqh r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201B3C0: .word 0x0380FFF4
	arm_func_end sub_0201B334

	arm_func_start sub_0201B3C4
sub_0201B3C4: ; 0x0201B3C4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0201B430 ; =0x0380FFF4
	ldrh r5, [r0, #2]
	ldr r0, [r1]
	mov r1, #0x1c
	ldr r2, [r0, #0x31c]
	mov r0, #0x1000000
	mla r6, r5, r1, r2
	bl sub_0302B118
	ldr r1, _0201B430 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldreqh r0, [r6, #0x16]
	cmpeq r0, #1
	bne _0201B414
	mov r0, r5
	bl sub_0201B9B8
_0201B414:
	ldrh r1, [r6, #0x16]
	mov r0, r4
	sub r1, r1, #1
	strh r1, [r6, #0x16]
	bl sub_0302B0E0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201B430: .word 0x0380FFF4
	arm_func_end sub_0201B3C4

	arm_func_start sub_0201B434
sub_0201B434: ; 0x0201B434
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #0x1000000
	mov r5, r1
	bl sub_0302B118
	ldr r3, _0201B518 ; =0x0380FFF4
	mov r4, r0
	cmp r5, #0x40
	bhs _0201B4B4
	ldr r0, [r3]
	mov r2, #1
	add r0, r0, #0x500
	ldrh r1, [r0, #0x30]
	orr r1, r1, r2, lsl r6
	strh r1, [r0, #0x30]
	ldr r0, [r3]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	orr r1, r1, r2, lsl r6
	strh r1, [r0, #0x32]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _0201B4F0
	mov r0, r6
	bl sub_0201B8BC
	cmp r0, #0
	beq _0201B4F0
	mov r0, r6
	bl sub_0201B750
	b _0201B4F0
_0201B4B4:
	ldr r2, [r3]
	mov r0, #1
	mvn r1, r0, lsl r6
	add r0, r2, #0x500
	ldrh r2, [r0, #0x32]
	and r1, r2, r1
	strh r1, [r0, #0x32]
	ldr r0, [r3]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x2e]
	mov r0, r0, asr r6
	tst r0, #1
	beq _0201B4F0
	mov r0, r6
	bl sub_0201B598
_0201B4F0:
	ldr r1, _0201B518 ; =0x0380FFF4
	mov r0, #0x1c
	ldr r2, [r1]
	mul r1, r6, r0
	ldr r2, [r2, #0x31c]
	mov r0, r4
	strh r5, [r2, r1]
	bl sub_0302B0E0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201B518: .word 0x0380FFF4
	arm_func_end sub_0201B434

	arm_func_start sub_0201B51C
sub_0201B51C: ; 0x0201B51C
	ldr r3, _0201B538 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xa]
	bx lr
	.align 2, 0
_0201B538: .word 0x0380FFF4
	arm_func_end sub_0201B51C

	arm_func_start sub_0201B53C
sub_0201B53C: ; 0x0201B53C
	ldr r3, _0201B58C ; =0x0380FFF4
	mov r2, #1
	ldr ip, [r3]
	mvn r3, r2, lsl r0
	add r2, ip, #0x12c
	add ip, r2, #0x400
	ldrh r2, [ip, #2]
	and r2, r2, r3
	orr r0, r2, r1, lsl r0
	strh r0, [ip, #2]
	ldrh r0, [ip, #6]
	ldrh r1, [ip, #2]
	mvn r0, r0
	tst r1, r0
	ldrne r0, _0201B590 ; =0x048080AC
	mov r1, #8
	strneh r1, [r0]
	ldreq r0, _0201B594 ; =0x048080AE
	streqh r1, [r0]
	bx lr
	.align 2, 0
_0201B58C: .word 0x0380FFF4
_0201B590: .word 0x048080AC
_0201B594: .word 0x048080AE
	arm_func_end sub_0201B53C

	arm_func_start sub_0201B598
sub_0201B598: ; 0x0201B598
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _0201B5CC
	ldr r1, _0201B5D4 ; =0x0380FFF4
	mov r0, #1
	ldr r2, [r1]
	mvn r1, r0, lsl r4
	add r0, r2, #0x500
	ldrh r2, [r0, #0x30]
	and r1, r2, r1
	strh r1, [r0, #0x30]
_0201B5CC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201B5D4: .word 0x0380FFF4
	arm_func_end sub_0201B598

	arm_func_start sub_0201B5D8
sub_0201B5D8: ; 0x0201B5D8
	ldr r1, _0201B5F8 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r3, [r1, #0x30]
	orr r0, r3, r2, lsl r0
	strh r0, [r1, #0x30]
	bx lr
	.align 2, 0
_0201B5F8: .word 0x0380FFF4
	arm_func_end sub_0201B5D8

	arm_func_start sub_0201B5FC
sub_0201B5FC: ; 0x0201B5FC
	ldr r3, _0201B618 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xc]
	bx lr
	.align 2, 0
_0201B618: .word 0x0380FFF4
	arm_func_end sub_0201B5FC

	arm_func_start sub_0201B61C
sub_0201B61C: ; 0x0201B61C
	ldr r3, _0201B638 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0x10]
	bx lr
	.align 2, 0
_0201B638: .word 0x0380FFF4
	arm_func_end sub_0201B61C

	arm_func_start sub_0201B63C
sub_0201B63C: ; 0x0201B63C
	ldr r3, _0201B658 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0x14]
	bx lr
	.align 2, 0
_0201B658: .word 0x0380FFF4
	arm_func_end sub_0201B63C

	arm_func_start sub_0201B65C
sub_0201B65C: ; 0x0201B65C
	ldr r3, _0201B678 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xe]
	bx lr
	.align 2, 0
_0201B678: .word 0x0380FFF4
	arm_func_end sub_0201B65C

	arm_func_start sub_0201B67C
sub_0201B67C: ; 0x0201B67C
	ldr r2, _0201B69C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x1a]
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0201B69C: .word 0x0380FFF4
	arm_func_end sub_0201B67C

	arm_func_start sub_0201B6A0
sub_0201B6A0: ; 0x0201B6A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0201B74C ; =0x0380FFF4
	mov r7, r0
	ldr r1, [r1]
	mov r0, #0x1000000
	add r1, r1, #0x12c
	add r4, r1, #0x400
	bl sub_0302B118
	mov r6, r0
	mov r5, #1
	mov r1, #2
	b _0201B730
_0201B6D0:
	ldrh r0, [r4, #0xe]
	tst r0, r1
	bne _0201B728
	orr r0, r0, r1
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _0201B700
	bl sub_020196D0
_0201B700:
	ldr r0, _0201B74C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r0]
	mov r0, r6
	ldr r2, [r2, #0x31c]
	mla r1, r7, r1, r2
	strh r5, [r1, #2]
	bl sub_0302B0E0
	mov r0, r5
	b _0201B744
_0201B728:
	add r5, r5, #1
	mov r1, r1, lsl #1
_0201B730:
	cmp r5, #0x10
	blo _0201B6D0
	mov r0, r6
	bl sub_0302B0E0
	mov r0, #0
_0201B744:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201B74C: .word 0x0380FFF4
	arm_func_end sub_0201B6A0

	arm_func_start sub_0201B750
sub_0201B750: ; 0x0201B750
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0201B7CC ; =0x0380FFF4
	mov r5, r0
	ldr r4, [r1]
	bl sub_0201B9B8
	mov r0, r5
	bl sub_0201B8BC
	cmp r0, #0
	beq _0201B7C4
	ldr r1, _0201B7CC ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r1]
	mov r1, #0x1c
	ldr r3, [r3, #0x31c]
	mov ip, #0
	mla r1, r5, r1, r3
	strh ip, [r1, #2]
	add r1, r4, #0x500
	ldrh r3, [r1, #0x3a]
	mvn r0, r2, lsl r0
	and r0, r3, r0
	strh r0, [r1, #0x3a]
	ldrh r0, [r1, #0x38]
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	bne _0201B7C4
	bl sub_02019684
_0201B7C4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201B7CC: .word 0x0380FFF4
	arm_func_end sub_0201B750

	arm_func_start sub_0201B7D0
sub_0201B7D0: ; 0x0201B7D0
	ldr r2, _0201B7EC ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	mul r1, r0, r1
	ldr r0, [r2, #0x31c]
	ldrh r0, [r0, r1]
	bx lr
	.align 2, 0
_0201B7EC: .word 0x0380FFF4
	arm_func_end sub_0201B7D0

	arm_func_start sub_0201B7F0
sub_0201B7F0: ; 0x0201B7F0
	ldr r1, _0201B80C ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r1, [r1, #0x30]
	mov r0, r1, asr r0
	and r0, r0, #1
	bx lr
	.align 2, 0
_0201B80C: .word 0x0380FFF4
	arm_func_end sub_0201B7F0

	arm_func_start sub_0201B810
sub_0201B810: ; 0x0201B810
	ldr r1, _0201B82C ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r1, [r1, #0x2e]
	mov r0, r1, asr r0
	and r0, r0, #1
	bx lr
	.align 2, 0
_0201B82C: .word 0x0380FFF4
	arm_func_end sub_0201B810

	arm_func_start sub_0201B830
sub_0201B830: ; 0x0201B830
	ldr r2, _0201B84C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	add r0, r1, #4
	bx lr
	.align 2, 0
_0201B84C: .word 0x0380FFF4
	arm_func_end sub_0201B830

	arm_func_start sub_0201B850
sub_0201B850: ; 0x0201B850
	ldr r2, _0201B86C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0201B86C: .word 0x0380FFF4
	arm_func_end sub_0201B850

	arm_func_start sub_0201B870
sub_0201B870: ; 0x0201B870
	ldr r2, _0201B88C ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x14]
	bx lr
	.align 2, 0
_0201B88C: .word 0x0380FFF4
	arm_func_end sub_0201B870
_0201B890:
	.byte 0x20, 0x20, 0x9F, 0xE5, 0x1C, 0x10, 0xA0, 0xE3, 0x00, 0x20, 0x92, 0xE5, 0x1C, 0x23, 0x92, 0xE5
	.byte 0x90, 0x21, 0x21, 0xE0, 0xB0, 0x01, 0xD1, 0xE1, 0x02, 0x00, 0x10, 0xE3, 0x14, 0x00, 0xA0, 0x13
	.byte 0x0A, 0x00, 0xA0, 0x03, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03

	arm_func_start sub_0201B8BC
sub_0201B8BC: ; 0x0201B8BC
	ldr r2, _0201B8D8 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_0201B8D8: .word 0x0380FFF4
	arm_func_end sub_0201B8BC

	arm_func_start sub_0201B8DC
sub_0201B8DC: ; 0x0201B8DC
	ldr r2, _0201B8F8 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x16]
	bx lr
	.align 2, 0
_0201B8F8: .word 0x0380FFF4
	arm_func_end sub_0201B8DC

	arm_func_start sub_0201B8FC
sub_0201B8FC: ; 0x0201B8FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _0201B9A8
	ldr r0, _0201B9B0 ; =0x0380FFF4
	mov r1, #1
	ldr r2, [r0]
	add r0, r2, #0x500
	ldrh r0, [r0, #0x34]
	tst r0, r1, lsl r5
	bne _0201B9A8
	add r0, r2, #0x300
	ldrh r2, [r0, #0xd8]
	ldr r1, _0201B9B4 ; =0x0480425C
	mov r0, #0x1000000
	add r6, r2, r1
	bl sub_0302B118
	mov r4, r0
	cmp r5, #0
	bne _0201B96C
	add r0, r6, #4
	bl sub_0201A540
	orr r1, r0, #1
	add r0, r6, #4
	and r1, r1, #0xff
	bl sub_0201A514
	b _0201B9A0
_0201B96C:
	mov r0, r5
	bl sub_0201B8BC
	mov r5, r0
	add r0, r6, #5
	add r6, r0, r5, lsr #3
	mov r0, r6
	bl sub_0201A540
	and r1, r5, #7
	mov r2, #1
	orr r1, r0, r2, lsl r1
	mov r0, r6
	and r1, r1, #0xff
	bl sub_0201A514
_0201B9A0:
	mov r0, r4
	bl sub_0302B0E0
_0201B9A8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201B9B0: .word 0x0380FFF4
_0201B9B4: .word 0x0480425C
	arm_func_end sub_0201B8FC

	arm_func_start sub_0201B9B8
sub_0201B9B8: ; 0x0201B9B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _0201BA54
	ldr r0, _0201BA5C ; =0x0380FFF4
	ldr r2, _0201BA60 ; =0x0480425C
	ldr r1, [r0]
	mov r0, #0x1000000
	add r1, r1, #0x300
	ldrh r1, [r1, #0xd8]
	add r6, r1, r2
	bl sub_0302B118
	mov r4, r0
	cmp r5, #0
	bne _0201BA14
	add r0, r6, #4
	bl sub_0201A540
	and r1, r0, #0xfe
	add r0, r6, #4
	and r1, r1, #0xff
	bl sub_0201A514
	b _0201BA4C
_0201BA14:
	mov r0, r5
	bl sub_0201B8BC
	mov r5, r0
	add r0, r6, #5
	add r6, r0, r5, lsr #3
	mov r0, r6
	bl sub_0201A540
	and r1, r5, #7
	mov r2, #1
	mvn r1, r2, lsl r1
	and r1, r1, r0
	mov r0, r6
	and r1, r1, #0xff
	bl sub_0201A514
_0201BA4C:
	mov r0, r4
	bl sub_0302B0E0
_0201BA54:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201BA5C: .word 0x0380FFF4
_0201BA60: .word 0x0480425C
	arm_func_end sub_0201B9B8

	arm_func_start sub_0201BA64
sub_0201BA64: ; 0x0201BA64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr fp, _0201BC14 ; =0x0380FFF4
	mov sb, #0
	ldr r2, [fp]
	mov r8, #1
	ldr r1, [r2, #0x31c]
	add r0, r2, #0x500
	ldrh sl, [r0, #0x2c]
	add r0, r2, #0x12c
	add r7, r1, #0x1c
	add r5, r0, #0x400
	add r4, r2, #0x300
	b _0201BC00
_0201BA98:
	ldrh r0, [r7]
	cmp r0, #0
	beq _0201BBF0
	ldrh r1, [r7, #0x18]
	cmp r1, #0
	ldrne r0, _0201BC18 ; =0x0000FFFF
	cmpne r1, r0
	beq _0201BBEC
	sub r0, r1, #1
	strh r0, [r7, #0x18]
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	bne _0201BBEC
	ldrh r0, [r7]
	cmp r0, #0x20
	blo _0201BBD8
	mov r0, r8
	bl sub_0201B7D0
	mov r6, r0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0201B434
	mov r0, r8
	bl sub_02020550
	ldrh r0, [r4, #0x50]
	cmp r0, #1
	bne _0201BB88
	cmp r6, #0x20
	bls _0201BBD8
	ldr r1, [fp]
	mov r0, r8, lsl #0x10
	add r3, r1, #0x500
	ldrh r6, [r3, #0x34]
	mov r2, #1
	orr r2, r6, r2, lsl r8
	strh r2, [r3, #0x34]
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_0201B53C
	ldr r1, [fp]
	add r0, r7, #4
	add r3, r1, #0x500
	mov r1, #1
	ldrh r6, [r3, #0x30]
	mov r2, r1
	orr r2, r6, r2, lsl r8
	strh r2, [r3, #0x30]
	mov r2, #0
	bl sub_020216AC
	cmp r0, #0
	mov r1, #1
	beq _0201BB7C
	strh r1, [r0]
	bl sub_0202086C
	add sb, sb, #1
	b _0201BBF8
_0201BB7C:
	add r0, r7, #4
	bl sub_0201D3D4
	b _0201BBD8
_0201BB88:
	ldrh r0, [r4, #0xcc]
	cmp r8, r0
	bne _0201BBD8
	add r0, r7, #4
	mov r1, #1
	mov r2, #0
	bl sub_020216AC
	cmp r0, #0
	beq _0201BBC0
	mov r1, #1
	strh r1, [r0]
	bl sub_0202086C
	add sb, sb, #1
	b _0201BBF8
_0201BBC0:
	mov r0, #0x20
	bl sub_03028A28
	bl sub_0201982C
	add r0, r7, #4
	mov r1, #1
	bl sub_0201D3D4
_0201BBD8:
	mov r0, #0
	strh r0, [r7]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
_0201BBEC:
	add sb, sb, #1
_0201BBF0:
	cmp sb, sl
	bhs _0201BC0C
_0201BBF8:
	add r8, r8, #1
	add r7, r7, #0x1c
_0201BC00:
	ldrh r0, [r4, #0x22]
	cmp r8, r0
	blo _0201BA98
_0201BC0C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201BC14: .word 0x0380FFF4
_0201BC18: .word 0x0000FFFF
	arm_func_end sub_0201BA64

	arm_func_start sub_0201BC1C
sub_0201BC1C: ; 0x0201BC1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02020550
	ldr r2, _0201BC60 ; =0x0380FFF4
	mov r0, #0x1c
	ldr r1, [r2]
	mul r0, r4, r0
	ldr r1, [r1, #0x31c]
	mov r3, #0
	strh r3, [r1, r0]
	ldr r0, [r2]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x2c]
	sub r1, r1, #1
	strh r1, [r0, #0x2c]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201BC60: .word 0x0380FFF4
	arm_func_end sub_0201BC1C

	arm_func_start sub_0201BC64
sub_0201BC64: ; 0x0201BC64
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201BCF4 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r0]
	mov r0, #0
	add r1, r3, #0x300
	ldrh r5, [r1, #0x22]
	ldr r4, [r3, #0x31c]
	mul r2, r5, r2
	mov r1, r4
	bl sub_0302D764
	ldr r1, _0201BCF4 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x12c
	add r1, r1, #0x400
	bl sub_0302D764
	ldr r2, _0201BCF8 ; =0x0000FFFF
	mov r3, #1
	strh r2, [r4, #0x1a]
	mov r0, #0x1c
	b _0201BCCC
_0201BCC0:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x1a]
	add r3, r3, #1
_0201BCCC:
	cmp r3, r5
	blo _0201BCC0
	ldr r1, _0201BCFC ; =0x027F74A4
	mov r0, #0
	bl sub_0201BD88
	mov r0, #0
	mov r1, #0x40
	bl sub_0201B434
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201BCF4: .word 0x0380FFF4
_0201BCF8: .word 0x0000FFFF
_0201BCFC: .word 0x027F74A4
	arm_func_end sub_0201BC64

	arm_func_start sub_0201BD00
sub_0201BD00: ; 0x0201BD00
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0201BD80 ; =0x0380FFF4
	mov r6, #1
	ldr r2, [r0]
	mov sl, #0
	add r1, r2, #0x300
	add r0, r2, #0x12c
	ldr r4, [r2, #0x31c]
	ldrh r7, [r1, #0x22]
	add r5, r0, #0x400
	mov sb, #0x1a
	mov r8, #0x1c
	b _0201BD48
_0201BD34:
	mla r1, r6, r8, r4
	mov r0, sl
	mov r2, sb
	bl sub_0302D764
	add r6, r6, #1
_0201BD48:
	cmp r6, r7
	blo _0201BD34
	mov r2, #1
	strh r2, [r5]
	mov r1, #0
	strh r1, [r5, #2]
	ldr r0, _0201BD84 ; =0x0000FFFE
	strh r2, [r5, #4]
	strh r0, [r5, #6]
	strh r1, [r5, #0xc]
	strh r1, [r5, #8]
	strh r2, [r5, #0xe]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0201BD80: .word 0x0380FFF4
_0201BD84: .word 0x0000FFFE
	arm_func_end sub_0201BD00

	arm_func_start sub_0201BD88
sub_0201BD88: ; 0x0201BD88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0201BE64 ; =0x0380FFF4
	mov r7, r0
	ldr r4, [r2]
	mov r0, #0x1c
	mul r2, r7, r0
	ldr r3, [r4, #0x31c]
	mov r6, r1
	ldrh r0, [r3, r2]
	add r5, r3, r2
	cmp r0, #0
	addeq r0, r4, #0x500
	ldreqh r1, [r0, #0x2c]
	mov r2, #0x1a
	addeq r1, r1, #1
	streqh r1, [r0, #0x2c]
	mov r1, r5
	mov r0, #0
	bl sub_0302D764
	ldr r0, _0201BE64 ; =0x0380FFF4
	mov r4, #1
	ldr r1, [r0]
	mov r0, r7, lsl #0x10
	add r2, r1, #0x500
	ldrh r3, [r2, #0x34]
	mvn r1, r4, lsl r7
	and r3, r3, r1
	mov r0, r0, lsr #0x10
	mov r1, #0
	strh r3, [r2, #0x34]
	bl sub_0201B53C
	ldr r0, _0201BE64 ; =0x0380FFF4
	mov r1, r6
	ldr r2, [r0]
	add r0, r5, #4
	add r2, r2, #0x500
	ldrh r3, [r2, #0x30]
	orr r3, r3, r4, lsl r7
	strh r3, [r2, #0x30]
	bl sub_020198D0
	ldr r2, _0201BE68 ; =0x0000FFFF
	mov r0, r7, lsl #0x10
	ldr r1, _0201BE64 ; =0x0380FFF4
	strh r2, [r5, #0x14]
	ldr r1, [r1]
	mov r0, r0, lsr #0x10
	add r1, r1, #0x300
	ldrh r2, [r1, #0xa6]
	mov r1, #0x20
	strh r2, [r5, #0x10]
	ldrh r2, [r5, #0x1a]
	strh r2, [r5, #0x18]
	bl sub_0201B434
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201BE64: .word 0x0380FFF4
_0201BE68: .word 0x0000FFFF
	arm_func_end sub_0201BD88
_0201BE6C:
	.byte 0x03, 0x00, 0xA0, 0xE3
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0201BE74
sub_0201BE74: ; 0x0201BE74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _0201BED0 ; =0x0380FFF4
	mov r5, #0
	ldr r0, [r6]
	mvn r4, #0
	ldr r7, [r0, #0x1f4]
	b _0201BEC0
_0201BE90:
	ldr r0, [r0, #0x304]
	mov r1, r7
	mov r2, r5
	bl sub_0302BEC4
	cmp r0, #0
	beq _0201BEC8
	ldr r0, [r6]
	mov r1, r7
	add r0, r0, #0x1f4
	bl sub_03027F9C
	ldr r0, [r6]
	ldr r7, [r0, #0x1f4]
_0201BEC0:
	cmp r7, r4
	bne _0201BE90
_0201BEC8:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201BED0: .word 0x0380FFF4
	arm_func_end sub_0201BE74

	arm_func_start sub_0201BED4
sub_0201BED4: ; 0x0201BED4
	ldr r0, _0201BEEC ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x28]
	bx lr
	.align 2, 0
_0201BEEC: .word 0x0380FFF4
	arm_func_end sub_0201BED4

	arm_func_start sub_0201BEF0
sub_0201BEF0: ; 0x0201BEF0
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _0201BF28
	bl sub_03028988
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0201BF24
	bl sub_0201996C
_0201BF24:
	mov r0, #0
_0201BF28:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0201BEF0

	arm_func_start sub_0201BF30
sub_0201BF30: ; 0x0201BF30
	stmdb sp!, {r4, lr}
	mov r2, #9
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _0201BFCC
	ldrh r1, [r4, #0x12]
	cmp r1, #1
	movhi r0, #5
	bhi _0201BFCC
	ldrh r1, [r4, #0x14]
	cmp r1, #1
	movhi r0, #5
	bhi _0201BFCC
	bl sub_0201943C
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0201BFB8
	ldrh r0, [r4, #0x12]
	cmp r0, #1
	bne _0201BF98
	ldr r0, _0201BFD4 ; =0x00008001
	bl sub_020194D0
	b _0201BFA0
_0201BF98:
	mov r0, #0
	bl sub_020194D0
_0201BFA0:
	ldr r0, _0201BFD8 ; =0x0380FFF4
	ldrh r1, [r4, #0x14]
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r1, [r0, #0x58]
	b _0201BFC8
_0201BFB8:
	mov r0, #0x8000
	bl sub_020194D0
	mov r0, #2
	bl sub_020194A4
_0201BFC8:
	mov r0, #0
_0201BFCC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201BFD4: .word 0x00008001
_0201BFD8: .word 0x0380FFF4
	arm_func_end sub_0201BF30

	arm_func_start sub_0201BFDC
sub_0201BFDC: ; 0x0201BFDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0201C118 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	ldrh r2, [r5, #2]
	add r1, r3, #4
	add r4, r1, #0x400
	sub r1, r2, #3
	strh r1, [r4, #4]
	mov r1, #3
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r1, [r1, #0x2e]
	mov r6, r0
	cmp r1, #1
	cmpne r1, #3
	cmpne r1, #2
	movne r0, #0xb
	bne _0201C110
	ldr r0, _0201C118 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x20
	movlo r0, #1
	blo _0201C110
	ldrh r0, [r6, #0x16]
	cmp r0, #0x20
	movhi r0, #5
	bhi _0201C110
	ldrh r0, [r6, #0x38]
	cmp r0, #1
	movhi r0, #5
	bhi _0201C110
	add r0, r6, #0x3a
	bl sub_0201A540
	cmp r0, #0
	moveq r0, #5
	beq _0201C110
	ldrh r0, [r6, #0x4a]
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0201C110
	cmp r0, #0xa
	movlo r0, #5
	blo _0201C110
	ldrh r0, [r6, #0x4c]
	cmp r0, #0x10
	movhi r0, #5
	bhi _0201C110
	mov r8, #0
	add r7, r6, #0x3a
	b _0201C0D4
_0201C0B0:
	add r0, r7, r8
	bl sub_0201A540
	cmp r0, #0
	beq _0201C0DC
	bl sub_02019C94
	cmp r0, #0
	moveq r0, #5
	beq _0201C110
	add r8, r8, #1
_0201C0D4:
	cmp r8, #0x10
	blo _0201C0B0
_0201C0DC:
	add r0, r6, #0x10
	bl sub_02018D5C
	ldrh r0, [r6, #0x16]
	add r1, r6, #0x18
	bl sub_02018DC0
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r2, #0x10
	mov r0, #2
	mov r1, #0
	strh r2, [r4]
	bl sub_03027D88
	mov r0, #0x80
_0201C110:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0201C118: .word 0x0380FFF4
	arm_func_end sub_0201BFDC

	arm_func_start sub_0201C11C
sub_0201C11C: ; 0x0201C11C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0201C2CC ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #5
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	mov r6, r0
	cmp r2, #3
	add r0, r3, #0x344
	cmpne r2, #2
	add r4, r1, #0x400
	movne r0, #0xb
	bne _0201C2C4
	ldrh r0, [r0, #8]
	cmp r0, #0x20
	movlo r0, #1
	blo _0201C2C4
	mov r0, #0x20
	bl sub_03028A28
	ldrh r0, [r6, #0x18]
	tst r0, #1
	movne r0, #5
	bne _0201C2C4
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	moveq r0, #5
	beq _0201C2C4
	cmp r0, #0x20
	movhi r0, #5
	bhi _0201C2C4
	ldrh r0, [r6, #0x46]
	cmp r0, #0xa
	movlo r0, #5
	blo _0201C2C4
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0201C2C4
	ldrh r0, [r6, #0x48]
	cmp r0, #0xff
	movhi r0, #5
	bhi _0201C2C4
	ldrh r0, [r6, #0x4a]
	ldr r1, _0201C2D0 ; =0x0000FFF0
	tst r0, r1
	movne r0, #5
	bne _0201C2C4
	bl sub_02019C94
	cmp r0, #0
	moveq r0, #5
	beq _0201C2C4
	ldrh r2, [r6, #0x42]
	mov r0, #0x1000
	rsb r0, r0, #0
	tst r2, r0
	movne r0, #5
	bne _0201C2C4
	ldrh r1, [r6, #0x44]
	tst r1, r0
	movne r0, #5
	bne _0201C2C4
	cmp r2, #0
	moveq r0, #5
	beq _0201C2C4
	orrs r0, r1, r2
	moveq r0, #5
	beq _0201C2C4
	ldrh r0, [r6, #0x10]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _0201C2C4
	mov r0, #0
	bl sub_0202451C
	cmp r0, #0
	movne r0, #0xe
	bne _0201C2C4
	ldrh r0, [r6, #0x40]
	tst r0, #0x20
	beq _0201C26C
	mov r0, #1
	bl sub_02018A80
	b _0201C274
_0201C26C:
	mov r0, #0
	bl sub_02018A80
_0201C274:
	add r0, r6, #0x18
	bl sub_02018D5C
	ldrh r0, [r6, #0x1e]
	add r1, r6, #0x20
	bl sub_02018DC0
	ldrh r0, [r6, #0x46]
	bl sub_02018ED0
	ldrh r0, [r6, #0x4a]
	mov r1, #0
	bl sub_020190F0
	add r0, r6, #0x42
	bl sub_0201937C
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r2, #0x20
	mov r0, #2
	mov r1, #1
	strh r2, [r4]
	bl sub_03027D88
	mov r0, #0x80
_0201C2C4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201C2CC: .word 0x0380FFF4
_0201C2D0: .word 0x0000FFF0
	arm_func_end sub_0201C11C

	arm_func_start sub_0201C2D4
sub_0201C2D4: ; 0x0201C2D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0201C3A4 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #6
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	mov r6, r0
	cmp r2, #3
	add r0, r3, #0x344
	cmpne r2, #2
	add r4, r1, #0x400
	movne r0, #0xb
	bne _0201C39C
	ldrh r0, [r0, #8]
	cmp r0, #0x20
	movlo r0, #1
	blo _0201C39C
	ldrh r0, [r6, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0201C39C
	ldrh r0, [r6, #0x16]
	cmp r0, #1
	movhi r0, #5
	bhi _0201C39C
	ldrh r0, [r6, #0x18]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _0201C39C
	cmp r0, #0xa
	movlo r0, #5
	blo _0201C39C
	mov r0, #0x20
	bl sub_03028A28
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, #0x30
	strh r0, [r4]
	ldr r1, [r4, #0x18]
	add r0, r5, #8
	ldrh r1, [r1, #0x16]
	strh r1, [r5, #0xe]
	ldr r1, [r4, #0x18]
	add r1, r1, #0x10
	bl sub_020198D0
	bl sub_0201CD34
	mov r0, #0x80
_0201C39C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201C3A4: .word 0x0380FFF4
	arm_func_end sub_0201C2D4

	arm_func_start sub_0201C3A8
sub_0201C3A8: ; 0x0201C3A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0201C4D8 ; =0x0380FFF4
	mov r6, r1
	ldr r2, [r3]
	mov r1, #4
	strh r1, [r6, #2]
	ldr r3, [r3]
	add r1, r2, #4
	add r2, r3, #0x300
	ldrh r2, [r2, #0x2e]
	mov r7, r0
	cmp r2, #3
	cmpne r2, #2
	cmpne r2, #1
	add r5, r1, #0x400
	movne r0, #0xb
	bne _0201C4D0
	add r0, r3, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x30
	movlo r0, #1
	blo _0201C4D0
	add r0, r2, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0201C428
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0201C4D0
_0201C428:
	add r0, r6, #6
	add r1, r7, #0x10
	bl sub_020198D0
	ldrh r1, [r7, #0x16]
	add r0, r6, #6
	mov r2, #0
	bl sub_020216AC
	movs r4, r0
	moveq r0, #8
	beq _0201C4D0
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	str r4, [r5, #4]
	mov r0, #0x41
	strh r0, [r5]
	ldrh r0, [r7, #0x10]
	tst r0, #1
	beq _0201C4BC
	ldr r2, _0201C4D8 ; =0x0380FFF4
	sub r1, r4, #0x10
	ldr r0, [r2]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldr r0, [r2]
	add r0, r0, #0x188
	bl sub_0201B2D8
	ldr r0, _0201C4D8 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _0201C4CC
	mov r0, #2
	bl sub_0201F6E4
	b _0201C4CC
_0201C4BC:
	add r0, r7, #0x10
	bl sub_02020648
	mov r0, r4
	bl sub_0202086C
_0201C4CC:
	mov r0, #0x80
_0201C4D0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201C4D8: .word 0x0380FFF4
	arm_func_end sub_0201C3A8

	arm_func_start sub_0201C4DC
sub_0201C4DC: ; 0x0201C4DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0201C5B0 ; =0x0380FFF4
	mov r6, r1
	ldr r3, [r2]
	mov r1, #3
	strh r1, [r6, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	cmp r2, #3
	mov r7, r0
	cmpne r2, #2
	add r4, r3, #0x344
	add r5, r1, #0x400
	movne r0, #0xb
	bne _0201C5A8
	ldrh r0, [r4, #8]
	cmp r0, #0x30
	movlo r0, #1
	blo _0201C5A8
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0201C5A8
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	moveq r0, #5
	beq _0201C5A8
	cmp r0, #0xff
	movhi r0, #5
	bhi _0201C5A8
	ldrh r0, [r7, #0x18]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _0201C5A8
	cmp r0, #0xa
	movlo r0, #5
	blo _0201C5A8
	mov r0, #0x30
	bl sub_03028A28
	bl sub_0201982C
	ldrh r1, [r7, #0x16]
	mov r0, #0x50
	strh r1, [r4, #0x70]
	ldrh r1, [r7, #0x16]
	strh r1, [r4, #0x72]
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	strh r0, [r5]
	bl sub_0201CE58
	mov r0, #0x80
_0201C5A8:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201C5B0: .word 0x0380FFF4
	arm_func_end sub_0201C4DC

	arm_func_start sub_0201C5B4
sub_0201C5B4: ; 0x0201C5B4
	stmdb sp!, {r3, lr}
	ldr r3, _0201C670 ; =0x0380FFF4
	mov r2, #3
	ldr ip, [r3]
	strh r2, [r1, #2]
	add r2, ip, #0x300
	ldrh r3, [r2, #0x2e]
	add r2, ip, #4
	cmp r3, #3
	cmpne r3, #2
	add ip, ip, #0x344
	add lr, r2, #0x400
	movne r0, #0xb
	bne _0201C668
	ldrh r2, [ip, #8]
	cmp r2, #0x30
	movlo r0, #1
	blo _0201C668
	ldrh r2, [r0, #0x10]
	tst r2, #1
	movne r0, #5
	bne _0201C668
	ldrh r3, [r0, #0x16]
	cmp r3, #1
	movlo r0, #5
	blo _0201C668
	cmp r3, #0xff
	movhi r0, #5
	bhi _0201C668
	ldrh r2, [r0, #0x18]
	cmp r2, #0x7d0
	movhi r0, #5
	bhi _0201C668
	cmp r2, #0xa
	movlo r0, #5
	blo _0201C668
	strh r3, [ip, #0x70]
	ldrh r3, [r0, #0x16]
	mov r2, #0x60
	strh r3, [ip, #0x72]
	str r0, [lr, #0x18]
	str r1, [lr, #0x1c]
	strh r2, [lr]
	bl sub_0201CF54
	mov r0, #0x80
_0201C668:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201C670: .word 0x0380FFF4
	arm_func_end sub_0201C5B4

	arm_func_start sub_0201C674
sub_0201C674: ; 0x0201C674
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0201C77C ; =0x0380FFF4
	mov r6, r1
	ldr r2, [r3]
	mov r1, #1
	strh r1, [r6, #2]
	ldr r3, [r3]
	add r1, r2, #4
	add r2, r3, #0x300
	ldrh r2, [r2, #0x2e]
	mov r7, r0
	cmp r2, #0
	add r5, r1, #0x400
	moveq r0, #0xb
	beq _0201C774
	cmp r2, #1
	beq _0201C6C8
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0201C774
_0201C6C8:
	add r0, r3, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x40
	movne r0, #1
	bne _0201C774
	ldrh r1, [r7, #0x16]
	add r0, r7, #0x10
	bl sub_02020E94
	movs r4, r0
	moveq r0, #8
	beq _0201C774
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	str r4, [r5, #4]
	mov r0, #0x71
	strh r0, [r5]
	ldrh r0, [r7, #0x10]
	tst r0, #1
	beq _0201C760
	ldr r2, _0201C77C ; =0x0380FFF4
	sub r1, r4, #0x10
	ldr r0, [r2]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldr r0, [r2]
	add r0, r0, #0x188
	bl sub_0201B2D8
	ldr r0, _0201C77C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _0201C770
	mov r0, #2
	bl sub_0201F6E4
	b _0201C770
_0201C760:
	add r0, r7, #0x10
	bl sub_02020648
	mov r0, r4
	bl sub_0202086C
_0201C770:
	mov r0, #0x80
_0201C774:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201C77C: .word 0x0380FFF4
	arm_func_end sub_0201C674

	arm_func_start sub_0201C780
sub_0201C780: ; 0x0201C780
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0201C914 ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r3]
	mov r6, r0
	strh r2, [r1, #2]
	add r5, r3, #0x31c
	ldrh r0, [r5, #0x12]
	add r4, r3, #0x344
	cmp r0, #1
	cmpne r0, #0
	movne r0, #0xb
	bne _0201C90C
	ldrh r0, [r4, #8]
	cmp r0, #0x20
	movne r0, #1
	bne _0201C90C
	ldrh r0, [r6, #0x10]
	cmp r0, #0x20
	movhi r0, #5
	bhi _0201C90C
	cmp r0, #0
	moveq r0, #5
	beq _0201C90C
	ldrh r0, [r6, #0x32]
	cmp r0, #0xa
	movlo r0, #5
	blo _0201C90C
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0201C90C
	ldrh r0, [r6, #0x34]
	cmp r0, #0
	moveq r0, #5
	beq _0201C90C
	cmp r0, #0xff
	movhi r0, #5
	bhi _0201C90C
	ldrh r0, [r6, #0x36]
	ldr r1, _0201C918 ; =0x0000FFF0
	tst r0, r1
	movne r0, #5
	bne _0201C90C
	bl sub_02019C94
	cmp r0, #0
	moveq r0, #5
	beq _0201C90C
	ldrh r1, [r6, #0x38]
	cmp r1, #0
	moveq r0, #5
	beq _0201C90C
	mov r0, #0x1000
	rsb r0, r0, #0
	tst r1, r0
	movne r0, #5
	bne _0201C90C
	ldrh r1, [r6, #0x3a]
	cmp r1, #0
	moveq r0, #5
	beq _0201C90C
	tst r1, r0
	movne r0, #5
	bne _0201C90C
	ldrh r0, [r6, #0x3c]
	cmp r0, #0x80
	movhi r0, #5
	bhi _0201C90C
	mov r0, #0
	bl sub_0202451C
	cmp r0, #0
	movne r0, #0xe
	bne _0201C90C
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	bne _0201C8B8
	ldr r0, _0201C91C ; =0x027F74A4
	bl sub_02018D5C
	b _0201C8C0
_0201C8B8:
	add r0, r5, #8
	bl sub_02018D5C
_0201C8C0:
	ldrh r0, [r6, #0x10]
	add r1, r6, #0x12
	bl sub_02018DC0
	ldrh r0, [r6, #0x32]
	bl sub_02018ED0
	ldrh r0, [r6, #0x34]
	bl sub_02018F28
	ldrh r0, [r6, #0x36]
	mov r1, #0
	bl sub_020190F0
	add r0, r6, #0x38
	bl sub_0201937C
	ldrh r0, [r6, #0x3c]
	add r1, r6, #0x3e
	bl sub_02019700
	mov r0, #0
	strh r0, [r4, #0xa4]
	bl sub_030285D0
	mov r0, #0
_0201C90C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201C914: .word 0x0380FFF4
_0201C918: .word 0x0000FFF0
_0201C91C: .word 0x027F74A4
	arm_func_end sub_0201C780

	arm_func_start sub_0201C920
sub_0201C920: ; 0x0201C920
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0201CA00 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #0x12
	strh r1, [r5, #2]
	ldr r2, [r2]
	add r1, r3, #4
	add r2, r2, #0x300
	ldrh r2, [r2, #0x4c]
	mov r6, r0
	cmp r2, #0x20
	add r4, r1, #0x400
	movne r0, #1
	bne _0201C9F8
	ldrh r0, [r6, #0x12]
	cmp r0, #3
	movhi r0, #5
	bhi _0201C9F8
	ldrh r0, [r6, #0x14]
	cmp r0, #0x3f
	movhi r0, #5
	bhi _0201C9F8
	ldrh r0, [r6, #0x16]
	cmp r0, #0
	moveq r0, #5
	beq _0201C9F8
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0201C9F8
	mov r8, #0
	add r7, r6, #0x18
	b _0201C9C8
_0201C9A4:
	add r0, r7, r8
	bl sub_0201A540
	cmp r0, #0
	beq _0201C9D0
	bl sub_02019C94
	cmp r0, #0
	moveq r0, #5
	beq _0201C9F8
	add r8, r8, #1
_0201C9C8:
	cmp r8, #0x10
	blo _0201C9A4
_0201C9D0:
	cmp r8, #0
	moveq r0, #5
	beq _0201C9F8
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, #0x80
	strh r0, [r4]
	strh r0, [r5, #4]
	bl sub_0201D048
	mov r0, #0x80
_0201C9F8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0201CA00: .word 0x0380FFF4
	arm_func_end sub_0201C920

	arm_func_start sub_0201CA04
sub_0201CA04: ; 0x0201CA04
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0201CBEC ; =0x0380FFF4
	mov r6, #0
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	sub r1, r1, #0x10
	cmp r1, #5
	add r4, r0, #0x400
	add r5, r2, #0x344
	addls pc, pc, r1, lsl #2
	b _0201CBD0
_0201CA38: ; jump table
	b _0201CA50 ; case 0
	b _0201CAC8 ; case 1
	b _0201CB58 ; case 2
	b _0201CB58 ; case 3
	b _0201CBD0 ; case 4
	b _0201CBB0 ; case 5
_0201CA50:
	mov r0, #0x20
	bl sub_03028A28
	mov r0, #2
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x1c]
	mov r1, r6
	strh r1, [r0, #8]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #6]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	ldr r1, [r4, #0x18]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	ldrh r0, [r1, #0x4a]
	bne _0201CAB8
	add r1, r0, #3
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	movlo r0, #0xa
	strloh r0, [r4, #0xc]
	b _0201CABC
_0201CAB8:
	strh r0, [r4, #0xc]
_0201CABC:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_0201CAC8:
	ldr r1, [r4, #0x18]
	ldrh r0, [r4, #6]
	add r1, r1, #0x3a
	add r0, r1, r0
	bl sub_0201A540
	movs r5, r0
	moveq r0, #0x15
	streqh r0, [r4]
	moveq r6, #1
	beq _0201CBD0
	ldrh r1, [r4, #6]
	mov r0, #0
	add r1, r1, #1
	strh r1, [r4, #6]
	strh r0, [r4, #0xa]
	bl sub_0202451C
	cmp r0, #0
	beq _0201CB2C
	ldr r0, [r4, #0x1c]
	mov r1, #0xe
	strh r1, [r0, #4]
	mov r0, #0x15
	strh r0, [r4]
	mov r6, #1
	b _0201CBD0
_0201CB2C:
	ldrh r0, [r4]
	mov r1, #0
	cmp r0, #0x10
	mov r0, r5
	bne _0201CB4C
	bl sub_020190F0
	bl sub_030285D0
	b _0201CB50
_0201CB4C:
	bl sub_020190F0
_0201CB50:
	mov r0, #0x12
	strh r0, [r4]
_0201CB58:
	mov r0, #0x13
	strh r0, [r4]
	ldr r1, [r4, #0x18]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	bne _0201CBA0
	add r0, r1, #0x10
	bl sub_02021340
	cmp r0, #0
	bne _0201CB9C
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r0, #0x15
	strh r0, [r4]
	mov r6, #1
	b _0201CBD0
_0201CB9C:
	bl sub_0202086C
_0201CBA0:
	ldrh r0, [r4, #0xc]
	ldr r1, _0201CBF0 ; =0x027ED404
	bl sub_0201A2DC
	b _0201CBD0
_0201CBB0:
	strh r6, [r4]
	bl sub_03028988
	ldr r0, _0201CBEC ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2e]
	strh r0, [r5, #0xc]
	bl sub_0201D304
_0201CBD0:
	cmp r6, #0
	beq _0201CBE4
	mov r0, #2
	mov r1, #0
	bl sub_03027D88
_0201CBE4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201CBEC: .word 0x0380FFF4
_0201CBF0: .word 0x027ED404
	arm_func_end sub_0201CA04
_0201CBF4:
	.byte 0x54, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x04, 0x00, 0x80, 0xE2
	.byte 0x01, 0x2B, 0x80, 0xE2, 0xBA, 0x10, 0xD2, 0xE1, 0xBC, 0x00, 0xD2, 0xE1, 0x00, 0x00, 0x81, 0xE0
	.byte 0xBA, 0x00, 0xC2, 0xE1, 0x18, 0x00, 0x92, 0xE5, 0xBA, 0x10, 0xD2, 0xE1, 0xBA, 0x04, 0xD0, 0xE1
	.byte 0x00, 0x00, 0x51, 0xE1, 0x05, 0x00, 0x00, 0x3A, 0xB6, 0x00, 0xD2, 0xE1, 0x10, 0x00, 0x50, 0xE3
	.byte 0x11, 0x00, 0xA0, 0x33, 0xB0, 0x00, 0xC2, 0x31, 0x15, 0x00, 0xA0, 0x23, 0xB0, 0x00, 0xC2, 0x21
	.byte 0x0C, 0xC0, 0x9F, 0xE5, 0x02, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x98, 0x85, 0x7F, 0x03, 0x10, 0x40, 0x2D, 0xE9, 0x8C, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x20, 0x90, 0xE5, 0x01, 0x0B, 0x82, 0xE2, 0xB4, 0x10, 0xD0, 0xE1, 0x04, 0x00, 0x82, 0xE2
	.byte 0x20, 0x00, 0x51, 0xE3, 0x01, 0x4B, 0x80, 0xE2, 0x02, 0x00, 0x00, 0x0A, 0x25, 0x00, 0x51, 0xE3
	.byte 0x0B, 0x00, 0x00, 0x0A, 0x17, 0x00, 0x00, 0xEA, 0x50, 0x2E, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xB4, 0x00, 0xC4, 0xE1, 0xB6, 0x00, 0xC4, 0xE1, 0x21, 0x00, 0xA0, 0xE3, 0xB0, 0x00, 0xC4, 0xE1
	.byte 0x18, 0x00, 0x94, 0xE5, 0x48, 0x10, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1, 0x8A, 0xF5, 0xFF, 0xEB
	.byte 0x0C, 0x00, 0x00, 0xEA, 0xB4, 0x10, 0xD4, 0xE1, 0x1C, 0x00, 0x94, 0xE5, 0xB4, 0x10, 0xC0, 0xE1
	.byte 0xB6, 0x10, 0xD4, 0xE1, 0x1C, 0x00, 0x94, 0xE5, 0xB6, 0x10, 0xC0, 0xE1, 0xB4, 0x00, 0xD4, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x2A, 0x2F, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xB0, 0x00, 0xC4, 0xE1, 0x86, 0x01, 0x00, 0xEB, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x08, 0xD5, 0x7E, 0x02, 0x2C, 0x00, 0x9F, 0xE5, 0x2C, 0xC0, 0x9F, 0xE5
	.byte 0x00, 0x20, 0x90, 0xE5, 0x07, 0x10, 0xA0, 0xE3, 0x04, 0x00, 0x82, 0xE2, 0x01, 0x0B, 0x80, 0xE2
	.byte 0xB4, 0x10, 0xC0, 0xE1, 0x25, 0x30, 0xA0, 0xE3, 0x01, 0x2B, 0x82, 0xE2, 0x02, 0x00, 0xA0, 0xE3
	.byte 0x01, 0x10, 0xA0, 0xE3, 0xB4, 0x30, 0xC2, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x98, 0x85, 0x7F, 0x03

	arm_func_start sub_0201CD34
sub_0201CD34: ; 0x0201CD34
	stmdb sp!, {r4, lr}
	ldr r0, _0201CE10 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x30
	add r4, r0, #0x400
	beq _0201CD64
	cmp r1, #0x35
	beq _0201CDE0
	b _0201CE08
_0201CD64:
	ldr r0, [r4, #0x18]
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x10
	bl sub_020215EC
	cmp r0, #0
	bne _0201CDA4
	ldr r1, [r4, #0x1c]
	mov r2, #8
	mov r0, #2
	strh r2, [r1, #4]
	mov r2, #0x35
	mov r1, r0
	strh r2, [r4]
	bl sub_03027D88
	b _0201CE08
_0201CDA4:
	ldr r1, [r4, #0x18]
	mov r2, #1
	ldrh r3, [r1, #0x16]
	mov r1, #0
	strh r3, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r1, [r0, #0x30]
	mov r1, #0x31
	strh r1, [r4]
	bl sub_0202086C
	ldr r0, [r4, #0x18]
	ldr r1, _0201CE14 ; =0x027ED628
	ldrh r0, [r0, #0x18]
	bl sub_0201A2DC
	b _0201CE08
_0201CDE0:
	mov r0, #1
	bl sub_020204C4
	mov r0, #1
	bl sub_02020460
	mov r0, #1
	mov r1, #0
	bl sub_020207E0
	mov r0, #0
	strh r0, [r4]
	bl sub_0201D304
_0201CE08:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201CE10: .word 0x0380FFF4
_0201CE14: .word 0x027ED628
	arm_func_end sub_0201CD34

	arm_func_start sub_0201CE18
sub_0201CE18: ; 0x0201CE18
	stmdb sp!, {r3, lr}
	ldr r1, _0201CE54 ; =0x0380FFF4
	mov r0, #2
	ldr ip, [r1]
	mov r3, #7
	add r1, ip, #4
	ldr r2, [r1, #0x41c]
	mov r1, r0
	strh r3, [r2, #4]
	add r2, ip, #0x400
	mov r3, #0x35
	strh r3, [r2, #4]
	bl sub_03027D88
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201CE54: .word 0x0380FFF4
	arm_func_end sub_0201CE18

	arm_func_start sub_0201CE58
sub_0201CE58: ; 0x0201CE58
	stmdb sp!, {r4, lr}
	ldr r0, _0201CF10 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x50
	add r4, r0, #0x400
	beq _0201CE88
	cmp r1, #0x53
	beq _0201CEE0
	b _0201CF08
_0201CE88:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x10
	bl sub_02020F10
	cmp r0, #0
	bne _0201CEC0
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r2, #0x53
	mov r0, #2
	mov r1, #3
	strh r2, [r4]
	bl sub_03027D88
	b _0201CF08
_0201CEC0:
	mov r1, #0x51
	strh r1, [r4]
	bl sub_0202086C
	ldr r0, [r4, #0x18]
	ldr r1, _0201CF14 ; =0x027ED728
	ldrh r0, [r0, #0x18]
	bl sub_0201A2DC
	b _0201CF08
_0201CEE0:
	mov r0, #1
	bl sub_020204C4
	mov r0, #1
	bl sub_02020460
	mov r0, #1
	mov r1, #0
	bl sub_020207E0
	mov r0, #0
	strh r0, [r4]
	bl sub_0201D304
_0201CF08:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201CF10: .word 0x0380FFF4
_0201CF14: .word 0x027ED728
	arm_func_end sub_0201CE58
_0201CF18:
	.byte 0x2C, 0x00, 0x9F, 0xE5, 0x2C, 0xC0, 0x9F, 0xE5
	.byte 0x00, 0x20, 0x90, 0xE5, 0x07, 0x10, 0xA0, 0xE3, 0x04, 0x00, 0x82, 0xE2, 0x1C, 0x04, 0x90, 0xE5
	.byte 0x53, 0x30, 0xA0, 0xE3, 0xB4, 0x10, 0xC0, 0xE1, 0x01, 0x2B, 0x82, 0xE2, 0x02, 0x00, 0xA0, 0xE3
	.byte 0x03, 0x10, 0xA0, 0xE3, 0xB4, 0x30, 0xC2, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x98, 0x85, 0x7F, 0x03

	arm_func_start sub_0201CF54
sub_0201CF54: ; 0x0201CF54
	stmdb sp!, {r4, lr}
	ldr r0, _0201D004 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x60
	add r4, r0, #0x400
	beq _0201CF84
	cmp r1, #0x63
	beq _0201CFDC
	b _0201CFFC
_0201CF84:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x10
	bl sub_02020FB8
	cmp r0, #0
	bne _0201CFBC
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r2, #0x63
	mov r0, #2
	mov r1, #4
	strh r2, [r4]
	bl sub_03027D88
	b _0201CFFC
_0201CFBC:
	mov r1, #0x61
	strh r1, [r4]
	bl sub_0202086C
	ldr r0, [r4, #0x18]
	ldr r1, _0201D008 ; =0x027ED81C
	ldrh r0, [r0, #0x18]
	bl sub_0201A2DC
	b _0201CFFC
_0201CFDC:
	mov r0, #1
	bl sub_02020460
	mov r0, #1
	mov r1, #0
	bl sub_020207E0
	mov r0, #0
	strh r0, [r4]
	bl sub_0201D304
_0201CFFC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201D004: .word 0x0380FFF4
_0201D008: .word 0x027ED81C
	arm_func_end sub_0201CF54
_0201D00C:
	.byte 0x2C, 0x00, 0x9F, 0xE5
	.byte 0x2C, 0xC0, 0x9F, 0xE5, 0x00, 0x20, 0x90, 0xE5, 0x07, 0x10, 0xA0, 0xE3, 0x04, 0x00, 0x82, 0xE2
	.byte 0x1C, 0x04, 0x90, 0xE5, 0x63, 0x30, 0xA0, 0xE3, 0xB4, 0x10, 0xC0, 0xE1, 0x01, 0x2B, 0x82, 0xE2
	.byte 0x02, 0x00, 0xA0, 0xE3, 0x04, 0x10, 0xA0, 0xE3, 0xB4, 0x30, 0xC2, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x98, 0x85, 0x7F, 0x03

	arm_func_start sub_0201D048
sub_0201D048: ; 0x0201D048
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201D2A8 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	sub r1, r1, #0x80
	cmp r1, #4
	add r4, r2, #0x344
	add r5, r0, #0x400
	addls pc, pc, r1, lsl #2
	b _0201D288
_0201D078: ; jump table
	b _0201D08C ; case 0
	b _0201D0CC ; case 1
	b _0201D180 ; case 2
	b _0201D1A8 ; case 3
	b _0201D214 ; case 4
_0201D08C:
	mov r0, #0
	strh r0, [r5, #0x14]
	mov r0, #0x13
	bl sub_02019DB4
	strh r0, [r5, #0xe]
	mov r0, #0x35
	bl sub_02019DB4
	strh r0, [r5, #0x10]
	ldr r1, [r5, #0x18]
	ldrh r0, [r1, #0x12]
	ldrh r1, [r1, #0x14]
	bl sub_02018B4C
	mov r0, #4
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r5, #0x16]
_0201D0CC:
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5, #8]
	ldr r1, [r5, #0x18]
	ldrh r0, [r5, #0x14]
	add r1, r1, #0x18
	add r0, r1, r0
	bl sub_0201A540
	movs r4, r0
	beq _0201D100
	ldrh r0, [r5, #0x14]
	cmp r0, #0x10
	blo _0201D10C
_0201D100:
	mov r0, #0x84
	strh r0, [r5]
	b _0201D288
_0201D10C:
	mov r0, #0
	bl sub_0202451C
	cmp r0, #0
	movne r0, #0xe
	strneh r0, [r5, #0x16]
	movne r0, #0x84
	strneh r0, [r5]
	bne _0201D288
	ldrh r0, [r5]
	mov r1, #0
	cmp r0, #0x80
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bne _0201D164
	bl sub_020190F0
	bl sub_030285D0
	ldr r1, _0201D2AC ; =0x04808040
	mov r0, #0x8000
	ldrh r1, [r1]
	strh r1, [r5, #0xc]
	bl sub_020194D0
	b _0201D168
_0201D164:
	bl sub_020190F0
_0201D168:
	mov r0, #0x82
	strh r0, [r5]
	ldr r0, [r5, #0x18]
	ldr r1, _0201D2B0 ; =0x027EDAC8
	ldrh r0, [r0, #0x16]
	bl sub_0201A2DC
_0201D180:
	ldr r1, [r5, #4]
	ldr r0, _0201D2B4 ; =0x0480819C
	add r1, r1, #1
	str r1, [r5, #4]
	ldrh r0, [r0]
	tst r0, #1
	ldrne r0, [r5, #8]
	addne r0, r0, #0x64
	strne r0, [r5, #8]
	b _0201D288
_0201D1A8:
	ldr r1, [r5, #0x18]
	ldrh r0, [r5, #0x14]
	add r1, r1, #0x18
	add r0, r1, r0
	bl sub_0201A540
	ldr r1, [r5, #4]
	mov r4, r0
	cmp r1, #0
	ldrne r0, [r5, #8]
	mov r2, #0
	cmpne r0, #0
	beq _0201D1E8
	bl sub_030365C4
	add r2, r0, #1
	cmp r2, #0x64
	movhi r2, #0x64
_0201D1E8:
	ldr r1, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	orr r2, r4, r2, lsl #8
	add r0, r1, r0, lsl #1
	strh r2, [r0, #8]
	ldrh r1, [r5, #0x14]
	mov r0, #0x81
	add r1, r1, #1
	strh r1, [r5, #0x14]
	strh r0, [r5]
	b _0201D288
_0201D214:
	bl sub_03028988
	ldr r1, _0201D2A8 ; =0x0380FFF4
	mov r0, #0x13
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	strh r1, [r4, #0xc]
	ldrh r1, [r5, #0xe]
	bl sub_02019DE0
	ldrh r1, [r5, #0x10]
	mov r0, #0x35
	bl sub_02019DE0
	ldrh r0, [r5, #0xc]
	bl sub_020194D0
	ldrh r2, [r5, #0x16]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strh r2, [r1, #4]
	strh r0, [r5]
	ldrh r2, [r5, #0x14]
	mov r1, r0
	b _0201D27C
_0201D26C:
	ldr r0, [r5, #0x1c]
	add r0, r0, r2, lsl #1
	strh r1, [r0, #8]
	add r2, r2, #1
_0201D27C:
	cmp r2, #0x10
	blo _0201D26C
	bl sub_0201D304
_0201D288:
	ldrh r0, [r5]
	cmp r0, #0
	beq _0201D2A0
	mov r0, #2
	mov r1, #5
	bl sub_03027D88
_0201D2A0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201D2A8: .word 0x0380FFF4
_0201D2AC: .word 0x04808040
_0201D2B0: .word 0x027EDAC8
_0201D2B4: .word 0x0480819C
	arm_func_end sub_0201D048
_0201D2B8:
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x1C, 0xC0, 0x9F, 0xE5
	.byte 0x00, 0x10, 0x90, 0xE5, 0x83, 0x30, 0xA0, 0xE3, 0x01, 0x2B, 0x81, 0xE2, 0x02, 0x00, 0xA0, 0xE3
	.byte 0x05, 0x10, 0xA0, 0xE3, 0xB4, 0x30, 0xC2, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x98, 0x85, 0x7F, 0x03, 0x10, 0x00, 0x9F, 0xE5, 0x10, 0xC0, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5
	.byte 0xC6, 0x00, 0x80, 0xE2, 0x03, 0x0C, 0x80, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0xC0, 0xDE, 0x7E, 0x02

	arm_func_start sub_0201D304
sub_0201D304: ; 0x0201D304
	stmdb sp!, {r4, lr}
	ldr r0, _0201D354 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x24
	add r1, r0, #0x400
	ldrh r0, [r1, #4]
	add r4, r2, #0x17c
	bic r0, r0, #1
	strh r0, [r1, #4]
	ldr r1, [r2, #0x424]
	add r0, r4, #0x84
	bl sub_03028548
	ldrh r0, [r4, #0x8c]
	cmp r0, #0
	beq _0201D34C
	mov r0, #2
	mov r1, #0xb
	bl sub_03027D88
_0201D34C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201D354: .word 0x0380FFF4
	arm_func_end sub_0201D304

	arm_func_start sub_0201D358
sub_0201D358: ; 0x0201D358
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0201D3D0 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_0302805C
	movs r4, r0
	bne _0201D390
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D3C8
_0201D390:
	mov r0, #0x84
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_020198D0
	ldr r0, _0201D3D0 ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D3C8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201D3D0: .word 0x0380FFF4
	arm_func_end sub_0201D358

	arm_func_start sub_0201D3D4
sub_0201D3D4: ; 0x0201D3D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0201D44C ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_0302805C
	movs r4, r0
	bne _0201D40C
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D444
_0201D40C:
	mov r0, #0x85
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_020198D0
	ldr r0, _0201D44C ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D444:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201D44C: .word 0x0380FFF4
	arm_func_end sub_0201D3D4

	arm_func_start sub_0201D450
sub_0201D450: ; 0x0201D450
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0201D540 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r3]
	mov r7, r0
	add r0, r1, #0x188
	mov r1, #0x3a
	mov r6, r2
	bl sub_0302805C
	movs r4, r0
	bne _0201D48C
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D538
_0201D48C:
	mov r0, #0x86
	strh r0, [r4, #0xc]
	mov r2, #0x15
	mov r1, r7
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_020198D0
	ldr r1, _0201D544 ; =0x00000FFF
	add r0, r6, #1
	and r1, r5, r1
	strh r1, [r4, #0x16]
	bl sub_0201A540
	add r7, r6, #2
	strh r0, [r4, #0x18]
	mov r5, #0
	add r6, r4, #0x1a
	b _0201D4F0
_0201D4D0:
	cmp r5, #0x20
	bhs _0201D4FC
	add r0, r7, r5
	bl sub_0201A540
	mov r1, r0
	add r0, r6, r5
	bl sub_0201A514
	add r5, r5, #1
_0201D4F0:
	ldrh r0, [r4, #0x18]
	cmp r5, r0
	blo _0201D4D0
_0201D4FC:
	add r7, r4, #0x1a
	mov r6, #0
	b _0201D518
_0201D508:
	mov r1, r6
	add r0, r7, r5
	bl sub_0201A514
	add r5, r5, #1
_0201D518:
	cmp r5, #0x20
	blo _0201D508
	ldr r0, _0201D540 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D538:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201D540: .word 0x0380FFF4
_0201D544: .word 0x00000FFF
	arm_func_end sub_0201D450

	arm_func_start sub_0201D548
sub_0201D548: ; 0x0201D548
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0201D630 ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r7, r0
	add r0, r1, #0x188
	mov r1, #0x3a
	mov r5, r2
	bl sub_0302805C
	movs r4, r0
	bne _0201D584
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D628
_0201D584:
	mov r0, #0x87
	strh r0, [r4, #0xc]
	mov r0, #0x15
	strh r0, [r4, #0xe]
	mov r1, r7
	add r0, r4, #0x10
	bl sub_020198D0
	strh r6, [r4, #0x16]
	add r0, r5, #1
	bl sub_0201A540
	add r6, r5, #2
	strh r0, [r4, #0x18]
	mov r7, #0
	add r5, r4, #0x1a
	b _0201D5E0
_0201D5C0:
	cmp r7, #0x20
	bhs _0201D5EC
	add r0, r6, r7
	bl sub_0201A540
	mov r1, r0
	add r0, r5, r7
	bl sub_0201A514
	add r7, r7, #1
_0201D5E0:
	ldrh r0, [r4, #0x18]
	cmp r7, r0
	blo _0201D5C0
_0201D5EC:
	add r6, r4, #0x1a
	mov r5, #0
	b _0201D608
_0201D5F8:
	mov r1, r5
	add r0, r6, r7
	bl sub_0201A514
	add r7, r7, #1
_0201D608:
	cmp r7, #0x20
	blo _0201D5F8
	ldr r0, _0201D630 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D628:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201D630: .word 0x0380FFF4
	arm_func_end sub_0201D548

	arm_func_start sub_0201D634
sub_0201D634: ; 0x0201D634
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0201D6AC ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_0302805C
	movs r4, r0
	bne _0201D66C
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D6A4
_0201D66C:
	mov r0, #0x88
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_020198D0
	ldr r0, _0201D6AC ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D6A4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0201D6AC: .word 0x0380FFF4
	arm_func_end sub_0201D634

	arm_func_start sub_0201D6B0
sub_0201D6B0: ; 0x0201D6B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0201D720 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0x16
	add r0, r0, #0x188
	bl sub_0302805C
	movs r4, r0
	bne _0201D6E4
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D718
_0201D6E4:
	mov r0, #0x8b
	strh r0, [r4, #0xc]
	mov r2, #3
	mov r1, r5
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_020198D0
	ldr r0, _0201D720 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D718:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201D720: .word 0x0380FFF4
	arm_func_end sub_0201D6B0

	arm_func_start sub_0201D724
sub_0201D724: ; 0x0201D724
	stmdb sp!, {r3, lr}
	ldr r0, _0201D780 ; =0x0380FFF4
	mov r1, #0x10
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0302805C
	movs r1, r0
	bne _0201D754
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D778
_0201D754:
	mov r0, #0x8c
	strh r0, [r1, #0xc]
	mov r2, #0
	ldr r0, _0201D780 ; =0x0380FFF4
	strh r2, [r1, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D778:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201D780: .word 0x0380FFF4
	arm_func_end sub_0201D724

	arm_func_start sub_0201D784
sub_0201D784: ; 0x0201D784
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0201D89C ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	add r0, r2, #0x300
	ldrh r1, [r0, #0xe4]
	add r0, r2, #0x188
	add r1, r1, #0x3e
	add r4, r2, #0x344
	bl sub_0302805C
	movs r5, r0
	bne _0201D7C4
	mov r0, #1
	bl sub_0201A85C
	mov r0, #0
	b _0201D894
_0201D7C4:
	mov r0, #0x8d
	strh r0, [r5, #0xc]
	ldrh r1, [r4, #0xa0]
	add r0, r5, #0x1f
	add r1, r1, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #0x16
	strh r1, [r5, #0xe]
	ldrh r1, [r6, #0x12]
	and r1, r1, #0xff
	bl sub_0201A514
	ldrh r1, [r6, #0xe]
	add r0, r5, #0x1e
	and r1, r1, #0xff
	bl sub_0201A514
	add r0, r5, #0x2e
	add r1, r6, #0x1e
	bl sub_020198D0
	ldrh r2, [r4, #0xa0]
	strh r2, [r5, #0x16]
	cmp r2, #0
	beq _0201D87C
	ldrh r0, [r4, #0xa2]
	tst r0, #1
	ldr r0, [r4, #0x9c]
	beq _0201D870
	add r7, r5, #0x3c
	add r6, r0, #1
	mov r4, #0
	b _0201D860
_0201D840:
	mov r0, r6
	bl sub_0201A540
	mov r1, r0
	mov r0, r7
	bl sub_0201A514
	add r6, r6, #1
	add r7, r7, #1
	add r4, r4, #1
_0201D860:
	ldrh r0, [r5, #0x16]
	cmp r4, r0
	blo _0201D840
	b _0201D87C
_0201D870:
	add r1, r5, #0x3c
	add r2, r2, #1
	bl sub_0302D78C
_0201D87C:
	ldr r0, _0201D89C ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #1
_0201D894:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0201D89C: .word 0x0380FFF4
	arm_func_end sub_0201D784

	arm_func_start sub_0201D8A0
sub_0201D8A0: ; 0x0201D8A0
	ldr r1, _0201D8C0 ; =0x0380FFF4
	ldr ip, _0201D8C4 ; =sub_037FDF74
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #4
	mov r2, #0x20
	add r1, r1, #0x400
	bx ip
	.align 2, 0
_0201D8C0: .word 0x0380FFF4
_0201D8C4: .word sub_037FDF74
	arm_func_end sub_0201D8A0

	arm_func_start sub_0201D8C8
sub_0201D8C8: ; 0x0201D8C8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0201D9B0 ; =0x0380FFF4
	mov r5, r0
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _0201D9A8
	add r0, r5, #0x10
	bl sub_0201864C
	mov r4, r0
	ldrh r0, [r5, #0x16]
	bl sub_020186AC
	orr r4, r4, r0
	ldrh r0, [r5, #0x18]
	bl sub_020186E0
	orr r4, r4, r0
	ldrh r0, [r5, #0x1c]
	bl sub_02018720
	orr r4, r4, r0
	ldrh r0, [r5, #0x1e]
	bl sub_020187A0
	orr r4, r4, r0
	ldrh r0, [r5, #0x20]
	bl sub_020187D4
	orr r4, r4, r0
	ldrh r0, [r5, #0x22]
	bl sub_02018874
	orr r4, r4, r0
	add r0, r5, #0x24
	bl sub_02018898
	orr r4, r4, r0
	ldrh r0, [r5, #0x74]
	bl sub_020188F8
	orr r4, r4, r0
	ldrh r0, [r5, #0x76]
	bl sub_02018930
	orr r4, r4, r0
	ldrh r0, [r5, #0x78]
	bl sub_02018968
	orr r4, r4, r0
	ldrh r0, [r5, #0x7a]
	mov r1, #0
	bl sub_020189A0
	orr r4, r4, r0
	add r0, r5, #0x7c
	bl sub_02018A50
	orr r4, r4, r0
	ldrh r0, [r5, #0x9c]
	bl sub_02018A80
	orr r4, r4, r0
	ldrh r0, [r5, #0x9e]
	bl sub_02018B28
	orr r0, r4, r0
_0201D9A8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201D9B0: .word 0x0380FFF4
	arm_func_end sub_0201D8C8

	arm_func_start sub_0201D9B4
sub_0201D9B4: ; 0x0201D9B4
	stmdb sp!, {r3, lr}
	ldr r2, _0201D9F0 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _0201D9E4
	add r0, r0, #0x10
	bl sub_0201864C
	mov r3, r0
_0201D9E4:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0201D9F0: .word 0x0380FFF4
	arm_func_end sub_0201D9B4
_0201D9F4:
	.byte 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0xBC, 0x8E, 0x7E, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x10, 0x00, 0x51, 0xE3, 0x02, 0x00, 0x00, 0x1A
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0x29, 0xEB, 0xFF, 0xEB, 0x00, 0x30, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE1
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x40, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x24, 0xD1, 0xE1, 0x20, 0x00, 0x52, 0xE3, 0x03, 0x00, 0xA0, 0x81
	.byte 0x06, 0x00, 0x00, 0x8A, 0x03, 0x00, 0x00, 0x1A, 0xB6, 0x15, 0xD1, 0xE1, 0x00, 0x00, 0x51, 0xE3
	.byte 0x03, 0x00, 0xA0, 0x11, 0x01, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD0, 0xE1, 0x23, 0xEB, 0xFF, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x01, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xB0, 0x8F, 0x7E, 0x02, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0xE4, 0x8F, 0x7E, 0x02, 0x01, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x84, 0x90, 0x7E, 0x02, 0x0C, 0xC0, 0x9F, 0xE5, 0x01, 0x20, 0xA0, 0xE3, 0x10, 0x00, 0x80, 0xE2
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0xA8, 0x90, 0x7E, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x20, 0x00, 0x51, 0xE3, 0x02, 0x00, 0x00, 0x8A
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0x73, 0xEB, 0xFF, 0xEB, 0x00, 0x30, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE1
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x01, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x40, 0x91, 0x7E, 0x02, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0x78, 0x91, 0x7E, 0x02, 0x01, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x08, 0xC0, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0xB0, 0x91, 0x7E, 0x02, 0x0C, 0xC0, 0x9F, 0xE5, 0x01, 0x20, 0xA0, 0xE3
	.byte 0x10, 0x00, 0x80, 0xE2, 0xB2, 0x20, 0xC1, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0x60, 0x92, 0x7E, 0x02
	.byte 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0x90, 0x92, 0x7E, 0x02, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0xB0, 0x01, 0xD0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1, 0x38, 0x93, 0x7E, 0x02
	.byte 0x38, 0x40, 0x2D, 0xE9, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x50, 0xA0, 0xE1
	.byte 0xB4, 0x01, 0xD5, 0xE1, 0x3F, 0x00, 0x50, 0xE3, 0x05, 0x00, 0xA0, 0x83, 0x08, 0x00, 0x00, 0x8A
	.byte 0xB0, 0x01, 0xD5, 0xE1, 0xB2, 0x11, 0xD5, 0xE1, 0xD3, 0xEB, 0xFF, 0xEB, 0x00, 0x40, 0xB0, 0xE1
	.byte 0x02, 0x00, 0x00, 0x1A, 0xB4, 0x11, 0xD5, 0xE1, 0x2E, 0x00, 0xA0, 0xE3, 0x73, 0xF0, 0xFF, 0xEB
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0201DC1C
sub_0201DC1C: ; 0x0201DC1C
	stmdb sp!, {r4, lr}
	ldr ip, _0201DD1C ; =0x0380FFF4
	mov r3, #1
	ldr r2, [ip]
	ldr r2, [r2, #0x31c]
	strh r3, [r1, #2]
	ldr r1, [ip]
	ldrh r4, [r0, #0x10]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x22]
	cmp r4, r1
	blo _0201DC5C
	rsb r1, r3, #0x10000
	cmp r4, r1
	movne r0, #5
	bne _0201DD14
_0201DC5C:
	ldrh r3, [r0, #0x14]
	cmp r3, #0x3f
	bls _0201DC78
	ldr r1, _0201DD20 ; =0x0000FFFF
	cmp r3, r1
	movne r0, #5
	bne _0201DD14
_0201DC78:
	ldr r1, _0201DD20 ; =0x0000FFFF
	cmp r4, r1
	bne _0201DCCC
	ldr ip, _0201DD1C ; =0x0380FFF4
	mov r4, #1
	mov r3, #0x1c
	b _0201DCB4
_0201DC94:
	mla lr, r4, r3, r2
	ldrh r1, [r0, #0x12]
	add r4, r4, #1
	strh r1, [lr, #0x1a]
	ldrh r1, [lr, #0x18]
	cmp r1, #0
	ldrneh r1, [r0, #0x12]
	strneh r1, [lr, #0x18]
_0201DCB4:
	ldr r1, [ip]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x22]
	cmp r4, r1
	blo _0201DC94
	b _0201DD00
_0201DCCC:
	cmp r4, #0
	beq _0201DD00
	mov r1, #0x1c
	mla r3, r4, r1, r2
	ldrh lr, [r0, #0x12]
	add ip, r2, #0x18
	strh lr, [r3, #0x1a]
	ldrh r2, [r0, #0x10]
	mul r3, r2, r1
	ldrh r1, [ip, r3]
	cmp r1, #0
	ldrneh r1, [r0, #0x12]
	strneh r1, [ip, r3]
_0201DD00:
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	beq _0201DD10
	bl sub_02019620
_0201DD10:
	mov r0, #0
_0201DD14:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0201DD1C: .word 0x0380FFF4
_0201DD20: .word 0x0000FFFF
	arm_func_end sub_0201DC1C
_0201DD24:
	.byte 0x4C, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1
	.byte 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x20, 0x00, 0x51, 0xE3
	.byte 0x03, 0x00, 0xA0, 0x81, 0x1E, 0xFF, 0x2F, 0x81, 0xB0, 0x11, 0xD0, 0xE1, 0x01, 0x10, 0x81, 0xE2
	.byte 0xB0, 0x11, 0xC0, 0xE1, 0x00, 0x10, 0x92, 0xE5, 0xB0, 0x21, 0xD0, 0xE1, 0x03, 0x0C, 0x81, 0xE2
	.byte 0xB0, 0x12, 0xD0, 0xE1, 0x01, 0x00, 0x52, 0xE1, 0x05, 0x00, 0xA0, 0x83, 0xB2, 0x22, 0xC0, 0x91
	.byte 0x00, 0x00, 0xA0, 0x93, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x10, 0x00, 0x51, 0xE3, 0x02, 0x00, 0x00, 0x3A
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0x79, 0xEB, 0xFF, 0xEB, 0x00, 0x30, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE1
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x00, 0x30, 0xA0, 0xE1, 0x01, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1
	.byte 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x10, 0x00, 0x51, 0xE3
	.byte 0x02, 0x00, 0x00, 0x3A, 0xB0, 0x01, 0xD3, 0xE1, 0xB2, 0x11, 0xD3, 0xE1, 0x81, 0xEB, 0xFF, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x10, 0x00, 0x51, 0xE3, 0x02, 0x00, 0x00, 0x3A
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0xA8, 0xEB, 0xFF, 0xEB, 0x00, 0x30, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE1
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBC, 0x14, 0xD1, 0xE1, 0x10, 0x00, 0x51, 0xE3, 0x02, 0x00, 0x00, 0x3A
	.byte 0xB0, 0x01, 0xD0, 0xE1, 0xA8, 0xEB, 0xFF, 0xEB, 0x00, 0x30, 0xA0, 0xE1, 0x03, 0x00, 0xA0, 0xE1
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x0C, 0xC0, 0x9F, 0xE5
	.byte 0x01, 0x20, 0xA0, 0xE3, 0x10, 0x00, 0x80, 0xE2, 0xB2, 0x20, 0xC1, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x6C, 0x95, 0x7E, 0x02, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x10, 0xA0, 0xE1
	.byte 0xB0, 0x01, 0xD1, 0xE1, 0x04, 0xC0, 0x9F, 0xE5, 0x12, 0x10, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xD0, 0x95, 0x7E, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x2C, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3
	.byte 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2, 0xBE, 0x12, 0xD1, 0xE1
	.byte 0x01, 0x00, 0x51, 0xE3, 0x0B, 0x00, 0xA0, 0x13, 0x01, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD0, 0xE1
	.byte 0xFA, 0xEB, 0xFF, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x2C, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1
	.byte 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2, 0xBE, 0x12, 0xD1, 0xE1, 0x01, 0x00, 0x51, 0xE3
	.byte 0x0B, 0x00, 0xA0, 0x13, 0x01, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD0, 0xE1, 0x01, 0xEC, 0xFF, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x30, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xBE, 0x12, 0xD1, 0xE1, 0x02, 0x00, 0x51, 0xE3, 0x03, 0x00, 0x51, 0x13
	.byte 0x0B, 0x00, 0xA0, 0x13, 0x01, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD0, 0xE1, 0x02, 0xEC, 0xFF, 0xEB
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x54, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0xB2, 0x30, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x00, 0x30, 0xA0, 0xE1, 0x03, 0x0C, 0x81, 0xE2, 0xBE, 0x02, 0xD0, 0xE1, 0x01, 0x00, 0x50, 0xE3
	.byte 0x0B, 0x00, 0xA0, 0x13, 0x0A, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD3, 0xE1, 0xBE, 0x20, 0xD3, 0xE1
	.byte 0x01, 0x10, 0x80, 0xE2, 0xA1, 0x1F, 0x81, 0xE0, 0xC1, 0x10, 0xA0, 0xE1, 0x01, 0x10, 0x81, 0xE2
	.byte 0x01, 0x00, 0x52, 0xE1, 0x04, 0x00, 0xA0, 0xB3, 0x01, 0x00, 0x00, 0xBA, 0x12, 0x10, 0x83, 0xE2
	.byte 0xDF, 0xED, 0xFF, 0xEB, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x28, 0x01, 0x9F, 0xE5, 0x01, 0x40, 0xA0, 0xE1, 0x21, 0x10, 0xA0, 0xE3
	.byte 0xB2, 0x10, 0xC4, 0xE1, 0x00, 0x10, 0x90, 0xE5, 0x06, 0x00, 0x84, 0xE2, 0xC9, 0x1F, 0x81, 0xE2
	.byte 0x36, 0xEE, 0xFF, 0xEB, 0x08, 0x01, 0x9F, 0xE5, 0x22, 0x10, 0x84, 0xE2, 0x00, 0x30, 0x90, 0xE5
	.byte 0x20, 0x20, 0xA0, 0xE3, 0x03, 0x3C, 0x83, 0xE2, 0xBA, 0x32, 0xD3, 0xE1, 0xBC, 0x30, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xBC, 0x32, 0xD3, 0xE1, 0xBE, 0x30, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xBE, 0x3B, 0xD3, 0xE1, 0xB0, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xBE, 0x32, 0xD3, 0xE1, 0xB2, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xB0, 0x33, 0xD3, 0xE1, 0xB4, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xB4, 0x33, 0xD3, 0xE1, 0xB6, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xB6, 0x33, 0xD3, 0xE1, 0xB8, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xBA, 0x33, 0xD3, 0xE1, 0x83, 0x3F, 0xA0, 0xE1
	.byte 0xA3, 0x3F, 0xA0, 0xE1, 0xBA, 0x31, 0xC4, 0xE1, 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2
	.byte 0xBA, 0x33, 0xD3, 0xE1, 0x03, 0x3F, 0xA0, 0xE1, 0xA3, 0x3F, 0xA0, 0xE1, 0xBC, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xB2, 0x3C, 0xD3, 0xE1, 0xBE, 0x31, 0xC4, 0xE1
	.byte 0x00, 0x30, 0x90, 0xE5, 0x03, 0x3C, 0x83, 0xE2, 0xBC, 0x33, 0xD3, 0xE1, 0xB0, 0x32, 0xC4, 0xE1
	.byte 0x00, 0x00, 0x90, 0xE5, 0xE1, 0x0F, 0x80, 0xE2, 0xAF, 0x3D, 0x40, 0xEB, 0x30, 0x20, 0x9F, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2, 0xBA, 0x13, 0xD1, 0xE1
	.byte 0x81, 0x1E, 0xA0, 0xE1, 0xA1, 0x1F, 0xA0, 0xE1, 0xB2, 0x14, 0xC4, 0xE1, 0x00, 0x10, 0x92, 0xE5
	.byte 0x03, 0x1C, 0x81, 0xE2, 0xB2, 0x13, 0xD1, 0xE1, 0xB4, 0x14, 0xC4, 0xE1, 0x10, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x20, 0x00, 0x9F, 0xE5
	.byte 0x04, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x06, 0x00, 0x81, 0xE2
	.byte 0xC9, 0x1F, 0x82, 0xE2, 0xE9, 0xED, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xBA, 0x22, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x2C, 0x30, 0x9F, 0xE5, 0x03, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1, 0x00, 0x20, 0x93, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xBC, 0x22, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x00, 0x20, 0x93, 0xE5, 0x03, 0x2C, 0x82, 0xE2, 0xBE, 0x2B, 0xD2, 0xE1, 0xB8, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xBE, 0x22, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xB0, 0x23, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xB4, 0x23, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xB6, 0x23, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x24, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xBA, 0x23, 0xD2, 0xE1, 0x82, 0x2F, 0xA0, 0xE1, 0xA2, 0x2F, 0xA0, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x24, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xBA, 0x23, 0xD2, 0xE1, 0x02, 0x2F, 0xA0, 0xE1, 0xA2, 0x2F, 0xA0, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xB2, 0x2C, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xBC, 0x23, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x30, 0x00, 0x9F, 0xE5, 0x11, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x00, 0x90, 0xE5, 0x06, 0x30, 0x81, 0xE2, 0xE1, 0x2F, 0x80, 0xE2
	.byte 0x00, 0x10, 0xA0, 0xE3, 0xB2, 0x00, 0xD2, 0xE0, 0x01, 0x10, 0x81, 0xE2, 0x10, 0x00, 0x51, 0xE3
	.byte 0xB2, 0x00, 0xC3, 0xE0, 0xFA, 0xFF, 0xFF, 0x3A, 0x00, 0x00, 0xA0, 0xE3, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x24, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1
	.byte 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xBA, 0x23, 0xD2, 0xE1
	.byte 0x82, 0x2E, 0xA0, 0xE1, 0xA2, 0x2F, 0xA0, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1
	.byte 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xB2, 0x23, 0xD2, 0xE1
	.byte 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x10, 0x40, 0x2D, 0xE9
	.byte 0x01, 0x40, 0xA0, 0xE1, 0x04, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC4, 0xE1, 0x13, 0x00, 0xA0, 0xE3
	.byte 0x87, 0xEE, 0xFF, 0xEB, 0xB6, 0x00, 0xC4, 0xE1, 0x35, 0x00, 0xA0, 0xE3, 0x84, 0xEE, 0xFF, 0xEB
	.byte 0xB8, 0x00, 0xC4, 0xE1, 0x2E, 0x00, 0xA0, 0xE3, 0x81, 0xEE, 0xFF, 0xEB, 0xBA, 0x00, 0xC4, 0xE1
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x20, 0x00, 0x9F, 0xE5
	.byte 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x03, 0x2C, 0x82, 0xE2, 0xB2, 0x22, 0xD2, 0xE1, 0x01, 0x20, 0x42, 0xE2, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x30, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x24, 0xD0, 0xE1
	.byte 0x10, 0x00, 0x52, 0xE3, 0x01, 0x00, 0xA0, 0x33, 0xBA, 0x23, 0xD0, 0x21, 0x00, 0x00, 0xA0, 0x23
	.byte 0x02, 0x2E, 0xA0, 0x21, 0xA2, 0x2F, 0xA0, 0x21, 0xB6, 0x20, 0xC1, 0x21, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x54, 0x30, 0x9F, 0xE5, 0x03, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1
	.byte 0x00, 0x00, 0x93, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x24, 0xD0, 0xE1, 0x10, 0x00, 0x52, 0xE3
	.byte 0x01, 0x00, 0xA0, 0x33, 0x1E, 0xFF, 0x2F, 0x31, 0xBA, 0x23, 0xD0, 0xE1, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x82, 0x2D, 0xA0, 0xE1, 0xA2, 0x2F, 0xA0, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x93, 0xE5
	.byte 0x03, 0x2C, 0x82, 0xE2, 0xBA, 0x33, 0xD2, 0xE1, 0x03, 0x2E, 0xA0, 0xE1, 0x03, 0x3D, 0xA0, 0xE1
	.byte 0xA2, 0x2F, 0xA0, 0xE1, 0xA3, 0x2F, 0x22, 0xE0, 0xB8, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x30, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1
	.byte 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x24, 0xD0, 0xE1, 0x10, 0x00, 0x52, 0xE3
	.byte 0x01, 0x00, 0xA0, 0x33, 0xBA, 0x23, 0xD0, 0x21, 0x00, 0x00, 0xA0, 0x23, 0x82, 0x2C, 0xA0, 0x21
	.byte 0xA2, 0x2F, 0xA0, 0x21, 0xB6, 0x20, 0xC1, 0x21, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x30, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x00, 0x90, 0xE5
	.byte 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x24, 0xD0, 0xE1, 0x10, 0x00, 0x52, 0xE3, 0x01, 0x00, 0xA0, 0x33
	.byte 0xBA, 0x23, 0xD0, 0x21, 0x00, 0x00, 0xA0, 0x23, 0x02, 0x2C, 0xA0, 0x21, 0xA2, 0x2F, 0xA0, 0x21
	.byte 0xB6, 0x20, 0xC1, 0x21, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x20, 0x00, 0x9F, 0xE5, 0x04, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5
	.byte 0x06, 0x00, 0x81, 0xE2, 0xEA, 0x1F, 0x82, 0xE2, 0xEC, 0xEC, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x40, 0x20, 0x9F, 0xE5
	.byte 0x12, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1, 0x00, 0x00, 0x92, 0xE5, 0x08, 0xC0, 0x81, 0xE2
	.byte 0x03, 0x0C, 0x80, 0xE2, 0xB2, 0x06, 0xD0, 0xE1, 0x00, 0x30, 0xA0, 0xE3, 0xB6, 0x00, 0xC1, 0xE1
	.byte 0x00, 0x00, 0x92, 0xE5, 0xD9, 0x1F, 0x80, 0xE2, 0xB2, 0x00, 0xD1, 0xE0, 0x02, 0x30, 0x83, 0xE2
	.byte 0x20, 0x00, 0x53, 0xE3, 0xB2, 0x00, 0xCC, 0xE0, 0xFA, 0xFF, 0xFF, 0x3A, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xB2, 0x2B, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2, 0xB8, 0x2B, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x03, 0x2C, 0x82, 0xE2
	.byte 0xB4, 0x2B, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0xF8, 0x40, 0x2D, 0xE9, 0x01, 0x40, 0xA0, 0xE1, 0xB2, 0x00, 0xD4, 0xE1, 0xC0, 0x10, 0x9F, 0xE5
	.byte 0x01, 0x00, 0x50, 0xE3, 0xB8, 0x00, 0x9F, 0x85, 0x00, 0x00, 0x90, 0x85, 0x03, 0x0C, 0x80, 0x82
	.byte 0xB4, 0x0E, 0xD0, 0x81, 0xB6, 0x00, 0xC4, 0x81, 0xB2, 0x00, 0xD4, 0xE1, 0x00, 0x30, 0x91, 0xE5
	.byte 0x02, 0x10, 0x40, 0xE2, 0x03, 0x0C, 0x83, 0xE2, 0xB4, 0x2E, 0xD0, 0xE1, 0x81, 0x00, 0x52, 0xE1
	.byte 0x04, 0x00, 0xA0, 0xC3, 0x20, 0x00, 0x00, 0xCA, 0xB6, 0x20, 0xD4, 0xE1, 0x00, 0x00, 0x52, 0xE3
	.byte 0x16, 0x00, 0x00, 0x0A, 0xB6, 0x0E, 0xD0, 0xE1, 0x01, 0x00, 0x10, 0xE3, 0xE0, 0x03, 0x93, 0xE5
	.byte 0x0F, 0x00, 0x00, 0x0A, 0x08, 0x60, 0x84, 0xE2, 0x01, 0x50, 0x80, 0xE2, 0x00, 0x70, 0xA0, 0xE3
	.byte 0x07, 0x00, 0x00, 0xEA, 0x05, 0x00, 0xA0, 0xE1, 0xB4, 0xEF, 0xFF, 0xEB, 0x00, 0x10, 0xA0, 0xE1
	.byte 0x06, 0x00, 0xA0, 0xE1, 0xA6, 0xEF, 0xFF, 0xEB, 0x01, 0x60, 0x86, 0xE2, 0x01, 0x50, 0x85, 0xE2
	.byte 0x01, 0x70, 0x87, 0xE2, 0xB6, 0x00, 0xD4, 0xE1, 0x00, 0x00, 0x57, 0xE1, 0xF4, 0xFF, 0xFF, 0x3A
	.byte 0x02, 0x00, 0x00, 0xEA, 0x08, 0x10, 0x84, 0xE2, 0x01, 0x20, 0x82, 0xE2, 0x3A, 0x3C, 0x40, 0xEB
	.byte 0xB6, 0x10, 0xD4, 0xE1, 0x00, 0x00, 0xA0, 0xE3, 0x01, 0x10, 0x81, 0xE2, 0xA1, 0x1F, 0x81, 0xE0
	.byte 0xC1, 0x10, 0xA0, 0xE1, 0x02, 0x10, 0x81, 0xE2, 0xB2, 0x10, 0xC4, 0xE1, 0xF8, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x30, 0x20, 0x9F, 0xE5
	.byte 0x01, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2
	.byte 0xBC, 0x14, 0xD1, 0xE1, 0x00, 0x00, 0x51, 0xE3, 0x10, 0x00, 0x51, 0x13, 0x02, 0x00, 0x00, 0x1A
	.byte 0x00, 0x00, 0xA0, 0xE3, 0xCB, 0x28, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x4C, 0x20, 0x9F, 0xE5
	.byte 0x01, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1, 0x00, 0x10, 0x92, 0xE5, 0x03, 0x1C, 0x81, 0xE2
	.byte 0xBC, 0x24, 0xD1, 0xE1, 0x20, 0x00, 0x52, 0xE3, 0x0A, 0x00, 0x00, 0x8A, 0xB6, 0x15, 0xD1, 0xE1
	.byte 0x00, 0x00, 0x51, 0xE3, 0x07, 0x00, 0x00, 0x1A, 0x00, 0x00, 0xA0, 0xE3, 0x76, 0x17, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x0E, 0x00, 0xA0, 0x13, 0x02, 0x00, 0x00, 0x1A, 0x10, 0x00, 0xA0, 0xE3
	.byte 0xB4, 0x28, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x44, 0x00, 0x9F, 0xE5, 0x01, 0x20, 0xA0, 0xE3
	.byte 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x14, 0xD0, 0xE1
	.byte 0x10, 0x00, 0x51, 0xE3, 0x03, 0x00, 0x00, 0x0A, 0x20, 0x00, 0x51, 0xE3, 0xB6, 0x05, 0xD0, 0x01
	.byte 0x00, 0x00, 0x50, 0x03, 0x03, 0x00, 0x00, 0x1A, 0x20, 0x00, 0xA0, 0xE3, 0xA1, 0x28, 0x40, 0xEB
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE3, 0x08, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x2C, 0x00, 0x9F, 0xE5
	.byte 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2
	.byte 0xBC, 0x04, 0xD0, 0xE1, 0x20, 0x00, 0x50, 0xE3, 0x00, 0x00, 0x00, 0x3A, 0x69, 0x28, 0x40, 0xEB
	.byte 0x67, 0xE6, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x08, 0x40, 0x2D, 0xE9, 0x28, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5
	.byte 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x04, 0xD0, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x00, 0x0A, 0xB2, 0x00, 0xC1, 0xE1, 0x53, 0xEC, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x10, 0x40, 0x2D, 0xE9
	.byte 0x88, 0x00, 0x9F, 0xE5, 0x01, 0x40, 0xA0, 0xE1, 0x09, 0x30, 0xA0, 0xE3, 0x06, 0x10, 0x84, 0xE2
	.byte 0x08, 0x20, 0xA0, 0xE3, 0xB2, 0x30, 0xC4, 0xE1, 0xCF, 0x3B, 0x40, 0xEB, 0x70, 0x10, 0x9F, 0xE5
	.byte 0x70, 0x00, 0x9F, 0xE5, 0xB0, 0x10, 0xD1, 0xE1, 0xBE, 0x10, 0xC4, 0xE1, 0x00, 0x00, 0x90, 0xE5
	.byte 0x06, 0x0C, 0x80, 0xE2, 0xB0, 0x09, 0xD0, 0xE1, 0x02, 0x09, 0x10, 0xE3, 0x6D, 0x10, 0xA0, 0x03
	.byte 0x54, 0x00, 0x9F, 0x05, 0xB0, 0x11, 0xC4, 0x01, 0x03, 0x00, 0x00, 0x0A, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x4B, 0xED, 0xFF, 0xEB, 0xB0, 0x01, 0xC4, 0xE1, 0x68, 0xED, 0xFF, 0xEB, 0xB2, 0x01, 0xC4, 0xE1
	.byte 0x30, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0x90, 0xE5, 0x06, 0x0C, 0x81, 0xE2, 0xB0, 0x09, 0xD0, 0xE1
	.byte 0x01, 0x09, 0x10, 0xE3, 0x05, 0x0C, 0x81, 0x12, 0xB8, 0x0F, 0xD0, 0x11, 0x02, 0x00, 0xA0, 0x03
	.byte 0xB4, 0x01, 0xC4, 0xE1, 0x00, 0x00, 0xA0, 0xE3, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x68, 0x78, 0x7F, 0x02, 0x00, 0x80, 0x80, 0x04, 0xF4, 0xFF, 0x80, 0x03, 0x3D, 0x93, 0x00, 0x00
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x4C, 0x00, 0x9F, 0xE5, 0x01, 0x40, 0xA0, 0xE1, 0x00, 0x00, 0x90, 0xE5
	.byte 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x04, 0xD0, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0xA0, 0x03
	.byte 0x0A, 0x00, 0x00, 0x0A, 0x5C, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC4, 0xE1, 0x26, 0xEC, 0xFF, 0xEB
	.byte 0x20, 0x00, 0x9F, 0xE5, 0x08, 0x10, 0x84, 0xE2, 0x00, 0x00, 0x90, 0xE5, 0xB4, 0x20, 0xA0, 0xE3
	.byte 0x4F, 0x0F, 0x80, 0xE2, 0x01, 0x0B, 0x80, 0xE2, 0xAF, 0x3B, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x1C, 0x00, 0x9F, 0xE5
	.byte 0x02, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x20, 0x90, 0xE5, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x03, 0x2C, 0x82, 0xE2, 0xBC, 0x24, 0xD2, 0xE1, 0xB6, 0x20, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0x78, 0x40, 0x2D, 0xE9, 0x04, 0xD0, 0x4D, 0xE2, 0x18, 0x23, 0x9F, 0xE5
	.byte 0x00, 0x50, 0xA0, 0xE1, 0x00, 0x20, 0x92, 0xE5, 0x01, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1
	.byte 0xD1, 0x4F, 0x82, 0xE2, 0xB8, 0x10, 0xD4, 0xE1, 0xF0, 0x10, 0x01, 0xE2, 0x10, 0x00, 0x51, 0xE3
	.byte 0xBA, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD5, 0xE1, 0x01, 0x00, 0x50, 0xE3, 0x05, 0x00, 0xA0, 0x83
	.byte 0xB6, 0x00, 0x00, 0x8A, 0xB4, 0x01, 0xD5, 0xE1, 0x0A, 0x00, 0x50, 0xE3, 0x14, 0x00, 0x50, 0x13
	.byte 0x05, 0x00, 0xA0, 0x13, 0xB1, 0x00, 0x00, 0x1A, 0xB2, 0x01, 0xD5, 0xE1, 0x04, 0x00, 0x50, 0xE3
	.byte 0x05, 0x00, 0xA0, 0x83, 0xAD, 0x00, 0x00, 0x8A, 0x00, 0x00, 0xA0, 0xE3, 0xD6, 0x16, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x0E, 0x00, 0xA0, 0x13, 0xA8, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xD5, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x82, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x50, 0xE3, 0xA2, 0x00, 0x00, 0x1A
	.byte 0xB8, 0x00, 0xD4, 0xE1, 0x10, 0x00, 0x50, 0xE3, 0x01, 0x00, 0xA0, 0x13, 0x9F, 0x00, 0x00, 0x1A
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0x8D, 0xE5, 0x00, 0x20, 0x8D, 0xE2, 0x65, 0x00, 0xA0, 0xE3
	.byte 0x01, 0x10, 0xA0, 0xE3, 0x15, 0x17, 0x00, 0xEB, 0x00, 0x60, 0x9D, 0xE5, 0x01, 0x00, 0xA0, 0xE3
	.byte 0xE7, 0xEC, 0xFF, 0xEB, 0x00, 0x00, 0x56, 0xE1, 0x04, 0x00, 0x00, 0x0A, 0x06, 0x10, 0xA0, 0xE1
	.byte 0x01, 0x00, 0xA0, 0xE3, 0xED, 0xEC, 0xFF, 0xEB, 0x50, 0x02, 0x9F, 0xE5, 0xD9, 0xED, 0xFF, 0xEB
	.byte 0xB2, 0x01, 0xD5, 0xE1, 0x04, 0x00, 0x50, 0xE3, 0x00, 0xF1, 0x8F, 0x90, 0x8A, 0x00, 0x00, 0xEA
	.byte 0x03, 0x00, 0x00, 0xEA, 0x02, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x00, 0xEA, 0x26, 0x00, 0x00, 0xEA
	.byte 0x25, 0x00, 0x00, 0xEA, 0x11, 0x00, 0xA0, 0xE3, 0xB8, 0x00, 0xC4, 0xE1, 0xB6, 0x01, 0xD5, 0xE1
	.byte 0x01, 0x10, 0xA0, 0xE3, 0xA1, 0xE9, 0xFF, 0xEB, 0x14, 0x12, 0x9F, 0xE5, 0x02, 0x29, 0xA0, 0xE3
	.byte 0x10, 0x02, 0x9F, 0xE5, 0xB0, 0x20, 0xC1, 0xE1, 0xC6, 0xED, 0xFF, 0xEB, 0xB4, 0x11, 0xD5, 0xE1
	.byte 0x02, 0x00, 0xA0, 0xE3, 0xB6, 0x11, 0xC4, 0xE1, 0xC9, 0xEC, 0xFF, 0xEB, 0x00, 0x00, 0x8D, 0xE5
	.byte 0xB2, 0x11, 0xD5, 0xE1, 0xF0, 0x21, 0x9F, 0xE5, 0x01, 0x00, 0x51, 0xE3, 0x10, 0x00, 0x80, 0x93
	.byte 0x00, 0x00, 0x8D, 0x95, 0xB4, 0x01, 0xD5, 0xE1, 0xB0, 0x00, 0xC2, 0xE1, 0xB2, 0x01, 0xD5, 0xE1
	.byte 0x01, 0x00, 0x50, 0xE3, 0xB2, 0x00, 0x42, 0x11, 0x04, 0x00, 0x00, 0x1A, 0x00, 0x10, 0x9D, 0xE5
	.byte 0x03, 0x00, 0xA0, 0xE3, 0x20, 0x10, 0x81, 0xE3, 0x00, 0x10, 0x8D, 0xE5, 0xB2, 0x00, 0x42, 0xE1
	.byte 0x00, 0x10, 0x9D, 0xE5, 0x02, 0x00, 0xA0, 0xE3, 0xC0, 0xEC, 0xFF, 0xEB, 0xAC, 0x11, 0x9F, 0xE5
	.byte 0xAC, 0x01, 0x9F, 0xE5, 0xB0, 0x10, 0xC0, 0xE1, 0x5F, 0x00, 0x00, 0xEA, 0x88, 0x01, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x90, 0xE5, 0xD1, 0x4F, 0x80, 0xE2, 0xB4, 0x26, 0x40, 0xEB, 0xA1, 0x27, 0x40, 0xEB
	.byte 0x06, 0x00, 0xA0, 0xE3, 0xAA, 0xEC, 0xFF, 0xEB, 0xBC, 0x0A, 0xC4, 0xE1, 0xB2, 0x01, 0xD5, 0xE1
	.byte 0x04, 0x00, 0x50, 0xE3, 0x02, 0x00, 0x00, 0x1A, 0x06, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3
	.byte 0xAE, 0xEC, 0xFF, 0xEB, 0x6C, 0x11, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x0C, 0x20, 0xA0, 0xE3
	.byte 0x0B, 0x3B, 0x40, 0xEB, 0x5C, 0x11, 0x9F, 0xE5, 0x14, 0x00, 0xA0, 0xE3, 0xB8, 0x00, 0xC1, 0xE1
	.byte 0x7D, 0x0E, 0xA0, 0xE3, 0xBA, 0x00, 0xC1, 0xE1, 0x0C, 0x30, 0x81, 0xE2, 0x48, 0x11, 0x9F, 0xE5
	.byte 0x48, 0x01, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x02, 0x20, 0x82, 0xE2, 0x00, 0x00, 0x52, 0xE1
	.byte 0xB2, 0x10, 0xC3, 0xE0, 0xFB, 0xFF, 0xFF, 0x3A, 0x28, 0x11, 0x9F, 0xE5, 0x08, 0x20, 0xA0, 0xE3
	.byte 0x2C, 0x01, 0x9F, 0xE5, 0xBC, 0x20, 0xC1, 0xE1, 0x06, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1
	.byte 0x12, 0x00, 0xA0, 0xE3, 0xB8, 0x00, 0xC4, 0xE1, 0x01, 0x10, 0xA0, 0xE3, 0xB8, 0x11, 0xC4, 0xE1
	.byte 0xB6, 0x01, 0xD5, 0xE1, 0x55, 0xE9, 0xFF, 0xEB, 0xE4, 0x10, 0x9F, 0xE5, 0x02, 0x29, 0xA0, 0xE3
	.byte 0xE0, 0x00, 0x9F, 0xE5, 0xB0, 0x20, 0xC1, 0xE1, 0x7A, 0xED, 0xFF, 0xEB, 0x01, 0x20, 0xA0, 0xE3
	.byte 0xF0, 0x30, 0x9F, 0xE5, 0x02, 0x00, 0xA0, 0xE3, 0xB0, 0x00, 0xC3, 0xE1, 0xBE, 0x20, 0x43, 0xE1
	.byte 0xD0, 0x10, 0x9F, 0xE5, 0x01, 0x09, 0x62, 0xE2, 0x00, 0x00, 0x01, 0xE0, 0x80, 0x07, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0xBC, 0x29, 0xC3, 0xE1, 0x02, 0x09, 0x80, 0xE3, 0xBE, 0x08, 0xC3, 0xE1
	.byte 0x21, 0x00, 0x00, 0xEA, 0xB8, 0x00, 0xD4, 0xE1, 0x11, 0x00, 0x50, 0xE3, 0x0E, 0x00, 0x00, 0x1A
	.byte 0x91, 0xED, 0xFF, 0xEB, 0x98, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0xB0, 0x20, 0xC1, 0xE1
	.byte 0x01, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1, 0x16, 0x0E, 0x41, 0xE2, 0xB0, 0x20, 0xC0, 0xE1
	.byte 0x02, 0x00, 0xA0, 0xE3, 0x66, 0xEC, 0xFF, 0xEB, 0x30, 0x10, 0xC0, 0xE3, 0x02, 0x00, 0xA0, 0xE3
	.byte 0x00, 0x10, 0x8D, 0xE5, 0x6D, 0xEC, 0xFF, 0xEB, 0x0D, 0x00, 0x00, 0xEA, 0x12, 0x00, 0x50, 0xE3
	.byte 0x09, 0x00, 0x00, 0x1A, 0x70, 0x10, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0xB8, 0x01, 0xC4, 0xE1
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0xBC, 0x1A, 0xD4, 0xE1
	.byte 0x06, 0x00, 0xA0, 0xE3, 0x61, 0xEC, 0xFF, 0xEB, 0x01, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x02, 0x00, 0x00, 0xEA, 0x10, 0x00, 0xA0, 0xE3, 0xB8, 0x00, 0xC4, 0xE1, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x04, 0xD0, 0x8D, 0xE2, 0x78, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x88, 0x13, 0x00, 0x00, 0x40, 0x80, 0x80, 0x04, 0xDC, 0x05, 0x00, 0x00, 0xA4, 0x81, 0x80, 0x04
	.byte 0x23, 0x08, 0x00, 0x00, 0xA0, 0x81, 0x80, 0x04, 0x00, 0x40, 0x80, 0x04, 0x55, 0x55, 0x00, 0x00
	.byte 0xEC, 0x07, 0x00, 0x00, 0x94, 0x81, 0x80, 0x04, 0x12, 0x80, 0x80, 0x04, 0x04, 0x80, 0x80, 0x04
	.byte 0x64, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x03, 0x0C, 0x80, 0xE2, 0xBC, 0x05, 0xD0, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x00, 0x00, 0x0A, 0x50, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3
	.byte 0xB0, 0x20, 0xC0, 0xE1, 0x48, 0x10, 0x9F, 0xE5, 0xB4, 0x20, 0xC0, 0xE1, 0xB0, 0x00, 0xD1, 0xE1
	.byte 0x02, 0x09, 0x80, 0xE3, 0xB0, 0x00, 0xC1, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0x34, 0x20, 0x9F, 0xE5
	.byte 0x01, 0x30, 0xA0, 0xE3, 0xB0, 0x30, 0xC2, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0xB8, 0x1A, 0x42, 0xE1
	.byte 0x02, 0x00, 0xA0, 0xE3, 0xBA, 0x09, 0x42, 0xE1, 0x01, 0x08, 0x63, 0xE2, 0xBC, 0x09, 0x42, 0xE1
	.byte 0xB8, 0x1E, 0xC2, 0xE1, 0xBC, 0x16, 0x42, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x00, 0x40, 0x80, 0x04, 0xA0, 0x80, 0x80, 0x04, 0xAC, 0x80, 0x80, 0x04, 0x10, 0x40, 0x2D, 0xE9
	.byte 0xA0, 0x20, 0x9F, 0xE5, 0x01, 0x30, 0xA0, 0xE3, 0x00, 0x20, 0x92, 0xE5, 0xB2, 0x30, 0xC1, 0xE1
	.byte 0xD1, 0x4F, 0x82, 0xE2, 0xB8, 0x20, 0xD4, 0xE1, 0xF0, 0x10, 0x02, 0xE2, 0x10, 0x00, 0x51, 0xE3
	.byte 0x03, 0x00, 0xA0, 0x11, 0x1D, 0x00, 0x00, 0x1A, 0xB0, 0x11, 0xD0, 0xE1, 0x00, 0x00, 0x51, 0xE3
	.byte 0x0F, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x51, 0xE3, 0x17, 0x00, 0x00, 0x1A, 0x10, 0x00, 0x52, 0xE3
	.byte 0x03, 0x00, 0xA0, 0x11, 0x15, 0x00, 0x00, 0x1A, 0xB2, 0x01, 0xD0, 0xE1, 0x03, 0x10, 0xA0, 0xE1
	.byte 0xDA, 0xE8, 0xFF, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0xBC, 0x00, 0xC4, 0xE1, 0x0F, 0x26, 0x40, 0xEB
	.byte 0x02, 0x09, 0xA0, 0xE3, 0xCD, 0xE9, 0xFF, 0xEB, 0x11, 0x00, 0xA0, 0xE3, 0xB8, 0x00, 0xC4, 0xE1
	.byte 0x09, 0x00, 0x00, 0xEA, 0x11, 0x00, 0x52, 0xE3, 0x03, 0x00, 0x00, 0x1A, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xC6, 0xE9, 0xFF, 0xEB, 0xF3, 0x26, 0x40, 0xEB, 0x01, 0x00, 0x00, 0xEA, 0x03, 0x00, 0xA0, 0xE1
	.byte 0x02, 0x00, 0x00, 0xEA, 0x10, 0x00, 0xA0, 0xE3, 0xB8, 0x00, 0xC4, 0xE1, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0xF0, 0x41, 0x2D, 0xE9
	.byte 0xB8, 0x11, 0x9F, 0xE5, 0x00, 0x80, 0xA0, 0xE1, 0x00, 0x40, 0x91, 0xE5, 0xB6, 0x11, 0xD8, 0xE1
	.byte 0xAC, 0x01, 0x9F, 0xE5, 0xD1, 0x5F, 0x84, 0xE2, 0x00, 0x00, 0x51, 0xE1, 0xC7, 0x6F, 0x84, 0xE2
	.byte 0x05, 0x00, 0xA0, 0x83, 0x63, 0x00, 0x00, 0x8A, 0xB2, 0x01, 0xD6, 0xE1, 0x01, 0x00, 0x50, 0xE3
	.byte 0x09, 0x00, 0x00, 0x1A, 0x28, 0x00, 0x88, 0xE2, 0xB4, 0xF0, 0xFF, 0xEB, 0x00, 0x70, 0xA0, 0xE1
	.byte 0xFF, 0x00, 0x57, 0xE3, 0x02, 0x00, 0x00, 0x0A, 0x68, 0xF2, 0xFF, 0xEB, 0x40, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0xA0, 0xE3, 0x56, 0x00, 0x00, 0xEA, 0xB8, 0x78, 0xD5, 0xE1
	.byte 0x58, 0x01, 0x9F, 0xE5, 0xB2, 0x71, 0xC8, 0xE1, 0x00, 0x00, 0x90, 0xE5, 0xEC, 0x03, 0x90, 0xE5
	.byte 0xB4, 0x01, 0xC8, 0xE1, 0xBE, 0x01, 0xD8, 0xE1, 0xFF, 0x00, 0x10, 0xE3, 0xB0, 0x02, 0xC8, 0x11
	.byte 0x00, 0x00, 0xA0, 0x13, 0xBE, 0x01, 0xC8, 0x11, 0x02, 0x00, 0x00, 0x1A, 0x07, 0x00, 0xA0, 0xE1
	.byte 0x86, 0xF2, 0xFF, 0xEB, 0xB0, 0x02, 0xC8, 0xE1, 0xB6, 0x01, 0xD8, 0xE1, 0x00, 0x00, 0x50, 0xE3
	.byte 0x06, 0x00, 0x00, 0x1A, 0xBA, 0x18, 0xD5, 0xE1, 0x1C, 0x00, 0xA0, 0xE3, 0x40, 0x10, 0x81, 0xE3
	.byte 0x01, 0x19, 0xC1, 0xE3, 0xB4, 0x12, 0xC8, 0xE1, 0xB2, 0x02, 0xC8, 0xE1, 0x08, 0x00, 0x00, 0xEA
	.byte 0xBA, 0x08, 0xD5, 0xE1, 0xB4, 0x02, 0xC8, 0xE1, 0xB8, 0x01, 0xD6, 0xE1, 0x00, 0x00, 0x50, 0xE3
	.byte 0xB6, 0x01, 0xD8, 0xE1, 0x1C, 0x00, 0x80, 0x02, 0xB2, 0x02, 0xC8, 0x01, 0x24, 0x00, 0x80, 0x12
	.byte 0xB2, 0x02, 0xC8, 0x11, 0xB2, 0x01, 0xD6, 0xE1, 0x01, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x00, 0x0A
	.byte 0x02, 0x00, 0x50, 0xE3, 0x03, 0x00, 0x50, 0x13, 0x1F, 0x00, 0x00, 0x0A, 0x2C, 0x00, 0x00, 0xEA
	.byte 0x34, 0x00, 0x88, 0xE2, 0x2E, 0x10, 0x88, 0xE2, 0x78, 0xEA, 0xFF, 0xEB, 0x2E, 0x00, 0x88, 0xE2
	.byte 0x64, 0x10, 0x85, 0xE2, 0x75, 0xEA, 0xFF, 0xEB, 0x00, 0x00, 0x57, 0xE3, 0x0D, 0x00, 0x00, 0x1A
	.byte 0x08, 0x10, 0xA0, 0xE1, 0x02, 0x0C, 0x84, 0xE2, 0xF2, 0xF0, 0xFF, 0xEB, 0x8C, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x90, 0xE5, 0x05, 0x0C, 0x80, 0xE2, 0xB2, 0x13, 0xD0, 0xE1, 0xBE, 0x22, 0xD0, 0xE1
	.byte 0x01, 0x00, 0xE0, 0xE1, 0x00, 0x00, 0x12, 0xE1, 0x19, 0x00, 0x00, 0x1A, 0x02, 0x00, 0xA0, 0xE3
	.byte 0xEB, 0x01, 0x00, 0xEB, 0x16, 0x00, 0x00, 0xEA, 0x10, 0x00, 0x88, 0xE2, 0xFC, 0xF0, 0xFF, 0xEB
	.byte 0x08, 0x20, 0xA0, 0xE1, 0x02, 0x0C, 0x84, 0xE2, 0x65, 0x1F, 0x84, 0xE2, 0x89, 0x24, 0x40, 0xEB
	.byte 0x00, 0x00, 0xA0, 0xE3, 0xE2, 0x01, 0x00, 0xEB, 0x0D, 0x00, 0x00, 0xEA, 0x34, 0x00, 0x88, 0xE2
	.byte 0x28, 0x10, 0x88, 0xE2, 0x59, 0xEA, 0xFF, 0xEB, 0x28, 0x00, 0x88, 0xE2, 0x64, 0x10, 0x85, 0xE2
	.byte 0x56, 0xEA, 0xFF, 0xEB, 0x10, 0x00, 0x88, 0xE2, 0xED, 0xF0, 0xFF, 0xEB, 0x08, 0x20, 0xA0, 0xE1
	.byte 0x02, 0x0C, 0x84, 0xE2, 0x65, 0x1F, 0x84, 0xE2, 0x7A, 0x24, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xD3, 0x01, 0x00, 0xEB, 0x81, 0x00, 0xA0, 0xE3, 0xF0, 0x41, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0xE4, 0x05, 0x00, 0x00, 0xF8, 0x4F, 0x2D, 0xE9, 0x80, 0x21, 0x9F, 0xE5
	.byte 0x00, 0xA0, 0xA0, 0xE1, 0x00, 0x20, 0x92, 0xE5, 0x01, 0x90, 0xA0, 0xE3, 0x06, 0x0C, 0x82, 0xE2
	.byte 0xB0, 0x69, 0xD0, 0xE1, 0xC7, 0x4F, 0x82, 0xE2, 0xB2, 0x90, 0xC1, 0xE1, 0xB2, 0x11, 0xD4, 0xE1
	.byte 0x2C, 0x00, 0x82, 0xE2, 0x01, 0x5B, 0x80, 0xE2, 0x02, 0x00, 0x51, 0xE3, 0x0B, 0x00, 0xA0, 0x13
	.byte 0x51, 0x00, 0x00, 0x1A, 0xB0, 0x01, 0xDA, 0xE1, 0x81, 0x0F, 0x50, 0xE3, 0x05, 0x00, 0xA0, 0x83
	.byte 0x4D, 0x00, 0x00, 0x8A, 0xB0, 0x05, 0xD5, 0xE1, 0x50, 0xB0, 0x85, 0xE2, 0x00, 0x00, 0x50, 0xE3
	.byte 0x00, 0x90, 0xA0, 0x03, 0x14, 0x00, 0xA0, 0xE3, 0x99, 0x00, 0x08, 0xE0, 0xB8, 0x10, 0x9B, 0xE1
	.byte 0x00, 0x00, 0x51, 0xE3, 0x08, 0x00, 0xA0, 0x13, 0x43, 0x00, 0x00, 0x1A, 0x14, 0x11, 0x9F, 0xE5
	.byte 0xB0, 0x10, 0xD1, 0xE1, 0x02, 0x09, 0x11, 0xE3, 0x08, 0x00, 0xA0, 0x13, 0x3E, 0x00, 0x00, 0x1A
	.byte 0x08, 0x10, 0x85, 0xE0, 0x58, 0x70, 0x91, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC7, 0xE1
	.byte 0xB4, 0x10, 0xC7, 0xE1, 0xB8, 0x00, 0xC7, 0xE1, 0xB0, 0x01, 0xDA, 0xE1, 0xE8, 0x30, 0x9F, 0xE5
	.byte 0x1E, 0x00, 0x80, 0xE2, 0xBA, 0x00, 0xC7, 0xE1, 0x46, 0x0F, 0xA0, 0xE3, 0xBC, 0x00, 0xC7, 0xE1
	.byte 0x10, 0x00, 0x87, 0xE2, 0xEA, 0x1F, 0x82, 0xE2, 0x08, 0x20, 0x84, 0xE2, 0x2B, 0xEA, 0xFF, 0xEB
	.byte 0xB2, 0x01, 0xDA, 0xE1, 0xB4, 0x02, 0xC7, 0xE1, 0xB0, 0x01, 0xDA, 0xE1, 0x00, 0x00, 0x50, 0xE3
	.byte 0x06, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x59, 0xE3, 0x00, 0x00, 0x00, 0x1A, 0x42, 0xEA, 0xFF, 0xEB
	.byte 0x14, 0x10, 0x9A, 0xE5, 0xB0, 0x21, 0xDA, 0xE1, 0x26, 0x00, 0x87, 0xE2, 0xF2, 0xEC, 0xFF, 0xEB
	.byte 0x04, 0x00, 0x16, 0xE3, 0x09, 0x00, 0x00, 0x0A, 0xB0, 0x01, 0xDA, 0xE1, 0x24, 0x10, 0x87, 0xE2
	.byte 0x02, 0x00, 0x80, 0xE2, 0x00, 0x00, 0x81, 0xE0, 0x03, 0x00, 0x80, 0xE2, 0x7C, 0x10, 0x9F, 0xE5
	.byte 0x03, 0x20, 0xC0, 0xE3, 0x78, 0x00, 0x9F, 0xE5, 0xB0, 0x10, 0xC2, 0xE1, 0xB2, 0x00, 0xC2, 0xE1
	.byte 0x01, 0x04, 0xA0, 0xE3, 0x0F, 0x30, 0x40, 0xEB, 0x02, 0x20, 0xA0, 0xE3, 0x64, 0x10, 0x9F, 0xE5
	.byte 0xB8, 0x20, 0x8B, 0xE1, 0x52, 0x50, 0x85, 0xE2, 0xB8, 0x20, 0x95, 0xE1, 0x01, 0x10, 0x07, 0xE0
	.byte 0x01, 0x30, 0x82, 0xE2, 0xA1, 0x20, 0xA0, 0xE1, 0x38, 0x10, 0x9F, 0xE5, 0xB8, 0x30, 0x85, 0xE1
	.byte 0x02, 0x29, 0x82, 0xE3, 0xB0, 0x20, 0xC1, 0xE1, 0xBE, 0x11, 0xD4, 0xE1, 0x00, 0x40, 0xA0, 0xE1
	.byte 0x01, 0x0C, 0xA0, 0xE1, 0xA0, 0x0F, 0xB0, 0xE1, 0x00, 0x00, 0x00, 0x1A, 0xD9, 0xE9, 0xFF, 0xEB
	.byte 0x04, 0x00, 0xA0, 0xE1, 0xED, 0x2F, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0xF8, 0x4F, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x94, 0x80, 0x80, 0x04, 0xAC, 0x74, 0x7F, 0x02
	.byte 0xB8, 0xB6, 0x00, 0x00, 0x46, 0x1D, 0x00, 0x00, 0xFF, 0x3F, 0x00, 0x00, 0xF8, 0x4F, 0x2D, 0xE9
	.byte 0x08, 0xD0, 0x4D, 0xE2, 0x7C, 0x24, 0x9F, 0xE5, 0x00, 0xA0, 0xA0, 0xE1, 0x00, 0x40, 0x92, 0xE5
	.byte 0x01, 0x90, 0xA0, 0xE3, 0x06, 0x0C, 0x84, 0xE2, 0xB0, 0x09, 0xD0, 0xE1, 0xC7, 0x7F, 0x84, 0xE2
	.byte 0xB2, 0x90, 0xC1, 0xE1, 0xB2, 0x11, 0xD7, 0xE1, 0x04, 0x00, 0x8D, 0xE5, 0x2C, 0x00, 0x84, 0xE2
	.byte 0x01, 0x6B, 0x80, 0xE2, 0x01, 0x00, 0x51, 0xE3, 0x0B, 0x00, 0xA0, 0x13, 0x0E, 0x01, 0x00, 0x1A
	.byte 0xBC, 0x03, 0xD6, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x00, 0xA0, 0x13, 0x0A, 0x01, 0x00, 0x1A
	.byte 0xB0, 0x01, 0xDA, 0xE1, 0x44, 0x50, 0x96, 0xE5, 0x02, 0x09, 0x10, 0xE3, 0x0F, 0x00, 0x00, 0x0A
	.byte 0x02, 0x00, 0x10, 0xE3, 0xB4, 0x09, 0xD6, 0x01, 0xB4, 0x01, 0xCA, 0x01, 0xB0, 0x01, 0xDA, 0xE1
	.byte 0x04, 0x00, 0x10, 0xE3, 0xB0, 0x0A, 0xD6, 0x01, 0xB6, 0x01, 0xCA, 0x01, 0xB0, 0x01, 0xDA, 0xE1
	.byte 0x08, 0x00, 0x10, 0xE3, 0xB6, 0x09, 0xD6, 0x01, 0xB8, 0x01, 0xCA, 0x01, 0xB0, 0x01, 0xDA, 0xE1
	.byte 0x10, 0x00, 0x10, 0xE3, 0xBC, 0x09, 0xD6, 0x01, 0x00, 0x90, 0xA0, 0x03, 0xBC, 0x01, 0xCA, 0x01
	.byte 0xBC, 0x01, 0xDA, 0xE1, 0x81, 0x0F, 0x50, 0xE3, 0x05, 0x00, 0xA0, 0x83, 0xF2, 0x00, 0x00, 0x8A
	.byte 0x02, 0x10, 0xA0, 0xE3, 0x00, 0x80, 0xA0, 0xE3, 0x04, 0x00, 0x00, 0xEA, 0xB6, 0x01, 0xDA, 0xE1
	.byte 0x01, 0x00, 0x10, 0xE1, 0x81, 0x08, 0xA0, 0xE1, 0x01, 0x80, 0x88, 0x12, 0x20, 0x18, 0xA0, 0xE1
	.byte 0x00, 0x00, 0x51, 0xE3, 0xF8, 0xFF, 0xFF, 0x1A, 0xB4, 0x01, 0xDA, 0xE1, 0xB4, 0x09, 0xC6, 0xE1
	.byte 0xB4, 0x01, 0xDA, 0xE1, 0x02, 0x09, 0x10, 0xE3, 0x0B, 0x00, 0x00, 0x0A, 0x98, 0x13, 0x9F, 0xE5
	.byte 0xEA, 0x20, 0xA0, 0xE3, 0x01, 0x00, 0x00, 0xE0, 0xB4, 0x01, 0xCA, 0xE1, 0xB4, 0x01, 0xDA, 0xE1
	.byte 0xD0, 0x00, 0x40, 0xE2, 0x20, 0x01, 0xA0, 0xE1, 0xBE, 0x20, 0xC5, 0xE1, 0x01, 0x08, 0x50, 0xE3
	.byte 0x15, 0x00, 0x00, 0x9A, 0x05, 0x00, 0xA0, 0xE3, 0xD7, 0x00, 0x00, 0xEA, 0x04, 0x10, 0x9D, 0xE5
	.byte 0x02, 0x00, 0x11, 0xE3, 0x01, 0xB0, 0xA0, 0x13, 0x00, 0xB0, 0xA0, 0x03, 0x06, 0x30, 0x8B, 0xE2
	.byte 0x02, 0x10, 0xA0, 0x13, 0x06, 0x20, 0xA0, 0x13, 0x0B, 0x00, 0x80, 0xE0, 0x02, 0x3C, 0x83, 0xE2
	.byte 0x0B, 0x10, 0xA0, 0x01, 0x0B, 0x20, 0xA0, 0x01, 0x03, 0x00, 0x50, 0xE1, 0x05, 0x00, 0xA0, 0x83
	.byte 0xC9, 0x00, 0x00, 0x8A, 0x00, 0x31, 0xA0, 0xE1, 0xD0, 0x30, 0x83, 0xE2, 0x03, 0x10, 0x81, 0xE0
	.byte 0xB4, 0x11, 0xCA, 0xE1, 0xEA, 0x10, 0x82, 0xE2, 0xBE, 0x10, 0xC5, 0xE1, 0x09, 0x00, 0x80, 0xE2
	.byte 0x01, 0xB0, 0xC0, 0xE3, 0x9B, 0x08, 0x00, 0xE0, 0x00, 0x00, 0x8D, 0xE5, 0x00, 0x10, 0x9D, 0xE5
	.byte 0x62, 0x0F, 0x84, 0xE2, 0x1A, 0x10, 0x81, 0xE2, 0x5F, 0x23, 0x40, 0xEB, 0x90, 0x00, 0x86, 0xE5
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x00, 0xA0, 0x03, 0xB7, 0x00, 0x00, 0x0A, 0x01, 0x00, 0xA0, 0xE3
	.byte 0xBC, 0x03, 0xC6, 0xE1, 0xBE, 0x03, 0xD6, 0xE1, 0x00, 0x20, 0xA0, 0xE3, 0x01, 0x00, 0x80, 0xE2
	.byte 0xBE, 0x03, 0xC6, 0xE1, 0xB8, 0x01, 0xDA, 0xE1, 0x08, 0x30, 0x87, 0xE2, 0xB6, 0x09, 0xC6, 0xE1
	.byte 0xB6, 0x01, 0xDA, 0xE1, 0x14, 0xC0, 0xA0, 0xE3, 0xB8, 0x09, 0xC6, 0xE1, 0xBA, 0x29, 0xC6, 0xE1
	.byte 0xBC, 0x01, 0xDA, 0xE1, 0x8A, 0xEF, 0xA0, 0xE3, 0xBC, 0x09, 0xC6, 0xE1, 0xB2, 0x11, 0xDA, 0xE1
	.byte 0x10, 0x00, 0x85, 0xE2, 0xBE, 0x19, 0xC6, 0xE1, 0xB0, 0x20, 0xC5, 0xE1, 0xB6, 0x71, 0xDA, 0xE1
	.byte 0x98, 0x12, 0x9F, 0xE5, 0xB2, 0x70, 0xC5, 0xE1, 0xB4, 0x20, 0xC5, 0xE1, 0xB8, 0xC0, 0xC5, 0xE1
	.byte 0xBC, 0x71, 0xDA, 0xE1, 0xEA, 0x2F, 0x84, 0xE2, 0x22, 0x70, 0x87, 0xE2, 0xBA, 0x70, 0xC5, 0xE1
	.byte 0xBC, 0xE0, 0xC5, 0xE1, 0xB4, 0xC1, 0xDA, 0xE1, 0xBE, 0x70, 0xD5, 0xE1, 0x0A, 0xC0, 0x8C, 0xE2
	.byte 0x9C, 0x78, 0x27, 0xE0, 0xBE, 0x70, 0xC5, 0xE1, 0x68, 0xE9, 0xFF, 0xEB, 0xB0, 0x01, 0xDA, 0xE1
	.byte 0x02, 0x09, 0x10, 0xE3, 0xB2, 0x12, 0xD5, 0x11, 0x54, 0x02, 0x9F, 0x15, 0x00, 0x00, 0x51, 0x11
	.byte 0x4C, 0x02, 0x9F, 0x05, 0x01, 0x79, 0xA0, 0x13, 0xB2, 0x02, 0xC5, 0x01, 0xB4, 0x01, 0xDA, 0xE1
	.byte 0x00, 0x70, 0xA0, 0x03, 0xB4, 0x02, 0xC5, 0xE1, 0xB6, 0x01, 0xDA, 0xE1, 0x00, 0x00, 0x59, 0xE3
	.byte 0xB6, 0x02, 0xC5, 0xE1, 0xBE, 0x01, 0xDA, 0xE1, 0xB8, 0x02, 0xC5, 0xE1, 0xBC, 0x01, 0xDA, 0x11
	.byte 0x00, 0x00, 0x50, 0x13, 0x04, 0x00, 0x00, 0x0A, 0x73, 0xE9, 0xFF, 0xEB, 0x20, 0x10, 0x9A, 0xE5
	.byte 0xBC, 0x21, 0xDA, 0xE1, 0x2A, 0x00, 0x85, 0xE2, 0x23, 0xEC, 0xFF, 0xEB, 0x04, 0x00, 0x9D, 0xE5
	.byte 0x04, 0x00, 0x10, 0xE3, 0x09, 0x00, 0x00, 0x0A, 0xBC, 0x01, 0xDA, 0xE1, 0x28, 0x10, 0x85, 0xE2
	.byte 0x02, 0x00, 0x80, 0xE2, 0x00, 0x00, 0x81, 0xE0, 0x03, 0x00, 0x80, 0xE2, 0xE4, 0x11, 0x9F, 0xE5
	.byte 0x03, 0x20, 0xC0, 0xE3, 0xE0, 0x01, 0x9F, 0xE5, 0xB0, 0x10, 0xC2, 0xE1, 0xB2, 0x00, 0xC2, 0xE1
	.byte 0x90, 0x00, 0x96, 0xE5, 0x61, 0x1F, 0xA0, 0xE3, 0xBC, 0x10, 0xC0, 0xE1, 0x00, 0x00, 0x9D, 0xE5
	.byte 0x90, 0x10, 0x96, 0xE5, 0x0B, 0x00, 0x80, 0xE2, 0xA0, 0x00, 0xA0, 0xE1, 0xBE, 0x00, 0xC1, 0xE1
	.byte 0xB6, 0x11, 0xDA, 0xE1, 0x90, 0x00, 0x96, 0xE5, 0x00, 0x30, 0xA0, 0xE3, 0xB0, 0x11, 0xC0, 0xE1
	.byte 0x90, 0x00, 0x96, 0xE5, 0x98, 0x91, 0x9F, 0xE5, 0xB4, 0x81, 0xC0, 0xE1, 0x90, 0x00, 0x96, 0xE5
	.byte 0x01, 0x10, 0xA0, 0xE3, 0xB6, 0xB1, 0xC0, 0xE1, 0x90, 0x00, 0x96, 0xE5, 0x02, 0x20, 0xA0, 0xE3
	.byte 0xB8, 0x31, 0xC0, 0xE1, 0x90, 0x00, 0x96, 0xE5, 0x1A, 0x00, 0x80, 0xE2, 0x09, 0x00, 0x00, 0xEA
	.byte 0xB6, 0xC1, 0xDA, 0xE1, 0x02, 0x00, 0x1C, 0xE1, 0xB0, 0x90, 0xC0, 0x11, 0xB2, 0x30, 0xC0, 0x11
	.byte 0xB6, 0x30, 0xC0, 0x11, 0xB4, 0x10, 0xC0, 0x11, 0x82, 0x28, 0xA0, 0xE1, 0x0B, 0x00, 0x80, 0x10
	.byte 0x22, 0x28, 0xA0, 0xE1, 0x01, 0x10, 0x81, 0xE2, 0x00, 0x00, 0x52, 0xE3, 0xF3, 0xFF, 0xFF, 0x1A
	.byte 0xB4, 0x01, 0xDA, 0xE1, 0x44, 0x21, 0x9F, 0xE5, 0xB0, 0x00, 0xC2, 0xE1, 0xBE, 0x00, 0xD5, 0xE1
	.byte 0xB4, 0x00, 0x42, 0xE1, 0xBA, 0x11, 0xDA, 0xE1, 0xB8, 0x01, 0xDA, 0xE1, 0x01, 0x98, 0x61, 0xE2
	.byte 0x00, 0x00, 0x50, 0xE3, 0x19, 0x00, 0x00, 0x1A, 0xB4, 0x0C, 0x52, 0xE1, 0xBC, 0x11, 0xDA, 0xE1
	.byte 0x51, 0x0D, 0x50, 0xE3, 0xB4, 0x01, 0xDA, 0xE1, 0x22, 0x10, 0x81, 0xE2, 0x90, 0x08, 0x02, 0xE0
	.byte 0x01, 0x11, 0xA0, 0xE1, 0x60, 0x30, 0x81, 0xE2, 0xFA, 0x3F, 0x83, 0x12, 0xE2, 0x0F, 0x82, 0xE2
	.byte 0x00, 0x00, 0x83, 0xE0, 0x0A, 0x10, 0xA0, 0xE3, 0x32, 0x00, 0x80, 0xE2, 0x30, 0x5C, 0x40, 0xEB
	.byte 0x00, 0x40, 0xA0, 0xE1, 0xF9, 0x37, 0x40, 0xEB, 0xE4, 0x10, 0x9F, 0xE5, 0xE4, 0x20, 0x9F, 0xE5
	.byte 0x01, 0x10, 0x05, 0xE0, 0xA1, 0x10, 0xA0, 0xE1, 0x02, 0x19, 0x81, 0xE3, 0xB0, 0x40, 0xC2, 0xE1
	.byte 0x07, 0x10, 0x81, 0xE1, 0xB8, 0x18, 0x42, 0xE1, 0xF5, 0x37, 0x40, 0xEB, 0x25, 0x00, 0x00, 0xEA
	.byte 0xEE, 0x37, 0x40, 0xEB, 0xC0, 0x10, 0x9F, 0xE5, 0x00, 0x80, 0xA0, 0xE1, 0xB0, 0x00, 0xD1, 0xE1
	.byte 0x0A, 0x10, 0xA0, 0xE3, 0x00, 0x00, 0x89, 0xE0, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x1B, 0x5C, 0x40, 0xEB, 0xB8, 0x31, 0xDA, 0xE1, 0x03, 0x10, 0x80, 0xE2, 0x03, 0x00, 0x51, 0xE1
	.byte 0x0C, 0x00, 0x00, 0x2A, 0x88, 0x10, 0x9F, 0xE5, 0x88, 0x20, 0x9F, 0xE5, 0x00, 0x30, 0x43, 0xE0
	.byte 0x01, 0x00, 0x05, 0xE0, 0x01, 0x10, 0x43, 0xE2, 0xA0, 0x00, 0xA0, 0xE1, 0x02, 0x09, 0x80, 0xE3
	.byte 0xB0, 0x10, 0xC2, 0xE1, 0x07, 0x10, 0x80, 0xE1, 0x08, 0x00, 0xA0, 0xE1, 0xB8, 0x18, 0x42, 0xE1
	.byte 0xDB, 0x37, 0x40, 0xEB, 0x0B, 0x00, 0x00, 0xEA, 0x08, 0x00, 0xA0, 0xE1, 0xD8, 0x37, 0x40, 0xEB
	.byte 0x90, 0x10, 0x96, 0xE5, 0x62, 0x0F, 0x84, 0xE2, 0xD2, 0x22, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xBC, 0x03, 0xC6, 0xE1, 0xBE, 0x13, 0xD6, 0xE1, 0x05, 0x00, 0xA0, 0xE3, 0x01, 0x10, 0x41, 0xE2
	.byte 0xBE, 0x13, 0xC6, 0xE1, 0x00, 0x00, 0x00, 0xEA, 0x00, 0x00, 0xA0, 0xE3, 0x08, 0xD0, 0x8D, 0xE2
	.byte 0xF8, 0x4F, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xBC, 0x74, 0x7F, 0x02, 0xFF, 0xFF, 0x00, 0x00, 0xB8, 0xB6, 0x00, 0x00, 0x46, 0x1D, 0x00, 0x00
	.byte 0xC4, 0x80, 0x80, 0x04, 0xFF, 0x3F, 0x00, 0x00, 0x18, 0x81, 0x80, 0x04, 0xF8, 0x80, 0x80, 0x04
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x40, 0xA0, 0xE1
	.byte 0x01, 0x08, 0x62, 0xE2, 0xBC, 0x00, 0xC4, 0xE1, 0x00, 0x00, 0xA0, 0xE3, 0xB2, 0x01, 0xC4, 0xE1
	.byte 0xB6, 0x11, 0xD4, 0xE1, 0x10, 0x00, 0x84, 0xE2, 0xB2, 0x12, 0xC4, 0xE1, 0x40, 0xEF, 0xFF, 0xEB
	.byte 0x24, 0x00, 0x9F, 0xE5, 0x04, 0x20, 0xA0, 0xE1, 0x00, 0x10, 0x90, 0xE5, 0x02, 0x0C, 0x81, 0xE2
	.byte 0x65, 0x1F, 0x81, 0xE2, 0xCB, 0x22, 0x40, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x24, 0x00, 0x00, 0xEB
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x01, 0x20, 0xA0, 0xE3, 0xB2, 0x20, 0xC1, 0xE1, 0x00, 0x40, 0xA0, 0xE1
	.byte 0xB0, 0x01, 0xD4, 0xE1, 0x01, 0x00, 0x10, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x1B, 0x03, 0x00, 0xEB
	.byte 0xB0, 0x01, 0xD4, 0xE1, 0x02, 0x00, 0x10, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x34, 0x03, 0x00, 0xEB
	.byte 0xB0, 0x01, 0xD4, 0xE1, 0x04, 0x00, 0x10, 0xE3, 0x00, 0x00, 0x00, 0x0A, 0x45, 0x03, 0x00, 0xEB
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_0201F6AC
sub_0201F6AC: ; 0x0201F6AC
	stmdb sp!, {r3, lr}
	ldrh r2, [r1, #0xe]
	mov r3, #2
	add lr, r1, r2, lsl #1
	ldrh ip, [lr, #0x10]
	mov r2, #0
	strh ip, [r1, #0xc]
	strh r3, [lr, #0x12]
	strh r2, [lr, #0x14]
	ldrh r2, [r1, #0x18]
	strh r2, [lr, #0x16]
	bl sub_03028548
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0201F6AC

	arm_func_start sub_0201F6E4
sub_0201F6E4: ; 0x0201F6E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r1, _0201F8F8 ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r1]
	mov r0, #0xc
	add r1, r2, #0x194
	mla fp, sl, r0, r1
	add r0, r2, #0x2c
	ldrh r1, [fp, #8]
	add r5, r0, #0x400
	mov r0, #0x14
	mla r6, sl, r0, r5
	cmp r1, #0
	add r4, r2, #0x344
	beq _0201F8EC
	mov r0, #0x1000000
	bl sub_0302B118
	ldrh r1, [r6]
	str r0, [sp]
	cmp r1, #0
	beq _0201F744
	bl sub_0302B0E0
	b _0201F8EC
_0201F744:
	ldr r7, [fp]
	mvn r0, #0
	str r0, [sp, #8]
_0201F750:
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _0201F768
	ldr r0, [sp]
	bl sub_0302B0E0
	b _0201F8EC
_0201F768:
	mov r0, r7
	str r7, [sp, #4]
	bl sub_03028270
	mov r1, r7
	add r8, r1, #0x10
	mov r7, r0
	ldrh sb, [r8, #2]
	mov r0, r8
	bl sub_0201FA6C
	cmp r0, #0
	beq _0201F7CC
	ldrh r1, [r5, #0xae]
	mov r0, r8
	add r1, r1, #1
	strh r1, [r5, #0xae]
	mov r1, #2
	strh r1, [r8, #8]
	ldrh r2, [r6, #4]
	mov r1, #0
	add r2, r2, #1
	strh r2, [r6, #4]
	ldr r2, [r6, #0x10]
	mov lr, pc
	bx r2
_0201F7C8:
	.byte 0xE0, 0xFF, 0xFF, 0xEA
_0201F7CC:
	cmp sl, #0
	beq _0201F7EC
	cmp sl, #1
	bne _0201F82C
	mov r0, sb
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _0201F82C
_0201F7EC:
	mov r0, sb
	bl sub_0201B7F0
	cmp r0, #0
	beq _0201F750
	mov r0, sb
	bl sub_0201B7D0
	cmp r0, #0x40
	beq _0201F82C
	mov r2, #2
	mov r0, fp
	sub r1, r8, #0x10
	strh r2, [r8, #8]
	bl sub_0201F6AC
	mov r0, r8
	bl sub_0201B3C4
	b _0201F750
_0201F82C:
	mov r0, #1
	strh r0, [r6]
	ldrh r0, [r6, #2]
	add r0, r0, #1
	strh r0, [r6, #2]
	str r8, [r6, #0xc]
	ldrh r0, [r4, #0x10]
	ldr r5, [r6, #8]
	cmp r0, #0
	bne _0201F85C
	mov r0, #2
	bl sub_020194A4
_0201F85C:
	ldr r1, [sp, #4]
	mov r0, r5
	bl sub_0201F904
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _0201F88C
	mov r0, sb
	bl sub_0201B8DC
	cmp r0, #1
	ldrhih r0, [r5, #0xc]
	orrhi r0, r0, #0x2000
	strhih r0, [r5, #0xc]
_0201F88C:
	ldr r1, _0201F8FC ; =0x00003FFF
	ldr r0, _0201F900 ; =0x048080A0
	ldrh r4, [r8, #0x14]
	and r2, r5, r1
	and r1, r4, #0xc
	cmp r1, #4
	mov r1, r2, lsr #1
	add r3, r0, sl, lsl #2
	moveq r0, r1, lsl #0x10
	moveq r0, r0, lsr #0x10
	orreq r0, r0, #0xa000
	streqh r0, [r3]
	beq _0201F8E4
	and r0, r4, #0xfc
	cmp r0, #0x50
	mov r0, r1, lsl #0x10
	moveq r0, r0, lsr #0x10
	orreq r0, r0, #0x9000
	streqh r0, [r3]
	movne r0, r0, lsr #0x10
	orrne r0, r0, #0x8000
	strneh r0, [r3]
_0201F8E4:
	ldr r0, [sp]
	bl sub_0302B0E0
_0201F8EC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0201F8F8: .word 0x0380FFF4
_0201F8FC: .word 0x00003FFF
_0201F900: .word 0x048080A0
	arm_func_end sub_0201F6E4

	arm_func_start sub_0201F904
sub_0201F904: ; 0x0201F904
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r1, [r4, #0x24]
	mov r5, r0
	tst r1, #0x4000
	beq _0201F9E0
	ldr r0, _0201FA58 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #3
	bne _0201F938
	bl sub_0201999C
_0201F938:
	ldrh r1, [r4, #0xc]
	ldr r0, _0201FA5C ; =0x0000FFFF
	cmp r1, r0
	bne _0201F960
	ldrh r3, [r4, #0x16]
	mov r0, r5
	add r1, r4, #0x18
	add r2, r4, #0x3c
	bl sub_0201A4D0
	b _0201F974
_0201F960:
	ldr r2, [r4, #0x3c]
	ldrh r3, [r4, #0x16]
	mov r0, r5
	add r1, r4, #0x18
	bl sub_0201A4D0
_0201F974:
	ldr r3, _0201FA60 ; =0x04808044
	ldr r1, _0201FA58 ; =0x0380FFF4
	ldrh r2, [r3]
	ldrh r0, [r3]
	add r0, r2, r0, lsl #8
	strh r0, [r5, #0x24]
	ldr r0, [r1]
	ldrh r2, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x36]
	and r2, r2, #0xff
	orr r0, r2, r0, lsl #14
	strh r0, [r5, #0x26]
	ldr r0, [r1]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _0201FA14
	ldrh r0, [r4, #0x22]
	add r1, r5, #0xc
	add r0, r1, r0
	sub r0, r0, #7
	bic r1, r0, #1
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	b _0201FA14
_0201F9E0:
	ldrh r2, [r4, #0xc]
	ldr r1, _0201FA5C ; =0x0000FFFF
	cmp r2, r1
	bne _0201FA04
	ldrh r2, [r4, #0x16]
	add r1, r4, #0x18
	add r2, r2, #0x24
	bl sub_0201A46C
	b _0201FA14
_0201FA04:
	ldr r2, [r4, #0x3c]
	ldrh r3, [r4, #0x16]
	add r1, r4, #0x18
	bl sub_0201A48C
_0201FA14:
	ldr r0, _0201FA58 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _0201FA50
	ldrh r0, [r4, #0x22]
	add r1, r5, #0xc
	add r0, r1, r0
	sub r0, r0, #1
	ldr r1, _0201FA64 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _0201FA68 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_0201FA50:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0201FA58: .word 0x0380FFF4
_0201FA5C: .word 0x0000FFFF
_0201FA60: .word 0x04808044
_0201FA64: .word 0x0000B6B8
_0201FA68: .word 0x00001D46
	arm_func_end sub_0201F904

	arm_func_start sub_0201FA6C
sub_0201FA6C: ; 0x0201FA6C
	ldr r1, _0201FAE8 ; =0x0380FFF4
	ldrh r2, [r0, #0x14]
	ldr r3, [r1]
	mov r1, r2, lsl #0x1c
	add ip, r3, #0x344
	ldrh r3, [ip, #0x8c]
	movs r1, r1, lsr #0x1e
	mov r1, r3, lsl #0x13
	mov r3, r1, lsr #0x10
	bne _0201FAC0
	ldrh r1, [ip, #0xc]
	cmp r1, #1
	bne _0201FAC8
	mov r1, r2, lsl #0x18
	mov r1, r1, lsr #0x1c
	cmp r1, #1
	cmpne r1, #3
	cmpne r1, #0xb
	moveq r1, r3, lsl #0xd
	moveq r3, r1, lsr #0x10
	b _0201FAC8
_0201FAC0:
	mov r1, r3, lsl #0xd
	mov r3, r1, lsr #0x10
_0201FAC8:
	ldr r1, [ip, #0xa8]
	ldrh r0, [r0, #4]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	cmp r3, r0, lsr #16
	movlo r0, #1
	movhs r0, #0
	bx lr
	.align 2, 0
_0201FAE8: .word 0x0380FFF4
	arm_func_end sub_0201FA6C

	arm_func_start sub_0201FAEC
sub_0201FAEC: ; 0x0201FAEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0201FC64 ; =0x0380FFF4
	mov sb, r0
	ldr r4, [r2]
	mov r8, r1
	add r5, r4, #0x194
	add r6, r4, #0x344
	sub r7, sb, #0x10
	bl sub_0201B3C4
	ldrh r0, [sb, #8]
	tst r0, #2
	bne _0201FB80
	ldr r0, [r4, #0x53c]
	add r0, r0, #1
	str r0, [r4, #0x53c]
	ldrh r0, [sb, #0x14]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _0201FB5C
	ldrh r0, [sb, #0x24]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	b _0201FB8C
_0201FB5C:
	ldrh r0, [sb, #0x18]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	b _0201FB8C
_0201FB80:
	ldr r0, [r4, #0x540]
	add r0, r0, #1
	str r0, [r4, #0x540]
_0201FB8C:
	ldrh r0, [sb, #0x14]
	mov r1, r7
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	ldrne r0, [r4, #0x554]
	addne r0, r0, #1
	strne r0, [r4, #0x554]
	mov r0, r5
	bl sub_0201F6AC
	ldr r0, _0201FC64 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x2c]
	ldrh r0, [sb, #2]
	bl sub_0201B810
	cmp r0, #0
	beq _0201FBE8
	ldrh r0, [sb, #0x14]
	tst r0, #0x2000
	bne _0201FBE8
	ldrh r0, [sb, #2]
	bl sub_0201B598
_0201FBE8:
	cmp r8, #0
	beq _0201FC5C
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _0201FC08
	mov r0, #0
	bl sub_0201F6E4
	b _0201FC5C
_0201FC08:
	ldrh r0, [r6, #0xc]
	add r0, r0, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0201FC5C
	ldrh r0, [r6, #8]
	cmp r0, #0x40
	bne _0201FC5C
	ldrh r0, [r6, #0xe]
	cmp r0, #0
	beq _0201FC5C
	ldrh r0, [r6, #0x88]
	bl sub_0201B8DC
	cmp r0, #0
	ldreqh r0, [r6, #0x8e]
	cmpeq r0, #0
	bne _0201FC5C
	mov r0, #1
	bl sub_020194A4
_0201FC5C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0201FC64: .word 0x0380FFF4
	arm_func_end sub_0201FAEC

	arm_func_start sub_0201FC68
sub_0201FC68: ; 0x0201FC68
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _02020130 ; =0x0380FFF4
	mov sl, r0
	ldr r4, [r2]
	ldrh r2, [sl, #8]
	add r0, r4, #4
	ldrh r7, [sl, #2]
	mov sb, r1
	tst r2, #2
	add r8, r4, #0x344
	add r5, r0, #0x400
	add r6, r4, #0x1a0
	bne _0201FCF0
	ldr r0, [r4, #0x53c]
	add r0, r0, #1
	str r0, [r4, #0x53c]
	ldrh r0, [sl, #0x18]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	mov r0, r7
	bl sub_0201B810
	cmp r0, #0
	beq _0201FCFC
	ldrh r0, [sl, #0x14]
	tst r0, #0x2000
	bne _0201FCFC
	mov r0, r7
	bl sub_0201B598
	b _0201FCFC
_0201FCF0:
	ldr r0, [r4, #0x540]
	add r0, r0, #1
	str r0, [r4, #0x540]
_0201FCFC:
	ldrh r0, [sl, #0x14]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	ldrne r0, [r4, #0x554]
	addne r0, r0, #1
	strne r0, [r4, #0x554]
	ldrh r0, [sl, #0xc]
	ldr r1, [r4, #0x544]
	and r0, r0, #0xff
	add r0, r1, r0
	str r0, [r4, #0x544]
	ldrh r0, [sl, #0x14]
	and r4, r0, #0xfc
	cmp r4, #0xa0
	bhi _0201FD58
	bhs _0201FEC0
	cmp r4, #0x10
	bhi _0201FD4C
	beq _0201FDFC
	b _020200E8
_0201FD4C:
	cmp r4, #0x30
	beq _0201FDFC
	b _020200E8
_0201FD58:
	cmp r4, #0xb0
	bhi _0201FD68
	beq _0201FD74
	b _020200E8
_0201FD68:
	cmp r4, #0xc0
	beq _0201FFA4
	b _020200E8
_0201FD74:
	cmp r7, #0
	beq _020200E8
	ldrh r0, [sl, #8]
	tst r0, #2
	bne _020200E8
	ldrh r1, [sl, #0x2c]
	cmp r1, #0
	ldreqh r0, [sl, #0x2e]
	cmpeq r0, #2
	ldreqh r0, [sl, #0x30]
	cmpeq r0, #0
	bne _0201FDC4
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0201B434
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_0201D358
	b _020200E8
_0201FDC4:
	cmp r1, #1
	ldreqh r0, [sl, #0x2e]
	cmpeq r0, #4
	ldreqh r0, [sl, #0x30]
	cmpeq r0, #0
	bne _020200E8
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0201B434
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_0201D358
	b _020200E8
_0201FDFC:
	cmp r7, #0
	beq _020200E8
	ldrh r0, [sl, #8]
	tst r0, #2
	bne _0201FE74
	ldrh r0, [sl, #0x2e]
	cmp r0, #0
	bne _020200E8
	mov r0, r7
	bl sub_0201B7D0
	cmp r0, #0x30
	bne _020200E8
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x40
	bl sub_0201B434
	ldrh r2, [sl, #0x12]
	cmp r4, #0x10
	add r3, sl, #0x14
	bne _0201FE60
	ldrh r1, [sl, #0x30]
	add r0, sl, #0x18
	add r2, r3, r2
	bl sub_0201D450
	b _020200E8
_0201FE60:
	ldrh r1, [sl, #0x30]
	add r0, sl, #0x18
	add r2, r3, r2
	bl sub_0201D548
	b _020200E8
_0201FE74:
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0201B750
	add r0, sl, #0x18
	mov r1, #1
	mov r2, #0
	bl sub_020216AC
	cmp r0, #0
	beq _020200E8
	mov r1, #2
	strh r1, [r0]
	cmp sb, #0
	beq _0201FEB8
	bl sub_02020884
	mov r0, #1
	bl sub_0201F6E4
	b _020200E8
_0201FEB8:
	bl sub_02020884
	b _020200E8
_0201FEC0:
	ldrh r0, [r8, #0xc]
	cmp r0, #1
	bne _0201FF50
	cmp r7, #0
	beq _0201FEF8
	mov r0, r7
	bl sub_0201B7D0
	cmp r0, #0x30
	bls _0201FF68
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0201B434
	b _0201FF68
_0201FEF8:
	ldrh r0, [sl, #0x18]
	tst r0, #1
	beq _0201FF68
	ldr r4, _02020130 ; =0x0380FFF4
	mov r8, #1
	mov r7, #0x30
	b _0201FF38
_0201FF14:
	mov r0, r8
	bl sub_0201B7D0
	cmp r0, #0x30
	bls _0201FF34
	mov r0, r8, lsl #0x10
	mov r1, r7
	mov r0, r0, lsr #0x10
	bl sub_0201B434
_0201FF34:
	add r8, r8, #1
_0201FF38:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _0201FF14
	b _0201FF68
_0201FF50:
	ldrh r0, [r8, #8]
	cmp r0, #0x30
	bls _0201FF68
	mov r0, #0x30
	bl sub_03028A28
	bl sub_0201982C
_0201FF68:
	ldrh r0, [r5]
	cmp r0, #0x71
	ldreq r0, [r5, #4]
	cmpeq sl, r0
	bne _020200E8
	ldrh r0, [sl, #8]
	tst r0, #2
	ldr r0, [r5, #0x1c]
	moveq r1, #0
	movne r1, #0xc
	strh r1, [r0, #4]
	mov r0, #0
	strh r0, [r5]
	bl sub_0201D304
	b _020200E8
_0201FFA4:
	ldrh r0, [r8, #0xc]
	cmp r0, #1
	bne _02020034
	cmp r7, #0
	beq _0201FFDC
	mov r0, r7
	bl sub_0201B7D0
	cmp r0, #0x20
	bls _0202004C
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0201B434
	b _0202004C
_0201FFDC:
	ldrh r0, [sl, #0x18]
	tst r0, #1
	beq _0202004C
	ldr r4, _02020130 ; =0x0380FFF4
	mov r8, #1
	mov fp, #0x20
	b _0202001C
_0201FFF8:
	mov r0, r8
	bl sub_0201B7D0
	cmp r0, #0x20
	bls _02020018
	mov r0, r8, lsl #0x10
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl sub_0201B434
_02020018:
	add r8, r8, #1
_0202001C:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _0201FFF8
	b _0202004C
_02020034:
	ldrh r0, [r8, #8]
	cmp r0, #0x20
	bls _0202004C
	mov r0, #0x20
	bl sub_03028A28
	bl sub_0201982C
_0202004C:
	ldrh r0, [r5]
	cmp r0, #0x41
	ldreq r0, [r5, #4]
	cmpeq sl, r0
	bne _02020084
	ldrh r0, [sl, #8]
	tst r0, #2
	ldr r0, [r5, #0x1c]
	moveq r1, #0
	movne r1, #0xc
	strh r1, [r0, #4]
	mov r0, #0
	strh r0, [r5]
	bl sub_0201D304
_02020084:
	ldrh r0, [sl]
	cmp r0, #1
	bne _020200D4
	cmp r7, #0
	beq _020200C4
	ldr r0, _02020130 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r0]
	mov r0, r7, lsl #0x10
	add r1, r1, #0x500
	ldrh r3, [r1, #0x34]
	mvn r2, r2, lsl r7
	and r2, r3, r2
	mov r0, r0, lsr #0x10
	strh r2, [r1, #0x34]
	bl sub_0201BC1C
_020200C4:
	add r0, sl, #0x18
	mov r1, #1
	bl sub_0201D3D4
	b _020200E8
_020200D4:
	cmp r0, #2
	bne _020200E8
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_0201D3D4
_020200E8:
	mov r0, sl
	bl sub_0201B3C4
	mov r0, r6
	sub r1, sl, #0x10
	bl sub_030280F8
	ldr r0, _02020130 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	cmp sb, #0
	add r0, r0, #0x400
	strh r1, [r0, #0x40]
	ldrneh r0, [r6, #8]
	cmpne r0, #0
	beq _02020128
	mov r0, #1
	bl sub_0201F6E4
_02020128:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02020130: .word 0x0380FFF4
	arm_func_end sub_0201FC68
_02020134:
	.byte 0x5C, 0x20, 0x9F, 0xE5, 0xB4, 0x10, 0xD0, 0xE1, 0x00, 0x30, 0x92, 0xE5
	.byte 0xFF, 0x10, 0x01, 0xE2, 0x44, 0x25, 0x93, 0xE5, 0x01, 0x10, 0x82, 0xE0, 0x44, 0x15, 0x83, 0xE5
	.byte 0xB0, 0x00, 0xD0, 0xE1, 0x02, 0x00, 0x10, 0xE3, 0x40, 0x05, 0x93, 0x15, 0x01, 0x00, 0x80, 0x12
	.byte 0x40, 0x05, 0x83, 0x15, 0x05, 0x00, 0x00, 0x1A, 0x3C, 0x05, 0x93, 0xE5, 0x01, 0x00, 0x80, 0xE2
	.byte 0x3C, 0x05, 0x83, 0xE5, 0x4C, 0x05, 0x93, 0xE5, 0x01, 0x00, 0x80, 0xE2, 0x4C, 0x05, 0x83, 0xE5
	.byte 0x10, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x00, 0x90, 0xE5, 0x01, 0x0B, 0x80, 0xE2
	.byte 0xB4, 0x15, 0xC0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x70, 0x40, 0x2D, 0xE9
	.byte 0xF8, 0x20, 0x9F, 0xE5, 0x00, 0x60, 0xA0, 0xE1, 0x00, 0x20, 0x92, 0xE5, 0x01, 0x50, 0xA0, 0xE1
	.byte 0x50, 0x15, 0x92, 0xE5, 0x5F, 0x4F, 0x82, 0xE2, 0x01, 0x10, 0x81, 0xE2, 0x50, 0x15, 0x82, 0xE5
	.byte 0xB4, 0x11, 0xD6, 0xE1, 0x01, 0x1E, 0xA0, 0xE1, 0x21, 0x1F, 0xB0, 0xE1, 0x08, 0x00, 0x00, 0x1A
	.byte 0x57, 0xEC, 0xFF, 0xEB, 0x30, 0x00, 0x84, 0xE2, 0x24, 0x10, 0x84, 0xE2, 0x10, 0x20, 0x46, 0xE2
	.byte 0xE4, 0x1F, 0x40, 0xEB, 0x06, 0x00, 0xA0, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0x9D, 0xFE, 0xFF, 0xEB
	.byte 0x02, 0x00, 0x00, 0xEA, 0x30, 0x00, 0x84, 0xE2, 0x10, 0x10, 0x46, 0xE2, 0x2A, 0xFD, 0xFF, 0xEB
	.byte 0x98, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0x00, 0x00, 0x91, 0xE5, 0x01, 0x0B, 0x80, 0xE2
	.byte 0xB4, 0x25, 0xC0, 0xE1, 0x00, 0x00, 0x91, 0xE5, 0x5C, 0x04, 0x90, 0xE5, 0xBC, 0x00, 0xD0, 0xE1
	.byte 0x00, 0x09, 0xA0, 0xE1, 0xA0, 0x0F, 0xB0, 0xE1, 0x10, 0x00, 0x00, 0x1A, 0x70, 0x10, 0x9F, 0xE5
	.byte 0x08, 0x00, 0xA0, 0xE3, 0xB0, 0x00, 0xC1, 0xE1, 0x05, 0x00, 0xA0, 0xE3, 0xB2, 0x00, 0xC1, 0xE1
	.byte 0x00, 0x00, 0x55, 0xE3, 0x09, 0x00, 0x00, 0x0A, 0xBC, 0x02, 0xD4, 0xE1, 0x00, 0x00, 0x50, 0xE3
	.byte 0x01, 0x00, 0x00, 0x0A, 0x01, 0x00, 0xA0, 0xE3, 0x21, 0xFD, 0xFF, 0xEB, 0xB0, 0x02, 0xD4, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0x00, 0x00, 0xA0, 0xE3, 0x1C, 0xFD, 0xFF, 0xEB
	.byte 0xB8, 0x03, 0xD4, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x55, 0xE3
	.byte 0x04, 0x00, 0x00, 0x0A, 0x02, 0x00, 0xA0, 0xE3, 0x15, 0xFD, 0xFF, 0xEB, 0x01, 0x00, 0x00, 0xEA
	.byte 0x00, 0x00, 0xA0, 0xE3, 0xC7, 0xED, 0xFF, 0xEB, 0x70, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0xAC, 0x80, 0x80, 0x04, 0x08, 0x20, 0x90, 0xE5, 0x38, 0x10, 0x9F, 0xE5
	.byte 0xB4, 0x30, 0xD2, 0xE1, 0x00, 0x20, 0x91, 0xE5, 0xFF, 0x30, 0x13, 0xE2, 0xA8, 0x15, 0x92, 0x05
	.byte 0x01, 0x10, 0x81, 0x02, 0xA8, 0x15, 0x82, 0x05, 0xA4, 0x15, 0x92, 0x15, 0x03, 0x10, 0x81, 0x10
	.byte 0xA4, 0x15, 0x82, 0x15, 0xB4, 0x20, 0xD0, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0x01, 0x20, 0x82, 0xE2
	.byte 0xB4, 0x20, 0xC0, 0xE1, 0xB0, 0x10, 0xC0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03

	arm_func_start sub_020202F0
sub_020202F0: ; 0x020202F0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0202035C ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_0302B118
	ldr r1, _0202035C ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	bne _02020334
	mov r0, #0
	bl sub_020198AC
_02020334:
	ldr r0, _02020360 ; =0x048080B4
	mov r1, #0xc0
	strh r1, [r0]
	mov r1, #0
	strh r1, [r4, #0x50]
	mov r0, r5
	strh r1, [r4, #0x64]
	bl sub_0302B0E0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0202035C: .word 0x0380FFF4
_02020360: .word 0x048080B4
	arm_func_end sub_020202F0

	arm_func_start sub_02020364
sub_02020364: ; 0x02020364
	stmdb sp!, {r4, lr}
	ldr r1, _020203B0 ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_0302B118
	ldr r1, _020203B4 ; =0x048080B4
	mov r2, #2
	strh r2, [r1]
	ldrh r1, [r4, #0x3c]
	mov r4, r0
	cmp r1, #0
	beq _020203A0
	bl sub_0302A4A4
_020203A0:
	mov r0, r4
	bl sub_0302B0E0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020203B0: .word 0x0380FFF4
_020203B4: .word 0x048080B4
	arm_func_end sub_02020364

	arm_func_start sub_020203B8
sub_020203B8: ; 0x020203B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02020458 ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_0302B118
	ldr r1, _02020458 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldr r0, _0202045C ; =0x048080B4
	bne _02020420
	mov r1, #9
	strh r1, [r0]
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _02020410
	mov r0, #2
	bl sub_02020460
_02020410:
	mov r0, #2
	mov r1, #1
	bl sub_020207E0
	b _02020428
_02020420:
	mov r1, #1
	strh r1, [r0]
_02020428:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0202043C
	mov r0, #0
	bl sub_02020460
_0202043C:
	mov r0, #0
	mov r1, #1
	bl sub_020207E0
	mov r0, r5
	bl sub_0302B0E0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02020458: .word 0x0380FFF4
_0202045C: .word 0x048080B4
	arm_func_end sub_020203B8

	arm_func_start sub_02020460
sub_02020460: ; 0x02020460
	stmdb sp!, {r3, lr}
	ldr r2, _020204C0 ; =0x0380FFF4
	mov r1, #0x14
	ldr r2, [r2]
	mul r1, r0, r1
	add r0, r2, #0x2c
	add r2, r0, #0x400
	ldrh r0, [r2, r1]
	add r2, r2, r1
	cmp r0, #0
	beq _020204B8
	ldr r0, [r2, #8]
	ldrh r1, [r0]
	ldr r0, [r2, #0xc]
	cmp r1, #0
	moveq r1, #2
	strh r1, [r0, #8]
	ldr r0, [r2, #0xc]
	ldr r2, [r2, #0x10]
	mov r1, #0
	mov lr, pc
	bx r2
_020204B8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020204C0: .word 0x0380FFF4
	arm_func_end sub_02020460

	arm_func_start sub_020204C4
sub_020204C4: ; 0x020204C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02020544 ; =0x0380FFF4
	mov r7, r0
	mov r0, #0x14
	ldr r1, [r1]
	mul r4, r7, r0
	add r0, r1, #0x2c
	add r5, r0, #0x400
	mov r0, #0x1000000
	add r6, r5, r4
	bl sub_0302B118
	ldr r1, _02020548 ; =0x027F7870
	mov r2, r7, lsl #1
	ldrh r2, [r1, r2]
	ldr r1, _0202054C ; =0x048080B4
	strh r2, [r1]
	ldrh r1, [r5, r4]
	cmp r1, #0
	beq _02020538
	ldr r2, [r6, #0xc]
	ldrh r1, [r2, #0x14]
	tst r1, #0x4000
	ldreq r1, [r6, #8]
	ldreqh r1, [r1, #4]
	streqh r1, [r2, #0xc]
	ldr r2, [r6, #8]
	ldr r1, [r6, #0xc]
	ldrh r2, [r2, #0x22]
	strh r2, [r1, #0x2a]
_02020538:
	bl sub_0302B0E0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02020544: .word 0x0380FFF4
_02020548: .word 0x027F7870
_0202054C: .word 0x048080B4
	arm_func_end sub_020204C4

	arm_func_start sub_02020550
sub_02020550: ; 0x02020550
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r7, #0
	bl sub_0201B8DC
	cmp r0, #0
	beq _0202063C
	mov r8, r7
_0202056C:
	ldr r0, _02020644 ; =0x0380FFF4
	mov r1, #0xc
	ldr r2, [r0]
	mul sl, r8, r1
	sub r0, r1, #0xd
	add r1, r2, sl
	ldr r5, [r1, #0x194]
	cmp r5, r0
	beq _02020630
	mov r0, #0x14
	mul sb, r8, r0
	mvn r4, #0
_0202059C:
	mov r0, r5
	bl sub_03028270
	add r6, r5, #0x10
	ldrh r1, [r6, #2]
	str r0, [sp]
	cmp r1, fp
	bne _02020620
	cmp r8, #1
	ldrne r0, _02020644 ; =0x0380FFF4
	ldrne r0, [r0]
	addne r0, sb, r0
	ldrne r0, [r0, #0x438]
	cmpne r6, r0
	bne _020205F0
	mov r0, r6
	bl sub_0201B3C4
	mov r1, #0
	mov r0, r6
	strh r1, [r6, #2]
	bl sub_0201B334
	b _02020620
_020205F0:
	mov r0, #2
	strh r0, [r6, #8]
	mov r0, r6
	bl sub_0201B3C4
	ldr r0, _02020644 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x194
	add r0, r0, sl
	bl sub_0201F6AC
	cmp r7, #0
	moveq r7, #1
_02020620:
	ldr r5, [sp]
	mov r0, r5
	cmp r0, r4
	bne _0202059C
_02020630:
	add r8, r8, #1
	cmp r8, #3
	blo _0202056C
_0202063C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02020644: .word 0x0380FFF4
	arm_func_end sub_02020550

	arm_func_start sub_02020648
sub_02020648: ; 0x02020648
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020206F4 ; =0x0380FFF4
	ldrh r1, [r0]
	ldr r2, [r4]
	tst r1, #1
	beq _0202069C
	add r0, r2, #0x300
	ldrh r0, [r0, #0x22]
	mov r5, #1
	cmp r0, #1
	bls _020206EC
	b _02020684
_02020678:
	mov r0, r5
	bl sub_02020550
	add r5, r5, #1
_02020684:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r5, r0
	blo _02020678
	b _020206EC
_0202069C:
	bl sub_0201B0F0
	mov r4, r0
	cmp r4, #0xff
	beq _020206B0
	bl sub_02020550
_020206B0:
	ldr r0, _020206F4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2e]
	cmp r0, #1
	bne _020206EC
	mov r0, r4
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _020206EC
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0201B434
	bl sub_020202F0
_020206EC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020206F4: .word 0x0380FFF4
	arm_func_end sub_02020648

	arm_func_start sub_020206F8
sub_020206F8: ; 0x020206F8
	stmdb sp!, {r4, lr}
	ldr r0, _020207DC ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x300
	ldrh r1, [r0, #0x50]
	add r0, r2, #0x2c
	cmp r1, #1
	add r4, r0, #0x400
	beq _0202072C
	cmp r1, #2
	cmpne r1, #3
	beq _02020788
	b _020207B0
_0202072C:
	mov r0, #0
	mov r1, #1
	bl sub_020207E0
	mov r0, #1
	mov r1, #0
	bl sub_020207E0
	mov r0, #2
	mov r1, #1
	bl sub_020207E0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _020207D4
	mov r0, #0
	strh r0, [r4, #0x3c]
	ldrh r1, [r4, #0x3e]
	ldr r0, _020207DC ; =0x0380FFF4
	sub r1, r1, #1
	strh r1, [r4, #0x3e]
	ldr r0, [r0]
	ldr r1, [r4, #0x90]
	add r0, r0, #0x188
	bl sub_030280F8
	b _020207D4
_02020788:
	mov r0, #0
	mov r1, #1
	bl sub_020207E0
	mov r0, #1
	mov r1, #0
	bl sub_020207E0
	mov r0, #2
	mov r1, #0
	bl sub_020207E0
	b _020207D4
_020207B0:
	mov r0, #0
	mov r1, r0
	bl sub_020207E0
	mov r0, #1
	mov r1, #0
	bl sub_020207E0
	mov r0, #2
	mov r1, #0
	bl sub_020207E0
_020207D4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020207DC: .word 0x0380FFF4
	arm_func_end sub_020206F8

	arm_func_start sub_020207E0
sub_020207E0: ; 0x020207E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, _02020868 ; =0x0380FFF4
	mov r2, #0xc
	mov sl, r0
	mul r8, sl, r2
	ldr r3, [r5]
	sub r0, r2, #0xd
	add r2, r3, r8
	ldr r6, [r2, #0x194]
	mov sb, r1
	cmp r6, r0
	beq _02020860
	mov fp, #2
	mvn r4, #0
_02020818:
	mov r0, r6
	bl sub_03028270
	mov r7, r0
	cmp sl, #2
	beq _02020834
	add r0, r6, #0x10
	bl sub_0201B3C4
_02020834:
	strh fp, [r6, #0x18]
	cmp sb, #0
	beq _02020854
	ldr r0, [r5]
	mov r1, r6
	add r0, r0, #0x194
	add r0, r0, r8
	bl sub_0201F6AC
_02020854:
	mov r6, r7
	cmp r7, r4
	bne _02020818
_02020860:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02020868: .word 0x0380FFF4
	arm_func_end sub_020207E0

	arm_func_start sub_0202086C
sub_0202086C: ; 0x0202086C
	stmdb sp!, {r3, lr}
	bl sub_02020884
	mov r0, #1
	bl sub_0201F6E4
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0202086C

	arm_func_start sub_02020884
sub_02020884: ; 0x02020884
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x18
	bl sub_0201B0F0
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	cmp r0, #0xff
	moveq r0, #0
	streqh r0, [r4, #2]
	ldr r0, _020208F4 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0x14]
	tst r0, #0x4000
	ldrneh r0, [r4, #0x12]
	addne r0, r0, #8
	strneh r0, [r4, #0x12]
	mov r0, r4
	bl sub_0201B334
	ldr r0, _020208F4 ; =0x0380FFF4
	sub r2, r4, #0x10
	ldr r1, [r0]
	add r0, r1, #0x188
	add r1, r1, #0x1a0
	bl sub_03028178
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020208F4: .word 0x0380FFF4
	arm_func_end sub_02020884

	arm_func_start sub_020208F8
sub_020208F8: ; 0x020208F8
	stmdb sp!, {r4, lr}
	ldr r0, _02020980 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x54
	add r4, r0, #0x400
	ldrh r1, [r4, #2]
	add r0, r2, #0x400
	add r1, r1, #1
	strh r1, [r4, #2]
	ldrh r0, [r0, #0x54]
	mov r1, #0
	cmp r0, #0
	ldrne r0, [r4, #8]
	strneh r1, [r0, #4]
	bne _02020978
	mov r0, #1
	strh r0, [r4]
	ldr r0, [r4, #8]
	strh r1, [r0]
	ldr r0, [r4, #8]
	strh r1, [r0, #4]
	bl sub_02019D68
	ldr r2, [r4, #8]
	ldr r1, _02020984 ; =0x00003FFF
	strh r0, [r2, #8]
	ldr r0, [r4, #8]
	ldr r2, _02020988 ; =0x048080A8
	and r0, r0, r1
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	orr r0, r0, #0x8000
	strh r0, [r2]
_02020978:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02020980: .word 0x0380FFF4
_02020984: .word 0x00003FFF
_02020988: .word 0x048080A8
	arm_func_end sub_020208F8
_0202098C:
	.byte 0x30, 0x00, 0x9F, 0xE5
	.byte 0x01, 0x20, 0xA0, 0xE3, 0x00, 0x30, 0x90, 0xE5, 0x01, 0x19, 0x62, 0xE2, 0x01, 0x0B, 0x83, 0xE2
	.byte 0xB4, 0x2A, 0xC0, 0xE1, 0xA4, 0x00, 0x83, 0xE2, 0x08, 0x24, 0x90, 0xE5, 0x14, 0x00, 0x9F, 0xE5
	.byte 0x01, 0x10, 0x02, 0xE0, 0xA1, 0x10, 0xA0, 0xE1, 0x02, 0x19, 0x81, 0xE3, 0xB0, 0x10, 0xC0, 0xE1
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0x80, 0x80, 0x80, 0x04, 0x18, 0x10, 0x9F, 0xE5
	.byte 0x18, 0x00, 0x9F, 0xE5, 0x00, 0x20, 0x91, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1
	.byte 0x01, 0x0B, 0x82, 0xE2, 0xB4, 0x1A, 0xC0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x80, 0x80, 0x80, 0x04, 0xF0, 0x47, 0x2D, 0xE9, 0x50, 0x13, 0x9F, 0xE5, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x00, 0x10, 0x91, 0xE5, 0xAC, 0x84, 0x91, 0xE5, 0xC7, 0x5F, 0x81, 0xE2, 0xB0, 0x00, 0xC8, 0xE1
	.byte 0xB2, 0x00, 0xC8, 0xE1, 0xB4, 0x00, 0xC8, 0xE1, 0xB6, 0x00, 0xC8, 0xE1, 0xD1, 0x6F, 0x81, 0xE2
	.byte 0xD0, 0xE4, 0xFF, 0xEB, 0xB8, 0x00, 0xC8, 0xE1, 0x80, 0x00, 0xA0, 0xE3, 0xBC, 0x00, 0xC8, 0xE1
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x08, 0x20, 0x85, 0xE2, 0xBE, 0x00, 0xC8, 0xE1, 0x10, 0x13, 0x9F, 0xE5
	.byte 0x10, 0x00, 0x88, 0xE2, 0x02, 0x30, 0xA0, 0xE1, 0xB4, 0xE3, 0xFF, 0xEB, 0x00, 0x10, 0xA0, 0xE3
	.byte 0xB2, 0x12, 0xC8, 0xE1, 0x24, 0xA0, 0x88, 0xE2, 0x24, 0x10, 0x88, 0xE5, 0x04, 0x10, 0x8A, 0xE5
	.byte 0xBE, 0x06, 0xD6, 0xE1, 0x0C, 0x90, 0x8A, 0xE2, 0xB8, 0x00, 0xCA, 0xE1, 0xBC, 0x07, 0xD6, 0xE1
	.byte 0xBA, 0x00, 0xCA, 0xE1, 0xBE, 0x01, 0xD5, 0xE1, 0x80, 0x0F, 0xA0, 0xE1, 0xA0, 0x0F, 0xB0, 0xE1
	.byte 0x1B, 0x00, 0x00, 0x1A, 0x0A, 0x00, 0x49, 0xE0, 0xB2, 0x09, 0xC6, 0xE1, 0x09, 0x00, 0xA0, 0xE1
	.byte 0x9F, 0xE6, 0xFF, 0xEB, 0xBE, 0x11, 0xD6, 0xE1, 0x01, 0x00, 0x89, 0xE2, 0xFF, 0x10, 0x01, 0xE2
	.byte 0x02, 0x90, 0x89, 0xE2, 0x9A, 0xE6, 0xFF, 0xEB, 0x00, 0x70, 0xA0, 0xE3, 0x20, 0x40, 0x86, 0xE2
	.byte 0x06, 0x00, 0x00, 0xEA, 0x07, 0x00, 0x84, 0xE0, 0xA0, 0xE6, 0xFF, 0xEB, 0x00, 0x10, 0xA0, 0xE1
	.byte 0x09, 0x00, 0xA0, 0xE1, 0x92, 0xE6, 0xFF, 0xEB, 0x01, 0x90, 0x89, 0xE2, 0x01, 0x70, 0x87, 0xE2
	.byte 0xBE, 0x01, 0xD6, 0xE1, 0x00, 0x00, 0x57, 0xE1, 0xF5, 0xFF, 0xFF, 0x3A, 0x00, 0x00, 0xE0, 0xE3
	.byte 0x07, 0x00, 0x40, 0xE0, 0x00, 0x00, 0x89, 0xE0, 0xFF, 0x10, 0x07, 0xE2, 0x88, 0xE6, 0xFF, 0xEB
	.byte 0x00, 0x00, 0x00, 0xEA, 0xB2, 0x19, 0xC6, 0xE1, 0x09, 0x00, 0xA0, 0xE1, 0x6F, 0x03, 0x00, 0xEB
	.byte 0x00, 0x90, 0x89, 0xE0, 0x09, 0x00, 0xA0, 0xE1, 0x03, 0x10, 0xA0, 0xE3, 0x80, 0xE6, 0xFF, 0xEB
	.byte 0x01, 0x00, 0x89, 0xE2, 0x01, 0x10, 0xA0, 0xE3, 0x7D, 0xE6, 0xFF, 0xEB, 0xBA, 0x17, 0xD6, 0xE1
	.byte 0x02, 0x00, 0x89, 0xE2, 0xFF, 0x10, 0x01, 0xE2, 0x79, 0xE6, 0xFF, 0xEB, 0x03, 0x00, 0x89, 0xE2
	.byte 0x0A, 0x10, 0x40, 0xE0, 0xB4, 0x19, 0xC6, 0xE1, 0xB4, 0x29, 0xD6, 0xE1, 0x14, 0x12, 0x9F, 0xE5
	.byte 0x02, 0x20, 0x82, 0xE2, 0xB0, 0x20, 0xC1, 0xE1, 0x05, 0x10, 0xA0, 0xE3, 0x70, 0xE6, 0xFF, 0xEB
	.byte 0x04, 0x00, 0x89, 0xE2, 0x05, 0x10, 0xA0, 0xE3, 0x6D, 0xE6, 0xFF, 0xEB, 0x05, 0x00, 0x89, 0xE2
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x6A, 0xE6, 0xFF, 0xEB, 0x06, 0x00, 0x89, 0xE2, 0xB4, 0x17, 0xD6, 0xE1
	.byte 0xFF, 0x10, 0x01, 0xE2, 0x66, 0xE6, 0xFF, 0xEB, 0x07, 0x00, 0x89, 0xE2, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x63, 0xE6, 0xFF, 0xEB, 0x08, 0x00, 0x89, 0xE2, 0x00, 0x10, 0xA0, 0xE3, 0x60, 0xE6, 0xFF, 0xEB
	.byte 0x09, 0x00, 0x89, 0xE2, 0x00, 0x10, 0xA0, 0xE3, 0x5D, 0xE6, 0xFF, 0xEB, 0x0A, 0x00, 0x89, 0xE2
	.byte 0x0A, 0x10, 0x40, 0xE0, 0xB6, 0x19, 0xC6, 0xE1, 0xB6, 0x29, 0xD6, 0xE1, 0xDD, 0x10, 0xA0, 0xE3
	.byte 0x01, 0x20, 0x02, 0xE2, 0xB2, 0x2A, 0xC6, 0xE1, 0x55, 0xE6, 0xFF, 0xEB, 0x0B, 0x00, 0x89, 0xE2
	.byte 0xB0, 0x1A, 0xD6, 0xE1, 0x08, 0x10, 0x81, 0xE2, 0xFF, 0x10, 0x01, 0xE2, 0x50, 0xE6, 0xFF, 0xEB
	.byte 0x0C, 0x00, 0x89, 0xE2, 0x00, 0x10, 0xA0, 0xE3, 0x4D, 0xE6, 0xFF, 0xEB, 0x0D, 0x00, 0x89, 0xE2
	.byte 0x09, 0x10, 0xA0, 0xE3, 0x4A, 0xE6, 0xFF, 0xEB, 0x0E, 0x00, 0x89, 0xE2, 0xBF, 0x10, 0xA0, 0xE3
	.byte 0x47, 0xE6, 0xFF, 0xEB, 0x0F, 0x00, 0x89, 0xE2, 0x00, 0x10, 0xA0, 0xE3, 0x44, 0xE6, 0xFF, 0xEB
	.byte 0xBE, 0x00, 0xD6, 0xE1, 0x01, 0x00, 0x50, 0xE3, 0x0A, 0x00, 0x00, 0x1A, 0xB0, 0x12, 0xD5, 0xE1
	.byte 0x10, 0x00, 0x89, 0xE2, 0xFF, 0x10, 0x01, 0xE2, 0x3D, 0xE6, 0xFF, 0xEB, 0xB0, 0x12, 0xD5, 0xE1
	.byte 0x11, 0x00, 0x89, 0xE2, 0x41, 0x14, 0xA0, 0xE1, 0xFF, 0x10, 0x01, 0xE2, 0x12, 0x90, 0x89, 0xE2
	.byte 0x37, 0xE6, 0xFF, 0xEB, 0x06, 0x00, 0x00, 0xEA, 0x10, 0x00, 0x89, 0xE2, 0xFF, 0x10, 0xA0, 0xE3
	.byte 0x33, 0xE6, 0xFF, 0xEB, 0x11, 0x00, 0x89, 0xE2, 0xFF, 0x10, 0xA0, 0xE3, 0x12, 0x90, 0x89, 0xE2
	.byte 0x2F, 0xE6, 0xFF, 0xEB, 0x00, 0x11, 0x9F, 0xE5, 0x09, 0x00, 0xA0, 0xE1, 0xB0, 0x40, 0xD1, 0xE1
	.byte 0xFF, 0x10, 0x04, 0xE2, 0x2A, 0xE6, 0xFF, 0xEB, 0x24, 0x14, 0xA0, 0xE1, 0x01, 0x00, 0x89, 0xE2
	.byte 0xFF, 0x10, 0x01, 0xE2, 0x02, 0x90, 0x89, 0xE2, 0x25, 0xE6, 0xFF, 0xEB, 0x9C, 0x40, 0x96, 0xE5
	.byte 0x00, 0x50, 0xA0, 0xE3, 0x07, 0x00, 0x00, 0xEA, 0x04, 0x00, 0xA0, 0xE1, 0x2B, 0xE6, 0xFF, 0xEB
	.byte 0x00, 0x10, 0xA0, 0xE1, 0x09, 0x00, 0xA0, 0xE1, 0x1D, 0xE6, 0xFF, 0xEB, 0x01, 0x90, 0x89, 0xE2
	.byte 0x01, 0x40, 0x84, 0xE2, 0x01, 0x50, 0x85, 0xE2, 0xB0, 0x1A, 0xD6, 0xE1, 0x01, 0x00, 0x55, 0xE1
	.byte 0xF4, 0xFF, 0xFF, 0x3A, 0xB2, 0x0A, 0xD6, 0xE1, 0x00, 0x00, 0x50, 0xE3, 0x10, 0x00, 0x00, 0x0A
	.byte 0x9C, 0x00, 0x96, 0xE5, 0x00, 0x00, 0x51, 0xE3, 0x01, 0x00, 0x80, 0xE0, 0x01, 0x50, 0x40, 0xE2
	.byte 0x00, 0x40, 0xA0, 0xE3, 0x0A, 0x00, 0x00, 0x9A, 0x06, 0x00, 0x00, 0xEA, 0x05, 0x00, 0xA0, 0xE1
	.byte 0x16, 0xE6, 0xFF, 0xEB, 0x00, 0x10, 0xA0, 0xE1, 0x01, 0x00, 0x85, 0xE2, 0x08, 0xE6, 0xFF, 0xEB
	.byte 0x01, 0x40, 0x84, 0xE2, 0x01, 0x50, 0x45, 0xE2, 0xB0, 0x0A, 0xD6, 0xE1, 0x00, 0x00, 0x54, 0xE1
	.byte 0xF5, 0xFF, 0xFF, 0x3A, 0x44, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x06, 0x0C, 0x80, 0xE2
	.byte 0xB0, 0x09, 0xD0, 0xE1, 0x04, 0x00, 0x10, 0xE3, 0x05, 0x00, 0x00, 0x0A, 0x3C, 0x10, 0x9F, 0xE5
	.byte 0x03, 0x00, 0x89, 0xE2, 0x03, 0x20, 0xC0, 0xE3, 0x34, 0x00, 0x9F, 0xE5, 0xB0, 0x10, 0xC2, 0xE1
	.byte 0xB2, 0x00, 0xC2, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0x1C, 0x00, 0x89, 0xE2, 0xB4, 0x1A, 0xC6, 0xE1
	.byte 0x0A, 0x00, 0x40, 0xE0, 0xBA, 0x00, 0xC8, 0xE1, 0xF0, 0x47, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xF4, 0xFF, 0x80, 0x03, 0xA4, 0x74, 0x7F, 0x02, 0x84, 0x80, 0x80, 0x04, 0xF0, 0xFF, 0x80, 0x03
	.byte 0xB8, 0xB6, 0x00, 0x00, 0x46, 0x1D, 0x00, 0x00, 0x38, 0x40, 0x2D, 0xE9, 0xE0, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x90, 0xE5, 0xD1, 0x4F, 0x80, 0xE2, 0xAC, 0x14, 0x90, 0xE5, 0xB0, 0x2A, 0xD4, 0xE1
	.byte 0xB6, 0x09, 0xD4, 0xE1, 0x24, 0x10, 0x81, 0xE2, 0x00, 0x00, 0x52, 0xE3, 0x00, 0x50, 0x81, 0xE0
	.byte 0x10, 0x00, 0x00, 0x0A, 0xB2, 0x0A, 0xD4, 0xE1, 0x9C, 0x10, 0x94, 0xE5, 0x01, 0x00, 0x10, 0xE3
	.byte 0x0A, 0x00, 0x85, 0xE2, 0x09, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x40, 0xE2, 0x02, 0x20, 0x82, 0xE2
	.byte 0xAD, 0xE5, 0xFF, 0xEB, 0x9C, 0x10, 0x9F, 0xE5, 0x09, 0x00, 0x85, 0xE2, 0xB0, 0x10, 0xD1, 0xE1
	.byte 0x41, 0x14, 0xA0, 0xE1, 0xFF, 0x10, 0x01, 0xE2, 0xD1, 0xE5, 0xFF, 0xEB, 0x01, 0x00, 0x00, 0xEA
	.byte 0x01, 0x20, 0x82, 0xE2, 0xA4, 0xE5, 0xFF, 0xEB, 0x74, 0x00, 0x9F, 0xE5, 0xB6, 0x29, 0xD4, 0xE1
	.byte 0x00, 0x00, 0x90, 0xE5, 0xB0, 0x1A, 0xD4, 0xE1, 0x26, 0x20, 0x82, 0xE2, 0xAC, 0x04, 0x90, 0xE5
	.byte 0x01, 0x10, 0x82, 0xE0, 0xBA, 0x10, 0xC0, 0xE1, 0xB0, 0x1A, 0xD4, 0xE1, 0x01, 0x00, 0x85, 0xE2
	.byte 0x08, 0x10, 0x81, 0xE2, 0xFF, 0x10, 0x01, 0xE2, 0xC1, 0xE5, 0xFF, 0xEB, 0x40, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x00, 0x90, 0xE5, 0x06, 0x0C, 0x80, 0xE2, 0xB0, 0x09, 0xD0, 0xE1, 0x04, 0x00, 0x10, 0xE3
	.byte 0x07, 0x00, 0x00, 0x0A, 0xB0, 0x0A, 0xD4, 0xE1, 0x0D, 0x10, 0x85, 0xE2, 0x00, 0x00, 0x81, 0xE0
	.byte 0x24, 0x10, 0x9F, 0xE5, 0x03, 0x20, 0xC0, 0xE3, 0x20, 0x00, 0x9F, 0xE5, 0xB0, 0x10, 0xC2, 0xE1
	.byte 0xB2, 0x00, 0xC2, 0xE1, 0x00, 0x00, 0xA0, 0xE3, 0xB4, 0x0A, 0xC4, 0xE1, 0x38, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03, 0xF0, 0xFF, 0x80, 0x03, 0xB8, 0xB6, 0x00, 0x00
	.byte 0x46, 0x1D, 0x00, 0x00

	arm_func_start sub_02020E64
sub_02020E64: ; 0x02020E64
	ldr r0, _02020E90 ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x500
	add r0, r0, #0x100
	ldrh r1, [r1, #0x38]
	ldrh r2, [r0, #0xa8]
	rsb r0, r1, #0x18
	cmp r2, r0
	movlt r0, #1
	movge r0, #0
	bx lr
	.align 2, 0
_02020E90: .word 0x0380FFF4
	arm_func_end sub_02020E64

	arm_func_start sub_02020E94
sub_02020E94: ; 0x02020E94
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02020F08 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x36
	bl sub_0302805C
	movs r4, r0
	bne _02020ECC
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _02020F00
_02020ECC:
	ldr r0, _02020F0C ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_02021798
	strh r5, [r4, #0x3c]
	mov r0, #2
	strh r0, [r4, #0x16]
	add r0, r0, #0x1c
	strh r0, [r4, #0x22]
	mov r0, #0xa0
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_02020F00:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02020F08: .word 0x0380FFF4
_02020F0C: .word 0x0000FFFF
	arm_func_end sub_02020E94

	arm_func_start sub_02020F10
sub_02020F10: ; 0x02020F10
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02020FB0 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	mov r1, #0x5e
	add r0, r2, #0x188
	add r5, r2, #0x344
	bl sub_0302805C
	movs r4, r0
	bne _02020F48
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _02020FA8
_02020F48:
	ldr r0, _02020FB4 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_02021798
	ldrh r1, [r5, #0x7c]
	add r0, r4, #0x40
	strh r1, [r4, #0x3c]
	ldrh r1, [r5, #0x70]
	strh r1, [r4, #0x3e]
	bl sub_0202184C
	mov r5, r0
	add r0, r4, #0x40
	add r0, r0, r5
	bl sub_020218C0
	add r0, r5, r0
	add r0, r0, #4
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_02020FA8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02020FB0: .word 0x0380FFF4
_02020FB4: .word 0x0000FFFF
	arm_func_end sub_02020F10

	arm_func_start sub_02020FB8
sub_02020FB8: ; 0x02020FB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02021064 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	mov r1, #0x64
	add r0, r2, #0x188
	add r5, r2, #0x344
	bl sub_0302805C
	movs r4, r0
	bne _02020FF0
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _0202105C
_02020FF0:
	ldr r0, _02021068 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_02021798
	ldrh r1, [r5, #0x7c]
	add r0, r4, #0x40
	strh r1, [r4, #0x3c]
	ldrh r2, [r5, #0x70]
	add r1, r5, #0x82
	strh r2, [r4, #0x3e]
	bl sub_020198D0
	add r0, r4, #0x46
	bl sub_0202184C
	mov r5, r0
	add r0, r4, #0x46
	add r0, r0, r5
	bl sub_020218C0
	add r0, r5, r0
	add r0, r0, #0xa
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x20
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_0202105C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02021064: .word 0x0380FFF4
_02021068: .word 0x0000FFFF
	arm_func_end sub_02020FB8

	arm_func_start sub_0202106C
sub_0202106C: ; 0x0202106C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _020211D8 ; =0x0380FFF4
	mov r7, r1
	ldr r1, [r3]
	mov r8, r0
	add r0, r1, #0x188
	mov r1, #0x60
	mov r6, r2
	bl sub_0302805C
	movs r4, r0
	bne _020210A8
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _020211D0
_020210A8:
	ldr r0, _020211DC ; =0x0000FFFF
	cmp r7, #0
	strh r0, [r4, #0xc]
	bne _020210CC
	mov r0, r8
	bl sub_0201B6A0
	movs r5, r0
	moveq r7, #0x13
	b _020210D0
_020210CC:
	mov r5, #0
_020210D0:
	mov r0, r8
	bl sub_0201B830
	mov r1, r0
	add r0, r4, #0x10
	bl sub_02021798
	ldr r0, _020211D8 ; =0x0380FFF4
	cmp r5, #0
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xc0]
	strh r0, [r4, #0x3c]
	strh r7, [r4, #0x3e]
	strh r5, [r4, #0x40]
	ldrneh r0, [r4, #0x40]
	orrne r0, r0, #0xc000
	strneh r0, [r4, #0x40]
	add r0, r4, #0x42
	bl sub_020218C0
	add r0, r0, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x10
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	add r1, r4, #0x24
	cmp r6, #0
	add r8, r1, r0
	beq _020211B4
	add r0, r6, #1
	bl sub_0201A540
	mov sb, r0
	mov r0, r6
	bl sub_0201A540
	mov r1, r0
	mov r0, r8
	bl sub_0201A514
	add r0, r8, #1
	and r1, sb, #0xff
	add r8, r8, #2
	bl sub_0201A514
	cmp sb, #0
	mov r7, #0
	bls _020211CC
	add r5, r6, #2
	b _020211A8
_0202118C:
	add r0, r5, r7
	bl sub_0201A540
	mov r1, r0
	mov r0, r8
	bl sub_0201A514
	add r7, r7, #1
	add r8, r8, #1
_020211A8:
	cmp r7, sb
	blo _0202118C
	b _020211CC
_020211B4:
	mov r0, r8
	mov r1, #0
	bl sub_0201A514
	add r0, r8, #1
	mov r1, #0
	bl sub_0201A514
_020211CC:
	add r0, r4, #0x10
_020211D0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_020211D8: .word 0x0380FFF4
_020211DC: .word 0x0000FFFF
	arm_func_end sub_0202106C

	arm_func_start sub_020211E0
sub_020211E0: ; 0x020211E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _02021338 ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r8, r0
	add r0, r1, #0x188
	mov r1, #0x60
	mov r5, r2
	bl sub_0302805C
	movs r4, r0
	bne _0202121C
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _02021330
_0202121C:
	ldr r0, _0202133C ; =0x0000FFFF
	cmp r6, #0
	strh r0, [r4, #0xc]
	bne _02021240
	mov r0, r8
	bl sub_0201B6A0
	movs r7, r0
	moveq r6, #0x13
	b _02021244
_02021240:
	mov r7, #0
_02021244:
	mov r0, r8
	bl sub_0201B830
	mov r1, r0
	add r0, r4, #0x10
	bl sub_02021798
	ldr r0, _02021338 ; =0x0380FFF4
	orr r2, r7, #0xc000
	ldr r1, [r0]
	add r0, r4, #0x42
	add r1, r1, #0x300
	ldrh r1, [r1, #0xc0]
	strh r1, [r4, #0x3c]
	strh r6, [r4, #0x3e]
	strh r2, [r4, #0x40]
	bl sub_020218C0
	add r0, r0, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x30
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	add r1, r4, #0x24
	cmp r5, #0
	add r7, r1, r0
	beq _02021314
	add r0, r5, #1
	bl sub_0201A540
	mov r8, r0
	mov r0, r5
	bl sub_0201A540
	mov r1, r0
	mov r0, r7
	bl sub_0201A514
	add r0, r7, #1
	and r1, r8, #0xff
	bl sub_0201A514
	add r7, r7, #2
	mov r6, #0
	add r5, r5, #2
	b _02021308
_020212EC:
	add r0, r5, r6
	bl sub_0201A540
	mov r1, r0
	mov r0, r7
	bl sub_0201A514
	add r7, r7, #1
	add r6, r6, #1
_02021308:
	cmp r6, r8
	blo _020212EC
	b _0202132C
_02021314:
	mov r0, r7
	mov r1, #0
	bl sub_0201A514
	add r0, r7, #1
	mov r1, #0
	bl sub_0201A514
_0202132C:
	add r0, r4, #0x10
_02021330:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02021338: .word 0x0380FFF4
_0202133C: .word 0x0000FFFF
	arm_func_end sub_020211E0

	arm_func_start sub_02021340
sub_02021340: ; 0x02021340
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020213C4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x5a
	add r0, r0, #0x188
	bl sub_0302805C
	movs r5, r0
	bne _02021374
	mov r0, #2
	bl sub_0201A85C
	mov r0, r5
	b _020213BC
_02021374:
	ldr r2, _020213C8 ; =0x0000FFFF
	mov r1, r4
	add r0, r5, #0x10
	strh r2, [r5, #0xc]
	bl sub_02021798
	add r0, r5, #0x3c
	bl sub_0202184C
	mov r4, r0
	add r0, r5, #0x3c
	add r0, r0, r4
	bl sub_020218C0
	add r0, r4, r0
	strh r0, [r5, #0x16]
	add r0, r0, #0x1c
	strh r0, [r5, #0x22]
	mov r0, #0x40
	strh r0, [r5, #0x24]
	add r0, r5, #0x10
_020213BC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020213C4: .word 0x0380FFF4
_020213C8: .word 0x0000FFFF
	arm_func_end sub_02021340

	arm_func_start sub_020213CC
sub_020213CC: ; 0x020213CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _020215E0 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r4, r0, #0x344
	bl sub_02020E64
	cmp r0, #0
	moveq r0, #0
	beq _020215D8
	ldr r1, _020215E0 ; =0x0380FFF4
	ldrh r0, [r4, #0xa0]
	ldr r2, [r1]
	add r1, r0, #0x78
	add r0, r2, #0x188
	bl sub_0302805C
	movs r6, r0
	bne _02021420
	mov r0, #2
	bl sub_0201A85C
	mov r0, r6
	b _020215D8
_02021420:
	ldr r0, _020215E4 ; =0x0000FFFF
	mov r1, r5
	strh r0, [r6, #0xc]
	add r0, r6, #0x10
	bl sub_02021798
	ldrh r1, [r4, #0x6e]
	add r0, r6, #0x48
	strh r1, [r6, #0x44]
	ldrh r1, [r4, #0x7c]
	strh r1, [r6, #0x46]
	bl sub_0202184C
	mov r4, r0
	add r0, r6, #0x48
	add r0, r0, r4
	bl sub_020218C0
	add r7, r4, r0
	add r0, r6, #0x48
	add r4, r0, r7
	mov r0, r4
	mov r1, #3
	bl sub_0201A514
	add r0, r4, #1
	mov r1, #1
	bl sub_0201A514
	ldr r1, _020215E0 ; =0x0380FFF4
	add r0, r4, #2
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0xbe]
	and r1, r1, #0xff
	bl sub_0201A514
	ldr r0, _020215E0 ; =0x0380FFF4
	add r7, r7, #3
	ldr r1, [r0]
	add r0, r6, #0x48
	add r5, r0, r7
	add r4, r1, #0x344
	add r8, r1, #0x31c
	mov r0, r5
	mov r1, #0xdd
	mov sl, #0
	bl sub_0201A514
	ldr r1, _020215E0 ; =0x0380FFF4
	add r0, r5, #1
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0xe4]
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_0201A514
	add r0, r5, #2
	mov r1, sl
	bl sub_0201A514
	add r0, r5, #3
	mov r1, #9
	bl sub_0201A514
	add r0, r5, #4
	mov r1, #0xbf
	bl sub_0201A514
	add r0, r5, #5
	mov r1, sl
	bl sub_0201A514
	ldrh r1, [r8, #0x20]
	add r0, r5, #6
	and r1, r1, #0xff
	bl sub_0201A514
	ldrh r1, [r8, #0x20]
	add r0, r5, #7
	mov r1, r1, asr #8
	and r1, r1, #0xff
	bl sub_0201A514
	ldr r1, _020215E8 ; =0x0380FFF0
	add r0, r5, #8
	ldrh r8, [r1]
	and r1, r8, #0xff
	bl sub_0201A514
	mov r1, r8, lsr #8
	add r0, r5, #9
	and r1, r1, #0xff
	bl sub_0201A514
	ldrh r0, [r4, #0xa0]
	add sl, sl, #0xa
	cmp r0, #0
	beq _020215B4
	ldrh r0, [r4, #0xa2]
	ldr r8, [r4, #0x9c]
	tst r0, #1
	addne r8, r8, #1
	mov sb, #0
	b _020215A8
_02021588:
	mov r0, r8
	bl sub_0201A540
	mov r1, r0
	add r0, r5, sl
	bl sub_0201A514
	add sl, sl, #1
	add r8, r8, #1
	add sb, sb, #1
_020215A8:
	ldrh r0, [r4, #0xa0]
	cmp sb, r0
	blo _02021588
_020215B4:
	add r0, r7, sl
	add r0, r0, #0xc
	strh r0, [r6, #0x16]
	ldrh r1, [r6, #0x16]
	mov r0, #0x50
	add r1, r1, #0x1c
	strh r1, [r6, #0x22]
	strh r0, [r6, #0x24]
	add r0, r6, #0x10
_020215D8:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_020215E0: .word 0x0380FFF4
_020215E4: .word 0x0000FFFF
_020215E8: .word 0x0380FFF0
	arm_func_end sub_020213CC

	arm_func_start sub_020215EC
sub_020215EC: ; 0x020215EC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _02021610
	bl sub_02020E64
	cmp r0, #0
	moveq r0, #0
	beq _0202169C
_02021610:
	ldr r0, _020216A4 ; =0x0380FFF4
	add r1, r5, #0x3d
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0302805C
	movs r4, r0
	bne _0202163C
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _0202169C
_0202163C:
	ldr r2, _020216A8 ; =0x0000FFFF
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xc]
	bl sub_02021798
	cmp r5, #0
	beq _0202167C
	add r0, r4, #0x42
	mov r1, #0x10
	bl sub_0201A514
	add r0, r4, #0x43
	and r1, r5, #0xff
	bl sub_0201A514
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
_0202167C:
	add r0, r5, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0xb0
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_0202169C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020216A4: .word 0x0380FFF4
_020216A8: .word 0x0000FFFF
	arm_func_end sub_020215EC

	arm_func_start sub_020216AC
sub_020216AC: ; 0x020216AC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _020216D0
	bl sub_02020E64
	cmp r0, #0
	moveq r0, #0
	beq _02021730
_020216D0:
	ldr r0, _02021738 ; =0x0380FFF4
	mov r1, #0x36
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0302805C
	movs r4, r0
	bne _020216FC
	mov r0, #2
	bl sub_0201A85C
	mov r0, r4
	b _02021730
_020216FC:
	ldr r0, _0202173C ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_02021798
	strh r5, [r4, #0x3c]
	mov r0, #2
	strh r0, [r4, #0x16]
	add r0, r0, #0x1c
	strh r0, [r4, #0x22]
	mov r0, #0xc0
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_02021730:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02021738: .word 0x0380FFF4
_0202173C: .word 0x0000FFFF
	arm_func_end sub_020216AC

	arm_func_start sub_02021740
sub_02021740: ; 0x02021740
	stmdb sp!, {r3, lr}
	ldr ip, _02021794 ; =0x0380FFF4
	mov r2, #0
	ldr r3, [ip]
	mov r1, #0x14
	ldr r3, [r3, #0x45c]
	orr r0, r0, #0xc000
	strh r2, [r3]
	strh r2, [r3, #2]
	strh r2, [r3, #4]
	strh r1, [r3, #0xa]
	mov r1, #0xa4
	strh r1, [r3, #0xc]
	strh r0, [r3, #0xe]
	ldr r2, [ip]
	add r0, r3, #0x10
	add r1, r2, #0x3a8
	add r2, r2, #0x324
	bl sub_020198EC
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02021794: .word 0x0380FFF4
	arm_func_end sub_02021740

	arm_func_start sub_02021798
sub_02021798: ; 0x02021798
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x2c
	bl sub_0302D764
	bl sub_02019D68
	strh r0, [r5, #0x10]
	ldr r0, _020217E0 ; =0x0380FFF4
	mov r1, r4
	ldr r3, [r0]
	add r0, r5, #0x18
	add r2, r3, #0x324
	add r3, r3, #0x3a8
	bl sub_02019920
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020217E0: .word 0x0380FFF4
	arm_func_end sub_02021798

	arm_func_start sub_020217E4
sub_020217E4: ; 0x020217E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02021848 ; =0x0380FFF4
	mov r7, r0
	ldr r0, [r2]
	mov r6, r1
	ldr r5, [r0, #0x1a0]
	mvn r4, #0
	b _02021834
_02021804:
	ldrh r0, [r5, #0x24]
	cmp r0, r6
	bne _02021828
	mov r1, r7
	add r0, r5, #0x28
	bl sub_02019C64
	cmp r0, #0
	movne r0, #1
	bne _02021840
_02021828:
	mov r0, r5
	bl sub_03028270
	mov r5, r0
_02021834:
	cmp r5, r4
	bne _02021804
	mov r0, #0
_02021840:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02021848: .word 0x0380FFF4
	arm_func_end sub_020217E4

	arm_func_start sub_0202184C
sub_0202184C: ; 0x0202184C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _020218BC ; =0x0380FFF4
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	add r4, r1, #0x344
	ldrh r6, [r4, #0x1e]
	mov r1, r5
	bl sub_0201A514
	add r0, r8, #1
	and r1, r6, #0xff
	bl sub_0201A514
	add r5, r5, #2
	mov r7, #0
	add r4, r4, #0x20
	b _020218A8
_0202188C:
	add r0, r4, r7
	bl sub_0201A540
	mov r1, r0
	add r0, r8, r5
	bl sub_0201A514
	add r5, r5, #1
	add r7, r7, #1
_020218A8:
	cmp r7, r6
	blo _0202188C
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020218BC: .word 0x0380FFF4
	arm_func_end sub_0202184C

	arm_func_start sub_020218C0
sub_020218C0: ; 0x020218C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _0202195C ; =0x0380FFF4
	mov r1, #1
	ldr r2, [r2]
	mov sb, r0
	add r6, r2, #0x344
	mov r7, #0
	bl sub_0201A514
	ldr r4, _02021960 ; =0x027F74C4
	add r7, r7, #2
	mov r8, #0
	mov r5, #1
_020218F0:
	ldrh r0, [r6, #0x62]
	tst r0, r5, lsl r8
	beq _02021934
	ldrh r0, [r6, #0x60]
	tst r0, r5, lsl r8
	mov r0, r8, lsl #1
	ldrh r1, [r4, r0]
	beq _02021924
	orr r1, r1, #0x80
	add r0, sb, r7
	and r1, r1, #0xff
	bl sub_0201A514
	b _02021930
_02021924:
	add r0, sb, r7
	and r1, r1, #0xff
	bl sub_0201A514
_02021930:
	add r7, r7, #1
_02021934:
	add r8, r8, #1
	cmp r8, #0x10
	blo _020218F0
	sub r1, r7, #2
	add r0, sb, #1
	and r1, r1, #0xff
	bl sub_0201A514
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0202195C: .word 0x0380FFF4
_02021960: .word 0x027F74C4
	arm_func_end sub_020218C0

	arm_func_start sub_02021964
sub_02021964: ; 0x02021964
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02021C30 ; =0x0380FFF4
	mvn r0, #0
	ldr r4, [r1]
	add r7, r4, #0x17c
	ldr r5, [r7, #0x48]
	add r6, r4, #0x344
	cmp r5, r0
	beq _02021C28
	ldrh r0, [r6, #8]
	cmp r0, #0x40
	beq _020219A4
	mov r1, r5
	add r0, r7, #0x48
	bl sub_030280F8
	b _02021C28
_020219A4:
	ldrh r0, [r5, #0x24]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _020219BC
	ldrh r0, [r5, #0x34]
	b _020219C0
_020219BC:
	ldrh r0, [r5, #0x28]
_020219C0:
	tst r0, #1
	ldrne r0, [r4, #0x568]
	mov sb, #1
	addne r0, r0, #1
	strne r0, [r4, #0x568]
	ldreq r0, [r4, #0x564]
	addeq r0, r0, #1
	streq r0, [r4, #0x564]
	ldrh r0, [r5, #0x18]
	ldr r2, [r4, #0x560]
	and r1, r0, #0xf0
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, asr #4
	sub r0, r0, #1
	add r0, r2, r0
	str r0, [r4, #0x560]
	ldrh r2, [r6, #0xc]
	cmp r2, #1
	beq _02021A20
	cmp r2, #2
	cmpne r2, #3
	beq _02021AFC
	b _02021B9C
_02021A20:
	ldrh r0, [r5, #0x24]
	tst r0, #1
	bne _02021B9C
	add r0, r5, #0x2e
	bl sub_0201B0F0
	mov r8, r0
	cmp r8, #0xff
	beq _02021A4C
	bl sub_0201B7D0
	cmp r0, #0x40
	beq _02021AB0
_02021A4C:
	mov r0, r8
	bl sub_0201B7D0
	cmp r0, #0x30
	add r0, r5, #0x2e
	bne _02021A80
	mov r1, #0xa0
	bl sub_020217E4
	cmp r0, #0
	bne _02021B9C
	add r0, r5, #0x2e
	mov r1, #7
	bl sub_02020E94
	b _02021AA0
_02021A80:
	mov r1, #0xc0
	bl sub_020217E4
	cmp r0, #0
	bne _02021B9C
	add r0, r5, #0x2e
	mov r1, #7
	mov r2, #1
	bl sub_020216AC
_02021AA0:
	cmp r0, #0
	beq _02021B9C
	bl sub_0202086C
	b _02021B9C
_02021AB0:
	ldrh r1, [r5, #0x24]
	mov r0, r8, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_0201B53C
	mov r0, r8
	bl sub_0201B870
	ldrh r1, [r5, #0x3a]
	cmp r1, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _02021B9C
	add r0, r5, #0x28
	add r1, r5, #0x34
	bl sub_020198D0
	mov sb, #0
	b _02021B9C
_02021AFC:
	ldrh r1, [r5, #0x24]
	tst r1, #1
	bne _02021B9C
	ldrh r0, [r6, #0xe]
	cmp r0, #0
	beq _02021B68
	tst r1, #0x2000
	bne _02021B68
	ldrh r0, [r5, #0x28]
	tst r0, #1
	ldrneh r0, [r6, #0x8e]
	bicne r0, r0, #1
	strneh r0, [r6, #0x8e]
	bne _02021B44
	cmp r2, #3
	ldrneh r0, [r6, #0x8e]
	bicne r0, r0, #2
	strneh r0, [r6, #0x8e]
_02021B44:
	ldrh r0, [r6, #0x8e]
	cmp r0, #0
	ldreqh r0, [r7, #0x20]
	cmpeq r0, #0
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, #0
	bne _02021B68
	mov r0, #1
	bl sub_020194A4
_02021B68:
	ldrh r8, [r6, #0x88]
	mov r0, r8
	bl sub_0201B870
	ldrh r1, [r5, #0x3a]
	cmp r1, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _02021B9C
	add r0, r5, #0x2e
	add r1, r5, #0x34
	bl sub_020198D0
	mov sb, #0
_02021B9C:
	cmp sb, #0
	bne _02021C04
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [r5, #0x12]
	ldrh r1, [r5, #0x22]
	and r1, r1, #0xff
	bl sub_0201B51C
	ldrh r1, [r5, #0x3a]
	mov r0, r8
	bl sub_0201B63C
	mov r0, r8
	bl sub_0201B67C
	ldrh r1, [r5, #0x20]
	mov r0, #0x180
	sub r1, r1, #0x18
	strh r1, [r5, #0x16]
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #0x16]
	mov r1, r5
	add r0, r0, #0x2d
	mov r2, r0, lsr #1
	add r0, r7, #0x48
	strh r2, [r5, #0xe]
	bl sub_03028548
	b _02021C10
_02021C04:
	mov r1, r5
	add r0, r7, #0x48
	bl sub_030280F8
_02021C10:
	ldrh r0, [r7, #0x50]
	cmp r0, #0
	beq _02021C28
	mov r0, #2
	mov r1, #6
	bl sub_03027D88
_02021C28:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02021C30: .word 0x0380FFF4
	arm_func_end sub_02021964

	arm_func_start sub_02021C34
sub_02021C34: ; 0x02021C34
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02021DA0 ; =0x0380FFF4
	mov r6, r0
	ldr r0, [r1]
	add r4, r0, #0x344
	ldrh r1, [r4, #8]
	add r0, r0, #0xdc
	cmp r1, #0x40
	add r5, r0, #0x400
	movne r0, #1
	bne _02021D98
	add r0, r6, #0x1e
	add r1, r4, #0x64
	bl sub_02019C64
	cmp r0, #0
	beq _02021C88
	add r0, r6, #0x24
	add r1, r4, #0x82
	bl sub_02019C64
	cmp r0, #0
	bne _02021C90
_02021C88:
	mov r0, #1
	b _02021D98
_02021C90:
	ldrh r0, [r4, #0x6a]
	mov r1, #1
	mov r0, r1, lsl r0
	ldrh r1, [r6, #0x2e]
	mov r0, r0, lsl #0x10
	tst r1, r0, lsr #16
	moveq r0, #0
	movne r0, #0x2000
	strh r0, [r5, #6]
	ldr r0, _02021DA4 ; =0x04808098
	ldrh r0, [r0]
	tst r0, #0x8000
	beq _02021CE8
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x10
	add r0, r0, #0x4800000
	add r0, r0, #0x4000
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldrneh r0, [r5, #6]
	orrne r0, r0, #0x4000
	strneh r0, [r5, #6]
_02021CE8:
	ldrh r0, [r4, #0x88]
	bl sub_0201B67C
	ldrh r1, [r6, #0x10]
	ldr r0, _02021DA8 ; =0x00000182
	sub r1, r1, #0x1c
	strh r1, [r6, #6]
	sub r1, r6, #0x10
	strh r0, [r1, #0xc]
	ldrh r2, [r6, #6]
	mov r0, #0
	add r2, r2, #0x31
	mov r2, r2, lsr #1
	strh r2, [r1, #0xe]
	ldrh r2, [r1, #0x3e]
	b _02021D34
_02021D24:
	tst r2, #1
	mov r2, r2, lsl #0xf
	addne r0, r0, #1
	mov r2, r2, lsr #0x10
_02021D34:
	cmp r2, #0
	bne _02021D24
	ldr r2, _02021DAC ; =0x04808094
	ldrh r3, [r5, #6]
	ldrh r4, [r2]
	ldrh r2, [r2, #4]
	ldrh r5, [r1, #0x18]
	and r2, r2, #0x8000
	and r4, r4, #0x8000
	orr r2, r3, r2, asr #4
	orr r2, r2, r4, asr #3
	orr r2, r5, r2
	strh r2, [r1, #0x18]
	ldrh r2, [r1, #0x3c]
	ldrh r3, [r1, #0x1c]
	add r2, r2, #0xa
	mul r2, r0, r2
	add r0, r2, #0xfc
	add r2, r3, r0, lsr #4
	ldr r0, _02021DA0 ; =0x0380FFF4
	strh r2, [r1, #0x1a]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #0
_02021D98:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02021DA0: .word 0x0380FFF4
_02021DA4: .word 0x04808098
_02021DA8: .word 0x00000182
_02021DAC: .word 0x04808094
	arm_func_end sub_02021C34

	arm_func_start sub_02021DB0
sub_02021DB0: ; 0x02021DB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02021F58 ; =0x0380FFF4
	mov r7, r0
	ldr r1, [r1]
	add r0, r1, #0x2c
	add r5, r0, #0x400
	ldrh r0, [r5, #0x3c]
	ldr r4, [r5, #0x90]
	cmp r0, #0
	beq _02021F50
	add r0, r7, #0x18
	add r1, r1, #0x3a8
	bl sub_02019C64
	cmp r0, #0
	beq _02021F50
	ldrh r1, [r7, #0x10]
	ldrh r0, [r4, #0x16]
	sub r1, r1, #0x18
	sub r0, r0, #8
	cmp r1, r0
	bgt _02021F50
	add r0, r7, #0x1e
	bl sub_0201B0F0
	mov r6, r0
	cmp r6, #0xff
	beq _02021E2C
	cmp r6, #0
	beq _02021E68
	bl sub_0201B7D0
	cmp r0, #0x40
	beq _02021E68
_02021E2C:
	add r0, r7, #0x1e
	mov r1, #0xc0
	bl sub_020217E4
	cmp r0, #0
	bne _02021F50
	add r0, r7, #0x1e
	mov r1, #7
	mov r2, #0
	bl sub_020216AC
	cmp r0, #0
	beq _02021F50
	mov r1, #2
	strh r1, [r0]
	bl sub_0202086C
	b _02021F50
_02021E68:
	cmp r6, #0
	beq _02021F50
	ldrh r1, [r7, #0x14]
	mov r0, r6, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_0201B53C
	mov r0, r6
	bl sub_0201B67C
	mov r0, r6
	bl sub_0201B8BC
	mov r1, #1
	mov r0, r1, lsl r0
	mov r0, r0, lsl #0x10
	ldrh r1, [r5, #0x9a]
	mov r2, r0, lsr #0x10
	tst r2, r1
	bne _02021F50
	ldrh r0, [r5, #0x98]
	tst r2, r0
	beq _02021F50
	orr r0, r1, r2
	strh r0, [r5, #0x9a]
	ldrh r1, [r4, #0x10]
	mvn r0, r2
	and r1, r1, r0
	mov r0, r2, lsl #0xf
	strh r1, [r4, #0x10]
	add r6, r4, #0x1a
	mov r1, r0, lsr #0x10
	b _02021F00
_02021EE8:
	ldrh r0, [r5, #0x98]
	tst r1, r0
	ldrneh r0, [r4, #0x16]
	addne r6, r6, r0
	mov r0, r1, lsl #0xf
	mov r1, r0, lsr #0x10
_02021F00:
	cmp r1, #1
	bne _02021EE8
	ldrh r1, [r7, #0x10]
	add r0, r6, #3
	sub r1, r1, #0x18
	strh r1, [r6]
	ldrh r1, [r7, #0x12]
	and r1, r1, #0xff
	bl sub_0201A514
	ldrh r1, [r7, #0xe]
	add r0, r6, #2
	and r1, r1, #0xff
	bl sub_0201A514
	ldrh r2, [r6]
	cmp r2, #0
	beq _02021F50
	add r0, r7, #0x2c
	add r1, r6, #8
	add r2, r2, #1
	bl sub_0302D78C
_02021F50:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02021F58: .word 0x0380FFF4
	arm_func_end sub_02021DB0

	arm_func_start sub_02021F5C
sub_02021F5C: ; 0x02021F5C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02022024 ; =0x0380FFF4
	mov r4, r0
	ldr r1, [r1]
	add r0, r1, #0x300
	ldrh r0, [r0, #0x4c]
	add r5, r1, #0x344
	cmp r0, #0x40
	movne r0, #1
	bne _0202201C
	add r0, r4, #0x1e
	add r1, r5, #0x64
	bl sub_02019C64
	cmp r0, #0
	beq _02021FAC
	add r0, r4, #0x24
	add r1, r5, #0x82
	bl sub_02019C64
	cmp r0, #0
	bne _02021FB4
_02021FAC:
	mov r0, #1
	b _0202201C
_02021FB4:
	ldrh r1, [r4, #0x10]
	ldr r0, _02022028 ; =0x00000185
	sub r1, r1, #0x1c
	strh r1, [r4, #6]
	sub r1, r4, #0x10
	strh r0, [r1, #0xc]
	mov r0, #0x18
	strh r0, [r1, #0xe]
	ldr r4, _02022024 ; =0x0380FFF4
	ldr r2, _0202202C ; =0x04808094
	ldr r0, [r4]
	ldrh ip, [r2]
	add r0, r0, #0x400
	ldrh r2, [r2, #4]
	ldrh r3, [r0, #0xe2]
	and r0, r2, #0x8000
	ldrh lr, [r1, #0x18]
	and r2, ip, #0x8000
	orr r0, r3, r0, asr #4
	orr r0, r0, r2, asr #3
	orr r0, lr, r0
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	add r0, r0, #0x188
	bl sub_03028548
	mov r0, #0
_0202201C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02022024: .word 0x0380FFF4
_02022028: .word 0x00000185
_0202202C: .word 0x04808094
	arm_func_end sub_02021F5C

	arm_func_start sub_02022030
sub_02022030: ; 0x02022030
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r1, _02022658 ; =0x0380FFF4
	mov sl, r0
	ldr r3, [r1]
	add r0, sl, #0x1e
	ldr r2, [r3, #0x570]
	add r1, r3, #4
	add r2, r2, #1
	str r2, [r3, #0x570]
	add r4, r3, #0x344
	add r5, r1, #0x400
	add r6, r3, #0x31c
	add r7, r3, #0x17c
	bl sub_0201B198
	mov r8, r0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [sl, #2]
	cmp r8, #0xff
	beq _0202264C
	ldrh r1, [sl, #0x12]
	bl sub_0201B51C
	ldrh sb, [sl, #6]
	cmp sb, #0xc
	bls _0202264C
	add r1, sp, #0x18
	mov r0, #0
	mov r2, #0x2c
	bl sub_0302D7C0
	add r2, sl, #0x38
	sub r1, sb, #0xc
	mov r0, #2
	str r2, [sp, #0x18]
	strh r1, [sp, #0x20]
	strh r0, [sp, #0x22]
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	ldreqh r0, [sp, #0x22]
	orreq r0, r0, #1
	streqh r0, [sp, #0x22]
	mov r0, #0x38
	strh r0, [sp, #0x24]
	ldrh r1, [sl, #8]
	add r0, sp, #0x18
	strh r1, [sp, #0x1c]
	ldrh r1, [sl, #0x36]
	strh r1, [sp, #0x1e]
	bl sub_02023400
	ldr sb, [sp, #0x38]
	cmp sb, #0
	beq _0202212C
	ldrh r0, [sl, #0x16]
	tst r0, #0x8000
	beq _0202212C
	add r0, sb, #6
	bl sub_0201A540
	mov fp, r0
	add r0, sb, #7
	bl sub_0201A540
	ldr r1, _0202265C ; =0x0480810C
	add r0, fp, r0, lsl #8
	strh r0, [r1]
_0202212C:
	ldrh r1, [r5]
	cmp r1, #0x13
	ldreq r0, [r5, #0x18]
	ldreqh r0, [r0, #0x38]
	cmpeq r0, #1
	bne _02022164
	ldrh r0, [sp, #0x22]
	and r0, r0, #9
	cmp r0, #9
	bne _02022634
	add r1, sp, #0x18
	mov r0, sl
	bl sub_020229E0
	b _02022634
_02022164:
	ldrh r0, [sp, #0x22]
	tst r0, #8
	beq _02022634
	cmp r1, #0x21
	bne _020222EC
	bl sub_0201A3D0
	ldrh r0, [sp, #0x22]
	and r0, r0, #0x30
	cmp r0, #0x30
	movne r0, #0xc
	strneh r0, [r5, #4]
	movne r0, #0xa
	strneh r0, [r5, #6]
	bne _020222C8
	ldrh r0, [sl, #0x34]
	cmp r0, #0x3e8
	movhi r0, #0xc
	strhih r0, [r5, #4]
	movhi r0, #1
	strhih r0, [r5, #6]
	bhi _020222C8
	mov r1, #0
	strh r1, [r5, #4]
	ldrh r0, [sp, #0x24]
	tst r0, #2
	beq _020221E0
	ldrh r0, [sp, #0x22]
	tst r0, #2
	bne _020221E0
	ldrh r0, [sp, #0x2a]
	bl sub_020190F0
_020221E0:
	ldrh r1, [sp, #0x2e]
	mov r0, r8
	bl sub_0201B61C
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _02022270
	ldr sb, [sp, #0x40]
	cmp sb, #0
	beq _02022258
	add r0, sb, #6
	bl sub_0201A540
	mov fp, r0
	add r0, sb, #7
	bl sub_0201A540
	add r0, fp, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl sub_020189A0
	ldr r0, [sp, #0x40]
	add r0, r0, #8
	bl sub_0201A540
	ldr r1, [sp, #0x40]
	mov sb, r0
	add r0, r1, #9
	bl sub_0201A540
	add r1, sb, r0, lsl #8
	ldr r0, _02022660 ; =0x0380FFF0
	strh r1, [r0]
	b _02022270
_02022258:
	ldr r0, _02022664 ; =0x0000FFFF
	mov r1, #1
	bl sub_020189A0
	ldr r0, _02022660 ; =0x0380FFF0
	mov r1, #0
	strh r1, [r0]
_02022270:
	ldr r0, [sp, #0x3c]
	add r0, r0, #3
	bl sub_0201A540
	bl sub_02018F28
	ldr r0, [sp, #0x3c]
	add r0, r0, #2
	bl sub_0201A540
	strh r0, [r4, #0x76]
	ldrh r0, [sl, #0x34]
	bl sub_02018ED0
	mov r0, #1
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	ldreq r0, _02022668 ; =0x04808048
	moveq r1, #3
	streqh r1, [r0]
	ldr r1, _0202266C ; =0x04808038
	ldrh r0, [r1]
	orr r0, r0, #1
	strh r0, [r1]
_020222C8:
	ldr r0, [r5, #0x1c]
	add r1, sl, #0x1e
	add r0, r0, #8
	bl sub_020198D0
	mov r2, #0x25
	mov r0, #2
	mov r1, #1
	strh r2, [r5]
	bl sub_03027D88
_020222EC:
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	beq _02022304
	cmp r0, #3
	beq _020223BC
	b _0202261C
_02022304:
	ldr sb, [sp, #0x40]
	cmp sb, #0
	beq _020223BC
	add r0, sb, #6
	bl sub_0201A540
	mov r5, r0
	add r0, sb, #7
	bl sub_0201A540
	add r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_020189A0
	ldr r0, [sp, #0x40]
	add r0, r0, #8
	bl sub_0201A540
	ldr r1, [sp, #0x40]
	mov r5, r0
	add r0, r1, #9
	bl sub_0201A540
	ldr r1, _02022660 ; =0x0380FFF0
	add r0, r5, r0, lsl #8
	strh r0, [r1]
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	bl sub_0201A540
	sub r0, r0, #8
	strh r0, [r4, #0xa0]
	ldrh r2, [r4, #0xa0]
	cmp r2, #0
	beq _020223BC
	ldr r0, [sp, #0x40]
	ldr r1, [r4, #0x9c]
	tst r0, #1
	beq _020223A8
	add r0, r0, #9
	add r2, r2, #2
	bl sub_0302D78C
	mov r0, #1
	strh r0, [r4, #0xa2]
	b _020223BC
_020223A8:
	add r0, r0, #0xa
	add r2, r2, #1
	bl sub_0302D78C
	mov r0, #0
	strh r0, [r4, #0xa2]
_020223BC:
	mov r1, #0
	mov r0, r8
	strh r1, [r4, #0x80]
	bl sub_0201B67C
	add r1, sl, #0x2c
	add r0, sp, #0x10
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldrh r0, [r4, #0x6e]
	mov r5, #0
	mov r8, r0, lsl #0xa
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, r8
	mov r3, r5
	bl sub_03036370
	adds fp, r0, #1
	umull r3, r0, fp, r8
	adc sb, r1, #0
	mla r0, fp, r5, r0
	mla r0, sb, r8, r0
	add r2, sp, #0x10
	str r0, [sp, #0x14]
	ldr r1, _02022670 ; =0x048080F6
	ldrh r0, [r2, #6]
	str r3, [sp, #0x10]
	strh r0, [r1]
	ldrh r0, [r2, #4]
	strh r0, [r1, #-2]
	ldrh r0, [r2, #2]
	strh r0, [r1, #-4]
	ldrh r0, [r2]
	orr r0, r0, #1
	strh r0, [r1, #-6]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _02022524
	ldrh r0, [r4, #0x1a]
	cmp r0, #0
	beq _02022524
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r1, r1, r8
	sbc r0, r0, r5
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl sub_0302D4F0
	ldr r1, _02022674 ; =0x048080F8
	ldrh ip, [r1]
	ldrh fp, [r1, #2]
	ldrh sb, [r1, #4]
	ldrh r8, [r1, #6]
	ldrh r5, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh ip, [sp, #8]
	strh r5, [sp]
	strh fp, [sp, #0xa]
	strh sb, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh r3, [sp, #2]
	strh r2, [sp, #4]
	strh r1, [sp, #6]
	bl sub_0302D504
	ldrh r1, [sp, #8]
	ldrh r0, [sp]
	cmp r1, r0
	bhs _020224E8
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	subs r2, r2, r0
	ldr r0, [sp, #0x14]
	b _020224FC
_020224E8:
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	ldr r0, [sp, #0x14]
_020224FC:
	sbc r0, r1, r0
	mov r2, r2, lsr #0xa
	orr r2, r2, r0, lsl #22
	ldrh r1, [r6, #0x20]
	ldr r0, _02022678 ; =0x04808134
	cmp r2, r1
	sublo r1, r1, r2
	strloh r1, [r0]
	movhs r1, #0
	strhsh r1, [r0]
_02022524:
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	bne _0202261C
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	beq _0202261C
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _0202261C
	add r0, r1, #2
	bl sub_0201A540
	ldrh r1, [r4, #0x76]
	cmp r1, r0
	strneh r0, [r4, #0x76]
	mov r1, #0
	strh r1, [r4, #0x8e]
	cmp r0, #0
	bne _02022588
	ldr r0, [sp, #0x3c]
	add r0, r0, #4
	bl sub_0201A540
	tst r0, #1
	ldrneh r0, [r4, #0x8e]
	orrne r0, r0, #1
	strneh r0, [r4, #0x8e]
_02022588:
	ldr r0, [sp, #0x3c]
	add r0, r0, #4
	bl sub_0201A540
	ldr r1, [sp, #0x3c]
	and r8, r0, #0xfe
	add r0, r1, #1
	mov r5, r8, lsl #3
	bl sub_0201A540
	ldrh r1, [r4, #0x6a]
	add r0, r8, r0
	cmp r1, r8, lsl #3
	sub r0, r0, #3
	blo _020225F8
	cmp r1, r0, lsl #3
	bhi _020225F8
	ldr r0, [sp, #0x3c]
	sub r5, r1, r5
	add r0, r0, #5
	add r0, r0, r5, lsr #3
	bl sub_0201A540
	and r1, r5, #7
	mov r2, #1
	tst r0, r2, lsl r1
	beq _020225F8
	ldrh r0, [r4, #0x8e]
	orr r0, r0, #2
	strh r0, [r4, #0x8e]
	bl sub_020208F8
_020225F8:
	ldrh r0, [r7, #0x20]
	cmp r0, #0
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, #0
	ldreqh r0, [r4, #0x8e]
	cmpeq r0, #0
	bne _0202261C
	mov r0, #1
	bl sub_020194A4
_0202261C:
	ldrh r0, [r6, #0x1e]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	beq _02022634
	mov r0, sl
	bl sub_0201D784
_02022634:
	ldr r2, [sp, #0x34]
	cmp r2, #0
	beq _0202264C
	ldrh r0, [sp, #0x2a]
	mov r1, sl
	bl sub_0202436C
_0202264C:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02022658: .word 0x0380FFF4
_0202265C: .word 0x0480810C
_02022660: .word 0x0380FFF0
_02022664: .word 0x0000FFFF
_02022668: .word 0x04808048
_0202266C: .word 0x04808038
_02022670: .word 0x048080F6
_02022674: .word 0x048080F8
_02022678: .word 0x04808134
	arm_func_end sub_02022030

	arm_func_start sub_0202267C
sub_0202267C: ; 0x0202267C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02022758 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldrh r5, [r4, #2]
	add r1, r0, #0x344
	ldrh r0, [r1, #0xc]
	cmp r0, #1
	beq _020226B0
	cmp r0, #2
	cmpne r0, #3
	beq _02022718
	b _02022750
_020226B0:
	mov r0, r5
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _020226E8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0201B434
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_0201D634
	mov r0, r5
	bl sub_02020550
	b _02022750
_020226E8:
	cmp r0, #0x30
	add r0, r4, #0x1e
	mov r1, #7
	bne _02022700
	bl sub_02020E94
	b _02022708
_02022700:
	mov r2, #1
	bl sub_020216AC
_02022708:
	cmp r0, #0
	beq _02022750
	bl sub_0202086C
	b _02022750
_02022718:
	ldrh r0, [r1, #8]
	cmp r0, #0x40
	bne _02022750
	add r0, r4, #0x1e
	add r1, r1, #0x82
	bl sub_02019C64
	cmp r0, #0
	beq _02022750
	mov r0, #0x30
	bl sub_03028A28
	bl sub_0201982C
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_0201D634
_02022750:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02022758: .word 0x0380FFF4
	arm_func_end sub_0202267C

	arm_func_start sub_0202275C
sub_0202275C: ; 0x0202275C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	ldr r1, _02022924 ; =0x0380FFF4
	mov r7, r0
	ldr r0, [r1]
	ldrh r5, [r7, #6]
	add r4, r0, #0x31c
	cmp r5, #4
	bls _02022918
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _02022918
	add r0, r7, #0x1e
	mov r1, #0x10
	bl sub_020217E4
	cmp r0, #0
	bne _02022918
	ldrh r6, [r7, #2]
	cmp r6, #0
	beq _020227C0
	mov r0, r6
	bl sub_0201B7D0
	cmp r0, #0x30
	bhs _020227F4
_020227C0:
	add r0, r7, #0x1e
	mov r1, #0xc0
	bl sub_020217E4
	cmp r0, #0
	bne _02022918
	add r0, r7, #0x1e
	mov r1, #6
	mov r2, #1
	bl sub_020216AC
	cmp r0, #0
	beq _02022918
	bl sub_0202086C
	b _02022918
_020227F4:
	mov r0, r6
	bl sub_0201B7D0
	cmp r0, #0x40
	mov r0, r6
	bne _02022820
	mov r1, #0x30
	bl sub_0201B434
	add r0, r7, #0x1e
	mov r1, #1
	bl sub_0201D634
	b _0202282C
_02022820:
	bl sub_0201B8BC
	cmp r0, #0
	bne _02022918
_0202282C:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_0302D7C0
	add r2, r7, #0x30
	sub r1, r5, #4
	str r2, [sp]
	strh r1, [sp, #8]
	add r0, sp, #0
	bl sub_02023400
	ldrh r1, [r7, #0x2c]
	ldr r0, _02022928 ; =0x0000FFC2
	tst r1, r0
	bne _020228C4
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _020228C4
	ldrh r2, [r4, #0x18]
	cmp r2, #0
	moveq r0, r1, lsl #0x1b
	moveq r0, r0, lsr #0x1f
	cmpeq r0, #1
	beq _020228C4
	cmp r2, #0
	beq _020228A0
	ldrh r0, [r7, #0x2c]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _020228C4
_020228A0:
	ldrh r0, [r4, #0x1e]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	bne _020228CC
	ldrh r0, [r7, #0x2c]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _020228CC
_020228C4:
	mov r1, #0xa
	b _02022900
_020228CC:
	mov r0, r6
	bl sub_0201B5FC
	ldrh r0, [sp, #0xa]
	tst r0, #1
	moveq r1, #1
	beq _02022900
	tst r0, #4
	moveq r1, #0x12
	beq _02022900
	ldrh r1, [sp, #0x16]
	mov r0, r6
	bl sub_0201B61C
	mov r1, #0
_02022900:
	ldr r2, [sp, #0x1c]
	mov r0, r6
	bl sub_0202106C
	cmp r0, #0
	beq _02022918
	bl sub_0202086C
_02022918:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02022924: .word 0x0380FFF4
_02022928: .word 0x0000FFC2
	arm_func_end sub_0202275C

	arm_func_start sub_0202292C
sub_0202292C: ; 0x0202292C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov r4, r0
	add r0, r4, #0x1e
	mov r1, #0x50
	bl sub_020217E4
	cmp r0, #0
	bne _020229D0
	ldrh r0, [r4, #0x24]
	tst r0, #1
	bne _02022964
	ldrh r0, [r4, #8]
	tst r0, #0x8000
	beq _020229D0
_02022964:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_0302D7C0
	add r0, r4, #0x2c
	str r0, [sp]
	ldrh r1, [r4, #6]
	ldr r0, _020229DC ; =0x0380FFF4
	strh r1, [sp, #8]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	moveq r0, #0x800
	streqh r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_02023400
	ldrh r0, [sp, #0xa]
	and r0, r0, #1
	cmp r0, #1
	bne _020229D0
	add r0, r4, #0x1e
	bl sub_020213CC
	cmp r0, #0
	beq _020229D0
	bl sub_0202086C
_020229D0:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_020229DC: .word 0x0380FFF4
	arm_func_end sub_0202292C

	arm_func_start sub_020229E0
sub_020229E0: ; 0x020229E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r2, _02022DA8 ; =0x0380FFF4
	mov r7, r0
	ldr r2, [r2]
	mov sl, r1
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x13
	add r4, r0, #0x400
	bne _02022D9C
	ldr r0, [r4, #0x18]
	ldr r5, [r4, #0x1c]
	add r8, r0, #0x4e
	mov r6, #0
	b _02022A50
_02022A24:
	mov r0, r8
	add r1, r7, #0x24
	bl sub_02019C64
	cmp r0, #0
	ldrneh r1, [r5, #6]
	movne r0, #1
	orrne r0, r1, r0, lsl r6
	strneh r0, [r5, #6]
	bne _02022D9C
	add r8, r8, #6
	add r6, r6, #1
_02022A50:
	ldr r0, [r4, #0x18]
	ldrh r0, [r0, #0x4c]
	cmp r6, r0
	blo _02022A24
	add r6, r5, #0xa
	mov r8, #0
	b _02022A8C
_02022A6C:
	add r0, r7, #0x24
	add r1, r6, #4
	bl sub_02019C64
	cmp r0, #0
	bne _02022D9C
	ldrh r0, [r6]
	add r8, r8, #1
	add r6, r6, r0, lsl #1
_02022A8C:
	ldrh r0, [r5, #8]
	cmp r8, r0
	blo _02022A6C
	mov r1, r6
	mov r0, #0
	mov r2, #0x40
	bl sub_0302D764
	ldrh r8, [r7, #6]
	cmp r8, #0xc
	bls _02022D9C
	cmp sl, #0
	bne _02022B08
	add r1, sp, #4
	mov r0, #0
	mov r2, #0x2c
	bl sub_0302D7C0
	add r3, r7, #0x38
	sub r2, r8, #0xc
	mov r0, #0x38
	strh r0, [sp, #0x10]
	mov r1, #3
	str r3, [sp, #4]
	strh r2, [sp, #0xc]
	strh r1, [sp, #0xe]
	ldrh r1, [r7, #8]
	add r0, sp, #4
	strh r1, [sp, #8]
	ldrh r1, [r7, #0x36]
	strh r1, [sp, #0xa]
	bl sub_02023400
	add sl, sp, #4
_02022B08:
	ldr r0, [sl, #0x28]
	cmp r0, #0
	ldreqh r0, [sl, #0x1a]
	beq _02022B2C
	add r0, r0, #1
	bl sub_0201A540
	sub r0, r0, #8
	strh r0, [r6, #0x3c]
	ldrh r0, [r6, #0x3c]
_02022B2C:
	add r0, r0, #0x41
	mov r0, r0, lsr #1
	strh r0, [r6]
	ldrh r0, [sl, #0xa]
	and r0, r0, #1
	cmp r0, #1
	bne _02022D90
	ldr r0, _02022DA8 ; =0x0380FFF4
	ldrh r1, [r6]
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r0, [r0, #8]
	cmp r0, r1
	blo _02022D90
	ldrh r1, [r7, #0x36]
	add r0, r6, #4
	strh r1, [r6, #0x2c]
	add r1, r7, #0x24
	bl sub_020198D0
	ldrh r0, [r7, #0x34]
	strh r0, [r6, #0x32]
	ldrh r0, [r7, #0x12]
	and r0, r0, #0xff
	strh r0, [r6, #2]
	ldr r0, [sl, #0x28]
	cmp r0, #0
	beq _02022BD4
	mov r7, #0
	add r8, r6, #0x40
	b _02022BC4
_02022BA4:
	ldr r0, [sl, #0x28]
	add r0, r0, #0xa
	add r0, r0, r7
	bl sub_0201A540
	mov r1, r0
	add r0, r8, r7
	bl sub_0201A514
	add r7, r7, #1
_02022BC4:
	ldrh r0, [r6, #0x3c]
	cmp r7, r0
	blo _02022BA4
	b _02022C78
_02022BD4:
	ldrh r0, [sl, #0x18]
	strh r0, [r6, #0x3e]
	ldrh r0, [sl, #0x18]
	cmp r0, #0
	beq _02022C78
	add r7, r7, #0x38
	add fp, r6, #0x40
	mov r8, #0
	b _02022C6C
_02022BF8:
	mov r0, r7
	bl sub_0201A540
	mov sb, r0
	add r0, r7, #1
	bl sub_0201A540
	cmp sb, #6
	bls _02022C64
	ldr r1, [sl, #0x28]
	cmp r7, r1
	beq _02022C64
	add r0, r0, #2
	mov sb, #0
	str r0, [sp]
	b _02022C50
_02022C30:
	mov r0, r7
	bl sub_0201A540
	mov r1, r0
	mov r0, fp
	bl sub_0201A514
	add fp, fp, #1
	add r7, r7, #1
	add sb, sb, #1
_02022C50:
	ldr r0, [sp]
	cmp sb, r0
	blo _02022C30
	add r8, r8, #1
	b _02022C6C
_02022C64:
	add r0, r0, #2
	add r7, r7, r0
_02022C6C:
	ldrh r0, [sl, #0x18]
	cmp r8, r0
	blo _02022BF8
_02022C78:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _02022CCC
	add r0, r0, #1
	bl sub_0201A540
	strh r0, [r6, #0xa]
	mov r7, #0
	add r8, r6, #0xc
	b _02022CBC
_02022C9C:
	ldr r0, [sl, #0x1c]
	add r0, r0, #2
	add r0, r0, r7
	bl sub_0201A540
	mov r1, r0
	add r0, r8, r7
	bl sub_0201A514
	add r7, r7, #1
_02022CBC:
	ldrh r0, [r6, #0xa]
	cmp r7, r0
	blo _02022C9C
	b _02022CF4
_02022CCC:
	mov sb, #0
	strh sb, [r6, #0xa]
	add r8, r6, #0xc
	mov r7, sb
_02022CDC:
	mov r1, r7
	add r0, r8, sb
	bl sub_0201A514
	add sb, sb, #1
	cmp sb, #0x20
	blo _02022CDC
_02022CF4:
	ldrh r0, [sl, #0x14]
	strh r0, [r6, #0x2e]
	ldrh r0, [sl, #0x16]
	strh r0, [r6, #0x30]
	ldrh r0, [sl, #0x12]
	strh r0, [r6, #0x36]
	ldr r0, [sl, #0x20]
	cmp r0, #0
	beq _02022D24
	add r0, r0, #3
	bl sub_0201A540
	strh r0, [r6, #0x38]
_02022D24:
	ldr r0, [sl, #0x24]
	cmp r0, #0
	beq _02022D3C
	add r0, r0, #3
	bl sub_0201A540
	strh r0, [r6, #0x34]
_02022D3C:
	ldrh r1, [r5, #2]
	ldrh r0, [r6]
	add r0, r1, r0
	strh r0, [r5, #2]
	ldrh r0, [r5, #8]
	add r0, r0, #1
	strh r0, [r5, #8]
	ldrh r1, [r4, #4]
	ldrh r0, [r6]
	sub r0, r1, r0
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #0x20
	bhs _02022D9C
	bl sub_0201A3D0
	mov r2, #0x15
	mov r0, #2
	mov r1, #0
	strh r2, [r4]
	bl sub_03027D88
	b _02022D9C
_02022D90:
	ldr r1, _02022DAC ; =0x027F74B4
	add r0, r6, #4
	bl sub_020198D0
_02022D9C:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02022DA8: .word 0x0380FFF4
_02022DAC: .word 0x027F74B4
	arm_func_end sub_020229E0

	arm_func_start sub_02022DB0
sub_02022DB0: ; 0x02022DB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _0202333C ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r1]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x90]
	add r0, r2, #4
	tst r1, #8
	add r4, r2, #0x344
	add sb, r0, #0x400
	beq _02022E50
	ldr r1, _02023340 ; =0x048080B0
	add r0, r2, #0x2c
	ldrh r2, [r1]
	add r1, r0, #0x400
	tst r2, #1
	ldrneh r0, [r1]
	cmpne r0, #0
	bne _02022E50
	tst r2, #4
	ldrneh r0, [r1, #0x14]
	cmpne r0, #0
	bne _02022E50
	tst r2, #8
	ldrneh r0, [r1, #0x28]
	cmpne r0, #0
	bne _02022E50
	ldr r0, _02023344 ; =0x0480819C
	ldrh r0, [r0]
	tst r0, #1
	bne _02022E50
	ldr r2, _02023348 ; =0x04808032
	mov r3, #0
	strh r3, [r2]
	mov r1, #0x8000
	ldr r0, _0202333C ; =0x0380FFF4
	strh r1, [r2]
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r3, [r0, #0xde]
_02022E50:
	add r0, sl, #0x1e
	mov r1, #0xb0
	bl sub_020217E4
	cmp r0, #0
	bne _02023334
	ldrh r0, [sl, #0x2e]
	ldrh r8, [sl, #2]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	cmp r8, #0
	mov r5, #0
	mov r6, r0, lsr #0x10
	moveq r7, #0x13
	moveq r5, #1
	beq _020232F8
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _02022F00
	mov r0, r8
	bl sub_0201B7D0
	cmp r0, #0x20
	bls _02022EC4
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0201B434
	add r0, sl, #0x1e
	mov r1, #1
	bl sub_0201D3D4
_02022EC4:
	ldrh r0, [sl, #8]
	tst r0, #0x400
	beq _02022F00
	mov r0, r8
	bl sub_0201B850
	cmp r0, #0
	beq _02022F00
	mov r5, #1
	mov r0, r8
	mov r1, #0
	strh r5, [sl, #0x2c]
	mov r7, #0xf
	mov r6, #4
	bl sub_0201B65C
	b _020232F8
_02022F00:
	ldrh r0, [sl, #0x2c]
	cmp r0, #0
	beq _02022F18
	cmp r0, #1
	beq _02022FF4
	b _020232E8
_02022F18:
	ldrh r1, [r4, #0xc]
	cmp r1, #1
	ldreq r0, _0202333C ; =0x0380FFF4
	ldreq r0, [r0]
	addeq r0, r0, #0x300
	ldreqh r0, [r0, #0x32]
	cmpeq r0, #1
	moveq r7, #0xd
	moveq r5, #1
	beq _020232F8
	cmp r1, #1
	bne _02022F64
	ldrh r0, [sl, #0x2e]
	mov r5, #1
	cmp r0, #1
	moveq r7, #0
	movne r7, #0xe
	movne r6, #2
	b _020232F8
_02022F64:
	beq _020232F8
	ldrh r0, [sl, #0x2e]
	cmp r0, #2
	ldreq r1, [sb, #0x18]
	ldreqh r0, [r1, #0x16]
	cmpeq r0, #0
	bne _020232F8
	add r0, r1, #0x10
	add r1, sl, #0x1e
	bl sub_02019C64
	cmp r0, #0
	beq _020232F8
	ldrh r0, [sb]
	cmp r0, #0x31
	bne _020232F8
	bl sub_0201A3D0
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	ldrne r0, [sb, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [sl, #0x30]
	bne _02022FD4
	mov r0, #0x30
	bl sub_03028A28
	ldr r0, [sb, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_02022FD4:
	ldr r0, [sb, #0x1c]
	mov r2, #0x35
	strh r1, [r0, #6]
	mov r0, #2
	mov r1, r0
	strh r2, [sb]
	bl sub_03027D88
	b _020232F8
_02022FF4:
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _02023194
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0201B434
	ldrh r0, [sl, #0x2e]
	cmp r0, #1
	bne _020230B0
	add r0, sl, #0x1e
	mov r1, #0x80
	mov r2, #1
	bl sub_020215EC
	movs r4, r0
	beq _020232F8
	ldrh r1, [sl, #0x2c]
	ldr r0, _0202334C ; =0x04808044
	strh r1, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	mov r1, #0
	strh r1, [r4, #0x30]
	ldrh r1, [r0]
	ldrh r0, [r0]
	add r0, r1, r0, lsl #8
	mov r0, r0, lsl #0x10
	movs sb, r0, lsr #0x10
	moveq sb, #1
	mov r0, sb
	bl sub_0201A590
	mov r0, r8
	mov r1, sb
	bl sub_0201B65C
	add r0, r4, #0x33
	add sb, r4, #0x34
	bl sub_0201A540
	mov fp, r0
	mov r8, #0
	b _0202309C
_02023090:
	bl sub_0201A5A8
	strh r0, [sb], #2
	add r8, r8, #2
_0202309C:
	cmp r8, fp
	blo _02023090
	mov r0, r4
	bl sub_0202086C
	b _020232F8
_020230B0:
	cmp r0, #3
	mov r0, r8
	bne _0202317C
	bl sub_0201B7D0
	cmp r0, #0x20
	bne _020230D8
	mov r0, r8
	bl sub_0201B850
	cmp r0, #0
	bne _020230E4
_020230D8:
	mov r7, #1
	mov r5, r7
	b _020232F8
_020230E4:
	ldrh r0, [sl, #2]
	bl sub_0201B850
	bl sub_0201A590
	add r0, sl, #0x33
	add r7, sl, #0x34
	bl sub_0201A540
	mov r4, r0
	mov r5, #0
	b _02023120
_02023108:
	bl sub_0201A5A8
	ldrh r1, [r7], #2
	cmp r1, r0
	movne r0, #0
	bne _02023150
	add r5, r5, #1
_02023120:
	cmp r5, r4, lsr #1
	blo _02023108
	tst r4, #1
	beq _0202314C
	bl sub_0201A5A8
	ldrh r1, [r7]
	and r0, r0, #0xff
	and r1, r1, #0xff
	cmp r1, r0
	movne r0, #0
	bne _02023150
_0202314C:
	mov r0, #1
_02023150:
	cmp r0, #0
	mov r0, r8
	mov r1, #0
	mov r5, #1
	bne _02023170
	mov r7, #0xf
	bl sub_0201B65C
	b _020232F8
_02023170:
	bl sub_0201B65C
	mov r7, #0
	b _020232F8
_0202317C:
	mov r1, #0
	bl sub_0201B65C
	mov r7, #0xe
	mov r6, #2
	mov r5, #1
	b _020232F8
_02023194:
	ldr r1, [sb, #0x18]
	ldrh r0, [r1, #0x16]
	cmp r0, #1
	bne _020232F8
	add r0, r1, #0x10
	add r1, sl, #0x1e
	bl sub_02019C64
	cmp r0, #0
	beq _020232F8
	ldrh r0, [sl, #0x2e]
	cmp r0, #2
	bne _02023284
	ldrh r0, [sb]
	cmp r0, #0x31
	bne _020232F8
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	beq _02023218
	bl sub_0201A3D0
	mov r0, #0x35
	strh r0, [sb]
	ldr r0, [sb, #0x1c]
	mov r1, #0xc
	strh r1, [r0, #4]
	mov r0, #2
	ldrh r3, [sl, #0x30]
	ldr r2, [sb, #0x1c]
	mov r1, r0
	strh r3, [r2, #6]
	bl sub_03027D88
	mov r0, #0x20
	bl sub_03028A28
	b _020232F8
_02023218:
	mov r1, #0x33
	add r0, sl, #0x33
	strh r1, [sb]
	bl sub_0201A540
	mov r1, r0
	add r0, sl, #0x1e
	mov r2, #1
	bl sub_020215EC
	movs r4, r0
	beq _020232F8
	ldrh r1, [r4, #0x14]
	add r0, sl, #0x2c
	orr r1, r1, #0x4000
	strh r1, [r4, #0x14]
	ldrh r2, [sl, #6]
	add r1, r4, #0x2c
	add r2, r2, #1
	bl sub_0302D78C
	ldrh r1, [sl, #0x2c]
	mov r0, #3
	strh r1, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #0x30]
	bl sub_0202086C
	b _020232F8
_02023284:
	cmp r0, #4
	ldreqh r0, [sb]
	cmpeq r0, #0x33
	bne _020232F8
	bl sub_0201A3D0
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	ldrne r0, [sb, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [sl, #0x30]
	bne _020232C8
	mov r0, #0x30
	bl sub_03028A28
	ldr r0, [sb, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_020232C8:
	ldr r0, [sb, #0x1c]
	mov r2, #0x35
	strh r1, [r0, #6]
	mov r0, #2
	mov r1, r0
	strh r2, [sb]
	bl sub_03027D88
	b _020232F8
_020232E8:
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	moveq r7, #0xd
	moveq r5, #1
_020232F8:
	cmp r5, #0
	beq _02023334
	cmp r7, #0
	movne r2, #1
	moveq r2, #0
	add r0, sl, #0x1e
	mov r1, #0
	bl sub_020215EC
	cmp r0, #0
	beq _02023334
	ldrh r1, [sl, #0x2c]
	strh r1, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	strh r7, [r0, #0x30]
	bl sub_0202086C
_02023334:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0202333C: .word 0x0380FFF4
_02023340: .word 0x048080B0
_02023344: .word 0x0480819C
_02023348: .word 0x04808032
_0202334C: .word 0x04808044
	arm_func_end sub_02022DB0

	arm_func_start sub_02023350
sub_02023350: ; 0x02023350
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020233FC ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldrh r5, [r4, #2]
	add r1, r0, #0x344
	ldrh r0, [r1, #0xc]
	cmp r0, #1
	beq _02023384
	cmp r0, #2
	cmpne r0, #3
	beq _020233BC
	b _020233F4
_02023384:
	mov r0, r5
	bl sub_0201B7D0
	cmp r0, #0x20
	bls _020233F4
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0201B434
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_0201D3D4
	mov r0, r5
	bl sub_02020550
	b _020233F4
_020233BC:
	ldrh r0, [r1, #8]
	cmp r0, #0x20
	bls _020233F4
	add r0, r4, #0x1e
	add r1, r1, #0x82
	bl sub_02019C64
	cmp r0, #0
	beq _020233F4
	mov r0, #0x20
	bl sub_03028A28
	bl sub_0201982C
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_0201D3D4
_020233F4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020233FC: .word 0x0380FFF4
	arm_func_end sub_02023350

	arm_func_start sub_02023400
sub_02023400: ; 0x02023400
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02023720 ; =0x0380FFF4
	mov sb, r0
	ldr r0, [r1]
	ldr r5, [sb]
	add r4, r0, #0x344
	ldrh r0, [r4, #0x7a]
	ldr sl, _02023720 ; =0x0380FFF4
	strh r0, [sb, #0x12]
	ldrh r0, [sb, #0xc]
	tst r0, #0x800
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	ldrh r6, [sb, #8]
	b _02023694
_02023440:
	mov r0, r5
	bl sub_0201A540
	mov r8, r0
	add r0, r5, #1
	add r5, r5, #2
	bl sub_0201A540
	mov r7, r0
	cmp r8, #6
	addls pc, pc, r8, lsl #2
	b _02023484
_02023468: ; jump table
	b _02023490 ; case 0
	b _020234FC ; case 1
	b _02023688 ; case 2
	b _02023560 ; case 3
	b _020235CC ; case 4
	b _020235AC ; case 5
	b _02023688 ; case 6
_02023484:
	cmp r8, #0xdd
	beq _020235EC
	b _0202366C
_02023490:
	cmp r7, #0x20
	bhi _02023688
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #1
	strh r1, [sb, #0xc]
	str r0, [sb, #0x1c]
	cmp r7, #0
	bne _020234CC
	ldrh r0, [sb, #0xc]
	tst r0, #0x800
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	bne _02023688
_020234CC:
	ldrh r1, [sb, #0xa]
	mov r0, r7, lsl #0x10
	bic r2, r1, #1
	strh r2, [sb, #0xa]
	mov r1, r5
	mov r0, r0, lsr #0x10
	bl sub_02019B94
	cmp r0, #0
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	b _02023688
_020234FC:
	cmp r7, #1
	blo _02023688
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #4
	strh r1, [sb, #0xc]
	add r1, sb, #0x14
	bl sub_02019CB4
	ldrh r0, [r4, #0x60]
	ldrh r1, [r4, #0x62]
	ldrh r2, [sb, #0x14]
	orr r1, r0, r1
	mvn r1, r1
	tst r2, r1
	ldreqh r1, [sb, #0x16]
	orreq r1, r2, r1
	andeq r1, r0, r1
	cmpeq r0, r1
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #4
	streqh r0, [sb, #0xa]
	ldrneh r0, [sb, #0xa]
	bicne r0, r0, #4
	strneh r0, [sb, #0xa]
	b _02023688
_02023560:
	cmp r7, #1
	blo _02023688
	ldrh r1, [sb, #0xc]
	mov r0, r5
	orr r1, r1, #2
	strh r1, [sb, #0xc]
	bl sub_0201A540
	strh r0, [sb, #0x12]
	ldr r0, [sl]
	ldrh r1, [sb, #0x12]
	ldr r0, [r0, #0x41c]
	ldrh r0, [r0, #0x4a]
	cmp r1, r0
	ldrh r0, [sb, #0xa]
	orreq r0, r0, #2
	streqh r0, [sb, #0xa]
	bicne r0, r0, #2
	strneh r0, [sb, #0xa]
	b _02023688
_020235AC:
	cmp r7, #3
	blo _02023688
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x100
	strh r1, [sb, #0xc]
	str r0, [sb, #0x24]
	b _02023688
_020235CC:
	cmp r7, #6
	blo _02023688
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x200
	strh r1, [sb, #0xc]
	str r0, [sb, #0x20]
	b _02023688
_020235EC:
	cmp r7, #8
	blo _02023634
	mov r0, r5
	bl sub_0201A540
	cmp r0, #0
	bne _02023634
	add r0, r5, #1
	bl sub_0201A540
	cmp r0, #9
	bne _02023634
	add r0, r5, #2
	bl sub_0201A540
	cmp r0, #0xbf
	bne _02023634
	add r0, r5, #3
	bl sub_0201A540
	cmp r0, #0
	beq _02023654
_02023634:
	ldrh r1, [sb, #0x18]
	add r0, r7, #2
	add r1, r1, #1
	strh r1, [sb, #0x18]
	ldrh r1, [sb, #0x1a]
	add r0, r1, r0
	strh r0, [sb, #0x1a]
	b _02023688
_02023654:
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x400
	strh r1, [sb, #0xc]
	str r0, [sb, #0x28]
	b _02023688
_0202366C:
	ldrh r1, [sb, #0x18]
	add r0, r7, #2
	add r1, r1, #1
	strh r1, [sb, #0x18]
	ldrh r1, [sb, #0x1a]
	add r0, r1, r0
	strh r0, [sb, #0x1a]
_02023688:
	add r0, r7, #2
	add r5, r5, r7
	sub r6, r6, r0
_02023694:
	cmp r6, #0
	bgt _02023440
	ldrh r0, [sb, #0xc]
	tst r0, #8
	beq _020236CC
	ldrh r0, [r4, #0x64]
	tst r0, #1
	bne _020236C0
	ldrh r0, [sb, #4]
	tst r0, #0x8000
	beq _020236CC
_020236C0:
	ldrh r0, [sb, #0xa]
	orr r0, r0, #8
	strh r0, [sb, #0xa]
_020236CC:
	ldrh r0, [sb, #0xc]
	tst r0, #0x30
	beq _02023718
	ldrh r1, [sb, #6]
	ldrh r0, [r4, #0x7c]
	and r1, r1, #3
	and r0, r0, #3
	cmp r1, r0
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #0x10
	streqh r0, [sb, #0xa]
	ldrh r1, [sb, #6]
	ldrh r0, [r4, #0x7c]
	and r1, r1, #0x10
	and r0, r0, #0x10
	cmp r1, r0
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #0x20
	streqh r0, [sb, #0xa]
_02023718:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_02023720: .word 0x0380FFF4
	arm_func_end sub_02023400

	arm_func_start sub_02023724
sub_02023724: ; 0x02023724
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r0, _02023DCC ; =0x0380FFF4
	mvn r1, #0
	ldr r4, [r0]
	add sl, r4, #0x17c
	ldr r6, [sl, #0x60]
	add r0, r4, #0x300
	ldrh r5, [r0, #0x50]
	cmp r6, r1
	beq _02023DC0
	ldrh r0, [r6, #0x28]
	tst r0, #1
	ldrne r0, [r4, #0x568]
	addne r0, r0, #1
	strne r0, [r4, #0x568]
	ldreq r0, [r4, #0x564]
	addeq r0, r0, #1
	streq r0, [r4, #0x564]
	ldrh r0, [r6, #0x18]
	ldr r2, [r4, #0x560]
	and r1, r0, #0xf0
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, asr #4
	sub r0, r0, #1
	add r0, r2, r0
	str r0, [r4, #0x560]
	ldrh r1, [r6, #0x24]
	add r0, r6, #0x2e
	mov r2, r1, lsl #0x1c
	mov r1, r1, lsl #0x18
	mov r8, r2, lsr #0x1e
	mov sb, r1, lsr #0x1c
	bl sub_0201B198
	mov r7, r0
	strh r7, [r6, #0x12]
	cmp r7, #0xff
	bne _02023814
	mov r0, #0
	strh r0, [r6, #0x12]
	cmp r5, #1
	bne _02023D9C
	cmp r8, #0
	bne _02023D9C
	cmp sb, #0
	beq _02023808
	cmp sb, #4
	beq _020237FC
	cmp sb, #0xb
	bne _02023D9C
	add r0, r6, #0x10
	bl sub_02022DB0
	b _02023D9C
_020237FC:
	add r0, r6, #0x10
	bl sub_0202292C
	b _02023D9C
_02023808:
	add r0, r6, #0x10
	bl sub_0202275C
	b _02023D9C
_02023814:
	bl sub_0201B67C
	ldrh r1, [r6, #0x22]
	mov r0, r7, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl sub_0201B51C
	cmp r8, #0
	bne _02023860
	ldrh fp, [r6, #0x3a]
	mov r0, r7
	bl sub_0201B870
	cmp fp, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _02023D9C
	mov r0, r7
	mov r1, fp
	bl sub_0201B63C
_02023860:
	cmp r5, #1
	beq _02023878
	cmp r5, #2
	cmpne r5, #3
	beq _02023B18
	b _02023D9C
_02023878:
	ldrh r1, [r6, #0x24]
	mov r0, r7, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_0201B53C
	cmp r8, #0
	bne _02023AB4
	cmp sb, #0xc
	addls pc, pc, sb, lsl #2
	b _02023D9C
_020238A4: ; jump table
	b _020238E4 ; case 0
	b _02023D9C ; case 1
	b _020238F0 ; case 2
	b _02023D9C ; case 3
	b _02023A74 ; case 4
	b _02023A80 ; case 5
	b _02023D9C ; case 6
	b _02023D9C ; case 7
	b _020238D8 ; case 8
	b _02023D9C ; case 9
	b _02023A90 ; case 10
	b _02023A9C ; case 11
	b _02023AA8 ; case 12
_020238D8:
	add r0, r6, #0x10
	bl sub_02022030
	b _02023D9C
_020238E4:
	add r0, r6, #0x10
	bl sub_0202275C
	b _02023D9C
_020238F0:
	ldr r0, _02023DCC ; =0x0380FFF4
	ldrh r4, [r6, #0x16]
	ldr r5, [r0]
	cmp r4, #0xa
	bls _02023D9C
	add r0, r5, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _02023D9C
	add r0, r6, #0x2e
	mov r1, #0x30
	bl sub_020217E4
	cmp r0, #0
	bne _02023D9C
	ldrh r7, [r6, #0x12]
	mov r0, r7
	bl sub_0201B7D0
	cmp r0, #0x30
	bhs _02023970
	add r0, r6, #0x2e
	mov r1, #0xc0
	bl sub_020217E4
	cmp r0, #0
	bne _02023D9C
	add r0, r6, #0x2e
	mov r1, #6
	mov r2, #1
	bl sub_020216AC
	cmp r0, #0
	beq _02023D9C
	bl sub_0202086C
	b _02023D9C
_02023970:
	mov r0, r7
	bl sub_0201B7D0
	cmp r0, #0x40
	mov r0, r7
	bne _0202399C
	mov r1, #0x30
	bl sub_0201B434
	add r0, r6, #0x2e
	mov r1, #1
	bl sub_0201D634
	b _020239A8
_0202399C:
	bl sub_0201B8BC
	cmp r0, #0
	bne _02023D9C
_020239A8:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_0302D7C0
	add r3, r6, #0x46
	sub r2, r4, #0xa
	mov r1, #0x800
	str r3, [sp]
	strh r2, [sp, #8]
	strh r1, [sp, #0xc]
	add r0, sp, #0
	bl sub_02023400
	ldrh r1, [r6, #0x3c]
	ldr r0, _02023DD0 ; =0x0000FFC2
	tst r1, r0
	bne _02023A1C
	add r0, r5, #0x300
	ldrh r2, [r0, #0x34]
	cmp r2, #0
	moveq r0, r1, lsl #0x1b
	moveq r0, r0, lsr #0x1f
	cmpeq r0, #1
	beq _02023A1C
	cmp r2, #0
	beq _02023A24
	ldrh r0, [r6, #0x3c]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	bne _02023A24
_02023A1C:
	mov r1, #0xa
	b _02023A58
_02023A24:
	mov r0, r7
	bl sub_0201B5FC
	ldrh r0, [sp, #0xa]
	tst r0, #1
	moveq r1, #1
	beq _02023A58
	tst r0, #4
	moveq r1, #0x12
	beq _02023A58
	ldrh r1, [sp, #0x16]
	mov r0, r7
	bl sub_0201B61C
	mov r1, #0
_02023A58:
	ldr r2, [sp, #0x1c]
	mov r0, r7
	bl sub_020211E0
	cmp r0, #0
	beq _02023D9C
	bl sub_0202086C
	b _02023D9C
_02023A74:
	add r0, r6, #0x10
	bl sub_0202292C
	b _02023D9C
_02023A80:
	add r0, r6, #0x10
	mov r1, #0
	bl sub_020229E0
	b _02023D9C
_02023A90:
	add r0, r6, #0x10
	bl sub_0202267C
	b _02023D9C
_02023A9C:
	add r0, r6, #0x10
	bl sub_02022DB0
	b _02023D9C
_02023AA8:
	add r0, r6, #0x10
	bl sub_02023350
	b _02023D9C
_02023AB4:
	cmp r8, #1
	bne _02023D9C
	cmp sb, #0xa
	bne _02023D9C
	ldr r0, _02023DCC ; =0x0380FFF4
	ldrh r4, [r6, #0x12]
	ldr r1, [r0]
	mov r0, r4
	add r5, r1, #0x17c
	bl sub_0201B7D0
	cmp r0, #0x40
	bne _02023D9C
	mov r0, r4
	bl sub_0201B5D8
	ldrh r0, [r5, #0x2c]
	cmp r0, #0
	beq _02023B00
	mov r0, #1
	bl sub_0201F6E4
_02023B00:
	ldrh r0, [r5, #0x20]
	cmp r0, #0
	beq _02023D9C
	mov r0, #0
	bl sub_0201F6E4
	b _02023D9C
_02023B18:
	cmp r8, #0
	bne _02023D9C
	cmp sb, #0xc
	addls pc, pc, sb, lsl #2
	b _02023D9C
_02023B2C: ; jump table
	b _02023D9C ; case 0
	b _02023B6C ; case 1
	b _02023D9C ; case 2
	b _02023C68 ; case 3
	b _02023D9C ; case 4
	b _02023D6C ; case 5
	b _02023D9C ; case 6
	b _02023D9C ; case 7
	b _02023B60 ; case 8
	b _02023D9C ; case 9
	b _02023D7C ; case 10
	b _02023D88 ; case 11
	b _02023D94 ; case 12
_02023B60:
	add r0, r6, #0x10
	bl sub_02022030
	b _02023D9C
_02023B6C:
	ldr r0, _02023DCC ; =0x0380FFF4
	ldr r0, [r0]
	add r5, r0, #0x344
	ldrh r1, [r5, #0xc]
	add r0, r0, #4
	cmp r1, #2
	add r4, r0, #0x400
	cmpne r1, #3
	bne _02023D9C
	ldrh r0, [r4]
	cmp r0, #0x51
	bne _02023D9C
	ldr r0, [r4, #0x18]
	add r1, r6, #0x2e
	add r0, r0, #0x10
	bl sub_02019C64
	cmp r0, #0
	beq _02023D9C
	bl sub_0201A3D0
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	bne _02023C08
	ldrh r1, [r6, #0x40]
	ldr r0, _02023DD4 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020197F0
	ldrh r0, [r5, #0x6a]
	bl sub_02021740
	add r0, r5, #0x82
	add r1, r6, #0x2e
	bl sub_020198D0
	add r0, r6, #0x2e
	bl sub_0201B0F0
	strh r0, [r5, #0x88]
	ldrh r0, [r5, #0x88]
	mov r1, #0x40
	bl sub_0201B434
_02023C08:
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [r6, #0x3e]
	ldrne r0, [r4, #0x1c]
	strneh r1, [r0, #6]
	bne _02023C44
	mov r2, #0
	strh r2, [r0, #4]
	ldr r1, [r4, #0x1c]
	mov r0, #0x40
	strh r2, [r1, #6]
	bl sub_03028A28
_02023C44:
	ldrh r1, [r5, #0x6a]
	ldr r0, [r4, #0x1c]
	mov r2, #0x53
	strh r1, [r0, #8]
	mov r0, #2
	mov r1, #3
	strh r2, [r4]
	bl sub_03027D88
	b _02023D9C
_02023C68:
	ldr r0, _02023DCC ; =0x0380FFF4
	ldr r0, [r0]
	add r5, r0, #0x344
	ldrh r1, [r5, #0xc]
	add r0, r0, #4
	cmp r1, #2
	add r4, r0, #0x400
	cmpne r1, #3
	bne _02023D9C
	ldrh r0, [r4]
	cmp r0, #0x61
	bne _02023D9C
	ldr r0, [r4, #0x18]
	add r1, r6, #0x2e
	add r0, r0, #0x10
	bl sub_02019C64
	cmp r0, #0
	beq _02023D9C
	bl sub_0201A3D0
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	bne _02023D0C
	ldrh r1, [r6, #0x40]
	ldr r0, _02023DD4 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020197F0
	ldrh r0, [r5, #0x6a]
	bl sub_02021740
	add r0, r5, #0x82
	add r1, r6, #0x2e
	bl sub_020198D0
	add r0, r6, #0x2e
	bl sub_0201B0F0
	strh r0, [r5, #0x88]
	ldrh r0, [r5, #0x88]
	mov r1, #0x40
	bl sub_0201B434
	mov r0, #0x40
	bl sub_03028A28
_02023D0C:
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [r6, #0x3e]
	ldrne r0, [r4, #0x1c]
	strneh r1, [r0, #6]
	bne _02023D48
	mov r2, #0
	strh r2, [r0, #4]
	ldr r1, [r4, #0x1c]
	mov r0, #0x40
	strh r2, [r1, #6]
	bl sub_03028A28
_02023D48:
	ldrh r1, [r5, #0x6a]
	ldr r0, [r4, #0x1c]
	mov r2, #0x63
	strh r1, [r0, #8]
	mov r0, #2
	mov r1, #4
	strh r2, [r4]
	bl sub_03027D88
	b _02023D9C
_02023D6C:
	add r0, r6, #0x10
	mov r1, #0
	bl sub_020229E0
	b _02023D9C
_02023D7C:
	add r0, r6, #0x10
	bl sub_0202267C
	b _02023D9C
_02023D88:
	add r0, r6, #0x10
	bl sub_02022DB0
	b _02023D9C
_02023D94:
	add r0, r6, #0x10
	bl sub_02023350
_02023D9C:
	mov r1, r6
	add r0, sl, #0x60
	bl sub_030280F8
	ldrh r0, [sl, #0x68]
	cmp r0, #0
	beq _02023DC0
	mov r0, #1
	mov r1, #7
	bl sub_03027D88
_02023DC0:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02023DCC: .word 0x0380FFF4
_02023DD0: .word 0x0000FFC2
_02023DD4: .word 0x00000FFF
	arm_func_end sub_02023724

	arm_func_start sub_02023DD8
sub_02023DD8: ; 0x02023DD8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r0, _020242F0 ; =0x0380FFF4
	mvn r1, #0
	ldr r2, [r0]
	add r0, r2, #0x17c
	ldr r5, [r0, #0x6c]
	str r0, [sp, #4]
	cmp r5, r1
	beq _020242E4
	add r0, r2, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x40
	bne _020242B8
	ldrh r1, [r5, #0x20]
	ldr r0, _020242F4 ; =0x000005FC
	cmp r1, r0
	bhi _020242B8
	ldrh r4, [r5, #0x24]
	add r0, sp, #8
	tst r4, #0x100
	beq _02023E50
	add r1, r5, #0x34
	bl sub_020198D0
	tst r4, #0x200
	bne _020242B8
	add r0, sp, #0xe
	add r1, r5, #0x2e
	bl sub_020198D0
	b _02023E78
_02023E50:
	add r1, r5, #0x28
	bl sub_020198D0
	tst r4, #0x200
	add r0, sp, #0xe
	beq _02023E70
	add r1, r5, #0x34
	bl sub_020198D0
	b _02023E78
_02023E70:
	add r1, r5, #0x2e
	bl sub_020198D0
_02023E78:
	ldrh r0, [r5, #0x3a]
	tst r4, #0x400
	strh r0, [sp, #0x14]
	beq _020240B0
	ldrh r0, [r5, #0x3a]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	bne _020240B0
	ldr r0, _020242F0 ; =0x0380FFF4
	mvn r6, #0
	ldr r0, [r0]
	mov r7, #0
	add r0, r0, #0xe4
	add r8, r0, #0x400
	add fp, sp, #8
	mov r4, #0x18
	b _02023FC0
_02023EBC:
	mul sb, r7, r4
	ldrh r0, [r8, sb]
	add sl, r8, sb
	cmp r0, #0
	beq _02023FB8
	mov r1, fp
	add r0, sl, #4
	bl sub_02019C64
	cmp r0, #0
	beq _02023FBC
	add r1, sp, #0xe
	add r0, sl, #0xa
	bl sub_02019C64
	cmp r0, #0
	beq _02023FBC
	ldrh r0, [sp, #0x14]
	ldrh r1, [sl, #0x10]
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x14
	mov r0, r1, lsl #0x10
	cmp r2, r0, lsr #20
	bne _02023FBC
	ldrh r0, [r5, #0x18]
	mov r1, r1, lsl #0x1c
	and r2, r0, #0xf0
	mov r0, r2, asr #3
	add r0, r2, r0, lsr #28
	mov r7, r0, asr #4
	subs r0, r7, r1, lsr #28
	beq _020242B8
	tst r0, #0x80000000
	bne _020242B8
	mov r0, sl
	ldr r4, [r0, #0x14]
	ldrh r0, [r5, #0x20]
	ldrh r3, [r4, #0x20]
	sub r0, r0, r3
	subs r6, r0, #0x18
	beq _020242B8
	tst r6, #0x80000000
	bne _020242B8
	add r0, r5, #0x3c
	add r1, r4, #0x3c
	mov r2, r6
	add r0, r0, r3
	add r1, r1, r3
	bl sub_0302D78C
	ldrh r1, [r4, #0x20]
	mov r0, r7, lsl #0x10
	add r1, r1, r6
	strh r1, [r4, #0x20]
	ldrh r1, [sl, #0x10]
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf
	and r0, r0, #0xf
	orr r1, r1, r0
	ldr r0, _020242F0 ; =0x0380FFF4
	strh r1, [sl, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x560]
	add r0, r0, r7
	str r0, [r1, #0x560]
	b _020242B8
_02023FB8:
	mov r6, r7
_02023FBC:
	add r7, r7, #1
_02023FC0:
	cmp r7, #3
	blo _02023EBC
	mvn r0, #0
	cmp r6, r0
	beq _020242B8
	ldr r0, _020242F0 ; =0x0380FFF4
	ldr r1, _020242F8 ; =0x00000622
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0302805C
	movs r4, r0
	beq _020240A4
	mov r0, #0x18
	mul r7, r6, r0
	add r6, r8, r7
	add r0, sp, #8
	add r1, r6, #4
	mov r2, #0x10
	bl sub_0302D78C
	mov r0, #5
	strh r0, [r8, r7]
	mov r0, r6
	str r4, [r0, #0x14]
	ldrh r2, [r5, #0x20]
	add r0, r5, #0x18
	add r1, r4, #0x18
	add r2, r2, #0xc
	bl sub_0302D78C
	ldr r0, _020242F0 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x30c]
	bl sub_0302D678
	ldrh r1, [r4, #0x18]
	ldrh r0, [r6, #0x10]
	and r1, r1, #0xf0
	bic r3, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r1, r0, asr #4
	mov r2, r1, lsl #0x10
	mov r2, r2, lsr #0x10
	and r2, r2, #0xf
	orr r2, r3, r2
	strh r2, [r6, #0x10]
	ldr r2, _020242F0 ; =0x0380FFF4
	ldr r3, [r2]
	ldr r2, [r3, #0x560]
	add r0, r2, r0, asr #4
	str r0, [r3, #0x560]
	ldrh r0, [r5, #0x20]
	sub r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x20]
	bl sub_030365C4
	mov r1, r6
	strh r0, [r1, #2]
	b _020242B8
_020240A4:
	mov r0, #4
	bl sub_0201A85C
	b _020242B8
_020240B0:
	ldr r1, _020242F0 ; =0x0380FFF4
	ldrh r0, [r5, #0x20]
	ldr r4, [r1]
	sub r1, r0, #0x18
	add r0, r4, #0xe4
	strh r1, [r5, #0x20]
	add r8, r0, #0x400
	mov r7, #0
	b _0202416C
_020240D4:
	mov r0, #0x18
	mul sb, r7, r0
	ldrh r0, [r8, sb]
	add sl, r8, sb
	cmp r0, #0
	beq _02024168
	add r1, sp, #8
	add r0, sl, #4
	bl sub_02019C64
	cmp r0, #0
	beq _02024168
	add r1, sp, #0xe
	add r0, sl, #0xa
	bl sub_02019C64
	cmp r0, #0
	beq _02024168
	ldrh r2, [sp, #0x14]
	ldrh r0, [sl, #0x10]
	mov r1, r2, lsl #0x10
	mov r1, r1, lsr #0x14
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #20
	bne _02024168
	mov r1, sl
	ldrh r0, [r1, #0x10]
	sub fp, r0, r2
	tst fp, #0x80000000
	bne _020242B8
	ldrh r0, [r1, #2]
	ldrh r1, [r5, #0x20]
	mul r0, fp, r0
	str r0, [sp]
	subs r6, r1, r0
	beq _020242B8
	tst r6, #0x80000000
	beq _02024174
	b _020242B8
_02024168:
	add r7, r7, #1
_0202416C:
	cmp r7, #3
	blo _020240D4
_02024174:
	cmp r7, #3
	beq _020242B8
	mov r0, #0x18
	mul sb, r7, r0
	add r0, r8, sb
	ldr r1, [r0, #0x14]
	ldr r0, _020242FC ; =0x000005E4
	add r7, r1, #0x10
	ldrh r1, [r7, #0x10]
	add sl, r1, r6
	cmp sl, r0
	bls _020241BC
	add r0, r4, #0x188
	sub r1, r7, #0x10
	bl sub_030280F8
	mov r0, #0
	strh r0, [r8, sb]
	b _020242B8
_020241BC:
	ldr r0, [sp]
	add r3, r5, #0x3c
	add r2, r7, #0x2c
	add r1, r2, r1
	add r0, r3, r0
	add r2, r6, #1
	bl sub_0302D78C
	strh sl, [r7, #0x10]
	ldrh r1, [r5, #0x18]
	add r0, r8, sb
	ldrh r6, [r0, #0x10]
	and r2, r1, #0xf0
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r3, r6, lsl #0x1c
	rsb r2, fp, r1, asr #4
	add r2, r2, r3, lsr #28
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bic r3, r6, #0xf
	and r2, r2, #0xf
	orr r3, r3, r2
	ldr r2, _020242F0 ; =0x0380FFF4
	strh r3, [r0, #0x10]
	ldr r3, [r2]
	ldr r2, [r3, #0x560]
	add r1, r2, r1, asr #4
	str r1, [r3, #0x560]
	ldrh r1, [r5, #0x18]
	tst r1, #0x100
	bne _020242B8
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r7, #8]
	bic r0, r0, #0xf0
	add r0, r0, #0x10
	strh r0, [r7, #8]
	ldrh r0, [r7, #0x10]
	add r0, r0, #0x18
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #8]
	ands r0, r0, #0xf
	beq _02024290
	cmp r0, #8
	add r0, r4, #0x188
	bne _020242B0
	add r1, r4, #0x1c4
	sub r2, r7, #0x10
	bl sub_03028178
	mov r0, #2
	mov r1, #6
	bl sub_03027D88
	b _020242B8
_02024290:
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r7, #0x10
	bl sub_03028178
	mov r0, #1
	mov r1, #7
	bl sub_03027D88
	b _020242B8
_020242B0:
	sub r1, r7, #0x10
	bl sub_030280F8
_020242B8:
	ldr r0, [sp, #4]
	mov r1, r5
	add r0, r0, #0x6c
	bl sub_030280F8
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x74]
	cmp r0, #0
	beq _020242E4
	mov r0, #2
	mov r1, #9
	bl sub_03027D88
_020242E4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020242F0: .word 0x0380FFF4
_020242F4: .word 0x000005FC
_020242F8: .word 0x00000622
_020242FC: .word 0x000005E4
	arm_func_end sub_02023DD8

	arm_func_start sub_02024300
sub_02024300: ; 0x02024300
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02024368 ; =0x0380FFF4
	mov r6, #0
	ldr r0, [r4]
	mov r7, #0x18
	add r0, r0, #0xe4
	add r5, r0, #0x400
_0202431C:
	mul r1, r6, r7
	ldrh r0, [r5, r1]
	add r1, r5, r1
	cmp r0, #0
	beq _02024354
	sub r0, r0, #1
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _02024354
	ldr r0, [r4]
	ldr r1, [r1, #0x14]
	add r0, r0, #0x188
	bl sub_030280F8
_02024354:
	add r6, r6, #1
	cmp r6, #3
	blo _0202431C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02024368: .word 0x0380FFF4
	arm_func_end sub_02024300

	arm_func_start sub_0202436C
sub_0202436C: ; 0x0202436C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _020244AC ; =0x0380FFF4
	mov sb, r2
	ldr r2, [r3]
	mov fp, r0
	add r0, sb, #1
	mov sl, r1
	add r4, r2, #0x23c
	bl sub_0201A540
	cmp r0, #0x20
	bhi _020244A4
	mov r6, #4
	mov r7, r6
	mov r8, #0x400
	mov r5, #0
	b _020243EC
_020243AC:
	ldrh r0, [r4]
	cmp r0, #0
	beq _020243E0
	add r0, r4, #6
	add r1, sl, #0x24
	bl sub_02019C64
	cmp r0, #0
	bne _0202440C
	ldrh r0, [r4, #0x30]
	cmp r0, r8
	movlo r8, r0
	movlo r7, r5
	b _020243E4
_020243E0:
	mov r6, r5
_020243E4:
	add r5, r5, #1
	add r4, r4, #0x32
_020243EC:
	cmp r5, #4
	blo _020243AC
	cmp r6, #4
	movne r5, r6
	bne _0202440C
	cmp r7, #4
	movne r5, r7
	beq _020244A4
_0202440C:
	ldr r0, _020244AC ; =0x0380FFF4
	mov r2, #0x32
	mul r4, r5, r2
	ldr r0, [r0]
	add r5, r0, #0x23c
	add r6, r5, r4
	mov r1, r6
	mov r0, #0
	bl sub_0302D764
	mov r0, #0x400
	strh r0, [r6, #0x30]
	ldrh r1, [sl, #0x12]
	add r0, r6, #6
	and r1, r1, #0xff
	strh r1, [r5, r4]
	strh fp, [r6, #2]
	add r1, sl, #0x24
	bl sub_020198D0
	add r0, sb, #1
	bl sub_0201A540
	strh r0, [r6, #0xc]
	mov r7, #0
	add r5, sb, #2
	add r4, r6, #0xe
	b _02024488
_02024470:
	add r0, r5, r7
	bl sub_0201A540
	mov r1, r0
	add r0, r4, r7
	bl sub_0201A514
	add r7, r7, #1
_02024488:
	ldrh r0, [r6, #0xc]
	cmp r7, r0
	blo _02024470
	ldrh r0, [sl, #0x34]
	strh r0, [r6, #0x2e]
	ldrh r0, [sl, #0x36]
	strh r0, [r6, #4]
_020244A4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_020244AC: .word 0x0380FFF4
	arm_func_end sub_0202436C
_020244B0:
	.byte 0x14, 0x10, 0x9F, 0xE5, 0x14, 0xC0, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5, 0x00, 0x00, 0xA0, 0xE3
	.byte 0xC8, 0x20, 0xA0, 0xE3, 0x8F, 0x1F, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03
	.byte 0x74, 0xDF, 0x7F, 0x03, 0x3C, 0x00, 0x9F, 0xE5, 0x00, 0x30, 0xA0, 0xE3, 0x00, 0x00, 0x90, 0xE5
	.byte 0x8F, 0x2F, 0x80, 0xE2, 0x03, 0x00, 0xA0, 0xE1, 0xB0, 0x13, 0xD2, 0xE1, 0x00, 0x00, 0x51, 0xE3
	.byte 0x04, 0x00, 0x00, 0x0A, 0x01, 0x10, 0x41, 0xE2, 0xB0, 0x13, 0xC2, 0xE1, 0xB0, 0x13, 0xD2, 0xE1
	.byte 0x00, 0x00, 0x51, 0xE3, 0xB0, 0x00, 0xC2, 0x01, 0x01, 0x30, 0x83, 0xE2, 0x04, 0x00, 0x53, 0xE3
	.byte 0xF4, 0xFF, 0xFF, 0x3A, 0x1E, 0xFF, 0x2F, 0xE1, 0xF4, 0xFF, 0x80, 0x03

	arm_func_start sub_0202451C
sub_0202451C: ; 0x0202451C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020245B8 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldr r1, [r0, #0x318]
	ldrh r6, [r1, #2]
	cmp r6, #0xa4
	blo _02024548
	ldr r0, _020245BC ; =0x000001D6
	cmp r6, r0
	bls _02024550
_02024548:
	mov r0, #2
	b _020245B0
_02024550:
	add r7, r1, #2
	mov r5, #0
	b _02024580
_0202455C:
	mov r0, r7
	bl sub_0201A540
	mov r1, r5, lsl #0x10
	and r0, r0, #0xff
	mov r1, r1, lsr #0x10
	add r7, r7, #1
	bl sub_0201A5D8
	mov r5, r0
	sub r6, r6, #1
_02024580:
	cmp r6, #0
	bne _0202455C
	ldr r0, _020245B8 ; =0x0380FFF4
	cmp r4, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x318]
	ldrh r1, [r0]
	orrne r0, r1, r5, lsl #16
	strne r0, [r4]
	cmp r5, r1
	movne r0, #1
	moveq r0, #0
_020245B0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_020245B8: .word 0x0380FFF4
_020245BC: .word 0x000001D6
	arm_func_end sub_0202451C

	arm_func_start sub_020245C0
sub_020245C0: ; 0x020245C0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r4, sp, #0
_020245CC:
	mov r0, r4
	bl sub_02024D38
	ldr r0, [sp]
	tst r0, #0x20
	beq _020245E8
	bl sub_02025474
	b _020245CC
_020245E8:
	ldr r0, [sp]
	tst r0, #1
	bne _020245CC
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_020245C0

	arm_func_start sub_02024600
sub_02024600: ; 0x02024600
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0202465C ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r5, r2
	ldr r1, [r1, #0x318]
	cmp r1, #0
	beq _02024654
	add r0, r1, r0
	sub r4, r0, #0x2a
	b _0202464C
_0202462C:
	mov r0, r4
	bl sub_0201A540
	mov r1, r0
	mov r0, r5
	add r4, r4, #1
	bl sub_0201A514
	add r5, r5, #1
	sub r6, r6, #1
_0202464C:
	cmp r6, #0
	bne _0202462C
_02024654:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0202465C: .word 0x0380FFF4
	arm_func_end sub_02024600

	arm_func_start sub_02024660
sub_02024660: ; 0x02024660
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020246AC ; =0x0380FFF4
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	ldr r0, [r0, #0x314]
	mov r4, r2
	bl sub_0303317C
	bl sub_020245C0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02024DA8
	ldr r0, _020246AC ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_030331D8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020246AC: .word 0x0380FFF4
	arm_func_end sub_02024660

	arm_func_start sub_020246B0
sub_020246B0: ; 0x020246B0
	stmdb sp!, {r3, lr}
	ldr r0, _02024794 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_0303317C
	bl sub_020245C0
	mov r3, #0
	add r2, sp, #0
	mov r0, #0x2c
	mov r1, #2
	str r3, [sp]
	bl sub_02024DA8
	ldr r0, _02024794 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_030331D8
	ldr r1, [sp]
	cmp r1, #0xa4
	blo _02024708
	ldr r0, _02024798 ; =0x000001D6
	cmp r1, r0
	bls _02024710
_02024708:
	mov r0, #0
	b _0202478C
_02024710:
	ldr r0, _02024794 ; =0x0380FFF4
	add r1, r1, #2
	str r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0302805C
	ldr r2, _02024794 ; =0x0380FFF4
	ldr r1, [r2]
	str r0, [r1, #0x318]
	ldr r1, [r2]
	ldr r0, [r1, #0x318]
	cmp r0, #0
	moveq r0, #0
	beq _0202478C
	add r0, r0, #0xc
	str r0, [r1, #0x318]
	ldr r0, [r2]
	ldr r0, [r0, #0x314]
	bl sub_0303317C
	bl sub_020245C0
	ldr r0, _02024794 ; =0x0380FFF4
	ldr r1, [sp]
	ldr r2, [r0]
	mov r0, #0x2a
	ldr r2, [r2, #0x318]
	bl sub_02024DA8
	ldr r0, _02024794 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_030331D8
	mov r0, #1
_0202478C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02024794: .word 0x0380FFF4
_02024798: .word 0x000001D6
	arm_func_end sub_020246B0
_0202479C:
	.byte 0x1C, 0x00, 0x9F, 0xE5
	.byte 0x00, 0x30, 0xA0, 0xE3, 0x03, 0x20, 0xA0, 0xE1, 0x83, 0x10, 0xA0, 0xE1, 0x01, 0x30, 0x83, 0xE2
	.byte 0xB1, 0x20, 0x80, 0xE1, 0x10, 0x00, 0x53, 0xE3, 0xFA, 0xFF, 0xFF, 0xBA, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0x08, 0x8E, 0x7F, 0x02, 0x38, 0x40, 0x2D, 0xE9, 0x08, 0xD0, 0x4D, 0xE2, 0x02, 0x04, 0x10, 0xE3
	.byte 0x07, 0x00, 0x00, 0x0A, 0x88, 0x21, 0x9F, 0xE5, 0x00, 0x50, 0xA0, 0xE3, 0x05, 0xE0, 0xA0, 0xE1
	.byte 0x85, 0x40, 0xA0, 0xE1, 0x01, 0x50, 0x85, 0xE2, 0xB4, 0xE0, 0x82, 0xE1, 0x10, 0x00, 0x55, 0xE3
	.byte 0xFA, 0xFF, 0xFF, 0xBA, 0x68, 0x21, 0x9F, 0xE5, 0x0F, 0x48, 0x00, 0xE2, 0x24, 0x48, 0xA0, 0xE1
	.byte 0x84, 0x40, 0xA0, 0xE1, 0xB4, 0x00, 0x82, 0xE1, 0x01, 0x04, 0x10, 0xE3, 0x51, 0x00, 0x00, 0x0A
	.byte 0x50, 0xE1, 0x9F, 0xE5, 0xB0, 0x00, 0xDE, 0xE1, 0xFF, 0x2C, 0x00, 0xE2, 0x02, 0x24, 0xA0, 0xE1
	.byte 0x22, 0x48, 0xA0, 0xE1, 0x22, 0x20, 0x44, 0xE2, 0x0A, 0x00, 0x52, 0xE3, 0x02, 0xF1, 0x8F, 0x90
	.byte 0x3D, 0x00, 0x00, 0xEA, 0x09, 0x00, 0x00, 0xEA, 0x16, 0x00, 0x00, 0xEA, 0x15, 0x00, 0x00, 0xEA
	.byte 0x26, 0x00, 0x00, 0xEA, 0x25, 0x00, 0x00, 0xEA, 0x34, 0x00, 0x00, 0xEA, 0x33, 0x00, 0x00, 0xEA
	.byte 0x35, 0x00, 0x00, 0xEA, 0x34, 0x00, 0x00, 0xEA, 0x33, 0x00, 0x00, 0xEA, 0xFF, 0xFF, 0xFF, 0xEA
	.byte 0xB4, 0xC0, 0xDE, 0xE1, 0xB2, 0x20, 0xDE, 0xE1, 0x00, 0x0C, 0xA0, 0xE1, 0xFF, 0xCC, 0x0C, 0xE2
	.byte 0x02, 0x04, 0x80, 0xE1, 0x2C, 0xC4, 0x80, 0xE1, 0x02, 0x04, 0x5C, 0xE3, 0x01, 0x00, 0x00, 0x3A
	.byte 0x0A, 0x05, 0x5C, 0xE3, 0x28, 0x00, 0x00, 0x3A, 0x04, 0x00, 0xA0, 0xE1, 0x02, 0x10, 0xA0, 0xE3
	.byte 0x68, 0x3A, 0x40, 0xEB, 0x2F, 0x00, 0x00, 0xEA, 0xB8, 0x20, 0xDE, 0xE1, 0xBA, 0x10, 0xDE, 0xE1
	.byte 0x02, 0xC8, 0x81, 0xE1, 0x02, 0x04, 0x5C, 0xE3, 0x01, 0x00, 0x00, 0x3A, 0x0A, 0x05, 0x5C, 0xE3
	.byte 0x03, 0x00, 0x00, 0x3A, 0x04, 0x00, 0xA0, 0xE1, 0x02, 0x10, 0xA0, 0xE3, 0x5D, 0x3A, 0x40, 0xEB
	.byte 0x24, 0x00, 0x00, 0xEA, 0xB2, 0x20, 0xDE, 0xE1, 0x00, 0x3C, 0xA0, 0xE1, 0xB4, 0x10, 0xDE, 0xE1
	.byte 0xB6, 0x00, 0xDE, 0xE1, 0x23, 0x34, 0x82, 0xE1, 0x01, 0x18, 0x80, 0xE1, 0x12, 0x00, 0x00, 0xEA
	.byte 0xB6, 0x20, 0xDE, 0xE1, 0xB8, 0x10, 0xDE, 0xE1, 0x02, 0xC8, 0x81, 0xE1, 0x02, 0x04, 0x5C, 0xE3
	.byte 0x01, 0x00, 0x00, 0x3A, 0x0A, 0x05, 0x5C, 0xE3, 0x03, 0x00, 0x00, 0x3A, 0x04, 0x00, 0xA0, 0xE1
	.byte 0x02, 0x10, 0xA0, 0xE3, 0x4B, 0x3A, 0x40, 0xEB, 0x12, 0x00, 0x00, 0xEA, 0xB2, 0x20, 0xDE, 0xE1
	.byte 0x00, 0x0C, 0xA0, 0xE1, 0xB4, 0x10, 0xDE, 0xE1, 0x20, 0x34, 0x82, 0xE1, 0x02, 0x00, 0x00, 0xEA
	.byte 0xB2, 0x20, 0xDE, 0xE1, 0x00, 0x0C, 0xA0, 0xE1, 0x20, 0x34, 0x82, 0xE1, 0x00, 0x10, 0x8D, 0xE5
	.byte 0x04, 0x10, 0xA0, 0xE1, 0x01, 0x00, 0xA0, 0xE3, 0x03, 0x20, 0xA0, 0xE3, 0x04, 0xC0, 0x8D, 0xE5
	.byte 0x89, 0x3A, 0x40, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x02, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1
	.byte 0x04, 0x10, 0xA0, 0xE3, 0x37, 0x3A, 0x40, 0xEB, 0x08, 0xD0, 0x8D, 0xE2, 0x38, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0x08, 0x8E, 0x7F, 0x02, 0x08, 0x8E, 0x7F, 0x02, 0x38, 0x40, 0x2D, 0xE9
	.byte 0x00, 0x40, 0xA0, 0xE1, 0xDD, 0x22, 0x40, 0xEB, 0x00, 0x50, 0xA0, 0xE1, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x5D, 0x3A, 0x40, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A, 0x05, 0x00, 0xA0, 0xE1
	.byte 0xDB, 0x22, 0x40, 0xEB, 0x04, 0x00, 0x94, 0xE5, 0x04, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0x23, 0x3A, 0x40, 0xEB, 0xA2, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x58, 0x3A, 0x40, 0xEB, 0x05, 0x00, 0xA0, 0xE1, 0xD1, 0x22, 0x40, 0xEB, 0x04, 0x00, 0x94, 0xE5
	.byte 0x20, 0x00, 0x40, 0xE2, 0x0D, 0x00, 0x50, 0xE3, 0x00, 0xF1, 0x8F, 0x90, 0x8A, 0x00, 0x00, 0xEA
	.byte 0x0C, 0x00, 0x00, 0xEA, 0x0D, 0x00, 0x00, 0xEA, 0x0E, 0x00, 0x00, 0xEA, 0x10, 0x00, 0x00, 0xEA
	.byte 0x1F, 0x00, 0x00, 0xEA, 0x2E, 0x00, 0x00, 0xEA, 0x3F, 0x00, 0x00, 0xEA, 0x50, 0x00, 0x00, 0xEA
	.byte 0x5D, 0x00, 0x00, 0xEA, 0x6A, 0x00, 0x00, 0xEA, 0x6B, 0x00, 0x00, 0xEA, 0x6C, 0x00, 0x00, 0xEA
	.byte 0x78, 0x00, 0x00, 0xEA, 0x7A, 0x00, 0x00, 0xEA, 0xA1, 0x00, 0x00, 0xEB, 0x82, 0x00, 0x00, 0xEA
	.byte 0xB8, 0x00, 0x00, 0xEB, 0x80, 0x00, 0x00, 0xEA, 0x10, 0x00, 0x94, 0xE5, 0xC5, 0x00, 0x00, 0xEB
	.byte 0x7D, 0x00, 0x00, 0xEA, 0x85, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0xFC, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0x38, 0x3A, 0x40, 0xEB, 0x79, 0x00, 0x00, 0xEA
	.byte 0x08, 0x00, 0x94, 0xE5, 0x0C, 0x10, 0x94, 0xE5, 0x10, 0x20, 0x94, 0xE5, 0xD1, 0x00, 0x00, 0xEB
	.byte 0x6D, 0x00, 0x00, 0xEA, 0x75, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0xEC, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0x28, 0x3A, 0x40, 0xEB, 0x69, 0x00, 0x00, 0xEA
	.byte 0x08, 0x00, 0x94, 0xE5, 0x0C, 0x10, 0x94, 0xE5, 0x10, 0x20, 0x94, 0xE5, 0x0B, 0x01, 0x00, 0xEB
	.byte 0x5D, 0x00, 0x00, 0xEA, 0x6E, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0xDC, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0x18, 0x3A, 0x40, 0xEB, 0x59, 0x00, 0x00, 0xEA
	.byte 0x0C, 0x10, 0x94, 0xE5, 0x08, 0x00, 0x94, 0xE5, 0x01, 0x18, 0xA0, 0xE1, 0x10, 0x20, 0x94, 0xE5
	.byte 0x21, 0x18, 0xA0, 0xE1, 0x41, 0x01, 0x00, 0xEB, 0x4B, 0x00, 0x00, 0xEA, 0x5C, 0x00, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3
	.byte 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0xCA, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x06, 0x3A, 0x40, 0xEB, 0x47, 0x00, 0x00, 0xEA, 0x0C, 0x10, 0x94, 0xE5, 0x08, 0x00, 0x94, 0xE5
	.byte 0x01, 0x18, 0xA0, 0xE1, 0x10, 0x20, 0x94, 0xE5, 0x21, 0x18, 0xA0, 0xE1, 0x72, 0x01, 0x00, 0xEB
	.byte 0x39, 0x00, 0x00, 0xEA, 0x4A, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0xB8, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0xF4, 0x39, 0x40, 0xEB, 0x35, 0x00, 0x00, 0xEA
	.byte 0x08, 0x00, 0x94, 0xE5, 0xA7, 0x01, 0x00, 0xEB, 0x2B, 0x00, 0x00, 0xEA, 0x3C, 0x00, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A, 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3
	.byte 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0xAA, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3
	.byte 0xE6, 0x39, 0x40, 0xEB, 0x27, 0x00, 0x00, 0xEA, 0x08, 0x00, 0x94, 0xE5, 0xBB, 0x01, 0x00, 0xEB
	.byte 0x1D, 0x00, 0x00, 0xEA, 0xDB, 0x01, 0x00, 0xEB, 0x1B, 0x00, 0x00, 0xEA, 0xE9, 0x01, 0x00, 0xEB
	.byte 0x19, 0x00, 0x00, 0xEA, 0x2A, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0x1A
	.byte 0x04, 0x00, 0x94, 0xE5, 0x03, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1
	.byte 0x98, 0x39, 0x40, 0xEB, 0x01, 0x00, 0xA0, 0xE3, 0xD4, 0x39, 0x40, 0xEB, 0x15, 0x00, 0x00, 0xEA
	.byte 0xEC, 0x01, 0x00, 0xEB, 0x0C, 0x00, 0x00, 0xEA, 0x10, 0x00, 0x94, 0xE5, 0xF9, 0x01, 0x00, 0xEB
	.byte 0x09, 0x00, 0x00, 0xEA, 0x1E, 0x02, 0x00, 0xEB, 0x07, 0x00, 0x00, 0xEA, 0x01, 0x00, 0xA0, 0xE3
	.byte 0xCA, 0x39, 0x40, 0xEB, 0x04, 0x00, 0x94, 0xE5, 0x01, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1
	.byte 0x20, 0x08, 0xA0, 0xE1, 0x87, 0x39, 0x40, 0xEB, 0x06, 0x00, 0x00, 0xEA, 0x04, 0x00, 0x94, 0xE5
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x08, 0xA0, 0xE1, 0x20, 0x08, 0xA0, 0xE1, 0x81, 0x39, 0x40, 0xEB
	.byte 0x01, 0x00, 0xA0, 0xE3, 0xBD, 0x39, 0x40, 0xEB, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start sub_02024C40
sub_02024C40: ; 0x02024C40
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl sub_02024D38
	ldrh r0, [sp]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02024C40

	arm_func_start sub_02024C64
sub_02024C64: ; 0x02024C64
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl sub_02024D38
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	bne _02024C8C
	tst r0, #2
	movne r0, #1
	moveq r0, #0
_02024C8C:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02024C64
_02024C94:
	.byte 0x30, 0x20, 0x9F, 0xE5, 0xB0, 0x00, 0xD2, 0xE1, 0x80, 0x00, 0x10, 0xE3
	.byte 0xFC, 0xFF, 0xFF, 0x1A, 0x24, 0x00, 0x9F, 0xE5, 0x81, 0x1C, 0xA0, 0xE3, 0xB0, 0x10, 0xC2, 0xE1
	.byte 0x06, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2, 0xB0, 0x00, 0xD1, 0xE1
	.byte 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x1E, 0xFF, 0x2F, 0xE1, 0xC0, 0x01, 0x00, 0x04
	.byte 0xC2, 0x01, 0x00, 0x04

	arm_func_start sub_02024CD4
sub_02024CD4: ; 0x02024CD4
	ldr r1, _02024CF4 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_02024CE4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02024CE4
	bx lr
	.align 2, 0
_02024CF4: .word 0x040001C2
	arm_func_end sub_02024CD4
_02024CF8:
	.byte 0x30, 0x20, 0x9F, 0xE5, 0xB0, 0x00, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x24, 0x00, 0x9F, 0xE5, 0x81, 0x1C, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC2, 0xE1, 0x04, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xC0, 0x01, 0x00, 0x04, 0xC2, 0x01, 0x00, 0x04

	arm_func_start sub_02024D38
sub_02024D38: ; 0x02024D38
	ldr r3, _02024DA0 ; =0x040001C0
_02024D3C:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _02024D3C
	ldr r1, _02024DA4 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #5
	strh r2, [r1]
	sub r3, r1, #2
_02024D60:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _02024D60
	ldr r1, _02024DA4 ; =0x040001C2
	mov r2, #0x8100
	strh r2, [r3]
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_02024D84:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02024D84
	ldr r1, _02024DA4 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_02024DA0: .word 0x040001C0
_02024DA4: .word 0x040001C2
	arm_func_end sub_02024D38

	arm_func_start sub_02024DA8
sub_02024DA8: ; 0x02024DA8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _02024E98
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _02024EA4 ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_02024DE0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _02024DE0
	ldr r4, _02024EA8 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #3
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_02024E0C:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _02024E0C
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _02024E0C
	ldr r2, _02024EA4 ; =0x040001C0
_02024E38:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _02024E38
	mov r4, #0
	ldr r2, _02024EA4 ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _02024E74
_02024E58:
	strh r3, [r2, #2]
_02024E5C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02024E5C
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_02024E74:
	cmp r4, r0
	blo _02024E58
	ldr r0, _02024EA4 ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl sub_02024EAC
	ldr r0, _02024EA8 ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_02024E98:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02024EA4: .word 0x040001C0
_02024EA8: .word 0x040001C2
	arm_func_end sub_02024DA8

	arm_func_start sub_02024EAC
sub_02024EAC: ; 0x02024EAC
	ldr r0, _02024ECC ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_02024EBC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _02024EBC
	bx lr
	.align 2, 0
_02024ECC: .word 0x040001C2
	arm_func_end sub_02024EAC

	arm_func_start sub_02024ED0
sub_02024ED0: ; 0x02024ED0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _02024FDC
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _02024FE8 ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_02024F08:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _02024F08
	ldr r4, _02024FEC ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #0xb
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_02024F34:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _02024F34
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _02024F34
	ldr r2, _02024FE8 ; =0x040001C0
_02024F60:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _02024F60
	ldr r0, _02024FEC ; =0x040001C2
	mov r2, #0
	strh r2, [r0]
	sub r2, r0, #2
_02024F7C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _02024F7C
	mov r4, #0
	ldr r2, _02024FE8 ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _02024FB8
_02024F9C:
	strh r3, [r2, #2]
_02024FA0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02024FA0
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_02024FB8:
	cmp r4, r0
	blo _02024F9C
	ldr r0, _02024FE8 ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl sub_02024EAC
	ldr r0, _02024FEC ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_02024FDC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02024FE8: .word 0x040001C0
_02024FEC: .word 0x040001C2
	arm_func_end sub_02024ED0

	arm_func_start sub_02024FF0
sub_02024FF0: ; 0x02024FF0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _020250E8
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _020250F4 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_02025044:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _02025044
	ldr lr, _020250F8 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #0xa
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_02025070:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _02025070
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _02025070
	sub r3, r1, #1
	ldr r1, _020250F4 ; =0x040001C0
	mov r4, #0
	b _020250C0
_020250A8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020250A8
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_020250C0:
	cmp r4, r3
	blt _020250A8
	ldr r1, _020250F4 ; =0x040001C0
_020250CC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020250CC
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl sub_02024CD4
_020250E8:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020250F4: .word 0x040001C0
_020250F8: .word 0x040001C2
	arm_func_end sub_02024FF0

	arm_func_start sub_020250FC
sub_020250FC: ; 0x020250FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _020251F4
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _02025200 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_02025150:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _02025150
	ldr lr, _02025204 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #2
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_0202517C:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _0202517C
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _0202517C
	sub r3, r1, #1
	ldr r1, _02025200 ; =0x040001C0
	mov r4, #0
	b _020251CC
_020251B4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020251B4
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_020251CC:
	cmp r4, r3
	blt _020251B4
	ldr r1, _02025200 ; =0x040001C0
_020251D8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020251D8
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl sub_02024CD4
_020251F4:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02025200: .word 0x040001C0
_02025204: .word 0x040001C2
	arm_func_end sub_020250FC

	arm_func_start sub_02025208
sub_02025208: ; 0x02025208
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _02025288 ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_02025230:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _02025230
	ldr r1, _0202528C ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xdb
	strh r2, [r1]
	sub r2, r1, #2
_02025254:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _02025254
	bl sub_02024CD4
	mov r0, r4
	bl sub_02024CD4
	ldr r1, _02025288 ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl sub_02024CD4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02025288: .word 0x040001C0
_0202528C: .word 0x040001C2
	arm_func_end sub_02025208

	arm_func_start sub_02025290
sub_02025290: ; 0x02025290
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _02025310 ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_020252B8:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _020252B8
	ldr r1, _02025314 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xd8
	strh r2, [r1]
	sub r2, r1, #2
_020252DC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _020252DC
	bl sub_02024CD4
	mov r0, r4
	bl sub_02024CD4
	ldr r1, _02025310 ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl sub_02024CD4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02025310: .word 0x040001C0
_02025314: .word 0x040001C2
	arm_func_end sub_02025290
_02025318:
	.byte 0x30, 0x20, 0x9F, 0xE5, 0xB0, 0x00, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x24, 0x00, 0x9F, 0xE5, 0x81, 0x1C, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC2, 0xE1, 0xB9, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xC0, 0x01, 0x00, 0x04, 0xC2, 0x01, 0x00, 0x04, 0x30, 0x20, 0x9F, 0xE5, 0xB0, 0x00, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x24, 0x00, 0x9F, 0xE5, 0x81, 0x1C, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC2, 0xE1, 0xAB, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xC0, 0x01, 0x00, 0x04, 0xC2, 0x01, 0x00, 0x04, 0x30, 0x20, 0x9F, 0xE5, 0xB0, 0x00, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x24, 0x00, 0x9F, 0xE5, 0x81, 0x1C, 0xA0, 0xE3
	.byte 0xB0, 0x10, 0xC2, 0xE1, 0xC7, 0x10, 0xA0, 0xE3, 0xB0, 0x10, 0xC0, 0xE1, 0x02, 0x10, 0x40, 0xE2
	.byte 0xB0, 0x00, 0xD1, 0xE1, 0x80, 0x00, 0x10, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xC0, 0x01, 0x00, 0x04, 0xC2, 0x01, 0x00, 0x04, 0x08, 0x40, 0x2D, 0xE9, 0x88, 0x30, 0x9F, 0xE5
	.byte 0xB0, 0x10, 0xD3, 0xE1, 0x80, 0x00, 0x11, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x7C, 0x10, 0x9F, 0xE5
	.byte 0x89, 0x2C, 0xA0, 0xE3, 0xB0, 0x20, 0xC3, 0xE1, 0x9F, 0x20, 0xA0, 0xE3, 0xB0, 0x20, 0xC1, 0xE1
	.byte 0x02, 0x20, 0x41, 0xE2, 0xB0, 0x10, 0xD2, 0xE1, 0x80, 0x00, 0x11, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A
	.byte 0x58, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xA0, 0xE3, 0xB0, 0x20, 0xC1, 0xE1, 0x02, 0xE0, 0x41, 0xE2
	.byte 0xB0, 0x10, 0xDE, 0xE1, 0x80, 0x00, 0x11, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x3C, 0xC0, 0x9F, 0xE5
	.byte 0x81, 0x2C, 0xA0, 0xE3, 0xB0, 0x30, 0xDC, 0xE1, 0x00, 0x10, 0xA0, 0xE3, 0x00, 0x30, 0xC0, 0xE5
	.byte 0xB0, 0x20, 0xCE, 0xE1, 0xB0, 0x10, 0xCC, 0xE1, 0x02, 0x20, 0x4C, 0xE2, 0xB0, 0x10, 0xD2, 0xE1
	.byte 0x80, 0x00, 0x11, 0xE3, 0xFC, 0xFF, 0xFF, 0x1A, 0x10, 0x10, 0x9F, 0xE5, 0xB0, 0x10, 0xD1, 0xE1
	.byte 0x01, 0x10, 0xC0, 0xE5, 0x08, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0xC0, 0x01, 0x00, 0x04
	.byte 0xC2, 0x01, 0x00, 0x04

	arm_func_start sub_02025474
sub_02025474: ; 0x02025474
	ldr r2, _020254AC ; =0x040001C0
_02025478:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _02025478
	ldr r0, _020254B0 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xff
	strh r1, [r0]
	sub r1, r0, #2
_0202549C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0202549C
	bx lr
	.align 2, 0
_020254AC: .word 0x040001C0
_020254B0: .word 0x040001C2
	arm_func_end sub_02025474

	arm_func_start sub_020254B4
sub_020254B4: ; 0x020254B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r1, _020256F0 ; =0x027F8E28
	mov r8, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _020256E4
	mov r2, #1
	strh r2, [r1]
	add r0, sp, #8
	str r2, [r1, #0x1d8]
	bl sub_020262F4
	add r0, sp, #0xa
	bl sub_02026358
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x18
	movs r1, r1, lsr #0x1f
	bne _02025518
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	bne _02025518
	ldrh r0, [sp, #0xa]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	beq _02025530
_02025518:
	ldrh r1, [sp, #8]
	add r0, sp, #8
	bic r1, r1, #1
	orr r1, r1, #1
	strh r1, [sp, #8]
	bl sub_02026320
_02025530:
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _0202554C
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _0202556C
_0202554C:
	ldrh r1, [sp, #0xa]
	add r0, sp, #0xa
	bic r1, r1, #0xf
	strh r1, [sp, #0xa]
	ldrh r1, [sp, #0xa]
	bic r1, r1, #0x40
	strh r1, [sp, #0xa]
	bl sub_02026384
_0202556C:
	ldr r0, _020256F4 ; =0x027FFDE8
	bl sub_02025F84
	ldr r0, _020256F4 ; =0x027FFDE8
	ldr r0, [r0]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl sub_02025DAC
	ldr r1, _020256F4 ; =0x027FFDE8
	mov r5, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl sub_02025DAC
	ldr r1, _020256F4 ; =0x027FFDE8
	mov r6, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl sub_02025DAC
	sub r1, r6, #1
	cmp r1, #1
	add r7, r0, #0x7d0
	subls r7, r7, #1
	mov r0, r7
	mov r1, #0x190
	addls r6, r6, #0xc
	bl sub_030365C4
	mov r4, r0
	mov r0, r7
	mov r1, #0x64
	bl sub_030365C4
	mov r1, #0xd
	mul r1, r6, r1
	mov r6, r0
	add r0, r1, #8
	mov r1, #5
	bl sub_030365C4
	add r1, r7, r7, lsr #2
	sub r1, r1, r6
	add r1, r4, r1
	add r0, r1, r0
	add r0, r5, r0
	mov r1, #7
	bl sub_030365C4
	ldr r0, _020256F4 ; =0x027FFDE8
	ldr r2, [r0]
	mov r3, r2, lsl #5
	mov r3, r3, lsr #0x1d
	cmp r3, r1
	beq _02025648
	bic r2, r2, #0x7000000
	mov r1, r1, lsl #0x1d
	orr r1, r2, r1, lsr #5
	str r1, [r0]
	bl sub_02025FB0
_02025648:
	mov r0, #1
	bl sub_02025E60
	ldr r0, _020256F0 ; =0x027F8E28
	mov r1, #0
	str r1, [r0, #0x1d8]
	bl sub_0302DAA4
	ldr r1, _020256F8 ; =0x027F5F24
	mov r0, #5
	bl sub_0302DB8C
	ldr r0, _020256FC ; =0x027F8E2C
	ldr r1, _02025700 ; =0x027F8E4C
	mov r2, #4
	bl sub_0302BE9C
	mov r0, #0x100
	stmia sp, {r0, r8}
	ldr r0, _02025704 ; =0x027F8E5C
	ldr r1, _02025708 ; =0x027F60A8
	ldr r3, _0202570C ; =0x027F9000
	mov r2, #0
	bl sub_0302B844
	ldr r0, _02025704 ; =0x027F8E5C
	bl sub_0302BB5C
	mov r0, #0x8000
	bl sub_0302DD98
	mov r0, #0x40
	mov r1, #0
	bl sub_0302DD78
	mov r0, #0x100
	mov r1, r0
	bl sub_0302DD78
	bl sub_0302D4F0
	mov r4, r0
	ldr r1, _02025710 ; =0x027F652C
	mov r0, #0x80
	bl sub_0302AFAC
	mov r0, #0x80
	bl sub_0302B0E0
	mov r0, r4
	bl sub_0302D504
_020256E4:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020256F0: .word 0x027F8E28
_020256F4: .word 0x027FFDE8
_020256F8: .word 0x027F5F24
_020256FC: .word 0x027F8E2C
_02025700: .word 0x027F8E4C
_02025704: .word 0x027F8E5C
_02025708: .word 0x027F60A8
_0202570C: .word 0x027F9000
_02025710: .word 0x027F652C
	arm_func_end sub_020254B4
_02025714:
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0x52, 0xE3, 0x48, 0x00, 0x00, 0x1A
	.byte 0x7F, 0x0C, 0x01, 0xE2, 0x00, 0x04, 0xA0, 0xE1, 0x20, 0x48, 0xA0, 0xE1, 0x29, 0x00, 0x54, 0xE3
	.byte 0x04, 0xF1, 0x8F, 0x90, 0x3F, 0x00, 0x00, 0xEA, 0x28, 0x00, 0x00, 0xEA, 0x27, 0x00, 0x00, 0xEA
	.byte 0x3C, 0x00, 0x00, 0xEA, 0x3B, 0x00, 0x00, 0xEA, 0x3A, 0x00, 0x00, 0xEA, 0x39, 0x00, 0x00, 0xEA
	.byte 0x38, 0x00, 0x00, 0xEA, 0x37, 0x00, 0x00, 0xEA, 0x36, 0x00, 0x00, 0xEA, 0x35, 0x00, 0x00, 0xEA
	.byte 0x34, 0x00, 0x00, 0xEA, 0x33, 0x00, 0x00, 0xEA, 0x32, 0x00, 0x00, 0xEA, 0x31, 0x00, 0x00, 0xEA
	.byte 0x30, 0x00, 0x00, 0xEA, 0x2F, 0x00, 0x00, 0xEA, 0x18, 0x00, 0x00, 0xEA, 0x17, 0x00, 0x00, 0xEA
	.byte 0x16, 0x00, 0x00, 0xEA, 0x15, 0x00, 0x00, 0xEA, 0x14, 0x00, 0x00, 0xEA, 0x13, 0x00, 0x00, 0xEA
	.byte 0x12, 0x00, 0x00, 0xEA, 0x11, 0x00, 0x00, 0xEA, 0x10, 0x00, 0x00, 0xEA, 0x0F, 0x00, 0x00, 0xEA
	.byte 0x24, 0x00, 0x00, 0xEA, 0x23, 0x00, 0x00, 0xEA, 0x22, 0x00, 0x00, 0xEA, 0x21, 0x00, 0x00, 0xEA
	.byte 0x20, 0x00, 0x00, 0xEA, 0x1F, 0x00, 0x00, 0xEA, 0x1E, 0x00, 0x00, 0xEA, 0x1D, 0x00, 0x00, 0xEA
	.byte 0x1C, 0x00, 0x00, 0xEA, 0x05, 0x00, 0x00, 0xEA, 0x04, 0x00, 0x00, 0xEA, 0x03, 0x00, 0x00, 0xEA
	.byte 0x02, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x00, 0xEA, 0x00, 0x00, 0x00, 0xEA, 0xFF, 0xFF, 0xFF, 0xEA
	.byte 0x64, 0x00, 0x9F, 0xE5, 0xD8, 0x11, 0x90, 0xE5, 0x00, 0x00, 0x51, 0xE3, 0x03, 0x00, 0x00, 0x0A
	.byte 0x04, 0x00, 0xA0, 0xE1, 0x03, 0x10, 0xA0, 0xE3, 0x16, 0x00, 0x00, 0xEB, 0x10, 0x00, 0x00, 0xEA
	.byte 0x48, 0x30, 0x9F, 0xE5, 0x01, 0x10, 0xA0, 0xE3, 0xD8, 0x11, 0x80, 0xE5, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x3C, 0x00, 0x9F, 0xE5, 0x01, 0x20, 0xA0, 0xE1, 0xBC, 0x4D, 0xC3, 0xE1, 0xA8, 0x19, 0x40, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x06, 0x00, 0x00, 0x1A, 0x04, 0x00, 0xA0, 0xE1, 0x04, 0x10, 0xA0, 0xE3
	.byte 0x08, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEA, 0x04, 0x00, 0xA0, 0xE1, 0x01, 0x10, 0xA0, 0xE3
	.byte 0x04, 0x00, 0x00, 0xEB, 0x10, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x28, 0x8E, 0x7F, 0x02
	.byte 0x28, 0x8F, 0x7F, 0x02, 0x2C, 0x8E, 0x7F, 0x02

	arm_func_start sub_02025858
sub_02025858: ; 0x02025858
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, r0, lsl #8
	and r0, r0, #0x7f00
	orr r2, r0, #0x8000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #5
	mov r4, #0
_02025878:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_0302DC00
	cmp r0, #0
	blt _02025878
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_02025858

	arm_func_start sub_02025898
sub_02025898: ; 0x02025898
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr sb, _02025D0C ; =0x027FFDE8
	mov r8, #0
	ldr r4, _02025D10 ; =0x027F8E28
	mov r7, r8
	mov r6, r8
	mov r5, r8
	mov sl, r8
	mov fp, r8
_020258BC:
	ldr r0, _02025D14 ; =0x027F8E2C
	add r1, sp, #0
	mov r2, #1
	bl sub_0302BF50
	ldr r0, _02025D18 ; =0x027F8F28
	ldrh r0, [r0, #0xdc]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _02025CF8
_020258E0: ; jump table
	b _02025988 ; case 0
	b _020259A0 ; case 1
	b _02025CF8 ; case 2
	b _02025CF8 ; case 3
	b _02025CF8 ; case 4
	b _02025CF8 ; case 5
	b _02025CF8 ; case 6
	b _02025CF8 ; case 7
	b _02025CF8 ; case 8
	b _02025CF8 ; case 9
	b _02025CF8 ; case 10
	b _02025CF8 ; case 11
	b _02025CF8 ; case 12
	b _02025CF8 ; case 13
	b _02025CF8 ; case 14
	b _02025CF8 ; case 15
	b _020259C8 ; case 16
	b _020259E8 ; case 17
	b _02025A08 ; case 18
	b _02025A28 ; case 19
	b _02025A64 ; case 20
	b _02025AA0 ; case 21
	b _02025ADC ; case 22
	b _02025AFC ; case 23
	b _02025B1C ; case 24
	b _02025B3C ; case 25
	b _02025CF8 ; case 26
	b _02025CF8 ; case 27
	b _02025CF8 ; case 28
	b _02025CF8 ; case 29
	b _02025CF8 ; case 30
	b _02025CF8 ; case 31
	b _02025B5C ; case 32
	b _02025B7C ; case 33
	b _02025BA4 ; case 34
	b _02025BC4 ; case 35
	b _02025C00 ; case 36
	b _02025C3C ; case 37
	b _02025C78 ; case 38
	b _02025C98 ; case 39
	b _02025CB8 ; case 40
	b _02025CD8 ; case 41
_02025988:
	bl sub_02025E1C
	mov r0, #0
	mov r1, r0
	str r0, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_020259A0:
	ldrh r0, [sb]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	bl sub_02025E60
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #1
	mov r1, #0
	bl sub_02025858
	b _020258BC
_020259C8:
	mov r0, sb
	bl sub_02025F84
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x10
	mov r1, #0
	bl sub_02025858
	b _020258BC
_020259E8:
	mov r0, sb
	bl sub_02025FE8
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x11
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025A08:
	add r0, sb, #4
	bl sub_02026014
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x12
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025A28:
	add r0, sb, #4
	bl sub_02026078
	cmp r0, #0
	bne _02025A4C
	mov r0, #0x13
	mov r1, #2
	str r8, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_02025A4C:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x13
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025A64:
	add r0, sb, #4
	bl sub_02026154
	cmp r0, #0
	bne _02025A88
	mov r0, #0x14
	mov r1, #2
	str r7, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_02025A88:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x14
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025AA0:
	add r0, sb, #4
	bl sub_02026228
	cmp r0, #0
	bne _02025AC4
	mov r0, #0x15
	mov r1, #2
	str r6, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_02025AC4:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x15
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025ADC:
	mov r0, sb
	bl sub_020262F4
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x16
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025AFC:
	add r0, sb, #2
	bl sub_02026358
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x17
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025B1C:
	add r0, sb, #4
	bl sub_020263BC
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x18
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025B3C:
	add r0, sb, #4
	bl sub_02026420
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x19
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025B5C:
	mov r0, sb
	bl sub_02025FB0
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x20
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025B7C:
	add r0, sb, #4
	bl sub_02026014
	mov r0, sb
	bl sub_02025FB0
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x21
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025BA4:
	add r0, sb, #4
	bl sub_02026040
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x22
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025BC4:
	add r0, sb, #4
	bl sub_020260E0
	cmp r0, #0
	bne _02025BE8
	mov r0, #0x23
	mov r1, #2
	str r5, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_02025BE8:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x23
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025C00:
	add r0, sb, #4
	bl sub_020261B8
	cmp r0, #0
	bne _02025C24
	mov r0, #0x24
	mov r1, #2
	str sl, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_02025C24:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x24
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025C3C:
	add r0, sb, #4
	bl sub_02026288
	cmp r0, #0
	bne _02025C60
	mov r0, #0x25
	mov r1, #2
	str fp, [r4, #0x1d8]
	bl sub_02025858
	b _020258BC
_02025C60:
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x25
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025C78:
	mov r0, sb
	bl sub_02026320
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x26
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025C98:
	add r0, sb, #2
	bl sub_02026384
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x27
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025CB8:
	add r0, sb, #4
	bl sub_020263E8
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x28
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025CD8:
	add r0, sb, #4
	bl sub_0202644C
	mov r0, #0
	str r0, [r4, #0x1d8]
	mov r0, #0x29
	mov r1, #0
	bl sub_02025858
	b _020258BC
_02025CF8:
	mov r1, #0
	str r1, [r4, #0x1d8]
	mov r1, #1
	bl sub_02025858
	b _020258BC
	.align 2, 0
_02025D0C: .word 0x027FFDE8
_02025D10: .word 0x027F8E28
_02025D14: .word 0x027F8E2C
_02025D18: .word 0x027F8F28
	arm_func_end sub_02025898

	arm_func_start sub_02025D1C
sub_02025D1C: ; 0x02025D1C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r0, sp, #2
	bl sub_020262F4
	ldrh r0, [sp, #2]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _02025D48
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _02025DA0
_02025D48:
	add r0, sp, #0
	bl sub_02026358
	ldrh r0, [sp, #2]
	mov r4, #0
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #1
	bicne r0, r0, #0xf
	strneh r0, [sp]
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #2
	bicne r0, r0, #0x40
	strneh r0, [sp]
	add r0, sp, #0
	bl sub_02026384
	mov r1, r4
	mov r0, #0x30
	bl sub_02025858
_02025DA0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_02025D1C

	arm_func_start sub_02025DAC
sub_02025DAC: ; 0x02025DAC
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r2, ip
	b _02025DD8
_02025DBC:
	mov r1, r2, lsl #2
	mov r1, r0, lsr r1
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	bhs _02025E14
	add r2, r2, #1
_02025DD8:
	cmp r2, #8
	blt _02025DBC
	mov r4, #0
	mov lr, #1
	mov r2, #0xa
_02025DEC:
	mov r1, r4, lsl #2
	mov r1, r0, lsr r1
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r4, r4, #1
	mov lr, r1
	cmp r4, #8
	blt _02025DEC
	mov r0, ip
_02025E14:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02025DAC

	arm_func_start sub_02025E1C
sub_02025E1C: ; 0x02025E1C
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl sub_0302DD98
	ldrh r0, [sp]
	bic r0, r0, #1
	orr r0, r0, #1
	strh r0, [sp]
	bl sub_02026700
	mov r0, #6
	mov r1, #0
	bl sub_02026774
	add r0, sp, #0
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_02025E1C

	arm_func_start sub_02025E60
sub_02025E60: ; 0x02025E60
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	and r4, r4, #1
	cmp r4, #1
	bne _02025F78
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r1, r0, lsl #0x1e
	mov r1, r1, lsr #0x1f
	cmp r1, r4
	beq _02025F78
	bic r1, r0, #2
	mov r0, r4, lsl #0x1f
	orr r1, r1, r0, lsr #30
	mov r0, #0x8000
	strh r1, [sp]
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0
	bl sub_02026774
	add r0, sp, #0
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	mov r0, #0x86
	mov r1, #0x10
	add r2, sp, #4
	mov r3, #3
	bl sub_020266A4
	cmp r4, #0
	add r0, sp, #4
	bne _02025F08
	bl sub_02026484
	b _02025F0C
_02025F08:
	bl sub_02026594
_02025F0C:
	bl sub_02026700
	mov r0, #6
	mov r1, #0x10
	bl sub_02026774
	add r0, sp, #4
	mov r1, #3
	bl sub_020267F4
	bl sub_02026740
	mov r0, #0x86
	mov r1, #0x50
	add r2, sp, #4
	mov r3, #3
	bl sub_020266A4
	cmp r4, #0
	add r0, sp, #4
	bne _02025F54
	bl sub_02026484
	b _02025F58
_02025F54:
	bl sub_02026594
_02025F58:
	bl sub_02026700
	mov r0, #6
	mov r1, #0x50
	bl sub_02026774
	add r0, sp, #4
	mov r1, #3
	bl sub_020267F4
	bl sub_02026740
_02025F78:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02025E60

	arm_func_start sub_02025F84
sub_02025F84: ; 0x02025F84
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #7
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02025F84

	arm_func_start sub_02025FB0
sub_02025FB0: ; 0x02025FB0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0x20
	bl sub_02026774
	mov r0, r4
	mov r1, #7
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02025FB0

	arm_func_start sub_02025FE8
sub_02025FE8: ; 0x02025FE8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #4
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02025FE8

	arm_func_start sub_02026014
sub_02026014: ; 0x02026014
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x60
	mov r3, #3
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02026014

	arm_func_start sub_02026040
sub_02026040: ; 0x02026040
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0x60
	bl sub_02026774
	mov r0, r4
	mov r1, #3
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02026040

	arm_func_start sub_02026078
sub_02026078: ; 0x02026078
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _020260D4
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #1
	bl sub_020266A4
	mov r0, #1
_020260D4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_02026078

	arm_func_start sub_020260E0
sub_020260E0: ; 0x020260E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _02026148
	bl sub_02026700
	mov r0, #6
	mov r1, #0x10
	bl sub_02026774
	mov r0, r4
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	mov r0, #1
_02026148:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_020260E0

	arm_func_start sub_02026154
sub_02026154: ; 0x02026154
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _020261AC
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #3
	bl sub_020266A4
	mov r0, #1
_020261AC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_02026154

	arm_func_start sub_020261B8
sub_020261B8: ; 0x020261B8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _0202621C
	bl sub_02026700
	mov r0, #6
	mov r1, #0x10
	bl sub_02026774
	mov r0, r4
	mov r1, #3
	bl sub_020267F4
	bl sub_02026740
	mov r0, #1
_0202621C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_020261B8

	arm_func_start sub_02026228
sub_02026228: ; 0x02026228
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _0202627C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x50
	mov r3, #3
	bl sub_020266A4
	mov r0, #1
_0202627C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_02026228

	arm_func_start sub_02026288
sub_02026288: ; 0x02026288
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _020262E8
	bl sub_02026700
	mov r0, #6
	mov r1, #0x50
	bl sub_02026774
	mov r0, r4
	mov r1, #3
	bl sub_020267F4
	bl sub_02026740
	mov r0, #1
_020262E8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_02026288

	arm_func_start sub_020262F4
sub_020262F4: ; 0x020262F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_020262F4

	arm_func_start sub_02026320
sub_02026320: ; 0x02026320
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0
	bl sub_02026774
	mov r0, r4
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02026320

	arm_func_start sub_02026358
sub_02026358: ; 0x02026358
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02026358

	arm_func_start sub_02026384
sub_02026384: ; 0x02026384
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0x40
	bl sub_02026774
	mov r0, r4
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02026384

	arm_func_start sub_020263BC
sub_020263BC: ; 0x020263BC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x30
	mov r3, #1
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_020263BC

	arm_func_start sub_020263E8
sub_020263E8: ; 0x020263E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0x30
	bl sub_02026774
	mov r0, r4
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_020263E8

	arm_func_start sub_02026420
sub_02026420: ; 0x02026420
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x70
	mov r3, #1
	bl sub_020266A4
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_02026420

	arm_func_start sub_0202644C
sub_0202644C: ; 0x0202644C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_0302DD98
	bl sub_02026700
	mov r0, #6
	mov r1, #0x70
	bl sub_02026774
	mov r0, r4
	mov r1, #1
	bl sub_020267F4
	bl sub_02026740
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0202644C

	arm_func_start sub_02026484
sub_02026484: ; 0x02026484
	ldr r1, [r0]
	mov r2, r1, lsl #0x12
	mov r2, r2, lsr #0x1a
	cmp r2, #0x23
	addls pc, pc, r2, lsl #2
	b _02026580
_0202649C: ; jump table
	b _0202652C ; case 0
	b _0202652C ; case 1
	b _0202652C ; case 2
	b _0202652C ; case 3
	b _0202652C ; case 4
	b _0202652C ; case 5
	b _0202652C ; case 6
	b _0202652C ; case 7
	b _0202652C ; case 8
	b _0202652C ; case 9
	b _02026580 ; case 10
	b _02026580 ; case 11
	b _02026580 ; case 12
	b _02026580 ; case 13
	b _02026580 ; case 14
	b _02026580 ; case 15
	b _0202652C ; case 16
	b _0202652C ; case 17
	b _02026538 ; case 18
	b _02026538 ; case 19
	b _02026538 ; case 20
	b _02026538 ; case 21
	b _02026538 ; case 22
	b _02026538 ; case 23
	b _02026538 ; case 24
	b _02026538 ; case 25
	b _02026580 ; case 26
	b _02026580 ; case 27
	b _02026580 ; case 28
	b _02026580 ; case 29
	b _02026580 ; case 30
	b _02026580 ; case 31
	b _0202655C ; case 32
	b _0202655C ; case 33
	b _02026538 ; case 34
	b _02026538 ; case 35
_0202652C:
	bic r1, r1, #0x4000
	str r1, [r0]
	bx lr
_02026538:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0202655C:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_02026580:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end sub_02026484

	arm_func_start sub_02026594
sub_02026594: ; 0x02026594
	ldr r2, [r0]
	mov r1, r2, lsl #0x12
	mov r3, r1, lsr #0x1a
	cmp r3, #0x23
	addls pc, pc, r3, lsl #2
	b _02026690
_020265AC: ; jump table
	b _0202663C ; case 0
	b _0202663C ; case 1
	b _0202663C ; case 2
	b _0202663C ; case 3
	b _0202663C ; case 4
	b _0202663C ; case 5
	b _0202663C ; case 6
	b _0202663C ; case 7
	b _02026660 ; case 8
	b _02026660 ; case 9
	b _02026690 ; case 10
	b _02026690 ; case 11
	b _02026690 ; case 12
	b _02026690 ; case 13
	b _02026690 ; case 14
	b _02026690 ; case 15
	b _0202663C ; case 16
	b _0202663C ; case 17
	b _02026684 ; case 18
	b _02026684 ; case 19
	b _02026684 ; case 20
	b _02026684 ; case 21
	b _02026684 ; case 22
	b _02026684 ; case 23
	b _02026684 ; case 24
	b _02026684 ; case 25
	b _02026690 ; case 26
	b _02026690 ; case 27
	b _02026690 ; case 28
	b _02026690 ; case 29
	b _02026690 ; case 30
	b _02026690 ; case 31
	b _02026684 ; case 32
	b _02026684 ; case 33
	b _02026684 ; case 34
	b _02026684 ; case 35
_0202663C:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_02026660:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_02026684:
	orr r1, r2, #0x4000
	str r1, [r0]
	bx lr
_02026690:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end sub_02026594

	arm_func_start sub_020266A4
sub_020266A4: ; 0x020266A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_02026700
	mov r0, r7
	mov r1, r6
	bl sub_02026774
	cmp r7, #6
	beq _020266E8
	cmp r7, #0x86
	bne _020266F4
	mov r0, r5
	mov r1, r4
	bl sub_020268AC
	b _020266F4
_020266E8:
	mov r0, r5
	mov r1, r4
	bl sub_020267F4
_020266F4:
	bl sub_02026740
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020266A4

	arm_func_start sub_02026700
sub_02026700: ; 0x02026700
	mov ip, #0x4000000
	add ip, ip, #0x138
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x72
	strh r0, [ip]
	mov r3, #2
_0202671C:
	subs r3, r3, #1
	bne _0202671C
	bic r0, r0, #4
	orr r0, r0, #4
	strh r0, [ip]
	mov r3, #2
_02026734:
	subs r3, r3, #1
	bne _02026734
	bx lr
	arm_func_end sub_02026700

	arm_func_start sub_02026740
sub_02026740: ; 0x02026740
	mov ip, #0x4000000
	add ip, ip, #0x138
	mov r3, #2
_0202674C:
	subs r3, r3, #1
	bne _0202674C
	ldrh r0, [ip]
	bic r0, r0, #4
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #2
_02026768:
	subs r3, r3, #1
	bne _02026768
	bx lr
	arm_func_end sub_02026740

	arm_func_start sub_02026774
sub_02026774: ; 0x02026774
	mov ip, #0x4000000
	add ip, ip, #0x138
	orr r1, r0, r1
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_02026790:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	bne _020267A8
	b _020267AC
_020267A8:
	mov r3, #1
_020267AC:
	beq _020267B4
	b _020267B8
_020267B4:
	mov r3, #0
_020267B8:
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_020267C4:
	subs r3, r3, #1
	bne _020267C4
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_020267DC:
	subs r3, r3, #1
	bne _020267DC
	add r2, r2, #1
	cmp r2, #8
	bne _02026790
	bx lr
	arm_func_end sub_02026774

	arm_func_start sub_020267F4
sub_020267F4: ; 0x020267F4
	mov ip, #0x4000000
	add ip, ip, #0x138
_020267FC:
	stmdb sp!, {r0, r1}
	tst r0, #1
	beq _0202680C
	b _02026810
_0202680C:
	ldrh r1, [r0]
_02026810:
	bne _02026818
	b _0202681C
_02026818:
	ldrh r1, [r0, #-1]
_0202681C:
	bne _02026824
	b _02026828
_02026824:
	mov r1, r1, lsr #8
_02026828:
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_02026838:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	bne _02026850
	b _02026854
_02026850:
	mov r3, #1
_02026854:
	beq _0202685C
	b _02026860
_0202685C:
	mov r3, #0
_02026860:
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_0202686C:
	subs r3, r3, #1
	bne _0202686C
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_02026884:
	subs r3, r3, #1
	bne _02026884
	add r2, r2, #1
	cmp r2, #8
	bne _02026838
	ldmia sp!, {r0, r1}
	add r0, r0, #1
	subs r1, r1, #1
	bne _020267FC
	bx lr
	arm_func_end sub_020267F4

	arm_func_start sub_020268AC
sub_020268AC: ; 0x020268AC
	mov ip, #0x4000000
	add ip, ip, #0x138
_020268B4:
	stmdb sp!, {r0, r1}
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x64
	mov r2, #0
	mov r1, #0
_020268CC:
	bic r0, r0, #3
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #9
_020268DC:
	subs r3, r3, #1
	bne _020268DC
	ldrh r0, [ip]
	and r3, r0, #1
	cmp r3, #1
	beq _020268F8
	b _020268FC
_020268F8:
	mov r3, #0x80
_020268FC:
	bne _02026904
	b _02026908
_02026904:
	mov r3, #0
_02026908:
	orr r2, r3, r2, lsr #1
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_0202691C:
	subs r3, r3, #1
	bne _0202691C
	add r1, r1, #1
	cmp r1, #8
	bne _020268CC
	ldmia sp!, {r0, r1}
	tst r0, #1
	beq _02026954
	ldrh r3, [r0, #-1]
	bic r3, r3, #0xff00
	mov r2, r2, lsl #8
	orr r3, r2, r3
	strh r3, [r0, #-1]
	b _02026964
_02026954:
	ldrh r3, [r0]
	bic r3, r3, #0xff
	orr r3, r3, r2
	strh r3, [r0]
_02026964:
	add r0, r0, #1
	subs r1, r1, #1
	bne _020268B4
	bx lr
	arm_func_end sub_020268AC
	; 0x02026974
