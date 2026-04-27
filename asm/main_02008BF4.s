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

	arm_func_start sub_0200961C
sub_0200961C: ; 0x0200961C
	stmdb sp!, {r3, lr}
	bl GX_DisableBankForBG
	bl GX_DisableBankForOBJ
	bl GX_DisableBankForBGExtPltt
	bl GX_DisableBankForOBJExtPltt
	bl GX_DisableBankForTex
	bl GX_DisableBankForTexPltt
	bl GX_DisableBankForSubBG
	bl GX_DisableBankForSubOBJ
	bl GX_DisableBankForSubBGExtPltt
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200961C

	arm_func_start sub_02009648
sub_02009648: ; 0x02009648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r0, #1
	bl GX_SetBankForBG
	mov r0, #2
	bl GX_SetBankForOBJ
	mov r0, #0x10
	bl GX_SetBankForBGExtPltt
	mov r0, #0x40
	bl GX_SetBankForOBJExtPltt
	mov r0, #8
	bl GX_SetBankForTex
	mov r0, #0x20
	bl GX_SetBankForTexPltt
	mov r0, #1
	mov r1, #0
	mov r2, r0
	bl GX_SetGraphicsMode
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _02009B78 ; =0x00005C10
	bic r1, r1, #0x1f00
	orr r1, r1, #0x1f00
	str r1, [r2]
	add r3, r0, #0x208
	ldr r1, [r2]
	mov r0, #0x1c
	bic r1, r1, #0x38000000
	str r1, [r2]
	ldr r4, [r2]
	mov r1, #0
	bic r4, r4, #0x7000000
	str r4, [r2]
	ldrh r4, [r2, #0xa]
	and r4, r4, #0x43
	orr r4, r4, #0x1b80
	strh r4, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	bic r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009B98
	mov r0, #0x1c
	mov r1, #0
	bl sub_02009BC0
	mov r0, #0
	mov r1, r0
	bl sub_02009BE8
	mov r0, #0xc
	mov r1, #0
	bl sub_02009C10
	mov r3, #8
	str r3, [sp]
	ldr r0, _02009B7C ; =0x04000050
	mov r1, #1
	mov r2, #0x3e
	bl G2x_SetBlendAlpha_
	ldr ip, _02009B80 ; =0x04000040
	mov lr, #0
	strh lr, [ip]
	strh lr, [ip, #4]
	strh lr, [ip, #2]
	strh lr, [ip, #6]
	sub r4, ip, #0x36
	ldrh r0, [r4]
	sub r3, ip, #0x38
	sub r2, ip, #0x34
	bic r0, r0, #3
	strh r0, [r4]
	ldrh r0, [r3]
	sub r1, ip, #0x32
	mov r6, #0x4000000
	bic r0, r0, #3
	orr r0, r0, #1
	strh r0, [r3]
	ldrh r7, [r2]
	ldr r5, _02009B84 ; =0xFFCFFFEF
	mov r0, #4
	bic r7, r7, #3
	orr r7, r7, #2
	strh r7, [r2]
	ldrh r7, [r1]
	bic r7, r7, #3
	orr r7, r7, #3
	strh r7, [r1]
	str lr, [ip, #-0x2c]
	str lr, [ip, #-0x28]
	str lr, [ip, #-0x24]
	ldrh r7, [r3]
	bic r7, r7, #0x40
	strh r7, [r3]
	ldrh r3, [r4]
	bic r3, r3, #0x40
	strh r3, [r4]
	ldrh r3, [r2]
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r2, [r1]
	bic r2, r2, #0x40
	strh r2, [r1]
	ldr r1, [r6]
	and r1, r1, r5
	orr r1, r1, #0x10
	orr r1, r1, #0x200000
	str r1, [r6]
	bl GX_SetBankForSubBG
	mov r0, #0x100
	bl GX_SetBankForSubOBJ
	mov r0, #0x80
	bl GX_SetBankForSubBGExtPltt
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r2, _02009B88 ; =0x04001000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, #0x1f00
	str r0, [r2]
	ldrh r0, [r2, #8]
	and r0, r0, #0x43
	orr r0, r0, #0x1a80
	strh r0, [r2, #8]
	ldrh r3, [r2, #0xa]
	ldr r1, _02009B78 ; =0x00005C10
	mov r0, #0x1e
	and r3, r3, #0x43
	orr r3, r3, #0x38c
	orr r3, r3, #0x1800
	strh r3, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	add r3, r1, #0x208
	mov r1, #1
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	orr r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009CA8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009CD0
	mov r0, #0
	mov r1, r0
	bl sub_02009CF8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009D20
	ldr ip, _02009B8C ; =0x04001050
	mov r1, #0
	strh r1, [ip]
	strh r1, [ip, #-0x10]
	strh r1, [ip, #-0xc]
	strh r1, [ip, #-0xe]
	strh r1, [ip, #-0xa]
	sub r3, ip, #0x48
	ldrh r4, [r3]
	sub r0, ip, #0x46
	sub r2, ip, #0x44
	bic r4, r4, #3
	strh r4, [r3]
	ldrh r5, [r0]
	sub r4, ip, #0x42
	bic r5, r5, #3
	orr r5, r5, #1
	strh r5, [r0]
	ldrh r5, [r2]
	bic r5, r5, #3
	orr r5, r5, #2
	strh r5, [r2]
	ldrh r5, [r4]
	bic r5, r5, #3
	orr r5, r5, #3
	strh r5, [r4]
	str r1, [ip, #-0x40]
	str r1, [ip, #-0x3c]
	str r1, [ip, #-0x38]
	str r1, [ip, #-0x34]
	ldrh r5, [r3]
	ldr r6, _02009B90 ; =0xFFFFCFFD
	ldr lr, _02009B94 ; =0x04000304
	bic r5, r5, #0x40
	strh r5, [r3]
	ldrh r3, [r0]
	sub r7, ip, #0x50
	ldr r5, _02009B84 ; =0xFFCFFFEF
	bic r3, r3, #0x40
	strh r3, [r0]
	ldrh r3, [r2]
	sub ip, lr, #0x2a4
	mov r0, r6, lsr #0x16
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r8, [r4]
	mov r2, r6, lsr #0x11
	mov r3, #0x3f
	bic r8, r8, #0x40
	strh r8, [r4]
	ldr r4, [r7]
	and r4, r4, r5
	orr r4, r4, #0x10
	orr r4, r4, #0x200000
	str r4, [r7]
	ldrh r4, [lr]
	bic r4, r4, #0x8000
	strh r4, [lr]
	ldrh r4, [ip]
	and r4, r4, r6
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #0x10
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #8
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #4
	strh r4, [ip]
	strh r1, [lr, #0x3c]
	str r1, [sp]
	bl G3X_SetClearColor
	mov r0, #0
	bl sub_02009120
	mov r0, #1
	bl sub_02009120
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	mov r0, #0
	bl sub_02009514
	mov r0, #1
	bl sub_02009514
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	str r0, [sp, #8]
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009358
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, #1
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #1
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02009B78: .word 0x00005C10
_02009B7C: .word 0x04000050
_02009B80: .word 0x04000040
_02009B84: .word 0xFFCFFFEF
_02009B88: .word 0x04001000
_02009B8C: .word 0x04001050
_02009B90: .word 0xFFFFCFFD
_02009B94: .word 0x04000304
	arm_func_end sub_02009648

	arm_func_start sub_02009B98
sub_02009B98: ; 0x02009B98
	ldr r2, _02009BBC ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009BBC ; =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BBC: .word 0x04000048
	arm_func_end sub_02009B98

	arm_func_start sub_02009BC0
sub_02009BC0: ; 0x02009BC0
	ldr r2, _02009BE4 ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009BE4 ; =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BE4: .word 0x04000048
	arm_func_end sub_02009BC0

	arm_func_start sub_02009BE8
sub_02009BE8: ; 0x02009BE8
	ldr r2, _02009C0C ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009C0C ; =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C0C: .word 0x0400004A
	arm_func_end sub_02009BE8

	arm_func_start sub_02009C10
sub_02009C10: ; 0x02009C10
	ldr r2, _02009C34 ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009C34 ; =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C34: .word 0x0400004A
	arm_func_end sub_02009C10

	arm_func_start sub_02009C38
sub_02009C38: ; 0x02009C38
	ldr r2, _02009C50 ; =0x0400000A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C50: .word 0x0400000A
	arm_func_end sub_02009C38

	arm_func_start sub_02009C54
sub_02009C54: ; 0x02009C54
	ldr r2, _02009C6C ; =0x04000008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C6C: .word 0x04000008
	arm_func_end sub_02009C54

	arm_func_start sub_02009C70
sub_02009C70: ; 0x02009C70
	ldr r2, _02009C88 ; =0x0400000C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C88: .word 0x0400000C
	arm_func_end sub_02009C70

	arm_func_start sub_02009C8C
sub_02009C8C: ; 0x02009C8C
	ldr r2, _02009CA4 ; =0x0400000E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009CA4: .word 0x0400000E
	arm_func_end sub_02009C8C

	arm_func_start sub_02009CA8
sub_02009CA8: ; 0x02009CA8
	ldr r2, _02009CCC ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009CCC ; =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CCC: .word 0x04001048
	arm_func_end sub_02009CA8

	arm_func_start sub_02009CD0
sub_02009CD0: ; 0x02009CD0
	ldr r2, _02009CF4 ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009CF4 ; =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CF4: .word 0x04001048
	arm_func_end sub_02009CD0

	arm_func_start sub_02009CF8
sub_02009CF8: ; 0x02009CF8
	ldr r2, _02009D1C ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009D1C ; =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D1C: .word 0x0400104A
	arm_func_end sub_02009CF8

	arm_func_start sub_02009D20
sub_02009D20: ; 0x02009D20
	ldr r2, _02009D44 ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009D44 ; =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D44: .word 0x0400104A
	arm_func_end sub_02009D20

	arm_func_start sub_02009D48
sub_02009D48: ; 0x02009D48
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02009D88
	ldr r0, _02009DBC ; =_022A37CC
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C54
	ldr r0, _02009DC0 ; =_022A37D0
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C38
	ldr r0, _02009DC4 ; =_022A37D4
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C70
	ldr r0, _02009DC8 ; =_022A37D8
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C8C
	ldmia sp!, {r4, pc}
_02009D88:
	ldr r0, _02009DBC ; =_022A37CC
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095AC
	ldr r0, _02009DC0 ; =_022A37D0
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095C8
	ldr r0, _02009DC4 ; =_022A37D4
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095E4
	ldr r0, _02009DC8 ; =_022A37D8
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009600
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009DBC: .word _022A37CC
_02009DC0: .word _022A37D0
_02009DC4: .word _022A37D4
_02009DC8: .word _022A37D8
	arm_func_end sub_02009D48

	arm_func_start sub_02009DCC
sub_02009DCC: ; 0x02009DCC
	ldr r1, _02009E58 ; =_022A37AC
	add r3, r0, r0, lsl #2
	ldrb r2, [r1, r3]
	mov r1, #0x1f
	cmp r2, #0
	ldr r2, _02009E5C ; =_022A37AD
	bicne r1, r1, #1
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E60 ; =_022A37AE
	bicne r1, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E64 ; =_022A37AF
	bicne r1, r1, #4
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E68 ; =_022A37B0
	bicne r1, r1, #8
	ldrb r2, [r2, r3]
	cmp r2, #0
	bicne r1, r1, #0x10
	cmp r0, #0
	ldrne r2, _02009E6C ; =0x04001000
	ldrne r0, [r2]
	bicne r0, r0, #0x1f00
	orrne r0, r0, r1, lsl #8
	strne r0, [r2]
	bxne lr
	mov r2, #0x4000000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, r1, lsl #8
	str r0, [r2]
	bx lr
	.align 2, 0
_02009E58: .word _022A37AC
_02009E5C: .word _022A37AD
_02009E60: .word _022A37AE
_02009E64: .word _022A37AF
_02009E68: .word _022A37B0
_02009E6C: .word 0x04001000
	arm_func_end sub_02009DCC

	arm_func_start sub_02009E70
sub_02009E70: ; 0x02009E70
	stmdb sp!, {r3, lr}
	mov r1, #0xa
	mul r3, r0, r1
	ldr r2, _02009F78 ; =_022A37B6
	mov r1, #0
	ldrb ip, [r2, r3]
	mov r2, #0x20
	cmp ip, #1
	orreq r1, r1, #1
	beq _02009EA0
	cmp ip, #2
	orreq r2, r2, #1
_02009EA0:
	ldr ip, _02009F7C ; =_022A37B7
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #2
	beq _02009EBC
	cmp ip, #2
	orreq r2, r2, #2
_02009EBC:
	ldr ip, _02009F80 ; =_022A37B8
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #4
	beq _02009ED8
	cmp ip, #2
	orreq r2, r2, #4
_02009ED8:
	ldr ip, _02009F84 ; =_022A37B9
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #8
	beq _02009EF4
	cmp ip, #2
	orreq r2, r2, #8
_02009EF4:
	ldr ip, _02009F88 ; =_022A37BA
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #0x10
	beq _02009F10
	cmp ip, #2
	orreq r2, r2, #0x10
_02009F10:
	cmp r0, #0
	bne _02009F48
	ldr r0, _02009F8C ; =_022A37BE
	ldr ip, _02009F90 ; =_022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F94 ; =0x04000050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl G2x_SetBlendAlpha_
	ldmia sp!, {r3, pc}
_02009F48:
	ldr r0, _02009F8C ; =_022A37BE
	ldr ip, _02009F90 ; =_022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F98 ; =0x04001050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl G2x_SetBlendAlpha_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009F78: .word _022A37B6
_02009F7C: .word _022A37B7
_02009F80: .word _022A37B8
_02009F84: .word _022A37B9
_02009F88: .word _022A37BA
_02009F8C: .word _022A37BE
_02009F90: .word _022A37BC
_02009F94: .word 0x04000050
_02009F98: .word 0x04001050
	arm_func_end sub_02009E70
