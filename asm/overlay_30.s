	.include "asm/macros.inc"
	.include "overlay_30.inc"

	.text

    .public ov30_02384B24

	arm_func_start ov30_02384E28
ov30_02384E28: ; 0x02384E28
#ifdef JAPAN
#define OV30_02384E28_OFFSET -4
#define OV30_02384E28_OFFSET_2 -1
#else
#define OV30_02384E28_OFFSET 0
#define OV30_02384E28_OFFSET_2 0
#endif
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x258 + OV30_02384E28_OFFSET
	mov sl, r0
	mov sb, r1
	mov r8, r2
	add r0, sp, #0x18
	mov r1, #0
	mov r2, #0x240 + OV30_02384E28_OFFSET
	bl memset
	mov r0, sl
	bl ov30_02385EF4
	mov r0, sl
	bl ov30_02385EF4
	mov r0, sl
	bl ov30_02385EF4
	mov fp, r0
	mov r0, sl
	add r1, sp, #0x14
	bl ov30_02385F7C
	mov r0, sl
	bl ov30_02385F54
	mov r5, r0
	mov r0, sl
	bl ov30_02385EC4
	mov r6, r0
	ldr r1, _023859D8 ; =LEADER_PTR
	mov r2, #0
	mov r0, sl
	str r2, [r1]
	bl ov30_02385EC4
	strh r0, [sp, #0x18]
	add r0, sp, #0xe
	mov r1, #0
	mov r2, #2
	bl memset
	mov r0, sl
	add r1, sp, #0xe
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r2, [sp, #0xe]
	add r0, sp, #0xc
	mov r1, #0
	strh r2, [sp, #0x1c]
	mov r2, #2
	bl memset
	mov r0, sl
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r1, [sp, #0xc]
	mov r0, sl
	strh r1, [sp, #0x1a]
	bl ov30_02385F54
	strb r0, [sp, #0x1e]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x1f]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x20]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x21]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x22]
	mov r0, sl
	bl ov30_02385EF4
	strh r0, [sp, #0x24]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x60]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x61]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x26]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x28]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x2a]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x2e]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x2c]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x32]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x33]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x34]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x35]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0x38]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x3c]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x3e]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x40]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x42]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x44]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x46]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0x48]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x4c]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x50]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x54]
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x58]
	mov r0, #0
	strh r0, [sp, #0x62]
	mov r0, sl
	add r1, sp, #0x64
	mov r2, #1
	bl ov30_02385CA4
	mov r0, #7
	strb r0, [sp, #0x65]
	mov r0, sl
	add r1, sp, #0x72
	bl ov30_02385F7C
	add r0, sp, #8
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #8
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #8]
	add r0, sp, #7
	mov r1, #0
	strb r2, [sp, #0x76]
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #7
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #7]
	add r0, sp, #6
	mov r1, #0
	strb r2, [sp, #0x77]
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #6
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #6]
	add r0, sp, #5
	mov r1, #0
	strb r2, [sp, #0x78]
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #5
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #5]
	mov r0, sl
	add r1, sp, #0x7a
	strb r2, [sp, #0x79]
	bl ov30_02384B24
	add r0, sp, #0xa
	mov r1, #0
	mov r2, #2
	bl memset
	add r1, sp, #0xa
	mov r0, sl
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r0, [sp, #0xa]
	mov r4, #0
	add r7, sp, #0x82
	strh r0, [sp, #0x80]
_02385158:
	mov r0, sl
	add r1, r7, r4, lsl #2
	bl ov30_02385F7C
	add r4, r4, #1
	cmp r4, #4
	blt _02385158
	add r1, sp, #0x94
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x95]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x96]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x97]
	mov r0, sl
	bl ov30_02385EC4
	strh r0, [sp, #0x98]
	mov r0, #0
	str r0, [sp, #0x9c]
	str r0, [sp, #0xa0]
	mov r0, sl
	add r1, sp, #0xa4
	bl ov30_02385F7C
	mov r0, sl
	add r1, sp, #0xa8
	mov r2, #0x45
	bl ov30_02385CA4
	mov r0, sl
	add r1, sp, #0xb4
	mov r2, #0x45
	bl ov30_02385CA4
	add r0, sp, #4
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #4
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp, #4]
	mov r0, sl
	strb r1, [sp, #0xc0]
	bl ov30_02385EDC
	strh r0, [sp, #0x5c]
	add r0, sp, #3
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #3
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp, #3]
	mov r0, sl
	strb r1, [sp, #0x5e]
	bl ov30_02385F0C
	str r0, [sp, #0xc8]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xcc]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xd0]
	mov r0, sl
	add r1, sp, #0xd5
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xd6]
	add r1, sp, #0xd7
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xd8]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xd9]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xda]
	mov r0, sl
	add r1, sp, #0xdc
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xe4]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xe5]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xe0]
	mov r0, sl
	add r1, sp, #0xe8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xe9]
	mov r0, sl
	add r1, sp, #0xea
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xeb]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xec]
	mov r0, sl
	add r1, sp, #0xed
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xee]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xef]
	mov r0, sl
	add r1, sp, #0xf0
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0xf1]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0xf2]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xf3]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0xf4]
	mov r0, sl
	add r1, sp, #0xf8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0xfc]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x100]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x101]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x102]
	mov r0, sl
	add r1, sp, #0x104
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x105]
	mov r0, sl
	add r1, r1, #6
	mov r2, #1
	bl ov30_02385CA4
	add r1, sp, #0x100
	mov r0, sl
	add r1, r1, #7
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x108]
	mov r0, sl
	add r1, r1, #9
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10a]
	mov r0, sl
	add r1, r1, #0xb
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10c]
	mov r0, sl
	add r1, r1, #0xd
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x10e]
	add r1, r1, #0xf
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x110]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x111]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x112]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x113]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x114]
	mov r0, sl
	bl ov30_02385F54
#ifndef JAPAN
	strb r0, [sp, #0x11b]
	mov r0, sl
	bl ov30_02385F54
#endif
	strb r0, [sp, #0x115]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x120 + OV30_02384E28_OFFSET_2]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x116]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x117]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x118]
	mov r0, sl
	bl ov30_02385EF4
#ifdef JAPAN
	strb r0, [sp, #0x11b]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11c]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x120]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, sl
	bl ov30_02385EF4
#else
	strb r0, [sp, #0x11c]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x11d]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x121]
	mov r0, sl
	bl ov30_02385EF4
#endif
	strb r0, [sp, #0x11e]
	mov r0, sl
	bl ov30_02385EF4
#ifndef JAPAN
	strb r0, [sp, #0x11f]
	mov r0, sl
	bl ov30_02385EF4
#endif
	strb r0, [sp, #0x122 + OV30_02384E28_OFFSET_2]
	add r0, sp, #2
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #2
	mov r2, #1
	bl ov30_02385CA4
	ldrb r3, [sp, #2]
	add r0, sp, #1
	mov r1, #0
	mov r2, #1
	strb r3, [sp, #0x123 + OV30_02384E28_OFFSET_2]
	bl memset
	add r1, sp, #1
	mov r0, sl
	mov r2, #1
	bl ov30_02385CA4
	ldrb r2, [sp, #1]
	add r0, sp, #0x10
	mov r1, #0
	strb r2, [sp, #0x124 + OV30_02384E28_OFFSET_2]
	mov r2, #4
	bl memset
	mov r0, sl
	add r1, sp, #0x10
	mov r2, #4
	bl ov30_02385CA4
	ldr r1, [sp, #0x10]
	mov r0, sl
	str r1, [sp, #0x128 + OV30_02384E28_OFFSET]
	add r1, sp, #0x12c + OV30_02384E28_OFFSET
	mov r2, #5
	bl ov30_02386074
	add r1, sp, #0x100
	mov r0, sl
	add r1, r1, #0x31 + OV30_02384E28_OFFSET
	mov r2, #5
	bl ov30_02386074
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x136 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x137 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	str r0, [sp, #0x138 + OV30_02384E28_OFFSET]
	mov r7, #0
	add r4, sp, #0x18
_02385630:
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x124 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r1, r1, #0x100
	strh r0, [r1, #0x26 + OV30_02384E28_OFFSET]
	add r1, sp, #0x13c + OV30_02384E28_OFFSET
	add r1, r1, r7, lsl #3
	mov r0, sl
	add r1, r1, #4
	mov r2, #2
	bl ov30_02385CA4
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	strb r0, [r1, #0x12a + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	add r1, r4, r7, lsl #3
	add r7, r7, #1
	strb r0, [r1, #0x12b + OV30_02384E28_OFFSET]
	cmp r7, #4
	blt _02385630
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x15c + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x5e + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x60 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x62 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x64 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x166 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x167 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x169 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x168 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16a + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16b + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16c + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16d + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x16e + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x70 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0x72 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x174 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x175 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x176 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x177 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F54
	strb r0, [sp, #0x178 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x18f + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x190 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x191 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x192 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x193 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	add r1, sp, #0x100
	strb r0, [sp, #0x194 + OV30_02384E28_OFFSET]
	mov r0, sl
	add r1, r1, #0x96 + OV30_02384E28_OFFSET
	bl ov30_02385F7C
	mov r0, sl
	bl ov30_02385F3C
	str r0, [sp, #0x1a0 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xaa + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F24
	str r0, [sp, #0x1a4 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EC4
	add r1, sp, #0x100
	strh r0, [r1, #0xa8 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x28 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x200
	strh r0, [r1, #0x2a + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385F0C
	str r0, [sp, #0x22c + OV30_02384E28_OFFSET]
	add r0, sp, #0
	mov r1, #0
	mov r2, #1
	bl memset
	mov r0, sl
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r1, [sp]
	mov r0, sl
	strb r1, [sp, #0xd4]
	bl ov30_02385EF4
	strb r0, [sp, #0x17e + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x17f + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	add r1, sp, #0x100
	strh r0, [r1, #0x80 + OV30_02384E28_OFFSET]
	mov r0, sl
	bl ov30_02385EDC
	strh r0, [sp, #0xc4]
	mov r0, sl
	bl ov30_02385EF4
	strb r0, [sp, #0x182 + OV30_02384E28_OFFSET]
	mov r4, #0
	add r7, sp, #0x18
_023858D8:
	mov r0, sl
	bl ov30_02385EF4
	add r1, r7, r4
	add r4, r4, #1
	strb r0, [r1, #0x16b + OV30_02384E28_OFFSET]
	cmp r4, #5
	blt _023858D8
	ldr r0, _023859D8 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	cmp fp, #0
	beq _023859D0
	cmp sb, #0
	beq _02385924
	ldrsh r0, [sp, #0x1a]
	ldrsh r1, [sp, #0x1c]
	mov r2, r8
	bl ov30_023859DC
	b _02385934
_02385924:
	ldrsh r0, [sp, #0x1a]
	ldrsh r1, [sp, #0x1c]
	mov r2, r8
	bl ov30_02385B10
_02385934:
	mov r7, r0
	cmp r7, #0
	beq _023859D0
	ldrsh r0, [sp, #0x14]
	ldrsh r1, [sp, #0x16]
	ldr r4, [r7, #0xb4]
	bl GetTileSafe
	ldrh r1, [sp, #0x14]
	add sl, sp, #0x18
	mov sb, r4
	strh r1, [r7, #8]
	ldrh r1, [sp, #0x16]
	mov r8, #0x24 + OV30_02384E28_OFFSET_2
	strh r1, [r7, #0xa]
	ldrh r1, [sp, #0x14]
	strh r1, [r7, #4]
	ldrh r1, [sp, #0x16]
	strh r1, [r7, #6]
	str r7, [r0, #0xc]
	strb r5, [r7, #0x20]
	strh r6, [r7, #0x26]
_02385988:
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _02385988
#ifdef JAPAN
	ldmia sl, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
#endif
	ldr r0, _023859D8 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _023859BC
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	bl ov29_02338F24
_023859BC:
	mov r0, r7
	bl UpdateIqSkillsWrapper
	mov r0, r7
	mov r1, #0
	bl UpdateEntityPixelPos
_023859D0:
	add sp, sp, #0x258 + OV30_02384E28_OFFSET
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_023859D8: .word LEADER_PTR
	arm_func_end ov30_02384E28

	arm_func_start ov30_023859DC
ov30_023859DC: ; 0x023859DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r0, #1
	mov r7, r2
	bl ov29_022DEA10
	mov r5, r0
	mov r0, r8
	bl DungeonGetSpriteIndex
	mov r4, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	mov r3, r4
	str r5, [sp]
	bl ov29_022E1C84
	cmp r0, #0
	moveq r0, #0
	beq _02385B04
	ldr r2, _02385B0C ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r2]
#ifdef JAPAN
	mov r3, #0x23c
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xa84]
#else
	add r3, r7, r7, lsl #3
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
#endif
	mov r0, #0
	str r1, [r6]
	strb r7, [r6, #0x24]
	ldr r2, [r2]
#ifdef JAPAN
	mov ip, #7
	add r2, r2, #0x3f4
	add r2, r2, #0x400
	mla r2, r7, r3, r2
#else
	mov r7, #7
	add r2, r2, #0x3f4
	add r2, r2, #0x400
	add r2, r2, r3, lsl #6
#endif
	str r2, [r6, #0xb4]
	strh sb, [r2, #2]
	ldr r3, [r6, #0xb4]
	mov r2, #0xff
	strh r8, [r3, #4]
	ldr r3, [r6, #0xb4]
	strb r0, [r3, #6]
	ldr r3, [r6, #0xb4]
	strb r0, [r3, #8]
	strh r4, [r6, #0xa8]
	ldr r3, [sp, #8]
	add r3, r3, #0x1a
	strh r3, [r6, #0xac]
#ifdef JAPAN
	strb ip, [r6, #0xae]
#else
	strb r7, [r6, #0xae]
#endif
	strb r0, [r6, #0xb0]
	strb r2, [r6, #0xaf]
	strb r1, [r6, #0xb1]
	strb r1, [r6, #0xb3]
	str r0, [r6, #0x1c]
	bl PopulateActiveMonsterPtrs
	ldr r1, [sp, #8]
	ldr r0, [r6, #0xb4]
#ifdef JAPAN
	strb r1, [r0, #0x176]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x177]
#else
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17b]
#endif
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1AF4
	and r0, r5, #0xff
	strb r5, [r6, #0xaa]
	bl ov29_022DE9F8
	mov r1, #0
	mov r0, r6
	strb r1, [r6, #0x28]
_02385B04:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02385B0C: .word DUNGEON_PTR
	arm_func_end ov30_023859DC

	arm_func_start ov30_02385B10
ov30_02385B10: ; 0x02385B10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r0, #2
	mov r7, r2
	bl ov29_022DEA10
	mov r5, r0
	mov r0, r8
	bl DungeonGetSpriteIndex
	mov r4, r0
	add r0, sp, #8
	add r1, sp, #4
	mov r2, r8
	mov r3, r4
	str r5, [sp]
	bl ov29_022E2018
	cmp r0, #0
	mov r0, #0
	beq _02385C30
	ldr ip, _02385C38 ; =DUNGEON_PTR
	mov r1, #1
	ldr r2, [ip]
#ifdef JAPAN
	mov r3, #0x23c
	add r2, r2, r7, lsl #2
	add r2, r2, #0x12000
	ldr r6, [r2, #0xa94]
#else
	add r3, r7, r7, lsl #3
	add r2, r2, r7, lsl #2
	add r2, r2, #0x12000
	ldr r6, [r2, #0xb38]
#endif
	str r1, [r6]
	strb r7, [r6, #0x24]
	strb r0, [r6, #0x22]
	ldr r2, [ip]
#ifdef JAPAN
	mov ip, #7
	add r2, r2, #0xe4
	add r2, r2, #0x1000
	mla r2, r7, r3, r2
#else
	mov r7, #7
	add r2, r2, #0xf4
	add r2, r2, #0x1000
	add r2, r2, r3, lsl #6
#endif
	str r2, [r6, #0xb4]
	strh sb, [r2, #2]
	ldr r3, [r6, #0xb4]
	mov r2, #0xff
	strh r8, [r3, #4]
	ldr r3, [r6, #0xb4]
	strb r1, [r3, #6]
	strh r4, [r6, #0xa8]
	ldr r3, [sp, #8]
	add r3, r3, #0x62
	strh r3, [r6, #0xac]
#ifdef JAPAN
	strb ip, [r6, #0xae]
#else
	strb r7, [r6, #0xae]
#endif
	strb r0, [r6, #0xb0]
	strb r2, [r6, #0xaf]
	strb r1, [r6, #0xb1]
	strb r1, [r6, #0xb3]
	str r0, [r6, #0x1c]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0xb4]
#ifdef JAPAN
	strb r1, [r0, #0x176]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x177]
#else
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #4]
	ldr r0, [r6, #0xb4]
	strb r1, [r0, #0x17b]
#endif
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1EC4
	bl PopulateActiveMonsterPtrs
	and r0, r5, #0xff
	strb r5, [r6, #0xaa]
	bl ov29_022DE9F8
	mov r1, #0
	mov r0, r6
	strb r1, [r6, #0x28]
_02385C30:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02385C38: .word DUNGEON_PTR
	arm_func_end ov30_02385B10

	arm_func_start ov30_02385C3C
ov30_02385C3C: ; 0x02385C3C
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end ov30_02385C3C

	arm_func_start ov30_02385C54
ov30_02385C54: ; 0x02385C54
	b _02385C80
_02385C58:
	ldrb ip, [r1], #1
	ldr r3, [r0]
	sub r2, r2, #1
	strb ip, [r3]
	ldr r3, [r0]
	add r3, r3, #1
	str r3, [r0]
	ldr r3, [r0, #8]
	add r3, r3, #1
	str r3, [r0, #8]
	arm_func_end ov30_02385C54
_02385C80:
	cmp r2, #0
	bne _02385C58
	bx lr

	arm_func_start ov30_02385C8C
ov30_02385C8C: ; 0x02385C8C
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end ov30_02385C8C

	arm_func_start ov30_02385CA4
ov30_02385CA4: ; 0x02385CA4
	b _02385CD0
_02385CA8:
	ldr r3, [r0]
	sub r2, r2, #1
	ldrb r3, [r3]
	strb r3, [r1], #1
	ldr r3, [r0]
	add r3, r3, #1
	str r3, [r0]
	ldr r3, [r0, #8]
	add r3, r3, #1
	str r3, [r0, #8]
	arm_func_end ov30_02385CA4
_02385CD0:
	cmp r2, #0
	bne _02385CA8
	bx lr

	arm_func_start ov30_02385CDC
ov30_02385CDC: ; 0x02385CDC
	bx lr
	arm_func_end ov30_02385CDC

	arm_func_start ov30_02385CE0
ov30_02385CE0: ; 0x02385CE0
	ldr ip, _02385CEC ; =ov30_02385C54
	mov r2, #8
	bx ip
	.align 2, 0
_02385CEC: .word ov30_02385C54
	arm_func_end ov30_02385CE0

	arm_func_start ov30_02385CF0
ov30_02385CF0: ; 0x02385CF0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	add r1, sp, #0
	mov r2, #8
	bl ov30_02385CA4
	mov r0, #0
	strb r0, [sp, #8]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov30_02385CF0

	arm_func_start ov30_02385D14
ov30_02385D14: ; 0x02385D14
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D14

	arm_func_start ov30_02385D34
ov30_02385D34: ; 0x02385D34
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D34

	arm_func_start ov30_02385D54
ov30_02385D54: ; 0x02385D54
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D54

	arm_func_start ov30_02385D74
ov30_02385D74: ; 0x02385D74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #4
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D74

	arm_func_start ov30_02385D94
ov30_02385D94: ; 0x02385D94
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #4
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385D94

	arm_func_start ov30_02385DB4
ov30_02385DB4: ; 0x02385DB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	mov r2, #4
	bl ov30_02385C54
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov30_02385DB4

	arm_func_start ov30_02385DD4
ov30_02385DD4: ; 0x02385DD4
	stmdb sp!, {r3, lr}
	cmp r1, #0
	movne r3, #0xff
	moveq r3, #0
	add r1, sp, #0
	mov r2, #1
	strb r3, [sp]
	bl ov30_02385C54
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385DD4

	arm_func_start ov30_02385DF8
ov30_02385DF8: ; 0x02385DF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385DF8

	arm_func_start ov30_02385E20
ov30_02385E20: ; 0x02385E20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #2
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #2
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385E20

	arm_func_start ov30_02385E48
ov30_02385E48: ; 0x02385E48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #4
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #8
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385E48

	arm_func_start ov30_02385E90
ov30_02385E90: ; 0x02385E90
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl ov30_02385C54
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385C54
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385E90

	arm_func_start ov30_02385EB8
ov30_02385EB8: ; 0x02385EB8
	ldr ip, _02385EC0 ; =ov30_02385C54
	bx ip
	.align 2, 0
_02385EC0: .word ov30_02385C54
	arm_func_end ov30_02385EB8

	arm_func_start ov30_02385EC4
ov30_02385EC4: ; 0x02385EC4
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #2
	bl ov30_02385CA4
	ldrh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385EC4

	arm_func_start ov30_02385EDC
ov30_02385EDC: ; 0x02385EDC
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #2
	bl ov30_02385CA4
	ldrsh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385EDC

	arm_func_start ov30_02385EF4
ov30_02385EF4: ; 0x02385EF4
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385EF4

	arm_func_start ov30_02385F0C
ov30_02385F0C: ; 0x02385F0C
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F0C

	arm_func_start ov30_02385F24
ov30_02385F24: ; 0x02385F24
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F24

	arm_func_start ov30_02385F3C
ov30_02385F3C: ; 0x02385F3C
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #4
	bl ov30_02385CA4
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F3C

	arm_func_start ov30_02385F54
ov30_02385F54: ; 0x02385F54
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl ov30_02385CA4
	ldrb r0, [sp]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov30_02385F54

	arm_func_start ov30_02385F7C
ov30_02385F7C: ; 0x02385F7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strh r3, [r4]
	mov r5, r0
	mov r2, #1
	strh r3, [r4, #2]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385F7C

	arm_func_start ov30_02385FB0
ov30_02385FB0: ; 0x02385FB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strh r3, [r4]
	mov r5, r0
	mov r2, #2
	strh r3, [r4, #2]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #2
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385FB0

	arm_func_start ov30_02385FE4
ov30_02385FE4: ; 0x02385FE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	str r3, [r4]
	str r3, [r4, #4]
	str r3, [r4, #8]
	mov r5, r0
	mov r2, #1
	str r3, [r4, #0xc]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #4
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #8
	mov r2, #1
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #1
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02385FE4

	arm_func_start ov30_02386040
ov30_02386040: ; 0x02386040
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strh r3, [r4]
	mov r5, r0
	mov r2, #1
	strh r3, [r4, #2]
	bl ov30_02385CA4
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl ov30_02385CA4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov30_02386040

	arm_func_start ov30_02386074
ov30_02386074: ; 0x02386074
	ldr ip, _0238607C ; =ov30_02385CA4
	bx ip
	.align 2, 0
_0238607C: .word ov30_02385CA4
	arm_func_end ov30_02386074
	; 0x02386080

	.rodata
	.global OVERLAY30_JP_STRING_1
OVERLAY30_JP_STRING_1:
	.byte 0x82, 0xDD, 0x82, 0xB3, 0x82, 0xAB, 0x97, 0x6C, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY30_JP_STRING_2
OVERLAY30_JP_STRING_2:
	.byte 0x82, 0xE2, 0x82, 0xE6
	.byte 0x82, 0xA2, 0x97, 0x6C, 0x00, 0x00, 0x00, 0x00

	.data
	.global ov30_023860A0
ov30_023860A0:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov30_023860A4
ov30_023860A4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
