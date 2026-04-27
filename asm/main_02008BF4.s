	.include "asm/macros.inc"
	.include "main_02008BF4.inc"

	.text

	arm_func_start sub_02008BF4
sub_02008BF4: ; 0x02008BF4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02008CC4
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008BF4

	arm_func_start sub_02008C18
sub_02008C18: ; 0x02008C18
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02008D10
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008C18

	arm_func_start LoadFileFromRom
LoadFileFromRom: ; 0x02008C3C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov lr, r0
	mov ip, r1
	mov r3, r2
	add r0, sp, #0
	mov r1, lr
	mov r2, ip
	bl sub_02008D60
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end LoadFileFromRom

	arm_func_start sub_02008C68
sub_02008C68: ; 0x02008C68
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #6
	bl sub_02008980
	mov r0, r5
	str r5, [sp, #0x10]
	bl sub_0200846C
	add r0, sp, #0
	bl sub_02008A84
	ldr r0, [r5, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008C68

	arm_func_start sub_02008CC4
sub_02008CC4: ; 0x02008CC4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #8
	bl sub_02008980
	mvn r1, #0
	add r0, sp, #0
	str r5, [sp, #0xc]
	str r1, [sp, #0x14]
	bl sub_02008A84
	ldr r0, [r6, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008CC4

	arm_func_start sub_02008D10
sub_02008D10: ; 0x02008D10
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #8
	bl sub_02008980
	ldr r1, [r5]
	add r0, sp, #0
	str r1, [sp, #0xc]
	ldr r1, [r5, #4]
	str r1, [sp, #0x14]
	bl sub_02008A84
	ldr r0, [r6, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008D10

	arm_func_start sub_02008D60
sub_02008D60: ; 0x02008D60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x100
	mov r7, r0
	mov r5, r2
	mov r6, r1
	mov r4, r3
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r7
	mov r3, r5
	mov r2, #0xa
	bl sub_02008980
	add r0, sp, #0
	str r6, [sp, #0x10]
	str r4, [sp, #0x24]
	bl sub_02008A84
	ldr r0, [r7, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02008D60

	arm_func_start sub_02008DAC
sub_02008DAC: ; 0x02008DAC
	stmdb sp!, {r4, lr}
	ldr r1, _02008EAC ; =_020AF694
	mov r3, #0xff
	ldr r0, _02008EB0 ; =GXi_DmaId
	mov r2, #3
	strb r3, [r1]
	str r2, [r0]
	bl GX_Init
	ldr r2, _02008EB4 ; =0x04000304
	ldr r0, _02008EB8 ; =0xFFFFFDF1
	ldrh r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0xe
	orr r0, r0, #0x200
	strh r0, [r2]
	bl G3X_Init
	bl G3X_ClearFifo
	bl GX_DispOff
	ldr r1, _02008EBC ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl sub_0200961C
	ldr r0, _02008EC0 ; =0x000001FF
	bl GX_SetBankForLCDC
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl ArrayFill32Fast
	bl GX_DisableBankForLCDC
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0xc0
	ldr r1, _02008EC4 ; =0x07000400
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	ldr r1, _02008EC8 ; =0x05000400
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r1, #0x100
	ldr r0, _02008ECC ; =_022A37A0
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl sub_02009648
	mov r2, #0
	ldr r0, _02008ECC ; =_022A37A0
	mov r1, #0x100
	str r2, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl sub_02008F88
	mov r4, #1
_02008E98:
	mov r0, r4
	bl sub_02082420
	cmp r0, #0
	beq _02008E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02008EAC: .word _020AF694
_02008EB0: .word GXi_DmaId
_02008EB4: .word 0x04000304
_02008EB8: .word 0xFFFFFDF1
_02008EBC: .word 0x04001000
_02008EC0: .word 0x000001FF
_02008EC4: .word 0x07000400
_02008EC8: .word 0x05000400
_02008ECC: .word _022A37A0
	arm_func_end sub_02008DAC

	arm_func_start sub_02008ED0
sub_02008ED0: ; 0x02008ED0
	stmdb sp!, {r4, lr}
	ldr r1, _02008F30 ; =_020AF694
	mov r4, r0
	ldrb r1, [r1]
	cmp r1, r4
	ldmeqia sp!, {r4, pc}
	ldr r0, _02008F34 ; =_02092AB8
	mov r2, r4
	bl Debug_Print0
	cmp r4, #0
	beq _02008F0C
	cmp r4, #0xff
	bne _02008F24
	bl sub_0200961C
	b _02008F24
_02008F0C:
	bl sub_02009648
	bl GX_DispOn
	ldr r1, _02008F38 ; =0x04001000
	ldr r0, [r1]
	orr r0, r0, #0x10000
	str r0, [r1]
_02008F24:
	ldr r0, _02008F30 ; =_020AF694
	strb r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02008F30: .word _020AF694
_02008F34: .word _02092AB8
_02008F38: .word 0x04001000
	arm_func_end sub_02008ED0

	arm_func_start sub_02008F3C
sub_02008F3C: ; 0x02008F3C
	ldr r2, _02008F48 ; =_022A37A4
	str r1, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_02008F48: .word _022A37A4
	arm_func_end sub_02008F3C

	arm_func_start sub_02008F4C
sub_02008F4C: ; 0x02008F4C
	ldr r1, _02008F60 ; =_022A37A4
	ldr r0, [r1, r0, lsl #2]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bx lr
	.align 2, 0
_02008F60: .word _022A37A4
	arm_func_end sub_02008F4C

	arm_func_start sub_02008F64
sub_02008F64: ; 0x02008F64
	ldr r2, _02008F80 ; =_022A37A0
	add r0, r1, r0, lsl #2
	ldr r3, [r2]
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [r2]
	bx lr
	.align 2, 0
_02008F80: .word _022A37A0
	arm_func_end sub_02008F64

	arm_func_start sub_02008F84
sub_02008F84: ; 0x02008F84
	bx lr
	arm_func_end sub_02008F84

	arm_func_start sub_02008F88
sub_02008F88: ; 0x02008F88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #0
	bl sub_02009DCC
	mov r0, #1
	bl sub_02009DCC
	mov r0, #0
	bl sub_02009D48
	mov r0, #1
	bl sub_02009D48
	mov r0, #0
	bl sub_02009F9C
	mov r0, #1
	bl sub_02009F9C
	mov r0, #0
	bl sub_02009E70
	mov r0, #1
	bl sub_02009E70
	ldr r1, _02009080 ; =_022A37A0
	ldr r0, _02009084 ; =0x0400006C
	ldr r2, [r1, #4]
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r1, r1, asr #4
	bl GXx_SetMasterBrightness_
	ldr r1, _02009080 ; =_022A37A0
	ldr r0, _02009088 ; =0x0400106C
	ldr r2, [r1, #8]
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r1, r1, asr #4
	bl GXx_SetMasterBrightness_
	ldr r0, _02009080 ; =_022A37A0
	ldr sb, [r0]
	cmp sb, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sl, #0
	ldr r8, _0200908C ; =_02092A18
	mov fp, #2
	ldr r7, _02009090 ; =_02092A38
	ldr r6, _02009094 ; =_02092A58
	ldr r5, _02009098 ; =_02092A78
	ldr r4, _0200909C ; =_02092A98
	b _02009068
_02009034:
	tst sb, #1
	beq _02009060
	ldr r0, [r8, sl, lsl #2]
	mov r1, fp
	bl MemZero16
	ldr r0, [r7, sl, lsl #2]
	ldr r1, [r6, sl, lsl #2]
	bl MemZero32
	ldr r0, [r5, sl, lsl #2]
	ldr r1, [r4, sl, lsl #2]
	bl MemZero32
_02009060:
	mov sb, sb, asr #1
	add sl, sl, #1
_02009068:
	cmp sb, #0
	bne _02009034
	ldr r0, _02009080 ; =_022A37A0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02009080: .word _022A37A0
_02009084: .word 0x0400006C
_02009088: .word 0x0400106C
_0200908C: .word _02092A18
_02009090: .word _02092A38
_02009094: .word _02092A58
_02009098: .word _02092A78
_0200909C: .word _02092A98
	arm_func_end sub_02008F88

	arm_func_start sub_020090A0
sub_020090A0: ; 0x020090A0
	mov r3, r1, lsr #0x1f
	ldr ip, _020090BC ; =_022A37CC
	rsb r1, r3, r1, lsl #30
	add r3, r3, r1, ror #30
	add r1, ip, r2, lsl #4
	str r3, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020090BC: .word _022A37CC
	arm_func_end sub_020090A0

	arm_func_start sub_020090C0
sub_020090C0: ; 0x020090C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_020090D0:
	ldrb r1, [r6, r4]
	mov r0, r4
	mov r2, r5
	bl sub_020090A0
	add r0, r4, #1
	and r4, r0, #0xff
	cmp r4, #4
	blo _020090D0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020090C0

	arm_func_start sub_020090F4
sub_020090F4: ; 0x020090F4
	ldr r2, _0200911C ; =_022A37CC
	mov ip, #0
	add r3, r2, r1, lsl #4
_02009100:
	ldr r2, [r3, ip, lsl #2]
	add r1, ip, #1
	strb r2, [r0, ip]
	and ip, r1, #0xff
	cmp ip, #4
	blo _02009100
	bx lr
	.align 2, 0
_0200911C: .word _022A37CC
	arm_func_end sub_020090F4

	arm_func_start sub_02009120
sub_02009120: ; 0x02009120
	cmp r0, #0
	bne _02009150
	ldr r2, _02009184 ; =_022A37CC
	mov r3, #1
	str r3, [r2, r0, lsl #4]
	ldr r1, _02009188 ; =_022A37D0
	mov r3, #0
	str r3, [r1, r0, lsl #4]
	ldr r2, _0200918C ; =_022A37D4
	mov r3, #2
	ldr r1, _02009190 ; =_022A37D8
	b _02009174
_02009150:
	ldr r2, _02009184 ; =_022A37CC
	mov r3, #0
	str r3, [r2, r0, lsl #4]
	ldr r1, _02009188 ; =_022A37D0
	mov r3, #1
	str r3, [r1, r0, lsl #4]
	ldr r2, _0200918C ; =_022A37D4
	ldr r1, _02009190 ; =_022A37D8
	mov r3, #2
_02009174:
	str r3, [r2, r0, lsl #4]
	mov r2, #3
	str r2, [r1, r0, lsl #4]
	bx lr
	.align 2, 0
_02009184: .word _022A37CC
_02009188: .word _022A37D0
_0200918C: .word _022A37D4
_02009190: .word _022A37D8
	arm_func_end sub_02009120

	arm_func_start sub_02009194
sub_02009194: ; 0x02009194
	ldr r2, _020091AC ; =_022A37AC
	add r1, r1, r1, lsl #2
	add r1, r2, r1
	mov r2, #1
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_020091AC: .word _022A37AC
	arm_func_end sub_02009194

	arm_func_start sub_020091B0
sub_020091B0: ; 0x020091B0
	ldr r2, _020091C8 ; =_022A37AC
	add r1, r1, r1, lsl #2
	add r1, r2, r1
	mov r2, #0
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_020091C8: .word _022A37AC
	arm_func_end sub_020091B0

	arm_func_start sub_020091CC
sub_020091CC: ; 0x020091CC
	ldr r1, _020091F4 ; =_022A37AC
	add r0, r0, r0, lsl #2
	add r2, r1, r0
	mov r1, #0
	mov r0, r1
_020091E0:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #5
	blt _020091E0
	bx lr
	.align 2, 0
_020091F4: .word _022A37AC
	arm_func_end sub_020091CC

	arm_func_start sub_020091F8
sub_020091F8: ; 0x020091F8
	stmdb sp!, {r3, lr}
	mov ip, #0x1b
	mul lr, r3, ip
	ldr ip, _02009220 ; =_022A37EC
	ldr r3, _02009224 ; =_022A37ED
	strb r0, [ip, lr]
	ldr r0, _02009228 ; =_022A37EE
	strb r1, [r3, lr]
	strb r2, [r0, lr]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009220: .word _022A37EC
_02009224: .word _022A37ED
_02009228: .word _022A37EE
	arm_func_end sub_020091F8

	arm_func_start sub_0200922C
sub_0200922C: ; 0x0200922C
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _02009278 ; =_022A37F3
	smulbb r4, r4, ip
	ldr ip, _0200927C ; =_022A37F4
	strb r0, [lr, r4]
	ldr lr, _02009280 ; =_022A37F5
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _02009284 ; =_022A37F6
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _02009288 ; =_022A37F7
	strb r3, [r0, r4]
	ldr r0, _0200928C ; =_022A37EF
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009278: .word _022A37F3
_0200927C: .word _022A37F4
_02009280: .word _022A37F5
_02009284: .word _022A37F6
_02009288: .word _022A37F7
_0200928C: .word _022A37EF
	arm_func_end sub_0200922C

	arm_func_start sub_02009290
sub_02009290: ; 0x02009290
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _020092DC ; =_022A37F8
	smulbb r4, r4, ip
	ldr ip, _020092E0 ; =_022A37F9
	strb r0, [lr, r4]
	ldr lr, _020092E4 ; =_022A37FA
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _020092E8 ; =_022A37FB
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _020092EC ; =_022A37FC
	strb r3, [r0, r4]
	ldr r0, _020092F0 ; =_022A37F0
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020092DC: .word _022A37F8
_020092E0: .word _022A37F9
_020092E4: .word _022A37FA
_020092E8: .word _022A37FB
_020092EC: .word _022A37FC
_020092F0: .word _022A37F0
	arm_func_end sub_02009290

	arm_func_start sub_020092F4
sub_020092F4: ; 0x020092F4
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _02009340 ; =_022A3802
	smulbb r4, r4, ip
	ldr ip, _02009344 ; =_022A3803
	strb r0, [lr, r4]
	ldr lr, _02009348 ; =_022A3804
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _0200934C ; =_022A3805
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _02009350 ; =_022A3806
	strb r3, [r0, r4]
	ldr r0, _02009354 ; =_022A37EF
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009340: .word _022A3802
_02009344: .word _022A3803
_02009348: .word _022A3804
_0200934C: .word _022A3805
_02009350: .word _022A3806
_02009354: .word _022A37EF
	arm_func_end sub_020092F4

	arm_func_start sub_02009358
sub_02009358: ; 0x02009358
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _020093A4 ; =_022A37FD
	smulbb r4, r4, ip
	ldr ip, _020093A8 ; =_022A37FE
	strb r0, [lr, r4]
	ldr lr, _020093AC ; =_022A37FF
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _020093B0 ; =_022A3800
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _020093B4 ; =_022A3801
	strb r3, [r0, r4]
	ldr r0, _020093B8 ; =_022A37F1
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020093A4: .word _022A37FD
_020093A8: .word _022A37FE
_020093AC: .word _022A37FF
_020093B0: .word _022A3800
_020093B4: .word _022A3801
_020093B8: .word _022A37F1
	arm_func_end sub_02009358

	arm_func_start sub_020093BC
sub_020093BC: ; 0x020093BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r4
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	stmib sp, {r0, r4}
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020093BC

	arm_func_start sub_02009454
sub_02009454: ; 0x02009454
	ldr ip, _02009468 ; =_022A37B6
	mov r3, #0xa
	mla r3, r2, r3, ip
	strb r1, [r0, r3]
	bx lr
	.align 2, 0
_02009468: .word _022A37B6
	arm_func_end sub_02009454

	arm_func_start sub_0200946C
sub_0200946C: ; 0x0200946C
	ldr r3, _02009494 ; =_022A37B6
	mov r2, #0xa
	mla r3, r1, r2, r3
	mov r2, #0
_0200947C:
	ldrb r1, [r0, r2]
	strb r1, [r3, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _0200947C
	bx lr
	.align 2, 0
_02009494: .word _022A37B6
	arm_func_end sub_0200946C

	arm_func_start sub_02009498
sub_02009498: ; 0x02009498
	ldr r3, _020094C0 ; =_022A37B6
	mov r2, #0xa
	mla r3, r1, r2, r3
	mov r2, #0
_020094A8:
	ldrb r1, [r3, r2]
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _020094A8
	bx lr
	.align 2, 0
_020094C0: .word _022A37B6
	arm_func_end sub_02009498

	arm_func_start sub_020094C4
sub_020094C4: ; 0x020094C4
	mov r3, #0xa
	mul ip, r2, r3
	ldr r3, _020094E0 ; =_022A37BC
	ldr r2, _020094E4 ; =_022A37BE
	strh r0, [r3, ip]
	strh r1, [r2, ip]
	bx lr
	.align 2, 0
_020094E0: .word _022A37BC
_020094E4: .word _022A37BE
	arm_func_end sub_020094C4

	arm_func_start sub_020094E8
sub_020094E8: ; 0x020094E8
	mov r3, #0xa
	mul ip, r2, r3
	ldr r3, _0200950C ; =_022A37BC
	ldr r2, _02009510 ; =_022A37BE
	ldrsh r3, [r3, ip]
	strh r3, [r0]
	ldrsh r0, [r2, ip]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200950C: .word _022A37BC
_02009510: .word _022A37BE
	arm_func_end sub_020094E8

	arm_func_start sub_02009514
sub_02009514: ; 0x02009514
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x40
	mov r1, r0
	mov r2, r4
	bl sub_020094C4
	mov r0, #0xa
	mul r3, r4, r0
	cmp r4, #0
	bne _02009568
	ldr r0, _02009598 ; =_022A37B6
	mov r2, #1
	strb r2, [r0, r3]
	ldr r1, _0200959C ; =_022A37B7
	mov r2, #2
	strb r2, [r1, r3]
	ldr r0, _020095A0 ; =_022A37B8
	ldr r1, _020095A4 ; =_022A37B9
	strb r2, [r0, r3]
	ldr r0, _020095A8 ; =_022A37BA
	b _0200958C
_02009568:
	ldr r0, _02009598 ; =_022A37B6
	mov r2, #2
	strb r2, [r0, r3]
	ldr r1, _0200959C ; =_022A37B7
	ldr r0, _020095A0 ; =_022A37B8
	strb r2, [r1, r3]
	strb r2, [r0, r3]
	ldr r1, _020095A4 ; =_022A37B9
	ldr r0, _020095A8 ; =_022A37BA
_0200958C:
	strb r2, [r1, r3]
	strb r2, [r0, r3]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009598: .word _022A37B6
_0200959C: .word _022A37B7
_020095A0: .word _022A37B8
_020095A4: .word _022A37B9
_020095A8: .word _022A37BA
	arm_func_end sub_02009514

	arm_func_start sub_020095AC
sub_020095AC: ; 0x020095AC
	ldr r2, _020095C4 ; =0x04001008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095C4: .word 0x04001008
	arm_func_end sub_020095AC

	arm_func_start sub_020095C8
sub_020095C8: ; 0x020095C8
	ldr r2, _020095E0 ; =0x0400100A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095E0: .word 0x0400100A
	arm_func_end sub_020095C8

	arm_func_start sub_020095E4
sub_020095E4: ; 0x020095E4
	ldr r2, _020095FC ; =0x0400100C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095FC: .word 0x0400100C
	arm_func_end sub_020095E4

	arm_func_start sub_02009600
sub_02009600: ; 0x02009600
	ldr r2, _02009618 ; =0x0400100E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009618: .word 0x0400100E
	arm_func_end sub_02009600
