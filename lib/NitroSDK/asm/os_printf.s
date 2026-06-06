	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start string_put_char
string_put_char: ; 0x02085AF8
	ldr r2, [r0]
	cmp r2, #0
	beq _02085B18
	ldr r2, [r0, #4]
	strb r1, [r2]
	ldr r1, [r0]
	sub r1, r1, #1
	str r1, [r0]
_02085B18:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end string_put_char

	arm_func_start string_fill_char
string_fill_char: ; 0x02085B28
	stmdb sp!, {r3, lr}
	cmp r2, #0
	ldmleia sp!, {r3, pc}
	ldr lr, [r0]
	mov ip, #0
	cmp lr, r2
	movhi lr, r2
	cmp lr, #0
	bls _02085B60
_02085B4C:
	ldr r3, [r0, #4]
	strb r1, [r3, ip]
	add ip, ip, #1
	cmp ip, lr
	blo _02085B4C
_02085B60:
	ldr r1, [r0]
	sub r1, r1, lr
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end string_fill_char

	arm_func_start string_put_string
string_put_string: ; 0x02085B7C
	stmdb sp!, {r4, lr}
	cmp r2, #0
	ldmleia sp!, {r4, pc}
	ldr r4, [r0]
	mov lr, #0
	cmp r4, r2
	movhi r4, r2
	cmp r4, #0
	bls _02085BB8
_02085BA0:
	ldrsb ip, [r1, lr]
	ldr r3, [r0, #4]
	strb ip, [r3, lr]
	add lr, lr, #1
	cmp lr, r4
	blo _02085BA0
_02085BB8:
	ldr r1, [r0]
	sub r1, r1, r4
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end string_put_string

	arm_func_start OS_VsNPrintfEx
OS_VsNPrintfEx: ; 0x02085BD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r2
	str r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldrsb r0, [sb]
	str r1, [sp]
	mov fp, r3
	cmp r0, #0
	beq _02086400
_02085C00:
	ldrsb r1, [sb]
	and r0, r1, #0xff
	eor r0, r0, #0x20
	sub r0, r0, #0xa1
	cmp r0, #0x3c
	bhs _02085C3C
	add r0, sp, #0xc
	bl string_put_char
	ldrsb r1, [sb, #1]!
	cmp r1, #0
	beq _020863F4
	add r0, sp, #0xc
	add sb, sb, #1
	bl string_put_char
	b _020863F4
_02085C3C:
	cmp r1, #0x25
	beq _02085C54
	add r0, sp, #0xc
	add sb, sb, #1
	bl string_put_char
	b _020863F4
_02085C54:
	mov r5, #0
	mov sl, r5
	mov r2, sb
	sub r6, r5, #1
	mov r0, #0xa
	mov r3, #0x57
_02085C6C:
	ldrsb r4, [sb, #1]!
	cmp r4, #0x20
	bgt _02085C80
	beq _02085CBC
	b _02085CD4
_02085C80:
	cmp r4, #0x30
	bgt _02085CD4
	cmp r4, #0x2b
	blt _02085CD4
	beq _02085CA8
	cmp r4, #0x2d
	beq _02085CC4
	cmp r4, #0x30
	beq _02085CCC
	b _02085CD4
_02085CA8:
	ldrsb r1, [sb, #-1]
	cmp r1, #0x20
	bne _02085CD4
	orr r5, r5, #2
	b _02085C6C
_02085CBC:
	orr r5, r5, #1
	b _02085C6C
_02085CC4:
	orr r5, r5, #8
	b _02085C6C
_02085CCC:
	orr r5, r5, #0x10
	b _02085C6C
_02085CD4:
	cmp r4, #0x2a
	bne _02085CF8
	add fp, fp, #4
	ldr sl, [fp, #-4]
	add sb, sb, #1
	cmp sl, #0
	rsblt sl, sl, #0
	orrlt r5, r5, #8
	b _02085D20
_02085CF8:
	mov r1, #0xa
	b _02085D0C
_02085D00:
	ldrsb r4, [sb], #1
	mla r4, sl, r1, r4
	sub sl, r4, #0x30
_02085D0C:
	ldrsb r4, [sb]
	cmp r4, #0x30
	blt _02085D20
	cmp r4, #0x39
	ble _02085D00
_02085D20:
	ldrsb r1, [sb]
	cmp r1, #0x2e
	bne _02085D7C
	ldrsb r1, [sb, #1]!
	mov r6, #0
	cmp r1, #0x2a
	bne _02085D54
	add fp, fp, #4
	ldr r6, [fp, #-4]
	add sb, sb, #1
	cmp r6, #0
	mvnlt r6, #0
	b _02085D7C
_02085D54:
	mov r1, #0xa
	b _02085D68
_02085D5C:
	ldrsb r4, [sb], #1
	mla r4, r6, r1, r4
	sub r6, r4, #0x30
_02085D68:
	ldrsb r4, [sb]
	cmp r4, #0x30
	blt _02085D7C
	cmp r4, #0x39
	ble _02085D5C
_02085D7C:
	ldrsb r1, [sb]
	cmp r1, #0x68
	beq _02085D94
	cmp r1, #0x6c
	beq _02085DAC
	b _02085DC0
_02085D94:
	ldrsb r1, [sb, #1]!
	cmp r1, #0x68
	orrne r5, r5, #0x40
	addeq sb, sb, #1
	orreq r5, r5, #0x100
	b _02085DC0
_02085DAC:
	ldrsb r1, [sb, #1]!
	cmp r1, #0x6c
	orrne r5, r5, #0x20
	addeq sb, sb, #1
	orreq r5, r5, #0x80
_02085DC0:
	ldrsb r1, [sb]
	cmp r1, #0x69
	bgt _02085E04
	cmp r1, #0x63
	blt _02085DE8
	beq _02085E74
	cmp r1, #0x64
	cmpne r1, #0x69
	beq _0208602C
	b _02086010
_02085DE8:
	cmp r1, #0x25
	bgt _02085DF8
	beq _02085FF4
	b _02086010
_02085DF8:
	cmp r1, #0x58
	beq _02085E60
	b _02086010
_02085E04:
	cmp r1, #0x6e
	bgt _02085E14
	beq _02085F9C
	b _02086010
_02085E14:
	sub r1, r1, #0x6f
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _02086010
_02085E24: ; jump table
	b _02085E4C ; case 0
	b _02085E68 ; case 1
	b _02086010 ; case 2
	b _02086010 ; case 3
	b _02085EE8 ; case 4
	b _02086010 ; case 5
	b _02085E58 ; case 6
	b _02086010 ; case 7
	b _02086010 ; case 8
	b _02086024 ; case 9
_02085E4C:
	orr r5, r5, #0x1000
	mov r0, #8
	b _0208602C
_02085E58:
	orr r5, r5, #0x1000
	b _0208602C
_02085E60:
	mov r3, #0x37
	b _02086024
_02085E68:
	orr r5, r5, #4
	mov r6, #8
	b _02086024
_02085E74:
	cmp r6, #0
	bge _02086010
	add fp, fp, #4
	tst r5, #8
	ldr r4, [fp, #-4]
	beq _02085EB0
	mov r1, r4, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	bl string_put_char
	add r0, sp, #0xc
	sub r2, sl, #1
	mov r1, #0x20
	bl string_fill_char
	b _02085EE0
_02085EB0:
	tst r5, #0x10
	movne r0, #0x30
	moveq r0, #0x20
	mov r1, r0, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	sub r2, sl, #1
	bl string_fill_char
	mov r1, r4, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	bl string_put_char
_02085EE0:
	add sb, sb, #1
	b _020863F4
_02085EE8:
	add fp, fp, #4
	cmp r6, #0
	ldr r7, [fp, #-4]
	mov r4, #0
	bge _02085F20
	ldrsb r0, [r7]
	cmp r0, #0
	beq _02085F34
_02085F08:
	add r4, r4, #1
	ldrsb r0, [r7, r4]
	cmp r0, #0
	bne _02085F08
	b _02085F34
_02085F1C:
	add r4, r4, #1
_02085F20:
	cmp r4, r6
	bge _02085F34
	ldrsb r0, [r7, r4]
	cmp r0, #0
	bne _02085F1C
_02085F34:
	tst r5, #8
	sub sl, sl, r4
	beq _02085F64
	add r0, sp, #0xc
	mov r1, r7
	mov r2, r4
	bl string_put_string
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl string_fill_char
	b _02085F94
_02085F64:
	tst r5, #0x10
	movne r0, #0x30
	moveq r0, #0x20
	mov r1, r0, lsl #0x18
	add r0, sp, #0xc
	mov r2, sl
	mov r1, r1, asr #0x18
	bl string_fill_char
	add r0, sp, #0xc
	mov r1, r7
	mov r2, r4
	bl string_put_string
_02085F94:
	add sb, sb, #1
	b _020863F4
_02085F9C:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	tst r5, #0x100
	sub r2, r1, r0
	bne _02085FEC
	tst r5, #0x40
	beq _02085FC8
	add fp, fp, #4
	ldr r0, [fp, #-4]
	strh r2, [r0]
	b _02085FEC
_02085FC8:
	add fp, fp, #4
	tst r5, #0x80
	ldreq r0, [fp, #-4]
	streq r2, [r0]
	beq _02085FEC
	ldr r0, [fp, #-4]
	mov r1, r2, asr #0x1f
	str r2, [r0]
	str r1, [r0, #4]
_02085FEC:
	add sb, sb, #1
	b _020863F4
_02085FF4:
	add r0, r2, #1
	cmp r0, sb
	bne _02086010
	add r0, sp, #0xc
	add sb, sb, #1
	bl string_put_char
	b _020863F4
_02086010:
	mov r1, r2
	add r0, sp, #0xc
	sub r2, sb, r2
	bl string_put_string
	b _020863F4
_02086024:
	orr r5, r5, #0x1000
	mov r0, #0x10
_0208602C:
	tst r5, #8
	bicne r5, r5, #0x10
	cmp r6, #0
	bicge r5, r5, #0x10
	movlt r6, #1
	mov r4, #0
	tst r5, #0x1000
	beq _020860EC
	tst r5, #0x100
	beq _02086064
	add fp, fp, #4
	ldrb r7, [fp, #-4]
	mov r1, #0
	b _0208609C
_02086064:
	tst r5, #0x40
	beq _0208607C
	add fp, fp, #4
	ldrh r7, [fp, #-4]
	mov r1, #0
	b _0208609C
_0208607C:
	tst r5, #0x80
	addeq fp, fp, #4
	ldreq r7, [fp, #-4]
	moveq r1, #0
	beq _0208609C
	add fp, fp, #8
	ldr r7, [fp, #-8]
	ldr r1, [fp, #-4]
_0208609C:
	bic r5, r5, #3
	tst r5, #4
	beq _020861AC
	cmp r0, #0x10
	bne _020860D4
	cmp r1, #0
	cmpeq r7, #0
	beq _020861AC
	add r4, r3, #0x21
	mov r2, #0x30
	strb r4, [sp, #8]
	strb r2, [sp, #9]
	mov r4, #2
	b _020861AC
_020860D4:
	cmp r0, #8
	bne _020861AC
	mov r2, #0x30
	strb r2, [sp, #8]
	mov r4, #1
	b _020861AC
_020860EC:
	tst r5, #0x100
	beq _02086104
	add fp, fp, #4
	ldrsb r7, [fp, #-4]
	mov r1, r7, asr #0x1f
	b _0208613C
_02086104:
	tst r5, #0x40
	beq _0208611C
	add fp, fp, #4
	ldrsh r7, [fp, #-4]
	mov r1, r7, asr #0x1f
	b _0208613C
_0208611C:
	tst r5, #0x80
	addeq fp, fp, #4
	ldreq r7, [fp, #-4]
	moveq r1, r7, asr #0x1f
	beq _0208613C
	add fp, fp, #8
	ldr r7, [fp, #-8]
	ldr r1, [fp, #-4]
_0208613C:
	mov ip, #0
	and r2, ip, #0
	and r8, r1, #0x80000000
	cmp r2, #0
	cmpeq r8, #0
	beq _02086174
	mvn r4, r7
	mov r2, #0x2d
	mvn r1, r1
	strb r2, [sp, #8]
	adds r7, r4, #1
	adc r1, r1, ip
	mov r4, #1
	b _020861AC
_02086174:
	cmp r1, ip
	cmpeq r7, ip
	cmpeq r6, #0
	beq _020861AC
	tst r5, #2
	beq _0208619C
	mov r2, #0x2b
	strb r2, [sp, #8]
	mov r4, #1
	b _020861AC
_0208619C:
	tst r5, #1
	movne r2, #0x20
	strneb r2, [sp, #8]
	movne r4, #1
_020861AC:
	cmp r0, #8
	mov r8, #0
	beq _020861CC
	cmp r0, #0xa
	beq _02086218
	cmp r0, #0x10
	beq _020862B0
	b _020862FC
_020861CC:
	cmp r1, r8
	cmpeq r7, r8
	beq _020862FC
	add r2, sp, #0x18
	mov r0, r8
	mov lr, #7
	mov ip, r8
_020861E8:
	and r3, r7, lr
	add r3, r3, #0x30
	strb r3, [r2, r8]
	mov r3, r1, lsr #3
	cmp r3, r0
	mov r7, r7, lsr #3
	orr r7, r7, r1, lsl #29
	mov r1, r3
	cmpeq r7, ip
	add r8, r8, #1
	bne _020861E8
	b _020862FC
_02086218:
	mov r0, r8
	cmp r0, r8
	cmpeq r1, r8
	bne _02086264
	cmp r7, #0
	beq _020862FC
	ldr ip, _0208644C ; =0xCCCCCCCD
	add r3, sp, #0x18
	mov r2, #0xa
_0208623C:
	umull r1, r0, r7, ip
	movs r0, r0, lsr #3
	mul r1, r0, r2
	sub r1, r7, r1
	mov r7, r0
	add r0, r1, #0x30
	strb r0, [r3, r8]
	add r8, r8, #1
	bne _0208623C
	b _020862FC
_02086264:
	cmp r1, r8
	cmpeq r7, r8
	beq _020862FC
_02086270:
	mov r0, r7
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r2, #0xa
	umull r3, r2, r0, r2
	subs r2, r7, r3
	add r3, r2, #0x30
	add r2, sp, #0x18
	strb r3, [r2, r8]
	cmp r1, #0
	cmpeq r0, #0
	mov r7, r0
	add r8, r8, #1
	bne _02086270
	b _020862FC
_020862B0:
	cmp r1, r8
	cmpeq r7, r8
	beq _020862FC
	add ip, sp, #0x18
	mov lr, #0xf
_020862C4:
	and r2, r7, lr
	mov r7, r7, lsr #4
	mov r0, r1, lsr #4
	orr r7, r7, r1, lsl #28
	cmp r2, #0xa
	mov r1, r0
	addlt r0, r2, #0x30
	addge r0, r2, r3
	strb r0, [ip, r8]
	mov r0, #0
	cmp r1, r0
	cmpeq r7, r0
	add r8, r8, #1
	bne _020862C4
_020862FC:
	cmp r4, #0
	ble _02086324
	ldrsb r0, [sp, #8]
	cmp r0, #0x30
	bne _02086324
	add r0, sp, #0x18
	mov r1, #0x30
	strb r1, [r0, r8]
	add r8, r8, #1
	mov r4, #0
_02086324:
	tst r5, #0x10
	sub r6, r6, r8
	beq _02086340
	sub r0, sl, r8
	sub r0, r0, r4
	cmp r6, r0
	movlt r6, r0
_02086340:
	cmp r6, #0
	subgt sl, sl, r6
	add r0, r4, r8
	sub sl, sl, r0
	ands r0, r5, #8
	str r0, [sp, #4]
	bne _0208636C
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl string_fill_char
_0208636C:
	cmp r4, #0
	ble _02086398
	add r0, sp, #8
	add r5, r0, r4
	add r7, sp, #0xc
_02086380:
	ldrsb r1, [r5, #-1]!
	mov r0, r7
	sub r4, r4, #1
	bl string_put_char
	cmp r4, #0
	bgt _02086380
_02086398:
	add r0, sp, #0xc
	mov r2, r6
	mov r1, #0x30
	bl string_fill_char
	cmp r8, #0
	ble _020863D4
	add r0, sp, #0x18
	add r5, r0, r8
	add r4, sp, #0xc
_020863BC:
	ldrsb r1, [r5, #-1]!
	mov r0, r4
	sub r8, r8, #1
	bl string_put_char
	cmp r8, #0
	bgt _020863BC
_020863D4:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020863F0
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl string_fill_char
_020863F0:
	add sb, sb, #1
_020863F4:
	ldrsb r0, [sb]
	cmp r0, #0
	bne _02085C00
_02086400:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0208641C
	ldr r0, [sp, #0x10]
	mov r1, #0
	strb r1, [r0]
	b _02086438
_0208641C:
	ldr r0, [sp]
	cmp r0, #0
	beq _02086438
	ldr r1, [sp, #0x14]
	mov r2, #0
	add r0, r1, r0
	strb r2, [r0, #-1]
_02086438:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208644C: .word 0xCCCCCCCD
	arm_func_end OS_VsNPrintfEx

