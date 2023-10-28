	.include "asm/macros.inc"
	.include "asm/include/wram.inc"

	.text

	arm_func_start sub_037F8000
sub_037F8000: ; 0x037F8000
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	bl sub_037FC9EC
	bl sub_037FBF64
	add r2, sp, #4
	mov r0, #0x20
	mov r1, #2
	bl sub_027F55B8
	ldr r0, [sp, #4]
	add r2, sp, #0x10
	mov r0, r0, lsl #3
	str r0, [sp, #4]
	mov r1, #0x100
	bl sub_027F55B8
	ldr r0, [sp, #4]
	add r2, sp, #0x110
	add r0, r0, #0x100
	mov r1, #0x100
	bl sub_027F55B8
	mov r0, #0x1d
	mov r1, #1
	add r2, sp, #0
	mov r6, #0
	bl sub_027F55B8
	ldrb r0, [sp]
	cmp r0, #0xff
	moveq r0, r6
	beq _037F807C
	tst r0, #0x50
	movne r0, #1
	moveq r0, r6
_037F807C:
	cmp r0, #0
	beq _037F8150
	bl sub_037F8484
	mov r8, r0
	mov fp, #1
	and r7, r8, #0x40
	mov sl, #0
	add r5, sp, #0x10
	mov r4, fp
	b _037F8144
_037F80A4:
	ldr r0, _037F8454 ; =0x0000FFFF
	add sb, r5, sl, lsl #8
	mov r1, sb
	mov r2, #0x70
	bl sub_037F846C
	mov r2, sb
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _037F8138
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	bhs _037F8138
	ldr r0, _037F8454 ; =0x0000FFFF
	mov r2, #0x8a
	add r1, sb, #0x74
	bl sub_037F846C
	mov r2, sb
	ldrh r1, [r2, #0xfe]
	cmp r0, r1
	bne _037F8138
	ldrh r1, [r2, #0x76]
	ldrb r0, [r2, #0x75]
	tst r1, r4, lsl r0
	beq _037F8138
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
	bne _037F81F0
	orr r6, r6, fp, lsl sl
_037F8138:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_037F8144:
	cmp sl, #2
	blo _037F80A4
	b _037F81B4
_037F8150:
	bl sub_037F8484
	tst r0, #0x40
	movne r6, #3
	bne _037F81F0
	ldr r8, _037F8454 ; =0x0000FFFF
	mov sb, #0
	add r7, sp, #0x10
	mov r4, #1
	mov r5, #0x70
_037F8174:
	mov r0, r8
	mov r2, r5
	add r1, r7, sb, lsl #8
	bl sub_037F846C
	add r2, r7, sb, lsl #8
	ldrh r1, [r2, #0x72]
	cmp r0, r1
	bne _037F81A0
	ldrh r0, [r2, #0x70]
	cmp r0, #0x80
	orrlo r6, r6, r4, lsl sb
_037F81A0:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	cmp sb, #2
	blo _037F8174
_037F81B4:
	cmp r6, #1
	cmpne r6, #2
	beq _037F81F0
	cmp r6, #3
	bne _037F81EC
	ldrh r1, [sp, #0x80]
	add r0, sp, #0x100
	add r1, r1, #1
	ldrh r0, [r0, #0x80]
	and r1, r1, #0x7f
	cmp r1, r0
	moveq r6, #2
	movne r6, #1
	b _037F81F0
_037F81EC:
	mov r6, #0
_037F81F0:
	cmp r6, #3
	blt _037F820C
	ldr r1, _037F8458 ; =0x027FFC80
	mvn r0, #0
	mov r2, #0x74
	bl sub_037FDFD0
	b _037F82C8
_037F820C:
	cmp r6, #0
	beq _037F82B8
	ldr r0, _037F845C ; =0xFFFFFF2A
	mov r1, r6, lsl #8
	add r0, sp, r0
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0xa
	bhs _037F8258
	add r0, sp, #0x10
	mov r3, #0xa
	mov r2, #0
	add r1, r0, r1
	b _037F824C
_037F8240:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xfc]
	sub r3, r3, #1
_037F824C:
	ldrb r0, [r1, #-0xe6]
	cmp r3, r0
	bgt _037F8240
_037F8258:
	ldr r0, _037F8460 ; =0xFFFFFF60
	mov r1, r6, lsl #8
	add r0, sp, r0
	ldrb r0, [r0, r6, lsl #8]
	cmp r0, #0x1a
	bhs _037F829C
	add r0, sp, #0x10
	mov r3, #0x1a
	mov r2, #0
	add r1, r0, r1
	b _037F8290
_037F8284:
	add r0, r1, r3, lsl #1
	strh r2, [r0, #-0xe6]
	sub r3, r3, #1
_037F8290:
	ldrb r0, [r1, #-0xb0]
	cmp r3, r0
	bgt _037F8284
_037F829C:
	ldr r1, _037F8458 ; =0x027FFC80
	add r2, sp, #0x10
	sub r0, r6, #1
	add r0, r2, r0, lsl #8
	mov r2, #0x74
	bl sub_037FDFEC
	b _037F82C8
_037F82B8:
	ldr r1, _037F8458 ; =0x027FFC80
	mov r0, #0
	mov r2, #0x74
	bl sub_037FDFD0
_037F82C8:
	add r2, sp, #8
	mov r0, #0x36
	mov r1, #6
	bl sub_027F55B8
	ldr r4, _037F8458 ; =0x027FFC80
	add r0, sp, #8
	add r1, r4, #0x74
	mov r2, #6
	bl sub_037FE12C
	add r2, sp, #2
	mov r0, #0x3c
	mov r1, #2
	bl sub_027F55B8
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bl sub_038073D4
	strh r0, [r4, #0x7a]
	bl sub_037FE2B4
	mov r0, #8
	bl sub_037FCA94
	mov r4, r0
	mov r0, #8
	bl sub_037FCAA8
	mov r1, r0
	mov r2, r4
	mov r0, #8
	mov r3, #1
	bl sub_037FCE24
	mov r4, r0
	mov r0, #8
	bl sub_037FCA94
	sub r2, r0, r4
	mov r0, r4
	mov r1, #0
	bl sub_037FE070
	mov r1, r4
	mov r0, #8
	bl sub_037FCB90
	mov r0, #8
	bl sub_037FCA94
	mov r4, r0
	mov r0, #8
	bl sub_037FCAA8
	mov r1, r0
	mov r2, r4
	mov r0, #8
	bl sub_037FCECC
	movs r4, r0
	bpl _037F8394
	bl sub_037FDE70
_037F8394:
	mov r1, r4
	mov r0, #8
	bl sub_037FCDF0
	mov r1, r4
	mov r0, #8
	bl sub_037FCF6C
	cmp r0, #0x2100
	bhs _037F83B8
	bl sub_037FDE70
_037F83B8:
	mov r0, #6
	bl sub_037FEEF8
	bl sub_037FE5C0
	ldr r1, _037F8464 ; =sub_037F84BC
	mov r0, #1
	bl sub_037FB7BC
	mov r0, #1
	bl sub_037FB8F0
	ldr r3, _037F8468 ; =0x04000004
	mov r0, #1
	ldrh r1, [r3]
	ldrh r1, [r3]
	add r2, r3, #0x204
	orr r1, r1, #8
	strh r1, [r3]
	ldrh r1, [r2]
	strh r0, [r2]
	bl ClearIrqFlag
	mvn r0, #0
	bl sub_03802618
	mov r0, #0xf
	bl sub_038026E0
	mov r0, #0xc
	bl sub_027F5CC4
	mov r0, r4
	bl sub_03805248
	mov r0, #2
	bl sub_03803874
	mov r4, #0
_037F842C:
	bl sub_037F8478
	bl sub_037FDDB4
	cmp r0, #0
	beq _037F8448
	mov r0, r4
	bl sub_03806610
	bl sub_037FDDF8
_037F8448:
	bl sub_03806848
	bl sub_038036BC
	b _037F842C
	.align 2, 0
_037F8454: .word 0x0000FFFF
_037F8458: .word 0x027FFC80
_037F845C: .word 0xFFFFFF2A
_037F8460: .word 0xFFFFFF60
_037F8464: .word sub_037F84BC
_037F8468: .word 0x04000004
	arm_func_end sub_037F8000

	arm_func_start sub_037F846C
sub_037F846C: ; 0x037F846C
	ldr ip, _037F8474 ; =sub_03803804
	bx ip
	.align 2, 0
_037F8474: .word sub_03803804 + 1
	arm_func_end sub_037F846C

	arm_func_start sub_037F8478
sub_037F8478: ; 0x037F8478
	ldr ip, _037F8480 ; =sub_038037D2
	bx ip
	.align 2, 0
_037F8480: .word sub_038037D2 + 1
	arm_func_end sub_037F8478

	arm_func_start sub_037F8484
sub_037F8484: ; 0x037F8484
	ldr r1, _037F84B8 ; =0x027FFE1D
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
_037F84B8: .word 0x027FFE1D
	arm_func_end sub_037F8484

	arm_func_start sub_037F84BC
sub_037F84BC: ; 0x037F84BC
	stmdb sp!, {r3, lr}
	ldr r0, _037F84DC ; =_03809E50
	ldr r0, [r0]
	cmp r0, #0
	beq _037F84D4
	bl sub_038050FC
_037F84D4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F84DC: .word _03809E50
	arm_func_end sub_037F84BC

	arm_func_start sub_037F84E0
sub_037F84E0: ; 0x037F84E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r7, _037F858C ; =0x0380FFF4
	mov r0, #0
	ldr r8, [r7]
	ldr r4, _037F8590 ; =0x01000010
	strh r0, [r8, #0x10]
	ldr sb, _037F8594 ; =0x0000FFFF
	strh r0, [r8, #0x14]
	add r6, sp, #0
	mov r5, r0
_037F8508:
	ldr r0, [r7]
	mov r1, r6
	ldr r0, [r0, #0x308]
	mov r2, r5
	bl sub_037FC760
	cmp r0, #0
	beq _037F852C
	mov r0, r6
	bl sub_037F8704
_037F852C:
	mov r0, r4
	bl sub_037FB928
	ldrh r1, [r8, #0x10]
	strh r1, [r8, #0x12]
	mov r1, r1, lsl #1
	ldrh r1, [r8, r1]
	cmp r1, sb
	bne _037F8560
	ldrh r1, [r8, #0x10]
	add r1, r1, #1
	strh r1, [r8, #0x10]
	bl sub_037FB8F0
	b _037F8508
_037F8560:
	bl sub_037FB8F0
	ldrh r0, [r8, #0x12]
	bl sub_037F8650
	strh r0, [r8, #0x14]
	ldrh r0, [r8, #0x14]
	add r0, r8, r0, lsl #3
	ldr r0, [r0, #0xc0]
	mov lr, pc
	bx r0
_037F8584: ; 0x037F8584
	strh sb, [r8, #0x14]
	b _037F8508
	.align 2, 0
_037F858C: .word 0x0380FFF4
_037F8590: .word 0x01000010
_037F8594: .word 0x0000FFFF
	arm_func_end sub_037F84E0

	arm_func_start sub_037F8598
sub_037F8598: ; 0x037F8598
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _037F8648 ; =0x0380FFF4
	mov r7, r0
	ldr r4, [r2]
	ldr r0, _037F864C ; =0x01000010
	mov r6, r1
	add r5, r4, #0xbc
	bl sub_037FB928
	add r2, r5, r6, lsl #3
	ldrh r1, [r2, #2]
	mov ip, r6, lsl #3
	cmp r1, #0
	bne _037F8610
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
_037F8610:
	bl sub_037FB8F0
	cmp r7, #3
	beq _037F8640
	ldrh r0, [r4, #0x12]
	cmp r0, #3
	bne _037F8640
	ldr r0, _037F8648 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	ldr r0, [r0, #0x308]
	bl sub_037FC6D4
_037F8640:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F8648: .word 0x0380FFF4
_037F864C: .word 0x01000010
	arm_func_end sub_037F8598

	arm_func_start sub_037F8650
sub_037F8650: ; 0x037F8650
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037F86BC ; =0x0380FFF4
	mov r5, r0
	ldr r0, _037F86C0 ; =0x01000010
	ldr r4, [r1]
	bl sub_037FB928
	mov lr, r5, lsl #1
	ldrh r5, [r4, lr]
	ldr r2, _037F86C4 ; =0x0000FFFF
	cmp r5, r2
	beq _037F86AC
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
_037F86AC:
	bl sub_037FB8F0
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F86BC: .word 0x0380FFF4
_037F86C0: .word 0x01000010
_037F86C4: .word 0x0000FFFF
	arm_func_end sub_037F8650

	arm_func_start sub_037F86C8
sub_037F86C8: ; 0x037F86C8
	stmdb sp!, {r3, lr}
	ldr r0, _037F8700 ; =0x0380FFF4
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #1
	ldr r0, [r0, #0x308]
	bl sub_037FC760
	add r0, sp, #0
	bl sub_037F8704
	mov r0, #3
	mov r1, #0xc
	bl sub_037F8598
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F8700: .word 0x0380FFF4
	arm_func_end sub_037F86C8

	arm_func_start sub_037F8704
sub_037F8704: ; 0x037F8704
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _037F8730
	ldr r0, _037F8738 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x200
	bl sub_037F873C
	mov r0, #2
	mov r1, #0xb
	bl sub_037F8598
_037F8730:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F8738: .word 0x0380FFF4
	arm_func_end sub_037F8704

	arm_func_start sub_037F873C
sub_037F873C: ; 0x037F873C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x1000000
	mov r4, r1
	bl sub_037FB928
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
	ldr r1, _037F87A8 ; =0x0000BF1D
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
	str r4, [r5, #4]
	ldrh r1, [r5, #8]
	add r1, r1, #1
	strh r1, [r5, #8]
	bl sub_037FB8F0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F87A8: .word 0x0000BF1D
	arm_func_end sub_037F873C

	arm_func_start sub_037F87AC
sub_037F87AC: ; 0x037F87AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r2, [r4, #0xa]
	ldr r1, _037F8868 ; =0x0000BF1D
	mov r5, r0
	cmp r2, r1
	movne r0, #1
	bne _037F8860
	ldrh r1, [r4, #8]
	ldrh r0, [r5, #0xa]
	cmp r1, r0
	movne r0, #2
	bne _037F8860
	mov r0, #0x1000000
	bl sub_037FB928
	ldrh r1, [r5, #8]
	sub r1, r1, #1
	strh r1, [r5, #8]
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r5]
	streq r1, [r5, #4]
	beq _037F8850
	ldr r1, [r5]
	cmp r4, r1
	ldreq r2, [r4, #4]
	mvneq r1, #0
	streq r2, [r5]
	streq r1, [r2]
	beq _037F8850
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
_037F8850:
	mov r1, #0
	strh r1, [r4, #8]
	bl sub_037FB8F0
	mov r0, #0
_037F8860:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8868: .word 0x0000BF1D
	arm_func_end sub_037F87AC

	arm_func_start sub_037F886C
sub_037F886C: ; 0x037F886C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _037F8900 ; =0x0380FFF4
	movs r3, r1
	ldr r1, [r2]
	mov r5, r0
	moveq r0, #0
	beq _037F88F8
	ldr r0, [r1, #0x17c]
	cmp r0, #0
	beq _037F88A0
	cmp r0, #1
	beq _037F88B8
	b _037F88CC
_037F88A0:
	ldr r0, [r1, #0x180]
	ldr r1, [r1, #0x184]
	add r2, r3, #0xc
	bl sub_037FCC74
	mov r4, r0
	b _037F88CC
_037F88B8:
	ldr r1, [r1, #0x180]
	add r0, r3, #0xc
	mov lr, pc
	bx r1
_037F88C8:
	mov r4, r0
_037F88CC:
	cmp r4, #0
	moveq r0, #0
	beq _037F88F8
	ldr r1, _037F8904 ; =0x0000BF1D
	mov r0, r5
	strh r1, [r4, #0xa]
	mov r2, #0
	mov r1, r4
	strh r2, [r4, #8]
	bl sub_037F89F4
	mov r0, r4
_037F88F8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8900: .word 0x0380FFF4
_037F8904: .word 0x0000BF1D
	arm_func_end sub_037F886C

	arm_func_start sub_037F8908
sub_037F8908: ; 0x037F8908
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	ldr r5, _037F8980 ; =0x0380FFF4
	ldrh r3, [r4, #0xa]
	ldr r2, _037F8984 ; =0x0000BF1D
	ldr r5, [r5]
	cmp r3, r2
	movne r0, #1
	bne _037F8978
	bl sub_037F87AC
	movs r6, r0
	bne _037F8974
	ldr r0, [r5, #0x17c]
	cmp r0, #0
	beq _037F8950
	cmp r0, #1
	beq _037F8964
	b _037F8974
_037F8950:
	ldr r0, [r5, #0x180]
	ldr r1, [r5, #0x184]
	mov r2, r4
	bl sub_037FCD84
	b _037F8974
_037F8964:
	ldr r1, [r5, #0x184]
	mov r0, r4
	mov lr, pc
	bx r1
_037F8974:
	mov r0, r6
_037F8978:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037F8980: .word 0x0380FFF4
_037F8984: .word 0x0000BF1D
	arm_func_end sub_037F8908

	arm_func_start sub_037F8988
sub_037F8988: ; 0x037F8988
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldrh r3, [r6, #0xa]
	ldr r2, _037F89F0 ; =0x0000BF1D
	mov r4, r0
	cmp r3, r2
	mov r7, r1
	movne r0, #1
	bne _037F89E8
	mov r0, #0x1000000
	bl sub_037FB928
	mov r5, r0
	mov r0, r4
	mov r1, r6
	bl sub_037F87AC
	movs r4, r0
	bne _037F89DC
	mov r0, r7
	mov r1, r6
	bl sub_037F89F4
	mov r4, r0
_037F89DC:
	mov r0, r5
	bl sub_037FB8F0
	mov r0, r4
_037F89E8:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F89F0: .word 0x0000BF1D
	arm_func_end sub_037F8988

	arm_func_start sub_037F89F4
sub_037F89F4: ; 0x037F89F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r2, [r4, #0xa]
	ldr r1, _037F8A7C ; =0x0000BF1D
	mov r5, r0
	cmp r2, r1
	movne r0, #1
	bne _037F8A74
	ldrh r0, [r4, #8]
	cmp r0, #0
	movne r0, #2
	bne _037F8A74
	mov r0, #0x1000000
	bl sub_037FB928
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
	bl sub_037FB8F0
	mov r0, #0
_037F8A74:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8A7C: .word 0x0000BF1D
	arm_func_end sub_037F89F4

	arm_func_start sub_037F8A80
sub_037F8A80: ; 0x037F8A80
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_037F8A80

	arm_func_start sub_037F8A88
sub_037F8A88: ; 0x037F8A88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037F8D38 ; =0x0380FFF4
	mov r3, #0
	ldr r2, [r4]
	mov r6, r3
	add r0, r2, #0x24
	add r5, r0, #0x400
	ldrh r0, [r5, #4]
	cmp r0, #0
	bne _037F8D30
	ldr r0, [r2, #0x200]
	sub r2, r3, #1
	str r0, [r5]
	cmp r0, r2
	beq _037F8D30
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
	bne _037F8CE8
	ldrh r7, [r0, #0xc]
	ldrh r2, [r4, #0x10]
	cmp r7, r2
	movne r0, #0xd
	strneh r0, [r4, #0x14]
	bne _037F8CE8
	and r2, r7, #0xff00
	cmp r2, #0x100
	bgt _037F8B24
	bge _037F8B70
	cmp r2, #0
	beq _037F8B40
	b _037F8C50
_037F8B24:
	cmp r2, #0x200
	bgt _037F8B34
	beq _037F8B90
	b _037F8C50
_037F8B34:
	cmp r2, #0x300
	beq _037F8C3C
	b _037F8C50
_037F8B40:
	ldrh r6, [r5, #4]
	ldr r1, _037F8D3C ; =_027F7648
	tst r6, #1
	and r2, r7, #0xff
	mov r6, #1
	mov lr, #0xb
	movne r3, #2
	bne _037F8C58
	ldrh r7, [ip, #0x4c]
	cmp r7, #0x20
	movlo r3, r6
	b _037F8C58
_037F8B70:
	ldrh r6, [ip, #0x4c]
	ldr r1, _037F8D40 ; =_027F75C0
	cmp r6, #0x40
	and r2, r7, #0xff
	mov r6, #2
	mov lr, #5
	movne r3, #1
	b _037F8C58
_037F8B90:
	and r2, r7, #0xff
	cmp r2, #0x40
	bhs _037F8BB8
	ldrh r1, [ip, #0x4c]
	mov r6, #4
	cmp r1, #0x10
	ldr r1, _037F8D44 ; =_027F77B0
	movlo r3, #1
	mov lr, #0x17
	b _037F8C58
_037F8BB8:
	cmp r2, #0x80
	bhs _037F8BE8
	ldrh r1, [ip, #0x4c]
	mov r6, #8
	cmp r1, #0x40
	sub r1, r2, #0x40
	mov r2, r1, lsl #0x10
	ldr r1, _037F8D48 ; =_027F7618
	movne r3, #1
	mov r2, r2, lsr #0x10
	mov lr, #6
	b _037F8C58
_037F8BE8:
	ldrh r1, [ip, #0x4c]
	cmp r2, #0xc0
	bhs _037F8C18
	cmp r1, #0x10
	sub r1, r2, #0x80
	mov r2, r1, lsl #0x10
	ldr r1, _037F8D4C ; =_027F76F8
	movlo r3, #1
	mov r2, r2, lsr #0x10
	mov r6, #0x10
	mov lr, #0x17
	b _037F8C58
_037F8C18:
	cmp r1, #0x10
	sub r1, r2, #0xc0
	mov r2, r1, lsl #0x10
	ldr r1, _037F8D50 ; =_027F75E8
	movlo r3, #1
	mov r2, r2, lsr #0x10
	mov r6, #0x20
	mov lr, #6
	b _037F8C58
_037F8C3C:
	ldr r1, _037F8D54 ; =_027F76A0
	and r2, r7, #0xff
	mov r6, #0x40
	mov lr, #0xb
	b _037F8C58
_037F8C50:
	mov r2, #1
	mov lr, #0
_037F8C58:
	cmp r2, lr
	movhi r3, #3
	bhi _037F8C88
	mov lr, r2, lsl #3
	ldrh r7, [r0, #0xe]
	ldrh ip, [r1, lr]
	cmp r7, ip
	addhs ip, r1, lr
	ldrhsh lr, [r4, #0x12]
	ldrhsh ip, [ip, #2]
	cmphs lr, ip
	movlo r3, #4
_037F8C88:
	cmp r3, #0
	movne r0, #1
	strneh r0, [r4, #0x12]
	strneh r3, [r4, #0x14]
	bne _037F8CE8
	ldrh r3, [r5, #4]
	add r1, r1, r2, lsl #3
	orr r2, r3, r6
	strh r2, [r5, #4]
	ldr r2, [r1, #4]
	add r1, r4, #0x10
	mov lr, pc
	bx r2
_037F8CBC:
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x14]
	cmp r0, #0x80
	beq _037F8D30
	cmp r0, #0x81
	bne _037F8CE8
	ldrh r1, [r5, #4]
	mvn r0, r6
	and r0, r1, r0
	strh r0, [r5, #4]
	b _037F8D0C
_037F8CE8:
	ldrh r1, [r5, #4]
	mvn r0, r6
	and r0, r1, r0
	strh r0, [r5, #4]
	ldr r0, _037F8D38 ; =0x0380FFF4
	ldr r1, [r5]
	ldr r0, [r0]
	add r0, r0, #0x200
	bl sub_037F8D58
_037F8D0C:
	ldr r0, _037F8D38 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _037F8D30
	mov r0, #2
	mov r1, #0xb
	bl sub_037F8598
_037F8D30:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F8D38: .word 0x0380FFF4
_037F8D3C: .word _027F7648
_037F8D40: .word _027F75C0
_037F8D44: .word _027F77B0
_037F8D48: .word _027F7618
_037F8D4C: .word _027F76F8
_037F8D50: .word _027F75E8
_037F8D54: .word _027F76A0
	arm_func_end sub_037F8A88

	arm_func_start sub_037F8D58
sub_037F8D58: ; 0x037F8D58
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _037F8DDC ; =0x0380FFF4
	mov r5, r0
	ldr r3, [r2]
	mov r4, r1
	add r2, r3, #0x100
	ldrh r2, [r2, #0xfc]
	cmp r2, #0
	beq _037F8D98
	mov r2, r4
	add r1, r3, #0x1f4
	bl sub_037F8988
	mov r0, #2
	mov r1, #0x13
	bl sub_037F8598
	b _037F8DD4
_037F8D98:
	ldr r0, [r3, #0x304]
	mov r2, #0
	bl sub_037FC6D4
	cmp r0, #0
	beq _037F8DBC
	mov r0, r5
	mov r1, r4
	bl sub_037F87AC
	b _037F8DD4
_037F8DBC:
	ldr r1, _037F8DDC ; =0x0380FFF4
	mov r0, r5
	ldr r1, [r1]
	mov r2, r4
	add r1, r1, #0x1f4
	bl sub_037F8988
_037F8DD4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8DDC: .word 0x0380FFF4
	arm_func_end sub_037F8D58

	arm_func_start sub_037F8DE0
sub_037F8DE0: ; 0x037F8DE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _037F914C ; =0x0380FFF4
	ldr r0, [r0]
	add r6, r0, #0x344
	add r4, r0, #0x31c
	bl sub_037F9198
	ldr r1, _037F9150 ; =0x04808044
	ldrh r2, [r1]
	ldrh r0, [r1]
	ldrh r1, [r1]
	add r0, r2, r0, lsl #8
	bl sub_027EAD6C
	mov r0, #1
	strh r0, [r6, #0x7c]
	ldrh r0, [r4, #0x1e]
	ldr r2, _037F9154 ; =0x04808032
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	ldreqh r0, [r6, #0x7c]
	ldr r1, _037F9158 ; =0x04808134
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
	ldr r0, _037F915C ; =0x0000FFFF
	strh r3, [r2]
	strh r0, [r1]
	strh r4, [r2, #-8]
	sub r0, r1, #0x10c
	strh r4, [r0]
	mov r0, #0xf
	strh r0, [r1, #-0xfc]
	bl sub_027EC510
	bl sub_027F4CC0
	bl sub_037FAEC0
	bl sub_037FB1E0
	ldr r2, _037F9160 ; =0x04808030
	mov r1, #0x8000
	strh r1, [r2]
	ldr r0, _037F915C ; =0x0000FFFF
	ldr r1, _037F9164 ; =0x048081AE
	strh r0, [r2, #-0x20]
	sub r2, r0, #0xe000
	ldr r0, _037F914C ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	movne r0, #0x400
	strneh r0, [r1, #-4]
	moveq r0, r4
	streqh r0, [r1, #-4]
	ldr r2, _037F9168 ; =0x04808008
	mov r3, #0
	strh r3, [r2]
	strh r3, [r2, #2]
	ldrh r0, [r6, #0xc]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037F9110
_037F8EF4: ; jump table
	b _037F8F08 ; case 0
	b _037F8F38 ; case 1
	b _037F901C ; case 2
	b _037F909C ; case 3
	b _037F90F4 ; case 4
_037F8F08:
	ldr r0, _037F915C ; =0x0000FFFF
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
	b _037F9110
_037F8F38:
	ldr r3, _037F916C ; =0x0000703F
	ldr r0, _037F9170 ; =0x00001FFF
	ldr r1, _037F9164 ; =0x048081AE
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
	bl sub_03806B80
	adds r3, r0, #1
	umull r2, r0, r3, r5
	mla r0, r3, r4, r0
	adc r1, r1, #0
	mla r0, r1, r5, r0
	str r0, [sp, #4]
	ldrh r0, [r7, #6]
	ldr r3, _037F9174 ; =0x048080F6
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
	bl sub_037F9238
	bl sub_027F119C
	ldr r0, _037F9178 ; =0x048080AE
	mov r1, #2
	strh r1, [r0]
	b _037F9110
_037F901C:
	ldr r1, _037F917C ; =0x0000E0BF
	ldr r0, _037F914C ; =0x0380FFF4
	strh r1, [r2, #0xa]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x20
	beq _037F9058
	ldrh r0, [r2, #0xa]
	ldr r1, _037F9180 ; =0x048081AA
	orr r0, r0, #0x40
	strh r0, [r2, #0xa]
	ldrh r0, [r1]
	orr r0, r0, #0x68
	strh r0, [r1]
_037F9058:
	ldrh r0, [r6, #0x64]
	tst r0, #1
	ldr r0, _037F9184 ; =0x048080D0
	ldrne r1, _037F9188 ; =0x00000581
	strneh r1, [r0]
	ldreq r1, _037F918C ; =0x00000181
	streqh r1, [r0]
	ldr r2, _037F9190 ; =0x048080E0
	mov r0, #0xb
	strh r0, [r2]
	mov r1, #1
	strh r1, [r2, #-0xdc]
	strh r1, [r2, #8]
	mov r0, #0x20
	strh r1, [r2, #0xa]
	bl sub_037F9238
	b _037F9110
_037F909C:
	ldr r1, _037F915C ; =0x0000FFFF
	strh r1, [r2, #8]
	sub r0, r1, #0x3fc0
	strh r0, [r2, #0xa]
	ldrh r0, [r6, #0x64]
	tst r0, #1
	rsbne r0, r1, #0x10400
	strneh r0, [r2, #0xc8]
	moveq r0, #1
	streqh r0, [r2, #0xc8]
	ldr r2, _037F9190 ; =0x048080E0
	mov r0, #0xb
	strh r0, [r2]
	mov r0, #1
	strh r0, [r2, #-0xdc]
	strh r0, [r2, #8]
	strh r0, [r2, #0xa]
	mov r1, #0
	mov r0, #0x20
	strh r1, [r2, #-0x98]
	bl sub_037F9238
	b _037F9110
_037F90F4:
	ldr r0, _037F9164 ; =0x048081AE
	strh r3, [r2, #0xa]
	strh r3, [r0]
	mov r1, #1
	mov r0, #0x20
	strh r1, [r2, #-4]
	bl sub_037F9238
_037F9110:
	ldr r0, _037F9194 ; =0x04808048
	mov r1, #0
	strh r1, [r0]
	bl sub_027E9E94
	ldr r1, _037F9178 ; =0x048080AE
	mov r0, #2
	strh r0, [r1]
	ldrh r1, [r6, #0xe]
	cmp r1, #1
	bne _037F913C
	bl sub_027E9CB4
_037F913C:
	bl sub_037FB300
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F914C: .word 0x0380FFF4
_037F9150: .word 0x04808044
_037F9154: .word 0x04808032
_037F9158: .word 0x04808134
_037F915C: .word 0x0000FFFF
_037F9160: .word 0x04808030
_037F9164: .word 0x048081AE
_037F9168: .word 0x04808008
_037F916C: .word 0x0000703F
_037F9170: .word 0x00001FFF
_037F9174: .word 0x048080F6
_037F9178: .word 0x048080AE
_037F917C: .word 0x0000E0BF
_037F9180: .word 0x048081AA
_037F9184: .word 0x048080D0
_037F9188: .word 0x00000581
_037F918C: .word 0x00000181
_037F9190: .word 0x048080E0
_037F9194: .word 0x04808048
	arm_func_end sub_037F8DE0

	arm_func_start sub_037F9198
sub_037F9198: ; 0x037F9198
	stmdb sp!, {r4, lr}
	ldr r0, _037F9228 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x208
	add r0, r0, #0x400
	add r4, r1, #0x344
	bl sub_037FD5C0
	ldr r0, _037F9228 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_037FD5C0
	mov r0, #0x20
	bl sub_037F9238
	mov r1, #0
	strh r1, [r4, #0xa4]
	ldr r0, _037F922C ; =0x04808012
	strh r1, [r4, #0x12]
	strh r1, [r0]
	strh r1, [r0, #-0xe]
	strh r1, [r0, #0xd8]
	strh r1, [r0, #0xd6]
	strh r1, [r0, #-0xa]
	strh r1, [r0, #-8]
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _037F9208
	bl sub_027F11DC
_037F9208:
	ldr r1, _037F9230 ; =0x0000FFFF
	ldr r0, _037F9234 ; =0x048080AC
	strh r1, [r0]
	strh r1, [r0, #8]
	bl sub_027F0F08
	bl sub_027E8D44
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F9228: .word 0x0380FFF4
_037F922C: .word 0x04808012
_037F9230: .word 0x0000FFFF
_037F9234: .word 0x048080AC
	arm_func_end sub_037F9198

	arm_func_start sub_037F9238
sub_037F9238: ; 0x037F9238
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037F92D0 ; =0x0380FFF4
	mov r5, r0
	ldr r1, [r1]
	add r4, r1, #0x344
	ldrh r0, [r4, #8]
	cmp r0, r5
	beq _037F92C8
	cmp r0, #0x40
	bne _037F926C
	add r0, r1, #0x234
	add r0, r0, #0x400
	bl sub_037FD5C0
_037F926C:
	cmp r5, #0
	beq _037F9288
	cmp r5, #0x10
	beq _037F9290
	cmp r5, #0x40
	beq _037F92A8
	b _037F92C4
_037F9288:
	bl sub_027E9CF4
	b _037F92C4
_037F9290:
	ldr r0, _037F92D4 ; =0x04808040
	mov r1, #0
	strh r1, [r0]
	bl sub_037F9198
	bl sub_027E9D7C
	b _037F92C4
_037F92A8:
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _037F92B8
	bl sub_027E9EE0
_037F92B8:
	ldr r1, _037F92D8 ; =sub_027EAA6C
	mov r0, #0x64
	bl sub_027EA9BC
_037F92C4:
	strh r5, [r4, #8]
_037F92C8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F92D0: .word 0x0380FFF4
_037F92D4: .word 0x04808040
_037F92D8: .word sub_027EAA6C
	arm_func_end sub_037F9238

	arm_func_start sub_037F92DC
sub_037F92DC: ; 0x037F92DC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _037F93A8 ; =0x04808010
	mov r4, #1
_037F92E8:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	ands r6, r1, r0
	beq _037F9390
	tst r6, #0x80
	beq _037F9304
	bl sub_037FA21C
_037F9304:
	tst r6, #0x40
	beq _037F9310
	bl sub_037FA328
_037F9310:
	tst r6, #0x8000
	beq _037F931C
	bl sub_037F93B0
_037F931C:
	tst r6, #0x4000
	beq _037F9328
	bl sub_037F943C
_037F9328:
	tst r6, #0x2000
	beq _037F9334
	bl sub_037F96E0
_037F9334:
	tst r6, #0x800
	beq _037F9340
	bl sub_027EB830
_037F9340:
	tst r6, #8
	beq _037F934C
	bl sub_037F977C
_037F934C:
	tst r6, #4
	beq _037F9358
	bl sub_037F988C
_037F9358:
	tst r6, #1
	beq _037F9364
	bl sub_037F9C70
_037F9364:
	tst r6, #0x30
	beq _037F9370
	bl sub_037F974C
_037F9370:
	tst r6, #2
	beq _037F937C
	bl sub_037F9A08
_037F937C:
	tst r6, #0x1000
	beq _037F92E8
	mov r0, r4
	bl sub_037FA12C
	b _037F92E8
_037F9390:
	ldr r1, _037F93AC ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x1000000
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037F93A8: .word 0x04808010
_037F93AC: .word 0x0380FFF8
	arm_func_end sub_037F92DC

	arm_func_start sub_037F93B0
sub_037F93B0: ; 0x037F93B0
	stmdb sp!, {r4, lr}
	ldr r1, _037F9434 ; =0x0380FFF4
	ldr r0, _037F9438 ; =0x04808010
	ldr r2, [r1]
	mov r1, #0x8000
	strh r1, [r0]
	add r4, r2, #0x344
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	bne _037F9424
	ldrh r0, [r4, #0x7e]
	cmp r0, #0
	beq _037F9424
	ldrh r1, [r4, #0x72]
	ldrh r0, [r4, #0x70]
	cmp r1, r0
	bne _037F9424
	ldrh r0, [r4, #0x80]
	add r0, r0, #1
	strh r0, [r4, #0x80]
	ldrh r1, [r4, #0x80]
	ldrh r0, [r4, #0x7e]
	cmp r1, r0
	bls _037F9424
	mov r2, #0
	mov r0, #1
	mov r1, #0xd
	strh r2, [r4, #0x80]
	bl sub_037F8598
_037F9424:
	mov r0, #1
	strh r0, [r4, #0x10]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F9434: .word 0x0380FFF4
_037F9438: .word 0x04808010
	arm_func_end sub_037F93B0

	arm_func_start sub_037F943C
sub_037F943C: ; 0x037F943C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r6, _037F96C0 ; =0x0380FFF4
	ldr r2, _037F96C4 ; =0x04808010
	ldr r3, [r6]
	mov r0, #0x4000
	strh r0, [r2]
	add r4, r3, #0x344
	ldrh r1, [r4, #0xc]
	add r0, r3, #0x2c
	cmp r1, #1
	add r5, r3, #0x31c
	add r7, r0, #0x400
	beq _037F9484
	cmp r1, #2
	beq _037F9538
	cmp r1, #3
	beq _037F957C
	b _037F96B8
_037F9484:
	ldr r1, [r7, #0x80]
	ldrh r6, [r6, #-4]
	ldrh r0, [r4, #0x96]
	add r1, r1, #0x24
	add r8, r1, r0
	add r0, r8, #8
	and r1, r6, #0xff
	bl sub_027EAD24
	mov r1, r6, lsr #8
	add r0, r8, #9
	and r1, r1, #0xff
	bl sub_027EAD24
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _037F94D8
	ldr r1, _037F96C8 ; =0x04808134
	ldrh r2, [r5, #0x20]
	ldrh r0, [r1]
	add r0, r2, r0
	add r0, r0, #1
	strh r0, [r1]
_037F94D8:
	ldr r0, _037F96C0 ; =0x0380FFF4
	ldr r1, _037F96CC ; =0x048080B6
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r3, [r0, #0x2e]
	ldrh r2, [r0, #0x32]
	mvn r3, r3
	orr r2, r3, r2
	strh r2, [r0, #0x30]
	ldrh r0, [r1]
	tst r0, #0x18
	bne _037F9514
	and r0, r0, #6
	cmp r0, #2
	bne _037F9528
_037F9514:
	ldr r0, [r7, #0x8c]
	bic r0, r0, #2
	str r0, [r7, #0x8c]
	bl sub_037FA598
	b _037F96B8
_037F9528:
	ldr r0, [r7, #0x8c]
	orr r0, r0, #2
	str r0, [r7, #0x8c]
	b _037F96B8
_037F9538:
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	ldreq r1, _037F96D0 ; =0x0000FFFF
	addeq r0, r2, #0x124
	streqh r1, [r0]
	beq _037F9568
	add r1, r2, #0x124
	ldrh r2, [r5, #0x20]
	ldrh r0, [r1]
	add r0, r2, r0
	add r0, r0, #1
	strh r0, [r1]
_037F9568:
	ldrh r0, [r4, #0x1a]
	cmp r0, #2
	bne _037F957C
	mov r0, #2
	bl sub_027E9CB4
_037F957C:
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	movne r1, #1
	bne _037F95C8
	ldrh r0, [r4, #0x72]
	mov r1, #0
	cmp r0, #1
	ldrh r0, [r4, #0x14]
	moveq r1, #1
	cmp r0, #0
	beq _037F95C8
	ldrh r0, [r4, #0x76]
	cmp r0, #1
	beq _037F95C4
	cmp r0, #0
	ldreqh r0, [r4, #0x74]
	cmpeq r0, #1
	bne _037F95C8
_037F95C4:
	mov r1, #1
_037F95C8:
	cmp r1, #0
	ldr r1, _037F96D4 ; =0x04808038
	ldrneh r0, [r1]
	orrne r0, r0, #1
	strneh r0, [r1]
	ldreqh r0, [r1]
	biceq r0, r0, #1
	streqh r0, [r1]
	ldr r1, _037F96D8 ; =0x04808118
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
_037F9648:
	mul r1, r8, sl
	ldrh r0, [r7, r1]
	add sb, r7, r1
	cmp r0, #0
	beq _037F96A0
	ldr r0, [sb, #0xc]
	ldrh r1, [r0, #8]
	cmp r1, #0
	bne _037F96A0
	bl sub_027F027C
	cmp r0, #0
	beq _037F96A0
	mov r0, r8
	bl sub_027F0CD4
	ldr r1, [sb, #8]
	mov r0, r5
	strh r6, [r1]
	mov r1, r4
	bl sub_037F8598
	ldrh r0, [r7, #0xae]
	add r0, r0, #1
	strh r0, [r7, #0xae]
_037F96A0:
	add r8, r8, #1
	cmp r8, #2
	blo _037F9648
	ldr r0, _037F96DC ; =0x048080AE
	mov r1, #0xd
	strh r1, [r0]
_037F96B8:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037F96C0: .word 0x0380FFF4
_037F96C4: .word 0x04808010
_037F96C8: .word 0x04808134
_037F96CC: .word 0x048080B6
_037F96D0: .word 0x0000FFFF
_037F96D4: .word 0x04808038
_037F96D8: .word 0x04808118
_037F96DC: .word 0x048080AE
	arm_func_end sub_037F943C

	arm_func_start sub_037F96E0
sub_037F96E0: ; 0x037F96E0
	ldr r0, _037F9744 ; =0x0380FFF4
	ldr r1, _037F9748 ; =0x04808010
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
_037F9744: .word 0x0380FFF4
_037F9748: .word 0x04808010
	arm_func_end sub_037F96E0

	arm_func_start sub_037F974C
sub_037F974C: ; 0x037F974C
	stmdb sp!, {r3, lr}
	bl sub_027EA1AC
	ldr r1, _037F9774 ; =0x048081AC
	ldr r2, _037F9778 ; =0x0000FFFF
	sub r0, r1, #0x19c
	strh r2, [r1]
	mov r1, #0x30
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F9774: .word 0x048081AC
_037F9778: .word 0x0000FFFF
	arm_func_end sub_037F974C

	arm_func_start sub_037F977C
sub_037F977C: ; 0x037F977C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _037F9880 ; =0x04808010
	mov r2, #8
	ldr r0, _037F9884 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _037F97C4
	add r0, r1, #0x18c
	ldrh r0, [r0]
	tst r0, #1
	addeq r1, r1, #0x280
	ldreqh r0, [r1]
	eoreq r0, r0, #1
	streqh r0, [r1]
_037F97C4:
	ldr r0, _037F9884 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _037F9878
	ldr r4, _037F9888 ; =0x04808032
	add r0, r1, #0x2c
	mov r2, #0
	add r1, r1, #0x344
	add r3, r0, #0x400
	mov r5, r2
	mov lr, #0x8000
	mov ip, #0x14
_037F97FC:
	mul r6, r2, ip
	ldrh r0, [r3, r6]
	add r6, r3, r6
	cmp r0, #0
	beq _037F986C
	ldr r0, [r6, #8]
	ldrh r6, [r0, #0xc]
	tst r6, #0x4000
	beq _037F986C
	ldrh r6, [r0, #4]
	tst r6, #0xff
	beq _037F986C
	ldrh r6, [r0, #0xa]
	add r7, r0, #0xc
	add r6, r7, r6
	sub r6, r6, #7
	bic r7, r6, #1
	ldrh r6, [r7]
	cmp r6, #0
	ldreqh r6, [r7, #2]
	cmpeq r6, #0
	bne _037F986C
	strh r5, [r0, #4]
	strh r5, [r4]
	strh lr, [r4]
	ldrh r0, [r1, #0xba]
	add r0, r0, #1
	strh r0, [r1, #0xba]
_037F986C:
	add r2, r2, #1
	cmp r2, #3
	blo _037F97FC
_037F9878:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037F9880: .word 0x04808010
_037F9884: .word 0x0380FFF4
_037F9888: .word 0x04808032
	arm_func_end sub_037F977C

	arm_func_start sub_037F988C
sub_037F988C: ; 0x037F988C
	stmdb sp!, {r3, lr}
	ldr r1, _037F99EC ; =0x0380FFF4
	ldr ip, _037F99F0 ; =0x04808010
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
	beq _037F997C
	tst r1, #0x400
	beq _037F997C
	ldrh ip, [ip, #0xa0]
	tst ip, #1
	ldrneh r2, [r3]
	cmpne r2, #0
	bne _037F9938
	tst ip, #4
	ldrneh r2, [r3, #0x14]
	cmpne r2, #0
	bne _037F9938
	tst ip, #8
	ldrneh r2, [r3, #0x28]
	cmpne r2, #0
	bne _037F9938
	ldr r2, _037F99F4 ; =0x0480819C
	ldrh r2, [r2]
	tst r2, #1
	bne _037F9938
	ldr r3, _037F99F8 ; =0x04808032
	mov ip, #0
	strh ip, [r3]
	mov r2, #0x8000
	strh r2, [r3]
	strh ip, [r0, #2]
	b _037F997C
_037F9938:
	ldrh r3, [r0, #2]
	add r2, r3, #1
	strh r2, [r0, #2]
	cmp r3, #0xc
	bls _037F997C
	ldr r3, _037F99F8 ; =0x04808032
	mov r2, #0
	strh r2, [r0, #2]
	strh r2, [r3]
	mov r2, #0x8000
	ldr r0, _037F99EC ; =0x0380FFF4
	strh r2, [r3]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0xfe]
	add r2, r2, #1
	strh r2, [r0, #0xfe]
_037F997C:
	ldr r0, _037F99EC ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #1
	beq _037F99E4
	tst r1, #0x60
	beq _037F99E4
	ldr r2, _037F99FC ; =0x04808054
	ldrh r1, [r2]
	ldrh r0, [r2, #-2]
	sub r0, r0, #0x4000
	add r0, r0, r0, lsr #31
	cmp r1, r0, asr #1
	bge _037F99CC
	ldrh r0, [r2, #-4]
	sub r0, r0, #0x4000
	add r0, r0, r0, lsr #31
	cmp r1, r0, asr #1
	bge _037F99E0
_037F99CC:
	ldr r2, _037F9A00 ; =0x0480805A
	ldr r0, _037F9A04 ; =0x00008001
	ldrh r1, [r2]
	strh r1, [r2, #-4]
	strh r0, [r2, #-0x2a]
_037F99E0:
	bl sub_027EAF70
_037F99E4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F99EC: .word 0x0380FFF4
_037F99F0: .word 0x04808010
_037F99F4: .word 0x0480819C
_037F99F8: .word 0x04808032
_037F99FC: .word 0x04808054
_037F9A00: .word 0x0480805A
_037F9A04: .word 0x00008001
	arm_func_end sub_037F988C

	arm_func_start sub_037F9A08
sub_037F9A08: ; 0x037F9A08
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _037F9C50 ; =0x0380FFF4
	ldr r0, _037F9C54 ; =0x04808010
	ldr r2, [r3]
	mov r1, #2
	strh r1, [r0]
	ldr r3, [r3]
	add r2, r2, #0x2c
	add r3, r3, #0x300
	ldrh r3, [r3, #0x4c]
	add r4, r2, #0x400
	cmp r3, #0x12
	bne _037F9A44
	bl sub_027EF4C0
	b _037F9C48
_037F9A44:
	ldrh r2, [r0, #0xa8]
	and r5, r2, #0xf00
	cmp r5, #0x300
	beq _037F9A68
	cmp r5, #0x800
	beq _037F9A9C
	cmp r5, #0xb00
	beq _037F9AD8
	b _037F9BD4
_037F9A68:
	ldr r0, [r4, #0x8c]
	tst r0, #2
	beq _037F9A78
	bl sub_037FA598
_037F9A78:
	ldr r1, _037F9C50 ; =0x0380FFF4
	mov r0, #0
	ldr r3, [r1]
	mov r1, #8
	ldr r2, [r3, #0x558]
	add r2, r2, #1
	str r2, [r3, #0x558]
	bl sub_037F8598
	b _037F9BD4
_037F9A9C:
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
	b _037F9BD4
_037F9AD8:
	ldr r3, _037F9C58 ; =0x0000FFFF
	ldr r2, _037F9C5C ; =0x04805F70
	ldr r1, _037F9C60 ; =0x0480824E
	strh r3, [r2]
	strh r3, [r2, #2]
	add r0, r0, #0x23c
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _037F9B30
	ldr r1, [r4, #0x44]
	ldrh r0, [r1, #0x22]
	cmp r0, r3
	bne _037F9B30
	ldrh r0, [r1, #4]
	cmp r0, #0
	movne r0, #0
	strneh r0, [r1, #4]
	ldrneh r1, [r4, #0x98]
	ldrne r0, [r4, #0x44]
	strneh r1, [r0, #2]
_037F9B30:
	ldr r0, [r4, #0x44]
	ldr r2, [r4, #0x90]
	ldrh r1, [r0, #2]
	ldrh r0, [r4, #0x98]
	cmp r1, #1
	add r2, r2, #0x1a
	bls _037F9B80
	ldr r3, _037F9C50 ; =0x0380FFF4
	ldr r3, [r3]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1b
	movs r3, r3, lsr #0x1f
	beq _037F9B80
	ldr ip, _037F9C64 ; =0x0480819C
	ldrh r3, [ip]
	tst r3, #1
	ldreqh r3, [ip, #0xf4]
	eoreq r3, r3, #1
	streqh r3, [ip, #0xf4]
_037F9B80:
	ldr r3, _037F9C50 ; =0x0380FFF4
	ldr r3, [r3]
	add r3, r3, #0x600
	ldrh r3, [r3, #0x90]
	tst r3, #0x40
	beq _037F9BD4
	b _037F9BCC
_037F9B9C:
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
_037F9BCC:
	cmp r1, #1
	bhi _037F9B9C
_037F9BD4:
	cmp r5, #0x800
	beq _037F9C3C
	ldr r2, _037F9C68 ; =0x048080B0
	ldrh r0, [r2]
	tst r0, #2
	bne _037F9C3C
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _037F9C30
	mov r0, #2
	strh r0, [r2, #4]
	mov r1, #0
	strh r1, [r2, #-0x68]
	ldrh r1, [r2, #-0xa0]
	tst r1, #0x1000
	ldrneh r0, [r4, #0xac]
	addne r0, r0, #1
	strneh r0, [r4, #0xac]
	bne _037F9C24
	bl sub_037FA12C
_037F9C24:
	ldrh r0, [r4, #0xaa]
	add r0, r0, #1
	strh r0, [r4, #0xaa]
_037F9C30:
	ldr r0, _037F9C6C ; =0x048080AE
	mov r1, #2
	strh r1, [r0]
_037F9C3C:
	mov r0, #0
	mov r1, #0xe
	bl sub_037F8598
_037F9C48:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F9C50: .word 0x0380FFF4
_037F9C54: .word 0x04808010
_037F9C58: .word 0x0000FFFF
_037F9C5C: .word 0x04805F70
_037F9C60: .word 0x0480824E
_037F9C64: .word 0x0480819C
_037F9C68: .word 0x048080B0
_037F9C6C: .word 0x048080AE
	arm_func_end sub_037F9A08

	arm_func_start sub_037F9C70
sub_037F9C70: ; 0x037F9C70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	ldr r0, _037FA100 ; =0x0380FFF4
	ldr r2, _037FA104 ; =0x04808010
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
	ldr r0, _037FA108 ; =0x04808098
	sub fp, r0, #0x70
	add r0, r0, #0x1b4
	str r0, [sp, #0x24]
	ldr r0, _037FA10C ; =0x0480824E
	sub r0, r0, #0x154
	str r0, [sp, #0x14]
	ldr r0, _037FA108 ; =0x04808098
	sub r0, r0, #0x44
	str r0, [sp, #0x10]
	ldr r0, _037FA110 ; =0x000008EF
	sub r0, r0, #0x29
	str r0, [sp, #0x28]
	ldr r0, _037FA110 ; =0x000008EF
	add r0, r0, #0x3d
	str r0, [sp, #0x2c]
	ldr r0, _037FA114 ; =0x04805F7E
	sub r0, r0, #0x24
	str r0, [sp, #0x30]
	ldr r0, _037FA110 ; =0x000008EF
	add r0, r0, #0x710
	str r0, [sp, #0x34]
_037F9D0C:
	ldr r0, [sp, #0x10]
	ldrh sb, [r7, #4]
	ldrh sl, [r0]
	cmp sb, sl
	beq _037FA080
	ldr r0, _037FA108 ; =0x04808098
	ldr r1, [sp, #0x14]
	ldrh r0, [r0, #0x60]
	ldrh r3, [r1]
	ldr r1, _037FA108 ; =0x04808098
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
	blo _037F9D78
	ldr r0, _037FA110 ; =0x000008EF
	cmp sb, r0
	bhi _037F9D78
	bl sub_027EA1AC
_037F9D78:
	mov r0, sb, lsl #1
	str r0, [sp, #0x18]
	add r0, r0, #0x4000
	add r8, r0, #0x4800000
	add r0, r8, #2
	bl sub_037FA6C8
	mov r5, r0
	add r0, r5, #2
	bl sub_037FA6C8
	str r0, [sp, #0x1c]
	add r0, r0, #4
	bl sub_037FA6C8
	str r0, [sp, #0x20]
	add r0, r8, #0xe
	bl sub_037FA6C8
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
	bls _037F9E34
	ldr r0, _037FA118 ; =0x0000FFFF
	mov sb, sl
	strh r0, [r8]
	ldrh r0, [r6, #0xb4]
	add r0, r0, #1
	strh r0, [r6, #0xb4]
	b _037F9EBC
_037F9E34:
	cmp r4, #0
	cmpne sb, sl
	beq _037F9EBC
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
	bne _037F9E94
	cmp r0, #0xa
	cmpne r0, #0x14
	bne _037F9E94
	ldr r0, [sp, #0x34]
	cmp r1, r0
	bls _037F9EBC
_037F9E94:
	ldrh r0, [r6, #0xb4]
	ldr r1, _037FA118 ; =0x0000FFFF
	add r0, r0, #1
	strh r0, [r6, #0xb4]
	mov r0, sl, lsl #0x10
	strh r1, [r8]
	mov r0, r0, lsr #0x10
	strh r0, [r7, #4]
	strh r0, [r5]
	b _037FA080
_037F9EBC:
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, #0xc
	bne _037FA01C
	add r0, r8, #0xc
	bl sub_037FA6C8
	ldrh r0, [r0]
	str r0, [sp, #8]
	add r0, r8, #0x22
	bl sub_037FA6C8
	ldrh sl, [r0]
	ldrh r0, [r7]
	cmp r0, sl
	bne _037F9F20
	ldr r0, [sp, #8]
	tst r0, #0x800
	beq _037F9F20
	ldr r0, _037FA100 ; =0x0380FFF4
	ldr r1, [r0]
	ldr r0, [r1, #0x57c]
	add r0, r0, #1
	str r0, [r1, #0x57c]
	ldr r0, _037FA118 ; =0x0000FFFF
	strh r0, [r8]
	b _037F9FF4
_037F9F20:
	ldr r0, _037FA100 ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x300
	ldrh r2, [r1, #0x3a]
	mov r2, r2, lsl #0x18
	movs r2, r2, lsr #0x1f
	ldreqh r1, [r1, #0x4c]
	cmpeq r1, #0x40
	bne _037F9FF4
	ldrh r1, [fp]
	cmp r1, #0
	beq _037F9FCC
	ldr r1, _037FA108 ; =0x04808098
	ldrh r1, [r1]
	tst r1, #0x8000
	beq _037F9FCC
	add r0, r0, #0x660
	bl sub_037FD5C0
	ldr r0, [sp, #0xc]
	mov r3, #0
	ldrh r1, [r0]
	ldr r0, _037FA11C ; =0x000082EA
	mov r2, #0x3e8
	umull ip, r8, r1, r0
	mov r0, r3
	mla r8, r1, r0, r8
	mov r0, ip, lsr #6
	ldr r1, _037FA11C ; =0x000082EA
	mov ip, r3
	mla r8, ip, r1, r8
	mov r1, r8, lsr #6
	orr r0, r0, r8, lsl #26
	bl sub_03806B80
	mov r2, #0
	str r2, [sp]
	mov r2, r1
	mov r1, r0
	ldr r0, _037FA100 ; =0x0380FFF4
	ldr r3, _037FA120 ; =sub_027EA0BC
	ldr r0, [r0]
	add r0, r0, #0x660
	bl sub_037FD4DC
	b _037F9FF4
_037F9FCC:
	ldr r1, _037FA118 ; =0x0000FFFF
	ldr r0, _037FA114 ; =0x04805F7E
	mov sl, r1
	strh r1, [r0]
	ldr r0, [sp, #0x24]
	strh r1, [r0]
	ldr r0, _037FA10C ; =0x0480824E
	strh r1, [r0]
	mov r0, r1
	strh r0, [r8]
_037F9FF4:
	strh sl, [r7]
	bl sub_037FA6F0
	tst r0, #1
	beq _037FA06C
	ldr r0, _037FA100 ; =0x0380FFF4
	ldr r1, [r0]
	ldr r0, [r1, #0x5a8]
	add r0, r0, #1
	str r0, [r1, #0x5a8]
	b _037FA06C
_037FA01C:
	cmp r0, #0xd
	bne _037FA06C
	ldr r0, _037FA100 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3a]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	ldreqh r0, [r0, #0x4c]
	cmpeq r0, #0x40
	bne _037FA06C
	ldrh r0, [fp]
	cmp r0, #0
	beq _037FA064
	ldr r0, _037FA108 ; =0x04808098
	ldrh r0, [r0]
	tst r0, #0x8000
	bne _037FA06C
_037FA064:
	ldr r0, _037FA118 ; =0x0000FFFF
	strh r0, [r8]
_037FA06C:
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [r7, #4]
	strh r0, [r5]
	b _037F9D0C
_037FA080:
	cmp r4, #0
	beq _037FA0D4
	ldr r0, _037FA124 ; =0x04808054
	ldrh r4, [r0]
	bl sub_037FA6F0
	mov r0, r0, lsl #0x10
	movs r1, r0, lsr #0x10
	beq _037FA0D4
	ldr r0, _037FA124 ; =0x04808054
	ldrh r0, [r0]
	cmp r4, r0
	bne _037FA0D4
	tst r1, #2
	beq _037FA0C4
	mov r0, #0x80
	bl sub_027EB06C
	b _037FA0D4
_037FA0C4:
	tst r1, #1
	beq _037FA0D4
	mov r0, #0x100
	bl sub_027EB06C
_037FA0D4:
	ldr r0, _037FA128 ; =0x0480805A
	ldrh r1, [r0]
	ldrh r0, [r0, #-6]
	cmp r1, r0
	beq _037FA0F4
	mov r0, #0
	mov r1, #0xf
	bl sub_037F8598
_037FA0F4:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FA100: .word 0x0380FFF4
_037FA104: .word 0x04808010
_037FA108: .word 0x04808098
_037FA10C: .word 0x0480824E
_037FA110: .word 0x000008EF
_037FA114: .word 0x04805F7E
_037FA118: .word 0x0000FFFF
_037FA11C: .word 0x000082EA
_037FA120: .word sub_027EA0BC
_037FA124: .word 0x04808054
_037FA128: .word 0x0480805A
	arm_func_end sub_037F9C70

	arm_func_start sub_037FA12C
sub_037FA12C: ; 0x037FA12C
	stmdb sp!, {r3, lr}
	ldr ip, _037FA210 ; =0x0380FFF4
	ldr r2, _037FA214 ; =0x04808010
	ldr r1, [ip]
	mov r3, #0x1000
	add r1, r1, #0x2c
	strh r3, [r2]
	add r3, r1, #0x400
	ldrh r1, [r3, #0x3c]
	cmp r1, #0
	beq _037FA208
	ldr r1, [ip]
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #0x10
	cmpne r0, #0
	beq _037FA1FC
	add r0, r2, #0x204
	ldrh r1, [r2, #0xa6]
	ldrh r0, [r0]
	cmp r0, #3
	cmpne r0, #5
	bne _037FA1FC
	cmp r1, #0
	bne _037FA1FC
	ldr r3, [r3, #0x44]
	mov r2, #0
	ldrh r0, [r3, #2]
	b _037FA1B0
_037FA1A0:
	and r1, r0, #1
	mov r0, r0, lsl #0xf
	add r2, r2, r1
	mov r0, r0, lsr #0x10
_037FA1B0:
	cmp r0, #0
	bne _037FA1A0
	ldrh r0, [r3, #0x24]
	ldrh r1, [r3, #0xa]
	add r0, r0, #0xa
	mul r0, r2, r0
	add r0, r0, #0xc0
	add r0, r0, r1, lsl #2
	mov r0, r0, lsl #0x10
	ldr r1, _037FA218 ; =sub_037FA660
	mov r0, r0, lsr #0x10
	bl sub_027EAB5C
	ldr r0, _037FA210 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	b _037FA208
_037FA1FC:
	mov r0, #0
	mov r1, #0x10
	bl sub_037F8598
_037FA208:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA210: .word 0x0380FFF4
_037FA214: .word 0x04808010
_037FA218: .word sub_037FA660
	arm_func_end sub_037FA12C

	arm_func_start sub_037FA21C
sub_037FA21C: ; 0x037FA21C
	stmdb sp!, {r3, lr}
	ldr r3, _037FA318 ; =0x0380FFF4
	ldr r0, _037FA31C ; =0x04808010
	ldr r2, [r3]
	mov r1, #0x80
	strh r1, [r0]
	ldr r1, [r3]
	add r2, r2, #0x2c
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #0x20
	beq _037FA2B0
	add r1, r0, #0x204
	ldrh r3, [r1]
	add r1, r0, #0x258
	and r3, r3, #0xff
	ldrh ip, [r1]
	cmp r3, #3
	blo _037FA2B0
	cmp r3, #5
	bhi _037FA2B0
	ldr r3, [r2, #0x458]
	ldr r1, _037FA320 ; =0x00000FFF
	and r3, r1, r3, lsr #1
	cmp ip, r3
	blo _037FA2B0
	ldr r2, [r2, #0x430]
	and r1, r1, r2, lsr #1
	cmp ip, r1
	bhi _037FA2B0
	add r1, r0, #0x234
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_037FA2B0:
	ldr r1, _037FA324 ; =0x04808000
	ldrh r0, [r1]
	cmp r0, #0x1440
	beq _037FA310
	add r0, r1, #0x19c
	ldrh r0, [r0]
	and r0, r0, #0x42
	cmp r0, #0x42
	bne _037FA310
	add r1, r1, #0x2b8
	ldrh r2, [r1]
	cmp r2, #0
	beq _037FA310
	mov r3, #0
	b _037FA304
_037FA2EC:
	cmp r3, #0x3e8
	add r3, r3, #1
	bls _037FA304
	mov r0, #0x40
	bl sub_027EB06C
	b _037FA310
_037FA304:
	ldrh r0, [r1]
	cmp r2, r0
	beq _037FA2EC
_037FA310:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA318: .word 0x0380FFF4
_037FA31C: .word 0x04808010
_037FA320: .word 0x00000FFF
_037FA324: .word 0x04808000
	arm_func_end sub_037FA21C

	arm_func_start sub_037FA328
sub_037FA328: ; 0x037FA328
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _037FA57C ; =0x0380FFF4
	ldr r0, _037FA580 ; =0x04808010
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
	beq _037FA574
	ldrh r2, [r5, #0xa4]
	ldr r1, _037FA584 ; =0x0000FFFF
	cmp r2, r1
	addeq r2, r0, #0x18c
	ldreqh r2, [r2]
	andeq r2, r2, #3
	cmpeq r2, #3
	bne _037FA574
	add r2, r0, #0x258
	ldrh r3, [r2]
	ldrh r2, [r0, #0x40]
	sub r1, r1, #0xf000
	and r1, r1, r2, lsr #1
	cmp r3, r1
	blt _037FA574
	ldrh r7, [r0, #0x44]
	mov r0, r7, lsl #1
	add r0, r0, #0x4000
	add r0, r0, #0x4800000
	add r0, r0, #8
	bl sub_037FA6C8
	add r0, r0, #4
	bl sub_037FA6C8
	ldrh r2, [r0]
	ldr r1, _037FA588 ; =0x0000E7FF
	and r1, r2, r1
	cmp r1, #0x228
	bne _037FA574
	add r0, r0, #2
	bl sub_037FA6C8
	ldr r2, _037FA58C ; =0x048080F8
	ldrh r1, [r2]
	sub r6, r1, #0x10000
	add r1, r2, #0x170
_037FA3E8:
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
	bhi _037FA430
	ldrh r3, [r2]
	sub r3, r3, r6
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0x40
	bhi _037FA574
	b _037FA3E8
_037FA430:
	add r0, r0, #8
	mov r8, #0
	b _037FA458
_037FA43C:
	bl sub_037FA6C8
	add r1, r4, r8, lsl #1
	ldrh r2, [r0], #2
	ldrh r1, [r1, #0x64]
	cmp r2, r1
	bne _037FA574
	add r8, r8, #1
_037FA458:
	cmp r8, #3
	blo _037FA43C
	add r0, r0, #0xa
	bl sub_037FA6C8
	ldr r3, _037FA58C ; =0x048080F8
	add r1, r3, #0x170
_037FA470:
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
	bhi _037FA4B8
	ldrh r2, [r3]
	sub r2, r2, r6
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #0x70
	bhi _037FA574
	b _037FA470
_037FA4B8:
	ldr r2, _037FA590 ; =0x04808028
	ldrh r3, [r0]
	ldrh r0, [r2]
	mov r1, #1
	tst r3, r1, lsl r0
	bne _037FA574
	ldrh r1, [r2, #0x70]
	mov r0, #0x40
	strh r1, [r5, #0xa4]
	strh r0, [r2, #0x8c]
	ldrh r0, [r4, #0xbe]
	add r1, r2, #0x174
	add r0, r0, #1
	strh r0, [r4, #0xbe]
_037FA4F0:
	ldrh r0, [r1]
	and r0, r0, #3
	cmp r0, #3
	beq _037FA4F0
	ldr r0, _037FA594 ; =0x04808244
	mov r2, #8
	ldrh r1, [r0]
	sub r3, r0, #0x1c
	orr r1, r1, #0x40
	strh r1, [r0]
	ldrh r4, [r0]
	ldr r1, _037FA57C ; =0x0380FFF4
	bic r4, r4, #0x40
	strh r4, [r0]
	strh r2, [r3]
	mov r2, #0
	strh r2, [r3]
	ldr r1, [r1]
	ldr r2, _037FA584 ; =0x0000FFFF
	add r1, r1, #0x2c
	add r6, r1, #0x400
	ldrh r5, [r6, #0xa4]
	cmp r5, r2
	beq _037FA574
	sub r4, r0, #0x1b0
	ldrh r3, [r4]
	sub r1, r0, #0x214
	strh r5, [r4]
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	strh r3, [r4]
	strh r2, [r6, #0xa4]
_037FA574:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FA57C: .word 0x0380FFF4
_037FA580: .word 0x04808010
_037FA584: .word 0x0000FFFF
_037FA588: .word 0x0000E7FF
_037FA58C: .word 0x048080F8
_037FA590: .word 0x04808028
_037FA594: .word 0x04808244
	arm_func_end sub_037FA328

	arm_func_start sub_037FA598
sub_037FA598: ; 0x037FA598
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FA65C ; =0x0380FFF4
	mov r0, #2
	ldr r1, [r1]
	mov r5, #0
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_027F0CD4
	mov r0, #1
	bl sub_027F0CD4
	mov r0, r5
	bl sub_027F0CD4
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _037FA5EC
	ldr r0, [r4, #0x30]
	ldrh r0, [r0]
	cmp r0, #0
	movne r5, #1
	moveq r0, r5
	streqh r0, [r4, #0x28]
_037FA5EC:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _037FA610
	ldr r0, [r4, #0x1c]
	ldrh r0, [r0]
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4, #0x14]
	movne r5, #1
_037FA610:
	ldrh r0, [r4]
	cmp r0, #0
	beq _037FA634
	ldr r0, [r4, #8]
	ldrh r0, [r0]
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4]
	movne r5, #1
_037FA634:
	cmp r5, #0
	beq _037FA648
	mov r0, #0
	mov r1, #0xe
	bl sub_037F8598
_037FA648:
	mov r0, #0
	mov r1, #0x14
	bl sub_037F8598
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA65C: .word 0x0380FFF4
	arm_func_end sub_037FA598

	arm_func_start sub_037FA660
sub_037FA660: ; 0x037FA660
	stmdb sp!, {r4, lr}
	mov r0, #0x1000000
	bl sub_037FB928
	ldr r2, _037FA6C0 ; =0x04808210
	mov r1, #0x1000
	ldrh r3, [r2]
	mov r4, r0
	strh r1, [r2, #0x34]
	mov r1, #0x64
	b _037FA698
_037FA688:
	ldrh r0, [r2]
	cmp r3, r0
	bne _037FA6A0
	sub r1, r1, #1
_037FA698:
	cmp r1, #0
	bne _037FA688
_037FA6A0:
	ldr r1, _037FA6C4 ; =0x04808244
	mov r0, #0
	strh r0, [r1]
	bl sub_037FA12C
	mov r0, r4
	bl sub_037FB8F0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FA6C0: .word 0x04808210
_037FA6C4: .word 0x04808244
	arm_func_end sub_037FA660

	arm_func_start sub_037FA6C8
sub_037FA6C8: ; 0x037FA6C8
	ldr r1, _037FA6E8 ; =0x04805F60
	cmp r0, r1
	ldrhs r1, _037FA6EC ; =0x0380FFF4
	ldrhs r1, [r1]
	addhs r1, r1, #0x300
	ldrhsh r1, [r1, #0xde]
	subhs r0, r0, r1
	bx lr
	.align 2, 0
_037FA6E8: .word 0x04805F60
_037FA6EC: .word 0x0380FFF4
	arm_func_end sub_037FA6C8

	arm_func_start sub_037FA6F0
sub_037FA6F0: ; 0x037FA6F0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _037FA724 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x2c
	add r5, r0, #0x400
	add r0, r5, #0x50
	bl sub_027EB844
	mov r4, r0
	add r0, r5, #0x64
	bl sub_027EB844
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FA724: .word 0x0380FFF4
	arm_func_end sub_037FA6F0

	arm_func_start sub_037FA728
sub_037FA728: ; 0x037FA728
	stmdb sp!, {r3, lr}
	ldr r0, _037FA770 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xe8]
	cmp r0, #0
	beq _037FA748
	bl sub_027F1578
_037FA748:
	ldr r0, _037FA770 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	beq _037FA768
	bl sub_027EDF34
_037FA768:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FA770: .word 0x0380FFF4
	arm_func_end sub_037FA728

	arm_func_start sub_037FA774
sub_037FA774: ; 0x037FA774
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, _037FA940 ; =0x0380FFF4
	mov sl, #2
	ldr r1, [r7]
	mov fp, #0
	add r0, r1, #0x2c
	add r8, r0, #0x400
	ldr r0, _037FA944 ; =0x04808032
	add r6, r1, #0x344
	add r4, r0, #0x6e
_037FA79C:
	mov r0, #0x14
	mov r5, sl, lsl #2
	mla sb, sl, r0, r8
	add r0, r5, #0x4800000
	add r0, r0, #0x8000
	ldrh r0, [r0, #0xa0]
	tst r0, #0x8000
	bne _037FA930
	ldrh r0, [sb]
	cmp r0, #0
	beq _037FA930
	ldr r1, [sb, #0xc]
	cmp r1, #0
	beq _037FA910
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
	beq _037FA8DC
	ldr r1, [r7]
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #8
	beq _037FA8C0
	ldrh r1, [r0, #0xa]
	add r2, r0, #0xc
	add r1, r2, r1
	sub r1, r1, #7
	bic r2, r1, #1
	ldrh r1, [r2]
	cmp r1, #0
	ldreqh r1, [r2, #2]
	cmpeq r1, #0
	bne _037FA8C0
	ldr r0, _037FA944 ; =0x04808032
	mov r1, #0x8000
	strh fp, [r0]
	strh r1, [r0]
	ldrh r0, [r6, #0xba]
	add r0, r0, #1
	strh r0, [r6, #0xba]
	ldr r0, [sb, #0xc]
	bl sub_027F027C
	cmp r0, #0
	beq _037FA8A4
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
_037FA8A0:
	b _037FA930
_037FA8A4:
	ldr r1, [sb, #0xc]
	mov r0, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, r4]
	orr r0, r0, #0x8000
	strh r0, [r5, r4]
	b _037FA930
_037FA8C0:
	ldrh r0, [r0, #4]
	ldr r2, [sb, #0xc]
	and r0, r0, #0xff
	ldrh r1, [r2, #0xc]
	add r0, r1, r0
	strh r0, [r2, #0xc]
	b _037FA8EC
_037FA8DC:
	ldrh r1, [r0, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, #0xff
	strh r1, [r0, #0xc]
_037FA8EC:
	ldrh r0, [sb, #4]
	mov r1, #2
	add r0, r0, #1
	strh r0, [sb, #4]
	ldr r0, [sb, #0xc]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
_037FA90C:
	b _037FA930
_037FA910:
	ldrh r0, [sb, #4]
	mov r1, #3
	add r0, r0, #1
	strh r0, [sb, #4]
	ldr r0, [sb, #8]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
_037FA930:
	subs sl, sl, #1
	bpl _037FA79C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FA940: .word 0x0380FFF4
_037FA944: .word 0x04808032
	arm_func_end sub_037FA774

	arm_func_start sub_037FA948
sub_037FA948: ; 0x037FA948
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _037FAC98 ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0xdc
	add r5, r0, #0x400
_037FA95C:
	ldr r1, _037FAC9C ; =0x0480805A
	ldrh r0, [r5, #4]
	ldrh r6, [r1]
	cmp r6, r0
	beq _037FAC90
	ldr r0, _037FACA0 ; =0x000008C6
	cmp r6, r0
	blo _037FA980
	bl sub_027EA1AC
_037FA980:
	mov r6, r6, lsl #1
	add r0, r6, #0x4000
	add r7, r0, #0x4800000
	add r0, r7, #2
	bl sub_037FA6C8
	add r1, r6, #0x4800000
	add r1, r1, #0x4000
	ldrh r2, [r1]
	ldr r1, _037FACA4 ; =0x0000FFFF
	ldrh r6, [r0]
	cmp r2, r1
	ldreq r0, _037FAC9C ; =0x0480805A
	streqh r6, [r0]
	beq _037FA95C
	add r0, r7, #8
	bl sub_037FA6C8
	ldrh r1, [r0]
	mov r0, r7
	bl sub_037FAE50
	ldr r1, _037FAC9C ; =0x0480805A
	movs r8, r0
	strh r6, [r1]
	bne _037FAA04
	ldrh r0, [r7]
	and r0, r0, #0xf
	cmp r0, #0xc
	bne _037FA9F8
	mov r0, #0x10
	bl sub_027EB06C
	b _037FA95C
_037FA9F8:
	mov r0, #8
	bl sub_027EB06C
	b _037FA95C
_037FAA04:
	ldr r0, _037FAC98 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _037FAA2C
	ldrh r0, [r8, #0x14]
	tst r0, #0x4000
	movne r0, #0
	strneh r0, [r5, #2]
_037FAA2C:
	ldrh r0, [r8, #8]
	mov r6, #1
	tst r0, #0x200
	beq _037FAA84
	ldrh r0, [r8, #0x14]
	mov r0, r0, lsl #0x15
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	beq _037FAA60
	ldrh r0, [r8, #0x2a]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	beq _037FAC30
_037FAA60:
	add r0, r4, #0x188
	add r1, r4, #0x1e8
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_037F8988
	mov r0, #2
	mov r1, #9
	bl sub_037F8598
	b _037FAC30
_037FAA84:
	and r0, r0, #0xf
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _037FAC30
_037FAA94: ; jump table
	b _037FAB20 ; case 0
	b _037FAB08 ; case 1
	b _037FAC30 ; case 2
	b _037FAC30 ; case 3
	b _037FAC30 ; case 4
	b _037FAB50 ; case 5
	b _037FAC30 ; case 6
	b _037FAC30 ; case 7
	b _037FAAD4 ; case 8
	b _037FAC30 ; case 9
	b _037FAC30 ; case 10
	b _037FAC30 ; case 11
	b _037FABA8 ; case 12
	b _037FABFC ; case 13
	b _037FAB88 ; case 14
	b _037FAB88 ; case 15
_037FAAD4:
	ldrh r0, [r8, #0x14]
	and r0, r0, #0xf
	cmp r0, #8
	bne _037FAC30
	add r0, r4, #0x188
	add r1, r4, #0x1c4
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_037F8988
	mov r0, #2
	mov r1, #6
	bl sub_037F8598
	b _037FAC30
_037FAB08:
	ldrh r0, [r8, #0x14]
	cmp r0, #0x80
	bne _037FAC30
	mov r0, r8
	bl sub_027F2840
	b _037FAC30
_037FAB20:
	ldrh r0, [r8, #0x14]
	tst r0, #0xf
	bne _037FAC30
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_037F8988
	mov r0, #1
	mov r1, #7
	bl sub_037F8598
	b _037FAC30
_037FAB50:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0xa4
	bne _037FAC30
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_037F8988
	mov r0, #1
	mov r1, #7
	bl sub_037F8598
	b _037FAC30
_037FAB88:
	ldrh r1, [r8, #0x14]
	ldr r0, _037FACA8 ; =0x0000E7BF
	and r0, r1, r0
	cmp r0, #0x118
	bne _037FAC30
	mov r0, r8
	bl sub_027F25C0
	b _037FAC30
_037FABA8:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0x228
	bne _037FAC30
	ldr r0, _037FAC98 ; =0x0380FFF4
	ldr r1, _037FAC98 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x54]
	cmp r0, #0
	ldreq r0, _037FACAC ; =0x0480803C
	streqh r6, [r0]
	ldr r2, [r1]
	mov r0, r8
	ldr r1, [r2, #0x5ac]
	add r1, r1, #1
	str r1, [r2, #0x5ac]
	bl sub_027F2444
	mov r6, r0
	b _037FAC30
_037FABFC:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0x218
	bne _037FAC30
	ldr r1, _037FAC98 ; =0x0380FFF4
	mov r0, r8
	ldr r2, [r1]
	ldr r1, [r2, #0x5b0]
	add r1, r1, #1
	str r1, [r2, #0x5b0]
	bl sub_027F276C
	mov r6, r0
_037FAC30:
	cmp r6, #0
	beq _037FAC44
	add r0, r4, #0x188
	sub r1, r8, #0x10
	bl sub_037F8908
_037FAC44:
	ldr r3, _037FAC98 ; =0x0380FFF4
	ldr r0, [r3]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #1
	beq _037FA95C
	ldr r2, _037FACA4 ; =0x0000FFFF
	ldr r1, _037FACB0 ; =0x04805F60
	mov r6, #0
_037FAC68:
	cmp r7, r1
	ldrhs r0, [r3]
	add r6, r6, #1
	addhs r0, r0, #0x300
	ldrhsh r0, [r0, #0xde]
	subhs r7, r7, r0
	cmp r6, #7
	strh r2, [r7], #2
	blo _037FAC68
	b _037FA95C
_037FAC90:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FAC98: .word 0x0380FFF4
_037FAC9C: .word 0x0480805A
_037FACA0: .word 0x000008C6
_037FACA4: .word 0x0000FFFF
_037FACA8: .word 0x0000E7BF
_037FACAC: .word 0x0480803C
_037FACB0: .word 0x04805F60
	arm_func_end sub_037FA948

	arm_func_start sub_037FACB4
sub_037FACB4: ; 0x037FACB4
	stmdb sp!, {r4, lr}
	ldr r0, _037FAD8C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x2c
	add r4, r0, #0x400
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _037FAD84
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x44]
	ldrh r1, [r1, #0x10]
	ldrh r0, [r0, #2]
	cmp r1, r0
	beq _037FACF0
	bl sub_037FA948
_037FACF0:
	ldr r0, [r4, #0x44]
	ldrh r0, [r0, #4]
	ands r2, r0, #0xff
	ldr r0, _037FAD8C ; =0x0380FFF4
	ldrne r1, [r0]
	ldrne r0, [r1, #0x5a0]
	addne r0, r0, r2
	ldreq r1, [r0]
	ldreq r0, [r1, #0x5a0]
	addeq r0, r0, #1
	str r0, [r1, #0x5a0]
	ldrh r1, [r4, #0x40]
	ldr r0, _037FAD8C ; =0x0380FFF4
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
	beq _037FAD70
	bl sub_027E9E94
_037FAD70:
	ldr r0, _037FAD8C ; =0x0380FFF4
	ldr r1, [r4, #0x90]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_037F8D58
_037FAD84:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FAD8C: .word 0x0380FFF4
	arm_func_end sub_037FACB4

	arm_func_start sub_037FAD90
sub_037FAD90: ; 0x037FAD90
	stmdb sp!, {r4, lr}
	ldr r0, _037FAE44 ; =0x0380FFF4
	ldr r2, _037FAE48 ; =0x04808088
	ldr r1, [r0]
	ldrh r0, [r2]
	add r4, r1, #0x17c
	cmp r0, #0
	bne _037FADD0
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _037FADD0
	mov r1, #8
	mov r0, #2
	strh r1, [r2, #0x26]
	bl sub_027EFEF4
	b _037FAE3C
_037FADD0:
	add r0, r1, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _037FAE08
	ldr r0, _037FAE4C ; =0x048080AE
	mov r1, #8
	strh r1, [r0]
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _037FAE08
	mov r0, #2
	bl sub_027EFEF4
_037FAE08:
	ldr r0, _037FAE4C ; =0x048080AE
	mov r1, #5
	strh r1, [r0]
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _037FAE28
	mov r0, #1
	bl sub_027EFEF4
_037FAE28:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _037FAE3C
	mov r0, #0
	bl sub_027EFEF4
_037FAE3C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FAE44: .word 0x0380FFF4
_037FAE48: .word 0x04808088
_037FAE4C: .word 0x048080AE
	arm_func_end sub_037FAD90

	arm_func_start sub_037FAE50
sub_037FAE50: ; 0x037FAE50
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _037FAEBC ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	add r1, r5, #0x22
	bl sub_037F886C
	movs r4, r0
	moveq r0, #0
	beq _037FAEB4
	mov r1, r6
	add r0, r4, #0x18
	add r2, r5, #0xc
	bl sub_027EAC00
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
_037FAEB4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FAEBC: .word 0x0380FFF4
	arm_func_end sub_037FAE50

	arm_func_start sub_037FAEC0
sub_037FAEC0: ; 0x037FAEC0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _037FB190 ; =0x0380FFF4
	mov r0, #0
	ldr r7, [r1]
	mov r2, #0xb0
	add r1, r7, #0x2c
	add r4, r1, #0x400
	mov r1, r4
	add r5, r7, #0x344
	add r6, r7, #0x31c
	bl sub_037FDFD0
	add r0, r7, #0x400
	mov r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r4, #0xc]
	strh r1, [r4, #0x14]
	str r1, [r4, #0x20]
	strh r1, [r4, #0x28]
	ldr r0, _037FB194 ; =0x0000FFFF
	str r1, [r4, #0x34]
	strh r0, [r4, #0xa2]
	strh r0, [r4, #0xa4]
	ldrh r0, [r5, #0xc]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _037FB174
_037FAF28: ; jump table
	b _037FAF38 ; case 0
	b _037FAFB4 ; case 1
	b _037FB050 ; case 2
	b _037FB0FC ; case 3
_037FAF38:
	ldr r7, _037FB198 ; =0x04804170
	ldr r0, _037FB19C ; =0x04804026
	str r7, [r4, #8]
	sub r1, r7, #0x148
	str r1, [r4, #0x1c]
	sub r2, r7, #0x170
	ldr r1, _037FB1A0 ; =sub_027F02FC
	str r2, [r4, #0x30]
	ldr r2, _037FB1A4 ; =sub_027F0478
	str r1, [r4, #0x10]
	ldr r1, _037FB1A8 ; =sub_027F0944
	str r2, [r4, #0x24]
	ldr r3, _037FB1AC ; =0x0000B6B8
	str r1, [r4, #0x38]
	sub r1, r7, #0x14c
	ldr r2, _037FB1B0 ; =0x00001D46
	strh r3, [r1]
	strh r2, [r0]
	strh r3, [r7, #-4]
	add r0, r0, #0x148
	strh r2, [r0]
	add r1, r7, #0x620
	ldr r0, _037FB1B4 ; =0x04804792
	strh r3, [r1]
	strh r2, [r0]
	mov r1, #8
	ldr r0, _037FB1B8 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #1
	strh r1, [r0]
	b _037FB174
_037FAFB4:
	ldr r3, _037FB1BC ; =0x04804AA0
	ldr r2, _037FB1C0 ; =0x04804334
	str r3, [r4, #8]
	sub r0, r3, #0x148
	str r0, [r4, #0x1c]
	ldr r0, _037FB1A0 ; =sub_027F02FC
	str r2, [r4, #0x30]
	ldr r1, _037FB1A4 ; =sub_027F0478
	str r0, [r4, #0x10]
	ldr r0, _037FB1C4 ; =sub_027F09AC
	str r1, [r4, #0x24]
	ldr ip, _037FB1C8 ; =0x04804956
	str r0, [r4, #0x38]
	sub r1, r2, #0xfc
	str r1, [r4, #0x80]
	sub r7, r2, #0x334
	ldr r0, _037FB1AC ; =0x0000B6B8
	str r7, [r4, #0x44]
	sub r7, r2, #0x100
	ldr lr, _037FB1B0 ; =0x00001D46
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
	ldr r2, _037FB1CC ; =0x048050C2
	strh r0, [r3]
	strh lr, [r2]
	mov r0, #0x208
	strh r0, [r5, #0x8a]
	str r1, [r4, #0x80]
	bl sub_027F1204
	b _037FB174
_037FB050:
	ldr r1, _037FB1D0 ; =0x048045D8
	ldr r3, _037FB1D4 ; =0x04804232
	str r1, [r4, #8]
	sub r0, r1, #0x148
	str r0, [r4, #0x1c]
	sub r2, r1, #0x170
	ldr ip, _037FB1D8 ; =0x04804000
	ldr r0, _037FB1A0 ; =sub_027F02FC
	str r2, [r4, #0x30]
	ldr r2, _037FB1A4 ; =sub_027F0478
	str r0, [r4, #0x10]
	ldr r0, _037FB1A8 ; =sub_027F0944
	str r2, [r4, #0x24]
	str r0, [r4, #0x38]
	str ip, [r4, #0x58]
	add r2, ip, #0x234
	ldr r0, _037FB1AC ; =0x0000B6B8
	str r2, [r4, #0x6c]
	add r2, ip, #0x230
	ldr r4, _037FB1B0 ; =0x00001D46
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
	ldr r1, _037FB1DC ; =0x04804BFA
	strh r0, [r2]
	strh r4, [r1]
	mov r1, #0x108
	ldr r0, _037FB1B8 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #0xd
	strh r1, [r0]
	b _037FB174
_037FB0FC:
	ldr ip, _037FB198 ; =0x04804170
	ldr r0, _037FB19C ; =0x04804026
	str ip, [r4, #8]
	sub r1, ip, #0x148
	str r1, [r4, #0x1c]
	sub r2, ip, #0x170
	ldr r1, _037FB1A0 ; =sub_027F02FC
	str r2, [r4, #0x30]
	ldr r2, _037FB1A4 ; =sub_027F0478
	str r1, [r4, #0x10]
	ldr r1, _037FB1A8 ; =sub_027F0944
	str r2, [r4, #0x24]
	ldr r3, _037FB1AC ; =0x0000B6B8
	str r1, [r4, #0x38]
	sub r1, ip, #0x14c
	ldr r2, _037FB1B0 ; =0x00001D46
	strh r3, [r1]
	strh r2, [r0]
	strh r3, [ip, #-4]
	add r0, r0, #0x148
	strh r2, [r0]
	add r1, ip, #0x620
	ldr r0, _037FB1B4 ; =0x04804792
	strh r3, [r1]
	strh r2, [r0]
	mov r1, #0x108
	ldr r0, _037FB1B8 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #0xd
	strh r1, [r0]
_037FB174:
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	ldrneh r0, [r5, #0x8a]
	orrne r0, r0, #0x4000
	strneh r0, [r5, #0x8a]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FB190: .word 0x0380FFF4
_037FB194: .word 0x0000FFFF
_037FB198: .word 0x04804170
_037FB19C: .word 0x04804026
_037FB1A0: .word sub_027F02FC
_037FB1A4: .word sub_027F0478
_037FB1A8: .word sub_027F0944
_037FB1AC: .word 0x0000B6B8
_037FB1B0: .word 0x00001D46
_037FB1B4: .word 0x04804792
_037FB1B8: .word 0x048080AE
_037FB1BC: .word 0x04804AA0
_037FB1C0: .word 0x04804334
_037FB1C4: .word sub_027F09AC
_037FB1C8: .word 0x04804956
_037FB1CC: .word 0x048050C2
_037FB1D0: .word 0x048045D8
_037FB1D4: .word 0x04804232
_037FB1D8: .word 0x04804000
_037FB1DC: .word 0x04804BFA
	arm_func_end sub_037FAEC0

	arm_func_start sub_037FB1E0
sub_037FB1E0: ; 0x037FB1E0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _037FB2D8 ; =0x0380FFF4
	mov r0, #0
	ldr r3, [r1]
	mov r2, #0x50
	add r1, r3, #0xdc
	add r5, r1, #0x400
	mov r1, r5
	add r4, r3, #0x344
	bl sub_037FDFD0
	ldr r1, _037FB2DC ; =0x04808030
	mov r2, #0x8000
	ldr r0, _037FB2D8 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _037FB25C
_037FB230: ; jump table
	b _037FB240 ; case 0
	b _037FB248 ; case 1
	b _037FB250 ; case 2
	b _037FB258 ; case 3
_037FB240:
	ldr r6, _037FB2E0 ; =0x00000794
	b _037FB25C
_037FB248:
	ldr r6, _037FB2E4 ; =0x000010C4
	b _037FB25C
_037FB250:
	ldr r6, _037FB2E8 ; =0x00000BFC
	b _037FB25C
_037FB258:
	ldr r6, _037FB2E0 ; =0x00000794
_037FB25C:
	ldr r3, _037FB2EC ; =0x04808050
	add r0, r6, #0x4000
	ldr r1, _037FB2F0 ; =0x00005F60
	add r2, r0, #0x4800000
	mov r0, r6, lsl #0xf
	strh r2, [r3]
	mov r0, r0, lsr #0x10
	strh r0, [r3, #6]
	strh r1, [r3, #2]
	strh r0, [r3, #0xa]
	ldr r2, _037FB2F4 ; =0x0000FFFF
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
	ldr r1, _037FB2F8 ; =0x0480824E
	strh r2, [r0]
	ldr r0, _037FB2FC ; =0x04805F70
	strh r2, [r1]
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #0xe]
	strh r2, [r0, #6]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FB2D8: .word 0x0380FFF4
_037FB2DC: .word 0x04808030
_037FB2E0: .word 0x00000794
_037FB2E4: .word 0x000010C4
_037FB2E8: .word 0x00000BFC
_037FB2EC: .word 0x04808050
_037FB2F0: .word 0x00005F60
_037FB2F4: .word 0x0000FFFF
_037FB2F8: .word 0x0480824E
_037FB2FC: .word 0x04805F70
	arm_func_end sub_037FB1E0

	arm_func_start sub_037FB300
sub_037FB300: ; 0x037FB300
	ldr r1, _037FB328 ; =0x0480819C
	mov r2, #0xfa0
	b _037FB31C
_037FB30C:
	ldrh r0, [r1]
	tst r0, #0x80
	bxne lr
	sub r2, r2, #1
_037FB31C:
	cmp r2, #0
	bne _037FB30C
	bx lr
	.align 2, 0
_037FB328: .word 0x0480819C
	arm_func_end sub_037FB300

	arm_func_start sub_037FB32C
sub_037FB32C: ; 0x037FB32C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r2, _037FB3AC ; =0x000082EA
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
	bl sub_03806B80
	add r3, sp, #4
	str r3, [sp]
	ldr r2, _037FB3B0 ; =0x0380FFF4
	mov r3, r5
	ldr r2, [r2]
	add ip, r2, #0x234
	mov r2, r1
	mov r1, r0
	add r0, ip, #0x400
	bl sub_037FD4DC
_037FB394:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _037FB394
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB3AC: .word 0x000082EA
_037FB3B0: .word 0x0380FFF4
	arm_func_end sub_037FB32C

	arm_func_start sub_037FB3B4
sub_037FB3B4: ; 0x037FB3B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FB418 ; =0x04808028
	ldr lr, _037FB41C ; =0x04000208
	mov r5, #1
	add r2, r1, #0x1ec
	add r3, r1, #0x174
	mov ip, #0
	b _037FB408
_037FB3D4:
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
_037FB408:
	cmp r5, #0
	bne _037FB3D4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB418: .word 0x04808028
_037FB41C: .word 0x04000208
	arm_func_end sub_037FB3B4

	arm_func_start sub_037FB420
sub_037FB420: ; 0x037FB420
	ldr r1, _037FB450 ; =0x0480815E
	mov r2, #0
	b _037FB440
_037FB42C:
	ldrh r0, [r1]
	tst r0, #1
	moveq r0, #0
	bxeq lr
	add r2, r2, #1
_037FB440:
	cmp r2, #0x2800
	blo _037FB42C
	mov r0, #1
	bx lr
	.align 2, 0
_037FB450: .word 0x0480815E
	arm_func_end sub_037FB420

	arm_func_start sub_037FB454
sub_037FB454: ; 0x037FB454
	ldr r1, _037FB484 ; =0x04808180
	mov r2, #0
	b _037FB474
_037FB460:
	ldrh r0, [r1]
	tst r0, #1
	moveq r0, #0
	bxeq lr
	add r2, r2, #1
_037FB474:
	cmp r2, #0x2800
	blo _037FB460
	mov r0, #1
	bx lr
	.align 2, 0
_037FB484: .word 0x04808180
	arm_func_end sub_037FB454

	arm_func_start sub_037FB488
sub_037FB488: ; 0x037FB488
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	beq _037FB4A4
	b _037FB4A8
_037FB4A4:
	ldmia sp!, {pc}
_037FB4A8:
	ldmia ip, {r1, r2}
	ands r1, r1, r2
	beq _037FB4B8
	b _037FB4BC
_037FB4B8:
	ldmia sp!, {pc}
_037FB4BC:
	mov r3, #1
	mov r0, #0
_037FB4C4:
	ands r2, r1, r3, lsl r0
	beq _037FB4D0
	b _037FB4D4
_037FB4D0:
	add r0, r0, #1
_037FB4D4:
	beq _037FB4C4
	str r2, [ip, #4]
	ldr r1, _037FB4EC ; =_038074F4
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _037FB4F0 ; =sub_037FB4F4
	bx r0
	.align 2, 0
_037FB4EC: .word _038074F4
_037FB4F0: .word sub_037FB4F4
	arm_func_end sub_037FB488

	arm_func_start sub_037FB4F4
sub_037FB4F4: ; 0x037FB4F4
	ldr ip, _037FB630 ; =_03807608
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _037FB544
_037FB50C:
	str r2, [ip, #0x48]
	str r3, [ip, #0x5c]
	str r3, [ip, #0x60]
	ldr r0, [ip, #0x64]
	str r3, [ip, #0x64]
	mov ip, r0
	cmp ip, #0
	bne _037FB50C
	ldr ip, _037FB630 ; =_03807608
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _037FB634 ; =_038076A4
	mov r1, #1
	strh r1, [ip]
_037FB544:
	ldr ip, _037FB634 ; =_038076A4
	ldrh r1, [ip]
	cmp r1, #0
	beq _037FB558
	b _037FB55C
_037FB558:
	ldr pc, [sp], #0x4
_037FB55C:
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_037FB574:
	cmp r1, #0
	bne _037FB580
	b _037FB584
_037FB580:
	ldrh r0, [r1, #0x48]
_037FB584:
	bne _037FB58C
	b _037FB590
_037FB58C:
	cmp r0, #1
_037FB590:
	bne _037FB598
	b _037FB59C
_037FB598:
	ldr r1, [r1, #0x4c]
_037FB59C:
	bne _037FB574
	cmp r1, #0
	bne _037FB5B4
_037FB5A8:
	mov r3, #0x92
	msr cpsr_c, r3
	ldr pc, [sp], #0x4
_037FB5B4:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _037FB5A8
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _037FB5DC
	stmdb sp!, {r0, r1, ip}
	mov lr, pc
	bx r3
_037FB5D8:
	ldmia sp!, {r0, r1, ip}
_037FB5DC:
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
_037FB630: .word _03807608
_037FB634: .word _038076A4
	arm_func_end sub_037FB4F4

	arm_func_start sub_037FB638
sub_037FB638: ; 0x037FB638
	bx lr
	arm_func_end sub_037FB638

	arm_func_start sub_037FB63C
sub_037FB63C: ; 0x037FB63C
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _037FB6B4 ; =_03807610
	ldr r3, _037FB6B8 ; =_038074E0
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _037FB684
	ldr r0, _037FB6BC ; =_03807618
	ldr r0, [r0, r5]
	mov lr, pc
	bx r1
_037FB684:
	ldr r2, _037FB6C0 ; =0x0380FFF8
	ldr r0, _037FB6C4 ; =_03807614
	ldr r1, [r2]
	orr r1, r1, r4
	str r1, [r2]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _037FB6AC
	mov r0, r4
	bl sub_037FB928
_037FB6AC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB6B4: .word _03807610
_037FB6B8: .word _038074E0
_037FB6BC: .word _03807618
_037FB6C0: .word 0x0380FFF8
_037FB6C4: .word _03807614
	arm_func_end sub_037FB63C

	arm_func_start sub_037FB6C8
sub_037FB6C8: ; 0x037FB6C8
	ldr ip, _037FB6D4 ; =sub_037FB63C
	mov r0, #0
	bx ip
	.align 2, 0
_037FB6D4: .word sub_037FB63C
	arm_func_end sub_037FB6C8

	arm_func_start sub_037FB6D8
sub_037FB6D8: ; 0x037FB6D8
	ldr ip, _037FB6E4 ; =sub_037FB63C
	mov r0, #1
	bx ip
	.align 2, 0
_037FB6E4: .word sub_037FB63C
	arm_func_end sub_037FB6D8

	arm_func_start sub_037FB6E8
sub_037FB6E8: ; 0x037FB6E8
	ldr ip, _037FB6F4 ; =sub_037FB63C
	mov r0, #2
	bx ip
	.align 2, 0
_037FB6F4: .word sub_037FB63C
	arm_func_end sub_037FB6E8

	arm_func_start sub_037FB6F8
sub_037FB6F8: ; 0x037FB6F8
	ldr ip, _037FB704 ; =sub_037FB63C
	mov r0, #3
	bx ip
	.align 2, 0
_037FB704: .word sub_037FB63C
	arm_func_end sub_037FB6F8

	arm_func_start sub_037FB708
sub_037FB708: ; 0x037FB708
	ldr ip, _037FB714 ; =sub_037FB63C
	mov r0, #4
	bx ip
	.align 2, 0
_037FB714: .word sub_037FB63C
	arm_func_end sub_037FB708

	arm_func_start sub_037FB718
sub_037FB718: ; 0x037FB718
	ldr ip, _037FB724 ; =sub_037FB63C
	mov r0, #5
	bx ip
	.align 2, 0
_037FB724: .word sub_037FB63C
	arm_func_end sub_037FB718

	arm_func_start sub_037FB728
sub_037FB728: ; 0x037FB728
	ldr ip, _037FB734 ; =sub_037FB63C
	mov r0, #6
	bx ip
	.align 2, 0
_037FB734: .word sub_037FB63C
	arm_func_end sub_037FB728

	arm_func_start sub_037FB738
sub_037FB738: ; 0x037FB738
	ldr ip, _037FB744 ; =sub_037FB63C
	mov r0, #7
	bx ip
	.align 2, 0
_037FB744: .word sub_037FB63C
	arm_func_end sub_037FB738

	arm_func_start sub_037FB748
sub_037FB748: ; 0x037FB748
	stmdb sp!, {r3, lr}
	ldr r2, _037FB78C ; =0x027FFC3C
	ldr r0, _037FB790 ; =_03807610
	ldr r1, [r2]
	ldr r3, [r0, #0x60]
	add r0, r1, #1
	str r0, [r2]
	cmp r3, #0
	beq _037FB774
	mov lr, pc
	bx r3
_037FB774:
	ldr r1, _037FB794 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #1
	str r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FB78C: .word 0x027FFC3C
_037FB790: .word _03807610
_037FB794: .word 0x0380FFF8
	arm_func_end sub_037FB748

	arm_func_start sub_037FB798
sub_037FB798: ; 0x037FB798
	ldr r0, _037FB7B4 ; =_03807608
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _037FB7B8 ; =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_037FB7B4: .word _03807608
_037FB7B8: .word 0x027FFC3C
	arm_func_end sub_037FB798

	arm_func_start sub_037FB7BC
sub_037FB7BC: ; 0x037FB7BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _037FB84C ; =_038074F4
	mov sb, #0
	mov r2, #0xc
	ldr r5, _037FB850 ; =_03807670
	ldr r7, _037FB854 ; =_03807610
	mov r8, sb
	mov lr, sb
	mov ip, #1
	mov r3, r2
_037FB7E4:
	tst r0, #1
	beq _037FB834
	mov sl, r8
	cmp sb, #8
	blt _037FB808
	cmp sb, #0xb
	suble r6, sb, #8
	mlale sl, r6, r3, r7
	ble _037FB82C
_037FB808:
	cmp sb, #3
	blt _037FB820
	cmp sb, #6
	addle r6, sb, #1
	mlale sl, r6, r2, r7
	ble _037FB82C
_037FB820:
	cmp sb, #0
	strne r1, [r4, sb, lsl #2]
	moveq sl, r5
_037FB82C:
	cmp sl, #0
	stmneia sl, {r1, ip, lr}
_037FB834:
	add sb, sb, #1
	cmp sb, #0x19
	mov r0, r0, lsr #1
	blt _037FB7E4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FB84C: .word _038074F4
_037FB850: .word _03807670
_037FB854: .word _03807610
	arm_func_end sub_037FB7BC

	arm_func_start sub_037FB858
sub_037FB858: ; 0x037FB858
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _037FB898 ; =_03807640
	ldr r3, _037FB89C ; =_03807648
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	mov r0, r1, lsl r0
	str r2, [r3, r4]
	bl sub_037FB8F0
	ldr r0, _037FB8A0 ; =_03807644
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FB898: .word _03807640
_037FB89C: .word _03807648
_037FB8A0: .word _03807644
	arm_func_end sub_037FB858

	arm_func_start sub_037FB8A4
sub_037FB8A4: ; 0x037FB8A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037FB8D8
	ldr r1, _037FB8D4 ; =0x04000210
	ldr r3, [r1]
	sub r2, r1, #8
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FB8D4: .word 0x04000210
	arm_func_end sub_037FB8A4

	arm_func_start sub_037FB8D8
sub_037FB8D8: ; 0x037FB8D8
	ldr r2, _037FB8EC ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_037FB8EC: .word 0x04000208
	arm_func_end sub_037FB8D8

	arm_func_start sub_037FB8F0
sub_037FB8F0: ; 0x037FB8F0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037FB8D8
	ldr ip, _037FB924 ; =0x04000210
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
_037FB924: .word 0x04000210
	arm_func_end sub_037FB8F0

	arm_func_start sub_037FB928
sub_037FB928: ; 0x037FB928
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037FB8D8
	ldr ip, _037FB960 ; =0x04000210
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
_037FB960: .word 0x04000210
	arm_func_end sub_037FB928

	arm_func_start sub_037FB964
sub_037FB964: ; 0x037FB964
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037FB8D8
	ldr r1, _037FB994 ; =0x04000214
	ldr r3, [r1]
	sub r2, r1, #0xc
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FB994: .word 0x04000214
	arm_func_end sub_037FB964

	arm_func_start sub_037FB998
sub_037FB998: ; 0x037FB998
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _037FBA00 ; =_0380767C
	ldr r1, [r0]
	cmp r1, #0
	bne _037FB9F8
	ldr r4, _037FBA04 ; =0x027FFFF0
	mov r2, #1
	mov r1, #0
	str r2, [r0]
	strh r1, [r4, #6]
	mov r5, #0x400
	b _037FB9D0
_037FB9C8:
	mov r0, r5
	bl sub_037FBA0C
_037FB9D0:
	ldrh r0, [r4, #4]
	cmp r0, #0x7f
	bne _037FB9C8
	ldr r1, _037FBA08 ; =0x027FFFB8
	mvn r0, #0
	str r0, [r1]
	mov r0, r0, lsl #0x10
	str r0, [r1, #4]
	mov r0, #0xbf
	strh r0, [r4, #6]
_037FB9F8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FBA00: .word _0380767C
_037FBA04: .word 0x027FFFF0
_037FBA08: .word 0x027FFFB8
	arm_func_end sub_037FB998

	arm_func_start sub_037FBA0C
sub_037FBA0C: ; 0x037FBA0C
	ldr ip, _037FBA14 ; =sub_038037B8
	bx ip
	.align 2, 0
_037FBA14: .word sub_038037B8 + 1
	arm_func_end sub_037FBA0C

	arm_func_start sub_037FBA18
sub_037FBA18: ; 0x037FBA18
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	cmp r0, r1
	mov r5, r3
	mvnne r0, #1
	bne _037FBA8C
	cmp r5, #0
	beq _037FBA48
	bl EnableIrqFiqFlags
	b _037FBA4C
_037FBA48:
	bl EnableIrqFlag
_037FBA4C:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _037FBA68
	mov lr, pc
	bx r6
_037FBA68:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _037FBA84
	bl SetIrqFiqFlags
	b _037FBA88
_037FBA84:
	bl SetIrqFlag
_037FBA88:
	mov r0, #0
_037FBA8C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FBA18

	arm_func_start sub_037FBA94
sub_037FBA94: ; 0x037FBA94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _037FBAB4
	bl EnableIrqFiqFlags
	b _037FBAB8
_037FBAB4:
	bl EnableIrqFlag
_037FBAB8:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl sub_037FE2AC
	movs r4, r0
	bne _037FBAE4
	cmp r7, #0
	beq _037FBAE0
	mov lr, pc
	bx r7
_037FBAE0:
	strh sb, [r8, #4]
_037FBAE4:
	cmp r6, #0
	mov r0, r5
	beq _037FBAF8
	bl SetIrqFiqFlags
	b _037FBAFC
_037FBAF8:
	bl SetIrqFlag
_037FBAFC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end sub_037FBA94

	arm_func_start sub_037FBB08
sub_037FBB08: ; 0x037FBB08
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _037FBB50 ; =0x027FFFE8
	ldr r5, _037FBB54 ; =sub_037FBBA4
	mov r8, r0
	mov r7, #0x400
	mov r4, #1
	b _037FBB2C
_037FBB24:
	mov r0, r7
	bl sub_037FBA0C
_037FBB2C:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl sub_037FBA94
	cmp r0, #0
	bgt _037FBB24
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FBB50: .word 0x027FFFE8
_037FBB54: .word sub_037FBBA4
	arm_func_end sub_037FBB08

	arm_func_start sub_037FBB58
sub_037FBB58: ; 0x037FBB58
	ldr ip, _037FBB6C ; =sub_037FBA18
	ldr r1, _037FBB70 ; =0x027FFFE8
	ldr r2, _037FBB74 ; =sub_037FBBA8
	mov r3, #1
	bx ip
	.align 2, 0
_037FBB6C: .word sub_037FBA18
_037FBB70: .word 0x027FFFE8
_037FBB74: .word sub_037FBBA8
	arm_func_end sub_037FBB58

	arm_func_start sub_037FBB78
sub_037FBB78: ; 0x037FBB78
	ldr r1, _037FBB80 ; =sub_037FBB58
	bx r1
	.align 2, 0
_037FBB80: .word sub_037FBB58
	arm_func_end sub_037FBB78

	arm_func_start sub_037FBB84
sub_037FBB84: ; 0x037FBB84
	ldr ip, _037FBB98 ; =sub_037FBA94
	ldr r1, _037FBB9C ; =0x027FFFE8
	ldr r2, _037FBBA0 ; =sub_037FBBA4
	mov r3, #1
	bx ip
	.align 2, 0
_037FBB98: .word sub_037FBA94
_037FBB9C: .word 0x027FFFE8
_037FBBA0: .word sub_037FBBA4
	arm_func_end sub_037FBB84

	arm_func_start sub_037FBBA4
sub_037FBBA4: ; 0x037FBBA4
	bx lr
	arm_func_end sub_037FBBA4

	arm_func_start sub_037FBBA8
sub_037FBBA8: ; 0x037FBBA8
	bx lr
	arm_func_end sub_037FBBA8

	arm_func_start sub_037FBBAC
sub_037FBBAC: ; 0x037FBBAC
	ldr ip, _037FBBC0 ; =sub_037FBA18
	ldr r1, _037FBBC4 ; =0x027FFFE0
	ldr r2, _037FBBC8 ; =sub_037FBBF0
	mov r3, #0
	bx ip
	.align 2, 0
_037FBBC0: .word sub_037FBA18
_037FBBC4: .word 0x027FFFE0
_037FBBC8: .word sub_037FBBF0
	arm_func_end sub_037FBBAC

	arm_func_start sub_037FBBCC
sub_037FBBCC: ; 0x037FBBCC
	ldr ip, _037FBBE0 ; =sub_037FBA94
	ldr r1, _037FBBE4 ; =0x027FFFE0
	ldr r2, _037FBBE8 ; =sub_037FBBEC
	mov r3, #0
	bx ip
	.align 2, 0
_037FBBE0: .word sub_037FBA94
_037FBBE4: .word 0x027FFFE0
_037FBBE8: .word sub_037FBBEC
	arm_func_end sub_037FBBCC

	arm_func_start sub_037FBBEC
sub_037FBBEC: ; 0x037FBBEC
	bx lr
	arm_func_end sub_037FBBEC

	arm_func_start sub_037FBBF0
sub_037FBBF0: ; 0x037FBBF0
	bx lr
	arm_func_end sub_037FBBF0

	arm_func_start sub_037FBBF4
sub_037FBBF4: ; 0x037FBBF4
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end sub_037FBBF4

	arm_func_start sub_037FBBFC
sub_037FBBFC: ; 0x037FBBFC
	ldr r3, _037FBC9C ; =0x027FFFB8
	ldr r1, [r3]
	mov r2, #0
	mov r0, #0x80000000
_037FBC0C:
	tst r1, r0
	bne _037FBC28
	add r2, r2, #1
	cmp r2, #0x20
	beq _037FBC28
	mov r0, r0, lsr #1
	b _037FBC0C
_037FBC28:
	cmp r2, #0x20
	bne _037FBC34
	b _037FBC38
_037FBC34:
	mov r0, #0x80
_037FBC38:
	bne _037FBC80
	add r3, r3, #4
	ldr r1, [r3]
	mov r2, #0
	mov r0, #0x80000000
_037FBC4C:
	tst r1, r0
	bne _037FBC68
	add r2, r2, #1
	cmp r2, #0x20
	beq _037FBC68
	mov r0, r0, lsr #1
	b _037FBC4C
_037FBC68:
	cmp r2, #0x20
	ldr r0, _037FBCA0 ; =0xFFFFFFFD
	beq _037FBC78
	b _037FBC7C
_037FBC78:
	bx lr
_037FBC7C:
	mov r0, #0xa0
_037FBC80:
	add r0, r0, r2
	mov r1, #0x80000000
	mov r1, r1, lsr r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037FBC9C: .word 0x027FFFB8
_037FBCA0: .word 0xFFFFFFFD
	arm_func_end sub_037FBBFC

	arm_func_start sub_037FBCA4
sub_037FBCA4: ; 0x037FBCA4
	ldr r3, _037FBCE8 ; =0x027FFFB8
	cmp r0, #0xa0
	bpl _037FBCB4
	b _037FBCB8
_037FBCB4:
	add r3, r3, #4
_037FBCB8:
	bpl _037FBCC0
	b _037FBCC4
_037FBCC0:
	sub r0, r0, #0xa0
_037FBCC4:
	bmi _037FBCCC
	b _037FBCD0
_037FBCCC:
	sub r0, r0, #0x80
_037FBCD0:
	mov r1, #0x80000000
	mov r1, r1, lsr r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037FBCE8: .word 0x027FFFB8
	arm_func_end sub_037FBCA4

	arm_func_start sub_037FBCEC
sub_037FBCEC: ; 0x037FBCEC
	ldr ip, [r0]
	b _037FBD00
_037FBCF4:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x64]
_037FBD00:
	cmp ip, #0
	beq _037FBD18
	ldr r3, [ip, #0x54]
	ldr r2, [r1, #0x54]
	cmp r3, r2
	bls _037FBCF4
_037FBD18:
	cmp ip, #0
	bne _037FBD44
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	mov r2, #0
	str r2, [r1, #0x64]
	str r1, [r0, #4]
	bx lr
_037FBD44:
	ldr r2, [ip, #0x60]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	str ip, [r1, #0x64]
	str r1, [ip, #0x60]
	bx lr
	arm_func_end sub_037FBCEC

	arm_func_start sub_037FBD64
sub_037FBD64: ; 0x037FBD64
	stmdb sp!, {r3, lr}
	ldr lr, [r0]
	mov r2, lr
	b _037FBDA8
_037FBD74:
	ldr r3, [r2, #0x64]
	cmp r2, r1
	bne _037FBDA4
	ldr ip, [r2, #0x60]
	cmp lr, r2
	streq r3, [r0]
	strne r3, [ip, #0x64]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x60]
	b _037FBDB0
_037FBDA4:
	mov r2, r3
_037FBDA8:
	cmp r2, #0
	bne _037FBD74
_037FBDB0:
	mov r0, r2
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_037FBD64

	arm_func_start sub_037FBDBC
sub_037FBDBC: ; 0x037FBDBC
	ldr r2, [r0]
	cmp r2, #0
	beq _037FBDE4
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_037FBDE4:
	mov r0, r2
	bx lr
	arm_func_end sub_037FBDBC

	arm_func_start sub_037FBDEC
sub_037FBDEC: ; 0x037FBDEC
	stmdb sp!, {r3, lr}
	ldr r1, _037FBE48 ; =_03807680
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _037FBE0C
_037FBE04:
	mov ip, r3
	ldr r3, [r3, #0x4c]
_037FBE0C:
	cmp r3, #0
	beq _037FBE24
	ldr r2, [r3, #0x54]
	ldr r1, [r0, #0x54]
	cmp r2, r1
	blo _037FBE04
_037FBE24:
	cmp ip, #0
	ldreq r1, _037FBE48 ; =_03807680
	streq lr, [r0, #0x4c]
	streq r0, [r1, #0x2c]
	ldrne r1, [ip, #0x4c]
	strne r1, [r0, #0x4c]
	strne r0, [ip, #0x4c]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FBE48: .word _03807680
	arm_func_end sub_037FBDEC

	arm_func_start sub_037FBE4C
sub_037FBE4C: ; 0x037FBE4C
	ldr r1, _037FBE8C ; =_03807680
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _037FBE64
_037FBE5C:
	mov r2, r1
	ldr r1, [r1, #0x4c]
_037FBE64:
	cmp r1, #0
	cmpne r1, r0
	bne _037FBE5C
	cmp r2, #0
	ldreq r1, [r0, #0x4c]
	ldreq r0, _037FBE8C ; =_03807680
	streq r1, [r0, #0x2c]
	ldrne r0, [r0, #0x4c]
	strne r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_037FBE8C: .word _03807680
	arm_func_end sub_037FBE4C

	arm_func_start sub_037FBE90
sub_037FBE90: ; 0x037FBE90
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _037FBF5C ; =_03807680
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _037FBF54
	ldrh r0, [r0, #0x26]
	ldr r4, _037FBF60 ; =_038076A4
	cmp r0, #0
	bne _037FBEC0
	bl sub_037FDD58
	cmp r0, #0x12
	bne _037FBECC
_037FBEC0:
	mov r0, #1
	strh r0, [r4]
	b _037FBF54
_037FBECC:
	ldr r0, _037FBF5C ; =_03807680
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl sub_037FC398
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	beq _037FBF54
	ldr r0, [r6, #0x48]
	cmp r0, #2
	beq _037FBF08
	mov r0, r6
	bl sub_037FC64C
	cmp r0, #0
	bne _037FBF54
_037FBF08:
	ldr r0, _037FBF5C ; =_03807680
	ldr r2, [r0]
	cmp r2, #0
	beq _037FBF28
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_037FBF28:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _037FBF44
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_037FBF44:
	ldr r1, _037FBF5C ; =_03807680
	mov r0, r5
	str r5, [r1, #0x28]
	bl sub_037FC680
_037FBF54:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FBF5C: .word _03807680
_037FBF60: .word _038076A4
	arm_func_end sub_037FBE90

	arm_func_start sub_037FBF64
sub_037FBF64: ; 0x037FBF64
	stmdb sp!, {r3, lr}
	ldr r0, _037FC028 ; =_03807680
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _037FC020
	ldr r1, _037FC02C ; =_038076A8
	mov r2, #1
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	mov r1, #0x10
	str r1, [r0, #0x12c]
	mov r3, #0
	str r3, [r0, #0x128]
	str r2, [r0, #0x120]
	str r3, [r0, #0x124]
	ldr r2, _037FC030 ; =0x00000400
	ldr r1, _037FC034 ; =_03807758
	str r3, [r0, #0x130]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _037FC038 ; =sub_037F8000
	ldrgt r1, _037FC03C ; =0x00000400
	ldrgt r0, _037FC040 ; =0x0380FF80
	subgt r0, r0, r1
	sub ip, r0, r2
	ldr r2, _037FC03C ; =0x00000400
	ldr r0, _037FC040 ; =0x0380FF80
	ldr r1, _037FC028 ; =_03807680
	sub r3, r0, r2
	str r3, [r1, #0x150]
	str ip, [r1, #0x14c]
	mov r0, #0
	ldr r2, _037FC044 ; =0xD73BFDF7
	str r0, [r1, #0x154]
	str r2, [r3, #-4]
	ldr r2, [r1, #0x14c]
	ldr ip, _037FC048 ; =0xFBDD37BB
	ldr r3, _037FC04C ; =_038076A4
	str ip, [r2]
	str r0, [r1, #0x15c]
	str r0, [r1, #0x158]
	strh r0, [r1, #0x24]
	ldr r2, _037FC050 ; =0x027FFFA4
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl sub_037FC52C
_037FC020:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC028: .word _03807680
_037FC02C: .word _038076A8
_037FC030: .word 0x00000400
_037FC034: .word _03807758
_037FC038: .word sub_037F8000
_037FC03C: .word 0x00000400
_037FC040: .word 0x0380FF80
_037FC044: .word 0xD73BFDF7
_037FC048: .word 0xFBDD37BB
_037FC04C: .word _038076A4
_037FC050: .word 0x027FFFA4
	arm_func_end sub_037FBF64

	arm_func_start sub_037FC054
sub_037FC054: ; 0x037FC054
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl EnableIrqFlag
	ldr r1, _037FC14C ; =_03807680
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
	bl sub_037FBDEC
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x78]
	sub r5, r6, r0
	sub r2, r6, #4
	str r5, [r8, #0x74]
	mov ip, #0
	str ip, [r8, #0x7c]
	ldr r6, _037FC150 ; =0xD73BFDF7
	ldr r0, [r8, #0x78]
	ldr r3, _037FC154 ; =0xFBDD37BB
	str r6, [r0, #-4]
	ldr r0, [r8, #0x74]
	str r3, [r0]
	str ip, [r8, #0x84]
	mov r0, r8
	str ip, [r8, #0x80]
	bl sub_037FC5C8
	ldr r2, _037FC158 ; =sub_037FC15C
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl sub_037FDFD0
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
	bl sub_037FDFD0
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0x94]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FC14C: .word _03807680
_037FC150: .word 0xD73BFDF7
_037FC154: .word 0xFBDD37BB
_037FC158: .word sub_037FC15C
	arm_func_end sub_037FC054

	arm_func_start sub_037FC15C
sub_037FC15C: ; 0x037FC15C
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r0, _037FC17C ; =_03807680
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl sub_037FC180
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC17C: .word _03807680
	arm_func_end sub_037FC15C

	arm_func_start sub_037FC180
sub_037FC180: ; 0x037FC180
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _037FC1D8 ; =_03807680
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _037FC1C8
	ldr r1, _037FC1DC ; =sub_037FC1E0
	bl sub_037FC5C8
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x48]
	bl sub_037FC680
	b _037FC1D0
_037FC1C8:
	mov r0, r4
	bl sub_037FC1E0
_037FC1D0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FC1D8: .word _03807680
_037FC1DC: .word sub_037FC1E0
	arm_func_end sub_037FC180

	arm_func_start sub_037FC1E0
sub_037FC1E0: ; 0x037FC1E0
	stmdb sp!, {r3, lr}
	ldr r1, _037FC21C ; =_03807680
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0x98]
	cmp r2, #0
	beq _037FC210
	mov r1, #0
	str r1, [r3, #0x98]
	mov lr, pc
	bx r2
_037FC20C:
	bl EnableIrqFlag
_037FC210:
	bl sub_037FC220
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC21C: .word _03807680
	arm_func_end sub_037FC1E0

	arm_func_start sub_037FC220
sub_037FC220: ; 0x037FC220
	stmdb sp!, {r4, lr}
	ldr r0, _037FC28C ; =_03807680
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl sub_037FC558
	mov r0, r4
	bl sub_037FC96C
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _037FC250
	mov r1, r4
	bl sub_037FBD64
_037FC250:
	mov r0, r4
	bl sub_037FBE4C
	mov r1, #2
	add r0, r4, #0x80
	str r1, [r4, #0x48]
	bl sub_037FC2E4
	bl sub_037FC590
	bl EnableIrqFlag
	mov r4, r0
	bl sub_037FBE90
	mov r0, r4
	bl SetIrqFlag
	bl sub_037FDE70
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FC28C: .word _03807680
	arm_func_end sub_037FC220

	arm_func_start sub_037FC290
sub_037FC290: ; 0x037FC290
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, _037FC2E0 ; =_03807680
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _037FC2C4
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x5c]
	bl sub_037FBCEC
_037FC2C4:
	mov r0, #0
	str r0, [r5, #0x48]
	bl sub_037FBE90
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FC2E0: .word _03807680
	arm_func_end sub_037FC290

	arm_func_start sub_037FC2E4
sub_037FC2E4: ; 0x037FC2E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	beq _037FC35C
	mov r2, #0
	mov r3, r2
	mov r1, #1
	mov r0, r2
	b _037FC340
_037FC314:
	beq _037FC330
	ldr ip, [lr, #0x64]
	str ip, [r5]
	cmp ip, #0
	strne r3, [ip, #0x60]
	streq r2, [r5, #4]
	streq r2, [lr, #0x5c]
_037FC330:
	str r1, [lr, #0x48]
	str r0, [lr, #0x5c]
	str r0, [lr, #0x64]
	str r0, [lr, #0x60]
_037FC340:
	ldr lr, [r5]
	cmp lr, #0
	bne _037FC314
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	bl sub_037FBE90
_037FC35C:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FC2E4

	arm_func_start sub_037FC36C
sub_037FC36C: ; 0x037FC36C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x48]
	bl sub_037FBE90
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FC36C

	arm_func_start sub_037FC398
sub_037FC398: ; 0x037FC398
	ldr r0, _037FC3BC ; =_03807680
	ldr r0, [r0, #0x2c]
	b _037FC3A8
_037FC3A4:
	ldr r0, [r0, #0x4c]
_037FC3A8:
	cmp r0, #0
	ldrne r1, [r0, #0x48]
	cmpne r1, #1
	bne _037FC3A4
	bx lr
	.align 2, 0
_037FC3BC: .word _03807680
	arm_func_end sub_037FC398

	arm_func_start sub_037FC3C0
sub_037FC3C0: ; 0x037FC3C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _037FC460 ; =_03807680
	mov r7, r0
	ldr r8, [r2, #0x2c]
	mov r6, r1
	mov r4, #0
	bl EnableIrqFlag
	mov r5, r0
	b _037FC3EC
_037FC3E4:
	mov r4, r8
	ldr r8, [r8, #0x4c]
_037FC3EC:
	cmp r8, #0
	cmpne r8, r7
	bne _037FC3E4
	cmp r8, #0
	ldrne r0, _037FC464 ; =_038076B4
	cmpne r8, r0
	bne _037FC418
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	b _037FC458
_037FC418:
	ldr r0, [r8, #0x54]
	cmp r0, r6
	beq _037FC44C
	cmp r4, #0
	ldreq r1, [r7, #0x4c]
	ldreq r0, _037FC460 ; =_03807680
	streq r1, [r0, #0x2c]
	ldrne r0, [r7, #0x4c]
	strne r0, [r4, #0x4c]
	mov r0, r7
	str r6, [r7, #0x54]
	bl sub_037FBDEC
	bl sub_037FBE90
_037FC44C:
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
_037FC458:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FC460: .word _03807680
_037FC464: .word _038076B4
	arm_func_end sub_037FC3C0

	arm_func_start sub_037FC468
sub_037FC468: ; 0x037FC468
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r4, r0
	add r0, sp, #8
	bl sub_037FD3A0
	ldr r0, _037FC500 ; =_03807680
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl EnableIrqFlag
	ldr r1, _037FC504 ; =0x000082EA
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
	ldr r3, _037FC508 ; =sub_037FC50C
	bl sub_037FD4DC
	mov r4, #0
	b _037FC4E0
_037FC4D8:
	mov r0, r4
	bl sub_037FC290
_037FC4E0:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _037FC4D8
	mov r0, r5
	bl SetIrqFlag
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_037FC500: .word _03807680
_037FC504: .word 0x000082EA
_037FC508: .word sub_037FC50C
	arm_func_end sub_037FC468

	arm_func_start sub_037FC50C
sub_037FC50C: ; 0x037FC50C
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _037FC528 ; =sub_037FC36C
	mov r0, r2
	str r1, [r2, #0x94]
	bx ip
	.align 2, 0
_037FC528: .word sub_037FC36C
	arm_func_end sub_037FC50C

	arm_func_start sub_037FC52C
sub_037FC52C: ; 0x037FC52C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _037FC554 ; =_03807680
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FC554: .word _03807680
	arm_func_end sub_037FC52C

	arm_func_start sub_037FC558
sub_037FC558: ; 0x037FC558
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r2, _037FC58C ; =_03807680
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	strlo r1, [r2, #4]
	movlo r4, r3
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FC58C: .word _03807680
	arm_func_end sub_037FC558

	arm_func_start sub_037FC590
sub_037FC590: ; 0x037FC590
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _037FC5C4 ; =_03807680
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	strne r2, [r1, #4]
	movne r4, r3
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FC5C4: .word _03807680
	arm_func_end sub_037FC590

	arm_func_start sub_037FC5C8
sub_037FC5C8: ; 0x037FC5C8
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	bne _037FC5E4
	b _037FC5E8
_037FC5E4:
	sub r2, r2, #4
_037FC5E8:
	str r2, [r0, #0x38]
	ands r1, r1, #1
	bne _037FC5F8
	b _037FC5FC
_037FC5F8:
	mov r1, #0x3f
_037FC5FC:
	beq _037FC604
	b _037FC608
_037FC604:
	mov r1, #0x1f
_037FC608:
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
	arm_func_end sub_037FC5C8

	arm_func_start sub_037FC64C
sub_037FC64C: ; 0x037FC64C
	add r1, r0, #0
	mrs r2, cpsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 ; =sub_037FC680
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	arm_func_end sub_037FC64C

	arm_func_start sub_037FC680
sub_037FC680: ; 0x037FC680
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
	arm_func_end sub_037FC680

	arm_func_start sub_037FC6AC
sub_037FC6AC: ; 0x037FC6AC
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
	arm_func_end sub_037FC6AC

	arm_func_start sub_037FC6D4
sub_037FC6D4: ; 0x037FC6D4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl EnableIrqFlag
	mov r4, r0
	and r7, r7, #1
	b _037FC714
_037FC6F4:
	cmp r7, #0
	bne _037FC70C
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	b _037FC758
_037FC70C:
	mov r0, r6
	bl sub_037FC290
_037FC714:
	ldr r2, [r6, #0x1c]
	ldr r1, [r6, #0x14]
	cmp r1, r2
	ble _037FC6F4
	ldr r0, [r6, #0x18]
	add r0, r0, r2
	bl sub_03806BC8
	ldr r2, [r6, #0x10]
	add r0, r6, #8
	str r5, [r2, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_037FC2E4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
_037FC758:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FC6D4

	arm_func_start sub_037FC760
sub_037FC760: ; 0x037FC760
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r6, r0
	mov r5, r1
	bl EnableIrqFlag
	mov r4, r0
	and r7, r7, #1
	b _037FC7A0
_037FC780:
	cmp r7, #0
	bne _037FC798
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	b _037FC7F4
_037FC798:
	add r0, r6, #8
	bl sub_037FC290
_037FC7A0:
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _037FC780
	cmp r5, #0
	ldrne r1, [r6, #0x10]
	ldrne r0, [r6, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r5]
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl sub_03806BC8
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_037FC2E4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
_037FC7F4:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FC760

	arm_func_start sub_037FC7FC
sub_037FC7FC: ; 0x037FC7FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	mov r7, r0
	mov r4, r1
	bl EnableIrqFlag
	mov r5, r0
	and r6, r6, #1
	b _037FC83C
_037FC81C:
	cmp r6, #0
	bne _037FC834
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	b _037FC868
_037FC834:
	add r0, r7, #8
	bl sub_037FC290
_037FC83C:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _037FC81C
	cmp r4, #0
	ldrne r1, [r7, #0x10]
	ldrne r0, [r7, #0x18]
	ldrne r0, [r1, r0, lsl #2]
	strne r0, [r4]
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
_037FC868:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FC7FC

	arm_func_start sub_037FC870
sub_037FC870: ; 0x037FC870
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_037FC870

	arm_func_start sub_037FC888
sub_037FC888: ; 0x037FC888
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _037FC908 ; =_038076A4
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_037FC8A4:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _037FC8D0
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl sub_037FC9A4
	b _037FC8F8
_037FC8D0:
	cmp r0, r7
	ldreq r0, [r5, #0xc]
	addeq r0, r0, #1
	streq r0, [r5, #0xc]
	beq _037FC8F8
	str r5, [r7, #0x68]
	mov r0, r5
	bl sub_037FC290
	str r6, [r7, #0x68]
	b _037FC8A4
_037FC8F8:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FC908: .word _038076A4
	arm_func_end sub_037FC888

	arm_func_start sub_037FC90C
sub_037FC90C: ; 0x037FC90C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _037FC968 ; =_038076A4
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _037FC958
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _037FC958
	mov r1, r5
	bl sub_037FC9C8
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl sub_037FC2E4
_037FC958:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FC968: .word _038076A4
	arm_func_end sub_037FC90C

	arm_func_start sub_037FC96C
sub_037FC96C: ; 0x037FC96C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _037FC990
_037FC97C:
	add r0, r5, #0x6c
	bl sub_037FBDBC
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl sub_037FC2E4
_037FC990:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	bne _037FC97C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FC96C

	arm_func_start sub_037FC9A4
sub_037FC9A4: ; 0x037FC9A4
	ldr r2, [r0, #0x70]
	cmp r2, #0
	streq r1, [r0, #0x6c]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x70]
	bx lr
	arm_func_end sub_037FC9A4

	arm_func_start sub_037FC9C8
sub_037FC9C8: ; 0x037FC9C8
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x70]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x6c]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end sub_037FC9C8

	arm_func_start sub_037FC9EC
sub_037FC9EC: ; 0x037FC9EC
	stmdb sp!, {r3, lr}
	bl sub_037FCA1C
	bl sub_037FE2B4
	bl sub_037FB998
	bl sub_037FB798
	bl sub_037FD128
	bl sub_037FD34C
	bl sub_037FBF64
	bl sub_037FDD7C
	bl sub_03806388
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_037FC9EC

	arm_func_start sub_037FCA1C
sub_037FCA1C: ; 0x037FCA1C
	stmdb sp!, {r3, lr}
	ldr r1, _037FCA54 ; =_038077FC
	ldr r0, [r1]
	cmp r0, #0
	bne _037FCA4C
	mov r0, #1
	str r0, [r1]
	bl sub_037FCA58
	mov r0, #7
	bl sub_037FCA58
	mov r0, #8
	bl sub_037FCA58
_037FCA4C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FCA54: .word _038077FC
	arm_func_end sub_037FCA1C

	arm_func_start sub_037FCA58
sub_037FCA58: ; 0x037FCA58
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_037FCABC
	mov r1, r4, lsl #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xdc4]
	mov r0, r4
	bl sub_037FCB38
	mov r1, r4, lsl #2
	add r1, r1, #0x2700000
	add r1, r1, #0xff000
	str r0, [r1, #0xda0]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FCA58

	arm_func_start sub_037FCA94
sub_037FCA94: ; 0x037FCA94
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end sub_037FCA94

	arm_func_start sub_037FCAA8
sub_037FCAA8: ; 0x037FCAA8
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end sub_037FCAA8

	arm_func_start sub_037FCABC
sub_037FCABC: ; 0x037FCABC
	cmp r0, #1
	beq _037FCAD8
	cmp r0, #7
	beq _037FCAE0
	cmp r0, #8
	beq _037FCAE8
	b _037FCB1C
_037FCAD8:
	ldr r0, _037FCB24 ; =0x027FF000
	bx lr
_037FCAE0:
	mov r0, #0x3800000
	bx lr
_037FCAE8:
	ldr r2, _037FCB28 ; =0x00000400
	ldr r0, _037FCB2C ; =0x0380FF80
	ldr r1, _037FCB30 ; =SDK_WRAM_ARENA_LO
	sub r2, r0, r2
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	ldr r1, _037FCB34 ; =0x00000400
	cmp r1, #0
	bxeq lr
	sublt r0, r0, r1
	subge r0, r2, r1
	bx lr
_037FCB1C:
	mov r0, #0
	bx lr
	.align 2, 0
_037FCB24: .word 0x027FF000
_037FCB28: .word 0x00000400
_037FCB2C: .word 0x0380FF80
_037FCB30: .word SDK_WRAM_ARENA_LO
_037FCB34: .word 0x00000400
	arm_func_end sub_037FCABC

	arm_func_start sub_037FCB38
sub_037FCB38: ; 0x037FCB38
	cmp r0, #1
	beq _037FCB54
	cmp r0, #7
	beq _037FCB5C
	cmp r0, #8
	beq _037FCB6C
	b _037FCB80
_037FCB54:
	ldr r0, _037FCB88 ; =SDK_SUBPRIV_ARENA_LO
	bx lr
_037FCB5C:
	ldr r0, _037FCB8C ; =SDK_WRAM_ARENA_LO
	cmp r0, #0x3800000
	movhi r0, #0x3800000
	bx lr
_037FCB6C:
	ldr r1, _037FCB8C ; =SDK_WRAM_ARENA_LO
	mov r0, #0x3800000
	cmp r1, #0x3800000
	movhi r0, r1
	bx lr
_037FCB80:
	mov r0, #0
	bx lr
	.align 2, 0
_037FCB88: .word SDK_SUBPRIV_ARENA_LO
_037FCB8C: .word SDK_WRAM_ARENA_LO
	arm_func_end sub_037FCB38

	arm_func_start sub_037FCB90
sub_037FCB90: ; 0x037FCB90
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end sub_037FCB90

	arm_func_start sub_037FCBA4
sub_037FCBA4: ; 0x037FCBA4
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
	arm_func_end sub_037FCBA4

	arm_func_start sub_037FCBCC
sub_037FCBCC: ; 0x037FCBCC
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, #0
	b _037FCBEC
_037FCBDC:
	cmp r1, lr
	bls _037FCBF4
	mov ip, lr
	ldr lr, [lr, #4]
_037FCBEC:
	cmp lr, #0
	bne _037FCBDC
_037FCBF4:
	stmia r1, {ip, lr}
	cmp lr, #0
	beq _037FCC30
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _037FCC30
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_037FCC30:
	cmp ip, #0
	beq _037FCC68
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	bne _037FCC6C
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	b _037FCC6C
_037FCC68:
	mov r0, r1
_037FCC6C:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_037FCBCC

	arm_func_start sub_037FCC74
sub_037FCC74: ; 0x037FCC74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, _037FCD80 ; =_03807800
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _037FCCA8
	bl SetIrqFlag
	mov r0, #0
	b _037FCD78
_037FCCA8:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	bic r7, r1, #0x1f
	b _037FCCE0
_037FCCD0:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _037FCCE8
	ldr r5, [r5, #4]
_037FCCE0:
	cmp r5, #0
	bne _037FCCD0
_037FCCE8:
	cmp r5, #0
	bne _037FCD00
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	b _037FCD78
_037FCD00:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _037FCD20
	mov r1, r5
	bl sub_037FCBA4
	str r0, [r4, #4]
	b _037FCD54
_037FCD20:
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
_037FCD54:
	ldr r1, [r4, #8]
	mov r0, #0
	stmia r5, {r0, r1}
	cmp r1, #0
	strne r5, [r1]
	mov r0, r6
	str r5, [r4, #8]
	bl SetIrqFlag
	add r0, r5, #0x20
_037FCD78:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FCD80: .word _03807800
	arm_func_end sub_037FCC74

	arm_func_start sub_037FCD84
sub_037FCD84: ; 0x037FCD84
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r1, _037FCDEC ; =_03807800
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
	bl sub_037FCBA4
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl sub_037FCBCC
	str r0, [r7, #4]
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FCDEC: .word _03807800
	arm_func_end sub_037FCD84

	arm_func_start sub_037FCDF0
sub_037FCDF0: ; 0x037FCDF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _037FCE20 ; =_03807800
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FCE20: .word _03807800
	arm_func_end sub_037FCDF0

	arm_func_start sub_037FCE24
sub_037FCE24: ; 0x037FCE24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl EnableIrqFlag
	ldr r2, _037FCEC8 ; =_03807800
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
	b _037FCE88
_037FCE6C:
	mul r3, r7, r2
	ldr r6, [r5, #0x10]
	add r7, r7, #1
	str lr, [r6, r3]
	add r3, r6, r3
	str ip, [r3, #8]
	str ip, [r3, #4]
_037FCE88:
	ldr r3, [r5, #4]
	cmp r7, r3
	blt _037FCE6C
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl SetIrqFlag
	ldr r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FCEC8: .word _03807800
	arm_func_end sub_037FCE24

	arm_func_start sub_037FCECC
sub_037FCECC: ; 0x037FCECC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r2, _037FCF68 ; =_03807800
	add r1, r6, #0x1f
	ldr lr, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr r7, [lr, #4]
	bic r5, r5, #0x1f
	mov r4, #0
	mov r1, #0xc
	b _037FCF50
_037FCF04:
	mul r3, r4, r1
	ldr ip, [lr, #0x10]
	ldr r2, [ip, r3]
	add r3, ip, r3
	cmp r2, #0
	bge _037FCF4C
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl SetIrqFlag
	mov r0, r4
	b _037FCF60
_037FCF4C:
	add r4, r4, #1
_037FCF50:
	cmp r4, r7
	blt _037FCF04
	bl SetIrqFlag
	mvn r0, #0
_037FCF60:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FCF68: .word _03807800
	arm_func_end sub_037FCECC

	arm_func_start sub_037FCF6C
sub_037FCF6C: ; 0x037FCF6C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r4
	sub r6, r4, #1
	bl EnableIrqFlag
	ldr r1, _037FD108 ; =_03807800
	mvn r2, #0
	ldr r1, [r1, r8, lsl #2]
	cmp r7, r2
	ldr ip, [r1, #0x10]
	ldreq r7, [r1]
	cmp ip, #0
	beq _037FD0F8
	cmp r7, #0
	blt _037FD0F8
	ldr r2, [r1, #4]
	cmp r7, r2
	bge _037FD0F8
	mov r2, #0xc
	mul r3, r7, r2
	ldr r2, [ip, r3]
	add r7, ip, r3
	cmp r2, #0
	blt _037FD0F8
	ldr ip, [r7, #8]
	cmp ip, #0
	ldrne r3, [ip]
	cmpne r3, #0
	bne _037FD0F8
	b _037FD04C
_037FCFEC:
	ldr r3, [r1, #8]
	cmp r3, ip
	bhi _037FD0F8
	ldr r3, [r1, #0xc]
	cmp ip, r3
	bhs _037FD0F8
	tst ip, #0x1f
	bne _037FD0F8
	ldr lr, [ip, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, ip
	bne _037FD0F8
	ldr r3, [ip, #8]
	cmp r3, #0x40
	blo _037FD0F8
	tst r3, #0x1f
	bne _037FD0F8
	add r4, r4, r3
	cmp r4, #0
	ble _037FD0F8
	cmp r4, r2
	bgt _037FD0F8
	mov ip, lr
_037FD04C:
	cmp ip, #0
	bne _037FCFEC
	ldr lr, [r7, #4]
	cmp lr, #0
	ldrne r3, [lr]
	cmpne r3, #0
	bne _037FD0F8
	b _037FD0E8
_037FD06C:
	ldr r3, [r1, #8]
	cmp r3, lr
	bhi _037FD0F8
	ldr r3, [r1, #0xc]
	cmp lr, r3
	bhs _037FD0F8
	tst lr, #0x1f
	bne _037FD0F8
	ldr r7, [lr, #4]
	cmp r7, #0
	ldrne r3, [r7]
	cmpne r3, lr
	bne _037FD0F8
	ldr ip, [lr, #8]
	cmp ip, #0x40
	blo _037FD0F8
	tst ip, #0x1f
	bne _037FD0F8
	cmp r7, #0
	beq _037FD0C8
	add r3, lr, ip
	cmp r3, r7
	bhs _037FD0F8
_037FD0C8:
	add r4, r4, ip
	sub r3, ip, #0x20
	cmp r4, #0
	add r5, r5, r3
	ble _037FD0F8
	cmp r4, r2
	bgt _037FD0F8
	mov lr, r7
_037FD0E8:
	cmp lr, #0
	bne _037FD06C
	cmp r4, r2
	moveq r6, r5
_037FD0F8:
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD108: .word _03807800
	arm_func_end sub_037FCF6C

	arm_func_start sub_037FD10C
sub_037FD10C: ; 0x037FD10C
	ldr r1, _037FD124 ; =_03807824
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_037FD124: .word _03807824
	arm_func_end sub_037FD10C

	arm_func_start sub_037FD128
sub_037FD128: ; 0x037FD128
	stmdb sp!, {r3, lr}
	ldr r1, _037FD198 ; =_03807828
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FD190
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl sub_037FD10C
	ldr r0, _037FD198 ; =_03807828
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _037FD19C ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _037FD1A0 ; =sub_037FD1B4
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl sub_037FB7BC
	mov r0, #8
	bl sub_037FB8F0
	ldr r0, _037FD198 ; =_03807828
	mov r1, #0
	str r1, [r0, #4]
_037FD190:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD198: .word _03807828
_037FD19C: .word 0x04000102
_037FD1A0: .word sub_037FD1B4
	arm_func_end sub_037FD128

	arm_func_start sub_037FD1A4
sub_037FD1A4: ; 0x037FD1A4
	ldr r0, _037FD1B0 ; =_03807828
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FD1B0: .word _03807828
	arm_func_end sub_037FD1A4

	arm_func_start sub_037FD1B4
sub_037FD1B4: ; 0x037FD1B4
	ldr r0, _037FD20C ; =_03807828
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _037FD1F8
	ldr r2, _037FD210 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_037FD1F8:
	ldr ip, _037FD214 ; =sub_037FB858
	mov r0, #0
	ldr r1, _037FD218 ; =sub_037FD1B4
	mov r2, r0
	bx ip
	.align 2, 0
_037FD20C: .word _03807828
_037FD210: .word 0x04000102
_037FD214: .word sub_037FB858
_037FD218: .word sub_037FD1B4
	arm_func_end sub_037FD1B4

	arm_func_start sub_037FD21C
sub_037FD21C: ; 0x037FD21C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl EnableIrqFlag
	ldr lr, _037FD2B4 ; =0x04000100
	ldr r1, _037FD2B8 ; =_03807828
	ldrh r3, [lr]
	ldr r2, _037FD2BC ; =0x0000FFFF
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
	beq _037FD288
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _037FD288
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_037FD288:
	bl SetIrqFlag
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
_037FD2B4: .word 0x04000100
_037FD2B8: .word _03807828
_037FD2BC: .word 0x0000FFFF
	arm_func_end sub_037FD21C

	arm_func_start sub_037FD2C0
sub_037FD2C0: ; 0x037FD2C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_037FD21C
	ldr r3, _037FD33C ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _037FD340 ; =sub_037FD648
	mov r0, #1
	bl sub_037FB858
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _037FD344 ; =0x0000FFFE
	blt _037FD31C
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	mvnlt r0, r5
	movlt r0, r0, lsl #0x10
	movlt r3, r0, lsr #0x10
_037FD31C:
	ldr r2, _037FD348 ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl sub_037FB8F0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FD33C: .word 0x04000106
_037FD340: .word sub_037FD648
_037FD344: .word 0x0000FFFE
_037FD348: .word 0x04000104
	arm_func_end sub_037FD2C0

	arm_func_start sub_037FD34C
sub_037FD34C: ; 0x037FD34C
	stmdb sp!, {r3, lr}
	ldr r1, _037FD38C ; =_03807838
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FD384
	mov r0, #1
	strh r0, [r1]
	bl sub_037FD10C
	ldr r1, _037FD38C ; =_03807838
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl sub_037FB928
_037FD384:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD38C: .word _03807838
	arm_func_end sub_037FD34C

	arm_func_start sub_037FD390
sub_037FD390: ; 0x037FD390
	ldr r0, _037FD39C ; =_03807838
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FD39C: .word _03807838
	arm_func_end sub_037FD390

	arm_func_start sub_037FD3A0
sub_037FD3A0: ; 0x037FD3A0
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_037FD3A0

	arm_func_start sub_037FD3B0
sub_037FD3B0: ; 0x037FD3B0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _037FD424
	bl sub_037FD21C
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _037FD424
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl sub_03806B80
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_037FD424:
	str r7, [r8, #0xc]
	ldr r0, _037FD4D8 ; =_03807838
	str r6, [r8, #0x10]
	mov r2, #0
	ldr r5, [r0, #4]
	mov r1, r2
	b _037FD494
_037FD440:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _037FD490
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _037FD4D0
	ldr r1, _037FD4D8 ; =_03807838
	mov r0, r8
	str r8, [r1, #4]
	bl sub_037FD2C0
	b _037FD4D0
_037FD490:
	ldr r5, [r5, #0x18]
_037FD494:
	cmp r5, #0
	bne _037FD440
	ldr r1, _037FD4D8 ; =_03807838
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	bne _037FD4D0
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl sub_037FD2C0
_037FD4D0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD4D8: .word _03807838
	arm_func_end sub_037FD3B0

	arm_func_start sub_037FD4DC
sub_037FD4DC: ; 0x037FD4DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _037FD500
	ldr r0, [r6]
	cmp r0, #0
	beq _037FD504
_037FD500:
	bl sub_037FDE70
_037FD504:
	bl EnableIrqFlag
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl sub_037FD21C
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl sub_037FD3B0
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_037FD4DC

	arm_func_start sub_037FD54C
sub_037FD54C: ; 0x037FD54C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, [sp, #0x18]
	movs r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	beq _037FD574
	ldr r0, [r4]
	cmp r0, #0
	beq _037FD578
_037FD574:
	bl sub_037FDE70
_037FD578:
	bl EnableIrqFlag
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
	bl sub_037FD3B0
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_037FD54C

	arm_func_start sub_037FD5C0
sub_037FD5C0: ; 0x037FD5C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _037FD5E4
	bl SetIrqFlag
	b _037FD63C
_037FD5E4:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldreq r2, [r5, #0x14]
	ldreq r1, _037FD644 ; =_03807838
	streq r2, [r1, #8]
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _037FD624
	ldr r1, _037FD644 ; =_03807838
	cmp r0, #0
	str r0, [r1, #4]
	beq _037FD624
	bl sub_037FD2C0
_037FD624:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl SetIrqFlag
_037FD63C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FD644: .word _03807838
	arm_func_end sub_037FD5C0

	arm_func_start sub_037FD648
sub_037FD648: ; 0x037FD648
	stmdb sp!, {r0, lr}
	bl sub_037FD658
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_037FD648

	arm_func_start sub_037FD658
sub_037FD658: ; 0x037FD658
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FD740 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl sub_037FB928
	ldr r1, _037FD744 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x10
	str r0, [r1]
	bl sub_037FD21C
	ldr r2, _037FD748 ; =_03807838
	ldr r4, [r2, #4]
	cmp r4, #0
	beq _037FD738
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _037FD6B4
	mov r0, r4
	bl sub_037FD2C0
	b _037FD738
_037FD6B4:
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
	beq _037FD6FC
	ldr r0, [r4, #4]
	mov lr, pc
	bx r5
_037FD6FC:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _037FD724
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl sub_037FD3B0
_037FD724:
	ldr r0, _037FD748 ; =_03807838
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FD738
	bl sub_037FD2C0
_037FD738:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FD740: .word 0x04000106
_037FD744: .word 0x0380FFF8
_037FD748: .word _03807838
	arm_func_end sub_037FD658

	arm_func_start sub_037FD74C
sub_037FD74C: ; 0x037FD74C
	stmdb sp!, {r3, lr}
	ldr r1, _037FD794 ; =_03807844
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FD78C
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl sub_037FB928
	ldr r0, _037FD794 ; =_03807844
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_037FD78C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD794: .word _03807844
	arm_func_end sub_037FD74C

	arm_func_start sub_037FD798
sub_037FD798: ; 0x037FD798
	ldr r0, _037FD7A4 ; =_03807844
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_037FD7A4: .word _03807844
	arm_func_end sub_037FD798

	arm_func_start sub_037FD7A8
sub_037FD7A8: ; 0x037FD7A8
	stmdb sp!, {r3, lr}
	ldr r1, _037FD848 ; =_03807844
	ldr r3, [r1, #0xc]
	b _037FD80C
_037FD7B8:
	ldr r2, [r0, #0xc]
	ldr r1, [r3, #0xc]
	cmp r1, r2
	blo _037FD808
	bne _037FD7DC
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _037FD808
_037FD7DC:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _037FD840
	ldr r1, _037FD848 ; =_03807844
	str r0, [r1, #0xc]
	bl sub_037FD9B8
	b _037FD840
_037FD808:
	ldr r3, [r3, #0x18]
_037FD80C:
	cmp r3, #0
	bne _037FD7B8
	ldr r1, _037FD848 ; =_03807844
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	bne _037FD840
	str r0, [r1, #0xc]
	bl sub_037FD9B8
_037FD840:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD848: .word _03807844
	arm_func_end sub_037FD7A8

	arm_func_start sub_037FD84C
sub_037FD84C: ; 0x037FD84C
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _037FD880 ; =_03807844
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _037FD880 ; =_03807844
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_037FD880: .word _03807844
	arm_func_end sub_037FD84C

	arm_func_start sub_037FD884
sub_037FD884: ; 0x037FD884
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_037FD884

	arm_func_start sub_037FD898
sub_037FD898: ; 0x037FD898
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r8, #0
	beq _037FD8C8
	ldr r0, [r8]
	cmp r0, #0
	beq _037FD8CC
_037FD8C8:
	bl sub_037FDE70
_037FD8CC:
	ldr r0, _037FD924 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_037FDCA8
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
	bl sub_037FD7A8
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FD924: .word 0x04000006
	arm_func_end sub_037FD898

	arm_func_start sub_037FD928
sub_037FD928: ; 0x037FD928
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r8, #0
	beq _037FD958
	ldr r0, [r8]
	cmp r0, #0
	beq _037FD95C
_037FD958:
	bl sub_037FDE70
_037FD95C:
	ldr r0, _037FD9B4 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_037FDCA8
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
	bl sub_037FD7A8
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FD9B4: .word 0x04000006
	arm_func_end sub_037FD928

	arm_func_start sub_037FD9B8
sub_037FD9B8: ; 0x037FD9B8
	stmdb sp!, {r4, lr}
	ldr r1, _037FDA0C ; =sub_037FDAF8
	mov r4, r0
	mov r0, #4
	bl sub_037FB7BC
	ldrsh r3, [r4, #0x10]
	ldr r2, _037FDA10 ; =0x04000004
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
	bl sub_037FB8F0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FDA0C: .word sub_037FDAF8
_037FDA10: .word 0x04000004
	arm_func_end sub_037FD9B8

	arm_func_start sub_037FDA14
sub_037FDA14: ; 0x037FDA14
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bne _037FDA28
	bl sub_037FDE70
_037FDA28:
	cmp r5, #0
	strne r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FDA14

	arm_func_start sub_037FDA38
sub_037FDA38: ; 0x037FDA38
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _037FDA64
	bl SetIrqFlag
	b _037FDA7C
_037FDA64:
	mov r0, r5
	bl sub_037FD84C
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl SetIrqFlag
_037FDA7C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_037FDA38

	arm_func_start sub_037FDA84
sub_037FDA84: ; 0x037FDA84
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl EnableIrqFlag
	mov r5, r0
	cmp r7, #0
	bne _037FDAA0
	bl sub_037FDE70
_037FDAA0:
	ldr r0, _037FDAF4 ; =_03807844
	mov r4, #0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r6, [r0, #0x18]
	moveq r6, #0
	b _037FDADC
_037FDABC:
	ldr r1, [r0, #8]
	cmp r1, r7
	bne _037FDACC
	bl sub_037FDA38
_037FDACC:
	mov r0, r6
	cmp r6, #0
	ldrne r6, [r6, #0x18]
	moveq r6, r4
_037FDADC:
	cmp r0, #0
	bne _037FDABC
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FDAF4: .word _03807844
	arm_func_end sub_037FDA84

	arm_func_start sub_037FDAF8
sub_037FDAF8: ; 0x037FDAF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl sub_037FB928
	ldr r2, _037FDC98 ; =0x04000004
	ldr r1, _037FDC9C ; =0x0380FFF8
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
	bl sub_037FDCA8
	ldr sl, _037FDCA0 ; =0x04000006
	mov r6, #0
	ldr r5, _037FDCA4 ; =_03807844
	sub r7, sl, #2
	mov fp, #1
	mov r8, r6
	b _037FDC84
_037FDB60:
	ldrh sb, [sl]
	mov r0, sb
	bl sub_037FDCA8
	ldrsh r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	sub r1, sb, r1
	mov sb, r0
	subs r0, sb, r2
	bmi _037FDB94
	cmp r0, #0
	bne _037FDB9C
	cmp r1, #0
	bge _037FDB9C
_037FDB94:
	mov r0, r8
	b _037FDBB8
_037FDB9C:
	cmp r1, #0
	addlt r0, r1, #7
	addlt r1, r0, #0x100
	ldrsh r0, [r4, #0x12]
	cmp r1, r0
	movle r0, fp
	movgt r0, #2
_037FDBB8:
	cmp r0, #0
	beq _037FDBD4
	cmp r0, #1
	beq _037FDC10
	cmp r0, #2
	beq _037FDC68
	b _037FDC84
_037FDBD4:
	mov r0, r4
	bl sub_037FD9B8
	ldrh r1, [sl]
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	ldreq r0, [r4, #0xc]
	cmpeq r0, sb
	bne _037FDC90
	mov r0, #4
	bl sub_037FB928
	ldrh r1, [r7]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r7]
	bl sub_037FB964
_037FDC10:
	ldr sb, [r4]
	mov r0, r4
	bl sub_037FD84C
	str r6, [r4]
	cmp sb, #0
	beq _037FDC34
	ldr r0, [r4, #4]
	mov lr, pc
	bx sb
_037FDC34:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _037FDC84
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _037FDC84
	str sb, [r4]
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl sub_037FD7A8
	b _037FDC84
_037FDC68:
	mov r0, r4
	bl sub_037FD84C
	ldr r1, [r5, #8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r4, #0xc]
	bl sub_037FD7A8
_037FDC84:
	ldr r4, [r5, #0xc]
	cmp r4, #0
	bne _037FDB60
_037FDC90:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FDC98: .word 0x04000004
_037FDC9C: .word 0x0380FFF8
_037FDCA0: .word 0x04000006
_037FDCA4: .word _03807844
	arm_func_end sub_037FDAF8

	arm_func_start sub_037FDCA8
sub_037FDCA8: ; 0x037FDCA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _037FDCE8 ; =_03807844
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _037FDCE8 ; =_03807844
	str r4, [r1, #4]
	bl SetIrqFlag
	ldr r0, _037FDCE8 ; =_03807844
	ldr r0, [r0, #8]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FDCE8: .word _03807844
	arm_func_end sub_037FDCA8

	arm_func_start ClearIrqFlag
ClearIrqFlag: ; 0x037FDCEC
	mrs r0, cpsr
	bic r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end ClearIrqFlag

	arm_func_start EnableIrqFlag
EnableIrqFlag: ; 0x037FDD00
	mrs r0, cpsr
	orr r1, r0, #0x80
	msr cpsr_c, r1
	and r0, r0, #0x80
	bx lr
	arm_func_end EnableIrqFlag

	arm_func_start SetIrqFlag
SetIrqFlag: ; 0x037FDD14
	mrs r1, cpsr
	bic r2, r1, #0x80
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0x80
	bx lr
	arm_func_end SetIrqFlag

	arm_func_start EnableIrqFiqFlags
EnableIrqFiqFlags: ; 0x037FDD2C
	mrs r0, cpsr
	orr r1, r0, #0xc0
	msr cpsr_c, r1
	and r0, r0, #0xc0
	bx lr
	arm_func_end EnableIrqFiqFlags

	arm_func_start SetIrqFiqFlags
SetIrqFiqFlags: ; 0x037FDD40
	mrs r1, cpsr
	bic r2, r1, #0xc0
	orr r2, r2, r0
	msr cpsr_c, r2
	and r0, r1, #0xc0
	bx lr
	arm_func_end SetIrqFiqFlags

	arm_func_start sub_037FDD58
sub_037FDD58: ; 0x037FDD58
	mrs r0, cpsr
	and r0, r0, #0x1f
	bx lr
	arm_func_end sub_037FDD58

	arm_func_start sub_037FDD64
sub_037FDD64: ; 0x037FDD64
	ldr ip, _037FDD78 ; =sub_038037B8
	mov r1, r0, asr #1
	add r0, r0, r1, lsr #30
	mov r0, r0, asr #2
	bx ip
	.align 2, 0
_037FDD78: .word sub_038037B8 + 1
	arm_func_end sub_037FDD64

	arm_func_start sub_037FDD7C
sub_037FDD7C: ; 0x037FDD7C
	stmdb sp!, {r3, lr}
	ldr r2, _037FDDAC ; =_03807858
	ldrh r0, [r2]
	cmp r0, #0
	bne _037FDDA4
	ldr r1, _037FDDB0 ; =sub_037FDDC4
	mov r3, #1
	mov r0, #0xc
	strh r3, [r2]
	bl sub_037FE39C
_037FDDA4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FDDAC: .word _03807858
_037FDDB0: .word sub_037FDDC4
	arm_func_end sub_037FDD7C

	arm_func_start sub_037FDDB4
sub_037FDDB4: ; 0x037FDDB4
	ldr r0, _037FDDC0 ; =_03807858
	ldrh r0, [r0, #2]
	bx lr
	.align 2, 0
_037FDDC0: .word _03807858
	arm_func_end sub_037FDDB4

	arm_func_start sub_037FDDC4
sub_037FDDC4: ; 0x037FDDC4
	stmdb sp!, {r3, lr}
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	cmp r0, #0x10
	ldreq r0, _037FDDF4 ; =_03807858
	moveq r1, #1
	streqh r1, [r0, #2]
	beq _037FDDEC
	bl sub_037FDE70
_037FDDEC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FDDF4: .word _03807858
	arm_func_end sub_037FDDC4

	arm_func_start sub_037FDDF8
sub_037FDDF8: ; 0x037FDDF8
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0
	bl sub_037FDEF4
	mov r0, #1
	bl sub_037FDEF4
	mov r0, #2
	bl sub_037FDEF4
	mov r0, #3
	bl sub_037FDEF4
	mov r0, #0x40000
	bl sub_037FB8A4
	mvn r0, #0
	bl sub_037FB964
	bl sub_037FE6B4
	mov r6, #0xc
	mov r5, #0x1000
	mov r4, #0
_037FDE3C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	bne _037FDE3C
	ldr r0, _037FDE6C ; =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl sub_038072C0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FDE6C: .word 0x04000208
	arm_func_end sub_037FDDF8

	arm_func_start sub_037FDE70
sub_037FDE70: ; 0x037FDE70
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_03806610
_037FDE7C:
	bl EnableIrqFlag
	bl sub_037F8478
	b _037FDE7C
	arm_func_end sub_037FDE70

	arm_func_start sub_037FDE88
sub_037FDE88: ; 0x037FDE88
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	mov r1, r1, lsl #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_037FDEA8:
	ldr r1, [r2]
	tst r1, #0x80000000
	bne _037FDEA8
	cmp r4, #0
	bne _037FDEE4
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _037FDEF0 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_037FDEE4:
	bl SetIrqFlag
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FDEF0: .word 0x81400001
	arm_func_end sub_037FDE88

	arm_func_start sub_037FDEF4
sub_037FDEF4: ; 0x037FDEF4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
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
	bne _037FDF64
	mov r1, #0xc
	mul r1, r4, r1
	add r2, r1, #0x4000000
	mov r3, #0
	add r1, r1, #0xb0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _037FDF70 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_037FDF64:
	bl SetIrqFlag
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FDF70: .word 0x81400001
	arm_func_end sub_037FDEF4

	arm_func_start sub_037FDF74
sub_037FDF74: ; 0x037FDF74
	mov r3, #0
_037FDF78:
	cmp r3, r2
	blt _037FDF84
	b _037FDF88
_037FDF84:
	strh r0, [r1, r3]
_037FDF88:
	blt _037FDF90
	b _037FDF94
_037FDF90:
	add r3, r3, #2
_037FDF94:
	blt _037FDF78
	bx lr
	arm_func_end sub_037FDF74

	arm_func_start sub_037FDF9C
sub_037FDF9C: ; 0x037FDF9C
	mov ip, #0
_037FDFA0:
	cmp ip, r2
	blt _037FDFAC
	b _037FDFB0
_037FDFAC:
	ldrh r3, [r0, ip]
_037FDFB0:
	blt _037FDFB8
	b _037FDFBC
_037FDFB8:
	strh r3, [r1, ip]
_037FDFBC:
	blt _037FDFC4
	b _037FDFC8
_037FDFC4:
	add ip, ip, #2
_037FDFC8:
	blt _037FDFA0
	bx lr
	arm_func_end sub_037FDF9C

	arm_func_start sub_037FDFD0
sub_037FDFD0: ; 0x037FDFD0
	add ip, r1, r2
_037FDFD4:
	cmp r1, ip
	blt _037FDFE0
	b _037FDFE4
_037FDFE0:
	stmia r1!, {r0}
_037FDFE4:
	blt _037FDFD4
	bx lr
	arm_func_end sub_037FDFD0

	arm_func_start sub_037FDFEC
sub_037FDFEC: ; 0x037FDFEC
	add ip, r1, r2
_037FDFF0:
	cmp r1, ip
	blt _037FDFFC
	b _037FE000
_037FDFFC:
	ldmia r0!, {r2}
_037FE000:
	blt _037FE008
	b _037FE00C
_037FE008:
	stmia r1!, {r2}
_037FE00C:
	blt _037FDFF0
	bx lr
	arm_func_end sub_037FDFEC

	arm_func_start sub_037FE014
sub_037FE014: ; 0x037FE014
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
_037FE040:
	cmp r1, ip
	blt _037FE04C
	b _037FE050
_037FE04C:
	stmia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
_037FE050:
	blt _037FE040
_037FE054:
	cmp r1, sb
	blt _037FE060
	b _037FE064
_037FE060:
	stmia r1!, {r0}
_037FE064:
	blt _037FE054
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end sub_037FE014

	arm_func_start sub_037FE070
sub_037FE070: ; 0x037FE070
	cmp r2, #0
	beq _037FE07C
	b _037FE080
_037FE07C:
	bx lr
_037FE080:
	tst r0, #1
	beq _037FE0AC
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	beq _037FE0A8
	b _037FE0AC
_037FE0A8:
	bx lr
_037FE0AC:
	cmp r2, #2
	blo _037FE104
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _037FE0D4
	strh r1, [r0], #2
	subs r2, r2, #2
	beq _037FE0D0
	b _037FE0D4
_037FE0D0:
	bx lr
_037FE0D4:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _037FE0F4
	sub r2, r2, r3
	add ip, r3, r0
_037FE0E8:
	str r1, [r0], #4
	cmp r0, ip
	blo _037FE0E8
_037FE0F4:
	tst r2, #2
	bne _037FE100
	b _037FE104
_037FE100:
	strh r1, [r0], #2
_037FE104:
	tst r2, #1
	beq _037FE110
	b _037FE114
_037FE110:
	bx lr
_037FE114:
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end sub_037FE070

	arm_func_start sub_037FE12C
sub_037FE12C: ; 0x037FE12C
	cmp r2, #0
	beq _037FE138
	b _037FE13C
_037FE138:
	bx lr
_037FE13C:
	tst r1, #1
	beq _037FE194
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	bne _037FE158
	b _037FE15C
_037FE158:
	ldrh r3, [r0, #-1]
_037FE15C:
	bne _037FE164
	b _037FE168
_037FE164:
	mov r3, r3, lsr #8
_037FE168:
	beq _037FE170
	b _037FE174
_037FE170:
	ldrh r3, [r0]
_037FE174:
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	beq _037FE190
	b _037FE194
_037FE190:
	bx lr
_037FE194:
	eor ip, r1, r0
	tst ip, #1
	beq _037FE1F0
	bic r0, r0, #1
	ldrh ip, [r0], #2
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _037FE1CC
_037FE1B4:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
	subs r2, r2, #2
	bhs _037FE1B4
_037FE1CC:
	tst r2, #1
	beq _037FE1D8
	b _037FE1DC
_037FE1D8:
	bx lr
_037FE1DC:
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_037FE1F0:
	tst ip, #2
	beq _037FE21C
	bics r3, r2, #1
	beq _037FE280
	sub r2, r2, r3
	add ip, r3, r1
_037FE208:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _037FE208
	b _037FE280
_037FE21C:
	cmp r2, #2
	blo _037FE280
	tst r1, #2
	beq _037FE244
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	beq _037FE240
	b _037FE244
_037FE240:
	bx lr
_037FE244:
	bics r3, r2, #3
	beq _037FE264
	sub r2, r2, r3
	add ip, r3, r1
_037FE254:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _037FE254
_037FE264:
	tst r2, #2
	bne _037FE270
	b _037FE274
_037FE270:
	ldrh r3, [r0], #2
_037FE274:
	bne _037FE27C
	b _037FE280
_037FE27C:
	strh r3, [r1], #2
_037FE280:
	tst r2, #1
	beq _037FE28C
	b _037FE290
_037FE28C:
	bx lr
_037FE290:
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end sub_037FE12C

	arm_func_start sub_037FE2AC
sub_037FE2AC: ; 0x037FE2AC
	.word 0xE1010090
	bx lr
	arm_func_end sub_037FE2AC

	arm_func_start sub_037FE2B4
sub_037FE2B4: ; 0x037FE2B4
	ldr ip, _037FE2BC ; =sub_037FE2C0
	bx ip
	.align 2, 0
_037FE2BC: .word sub_037FE2C0
	arm_func_end sub_037FE2B4

	arm_func_start sub_037FE2C0
sub_037FE2C0: ; 0x037FE2C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl EnableIrqFlag
	ldr r1, _037FE380 ; =_0380785C
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _037FE370
	ldr r0, _037FE384 ; =0x027FFC00
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	str r2, [r0, #0x38c]
	ldr r0, _037FE388 ; =_03807860
	mov r1, r2
_037FE2F8:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FE2F8
	ldr r2, _037FE38C ; =0x0000C408
	ldr r1, _037FE390 ; =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl sub_037FB964
	ldr r1, _037FE394 ; =sub_037FE4A8
	mov r0, #0x40000
	bl sub_037FB7BC
	mov r0, #0x40000
	bl sub_037FB8F0
	mov r5, #8
	ldr r8, _037FE398 ; =0x04000180
	mov r6, r5
	mov r7, #0x3e8
	b _037FE368
_037FE344:
	mov r0, r5, lsl #8
	strh r0, [r8]
	mov r0, r7
	bl sub_037FDD64
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, r5
	movne r5, r6
	sub r5, r5, #1
_037FE368:
	cmp r5, #0
	bge _037FE344
_037FE370:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FE380: .word _0380785C
_037FE384: .word 0x027FFC00
_037FE388: .word _03807860
_037FE38C: .word 0x0000C408
_037FE390: .word 0x04000184
_037FE394: .word sub_037FE4A8
_037FE398: .word 0x04000180
	arm_func_end sub_037FE2C0

	arm_func_start sub_037FE39C
sub_037FE39C: ; 0x037FE39C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _037FE3E4 ; =_03807860
	ldr r3, _037FE3E8 ; =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x38c]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	ldreq r2, [r3, #0x38c]
	mvneq r1, r1, lsl r4
	andeq r1, r2, r1
	str r1, [r3, #0x38c]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FE3E4: .word _03807860
_037FE3E8: .word 0x027FFC00
	arm_func_end sub_037FE39C

	arm_func_start sub_037FE3EC
sub_037FE3EC: ; 0x037FE3EC
	ldr r2, _037FE40C ; =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_037FE40C: .word 0x027FFC00
	arm_func_end sub_037FE3EC

	arm_func_start sub_037FE410
sub_037FE410: ; 0x037FE410
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
	bl sub_037FE448
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_037FE410

	arm_func_start sub_037FE448
sub_037FE448: ; 0x037FE448
	stmdb sp!, {r4, lr}
	ldr r2, _037FE4A4 ; =0x04000184
	mov r4, r0
	ldrh r0, [r2]
	tst r0, #0x4000
	ldrneh r1, [r2]
	mvnne r0, #0
	orrne r1, r1, #0xc000
	strneh r1, [r2]
	bne _037FE49C
	bl EnableIrqFlag
	ldr r2, _037FE4A4 ; =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _037FE490
	bl SetIrqFlag
	mvn r0, #1
	b _037FE49C
_037FE490:
	str r4, [r2, #4]
	bl SetIrqFlag
	mov r0, #0
_037FE49C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FE4A4: .word 0x04000184
	arm_func_end sub_037FE448

	arm_func_start sub_037FE4A8
sub_037FE4A8: ; 0x037FE4A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r6, [sp]
	mvn r8, #3
	ldr r4, _037FE580 ; =_03807860
	ldr sb, _037FE584 ; =0x04000184
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_037FE4CC:
	ldrh r0, [sb]
	tst r0, #0x4000
	ldrneh r0, [sb]
	addne r1, r8, #1
	orrne r0, r0, #0xc000
	strneh r0, [sb]
	bne _037FE514
	bl EnableIrqFlag
	ldrh r1, [sb]
	tst r1, #0x100
	beq _037FE504
	bl SetIrqFlag
	mov r1, r8
	b _037FE514
_037FE504:
	ldr r6, [r7]
	str r6, [sp]
	bl SetIrqFlag
	mov r1, r5
_037FE514:
	cmp r1, r8
	beq _037FE574
	cmp r1, sl
	beq _037FE4CC
	mov r0, r6, lsl #0x1b
	movs r0, r0, lsr #0x1b
	beq _037FE4CC
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _037FE554
	mov r2, r6, lsl #0x1a
	mov r1, r6, lsr #6
	mov r2, r2, lsr #0x1f
	mov lr, pc
	bx r3
_037FE550:
	b _037FE4CC
_037FE554:
	mov r0, r6, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _037FE4CC
	orr r6, r6, #0x20
	mov r0, r6
	str r6, [sp]
	bl sub_037FE448
	b _037FE4CC
_037FE574:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FE580: .word _03807860
_037FE584: .word 0x04000184
	arm_func_end sub_037FE4A8

	arm_func_start sub_037FE588
sub_037FE588: ; 0x037FE588
	ldr r2, _037FE5A4 ; =0x04000134
	mvn r3, r0
	ldrh r0, [r2]
	and r0, r3, r0
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_037FE5A4: .word 0x04000134
	arm_func_end sub_037FE588

	arm_func_start sub_037FE5A8
sub_037FE5A8: ; 0x037FE5A8
	ldr ip, _037FE5BC ; =sub_037FE588
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0xc000
	bx ip
	.align 2, 0
_037FE5BC: .word sub_037FE588
	arm_func_end sub_037FE5A8

	arm_func_start sub_037FE5C0
sub_037FE5C0: ; 0x037FE5C0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_037FD1A4
	cmp r0, #0
	beq _037FE5E0
	bl sub_037FD390
	cmp r0, #0
	bne _037FE5E8
_037FE5E0:
	mov r0, #0
	b _037FE640
_037FE5E8:
	ldr r0, _037FE64C ; =_038078E0
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #0
	bne _037FE640
	ldr r0, _037FE650 ; =_038078E4
	bl sub_037FD3A0
	bl sub_037FD21C
	ldr r2, _037FE654 ; =sub_037FE65C
	ldr r3, _037FE658 ; =0x0000082E
	str r2, [sp, #4]
	adds ip, r0, r3
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r0, _037FE650 ; =_038078E4
	mov r1, ip
	str lr, [sp]
	bl sub_037FD54C
	ldr r1, _037FE64C ; =_038078E0
	mov r0, #1
	str r0, [r1]
_037FE640:
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_037FE64C: .word _038078E0
_037FE650: .word _038078E4
_037FE654: .word sub_037FE65C
_037FE658: .word 0x0000082E
	arm_func_end sub_037FE5C0

	arm_func_start sub_037FE65C
sub_037FE65C: ; 0x037FE65C
	stmdb sp!, {r4, lr}
	mov r0, #0x8000
	mov r4, #0
	bl sub_037FE5A8
	ldr r0, _037FE694 ; =0x04000136
	ldrh r1, [r0]
	ldr r0, _037FE698 ; =0x027FFFA8
	tst r1, #0x80
	movne r4, #0x8000
	and r1, r1, #0xb
	orr r1, r4, r1, lsl #10
	strh r1, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FE694: .word 0x04000136
_037FE698: .word 0x027FFFA8
	arm_func_end sub_037FE65C

	arm_func_start sub_037FE69C
sub_037FE69C: ; 0x037FE69C
	ldr r1, _037FE6B0 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FE6B0: .word 0x04000501
	arm_func_end sub_037FE69C

	arm_func_start sub_037FE6B4
sub_037FE6B4: ; 0x037FE6B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FE700 ; =0x04000501
	mov r5, #0
	ldrb r0, [r1]
	bic r0, r0, #0x80
	strb r0, [r1]
	mov r4, #1
_037FE6D0:
	mov r0, r5
	mov r1, r4
	bl sub_037FEA20
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FE6D0
	ldr r0, _037FE704 ; =0x04000508
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FE700: .word 0x04000501
_037FE704: .word 0x04000508
	arm_func_end sub_037FE6B4

	arm_func_start sub_037FE708
sub_037FE708: ; 0x037FE708
	stmdb sp!, {r3, lr}
	ldr r2, _037FE74C ; =0x04000501
	mov r0, #0x80
	ldrb r1, [r2]
	bic r1, r1, #0x80
	strb r1, [r2]
	bl sub_037FE754
	mov r0, #0x40000
	bl sub_037FDD64
	mov r0, #1
	bl sub_03804D64
	ldr r1, _037FE750 ; =0x04000304
	ldrh r0, [r1]
	bic r0, r0, #1
	strh r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FE74C: .word 0x04000501
_037FE750: .word 0x04000304
	arm_func_end sub_037FE708

	arm_func_start sub_037FE754
sub_037FE754: ; 0x037FE754
	ldr ip, _037FE75C ; =sub_038037E6
	bx ip
	.align 2, 0
_037FE75C: .word sub_038037E6 + 1
	arm_func_end sub_037FE754

	arm_func_start sub_037FE760
sub_037FE760: ; 0x037FE760
	stmdb sp!, {r3, lr}
	ldr r2, _037FE7A4 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	bl sub_03804D40
	mov r0, #0x100
	bl sub_037FE7B0
	ldr r0, _037FE7A8 ; =0x0007AB80
	bl sub_037FDD64
	ldr r1, _037FE7AC ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FE7A4: .word 0x04000304
_037FE7A8: .word 0x0007AB80
_037FE7AC: .word 0x04000501
	arm_func_end sub_037FE760

	arm_func_start sub_037FE7B0
sub_037FE7B0: ; 0x037FE7B0
	ldr ip, _037FE7B8 ; =sub_038037DE
	bx ip
	.align 2, 0
_037FE7B8: .word sub_038037DE + 1
	arm_func_end sub_037FE7B0

	arm_func_start sub_037FE7BC
sub_037FE7BC: ; 0x037FE7BC
	ldr r1, _037FE7C8 ; =0x04000500
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FE7C8: .word 0x04000500
	arm_func_end sub_037FE7BC

	arm_func_start sub_037FE7CC
sub_037FE7CC: ; 0x037FE7CC
	ldr ip, _037FE800 ; =0x04000501
	mov r3, r3, lsl #5
	ldrb ip, [ip]
	tst ip, #0x80
	movne ip, #1
	moveq ip, #0
	orr r3, r3, ip, lsl #7
	orr r2, r3, r2, lsl #4
	orr r2, r2, r1, lsl #2
	ldr r1, _037FE800 ; =0x04000501
	orr r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FE800: .word 0x04000501
	arm_func_end sub_037FE7CC

	arm_func_start sub_037FE804
sub_037FE804: ; 0x037FE804
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FE8BC ; =_03807558
	mov r8, r1
	ldr lr, [r4]
	ldr r1, _037FE8C0 ; =_03807910
	mov r7, r2
	ldr r5, [sp, #0x2c]
	ldr r4, _037FE8C4 ; =_03807914
	ldr ip, [sp, #0x20]
	ldr r2, _037FE8C8 ; =_03807924
	strb r5, [r4, r0]
	cmp lr, #0
	ldr r1, [r1]
	movge r5, lr
	mov r6, r3
	mov r4, r0, lsl #4
	strb ip, [r2, r0]
	cmp r1, #0
	ble _037FE870
	ldr r1, _037FE8CC ; =0x0000FFF5
	mov r2, #1
	tst r1, r2, lsl r0
	beq _037FE870
	mov r0, ip
	mov r1, r5
	bl sub_037FEC40
	mov ip, r0
_037FE870:
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
_037FE8BC: .word _03807558
_037FE8C0: .word _03807910
_037FE8C4: .word _03807914
_037FE8C8: .word _03807924
_037FE8CC: .word 0x0000FFF5
	arm_func_end sub_037FE804

	arm_func_start sub_037FE8D0
sub_037FE8D0: ; 0x037FE8D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FE968 ; =_03807558
	mov r7, r1
	ldr ip, [r4]
	ldr r1, _037FE96C ; =_03807910
	mov r6, r3
	ldr r3, _037FE970 ; =_03807924
	ldr r5, [sp, #0x1c]
	ldr r4, _037FE974 ; =_03807914
	ldr r1, [r1]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r2, [r3, r0]
	cmp r1, #0
	ble _037FE934
	ldr r1, _037FE978 ; =0x0000FFF5
	mov r3, #1
	tst r1, r3, lsl r0
	beq _037FE934
	mov r0, r2
	mov r1, r5
	bl sub_037FEC40
	mov r2, r0
_037FE934:
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
_037FE968: .word _03807558
_037FE96C: .word _03807910
_037FE970: .word _03807924
_037FE974: .word _03807914
_037FE978: .word 0x0000FFF5
	arm_func_end sub_037FE8D0

	arm_func_start sub_037FE97C
sub_037FE97C: ; 0x037FE97C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FEA0C ; =_03807558
	mov r7, r2
	ldr ip, [r4]
	ldr r2, _037FEA10 ; =_03807910
	mov r6, r3
	ldr r3, _037FEA14 ; =_03807924
	ldr r5, [sp, #0x18]
	ldr r4, _037FEA18 ; =_03807914
	ldr r2, [r2]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r1, [r3, r0]
	cmp r2, #0
	ble _037FE9E0
	ldr r2, _037FEA1C ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FE9E0
	mov r0, r1
	mov r1, r5
	bl sub_037FEC40
	mov r1, r0
_037FE9E0:
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
_037FEA0C: .word _03807558
_037FEA10: .word _03807910
_037FEA14: .word _03807924
_037FEA18: .word _03807914
_037FEA1C: .word 0x0000FFF5
	arm_func_end sub_037FE97C

	arm_func_start sub_037FEA20
sub_037FEA20: ; 0x037FEA20
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
	arm_func_end sub_037FEA20

	arm_func_start sub_037FEA48
sub_037FEA48: ; 0x037FEA48
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _037FEAB4 ; =_03807910
	ldr ip, _037FEAB8 ; =_03807924
	ldr r3, [r3]
	mov r5, r0
	mov r4, r2
	strb r1, [ip, r5]
	cmp r3, #0
	ble _037FEA98
	ldr r0, _037FEABC ; =0x0000FFF5
	mov r2, #1
	tst r0, r2, lsl r5
	beq _037FEA98
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	ldrb r2, [r0, #0x402]
	mov r0, r1
	mov r1, r2
	bl sub_037FEC40
	mov r1, r0
_037FEA98:
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	orr r1, r1, r4, lsl #8
	add r0, r0, #0x400
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FEAB4: .word _03807910
_037FEAB8: .word _03807924
_037FEABC: .word 0x0000FFF5
	arm_func_end sub_037FEA48

	arm_func_start sub_037FEAC0
sub_037FEAC0: ; 0x037FEAC0
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	bx lr
	arm_func_end sub_037FEAC0

	arm_func_start sub_037FEAD8
sub_037FEAD8: ; 0x037FEAD8
	stmdb sp!, {r4, lr}
	ldr r2, _037FEB3C ; =_03807558
	ldr r3, _037FEB40 ; =_03807914
	ldr r2, [r2]
	strb r1, [r3, r0]
	cmp r2, #0
	ldr r3, _037FEB44 ; =_03807910
	mov r4, r0, lsl #4
	movge r1, r2
	add r2, r4, #0x4000000
	strb r1, [r2, #0x402]
	ldr r2, [r3]
	cmp r2, #0
	ble _037FEB34
	ldr r2, _037FEB48 ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FEB34
	ldr r2, _037FEB4C ; =_03807924
	ldrb r0, [r2, r0]
	bl sub_037FEC40
	add r1, r4, #0x4000000
	strb r0, [r1, #0x400]
_037FEB34:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FEB3C: .word _03807558
_037FEB40: .word _03807914
_037FEB44: .word _03807910
_037FEB48: .word 0x0000FFF5
_037FEB4C: .word _03807924
	arm_func_end sub_037FEAD8

	arm_func_start sub_037FEB50
sub_037FEB50: ; 0x037FEB50
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x403]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_037FEB50

	arm_func_start sub_037FEB6C
sub_037FEB6C: ; 0x037FEB6C
	ldr r1, _037FEBC8 ; =_03807558
	cmp r0, #0
	str r0, [r1]
	blt _037FEBA0
	mov r2, #0
	and r1, r0, #0xff
_037FEB84:
	mov r0, r2, lsl #4
	add r0, r0, #0x4000000
	add r2, r2, #1
	strb r1, [r0, #0x402]
	cmp r2, #0x10
	blt _037FEB84
	bx lr
_037FEBA0:
	ldr r2, _037FEBCC ; =_03807914
	mov r3, #0
_037FEBA8:
	ldrb r1, [r2, r3]
	mov r0, r3, lsl #4
	add r0, r0, #0x4000000
	add r3, r3, #1
	strb r1, [r0, #0x402]
	cmp r3, #0x10
	blt _037FEBA8
	bx lr
	.align 2, 0
_037FEBC8: .word _03807558
_037FEBCC: .word _03807914
	arm_func_end sub_037FEB6C

	arm_func_start sub_037FEBD0
sub_037FEBD0: ; 0x037FEBD0
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldr r0, [r0, #0x400]
	bx lr
	arm_func_end sub_037FEBD0

	arm_func_start sub_037FEBE0
sub_037FEBE0: ; 0x037FEBE0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _037FEC34 ; =_03807910
	ldr r5, _037FEC38 ; =_03807924
	ldr r4, _037FEC3C ; =0x0000FFF5
	str r0, [r1]
	mov r7, #0
	mov r6, #1
_037FEBFC:
	tst r4, r6, lsl r7
	beq _037FEC20
	mov r8, r7, lsl #4
	add r0, r8, #0x4000000
	ldrb r1, [r0, #0x402]
	ldrb r0, [r5, r7]
	bl sub_037FEC40
	add r1, r8, #0x4000000
	strb r0, [r1, #0x400]
_037FEC20:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FEBFC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FEC34: .word _03807910
_037FEC38: .word _03807924
_037FEC3C: .word 0x0000FFF5
	arm_func_end sub_037FEBE0

	arm_func_start sub_037FEC40
sub_037FEC40: ; 0x037FEC40
	cmp r1, #0x18
	bge _037FEC70
	ldr r2, _037FECA4 ; =_03807910
	add r3, r1, #0x28
	ldr ip, [r2]
	ldr r1, _037FECA8 ; =0x00007FFF
	mul r2, ip, r3
	sub r1, r1, ip
	add r1, r2, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
_037FEC70:
	cmp r1, #0x68
	bxle lr
	ldr r2, _037FECA4 ; =_03807910
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
_037FECA4: .word _03807910
_037FECA8: .word 0x00007FFF
	arm_func_end sub_037FEC40

	arm_func_start sub_037FECAC
sub_037FECAC: ; 0x037FECAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	rsb r0, r1, #0
	mov r4, #0
	b _037FECC8
_037FECC0:
	sub r4, r4, #1
	add r0, r0, #0x300
_037FECC8:
	cmp r0, #0
	blt _037FECC0
	b _037FECDC
_037FECD4:
	add r4, r4, #1
	sub r0, r0, #0x300
_037FECDC:
	cmp r0, #0x300
	bge _037FECD4
	bl sub_037FEDCC
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
	bgt _037FED34
	rsb r3, r0, #0
	mov r4, r2, lsr r3
	rsb r0, r3, #0x20
	orr r4, r4, r1, lsl r0
	sub r0, r3, #0x20
	mov r3, r1, lsr r3
	orr r4, r4, r1, lsr r0
	b _037FED90
_037FED34:
	cmp r0, #0x20
	bge _037FED88
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
	bne _037FEDC0
	mov r3, r1, lsl r0
	orr r3, r3, r2, lsr r5
	sub r1, r0, #0x20
	mov r4, r2, lsl r0
	orr r3, r3, r2, lsl r1
	b _037FED90
_037FED88:
	sub r0, r4, #1
	b _037FEDC0
_037FED90:
	mov r0, #0x10
	cmp r3, #0
	cmpeq r4, #0x10
	mov r1, #0
	movlo r4, r0
	blo _037FEDB8
	ldr r0, _037FEDC8 ; =0x0000FFFF
	cmp r3, r1
	cmpeq r4, r0
	movhi r4, r0
_037FEDB8:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
_037FEDC0:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FEDC8: .word 0x0000FFFF
	arm_func_end sub_037FECAC

	arm_func_start sub_037FEDCC
sub_037FEDCC: ; 0x037FEDCC
	ldr ip, _037FEDD4 ; =sub_03803828
	bx ip
	.align 2, 0
_037FEDD4: .word sub_03803828 + 1
	arm_func_end sub_037FEDCC

	arm_func_start sub_037FEDD8
sub_037FEDD8: ; 0x037FEDD8
	stmdb sp!, {r4, lr}
	ldr r1, _037FEE48 ; =0xFFFFFD2D
	mov r4, r0
	cmp r4, r1
	movlt r4, r1
	blt _037FEDF8
	cmp r4, #0
	movgt r4, #0
_037FEDF8:
	add r0, r4, #0xd3
	add r0, r0, #0x200
	bl sub_037FEE4C
	mvn r2, #0xef
	cmp r4, r2
	movlt r1, #3
	blt _037FEE34
	add r1, r2, #0x78
	cmp r4, r1
	movlt r1, #2
	blt _037FEE34
	add r1, r2, #0xb4
	cmp r4, r1
	movlt r1, #1
	movge r1, #0
_037FEE34:
	orr r0, r0, r1, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FEE48: .word 0xFFFFFD2D
	arm_func_end sub_037FEDD8

	arm_func_start sub_037FEE4C
sub_037FEE4C: ; 0x037FEE4C
	ldr ip, _037FEE54 ; =sub_0380382C
	bx ip
	.align 2, 0
_037FEE54: .word sub_0380382C + 1
	arm_func_end sub_037FEE4C

	arm_func_start sub_037FEE58
sub_037FEE58: ; 0x037FEE58
	cmp r0, #0x20
	ldrlt r1, _037FEEC0 ; =_03806FB8
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x40
	ldrlt r1, _037FEEC0 ; =_03806FB8
	rsblt r0, r0, #0x40
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x60
	bge _037FEEA0
	ldr r1, _037FEEC0 ; =_03806FB8
	sub r0, r0, #0x40
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
_037FEEA0:
	ldr r1, _037FEEC0 ; =_03806FB8
	sub r0, r0, #0x60
	rsb r0, r0, #0x20
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
	.align 2, 0
_037FEEC0: .word _03806FB8
	arm_func_end sub_037FEE58

	arm_func_start sub_037FEEC4
sub_037FEEC4: ; 0x037FEEC4
	ldr r2, _037FEEEC ; =_0380755C
	ldr r0, _037FEEF0 ; =0x0019660D
	ldr r3, [r2]
	ldr r1, _037FEEF4 ; =0x3C6EF35F
	mla r1, r3, r0, r1
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	str r1, [r2]
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_037FEEEC: .word _0380755C
_037FEEF0: .word 0x0019660D
_037FEEF4: .word 0x3C6EF35F
	arm_func_end sub_037FEEC4

	arm_func_start sub_037FEEF8
sub_037FEEF8: ; 0x037FEEF8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _037FEF54 ; =_03807934
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _037FEF48
	mov r0, #1
	str r0, [r1]
	bl sub_03801ED8
	mov r0, #0x400
	str r0, [sp]
	ldr r0, _037FEF58 ; =_038079A4
	ldr r1, _037FEF5C ; =sub_037FF008
	ldr r3, _037FEF60 ; =_03807E48
	mov r2, #0
	str r4, [sp, #4]
	bl sub_037FC054
	ldr r0, _037FEF58 ; =_038079A4
	bl sub_037FC36C
_037FEF48:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FEF54: .word _03807934
_037FEF58: .word _038079A4
_037FEF5C: .word sub_037FF008
_037FEF60: .word _03807E48
	arm_func_end sub_037FEEF8

	arm_func_start sub_037FEF64
sub_037FEF64: ; 0x037FEF64
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl sub_037FD21C
	ldr r3, _037FEFA8 ; =sub_037FEFEC
	adds ip, r0, #0x10000
	str r3, [sp, #4]
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r3, _037FEFAC ; =0x00000AA8
	ldr r0, _037FEFB0 ; =_03807978
	mov r1, ip
	str lr, [sp]
	bl sub_037FD54C
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_037FEFA8: .word sub_037FEFEC
_037FEFAC: .word 0x00000AA8
_037FEFB0: .word _03807978
	arm_func_end sub_037FEF64

	arm_func_start sub_037FEFB4
sub_037FEFB4: ; 0x037FEFB4
	ldr ip, _037FEFC0 ; =sub_037FD5C0
	ldr r0, _037FEFC4 ; =_03807978
	bx ip
	.align 2, 0
_037FEFC0: .word sub_037FD5C0
_037FEFC4: .word _03807978
	arm_func_end sub_037FEFB4

	arm_func_start sub_037FEFC8
sub_037FEFC8: ; 0x037FEFC8
	ldr ip, _037FEFDC ; =sub_037FC6D4
	ldr r0, _037FEFE0 ; =_03807958
	mov r1, #2
	mov r2, #0
	bx ip
	.align 2, 0
_037FEFDC: .word sub_037FC6D4
_037FEFE0: .word _03807958
	arm_func_end sub_037FEFC8

	arm_func_start sub_037FEFE4
sub_037FEFE4: ; 0x037FEFE4
	bx lr
	arm_func_end sub_037FEFE4

	arm_func_start sub_037FEFE8
sub_037FEFE8: ; 0x037FEFE8
	bx lr
	arm_func_end sub_037FEFE8

	arm_func_start sub_037FEFEC
sub_037FEFEC: ; 0x037FEFEC
	ldr ip, _037FF000 ; =sub_037FC6D4
	ldr r0, _037FF004 ; =_03807958
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_037FF000: .word sub_037FC6D4
_037FF004: .word _03807958
	arm_func_end sub_037FEFEC

	arm_func_start sub_037FF008
sub_037FF008: ; 0x037FF008
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _037FF0E8 ; =_03807958
	ldr r1, _037FF0EC ; =_03807938
	mov r2, #8
	bl sub_037FC6AC
	ldr r0, _037FF0F0 ; =_03807978
	bl sub_037FD3A0
	bl sub_037FF164
	bl sub_037FFEF0
	bl sub_03801D24
	bl sub_037FE69C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_037FE7CC
	mov r0, #0x7f
	bl sub_037FE7BC
	bl sub_037FD21C
	ldr r2, _037FF0F4 ; =sub_037FEFEC
	adds r4, r0, #0x10000
	str r2, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	adc r2, r1, #0
	ldr r3, _037FF0F8 ; =0x00000AA8
	ldr r0, _037FF0F0 ; =_03807978
	mov r1, r4
	bl sub_037FD54C
	ldr r7, _037FF0E8 ; =_03807958
	mov r4, #1
	add r6, sp, #0xc
	mov r8, #0
	mov r5, r4
_037FF098:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov sb, r8
	bl sub_037FC760
	ldr r0, [sp, #0xc]
	cmp r0, #1
	beq _037FF0C0
	cmp r0, #2
	b _037FF0C4
_037FF0C0:
	mov sb, r4
_037FF0C4:
	bl sub_037FF1C0
	bl sub_03801F1C
	mov r0, sb
	bl sub_037FFF54
	mov r0, sb
	bl sub_037FF3AC
	bl sub_03801C8C
	bl sub_037FEEC4
	b _037FF098
	.align 2, 0
_037FF0E8: .word _03807958
_037FF0EC: .word _03807938
_037FF0F0: .word _03807978
_037FF0F4: .word sub_037FEFEC
_037FF0F8: .word 0x00000AA8
	arm_func_end sub_037FF008

	arm_func_start sub_037FF0FC
sub_037FF0FC: ; 0x037FF0FC
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
	arm_func_end sub_037FF0FC

	arm_func_start sub_037FF14C
sub_037FF14C: ; 0x037FF14C
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x508]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end sub_037FF14C

	arm_func_start sub_037FF164
sub_037FF164: ; 0x037FF164
	stmdb sp!, {r3, lr}
	ldr r3, _037FF1B8 ; =_03807E70
	mov lr, #0
	mov r0, #0x54
_037FF174:
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
	blt _037FF174
	ldr r0, _037FF1BC ; =_03807E48
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF1B8: .word _03807E70
_037FF1BC: .word _03807E48
	arm_func_end sub_037FF164

	arm_func_start sub_037FF1C0
sub_037FF1C0: ; 0x037FF1C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	ldr r7, _037FF3A8 ; =_03807E70
	mov sb, #0
	mov r4, #2
	mov r5, #1
	mov r6, sb
	mov sl, #0x54
_037FF1E0:
	mla r8, sb, sl, r7
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _037FF340
	tst r0, #2
	beq _037FF208
	mov r0, sb
	mov r1, r6
	bl sub_037FEA20
_037FF208:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #1
	beq _037FF2E4
	ldrb r0, [r8, #1]
	cmp r0, #0
	beq _037FF23C
	cmp r0, #1
	beq _037FF294
	cmp r0, #2
	beq _037FF2C0
	b _037FF340
_037FF23C:
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
	bl sub_037FE804
	b _037FF340
_037FF294:
	ldrh r3, [r8, #0x24]
	ldrh r1, [r8, #0x26]
	mov r0, sb
	str r1, [sp]
	ldrb r1, [r8, #0x23]
	and r2, r3, #0xff
	str r1, [sp, #4]
	ldr r1, [r8, #0x44]
	mov r3, r3, asr #8
	bl sub_037FE8D0
	b _037FF340
_037FF2C0:
	ldrh r2, [r8, #0x24]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp]
	ldrh r3, [r8, #0x26]
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_037FE97C
	b _037FF340
_037FF2E4:
	tst r0, #4
	beq _037FF2F8
	ldrh r1, [r8, #0x26]
	mov r0, sb
	bl sub_037FEAC0
_037FF2F8:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #8
	beq _037FF320
	ldrh r2, [r8, #0x24]
	mov r0, sb
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl sub_037FEA48
_037FF320:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #0x10
	beq _037FF340
	ldrb r1, [r8, #0x23]
	mov r0, sb
	bl sub_037FEAD8
_037FF340:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FF1E0
	ldr r3, _037FF3A8 ; =_03807E70
	mov r4, #0
	mov r1, #0x54
_037FF358:
	mla r5, r4, r1, r3
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _037FF390
	tst r0, #1
	movne r0, r4, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r2, [r0, #0x403]
	orrne r2, r2, #0x80
	strneb r2, [r0, #0x403]
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	strb r0, [r5, #3]
_037FF390:
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FF358
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FF3A8: .word _03807E70
	arm_func_end sub_037FF1C0

	arm_func_start sub_037FF3AC
sub_037FF3AC: ; 0x037FF3AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, #0x8000
	mov sl, r0
	mov r5, #0
	rsb fp, fp, #0
_037FF3C0:
	ldr r0, _037FF750 ; =_03807E70
	mov r1, #0x54
	mla r4, r5, r1, r0
	ldrb r2, [r4, #3]
	mov r6, #0
	mov r0, r2, lsl #0x1f
	mov r7, r6
	mov r8, r6
	movs r0, r0, lsr #0x1f
	beq _037FF73C
	mov r0, r2, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FF424
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
	b _037FF474
_037FF424:
	mov r0, r5
	bl sub_037FEB50
	cmp r0, #0
	bne _037FF474
	ldr r3, [r4, #0x48]
	cmp r3, #0
	moveq r0, r6
	streqb r0, [r4, #0x22]
	beq _037FF45C
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #1
	mov lr, pc
	bx r3
_037FF45C:
	mov r0, #0
	strh r0, [r4, #0x24]
	ldrb r0, [r4, #3]
	bic r0, r0, #1
	strb r0, [r4, #3]
	b _037FF73C
_037FF474:
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #8]
	mov r2, r0, lsl #1
	ldr r0, _037FF754 ; =_03806FDC
	ldrsh r2, [r0, r2]
	ldrb r0, [r4, #5]
	add r6, r6, r2
	sub r0, r1, r0
	add r7, r7, r0, lsl #6
	mov r0, r4
	mov r1, sl
	bl sub_037FF82C
	ldrsh r3, [r4, #0x32]
	add r6, r6, r0
	cmp r3, #0
	moveq r0, #0
	beq _037FF4FC
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	cmp r0, r2
	movge r0, #0
	bge _037FF4FC
	sub r0, r2, r0
	smull r0, r1, r3, r0
	mov r3, r2, asr #0x1f
	bl sub_038069D0
	cmp sl, #0
	beq _037FF4FC
	ldrb r1, [r4, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	ldrne r1, [r4, #0x14]
	addne r1, r1, #1
	strne r1, [r4, #0x14]
_037FF4FC:
	ldrsh r1, [r4, #0xc]
	add r2, r7, r0
	ldrsh r0, [r4, #6]
	add r1, r6, r1
	add r6, r1, r0
	ldrsh r1, [r4, #0xe]
	add r0, r4, #0x28
	add r7, r2, r1
	bl sub_037FFE14
	mov r1, r0, asr #0x1f
	cmp r1, #0
	mov sb, r0
	cmpeq r0, #0
	beq _037FF590
	ldrb r2, [r4, #0x28]
	cmp r2, #0
	beq _037FF57C
	cmp r2, #1
	beq _037FF55C
	cmp r2, #2
	moveq r1, r1, lsl #6
	orreq r1, r1, r0, lsr #26
	moveq sb, r0, lsl #6
	b _037FF588
_037FF55C:
	mov r2, #0x3c
	umull sb, r3, r0, r2
	mov r2, #0
	mla r3, r0, r2, r3
	mov r0, #0x3c
	mla r3, r1, r0, r3
	mov r1, r3
	b _037FF588
_037FF57C:
	mov r1, r1, lsl #6
	orr r1, r1, r0, lsr #26
	mov sb, r0, lsl #6
_037FF588:
	mov sb, sb, lsr #0xe
	orr sb, sb, r1, lsl #18
_037FF590:
	cmp sl, #0
	beq _037FF5A0
	add r0, r4, #0x28
	bl sub_037FFDB4
_037FF5A0:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	beq _037FF5CC
	cmp r0, #1
	beq _037FF5C0
	cmp r0, #2
	addeq r8, r8, sb
	b _037FF5D0
_037FF5C0:
	cmp r6, fp
	addgt r6, r6, sb
	b _037FF5D0
_037FF5CC:
	add r7, r7, sb
_037FF5D0:
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
	bne _037FF65C
	ldr r0, _037FF758 ; =0xFFFFFD2D
	cmp r6, r0
	bgt _037FF65C
	ldrb r0, [r4, #3]
	bic r0, r0, #0xf8
	orr r0, r0, #0x10
	strb r0, [r4, #3]
	ldr r3, [r4, #0x48]
	cmp r3, #0
	moveq r0, #0
	streqb r0, [r4, #0x22]
	beq _037FF644
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #1
	mov lr, pc
	bx r3
_037FF644:
	mov r0, #0
	strh r0, [r4, #0x24]
	ldrb r0, [r4, #3]
	bic r0, r0, #1
	strb r0, [r4, #3]
	b _037FF73C
_037FF65C:
	mov r0, r6
	bl sub_037FEDD8
	mov r6, r0
	ldrh r0, [r4, #0x3c]
	mov r1, r7
	bl sub_037FECAC
	ldrb r1, [r4, #1]
	cmp r1, #1
	ldreq r1, _037FF75C ; =0x0000FFFC
	andeq r0, r0, r1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	adds r8, r8, #0x40
	movmi r8, #0
	bmi _037FF6A0
	cmp r8, #0x7f
	movgt r8, #0x7f
_037FF6A0:
	ldrh r1, [r4, #0x24]
	cmp r6, r1
	beq _037FF6D4
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
_037FF6D4:
	ldrh r1, [r4, #0x26]
	cmp r0, r1
	beq _037FF708
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
_037FF708:
	ldrb r0, [r4, #0x23]
	cmp r8, r0
	beq _037FF73C
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
_037FF73C:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FF3C0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF750: .word _03807E70
_037FF754: .word _03806FDC
_037FF758: .word 0xFFFFFD2D
_037FF75C: .word 0x0000FFFC
	arm_func_end sub_037FF3AC

	arm_func_start sub_037FF760
sub_037FF760: ; 0x037FF760
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
	bl sub_037FFEB8
	mov r0, #1
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FF760

	arm_func_start sub_037FF79C
sub_037FF79C: ; 0x037FF79C
	stmdb sp!, {r3, lr}
	ldrb r3, [r0]
	cmp r3, #8
	movlo r0, #0
	blo _037FF7DC
	cmp r3, #0xd
	movhi r0, #0
	bhi _037FF7DC
	mov r3, #1
	strb r3, [r0, #1]
	str r1, [r0, #0x44]
	ldr r3, _037FF7E4 ; =0x00001F46
	mov r1, r2
	strh r3, [r0, #0x3c]
	bl sub_037FFEB8
	mov r0, #1
_037FF7DC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7E4: .word 0x00001F46
	arm_func_end sub_037FF79C

	arm_func_start sub_037FF7E8
sub_037FF7E8: ; 0x037FF7E8
	stmdb sp!, {r3, lr}
	ldrb r2, [r0]
	cmp r2, #0xe
	movlo r0, #0
	blo _037FF820
	cmp r2, #0xf
	movhi r0, #0
	bhi _037FF820
	ldr r2, _037FF828 ; =0x00001F46
	mov r3, #2
	strb r3, [r0, #1]
	strh r2, [r0, #0x3c]
	bl sub_037FFEB8
	mov r0, #1
_037FF820:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF828: .word 0x00001F46
	arm_func_end sub_037FF7E8

	arm_func_start sub_037FF82C
sub_037FF82C: ; 0x037FF82C
	cmp r1, #0
	beq _037FF8C4
	ldrb r1, [r0, #2]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _037FF8C4
_037FF844: ; jump table
	b _037FF854 ; case 0
	b _037FF87C ; case 1
	b _037FF8C4 ; case 2
	b _037FF8B4 ; case 3
_037FF854:
	ldr r2, [r0, #0x10]
	ldrb r1, [r0, #0x1c]
	rsb r2, r2, #0
	mul r1, r2, r1
	mov r1, r1, asr #8
	rsbs r1, r1, #0
	str r1, [r0, #0x10]
	moveq r1, #1
	streqb r1, [r0, #2]
	b _037FF8C4
_037FF87C:
	ldrb r2, [r0, #0x1d]
	ldr r1, _037FF8D0 ; =_03806FDC
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
	b _037FF8C4
_037FF8B4:
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r0, #0x10]
_037FF8C4:
	ldr r0, [r0, #0x10]
	mov r0, r0, asr #7
	bx lr
	.align 2, 0
_037FF8D0: .word _03806FDC
	arm_func_end sub_037FF82C

	arm_func_start sub_037FF8D4
sub_037FF8D4: ; 0x037FF8D4
	cmp r1, #0x6d
	ldrge r2, _037FF8F0 ; =_038071F0
	rsblt r1, r1, #0xff
	rsbge r1, r1, #0x7f
	ldrgeb r1, [r2, r1]
	strb r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_037FF8F0: .word _038071F0
	arm_func_end sub_037FF8D4

	arm_func_start sub_037FF8F4
sub_037FF8F4: ; 0x037FF8F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_037FFE64
	strh r0, [r4, #0x1e]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FF8F4

	arm_func_start sub_037FF910
sub_037FF910: ; 0x037FF910
	strb r1, [r0, #0x1d]
	bx lr
	arm_func_end sub_037FF910

	arm_func_start sub_037FF918
sub_037FF918: ; 0x037FF918
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_037FFE64
	strh r0, [r4, #0x20]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FF918

	arm_func_start sub_037FF934
sub_037FF934: ; 0x037FF934
	mov r1, #3
	strb r1, [r0, #2]
	bx lr
	arm_func_end sub_037FF934

	arm_func_start sub_037FF940
sub_037FF940: ; 0x037FF940
	ldrb r0, [r0, #3]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	bx lr
	arm_func_end sub_037FF940

	arm_func_start sub_037FF950
sub_037FF950: ; 0x037FF950
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FFB08 ; =_03807E48
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
	ldr r3, _037FFB0C ; =_038071DC
	ldr r8, _037FFB10 ; =_038071E0
	mov sb, r4
	mvn r1, #0
	mov fp, #1
_037FF994:
	ldrb ip, [r8, sb]
	tst r0, fp, lsl ip
	beq _037FFA14
	ldr r2, _037FFB14 ; =_03807E70
	mov r7, #0x54
	mla sl, ip, r7, r2
	cmp r4, #0
	moveq r4, sl
	beq _037FFA14
	ldrb r7, [r4, #0x22]
	ldrb r2, [sl, #0x22]
	cmp r2, r7
	bhi _037FFA14
	bne _037FFA10
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
	beq _037FFA04
	movlt r2, fp
	movge r2, r1
	b _037FFA08
_037FFA04:
	mov r2, #0
_037FFA08:
	cmp r2, #0
	bge _037FFA14
_037FFA10:
	mov r4, sl
_037FFA14:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FF994
	cmp r4, #0
	moveq r0, #0
	beq _037FFB00
	ldrb r0, [r4, #0x22]
	cmp r6, r0
	movlt r0, #0
	blt _037FFB00
	ldr r3, [r4, #0x48]
	cmp r3, #0
	beq _037FFA5C
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #0
	mov lr, pc
	bx r3
_037FFA5C:
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
	ldr r1, _037FFB18 ; =0x0000FFFF
	strb r7, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	strb r3, [r4, #0x1d]
	add r0, r4, #0x28
	strh r1, [r4, #0x20]
	bl sub_037FFD90
	mov r0, r4
_037FFB00:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFB08: .word _03807E48
_037FFB0C: .word _038071DC
_037FFB10: .word _038071E0
_037FFB14: .word _03807E70
_037FFB18: .word 0x0000FFFF
	arm_func_end sub_037FF950

	arm_func_start sub_037FFB1C
sub_037FFB1C: ; 0x037FFB1C
	cmp r0, #0
	movne r1, #0
	strne r1, [r0, #0x48]
	strne r1, [r0, #0x4c]
	bx lr
	arm_func_end sub_037FFB1C

	arm_func_start sub_037FFB30
sub_037FFB30: ; 0x037FFB30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	ldr r7, _037FFBD8 ; =_03807E70
	ldr r4, _037FFBDC ; =_03807E48
	mov sl, r0
	mov r5, sb
	mov r6, #1
	mov fp, #0x54
	b _037FFBC0
_037FFB54:
	tst sl, #1
	beq _037FFBB8
	ldr r0, [r4, #4]
	mla r8, sb, fp, r7
	tst r0, r6, lsl sb
	bne _037FFBB8
	ldr r3, [r8, #0x48]
	cmp r3, #0
	beq _037FFB8C
	ldr r2, [r8, #0x4c]
	mov r0, r8
	mov r1, #0
	mov lr, pc
	bx r3
_037FFB8C:
	mov r0, sb
	mov r1, #0
	bl sub_037FEA20
	strb r5, [r8, #0x22]
	mov r0, r8
	bl sub_037FFB1C
	ldrb r0, [r8, #3]
	bic r1, r0, #0xf8
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r8, #3]
_037FFBB8:
	add sb, sb, #1
	mov sl, sl, lsr #1
_037FFBC0:
	cmp sb, #0x10
	bge _037FFBD0
	cmp sl, #0
	bne _037FFB54
_037FFBD0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFBD8: .word _03807E70
_037FFBDC: .word _03807E48
	arm_func_end sub_037FFB30

	arm_func_start sub_037FFBE0
sub_037FFBE0: ; 0x037FFBE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r8, #0
	ldr r5, _037FFCB8 ; =_03807E70
	mov sb, r1
	mov r7, sl
	mov fp, r8
	mov r4, #1
	b _037FFC7C
_037FFC04:
	tst r7, #1
	beq _037FFC74
	ldr r0, _037FFCBC ; =_03807E48
	ldr r1, [r0, #4]
	mov r0, #0x54
	mla r6, r8, r0, r5
	tst r1, r4, lsl r8
	bne _037FFC74
	ldr r3, [r6, #0x48]
	cmp r3, #0
	beq _037FFC44
	ldr r2, [r6, #0x4c]
	mov r0, r6
	mov r1, #0
	mov lr, pc
	bx r3
_037FFC44:
	mov r0, r8
	mov r1, #0
	bl sub_037FEA20
	strb fp, [r6, #0x22]
	mov r0, r6
	bl sub_037FFB1C
	ldrb r0, [r6, #3]
	bic r0, r0, #0xf8
	strb r0, [r6, #3]
	and r0, r0, #0xff
	bic r0, r0, #1
	strb r0, [r6, #3]
_037FFC74:
	add r8, r8, #1
	mov r7, r7, lsr #1
_037FFC7C:
	cmp r8, #0x10
	bge _037FFC8C
	cmp r7, #0
	bne _037FFC04
_037FFC8C:
	tst sb, #1
	ldrne r0, _037FFCBC ; =_03807E48
	ldrne r1, [r0]
	orrne r1, r1, sl
	strne r1, [r0]
	ldreq r0, _037FFCBC ; =_03807E48
	ldreq r1, [r0, #4]
	orreq r1, r1, sl
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFCB8: .word _03807E70
_037FFCBC: .word _03807E48
	arm_func_end sub_037FFBE0

	arm_func_start sub_037FFCC0
sub_037FFCC0: ; 0x037FFCC0
	tst r1, #1
	ldreq r1, _037FFCF4 ; =_03807E48
	mvneq r0, r0
	ldreq r2, [r1, #4]
	andeq r0, r2, r0
	streq r0, [r1, #4]
	bxeq lr
	ldr r1, _037FFCF4 ; =_03807E48
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_037FFCF4: .word _03807E48
	arm_func_end sub_037FFCC0

	arm_func_start sub_037FFCF8
sub_037FFCF8: ; 0x037FFCF8
	tst r0, #1
	ldrne r0, _037FFD10 ; =_03807E48
	ldrne r0, [r0]
	ldreq r0, _037FFD10 ; =_03807E48
	ldreq r0, [r0, #4]
	bx lr
	.align 2, 0
_037FFD10: .word _03807E48
	arm_func_end sub_037FFCF8

	arm_func_start sub_037FFD14
sub_037FFD14: ; 0x037FFD14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _037FFD8C ; =_03807E70
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r4, r6
	mov sb, #0x54
_037FFD30:
	mla r2, r6, sb, r5
	ldrb r1, [r2, #3]
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FFD74
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _037FFD74
	ldr r0, [r2, #0x44]
	cmp r8, r0
	cmpls r0, r7
	bhi _037FFD74
	bic r3, r1, #2
	mov r0, r6
	mov r1, r4
	strb r3, [r2, #3]
	bl sub_037FEA20
_037FFD74:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #0x10
	blo _037FFD30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFD8C: .word _03807E70
	arm_func_end sub_037FFD14

	arm_func_start sub_037FFD90
sub_037FFD90: ; 0x037FFD90
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #2]
	mov r1, #1
	strb r1, [r0, #3]
	mov r1, #0x10
	strb r1, [r0, #1]
	strh r2, [r0, #4]
	bx lr
	arm_func_end sub_037FFD90

	arm_func_start sub_037FFDB4
sub_037FFDB4: ; 0x037FFDB4
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
	b _037FFDE4
_037FFDE0:
	sub r3, r3, #0x80
_037FFDE4:
	cmp r3, #0x80
	bhs _037FFDE0
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
	arm_func_end sub_037FFDB4

	arm_func_start sub_037FFE14
sub_037FFE14: ; 0x037FFE14
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #2]
	cmp r0, #0
	moveq r0, #0
	beq _037FFE5C
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #4]
	cmp r1, r0
	movlo r0, #0
	blo _037FFE5C
	ldrh r0, [r4, #8]
	mov r0, r0, lsr #8
	bl sub_037FEE58
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	mul r0, r1, r0
	mul r0, r2, r0
_037FFE5C:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_037FFE14

	arm_func_start sub_037FFE64
sub_037FFE64: ; 0x037FFE64
	stmdb sp!, {r3, lr}
	cmp r0, #0x7f
	ldreq r0, _037FFEB4 ; =0x0000FFFF
	beq _037FFEAC
	cmp r0, #0x7e
	moveq r0, #0x3c00
	beq _037FFEAC
	cmp r0, #0x32
	movlt r0, r0, lsl #1
	addlt r0, r0, #1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _037FFEAC
	rsb r1, r0, #0x7e
	mov r0, #0x1e00
	bl sub_03806BC8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_037FFEAC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFEB4: .word 0x0000FFFF
	arm_func_end sub_037FFE64

	arm_func_start sub_037FFEB8
sub_037FFEB8: ; 0x037FFEB8
	ldr r3, _037FFEEC ; =0xFFFE9680
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
_037FFEEC: .word 0xFFFE9680
	arm_func_end sub_037FFEB8

	arm_func_start sub_037FFEF0
sub_037FFEF0: ; 0x037FFEF0
	stmdb sp!, {r3, lr}
	ldr r3, _037FFF4C ; =_038083B0
	mov lr, #0
	mov r0, #0x24
_037FFF00:
	mul r2, lr, r0
	ldrb r1, [r3, r2]
	add ip, r3, r2
	bic r1, r1, #1
	strb r1, [r3, r2]
	strb lr, [ip, #1]
	add lr, lr, #1
	cmp lr, #0x10
	blt _037FFF00
	ldr r1, _037FFF50 ; =_038085F0
	mov r2, #0
_037FFF2C:
	ldrb r0, [r1, r2, lsl #6]
	bic r0, r0, #1
	strb r0, [r1, r2, lsl #6]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FFF2C
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFF4C: .word _038083B0
_037FFF50: .word _038085F0
	arm_func_end sub_037FFEF0

	arm_func_start sub_037FFF54
sub_037FFF54: ; 0x037FFF54
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov sb, r0
	mov r5, r6
_037FFF64:
	mov r0, #0x24
	mul r0, r5, r0
	ldr r2, _038000AC ; =_038083B0
	ldrb r1, [r2, r0]
	add r4, r2, r0
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _03800088
	mov r0, r1, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _03800074
	cmp sb, #0
	beq _03800040
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _03800040
	mov r8, #0
	b _037FFFBC
_037FFFAC:
	ldrh r0, [r4, #0x1c]
	add r8, r8, #1
	sub r0, r0, #0xf0
	strh r0, [r4, #0x1c]
_037FFFBC:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0xf0
	bhs _037FFFAC
	mov r7, #0
	mov sl, #1
	b _037FFFF8
_037FFFD4:
	mov r0, r4
	mov r1, sl
	bl sub_03800CF0
	cmp r0, #0
	beq _037FFFF4
	mov r0, r4
	bl sub_03800B00
	b _03800000
_037FFFF4:
	add r7, r7, #1
_037FFFF8:
	cmp r7, r8
	blt _037FFFD4
_03800000:
	ldr r0, _038000B0 ; =_03807E6C
	ldr r2, [r0]
	cmp r2, #0
	beq _03800028
	ldrb r1, [r4, #1]
	mov r0, #0x24
	mla r2, r1, r0, r2
	ldr r0, [r2, #0x40]
	add r0, r0, r7
	str r0, [r2, #0x40]
_03800028:
	ldrh r2, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r4, #0x1c]
	mul r1, r2, r1
	add r0, r0, r1, asr #8
	strh r0, [r4, #0x1c]
_03800040:
	mov r8, #0
	mov r7, #1
_03800048:
	mov r0, r4
	mov r1, r8
	bl sub_03800A7C
	cmp r0, #0
	beq _03800068
	mov r1, r4
	mov r2, r7
	bl sub_03800B98
_03800068:
	add r8, r8, #1
	cmp r8, #0x10
	blt _03800048
_03800074:
	ldrb r0, [r4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	orrne r6, r6, r0, lsl r5
_03800088:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FFF64
	ldr r0, _038000B0 ; =_03807E6C
	ldr r0, [r0]
	cmp r0, #0
	strne r6, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_038000AC: .word _038083B0
_038000B0: .word _03807E6C
	arm_func_end sub_037FFF54

	arm_func_start sub_038000B4
sub_038000B4: ; 0x038000B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x24
	mul r5, sb, r0
	ldr r6, _03800284 ; =_038083B0
	mov r8, r1
	ldrb r0, [r6, r5]
	mov r7, r2
	mov r0, r0, lsl #0x1f
	mov r4, r3
	add r5, r6, r5
	movs r0, r0, lsr #0x1f
	beq _038000F0
	mov r0, r5
	bl sub_03800B00
_038000F0:
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
_03800134:
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0x10
	blt _03800134
	ldr r1, _03800288 ; =_03807E6C
	ldr r3, [r1]
	cmp r3, #0
	beq _03800194
	ldrb r2, [r5, #1]
	mov r0, #0x24
	mla r0, r2, r0, r3
	mov r6, #0
	str r6, [r0, #0x40]
	mvn r4, #0
	mov r0, #0x24
_03800174:
	ldr r2, [r1]
	ldrb r3, [r5, #1]
	mla r2, r3, r0, r2
	add r2, r2, r6, lsl #1
	add r6, r6, #1
	strh r4, [r2, #0x20]
	cmp r6, #0x10
	blt _03800174
_03800194:
	bl sub_03801884
	movs r4, r0
	bmi _0380027C
	ldr r0, _0380028C ; =_038085F0
	add r6, r0, r4, lsl #6
	mov r0, r6
	bl sub_038008F0
	str r8, [r6, #0x24]
	add r0, r8, r7
	str r0, [r6, #0x28]
	strb r4, [r5, #8]
	ldr r0, [r6, #0x28]
	bl sub_03800784
	mov r0, r6
	bl sub_03800290
	cmp r0, #0xfe
	ldrne r0, [r6, #0x28]
	subne r0, r0, #1
	strne r0, [r6, #0x28]
	bne _03800248
	mov r0, r6
	bl sub_03800290
	mov r4, r0
	mov r0, r6
	bl sub_03800290
	orr r0, r4, r0, lsl #8
	mov r0, r0, lsl #0x10
	ldr r4, _0380028C ; =_038085F0
	mov r8, r0, lsr #0x11
	mov r7, #1
	b _03800240
_03800210:
	tst r8, #1
	beq _03800234
	bl sub_03801884
	movs r6, r0
	bmi _03800248
	add r0, r4, r6, lsl #6
	bl sub_038008F0
	add r0, r5, r7
	strb r6, [r0, #8]
_03800234:
	mov r0, r8, lsl #0xf
	add r7, r7, #1
	mov r8, r0, lsr #0x10
_03800240:
	cmp r8, #0
	bne _03800210
_03800248:
	ldrb r1, [r5]
	ldr r0, _03800288 ; =_03807E6C
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
_0380027C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03800284: .word _038083B0
_03800288: .word _03807E6C
_0380028C: .word _038085F0
	arm_func_end sub_038000B4

	arm_func_start sub_03800290
sub_03800290: ; 0x03800290
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _038002E8 ; =_03807E50
	mov r5, r0
	ldr r4, [r5, #0x28]
	ldr r0, [r1, #4]
	cmp r4, r0
	blo _038002B8
	ldr r0, [r1, #8]
	cmp r4, r0
	blo _038002C0
_038002B8:
	mov r0, r4
	bl sub_03800784
_038002C0:
	ldr r0, _038002E8 ; =_03807E50
	ldr r1, [r5, #0x28]
	ldr r2, [r0, #4]
	ldr r0, _038002EC ; =_03807E5C
	sub r2, r4, r2
	ldrb r0, [r0, r2]
	add r1, r1, #1
	str r1, [r5, #0x28]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038002E8: .word _03807E50
_038002EC: .word _03807E5C
	arm_func_end sub_03800290

	arm_func_start sub_038002F0
sub_038002F0: ; 0x038002F0
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _0380030C ; =_038083B0
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_0380030C: .word _038083B0
	arm_func_end sub_038002F0

	arm_func_start sub_03800310
sub_03800310: ; 0x03800310
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_038000B4
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _0380033C ; =_038083B0
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0380033C: .word _038083B0
	arm_func_end sub_03800310

	arm_func_start sub_03800340
sub_03800340: ; 0x03800340
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _03800394 ; =_038083B0
	ldrb r0, [r2, r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _0380038C
	add r0, r2, r1
	bl sub_03800B00
	ldr r0, _03800398 ; =_03807E6C
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_0380038C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03800394: .word _038083B0
_03800398: .word _03807E6C
	arm_func_end sub_03800340

	arm_func_start sub_0380039C
sub_0380039C: ; 0x0380039C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _03800410 ; =_038083B0
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	mov r0, r0, lsl #0x1f
	bic r2, r2, #4
	orr r0, r2, r0, lsr #29
	strb r0, [r5, r4]
	cmp r1, #0
	beq _03800408
	mov r8, #0
	mov r6, #0x7f
_038003D4:
	mov r1, r8
	add r0, r5, r4
	bl sub_03800A7C
	movs r7, r0
	beq _038003FC
	mov r2, r6
	add r1, r5, r4
	bl sub_038009E0
	mov r0, r7
	bl sub_03800A48
_038003FC:
	add r8, r8, #1
	cmp r8, #0x10
	blt _038003D4
_03800408:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03800410: .word _038083B0
	arm_func_end sub_0380039C

	arm_func_start sub_03800414
sub_03800414: ; 0x03800414
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _038004D8 ; =_038083B0
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_03800430:
	mov r0, r6
	mov r1, r7
	bl sub_03800A7C
	movs r5, r0
	beq _03800458
	mov r1, r6
	mov r2, r4
	bl sub_038009E0
	mov r0, r5
	bl sub_03800A48
_03800458:
	add r7, r7, #1
	cmp r7, #0x10
	blt _03800430
	bl sub_037FEFB4
	mov r4, #0
	mov r5, r4
	b _03800498
_03800474:
	mov r0, r6
	mov r1, r5
	bl sub_03800CF0
	cmp r0, #0
	beq _03800494
	mov r0, r6
	bl sub_03800B00
	b _038004A0
_03800494:
	add r4, r4, #1
_03800498:
	cmp r4, r8
	blo _03800474
_038004A0:
	bl sub_037FEF64
	ldr r0, _038004DC ; =_03807E6C
	ldr r3, [r0]
	cmp r3, #0
	beq _038004D0
	ldrb r1, [r6, #1]
	mov r0, #0x24
	mul r2, r1, r0
	add r1, r3, #0x40
	ldr r0, [r1, r2]
	add r0, r0, r4
	str r0, [r1, r2]
_038004D0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038004D8: .word _038083B0
_038004DC: .word _03807E6C
	arm_func_end sub_03800414

	arm_func_start sub_038004E0
sub_038004E0: ; 0x038004E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _03800548 ; =_038083B0
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _03800530
_03800500:
	tst r8, #1
	beq _03800528
	mov r1, r6
	add r0, r5, r4
	bl sub_03800A7C
	cmp r0, #0
	beq _03800528
	mov r2, r7
	add r1, r5, r4
	bl sub_038018C8
_03800528:
	add r6, r6, #1
	mov r8, r8, lsr #1
_03800530:
	cmp r6, #0x10
	bge _03800540
	cmp r8, #0
	bne _03800500
_03800540:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03800548: .word _038083B0
	arm_func_end sub_038004E0

	arm_func_start sub_0380054C
sub_0380054C: ; 0x0380054C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	mov r0, r2, lsl #0x10
	ldr r5, _038005B8 ; =_038083B0
	mov r7, r1
	mov r6, #0
	mov r8, r0, lsr #0x10
	b _038005A0
_03800570:
	tst r7, #1
	beq _03800598
	mov r1, r6
	add r0, r5, r4
	bl sub_03800A7C
	cmp r0, #0
	strneh r8, [r0, #0x1e]
	ldrneb r1, [r0]
	orrne r1, r1, #0x80
	strneb r1, [r0]
_03800598:
	add r6, r6, #1
	mov r7, r7, lsr #1
_038005A0:
	cmp r6, #0x10
	bge _038005B0
	cmp r7, #0
	bne _03800570
_038005B0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038005B8: .word _038083B0
	arm_func_end sub_0380054C

	arm_func_start sub_038005BC
sub_038005BC: ; 0x038005BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _03800644 ; =_038083B0
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_038005D8:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _03800630
	mov r8, fp
	b _03800628
_038005F4:
	mov r1, r8
	add r0, r6, r5
	bl sub_03800A7C
	cmp r0, #0
	beq _03800624
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _03800624
	add r0, r6, r5
	bl sub_03800B00
	b _03800630
_03800624:
	add r8, r8, #1
_03800628:
	cmp r8, #0x10
	blt _038005F4
_03800630:
	add r7, r7, #1
	cmp r7, #0x10
	blt _038005D8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03800644: .word _038083B0
	arm_func_end sub_038005BC

	arm_func_start sub_03800648
sub_03800648: ; 0x03800648
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _038006A0 ; =_038083B0
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_03800660:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _0380068C
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _0380068C
	bl sub_03800B00
_0380068C:
	add r5, r5, #1
	cmp r5, #0x10
	blt _03800660
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038006A0: .word _038083B0
	arm_func_end sub_03800648

	arm_func_start sub_038006A4
sub_038006A4: ; 0x038006A4
	stmdb sp!, {r3, lr}
	ldr lr, _038006E4 ; =_038083B0
	mov ip, #0x24
	mla ip, r0, ip, lr
	cmp r3, #1
	beq _038006D0
	cmp r3, #2
	beq _038006D8
	cmp r3, #4
	streq r2, [ip, r1]
	b _038006DC
_038006D0:
	strb r2, [ip, r1]
	b _038006DC
_038006D8:
	strh r2, [ip, r1]
_038006DC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038006E4: .word _038083B0
	arm_func_end sub_038006A4

	arm_func_start sub_038006E8
sub_038006E8: ; 0x038006E8
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
	b _03800768
_03800718:
	tst sl, #1
	beq _03800760
	ldr r0, _03800780 ; =_038083B0
	mov r1, r6
	add r0, r0, r5
	bl sub_03800A7C
	cmp r0, #0
	beq _03800760
	cmp r7, #1
	beq _03800754
	cmp r7, #2
	beq _0380075C
	cmp r7, #4
	streq r8, [r0, sb]
	b _03800760
_03800754:
	strb r4, [r0, sb]
	b _03800760
_0380075C:
	strh fp, [r0, sb]
_03800760:
	add r6, r6, #1
	mov sl, sl, lsr #1
_03800768:
	cmp r6, #0x10
	bge _03800778
	cmp sl, #0
	bne _03800718
_03800778:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03800780: .word _038083B0
	arm_func_end sub_038006E8

	arm_func_start sub_03800784
sub_03800784: ; 0x03800784
	ldr r1, _038007BC ; =_03807E50
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
_038007BC: .word _03807E50
	arm_func_end sub_03800784

	arm_func_start sub_038007C0
sub_038007C0: ; 0x038007C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_03800290
	mov r4, r0
	mov r0, r5
	bl sub_03800290
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl sub_03800290
	orr r0, r4, r0, lsl #16
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_038007C0

	arm_func_start sub_038007F0
sub_038007F0: ; 0x038007F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _038008E4
_03800808: ; jump table
	b _0380081C ; case 0
	b _03800828 ; case 1
	b _03800848 ; case 2
	b _03800884 ; case 3
	b _03800868 ; case 4
_0380081C:
	bl sub_03800290
	mov r5, r0
	b _038008E4
_03800828:
	bl sub_03800290
	mov r5, r0
	mov r0, r4
	bl sub_03800290
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	b _038008E4
_03800848:
	mov r5, #0
_0380084C:
	mov r0, r4
	bl sub_03800290
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _0380084C
	b _038008E4
_03800868:
	bl sub_03800290
	mov r1, r0
	mov r0, r6
	bl sub_03801840
	cmp r0, #0
	ldrnesh r5, [r0]
	b _038008E4
_03800884:
	bl sub_03800290
	mov r5, r0
	mov r0, r4
	bl sub_03800290
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r4
	mov r5, r1, lsl #0x10
	bl sub_03800290
	mov r6, r0
	mov r0, r4
	bl sub_03800290
	orr r0, r6, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl sub_037FEEC4
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	add r5, r0, r5, asr #16
_038008E4:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_038007F0

	arm_func_start sub_038008F0
sub_038008F0: ; 0x038008F0
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
	bl sub_037FFD90
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038008F0

	arm_func_start sub_038009D0
sub_038009D0: ; 0x038009D0
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end sub_038009D0

	arm_func_start sub_038009E0
sub_038009E0: ; 0x038009E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl sub_03800B98
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _03800A38
_03800A04:
	mov r0, r5
	bl sub_037FF940
	cmp r0, #0
	beq _03800A34
	cmp r7, #0
	blt _03800A28
	mov r0, r5
	mov r1, r6
	bl sub_037FF918
_03800A28:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl sub_037FF934
_03800A34:
	ldr r5, [r5, #0x50]
_03800A38:
	cmp r5, #0
	bne _03800A04
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_038009E0

	arm_func_start sub_03800A48
sub_03800A48: ; 0x03800A48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _03800A64
_03800A58:
	mov r0, r4
	bl sub_037FFB1C
	ldr r4, [r4, #0x50]
_03800A64:
	cmp r4, #0
	bne _03800A58
	mov r0, #0
	str r0, [r5, #0x3c]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_03800A48

	arm_func_start sub_03800A7C
sub_03800A7C: ; 0x03800A7C
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _03800AA4 ; =_038085F0
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_03800AA4: .word _038085F0
	arm_func_end sub_03800A7C

	arm_func_start sub_03800AA8
sub_03800AA8: ; 0x03800AA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl sub_03800A7C
	movs r5, r0
	beq _03800AF4
	mov r1, r6
	mvn r2, #0
	bl sub_038009E0
	mov r0, r5
	bl sub_03800A48
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _03800AFC ; =_038085F0
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_03800AF4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03800AFC: .word _038085F0
	arm_func_end sub_03800AA8

	arm_func_start sub_03800B00
sub_03800B00: ; 0x03800B00
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_03800B0C:
	mov r0, r5
	mov r1, r4
	bl sub_03800AA8
	add r4, r4, #1
	cmp r4, #0x10
	blt _03800B0C
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_03800B00

	arm_func_start sub_03800B38
sub_03800B38: ; 0x03800B38
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _03800B58
	mov r1, #0
	strb r1, [r5, #0x22]
	bl sub_037FFB1C
_03800B58:
	ldr r1, [r4, #0x3c]
	cmp r1, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r4, #0x3c]
	beq _03800B90
	b _03800B84
_03800B70:
	cmp r0, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r1, #0x50]
	beq _03800B90
	mov r1, r0
_03800B84:
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _03800B70
_03800B90:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_03800B38

	arm_func_start sub_03800B98
sub_03800B98: ; 0x03800B98
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
	ldr r0, _03800CEC ; =_03806FDC
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
	blt _03800C50
	cmp r3, #0x7f
	movgt r3, #0x7f
_03800C50:
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
	b _03800CDC
_03800C7C:
	strh r7, [r8, #6]
	ldrb r0, [r8, #2]
	cmp r0, #3
	beq _03800CD8
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
	bne _03800CD8
	cmp sb, #0
	beq _03800CD8
	mov r0, r8
	strb fp, [r8, #0x22]
	bl sub_037FF934
_03800CD8:
	ldr r8, [r8, #0x50]
_03800CDC:
	cmp r8, #0
	bne _03800C7C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03800CEC: .word _03806FDC
	arm_func_end sub_03800B98

	arm_func_start sub_03800CF0
sub_03800CF0: ; 0x03800CF0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_03800D0C:
	mov r0, r7
	mov r1, sl
	bl sub_03800A7C
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	beq _0380180C
	ldr r0, [r8, #0x3c]
	b _03800D68
_03800D30:
	ldr r1, [r0, #0x34]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x34]
	ldrb r1, [r0, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	bne _03800D64
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #0x14]
_03800D64:
	ldr r0, [r0, #0x50]
_03800D68:
	cmp r0, #0
	bne _03800D30
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _03800D98
	ldr r0, [r8, #0x3c]
	cmp r0, #0
	movne r0, #0
	bne _038017F0
	bic r0, r1, #0x10
	strb r0, [r8]
_03800D98:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x20]
	cmpgt r0, #0
	movgt r0, #0
	bgt _038017F0
	ldr r0, [r8, #0x28]
	bl sub_03800784
	ldr r0, _03801834 ; =0x0000FFFF
	sub fp, r0, #0x10000
	b _038017D0
_03800DC8:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl sub_03800290
	mov r6, r0
	cmp r6, #0xa2
	bne _03800DFC
	mov r0, r8
	bl sub_03800290
	mov r6, r0
	ldrb r0, [r8]
	mov r0, r0, lsl #0x19
	mov r4, r0, lsr #0x1f
_03800DFC:
	cmp r6, #0xa0
	bne _03800E18
	mov r0, r8
	bl sub_03800290
	mov r6, r0
	mov r5, #3
	mov sb, #1
_03800E18:
	cmp r6, #0xa1
	bne _03800E34
	mov r0, r8
	bl sub_03800290
	mov r6, r0
	mov r5, #4
	mov sb, #1
_03800E34:
	tst r6, #0x80
	bne _038010B8
	mov r0, r8
	bl sub_03800290
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl sub_038007F0
	cmp r4, #0
	mov r4, r0
	ldrsb r0, [r8, #0x13]
	add sb, r6, r0
	beq _038017D0
	cmp sb, #0
	movlt sb, #0
	blt _03800E88
	cmp sb, #0x7f
	movgt sb, #0x7f
_03800E88:
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _0380108C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0380108C
	mov r0, r1, lsl #0x1c
	mov r6, #0
	movs r0, r0, lsr #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strneb sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strneb r0, [r6, #9]
	cmp r6, #0
	bne _03800FBC
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl sub_03801948
	cmp r0, #0
	beq _0380108C
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0380108C
_03800EF8: ; jump table
	b _0380108C ; case 0
	b _03800F0C ; case 1
	b _03800F14 ; case 2
	b _03800F1C ; case 3
	b _03800F0C ; case 4
_03800F0C:
	ldr r1, _03801834 ; =0x0000FFFF
	b _03800F20
_03800F14:
	mov r1, #0x3f00
	b _03800F20
_03800F1C:
	mov r1, #0xc000
_03800F20:
	ldrh r0, [r8, #0x1e]
	ldr r3, _03801838 ; =sub_03800B38
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	mov r2, r2, lsl #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	mov r2, r2, lsr #0x1f
	add r1, r6, r1
	bl sub_037FF950
	movs r6, r0
	beq _0380108C
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	movne r3, fp
	bne _03800F74
	cmp r4, #0
	movgt r3, r4
	movle r3, fp
_03800F74:
	ldr r2, [sp, #0xc]
	ldr r1, [r7, #0x20]
	mov r0, r6
	str r1, [sp]
	add r1, sp, #0x16
	str r1, [sp, #4]
	mov r1, sb
	bl sub_03801B08
	cmp r0, #0
	bne _03800FB0
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl sub_037FFB1C
	b _0380108C
_03800FB0:
	ldr r0, [r8, #0x3c]
	str r0, [r6, #0x50]
	str r6, [r8, #0x3c]
_03800FBC:
	ldrb r1, [r8, #0xe]
	cmp r1, #0xff
	beq _03800FD0
	mov r0, r6
	bl sub_037FF8D4
_03800FD0:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _03800FE4
	mov r0, r6
	bl sub_037FF8F4
_03800FE4:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _03800FF8
	mov r0, r6
	bl sub_037FF910
_03800FF8:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _0380100C
	mov r0, r6
	bl sub_037FF918
_0380100C:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _0380103C
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	mov r0, r0, lsl #0x16
	add r0, r1, r0, asr #16
	strh r0, [r6, #0x32]
_0380103C:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	bne _03801068
	cmp r4, #0
	movgt r0, r4
	movle r0, fp
	str r0, [r6, #0x18]
	ldrb r0, [r6, #3]
	bic r0, r0, #4
	strb r0, [r6, #3]
	b _03801084
_03801068:
	mul r1, r0, r0
	ldrsh r0, [r6, #0x32]
	cmp r0, #0
	rsblt r0, r0, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xb
	str r0, [r6, #0x18]
_03801084:
	mov r0, #0
	str r0, [r6, #0x14]
_0380108C:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _038017D0
	str r4, [r8, #0x20]
	cmp r4, #0
	ldreqb r0, [r8]
	orreq r0, r0, #0x10
	streqb r0, [r8]
	b _038017D0
_038010B8:
	and r0, r6, #0xf0
	cmp r0, #0xc0
	bgt _038010EC
	bge _03801234
	cmp r0, #0x90
	bgt _038010E0
	bge _03801158
	cmp r0, #0x80
	beq _03801110
	b _038017D0
_038010E0:
	cmp r0, #0xb0
	beq _038014E4
	b _038017D0
_038010EC:
	cmp r0, #0xe0
	bgt _03801104
	bge _03801490
	cmp r0, #0xd0
	beq _03801234
	b _038017D0
_03801104:
	cmp r0, #0xf0
	beq _0380172C
	b _038017D0
_03801110:
	cmp sb, #0
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl sub_038007F0
	cmp r4, #0
	beq _038017D0
	cmp r6, #0x80
	beq _03801144
	cmp r6, #0x81
	beq _0380114C
	b _038017D0
_03801144:
	str r0, [r8, #0x20]
	b _038017D0
_0380114C:
	cmp r0, #0x10000
	strlth r0, [r8, #2]
	b _038017D0
_03801158:
	cmp r6, #0x93
	beq _03801174
	cmp r6, #0x94
	beq _038011D4
	cmp r6, #0x95
	beq _038011F0
	b _038017D0
_03801174:
	mov r0, r8
	bl sub_03800290
	mov r6, r0
	mov r0, r8
	bl sub_038007C0
	cmp r4, #0
	mov sb, r0
	beq _038017D0
	mov r1, r6
	mov r0, r7
	bl sub_03800A7C
	movs r4, r0
	cmpne r4, r8
	beq _038017D0
	mov r1, r7
	mov r2, fp
	bl sub_038009E0
	mov r0, r4
	bl sub_03800A48
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl sub_038009D0
	b _038017D0
_038011D4:
	mov r0, r8
	bl sub_038007C0
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _038017D0
_038011F0:
	mov r0, r8
	bl sub_038007C0
	cmp r4, #0
	beq _038017D0
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _038017D0
	add r1, r8, r1, lsl #2
	ldr r2, [r8, #0x28]
	str r2, [r1, #0x2c]
	ldrb r1, [r8, #0x3b]
	add r1, r1, #1
	strb r1, [r8, #0x3b]
	ldr r1, [r8, #0x24]
	add r0, r1, r0
	str r0, [r8, #0x28]
	b _038017D0
_03801234:
	cmp sb, #0
	movne r2, r5
	moveq r2, #0
	mov r0, r8
	mov r1, r7
	bl sub_038007F0
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _038017D0
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _038017D0
_03801268: ; jump table
	b _03801460 ; case 0
	b _038012C8 ; case 1
	b _038012E0 ; case 2
	b _03801448 ; case 3
	b _03801454 ; case 4
	b _038012EC ; case 5
	b _038012F8 ; case 6
	b _03801304 ; case 7
	b _038013C4 ; case 8
	b _0380140C ; case 9
	b _0380132C ; case 10
	b _03801338 ; case 11
	b _03801344 ; case 12
	b _03801350 ; case 13
	b _0380142C ; case 14
	b _03801320 ; case 15
	b _0380135C ; case 16
	b _03801368 ; case 17
	b _03801374 ; case 18
	b _03801380 ; case 19
	b _0380138C ; case 20
	b _038012D4 ; case 21
	b _03801470 ; case 22
	b _038013F8 ; case 23
_038012C8:
	and r0, r0, #0xff
	strb r0, [r8, #4]
	b _038017D0
_038012D4:
	and r0, r0, #0xff
	strb r0, [r8, #5]
	b _038017D0
_038012E0:
	and r0, r0, #0xff
	strb r0, [r7, #5]
	b _038017D0
_038012EC:
	and r0, r0, #0xff
	strb r0, [r8, #7]
	b _038017D0
_038012F8:
	and r0, r0, #0xff
	strb r0, [r8, #0x12]
	b _038017D0
_03801304:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #2
	orr r0, r1, r0, lsr #30
	strb r0, [r8]
	b _038017D0
_03801320:
	and r0, r0, #0xff
	strb r0, [r8, #0x15]
	b _038017D0
_0380132C:
	and r0, r0, #0xff
	strb r0, [r8, #0x1a]
	b _038017D0
_03801338:
	and r0, r0, #0xff
	strb r0, [r8, #0x19]
	b _038017D0
_03801344:
	and r0, r0, #0xff
	strb r0, [r8, #0x18]
	b _038017D0
_03801350:
	and r0, r0, #0xff
	strb r0, [r8, #0x1b]
	b _038017D0
_0380135C:
	and r0, r0, #0xff
	strb r0, [r8, #0xe]
	b _038017D0
_03801368:
	and r0, r0, #0xff
	strb r0, [r8, #0xf]
	b _038017D0
_03801374:
	and r0, r0, #0xff
	strb r0, [r8, #0x10]
	b _038017D0
_03801380:
	and r0, r0, #0xff
	strb r0, [r8, #0x11]
	b _038017D0
_0380138C:
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _038017D0
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
	b _038017D0
_038013C4:
	and r0, r0, #0xff
	mov r1, r0, lsl #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl sub_038009E0
	mov r0, r8
	bl sub_03800A48
	b _038017D0
_038013F8:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl sub_038018C8
	b _038017D0
_0380140C:
	and r1, r0, #0xff
	ldrsb r0, [r8, #0x13]
	add r0, r1, r0
	strb r0, [r8, #0x14]
	ldrb r0, [r8]
	orr r0, r0, #0x20
	strb r0, [r8]
	b _038017D0
_0380142C:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #0x20
	orr r0, r1, r0, lsr #26
	strb r0, [r8]
	b _038017D0
_03801448:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #0x13]
	b _038017D0
_03801454:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #6]
	b _038017D0
_03801460:
	and r0, r0, #0xff
	sub r0, r0, #0x40
	strb r0, [r8, #8]
	b _038017D0
_03801470:
	ldr r1, _0380183C ; =_03807E50
	ldr r1, [r1]
	cmp r1, #0
	beq _038017D0
	and r1, r0, #0xff
	mov r0, r7
	bl sub_03801840
	b _038017D0
_03801490:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl sub_038007F0
	mov r0, r0, lsl #0x10
	cmp r4, #0
	mov r0, r0, asr #0x10
	beq _038017D0
	cmp r6, #0xe0
	beq _038014DC
	cmp r6, #0xe1
	beq _038014D4
	cmp r6, #0xe3
	streqh r0, [r8, #0x16]
	b _038017D0
_038014D4:
	strh r0, [r7, #0x18]
	b _038017D0
_038014DC:
	strh r0, [r8, #0x1c]
	b _038017D0
_038014E4:
	mov r0, r8
	bl sub_03800290
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl sub_038007F0
	mov r0, r0, lsl #0x10
	mov r1, sb
	mov sb, r0, asr #0x10
	mov r0, r7
	bl sub_03801840
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _038017D0
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _038017D0
_0380153C: ; jump table
	b _03801574 ; case 0
	b _0380157C ; case 1
	b _0380158C ; case 2
	b _0380159C ; case 3
	b _038015AC ; case 4
	b _038015C8 ; case 5
	b _038015EC ; case 6
	b _038017D0 ; case 7
	b _03801624 ; case 8
	b _03801650 ; case 9
	b _0380167C ; case 10
	b _038016A8 ; case 11
	b _038016D4 ; case 12
	b _03801700 ; case 13
_03801574:
	strh sb, [r4]
	b _038017D0
_0380157C:
	ldrsh r0, [r4]
	add r0, r0, sb
	strh r0, [r4]
	b _038017D0
_0380158C:
	ldrsh r0, [r4]
	sub r0, r0, sb
	strh r0, [r4]
	b _038017D0
_0380159C:
	ldrsh r0, [r4]
	mul r1, r0, sb
	strh r1, [r4]
	b _038017D0
_038015AC:
	cmp sb, #0
	beq _038017D0
	mov r1, sb
	ldrsh r0, [r4]
	bl sub_03806BC8
	strh r0, [r4]
	b _038017D0
_038015C8:
	cmp sb, #0
	ldrgesh r0, [r4]
	movge r0, r0, lsl sb
	strgeh r0, [r4]
	ldrltsh r1, [r4]
	rsblt r0, sb, #0
	movlt r0, r1, asr r0
	strlth r0, [r4]
	b _038017D0
_038015EC:
	cmp sb, #0
	rsblt r0, sb, #0
	movlt r0, r0, lsl #0x10
	mov r6, #0
	movlt sb, r0, asr #0x10
	movlt r6, #1
	bl sub_037FEEC4
	add r1, sb, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	cmp r6, #0
	rsbne r0, r0, #0
	strh r0, [r4]
	b _038017D0
_03801624:
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
	b _038017D0
_03801650:
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
	b _038017D0
_0380167C:
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
	b _038017D0
_038016A8:
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
	b _038017D0
_038016D4:
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
	b _038017D0
_03801700:
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
	b _038017D0
_0380172C:
	cmp r4, #0
	beq _038017D0
	sub r0, r6, #0xfc
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _038017D0
_03801744: ; jump table
	b _0380177C ; case 0
	b _03801754 ; case 1
	b _038017D0 ; case 2
	b _038017C8 ; case 3
_03801754:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _038017D0
	sub r0, r0, #1
	strb r0, [r8, #0x3b]
	and r0, r0, #0xff
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x2c]
	str r0, [r8, #0x28]
	b _038017D0
_0380177C:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _038017D0
	add r1, r8, r0
	ldrb r0, [r1, #0x37]
	cmp r0, #0
	beq _038017B0
	sub r0, r0, #1
	ands r0, r0, #0xff
	ldreqb r0, [r8, #0x3b]
	subeq r0, r0, #1
	streqb r0, [r8, #0x3b]
	beq _038017D0
_038017B0:
	strb r0, [r1, #0x37]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x28]
	str r0, [r8, #0x28]
	b _038017D0
_038017C8:
	mvn r0, #0
	b _038017F0
_038017D0:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	bne _038017EC
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _03800DC8
_038017EC:
	mov r0, #0
_038017F0:
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _0380180C
	mov r0, r7
	mov r1, sl
	bl sub_03800AA8
_0380180C:
	add sl, sl, #1
	cmp sl, #0x10
	blt _03800D0C
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03801834: .word 0x0000FFFF
_03801838: .word sub_03800B38
_0380183C: .word _03807E50
	arm_func_end sub_03800CF0

	arm_func_start sub_03801840
sub_03801840: ; 0x03801840
	ldr r2, _03801880 ; =_03807E6C
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
_03801880: .word _03807E6C
	arm_func_end sub_03801840

	arm_func_start sub_03801884
sub_03801884: ; 0x03801884
	ldr ip, _038018C4 ; =_038085F0
	mov r0, #0
	b _038018B4
_03801890:
	ldrb r1, [ip, r0, lsl #6]
	mov r3, r0, lsl #6
	mov r2, r1, lsl #0x1f
	movs r2, r2, lsr #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	streqb r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_038018B4:
	cmp r0, #0x20
	blt _03801890
	mvn r0, #0
	bx lr
	.align 2, 0
_038018C4: .word _038085F0
	arm_func_end sub_03801884

	arm_func_start sub_038018C8
sub_038018C8: ; 0x038018C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _03801940
_038018DC: ; jump table
	b _038018EC ; case 0
	b _038018FC ; case 1
	b _0380190C ; case 2
	b _03801924 ; case 3
_038018EC:
	ldrb r0, [r4]
	bic r0, r0, #4
	strb r0, [r4]
	b _03801940
_038018FC:
	ldrb r0, [r4]
	orr r0, r0, #4
	strb r0, [r4]
	b _03801940
_0380190C:
	ldrb r3, [r4]
	mvn r2, #0
	orr r3, r3, #4
	strb r3, [r4]
	bl sub_038009E0
	b _03801940
_03801924:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl sub_038009E0
	mov r0, r4
	bl sub_03800A48
_03801940:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038018C8

	arm_func_start sub_03801948
sub_03801948: ; 0x03801948
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _03801AC0
	bl sub_037FEFE4
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _03801980
	bl sub_037FEFE8
	mov r0, #0
	b _03801AC0
_03801980:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	mov r1, r1, lsr #8
	addls pc, pc, r0, lsl #2
	b _03801AAC
_038019A0: ; jump table
	b _03801AAC ; case 0
	b _038019E8 ; case 1
	b _038019E8 ; case 2
	b _038019E8 ; case 3
	b _038019E8 ; case 4
	b _038019E8 ; case 5
	b _03801AAC ; case 6
	b _03801AAC ; case 7
	b _03801AAC ; case 8
	b _03801AAC ; case 9
	b _03801AAC ; case 10
	b _03801AAC ; case 11
	b _03801AAC ; case 12
	b _03801AAC ; case 13
	b _03801AAC ; case 14
	b _03801AAC ; case 15
	b _03801A08 ; case 16
	b _03801A58 ; case 17
_038019E8:
	add r3, r6, r1
	add r2, r4, #2
	mov r1, #5
_038019F4:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _038019F4
	b _03801AB8
_03801A08:
	ldrb r0, [r6, r1]
	add r2, r6, r1
	ldrb r1, [r2, #1]
	cmp r5, r0
	blt _03801A24
	cmp r5, r1
	ble _03801A30
_03801A24:
	bl sub_037FEFE8
	mov r0, #0
	b _03801AC0
_03801A30:
	sub r1, r5, r0
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #2
	mov r1, #6
_03801A44:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _03801A44
	b _03801AB8
_03801A58:
	add r2, r6, r1
	mov r1, #0
	b _03801A7C
_03801A64:
	add r1, r1, #1
	cmp r1, #8
	blt _03801A7C
	bl sub_037FEFE8
	mov r0, #0
	b _03801AC0
_03801A7C:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bgt _03801A64
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #8
	mov r1, #6
_03801A98:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _03801A98
	b _03801AB8
_03801AAC:
	bl sub_037FEFE8
	mov r0, #0
	b _03801AC0
_03801AB8:
	bl sub_037FEFE8
	mov r0, #1
_03801AC0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_03801948

	arm_func_start sub_03801AC8
sub_03801AC8: ; 0x03801AC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_037FEFE4
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _03801AF4
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _03801AF8
_03801AF4:
	mov r4, #0
_03801AF8:
	bl sub_037FEFE8
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_03801AC8

	arm_func_start sub_03801B08
sub_03801B08: ; 0x03801B08
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
	b _03801BE8
_03801B40: ; jump table
	b _03801BE8 ; case 0
	b _03801B54 ; case 1
	b _03801BC4 ; case 2
	b _03801BD8 ; case 3
	b _03801B54 ; case 4
_03801B54:
	cmp r0, #1
	bne _03801B98
	ldr r2, [sp, #0x20]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #2]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #0x18]
	cmp r0, #0
	moveq r1, #0
	beq _03801BA4
	ldr r2, [r0, #0x38]
	cmp r1, r2
	movhs r1, #0
	bhs _03801BA4
	bl sub_03801AC8
	mov r1, r0
	b _03801BA4
_03801B98:
	ldrh r1, [r5, #4]
	ldrh r0, [r5, #2]
	orr r1, r0, r1, lsl #16
_03801BA4:
	cmp r1, #0
	moveq r0, #0
	beq _03801BEC
	mov r0, sb
	mov r3, r6
	add r2, r1, #0xc
	bl sub_037FF760
	b _03801BEC
_03801BC4:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl sub_037FF79C
	b _03801BEC
_03801BD8:
	mov r0, sb
	mov r1, r6
	bl sub_037FF7E8
	b _03801BEC
_03801BE8:
	mov r0, #0
_03801BEC:
	cmp r0, #0
	moveq r0, #0
	beq _03801C48
	strb r8, [sb, #8]
	ldrb r1, [r5, #6]
	mov r0, sb
	strb r1, [sb, #5]
	strb r7, [sb, #9]
	ldrb r1, [r5, #7]
	bl sub_037FF8D4
	ldrb r1, [r5, #8]
	mov r0, sb
	bl sub_037FF8F4
	ldrb r1, [r5, #9]
	mov r0, sb
	bl sub_037FF910
	mov r0, sb
	mov r1, r4
	bl sub_037FF918
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_03801C48:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end sub_03801B08

	arm_func_start sub_03801C50
sub_03801C50: ; 0x03801C50
	ldr ip, _03801C6C ; =_03807E6C
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_03801C6C: .word _03807E6C
	arm_func_end sub_03801C50

	arm_func_start sub_03801C70
sub_03801C70: ; 0x03801C70
	ldr r2, _03801C88 ; =_03807E6C
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_03801C88: .word _03807E6C
	arm_func_end sub_03801C70

	arm_func_start sub_03801C8C
sub_03801C8C: ; 0x03801C8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _03801D20 ; =_03807E6C
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _03801D18
	mov r7, r4
	mov r6, #1
_03801CB0:
	mov r0, r7
	bl sub_037FEB50
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	movne r0, r0, lsl #0x10
	add r7, r7, #1
	movne r4, r0, lsr #0x10
	cmp r7, #0x10
	blt _03801CB0
	mov r0, #0
	bl sub_037FF14C
	cmp r0, #0
	orrne r0, r5, #1
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	mov r0, #1
	bl sub_037FF14C
	cmp r0, #0
	orrne r0, r5, #2
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	ldr r0, _03801D20 ; =_03807E6C
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_03801D18:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03801D20: .word _03807E6C
	arm_func_end sub_03801C8C

	arm_func_start sub_03801D24
sub_03801D24: ; 0x03801D24
	ldr r1, _03801D4C ; =_03807E70
	mov r3, #0
	mov r2, r3
_03801D30:
	add r0, r1, r3, lsl #6
	strb r2, [r0, #0xf80]
	add r3, r3, #1
	strb r2, [r0, #0xf81]
	cmp r3, #8
	blt _03801D30
	bx lr
	.align 2, 0
_03801D4C: .word _03807E70
	arm_func_end sub_03801D24

	arm_func_start sub_03801D50
sub_03801D50: ; 0x03801D50
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr lr, _03801DA8 ; =_03808DF0
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _03801D88
	add r0, r8, #0x14
	bl sub_037FD5C0
	mov r0, #0
	strb r0, [r8]
_03801D88:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03801DA8: .word _03808DF0
	arm_func_end sub_03801D50

	arm_func_start sub_03801DAC
sub_03801DAC: ; 0x03801DAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _03801E60 ; =_03808DF0
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _03801DDC
	add r0, r8, #0x14
	bl sub_037FD5C0
	mov r0, #0
	strb r0, [r8]
_03801DDC:
	ldrb r1, [r8, #1]
	ldr r7, [r8, #0xc]
	ldr r6, [r8, #0x10]
	add r0, r8, #0x14
	ldr r5, [r8, #4]
	ldr r4, [r8, #8]
	orr sb, sb, r1, lsl #8
	bl sub_037FD3A0
	cmp r6, #0
	cmpeq r7, #0
	bne _03801E24
	ldr r3, _03801E64 ; =sub_03801EA8
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl sub_037FD4DC
	b _03801E4C
_03801E24:
	bl sub_037FD21C
	ldr r2, _03801E64 ; =sub_03801EA8
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl sub_037FD54C
_03801E4C:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03801E60: .word _03808DF0
_03801E64: .word sub_03801EA8
	arm_func_end sub_03801DAC

	arm_func_start sub_03801E68
sub_03801E68: ; 0x03801E68
	stmdb sp!, {r4, lr}
	ldr r2, _03801EA4 ; =_03808DF0
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _03801E9C
	add r0, r4, #0x14
	bl sub_037FD5C0
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_03801E9C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03801EA4: .word _03808DF0
	arm_func_end sub_03801E68

	arm_func_start sub_03801EA8
sub_03801EA8: ; 0x03801EA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_03801EB8:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	blt _03801EB8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03801EA8

	arm_func_start sub_03801ED8
sub_03801ED8: ; 0x03801ED8
	stmdb sp!, {r3, lr}
	ldr r0, _03801F0C ; =_03808FF0
	ldr r1, _03801F10 ; =_03809010
	mov r2, #8
	bl sub_037FC6AC
	ldr r1, _03801F14 ; =sub_038025CC
	mov r0, #7
	bl sub_037FE39C
	ldr r0, _03801F18 ; =_03807E6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03801F0C: .word _03808FF0
_03801F10: .word _03809010
_03801F14: .word sub_038025CC
_03801F18: .word _03807E6C
	arm_func_end sub_03801ED8

	arm_func_start sub_03801F1C
sub_03801F1C: ; 0x03801F1C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _03802594
_03801F28:
	ldr sl, _038025B8 ; =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _03802578
_03801F38:
	add r5, sp, #0x1c
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _03802574
_03801F5C: ; jump table
	b _03801FE4 ; case 0
	b _03801FFC ; case 1
	b _03802008 ; case 2
	b _03802020 ; case 3
	b _0380202C ; case 4
	b _0380203C ; case 5
	b _0380204C ; case 6
	b _03802064 ; case 7
	b _0380208C ; case 8
	b _038020A0 ; case 9
	b _038020B4 ; case 10
	b _038020D0 ; case 11
	b _038020E8 ; case 12
	b _038021B0 ; case 13
	b _0380238C ; case 14
	b _0380240C ; case 15
	b _03802444 ; case 16
	b _03802254 ; case 17
	b _0380229C ; case 18
	b _038022C4 ; case 19
	b _03802304 ; case 20
	b _0380234C ; case 21
	b _03802474 ; case 22
	b _03802480 ; case 23
	b _0380248C ; case 24
	b _03802498 ; case 25
	b _038024B0 ; case 26
	b _038024C0 ; case 27
	b _038024D0 ; case 28
	b _03802510 ; case 29
	b _038024E0 ; case 30
	b _038024F0 ; case 31
	b _03802500 ; case 32
	b _03802520 ; case 33
_03801FE4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_03800310
	b _03802574
_03801FFC:
	ldr r0, [sp, #0x24]
	bl sub_03800340
	b _03802574
_03802008:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_038000B4
	b _03802574
_03802020:
	ldr r0, [sp, #0x24]
	bl sub_038002F0
	b _03802574
_0380202C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_0380039C
	b _03802574
_0380203C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_03800414
	b _03802574
_0380204C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_038006A4
	b _03802574
_03802064:
	ldr r1, [sp, #0x24]
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_038006E8
	b _03802574
_0380208C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl sub_038004E0
	b _03802574
_038020A0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl sub_0380054C
	b _03802574
_038020B4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_03801C50
	b _03802574
_038020D0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_03801C70
	b _03802574
_038020E8:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl EnableIrqFlag
	mov r8, r0
	mov r2, #0
	b _03802124
_03802104:
	tst r5, #1
	movne r0, r2, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strneb r1, [r0, #0x403]
	mov r5, r5, lsr #1
_03802124:
	cmp r2, #0x10
	bge _03802134
	cmp r5, #0
	bne _03802104
_03802134:
	tst r6, #1
	beq _03802160
	tst r6, #2
	ldrneh r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strneh r0, [r4]
	ldreqb r0, [r4]
	orreq r0, r0, #0x80
	streqb r0, [r4]
	b _03802170
_03802160:
	tst r6, #2
	ldrneb r0, [sl]
	orrne r0, r0, #0x80
	strneb r0, [sl]
_03802170:
	mov r5, #0
	b _03802190
_03802178:
	tst r7, #1
	beq _03802188
	mov r0, r5
	bl sub_03801DAC
_03802188:
	add r5, r5, #1
	mov r7, r7, lsr #1
_03802190:
	cmp r5, #8
	bge _038021A0
	cmp r7, #0
	bne _03802178
_038021A0:
	mov r0, r8
	bl SetIrqFlag
	bl sub_03801C8C
	b _03802574
_038021B0:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl EnableIrqFlag
	mov fp, r0
	mov r8, #0
	b _038021E8
_038021D0:
	tst r7, #1
	beq _038021E0
	mov r0, r8
	bl sub_03801E68
_038021E0:
	add r8, r8, #1
	mov r7, r7, lsr #1
_038021E8:
	cmp r8, #8
	bge _038021F8
	cmp r7, #0
	bne _038021D0
_038021F8:
	mov r7, #0
	b _0380221C
_03802200:
	tst r5, #1
	beq _03802214
	mov r0, r7
	mov r1, sb
	bl sub_037FEA20
_03802214:
	add r7, r7, #1
	mov r5, r5, lsr #1
_0380221C:
	cmp r7, #0x10
	bge _0380222C
	cmp r5, #0
	bne _03802200
_0380222C:
	tst r6, #1
	movne r0, #0
	strneb r0, [r4]
	tst r6, #2
	movne r0, #0
	strneb r0, [sl]
	mov r0, fp
	bl SetIrqFlag
	bl sub_03801C8C
	b _03802574
_03802254:
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
	bl sub_037FF0FC
	b _03802574
_0380229C:
	ldr r0, [sp, #0x30]
	mov r2, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_03801D50
	b _03802574
_038022C4:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _038022F0
_038022D4:
	tst r5, #1
	beq _038022E8
	mov r0, r7
	mov r1, r6
	bl sub_037FEAC0
_038022E8:
	add r7, r7, #1
	mov r5, r5, lsr #1
_038022F0:
	cmp r7, #0x10
	bge _03802574
	cmp r5, #0
	bne _038022D4
	b _03802574
_03802304:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r8, #0
	b _03802338
_03802318:
	tst r5, #1
	beq _03802330
	mov r0, r8
	mov r1, r6
	mov r2, r7
	bl sub_037FEA48
_03802330:
	add r8, r8, #1
	mov r5, r5, lsr #1
_03802338:
	cmp r8, #0x10
	bge _03802574
	cmp r5, #0
	bne _03802318
	b _03802574
_0380234C:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _03802378
_0380235C:
	tst r5, #1
	beq _03802370
	mov r0, r7
	mov r1, r6
	bl sub_037FEAD8
_03802370:
	add r7, r7, #1
	mov r5, r5, lsr #1
_03802378:
	cmp r7, #0x10
	bge _03802574
	cmp r5, #0
	bne _0380235C
	b _03802574
_0380238C:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	mov r1, r3, lsl #0x10
	ldr r2, [sp, #0x2c]
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldr r1, _038025BC ; =0x003FFFFF
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
	bl sub_037FE804
	b _03802574
_0380240C:
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
	bl sub_037FE8D0
	b _03802574
_03802444:
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
	bl sub_037FE97C
	b _03802574
_03802474:
	ldr r0, [sp, #0x24]
	bl sub_037FEBE0
	b _03802574
_03802480:
	ldr r0, [sp, #0x24]
	bl sub_037FE7BC
	b _03802574
_0380248C:
	ldr r0, [sp, #0x24]
	bl sub_037FEB6C
	b _03802574
_03802498:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl sub_037FE7CC
	b _03802574
_038024B0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FFBE0
	b _03802574
_038024C0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FFCC0
	b _03802574
_038024D0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FFB30
	b _03802574
_038024E0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_038005BC
	b _03802574
_038024F0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_03800648
	b _03802574
_03802500:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_037FFD14
	b _03802574
_03802510:
	ldr r1, [sp, #0x24]
	ldr r0, _038025C0 ; =_03807E6C
	str r1, [r0]
	b _03802574
_03802520:
	ldr r5, [sp, #0x24]
	ldr r0, _038025C4 ; =_03807E70
	mov r1, r5
	mov r2, #0x1180
	bl sub_037FDFEC
	ldr r0, _038025C4 ; =_03807E70
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_03802544:
	mov r0, r6
	bl sub_037FEBD0
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _03802544
	mov r0, #0
	bl sub_037FFCF8
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_03802574:
	ldr r6, [sp, #0x1c]
_03802578:
	cmp r6, #0
	bne _03801F38
	ldr r0, _038025C0 ; =_03807E6C
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_03802594:
	ldr r0, _038025C8 ; =_03808FF0
	add r1, sp, #0x18
	mov r2, #0
	bl sub_037FC760
	cmp r0, #0
	bne _03801F28
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038025B8: .word 0x04000509
_038025BC: .word 0x003FFFFF
_038025C0: .word _03807E6C
_038025C4: .word _03807E70
_038025C8: .word _03808FF0
	arm_func_end sub_03801F1C

	arm_func_start sub_038025CC
sub_038025CC: ; 0x038025CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl EnableIrqFlag
	mov r4, r0
	cmp r5, #0x2000000
	blo _038025F8
	ldr r0, _03802614 ; =_03808FF0
	mov r1, r5
	mov r2, #0
	bl sub_037FC6D4
	b _03802604
_038025F8:
	cmp r5, #0
	bne _03802604
	bl sub_037FEFC8
_03802604:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03802614: .word _03808FF0
	arm_func_end sub_038025CC

	arm_func_start sub_03802618
sub_03802618: ; 0x03802618
	ldr ip, _03802620 ; =sub_03803168
	bx ip
	.align 2, 0
_03802620: .word sub_03803168
	arm_func_end sub_03802618

	arm_func_start sub_03802624
sub_03802624: ; 0x03802624
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _038026C8 ; =_03809060
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
	ldr r1, _038026CC ; =sub_038032B8
	ldr r3, _038026D0 ; =_03809660
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl sub_037FC054
	add r0, r4, #0x48
	bl sub_037FC36C
	ldr r1, _038026D4 ; =sub_038031D4
	mov r0, #0xb
	bl sub_037FE39C
	ldr r0, _038026D8 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _038026DC ; =_03809040
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038026C8: .word _03809060
_038026CC: .word sub_038032B8
_038026D0: .word _03809660
_038026D4: .word sub_038031D4
_038026D8: .word 0x027FFC40
_038026DC: .word _03809040
	arm_func_end sub_03802624

	arm_func_start sub_038026E0
sub_038026E0: ; 0x038026E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _0380271C ; =_03809060
	mov r7, r0
	bl EnableIrqFlag
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl sub_037FC3C0
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0380271C: .word _03809060
	arm_func_end sub_038026E0

	arm_func_start sub_03802720
sub_03802720: ; 0x03802720
	ldr r0, _03802728 ; =0x027FFA80
	bx lr
	.align 2, 0
_03802728: .word 0x027FFA80
	arm_func_end sub_03802720

	arm_func_start sub_0380272C
sub_0380272C: ; 0x0380272C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _038027C4
	cmp r5, #0
	beq _0380274C
	bl sub_037FC468
_0380274C:
	cmp r4, #0
	beq _038027A0
	sub r7, r4, r5
	mov r4, #0
	mov r5, #1
	mov r6, #5
	b _03802780
_03802768:
	cmp r7, #5
	movlt r8, r7
	movge r8, r6
	mov r0, r8
	bl sub_037FC468
	sub r7, r7, r8
_03802780:
	bl sub_038027D0
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _038027A0
	cmp r7, #0
	bgt _03802768
_038027A0:
	bl sub_038027D0
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _038027CC ; =_03809060
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_038027C4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038027CC: .word _03809060
	arm_func_end sub_0380272C

	arm_func_start sub_038027D0
sub_038027D0: ; 0x038027D0
	stmdb sp!, {r3, lr}
	ldr ip, _03802814 ; =_03809660
	mov lr, #2
	ldr r0, _03802818 ; =_0380720C
	ldr r3, _0380281C ; =sub_03802924
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl sub_03802860
	ldr r3, _03802820 ; =sub_038028E4
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl sub_03802860
	ldrb r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802814: .word _03809660
_03802818: .word _0380720C
_0380281C: .word sub_03802924
_03802820: .word sub_038028E4
	arm_func_end sub_038027D0

	arm_func_start sub_03802824
sub_03802824: ; 0x03802824
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl sub_0380272C
	ldr r0, _0380285C ; =_03809060
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
_0380285C: .word _03809060
	arm_func_end sub_03802824

	arm_func_start sub_03802860
sub_03802860: ; 0x03802860
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _038028D8 ; =_03809664
	ldr r8, _038028DC ; =0x0000A040
	ldr r4, _038028E0 ; =0x040001A0
	stmib r5, {r0, r1}
	strh r8, [r4]
	mov r7, r2
	mov r6, r3
	mov r8, #0xa000
	b _038028B4
_03802888:
	ldr r0, [r5]
	subs r0, r0, #1
	str r0, [r5]
	streqh r8, [r4]
_03802898:
	ldrh r0, [r4]
	tst r0, #0x80
	bne _03802898
	mov r0, r5
	mov lr, pc
	bx r6
_038028B0:
	sub r7, r7, #1
_038028B4:
	cmp r7, #0
	bne _03802888
	ldr r0, [r5]
	cmp r0, #0
	ldreq r0, _038028E0 ; =0x040001A0
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038028D8: .word _03809664
_038028DC: .word 0x0000A040
_038028E0: .word 0x040001A0
	arm_func_end sub_03802860

	arm_func_start sub_038028E4
sub_038028E4: ; 0x038028E4
	ldr r1, _03802920 ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_038028F4:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038028F4
	ldr r2, _03802920 ; =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_03802920: .word 0x040001A2
	arm_func_end sub_038028E4

	arm_func_start sub_03802924
sub_03802924: ; 0x03802924
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _03802970 ; =0x040001A2
	ldrb r1, [r1]
	strh r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	sub r1, r2, #2
_0380294C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380294C
	ldr r0, _03802970 ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	.align 2, 0
_03802970: .word 0x040001A2
	arm_func_end sub_03802924

	arm_func_start sub_03802974
sub_03802974: ; 0x03802974
	ldr r1, _038029D4 ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_03802984:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03802984
	ldr r2, _038029D4 ; =0x040001A2
	ldr r1, [r0, #4]
	ldrh r2, [r2]
	ldrb r1, [r1]
	and r2, r2, #0xff
	cmp r2, r1
	beq _038029C4
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0]
	cmp r1, #1
	movhi r1, #1
	strhi r1, [r0]
_038029C4:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_038029D4: .word 0x040001A2
	arm_func_end sub_03802974

	arm_func_start sub_038029D8
sub_038029D8: ; 0x038029D8
	stmdb sp!, {r3, lr}
	ldr ip, _03802A00 ; =_03809660
	mov r2, #1
	ldr r0, _03802A04 ; =_03807204
	ldr r3, _03802A08 ; =sub_03802924
	mov r1, #0
	str r2, [ip, #4]
	bl sub_03802860
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802A00: .word _03809660
_03802A04: .word _03807204
_03802A08: .word sub_03802924
	arm_func_end sub_038029D8

	arm_func_start sub_03802A0C
sub_03802A0C: ; 0x03802A0C
	stmdb sp!, {r3, lr}
	ldr r2, _03802AA4 ; =_03809060
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	cmp r2, #1
	beq _03802A38
	cmp r2, #2
	beq _03802A54
	cmp r2, #3
	beq _03802A6C
	b _03802A88
_03802A38:
	mov r3, r0, lsr #5
	and r3, r3, #8
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _03802A88
_03802A54:
	and r3, r0, #0xff00
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _03802A88
_03802A6C:
	mov r3, r0, lsr #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_03802A88:
	ldr r3, _03802AA8 ; =sub_03802924
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl sub_03802860
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802AA4: .word _03809060
_03802AA8: .word sub_03802924
	arm_func_end sub_03802A0C

	arm_func_start sub_03802AAC
sub_03802AAC: ; 0x03802AAC
	stmdb sp!, {r4, lr}
	ldr r0, _03802AFC ; =_03809060
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _03802AF4
	ldr r0, _03802B00 ; =_03809660
	ldr r0, [r0]
	cmp r0, #0
	bne _03802AF4
	bl sub_038027D0
	cmp r4, r0
	beq _03802AE8
	mov r0, r4
	bl sub_03802F04
_03802AE8:
	ldr r0, _03802B00 ; =_03809660
	mov r1, #1
	str r1, [r0]
_03802AF4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03802AFC: .word _03809060
_03802B00: .word _03809660
	arm_func_end sub_03802AAC

	arm_func_start sub_03802B04
sub_03802B04: ; 0x03802B04
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_03802824
	cmp r0, #0
	beq _03802B5C
	ldr r0, _03802B64 ; =_03809060
	ldr r2, _03802B68 ; =_03809660
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl sub_03802A0C
	ldr r3, _03802B6C ; =sub_038028E4
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl sub_03802860
_03802B5C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03802B64: .word _03809060
_03802B68: .word _03809660
_03802B6C: .word sub_038028E4
	arm_func_end sub_03802B04

	arm_func_start sub_03802B70
sub_03802B70: ; 0x03802B70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl sub_03802824
	cmp r0, #0
	beq _03802C14
	ldr r0, _03802C1C ; =_03809060
	ldr fp, _03802C20 ; =_03809660
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _03802C0C
_03802BA4:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl sub_038029D8
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl sub_03802A0C
	ldr r3, _03802C24 ; =sub_03802924
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl sub_03802860
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl sub_0380272C
	ldr r0, [r5]
	cmp r0, #0
	bne _03802C14
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_03802C0C:
	cmp r8, #0
	bne _03802BA4
_03802C14:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03802C1C: .word _03809060
_03802C20: .word _03809660
_03802C24: .word sub_03802924
	arm_func_end sub_03802B70

	arm_func_start sub_03802C28
sub_03802C28: ; 0x03802C28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl sub_03802824
	cmp r0, #0
	beq _03802CCC
	ldr r0, _03802CD4 ; =_03809060
	ldr fp, _03802CD8 ; =_03809660
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _03802CC4
_03802C5C:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl sub_038029D8
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl sub_03802A0C
	ldr r3, _03802CDC ; =sub_03802924
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl sub_03802860
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl sub_0380272C
	ldr r0, [r5]
	cmp r0, #0
	bne _03802CCC
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_03802CC4:
	cmp r8, #0
	bne _03802C5C
_03802CCC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03802CD4: .word _03809060
_03802CD8: .word _03809660
_03802CDC: .word sub_03802924
	arm_func_end sub_03802C28

	arm_func_start sub_03802CE0
sub_03802CE0: ; 0x03802CE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_03802824
	cmp r0, #0
	beq _03802D5C
	ldr r0, _03802D64 ; =_03809060
	ldr r2, _03802D68 ; =_03809660
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl sub_03802A0C
	ldr r3, _03802D6C ; =sub_03802974
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl sub_03802860
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _03802D68 ; =_03809660
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_03802D5C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03802D64: .word _03809060
_03802D68: .word _03809660
_03802D6C: .word sub_03802974
	arm_func_end sub_03802CE0

	arm_func_start sub_03802D70
sub_03802D70: ; 0x03802D70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _03802E04 ; =_03809060
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x1c]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _03802DFC
	bl sub_03802824
	cmp r0, #0
	beq _03802DFC
	ldr r8, _03802E08 ; =_03809660
	mov sb, #0xd8
	b _03802DF4
_03802DB8:
	bl sub_038029D8
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl sub_03802A0C
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl sub_0380272C
	ldr r0, [r4]
	cmp r0, #0
	bne _03802DFC
	add r7, r7, r5
	sub r6, r6, r5
_03802DF4:
	cmp r6, #0
	bne _03802DB8
_03802DFC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03802E04: .word _03809060
_03802E08: .word _03809660
	arm_func_end sub_03802D70

	arm_func_start sub_03802E0C
sub_03802E0C: ; 0x03802E0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _03802EA0 ; =_03809060
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x20]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _03802E98
	bl sub_03802824
	cmp r0, #0
	beq _03802E98
	ldr r8, _03802EA4 ; =_03809660
	mov sb, #0x20
	b _03802E90
_03802E54:
	bl sub_038029D8
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl sub_03802A0C
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl sub_0380272C
	ldr r0, [r4]
	cmp r0, #0
	bne _03802E98
	add r7, r7, r5
	sub r6, r6, r5
_03802E90:
	cmp r6, #0
	bne _03802E54
_03802E98:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03802EA0: .word _03809060
_03802EA4: .word _03809660
	arm_func_end sub_03802E0C

	arm_func_start sub_03802EA8
sub_03802EA8: ; 0x03802EA8
	stmdb sp!, {r4, lr}
	bl sub_03802824
	cmp r0, #0
	beq _03802EEC
	ldr r0, _03802EF4 ; =_03809060
	ldr r4, [r0]
	bl sub_038029D8
	ldr r1, _03802EF8 ; =_03809660
	mov r2, #1
	ldr r0, _03802EFC ; =_03807208
	ldr r3, _03802F00 ; =sub_03802924
	str r2, [r1, #4]
	mov r1, #0
	bl sub_03802860
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl sub_0380272C
_03802EEC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03802EF4: .word _03809060
_03802EF8: .word _03809660
_03802EFC: .word _03807208
_03802F00: .word sub_03802924
	arm_func_end sub_03802EA8

	arm_func_start sub_03802F04
sub_03802F04: ; 0x03802F04
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl sub_03802824
	cmp r0, #0
	beq _03802F88
	ldr r0, _03802F90 ; =_03809060
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _03802F94 ; =sub_03802924
	ldr r4, _03802F98 ; =_03809660
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_03802F48:
	bl sub_038029D8
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl sub_03802860
	mov r0, fp
	mov r1, #0
	bl sub_0380272C
	ldr r0, [sb]
	cmp r0, #4
	bne _03802F88
	sub sl, sl, #1
	cmp sl, #0
	bgt _03802F48
_03802F88:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03802F90: .word _03809060
_03802F94: .word sub_03802924
_03802F98: .word _03809660
	arm_func_end sub_03802F04

	arm_func_start sub_03802F9C
sub_03802F9C: ; 0x03802F9C
	ldr r3, _03802FF4 ; =0x040001A4
_03802FA0:
	ldr r2, [r3]
	tst r2, #0x80000000
	bne _03802FA0
	ldr r3, _03802FF8 ; =0x040001A1
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
_03802FF4: .word 0x040001A4
_03802FF8: .word 0x040001A1
	arm_func_end sub_03802F9C

	arm_func_start sub_03802FFC
sub_03802FFC: ; 0x03802FFC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0380306C ; =_03809060
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl EnableIrqFlag
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl sub_037FC2E4
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03803048
	add r0, r4, #0x48
	bl sub_037FC36C
_03803048:
	mov r0, r5
	bl SetIrqFlag
	cmp r7, #0
	beq _03803064
	mov r0, r6
	mov lr, pc
	bx r7
_03803064:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0380306C: .word _03809060
	arm_func_end sub_03802FFC

	arm_func_start sub_03803070
sub_03803070: ; 0x03803070
	ldr r1, _0380308C ; =_03807560
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_0380308C: .word _03807560
	arm_func_end sub_03803070

	arm_func_start sub_03803090
sub_03803090: ; 0x03803090
	bx lr
	arm_func_end sub_03803090

	arm_func_start sub_03803094
sub_03803094: ; 0x03803094
	stmdb sp!, {r3, lr}
	mov r0, #0xb8000000
	mov r1, #0
	bl sub_03802F9C
	mov r0, #0x7000000
	bl sub_03803070
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _038030DC ; =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_038030C0:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _038030C0
	ldr r0, _038030E0 ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038030DC: .word 0x040001A4
_038030E0: .word 0x04100010
	arm_func_end sub_03803094

	arm_func_start sub_038030E4
sub_038030E4: ; 0x038030E4
	stmdb sp!, {r4, lr}
	ldr r0, _03803110 ; =_03809060
	mov r1, #0
	mov r2, r1
	bl sub_03803114
	bl sub_03803094
	mov r4, r0
	bl sub_03802FFC
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03803110: .word _03809060
	arm_func_end sub_038030E4

	arm_func_start sub_03803114
sub_03803114: ; 0x03803114
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	mov r4, r0
	b _03803138
_03803130:
	add r0, r7, #0xf4
	bl sub_037FC290
_03803138:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _03803130
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_03803114

	arm_func_start sub_03803168
sub_03803168: ; 0x03803168
	stmdb sp!, {r3, lr}
	ldr ip, _038031C8 ; =_03809060
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _038031C0
	ldr r0, _038031CC ; =_03809680
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
	bl sub_03802624
	ldr r1, _038031D0 ; =sub_03803090
	ldr r0, _038031CC ; =_03809680
	str r1, [r0, #0x20]
	bl sub_038034EC
_038031C0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038031C8: .word _03809060
_038031CC: .word _03809680
_038031D0: .word sub_03803090
	arm_func_end sub_03803168

	arm_func_start sub_038031D4
sub_038031D4: ; 0x038031D4
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	bne _038032AC
	cmp r2, #0
	beq _038032AC
	ldr r0, _038032B4 ; =_03809060
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03803278
_03803208: ; jump table
	b _03803248 ; case 0
	b _03803278 ; case 1
	b _0380326C ; case 2
	b _0380326C ; case 3
	b _0380326C ; case 4
	b _0380326C ; case 5
	b _0380326C ; case 6
	b _0380326C ; case 7
	b _0380326C ; case 8
	b _0380326C ; case 9
	b _0380326C ; case 10
	b _0380326C ; case 11
	b _0380326C ; case 12
	b _0380326C ; case 13
	b _0380326C ; case 14
	b _0380326C ; case 15
_03803248:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _03803278
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _03803278
_0380326C:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_03803278:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _038032AC
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl sub_037FC36C
_038032AC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038032B4: .word _03809060
	arm_func_end sub_038031D4

	arm_func_start sub_038032B8
sub_038032B8: ; 0x038032B8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _038034E8 ; =_03809060
_038032C0:
	mov r5, #0
	bl EnableIrqFlag
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_038032D4:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _0380330C
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03803318
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _03803328
_0380330C:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _03803328
_03803318:
	mov r0, r7
	str r8, [r4, #0xec]
	bl sub_037FC290
	b _038032D4
_03803328:
	mov r0, r6
	bl SetIrqFlag
	cmp r5, #0
	beq _038034D4
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
	beq _03803478
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03803470
_03803370: ; jump table
	b _03803478 ; case 0
	b _03803478 ; case 1
	b _038033B0 ; case 2
	b _038033B8 ; case 3
	b _038033C8 ; case 4
	b _03803470 ; case 5
	b _038033D4 ; case 6
	b _038033E8 ; case 7
	b _038033FC ; case 8
	b _03803410 ; case 9
	b _03803470 ; case 10
	b _03803424 ; case 11
	b _03803444 ; case 12
	b _0380344C ; case 13
	b _03803460 ; case 14
	b _03803434 ; case 15
_038033B0:
	bl sub_03802AAC
	b _03803478
_038033B8:
	bl sub_03803094
	ldr r1, [r4]
	str r0, [r1, #8]
	b _03803478
_038033C8:
	mov r0, #3
	str r0, [r3]
	b _03803478
_038033D4:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl sub_03802B04
	b _03803478
_038033E8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_03802C28
	b _03803478
_038033FC:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_03802B70
	b _03803478
_03803410:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl sub_03802CE0
	b _03803478
_03803424:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl sub_03802D70
	b _03803478
_03803434:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl sub_03802E0C
	b _03803478
_03803444:
	bl sub_03802EA8
	b _03803478
_0380344C:
	bl sub_038027D0
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _03803478
_03803460:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl sub_03802F04
	b _03803478
_03803470:
	mov r0, #3
	str r0, [r3]
_03803478:
	mov r6, #0xb
	mov r5, #1
_03803480:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl sub_037FE410
	cmp r0, #0
	blt _03803480
	bl EnableIrqFlag
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl sub_037FC2E4
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _038034C8
	add r0, r4, #0x48
	bl sub_037FC36C
_038034C8:
	mov r0, r5
	bl SetIrqFlag
	b _038032C0
_038034D4:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
_038034E4:
	b _038032C0
	.align 2, 0
_038034E8: .word _03809060
	arm_func_end sub_038032B8

	arm_func_start sub_038034EC
sub_038034EC: ; 0x038034EC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380353C ; =_038098C0
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _03803534
	mov r1, #1
	str r1, [r0, #8]
	bl sub_037FE2B4
	mov r5, #0xe
	mov r4, #0
_03803514:
	mov r0, r5
	mov r1, r4
	bl sub_037FE3EC
	cmp r0, #0
	beq _03803514
	ldr r1, _03803540 ; =sub_03803544
	mov r0, #0xe
	bl sub_037FE39C
_03803534:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380353C: .word _038098C0
_03803540: .word sub_03803544
	arm_func_end sub_038034EC

	arm_func_start sub_03803544
sub_03803544: ; 0x03803544
	stmdb sp!, {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0380359C
	mov r0, #0
	bl sub_037FDEF4
	mov r0, #1
	bl sub_037FDEF4
	mov r0, #2
	bl sub_037FDEF4
	mov r0, #3
	bl sub_037FDEF4
	mov r0, #0
	bl sub_03806610
	bl EnableIrqFlag
	mov r4, r0
	bl sub_037FE708
	bl sub_0380528C
	mov r0, r4
	bl SetIrqFlag
	bl sub_037FDE70
	b _038035A0
_0380359C:
	bl sub_037FDE70
_038035A0:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03803544

	arm_func_start sub_038035A8
sub_038035A8: ; 0x038035A8
	stmdb sp!, {r3, lr}
	ldr r0, _038035E8 ; =_038098C0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _038035D8
	ldr r0, _038035EC ; =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _038035D4
	bl sub_038035F0
	b _038035D8
_038035D4:
	bl sub_03803690
_038035D8:
	ldr r0, _038035E8 ; =_038098C0
	ldr r0, [r0, #0xc]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038035E8: .word _038098C0
_038035EC: .word 0x027FFE1F
	arm_func_end sub_038035A8

	arm_func_start sub_038035F0
sub_038035F0: ; 0x038035F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl sub_037FBBFC
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _03803668
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_037FBBCC
	cmp r0, #0
	bne _0380365C
	ldr r1, _03803688 ; =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl sub_038030E4
	ldr r1, [sp]
	cmp r0, r1
	mov r0, r4, lsl #0x10
	moveq r5, #1
	mov r0, r0, lsr #0x10
	movne r5, #0
	bl sub_037FBBAC
_0380365C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_037FBCA4
_03803668:
	ldr r1, _0380368C ; =_038098C0
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803688: .word 0x027FFC10
_0380368C: .word _038098C0
	arm_func_end sub_038035F0

	arm_func_start sub_03803690
sub_03803690: ; 0x03803690
	ldr r0, _038036B4 ; =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _038036B8 ; =_038098C0
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_038036B4: .word 0x04000214
_038036B8: .word _038098C0
	arm_func_end sub_03803690

	arm_func_start sub_038036BC
sub_038036BC: ; 0x038036BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _038037A8 ; =_038098C0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _038037A0
	ldr r2, _038037AC ; =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _038037A0
	ldr r1, _038037B0 ; =_03807564
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _038037A0
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _038037A0
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl sub_038035A8
	cmp r0, #0
	beq _03803750
	ldr r0, _038037A8 ; =_038098C0
	mov r1, #1
	str r1, [r0, #4]
	bl sub_03802720
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _03803750
	ldr r0, _038037B0 ; =_03807564
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _038037A0
_03803750:
	ldr r0, _038037A8 ; =_038098C0
	ldr r1, _038037B0 ; =_03807564
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _038037A0
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _03803788
_03803780:
	mov r0, r7
	bl sub_037FBA0C
_03803788:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	bne _03803780
_038037A0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_038037A8: .word _038098C0
_038037AC: .word 0x027FFC40
_038037B0: .word _03807564
	arm_func_end sub_038036BC

	thumb_func_start sub_038037B4
sub_038037B4: ; 0x038037B4
	swi 0
	bx lr
	thumb_func_end sub_038037B4

	thumb_func_start sub_038037B8
sub_038037B8: ; 0x038037B8
	swi 3
	bx lr
	thumb_func_end sub_038037B8

	thumb_func_start sub_038037BC
sub_038037BC: ; 0x038037BC
	ldr r2, _038037C8 ; =0x04000000
	mov ip, r2
	mov r2, #0
	swi 4
	bx lr
	.align 2, 0
_038037C8: .word 0x04000000
	thumb_func_end sub_038037BC

	thumb_func_start sub_038037CC
sub_038037CC: ; 0x038037CC
	mov r2, #0
	swi 5
	bx lr
	thumb_func_end sub_038037CC

	non_word_aligned_thumb_func_start sub_038037D2
sub_038037D2: ; 0x038037D2
	swi 6
	bx lr
	thumb_func_end sub_038037D2

	non_word_aligned_thumb_func_start sub_038037D6
sub_038037D6: ; 0x038037D6
	swi 7
	bx lr
	thumb_func_end sub_038037D6

	non_word_aligned_thumb_func_start sub_038037DA
sub_038037DA: ; 0x038037DA
	swi 8
	bx lr
	thumb_func_end sub_038037DA

	non_word_aligned_thumb_func_start sub_038037DE
sub_038037DE: ; 0x038037DE
	add r1, r0, #0
	mov r0, #1
	swi 8
	bx lr
	thumb_func_end sub_038037DE

	non_word_aligned_thumb_func_start sub_038037E6
sub_038037E6: ; 0x038037E6
	add r1, r0, #0
	mov r0, #0
	swi 8
	bx lr
	thumb_func_end sub_038037E6

	non_word_aligned_thumb_func_start sub_038037EE
sub_038037EE: ; 0x038037EE
	swi 9
	bx lr
	thumb_func_end sub_038037EE

	non_word_aligned_thumb_func_start sub_038037F2
sub_038037F2: ; 0x038037F2
	swi 9
	add r0, r1, #0
	bx lr
	thumb_func_end sub_038037F2

	thumb_func_start sub_038037F8
sub_038037F8: ; 0x038037F8
	swi 0xb
	bx lr
	thumb_func_end sub_038037F8

	thumb_func_start sub_038037FC
sub_038037FC: ; 0x038037FC
	swi 0xc
	bx lr
	thumb_func_end sub_038037FC

	thumb_func_start sub_03803800
sub_03803800: ; 0x03803800
	swi 0xd
	bx lr
	thumb_func_end sub_03803800

	thumb_func_start sub_03803804
sub_03803804: ; 0x03803804
	swi 0xe
	bx lr
	thumb_func_end sub_03803804

	thumb_func_start sub_03803808
sub_03803808: ; 0x03803808
	swi 0xf
	bx lr
	thumb_func_end sub_03803808

	thumb_func_start sub_0380380C
sub_0380380C: ; 0x0380380C
	swi 0x10
	bx lr
	thumb_func_end sub_0380380C

	thumb_func_start sub_03803810
sub_03803810: ; 0x03803810
	swi 0x11
	bx lr
	thumb_func_end sub_03803810

	thumb_func_start sub_03803814
sub_03803814: ; 0x03803814
	swi 0x12
	bx lr
	thumb_func_end sub_03803814

	thumb_func_start sub_03803818
sub_03803818: ; 0x03803818
	swi 0x13
	bx lr
	thumb_func_end sub_03803818

	thumb_func_start sub_0380381C
sub_0380381C: ; 0x0380381C
	swi 0x14
	bx lr
	thumb_func_end sub_0380381C

	thumb_func_start sub_03803820
sub_03803820: ; 0x03803820
	swi 0x15
	bx lr
	thumb_func_end sub_03803820

	thumb_func_start sub_03803824
sub_03803824: ; 0x03803824
	swi 0x1a
	bx lr
	thumb_func_end sub_03803824

	thumb_func_start sub_03803828
sub_03803828: ; 0x03803828
	swi 0x1b
	bx lr
	thumb_func_end sub_03803828

	thumb_func_start sub_0380382C
sub_0380382C: ; 0x0380382C
	swi 0x1c
	bx lr
	thumb_func_end sub_0380382C

	arm_func_start sub_03803830
sub_03803830: ; 0x03803830
	ldr r1, _03803868 ; =0x55555555
	ldr r2, _0380386C ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r1, r0, r1
	ldr r0, _03803870 ; =0x0F0F0F0F
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
_03803868: .word 0x55555555
_0380386C: .word 0x33333333
_03803870: .word 0x0F0F0F0F
	arm_func_end sub_03803830

	arm_func_start sub_03803874
sub_03803874: ; 0x03803874
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r1, _03803970 ; =_038098D0
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _03803964
	mov r0, #1
	strh r0, [r1]
	mov r0, #0
	str r0, [r1, #4]
	mov r0, #5
	str r0, [r1, #8]
	bl sub_03803D50
	bl sub_027F4FAC
	bl sub_03805360
	bl sub_038048A4
	bl sub_037FE2B4
	ldr r1, _03803974 ; =sub_03803CE8
	mov r0, #6
	bl sub_037FE39C
	ldr r1, _03803974 ; =sub_03803CE8
	mov r0, #9
	bl sub_037FE39C
	ldr r1, _03803974 ; =sub_03803CE8
	mov r0, #8
	bl sub_037FE39C
	ldr r1, _03803974 ; =sub_03803CE8
	mov r0, #4
	bl sub_037FE39C
	ldr r0, _03803978 ; =_03809B80
	ldr r1, _0380397C ; =_03809BA0
	mov r2, #0x10
	bl sub_037FC6AC
	mov sb, #0
	mov r6, #0x18
	ldr r8, _03803980 ; =_03809BE0
	mov r7, sb
	mov r5, r6
_03803910:
	mla r0, sb, r5, r8
	mov r1, r7
	mov r2, r6
	bl sub_037FE070
	add sb, sb, #1
	cmp sb, #0x10
	blt _03803910
	ldr r0, _03803970 ; =_038098D0
	mov r2, #0
	str r2, [r0, #0x490]
	str r2, [r0, #0x498]
	str r2, [r0, #0x494]
	mov r0, #0x200
	str r0, [sp]
	ldr r0, _03803984 ; =_038098DC
	ldr r1, _03803988 ; =sub_03803C7C
	ldr r3, _03803978 ; =_03809B80
	str r4, [sp, #4]
	bl sub_037FC054
	ldr r0, _03803984 ; =_038098DC
	bl sub_037FC36C
_03803964:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03803970: .word _038098D0
_03803974: .word sub_03803CE8
_03803978: .word _03809B80
_0380397C: .word _03809BA0
_03803980: .word _03809BE0
_03803984: .word _038098DC
_03803988: .word sub_03803C7C
	arm_func_end sub_03803874

	arm_func_start sub_0380398C
sub_0380398C: ; 0x0380398C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _038039E0 ; =_03809D64
	ldr r4, _038039E4 ; =_038098D0
	mov r6, r0
_0380399C:
	bl EnableIrqFlag
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _038039BC
	bl SetIrqFlag
	mov r0, r5
	bl sub_037FC290
	b _0380399C
_038039BC:
	ldr r1, _038039E4 ; =_038098D0
	mov r2, #1
	str r2, [r1, #4]
	mov r2, #4
	str r2, [r1, #8]
	str r6, [r1, #0x49c]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_038039E0: .word _03809D64
_038039E4: .word _038098D0
	arm_func_end sub_0380398C

	arm_func_start sub_038039E8
sub_038039E8: ; 0x038039E8
	stmdb sp!, {r3, lr}
	ldr r1, _03803A40 ; =_038098D0
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _03803A38
	ldr r2, [r1, #8]
	cmp r2, #4
	ldreq r1, [r1, #0x49c]
	cmpeq r1, r0
	bne _03803A38
	bl EnableIrqFlag
	ldr r1, _03803A40 ; =_038098D0
	mov r2, #5
	str r2, [r1, #8]
	mov r2, #0
	str r2, [r1, #4]
	str r2, [r1, #0x49c]
	bl SetIrqFlag
	ldr r0, _03803A44 ; =_03809D64
	bl sub_037FC2E4
_03803A38:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803A40: .word _038098D0
_03803A44: .word _03809D64
	arm_func_end sub_038039E8

	arm_func_start sub_03803A48
sub_03803A48: ; 0x03803A48
	stmdb sp!, {r4, r5, r6, lr}
	and r2, r0, #0x70
	cmp r2, #0x30
	bgt _03803A80
	bge _03803ACC
	cmp r2, #0x10
	bgt _03803A74
	bge _03803AB4
	cmp r2, #0
	beq _03803AB4
	b _03803AD0
_03803A74:
	cmp r2, #0x20
	beq _03803ACC
	b _03803AD0
_03803A80:
	cmp r2, #0x50
	bgt _03803A98
	bge _03803ABC
	cmp r2, #0x40
	beq _03803ABC
	b _03803AD0
_03803A98:
	cmp r2, #0x60
	bgt _03803AA8
	beq _03803AC4
	b _03803AD0
_03803AA8:
	cmp r2, #0x70
	beq _03803AC4
	b _03803AD0
_03803AB4:
	mov r4, #6
	b _03803AD0
_03803ABC:
	mov r4, #9
	b _03803AD0
_03803AC4:
	mov r4, #8
	b _03803AD0
_03803ACC:
	mov r4, #4
_03803AD0:
	and r0, r0, #0xff
	orr r0, r0, #0x80
	mov r0, r0, lsl #8
	orr r2, r0, #0x3000000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #0
_03803AEC:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_037FE410
	cmp r0, #0
	blt _03803AEC
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03803A48

	arm_func_start sub_03803B0C
sub_03803B0C: ; 0x03803B0C
	ldr r0, _03803B24 ; =_038098D0
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_03803B24: .word _038098D0
	arm_func_end sub_03803B0C

	arm_func_start sub_03803B28
sub_03803B28: ; 0x03803B28
	ldr r1, _03803B3C ; =_038098D0
	mov r2, #1
	str r2, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_03803B3C: .word _038098D0
	arm_func_end sub_03803B28

	arm_func_start sub_03803B40
sub_03803B40: ; 0x03803B40
	stmdb sp!, {r3, lr}
	ldr r1, _03803B74 ; =_038098D0
	ldr r2, [r1, #8]
	cmp r2, r0
	bne _03803B6C
	ldr r0, _03803B78 ; =_03809D64
	mov r2, #5
	str r2, [r1, #8]
	mov r2, #0
	str r2, [r1, #4]
	bl sub_037FC2E4
_03803B6C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803B74: .word _038098D0
_03803B78: .word _03809D64
	arm_func_end sub_03803B40

	arm_func_start sub_03803B7C
sub_03803B7C: ; 0x03803B7C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r2, [sp, #0x18]
	mov r5, r0
	cmp r2, #4
	mov r4, r1
	movhi r0, #0
	bhi _03803C3C
	bl EnableIrqFlag
	ldr r3, _03803C48 ; =_038098D0
	add r2, sp, #0x18
	ldr ip, [r3, #0x490]
	mov r1, #0x18
	mul r6, ip, r1
	ldr lr, _03803C4C ; =_03809BE0
	ldr ip, _03803C50 ; =_03809BE4
	str r5, [lr, r6]
	ldr r5, [r3, #0x490]
	bic r2, r2, #3
	mul lr, r5, r1
	str r4, [ip, lr]
	add r6, r2, #4
	ldrh r1, [sp, #0x18]
	ldr r5, _03803C54 ; =_038098D4
	mov lr, #0
	mov r2, #0x18
	b _03803C04
_03803BE8:
	ldr ip, [r3, #0x490]
	add r6, r6, #4
	mla r4, ip, r2, r5
	add r4, r4, lr, lsl #2
	ldr ip, [r6, #-4]
	add lr, lr, #1
	str ip, [r4, #0x314]
_03803C04:
	cmp lr, r1
	blt _03803BE8
	ldr r1, _03803C48 ; =_038098D0
	ldr r4, [r1, #0x490]
	add r2, r4, #1
	and r2, r2, #0xf
	str r2, [r1, #0x490]
	bl SetIrqFlag
	ldr r1, _03803C4C ; =_03809BE0
	mov r0, #0x18
	mla r1, r4, r0, r1
	ldr r0, _03803C58 ; =_03809B80
	mov r2, #0
	bl sub_037FC6D4
_03803C3C:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_03803C48: .word _038098D0
_03803C4C: .word _03809BE0
_03803C50: .word _03809BE4
_03803C54: .word _038098D4
_03803C58: .word _03809B80
	arm_func_end sub_03803B7C

	arm_func_start sub_03803C5C
sub_03803C5C: ; 0x03803C5C
	stmdb sp!, {r3, lr}
	ldr r0, _03803C78 ; =_03809B80
	add r1, sp, #0
	mov r2, #0
	bl sub_037FC7FC
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803C78: .word _03809B80
	arm_func_end sub_03803C5C

	arm_func_start sub_03803C7C
sub_03803C7C: ; 0x03803C7C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r6, _03803CE4 ; =_03809B80
	add r5, sp, #0
	mov r4, #1
_03803C90:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FC760
	ldr r0, [sp]
	ldr r1, [r0]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _03803C90
_03803CB4: ; jump table
	b _03803CC4 ; case 0
	b _03803CDC ; case 1
	b _03803CCC ; case 2
	b _03803CD4 ; case 3
_03803CC4:
	bl sub_03804048
	b _03803C90
_03803CCC:
	bl sub_03805714
	b _03803C90
_03803CD4:
	bl sub_03804A9C
	b _03803C90
_03803CDC:
	bl sub_027F517C
	b _03803C90
	.align 2, 0
_03803CE4: .word _03809B80
	arm_func_end sub_03803C7C

	arm_func_start sub_03803CE8
sub_03803CE8: ; 0x03803CE8
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _03803D48
	sub r0, r0, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03803D48
_03803D04: ; jump table
	b _03803D40 ; case 0
	b _03803D48 ; case 1
	b _03803D1C ; case 2
	b _03803D48 ; case 3
	b _03803D34 ; case 4
	b _03803D28 ; case 5
_03803D1C:
	mov r0, r1
	bl sub_03803E60
	b _03803D48
_03803D28:
	mov r0, r1
	bl sub_038053A8
	b _03803D48
_03803D34:
	mov r0, r1
	bl sub_038048E0
	b _03803D48
_03803D40:
	mov r0, r1
	bl sub_027F4FD4
_03803D48:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03803CE8

	arm_func_start sub_03803D50
sub_03803D50: ; 0x03803D50
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _03803E1C ; =_03809D70
	mov r3, #0
	str r3, [r0, #0x24]
	mov r1, #0x14
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	ldr r0, _03803E20 ; =_03809D74
	mov r2, r3
_03803D74:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03803D74
	bl sub_037FD798
	cmp r0, #0
	bne _03803D98
	bl sub_037FD74C
_03803D98:
	ldr r7, _03803E24 ; =_03809DA0
	ldr r5, _03803E28 ; =0x54505641
	mov r8, #0
	mov r4, #0x28
_03803DA8:
	mul r6, r8, r4
	add r0, r7, r6
	bl sub_037FD884
	mov r1, r5
	add r0, r7, r6
	bl sub_037FDA14
	add r8, r8, #1
	cmp r8, #4
	blt _03803DA8
	ldr r2, _03803E2C ; =0x040001C0
_03803DD0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803DD0
	ldr r1, _03803E30 ; =0x00008A01
	ldr r0, _03803E34 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03803DF4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DF4
	bl sub_03803E3C
	ldr r1, _03803E38 ; =0x00008201
	ldr r0, _03803E2C ; =0x040001C0
	strh r1, [r0]
	bl sub_03803E3C
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03803E1C: .word _03809D70
_03803E20: .word _03809D74
_03803E24: .word _03809DA0
_03803E28: .word 0x54505641
_03803E2C: .word 0x040001C0
_03803E30: .word 0x00008A01
_03803E34: .word 0x040001C2
_03803E38: .word 0x00008201
	arm_func_end sub_03803D50

	arm_func_start sub_03803E3C
sub_03803E3C: ; 0x03803E3C
	ldr r0, _03803E5C ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03803E4C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803E4C
	bx lr
	.align 2, 0
_03803E5C: .word 0x040001C2
	arm_func_end sub_03803E3C

	arm_func_start sub_03803E60
sub_03803E60: ; 0x03803E60
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _03803E90
	ldr r1, _0380403C ; =_03809D74
	mov r4, #0
	mov r3, r4
_03803E7C:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03803E7C
_03803E90:
	ldr r1, _0380403C ; =_03809D74
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _03804030
	ldr r2, _03804040 ; =_03809D70
	ldrh r1, [r2, #4]
	and r0, r1, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _03804024
_03803ECC: ; jump table
	b _03803F10 ; case 0
	b _03803F38 ; case 1
	b _03803FD4 ; case 2
	b _03803EDC ; case 3
_03803EDC:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	mov r0, #3
	bne _03803EFC
	mov r1, #2
	bl sub_03803A48
	b _03804030
_03803EFC:
	str r3, [r2, #0x28]
	mov r1, #0
	str r3, [r2, #0x2c]
	bl sub_03803A48
	b _03804030
_03803F10:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl sub_03803B7C
	cmp r0, #0
	bne _03804030
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804030
_03803F38:
	ldr r0, [r2, #0x24]
	cmp r0, #0
	beq _03803F54
	mov r0, r4
	mov r1, #3
	bl sub_03803A48
	b _03804030
_03803F54:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	beq _03803F6C
	cmp r3, #4
	bls _03803F7C
_03803F6C:
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _03804030
_03803F7C:
	ldrh ip, [r2, #6]
	ldr r0, _03804044 ; =0x00000107
	cmp ip, r0
	blo _03803F9C
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _03804030
_03803F9C:
	mov r1, r4
	mov r0, #0
	mov r2, #2
	str ip, [sp]
	bl sub_03803B7C
	cmp r0, #0
	ldrne r0, _03804040 ; =_03809D70
	movne r1, #1
	strne r1, [r0, #0x24]
	bne _03804030
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804030
_03803FD4:
	ldr r0, [r2, #0x24]
	cmp r0, #2
	beq _03803FF0
	mov r0, r4
	mov r1, #3
	bl sub_03803A48
	b _03804030
_03803FF0:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl sub_03803B7C
	cmp r0, #0
	ldrne r0, _03804040 ; =_03809D70
	movne r1, #3
	strne r1, [r0, #0x24]
	bne _03804030
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804030
_03804024:
	mov r0, r4
	mov r1, #1
	bl sub_03803A48
_03804030:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_0380403C: .word _03809D74
_03804040: .word _03809D70
_03804044: .word 0x00000107
	arm_func_end sub_03803E60

	arm_func_start sub_03804048
sub_03804048: ; 0x03804048
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r1, [sl, #4]
	cmp r1, #2
	bhi _0380407C
	cmp r1, #0
	beq _03804094
	cmp r1, #1
	beq _03804200
	cmp r1, #2
	beq _038042C8
	b _03804314
_0380407C:
	cmp r1, #0x10
	bne _03804314
	ldr r0, _03804320 ; =_03809D70
	ldr r0, [r0, #0x24]
	cmp r0, #2
	bne _03804314
_03804094:
	bl EnableIrqFlag
	mov r4, r0
	mov r0, #0
	bl sub_03803B0C
	cmp r0, #0
	bne _038040CC
	mov r0, r4
	bl SetIrqFlag
	ldr r0, [sl, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	b _03804314
_038040CC:
	mov r0, #0
	bl sub_03803B28
	mov r0, r4
	bl SetIrqFlag
	ldr r1, _03804320 ; =_03809D70
	add r0, sp, #8
	ldr r1, [r1, #0x28]
	add r2, sp, #4
	bl sub_038046AC
	ldr r0, [sp, #8]
	ldrh r2, [sp, #4]
	mov r1, r0, lsl #7
	movs r1, r1, lsr #0x1f
	ldreq r0, _03804320 ; =_03809D70
	moveq r1, #0
	streqb r1, [r0, #1]
	streqb r1, [r0]
	beq _038041AC
	mov r0, r0, lsl #5
	movs r0, r0, lsr #0x1e
	beq _0380415C
	ldr r0, _03804320 ; =_03809D70
	mov r3, #0
	strb r3, [r0]
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	cmp r1, #4
	blo _038041AC
	strb r3, [r0, #1]
	ldr r1, [r0, #0x28]
	cmp r1, #0x23
	addlt r1, r1, #1
	strlt r1, [r0, #0x28]
	b _038041AC
_0380415C:
	ldr r0, _03804320 ; =_03809D70
	mov r4, #0
	strb r4, [r0, #1]
	ldr r3, [r0, #0x28]
	cmp r2, r3, asr #1
	strgeb r4, [r0]
	bge _038041AC
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #4
	blo _038041AC
	strb r4, [r0]
	ldr r1, [r0, #0x2c]
	cmp r3, r1
	subgt r1, r3, #1
	strgt r1, [r0, #0x28]
	movgt r1, #3
	strgtb r1, [r0, #1]
_038041AC:
	ldrh r0, [sp, #8]
	ldr r1, _03804324 ; =0x027FFFAA
	strh r0, [r1]
	ldrh r0, [sp, #0xa]
	strh r0, [r1, #2]
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _038041E0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_03803A48
	b _038041F4
_038041E0:
	ldr r1, [sl, #8]
	mov r0, r0, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl sub_03803A48
_038041F4:
	mov r0, #0
	bl sub_03803B40
	b _03804314
_03804200:
	ldr r0, _03804320 ; =_03809D70
	ldr r0, [r0, #0x24]
	cmp r0, #1
	bne _038042B4
	ldr r8, _03804328 ; =0x00000107
	ldr r6, _0380432C ; =_03809D74
	ldr r5, _03804330 ; =_03809DA0
	mov sb, #0
	mov r7, #0xd7
	mov fp, #0xa
	mov r4, #0x28
	b _03804284
_03804230:
	mul r0, sb, r8
	bl sub_03806DD4
	ldr r2, [sl, #0xc]
	mov r1, r8
	add r0, r2, r0
	bl sub_03806DD4
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xc8
	blo _03804260
	cmp r0, #0xd7
	movlo r0, r7
_03804260:
	add r1, r6, sb, lsl #1
	strh r0, [r1, #0xcc]
	str sb, [sp]
	mla r0, sb, r4, r5
	ldrsh r1, [r1, #0xcc]
	ldr r3, _03804334 ; =sub_0380433C
	mov r2, fp
	bl sub_037FD928
	add sb, sb, #1
_03804284:
	ldr r1, [sl, #8]
	cmp sb, r1
	blo _03804230
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	ldr r0, _03804320 ; =_03809D70
	mov r1, #2
	str r1, [r0, #0x24]
	b _03804314
_038042B4:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_03803A48
	b _03804314
_038042C8:
	ldr r0, _03804320 ; =_03809D70
	ldr r0, [r0, #0x24]
	cmp r0, #3
	bne _03804304
	ldr r0, _03804338 ; =0x54505641
	bl sub_037FDA84
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	ldr r0, _03804320 ; =_03809D70
	mov r1, #0
	str r1, [r0, #0x24]
	b _03804314
_03804304:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_03803A48
_03804314:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03804320: .word _03809D70
_03804324: .word 0x027FFFAA
_03804328: .word 0x00000107
_0380432C: .word _03809D74
_03804330: .word _03809DA0
_03804334: .word sub_0380433C
_03804338: .word 0x54505641
	arm_func_end sub_03804048

	arm_func_start sub_0380433C
sub_0380433C: ; 0x0380433C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r4
	mov r0, #0
	mov r1, #0x10
	mov r2, #1
	bl sub_03803B7C
	cmp r0, #0
	bne _03804394
	ldr r0, [sp]
	ldr r3, _038043A0 ; =0x027FFFAA
	bic r0, r0, #0x6000000
	orr r0, r0, #0x6000000
	str r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	strh r0, [r3]
	and r1, r4, #0xff
	mov r0, #0x10
	strh r2, [r3, #2]
	bl sub_03803A48
_03804394:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_038043A0: .word 0x027FFFAA
	arm_func_end sub_0380433C

	arm_func_start sub_038043A4
sub_038043A4: ; 0x038043A4
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl sub_037FE5A8
	ldr r2, _03804480 ; =0x040001C0
_038043B4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _038043B4
	ldr r1, _03804484 ; =0x00008A01
	ldr r0, _03804488 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_038043D8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _038043D8
	bl sub_03804498
	ldr r1, _0380448C ; =0x00008201
	ldr r0, _03804480 ; =0x040001C0
	strh r1, [r0]
	bl sub_03804498
	ldr r0, _03804490 ; =_03809E48
	ldrh r0, [r0]
	cmp r0, #0
	bne _03804420
	ldr r0, _03804494 ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	moveq r0, #1
	movne r0, #0
	b _03804478
_03804420:
	ldr r2, _03804494 ; =0x04000136
	ldrh r0, [r2]
	tst r0, #0x40
	moveq r0, #1
	beq _03804478
	ldr r1, _03804484 ; =0x00008A01
	mov r0, #0x84
	strh r1, [r2, #0x8a]
	strh r0, [r2, #0x8c]
_03804444:
	ldrh r0, [r2, #0x8a]
	tst r0, #0x80
	bne _03804444
	bl sub_03804498
	ldr r1, _0380448C ; =0x00008201
	ldr r0, _03804480 ; =0x040001C0
	strh r1, [r0]
	bl sub_03804498
	ldr r0, _03804494 ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	movne r0, #0
	moveq r0, #2
_03804478:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03804480: .word 0x040001C0
_03804484: .word 0x00008A01
_03804488: .word 0x040001C2
_0380448C: .word 0x00008201
_03804490: .word _03809E48
_03804494: .word 0x04000136
	arm_func_end sub_038043A4

	arm_func_start sub_03804498
sub_03804498: ; 0x03804498
	ldr r0, _038044B8 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_038044A8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _038044A8
	bx lr
	.align 2, 0
_038044B8: .word 0x040001C2
	arm_func_end sub_03804498

	arm_func_start sub_038044BC
sub_038044BC: ; 0x038044BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	cmp r2, #0
	ldr r2, _03804698 ; =0x040001C0
	mov r5, r3
	moveq r3, #0xd1
	moveq r4, #1
	mov r7, r0
	mov r6, r1
	movne r3, #0x91
	movne r4, #2
_038044E8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _038044E8
	ldr r1, _0380469C ; =0x00008A01
	ldr r0, _038046A0 ; =0x040001C2
	strh r1, [r2]
	and r2, r3, #0xff
	strh r2, [r0]
	sub r1, r0, #2
_0380450C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380450C
	mov r0, r2, lsl #0x10
	ldr r2, _03804698 ; =0x040001C0
	mov ip, #0
	ldr r8, _038046A4 ; =0x00007FF8
	add r1, sp, #0
	mov r0, r0, lsr #0x10
	mov r3, ip
_03804534:
	strh r3, [r2, #2]
_03804538:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _03804538
	ldrh sb, [r2, #2]
	and sb, sb, #0xff
	mov lr, sb, lsl #0x10
	mov sb, lr, lsr #8
	str sb, [r1, ip, lsl #2]
	strh r0, [r2, #2]
_0380455C:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _0380455C
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
	blt _03804534
	ldr r0, _038046A8 ; =0x00008201
	strh r0, [r2]
	bl sub_03804498
	mov r8, #0
	mov sb, r8
	add r2, sp, #0
_038045AC:
	ldr r1, [r2, sb, lsl #2]
	add r3, sb, #1
	b _038045D0
_038045B8:
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	subs r0, r1, r0
	rsbmi r0, r0, #0
	cmp r0, r8
	movgt r8, r0
_038045D0:
	cmp r3, #5
	blt _038045B8
	add sb, sb, #1
	cmp sb, #4
	blt _038045AC
	strh r8, [r5]
	mov r8, #0
	add r0, sp, #0
	b _03804668
_038045F4:
	ldr r3, [r0, r8, lsl #2]
	add sb, r8, #1
	b _0380465C
_03804600:
	ldr r2, [r0, sb, lsl #2]
	subs r1, r3, r2
	rsbmi r1, r1, #0
	cmp r1, r6
	bgt _03804658
	add r1, sb, #1
	b _03804650
_0380461C:
	ldr r5, [r0, r1, lsl #2]
	subs ip, r3, r5
	rsbmi ip, ip, #0
	cmp ip, r6
	bgt _0380464C
	add r0, r2, r3, lsl #1
	add r0, r5, r0
	mov r0, r0, asr #2
	bic r0, r0, #7
	strh r0, [r7]
	mov r0, #0
	b _0380468C
_0380464C:
	add r1, r1, #1
_03804650:
	cmp r1, #5
	blt _0380461C
_03804658:
	add sb, sb, #1
_0380465C:
	cmp sb, #4
	blt _03804600
	add r8, r8, #1
_03804668:
	cmp r8, #3
	blt _038045F4
	ldr r2, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r4
	add r1, r2, r1
	mov r1, r1, asr #1
	bic r1, r1, #7
	strh r1, [r7]
_0380468C:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03804698: .word 0x040001C0
_0380469C: .word 0x00008A01
_038046A0: .word 0x040001C2
_038046A4: .word 0x00007FF8
_038046A8: .word 0x00008201
	arm_func_end sub_038044BC

	arm_func_start sub_038046AC
sub_038046AC: ; 0x038046AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r6, r1
	mov r5, r2
	mov r1, #0
	mov r7, r0
	strh r1, [r5]
	rsbmi r6, r6, #0
	bl sub_038043A4
	movs r4, r0
	bne _03804714
	ldr r1, [r7]
	mov r0, #0x1000
	rsb r0, r0, #0
	and r1, r1, r0
	ldr r0, _03804890 ; =0xFF000FFF
	and r0, r1, r0
	bic r1, r0, #0x1000000
	bic r0, r1, #0x6000000
	str r1, [r7]
	orr r1, r0, #0x6000000
	str r1, [r7]
	ldr r0, _03804894 ; =_03809E48
	mov r1, #0
	strh r1, [r0]
	b _03804884
_03804714:
	add r0, sp, #4
	add r3, sp, #2
	mov r1, r6
	mov r2, #0
	bl sub_038044BC
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
	bl sub_038044BC
	cmp r0, #2
	bne _03804794
	ldr r1, [r7]
	mov r0, r1, lsl #5
	mov r0, r0, lsr #0x1e
	orr r0, r0, #2
	bic r1, r1, #0x6000000
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #5
	str r0, [r7]
_03804794:
	ldrh r1, [sp, #4]
	ldr r2, [r7]
	ldr r0, _03804890 ; =0xFF000FFF
	mov r1, r1, lsl #0x14
	and r0, r2, r0
	orr r2, r0, r1, lsr #8
	ldr r1, _03804898 ; =0x00008A01
	ldr r0, _0380489C ; =0x040001C0
	str r2, [r7]
	strh r1, [r0]
	mov r6, #0
_038047C0:
	bl sub_03804498
	add r6, r6, #1
	cmp r6, #0xc
	blt _038047C0
	ldr r1, _038048A0 ; =0x00008201
	ldr r0, _0380489C ; =0x040001C0
	strh r1, [r0]
	bl sub_03804498
	cmp r4, #2
	ldreq r0, [r7]
	biceq r0, r0, #0x6000000
	orreq r0, r0, #0x6000000
	streq r0, [r7]
	bl sub_038043A4
	cmp r0, #0
	beq _03804864
	cmp r0, #1
	beq _03804834
	cmp r0, #2
	bne _03804880
	ldr r1, [r7]
	ldr r0, _03804894 ; =_03809E48
	orr r2, r1, #0x1000000
	bic r1, r2, #0x6000000
	orr r1, r1, #0x6000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03804884
_03804834:
	ldr r1, [r7]
	ldr r0, _03804894 ; =_03809E48
	orr r1, r1, #0x1000000
	str r1, [r7]
	mov r2, #1
	ldrh r1, [sp]
	ldrh r3, [sp, #2]
	strh r2, [r0]
	cmp r3, r1
	movlo r3, r1
	strh r3, [r5]
	b _03804884
_03804864:
	ldr r1, [r7]
	ldr r0, _03804894 ; =_03809E48
	bic r1, r1, #0x1000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03804884
_03804880:
	bl sub_037FDE70
_03804884:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03804890: .word 0xFF000FFF
_03804894: .word _03809E48
_03804898: .word 0x00008A01
_0380489C: .word 0x040001C0
_038048A0: .word 0x00008201
	arm_func_end sub_038046AC

	arm_func_start sub_038048A4
sub_038048A4: ; 0x038048A4
	ldr r0, _038048D8 ; =_03809E4C
	mov r1, #1
	str r1, [r0, #4]
	mov r3, #0
	str r3, [r0, #0x28]
	ldr r0, _038048DC ; =_03809E54
	mov r2, r3
_038048C0:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _038048C0
	bx lr
	.align 2, 0
_038048D8: .word _03809E4C
_038048DC: .word _03809E54
	arm_func_end sub_038048A4

	arm_func_start sub_038048E0
sub_038048E0: ; 0x038048E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _03804910
	ldr r1, _03804A94 ; =_03809E54
	mov r4, #0
	mov r3, r4
_038048FC:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _038048FC
_03804910:
	ldr r1, _03804A94 ; =_03809E54
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _03804A88
	ldr r1, _03804A98 ; =_03809E4C
	ldrh r2, [r1, #8]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x60
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _03804A7C
_03804950: ; jump table
	b _03804970 ; case 0
	b _03804980 ; case 1
	b _03804A7C ; case 2
	b _03804A18 ; case 3
	b _038049B4 ; case 4
	b _038049E8 ; case 5
	b _03804A4C ; case 6
	b _03804A64 ; case 7
_03804970:
	mov r0, #0x60
	mov r1, #0
	bl sub_03803A48
	b _03804A88
_03804980:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl sub_03803B7C
	cmp r0, #0
	bne _03804A88
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804A88
_038049B4:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl sub_03803B7C
	cmp r0, #0
	bne _03804A88
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804A88
_038049E8:
	mov r0, r2, lsl #0x10
	mov r1, r4
	mov r3, r0, lsr #0x10
	mov r0, #3
	mov r2, #1
	bl sub_03803B7C
	cmp r0, #0
	bne _03804A88
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804A88
_03804A18:
	ldrh r0, [r1, #0xa]
	mov r2, r2, lsl #0x18
	mov r1, r4
	orr r3, r0, r2, lsr #8
	mov r0, #3
	mov r2, #1
	bl sub_03803B7C
	cmp r0, #0
	bne _03804A88
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03804A88
_03804A4C:
	and r0, r2, #0xff
	bl sub_0380521C
	mov r0, #0x66
	mov r1, #0
	bl sub_03803A48
	b _03804A88
_03804A64:
	bl sub_03805238
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x67
	bl sub_03803A48
	b _03804A88
_03804A7C:
	mov r0, r4
	mov r1, #1
	bl sub_03803A48
_03804A88:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_03804A94: .word _03809E54
_03804A98: .word _03809E4C
	arm_func_end sub_038048E0

	arm_func_start sub_03804A9C
sub_03804A9C: ; 0x03804A9C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl EnableIrqFlag
	mov r5, r0
	mov r0, #3
	bl sub_03803B0C
	cmp r0, #0
	bne _03804ADC
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	b _03804C00
_03804ADC:
	mov r0, #3
	bl sub_03803B28
	mov r0, r5
	bl SetIrqFlag
	ldr r1, [r4, #4]
	sub r0, r1, #0x61
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03804BE8
_03804B00: ; jump table
	b _03804B18 ; case 0
	b _03804BE8 ; case 1
	b _03804BB4 ; case 2
	b _03804B3C ; case 3
	b _03804B78 ; case 4
	b _03804BDC ; case 5
_03804B18:
	ldr r0, _03804C08 ; =_03809E4C
	mov r1, #1
	str r1, [r0, #0x28]
	ldr r1, [r4, #8]
	strh r1, [r0, #2]
	ldr r1, [r4, #0xc]
	strh r1, [r0]
	bl sub_03804F1C
	b _03804BF8
_03804B3C:
	ldr r2, _03804C08 ; =_03809E4C
	mov r0, #4
	str r0, [r2, #0x28]
	ldr r0, [r4, #8]
	str r0, [r2, #0x30]
	ldr r3, [r4, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r1, r3, #0xff
	str r3, [r2, #0x2c]
	bl sub_03804C50
	mov r0, #0x64
	mov r1, #0
	bl sub_03803A48
	b _03804BF8
_03804B78:
	ldr r1, _03804C08 ; =_03809E4C
	mov r0, #3
	str r0, [r1, #0x28]
	ldr r2, [r4, #8]
	mov r0, r2, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r4
	str r2, [r1, #0x30]
	bl sub_03804CCC
	add r1, r4, #0x70
	mov r2, r1, lsl #0x10
	mov r1, r0
	mov r0, r2, lsr #0x10
	bl sub_03803A48
	b _03804BF8
_03804BB4:
	ldr r1, _03804C08 ; =_03809E4C
	mov r0, #2
	str r0, [r1, #0x28]
	ldr r0, [r4, #8]
	str r0, [r1, #0x2c]
	bl sub_03804D90
	mov r0, #0x63
	mov r1, #0
	bl sub_03803A48
	b _03804BF8
_03804BDC:
	ldr r0, [r4, #8]
	bl sub_03804EB4
	b _03804BF8
_03804BE8:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl sub_03803A48
_03804BF8:
	mov r0, #3
	bl sub_03803B40
_03804C00:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03804C08: .word _03809E4C
	arm_func_end sub_03804A9C

	arm_func_start sub_03804C0C
sub_03804C0C: ; 0x03804C0C
	stmdb sp!, {r4, r5, r6, lr}
	and r1, r1, #0x3f0000
	and r3, r0, #0x3c00000
	mov r1, r1, lsl #0x10
	mov r0, r2, lsl #0x10
	orr r1, r1, r3, lsl #22
	orr r6, r1, r0, lsr #16
	mov r5, #8
	mov r4, #0
_03804C30:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	bne _03804C30
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03804C0C

	arm_func_start sub_03804C50
sub_03804C50: ; 0x03804C50
	stmdb sp!, {r4, lr}
	ldr r2, _03804C9C ; =0x040001C0
	mov r4, r1
_03804C5C:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804C5C
	ldr r1, _03804CA0 ; =0x00008202
	and r0, r0, #0xff
	strh r1, [r2]
	add r1, r1, #0x600
	strh r1, [r2]
	bl sub_03804CA8
	ldr r2, _03804CA4 ; =0x00008002
	ldr r1, _03804C9C ; =0x040001C0
	and r0, r4, #0xff
	strh r2, [r1]
	strh r0, [r1, #2]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03804C9C: .word 0x040001C0
_03804CA0: .word 0x00008202
_03804CA4: .word 0x00008002
	arm_func_end sub_03804C50

	arm_func_start sub_03804CA8
sub_03804CA8: ; 0x03804CA8
	ldr r1, _03804CC8 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03804CB8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804CB8
	bx lr
	.align 2, 0
_03804CC8: .word 0x040001C2
	arm_func_end sub_03804CA8

	arm_func_start sub_03804CCC
sub_03804CCC: ; 0x03804CCC
	stmdb sp!, {r3, lr}
	ldr r2, _03804D30 ; =0x040001C0
_03804CD4:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804CD4
	ldr r1, _03804D34 ; =0x00008202
	orr r0, r0, #0x80
	strh r1, [r2]
	add r1, r1, #0x600
	and r0, r0, #0xff
	strh r1, [r2]
	bl sub_03804CA8
	ldr r2, _03804D38 ; =0x00008002
	ldr r1, _03804D30 ; =0x040001C0
	mov r0, #0
	strh r2, [r1]
	strh r0, [r1, #2]
_03804D10:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804D10
	ldr r0, _03804D3C ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03804D30: .word 0x040001C0
_03804D34: .word 0x00008202
_03804D38: .word 0x00008002
_03804D3C: .word 0x040001C2
	arm_func_end sub_03804CCC

	arm_func_start sub_03804D40
sub_03804D40: ; 0x03804D40
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_03804CCC
	orr r1, r0, r4
	mov r0, #0
	bl sub_03804C50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03804D40

	arm_func_start sub_03804D64
sub_03804D64: ; 0x03804D64
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_03804CCC
	mvn r1, r4
	and r0, r0, r1
	and r1, r0, #0xff
	mov r0, #0
	bl sub_03804C50
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03804D64

	arm_func_start sub_03804D90
sub_03804D90: ; 0x03804D90
	stmdb sp!, {r3, lr}
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _03804EAC
_03804DA0: ; jump table
	b _03804EAC ; case 0
	b _03804DE0 ; case 1
	b _03804DF4 ; case 2
	b _03804E08 ; case 3
	b _03804E1C ; case 4
	b _03804E28 ; case 5
	b _03804E34 ; case 6
	b _03804E40 ; case 7
	b _03804E4C ; case 8
	b _03804E58 ; case 9
	b _03804E64 ; case 10
	b _03804E70 ; case 11
	b _03804E7C ; case 12
	b _03804E88 ; case 13
	b _03804EA0 ; case 14
	b _03804E94 ; case 15
_03804DE0:
	mov r0, #1
	bl sub_0380521C
	mov r0, #1
	bl sub_03804EB4
	b _03804EAC
_03804DF4:
	mov r0, #3
	bl sub_0380521C
	mov r0, #3
	bl sub_03804EB4
	b _03804EAC
_03804E08:
	mov r0, #2
	bl sub_0380521C
	mov r0, #2
	bl sub_03804EB4
	b _03804EAC
_03804E1C:
	mov r0, #4
	bl sub_03804D40
	b _03804EAC
_03804E28:
	mov r0, #4
	bl sub_03804D64
	b _03804EAC
_03804E34:
	mov r0, #8
	bl sub_03804D40
	b _03804EAC
_03804E40:
	mov r0, #8
	bl sub_03804D64
	b _03804EAC
_03804E4C:
	mov r0, #0xc
	bl sub_03804D40
	b _03804EAC
_03804E58:
	mov r0, #0xc
	bl sub_03804D64
	b _03804EAC
_03804E64:
	mov r0, #1
	bl sub_03804D40
	b _03804EAC
_03804E70:
	mov r0, #1
	bl sub_03804D64
	b _03804EAC
_03804E7C:
	mov r0, #2
	bl sub_03804D64
	b _03804EAC
_03804E88:
	mov r0, #2
	bl sub_03804D40
	b _03804EAC
_03804E94:
	mov r0, #0x40
	bl sub_03804D64
	b _03804EAC
_03804EA0:
	bl sub_037FE708
	mov r0, #0x40
	bl sub_03804D40
_03804EAC:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03804D90

	arm_func_start sub_03804EB4
sub_03804EB4: ; 0x03804EB4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #1
	beq _03804ED8
	cmp r4, #2
	beq _03804EF0
	cmp r4, #3
	beq _03804EE4
	b _03804F04
_03804ED8:
	mov r0, #0x10
	bl sub_03804D64
	b _03804F08
_03804EE4:
	mov r0, #0x30
	bl sub_03804D40
	b _03804F08
_03804EF0:
	mov r0, #0x20
	bl sub_03804D64
	mov r0, #0x10
	bl sub_03804D40
	b _03804F08
_03804F04:
	bl sub_037FDE70
_03804F08:
	ldr r0, _03804F18 ; =_0380756C
	str r4, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03804F18: .word _0380756C
	arm_func_end sub_03804EB4

	arm_func_start sub_03804F1C
sub_03804F1C: ; 0x03804F1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _038050D8 ; =0x04000208
	mov r8, #0
	ldrh sb, [r0]
	strh r8, [r0]
	bl EnableIrqFlag
	mov r4, r0
	mvn r0, #0xfe000000
	bl sub_037FB928
	mov r5, r0
	mov r0, r8
	bl sub_03804CCC
	mov r6, r0
	mov r0, #2
	bl sub_0380521C
	mov r0, #2
	bl sub_03804EB4
	mov r0, #2
	bl sub_03804EB4
	bl sub_037FE708
	mov r0, #1
	bl sub_03804D64
	ldr r0, _038050DC ; =_03809E4E
	ldrh r0, [r0]
	tst r0, #1
	beq _03804FA0
	ldr r0, _038050E0 ; =_03809E4C
	ldr r1, _038050E4 ; =0x04000132
	ldrh r2, [r0]
	mov r0, #0x1000
	orr r2, r2, #0x4000
	strh r2, [r1]
	bl sub_037FB8F0
_03804FA0:
	ldr r0, _038050DC ; =_03809E4E
	ldrh r0, [r0]
	tst r0, #4
	beq _03804FB8
	mov r0, #0x400000
	bl sub_037FB8F0
_03804FB8:
	ldr r0, _038050DC ; =_03809E4E
	ldrh r0, [r0]
	tst r0, #2
	beq _03804FFC
	ldr r1, _038050E8 ; =0x04000134
	mov r0, #0x8000
	ldrh r7, [r1]
	mov r8, #1
	bl sub_037FE5A8
	mov r0, #0x40
	mov r1, #0
	bl sub_037FE588
	mov r0, #0x100
	mov r1, r0
	bl sub_037FE588
	mov r0, #0x80
	bl sub_037FB8F0
_03804FFC:
	ldr r0, _038050DC ; =_03809E4E
	ldrh r0, [r0]
	tst r0, #8
	beq _03805014
	mov r0, #0x100000
	bl sub_037FB8F0
_03805014:
	ldr r0, _038050DC ; =_03809E4E
	ldrh r0, [r0]
	tst r0, #0x10
	beq _0380502C
	mov r0, #0x2000
	bl sub_037FB8F0
_0380502C:
	mov r0, r4
	bl SetIrqFlag
	ldr r2, _038050D8 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl sub_038050F0
	mov r1, r6
	mov r0, #0
	bl sub_03804C50
	ldr r0, _038050DC ; =_03809E4E
	ldrh r1, [r0]
	tst r1, #0x20
	movne r0, #6
	moveq r0, #7
	tst r1, #0x40
	movne r6, #4
	moveq r6, #5
	bl sub_03804D90
	mov r0, r6
	bl sub_03804D90
	cmp r8, #0
	ldrne r0, _038050E8 ; =0x04000134
	strneh r7, [r0]
	mov r0, #1
	bl sub_03804D40
	bl sub_037FE760
	mov r1, #0
	ldr r3, _038050EC ; =_03809E54
	mov r2, r1
	mov r0, #0x62
	str r1, [r3, #0x20]
	bl sub_03804C0C
	bl EnableIrqFlag
	mov r0, r5
	bl sub_037FB8A4
	mov r0, r4
	bl SetIrqFlag
	ldr r1, _038050D8 ; =0x04000208
	ldrh r0, [r1]
	strh sb, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_038050D8: .word 0x04000208
_038050DC: .word _03809E4E
_038050E0: .word _03809E4C
_038050E4: .word 0x04000132
_038050E8: .word 0x04000134
_038050EC: .word _03809E54
	arm_func_end sub_03804F1C

	arm_func_start sub_038050F0
sub_038050F0: ; 0x038050F0
	ldr ip, _038050F8 ; =sub_038037D6
	bx ip
	.align 2, 0
_038050F8: .word sub_038037D6 + 1
	arm_func_end sub_038050F0

	arm_func_start sub_038050FC
sub_038050FC: ; 0x038050FC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _03805210 ; =_03809E80
	ldr r3, [r1, #4]
	cmp r3, #0
	bne _03805138
	mov r2, #1
	mov r3, r2
	mov r0, #3
	mov r1, #0x66
	bl sub_03803B7C
	cmp r0, #0
	beq _03805208
	mov r0, #1
	bl sub_0380521C
	b _03805208
_03805138:
	cmp r3, #4
	bge _03805164
	ldr r0, _03805214 ; =_0380756C
	ldr r0, [r0]
	cmp r3, r0
	beq _03805208
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl sub_03803B7C
	b _03805208
_03805164:
	sub r2, r3, #4
	mov r0, #0xc
	mul r4, r2, r0
	ldr r5, _03805218 ; =_03807570
	ldr r0, [r1]
	add r6, r5, r4
	ldrh r1, [r6, #0xa]
	bl sub_03806DD4
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
	ldr r0, _03805210 ; =_03809E80
	mul r1, r2, r1
	ldr r2, [r0]
	moveq r3, #2
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0]
	movhs r1, #0
	strhs r1, [r0]
	ldr r0, _03805214 ; =_0380756C
	ldr r0, [r0]
	cmp r3, r0
	beq _03805208
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl sub_03803B7C
_03805208:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805210: .word _03809E80
_03805214: .word _0380756C
_03805218: .word _03807570
	arm_func_end sub_038050FC

	arm_func_start sub_0380521C
sub_0380521C: ; 0x0380521C
	cmp r0, #0xf
	ldrle r1, _03805234 ; =_03809E80
	movle r2, #0
	strle r0, [r1, #4]
	strle r2, [r1]
	bx lr
	.align 2, 0
_03805234: .word _03809E80
	arm_func_end sub_0380521C

	arm_func_start sub_03805238
sub_03805238: ; 0x03805238
	ldr r0, _03805244 ; =_03809E80
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_03805244: .word _03809E80
	arm_func_end sub_03805238

	arm_func_start sub_03805248
sub_03805248: ; 0x03805248
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r3, _03805284 ; =_03809E88
	mov r1, #0
	ldr r0, _03805288 ; =_03809E98
	mov r2, #0xa4
	stmib r3, {r1, r4}
	bl sub_037FE070
	mov r0, r4
	bl sub_038052BC
	ldr r0, _03805284 ; =_03809E88
	mov r1, #3
	strb r1, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03805284: .word _03809E88
_03805288: .word _03809E98
	arm_func_end sub_03805248

	arm_func_start sub_0380528C
sub_0380528C: ; 0x0380528C
	stmdb sp!, {r3, lr}
	ldr r2, _038052B8 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	bl sub_0380521C
	mov r0, #1
	bl sub_03804EB4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038052B8: .word 0x04000304
	arm_func_end sub_0380528C

	arm_func_start sub_038052BC
sub_038052BC: ; 0x038052BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	str r0, [sp, #0x44]
	ldr r0, _03805354 ; =_0380AAFC
	mov sb, #4
	mov r7, #8
	mov r4, #3
	ldr r1, _03805358 ; =_0380AAFC
	ldr r6, _0380535C ; =_03809F3C
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
	bl sub_027E0000
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03805354: .word _0380AAFC
_03805358: .word _0380AAFC
_0380535C: .word _03809F3C
	arm_func_end sub_038052BC

	arm_func_start sub_03805360
sub_03805360: ; 0x03805360
	ldr r0, _0380539C ; =_0380B1FC
	mov r3, #0
	str r3, [r0, #0x20]
	ldr r0, _038053A0 ; =_0380B1FC
	mov r2, r3
_03805374:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03805374
	ldr r1, _038053A4 ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_0380539C: .word _0380B1FC
_038053A0: .word _0380B1FC
_038053A4: .word 0x0400010E
	arm_func_end sub_03805360

	arm_func_start sub_038053A8
sub_038053A8: ; 0x038053A8
	stmdb sp!, {r4, lr}
	tst r0, #0x2000000
	beq _038053D4
	ldr r1, _03805660 ; =_0380B1FC
	mov r4, #0
	mov r3, r4
_038053C0:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _038053C0
_038053D4:
	ldr r1, _03805660 ; =_0380B1FC
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _03805658
	ldr r1, _03805664 ; =_0380B1FC
	ldrh r2, [r1]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x40
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0380564C
_03805414: ; jump table
	b _03805424 ; case 0
	b _03805460 ; case 1
	b _03805564 ; case 2
	b _038055C8 ; case 3
_03805424:
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #2
	mov r2, #1
	bl sub_03803B7C
	cmp r0, #0
	bne _0380544C
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
_0380544C:
	ldr r0, _03805668 ; =0x027FFF94
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #-4]
	b _03805658
_03805460:
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0380547C
	mov r0, r4
	mov r1, #3
	bl sub_03803A48
	b _03805658
_0380547C:
	and r0, r2, #0xff
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r3, r0, r2, lsl #16
	cmp r3, #0x2000000
	blo _038054A0
	cmp r3, #0x2400000
	blo _038054B0
_038054A0:
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _03805658
_038054B0:
	str r3, [r1, #0x28]
	ldrh r2, [r1, #6]
	ldrh r0, [r1, #8]
	orr r2, r0, r2, lsl #16
	add r0, r3, r2
	cmp r0, #0x2400000
	bls _038054DC
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _03805658
_038054DC:
	str r2, [r1, #0x30]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r2, lsl #16
	bl sub_03805670
	cmp r0, #0
	bne _03805508
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _03805658
_03805508:
	ldr r3, _03805664 ; =_0380B1FC
	mov r2, #0
	str r2, [r3, #0x2c]
	ldrh r0, [r3, #0x24]
	mov r1, r4
	and ip, r0, #7
	mov r0, #2
	strh ip, [r3, #0x26]
	bl sub_03803B7C
	cmp r0, #0
	bne _03805544
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03805658
_03805544:
	ldr r1, _03805668 ; =0x027FFF94
	mov r2, #0
	strh r2, [r1]
	ldr r0, _03805664 ; =_0380B1FC
	str r2, [r1, #-4]
	mov r1, #1
	str r1, [r0, #0x20]
	b _03805658
_03805564:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _03805580
	mov r0, r4
	mov r1, #3
	bl sub_03803A48
	b _03805658
_03805580:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl sub_03803B7C
	cmp r0, #0
	bne _038055A8
	mov r0, r4
	mov r1, #4
	bl sub_03803A48
	b _03805658
_038055A8:
	ldr r0, _03805664 ; =_0380B1FC
	mov r2, #3
	ldr r1, _0380566C ; =0x0400010E
	str r2, [r0, #0x20]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	b _03805658
_038055C8:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _038055E4
	mov r0, r4
	mov r1, #3
	bl sub_03803A48
	b _03805658
_038055E4:
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r0, r0, r2, lsl #16
	bl sub_03805670
	cmp r0, #0
	bne _0380560C
	mov r0, r4
	mov r1, #2
	bl sub_03803A48
	b _03805658
_0380560C:
	bl EnableIrqFlag
	ldr r3, _0380566C ; =0x0400010E
	ldr r1, _03805664 ; =_0380B1FC
	ldrh r2, [r3]
	bic r2, r2, #0x80
	strh r2, [r3]
	ldrh r2, [r1, #0x34]
	strh r2, [r3, #-2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r3]
	bl SetIrqFlag
	mov r0, r4
	mov r1, #0
	bl sub_03803A48
	b _03805658
_0380564C:
	mov r0, r4
	mov r1, #1
	bl sub_03803A48
_03805658:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03805660: .word _0380B1FC
_03805664: .word _0380B1FC
_03805668: .word 0x027FFF94
_0380566C: .word 0x0400010E
	arm_func_end sub_038053A8

	arm_func_start sub_03805670
sub_03805670: ; 0x03805670
	cmp r0, #0x10000
	bhs _03805694
	ldr r1, _03805710 ; =_0380B1FC
	mov r2, #0
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_03805694:
	cmp r0, #0x400000
	bhs _038056BC
	ldr r1, _03805710 ; =_0380B1FC
	mov r3, #1
	mov r0, r0, lsr #6
	rsb r2, r0, #0x10000
	strh r3, [r1, #0x36]
	mov r0, r3
	strh r2, [r1, #0x34]
	bx lr
_038056BC:
	cmp r0, #0x1000000
	bhs _038056E4
	ldr r1, _03805710 ; =_0380B1FC
	mov r2, #2
	mov r0, r0, lsr #8
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_038056E4:
	cmp r0, #0x4000000
	movhs r0, #0
	bxhs lr
	ldr r1, _03805710 ; =_0380B1FC
	mov r2, #3
	mov r0, r0, lsr #0xa
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
	.align 2, 0
_03805710: .word _0380B1FC
	arm_func_end sub_03805670

	arm_func_start sub_03805714
sub_03805714: ; 0x03805714
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r2, [r4, #4]
	cmp r2, #0x40
	beq _0380573C
	cmp r2, #0x41
	beq _038057EC
	cmp r2, #0x42
	beq _03805884
	b _03805920
_0380573C:
	bl EnableIrqFlag
	mov r5, r0
	mov r0, #2
	bl sub_03803B0C
	cmp r0, #0
	bne _03805774
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	b _03805920
_03805774:
	mov r0, #2
	bl sub_03803B28
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #8]
	and r0, r0, #1
	cmp r0, #1
	bne _038057A8
	bl sub_03805C64
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x8000
	b _038057B8
_038057A8:
	bl sub_03805B10
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x80
_038057B8:
	ldr r1, _03805928 ; =0x027FFF94
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strh r0, [r1]
	str r1, [r1, #-4]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	mov r0, #2
	bl sub_03803B40
	b _03805920
_038057EC:
	ldr r0, _0380592C ; =_0380B1FC
	ldr r1, [r0, #0x20]
	cmp r1, #1
	bne _03805870
	mov r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	bl EnableIrqFlag
	mov r5, r0
	mov r0, #0x40
	bl sub_037FB8F0
	ldr r1, _03805930 ; =sub_0380593C
	mov r0, #0x40
	bl sub_03805D98
	bl sub_03805DC0
	ldr r1, _0380592C ; =_0380B1FC
	ldr r2, _03805934 ; =0x0400010C
	ldrh r3, [r1, #0x34]
	mov r0, r5
	strh r3, [r2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r2, #2]
	bl SetIrqFlag
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03803A48
	ldr r0, _0380592C ; =_0380B1FC
	mov r1, #2
	str r1, [r0, #0x20]
	b _03805920
_03805870:
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_03803A48
	b _03805920
_03805884:
	ldr r0, _0380592C ; =_0380B1FC
	ldr r1, [r0, #0x20]
	sub r0, r1, #3
	cmp r0, #1
	bhi _03805900
	ldr r1, _03805938 ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bl EnableIrqFlag
	mov r4, r0
	mov r0, #0x40
	mov r1, #0
	bl sub_03805D98
	bl sub_03805E20
	mov r0, r4
	bl SetIrqFlag
	ldr r0, _0380592C ; =_0380B1FC
	mov r1, #0
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _038058E8
	mov r0, #0x42
	bl sub_03803A48
	b _038058F0
_038058E8:
	mov r0, #0x51
	bl sub_03803A48
_038058F0:
	ldr r0, _0380592C ; =_0380B1FC
	mov r1, #0
	str r1, [r0, #0x20]
	b _03805920
_03805900:
	cmp r1, #3
	mov r1, #3
	bne _03805918
	mov r0, #0x42
	bl sub_03803A48
	b _03805920
_03805918:
	mov r0, #0x51
	bl sub_03803A48
_03805920:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03805928: .word 0x027FFF94
_0380592C: .word _0380B1FC
_03805930: .word sub_0380593C
_03805934: .word 0x0400010C
_03805938: .word 0x0400010E
	arm_func_end sub_03805714

	arm_func_start sub_0380593C
sub_0380593C: ; 0x0380593C
	stmdb sp!, {r3, lr}
	bl sub_03805970
	ldr r3, _03805968 ; =0x0380FFF8
	ldr r0, _0380596C ; =0x04000214
	ldr r2, [r3]
	mov r1, #0x40
	orr r2, r2, #0x40
	str r2, [r3]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805968: .word 0x0380FFF8
_0380596C: .word 0x04000214
	arm_func_end sub_0380593C

	arm_func_start sub_03805970
sub_03805970: ; 0x03805970
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r4, _03805B00 ; =_0380B1FC
	ldrh r5, [r4, #0x26]
	and r0, r5, #4
	cmp r0, #4
	ldrh r6, [r4, #0x38]
	bne _03805990
	b _03805994
_03805990:
	ldrh r7, [r4, #0x3a]
_03805994:
	beq _0380599C
	b _038059A0
_0380599C:
	ldr r7, _03805B04 ; =0x0000FFFF
_038059A0:
	bl sub_03803C5C
	cmp r0, #0
	bne _03805A0C
	mov r0, #2
	bl sub_03803B0C
	cmp r0, #0
	beq _03805A0C
	and r0, r5, #1
	cmp r0, #1
	bne _038059EC
	bl sub_03805C64
	tst r5, #2
	beq _038059D8
	b _038059DC
_038059D8:
	mov r7, r0
_038059DC:
	bne _038059E4
	b _038059E8
_038059E4:
	eor r7, r0, #0x8000
_038059E8:
	b _03805A0C
_038059EC:
	bl sub_03805B10
	tst r5, #2
	beq _038059FC
	b _03805A00
_038059FC:
	mov r7, r0
_03805A00:
	bne _03805A08
	b _03805A0C
_03805A08:
	eor r7, r0, #0x80
_03805A0C:
	and r0, r5, #1
	ldr r3, _03805B08 ; =0x027FFC00
	ldr r1, [r4, #0x2c]
	cmp r0, #1
	bne _03805A3C
	ldr r2, [r4, #0x28]
	strh r7, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r7, [r3]
	add r1, r1, #2
	b _03805A74
_03805A3C:
	and r7, r7, #0xff
	tst r1, #1
	bne _03805A54
	mov r6, r7
	add r1, r1, #1
	b _03805A74
_03805A54:
	orr r0, r6, r7, lsl #8
	ldr r2, [r4, #0x28]
	sub r1, r1, #1
	strh r0, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r0, [r3]
	add r1, r1, #2
_03805A74:
	strh r6, [r4, #0x38]
	strh r7, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bhs _03805A8C
	b _03805A90
_03805A8C:
	mov r1, #0
_03805A90:
	str r1, [r4, #0x2c]
	blo _03805AF8
	ldrh r0, [r4, #0x24]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _03805AB8
	mov r0, #0x51
	mov r1, #0
	bl sub_03803A48
	b _03805AF8
_03805AB8:
	mov r0, #2
	mov r1, #0x42
	mov r2, #0
	bl sub_03803B7C
	cmp r0, #0
	bne _03805AE0
	mov r0, #0x51
	mov r1, #4
	bl sub_03803A48
	b _03805AF8
_03805AE0:
	mov r0, #4
	str r0, [r4, #0x20]
	ldr r1, _03805B0C ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_03805AF8:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03805B00: .word _0380B1FC
_03805B04: .word 0x0000FFFF
_03805B08: .word 0x027FFC00
_03805B0C: .word 0x0400010E
	arm_func_end sub_03805970

	arm_func_start sub_03805B10
sub_03805B10: ; 0x03805B10
	stmdb sp!, {r4, lr}
	ldr r2, _03805C1C ; =0x040001C0
_03805B18:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03805B18
	ldr r1, _03805C20 ; =0x00008A01
	ldr r0, _03805C24 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xec
	strh r1, [r0]
	sub r1, r0, #2
_03805B3C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03805B3C
	bl sub_03805C34
	ldr r2, _03805C28 ; =0x00008201
	ldr r1, _03805C1C ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl sub_03805C34
	ldr r2, _03805C2C ; =_0380B238
	ldr r1, _03805C30 ; =0x00007F80
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
	blo _03805BEC
	ldrsb r4, [r2]
	mov r0, r3, lsr #0xc
	sub r0, r0, #0x80
	mov r0, r0, lsl #0x18
	cmp r4, r0, asr #24
	mov r0, r0, asr #0x18
	cmplt r4, #0xc
	addlt r0, r4, #1
	strltb r0, [r2]
	blt _03805BDC
	cmp r0, r4
	bge _03805BDC
	mvn r0, #0xb
	cmp r4, r0
	ldrgt r0, _03805C2C ; =_0380B238
	ldrgtsb r2, [r0]
	subgt r2, r2, #1
	strgtb r2, [r0]
_03805BDC:
	ldr r0, _03805C2C ; =_0380B238
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
_03805BEC:
	ldr r0, _03805C2C ; =_0380B238
	ldrsb r0, [r0]
	rsb r0, r0, r1, lsr #16
	cmp r0, #0xff
	movgt r0, #0xff
	bgt _03805C0C
	cmp r0, #0
	movlt r0, #0
_03805C0C:
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03805C1C: .word 0x040001C0
_03805C20: .word 0x00008A01
_03805C24: .word 0x040001C2
_03805C28: .word 0x00008201
_03805C2C: .word _0380B238
_03805C30: .word 0x00007F80
	arm_func_end sub_03805B10

	arm_func_start sub_03805C34
sub_03805C34: ; 0x03805C34
	ldr r0, _03805C60 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03805C44:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03805C44
	ldr r0, _03805C60 ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_03805C60: .word 0x040001C2
	arm_func_end sub_03805C34

	arm_func_start sub_03805C64
sub_03805C64: ; 0x03805C64
	stmdb sp!, {r4, lr}
	ldr r2, _03805D7C ; =0x040001C0
_03805C6C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03805C6C
	ldr r1, _03805D80 ; =0x00008A01
	ldr r0, _03805D84 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xe4
	strh r1, [r0]
	sub r1, r0, #2
_03805C90:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03805C90
	bl sub_03805C34
	ldr r2, _03805D88 ; =0x00008201
	ldr r1, _03805D7C ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl sub_03805C34
	ldr r3, _03805D8C ; =_0380B238
	ldr r1, _03805D90 ; =0x00007FF8
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
	blo _03805D48
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
	blt _03805D38
	cmp r1, r4
	bge _03805D38
	mov r0, #0xc00
	rsb r0, r0, #0
	cmp r4, r0
	ldrgt r0, _03805D8C ; =_0380B238
	ldrgtsh r1, [r0, #2]
	subgt r1, r1, #0x10
	strgth r1, [r0, #2]
_03805D38:
	ldr r0, _03805D8C ; =_0380B238
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_03805D48:
	ldr r1, _03805D8C ; =_0380B238
	ldr r0, _03805D94 ; =0x0000FFF0
	ldrsh r1, [r1, #2]
	rsb r1, r1, r2, lsr #16
	cmp r1, r0
	movgt r1, r0
	bgt _03805D6C
	cmp r1, #0
	movlt r1, #0
_03805D6C:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03805D7C: .word 0x040001C0
_03805D80: .word 0x00008A01
_03805D84: .word 0x040001C2
_03805D88: .word 0x00008201
_03805D8C: .word _0380B238
_03805D90: .word 0x00007FF8
_03805D94: .word 0x0000FFF0
	arm_func_end sub_03805C64

	arm_func_start sub_03805D98
sub_03805D98: ; 0x03805D98
	ldr r2, _03805DBC ; =_038074F4
	mov r3, #0
_03805DA0:
	tst r0, #1
	strne r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x19
	mov r0, r0, lsr #1
	blt _03805DA0
	bx lr
	.align 2, 0
_03805DBC: .word _038074F4
	arm_func_end sub_03805D98

	arm_func_start sub_03805DC0
sub_03805DC0: ; 0x03805DC0
	stmdb sp!, {r3, lr}
	ldr r3, _03805E14 ; =0x0380FFFC
	ldr r0, _03805E18 ; =sub_03805E64
	ldr r2, [r3]
	cmp r2, r0
	beq _03805E0C
	ldr r0, _03805E1C ; =_0380B24C
	mov r1, #0
	str r1, [r0]
	sub r1, r3, #0x17c
	str r1, [r0, #4]
	mov r1, #0x40
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bl EnableIrqFlag
	ldr r2, _03805E18 ; =sub_03805E64
	ldr r1, _03805E14 ; =0x0380FFFC
	str r2, [r1]
	bl SetIrqFlag
_03805E0C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805E14: .word 0x0380FFFC
_03805E18: .word sub_03805E64
_03805E1C: .word _0380B24C
	arm_func_end sub_03805DC0

	arm_func_start sub_03805E20
sub_03805E20: ; 0x03805E20
	stmdb sp!, {r3, lr}
	ldr r1, _03805E58 ; =0x0380FFFC
	ldr r0, _03805E5C ; =sub_03805E64
	ldr r1, [r1]
	cmp r1, r0
	bne _03805E50
	bl EnableIrqFlag
	ldr r1, _03805E60 ; =_0380B24C
	ldr r2, _03805E58 ; =0x0380FFFC
	ldr r1, [r1, #0xc]
	str r1, [r2]
	bl SetIrqFlag
_03805E50:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805E58: .word 0x0380FFFC
_03805E5C: .word sub_03805E64
_03805E60: .word _0380B24C
	arm_func_end sub_03805E20

	arm_func_start sub_03805E64
sub_03805E64: ; 0x03805E64
	mov ip, #0x4000000
	add r1, ip, #0x208
	ldrh r0, [r1]
	tst r0, r0
	beq _03805E7C
	b _03805E80
_03805E7C:
	bx lr
_03805E80:
	ldr r3, [ip, #0x210]
	ldr r1, [ip, #0x214]
	ands r2, r1, r3
	beq _03805E94
	b _03805E98
_03805E94:
	bx lr
_03805E98:
	ldr r0, _03806080 ; =0x01DF3FFF
	tst r2, r0
	beq _03805EA8
	b _03805EAC
_03805EA8:
	str r2, [ip, #0x214]
_03805EAC:
	beq _03805EB4
	b _03805EB8
_03805EB4:
	bx lr
_03805EB8:
	stmdb sp!, {lr}
	mrs r0, spsr
	stmdb sp!, {r0}
	stmdb sp, {sp, lr} ^
	sub sp, sp, #8
	mov r0, #0x9f
	msr cpsr_c, r0
	ldr r1, _03806084 ; =_038076A4
	ldrh r0, [r1, #2]
	add r0, r0, #1
	strh r0, [r1, #2]
	ldr r1, _03806088 ; =_0380B24C
	cmp r0, #1
	beq _03805EF4
	b _03805EF8
_03805EF4:
	mov r0, sp
_03805EF8:
	beq _03805F00
	b _03805F04
_03805F00:
	ldr sp, [r1, #4]
_03805F04:
	beq _03805F0C
	b _03805F10
_03805F0C:
	str r0, [r1, #4]
_03805F10:
	stmdb sp!, {r3}
	ldr r1, _0380608C ; =_03807210
	ldr r0, [r1]
	tst r0, r2
	bne _03805F28
	b _03805F2C
_03805F28:
	str r0, [ip, #0x214]
_03805F2C:
	bne _03805F34
	b _03805F38
_03805F34:
	ldr r0, [r1, #4]
_03805F38:
	bne _03805F40
	b _03805F44
_03805F40:
	ldr r3, _03806090 ; =_038074F4
_03805F44:
	bne _03805F4C
	b _03805F50
_03805F4C:
	ldr r0, [r3, r0, lsl #2]
_03805F50:
	bne _03805FC0
	mov r3, #1
_03805F58:
	ldr r0, [r1, r3, lsl #3]
	tst r0, r2
	beq _03805F68
	b _03805F6C
_03805F68:
	add r3, r3, #1
_03805F6C:
	beq _03805F58
	str r0, [ip, #0x214]
	add r0, r1, r3, lsl #3
	ldr r2, [r0, #4]
	ldr r3, _03806090 ; =_038074F4
	ldr r0, [r3, r2, lsl #2]
	ldr r2, _03806084 ; =_038076A4
	ldrh r3, [r2, #2]
	cmp r3, #1
	beq _03805F98
	b _03805F9C
_03805F98:
	ldr r2, [r1]
_03805F9C:
	beq _03805FA4
	b _03805FA8
_03805FA4:
	str r2, [ip, #0x210]
_03805FA8:
	beq _03805FB0
	b _03805FB4
_03805FB0:
	mov r2, #0x1f
_03805FB4:
	beq _03805FBC
	b _03805FC0
_03805FBC:
	msr cpsr_c, r2
_03805FC0:
	ldr r1, [ip, #0x210]
	stmdb sp!, {r1}
	add lr, pc, #0x0 ; =sub_03805FD0
	bx r0
	arm_func_end sub_03805E64

	arm_func_start sub_03805FD0
sub_03805FD0: ; 0x03805FD0
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
	ldr r2, _03806084 ; =_038076A4
	ldr r3, _03806088 ; =_0380B24C
	ldrh r0, [r2, #2]
	subs r1, r0, #1
	strh r1, [r2, #2]
	beq _0380601C
	b _03806020
_0380601C:
	mov r0, sp
_03806020:
	beq _03806028
	b _0380602C
_03806028:
	ldr sp, [r3, #4]
_0380602C:
	beq _03806034
	b _03806038
_03806034:
	str r0, [r3, #4]
_03806038:
	mov r0, #0x92
	msr cpsr_c, r0
	ldmia sp, {sp, lr} ^
	mov r0, r0
	add sp, sp, #8
	ldmia sp!, {r0}
	msr spsr_fc, r0
	tst r1, r1
	beq _03806060
	b _03806064
_03806060:
	ldr r0, _03806094 ; =sub_037FB4F4
_03806064:
	beq _0380606C
	b _03806070
_0380606C:
	add lr, pc, #0x0 ; =0x0200E25C
_03806070:
	beq _03806078
	b _0380607C
_03806078:
	bx r0
_0380607C:
	ldmia sp!, {pc}
	.align 2, 0
_03806080: .word 0x01DF3FFF
_03806084: .word _038076A4
_03806088: .word _0380B24C
_0380608C: .word _03807210
_03806090: .word _038074F4
	arm_func_end sub_03805FD0
_03806094: .word sub_037FB4F4

	arm_func_start sub_03806098
sub_03806098: ; 0x03806098
	stmdb sp!, {r3, lr}
	ldr r1, _038060C8 ; =_0380B260
	mov r3, #0
	ldr r2, _038060CC ; =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl sub_038060D4
	bl sub_037FBBFC
	ldr r1, _038060D0 ; =_0380B25C
	strh r0, [r1, #6]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038060C8: .word _0380B260
_038060CC: .word 0x05000001
_038060D0: .word _0380B25C
	arm_func_end sub_03806098

	arm_func_start sub_038060D4
sub_038060D4: ; 0x038060D4
	ldr ip, _038060DC ; =sub_038037F8
	bx ip
	.align 2, 0
_038060DC: .word sub_038037F8 + 1
	arm_func_end sub_038060D4

	arm_func_start sub_038060E0
sub_038060E0: ; 0x038060E0
	stmdb sp!, {r3, lr}
	ldr r2, _03806128 ; =0x027FFC30
	ldr r0, _0380612C ; =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	beq _03806120
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _03806110
	bl sub_03806130
_03806110:
	ldr r0, _03806128 ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
_03806120:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03806128: .word 0x027FFC30
_0380612C: .word 0x0000FFFF
	arm_func_end sub_038060E0

	arm_func_start sub_03806130
sub_03806130: ; 0x03806130
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _03806248 ; =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	moveq r0, #0
	beq _0380623C
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	moveq r0, #0
	beq _0380623C
	ldr r0, _0380624C ; =_0380B25C
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_038062D0
	cmp r0, #0
	bne _03806194
	ldr r0, [sp, #0xc]
	bl SetIrqFlag
	mov r0, r4
	b _0380623C
_03806194:
	add r0, sp, #0
	bl sub_03806254
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _038061C0
	ldr r1, _03806248 ; =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _03806204
_038061C0:
	cmp r2, #0x96
	ldrne r1, _03806248 ; =0x027FFC30
	ldrne r0, _03806250 ; =0x0801FFFE
	ldrneh r1, [r1]
	ldrneh r0, [r0]
	cmpne r1, r0
	bne _03806204
	ldr r2, _03806248 ; =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _03806218
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _03806218
_03806204:
	ldr r1, _03806248 ; =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_03806218:
	ldr r0, [sp]
	bl sub_03806298
	ldr r0, [sp, #4]
	bl sub_038062B4
	ldr r0, _0380624C ; =_0380B25C
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_03806320
	mov r0, r4
_0380623C:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03806248: .word 0x027FFC30
_0380624C: .word _0380B25C
_03806250: .word 0x0801FFFE
	arm_func_end sub_03806130

	arm_func_start sub_03806254
sub_03806254: ; 0x03806254
	stmdb sp!, {r3, lr}
	ldr r2, _03806294 ; =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	mov r1, r1, asr #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	mov r1, r1, asr #4
	str r1, [r0, #4]
	mov r0, #3
	bl sub_03806298
	mov r0, #0
	bl sub_038062B4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03806294: .word 0x04000204
	arm_func_end sub_03806254

	arm_func_start sub_03806298
sub_03806298: ; 0x03806298
	ldr r2, _038062B0 ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0xc
	orr r0, r1, r0, lsl #2
	strh r0, [r2]
	bx lr
	.align 2, 0
_038062B0: .word 0x04000204
	arm_func_end sub_03806298

	arm_func_start sub_038062B4
sub_038062B4: ; 0x038062B4
	ldr r2, _038062CC ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0x10
	orr r0, r1, r0, lsl #4
	strh r0, [r2]
	bx lr
	.align 2, 0
_038062CC: .word 0x04000204
	arm_func_end sub_038062B4

	arm_func_start sub_038062D0
sub_038062D0: ; 0x038062D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl EnableIrqFlag
	str r0, [r4, #4]
	ldr r0, _0380631C ; =0x027FFFE8
	bl sub_037FBBF4
	ands r0, r0, #0x80
	str r0, [r4]
	bne _03806308
	mov r0, r5
	bl sub_037FBB84
	cmp r0, #0
	bne _03806310
_03806308:
	mov r0, #1
	b _03806314
_03806310:
	mov r0, #0
_03806314:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380631C: .word 0x027FFFE8
	arm_func_end sub_038062D0

	arm_func_start sub_03806320
sub_03806320: ; 0x03806320
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _03806338
	bl sub_037FBB78
_03806338:
	ldr r0, [r4, #4]
	bl SetIrqFlag
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03806320

	arm_func_start sub_03806348
sub_03806348: ; 0x03806348
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
	b _03806368
_03806360:
	mov r0, r6
	bl sub_037FBA0C
_03806368:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	bne _03806360
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_03806348

	arm_func_start sub_03806388
sub_03806388: ; 0x03806388
	stmdb sp!, {r3, lr}
	bl sub_037FD128
	bl sub_037FD34C
	ldr r0, _03806410 ; =_0380B294
	bl sub_037FD3A0
	ldr r0, _03806414 ; =_0380B264
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _03806408
	mov r1, #1
	str r1, [r0, #0x14]
	bl sub_03806098
	bl sub_037FBBFC
	mvn r1, #2
	cmp r0, r1
	beq _03806408
	ldr r1, _03806414 ; =_0380B264
	strh r0, [r1]
	bl sub_037FE2B4
	ldr r1, _03806418 ; =sub_0380659C
	mov r0, #0xd
	bl sub_037FE39C
	bl sub_03806428
	ldr r1, _0380641C ; =sub_038065CC
	mov r0, #0xd
	bl sub_037FE39C
	ldr r1, _03806420 ; =sub_03806600
	mov r0, #0x10
	bl sub_037FE39C
	ldr r1, _03806424 ; =sub_03806944
	mov r0, #0x11
	bl sub_037FE39C
_03806408:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03806410: .word _0380B294
_03806414: .word _0380B264
_03806418: .word sub_0380659C
_0380641C: .word sub_038065CC
_03806420: .word sub_03806600
_03806424: .word sub_03806944
	arm_func_end sub_03806388

	arm_func_start sub_03806428
sub_03806428: ; 0x03806428
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _03806584 ; =_0380B264
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0380657C
	ldr r1, _03806588 ; =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0, #8]
	tst r1, #1
	beq _0380657C
	mov r0, #0x40000
	bl sub_037FB8A4
	ldr r2, _0380658C ; =0x04000208
	mov r1, #1
	ldrh sb, [r2]
	ldr r5, _03806584 ; =_0380B264
	mov r4, r0
	strh r1, [r2]
	mov r6, #0x100
	b _03806484
_0380647C:
	mov r0, r6
	bl sub_037FBA0C
_03806484:
	ldr r0, [r5, #0x28]
	cmp r0, #1
	bne _0380647C
	ldr r0, _03806584 ; =_0380B264
	mov r1, #0x8000000
	ldr r2, [r0, #0x18]
	ldr r0, _03806590 ; =0x01FFFFC0
	add r8, r1, #4
	and r0, r2, r0
	mov r0, r0, lsr #6
	mov r0, r0, lsl #5
	add r5, r0, #0x2000000
	mov r6, #1
	bl sub_037FBBFC
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r0, r7
	bl sub_037FBB08
	ldr ip, _03806594 ; =0x0000FFFF
	mov sl, #0
	eor r0, ip, #3
	eor r1, ip, #0x84
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r3, r1, lsr #0x10
	b _0380652C
_038064F0:
	mov lr, ip
	cmp sl, #0x4c
	moveq lr, r3
	beq _03806508
	cmp sl, #0x4d
	moveq lr, r2
_03806508:
	add r0, r5, sl, lsl #1
	mov r1, sl, lsl #1
	ldrh r0, [r0, #4]
	ldrh r1, [r8, r1]
	and r0, lr, r0
	cmp r0, r1
	movne r6, #0
	bne _03806534
	add sl, sl, #1
_0380652C:
	cmp sl, #0x4e
	blt _038064F0
_03806534:
	mov r0, r7
	bl sub_037FBB78
	mov r0, r7
	bl sub_037FBCA4
	ldr r2, _03806598 ; =0x027FFC30
	and r0, r6, #0xff
	ldrb r1, [r2, #5]
	and r0, r0, #1
	bic r1, r1, #1
	orr r1, r1, r0
	mov r0, #1
	strb r1, [r2, #5]
	bl sub_03806348
	ldr r2, _0380658C ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh sb, [r2]
	bl sub_037FB8A4
_0380657C:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03806584: .word _0380B264
_03806588: .word 0x04000300
_0380658C: .word 0x04000208
_03806590: .word 0x01FFFFC0
_03806594: .word 0x0000FFFF
_03806598: .word 0x027FFC30
	arm_func_end sub_03806428

	arm_func_start sub_0380659C
sub_0380659C: ; 0x0380659C
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	ldreq r0, _038065C8 ; =_0380B264
	moveq r2, #1
	streq r1, [r0, #0x18]
	streq r2, [r0, #0x28]
	beq _038065C0
	bl sub_037FDE70
_038065C0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038065C8: .word _0380B264
	arm_func_end sub_0380659C

	arm_func_start sub_038065CC
sub_038065CC: ; 0x038065CC
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #2
	bne _038065F4
	mov r0, #0
	bl sub_03806610
	bl sub_037FE708
	bl sub_0380528C
	bl sub_037FDE70
	b _038065F8
_038065F4:
	bl sub_037FDE70
_038065F8:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_038065CC

	arm_func_start sub_03806600
sub_03806600: ; 0x03806600
	ldr ip, _0380660C ; =sub_03806610
	mov r0, r1
	bx ip
	.align 2, 0
_0380660C: .word sub_03806610
	arm_func_end sub_03806600

	arm_func_start sub_03806610
sub_03806610: ; 0x03806610
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r5, r0
	beq _0380664C
	ldr r0, [r5]
	cmp r0, #0
	bne _0380664C
	ldr r0, [r5, #0x44]
	add r0, r0, #1
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x40]
	cmp r1, #0
	beq _0380664C
	ldr r0, [r5, #0x44]
	cmp r0, r1
	movhi r5, #0
_0380664C:
	cmp r5, #0
	ldrne r0, [r5, #0x3c]
	cmpne r0, #0
	bne _038066F0
	bl EnableIrqFlag
	ldr r4, _0380682C ; =_0380B264
	mov sb, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _038066DC
	mov sl, #0
	ldr r7, _03806830 ; =0x027FFFE8
	ldr r5, _03806834 ; =0x08001000
	mov r6, sl
	mov fp, #1
	b _038066D4
_0380668C:
	mov r0, r7
	bl sub_037FBBF4
	ands r8, r0, #0x80
	bne _038066AC
	ldrh r0, [r4]
	bl sub_037FBB84
	cmp r0, #0
	bne _038066CC
_038066AC:
	str r6, [r4, #4]
	mov sl, fp
	strh r6, [r5]
	cmp r8, #0
	bne _038066D4
	ldrh r0, [r4]
	bl sub_037FBB58
	b _038066D4
_038066CC:
	ldr r0, _03806838 ; =0x000080E8
	bl sub_037FDD64
_038066D4:
	cmp sl, #0
	beq _0380668C
_038066DC:
	ldr r0, _0380683C ; =_0380B294
	bl sub_037FD5C0
	mov r0, sb
	bl SetIrqFlag
	b _03806824
_038066F0:
	cmp r5, #0
	beq _03806824
	ldr r0, _03806830 ; =0x027FFFE8
	bl sub_037FBBF4
	ands r4, r0, #0x80
	bne _0380671C
	ldr r0, _0380682C ; =_0380B264
	ldrh r0, [r0]
	bl sub_037FBB84
	cmp r0, #0
	bne _0380680C
_0380671C:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _03806764
	ldr r0, _0380682C ; =_0380B264
	mov r2, #0
	ldr r1, _03806834 ; =0x08001000
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5, #8]
	ldr r0, _0380683C ; =_0380B294
	ldr r3, _03806840 ; =sub_03806610
	mov r2, #0
	bl sub_037FD4DC
	mov r0, #0
	str r0, [r5]
	b _038067F4
_03806764:
	tst r1, #1
	ldr r1, _03806834 ; =0x08001000
	beq _038067B4
	ldr r0, _0380682C ; =_0380B264
	mov r2, #0
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _0380683C ; =_0380B294
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0x24]
	ldr r3, _03806840 ; =sub_03806610
	mov r2, #0
	bl sub_037FD4DC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _038067F4
_038067B4:
	ldr r0, _0380682C ; =_0380B264
	mov r2, #2
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _0380683C ; =_0380B294
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0xc]
	ldr r3, _03806840 ; =sub_03806610
	mov r2, #0
	bl sub_037FD4DC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_038067F4:
	cmp r4, #0
	bne _03806824
	ldr r0, _0380682C ; =_0380B264
	ldrh r0, [r0]
	bl sub_037FBB58
	b _03806824
_0380680C:
	ldr r0, _0380683C ; =_0380B294
	ldr r1, _03806844 ; =0x0000020B
	ldr r3, _03806840 ; =sub_03806610
	mov r2, #0
	str r5, [sp]
	bl sub_037FD4DC
_03806824:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0380682C: .word _0380B264
_03806830: .word 0x027FFFE8
_03806834: .word 0x08001000
_03806838: .word 0x000080E8
_0380683C: .word _0380B294
_03806840: .word sub_03806610
_03806844: .word 0x0000020B
	arm_func_end sub_03806610

	arm_func_start sub_03806848
sub_03806848: ; 0x03806848
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _03806938 ; =_03807600
	mvn r0, #0
	ldr r3, [r1, #4]
	cmp r3, r0
	ldreq r0, _0380693C ; =0x027FFC3C
	ldreq r0, [r0]
	addeq r0, r0, #0xa
	streq r0, [r1, #4]
	beq _03806930
	ldr r0, _03806940 ; =_0380B264
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _03806930
	ldr r2, _0380693C ; =0x027FFC3C
	ldr r0, [r2]
	cmp r0, r3
	blo _03806930
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1, #4]
	bl sub_038060E0
	ldr r1, _03806940 ; =_0380B264
	str r0, [r1, #0xc]
	bl sub_03806130
	cmp r0, #0
	bne _038068E0
	ldr r0, _03806938 ; =_03807600
	mov r1, #1
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, _03806940 ; =_0380B264
	strne r1, [r0, #0x10]
	bne _03806930
	ldr r0, _03806940 ; =_0380B264
	str r1, [r0, #0xc]
_038068E0:
	ldr r0, _03806940 ; =_0380B264
	ldr r1, _03806938 ; =_03807600
	ldr r0, [r0, #0xc]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _03806930
	mov r7, #0x64
	mov r6, #0xd
	mov r5, #0x11
	mov r4, r2
	b _03806918
_03806910:
	mov r0, r7
	bl sub_037FC468
_03806918:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	bne _03806910
_03806930:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03806938: .word _03807600
_0380693C: .word 0x027FFC3C
_03806940: .word _0380B264
	arm_func_end sub_03806848

	arm_func_start sub_03806944
sub_03806944: ; 0x03806944
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	and r0, r1, #0x3f
	cmp r0, #3
	bne _038069AC
	ldr r3, _038069B8 ; =0x04000204
	ldr r0, _038069BC ; =0x01FFFFC0
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
	b _03806990
_03806988:
	mov r0, r7
	bl sub_037FBA0C
_03806990:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	bne _03806988
	b _038069B0
_038069AC:
	bl sub_037FDE70
_038069B0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_038069B8: .word 0x04000204
_038069BC: .word 0x01FFFFC0
	arm_func_end sub_03806944

	arm_func_start sub_038069C0
sub_038069C0: ; 0x038069C0
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _038069E0
	arm_func_end sub_038069C0

	arm_func_start sub_038069D0
sub_038069D0: ; 0x038069D0
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_038069E0:
	orrs r5, r3, r2
	bne _038069F0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038069F0:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _03806A24
	mov r1, r2
	bl sub_03806BC8
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806A24:
	cmp r1, #0
	bge _03806A34
	rsbs r0, r0, #0
	rsc r1, r1, #0
_03806A34:
	cmp r3, #0
	bge _03806A44
	rsbs r2, r2, #0
	rsc r3, r3, #0
_03806A44:
	orrs r5, r1, r0
	beq _03806B68
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _03806A70
_03806A5C:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _03806A5C
	add r6, r6, r5
_03806A70:
	cmp r1, #0
	blt _03806A90
_03806A78:
	cmp r6, #1
	beq _03806A90
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _03806A78
_03806A90:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _03806AB8
_03806AA0:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _03806B10
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_03806AB8:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806AA0
_03806AD4:
	subs r6, r6, #1
	beq _03806B08
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806AA0
	b _03806AD4
_03806B08:
	adds r0, r0, r2
	adc r1, r1, r3
_03806B10:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _03806B48
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _03806B6C
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _03806B48
_03806B40:
	mov r0, r1, lsr r7
	mov r1, #0
_03806B48:
	cmp r4, #0
	blt _03806B58
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806B58:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806B68:
	mov r0, #0
_03806B6C:
	mov r1, #0
	cmp r4, #0
	blt _03806B58
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end sub_038069D0

	arm_func_start sub_03806B80
sub_03806B80: ; 0x03806B80
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _03806B94
_03806B8C:
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_03806B94:
	orrs r5, r3, r2
	bne _03806BA4
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806BA4:
	orrs r5, r1, r3
	bne _03806A44
	mov r1, r2
	bl sub_03806DDC
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end sub_03806B80

	arm_func_start sub_03806BC8
sub_03806BC8: ; 0x03806BC8
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _03806DC0
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _03806DC0
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
_03806DC0:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr
	arm_func_end sub_03806BC8

	arm_func_start sub_03806DD4
sub_03806DD4: ; 0x03806DD4
	cmp r1, #0
	bxeq lr
	arm_func_end sub_03806DD4

	arm_func_start sub_03806DDC
sub_03806DDC: ; 0x03806DDC
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
	arm_func_end sub_03806DDC

_03806FB8:
	.byte 0x00, 0x06, 0x0C, 0x13, 0x19, 0x1F, 0x25, 0x2B, 0x31, 0x36, 0x3C, 0x41, 0x47, 0x4C, 0x51, 0x55
	.byte 0x5A, 0x5E, 0x62, 0x66, 0x6A, 0x6D, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7B, 0x7D, 0x7E, 0x7E, 0x7F
	.byte 0x7F, 0x00, 0x00, 0x00
	.global _03806FDC
_03806FDC:
	.byte 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD
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
	.byte 0xFF, 0xFF, 0x00, 0x00
	.global _038071DC
_038071DC:
	.byte 0x00, 0x01, 0x02, 0x04
	.global _038071E0
_038071E0:
	.byte 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x0E, 0x0C, 0x0F, 0x0D
	.global _038071F0
_038071F0:
	.byte 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F
	.byte 0x49, 0x54, 0x5C, 0x64, 0x6D, 0x74, 0x7B, 0x7F, 0x84, 0x89, 0x8F, 0x00
	.global _03807204
_03807204:
	.byte 0x06, 0x00, 0x00, 0x00
	.global _03807208
_03807208:
	.byte 0xC7, 0x00, 0x00, 0x00
	.global _0380720C
_0380720C:
	.byte 0x05, 0x00, 0x00, 0x00
	.global _03807210
_03807210:
	.byte 0x40, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
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

	arm_func_start sub_038072C0
sub_038072C0: ; 0x038072C0
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _03807328 ; =0x0380FFFC
	mov r0, #0
	str r0, [r1]
	ldr r1, _0380732C ; =0x04000180
	mov r0, #0x100
	strh r0, [r1]
_038072E0:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _038072E0
	ldr r1, _0380732C ; =0x04000180
	mov r0, #0
	strh r0, [r1]
_038072FC:
	ldrh r0, [r1]
	cmp r0, #1
	beq _038072FC
	ldr r3, _03807330 ; =0x027FFE00
	ldr ip, [r3, #0x34]
	mov lr, ip
	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	bx ip
	.align 2, 0
_03807328: .word 0x0380FFFC
_0380732C: .word 0x04000180
_03807330: .word 0x027FFE00
	arm_func_end sub_038072C0

	arm_func_start sub_03807334
sub_03807334: ; 0x03807334
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #0x100
	mov r5, #0xa
	mov r4, #0
	b _03807354
_0380734C:
	mov r0, r6
	bl sub_037FBA0C
_03807354:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl sub_037FE410
	cmp r0, #0
	blt _0380734C
	ldr r0, _0380737C ; =_027F8DA0
	bl sub_037FC90C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0380737C: .word _027F8DA0
	arm_func_end sub_03807334

	arm_func_start sub_03807380
sub_03807380: ; 0x03807380
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _038073C8 ; =_027F8DA0
	bl sub_037FC888
	ldr r4, _038073CC ; =0x027FFF96
	mov r5, #0x100
	b _038073A0
_03807398:
	mov r0, r5
	bl sub_037FBA0C
_038073A0:
	ldrh r1, [r4]
	tst r1, #1
	bne _03807398
	ldr r0, _038073D0 ; =_027F8878
	orr r1, r1, #1
	strh r1, [r4]
	ldr r0, [r0, #0x54c]
	ldr r0, [r0, #8]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038073C8: .word _027F8DA0
_038073CC: .word 0x027FFF96
_038073D0: .word _027F8878
	arm_func_end sub_03807380

	arm_func_start sub_038073D4
sub_038073D4: ; 0x038073D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _038074DC ; =0x00001FFF
	and r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r2, r0, lsr #0x10
	moveq r0, #0
	beq _038074D4
	mov r1, #0
	mov r0, #1
	b _03807408
_038073FC:
	tst r2, r0, lsl r1
	bne _03807410
	add r1, r1, #1
_03807408:
	cmp r1, #0x10
	blt _038073FC
_03807410:
	mov r0, #0xf
	mov r3, #1
	b _03807428
_0380741C:
	tst r2, r3, lsl r0
	bne _03807430
	sub r0, r0, #1
_03807428:
	cmp r0, #0
	bne _0380741C
_03807430:
	sub r6, r0, r1
	cmp r6, #5
	movlt r0, #1
	movlt r0, r0, lsl r1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _038074D4
	add r3, r0, r1
	add r3, r3, r3, lsr #31
	mov r4, r3, asr #1
	mov r5, #0
	mov lr, #1
	b _03807488
_03807464:
	mov ip, r5, lsr #0x1f
	rsb r3, ip, r5, lsl #31
	add r3, ip, r3, ror #31
	mov r3, r3, lsl #1
	sub r3, r3, #1
	mla r4, r5, r3, r4
	tst r2, lr, lsl r4
	bne _03807490
	add r5, r5, #1
_03807488:
	cmp r5, r6
	blt _03807464
_03807490:
	sub r2, r0, r4
	cmp r2, #5
	subge r2, r4, r1
	cmpge r2, #5
	bge _038074BC
	mov r2, #1
	mov r0, r2, lsl r0
	orr r0, r0, r2, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	b _038074D4
_038074BC:
	mov r3, #1
	mov r2, r3, lsl r4
	orr r0, r2, r3, lsl r0
	orr r0, r0, r3, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_038074D4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_038074DC: .word 0x00001FFF
	arm_func_end sub_038073D4
_038074E0:
	.byte 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.global _038074F4
_038074F4:
	.word sub_037FB748
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB708
	.word sub_037FB718
	.word sub_037FB728
	.word sub_037FB738
	.word sub_037FB638
	.word sub_037FB6C8
	.word sub_037FB6D8
	.word sub_037FB6E8
	.word sub_037FB6F8
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.word sub_037FB638
	.global _03807558
_03807558:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global _0380755C
_0380755C:
	.byte 0x78, 0x56, 0x34, 0x12
	.global _03807560
_03807560:
	.byte 0x00, 0xFE, 0x7F, 0x02
	.global _03807564
_03807564:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00
	.global _0380756C
_0380756C:
	.byte 0x01, 0x00, 0x00, 0x00
	.global _03807570
_03807570:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA
	.byte 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x08, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE3, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xF0, 0xF0, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3E, 0xF8
	.byte 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x0C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC0, 0xFF, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF
	.byte 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x20, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xC3, 0x28, 0x00, 0x02, 0x00
	.global _03807600
_03807600:
	.byte 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF

	.bss
	.global _03807608
_03807608:
	.space 0x8
	.global _03807610
_03807610:
	.space 0x4
	.global _03807614
_03807614:
	.space 0x4
	.global _03807618
_03807618:
	.space 0x28
	.global _03807640
_03807640:
	.space 0x4
	.global _03807644
_03807644:
	.space 0x4
	.global _03807648
_03807648:
	.space 0x28
	.global _03807670
_03807670:
	.space 0xC
	.global _0380767C
_0380767C:
	.space 0x4
	.global _03807680
_03807680:
	.space 0x24
	.global _038076A4
_038076A4:
	.space 0x4
	.global _038076A8
_038076A8:
	.space 0xC
	.global _038076B4
_038076B4:
	.space 0xA4
	.global _03807758
_03807758:
	.space 0xA4
	.global _038077FC
_038077FC:
	.space 0x4
	.global _03807800
_03807800:
	.space 0x24
	.global _03807824
_03807824:
	.space 0x4
	.global _03807828
_03807828:
	.space 0x10
	.global _03807838
_03807838:
	.space 0xC
	.global _03807844
_03807844:
	.space 0x14
	.global _03807858
_03807858:
	.space 0x4
	.global _0380785C
_0380785C:
	.space 0x4
	.global _03807860
_03807860:
	.space 0x80
	.global _038078E0
_038078E0:
	.space 0x4
	.global _038078E4
_038078E4:
	.space 0x2C
	.global _03807910
_03807910:
	.space 0x4
	.global _03807914
_03807914:
	.space 0x10
	.global _03807924
_03807924:
	.space 0x10
	.global _03807934
_03807934:
	.space 0x4
	.global _03807938
_03807938:
	.space 0x20
	.global _03807958
_03807958:
	.space 0x20
	.global _03807978
_03807978:
	.space 0x2C
	.global _038079A4
_038079A4:
	.space 0x4A4
	.global _03807E48
_03807E48:
	.space 0x8
	.global _03807E50
_03807E50:
	.space 0xC
	.global _03807E5C
_03807E5C:
	.space 0x10
	.global _03807E6C
_03807E6C:
	.space 0x4
	.global _03807E70
_03807E70:
	.space 0x540
	.global _038083B0
_038083B0:
	.space 0x240
	.global _038085F0
_038085F0:
	.space 0x800
	.global _03808DF0
_03808DF0:
	.space 0x200
	.global _03808FF0
_03808FF0:
	.space 0x20
	.global _03809010
_03809010:
	.space 0x30
	.global _03809040
_03809040:
	.space 0x20
	.global _03809060
_03809060:
	.space 0x600
	.global _03809660
_03809660:
	.space 0x4
	.global _03809664
_03809664:
	.space 0x1C
	.global _03809680
_03809680:
	.space 0x240
	.global _038098C0
_038098C0:
	.space 0x10
	.global _038098D0
_038098D0:
	.space 0x4
	.global _038098D4
_038098D4:
	.space 0x8
	.global _038098DC
_038098DC:
	.space 0x2A4
	.global _03809B80
_03809B80:
	.space 0x20
	.global _03809BA0
_03809BA0:
	.space 0x40
	.global _03809BE0
_03809BE0:
	.space 0x4
	.global _03809BE4
_03809BE4:
	.space 0x180
	.global _03809D64
_03809D64:
	.space 0xC
	.global _03809D70
_03809D70:
	.space 0x4
	.global _03809D74
_03809D74:
	.space 0x2C
	.global _03809DA0
_03809DA0:
	.space 0xA8
	.global _03809E48
_03809E48:
	.space 0x4
	.global _03809E4C
_03809E4C:
	.space 0x2
	.global _03809E4E
_03809E4E:
	.space 0x2
	.global _03809E50
_03809E50:
	.space 0x4
	.global _03809E54
_03809E54:
	.space 0x2C
	.global _03809E80
_03809E80:
	.space 0x8
	.global _03809E88
_03809E88:
	.space 0x10
	.global _03809E98
_03809E98:
	.space 0xA4
	.global _03809F3C
_03809F3C:
	.space 0xBC0
	.global _0380AAFC
_0380AAFC:
	.space 0x700
	.global _0380B1FC
_0380B1FC:
	.space 0x3C
	.global _0380B238
_0380B238:
	.space 0x14
	.global _0380B24C
_0380B24C:
	.space 0x10
	.global _0380B25C
_0380B25C:
	.space 0x4
	.global _0380B260
_0380B260:
	.space 0x4
	.global _0380B264
_0380B264:
	.space 0x30
	.global _0380B294
_0380B294:
	.space 0x2C
	.global _0380B2C0
_0380B2C0:
	.space 0xA4
	.global _0380B364
_0380B364:
	.space 0xA4
	.global _0380B408
_0380B408:
	.space 0x2C
	.global _0380B434
_0380B434:
	.space 0x2C
	.global _0380B460
_0380B460:
	.space 0x28
