	.include "asm/macros.inc"
	.include "overlay_01_02337634.inc"

	.text

	arm_func_start ov01_02337634
ov01_02337634: ; 0x02337634
	ldr ip, _02337640 ; =InitMenu
	ldr r0, _02337644 ; =ov01_0233BCEC
	bx ip
	.align 2, 0
_02337640: .word InitMenu
_02337644: .word ov01_0233BCEC
	arm_func_end ov01_02337634

	arm_func_start ov01_02337648
ov01_02337648: ; 0x02337648
	ldr r1, _02337654 ; =ov01_0233C1E0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_02337654: .word ov01_0233C1E0
	arm_func_end ov01_02337648

	arm_func_start ov01_02337658
ov01_02337658: ; 0x02337658
	ldr r2, _02337664 ; =ov01_0233C1E0
	strb r1, [r2, r0]
	bx lr
	.align 2, 0
_02337664: .word ov01_0233C1E0
	arm_func_end ov01_02337658

	arm_func_start ov01_02337668
ov01_02337668: ; 0x02337668
	ldr ip, _02337674 ; =InitMenu
	ldr r0, _02337678 ; =ov01_0233BCFC
	bx ip
	.align 2, 0
_02337674: .word InitMenu
_02337678: .word ov01_0233BCFC
	arm_func_end ov01_02337668

	arm_func_start ov01_0233767C
ov01_0233767C: ; 0x0233767C
	ldr r1, _02337688 ; =ov01_0233C1E8
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_02337688: .word ov01_0233C1E8
	arm_func_end ov01_0233767C

	arm_func_start ov01_0233768C
ov01_0233768C: ; 0x0233768C
	ldr r2, _02337698 ; =ov01_0233C1E8
	strb r1, [r2, r0]
	bx lr
	.align 2, 0
_02337698: .word ov01_0233C1E8
	arm_func_end ov01_0233768C

	arm_func_start ov01_0233769C
ov01_0233769C: ; 0x0233769C
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r2, _023376D8 ; =ov01_0233C1F4
	mov r1, #0xa8
	str r0, [r2]
	bl MemZero
	ldr r0, _023376D8 ; =ov01_0233C1F4
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	str r2, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023376D8: .word ov01_0233C1F4
	arm_func_end ov01_0233769C

	arm_func_start ov01_023376DC
ov01_023376DC: ; 0x023376DC
	stmdb sp!, {r3, lr}
	ldr r0, _02337714 ; =ov01_0233C1F4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl ov00_022BCBAC
	ldr r0, _02337714 ; =ov01_0233C1F4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02337714 ; =ov01_0233C1F4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02337714: .word ov01_0233C1F4
	arm_func_end ov01_023376DC

	arm_func_start ov01_02337718
ov01_02337718: ; 0x02337718
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _023378E8 ; =ov01_0233C1F4
	ldr r4, [r0]
	ldr r1, [r4]
	cmp r1, #0x1000
	bgt _02337754
	bge _023377A4
	cmp r1, #1
	bgt _023378E0
	cmp r1, #0
	blt _023378E0
	beq _02337764
	cmp r1, #1
	beq _02337788
	b _023378E0
_02337754:
	ldr r0, _023378EC ; =0x00001001
	cmp r1, r0
	beq _023377BC
	b _023378E0
_02337764:
	ldr r1, _023378F0 ; =0x00003760
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _023378E8 ; =ov01_0233C1F4
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _023378E0
_02337788:
	bl ov01_023378FC
	cmp r0, #1
	ldreq r0, _023378E8 ; =ov01_0233C1F4
	moveq r1, #0x1000
	ldreq r0, [r0]
	streq r1, [r0]
	b _023378E0
_023377A4:
	mov r1, #0
	str r1, [r4, #4]
	ldr r0, [r0]
	ldr r1, _023378EC ; =0x00001001
	str r1, [r0]
	b _023378E0
_023377BC:
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _023378AC
_023377CC: ; jump table
	b _023377E0 ; case 0
	b _023377FC ; case 1
	b _02337828 ; case 2
	b _02337888 ; case 3
	b _0233789C ; case 4
_023377E0:
	bl ov00_022BD780
	mov r0, #0
	ldr r1, _023378F4 ; =0x0000023B
	mov r2, r0
	bl sub_02046BE8
	mov r0, #1
	str r0, [r4, #4]
_023377FC:
	bl ov01_023378FC
	cmp r0, #1
	bne _023378AC
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	mov r0, #2
	str r0, [r4, #4]
	bl sub_02003B94
	b _023378AC
_02337828:
	mov r0, #3
	bl NoteSaveBase
	mov r5, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r5, #0
	bne _02337860
#ifdef JAPAN
	ldr r1, _02339168 ; =0x000004CD
	mov r0, #0x1c
#else
	mov r0, #0x1c
	mov r1, #0x23c
#endif
	mov r2, #0
	bl sub_02046BE8
	mov r0, #3
	str r0, [r4, #4]
	b _023378AC
_02337860:
	cmp r5, #1
	moveq r0, #3
	beq _023378B0
	ldr r1, _023378F8 ; =0x00000239
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	mov r0, #4
	str r0, [r4, #4]
	b _023378AC
_02337888:
	bl ov01_023378FC
	cmp r0, #1
	bne _023378AC
	mov r0, #1
	b _023378B0
_0233789C:
	bl ov01_023378FC
	cmp r0, #1
	moveq r0, #2
	beq _023378B0
_023378AC:
	mov r0, #0
_023378B0:
	cmp r0, #1
	bne _023378C8
	mov r0, #0
	bl ov00_022BD264
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
_023378C8:
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_023378E0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023378E8: .word ov01_0233C1F4
_023378EC: .word 0x00001001
#if defined(EUROPE)
_023378F0: .word 0x00003762
_023378F4: .word 0x0000023B
_023378F8: .word 0x00000239
#elif defined(JAPAN)
_023378F0: .word 0x000033E2
_023378F4: .word 0x000004CC
_02339168: .word 0x000004CD
_023378F8: .word 0x000004CA
#else
_023378F0: .word 0x00003760
_023378F4: .word 0x0000023B
_023378F8: .word 0x00000239
#endif
	arm_func_end ov01_02337718

	arm_func_start ov01_023378FC
ov01_023378FC: ; 0x023378FC
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov01_023378FC

	arm_func_start ov01_02337914
ov01_02337914: ; 0x02337914
	ldr ip, _02337920 ; =InitMenu
	ldr r0, _02337924 ; =ov01_0233BD0C
	bx ip
	.align 2, 0
_02337920: .word InitMenu
_02337924: .word ov01_0233BD0C
	arm_func_end ov01_02337914

	arm_func_start ov01_02337928
ov01_02337928: ; 0x02337928
	ldr r1, _02337934 ; =ov01_0233C1F8
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_02337934: .word ov01_0233C1F8
	arm_func_end ov01_02337928

	arm_func_start ov01_02337938
ov01_02337938: ; 0x02337938
	ldr r2, _02337944 ; =ov01_0233C1F8
	strb r1, [r2, r0]
	bx lr
	.align 2, 0
_02337944: .word ov01_0233C1F8
	arm_func_end ov01_02337938

	arm_func_start ov01_02337948
ov01_02337948: ; 0x02337948
	stmdb sp!, {r4, lr}
	bl sub_02046B04
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	moveq r4, #1
	beq _02337980
	sub r0, r1, #1
	cmp r4, r0
	moveq r4, #1
	beq _02337980
	add r0, r1, #1
	cmp r4, r0
	moveq r4, #0
_02337980:
	bl sub_02046BA0
	ldr r1, _02337994 ; =ov01_0233C210
	strb r0, [r1]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02337994: .word ov01_0233C210
	arm_func_end ov01_02337948

	arm_func_start ov01_02337998
ov01_02337998: ; 0x02337998
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	cmp r3, #0
	movne r1, #0
	moveq r1, #0x1c
	mov r1, r1, lsl #0x10
	sub r0, r0, #4
	mov r4, r2
	cmp r0, #0xa
	mov r6, r1, lsr #0x10
	mov r7, #0
	addls pc, pc, r0, lsl #2
	b _02337AC4
_023379CC: ; jump table
	b _023379F8 ; case 0
	b _02337A00 ; case 1
	b _02337A10 ; case 2
	b _02337A20 ; case 3
	b _02337A30 ; case 4
	b _02337A40 ; case 5
	b _02337A50 ; case 6
	b _02337A60 ; case 7
	b _02337A78 ; case 8
	b _02337AA8 ; case 9
	b _02337AB8 ; case 10
_023379F8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02337A00:
	ldr r0, _02337AE4 ; =ov01_0233BD34
	bl Debug_Print0
	ldr r7, _02337AE8 ; =0x000036DA
	b _02337AC4
_02337A10:
	ldr r0, _02337AEC ; =ov01_0233BD48
	bl Debug_Print0
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02337A20:
	ldr r0, _02337AF0 ; =ov01_0233BD5C
	bl Debug_Print0
	ldr r7, _02337AF4 ; =0x000036DB
	b _02337AC4
_02337A30:
	ldr r0, _02337AF8 ; =ov01_0233BD70
	bl Debug_Print0
	ldr r7, _02337AFC ; =0x000036E2
	b _02337AC4
_02337A40:
	ldr r0, _02337B00 ; =ov01_0233BD90
	bl Debug_Print0
	ldr r7, _02337B04 ; =0x000036DC
	b _02337AC4
_02337A50:
	ldr r0, _02337B08 ; =ov01_0233BDAC
	bl Debug_Print0
	ldr r7, _02337B0C ; =0x000036E3
	b _02337AC4
_02337A60:
	ldr r0, _02337B10 ; =ov01_0233BDC8
	bl Debug_Print0
	cmp r5, #0
	ldrne r7, _02337B14 ; =0x000036DD
	ldreq r7, _02337B18 ; =0x000036DE
	b _02337AC4
_02337A78:
	ldr r0, _02337B1C ; =ov01_0233BDDC
	bl Debug_Print0
	cmp r5, #0
	beq _02337AA0
	cmp r4, #2
	ldreq r7, _02337B20 ; =0x000036DF
	beq _02337AC4
	cmp r4, #3
	ldreq r7, _02337B24 ; =0x000036E0
	b _02337AC4
_02337AA0:
	ldr r7, _02337B28 ; =0x000036E1
	b _02337AC4
_02337AA8:
	ldr r0, _02337B2C ; =ov01_0233BDF4
	bl Debug_Print0
	ldr r7, _02337B30 ; =0x000036E4
	b _02337AC4
_02337AB8:
	ldr r0, _02337B34 ; =ov01_0233BE0C
	bl Debug_Print0
	ldr r7, _02337B38 ; =0x000036E5
_02337AC4:
	cmp r7, #0
	beq _02337ADC
	mov r0, r6
	mov r1, r7
	mov r2, #0
	bl sub_02046BE8
_02337ADC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV01_02337998_OFFSET 2
#elif defined(JAPAN)
#define OV01_02337998_OFFSET -0x37E
#else
#define OV01_02337998_OFFSET 0
#endif
_02337AE4: .word ov01_0233BD34
_02337AE8: .word 0x000036DA + OV01_02337998_OFFSET
_02337AEC: .word ov01_0233BD48
_02337AF0: .word ov01_0233BD5C
_02337AF4: .word 0x000036DB + OV01_02337998_OFFSET
_02337AF8: .word ov01_0233BD70
_02337AFC: .word 0x000036E2 + OV01_02337998_OFFSET
_02337B00: .word ov01_0233BD90
_02337B04: .word 0x000036DC + OV01_02337998_OFFSET
_02337B08: .word ov01_0233BDAC
_02337B0C: .word 0x000036E3 + OV01_02337998_OFFSET
_02337B10: .word ov01_0233BDC8
_02337B14: .word 0x000036DD + OV01_02337998_OFFSET
_02337B18: .word 0x000036DE + OV01_02337998_OFFSET
_02337B1C: .word ov01_0233BDDC
_02337B20: .word 0x000036DF + OV01_02337998_OFFSET
_02337B24: .word 0x000036E0 + OV01_02337998_OFFSET
_02337B28: .word 0x000036E1 + OV01_02337998_OFFSET
_02337B2C: .word ov01_0233BDF4
_02337B30: .word 0x000036E4 + OV01_02337998_OFFSET
_02337B34: .word ov01_0233BE0C
_02337B38: .word 0x000036E5 + OV01_02337998_OFFSET
	arm_func_end ov01_02337998

	arm_func_start ov01_02337B3C
ov01_02337B3C: ; 0x02337B3C
	mov ip, #0
	mov r3, ip
	b _02337B58
_02337B48:
	ldrb r2, [r0, r3]
	add r3, r3, #1
	add r2, ip, r2
	and ip, r2, #0xff
_02337B58:
	cmp r3, r1
	blt _02337B48
	mov r0, ip
	bx lr
	arm_func_end ov01_02337B3C

	arm_func_start ov01_02337B68
ov01_02337B68: ; 0x02337B68
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	mov r1, #0x14
	bl ov01_02337B3C
	ldrb r1, [r4]
	cmp r1, #0x11
	movne r0, #2
	ldmneia sp!, {r4, pc}
	ldrb r1, [r4, #3]
	cmp r0, r1
	movne r0, #3
	moveq r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov01_02337B68

	arm_func_start ov01_02337BA0
ov01_02337BA0: ; 0x02337BA0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0x60
	mov r1, #8
	bl MemAlloc
	ldr r2, _02337C50 ; =ov01_0233C210
	mov r1, #0x60
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _02337C50 ; =ov01_0233C210
	mov r2, #0
	ldr r1, [r0, #4]
	mov ip, #2
	str r2, [r1]
	ldr r1, [r0, #4]
	str r2, [r1, #0x30]
	ldr r5, [r0, #4]
	add lr, r5, #8
_02337BE8:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02337BE8
	ldr r1, [r4]
	mov r0, #1
	str r1, [lr]
	mov r4, #0
	ldr r1, _02337C50 ; =ov01_0233C210
	str r4, [r5, #4]
	ldr r3, [r1, #4]
	sub r2, r0, #2
	strb r0, [r3, #0x3c]
	ldr r3, [r1, #4]
	strb r4, [r3, #0x3e]
	ldr r3, [r1, #4]
	str r4, [r3, #0x40]
	ldr r3, [r1, #4]
	str r4, [r3, #0x44]
	ldr r3, [r1, #4]
	str r4, [r3, #0x48]
	ldr r3, [r1, #4]
	str r4, [r3, #0x4c]
	ldr r1, [r1, #4]
	str r2, [r1, #0x50]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02337C50: .word ov01_0233C210
	arm_func_end ov01_02337BA0

	arm_func_start ov01_02337C54
ov01_02337C54: ; 0x02337C54
	stmdb sp!, {r3, lr}
	ldr r0, _02337C8C ; =ov01_0233C210
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov01_0233893C
	bl ov01_02338978
	ldr r0, _02337C8C ; =ov01_0233C210
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02337C8C ; =ov01_0233C210
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02337C8C: .word ov01_0233C210
	arm_func_end ov01_02337C54

	arm_func_start ov01_02337C90
ov01_02337C90: ; 0x02337C90
	ldr r0, _02337CA8 ; =ov01_0233C210
	ldr r0, [r0, #4]
	cmp r0, #0
	ldrne r0, [r0, #0x30]
	moveq r0, #0
	bx lr
	.align 2, 0
_02337CA8: .word ov01_0233C210
	arm_func_end ov01_02337C90

	arm_func_start ov01_02337CAC
ov01_02337CAC: ; 0x02337CAC
	stmdb sp!, {r4, lr}
	ldr r0, _02337CE0 ; =ov01_0233C210
	ldr r4, [r0, #4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0x2c]
	cmp r0, #0xb
	ldmneia sp!, {r4, pc}
	mov r0, #0x1e0
	bl ov01_0232B020
	mov r0, #1
	str r0, [r4, #0x2c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02337CE0: .word ov01_0233C210
	arm_func_end ov01_02337CAC

	arm_func_start ov01_02337CE4
ov01_02337CE4: ; 0x02337CE4
	ldr r0, _02337CFC ; =ov01_0233C210
	ldr r0, [r0, #4]
	cmp r0, #0
	ldrneb r0, [r0, #0x3c]
	moveq r0, #1
	bx lr
	.align 2, 0
_02337CFC: .word ov01_0233C210
	arm_func_end ov01_02337CE4

	arm_func_start ov01_02337D00
ov01_02337D00: ; 0x02337D00
	ldr r1, _02337D14 ; =ov01_0233C210
	ldr r1, [r1, #4]
	cmp r1, #0
	strneb r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_02337D14: .word ov01_0233C210
	arm_func_end ov01_02337D00

	arm_func_start ov01_02337D18
ov01_02337D18: ; 0x02337D18
	ldr r1, _02337D2C ; =ov01_0233C210
	ldr r1, [r1, #4]
	cmp r1, #0
	strneb r0, [r1, #0x3e]
	bx lr
	.align 2, 0
_02337D2C: .word ov01_0233C210
	arm_func_end ov01_02337D18

	arm_func_start ov01_02337D30
ov01_02337D30: ; 0x02337D30
	stmdb sp!, {r3, lr}
	ldr r1, _02337DCC ; =ov01_0233C210
	ldr r0, [r1, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov ip, #0
	str ip, [r0, #0x30]
	ldr r0, [r1, #4]
	mov r3, #1
	str ip, [r0, #4]
	ldr r0, [r1, #4]
	sub r2, r3, #2
	strb r3, [r0, #0x3c]
	ldr r3, [r1, #4]
	mov r0, #0x1e0
	strb ip, [r3, #0x3e]
	ldr r3, [r1, #4]
	str ip, [r3, #0x40]
	ldr r3, [r1, #4]
	str ip, [r3, #0x44]
	ldr r3, [r1, #4]
	str ip, [r3, #0x48]
	ldr r3, [r1, #4]
	str ip, [r3, #0x4c]
	ldr r1, [r1, #4]
	str r2, [r1, #0x50]
	bl ov01_0232B020
	mov r0, #1
	bl ov01_0232B080
	bl ov01_0232C024
	ldr r0, _02337DCC ; =ov01_0233C210
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	bl ov01_0232AED4
	ldr r0, _02337DCC ; =ov01_0233C210
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02337DCC: .word ov01_0233C210
	arm_func_end ov01_02337D30

	arm_func_start ov01_02337DD0
ov01_02337DD0: ; 0x02337DD0
	ldr r0, _02337E08 ; =ov01_0233C210
	ldr r1, [r0, #4]
	cmp r1, #0
	bxeq lr
	ldr r0, [r1, #0x30]
	cmp r0, #4
	cmpne r0, #0
	moveq r0, #6
	streq r0, [r1, #0x30]
	ldr r0, _02337E08 ; =ov01_0233C210
	mov r1, #9
	ldr r0, [r0, #4]
	str r1, [r0]
	bx lr
	.align 2, 0
_02337E08: .word ov01_0233C210
	arm_func_end ov01_02337DD0

	arm_func_start ov01_02337E0C
ov01_02337E0C: ; 0x02337E0C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _02338844 ; =ov01_0233C210
	ldr sb, [r0, #4]
	ldr r0, [sb]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02338838
_02337E2C: ; jump table
	b _02337E60 ; case 0
	b _02337E7C ; case 1
	b _02337EFC ; case 2
	b _02337F28 ; case 3
	b _02337F44 ; case 4
	b _02337F58 ; case 5
	b _02337FAC ; case 6
	b _02338674 ; case 7
	b _0233868C ; case 8
	b _023386F4 ; case 9
	b _02338710 ; case 10
	b _02338768 ; case 11
	b _02338828 ; case 12
_02337E60:
	ldr r0, [sb, #0x28]
	bl ov01_0232ADC0
	ldr r0, [sb, #0x18]
	bl ov01_0232AED4
	mov r0, #1
	str r0, [sb]
	b _02338838
_02337E7C:
	ldrb r0, [sb, #0x3e]
	mov r1, #0xa0
	mov r2, #0
	cmp r0, #0
	mov r0, #0xe0
	bne _02337ED8
	bl ov01_0232C148
	mov r0, #0xec
	mov r1, #0x1c
	mov r2, #7
	mov r3, #6
	bl ov01_0232C3AC
	ldr r1, _02338844 ; =ov01_0233C210
	mov r0, #0
	ldrsb r4, [r1]
	ldr r2, _02338848 ; =ov01_0233BD1C
	ldr r3, _0233884C ; =0x000036D8
	mov r1, r0
	str r4, [sp]
	bl sub_02046A9C
	mov r0, #2
	str r0, [sb]
	b _02338838
_02337ED8:
	bl ov01_0232C148
	mov r0, #0xec
	mov r1, #0x1c
	mov r2, #7
	mov r3, #6
	bl ov01_0232C3AC
	mov r0, #3
	str r0, [sb]
	b _02338838
_02337EFC:
	bl ov01_02337948
	cmp r0, #2
	moveq r0, #3
	streq r0, [sb]
	beq _02338838
	cmp r0, #3
	cmpne r0, #1
	bne _02338838
	bl ov01_0232B2CC
	mov r0, #1
	b _0233883C
_02337F28:
	mov r0, #0
	ldr r1, _02338850 ; =0x000036D9
	mov r2, r0
	bl sub_02046BE8
	mov r0, #4
	str r0, [sb]
	b _02338838
_02337F44:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #5
	strne r0, [sb]
	b _02338838
_02337F58:
	bl sub_02003B94
	ldr r0, _02338844 ; =ov01_0233C210
	ldr r1, _02338854 ; =ov01_02338864
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x2c]
	bl ov01_0232B5D0
	ldr r0, _02338844 ; =ov01_0233C210
	mov r3, #0
	ldr r1, [r0, #4]
	ldr r2, _02338858 ; =ov01_023389D4
	str r3, [r1, #0x34]
	ldr r1, [r0, #4]
	str r3, [r1, #0x38]
	ldr r0, [r0, #4]
	ldrh r1, [r0, #0x24]
	ldr r0, [r0, #0x20]
	bl ov01_0232B124
	mov r0, #6
	str r0, [sb]
	b _02338838
_02337FAC:
	ldr r0, [sb, #4]
	mov r5, #0
	add r0, sb, r0, lsl #2
	ldr r7, [r0, #0xc]
	bl ov01_0232AF4C
	mov r6, r0
	bl ov01_0232AFC4
	cmp r0, #0
	beq _0233800C
	mov r0, r5
	bl ov01_0232B040
	ldr r0, _02338844 ; =ov01_0233C210
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x2c]
	cmp r0, #5
	blt _02338000
	cmp r0, #0xb
	ldrneb r0, [r1, #0x3d]
	cmpne r0, #0
	movne r5, #1
	bne _02338580
_02338000:
	mov r0, #0xa
	str r0, [sb, #0x2c]
	b _0233809C
_0233800C:
	bl ov01_0232BE4C
	cmp r0, #0
	bne _02338060
	bl ov01_02337CE4
	cmp r0, #0
	beq _02338060
	add r1, sp, #0xc
	mov r0, r5
	bl GetPressedButtons
	ldrh r0, [sp, #0xc]
	tst r0, #2
	bne _02338054
	bl sub_020467F0
	cmp r0, #0
	bne _02338054
	bl sub_02003B5C
	cmp r0, #0
	beq _02338060
_02338054:
	bl ov01_0232BE08
	mov r0, #9
	str r0, [sb, #0x2c]
_02338060:
	cmp r6, #5
	addls pc, pc, r6, lsl #2
	b _0233808C
_0233806C: ; jump table
	b _0233808C ; case 0
	b _0233808C ; case 1
	b _02338084 ; case 2
	b _0233808C ; case 3
	b _0233808C ; case 4
	b _0233808C ; case 5
_02338084:
	mov r0, #0xa
	str r0, [sb, #0x2c]
_0233808C:
	bl ov01_0232C008
	cmp r0, #0xa
	movge r0, #0xa
	strge r0, [sb, #0x2c]
_0233809C:
	sub fp, r6, #4
	b _02338574
_023380A4:
	ldr r0, [sb, #0x2c]
	mov r5, #1
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02338574
_023380B8: ; jump table
	b _023380E8 ; case 0
	b _02338104 ; case 1
	b _02338254 ; case 2
	b _023382A8 ; case 3
	b _023383DC ; case 4
	b _02338438 ; case 5
	b _02338474 ; case 6
	b _023384D4 ; case 7
	b _023384E8 ; case 8
	b _023384EC ; case 9
	b _02338528 ; case 10
	b _02338560 ; case 11
_023380E8:
	cmp r6, #0
	beq _023380F8
	cmp fp, #1
	bhi _02338574
_023380F8:
	mov r0, #1
	str r0, [sb, #0x2c]
	b _02338574
_02338104:
	ldr r0, _02338844 ; =ov01_0233C210
	ldr sl, [r7]
	ldr r0, [r0, #4]
	add r1, sl, #0x21
	ldr r0, [r0, #0x40]
	bic r8, r1, #0x1f
	cmp r0, #0
	ldr r0, [r7, #4]
	str r0, [sp, #4]
	bne _023381F0
	mov r0, r8
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, r8
	mov r1, #8
	bl MemAlloc
	ldr ip, _02338844 ; =ov01_0233C210
	ldr r1, [sp, #4]
	ldr r3, [ip, #4]
	mov r2, sl
	str r0, [r3, #0x40]
	ldr r3, [ip, #4]
	add r0, r4, #2
	str r8, [r3, #0x44]
	bl MemcpySimple
	add r0, sl, #2
	sub r1, r8, sl
	add r0, r4, r0
	sub r1, r1, #2
	bl MemZero
	mov r3, #0
	mov r0, r3
	sub r2, r8, #2
	b _023381B0
_02338190:
	add r1, r4, r0
	ldrb sl, [r1, #3]
	ldrb r1, [r1, #2]
	add r0, r0, #2
	orr r1, r1, sl, lsl #8
	add r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
_023381B0:
	cmp r0, r2
	blo _02338190
	and r0, r3, #0xff
	add r0, r0, r3, asr #8
	and r0, r0, #0xff
	add r1, r4, #2
	strh r3, [r4]
	bl sub_0204E02C
	ldr r0, _02338844 ; =ov01_0233C210
	mov r1, r4
	ldr r0, [r0, #4]
	mov r2, r8
	ldr r0, [r0, #0x40]
	bl sub_0204DF54
	mov r0, r4
	bl MemFree
_023381F0:
	ldr r0, _02338844 ; =ov01_0233C210
	ldr r1, [r7, #8]
	ldr r0, [r0, #4]
	add r1, r1, #0x21
	ldr r0, [r0, #0x48]
	bic r4, r1, #0x1f
	cmp r0, #0
	bne _02338230
	mov r0, r4
	mov r1, #8
	bl MemAlloc
	ldr r1, _02338844 ; =ov01_0233C210
	ldr r2, [r1, #4]
	str r0, [r2, #0x48]
	ldr r0, [r1, #4]
	str r4, [r0, #0x4c]
_02338230:
	mov r1, #0
	strb r1, [sb, #0x54]
	ldr r0, [sb, #0x18]
	cmp r0, #1
	moveq r1, #0xa
	str r1, [sb, #0x5c]
	mov r0, #2
	str r0, [sb, #0x2c]
	b _02338574
_02338254:
	bl ov01_0232AFB0
	cmp r0, #0
	beq _02338574
	ldr r0, [sb, #0x5c]
	sub r0, r0, #1
	str r0, [sb, #0x5c]
	cmp r0, #0
	bgt _02338574
	mov r0, #0
	bl ov01_02337D00
	bl ov01_0232B068
	ldr r1, [r7]
	ldr r2, [r7, #0xc]
	ldmib r7, {r0, r3}
	bl ov01_0232B420
	cmp r0, #0
	movne r0, #0x258
	strne r0, [sb, #0x50]
	movne r0, #3
	strne r0, [sb, #0x2c]
	b _02338574
_023382A8:
	ldr r0, [sb, #0x50]
	sub r0, r0, #1
	str r0, [sb, #0x50]
	bl ov01_0232B00C
	cmp r0, #0
	beq _023383AC
	bl ov01_0232B068
	ldr r8, [r7, #8]
	ldr r2, [sb, #0x4c]
	ldr r4, [sb, #0x48]
	mov r0, r8
	mov r1, #0xf
	str r2, [sp, #8]
	ldr sl, [r7, #0xc]
	bl MemAlloc
	mov r1, r4
	mov r4, r0
	mov r2, r8
	bl sub_0204DFB0
	ldrb r3, [r4]
	ldrb r0, [r4, #1]
	add r1, r4, #2
	sub r2, r8, #2
	add r0, r3, r0
	and r0, r0, #0xff
	bl sub_0204E0A0
	mov r1, #0
	mov r0, r1
	sub r2, r8, #2
	b _02338340
_02338320:
	add r3, r4, r0
	ldrb r8, [r3, #3]
	ldrb r3, [r3, #2]
	add r0, r0, #2
	orr r3, r3, r8, lsl #8
	add r1, r1, r3
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
_02338340:
	cmp r0, r2
	blo _02338320
	ldrh r0, [r4]
	cmp r1, r0
	beq _02338360
	mov r0, r4
	bl MemFree
	b _02338378
_02338360:
	ldr r2, [sp, #8]
	mov r0, sl
	mov r1, r4
	bl MemcpySimple
	mov r0, r4
	bl MemFree
_02338378:
	ldr r1, [r7, #0x10]
	cmp r1, #0
	moveq r0, #1
	beq _02338390
	ldr r0, [r7, #0xc]
	blx r1
_02338390:
	str r0, [sb, #0x34]
	mov r0, #0
	str r0, [sb, #0x38]
	strb r0, [sb, #0x3d]
	mov r0, #4
	str r0, [sb, #0x2c]
	b _02338574
_023383AC:
	ldr r0, [sb, #0x50]
	cmp r0, #0
	bgt _02338574
	ldrb r0, [sb, #0x54]
	cmp r0, #0
	moveq r0, r5
	streqb r0, [sb, #0x54]
	moveq r0, #2
	streq r0, [sb, #0x2c]
	beq _02338574
	mov r5, #4
	b _02338580
_023383DC:
	ldr r0, [sb, #0x18]
	cmp r0, #0
	bne _02338424
	ldr r0, [sb, #0x34]
	add r2, sp, #0xe
	strb r0, [sp, #0xe]
	ldr r3, [sb, #0x38]
	mov r0, #0
	mov r1, #3
	strb r3, [sp, #0xf]
	strb r0, [sp, #0x10]
	bl ov01_0232B540
	cmp r0, #0
	movne r0, #0x258
	strne r0, [sb, #0x50]
	movne r0, #5
	strne r0, [sb, #0x2c]
	b _02338574
_02338424:
	mov r0, #0x258
	str r0, [sb, #0x50]
	mov r0, #5
	str r0, [sb, #0x2c]
	b _02338574
_02338438:
	ldr r0, [sb, #0x50]
	sub r0, r0, #1
	str r0, [sb, #0x50]
	ldrb r0, [sb, #0x3d]
	cmp r0, #0
	movne r0, #6
	strne r0, [sb, #0x2c]
	movne r0, #0x3c
	strne r0, [sb, #0x58]
	bne _02338574
	ldr r0, [sb, #0x50]
	cmp r0, #0
	bgt _02338574
	mov r5, #4
	b _02338580
_02338474:
	ldr r0, [sb, #0x58]
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #0
	bne _023384B8
	ldr r0, _02338844 ; =ov01_0233C210
	add r2, sp, #0x11
	ldr r4, [r0, #4]
	mov r3, r5
	ldr r1, [r4, #0x34]
	mov r0, #0
	strb r1, [sp, #0x11]
	ldr r4, [r4, #0x38]
	mov r1, #3
	strb r4, [sp, #0x12]
	strb r3, [sp, #0x13]
	bl ov01_0232B540
_023384B8:
	ldr r0, [sb, #0x58]
	sub r0, r0, #1
	str r0, [sb, #0x58]
	cmp r0, #0
	movle r0, #7
	strle r0, [sb, #0x2c]
	b _02338574
_023384D4:
	ldr r0, _0233885C ; =ov01_0233BE24
	bl Debug_Print0
	mov r0, #8
	str r0, [sb, #0x2c]
	b _02338574
_023384E8:
	b _02338580
_023384EC:
	bl ov01_0232BDDC
	cmp r0, #0
	beq _02338504
	bl ov01_0232BDF0
	mov r5, #2
	b _02338580
_02338504:
	bl ov01_0232BE4C
	cmp r0, #0
	beq _0233851C
	bl ov01_0232AFB0
	cmp r0, #0
	beq _02338574
_0233851C:
	mov r0, #0
	str r0, [sb, #0x2c]
	b _02338574
_02338528:
	ldr r0, _02338860 ; =ov01_0233BE48
	bl Debug_Print0
	bl ov01_0232C008
	cmp r0, #0xa
	beq _02338548
	cmp r0, #0xc
	beq _02338550
	b _02338558
_02338548:
	mov r5, #4
	b _02338580
_02338550:
	mov r5, #3
	b _02338580
_02338558:
	mov r5, #3
	b _02338580
_02338560:
	bl sub_02003B5C
	cmp r0, #0
	movne r5, #3
	moveq r5, #5
	b _02338580
_02338574:
	cmp r5, #0
	beq _023380A4
	mov r5, #0
_02338580:
	cmp r5, #1
	bne _023385FC
	bl ov01_0233893C
	bl ov01_02338978
	ldr r1, [sb, #4]
	ldr r0, [sb, #8]
	add r1, r1, #1
	cmp r1, r0
	blo _023385DC
	mov r0, #0
	bl ov01_0232C040
	mov r0, #4
	str r0, [sb, #0x30]
	bl ov01_023389B4
	cmp r0, #1
	bne _023385D0
	ldrb r0, [sb, #0x26]
	cmp r0, #0
	movne r0, #7
	bne _023385D4
_023385D0:
	mov r0, #9
_023385D4:
	str r0, [sb]
	b _023385EC
_023385DC:
	mov r0, #0xe10
	bl ov01_0232B020
	mov r0, #0xb
	str r0, [sb, #0x2c]
_023385EC:
	ldr r0, [sb, #4]
	add r0, r0, #1
	str r0, [sb, #4]
	b _02338838
_023385FC:
	cmp r5, #5
	moveq r0, #0xf
	beq _0233883C
	cmp r5, #2
	bne _0233862C
	bl ov01_0233893C
	bl ov01_02338978
	mov r0, #5
	str r0, [sb, #0x30]
	mov r0, #9
	str r0, [sb]
	b _02338838
_0233862C:
	cmp r5, #4
	bne _02338650
	bl ov01_0233893C
	bl ov01_02338978
	mov r0, #7
	str r0, [sb, #0x30]
	mov r0, #9
	str r0, [sb]
	b _02338838
_02338650:
	cmp r5, #3
	bne _02338838
	bl ov01_0233893C
	bl ov01_02338978
	mov r0, #8
	str r0, [sb, #0x30]
	mov r0, #9
	str r0, [sb]
	b _02338838
_02338674:
	bl ov01_0232B18C
	mov r0, #8
	str r0, [sb]
	mov r0, #0x258
	str r0, [sb, #0x50]
	b _02338838
_0233868C:
	bl ov01_0232AF4C
	cmp r0, #2
	cmpne r0, #0
	beq _023386AC
	cmp r0, #1
	movne r0, #0
	moveq r0, #1
	b _023386B4
_023386AC:
	bl ov01_0232B2CC
	mov r0, #1
_023386B4:
	cmp r0, #0
	movne r0, #0xb
	strne r0, [sb]
	bne _02338838
	ldr r1, [sb, #0x50]
	sub r0, r1, #1
	str r0, [sb, #0x50]
	cmp r1, #0
	bge _02338838
	mov r0, #1
	bl ov01_0232B210
	mov r0, #0x258
	str r0, [sb, #0x50]
	mov r0, #0xa
	str r0, [sb]
	b _02338838
_023386F4:
	mov r0, #0
	bl ov01_0232B210
	mov r0, #0xa
	str r0, [sb]
	mov r0, #0x258
	str r0, [sb, #0x50]
	b _02338838
_02338710:
	bl ov01_0232AF4C
	cmp r0, #2
	cmpne r0, #0
	movne r0, #0
	bne _0233872C
	bl ov01_0232B2CC
	mov r0, #1
_0233872C:
	cmp r0, #0
	beq _02338740
	bl sub_02003BC8
	mov r0, #0xb
	str r0, [sb]
_02338740:
	ldr r1, [sb, #0x50]
	sub r0, r1, #1
	str r0, [sb, #0x50]
	cmp r1, #0
	bge _02338838
	mov r0, #1
	bl ov01_0232B210
	mov r0, #0x258
	str r0, [sb, #0x50]
	b _02338838
_02338768:
	ldr r0, [sb, #0x30]
	ldr r4, [sb, #0x20]
	cmp r0, #4
	bne _023387F8
	bl ov01_023389B4
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02338804
_02338788: ; jump table
	b _02338804 ; case 0
	b _023387A8 ; case 1
	b _023387B0 ; case 2
	b _023387BC ; case 3
	b _023387C8 ; case 4
	b _023387D4 ; case 5
	b _023387E0 ; case 6
	b _023387EC ; case 7
_023387A8:
	mov r0, #4
	b _0233883C
_023387B0:
	mov r0, #9
	str r0, [sb, #0x30]
	b _02338804
_023387BC:
	mov r0, #0xa
	str r0, [sb, #0x30]
	b _02338804
_023387C8:
	mov r0, #0xb
	str r0, [sb, #0x30]
	b _02338804
_023387D4:
	mov r0, #0xc
	str r0, [sb, #0x30]
	b _02338804
_023387E0:
	mov r0, #0xd
	str r0, [sb, #0x30]
	b _02338804
_023387EC:
	mov r0, #0xe
	str r0, [sb, #0x30]
	b _02338804
_023387F8:
	cmp r0, #6
	moveq r0, #6
	beq _0233883C
_02338804:
	bl sub_02046BB4
	ldrb r1, [sb, #0x1c]
	ldrb r2, [r4]
	ldrb r3, [sb, #0x3e]
	ldr r0, [sb, #0x30]
	bl ov01_02337998
	mov r0, #0xc
	str r0, [sb]
	b _02338838
_02338828:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, [sb, #0x30]
	bne _0233883C
_02338838:
	mov r0, #0
_0233883C:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338844: .word ov01_0233C210
_02338848: .word ov01_0233BD1C
#if defined(EUROPE)
_0233884C: .word 0x000036DA
_02338850: .word 0x000036DB
#elif defined(JAPAN)
_0233884C: .word 0x0000335A
_02338850: .word 0x0000335B
#else
_0233884C: .word 0x000036D8
_02338850: .word 0x000036D9
#endif
_02338854: .word ov01_02338864
_02338858: .word ov01_023389D4
_0233885C: .word ov01_0233BE24
_02338860: .word ov01_0233BE48
	arm_func_end ov01_02337E0C

	arm_func_start ov01_02338864
ov01_02338864: ; 0x02338864
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r2, _02338938 ; =ov01_0233C210
	mov r4, r1
	ldr r2, [r2, #4]
	mov r0, #0
	ldr r1, [r2, #0x34]
	strb r1, [sp]
	ldr r1, [r2, #0x38]
	strb r0, [sp, #2]
	strb r1, [sp, #1]
	ldrb r1, [r4]
	ldr r3, [r2, #0x38]
	cmp r3, r1
	ldreqb r1, [r4, #1]
	ldreq r3, [r2, #0x34]
	cmpeq r3, r1
	beq _023388F0
	ldr r0, _02338938 ; =ov01_0233C210
	mov r1, #0
	str r1, [r0, #8]
	ldrb r1, [r4]
	ldr r0, [r2, #0x38]
	cmp r0, r1
	strne r1, [r2, #0x38]
	add r2, sp, #0
	mov r0, #0
	mov r1, #3
	bl ov01_0232B540
	cmp r0, #0
	ldreq r0, _02338938 ; =ov01_0233C210
	moveq r1, #0xa
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x2c]
	b _02338930
_023388F0:
	ldrb r1, [r2, #0x3d]
	cmp r1, #0
	bne _02338930
	mov r1, #1
	strb r1, [r2, #0x3d]
	strb r1, [sp, #2]
	add r2, sp, #0
	mov r1, #3
	bl ov01_0232B540
	ldrb r1, [r4, #2]
	cmp r1, #0
	cmpeq r0, #0
	ldreq r0, _02338938 ; =ov01_0233C210
	moveq r1, #0xa
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x2c]
_02338930:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02338938: .word ov01_0233C210
	arm_func_end ov01_02338864

	arm_func_start ov01_0233893C
ov01_0233893C: ; 0x0233893C
	stmdb sp!, {r3, lr}
	ldr r0, _02338974 ; =ov01_0233C210
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02338974 ; =ov01_0233C210
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #0x40]
	ldr r0, [r0, #4]
	str r2, [r0, #0x44]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338974: .word ov01_0233C210
	arm_func_end ov01_0233893C

	arm_func_start ov01_02338978
ov01_02338978: ; 0x02338978
	stmdb sp!, {r3, lr}
	ldr r0, _023389B0 ; =ov01_0233C210
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _023389B0 ; =ov01_0233C210
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #0x48]
	ldr r0, [r0, #4]
	str r2, [r0, #0x4c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023389B0: .word ov01_0233C210
	arm_func_end ov01_02338978

	arm_func_start ov01_023389B4
ov01_023389B4: ; 0x023389B4
	ldr r0, _023389D0 ; =ov01_0233C210
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x34]
	ldr r1, [r1, #0x38]
	cmp r0, r1
	movlt r0, r1
	bx lr
	.align 2, 0
_023389D0: .word ov01_0233C210
	arm_func_end ov01_023389B4

	arm_func_start ov01_023389D4
ov01_023389D4: ; 0x023389D4
	ldr r1, _02338A20 ; =ov01_0233C210
	ldrb r2, [r0, #0x4a]
	ldr r1, [r1, #4]
	cmp r2, #0
	ldr r2, [r1, #0x20]
	moveq r0, #0
	bxeq lr
	ldrb r1, [r0, #0x51]
	cmp r1, #0
	ldrneb r1, [r2, #1]
	cmpne r1, #0
	movne r0, #0
	bxne lr
	ldrb r1, [r0, #0x50]
	ldrb r0, [r2]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02338A20: .word ov01_0233C210
	arm_func_end ov01_023389D4

	arm_func_start ov01_02338A24
ov01_02338A24: ; 0x02338A24
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
#else
	stmdb sp!, {lr}
	sub sp, sp, #0xc
#endif
	ldr r0, _02338B00 ; =0x00005004
	mov r1, #8
	bl MemAlloc
	ldr r2, _02338B04 ; =ov01_0233C21C
	ldr r1, _02338B00 ; =0x00005004
	str r0, [r2, #4]
	bl MemZero
	ldr r2, _02338B04 ; =ov01_0233C21C
	mov r1, #0
	ldr r3, [r2, #4]
	add r0, sp, #0
	str r1, [r3]
	ldr r3, [r2, #4]
	str r1, [r3, #0xc]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x10]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x11]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x12]
	ldr r3, [r2, #4]
#ifdef JAPAN
	str r1, [r3, #0x24]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x1e]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x1f]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x20]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x21]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x22]
	ldr r3, [r2, #4]
	str r1, [r3, #0x2c]
	ldr r3, [r2, #4]
	str r1, [r3, #0x30]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x28]
	ldr r2, [r2, #4]
	add r2, r2, #0x4000
	str r1, [r2, #0xb50]
#else
	str r1, [r3, #0x30]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x28]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x29]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x2a]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x2b]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x2c]
	ldr r3, [r2, #4]
	str r1, [r3, #0x38]
	ldr r3, [r2, #4]
	str r1, [r3, #0x3c]
	ldr r3, [r2, #4]
	strb r1, [r3, #0x34]
	ldr r2, [r2, #4]
	add r2, r2, #0x4000
	str r1, [r2, #0xb5c]
#endif
	bl GetMainTeamNameWithCheck
	ldr r0, _02338B04 ; =ov01_0233C21C
	add r1, sp, #0
	ldr r0, [r0, #4]
#ifdef JAPAN
	mov r2, #5
	add r0, r0, #0x14
	bl StrcpyName
#else
	mov r2, #0xa
	add r0, r0, #0x14
	bl sub_02025404
#endif
	bl ov01_0233A840
	bl ov01_0232C0CC
	bl ov01_0232C2E4
#ifdef JAPAN
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338B00: .word 0x00004FF8
#else
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_02338B00: .word 0x00005004
#endif
_02338B04: .word ov01_0233C21C
	arm_func_end ov01_02338A24

	arm_func_start ov01_02338B08
ov01_02338B08: ; 0x02338B08
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r0, _02338BE8 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02338BDC
	bl ov00_022BD274
	cmp r0, #0
	bne _02338BBC
	mov r5, #0
	add r4, sp, #0
_02338B34:
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD2C0
	strb r0, [r4, r5]
	add r5, r5, #1
	cmp r5, #0x10
	blt _02338B34
	ldr r0, _02338BE8 ; =ov01_0233C21C
	mov r1, r4
	ldr r0, [r0, #4]
	mov r2, #0x10
#ifdef JAPAN
	add r0, r0, #0x65
#else
	add r0, r0, #0x71
#endif
	add r0, r0, #0x4f00
	bl ov00_022BD1D4
	cmp r0, #0
	moveq r0, #1
	beq _02338BAC
	add r0, sp, #0x10
	mov r1, #0x10
	bl ov00_022BD1A0
	ldr r0, _02338BE8 ; =ov01_0233C21C
	add r1, sp, #0x10
	ldr r0, [r0, #4]
	mov r2, #0x10
#ifdef JAPAN
	add r0, r0, #0x378
#else
	add r0, r0, #0x384
#endif
	add r0, r0, #0x4c00
	bl ov00_022BD21C
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
_02338BAC:
	cmp r0, #0
	beq _02338BBC
	mov r0, #1
	bl ov00_022BD264
_02338BBC:
	bl ov01_0232C370
	bl ov01_0232C10C
	ldr r0, _02338BE8 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02338BE8 ; =ov01_0233C21C
	mov r1, #0
	str r1, [r0, #4]
_02338BDC:
	bl ov00_022BD274
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02338BE8: .word ov01_0233C21C
	arm_func_end ov01_02338B08

	arm_func_start ov01_02338BEC
ov01_02338BEC: ; 0x02338BEC
	cmp r0, #0
	ldrne r0, _02338C24 ; =ov01_0233C21C
	movne r2, #0xd
	ldreq r0, _02338C24 ; =ov01_0233C21C
	moveq r2, #0xb
	ldreq ip, [r0, #4]
	ldreq r3, [ip]
	streq r3, [ip, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldr r0, _02338C24 ; =ov01_0233C21C
	ldr r0, [r0, #4]
#ifdef JAPAN
	strb r1, [r0, #0x34]
#else
	strb r1, [r0, #0x40]
#endif
	bx lr
	.align 2, 0
_02338C24: .word ov01_0233C21C
	arm_func_end ov01_02338BEC

	arm_func_start ov01_02338C28
ov01_02338C28: ; 0x02338C28
	ldr ip, _02338C30 ; =ov01_02338BEC
	bx ip
	.align 2, 0
_02338C30: .word ov01_02338BEC
	arm_func_end ov01_02338C28

	arm_func_start ov01_02338C34
ov01_02338C34: ; 0x02338C34
	ldr r0, _02338C48 ; =ov01_0233C21C
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x12]
	bx lr
	.align 2, 0
_02338C48: .word ov01_0233C21C
	arm_func_end ov01_02338C34

	arm_func_start ov01_02338C4C
ov01_02338C4C: ; 0x02338C4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _02338DA8
_02338C60: ; jump table
	b _02338C98 ; case 0
	b _02338CAC ; case 1
	b _02338CC0 ; case 2
	b _02338CD4 ; case 3
	b _02338CE8 ; case 4
	b _02338CFC ; case 5
	b _02338D10 ; case 6
	b _02338D24 ; case 7
	b _02338D38 ; case 8
	b _02338D4C ; case 9
	b _02338D60 ; case 10
	b _02338D74 ; case 11
	b _02338D88 ; case 12
	b _02338D9C ; case 13
_02338C98:
	ldr r4, _02338DE0 ; =ov01_0233BE88
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xa4
	b _02338DA8
_02338CAC:
	ldr r4, _02338DE4 ; =ov01_0233BEA4
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0x98
	b _02338DA8
_02338CC0:
	ldr r4, _02338DE8 ; =ov01_0233BEC4
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0x20
	b _02338DA8
_02338CD4:
	ldr r4, _02338DEC ; =ov01_0233BEE0
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xc
	b _02338DA8
_02338CE8:
	ldr r4, _02338DF0 ; =ov01_0233BEFC
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xc
	b _02338DA8
_02338CFC:
	ldr r4, _02338DF4 ; =ov01_0233BF18
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xd4
	b _02338DA8
_02338D10:
	ldr r4, _02338DF8 ; =ov01_0233BF38
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xc
	b _02338DA8
_02338D24:
	ldr r4, _02338DFC ; =ov01_0233BF54
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0x7c
	b _02338DA8
_02338D38:
	ldr r4, _02338E00 ; =ov01_0233BF74
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xc
	b _02338DA8
_02338D4C:
	ldr r4, _02338E04 ; =ov01_0233BF94
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0x10c
	b _02338DA8
_02338D60:
	ldr r4, _02338E08 ; =ov01_0233BFB0
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0x18
	b _02338DA8
_02338D74:
	ldr r4, _02338E0C ; =ov01_0233BFC8
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xc
	b _02338DA8
_02338D88:
	ldr r4, _02338E10 ; =ov01_0233BFE0
	bl ov00_022BCCC8
	mov r1, r0
	mov r3, #0xc
	b _02338DA8
_02338D9C:
	ldr r4, _02338E14 ; =ov01_0233BFF8
	mov r1, #0
	mov r3, #4
_02338DA8:
	mov ip, #0
	mov r0, r4
	mov r2, r5
	str ip, [sp]
	bl ov01_0233A05C
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02338E18 ; =ov01_0233C21C
	mov r2, #0x11
	ldr r1, [r0, #4]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02338DE0: .word ov01_0233BE88
_02338DE4: .word ov01_0233BEA4
_02338DE8: .word ov01_0233BEC4
_02338DEC: .word ov01_0233BEE0
_02338DF0: .word ov01_0233BEFC
_02338DF4: .word ov01_0233BF18
_02338DF8: .word ov01_0233BF38
_02338DFC: .word ov01_0233BF54
_02338E00: .word ov01_0233BF74
_02338E04: .word ov01_0233BF94
_02338E08: .word ov01_0233BFB0
_02338E0C: .word ov01_0233BFC8
_02338E10: .word ov01_0233BFE0
_02338E14: .word ov01_0233BFF8
_02338E18: .word ov01_0233C21C
	arm_func_end ov01_02338C4C

	arm_func_start ov01_02338E1C
ov01_02338E1C: ; 0x02338E1C
	cmp r0, #0
	ldrne r1, _02338E44 ; =ov01_0233C21C
	ldrne r1, [r1, #4]
#ifdef JAPAN
	ldrne r1, [r1, #0xb48]
#else
	ldrne r1, [r1, #0xb54]
#endif
	strne r1, [r0]
	ldr r0, _02338E44 ; =ov01_0233C21C
	ldr r0, [r0, #4]
#ifdef JAPAN
	add r0, r0, #0x34c
#else
	add r0, r0, #0x358
#endif
	add r0, r0, #0x800
	bx lr
	.align 2, 0
_02338E44: .word ov01_0233C21C
	arm_func_end ov01_02338E1C

	arm_func_start ov01_02338E48
ov01_02338E48: ; 0x02338E48
	ldr ip, _02338E50 ; =ov01_0233A318
	bx ip
	.align 2, 0
_02338E50: .word ov01_0233A318
	arm_func_end ov01_02338E48

	arm_func_start ov01_02338E54
ov01_02338E54: ; 0x02338E54
	ldr r0, _02338E64 ; =ov01_0233C21C
	ldr r0, [r0, #4]
#ifdef JAPAN
	ldr r0, [r0, #0x3c]
#else
	ldr r0, [r0, #0x48]
#endif
	bx lr
	.align 2, 0
_02338E64: .word ov01_0233C21C
	arm_func_end ov01_02338E54

	arm_func_start ov01_02338E68
ov01_02338E68: ; 0x02338E68
	ldr r2, _02338EAC ; =ov01_0233C21C
	ldr r3, [r2, #4]
#ifdef JAPAN
	ldr r2, [r3, #0x3c]
#else
	ldr r2, [r3, #0x48]
#endif
	cmp r0, r2
	movge r0, #0
	bxge lr
	cmp r1, #0
	movne r2, #0xb0
	mlane r2, r0, r2, r3
#ifdef JAPAN
	ldrne r2, [r2, #0xf0]
#else
	ldrne r2, [r2, #0xfc]
#endif
	strne r2, [r1]
	ldr r1, _02338EAC ; =ov01_0233C21C
	ldr r1, [r1, #4]
#ifdef JAPAN
	add r1, r1, #0x34c
#else
	add r1, r1, #0x358
#endif
	add r1, r1, #0x800
	add r0, r1, r0, lsl #10
	bx lr
	.align 2, 0
_02338EAC: .word ov01_0233C21C
	arm_func_end ov01_02338E68

	arm_func_start ov01_02338EB0
ov01_02338EB0: ; 0x02338EB0
	ldr r0, _02338EC0 ; =ov01_0233C21C
	ldr r0, [r0, #4]
#ifdef JAPAN
	ldrb r0, [r0, #0x22]
#else
	ldrb r0, [r0, #0x2c]
#endif
	bx lr
	.align 2, 0
_02338EC0: .word ov01_0233C21C
	arm_func_end ov01_02338EB0

	arm_func_start ov01_02338EC4
ov01_02338EC4: ; 0x02338EC4
#ifdef JAPAN
#define OV01_02338EC4_LOAD_OFFSET -0xC
#define OV01_02338EC4_LOAD_OFFSET_2 -0xA
#else
#define OV01_02338EC4_LOAD_OFFSET 0
#define OV01_02338EC4_LOAD_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, lr}
#ifdef EUROPE
	sub sp, sp, #0x274
#else
	sub sp, sp, #0x1dc
#endif
	ldr r0, _02339804 ; =ov01_0233C21C
	ldr r4, [r0, #4]
	bl ov01_023399D8
	cmp r0, #2
	bne _02338F14
	ldr r0, [r4]
	cmp r0, #0xa
	moveq r0, #1
	streqb r0, [r4, #0x12]
	ldr r0, [r4]
	cmp r0, #0x1a
	blt _02338F04
	cmp r0, #0x1f
	ble _02338F14
_02338F04:
	ldr r1, [r4]
	mov r0, #0x1a
	str r1, [r4, #8]
	str r0, [r4]
_02338F14:
	ldrb r0, [r4, #0x34 + OV01_02338EC4_LOAD_OFFSET]
	cmp r0, #0
	beq _02338F40
	bl ov00_022BDC6C
	add r0, r0, #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov01_0232C1D8
	mov r0, #0
	mov r1, r0
	bl ov01_0232C454
_02338F40:
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	movne r0, #5
	bne _023397FC
	ldr r0, [r4]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _023397F8
_02338F60: ; jump table
	b _02338FE8 ; case 0
	b _023390F4 ; case 1
	b _0233911C ; case 2
	b _0233915C ; case 3
	b _023391BC ; case 4
	b _023391F0 ; case 5
	b _02339218 ; case 6
	b _02339240 ; case 7
	b _02339254 ; case 8
	b _0233926C ; case 9
	b _02339280 ; case 10
	b _02339288 ; case 11
	b _023392B0 ; case 12
	b _02339308 ; case 13
	b _02339328 ; case 14
	b _0233933C ; case 15
	b _02339368 ; case 16
	b _02339394 ; case 17
	b _023393D8 ; case 18
	b _0233941C ; case 19
	b _0233943C ; case 20
	b _023394B4 ; case 21
	b _023395A8 ; case 22
	b _023395D4 ; case 23
	b _023395F4 ; case 24
	b _02339608 ; case 25
	b _0233961C ; case 26
	b _02339728 ; case 27
	b _0233973C ; case 28
	b _02339750 ; case 29
	b _02339778 ; case 30
	b _023397C8 ; case 31
	b _023397D8 ; case 32
	b _023397E8 ; case 33
_02338FE8:
	bl sub_0204A1CC
	bl ov00_022BCA80
	cmp r0, #3
	bne _02339024
	mov r0, #0xe
	str r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #1
	str r0, [r4, #0x3c + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #0x1a
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	b _023397F8
_02339024:
	mov r0, #0xe0
	mov r1, #0xa0
	mov r2, #1
	bl ov01_0232C148
	mov r0, #0xec
	mov r1, #0x1c
	mov r2, #7
	mov r3, #6
	bl ov01_0232C3AC
	bl ov00_022BCCAC
	cmp r0, #0
	bne _02339080
	ldr r0, _02339804 ; =ov01_0233C21C
	ldr r2, _02339808 ; =ov01_0233BE70
	ldrsb r5, [r0, #1]
	ldr r3, _0233980C ; =0x0000375D
	mov r0, #0
	mov r1, #8
	str r5, [sp]
	bl sub_02046A9C
	mov r0, #2
	str r0, [r4]
	b _023397F8
_02339080:
	bl ov00_022BCCF4
	cmp r0, #0
	bne _023390C8
	mov r0, #1
#ifdef EUROPE
	str r0, [sp, #0x13c]
#else
	str r0, [sp, #0xa4]
#endif
	ldr r1, _02339808 ; =ov01_0233BE70
	ldr r0, _02339810 ; =0x0000375E
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
#ifdef EUROPE
	add r3, sp, #0x13c
#else
	add r3, sp, #0xa4
#endif
	mov r1, #8
	mov r2, #0x33
	str r0, [sp, #8]
	bl sub_02046A20
	mov r0, #3
	str r0, [r4]
	b _023397F8
_023390C8:
	ldr r1, _02339804 ; =ov01_0233C21C
	mov r0, #0
	ldrsb r5, [r1]
	ldr r2, _02339808 ; =ov01_0233BE70
	ldr r3, _02339814 ; =0x0000375C
	mov r1, r0
	str r5, [sp]
	bl sub_02046A9C
	mov r0, #1
	str r0, [r4]
	b _023397F8
_023390F4:
	bl ov01_02339838
	cmp r0, #2
	moveq r0, #5
	streq r0, [r4]
	beq _023397F8
	cmp r0, #3
	cmpne r0, #1
	moveq r0, #0x20
	streq r0, [r4]
	b _023397F8
_0233911C:
	bl ov01_02339860
	cmp r0, #2
	bne _02339148
	add r0, r4, #0x3c4 + OV01_02338EC4_LOAD_OFFSET
	add r0, r0, #0x4c00
	bl ov00_022BCD10
	mov r0, #1
	strb r0, [r4, #0x11]
	mov r0, #5
	str r0, [r4]
	b _023397F8
_02339148:
	cmp r0, #3
	cmpne r0, #1
	moveq r0, #0x20
	streq r0, [r4]
	b _023397F8
_0233915C:
	bl sub_02046B04
	bl ov01_023399A8
	cmp r0, #2
	bne _023391A8
	mov r0, #1
#ifdef EUROPE
	str r0, [sp, #0xa4]
#else
	str r0, [sp, #0xc]
#endif
	ldr r1, _02339808 ; =ov01_0233BE70
	ldr r0, _02339818 ; =0x0000375F
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
#ifdef EUROPE
	add r3, sp, #0xa4
#else
	add r3, sp, #0xc
#endif
	mov r1, #8
	mov r2, #0x33
	str r0, [sp, #8]
	bl sub_02046A20
	mov r0, #4
	str r0, [r4]
	b _023397F8
_023391A8:
	cmp r0, #3
	cmpne r0, #1
	moveq r0, #0x20
	streq r0, [r4]
	b _023397F8
_023391BC:
	bl sub_02046B04
	bl ov01_023399A8
	cmp r0, #2
	moveq r0, #1
	streqb r0, [r4, #0x10]
	moveq r0, #5
	streq r0, [r4]
	beq _023397F8
	cmp r0, #3
	cmpne r0, #1
#ifdef EUROPE
	bne _023397F8
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r1, _02339808 ; =ov01_0233BE70
	ldr r0, _02339810 ; =0x00003760
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	add r3, sp, #0xc
	mov r1, #8
	mov r2, #0x33
	str r0, [sp, #8]
	bl sub_02046A20
	mov r0, #3
	str r0, [r4]
#else
	moveq r0, #0x20
	streq r0, [r4]
#endif
	b _023397F8
_023391F0:
	mov r0, #0
	ldr r1, _0233981C ; =0x00003761
	mov r2, r0
	bl sub_02046BE8
	mov r0, #1
	strb r0, [r4, #0x34 + OV01_02338EC4_LOAD_OFFSET]
	bl sub_02003B94
	mov r0, #6
	str r0, [r4]
	b _023397F8
_02339218:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	ldr r0, _02339804 ; =ov01_0233C21C
	mov r2, #1
	ldr r1, [r0, #4]
	mov r0, #7
	str r2, [r1, #0xc]
	str r0, [r4]
	b _023397F8
_02339240:
	ldrb r0, [r4, #0x2a + OV01_02338EC4_LOAD_OFFSET_2]
	cmp r0, #0
	movne r0, #0xa
	strne r0, [r4]
	b _023397F8
_02339254:
	ldr r1, _02339820 ; =0x00003765
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	mov r0, #9
	str r0, [r4]
_0233926C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #7
	strne r0, [r4]
	b _023397F8
_02339280:
	mov r0, #4
	b _023397FC
_02339288:
	ldr r2, _02339808 ; =ov01_0233BE70
	mov r5, #1
	ldr r3, _02339824 ; =0x00003762
	mov r0, #0
	mov r1, #8
	str r5, [sp]
	bl sub_02046A9C
	mov r0, #0xc
	str r0, [r4]
	b _023397F8
_023392B0:
	bl sub_02046B04
	bl ov01_023399A8
	cmp r0, #2
	moveq r0, #0xd
	streq r0, [r4]
	beq _023397F8
	cmp r0, #3
	cmpne r0, #1
	bne _023397F8
	bl ov01_02339958
	ldr r0, [r4, #4]
	sub r0, r0, #0x11
	cmp r0, #1
	bhi _023392FC
	add r0, r4, #0x61 + OV01_02338EC4_LOAD_OFFSET
	add r1, r0, #0x4b00
	mov r0, #0x400
	mov r2, #0
	bl sub_02046C30
_023392FC:
	ldr r0, [r4, #4]
	str r0, [r4]
	b _023397F8
_02339308:
	mov r0, #0
	ldr r1, _02339828 ; =0x00003763
	mov r2, r0
	bl sub_02046BE8
	bl ov01_02339F80
	mov r0, #0xe
	str r0, [r4]
	b _023397F8
_02339328:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0xf
	strne r0, [r4]
	b _023397F8
_0233933C:
	ldrb r0, [r4, #0x28 + OV01_02338EC4_LOAD_OFFSET_2]
	cmp r0, #0
	bne _023397F8
#ifdef NORTH_AMERICA
	mov r0, #0x1c
	rsb r1, r0, #0x3780
#else
	ldr r1, _02339F74 ; =0x00003766
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	bl sub_02003BC8
	mov r0, #0x10
	str r0, [r4]
	b _023397F8
_02339368:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	ldrb r0, [r4, #0x40 + OV01_02338EC4_LOAD_OFFSET]
	cmp r0, #0
	mov r0, #0x21
	strne r0, [r4, #4]
	movne r0, #0x13
	strne r0, [r4]
	streq r0, [r4]
	b _023397F8
_02339394:
	ldr r0, [r4, #0xc]
	cmp r0, #9
	moveq r0, #0xa
	streq r0, [r4]
	beq _023397F8
	bl ov01_023398F0
	cmp r0, #0
	beq _023397F8
	bl ov01_02339928
	add r0, r4, #0x61 + OV01_02338EC4_LOAD_OFFSET
	add r0, r0, #0x4b00
	mov r1, #0x400
	bl sub_02046D44
	mov r0, #0
	mov r1, r0
	bl ov01_02338BEC
	b _023397F8
_023393D8:
	ldr r0, [r4, #0xc]
	cmp r0, #9
	moveq r0, #0xa
	streq r0, [r4]
	beq _023397F8
	bl ov01_023398F0
	cmp r0, #0
	beq _023397F8
	bl ov01_02339928
	add r0, r4, #0x61 + OV01_02338EC4_LOAD_OFFSET
	add r0, r0, #0x4b00
	mov r1, #0x400
	bl sub_02046D44
	mov r0, #0
	mov r1, r0
	bl ov01_02338BEC
	b _023397F8
_0233941C:
	bl ov00_022BD780
	mov r0, #0
	ldr r1, _0233982C ; =0x0000023B
	mov r2, r0
	bl sub_02046BE8
	mov r0, #0x14
	str r0, [r4]
	b _023397F8
_0233943C:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	ldrb r0, [r4, #0x34 + OV01_02338EC4_LOAD_OFFSET]
	cmp r0, #0
	beq _02339460
	mov r0, #0
	mov r1, r0
	bl ov01_0232C454
_02339460:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	mov r0, #0x15
	str r0, [r4]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _023394B4
	bl ov00_022BD3F4
	bl sub_0205B80C
	mov r0, #0
	bl sub_0205B77C
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r0, r1
	bl sub_020590DC
	bl ov00_022BD4EC
	mov r0, #0
	strb r0, [r4, #0x10]
_023394B4:
	mov r0, #3
	bl NoteSaveBase
	mov r5, r0
	bl sub_02029FBC
	cmp r5, #0
	bne _023394FC
	ldrb r1, [r4, #0x11]
	mov r0, #0x1c
	mov r2, #0
	cmp r1, #0
	movne r0, #0
#ifdef JAPAN
	ldr r1, _0233B0A8 ; =0x000004CD
#else
	mov r1, #0x23c
#endif
	strneb r0, [r4, #0x11]
	bl sub_02046BE8
	bl ov01_0233A840
	mov r0, #0x16
	str r0, [r4]
	b _023397F8
_023394FC:
	cmp r5, #1
	ldr r0, [r4, #0xc]
	bne _02339554
	cmp r0, #6
	bne _02339534
	mov r0, #0x10
	str r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #7
	str r0, [r4, #0x3c + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #0x1a
	str r0, [r4]
	b _023397F8
_02339534:
	mov r0, #0x400
#ifdef JAPAN
	add r1, r0, #0xc9
#else
	mov r1, #0x238
#endif
	mov r2, #0
	bl sub_02046BE8
	bl ov01_0232C540
	mov r0, #0x19
	str r0, [r4]
	b _023397F8
_02339554:
	cmp r0, #6
	bne _02339580
	mov r0, #0xf
	str r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_02338EC4_LOAD_OFFSET]
	mov r0, #0x1a
	str r0, [r4]
	b _023397F8
_02339580:
	ldrb r1, [r4, #0x11]
	mov r0, #0x1c
	mov r2, #0
	cmp r1, #0
	ldr r1, _02339830 ; =0x00000239
	movne r0, #0
	bl sub_02046BE8
	mov r0, #0x18
	str r0, [r4]
	b _023397F8
_023395A8:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	ldr r0, _02339804 ; =ov01_0233C21C
	mov r2, #0x3c
	ldr r0, [r0, #4]
	mov r1, #0x17
	add r0, r0, #0x4000
	str r2, [r0, #0xb5c + OV01_02338EC4_LOAD_OFFSET]
	str r1, [r4]
	b _023397F8
_023395D4:
	add r0, r4, #0x4000
	ldr r1, [r0, #0xb5c + OV01_02338EC4_LOAD_OFFSET]
	sub r1, r1, #1
	str r1, [r0, #0xb5c + OV01_02338EC4_LOAD_OFFSET]
	cmp r1, #0
	ldrle r0, [r4, #4]
	strle r0, [r4]
	b _023397F8
_023395F4:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	mov r0, #8
	b _023397FC
_02339608:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	bl CardBackupError
_02339618:
	b _02339618
_0233961C:
#ifdef EUROPE
	add r0, sp, #0x224
#else
	add r0, sp, #0x18c
#endif
	bl InitPreprocessorArgs
	ldr r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	rsb r0, r0, #0
#ifdef EUROPE
	str r0, [sp, #0x248]
#else
	str r0, [sp, #0x1b0]
#endif
	bl sub_02046BB4
	ldr r0, [r4, #0x3c + OV01_02338EC4_LOAD_OFFSET]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _023397F8
_02339644: ; jump table
	b _02339664 ; case 0
	b _02339670 ; case 1
	b _02339670 ; case 2
	b _0233969C ; case 3
	b _0233969C ; case 4
	b _0233969C ; case 5
	b _0233969C ; case 6
	b _023396EC ; case 7
_02339664:
	ldr r0, [r4, #8]
	str r0, [r4]
	b _023397F8
_02339670:
	bl ov00_022BDE24
	ldr r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	mov r1, #0
	bl ov01_0233A8B4
	mov r1, r0
#ifdef EUROPE
	add r2, sp, #0x224
#else
	add r2, sp, #0x18c
#endif
	mov r0, #0x1c
	bl sub_02046BE8
	mov r0, #0x1b
	str r0, [r4]
	b _023397F8
_0233969C:
	bl ov01_02339F80
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _023396C0
	add r0, r4, #0x3c4 + OV01_02338EC4_LOAD_OFFSET
	add r0, r0, #0x4c00
	bl ov00_022BCD2C
	mov r0, #0
	strb r0, [r4, #0x11]
_023396C0:
	bl ov00_022BDE24
	ldr r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	mov r1, #1
	bl ov01_0233A8B4
	mov r1, r0
#ifdef EUROPE
	add r2, sp, #0x224
#else
	add r2, sp, #0x18c
#endif
	mov r0, #0x1c
	bl sub_02046BE8
	mov r0, #0x1c
	str r0, [r4]
	b _023397F8
_023396EC:
	ldr r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	mov r1, #1
	cmp r0, #0x10
	moveq r5, #0x400
	movne r5, #0x1c
	bl ov01_0233A8B4
	mov r3, r5, lsl #0x10
	mov r1, r0
#ifdef EUROPE
	add r2, sp, #0x224
#else
	add r2, sp, #0x18c
#endif
	mov r0, r3, lsr #0x10
	bl sub_02046BE8
	bl ov01_0232C540
	mov r0, #0x1e
	str r0, [r4]
	b _023397F8
_02339728:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, [r4, #8]
	strne r0, [r4]
	b _023397F8
_0233973C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x1d
	strne r0, [r4]
	b _023397F8
_02339750:
	ldrb r0, [r4, #0x28 + OV01_02338EC4_LOAD_OFFSET_2]
	cmp r0, #0
	bne _023397F8
	mov r0, #0
	bl ov00_022BCBAC
	bl sub_02003BC8
	ldr r0, [r4, #0x30 + OV01_02338EC4_LOAD_OFFSET]
	cmp r0, #0
	moveq r0, #8
	b _023397FC
_02339778:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
	ldr r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	cmp r0, #0x10
	bne _02339798
	bl CardBackupError
_02339794:
	b _02339794
_02339798:
#ifdef EUROPE
	add r0, sp, #0x1d4
#else
	add r0, sp, #0x13c
#endif
	bl InitPreprocessorArgs
	ldr r0, [r4, #0x38 + OV01_02338EC4_LOAD_OFFSET]
	ldr r1, _02339834 ; =0x00003785
	rsb r3, r0, #0
#ifdef EUROPE
	add r2, sp, #0x1d4
	mov r0, #0
	str r3, [sp, #0x1f8]
#else
	add r2, sp, #0x13c
	mov r0, #0
	str r3, [sp, #0x160]
#endif
	bl sub_02046BE8
	mov r0, #0x1f
	str r0, [r4]
	b _023397F8
_023397C8:
	bl sub_02046C78
	cmp r0, #0
	beq _023397F8
_023397D4:
	b _023397D4
_023397D8:
	mov r0, #0
	bl ov00_022BCBAC
	mov r0, #1
	b _023397FC
_023397E8:
	mov r0, #0
	bl ov00_022BCBAC
	mov r0, #6
	b _023397FC
_023397F8:
	mov r0, #0
_023397FC:
#ifdef EUROPE
	add sp, sp, #0x274
#else
	add sp, sp, #0x1dc
#endif
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV01_02338EC4_DATA_OFFSET 2
#elif defined(JAPAN)
#define OV01_02338EC4_DATA_OFFSET -0x37E
#else
#define OV01_02338EC4_DATA_OFFSET 0
#endif
_02339804: .word ov01_0233C21C
_02339808: .word ov01_0233BE70
_0233980C: .word 0x0000375D + OV01_02338EC4_DATA_OFFSET
_02339810: .word 0x0000375E + OV01_02338EC4_DATA_OFFSET
_02339814: .word 0x0000375C + OV01_02338EC4_DATA_OFFSET
_02339818: .word 0x0000375F + OV01_02338EC4_DATA_OFFSET
_0233981C: .word 0x00003761 + OV01_02338EC4_DATA_OFFSET
_02339820: .word 0x00003765 + OV01_02338EC4_DATA_OFFSET
_02339824: .word 0x00003762 + OV01_02338EC4_DATA_OFFSET
_02339828: .word 0x00003763 + OV01_02338EC4_DATA_OFFSET
#if defined(EUROPE)
_02339F74: .word 0x00003766
#elif defined(JAPAN)
_02339F74: .word 0x000033E6
#endif
#ifdef JAPAN
_0233982C: .word 0x000004CC
_0233B0A8: .word 0x000004CD
_02339830: .word 0x000004CA
#else
_0233982C: .word 0x0000023B
_02339830: .word 0x00000239
#endif
_02339834: .word 0x00003785 + OV01_02338EC4_DATA_OFFSET
	arm_func_end ov01_02338EC4

	arm_func_start ov01_02339838
ov01_02339838: ; 0x02339838
	stmdb sp!, {r4, lr}
	bl sub_02046B04
	bl ov01_023399A8
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _0233985C ; =ov01_0233C21C
	strb r0, [r1]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233985C: .word ov01_0233C21C
	arm_func_end ov01_02339838

	arm_func_start ov01_02339860
ov01_02339860: ; 0x02339860
	stmdb sp!, {r4, lr}
	bl sub_02046B04
	bl ov01_023399A8
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _02339884 ; =ov01_0233C21C
	strb r0, [r1, #1]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339884: .word ov01_0233C21C
	arm_func_end ov01_02339860

	arm_func_start ov01_02339888
ov01_02339888: ; 0x02339888
	ldr ip, _0233989C ; =sub_02046BE8
	ldr r1, _023398A0 ; =0x00003773
	mov r0, #0x1c
	mov r2, #0
	bx ip
	.align 2, 0
_0233989C: .word sub_02046BE8
#if defined(EUROPE)
_023398A0: .word 0x00003775
#elif defined(JAPAN)
_023398A0: .word 0x000033F5
#else
_023398A0: .word 0x00003773
#endif
	arm_func_end ov01_02339888

	arm_func_start ov01_023398A4
ov01_023398A4: ; 0x023398A4
	ldr ip, _023398AC ; =sub_02046C78
	bx ip
	.align 2, 0
_023398AC: .word sub_02046C78
	arm_func_end ov01_023398A4

	arm_func_start ov01_023398B0
ov01_023398B0: ; 0x023398B0
	ldr r2, _023398EC ; =ov01_0233C21C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	cmp r2, #0xa
	movne r0, #0
	bxne lr
#ifdef JAPAN
	str r0, [r3, #0x2c]
	str r1, [r3, #0x30]
	mov r1, #8
	mov r0, #0x1a
	str r1, [r3, #0x24]
#else
	str r0, [r3, #0x38]
	str r1, [r3, #0x3c]
	mov r1, #8
	mov r0, #0x1a
	str r1, [r3, #0x30]
#endif
	str r0, [r3]
	str r0, [r3, #8]
	mov r0, #1
	bx lr
	.align 2, 0
_023398EC: .word ov01_0233C21C
	arm_func_end ov01_023398B0

	arm_func_start ov01_023398F0
ov01_023398F0: ; 0x023398F0
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #2
	bne _02339918
	bl sub_020467F0
	cmp r0, #0
	beq _02339920
_02339918:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02339920:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov01_023398F0

	arm_func_start ov01_02339928
ov01_02339928: ; 0x02339928
	ldr r1, _02339950 ; =ov01_0233C21C
	ldr r3, _02339954 ; =0x00002A30
	ldr r0, [r1, #4]
	mov r2, #1
	add r0, r0, #0x4000
#ifdef JAPAN
	str r3, [r0, #0xb4c]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	strb r2, [r0, #0xb54]
#else
	str r3, [r0, #0xb58]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	strb r2, [r0, #0xb60]
#endif
	bx lr
	.align 2, 0
_02339950: .word ov01_0233C21C
_02339954: .word 0x00002A30
	arm_func_end ov01_02339928

	arm_func_start ov01_02339958
ov01_02339958: ; 0x02339958
	ldr r1, _02339980 ; =ov01_0233C21C
	ldr r3, _02339984 ; =0x00001C20
	ldr r0, [r1, #4]
	mov r2, #0
	add r0, r0, #0x4000
#ifdef JAPAN
	str r3, [r0, #0xb4c]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	strb r2, [r0, #0xb54]
#else
	str r3, [r0, #0xb58]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	strb r2, [r0, #0xb60]
#endif
	bx lr
	.align 2, 0
_02339980: .word ov01_0233C21C
_02339984: .word 0x00001C20
	arm_func_end ov01_02339958

	arm_func_start ov01_02339988
ov01_02339988: ; 0x02339988
	ldr r0, _023399A0 ; =ov01_0233C21C
	ldr r1, _023399A4 ; =0x00002A30
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
#ifdef JAPAN
	str r1, [r0, #0xb4c]
#else
	str r1, [r0, #0xb58]
#endif
	bx lr
	.align 2, 0
_023399A0: .word ov01_0233C21C
_023399A4: .word 0x00002A30
	arm_func_end ov01_02339988

	arm_func_start ov01_023399A8
ov01_023399A8: ; 0x023399A8
	mvn r2, #1
	cmp r0, r2
	moveq r0, #1
	bxeq lr
	sub r1, r2, #1
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r2, #1
	cmp r0, r1
	moveq r0, #0
	bx lr
	arm_func_end ov01_023399A8

	arm_func_start ov01_023399D8
ov01_023399D8: ; 0x023399D8
#ifdef JAPAN
#define OV01_023399D8_OFFSET -0xC
#define OV01_023399D8_OFFSET_2 -0xA
#else
#define OV01_023399D8_OFFSET 0
#define OV01_023399D8_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	ldr r0, _02339F78 ; =ov01_0233C21C
	ldr r4, [r0, #4]
	ldr r0, [r4, #0xc]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02339F6C
_023399F8: ; jump table
	b _02339F6C ; case 0
	b _02339A2C ; case 1
	b _02339A3C ; case 2
	b _02339AA4 ; case 3
	b _02339ABC ; case 4
	b _02339AE8 ; case 5
	b _02339B54 ; case 6
	b _02339C14 ; case 7
	b _02339C98 ; case 8
	b _02339CDC ; case 9
	b _02339D74 ; case 10
	b _02339EB0 ; case 11
	b _02339F54 ; case 12
_02339A2C:
	bl ov00_022BD798
	mov r0, #2
	str r0, [r4, #0xc]
	b _02339F6C
_02339A3C:
	bl ov00_022BD7B8
	cmp r0, #0
	beq _02339F6C
	bl ov00_022BD7E8
	cmp r0, #4
	beq _02339A68
	bl ov01_0233A7FC
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339A68:
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _02339A90
	add r0, r4, #0x3c4 + OV01_023399D8_OFFSET
	add r0, r0, #0x4c00
	bl ov00_022BCD10
	mov r0, #1
	bl ov00_022BCC30
	mov r0, #1
	strb r0, [r4, #0x11]
_02339A90:
	mov r0, #1
	strb r0, [r4, #0x28 + OV01_023399D8_OFFSET_2]
	mov r0, #4
	str r0, [r4, #0xc]
	b _02339F6C
_02339AA4:
	bl ov00_022BD7D8
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x28 + OV01_023399D8_OFFSET_2]
	strne r0, [r4, #0xc]
	b _02339F6C
_02339ABC:
	add r0, r4, #0x14
	bl ov00_022BD870
	cmp r0, #0
	bne _02339AE0
	bl ov01_0233A7FC
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339AE0:
	mov r0, #5
	str r0, [r4, #0xc]
_02339AE8:
	bl ov00_022BD8FC
	bl ov01_0233A7FC
	cmp r0, #0
	movne r0, #2
	bne _02339F70
	bl ov00_022BD908
	cmp r0, #0
	beq _02339F6C
	bl ov00_022BCC90
	cmp r0, #0
	beq _02339B48
	ldrb r0, [r4, #0x11]
	ldr r1, _02339F7C ; =0x00002A30
	cmp r0, #0
	movne r0, #8
	moveq r0, #7
	str r0, [r4, #4]
	add r0, r4, #0x4000
	str r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	mov r0, #0x13
	str r0, [r4]
	mov r0, #6
	str r0, [r4, #0xc]
	b _02339F6C
_02339B48:
	mov r0, #7
	str r0, [r4, #0xc]
	b _02339F6C
_02339B54:
	bl ov00_022BD8FC
	bl ov01_0233A7FC
	cmp r0, #0
	movne r0, #2
	bne _02339F70
	ldr r0, [r4]
	cmp r0, #7
	moveq r0, #7
	streq r0, [r4, #0xc]
	ldr r0, [r4]
	cmp r0, #0x16
	cmpne r0, #0x17
	cmpne r0, #0x18
	cmpne r0, #9
	bne _02339F6C
	add r1, sp, #2
	mov r0, #0
	bl GetHeldButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _02339BC4
	add r0, sp, #0x28
	bl GetReleasedStylus
	add r0, sp, #0x28
	mov r1, #1
	mov r2, #0
	bl sub_02006C8C
_02339BC4:
	ldrh r1, [sp, #2]
	cmp r1, #0
	cmpeq r0, #0
	ldrne r1, _02339F7C ; =0x00002A30
	addne r0, r4, #0x4000
	strne r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	add r0, r4, #0x4000
	ldr r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	bgt _02339F6C
	mov r0, #0x12
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339C14:
	bl ov00_022BD8FC
	bl ov01_0233A7FC
	cmp r0, #0
	movne r0, #2
	bne _02339F70
	ldr r0, [r4]
	cmp r0, #7
	bne _02339F6C
	bl ov00_022BD918
	cmp r0, #2
	bne _02339C60
	mov r0, #3
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339C60:
	bl ov00_022BD480
	cmp r0, #0
	mov r0, #1
	strneb r0, [r4, #0x29 + OV01_023399D8_OFFSET_2]
	movne r0, #8
	strne r0, [r4, #0xc]
	bne _02339F6C
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339C98:
	bl ov00_022BD8FC
	bl ov01_0233A7FC
	cmp r0, #0
	movne r0, #2
	bne _02339F70
	bl ov00_022BD4DC
	cmp r0, #0
	beq _02339F6C
	mov r0, #1
	strb r0, [r4, #0x2c + OV01_023399D8_OFFSET_2]
	ldr r1, _02339F7C ; =0x00002A30
	strb r0, [r4, #0x2a + OV01_023399D8_OFFSET_2]
	add r0, r4, #0x4000
	str r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	mov r0, #9
	str r0, [r4, #0xc]
	b _02339F6C
_02339CDC:
	bl ov00_022BD8FC
	bl ov01_0233A7FC
	cmp r0, #0
	movne r0, #2
	bne _02339F70
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _02339D24
	add r0, sp, #4
	bl GetReleasedStylus
	add r0, sp, #4
	mov r1, #1
	mov r2, #0
	bl sub_02006C8C
_02339D24:
	ldrh r1, [sp]
	cmp r1, #0
	cmpeq r0, #0
	ldrne r1, _02339F7C ; =0x00002A30
	addne r0, r4, #0x4000
	strne r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	add r0, r4, #0x4000
	ldr r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	bgt _02339F6C
	mov r0, #0x12
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339D74:
	bl ov00_022BD8FC
	bl ov01_0233A130
	cmp r0, #4
	bne _02339E20
	ldr r1, _02339F7C ; =0x00002A30
	add r0, r4, #0x4000
	str r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	mov r1, #9
	ldr r0, _02339F78 ; =ov01_0233C21C
	str r1, [r4, #0xc]
	ldr r0, [r0, #4]
	add r0, r0, #0x358 + OV01_023399D8_OFFSET
	add r0, r0, #0x800
	bl ov01_0232C578
	sub r0, r0, #6
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02339E00
_02339DBC: ; jump table
	b _02339DD0 ; case 0
	b _02339DDC ; case 1
	b _02339DE8 ; case 2
	b _02339DF4 ; case 3
	b _02339E00 ; case 4
_02339DD0:
	mov r0, #7
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	b _02339E08
_02339DDC:
	mov r0, #8
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	b _02339E08
_02339DE8:
	mov r0, #9
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	b _02339E08
_02339DF4:
	mov r0, #0xa
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	b _02339E08
_02339E00:
	mov r0, #0xb
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
_02339E08:
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339E20:
	cmp r0, #5
	bne _02339E48
	mov r0, #0x11
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339E48:
	cmp r0, #6
	bne _02339E70
	mov r0, #0x12
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339E70:
	cmp r0, #0
	beq _02339E9C
	ldr r1, _02339F7C ; =0x00002A30
	add r0, r4, #0x4000
	str r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	mov r0, #9
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x2b + OV01_023399D8_OFFSET_2]
	cmp r0, #0
	beq _02339E9C
	bl ov01_02339F80
_02339E9C:
	bl ov01_0233A7FC
	cmp r0, #0
	beq _02339F6C
	mov r0, #2
	b _02339F70
_02339EB0:
	bl ov00_022BD8FC
	bl ov01_0233A390
	cmp r0, #1
	bne _02339EE8
	ldr r1, _02339F7C ; =0x00002A30
	add r0, r4, #0x4000
	str r1, [r0, #0xb58 + OV01_023399D8_OFFSET]
	mov r0, #9
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x2b + OV01_023399D8_OFFSET_2]
	cmp r0, #0
	beq _02339F40
	bl ov01_02339F80
	b _02339F40
_02339EE8:
	cmp r0, #2
	bne _02339F18
	mov r0, #0x11
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #0xc
	str r0, [r4, #0xc]
	mov r0, #2
	b _02339F70
_02339F18:
	cmp r0, #3
	bne _02339F40
	mov r0, #0x12
	str r0, [r4, #0x38 + OV01_023399D8_OFFSET]
	mov r0, #6
	str r0, [r4, #0x3c + OV01_023399D8_OFFSET]
	mov r0, #8
	str r0, [r4, #0x30 + OV01_023399D8_OFFSET]
	mov r0, #2
	b _02339F70
_02339F40:
	bl ov01_0233A7FC
	cmp r0, #0
	beq _02339F6C
	mov r0, #2
	b _02339F70
_02339F54:
	ldrb r0, [r4, #0x2b + OV01_023399D8_OFFSET_2]
	cmp r0, #0
	beq _02339F64
	bl ov01_02339F80
_02339F64:
	mov r0, #2
	b _02339F70
_02339F6C:
	mov r0, #0
_02339F70:
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02339F78: .word ov01_0233C21C
_02339F7C: .word 0x00002A30
	arm_func_end ov01_023399D8

	arm_func_start ov01_02339F80
ov01_02339F80: ; 0x02339F80
	stmdb sp!, {r3, lr}
	ldr r1, _0233A024 ; =ov01_0233C21C
	mov r3, #0
	ldr r0, [r1, #4]
	mov r2, #1
	add r0, r0, #0x4000
#ifdef JAPAN
	strb r3, [r0, #0xb54]
	ldr r0, [r1, #4]
	strb r2, [r0, #0x21]
#else
	strb r3, [r0, #0xb60]
	ldr r0, [r1, #4]
	strb r2, [r0, #0x2b]
#endif
	ldr r1, [r1, #4]
	ldr r0, [r1, #0xc]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02339FB8: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _02339FEC ; case 1
	b _02339FEC ; case 2
	ldmia sp!, {r3, pc} ; case 3
	b _02339FF8 ; case 4
	b _02339FF8 ; case 5
	b _02339FF8 ; case 6
	b _02339FF8 ; case 7
	b _02339FF8 ; case 8
	b _02339FF8 ; case 9
	b _0233A000 ; case 10
	b _0233A008 ; case 11
	b _0233A010 ; case 12
_02339FEC:
	mov r0, #3
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02339FF8:
	bl ov01_0233A028
	ldmia sp!, {r3, pc}
_0233A000:
	bl ov00_022BDA74
	ldmia sp!, {r3, pc}
_0233A008:
	bl ov00_022BDBA8
	ldmia sp!, {r3, pc}
_0233A010:
	bl ov00_022BDBA8
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov01_0233A028
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A024: .word ov01_0233C21C
	arm_func_end ov01_02339F80

	arm_func_start ov01_0233A028
ov01_0233A028: ; 0x0233A028
	stmdb sp!, {r3, lr}
	bl ov00_022BD95C
	ldr r0, _0233A058 ; =ov01_0233C21C
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #3
#ifdef JAPAN
	strb r3, [r2, #0x1f]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x20]
#else
	strb r3, [r2, #0x29]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x2a]
#endif
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A058: .word ov01_0233C21C
	arm_func_end ov01_0233A028

	arm_func_start ov01_0233A05C
ov01_0233A05C: ; 0x0233A05C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _0233A11C ; =ov01_0233C21C
	mov r7, r0
	ldr r0, [ip, #4]
	mov r6, r1
	ldr r0, [r0, #0xc]
	mov r5, r2
	cmp r0, #9
	mov r4, r3
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov00_022BD968
	ldr r0, _0233A120 ; =ov01_0233C01C
	mov r1, r7
	bl Debug_Print0
	ldr r0, _0233A124 ; =ov01_0233C030
	mov r1, r6
	bl Debug_Print0
	ldr r0, _0233A128 ; =ov01_0233C03C
	mov r1, r4
	bl Debug_Print0
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov00_022BD99C
	cmp r0, #1
	cmpne r0, #2
	cmpne r0, #3
	bne _0233A0E4
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233A0E4:
	ldr r1, _0233A11C ; =ov01_0233C21C
	ldr r2, _0233A12C ; =0x00001C20
	ldr r0, [r1, #4]
	mov r3, #0xa
	add r0, r0, #0x4000
#ifdef JAPAN
	str r2, [r0, #0xb4c]
#else
	str r2, [r0, #0xb58]
#endif
	ldr r0, [r1, #4]
	mov r2, #0
	str r3, [r0, #0xc]
	ldr r1, [r1, #4]
	mov r0, #1
	add r1, r1, #0x4000
#ifdef JAPAN
	strb r2, [r1, #0xb54]
#else
	strb r2, [r1, #0xb60]
#endif
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233A11C: .word ov01_0233C21C
_0233A120: .word ov01_0233C01C
_0233A124: .word ov01_0233C030
_0233A128: .word ov01_0233C03C
_0233A12C: .word 0x00001C20
	arm_func_end ov01_0233A05C

	arm_func_start ov01_0233A130
ov01_0233A130: ; 0x0233A130
#ifdef JAPAN
#define OV01_0233A130_OFFSET -0xC
#else
#define OV01_0233A130_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	ldr r0, _0233A308 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xb60 + OV01_0233A130_OFFSET]
	cmp r0, #0
	beq _0233A1E4
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _0233A184
	add r0, sp, #4
	bl GetReleasedStylus
	add r0, sp, #4
	mov r1, #1
	mov r2, #0
	bl sub_02006C8C
_0233A184:
	ldrh r1, [sp]
	cmp r1, #0
	cmpeq r0, #0
	ldrne r0, _0233A308 ; =ov01_0233C21C
	ldrne r1, _0233A30C ; =0x00002A30
	ldrne r0, [r0, #4]
	addne r0, r0, #0x4000
	strne r1, [r0, #0xb58 + OV01_0233A130_OFFSET]
	ldr r1, _0233A308 ; =ov01_0233C21C
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r2, [r0, #0xb58 + OV01_0233A130_OFFSET]
	cmp r2, #0
	ble _0233A1DC
	sub r2, r2, #1
	str r2, [r0, #0xb58 + OV01_0233A130_OFFSET]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A130_OFFSET]
	cmp r0, #0
	movle r0, #6
	ble _0233A300
_0233A1DC:
	mov r0, #0
	b _0233A300
_0233A1E4:
	bl ov00_022BD9E8
	mov r1, r0
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _0233A2B8
_0233A1F8: ; jump table
	b _0233A21C ; case 0
	b _0233A21C ; case 1
	b _0233A2B8 ; case 2
	b _0233A2B8 ; case 3
	b _0233A2B8 ; case 4
	b _0233A2B8 ; case 5
	b _0233A2B8 ; case 6
	b _0233A2B8 ; case 7
	b _0233A238 ; case 8
_0233A21C:
	ldr r0, _0233A308 ; =ov01_0233C21C
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0xb54 + OV01_0233A130_OFFSET]
	bl ov00_022BD980
	mov r0, #8
	b _0233A300
_0233A238:
	ldr r0, _0233A308 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	add r0, r0, #0x354 + OV01_0233A130_OFFSET
	add r0, r0, #0x800
	bl ov00_022BDA68
	ldr r2, _0233A308 ; =ov01_0233C21C
	mov r1, r0
	ldr r2, [r2, #4]
	add r0, r2, #0x358 + OV01_0233A130_OFFSET
	ldr r2, [r2, #0xb54 + OV01_0233A130_OFFSET]
	add r0, r0, #0x800
	bl MemcpySimple
	bl ov00_022BD980
	ldr r0, _0233A308 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	add r0, r0, #0x358 + OV01_0233A130_OFFSET
	add r0, r0, #0x800
	bl ov01_0232C578
	movs r4, r0
	moveq r0, #7
	beq _0233A300
	ldr r0, _0233A308 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	add r0, r0, #0x358 + OV01_0233A130_OFFSET
	add r0, r0, #0x800
	bl ov01_0232C5AC
	mov r2, r0
	ldr r0, _0233A310 ; =ov01_0233C050
	mov r1, r4
	bl Debug_Print0
	mov r0, #4
	b _0233A300
_0233A2B8:
	ldr r2, _0233A308 ; =ov01_0233C21C
	ldr r0, [r2, #4]
	add r0, r0, #0x4000
	ldr r3, [r0, #0xb58 + OV01_0233A130_OFFSET]
	cmp r3, #0
	ble _0233A2FC
	sub r3, r3, #1
	str r3, [r0, #0xb58 + OV01_0233A130_OFFSET]
	ldr r0, [r2, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A130_OFFSET]
	cmp r0, #0
	bgt _0233A2FC
	ldr r0, _0233A314 ; =ov01_0233C068
	bl Debug_Print0
	mov r0, #5
	b _0233A300
_0233A2FC:
	mov r0, #0
_0233A300:
	add sp, sp, #0x28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A308: .word ov01_0233C21C
_0233A30C: .word 0x00002A30
_0233A310: .word ov01_0233C050
_0233A314: .word ov01_0233C068
	arm_func_end ov01_0233A130

	arm_func_start ov01_0233A318
ov01_0233A318: ; 0x0233A318
#ifdef JAPAN
#define OV01_0233A318_OFFSET -0xC
#else
#define OV01_0233A318_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	ldr r1, _0233A388 ; =ov01_0233C21C
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r0, [r0, #0xc]
	cmp r0, #9
	movne r0, #0
	ldmneia sp!, {r4, pc}
	bl ov00_022BDA94
	ldr r2, _0233A388 ; =ov01_0233C21C
	mov r3, #0xb
	ldr r0, [r2, #4]
	mov r1, #0x12
	str r4, [r0, #0xb50 + OV01_0233A318_OFFSET]
	ldr r0, [r2, #4]
	ldr r4, _0233A38C ; =0x00001C20
	str r3, [r0, #0xc]
	ldr r0, [r2, #4]
	mov r3, #0
	str r1, [r0]
	ldr r1, [r2, #4]
	mov r0, #1
	add r1, r1, #0x4000
	str r4, [r1, #0xb58 + OV01_0233A318_OFFSET]
	ldr r1, [r2, #4]
	add r1, r1, #0x4000
	strb r3, [r1, #0xb60 + OV01_0233A318_OFFSET]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A388: .word ov01_0233C21C
_0233A38C: .word 0x00001C20
	arm_func_end ov01_0233A318

	arm_func_start ov01_0233A390
ov01_0233A390: ; 0x0233A390
#ifdef JAPAN
#define OV01_0233A390_OFFSET -0xC
#define OV01_0233A390_OFFSET_2 -0xA
#else
#define OV01_0233A390_OFFSET 0
#define OV01_0233A390_OFFSET_2 0
#endif
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldrb r0, [r0, #0xb60 + OV01_0233A390_OFFSET]
	cmp r0, #0
	beq _0233A44C
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _0233A3E4
	add r0, sp, #4
	bl GetReleasedStylus
	add r0, sp, #4
	mov r1, #1
	mov r2, #0
	bl sub_02006C8C
_0233A3E4:
	ldrh r1, [sp]
	cmp r1, #0
	cmpeq r0, #0
	ldrne r0, _0233A7F0 ; =ov01_0233C21C
	ldrne r1, _0233A7F4 ; =0x00002A30
	ldrne r0, [r0, #4]
	addne r0, r0, #0x4000
	strne r1, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r2, #0
	ble _0233A444
	sub r2, r2, #1
	str r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	add r1, r0, #0x4000
	ldr r0, [r1, #0xb58 + OV01_0233A390_OFFSET]
	cmp r0, #0
	ldrle r2, _0233A7F8 ; =0x00001C20
	movle r0, #3
	strle r2, [r1, #0xb58 + OV01_0233A390_OFFSET]
	ble _0233A7E8
_0233A444:
	mov r0, #0
	b _0233A7E8
_0233A44C:
	ldr r0, [r1, #0x44 + OV01_0233A390_OFFSET]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0233A7E4
_0233A45C: ; jump table
	b _0233A470 ; case 0
	b _0233A53C ; case 1
	b _0233A60C ; case 2
	b _0233A6DC ; case 3
	b _0233A7B8 ; case 4
_0233A470:
	bl ov00_022BDACC
	cmp r0, #1
	bne _0233A4F0
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x2b + OV01_0233A390_OFFSET_2]
	cmp r0, #0
	movne r0, #4
	strne r0, [r1, #0x44 + OV01_0233A390_OFFSET]
	movne r0, #0
	bne _0233A7E8
	ldr r0, [r1, #0xb50 + OV01_0233A390_OFFSET]
	bl ov00_022BDADC
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	add r0, r0, #0x48 + OV01_0233A390_OFFSET
	bl ov00_022BDB04
	cmp r0, #0
	ldreq r0, _0233A7F0 ; =ov01_0233C21C
	moveq r1, #4
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	beq _0233A7E4
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r3, _0233A7F8 ; =0x00001C20
	ldr r0, [r1, #4]
	mov r2, #1
	add r0, r0, #0x4000
	str r3, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	str r2, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A4F0:
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r2, #0
	ble _0233A7E4
	sub r2, r2, #1
	str r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r0, #0
	bgt _0233A7E4
	bl ov00_022BDBA8
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A53C:
	bl ov00_022BDACC
	cmp r0, #1
	bne _0233A5C0
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x2b + OV01_0233A390_OFFSET_2]
	cmp r0, #0
	movne r0, #4
	strne r0, [r1, #0x44 + OV01_0233A390_OFFSET]
	bne _0233A7E4
	ldr r2, [r1, #0x48 + OV01_0233A390_OFFSET]
	cmp r2, #0
	movle r0, #4
	strle r0, [r1, #0x44 + OV01_0233A390_OFFSET]
	ble _0233A7E4
	add r0, r1, #0x50 + OV01_0233A390_OFFSET
	mov r1, #0
	bl ov00_022BDB38
	cmp r0, #0
	ldreq r0, _0233A7F0 ; =ov01_0233C21C
	moveq r1, #4
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	beq _0233A7E4
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r3, _0233A7F8 ; =0x00001C20
	ldr r0, [r1, #4]
	mov r2, #2
	add r0, r0, #0x4000
	str r3, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	str r2, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A5C0:
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r2, #0
	ble _0233A7E4
	sub r2, r2, #1
	str r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r0, #0
	bgt _0233A7E4
	bl ov00_022BDBA8
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A60C:
	bl ov00_022BDACC
	cmp r0, #1
	bne _0233A690
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #0x4c + OV01_0233A390_OFFSET]
	ldr r3, [r0, #4]
	ldrb r0, [r3, #0x2b + OV01_0233A390_OFFSET_2]
	cmp r0, #0
	movne r0, #4
	strne r0, [r3, #0x44 + OV01_0233A390_OFFSET]
	bne _0233A7E4
	add r1, r3, #0x358 + OV01_0233A390_OFFSET
	ldr r2, [r3, #0xfc + OV01_0233A390_OFFSET]
	add r0, r3, #0x50 + OV01_0233A390_OFFSET
	add r1, r1, #0x800
	bl ov00_022BDB6C
	cmp r0, #0
	ldreq r0, _0233A7F0 ; =ov01_0233C21C
	moveq r1, #4
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	beq _0233A7E4
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r3, _0233A7F8 ; =0x00001C20
	ldr r0, [r1, #4]
	mov r2, #3
	add r0, r0, #0x4000
	str r3, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	str r2, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A690:
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r2, #0
	ble _0233A7E4
	sub r2, r2, #1
	str r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r0, #0
	bgt _0233A7E4
	bl ov00_022BDBA8
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A6DC:
	bl ov00_022BDACC
	cmp r0, #1
	bne _0233A76C
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x4c + OV01_0233A390_OFFSET]
	add r1, r1, #1
	str r1, [r2, #0x4c + OV01_0233A390_OFFSET]
	ldr r2, [r0, #4]
	ldrb r0, [r2, #0x2b + OV01_0233A390_OFFSET_2]
	ldr r4, [r2, #0x4c + OV01_0233A390_OFFSET]
	cmp r0, #0
	movne r0, #4
	strne r0, [r2, #0x44 + OV01_0233A390_OFFSET]
	bne _0233A7E4
	ldr r0, [r2, #0x48 + OV01_0233A390_OFFSET]
	cmp r4, r0
	movge r0, #4
	strge r0, [r2, #0x44 + OV01_0233A390_OFFSET]
	bge _0233A7E4
	mov r0, #0xb0
	mul lr, r4, r0
	add r0, r2, #0x358 + OV01_0233A390_OFFSET
	add r1, r2, lr
	add ip, r2, #0x50 + OV01_0233A390_OFFSET
	add r3, r0, #0x800
	ldr r2, [r1, #0xfc + OV01_0233A390_OFFSET]
	add r0, ip, lr
	add r1, r3, r4, lsl #10
	bl ov00_022BDB6C
	cmp r0, #0
	ldreq r0, _0233A7F0 ; =ov01_0233C21C
	moveq r1, #4
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A76C:
	ldr r1, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r2, #0
	ble _0233A7E4
	sub r2, r2, #1
	str r2, [r0, #0xb58 + OV01_0233A390_OFFSET]
	ldr r0, [r1, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r0, #0
	bgt _0233A7E4
	bl ov00_022BDBA8
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #0x44 + OV01_0233A390_OFFSET]
	b _0233A7E4
_0233A7B8:
	bl ov00_022BDBE4
	cmp r0, #0
	beq _0233A7E4
	ldr r0, _0233A7F0 ; =ov01_0233C21C
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	ldr r0, [r0, #0xb58 + OV01_0233A390_OFFSET]
	cmp r0, #0
	movgt r0, #1
	movle r0, #2
	b _0233A7E8
_0233A7E4:
	mov r0, #0
_0233A7E8:
	add sp, sp, #0x28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A7F0: .word ov01_0233C21C
_0233A7F4: .word 0x00002A30
_0233A7F8: .word 0x00001C20
	arm_func_end ov01_0233A390

	arm_func_start ov01_0233A7FC
ov01_0233A7FC: ; 0x0233A7FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0233A83C ; =ov01_0233C21C
	add r0, sp, #4
	add r1, sp, #0
	ldr r4, [r2, #4]
	bl ov00_022BDCB8
	cmp r0, #0
	ldrne r1, [sp, #4]
	moveq r0, #0
#ifdef JAPAN
	strne r1, [r4, #0x2c]
	ldrne r1, [sp]
	movne r0, #1
	strne r1, [r4, #0x30]
#else
	strne r1, [r4, #0x38]
	ldrne r1, [sp]
	movne r0, #1
	strne r1, [r4, #0x3c]
#endif
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A83C: .word ov01_0233C21C
	arm_func_end ov01_0233A7FC

	arm_func_start ov01_0233A840
ov01_0233A840: ; 0x0233A840
#ifdef JAPAN
#define OV01_0233A840_OFFSET -0xC
#else
#define OV01_0233A840_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _0233A8B0 ; =ov01_0233C21C
	mov r5, #0
_0233A84C:
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov00_022BD0A0
	ldr r1, [r4, #4]
	mov r2, r5, lsl #0x10
	add r1, r1, r5
	add r1, r1, #0x4000
	strb r0, [r1, #0xf61 + OV01_0233A840_OFFSET]
	mov r0, r2, lsr #0x10
	bl ov00_022BD2C0
	ldr r1, [r4, #4]
	mov r2, r5, lsl #0x10
	add r1, r1, r5
	add r1, r1, #0x4000
	strb r0, [r1, #0xf71 + OV01_0233A840_OFFSET]
	mov r0, r2, lsr #0x10
	bl ov00_022BD170
	ldr r1, [r4, #4]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x4000
	add r5, r5, #1
	str r0, [r1, #0xf84 + OV01_0233A840_OFFSET]
	cmp r5, #0x10
	blt _0233A84C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0233A8B0: .word ov01_0233C21C
	arm_func_end ov01_0233A840

	arm_func_start ov01_0233A8B4
ov01_0233A8B4: ; 0x0233A8B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #0
	ble _0233A9C8
	cmp r5, #0x14
	addls pc, pc, r5, lsl #2
	b _0233ACE4
_0233A8D4: ; jump table
	b _0233ACE4 ; case 0
	b _0233A928 ; case 1
	b _0233A930 ; case 2
	b _0233A938 ; case 3
	b _0233A940 ; case 4
	b _0233A948 ; case 5
	b _0233A950 ; case 6
	b _0233A958 ; case 7
	b _0233A960 ; case 8
	b _0233A968 ; case 9
	b _0233A970 ; case 10
	b _0233A978 ; case 11
	b _0233A980 ; case 12
	b _0233A988 ; case 13
	b _0233A990 ; case 14
	b _0233A998 ; case 15
	b _0233A9A0 ; case 16
	b _0233A9A8 ; case 17
	b _0233A9B0 ; case 18
	b _0233A9B8 ; case 19
	b _0233A9C0 ; case 20
_0233A928:
	ldr r0, _0233ACEC ; =0x00003766
	ldmia sp!, {r3, r4, r5, pc}
_0233A930:
	ldr r0, _0233ACF0 ; =0x00003767
	ldmia sp!, {r3, r4, r5, pc}
_0233A938:
	ldr r0, _0233ACF4 ; =0x00003768
	ldmia sp!, {r3, r4, r5, pc}
_0233A940:
	ldr r0, _0233ACF8 ; =0x00003769
	ldmia sp!, {r3, r4, r5, pc}
_0233A948:
	ldr r0, _0233ACFC ; =0x0000376A
	ldmia sp!, {r3, r4, r5, pc}
_0233A950:
	ldr r0, _0233AD00 ; =0x0000376B
	ldmia sp!, {r3, r4, r5, pc}
_0233A958:
	ldr r0, _0233AD04 ; =0x0000376C
	ldmia sp!, {r3, r4, r5, pc}
_0233A960:
	ldr r0, _0233AD08 ; =0x0000376D
	ldmia sp!, {r3, r4, r5, pc}
_0233A968:
	ldr r0, _0233AD0C ; =0x0000376E
	ldmia sp!, {r3, r4, r5, pc}
_0233A970:
	ldr r0, _0233AD10 ; =0x0000376F
	ldmia sp!, {r3, r4, r5, pc}
_0233A978:
	ldr r0, _0233AD14 ; =0x00003770
	ldmia sp!, {r3, r4, r5, pc}
_0233A980:
	ldr r0, _0233AD18 ; =0x00003771
	ldmia sp!, {r3, r4, r5, pc}
_0233A988:
	ldr r0, _0233AD1C ; =0x00003772
	ldmia sp!, {r3, r4, r5, pc}
_0233A990:
	ldr r0, _0233AD20 ; =0x00003773
	ldmia sp!, {r3, r4, r5, pc}
_0233A998:
	ldr r0, _0233AD24 ; =0x00000239
	ldmia sp!, {r3, r4, r5, pc}
_0233A9A0:
#ifdef JAPAN
	ldr r0, _0233C5A4 ; =0x000004C9
#else
	mov r0, #0x238
#endif
	ldmia sp!, {r3, r4, r5, pc}
_0233A9A8:
	ldr r0, _0233AD28 ; =0x00003774
	ldmia sp!, {r3, r4, r5, pc}
_0233A9B0:
	ldr r0, _0233AD2C ; =0x00003775
	ldmia sp!, {r3, r4, r5, pc}
_0233A9B8:
	ldr r0, _0233AD30 ; =0x00003776
	ldmia sp!, {r3, r4, r5, pc}
_0233A9C0:
	ldr r0, _0233AD34 ; =0x00003777
	ldmia sp!, {r3, r4, r5, pc}
_0233A9C8:
	bge _0233ACE4
	ldr r0, _0233AD38 ; =0xFFFFB1E0
	cmp r5, r0
	bgt _0233A9E4
	sub r0, r0, #0x63
	cmp r5, r0
	bge _0233AAA4
_0233A9E4:
	ldr r1, _0233AD3C ; =0xFFFFB17C
	cmp r5, r1
	beq _0233AAA4
	sub r0, r1, #2
	cmp r5, r0
	bgt _0233AA08
	sub r0, r1, #7
	cmp r5, r0
	bge _0233AAA4
_0233AA08:
	ldr r0, _0233AD40 ; =0xFFFFB173
	cmp r5, r0
	beq _0233AAA4
	sub r0, r0, #2
	cmp r5, r0
	bgt _0233AA2C
	ldr r0, _0233AD44 ; =0xFFFFADF9
	cmp r5, r0
	bge _0233AAA4
_0233AA2C:
	ldr r0, _0233AD48 ; =0xFFFF34DC
	cmp r5, r0
	bgt _0233AA44
	sub r0, r0, #0x5f
	cmp r5, r0
	bge _0233AAA4
_0233AA44:
	ldr r0, _0233AD4C ; =0xFFFF3478
	cmp r5, r0
	bgt _0233AA5C
	sub r0, r0, #0x5f
	cmp r5, r0
	bge _0233AAA4
_0233AA5C:
	ldr r0, _0233AD50 ; =0xFFFF3414
	cmp r5, r0
	bgt _0233AA74
	sub r0, r0, #0x5f
	cmp r5, r0
	bge _0233AAA4
_0233AA74:
	ldr r0, _0233AD54 ; =0xFFFF33B4
	cmp r5, r0
	bgt _0233AA8C
	sub r0, r0, #0x63
	cmp r5, r0
	bge _0233AAA4
_0233AA8C:
	ldr r0, _0233AD58 ; =0xFFFF30F8
	cmp r5, r0
	bgt _0233AAAC
	ldr r0, _0233AD5C ; =0xFFFF2FCD
	cmp r5, r0
	blt _0233AAAC
_0233AAA4:
	ldr r0, _0233AD60 ; =0x00003778
	ldmia sp!, {r3, r4, r5, pc}
_0233AAAC:
	ldr r0, _0233AD64 ; =0xFFFFB174
	cmp r5, r0
	ldreq r0, _0233AD68 ; =0x00003779
	ldmeqia sp!, {r3, r4, r5, pc}
	sub r0, r0, #2
	cmp r5, r0
	ldreq r0, _0233AD6C ; =0x0000377A
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0233AD70 ; =0xFFFF38C8
	cmp r5, r0
	bgt _0233AAE4
	sub r0, r0, #0x66
	cmp r5, r0
	bge _0233AB14
_0233AAE4:
	ldr r0, _0233AD74 ; =0xFFFF3860
	cmp r5, r0
	bgt _0233AAFC
	sub r0, r0, #0x5f
	cmp r5, r0
	bge _0233AB14
_0233AAFC:
	ldr r0, _0233AD78 ; =0xFFFF379C
	cmp r5, r0
	bgt _0233AB1C
	sub r0, r0, #0x63
	cmp r5, r0
	blt _0233AB1C
_0233AB14:
	ldr r0, _0233AD7C ; =0x0000377B
	ldmia sp!, {r3, r4, r5, pc}
_0233AB1C:
	ldr r0, _0233AD80 ; =0xFFFF34E0
	cmp r5, r0
	bgt _0233AB34
	sub r0, r0, #3
	cmp r5, r0
	bge _0233AB64
_0233AB34:
	ldr r0, _0233AD84 ; =0xFFFF347C
	cmp r5, r0
	bgt _0233AB4C
	sub r0, r0, #3
	cmp r5, r0
	bge _0233AB64
_0233AB4C:
	ldr r0, _0233AD88 ; =0xFFFF3418
	cmp r5, r0
	bgt _0233AB6C
	sub r0, r0, #3
	cmp r5, r0
	blt _0233AB6C
_0233AB64:
	ldr r0, _0233AD8C ; =0x0000377C
	ldmia sp!, {r3, r4, r5, pc}
_0233AB6C:
	ldr r0, _0233AD90 ; =0xFFFF3861
	cmp r5, r0
	ldreq r0, _0233AD94 ; =0x0000377D
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0233AD98 ; =0xFFFF3CB0
	cmp r5, r0
	bgt _0233AB98
	sub r0, r0, #0x63
	cmp r5, r0
#if defined(EUROPE)
	movge r0, #0x3780
#elif defined(JAPAN)
	movge r0, #0x3400
#else
	ldrge r0, _0233AD9C ; =0x0000377E
#endif
	ldmgeia sp!, {r3, r4, r5, pc}
_0233AB98:
	ldr r0, _0233ADA0 ; =0xFFFFB17B
	cmp r5, r0
	beq _0233ABBC
	ldr r0, _0233ADA4 ; =0xFFFFA628
	cmp r5, r0
	bgt _0233ABC4
	ldr r0, _0233ADA8 ; =0xFFFFA241
	cmp r5, r0
	blt _0233ABC4
_0233ABBC:
	ldr r0, _0233ADAC ; =0x0000377F
	ldmia sp!, {r3, r4, r5, pc}
_0233ABC4:
	mov r0, #0xc800
	rsb r0, r0, #0
	cmp r5, r0
	bgt _0233ABE4
	sub r0, r0, #0x63
	cmp r5, r0
#ifdef NORTH_AMERICA
	movge r0, #0x3780
#else
	ldrge r0, _0233B4F8 ; =0x00003782
#endif
	ldmgeia sp!, {r3, r4, r5, pc}
_0233ABE4:
	ldr r0, _0233ADB0 ; =0xFFFEC5D2
	cmp r5, r0
	ldreq r0, _0233ADB4 ; =0x00003784
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0233ADB8 ; =0xFFFFA240
	cmp r5, r0
	bgt _0233AC0C
	ldr r0, _0233ADBC ; =0xFFFF9E59
	cmp r5, r0
	bge _0233AC78
_0233AC0C:
	ldr r0, _0233ADC0 ; =0xFFFF9E58
	cmp r5, r0
	bgt _0233AC24
	ldr r0, _0233ADC4 ; =0xFFFF9A71
	cmp r5, r0
	bge _0233AC78
_0233AC24:
	ldr r0, _0233ADC8 ; =0xFFFF86E8
	cmp r5, r0
	bgt _0233AC3C
	ldr r0, _0233ADCC ; =0xFFFF8301
	cmp r5, r0
	bge _0233AC78
_0233AC3C:
	ldr r0, _0233ADD0 ; =0xFFFF2D10
	cmp r5, r0
	bgt _0233AC54
	sub r0, r0, #0x63
	cmp r5, r0
	bge _0233AC78
_0233AC54:
	ldr r0, _0233ADD4 ; =0xFFFF15A0
	cmp r5, r0
	bgt _0233ACA8
	ldr r0, _0233ADD8 ; =0xFFFE7961
	cmp r5, r0
	blt _0233ACA8
	ldr r0, _0233ADB0 ; =0xFFFEC5D2
	cmp r5, r0
	beq _0233ACA8
_0233AC78:
	cmp r4, #0
	ldrne r0, _0233ADDC ; =0x00003781
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _0233ADC8 ; =0xFFFF86E8
	cmp r5, r0
	bgt _0233ACA0
	ldr r0, _0233ADCC ; =0xFFFF8301
	cmp r5, r0
	ldrge r0, _0233ADE0 ; =0x00003783
	ldmgeia sp!, {r3, r4, r5, pc}
_0233ACA0:
	ldr r0, _0233ADE4 ; =0x00003782
	ldmia sp!, {r3, r4, r5, pc}
_0233ACA8:
	ldr r0, _0233ADE8 ; =ov01_0233C088
	mov r1, r5
	bl Debug_Print0
	cmp r4, #0
	ldrne r0, _0233ADDC ; =0x00003781
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _0233ADC8 ; =0xFFFF86E8
	cmp r5, r0
	bgt _0233ACDC
	ldr r0, _0233ADCC ; =0xFFFF8301
	cmp r5, r0
	ldrge r0, _0233ADE0 ; =0x00003783
	ldmgeia sp!, {r3, r4, r5, pc}
_0233ACDC:
	ldr r0, _0233ADE4 ; =0x00003782
	ldmia sp!, {r3, r4, r5, pc}
_0233ACE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
#define OV01_0233A8B4_OFFSET 2
#elif defined(JAPAN)
#define OV01_0233A8B4_OFFSET -0x37E
#else
#define OV01_0233A8B4_OFFSET 0
#endif
_0233ACEC: .word 0x00003766 + OV01_0233A8B4_OFFSET
_0233ACF0: .word 0x00003767 + OV01_0233A8B4_OFFSET
_0233ACF4: .word 0x00003768 + OV01_0233A8B4_OFFSET
_0233ACF8: .word 0x00003769 + OV01_0233A8B4_OFFSET
_0233ACFC: .word 0x0000376A + OV01_0233A8B4_OFFSET
_0233AD00: .word 0x0000376B + OV01_0233A8B4_OFFSET
_0233AD04: .word 0x0000376C + OV01_0233A8B4_OFFSET
_0233AD08: .word 0x0000376D + OV01_0233A8B4_OFFSET
_0233AD0C: .word 0x0000376E + OV01_0233A8B4_OFFSET
_0233AD10: .word 0x0000376F + OV01_0233A8B4_OFFSET
_0233AD14: .word 0x00003770 + OV01_0233A8B4_OFFSET
_0233AD18: .word 0x00003771 + OV01_0233A8B4_OFFSET
_0233AD1C: .word 0x00003772 + OV01_0233A8B4_OFFSET
_0233AD20: .word 0x00003773 + OV01_0233A8B4_OFFSET
#ifdef JAPAN
_0233AD24: .word 0x000004CA
_0233C5A4: .word 0x000004C9
#else
_0233AD24: .word 0x00000239
#endif
_0233AD28: .word 0x00003774 + OV01_0233A8B4_OFFSET
_0233AD2C: .word 0x00003775 + OV01_0233A8B4_OFFSET
_0233AD30: .word 0x00003776 + OV01_0233A8B4_OFFSET
_0233AD34: .word 0x00003777 + OV01_0233A8B4_OFFSET
_0233AD38: .word 0xFFFFB1E0
_0233AD3C: .word 0xFFFFB17C
_0233AD40: .word 0xFFFFB173
_0233AD44: .word 0xFFFFADF9
_0233AD48: .word 0xFFFF34DC
_0233AD4C: .word 0xFFFF3478
_0233AD50: .word 0xFFFF3414
_0233AD54: .word 0xFFFF33B4
_0233AD58: .word 0xFFFF30F8
_0233AD5C: .word 0xFFFF2FCD
_0233AD60: .word 0x00003778 + OV01_0233A8B4_OFFSET
_0233AD64: .word 0xFFFFB174
_0233AD68: .word 0x00003779 + OV01_0233A8B4_OFFSET
_0233AD6C: .word 0x0000377A + OV01_0233A8B4_OFFSET
_0233AD70: .word 0xFFFF38C8
_0233AD74: .word 0xFFFF3860
_0233AD78: .word 0xFFFF379C
_0233AD7C: .word 0x0000377B + OV01_0233A8B4_OFFSET
_0233AD80: .word 0xFFFF34E0
_0233AD84: .word 0xFFFF347C
_0233AD88: .word 0xFFFF3418
_0233AD8C: .word 0x0000377C + OV01_0233A8B4_OFFSET
_0233AD90: .word 0xFFFF3861
_0233AD94: .word 0x0000377D + OV01_0233A8B4_OFFSET
_0233AD98: .word 0xFFFF3CB0
#if defined(NORTH_AMERICA)
_0233AD9C: .word 0x0000377E
#endif
_0233ADA0: .word 0xFFFFB17B
_0233ADA4: .word 0xFFFFA628
_0233ADA8: .word 0xFFFFA241
_0233ADAC: .word 0x0000377F + OV01_0233A8B4_OFFSET
#if defined(EUROPE)
_0233B4F8: .word 0x00003782
#elif defined(JAPAN)
_0233B4F8: .word 0x00003402
#endif
_0233ADB0: .word 0xFFFEC5D2
_0233ADB4: .word 0x00003784 + OV01_0233A8B4_OFFSET
_0233ADB8: .word 0xFFFFA240
_0233ADBC: .word 0xFFFF9E59
_0233ADC0: .word 0xFFFF9E58
_0233ADC4: .word 0xFFFF9A71
_0233ADC8: .word 0xFFFF86E8
_0233ADCC: .word 0xFFFF8301
_0233ADD0: .word 0xFFFF2D10
_0233ADD4: .word 0xFFFF15A0
_0233ADD8: .word 0xFFFE7961
_0233ADDC: .word 0x00003781 + OV01_0233A8B4_OFFSET
_0233ADE0: .word 0x00003783 + OV01_0233A8B4_OFFSET
_0233ADE4: .word 0x00003782 + OV01_0233A8B4_OFFSET
_0233ADE8: .word ov01_0233C088
	arm_func_end ov01_0233A8B4

	arm_func_start ov01_0233ADEC
ov01_0233ADEC: ; 0x0233ADEC
	ldr r0, _0233AE00 ; =ov01_0233CA7C
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bx lr
	.align 2, 0
_0233AE00: .word ov01_0233CA7C
	arm_func_end ov01_0233ADEC

	arm_func_start ov01_0233AE04
ov01_0233AE04: ; 0x0233AE04
	stmdb sp!, {r3, lr}
	ldr r0, _0233AE60 ; =ov01_0233CA7C
	ldr r0, [r0]
	cmp r0, #0
	beq _0233AE24
	cmp r0, #1
	beq _0233AE38
	b _0233AE58
_0233AE24:
	bl ov01_02339888
	ldr r0, _0233AE60 ; =ov01_0233CA7C
	mov r1, #1
	str r1, [r0]
	b _0233AE58
_0233AE38:
	bl ov01_023398A4
	cmp r0, #0
	beq _0233AE58
	bl sub_02046D20
	mov r0, #0x17
	bl ov00_022BE4A8
	mov r0, #4
	ldmia sp!, {r3, pc}
_0233AE58:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233AE60: .word ov01_0233CA7C
	arm_func_end ov01_0233AE04

	arm_func_start ov01_0233AE64
ov01_0233AE64: ; 0x0233AE64
	ldr ip, _0233AE70 ; =InitMenu
	ldr r0, _0233AE74 ; =ov01_0233C0A4
	bx ip
	.align 2, 0
_0233AE70: .word InitMenu
_0233AE74: .word ov01_0233C0A4
	arm_func_end ov01_0233AE64
	; 0x0233AE78

	.rodata
	.global ov01_0233AE78
ov01_0233AE78:
	.byte 0x44, 0x41, 0x54, 0x41, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0x41, 0x54, 0x41, 0x30, 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0x41, 0x54, 0x41, 0x30, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0x41, 0x54, 0x41, 0x30, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AEF8
ov01_0233AEF8:
	.byte 0x72, 0x6F, 0x6D, 0x30, 0x3A, 0x46, 0x4F, 0x4E, 0x54, 0x2F, 0x77, 0x5F, 0x69, 0x63, 0x6F, 0x6E
	.byte 0x2E, 0x77, 0x61, 0x6E, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AF10
ov01_0233AF10:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AF14
ov01_0233AF14:
	.byte 0x63, 0x68, 0x65, 0x63
	.byte 0x6B, 0x20, 0x69, 0x64, 0x20, 0x3A, 0x20, 0x75, 0x6E, 0x69, 0x71, 0x75, 0x65, 0x20, 0x30, 0x78
	.byte 0x25, 0x30, 0x38, 0x78, 0x20, 0x3A, 0x20, 0x6D, 0x61, 0x63, 0x20, 0x30, 0x78, 0x25, 0x30, 0x38
	.byte 0x78, 0x0A, 0x00, 0x00
	.global ov01_0233AF3C
ov01_0233AF3C:
	.byte 0x61, 0x64, 0x64, 0x20, 0x69, 0x64, 0x20, 0x3A, 0x20, 0x75, 0x6E, 0x69
	.byte 0x71, 0x75, 0x65, 0x20, 0x30, 0x78, 0x25, 0x30, 0x38, 0x78, 0x20, 0x3A, 0x20, 0x6D, 0x61, 0x63
	.byte 0x20, 0x30, 0x78, 0x25, 0x30, 0x38, 0x78, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AF64
ov01_0233AF64:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AF88
ov01_0233AF88:
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov01_0232EDC0
	.word ov01_0232EDEC
	.word ov01_0232EE34
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov01_0232EE58
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov01_0232EF28
	.word ov01_0232EF4C
	.global ov01_0233AFAC
ov01_0233AFAC:
	.byte 0x0D, 0x00, 0x00, 0x00
	.word ov01_0232EFE8
	.word ov01_0232F038
	.word ov01_0232F0C0
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov01_0232F0E0
	.word ov01_0232F28C
	.word ov01_0232F338
	.word ov01_0232F384
	.global ov01_0233AFD0
ov01_0233AFD0:
	.word ov01_0233AFD8
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AFD8
ov01_0233AFD8:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x65, 0x78, 0x70, 0x62, 0x61, 0x63, 0x6B, 0x2E, 0x62, 0x67, 0x70
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AFEC
ov01_0233AFEC:
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x0D, 0x12, 0x04, 0x01, 0xFA, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233AFFC
ov01_0233AFFC:
	.byte 0x0D, 0x00, 0x00, 0x00
	.word ov01_0232F41C
	.word ov01_0232F478
	.word ov01_0232F538
	.word ov01_0232F558
	.word ov01_0232F55C
	.word ov01_0232F73C
	.word ov01_0232F7BC
	.word ov01_0232F7EC
	.global ov01_0233B020
ov01_0233B020:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x73, 0x30, 0x37
	.byte 0x70, 0x30, 0x32, 0x61, 0x2E, 0x62, 0x67, 0x70, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B034
ov01_0233B034:
	.byte 0x0D, 0x00, 0x00, 0x00
	.word ov01_0232F924
	.word ov01_0232F980
	.word ov01_0232FA30
	.word ov01_0232FA50
	.word ov01_0232FA54
	.word ov01_0232FC28
	.word ov01_0232FD00
	.word ov01_0232FD30
	.global ov01_0233B058
ov01_0233B058:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x65, 0x78, 0x70, 0x62, 0x61, 0x63, 0x6B, 0x2E, 0x62, 0x67, 0x70
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B06C
ov01_0233B06C:
	.byte 0x0D, 0x00, 0x00, 0x00
	.word ov01_0232FDC0
	.word ov01_0232FE1C
	.word ov01_0232FECC
	.word ov01_0232FEEC
	.word ov01_0232FEF0
	.word ov01_023300C4
	.word ov01_0233019C
	.word ov01_023301CC
	.global ov01_0233B090
ov01_0233B090:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x65, 0x78, 0x70
	.byte 0x62, 0x61, 0x63, 0x6B, 0x2E, 0x62, 0x67, 0x70, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B0A4
ov01_0233B0A4:
	.byte 0x47, 0x52, 0x4F, 0x55
	.byte 0x4E, 0x44, 0x2F, 0x73, 0x31, 0x38, 0x70, 0x30, 0x31, 0x61, 0x34, 0x2E, 0x77, 0x61, 0x6E, 0x00
	.global ov01_0233B0B8
ov01_0233B0B8:
	.byte 0x47, 0x52, 0x4F, 0x55, 0x4E, 0x44, 0x2F, 0x73, 0x31, 0x38, 0x70, 0x30, 0x31, 0x61, 0x32, 0x2E
	.byte 0x77, 0x61, 0x6E, 0x00
	.global ov01_0233B0CC
ov01_0233B0CC:
	.byte 0x47, 0x52, 0x4F, 0x55, 0x4E, 0x44, 0x2F, 0x73, 0x31, 0x38, 0x70, 0x30
	.byte 0x31, 0x61, 0x33, 0x2E, 0x77, 0x61, 0x6E, 0x00
	.global ov01_0233B0E0
ov01_0233B0E0:
	.byte 0x0D, 0x00, 0x00, 0x00
	.word ov01_02330224
	.word ov01_02330594
	.word ov01_023306DC
	.word ov01_023306FC
	.word ov01_02330700
	.word ov01_023309F4
	.word ov01_02330ACC
	.word ov01_02330D58
	.global ov01_0233B104
ov01_0233B104:
	.byte 0x47, 0x52, 0x4F, 0x55
	.byte 0x4E, 0x44, 0x2F, 0x73, 0x31, 0x38, 0x70, 0x30, 0x31, 0x61, 0x31, 0x2E, 0x77, 0x61, 0x6E, 0x00
	.global ov01_0233B118
ov01_0233B118:
	.byte 0x42, 0x41, 0x43, 0x4B, 0x2F, 0x73, 0x31, 0x38, 0x70, 0x30, 0x31, 0x61, 0x2E, 0x62, 0x67, 0x70
	.byte 0x00, 0x00, 0x00, 0x00
	.global PRINTS_STRINGS
PRINTS_STRINGS:
	.byte 0x61, 0x73, 0x31, 0x30, 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B134
ov01_0233B134:
	.byte 0x61, 0x73, 0x30, 0x39
	.byte 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B13C
ov01_0233B13C:
	.byte 0x61, 0x73, 0x31, 0x30, 0x35, 0x00, 0x00, 0x00
	.global ov01_0233B144
ov01_0233B144:
	.byte 0x61, 0x73, 0x31, 0x30
	.byte 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B14C
ov01_0233B14C:
	.byte 0x61, 0x73, 0x31, 0x30, 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B154
ov01_0233B154:
	.byte 0x61, 0x73, 0x31, 0x30
	.byte 0x32, 0x00, 0x00, 0x00
	.global ov01_0233B15C
ov01_0233B15C:
	.byte 0x61, 0x73, 0x30, 0x39, 0x38, 0x00, 0x00, 0x00
	.global ov01_0233B164
ov01_0233B164:
	.byte 0x61, 0x73, 0x30, 0x37
	.byte 0x32, 0x00, 0x00, 0x00
	.global ov01_0233B16C
ov01_0233B16C:
	.byte 0x61, 0x73, 0x30, 0x39, 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B174
ov01_0233B174:
	.byte 0x61, 0x73, 0x30, 0x39
	.byte 0x35, 0x00, 0x00, 0x00
	.global ov01_0233B17C
ov01_0233B17C:
	.byte 0x61, 0x73, 0x30, 0x39, 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B184
ov01_0233B184:
	.byte 0x61, 0x73, 0x30, 0x38
	.byte 0x32, 0x00, 0x00, 0x00
	.global ov01_0233B18C
ov01_0233B18C:
	.byte 0x61, 0x73, 0x30, 0x35, 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B194
ov01_0233B194:
	.byte 0x61, 0x73, 0x30, 0x38
	.byte 0x31, 0x00, 0x00, 0x00
	.global ov01_0233B19C
ov01_0233B19C:
	.byte 0x61, 0x73, 0x30, 0x37, 0x39, 0x00, 0x00, 0x00
	.global ov01_0233B1A4
ov01_0233B1A4:
	.byte 0x61, 0x73, 0x30, 0x37
	.byte 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B1AC
ov01_0233B1AC:
	.byte 0x61, 0x73, 0x30, 0x37, 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B1B4
ov01_0233B1B4:
	.byte 0x61, 0x73, 0x30, 0x37
	.byte 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B1BC
ov01_0233B1BC:
	.byte 0x61, 0x73, 0x30, 0x37, 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B1C4
ov01_0233B1C4:
	.byte 0x61, 0x73, 0x30, 0x33
	.byte 0x31, 0x00, 0x00, 0x00
	.global ov01_0233B1CC
ov01_0233B1CC:
	.byte 0x61, 0x73, 0x30, 0x37, 0x31, 0x00, 0x00, 0x00
	.global ov01_0233B1D4
ov01_0233B1D4:
	.byte 0x61, 0x73, 0x30, 0x36
	.byte 0x38, 0x00, 0x00, 0x00
	.global ov01_0233B1DC
ov01_0233B1DC:
	.byte 0x61, 0x73, 0x30, 0x36, 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B1E4
ov01_0233B1E4:
	.byte 0x61, 0x73, 0x30, 0x36
	.byte 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B1EC
ov01_0233B1EC:
	.byte 0x61, 0x73, 0x30, 0x36, 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B1F4
ov01_0233B1F4:
	.byte 0x61, 0x73, 0x30, 0x36
	.byte 0x30, 0x00, 0x00, 0x00
	.global ov01_0233B1FC
ov01_0233B1FC:
	.byte 0x61, 0x73, 0x30, 0x35, 0x39, 0x00, 0x00, 0x00
	.global ov01_0233B204
ov01_0233B204:
	.byte 0x61, 0x73, 0x30, 0x30
	.byte 0x31, 0x00, 0x00, 0x00
	.global ov01_0233B20C
ov01_0233B20C:
	.byte 0x61, 0x73, 0x30, 0x35, 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B214
ov01_0233B214:
	.byte 0x61, 0x73, 0x30, 0x35
	.byte 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B21C
ov01_0233B21C:
	.byte 0x61, 0x73, 0x30, 0x35, 0x32, 0x00, 0x00, 0x00
	.global ov01_0233B224
ov01_0233B224:
	.byte 0x61, 0x73, 0x30, 0x35
	.byte 0x31, 0x00, 0x00, 0x00
	.global ov01_0233B22C
ov01_0233B22C:
	.byte 0x61, 0x73, 0x30, 0x35, 0x30, 0x00, 0x00, 0x00
	.global ov01_0233B234
ov01_0233B234:
	.byte 0x61, 0x73, 0x30, 0x34
	.byte 0x39, 0x00, 0x00, 0x00
	.global ov01_0233B23C
ov01_0233B23C:
	.byte 0x61, 0x73, 0x30, 0x34, 0x38, 0x00, 0x00, 0x00
	.global ov01_0233B244
ov01_0233B244:
	.byte 0x61, 0x73, 0x30, 0x34
	.byte 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B24C
ov01_0233B24C:
	.byte 0x61, 0x73, 0x30, 0x34, 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B254
ov01_0233B254:
	.byte 0x61, 0x73, 0x30, 0x34
	.byte 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B25C
ov01_0233B25C:
	.byte 0x61, 0x73, 0x30, 0x34, 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B264
ov01_0233B264:
	.byte 0x61, 0x73, 0x30, 0x34
	.byte 0x31, 0x00, 0x00, 0x00
	.global ov01_0233B26C
ov01_0233B26C:
	.byte 0x61, 0x73, 0x30, 0x33, 0x38, 0x00, 0x00, 0x00
	.global ov01_0233B274
ov01_0233B274:
	.byte 0x61, 0x73, 0x30, 0x33
	.byte 0x35, 0x00, 0x00, 0x00
	.global ov01_0233B27C
ov01_0233B27C:
	.byte 0x61, 0x73, 0x30, 0x33, 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B284
ov01_0233B284:
	.byte 0x61, 0x73, 0x30, 0x38
	.byte 0x38, 0x00, 0x00, 0x00
	.global ov01_0233B28C
ov01_0233B28C:
	.byte 0x61, 0x73, 0x30, 0x32, 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B294
ov01_0233B294:
	.byte 0x61, 0x73, 0x30, 0x32
	.byte 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B29C
ov01_0233B29C:
	.byte 0x61, 0x73, 0x30, 0x32, 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B2A4
ov01_0233B2A4:
	.byte 0x61, 0x73, 0x30, 0x31
	.byte 0x39, 0x00, 0x00, 0x00
	.global ov01_0233B2AC
ov01_0233B2AC:
	.byte 0x61, 0x73, 0x30, 0x31, 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B2B4
ov01_0233B2B4:
	.byte 0x61, 0x73, 0x30, 0x31
	.byte 0x35, 0x00, 0x00, 0x00
	.global ov01_0233B2BC
ov01_0233B2BC:
	.byte 0x61, 0x73, 0x30, 0x31, 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B2C4
ov01_0233B2C4:
	.byte 0x61, 0x73, 0x30, 0x31
	.byte 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B2CC
ov01_0233B2CC:
	.byte 0x61, 0x73, 0x30, 0x31, 0x32, 0x00, 0x00, 0x00
	.global ov01_0233B2D4
ov01_0233B2D4:
	.byte 0x61, 0x73, 0x30, 0x30
	.byte 0x38, 0x00, 0x00, 0x00
	.global ov01_0233B2DC
ov01_0233B2DC:
	.byte 0x61, 0x73, 0x30, 0x30, 0x37, 0x00, 0x00, 0x00
	.global ov01_0233B2E4
ov01_0233B2E4:
	.byte 0x61, 0x73, 0x30, 0x30
	.byte 0x36, 0x00, 0x00, 0x00
	.global ov01_0233B2EC
ov01_0233B2EC:
	.byte 0x61, 0x73, 0x30, 0x30, 0x35, 0x00, 0x00, 0x00
	.global ov01_0233B2F4
ov01_0233B2F4:
	.byte 0x61, 0x73, 0x30, 0x30
	.byte 0x33, 0x00, 0x00, 0x00
	.global ov01_0233B2FC
ov01_0233B2FC:
	.byte 0x61, 0x73, 0x30, 0x30, 0x32, 0x00, 0x00, 0x00
	.global ov01_0233B304
ov01_0233B304:
	.byte 0x61, 0x73, 0x31, 0x30
	.byte 0x34, 0x00, 0x00, 0x00
	.global ov01_0233B30C
ov01_0233B30C:
	.byte 0x61, 0x73, 0x31, 0x30, 0x38, 0x00, 0x00, 0x00
	.global PRINTS_STRUCT
PRINTS_STRUCT:
	.byte 0x1B, 0x01, 0x00, 0x00
	.global ov01_0233B318
ov01_0233B318:
	.word ov01_0233B204
	.byte 0x9F, 0x00, 0x00, 0x00
	.word ov01_0233B2FC
	.byte 0x85, 0x00, 0x00, 0x00
	.word ov01_0233B2F4
	.byte 0x48, 0x01, 0x00, 0x00
	.word ov01_0233B2EC
	.byte 0x49, 0x01, 0x00, 0x00
	.word ov01_0233B2E4
	.byte 0xAE, 0x01, 0x00, 0x00
	.word ov01_0233B2DC
	.byte 0xA0, 0x00, 0x00, 0x00
	.word ov01_0233B2D4
	.byte 0x8F, 0x00, 0x00, 0x00
	.word ov01_0233B2CC
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov01_0233B2C4
	.byte 0x09, 0x00, 0x00, 0x00
	.word ov01_0233B2BC
	.byte 0x18, 0x01, 0x00, 0x00
	.word ov01_0233B2B4
	.byte 0xAB, 0x01, 0x00, 0x00
	.word ov01_0233B2AC
	.byte 0xE8, 0x01, 0x00, 0x00
	.word ov01_0233B2A4
	.byte 0x1A, 0x01, 0x00, 0x00
	.word ov01_0233B29C
	.byte 0x19, 0x01, 0x00, 0x00
	.word ov01_0233B294
	.byte 0x07, 0x00, 0x00, 0x00
	.word ov01_0233B28C
	.byte 0x98, 0x00, 0x00, 0x00
	.word ov01_0233B1C4
	.byte 0xA8, 0x01, 0x00, 0x00
	.word ov01_0233B27C
	.byte 0xA6, 0x01, 0x00, 0x00
	.word ov01_0233B274
	.byte 0x34, 0x00, 0x00, 0x00
	.word ov01_0233B26C
	.byte 0x1F, 0x01, 0x00, 0x00
	.word ov01_0233B264
	.byte 0x9D, 0x00, 0x00, 0x00
	.word ov01_0233B25C
	.byte 0x1D, 0x01, 0x00, 0x00
	.word ov01_0233B254
	.byte 0xA7, 0x01, 0x00, 0x00
	.word ov01_0233B24C
	.byte 0x19, 0x00, 0x00, 0x00
	.word ov01_0233B244
	.byte 0xA9, 0x01, 0x00, 0x00
	.word ov01_0233B23C
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov01_0233B234
	.byte 0x9B, 0x00, 0x00, 0x00
	.word ov01_0233B22C
	.byte 0x02, 0x00, 0x00, 0x00
	.word ov01_0233B224
	.byte 0x01, 0x00, 0x00, 0x00
	.word ov01_0233B21C
	.byte 0x03, 0x00, 0x00, 0x00
	.word ov01_0233B214
	.byte 0x99, 0x00, 0x00, 0x00
	.word ov01_0233B18C
	.byte 0x35, 0x00, 0x00, 0x00
	.word ov01_0233B20C
	.byte 0xAD, 0x01, 0x00, 0x00
	.word ov01_0233B1FC
	.byte 0xAC, 0x01, 0x00, 0x00
	.word ov01_0233B1F4
	.byte 0x9C, 0x00, 0x00, 0x00
	.word ov01_0233B1EC
	.byte 0x1E, 0x01, 0x00, 0x00
	.word ov01_0233B1E4
	.byte 0x9A, 0x00, 0x00, 0x00
	.word ov01_0233B1DC
	.byte 0xAA, 0x01, 0x00, 0x00
	.word ov01_0233B1D4
	.byte 0x1A, 0x00, 0x00, 0x00
	.word ov01_0233B1CC
	.byte 0x20, 0x01, 0x00, 0x00
	.word ov01_0233B164
	.byte 0x05, 0x00, 0x00, 0x00
	.word ov01_0233B1BC
	.byte 0x06, 0x00, 0x00, 0x00
	.word ov01_0233B1B4
	.byte 0x1C, 0x01, 0x00, 0x00
	.word ov01_0233B1AC
	.byte 0x9E, 0x00, 0x00, 0x00
	.word ov01_0233B1A4
	.byte 0x26, 0x00, 0x00, 0x00
	.word ov01_0233B19C
	.byte 0x02, 0x01, 0x00, 0x00
	.word ov01_0233B194
	.byte 0xB6, 0x01, 0x00, 0x00
	.word ov01_0233B184
	.byte 0x03, 0x01, 0x00, 0x00
	.word ov01_0233B284
	.byte 0xE9, 0x01, 0x00, 0x00
	.word ov01_0233B17C
	.byte 0xEA, 0x01, 0x00, 0x00
	.word ov01_0233B174
	.byte 0xB7, 0x01, 0x00, 0x00
	.word ov01_0233B16C
	.byte 0xB8, 0x01, 0x00, 0x00
	.word ov01_0233B134
	.byte 0x25, 0x00, 0x00, 0x00
	.word ov01_0233B15C
	.byte 0x86, 0x00, 0x00, 0x00
	.word ov01_0233B154
	.byte 0x87, 0x00, 0x00, 0x00
	.word ov01_0233B14C
	.byte 0x88, 0x00, 0x00, 0x00
	.word ov01_0233B304
	.byte 0xC4, 0x00, 0x00, 0x00
	.word ov01_0233B13C
	.byte 0xC5, 0x00, 0x00, 0x00
	.word PRINTS_STRINGS
	.byte 0x00, 0x02, 0x00, 0x00
	.word ov01_0233B144
	.byte 0x01, 0x02, 0x00, 0x00
	.word ov01_0233B30C
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov01_0233B204
	.global ov01_0233B504
ov01_0233B504:
	.byte 0x72, 0x6F, 0x6D, 0x30
	.byte 0x3A, 0x47, 0x52, 0x4F, 0x55, 0x4E, 0x44, 0x2F, 0x25, 0x73, 0x2E, 0x77, 0x61, 0x6E, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_1
MAIN_MENU_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_2
MAIN_MENU_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_3
MAIN_MENU_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x12, 0x1C, 0x04, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_4
MAIN_MENU_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B558
ov01_0233B558:
	.byte 0x04, 0x00, 0x00, 0x00
	.word CreateMainMenus
	.word ov01_023316CC
	.word ov01_02331784
	.global CONTINUE_CHOICE
CONTINUE_CHOICE:
#ifdef JAPAN
	.byte 0x08, 0x04, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x09, 0x04, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x0E, 0x04, 0x00, 0x00
#else
	.byte 0xE0, 0x01, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xE1, 0x01, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0xE6, 0x01, 0x00, 0x00
#endif
	.byte 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.global SUBMENU
SUBMENU:
	.byte 0x02, 0x00, 0x00, 0x00
#ifdef JAPAN
	.byte 0xDD, 0x03, 0xDE, 0x03, 0x14, 0x00, 0x00, 0x00, 0xFD, 0x03, 0xFE, 0x03
	.byte 0x08, 0x00, 0x00, 0x00, 0xE7, 0x03, 0xE8, 0x03, 0x09, 0x00, 0x00, 0x00, 0xE9, 0x03, 0xEA, 0x03
	.byte 0x18, 0x00, 0x00, 0x00, 0x03, 0x04, 0x04, 0x04, 0x07, 0x00, 0x00, 0x00, 0xE5, 0x03, 0xE6, 0x03
	.byte 0x10, 0x00, 0x00, 0x00, 0xF5, 0x03, 0xF6, 0x03, 0x21, 0x00, 0x00, 0x00, 0x05, 0x04, 0x06, 0x04
#else
	.byte 0xB5, 0x01, 0xB6, 0x01, 0x14, 0x00, 0x00, 0x00, 0xD5, 0x01, 0xD6, 0x01
	.byte 0x08, 0x00, 0x00, 0x00, 0xBF, 0x01, 0xC0, 0x01, 0x09, 0x00, 0x00, 0x00, 0xC1, 0x01, 0xC2, 0x01
	.byte 0x18, 0x00, 0x00, 0x00, 0xDB, 0x01, 0xDC, 0x01, 0x07, 0x00, 0x00, 0x00, 0xBD, 0x01, 0xBE, 0x01
	.byte 0x10, 0x00, 0x00, 0x00, 0xCD, 0x01, 0xCE, 0x01, 0x21, 0x00, 0x00, 0x00, 0xDD, 0x01, 0xDE, 0x01
#endif
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU
MAIN_MENU:
	.byte 0x02, 0x00, 0x00, 0x00
#ifdef JAPAN
	.byte 0xDD, 0x03, 0xDE, 0x03
	.byte 0x07, 0x00, 0x00, 0x00, 0xE5, 0x03, 0xE6, 0x03, 0x03, 0x00, 0x00, 0x00, 0xDF, 0x03, 0xE0, 0x03
	.byte 0x1A, 0x00, 0x00, 0x00, 0xE1, 0x03, 0xE2, 0x03, 0x1B, 0x00, 0x00, 0x00, 0xE1, 0x03, 0xE2, 0x03
	.byte 0x0A, 0x00, 0x00, 0x00, 0xEB, 0x03, 0xEC, 0x03, 0x0B, 0x00, 0x00, 0x00, 0xED, 0x03, 0xEE, 0x03
	.byte 0x0C, 0x00, 0x00, 0x00, 0xEF, 0x03, 0xF0, 0x03, 0x0D, 0x00, 0x00, 0x00, 0xE3, 0x03, 0xE4, 0x03
	.byte 0x0E, 0x00, 0x00, 0x00, 0xF1, 0x03, 0xF2, 0x03, 0x0F, 0x00, 0x00, 0x00, 0xF3, 0x03, 0xF4, 0x03
	.byte 0x11, 0x00, 0x00, 0x00, 0xF7, 0x03, 0xF8, 0x03, 0x12, 0x00, 0x00, 0x00, 0xF9, 0x03, 0xFA, 0x03
	.byte 0x13, 0x00, 0x00, 0x00, 0xFB, 0x03, 0xFC, 0x03, 0x19, 0x00, 0x00, 0x00, 0xDB, 0x03, 0xDC, 0x03
	.byte 0x1C, 0x00, 0x00, 0x00, 0x0A, 0x04, 0x0C, 0x04, 0x1D, 0x00, 0x00, 0x00, 0x0B, 0x04, 0x0C, 0x04
	.byte 0x1E, 0x00, 0x00, 0x00, 0x0A, 0x04, 0x0D, 0x04, 0x1F, 0x00, 0x00, 0x00, 0x0B, 0x04, 0x0D, 0x04
#else
	.byte 0xB5, 0x01, 0xB6, 0x01
	.byte 0x07, 0x00, 0x00, 0x00, 0xBD, 0x01, 0xBE, 0x01, 0x03, 0x00, 0x00, 0x00, 0xB7, 0x01, 0xB8, 0x01
	.byte 0x1A, 0x00, 0x00, 0x00, 0xB9, 0x01, 0xBA, 0x01, 0x1B, 0x00, 0x00, 0x00, 0xB9, 0x01, 0xBA, 0x01
	.byte 0x0A, 0x00, 0x00, 0x00, 0xC3, 0x01, 0xC4, 0x01, 0x0B, 0x00, 0x00, 0x00, 0xC5, 0x01, 0xC6, 0x01
	.byte 0x0C, 0x00, 0x00, 0x00, 0xC7, 0x01, 0xC8, 0x01, 0x0D, 0x00, 0x00, 0x00, 0xBB, 0x01, 0xBC, 0x01
	.byte 0x0E, 0x00, 0x00, 0x00, 0xC9, 0x01, 0xCA, 0x01, 0x0F, 0x00, 0x00, 0x00, 0xCB, 0x01, 0xCC, 0x01
	.byte 0x11, 0x00, 0x00, 0x00, 0xCF, 0x01, 0xD0, 0x01, 0x12, 0x00, 0x00, 0x00, 0xD1, 0x01, 0xD2, 0x01
	.byte 0x13, 0x00, 0x00, 0x00, 0xD3, 0x01, 0xD4, 0x01, 0x19, 0x00, 0x00, 0x00, 0xB3, 0x01, 0xB4, 0x01
	.byte 0x1C, 0x00, 0x00, 0x00, 0xE2, 0x01, 0xE4, 0x01, 0x1D, 0x00, 0x00, 0x00, 0xE3, 0x01, 0xE4, 0x01
	.byte 0x1E, 0x00, 0x00, 0x00, 0xE2, 0x01, 0xE5, 0x01, 0x1F, 0x00, 0x00, 0x00, 0xE3, 0x01, 0xE5, 0x01
#endif
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B670
ov01_0233B670:
	.byte 0x5B, 0x53, 0x3A, 0x31, 0x33, 0x5D, 0x00, 0x00
	.global ov01_0233B678
ov01_0233B678:
	.byte 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x30, 0x5D, 0x5B, 0x43, 0x4C, 0x55, 0x4D, 0x5F
	.byte 0x53, 0x45, 0x54, 0x3A, 0x32, 0x36, 0x5D, 0x5B, 0x43, 0x53, 0x3A, 0x44, 0x5D, 0x5B, 0x73, 0x74
	.byte 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x31, 0x5D, 0x5B, 0x43, 0x52, 0x5D, 0x00
	.global ov01_0233B6A4
ov01_0233B6A4:
	.byte 0x5B, 0x4D, 0x3A, 0x53
#ifdef JAPAN
	.byte 0x33, 0x5D, 0x00, 0x00
#else
	.byte 0x33, 0x5D, 0x5B, 0x53, 0x3A, 0x35, 0x5D, 0x00
#endif
	.global ov01_0233B6B0
ov01_0233B6B0:
	.byte 0x5B, 0x4D, 0x3A, 0x52
#ifdef JAPAN
	.byte 0x37, 0x5D, 0x00, 0x00
#else
	.byte 0x37, 0x5D, 0x5B, 0x53
	.byte 0x3A, 0x35, 0x5D, 0x00
#endif
	.global ov01_0233B6BC
ov01_0233B6BC:
	.byte 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x30, 0x5D, 0x5B, 0x43
	.byte 0x4C, 0x55, 0x4D, 0x5F, 0x53, 0x45, 0x54, 0x3A, 0x32, 0x36, 0x5D, 0x5B, 0x43, 0x53, 0x3A, 0x45
	.byte 0x5D, 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x31, 0x5D, 0x5B, 0x43, 0x52, 0x5D, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.global ov01_0233B700
ov01_0233B700:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global ov01_0233B70C
ov01_0233B70C:
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov01_023329F8
	.word ov01_02332ACC
	.global MAIN_MENU_WINDOW_PARAMS_5
MAIN_MENU_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x0E, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_6
MAIN_MENU_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x12, 0x14, 0x04, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_7
MAIN_MENU_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00, 0x18, 0x12, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_ITEMS_CONFIRM
MAIN_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
	.byte 0x21, 0x24, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x22, 0x24, 0x00, 0x00
#else
	.byte 0xF7, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xF8, 0x01, 0x00, 0x00
#endif
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global CLEAR_MARK_PERFORMANCE_PROGRESS_FLAGS
CLEAR_MARK_PERFORMANCE_PROGRESS_FLAGS:
	.byte 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.global ov01_0233B798
ov01_0233B798:
	.byte 0x63, 0x6F, 0x6E, 0x74, 0x69, 0x6E, 0x75, 0x65, 0x20, 0x69, 0x6E, 0x66, 0x6F, 0x20, 0x25, 0x64
	.byte 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B7BC
ov01_0233B7BC:
	.byte 0x5B, 0x42, 0x41, 0x52, 0x5D, 0x00, 0x00, 0x00
	.global ov01_0233B7C4
ov01_0233B7C4:
	.byte 0x5B, 0x74, 0x69, 0x6D
	.byte 0x65, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_8
MAIN_MENU_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B7E0
ov01_0233B7E0:
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov01_023336A0
	.word ov01_02333768
	.word ov01_02333794
	.global MAIN_MENU_WINDOW_PARAMS_9
MAIN_MENU_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B800
ov01_0233B800:
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov01_02333994
	.word ov01_023339F8
	.word ov01_02333A34
	.global MAIN_DEBUG_MENU_ITEMS_1
MAIN_DEBUG_MENU_ITEMS_1:
#ifdef JAPAN
#define MAIN_DEBUG_MENU_1_OFFSET 0x228
#else
#define MAIN_DEBUG_MENU_1_OFFSET 0
#endif
	.word 0x1EB + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x1EC + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x1EE + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x1EF + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x1F0 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x1F1 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x1F2 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0x1F3 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x1F4 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x1F5 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00
	.word 0x1F6 + MAIN_DEBUG_MENU_1_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.global MAIN_MENU_WINDOW_PARAMS_10
MAIN_MENU_WINDOW_PARAMS_10:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B880
ov01_0233B880:
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov01_02333C20
	.word ov01_02333C7C
	.word ov01_02333CB8
	.global MAIN_DEBUG_MENU_ITEMS_2
MAIN_DEBUG_MENU_ITEMS_2:
#if defined(EUROPE)
#define MAIN_DEBUG_MENU_2_OFFSET 2
#elif defined(JAPAN)
#define MAIN_DEBUG_MENU_2_OFFSET -0x379B
#else
#define MAIN_DEBUG_MENU_2_OFFSET 0
#endif
	.word 0x3C86 + MAIN_DEBUG_MENU_2_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3C87 + MAIN_DEBUG_MENU_2_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x3C88 + MAIN_DEBUG_MENU_2_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x3C89 + MAIN_DEBUG_MENU_2_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3C84 + MAIN_DEBUG_MENU_2_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3C85 + MAIN_DEBUG_MENU_2_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.global ov01_0233B8C8
ov01_0233B8C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x0C, 0x1C, 0x07, 0x01, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B8D8
ov01_0233B8D8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x14, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B8E8
ov01_0233B8E8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x08, 0x01, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233B8F8
ov01_0233B8F8:
#ifdef JAPAN
	.byte 0xDC, 0x3B, 0xDD, 0x3B, 0xDE, 0x3B, 0xDF, 0x3B
	.byte 0xE0, 0x3B, 0xE1, 0x3B, 0xE2, 0x3B, 0xE3, 0x3B, 0xE4, 0x3B, 0xE5, 0x3B, 0xE6, 0x3B, 0xE7, 0x3B
	.byte 0xE8, 0x3B, 0xE9, 0x3B, 0xEA, 0x3B, 0xEB, 0x3B, 0xEC, 0x3B, 0xED, 0x3B, 0xEE, 0x3B, 0xEF, 0x3B
	.byte 0xF0, 0x3B, 0xF1, 0x3B, 0xF2, 0x3B, 0xF3, 0x3B, 0xF4, 0x3B, 0xF5, 0x3B, 0xF6, 0x3B, 0xF7, 0x3B
	.byte 0xF8, 0x3B, 0xF9, 0x3B, 0xFA, 0x3B, 0xFB, 0x3B, 0xFC, 0x3B, 0xFD, 0x3B, 0xFE, 0x3B, 0xFF, 0x3B
	.byte 0x00, 0x3C, 0x01, 0x3C, 0x02, 0x3C, 0x03, 0x3C, 0x04, 0x3C, 0x05, 0x3C, 0x06, 0x3C, 0x07, 0x3C
	.byte 0x08, 0x3C, 0x09, 0x3C, 0x0A, 0x3C, 0x0B, 0x3C, 0x0C, 0x3C, 0x0D, 0x3C, 0x0E, 0x3C, 0x0F, 0x3C
	.byte 0x10, 0x3C, 0x11, 0x3C, 0x12, 0x3C, 0x13, 0x3C, 0x14, 0x3C, 0x15, 0x3C, 0x16, 0x3C, 0x17, 0x3C
	.byte 0x18, 0x3C, 0x19, 0x3C, 0x1A, 0x3C, 0x1B, 0x3C, 0x1C, 0x3C, 0x1D, 0x3C, 0x1E, 0x3C, 0x1F, 0x3C
	.byte 0x20, 0x3C, 0x21, 0x3C, 0x22, 0x3C, 0x23, 0x3C, 0x24, 0x3C, 0x25, 0x3C, 0x26, 0x3C, 0x27, 0x3C
	.byte 0x28, 0x3C, 0x29, 0x3C, 0x2A, 0x3C, 0x2B, 0x3C, 0x2C, 0x3C, 0x2D, 0x3C, 0x2E, 0x3C, 0x2F, 0x3C
	.byte 0x30, 0x3C, 0x31, 0x3C, 0x32, 0x3C, 0x33, 0x3C, 0x34, 0x3C, 0x35, 0x3C, 0x36, 0x3C, 0x37, 0x3C
	.byte 0x38, 0x3C, 0x39, 0x3C, 0x3A, 0x3C, 0x3B, 0x3C, 0x3C, 0x3C, 0x3D, 0x3C, 0x3E, 0x3C, 0x3F, 0x3C
	.byte 0x40, 0x3C, 0x41, 0x3C, 0x42, 0x3C, 0x43, 0x3C, 0x44, 0x3C, 0x45, 0x3C, 0x46, 0x3C, 0x47, 0x3C
	.byte 0x48, 0x3C, 0x49, 0x3C, 0x4A, 0x3C, 0x4B, 0x3C, 0x4C, 0x3C, 0x4D, 0x3C, 0x4E, 0x3C, 0x4F, 0x3C
	.byte 0x50, 0x3C, 0x51, 0x3C, 0x52, 0x3C, 0x53, 0x3C, 0x54, 0x3C, 0x55, 0x3C, 0x56, 0x3C, 0x57, 0x3C
	.byte 0x58, 0x3C, 0x59, 0x3C, 0x5A, 0x3C, 0x5B, 0x3C, 0x5C, 0x3C, 0x5D, 0x3C, 0x5E, 0x3C, 0x5F, 0x3C
	.byte 0x60, 0x3C, 0x61, 0x3C, 0x62, 0x3C, 0x63, 0x3C, 0x64, 0x3C, 0x65, 0x3C, 0x66, 0x3C, 0x67, 0x3C
	.byte 0x68, 0x3C, 0x69, 0x3C, 0x6A, 0x3C, 0x6B, 0x3C, 0x6C, 0x3C, 0x6D, 0x3C, 0x6E, 0x3C, 0x6F, 0x3C
	.byte 0x70, 0x3C, 0x71, 0x3C, 0x72, 0x3C, 0x73, 0x3C, 0x74, 0x3C, 0x75, 0x3C, 0x76, 0x3C, 0x77, 0x3C
	.byte 0x78, 0x3C, 0x79, 0x3C, 0x7A, 0x3C, 0x7B, 0x3C, 0x7C, 0x3C, 0x7D, 0x3C, 0x7E, 0x3C, 0x7F, 0x3C
	.byte 0x80, 0x3C, 0x81, 0x3C, 0x82, 0x3C, 0x83, 0x3C, 0x84, 0x3C, 0x85, 0x3C, 0x86, 0x3C, 0x87, 0x3C
	.byte 0x88, 0x3C, 0x89, 0x3C, 0x8A, 0x3C, 0x8B, 0x3C, 0x8C, 0x3C, 0x8D, 0x3C, 0x8E, 0x3C, 0x8F, 0x3C
	.byte 0x90, 0x3C, 0x91, 0x3C, 0x92, 0x3C, 0x93, 0x3C, 0x94, 0x3C, 0x95, 0x3C, 0x96, 0x3C, 0x97, 0x3C
	.byte 0x98, 0x3C, 0x99, 0x3C, 0x9A, 0x3C, 0x9B, 0x3C, 0x9C, 0x3C, 0x9D, 0x3C, 0x9E, 0x3C, 0x9F, 0x3C
	.byte 0xA0, 0x3C, 0xA1, 0x3C, 0xA2, 0x3C, 0xA3, 0x3C, 0xA4, 0x3C, 0xA5, 0x3C, 0xA6, 0x3C, 0xA7, 0x3C
	.byte 0xA8, 0x3C, 0xA9, 0x3C, 0xAA, 0x3C, 0xAB, 0x3C, 0xAC, 0x3C, 0xAD, 0x3C, 0xAE, 0x3C, 0xAF, 0x3C
	.byte 0xB0, 0x3C, 0xB1, 0x3C, 0xB2, 0x3C, 0xB3, 0x3C, 0xB4, 0x3C, 0xB5, 0x3C, 0xB6, 0x3C, 0xB7, 0x3C
	.byte 0xB8, 0x3C, 0xB9, 0x3C, 0xBA, 0x3C, 0xBB, 0x3C, 0xBC, 0x3C, 0xBD, 0x3C, 0xBE, 0x3C, 0xBF, 0x3C
	.byte 0xC0, 0x3C, 0xC1, 0x3C, 0xC2, 0x3C, 0xC3, 0x3C, 0xC4, 0x3C, 0xC5, 0x3C, 0xC6, 0x3C, 0xC7, 0x3C
	.byte 0xC8, 0x3C, 0xC9, 0x3C, 0xCA, 0x3C, 0xCB, 0x3C, 0xCC, 0x3C, 0xCD, 0x3C, 0xCE, 0x3C, 0xCF, 0x3C
	.byte 0xD0, 0x3C, 0xD1, 0x3C, 0xD2, 0x3C, 0xD3, 0x3C, 0xD4, 0x3C, 0xD5, 0x3C, 0xD6, 0x3C, 0xD7, 0x3C
#else
	.byte 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00
	.byte 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00
	.byte 0x11, 0x00, 0x12, 0x00, 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00
	.byte 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00
	.byte 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00
	.byte 0x29, 0x00, 0x2A, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00
	.byte 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00
	.byte 0x39, 0x00, 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00
	.byte 0x41, 0x00, 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x45, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00
	.byte 0x49, 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00
	.byte 0x51, 0x00, 0x52, 0x00, 0x53, 0x00, 0x54, 0x00, 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00
	.byte 0x59, 0x00, 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00
	.byte 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00
	.byte 0x69, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x6C, 0x00, 0x6D, 0x00, 0x6E, 0x00, 0x6F, 0x00, 0x70, 0x00
	.byte 0x71, 0x00, 0x72, 0x00, 0x73, 0x00, 0x74, 0x00, 0x75, 0x00, 0x76, 0x00, 0x77, 0x00, 0x78, 0x00
	.byte 0x79, 0x00, 0x7A, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x7F, 0x00, 0x80, 0x00
	.byte 0x81, 0x00, 0x82, 0x00, 0x83, 0x00, 0x84, 0x00, 0x85, 0x00, 0x86, 0x00, 0x87, 0x00, 0x88, 0x00
	.byte 0x89, 0x00, 0x8A, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x8D, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00
	.byte 0x91, 0x00, 0x92, 0x00, 0x93, 0x00, 0x94, 0x00, 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x9A, 0x00, 0x9B, 0x00, 0x9C, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0x9F, 0x00, 0xA0, 0x00
	.byte 0xA1, 0x00, 0xA2, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0xA5, 0x00, 0xA6, 0x00, 0xA7, 0x00, 0xA8, 0x00
	.byte 0xA9, 0x00, 0xAA, 0x00, 0xAB, 0x00, 0xAC, 0x00, 0xAD, 0x00, 0xAE, 0x00, 0xAF, 0x00, 0xB0, 0x00
	.byte 0xB1, 0x00, 0xB2, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xB5, 0x00, 0xB6, 0x00, 0xB7, 0x00, 0xB8, 0x00
	.byte 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00, 0xBE, 0x00, 0xBF, 0x00, 0xC0, 0x00
	.byte 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00, 0xC7, 0x00, 0xC8, 0x00
	.byte 0xC9, 0x00, 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00, 0xCD, 0x00, 0xCE, 0x00, 0xCF, 0x00, 0xD0, 0x00
	.byte 0xD1, 0x00, 0xD2, 0x00, 0xD3, 0x00, 0xD4, 0x00, 0xD5, 0x00, 0xD6, 0x00, 0xD7, 0x00, 0xD8, 0x00
	.byte 0xD9, 0x00, 0xDA, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xDD, 0x00, 0xDE, 0x00, 0xDF, 0x00, 0xE0, 0x00
	.byte 0xE1, 0x00, 0xE2, 0x00, 0xE3, 0x00, 0xE4, 0x00, 0xE5, 0x00, 0xE6, 0x00, 0xE7, 0x00, 0xE8, 0x00
	.byte 0xE9, 0x00, 0xEA, 0x00, 0xEB, 0x00, 0xEC, 0x00, 0xED, 0x00, 0xEE, 0x00, 0xEF, 0x00, 0xF0, 0x00
	.byte 0xF1, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0xF4, 0x00, 0xF5, 0x00, 0xF6, 0x00, 0xF7, 0x00, 0xF8, 0x00
	.byte 0xF9, 0x00, 0xFA, 0x00, 0xFB, 0x00, 0xFC, 0x00
#endif
	.global ov01_0233BAF0
ov01_0233BAF0:
	.byte 0x25, 0x73, 0x00, 0x00
	.global ov01_0233BAF4
ov01_0233BAF4:
	.byte 0x5B, 0x43, 0x53, 0x3A
	.byte 0x57, 0x5D, 0x25, 0x73, 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BB04
ov01_0233BB04:
	.byte 0x5B, 0x4D, 0x3A, 0x54
	.byte 0x32, 0x5D, 0x00, 0x00
	.global ov01_0233BB0C
ov01_0233BB0C:
	.byte 0x5B, 0x4D, 0x3A, 0x54, 0x33, 0x5D, 0x00, 0x00
	.global ov01_0233BB14
ov01_0233BB14:
	.byte 0x00, 0x80, 0xFF, 0xFF
	.global ov01_0233BB18
ov01_0233BB18:
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x03, 0x16, 0x03, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BB28
ov01_0233BB28:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.global ov01_0233BB38
ov01_0233BB38:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.global ov01_0233BB48
ov01_0233BB48:
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x03, 0x07, 0x03, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BB58
ov01_0233BB58:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x0C, 0x01, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BB68
ov01_0233BB68:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x1C, 0x04, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BB78
ov01_0233BB78:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x10, 0x1C, 0x06, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BB88
ov01_0233BB88:
#ifdef JAPAN
	.byte 0xE7, 0x3C, 0xE8, 0x3C, 0xE9, 0x3C, 0xEA, 0x3C
	.byte 0xEB, 0x3C, 0xEC, 0x3C, 0xED, 0x3C, 0xEE, 0x3C, 0xEF, 0x3C, 0xF0, 0x3C, 0xF1, 0x3C
	.global ov01_0233BB9E
ov01_0233BB9E:
	.byte 0xE7, 0x3C
	.byte 0xE8, 0x3C, 0xE9, 0x3C, 0xEA, 0x3C, 0xEB, 0x3C, 0xEC, 0x3C, 0xED, 0x3C, 0xEE, 0x3C, 0xEF, 0x3C
	.byte 0xF0, 0x3C, 0xF1, 0x3C
	.global ov01_0233BBB4
ov01_0233BBB4:
	.byte 0xE7, 0x3C, 0xE8, 0x3C, 0xE9, 0x3C, 0xEA, 0x3C, 0xEB, 0x3C, 0xEC, 0x3C
	.byte 0xED, 0x3C, 0xEE, 0x3C, 0xEF, 0x3C, 0xF0, 0x3C, 0xF1, 0x3C
	.global ov01_0233BBCA
ov01_0233BBCA:
	.byte 0xE7, 0x3C, 0xE8, 0x3C, 0xE9, 0x3C
	.byte 0xEA, 0x3C, 0xEB, 0x3C, 0xEC, 0x3C, 0xED, 0x3C, 0xEE, 0x3C, 0xEF, 0x3C, 0xF0, 0x3C, 0xE5, 0x3C
	.byte 0xE6, 0x3C, 0x00, 0x00
#else
	.byte 0x0C, 0x01, 0x0D, 0x01, 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01, 0x11, 0x01, 0x12, 0x01, 0x13, 0x01
	.byte 0x14, 0x01, 0x15, 0x01, 0x16, 0x01
	.global ov01_0233BB9E
ov01_0233BB9E:
	.byte 0x0C, 0x01, 0x0D, 0x01, 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01
	.byte 0x11, 0x01, 0x12, 0x01, 0x13, 0x01, 0x14, 0x01, 0x15, 0x01, 0x16, 0x01
	.global ov01_0233BBB4
ov01_0233BBB4:
	.byte 0x0C, 0x01, 0x0D, 0x01
	.byte 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01, 0x11, 0x01, 0x12, 0x01, 0x13, 0x01, 0x14, 0x01, 0x15, 0x01
	.byte 0x16, 0x01
	.global ov01_0233BBCA
ov01_0233BBCA:
	.byte 0x0C, 0x01, 0x0D, 0x01, 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01, 0x11, 0x01, 0x12, 0x01
	.byte 0x13, 0x01, 0x14, 0x01, 0x15, 0x01, 0x0A, 0x01, 0x0B, 0x01, 0x00, 0x00
#endif
	.global ov01_0233BBE4
ov01_0233BBE4:
	.byte 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.global ov01_0233BC14
ov01_0233BC14:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.global ov01_0233BC44
ov01_0233BC44:
	.byte 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.global ov01_0233BC74
ov01_0233BC74:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.global ov01_0233BCA4
ov01_0233BCA4:
	.byte 0x0C, 0x0C, 0x0C, 0x04
	.byte 0x04, 0x00, 0x00, 0x00
	.global ov01_0233BCAC
ov01_0233BCAC:
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov01_023371DC
	.word ov01_02337210
	.word ov01_0233723C
	.global ov01_0233BCBC
ov01_0233BCBC:
	.byte 0x06, 0x00, 0x00, 0x00
	.word ov03_0233CB08
	.word ov03_0233CF9C
	.word ov03_0233CB94
	.global ov01_0233BCCC
ov01_0233BCCC:
	.byte 0x07, 0x00, 0x00, 0x00
	.word ov06_0233D51C
	.word ov06_0233DCC0
	.word ov06_0233D5A4
	.global ov01_0233BCDC
ov01_0233BCDC:
	.byte 0x07, 0x00, 0x00, 0x00
	.word ov06_0233E958
	.word ov06_0233ECCC
	.word ov06_0233EA1C
	.global ov01_0233BCEC
ov01_0233BCEC:
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov04_0233CBB8
	.word ov04_0233D1A0
	.word ov04_0233CC4C
	.global ov01_0233BCFC
ov01_0233BCFC:
	.byte 0x09, 0x00, 0x00, 0x00
	.word ov05_0233CB9C
	.word ov05_0233D398
	.word ov05_0233CC10
	.global ov01_0233BD0C
ov01_0233BD0C:
	.byte 0x0A, 0x00, 0x00, 0x00
	.word ov07_0233F6E0
	.word ov07_0233FCD8
	.word ov07_0233F758
	.global ov01_0233BD1C
ov01_0233BD1C:
#if defined(EUROPE)
	.byte 0xD8, 0x36, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xD9, 0x36, 0x00, 0x00
#elif defined(JAPAN)
	.byte 0x58, 0x33, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x59, 0x33, 0x00, 0x00
#else
	.byte 0xD6, 0x36, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xD7, 0x36, 0x00, 0x00
#endif
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov01_0233BD34
ov01_0233BD34:
	.byte 0x57, 0x69, 0x72, 0x65
	.byte 0x6C, 0x65, 0x73, 0x73, 0x20, 0x43, 0x61, 0x6E, 0x63, 0x65, 0x6C, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BD48
ov01_0233BD48:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73, 0x20, 0x53, 0x6C, 0x65, 0x65, 0x70, 0x20, 0x45
	.byte 0x6E, 0x64, 0x0A, 0x00
	.global ov01_0233BD5C
ov01_0233BD5C:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73, 0x20, 0x54, 0x69, 0x6D
	.byte 0x65, 0x6F, 0x75, 0x74, 0x0A, 0x00, 0x00, 0x00
	.global ov01_0233BD70
ov01_0233BD70:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73
	.byte 0x20, 0x43, 0x6F, 0x6D, 0x6D, 0x75, 0x6E, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x20, 0x45
	.byte 0x72, 0x72, 0x6F, 0x72, 0x0A, 0x00, 0x00, 0x00
	.global ov01_0233BD90
ov01_0233BD90:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73
	.byte 0x20, 0x44, 0x69, 0x66, 0x66, 0x65, 0x72, 0x65, 0x6E, 0x74, 0x20, 0x4D, 0x6F, 0x64, 0x65, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BDAC
ov01_0233BDAC:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73, 0x20, 0x43, 0x68, 0x65
	.byte 0x63, 0x6B, 0x20, 0x53, 0x75, 0x6D, 0x20, 0x45, 0x72, 0x72, 0x6F, 0x72, 0x0A, 0x00, 0x00, 0x00
	.global ov01_0233BDC8
ov01_0233BDC8:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73, 0x20, 0x45, 0x78, 0x69, 0x73, 0x74, 0x69, 0x6E
	.byte 0x67, 0x0A, 0x00, 0x00
	.global ov01_0233BDDC
ov01_0233BDDC:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73, 0x20, 0x43, 0x6F, 0x72
	.byte 0x72, 0x65, 0x73, 0x70, 0x6F, 0x6E, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BDF4
ov01_0233BDF4:
	.byte 0x57, 0x69, 0x72, 0x65
	.byte 0x6C, 0x65, 0x73, 0x73, 0x20, 0x49, 0x6C, 0x6C, 0x65, 0x67, 0x61, 0x6C, 0x20, 0x44, 0x61, 0x74
	.byte 0x61, 0x0A, 0x20, 0x00
	.global ov01_0233BE0C
ov01_0233BE0C:
	.byte 0x57, 0x69, 0x72, 0x65, 0x6C, 0x65, 0x73, 0x73, 0x20, 0x4F, 0x74, 0x68
	.byte 0x65, 0x72, 0x20, 0x45, 0x72, 0x72, 0x6F, 0x72, 0x0A, 0x00, 0x00, 0x00
	.global ov01_0233BE24
ov01_0233BE24:
	.byte 0x3D, 0x3D, 0x3D, 0x3D
	.byte 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x20, 0x46, 0x49, 0x4E, 0x49, 0x53, 0x48, 0x20
	.byte 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BE48
ov01_0233BE48:
	.byte 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x20, 0x45, 0x20, 0x72, 0x20
	.byte 0x72, 0x20, 0x6F, 0x20, 0x72, 0x20, 0x21, 0x20, 0x21, 0x20, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D
	.byte 0x3D, 0x3D, 0x3D, 0x3D, 0x3D, 0x0A, 0x00, 0x00
	.global ov01_0233BE70
ov01_0233BE70:
#if defined(EUROPE)
	.byte 0x5C, 0x37, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x5D, 0x37, 0x00, 0x00
#elif defined(JAPAN)
	.byte 0xDC, 0x33, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xDD, 0x33, 0x00, 0x00
#else
	.byte 0x5A, 0x37, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x5B, 0x37, 0x00, 0x00
#endif
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global ov01_0233BE88
ov01_0233BE88:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x63, 0x6F, 0x6D, 0x6D, 0x6F, 0x6E, 0x2F, 0x73, 0x65, 0x74, 0x50
	.byte 0x72, 0x6F, 0x66, 0x69, 0x6C, 0x65, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00
	.global ov01_0233BEA4
ov01_0233BEA4:
	.byte 0x2F, 0x77, 0x65, 0x62
	.byte 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x52, 0x65
	.byte 0x67, 0x69, 0x73, 0x74, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BEC4
ov01_0233BEC4:
	.byte 0x2F, 0x77, 0x65, 0x62
	.byte 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x4C, 0x69
	.byte 0x73, 0x74, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00
	.global ov01_0233BEE0
ov01_0233BEE0:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x72, 0x65, 0x73
	.byte 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x45, 0x78, 0x69, 0x73, 0x74, 0x2E
	.byte 0x61, 0x73, 0x70, 0x00
	.global ov01_0233BEFC
ov01_0233BEFC:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F
	.byte 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x45, 0x6E, 0x74, 0x72, 0x79, 0x2E, 0x61, 0x73, 0x70, 0x00
	.global ov01_0233BF18
ov01_0233BF18:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63
	.byte 0x75, 0x65, 0x43, 0x6F, 0x6D, 0x70, 0x6C, 0x65, 0x74, 0x65, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00
	.global ov01_0233BF38
ov01_0233BF38:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63
	.byte 0x75, 0x65, 0x43, 0x68, 0x65, 0x63, 0x6B, 0x2E, 0x61, 0x73, 0x70, 0x00
	.global ov01_0233BF54
ov01_0233BF54:
	.byte 0x2F, 0x77, 0x65, 0x62
	.byte 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x54, 0x68
	.byte 0x61, 0x6E, 0x6B, 0x73, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BF74
ov01_0233BF74:
	.byte 0x2F, 0x77, 0x65, 0x62
	.byte 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x63, 0x75, 0x65, 0x52, 0x65
	.byte 0x63, 0x65, 0x69, 0x76, 0x65, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x00
	.global ov01_0233BF94
ov01_0233BF94:
	.byte 0x2F, 0x77, 0x65, 0x62
	.byte 0x2F, 0x74, 0x65, 0x61, 0x6D, 0x2F, 0x74, 0x65, 0x61, 0x6D, 0x52, 0x65, 0x67, 0x69, 0x73, 0x74
	.byte 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233BFB0
ov01_0233BFB0:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x74, 0x65, 0x61
	.byte 0x6D, 0x2F, 0x74, 0x65, 0x61, 0x6D, 0x4C, 0x69, 0x73, 0x74, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00
	.global ov01_0233BFC8
ov01_0233BFC8:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x74, 0x65, 0x61, 0x6D, 0x2F, 0x74, 0x65, 0x61, 0x6D, 0x45, 0x78
	.byte 0x69, 0x73, 0x74, 0x2E, 0x61, 0x73, 0x70, 0x00
	.global ov01_0233BFE0
ov01_0233BFE0:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x74, 0x65, 0x61
	.byte 0x6D, 0x2F, 0x74, 0x65, 0x61, 0x6D, 0x45, 0x6E, 0x74, 0x72, 0x79, 0x2E, 0x61, 0x73, 0x70, 0x00
	.global ov01_0233BFF8
ov01_0233BFF8:
	.byte 0x2F, 0x77, 0x65, 0x62, 0x2F, 0x63, 0x6F, 0x6D, 0x6D, 0x6F, 0x6E, 0x2F, 0x61, 0x64, 0x6D, 0x69
	.byte 0x6E, 0x47, 0x65, 0x74, 0x53, 0x65, 0x72, 0x76, 0x65, 0x72, 0x53, 0x74, 0x61, 0x74, 0x65, 0x2E
	.byte 0x61, 0x73, 0x70, 0x00
	.global ov01_0233C01C
ov01_0233C01C:
	.byte 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6E, 0x67, 0x20, 0x74
	.byte 0x6F, 0x20, 0x25, 0x73, 0x0A, 0x00, 0x00, 0x00
	.global ov01_0233C030
ov01_0233C030:
	.byte 0x70, 0x69, 0x64, 0x3A, 0x20, 0x25, 0x64, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C03C
ov01_0233C03C:
	.byte 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x20, 0x73, 0x69, 0x7A, 0x65
	.byte 0x3A, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C050
ov01_0233C050:
	.byte 0x53, 0x65, 0x73, 0x73, 0x69, 0x6F, 0x6E, 0x20
	.byte 0x45, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x25, 0x64, 0x20, 0x25, 0x73, 0x0A, 0x00, 0x00, 0x00
	.global ov01_0233C068
ov01_0233C068:
	.byte 0x53, 0x65, 0x73, 0x73, 0x69, 0x6F, 0x6E, 0x20, 0x50, 0x72, 0x6F, 0x63, 0x65, 0x73, 0x73, 0x20
	.byte 0x54, 0x69, 0x6D, 0x65, 0x4F, 0x75, 0x74, 0x2E, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C088
ov01_0233C088:
	.byte 0x55, 0x6E, 0x6B, 0x6E, 0x6F, 0x77, 0x6E, 0x20, 0x45, 0x72, 0x72, 0x6F, 0x72, 0x20, 0x43, 0x6F
	.byte 0x64, 0x65, 0x20, 0x3A, 0x20, 0x25, 0x30, 0x35, 0x64, 0x0A, 0x00, 0x00
	.global ov01_0233C0A4
ov01_0233C0A4:
	.byte 0x04, 0x00, 0x00, 0x00
	.word ov01_0233ADEC
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov01_0233AE04

	.data
	.global ov01_0233C0C0
ov01_0233C0C0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C0D8
ov01_0233C0D8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C0E0
ov01_0233C0E0:
#if defined(EUROPE)
	.byte 0xAC, 0x01, 0x80, 0x00
	.byte 0xAD, 0x01, 0x80, 0x00, 0xAE, 0x01, 0x80, 0x00, 0xAF, 0x01, 0x80, 0x00, 0xB0, 0x01, 0x80, 0x00
	.byte 0xAC, 0x01, 0x80, 0x00, 0xAD, 0x01, 0x80, 0x00, 0xAE, 0x01, 0x80, 0x00, 0xAF, 0x01, 0x80, 0x00
	.byte 0xB0, 0x01, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
#elif defined(JAPAN)
	.byte 0x85, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x77, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
#else
	.byte 0x68, 0x05, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x39, 0x09, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
#endif
	.global ov01_0233C100
ov01_0233C100:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x20, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C140
ov01_0233C140:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C144
ov01_0233C144:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C148
ov01_0233C148:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C14C
ov01_0233C14C:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C150
ov01_0233C150:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C158
ov01_0233C158:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C15C
ov01_0233C15C:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C160
ov01_0233C160:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C164
ov01_0233C164:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C168
ov01_0233C168:
	.word ov01_0233B0B8
	.word ov01_0233B0CC
	.word ov01_0233B0A4
	.global ov01_0233C174
ov01_0233C174:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C178
ov01_0233C178:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C184
ov01_0233C184:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C188
ov01_0233C188:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C190
ov01_0233C190:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C198
ov01_0233C198:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1A0
ov01_0233C1A0:
	.word ov01_0233B8F8
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1A8
ov01_0233C1A8:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1AC
ov01_0233C1AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1B0
ov01_0233C1B0:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1B4
ov01_0233C1B4:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1B8
ov01_0233C1B8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1D4
ov01_0233C1D4:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1DC
ov01_0233C1DC:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1E0
ov01_0233C1E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1E8
ov01_0233C1E8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1F4
ov01_0233C1F4:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C1F8
ov01_0233C1F8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C210
ov01_0233C210:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov01_0233C21C
ov01_0233C21C:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov01_0233C240
ov01_0233C240:
	.space 0x80
	.global ov01_0233C2C0
ov01_0233C2C0:
	.space 0x40
	.global ov01_0233C300
ov01_0233C300:
	.space 0x80
	.global ov01_0233C380
ov01_0233C380:
	.space 0x200
	.global ov01_0233C580
ov01_0233C580:
	.space 0x200
	.global ov01_0233C780
ov01_0233C780:
	.space 0x4
	.global ov01_0233C784
ov01_0233C784:
	.space 0x7C
	.global ov01_0233C800
ov01_0233C800:
	.space 0x7C
	.global ov01_0233C87C
ov01_0233C87C:
	.space 0x4
	.global ov01_0233C880
ov01_0233C880:
	.space 0x7C
	.global ov01_0233C8FC
ov01_0233C8FC:
	.space 0x7C
	.global ov01_0233C978
ov01_0233C978:
	.space 0x7C
	.global ov01_0233C9F4
ov01_0233C9F4:
	.space 0x7C
	.global ov01_0233CA70
ov01_0233CA70:
	.space 0x8
	.global ov01_0233CA78
ov01_0233CA78:
	.space 0x4
	.global ov01_0233CA7C
ov01_0233CA7C:
	.space 0x4
