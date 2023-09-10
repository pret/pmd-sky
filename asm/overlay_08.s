	.include "asm/macros.inc"
	.include "overlay_08.inc"

	.text

	arm_func_start ov08_0233CA80
ov08_0233CA80: ; 0x0233CA80
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x10
	mov r1, #0
	bl MemAlloc
	ldr r1, _0233CAFC ; =0x0233EC20
	mov r3, #0
	str r0, [r1]
	str r3, [r0]
	arm_func_end ov08_0233CA80

	arm_func_start ov08_0233CAA8
ov08_0233CAA8: ; 0x0233CAA8
	ldr r0, [r1]
	mov r2, #1
	str r3, [r0, #4]
	ldr r0, [r1]
	strh r5, [r0, #8]
	ldr r0, [r1]
	strh r4, [r0, #0xa]
	ldr r0, [r1]
	strb r3, [r0, #0xd]
	ldr r0, [r1]
	strb r2, [r0, #0xd]
	bl ov08_02003B94
	arm_func_end ov08_0233CAA8

	arm_func_start ov08_0233CAD8
ov08_0233CAD8: ; 0x0233CAD8
	ldr r0, _0233CAFC ; =0x0233EC20
	ldr r1, [r0]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov08_0233CF04
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233CAFC: .word ov08_0233EC20
	arm_func_end ov08_0233CAD8

	arm_func_start ov08_0233CB00
ov08_0233CB00: ; 0x0233CB00
	ldr r0, _0233CB34 ; =0x0233EC20
	mov ip, #0
	ldr r1, [r0]
	mov r3, #1
	arm_func_end ov08_0233CB00

	arm_func_start ov08_0233CB10
ov08_0233CB10: ; 0x0233CB10
	str ip, [r1]
	ldr r2, [r0]
	mov r1, #3
	str ip, [r2, #4]
	ldr r2, [r0]
	strb r3, [r2, #0xd]
	ldr r0, [r0]
	str r1, [r0]
	bx lr
	.align 2, 0
_0233CB34: .word 0x0233EC20
	arm_func_end ov08_0233CB10

	arm_func_start ov08_0233CB38
ov08_0233CB38: ; 0x0233CB38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	arm_func_end ov08_0233CB38

	arm_func_start ov08_0233CB3C
ov08_0233CB3C: ; 0x0233CB3C
	ldr r0, _0233CCEC ; =0x0233EC20
	ldr r5, [r0]
	ldr r0, [r5]
	cmp r0, #4
	blt _0233CB68
	cmp r0, #8
	bgt _0233CB68
	bl ov08_0233CDF8
	cmp r0, #0
	movne r0, #9
	strne r0, [r5]
_0233CB68:
	ldr r0, [r5]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0233CCE4
_0233CB78: ; jump table
	b _0233CBA8 ; case 0
	b _0233CBB4 ; case 1
	b _0233CC10 ; case 2
	b _0233CC18 ; case 3
	b _0233CC38 ; case 4
	b _0233CC54 ; case 5
	b _0233CC74 ; case 6
	b _0233CC90 ; case 7
	b _0233CCB0 ; case 8
	b _0233CCC4 ; case 9
	b _0233CCCC ; case 10
	b _0233CCD4 ; case 11
_0233CBA8:
	mov r0, #1
	str r0, [r5]
	b _0233CCE4
_0233CBB4:
	bl ov08_0233D0E4
	cmp r0, #1
	bne _0233CCE4
	bl ov08_0233D178
	ldr r8, _0233CCF0 ; =0x000004ED
	ldr sb, _0233CCF4 ; =0x0233E9A4
	mov r4, #0
	sub r7, r8, #1
	mov r6, #0x44
_0233CBD8:
	mul r1, r4, r6
	str r8, [sp]
	add r0, sb, r1
	ldrh r2, [sb, r1]
	ldr r1, [r0, #4]
	mov r3, r7
	add r0, r0, #8
	bl ov08_0233D1F8
	add r4, r4, #1
	cmp r4, #3
	blt _0233CBD8
	mov r0, #3
	str r0, [r5]
	b _0233CCE4
_0233CC10:
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233CC18:
	bl ov08_0233D630
	ldrh r1, [r5, #8]
	cmp r1, r0
	bne _0233CCE4
	mov r0, #4
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233CC38:
	bl ov08_0233D760
	mov r4, r0
	bl ov08_0233D840
	cmp r4, r0
	moveq r0, #5
	streq r0, [r5]
	b _0233CCE4
_0233CC54:
	bl ov08_0233D6E8
	bl ov08_0233D6C0
	mov r4, r0
	bl ov08_0233D840
	cmp r4, r0
	moveq r0, #6
	streq r0, [r5]
	b _0233CCE4
_0233CC74:
	bl ov08_0233D818
	mov r4, r0
	bl ov08_0233D840
	cmp r4, r0
	moveq r0, #7
	streq r0, [r5]
	b _0233CCE4
_0233CC90:
	bl ov08_0233D66C
	bl ov08_0233D644
	mov r4, r0
	bl ov08_0233D840
	cmp r4, r0
	moveq r0, #0xa
	streq r0, [r5]
	b _0233CCE4
_0233CCB0:
	bl ov08_0233CDF8
	cmp r0, #0
	movne r0, #9
	strne r0, [r5]
	b _0233CCE4
_0233CCC4:
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233CCCC:
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233CCD4:
	bl ov08_0233CD3C
	cmp r0, #0
	movne r0, #5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0233CCE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233CCEC: .word 0x0233EC20
_0233CCF0: .word 0x000004ED
_0233CCF4: .word 0x0233E9A4
	arm_func_end ov08_0233CB3C

	arm_func_start ov08_0233CCF8
ov08_0233CCF8: ; 0x0233CCF8
	stmdb sp!, {r3, lr}
	bl ov08_0233D854
	ldr r0, _0233CD14 ; =0x0233EC20
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CD14: .word 0x0233EC20
	arm_func_end ov08_0233CCF8

	arm_func_start ov08_0233CD18
ov08_0233CD18: ; 0x0233CD18
	ldr r0, _0233CD38 ; =0x0233EC20
	ldr r1, [r0]
	cmp r1, #0
	moveq r0, #1
	movne r0, #0xb
	strne r0, [r1]
	movne r0, #0
	bx lr
	.align 2, 0
_0233CD38: .word 0x0233EC20
	arm_func_end ov08_0233CD18

	arm_func_start ov08_0233CD3C
ov08_0233CD3C: ; 0x0233CD3C
	stmdb sp!, {r3, lr}
	ldr r0, _0233CDA0 ; =0x0233EC20
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0233CD98
	bl ov08_0233D408
	cmp r0, #0
	beq _0233CD98
	bl ov08_0233D5B4
	ldr r0, _0233CDA0 ; =0x0233EC20
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0xd]
	ldr r0, [r0]
	str r1, [r0, #4]
	bl ov08_02003BC8
	mov r0, #1
	ldmia sp!, {r3, pc}
_0233CD98:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CDA0: .word 0x0233EC20
	arm_func_end ov08_0233CD3C

	arm_func_start ov08_0233CDA4
ov08_0233CDA4: ; 0x0233CDA4
	ldr r0, _0233CDC4 ; =0x0233EC20
	ldr r0, [r0]
	cmp r0, #0
	ldrneb r0, [r0, #0xd]
	cmpne r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_0233CDC4: .word 0x0233EC20
	arm_func_end ov08_0233CDA4

	arm_func_start ov08_0233CDC8
ov08_0233CDC8: ; 0x0233CDC8
	stmdb sp!, {r3, lr}
	ldr r0, _0233CDF4 ; =0x0233EC20
	ldr r0, [r0]
	cmp r0, #0
	arm_func_end ov08_0233CDC8

	arm_func_start ov08_0233CDD8
ov08_0233CDD8: ; 0x0233CDD8
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0233CDF4 ; =0x0233EC20
	arm_func_end ov08_0233CDD8

	arm_func_start ov08_0233CDE4
ov08_0233CDE4: ; 0x0233CDE4
	mov r1, #0
	str r1, [r0]
	bl ov08_02003BC8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CDF4: .word 0x0233EC20
	arm_func_end ov08_0233CDE4

	arm_func_start ov08_0233CDF8
ov08_0233CDF8: ; 0x0233CDF8
	stmdb sp!, {r3, lr}
	bl ov08_0233D760
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov08_0233CDF8

	arm_func_start ov08_0233CE14
ov08_0233CE14: ; 0x0233CE14
	stmdb sp!, {r3, lr}
	ldr r0, _0233CE68 ; =0x0233EC24
	ldrb r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r0]
	mov r1, #0
	strb r1, [r0, #1]
	bl ov01_0232C0CC
	bl ov01_0232C2E4
	mov r0, #0xe0
	mov r1, #0xa0
	mov r2, #0
	bl ov01_0232C148
	mov r0, #0xec
	mov r1, #0x1c
	mov r2, #7
	mov r3, #6
	bl ov01_0232C3AC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CE68: .word 0x0233EC24
	arm_func_end ov08_0233CE14

	arm_func_start ov08_0233CE6C
ov08_0233CE6C: ; 0x0233CE6C
	ldr r1, _0233CE78 ; =0x0233EC24
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0233CE78: .word 0x0233EC24
	arm_func_end ov08_0233CE6C

	arm_func_start ov08_0233CE7C
ov08_0233CE7C: ; 0x0233CE7C
	stmdb sp!, {r3, lr}
	ldr r0, _0233CECC ; =0x0233EC24
	ldrb r1, [r0]
	cmp r1, #0
	ldrneb r0, [r0, #1]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov08_0233D954
	cmp r0, #0
	moveq r0, #0
	beq _0233CEAC
	bl ov01_0232B380
_0233CEAC:
	add r0, r0, #2
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov01_0232C1D8
	mov r0, #0
	mov r1, r0
	bl ov01_0232C454
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CECC: .word 0x0233EC24
	arm_func_end ov08_0233CE7C

	arm_func_start ov08_0233CED0
ov08_0233CED0: ; 0x0233CED0
	stmdb sp!, {r3, lr}
	ldr r0, _0233CF00 ; =0x0233EC24
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov01_0232C10C
	bl ov01_0232C370
	ldr r0, _0233CF00 ; =0x0233EC24
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233CF00: .word 0x0233EC24
	arm_func_end ov08_0233CED0

	arm_func_start ov08_0233CF04
ov08_0233CF04: ; 0x0233CF04
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x54
	mov r8, r0
	mov r7, r1
	ldr r0, _0233D0DC ; =0x00000D18
	mov r1, #0
	bl MemAlloc
	ldr r2, _0233D0E0 ; =0x0233EC28
	ldr r1, _0233D0DC ; =0x00000D18
	str r0, [r2, #4]
	bl MemZero
	ldr sl, _0233D0E0 ; =0x0233EC28
	mov r6, #0
	ldr r0, [sl, #4]
	mov r2, #1
	strh r6, [r0, #0xa]
	ldr r0, [sl, #4]
	rsb r1, r2, #0x10000
	strh r6, [r0, #0xc]
	ldr r0, [sl, #4]
	mov r5, #0x3c
	strh r6, [r0, #0x10]
	ldr r0, [sl, #4]
	mov r4, r6
	strb r2, [r0, #0x2c]
	ldr r0, [sl, #4]
	strb r6, [r0, #0x2d]
	ldr r0, [sl, #4]
	strb r6, [r0, #0x2e]
	ldr r0, [sl, #4]
	strh r6, [r0, #0x30]
	ldr r0, [sl, #4]
	strh r1, [r0, #0x32]
	strb r6, [sl]
_0233CF8C:
	ldr r0, [sl, #4]
	add sb, r6, r6, lsl #4
	add r0, r0, #0x54
	mov r1, r5
	add r0, r0, sb, lsl #6
	bl MemZero
	ldr r0, [sl, #4]
	add r6, r6, #1
	add r0, r0, sb, lsl #6
	str r4, [r0, #0x90]
	cmp r6, #3
	blt _0233CF8C
	add r0, sp, #0
	bl sub_0207BA08
	ldr r0, _0233D0E0 ; =0x0233EC28
	ldrb r1, [sp, #1]
	ldr r4, [r0, #4]
	ldrh r3, [sp, #0x1a]
	ldrb r2, [r4, #0x14]
	and r1, r1, #0xf
	add r0, sp, #4
	bic r2, r2, #0xf
	orr r1, r2, r1
	strb r1, [r4, #0x14]
	strb r3, [r4, #0x15]
	add r1, r4, #0x16
	mov r2, r3, lsl #1
	bl sub_0207C4C8
	ldrb r1, [r4, #0x14]
	ldr r0, _0233D0E0 ; =0x0233EC28
	mov r3, #0
	bic r1, r1, #0xf0
	strb r1, [r4, #0x14]
	ldr r2, [r0, #4]
	mov r1, #0x1e
	strh r3, [r2, #0xa]
	ldr r2, [r0, #4]
	strh r3, [r2, #0xc]
	ldr r2, [r0, #4]
	strh r3, [r2, #0xe]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x12]
	ldr r0, [r0, #4]
	add r0, r0, #0x34
	bl MemZero
	ldr r1, _0233D0E0 ; =0x0233EC28
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	strh r3, [r2, #0x10]
	ldr r2, [r1, #4]
	strb r3, [r2, #0x2d]
	ldr r2, [r1, #4]
	strb r3, [r2, #0x2e]
	ldr r2, [r1, #4]
	strh r7, [r2, #0x2a]
	ldr r2, [r1, #4]
	str r3, [r2, #4]
	ldr r2, [r1, #4]
	strh r8, [r2, #0xa]
	ldr r2, [r1, #4]
	ldrsh r1, [r2, #0xa]
	sub r1, r1, #1
	strh r1, [r2, #0xc]
	bl ov01_0232C0A0
	bl ov08_0233DC78
	bl ov08_0233DFF8
	ldr r0, _0233D0E0 ; =0x0233EC28
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	strb r3, [r2, #0xd14]
	strb r1, [r0, #2]
	strb r3, [r0, #1]
	strb r3, [r0]
	ldr r2, [r0, #4]
	rsb r1, r1, #0x10000
	strb r3, [r2]
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	ldr r0, [r0, #4]
	strh r1, [r0, #0x32]
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0233D0DC: .word 0x00000D18
_0233D0E0: .word 0x0233EC28
	arm_func_end ov08_0233CF04

	arm_func_start ov08_0233D0E4
ov08_0233D0E4: ; 0x0233D0E4
	stmdb sp!, {r4, lr}
	ldr r0, _0233D174 ; =0x0233EC28
	ldr r4, [r0, #4]
	bl ov08_0233DC88
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0233D168
_0233D100: ; jump table
	b _0233D168 ; case 0
	b _0233D128 ; case 1
	b _0233D168 ; case 2
	b _0233D16C ; case 3
	b _0233D168 ; case 4
	b _0233D168 ; case 5
	b _0233D168 ; case 6
	b _0233D140 ; case 7
	b _0233D168 ; case 8
	b _0233D158 ; case 9
_0233D128:
	ldr r0, _0233D174 ; =0x0233EC28
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0xd14]
	bl ov08_0233DC98
	b _0233D16C
_0233D140:
	bl ov08_0233DEC8
	ldr r1, _0233D174 ; =0x0233EC28
	ldr r1, [r1, #4]
	strh r0, [r1, #0x32]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0233D158:
	bl ov08_0233E16C
	mov r0, #1
	strb r0, [r4]
	b _0233D16C
_0233D168:
	bl WaitForever2
_0233D16C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233D174: .word 0x0233EC28
	arm_func_end ov08_0233D0E4

	arm_func_start ov08_0233D178
ov08_0233D178: ; 0x0233D178
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov01_0232C0A0
	mov r2, #2
	ldr r1, _0233D1EC ; =0x0233EC28
	str r2, [sp]
	ldr r1, [r1, #4]
	mov r2, r0
	ldrh r3, [r1, #0x2a]
	ldr r0, _0233D1F0 ; =ov08_0233EC80
	add r1, r1, #0x14
	bl ov00_022C6EFC
	ldr r1, _0233D1EC ; =0x0233EC28
	mov r0, #0x100
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0xa]
	bl ov00_022C7150
	ldr r0, _0233D1F4 ; =ov08_0233D964
	bl ov00_022C3270
	ldr r0, _0233D1EC ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x32]
	bl ov00_022C74A0
	ldr r0, _0233D1EC ; =0x0233EC28
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D1EC: .word 0x0233EC28
_0233D1F0: .word ov08_0233EC80
_0233D1F4: .word ov08_0233D964
	arm_func_end ov08_0233D178

	arm_func_start ov08_0233D1F8
ov08_0233D1F8: ; 0x0233D1F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa0
	ldr r5, _0233D400 ; =0x0233EC28
	mov r7, #0
	str r3, [sp, #4]
	mov sb, r1
	mov sl, r0
	mov fp, r2
	mov r4, r7
	ldr r1, [r5, #4]
	b _0233D23C
_0233D224:
	add r0, r4, r4, lsl #4
	add r0, r1, r0, lsl #6
	ldr r0, [r0, #0x90]
	cmp r0, #0
	beq _0233D244
	add r4, r4, #1
_0233D23C:
	cmp r4, #3
	blt _0233D224
_0233D244:
	cmp r4, #3
	moveq r0, #0
	beq _0233D3F8
	bl sub_02025888
	mov r6, r0
	bl sub_02025888
	ldr r1, _0233D400 ; =0x0233EC28
	mov r5, r0
	ldr r1, [r1, #4]
	add r4, r4, r4, lsl #4
	add r1, r1, #0x54
	add r0, sp, #8
	add r8, r1, r4, lsl #6
	bl InitPreprocessorArgs
	ldr r0, [sb, #4]
	add r1, sp, #8
	str r0, [sp, #0x2c]
	str r1, [sp]
	mov r2, fp
	mov r0, r6
	mov r1, #0x100
	mov r3, #0x400
	bl PreprocessStringFromMessageId
	mov r1, r6
	add r0, r8, #0x40
	bl sub_020255D8
	ldr r2, [sp, #4]
	add r1, sp, #8
	str r1, [sp]
	mov r0, r5
	mov r1, #0x100
	mov r3, #0x400
	bl PreprocessStringFromMessageId
	add r0, r8, #0x240
	mov r1, r5
	bl sub_020255D8
	ldrh r2, [sp, #0xc8]
	mov r6, r0
	cmp r2, #0
	beq _0233D310
	mov r0, #0xa
	strh r0, [r6]
	add sb, sp, #8
	mov r0, r5
	mov r1, #0x100
	mov r3, #0x400
	str sb, [sp]
	bl PreprocessStringFromMessageId
	mov r1, r5
	add r0, r6, #2
	bl sub_020255D8
_0233D310:
	mov r6, r8
	mov r5, #3
_0233D318:
	ldmia sl!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0233D318
	ldmia sl, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	mov r0, #1
	bl ov01_0232C0A0
	str r0, [r8, #0x14]
	ldr r0, _0233D400 ; =0x0233EC28
	add r2, r8, #0x40
	ldr r0, [r0, #4]
	add r1, r8, #0x240
	ldrsh r3, [r0, #0xa]
	add r0, sp, #0x58
	strb r3, [r8, #0x18]
	str r2, [r8, #4]
	str r1, [r8, #8]
	bl FileInit
	ldr r1, [r8]
	add r0, sp, #0x58
	bl sub_0207F6C4
	cmp r0, #0
	beq _0233D3D4
	ldr r0, _0233D404 ; =0x00020100
	mov r1, #0
	bl MemAlloc
	movs r5, r0
	beq _0233D3D4
	ldr r2, _0233D404 ; =0x00020100
	add r0, sp, #0x58
	mov r1, r5
	bl ov00_022C4718
	cmp r0, #0
	bne _0233D3B0
	mov r0, r5
	bl MemFree
	b _0233D3D4
_0233D3B0:
	mov r0, r8
	mov r1, r5
	bl ov00_022C4C08
	cmp r0, #0
	ldrne r0, _0233D400 ; =0x0233EC28
	movne r7, #1
	ldrne r0, [r0, #4]
	addne r0, r0, r4, lsl #6
	strne r5, [r0, #0x90]
_0233D3D4:
	ldr r0, [sp, #0x64]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0233D3F4
	add r0, sp, #0x58
	bl sub_0207F70C
_0233D3F4:
	mov r0, r7
_0233D3F8:
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D400: .word 0x0233EC28
_0233D404: .word 0x00020100
	arm_func_end ov08_0233D1F8

	arm_func_start ov08_0233D408
ov08_0233D408: ; 0x0233D408
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _0233D5A4 ; =0x0233EC28
	ldr r0, [r4, #4]
	cmp r0, #0
	ldrneb r0, [r4, #2]
	cmpne r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	mov r7, #2
	mov r8, sb
	mov r6, #1
	mov sl, sb
	mov fp, #3
	mov r5, r7
	b _0233D594
_0233D448:
	ldr r1, [r4, #4]
	mov sb, #1
	ldr r0, [r1, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233D594
_0233D460: ; jump table
	b _0233D470 ; case 0
	b _0233D4E0 ; case 1
	b _0233D4F4 ; case 2
	b _0233D58C ; case 3
_0233D470:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0233D488
	ldrb r0, [r4]
	cmp r0, #0
	beq _0233D490
_0233D488:
	mov r0, #1
	b _0233D4A0
_0233D490:
	strb r8, [r4]
	bl ov00_022C759C
	mov r0, #0
	strb r0, [r4, #1]
_0233D4A0:
	cmp r0, #1
	bne _0233D4D0
	ldr r0, _0233D5A8 ; =0x0233EA70
	bl DebugPrint0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0xd14]
	cmp r0, #0
	beq _0233D4C4
	bl ov08_0233E16C
_0233D4C4:
	ldr r0, [r4, #4]
	str r7, [r0, #4]
	b _0233D4D8
_0233D4D0:
	ldr r0, [r4, #4]
	str r6, [r0, #4]
_0233D4D8:
	mov sb, #0
	b _0233D594
_0233D4E0:
	ldrb r0, [r4]
	cmp r0, #0
	strne r5, [r1, #4]
	movne sb, #0
	b _0233D594
_0233D4F4:
	ldrb r0, [r4, #2]
	cmp r0, #0
	moveq r0, sb
	beq _0233D578
	bl ov08_0233DC88
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0233D570
_0233D514: ; jump table
	b _0233D55C ; case 0
	b _0233D53C ; case 1
	b _0233D570 ; case 2
	b _0233D574 ; case 3
	b _0233D570 ; case 4
	b _0233D570 ; case 5
	b _0233D570 ; case 6
	b _0233D54C ; case 7
	b _0233D570 ; case 8
	b _0233D568 ; case 9
_0233D53C:
	ldr r0, _0233D5AC ; =0x0233EA94
	bl DebugPrint0
	bl ov08_0233E1D8
	b _0233D574
_0233D54C:
	ldr r0, _0233D5B0 ; =0x0233EAA4
	bl DebugPrint0
	bl ov08_0233E16C
	b _0233D574
_0233D55C:
	strb sl, [r4, #2]
	mov r0, sb
	b _0233D578
_0233D568:
	bl ov08_0233E16C
	b _0233D574
_0233D570:
	bl WaitForever2
_0233D574:
	mov r0, #0
_0233D578:
	cmp r0, #0
	ldrne r0, [r4, #4]
	movne sb, #0
	strne fp, [r0, #4]
	b _0233D594
_0233D58C:
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0233D594:
	cmp sb, #0
	beq _0233D448
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233D5A4: .word 0x0233EC28
_0233D5A8: .word 0x0233EA70
_0233D5AC: .word 0x0233EA94
_0233D5B0: .word 0x0233EAA4
	arm_func_end ov08_0233D408

	arm_func_start ov08_0233D5B4
ov08_0233D5B4: ; 0x0233D5B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _0233D62C ; =0x0233EC28
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _0233D61C
	mov r4, #0
	mov r7, r4
_0233D5D0:
	ldr r0, [r6, #4]
	add r5, r4, r4, lsl #4
	add r0, r0, r5, lsl #6
	ldr r0, [r0, #0x90]
	cmp r0, #0
	beq _0233D5F8
	bl MemFree
	ldr r0, [r6, #4]
	add r0, r0, r5, lsl #6
	str r7, [r0, #0x90]
_0233D5F8:
	add r4, r4, #1
	cmp r4, #3
	blt _0233D5D0
	ldr r0, _0233D62C ; =0x0233EC28
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0233D62C ; =0x0233EC28
	mov r1, #0
	str r1, [r0, #4]
_0233D61C:
	ldr r0, _0233D62C ; =0x0233EC28
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233D62C: .word 0x0233EC28
	arm_func_end ov08_0233D5B4

	arm_func_start ov08_0233D630
ov08_0233D630: ; 0x0233D630
	ldr r0, _0233D640 ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0233D640: .word 0x0233EC28
	arm_func_end ov08_0233D630

	arm_func_start ov08_0233D644
ov08_0233D644: ; 0x0233D644
	ldr r1, _0233D668 ; =0x0233EC28
	mov r0, #0
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	tst r1, #8
	addne r0, r0, #1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	bx lr
	.align 2, 0
_0233D668: .word 0x0233EC28
	arm_func_end ov08_0233D644

	arm_func_start ov08_0233D66C
ov08_0233D66C: ; 0x0233D66C
	stmdb sp!, {r3, lr}
	ldr r0, _0233D6BC ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	cmp r0, #0
	beq _0233D6B4
	bl ov00_022C3298
	cmp r0, #7
	bne _0233D6B4
	ldr r0, _0233D6BC ; =0x0233EC28
	mov r1, #3
	ldr r3, [r0, #4]
	ldrb r2, [r3, #0x12]
	orr r2, r2, #8
	strb r2, [r3, #0x12]
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	bl ov00_022C33BC
_0233D6B4:
	bl ov08_0233D644
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D6BC: .word 0x0233EC28
	arm_func_end ov08_0233D66C

	arm_func_start ov08_0233D6C0
ov08_0233D6C0: ; 0x0233D6C0
	ldr r1, _0233D6E4 ; =0x0233EC28
	mov r0, #0
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	tst r1, #2
	addne r0, r0, #1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	bx lr
	.align 2, 0
_0233D6E4: .word 0x0233EC28
	arm_func_end ov08_0233D6C0

	arm_func_start ov08_0233D6E8
ov08_0233D6E8: ; 0x0233D6E8
	stmdb sp!, {r3, lr}
	ldr r0, _0233D738 ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	cmp r0, #0
	beq _0233D730
	bl ov00_022C3298
	cmp r0, #0xe
	bne _0233D730
	ldr r0, _0233D738 ; =0x0233EC28
	mov r1, #2
	ldr r3, [r0, #4]
	ldrb r2, [r3, #0x12]
	orr r2, r2, #2
	strb r2, [r3, #0x12]
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	bl ov00_022C33BC
_0233D730:
	bl ov08_0233D6C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D738: .word 0x0233EC28
	arm_func_end ov08_0233D6E8

	arm_func_start ov08_02003B5C
ov08_02003B5C: ; 0x0233D73C
	ldr ip, _0233D744 ; =sub_02003B5C
	bx ip
	.align 2, 0
_0233D744: .word sub_02003B5C
	arm_func_end ov08_02003B5C

	arm_func_start ov08_02003B94
ov08_02003B94: ; 0x0233D748
	ldr ip, _0233D750 ; =sub_02003B94
	bx ip
	.align 2, 0
_0233D750: .word sub_02003B94
	arm_func_end ov08_02003B94

	arm_func_start ov08_02003BC8
ov08_02003BC8: ; 0x0233D754
	ldr ip, _0233D75C ; =sub_02003BC8
	bx ip
	.align 2, 0
_0233D75C: .word sub_02003BC8
	arm_func_end ov08_02003BC8

	arm_func_start ov08_0233D760
ov08_0233D760: ; 0x0233D760
	ldr r1, _0233D784 ; =0x0233EC28
	mov r0, #0
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	tst r1, #1
	addne r0, r0, #1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	bx lr
	.align 2, 0
_0233D784: .word 0x0233EC28
	arm_func_end ov08_0233D760

	arm_func_start ov08_0233D788
ov08_0233D788: ; 0x0233D788
	stmdb sp!, {r3, lr}
	ldr r0, _0233D814 ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	cmp r0, #0
	beq _0233D80C
	bl ov00_022C3298
	cmp r0, #0xa
	bne _0233D80C
	ldr r0, _0233D814 ; =0x0233EC28
	mov r1, #1
	ldr r3, [r0, #4]
	ldrb r2, [r3, #0x12]
	orr r2, r2, #1
	strb r2, [r3, #0x12]
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	bl ov00_022C33BC
	ldr r0, _0233D814 ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	bl ov00_022C32E4
	cmp r0, #0
	beq _0233D7FC
	ldr r1, _0233D814 ; =0x0233EC28
	mov r2, #0x16
	ldr r1, [r1, #4]
	add r1, r1, #0x34
	bl sub_0207C4C8
_0233D7FC:
	ldr r0, _0233D814 ; =0x0233EC28
	ldr r1, [r0, #4]
	ldrh r0, [r1, #0xe]
	strh r0, [r1, #0x50]
_0233D80C:
	bl ov08_0233D760
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D814: .word 0x0233EC28
	arm_func_end ov08_0233D788

	arm_func_start ov08_0233D818
ov08_0233D818: ; 0x0233D818
	ldr r1, _0233D83C ; =0x0233EC28
	mov r0, #0
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	tst r1, #4
	addne r0, r0, #1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	bx lr
	.align 2, 0
_0233D83C: .word 0x0233EC28
	arm_func_end ov08_0233D818

	arm_func_start ov08_0233D840
ov08_0233D840: ; 0x0233D840
	ldr r0, _0233D850 ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0233D850: .word 0x0233EC28
	arm_func_end ov08_0233D840

	arm_func_start ov08_0233D854
ov08_0233D854: ; 0x0233D854
	stmdb sp!, {r4, lr}
	ldr r0, _0233D890 ; =0x0233EC28
	mov r4, #0
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	cmp r0, #0
	beq _0233D888
	bl ov00_022C75D8
	ldr r0, _0233D890 ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0xe]
	bl ov08_0233D894
	add r4, r4, #1
_0233D888:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233D890: .word 0x0233EC28
	arm_func_end ov08_0233D854

	arm_func_start ov08_0233D894
ov08_0233D894: ; 0x0233D894
	stmdb sp!, {r3, lr}
	ldr r1, _0233D908 ; =0x0233EC28
	mov ip, #0
	ldr lr, [r1, #4]
	ldrh r3, [lr, #0xc]
	b _0233D8F8
_0233D8AC:
	add r2, lr, ip, lsl #1
	ldrh r1, [r2, #0xe]
	cmp r0, r1
	bne _0233D8EC
	ldr r1, _0233D908 ; =0x0233EC28
	mov r3, #0
	strh r3, [r2, #0xe]
	ldr r2, [r1, #4]
	mov r0, #1
	add r2, r2, ip
	strb r3, [r2, #0x12]
	ldr r2, [r1, #4]
	ldrsh r1, [r2, #0x10]
	sub r1, r1, #1
	strh r1, [r2, #0x10]
	ldmia sp!, {r3, pc}
_0233D8EC:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
_0233D8F8:
	cmp ip, r3
	blo _0233D8AC
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233D908: .word 0x0233EC28
	arm_func_end ov08_0233D894

	arm_func_start ov08_0233D90C
ov08_0233D90C: ; 0x0233D90C
	ldr r2, _0233D950 ; =0x0233EC28
	ldr r3, [r2, #4]
	add r2, r3, r1, lsl #1
	ldrh r2, [r2, #0xe]
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	mov r2, #0x1e
	mla r2, r1, r2, r3
	add r3, r2, #0x34
	mov r2, #0xb
_0233D938:
	ldrh r1, [r3], #2
	subs r2, r2, #1
	strh r1, [r0], #2
	bne _0233D938
	mov r0, #1
	bx lr
	.align 2, 0
_0233D950: .word 0x0233EC28
	arm_func_end ov08_0233D90C

	arm_func_start ov08_0233D954
ov08_0233D954: ; 0x0233D954
	ldr r0, _0233D960 ; =0x0233EC28
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_0233D960: .word 0x0233EC28
	arm_func_end ov08_0233D954

	arm_func_start ov08_0233D964
ov08_0233D964: ; 0x0233D964
	stmdb sp!, {r4, lr}
	cmp r1, #0xc
	mov r4, r0
	ldreq r0, _0233DB5C ; =0x0233EC28
	moveq r1, #1
	streqb r1, [r0]
	ldmeqia sp!, {r4, pc}
	ldr r3, _0233DB5C ; =0x0233EC28
	ldr ip, [r3, #4]
	cmp ip, #0
	ldmeqia sp!, {r4, pc}
	strh r1, [ip, #0x30]
	cmp r1, #0xe
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r4, pc}
_0233D9A0: ; jump table
	ldmia sp!, {r4, pc} ; case 0
	ldmia sp!, {r4, pc} ; case 1
	ldmia sp!, {r4, pc} ; case 2
	b _0233D9DC ; case 3
	ldmia sp!, {r4, pc} ; case 4
	ldmia sp!, {r4, pc} ; case 5
	ldmia sp!, {r4, pc} ; case 6
	b _0233D9E4 ; case 7
	ldmia sp!, {r4, pc} ; case 8
	ldmia sp!, {r4, pc} ; case 9
	b _0233DA60 ; case 10
	b _0233DB2C ; case 11
	b _0233DB34 ; case 12
	ldmia sp!, {r4, pc} ; case 13
	b _0233DB40 ; case 14
_0233D9DC:
	bl ov08_0233D894
	ldmia sp!, {r4, pc}
_0233D9E4:
	ldr r1, [r3, #4]
	mov r2, #0
	b _0233DA1C
_0233D9F0:
	add r0, r1, r2, lsl #1
	ldrh r0, [r0, #0xe]
	cmp r4, r0
	addeq r1, r1, #0x12
	ldreqb r0, [r1, r2]
	orreq r0, r0, #4
	streqb r0, [r1, r2]
	beq _0233DA24
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_0233DA1C:
	cmp r2, #1
	blt _0233D9F0
_0233DA24:
	ldr r0, _0233DB5C ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x2e]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #3
	bl ov00_022C33BC
	ldr r0, _0233DB5C ; =0x0233EC28
	ldr r0, [r0, #4]
	add r1, r0, #0x12
	ldrb r0, [r1, r4]
	orr r0, r0, #8
	strb r0, [r1, r4]
	ldmia sp!, {r4, pc}
_0233DA60:
	ldr ip, [r3, #4]
	mov lr, #0
	ldrh r3, [ip, #0xc]
	b _0233DAF0
_0233DA70:
	add r1, ip, lr, lsl #1
	ldrh r0, [r1, #0xe]
	cmp r0, #0
	bne _0233DAE4
	mov r0, #0x1e
	mul ip, lr, r0
	strh r4, [r1, #0xe]
	ldr r1, _0233DB5C ; =0x0233EC28
	ldrb r3, [r2, #0xa]
	ldr lr, [r1, #4]
	mov r0, #1
	add lr, lr, #0x4a
	strb r3, [lr, ip]
	ldrb r3, [r2, #0xb]
	add ip, lr, ip
	strb r3, [ip, #1]
	ldrb r3, [r2, #0xc]
	strb r3, [ip, #2]
	ldrb r3, [r2, #0xd]
	strb r3, [ip, #3]
	ldrb r3, [r2, #0xe]
	strb r3, [ip, #4]
	ldrb r2, [r2, #0xf]
	strb r2, [ip, #5]
	ldr r2, [r1, #4]
	ldrsh r1, [r2, #0x10]
	add r1, r1, #1
	strh r1, [r2, #0x10]
	b _0233DAFC
_0233DAE4:
	add r0, lr, #1
	mov r0, r0, lsl #0x10
	mov lr, r0, lsr #0x10
_0233DAF0:
	cmp lr, r3
	blo _0233DA70
	mov r0, #0
_0233DAFC:
	cmp r0, #0
	bne _0233DB10
	mov r0, r4
	bl ov00_022C75D8
	ldmia sp!, {r4, pc}
_0233DB10:
	ldr r0, _0233DB5C ; =0x0233EC28
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x2c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov08_0233D788
	ldmia sp!, {r4, pc}
_0233DB2C:
	bl ov00_022C75D8
	ldmia sp!, {r4, pc}
_0233DB34:
	mov r0, #1
	strb r0, [r3]
	ldmia sp!, {r4, pc}
_0233DB40:
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x2d]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #2
	bl ov00_022C33BC
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233DB5C: .word 0x0233EC28
	arm_func_end ov08_0233D964

	arm_func_start ov08_0233DB60
ov08_0233DB60: ; 0x0233DB60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0233DBD0 ; =0x0233EC30
	mov r5, r0
	ldr r2, [r1, #0x24]
	ldr r4, [r1, #0xc]
	cmp r2, #0
	beq _0233DB8C
	ldr r1, _0233DBD4 ; =0x0233EC58
	ldr r0, _0233DBD8 ; =0x0233EBA4
	ldr r1, [r1, r4, lsl #2]
	blx r2
_0233DB8C:
	ldr r0, _0233DBD0 ; =0x0233EC30
	str r5, [r0, #0xc]
	ldr r2, [r0, #0x24]
	cmp r2, #0
	beq _0233DBB0
	ldr r1, _0233DBD4 ; =0x0233EC58
	ldr r0, _0233DBDC ; =0x0233EBAC
	ldr r1, [r1, r5, lsl #2]
	blx r2
_0233DBB0:
	ldr r0, _0233DBD0 ; =0x0233EC30
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r0, #0xc]
	mov r1, r4
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233DBD0: .word 0x0233EC30
_0233DBD4: .word 0x0233EC58
_0233DBD8: .word 0x0233EBA4
_0233DBDC: .word 0x0233EBAC
	arm_func_end ov08_0233DB60

	arm_func_start ov08_0233DBE0
ov08_0233DBE0: ; 0x0233DBE0
	ldr r1, _0233DBFC ; =0x0233EC30
	ldr r1, [r1, #0xc]
	sub r1, r1, #9
	cmp r1, #1
	ldrhi r1, _0233DC00 ; =0x0234AC80
	strhi r0, [r1, #0x20]
	bx lr
	.align 2, 0
_0233DBFC: .word 0x0233EC30
_0233DC00: .word 0x0234AC80
	arm_func_end ov08_0233DBE0

	arm_func_start ov08_0233DC04
ov08_0233DC04: ; 0x0233DC04
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r1, [r4, #2]
	cmp r1, #0
	beq _0233DC2C
	mov r0, #9
	bl ov08_0233DB60
	ldrh r0, [r4, #2]
	bl ov08_0233DBE0
	ldmia sp!, {r4, pc}
_0233DC2C:
	ldr r1, _0233DC4C ; =0x0233EC30
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _0233DC40
	blx r1
_0233DC40:
	mov r0, #1
	bl ov08_0233DB60
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233DC4C: .word 0x0233EC30
	arm_func_end ov08_0233DC04

	arm_func_start ov08_0233DC50
ov08_0233DC50: ; 0x0233DC50
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0233DC6C
	mov r0, #0xa
	bl ov08_0233DB60
	ldmia sp!, {r3, pc}
_0233DC6C:
	mov r0, #0
	bl ov08_0233DB60
	ldmia sp!, {r3, pc}
	arm_func_end ov08_0233DC50

	arm_func_start ov08_0233DC78
ov08_0233DC78: ; 0x0233DC78
	ldr r1, _0233DC84 ; =0x0234AD00
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0233DC84: .word 0x0234AD00
	arm_func_end ov08_0233DC78

	arm_func_start ov08_0233DC88
ov08_0233DC88: ; 0x0233DC88
	ldr r0, _0233DC94 ; =0x0233EC30
	ldr r0, [r0, #0xc]
	bx lr
	.align 2, 0
_0233DC94: .word 0x0233EC30
	arm_func_end ov08_0233DC88

	arm_func_start ov08_0233DC98
ov08_0233DC98: ; 0x0233DC98
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl sub_0207B9EC
	ldr r1, _0233DD44 ; =0x027FFC3C
	ldrh r0, [sp]
	ldr r2, [r1]
	ldrh r1, [sp, #2]
	add r0, r0, r2
	ldrh r2, [sp, #4]
	add r1, r1, r0
	ldr r0, _0233DD48 ; =0x00010DCD
	add r1, r2, r1
	mul r0, r1, r0
	add r0, r0, #0x39
	ldr r1, _0233DD4C ; =0x0234AC80
	add r0, r0, #0x3000
	str r0, [r1, #0x14]
	mov r0, #0
	strh r0, [r1, #0xc]
	mov r2, #0x65
	mov r0, #3
	strh r2, [r1, #8]
	bl ov08_0233DB60
	mov r0, #1
	bl ov08_0233DD50
	cmp r0, #0x18
	bne _0233DD20
	mov r0, #0x18
	bl ov08_0233DBE0
	mov r0, #9
	bl ov08_0233DB60
	mov r0, #0
	b _0233DD3C
_0233DD20:
	cmp r0, #2
	moveq r0, #1
	beq _0233DD3C
	bl ov08_0233DBE0
	mov r0, #9
	bl ov08_0233DB60
	mov r0, #0
_0233DD3C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233DD44: .word 0x027FFC3C
_0233DD48: .word 0x00010DCD
_0233DD4C: .word 0x0234AC80
	arm_func_end ov08_0233DC98

	arm_func_start ov08_0233DD50
ov08_0233DD50: ; 0x0233DD50
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov00_022BF640
	cmp r0, #0x8000
	bne _0233DD80
	mov r0, #3
	bl ov08_0233DBE0
	mov r0, #9
	bl ov08_0233DB60
	mov r0, #3
	b _0233DDF0
_0233DD80:
	cmp r0, #0
	bne _0233DDA0
	mov r0, #0x16
	bl ov08_0233DBE0
	mov r0, #9
	bl ov08_0233DB60
	mov r0, #0x18
	b _0233DDF0
_0233DDA0:
	mov r2, #1
	b _0233DDC0
_0233DDA8:
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, lsr #0x10
	cmp r4, #0x10
	movhi r0, #0x18
	bhi _0233DDF0
_0233DDC0:
	sub r1, r4, #1
	tst r0, r2, lsl r1
	beq _0233DDA8
	ldr r0, _0233DDF8 ; =ov08_0233DDFC
	mov ip, #0x1e
	mov r3, r4
	mov r1, #3
	mov r2, #0x11
	str ip, [sp]
	bl ov00_022C1610
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_0233DDF0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0233DDF8: .word ov08_0233DDFC
	arm_func_end ov08_0233DD50

	arm_func_start ov08_0233DDFC
ov08_0233DDFC: ; 0x0233DDFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0233DE20
	bl ov08_0233DBE0
	mov r0, #9
	bl ov08_0233DB60
	ldmia sp!, {r4, pc}
_0233DE20:
	ldr r0, _0233DEBC ; =0x0233EC30
	ldr r3, [r0, #0x24]
	cmp r3, #0
	beq _0233DE40
	ldrh r1, [r4, #8]
	ldrh r2, [r4, #0xa]
	ldr r0, _0233DEC0 ; =0x0233EBB0
	blx r3
_0233DE40:
	ldr r0, _0233DEC4 ; =0x0234AC80
	ldrh r3, [r4, #0xa]
	ldrh r1, [r0, #8]
	ldrh ip, [r4, #8]
	cmp r1, r3
	bls _0233DE70
	sub r1, ip, #1
	mov r2, #1
	mov r1, r2, lsl r1
	strh r3, [r0, #8]
	strh r1, [r0, #2]
	b _0233DE84
_0233DE70:
	ldreqh r3, [r0, #2]
	subeq r1, ip, #1
	moveq r2, #1
	orreq r1, r3, r2, lsl r1
	streqh r1, [r0, #2]
_0233DE84:
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov08_0233DD50
	cmp r0, #0x18
	bne _0233DEA8
	mov r0, #7
	bl ov08_0233DB60
	ldmia sp!, {r4, pc}
_0233DEA8:
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	mov r0, #9
	bl ov08_0233DB60
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233DEBC: .word 0x0233EC30
_0233DEC0: .word 0x0233EBB0
_0233DEC4: .word 0x0234AC80
	arm_func_end ov08_0233DDFC

	arm_func_start ov08_0233DEC8
ov08_0233DEC8: ; 0x0233DEC8
	stmdb sp!, {r3, lr}
	ldr r0, _0233DFE8 ; =0x0233EC30
	ldr r0, [r0, #0xc]
	cmp r0, #7
	beq _0233DEE0
	bl WaitForever2
_0233DEE0:
	mov r0, #1
	bl ov08_0233DB60
	mov r3, #0
	ldr r1, _0233DFEC ; =0x0234AC80
	mov r0, r3
	ldrh r1, [r1, #2]
	mov lr, r3
	mov ip, #1
_0233DF00:
	tst r1, ip, lsl lr
	beq _0233DF20
	add r3, lr, #1
	add r2, r0, #1
	mov r0, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r0, asr #0x10
	mov r0, r2, lsr #0x10
_0233DF20:
	add r2, lr, #1
	mov r2, r2, lsl #0x10
	mov lr, r2, asr #0x10
	cmp lr, #0x10
	blt _0233DF00
	cmp r0, #1
	bls _0233DFB8
	ldr ip, _0233DFEC ; =0x0234AC80
	ldr r3, _0233DFF0 ; =0x00010DCD
	ldr lr, [ip, #0x14]
	mov r2, #0
	mul r3, lr, r3
	add r3, r3, #0x39
	add lr, r3, #0x3000
	and r3, lr, #0xff
	mul r3, r0, r3
	mov r0, r3, lsl #8
	str lr, [ip, #0x14]
	mov r3, r0, lsr #0x10
	b _0233DFAC
_0233DF70:
	tst r1, #1
	beq _0233DF98
	cmp r3, #0
	addeq r0, r2, #1
	moveq r0, r0, lsl #0x10
	moveq r3, r0, asr #0x10
	beq _0233DFB8
	sub r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
_0233DF98:
	add r2, r2, #1
	mov r0, r1, lsl #0xf
	mov r2, r2, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r2, r2, asr #0x10
_0233DFAC:
	cmp r2, #0x10
	blt _0233DF70
	mov r3, #0
_0233DFB8:
	ldr r0, _0233DFE8 ; =0x0233EC30
	ldr r1, _0233DFEC ; =0x0234AC80
	ldr r2, [r0, #0x24]
	strh r3, [r1, #0xc]
	cmp r2, #0
	beq _0233DFDC
	ldrh r1, [r1, #0xc]
	ldr r0, _0233DFF4 ; =0x0233EBCC
	blx r2
_0233DFDC:
	ldr r0, _0233DFEC ; =0x0234AC80
	ldrh r0, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233DFE8: .word 0x0233EC30
_0233DFEC: .word 0x0234AC80
_0233DFF0: .word 0x00010DCD
_0233DFF4: .word 0x0233EBCC
	arm_func_end ov08_0233DEC8

	arm_func_start ov08_0233DFF8
ov08_0233DFF8: ; 0x0233DFF8
	stmdb sp!, {r3, lr}
	ldr r0, _0233E0D4 ; =0x0233EC30
	ldrh r1, [r0]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r1, [r0, #0x18]
	mov r2, #1
	cmp r1, #0
	ldreq r1, _0233E0D8 ; =ov08_0233E0F8
	ldr r3, _0233E0DC ; =0x0234AD00
	streq r1, [r0, #0x18]
	ldr r0, _0233E0E0 ; =0x0234AC80
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x24]
	str r1, [r0, #0x18]
	strh r1, [r0, #4]
	strh r2, [r0]
	str r1, [r0, #0x20]
	str r1, [r3]
	ldr r0, _0233E0E4 ; =0x0234AE00
	mov r2, #0x400
	strh r1, [r3, #4]
	bl sub_0207C40C
	ldr r0, _0233E0E8 ; =0x0234AD40
	mov r1, #0
	mov r2, #0xc0
	bl sub_0207C40C
	ldr r0, _0233E0EC ; =0x0234ACD4
	mov r1, #0
	mov r2, #0x18
	bl sub_0207C40C
	ldr r1, _0233E0E0 ; =0x0234AC80
	mov r2, #0
	mov r0, #3
	str r2, [r1, #0x28]
	bl ov08_0233DB60
	ldr r0, _0233E0F0 ; =0x0234BA20
	ldr r1, _0233E0F4 ; =ov08_0233E118
	mov r2, #2
	bl ov00_022BFB14
	cmp r0, #2
	moveq r0, #1
	beq _0233E0BC
	bl ov08_0233DBE0
	mov r0, #0xa
	bl ov08_0233DB60
	mov r0, #0
_0233E0BC:
	cmp r0, #0
	moveq r0, #0
	ldrne r1, _0233E0D4 ; =0x0233EC30
	movne r0, #1
	strneh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E0D4: .word 0x0233EC30
_0233E0D8: .word ov08_0233E0F8
_0233E0DC: .word 0x0234AD00
_0233E0E0: .word 0x0234AC80
_0233E0E4: .word 0x0234AE00
_0233E0E8: .word 0x0234AD40
_0233E0EC: .word 0x0234ACD4
_0233E0F0: .word 0x0234BA20
_0233E0F4: .word ov08_0233E118
	arm_func_end ov08_0233DFF8

	arm_func_start ov08_0233E0F8
ov08_0233E0F8: ; 0x0233E0F8
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	ldmneia sp!, {r3, pc}
	mov r0, #9
	bl ov08_0233DB60
	bl WaitForever2
	ldmia sp!, {r3, pc}
	arm_func_end ov08_0233E0F8

	arm_func_start ov08_0233E118
ov08_0233E118: ; 0x0233E118
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0233E138
	bl ov08_0233DBE0
	mov r0, #0xa
	bl ov08_0233DB60
	ldmia sp!, {r3, pc}
_0233E138:
	ldr r0, _0233E168 ; =0x0233EC30
	ldr r0, [r0, #0x18]
	bl ov00_022BF2C4
	cmp r0, #0
	beq _0233E15C
	bl ov08_0233DBE0
	mov r0, #0xa
	bl ov08_0233DB60
	ldmia sp!, {r3, pc}
_0233E15C:
	mov r0, #1
	bl ov08_0233DB60
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E168: .word 0x0233EC30
	arm_func_end ov08_0233E118

	arm_func_start ov08_0233E16C
ov08_0233E16C: ; 0x0233E16C
	stmdb sp!, {r3, lr}
	ldr r0, _0233E1CC ; =0x0233EC30
	ldr r0, [r0, #0xc]
	cmp r0, #5
	bne _0233E194
	ldr r0, _0233E1D0 ; =0x0234B200
	bl ov00_022C0A64
	cmp r0, #0
	beq _0233E194
	bl ov08_0233DBE0
_0233E194:
	mov r0, #3
	bl ov08_0233DB60
	ldr r0, _0233E1D4 ; =ov08_0233DC04
	bl ov00_022BFB9C
	cmp r0, #2
	moveq r0, #1
	beq _0233E1B8
	bl ov08_0233DBE0
	mov r0, #0
_0233E1B8:
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0xa
	bl ov08_0233DB60
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E1CC: .word 0x0233EC30
_0233E1D0: .word 0x0234B200
_0233E1D4: .word ov08_0233DC04
	arm_func_end ov08_0233E16C

	arm_func_start ov08_0233E1D8
ov08_0233E1D8: ; 0x0233E1D8
	stmdb sp!, {r3, lr}
	ldr r0, _0233E228 ; =0x0233EC30
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _0233E1F0
	bl WaitForever2
_0233E1F0:
	mov r0, #3
	bl ov08_0233DB60
	ldr r0, _0233E22C ; =ov08_0233DC50
	bl ov00_022BFBD4
	cmp r0, #2
	ldreq r0, _0233E228 ; =0x0233EC30
	moveq r1, #0
	streqh r1, [r0]
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	mov r0, #9
	bl ov08_0233DB60
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E228: .word 0x0233EC30
_0233E22C: .word ov08_0233DC50
	arm_func_end ov08_0233E1D8

	arm_func_start ov08_0233E230
ov08_0233E230: ; 0x0233E230
	stmdb sp!, {r3, lr}
	mov r0, #0xec
	mov r1, #8
	bl MemAlloc
	ldr r2, _0233E2B8 ; =0x0234C920
	mov r1, #0xec
	str r0, [r2]
	bl MemZero
	mov r2, #0
	ldr r0, _0233E2B8 ; =0x0234C920
	mov r3, r2
_0233E25C:
	ldr r1, [r0]
	add r1, r1, r2
	add r2, r2, #1
	strb r3, [r1, #4]
	cmp r2, #4
	blt _0233E25C
	ldr r0, _0233E2B8 ; =0x0234C920
	ldr r2, [r0]
	add r1, r2, #4
	str r1, [r2, #0x68]
	ldr r1, [r0]
	str r3, [r1]
	ldr r1, [r0]
	strb r3, [r1, #0xe0]
	ldr r1, [r0]
	strb r3, [r1, #0xe1]
	ldr r1, [r0]
	str r3, [r1, #0xe4]
	ldr r0, [r0]
	str r3, [r0, #0xe8]
	bl sub_02046D20
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E2B8: .word 0x0234C920
	arm_func_end ov08_0233E230

	arm_func_start ov08_0233E2BC
ov08_0233E2BC: ; 0x0233E2BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc4
	ldr r0, _0233E7C8 ; =0x0234C920
	mov r6, #0
	ldr r5, [r0]
	ldr r0, _0233E7CC ; =0x000004E2
	mov r7, r6
	sub r0, r0, #1
	str r0, [sp, #8]
	ldr r0, _0233E7CC ; =0x000004E2
	mov sb, r6
	sub r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _0233E7CC ; =0x000004E2
	add r4, r5, #0xa0
	rsb sl, r0, #0x4e0
	mvn fp, #2
	b _0233E7B4
_0233E304:
	mov sb, #1
	mov r8, #0
	bl ov08_02003B5C
	cmp r0, #0
	movne r7, sb
	bl ov08_0233CDA4
	cmp r0, #0
	beq _0233E354
	bl ov08_0233CB38
	mov r6, r0
	cmp r7, #0
	beq _0233E398
	mov r8, #1
	bl sub_02003BEC
	cmp r0, #0
	beq _0233E398
	mov r0, r5
	mov r1, #0xb
	bl ov08_0233E844
	b _0233E398
_0233E354:
	ldr r0, [r5]
	sub r0, r0, #4
	cmp r0, #1
	bhi _0233E398
	bl ov08_02003B5C
	cmp r0, #0
	bne _0233E37C
	bl ov08_0233E874
	cmp r0, #0
	beq _0233E398
_0233E37C:
	bl ov08_02003BC8
	bl sub_02003BEC
	cmp r0, #0
	beq _0233E398
	mov r0, r5
	mov r1, #0xc
	bl ov08_0233E844
_0233E398:
	bl sub_02003BFC
	bl ov08_0233CE7C
	ldr r0, [r5]
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0233E7B4
_0233E3B0: ; jump table
	b _0233E3F0 ; case 0
	b _0233E418 ; case 1
	b _0233E434 ; case 2
	b _0233E45C ; case 3
	b _0233E490 ; case 4
	b _0233E4C8 ; case 5
	b _0233E4E8 ; case 6
	b _0233E518 ; case 7
	b _0233E544 ; case 8
	b _0233E638 ; case 9
	b _0233E674 ; case 10
	b _0233E710 ; case 11
	b _0233E74C ; case 12
	b _0233E780 ; case 13
	b _0233E6F8 ; case 14
	b _0233E79C ; case 15
_0233E3F0:
	bl ov08_0233CE14
	ldr r1, _0233E7CC ; =0x000004E2
	mov r0, #0x1c
	add r1, r1, #3
	mov r2, #0
	bl sub_02046BE8
	mov r0, r5
	mov r1, #1
	bl ov08_0233E844
	b _0233E7B4
_0233E418:
	bl sub_02046C78
	cmp r0, #0
	beq _0233E7B4
	mov r0, r5
	mov r1, #2
	bl ov08_0233E844
	b _0233E7B4
_0233E434:
	mov r0, #0
	ldr r2, _0233E7D0 ; =0x0233EBE4
	ldr r3, [sp, #4]
	mov r1, r0
	str r0, [sp]
	bl sub_02046A9C
	mov r0, r5
	mov r1, #3
	bl ov08_0233E844
	b _0233E7B4
_0233E45C:
	bl sub_02046B04
	cmp r0, sl
	bne _0233E478
	mov r0, r5
	mov r1, #0xf
	bl ov08_0233E844
	b _0233E7B4
_0233E478:
	cmp r0, fp
	bne _0233E7B4
	mov r0, r5
	mov r1, #4
	bl ov08_0233E844
	b _0233E7B4
_0233E490:
	bl ov08_02003B94
	mov r0, #1
	bl ov08_0233CE6C
	mov r0, #0
	mov r1, #0x4e0
	mov r2, r0
	bl sub_02046BE8
	mov r0, r5
	mov r1, #5
	bl ov08_0233E844
	bl sub_020037A4
	add r0, r0, #0x1e
	str r0, [r5, #0xe8]
	b _0233E7B4
_0233E4C8:
	bl sub_020037A4
	ldr r1, [r5, #0xe8]
	cmp r0, r1
	ble _0233E7B4
	mov r0, r5
	mov r1, #6
	bl ov08_0233E844
	b _0233E7B4
_0233E4E8:
	bl Rand16Bit
	ldr r1, _0233E7D4 ; =0x00003FFF
	and r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #1
	bl ov08_0233CA80
	mov r0, r5
	mov r1, #8
	bl ov08_0233E844
	mov sb, #0
	b _0233E7B4
_0233E518:
	mov r0, #0
	mov r1, #0x4e0
	mov r2, r0
	bl sub_02046BE8
	mov r0, #0
	strb r0, [r5, #0xe1]
	mov r0, r5
	mov r1, #8
	bl ov08_0233E844
	mov sb, #0
	b _0233E7B4
_0233E544:
	bl sub_02046C78
	bl ov08_0233E874
	cmp r0, #0
	cmpeq r8, #0
	beq _0233E5A0
	ldrb r0, [r5, #0xe1]
	cmp r0, #0
	beq _0233E568
	bl ov08_0233CCF8
_0233E568:
	cmp r7, #0
	bne _0233E57C
	ldrb r0, [r5, #0xe1]
	cmp r0, #0
	bne _0233E58C
_0233E57C:
	mov r0, r5
	mov r1, #0xb
	bl ov08_0233E844
	b _0233E7B4
_0233E58C:
	ldr r1, _0233E7CC ; =0x000004E2
	mov r0, r5
	mov r2, #0
	bl ov08_0233E810
	b _0233E7B4
_0233E5A0:
	cmp r6, #1
	bne _0233E5F4
	add r0, sp, #0xc
	mov r1, #0
	bl ov08_0233D90C
	add r0, sp, #0x74
	bl InitPreprocessorArgs
	mov r0, r4
	add r1, sp, #0xe
	mov r2, #0xa
	str r4, [sp, #0xac]
	bl sub_020256FC
	mov r1, #0
	strb r1, [r0]
	mov r0, r1
	ldr r1, [sp, #8]
	add r2, sp, #0x74
	bl sub_02046BE8
	mov r0, #1
	strb r0, [r5, #0xe1]
	b _0233E7B4
_0233E5F4:
	cmp r6, #4
	bne _0233E618
	bl sub_020037A4
	add r0, r0, #0x78
	str r0, [r5, #0xe4]
	mov r0, r5
	mov r1, #9
	bl ov08_0233E844
	b _0233E7B4
_0233E618:
	cmp r6, #2
	bne _0233E7B4
	ldr r1, _0233E7CC ; =0x000004E2
	mov r0, r5
	add r1, r1, #2
	mov r2, #0
	bl ov08_0233E810
	b _0233E7B4
_0233E638:
	bl sub_020037A4
	ldr r1, _0233E7C8 ; =0x0234C920
	ldr r1, [r1]
	ldr r1, [r1, #0xe4]
	cmp r0, r1
	ble _0233E7B4
	add r0, sp, #0x24
	bl InitPreprocessorArgs
	ldr r1, _0233E7CC ; =0x000004E2
	mov r0, r5
	add r1, r1, #1
	add r2, sp, #0x24
	str r4, [sp, #0x5c]
	bl ov08_0233E810
	b _0233E7B4
_0233E674:
	ldr r0, _0233E7C8 ; =0x0234C920
	mov r8, #0
	ldr r0, [r0]
	ldr r0, [r0, #0xe8]
	cmp r0, #0
	bne _0233E69C
	bl sub_02046C78
	cmp r0, #0
	movne r8, #1
	b _0233E6B8
_0233E69C:
	bl sub_02046C78
	bl sub_020037A4
	ldr r1, _0233E7C8 ; =0x0234C920
	ldr r1, [r1]
	ldr r1, [r1, #0xe8]
	cmp r0, r1
	movgt r8, #1
_0233E6B8:
	cmp r8, #0
	beq _0233E7B4
	ldrb r0, [r5, #0xe0]
	cmp r0, #0
	beq _0233E6E8
	bl ov08_0233CB00
	mov r0, #0
	strb r0, [r5, #0xe0]
	mov r0, r5
	mov r1, #7
	bl ov08_0233E844
	b _0233E7B4
_0233E6E8:
	mov r0, r5
	mov r1, #0xe
	bl ov08_0233E844
	b _0233E7B4
_0233E6F8:
	cmp r6, #5
	bne _0233E7B4
	mov r0, r5
	mov r1, #0xf
	bl ov08_0233E844
	b _0233E7B4
_0233E710:
	cmp r6, #5
	bne _0233E7B4
	bl ov08_0233CED0
	mov r0, #0
	str r0, [r5, #0xe8]
	bl sub_02046D20
	ldr r1, _0233E7CC ; =0x000004E2
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	mov r0, r5
	mov r1, #0xd
	bl ov08_0233E844
	mov sb, #0
	b _0233E7B4
_0233E74C:
	bl ov08_0233CED0
	mov r0, #0
	str r0, [r5, #0xe8]
	bl sub_02046D20
	ldr r1, _0233E7CC ; =0x000004E2
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	mov r0, r5
	mov r1, #0xd
	bl ov08_0233E844
	mov sb, #0
	b _0233E7B4
_0233E780:
	bl sub_02046C78
	cmp r0, #0
	beq _0233E7B4
	mov r0, r5
	mov r1, #0xf
	bl ov08_0233E844
	b _0233E7B4
_0233E79C:
	bl ov08_0233CED0
	bl ov08_0233CDC8
	mov r0, #0x18
	bl ov01_023310B8
	mov r0, #3
	b _0233E7C0
_0233E7B4:
	cmp sb, #0
	beq _0233E304
	mov r0, #1
_0233E7C0:
	add sp, sp, #0xc4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233E7C8: .word 0x0234C920
_0233E7CC: .word 0x000004E2
_0233E7D0: .word 0x0233EBE4
_0233E7D4: .word 0x00003FFF
	arm_func_end ov08_0233E2BC

	arm_func_start ov08_0233E7D8
ov08_0233E7D8: ; 0x0233E7D8
	stmdb sp!, {r3, lr}
	ldr r0, _0233E80C ; =0x0234C920
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02046D20
	ldr r0, _0233E80C ; =0x0234C920
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0233E80C ; =0x0234C920
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233E80C: .word 0x0234C920
	arm_func_end ov08_0233E7D8

	arm_func_start ov08_0233E810
ov08_0233E810: ; 0x0233E810
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_02046BE8
	mov r0, #1
	strb r0, [r4, #0xe0]
	bl sub_020037A4
	add r2, r0, #0x78
	mov r0, r4
	mov r1, #0xa
	str r2, [r4, #0xe8]
	bl ov08_0233E844
	ldmia sp!, {r4, pc}
	arm_func_end ov08_0233E810

	arm_func_start ov08_0233E844
ov08_0233E844: ; 0x0233E844
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _0233E870 ; =0x0233EBFC
	mov r4, r1
	bl DebugPrint0
	cmp r4, #0xb
	str r4, [r5]
	cmpne r4, #0xe
	ldmneia sp!, {r3, r4, r5, pc}
	bl ov08_0233CD18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233E870: .word 0x0233EBFC
	arm_func_end ov08_0233E844

	arm_func_start ov08_0233E874
ov08_0233E874: ; 0x0233E874
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	cmp r0, #2
	beq _0233E89C
	bl sub_020467F0
	cmp r0, #0
	beq _0233E8A4
_0233E89C:
	mov r0, #1
	ldmia sp!, {r3, pc}
_0233E8A4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov08_0233E874
	; 0x0233E8AC

	.byte 0x73, 0x79, 0x73, 0x74
	.byte 0x65, 0x6D, 0x2F, 0x31, 0x37, 0x30, 0x2E, 0x73, 0x72, 0x6C, 0x00, 0x00, 0x73, 0x79, 0x73, 0x74
	.byte 0x65, 0x6D, 0x2F, 0x31, 0x36, 0x38, 0x2E, 0x73, 0x72, 0x6C, 0x00, 0x00, 0x73, 0x79, 0x73, 0x74
	.byte 0x65, 0x6D, 0x2F, 0x31, 0x36, 0x35, 0x2E, 0x73, 0x72, 0x6C, 0x00, 0x00, 0x73, 0x79, 0x73, 0x74
	.byte 0x65, 0x6D, 0x2F, 0x64, 0x77, 0x5F, 0x70, 0x6C, 0x74, 0x2E, 0x62, 0x69, 0x6E, 0x00, 0x00, 0x00
	.byte 0x73, 0x79, 0x73, 0x74, 0x65, 0x6D, 0x2F, 0x64, 0x77, 0x5F, 0x69, 0x63, 0x6F, 0x6E, 0x2E, 0x62
	.byte 0x69, 0x6E, 0x00, 0x00, 0x4A, 0x30, 0x5F, 0x30, 0x81, 0x30, 0x57, 0x30, 0x6E, 0x30, 0x82, 0x30
	.byte 0x8A, 0x30, 0x92, 0x30, 0x5F, 0x30, 0x93, 0x30, 0x51, 0x30, 0x93, 0x30, 0x00, 0x00, 0x61, 0x30
	.byte 0x87, 0x30, 0x53, 0x30, 0x63, 0x30, 0x68, 0x30, 0x78, 0x30, 0x44, 0x30, 0x52, 0x30, 0x93, 0x30
	.byte 0x92, 0x30, 0x5F, 0x30, 0x93, 0x30, 0x51, 0x30, 0x93, 0x30, 0x00, 0x00, 0x66, 0x30, 0x93, 0x30
	.byte 0x57, 0x30, 0x85, 0x30, 0x6E, 0x30, 0x4B, 0x30, 0x4F, 0x30, 0x8C, 0x30, 0x56, 0x30, 0x68, 0x30
	.byte 0x92, 0x30, 0x5F, 0x30, 0x93, 0x30, 0x51, 0x30, 0x93, 0x30, 0x00, 0x00, 0xDD, 0x30, 0xB1, 0x30
	.byte 0xE2, 0x30, 0xF3, 0x30, 0x75, 0x30, 0x57, 0x30, 0x4E, 0x30, 0x6E, 0x30, 0xC0, 0x30, 0xF3, 0x30
	.byte 0xB8, 0x30, 0xE7, 0x30, 0xF3, 0x30, 0x0A, 0x00, 0x5D, 0x30, 0x89, 0x30, 0x6E, 0x30, 0x5F, 0x30
	.byte 0x93, 0x30, 0x51, 0x30, 0x93, 0x30, 0x5F, 0x30, 0x44, 0x30, 0x6E, 0x30, 0x00, 0x30, 0x5F, 0x30
	.byte 0x44, 0x30, 0x51, 0x30, 0x93, 0x30, 0x70, 0x30, 0x93, 0x30, 0x67, 0x30, 0x59, 0x30, 0x02, 0x30
	.byte 0x00, 0x00, 0x00, 0x00, 0xE9, 0x04, 0x00, 0x00, 0x44, 0x2C, 0x0A, 0x02, 0xBC, 0xE8, 0x33, 0x02
	.byte 0x04, 0xE9, 0x33, 0x02, 0x5C, 0xE9, 0x33, 0x02, 0xF0, 0xE8, 0x33, 0x02, 0xDC, 0xE8, 0x33, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE6, 0x04, 0x00, 0x00, 0x14, 0x2C, 0x0A, 0x02
	.byte 0xCC, 0xE8, 0x33, 0x02, 0x1E, 0xE9, 0x33, 0x02, 0x5C, 0xE9, 0x33, 0x02, 0xF0, 0xE8, 0x33, 0x02
	.byte 0xDC, 0xE8, 0x33, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEB, 0x04, 0x00, 0x00
	.byte 0x64, 0x2C, 0x0A, 0x02, 0xAC, 0xE8, 0x33, 0x02, 0x3C, 0xE9, 0x33, 0x02, 0x5C, 0xE9, 0x33, 0x02
	.byte 0xF0, 0xE8, 0x33, 0x02, 0xDC, 0xE8, 0x33, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x4D, 0x75, 0x6C, 0x74, 0x69, 0x42, 0x6F, 0x6F, 0x74, 0x5F, 0x45, 0x6E, 0x64, 0x50, 0x61, 0x72
	.byte 0x65, 0x6E, 0x74, 0x52, 0x65, 0x73, 0x75, 0x6C, 0x74, 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52, 0x20
	.byte 0x0A, 0x00, 0x00, 0x00, 0x49, 0x44, 0x4C, 0x45, 0x20, 0x81, 0xA8, 0x20, 0x45, 0x6E, 0x64, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x4D, 0x45, 0x41, 0x53, 0x55, 0x52, 0x45, 0x43, 0x48, 0x41, 0x4E, 0x4E
	.byte 0x45, 0x4C, 0x20, 0x81, 0xA8, 0x20, 0x49, 0x44, 0x4C, 0x45, 0x0A, 0x00, 0x57, 0x48, 0x5F, 0x53
	.byte 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x49, 0x44, 0x4C, 0x45, 0x00, 0x00, 0x00, 0x00
	.byte 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x54, 0x4F, 0x50
	.byte 0x00, 0x00, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F
	.byte 0x42, 0x55, 0x53, 0x59, 0x00, 0x00, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54
	.byte 0x41, 0x54, 0x45, 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52, 0x00, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53
	.byte 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x43, 0x41, 0x4E, 0x4E, 0x49, 0x4E, 0x47
	.byte 0x00, 0x00, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F
	.byte 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53
	.byte 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4B, 0x45, 0x59, 0x53, 0x48, 0x41, 0x52, 0x49
	.byte 0x4E, 0x47, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F
	.byte 0x44, 0x41, 0x54, 0x41, 0x53, 0x48, 0x41, 0x52, 0x49, 0x4E, 0x47, 0x00, 0x57, 0x48, 0x5F, 0x53
	.byte 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x5F
	.byte 0x46, 0x41, 0x49, 0x4C, 0x00, 0x00, 0x00, 0x00, 0x57, 0x48, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54
	.byte 0x41, 0x54, 0x45, 0x5F, 0x4D, 0x45, 0x41, 0x53, 0x55, 0x52, 0x45, 0x43, 0x48, 0x41, 0x4E, 0x4E
	.byte 0x45, 0x4C, 0x00, 0x00, 0x25, 0x73, 0x20, 0x2D, 0x3E, 0x20, 0x00, 0x00, 0x25, 0x73, 0x0A, 0x00
	.byte 0x63, 0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x20, 0x25, 0x64, 0x20, 0x62, 0x72, 0x61, 0x74, 0x69
	.byte 0x6F, 0x20, 0x3D, 0x20, 0x30, 0x78, 0x25, 0x78, 0x0A, 0x00, 0x00, 0x00, 0x64, 0x65, 0x63, 0x69
	.byte 0x64, 0x65, 0x64, 0x20, 0x63, 0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x20, 0x3D, 0x20, 0x25, 0x64
	.byte 0x0A, 0x00, 0x00, 0x00, 0xD6, 0x36, 0x00, 0x00, 0xFD, 0xFF, 0xFF, 0xFF, 0xD7, 0x36, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x73, 0x65, 0x74, 0x20
	.byte 0x6D, 0x61, 0x69, 0x6E, 0x20, 0x70, 0x72, 0x6F, 0x63, 0x20, 0x3A, 0x20, 0x25, 0x64, 0x0A, 0x00

	.data
	.global ov08_0233EC20
ov08_0233EC20:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xEA, 0x33, 0x02, 0xBC, 0xEA, 0x33, 0x02
	.byte 0x0C, 0xEB, 0x33, 0x02, 0xE4, 0xEA, 0x33, 0x02, 0x24, 0xEB, 0x33, 0x02, 0x54, 0xEB, 0x33, 0x02
	.byte 0x3C, 0xEB, 0x33, 0x02, 0x88, 0xEB, 0x33, 0x02, 0x6C, 0xEB, 0x33, 0x02, 0xF8, 0xEA, 0x33, 0x02

	.bss
	.global ov08_0233EC80
ov08_0233EC80:
	.space 0xDCC0
