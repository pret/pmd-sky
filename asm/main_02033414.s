	.include "asm/macros.inc"
	.include "main_02033414.inc"

	.text

	arm_func_start sub_02033414
sub_02033414: ; 0x02033414
	ldrb r1, [r0, #0xd5]
	cmp r1, #0
	beq _02033438
	ldr r1, [r0, #0xc8]
	ldr r2, [r0, #0xcc]
	add r0, r1, #1
	cmp r2, r0
	moveq r0, #1
	bxeq lr
_02033438:
	mov r0, #0
	bx lr
	arm_func_end sub_02033414

	arm_func_start sub_02033440
sub_02033440: ; 0x02033440
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r5, r0
	tst r5, #0x800
	mov r4, #0
	beq _02033498
	ldrh r2, [r1, #8]
	cmp r2, #0
	moveq r0, r4
	beq _02033488
	ldr r3, _020334A4 ; =0x0000C402
	add ip, r1, #0x10
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #4
	bl sub_020265A8
_02033488:
	tst r5, #0x8000
	addne r0, r0, #0x40
	cmp r0, #0
	movgt r4, r0
_02033498:
	mov r0, r4
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020334A4: .word 0x0000C402
	arm_func_end sub_02033440

	arm_func_start sub_020334A8
sub_020334A8: ; 0x020334A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r0, [r5, #0x10]
	mov r4, r1
	tst r0, #0x800
	beq _02033598
	ldrh r2, [r5, #0x1c]
	cmp r2, #0
	beq _020334FC
	ldr r3, _020335A0 ; =0x0000C402
	add ip, r5, #0x24
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
_020334FC:
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_020328F4
	cmp r0, #0
	beq _02033598
	mov r0, r5
	bl GetCurrentPage
	add r1, r0, #1
	mov r0, r5
	str r1, [sp, #0x28]
	bl GetTotalNumPages
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _020335A4 ; =_0209AFC4
	ldr r3, _020335A0 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov ip, r0
	ldr r3, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r3, r1
	mov r2, #0
	sub r1, r1, ip
	add r3, sp, #0x54
	bl DrawTextInWindow
_02033598:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020335A0: .word 0x0000C402
_020335A4: .word _0209AFC4
	arm_func_end sub_020334A8

	arm_func_start sub_020335A8
sub_020335A8: ; 0x020335A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r2, [r5, #0x10]
	mov r4, r1
	tst r2, #0x800
	beq _020336E8
	bl sub_02033414
	cmp r0, #0
	beq _02033610
	ldr r3, _020336F0 ; =0x000008E3
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl AppendStandardStringToMission
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	b _020336E8
_02033610:
	add r0, r5, #0x24
	str r0, [sp]
	ldrh r2, [r5, #0x1c]
	ldr r3, _020336F4 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_0203336C
	cmp r0, #0
	beq _020336E8
	ldr r0, [r5, #0xc8]
	ldr r2, _020336F8 ; =_0209AFC4
	add r0, r0, #1
	str r0, [sp, #0x28]
	ldrb r0, [r5, #0xd5]
	ldr r3, _020336F4 ; =0x0000C402
	add ip, sp, #4
	cmp r0, #0
	movne r1, #1
	ldr r0, [r5, #0xcc]
	moveq r1, #0
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov r2, r0
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	add r3, sp, #0x54
	sub r1, r1, r0
	sub r1, r1, r2
	mov r0, r4
	mov r2, #0
	bl DrawTextInWindow
_020336E8:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_020336F0: .word 0x00001D3B
#else
_020336F0: .word 0x000008E3
#endif
_020336F4: .word 0x0000C402
_020336F8: .word _0209AFC4
	arm_func_end sub_020335A8

	arm_func_start sub_020336FC
sub_020336FC: ; 0x020336FC
	tst r0, #0x1000
	mov r1, #0
	beq _02033750
	mov r2, #4
	tst r0, #0x2000
	addne r2, r2, #0x12
	tst r0, #0x4000
	addne r2, r2, #0x14
	tst r0, #0x20000
	addne r2, r2, #0x1f
	bne _02033738
	tst r0, #0x8000
	addne r2, r2, #0x3e
	tst r0, #8
	addne r2, r2, #0x1f
_02033738:
	tst r0, #4
	addne r2, r2, #0x12
	tst r0, #2
	addne r2, r2, #0x12
	cmp r2, #0
	movgt r1, r2
_02033750:
	mov r0, r1
	bx lr
	arm_func_end sub_020336FC

	arm_func_start sub_02033758
sub_02033758: ; 0x02033758
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	ldrb r0, [sb, #0xf4]
	mov r8, r1
	ldr r1, [sb, #0x10]
	cmp r0, #0
	ldrne r0, _02033BBC ; =0x00001002
	mov r7, r2
	moveq r0, #2
	mov r0, r0, lsl #0x10
	mov r4, #0
	tst r1, #0x1000
	mov r5, r0, lsr #0x10
	beq _02033B98
	ldrh r0, [r7]
	tst r0, r5
	beq _02033B98
	ldmib sb, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [sb, #4]
	add r6, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sb, #0x10]
	tst r0, #0x2000
	beq _0203380C
	mov r0, #0x12
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r8]
	add r6, r6, #0x12
_0203380C:
	ldr r0, [sb, #0x10]
	tst r0, #0x4000
	beq _0203385C
	mov r0, #0x13
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r8]
	add r6, r6, #0x14
_0203385C:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _020339C8
	tst r0, #0x20000
	bne _020339C8
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _020339C4
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _020338D4
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _020338D4
	mov r0, sb
	bl sub_02032864
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r8]
_020338D4:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _0203392C
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _0203392C
	mov r0, sb
	bl sub_0203282C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r8]
_0203392C:
	add ip, r6, #0x1f
	add r3, r6, #0x2a
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033978
	mov r0, sb
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r8]
_02033978:
	add ip, r6, #0x2d
	add r3, r6, #0x38
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _020339C4
	mov r0, sb
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r8]
_020339C4:
	add r6, r6, #0x3e
_020339C8:
	ldr r0, [sb, #0x10]
	tst r0, #8
	bne _020339EC
	tst r0, #0x20000
	beq _02033AE0
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _02033AE0
_020339EC:
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000000
	bne _02033A64
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033A64
	ldr r0, [r8]
	orr r0, r0, #0x40000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033A58
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x4000
	str r0, [r8]
	b _02033A60
_02033A58:
	mov r1, #0
	bl PlayWindowInputSound
_02033A60:
	mov r4, #1
_02033A64:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x40000000
	bne _02033AE0
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033AE0
	ldr r0, [r8]
	orr r0, r0, #0x80000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033AD4
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x8000
	str r0, [r8]
	b _02033ADC
_02033AD4:
	mov r1, #0
	bl PlayWindowInputSound
_02033ADC:
	mov r4, #1
_02033AE0:
	ldr r1, [sb, #0xc]
	ldr r0, [sb, #0x10]
	add r6, r1, #4
	tst r0, #2
	beq _02033B2C
	sub r6, r6, #0x12
	add r3, r6, #0xb
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r8]
_02033B2C:
	ldr r0, [sb, #0x10]
	tst r0, #4
	beq _02033B98
	sub ip, r6, #0x12
	sub r3, r6, #7
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033B98
	ldr r0, [sb, #0x10]
	tst r0, #0x18000000
	ldreq r0, [r8]
	orreq r0, r0, #1
	orreq r0, r0, #0x10000
	streq r0, [r8]
	beq _02033B94
	ldr r1, [r8]
	mov r0, sb
	orr r2, r1, #0x10000
	mov r1, #2
	str r2, [r8]
	bl PlayWindowInputSound
_02033B94:
	mov r4, #1
_02033B98:
	ldr r1, [r8]
	cmp r1, #0
	beq _02033BB0
	mov r0, sb
	bl sub_020320C8
	mov r4, #1
_02033BB0:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02033BBC: .word 0x00001002
	arm_func_end sub_02033758

	arm_func_start sub_02033BC0
sub_02033BC0: ; 0x02033BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02033ECC
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033C44
	tst r4, #0x1000000
	ldrne r3, _02033ED4 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _02033ED8 ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
	add r6, r6, #0x12
_02033C44:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02033C70
	tst r4, #0x2000000
	ldrne r3, _02033EDC ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02033EE0 ; =_0209AFF4
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	add r6, r6, #0x14
_02033C70:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02033D74
	tst r0, #0x20000
	bne _02033D74
	mov r0, r8
	bl sub_020328F4
	cmp r0, #0
	beq _02033D70
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02033D08
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033CB8
	tst r4, #0x400000
	beq _02033CD4
_02033CB8:
	tst r4, #0x400000
	ldrne r3, _02033EE4 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _02033EE8 ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033CD4:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033CEC
	tst r4, #0x800000
	beq _02033D08
_02033CEC:
	tst r4, #0x800000
	ldrne r3, _02033EEC ; =_0209B00C
	mov r0, r7
	ldreq r3, _02033EF0 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033D08:
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033D20
	tst r4, #0x100000
	beq _02033D3C
_02033D20:
	tst r4, #0x100000
	ldrne r3, _02033EF4 ; =_0209B01C
	mov r0, r7
	ldreq r3, _02033EF8 ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_02033D3C:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033D54
	tst r4, #0x200000
	beq _02033D70
_02033D54:
	tst r4, #0x200000
	ldrne r3, _02033EFC ; =_0209B02C
	mov r0, r7
	ldreq r3, _02033F00 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_02033D70:
	add r6, r6, #0x3e
_02033D74:
	ldr r1, [r8, #0x10]
	ldr r0, _02033F04 ; =0x00020008
	tst r1, r0
	beq _02033E40
	tst r4, #0x40000
	beq _02033DA4
	ldr r3, _02033F08 ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033DE0
_02033DA4:
	tst r1, #0x20000000
	bne _02033DE0
	tst r1, #8
	bne _02033DCC
	tst r1, #0x20000
	beq _02033DE0
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	beq _02033DE0
_02033DCC:
	ldr r3, _02033F0C ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033DE0:
	tst r4, #0x80000
	beq _02033E00
	ldr r3, _02033F10 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033E40
_02033E00:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02033E40
	tst r0, #8
	bne _02033E2C
	tst r0, #0x20000
	beq _02033E40
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	beq _02033E40
_02033E2C:
	ldr r3, _02033F14 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033E40:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02033E7C
	tst r4, #0x20000
	ldrne r3, _02033F18 ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _02033F1C ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033E7C:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02033ECC
	tst r0, #0x18000000
	beq _02033EB0
	tst r4, #0x10000
	ldrne r3, _02033F20 ; =_0209B06C
	mov r0, r7
	ldreq r3, _02033F24 ; =_0209B074
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033ECC
_02033EB0:
	tst r4, #0x10000
	ldrne r3, _02033F28 ; =_0209B07C
	mov r0, r7
	ldreq r3, _02033F2C ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02033ECC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02033ED4: .word _0209AFDC
_02033ED8: .word _0209AFE4
_02033EDC: .word _0209AFEC
_02033EE0: .word _0209AFF4
_02033EE4: .word _0209AFFC
_02033EE8: .word _0209B004
_02033EEC: .word _0209B00C
_02033EF0: .word _0209B014
_02033EF4: .word _0209B01C
_02033EF8: .word _0209B024
_02033EFC: .word _0209B02C
_02033F00: .word _0209B034
_02033F04: .word 0x00020008
_02033F08: .word _0209B03C
_02033F0C: .word _0209B044
_02033F10: .word _0209B04C
_02033F14: .word _0209B054
_02033F18: .word _0209B05C
_02033F1C: .word _0209B064
_02033F20: .word _0209B06C
_02033F24: .word _0209B074
_02033F28: .word _0209B07C
_02033F2C: .word _0209B084
	arm_func_end sub_02033BC0

	arm_func_start sub_02033F30
sub_02033F30: ; 0x02033F30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	mov r6, r2
	tst r0, #0x1000
	mov r4, #0
	beq _0203433C
	ldrh r0, [r6]
	tst r0, #2
	beq _0203433C
	ldmib r8, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [r8, #4]
	add r5, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033FC8
	mov r0, #0x12
	str r5, [sp, #8]
	bl sub_02026594
	add r0, r5, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r7]
_02033FC8:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _0203401C
	add r1, r5, #0x12
	mov r0, #0x13
	str r1, [sp, #8]
	bl sub_02026594
	add r1, r5, #0x12
	add r0, r1, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r7]
_0203401C:
	ldr r0, [r8, #0x10]
	add r5, r5, #0x26
	tst r0, #0x8000
	beq _0203418C
	tst r0, #0x20000
	bne _0203418C
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _02034188
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02034098
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034098
	mov r0, r8
	bl InventoryMenuPrevious10Pages
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r7]
_02034098:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020340F0
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020340F0
	mov r0, r8
	bl InventoryMenuNext10Pages
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r7]
_020340F0:
	add ip, r5, #0x1f
	add r3, r5, #0x2a
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0203413C
	mov r0, r8
	bl InventoryMenuPreviousPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r7]
_0203413C:
	add ip, r5, #0x2d
	add r3, r5, #0x38
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02034188
	mov r0, r8
	bl InventoryMenuNextPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r7]
_02034188:
	add r5, r5, #0x3e
_0203418C:
	ldr r1, [r8, #0x10]
	ands r0, r1, #8
	beq _020342AC
	cmp r0, #0
	bne _020341B8
	tst r1, #0x20000
	beq _020342AC
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _020342AC
_020341B8:
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02034230
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034230
	ldr r0, [r7]
	orr r0, r0, #0x40000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _02034224
	bl InventoryMenuPreviousPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x4000
	str r0, [r7]
	b _0203422C
_02034224:
	mov r1, #0
	bl sub_020333D8
_0203422C:
	mov r4, #1
_02034230:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000000
	bne _020342AC
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020342AC
	ldr r0, [r7]
	orr r0, r0, #0x80000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _020342A0
	bl InventoryMenuNextPage
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x8000
	str r0, [r7]
	b _020342A8
_020342A0:
	mov r1, #0
	bl sub_020333D8
_020342A8:
	mov r4, #1
_020342AC:
	ldr r1, [r8, #0xc]
	ldr r0, [r8, #0x10]
	add r5, r1, #4
	tst r0, #2
	beq _020342F8
	sub r5, r5, #0x12
	add r3, r5, #0xb
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r5, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r7]
_020342F8:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _0203433C
	sub ip, r5, #0x12
	sub r3, r5, #7
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #1
	orrne r0, r0, #0x10000
	strne r0, [r7]
_0203433C:
	ldr r1, [r7]
	cmp r1, #0
	beq _02034354
	mov r0, r8
	bl sub_02032DE8
	mov r4, #1
_02034354:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02033F30

	arm_func_start sub_02034360
sub_02034360: ; 0x02034360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02034660
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _020343E0
	tst r4, #0x1000000
	ldrne r3, _02034668 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _0203466C ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
_020343E0:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02034408
	tst r4, #0x2000000
	ldrne r3, _02034670 ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02034674 ; =_0209AFF4
	add r2, r5, #3
	mov r1, #0x16
	bl DrawTextInWindow
_02034408:
	ldr r0, [r8, #0x10]
	add r6, r6, #0x26
	tst r0, #0x8000
	beq _02034510
	tst r0, #0x20000
	bne _02034510
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _0203450C
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020344A4
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _02034454
	tst r4, #0x400000
	beq _02034470
_02034454:
	tst r4, #0x400000
	ldrne r3, _02034678 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _0203467C ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034470:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _02034488
	tst r4, #0x800000
	beq _020344A4
_02034488:
	tst r4, #0x800000
	ldrne r3, _02034680 ; =_0209B00C
	mov r0, r7
	ldreq r3, _02034684 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020344A4:
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _020344BC
	tst r4, #0x100000
	beq _020344D8
_020344BC:
	tst r4, #0x100000
	ldrne r3, _02034688 ; =_0209B01C
	mov r0, r7
	ldreq r3, _0203468C ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_020344D8:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _020344F0
	tst r4, #0x200000
	beq _0203450C
_020344F0:
	tst r4, #0x200000
	ldrne r3, _02034690 ; =_0209B02C
	mov r0, r7
	ldreq r3, _02034694 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_0203450C:
	add r6, r6, #0x3e
_02034510:
	ldr r1, [r8, #0x10]
	ldr r0, _02034698 ; =0x00020008
	tst r1, r0
	beq _020345DC
	tst r4, #0x40000
	beq _02034540
	ldr r3, _0203469C ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _0203457C
_02034540:
	tst r1, #0x20000000
	bne _0203457C
	tst r1, #8
	bne _02034568
	tst r1, #0x20000
	beq _0203457C
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	beq _0203457C
_02034568:
	ldr r3, _020346A0 ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_0203457C:
	tst r4, #0x80000
	beq _0203459C
	ldr r3, _020346A4 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _020345DC
_0203459C:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _020345DC
	tst r0, #8
	bne _020345C8
	tst r0, #0x20000
	beq _020345DC
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	beq _020345DC
_020345C8:
	ldr r3, _020346A8 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020345DC:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02034618
	tst r4, #0x20000
	ldrne r3, _020346AC ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _020346B0 ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034618:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02034660
	tst r0, #0x18000000
	beq _02034644
	ldr r3, _020346B4 ; =_0209B074
	mov r0, r7
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02034660
_02034644:
	tst r4, #0x10000
	ldrne r3, _020346B8 ; =_0209B07C
	mov r0, r7
	ldreq r3, _020346BC ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02034660:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02034668: .word _0209AFDC
_0203466C: .word _0209AFE4
_02034670: .word _0209AFEC
_02034674: .word _0209AFF4
_02034678: .word _0209AFFC
_0203467C: .word _0209B004
_02034680: .word _0209B00C
_02034684: .word _0209B014
_02034688: .word _0209B01C
_0203468C: .word _0209B024
_02034690: .word _0209B02C
_02034694: .word _0209B034
_02034698: .word 0x00020008
_0203469C: .word _0209B03C
_020346A0: .word _0209B044
_020346A4: .word _0209B04C
_020346A8: .word _0209B054
_020346AC: .word _0209B05C
_020346B0: .word _0209B064
_020346B4: .word _0209B074
_020346B8: .word _0209B07C
_020346BC: .word _0209B084
	arm_func_end sub_02034360

	arm_func_start sub_020346C0
sub_020346C0: ; 0x020346C0
	stmdb sp!, {r4, lr}
	mov r0, #0xdc
	mov r1, #1
	bl MemAlloc
	mov r4, r0
	ldr ip, _02034708 ; =MENU_CONTROL_PTR
	ldr r0, _0203470C ; =NULL_OVERLAY_LOAD_ENTRY
	str r4, [ip]
	add lr, r4, #0xc4
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r1, #0
	str r1, [r4, #0xd4]
	ldr r0, [ip]
	strb r1, [r0, #0xd8]
	bl sub_02034710
	bl sub_020469BC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02034708: .word MENU_CONTROL_PTR
_0203470C: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_020346C0

	arm_func_start sub_02034710
sub_02034710: ; 0x02034710
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r1, _02034798 ; =MENU_CONTROL_PTR
	ldr r0, _0203479C ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r1, [r1]
	add r4, r1, #0xc4
	mov r1, r4
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	bne _0203473C
	bl FreeActiveMenu
_0203473C:
	ldr r0, _0203479C ; =NULL_OVERLAY_LOAD_ENTRY
	add r7, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	ldr ip, _02034798 ; =MENU_CONTROL_PTR
	ldmia r7, {r0, r1, r2, r3}
	ldr r5, [ip]
	mov r6, #0
	stmia r5, {r0, r1, r2, r3}
	strb r6, [r5, #0x10]
	ldr r5, [ip]
	ldmia r7, {r0, r1, r2, r3}
	add lr, r5, #0x14
	stmia lr, {r0, r1, r2, r3}
	str r6, [r5, #0x24]
	ldr r0, [ip]
	strb r6, [r0, #0xc0]
	ldmia r7, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	str r6, [r0, #0xd4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02034798: .word MENU_CONTROL_PTR
_0203479C: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_02034710

	arm_func_start OverlayLoadEntriesEqual
OverlayLoadEntriesEqual: ; 0x020347A0
	cmp r0, #0
	ldreq r0, _020347EC ; =NULL_OVERLAY_LOAD_ENTRY
	cmp r1, #0
	ldreq r1, _020347EC ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r2, [r0, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020347EC: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end OverlayLoadEntriesEqual

	arm_func_start FreeActiveMenu
FreeActiveMenu: ; 0x020347F0
	stmdb sp!, {r4, lr}
	ldr r0, _0203483C ; =MENU_CONTROL_PTR
	ldr r4, [r0]
	ldr r0, [r4, #0xcc]
	cmp r0, #0
	beq _0203480C
	blx r0
_0203480C:
	ldr r0, _0203483C ; =MENU_CONTROL_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xd8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc4]
	bl UnloadOverlay
	ldr r0, _0203483C ; =MENU_CONTROL_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203483C: .word MENU_CONTROL_PTR
	arm_func_end FreeActiveMenu

	arm_func_start sub_02034840
sub_02034840: ; 0x02034840
	stmdb sp!, {r4, lr}
	ldr r1, _020348DC ; =MENU_CONTROL_PTR
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _02034894
	cmp r4, #0
	beq _0203487C
	add r1, r2, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	beq _02034894
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203487C:
	ldr r0, _020348E0 ; =NULL_OVERLAY_LOAD_ENTRY
	add r1, r2, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02034894:
	cmp r4, #0
	beq _020348B4
	ldr r1, _020348DC ; =MENU_CONTROL_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0xc4
	bl OverlayLoadEntriesEqual
	ldmia sp!, {r4, pc}
_020348B4:
	ldr r1, _020348DC ; =MENU_CONTROL_PTR
	ldr r0, _020348E0 ; =NULL_OVERLAY_LOAD_ENTRY
	ldr r1, [r1]
	add r1, r1, #0x14
	bl OverlayLoadEntriesEqual
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_020348DC: .word MENU_CONTROL_PTR
_020348E0: .word NULL_OVERLAY_LOAD_ENTRY
	arm_func_end sub_02034840
