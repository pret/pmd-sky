	.include "asm/macros.inc"
	.include "asm/include/wram.inc"

	.text

	arm_func_start sub_020001E8
sub_020001E8: ; 0x020001E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	bl sub_02004BD4
	bl sub_0200414C
	add r2, sp, #4
	mov r0, #0x20
	mov r1, #2
	bl sub_00FFD7A0
	ldr r0, [sp, #4]
	add r2, sp, #0x10
	mov r0, r0, lsl #3
	str r0, [sp, #4]
	mov r1, #0x100
	bl sub_00FFD7A0
	ldr r0, [sp, #4]
	add r2, sp, #0x110
	add r0, r0, #0x100
	mov r1, #0x100
	bl sub_00FFD7A0
	mov r0, #0x1d
	mov r1, #1
	add r2, sp, #0
	mov r6, #0
	bl sub_00FFD7A0
	ldrb r0, [sp]
	cmp r0, #0xff
	moveq r0, r6
	beq _02000264
	tst r0, #0x50
	movne r0, #1
	moveq r0, r6
_02000264:
	cmp r0, #0
	beq _02000338
	bl sub_0200066C
	mov r8, r0
	mov fp, #1
	and r7, r8, #0x40
	mov sl, #0
	add r5, sp, #0x10
	mov r4, fp
	b _0200032C
_0200028C:
	ldr r0, _0200063C ; =0x0000FFFF
	add sb, r5, sl, lsl #8
	mov r1, sb
	mov r2, #0x70
	bl sub_02000654
	mov r2, sb
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _02000320
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	bhs _02000320
	ldr r0, _0200063C ; =0x0000FFFF
	mov r2, #0x8a
	add r1, sb, #0x74
	bl sub_02000654
	mov r2, sb
	ldrh r1, [r2, #0xfe]
	cmp r0, r1
	bne _02000320
	ldrh r1, [r2, #0x76]
	ldrb r0, [r2, #0x75]
	tst r1, r4, lsl r0
	beq _02000320
	tst r8, r1
	ldrneh r1, [sb, #0x64]
	andne r0, r0, #7
	bicne r1, r1, #7
	orrne r0, r1, r0
	strneh r0, [sb, #0x64]
	add r0, r5, sl, lsl #8
	ldrh r0, [r0, #0x76]
	mvn r0, r0
	tst r7, r0
	movne r6, #3
	bne _020003D8
	orr r6, r6, fp, lsl sl
_02000320:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0200032C:
	cmp sl, #2
	blo _0200028C
	b _0200039C
_02000338:
	bl sub_0200066C
	tst r0, #0x40
	movne r6, #3
	bne _020003D8
	ldr r8, _0200063C ; =0x0000FFFF
	mov sb, #0
	add r7, sp, #0x10
	mov r4, #1
	mov r5, #0x70
_0200035C:
	mov r0, r8
	mov r2, r5
	add r1, r7, sb, lsl #8
	bl sub_02000654
	add r2, r7, sb, lsl #8
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _02000388
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	orrlo r6, r6, r4, lsl sb
_02000388:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	cmp sb, #2
	blo _0200035C
_0200039C:
	cmp r6, #1
	cmpne r6, #2
	beq _020003D8
	cmp r6, #3
	bne _020003D4
	ldrh r1, [sp, #0x80]
	add r0, sp, #0x100
	add r1, r1, #1
	ldrh r0, [r0, #0x80]
	and r1, r1, #0x7f
	cmp r1, r0
	moveq r6, #2
	movne r6, #1
	b _020003D8
_020003D4:
	mov r6, #0
_020003D8:
	cmp r6, #3
	blt _020003F4
	ldr r1, _02000640 ; =0x027FFC80
	mvn r0, #0
	mov r2, #0x74
	bl sub_020061B8
	b _020004B0
_020003F4:
	cmp r6, #0
	beq _020004A0
	ldr r0, _02000644 ; =0xFFFFFF2A
	mov r1, r6, lsl #8
	add r0, sp, r0
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0xa
	bhs _02000440
	add r0, sp, #0x10
	mov r3, #0xa
	mov r2, #0
	add r1, r0, r1
	b _02000434
_02000428:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xfc]
	sub r3, r3, #1
_02000434:
	ldrb r0, [r1, #-0xe6]
	cmp r3, r0
	bgt _02000428
_02000440:
	ldr r0, _02000648 ; =0xFFFFFF60
	mov r1, r6, lsl #8
	add r0, sp, r0
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0x1a
	bhs _02000484
	add r0, sp, #0x10
	mov r3, #0x1a
	mov r2, #0
	add r1, r0, r1
	b _02000478
_0200046C:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xe6]
	sub r3, r3, #1
_02000478:
	ldrb r0, [r1, #-0xb0]
	cmp r3, r0
	bgt _0200046C
_02000484:
	ldr r1, _02000640 ; =0x027FFC80
	add r2, sp, #0x10
	sub r0, r6, #1
	add r0, r2, r0, lsl #8
	mov r2, #0x74
	bl sub_020061D4
	b _020004B0
_020004A0:
	ldr r1, _02000640 ; =0x027FFC80
	mov r0, #0
	mov r2, #0x74
	bl sub_020061B8
_020004B0:
	add r2, sp, #8
	mov r0, #0x36
	mov r1, #6
	bl sub_00FFD7A0
	ldr r4, _02000640 ; =0x027FFC80
	add r0, sp, #8
	add r1, r4, #0x74
	mov r2, #6
	bl sub_02006314
	add r2, sp, #2
	mov r0, #0x3c
	mov r1, #2
	bl sub_00FFD7A0
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bl sub_0200F5BC
	strh r0, [r4, #0x7a]
	bl sub_0200649C
	mov r0, #8
	bl sub_02004C7C
	mov r4, r0
	mov r0, #8
	bl sub_02004C90
	mov r1, r0
	mov r2, r4
	mov r0, #8
	mov r3, #1
	bl sub_0200500C
	mov r4, r0
	mov r0, #8
	bl sub_02004C7C
	sub r2, r0, r4
	mov r0, r4
	mov r1, #0
	bl sub_02006258
	mov r1, r4
	mov r0, #8
	bl sub_02004D78
	mov r0, #8
	bl sub_02004C7C
	mov r4, r0
	mov r0, #8
	bl sub_02004C90
	mov r1, r0
	mov r2, r4
	mov r0, #8
	bl sub_020050B4
	movs r4, r0
	bpl _0200057C
	bl sub_02006058
_0200057C:
	mov r1, r4
	mov r0, #8
	bl sub_02004FD8
	mov r1, r4
	mov r0, #8
	bl sub_02005154
	cmp r0, #0x2100
	bhs _020005A0
	bl sub_02006058
_020005A0:
	mov r0, #6
	bl sub_020070E0
	bl sub_020067A8
	ldr r1, _0200064C ; =0x037F84BC
	mov r0, #1
	bl sub_020039A4
	mov r0, #1
	bl sub_02003AD8
	ldr r3, _02000650 ; =0x04000004
	mov r0, #1
	ldrh r1, [r3]
	ldrh r1, [r3]
	add r2, r3, #0x204
	orr r1, r1, #8
	strh r1, [r3]
	ldrh r1, [r2]
	strh r0, [r2]
	bl sub_02005ED4
	mvn r0, #0
	bl sub_0200A800
	mov r0, #0xf
	bl sub_0200A8C8
	mov r0, #0xc
	bl sub_00FFDEAC
	mov r0, r4
	bl sub_0200D430
	mov r0, #2
	bl sub_0200BA5C
	mov r4, #0
_02000614:
	bl sub_02000660
	bl sub_02005F9C
	cmp r0, #0
	beq _02000630
	mov r0, r4
	bl sub_0200E7F8
	bl sub_02005FE0
_02000630:
	bl sub_0200EA30
	bl sub_0200B8A4
	b _02000614
	.align 2, 0
_0200063C: .word 0x0000FFFF
_02000640: .word 0x027FFC80
_02000644: .word 0xFFFFFF2A
_02000648: .word 0xFFFFFF60
_0200064C: .word 0x037F84BC
_02000650: .word 0x04000004
	arm_func_end sub_020001E8

	arm_func_start sub_02000654
sub_02000654: ; 0x02000654
	ldr ip, _0200065C ; =sub_03803804
	bx ip
	.align 2, 0
_0200065C: .word sub_03803804
	arm_func_end sub_02000654

	arm_func_start sub_02000660
sub_02000660: ; 0x02000660
	ldr ip, _02000668 ; =sub_038037D2
	bx ip
	.align 2, 0
_02000668: .word sub_038037D2
	arm_func_end sub_02000660

	arm_func_start sub_0200066C
sub_0200066C: ; 0x0200066C
	ldr r1, _020006A0 ; =0x027FFE1D
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x80
	orreq r0, r0, #0x40
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	bxeq lr
	cmp r1, #0x40
	orreq r0, r0, #0x80
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020006A0: .word 0x027FFE1D
	arm_func_end sub_0200066C

	arm_func_start sub_020006A4
sub_020006A4: ; 0x020006A4
	stmdb sp!, {r3, lr}
	ldr r0, _020006C4 ; =0x03809E50
	ldr r0, [r0]
	cmp r0, #0
	beq _020006BC
	bl sub_0200D2E4
_020006BC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020006C4: .word 0x03809E50
	arm_func_end sub_020006A4

	arm_func_start sub_020006C8
sub_020006C8: ; 0x020006C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r7, _02000774 ; =0x0380FFF4
	mov r0, #0
	ldr r8, [r7]
	ldr r4, _02000778 ; =0x01000010
	strh r0, [r8, #0x10]
	ldr sb, _0200077C ; =0x0000FFFF
	strh r0, [r8, #0x14]
	add r6, sp, #0
	mov r5, r0
_020006F0:
	ldr r0, [r7]
	mov r1, r6
	ldr r0, [r0, #0x308]
	mov r2, r5
	bl sub_02004948
	cmp r0, #0
	beq _02000714
	mov r0, r6
	bl sub_020008EC
_02000714:
	mov r0, r4
	bl sub_02003B10
	ldrh r1, [r8, #0x10]
	strh r1, [r8, #0x12]
	mov r1, r1, lsl #1
	ldrh r1, [r8, r1]
	cmp r1, sb
	bne _02000748
	ldrh r1, [r8, #0x10]
	add r1, r1, #1
	strh r1, [r8, #0x10]
	bl sub_02003AD8
	b _020006F0
_02000748:
	bl sub_02003AD8
	ldrh r0, [r8, #0x12]
	bl sub_02000838
	strh r0, [r8, #0x14]
	ldrh r0, [r8, #0x14]
	add r0, r8, r0, lsl #3
	ldr r0, [r0, #0xc0]
	mov lr, pc
	bx r0
_0200076C: ; 0x0200076C
	strh sb, [r8, #0x14]
	b _020006F0
	.align 2, 0
_02000774: .word 0x0380FFF4
_02000778: .word 0x01000010
_0200077C: .word 0x0000FFFF
	arm_func_end sub_020006C8

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
	mov r4, r0
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

	arm_func_start sub_02000C68
sub_02000C68: ; 0x02000C68
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_02000C68

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
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x14]
	cmp r0, #0x80
	beq _02000F18
	cmp r0, #0x81
	bne _02000ED0
	ldrh r1, [r5, #4]
	mvn r0, r6
	and r0, r1, r0
	strh r0, [r5, #4]
	b _02000EF4
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
_02000EF4:
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
	b _02002B18
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
	b _02002B18
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

	arm_func_start sub_0200359C
sub_0200359C: ; 0x0200359C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02003600 ; =0x04808028
	ldr lr, _02003604 ; =0x04000208
	mov r5, #1
	add r2, r1, #0x1ec
	add r3, r1, #0x174
	mov ip, #0
	b _020035F0
_020035BC:
	ldrh r4, [lr]
	strh ip, [lr]
	ldrh r0, [r3]
	and r0, r0, #3
	cmp r0, #3
	ldrneh r0, [r2]
	cmpne r0, #5
	cmpne r0, #7
	cmpne r0, #8
	strneh ip, [r1]
	ldrh r0, [lr]
	movne r5, ip
	strh r4, [lr]
_020035F0:
	cmp r5, #0
	bne _020035BC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_02003600: .word 0x04808028
_02003604: .word 0x04000208
	arm_func_end sub_0200359C

	arm_func_start sub_02003608
sub_02003608: ; 0x02003608
	ldr r1, _02003638 ; =0x0480815E
	mov r2, #0
	b _02003628
_02003614:
	ldrh r0, [r1]
	tst r0, #1
	moveq r0, #0
	bxeq lr
	add r2, r2, #1
_02003628:
	cmp r2, #0x2800
	blo _02003614
	mov r0, #1
	bx lr
	.align 2, 0
_02003638: .word 0x0480815E
	arm_func_end sub_02003608

	arm_func_start sub_0200363C
sub_0200363C: ; 0x0200363C
	ldr r1, _0200366C ; =0x04808180
	mov r2, #0
	b _0200365C
_02003648:
	ldrh r0, [r1]
	tst r0, #1
	moveq r0, #0
	bxeq lr
	add r2, r2, #1
_0200365C:
	cmp r2, #0x2800
	blo _02003648
	mov r0, #1
	bx lr
	.align 2, 0
_0200366C: .word 0x04808180
	arm_func_end sub_0200363C

	arm_func_start sub_02003670
sub_02003670: ; 0x02003670
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	beq _0200368C
	b _02003690
_0200368C:
	ldmia sp!, {pc}
_02003690:
	ldmia ip, {r1, r2}
	ands r1, r1, r2
	beq _020036A0
	b _020036A4
_020036A0:
	ldmia sp!, {pc}
_020036A4:
	mov r3, #1
	mov r0, #0
_020036AC:
	ands r2, r1, r3, lsl r0
	beq _020036B8
	b _020036BC
_020036B8:
	add r0, r0, #1
_020036BC:
	beq _020036AC
	str r2, [ip, #4]
	ldr r1, _020036D4 ; =0x038074F4
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _020036D8 ; =0x037FB4F4
	bx r0
	.align 2, 0
_020036D4: .word 0x038074F4
_020036D8: .word 0x037FB4F4
	arm_func_end sub_02003670

	arm_func_start sub_020036DC
sub_020036DC: ; 0x020036DC
	ldr ip, _02003818 ; =0x03807608
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _0200372C
_020036F4:
	str r2, [ip, #0x48]
	str r3, [ip, #0x5c]
	str r3, [ip, #0x60]
	ldr r0, [ip, #0x64]
	str r3, [ip, #0x64]
	mov ip, r0
	cmp ip, #0
	bne _020036F4
	ldr ip, _02003818 ; =0x03807608
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _0200381C ; =0x038076A4
	mov r1, #1
	strh r1, [ip]
_0200372C:
	ldr ip, _0200381C ; =0x038076A4
	ldrh r1, [ip]
	cmp r1, #0
	beq _02003740
	b _02003744
_02003740:
	ldmia sp!, {pc}
_02003744:
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_0200375C:
	cmp r1, #0
	bne _02003768
	b _0200376C
_02003768:
	ldrh r0, [r1, #0x48]
_0200376C:
	bne _02003774
	b _02003778
_02003774:
	cmp r0, #1
_02003778:
	bne _02003780
	b _02003784
_02003780:
	ldr r1, [r1, #0x4c]
_02003784:
	bne _0200375C
	cmp r1, #0
	bne _0200379C
_02003790:
	mov r3, #0x92
	msr cpsr_c, r3
	ldmia sp!, {pc}
_0200379C:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _02003790
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _020037C4
	stmdb sp!, {r0, r1, ip}
	mov lr, pc
	bx r3
_020037C0:
	ldmia sp!, {r0, r1, ip}
_020037C4:
	str r1, [ip, #4]
	mrs r2, spsr
	str r2, [r0, #0]!
	ldmib sp!, {r2, r3}
	stmib r0!, {r2, r3}
	ldmib sp!, {r2, r3, ip, lr}
	stmib r0!, {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	stmib r0!, {lr}
	mov r3, #0xd3
	msr cpsr_c, r3
	stmib r0!, {sp}
	ldr sp, [r1, #0x44]
	mov r3, #0xd2
	msr cpsr_c, r3
	ldr r2, [r1, #0]!
	msr spsr_fc, r2
	ldr lr, [r1, #0x40]
	ldmib r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	stmda sp!, {r0, r1, r2, r3, ip, lr}
	ldmia sp!, {pc}
	.align 2, 0
_02003818: .word 0x03807608
_0200381C: .word 0x038076A4
	arm_func_end sub_020036DC

	arm_func_start sub_02003820
sub_02003820: ; 0x02003820
	bx lr
	arm_func_end sub_02003820

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

	arm_func_start sub_020038B0
sub_020038B0: ; 0x020038B0
	ldr ip, _020038BC ; =sub_037FB63C
	mov r0, #0
	bx ip
	.align 2, 0
_020038BC: .word sub_037FB63C
	arm_func_end sub_020038B0

	arm_func_start sub_020038C0
sub_020038C0: ; 0x020038C0
	ldr ip, _020038CC ; =sub_037FB63C
	mov r0, #1
	bx ip
	.align 2, 0
_020038CC: .word sub_037FB63C
	arm_func_end sub_020038C0

	arm_func_start sub_020038D0
sub_020038D0: ; 0x020038D0
	ldr ip, _020038DC ; =sub_037FB63C
	mov r0, #2
	bx ip
	.align 2, 0
_020038DC: .word sub_037FB63C
	arm_func_end sub_020038D0

	arm_func_start sub_020038E0
sub_020038E0: ; 0x020038E0
	ldr ip, _020038EC ; =sub_037FB63C
	mov r0, #3
	bx ip
	.align 2, 0
_020038EC: .word sub_037FB63C
	arm_func_end sub_020038E0

	arm_func_start sub_020038F0
sub_020038F0: ; 0x020038F0
	ldr ip, _020038FC ; =sub_037FB63C
	mov r0, #4
	bx ip
	.align 2, 0
_020038FC: .word sub_037FB63C
	arm_func_end sub_020038F0

	arm_func_start sub_02003900
sub_02003900: ; 0x02003900
	ldr ip, _0200390C ; =sub_037FB63C
	mov r0, #5
	bx ip
	.align 2, 0
_0200390C: .word sub_037FB63C
	arm_func_end sub_02003900

	arm_func_start sub_02003910
sub_02003910: ; 0x02003910
	ldr ip, _0200391C ; =sub_037FB63C
	mov r0, #6
	bx ip
	.align 2, 0
_0200391C: .word sub_037FB63C
	arm_func_end sub_02003910

	arm_func_start sub_02003920
sub_02003920: ; 0x02003920
	ldr ip, _0200392C ; =sub_037FB63C
	mov r0, #7
	bx ip
	.align 2, 0
_0200392C: .word sub_037FB63C
	arm_func_end sub_02003920

	arm_func_start sub_02003930
sub_02003930: ; 0x02003930
	stmdb sp!, {r3, lr}
	ldr r2, _02003974 ; =0x027FFC3C
	ldr r0, _02003978 ; =0x03807610
	ldr r1, [r2]
	ldr r3, [r0, #0x60]
	add r0, r1, #1
	str r0, [r2]
	cmp r3, #0
	beq _0200395C
	mov lr, pc
	bx r3
_0200395C:
	ldr r1, _0200397C ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #1
	str r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02003974: .word 0x027FFC3C
_02003978: .word 0x03807610
_0200397C: .word 0x0380FFF8
	arm_func_end sub_02003930

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

	arm_func_start sub_02003D8C
sub_02003D8C: ; 0x02003D8C
	bx lr
	arm_func_end sub_02003D8C

	arm_func_start sub_02003D90
sub_02003D90: ; 0x02003D90
	bx lr
	arm_func_end sub_02003D90

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

	arm_func_start sub_02003DD4
sub_02003DD4: ; 0x02003DD4
	bx lr
	arm_func_end sub_02003DD4

	arm_func_start sub_02003DD8
sub_02003DD8: ; 0x02003DD8
	bx lr
	arm_func_end sub_02003DD8

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

	arm_func_start sub_02003FA4
sub_02003FA4: ; 0x02003FA4
	ldr r2, [r0]
	cmp r2, #0
	beq _02003FCC
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_02003FCC:
	mov r0, r2
	bx lr
	arm_func_end sub_02003FA4

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

	arm_func_start sub_02004034
sub_02004034: ; 0x02004034
	ldr r1, _02004074 ; =0x03807680
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _0200404C
_02004044:
	mov r2, r1
	ldr r1, [r1, #0x4c]
_0200404C:
	cmp r1, #0
	cmpne r1, r0
	bne _02004044
	cmp r2, #0
	ldreq r1, [r0, #0x4c]
	ldreq r0, _02004074 ; =0x03807680
	streq r1, [r0, #0x2c]
	ldrne r0, [r0, #0x4c]
	strne r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_02004074: .word 0x03807680
	arm_func_end sub_02004034

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

	arm_func_start sub_02004344
sub_02004344: ; 0x02004344
	stmdb sp!, {r3, lr}
	bl sub_02005EE8
	ldr r0, _02004364 ; =0x03807680
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl sub_02004368
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02004364: .word 0x03807680
	arm_func_end sub_02004344

	arm_func_start sub_02004368
sub_02004368: ; 0x02004368
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020043C0 ; =0x03807680
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _020043B0
	ldr r1, _020043C4 ; =0x037FC1E0
	bl sub_020047B0
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x48]
	bl sub_02004868
	b _020043B8
_020043B0:
	mov r0, r4
	bl sub_020043C8
_020043B8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020043C0: .word 0x03807680
_020043C4: .word 0x037FC1E0
	arm_func_end sub_02004368

	arm_func_start sub_020043C8
sub_020043C8: ; 0x020043C8
	stmdb sp!, {r3, lr}
	ldr r1, _02004404 ; =0x03807680
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0x98]
	cmp r2, #0
	beq _020043F8
	mov r1, #0
	str r1, [r3, #0x98]
	mov lr, pc
	bx r2
_020043F4:
	bl sub_02005EE8
_020043F8:
	bl sub_02004408
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02004404: .word 0x03807680
	arm_func_end sub_020043C8

	arm_func_start sub_02004408
sub_02004408: ; 0x02004408
	stmdb sp!, {r4, lr}
	ldr r0, _02004474 ; =0x03807680
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl sub_02004740
	mov r0, r4
	bl sub_02004B54
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _02004438
	mov r1, r4
	bl sub_02003F4C
_02004438:
	mov r0, r4
	bl sub_02004034
	mov r1, #2
	add r0, r4, #0x80
	str r1, [r4, #0x48]
	bl sub_020044CC
	bl sub_02004778
	bl sub_02005EE8
	mov r4, r0
	bl sub_02004078
	mov r0, r4
	bl sub_02005EFC
	bl sub_02006058
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02004474: .word 0x03807680
	arm_func_end sub_02004408

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

	arm_func_start sub_020046F4
sub_020046F4: ; 0x020046F4
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _02004710 ; =sub_037FC36C
	mov r0, r2
	str r1, [r2, #0x94]
	bx ip
	.align 2, 0
_02004710: .word sub_037FC36C
	arm_func_end sub_020046F4

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

	arm_func_start sub_02004A58
sub_02004A58: ; 0x02004A58
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_02004A58

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

	arm_func_start sub_02004B54
sub_02004B54: ; 0x02004B54
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02004B78
_02004B64:
	add r0, r5, #0x6c
	bl sub_02003FA4
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl sub_020044CC
_02004B78:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	bne _02004B64
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_02004B54

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

	arm_func_start sub_02004C7C
sub_02004C7C: ; 0x02004C7C
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end sub_02004C7C

	arm_func_start sub_02004C90
sub_02004C90: ; 0x02004C90
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end sub_02004C90

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

	arm_func_start sub_02004D78
sub_02004D78: ; 0x02004D78
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end sub_02004D78

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

	arm_func_start sub_0200539C
sub_0200539C: ; 0x0200539C
	ldr r0, _020053F4 ; =0x03807828
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020053E0
	ldr r2, _020053F8 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_020053E0:
	ldr ip, _020053FC ; =sub_037FB858
	mov r0, #0
	ldr r1, _02005400 ; =0x037FD1B4
	mov r2, r0
	bx ip
	.align 2, 0
_020053F4: .word 0x03807828
_020053F8: .word 0x04000102
_020053FC: .word sub_037FB858
_02005400: .word 0x037FD1B4
	arm_func_end sub_0200539C

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

	arm_func_start sub_02005830
sub_02005830: ; 0x02005830
	stmdb sp!, {r0, lr}
	bl sub_02005840
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_02005830

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

	arm_func_start sub_02005ED4
sub_02005ED4: ; 0x02005ED4
	mrs r0, cpsr
	bic r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end sub_02005ED4

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

	arm_func_start sub_02005F9C
sub_02005F9C: ; 0x02005F9C
	ldr r0, _02005FA8 ; =0x03807858
	ldrh r0, [r0, #2]
	bx lr
	.align 2, 0
_02005FA8: .word 0x03807858
	arm_func_end sub_02005F9C

	arm_func_start sub_02005FAC
sub_02005FAC: ; 0x02005FAC
	stmdb sp!, {r3, lr}
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	cmp r0, #0x10
	ldreq r0, _02005FDC ; =0x03807858
	moveq r1, #1
	streqh r1, [r0, #2]
	beq _02005FD4
	bl sub_02006058
_02005FD4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_02005FDC: .word 0x03807858
	arm_func_end sub_02005FAC

	arm_func_start sub_02005FE0
sub_02005FE0: ; 0x02005FE0
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0
	bl sub_020060DC
	mov r0, #1
	bl sub_020060DC
	mov r0, #2
	bl sub_020060DC
	mov r0, #3
	bl sub_020060DC
	mov r0, #0x40000
	bl sub_02003A8C
	mvn r0, #0
	bl sub_02003B4C
	bl sub_0200689C
	mov r6, #0xc
	mov r5, #0x1000
	mov r4, #0
_02006024:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	bne _02006024
	ldr r0, _02006054 ; =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl sub_0200F4A8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_02006054: .word 0x04000208
	arm_func_end sub_02005FE0

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

	arm_func_start sub_0200615C
sub_0200615C: ; 0x0200615C
	mov r3, #0
_02006160:
	cmp r3, r2
	blt _0200616C
	b _02006170
_0200616C:
	strh r0, [r1, r3]
_02006170:
	blt _02006178
	b _0200617C
_02006178:
	add r3, r3, #2
_0200617C:
	blt _02006160
	bx lr
	arm_func_end sub_0200615C

	arm_func_start sub_02006184
sub_02006184: ; 0x02006184
	mov ip, #0
_02006188:
	cmp ip, r2
	blt _02006194
	b _02006198
_02006194:
	ldrh r3, [r0, ip]
_02006198:
	blt _020061A0
	b _020061A4
_020061A0:
	strh r3, [r1, ip]
_020061A4:
	blt _020061AC
	b _020061B0
_020061AC:
	add ip, ip, #2
_020061B0:
	blt _02006188
	bx lr
	arm_func_end sub_02006184

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

	arm_func_start sub_020061D4
sub_020061D4: ; 0x020061D4
	add ip, r1, r2
_020061D8:
	cmp r1, ip
	blt _020061E4
	b _020061E8
_020061E4:
	ldmia r0!, {r2}
_020061E8:
	blt _020061F0
	b _020061F4
_020061F0:
	stmia r1!, {r2}
_020061F4:
	blt _020061D8
	bx lr
	arm_func_end sub_020061D4

	arm_func_start sub_020061FC
sub_020061FC: ; 0x020061FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb}
	add sb, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
	mov r2, r0
	mov r3, r2
	mov r4, r2
	mov r5, r2
	mov r6, r2
	mov r7, r2
	mov r8, r2
_02006228:
	cmp r1, ip
	blt _02006234
	b _02006238
_02006234:
	stmia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
_02006238:
	blt _02006228
_0200623C:
	cmp r1, sb
	blt _02006248
	b _0200624C
_02006248:
	stmia r1!, {r0}
_0200624C:
	blt _0200623C
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end sub_020061FC

	arm_func_start sub_02006258
sub_02006258: ; 0x02006258
	cmp r2, #0
	beq _02006264
	b _02006268
_02006264:
	bx lr
_02006268:
	tst r0, #1
	beq _02006294
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	beq _02006290
	b _02006294
_02006290:
	bx lr
_02006294:
	cmp r2, #2
	blo _020062EC
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _020062BC
	strh r1, [r0], #2
	subs r2, r2, #2
	beq _020062B8
	b _020062BC
_020062B8:
	bx lr
_020062BC:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _020062DC
	sub r2, r2, r3
	add ip, r3, r0
_020062D0:
	str r1, [r0], #4
	cmp r0, ip
	blo _020062D0
_020062DC:
	tst r2, #2
	bne _020062E8
	b _020062EC
_020062E8:
	strh r1, [r0], #2
_020062EC:
	tst r2, #1
	beq _020062F8
	b _020062FC
_020062F8:
	bx lr
_020062FC:
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end sub_02006258

	arm_func_start sub_02006314
sub_02006314: ; 0x02006314
	cmp r2, #0
	beq _02006320
	b _02006324
_02006320:
	bx lr
_02006324:
	tst r1, #1
	beq _0200637C
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	bne _02006340
	b _02006344
_02006340:
	ldrh r3, [r0, #-1]
_02006344:
	bne _0200634C
	b _02006350
_0200634C:
	mov r3, r3, lsr #8
_02006350:
	beq _02006358
	b _0200635C
_02006358:
	ldrh r3, [r0]
_0200635C:
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	beq _02006378
	b _0200637C
_02006378:
	bx lr
_0200637C:
	eor ip, r1, r0
	tst ip, #1
	beq _020063D8
	bic r0, r0, #1
	ldrh ip, [r0], #2
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _020063B4
_0200639C:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
	subs r2, r2, #2
	bhs _0200639C
_020063B4:
	tst r2, #1
	beq _020063C0
	b _020063C4
_020063C0:
	bx lr
_020063C4:
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_020063D8:
	tst ip, #2
	beq _02006404
	bics r3, r2, #1
	beq _02006468
	sub r2, r2, r3
	add ip, r3, r1
_020063F0:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _020063F0
	b _02006468
_02006404:
	cmp r2, #2
	blo _02006468
	tst r1, #2
	beq _0200642C
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	beq _02006428
	b _0200642C
_02006428:
	bx lr
_0200642C:
	bics r3, r2, #3
	beq _0200644C
	sub r2, r2, r3
	add ip, r3, r1
_0200643C:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _0200643C
_0200644C:
	tst r2, #2
	bne _02006458
	b _0200645C
_02006458:
	ldrh r3, [r0], #2
_0200645C:
	bne _02006464
	b _02006468
_02006464:
	strh r3, [r1], #2
_02006468:
	tst r2, #1
	beq _02006474
	b _02006478
_02006474:
	bx lr
_02006478:
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end sub_02006314

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
	b _020066B4
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

	arm_func_start sub_02006884
sub_02006884: ; 0x02006884
	ldr r1, _02006898 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	bx lr
	.align 2, 0
_02006898: .word 0x04000501
	arm_func_end sub_02006884

	arm_func_start sub_0200689C
sub_0200689C: ; 0x0200689C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020068E8 ; =0x04000501
	mov r5, #0
	ldrb r0, [r1]
	bic r0, r0, #0x80
	strb r0, [r1]
	mov r4, #1
_020068B8:
	mov r0, r5
	mov r1, r4
	bl sub_02006C08
	add r5, r5, #1
	cmp r5, #0x10
	blt _020068B8
	ldr r0, _020068EC ; =0x04000508
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_020068E8: .word 0x04000501
_020068EC: .word 0x04000508
	arm_func_end sub_0200689C

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

	arm_func_start sub_020069A4
sub_020069A4: ; 0x020069A4
	ldr r1, _020069B0 ; =0x04000500
	strb r0, [r1]
	bx lr
	.align 2, 0
_020069B0: .word 0x04000500
	arm_func_end sub_020069A4

	arm_func_start sub_020069B4
sub_020069B4: ; 0x020069B4
	ldr ip, _020069E8 ; =0x04000501
	mov r3, r3, lsl #5
	ldrb ip, [ip]
	tst ip, #0x80
	movne ip, #1
	moveq ip, #0
	orr r3, r3, ip, lsl #7
	orr r2, r3, r2, lsl #4
	orr r2, r2, r1, lsl #2
	ldr r1, _020069E8 ; =0x04000501
	orr r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_020069E8: .word 0x04000501
	arm_func_end sub_020069B4

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

	arm_func_start sub_02006D54
sub_02006D54: ; 0x02006D54
	ldr r1, _02006DB0 ; =0x03807558
	cmp r0, #0
	str r0, [r1]
	blt _02006D88
	mov r2, #0
	and r1, r0, #0xff
_02006D6C:
	mov r0, r2, lsl #4
	add r0, r0, #0x4000000
	add r2, r2, #1
	strb r1, [r0, #0x402]
	cmp r2, #0x10
	blt _02006D6C
	bx lr
_02006D88:
	ldr r2, _02006DB4 ; =0x03807914
	mov r3, #0
_02006D90:
	ldrb r1, [r2, r3]
	mov r0, r3, lsl #4
	add r0, r0, #0x4000000
	add r3, r3, #1
	strb r1, [r0, #0x402]
	cmp r3, #0x10
	blt _02006D90
	bx lr
	.align 2, 0
_02006DB0: .word 0x03807558
_02006DB4: .word 0x03807914
	arm_func_end sub_02006D54

	arm_func_start sub_02006DB8
sub_02006DB8: ; 0x02006DB8
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldr r0, [r0, #0x400]
	bx lr
	arm_func_end sub_02006DB8

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

	arm_func_start sub_0200719C
sub_0200719C: ; 0x0200719C
	ldr ip, _020071A8 ; =sub_037FD5C0
	ldr r0, _020071AC ; =0x03807978
	bx ip
	.align 2, 0
_020071A8: .word sub_037FD5C0
_020071AC: .word 0x03807978
	arm_func_end sub_0200719C

	arm_func_start sub_020071B0
sub_020071B0: ; 0x020071B0
	ldr ip, _020071C4 ; =sub_037FC6D4
	ldr r0, _020071C8 ; =0x03807958
	mov r1, #2
	mov r2, #0
	bx ip
	.align 2, 0
_020071C4: .word sub_037FC6D4
_020071C8: .word 0x03807958
	arm_func_end sub_020071B0

	arm_func_start sub_020071CC
sub_020071CC: ; 0x020071CC
	bx lr
	arm_func_end sub_020071CC

	arm_func_start sub_020071D0
sub_020071D0: ; 0x020071D0
	bx lr
	arm_func_end sub_020071D0

	arm_func_start sub_020071D4
sub_020071D4: ; 0x020071D4
	ldr ip, _020071E8 ; =sub_037FC6D4
	ldr r0, _020071EC ; =0x03807958
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_020071E8: .word sub_037FC6D4
_020071EC: .word 0x03807958
	arm_func_end sub_020071D4

	arm_func_start sub_020071F0
sub_020071F0: ; 0x020071F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _020072D0 ; =0x03807958
	ldr r1, _020072D4 ; =0x03807938
	mov r2, #8
	bl sub_02004894
	ldr r0, _020072D8 ; =0x03807978
	bl sub_02005588
	bl sub_0200734C
	bl sub_020080D8
	bl sub_02009F0C
	bl sub_02006884
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020069B4
	mov r0, #0x7f
	bl sub_020069A4
	bl sub_02005404
	ldr r2, _020072DC ; =0x037FEFEC
	adds r4, r0, #0x10000
	str r2, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	adc r2, r1, #0
	ldr r3, _020072E0 ; =0x00000AA8
	ldr r0, _020072D8 ; =0x03807978
	mov r1, r4
	bl sub_02005734
	ldr r7, _020072D0 ; =0x03807958
	mov r4, #1
	add r6, sp, #0xc
	mov r8, #0
	mov r5, r4
_02007280:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov sb, r8
	bl sub_02004948
	ldr r0, [sp, #0xc]
	cmp r0, #1
	beq _020072A8
	cmp r0, #2
	b _020072AC
_020072A8:
	mov sb, r4
_020072AC:
	bl sub_020073A8
	bl sub_0200A104
	mov r0, sb
	bl sub_0200813C
	mov r0, sb
	bl sub_02007594
	bl sub_02009E74
	bl sub_020070AC
	b _02007280
	.align 2, 0
_020072D0: .word 0x03807958
_020072D4: .word 0x03807938
_020072D8: .word 0x03807978
_020072DC: .word 0x037FEFEC
_020072E0: .word 0x00000AA8
	arm_func_end sub_020071F0

	arm_func_start sub_020072E4
sub_020072E4: ; 0x020072E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x10]
	mov r5, r0, lsl #3
	cmp r4, #0
	movne r4, #0
	moveq r4, #1
	mov ip, r4, lsl #2
	ldr lr, [sp, #0x14]
	orr r1, ip, r1, lsl #3
	orr ip, r1, lr, lsl #1
	ldr r4, [sp, #0x18]
	add r0, r0, #0x4000000
	orr r4, r4, ip
	strb r4, [r0, #0x508]
	add r1, r5, #0x4000000
	str r2, [r1, #0x510]
	add r0, r1, #0x500
	strh r3, [r0, #0x14]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_020072E4

	arm_func_start sub_02007334
sub_02007334: ; 0x02007334
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x508]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_02007334

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

	arm_func_start sub_02007DC8
sub_02007DC8: ; 0x02007DC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r8, #0
	ldr r5, _02007EA0 ; =0x03807E70
	mov sb, r1
	mov r7, sl
	mov fp, r8
	mov r4, #1
	b _02007E64
_02007DEC:
	tst r7, #1
	beq _02007E5C
	ldr r0, _02007EA4 ; =0x03807E48
	ldr r1, [r0, #4]
	mov r0, #0x54
	mla r6, r8, r0, r5
	tst r1, r4, lsl r8
	bne _02007E5C
	ldr r3, [r6, #0x48]
	cmp r3, #0
	beq _02007E2C
	ldr r2, [r6, #0x4c]
	mov r0, r6
	mov r1, #0
	mov lr, pc
	bx r3
_02007E2C:
	mov r0, r8
	mov r1, #0
	bl sub_02006C08
	strb fp, [r6, #0x22]
	mov r0, r6
	bl sub_02007D04
	ldrb r0, [r6, #3]
	bic r0, r0, #0xf8
	strb r0, [r6, #3]
	and r0, r0, #0xff
	bic r0, r0, #1
	strb r0, [r6, #3]
_02007E5C:
	add r8, r8, #1
	mov r7, r7, lsr #1
_02007E64:
	cmp r8, #0x10
	bge _02007E74
	cmp r7, #0
	bne _02007DEC
_02007E74:
	tst sb, #1
	ldrne r0, _02007EA4 ; =0x03807E48
	ldrne r1, [r0]
	orrne r1, r1, sl
	strne r1, [r0]
	ldreq r0, _02007EA4 ; =0x03807E48
	ldreq r1, [r0, #4]
	orreq r1, r1, sl
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02007EA0: .word 0x03807E70
_02007EA4: .word 0x03807E48
	arm_func_end sub_02007DC8

	arm_func_start sub_02007EA8
sub_02007EA8: ; 0x02007EA8
	tst r1, #1
	ldreq r1, _02007EDC ; =0x03807E48
	mvneq r0, r0
	ldreq r2, [r1, #4]
	andeq r0, r2, r0
	streq r0, [r1, #4]
	bxeq lr
	ldr r1, _02007EDC ; =0x03807E48
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_02007EDC: .word 0x03807E48
	arm_func_end sub_02007EA8

	arm_func_start sub_02007EE0
sub_02007EE0: ; 0x02007EE0
	tst r0, #1
	ldrne r0, _02007EF8 ; =0x03807E48
	ldrne r0, [r0]
	ldreq r0, _02007EF8 ; =0x03807E48
	ldreq r0, [r0, #4]
	bx lr
	.align 2, 0
_02007EF8: .word 0x03807E48
	arm_func_end sub_02007EE0

	arm_func_start sub_02007EFC
sub_02007EFC: ; 0x02007EFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _02007F74 ; =0x03807E70
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r4, r6
	mov sb, #0x54
_02007F18:
	mla r2, r6, sb, r5
	ldrb r1, [r2, #3]
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _02007F5C
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _02007F5C
	ldr r0, [r2, #0x44]
	cmp r8, r0
	cmpls r0, r7
	bhi _02007F5C
	bic r3, r1, #2
	mov r0, r6
	mov r1, r4
	strb r3, [r2, #3]
	bl sub_02006C08
_02007F5C:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #0x10
	blo _02007F18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02007F74: .word 0x03807E70
	arm_func_end sub_02007EFC

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

	arm_func_start sub_020084D8
sub_020084D8: ; 0x020084D8
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _020084F4 ; =0x038083B0
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_020084F4: .word 0x038083B0
	arm_func_end sub_020084D8

	arm_func_start sub_020084F8
sub_020084F8: ; 0x020084F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0200829C
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _02008524 ; =0x038083B0
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_02008524: .word 0x038083B0
	arm_func_end sub_020084F8

	arm_func_start sub_02008528
sub_02008528: ; 0x02008528
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _0200857C ; =0x038083B0
	ldrb r0, [r2, r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _02008574
	add r0, r2, r1
	bl sub_02008CE8
	ldr r0, _02008580 ; =0x03807E6C
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_02008574:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200857C: .word 0x038083B0
_02008580: .word 0x03807E6C
	arm_func_end sub_02008528

	arm_func_start sub_02008584
sub_02008584: ; 0x02008584
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _020085F8 ; =0x038083B0
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	mov r0, r0, lsl #0x1f
	bic r2, r2, #4
	orr r0, r2, r0, lsr #29
	strb r0, [r5, r4]
	cmp r1, #0
	beq _020085F0
	mov r8, #0
	mov r6, #0x7f
_020085BC:
	mov r1, r8
	add r0, r5, r4
	bl sub_02008C64
	movs r7, r0
	beq _020085E4
	mov r2, r6
	add r1, r5, r4
	bl sub_02008BC8
	mov r0, r7
	bl sub_02008C30
_020085E4:
	add r8, r8, #1
	cmp r8, #0x10
	blt _020085BC
_020085F0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020085F8: .word 0x038083B0
	arm_func_end sub_02008584

	arm_func_start sub_020085FC
sub_020085FC: ; 0x020085FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _020086C0 ; =0x038083B0
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_02008618:
	mov r0, r6
	mov r1, r7
	bl sub_02008C64
	movs r5, r0
	beq _02008640
	mov r1, r6
	mov r2, r4
	bl sub_02008BC8
	mov r0, r5
	bl sub_02008C30
_02008640:
	add r7, r7, #1
	cmp r7, #0x10
	blt _02008618
	bl sub_0200719C
	mov r4, #0
	mov r5, r4
	b _02008680
_0200865C:
	mov r0, r6
	mov r1, r5
	bl sub_02008ED8
	cmp r0, #0
	beq _0200867C
	mov r0, r6
	bl sub_02008CE8
	b _02008688
_0200867C:
	add r4, r4, #1
_02008680:
	cmp r4, r8
	blo _0200865C
_02008688:
	bl sub_0200714C
	ldr r0, _020086C4 ; =0x03807E6C
	ldr r3, [r0]
	cmp r3, #0
	beq _020086B8
	ldrb r1, [r6, #1]
	mov r0, #0x24
	mul r2, r1, r0
	add r1, r3, #0x40
	ldr r0, [r1, r2]
	add r0, r0, r4
	str r0, [r1, r2]
_020086B8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020086C0: .word 0x038083B0
_020086C4: .word 0x03807E6C
	arm_func_end sub_020085FC

	arm_func_start sub_020086C8
sub_020086C8: ; 0x020086C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _02008730 ; =0x038083B0
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _02008718
_020086E8:
	tst r8, #1
	beq _02008710
	mov r1, r6
	add r0, r5, r4
	bl sub_02008C64
	cmp r0, #0
	beq _02008710
	mov r2, r7
	add r1, r5, r4
	bl sub_02009AB0
_02008710:
	add r6, r6, #1
	mov r8, r8, lsr #1
_02008718:
	cmp r6, #0x10
	bge _02008728
	cmp r8, #0
	bne _020086E8
_02008728:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02008730: .word 0x038083B0
	arm_func_end sub_020086C8

	arm_func_start sub_02008734
sub_02008734: ; 0x02008734
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	mov r0, r2, lsl #0x10
	ldr r5, _020087A0 ; =0x038083B0
	mov r7, r1
	mov r6, #0
	mov r8, r0, lsr #0x10
	b _02008788
_02008758:
	tst r7, #1
	beq _02008780
	mov r1, r6
	add r0, r5, r4
	bl sub_02008C64
	cmp r0, #0
	strneh r8, [r0, #0x1e]
	ldrneb r1, [r0]
	orrne r1, r1, #0x80
	strneb r1, [r0]
_02008780:
	add r6, r6, #1
	mov r7, r7, lsr #1
_02008788:
	cmp r6, #0x10
	bge _02008798
	cmp r7, #0
	bne _02008758
_02008798:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_020087A0: .word 0x038083B0
	arm_func_end sub_02008734

	arm_func_start sub_020087A4
sub_020087A4: ; 0x020087A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _0200882C ; =0x038083B0
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_020087C0:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _02008818
	mov r8, fp
	b _02008810
_020087DC:
	mov r1, r8
	add r0, r6, r5
	bl sub_02008C64
	cmp r0, #0
	beq _0200880C
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _0200880C
	add r0, r6, r5
	bl sub_02008CE8
	b _02008818
_0200880C:
	add r8, r8, #1
_02008810:
	cmp r8, #0x10
	blt _020087DC
_02008818:
	add r7, r7, #1
	cmp r7, #0x10
	blt _020087C0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200882C: .word 0x038083B0
	arm_func_end sub_020087A4

	arm_func_start sub_02008830
sub_02008830: ; 0x02008830
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _02008888 ; =0x038083B0
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_02008848:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _02008874
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _02008874
	bl sub_02008CE8
_02008874:
	add r5, r5, #1
	cmp r5, #0x10
	blt _02008848
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02008888: .word 0x038083B0
	arm_func_end sub_02008830

	arm_func_start sub_0200888C
sub_0200888C: ; 0x0200888C
	stmdb sp!, {r3, lr}
	ldr lr, _020088CC ; =0x038083B0
	mov ip, #0x24
	mla ip, r0, ip, lr
	cmp r3, #1
	beq _020088B8
	cmp r3, #2
	beq _020088C0
	cmp r3, #4
	streq r2, [ip, r1]
	b _020088C4
_020088B8:
	strb r2, [ip, r1]
	b _020088C4
_020088C0:
	strh r2, [ip, r1]
_020088C4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_020088CC: .word 0x038083B0
	arm_func_end sub_0200888C

	arm_func_start sub_020088D0
sub_020088D0: ; 0x020088D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	mul r5, r0, r4
	mov r8, r3
	mov r0, r8, lsl #0x10
	ldr r7, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov r6, #0
	mov fp, r0, lsr #0x10
	and r4, r8, #0xff
	b _02008950
_02008900:
	tst sl, #1
	beq _02008948
	ldr r0, _02008968 ; =0x038083B0
	mov r1, r6
	add r0, r0, r5
	bl sub_02008C64
	cmp r0, #0
	beq _02008948
	cmp r7, #1
	beq _0200893C
	cmp r7, #2
	beq _02008944
	cmp r7, #4
	streq r8, [r0, sb]
	b _02008948
_0200893C:
	strb r4, [r0, sb]
	b _02008948
_02008944:
	strh fp, [r0, sb]
_02008948:
	add r6, r6, #1
	mov sl, sl, lsr #1
_02008950:
	cmp r6, #0x10
	bge _02008960
	cmp sl, #0
	bne _02008900
_02008960:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02008968: .word 0x038083B0
	arm_func_end sub_020088D0

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

	arm_func_start sub_02009E38
sub_02009E38: ; 0x02009E38
	ldr ip, _02009E54 ; =0x03807E6C
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_02009E54: .word 0x03807E6C
	arm_func_end sub_02009E38

	arm_func_start sub_02009E58
sub_02009E58: ; 0x02009E58
	ldr r2, _02009E70 ; =0x03807E6C
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_02009E70: .word 0x03807E6C
	arm_func_end sub_02009E58

	arm_func_start sub_02009E74
sub_02009E74: ; 0x02009E74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02009F08 ; =0x03807E6C
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _02009F00
	mov r7, r4
	mov r6, #1
_02009E98:
	mov r0, r7
	bl sub_02006D38
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	movne r0, r0, lsl #0x10
	add r7, r7, #1
	movne r4, r0, lsr #0x10
	cmp r7, #0x10
	blt _02009E98
	mov r0, #0
	bl sub_02007334
	cmp r0, #0
	orrne r0, r5, #1
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	mov r0, #1
	bl sub_02007334
	cmp r0, #0
	orrne r0, r5, #2
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	ldr r0, _02009F08 ; =0x03807E6C
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_02009F00:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_02009F08: .word 0x03807E6C
	arm_func_end sub_02009E74

	arm_func_start sub_02009F0C
sub_02009F0C: ; 0x02009F0C
	ldr r1, _02009F34 ; =0x03807E70
	mov r3, #0
	mov r2, r3
_02009F18:
	add r0, r1, r3, lsl #6
	strb r2, [r0, #0xf80]
	add r3, r3, #1
	strb r2, [r0, #0xf81]
	cmp r3, #8
	blt _02009F18
	bx lr
	.align 2, 0
_02009F34: .word 0x03807E70
	arm_func_end sub_02009F0C

	arm_func_start sub_02009F38
sub_02009F38: ; 0x02009F38
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr lr, _02009F90 ; =sub_03808DF0
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _02009F70
	add r0, r8, #0x14
	bl sub_020057A8
	mov r0, #0
	strb r0, [r8]
_02009F70:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_02009F90: .word sub_03808DF0
	arm_func_end sub_02009F38

	arm_func_start sub_02009F94
sub_02009F94: ; 0x02009F94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _0200A048 ; =sub_03808DF0
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _02009FC4
	add r0, r8, #0x14
	bl sub_020057A8
	mov r0, #0
	strb r0, [r8]
_02009FC4:
	ldrb r1, [r8, #1]
	ldr r7, [r8, #0xc]
	ldr r6, [r8, #0x10]
	add r0, r8, #0x14
	ldr r5, [r8, #4]
	ldr r4, [r8, #8]
	orr sb, sb, r1, lsl #8
	bl sub_02005588
	cmp r6, #0
	cmpeq r7, #0
	bne _0200A00C
	ldr r3, _0200A04C ; =0x03801EA8
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl sub_020056C4
	b _0200A034
_0200A00C:
	bl sub_02005404
	ldr r2, _0200A04C ; =0x03801EA8
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl sub_02005734
_0200A034:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200A048: .word sub_03808DF0
_0200A04C: .word 0x03801EA8
	arm_func_end sub_02009F94

	arm_func_start sub_0200A050
sub_0200A050: ; 0x0200A050
	stmdb sp!, {r4, lr}
	ldr r2, _0200A08C ; =sub_03808DF0
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _0200A084
	add r0, r4, #0x14
	bl sub_020057A8
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_0200A084:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200A08C: .word sub_03808DF0
	arm_func_end sub_0200A050

	arm_func_start sub_0200A090
sub_0200A090: ; 0x0200A090
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_0200A0A0:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_020065F8
	cmp r0, #0
	blt _0200A0A0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0200A090

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

	arm_func_start sub_0200A104
sub_0200A104: ; 0x0200A104
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _0200A77C
_0200A110:
	ldr sl, _0200A7A0 ; =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _0200A760
_0200A120:
	add r5, sp, #0x1c
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _0200A75C
_0200A144: ; jump table
	b _0200A1CC ; case 0
	b _0200A1E4 ; case 1
	b _0200A1F0 ; case 2
	b _0200A208 ; case 3
	b _0200A214 ; case 4
	b _0200A224 ; case 5
	b _0200A234 ; case 6
	b _0200A24C ; case 7
	b _0200A274 ; case 8
	b _0200A288 ; case 9
	b _0200A29C ; case 10
	b _0200A2B8 ; case 11
	b _0200A2D0 ; case 12
	b _0200A398 ; case 13
	b _0200A574 ; case 14
	b _0200A5F4 ; case 15
	b _0200A62C ; case 16
	b _0200A43C ; case 17
	b _0200A484 ; case 18
	b _0200A4AC ; case 19
	b _0200A4EC ; case 20
	b _0200A534 ; case 21
	b _0200A65C ; case 22
	b _0200A668 ; case 23
	b _0200A674 ; case 24
	b _0200A680 ; case 25
	b _0200A698 ; case 26
	b _0200A6A8 ; case 27
	b _0200A6B8 ; case 28
	b _0200A6F8 ; case 29
	b _0200A6C8 ; case 30
	b _0200A6D8 ; case 31
	b _0200A6E8 ; case 32
	b _0200A708 ; case 33
_0200A1CC:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_020084F8
	b _0200A75C
_0200A1E4:
	ldr r0, [sp, #0x24]
	bl sub_02008528
	b _0200A75C
_0200A1F0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_0200829C
	b _0200A75C
_0200A208:
	ldr r0, [sp, #0x24]
	bl sub_020084D8
	b _0200A75C
_0200A214:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02008584
	b _0200A75C
_0200A224:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_020085FC
	b _0200A75C
_0200A234:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_0200888C
	b _0200A75C
_0200A24C:
	ldr r1, [sp, #0x24]
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_020088D0
	b _0200A75C
_0200A274:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl sub_020086C8
	b _0200A75C
_0200A288:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl sub_02008734
	b _0200A75C
_0200A29C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_02009E38
	b _0200A75C
_0200A2B8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02009E58
	b _0200A75C
_0200A2D0:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl sub_02005EE8
	mov r8, r0
	mov r2, #0
	b _0200A30C
_0200A2EC:
	tst r5, #1
	movne r0, r2, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strneb r1, [r0, #0x403]
	mov r5, r5, lsr #1
_0200A30C:
	cmp r2, #0x10
	bge _0200A31C
	cmp r5, #0
	bne _0200A2EC
_0200A31C:
	tst r6, #1
	beq _0200A348
	tst r6, #2
	ldrneh r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strneh r0, [r4]
	ldreqb r0, [r4]
	orreq r0, r0, #0x80
	streqb r0, [r4]
	b _0200A358
_0200A348:
	tst r6, #2
	ldrneb r0, [sl]
	orrne r0, r0, #0x80
	strneb r0, [sl]
_0200A358:
	mov r5, #0
	b _0200A378
_0200A360:
	tst r7, #1
	beq _0200A370
	mov r0, r5
	bl sub_02009F94
_0200A370:
	add r5, r5, #1
	mov r7, r7, lsr #1
_0200A378:
	cmp r5, #8
	bge _0200A388
	cmp r7, #0
	bne _0200A360
_0200A388:
	mov r0, r8
	bl sub_02005EFC
	bl sub_02009E74
	b _0200A75C
_0200A398:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl sub_02005EE8
	mov fp, r0
	mov r8, #0
	b _0200A3D0
_0200A3B8:
	tst r7, #1
	beq _0200A3C8
	mov r0, r8
	bl sub_0200A050
_0200A3C8:
	add r8, r8, #1
	mov r7, r7, lsr #1
_0200A3D0:
	cmp r8, #8
	bge _0200A3E0
	cmp r7, #0
	bne _0200A3B8
_0200A3E0:
	mov r7, #0
	b _0200A404
_0200A3E8:
	tst r5, #1
	beq _0200A3FC
	mov r0, r7
	mov r1, sb
	bl sub_02006C08
_0200A3FC:
	add r7, r7, #1
	mov r5, r5, lsr #1
_0200A404:
	cmp r7, #0x10
	bge _0200A414
	cmp r5, #0
	bne _0200A3E8
_0200A414:
	tst r6, #1
	movne r0, #0
	strneb r0, [r4]
	tst r6, #2
	movne r0, #0
	strneb r0, [sl]
	mov r0, fp
	bl sub_02005EFC
	bl sub_02009E74
	b _0200A75C
_0200A43C:
	ldr r1, [sp, #0x2c]
	mov r0, r1, lsr #0x1d
	and r0, r0, #1
	str r0, [sp]
	mov r0, r1, lsr #0x1c
	and r0, r0, #1
	str r0, [sp, #4]
	mov r0, r1, lsr #0x1b
	and r0, r0, #1
	str r0, [sp, #8]
	mov r0, r1, lsr #0x1f
	and r0, r0, #1
	mov r1, r1, lsr #0x1e
	and r1, r1, #1
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl sub_020072E4
	b _0200A75C
_0200A484:
	ldr r0, [sp, #0x30]
	mov r2, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02009F38
	b _0200A75C
_0200A4AC:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _0200A4D8
_0200A4BC:
	tst r5, #1
	beq _0200A4D0
	mov r0, r7
	mov r1, r6
	bl sub_02006CA8
_0200A4D0:
	add r7, r7, #1
	mov r5, r5, lsr #1
_0200A4D8:
	cmp r7, #0x10
	bge _0200A75C
	cmp r5, #0
	bne _0200A4BC
	b _0200A75C
_0200A4EC:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r8, #0
	b _0200A520
_0200A500:
	tst r5, #1
	beq _0200A518
	mov r0, r8
	mov r1, r6
	mov r2, r7
	bl sub_02006C30
_0200A518:
	add r8, r8, #1
	mov r5, r5, lsr #1
_0200A520:
	cmp r8, #0x10
	bge _0200A75C
	cmp r5, #0
	bne _0200A500
	b _0200A75C
_0200A534:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _0200A560
_0200A544:
	tst r5, #1
	beq _0200A558
	mov r0, r7
	mov r1, r6
	bl sub_02006CC0
_0200A558:
	add r7, r7, #1
	mov r5, r5, lsr #1
_0200A560:
	cmp r7, #0x10
	bge _0200A75C
	cmp r5, #0
	bne _0200A544
	b _0200A75C
_0200A574:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	mov r1, r3, lsl #0x10
	ldr r2, [sp, #0x2c]
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldr r1, _0200A7A4 ; =0x003FFFFF
	and r1, r2, r1
	str r1, [sp, #4]
	mov r1, r2, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #8]
	mov r1, r2, lsr #0x16
	and r1, r1, #3
	str r1, [sp, #0xc]
	mov r1, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #0x10]
	mov r1, r3, lsr #0x10
	mov r2, r3, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x28]
	mov r0, r0, lsl #0x10
	mov r3, r3, lsr #0x1a
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf8000000
	and r2, r2, #3
	and r3, r3, #3
	bl sub_020069EC
	b _0200A75C
_0200A5F4:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	mov r0, r1, lsl #8
	mov r0, r0, lsr #0x10
	str r0, [sp]
	and r0, r1, #0x7f
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x30]
	and r2, r3, #0x7f
	mov r3, r3, lsr #8
	and r3, r3, #3
	bl sub_02006AB8
	b _0200A75C
_0200A62C:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	and r0, r1, #0x7f
	str r0, [sp]
	mov r0, r1, lsl #8
	mov r3, r0, lsr #0x10
	ldr r0, [sp, #0x24]
	and r1, r2, #0x7f
	mov r2, r2, lsr #8
	and r2, r2, #3
	bl sub_02006B64
	b _0200A75C
_0200A65C:
	ldr r0, [sp, #0x24]
	bl sub_02006DC8
	b _0200A75C
_0200A668:
	ldr r0, [sp, #0x24]
	bl sub_020069A4
	b _0200A75C
_0200A674:
	ldr r0, [sp, #0x24]
	bl sub_02006D54
	b _0200A75C
_0200A680:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_020069B4
	b _0200A75C
_0200A698:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02007DC8
	b _0200A75C
_0200A6A8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02007EA8
	b _0200A75C
_0200A6B8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02007D18
	b _0200A75C
_0200A6C8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_020087A4
	b _0200A75C
_0200A6D8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02008830
	b _0200A75C
_0200A6E8:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_02007EFC
	b _0200A75C
_0200A6F8:
	ldr r1, [sp, #0x24]
	ldr r0, _0200A7A8 ; =0x03807E6C
	str r1, [r0]
	b _0200A75C
_0200A708:
	ldr r5, [sp, #0x24]
	ldr r0, _0200A7AC ; =0x03807E70
	mov r1, r5
	mov r2, #0x1180
	bl sub_020061D4
	ldr r0, _0200A7AC ; =0x03807E70
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_0200A72C:
	mov r0, r6
	bl sub_02006DB8
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _0200A72C
	mov r0, #0
	bl sub_02007EE0
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_0200A75C:
	ldr r6, [sp, #0x1c]
_0200A760:
	cmp r6, #0
	bne _0200A120
	ldr r0, _0200A7A8 ; =0x03807E6C
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_0200A77C:
	ldr r0, _0200A7B0 ; =0x03808FF0
	add r1, sp, #0x18
	mov r2, #0
	bl sub_02004948
	cmp r0, #0
	bne _0200A110
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0200A7A0: .word 0x04000509
_0200A7A4: .word 0x003FFFFF
_0200A7A8: .word 0x03807E6C
_0200A7AC: .word 0x03807E70
_0200A7B0: .word 0x03808FF0
	arm_func_end sub_0200A104

	arm_func_start sub_0200A7B4
sub_0200A7B4: ; 0x0200A7B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl sub_02005EE8
	mov r4, r0
	cmp r5, #0x2000000
	blo _0200A7E0
	ldr r0, _0200A7FC ; =0x03808FF0
	mov r1, r5
	mov r2, #0
	bl sub_020048BC
	b _0200A7EC
_0200A7E0:
	cmp r5, #0
	bne _0200A7EC
	bl sub_020071B0
_0200A7EC:
	mov r0, r4
	bl sub_02005EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200A7FC: .word 0x03808FF0
	arm_func_end sub_0200A7B4

	arm_func_start sub_0200A800
sub_0200A800: ; 0x0200A800
	ldr ip, _0200A808 ; =sub_03803168
	bx ip
	.align 2, 0
_0200A808: .word sub_03803168
	arm_func_end sub_0200A800

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
	sub r7, r7, #1
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

	arm_func_start sub_0200AACC
sub_0200AACC: ; 0x0200AACC
	ldr r1, _0200AB08 ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_0200AADC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0200AADC
	ldr r2, _0200AB08 ; =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0200AB08: .word 0x040001A2
	arm_func_end sub_0200AACC

	arm_func_start sub_0200AB0C
sub_0200AB0C: ; 0x0200AB0C
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _0200AB58 ; =0x040001A2
	ldrb r1, [r1]
	strh r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	sub r1, r2, #2
_0200AB34:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200AB34
	ldr r0, _0200AB58 ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	.align 2, 0
_0200AB58: .word 0x040001A2
	arm_func_end sub_0200AB0C

	arm_func_start sub_0200AB5C
sub_0200AB5C: ; 0x0200AB5C
	ldr r1, _0200ABBC ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_0200AB6C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _0200AB6C
	ldr r2, _0200ABBC ; =0x040001A2
	ldr r1, [r0, #4]
	ldrh r2, [r2]
	ldrb r1, [r1]
	and r2, r2, #0xff
	cmp r2, r1
	beq _0200ABAC
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0]
	cmp r1, #1
	movhi r1, #1
	strhi r1, [r0]
_0200ABAC:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_0200ABBC: .word 0x040001A2
	arm_func_end sub_0200AB5C

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

	arm_func_start sub_0200B278
sub_0200B278: ; 0x0200B278
	bx lr
	arm_func_end sub_0200B278

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
	b _0200B4A8
	.align 2, 0
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

	thumb_func_start sub_0200B99C
sub_0200B99C: ; 0x0200B99C
	swi 0
	bx lr
	thumb_func_end sub_0200B99C

	thumb_func_start sub_0200B9A0
sub_0200B9A0: ; 0x0200B9A0
	swi 3
	bx lr
	thumb_func_end sub_0200B9A0

	thumb_func_start sub_0200B9A4
sub_0200B9A4: ; 0x0200B9A4
	ldr r2, _0200B9B0 ; =0x04000000
	mov ip, r2
	mov r2, #0
	swi 4
	bx lr
	.align 2, 0
_0200B9B0: .word 0x04000000
	thumb_func_end sub_0200B9A4

	thumb_func_start sub_0200B9B4
sub_0200B9B4: ; 0x0200B9B4
	mov r2, #0
	swi 5
	bx lr
	thumb_func_end sub_0200B9B4

	non_word_aligned_thumb_func_start sub_0200B9BA
sub_0200B9BA: ; 0x0200B9BA
	swi 6
	bx lr
	thumb_func_end sub_0200B9BA

	non_word_aligned_thumb_func_start sub_0200B9BE
sub_0200B9BE: ; 0x0200B9BE
	swi 7
	bx lr
	thumb_func_end sub_0200B9BE

	non_word_aligned_thumb_func_start sub_0200B9C2
sub_0200B9C2: ; 0x0200B9C2
	swi 8
	bx lr
	thumb_func_end sub_0200B9C2

	non_word_aligned_thumb_func_start sub_0200B9C6
sub_0200B9C6: ; 0x0200B9C6
	add r1, r0, #0
	mov r0, #1
	swi 8
	bx lr
	thumb_func_end sub_0200B9C6

	non_word_aligned_thumb_func_start sub_0200B9CE
sub_0200B9CE: ; 0x0200B9CE
	add r1, r0, #0
	mov r0, #0
	swi 8
	bx lr
	thumb_func_end sub_0200B9CE

	non_word_aligned_thumb_func_start sub_0200B9D6
sub_0200B9D6: ; 0x0200B9D6
	swi 9
	bx lr
	thumb_func_end sub_0200B9D6

	non_word_aligned_thumb_func_start sub_0200B9DA
sub_0200B9DA: ; 0x0200B9DA
	swi 9
	add r0, r1, #0
	bx lr
	thumb_func_end sub_0200B9DA

	thumb_func_start sub_0200B9E0
sub_0200B9E0: ; 0x0200B9E0
	swi 0xb
	bx lr
	thumb_func_end sub_0200B9E0

	thumb_func_start sub_0200B9E4
sub_0200B9E4: ; 0x0200B9E4
	swi 0xc
	bx lr
	thumb_func_end sub_0200B9E4

	thumb_func_start sub_0200B9E8
sub_0200B9E8: ; 0x0200B9E8
	swi 0xd
	bx lr
	thumb_func_end sub_0200B9E8

	thumb_func_start sub_0200B9EC
sub_0200B9EC: ; 0x0200B9EC
	swi 0xe
	bx lr
	thumb_func_end sub_0200B9EC

	thumb_func_start sub_0200B9F0
sub_0200B9F0: ; 0x0200B9F0
	swi 0xf
	bx lr
	thumb_func_end sub_0200B9F0

	thumb_func_start sub_0200B9F4
sub_0200B9F4: ; 0x0200B9F4
	swi 0x10
	bx lr
	thumb_func_end sub_0200B9F4

	thumb_func_start sub_0200B9F8
sub_0200B9F8: ; 0x0200B9F8
	swi 0x11
	bx lr
	thumb_func_end sub_0200B9F8

	thumb_func_start sub_0200B9FC
sub_0200B9FC: ; 0x0200B9FC
	swi 0x12
	bx lr
	thumb_func_end sub_0200B9FC

	thumb_func_start sub_0200BA00
sub_0200BA00: ; 0x0200BA00
	swi 0x13
	bx lr
	thumb_func_end sub_0200BA00

	thumb_func_start sub_0200BA04
sub_0200BA04: ; 0x0200BA04
	swi 0x14
	bx lr
	thumb_func_end sub_0200BA04

	thumb_func_start sub_0200BA08
sub_0200BA08: ; 0x0200BA08
	swi 0x15
	bx lr
	thumb_func_end sub_0200BA08

	thumb_func_start sub_0200BA0C
sub_0200BA0C: ; 0x0200BA0C
	swi 0x1a
	bx lr
	thumb_func_end sub_0200BA0C

	thumb_func_start sub_0200BA10
sub_0200BA10: ; 0x0200BA10
	swi 0x1b
	bx lr
	thumb_func_end sub_0200BA10

	thumb_func_start sub_0200BA14
sub_0200BA14: ; 0x0200BA14
	swi 0x1c
	bx lr
	thumb_func_end sub_0200BA14

	arm_func_start sub_0200BA18
sub_0200BA18: ; 0x0200BA18
	ldr r1, _0200BA50 ; =0x55555555
	ldr r2, _0200BA54 ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r1, r0, r1
	ldr r0, _0200BA58 ; =0x0F0F0F0F
	and r3, r1, r2
	and r1, r2, r1, lsr #2
	add r1, r3, r1
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200BA50: .word 0x55555555
_0200BA54: .word 0x33333333
_0200BA58: .word 0x0F0F0F0F
	arm_func_end sub_0200BA18

	arm_func_start sub_0200BA5C
sub_0200BA5C: ; 0x0200BA5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r1, _0200BB58 ; =0x038098D0
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _0200BB4C
	mov r0, #1
	strh r0, [r1]
	mov r0, #0
	str r0, [r1, #4]
	mov r0, #5
	str r0, [r1, #8]
	bl sub_0200BF38
	bl sub_00FFD194
	bl sub_0200D548
	bl sub_0200CA8C
	bl sub_0200649C
	ldr r1, _0200BB5C ; =0x03803CE8
	mov r0, #6
	bl sub_02006584
	ldr r1, _0200BB5C ; =0x03803CE8
	mov r0, #9
	bl sub_02006584
	ldr r1, _0200BB5C ; =0x03803CE8
	mov r0, #8
	bl sub_02006584
	ldr r1, _0200BB5C ; =0x03803CE8
	mov r0, #4
	bl sub_02006584
	ldr r0, _0200BB60 ; =0x03809B80
	ldr r1, _0200BB64 ; =0x03809BA0
	mov r2, #0x10
	bl sub_02004894
	mov sb, #0
	mov r6, #0x18
	ldr r8, _0200BB68 ; =0x03809BE0
	mov r7, sb
	mov r5, r6
_0200BAF8:
	mla r0, sb, r5, r8
	mov r1, r7
	mov r2, r6
	bl sub_02006258
	add sb, sb, #1
	cmp sb, #0x10
	blt _0200BAF8
	ldr r0, _0200BB58 ; =0x038098D0
	mov r2, #0
	str r2, [r0, #0x490]
	str r2, [r0, #0x498]
	str r2, [r0, #0x494]
	mov r0, #0x200
	str r0, [sp]
	ldr r0, _0200BB6C ; =0x038098DC
	ldr r1, _0200BB70 ; =0x03803C7C
	ldr r3, _0200BB60 ; =0x03809B80
	str r4, [sp, #4]
	bl sub_0200423C
	ldr r0, _0200BB6C ; =0x038098DC
	bl sub_02004554
_0200BB4C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0200BB58: .word 0x038098D0
_0200BB5C: .word 0x03803CE8
_0200BB60: .word 0x03809B80
_0200BB64: .word 0x03809BA0
_0200BB68: .word 0x03809BE0
_0200BB6C: .word 0x038098DC
_0200BB70: .word 0x03803C7C
	arm_func_end sub_0200BA5C

	arm_func_start sub_0200BB74
sub_0200BB74: ; 0x0200BB74
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0200BBC8 ; =0x03809D64
	ldr r4, _0200BBCC ; =0x038098D0
	mov r6, r0
_0200BB84:
	bl sub_02005EE8
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0200BBA4
	bl sub_02005EFC
	mov r0, r5
	bl sub_02004478
	b _0200BB84
_0200BBA4:
	ldr r1, _0200BBCC ; =0x038098D0
	mov r2, #1
	str r2, [r1, #4]
	mov r2, #4
	str r2, [r1, #8]
	str r6, [r1, #0x49c]
	bl sub_02005EFC
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0200BBC8: .word 0x03809D64
_0200BBCC: .word 0x038098D0
	arm_func_end sub_0200BB74

	arm_func_start sub_0200BBD0
sub_0200BBD0: ; 0x0200BBD0
	stmdb sp!, {r3, lr}
	ldr r1, _0200BC28 ; =0x038098D0
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _0200BC20
	ldr r2, [r1, #8]
	cmp r2, #4
	ldreq r1, [r1, #0x49c]
	cmpeq r1, r0
	bne _0200BC20
	bl sub_02005EE8
	ldr r1, _0200BC28 ; =0x038098D0
	mov r2, #5
	str r2, [r1, #8]
	mov r2, #0
	str r2, [r1, #4]
	str r2, [r1, #0x49c]
	bl sub_02005EFC
	ldr r0, _0200BC2C ; =0x03809D64
	bl sub_020044CC
_0200BC20:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200BC28: .word 0x038098D0
_0200BC2C: .word 0x03809D64
	arm_func_end sub_0200BBD0

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

	arm_func_start sub_0200BE44
sub_0200BE44: ; 0x0200BE44
	stmdb sp!, {r3, lr}
	ldr r0, _0200BE60 ; =0x03809B80
	add r1, sp, #0
	mov r2, #0
	bl sub_020049E4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200BE60: .word 0x03809B80
	arm_func_end sub_0200BE44

	arm_func_start sub_0200BE64
sub_0200BE64: ; 0x0200BE64
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r6, _0200BECC ; =0x03809B80
	add r5, sp, #0
	mov r4, #1
_0200BE78:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02004948
	ldr r0, [sp]
	ldr r1, [r0]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0200BE78
_0200BE9C: ; jump table
	b _0200BEAC ; case 0
	b _0200BEC4 ; case 1
	b _0200BEB4 ; case 2
	b _0200BEBC ; case 3
_0200BEAC:
	bl sub_0200C230
	b _0200BE78
_0200BEB4:
	bl sub_0200D8FC
	b _0200BE78
_0200BEBC:
	bl sub_0200CC84
	b _0200BE78
_0200BEC4:
	bl sub_00FFD364
	b _0200BE78
	.align 2, 0
_0200BECC: .word 0x03809B80
	arm_func_end sub_0200BE64

	arm_func_start sub_0200BED0
sub_0200BED0: ; 0x0200BED0
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _0200BF30
	sub r0, r0, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0200BF30
_0200BEEC: ; jump table
	b _0200BF28 ; case 0
	b _0200BF30 ; case 1
	b _0200BF04 ; case 2
	b _0200BF30 ; case 3
	b _0200BF1C ; case 4
	b _0200BF10 ; case 5
_0200BF04:
	mov r0, r1
	bl sub_0200C048
	b _0200BF30
_0200BF10:
	mov r0, r1
	bl sub_0200D590
	b _0200BF30
_0200BF1C:
	mov r0, r1
	bl sub_0200CAC8
	b _0200BF30
_0200BF28:
	mov r0, r1
	bl sub_00FFD1BC
_0200BF30:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0200BED0

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

	arm_func_start sub_0200CA8C
sub_0200CA8C: ; 0x0200CA8C
	ldr r0, _0200CAC0 ; =0x03809E4C
	mov r1, #1
	str r1, [r0, #4]
	mov r3, #0
	str r3, [r0, #0x28]
	ldr r0, _0200CAC4 ; =0x03809E54
	mov r2, r3
_0200CAA8:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0200CAA8
	bx lr
	.align 2, 0
_0200CAC0: .word 0x03809E4C
_0200CAC4: .word 0x03809E54
	arm_func_end sub_0200CA8C

	arm_func_start sub_0200CAC8
sub_0200CAC8: ; 0x0200CAC8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _0200CAF8
	ldr r1, _0200CC7C ; =0x03809E54
	mov r4, #0
	mov r3, r4
_0200CAE4:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0200CAE4
_0200CAF8:
	ldr r1, _0200CC7C ; =0x03809E54
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _0200CC70
	ldr r1, _0200CC80 ; =0x03809E4C
	ldrh r2, [r1, #8]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x60
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0200CC64
_0200CB38: ; jump table
	b _0200CB58 ; case 0
	b _0200CB68 ; case 1
	b _0200CC64 ; case 2
	b _0200CC00 ; case 3
	b _0200CB9C ; case 4
	b _0200CBD0 ; case 5
	b _0200CC34 ; case 6
	b _0200CC4C ; case 7
_0200CB58:
	mov r0, #0x60
	mov r1, #0
	bl sub_0200BC30
	b _0200CC70
_0200CB68:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl sub_0200BD64
	cmp r0, #0
	bne _0200CC70
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200CC70
_0200CB9C:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl sub_0200BD64
	cmp r0, #0
	bne _0200CC70
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200CC70
_0200CBD0:
	mov r0, r2, lsl #0x10
	mov r1, r4
	mov r3, r0, lsr #0x10
	mov r0, #3
	mov r2, #1
	bl sub_0200BD64
	cmp r0, #0
	bne _0200CC70
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200CC70
_0200CC00:
	ldrh r0, [r1, #0xa]
	mov r2, r2, lsl #0x18
	mov r1, r4
	orr r3, r0, r2, lsr #8
	mov r0, #3
	mov r2, #1
	bl sub_0200BD64
	cmp r0, #0
	bne _0200CC70
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200CC70
_0200CC34:
	and r0, r2, #0xff
	bl sub_0200D404
	mov r0, #0x66
	mov r1, #0
	bl sub_0200BC30
	b _0200CC70
_0200CC4C:
	bl sub_0200D420
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x67
	bl sub_0200BC30
	b _0200CC70
_0200CC64:
	mov r0, r4
	mov r1, #1
	bl sub_0200BC30
_0200CC70:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_0200CC7C: .word 0x03809E54
_0200CC80: .word 0x03809E4C
	arm_func_end sub_0200CAC8

	arm_func_start sub_0200CC84
sub_0200CC84: ; 0x0200CC84
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_02005EE8
	mov r5, r0
	mov r0, #3
	bl sub_0200BCF4
	cmp r0, #0
	bne _0200CCC4
	mov r0, r5
	bl sub_02005EFC
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	b _0200CDE8
_0200CCC4:
	mov r0, #3
	bl sub_0200BD10
	mov r0, r5
	bl sub_02005EFC
	ldr r1, [r4, #4]
	sub r0, r1, #0x61
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0200CDD0
_0200CCE8: ; jump table
	b _0200CD00 ; case 0
	b _0200CDD0 ; case 1
	b _0200CD9C ; case 2
	b _0200CD24 ; case 3
	b _0200CD60 ; case 4
	b _0200CDC4 ; case 5
_0200CD00:
	ldr r0, _0200CDF0 ; =0x03809E4C
	mov r1, #1
	str r1, [r0, #0x28]
	ldr r1, [r4, #8]
	strh r1, [r0, #2]
	ldr r1, [r4, #0xc]
	strh r1, [r0]
	bl sub_0200D104
	b _0200CDE0
_0200CD24:
	ldr r2, _0200CDF0 ; =0x03809E4C
	mov r0, #4
	str r0, [r2, #0x28]
	ldr r0, [r4, #8]
	str r0, [r2, #0x30]
	ldr r3, [r4, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r1, r3, #0xff
	str r3, [r2, #0x2c]
	bl sub_0200CE38
	mov r0, #0x64
	mov r1, #0
	bl sub_0200BC30
	b _0200CDE0
_0200CD60:
	ldr r1, _0200CDF0 ; =0x03809E4C
	mov r0, #3
	str r0, [r1, #0x28]
	ldr r2, [r4, #8]
	mov r0, r2, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r4
	str r2, [r1, #0x30]
	bl sub_0200CEB4
	add r1, r4, #0x70
	mov r2, r1, lsl #0x10
	mov r1, r0
	mov r0, r2, lsr #0x10
	bl sub_0200BC30
	b _0200CDE0
_0200CD9C:
	ldr r1, _0200CDF0 ; =0x03809E4C
	mov r0, #2
	str r0, [r1, #0x28]
	ldr r0, [r4, #8]
	str r0, [r1, #0x2c]
	bl sub_0200CF78
	mov r0, #0x63
	mov r1, #0
	bl sub_0200BC30
	b _0200CDE0
_0200CDC4:
	ldr r0, [r4, #8]
	bl sub_0200D09C
	b _0200CDE0
_0200CDD0:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl sub_0200BC30
_0200CDE0:
	mov r0, #3
	bl sub_0200BD28
_0200CDE8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200CDF0: .word 0x03809E4C
	arm_func_end sub_0200CC84

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

	arm_func_start sub_0200D420
sub_0200D420: ; 0x0200D420
	ldr r0, _0200D42C ; =0x03809E80
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0200D42C: .word 0x03809E80
	arm_func_end sub_0200D420

	arm_func_start sub_0200D430
sub_0200D430: ; 0x0200D430
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r3, _0200D46C ; =0x03809E88
	mov r1, #0
	ldr r0, _0200D470 ; =0x03809E98
	mov r2, #0xa4
	stmib r3, {r1, r4}
	bl sub_02006258
	mov r0, r4
	bl sub_0200D4A4
	ldr r0, _0200D46C ; =0x03809E88
	mov r1, #3
	strb r1, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200D46C: .word 0x03809E88
_0200D470: .word 0x03809E98
	arm_func_end sub_0200D430

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

	arm_func_start sub_0200D548
sub_0200D548: ; 0x0200D548
	ldr r0, _0200D584 ; =0x0380B1FC
	mov r3, #0
	str r3, [r0, #0x20]
	ldr r0, _0200D588 ; =0x0380B1FC
	mov r2, r3
_0200D55C:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0200D55C
	ldr r1, _0200D58C ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200D584: .word 0x0380B1FC
_0200D588: .word 0x0380B1FC
_0200D58C: .word 0x0400010E
	arm_func_end sub_0200D548

	arm_func_start sub_0200D590
sub_0200D590: ; 0x0200D590
	stmdb sp!, {r4, lr}
	tst r0, #0x2000000
	beq _0200D5BC
	ldr r1, _0200D848 ; =0x0380B1FC
	mov r4, #0
	mov r3, r4
_0200D5A8:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0200D5A8
_0200D5BC:
	ldr r1, _0200D848 ; =0x0380B1FC
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _0200D840
	ldr r1, _0200D84C ; =0x0380B1FC
	ldrh r2, [r1]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x40
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0200D834
_0200D5FC: ; jump table
	b _0200D60C ; case 0
	b _0200D648 ; case 1
	b _0200D74C ; case 2
	b _0200D7B0 ; case 3
_0200D60C:
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #2
	mov r2, #1
	bl sub_0200BD64
	cmp r0, #0
	bne _0200D634
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
_0200D634:
	ldr r0, _0200D850 ; =0x027FFF94
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #-4]
	b _0200D840
_0200D648:
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0200D664
	mov r0, r4
	mov r1, #3
	bl sub_0200BC30
	b _0200D840
_0200D664:
	and r0, r2, #0xff
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r3, r0, r2, lsl #16
	cmp r3, #0x2000000
	blo _0200D688
	cmp r3, #0x2400000
	blo _0200D698
_0200D688:
	mov r0, r4
	mov r1, #2
	bl sub_0200BC30
	b _0200D840
_0200D698:
	str r3, [r1, #0x28]
	ldrh r2, [r1, #6]
	ldrh r0, [r1, #8]
	orr r2, r0, r2, lsl #16
	add r0, r3, r2
	cmp r0, #0x2400000
	bls _0200D6C4
	mov r0, r4
	mov r1, #2
	bl sub_0200BC30
	b _0200D840
_0200D6C4:
	str r2, [r1, #0x30]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r2, lsl #16
	bl sub_0200D858
	cmp r0, #0
	bne _0200D6F0
	mov r0, r4
	mov r1, #2
	bl sub_0200BC30
	b _0200D840
_0200D6F0:
	ldr r3, _0200D84C ; =0x0380B1FC
	mov r2, #0
	str r2, [r3, #0x2c]
	ldrh r0, [r3, #0x24]
	mov r1, r4
	and ip, r0, #7
	mov r0, #2
	strh ip, [r3, #0x26]
	bl sub_0200BD64
	cmp r0, #0
	bne _0200D72C
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200D840
_0200D72C:
	ldr r1, _0200D850 ; =0x027FFF94
	mov r2, #0
	strh r2, [r1]
	ldr r0, _0200D84C ; =0x0380B1FC
	str r2, [r1, #-4]
	mov r1, #1
	str r1, [r0, #0x20]
	b _0200D840
_0200D74C:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0200D768
	mov r0, r4
	mov r1, #3
	bl sub_0200BC30
	b _0200D840
_0200D768:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl sub_0200BD64
	cmp r0, #0
	bne _0200D790
	mov r0, r4
	mov r1, #4
	bl sub_0200BC30
	b _0200D840
_0200D790:
	ldr r0, _0200D84C ; =0x0380B1FC
	mov r2, #3
	ldr r1, _0200D854 ; =0x0400010E
	str r2, [r0, #0x20]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	b _0200D840
_0200D7B0:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0200D7CC
	mov r0, r4
	mov r1, #3
	bl sub_0200BC30
	b _0200D840
_0200D7CC:
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r0, r0, r2, lsl #16
	bl sub_0200D858
	cmp r0, #0
	bne _0200D7F4
	mov r0, r4
	mov r1, #2
	bl sub_0200BC30
	b _0200D840
_0200D7F4:
	bl sub_02005EE8
	ldr r3, _0200D854 ; =0x0400010E
	ldr r1, _0200D84C ; =0x0380B1FC
	ldrh r2, [r3]
	bic r2, r2, #0x80
	strh r2, [r3]
	ldrh r2, [r1, #0x34]
	strh r2, [r3, #-2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r3]
	bl sub_02005EFC
	mov r0, r4
	mov r1, #0
	bl sub_0200BC30
	b _0200D840
_0200D834:
	mov r0, r4
	mov r1, #1
	bl sub_0200BC30
_0200D840:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200D848: .word 0x0380B1FC
_0200D84C: .word 0x0380B1FC
_0200D850: .word 0x027FFF94
_0200D854: .word 0x0400010E
	arm_func_end sub_0200D590

	arm_func_start sub_0200D858
sub_0200D858: ; 0x0200D858
	cmp r0, #0x10000
	bhs _0200D87C
	ldr r1, _0200D8F8 ; =0x0380B1FC
	mov r2, #0
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0200D87C:
	cmp r0, #0x400000
	bhs _0200D8A4
	ldr r1, _0200D8F8 ; =0x0380B1FC
	mov r3, #1
	mov r0, r0, lsr #6
	rsb r2, r0, #0x10000
	strh r3, [r1, #0x36]
	mov r0, r3
	strh r2, [r1, #0x34]
	bx lr
_0200D8A4:
	cmp r0, #0x1000000
	bhs _0200D8CC
	ldr r1, _0200D8F8 ; =0x0380B1FC
	mov r2, #2
	mov r0, r0, lsr #8
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0200D8CC:
	cmp r0, #0x4000000
	movhs r0, #0
	bxhs lr
	ldr r1, _0200D8F8 ; =0x0380B1FC
	mov r2, #3
	mov r0, r0, lsr #0xa
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
	.align 2, 0
_0200D8F8: .word 0x0380B1FC
	arm_func_end sub_0200D858

	arm_func_start sub_0200D8FC
sub_0200D8FC: ; 0x0200D8FC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r2, [r4, #4]
	cmp r2, #0x40
	beq _0200D924
	cmp r2, #0x41
	beq _0200D9D4
	cmp r2, #0x42
	beq _0200DA6C
	b _0200DB08
_0200D924:
	bl sub_02005EE8
	mov r5, r0
	mov r0, #2
	bl sub_0200BCF4
	cmp r0, #0
	bne _0200D95C
	mov r0, r5
	bl sub_02005EFC
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	b _0200DB08
_0200D95C:
	mov r0, #2
	bl sub_0200BD10
	mov r0, r5
	bl sub_02005EFC
	ldr r0, [r4, #8]
	and r0, r0, #1
	cmp r0, #1
	bne _0200D990
	bl sub_0200DE4C
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x8000
	b _0200D9A0
_0200D990:
	bl sub_0200DCF8
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x80
_0200D9A0:
	ldr r1, _0200DB10 ; =0x027FFF94
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strh r0, [r1]
	str r1, [r1, #-4]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	mov r0, #2
	bl sub_0200BD28
	b _0200DB08
_0200D9D4:
	ldr r0, _0200DB14 ; =0x0380B1FC
	ldr r1, [r0, #0x20]
	cmp r1, #1
	bne _0200DA58
	mov r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	bl sub_02005EE8
	mov r5, r0
	mov r0, #0x40
	bl sub_02003AD8
	ldr r1, _0200DB18 ; =0x0380593C
	mov r0, #0x40
	bl sub_0200DF80
	bl sub_0200DFA8
	ldr r1, _0200DB14 ; =0x0380B1FC
	ldr r2, _0200DB1C ; =0x0400010C
	ldrh r3, [r1, #0x34]
	mov r0, r5
	strh r3, [r2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r2, #2]
	bl sub_02005EFC
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0200BC30
	ldr r0, _0200DB14 ; =0x0380B1FC
	mov r1, #2
	str r1, [r0, #0x20]
	b _0200DB08
_0200DA58:
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_0200BC30
	b _0200DB08
_0200DA6C:
	ldr r0, _0200DB14 ; =0x0380B1FC
	ldr r1, [r0, #0x20]
	sub r0, r1, #3
	cmp r0, #1
	bhi _0200DAE8
	ldr r1, _0200DB20 ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bl sub_02005EE8
	mov r4, r0
	mov r0, #0x40
	mov r1, #0
	bl sub_0200DF80
	bl sub_0200E008
	mov r0, r4
	bl sub_02005EFC
	ldr r0, _0200DB14 ; =0x0380B1FC
	mov r1, #0
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _0200DAD0
	mov r0, #0x42
	bl sub_0200BC30
	b _0200DAD8
_0200DAD0:
	mov r0, #0x51
	bl sub_0200BC30
_0200DAD8:
	ldr r0, _0200DB14 ; =0x0380B1FC
	mov r1, #0
	str r1, [r0, #0x20]
	b _0200DB08
_0200DAE8:
	cmp r1, #3
	mov r1, #3
	bne _0200DB00
	mov r0, #0x42
	bl sub_0200BC30
	b _0200DB08
_0200DB00:
	mov r0, #0x51
	bl sub_0200BC30
_0200DB08:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0200DB10: .word 0x027FFF94
_0200DB14: .word 0x0380B1FC
_0200DB18: .word 0x0380593C
_0200DB1C: .word 0x0400010C
_0200DB20: .word 0x0400010E
	arm_func_end sub_0200D8FC

	arm_func_start sub_0200DB24
sub_0200DB24: ; 0x0200DB24
	stmdb sp!, {r3, lr}
	bl sub_0200DB58
	ldr r3, _0200DB50 ; =0x0380FFF8
	ldr r0, _0200DB54 ; =0x04000214
	ldr r2, [r3]
	mov r1, #0x40
	orr r2, r2, #0x40
	str r2, [r3]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200DB50: .word 0x0380FFF8
_0200DB54: .word 0x04000214
	arm_func_end sub_0200DB24

	arm_func_start sub_0200DB58
sub_0200DB58: ; 0x0200DB58
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r4, _0200DCE8 ; =0x0380B1FC
	ldrh r5, [r4, #0x26]
	and r0, r5, #4
	cmp r0, #4
	ldrh r6, [r4, #0x38]
	bne _0200DB78
	b _0200DB7C
_0200DB78:
	ldrh r7, [r4, #0x3a]
_0200DB7C:
	beq _0200DB84
	b _0200DB88
_0200DB84:
	ldr r7, _0200DCEC ; =0x0000FFFF
_0200DB88:
	bl sub_0200BE44
	cmp r0, #0
	bne _0200DBF4
	mov r0, #2
	bl sub_0200BCF4
	cmp r0, #0
	beq _0200DBF4
	and r0, r5, #1
	cmp r0, #1
	bne _0200DBD4
	bl sub_0200DE4C
	tst r5, #2
	beq _0200DBC0
	b _0200DBC4
_0200DBC0:
	mov r7, r0
_0200DBC4:
	bne _0200DBCC
	b _0200DBD0
_0200DBCC:
	eor r7, r0, #0x8000
_0200DBD0:
	b _0200DBF4
_0200DBD4:
	bl sub_0200DCF8
	tst r5, #2
	beq _0200DBE4
	b _0200DBE8
_0200DBE4:
	mov r7, r0
_0200DBE8:
	bne _0200DBF0
	b _0200DBF4
_0200DBF0:
	eor r7, r0, #0x80
_0200DBF4:
	and r0, r5, #1
	ldr r3, _0200DCF0 ; =0x027FFC00
	ldr r1, [r4, #0x2c]
	cmp r0, #1
	bne _0200DC24
	ldr r2, [r4, #0x28]
	strh r7, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r7, [r3]
	add r1, r1, #2
	b _0200DC5C
_0200DC24:
	and r7, r7, #0xff
	tst r1, #1
	bne _0200DC3C
	mov r6, r7
	add r1, r1, #1
	b _0200DC5C
_0200DC3C:
	orr r0, r6, r7, lsl #8
	ldr r2, [r4, #0x28]
	sub r1, r1, #1
	strh r0, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r0, [r3]
	add r1, r1, #2
_0200DC5C:
	strh r6, [r4, #0x38]
	strh r7, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bhs _0200DC74
	b _0200DC78
_0200DC74:
	mov r1, #0
_0200DC78:
	str r1, [r4, #0x2c]
	blo _0200DCE0
	ldrh r0, [r4, #0x24]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _0200DCA0
	mov r0, #0x51
	mov r1, #0
	bl sub_0200BC30
	b _0200DCE0
_0200DCA0:
	mov r0, #2
	mov r1, #0x42
	mov r2, #0
	bl sub_0200BD64
	cmp r0, #0
	bne _0200DCC8
	mov r0, #0x51
	mov r1, #4
	bl sub_0200BC30
	b _0200DCE0
_0200DCC8:
	mov r0, #4
	str r0, [r4, #0x20]
	ldr r1, _0200DCF4 ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_0200DCE0:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0200DCE8: .word 0x0380B1FC
_0200DCEC: .word 0x0000FFFF
_0200DCF0: .word 0x027FFC00
_0200DCF4: .word 0x0400010E
	arm_func_end sub_0200DB58

	arm_func_start sub_0200DCF8
sub_0200DCF8: ; 0x0200DCF8
	stmdb sp!, {r4, lr}
	ldr r2, _0200DE04 ; =0x040001C0
_0200DD00:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0200DD00
	ldr r1, _0200DE08 ; =0x00008A01
	ldr r0, _0200DE0C ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xec
	strh r1, [r0]
	sub r1, r0, #2
_0200DD24:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200DD24
	bl sub_0200DE1C
	ldr r2, _0200DE10 ; =0x00008201
	ldr r1, _0200DE04 ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl sub_0200DE1C
	ldr r2, _0200DE14 ; =0x0380B238
	ldr r1, _0200DE18 ; =0x00007F80
	orr r0, r0, r4, lsr #16
	and r1, r0, r1
	ldr r0, [r2, #0x10]
	mov r1, r1, lsl #9
	add r3, r0, r1, lsr #16
	str r3, [r2, #0x10]
	ldr r0, [r2, #0xc]
	add r0, r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0x1000
	blo _0200DDD4
	ldrsb r4, [r2]
	mov r0, r3, lsr #0xc
	sub r0, r0, #0x80
	mov r0, r0, lsl #0x18
	cmp r4, r0, asr #24
	mov r0, r0, asr #0x18
	cmplt r4, #0xc
	addlt r0, r4, #1
	strltb r0, [r2]
	blt _0200DDC4
	cmp r0, r4
	bge _0200DDC4
	mvn r0, #0xb
	cmp r4, r0
	ldrgt r0, _0200DE14 ; =0x0380B238
	ldrgtsb r2, [r0]
	subgt r2, r2, #1
	strgtb r2, [r0]
_0200DDC4:
	ldr r0, _0200DE14 ; =0x0380B238
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
_0200DDD4:
	ldr r0, _0200DE14 ; =0x0380B238
	ldrsb r0, [r0]
	rsb r0, r0, r1, lsr #16
	cmp r0, #0xff
	movgt r0, #0xff
	bgt _0200DDF4
	cmp r0, #0
	movlt r0, #0
_0200DDF4:
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200DE04: .word 0x040001C0
_0200DE08: .word 0x00008A01
_0200DE0C: .word 0x040001C2
_0200DE10: .word 0x00008201
_0200DE14: .word 0x0380B238
_0200DE18: .word 0x00007F80
	arm_func_end sub_0200DCF8

	arm_func_start sub_0200DE1C
sub_0200DE1C: ; 0x0200DE1C
	ldr r0, _0200DE48 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_0200DE2C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200DE2C
	ldr r0, _0200DE48 ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200DE48: .word 0x040001C2
	arm_func_end sub_0200DE1C

	arm_func_start sub_0200DE4C
sub_0200DE4C: ; 0x0200DE4C
	stmdb sp!, {r4, lr}
	ldr r2, _0200DF64 ; =0x040001C0
_0200DE54:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0200DE54
	ldr r1, _0200DF68 ; =0x00008A01
	ldr r0, _0200DF6C ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xe4
	strh r1, [r0]
	sub r1, r0, #2
_0200DE78:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0200DE78
	bl sub_0200DE1C
	ldr r2, _0200DF70 ; =0x00008201
	ldr r1, _0200DF64 ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl sub_0200DE1C
	ldr r3, _0200DF74 ; =0x0380B238
	ldr r1, _0200DF78 ; =0x00007FF8
	orr r0, r0, r4, lsr #16
	and r2, r0, r1
	ldr r0, [r3, #4]
	mov r2, r2, lsl #0x11
	add r4, r0, r2, lsr #16
	str r4, [r3, #4]
	ldr r0, [r3, #8]
	add r0, r0, #1
	str r0, [r3, #8]
	cmp r0, #0x100
	blo _0200DF30
	mov r0, r1, lsl #1
	and r0, r0, r4, lsr #8
	ldrsh r4, [r3, #2]
	sub r0, r0, #0x8000
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov r1, r0, asr #0x10
	cmplt r4, #0xc00
	addlt r0, r4, #0x10
	strlth r0, [r3, #2]
	blt _0200DF20
	cmp r1, r4
	bge _0200DF20
	mov r0, #0xc00
	rsb r0, r0, #0
	cmp r4, r0
	ldrgt r0, _0200DF74 ; =0x0380B238
	ldrgtsh r1, [r0, #2]
	subgt r1, r1, #0x10
	strgth r1, [r0, #2]
_0200DF20:
	ldr r0, _0200DF74 ; =0x0380B238
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_0200DF30:
	ldr r1, _0200DF74 ; =0x0380B238
	ldr r0, _0200DF7C ; =0x0000FFF0
	ldrsh r1, [r1, #2]
	rsb r1, r1, r2, lsr #16
	cmp r1, r0
	movgt r1, r0
	bgt _0200DF54
	cmp r1, #0
	movlt r1, #0
_0200DF54:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0200DF64: .word 0x040001C0
_0200DF68: .word 0x00008A01
_0200DF6C: .word 0x040001C2
_0200DF70: .word 0x00008201
_0200DF74: .word 0x0380B238
_0200DF78: .word 0x00007FF8
_0200DF7C: .word 0x0000FFF0
	arm_func_end sub_0200DE4C

	arm_func_start sub_0200DF80
sub_0200DF80: ; 0x0200DF80
	ldr r2, _0200DFA4 ; =0x038074F4
	mov r3, #0
_0200DF88:
	tst r0, #1
	strne r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x19
	mov r0, r0, lsr #1
	blt _0200DF88
	bx lr
	.align 2, 0
_0200DFA4: .word 0x038074F4
	arm_func_end sub_0200DF80

	arm_func_start sub_0200DFA8
sub_0200DFA8: ; 0x0200DFA8
	stmdb sp!, {r3, lr}
	ldr r3, _0200DFFC ; =0x0380FFFC
	ldr r0, _0200E000 ; =0x03805E64
	ldr r2, [r3]
	cmp r2, r0
	beq _0200DFF4
	ldr r0, _0200E004 ; =0x0380B24C
	mov r1, #0
	str r1, [r0]
	sub r1, r3, #0x17c
	str r1, [r0, #4]
	mov r1, #0x40
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bl sub_02005EE8
	ldr r2, _0200E000 ; =0x03805E64
	ldr r1, _0200DFFC ; =0x0380FFFC
	str r2, [r1]
	bl sub_02005EFC
_0200DFF4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200DFFC: .word 0x0380FFFC
_0200E000: .word 0x03805E64
_0200E004: .word 0x0380B24C
	arm_func_end sub_0200DFA8

	arm_func_start sub_0200E008
sub_0200E008: ; 0x0200E008
	stmdb sp!, {r3, lr}
	ldr r1, _0200E040 ; =0x0380FFFC
	ldr r0, _0200E044 ; =0x03805E64
	ldr r1, [r1]
	cmp r1, r0
	bne _0200E038
	bl sub_02005EE8
	ldr r1, _0200E048 ; =0x0380B24C
	ldr r2, _0200E040 ; =0x0380FFFC
	ldr r1, [r1, #0xc]
	str r1, [r2]
	bl sub_02005EFC
_0200E038:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0200E040: .word 0x0380FFFC
_0200E044: .word 0x03805E64
_0200E048: .word 0x0380B24C
	arm_func_end sub_0200E008

	arm_func_start sub_0200E04C
sub_0200E04C: ; 0x0200E04C
	mov ip, #0x4000000
	add r1, ip, #0x208
	ldrh r0, [r1]
	tst r0, r0
	beq _0200E064
	b _0200E068
_0200E064:
	bx lr
_0200E068:
	ldr r3, [ip, #0x210]
	ldr r1, [ip, #0x214]
	ands r2, r1, r3
	beq _0200E07C
	b _0200E080
_0200E07C:
	bx lr
_0200E080:
	ldr r0, _0200E268 ; =0x01DF3FFF
	tst r2, r0
	beq _0200E090
	b _0200E094
_0200E090:
	str r2, [ip, #0x214]
_0200E094:
	beq _0200E09C
	b _0200E0A0
_0200E09C:
	bx lr
_0200E0A0:
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
	add lr, pc, #0x0 ; =sub_0200E1B8
	bx r0
	arm_func_end sub_0200E04C

	arm_func_start sub_0200E1B8
sub_0200E1B8: ; 0x0200E1B8
	mov r0, #0x9f
	msr cpsr_c, r0
	mov ip, #0x4000000
	ldmia sp!, {r0}
	ldr r1, [ip, #0x210]
	eor r2, r0, r1
	and r1, r2, r1
	and r0, r2, r0
	ldmia sp!, {r3}
	orr r3, r3, r1
	bic r3, r3, r0
	str r3, [ip, #0x210]
	ldr r2, _0200E26C ; =0x038076A4
	ldr r3, _0200E270 ; =0x0380B24C
	ldrh r0, [r2, #2]
	subs r1, r0, #1
	strh r1, [r2, #2]
	beq _0200E204
	b _0200E208
_0200E204:
	mov r0, sp
_0200E208:
	beq _0200E210
	b _0200E214
_0200E210:
	ldr sp, [r3, #4]
_0200E214:
	beq _0200E21C
	b _0200E220
_0200E21C:
	str r0, [r3, #4]
_0200E220:
	mov r0, #0x92
	msr cpsr_c, r0
	ldmia sp, {sp, lr} ^
	mov r0, r0
	add sp, sp, #8
	ldmia sp!, {r0}
	msr spsr_fc, r0
	tst r1, r1
	beq _0200E248
	b _0200E24C
_0200E248:
	ldr r0, _0200E27C ; =0x037FB4F4
_0200E24C:
	beq _0200E254
	b _0200E258
_0200E254:
	add lr, pc, #0x0 ; =0x0200E25C
_0200E258:
	beq _0200E260
	b _0200E264
_0200E260:
	bx r0
_0200E264:
	ldmia sp!, {pc}
	.align 2, 0
_0200E268: .word 0x01DF3FFF
_0200E26C: .word 0x038076A4
_0200E270: .word 0x0380B24C
_0200E274: .word 0x03807210
_0200E278: .word 0x038074F4
	arm_func_end sub_0200E1B8
_0200E27C: .word 0x037FB4F4

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

	arm_func_start sub_0200E7E8
sub_0200E7E8: ; 0x0200E7E8
	ldr ip, _0200E7F4 ; =sub_03806610
	mov r0, r1
	bx ip
	.align 2, 0
_0200E7F4: .word sub_03806610
	arm_func_end sub_0200E7E8

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

	arm_func_start sub_0200EBA8
sub_0200EBA8: ; 0x0200EBA8
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _0200EBC8
	arm_func_end sub_0200EBA8

	arm_func_start sub_0200EBB8
sub_0200EBB8: ; 0x0200EBB8
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_0200EBC8:
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
	mov r0, r1, lsr r7
	mov r1, #0
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
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
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
	.byte 0x00, 0x00, 0x80, 0x00, 0x17, 0x00, 0x00, 0x00

	arm_func_start sub_0200F4A8
sub_0200F4A8: ; 0x0200F4A8
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _0200F510 ; =0x0380FFFC
	mov r0, #0
	str r0, [r1]
	ldr r1, _0200F514 ; =0x04000180
	mov r0, #0x100
	strh r0, [r1]
_0200F4C8:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _0200F4C8
	ldr r1, _0200F514 ; =0x04000180
	mov r0, #0
	strh r0, [r1]
_0200F4E4:
	ldrh r0, [r1]
	cmp r0, #1
	beq _0200F4E4
	ldr r3, _0200F518 ; =0x027FFE00
	ldr ip, [r3, #0x34]
	mov lr, ip
	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	bx ip
	.align 2, 0
_0200F510: .word 0x0380FFFC
_0200F514: .word 0x04000180
_0200F518: .word 0x027FFE00
	arm_func_end sub_0200F4A8
_0200F51C:
	.byte 0xF8, 0x40, 0x2D, 0xE9
	.byte 0x00, 0x70, 0xA0, 0xE1, 0x01, 0x6C, 0xA0, 0xE3, 0x0A, 0x50, 0xA0, 0xE3, 0x00, 0x40, 0xA0, 0xE3
	.byte 0x01, 0x00, 0x00, 0xEA, 0x06, 0x00, 0xA0, 0xE1, 0xAD, 0xD1, 0xFF, 0xEB, 0x05, 0x00, 0xA0, 0xE1
	.byte 0x07, 0x10, 0xA0, 0xE1, 0x04, 0x20, 0xA0, 0xE1, 0x2A, 0xDC, 0xFF, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0xF7, 0xFF, 0xFF, 0xBA, 0x08, 0x00, 0x9F, 0xE5, 0x65, 0xD5, 0xFF, 0xEB, 0xF8, 0x40, 0xBD, 0xE8
	.byte 0x1E, 0xFF, 0x2F, 0xE1, 0xA0, 0x8D, 0x7F, 0x02, 0x38, 0x40, 0x2D, 0xE9, 0x3C, 0x00, 0x9F, 0xE5
	.byte 0x3E, 0xD5, 0xFF, 0xEB, 0x38, 0x40, 0x9F, 0xE5, 0x01, 0x5C, 0xA0, 0xE3, 0x01, 0x00, 0x00, 0xEA
	.byte 0x05, 0x00, 0xA0, 0xE1, 0x9A, 0xD1, 0xFF, 0xEB, 0xB0, 0x10, 0xD4, 0xE1, 0x01, 0x00, 0x11, 0xE3
	.byte 0xFA, 0xFF, 0xFF, 0x1A, 0x1C, 0x00, 0x9F, 0xE5, 0x01, 0x10, 0x81, 0xE3, 0xB0, 0x10, 0xC4, 0xE1
	.byte 0x4C, 0x05, 0x90, 0xE5, 0x08, 0x00, 0x90, 0xE5, 0x38, 0x40, 0xBD, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xA0, 0x8D, 0x7F, 0x02, 0x96, 0xFF, 0x7F, 0x02, 0x78, 0x88, 0x7F, 0x02

	arm_func_start sub_0200F5BC
sub_0200F5BC: ; 0x0200F5BC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200F6C4 ; =0x00001FFF
	and r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r2, r0, lsr #0x10
	moveq r0, #0
	beq _0200F6BC
	mov r1, #0
	mov r0, #1
	b _0200F5F0
_0200F5E4:
	tst r2, r0, lsl r1
	bne _0200F5F8
	add r1, r1, #1
_0200F5F0:
	cmp r1, #0x10
	blt _0200F5E4
_0200F5F8:
	mov r0, #0xf
	mov r3, #1
	b _0200F610
_0200F604:
	tst r2, r3, lsl r0
	bne _0200F618
	sub r0, r0, #1
_0200F610:
	cmp r0, #0
	bne _0200F604
_0200F618:
	sub r6, r0, r1
	cmp r6, #5
	movlt r0, #1
	movlt r0, r0, lsl r1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _0200F6BC
	add r3, r0, r1
	add r3, r3, r3, lsr #31
	mov r4, r3, asr #1
	mov r5, #0
	mov lr, #1
	b _0200F670
_0200F64C:
	mov ip, r5, lsr #0x1f
	rsb r3, ip, r5, lsl #31
	add r3, ip, r3, ror #31
	mov r3, r3, lsl #1
	sub r3, r3, #1
	mla r4, r5, r3, r4
	tst r2, lr, lsl r4
	bne _0200F678
	add r5, r5, #1
_0200F670:
	cmp r5, r6
	blt _0200F64C
_0200F678:
	sub r2, r0, r4
	cmp r2, #5
	subge r2, r4, r1
	cmpge r2, #5
	bge _0200F6A4
	mov r2, #1
	mov r0, r2, lsl r0
	orr r0, r0, r2, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	b _0200F6BC
_0200F6A4:
	mov r3, #1
	mov r2, r3, lsl r4
	orr r0, r2, r3, lsl r0
	orr r0, r0, r3, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_0200F6BC:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0200F6C4: .word 0x00001FFF
	arm_func_end sub_0200F5BC
_0200F6C8:
	.byte 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
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
