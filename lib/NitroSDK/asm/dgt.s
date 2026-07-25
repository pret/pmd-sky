	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start DGT_Hash2Reset
DGT_Hash2Reset: ; 0x02080670
	ldr r1, _020806AC ; =0x67452301
	ldr r2, _020806B0 ; =0xEFCDAB89
	str r1, [r0]
	ldr r1, _020806B4 ; =0x98BADCFE
	str r2, [r0, #4]
	ldr r2, _020806B8 ; =0x10325476
	str r1, [r0, #8]
	ldr r1, _020806BC ; =0xC3D2E1F0
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_020806AC: .word 0x67452301
_020806B0: .word 0xEFCDAB89
_020806B4: .word 0x98BADCFE
_020806B8: .word 0x10325476
_020806BC: .word 0xC3D2E1F0
	arm_func_end DGT_Hash2Reset

	arm_func_start DGT_Hash2SetSource
DGT_Hash2SetSource: ; 0x020806C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	movs r8, r2
	mov sb, r1
	add r6, sl, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x14]
	add r1, r0, r8, lsl #3
	cmp r1, r0
	ldrlo r0, [sl, #0x18]
	addlo r0, r0, #1
	strlo r0, [sl, #0x18]
	ldr r0, [sl, #0x18]
	add r0, r0, r8, lsr #29
	str r0, [sl, #0x18]
	str r1, [sl, #0x14]
	ldr r1, [sl, #0x1c]
	cmp r1, #0
	beq _02080778
	add r0, r1, r8
	cmp r0, #0x40
	blo _02080758
	rsb r4, r1, #0x40
	mov r0, sb
	mov r2, r4
	add r1, r6, r1
	bl MI_CpuCopy8
	ldr r1, _02080810 ; =_020B2D88
	mov r0, sl
	ldr r3, [r1]
	mov r1, r6
	mov r2, #0x40
	sub r8, r8, r4
	add sb, sb, r4
	blx r3
	mov r0, #0
	str r0, [sl, #0x1c]
	b _02080778
_02080758:
	mov r0, sb
	mov r2, r8
	add r1, r6, r1
	bl MI_CpuCopy8
	ldr r0, [sl, #0x1c]
	add r0, r0, r8
	str r0, [sl, #0x1c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02080778:
	cmp r8, #0x40
	blo _020807F0
	bic r7, r8, #0x3f
	tst sb, #3
	sub r8, r8, r7
	bne _020807B0
	ldr r1, _02080810 ; =_020B2D88
	mov r0, sl
	ldr r3, [r1]
	mov r1, sb
	mov r2, r7
	blx r3
	add sb, sb, r7
	b _020807F0
_020807B0:
	mov r5, #0x40
	ldr r4, _02080810 ; =_020B2D88
	mov fp, r5
_020807BC:
	mov r0, sb
	mov r1, r6
	mov r2, r5
	bl MI_CpuCopy8
	ldr r3, [r4]
	mov r0, sl
	mov r1, r6
	add sb, sb, #0x40
	mov r2, fp
	blx r3
	sub r7, r7, #0x40
	cmp r7, #0
	bgt _020807BC
_020807F0:
	str r8, [sl, #0x1c]
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	mov r1, r6
	mov r2, r8
	bl MI_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02080810: .word _020B2D88
	arm_func_end DGT_Hash2SetSource

	arm_func_start DGT_Hash2GetDigest
DGT_Hash2GetDigest: ; 0x02080814
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, [sp, #0x10]
	mov r6, r1
	ldr r3, [r0, #0x1c]
	add r4, r0, #0x20
	tst r3, #3
	mov r2, r3, asr #2
	moveq r0, #0
	streq r0, [r4, r2, lsl #2]
	ldr r1, [sp, #0x10]
	mov r0, #0x80
	add r5, r1, #0x20
	strb r0, [r5, r3]
	add r3, r3, #1
	tst r3, #3
	beq _0208086C
	mov r0, #0
_0208085C:
	strb r0, [r5, r3]
	add r3, r3, #1
	tst r3, #3
	bne _0208085C
_0208086C:
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	ldr r0, [r0, #0x1c]
	cmp r0, #0x38
	blt _020808B8
	cmp r2, #0x10
	bge _0208089C
	mov r0, #0
_0208088C:
	str r0, [r4, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x10
	blt _0208088C
_0208089C:
	ldr r1, _02080A0C ; =_020B2D88
	ldr r0, [sp, #0x10]
	ldr r3, [r1]
	mov r1, r4
	mov r2, #0x40
	blx r3
	mov r2, #0
_020808B8:
	cmp r2, #0xe
	bge _020808D4
	mov r0, #0
_020808C4:
	str r0, [r4, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0xe
	blt _020808C4
_020808D4:
	ldr r0, [sp, #0x10]
	ldr r3, _02080A0C ; =_020B2D88
	ldr r2, [r0, #0x14]
	mov r1, r4
	strb r2, [r5, #0x3f]
	mov r0, r2, lsr #8
	strb r0, [r5, #0x3e]
	mov r0, r2, lsr #0x10
	strb r0, [r5, #0x3d]
	mov r0, r2, lsr #0x18
	strb r0, [r5, #0x3c]
	ldr r0, [sp, #0x10]
	mov r2, #0x40
	ldr r4, [r0, #0x18]
	strb r4, [r5, #0x3b]
	mov r0, r4, lsr #8
	strb r0, [r5, #0x3a]
	mov r0, r4, lsr #0x10
	strb r0, [r5, #0x39]
	mov r0, r4, lsr #0x18
	strb r0, [r5, #0x38]
	ldr r0, [sp, #0x10]
	ldr r3, [r3]
	blx r3
	ldr r0, [sp, #0x10]
	ldr r1, [r0]
	mov r0, r1, lsr #0x18
	strb r0, [r6]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #1]
	mov r0, r1, lsr #8
	strb r0, [r6, #2]
	strb r1, [r6, #3]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #4]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #5]
	mov r0, r1, lsr #8
	strb r0, [r6, #6]
	strb r1, [r6, #7]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #8]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #8]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #9]
	mov r0, r1, lsr #8
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0xc]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #0xc]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #0xd]
	mov r0, r1, lsr #8
	strb r0, [r6, #0xe]
	strb r1, [r6, #0xf]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #0x10]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #0x11]
	mov r0, r1, lsr #8
	strb r0, [r6, #0x12]
	strb r1, [r6, #0x13]
	ldr r3, [sp, #0x10]
	mov r0, #0
	add r1, sp, #0x10
	mov r2, #4
	str r0, [r3, #0x1c]
	bl MTi_CpuClear32
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02080A0C: .word _020B2D88
	arm_func_end DGT_Hash2GetDigest

	arm_func_start Dgt_Hash2CalcHmac
Dgt_Hash2CalcHmac: ; 0x02080A10
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xa0
	ldr lr, _02080A94 ; =_020AEC5C
	add ip, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, ip
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	add lr, sp, #0x38
	add ip, sp, #0x24
	str lr, [sp, #0x10]
	ldr lr, _02080A98 ; =DGT_Hash2Reset
	str ip, [sp, #0x14]
	ldr ip, _02080A9C ; =DGT_Hash2SetSource
	str lr, [sp, #0x18]
	ldr lr, _02080AA0 ; =DGT_Hash2GetDigest
	str ip, [sp, #0x1c]
	ldr ip, [sp, #0xb8]
	str lr, [sp, #0x20]
	str ip, [sp]
	mov r3, r5
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r4, [sp, #4]
	bl Dgti_CalcHmac
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02080A94: .word _020AEC5C
_02080A98: .word DGT_Hash2Reset
_02080A9C: .word DGT_Hash2SetSource
_02080AA0: .word DGT_Hash2GetDigest
	arm_func_end Dgt_Hash2CalcHmac

	arm_func_start Dgti_CalcHmac
Dgti_CalcHmac: ; 0x02080AA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc0
	ldr r5, [sp, #0xe0]
	ldr r4, [sp, #0xe4]
	mov r8, r1
	movs sb, r0
	mov r7, r2
	cmpne r8, #0
	mov r6, r3
	cmpne r7, #0
	cmpne r6, #0
	cmpne r5, #0
	cmpne r4, #0
	addeq sp, sp, #0xc0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4, #4]
	cmp r5, r0
	ble _02080B24
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r3, [r4, #0x14]
	mov r1, r6
	mov r2, r5
	blx r3
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x18]
	add r1, sp, #0x80
	blx r2
	ldr r5, [r4]
	add r6, sp, #0x80
_02080B24:
	cmp r5, #0
	mov r2, #0
	ble _02080B4C
	add r1, sp, #0x40
_02080B34:
	ldrb r0, [r6, r2]
	add r2, r2, #1
	cmp r2, r5
	eor r0, r0, #0x36
	strb r0, [r1], #1
	blt _02080B34
_02080B4C:
	ldr r0, [r4, #4]
	cmp r2, r0
	bge _02080B78
	add r0, sp, #0x40
	add r3, r0, r2
	mov r1, #0x36
_02080B64:
	strb r1, [r3], #1
	ldr r0, [r4, #4]
	add r2, r2, #1
	cmp r2, r0
	blt _02080B64
_02080B78:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x14]
	add r1, sp, #0x40
	blx r3
	ldr r0, [r4, #8]
	ldr r3, [r4, #0x14]
	mov r1, r8
	mov r2, r7
	blx r3
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x18]
	blx r2
	cmp r5, #0
	mov r3, #0
	ble _02080BE4
	add r1, sp, #0
_02080BCC:
	ldrb r0, [r6, r3]
	add r3, r3, #1
	cmp r3, r5
	eor r0, r0, #0x5c
	strb r0, [r1], #1
	blt _02080BCC
_02080BE4:
	ldr r0, [r4, #4]
	cmp r3, r0
	bge _02080C10
	add r0, sp, #0
	add r2, r0, r3
	mov r1, #0x5c
_02080BFC:
	strb r1, [r2], #1
	ldr r0, [r4, #4]
	add r3, r3, #1
	cmp r3, r0
	blt _02080BFC
_02080C10:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x14]
	add r1, sp, #0
	blx r3
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4]
	ldr r3, [r4, #0x14]
	blx r3
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x18]
	mov r1, sb
	blx r2
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02080C5C: .word 0x00FF00FF
_02080C60: .word 0x5A827999
_02080C64: .word 0x6ED9EBA1
_02080C68: .word 0x8F1BBCDC
_02080C6C: .word 0xCA62C1D6
	arm_func_end Dgti_CalcHmac

	arm_func_start Dgt_Hash2Transform
Dgt_Hash2Transform: ; 0x02080C70
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
	ldmia r0, {r3, sb, sl, fp, ip}
	sub sp, sp, #0x84
	str r2, [sp, #0x80]
_02080C80:
	ldr r8, _02080C60 ; =0x5A827999
	ldr r7, _02080C5C ; =0x00FF00FF
	mov r6, sp
	mov r5, #0
_02080C90:
	ldr r4, [r1], #4
	add r2, r8, ip
	add r2, r2, r3, ror #27
	and lr, r4, r7
	and r4, r7, r4, ror #24
	orr r4, r4, lr, ror #8
	str r4, [r6, #0x40]
	str r4, [r6], #4
	add r2, r2, r4
	eor r4, sl, fp
	and r4, r4, sb
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r5, r5, #4
	cmp r5, #0x40
	blt _02080C90
	mov r7, #0
	mov r6, sp
_02080CF0:
	ldr r2, [r6]
	ldr r5, [r6, #8]
	ldr r4, [r6, #0x20]
	ldr lr, [r6, #0x34]
	eor r2, r2, r5
	eor r4, r4, lr
	eor r2, r2, r4
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor r4, sl, fp
	and r4, r4, sb
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #4
	cmp r7, #0x10
	blt _02080CF0
	ldr r8, _02080C64 ; =0x6ED9EBA1
	mov r7, #0
_02080D60:
	ldr r2, [r6]
	ldr r4, [r6, #8]
	ldr lr, [r6, #0x20]
	ldr r5, [r6, #0x34]
	eor r2, r2, r4
	eor lr, lr, r5
	eor r2, r2, lr
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor lr, sb, sl
	eor lr, lr, fp
	add r2, r2, lr
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #0xc
	moveq r6, sp
	cmp r7, #0x14
	blt _02080D60
	ldr r8, _02080C68 ; =0x8F1BBCDC
	mov r7, #0
_02080DD4:
	ldr r2, [r6]
	ldr lr, [r6, #8]
	ldr r5, [r6, #0x20]
	ldr r4, [r6, #0x34]
	eor r2, r2, lr
	eor r5, r5, r4
	eor r2, r2, r5
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	orr r5, sb, sl
	and r5, r5, fp
	and r4, sb, sl
	orr r5, r5, r4
	add r2, r2, r5
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #8
	moveq r6, sp
	cmp r7, #0x14
	blt _02080DD4
	ldr r8, _02080C6C ; =0xCA62C1D6
	mov r7, #0
_02080E50:
	ldr r2, [r6]
	ldr r5, [r6, #8]
	ldr r4, [r6, #0x20]
	ldr lr, [r6, #0x34]
	eor r2, r2, r5
	eor r4, r4, lr
	eor r2, r2, r4
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor r4, sb, sl
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #4
	moveq r6, sp
	cmp r7, #0x14
	blt _02080E50
	ldmia r0, {r2, r4, r6, r7, lr}
	add r3, r3, r2
	add sb, sb, r4
	add sl, sl, r6
	add fp, fp, r7
	add ip, ip, lr
	stmia r0, {r3, sb, sl, fp, ip}
	ldr lr, [sp, #0x80]
	subs lr, lr, #0x40
	str lr, [sp, #0x80]
	bgt _02080C80
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
	arm_func_end Dgt_Hash2Transform

