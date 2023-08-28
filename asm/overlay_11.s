	.include "asm/macros.inc"
	.include "overlay_11.inc"

	.text

	arm_func_start ov11_022DC240
ov11_022DC240: ; 0x022DC240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r4, _022DC364 ; =ov11_02324C60
	mov r8, r0
	ldr r0, [r4]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r0, #0
	bne _022DC35C
	mov r0, #0x19c
	mov r1, #0
	bl MemAlloc
	mov r1, r4
	mov r2, #0
	str r0, [r1]
	strb r2, [r0, #0x19a]
	bl GetHero
	cmp r0, #0
	beq _022DC2A4
	ldrsh r0, [r0, #4]
	cmp r0, #0x258
	movgt r4, #1
	movle r4, #0
	b _022DC2A8
_022DC2A4:
	mov r4, #1
_022DC2A8:
	mov r1, #0
	ldr lr, _022DC364 ; =ov11_02324C60
	mov r3, r1
	mvn r0, #0
_022DC2B8:
	ldr r2, [lr]
	add sb, r1, #1
	add r2, r2, r1, lsl #1
	add r2, r2, #0x100
	strh r3, [r2, #0x90]
	ldr r2, [lr]
	mov ip, sb, lsl #0x10
	add r1, r2, r1, lsl #1
	add r2, r1, #0x100
	mov r1, ip, asr #0x10
	strh r0, [r2, #0x88]
	cmp r1, #4
	blt _022DC2B8
	ldr ip, _022DC364 ; =ov11_02324C60
	ldr sb, [sp, #0x28]
	ldr r0, [ip]
	ldr lr, [sp, #0x2c]
	add r0, r0, #0x100
	strh r3, [r0, #0x98]
	ldr r0, [ip]
	mov r1, r7
	strb r8, [r0, #0x186]
	ldr r0, [ip]
	mov r2, r6
	strb r3, [r0, #0x187]
	stmia sp, {sb, lr}
	ldr r0, [ip]
	mov r3, r5
	add r0, r0, #0x170
	bl ov10_022C2300
	ldr r0, _022DC364 ; =ov11_02324C60
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x170
	bl ov10_022C0814
	ldr r0, _022DC364 ; =ov11_02324C60
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x184]
	ldr r0, [r0]
	strb r2, [r0, #0x185]
_022DC35C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022DC364: .word ov11_02324C60
	arm_func_end ov11_022DC240

	arm_func_start ov11_022DC368
ov11_022DC368: ; 0x022DC368
	stmdb sp!, {r3, lr}
	ldr r0, _022DC39C ; =ov11_02324C60
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov10_022C096C
	ldr r0, _022DC39C ; =ov11_02324C60
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DC39C ; =ov11_02324C60
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC39C: .word ov11_02324C60
	arm_func_end ov11_022DC368

	arm_func_start ov11_022DC3A0
ov11_022DC3A0: ; 0x022DC3A0
	stmdb sp!, {r3, lr}
	ldr r0, _022DC3F8 ; =ov11_02324C60
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r0, #0x185]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov11_022DC504
	ldr r0, _022DC3F8 ; =ov11_02324C60
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	bl ov10_022C09E8
	bl ov10_022C0CE0
	ldr r0, _022DC3F8 ; =ov11_02324C60
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x184]
	ldr r0, [r0]
	strb r2, [r0, #0x185]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC3F8: .word ov11_02324C60
	arm_func_end ov11_022DC3A0

	arm_func_start ov11_022DC3FC
ov11_022DC3FC: ; 0x022DC3FC
	stmdb sp!, {r3, lr}
	ldr r0, _022DC430 ; =ov11_02324C60
	ldr r0, [r0]
	cmp r0, #0
	ldrneb r0, [r0, #0x185]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov10_022C13B4
	ldr r0, _022DC430 ; =ov11_02324C60
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x185]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC430: .word ov11_02324C60
	arm_func_end ov11_022DC3FC

	arm_func_start ov11_022DC434
ov11_022DC434: ; 0x022DC434
	stmdb sp!, {r3, lr}
	ldr r0, _022DC468 ; =ov11_02324C60
	ldr r1, [r0]
	cmp r1, #0
	ldrneb r0, [r1, #0x185]
	cmpne r0, #0
	ldrneb r0, [r1, #0x19a]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	strb r0, [r1, #0x19a]
	bl ov10_022C0CE0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC468: .word ov11_02324C60
	arm_func_end ov11_022DC434

	arm_func_start ov11_022DC46C
ov11_022DC46C: ; 0x022DC46C
	stmdb sp!, {r3, lr}
	ldr r0, _022DC490 ; =ov11_02324C60
	ldr r0, [r0]
	cmp r0, #0
	ldrneb r0, [r0, #0x185]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov10_022C11D8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC490: .word ov11_02324C60
	arm_func_end ov11_022DC46C

	arm_func_start ov11_022DC494
ov11_022DC494: ; 0x022DC494
	stmdb sp!, {r3, lr}
	ldr r0, _022DC4FC ; =ov11_02324C60
	ldr r1, [r0]
	cmp r1, #0
	ldrneb r0, [r1, #0x185]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r1, #0x184]
	cmp r0, #0
	beq _022DC4D0
	bl ov10_022C1398
	ldr r0, _022DC4FC ; =ov11_02324C60
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x184]
_022DC4D0:
	ldr r0, _022DC4FC ; =ov11_02324C60
	ldr r1, _022DC500 ; =0x02316A3C
	ldr r0, [r0]
	ldr r0, [r0, #0x178]
	bl sub_0200B3C0
	ldr r0, _022DC4FC ; =ov11_02324C60
	ldr r1, _022DC500 ; =0x02316A3C
	ldr r0, [r0]
	ldr r0, [r0, #0x17c]
	bl sub_0200B3C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC4FC: .word ov11_02324C60
_022DC500: .word 0x02316A3C
	arm_func_end ov11_022DC494

	arm_func_start ov11_022DC504
ov11_022DC504: ; 0x022DC504
	stmdb sp!, {r3, lr}
	ldr r0, _022DC530 ; =ov11_02324C60
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022DC534
	ldr r0, _022DC530 ; =ov11_02324C60
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x19a]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC530: .word ov11_02324C60
	arm_func_end ov11_022DC504

	arm_func_start ov11_022DC534
ov11_022DC534: ; 0x022DC534
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	ldr r1, _022DC6B8 ; =0x020A1870
	mov r6, #0
	ldrsh r1, [r1]
	mov sl, r0
	mov r7, r6
	add r0, r1, #0
	mov r4, r0, lsl #0x10
_022DC558:
	mov r0, r7
	bl GetActiveTeamMember
	mov r8, r0
	ldrb r0, [r8]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _022DC664
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022DC664
	ldrsh r1, [r8, #0xc]
	mov r0, #0x5c
	mul r5, r6, r0
	ldrsh r2, [r8, #6]
	add r0, sp, #0x10
	mov sb, #0
	bl sub_02058EB0
	add r0, sp, #0x10
	mov r1, #0x38
	bl IqSkillFlagTest
	cmp r0, #0
	ldrsh r0, [r8, #0xc]
	mov r1, #0
	movne sb, r4, asr #0x10
	bl GetType
	mov fp, r0
	ldrsh r0, [r8, #0xc]
	mov r1, #1
	bl GetType
	mov r3, r0
	ldrsh r1, [r8, #0xc]
	mov r2, fp
	add r0, sp, #0x5c
	bl sub_02011220
	add r0, sp, #0x5c
	bl sub_02011394
	add r0, sb, r0
	ldrsh r1, [r8, #0xe]
	mov r0, r0, lsl #0x10
	add r0, r1, r0, asr #16
	mov r1, r0, lsl #0x10
	ldr r0, _022DC6BC ; =0x000003E7
	mov sb, r1, asr #0x10
	cmp r0, r1, asr #16
	movlt sb, r0
	add r0, sp, #0x1c
	mov r1, r8
	bl sub_020585B4
	ldrb r3, [r8, #2]
	add r0, sl, r5
	mov r1, r7
	stmia sp, {r3, sb}
	ldr r3, _022DC6C0 ; =ov11_02324C60
	str sb, [sp, #8]
	ldr r3, [r3]
	add r2, sp, #0x1c
	add r3, r3, r7, lsl #1
	add r3, r3, #0x100
	ldrsh r3, [r3, #0x90]
	str r3, [sp, #0xc]
	ldrsh r3, [r8, #0xc]
	bl ov10_022C1D78
	add r6, r6, #1
_022DC664:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022DC558
	mov r0, r6, lsl #0x10
	mov r5, r0, asr #0x10
	mov r4, #0x5c
	b _022DC69C
_022DC688:
	smlabb r0, r5, r4, sl
	bl ov10_022C1D40
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022DC69C:
	cmp r5, #4
	blt _022DC688
	mov r0, sl
	mov r1, #0
	bl ov10_022C0998
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DC6B8: .word 0x020A1870
_022DC6BC: .word 0x000003E7
_022DC6C0: .word ov11_02324C60
	arm_func_end ov11_022DC534

	arm_func_start ov11_022DC6C4
ov11_022DC6C4: ; 0x022DC6C4
	stmdb sp!, {r3, lr}
	mov r0, #0x400
	mov r1, #6
	bl MemAlloc
	ldr r2, _022DC710 ; =0x02324C64
	ldr r1, _022DC714 ; =ov11_02324E80
	mov r3, #1
	str r0, [r2, #4]
	strb r3, [r1]
	bl ov11_022E45C4
	bl ov11_022E8024
	bl ov11_022E811C
	bl ov11_022E7F34
	bl ov11_022E4A4C
	bl ov11_022E6094
	bl ov11_022E7110
	bl ov11_022E7ADC
	bl ov11_022DC718
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC710: .word 0x02324C64
_022DC714: .word ov11_02324E80
	arm_func_end ov11_022DC6C4

	arm_func_start ov11_022DC718
ov11_022DC718: ; 0x022DC718
	stmdb sp!, {r3, lr}
	bl ov11_022E4B88
	ldr r0, _022DC788 ; =0x02324E94
	bl InitPortraitBox
	ldr r0, _022DC78C ; =0x02324EA4
	bl InitPortraitBox
	ldr r0, _022DC790 ; =0x02324ECC
	bl InitPreprocessorArgs
	mov r3, #0
	ldr r0, _022DC794 ; =ov11_02324E80
	mvn r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	strh r1, [r0, #8]
	strh r1, [r0, #6]
	strh r1, [r0, #0xa]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strb r3, [r0, #1]
	ldr r1, _022DC798 ; =0x02324EB4
	ldr r0, _022DC79C ; =0x02324F1C
	mov r2, r3
_022DC770:
	strb r2, [r1, r3]
	str r2, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x15
	blt _022DC770
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC788: .word 0x02324E94
_022DC78C: .word 0x02324EA4
_022DC790: .word 0x02324ECC
_022DC794: .word ov11_02324E80
_022DC798: .word 0x02324EB4
_022DC79C: .word 0x02324F1C
	arm_func_end ov11_022DC718

	arm_func_start ov11_022DC7A0
ov11_022DC7A0: ; 0x022DC7A0
	stmdb sp!, {r3, lr}
	ldr r0, _022DC804 ; =0x02324C64
	ldr r0, [r0]
	cmp r0, #0
	beq _022DC7C4
	bl MemFree
	ldr r0, _022DC804 ; =0x02324C64
	mov r1, #0
	str r1, [r0]
_022DC7C4:
	bl ov11_022E7AE0
	bl ov11_022E7114
	bl ov11_022E60A8
	bl ov11_022E4B00
	bl ov11_022E7F80
	bl sub_02065CB0
	bl ov11_022E8038
	bl ov11_022E8120
	bl ov11_022E45DC
	ldr r0, _022DC804 ; =0x02324C64
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022DC804 ; =0x02324C64
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC804: .word 0x02324C64
	arm_func_end ov11_022DC7A0

	arm_func_start ov11_022DC808
ov11_022DC808: ; 0x022DC808
	ldr r0, _022DC818 ; =ov11_02324E80
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022DC818: .word ov11_02324E80
	arm_func_end ov11_022DC808

	arm_func_start ov11_022DC81C
ov11_022DC81C: ; 0x022DC81C
	ldr r0, _022DC82C ; =ov11_02324E80
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_022DC82C: .word ov11_02324E80
	arm_func_end ov11_022DC81C

	arm_func_start ov11_022DC830
ov11_022DC830: ; 0x022DC830
	mvn r1, #0
	mov r3, #0
	strh r1, [r0]
	strh r3, [r0, #2]
	strh r1, [r0, #4]
	strb r1, [r0, #6]
	str r3, [r0, #0xc]
	str r3, [r0, #8]
	str r3, [r0, #0x10]
	str r3, [r0, #0x1c]
	str r3, [r0, #0x18]
	str r3, [r0, #0x20]
	str r3, [r0, #0x28]
	strh r1, [r0, #0x32]
	strh r3, [r0, #0x34]
	strb r1, [r0, #0x36]
	strh r3, [r0, #0x38]
	strh r3, [r0, #0x3a]
	strh r3, [r0, #0x3c]
	str r3, [r0, #0x40]
	mov r2, r3
_022DC884:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x60]
	cmp r3, #4
	blt _022DC884
	bx lr
	arm_func_end ov11_022DC830

	arm_func_start ov11_022DC89C
ov11_022DC89C: ; 0x022DC89C
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	sub r1, r1, #1
	strh r1, [r0, #0x14]
	strb r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	bx lr
	arm_func_end ov11_022DC89C

	arm_func_start ov11_022DC8C0
ov11_022DC8C0: ; 0x022DC8C0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	str r1, [r4]
	add r0, r4, #0xc
	str r1, [r4, #4]
	bl ov11_022DC830
	add r0, r4, #0x7c
	bl ov11_022DC830
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DC8C0

	arm_func_start ov11_022DC8E8
ov11_022DC8E8: ; 0x022DC8E8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl ov11_022DC8C0
	str r6, [r4]
	str r5, [r4, #4]
	ldr r0, [r4]
	ldrsh r0, [r0]
	strh r0, [r4, #8]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	beq _022DC92C
	ldr r0, [r4, #4]
	blx r1
_022DC92C:
	strh r0, [r4, #0xa]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022DC8E8

	arm_func_start ov11_022DC934
ov11_022DC934: ; 0x022DC934
	ldr ip, _022DC93C ; =ov11_022DC8C0
	bx ip
	.align 2, 0
_022DC93C: .word ov11_022DC8C0
	arm_func_end ov11_022DC934

	arm_func_start ov11_022DC940
ov11_022DC940: ; 0x022DC940
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov11_022DC940

	arm_func_start ov11_022DC958
ov11_022DC958: ; 0x022DC958
	ldrsh r1, [r0, #0xc]
	cmp r1, #4
	moveq r0, #1
	bxeq lr
	sub r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	bhi _022DC998
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	cmpne r0, #1
	movne r0, #1
	bxne lr
_022DC998:
	mov r0, #0
	bx lr
	arm_func_end ov11_022DC958

	arm_func_start ov11_022DC9A0
ov11_022DC9A0: ; 0x022DC9A0
	ldrsh r1, [r0, #0xc]
	cmp r1, #3
	bne _022DC9C0
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	cmpne r0, #1
	movne r0, #1
	bxne lr
_022DC9C0:
	mov r0, #0
	bx lr
	arm_func_end ov11_022DC9A0

	arm_func_start ov11_022DC9C8
ov11_022DC9C8: ; 0x022DC9C8
	ldrsh r2, [r0, #0xe]
	cmp r2, #0
	beq _022DCA0C
	ldr r2, [r0, #0x2c]
	cmp r2, #0
	beq _022DC9F8
	ldr r3, [r0, #0x28]
	ldr r2, [r1, #4]
	cmp r3, r2
	bne _022DCA0C
	mov r0, #1
	bx lr
_022DC9F8:
	ldr r3, [r0, #0x18]
	ldr r2, [r1, #4]
	cmp r3, r2
	moveq r0, #1
	bxeq lr
_022DCA0C:
	ldrsh r2, [r0, #0x7e]
	cmp r2, #0
	beq _022DCA50
	ldr r2, [r0, #0x9c]
	cmp r2, #0
	beq _022DCA3C
	ldr r2, [r0, #0x98]
	ldr r0, [r1, #4]
	cmp r2, r0
	bne _022DCA50
	mov r0, #1
	bx lr
_022DCA3C:
	ldr r2, [r0, #0x88]
	ldr r0, [r1, #4]
	cmp r2, r0
	moveq r0, #1
	bxeq lr
_022DCA50:
	mov r0, #0
	bx lr
	arm_func_end ov11_022DC9C8

	arm_func_start ov11_022DCA58
ov11_022DCA58: ; 0x022DCA58
	ldrsh r0, [r0, #0x3e]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov11_022DCA58

	arm_func_start ov11_022DCA70
ov11_022DCA70: ; 0x022DCA70
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov11_022DC958
	cmp r0, #0
	beq _022DCAA8
	ldrsh r0, [r4, #0xe]
	sub r0, r0, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	movls r0, #1
	ldmlsia sp!, {r4, pc}
_022DCAA8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DCA70

	arm_func_start ov11_022DCAB0
ov11_022DCAB0: ; 0x022DCAB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, r2
	bl ov11_022E7FB8
	mov r0, #1
	strh r0, [r4, #0x18]
	cmp r5, #0
	ldrnesb r0, [r5, #0x12]
	strneb r0, [r4, #0x16]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022DCAB0

	arm_func_start ov11_022DCAE0
ov11_022DCAE0: ; 0x022DCAE0
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0xc
	bl ov11_022DC830
	add r0, r4, #0x7c
	bl ov11_022DC830
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DCAE0

	arm_func_start ov11_022DCB00
ov11_022DCB00: ; 0x022DCB00
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0xc
	bl ov11_022DC830
	add r0, r4, #0x7c
	bl ov11_022DC830
	mov r0, #6
	strh r0, [r4, #0xe]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DCB00

	arm_func_start ov11_022DCB28
ov11_022DCB28: ; 0x022DCB28
	stmdb sp!, {r4, lr}
	bl ov11_022F8FC4
	mov r4, r0
	bl ov11_022FCBF0
	orr r4, r4, r0
	bl ov11_022FE300
	orr r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DCB28

	arm_func_start ov11_022DCB48
ov11_022DCB48: ; 0x022DCB48
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r2, r1
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _022DCC6C
_022DCB64: ; jump table
	b _022DCC60 ; case 0
	b _022DCB74 ; case 1
	b _022DCBE4 ; case 2
	b _022DCBB8 ; case 3
_022DCB74:
	ldrsh r0, [r4, #0xc]
	cmp r0, #0
	bne _022DCBA0
	add lr, r4, #0xc
	add ip, r4, #0x7c
	mov r5, #7
_022DCB8C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _022DCB8C
	b _022DCC8C
_022DCBA0:
	ldrsh r0, [r4, #0x7c]
	cmp r0, #0
	beq _022DCC8C
	add r0, r4, #0x7c
	bl ov11_022DC830
	b _022DCC8C
_022DCBB8:
	ldrsh r0, [r4, #0xc]
	cmp r0, #0
	bne _022DCC8C
	add lr, r4, #0xc
	add ip, r4, #0x7c
	mov r5, #7
_022DCBD0:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _022DCBD0
	b _022DCC8C
_022DCBE4:
	ldrsh r0, [r4, #0xc]
	cmp r0, #1
	beq _022DCC10
	ldr r1, _022DCCDC ; =0x02316A44
	add r0, sp, #0x10
	ldr r2, [r1, #0x68]
	ldr r3, [r1, #0x64]
	ldr r1, _022DCCE0 ; =0x02319208
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	bl FatalError
_022DCC10:
	ldrsh r1, [r4, #0x7c]
	mvn r0, #0
	cmp r1, r0
	beq _022DCC40
	ldr r1, _022DCCDC ; =0x02316A44
	add r0, sp, #8
	ldr r2, [r1, #0x18]
	ldr r3, [r1, #0x14]
	ldr r1, _022DCCE4 ; =0x02319224
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl FatalError
_022DCC40:
	add r5, r4, #0xc
	add lr, r4, #0x7c
	mov ip, #7
_022DCC4C:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022DCC4C
	b _022DCC8C
_022DCC60:
	add r0, r4, #0x7c
	bl ov11_022DC830
	b _022DCC8C
_022DCC6C:
	ldr r1, _022DCCDC ; =0x02316A44
	add r0, sp, #0
	ldr r3, [r1, #0x60]
	ldr ip, [r1, #0x5c]
	ldr r1, _022DCCE8 ; =0x02319240
	str ip, [sp]
	str r3, [sp, #4]
	bl FatalError
_022DCC8C:
	add r0, r4, #0xc
	bl ov11_022DC830
	mov r2, #4
	mov r0, #1
	strh r2, [r4, #0xc]
	strh r0, [r4, #0xe]
	sub r2, r0, #2
	strh r2, [r4, #0x10]
	mov r1, #0
	strb r2, [r4, #0x12]
	str r1, [r4, #0x14]
	str r1, [r4, #0x1c]
	str r1, [r4, #0x18]
	str r1, [r4, #0x20]
	str r1, [r4, #0x24]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x28]
	str r1, [r4, #0x30]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DCCDC: .word 0x02316A44
_022DCCE0: .word 0x02319208
_022DCCE4: .word 0x02319224
_022DCCE8: .word 0x02319240
	arm_func_end ov11_022DCB48

	arm_func_start ov11_022DCCEC
ov11_022DCCEC: ; 0x022DCCEC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	movs r4, r2
	mov r5, r0
	moveq r0, #0
	beq _022DCED4
	ldr r0, [r4, #4]
	cmp r0, #0
	moveq r0, #0
	beq _022DCED4
	ldrsh r0, [r4, #0x18]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022DCE38
_022DCD24: ; jump table
	b _022DCE2C ; case 0
	b _022DCD34 ; case 1
	b _022DCDA4 ; case 2
	b _022DCD78 ; case 3
_022DCD34:
	ldrsh r0, [r5, #0xc]
	cmp r0, #0
	bne _022DCD60
	add lr, r5, #0xc
	add ip, r5, #0x7c
	mov r6, #7
_022DCD4C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _022DCD4C
	b _022DCE5C
_022DCD60:
	ldrsh r0, [r5, #0x7c]
	cmp r0, #0
	beq _022DCE5C
	add r0, r5, #0x7c
	bl ov11_022DC830
	b _022DCE5C
_022DCD78:
	ldrsh r0, [r5, #0xc]
	cmp r0, #0
	bne _022DCE5C
	add lr, r5, #0xc
	add ip, r5, #0x7c
	mov r6, #7
_022DCD90:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _022DCD90
	b _022DCE5C
_022DCDA4:
	ldrsh r0, [r5, #0xc]
	cmp r0, #2
	cmpne r0, #4
	beq _022DCE5C
	cmp r0, #1
	beq _022DCDDC
	ldr r1, _022DCEDC ; =0x02316A44
	add r0, sp, #0x10
	ldr r2, [r1, #0x70]
	ldr r3, [r1, #0x6c]
	ldr r1, _022DCEE0 ; =0x02319208
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	bl FatalError
_022DCDDC:
	ldrsh r1, [r5, #0x7c]
	mvn r0, #0
	cmp r1, r0
	beq _022DCE0C
	ldr r1, _022DCEDC ; =0x02316A44
	add r0, sp, #8
	ldr r2, [r1, #8]
	ldr r3, [r1, #4]
	ldr r1, _022DCEE4 ; =0x02319224
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl FatalError
_022DCE0C:
	add r6, r5, #0xc
	add lr, r5, #0x7c
	mov ip, #7
_022DCE18:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022DCE18
	b _022DCE5C
_022DCE2C:
	add r0, r5, #0x7c
	bl ov11_022DC830
	b _022DCE5C
_022DCE38:
	ldr r1, _022DCEDC ; =0x02316A44
	add r0, sp, #0
	ldr r2, [r1, #0x90]
	ldr r1, [r1, #0x8c]
	str r2, [sp, #4]
	str r1, [sp]
	ldrsh r2, [r4, #0x18]
	ldr r1, _022DCEE8 ; =0x02319240
	bl FatalError
_022DCE5C:
	add r0, r5, #0xc
	bl ov11_022DC830
	ldrsh r2, [r4, #0x18]
	mov r1, #2
	mov r0, #0
	strh r2, [r5, #0xc]
	strh r1, [r5, #0xe]
	ldrsh r1, [r4, #0x14]
	strh r1, [r5, #0x10]
	ldrsb r1, [r4, #0x16]
	strb r1, [r5, #0x12]
	ldr r1, [r4]
	str r1, [r5, #0x14]
	ldr r1, [r4, #4]
	str r1, [r5, #0x1c]
	str r1, [r5, #0x18]
	ldr r1, [r4, #8]
	str r1, [r5, #0x20]
	str r0, [r5, #0x24]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
	ldr r0, [r5]
	ldr r2, [r0, #0x14]
	cmp r2, #0
	beq _022DCED0
	ldr r0, [r5, #4]
	add r1, r5, #0x42
	blx r2
_022DCED0:
	mov r0, #1
_022DCED4:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DCEDC: .word 0x02316A44
_022DCEE0: .word 0x02319208
_022DCEE4: .word 0x02319224
_022DCEE8: .word 0x02319240
	arm_func_end ov11_022DCCEC

	arm_func_start ov11_022DCEEC
ov11_022DCEEC: ; 0x022DCEEC
	strh r1, [r0, #0x3e]
	mov r1, #3
	strh r1, [r0, #0xe]
	ldr r1, _022DCF08 ; =ov11_02324E80
	mov r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022DCF08: .word ov11_02324E80
	arm_func_end ov11_022DCEEC

	arm_func_start ov11_022DCF0C
ov11_022DCF0C: ; 0x022DCF0C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x7e]
	cmp r0, #0
	beq _022DCFB4
	add r5, r4, #0x7c
	add lr, r4, #0xc
	mov ip, #7
_022DCF2C:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022DCF2C
	ldr r2, [r4]
	ldr r0, [r2, #0x2c]
	cmp r0, #0
	ldrnesb r1, [r4, #0x42]
	mvnne r0, #0
	cmpne r1, r0
	beq _022DCF88
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x18]
	add r1, sp, #0
	blx r2
	ldr r0, [sp]
	tst r0, #0x10
	beq _022DCF88
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
_022DCF88:
	ldr r0, [r4]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _022DCFA4
	ldrh r1, [r4, #0x40]
	ldr r0, [r4, #4]
	blx r2
_022DCFA4:
	add r0, r4, #0x7c
	bl ov11_022DC830
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022DCFB4:
	add r0, r4, #0xc
	bl ov11_022DC830
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022DCF0C

	arm_func_start ov11_022DCFC4
ov11_022DCFC4: ; 0x022DCFC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	bne _022DD014
	ldrsh r0, [r4, #0xc]
	cmp r0, #0
	bne _022DCFF8
	add r0, r4, #0xc
	bl ov11_022DC830
	add r0, r4, #0x7c
	bl ov11_022DC830
	mov r0, #1
	ldmia sp!, {r4, pc}
_022DCFF8:
	ldrsh r0, [r4, #0x7c]
	cmp r0, #0
	bne _022DD078
	add r0, r4, #0x7c
	bl ov11_022DC830
	mov r0, #1
	ldmia sp!, {r4, pc}
_022DD014:
	ldrsh r0, [r4, #0x7c]
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	bhi _022DD03C
	add r0, r4, #0x7c
	bl ov11_022DC830
_022DD03C:
	ldrsh r0, [r4, #0xc]
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	bhi _022DD078
	ldrsh r0, [r4, #0xe]
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #6
	movne r0, #1
	strneh r0, [r4, #0xe]
	ldmneia sp!, {r4, pc}
_022DD078:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DCFC4

	arm_func_start ov11_022DD080
ov11_022DD080: ; 0x022DD080
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r1, [r4, #0x7c]
	sub r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	bhi _022DD0C0
	add r0, r4, #0xc
	bl ov11_022DC830
	add r0, r4, #0x7c
	bl ov11_022DC830
	mov r0, #1
	ldmia sp!, {r4, pc}
_022DD0C0:
	ldrsh r1, [r4, #0xc]
	sub r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	movhi r0, #0
	ldmhiia sp!, {r4, pc}
	bl ov11_022DCF0C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DD080

	arm_func_start ov11_022DD0EC
ov11_022DD0EC: ; 0x022DD0EC
	ldrsh r3, [r0, #0x3e]
	mov ip, #0
	sub r2, ip, #1
	cmp r3, r2
	beq _022DD10C
	cmp r3, r1
	streqh r2, [r0, #0x3e]
	moveq ip, #1
_022DD10C:
	ldrsh r3, [r0, #0xae]
	mvn r2, #0
	cmp r3, r2
	beq _022DD128
	cmp r3, r1
	streqh r2, [r0, #0xae]
	moveq ip, #1
_022DD128:
	mov r0, ip
	bx lr
	arm_func_end ov11_022DD0EC

	arm_func_start ov11_022DD130
ov11_022DD130: ; 0x022DD130
	stmdb sp!, {r3, lr}
	ldr ip, _022DD158 ; =0x02324EB4
	mov lr, #1
	ldr r1, _022DD15C ; =ov11_02324E80
	ldr r2, _022DD160 ; =0x02324F1C
	mov r3, #0
	strb lr, [ip, r0]
	str r3, [r2, r0, lsl #2]
	strb lr, [r1, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DD158: .word 0x02324EB4
_022DD15C: .word ov11_02324E80
_022DD160: .word 0x02324F1C
	arm_func_end ov11_022DD130

	arm_func_start ov11_022DD164
ov11_022DD164: ; 0x022DD164
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	ldrsh r0, [r6, #0xe]
	cmp r0, #0
	beq _022DD2B4
	mov r8, #0
	mov r5, #1
	mov sb, r8
	mov r4, r8
	ldr r7, _022DD2BC ; =ov11_02324E80
	b _022DD2A4
_022DD190:
	ldrsh r0, [r6, #0xe]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022DD2A4
_022DD1A0: ; jump table
	b _022DD2A0 ; case 0
	b _022DD2A0 ; case 1
	b _022DD1BC ; case 2
	b _022DD22C ; case 3
	b _022DD258 ; case 4
	b _022DD298 ; case 5
	b _022DD2A0 ; case 6
_022DD1BC:
	mov r0, r6
	bl ov11_022DDD64
	strh r0, [r6, #0xe]
	ldrsh r0, [r6, #0xe]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022DD224
_022DD1D8: ; jump table
	b _022DD1F4 ; case 0
	b _022DD21C ; case 1
	b _022DD1FC ; case 2
	b _022DD224 ; case 3
	b _022DD224 ; case 4
	b _022DD224 ; case 5
	b _022DD214 ; case 6
_022DD1F4:
	mov r0, r6
	bl ov11_022DCF0C
_022DD1FC:
	ldrsh r0, [r6, #0xc]
	cmp r0, #3
	bne _022DD224
	mov r0, #1
	strh r0, [r6, #0xe]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD214:
	mov r0, #6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD21C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD224:
	strh r4, [r6, #0x48]
	b _022DD2A4
_022DD22C:
	mov r0, r6
	bl ov11_022E2480
	ldrsh r1, [r6, #0xe]
	mov r5, r0
	cmp r1, #2
	ldreqsh r0, [r6, #0xc]
	cmpeq r0, #3
	bne _022DD2A4
	mov r0, #1
	strh r0, [r6, #0xe]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD258:
	ldrb r0, [r7]
	cmp r0, #0
	beq _022DD290
	mov r0, r6
	bl ov11_022E3C68
	ldrsh r1, [r6, #0xe]
	mov r5, r0
	cmp r1, #2
	ldreqsh r0, [r6, #0xc]
	cmpeq r0, #3
	bne _022DD2A4
	mov r0, #1
	strh r0, [r6, #0xe]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD290:
	mov r5, sb
	b _022DD2A4
_022DD298:
	mov r5, r8
	b _022DD2A4
_022DD2A0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD2A4:
	cmp r5, #0
	bne _022DD190
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DD2B4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022DD2BC: .word ov11_02324E80
	arm_func_end ov11_022DD164

	arm_func_start ov11_022DD2C0
ov11_022DD2C0: ; 0x022DD2C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xa0
	mov r4, r0
	ldrsh r0, [r4, #0xe]
	cmp r0, #0
	beq _022DDD00
	cmp r0, #5
	bne _022DDD00
	ldr r6, [r4, #0x34]
	ldrh r7, [r6]
	cmp r7, #0x96
	bgt _022DD380
	bge _022DD5F0
	cmp r7, #0x8c
	bgt _022DD35C
	bge _022DDA30
	cmp r7, #0xe
	bgt _022DD350
	cmp r7, #0
	addge pc, pc, r7, lsl #2
	b _022DDD00
_022DD314: ; jump table
	b _022DDD00 ; case 0
	b _022DD50C ; case 1
	b _022DDD00 ; case 2
	b _022DDD00 ; case 3
	b _022DDD00 ; case 4
	b _022DD6D0 ; case 5
	b _022DD700 ; case 6
	b _022DDD00 ; case 7
	b _022DD6D0 ; case 8
	b _022DD4F4 ; case 9
	b _022DD7A0 ; case 10
	b _022DD7D0 ; case 11
	b _022DD800 ; case 12
	b _022DD6D0 ; case 13
	b _022DD524 ; case 14
_022DD350:
	cmp r7, #0x85
	beq _022DDC6C
	b _022DDD00
_022DD35C:
	cmp r7, #0x91
	bgt _022DD374
	bge _022DDA30
	cmp r7, #0x90
	beq _022DDC4C
	b _022DDD00
_022DD374:
	cmp r7, #0x92
	beq _022DDA30
	b _022DDD00
_022DD380:
	cmp r7, #0x9a
	bgt _022DD3A8
	bge _022DD688
	cmp r7, #0x97
	bgt _022DD39C
	beq _022DD64C
	b _022DDD00
_022DD39C:
	cmp r7, #0x98
	beq _022DD6A8
	b _022DDD00
_022DD3A8:
	cmp r7, #0xcc
	bgt _022DD414
	bge _022DD468
	sub r0, r7, #0x9b
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _022DDD00
_022DD3C4: ; jump table
	b _022DD594 ; case 0
	b _022DD688 ; case 1
	b _022DD424 ; case 2
	b _022DD688 ; case 3
	b _022DD6BC ; case 4
	b _022DD688 ; case 5
	b _022DDD00 ; case 6
	b _022DDD00 ; case 7
	b _022DDD00 ; case 8
	b _022DDD00 ; case 9
	b _022DDD00 ; case 10
	b _022DDD00 ; case 11
	b _022DDD00 ; case 12
	b _022DDD00 ; case 13
	b _022DD688 ; case 14
	b _022DD990 ; case 15
	b _022DD990 ; case 16
	b _022DD830 ; case 17
	b _022DD830 ; case 18
	b _022DD688 ; case 19
_022DD414:
	ldr r0, _022DDD08 ; =0x0000012F
	cmp r7, r0
	beq _022DD544
	b _022DDD00
_022DD424:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	add r1, sp, #8
	bl ov11_022E68E4
	cmp r0, #0
	beq _022DDD00
	ldr r2, [sp, #8]
	ldr r1, _022DDD0C ; =0x02319260
	mov r0, #2
	bl DebugPrint
	ldr r1, [sp, #8]
	mov r0, r4
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD468:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	mov r5, r0
	str r5, [sp]
	mov r0, #2
	ldr r1, _022DDD10 ; =0x02319284
	mov r2, r8
	mov r3, r7
	bl DebugPrint
	mov r2, r7
	mov r3, r5
	mov r0, r4
	and r1, r8, #0xff
	bl ov11_022E7118
	mov r2, r8
	mov r5, r0
	mov r0, #2
	ldr r1, _022DDD14 ; =0x023192B4
	mov r3, r5
	bl DebugPrint
	cmp r5, #0
	blt _022DDD00
	mov r2, #2
	mov r0, r4
	mov r1, r5
	strh r2, [r4, #0xe]
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022DDD00
_022DD4F4:
	ldr r0, _022DDD18 ; =ov11_02324E80
	ldrsh r0, [r0, #6]
	bl ov11_022F12C0
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD50C:
	ldr r0, _022DDD18 ; =ov11_02324E80
	ldrsh r0, [r0, #6]
	bl ov11_022F173C
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD524:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F25A4
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD544:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mvn r1, #0
	cmp r1, r0, asr #16
	mov r5, r0, asr #0x10
	bne _022DD574
	add r0, r4, #0x6c
	mov r1, #0x1c
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022DD574:
	bl ov11_022F8FC4
	bl ov11_022FCBF0
	bl ov11_022FE300
	mov r0, r5
	bl ov11_022F71E4
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD594:
	ldrsh r0, [r4, #0x48]
	cmp r0, #0
	bne _022DD5D0
	bl sub_02034DA8
	cmp r0, #0
	beq _022DD5BC
	ldr r1, _022DDD1C ; =0x023192E8
	mov r0, #2
	bl DebugPrint
	b _022DDD00
_022DD5BC:
	bl sub_02034E70
	cmp r0, #0
	movne r0, #1
	strneh r0, [r4, #0x48]
	b _022DDD00
_022DD5D0:
	bl sub_02034DA8
	cmp r0, #0
	mov r0, #2
	streqh r0, [r4, #0xe]
	beq _022DDD00
	ldr r1, _022DDD20 ; =0x02319304
	bl DebugPrint
	b _022DDD00
_022DD5F0:
	ldrsh r0, [r4, #0x48]
	cmp r0, #0
	bne _022DD62C
	bl sub_02034DA8
	cmp r0, #0
	beq _022DD618
	ldr r1, _022DDD24 ; =0x02319320
	mov r0, #2
	bl DebugPrint
	b _022DDD00
_022DD618:
	bl sub_02034CA4
	cmp r0, #0
	movne r0, #1
	strneh r0, [r4, #0x48]
	b _022DDD00
_022DD62C:
	bl sub_02034DA8
	cmp r0, #0
	mov r0, #2
	streqh r0, [r4, #0xe]
	beq _022DDD00
	ldr r1, _022DDD28 ; =0x02319338
	bl DebugPrint
	b _022DDD00
_022DD64C:
	ldrsh r0, [r4, #0x48]
	cmp r0, #0
	bne _022DD668
	bl sub_02034D0C
	mov r0, #1
	strh r0, [r4, #0x48]
	b _022DDD00
_022DD668:
	bl sub_02034DA8
	cmp r0, #0
	mov r0, #2
	streqh r0, [r4, #0xe]
	beq _022DDD00
	ldr r1, _022DDD2C ; =0x02319350
	bl DebugPrint
	b _022DDD00
_022DD688:
	ldr r1, _022DDD30 ; =0x02319370
	mov r0, #2
	bl DebugPrint
	bl sub_02034DA8
	cmp r0, #0
	moveq r0, #2
	streqh r0, [r4, #0xe]
	b _022DDD00
_022DD6A8:
	bl ov11_02300A60
	cmp r0, #0
	moveq r0, #2
	streqh r0, [r4, #0xe]
	b _022DDD00
_022DD6BC:
	bl ov11_023006DC
	cmp r0, #0
	moveq r0, #2
	streqh r0, [r4, #0xe]
	b _022DDD00
_022DD6D0:
	ldr r0, _022DDD34 ; =0x00000113
	ldr r1, _022DDD18 ; =ov11_02324E80
	strh r0, [r1, #6]
	bl ov11_022F12C0
	mov r0, #3
	bl ov11_022F22F4
	ldrsh r1, [r4, #0x48]
	mov r0, #4
	add r1, r1, #1
	strh r1, [r4, #0x48]
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD700:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #8]
	bl ov11_022E48AC
	ldr r1, _022DDD18 ; =ov11_02324E80
	mov r6, r0
	strh r7, [r1, #6]
	ldrsh r0, [r1, #6]
	bl ov11_022F12C0
	mov r0, #7
	bl ov11_022F22F4
	cmp r5, #0
	beq _022DD758
	mov r0, #4
	bl ov11_022F1DA8
_022DD758:
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov11_022E48E0
	mov r1, r6, lsl #0x10
	str r0, [sp, #0xc]
	mov r0, r1, lsr #0x10
	bl ov11_022E48E0
	str r0, [sp, #0x10]
	add r2, sp, #0xc
	mov r0, #0
	mov r1, #1
	bl ov11_022EB0E4
	ldrsh r1, [r4, #0x48]
	mov r0, #4
	add r1, r1, #1
	strh r1, [r4, #0x48]
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD7A0:
	ldr r0, _022DDD34 ; =0x00000113
	ldr r1, _022DDD18 ; =ov11_02324E80
	strh r0, [r1, #6]
	bl ov11_022F12C0
	mov r0, #4
	bl ov11_022F22F4
	ldrsh r1, [r4, #0x48]
	mov r0, #4
	add r1, r1, #1
	strh r1, [r4, #0x48]
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD7D0:
	ldr r0, _022DDD38 ; =0x00000132
	ldr r1, _022DDD18 ; =ov11_02324E80
	strh r0, [r1, #6]
	bl ov11_022F12C0
	mov r0, #5
	bl ov11_022F22F4
	ldrsh r1, [r4, #0x48]
	mov r0, #4
	add r1, r1, #1
	strh r1, [r4, #0x48]
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD800:
	ldr r0, _022DDD34 ; =0x00000113
	ldr r1, _022DDD18 ; =ov11_02324E80
	strh r0, [r1, #6]
	bl ov11_022F12C0
	mov r0, #6
	bl ov11_022F22F4
	ldrsh r1, [r4, #0x48]
	mov r0, #4
	add r1, r1, #1
	strh r1, [r4, #0x48]
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD830:
	ldrsh r0, [r4, #0x48]
	ldr r6, [r4, #0x1c]
	cmp r0, #0
	beq _022DD860
	bl sub_02034DA8
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4, #0x48]
	beq _022DD860
	ldr r1, _022DDD3C ; =0x02319380
	mov r0, #2
	bl DebugPrint
_022DD860:
	ldrsh r0, [r4, #0x48]
	cmp r0, #0
	bne _022DDD00
	ldrsh r0, [r4, #0x44]
	mov r5, #0
	cmp r0, #0
	blt _022DD900
	b _022DD8B0
_022DD880:
	ldrh r0, [r6, #2]
	add r8, r6, #2
	bl ov11_022E48AC
	ldrsh r1, [r4, #0x44]
	add r6, r6, #6
	cmp r0, r1
	bne _022DD8B0
	ldrh r1, [r8, #2]
	add r0, r4, #0x14
	bl ov11_022E4248
	mov r5, r0
	b _022DD8BC
_022DD8B0:
	ldrh r0, [r6]
	cmp r0, #0x67
	beq _022DD880
_022DD8BC:
	str r6, [r4, #0x1c]
	cmp r5, #0
	bne _022DD938
	b _022DD8D0
_022DD8CC:
	add r6, r6, #6
_022DD8D0:
	ldrh r0, [r6]
	cmp r0, #0x67
	beq _022DD8CC
	b _022DD8E4
_022DD8E0:
	add r6, r6, #4
_022DD8E4:
	ldrh r0, [r6]
	cmp r0, #0x6e
	beq _022DD8E0
	str r6, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD900:
	ldrh r0, [r6]
	cmp r0, #0x6e
	bne _022DD928
	add r0, r6, #4
	str r0, [r4, #0x1c]
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	bl ov11_022E4248
	mov r5, r0
	b _022DD938
_022DD928:
	str r6, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD938:
	ldr r1, _022DDD40 ; =0x02319398
	mov r0, #2
	bl DebugPrint
	ldr r0, _022DDD44 ; =0x02324EA4
	bl sub_02034E28
	ldr r0, _022DDD18 ; =ov11_02324E80
	ldr r2, _022DDD48 ; =0x02324ECC
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movge r0, #0x20
	movlt r0, #0
	cmp r7, #0xac
	moveq r1, #8
	ldrne r1, _022DDD4C ; =0x00003008
	orr r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	mov r0, #1
	strh r0, [r4, #0x48]
	b _022DDD00
_022DD990:
	ldrsh r0, [r4, #0x48]
	cmp r0, #0
	bne _022DDD00
	bl sub_02034F98
	cmp r0, #0
	bne _022DDD00
	bl sub_02035098
	mov r5, r0
	ldr r1, _022DDD50 ; =0x023193AC
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	cmp r5, #0
	ble _022DDA04
	add r0, r5, r5, lsl #1
	add r6, r6, r0, lsl #1
	cmp r7, #0xab
	addeq r6, r6, #2
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	ldrh r0, [r6, #4]
	ldr r2, [r4, #0x14]
	ldr r1, _022DDD54 ; =0x023193BC
	add r0, r2, r0, lsl #1
	str r0, [r4, #0x1c]
	ldrh r3, [r6, #4]
	mov r2, r5
	mov r0, #2
	bl DebugPrint
_022DDA04:
	ldr r0, _022DDD58 ; =0x02324C64
	ldr r0, [r0]
	bl MemFree
	ldr r1, _022DDD58 ; =0x02324C64
	mov r2, #0
	mov r0, #1
	str r2, [r1]
	bl ov11_022DD130
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DDA30:
	ldrsh r0, [r4, #0x44]
	cmp r0, #0
	bne _022DDBE8
	add r0, sp, #4
	bl ov11_0230067C
	cmp r0, #0
	beq _022DDD00
	ldrsh r0, [sp, #4]
	mvn r1, #0
	cmp r0, r1
	beq _022DDBE0
	bl DungeonSwapIdxToId
	mov r6, r0
	cmp r7, #0x91
	beq _022DDA7C
	ldrsh r2, [sp, #4]
	mov r0, #0
	mov r1, #0x26
	bl SaveScriptVariableValue
_022DDA7C:
	ldrsh r2, [sp, #4]
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	ldrsh r2, [sp, #4]
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	ldrsh r0, [sp, #4]
	bl SetEnterDungeon
	mov r0, r6
	bl CheckMissionRestrictions
	tst r0, #0x20
	movne r5, #7
	bne _022DDBC4
	tst r0, #0x40
	movne r5, #8
	bne _022DDBC4
	tst r0, #0x4000
	beq _022DDBAC
	ldrsh r1, [sp, #4]
	cmp r1, #0x63
	bgt _022DDB08
	bge _022DDB5C
	cmp r1, #0x29
	bgt _022DDAFC
	cmp r1, #0x26
	blt _022DDBC4
	beq _022DDB54
	cmp r1, #0x29
	moveq r5, #0x15
	b _022DDBC4
_022DDAFC:
	cmp r1, #0x3f
	moveq r5, #0x16
	b _022DDBC4
_022DDB08:
	cmp r1, #0x6e
	bgt _022DDB48
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _022DDBC4
_022DDB1C: ; jump table
	b _022DDB64 ; case 0
	b _022DDB6C ; case 1
	b _022DDB74 ; case 2
	b _022DDB7C ; case 3
	b _022DDB84 ; case 4
	b _022DDBC4 ; case 5
	b _022DDBC4 ; case 6
	b _022DDB8C ; case 7
	b _022DDB94 ; case 8
	b _022DDB9C ; case 9
	b _022DDBA4 ; case 10
_022DDB48:
	cmp r1, #0xae
	moveq r5, #0x21
	b _022DDBC4
_022DDB54:
	mov r5, #0x14
	b _022DDBC4
_022DDB5C:
	mov r5, #0x17
	b _022DDBC4
_022DDB64:
	mov r5, #0x18
	b _022DDBC4
_022DDB6C:
	mov r5, #0x19
	b _022DDBC4
_022DDB74:
	mov r5, #0x1a
	b _022DDBC4
_022DDB7C:
	mov r5, #0x1b
	b _022DDBC4
_022DDB84:
	mov r5, #0x1c
	b _022DDBC4
_022DDB8C:
	mov r5, #0x1d
	b _022DDBC4
_022DDB94:
	mov r5, #0x1e
	b _022DDBC4
_022DDB9C:
	mov r5, #0x1f
	b _022DDBC4
_022DDBA4:
	mov r5, #0x20
	b _022DDBC4
_022DDBAC:
	tst r0, #1
	movne r5, #0x12
	bne _022DDBC4
	cmp r0, #0
	moveq r5, #0
	movne r5, #0x13
_022DDBC4:
	mov r0, r4
	mov r1, r5
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DDBE0:
	strh r1, [r4, #0x44]
	b _022DDD00
_022DDBE8:
	cmp r0, #1
	bne _022DDC18
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	bl ov11_022E9558
	mov r0, r4
	mov r1, #0
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DDC18:
	mov r0, #0
	bl sub_0204E8EC
	mov r1, #0x27
	sub r2, r1, #0x28
	mov r0, #0
	bl SaveScriptVariableValue
	mov r0, r4
	mov r1, #1
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DDC4C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	bl ov11_022E958C
	mov r0, r4
	mov r1, #1
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022DDD00
_022DDC6C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r2, r0
	ldr r1, _022DDD5C ; =0x023193D4
	add r0, sp, #0x20
	bl Sprintf
	ldr r2, _022DDD60 ; =0x0000030F
	add r0, sp, #0x14
	add r1, sp, #0x20
	bl LoadFileFromRom__02008C3C
	ldr r1, [sp, #0x14]
	mov r0, #0x400
	add r6, r1, #2
	ldrsh r5, [r1]
	bl RandInt
	b _022DDCCC
_022DDCB8:
	ldrsh r1, [r6]
	cmp r0, r1
	blt _022DDCD4
	add r6, r6, #4
	sub r5, r5, #1
_022DDCCC:
	cmp r5, #1
	bgt _022DDCB8
_022DDCD4:
	ldrsh r1, [r6, #2]
	add r0, sp, #0x1c
	bl sub_0200CF78
	mov r0, r7, lsl #0x10
	add r1, sp, #0x1c
	mov r0, r0, asr #0x10
	bl sub_02065CB4
	add r0, sp, #0x14
	bl UnloadFile
	mov r0, #2
	strh r0, [r4, #0xe]
_022DDD00:
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022DDD08: .word 0x0000012F
_022DDD0C: .word 0x02319260
_022DDD10: .word 0x02319284
_022DDD14: .word 0x023192B4
_022DDD18: .word ov11_02324E80
_022DDD1C: .word 0x023192E8
_022DDD20: .word 0x02319304
_022DDD24: .word 0x02319320
_022DDD28: .word 0x02319338
_022DDD2C: .word 0x02319350
_022DDD30: .word 0x02319370
_022DDD34: .word 0x00000113
_022DDD38: .word 0x00000132
_022DDD3C: .word 0x02319380
_022DDD40: .word 0x02319398
_022DDD44: .word 0x02324EA4
_022DDD48: .word 0x02324ECC
_022DDD4C: .word 0x00003008
_022DDD50: .word 0x023193AC
_022DDD54: .word 0x023193BC
_022DDD58: .word 0x02324C64
_022DDD5C: .word 0x023193D4
_022DDD60: .word 0x0000030F
	arm_func_end ov11_022DD2C0

	arm_func_start ov11_022DDD64
ov11_022DDD64: ; 0x022DDD64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c8
	mov r4, r0
	ldr r1, [r4, #0x1c]
	ldr r0, _022DED08 ; =0x02318610
	add r6, r1, #2
	str r1, [r4, #0x34]
	str r6, [r4, #0x38]
	ldrh r5, [r1]
	mov r1, r5, lsl #3
	ldrsb r0, [r0, r1]
	cmp r0, #0
	strgeh r0, [r4, #0x3c]
	ldrge r1, [r4, #0x1c]
	addge r0, r0, #1
	addge r0, r1, r0, lsl #1
	bge _022DDDCC
	ldrh r0, [r6]
	bl ov11_022E48AC
	ldr r2, [r4, #0x38]
	add r1, r0, #2
	add r2, r2, #2
	str r2, [r4, #0x38]
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x1c]
	add r0, r0, r1, lsl #1
_022DDDCC:
	str r0, [r4, #0x1c]
	ldr r0, _022DED0C ; =0x00000172
	cmp r5, r0
	addls pc, pc, r5, lsl #2
	b _022E04DC
_022DDDE0: ; jump table
	b _022E04DC ; case 0
	b _022DE650 ; case 1
	b _022DE764 ; case 2
	b _022DE6D0 ; case 3
	b _022DE6D0 ; case 4
	b _022DFC64 ; case 5
	b _022DFC64 ; case 6
	b _022DE7DC ; case 7
	b _022DFC64 ; case 8
	b _022DE500 ; case 9
	b _022DFC64 ; case 10
	b _022DFC64 ; case 11
	b _022DFC64 ; case 12
	b _022DFC64 ; case 13
	b _022DE6AC ; case 14
	b _022DE7C8 ; case 15
	b _022E04DC ; case 16
	b _022E04DC ; case 17
	b _022DE7B0 ; case 18
	b _022DE6D0 ; case 19
	b _022DE6D0 ; case 20
	b _022E04DC ; case 21
	b _022DE808 ; case 22
	b _022DE5D8 ; case 23
	b _022DE5BC ; case 24
	b _022E04DC ; case 25
	b _022DE6B4 ; case 26
	b _022E04DC ; case 27
	b _022E04DC ; case 28
	b _022E04DC ; case 29
	b _022E04DC ; case 30
	b _022E04DC ; case 31
	b _022E04DC ; case 32
	b _022E04DC ; case 33
	b _022E04DC ; case 34
	b _022E04DC ; case 35
	b _022E04DC ; case 36
	b _022E04DC ; case 37
	b _022E04DC ; case 38
	b _022E04DC ; case 39
	b _022DEFD0 ; case 40
	b _022DF0B8 ; case 41
	b _022DF328 ; case 42
	b _022DF348 ; case 43
	b _022E04DC ; case 44
	b _022DF2D0 ; case 45
	b _022DF1EC ; case 46
	b _022DF238 ; case 47
	b _022DF1A0 ; case 48
	b _022DF284 ; case 49
	b _022DF154 ; case 50
	b _022DF0FC ; case 51
	b _022DF014 ; case 52
	b _022DF064 ; case 53
	b _022DF308 ; case 54
	b _022E0400 ; case 55
	b _022E0424 ; case 56
	b _022E04DC ; case 57
	b _022E04DC ; case 58
	b _022E04DC ; case 59
	b _022E04DC ; case 60
	b _022E04DC ; case 61
	b _022E04DC ; case 62
	b _022E04DC ; case 63
	b _022E04DC ; case 64
	b _022E04DC ; case 65
	b _022E04DC ; case 66
	b _022E04DC ; case 67
	b _022E04DC ; case 68
	b _022E04DC ; case 69
	b _022E04DC ; case 70
	b _022E04DC ; case 71
	b _022E04DC ; case 72
	b _022E04DC ; case 73
	b _022E04DC ; case 74
	b _022E04DC ; case 75
	b _022E04DC ; case 76
	b _022E04DC ; case 77
	b _022E04DC ; case 78
	b _022E04DC ; case 79
	b _022E04DC ; case 80
	b _022E04DC ; case 81
	b _022E04DC ; case 82
	b _022E04DC ; case 83
	b _022E04DC ; case 84
	b _022E04DC ; case 85
	b _022E04DC ; case 86
	b _022E04DC ; case 87
	b _022E04DC ; case 88
	b _022E04DC ; case 89
	b _022E04DC ; case 90
	b _022E04DC ; case 91
	b _022E04DC ; case 92
	b _022E04DC ; case 93
	b _022E04DC ; case 94
	b _022E04DC ; case 95
	b _022E04DC ; case 96
	b _022E04DC ; case 97
	b _022E04DC ; case 98
	b _022E04DC ; case 99
	b _022E04DC ; case 100
	b _022E04DC ; case 101
	b _022E04DC ; case 102
	b _022E04DC ; case 103
	b _022E04DC ; case 104
	b _022E04DC ; case 105
	b _022E04DC ; case 106
	b _022E04DC ; case 107
	b _022E04DC ; case 108
	b _022E04DC ; case 109
	b _022E04DC ; case 110
	b ov11_022E04D4 ; case 111
	b ov11_022E04C4 ; case 112
	b _022E04DC ; case 113
	b _022E04DC ; case 114
	b _022E04DC ; case 115
	b ov11_022DEE44 ; case 116
	b ov11_022DEDC4 ; case 117
	b ov11_022DEE00 ; case 118
	b ov11_022DED7C ; case 119
	b ov11_022DED60 ; case 120
	b ov11_022DED98 ; case 121
	b ov11_022DEF04 ; case 122
	b ov11_022DEEBC ; case 123
	b ov11_022DEF8C ; case 124
	b ov11_022DEF64 ; case 125
	b ov11_022DEF28 ; case 126
	b ov11_022DEEDC ; case 127
	b ov11_022DEE84 ; case 128
	b ov11_022E04B8 ; case 129
	b ov11_022E04CC ; case 130
	b _022E04DC ; case 131
	b _022E04DC ; case 132
	b _022E04DC ; case 133
	b _022E04DC ; case 134
	b ov11_022E0410 ; case 135
	b ov00_022E0434 ; case 136
	b ov11_022DE3AC ; case 137
	b _022E04DC ; case 138
	b ov11_022DECDC ; case 139
	b _022E04DC ; case 140
	b _022E04DC ; case 141
	b ov11_022DE458 ; case 142
	b ov11_022DE484 ; case 143
	b _022E04DC ; case 144
	b _022E04DC ; case 145
	b _022E04DC ; case 146
	b ov11_022DE4BC ; case 147
	b _022E04DC ; case 148
	b _022E04DC ; case 149
	b ov11_022DF924 ; case 150
	b ov11_022DF924 ; case 151
	b ov11_022DFA50 ; case 152
	b ov11_022DF8B8 ; case 153
	b ov11_022DF92C ; case 154
	b ov11_022DF924 ; case 155
	b ov11_022DF92C ; case 156
	b ov11_022DE3F0 ; case 157
	b ov11_022DF92C ; case 158
	b ov11_022DFA78 ; case 159
	b ov11_022DF92C ; case 160
	b ov11_022DF728 ; case 161
	b ov11_022DF710 ; case 162
	b ov11_022DF740 ; case 163
	b ov11_022DF760 ; case 164
	b ov11_022DF834 ; case 165
	b ov11_022DF7CC ; case 166
	b ov11_022DF89C ; case 167
	b ov11_022DF8F4 ; case 168
	b ov11_022DFAAC ; case 169
	b ov11_022DFD44 ; case 170
	b ov11_022DFD44 ; case 171
	b ov11_022DFC94 ; case 172
	b ov11_022DFC94 ; case 173
	b ov11_022DF92C ; case 174
	b _022E04DC ; case 175
	b _022E04DC ; case 176
	b _022E04DC ; case 177
	b _022E04DC ; case 178
	b _022E04DC ; case 179
	b _022E04DC ; case 180
	b _022E04DC ; case 181
	b _022E04DC ; case 182
	b _022E04DC ; case 183
	b _022E04DC ; case 184
	b _022E04DC ; case 185
	b _022E04DC ; case 186
	b _022E04DC ; case 187
	b _022E04DC ; case 188
	b _022E04DC ; case 189
	b _022E04DC ; case 190
	b _022E04DC ; case 191
	b _022E04DC ; case 192
	b _022E04DC ; case 193
	b _022E04DC ; case 194
	b _022E04DC ; case 195
	b _022E04DC ; case 196
	b _022E04DC ; case 197
	b _022E04DC ; case 198
	b _022E04DC ; case 199
	b _022E04DC ; case 200
	b ov11_022DE3AC ; case 201
	b _022E04DC ; case 202
	b ov11_022DE3AC ; case 203
	b ov11_022DE448 ; case 204
	b _022E04DC ; case 205
	b _022E04DC ; case 206
	b _022E04DC ; case 207
	b _022E04DC ; case 208
	b _022E04DC ; case 209
	b _022E04DC ; case 210
	b _022E04DC ; case 211
	b _022E04DC ; case 212
	b ov11_022E048C ; case 213
	b _022E04DC ; case 214
	b ov11_022E0020 ; case 215
	b ov11_022E0108 ; case 216
	b ov11_022DFFC0 ; case 217
	b ov11_022E00A8 ; case 218
	b ov11_022DFFE8 ; case 219
	b ov11_022E00D0 ; case 220
	b _022E04DC ; case 221
	b ov11_022E0278 ; case 222
	b ov11_022E0278 ; case 223
	b ov11_022E0020 ; case 224
	b ov11_022E0108 ; case 225
	b _022E04DC ; case 226
	b _022E04DC ; case 227
	b ov11_022DFFE8 ; case 228
	b ov11_022E00D0 ; case 229
	b ov11_022E01F0 ; case 230
	b _022E04DC ; case 231
	b ov11_022E0190 ; case 232
	b _022E04DC ; case 233
	b ov11_022E01B8 ; case 234
	b _022E04DC ; case 235
	b _022E04DC ; case 236
	b ov11_022E0278 ; case 237
	b ov11_022E0278 ; case 238
	b ov11_022E01F0 ; case 239
	b _022E04DC ; case 240
	b _022E04DC ; case 241
	b _022E04DC ; case 242
	b ov11_022E01B8 ; case 243
	b _022E04DC ; case 244
	b _022E04DC ; case 245
	b _022E04DC ; case 246
	b _022E04DC ; case 247
	b _022E04DC ; case 248
	b _022E04DC ; case 249
	b _022E04DC ; case 250
	b _022E04DC ; case 251
	b _022E04DC ; case 252
	b _022E04DC ; case 253
	b _022E04DC ; case 254
	b _022E04DC ; case 255
	b _022E04DC ; case 256
	b _022E04DC ; case 257
	b _022E04DC ; case 258
	b _022E04DC ; case 259
	b _022E04DC ; case 260
	b _022E04DC ; case 261
	b _022E04DC ; case 262
	b _022E04DC ; case 263
	b _022E04DC ; case 264
	b _022E04DC ; case 265
	b _022E04DC ; case 266
	b _022E04DC ; case 267
	b _022E04DC ; case 268
	b _022E04DC ; case 269
	b _022E04DC ; case 270
	b _022E04DC ; case 271
	b _022E04DC ; case 272
	b _022E04DC ; case 273
	b _022E04DC ; case 274
	b _022E04DC ; case 275
	b _022E04DC ; case 276
	b _022E04DC ; case 277
	b _022E04DC ; case 278
	b _022E04DC ; case 279
	b _022E04DC ; case 280
	b _022E04DC ; case 281
	b _022E04DC ; case 282
	b _022E04DC ; case 283
	b _022E04DC ; case 284
	b _022E04DC ; case 285
	b _022E04DC ; case 286
	b _022E04DC ; case 287
	b _022E04DC ; case 288
	b _022E04DC ; case 289
	b _022E04DC ; case 290
	b _022E04DC ; case 291
	b _022E04DC ; case 292
	b _022E04DC ; case 293
	b _022E04DC ; case 294
	b _022E04DC ; case 295
	b _022E04DC ; case 296
	b _022E04DC ; case 297
	b ov11_022DE834 ; case 298
	b ov11_022DE834 ; case 299
	b ov11_022DEBA4 ; case 300
	b ov11_022DEBA4 ; case 301
	b ov11_022DE934 ; case 302
	b ov11_022DE9B8 ; case 303
	b ov11_022DEAC4 ; case 304
	b ov11_022DEA08 ; case 305
	b ov11_022DEA08 ; case 306
	b ov11_022DEAC4 ; case 307
	b ov11_022DE960 ; case 308
	b ov11_022DE960 ; case 309
	b ov11_022DEC7C ; case 310
	b ov11_022DE834 ; case 311
	b ov11_022DE834 ; case 312
	b ov11_022DE834 ; case 313
	b ov11_022DE9B0 ; case 314
	b ov11_022DE834 ; case 315
	b ov11_022DE834 ; case 316
	b ov11_022DE834 ; case 317
	b ov11_022DE9B0 ; case 318
	b ov11_022DF374 ; case 319
	b ov11_022DF374 ; case 320
	b ov11_022DF374 ; case 321
	b ov11_022DF374 ; case 322
	b ov11_022DF374 ; case 323
	b ov11_022DF374 ; case 324
	b ov11_022DF374 ; case 325
	b ov11_022DF374 ; case 326
	b ov11_022DF374 ; case 327
	b ov11_022DF374 ; case 328
	b ov11_022DF374 ; case 329
	b ov11_022DF374 ; case 330
	b ov11_022DF374 ; case 331
	b _022E04DC ; case 332
	b _022E04DC ; case 333
	b _022E04DC ; case 334
	b _022E04DC ; case 335
	b _022E04DC ; case 336
	b _022E04DC ; case 337
	b _022E04DC ; case 338
	b _022E04DC ; case 339
	b _022E04DC ; case 340
	b _022E04DC ; case 341
	b ov11_022DED48 ; case 342
	b ov00_022E0378 ; case 343
	b ov11_022E03B8 ; case 344
	b ov11_022E03C8 ; case 345
	b ov11_022E03C8 ; case 346
	b ov11_022E03E0 ; case 347
	b ov11_022E03E0 ; case 348
	b ov11_022E03E0 ; case 349
	b ov11_022E03C0 ; case 350
	b _022E04DC ; case 351
	b ov11_022E03E8 ; case 352
	b ov11_022E03E8 ; case 353
	b ov11_022E03E8 ; case 354
	b ov11_022E03E0 ; case 355
	b ov00_022E03F0 ; case 356
	b ov00_022E03F0 ; case 357
	b ov00_022E03F0 ; case 358
	b ov00_022E03F0 ; case 359
	b ov11_022E03E0 ; case 360
	b ov11_022E03F8 ; case 361
	b ov11_022E03F8 ; case 362
	b ov11_022E038C ; case 363
	b ov11_022E03E0 ; case 364
	b ov11_022E03E0 ; case 365
	b ov11_022E03E0 ; case 366
	b ov11_022E03E0 ; case 367
	b ov11_022E03D0 ; case 368
	b ov11_022E03D8 ; case 369
	b ov11_022E03D0 ; case 370
	arm_func_end ov11_022DDD64

	arm_func_start ov11_022DE3AC
ov11_022DE3AC: ; 0x022DE3AC
	ldr r2, [r4, #0x1c]
	ldr r0, _022DED08 ; =0x02318610
	ldrh r1, [r2]
	mov r1, r1, lsl #3
	ldrsb r0, [r0, r1]
	cmp r0, #0
	addge r0, r0, #1
	addge r0, r2, r0, lsl #1
	bge _022DE3E4
	ldrh r0, [r2, #2]
	bl ov11_022E48AC
	ldr r1, [r4, #0x1c]
	add r0, r0, #2
	add r0, r1, r0, lsl #1
	arm_func_end ov11_022DE3AC
_022DE3E4:
	str r0, [r4, #0x1c]
	mov r0, #3
	b _022E2478

	arm_func_start ov11_022DE3F0
ov11_022DE3F0: ; 0x022DE3F0
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldr r1, _022DED10 ; =0x023193EC
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	add r1, sp, #0x158
	mov r0, r5
	bl ov11_022E60BC
	cmp r0, #0
	movne r0, #5
	bne _022E2478
	ldr r2, [sp, #0x158]
	ldr r1, _022DED14 ; =0x02319410
	mov r0, #2
	bl DebugPrint
	ldr r1, [sp, #0x158]
	mov r0, r4
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2474
	arm_func_end ov11_022DE3F0

	arm_func_start ov11_022DE448
ov11_022DE448: ; 0x022DE448
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #5
	b _022E2478
	arm_func_end ov11_022DE448

	arm_func_start ov11_022DE458
ov11_022DE458: ; 0x022DE458
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	ldrh r0, [r6, #2]
	mov r4, r1, asr #0x10
	bl ov11_022E48AC
	mov r2, r0
	mov r0, r4
	mov r1, #0
	bl ov11_022E94D0
	b _022E2474
	arm_func_end ov11_022DE458

	arm_func_start ov11_022DE484
ov11_022DE484: ; 0x022DE484
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	ldrh r0, [r6, #2]
	mov r5, r1, asr #0x10
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r0
	mov r0, r5
	mov r2, r4
	bl ov11_022E94D0
	b _022E2474
	arm_func_end ov11_022DE484

	arm_func_start ov11_022DE4BC
ov11_022DE4BC: ; 0x022DE4BC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x1e
	bl SaveScriptVariableValue
	mov r2, r4
	mov r0, #0
	mov r1, #0x1c
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x1d
	bl SaveScriptVariableValue
	b _022E2474
_022DE500:
	ldrh r0, [r6]
	bl ov11_022E48AC
	ldr r1, _022DED18 ; =ov11_02324E80
	strh r0, [r1, #8]
	ldrsh r2, [r1, #8]
	mov r0, #2
	strh r2, [r1, #6]
	bl GetDebugFlag2
	cmp r0, #0
	beq _022DE554
	ldr r3, _022DED18 ; =ov11_02324E80
	mov r0, #0xc
	ldrsh r2, [r3, #8]
	ldr r4, _022DED1C ; =0x020A5490
	ldr r1, _022DED20 ; =0x02319438
	smulbb r0, r2, r0
	ldr r4, [r4, r0]
	mov r0, #2
	str r4, [sp]
	ldrsh r3, [r3, #6]
	bl DebugPrint
_022DE554:
	ldr r1, _022DED18 ; =ov11_02324E80
	mov r0, #0
	ldrsh r2, [r1, #8]
	mov r1, #0x1f
	bl SaveScriptVariableValue
	ldr r0, _022DED18 ; =ov11_02324E80
	mov r1, #0xc
	ldrsh r3, [r0, #8]
	ldr r2, _022DED24 ; =0x020A548A
	mov r0, #0
	smulbb r1, r3, r1
	ldrsh r2, [r2, r1]
	mov r1, #0x20
	bl SaveScriptVariableValue
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r0, [r0, #6]
	bl ov11_022F46B4
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl ov11_022F7D18
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl ov11_022F1244
	mov r0, #5
	b _022E2478
_022DE5BC:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl ov11_022E7E84
	mov r0, #4
	b _022E2478
_022DE5D8:
	ldrh r0, [r6]
	bl ov11_022E48AC
	ldr r1, _022DED18 ; =ov11_02324E80
	strh r0, [r1, #2]
	ldrsh r2, [r1, #2]
	mov r0, #2
	strh r2, [r1, #4]
	bl GetDebugFlag2
	cmp r0, #0
	beq _022DE62C
	ldr r3, _022DED18 ; =ov11_02324E80
	mov r0, #0xc
	ldrsh r2, [r3, #2]
	ldr r4, _022DED1C ; =0x020A5490
	ldr r1, _022DED28 ; =0x02319458
	smulbb r0, r2, r0
	ldr r4, [r4, r0]
	mov r0, #2
	str r4, [sp]
	ldrsh r3, [r3, #4]
	bl DebugPrint
_022DE62C:
	ldr r1, _022DED18 ; =ov11_02324E80
	mov r0, #0
	ldrsh r1, [r1, #4]
	bl ov11_022E7F28
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r0, [r0, #6]
	bl ov11_022F4734
	mov r0, #4
	b _022E2478
_022DE650:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	bl ov11_022F1710
	ldr r1, _022DED18 ; =ov11_02324E80
	mov r0, #2
	strh r4, [r1, #6]
	bl GetDebugFlag2
	cmp r0, #0
	beq _022DE6A4
	ldr r3, _022DED18 ; =ov11_02324E80
	mov r0, #0xc
	ldrsh r2, [r3, #8]
	ldr r4, _022DED1C ; =0x020A5490
	ldr r1, _022DED2C ; =0x02319478
	smulbb r0, r2, r0
	ldr r4, [r4, r0]
	mov r0, #2
	str r4, [sp]
	ldrsh r3, [r3, #6]
	bl DebugPrint
_022DE6A4:
	mov r0, #5
	b _022E2478
_022DE6AC:
	mov r0, #5
	b _022E2478
_022DE6B4:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0
	mov r0, #1
	bl ov11_022E7F28
	mov r0, #4
	b _022E2478
_022DE6D0:
	ldr r0, _022DED30 ; =0x02316A44
	ldr r1, [r0, #0x38]
	ldr r0, [r0, #0x34]
	str r1, [sp, #0x154]
	str r0, [sp, #0x150]
	ldrh r0, [r6]
	bl ov11_022E48AC
	str r0, [sp, #0x150]
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	str r0, [sp, #0x154]
	cmp r5, #0x13
	bgt _022DE728
	bge _022DE74C
	cmp r5, #4
	bgt _022E2474
	cmp r5, #3
	blt _022E2474
	beq _022DE734
	cmp r5, #4
	beq _022DE740
	b _022E2474
_022DE728:
	cmp r5, #0x14
	beq _022DE758
	b _022E2474
_022DE734:
	add r0, sp, #0x150
	bl ov11_022F1ECC
	b _022E2474
_022DE740:
	add r0, sp, #0x150
	bl ov11_022F1EAC
	b _022E2474
_022DE74C:
	add r0, sp, #0x150
	bl ov11_02310DC0
	b _022E2474
_022DE758:
	add r0, sp, #0x150
	bl ov11_02310DA0
	b _022E2474
_022DE764:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	and r0, r4, #0xff
	bl ov11_022F1DA8
	bl ov11_0231145C
	cmp r0, #0
	beq _022DE794
	mov r1, r4
	mov r0, #1
	bl ov11_022E7F28
	b _022E2474
_022DE794:
	bl ov11_0231195C
	cmp r0, #0
	beq _022E2474
	mov r1, r4
	mov r0, #1
	bl ov11_022E7F28
	b _022E2474
_022DE7B0:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0
	mov r0, #2
	bl ov11_022E7F28
	b _022E2474
_022DE7C8:
	ldrh r0, [r6]
	bl ov11_022E48AC
	and r0, r0, #0xff
	bl ov11_022F26DC
	b _022E2474
_022DE7DC:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r2, r0
	mov r1, r1, lsr #0x10
	mov r0, #0
	bl ov11_022EF594
	b _022E2474
_022DE808:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r2, r0
	mov r1, r1, lsr #0x10
	mov r0, #1
	bl ov11_022EF594
	b _022E2474
	arm_func_end ov11_022DE4BC

	arm_func_start ov11_022DE834
ov11_022DE834: ; 0x022DE834
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x18
	mvn r1, #0
	cmp r1, r0, asr #24
	mov r6, r0, asr #0x18
	ldr r1, _022DED34 ; =0x00000137
	ldreqsb r6, [r4, #0x12]
	cmp r5, r1
	bgt _022DE88C
	bge _022DE904
	sub r0, r1, #0xc
	cmp r5, r0
	bgt _022E2474
	sub r0, r1, #0xd
	cmp r5, r0
	blt _022E2474
	beq _022DE8DC
	sub r0, r1, #0xc
	cmp r5, r0
	beq _022DE8F0
	b _022E2474
_022DE88C:
	sub r0, r5, #0x138
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022E2474
_022DE89C: ; jump table
	b _022DE91C ; case 0
	b _022DE910 ; case 1
	b _022E2474 ; case 2
	b _022DE8B4 ; case 3
	b _022DE8C8 ; case 4
	b _022DE928 ; case 5
_022DE8B4:
	mov r0, r6
	bl ov11_022E5A10
	mov r0, r6
	bl ov11_022E5B7C
	b _022E2474
_022DE8C8:
	mov r0, r6
	bl ov11_022E59E8
	mov r0, r6
	bl ov11_022E5B40
	b _022E2474
_022DE8DC:
	mov r0, r6
	bl ov11_022E5A38
	mov r0, r6
	bl ov11_022E5BB8
	b _022E2474
_022DE8F0:
	mov r0, r6
	bl ov11_022E5A50
	mov r0, r6
	bl ov11_022E5BB8
	b _022E2474
_022DE904:
	mov r0, r6
	bl ov11_022E5AD4
	b _022E2474
_022DE910:
	mov r0, r6
	bl ov11_022E5A98
	b _022E2474
_022DE91C:
	mov r0, r6
	bl ov11_022E5B10
	b _022E2474
_022DE928:
	mov r0, r6
	bl ov11_022E5D14
	b _022E2474
	arm_func_end ov11_022DE834

	arm_func_start ov11_022DE934
ov11_022DE934: ; 0x022DE934
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl ov11_022F7188
	ldrsh r0, [r4, #8]
	cmp r0, #1
	bne _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022DE934

	arm_func_start ov11_022DE960
ov11_022DE960: ; 0x022DE960
	ldrh r1, [r6]
	add r0, r4, #0x14
	bl ov11_022E4248
	mov r1, r0
	add r0, sp, #0x148
	bl ov11_022E4600
	ldr r0, _022DED38 ; =0x00000135
	cmp r5, r0
	moveq r1, #1
	movne r1, #0
	add r0, sp, #0x148
	and r1, r1, #0xff
	bl ov11_022F7408
	ldrsh r0, [r4, #8]
	cmp r0, #1
	bne _022E2474
	mov r0, #1
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022DE960

	arm_func_start ov11_022DE9B0
ov11_022DE9B0: ; 0x022DE9B0
	mov r0, #4
	b _022E2478
	arm_func_end ov11_022DE9B0

	arm_func_start ov11_022DE9B8
ov11_022DE9B8: ; 0x022DE9B8
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mvn r1, #0
	cmp r1, r0, asr #16
	mov r0, r0, asr #0x10
	bne _022DE9E8
	add r0, r4, #0x6c
	mov r1, #0x1c
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_022DE9E8:
	ldr r1, _022DED18 ; =ov11_02324E80
	strh r0, [r1, #0xa]
	bl ov11_022E5148
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r0, [r0, #0xa]
	bl ov11_022F71E4
	mov r0, #6
	b _022E2478
	arm_func_end ov11_022DE9B8

	arm_func_start ov11_022DEA08
ov11_022DEA08: ; 0x022DEA08
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0, lsl #0x10
	ldrh r0, [r6, #2]
	mov r6, r7, asr #0x10
	bl ov11_022E48AC
	mvn r1, #0
	mov r0, r0, lsl #0x18
	cmp r1, r7, asr #16
	mov r7, r0, asr #0x18
	ldreq r0, _022DED18 ; =ov11_02324E80
	ldreqsh r6, [r0, #8]
	cmp r7, #0
	ldrltsb r7, [r4, #0x12]
	mov r0, r6
	bl ov11_022E5148
	ldr r0, _022DED3C ; =0x00000132
	mov r1, r7
	cmp r5, r0
	moveq r2, #1
	movne r2, #0
	mov r0, r6
	and r2, r2, #0xff
	bl ov11_022F722C
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r1, [r0, #0xa]
	cmp r1, r6
	beq _022DEAA0
	strh r6, [r0, #0xa]
	ldrsh r0, [r4, #8]
	cmp r0, #1
	movne r0, #6
	bne _022E2478
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	beq _022E2474
	mov r0, #6
	b _022E2478
_022DEAA0:
	ldrsh r0, [r4, #8]
	cmp r0, #1
	ldreqsh r0, [r4, #0x10]
	cmpeq r0, #2
	moveq r0, #6
	movne r0, #1
	strneh r0, [r4, #0x46]
	movne r0, #3
	b _022E2478
	arm_func_end ov11_022DEA08

	arm_func_start ov11_022DEAC4
ov11_022DEAC4: ; 0x022DEAC4
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov sb, r0, lsl #0x10
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	mov r7, sb, asr #0x10
	bl ov11_022E4248
	mov r8, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x18
	mvn r1, #0
	cmp r1, sb, asr #16
	mov r6, r0, asr #0x18
	ldreq r0, _022DED18 ; =ov11_02324E80
	mov r1, r8
	ldreqsh r7, [r0, #8]
	cmp r6, #0
	add r0, sp, #0x140
	ldrltsb r6, [r4, #0x12]
	bl ov11_022E4600
	add r1, sp, #0x140
	mov r0, r7
	bl ov11_022E5188
	ldr r0, _022DED40 ; =0x00000133
	add r1, sp, #0x140
	cmp r5, r0
	moveq r3, #1
	movne r3, #0
	mov r0, r7
	mov r2, r6
	and r3, r3, #0xff
	bl ov11_022F72A0
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r1, [r0, #0xa]
	cmp r1, r7
	beq _022DEB80
	strh r7, [r0, #0xa]
	ldrsh r0, [r4, #8]
	cmp r0, #1
	movne r0, #6
	bne _022E2478
	ldrsh r0, [r4, #0x10]
	cmp r0, #0
	beq _022E2474
	mov r0, #6
	b _022E2478
_022DEB80:
	ldrsh r0, [r4, #8]
	cmp r0, #1
	ldreqsh r0, [r4, #0x10]
	cmpeq r0, #2
	moveq r0, #6
	movne r0, #1
	strneh r0, [r4, #0x46]
	movne r0, #3
	b _022E2478
	arm_func_end ov11_022DEAC4

	arm_func_start ov11_022DEBA4
ov11_022DEBA4: ; 0x022DEBA4
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov sb, r0, lsl #0x10
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	mov r7, sb, asr #0x10
	bl ov11_022E4248
	mov r8, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x18
	mvn r1, #0
	cmp r1, sb, asr #16
	mov r6, r0, asr #0x18
	ldreq r0, _022DED18 ; =ov11_02324E80
	mov r1, r8
	ldreqsh r7, [r0, #8]
	cmp r6, #0
	add r0, sp, #0x138
	ldrltsb r6, [r4, #0x12]
	bl ov11_022E4600
	add r1, sp, #0x138
	mov r0, r7
	bl ov11_022E5314
	ldr r0, _022DED44 ; =0x0000012D
	add r1, sp, #0x138
	cmp r5, r0
	moveq r3, #1
	movne r3, #0
	mov r0, r7
	mov r2, r6
	and r3, r3, #0xff
	bl ov11_022F7354
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r1, [r0, #0xa]
	cmp r1, r7
	strneh r7, [r0, #0xa]
	ldrnesh r0, [r4, #8]
	cmpne r0, #1
	movne r0, #6
	bne _022E2478
	ldrsh r0, [r4, #8]
	cmp r0, #1
	bne _022E2474
	mov r0, r4
	bl ov11_022DC958
	cmp r0, #0
	ldrnesh r0, [r4, #0x10]
	cmpne r0, #0
	movne r0, #6
	moveq r0, #1
	streqh r0, [r4, #0x46]
	moveq r0, #3
	b _022E2478
	arm_func_end ov11_022DEBA4

	arm_func_start ov11_022DEC7C
ov11_022DEC7C: ; 0x022DEC7C
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0, lsl #0x10
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	mov r6, r5, asr #0x10
	bl ov11_022E4248
	mvn r2, #0
	mov r1, r0
	cmp r2, r5, asr #16
	ldreq r0, _022DED18 ; =ov11_02324E80
	ldreqsh r6, [r0, #8]
	add r0, sp, #0x130
	bl ov11_022E4600
	add r1, sp, #0x130
	mov r0, r6
	bl ov11_022E5258
	add r1, sp, #0x130
	mov r0, r6
	bl ov11_022F7500
	mov r0, #1
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022DEC7C

	arm_func_start ov11_022DECDC
ov11_022DECDC: ; 0x022DECDC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, r4
	strh r1, [r4, #0x44]
	bl ov11_022DCEEC
	cmp r0, #0
	beq _022E2474
	mov r0, #4
	b _022E2478
	.align 2, 0
_022DED08: .word 0x02318610
_022DED0C: .word 0x00000172
_022DED10: .word 0x023193EC
_022DED14: .word 0x02319410
_022DED18: .word ov11_02324E80
_022DED1C: .word 0x020A5490
_022DED20: .word 0x02319438
_022DED24: .word 0x020A548A
_022DED28: .word 0x02319458
_022DED2C: .word 0x02319478
_022DED30: .word 0x02316A44
_022DED34: .word 0x00000137
_022DED38: .word 0x00000135
_022DED3C: .word 0x00000132
_022DED40: .word 0x00000133
_022DED44: .word 0x0000012D
	arm_func_end ov11_022DECDC

	arm_func_start ov11_022DED48
ov11_022DED48: ; 0x022DED48
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022DD130
	b _022E2474
	arm_func_end ov11_022DED48

	arm_func_start ov11_022DED60
ov11_022DED60: ; 0x022DED60
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl sub_0204B3D0
	b _022E2474
	arm_func_end ov11_022DED60

	arm_func_start ov11_022DED7C
ov11_022DED7C: ; 0x022DED7C
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl ZinitScriptVariable
	b _022E2474
	arm_func_end ov11_022DED7C

	arm_func_start ov11_022DED98
ov11_022DED98: ; 0x022DED98
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r5, lsl #0x10
	mov r2, r0
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl SaveScriptVariableValue
	b _022E2474
	arm_func_end ov11_022DED98

	arm_func_start ov11_022DEDC4
ov11_022DEDC4: ; 0x022DEDC4
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, r5
	mov r2, r0
	add r0, r4, #0x6c
	bl sub_0204BED8
	b _022E2474
	arm_func_end ov11_022DEDC4

	arm_func_start ov11_022DEE00
ov11_022DEE00: ; 0x022DEE00
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, r5
	mov r2, r0
	add r0, r4, #0x6c
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_0204BF10
	b _022E2474
	arm_func_end ov11_022DEE00

	arm_func_start ov11_022DEE44
ov11_022DEE44: ; 0x022DEE44
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, r5, lsl #0x10
	mov r2, r2, lsr #0x10
	mov r3, r0
	add r0, r4, #0x6c
	bl SaveScriptVariableValueAtIndex
	b _022E2474
	arm_func_end ov11_022DEE44

	arm_func_start ov11_022DEE84
ov11_022DEE84: ; 0x022DEE84
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r3, r5, lsl #0x10
	mov r2, r0
	mov r1, r4
	mov r0, r3, asr #0x10
	bl SetScenarioScriptVar
	b _022E2474
	arm_func_end ov11_022DEE84

	arm_func_start ov11_022DEEBC
ov11_022DEEBC: ; 0x022DEEBC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r1, #0
	mov r2, r1
	mov r0, r0, asr #0x10
	bl SetScenarioScriptVar
	b _022E2474
	arm_func_end ov11_022DEEBC

	arm_func_start ov11_022DEEDC
ov11_022DEEDC: ; 0x022DEEDC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r0
	mov r0, r4
	and r1, r1, #0xff
	bl sub_0204CB2C
	b _022E2474
	arm_func_end ov11_022DEEDC

	arm_func_start ov11_022DEF04
ov11_022DEF04: ; 0x022DEF04
	mov r1, #0x27
	add r0, r4, #0x6c
	sub r2, r1, #0x28
	bl SaveScriptVariableValue
	add r0, r4, #0x6c
	mov r1, #0x2c
	mov r2, #0
	bl SaveScriptVariableValue
	b _022E2474
	arm_func_end ov11_022DEF04

	arm_func_start ov11_022DEF28
ov11_022DEF28: ; 0x022DEF28
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	mov r2, r7
	add r0, r4, #0x6c
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r2, r5
	add r0, r4, #0x6c
	mov r1, #0x2c
	bl SaveScriptVariableValue
	b _022E2474
	arm_func_end ov11_022DEF28

	arm_func_start ov11_022DEF64
ov11_022DEF64: ; 0x022DEF64
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r2, r4, lsl #0x10
	mov r1, r0
	mov r0, r2, asr #0x10
	bl sub_0204D018
	b _022E2474
	arm_func_end ov11_022DEF64

	arm_func_start ov11_022DEF8C
ov11_022DEF8C: ; 0x022DEF8C
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	cmp r4, #0x3e8
	blt _022DEFC0
	sub r0, r4, #0x3e8
	mov r1, #1
	bl sub_0204CA48
	ldr r0, _022DFE08 ; =0x02316B0C
	sub r1, r4, #0x3e8
	ldrb r0, [r0, r1]
	bl SetAdventureLogCompleted
	b _022E2474
_022DEFC0:
	ldr r0, _022DFE0C ; =0x02316CD0
	ldrb r0, [r0, r4]
	bl SetAdventureLogCompleted
	b _022E2474
_022DEFD0:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r5, lsl #0x10
	mov r2, r0
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	mov r3, #2
	bl sub_0204BF68
	cmp r0, #0
	ldrneh r0, [r6, #4]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF014:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r2, r0
	mov r1, r1, asr #0x10
	mov r3, r5
	add r0, r4, #0x6c
	bl sub_0204BF68
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF064:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	mov r1, r1, asr #0x10
	mov r3, r5
	add r0, r4, #0x6c
	bl sub_0204BF88
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF0B8:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r2, r0, lsl #0x10
	mov r1, r5, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	ldrneh r0, [r6, #4]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF0FC:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r5, lsl #0x10
	mov r5, r0
	mov r1, r1, asr #0x10
	add r0, r4, #0x6c
	bl LoadScriptVariableValueSum
	mov r1, r5
	mov r2, r7
	bl sub_0204BF5C
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF154:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r5
	bl sub_0204C6C8
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF1A0:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r5
	bl sub_0204C734
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF1EC:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r5
	bl sub_0204C7AC
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF238:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r5
	bl sub_0204C808
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF284:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r5
	bl sub_0204C880
	cmp r0, #0
	ldrneh r0, [r6, #6]
	ldrne r1, [r4, #0x14]
	addne r0, r1, r0, lsl #1
	strne r0, [r4, #0x1c]
	b _022E2474
_022DF2D0:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	mov r0, r7
	bl GetPerformanceFlagWithChecks
	cmp r5, r0
	ldreqh r0, [r6, #4]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
_022DF308:
	ldrh r0, [r6]
	bl ov11_022E48AC
	cmp r0, #0
	ldreqh r0, [r6, #2]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
_022DF328:
	ldrh r0, [r6]
	bl ov11_022E48AC
	cmp r0, #0
	ldreqh r0, [r6, #2]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
_022DF348:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	mov r0, #0xb
	bl GetDebugFlag1
	cmp r5, r0
	ldreqh r0, [r6, #2]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
	arm_func_end ov11_022DEF8C

	arm_func_start ov11_022DF374
ov11_022DF374: ; 0x022DF374
	sub r0, r0, #0x33
	sub r0, r5, r0
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022DF6D8
_022DF388: ; jump table
	b _022DF3BC ; case 0
	b _022DF520 ; case 1
	b _022DF59C ; case 2
	b _022DF640 ; case 3
	b _022DF53C ; case 4
	b _022DF4E8 ; case 5
	b _022DF504 ; case 6
	b _022DF484 ; case 7
	b _022DF4A0 ; case 8
	b _022DF4C4 ; case 9
	b _022DF498 ; case 10
	b _022DF3DC ; case 11
	b _022DF424 ; case 12
_022DF3BC:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValue
	mov r7, r0
	b _022DF6FC
_022DF3DC:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r5, lsl #0x10
	mov r5, r0
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValue
	mov r1, r5
	mov r2, r7
	bl sub_0204BECC
	mov r7, r0
	b _022DF6FC
_022DF424:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r5, lsl #0x10
	mov r5, r0
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValue
	mov r1, r5, lsl #0x10
	mov r1, r1, asr #0x10
	mov r5, r0
	add r0, r4, #0x6c
	bl LoadScriptVariableValue
	mov r2, r7
	mov r1, r0
	mov r0, r5
	bl sub_0204BECC
	mov r7, r0
	b _022DF6FC
_022DF484:
	ldrh r0, [r6]
	bl ov11_022E48AC
	bl RandInt
	mov r7, r0
	b _022DF6FC
_022DF498:
	ldrsb r7, [r4, #0x12]
	b _022DF6FC
_022DF4A0:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	mov r0, #0
	mov r2, r0
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r7, r0
	b _022DF6FC
_022DF4C4:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r7, r0
	b _022DF6FC
_022DF4E8:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDungeonMode
	mov r7, r0
	b _022DF6FC
_022DF504:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02065974
	mov r7, r0
	b _022DF6FC
_022DF520:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x14]
	add r1, sp, #0xf
	blx r2
	ldrsb r7, [sp, #0xf]
	b _022DF6FC
_022DF53C:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x128
	blx r2
	ldr r3, [sp, #0x128]
	ldr r2, [sp, #0x12c]
	add r1, sp, #0x120
	mov r0, r6
	str r3, [sp, #0x120]
	str r2, [sp, #0x124]
	bl ov11_022E490C
	ldr r3, [sp, #0x120]
	ldr r2, [sp, #0x128]
	ldr r1, [sp, #0x124]
	ldr r0, [sp, #0x12c]
	sub r2, r3, r2
	sub r1, r1, r0
	add r0, sp, #0x118
	str r2, [sp, #0x118]
	str r1, [sp, #0x11c]
	bl sub_020055C8
	mov r7, r0
	b _022DF6FC
_022DF59C:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	movs r5, r0
	bmi _022DF638
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x110
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #8]
	add r1, sp, #0x100
	blx r2
	add r1, sp, #0x108
	mov r0, r5
	bl ov11_022F90F4
	mov r0, r5
	add r1, sp, #0xf8
	bl ov11_022F90B4
	add r0, sp, #0x110
	add r1, sp, #0x100
	add r2, sp, #0x108
	add r3, sp, #0xf8
	bl sub_020058A8
	mov r7, r0
	mvn r0, #0
	cmp r7, r0
	bne _022DF6FC
	ldr r1, _022DFE10 ; =0x02316A60
	add r0, sp, #0x110
	add r2, sp, #0x108
	mov r3, r1
	bl sub_020057A8
	mov r7, r0
	b _022DF6FC
_022DF638:
	mvn r7, #0
	b _022DF6FC
_022DF640:
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	movs r5, r0
	bmi _022DF6D0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0xf0
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #8]
	add r1, sp, #0xe0
	blx r2
	add r1, sp, #0xe8
	mov r0, r5
	bl ov11_022F90F4
	ldr r3, _022DFE10 ; =0x02316A60
	add r0, sp, #0xf0
	add r1, sp, #0xe0
	add r2, sp, #0xe8
	bl sub_020058A8
	mov r7, r0
	mvn r0, #0
	cmp r7, r0
	bne _022DF6FC
	ldr r1, _022DFE10 ; =0x02316A60
	add r0, sp, #0xf0
	add r2, sp, #0xe8
	mov r3, r1
	bl sub_020057A8
	mov r7, r0
	b _022DF6FC
_022DF6D0:
	mvn r7, #0
	b _022DF6FC
_022DF6D8:
	ldr r1, _022DED30 ; =0x02316A44
	add r0, sp, #0xd8
	ldr r3, [r1, #0x58]
	ldr r6, [r1, #0x54]
	ldr r1, _022DFE14 ; =0x02319498
	mov r2, r5
	str r6, [sp, #0xd8]
	str r3, [sp, #0xdc]
	bl FatalError
_022DF6FC:
	mov r0, r4
	mov r1, r7
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2474
	arm_func_end ov11_022DF374

	arm_func_start ov11_022DF710
ov11_022DF710: ; 0x022DF710
	ldr r1, _022DFE18 ; =0x02324ECC
	mov r2, #0x60000
	ldr r0, _022DFE1C ; =0x02324EA4
	str r2, [r1, #0x4c]
	bl InitPortraitBox
	b _022E2474
	arm_func_end ov11_022DF710

	arm_func_start ov11_022DF728
ov11_022DF728: ; 0x022DF728
	ldr r1, _022DFE18 ; =0x02324ECC
	mov r2, #0x70000
	ldr r0, _022DFE1C ; =0x02324EA4
	str r2, [r1, #0x4c]
	bl InitPortraitBox
	b _022E2474
	arm_func_end ov11_022DF728

	arm_func_start ov11_022DF740
ov11_022DF740: ; 0x022DF740
	ldrh r0, [r6]
	bl ov11_022E48AC
	orr r2, r0, #0x10000
	ldr r1, _022DFE18 ; =0x02324ECC
	ldr r0, _022DFE1C ; =0x02324EA4
	str r2, [r1, #0x4c]
	bl InitPortraitBox
	b _022E2474
	arm_func_end ov11_022DF740

	arm_func_start ov11_022DF760
ov11_022DF760: ; 0x022DF760
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r7, lsl #0x10
	mov r4, r0
	mov r0, r1, asr #0x10
	bl sub_02065974
	mov r1, r0, lsl #0x10
	ldr r2, _022DFE18 ; =0x02324ECC
	orr r3, r7, #0x10000
	ldr r0, _022DFE1C ; =0x02324EA4
	mov r1, r1, asr #0x10
	str r3, [r2, #0x4c]
	bl InitPortraitBoxWithMonsterId
	mov r1, r5, lsl #0x18
	ldr r0, _022DFE1C ; =0x02324EA4
	mov r1, r1, asr #0x18
	bl SetPortraitExpressionId
	ldr r0, _022DFE1C ; =0x02324EA4
	and r1, r4, #0xff
	bl SetPortraitUnknownAttr
	b _022E2474
	arm_func_end ov11_022DF760

	arm_func_start ov11_022DF7CC
ov11_022DF7CC: ; 0x022DF7CC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r4, r0
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r3, #0x60000
	mov r0, r1, asr #0x10
	str r3, [r2, #0x4c]
	bl sub_02065974
	mov r1, r0
	ldr r0, _022DFE1C ; =0x02324EA4
	bl InitPortraitBoxWithMonsterId
	mov r1, r5, lsl #0x18
	ldr r0, _022DFE1C ; =0x02324EA4
	mov r1, r1, asr #0x18
	bl SetPortraitExpressionId
	ldr r0, _022DFE1C ; =0x02324EA4
	and r1, r4, #0xff
	bl SetPortraitUnknownAttr
	b _022E2474
	arm_func_end ov11_022DF7CC

	arm_func_start ov11_022DF834
ov11_022DF834: ; 0x022DF834
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r4, r0
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r3, #0x70000
	mov r0, r1, asr #0x10
	str r3, [r2, #0x4c]
	bl sub_02065974
	mov r1, r0
	ldr r0, _022DFE1C ; =0x02324EA4
	bl InitPortraitBoxWithMonsterId
	mov r1, r5, lsl #0x18
	ldr r0, _022DFE1C ; =0x02324EA4
	mov r1, r1, asr #0x18
	bl SetPortraitExpressionId
	ldr r0, _022DFE1C ; =0x02324EA4
	and r1, r4, #0xff
	bl SetPortraitUnknownAttr
	b _022E2474
	arm_func_end ov11_022DF834

	arm_func_start ov11_022DF89C
ov11_022DF89C: ; 0x022DF89C
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r1, r0
	ldr r0, _022DFE1C ; =0x02324EA4
	and r1, r1, #0xff
	bl SetPortraitUnknownAttr
	b _022E2474
	arm_func_end ov11_022DF89C

	arm_func_start ov11_022DF8B8
ov11_022DF8B8: ; 0x022DF8B8
	ldr r0, _022DED30 ; =0x02316A44
	ldr r1, [r0, #0x80]
	ldr r0, [r0, #0x7c]
	str r1, [sp, #0xd4]
	str r0, [sp, #0xd0]
	ldrh r0, [r6]
	bl ov11_022E48AC
	str r0, [sp, #0xd0]
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	str r0, [sp, #0xd4]
	ldr r0, _022DFE1C ; =0x02324EA4
	add r1, sp, #0xd0
	bl SetPortraitAttrStruct
	b _022E2474
	arm_func_end ov11_022DF8B8

	arm_func_start ov11_022DF8F4
ov11_022DF8F4: ; 0x022DF8F4
	ldrh r0, [r6]
	bl ov11_022E48AC
	ldr r1, _022DED18 ; =ov11_02324E80
	str r0, [r1, #0xc]
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r2, _022DED18 ; =ov11_02324E80
	mov r1, r0
	str r1, [r2, #0x10]
	ldr r0, [r2, #0xc]
	bl sub_02034E60
	b _022E2474
	arm_func_end ov11_022DF8F4

	arm_func_start ov11_022DF924
ov11_022DF924: ; 0x022DF924
	mov r0, #5
	b _022E2478
	arm_func_end ov11_022DF924

	arm_func_start ov11_022DF92C
ov11_022DF92C: ; 0x022DF92C
	ldrh r1, [r6]
	add r0, r4, #0x14
	bl ov11_022E4248
	mov r4, r0
	ldr r1, _022DFE20 ; =0x023194B0
	mov r0, #2
	bl DebugPrint
	cmp r5, #0x9e
	cmpne r5, #0xae
	bne _022DF960
	ldr r0, _022DFE1C ; =0x02324EA4
	bl sub_02034E28
	b _022DF968
_022DF960:
	ldr r0, _022DFE24 ; =0x02324E94
	bl sub_02034E28
_022DF968:
	ldr r0, _022DED18 ; =ov11_02324E80
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movge r1, #0x20
	movlt r1, #0
	cmp r5, #0xa0
	bgt _022DF9AC
	subs r0, r5, #0x9a
	addpl pc, pc, r0, lsl #2
	b _022DFA48
_022DF990: ; jump table
	b _022DFA30 ; case 0
	b _022DFA48 ; case 1
	b _022DFA14 ; case 2
	b _022DFA48 ; case 3
	b _022DF9D8 ; case 4
	b _022DFA48 ; case 5
	b _022DF9B8 ; case 6
_022DF9AC:
	cmp r5, #0xae
	beq _022DF9F4
	b _022DFA48
_022DF9B8:
	orr r0, r1, #8
	orr r0, r0, #0x400
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DF9D8:
	orr r0, r1, #8
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DF9F4:
	orr r0, r1, #8
	orr r0, r0, #0x3000
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DFA14:
	orr r0, r1, #8
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DFA30:
	orr r0, r1, #4
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
_022DFA48:
	mov r0, #5
	b _022E2478
	arm_func_end ov11_022DF92C

	arm_func_start ov11_022DFA50
ov11_022DFA50: ; 0x022DFA50
	ldrh r1, [r6]
	add r0, r4, #0x14
	bl ov11_022E4248
	ldr r3, _022DED18 ; =ov11_02324E80
	ldr r1, _022DFE18 ; =0x02324ECC
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x10]
	bl ov11_02300ACC
	mov r0, #5
	b _022E2478
	arm_func_end ov11_022DFA50

	arm_func_start ov11_022DFA78
ov11_022DFA78: ; 0x022DFA78
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	bl ov11_022E4248
	ldr r2, _022DED18 ; =ov11_02324E80
	ldr r1, _022DFE18 ; =0x02324ECC
	ldr r3, [r2, #0xc]
	mov r2, r5
	bl ov11_02300728
	mov r0, #5
	b _022E2478
	arm_func_end ov11_022DFA78

	arm_func_start ov11_022DFAAC
ov11_022DFAAC: ; 0x022DFAAC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldr r1, _022DFE28 ; =0x023194C0
	mov r0, #2
	mov r6, #0
	bl DebugPrint
	ldr r0, _022DED18 ; =ov11_02324E80
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movge r8, #0x20
	movlt r8, r6
	cmp r5, #0
	cmpne r5, #1
	beq _022DFAF4
	cmp r5, #2
	beq _022DFC30
	b _022DFC44
_022DFAF4:
	mov r0, #0x2f
	bl GetActorMatchingStorageId
	mov r7, r0
	cmp r5, #0
	moveq sb, #4
	ldr r0, _022DFE1C ; =0x02324EA4
	movne sb, #5
	bl sub_02034E28
	ldr ip, _022DFE18 ; =0x02324ECC
	add fp, sp, #0x278
	mov sl, #5
_022DFB20:
	ldmia ip!, {r0, r1, r2, r3}
	stmia fp!, {r0, r1, r2, r3}
	subs sl, sl, #1
	bne _022DFB20
	ldr r1, _022DFE2C ; =0x0001002F
	mvn r0, #0
	str r1, [sp, #0x27c]
	cmp r7, r0
	beq _022DFBF0
	mov r0, r7
	bl sub_02055410
	cmp r0, #0
	beq _022DFB78
	orr r0, r8, #8
	orr r0, r0, #0x3000
	mov r0, r0, lsl #0x10
	ldr r1, _022DFE30 ; =0x0000025E
	ldr r2, _022DFE18 ; =0x02324ECC
	mov r0, r0, lsr #0x10
	bl sub_02034EB4
	mov r0, #5
	b _022E2478
_022DFB78:
	mov r0, r7
	bl sub_02055474
	cmp r0, #0
	beq _022DFBF0
	cmp r5, #1
	bne _022DFBDC
	mov r0, #0
	mov r1, #0x43
	bl LoadScriptVariableValue
	add r0, r0, #0xaf
	add r0, r0, #0x400
	mov r0, r0, lsl #0x10
	mov r1, sb
	mov r0, r0, asr #0x10
	mov r2, #0
	bl GetTalkLine
	orr r1, r8, #8
	orr r1, r1, #0x3000
	mov r3, r1, lsl #0x10
	mov r1, r0
	add r2, sp, #0x278
	mov r0, r3, lsr #0x10
	bl sub_02034EB4
	mov r0, #5
	b _022E2478
_022DFBDC:
	mov r0, #0xb
	mov r1, #0
	bl ov11_022F7188
	mov r0, #1
	b _022E2478
_022DFBF0:
	mov r0, #0x2f
	bl sub_02065974
	cmp r0, #0
	mvneq r6, #0
	beq _022DFC44
	mov r1, sb
	mov r2, #0
	bl GetTalkLine
	orr r1, r8, #8
	orr r1, r1, #0x3000
	mov r3, r1, lsl #0x10
	mov r1, r0
	add r2, sp, #0x278
	mov r0, r3, lsr #0x10
	bl sub_02034EB4
	b _022DFC44
_022DFC30:
	mov r0, #0xb
	mov r1, #0
	bl ov11_022F7188
	mov r0, #1
	b _022E2478
_022DFC44:
	cmp r6, #0
	moveq r0, #5
	beq _022E2478
	mov r0, r4
	mov r1, r6
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2474
_022DFC64:
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r0, [r0, #6]
	bl ov11_022F46B4
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl ov11_022F7D18
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl ov11_022F1244
	mov r0, #4
	b _022E2478
	arm_func_end ov11_022DFAAC

	arm_func_start ov11_022DFC94
ov11_022DFC94: ; 0x022DFC94
	ldrh r0, [r6]
	ldr r5, [r4, #0x1c]
	bl ov11_022E48AC
	mov r6, r0
	mov r1, r6, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValue
	strh r0, [r4, #0x44]
	ldrsh r2, [r4, #0x44]
	ldr r1, _022DFE34 ; =0x023194D8
	mov r3, r6
	mov r0, #2
	bl DebugPrint
	mov r7, #2
	ldr r6, _022DFE38 ; =0x023194F4
	b _022DFD0C
_022DFCD8:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r8, r0
	mov r0, r7
	mov r1, r6
	mov r2, r8
	bl DebugPrint
	ldrsh r0, [r4, #0x44]
	cmp r8, r0
	streq r5, [r4, #0x1c]
	moveq r0, #5
	beq _022E2478
	add r5, r5, #6
_022DFD0C:
	ldrh r0, [r5]
	cmp r0, #0x67
	beq _022DFCD8
	str r5, [r4, #0x1c]
	ldrh r0, [r5]
	cmp r0, #0x6e
	bne _022E2474
	ldr r1, _022DFE3C ; =0x02319504
	mov r0, #2
	bl DebugPrint
	mvn r0, #0
	strh r0, [r4, #0x44]
	mov r0, #5
	b _022E2478
	arm_func_end ov11_022DFC94

	arm_func_start ov11_022DFD44
ov11_022DFD44: ; 0x022DFD44
	ldr r0, _022DFE40 ; =0x0000524C
	mov r1, #8
	ldr r7, [r4, #0x1c]
	bl MemAlloc
	ldr r1, _022DFE44 ; =0x02324C64
	cmp r5, #0xab
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	ldr r0, [r1]
	movne r8, #0x72
	str r2, [r0, #4]
	bne _022DFD88
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_022DFD88:
	mov fp, #0
	ldr r5, _022DFE44 ; =0x02324C64
	b _022DFED8
_022DFD94:
	ldr r2, [r5]
	cmp r8, #0x72
	ldr r0, [r2]
	add r1, r2, #8
	add r0, r0, r0, lsl #6
	add sb, r1, r0, lsl #2
	beq _022DFDE8
	ldr r1, [r2, #4]
	mov r0, #0
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r1, r8
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	bne _022DFDE8
	ldr r1, [r5]
	add r7, r7, #6
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	b _022DFED8
_022DFDE8:
	ldrh r0, [r7]
	cmp r0, #0x64
	bne _022DFE58
	ldrh r1, [r7, #2]
	add r0, r4, #0x14
	bl ov11_022E4248
	mov sl, r0
	b _022DFE70
	.align 2, 0
_022DFE08: .word 0x02316B0C
_022DFE0C: .word 0x02316CD0
_022DFE10: .word 0x02316A60
_022DFE14: .word 0x02319498
_022DFE18: .word 0x02324ECC
_022DFE1C: .word 0x02324EA4
_022DFE20: .word 0x023194B0
_022DFE24: .word 0x02324E94
_022DFE28: .word 0x023194C0
_022DFE2C: .word 0x0001002F
_022DFE30: .word 0x0000025E
_022DFE34: .word 0x023194D8
_022DFE38: .word 0x023194F4
_022DFE3C: .word 0x02319504
_022DFE40: .word 0x0000524C
_022DFE44: .word 0x02324C64
_022DFE48: .word 0x0000C402
_022DFE4C: .word 0x02319518
_022DFE50: .word 0x02319534
_022DFE54: .word 0x02319554
_022DFE58:
	ldrh r0, [r7, #2]
	bl ov11_022E48AC
	add sl, sp, #0x178
	mov r1, r0
	mov r0, sl
	bl ov11_022E6FD8
_022DFE70:
	ldr r3, _022DFE48 ; =0x0000C402
	str fp, [sp]
	mov r0, sb
	mov r1, #0x100
	mov r2, sl
	bl PreprocessString
	ldr r1, [r5]
	mov r0, #2
	ldr r2, [r1, #4]
	ldr r1, _022DFE4C ; =0x02319518
	add r2, r2, #1
	str r2, [sb, #0x100]
	ldrh r2, [r7, #4]
	ldr r3, [r5]
	stmia sp, {r2, sl}
	ldmia r3, {r2, r3}
	bl DebugPrint
	ldr r1, [r5]
	add r7, r7, #6
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
	ldr r1, [r5]
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
_022DFED8:
	ldrh r0, [r7]
	cmp r0, #0x64
	cmpne r0, #0x65
	beq _022DFD94
	ldr r0, _022DFE44 ; =0x02324C64
	str r7, [r4, #0x1c]
	ldr r0, [r0]
	ldr r1, _022DFE50 ; =0x02319534
	ldmia r0, {r2, r3}
	mov r0, #2
	bl DebugPrint
	ldr r0, _022DFE44 ; =0x02324C64
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r1, #0
	ble _022DFFAC
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldr r1, _022DFE54 ; =0x02319554
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl DebugPrint
	ldr r1, _022DFE44 ; =0x02324C64
	mov r2, #0
	ldr r3, [r1]
	cmp r5, #0
	ldr r0, [r3]
	add r0, r0, r0, lsl #6
	add r0, r3, r0, lsl #2
	strb r2, [r0, #8]
	ldr r1, [r1]
	ldr r0, [r1]
	add r0, r0, r0, lsl #6
	add r0, r1, r0, lsl #2
	str r2, [r0, #0x108]
	ldr r1, _022DFE44 ; =0x02324C64
	movne r0, #0x13
	ldr r3, [r1]
	moveq r0, #0x11
	ldr r1, [r3]
	mov r2, r4
	cmp r1, #8
	add r1, r3, #8
	orrgt r0, r0, #0x8000
	mov r3, #0x14
	bl sub_02035024
	mov r0, #5
	b _022E2478
_022DFFAC:
	bl MemFree
	ldr r0, _022DFE44 ; =0x02324C64
	mov r1, #0
	str r1, [r0]
	b _022E2474
	arm_func_end ov11_022DFD44

	arm_func_start ov11_022DFFC0
ov11_022DFFC0: ; 0x022DFFC0
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	bl ov11_022E9B0C
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022DFFC0

	arm_func_start ov11_022DFFE8
ov11_022DFFE8: ; 0x022DFFE8
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	cmp r5, #0xdb
	bne _022E000C
	bl ov11_022E9B24
	b _022E0010
_022E000C:
	bl ov11_022E9B40
_022E0010:
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022DFFE8

	arm_func_start ov11_022E0020
ov11_022E0020: ; 0x022E0020
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	cmp r5, #0xd7
	bne _022E0078
	sub r1, r8, #0x100
	sub r0, r0, #0x100
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	bl ov11_022E9B5C
	b _022E0098
_022E0078:
	rsb r1, r8, #0x100
	rsb r0, r0, #0x100
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	bl ov11_022E9B5C
_022E0098:
	cmp r7, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E0020

	arm_func_start ov11_022E00A8
ov11_022E00A8: ; 0x022E00A8
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	bl ov11_022E9B84
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E00A8

	arm_func_start ov11_022E00D0
ov11_022E00D0: ; 0x022E00D0
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	cmp r5, #0xdc
	bne _022E00F4
	bl ov11_022E9BD0
	b _022E00F8
_022E00F4:
	bl ov11_022E9C20
_022E00F8:
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E00D0

	arm_func_start ov11_022E0108
ov11_022E0108: ; 0x022E0108
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	cmp r5, #0xd8
	bne _022E0160
	sub r1, r8, #0x100
	sub r0, r0, #0x100
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	bl ov11_022E9C70
	b _022E0180
_022E0160:
	rsb r1, r8, #0x100
	rsb r0, r0, #0x100
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	bl ov11_022E9C70
_022E0180:
	cmp r7, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E0108

	arm_func_start ov11_022E0190
ov11_022E0190: ; 0x022E0190
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	bl ov11_022E9C98
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E0190

	arm_func_start ov11_022E01B8
ov11_022E01B8: ; 0x022E01B8
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	cmp r5, #0xea
	bne _022E01DC
	bl ov11_022E9CB0
	b _022E01E0
_022E01DC:
	bl ov11_022E9CCC
_022E01E0:
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E01B8

	arm_func_start ov11_022E01F0
ov11_022E01F0: ; 0x022E01F0
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	cmp r5, #0xe6
	bne _022E0248
	sub r1, r8, #0x100
	sub r0, r0, #0x100
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	bl ov11_022E9CE8
	b _022E0268
_022E0248:
	rsb r1, r8, #0x100
	rsb r0, r0, #0x100
	mov r1, r1, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x10
	bl ov11_022E9CE8
_022E0268:
	cmp r7, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E01F0

	arm_func_start ov11_022E0278
ov11_022E0278: ; 0x022E0278
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	mov sb, r0
	ldrh r0, [r6, #8]
	bl ov11_022E48AC
	mov sl, r0
	ldrh r0, [r6, #0xa]
	bl ov11_022E48AC
	ldr r6, _022E1218 ; =0x02316A44
	add r3, sp, #0xcc
	mov r2, #4
_022E02C8:
	ldrb r1, [r6], #1
	subs r2, r2, #1
	strb r1, [r3], #1
	bne _022E02C8
	strb sb, [sp, #0xcc]
	strb sl, [sp, #0xcd]
	strb r0, [sp, #0xce]
	cmp r5, #0xed
	bgt _022E0310
	bge _022E0344
	cmp r5, #0xdf
	bgt _022E0368
	cmp r5, #0xde
	blt _022E0368
	beq _022E031C
	cmp r5, #0xdf
	beq _022E0330
	b _022E0368
_022E0310:
	cmp r5, #0xee
	beq _022E0358
	b _022E0368
_022E031C:
	add r2, sp, #0xcc
	mov r0, r8
	mov r1, r7
	bl ov11_022E9D44
	b _022E0368
_022E0330:
	add r2, sp, #0xcc
	mov r0, r8
	mov r1, r7
	bl ov11_022E9D6C
	b _022E0368
_022E0344:
	add r2, sp, #0xcc
	mov r0, r8
	mov r1, r7
	bl ov11_022E9D94
	b _022E0368
_022E0358:
	add r2, sp, #0xcc
	mov r0, r8
	mov r1, r7
	bl ov11_022E9DBC
_022E0368:
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E0278

	arm_func_start ov11_022E0378
ov11_022E0378: ; 0x022E0378
	ldrh r0, [r6]
	bl ov11_022E48AC
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E0378

	arm_func_start ov11_022E038C
ov11_022E038C: ; 0x022E038C
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	sub r0, r0, r5
	bl RandInt
	add r0, r5, r0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E038C

	arm_func_start ov11_022E03B8
ov11_022E03B8: ; 0x022E03B8
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E03B8

	arm_func_start ov11_022E03C0
ov11_022E03C0: ; 0x022E03C0
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E03C0

	arm_func_start ov11_022E03C8
ov11_022E03C8: ; 0x022E03C8
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E03C8

	arm_func_start ov11_022E03D0
ov11_022E03D0: ; 0x022E03D0
	mov r0, #4
	b _022E2478
	arm_func_end ov11_022E03D0

	arm_func_start ov11_022E03D8
ov11_022E03D8: ; 0x022E03D8
	mov r0, #4
	b _022E2478
	arm_func_end ov11_022E03D8

	arm_func_start ov11_022E03E0
ov11_022E03E0: ; 0x022E03E0
	mov r0, #3
	b _022E2478
	arm_func_end ov11_022E03E0

	arm_func_start ov11_022E03E8
ov11_022E03E8: ; 0x022E03E8
	mov r0, #4
	b _022E2478
	arm_func_end ov11_022E03E8

	arm_func_start ov11_022E03F0
ov11_022E03F0: ; 0x022E03F0
	mov r0, #4
	b _022E2478
	arm_func_end ov11_022E03F0

	arm_func_start ov11_022E03F8
ov11_022E03F8: ; 0x022E03F8
	mov r0, #3
	b _022E2478
_022E0400:
	add r0, r4, #0x14
	add r5, r4, #0x24
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	arm_func_end ov11_022E03F8

	arm_func_start ov11_022E0410
ov11_022E0410: ; 0x022E0410
	ldrh r0, [r6]
	ldr r1, [r4, #0x14]
	add r0, r1, r0, lsl #1
	str r0, [r4, #0x1c]
	b _022E2474
_022E0424:
	add r0, r4, #0x14
	add r5, r4, #0x24
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldrh r0, [r6]
	bl ov11_022E48AC
	mov r5, r0
	ldr r1, _022E121C ; =0x0231956C
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	mov r1, r5, lsl #0x10
	add r0, sp, #0x15c
	mov r1, r1, asr #0x10
	bl ov11_022E7FB8
	cmp r0, #0
	beq _022E0484
	ldr r0, [sp, #0x160]
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x15c]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x164]
	str r0, [r4, #0x20]
	b _022E2474
_022E0484:
	mov r0, #6
	b _022E2478
	arm_func_end ov11_022E0410

	arm_func_start ov11_022E048C
ov11_022E048C: ; 0x022E048C
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	moveq r0, #0
	beq _022E2478
	add r0, r4, #0x24
	add r5, r4, #0x14
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r4, #0x2c]
	b _022E2474
	arm_func_end ov11_022E048C

	arm_func_start ov11_022E04B8
ov11_022E04B8: ; 0x022E04B8
	mov r0, #0
	str r0, [r4, #0x2c]
	b _022E2474
	arm_func_end ov11_022E04B8

	arm_func_start ov11_022E04C4
ov11_022E04C4: ; 0x022E04C4
	mov r0, #0
	b _022E2478
	arm_func_end ov11_022E04C4

	arm_func_start ov11_022E04CC
ov11_022E04CC: ; 0x022E04CC
	mov r0, #1
	b _022E2478
	arm_func_end ov11_022E04CC

	arm_func_start ov11_022E04D4
ov11_022E04D4: ; 0x022E04D4
	mov r0, #6
	b _022E2478
_022E04DC:
	ldr r6, [r4, #0x34]
	ldrh r7, [r6]
	cmp r7, #0xc4
	bgt _022E0740
	bge _022E1020
	cmp r7, #0xb7
	bgt _022E06BC
	bge _022E1094
	cmp r7, #0xb2
	bgt _022E0688
	bge _022E105C
	cmp r7, #0xaf
	bgt _022E066C
	bge _022E105C
	sub r0, r7, #0x39
	cmp r0, #0x51
	addls pc, pc, r0, lsl #2
	b _022E199C
_022E0524: ; jump table
	b _022E17B0 ; case 0
	b _022E17DC ; case 1
	b _022E1760 ; case 2
	b _022E1820 ; case 3
	b _022E1820 ; case 4
	b _022E18A8 ; case 5
	b _022E18D4 ; case 6
	b _022E1858 ; case 7
	b _022E199C ; case 8
	b _022E1928 ; case 9
	b _022E16C4 ; case 10
	b _022E16F0 ; case 11
	b _022E1674 ; case 12
	b _022E1734 ; case 13
	b _022E1734 ; case 14
	b _022E15D8 ; case 15
	b _022E155C ; case 16
	b _022E15F4 ; case 17
	b _022E159C ; case 18
	b _022E1624 ; case 19
	b _022E17B0 ; case 20
	b _022E17DC ; case 21
	b _022E1760 ; case 22
	b _022E1820 ; case 23
	b _022E1820 ; case 24
	b _022E18A8 ; case 25
	b _022E18D4 ; case 26
	b _022E1858 ; case 27
	b _022E199C ; case 28
	b _022E1928 ; case 29
	b _022E16C4 ; case 30
	b _022E16F0 ; case 31
	b _022E1674 ; case 32
	b _022E1734 ; case 33
	b _022E1734 ; case 34
	b _022E15D8 ; case 35
	b _022E155C ; case 36
	b _022E15F4 ; case 37
	b _022E159C ; case 38
	b _022E1624 ; case 39
	b _022E199C ; case 40
	b _022E199C ; case 41
	b _022E199C ; case 42
	b _022E199C ; case 43
	b _022E199C ; case 44
	b _022E199C ; case 45
	b _022E199C ; case 46
	b _022E199C ; case 47
	b _022E199C ; case 48
	b _022E199C ; case 49
	b _022E199C ; case 50
	b _022E199C ; case 51
	b _022E199C ; case 52
	b _022E199C ; case 53
	b _022E199C ; case 54
	b _022E199C ; case 55
	b _022E0B44 ; case 56
	b _022E199C ; case 57
	b _022E199C ; case 58
	b _022E199C ; case 59
	b _022E199C ; case 60
	b _022E199C ; case 61
	b _022E199C ; case 62
	b _022E199C ; case 63
	b _022E199C ; case 64
	b _022E199C ; case 65
	b _022E199C ; case 66
	b _022E199C ; case 67
	b _022E199C ; case 68
	b _022E199C ; case 69
	b _022E199C ; case 70
	b _022E199C ; case 71
	b _022E199C ; case 72
	b _022E199C ; case 73
	b _022E199C ; case 74
	b _022E199C ; case 75
	b _022E199C ; case 76
	b _022E199C ; case 77
	b _022E199C ; case 78
	b _022E199C ; case 79
	b _022E199C ; case 80
	b _022E0CE8 ; case 81
_022E066C:
	cmp r7, #0xb0
	bgt _022E067C
	beq _022E105C
	b _022E199C
_022E067C:
	cmp r7, #0xb1
	beq _022E105C
	b _022E199C
_022E0688:
	cmp r7, #0xb4
	bgt _022E06A0
	bge _022E105C
	cmp r7, #0xb3
	beq _022E105C
	b _022E199C
_022E06A0:
	cmp r7, #0xb5
	bgt _022E06B0
	beq _022E105C
	b _022E199C
_022E06B0:
	cmp r7, #0xb6
	beq _022E1094
	b _022E199C
_022E06BC:
	cmp r7, #0xbe
	bgt _022E06FC
	bge _022E14F8
	cmp r7, #0xbb
	bgt _022E06E0
	bge _022E1094
	cmp r7, #0xb9
	beq _022E1094
	b _022E199C
_022E06E0:
	cmp r7, #0xbc
	bgt _022E06F0
	beq _022E1094
	b _022E199C
_022E06F0:
	cmp r7, #0xbd
	beq _022E1420
	b _022E199C
_022E06FC:
	cmp r7, #0xc1
	bgt _022E0724
	bge _022E1020
	cmp r7, #0xbf
	bgt _022E0718
	beq _022E1020
	b _022E199C
_022E0718:
	cmp r7, #0xc0
	beq _022E1020
	b _022E199C
_022E0724:
	cmp r7, #0xc2
	bgt _022E0734
	beq _022E1020
	b _022E199C
_022E0734:
	cmp r7, #0xc3
	beq _022E1020
	b _022E199C
_022E0740:
	cmp r7, #0xd2
	bgt _022E07C0
	bge _022E0A40
	cmp r7, #0xca
	bgt _022E078C
	bge _022E0C4C
	cmp r7, #0xc6
	bgt _022E0770
	bge _022E1020
	cmp r7, #0xc5
	beq _022E1020
	b _022E199C
_022E0770:
	cmp r7, #0xc7
	bgt _022E0780
	beq _022E1520
	b _022E199C
_022E0780:
	cmp r7, #0xc8
	beq _022E1460
	b _022E199C
_022E078C:
	cmp r7, #0xce
	bgt _022E07A4
	bge _022E14C4
	cmp r7, #0xcd
	beq _022E14C4
	b _022E199C
_022E07A4:
	cmp r7, #0xd0
	bgt _022E07B4
	beq _022E094C
	b _022E199C
_022E07B4:
	cmp r7, #0xd1
	beq _022E09B0
	b _022E199C
_022E07C0:
	cmp r7, #0xff
	bgt _022E0800
	bge _022E0B78
	cmp r7, #0xd4
	bgt _022E07E4
	bge _022E0C78
	cmp r7, #0xd3
	beq _022E09F8
	b _022E199C
_022E07E4:
	cmp r7, #0xd6
	bgt _022E07F4
	beq _022E0DB0
	b _022E199C
_022E07F4:
	cmp r7, #0xfd
	beq _022E0A64
	b _022E199C
_022E0800:
	ldr r1, _022E1220 ; =0x00000129
	cmp r7, r1
	bgt _022E08DC
	sub r0, r1, #0x27
	subs r0, r7, r0
	addpl pc, pc, r0, lsl #2
	b _022E08BC
_022E081C: ; jump table
	b _022E0BEC ; case 0
	b _022E092C ; case 1
	b _022E1000 ; case 2
	b _022E098C ; case 3
	b _022E0CA4 ; case 4
	b _022E0A1C ; case 5
	b _022E0E8C ; case 6
	b _022E0E60 ; case 7
	b _022E0F8C ; case 8
	b _022E0FC8 ; case 9
	b _022E0ED0 ; case 10
	b _022E0F14 ; case 11
	b _022E09D4 ; case 12
	b _022E0AA8 ; case 13
	b _022E105C ; case 14
	b _022E105C ; case 15
	b _022E105C ; case 16
	b _022E105C ; case 17
	b _022E105C ; case 18
	b _022E105C ; case 19
	b _022E105C ; case 20
	b _022E1094 ; case 21
	b _022E1094 ; case 22
	b _022E199C ; case 23
	b _022E1094 ; case 24
	b _022E199C ; case 25
	b _022E1094 ; case 26
	b _022E1094 ; case 27
	b _022E14F8 ; case 28
	b _022E1020 ; case 29
	b _022E1020 ; case 30
	b _022E1020 ; case 31
	b _022E1020 ; case 32
	b _022E1020 ; case 33
	b _022E1020 ; case 34
	b _022E1020 ; case 35
	b _022E1020 ; case 36
	b _022E199C ; case 37
	b _022E199C ; case 38
	b _022E0B2C ; case 39
_022E08BC:
	cmp r7, #0x100
	bgt _022E08CC
	beq _022E10D0
	b _022E199C
_022E08CC:
	ldr r0, _022E1224 ; =0x00000101
	cmp r7, r0
	beq _022E10F4
	b _022E199C
_022E08DC:
	add r0, r1, #0x2c
	cmp r7, r0
	bgt _022E091C
	subs r0, r7, #0x14c
	addpl pc, pc, r0, lsl #2
	b _022E199C
_022E08F4: ; jump table
	b _022E1334 ; case 0
	b _022E1390 ; case 1
	b _022E1390 ; case 2
	b _022E13A0 ; case 3
	b _022E1350 ; case 4
	b _022E13B0 ; case 5
	b _022E1150 ; case 6
	b _022E1198 ; case 7
	b _022E1198 ; case 8
	b _022E1198 ; case 9
_022E091C:
	ldr r0, _022E1228 ; =0x0000015F
	cmp r7, r0
	beq _022E0B5C
	b _022E199C
_022E092C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r2, [r4]
	mov r1, r0
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x38]
	blx r2
	b _022E246C
_022E094C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	tst r5, #0x10
	beq _022E0974
	ldrsh r0, [r4, #0x7c]
	cmp r0, #0
	bne _022E0974
	add r0, r4, #0x7c
	bl ov11_022DC830
_022E0974:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r5
	blx r2
	b _022E246C
_022E098C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, r3, lsl #6
	blx r2
	b _022E246C
_022E09B0:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r3, lsl #6
	blx r2
	b _022E246C
_022E09D4:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, r3, lsl #0xb
	blx r2
	b _022E246C
_022E09F8:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r3, lsl #0xb
	blx r2
	b _022E246C
_022E0A1C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, r3, lsl #0x10
	blx r2
	b _022E246C
_022E0A40:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r3, lsl #0x10
	blx r2
	b _022E246C
_022E0A64:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0x14]
	ldr r0, [r4, #4]
	add r1, r4, #0x42
	blx r2
	cmp r5, #0
	strneh r5, [r4, #0x40]
	ldr r2, [r4]
	mov r1, r5, lsl #0x10
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x30]
	mov r1, r1, lsr #0x10
	blx r2
	b _022E246C
_022E0AA8:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r6, r0
	ldr r2, [r1, #0x38]
	ldr r0, [r4, #4]
	mov r1, r7, lsl #0x10
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r5, lsl #0x10
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x14]
	add r1, r4, #0x42
	blx r2
	cmp r6, #0
	strneh r6, [r4, #0x40]
	ldr r2, [r4]
	mov r1, r6, lsl #0x10
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x30]
	mov r1, r1, lsr #0x10
	blx r2
	b _022E246C
_022E0B2C:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x30]
	mov r1, #0x100
	blx r2
	b _022E246C
_022E0B44:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x30]
	mov r1, #0x800
	blx r2
	b _022E246C
_022E0B5C:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x30]
	mov r1, #0x800
	blx r2
	mov r0, #3
	b _022E2478
_022E0B78:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r2, r0
	cmp r2, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	bgt _022E0BC8
	ldr r2, [r1, #0x3c]
	mov r1, #0x200000
	blx r2
	ldr r2, [r4]
	mov r1, #0
	ldr r3, [r2, #0x40]
	ldr r0, [r4, #4]
	mov r2, r1
	blx r3
	b _022E246C
_022E0BC8:
	ldr r3, [r1, #0x40]
	mov r1, r5
	blx r3
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, #0x200000
	blx r2
	b _022E246C
_022E0BEC:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r3, r0
	cmp r5, #0
	beq _022E0C2C
	ldr r2, [r4]
	mov r1, r5, lsl #0x10
	ldr r0, [r4, #4]
	ldr r4, [r2, #0x34]
	mov r2, r1, asr #0x10
	mov r1, #0
	blx r4
	b _022E246C
_022E0C2C:
	ldr r1, [r4]
	mov r2, #0
	ldr r0, [r4, #4]
	ldr r4, [r1, #0x34]
	mov r3, r2
	mov r1, #1
	blx r4
	b _022E246C
_022E0C4C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r4, [r2, #0x34]
	mov r2, r1, asr #0x10
	mov r1, #2
	mov r3, #0
	blx r4
	b _022E246C
_022E0C78:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r4, [r2, #0x34]
	mov r2, r1, asr #0x10
	mov r1, #3
	mov r3, #0
	blx r4
	b _022E246C
_022E0CA4:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x10
	blx r2
	add r1, sp, #0x18
	add r2, sp, #0x20
	add r3, sp, #0x10
	add r0, r6, #2
	bl ov11_022E4984
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r3, [r1, #0x20]
	add r1, sp, #0x18
	add r2, sp, #0x20
	blx r3
	b _022E246C
_022E0CE8:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, _022E122C ; =0x02316A44
	mov r5, r0
	mov r0, r5, lsl #0x10
	ldr r3, [r1, #0x10]
	ldr r6, [r1, #0xc]
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x58
	str r6, [sp, #0x28]
	str r3, [sp, #0x2c]
	bl LoadScriptVariableValueAtIndex
	mov r1, r5, lsl #0x10
	str r0, [sp, #0x28]
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x59
	bl LoadScriptVariableValueAtIndex
	mov r1, r5, lsl #0x10
	str r0, [sp, #0x2c]
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x5a
	bl LoadScriptVariableValueAtIndex
	mov r1, r5, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r5, r0
	mov r0, #0
	mov r1, #0x5b
	bl LoadScriptVariableValueAtIndex
	ldr r2, [r4]
	mov r0, r0, lsl #0x18
	mov r6, r0, asr #0x18
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x24]
	add r1, sp, #0x28
	blx r2
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x28]
	mov r1, r5
	blx r2
	strb r6, [r4, #0x42]
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	mov r1, r6
	blx r2
	b _022E246C
_022E0DB0:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #0x30
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r3, [r1, #0x10]
	add r1, sp, #0x38
	add r2, sp, #0x3c
	blx r3
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x14]
	add r1, sp, #8
	blx r2
	mov r2, r5, lsl #0x10
	ldr r3, [sp, #0x30]
	mov r0, #0
	mov r1, #0x58
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r2, r5, lsl #0x10
	ldr r3, [sp, #0x34]
	mov r0, #0
	mov r1, #0x59
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r2, r5, lsl #0x10
	ldr r3, [sp, #0x38]
	mov r0, #0
	mov r1, #0x5a
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, r5, lsl #0x10
	mov r2, r0, lsr #0x10
	ldrsb r3, [sp, #8]
	mov r0, #0
	mov r1, #0x5b
	bl SaveScriptVariableValueAtIndex
	b _022E246C
_022E0E60:
	ldrsh r0, [r4, #0x7c]
	cmp r0, #0
	bne _022E0E74
	add r0, r4, #0x7c
	bl ov11_022DC830
_022E0E74:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x1c]
	mov r1, #0
	blx r2
	b _022E246C
_022E0E8C:
	ldr r0, _022E122C ; =0x02316A44
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x3c]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	str r0, [sp, #0x40]
	ldrh r0, [r6, #4]
	bl ov11_022E48E0
	str r0, [sp, #0x44]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x24]
	add r1, sp, #0x40
	blx r2
	b _022E246C
_022E0ED0:
	ldr r0, _022E122C ; =0x02316A44
	ldr r1, [r0, #0x28]
	ldr r0, [r0, #0x24]
	str r1, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	str r0, [sp, #0x48]
	ldrh r0, [r6, #4]
	bl ov11_022E48E0
	str r0, [sp, #0x4c]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	add r1, sp, #0x48
	blx r2
	b _022E246C
_022E0F14:
	ldr r1, _022E122C ; =0x02316A44
	ldrh r0, [r6, #2]
	ldr r2, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	str r2, [sp, #0x50]
	str r1, [sp, #0x54]
	bl ov11_022E48AC
	str r0, [sp, #0x50]
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	ldr r1, _022E122C ; =0x02316A44
	str r0, [sp, #0x54]
	ldr r2, [r1, #0x48]
	ldr r1, [r1, #0x44]
	ldr r0, [sp, #0x50]
	str r1, [sp, #0x58]
	str r2, [sp, #0x5c]
	bl RandInt
	mov r1, r0, lsl #8
	ldr r0, [sp, #0x54]
	str r1, [sp, #0x58]
	bl RandInt
	mov r0, r0, lsl #8
	str r0, [sp, #0x5c]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	add r1, sp, #0x58
	blx r2
	b _022E246C
_022E0F8C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	cmp r0, #0
	blt _022E246C
	add r1, sp, #0x60
	bl ov11_022F90F4
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x24]
	add r1, sp, #0x60
	blx r2
	b _022E246C
_022E0FC8:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x68
	blx r2
	add r1, sp, #0x68
	add r0, r6, #2
	bl ov11_022E490C
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x24]
	add r1, sp, #0x68
	blx r2
	b _022E246C
_022E1000:
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	ldr r2, [r4]
	mov r1, r0
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x28]
	blx r2
	b _022E246C
_022E1020:
	ldr r1, [r4, #0x38]
	add r0, r1, #2
	str r0, [r4, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	ldrsh r2, [r4, #0x3c]
	mvn r1, #0
	mov r0, #0
	sub r2, r2, #1
	strh r2, [r4, #0x3c]
	strh r1, [r4, #0x46]
	strh r0, [r4, #0x44]
	mov r0, #3
	b _022E2478
_022E105C:
	ldr r1, [r4, #0x38]
	add r0, r1, #2
	str r0, [r4, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	ldrsh r2, [r4, #0x3c]
	mov r1, #0
	mov r0, #3
	sub r2, r2, #1
	strh r2, [r4, #0x3c]
	strh r1, [r4, #0x46]
	strh r1, [r4, #0x44]
	b _022E2478
_022E1094:
	ldr r1, [r4, #0x38]
	add r0, r1, #2
	str r0, [r4, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	strh r0, [r4, #0x46]
	ldrsh r2, [r4, #0x3c]
	mov r1, #0x100
	mov r0, #0
	sub r2, r2, #1
	strh r2, [r4, #0x3c]
	str r1, [r4, #0x4c]
	strh r0, [r4, #0x44]
	mov r0, #3
	b _022E2478
_022E10D0:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	b _022E246C
_022E10F4:
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	movs r7, r0
	bmi _022E246C
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	add r1, sp, #9
	mov r0, r7
	bl ov11_022F9148
	ldrsb r0, [sp, #9]
	and r1, r5, #0xff
	bl sub_020051A0
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	b _022E246C
_022E1150:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0xa
	blx r2
	ldrsb r0, [sp, #0xa]
	and r1, r5, #0xff
	bl sub_020051A0
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	b _022E246C
_022E1198:
	add r0, r1, #0x2a
	cmp r7, r0
	mov r5, #0
	cmpne r7, #0x154
	beq _022E11BC
	add r0, r1, #0x2c
	cmp r7, r0
	beq _022E1234
	b _022E126C
_022E11BC:
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	movs r8, r0
	bmi _022E126C
	add r1, sp, #0x78
	mov r5, #1
	bl ov11_022F90F4
	ldr r0, _022E1230 ; =0x00000153
	cmp r7, r0
	bne _022E1200
	add r1, sp, #0x88
	mov r0, r8
	bl ov11_022F90B4
	b _022E126C
_022E1200:
	ldr r0, _022E122C ; =0x02316A44
	ldr r1, [r0, #0x20]
	ldr r0, [r0, #0x1c]
	str r1, [sp, #0x8c]
	str r0, [sp, #0x88]
	b _022E126C
	.align 2, 0
_022E1218: .word 0x02316A44
_022E121C: .word 0x0231956C
_022E1220: .word 0x00000129
_022E1224: .word 0x00000101
_022E1228: .word 0x0000015F
_022E122C: .word 0x02316A44
_022E1230: .word 0x00000153
_022E1234:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x78
	mov r5, #1
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #8]
	add r1, sp, #0x88
	blx r2
	add r1, sp, #0x78
	add r0, r6, #4
	bl ov11_022E490C
_022E126C:
	cmp r5, #0
	beq _022E246C
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #0x70
	blx r2
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #8]
	add r1, sp, #0x80
	blx r2
	add r0, sp, #0x70
	add r1, sp, #0x80
	add r2, sp, #0x78
	add r3, sp, #0x88
	bl sub_020058A8
	strb r0, [sp, #0xb]
	ldrsb r1, [sp, #0xb]
	mvn r0, #0
	cmp r1, r0
	bne _022E130C
	ldr r1, _022E2274 ; =0x02316A60
	add r0, sp, #0x70
	add r2, sp, #0x78
	mov r3, r1
	bl sub_020057A8
	strb r0, [sp, #0xb]
	ldrsb r1, [sp, #0xb]
	mvn r0, #0
	cmp r1, r0
	bne _022E130C
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x14]
	add r1, sp, #0xb
	blx r2
_022E130C:
	ldrsb r0, [sp, #0xb]
	and r1, r5, #0xff
	bl sub_020051A0
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	b _022E246C
_022E1334:
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	strb r0, [r4, #0x69]
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1350:
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0xc
	blx r2
	ldrsb r0, [sp, #0xc]
	and r1, r5, #0xff
	bl sub_020051A0
	strb r0, [r4, #0x69]
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1390:
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E13A0:
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E13B0:
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #8]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0xd
	blx r2
	ldrsb r0, [sp, #0xd]
	and r1, r5, #0xff
	bl sub_020051A0
	cmp r7, #3
	cmpne r7, #4
	cmpne r7, #0xb
	moveq r8, r8, lsl #2
	strb r0, [r4, #0x69]
	movne r8, r8, lsl #3
	strh r8, [r4, #0x44]
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1420:
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	ldrh r0, [r6, #4]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1460:
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0xe
	blx r2
	ldrsb r0, [sp, #0xe]
	and r1, r5, #0xff
	bl sub_020051A0
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	ldrh r0, [r6, #4]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E14C4:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #8]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	mov r0, r4
	strh r5, [r4, #0x46]
	mov r1, r1, asr #0x10
	strh r1, [r4, #0x44]
	bl ov11_022DCEEC
	mov r0, #3
	b _022E2478
_022E14F8:
	ldrh r0, [r6, #4]
	bl ov11_022E48E0
	str r0, [r4, #0x64]
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	mvn r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1520:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	and r1, r7, #0xff
	mov r2, r5
	mov r3, r0
	mov r0, r4
	bl ov11_022E7AE4
	mov r0, #3
	b _022E2478
_022E155C:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r6, #6]
	bl ov11_022E48AC
	mov r3, r0
	cmp r7, #0x49
	moveq r0, #0
	movne r0, #1
	mov r1, r5
	mov r2, r4
	bl ov11_022EB084
	b _022E246C
_022E159C:
	ldrsh r3, [r4, #8]
	ldr r1, [r4]
	ldr r2, _022E2278 ; =0x02316AD8
	cmp r7, #0x4b
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r4, [r2, r3, lsl #2]
	ldr r1, [r1, #4]
	movne r5, #1
	blx r1
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl ov11_022EB128
	b _022E246C
_022E15D8:
	cmp r7, #0x48
	moveq r0, #0
	movne r0, #1
	mov r1, #2
	mov r2, #0
	bl ov11_022EB128
	b _022E246C
_022E15F4:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x90
	blx r2
	cmp r7, #0x4a
	moveq r0, #0
	movne r0, #1
	add r2, sp, #0x90
	mov r1, #1
	bl ov11_022EB0E4
	b _022E246C
_022E1624:
	ldr r0, [r4]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	moveq r0, #0
	streq r0, [sp, #0x98]
	streq r0, [sp, #0x9c]
	beq _022E164C
	ldr r0, [r4, #4]
	add r1, sp, #0x98
	blx r2
_022E164C:
	add r1, sp, #0x98
	add r0, r6, #2
	bl ov11_022E490C
	cmp r7, #0x4c
	moveq r0, #0
	movne r0, #1
	add r2, sp, #0x98
	mov r1, #1
	bl ov11_022EB0E4
	b _022E246C
_022E1674:
	ldr r1, [r4]
	ldrsh r3, [r4, #8]
	ldr r2, _022E2278 ; =0x02316AD8
	cmp r7, #0x45
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	movne r5, #1
	ldr r7, [r2, r3, lsl #2]
	blx r1
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	mov r3, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl ov11_022EB19C
	mov r0, #3
	b _022E2478
_022E16C4:
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	mov r3, r0
	cmp r7, #0x43
	moveq r0, #0
	movne r0, #1
	mov r1, #2
	mov r2, #0
	bl ov11_022EB19C
	mov r0, #3
	b _022E2478
_022E16F0:
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #0xa0
	blx r2
	cmp r7, #0x44
	moveq r0, #0
	movne r0, #1
	add r2, sp, #0xa0
	mov r3, r5
	mov r1, #1
	bl ov11_022EB150
	mov r0, #3
	b _022E2478
_022E1734:
	ldr r1, [r4, #0x38]
	add r0, r1, #2
	str r0, [r4, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	ldrsh r1, [r4, #0x3c]
	mov r0, #3
	sub r1, r1, #1
	strh r1, [r4, #0x3c]
	b _022E2478
_022E1760:
	ldr r1, [r4]
	ldrsh r3, [r4, #8]
	ldr r2, _022E2278 ; =0x02316AD8
	cmp r7, #0x3b
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	movne r5, #1
	ldr r7, [r2, r3, lsl #2]
	blx r1
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	mov r3, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl ov11_022EB208
	mov r0, #3
	b _022E2478
_022E17B0:
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	mov r3, r0
	cmp r7, #0x39
	moveq r0, #0
	movne r0, #1
	mov r1, #2
	mov r2, #0
	bl ov11_022EB208
	mov r0, #3
	b _022E2478
_022E17DC:
	ldrh r0, [r6, #2]
	bl ov11_022E48E0
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #0xa8
	blx r2
	cmp r7, #0x3a
	moveq r0, #0
	movne r0, #1
	add r2, sp, #0xa8
	mov r3, r5
	mov r1, #1
	bl ov11_022EB1CC
	mov r0, #3
	b _022E2478
_022E1820:
	ldr r1, [r4, #0x38]
	add r0, r1, #2
	str r0, [r4, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [r4, #0x4c]
	ldrsh r2, [r4, #0x3c]
	mov r1, #0
	mov r0, #3
	sub r2, r2, #1
	strh r2, [r4, #0x3c]
	strh r1, [r4, #0x46]
	strh r1, [r4, #0x44]
	b _022E2478
_022E1858:
	ldr r1, [r4]
	ldrsh r3, [r4, #8]
	ldr r2, _022E2278 ; =0x02316AD8
	cmp r7, #0x40
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	movne r5, #1
	ldr r7, [r2, r3, lsl #2]
	blx r1
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl ov11_022EB274
	mov r0, #3
	b _022E2478
_022E18A8:
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	mov r3, r0
	cmp r7, #0x3e
	moveq r0, #0
	movne r0, #1
	mov r1, #2
	mov r2, #0
	bl ov11_022EB274
	mov r0, #3
	b _022E2478
_022E18D4:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	blx r1
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0xc]
	ldr r0, [r4, #4]
	add r1, sp, #0xb0
	blx r2
	cmp r7, #0x3f
	moveq r0, #0
	movne r0, #1
	add r2, sp, #0xb0
	mov r3, r5
	mov r1, #1
	bl ov11_022EB238
	mov r0, #3
	b _022E2478
_022E1928:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	blx r1
	ldrh r0, [r6, #2]
	bl ov11_022E48AC
	ldr r1, [r4]
	mov r5, r0
	ldr r2, [r1, #0xc]
	cmp r2, #0
	moveq r0, #0
	streq r0, [sp, #0xb8]
	streq r0, [sp, #0xbc]
	beq _022E196C
	ldr r0, [r4, #4]
	add r1, sp, #0xb8
	blx r2
_022E196C:
	add r1, sp, #0xb8
	add r0, r6, #4
	bl ov11_022E490C
	cmp r7, #0x42
	moveq r0, #0
	movne r0, #1
	add r2, sp, #0xb8
	mov r3, r5
	mov r1, #1
	bl ov11_022EB238
	mov r0, #3
	b _022E2478
_022E199C:
	ldr r5, [r4, #0x34]
	ldrh r6, [r5]
	cmp r6, #0xf6
	bgt _022E1AC4
	bge _022E2360
	cmp r6, #0x84
	bgt _022E1A40
	bge _022E1F80
	cmp r6, #0x6a
	bgt _022E1A18
	bge _022E2464
	cmp r6, #0x61
	bgt _022E1A0C
	bge _022E242C
	sub r0, r6, #0x1e
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022E2464
_022E19E4: ; jump table
	b _022E2130 ; case 0
	b _022E20A4 ; case 1
	b _022E20D0 ; case 2
	b _022E2128 ; case 3
	b _022E2150 ; case 4
	b _022E2208 ; case 5
	b _022E217C ; case 6
	b _022E21A8 ; case 7
	b _022E2200 ; case 8
	b _022E2228 ; case 9
_022E1A0C:
	cmp r6, #0x62
	beq _022E2440
	b _022E2464
_022E1A18:
	cmp r6, #0x6c
	bgt _022E1A2C
	bge _022E2464
	cmp r6, #0x6b
	b _022E2464
_022E1A2C:
	cmp r6, #0x6d
	ble _022E2464
	cmp r6, #0x83
	beq _022E2020
	b _022E2464
_022E1A40:
	cmp r6, #0x90
	bgt _022E1A80
	bge _022E1E28
	cmp r6, #0x86
	bgt _022E1A64
	bge _022E1FC4
	cmp r6, #0x85
	beq _022E1FBC
	b _022E2464
_022E1A64:
	cmp r6, #0x8c
	bgt _022E1A74
	beq _022E1C88
	b _022E2464
_022E1A74:
	cmp r6, #0x8d
	beq _022E1BE0
	b _022E2464
_022E1A80:
	cmp r6, #0x92
	bgt _022E1A98
	bge _022E1C88
	cmp r6, #0x91
	beq _022E1C88
	b _022E2464
_022E1A98:
	cmp r6, #0x95
	bgt _022E1AB8
	cmp r6, #0x94
	blt _022E2464
	beq _022E2254
	cmp r6, #0x95
	beq _022E226C
	b _022E2464
_022E1AB8:
	cmp r6, #0xf5
	beq _022E23A0
	b _022E2464
_022E1AC4:
	cmp r6, #0x174
	bgt _022E1B4C
	bge _022E1E88
	cmp r6, #0xfb
	bgt _022E1B10
	bge _022E22B8
	cmp r6, #0xf8
	bgt _022E1AF4
	bge _022E22A0
	cmp r6, #0xf7
	beq _022E23F8
	b _022E2464
_022E1AF4:
	cmp r6, #0xf9
	bgt _022E1B04
	beq _022E2318
	b _022E2464
_022E1B04:
	cmp r6, #0xfa
	beq _022E22E4
	b _022E2464
_022E1B10:
	ldr r0, _022E227C ; =0x00000127
	cmp r6, r0
	bgt _022E1B2C
	bge _022E2084
	cmp r6, #0xfc
	beq _022E23E0
	b _022E2464
_022E1B2C:
	cmp r6, #0x128
	bgt _022E1B3C
	beq _022E207C
	b _022E2464
_022E1B3C:
	add r0, r0, #0x4c
	cmp r6, r0
	beq _022E1EDC
	b _022E2464
_022E1B4C:
	ldr r1, _022E2280 ; =0x00000179
	cmp r6, r1
	bgt _022E1B9C
	bge _022E1F2C
	sub r0, r1, #3
	cmp r6, r0
	bgt _022E1B7C
	bge _022E1F44
	sub r0, r1, #4
	cmp r6, r0
	beq _022E1F20
	b _022E2464
_022E1B7C:
	sub r0, r1, #2
	cmp r6, r0
	bgt _022E1B90
	beq _022E1F5C
	b _022E2464
_022E1B90:
	cmp r6, #0x178
	beq _022E1F08
	b _022E2464
_022E1B9C:
	add r0, r1, #2
	cmp r6, r0
	bgt _022E1BBC
	bge _022E1EB0
	add r0, r1, #1
	cmp r6, r0
	beq _022E1E60
	b _022E2464
_022E1BBC:
	add r0, r1, #4
	cmp r6, r0
	bgt _022E1BD0
	beq _022E1F68
	b _022E2464
_022E1BD0:
	add r0, r1, #5
	cmp r6, r0
	beq _022E1E50
	b _022E2464
_022E1BE0:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0, lsl #0x10
	ldrh r0, [r5, #4]
	mov r5, r6, asr #0x10
	bl ov11_022E48AC
	mvn r1, #0
	mov r7, r0
	cmp r1, r6, asr #16
	bne _022E1C5C
	bl sub_0204E760
	mov r5, r0
	ldr r1, _022E2284 ; =0x0231958C
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	mvn r0, #0
	cmp r5, r0
	beq _022E1C48
	mov r0, r7
	bl ov11_022E958C
	mov r0, r4
	mov r1, #1
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2464
_022E1C48:
	mov r0, r4
	mov r1, #0
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2464
_022E1C5C:
	ldr r1, _022E2288 ; =0x023195AC
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	mov r0, r5
	bl SetEnterDungeon
	mov r0, r4
	mov r1, #1
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2464
_022E1C88:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r7, r0, lsl #0x10
	ldrh r0, [r5, #4]
	mov r8, r7, asr #0x10
	bl ov11_022E48AC
	mvn r0, #0
	cmp r0, r7, asr #16
	bne _022E1CF8
	bl GetGameMode
	cmp r6, #0x91
	moveq r0, #2
	beq _022E1CE0
	cmp r6, #0x92
	moveq r0, #3
	beq _022E1CE0
	cmp r0, #5
	moveq r0, #4
	beq _022E1CE0
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
_022E1CE0:
	mvn r1, #0
	bl ov11_022FFAAC
	mov r0, #0
	strh r0, [r4, #0x44]
	mov r0, #5
	b _022E2478
_022E1CF8:
	cmp r8, #0xfb
	bne _022E1D70
	bl sub_0204E70C
	add r1, r6, #0x6f
	add r1, r1, #0xff00
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r5, r0
	cmp r1, #1
	ldrls r0, _022E228C ; =0x00000296
	bls _022E1D5C
	cmp r5, #2
	ldreq r0, _022E2290 ; =0x00000297
	beq _022E1D5C
	cmp r5, #3
	moveq r0, #0x298
	beq _022E1D5C
	mov r0, #0
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldrne r0, _022E2294 ; =0x00000299
	bne _022E1D5C
	cmp r5, #1
	ldreq r0, _022E2298 ; =0x00000295
	movne r0, #0x294
_022E1D5C:
	mov r1, #0
	bl ov11_022F7188
	mov r0, #1
	strh r0, [r4, #0xe]
	b _022E2464
_022E1D70:
	cmp r8, #0xfa
	moveq r0, #1
	streqh r0, [r4, #0x44]
	beq _022E1E20
	mov r0, r8
	bl DungeonSwapIdxToId
	mov r5, r0
	mov r2, r8
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r2, r8
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	mov r0, r8
	bl SetEnterDungeon
	cmp r6, #0x8c
	beq _022E1DD0
	mov r2, r8
	mov r0, #0
	mov r1, #0x26
	bl SaveScriptVariableValue
	b _022E1E18
_022E1DD0:
	mov r0, r5
	bl CheckMissionRestrictions
	tst r0, #0x20
	movne r1, #7
	bne _022E1E08
	tst r0, #0x40
	movne r1, #8
	bne _022E1E08
	tst r0, #1
	movne r1, #0x12
	bne _022E1E08
	cmp r0, #0
	moveq r1, #0
	movne r1, #0x13
_022E1E08:
	mov r0, r4
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	b _022E2464
_022E1E18:
	mov r0, #1
	strh r0, [r4, #0x44]
_022E1E20:
	mov r0, #5
	b _022E2478
_022E1E28:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl ov11_022E43E8
	str r0, [r4, #0x1c]
	mov r0, r5
	bl ov11_022E958C
	b _022E2464
_022E1E50:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	bl ov11_0230F004
	b _022E2464
_022E1E60:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0204CDE8
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl ov11_0230F050
	b _022E2464
_022E1E88:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0204CDE8
	mov r0, r4, lsl #0x18
	mov r0, r0, asr #0x18
	bl ov11_0230F08C
	b _022E2464
_022E1EB0:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #1
	bl sub_0204CE48
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F180
	b _022E2464
_022E1EDC:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #1
	bl sub_0204CE48
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F1B4
	b _022E2464
_022E1F08:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F1EC
	b _022E2464
_022E1F20:
	rsb r0, r1, #0x178
	bl ov11_0230F1EC
	b _022E2464
_022E1F2C:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F0C4
	b _022E2464
_022E1F44:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F0EC
	b _022E2464
_022E1F5C:
	rsb r0, r1, #0x178
	bl ov11_0230F21C
	b _022E2464
_022E1F68:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F21C
	b _022E2464
_022E1F80:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ov11_022E48AC
	mov r2, r6, lsl #0x10
	strh r0, [sp, #0xca]
	add r1, sp, #0xc8
	mov r0, r2, asr #0x10
	strh r4, [sp, #0xc8]
	bl sub_02065CB4
	b _022E2464
_022E1FBC:
	mov r0, #5
	b _022E2478
_022E1FC4:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r5, r0
	mov r1, r5, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	mov r2, #0
	bl LoadScriptVariableValueAtIndex
	mov r1, r5, lsl #0x10
	strh r0, [sp, #0xc4]
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r2, r6, lsl #0x10
	strh r0, [sp, #0xc6]
	add r1, sp, #0xc4
	mov r0, r2, asr #0x10
	bl sub_02065CB4
	b _022E2464
_022E2020:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r2, r6, lsl #0x10
	mov r5, r0
	add r1, sp, #0xc0
	mov r0, r2, asr #0x10
	bl ItemAtTableIdx
	mov r1, r5, lsl #0x10
	ldrsh r3, [sp, #0xc0]
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	mov r2, #0
	bl SaveScriptVariableValueAtIndex
	mov r1, r5, lsl #0x10
	ldrh r3, [sp, #0xc2]
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	mov r2, #1
	bl SaveScriptVariableValueAtIndex
	b _022E2464
_022E207C:
	bl sub_02017AB0
	b _022E2464
_022E2084:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	cmp r0, #0
	movlt r0, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017ACC
	b _022E2464
_022E20A4:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	ldr r1, _022E229C ; =0x000003E7
	mov r0, r0, lsr #0x10
	cmp r0, r1
	beq _022E20C8
	bl sub_02017B58
	b _022E2464
_022E20C8:
	bl sub_02017B70
	b _022E2464
_022E20D0:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ov11_022E48AC
	mov r1, r6, lsl #0x10
	mov r3, r0
	ldr r2, _022E229C ; =0x000003E7
	mov r0, r1, lsr #0x10
	cmp r0, r2
	beq _022E2120
	mov r1, r4, lsl #0x10
	mov r2, r3, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	bl sub_02017B64
	b _022E2464
_022E2120:
	bl sub_02017B70
	b _022E2464
_022E2128:
	bl sub_02017B70
	b _022E2464
_022E2130:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	cmp r0, #0
	movlt r0, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017B7C
	b _022E2464
_022E2150:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017B88
	b _022E2464
_022E217C:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	ldr r1, _022E229C ; =0x000003E7
	mov r0, r0, lsr #0x10
	cmp r0, r1
	beq _022E21A0
	bl sub_02017BD4
	b _022E2464
_022E21A0:
	bl sub_02017BEC
	b _022E2464
_022E21A8:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ov11_022E48AC
	mov r1, r6, lsl #0x10
	mov r3, r0
	ldr r2, _022E229C ; =0x000003E7
	mov r0, r1, lsr #0x10
	cmp r0, r2
	beq _022E21F8
	mov r1, r4, lsl #0x10
	mov r2, r3, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	bl sub_02017BE0
	b _022E2464
_022E21F8:
	bl sub_02017BEC
	b _022E2464
_022E2200:
	bl sub_02017BEC
	b _022E2464
_022E2208:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	cmp r0, #0
	movlt r0, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017BF8
	b _022E2464
_022E2228:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017C04
	b _022E2464
_022E2254:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C50
	b _022E2464
_022E226C:
	bl sub_02017C5C
	b _022E2464
	.align 2, 0
_022E2274: .word 0x02316A60
_022E2278: .word 0x02316AD8
_022E227C: .word 0x00000127
_022E2280: .word 0x00000179
_022E2284: .word 0x0231958C
_022E2288: .word 0x023195AC
_022E228C: .word 0x00000296
_022E2290: .word 0x00000297
_022E2294: .word 0x00000299
_022E2298: .word 0x00000295
_022E229C: .word 0x000003E7
_022E22A0:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C80
	b _022E2464
_022E22B8:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017C74
	b _022E2464
_022E22E4:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r2, r0, lsl #0x10
	mov r1, r4, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r3, r2, asr #0x10
	mov r1, #0
	mov r2, #0x100
	bl sub_02017C90
	b _022E2464
_022E2318:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ov11_022E48AC
	mov r1, r6, lsl #0x10
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	mov r3, r0
	mov r0, r1, lsr #0x10
	mov r1, r3, lsl #0x10
	mov r3, r1, asr #0x10
	mov r1, #0
	bl sub_02017C90
	b _022E2464
_022E2360:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ov11_022E48AC
	mov r1, r6, lsl #0x10
	mov r3, r0, lsl #0x10
	mov r2, r4, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	bl sub_02017C9C
	b _022E2464
_022E23A0:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ov11_022E48AC
	mov r1, r6, lsl #0x10
	mov r3, r0, lsl #0x10
	mov r2, r4, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	mov r2, r3, asr #0x10
	bl sub_02017CA8
	b _022E2464
_022E23E0:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017CB4
	b _022E2464
_022E23F8:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	cmp r0, #0
	movlt r0, #0x1e
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017CC0
	b _022E2464
_022E242C:
	mov r0, #0
	bl ov11_022E9710
	mov r0, #0
	bl ov11_022E96F4
	b _022E2464
_022E2440:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0206C0EC
	mov r0, #1
	bl ov11_022E9710
	mov r0, #1
	bl ov11_022E96F4
_022E2464:
	mov r0, #2
	b _022E2478
_022E246C:
	mov r0, #2
	b _022E2478
_022E2474:
	mov r0, #2
_022E2478:
	add sp, sp, #0x2c8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022E04D4

	arm_func_start ov11_022E2480
ov11_022E2480: ; 0x022E2480
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xf4
	mov sb, r0
	ldr r4, [sb, #0x34]
	mov r5, #1
	ldrh r8, [r4]
	cmp r8, #0xbd
	bgt _022E25E0
	bge _022E36D0
	cmp r8, #0xb3
	bgt _022E258C
	bge _022E3004
	cmp r8, #0xaf
	bgt _022E2568
	bge _022E3004
	cmp r8, #0x5b
	bgt _022E255C
	subs r0, r8, #0x39
	addpl pc, pc, r0, lsl #2
	b _022E3C58
_022E24D0: ; jump table
	b _022E3A08 ; case 0
	b _022E3A08 ; case 1
	b _022E3A08 ; case 2
	b _022E3A58 ; case 3
	b _022E3A58 ; case 4
	b _022E3A08 ; case 5
	b _022E3A08 ; case 6
	b _022E3A08 ; case 7
	b _022E3C58 ; case 8
	b _022E3A08 ; case 9
	b _022E3A08 ; case 10
	b _022E3A08 ; case 11
	b _022E3A08 ; case 12
	b _022E3A58 ; case 13
	b _022E3A58 ; case 14
	b _022E3C58 ; case 15
	b _022E3C58 ; case 16
	b _022E3C58 ; case 17
	b _022E3C58 ; case 18
	b _022E3C58 ; case 19
	b _022E3A30 ; case 20
	b _022E3A30 ; case 21
	b _022E3A30 ; case 22
	b _022E3A58 ; case 23
	b _022E3A58 ; case 24
	b _022E3A30 ; case 25
	b _022E3A30 ; case 26
	b _022E3A30 ; case 27
	b _022E3C58 ; case 28
	b _022E3A30 ; case 29
	b _022E3A30 ; case 30
	b _022E3A30 ; case 31
	b _022E3A30 ; case 32
	b _022E3A58 ; case 33
	b _022E3A58 ; case 34
_022E255C:
	cmp r8, #0x89
	beq _022E291C
	b _022E3C58
_022E2568:
	cmp r8, #0xb1
	bgt _022E2580
	bge _022E3004
	cmp r8, #0xb0
	beq _022E3004
	b _022E3C58
_022E2580:
	cmp r8, #0xb2
	beq _022E3004
	b _022E3C58
_022E258C:
	cmp r8, #0xb7
	bgt _022E25BC
	bge _022E3004
	cmp r8, #0xb5
	bgt _022E25B0
	bge _022E3004
	cmp r8, #0xb4
	beq _022E3004
	b _022E3C58
_022E25B0:
	cmp r8, #0xb6
	beq _022E3004
	b _022E3C58
_022E25BC:
	cmp r8, #0xbb
	bgt _022E25D4
	bge _022E3004
	cmp r8, #0xb9
	beq _022E3004
	b _022E3C58
_022E25D4:
	cmp r8, #0xbc
	beq _022E3004
	b _022E3C58
_022E25E0:
	cmp r8, #0xc4
	bgt _022E2638
	bge _022E2C18
	cmp r8, #0xc0
	bgt _022E2614
	bge _022E2C18
	cmp r8, #0xbe
	bgt _022E2608
	beq _022E38EC
	b _022E3C58
_022E2608:
	cmp r8, #0xbf
	beq _022E2C18
	b _022E3C58
_022E2614:
	cmp r8, #0xc2
	bgt _022E262C
	bge _022E2C18
	cmp r8, #0xc1
	beq _022E2C18
	b _022E3C58
_022E262C:
	cmp r8, #0xc3
	beq _022E2C18
	b _022E3C58
_022E2638:
	cmp r8, #0xc8
	bgt _022E2668
	bge _022E36D0
	cmp r8, #0xc6
	bgt _022E265C
	bge _022E2C18
	cmp r8, #0xc5
	beq _022E2C18
	b _022E3C58
_022E265C:
	cmp r8, #0xc7
	beq _022E395C
	b _022E3C58
_022E2668:
	cmp r8, #0xcb
	bgt _022E2680
	bge _022E2A1C
	cmp r8, #0xc9
	beq _022E29B4
	b _022E3C58
_022E2680:
	sub r0, r8, #0xcd
	cmp r0, #0xa2
	addls pc, pc, r0, lsl #2
	b _022E3C58
_022E2690: ; jump table
	b _022E376C ; case 0
	b _022E376C ; case 1
	b _022E3C58 ; case 2
	b _022E3C58 ; case 3
	b _022E3C58 ; case 4
	b _022E3C58 ; case 5
	b _022E3C58 ; case 6
	b _022E3C58 ; case 7
	b _022E3C58 ; case 8
	b _022E3C58 ; case 9
	b _022E3C10 ; case 10
	b _022E3C28 ; case 11
	b _022E3C10 ; case 12
	b _022E3C28 ; case 13
	b _022E3C10 ; case 14
	b _022E3C28 ; case 15
	b _022E3C58 ; case 16
	b _022E3C10 ; case 17
	b _022E3C10 ; case 18
	b _022E3C10 ; case 19
	b _022E3C28 ; case 20
	b _022E3C58 ; case 21
	b _022E3C58 ; case 22
	b _022E3C10 ; case 23
	b _022E3C28 ; case 24
	b _022E3C40 ; case 25
	b _022E3C58 ; case 26
	b _022E3C40 ; case 27
	b _022E3C58 ; case 28
	b _022E3C40 ; case 29
	b _022E3C58 ; case 30
	b _022E3C58 ; case 31
	b _022E3C40 ; case 32
	b _022E3C40 ; case 33
	b _022E3C40 ; case 34
	b _022E3C58 ; case 35
	b _022E3C58 ; case 36
	b _022E3C58 ; case 37
	b _022E3C40 ; case 38
	b _022E3C58 ; case 39
	b _022E3C58 ; case 40
	b _022E3C58 ; case 41
	b _022E3C58 ; case 42
	b _022E3C58 ; case 43
	b _022E3C58 ; case 44
	b _022E3C58 ; case 45
	b _022E3C58 ; case 46
	b _022E3C58 ; case 47
	b _022E3C58 ; case 48
	b _022E3C58 ; case 49
	b _022E3C58 ; case 50
	b _022E3C58 ; case 51
	b _022E3C58 ; case 52
	b _022E3C58 ; case 53
	b _022E3C58 ; case 54
	b _022E3C58 ; case 55
	b _022E3C58 ; case 56
	b _022E3C58 ; case 57
	b _022E3C58 ; case 58
	b _022E3C58 ; case 59
	b _022E3C58 ; case 60
	b _022E3C58 ; case 61
	b _022E3C58 ; case 62
	b _022E3C58 ; case 63
	b _022E3C58 ; case 64
	b _022E3C58 ; case 65
	b _022E3C58 ; case 66
	b _022E3004 ; case 67
	b _022E3004 ; case 68
	b _022E3004 ; case 69
	b _022E3004 ; case 70
	b _022E3004 ; case 71
	b _022E3004 ; case 72
	b _022E3004 ; case 73
	b _022E3004 ; case 74
	b _022E3004 ; case 75
	b _022E3C58 ; case 76
	b _022E3004 ; case 77
	b _022E3C58 ; case 78
	b _022E3004 ; case 79
	b _022E3004 ; case 80
	b _022E38EC ; case 81
	b _022E2C18 ; case 82
	b _022E2C18 ; case 83
	b _022E2C18 ; case 84
	b _022E2C18 ; case 85
	b _022E2C18 ; case 86
	b _022E2C18 ; case 87
	b _022E2C18 ; case 88
	b _022E2C18 ; case 89
	b _022E3C58 ; case 90
	b _022E3C58 ; case 91
	b _022E3C58 ; case 92
	b _022E3C58 ; case 93
	b _022E3C58 ; case 94
	b _022E2A98 ; case 95
	b _022E2A98 ; case 96
	b _022E2A90 ; case 97
	b _022E2A90 ; case 98
	b _022E2A98 ; case 99
	b _022E2A98 ; case 100
	b _022E2A98 ; case 101
	b _022E2A98 ; case 102
	b _022E2A90 ; case 103
	b _022E2A98 ; case 104
	b _022E2A98 ; case 105
	b _022E3C58 ; case 106
	b _022E3C58 ; case 107
	b _022E3C58 ; case 108
	b _022E3C58 ; case 109
	b _022E3C58 ; case 110
	b _022E3C58 ; case 111
	b _022E3C58 ; case 112
	b _022E3C58 ; case 113
	b _022E3C58 ; case 114
	b _022E3C58 ; case 115
	b _022E3C58 ; case 116
	b _022E3C58 ; case 117
	b _022E3C58 ; case 118
	b _022E3C58 ; case 119
	b _022E3C58 ; case 120
	b _022E3C58 ; case 121
	b _022E3C58 ; case 122
	b _022E3C58 ; case 123
	b _022E3C58 ; case 124
	b _022E3C58 ; case 125
	b _022E3C58 ; case 126
	b _022E345C ; case 127
	b _022E345C ; case 128
	b _022E345C ; case 129
	b _022E345C ; case 130
	b _022E345C ; case 131
	b _022E361C ; case 132
	b _022E3C58 ; case 133
	b _022E3C58 ; case 134
	b _022E3C58 ; case 135
	b _022E3C58 ; case 136
	b _022E3C58 ; case 137
	b _022E2A98 ; case 138
	b _022E2AB8 ; case 139
	b _022E2B00 ; case 140
	b _022E2B30 ; case 141
	b _022E2B60 ; case 142
	b _022E2B88 ; case 143
	b _022E2BB0 ; case 144
	b _022E2ADC ; case 145
	b _022E2AB8 ; case 146
	b _022E3C58 ; case 147
	b _022E3C58 ; case 148
	b _022E3C58 ; case 149
	b _022E3BC0 ; case 150
	b _022E3C58 ; case 151
	b _022E3C58 ; case 152
	b _022E3C58 ; case 153
	b _022E3C58 ; case 154
	b _022E2BC8 ; case 155
	b _022E3A14 ; case 156
	b _022E3A3C ; case 157
	b _022E2A98 ; case 158
	b _022E3C10 ; case 159
	b _022E3C28 ; case 160
	b _022E3C40 ; case 161
	b _022E2BF0 ; case 162
_022E291C:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	mov r7, r0
	ldrh r2, [r4, #4]
	mov r0, #2
	ldr r1, _022E38D0 ; =0x023195C8
	str r2, [sp]
	mov r2, r6
	mov r3, r7
	bl DebugPrint
	cmp r7, #0
	blt _022E29A8
	mov r0, r7
	bl ov11_022F8874
	bl ov11_022DC9A0
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	add r4, r4, #4
	add r1, sp, #0xd8
	mov r0, sb
	mov r3, r6
	mov r2, #3
	str r4, [sp]
	bl ov11_022E425C
	cmp r0, #0
	beq _022E29A8
	add r2, sp, #0xd8
	mov r0, r7
	mov r1, #0
	bl ov11_022F8920
_022E29A8:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E29B4:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FC6E4
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	add r4, r4, #4
	add r1, sp, #0xbc
	mov r0, sb
	mov r3, r6
	mov r2, #4
	str r4, [sp]
	bl ov11_022E425C
	cmp r0, #0
	beq _022E2A10
	mov r0, r6, lsl #0x10
	add r2, sp, #0xbc
	mov r0, r0, asr #0x10
	mov r1, #0
	bl ov11_022FC74C
_022E2A10:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E2A1C:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FD6DC
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FDE84
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	add r4, r4, #4
	add r1, sp, #0xa0
	mov r0, sb
	mov r3, r6
	mov r2, #5
	str r4, [sp]
	bl ov11_022E425C
	cmp r0, #0
	beq _022E2A84
	mov r0, r6, lsl #0x10
	add r2, sp, #0xa0
	arm_func_end ov11_022E2480

	arm_func_start ov11_022E2A78
ov11_022E2A78: ; 0x022E2A78
	mov r0, r0, asr #0x10
	mov r1, #0
	bl ov11_022FDEEC
_022E2A84:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E2A90:
	mov r5, #0
	b _022E3C5C
_022E2A98:
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	subgt r0, r0, #1
	strgth r0, [sb, #0x46]
	movle r0, #2
	movgt r5, #0
	strleh r0, [sb, #0xe]
	b _022E3C5C
_022E2AB8:
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r1, [r1, #0x48]
	blx r1
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2ADC:
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r1, [r1, #0x4c]
	blx r1
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2B00:
	mov r0, #0
	bl ov11_022EF700
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	mov r0, #3
	bl ov11_022F1E44
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2B30:
	mov r0, r5
	bl ov11_022EF700
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	mov r0, #3
	bl ov11_02310D64
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2B60:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017B18
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2B88:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017B94
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2BB0:
	bl sub_02017FB0
	cmp r0, #0
	movne r0, #2
	moveq r5, #0
	strneh r0, [sb, #0xe]
	b _022E3C5C
_022E2BC8:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C10
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2BF0:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C68
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E2C18:
	ldrsh r0, [sb, #0x44]
	cmp r0, #0
	beq _022E2D64
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x98
	blx r2
	ldr r2, [sb, #0x58]
	ldr r0, [sp, #0x98]
	ldr r1, [sp, #0x9c]
	sub r0, r2, r0
	str r0, [sp, #0x90]
	ldr r2, [sb, #0x5c]
	add r0, sp, #0x90
	sub r1, r2, r1
	str r1, [sp, #0x94]
	ldr r1, [sb, #0x4c]
	bl ClampComponentAbs
	ldr r0, [sp, #0x90]
	cmp r0, #0
	ldreq r0, [sp, #0x94]
	cmpeq r0, #0
	moveq r0, #0
	streqh r0, [sb, #0x44]
	beq _022E2D54
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x44]
	add r1, sp, #0x90
	blx r2
	ldr r1, [sb]
	mov r4, r0
	ldr r2, [r1, #0x18]
	ldr r0, [sb, #4]
	add r1, sp, #0x8c
	blx r2
	sub r0, r8, #0xbf
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022E2D10
_022E2CBC: ; jump table
	b _022E2CDC ; case 0
	b _022E2CDC ; case 1
	b _022E2CDC ; case 2
	b _022E2CDC ; case 3
	b _022E2CDC ; case 4
	b _022E2CDC ; case 5
	b _022E2CDC ; case 6
	b _022E2CDC ; case 7
_022E2CDC:
	add r0, sp, #0x90
	bl sub_020055C8
	mov r1, r0
	strb r1, [sb, #0x42]
	ldr r2, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x30]
	mov r1, #0x1000
	blx r2
_022E2D10:
	ldr r0, [sp, #0x8c]
	tst r0, #4
	beq _022E2D2C
	tst r4, #0x240
	movne r0, #0
	strneh r0, [sb, #0x44]
	bne _022E2D54
_022E2D2C:
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	blt _022E2D50
	subgt r0, r0, #1
	strgth r0, [sb, #0x46]
	movle r0, #0
	movgt r5, #0
	strleh r0, [sb, #0x44]
	b _022E2D54
_022E2D50:
	mov r5, #0
_022E2D54:
	ldrsh r0, [sb, #0x48]
	add r0, r0, #1
	strh r0, [sb, #0x48]
	b _022E3C5C
_022E2D64:
	ldrsh r0, [sb, #0x3c]
	cmp r0, #0
	ble _022E2FF8
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0xc]
	add r1, sb, #0x50
	blx r2
	ldr r1, _022E38D4 ; =0x00000122
	cmp r8, r1
	bgt _022E2DF4
	bge _022E2E80
	sub r0, r1, #3
	cmp r8, r0
	bgt _022E2DD4
	bge _022E2EB8
	sub r0, r8, #0xbf
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022E2FE4
_022E2DB4: ; jump table
	b _022E2EB8 ; case 0
	b _022E2EF8 ; case 1
	b _022E2F40 ; case 2
	b _022E2E80 ; case 3
	b _022E2E80 ; case 4
	b _022E2FA0 ; case 5
	b _022E2E30 ; case 6
	b _022E2E30 ; case 7
_022E2DD4:
	cmp r8, #0x120
	bgt _022E2DE4
	beq _022E2EF8
	b _022E2FE4
_022E2DE4:
	ldr r0, _022E38D8 ; =0x00000121
	cmp r8, r0
	beq _022E2F40
	b _022E2FE4
_022E2DF4:
	cmp r8, #0x124
	bgt _022E2E10
	bge _022E2FA0
	add r0, r1, #1
	cmp r8, r0
	beq _022E2E80
	b _022E2FE4
_022E2E10:
	add r0, r1, #3
	cmp r8, r0
	bgt _022E2E24
	beq _022E2E30
	b _022E2FE4
_022E2E24:
	add r0, r1, #4
	cmp r8, r0
	bne _022E2FE4
_022E2E30:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	ldr r1, [sb, #0x50]
	add r0, r1, r0
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	ldr r1, [sb, #0x54]
	add r0, r1, r0
	str r0, [sb, #0x5c]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #2
	strh r0, [sb, #0x3c]
	b _022E2FE4
_022E2E80:
	ldr r2, [sb, #0x50]
	ldr r0, [sb, #0x54]
	add r1, sb, #0x58
	str r2, [sb, #0x58]
	str r0, [sb, #0x5c]
	ldr r0, [sb, #0x38]
	bl ov11_022E490C
	ldr r0, [sb, #0x38]
	add r0, r0, #8
	str r0, [sb, #0x38]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #4
	strh r0, [sb, #0x3c]
	b _022E2FE4
_022E2EB8:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [sb, #0x5c]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #2
	strh r0, [sb, #0x3c]
	b _022E2FE4
_022E2EF8:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	ldrsh r1, [sb, #0x3c]
	cmp r0, #0
	movlt r0, #2
	sub r1, r1, #1
	strh r1, [sb, #0x3c]
	strlth r0, [sb, #0xe]
	blt _022E2FE4
	add r1, sb, #0x58
	bl ov11_022F90F4
	b _022E2FE4
_022E2F40:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	ldrsh r1, [sb, #0x3c]
	cmp r0, #0
	movlt r0, #2
	sub r1, r1, #2
	strh r1, [sb, #0x3c]
	strlth r0, [sb, #0xe]
	blt _022E2FE4
	add r1, sb, #0x58
	bl ov11_022F90F4
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	strh r0, [sb, #0x46]
	b _022E2FE4
_022E2FA0:
	ldr r2, [sb, #0x50]
	ldr r0, [sb, #0x54]
	add r1, sb, #0x58
	str r2, [sb, #0x58]
	str r0, [sb, #0x5c]
	ldr r0, [sb, #0x38]
	bl ov11_022E490C
	ldr r0, [sb, #0x38]
	add r1, r0, #8
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	strh r0, [sb, #0x46]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #5
	strh r0, [sb, #0x3c]
_022E2FE4:
	mov r0, #0
	strh r0, [sb, #0x48]
	mov r0, #1
	strh r0, [sb, #0x44]
	b _022E3C5C
_022E2FF8:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E3004:
	ldrsh r1, [sb, #0x46]
	cmp r1, #0
	ble _022E3118
	ldrsh r0, [sb, #0x44]
	cmp r0, #0
	beq _022E3118
	sub r0, r1, #1
	strh r0, [sb, #0x46]
	ldrsh r0, [sb, #0x48]
	add r1, sp, #0x84
	add r0, r0, #1
	strh r0, [sb, #0x48]
	ldr r2, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0xc]
	blx r2
	ldrsh r2, [sb, #0x48]
	add r0, sp, #0x7c
	add r1, sb, #0x50
	str r2, [sp]
	ldrsh r3, [sb, #0x46]
	add r2, sb, #0x58
	bl sub_0200514C
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x24]
	add r1, sp, #0x7c
	blx r2
	sub r0, r8, #0xaf
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _022E3110
_022E3084: ; jump table
	b _022E30BC ; case 0
	b _022E30BC ; case 1
	b _022E30BC ; case 2
	b _022E30BC ; case 3
	b _022E30BC ; case 4
	b _022E30BC ; case 5
	b _022E30BC ; case 6
	b _022E30BC ; case 7
	b _022E30BC ; case 8
	b _022E3110 ; case 9
	b _022E30BC ; case 10
	b _022E3110 ; case 11
	b _022E30BC ; case 12
	b _022E30BC ; case 13
_022E30BC:
	ldr r3, [sp, #0x7c]
	ldr r2, [sp, #0x84]
	ldr r1, [sp, #0x80]
	ldr r0, [sp, #0x88]
	sub r2, r3, r2
	sub r1, r1, r0
	add r0, sp, #0x74
	str r2, [sp, #0x74]
	str r1, [sp, #0x78]
	bl sub_020055C8
	mov r1, r0
	strb r1, [sb, #0x42]
	ldr r2, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x30]
	mov r1, #0x1000
	blx r2
_022E3110:
	mov r5, #0
	b _022E3C5C
_022E3118:
	ldrsh r0, [sb, #0x3c]
	cmp r0, #0
	ble _022E3450
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0xc]
	add r1, sb, #0x50
	blx r2
	ldr r1, _022E38DC ; =0x00000115
	cmp r8, r1
	bgt _022E31DC
	bge _022E3238
	sub r0, r1, #4
	cmp r8, r0
	bgt _022E31B0
	bge _022E3380
	cmp r8, #0xbc
	bgt _022E31A4
	subs r0, r8, #0xaf
	addpl pc, pc, r0, lsl #2
	b _022E33C4
_022E316C: ; jump table
	b _022E32C0 ; case 0
	b _022E3380 ; case 1
	b _022E3288 ; case 2
	b _022E3288 ; case 3
	b _022E3238 ; case 4
	b _022E3238 ; case 5
	b _022E3300 ; case 6
	b _022E32C0 ; case 7
	b _022E3380 ; case 8
	b _022E33C4 ; case 9
	b _022E3288 ; case 10
	b _022E33C4 ; case 11
	b _022E3238 ; case 12
	b _022E3300 ; case 13
_022E31A4:
	cmp r8, #0x110
	beq _022E32C0
	b _022E33C4
_022E31B0:
	sub r0, r1, #2
	cmp r8, r0
	bgt _022E31D0
	bge _022E3288
	sub r0, r1, #3
	cmp r8, r0
	beq _022E3288
	b _022E33C4
_022E31D0:
	cmp r8, #0x114
	beq _022E3238
	b _022E33C4
_022E31DC:
	cmp r8, #0x118
	bgt _022E320C
	bge _022E3380
	add r0, r1, #1
	cmp r8, r0
	bgt _022E31FC
	beq _022E3300
	b _022E33C4
_022E31FC:
	add r0, r1, #2
	cmp r8, r0
	beq _022E32C0
	b _022E33C4
_022E320C:
	cmp r8, #0x11c
	bgt _022E3228
	bge _022E3238
	add r0, r1, #5
	cmp r8, r0
	beq _022E3288
	b _022E33C4
_022E3228:
	add r0, r1, #8
	cmp r8, r0
	beq _022E3300
	b _022E33C4
_022E3238:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	ldr r1, [sb, #0x50]
	add r0, r1, r0
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	ldr r1, [sb, #0x54]
	add r0, r1, r0
	str r0, [sb, #0x5c]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #2
	strh r0, [sb, #0x3c]
	b _022E33C4
_022E3288:
	ldr r2, [sb, #0x50]
	ldr r0, [sb, #0x54]
	add r1, sb, #0x58
	str r2, [sb, #0x58]
	str r0, [sb, #0x5c]
	ldr r0, [sb, #0x38]
	bl ov11_022E490C
	ldr r0, [sb, #0x38]
	add r0, r0, #8
	str r0, [sb, #0x38]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #4
	strh r0, [sb, #0x3c]
	b _022E33C4
_022E32C0:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48E0
	str r0, [sb, #0x5c]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #2
	strh r0, [sb, #0x3c]
	b _022E33C4
_022E3300:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	ldr r1, [sb, #0x38]
	mov r6, r0
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	ldr r1, [sb]
	mov r4, r0
	ldr r0, [sb, #4]
	ldr r2, [r1, #0xc]
	add r1, sb, #0x50
	blx r2
	mov r0, r6, lsl #1
	sub r0, r0, #1
	bl RandInt
	ldr r1, [sb, #0x50]
	sub r0, r0, r6
	add r1, r1, r0, lsl #8
	mov r0, r4, lsl #1
	str r1, [sb, #0x58]
	sub r0, r0, #1
	bl RandInt
	ldr r1, [sb, #0x54]
	sub r0, r0, r4
	add r0, r1, r0, lsl #8
	str r0, [sb, #0x5c]
	b _022E33C4
_022E3380:
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	cmp r0, #0
	movlt r0, #2
	strlth r0, [sb, #0xe]
	blt _022E33C4
	add r1, sb, #0x58
	bl ov11_022F90F4
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #1
	strh r0, [sb, #0x3c]
_022E33C4:
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	bgt _022E343C
	ldr r1, _022E38E0 ; =0x02316A44
	add r0, sp, #0x6c
	ldr r2, [r1, #0x78]
	ldr r1, [r1, #0x74]
	str r2, [sp, #0x70]
	str r1, [sp, #0x6c]
	ldr r2, [sb, #0x58]
	ldr r1, [sb, #0x50]
	sub r1, r2, r1
	str r1, [sp, #0x6c]
	ldr r2, [sb, #0x5c]
	ldr r1, [sb, #0x54]
	sub r1, r2, r1
	str r1, [sp, #0x70]
	bl EuclideanNorm__02005050
	mov r4, r0
	ldr r0, [sb, #0x4c]
	bl IntToFloat
	mov r1, r0
	mov r0, r4
	bl DivideFloat
	bl FloatToInt
	strh r0, [sb, #0x46]
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	movle r0, #1
	strleh r0, [sb, #0x46]
_022E343C:
	mov r0, #0
	strh r0, [sb, #0x48]
	mov r0, #1
	strh r0, [sb, #0x44]
	b _022E3C5C
_022E3450:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E345C:
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	subgt r0, r0, #1
	strgth r0, [sb, #0x46]
	movgt r5, #0
	bgt _022E3C5C
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x64
	sub r6, r5, #2
	mov r7, #0
	blx r2
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x14]
	add r1, sp, #0xc
	blx r2
	sub r0, r8, #0x14c
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022E3564
_022E34B4: ; jump table
	b _022E34C8 ; case 0
	b _022E34D0 ; case 1
	b _022E34D0 ; case 2
	b _022E352C ; case 3
	b _022E34C8 ; case 4
_022E34C8:
	ldrsb r6, [sb, #0x69]
	b _022E3564
_022E34D0:
	ldrh r0, [r4, #6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	movs sl, r0
	bmi _022E3564
	add r1, sp, #0x5c
	mov r7, r5
	bl ov11_022F90F4
	ldr r0, _022E38E4 ; =0x0000014D
	cmp r8, r0
	bne _022E3514
	add r1, sp, #0x4c
	mov r0, sl
	bl ov11_022F90B4
	b _022E3564
_022E3514:
	ldr r0, _022E38E0 ; =0x02316A44
	ldr r1, [r0, #0x20]
	ldr r0, [r0, #0x1c]
	str r1, [sp, #0x50]
	str r0, [sp, #0x4c]
	b _022E3564
_022E352C:
	add r1, sp, #0x5c
	add r2, sp, #0x4c
	add r3, sp, #0x64
	add r0, r4, #6
	mov r7, r5
	bl ov11_022E4984
	ldr r3, [sp, #0x4c]
	ldr r2, [sp, #0x5c]
	ldr r1, [sp, #0x50]
	ldr r0, [sp, #0x60]
	sub r2, r3, r2
	sub r0, r1, r0
	str r2, [sp, #0x4c]
	str r0, [sp, #0x50]
_022E3564:
	cmp r7, #0
	beq _022E35BC
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #8]
	add r1, sp, #0x54
	blx r2
	add r0, sp, #0x64
	add r1, sp, #0x54
	add r2, sp, #0x5c
	add r3, sp, #0x4c
	bl sub_020058A8
	mov r6, r0
	mvn r0, #0
	cmp r6, r0
	bne _022E35BC
	ldr r1, _022E38E8 ; =0x02316A60
	add r0, sp, #0x64
	add r2, sp, #0x5c
	mov r3, r1
	bl sub_020057A8
	mov r6, r0
_022E35BC:
	mvn r0, #0
	cmp r6, r0
	ldrnesb r0, [sp, #0xc]
	cmpne r6, r0
	moveq r0, #2
	streqh r0, [sb, #0xe]
	beq _022E3C5C
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r2, r0
	ldrsb r0, [sp, #0xc]
	mov r1, r6
	and r2, r2, #0xff
	bl sub_02005344
	strb r0, [sb, #0x42]
	ldr r2, [sb]
	ldrsb r1, [sb, #0x42]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	strh r0, [sb, #0x46]
	b _022E3C5C
_022E361C:
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	subgt r0, r0, #1
	strgth r0, [sb, #0x46]
	movgt r5, #0
	bgt _022E3C5C
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r4, #6]
	bl ov11_022E48AC
	ldr r1, [sb]
	mov r4, r0
	ldr r2, [r1, #0x14]
	ldr r0, [sb, #4]
	add r1, sp, #0xb
	blx r2
	ldrsh r0, [sb, #0x44]
	cmp r0, #0
	ble _022E368C
	ldrsb r0, [sp, #0xb]
	and r1, r4, #0xff
	bl sub_020051A0
	strb r0, [sb, #0x42]
	ldrsh r0, [sb, #0x44]
	sub r0, r0, #1
	strh r0, [sb, #0x44]
	b _022E36A0
_022E368C:
	ldrsb r0, [sp, #0xb]
	ldrsb r1, [sb, #0x69]
	and r2, r4, #0xff
	bl sub_02005344
	strb r0, [sb, #0x42]
_022E36A0:
	ldrsb r1, [sb, #0x42]
	ldrsb r0, [sp, #0xb]
	cmp r1, r0
	moveq r0, #2
	streqh r0, [sb, #0xe]
	beq _022E3C5C
	ldr r2, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	strh r6, [sb, #0x46]
	b _022E3C5C
_022E36D0:
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x18]
	add r1, sp, #0x40
	blx r2
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x14]
	add r1, sp, #0xa
	blx r2
	ldrsb r0, [sp, #0xa]
	ldr r2, [sb, #0x4c]
	add r1, sp, #0x44
	bl sub_02005494
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x44]
	add r1, sp, #0x44
	blx r2
	ldr r1, [sp, #0x40]
	tst r1, #4
	beq _022E3738
	tst r0, #0x240
	movne r0, #2
	strneh r0, [sb, #0xe]
	bne _022E3C5C
_022E3738:
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x30]
	mov r1, #0x1000
	blx r2
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	subgt r0, r0, #1
	strgth r0, [sb, #0x46]
	movle r0, #2
	movgt r5, #0
	strleh r0, [sb, #0xe]
	b _022E3C5C
_022E376C:
	ldrsh r0, [sb, #0x48]
	cmp r0, #0
	bgt _022E3884
	ldrh r0, [r4, #6]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7E10
	movs r5, r0
	bmi _022E3874
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0xc]
	add r1, sp, #0x38
	blx r2
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x14]
	add r1, sp, #9
	blx r2
	add r1, sp, #0x30
	mov r0, r5
	bl ov11_022F90F4
	cmp r8, #0xce
	ldrne r0, _022E38E0 ; =0x02316A44
	ldrne r1, [r0, #0x20]
	ldrne r0, [r0, #0x1c]
	strne r1, [sp, #0x24]
	strne r0, [sp, #0x20]
	bne _022E37F0
	add r1, sp, #0x20
	mov r0, r5
	bl ov11_022F90B4
_022E37F0:
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #8]
	add r1, sp, #0x28
	blx r2
	add r0, sp, #0x38
	add r1, sp, #0x28
	add r2, sp, #0x30
	add r3, sp, #0x20
	bl sub_020058A8
	mov r1, r0
	mvn r0, #0
	cmp r1, r0
	bne _022E3840
	ldr r1, _022E38E8 ; =0x02316A60
	add r0, sp, #0x38
	add r2, sp, #0x30
	mov r3, r1
	bl sub_020057A8
	mov r1, r0
_022E3840:
	mvn r0, #0
	cmp r1, r0
	ldrnesb r0, [sp, #9]
	cmpne r1, r0
	beq _022E3874
	mov r2, #0xa
	bl sub_02005344
	strb r0, [sb, #0x42]
	ldr r2, [sb]
	ldrsb r1, [sb, #0x42]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x2c]
	blx r2
_022E3874:
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	strh r0, [sb, #0x48]
	b _022E388C
_022E3884:
	sub r0, r0, #1
	strh r0, [sb, #0x48]
_022E388C:
	ldrsh r0, [sb, #0x46]
	mov r5, #0
	cmp r0, #0
	ble _022E38B8
	sub r0, r0, #1
	strh r0, [sb, #0x46]
	ldrsh r0, [sb, #0x46]
	cmp r0, #0
	movle r0, #2
	strleh r0, [sb, #0xe]
	ble _022E3C5C
_022E38B8:
	ldrsh r1, [sb, #0x3e]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #2
	streqh r0, [sb, #0xe]
	b _022E3C5C
	.align 2, 0
_022E38D0: .word 0x023195C8
_022E38D4: .word 0x00000122
_022E38D8: .word 0x00000121
_022E38DC: .word 0x00000115
_022E38E0: .word 0x02316A44
_022E38E4: .word 0x0000014D
_022E38E8: .word 0x02316A60
_022E38EC:
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r3, [r1, #0x10]
	add r1, sp, #0x1c
	add r2, sp, #0x18
	blx r3
	ldr r1, [sb, #0x64]
	ldr r0, [sp, #0x1c]
	subs r0, r1, r0
	moveq r0, #2
	streqh r0, [sb, #0xe]
	beq _022E3C5C
	ldr r2, [sb, #0x4c]
	rsb r1, r2, #0
	cmp r0, r1
	blt _022E3938
	cmp r0, r2
	movle r2, r0
	mov r1, r2
_022E3938:
	ldr r0, [sp, #0x1c]
	add r1, r0, r1
	str r1, [sp, #0x1c]
	ldr r2, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x28]
	blx r2
	mov r5, #0
	b _022E3C5C
_022E395C:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r7, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r4, #6]
	bl ov11_022E48AC
	ldr r2, [sb]
	mov r4, r0
	ldr r0, [sb, #4]
	ldr r2, [r2, #0xc]
	add r1, sp, #0x10
	blx r2
	ldr r2, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x14]
	add r1, sp, #8
	blx r2
	str r6, [sp]
	and r3, r7, #0xff
	mov r0, sb
	add r1, sp, #8
	add r2, sp, #0x10
	str r4, [sp, #4]
	bl ov11_022E7B70
	cmp r0, #0
	moveq r0, #2
	streqh r0, [sb, #0xe]
	ldr r1, [sb]
	ldr r0, [sb, #4]
	ldr r2, [r1, #0x24]
	add r1, sp, #0x10
	movne r5, #0
	blx r2
	ldrsb r0, [sp, #8]
	strb r0, [sb, #0x42]
	ldr r2, [sb]
	ldrsb r1, [sp, #8]
	ldr r0, [sb, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	b _022E3C5C
_022E3A08:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E3A14:
	mov r0, #0
	bl ov11_022EB2CC
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E3A30:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E3A3C:
	mov r0, r5
	bl ov11_022EB2CC
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E3A58:
	cmp r8, #0x46
	bgt _022E3A80
	bge _022E3A88
	cmp r8, #0x3d
	bgt _022E3A90
	cmp r8, #0x3c
	blt _022E3A90
	cmpne r8, #0x3d
	beq _022E3A88
	b _022E3A90
_022E3A80:
	cmp r8, #0x47
	bne _022E3A90
_022E3A88:
	mov r4, #0
	b _022E3A94
_022E3A90:
	mov r4, #1
_022E3A94:
	mov r0, r4
	bl ov11_022EB2CC
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	ldrsh r0, [sb, #0x3c]
	cmp r0, #0
	ble _022E3BB4
	ldr r0, [sb]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	moveq r0, #0
	streq r0, [sb, #0x50]
	streq r0, [sb, #0x54]
	beq _022E3ADC
	ldr r0, [sb, #4]
	add r1, sb, #0x50
	blx r2
_022E3ADC:
	ldr r2, [sb, #0x50]
	ldr r0, [sb, #0x54]
	add r1, sb, #0x58
	str r2, [sb, #0x58]
	str r0, [sb, #0x5c]
	ldr r0, [sb, #0x38]
	bl ov11_022E490C
	ldr r0, [sb, #0x38]
	cmp r8, #0x50
	add r0, r0, #8
	str r0, [sb, #0x38]
	ldrsh r0, [sb, #0x3c]
	sub r0, r0, #4
	strh r0, [sb, #0x3c]
	bgt _022E3B54
	cmp r8, #0x50
	bge _022E3B8C
	cmp r8, #0x46
	bgt _022E3B48
	bge _022E3B74
	cmp r8, #0x3d
	bgt _022E3BA0
	cmp r8, #0x3c
	blt _022E3BA0
	cmpne r8, #0x3d
	beq _022E3B8C
	b _022E3BA0
_022E3B48:
	cmp r8, #0x47
	beq _022E3B74
	b _022E3BA0
_022E3B54:
	cmp r8, #0x5a
	bgt _022E3B6C
	bge _022E3B74
	cmp r8, #0x51
	beq _022E3B8C
	b _022E3BA0
_022E3B6C:
	cmp r8, #0x5b
	bne _022E3BA0
_022E3B74:
	ldr r3, [sb, #0x4c]
	mov r0, r4
	add r2, sb, #0x58
	mov r1, #1
	bl ov11_022EB150
	b _022E3BA0
_022E3B8C:
	ldr r3, [sb, #0x4c]
	mov r0, r4
	add r2, sb, #0x58
	mov r1, #1
	bl ov11_022EB1CC
_022E3BA0:
	ldrsh r0, [sb, #0x3c]
	cmp r0, #0
	movle r0, #2
	strleh r0, [sb, #0xe]
	b _022E3C5C
_022E3BB4:
	mov r0, #2
	strh r0, [sb, #0xe]
	b _022E3C5C
_022E3BC0:
	bl ov11_022E9EFC
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	bl ov11_022E9F48
	cmp r0, #0
	movne r5, #0
	bne _022E3C5C
	bl ov11_022E9FF4
	mov r4, r0
	bl ov11_022EA004
	mvn r1, #0xff
	cmp r4, r1
	cmpne r4, #0x100
	cmpne r0, r1
	cmpne r0, #0x100
	movne r0, #2
	moveq r5, #0
	strneh r0, [sb, #0xe]
	b _022E3C5C
_022E3C10:
	bl ov11_022E9EFC
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E3C28:
	bl ov11_022E9F48
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E3C40:
	bl ov11_022E9F78
	cmp r0, #0
	moveq r0, #2
	movne r5, #0
	streqh r0, [sb, #0xe]
	b _022E3C5C
_022E3C58:
	mov r5, #0
_022E3C5C:
	mov r0, r5
	add sp, sp, #0xf4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov11_022E2A78

	arm_func_start ov11_022E3C68
ov11_022E3C68: ; 0x022E3C68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #0x34]
	ldr r1, _022E4240 ; =0x00000162
	ldrh r5, [r4]
	mov r6, #1
	cmp r5, r1
	bgt _022E3D40
	bge _022E3F3C
	sub r0, r1, #0x28
	cmp r5, r0
	bgt _022E3D14
	bge _022E3DC0
	cmp r5, #0x1a
	bgt _022E3D08
	subs r0, r5, #5
	addpl pc, pc, r0, lsl #2
	b _022E4234
_022E3CB0: ; jump table
	b _022E4078 ; case 0
	b _022E4140 ; case 1
	b _022E4234 ; case 2
	b _022E4078 ; case 3
	b _022E4234 ; case 4
	b _022E41A8 ; case 5
	b _022E41A8 ; case 6
	b _022E41A8 ; case 7
	b _022E4078 ; case 8
	b _022E4234 ; case 9
	b _022E4234 ; case 10
	b _022E4234 ; case 11
	b _022E4234 ; case 12
	b _022E4234 ; case 13
	b _022E4234 ; case 14
	b _022E4234 ; case 15
	b _022E4234 ; case 16
	b _022E4234 ; case 17
	b _022E3DA8 ; case 18
	b _022E3DA8 ; case 19
	b _022E4234 ; case 20
	b _022E3DA8 ; case 21
_022E3D08:
	cmp r5, #0x8b
	beq _022E4040
	b _022E4234
_022E3D14:
	cmp r5, #0x160
	bgt _022E3D30
	bge _022E3EEC
	sub r0, r1, #0x24
	cmp r5, r0
	beq _022E3E38
	b _022E4234
_022E3D30:
	sub r0, r1, #1
	cmp r5, r0
	beq _022E3F14
	b _022E4234
_022E3D40:
	add r0, r1, #5
	cmp r5, r0
	bgt _022E3D7C
	bge _022E3F64
	add r0, r1, #3
	cmp r5, r0
	bgt _022E3D6C
	bge _022E3FC8
	cmp r5, #0x164
	beq _022E3F8C
	b _022E4234
_022E3D6C:
	add r0, r1, #4
	cmp r5, r0
	beq _022E4004
	b _022E4234
_022E3D7C:
	add r0, r1, #0xf
	cmp r5, r0
	bgt _022E3D98
	bge _022E3DA8
	cmp r5, #0x170
	beq _022E3EBC
	b _022E4234
_022E3D98:
	add r0, r1, #0x10
	cmp r5, r0
	beq _022E3ED4
	b _022E4234
_022E3DA8:
	bl ov11_0230D220
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3DC0:
	ldrsh r0, [r7, #0x48]
	cmp r0, #0
	bne _022E3E20
	bl ov11_022F3054
	cmp r0, #0
	bne _022E3E18
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r4, #6]
	bl ov11_022E48AC
	mov r3, r6, lsl #0x10
	mov r2, r0
	mov r1, r5
	mov r0, r3, asr #0x10
	bl ov11_022F30D4
	ldrsh r0, [r7, #0x48]
	add r0, r0, #1
	strh r0, [r7, #0x48]
_022E3E18:
	mov r6, #0
	b _022E4238
_022E3E20:
	bl ov11_022F308C
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3E38:
	ldrsh r0, [r7, #0x48]
	cmp r0, #0
	bne _022E3EA4
	bl ov11_0230D220
	cmp r0, #0
	bne _022E3E9C
	bl ov11_02312C58
	cmp r0, #0
	bne _022E3E9C
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r4, #6]
	bl ov11_022E48AC
	mov r3, r6, lsl #0x10
	mov r2, r0
	mov r1, r5
	mov r0, r3, asr #0x10
	bl ov11_02312CD8
	ldrsh r0, [r7, #0x48]
	add r0, r0, #1
	strh r0, [r7, #0x48]
_022E3E9C:
	mov r6, #0
	b _022E4238
_022E3EA4:
	bl ov11_02312C90
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3EBC:
	bl ov11_022F3054
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3ED4:
	bl ov11_02312C58
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3EEC:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F88A0
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3F14:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FC67C
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3F3C:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FDE1C
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E3F64:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F75F0
	cmp r0, #0
	movne r0, #2
	moveq r6, #0
	strneh r0, [r7, #0xe]
	b _022E4238
_022E3F8C:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r1, r5, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F8990
	cmp r0, #0
	movne r0, #2
	moveq r6, #0
	strneh r0, [r7, #0xe]
	b _022E4238
_022E3FC8:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r1, r5, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl ov11_022FC7BC
	cmp r0, #0
	movne r0, #2
	moveq r6, #0
	strneh r0, [r7, #0xe]
	b _022E4238
_022E4004:
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x10
	mov r1, r5, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl ov11_022FDF54
	cmp r0, #0
	movne r0, #2
	moveq r6, #0
	strneh r0, [r7, #0xe]
	b _022E4238
_022E4040:
	ldrsh r1, [r7, #0x3e]
	mvn r0, #0
	cmp r1, r0
	movne r6, #0
	bne _022E4238
	ldrsh r2, [r7, #0x44]
	ldr r1, _022E4244 ; =0x02324F1C
	mov r0, r7
	ldr r1, [r1, r2, lsl #2]
	bl ov11_022E43E8
	str r0, [r7, #0x1c]
	mov r0, #2
	strh r0, [r7, #0xe]
	b _022E4238
_022E4078:
	ldrsh r0, [r7, #0x48]
	cmp r0, #0
	addeq r0, r0, #1
	streqh r0, [r7, #0x48]
	beq _022E4238
	cmp r0, #1
	moveq r0, #5
	streqh r0, [r7, #0xe]
	beq _022E4238
	cmp r0, #2
	bne _022E4134
	cmp r5, #5
	bne _022E40D4
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r1, [r4, #4]
	add r0, r7, #0x14
	bl ov11_022E4248
	mov r1, r0
	mov r0, r5
	bl ov11_022F2748
	b _022E4124
_022E40D4:
	cmp r5, #8
	ldrh r0, [r4, #2]
	bne _022E4104
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	and r0, r5, #0xff
	mov r1, r1, asr #0x10
	bl ov11_022F2790
	b _022E4124
_022E4104:
	bl ov11_022E48AC
	mov r5, r0
	ldrh r1, [r4, #4]
	add r0, r7, #0x14
	bl ov11_022E4248
	mov r1, r0
	mov r0, r5
	bl ov11_022F276C
_022E4124:
	ldrsh r0, [r7, #0x48]
	add r0, r0, #1
	strh r0, [r7, #0x48]
	b _022E4238
_022E4134:
	mov r0, #2
	strh r0, [r7, #0xe]
	b _022E4238
_022E4140:
	ldrsh r0, [r7, #0x48]
	cmp r0, #0
	addeq r0, r0, #1
	streqh r0, [r7, #0x48]
	beq _022E4238
	cmp r0, #1
	moveq r0, #5
	streqh r0, [r7, #0xe]
	beq _022E4238
	cmp r0, #2
	movne r0, #2
	strneh r0, [r7, #0xe]
	bne _022E4238
	ldrh r0, [r4, #0xa]
	bl ov11_022E48AC
	mov r5, r0
	ldrh r1, [r4, #0xc]
	add r0, r7, #0x14
	bl ov11_022E4248
	mov r1, r0
	mov r0, r5
	bl ov11_022F2748
	ldrsh r0, [r7, #0x48]
	add r0, r0, #1
	strh r0, [r7, #0x48]
	b _022E4238
_022E41A8:
	ldrsh r0, [r7, #0x48]
	cmp r0, #0
	addeq r0, r0, #1
	streqh r0, [r7, #0x48]
	beq _022E4238
	cmp r0, #1
	moveq r0, #5
	streqh r0, [r7, #0xe]
	beq _022E4238
	cmp r0, #2
	bne _022E421C
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r1, [r4, #4]
	add r0, r7, #0x14
	bl ov11_022E4248
	mov r1, r0
	mov r0, r6
	bl ov11_022F27B4
	cmp r5, #0xc
	beq _022E4208
	mov r0, #0
	bl ov11_022E9B0C
_022E4208:
	ldrsh r0, [r7, #0x48]
	mov r6, #0
	add r0, r0, #1
	strh r0, [r7, #0x48]
	b _022E4238
_022E421C:
	bl ov11_022F27D8
	cmp r0, #0
	moveq r0, #2
	movne r6, #0
	streqh r0, [r7, #0xe]
	b _022E4238
_022E4234:
	mov r6, #0
_022E4238:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022E4240: .word 0x00000162
_022E4244: .word 0x02324F1C
	arm_func_end ov11_022E3C68

	arm_func_start ov11_022E4248
ov11_022E4248: ; 0x022E4248
	ldr r2, [r0, #0xc]
	mov r0, r1, lsl #1
	ldrh r0, [r2, r0]
	add r0, r2, r0
	bx lr
	arm_func_end ov11_022E4248

	arm_func_start ov11_022E425C
ov11_022E425C: ; 0x022E425C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r4, [sp, #0x20]
	mov r8, r0
	ldrh r0, [r4]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r0, #0x72
	bne _022E42BC
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #3
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022E4344
	mov r0, #1
	b _022E4348
_022E42BC:
	cmp r0, #0x73
	bne _022E430C
	ldrh r0, [r4, #2]
	bl ov11_022E48AC
	mov r1, r0, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl ov11_022E7FB8
	cmp r0, #0
	beq _022E4344
	ldrh r0, [r4, #4]
	bl ov11_022E48AC
	strb r0, [r7, #0x16]
	ldrsh r1, [r8, #0x10]
	mov r0, #1
	strh r1, [r7, #0x14]
	ldrsb r1, [r8, #0x12]
	strb r1, [r7, #0x16]
	strh r0, [r7, #0x18]
	b _022E4348
_022E430C:
	ldr r1, [r8, #0x14]
	add r0, r7, #0xc
	stmia r7, {r1, r4}
	ldr r1, [r8, #0x20]
	str r1, [r7, #8]
	bl ov11_022E45F4
	ldrsh r2, [r8, #0x10]
	mov r1, #3
	mov r0, #1
	strh r2, [r7, #0x14]
	ldrsb r2, [r8, #0x12]
	strb r2, [r7, #0x16]
	strh r1, [r7, #0x18]
	b _022E4348
_022E4344:
	mov r0, #0
_022E4348:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov11_022E425C

	arm_func_start ov11_022E4350
ov11_022E4350: ; 0x022E4350
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _022E43DC ; =ov11_02324E80
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0
	ldr r5, _022E43E0 ; =0x023195EC
	ldr r7, _022E43E4 ; =0x02324EB4
	strb r8, [r0, #1]
	mov r6, #2
	mov r4, r8
_022E437C:
	ldrb r0, [r7, r8]
	cmp r0, #0
	beq _022E43CC
	mov r0, r6
	mov r1, r5
	mov r2, r8
	bl DebugPrint
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F7650
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F9018
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FCC44
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FE354
	strb r4, [r7, r8]
_022E43CC:
	add r8, r8, #1
	cmp r8, #0x15
	blt _022E437C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E43DC: .word ov11_02324E80
_022E43E0: .word 0x023195EC
_022E43E4: .word 0x02324EB4
	arm_func_end ov11_022E4350

	arm_func_start ov11_022E43E8
ov11_022E43E8: ; 0x022E43E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r1
	mov r8, r0
	ldr r1, _022E45A8 ; =0x02319600
	mov r2, r7
	mov r0, #2
	ldr r5, [r8, #0x1c]
	mov r6, #0
	bl DebugPrint
	mov r4, #2
	ldr sl, _022E45AC ; =0x02319618
	mov fp, r4
_022E4418:
	ldrh r3, [r5]
	sub r0, r3, #0x63
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022E458C
_022E442C: ; jump table
	b _022E4448 ; case 0
	b _022E458C ; case 1
	b _022E458C ; case 2
	b _022E44AC ; case 3
	b _022E458C ; case 4
	b _022E44AC ; case 5
	b _022E4514 ; case 6
_022E4448:
	ldrh r0, [r5, #2]
	bl ov11_022E48AC
	mov sb, r0
	mov r0, r4
	mov r1, sl
	mov r2, sb
	bl DebugPrint
	mov r1, sb
	mov r0, r7
	mov r2, fp
	bl sub_0204BF5C
	cmp r0, #0
	beq _022E44A0
	ldrh r3, [r5, #4]
	ldr r1, _022E45B0 ; =0x02319628
	mov r2, r6
	mov r0, #2
	bl DebugPrint
	ldrh r0, [r5, #4]
	ldr r1, [r8, #0x14]
	add r0, r1, r0, lsl #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022E44A0:
	add r5, r5, #6
	add r6, r6, #1
	b _022E4418
_022E44AC:
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov sb, r0
	ldrh r2, [r5, #2]
	ldr r1, _022E45B4 ; =0x02319640
	mov r0, #2
	mov r3, sb
	bl DebugPrint
	ldrh r2, [r5, #2]
	mov r1, sb
	mov r0, r7
	bl sub_0204BF5C
	cmp r0, #0
	beq _022E4508
	ldrh r3, [r5, #6]
	ldr r1, _022E45B0 ; =0x02319628
	mov r2, r6
	mov r0, #2
	bl DebugPrint
	ldrh r0, [r5, #6]
	ldr r1, [r8, #0x14]
	add r0, r1, r0, lsl #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022E4508:
	add r5, r5, #8
	add r6, r6, #1
	b _022E4418
_022E4514:
	ldrh r0, [r5, #4]
	bl ov11_022E48AC
	mov sb, r0
	ldrh r2, [r5, #2]
	ldr r1, _022E45B8 ; =0x02319658
	mov r0, #2
	mov r3, sb
	bl DebugPrint
	mov r0, sb, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, r8, #0x6c
	bl LoadScriptVariableValue
	mov r1, r0
	ldrh r2, [r5, #2]
	mov r0, r7
	bl sub_0204BF5C
	cmp r0, #0
	beq _022E4580
	ldrh r3, [r5, #6]
	ldr r1, _022E45B0 ; =0x02319628
	mov r2, r6
	mov r0, #2
	bl DebugPrint
	ldrh r0, [r5, #6]
	ldr r1, [r8, #0x14]
	add r0, r1, r0, lsl #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022E4580:
	add r5, r5, #8
	add r6, r6, #1
	b _022E4418
_022E458C:
	ldr r0, _022E45BC ; =0x02318614
	ldr r1, _022E45C0 ; =0x02319674
	ldr r2, [r0, r3, lsl #3]
	mov r0, #2
	bl DebugPrint
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E45A8: .word 0x02319600
_022E45AC: .word 0x02319618
_022E45B0: .word 0x02319628
_022E45B4: .word 0x02319640
_022E45B8: .word 0x02319658
_022E45BC: .word 0x02318614
_022E45C0: .word 0x02319674
	arm_func_end ov11_022E43E8

	arm_func_start ov11_022E45C4
ov11_022E45C4: ; 0x022E45C4
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _022E45D8 ; =0x02324F70
	strb r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E45D8: .word 0x02324F70
	arm_func_end ov11_022E45C4

	arm_func_start ov11_022E45DC
ov11_022E45DC: ; 0x022E45DC
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _022E45F0 ; =0x02324F70
	strb r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E45F0: .word 0x02324F70
	arm_func_end ov11_022E45DC

	arm_func_start ov11_022E45F4
ov11_022E45F4: ; 0x022E45F4
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end ov11_022E45F4

	arm_func_start ov11_022E4600
ov11_022E4600: ; 0x022E4600
	mov r3, #0
	b _022E4624
_022E4608:
	ldrsb r2, [r1], #1
	mov ip, r0
	strb r2, [r0], #1
	ldrsb r2, [ip]
	cmp r2, #0
	bxeq lr
	add r3, r3, #1
_022E4624:
	cmp r3, #8
	blt _022E4608
	bx lr
	arm_func_end ov11_022E4600

	arm_func_start ov11_022E4630
ov11_022E4630: ; 0x022E4630
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrnesb r1, [r0]
	cmpne r1, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldr r1, _022E4658 ; =0x0231968C
	mov r2, #8
	bl sub_020023F8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4658: .word 0x0231968C
	arm_func_end ov11_022E4630

	arm_func_start ov11_022E465C
ov11_022E465C: ; 0x022E465C
	ldr ip, _022E4668 ; =sub_020023F8
	mov r2, #8
	bx ip
	.align 2, 0
_022E4668: .word sub_020023F8
	arm_func_end ov11_022E465C

	arm_func_start ov11_022E466C
ov11_022E466C: ; 0x022E466C
	mov r3, #0
	b _022E4688
_022E4674:
	ldrsb r2, [r0], #1
	cmp r2, #0
	beq _022E4690
	strb r2, [r1], #1
	add r3, r3, #1
_022E4688:
	cmp r3, #8
	blt _022E4674
_022E4690:
	mov r0, #0
	strb r0, [r1]
	bx lr
	arm_func_end ov11_022E466C

	arm_func_start ov11_022E469C
ov11_022E469C: ; 0x022E469C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	b _022E46C8
_022E46B0:
	ldrsb r0, [r6], #1
	cmp r0, #0
	beq _022E46D0
	bl sub_0200238C
	strb r0, [r5], #1
	add r4, r4, #1
_022E46C8:
	cmp r4, #8
	blt _022E46B0
_022E46D0:
	mov r0, #0
	strb r0, [r5]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022E469C

	arm_func_start LoadFileFromRom__022E46DC
LoadFileFromRom__022E46DC: ; 0x022E46DC
	ldr ip, _022E46E4 ; =LoadFileFromRom__02008C3C
	bx ip
	.align 2, 0
_022E46E4: .word LoadFileFromRom__02008C3C
	arm_func_end LoadFileFromRom__022E46DC

	arm_func_start ov11_022E46E8
ov11_022E46E8: ; 0x022E46E8
	ldr ip, _022E46F8 ; =ov11_022E46FC
	mov r2, #0
	str r2, [r0]
	bx ip
	.align 2, 0
_022E46F8: .word ov11_022E46FC
	arm_func_end ov11_022E46E8

	arm_func_start ov11_022E46FC
ov11_022E46FC: ; 0x022E46FC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	mov r4, r1
	mov r5, r0
	ldr r1, _022E48A4 ; =0x02319694
	mov r2, r4
	mov r0, #2
	bl DebugPrint
	bl DataTransferInit
	add r0, sp, #0xc
	bl FileInitVeneer
	add r0, sp, #0xc
	mov r1, r4
	bl FileOpen
	add r0, sp, #0xc
	add r1, sp, #0
	mov r2, #0xc
	bl FileRead
	ldrh r3, [sp, #4]
	ldrh r2, [sp, #6]
	ldr r0, _022E48A8 ; =0x02324F70
	add r1, sp, #0
	add r3, r3, r2
	ldrsb r2, [r0]
	ldr r0, [r5]
	cmp r0, #0
	add r0, r2, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r0, r3, r0
	mov r4, r0, lsl #1
	bne _022E4790
	mov r0, r4
	mov r1, #1
	str r4, [r5, #4]
	bl MemAlloc
	str r0, [r5]
_022E4790:
	ldrh r2, [sp, #4]
	ldr r1, [r5]
	add r0, sp, #0xc
	mov r2, r2, lsl #1
	bl FileRead
	ldrh r0, [sp]
	cmp r0, #0
	beq _022E47D4
	ldrh r1, [sp, #4]
	ldrh r0, [sp, #2]
	ldrh r2, [sp, #6]
	ldr r3, [r5]
	add r1, r1, r0
	add r0, sp, #0xc
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRead
_022E47D4:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022E488C
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldr r0, _022E48A8 ; =0x02324F70
	mov r3, #0
	add r1, r2, r1
	add r2, r1, #6
	ldrsb ip, [r0]
	add r1, sp, #0
	b _022E4814
_022E4804:
	add r0, r1, r3, lsl #1
	ldrh r0, [r0, #8]
	add r3, r3, #1
	add r2, r2, r0
_022E4814:
	cmp r3, ip
	blt _022E4804
	mov r1, r2, lsl #1
	add r0, sp, #0xc
	mov r2, #0
	bl FileSeek
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	ldr r3, [r5]
	add r0, sp, #0xc
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRead
	ldr r0, _022E48A8 ; =0x02324F70
	add r1, sp, #0
	ldrsb r0, [r0]
	ldrh ip, [sp, #2]
	ldrh r2, [sp, #4]
	add r0, r0, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r1, ip, r2
	ldrh r3, [sp, #6]
	sub r2, r0, ip
	ldr r5, [r5]
	add r1, r3, r1
	add r0, sp, #0xc
	add r1, r5, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRead
_022E488C:
	add r0, sp, #0xc
	bl FileClose
	bl DataTransferStop
	mov r0, r4
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E48A4: .word 0x02319694
_022E48A8: .word 0x02324F70
	arm_func_end ov11_022E46FC

	arm_func_start ov11_022E48AC
ov11_022E48AC: ; 0x022E48AC
	tst r0, #0x4000
	movne r1, #0x8000
	rsbne r1, r1, #0
	orrne r1, r0, r1
	ldreq r1, _022E48DC ; =0x00003FFF
	andeq r1, r0, r1
	tst r0, #0x8000
	movne r0, r1, asr #7
	addne r0, r1, r0, lsr #24
	movne r0, r0, asr #8
	moveq r0, r1
	bx lr
	.align 2, 0
_022E48DC: .word 0x00003FFF
	arm_func_end ov11_022E48AC

	arm_func_start ov11_022E48E0
ov11_022E48E0: ; 0x022E48E0
	tst r0, #0x4000
	movne r1, #0x8000
	rsbne r1, r1, #0
	orrne r1, r0, r1
	ldreq r1, _022E4908 ; =0x00003FFF
	andeq r1, r0, r1
	tst r0, #0x8000
	movne r0, r1
	moveq r0, r1, lsl #8
	bx lr
	.align 2, 0
_022E4908: .word 0x00003FFF
	arm_func_end ov11_022E48E0

	arm_func_start ov11_022E490C
ov11_022E490C: ; 0x022E490C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrh r0, [r7]
	mov r4, r1
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [r7, #2]
	bl ov11_022E48AC
	mov r6, r0
	tst r5, #4
	bne _022E4958
	ldrh r0, [r7, #4]
	bl ov11_022E48E0
	mov r0, r0, lsl #3
	str r0, [r4]
	tst r5, #2
	ldrne r0, [r4]
	addne r0, r0, #0x400
	strne r0, [r4]
_022E4958:
	tst r6, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r7, #6]
	bl ov11_022E48E0
	mov r0, r0, lsl #3
	str r0, [r4, #4]
	tst r6, #2
	ldrne r0, [r4, #4]
	addne r0, r0, #0x400
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022E490C

	arm_func_start ov11_022E4984
ov11_022E4984: ; 0x022E4984
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrh r0, [sl]
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl ov11_022E48AC
	mov r5, r0
	ldrh r0, [sl, #2]
	bl ov11_022E48AC
	mov r6, r0
	ldrh r0, [sl, #8]
	bl ov11_022E48E0
	mov r4, r0
	ldrh r0, [sl, #0xa]
	bl ov11_022E48E0
	mov fp, r0
	tst r5, #4
	bne _022E49F4
	ldrh r0, [sl, #4]
	bl ov11_022E48E0
	mov r0, r0, lsl #3
	str r0, [sb]
	tst r5, #2
	ldrne r0, [sb]
	addne r0, r0, #0x400
	strne r0, [sb]
	b _022E49FC
_022E49F4:
	ldr r0, [r7]
	str r0, [sb]
_022E49FC:
	ldr r0, [sb]
	tst r6, #4
	add r0, r0, r4, lsl #3
	str r0, [r8]
	bne _022E4A34
	ldrh r0, [sl, #6]
	bl ov11_022E48E0
	mov r0, r0, lsl #3
	str r0, [sb, #4]
	tst r6, #2
	ldrne r0, [sb, #4]
	addne r0, r0, #0x400
	strne r0, [sb, #4]
	b _022E4A3C
_022E4A34:
	ldr r0, [r7, #4]
	str r0, [sb, #4]
_022E4A3C:
	ldr r0, [sb, #4]
	add r0, r0, fp, lsl #3
	str r0, [r8, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022E4984

	arm_func_start ov11_022E4A4C
ov11_022E4A4C: ; 0x022E4A4C
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _022E4AF8 ; =0x02324F74
	ldr r2, _022E4AFC ; =0x02324C6C
	strb r0, [r1, #1]
	mov r0, #0x1000
	mov r1, #6
	str r0, [r2, #0x2c]
	bl MemAlloc
	ldr r2, _022E4AFC ; =0x02324C6C
	mov r1, #6
	str r0, [r2, #0x28]
	mov r0, #0x1000
	str r0, [r2, #0x24]
	bl MemAlloc
	ldr r2, _022E4AFC ; =0x02324C6C
	mov r1, #6
	str r0, [r2, #0x20]
	mov r0, #0x1000
	str r0, [r2, #4]
	bl MemAlloc
	ldr r2, _022E4AFC ; =0x02324C6C
	mov r1, #6
	str r0, [r2]
	mov r0, #0x2000
	str r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _022E4AFC ; =0x02324C6C
	mov r1, #6
	str r0, [r2, #8]
	mov r0, #0x2000
	str r0, [r2, #0x14]
	bl MemAlloc
	ldr r2, _022E4AFC ; =0x02324C6C
	mov r1, #6
	str r0, [r2, #0x10]
	mov r0, #0x8000
	str r0, [r2, #0x1c]
	bl MemAlloc
	ldr r1, _022E4AFC ; =0x02324C6C
	str r0, [r1, #0x18]
	bl ov11_022E4B88
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4AF8: .word 0x02324F74
_022E4AFC: .word 0x02324C6C
	arm_func_end ov11_022E4A4C

	arm_func_start ov11_022E4B00
ov11_022E4B00: ; 0x022E4B00
	stmdb sp!, {r3, lr}
	ldr r0, _022E4B84 ; =0x02324C6C
	ldr r0, [r0, #0x28]
	bl MemFree
	ldr r0, _022E4B84 ; =0x02324C6C
	mov r1, #0
	str r1, [r0, #0x28]
	ldr r0, [r0, #0x20]
	bl MemFree
	ldr r0, _022E4B84 ; =0x02324C6C
	mov r1, #0
	str r1, [r0, #0x20]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E4B84 ; =0x02324C6C
	mov r1, #0
	str r1, [r0]
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _022E4B84 ; =0x02324C6C
	mov r1, #0
	str r1, [r0, #8]
	ldr r0, [r0, #0x10]
	bl MemFree
	ldr r0, _022E4B84 ; =0x02324C6C
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r0, [r0, #0x18]
	bl MemFree
	ldr r0, _022E4B84 ; =0x02324C6C
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4B84: .word 0x02324C6C
	arm_func_end ov11_022E4B00

	arm_func_start ov11_022E4B88
ov11_022E4B88: ; 0x022E4B88
	stmdb sp!, {r3, lr}
	ldr r1, _022E4BC8 ; =0x02324F74
	mvn r2, #0
	strh r2, [r1, #6]
	strh r2, [r1, #0xa]
	strh r2, [r1, #8]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	mov r0, #0
	strb r0, [r1]
	ldr r0, _022E4BCC ; =0x02324F82
	strh r2, [r1, #0xc]
	bl ov11_022E45F4
	ldr r0, _022E4BD0 ; =0x02324F8A
	bl ov11_022E45F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4BC8: .word 0x02324F74
_022E4BCC: .word 0x02324F82
_022E4BD0: .word 0x02324F8A
	arm_func_end ov11_022E4B88

	arm_func_start ov11_022E4BD4
ov11_022E4BD4: ; 0x022E4BD4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x8c
	mov r5, r0
	mov r4, r1
	cmp r5, #2
	bne _022E4C1C
	add r1, sp, #0
	mov r0, r2
	bl ov11_022E469C
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CB8 ; =0x023196B0
	add r0, sp, #9
	add r3, sp, #0
	bl Sprintf
	ldr r4, _022E4CBC ; =0x02324C8C
	b _022E4C84
_022E4C1C:
	cmp r5, #3
	bne _022E4C54
	add r1, sp, #0
	mov r0, r2
	bl ov11_022E469C
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CC0 ; =0x023196C4
	add r0, sp, #9
	add r3, sp, #0
	bl Sprintf
	ldr r4, _022E4CC4 ; =0x02324C6C
	b _022E4C84
_022E4C54:
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CC8 ; =0x023196D8
	add r0, sp, #9
	bl Sprintf
	add r0, sp, #9
	bl sub_02008BA8
	cmp r0, #0
	movle r0, #0
	ble _022E4CB0
	ldr r4, _022E4CCC ; =0x02324C94
_022E4C84:
	ldr r1, _022E4CD0 ; =0x023196EC
	add r3, sp, #9
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	ldmia r4, {r0, r1}
	bl MemZero
	add r1, sp, #9
	mov r0, r4
	bl sub_02008C18
	mov r0, #1
_022E4CB0:
	add sp, sp, #0x8c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E4CB8: .word 0x023196B0
_022E4CBC: .word 0x02324C8C
_022E4CC0: .word 0x023196C4
_022E4CC4: .word 0x02324C6C
_022E4CC8: .word 0x023196D8
_022E4CCC: .word 0x02324C94
_022E4CD0: .word 0x023196EC
	arm_func_end ov11_022E4BD4

	arm_func_start ov11_022E4CD4
ov11_022E4CD4: ; 0x022E4CD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	mov sb, r1
	mov sl, r0
	mov r8, r2
	ldr r1, _022E4FC4 ; =0x02319714
	mov r2, sl
	mov r3, sb
	mov r0, #2
	bl DebugPrint
	cmp sl, #2
	ldreq r0, _022E4FC8 ; =0x02324C6C
	ldreq r4, [r0, #0x20]
	beq _022E4D20
	cmp sl, #3
	ldreq r0, _022E4FC8 ; =0x02324C6C
	ldreq r4, [r0]
	ldrne r0, _022E4FC8 ; =0x02324C6C
	ldrne r4, [r0, #0x28]
_022E4D20:
	ldrh r1, [r4, #2]
	mov r0, #0xa
	mvn fp, #0
	mla r0, sb, r0, r1
	add r5, r4, r0, lsl #1
	mov r0, r0, lsl #1
	ldrh r0, [r4, r0]
	ldrh r1, [r5, #2]
	mov r7, #0
	str r0, [sp, #8]
	add r0, fp, #0x10000
	add r6, r4, r1, lsl #1
	str r0, [sp, #0x10]
	b _022E4DC0
_022E4D58:
	ldrh r0, [r6]
	mov r2, sl
	mov r3, sb
	strh r0, [sp, #0x38]
	ldrh r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [sp, #0x3a]
	ldrh r0, [r6, #4]
	strb r0, [sp, #0x3b]
	ldrh r0, [r6, #6]
	strb r0, [sp, #0x3c]
	ldrh r0, [r6, #8]
	strb r0, [sp, #0x3d]
	ldrh r0, [r6, #0xa]
	strb r0, [sp, #0x3e]
	ldrh r1, [r6, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	streqh fp, [sp, #0x40]
	strneh r1, [sp, #0x40]
	mov r0, fp
	add r1, sp, #0x38
	str r8, [sp]
	bl ov11_022F7E78
	add r7, r7, #1
	add r6, r6, #0x10
_022E4DC0:
	ldr r0, [sp, #8]
	cmp r7, r0
	blt _022E4D58
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #6]
	mvn fp, #0
	str r0, [sp, #4]
	add r0, fp, #0x10000
	mov r7, #0
	add r6, r4, r1, lsl #1
	str r0, [sp, #0x14]
	b _022E4E68
_022E4DF0:
	ldrh r0, [r6]
	mov r2, sl
	mov r3, sb
	strh r0, [sp, #0x2c]
	ldrh r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [sp, #0x2e]
	ldrh r0, [r6, #4]
	strb r0, [sp, #0x2f]
	ldrh r0, [r6, #6]
	strb r0, [sp, #0x30]
	ldrh r0, [r6, #8]
	strb r0, [sp, #0x31]
	ldrh r0, [r6, #0xa]
	strb r0, [sp, #0x32]
	ldrh r0, [r6, #0xc]
	strb r0, [sp, #0x33]
	ldrh r0, [r6, #0xe]
	strb r0, [sp, #0x34]
	ldrh r1, [r6, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	streqh fp, [sp, #0x36]
	strneh r1, [sp, #0x36]
	mov r0, fp
	add r1, sp, #0x2c
	str r8, [sp]
	bl ov11_022FBEC4
	add r7, r7, #1
	add r6, r6, #0x14
_022E4E68:
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _022E4DF0
	ldrh r0, [r5, #0xa]
	ldrh fp, [r5, #8]
	mov r7, #0
	add r6, r4, r0, lsl #1
	mvn r0, #0
	str r0, [sp, #0xc]
	b _022E4EF4
_022E4E90:
	ldrh r2, [r6]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x22
	strh r2, [sp, #0x22]
	ldrh ip, [r6, #2]
	mov r2, sl
	mov r3, sb
	sub ip, ip, #1
	strb ip, [sp, #0x24]
	ldrh ip, [r6, #4]
	strb ip, [sp, #0x25]
	ldrh ip, [r6, #6]
	strb ip, [sp, #0x26]
	ldrh ip, [r6, #8]
	strb ip, [sp, #0x27]
	ldrh ip, [r6, #0xa]
	strb ip, [sp, #0x28]
	ldrh ip, [r6, #0xc]
	strb ip, [sp, #0x29]
	ldrh ip, [r6, #0xe]
	strb ip, [sp, #0x2a]
	str r8, [sp]
	bl ov11_022FD72C
	add r7, r7, #1
	add r6, r6, #0x14
_022E4EF4:
	cmp r7, fp
	blt _022E4E90
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022E4FB8
	ldrh r0, [r5, #0xe]
	ldrh r7, [r5, #0xc]
	mvn r5, #0
	mov r8, #0
	add r6, r4, r0, lsl #1
	add fp, r5, #0x8000
	b _022E4FB0
_022E4F34:
	ldrh r1, [r6, #0xc]
	tst r1, #0x8000
	andne r0, r1, fp
	strneh r0, [sp, #0x18]
	strneh r5, [sp, #0x20]
	bne _022E4F64
	mov r0, r1, lsl #1
	ldrsh r0, [r4, r0]
	add r1, r4, r1, lsl #1
	strh r0, [sp, #0x18]
	ldrsh r0, [r1, #6]
	strh r0, [sp, #0x20]
_022E4F64:
	ldrh r2, [r6]
	mov r0, r5
	add r1, sp, #0x18
	strb r2, [sp, #0x1a]
	ldrh ip, [r6, #2]
	mov r2, sl
	mov r3, sb
	strb ip, [sp, #0x1b]
	ldrh ip, [r6, #4]
	strb ip, [sp, #0x1c]
	ldrh ip, [r6, #6]
	strb ip, [sp, #0x1d]
	ldrh ip, [r6, #8]
	strb ip, [sp, #0x1e]
	ldrh ip, [r6, #0xa]
	strb ip, [sp, #0x1f]
	bl ov11_022FEA98
	add r8, r8, #1
	add r6, r6, #0x10
_022E4FB0:
	cmp r8, r7
	blt _022E4F34
_022E4FB8:
	mov r0, #1
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E4FC4: .word 0x02319714
_022E4FC8: .word 0x02324C6C
	arm_func_end ov11_022E4CD4

	arm_func_start ov11_022E4FCC
ov11_022E4FCC: ; 0x022E4FCC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x90
	mov r5, r1
	mov r4, r2
	cmp r0, #3
	bne _022E5014
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E512C ; =0x02319730
	add r0, sp, #0xd
	add r3, sp, #4
	bl Sprintf
	ldr r0, _022E5130 ; =0x02324C84
	b _022E511C
_022E5014:
	cmp r0, #5
	bne _022E5050
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5134 ; =0x02319744
	add r0, sp, #0xd
	add r3, sp, #4
	str r4, [sp]
	bl Sprintf
	ldr r0, _022E5130 ; =0x02324C84
	b _022E511C
_022E5050:
	cmp r0, #4
	bne _022E507C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5138 ; =0x0231975C
	add r0, sp, #0xd
	mov r3, r4
	bl Sprintf
	ldr r0, _022E5130 ; =0x02324C84
	b _022E511C
_022E507C:
	cmp r0, #6
	bne _022E50A8
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	ldr r1, _022E513C ; =0x02319774
	add r0, sp, #0xd
	add r2, sp, #4
	bl Sprintf
	ldr r0, _022E5130 ; =0x02324C84
	b _022E511C
_022E50A8:
	cmp r0, #2
	bne _022E50E8
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	mov ip, #0
	ldr r1, _022E5134 ; =0x02319744
	add r0, sp, #0xd
	add r3, sp, #4
	str ip, [sp]
	bl Sprintf
	ldr r0, _022E5140 ; =0x02324C7C
	b _022E511C
_022E50E8:
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5138 ; =0x0231975C
	add r0, sp, #0xd
	mov r3, #0
	bl Sprintf
	add r0, sp, #0xd
	bl sub_02008BA8
	cmp r0, #0
	movle r0, #0
	ble _022E5124
	ldr r0, _022E5144 ; =0x02324C74
_022E511C:
	add r1, sp, #0xd
	bl ov11_022E5D50
_022E5124:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E512C: .word 0x02319730
_022E5130: .word 0x02324C84
_022E5134: .word 0x02319744
_022E5138: .word 0x0231975C
_022E513C: .word 0x02319774
_022E5140: .word 0x02324C7C
_022E5144: .word 0x02324C74
	arm_func_end ov11_022E4FCC

	arm_func_start ov11_022E5148
ov11_022E5148: ; 0x022E5148
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E5180 ; =0x0231978C
	mov r2, r4
	mov r0, #2
	bl DebugPrint
	ldr r0, _022E5184 ; =0x02324F74
	ldrsh r0, [r0, #6]
	cmp r0, r4
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov11_022DCB28
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5180: .word 0x0231978C
_022E5184: .word 0x02324F74
	arm_func_end ov11_022E5148

	arm_func_start ov11_022E5188
ov11_022E5188: ; 0x022E5188
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl GetDebugFlag2
	cmp r0, #0
	beq _022E51C8
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E524C ; =0x023197B4
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl DebugPrint
_022E51C8:
	mov r0, r5
	bl ov11_022E5148
	cmp r0, #0
	movne r0, #1
	bne _022E5244
	ldr r0, _022E5250 ; =0x02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r5
	bne _022E5210
	cmp r5, #0
	movlt r0, #0
	blt _022E5244
	ldr r0, _022E5254 ; =0x02324F82
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E5244
_022E5210:
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022F85C0
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FC494
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FDC34
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FEC9C
	mov r0, #1
_022E5244:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E524C: .word 0x023197B4
_022E5250: .word 0x02324F74
_022E5254: .word 0x02324F82
	arm_func_end ov11_022E5188

	arm_func_start ov11_022E5258
ov11_022E5258: ; 0x022E5258
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl GetDebugFlag2
	cmp r0, #0
	beq _022E5298
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5308 ; =0x023197D8
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl DebugPrint
_022E5298:
	ldr r0, _022E530C ; =0x02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r5
	bne _022E52CC
	cmp r5, #0
	movlt r0, #0
	blt _022E5300
	ldr r0, _022E5310 ; =0x02324F82
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E5300
_022E52CC:
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022F85C0
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FC494
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FDC34
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FEC9C
	mov r0, #1
_022E5300:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E5308: .word 0x023197D8
_022E530C: .word 0x02324F74
_022E5310: .word 0x02324F82
	arm_func_end ov11_022E5258

	arm_func_start ov11_022E5314
ov11_022E5314: ; 0x022E5314
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl GetDebugFlag2
	cmp r0, #0
	beq _022E5354
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E53D8 ; =0x02319800
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl DebugPrint
_022E5354:
	mov r0, r5
	bl ov11_022E5148
	cmp r0, #0
	movne r0, #1
	bne _022E53D0
	ldr r1, _022E53DC ; =0x02324F74
	mvn r0, #0
	ldrsh r2, [r1, #0xc]
	cmp r2, r0
	ldreqsh r0, [r1, #4]
	cmpeq r0, r5
	bne _022E53A8
	cmp r5, #0
	movlt r0, #0
	blt _022E53D0
	ldr r0, _022E53E0 ; =0x02324F8A
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E53D0
_022E53A8:
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	mov r0, #1
_022E53D0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E53D8: .word 0x02319800
_022E53DC: .word 0x02324F74
_022E53E0: .word 0x02324F8A
	arm_func_end ov11_022E5314

	arm_func_start ov11_022E53E4
ov11_022E53E4: ; 0x022E53E4
	stmdb sp!, {r3, lr}
	ldr r1, _022E5444 ; =0x02319828
	mov r2, r0
	mov r0, #2
	bl DebugPrint
	ldr r1, _022E5448 ; =0x02324F74
	mvn r0, #0
	ldrsh r2, [r1, #0xc]
	cmp r2, r0
	ldreqsh r1, [r1, #4]
	cmpeq r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5444: .word 0x02319828
_022E5448: .word 0x02324F74
	arm_func_end ov11_022E53E4

	arm_func_start ov11_022E544C
ov11_022E544C: ; 0x022E544C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, _022E550C ; =0x0231984C
	mov r2, r4
	mov r0, #2
	bl DebugPrint
	ldr r1, _022E5510 ; =0x02324F74
	ldrsh r0, [r1, #6]
	cmp r0, r4
	moveq r0, #0
	beq _022E5504
	mvn r2, #0
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #2]
	ldr r0, _022E5514 ; =0x02324F82
	strh r2, [r1, #4]
	bl ov11_022E45F4
	ldr r0, _022E5518 ; =0x02324F8A
	bl ov11_022E45F4
	cmp r4, #0
	ldrlt r0, _022E5510 ; =0x02324F74
	mvnlt r1, #0
	strlth r1, [r0, #6]
	blt _022E5500
	ldr r0, _022E5510 ; =0x02324F74
	strh r4, [r0, #6]
	bl ov11_022E5A68
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl ov11_022E4BD4
	cmp r0, #0
	ldrne r0, _022E5510 ; =0x02324F74
	mov r3, #0
	strneh r4, [r0, #8]
	mov r0, #1
	mov r1, r4
	sub r2, r0, #2
	str r3, [sp]
	bl ov11_022E4FCC
	cmp r0, #0
	ldrne r0, _022E5510 ; =0x02324F74
	strneh r4, [r0, #0xa]
_022E5500:
	mov r0, #1
_022E5504:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E550C: .word 0x0231984C
_022E5510: .word 0x02324F74
_022E5514: .word 0x02324F82
_022E5518: .word 0x02324F8A
	arm_func_end ov11_022E544C

	arm_func_start ov11_022E551C
ov11_022E551C: ; 0x022E551C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r0, #2
	mov r5, r1
	mov r4, r2
	bl GetDebugFlag2
	cmp r0, #0
	beq _022E5564
	add r1, sp, #4
	mov r0, r5
	bl ov11_022E466C
	ldr r1, _022E56AC ; =0x0231986C
	add r3, sp, #4
	mov r2, r6
	mov r0, #2
	str r4, [sp]
	bl DebugPrint
_022E5564:
	ldr r0, _022E56B0 ; =0x02324F74
	ldrsh r0, [r0, #6]
	cmp r0, r6
	beq _022E557C
	mov r0, r6
	bl ov11_022E544C
_022E557C:
	ldr r0, _022E56B0 ; =0x02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r6
	bne _022E55B0
	cmp r6, #0
	movlt r0, #0
	blt _022E56A4
	ldr r0, _022E56B4 ; =0x02324F82
	mov r1, r5
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E56A4
_022E55B0:
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022F85C0
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FC494
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FDC34
	mov r0, #2
	sub r1, r0, #4
	bl ov11_022FEC9C
	cmp r6, #0
	bge _022E5610
	ldr r1, _022E56B0 ; =0x02324F74
	mvn r2, #0
	ldr r0, _022E56B4 ; =0x02324F82
	strh r2, [r1, #2]
	bl ov11_022E45F4
	ldr r0, _022E56B0 ; =0x02324F74
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E56A4
_022E5610:
	mov r1, r6
	mov r2, r5
	mov r0, #2
	bl ov11_022E4BD4
	cmp r0, #0
	beq _022E5684
	ldr r0, _022E56B0 ; =0x02324F74
	ldr r2, _022E56B4 ; =0x02324F82
	mov r3, r5
	strh r6, [r0, #2]
	mov r1, #8
_022E563C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022E563C
	mov r0, #2
	mov r1, r6
	mov r3, r5
	sub r2, r0, #3
	str r4, [sp]
	bl ov11_022E4FCC
	cmp r0, #0
	ldrne r0, _022E56B0 ; =0x02324F74
	movne r1, #1
	ldreq r0, _022E56B0 ; =0x02324F74
	moveq r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E56A4
_022E5684:
	ldr r1, _022E56B0 ; =0x02324F74
	mvn r2, #0
	ldr r0, _022E56B4 ; =0x02324F82
	strh r2, [r1, #2]
	bl ov11_022E45F4
	ldr r1, _022E56B0 ; =0x02324F74
	mov r0, #0
	strb r0, [r1]
_022E56A4:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E56AC: .word 0x0231986C
_022E56B0: .word 0x02324F74
_022E56B4: .word 0x02324F82
	arm_func_end ov11_022E551C

	arm_func_start ov11_022E56B8
ov11_022E56B8: ; 0x022E56B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r5, r0
	mov r0, #2
	mov r4, r1
	mov r6, r2
	bl GetDebugFlag2
	cmp r0, #0
	beq _022E5700
	add r1, sp, #0xd
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5838 ; =0x02319888
	add r3, sp, #0xd
	mov r2, r5
	mov r0, #2
	str r6, [sp]
	bl DebugPrint
_022E5700:
	ldr r0, _022E583C ; =0x02324F74
	mvn r1, #0
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #6]
	cmp r0, r5
	beq _022E5720
	mov r0, r5
	bl ov11_022E544C
_022E5720:
	ldr r0, _022E583C ; =0x02324F74
	ldrsh r0, [r0, #4]
	cmp r0, r5
	bne _022E5754
	cmp r5, #0
	movlt r0, #0
	blt _022E5830
	ldr r0, _022E5840 ; =0x02324F8A
	mov r1, r4
	bl ov11_022E465C
	cmp r0, #0
	movne r0, #0
	bne _022E5830
_022E5754:
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	cmp r5, #0
	bge _022E579C
	ldr r1, _022E583C ; =0x02324F74
	mvn r2, #0
	ldr r0, _022E5840 ; =0x02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r0, #1
	b _022E5830
_022E579C:
	mov r1, r5
	mov r2, r4
	mov r0, #3
	bl ov11_022E4BD4
	cmp r0, #0
	beq _022E5818
	ldr r0, _022E583C ; =0x02324F74
	ldr r2, _022E5840 ; =0x02324F8A
	mov r3, r4
	strh r5, [r0, #4]
	mov r1, #8
_022E57C8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022E57C8
	add r1, sp, #4
	mov r0, r4
	bl ov11_022E469C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5844 ; =0x02319730
	add r0, sp, #0x16
	add r3, sp, #4
	bl Sprintf
	ldr r0, _022E5848 ; =0x02324C84
	add r1, sp, #0x16
	bl ov11_022E5D50
	cmp r0, #0
	movne r0, #1
	bne _022E5830
_022E5818:
	ldr r1, _022E583C ; =0x02324F74
	mvn r2, #0
	ldr r0, _022E5840 ; =0x02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r0, #0
_022E5830:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5838: .word 0x02319888
_022E583C: .word 0x02324F74
_022E5840: .word 0x02324F8A
_022E5844: .word 0x02319730
_022E5848: .word 0x02324C84
	arm_func_end ov11_022E56B8

	arm_func_start ov11_022E584C
ov11_022E584C: ; 0x022E584C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #2
	bl GetDebugFlag2
	cmp r0, #0
	beq _022E5884
	add r1, sp, #4
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5900 ; =0x023198AC
	add r2, sp, #4
	mov r0, #2
	bl DebugPrint
_022E5884:
	ldr r1, _022E5904 ; =0x02324F74
	mvn r2, #0
	ldr r0, _022E5908 ; =0x02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r2, #0
	ldr r0, _022E5904 ; =0x02324F74
	str r2, [sp]
	ldrsh r1, [r0, #8]
	mov r3, r4
	mov r0, #6
	bl ov11_022E4FCC
	mov r4, r0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	cmp r4, #0
	ldrne r0, _022E5904 ; =0x02324F74
	movne r1, #6
	ldreq r0, _022E5904 ; =0x02324F74
	mvneq r1, #0
	strh r1, [r0, #0xc]
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5900: .word 0x023198AC
_022E5904: .word 0x02324F74
_022E5908: .word 0x02324F8A
	arm_func_end ov11_022E584C

	arm_func_start ov11_022E590C
ov11_022E590C: ; 0x022E590C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	ldr r1, _022E59D8 ; =0x023198D0
	mov r2, r4
	mov r3, r5
	mov r0, #2
	bl DebugPrint
	ldr r1, _022E59DC ; =0x02324F74
	mvn r2, #0
	ldr r0, _022E59E0 ; =0x02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	cmp r4, #2
	bne _022E5970
	ldr r0, _022E59DC ; =0x02324F74
	mov r1, #0
	str r1, [sp]
	ldrsh r1, [r0, #2]
	mov r4, #5
	ldr r3, _022E59E4 ; =0x02324F82
	mov r0, r4
	mov r2, r5
	bl ov11_022E4FCC
	b _022E5990
_022E5970:
	mov r3, #0
	ldr r0, _022E59DC ; =0x02324F74
	str r3, [sp]
	ldrsh r1, [r0, #8]
	mov r4, #4
	mov r0, r4
	mov r2, r5
	bl ov11_022E4FCC
_022E5990:
	mov r5, r0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022F85C0
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FC494
	mov r0, #3
	sub r1, r0, #5
	bl ov11_022FDC34
	cmp r5, #0
	ldrne r0, _022E59DC ; =0x02324F74
	mvneq r1, #0
	strneh r4, [r0, #0xc]
	ldreq r0, _022E59DC ; =0x02324F74
	streqh r1, [r0, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E59D8: .word 0x023198D0
_022E59DC: .word 0x02324F74
_022E59E0: .word 0x02324F8A
_022E59E4: .word 0x02324F82
	arm_func_end ov11_022E590C

	arm_func_start ov11_022E59E8
ov11_022E59E8: ; 0x022E59E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl ov11_022FEBFC
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl ov11_022E4CD4
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E59E8

	arm_func_start ov11_022E5A10
ov11_022E5A10: ; 0x022E5A10
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #2
	bl ov11_022FEBFC
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl ov11_022E4CD4
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5A10

	arm_func_start ov11_022E5A38
ov11_022E5A38: ; 0x022E5A38
	ldr ip, _022E5A4C ; =ov11_022E4CD4
	mov r1, r0
	mov r0, #3
	mov r2, #0
	bx ip
	.align 2, 0
_022E5A4C: .word ov11_022E4CD4
	arm_func_end ov11_022E5A38

	arm_func_start ov11_022E5A50
ov11_022E5A50: ; 0x022E5A50
	ldr ip, _022E5A64 ; =ov11_022E4CD4
	mov r1, r0
	mov r0, #3
	mov r2, #1
	bx ip
	.align 2, 0
_022E5A64: .word ov11_022E4CD4
	arm_func_end ov11_022E5A50

	arm_func_start ov11_022E5A68
ov11_022E5A68: ; 0x022E5A68
	stmdb sp!, {r3, lr}
	ldr r1, _022E5A94 ; =0x023198F0
	mov r0, #2
	bl DebugPrint
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl ov11_022F7D18
	bl ov11_022FBE04
	bl ov11_022FD66C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5A94: .word 0x023198F0
	arm_func_end ov11_022E5A68

	arm_func_start ov11_022E5A98
ov11_022E5A98: ; 0x022E5A98
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl ov11_022F8408
	mov r1, r4
	mov r0, #1
	bl ov11_022FC2DC
	mov r1, r4
	mov r0, #1
	bl ov11_022FDA7C
	mov r1, r4
	mov r0, #1
	bl ov11_022FEBFC
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5A98

	arm_func_start ov11_022E5AD4
ov11_022E5AD4: ; 0x022E5AD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #2
	bl ov11_022F8408
	mov r1, r4
	mov r0, #2
	bl ov11_022FC2DC
	mov r1, r4
	mov r0, #2
	bl ov11_022FDA7C
	mov r1, r4
	mov r0, #2
	bl ov11_022FEBFC
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5AD4

	arm_func_start ov11_022E5B10
ov11_022E5B10: ; 0x022E5B10
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #3
	bl ov11_022F8408
	mov r1, r4
	mov r0, #3
	bl ov11_022FC2DC
	mov r1, r4
	mov r0, #3
	bl ov11_022FDA7C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5B10

	arm_func_start ov11_022E5B40
ov11_022E5B40: ; 0x022E5B40
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, r5
	mov r0, #1
	bl ov11_022F8C18
	mov r4, r0
	mov r1, r5
	mov r0, #1
	bl ov11_022FC8C4
	orr r4, r4, r0
	mov r1, r5
	mov r0, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022E5B40

	arm_func_start ov11_022E5B7C
ov11_022E5B7C: ; 0x022E5B7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, r5
	mov r0, #2
	bl ov11_022F8C18
	mov r4, r0
	mov r1, r5
	mov r0, #2
	bl ov11_022FC8C4
	orr r4, r4, r0
	mov r1, r5
	mov r0, #2
	bl ov11_022FDFD4
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022E5B7C

	arm_func_start ov11_022E5BB8
ov11_022E5BB8: ; 0x022E5BB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, r5
	mov r0, #3
	bl ov11_022F8C18
	mov r4, r0
	mov r1, r5
	mov r0, #3
	bl ov11_022FC8C4
	orr r4, r4, r0
	mov r1, r5
	mov r0, #3
	bl ov11_022FDFD4
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022E5BB8

	arm_func_start ov11_022E5BF4
ov11_022E5BF4: ; 0x022E5BF4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	mov r1, #0
	str r1, [sp]
	ldr r2, _022E5C80 ; =0x02324F74
	mov r1, #1
	ldrsh r3, [r2, #0xc]
	mov r4, r0
	add r0, sp, #4
	sub r2, r1, #2
	bl ov11_022E5EFC
	cmp r0, #0
	moveq r0, #0
	beq _022E5C78
	add r0, sp, #4
	strh r4, [sp, #0x1c]
	bl ov11_022F7594
	ldr r1, _022E5C80 ; =0x02324F74
	mov r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022F8C18
	ldr r1, _022E5C80 ; =0x02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FC8C4
	ldr r1, _022E5C80 ; =0x02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
_022E5C78:
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5C80: .word 0x02324F74
	arm_func_end ov11_022E5BF4

	arm_func_start ov11_022E5C84
ov11_022E5C84: ; 0x022E5C84
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	mov r1, #0
	str r1, [sp]
	ldr r0, _022E5D10 ; =0x02324F74
	mov r1, #1
	ldrsh r3, [r0, #0xc]
	add r0, sp, #4
	sub r2, r1, #2
	bl ov11_022E5EFC
	cmp r0, #0
	moveq r0, #0
	beq _022E5D08
	mov r1, #1
	add r0, sp, #4
	strh r1, [sp, #0x1c]
	bl ov11_022F7594
	ldr r1, _022E5D10 ; =0x02324F74
	mov r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022F8C18
	ldr r1, _022E5D10 ; =0x02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FC8C4
	ldr r1, _022E5D10 ; =0x02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
_022E5D08:
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5D10: .word 0x02324F74
	arm_func_end ov11_022E5C84

	arm_func_start ov11_022E5D14
ov11_022E5D14: ; 0x022E5D14
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #3
	bl ov11_022F8E70
	mov r1, r4
	mov r0, #3
	bl ov11_022FCA9C
	mov r1, r4
	mov r0, #3
	bl ov11_022FE1AC
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E5D14

	arm_func_start ov11_022E5D50
ov11_022E5D50: ; 0x022E5D50
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	mov r5, r1
	mov r4, r0
	ldr r1, _022E5EF4 ; =0x02319908
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	bl DataTransferInit
	add r0, sp, #0xc
	bl FileInitVeneer
	add r0, sp, #0xc
	mov r1, r5
	bl FileOpen
	add r0, sp, #0xc
	add r1, sp, #0
	mov r2, #0xc
	bl FileRead
	ldrh r3, [sp, #4]
	ldrh r2, [sp, #6]
	ldr r0, _022E5EF8 ; =0x02324F74
	add r1, sp, #0
	add r3, r3, r2
	ldrsb r2, [r0, #1]
	ldr r0, [r4]
	cmp r0, #0
	add r0, r2, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r0, r3, r0
	mov r0, r0, lsl #1
	bne _022E5DE0
	mov r1, #1
	str r0, [r4, #4]
	bl MemAlloc
	str r0, [r4]
_022E5DE0:
	ldrh r2, [sp, #4]
	ldr r1, [r4]
	add r0, sp, #0xc
	mov r2, r2, lsl #1
	bl FileRead
	ldrh r0, [sp]
	cmp r0, #0
	beq _022E5E24
	ldrh r1, [sp, #4]
	ldrh r0, [sp, #2]
	ldrh r2, [sp, #6]
	ldr r3, [r4]
	add r1, r1, r0
	add r0, sp, #0xc
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRead
_022E5E24:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022E5EDC
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldr r0, _022E5EF8 ; =0x02324F74
	mov r3, #0
	add r1, r2, r1
	add r2, r1, #6
	ldrsb ip, [r0, #1]
	add r1, sp, #0
	b _022E5E64
_022E5E54:
	add r0, r1, r3, lsl #1
	ldrh r0, [r0, #8]
	add r3, r3, #1
	add r2, r2, r0
_022E5E64:
	cmp r3, ip
	blt _022E5E54
	mov r1, r2, lsl #1
	add r0, sp, #0xc
	mov r2, #0
	bl FileSeek
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	ldr r3, [r4]
	add r0, sp, #0xc
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRead
	ldr r0, _022E5EF8 ; =0x02324F74
	add r1, sp, #0
	ldrsb r0, [r0, #1]
	ldrh ip, [sp, #2]
	ldrh r2, [sp, #4]
	add r0, r0, #4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	add r1, ip, r2
	ldrh r3, [sp, #6]
	sub r2, r0, ip
	ldr r4, [r4]
	add r1, r3, r1
	add r0, sp, #0xc
	add r1, r4, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRead
_022E5EDC:
	add r0, sp, #0xc
	bl FileClose
	bl DataTransferStop
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E5EF4: .word 0x02319908
_022E5EF8: .word 0x02324F74
	arm_func_end ov11_022E5D50

	arm_func_start ov11_022E5EFC
ov11_022E5EFC: ; 0x022E5EFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r7, r3
	mov sl, r0
	cmp r7, #3
	ldreq r0, _022E608C ; =0x02324C6C
	mov sb, r1
	mov r8, r2
	mov r6, #0
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #5
	ldreq r0, _022E608C ; =0x02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #4
	ldreq r0, _022E608C ; =0x02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #6
	ldreq r0, _022E608C ; =0x02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #2
	ldreq r0, _022E608C ; =0x02324C6C
	ldreq r4, [r0, #0x10]
	beq _022E5F90
	ldr r2, _022E6090 ; =0x02324F74
	sub r1, r6, #1
	ldrsh r2, [r2, #0xa]
	cmp r2, r1
	bne _022E5F88
	bl ov11_022DC89C
	mov r0, r6
	b _022E6084
_022E5F88:
	ldr r0, _022E608C ; =0x02324C6C
	ldr r4, [r0, #8]
_022E5F90:
	ldrh r0, [r4, #2]
	cmp sb, #3
	add r5, r4, #4
	str r0, [sp]
	bne _022E5FF4
	mov fp, #0
	b _022E5FE4
_022E5FAC:
	ldrh r0, [r5, #2]
	cmp r0, sb
	bne _022E5FDC
	ldrh r1, [r5, #4]
	add r0, sp, #4
	strh r1, [sp, #4]
	bl sub_02065050
	ldrsh r0, [sp, #4]
	cmp r0, r8
	ldreqh r0, [r5]
	addeq r6, r4, r0, lsl #1
	beq _022E603C
_022E5FDC:
	add r5, r5, #6
	add fp, fp, #1
_022E5FE4:
	ldr r0, [sp]
	cmp fp, r0
	blt _022E5FAC
	b _022E603C
_022E5FF4:
	mov r1, #0
	b _022E6030
_022E5FFC:
	ldrh r0, [r5, #2]
	cmp r0, sb
	bne _022E6028
	cmp r8, #0
	blt _022E601C
	ldrh r0, [r5, #4]
	cmp r0, r8
	bne _022E6028
_022E601C:
	ldrh r0, [r5]
	add r6, r4, r0, lsl #1
	b _022E603C
_022E6028:
	add r5, r5, #6
	add r1, r1, #1
_022E6030:
	ldr r0, [sp]
	cmp r1, r0
	blt _022E5FFC
_022E603C:
	cmp r6, #0
	beq _022E6078
	stmia sl, {r4, r6}
	ldrh r0, [r4]
	ldrsb r1, [sp, #0x30]
	add r0, r4, r0, lsl #1
	str r0, [sl, #8]
	cmp r1, #0
	strh r7, [sl, #0x14]
	movlt r1, #0
	strb r1, [sl, #0x16]
	mvn r0, #0
	strh r0, [sl, #0x18]
	mov r0, #1
	b _022E6084
_022E6078:
	mov r0, sl
	bl ov11_022DC89C
	mov r0, #0
_022E6084:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E608C: .word 0x02324C6C
_022E6090: .word 0x02324F74
	arm_func_end ov11_022E5EFC

	arm_func_start ov11_022E6094
ov11_022E6094: ; 0x022E6094
	ldr r0, _022E60A4 ; =0x02324C9C
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E60A4: .word 0x02324C9C
	arm_func_end ov11_022E6094

	arm_func_start ov11_022E60A8
ov11_022E60A8: ; 0x022E60A8
	ldr r0, _022E60B8 ; =0x02324C9C
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E60B8: .word 0x02324C9C
	arm_func_end ov11_022E60A8

	arm_func_start ov11_022E60BC
ov11_022E60BC: ; 0x022E60BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x144
	mov r5, r0
	mov r4, r1
	ldr r1, _022E68C4 ; =0x02319924
	mov r2, r5
	mov r0, #2
	bl DebugPrint
	ldr r1, _022E68C8 ; =0x02324C9C
	mov r0, #1
	strb r0, [r1]
	cmp r5, #0x4c
	addls pc, pc, r5, lsl #2
	b _022E68AC
_022E60F4: ; jump table
	b _022E68AC ; case 0
	b _022E624C ; case 1
	b _022E6260 ; case 2
	b _022E6274 ; case 3
	b _022E6294 ; case 4
	b _022E68AC ; case 5
	b _022E68AC ; case 6
	b _022E68AC ; case 7
	b _022E68AC ; case 8
	b _022E68AC ; case 9
	b _022E68AC ; case 10
	b _022E6704 ; case 11
	b _022E62D4 ; case 12
	b _022E62FC ; case 13
	b _022E68AC ; case 14
	b _022E62E0 ; case 15
	b _022E6304 ; case 16
	b _022E68AC ; case 17
	b _022E62E8 ; case 18
	b _022E62F4 ; case 19
	b _022E6310 ; case 20
	b _022E6398 ; case 21
	b _022E68AC ; case 22
	b _022E63A0 ; case 23
	b _022E68AC ; case 24
	b _022E63A8 ; case 25
	b _022E68AC ; case 26
	b _022E63D0 ; case 27
	b _022E68AC ; case 28
	b _022E63B0 ; case 29
	b _022E63B8 ; case 30
	b _022E63C0 ; case 31
	b _022E63C8 ; case 32
	b _022E68AC ; case 33
	b _022E68AC ; case 34
	b _022E6440 ; case 35
	b _022E6510 ; case 36
	b _022E68AC ; case 37
	b _022E68AC ; case 38
	b _022E6518 ; case 39
	b _022E6524 ; case 40
	b _022E652C ; case 41
	b _022E6474 ; case 42
	b _022E6678 ; case 43
	b _022E68AC ; case 44
	b _022E68AC ; case 45
	b _022E68AC ; case 46
	b _022E68AC ; case 47
	b _022E6228 ; case 48
	b _022E6238 ; case 49
	b _022E68AC ; case 50
	b _022E68AC ; case 51
	b _022E6878 ; case 52
	b _022E6890 ; case 53
	b _022E6718 ; case 54
	b _022E6720 ; case 55
	b _022E6728 ; case 56
	b _022E63D8 ; case 57
	b _022E63EC ; case 58
	b _022E6400 ; case 59
	b _022E642C ; case 60
	b _022E6844 ; case 61
	b _022E686C ; case 62
	b _022E631C ; case 63
	b _022E6338 ; case 64
	b _022E6354 ; case 65
	b _022E6730 ; case 66
	b _022E638C ; case 67
	b _022E6384 ; case 68
	b _022E6378 ; case 69
	b _022E636C ; case 70
	b _022E6758 ; case 71
	b _022E68AC ; case 72
	b _022E67B8 ; case 73
	b _022E67D4 ; case 74
	b _022E67DC ; case 75
	b _022E67E4 ; case 76
_022E6228:
	mov r0, #0x11
	bl LoadOverlay
	bl ov17_0238A140
	b _022E68AC
_022E6238:
	mov r0, #0x11
	bl UnloadOverlay
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E624C:
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl sub_020367B4
	b _022E68AC
_022E6260:
	mov r1, #0
	mov r2, r1
	mov r0, #3
	bl sub_020367B4
	b _022E68AC
_022E6274:
	add r0, sp, #0xc0
	mov r1, #0xa
	bl sub_02065BD8
	add r1, sp, #0xc0
	mov r0, #2
	mov r2, r1
	bl sub_020367B4
	b _022E68AC
_022E6294:
	bl ov11_02310BDC
	mov r4, #0
	ldr r3, _022E68CC ; =0x0000C402
	add r0, sp, #0x60
	mov r1, #0x400
	mov r2, #0x234
	str r4, [sp]
	bl PreprocessStringFromMessageId
	add r0, sp, #0xa0
	add r1, sp, #0x60
	bl SpecialStrcpy
	add r1, sp, #0xa0
	mov r0, #1
	mov r2, r1
	bl sub_020367B4
	b _022E68AC
_022E62D4:
	mov r0, #0
	bl ov11_0230CD84
	b _022E68AC
_022E62E0:
	bl ov11_0230CBB0
	b _022E68AC
_022E62E8:
	mov r0, #0
	bl ov11_0230CD5C
	b _022E68AC
_022E62F4:
	bl ov11_0230CD5C
	b _022E68AC
_022E62FC:
	bl ov11_0230CD84
	b _022E68AC
_022E6304:
	mov r0, #0
	bl ov11_0230CBD8
	b _022E68AC
_022E6310:
	mov r0, #0
	bl ov11_0230CC00
	b _022E68AC
_022E631C:
	add r1, sp, #0x5a
	mov r0, #0
	bl sub_02065CD8
	add r0, sp, #0x5a
	mov r1, #0
	bl ov11_02302CE0
	b _022E68AC
_022E6338:
	add r1, sp, #0x54
	mov r0, #0
	bl sub_02065CD8
	add r0, sp, #0x54
	mov r1, #1
	bl ov11_02303208
	b _022E68AC
_022E6354:
	add r0, sp, #0x100
	bl ov11_022E8090
	add r0, sp, #0x100
	mov r1, #1
	bl ov11_023025E8
	b _022E68AC
_022E636C:
	mov r0, #3
	bl ov11_023039AC
	b _022E68AC
_022E6378:
	mov r0, #2
	bl ov11_023039AC
	b _022E68AC
_022E6384:
	bl ov11_023039AC
	b _022E68AC
_022E638C:
	mov r0, #0
	bl ov11_023039AC
	b _022E68AC
_022E6398:
	bl ov11_0230CBC4
	b _022E68AC
_022E63A0:
	bl ov11_0230CD48
	b _022E68AC
_022E63A8:
	bl ov11_0230CDB8
	b _022E68AC
_022E63B0:
	bl ov11_0230CC28
	b _022E68AC
_022E63B8:
	bl ov11_0230CC4C
	b _022E68AC
_022E63C0:
	bl ov11_0230CC80
	b _022E68AC
_022E63C8:
	bl ov11_0230CCA8
	b _022E68AC
_022E63D0:
	bl ov11_0230CDA4
	b _022E68AC
_022E63D8:
	mov r0, #0x12
	bl LoadOverlay
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E63EC:
	mov r0, #0x12
	bl UnloadOverlay
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6400:
	mov r0, #0
	mov r1, #0x5c
	bl LoadScriptVariableValue
	cmp r0, #1
	bne _022E6420
	mov r0, #1
	bl ov11_0230CB88
	b _022E68AC
_022E6420:
	mov r0, #0
	bl ov11_0230CB88
	b _022E68AC
_022E642C:
	mov r0, #0x12
	bl LoadOverlay
	mov r0, #2
	bl ov11_0230CB88
	b _022E68AC
_022E6440:
	mov r0, #2
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	ble _022E645C
	bl ov11_023043A8
	b _022E68AC
_022E645C:
	ldr r0, _022E68D0 ; =0x02324F94
	mov r1, #2
	str r1, [r0]
	str r1, [r4]
	mov r0, #0
	b _022E68BC
_022E6474:
	add r0, sp, #0x12
	bl sub_0204F158
	cmp r0, #0
	beq _022E6504
	add r1, sp, #0x50
	add r2, sp, #0x4c
	mov r0, #2
	bl sub_0204C5DC
	ldr r0, [sp, #0x4c]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, r0
	ldrb r2, [sp, #0x12]
	add r0, sp, #0x44
	bl sub_0205F118
	cmp r0, #0
	beq _022E6504
	ldrsh r0, [sp, #0x48]
	cmp r0, #0
	ldrsh r0, [sp, #0x46]
	movne r1, #2
	moveq r1, #0
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	ldr r0, _022E68D0 ; =0x02324F94
	adds r1, r2, r1
	str r1, [r0]
	moveq r1, #3
	streq r1, [r0]
	ldr r1, _022E68D0 ; =0x02324F94
	mov r0, #0
	ldr r1, [r1]
	str r1, [r4]
	b _022E68BC
_022E6504:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6510:
	bl ov11_02304514
	b _022E68AC
_022E6518:
	mov r0, #0
	bl ov11_02304664
	b _022E68AC
_022E6524:
	bl ov11_02304664
	b _022E68AC
_022E652C:
	add r0, sp, #0x11
	bl sub_0204F158
	cmp r0, #0
	beq _022E6644
	add r1, sp, #0x40
	add r2, sp, #0x3c
	mov r0, #2
	bl sub_0204C5DC
	ldrb r1, [sp, #0x11]
	ldr r2, [sp, #0x3c]
	ldr r0, _022E68D4 ; =0x0231993C
	bl DebugPrint0__0200C1FC
	mov r8, #0
	ldr r0, [sp, #0x3c]
	add sb, sp, #0x34
	mov r7, #0x68
	mov r6, r8
	mov r5, #0x69
	ldr fp, _022E68D8 ; =0x02319960
	b _022E663C
_022E657C:
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sl, r0
	ldrb r2, [sp, #0x11]
	mov r0, sb
	mov r1, sl
	bl sub_0205F118
	mov r0, r8
	mov r1, r7
	ldrb r2, [sl, #1]
	bl SaveScriptVariableValue
	mov r0, r6
	mov r1, r5
	ldrb r2, [sl, #2]
	bl SaveScriptVariableValue
	ldrb r1, [sl]
	mov r0, fp
	str r1, [sp]
	ldrb r1, [sp, #0x34]
	str r1, [sp, #4]
	ldrsh r1, [sp, #0x36]
	str r1, [sp, #8]
	ldrsh r1, [sp, #0x38]
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	ldrb r2, [sl, #4]
	ldrb r3, [sl, #1]
	bl DebugPrint0__0200C1FC
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _022E6630
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x3c]
	mov r0, #2
	bl SetScenarioScriptVar
	ldrsh r0, [sp, #0x36]
	ldrsh r1, [sp, #0x38]
	bl sub_02065B80
	ldrb r2, [sl, #1]
	ldr r1, _022E68D0 ; =0x02324F94
	mov r0, #0
	str r2, [r1]
	str r2, [r4]
	b _022E68BC
_022E6630:
	ldr r0, [sp, #0x3c]
	add r0, r0, #1
	str r0, [sp, #0x3c]
_022E663C:
	cmp r0, #8
	blt _022E657C
_022E6644:
	ldr r0, _022E68D0 ; =0x02324F94
	mvn r1, #0
	str r1, [r0]
	ldr r0, _022E68DC ; =0x023199B4
	str r1, [r4]
	bl DebugPrint0__0200C1FC
	bl sub_0205F504
	mov r1, #0
	mov r2, r1
	mov r0, #2
	bl SetScenarioScriptVar
	mov r0, #0
	b _022E68BC
_022E6678:
	add r0, sp, #0x10
	bl sub_0204F158
	cmp r0, #0
	beq _022E66F8
	add r1, sp, #0x30
	add r2, sp, #0x2c
	mov r0, #2
	bl sub_0204C5DC
	ldr r0, [sp, #0x2c]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, r0
	ldrb r2, [sp, #0x10]
	add r0, sp, #0x24
	bl sub_0205F118
	ldrsh r1, [sp, #0x28]
	ldr r0, _022E68E0 ; =0x023199D4
	str r1, [sp]
	ldrb r2, [sp, #0x24]
	ldrsh r3, [sp, #0x26]
	ldr r1, [sp, #0x2c]
	bl DebugPrint0__0200C1FC
	ldrb r0, [sp, #0x24]
	cmp r0, #0
	beq _022E66F8
	bl ov11_0230CDCC
	ldr r0, _022E68C8 ; =0x02324C9C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E68BC
_022E66F8:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6704:
	mov r0, #0
	strb r0, [r1]
	bl ov11_022E6EE8
	mov r0, #1
	b _022E68BC
_022E6718:
	bl ov11_0230CDE0
	b _022E68AC
_022E6720:
	bl ov11_0230CDF4
	b _022E68AC
_022E6728:
	bl ov11_0230CE08
	b _022E68AC
_022E6730:
	mov r0, #0
	bl sub_0204F244
	cmp r0, #0
	beq _022E6748
	bl ov11_0230CE1C
	b _022E68AC
_022E6748:
	mvn r0, #0
	str r0, [r4]
	mov r0, #0
	b _022E68BC
_022E6758:
	mov r0, #0x20
	bl LoadOverlay
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022E67AC
_022E6770: ; jump table
	b _022E6784 ; case 0
	b _022E678C ; case 1
	b _022E6794 ; case 2
	b _022E679C ; case 3
	b _022E67A4 ; case 4
_022E6784:
	mov r0, #1
	b _022E67B0
_022E678C:
	mov r0, #2
	b _022E67B0
_022E6794:
	mov r0, #3
	b _022E67B0
_022E679C:
	mov r0, #4
	b _022E67B0
_022E67A4:
	mov r0, #5
	b _022E67B0
_022E67AC:
	mov r0, #0
_022E67B0:
	bl ov13_0238A468
	b _022E68AC
_022E67B8:
	mov r0, #0x20
	bl UnloadOverlay
	ldr r1, _022E68D0 ; =0x02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r4]
	b _022E68BC
_022E67D4:
	bl ov11_0230CE30
	b _022E68AC
_022E67DC:
	bl ov11_0230CE44
	b _022E68AC
_022E67E4:
	bl sub_02050C74
	mov r5, r0
	mov r0, #0
	mov r1, #0x6e
	bl LoadScriptVariableValue
	and r1, r0, #0xff
	mov r0, #0
	str r0, [r4]
	cmp r5, r1
	bls _022E683C
	cmp r5, #9
	blo _022E682C
	cmp r1, #9
	movlo r5, #9
	addhs r0, r1, #1
	andhs r5, r0, #0xff
	sub r0, r5, #8
	str r0, [r4]
_022E682C:
	mov r2, r5
	mov r0, #0
	mov r1, #0x6e
	bl SaveScriptVariableValue
_022E683C:
	mov r0, #0
	b _022E68BC
_022E6844:
	add r0, sp, #0x20
	bl sub_02049338
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _022E6860
	mov r0, #1
	bl ov11_022E96F4
_022E6860:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E686C:
	mov r0, #0
	str r0, [r4]
	b _022E68BC
_022E6878:
	add r0, sp, #0x16
	bl sub_0206C0FC
	ldrsh r1, [sp, #0x16]
	mov r0, #0xa
	bl ov11_022FF1D4
	b _022E68AC
_022E6890:
	add r0, sp, #0x14
	bl sub_0206C120
	add r0, sp, #0x18
	bl sub_0206C144
	ldrsh r0, [sp, #0x14]
	add r1, sp, #0x18
	bl ov11_022FF490
_022E68AC:
	ldr r0, _022E68C8 ; =0x02324C9C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
_022E68BC:
	add sp, sp, #0x144
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E68C4: .word 0x02319924
_022E68C8: .word 0x02324C9C
_022E68CC: .word 0x0000C402
_022E68D0: .word 0x02324F94
_022E68D4: .word 0x0231993C
_022E68D8: .word 0x02319960
_022E68DC: .word 0x023199B4
_022E68E0: .word 0x023199D4
	arm_func_end ov11_022E60BC

	arm_func_start ov11_022E68E4
ov11_022E68E4: ; 0x022E68E4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x20
	mov r6, r1
	cmp r0, #0x4b
	addls pc, pc, r0, lsl #2
	b _022E6E54
_022E68FC: ; jump table
	b _022E6E54 ; case 0
	b _022E6A2C ; case 1
	b _022E6A2C ; case 2
	b _022E6A2C ; case 3
	b _022E6A2C ; case 4
	b _022E6E54 ; case 5
	b _022E6E54 ; case 6
	b _022E6E54 ; case 7
	b _022E6E54 ; case 8
	b _022E6E54 ; case 9
	b _022E6E54 ; case 10
	b _022E6A2C ; case 11
	b _022E6A2C ; case 12
	b _022E6A2C ; case 13
	b _022E6E54 ; case 14
	b _022E6A2C ; case 15
	b _022E6A2C ; case 16
	b _022E6A2C ; case 17
	b _022E6A2C ; case 18
	b _022E6A2C ; case 19
	b _022E6A2C ; case 20
	b _022E6A2C ; case 21
	b _022E6A2C ; case 22
	b _022E6A2C ; case 23
	b _022E6A2C ; case 24
	b _022E6A2C ; case 25
	b _022E6A2C ; case 26
	b _022E6A2C ; case 27
	b _022E6E54 ; case 28
	b _022E6A2C ; case 29
	b _022E6A2C ; case 30
	b _022E6A2C ; case 31
	b _022E6A2C ; case 32
	b _022E6A2C ; case 33
	b _022E6A2C ; case 34
	b _022E6AE0 ; case 35
	b _022E6A2C ; case 36
	b _022E6E54 ; case 37
	b _022E6E54 ; case 38
	b _022E6A9C ; case 39
	b _022E6A9C ; case 40
	b _022E6E54 ; case 41
	b _022E6E54 ; case 42
	b _022E6D0C ; case 43
	b _022E6E54 ; case 44
	b _022E6E54 ; case 45
	b _022E6E54 ; case 46
	b _022E6E54 ; case 47
	b _022E6A2C ; case 48
	b _022E6E54 ; case 49
	b _022E6A2C ; case 50
	b _022E6E54 ; case 51
	b _022E6DB0 ; case 52
	b _022E6DF8 ; case 53
	b _022E6A2C ; case 54
	b _022E6A2C ; case 55
	b _022E6E54 ; case 56
	b _022E6E54 ; case 57
	b _022E6E54 ; case 58
	b _022E6A2C ; case 59
	b _022E6A50 ; case 60
	b _022E6A7C ; case 61
	b _022E6A8C ; case 62
	b _022E6A2C ; case 63
	b _022E6A2C ; case 64
	b _022E6A2C ; case 65
	b _022E6A2C ; case 66
	b _022E6A2C ; case 67
	b _022E6A2C ; case 68
	b _022E6A2C ; case 69
	b _022E6A2C ; case 70
	b _022E6A2C ; case 71
	b _022E6A2C ; case 72
	b _022E6A2C ; case 73
	b _022E6A2C ; case 74
	b _022E6A2C ; case 75
_022E6A2C:
	ldr r0, _022E6E60 ; =0x02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r1, _022E6E64 ; =0x02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r6]
	b _022E6E58
_022E6A50:
	ldr r0, _022E6E60 ; =0x02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	mov r0, #0x12
	bl UnloadOverlay
	ldr r1, _022E6E64 ; =0x02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r6]
	b _022E6E58
_022E6A7C:
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	b _022E6E58
_022E6A8C:
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	b _022E6E58
_022E6A9C:
	ldr r0, _022E6E60 ; =0x02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =0x02324F94
	ldr r1, [r0]
	str r1, [r6]
	ldr r0, [r0]
	cmp r0, #0
	beq _022E6AD8
	add r0, sp, #4
	bl sub_0206C0FC
	ldrsh r0, [sp, #4]
	mov r1, #0
	bl ov11_022F7188
_022E6AD8:
	mov r0, #1
	b _022E6E58
_022E6AE0:
	ldr r0, _022E6E60 ; =0x02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =0x02324F94
	ldr r0, [r0]
	cmp r0, #0
	blt _022E6CFC
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205B77C
	ldr r1, _022E6E64 ; =0x02324F94
	mov r5, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	mov r1, r0, lsl #0x18
	add r0, sp, #0x18
	mov r1, r1, asr #0x18
	bl sub_0205BB7C
	ldrb r0, [sp, #0x18]
	ldrb r1, [sp, #0x19]
	mov r2, #0
	bl sub_0204F488
	mov r4, r0
	tst r4, #4
	movne r0, #3
	strne r0, [r6]
	bne _022E6D04
	tst r4, #0x10
	movne r0, #5
	strne r0, [r6]
	bne _022E6D04
	tst r4, #8
	movne r0, #4
	strne r0, [r6]
	bne _022E6D04
	ldrsb r0, [r5, #0xac]
	cmp r0, #0
	movle r0, #6
	strle r0, [r6]
	ble _022E6D04
	tst r4, #0x4000
	beq _022E6CC0
	ldr r0, _022E6E64 ; =0x02324F94
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0204E974
	ldrb r1, [sp, #0x18]
	cmp r1, #0x63
	bgt _022E6BEC
	bge _022E6C48
	cmp r1, #0x29
	bgt _022E6BDC
	cmp r1, #0x26
	blt _022E6D04
	beq _022E6C3C
	cmp r1, #0x29
	moveq r0, #0x15
	streq r0, [r6]
	b _022E6D04
_022E6BDC:
	cmp r1, #0x3f
	moveq r0, #0x16
	streq r0, [r6]
	b _022E6D04
_022E6BEC:
	cmp r1, #0x6e
	bgt _022E6C2C
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _022E6D04
_022E6C00: ; jump table
	b _022E6C54 ; case 0
	b _022E6C60 ; case 1
	b _022E6C6C ; case 2
	b _022E6C78 ; case 3
	b _022E6C84 ; case 4
	b _022E6D04 ; case 5
	b _022E6D04 ; case 6
	b _022E6C90 ; case 7
	b _022E6C9C ; case 8
	b _022E6CA8 ; case 9
	b _022E6CB4 ; case 10
_022E6C2C:
	cmp r1, #0xae
	moveq r0, #0x21
	streq r0, [r6]
	b _022E6D04
_022E6C3C:
	mov r0, #0x14
	str r0, [r6]
	b _022E6D04
_022E6C48:
	mov r0, #0x17
	str r0, [r6]
	b _022E6D04
_022E6C54:
	mov r0, #0x18
	str r0, [r6]
	b _022E6D04
_022E6C60:
	mov r0, #0x19
	str r0, [r6]
	b _022E6D04
_022E6C6C:
	mov r0, #0x1a
	str r0, [r6]
	b _022E6D04
_022E6C78:
	mov r0, #0x1b
	str r0, [r6]
	b _022E6D04
_022E6C84:
	mov r0, #0x1c
	str r0, [r6]
	b _022E6D04
_022E6C90:
	mov r0, #0x1d
	str r0, [r6]
	b _022E6D04
_022E6C9C:
	mov r0, #0x1e
	str r0, [r6]
	b _022E6D04
_022E6CA8:
	mov r0, #0x1f
	str r0, [r6]
	b _022E6D04
_022E6CB4:
	mov r0, #0x20
	str r0, [r6]
	b _022E6D04
_022E6CC0:
	tst r4, #1
	movne r0, #0x12
	strne r0, [r6]
	bne _022E6D04
	ldr r0, _022E6E64 ; =0x02324F94
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0204E974
	cmp r4, #0
	moveq r0, #0
	streq r0, [r6]
	movne r0, #0x13
	strne r0, [r6]
	b _022E6D04
_022E6CFC:
	mov r0, #1
	str r0, [r6]
_022E6D04:
	mov r0, #1
	b _022E6E58
_022E6D0C:
	ldr r0, _022E6E60 ; =0x02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =0x02324F94
	ldr r0, [r0]
	cmp r0, #0
	mov r0, #0
	blt _022E6D6C
	mov r1, #0x33
	bl LoadScriptVariableValue
	cmp r0, #0x64
	bge _022E6D50
	add r2, r0, #1
	mov r0, #0
	mov r1, #0x33
	bl SaveScriptVariableValue
_022E6D50:
	mov r0, #0
	mov r1, #0x5c
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #1
	str r0, [r6]
	b _022E6D70
_022E6D6C:
	str r0, [r6]
_022E6D70:
	add r1, sp, #0x14
	add r2, sp, #0x10
	mov r0, #2
	bl sub_0204C5DC
	ldr r0, [sp, #0x10]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	bl sub_0205F2B8
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, r0, #1
	mov r0, #2
	bl SetScenarioScriptVar
	mov r0, #1
	b _022E6E58
_022E6DB0:
	add r0, sp, #2
	bl ov11_022FF460
	cmp r0, #0
	beq _022E6E54
	ldrsh r0, [sp, #2]
	mvn r1, #0
	str r0, [r6]
	cmp r0, r1
	beq _022E6DE8
	bl sub_0206C110
	bl sub_02048614
	ldrsh r0, [sp, #2]
	mov r1, #0
	bl ov11_022F7188
_022E6DE8:
	ldr r1, _022E6E60 ; =0x02324C9C
	mov r0, #1
	strb r0, [r1]
	b _022E6E58
_022E6DF8:
	add r0, sp, #0
	add r1, sp, #6
	bl ov11_022FFA5C
	cmp r0, #0
	beq _022E6E54
	ldrsh r0, [sp]
	mvn r1, #0
	str r0, [r6]
	cmp r0, r1
	beq _022E6E44
	bl sub_0206C134
	add r0, sp, #6
	bl sub_0206C164
	bl sub_02048614
	mov r2, #0
	ldrsh r0, [sp]
	add r1, sp, #6
	mov r3, r2
	bl ov11_022F7354
_022E6E44:
	ldr r1, _022E6E60 ; =0x02324C9C
	mov r0, #1
	strb r0, [r1]
	b _022E6E58
_022E6E54:
	mov r0, #0
_022E6E58:
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E6E60: .word 0x02324C9C
_022E6E64: .word 0x02324F94
	arm_func_end ov11_022E68E4

	arm_func_start ov11_022E6E68
ov11_022E6E68: ; 0x022E6E68
	ldr r1, _022E6E84 ; =0x02324C9C
	mov r3, #1
	ldr r0, _022E6E88 ; =0x02324F94
	mov r2, #0
	strb r3, [r1]
	str r2, [r0]
	bx lr
	.align 2, 0
_022E6E84: .word 0x02324C9C
_022E6E88: .word 0x02324F94
	arm_func_end ov11_022E6E68

	arm_func_start ov11_022E6E8C
ov11_022E6E8C: ; 0x022E6E8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E6EBC ; =0x02319A20
	mov r2, r4
	mov r0, #2
	bl DebugPrint
	ldr r0, _022E6EC0 ; =0x02324F94
	ldr r1, _022E6EC4 ; =0x02324C9C
	mov r2, #1
	strb r2, [r1]
	str r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6EBC: .word 0x02319A20
_022E6EC0: .word 0x02324F94
_022E6EC4: .word 0x02324C9C
	arm_func_end ov11_022E6E8C

	arm_func_start ov11_022E6EC8
ov11_022E6EC8: ; 0x022E6EC8
	ldr r0, _022E6EE4 ; =0x02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E6EE4: .word 0x02324C9C
	arm_func_end ov11_022E6EC8

	arm_func_start ov11_022E6EE8
ov11_022E6EE8: ; 0x022E6EE8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x98
	mov r5, r0
	bl GetGameMode
	cmp r5, #0
	ldreq r5, _022E6FB4 ; =0x022E6FB8
	mov r4, r0
	mov r0, #0
	mov r1, #0x2c
	mov r2, #5
	str r5, [sp, #0x84]
	str r0, [sp, #0x88]
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x2b
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1c
	bl LoadScriptVariableValue
	mov r2, r0
	mov r0, #0
	mov r1, #0x1e
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1d
	mov r2, r0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	cmp r4, #4
	bne _022E6F80
	bl sub_020573A0
	mov r0, #0
	bl sub_0205730C
	mov r0, #1
	bl sub_0205730C
_022E6F80:
	cmp r4, #1
	beq _022E6FAC
	cmp r4, #5
	add r2, sp, #0
	mov r1, #0x100
	bne _022E6FA4
	mov r0, #5
	bl sub_0204964C
	b _022E6FAC
_022E6FA4:
	mov r0, #6
	bl sub_0204964C
_022E6FAC:
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E6FB4: .word 0x022E6FB8
	arm_func_end ov11_022E6EE8

	arm_func_start ov11_022E6FB8
ov11_022E6FB8: ; 0x022E6FB8
	ldr r0, _022E6FD0 ; =0x02324F94
	ldr r2, _022E6FD4 ; =0x02324C9C
	mov r3, #1
	strb r3, [r2]
	str r1, [r0]
	bx lr
	.align 2, 0
_022E6FD0: .word 0x02324F94
_022E6FD4: .word 0x02324C9C
	arm_func_end ov11_022E6FB8

	arm_func_start ov11_022E6FD8
ov11_022E6FD8: ; 0x022E6FD8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x144
	mov r4, r0
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _022E70F0
_022E6FF0: ; jump table
	b _022E7008 ; case 0
	b _022E7014 ; case 1
	b _022E7020 ; case 2
	b _022E7054 ; case 3
	b _022E7088 ; case 4
	b _022E70BC ; case 5
_022E7008:
	mov r1, #0x258
	bl GetStringFromFileVeneer
	b _022E70F8
_022E7014:
	ldr r1, _022E7100 ; =0x00000259
	bl GetStringFromFileVeneer
	b _022E70F8
_022E7020:
	add r0, sp, #0xf4
	bl InitPreprocessorArgs
	mov r0, #0xa9
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x118]
	add ip, sp, #0xf4
	ldr r2, _022E7104 ; =0x0000025A
	mov r0, r4
	mov r1, #0x40
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromMessageId
	b _022E70F8
_022E7054:
	add r0, sp, #0xa4
	bl InitPreprocessorArgs
	mov r0, #0xaa
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0xc8]
	add ip, sp, #0xa4
	ldr r2, _022E7108 ; =0x0000025B
	mov r0, r4
	mov r1, #0x40
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromMessageId
	b _022E70F8
_022E7088:
	add r0, sp, #0x54
	bl InitPreprocessorArgs
	mov r0, #0xab
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x78]
	add ip, sp, #0x54
	mov r0, r4
	mov r1, #0x40
	mov r2, #0x25c
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromMessageId
	b _022E70F8
_022E70BC:
	add r0, sp, #4
	bl InitPreprocessorArgs
	mov r0, #0xac
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x28]
	add ip, sp, #4
	ldr r2, _022E710C ; =0x0000025D
	mov r0, r4
	mov r1, #0x40
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromMessageId
	b _022E70F8
_022E70F0:
	mov r0, #0
	strb r0, [r4]
_022E70F8:
	add sp, sp, #0x144
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E7100: .word 0x00000259
_022E7104: .word 0x0000025A
_022E7108: .word 0x0000025B
_022E710C: .word 0x0000025D
	arm_func_end ov11_022E6FD8

	arm_func_start ov11_022E7110
ov11_022E7110: ; 0x022E7110
	bx lr
	arm_func_end ov11_022E7110

	arm_func_start ov11_022E7114
ov11_022E7114: ; 0x022E7114
	bx lr
	arm_func_end ov11_022E7114

	arm_func_start ov11_022E7118
ov11_022E7118: ; 0x022E7118
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1b8
	mov r5, r1
	mov r4, r0
	mov r7, r2
	ldr r1, _022E7AC8 ; =0x02319A48
	mov r2, r5
	mov r0, #2
	mov r6, r3
	bl DebugPrint
	cmp r5, #0x3e
	addls pc, pc, r5, lsl #2
	b _022E7ABC
_022E714C: ; jump table
	b _022E7ABC ; case 0
	b _022E7248 ; case 1
	b _022E7254 ; case 2
	b _022E7260 ; case 3
	b _022E726C ; case 4
	b _022E7278 ; case 5
	b _022E7284 ; case 6
	b _022E72AC ; case 7
	b _022E72D8 ; case 8
	b _022E7314 ; case 9
	b _022E7364 ; case 10
	b _022E737C ; case 11
	b _022E73BC ; case 12
	b _022E73D8 ; case 13
	b _022E73E0 ; case 14
	b _022E73F8 ; case 15
	b _022E7400 ; case 16
	b _022E7408 ; case 17
	b _022E7410 ; case 18
	b _022E7548 ; case 19
	b _022E7534 ; case 20
	b _022E7548 ; case 21
	b _022E7518 ; case 22
	b _022E75D0 ; case 23
	b _022E75DC ; case 24
	b _022E75DC ; case 25
	b _022E75EC ; case 26
	b _022E75FC ; case 27
	b _022E760C ; case 28
	b _022E7630 ; case 29
	b _022E7660 ; case 30
	b _022E7680 ; case 31
	b _022E76C8 ; case 32
	b _022E76D8 ; case 33
	b _022E76F4 ; case 34
	b _022E7708 ; case 35
	b _022E7724 ; case 36
	b _022E7744 ; case 37
	b _022E776C ; case 38
	b _022E778C ; case 39
	b _022E77B4 ; case 40
	b _022E77FC ; case 41
	b _022E7850 ; case 42
	b _022E7870 ; case 43
	b _022E7898 ; case 44
	b _022E78AC ; case 45
	b _022E78C8 ; case 46
	b _022E78E4 ; case 47
	b _022E7938 ; case 48
	b _022E798C ; case 49
	b _022E79D0 ; case 50
	b _022E79E8 ; case 51
	b _022E79F4 ; case 52
	b _022E7A00 ; case 53
	b _022E7A08 ; case 54
	b _022E7A14 ; case 55
	b _022E7A48 ; case 56
	b _022E7A5C ; case 57
	b _022E7A70 ; case 58
	b _022E7A7C ; case 59
	b _022E7A88 ; case 60
	b _022E7A94 ; case 61
	b _022E7AA8 ; case 62
_022E7248:
	bl ov11_022E9414
	mov r0, #0
	b _022E7AC0
_022E7254:
	bl InitMainTeamAfterQuiz
	mov r0, #0
	b _022E7AC0
_022E7260:
	bl ScriptSpecialProcess0x3
	mov r0, #0
	b _022E7AC0
_022E726C:
	bl ScriptSpecialProcess0x4
	mov r0, #0
	b _022E7AC0
_022E7278:
	bl ov11_022E9438
	mov r0, #0
	b _022E7AC0
_022E7284:
	bl sub_0204E70C
	cmp r0, #1
	bne _022E72A4
	bl sub_0204E770
	bl DungeonRequestsDoneWrapper
	cmp r0, #0
	movgt r0, #1
	bgt _022E7AC0
_022E72A4:
	mov r0, #0
	b _022E7AC0
_022E72AC:
	add r0, sp, #7
	bl sub_0204F158
	cmp r0, #0
	beq _022E72D0
	ldrb r0, [sp, #7]
	bl DungeonRequestsDoneWrapper
	cmp r0, #0
	movgt r0, #1
	bgt _022E7AC0
_022E72D0:
	mov r0, #0
	b _022E7AC0
_022E72D8:
	add r0, sp, #6
	bl sub_0204F158
	cmp r0, #0
	beq _022E730C
	ldrb r2, [sp, #6]
	mov r3, #4
	add r1, sp, #5
	mov r0, #6
	strb r3, [sp, #5]
	bl sub_0205F464
	cmp r0, #0
	movne r0, #1
	bne _022E7AC0
_022E730C:
	mov r0, #0
	b _022E7AC0
_022E7314:
	add r0, sp, #4
	bl sub_0204F158
	cmp r0, #0
	beq _022E735C
	ldrb r2, [sp, #4]
	mov r3, #4
	add r1, sp, #3
	mov r0, #6
	strb r3, [sp, #3]
	bl sub_0205F464
	movs r1, r0
	beq _022E735C
	ldrb r2, [sp, #4]
	add r0, sp, #0x60
	bl sub_0205F118
	cmp r0, #0
	movne r0, #1
	bne _022E7AC0
_022E735C:
	mov r0, #0
	b _022E7AC0
_022E7364:
	mov r0, #2
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movle r0, #0
	b _022E7AC0
_022E737C:
	add r0, sp, #2
	bl sub_0204F1B4
	cmp r0, #0
	beq _022E73B4
	ldrsb r0, [sp, #2]
	bl sub_0205B77C
	ldrsb r4, [r0, #0xac]
	ldrsb r1, [sp, #2]
	ldr r0, _022E7ACC ; =0x02319A68
	mov r2, r4
	bl DebugPrint0__0200C1FC
	cmp r4, #0
	movgt r0, r4
	bgt _022E7AC0
_022E73B4:
	mov r0, #0
	b _022E7AC0
_022E73BC:
	mov r0, r7, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl ov11_022E8124
	mov r0, #0
	b _022E7AC0
_022E73D8:
	bl ov11_022E81BC
	b _022E7AC0
_022E73E0:
	bl ov11_022E81D4
	and r1, r0, #0xff
	strb r0, [sp]
	mov r0, r1
	strb r1, [sp, #1]
	b _022E7AC0
_022E73F8:
	bl ov11_022E81F0
	b _022E7AC0
_022E7400:
	bl ov11_022E8258
	b _022E7AC0
_022E7408:
	mov r0, #0
	b _022E7AC0
_022E7410:
	add r1, sp, #0xc
	mov r0, #0
	bl GetHeldButtons
	add r1, sp, #0xa
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0xa]
	tst r0, #0xc
	movne r0, #0
	bne _022E7AC0
	ldrh r0, [sp, #0xc]
	bl ov11_022EAF70
	mvn r1, #0
	cmp r0, r1
	beq _022E7510
	add r1, sp, #0x58
	mov r2, #0x100
	bl sub_02005494
	ldrh r0, [sp, #0xc]
	mov sb, #0
	add fp, sp, #0x48
	tst r0, #2
	ldr r0, _022E7AD0 ; =0x02319A38
	movne sl, #4
	ldr r8, [r0]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	ldr r7, [r0, #0xc]
	moveq sl, #2
	str r8, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r1, [sp, #0x10]
	str r7, [sp, #0x14]
	add r5, sp, #0x50
	add r6, sp, #0x58
	b _022E7508
_022E74A0:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	mov r1, r6
	blx r2
	cmp r0, #0
	beq _022E7504
	ldr r0, [sp, #0x5c]
	str r8, [sp, #0x50]
	str r0, [sp, #0x54]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	mov r1, r5
	blx r2
	cmp r0, #0
	beq _022E7504
	ldr r0, [sp, #0x58]
	str r7, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	mov r1, fp
	blx r2
_022E7504:
	add sb, sb, #1
_022E7508:
	cmp sb, sl
	blt _022E74A0
_022E7510:
	mvn r0, #0
	b _022E7AC0
_022E7518:
	cmp r7, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bl ov11_022E96F4
	mov r0, #0
	b _022E7AC0
_022E7534:
	bl KeyWaitInit__02006DA4
	ldr r1, _022E7AD4 ; =0x02324CA0
	mov r0, #0
	str r7, [r1]
	b _022E7AC0
_022E7548:
	add r1, sp, #8
	mov r0, #0
	bl GetPressedButtons
	bl sub_0204AE60
	cmp r0, #0
	add r0, sp, #0x68
	beq _022E756C
	bl GetReleasedStylus
	b _022E7570
_022E756C:
	bl sub_02006BFC
_022E7570:
	ldrh r1, [sp, #8]
	ldr r0, _022E7AD8 ; =0x00000F0F
	tst r1, r0
	bne _022E7598
	add r0, sp, #0x68
	mov r1, #2
	mov r2, #0
	bl sub_02006C8C
	cmp r0, #0
	beq _022E75A0
_022E7598:
	mov r0, #2
	b _022E7AC0
_022E75A0:
	ldr r0, _022E7AD4 ; =0x02324CA0
	ldr r1, [r0]
	cmp r1, #0
	ble _022E75C0
	subs r1, r1, #1
	str r1, [r0]
	moveq r0, #1
	beq _022E7AC0
_022E75C0:
	cmp r5, #0x13
	mvneq r0, #0
	movne r0, #0
	b _022E7AC0
_022E75D0:
	bl ScriptSpecialProcess0x17
	mov r0, #0
	b _022E7AC0
_022E75DC:
	mov r0, r7
	bl ov11_022E95DC
	mov r0, #0
	b _022E7AC0
_022E75EC:
	mvn r0, #0
	bl ov11_022E95DC
	mov r0, #0
	b _022E7AC0
_022E75FC:
	mov r0, r7
	bl ov11_022E9694
	mov r0, #0
	b _022E7AC0
_022E760C:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E803C
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7630:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E803C
	mov r1, #0
	bl sub_020555D0
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	beq _022E7AC0
	bl GetTeamMember
	ldrb r0, [r0, #1]
	b _022E7AC0
_022E7660:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E803C
	bl sub_02056EB8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7680:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E8080
	add r0, sp, #0x174
	bl ov11_022E8090
	add r0, sp, #0x100
	ldrsh r0, [r0, #0x78]
	bl sub_02065BC8
	add r0, sp, #0x100
	add r0, r0, #0xae
	mov r1, #0xa
	bl sub_02065C08
	add r0, sp, #0x174
	bl sub_02055CCC
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	b _022E7AC0
_022E76C8:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl CountItemTypeInBag
	b _022E7AC0
_022E76D8:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x44
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	ldrsh r0, [sp, #0x44]
	bl CountItemTypeInBag
	b _022E7AC0
_022E76F4:
	add r0, sp, #0x40
	strh r7, [sp, #0x40]
	strh r6, [sp, #0x42]
	bl CountItemTypeInStorage
	b _022E7AC0
_022E7708:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x3c
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x3c
	bl CountItemTypeInStorage
	b _022E7AC0
_022E7724:
	add r0, sp, #0x38
	strh r7, [sp, #0x38]
	strh r6, [sp, #0x3a]
	bl SpecialProcAddItemToBag
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7744:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x34
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x34
	bl SpecialProcAddItemToBag
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E776C:
	add r0, sp, #0x30
	strh r7, [sp, #0x30]
	strh r6, [sp, #0x32]
	bl AddItemToStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E778C:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x2c
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x2c
	bl AddItemToStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E77B4:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _022E77F4
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E77E4
	bl sub_020582E0
_022E77E4:
	mov r0, r4
	bl RemoveItemNoHole
	mov r0, #1
	b _022E7AC0
_022E77F4:
	mov r0, #0
	b _022E7AC0
_022E77FC:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x28
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	ldrsh r0, [sp, #0x28]
	bl GetFirstUnequippedItemOfType
	mov r4, r0
	mvn r1, #0
	cmp r4, r1
	beq _022E7848
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E7838
	bl sub_020582E0
_022E7838:
	mov r0, r4
	bl RemoveItemNoHole
	mov r0, #1
	b _022E7AC0
_022E7848:
	mov r0, #0
	b _022E7AC0
_022E7850:
	add r0, sp, #0x24
	strh r7, [sp, #0x24]
	strh r6, [sp, #0x26]
	bl RemoveItemsTypeInStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7870:
	mov r0, r7, lsl #0x10
	add r1, sp, #0x20
	mov r0, r0, asr #0x10
	bl ItemAtTableIdx
	add r0, sp, #0x20
	bl RemoveItemsTypeInStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7898:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E8080
	mov r0, #0
	b _022E7AC0
_022E78AC:
	bl GetHero
	cmp r0, #0
	moveq r0, #0
	beq _022E7AC0
	ldrsh r0, [r0, #4]
	bl ov11_022E8050
	b _022E7AC0
_022E78C8:
	bl GetPartner
	cmp r0, #0
	moveq r0, #0
	beq _022E7AC0
	ldrsh r0, [r0, #4]
	bl ov11_022E8050
	b _022E7AC0
_022E78E4:
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7930
	bl sub_020564B0
	cmp r0, #0
	beq _022E7930
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7930
	bl sub_02056410
	cmp r0, #0
	beq _022E7930
	mov r0, #0
	bl sub_02056E04
	cmp r0, #0
	moveq r0, #1
	beq _022E7AC0
_022E7930:
	mov r0, #0
	b _022E7AC0
_022E7938:
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7984
	bl sub_020564B0
	cmp r0, #0
	beq _022E7984
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E7984
	bl sub_02056410
	cmp r0, #0
	beq _022E7984
	mov r0, #0
	bl sub_02056E04
	cmp r0, #0
	moveq r0, #1
	beq _022E7AC0
_022E7984:
	mov r0, #0
	b _022E7AC0
_022E798C:
	bl GetMainCharacter1MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E79C8
	bl sub_02056410
	cmp r0, #0
	beq _022E79C8
	bl GetMainCharacter2MemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _022E79C8
	bl sub_02056410
	cmp r0, #0
	movne r0, #1
	bne _022E7AC0
_022E79C8:
	mov r0, #0
	b _022E7AC0
_022E79D0:
	mov r0, #0
	bl GetPartyMembers
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	b _022E7AC0
_022E79E8:
	bl SetTeamSetupHeroAndPartnerOnly
	mov r0, #0
	b _022E7AC0
_022E79F4:
	bl SetTeamSetupHeroOnly
	mov r0, #0
	b _022E7AC0
_022E7A00:
	mov r0, #0
	b _022E7AC0
_022E7A08:
	bl ov11_02313A98
	mov r0, #0
	b _022E7AC0
_022E7A14:
	add r0, sp, #0x8c
	bl sub_0204F244
	cmp r0, #0
	beq _022E7A40
	add r0, sp, #0x8c
	cmp r7, #0
	strgeb r7, [sp, #0xe8]
	cmp r6, #0
	mov r1, #1
	strgeb r6, [sp, #0xe9]
	bl sub_0204F1F0
_022E7A40:
	mov r0, #0
	b _022E7AC0
_022E7A48:
	bl IsBagFull
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7A5C:
	bl ScriptSpecialProcess0x39
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7A70:
	bl IncrementNbDungeonsCleared
	mov r0, #0
	b _022E7AC0
_022E7A7C:
	bl IncrementNbBigTreasureWins
	mov r0, #0
	b _022E7AC0
_022E7A88:
	bl IncrementNbSkyGiftsSent
	mov r0, #0
	b _022E7AC0
_022E7A94:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ScriptSpecialProcess0x3D
	mov r0, #0
	b _022E7AC0
_022E7AA8:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl ScriptSpecialProcess0x3E
	mov r0, #0
	b _022E7AC0
_022E7ABC:
	mov r0, #0
_022E7AC0:
	add sp, sp, #0x1b8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E7AC8: .word 0x02319A48
_022E7ACC: .word 0x02319A68
_022E7AD0: .word 0x02319A38
_022E7AD4: .word 0x02324CA0
_022E7AD8: .word 0x00000F0F
	arm_func_end ov11_022E7118

	arm_func_start ov11_022E7ADC
ov11_022E7ADC: ; 0x022E7ADC
	bx lr
	arm_func_end ov11_022E7ADC

	arm_func_start ov11_022E7AE0
ov11_022E7AE0: ; 0x022E7AE0
	bx lr
	arm_func_end ov11_022E7AE0

	arm_func_start ov11_022E7AE4
ov11_022E7AE4: ; 0x022E7AE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r2
	mov r5, r3
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_022E7B00: ; jump table
	ldmia sp!, {r4, r5, r6, pc} ; case 0
	b _022E7B18 ; case 1
	b _022E7B38 ; case 2
	b _022E7B58 ; case 3
	b _022E7B64 ; case 4
	ldmia sp!, {r4, r5, r6, pc} ; case 5
_022E7B18:
	mov r1, #0
	mov r0, #0xd
	strh r1, [r4, #0x46]
	bl ov11_02314670
	mov r0, r6
	mov r1, r5
	bl ov11_023159CC
	ldmia sp!, {r4, r5, r6, pc}
_022E7B38:
	mov r0, #0xd
	bl ov11_02314670
	mov r0, r6
	mov r1, r5
	bl ov11_023159CC
	mov r0, #0
	strh r0, [r4, #0x46]
	ldmia sp!, {r4, r5, r6, pc}
_022E7B58:
	mov r0, #0
	strh r0, [r4, #0x46]
	ldmia sp!, {r4, r5, r6, pc}
_022E7B64:
	mov r0, #0
	strh r0, [r4, #0x46]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022E7AE4

	arm_func_start ov11_022E7B70
ov11_022E7B70: ; 0x022E7B70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #5
	addls pc, pc, r3, lsl #2
	b _022E7E74
_022E7B90: ; jump table
	b _022E7E74 ; case 0
	b _022E7BA8 ; case 1
	b _022E7C20 ; case 2
	b _022E7C98 ; case 3
	b _022E7D10 ; case 4
	b _022E7D88 ; case 5
_022E7BA8:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7BC0
	mov r2, #2
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7BC0:
	ldrsh r0, [r8, #0x46]
	add r0, r0, #1
	strh r0, [r8, #0x46]
	bl ov11_0231474C
	mov r0, #2
	bl ov11_0231598C
	ldr r2, [r0, #4]
	mov r1, #1
	mov r2, r2, lsr #0xc
	mov r2, r2, lsl #8
	str r2, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	ldrsb r0, [r7]
	bl sub_020051A0
	strb r0, [r7]
	ldrsh r0, [r8, #0x46]
	cmp r0, #0x200
	movlt r0, #1
	blt _022E7E78
	bl ov11_023146F8
	b _022E7E74
_022E7C20:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7C38
	mov r2, #0
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7C38:
	ldrsh r0, [r8, #0x46]
	add r0, r0, #1
	strh r0, [r8, #0x46]
	bl ov11_0231474C
	mov r0, #0
	bl ov11_0231598C
	ldr r2, [r0, #4]
	mov r1, #1
	mov r2, r2, lsr #0xc
	mov r2, r2, lsl #8
	str r2, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	ldrsb r0, [r7]
	bl sub_020051A0
	strb r0, [r7]
	ldrsh r0, [r8, #0x46]
	cmp r0, #0x140
	movlt r0, #1
	blt _022E7E78
	bl ov11_023146F8
	b _022E7E74
_022E7C98:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7CB0
	mov r2, #1
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7CB0:
	ldrsh r1, [r8, #0x46]
	mov r0, #1
	add r1, r1, #1
	strh r1, [r8, #0x46]
	bl ov11_0231598C
	cmp r0, #0
	beq _022E7CF0
	ldr r1, [r0, #4]
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	b _022E7CF8
_022E7CF0:
	mov r0, #0
	b _022E7E78
_022E7CF8:
	ldrsb r0, [r7]
	mov r1, #1
	bl sub_020051A0
	strb r0, [r7]
	mov r0, #1
	b _022E7E78
_022E7D10:
	ldrsh r0, [r8, #0x46]
	cmp r0, #0
	bne _022E7D28
	mov r2, #2
	ldmia r6, {r0, r1}
	bl ov11_023159E8
_022E7D28:
	ldrsh r1, [r8, #0x46]
	mov r0, #2
	add r1, r1, #1
	strh r1, [r8, #0x46]
	bl ov11_0231598C
	cmp r0, #0
	beq _022E7D68
	ldr r1, [r0, #4]
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r6]
	ldr r0, [r0, #8]
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #4]
	b _022E7D70
_022E7D68:
	mov r0, #0
	b _022E7E78
_022E7D70:
	ldrsb r0, [r7]
	mov r1, #1
	bl sub_020051A0
	strb r0, [r7]
	mov r0, #1
	b _022E7E78
_022E7D88:
	ldrsh r0, [r8, #8]
	cmp r0, #3
	bne _022E7E74
	mov r0, #0x2e
	bl ov11_022F7E10
	mov r4, r0
	mov r0, #0x2f
	bl ov11_022F7E10
	ldrsh r1, [r8, #0xa]
	mvn r5, #0
	cmp r1, r0
	bne _022E7DDC
	ldr r1, [r8]
	ldr r0, [r8, #4]
	ldr r2, [r1, #0x18]
	add r1, sp, #0x18
	blx r2
	ldr r0, [sp, #0x18]
	tst r0, #8
	movne r5, r4
	b _022E7DE4
_022E7DDC:
	cmp r1, r4
	moveq r5, r0
_022E7DE4:
	cmp r5, #0
	blt _022E7E74
	ldr r1, [r8]
	ldr r0, [r8, #4]
	ldr r2, [r1, #0xc]
	mov r1, r6
	blx r2
	ldr r1, [r8]
	ldr r0, [r8, #4]
	ldr r2, [r1, #8]
	add r1, sp, #8
	blx r2
	add r1, sp, #0x10
	mov r0, r5
	bl ov11_022F90F4
	mov r0, r5
	add r1, sp, #0
	bl ov11_022F90B4
	mov r0, r6
	add r1, sp, #8
	add r2, sp, #0x10
	add r3, sp, #0
	bl sub_020058A8
	mvn r1, #0
	cmp r0, r1
	bne _022E7E60
	ldr r1, _022E7E80 ; =0x02319A90
	add r2, sp, #0x10
	mov r0, r6
	mov r3, r1
	bl sub_020057A8
_022E7E60:
	mvn r1, #0
	cmp r0, r1
	ldrnesb r1, [r7]
	cmpne r0, r1
	strneb r0, [r7]
_022E7E74:
	mov r0, #0
_022E7E78:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E7E80: .word 0x02319A90
	arm_func_end ov11_022E7B70

	arm_func_start ov11_022E7E84
ov11_022E7E84: ; 0x022E7E84
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E7F24 ; =0x02319A98
	mov r2, r4
	mov r0, #2
	bl DebugPrint
	add r0, r4, #1
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_022E7EAC: ; jump table
	b _022E7ED4 ; case 0
	b _022E7EDC ; case 1
	b _022E7EE4 ; case 2
	b _022E7EEC ; case 3
	b _022E7EF4 ; case 4
	b _022E7EFC ; case 5
	b _022E7F04 ; case 6
	b _022E7F0C ; case 7
	b _022E7F14 ; case 8
	b _022E7F1C ; case 9
_022E7ED4:
	bl ov11_0230D000
	ldmia sp!, {r4, pc}
_022E7EDC:
	bl ov11_0230CFF4
	ldmia sp!, {r4, pc}
_022E7EE4:
	bl ov11_0230D92C
	ldmia sp!, {r4, pc}
_022E7EEC:
	bl ov11_02313908
	ldmia sp!, {r4, pc}
_022E7EF4:
	bl ov11_0230E964
	ldmia sp!, {r4, pc}
_022E7EFC:
	bl ov11_02310C40
	ldmia sp!, {r4, pc}
_022E7F04:
	bl ov11_0231136C
	ldmia sp!, {r4, pc}
_022E7F0C:
	bl ov11_0231186C
	ldmia sp!, {r4, pc}
_022E7F14:
	bl ov11_02311D6C
	ldmia sp!, {r4, pc}
_022E7F1C:
	bl ov11_02312250
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E7F24: .word 0x02319A98
	arm_func_end ov11_022E7E84

	arm_func_start ov11_022E7F28
ov11_022E7F28: ; 0x022E7F28
	ldr ip, _022E7F30 ; =ov11_0230D318
	bx ip
	.align 2, 0
_022E7F30: .word ov11_0230D318
	arm_func_end ov11_022E7F28

	arm_func_start ov11_022E7F34
ov11_022E7F34: ; 0x022E7F34
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _022E7F74 ; =0x02319AB4
	add r0, sp, #0
	bl ov11_022E46E8
	ldr r1, [sp, #4]
	ldr r0, _022E7F78 ; =0x02319AD0
	bl DebugPrint0__0200C1FC
	ldr r2, [sp]
	ldr r0, _022E7F7C ; =0x02324CA4
	str r2, [r0]
	ldrh r1, [r2]
	add r1, r2, r1, lsl #1
	str r1, [r0, #4]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F74: .word 0x02319AB4
_022E7F78: .word 0x02319AD0
_022E7F7C: .word 0x02324CA4
	arm_func_end ov11_022E7F34

	arm_func_start ov11_022E7F80
ov11_022E7F80: ; 0x022E7F80
	stmdb sp!, {r3, lr}
	ldr r0, _022E7FA4 ; =0x02324CA4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E7FA4 ; =0x02324CA4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7FA4: .word 0x02324CA4
	arm_func_end ov11_022E7F80

	arm_func_start ov11_022E7FA8
ov11_022E7FA8: ; 0x022E7FA8
	ldr r1, _022E7FB4 ; =0x0231C828
	add r0, r1, r0, lsl #3
	bx lr
	.align 2, 0
_022E7FB4: .word 0x0231C828
	arm_func_end ov11_022E7FA8

	arm_func_start ov11_022E7FB8
ov11_022E7FB8: ; 0x022E7FB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl ov11_022DC89C
	ldr r0, _022E8020 ; =0x02324CA4
	add r1, r5, r5, lsl #1
	ldr r2, [r0]
	add r3, r2, r1, lsl #1
	ldrh r1, [r3, #4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	str r2, [r4]
	ldrh r2, [r3, #4]
	ldr r3, [r0]
	mov r1, #0
	add r2, r3, r2, lsl #1
	str r2, [r4, #4]
	ldr r2, [r0, #4]
	sub r0, r1, #1
	str r2, [r4, #8]
	strh r1, [r4, #0x14]
	strb r1, [r4, #0x16]
	strh r0, [r4, #0x18]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E8020: .word 0x02324CA4
	arm_func_end ov11_022E7FB8

	arm_func_start ov11_022E8024
ov11_022E8024: ; 0x022E8024
	ldr r0, _022E8034 ; =0x02324F98
	mvn r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_022E8034: .word 0x02324F98
	arm_func_end ov11_022E8024

	arm_func_start ov11_022E8038
ov11_022E8038: ; 0x022E8038
	bx lr
	arm_func_end ov11_022E8038

	arm_func_start ov11_022E803C
ov11_022E803C: ; 0x022E803C
	ldr r1, _022E804C ; =0x023208D8
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_022E804C: .word 0x023208D8
	arm_func_end ov11_022E803C

	arm_func_start ov11_022E8050
ov11_022E8050: ; 0x022E8050
	ldr r1, _022E807C ; =0x02320904
	b _022E8068
_022E8058:
	cmp r0, r2
	ldreqsh r0, [r1]
	bxeq lr
	add r1, r1, #4
_022E8068:
	ldrsh r2, [r1, #2]
	cmp r2, #0
	bne _022E8058
	mov r0, #0
	bx lr
	.align 2, 0
_022E807C: .word 0x02320904
	arm_func_end ov11_022E8050

	arm_func_start ov11_022E8080
ov11_022E8080: ; 0x022E8080
	ldr r1, _022E808C ; =0x02324F98
	strh r0, [r1]
	bx lr
	.align 2, 0
_022E808C: .word 0x02324F98
	arm_func_end ov11_022E8080

	arm_func_start ov11_022E8090
ov11_022E8090: ; 0x022E8090
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r1, #1
	strb r1, [r4]
	ldr r0, _022E810C ; =0x02324F98
	ldr r1, _022E8110 ; =0x023208D8
	ldrsh r2, [r0]
	add r0, sp, #0
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #0
	add r0, r4, #0x3a
	mov r2, #0xa
	bl sub_02025314
	mov r0, r4
	bl sub_02052EFC
	ldr r0, _022E810C ; =0x02324F98
	ldr r2, _022E8114 ; =0x023208AC
	ldrsh r3, [r0]
	ldr r1, _022E8118 ; =0x02320894
	mov r3, r3, lsl #1
	ldrsh r2, [r2, r3]
	strb r2, [r4, #1]
	ldrsh r0, [r0]
	ldrb r0, [r1, r0]
	strb r0, [r4, #2]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E810C: .word 0x02324F98
_022E8110: .word 0x023208D8
_022E8114: .word 0x023208AC
_022E8118: .word 0x02320894
	arm_func_end ov11_022E8090

	arm_func_start ov11_022E811C
ov11_022E811C: ; 0x022E811C
	bx lr
	arm_func_end ov11_022E811C

	arm_func_start ov11_022E8120
ov11_022E8120: ; 0x022E8120
	bx lr
	arm_func_end ov11_022E8120

	arm_func_start ov11_022E8124
ov11_022E8124: ; 0x022E8124
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _022E8164 ; =0x02324F9C
	strh r0, [r2, #2]
	strh r1, [r2]
	bl ov11_022E8168
	movs r1, r0
	beq _022E815C
	add r0, sp, #0
	mov r2, #0xff
	bl sub_0205F118
	ldrsh r0, [sp, #2]
	ldrsh r1, [sp, #4]
	bl sub_02065B80
_022E815C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8164: .word 0x02324F9C
	arm_func_end ov11_022E8124

	arm_func_start ov11_022E8168
ov11_022E8168: ; 0x022E8168
	stmdb sp!, {r3, lr}
	ldr r0, _022E81B8 ; =0x02324F9C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	beq _022E8188
	cmp r1, #1
	beq _022E819C
	b _022E81B0
_022E8188:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	ldmia sp!, {r3, pc}
_022E819C:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	ldmia sp!, {r3, pc}
_022E81B0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E81B8: .word 0x02324F9C
	arm_func_end ov11_022E8168

	arm_func_start ov11_022E81BC
ov11_022E81BC: ; 0x022E81BC
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	cmp r0, #0
	ldrneb r0, [r0, #1]
	moveq r0, #0xd
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022E81BC

	arm_func_start ov11_022E81D4
ov11_022E81D4: ; 0x022E81D4
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	cmp r0, #0
	ldrnesb r0, [r0, #2]
	moveq r0, #0
	streqb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022E81D4

	arm_func_start ov11_022E81F0
ov11_022E81F0: ; 0x022E81F0
	stmdb sp!, {r3, lr}
	ldr r0, _022E8254 ; =0x02324F9C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	beq _022E8210
	cmp r1, #1
	beq _022E8230
	b _022E824C
_022E8210:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBF0
	cmp r0, #0
	bne _022E824C
	mov r0, #1
	ldmia sp!, {r3, pc}
_022E8230:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC50
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_022E824C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8254: .word 0x02324F9C
	arm_func_end ov11_022E81F0

	arm_func_start ov11_022E8258
ov11_022E8258: ; 0x022E8258
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	bl sub_0205F0B8
	cmp r0, #0
	bne _022E82C0
	bl sub_0205F5A8
	bl sub_0205F710
	ldr r0, _022E82C8 ; =0x02324F9C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	beq _022E8290
	cmp r1, #1
	beq _022E82A8
	b _022E82C0
_022E8290:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC18
	mov r0, #1
	ldmia sp!, {r3, pc}
_022E82A8:
	ldrsh r0, [r0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC78
	mov r0, #1
	ldmia sp!, {r3, pc}
_022E82C0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E82C8: .word 0x02324F9C
	arm_func_end ov11_022E8258

	arm_func_start ov11_022E82CC
ov11_022E82CC: ; 0x022E82CC
	stmdb sp!, {r4, lr}
	cmp r0, #0
	movne r4, #0xd
	moveq r4, #0xc
	cmp r4, #0xc
	bne _022E82F0
	mov r0, #0x11
	bl ov11_022E8774
	mov r4, r0
_022E82F0:
	cmp r4, #0xc
	bne _022E832C
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	mov r0, #0x12
	bl ov11_022E8774
	mov r4, r0
	cmp r4, #0xd
	bne _022E832C
	mov r0, #0
	mov r1, #0x5c
	bl LoadScriptVariableValue
	cmp r0, #0
	ldmneia sp!, {r4, pc}
_022E832C:
	cmp r4, #0xd
	ldmneia sp!, {r4, pc}
	mov r0, #0x14
	bl ov11_022E8774
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E82CC

	arm_func_start ov11_022E8340
ov11_022E8340: ; 0x022E8340
	stmdb sp!, {r3, lr}
	mov r0, #0x198
	mov r1, #8
	bl MemAlloc
	ldr r3, _022E83F0 ; =0x02324CAC
	mov r1, #0
	mov r2, #0x198
	str r0, [r3]
	bl MemsetSimple
	mvn ip, #0
	ldr r0, _022E83F0 ; =0x02324CAC
	sub r3, ip, #1
	ldr r1, [r0]
	add r2, ip, #0x134
	strb ip, [r1, #6]
	ldr r1, [r0]
	strb r3, [r1, #4]
	ldr r1, [r0]
	strb r3, [r1, #5]
	ldr r1, [r0]
	str r2, [r1, #0x64]
	ldr r0, [r0]
	add r0, r0, #8
	bl InitPortraitBox
	ldr r0, _022E83F0 ; =0x02324CAC
	ldr r1, _022E83F4 ; =0x00000133
	ldr r0, [r0]
	add r0, r0, #8
	bl InitPortraitBoxWithMonsterId
	ldr r0, _022E83F0 ; =0x02324CAC
	mov r1, #0x12
	ldr r0, [r0]
	add r0, r0, #8
	bl SetPortraitUnknownAttr
	ldr r0, _022E83F0 ; =0x02324CAC
	ldr r0, [r0]
	add r0, r0, #6
	bl sub_0204F1B4
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022E84E4
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E83F0: .word 0x02324CAC
_022E83F4: .word 0x00000133
	arm_func_end ov11_022E8340

	arm_func_start ov11_022E83F8
ov11_022E83F8: ; 0x022E83F8
	stmdb sp!, {r3, lr}
	ldr r0, _022E84A8 ; =0x02324CAC
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E84A0
_022E8414: ; jump table
	b _022E8424 ; case 0
	b _022E8440 ; case 1
	b _022E8460 ; case 2
	b _022E8498 ; case 3
_022E8424:
	bl ov11_022E8748
	cmp r0, #0
	bne _022E84A0
	bl ov11_022E86E4
	mov r0, #1
	bl ov11_022E84E4
	b _022E84A0
_022E8440:
	bl sub_0203D538
	cmp r0, #1
	bne _022E84A0
	bl sub_0203EFD4
	bl sub_02046D20
	mov r0, #2
	bl ov11_022E84E4
	b _022E84A0
_022E8460:
	bl ov11_022E8748
	cmp r0, #0
	bne _022E84A0
	bl ov11_022E86E4
	ldr r0, _022E84A8 ; =0x02324CAC
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_0205B77C
	mov r1, #4
	strb r1, [r0], #0xa4
	bl sub_0205B584
	mov r0, #3
	bl ov11_022E84E4
	b _022E84A0
_022E8498:
	mov r0, #2
	ldmia sp!, {r3, pc}
_022E84A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84A8: .word 0x02324CAC
	arm_func_end ov11_022E83F8

	arm_func_start ov11_022E84AC
ov11_022E84AC: ; 0x022E84AC
	stmdb sp!, {r3, lr}
	ldr r0, _022E84E0 ; =0x02324CAC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022E86E4
	ldr r0, _022E84E0 ; =0x02324CAC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E84E0 ; =0x02324CAC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84E0: .word 0x02324CAC
	arm_func_end ov11_022E84AC

	arm_func_start ov11_022E84E4
ov11_022E84E4: ; 0x022E84E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _022E865C ; =0x02324CAC
	ldr r2, [r1]
	str r0, [r2]
	ldr r3, [r1]
	ldr r0, [r3]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022E8654
_022E850C: ; jump table
	b _022E851C ; case 0
	b _022E8558 ; case 1
	b _022E861C ; case 2
	b _022E8654 ; case 3
_022E851C:
	bl ov11_022E866C
	bl ov11_022E86A4
	ldr r0, _022E865C ; =0x02324CAC
	ldr r1, _022E8660 ; =0x00003218
	ldr r3, [r0]
	ldr r2, _022E8664 ; =0x0000025F
	ldrsb r0, [r3, #4]
	add r3, r3, #0x18
	bl ShowMessageInDBox
	ldr r0, _022E865C ; =0x02324CAC
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #8
	bl ShowPortraitBox
	b _022E8654
_022E8558:
	ldr r2, _022E8668 ; =0x00000133
	add r0, r3, #0x100
	strh r2, [r0, #0x68]
	ldr r0, [r1]
	mov r2, #2
	strb r2, [r0, #0x16a]
	ldr r0, [r1]
	mov r2, #0
	str r2, [r0, #0x170]
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl sub_0205B77C
	mov r4, r0
	add r2, sp, #0
	add r0, r4, #4
	mov r1, #0
	bl sub_020630A4
	ldr r0, _022E865C ; =0x02324CAC
	ldrsh r1, [sp]
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x178
	bl InitStandardItem
	bl sub_0206309C
	ldr r2, _022E865C ; =0x02324CAC
	mov r1, #0
	ldr r2, [r2]
	add r2, r2, #0x100
	strh r0, [r2, #0x7a]
	add r0, r4, #4
	bl sub_02062DC4
	ldr r3, _022E865C ; =0x02324CAC
	mov r1, #0
	ldr r2, [r3]
	mov ip, #1
	str r0, [r2, #0x190]
	ldr r0, [r3]
	mov r2, #0x10
	add r0, r0, #0x100
	strh r1, [r0, #0x82]
	ldr r0, [r3]
	add r0, r0, #0x100
	strh r1, [r0, #0x88]
	ldr r0, [r3]
	str ip, [r0, #0x174]
	ldr r0, [r3]
	add r0, r0, #0x168
	bl sub_0203D438
	b _022E8654
_022E861C:
	bl ov11_022E866C
	bl ov11_022E86A4
	ldr r0, _022E865C ; =0x02324CAC
	ldr r1, _022E8660 ; =0x00003218
	ldr r3, [r0]
	mov r2, #0x260
	ldrsb r0, [r3, #4]
	add r3, r3, #0x18
	bl ShowMessageInDBox
	ldr r0, _022E865C ; =0x02324CAC
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #8
	bl ShowPortraitBox
_022E8654:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E865C: .word 0x02324CAC
_022E8660: .word 0x00003218
_022E8664: .word 0x0000025F
_022E8668: .word 0x00000133
	arm_func_end ov11_022E84E4

	arm_func_start ov11_022E866C
ov11_022E866C: ; 0x022E866C
	stmdb sp!, {r3, lr}
	ldr r1, _022E86A0 ; =0x02324CAC
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #4]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDBox
	ldr r1, _022E86A0 ; =0x02324CAC
	ldr r1, [r1]
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86A0: .word 0x02324CAC
	arm_func_end ov11_022E866C

	arm_func_start ov11_022E86A4
ov11_022E86A4: ; 0x022E86A4
	stmdb sp!, {r3, lr}
	ldr r1, _022E86E0 ; =0x02324CAC
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #5]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _022E86E0 ; =0x02324CAC
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86E0: .word 0x02324CAC
	arm_func_end ov11_022E86A4

	arm_func_start ov11_022E86E4
ov11_022E86E4: ; 0x022E86E4
	stmdb sp!, {r3, lr}
	ldr r0, _022E8744 ; =0x02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _022E8714
	bl FreeDBox
	ldr r0, _022E8744 ; =0x02324CAC
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_022E8714:
	ldr r0, _022E8744 ; =0x02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl FreePortraitBox
	ldr r0, _022E8744 ; =0x02324CAC
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8744: .word 0x02324CAC
	arm_func_end ov11_022E86E4

	arm_func_start ov11_022E8748
ov11_022E8748: ; 0x022E8748
	stmdb sp!, {r3, lr}
	ldr r0, _022E8770 ; =0x02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsDBoxActive
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8770: .word 0x02324CAC
	arm_func_end ov11_022E8748

	arm_func_start ov11_022E8774
ov11_022E8774: ; 0x022E8774
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldr r2, _022E91E8 ; =0x02324FA0
	mov r4, r0
	str r4, [r2, #0x14]
	mov r0, #0
	strb r0, [r2, #4]
	mov r1, #1
	strb r1, [r2, #2]
	strb r0, [r2, #3]
	strb r0, [r2, #1]
	mov r1, #0x2c
	strb r0, [r2]
	bl LoadScriptVariableValue
	mov r2, r0
	ldr r0, _022E91EC ; =0x023209B0
	mov r1, r4
	bl DebugPrint0__0200C1FC
	bl sub_02028E2C
	mov r0, #0
	mov r1, #0xb0000
	mov r2, #0x20
	mov r3, #1
	bl MemArenaAlloc
	ldr r1, _022E91F0 ; =0x02324CB0
	ldr r2, _022E91F4 ; =0x02324FC0
	str r0, [r1, #8]
	mov r0, #0x64000
	str r0, [sp, #0xc]
	add r0, sp, #8
	mov r1, #0x34
	str r2, [sp, #8]
	bl CreateMemArena
	ldr r2, _022E91F0 ; =0x02324CB0
	ldr r1, _022E91F8 ; =ov11_022E93C0
	str r0, [r2, #4]
	ldr r0, _022E91FC ; =0x022E935C
	bl SetMemAllocatorParams
	sub r0, r4, #0xc
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022E88B0
_022E881C: ; jump table
	b _022E8840 ; case 0
	b _022E8840 ; case 1
	b _022E8840 ; case 2
	b _022E88B0 ; case 3
	b _022E88B0 ; case 4
	b _022E885C ; case 5
	b _022E8870 ; case 6
	b _022E889C ; case 7
	b _022E889C ; case 8
_022E8840:
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r2, #1
	strb r2, [r0]
	mov r1, #0
	strb r1, [r0, #2]
	strb r2, [r0, #4]
	b _022E88B0
_022E885C:
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r1, #1
	strb r1, [r0, #2]
	strb r1, [r0, #4]
	b _022E88B0
_022E8870:
	add r0, sp, #4
	bl sub_02049338
	ldr r0, [sp, #4]
	mov r1, #1
	cmp r0, #0
	moveq r2, #1
	ldr r0, _022E91E8 ; =0x02324FA0
	movne r2, #0
	strb r2, [r0, #2]
	strb r1, [r0, #4]
	b _022E88B0
_022E889C:
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r1, #0
	strb r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
_022E88B0:
	bl sub_02017A68
	bl ov11_022EB848
	cmp r4, #0x11
	moveq r0, #2
	movne r0, #0
	bl ov11_022E9720
	bl ov11_022EAFD4
	bl ov11_022DC6C4
	bl ov11_022F4518
	bl ov11_022EBA44
	mov r0, #1
	bl sub_02047FFC
	bl ov11_022F709C
	bl ov11_022F11DC
	bl ov11_022EA908
	bl ov11_022FE9E0
	bl ov11_022F7CBC
	bl ov11_022FBDBC
	bl ov11_022FD624
	bl ov11_0230CE78
	bl ov11_0230CFF4
	ldr r1, _022E91E8 ; =0x02324FA0
	mov r2, #1
	mov r0, #0
	str r2, [r1, #0x1c]
	str r0, [r1, #0x10]
	sub r2, r0, #1
	str r2, [r1, #0x18]
	mov r1, #0x1c
	bl LoadScriptVariableValue
	ldr r2, _022E91E8 ; =0x02324FA0
	mov r1, #0x1d
	strh r0, [r2, #8]
	mov r0, #0
	bl LoadScriptVariableValue
	ldr r1, _022E91E8 ; =0x02324FA0
	mvn r2, #0
	str r0, [r1, #0xc]
	strh r2, [r1, #6]
	ldr r1, _022E91F0 ; =0x02324CB0
	mov r2, #1
	ldr r0, _022E9200 ; =ov11_022E9258
	strb r2, [r1]
	bl sub_0200383C
_022E8960:
	mvn r0, #0
	strh r0, [sp, #2]
	bl sub_020038E8
	bl ov11_022DC808
	ldr r0, _022E91E8 ; =0x02324FA0
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	cmpne r0, #2
	beq _022E8990
	ldr r0, _022E9204 ; =0x023209CC
	bl DebugPrint0__0200C1FC
	b _022E8FDC
_022E8990:
	bl sub_02034D0C
	ldr r0, _022E91E8 ; =0x02324FA0
	ldr r2, [r0, #0x14]
	cmp r2, #0x14
	addls pc, pc, r2, lsl #2
	b _022E8CD4
_022E89A8: ; jump table
	b _022E89FC ; case 0
	b _022E8CD4 ; case 1
	b _022E8A24 ; case 2
	b _022E8CD4 ; case 3
	b _022E8CD4 ; case 4
	b _022E8CD4 ; case 5
	b _022E8CD4 ; case 6
	b _022E8CD4 ; case 7
	b _022E8AE4 ; case 8
	b _022E8AE4 ; case 9
	b _022E8AE4 ; case 10
	b _022E8AE4 ; case 11
	b _022E8C20 ; case 12
	b _022E8C20 ; case 13
	b _022E8A24 ; case 14
	b _022E8BEC ; case 15
	b _022E8A3C ; case 16
	b _022E8CA8 ; case 17
	b _022E8CB4 ; case 18
	b _022E8CC0 ; case 19
	b _022E8CCC ; case 20
_022E89FC:
	ldr r0, _022E9208 ; =0x023209EC
	bl DebugPrint0__0200C1FC
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl ov11_022E9438
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r1, #1
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8A24:
	add r0, sp, #2
	bl sub_0206C0D8
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r1, #1
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8A3C:
	bl sub_0204E70C
	mov r5, r0
	bl sub_0204E760
	mov r4, r0
	mov r2, r4
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r2, r4
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	ldr r0, _022E920C ; =0x02320A08
	mov r1, r5
	mov r2, r4
	bl DebugPrint0__0200C1FC
	cmp r5, #2
	ldreq r0, _022E9210 ; =0x0000029D
	streqh r0, [sp, #2]
	beq _022E8CD4
	cmp r5, #3
	ldreq r0, _022E9214 ; =0x0000029E
	streqh r0, [sp, #2]
	beq _022E8CD4
	mov r0, #0
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldrne r0, _022E9218 ; =0x0000029F
	strneh r0, [sp, #2]
	bne _022E8CD4
	mov r0, r4
	bl GetDungeonModeSpecial
	cmp r0, #3
	moveq r0, #0x29c
	streqh r0, [sp, #2]
	beq _022E8CD4
	cmp r5, #1
	ldreq r0, _022E921C ; =0x0000029B
	streqh r0, [sp, #2]
	ldrne r0, _022E9220 ; =0x0000029A
	strneh r0, [sp, #2]
	b _022E8CD4
_022E8AE4:
	mov r0, #0
	mov r1, #0x2b
	bl SaveScriptVariableValue
	ldr r0, _022E9208 ; =0x023209EC
	bl DebugPrint0__0200C1FC
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl ov11_022E9438
	mov r0, #0
	mov r1, #0x2a
	mov r2, #1
	mov r3, #2
	bl sub_0204BED8
	bl sub_0204F034
	mov r4, r0
	bl sub_0204F050
	mov r5, r0
	bl GetDungeonModeSpecial
	mov r3, r0
	ldr r0, _022E9224 ; =0x02320A28
	mov r1, r4
	mov r2, r5
	bl DebugPrint0__0200C1FC
	cmp r4, #2
	cmpne r4, #3
	beq _022E8B94
	mov r0, #0
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldrne r0, _022E9228 ; =0x000002A5
	strneh r0, [sp, #2]
	bne _022E8B94
	mov r0, r5
	bl GetDungeonModeSpecial
	cmp r0, #3
	moveq r0, #0x2a4
	streqh r0, [sp, #2]
	beq _022E8B94
	cmp r4, #1
	ldreq r0, _022E922C ; =0x000002A1
	streqh r0, [sp, #2]
	movne r0, #0x2a0
	strneh r0, [sp, #2]
_022E8B94:
	ldr r0, _022E91E8 ; =0x02324FA0
	ldr r0, [r0, #0x14]
	cmp r0, #8
	bne _022E8BC4
	cmp r4, #0
	cmpne r4, #1
	bne _022E8BC4
	cmp r5, #0xd5
	bge _022E8BC4
	mov r0, r5
	mov r1, #1
	bl SetDungeonConquest
_022E8BC4:
	mov r0, #0
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _022E8CD4
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r1, #1
	strh r1, [r0, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	b _022E8CD4
_022E8BEC:
	bl sub_0204E760
	mov r4, r0
	mov r2, r4
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r2, r4
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	ldr r0, _022E9230 ; =0x000002A6
	strh r0, [sp, #2]
	b _022E8CD4
_022E8C20:
	ldr r0, _022E9208 ; =0x023209EC
	bl DebugPrint0__0200C1FC
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl ov11_022E9438
	ldr r1, _022E91E8 ; =0x02324FA0
	mov r0, #0
	ldr r2, [r1, #0x14]
	mov r1, #0x2c
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1e
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1c
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x1d
	mov r2, r0
	bl SaveScriptVariableValue
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r1, #1
	ldr r0, [r0, #0x14]
	cmp r0, #0xc
	moveq r0, #0x46
	streqh r0, [sp, #2]
	movne r0, #0x47
	strneh r0, [sp, #2]
	ldr r0, _022E91E8 ; =0x02324FA0
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8CA8:
	mov r0, #0x4e
	strh r0, [sp, #2]
	b _022E8CD4
_022E8CB4:
	mov r0, #0x4f
	strh r0, [sp, #2]
	b _022E8CD4
_022E8CC0:
	mov r0, #0x50
	strh r0, [sp, #2]
	b _022E8CD4
_022E8CCC:
	mov r0, #0x51
	strh r0, [sp, #2]
_022E8CD4:
	ldr r0, _022E91E8 ; =0x02324FA0
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022E8D78
	mov r0, #0
	mov r1, #0x1c
	bl LoadScriptVariableValue
	ldr r1, _022E91E8 ; =0x02324FA0
	mov r4, r0
	ldr r2, [r1, #0x14]
	mov r0, #0
	mov r1, #0x2c
	bl SaveScriptVariableValue
	ldr r1, _022E91E8 ; =0x02324FA0
	ldr r0, _022E9234 ; =0x02320A44
	ldr r1, [r1, #0x14]
	bl DebugPrint0__0200C1FC
	ldr r0, _022E91E8 ; =0x02324FA0
	ldr r1, [r0, #0x14]
	cmp r1, #1
	beq _022E8D50
	cmp r1, #4
	mov r1, #0x1e
	bne _022E8D44
	ldrsh r2, [r0, #8]
	mov r0, #0
	bl SaveScriptVariableValue
	b _022E8D50
_022E8D44:
	mov r2, r4
	mov r0, #0
	bl SaveScriptVariableValue
_022E8D50:
	ldr r1, _022E91E8 ; =0x02324FA0
	mov r0, #0
	ldrsh r2, [r1, #8]
	mov r1, #0x1c
	bl SaveScriptVariableValue
	ldr r1, _022E91E8 ; =0x02324FA0
	mov r0, #0
	ldr r2, [r1, #0xc]
	mov r1, #0x1d
	bl SaveScriptVariableValue
_022E8D78:
	ldr r0, _022E91E8 ; =0x02324FA0
	mov r2, #3
	mov r1, #0
	str r2, [r0, #0x14]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x10]
	sub r2, r1, #1
	str r2, [r0, #0x18]
	ldrsh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r2, [r0, #8]
	bl ov11_022E98CC
	bl ov11_022DC718
	bl ov11_022F468C
	bl ov11_022F7104
	bl ov11_022F1244
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl ov11_022F7D18
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl ComputeSpecialCounters
	ldrsh r0, [sp, #2]
	mvn r1, #0
	cmp r0, r1
	mov r1, #0
	beq _022E8DF8
	bl ov11_022F7188
	mvn r0, #0
	strh r0, [sp, #2]
	b _022E8E00
_022E8DF8:
	mov r0, #0x3c
	bl ov11_022F7188
_022E8E00:
	bl sub_020039E4
	mov fp, #0
	mov r6, #1
	mov r8, #0x1e
	ldr r5, _022E91E8 ; =0x02324FA0
	ldr r4, _022E9238 ; =0x00000F0F
	mov r7, r6
	mov sl, r8
	mov sb, fp
_022E8E24:
	bl sub_020038E8
	bl ov11_022DC808
	bl sub_0204F9CC
	ldr r1, [r5, #0x1c]
	cmp r1, #0
	beq _022E8EBC
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _022E8E88
	sub r0, r0, #1
	str r0, [r5, #0x10]
	cmp r0, #0
	bgt _022E8F94
	cmp r1, #1
	cmpne r1, #2
	bne _022E8E70
	ldr r0, [r5, #0x18]
	bl ov11_022E9AD8
	b _022E8F94
_022E8E70:
	ldrb r2, [r5, #4]
	ldrb r1, [r5, #1]
	ldr r0, [r5, #0x18]
	orr r1, r2, r1
	bl ov11_022E9AF0
	b _022E8F94
_022E8E88:
	bl ov11_022E9EFC
	cmp r0, #0
	bne _022E8F94
	ldr r0, _022E91E8 ; =0x02324FA0
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	cmpne r0, #2
	bne _022E8FB8
	mov r0, #0
	bl ov11_022E9B24
	mov r0, #0
	bl ov11_022E9B84
	b _022E8FB8
_022E8EBC:
	ldrb r0, [r5, #4]
	cmp r0, #0
	ldreqb r0, [r5, #1]
	cmpeq r0, #0
	beq _022E8F94
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _022E8F1C
	mov r0, sb
	bl sub_02034840
	cmp r0, #0
	bne _022E8F94
	bl ov11_022F7628
	cmp r0, #0
	bne _022E8F94
	bl ov11_0230D170
	cmp r0, #0
	bne _022E8F94
	bl ov11_022F7140
	mov r0, r8
	bl ov11_022E9644
	mov r0, sl
	bl sub_02017ACC
	b _022E8F94
_022E8F1C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _022E8F94
	mov r0, fp
	add r1, sp, #0
	bl GetPressedButtons
	bl sub_0204AE60
	cmp r0, #0
	add r0, sp, #0x10
	beq _022E8F4C
	bl GetReleasedStylus
	b _022E8F50
_022E8F4C:
	bl sub_02006BFC
_022E8F50:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _022E8F6C
	ldrh r0, [sp]
	tst r0, #8
	strneb r7, [r5, #3]
	b _022E8F94
_022E8F6C:
	ldrh r0, [sp]
	tst r0, r4
	bne _022E8F90
	add r0, sp, #0x10
	mov r1, #2
	mov r2, #0
	bl sub_02006C8C
	cmp r0, #0
	beq _022E8F94
_022E8F90:
	strb r6, [r5, #3]
_022E8F94:
	bl ov11_022F766C
	bl ov11_0230D340
	bl sub_020039E4
	bl ov11_022F7BC4
	bl ov11_022F2188
	bl ov11_0230D570
	bl sub_02034A80
	bl sub_02028848
	b _022E8E24
_022E8FB8:
	bl ov11_022F1244
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl ov11_022F7D18
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl sub_020039E4
	b _022E8960
_022E8FDC:
	mov r0, #0
	bl sub_0200383C
	bl sub_02034710
	bl ov11_0230CF00
	mov r0, #0
	bl ov11_022E9FC8
	cmp r0, #2
	bne _022E9008
	mov r0, #1
	bl sub_0204F024
	b _022E9010
_022E9008:
	mov r0, #0
	bl sub_0204F024
_022E9010:
	bl ov11_0230CED4
	bl ov11_022F1214
	bl ov11_022EA91C
	bl ov11_022F7DD4
	bl ov11_022FBE4C
	bl ov11_022FD6B4
	bl ov11_022FEA70
	bl ov11_022F70D0
	bl sub_0204804C
	bl ov11_022F47F4
	bl ov11_022DC7A0
	bl ov11_022EAFF4
	bl ov11_022E9848
	bl ov11_022EB9A4
	mov r0, #0
	mov r1, r0
	bl SetMemAllocatorParams
	ldr r0, _022E91F0 ; =0x02324CB0
	ldr r0, [r0, #4]
	bl sub_020012D8
	ldr r0, _022E91F0 ; =0x02324CB0
	ldr r0, [r0, #8]
	bl sub_020012D8
	ldr r0, _022E91E8 ; =0x02324FA0
	ldrb r1, [r0]
	cmp r1, #0
	beq _022E9090
	ldr r0, [r0, #0x1c]
	cmp r0, #8
	moveq r0, #0xf
	movne r0, #0xe
	b _022E91E0
_022E9090:
	ldrb r1, [r0, #4]
	ldr r0, [r0, #0x1c]
	cmp r1, #0
	beq _022E90D0
	cmp r0, #6
	beq _022E90C0
	cmp r0, #7
	bne _022E90C0
	ldr r0, _022E923C ; =0x02320A60
	bl DebugPrint0__0200C1FC
	mov r0, #0xd
	b _022E91E0
_022E90C0:
	ldr r0, _022E9240 ; =0x02320A70
	bl DebugPrint0__0200C1FC
	mov r0, #0xc
	b _022E91E0
_022E90D0:
	cmp r0, #3
	beq _022E90E4
	cmp r0, #4
	beq _022E914C
	b _022E9170
_022E90E4:
	mov r0, #0
	mov r1, #0x2c
	mov r2, #0xf
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2b
	mov r2, #0xf
	bl SaveScriptVariableValue
	bl sub_0204E6FC
	mov r5, r0
	bl sub_0204E760
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	mov r2, r4
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x29
	mov r2, r4
	bl SaveScriptVariableValue
	mov r1, r5
	mov r2, r4
	ldr r0, _022E9244 ; =0x02320A7C
	bl DebugPrint0__0200C1FC
	mov r0, #4
	b _022E91E0
_022E914C:
	bl sub_0204E6FC
	mov r4, r0
	bl sub_0204E760
	mov r2, r0
	ldr r0, _022E9248 ; =0x02320A94
	mov r1, r4
	bl DebugPrint0__0200C1FC
	mov r0, #5
	b _022E91E0
_022E9170:
	mov r0, #0
	mov r1, #0x2c
	mov r2, #1
	bl SaveScriptVariableValue
	ldr r0, _022E91E8 ; =0x02324FA0
	ldr r1, [r0, #0x1c]
	cmp r1, #5
	bne _022E91A0
	ldr r0, _022E924C ; =0x02320AAC
	bl DebugPrint0__0200C1FC
	mov r0, #9
	b _022E91E0
_022E91A0:
	cmp r1, #7
	bne _022E91D4
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E91C4
	ldr r0, _022E924C ; =0x02320AAC
	bl DebugPrint0__0200C1FC
	mov r0, #9
	b _022E91E0
_022E91C4:
	ldr r0, _022E9250 ; =0x02320AB8
	bl DebugPrint0__0200C1FC
	mov r0, #0xb
	b _022E91E0
_022E91D4:
	ldr r0, _022E9254 ; =0x02320AC8
	bl DebugPrint0__0200C1FC
	mov r0, #0xa
_022E91E0:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E91E8: .word 0x02324FA0
_022E91EC: .word 0x023209B0
_022E91F0: .word 0x02324CB0
_022E91F4: .word 0x02324FC0
_022E91F8: .word ov11_022E93C0
_022E91FC: .word 0x022E935C
_022E9200: .word ov11_022E9258
_022E9204: .word 0x023209CC
_022E9208: .word 0x023209EC
_022E920C: .word 0x02320A08
_022E9210: .word 0x0000029D
_022E9214: .word 0x0000029E
_022E9218: .word 0x0000029F
_022E921C: .word 0x0000029B
_022E9220: .word 0x0000029A
_022E9224: .word 0x02320A28
_022E9228: .word 0x000002A5
_022E922C: .word 0x000002A1
_022E9230: .word 0x000002A6
_022E9234: .word 0x02320A44
_022E9238: .word 0x00000F0F
_022E923C: .word 0x02320A60
_022E9240: .word 0x02320A70
_022E9244: .word 0x02320A7C
_022E9248: .word 0x02320A94
_022E924C: .word 0x02320AAC
_022E9250: .word 0x02320AB8
_022E9254: .word 0x02320AC8
	arm_func_end ov11_022E8774

	arm_func_start ov11_022E9258
ov11_022E9258: ; 0x022E9258
	stmdb sp!, {r4, lr}
	bl sub_020038D8
	cmp r0, #0
	beq _022E9294
	bl sub_02006E14
	bl ov11_022F2178
	bl ov11_022FEE90
	bl ov11_022FAE58
	bl ov11_022FD47C
	bl ov11_022FE838
	bl ov11_022E4350
	bl ov11_022DC81C
	bl ov11_022EA024
	bl sub_02003990
	b _022E92A8
_022E9294:
	bl ov11_022F2178
	bl ov11_022FEE90
	bl ov11_022FAE58
	bl ov11_022FD47C
	bl ov11_022FE838
_022E92A8:
	bl sub_0201BF64
	bl sub_02028E40
	bl ov11_022EB3F0
	bl ov11_022F2194
	bl ov11_0230D6C4
	bl ov11_022EA0BC
	bl ov11_022EFC54
	bl ov11_022F5274
	bl sub_0201F464
	ldr r0, _022E9358 ; =0x02324CB0
	ldrb r0, [r0]
	cmp r0, #0
	bne _022E92E0
	bl sub_0201DDFC
_022E92E0:
	bl sub_02008F84
	bl sub_0201BE28
	bl sub_02017A80
	bl sub_02003A40
	ldr r1, _022E9358 ; =0x02324CB0
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _022E930C
	mov r0, #0
	bl sub_02008ED0
_022E930C:
	bl sub_02008F88
	bl sub_020778D0
	bl sub_0201DE10
	bl ov11_022F2244
	bl ov11_0230D6F0
	bl ov11_022EFCE4
	bl ov11_022F5B70
	bl ov10_022BF7D4
	mov r0, r4
	bl sub_02028A64
	bl sub_0201BE5C
	bl sub_0201BE84
	bl sub_02028E88
	bl sub_0201BF4C
	mov r0, r4
	mov r2, #0
	ldr r1, _022E9358 ; =0x02324CB0
	strb r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9358: .word 0x02324CB0
	arm_func_end ov11_022E9258

	arm_func_start ov11_022E935C
ov11_022E935C: ; 0x022E935C
	cmp r0, #0
	bxne lr
	and r0, r1, #0xff
	sub r0, r0, #8
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022E93B4
_022E9378: ; jump table
	b _022E93A8 ; case 0
	b _022E93B4 ; case 1
	b _022E93B4 ; case 2
	b _022E93B4 ; case 3
	b _022E93B4 ; case 4
	b _022E93B4 ; case 5
	b _022E939C ; case 6
	b _022E93A8 ; case 7
	b _022E93A8 ; case 8
_022E939C:
	ldr r0, _022E93BC ; =0x02324CB0
	ldr r0, [r0, #8]
	bx lr
_022E93A8:
	ldr r0, _022E93BC ; =0x02324CB0
	ldr r0, [r0, #4]
	bx lr
_022E93B4:
	mov r0, #0
	bx lr
	.align 2, 0
_022E93BC: .word 0x02324CB0
	arm_func_end ov11_022E935C

	arm_func_start ov11_022E93C0
ov11_022E93C0: ; 0x022E93C0
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _022E9410 ; =0x02324CB0
	ldr r0, [r0, #8]
	bl sub_020017B4
	cmp r0, #0
	ldrne r0, _022E9410 ; =0x02324CB0
	ldrne r0, [r0, #8]
	ldmneia sp!, {r4, pc}
	ldr r0, _022E9410 ; =0x02324CB0
	mov r1, r4
	ldr r0, [r0, #4]
	bl sub_020017B4
	cmp r0, #0
	ldrne r0, _022E9410 ; =0x02324CB0
	ldrne r0, [r0, #4]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9410: .word 0x02324CB0
	arm_func_end ov11_022E93C0

	arm_func_start ov11_022E9414
ov11_022E9414: ; 0x022E9414
	stmdb sp!, {r3, lr}
	ldr r0, _022E9434 ; =0x023209EC
	bl DebugPrint0__0200C1FC
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl ov11_022E9438
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9434: .word 0x023209EC
	arm_func_end ov11_022E9414

	arm_func_start ov11_022E9438
ov11_022E9438: ; 0x022E9438
	stmdb sp!, {r4, lr}
	bl GetGameMode
	mov r4, r0
	ldr r0, _022E94C8 ; =0x02320AD4
	bl DebugPrint0__0200C1FC
	cmp r4, #3
	bne _022E9468
	mov r0, #0
	bl GetKecleonItems1
	mov r0, #0
	bl GetKecleonItems2
	ldmia sp!, {r4, pc}
_022E9468:
	cmp r4, #2
	ldmneia sp!, {r4, pc}
	bl GetScenarioBalance__0204CB94
	cmp r0, #6
	movhs r4, #3
	bhs _022E9498
	cmp r0, #4
	movhs r4, #2
	bhs _022E9498
	cmp r0, #2
	movhs r4, #1
	movlo r4, #0
_022E9498:
	ldr r0, _022E94CC ; =0x02320AEC
	mov r1, r4
	bl DebugPrint0__0200C1FC
	mov r0, r4
	bl GetKecleonItems1
	mov r0, r4
	bl GetKecleonItems2
	bl GenerateDailyMissions
	bl sub_02012B7C
	bl sub_0201080C
	bl sub_02011FA0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E94C8: .word 0x02320AD4
_022E94CC: .word 0x02320AEC
	arm_func_end ov11_022E9438

	arm_func_start ov11_022E94D0
ov11_022E94D0: ; 0x022E94D0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _022E9550 ; =0x02324FA0
	mov r5, r0
	ldr r0, [r3, #0x1c]
	mov r4, r1
	mov r6, r2
	cmp r0, #0
	bne _022E9548
	ldr r1, _022E9554 ; =0x02320B10
	mov r2, r5
	mov r3, r6
	mov r0, #1
	bl DebugPrint
	ldr r0, _022E9550 ; =0x02324FA0
	mov r1, #1
	str r1, [r0, #0x1c]
	str r1, [r0, #0x10]
	str r6, [r0, #0x18]
	cmp r4, #0
	movge r1, #3
	movlt r1, #4
	ldr r0, _022E9550 ; =0x02324FA0
	cmp r4, #0
	str r1, [r0, #0x14]
	strh r5, [r0, #8]
	ldr r1, _022E9550 ; =0x02324FA0
	movlt r4, #0
	mov r0, #1
	str r4, [r1, #0xc]
	ldmia sp!, {r4, r5, r6, pc}
_022E9548:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9550: .word 0x02324FA0
_022E9554: .word 0x02320B10
	arm_func_end ov11_022E94D0

	arm_func_start ov11_022E9558
ov11_022E9558: ; 0x022E9558
	ldr r1, _022E9588 ; =0x02324FA0
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	movne r0, #0
	bxne lr
	mov r2, #3
	str r2, [r1, #0x1c]
	mov r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x18]
	mov r0, r2
	bx lr
	.align 2, 0
_022E9588: .word 0x02324FA0
	arm_func_end ov11_022E9558

	arm_func_start ov11_022E958C
ov11_022E958C: ; 0x022E958C
	stmdb sp!, {r4, lr}
	ldr r1, _022E95D4 ; =0x02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E95D8 ; =0x02320B34
	mov r2, r4
	mov r0, #1
	bl DebugPrint
	ldr r1, _022E95D4 ; =0x02324FA0
	mov r0, #4
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E95D4: .word 0x02324FA0
_022E95D8: .word 0x02320B34
	arm_func_end ov11_022E958C

	arm_func_start ov11_022E95DC
ov11_022E95DC: ; 0x022E95DC
	stmdb sp!, {r4, lr}
	ldr r1, _022E963C ; =0x02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	bne _022E9634
	ldr r1, _022E9640 ; =0x02320B58
	mov r2, r4
	mov r0, #1
	bl DebugPrint
	ldr r0, _022E963C ; =0x02324FA0
	mov r1, #6
	str r1, [r0, #0x1c]
	cmp r4, #0
	movge r1, #1
	strge r1, [r0, #0x10]
	strge r4, [r0, #0x18]
	movlt r1, #0
	strlt r1, [r0, #0x10]
	strlt r1, [r0, #0x18]
	mov r0, #1
	ldmia sp!, {r4, pc}
_022E9634:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E963C: .word 0x02324FA0
_022E9640: .word 0x02320B58
	arm_func_end ov11_022E95DC

	arm_func_start ov11_022E9644
ov11_022E9644: ; 0x022E9644
	stmdb sp!, {r4, lr}
	ldr r1, _022E968C ; =0x02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E9690 ; =0x02320B78
	mov r2, r4
	mov r0, #1
	bl DebugPrint
	ldr r1, _022E968C ; =0x02324FA0
	mov r0, #7
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E968C: .word 0x02324FA0
_022E9690: .word 0x02320B78
	arm_func_end ov11_022E9644

	arm_func_start ov11_022E9694
ov11_022E9694: ; 0x022E9694
	stmdb sp!, {r4, lr}
	ldr r1, _022E96DC ; =0x02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E96E0 ; =0x02320B9C
	mov r2, r4
	mov r0, #1
	bl DebugPrint
	ldr r1, _022E96DC ; =0x02324FA0
	mov r0, #8
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E96DC: .word 0x02324FA0
_022E96E0: .word 0x02320B9C
	arm_func_end ov11_022E9694

	arm_func_start ov11_022E96E4
ov11_022E96E4: ; 0x022E96E4
	ldr r0, _022E96F0 ; =0x02324FA0
	ldrb r0, [r0, #4]
	bx lr
	.align 2, 0
_022E96F0: .word 0x02324FA0
	arm_func_end ov11_022E96E4

	arm_func_start ov11_022E96F4
ov11_022E96F4: ; 0x022E96F4
	cmp r0, #0
	moveq r1, #1
	ldr r0, _022E970C ; =0x02324FA0
	movne r1, #0
	strb r1, [r0, #2]
	bx lr
	.align 2, 0
_022E970C: .word 0x02324FA0
	arm_func_end ov11_022E96F4

	arm_func_start ov11_022E9710
ov11_022E9710: ; 0x022E9710
	ldr r1, _022E971C ; =0x02324FA0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022E971C: .word 0x02324FA0
	arm_func_end ov11_022E9710

	arm_func_start ov11_022E9720
ov11_022E9720: ; 0x022E9720
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _022E9824 ; =0x02388FC0
	mov r1, #1
	str r0, [r2, #0x10]
	ldr r0, _022E9828 ; =0x0238905C
	bl sub_0200B894
	ldr r0, _022E982C ; =0x02389128
	mov r1, #0
	bl sub_0200B894
	ldr r0, _022E9830 ; =0x023890E4
	mov r1, #0
	bl sub_0200B894
	ldr r0, _022E9834 ; =0x02389018
	mov r1, #1
	bl sub_0200B894
	ldr r0, _022E9838 ; =0x023890A0
	mov r1, #0
	bl sub_0200B894
	mov r8, #0
	ldr r6, _022E983C ; =0x02388FD4
	ldr r5, _022E9840 ; =0x0238916C
	mov r7, r8
	mov r4, #0x44
_022E977C:
	mla r0, r8, r4, r5
	mov r2, r8, lsl #1
	mov r1, r7
	strh r7, [r6, r2]
	bl sub_0200B894
	add r8, r8, #1
	cmp r8, #2
	blt _022E977C
	bl ov11_022EBAE8
	mov r0, #0
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E9830 ; =0x023890E4
	bl sub_0200B908
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r0
	ldr r0, _022E9830 ; =0x023890E4
	bl sub_0200B908
	mov r0, #1
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E9838 ; =0x023890A0
	bl sub_0200B908
	bl ov11_022E98CC
	bl ov11_022E99E0
	ldr r0, _022E9844 ; =0x02388FD8
	bl sub_0201E730
	mov r2, #0x100
	ldr r0, _022E9844 ; =0x02388FD8
	mov r1, #0xc0
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	mov r1, #0x20
	strh r1, [r0, #0x2a]
	mov r1, #1
	strb r1, [r0, #0x3e]
	mov r1, #2
	strb r1, [r0, #0x3c]
	mov r1, #0
	strb r1, [r0, #0x2f]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E9824: .word 0x02388FC0
_022E9828: .word 0x0238905C
_022E982C: .word 0x02389128
_022E9830: .word 0x023890E4
_022E9834: .word 0x02389018
_022E9838: .word 0x023890A0
_022E983C: .word 0x02388FD4
_022E9840: .word 0x0238916C
_022E9844: .word 0x02388FD8
	arm_func_end ov11_022E9720

	arm_func_start ov11_022E9848
ov11_022E9848: ; 0x022E9848
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E98B8 ; =0x023890E4
	bl sub_0200B918
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r0
	ldr r0, _022E98B8 ; =0x023890E4
	bl sub_0200B918
	mov r0, #1
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E98BC ; =0x023890A0
	bl sub_0200B918
	bl ov11_022EBB14
	ldr r0, _022E98C0 ; =0x0238905C
	bl sub_0200B8B8
	ldr r0, _022E98C4 ; =0x02389128
	bl sub_0200B8B8
	ldr r0, _022E98B8 ; =0x023890E4
	bl sub_0200B8B8
	ldr r0, _022E98C8 ; =0x02389018
	bl sub_0200B8B8
	ldr r0, _022E98BC ; =0x023890A0
	bl sub_0200B8B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E98B8: .word 0x023890E4
_022E98BC: .word 0x023890A0
_022E98C0: .word 0x0238905C
_022E98C4: .word 0x02389128
_022E98C8: .word 0x02389018
	arm_func_end ov11_022E9848

	arm_func_start ov11_022E98CC
ov11_022E98CC: ; 0x022E98CC
	stmdb sp!, {r3, lr}
	ldr r2, _022E99D0 ; =0x02388FC0
	mov r0, #0
	strb r0, [r2]
	strb r0, [r2, #2]
	str r0, [r2, #0xc]
	str r0, [r2, #8]
	mov r1, #1
	strb r1, [r2, #1]
	ldr r2, [r2, #0x10]
	cmp r2, #2
	bne _022E9968
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022E9924
	ldr r0, _022E99D4 ; =0x0238905C
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =0x02389128
	mov r1, #2
	bl sub_0200B8D4
	b _022E99A8
_022E9924:
	mov r0, #0
	bl sub_02008F4C
	cmp r0, #0x100
	mov r1, #0
	bne _022E9950
	ldr r0, _022E99D4 ; =0x0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =0x02389128
	mov r1, #1
	bl sub_0200B8D4
	b _022E99A8
_022E9950:
	ldr r0, _022E99D4 ; =0x0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =0x02389128
	mov r1, #0
	bl sub_0200B8D4
	b _022E99A8
_022E9968:
	cmp r2, #0
	bne _022E9994
	ldr r0, _022E99D4 ; =0x0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =0x02389128
	mov r1, #1
	bl sub_0200B8D4
	ldr r0, _022E99D0 ; =0x02388FC0
	mov r1, #1
	str r1, [r0, #0x10]
	b _022E99A8
_022E9994:
	ldr r0, _022E99D4 ; =0x0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =0x02389128
	mov r1, #0
	bl sub_0200B8D4
_022E99A8:
	ldr r0, _022E99DC ; =0x023890E4
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E99D4 ; =0x0238905C
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022E99D8 ; =0x02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E99D0: .word 0x02388FC0
_022E99D4: .word 0x0238905C
_022E99D8: .word 0x02389128
_022E99DC: .word 0x023890E4
	arm_func_end ov11_022E98CC

	arm_func_start ov11_022E99E0
ov11_022E99E0: ; 0x022E99E0
	stmdb sp!, {r3, lr}
	ldr r0, _022E9A6C ; =0x02388FC0
	ldr r0, [r0, #0x10]
	cmp r0, #2
	bne _022E9A44
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022E9A14
	ldr r0, _022E9A70 ; =0x02389018
	mov r1, #2
	bl sub_0200B8D4
	b _022E9A50
_022E9A14:
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0
	bne _022E9A34
	ldr r0, _022E9A70 ; =0x02389018
	mov r1, #1
	bl sub_0200B8D4
	b _022E9A50
_022E9A34:
	ldr r0, _022E9A70 ; =0x02389018
	mov r1, #0
	bl sub_0200B8D4
	b _022E9A50
_022E9A44:
	ldr r0, _022E9A70 ; =0x02389018
	mov r1, #1
	bl sub_0200B8D4
_022E9A50:
	ldr r0, _022E9A74 ; =0x023890A0
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E9A70 ; =0x02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A6C: .word 0x02388FC0
_022E9A70: .word 0x02389018
_022E9A74: .word 0x023890A0
	arm_func_end ov11_022E99E0

	arm_func_start ov11_022E9A78
ov11_022E9A78: ; 0x022E9A78
	ldr ip, _022E9A88 ; =sub_0200B908
	mov r1, r0
	ldr r0, _022E9A8C ; =0x023890E4
	bx ip
	.align 2, 0
_022E9A88: .word sub_0200B908
_022E9A8C: .word 0x023890E4
	arm_func_end ov11_022E9A78

	arm_func_start ov11_022E9A90
ov11_022E9A90: ; 0x022E9A90
	ldr ip, _022E9AA0 ; =sub_0200B908
	mov r1, r0
	ldr r0, _022E9AA4 ; =0x023890A0
	bx ip
	.align 2, 0
_022E9AA0: .word sub_0200B908
_022E9AA4: .word 0x023890A0
	arm_func_end ov11_022E9A90

	arm_func_start ov11_022E9AA8
ov11_022E9AA8: ; 0x022E9AA8
	ldr ip, _022E9AB8 ; =sub_0200B918
	mov r1, r0
	ldr r0, _022E9ABC ; =0x023890E4
	bx ip
	.align 2, 0
_022E9AB8: .word sub_0200B918
_022E9ABC: .word 0x023890E4
	arm_func_end ov11_022E9AA8

	arm_func_start ov11_022E9AC0
ov11_022E9AC0: ; 0x022E9AC0
	ldr ip, _022E9AD0 ; =sub_0200B918
	mov r1, r0
	ldr r0, _022E9AD4 ; =0x023890A0
	bx ip
	.align 2, 0
_022E9AD0: .word sub_0200B918
_022E9AD4: .word 0x023890A0
	arm_func_end ov11_022E9AC0

	arm_func_start ov11_022E9AD8
ov11_022E9AD8: ; 0x022E9AD8
	ldr r1, _022E9AEC ; =0x02388FC0
	mov r2, #1
	strb r2, [r1]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_022E9AEC: .word 0x02388FC0
	arm_func_end ov11_022E9AD8

	arm_func_start ov11_022E9AF0
ov11_022E9AF0: ; 0x022E9AF0
	ldr r2, _022E9B08 ; =0x02388FC0
	mov r3, #1
	strb r3, [r2, #2]
	strb r1, [r2, #3]
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
_022E9B08: .word 0x02388FC0
	arm_func_end ov11_022E9AF0

	arm_func_start ov11_022E9B0C
ov11_022E9B0C: ; 0x022E9B0C
	ldr ip, _022E9B1C ; =sub_0200BB60
	mov r1, r0
	ldr r0, _022E9B20 ; =0x0238905C
	bx ip
	.align 2, 0
_022E9B1C: .word sub_0200BB60
_022E9B20: .word 0x0238905C
	arm_func_end ov11_022E9B0C

	arm_func_start ov11_022E9B24
ov11_022E9B24: ; 0x022E9B24
	ldr ip, _022E9B38 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9B3C ; =0x0238905C
	mov r1, #1
	bx ip
	.align 2, 0
_022E9B38: .word sub_0200BB74
_022E9B3C: .word 0x0238905C
	arm_func_end ov11_022E9B24

	arm_func_start ov11_022E9B40
ov11_022E9B40: ; 0x022E9B40
	ldr ip, _022E9B54 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9B58 ; =0x0238905C
	mov r1, #2
	bx ip
	.align 2, 0
_022E9B54: .word sub_0200BB74
_022E9B58: .word 0x0238905C
	arm_func_end ov11_022E9B40

	arm_func_start ov11_022E9B5C
ov11_022E9B5C: ; 0x022E9B5C
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9B80 ; =0x0238905C
	mov r1, lr
	mov r2, ip
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9B80: .word 0x0238905C
	arm_func_end ov11_022E9B5C

	arm_func_start ov11_022E9B84
ov11_022E9B84: ; 0x022E9B84
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9BC8 ; =0x02388FC0
	moveq r1, #1
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022E9BC0
	ldr r0, _022E9BCC ; =0x02389128
	mov r1, r4
	bl sub_0200BB60
	ldr r0, _022E9BC8 ; =0x02388FC0
	mov r1, #1
_022E9BC0:
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9BC8: .word 0x02388FC0
_022E9BCC: .word 0x02389128
	arm_func_end ov11_022E9B84

	arm_func_start ov11_022E9BD0
ov11_022E9BD0: ; 0x022E9BD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9C18 ; =0x02388FC0
	moveq r1, #2
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022E9C0C
	ldr r0, _022E9C1C ; =0x02389128
	mov r2, r4
	mov r1, #1
	bl sub_0200BB74
	ldr r0, _022E9C18 ; =0x02388FC0
_022E9C0C:
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9C18: .word 0x02388FC0
_022E9C1C: .word 0x02389128
	arm_func_end ov11_022E9BD0

	arm_func_start ov11_022E9C20
ov11_022E9C20: ; 0x022E9C20
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9C68 ; =0x02388FC0
	moveq r1, #3
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022E9C5C
	ldr r0, _022E9C6C ; =0x02389128
	mov r2, r4
	mov r1, #2
	bl sub_0200BB74
	ldr r0, _022E9C68 ; =0x02388FC0
_022E9C5C:
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9C68: .word 0x02388FC0
_022E9C6C: .word 0x02389128
	arm_func_end ov11_022E9C20

	arm_func_start ov11_022E9C70
ov11_022E9C70: ; 0x022E9C70
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9C94 ; =0x02389128
	mov r1, lr
	mov r2, ip
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9C94: .word 0x02389128
	arm_func_end ov11_022E9C70

	arm_func_start ov11_022E9C98
ov11_022E9C98: ; 0x022E9C98
	ldr ip, _022E9CA8 ; =sub_0200BB60
	mov r1, r0
	ldr r0, _022E9CAC ; =0x02389018
	bx ip
	.align 2, 0
_022E9CA8: .word sub_0200BB60
_022E9CAC: .word 0x02389018
	arm_func_end ov11_022E9C98

	arm_func_start ov11_022E9CB0
ov11_022E9CB0: ; 0x022E9CB0
	ldr ip, _022E9CC4 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9CC8 ; =0x02389018
	mov r1, #1
	bx ip
	.align 2, 0
_022E9CC4: .word sub_0200BB74
_022E9CC8: .word 0x02389018
	arm_func_end ov11_022E9CB0

	arm_func_start ov11_022E9CCC
ov11_022E9CCC: ; 0x022E9CCC
	ldr ip, _022E9CE0 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9CE4 ; =0x02389018
	mov r1, #2
	bx ip
	.align 2, 0
_022E9CE0: .word sub_0200BB74
_022E9CE4: .word 0x02389018
	arm_func_end ov11_022E9CCC

	arm_func_start ov11_022E9CE8
ov11_022E9CE8: ; 0x022E9CE8
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D0C ; =0x02389018
	mov r1, lr
	mov r2, ip
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D0C: .word 0x02389018
	arm_func_end ov11_022E9CE8

	arm_func_start ov11_022E9D10
ov11_022E9D10: ; 0x022E9D10
	stmdb sp!, {r3, lr}
	mov r2, r0
	ldr r0, _022E9D40 ; =0x02389018
	ldrsh r1, [r0, #0x14]
	cmp r1, #0
	ble _022E9D34
	mov r1, #2
	bl sub_0200BB74
	ldmia sp!, {r3, pc}
_022E9D34:
	mov r1, #1
	bl sub_0200BB74
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D40: .word 0x02389018
	arm_func_end ov11_022E9D10

	arm_func_start ov11_022E9D44
ov11_022E9D44: ; 0x022E9D44
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D68 ; =0x023890E4
	mov r1, lr
	mov r2, ip
	bl sub_0200BC60
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D68: .word 0x023890E4
	arm_func_end ov11_022E9D44

	arm_func_start ov11_022E9D6C
ov11_022E9D6C: ; 0x022E9D6C
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D90 ; =0x023890E4
	mov r1, lr
	mov r2, ip
	bl sub_0200BCB0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D90: .word 0x023890E4
	arm_func_end ov11_022E9D6C

	arm_func_start ov11_022E9D94
ov11_022E9D94: ; 0x022E9D94
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9DB8 ; =0x023890A0
	mov r1, lr
	mov r2, ip
	bl sub_0200BC60
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9DB8: .word 0x023890A0
	arm_func_end ov11_022E9D94

	arm_func_start ov11_022E9DBC
ov11_022E9DBC: ; 0x022E9DBC
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9DE0 ; =0x023890A0
	mov r1, lr
	mov r2, ip
	bl sub_0200BCB0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9DE0: .word 0x023890A0
	arm_func_end ov11_022E9DBC

	arm_func_start ov11_022E9DE4
ov11_022E9DE4: ; 0x022E9DE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	mov r6, r2
	ldr r2, _022E9E24 ; =0x02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9E28 ; =0x0238916C
	strh r1, [r2, r0]
	add r0, r5, r4
	mov r1, #1
	mov r2, #0
	bl sub_0200BB74
	mov r1, r6
	add r0, r5, r4
	bl sub_0200BB60
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9E24: .word 0x02388FD4
_022E9E28: .word 0x0238916C
	arm_func_end ov11_022E9DE4

	arm_func_start ov11_022E9E2C
ov11_022E9E2C: ; 0x022E9E2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	ldr r3, _022E9E6C ; =0x02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9E70 ; =0x0238916C
	strh r1, [r3, r0]
	mov r6, r2
	add r0, r5, r4
	mov r1, #0
	bl sub_0200BB60
	mov r2, r6
	add r0, r5, r4
	mov r1, #1
	bl sub_0200BB74
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9E6C: .word 0x02388FD4
_022E9E70: .word 0x0238916C
	arm_func_end ov11_022E9E2C

	arm_func_start ov11_022E9E74
ov11_022E9E74: ; 0x022E9E74
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	mov r6, r2
	ldr r2, _022E9EB4 ; =0x02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9EB8 ; =0x0238916C
	strh r1, [r2, r0]
	add r0, r5, r4
	mov r1, #1
	mov r2, #0
	bl sub_0200BB74
	mov r1, r6
	add r0, r5, r4
	bl sub_0200BB88
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9EB4: .word 0x02388FD4
_022E9EB8: .word 0x0238916C
	arm_func_end ov11_022E9E74

	arm_func_start ov11_022E9EBC
ov11_022E9EBC: ; 0x022E9EBC
	stmdb sp!, {r3, lr}
	ldr ip, _022E9EF4 ; =0x0238916C
	mov r3, #0x44
	mov lr, r0, lsl #1
	mla r0, r3, r0, ip
	sub r2, r2, #0x100
	mov r2, r2, lsl #0x10
	ldr r3, _022E9EF8 ; =0x02388FD4
	mov r2, r2, asr #0x10
	strh r1, [r3, lr]
	mov r3, r2
	mov r1, #0
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9EF4: .word 0x0238916C
_022E9EF8: .word 0x02388FD4
	arm_func_end ov11_022E9EBC

	arm_func_start ov11_022E9EFC
ov11_022E9EFC: ; 0x022E9EFC
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F3C ; =0x02388FC0
	ldrb r1, [r0]
	cmp r1, #0
	ldreqb r0, [r0, #2]
	cmpeq r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022E9F40 ; =0x023890E4
	bl sub_0200BD14
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022E9F44 ; =0x0238905C
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F3C: .word 0x02388FC0
_022E9F40: .word 0x023890E4
_022E9F44: .word 0x0238905C
	arm_func_end ov11_022E9EFC

	arm_func_start ov11_022E9F48
ov11_022E9F48: ; 0x022E9F48
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9F70 ; =0x02388FC0
	ldreqb r0, [r0, #1]
	ldmeqia sp!, {r3, pc}
	ldr r0, _022E9F74 ; =0x02389128
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F70: .word 0x02388FC0
_022E9F74: .word 0x02389128
	arm_func_end ov11_022E9F48

	arm_func_start ov11_022E9F78
ov11_022E9F78: ; 0x022E9F78
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F9C ; =0x023890A0
	bl sub_0200BD14
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022E9FA0 ; =0x02389018
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F9C: .word 0x023890A0
_022E9FA0: .word 0x02389018
	arm_func_end ov11_022E9F78

	arm_func_start ov11_022E9FA4
ov11_022E9FA4: ; 0x022E9FA4
	ldr r1, _022E9FC4 ; =0x02388FD4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E9FC4: .word 0x02388FD4
	arm_func_end ov11_022E9FA4

	arm_func_start ov11_022E9FC8
ov11_022E9FC8: ; 0x022E9FC8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _022E9FE0
	ldr r0, _022E9FEC ; =0x02389128
	bl sub_0200BD2C
	ldmia sp!, {r3, pc}
_022E9FE0:
	ldr r0, _022E9FF0 ; =0x02389018
	bl sub_0200BD2C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9FEC: .word 0x02389128
_022E9FF0: .word 0x02389018
	arm_func_end ov11_022E9FC8

	arm_func_start ov11_022E9FF4
ov11_022E9FF4: ; 0x022E9FF4
	ldr r0, _022EA000 ; =0x0238905C
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022EA000: .word 0x0238905C
	arm_func_end ov11_022E9FF4

	arm_func_start ov11_022EA004
ov11_022EA004: ; 0x022EA004
	ldr r0, _022EA010 ; =0x02389128
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022EA010: .word 0x02389128
	arm_func_end ov11_022EA004

	arm_func_start ov11_022EA014
ov11_022EA014: ; 0x022EA014
	ldr r0, _022EA020 ; =0x02389018
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022EA020: .word 0x02389018
	arm_func_end ov11_022EA014

	arm_func_start ov11_022EA024
ov11_022EA024: ; 0x022EA024
	stmdb sp!, {r3, lr}
	ldr r0, _022EA0B4 ; =0x02388FC0
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022EA0A0
	cmp r1, #1
	beq _022EA054
	cmp r1, #2
	beq _022EA064
	cmp r1, #3
	beq _022EA078
	b _022EA088
_022EA054:
	ldr r1, [r0, #4]
	ldr r0, _022EA0B8 ; =0x02389128
	bl sub_0200BB60
	b _022EA088
_022EA064:
	ldr r2, [r0, #4]
	ldr r0, _022EA0B8 ; =0x02389128
	mov r1, #1
	bl sub_0200BB74
	b _022EA088
_022EA078:
	ldr r2, [r0, #4]
	ldr r0, _022EA0B8 ; =0x02389128
	mov r1, #2
	bl sub_0200BB74
_022EA088:
	ldr r0, _022EA0B4 ; =0x02388FC0
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
_022EA0A0:
	ldr r0, _022EA0B8 ; =0x02389128
	bl sub_0200BD14
	ldr r1, _022EA0B4 ; =0x02388FC0
	strb r0, [r1, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA0B4: .word 0x02388FC0
_022EA0B8: .word 0x02389128
	arm_func_end ov11_022EA024

	arm_func_start ov11_022EA0BC
ov11_022EA0BC: ; 0x022EA0BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _022EA7EC ; =0x023890E4
	mov r4, #1
	bl sub_0200BD50
	ldr r0, _022EA7F0 ; =0x023890A0
	bl sub_0200BD50
	ldr r0, _022EA7F4 ; =0x02388FC0
	ldrb r1, [r0, #2]
	cmp r1, #0
	beq _022EA300
	ldr r0, _022EA7F8 ; =0x0238905C
	bl sub_0200BC54
	cmp r0, #0
	ldr r0, _022EA7F8 ; =0x0238905C
	movne r4, #0
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022EA7FC ; =0x02389128
	bl sub_0200BD2C
	cmp r0, #0
	bne _022EA12C
	ldr r1, _022EA7F4 ; =0x02388FC0
	ldr r0, _022EA7FC ; =0x02389128
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022EA1B4
_022EA12C:
	ldr r0, _022EA7FC ; =0x02389128
	bl sub_0200BC54
	cmp r0, #0
	movne r4, #0
	bne _022EA1B4
	ldr r0, _022EA7FC ; =0x02389128
	bl sub_0200BD2C
	cmp r0, #2
	bne _022EA1B4
	ldr r0, _022EA7F4 ; =0x02388FC0
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022EA1B4
	mov r0, #0
	mov r1, r0
	bl sub_02009194
	mov r0, #1
	mov r1, #0
	bl sub_02009194
	mov r0, #2
	mov r1, #0
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_02009194
	ldr r0, _022EA7FC ; =0x02389128
	mov r1, #1
	ldr r2, _022EA7F4 ; =0x02388FC0
	ldr r2, [r2, #0xc]
	bl sub_0200BB74
	mov r4, #0
_022EA1B4:
	ldr r0, _022EA7FC ; =0x02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldr r0, _022EA800 ; =0x02389018
	bl sub_0200BD2C
	cmp r0, #0
	bne _022EA1EC
	ldr r1, _022EA7F4 ; =0x02388FC0
	ldr r0, _022EA800 ; =0x02389018
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022EA264
_022EA1EC:
	ldr r0, _022EA800 ; =0x02389018
	bl sub_0200BC54
	cmp r0, #0
	movne r4, #0
	bne _022EA264
	ldr r0, _022EA800 ; =0x02389018
	bl sub_0200BD2C
	cmp r0, #2
	bne _022EA264
	mov r0, #0
	mov r1, #1
	bl sub_02009194
	mov r0, #1
	mov r1, r0
	bl sub_02009194
	mov r0, #2
	mov r1, #1
	bl sub_02009194
	mov r0, #3
	mov r1, #1
	bl sub_02009194
	mov r0, #4
	mov r1, #1
	bl sub_02009194
	ldr r0, _022EA800 ; =0x02389018
	mov r1, #1
	ldr r2, _022EA7F4 ; =0x02388FC0
	ldr r2, [r2, #0xc]
	bl sub_0200BB74
	mov r4, #0
_022EA264:
	ldr r0, _022EA800 ; =0x02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8D4
	cmp r4, #0
	beq _022EA3D4
	ldr r2, _022EA7F4 ; =0x02388FC0
	mov r0, #0
	strb r0, [r2, #2]
	mov r1, r0
	strb r0, [r2]
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	mov r0, #0
	mov r1, #1
	bl sub_020091B0
	mov r0, #1
	mov r1, r0
	bl sub_020091B0
	mov r0, #2
	mov r1, #1
	bl sub_020091B0
	mov r0, #3
	mov r1, #1
	bl sub_020091B0
	mov r0, #4
	mov r1, #1
	bl sub_020091B0
	b _022EA3D4
_022EA300:
	ldrb r0, [r0]
	cmp r0, #0
	beq _022EA398
	ldr r0, _022EA7F8 ; =0x0238905C
	bl sub_0200BC54
	cmp r0, #0
	ldr r0, _022EA7F8 ; =0x0238905C
	movne r4, #0
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022EA7FC ; =0x02389128
	bl sub_0200BD2C
	cmp r0, #0
	bne _022EA354
	ldr r1, _022EA7F4 ; =0x02388FC0
	ldr r0, _022EA7FC ; =0x02389128
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022EA364
_022EA354:
	ldr r0, _022EA7FC ; =0x02389128
	bl sub_0200BC54
	cmp r0, #0
	movne r4, #0
_022EA364:
	ldr r0, _022EA7FC ; =0x02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldr r0, _022EA800 ; =0x02389018
	bl sub_0200BC54
	ldr r0, _022EA800 ; =0x02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8D4
	cmp r4, #0
	ldrne r0, _022EA7F4 ; =0x02388FC0
	movne r1, #0
	strneb r1, [r0]
	b _022EA3D4
_022EA398:
	ldr r0, _022EA7F8 ; =0x0238905C
	bl sub_0200BC54
	ldr r0, _022EA7F8 ; =0x0238905C
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022EA7FC ; =0x02389128
	bl sub_0200BC54
	ldr r0, _022EA7FC ; =0x02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldr r0, _022EA800 ; =0x02389018
	bl sub_0200BC54
	ldr r0, _022EA800 ; =0x02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8D4
_022EA3D4:
	mov r8, #0
	mov fp, #0x44
	ldr r5, _022EA804 ; =0x0238916C
	ldr r6, _022EA808 ; =0x02388FD4
	mov r4, r8
	mov sl, fp
_022EA3EC:
	mov r0, r8, lsl #1
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _022EA7DC
	mla r7, r8, sl, r5
	mov r0, r7
	bl sub_0200BC54
	cmp r0, #0
	beq _022EA6B8
	and sb, r8, #0xff
	mla r0, sb, fp, r5
	ldrsh r0, [r0, #0x14]
	add r0, r0, #0x100
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	arm_func_end ov11_022EA0BC

	arm_func_start ov11_022EA428
ov11_022EA428: ; 0x022EA428
	cmp r0, #0xff
	movgt r7, #0x80
	bgt _022EA444
	cmp r0, #0
	movlt r7, #0
	addge r0, r0, r0, lsr #31
	movge r7, r0, asr #1
_022EA444:
	mov r0, #2
	and r1, r8, #0xff
	bl sub_020091B0
	mov r0, #3
	and r1, r8, #0xff
	bl sub_020091B0
	and r0, r8, #0xff
	bl sub_02009120
	mov r0, sb, lsl #1
	ldrh r0, [r6, r0]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _022EA7DC
_022EA478: ; jump table
	b _022EA7DC ; case 0
	b _022EA4A4 ; case 1
	b _022EA4F4 ; case 2
	b _022EA4A4 ; case 3
	b _022EA4F4 ; case 4
	b _022EA544 ; case 5
	b _022EA594 ; case 6
	b _022EA5DC ; case 7
	b _022EA624 ; case 8
	b _022EA66C ; case 9
	b _022EA66C ; case 10
_022EA4A4:
	mov r0, #2
	mov r1, #1
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	rsb r1, r7, #0x80
	mov r0, r7, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA4F4:
	mov r0, #3
	mov r1, #1
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	rsb r1, r7, #0x80
	mov r0, r7, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA544:
	mov r0, #2
	mov r1, r0
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	rsb r1, r7, #0x80
	mov r0, r7, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA594:
	mov r0, #2
	mov r1, #1
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0x80
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA5DC:
	mov r0, #3
	mov r1, #1
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0x80
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA624:
	mov r0, #2
	mov r1, r0
	arm_func_end ov11_022EA428

	arm_func_start ov11_022EA62C
ov11_022EA62C: ; 0x022EA62C
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0x80
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA66C:
	mov r0, #2
	mov r1, #1
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	and r2, r8, #0xff
	bl sub_02009454
	add r0, r7, r7, lsr #31
	mov r0, r0, lsl #0xf
	mov r0, r0, asr #0x10
	mov r1, #0x80
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7DC
_022EA6B8:
	mov r0, r8, lsl #1
	ldrh r0, [r6, r0]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _022EA7CC
_022EA6CC: ; jump table
	b _022EA7CC ; case 0
	b _022EA6F8 ; case 1
	b _022EA758 ; case 2
	b _022EA710 ; case 3
	b _022EA770 ; case 4
	b _022EA7D4 ; case 5
	b _022EA734 ; case 6
	b _022EA794 ; case 7
	b _022EA7D4 ; case 8
	b _022EA7B8 ; case 9
	b _022EA7D4 ; case 10
_022EA6F8:
	and r0, r8, #0xff
	bl ov11_022EF53C
	mov r0, #3
	and r1, r8, #0xff
	bl sub_02009194
	b _022EA7D4
_022EA710:
	and r0, r8, #0xff
	bl ov11_022EF53C
	ldrsh r0, [r7, #0x14]
	cmp r0, #0
	bge _022EA7D4
	mov r0, #2
	and r1, r8, #0xff
	bl sub_02009194
	b _022EA7D4
_022EA734:
	ldrsh r0, [r7, #0x14]
	cmp r0, #0
	bge _022EA7D4
	and r0, r8, #0xff
	bl ov11_022EF53C
	mov r0, #2
	and r1, r8, #0xff
	bl sub_02009194
	b _022EA7D4
_022EA758:
	and r0, r8, #0xff
	bl ov11_022EF53C
	mov r0, #2
	and r1, r8, #0xff
	bl sub_02009194
	b _022EA7D4
_022EA770:
	and r0, r8, #0xff
	bl ov11_022EF53C
	ldrsh r0, [r7, #0x14]
	cmp r0, #0
	bge _022EA7D4
	mov r0, #3
	and r1, r8, #0xff
	bl sub_02009194
	b _022EA7D4
_022EA794:
	ldrsh r0, [r7, #0x14]
	cmp r0, #0
	bge _022EA7D4
	and r0, r8, #0xff
	bl ov11_022EF53C
	mov r0, #3
	and r1, r8, #0xff
	bl sub_02009194
	b _022EA7D4
_022EA7B8:
	mov r0, #0
	mov r1, #0x80
	and r2, r8, #0xff
	bl sub_020094C4
	b _022EA7D4
_022EA7CC:
	and r0, r8, #0xff
	bl ov11_022EF53C
_022EA7D4:
	mov r0, r8, lsl #1
	strh r4, [r6, r0]
_022EA7DC:
	add r8, r8, #1
	cmp r8, #2
	blt _022EA3EC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EA7EC: .word 0x023890E4
_022EA7F0: .word 0x023890A0
_022EA7F4: .word 0x02388FC0
_022EA7F8: .word 0x0238905C
_022EA7FC: .word 0x02389128
_022EA800: .word 0x02389018
_022EA804: .word 0x0238916C
_022EA808: .word 0x02388FD4
	arm_func_end ov11_022EA62C

	arm_func_start ov11_022EA80C
ov11_022EA80C: ; 0x022EA80C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl GetDebugFlag1
	cmp r0, #0
	ldrne r0, _022EA89C ; =0x02388FD8
	movne r1, #0
	strneb r1, [r0, #0x2f]
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	ble _022EA864
	ldr r0, _022EA89C ; =0x02388FD8
	mov r1, #0xff
	strb r1, [r0, #0x2c]
	strb r1, [r0, #0x2d]
	strb r1, [r0, #0x2e]
	cmp r4, #0x100
	strgeb r1, [r0, #0x2f]
	strltb r4, [r0, #0x2f]
	ldr r0, _022EA89C ; =0x02388FD8
	bl sub_0201F2A0
	ldmia sp!, {r4, pc}
_022EA864:
	ldmgeia sp!, {r4, pc}
	ldr r1, _022EA89C ; =0x02388FD8
	mov r2, #0
	strb r2, [r1, #0x2c]
	sub r0, r2, #0x100
	strb r2, [r1, #0x2d]
	cmp r4, r0
	movle r0, #0xff
	strb r2, [r1, #0x2e]
	rsbgt r0, r4, #0
	strb r0, [r1, #0x2f]
	ldr r0, _022EA89C ; =0x02388FD8
	bl sub_0201F2A0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA89C: .word 0x02388FD8
	arm_func_end ov11_022EA80C

	arm_func_start ov11_022EA8A0
ov11_022EA8A0: ; 0x022EA8A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl GetDebugFlag1
	cmp r0, #0
	mov r0, #0
	beq _022EA8C8
	mov r1, r0
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
_022EA8C8:
	mov r1, r4
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EA8A0

	arm_func_start ov11_022EA8D4
ov11_022EA8D4: ; 0x022EA8D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl GetDebugFlag1
	cmp r0, #0
	mov r0, #1
	beq _022EA8FC
	mov r1, #0
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
_022EA8FC:
	mov r1, r4
	bl sub_02008F3C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EA8D4

	arm_func_start ov11_022EA908
ov11_022EA908: ; 0x022EA908
	ldr r0, _022EA918 ; =0x023891F4
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_022EA918: .word 0x023891F4
	arm_func_end ov11_022EA908

	arm_func_start ov11_022EA91C
ov11_022EA91C: ; 0x022EA91C
	bx lr
	arm_func_end ov11_022EA91C

	arm_func_start ov11_022EA920
ov11_022EA920: ; 0x022EA920
	cmp r0, #0xa
	beq _022EA938
	cmp r0, #0xb
	ldreq r1, _022EA950 ; =0x023891F4
	streq r0, [r1]
	bx lr
_022EA938:
	ldr r0, _022EA950 ; =0x023891F4
	ldr r1, [r0]
	cmp r1, #0xb
	moveq r1, #0
	streq r1, [r0]
	bx lr
	.align 2, 0
_022EA950: .word 0x023891F4
	arm_func_end ov11_022EA920

	arm_func_start ov11_022EA954
ov11_022EA954: ; 0x022EA954
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	sub r1, r2, #1
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	str r2, [r0, #0x1c]
	bx lr
	arm_func_end ov11_022EA954

	arm_func_start ov11_022EA978
ov11_022EA978: ; 0x022EA978
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	arm_func_end ov11_022EA978

	arm_func_start ov11_022EA990
ov11_022EA990: ; 0x022EA990
	stmdb sp!, {r4, lr}
	sub r2, r1, #0xa
	mov r4, r0
	cmp r2, #1
	ldmlsia sp!, {r4, pc}
	cmp r1, #6
	bne _022EA9BC
	bl ov11_022EA954
	mov r0, #6
	str r0, [r4]
	ldmia sp!, {r4, pc}
_022EA9BC:
	ldr r0, [r4, #4]
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	str r1, [r4, #4]
	mvn r0, #0
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	bl KeyWaitInit__02006DA4
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EA990

	arm_func_start ov11_022EA9E4
ov11_022EA9E4: ; 0x022EA9E4
	stmdb sp!, {r4, lr}
	ldr r1, _022EAA20 ; =0x023891F4
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0xb
	moveq r0, #0xb
	ldmeqia sp!, {r4, pc}
	bl ov11_022F75C0
	cmp r0, #0
	movne r0, #0xb
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #4]
	cmp r0, #0
	ldreq r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EAA20: .word 0x023891F4
	arm_func_end ov11_022EA9E4

	arm_func_start ov11_022EAA24
ov11_022EAA24: ; 0x022EAA24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x38
	mov r6, r3
	mvn r4, #0
	ldr r3, _022EAF5C ; =0x023891F4
	str r4, [r6]
	ldr r3, [r3]
	mov sb, r0
	cmp r3, #0xb
	mov r8, r1
	mov r7, r2
	ldr r5, [sp, #0x58]
	moveq r0, #5
	beq _022EAF54
	ldr r1, [sb]
	cmp r1, #5
	bne _022EAA74
	bl ov11_022EA954
	mov r0, #5
	str r0, [sb]
_022EAA74:
	ldr r4, [sb, #4]
	cmp r4, #0
	ldreq r4, [sb]
	cmp r4, #1
	beq _022EAA9C
	cmp r4, #6
	beq _022EAE9C
	cmp r4, #7
	beq _022EAF2C
	b _022EAF40
_022EAA9C:
	bl ov11_022F9074
	cmp r0, #0
	mov r0, #0
	beq _022EAE8C
	add r1, sp, #6
	bl GetHeldButtons
	add r1, sp, #4
	mov r0, #0
	bl GetPressedButtons
	bl ov11_0230D000
	cmp r0, #0
	beq _022EAAEC
	bl ov11_0230D220
	cmp r0, #0
	beq _022EAB00
	mov r0, #0
	str r0, [r8]
	sub r1, r0, #1
	strb r1, [r7]
	b _022EAF54
_022EAAEC:
	mov r0, #0
	str r0, [r8]
	sub r1, r0, #1
	strb r1, [r7]
	b _022EAF54
_022EAB00:
	ldrh r0, [sp, #6]
	tst r0, #2
	movne r0, #0
	mvneq r0, #0
	str r0, [sb, #8]
	ldrh r0, [sp, #4]
	tst r0, #0x400
	beq _022EAB38
	mov r0, #0x12
	str r0, [r8]
	sub r0, r0, #0x13
	strb r0, [r7]
	mov r0, #6
	b _022EAF54
_022EAB38:
	tst r0, #1
	movne r0, #0xa
	strne r0, [r8]
	bne _022EAB84
	tst r0, #0x100
	movne r0, #9
	strne r0, [r8]
	bne _022EAB84
	ldr r0, [sb, #8]
	cmp r0, #0
	moveq r0, #5
	streq r0, [r8]
	beq _022EAB84
	bl sub_0204AEE0
	cmp r0, #0
	movne r0, #4
	strne r0, [r8]
	moveq r0, #3
	streq r0, [r8]
_022EAB84:
	ldrh r0, [sp, #6]
	bl ov11_022EAF70
	strb r0, [r7]
	bl sub_0204AE80
	cmp r0, #0
	beq _022EAE7C
	ldrsb r1, [r7]
	mvn r0, #0
	cmp r1, r0
	bne _022EAE6C
	ldr r0, [r8]
	sub r0, r0, #3
	cmp r0, #2
	bhi _022EAE5C
	add r0, sp, #0x14
	bl GetReleasedStylus
	ldrh r0, [sp, #0x14]
	tst r0, #0x10
	bne _022EABE0
	tst r0, #0x400
	bne _022EABE0
	tst r0, #0x20
	beq _022EAC0C
_022EABE0:
	add r0, sp, #0xc
	add r1, sp, #0x28
	bl ov11_022FBBC8
	add r0, sp, #0
	add r1, sp, #0xc
	bl ov11_022FBC0C
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r2, [r5]
	str r1, [r5, #4]
	b _022EAC48
_022EAC0C:
	tst r0, #1
	moveq r0, #0
	streqb r0, [sp]
	mvneq r0, #0
	beq _022EAC48
	add r0, sp, #0xc
	add r1, sp, #0x18
	bl ov11_022FBBC8
	add r0, sp, #0
	add r1, sp, #0xc
	bl ov11_022FBC0C
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r2, [r5]
	str r1, [r5, #4]
_022EAC48:
	mov r1, r0, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _022EAC64
	ldrb r1, [sp]
	cmp r1, #0
	mvneq r0, #0
_022EAC64:
	ldrh r1, [sp, #0x14]
	tst r1, #0x20
	beq _022EACE0
	sub r1, r0, #2
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	movls r0, #9
	strls r0, [r8]
	bls _022EAE94
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022EACBC
	mov r0, #0xb
	str r0, [r8]
	sub r0, r0, #0xc
	strb r0, [r7]
	mov r0, #2
	b _022EAF54
_022EACBC:
	mov r0, #0x11
	str r0, [sb, #0x10]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x10]
	mov r0, #1
	str r2, [sb, #0x14]
	str r1, [sb, #0x18]
	str r0, [sb, #0x1c]
	b _022EAE94
_022EACE0:
	tst r1, #0x10
	bne _022EACF0
	tst r1, #0x400
	beq _022EAD78
_022EACF0:
	cmp r0, #2
	bne _022EAD10
	mov r0, #0x12
	str r0, [r8]
	sub r0, r0, #0x13
	strb r0, [r7]
	mov r0, #6
	b _022EAF54
_022EAD10:
	cmp r0, #3
	moveq r0, #9
	streq r0, [r8]
	beq _022EAE94
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022EAD48
	mov r0, #0xb
	str r0, [r8]
	sub r0, r0, #0xc
	strb r0, [r7]
	mov r0, #2
	b _022EAF54
_022EAD48:
	bl sub_0204AEE0
	cmp r0, #0
	movne r0, #0x10
	moveq r0, #0xf
	str r0, [sb, #0x10]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x10]
	mov r0, #1
	str r2, [sb, #0x14]
	str r1, [sb, #0x18]
	str r0, [sb, #0x1c]
	b _022EAE94
_022EAD78:
	tst r1, #0x200
	beq _022EAD98
	mov r0, #0xe
	str r0, [r8]
	sub r0, r0, #0xf
	strb r0, [r7]
	mov r0, #3
	b _022EAF54
_022EAD98:
	tst r1, #0x80
	beq _022EADB8
	mov r0, #5
	str r0, [r8]
	sub r0, r0, #6
	strb r0, [r7]
	mov r0, #3
	b _022EAF54
_022EADB8:
	tst r1, #0x40
	beq _022EAE10
	tst r1, #0x100
	bne _022EADD4
	mvn r1, #0
	cmp r0, r1
	bne _022EAE00
_022EADD4:
	ldr r0, [r8]
	cmp r0, #5
	moveq r0, #0xe
	streq r0, [r8]
	beq _022EAE00
	bl sub_0204AEE0
	cmp r0, #0
	movne r0, #0xd
	strne r0, [r8]
	moveq r0, #0xc
	streq r0, [r8]
_022EAE00:
	mvn r0, #0
	strb r0, [r7]
	mov r0, #3
	b _022EAF54
_022EAE10:
	ldr r0, [sb, #0x10]
	cmp r0, #0
	beq _022EAE94
	str r0, [r8]
	mvn r0, #0
	strb r0, [r7]
	ldr r1, [sb, #0x14]
	ldr r0, [sb, #0x18]
	str r1, [r5]
	str r0, [r5, #4]
	ldr r0, [sb, #0x1c]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r6]
	mov r0, #0
	str r0, [sb, #0x1c]
	mov r0, #4
	b _022EAF54
_022EAE5C:
	mov r0, #0
	str r0, [sb, #0x10]
	str r0, [sb, #0x1c]
	b _022EAE94
_022EAE6C:
	mov r0, #0
	str r0, [sb, #0x10]
	str r0, [sb, #0x1c]
	b _022EAE94
_022EAE7C:
	mov r0, #0
	str r0, [sb, #0x10]
	str r0, [sb, #0x1c]
	b _022EAE94
_022EAE8C:
	str r0, [sb, #0x10]
	str r0, [sb, #0x1c]
_022EAE94:
	ldr r0, [sb]
	b _022EAF54
_022EAE9C:
	add r0, sp, #8
	bl ov11_0230114C
	cmp r0, #0
	beq _022EAF40
	bl KeyWaitInit__02006DA4
	mov r0, sb
	bl ov11_022EA978
	mov r0, #1
	str r0, [sb]
	ldr r0, [sp, #8]
	cmp r0, #6
	bne _022EAF10
	mov r1, #5
	mov r0, sb
	str r1, [sb]
	bl ov11_022EA978
	mov r1, #1
	add r0, sp, #2
	str r1, [sb]
	bl sub_0206C0FC
	ldrsh r0, [sp, #2]
	mov r1, #0
	bl ov11_022F7188
	mov r0, #1
	str r0, [r8]
	sub r0, r0, #2
	strb r0, [r7]
	ldr r0, [sb]
	b _022EAF54
_022EAF10:
	mov r0, sb
	bl ov11_022EA978
	mov r1, #1
	mov r0, #2
	str r1, [sb]
	bl ov11_022DD130
	b _022EAF40
_022EAF2C:
	mov r0, sb
	bl ov11_022EA978
	mov r0, #1
	str r0, [sb]
	b _022EAF54
_022EAF40:
	mov r0, #0
	str r0, [r8]
	sub r1, r0, #1
	mov r0, r4
	strb r1, [r7]
_022EAF54:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022EAF5C: .word 0x023891F4
	arm_func_end ov11_022EAA24

	arm_func_start ov11_022EAF60
ov11_022EAF60: ; 0x022EAF60
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x1c]
	bx lr
	arm_func_end ov11_022EAF60

	arm_func_start ov11_022EAF70
ov11_022EAF70: ; 0x022EAF70
	tst r0, #0x40
	beq _022EAF94
	tst r0, #0x10
	movne r0, #3
	bxne lr
	tst r0, #0x20
	movne r0, #5
	moveq r0, #4
	bx lr
_022EAF94:
	tst r0, #0x80
	beq _022EAFB8
	tst r0, #0x10
	movne r0, #1
	bxne lr
	tst r0, #0x20
	movne r0, #7
	moveq r0, #0
	bx lr
_022EAFB8:
	tst r0, #0x10
	movne r0, #2
	bxne lr
	tst r0, #0x20
	movne r0, #6
	mvneq r0, #0
	bx lr
	arm_func_end ov11_022EAF70

	arm_func_start ov11_022EAFD4
ov11_022EAFD4: ; 0x022EAFD4
	stmdb sp!, {r4, lr}
	mov r4, #0
_022EAFDC:
	mov r0, r4
	bl ov11_022EAFF8
	add r4, r4, #1
	cmp r4, #2
	blt _022EAFDC
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EAFD4

	arm_func_start ov11_022EAFF4
ov11_022EAFF4: ; 0x022EAFF4
	bx lr
	arm_func_end ov11_022EAFF4

	arm_func_start ov11_022EAFF8
ov11_022EAFF8: ; 0x022EAFF8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r3, _022EB07C ; =0x023891F8
	ldr r2, _022EB080 ; =0x02320BBC
	mov r1, #0x54
	ldr ip, [r2, #0x1c]
	ldr lr, [r2, #0x18]
	mla r4, r0, r1, r3
	str lr, [sp]
	str ip, [sp, #4]
	ldr r3, [r2, #0x20]
	ldr r1, [r2, #0x24]
	add r2, sp, #0
	str r3, [r4, #0x48]
	str r1, [r4, #0x4c]
	mov r1, #0
	strb r1, [r4, #0x50]
	bl ov11_022EB0E4
	mov r1, #0
	str r1, [r4, #8]
	str r1, [r4, #0xc]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	sub r0, r1, #1
	str r0, [r4, #4]
	str r1, [r4, #0x30]
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EB07C: .word 0x023891F8
_022EB080: .word 0x02320BBC
	arm_func_end ov11_022EAFF8

	arm_func_start ov11_022EB084
ov11_022EB084: ; 0x022EB084
	stmdb sp!, {r3, lr}
	ldr lr, _022EB0BC ; =0x023891F8
	mov ip, #0x54
	mla ip, r0, ip, lr
	ldr r0, [ip, #0x30]
	cmp r0, r1
	strne r1, [ip, #0x30]
	movne r0, #0
	strne r0, [ip, #0x3c]
	strne r0, [ip, #0x40]
	strne r0, [ip, #0x44]
	str r2, [ip, #0x34]
	str r3, [ip, #0x38]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB0BC: .word 0x023891F8
	arm_func_end ov11_022EB084

	arm_func_start ov11_022EB0C0
ov11_022EB0C0: ; 0x022EB0C0
	mov r2, #0x54
	mul r2, r0, r2
	ldr r3, _022EB0E0 ; =0x023891F8
	mov r0, #0
	str r1, [r3, r2]
	add r1, r3, r2
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_022EB0E0: .word 0x023891F8
	arm_func_end ov11_022EB0C0

	arm_func_start ov11_022EB0E4
ov11_022EB0E4: ; 0x022EB0E4
	mov r3, #0x54
	mul r3, r0, r3
	ldr ip, _022EB124 ; =0x023891F8
	mov r0, #0
	str r1, [ip, r3]
	add r3, ip, r3
	str r0, [r3, #8]
	ldr r1, [r3, #0x18]
	ldr r0, [r3, #0x1c]
	str r1, [r3, #0x20]
	str r0, [r3, #0x24]
	ldr r1, [r2]
	ldr r0, [r2, #4]
	str r1, [r3, #0x28]
	str r0, [r3, #0x2c]
	bx lr
	.align 2, 0
_022EB124: .word 0x023891F8
	arm_func_end ov11_022EB0E4

	arm_func_start ov11_022EB128
ov11_022EB128: ; 0x022EB128
	mov r3, #0x54
	mul r3, r0, r3
	ldr ip, _022EB14C ; =0x023891F8
	mov r0, #0
	str r1, [ip, r3]
	add r1, ip, r3
	str r0, [r1, #8]
	str r2, [r1, #4]
	bx lr
	.align 2, 0
_022EB14C: .word 0x023891F8
	arm_func_end ov11_022EB128

	arm_func_start ov11_022EB150
ov11_022EB150: ; 0x022EB150
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB198 ; =0x023891F8
	mov r0, #1
	str r1, [lr, ip]
	add ip, lr, ip
	str r0, [ip, #8]
	str r3, [ip, #0xc]
	ldr r1, [ip, #0x18]
	ldr r0, [ip, #0x1c]
	str r1, [ip, #0x20]
	str r0, [ip, #0x24]
	ldr r1, [r2]
	ldr r0, [r2, #4]
	str r1, [ip, #0x28]
	str r0, [ip, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB198: .word 0x023891F8
	arm_func_end ov11_022EB150

	arm_func_start ov11_022EB19C
ov11_022EB19C: ; 0x022EB19C
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB1C8 ; =0x023891F8
	mov r0, #1
	str r1, [lr, ip]
	add r1, lr, ip
	str r0, [r1, #8]
	str r3, [r1, #0xc]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB1C8: .word 0x023891F8
	arm_func_end ov11_022EB19C

	arm_func_start ov11_022EB1CC
ov11_022EB1CC: ; 0x022EB1CC
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB204 ; =0x023891F8
	mov r0, #2
	str r1, [lr, ip]
	add ip, lr, ip
	str r0, [ip, #8]
	str r3, [ip, #0xc]
	ldr r1, [r2]
	ldr r0, [r2, #4]
	str r1, [ip, #0x28]
	str r0, [ip, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB204: .word 0x023891F8
	arm_func_end ov11_022EB1CC

	arm_func_start ov11_022EB208
ov11_022EB208: ; 0x022EB208
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB234 ; =0x023891F8
	mov r0, #2
	str r1, [lr, ip]
	add r1, lr, ip
	str r0, [r1, #8]
	str r3, [r1, #0xc]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB234: .word 0x023891F8
	arm_func_end ov11_022EB208

	arm_func_start ov11_022EB238
ov11_022EB238: ; 0x022EB238
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB270 ; =0x023891F8
	mov r0, #3
	str r1, [lr, ip]
	add ip, lr, ip
	str r0, [ip, #8]
	str r3, [ip, #0x10]
	ldr r1, [r2]
	ldr r0, [r2, #4]
	str r1, [ip, #0x28]
	str r0, [ip, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB270: .word 0x023891F8
	arm_func_end ov11_022EB238

	arm_func_start ov11_022EB274
ov11_022EB274: ; 0x022EB274
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB2A0 ; =0x023891F8
	mov r0, #3
	str r1, [lr, ip]
	add r1, lr, ip
	str r0, [r1, #8]
	str r3, [r1, #0x10]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB2A0: .word 0x023891F8
	arm_func_end ov11_022EB274

	arm_func_start ov11_022EB2A4
ov11_022EB2A4: ; 0x022EB2A4
	mov r1, #0x54
	mul r1, r0, r1
	ldr r0, _022EB2C8 ; =0x023891F8
	ldr r0, [r0, r1]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022EB2C8: .word 0x023891F8
	arm_func_end ov11_022EB2A4

	arm_func_start ov11_022EB2CC
ov11_022EB2CC: ; 0x022EB2CC
	ldr r2, _022EB2F0 ; =0x023891F8
	mov r1, #0x54
	mla r1, r0, r1, r2
	ldr r0, [r1, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022EB2F0: .word 0x023891F8
	arm_func_end ov11_022EB2CC

	arm_func_start ov11_022EB2F4
ov11_022EB2F4: ; 0x022EB2F4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r1
	cmp r0, #1
	mov r5, #0
	bne _022EB350
	bl ov11_02310D44
	cmp r0, #0
	beq _022EB330
	add r0, sp, #8
	add r1, sp, #0
	bl ov11_02310DE0
	cmp r0, #0
	movne r5, #1
	b _022EB350
_022EB330:
	bl ov11_0230ED28
	cmp r0, #0
	beq _022EB350
	add r0, sp, #8
	add r1, sp, #0
	bl ov11_0230F28C
	cmp r0, #0
	movne r5, #1
_022EB350:
	cmp r5, #0
	bne _022EB36C
	add r0, sp, #8
	add r1, sp, #0
	bl ov11_022F1F3C
	cmp r0, #0
	movne r5, #1
_022EB36C:
	cmp r5, #0
	beq _022EB3BC
	ldr r1, [sp, #8]
	ldr r0, [r4]
	cmp r0, r1
	strlt r1, [r4]
	ldr r1, [sp]
	ldr r0, [r4]
	cmp r0, r1
	strgt r1, [r4]
	ldr r1, [sp, #0xc]
	ldr r0, [r4, #4]
	cmp r0, r1
	strlt r1, [r4, #4]
	ldr r1, [sp, #4]
	ldr r0, [r4, #4]
	cmp r0, r1
	strgt r1, [r4, #4]
	mov r0, #1
	b _022EB3C0
_022EB3BC:
	mov r0, #0
_022EB3C0:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022EB2F4

	arm_func_start ov11_022EB3C8
ov11_022EB3C8: ; 0x022EB3C8
	ldr r3, _022EB3EC ; =0x023891F8
	mov r2, #0x54
	mla r3, r0, r2, r3
	ldr r2, [r3, #0x48]
	ldr r0, [r3, #0x4c]
	str r2, [r1]
	str r0, [r1, #4]
	ldrb r0, [r3, #0x50]
	bx lr
	.align 2, 0
_022EB3EC: .word 0x023891F8
	arm_func_end ov11_022EB3C8

	arm_func_start ov11_022EB3F0
ov11_022EB3F0: ; 0x022EB3F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r0, _022EB840 ; =0x02320BBC
	ldr r8, _022EB844 ; =0x023891F8
	ldr r7, [r0, #0x10]
	ldr r6, [r0, #0x14]
	ldr r5, [r0, #8]
	ldr sl, [r0, #0xc]
	ldr fp, [r0]
	ldr r0, [r0, #4]
	mvn r4, #1
	str r0, [sp, #4]
	str r0, [sp, #0x28]
	add r0, r4, #1
	str r7, [sp, #0x34]
	str r6, [sp, #0x38]
	str r5, [sp, #0x2c]
	str sl, [sp, #0x30]
	str fp, [sp, #0x24]
	mov sb, #0
	str r8, [sp, #0xc]
	str r8, [sp, #0x10]
	str r8, [sp, #0x14]
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_022EB458:
	ldr r0, [r8]
	cmp r0, #5
	bne _022EB4A8
	cmp sb, #1
	bne _022EB4A0
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, #0x50]
	cmp r0, #0
	beq _022EB4A8
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x48]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #0x4c]
	str r1, [r8, #0x48]
	str r0, [r8, #0x4c]
	mov r0, #1
	strb r0, [r8, #0x50]
	b _022EB828
_022EB4A0:
	mov r0, #1
	str r0, [r8]
_022EB4A8:
	ldr r0, [r8]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022EB560
_022EB4B8: ; jump table
	b _022EB560 ; case 0
	b _022EB560 ; case 1
	b _022EB4D4 ; case 2
	b _022EB4FC ; case 3
	b _022EB524 ; case 4
	b _022EB560 ; case 5
	b _022EB54C ; case 6
_022EB4D4:
	ldr r0, [r8, #4]
	add r1, r8, #0x28
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F90F4
	ldr r1, [sp, #0x18]
	cmp r0, r1
	moveq r0, #1
	streq r0, [r8]
	b _022EB560
_022EB4FC:
	ldr r0, [r8, #4]
	add r1, r8, #0x28
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FCCC4
	ldr r1, [sp, #0x1c]
	cmp r0, r1
	moveq r0, #1
	streq r0, [r8]
	b _022EB560
_022EB524:
	ldr r0, [r8, #4]
	add r1, r8, #0x28
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FE3B0
	ldr r1, [sp, #0x20]
	cmp r0, r1
	moveq r0, #1
	streq r0, [r8]
	b _022EB560
_022EB54C:
	add r0, r8, #0x28
	bl ov11_0230F25C
	cmp r0, #0
	moveq r0, #1
	streq r0, [r8]
_022EB560:
	ldr r0, [r8, #8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022EB6C4
_022EB570: ; jump table
	b _022EB6C4 ; case 0
	b _022EB584 ; case 1
	b _022EB5F4 ; case 2
	b _022EB650 ; case 3
	b _022EB670 ; case 4
_022EB584:
	str r7, [sp, #0x54]
	str r6, [sp, #0x58]
	ldr r2, [r8, #0x28]
	ldr r1, [r8, #0x18]
	add r0, sp, #0x54
	sub r1, r2, r1
	str r1, [sp, #0x54]
	ldr r2, [r8, #0x2c]
	ldr r1, [r8, #0x1c]
	sub r1, r2, r1
	str r1, [sp, #0x58]
	ldr r1, [r8, #0xc]
	bl ClampComponentAbs
	ldr r1, [sp, #0x54]
	cmp r1, #0
	ldreq r0, [sp, #0x58]
	cmpeq r0, #0
	moveq r0, #0
	streq r0, [r8, #8]
	beq _022EB6D4
	ldr r0, [r8, #0x18]
	add r0, r0, r1
	str r0, [r8, #0x18]
	ldr r1, [r8, #0x1c]
	ldr r0, [sp, #0x58]
	add r0, r1, r0
	str r0, [r8, #0x1c]
	b _022EB6D4
_022EB5F4:
	str r5, [sp, #0x4c]
	str sl, [sp, #0x50]
	ldr r2, [r8, #0x28]
	ldr r1, [r8, #0x18]
	add r0, sp, #0x4c
	sub r1, r2, r1
	str r1, [sp, #0x4c]
	ldr r2, [r8, #0x2c]
	ldr r1, [r8, #0x1c]
	sub r1, r2, r1
	str r1, [sp, #0x50]
	bl EuclideanNorm__020050B0
	str r0, [sp, #8]
	ldr r0, [r8, #0xc]
	bl IntToFloat
	mov r1, r0
	ldr r0, [sp, #8]
	bl DivideFloat
	bl FloatToInt
	str r0, [r8, #0x10]
	cmp r0, #0
	movle r0, #1
	strle r0, [r8, #0x10]
_022EB650:
	ldr r1, [r8, #0x18]
	ldr r0, [r8, #0x1c]
	str r1, [r8, #0x20]
	str r0, [r8, #0x24]
	mov r0, #0
	str r0, [r8, #0x14]
	mov r0, #4
	str r0, [r8, #8]
_022EB670:
	ldr r1, [r8, #0x10]
	add r0, sp, #0x44
	sub r1, r1, #1
	str r1, [r8, #0x10]
	ldr r2, [r8, #0x14]
	add r1, r8, #0x20
	add r2, r2, #1
	str r2, [r8, #0x14]
	str r2, [sp]
	ldr r3, [r8, #0x10]
	add r2, r8, #0x28
	bl sub_0200514C
	ldr r1, [sp, #0x44]
	ldr r0, [sp, #0x48]
	str r1, [r8, #0x18]
	str r0, [r8, #0x1c]
	ldr r0, [r8, #0x10]
	cmp r0, #0
	movle r0, #0
	strle r0, [r8, #8]
	b _022EB6D4
_022EB6C4:
	ldr r1, [r8, #0x28]
	ldr r0, [r8, #0x2c]
	str r1, [r8, #0x18]
	str r0, [r8, #0x1c]
_022EB6D4:
	ldr r0, [r8, #0x30]
	cmp r0, #1
	beq _022EB6EC
	cmp r0, #2
	beq _022EB734
	b _022EB79C
_022EB6EC:
	ldr r0, [r8, #0x3c]
	sub r0, r0, #1
	str r0, [r8, #0x3c]
	cmp r0, #0
	bgt _022EB7A8
	mov r0, #4
	str r0, [r8, #0x3c]
	mov r0, r4
	mov r1, #2
	bl RandRange
	mov r0, r0, lsl #0xa
	str r0, [r8, #0x40]
	mov r0, r4
	mov r1, #2
	bl RandRange
	mov r0, r0, lsl #0xa
	str r0, [r8, #0x44]
	b _022EB7A8
_022EB734:
	ldr r0, [r8, #0x3c]
	sub r0, r0, #1
	str r0, [r8, #0x3c]
	cmp r0, #0
	bgt _022EB7A8
	ldr r1, [r8, #0x38]
	mov r0, r4
	str r1, [r8, #0x3c]
	mov r1, #2
	bl RandRange
	ldr r2, [r8, #0x34]
	mov r1, #2
	mul r0, r2, r0
	mov r0, r0, lsl #8
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r8, #0x40]
	mov r0, r4
	bl RandRange
	ldr r1, [r8, #0x34]
	mul r0, r1, r0
	mov r0, r0, lsl #8
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r8, #0x44]
	b _022EB7A8
_022EB79C:
	mov r0, #0
	str r0, [r8, #0x40]
	str r0, [r8, #0x44]
_022EB7A8:
	ldr r0, [sp, #4]
	str fp, [sp, #0x3c]
	str r0, [sp, #0x40]
	ldr r2, [r8, #0x18]
	ldr r1, [r8, #0x40]
	mov r0, sb
	add r1, r2, r1
	sub r1, r1, #0x80
	str r1, [sp, #0x3c]
	ldr r3, [r8, #0x1c]
	ldr r2, [r8, #0x44]
	add r1, sp, #0x3c
	add r2, r3, r2
	sub r2, r2, #0xb80
	str r2, [sp, #0x40]
	bl ov11_022EB2F4
	cmp r0, #0
	beq _022EB828
	ldr r0, [sp, #0x3c]
	sub r1, r0, #0x8000
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	str r0, [r8, #0x48]
	ldr r0, [sp, #0x40]
	sub r1, r0, #0x6000
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	str r0, [r8, #0x4c]
	mov r0, #1
	strb r0, [r8, #0x50]
_022EB828:
	add sb, sb, #1
	cmp sb, #2
	add r8, r8, #0x54
	blt _022EB458
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EB840: .word 0x02320BBC
_022EB844: .word 0x023891F8
	arm_func_end ov11_022EB3F0

	arm_func_start ov11_022EB848
ov11_022EB848: ; 0x022EB848
	stmdb sp!, {r3, lr}
	mov r0, #0xe8
	mov r1, #6
	bl MemAlloc
	ldr r1, _022EB97C ; =0x02324CBC
	mov r2, #6
	str r0, [r1]
	str r2, [sp]
	ldr r0, [r1]
	ldr r2, _022EB980 ; =0x04000018
	ldr r3, _022EB984 ; =0x0600E000
	mov r1, #1
	bl sub_0200B2C4
	mov r1, #6
	ldr r0, _022EB97C ; =0x02324CBC
	str r1, [sp]
	ldr r0, [r0]
	ldr r2, _022EB988 ; =0x0400001C
	ldr r3, _022EB98C ; =0x0600F000
	add r0, r0, #0x1c
	mov r1, #1
	bl sub_0200B2C4
	mov r1, #6
	ldr r0, _022EB97C ; =0x02324CBC
	str r1, [sp]
	ldr r0, [r0]
	mov r1, #0
	add r0, r0, #0x70
	mov r2, #0x100
	mov r3, #0x5000000
	bl sub_0200A124
	ldr r0, _022EB97C ; =0x02324CBC
	mov r1, #6
	ldr r3, [r0]
	mov r2, #0
	str r1, [sp]
	add r0, r3, #0x98
	add r1, r3, #0x70
	mov r3, #0x100
	bl sub_0200A478
	mov r0, #6
	str r0, [sp]
	ldr r0, _022EB97C ; =0x02324CBC
	mov r1, #1
	ldr r0, [r0]
	ldr r2, _022EB990 ; =0x04001018
	add r0, r0, #0x38
	ldr r3, _022EB994 ; =0x0620E000
	bl sub_0200B2C4
	mov r0, #6
	str r0, [sp]
	ldr r0, _022EB97C ; =0x02324CBC
	mov r1, #1
	ldr r0, [r0]
	ldr r2, _022EB998 ; =0x0400101C
	add r0, r0, #0x54
	ldr r3, _022EB99C ; =0x0620F000
	bl sub_0200B2C4
	mov r0, #6
	str r0, [sp]
	ldr r0, _022EB97C ; =0x02324CBC
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x84
	ldr r3, _022EB9A0 ; =0x05000400
	bl sub_0200A124
	ldr r0, _022EB97C ; =0x02324CBC
	mov r1, #6
	ldr r3, [r0]
	mov r2, #0
	str r1, [sp]
	add r0, r3, #0xc0
	add r1, r3, #0x84
	mov r3, #0x100
	bl sub_0200A478
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB97C: .word 0x02324CBC
_022EB980: .word 0x04000018
_022EB984: .word 0x0600E000
_022EB988: .word 0x0400001C
_022EB98C: .word 0x0600F000
_022EB990: .word 0x04001018
_022EB994: .word 0x0620E000
_022EB998: .word 0x0400101C
_022EB99C: .word 0x0620F000
_022EB9A0: .word 0x05000400
	arm_func_end ov11_022EB848

	arm_func_start ov11_022EB9A4
ov11_022EB9A4: ; 0x022EB9A4
	stmdb sp!, {r3, lr}
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl sub_0200A4C4
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A158
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	bl sub_0200B314
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B314
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl sub_0200A4C4
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A158
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B314
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B314
	ldr r0, _022EBA40 ; =0x02324CBC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022EBA40 ; =0x02324CBC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBA40: .word 0x02324CBC
	arm_func_end ov11_022EB9A4

	arm_func_start ov11_022EBA44
ov11_022EBA44: ; 0x022EBA44
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov10_022BDB54
	ldr r1, _022EBA94 ; =0x02324CBC
	ldr r0, _022EBA98 ; =0x06010000
	ldr r1, [r1]
	mov r3, #0
	add r2, r1, #0x98
	bl ov10_022BDB60
	ldr r1, _022EBA94 ; =0x02324CBC
	ldr r0, _022EBA9C ; =0x06210000
	ldr r2, [r1]
	mov r3, #1
	add r1, r2, #0x38
	add r2, r2, #0xc0
	bl ov10_022BDB60
	mov r0, #0x10000
	mov r1, #0xa
	bl ov10_022BDBA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBA94: .word 0x02324CBC
_022EBA98: .word 0x06010000
_022EBA9C: .word 0x06210000
	arm_func_end ov11_022EBA44

	arm_func_start ov11_022EBAA0
ov11_022EBAA0: ; 0x022EBAA0
	ldr r3, _022EBAE4 ; =0x02324CBC
	ldr ip, [r3]
	cmp ip, #0
	moveq r3, #0
	streq r3, [r0]
	streq r3, [r1]
	streq r3, [r2]
	bxeq lr
	add ip, ip, #0x38
	str ip, [r0]
	ldr r0, [r3]
	add r0, r0, #0x54
	str r0, [r1]
	ldr r0, [r3]
	add r0, r0, #0xc0
	str r0, [r2]
	bx lr
	.align 2, 0
_022EBAE4: .word 0x02324CBC
	arm_func_end ov11_022EBAA0

	arm_func_start ov11_022EBAE8
ov11_022EBAE8: ; 0x022EBAE8
	stmdb sp!, {r3, lr}
	ldr r0, _022EBB10 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl ov11_022E9A78
	ldr r0, _022EBB10 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl ov11_022E9A90
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBB10: .word 0x02324CBC
	arm_func_end ov11_022EBAE8

	arm_func_start ov11_022EBB14
ov11_022EBB14: ; 0x022EBB14
	stmdb sp!, {r3, lr}
	ldr r0, _022EBB3C ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl ov11_022E9AA8
	ldr r0, _022EBB3C ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl ov11_022E9AC0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBB3C: .word 0x02324CBC
	arm_func_end ov11_022EBB14

	arm_func_start ov11_022EBB40
ov11_022EBB40: ; 0x022EBB40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	mov sl, r0
	mov r4, r1
	bl DataTransferInit
	add r0, sp, #0
	bl FileInitVeneer
	ldr r1, _022EBC14 ; =0x02320C44
	add r0, sp, #0
	bl FileOpen
	mov r0, #0x58
	mul r1, r4, r0
	add r0, sp, #0
	mov r2, #0
	bl FileSeek
	add r0, sp, #0
	mov r1, sl
	mov r2, #8
	bl FileRead
	mov r0, #0
	strb r0, [sl, #8]
	add r0, sp, #0
	add r1, sl, #0xa
	mov r2, #8
	bl FileRead
	mov r0, #0
	strb r0, [sl, #0x12]
	add r0, sp, #0
	add r1, sl, #0x14
	mov r2, #8
	bl FileRead
	mov r8, #0
	strb r8, [sl, #0x1c]
	add r6, sl, #0x1e
	add r7, sp, #0
	mov fp, #8
	mov r5, r8
	mov r4, #0xa
_022EBBD8:
	mul sb, r8, r4
	mov r0, r7
	mov r2, fp
	add r1, r6, sb
	bl FileRead
	add r0, sl, sb
	add r8, r8, #1
	strb r5, [r0, #0x26]
	cmp r8, #8
	blt _022EBBD8
	add r0, sp, #0
	bl FileClose
	bl DataTransferStop
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EBC14: .word 0x02320C44
	arm_func_end ov11_022EBB40

	arm_func_start ov11_022EBC18
ov11_022EBC18: ; 0x022EBC18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov r5, r1
	add r4, sl, #0x2bc
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	ldrb r0, [sl, #0x2bc]
	add r4, sl, #0x200
	mov r6, #0
	cmp r0, #0
	moveq sb, #6
	movne sb, #0xf
	ldrsh r7, [r4, #0xbe]
	mov r5, r6
	mov r8, #0x12
	b _022EBC9C
_022EBC64:
	add r0, sl, r6, lsl #1
	add r0, r0, #0x200
	ldrsh r1, [r0, #0xca]
	cmp r1, #0
	addle r0, sl, r6, lsl #2
	strle r5, [r0, #0x2dc]
	ble _022EBC94
	mul r0, r1, r8
	mov r1, sb
	bl MemAlloc
	add r1, sl, r6, lsl #2
	str r0, [r1, #0x2dc]
_022EBC94:
	add r6, r6, #1
	add r7, r7, #1
_022EBC9C:
	ldrsh r0, [r4, #0xc0]
	cmp r6, r0
	blt _022EBC64
	mov r1, #0
	b _022EBCC0
_022EBCB0:
	add r0, sl, r6, lsl #2
	str r1, [r0, #0x2dc]
	add r6, r6, #1
	add r7, r7, #1
_022EBCC0:
	cmp r6, #2
	blt _022EBCB0
	add r4, sl, #0x200
	mov r7, #0
	ldrsh r8, [r4, #0xbe]
	mov r6, r7
	ldr r5, _022EBEA4 ; =0x02324CBC
	mov fp, #0x1c
	b _022EBD54
_022EBCE4:
	ldrb r0, [sl, #0x2bc]
	cmp r0, #0
	ldr r0, [r5]
	bne _022EBD00
	mla r0, r8, fp, r0
	bl sub_0200B500
	b _022EBD10
_022EBD00:
	add r1, r0, #0x38
	mov r0, #0x1c
	mla r0, r8, r0, r1
	bl sub_0200B500
_022EBD10:
	add r1, sl, r7, lsl #2
	str r0, [r1, #0x2ec]
	add r0, sl, r7, lsl #1
	add r0, r0, #0x200
	ldrsh r0, [r0, #0xca]
	cmp r0, #0
	addle r0, sl, r7, lsl #2
	strle r6, [r0, #0x2e4]
	ble _022EBD4C
	ldrsh r0, [r4, #0xd0]
	mov r1, sb
	mov r0, r0, lsl #7
	bl MemAlloc
	add r1, sl, r7, lsl #2
	str r0, [r1, #0x2e4]
_022EBD4C:
	add r7, r7, #1
	add r8, r8, #1
_022EBD54:
	ldrsh r0, [r4, #0xc0]
	cmp r7, r0
	blt _022EBCE4
	mov r1, #0
	b _022EBD78
_022EBD68:
	add r0, sl, r7, lsl #2
	str r1, [r0, #0x2ec]
	str r1, [r0, #0x2e4]
	add r7, r7, #1
_022EBD78:
	cmp r7, #2
	blt _022EBD68
	ldr r0, [sl, #0x2d4]
	cmp r0, #0
	moveq r0, #0
	beq _022EBDA4
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xce]
	mov r1, sb
	mov r0, r0, lsl #8
	bl MemAlloc
_022EBDA4:
	str r0, [sl, #0x2d8]
	mov r0, sl
	bl ov11_022EBF60
	mov r2, #0
	strh r2, [sl]
	strb r2, [sl, #0x1c0]
	strb r2, [sl, #0x2ba]
	sub r1, r2, #1
	add r0, sl, #0x100
	strh r1, [r0, #0xbe]
	str r2, [sl, #0x1f0]
	strb r2, [sl, #0x1e0]
	strb r2, [sl, #0x1e1]
	strb r2, [sl, #0x1e2]
	strb r2, [sl, #0x1e3]
	strb r2, [sl, #0x1ee]
	str r2, [sl, #0x1f4]
	strb r2, [sl, #0x1f8]
	strb r2, [sl, #0x1f9]
	strb r2, [sl, #0x1fa]
	strb r2, [sl, #0x1fb]
	strb r2, [sl, #0x1bc]
	add r0, sl, #4
	mov r3, r2
_022EBE04:
	strh r3, [r0]
	strh r3, [r0, #2]
	add r2, r2, #1
	str r3, [r0, #8]
	str r3, [r0, #4]
	cmp r2, #0x10
	add r0, r0, #0xc
	blt _022EBE04
	add r2, sl, #0xc4
	mov r4, #0
	mov r0, #0x2c
_022EBE30:
	mul r1, r3, r0
	strb r4, [r2, r1]
	add r1, r2, r1
	strb r4, [r1, #1]
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	str r4, [r1, #0x10]
	str r4, [r1, #0x18]
	str r4, [r1, #0x14]
	str r4, [r1, #0x20]
	str r4, [r1, #0x1c]
	add r3, r3, #1
	str r4, [r1, #0x24]
	str r4, [r1, #0x28]
	cmp r3, #4
	blt _022EBE30
	ldr r0, _022EBEA8 ; =0x02320BE4
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	str r2, [sp]
	str r1, [sp, #4]
_022EBE84:
	add r0, sl, r4, lsl #3
	str r2, [r0, #0x200]
	add r4, r4, #1
	str r1, [r0, #0x204]
	cmp r4, #2
	blt _022EBE84
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EBEA4: .word 0x02324CBC
_022EBEA8: .word 0x02320BE4
	arm_func_end ov11_022EBC18

	arm_func_start ov11_022EBEAC
ov11_022EBEAC: ; 0x022EBEAC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	bl ov11_022EBFC8
	ldr r0, [r8, #0x2d8]
	cmp r0, #0
	beq _022EBED0
	bl MemFree
	mov r0, #0
	str r0, [r8, #0x2d8]
_022EBED0:
	mov r7, #0
	mov r6, r7
	mov r5, r7
	mov r4, r7
_022EBEE0:
	add r0, r8, r7, lsl #2
	ldr r0, [r0, #0x2dc]
	cmp r0, #0
	beq _022EBF10
	add r1, r8, r7, lsl #1
	add r1, r1, #0x200
	ldrsh r1, [r1, #0xca]
	cmp r1, #0
	ble _022EBF08
	bl MemFree
_022EBF08:
	add r0, r8, r7, lsl #2
	str r6, [r0, #0x2dc]
_022EBF10:
	add r1, r8, r7, lsl #2
	ldr r0, [r1, #0x2ec]
	cmp r0, #0
	strne r5, [r1, #0x2ec]
	add r0, r8, r7, lsl #2
	ldr r0, [r0, #0x2e4]
	cmp r0, #0
	beq _022EBF50
	add r1, r8, r7, lsl #1
	add r1, r1, #0x200
	ldrsh r1, [r1, #0xca]
	cmp r1, #0
	ble _022EBF48
	bl MemFree
_022EBF48:
	add r0, r8, r7, lsl #2
	str r4, [r0, #0x2e4]
_022EBF50:
	add r7, r7, #1
	cmp r7, #2
	blt _022EBEE0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov11_022EBEAC

	arm_func_start ov11_022EBF60
ov11_022EBF60: ; 0x022EBF60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #0
	add r5, r7, #0xc4
	mov r4, #0x2c
_022EBF74:
	mla r0, r6, r4, r5
	add r0, r0, #8
	bl ZInit8
	add r6, r6, #1
	cmp r6, #4
	blt _022EBF74
	add r0, r7, #0x1a0
	bl sub_02063600
	add r0, r7, #0x194
	bl sub_020635C8
	mov r1, #0
	add r0, r7, #0x174
	strb r1, [r7, #0x1bc]
	bl ZInit8
	add r0, r7, #0x17c
	bl ZInit8
	add r0, r7, #0x184
	bl ZInit8
	add r0, r7, #0x18c
	bl ZInit8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022EBF60

	arm_func_start ov11_022EBFC8
ov11_022EBFC8: ; 0x022EBFC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldrsh r1, [r8]
	cmp r1, #3
	bne _022EBFE4
	bl ov11_022EBF60
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022EBFE4:
	mov r6, #0
	add r5, r8, #0xc4
	mov r4, #0x2c
_022EBFF0:
	mla r7, r6, r4, r5
	add r0, r7, #8
	bl PointsToZero
	cmp r0, #0
	bne _022EC00C
	add r0, r7, #8
	bl UnloadFile
_022EC00C:
	add r6, r6, #1
	cmp r6, #4
	blt _022EBFF0
	add r0, r8, #0x1a0
	bl sub_0206367C
	add r0, r8, #0x194
	bl sub_020635D8
	add r0, r8, #0x174
	bl PointsToZero
	cmp r0, #0
	bne _022EC040
	add r0, r8, #0x174
	bl UnloadFile
_022EC040:
	add r0, r8, #0x17c
	bl PointsToZero
	cmp r0, #0
	bne _022EC058
	add r0, r8, #0x17c
	bl UnloadFile
_022EC058:
	add r0, r8, #0x184
	bl PointsToZero
	cmp r0, #0
	bne _022EC070
	add r0, r8, #0x184
	bl UnloadFile
_022EC070:
	add r0, r8, #0x18c
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, #0x18c
	bl UnloadFile
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov11_022EBFC8

	arm_func_start ov11_022EC08C
ov11_022EC08C: ; 0x022EC08C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl ov11_022EBFC8
	mov r2, #0
	strh r2, [sl]
	strb r2, [sl, #0x1c0]
	sub r1, r2, #1
	add r0, sl, #0x100
	strh r1, [r0, #0xbe]
	add r0, sl, #0x200
	strh r2, [r0, #0xb8]
	strb r2, [sl, #0x1e0]
	strb r2, [sl, #0x1e1]
	strb r2, [sl, #0x1e2]
	strb r2, [sl, #0x1e3]
	strb r2, [sl, #0x1ee]
	str r2, [sl, #0x1f4]
	strb r2, [sl, #0x1f8]
	strb r2, [sl, #0x1f9]
	strb r2, [sl, #0x1fa]
	strb r2, [sl, #0x1fb]
	strb r2, [sl, #0x1bc]
	add r0, sl, #4
	mov r5, r2
_022EC0EC:
	strh r5, [r0]
	strh r5, [r0, #2]
	add r2, r2, #1
	str r5, [r0, #8]
	str r5, [r0, #4]
	cmp r2, #0x10
	add r0, r0, #0xc
	blt _022EC0EC
	mov sb, #0
	add r4, sl, #0xc4
	mov r8, sb
	mov r7, #0x2c
_022EC11C:
	mul r0, r5, r7
	add r6, r4, r0
	strb sb, [r4, r0]
	strb sb, [r6, #1]
	strh sb, [r6, #2]
	strh sb, [r6, #4]
	add r0, r6, #8
	bl ZInit8
	str r8, [r6, #0x10]
	str r8, [r6, #0x18]
	str r8, [r6, #0x14]
	str r8, [r6, #0x20]
	str r8, [r6, #0x1c]
	add r5, r5, #1
	str r8, [r6, #0x24]
	str r8, [r6, #0x28]
	cmp r5, #4
	blt _022EC11C
	add r4, sl, #0x200
	ldrsh r1, [r4, #0xc2]
	ldr r0, _022EC234 ; =0x02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov r1, r1, lsl #0x14
	mov r0, #0x28
	add r6, r3, #0x98
	smulbb r5, r2, r0
	mov r7, r1, lsr #0x10
	ldr fp, _022EC238 ; =0x02320BF4
	b _022EC1E0
_022EC194:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	mov r2, fp
	add r0, r6, r5
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	mov sb, #1
_022EC1B4:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022EC23C ; =0x02320BE8
	add r0, r6, r5
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	blt _022EC1B4
	add r8, r8, #1
_022EC1E0:
	ldrsh r0, [r4, #0xc4]
	cmp r8, r0
	blt _022EC194
	add r0, r6, r5
	bl sub_0200A504
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r0, #0
	mov r0, sl
	ble _022EC214
	mov r1, #1
	bl ov11_022EE620
	b _022EC21C
_022EC214:
	mov r1, #0
	bl ov11_022EE620
_022EC21C:
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r0, #1
	strb r0, [sl, #0x2ba]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC234: .word 0x02324CBC
_022EC238: .word 0x02320BF4
_022EC23C: .word 0x02320BE8
	arm_func_end ov11_022EC08C

	arm_func_start ov11_022EC240
ov11_022EC240: ; 0x022EC240
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x70
	mov r5, r0
	mov r4, r1
	bl ov11_022EC08C
	mvn r0, #0
	cmp r4, r0
	beq _022EC274
	add r0, r5, #0x100
	strh r4, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0
	bl ov11_022EBB40
_022EC274:
	add sp, sp, #0x70
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022EC240

	arm_func_start ov11_022EC27C
ov11_022EC27C: ; 0x022EC27C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x13c
	mov sl, r0
	ldrb r0, [sl, #0x2bc]
	mov r4, r1
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp]
	movne r0, #0xf
	strne r0, [sp]
	mvn r0, #0
	cmp r4, r0
	mov r0, sl
	bne _022EC2BC
	bl ov11_022EC08C
	b _022ECCF4
_022EC2BC:
	bl ov11_022EBFC8
	mov r0, #1
	strh r0, [sl]
	mov r0, #0
	strb r0, [sl, #0x1c0]
	add r0, sl, #0x100
	strh r4, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0xcc
	bl ov11_022EBB40
	ldr r1, _022ECCFC ; =0x02320C58
	add r0, sp, #0x4c
	add r2, sp, #0xcc
	bl Sprintf
	ldr r2, [sp]
	add r1, sp, #0x4c
	add r0, sl, #0x174
	bl LoadFileFromRom__02008C3C
	ldr r1, _022ECD00 ; =0x02320C6C
	add r0, sp, #0x4c
	add r2, sp, #0xd6
	bl Sprintf
	ldr r2, _022ECD04 ; =0x0000030F
	add r0, sl, #0x184
	add r1, sp, #0x4c
	bl LoadFileFromRom__02008C3C
	ldr r1, _022ECD08 ; =0x02320C80
	add r0, sp, #0x4c
	add r2, sp, #0xe0
	bl Sprintf
	ldr r2, _022ECD04 ; =0x0000030F
	add r0, sl, #0x18c
	add r1, sp, #0x4c
	bl LoadFileFromRom__02008C3C
	ldr r1, [sl, #0x184]
	ldr r0, [sl, #0x174]
	ldrh r2, [r1]
	str r0, [sp, #0x28]
	ldr r5, [sl, #0x18c]
	cmp r2, #0
	beq _022EC3A0
	ldrh r0, [r1, #2]
	mov r2, r2, lsr #1
	add r2, r1, r2, lsl #1
	cmp r0, #0
	str r2, [sp, #0x44]
	moveq r2, #0
	moveq r0, #1
	streq r2, [sp, #0x48]
	streq r0, [sl, #0x1c4]
	beq _022EC3B0
	mov r0, r0, lsr #1
	add r2, r1, r0, lsl #1
	mov r0, #2
	str r2, [sp, #0x48]
	str r0, [sl, #0x1c4]
	b _022EC3B0
_022EC3A0:
	mov r0, #0
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sl, #0x1c4]
_022EC3B0:
	ldr r0, [sp, #0x28]
	add r2, sl, #0xea
	ldrb r3, [r0]
	add r0, sl, #0x100
	add r1, r1, #4
	strh r3, [r0, #0xea]
	ldr r0, [sp, #0x28]
	ldrb r3, [r0, #2]
	add r0, r2, #0x100
	str r0, [sp, #0x40]
	strh r3, [r0, #2]
	mov r0, #0
_022EC3E0:
	add r4, sl, #0x1c8
	mov r2, #0xc
	add r3, sp, #0x44
	ldr r3, [r3, r0, lsl #2]
	mla r4, r0, r2, r4
	cmp r3, #0
	mov r6, #0
	beq _022EC42C
	ldrh r2, [r1], #2
	strh r2, [r4]
_022EC408:
	ldrh r3, [r1], #2
	add r2, r4, r6, lsl #1
	add r6, r6, #1
	strh r3, [r2, #2]
	cmp r6, #4
	blt _022EC408
	ldrh r2, [r1], #2
	strh r2, [r4, #0xa]
	b _022EC44C
_022EC42C:
	strh r6, [r4]
	mov r3, r6
_022EC434:
	add r2, r4, r6, lsl #1
	add r6, r6, #1
	strh r3, [r2, #2]
	cmp r6, #4
	blt _022EC434
	strh r3, [r4, #0xa]
_022EC44C:
	add r0, r0, #1
	cmp r0, #2
	blt _022EC3E0
	ldrb r1, [r5]
	add r0, sl, #0x200
	str r0, [sp, #0x34]
	strb r1, [sl, #0x1e0]
	ldrb r0, [r5, #1]
	add r4, sl, #0x1e0
	ldr r2, _022ECD0C ; =0x02324CBC
	strb r0, [r4, #1]
	ldrb r3, [r5, #4]
	ldr r0, [sp, #0x28]
	mov r1, #0x28
	add r0, r0, #4
	strb r3, [r4, #2]
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #5]
	mov sb, #0
	strb r0, [r4, #3]
	ldrb r0, [r5, #6]
	strh r0, [r4, #4]
	ldrb r0, [r5, #8]
	strh r0, [r4, #6]
	ldrb r0, [r5, #0xa]
	strh r0, [r4, #8]
	ldr r0, [sp, #0x34]
	ldrb r3, [sl, #0x2bc]
	ldrsh r0, [r0, #0xc2]
	ldr r2, [r2]
	smulbb r6, r3, r1
	mov r0, r0, lsl #0x14
	add r7, r2, #0x98
	mov r8, r0, lsr #0x10
	b _022EC524
_022EC4D8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, _022ECD10 ; =0x02320BF4
	add r0, r7, r6
	bl sub_0200A590
	ldr r2, [sp, #0x1c]
	add r0, r7, r6
	mov r1, r8
	mov r3, #0xf
	bl sub_0200A5B0
	add r0, r8, #0xf
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	ldr r0, [sp, #0x1c]
	add sb, sb, #1
	add r0, r0, #0x3c
	str r0, [sp, #0x1c]
_022EC524:
	ldr r0, [sp, #0x40]
	ldrsh r0, [r0]
	cmp sb, r0
	bge _022EC544
	ldr r0, [sp, #0x34]
	ldrsh r0, [r0, #0xc4]
	cmp sb, r0
	blt _022EC4D8
_022EC544:
	add r0, sl, #0x200
	str r0, [sp, #0x38]
	b _022EC5A8
_022EC550:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, _022ECD10 ; =0x02320BF4
	add r0, r7, r6
	bl sub_0200A590
	mov r0, #1
	str r0, [sp, #0x18]
_022EC574:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r8
	mov r8, r0, lsr #0x10
	ldr r2, _022ECD14 ; =0x02320BE8
	add r0, r7, r6
	bl sub_0200A590
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0x10
	blt _022EC574
	add sb, sb, #1
_022EC5A8:
	ldr r0, [sp, #0x38]
	ldrsh r0, [r0, #0xc4]
	cmp sb, r0
	blt _022EC550
	add r0, r7, r6
	bl sub_0200A504
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xbe]
	mov r8, #0
	str r0, [sp, #0x20]
	b _022EC9A0
_022EC5D4:
	add r0, sp, #0x44
	ldr r0, [r0, r8, lsl #2]
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _022EC990
	mov r0, #0xc
	mul r1, r8, r0
	add r0, sl, #0x200
	ldrsh r2, [r0, #0xc6]
	add r6, sl, #0x1c8
	add sb, r6, r1
	ldrsh r1, [r6, r1]
	ldrb r3, [sl, #0x2bc]
	ldr r0, _022ECD18 ; =0x02320C18
	mov r7, #0
	add r3, r0, r3, lsl #3
	ldr r0, [sp, #0x20]
	ldr r6, [sp, #0x24]
	ldr r0, [r3, r0, lsl #2]
	str r7, [sp, #0x14]
	add fp, r0, r2, lsl #5
	add r0, fp, r1, lsl #5
	str r0, [sp, #0x10]
	mov r3, r7
	mov r2, r7
	mov r1, r7
	mov r0, r7
_022EC640:
	strh r0, [fp], #2
	add r1, r1, #1
	cmp r1, #0x10
	blt _022EC640
	b _022EC774
_022EC654:
	ldrb r0, [r6]
	add r1, r6, #1
	mov r6, r1
	cmp r0, #0x80
	bge _022EC6D8
	cmp r0, #0x7f
	ldreqb ip, [r1, #1]
	ldreqb r0, [r1]
	addeq r6, r1, #2
	orreq r0, r0, ip, lsl #8
	beq _022EC68C
	cmp r0, #0x7e
	ldreqb r0, [r1]
	addeq r6, r1, #1
_022EC68C:
	cmp r3, #0
	ldrneb r1, [r6], #1
	movne r3, #0
	subne r0, r0, #1
	orrne r1, r2, r1, lsl #8
	strneh r1, [fp], #2
	mov r1, #0
	b _022EC6C4
_022EC6AC:
	ldrb lr, [r6, #1]
	ldrb ip, [r6], #2
	add r1, r1, #2
	str ip, [sp, #0x2c]
	orr ip, ip, lr, lsl #8
	strh ip, [fp], #2
_022EC6C4:
	cmp r1, r0
	blt _022EC6AC
	movle r3, #1
	ldrleb r2, [r6], #1
	b _022EC774
_022EC6D8:
	cmp r0, #0xc0
	bge _022EC6FC
	cmp r0, #0xbf
	ldreqb r0, [r1]
	addeq r6, r1, #1
	str r7, [sp, #0x14]
	subne r0, r0, #0x80
	ldrb r7, [r6], #1
	b _022EC734
_022EC6FC:
	cmp r0, #0xe0
	bge _022EC718
	cmp r0, #0xdf
	ldreqb r0, [r1]
	addeq r6, r1, #1
	subne r0, r0, #0xc0
	b _022EC734
_022EC718:
	cmp r0, #0xff
	ldreqb r0, [r1]
	addeq r6, r1, #1
	ldr r1, [sp, #0x14]
	subne r0, r0, #0xe0
	str r7, [sp, #0x14]
	mov r7, r1
_022EC734:
	cmp r3, #0
	orrne r1, r2, r7, lsl #8
	strneh r1, [fp], #2
	orr r1, r7, r7, lsl #8
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	movne r3, #0
	subne r0, r0, #1
	mov r1, #0
	b _022EC764
_022EC75C:
	strh r2, [fp], #2
	add r1, r1, #2
_022EC764:
	cmp r1, r0
	blt _022EC75C
	movle r3, #1
	movle r2, r7
_022EC774:
	ldr r0, [sp, #0x10]
	cmp fp, r0
	blo _022EC654
	ldr r0, [sp, #0x24]
	ldrsh r7, [sb]
	sub r0, r6, r0
	tst r0, #1
	addne r6, r6, #1
	add r0, sl, #0x200
	ldr r2, _022ECD1C ; =0x0000FFFF
	mov r3, #0
	b _022EC7BC
_022EC7A4:
	mov r1, r3
_022EC7A8:
	strh r2, [fp], #2
	add r1, r1, #1
	cmp r1, #0x10
	blt _022EC7A8
	add r7, r7, #1
_022EC7BC:
	ldrsh r1, [r0, #0xc8]
	cmp r7, r1
	blt _022EC7A4
	add r0, sl, #0x200
	add r1, sl, r8, lsl #2
	ldr ip, [r1, #0x2dc]
	ldrsh r7, [r0, #0xc2]
	ldrsh r2, [r0, #0xc6]
	mov r1, #1
	mov r3, ip
	strh r1, [r0, #0xb8]
	orr r0, r2, r7, lsl #12
	mov r0, r0, lsl #0x10
	ldrsh r1, [sb, #0xa]
	str r0, [sp, #0x3c]
	sub r0, r1, #1
	add r0, r0, r0, lsl #3
	add r7, ip, r0, lsl #1
	mov r0, #0
	b _022EC890
_022EC80C:
	ldrb r1, [r6]
	add r2, r6, #1
	mov r6, r2
	cmp r1, #0xc0
	blt _022EC844
	mov r2, #0xc0
	b _022EC838
_022EC828:
	ldrb fp, [r6], #1
	add r2, r2, #1
	mov fp, fp, lsl #8
	strh fp, [r3], #2
_022EC838:
	cmp r2, r1
	ble _022EC828
	b _022EC890
_022EC844:
	cmp r1, #0x80
	blt _022EC878
	ldrb fp, [r2]
	add r6, r2, #1
	mov r2, #0x80
	mov fp, fp, lsl #0x18
	mov fp, fp, lsr #0x10
	b _022EC86C
_022EC864:
	strh fp, [r3], #2
	add r2, r2, #1
_022EC86C:
	cmp r2, r1
	ble _022EC864
	b _022EC890
_022EC878:
	mov r2, #0
	b _022EC888
_022EC880:
	strh r0, [r3], #2
	add r2, r2, #1
_022EC888:
	cmp r2, r1
	ble _022EC880
_022EC890:
	cmp r3, r7
	blo _022EC80C
	mov r3, ip
	b _022EC928
_022EC8A0:
	ldrb r2, [r6]
	add r0, r6, #1
	mov r6, r0
	cmp r2, #0xc0
	blt _022EC8E4
	mov r0, #0xc0
	b _022EC8D8
_022EC8BC:
	str r3, [sp, #0xc]
	ldrh fp, [r3], #2
	ldrb r1, [r6], #1
	add r0, r0, #1
	orr fp, fp, r1
	ldr r1, [sp, #0xc]
	strh fp, [r1]
_022EC8D8:
	cmp r0, r2
	ble _022EC8BC
	b _022EC928
_022EC8E4:
	cmp r2, #0x80
	blt _022EC920
	add r6, r0, #1
	ldrb lr, [r0]
	mov fp, #0x80
	b _022EC914
_022EC8FC:
	str r3, [sp, #8]
	ldrh r0, [r3], #2
	add fp, fp, #1
	orr r1, r0, lr
	ldr r0, [sp, #8]
	strh r1, [r0]
_022EC914:
	cmp fp, r2
	ble _022EC8FC
	b _022EC928
_022EC920:
	add r0, r2, #1
	add r3, r3, r0, lsl #1
_022EC928:
	cmp r3, r7
	blo _022EC8A0
	ldrsh r0, [sb, #0xa]
	mov r3, #1
	add r0, r0, r0, lsl #3
	add r1, ip, r0, lsl #1
	mov r0, #0
	b _022EC96C
_022EC948:
	mov r2, r0
_022EC94C:
	ldrh fp, [r7, #-2]!
	ldr r6, [sp, #0x3c]
	add r2, r2, #1
	add r6, fp, r6, lsr #16
	cmp r2, #9
	strh r6, [r1, #-2]!
	blt _022EC94C
	add r3, r3, #1
_022EC96C:
	ldrsh r2, [sb, #0xa]
	cmp r3, r2
	blt _022EC948
	mov r1, #0
	mov r0, r1
_022EC980:
	add r1, r1, #1
	cmp r1, #9
	strh r0, [ip], #2
	blt _022EC980
_022EC990:
	ldr r0, [sp, #0x20]
	add r8, r8, #1
	add r0, r0, #1
	str r0, [sp, #0x20]
_022EC9A0:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r8, r0
	blt _022EC5D4
	add r0, sl, #0x2e4
	add r1, r5, #0xc
	add r2, sl, #0x2bc
	add r3, sl, #0x1e0
	bl ov11_022EE2D4
	mov r1, r0
	str r1, [sl, #0x1f0]
	ldr r0, [sl, #0x2d8]
	cmp r0, #0
	beq _022EC9EC
	add r2, sl, #0x200
	ldrsh r3, [r2, #0xce]
	ldr r5, [sl, #0x2d4]
	mov r2, r4
	blx r5
_022EC9EC:
	mov r1, #0
	ldr r0, [sp, #0x40]
	strb r1, [sl, #0x1ee]
	ldrsh r2, [r0, #2]
	add r0, sl, #4
	cmp r2, #0
	beq _022ECAA4
	ldr r2, [sp, #0x40]
	mov r3, #1
	ldrsh r5, [r2]
	ldr r2, [sp, #0x28]
	mov r7, r1
	add r4, r2, #4
	rsb r2, r5, r5, lsl #4
	add r2, r4, r2, lsl #2
	str r2, [sl, #0x1f4]
	strb r3, [sl, #0x1f8]
	strb r3, [sl, #0x1f9]
	strb r3, [sl, #0x1fa]
	strb r3, [sl, #0x1fb]
	add r3, r2, r5, lsl #2
	strb r1, [sl, #0x1bc]
	add r5, sl, #0x200
	mov r6, r1
	b _022ECA84
_022ECA50:
	ldrsh r4, [r2, #2]
	add r1, r1, #1
	cmp r4, #0
	strgt r3, [r0, #4]
	ldrgtsh r4, [r2, #2]
	add r2, r2, #4
	strle r7, [r0, #4]
	strh r6, [r0]
	rsbgt r4, r4, r4, lsl #4
	strh r6, [r0, #2]
	str r6, [r0, #8]
	addgt r3, r3, r4, lsl #2
	add r0, r0, #0xc
_022ECA84:
	ldr r4, [sp, #0x40]
	ldrsh r4, [r4]
	cmp r1, r4
	bge _022ECABC
	ldrsh r4, [r5, #0xc4]
	cmp r1, r4
	blt _022ECA50
	b _022ECABC
_022ECAA4:
	str r1, [sl, #0x1f4]
	strb r1, [sl, #0x1f8]
	strb r1, [sl, #0x1f9]
	strb r1, [sl, #0x1fa]
	strb r1, [sl, #0x1fb]
	strb r1, [sl, #0x1bc]
_022ECABC:
	mov r2, #0
	b _022ECADC
_022ECAC4:
	strh r2, [r0]
	strh r2, [r0, #2]
	str r2, [r0, #8]
	str r2, [r0, #4]
	add r1, r1, #1
	add r0, r0, #0xc
_022ECADC:
	cmp r1, #0x10
	blt _022ECAC4
	mov r7, #0
	add r4, sl, #0xc4
	mov sb, r7
	mov r5, r7
	mov r8, #0x2c
_022ECAF8:
	mul r0, r7, r8
	add r6, r4, r0
	strb sb, [r4, r0]
	strb sb, [r6, #1]
	strh sb, [r6, #4]
	strh sb, [r6, #2]
	add r0, r6, #8
	bl ZInit8
	str r5, [r6, #0x10]
	str r5, [r6, #0x18]
	str r5, [r6, #0x14]
	str r5, [r6, #0x20]
	str r5, [r6, #0x1c]
	add r7, r7, #1
	str r5, [r6, #0x24]
	str r5, [r6, #0x28]
	cmp r7, #4
	blt _022ECAF8
	add r0, sl, #0x200
	ldrsh r7, [r0, #0xbe]
	b _022ECC80
_022ECB4C:
	mov r0, #0xc
	mul r2, r5, r0
	add r0, sl, #0x200
	add r3, sl, #0x1c8
	ldrsh r1, [r0, #0xc6]
	ldrsh r0, [r3, r2]
	cmp r5, #0
	moveq r8, #0
	add r1, r1, r0
	add r0, r3, r2
	movne r8, #2
	cmp r5, #0
	moveq sb, #0
	str r0, [sp, #4]
	add r0, sl, #0xc4
	ldrb r6, [sl, #0x2bc]
	ldr r4, _022ECD18 ; =0x02320C18
	movne sb, #4
	add r4, r4, r6, lsl #3
	ldr r4, [r4, r7, lsl #2]
	mov r6, #0
	add fp, r4, r1, lsl #5
	str r0, [sp, #0x30]
_022ECBA8:
	ldr r0, [sp, #0x30]
	mov r1, #0x2c
	mla r4, r8, r1, r0
	mov r0, #0xa
	mul r0, sb, r0
	add r1, sp, #0xcc
	add r1, r1, r0
	ldrsb r1, [r1, #0x1e]
	cmp r1, #0
	beq _022ECC64
	ldrb r1, [sl, #0x2bc]
	cmp r1, #0
	bne _022ECC64
	add r1, sp, #0xea
	add r2, r1, r0
	ldr r1, _022ECD20 ; =0x02320C94
	add r0, sp, #0x4c
	bl Sprintf
	ldr r2, [sp]
	add r0, r4, #8
	add r1, sp, #0x4c
	bl LoadFileFromRom__02008C3C
	mov r0, #1
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r3, [r4, #8]
	ldr r0, [sp, #4]
	str r3, [r4, #0x10]
	add r1, r0, r6, lsl #1
	ldrsh r0, [r3, #2]
	add r2, r3, #4
	str r2, [r4, #0x18]
	add r0, r2, r0, lsl #2
	str r2, [r4, #0x14]
	str r0, [r4, #0x20]
	str r0, [r4, #0x1c]
	mov r0, #0
	strh r0, [r4, #2]
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #4]
	str fp, [r4, #0x24]
	ldrsh r0, [r1, #2]
	mov r0, r0, lsl #5
	str r0, [r4, #0x28]
	ldrsh r0, [r1, #2]
	add fp, fp, r0, lsl #5
_022ECC64:
	add r6, r6, #1
	cmp r6, #2
	add sb, sb, #1
	add r8, r8, #1
	blt _022ECBA8
	add r5, r5, #1
	add r7, r7, #1
_022ECC80:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r5, r0
	blt _022ECB4C
	cmp r0, #0
	mov r0, sl
	ble _022ECCA8
	mov r1, #1
	bl ov11_022EE620
	b _022ECCB0
_022ECCA8:
	mov r1, #0
	bl ov11_022EE620
_022ECCB0:
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r1, #1
	add r0, sl, #0x184
	strb r1, [sl, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ECCDC
	add r0, sl, #0x184
	bl UnloadFile
_022ECCDC:
	add r0, sl, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ECCF4
	add r0, sl, #0x18c
	bl UnloadFile
_022ECCF4:
	add sp, sp, #0x13c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ECCFC: .word 0x02320C58
_022ECD00: .word 0x02320C6C
_022ECD04: .word 0x0000030F
_022ECD08: .word 0x02320C80
_022ECD0C: .word 0x02324CBC
_022ECD10: .word 0x02320BF4
_022ECD14: .word 0x02320BE8
_022ECD18: .word 0x02320C18
_022ECD1C: .word 0x0000FFFF
_022ECD20: .word 0x02320C94
	arm_func_end ov11_022EC27C

	arm_func_start ov11_022ECD24
ov11_022ECD24: ; 0x022ECD24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x128
	mov r6, r1
	mvn r7, #0
	mov r5, r2
	cmp r6, r7
	ldrneb r2, [r5]
	mov sl, r0
	mov r4, r3
	cmpne r2, #0xff
	bne _022ECD5C
	mov r0, sl
	bl ov11_022EC08C
	b _022ED214
_022ECD5C:
	bl ov11_022EC27C
	mov r0, sl
	bl ov11_022EBFC8
	mov r0, #2
	strh r0, [sl]
	mov r0, #0
	strb r0, [sl, #0x1c0]
	add r0, sl, #0x100
	strh r6, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0xb8
	bl ov11_022EBB40
	ldr r1, _022ED21C ; =0x02320C58
	add r0, sp, #0x38
	add r2, sp, #0xb8
	bl Sprintf
	add r0, sl, #0x174
	add r1, sp, #0x38
	mov r2, #6
	bl LoadFileFromRom__02008C3C
	ldr r1, _022ED220 ; =0x02320C6C
	add r0, sp, #0x38
	add r2, sp, #0xc2
	bl Sprintf
	ldr r2, _022ED224 ; =0x0000030F
	add r0, sl, #0x184
	add r1, sp, #0x38
	bl LoadFileFromRom__02008C3C
	ldr r1, _022ED228 ; =0x02320C80
	add r0, sp, #0x38
	add r2, sp, #0xcc
	bl Sprintf
	add r0, sl, #0x18c
	add r1, sp, #0x38
	mov r2, #6
	bl LoadFileFromRom__02008C3C
	add r1, sl, #0xea
	ldr r0, [sl, #0x184]
	ldr sb, [sl, #0x174]
	add fp, r1, #0x100
	ldrb r1, [sb]
	ldr r6, [sl, #0x18c]
	add r3, sl, #0x100
	strh r1, [r3, #0xea]
	ldrb sb, [sb, #2]
	add r2, r0, #2
	add r8, sl, #0x1c8
	strh sb, [fp, #2]
	ldrsh r0, [r0]
	add r7, sl, #0x1e0
	mov r1, #0
	strh r0, [r3, #0xc8]
_022ECE2C:
	ldrh r3, [r2], #2
	add r0, r8, r1, lsl #1
	add r1, r1, #1
	strh r3, [r0, #2]
	cmp r1, #4
	blt _022ECE2C
	ldrh r1, [r2]
	ldr sb, _022ED22C ; =0x02320BE4
	add r0, sp, #0x24
	strh r1, [r8, #0xa]
	ldrb r3, [r6]
	add r1, r6, #0xc
	add r2, sl, #0x2bc
	strb r3, [r7]
	ldrb fp, [r6, #1]
	add r3, sl, #0x1e0
	strb fp, [r7, #1]
	ldrb fp, [r6, #4]
	strb fp, [r7, #2]
	ldrb fp, [r6, #5]
	strb fp, [r7, #3]
	ldrb fp, [r6, #6]
	strh fp, [r7, #4]
	ldrb fp, [r6, #8]
	strh fp, [r7, #6]
	ldrb r6, [r6, #0xa]
	strh r6, [r7, #8]
	ldr r6, [sb, #0x20]
	ldr sb, [sb, #0x1c]
	str r6, [sp, #0x28]
	str sb, [sp, #0x24]
	ldr r6, [sl, #0x2d8]
	str r6, [sp, #0x24]
	bl ov11_022EE2D4
	mov r6, r0
	str r6, [sl, #0x1f0]
	ldr r1, [sl, #0x2e4]
	mov r0, #0x40
	stmia sp, {r1, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r7, #3]
	ldr r2, _022ED230 ; =0x06018000
	add r0, sp, #0x2c
	str r1, [sp, #0x10]
	ldr r3, [sl, #0x2d8]
	add r1, sl, #0x194
	str r3, [sp, #0x14]
	ldr r3, [sl, #0x2dc]
	bl ov10_022C3938
	ldr r2, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r1, r6
	str r2, [sl, #0x17c]
	str r0, [sl, #0x180]
	ldr r2, [sp, #0x34]
	add r0, sl, #0x200
	str r2, [sl, #0x1b8]
	ldrsh r3, [r0, #0xce]
	ldr r0, [sl, #0x2d8]
	ldr r4, [sl, #0x2d4]
	mov r2, r7
	blx r4
	mov r0, #0x200
	mov r1, #0
	strh r0, [r8]
	mov r7, r1
_022ECF38:
	add r0, r8, r1, lsl #1
	add r1, r1, #1
	strh r7, [r0, #2]
	cmp r1, #4
	blt _022ECF38
	mov r0, #0x190
	strh r0, [r8, #0xa]
	add r0, sl, #0x100
	mov r1, #0xc
	strh r1, [r0, #0xea]
	strh r7, [r0, #0xec]
	ldr r6, [sl, #0x1b8]
	cmp r6, #0
	beq _022ED0E0
	ldr r0, _022ED234 ; =0x02324CBC
	ldrb r1, [sl, #0x2bc]
	ldr r5, [r0]
	mov r0, #0x28
	smulbb r4, r1, r0
	ldr r3, _022ED238 ; =0x02320BE4
	add r2, sp, #0x18
	mov r8, r7
	add r5, r5, #0x98
	mov r1, #4
_022ECF98:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ECF98
	b _022ED05C
_022ECFAC:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED23C ; =0x02320BF4
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add r6, r6, #4
	mov sb, #1
	add fp, sp, #0x20
_022ECFD4:
	add r3, sp, #0x18
	add r2, sp, #0x1c
	mov r1, #4
_022ECFE0:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ECFE0
	ldrb r0, [r6]
	add r3, sp, #0x1c
	add r2, sp, #0x20
	strb r0, [sp, #0x1c]
	ldrb r0, [r6, #1]
	mov r1, #4
	strb r0, [sp, #0x1d]
	ldrb r0, [r6, #2]
	strb r0, [sp, #0x1e]
	ldrb r0, [r6, #3]
	strb r0, [sp, #0x1f]
_022ED01C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED01C
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	add r6, r6, #4
	blt _022ECFD4
	add r8, r8, #1
_022ED05C:
	cmp r8, #0xc
	bge _022ED074
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ECFAC
_022ED074:
	add r6, sl, #0x200
	ldr fp, _022ED23C ; =0x02320BF4
	b _022ED0CC
_022ED080:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	mov sb, #1
_022ED0A0:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED240 ; =0x02320BE8
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	blt _022ED0A0
	add r8, r8, #1
_022ED0CC:
	ldrsh r0, [r6, #0xc4]
	cmp r8, r0
	blt _022ED080
	add r0, r5, r4
	bl sub_0200A504
_022ED0E0:
	mov r1, #0
	strb r1, [sl, #0x1ee]
	ldr r0, _022ED234 ; =0x02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov r0, #0x28
	strb r1, [sl, #0x1bc]
	ldr r1, [sl, #0x19c]
	add r4, sl, #4
	cmp r1, #0
	add r3, r3, #0x98
	smulbb r1, r2, r0
	beq _022ED13C
	add r0, sl, #0x1a0
	add r1, r3, r1
	mov r2, #0x20
	bl sub_02063628
	ldr r1, [sl, #0x19c]
	add r0, sl, #0x1a0
	mov r2, #0x20
	bl sub_02063734
	mov r0, #1
	strb r0, [sl, #0x1bc]
_022ED13C:
	mov r0, #0
	str r0, [sl, #0x1f4]
	strb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	strb r0, [sl, #0x1fa]
	strb r0, [sl, #0x1fb]
	mov r5, r0
_022ED158:
	strh r5, [r4]
	strh r5, [r4, #2]
	add r0, r0, #1
	str r5, [r4, #8]
	str r5, [r4, #4]
	cmp r0, #0x10
	add r4, r4, #0xc
	blt _022ED158
	add r3, sl, #0xc4
	mov r1, #0
	mov r0, #0x2c
_022ED184:
	mul r2, r5, r0
	strb r1, [r3, r2]
	add r2, r3, r2
	strb r1, [r2, #1]
	strh r1, [r2, #4]
	strh r1, [r2, #2]
	str r1, [r2, #0x10]
	str r1, [r2, #0x18]
	str r1, [r2, #0x14]
	str r1, [r2, #0x20]
	str r1, [r2, #0x1c]
	add r5, r5, #1
	str r1, [r2, #0x24]
	str r1, [r2, #0x28]
	cmp r5, #4
	blt _022ED184
	mov r0, sl
	mov r1, #1
	bl ov11_022EE620
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r1, #1
	add r0, sl, #0x184
	strb r1, [sl, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ED1FC
	add r0, sl, #0x184
	bl UnloadFile
_022ED1FC:
	add r0, sl, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ED214
	add r0, sl, #0x18c
	bl UnloadFile
_022ED214:
	add sp, sp, #0x128
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ED21C: .word 0x02320C58
_022ED220: .word 0x02320C6C
_022ED224: .word 0x0000030F
_022ED228: .word 0x02320C80
_022ED22C: .word 0x02320BE4
_022ED230: .word 0x06018000
_022ED234: .word 0x02324CBC
_022ED238: .word 0x02320BE4
_022ED23C: .word 0x02320BF4
_022ED240: .word 0x02320BE8
	arm_func_end ov11_022ECD24

	arm_func_start ov11_022ED244
ov11_022ED244: ; 0x022ED244
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	mov r4, r1
	mvn r1, #0
	mov r7, r2
	cmp r4, r1
	ldrneb r1, [r7]
	mov sl, r0
	mov r6, r3
	cmpne r1, #0xff
	bne _022ED27C
	mov r0, sl
	bl ov11_022EC08C
	b _022ED680
_022ED27C:
	bl ov11_022EBFC8
	mov r1, #2
	strh r1, [sl]
	mov r2, #0
	add r0, sl, #0xea
	strb r2, [sl, #0x1c0]
	add r1, sl, #0x100
	strh r4, [r1, #0xbe]
	strh r2, [r1, #0xea]
	add r0, r0, #0x100
	strh r2, [r0, #2]
	strh r2, [r1, #0xc8]
	add r4, sl, #0x1c8
	strh r2, [r4, #0xa]
	strb r2, [sl, #0x1e0]
	add r5, sl, #0x1e0
	strb r2, [r5, #1]
	strb r2, [r5, #2]
	strb r2, [r5, #3]
	strh r2, [r5, #4]
	strh r2, [r5, #6]
	strh r2, [r5, #8]
	str r2, [sl, #0x1f0]
	str r7, [sp]
	ldr r0, [sl, #0x2d8]
	add r2, sp, #0x28
	add r3, sp, #0x24
	mov r1, #0x40
	bl ov10_022C3E8C
	ldr r0, [sp, #0x28]
	mov r3, #0x40
	strb r0, [r5, #2]
	ldr r1, [sp, #0x24]
	add r0, sp, #0x2c
	strb r1, [r5, #3]
	ldr r2, [sp, #0x28]
	add r1, sl, #0x194
	add r2, r2, r2, lsl #1
	strb r2, [sl, #0x1e0]
	ldr r8, [sp, #0x24]
	ldr r2, _022ED688 ; =0x06018000
	add r8, r8, r8, lsl #1
	strb r8, [r5, #1]
	ldr r8, [sl, #0x2e4]
	str r8, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r3, [r5, #3]
	str r3, [sp, #0x10]
	ldr r3, [sl, #0x2d8]
	str r3, [sp, #0x14]
	ldr r3, [sl, #0x2dc]
	bl ov10_022C3938
	ldr r3, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r2, r5
	str r3, [sl, #0x17c]
	str r0, [sl, #0x180]
	ldr r3, [sp, #0x34]
	add r0, sl, #0x200
	str r3, [sl, #0x1b8]
	ldrsh r3, [r0, #0xce]
	ldr r0, [sl, #0x2d8]
	ldr r5, [sl, #0x2d4]
	mov r1, #0
	blx r5
	mov r1, #0x200
	add r0, sl, #0x100
	strh r1, [r0, #0xc8]
	mov r1, #0
	mov r7, r1
_022ED39C:
	add r0, r4, r1, lsl #1
	add r1, r1, #1
	strh r7, [r0, #2]
	cmp r1, #4
	blt _022ED39C
	mov r0, #0x190
	strh r0, [r4, #0xa]
	add r0, sl, #0x100
	mov r1, #0xc
	strh r1, [r0, #0xea]
	strh r7, [r0, #0xec]
	ldr r6, [sl, #0x1b8]
	cmp r6, #0
	beq _022ED544
	ldr r0, _022ED68C ; =0x02324CBC
	ldrb r1, [sl, #0x2bc]
	ldr r5, [r0]
	mov r0, #0x28
	smulbb r4, r1, r0
	ldr r3, _022ED690 ; =0x02320BEC
	add r2, sp, #0x18
	mov r8, r7
	add r5, r5, #0x98
	mov r1, #4
_022ED3FC:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED3FC
	b _022ED4C0
_022ED410:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED694 ; =0x02320BF4
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add r6, r6, #4
	mov sb, #1
	add fp, sp, #0x20
_022ED438:
	add r3, sp, #0x18
	add r2, sp, #0x1c
	mov r1, #4
_022ED444:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED444
	ldrb r0, [r6]
	add r3, sp, #0x1c
	add r2, sp, #0x20
	strb r0, [sp, #0x1c]
	ldrb r0, [r6, #1]
	mov r1, #4
	strb r0, [sp, #0x1d]
	ldrb r0, [r6, #2]
	strb r0, [sp, #0x1e]
	ldrb r0, [r6, #3]
	strb r0, [sp, #0x1f]
_022ED480:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022ED480
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	add r6, r6, #4
	blt _022ED438
	add r8, r8, #1
_022ED4C0:
	cmp r8, #0xc
	bge _022ED4D8
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ED410
_022ED4D8:
	add r6, sl, #0x200
	ldr fp, _022ED694 ; =0x02320BF4
	b _022ED530
_022ED4E4:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	mov r2, fp
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	mov sb, #1
_022ED504:
	add r0, r7, #1
	mov r3, r0, lsl #0x10
	mov r1, r7
	ldr r2, _022ED698 ; =0x02320BE8
	add r0, r5, r4
	mov r7, r3, lsr #0x10
	bl sub_0200A590
	add sb, sb, #1
	cmp sb, #0x10
	blt _022ED504
	add r8, r8, #1
_022ED530:
	ldrsh r0, [r6, #0xc4]
	cmp r8, r0
	blt _022ED4E4
	add r0, r5, r4
	bl sub_0200A504
_022ED544:
	mov r1, #0
	strb r1, [sl, #0x1ee]
	ldr r0, _022ED68C ; =0x02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov r0, #0x28
	strb r1, [sl, #0x1bc]
	ldr r1, [sl, #0x19c]
	add r4, sl, #4
	cmp r1, #0
	add r3, r3, #0x98
	smulbb r1, r2, r0
	beq _022ED5A0
	add r0, sl, #0x1a0
	add r1, r3, r1
	mov r2, #0x20
	bl sub_02063628
	ldr r1, [sl, #0x19c]
	add r0, sl, #0x1a0
	mov r2, #0x20
	bl sub_02063734
	mov r0, #1
	strb r0, [sl, #0x1bc]
_022ED5A0:
	mov r0, #0
	str r0, [sl, #0x1f4]
	strb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	strb r0, [sl, #0x1fa]
	strb r0, [sl, #0x1fb]
	mov r5, r0
_022ED5BC:
	strh r5, [r4]
	strh r5, [r4, #2]
	add r0, r0, #1
	str r5, [r4, #8]
	str r5, [r4, #4]
	cmp r0, #0x10
	add r4, r4, #0xc
	blt _022ED5BC
	add r3, sl, #0xc4
	mov r1, #0
	mov r0, #0x2c
_022ED5E8:
	mul r2, r5, r0
	strb r1, [r3, r2]
	add r2, r3, r2
	strb r1, [r2, #1]
	strh r1, [r2, #4]
	strh r1, [r2, #2]
	str r1, [r2, #0x10]
	str r1, [r2, #0x18]
	str r1, [r2, #0x14]
	str r1, [r2, #0x20]
	str r1, [r2, #0x1c]
	add r5, r5, #1
	str r1, [r2, #0x24]
	str r1, [r2, #0x28]
	cmp r5, #4
	blt _022ED5E8
	add r2, sl, #0x200
	mov r1, #1
	mov r0, sl
	strh r1, [r2, #0xb8]
	bl ov11_022EE620
	ldr r1, [sl, #0x228]
	add r0, sl, #0x210
	blx r1
	mov r1, #1
	add r0, sl, #0x184
	strb r1, [sl, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022ED668
	add r0, sl, #0x184
	bl UnloadFile
_022ED668:
	add r0, sl, #0x18c
	bl PointsToZero
	cmp r0, #0
	bne _022ED680
	add r0, sl, #0x18c
	bl UnloadFile
_022ED680:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022ED688: .word 0x06018000
_022ED68C: .word 0x02324CBC
_022ED690: .word 0x02320BEC
_022ED694: .word 0x02320BF4
_022ED698: .word 0x02320BE8
	arm_func_end ov11_022ED244

	arm_func_start ov11_022ED69C
ov11_022ED69C: ; 0x022ED69C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	mov sb, r1
	add r1, sb, #0x100
	ldrsh r2, [r1, #0xbe]
	mvn r1, #0
	mov sl, r0
	cmp r2, r1
	bne _022ED6CC
	bl ov11_022EC08C
	mov r0, #0
	b _022EDCFC
_022ED6CC:
	bl ov11_022EBFC8
	ldr r0, [sb, #0x174]
	add r1, sl, #0x100
	str r0, [sp, #8]
	mov r0, #3
	strh r0, [sl]
	mov r0, #0
	strb r0, [sl, #0x1c0]
	add r0, sb, #0x100
	ldrsh r2, [r0, #0xbe]
	add r0, sp, #0x18
	strh r2, [r1, #0xbe]
	ldr r2, [sb, #0x1c4]
	str r2, [sl, #0x1c4]
	ldrsh r1, [r1, #0xbe]
	bl ov11_022EBB40
	add r2, sb, #0x100
	ldrsh r3, [r2, #0xea]
	add r1, sb, #0xea
	add r2, sl, #0x100
	strh r3, [r2, #0xea]
	add r1, r1, #0x100
	add r0, sl, #0xea
	ldrsh r1, [r1, #2]
	add r6, r0, #0x100
	mov r5, #0
	strh r1, [r6, #2]
	add r2, sl, #0x1c8
	add r1, sb, #0x1c8
	mov r0, r5
	mov r8, #0xc
_022ED748:
	mul fp, r5, r8
	ldrsh r4, [r1, fp]
	mov r7, r0
	add r3, r2, fp
	strh r4, [r2, fp]
	add r4, r1, fp
_022ED760:
	add fp, r4, r7, lsl #1
	ldrsh ip, [fp, #2]
	add fp, r3, r7, lsl #1
	add r7, r7, #1
	strh ip, [fp, #2]
	cmp r7, #4
	blt _022ED760
	ldrsh r4, [r4, #0xa]
	add r5, r5, #1
	cmp r5, #2
	strh r4, [r3, #0xa]
	blt _022ED748
	ldrb r2, [sb, #0x1e0]
	add r0, sb, #0x1e0
	add r1, sl, #0x1e0
	strb r2, [sl, #0x1e0]
	ldrb r3, [r0, #1]
	add r2, sl, #0x200
	str r2, [sp, #0x10]
	strb r3, [r1, #1]
	ldrb r5, [r0, #2]
	ldr r2, [sp, #8]
	ldr r4, _022EDD04 ; =0x02324CBC
	strb r5, [r1, #2]
	add fp, r2, #4
	ldrb r2, [r0, #3]
	mov r3, #0x28
	mov r8, #0
	strb r2, [r1, #3]
	ldrsh r2, [r0, #4]
	strh r2, [r1, #4]
	ldrsh r2, [r0, #6]
	strh r2, [r1, #6]
	ldrsh r0, [r0, #8]
	strh r0, [r1, #8]
	ldr r0, [sp, #0x10]
	ldr r2, [r4]
	ldrsh r0, [r0, #0xc2]
	ldrb r1, [sl, #0x2bc]
	add r5, r2, #0x98
	mov r0, r0, lsl #0x14
	smulbb r4, r1, r3
	mov r7, r0, lsr #0x10
	b _022ED854
_022ED810:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	ldr r2, _022EDD08 ; =0x02320BF4
	add r0, r5, r4
	bl sub_0200A590
	add r0, r5, r4
	mov r1, r7
	mov r2, fp
	mov r3, #0xf
	bl sub_0200A5B0
	add r0, r7, #0xf
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	add fp, fp, #0x3c
	add r8, r8, #1
_022ED854:
	ldrsh r0, [r6]
	cmp r8, r0
	bge _022ED870
	ldr r0, [sp, #0x10]
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ED810
_022ED870:
	add r0, sl, #0x200
	str r0, [sp, #0x14]
	b _022ED8C8
_022ED87C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	ldr r2, _022EDD08 ; =0x02320BF4
	add r0, r5, r4
	bl sub_0200A590
	mov fp, #1
_022ED89C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	ldr r2, _022EDD0C ; =0x02320BE8
	add r0, r5, r4
	bl sub_0200A590
	add fp, fp, #1
	cmp fp, #0x10
	blt _022ED89C
	add r8, r8, #1
_022ED8C8:
	ldr r0, [sp, #0x14]
	ldrsh r0, [r0, #0xc4]
	cmp r8, r0
	blt _022ED87C
	add r0, r5, r4
	bl sub_0200A504
	ldrsh r2, [r6, #2]
	add r0, sl, #4
	mov r1, #0
	cmp r2, #0
	beq _022ED99C
	ldrsh r5, [r6]
	ldr r2, [sp, #8]
	mov r3, #1
	add r4, r2, #4
	rsb r2, r5, r5, lsl #4
	add r2, r4, r2, lsl #2
	str r2, [sl, #0x1f4]
	strb r3, [sl, #0x1fb]
	strb r1, [sl, #0x1bc]
	ldrb r4, [sb, #0x1f8]
	add r3, r2, r5, lsl #2
	mov r8, r1
	strb r4, [sl, #0x1f8]
	ldrb r4, [sb, #0x1fa]
	mov r7, r1
	strb r4, [sl, #0x1f9]
	ldrb r4, [sb, #0x1fa]
	strb r4, [sl, #0x1fa]
	ldrb r4, [sb, #0x1ee]
	strb r4, [sl, #0x1ee]
	add r4, sl, #0x200
	b _022ED980
_022ED94C:
	ldrsh r5, [r2, #2]
	add r1, r1, #1
	cmp r5, #0
	strgt r3, [r0, #4]
	ldrgtsh r5, [r2, #2]
	add r2, r2, #4
	strle r8, [r0, #4]
	strh r7, [r0]
	rsbgt r5, r5, r5, lsl #4
	strh r7, [r0, #2]
	str r7, [r0, #8]
	addgt r3, r3, r5, lsl #2
	add r0, r0, #0xc
_022ED980:
	ldrsh r5, [r6]
	cmp r1, r5
	bge _022ED9B4
	ldrsh r5, [r4, #0xc4]
	cmp r1, r5
	blt _022ED94C
	b _022ED9B4
_022ED99C:
	str r1, [sl, #0x1f4]
	strb r1, [sl, #0x1f8]
	strb r1, [sl, #0x1f9]
	strb r1, [sl, #0x1fa]
	strb r1, [sl, #0x1fb]
	strb r1, [sl, #0x1bc]
_022ED9B4:
	mov r2, #0
	b _022ED9D4
_022ED9BC:
	strh r2, [r0]
	strh r2, [r0, #2]
	str r2, [r0, #8]
	str r2, [r0, #4]
	add r1, r1, #1
	add r0, r0, #0xc
_022ED9D4:
	cmp r1, #0x10
	blt _022ED9BC
	mov r8, #0
	add r6, sl, #0xc4
	mov r5, r8
	mov r4, r8
	mov fp, #0x2c
_022ED9F0:
	mul r0, r8, fp
	add r7, r6, r0
	strb r5, [r6, r0]
	strb r5, [r7, #1]
	strh r5, [r7, #4]
	strh r5, [r7, #2]
	add r0, r7, #8
	bl ZInit8
	str r4, [r7, #0x10]
	str r4, [r7, #0x18]
	str r4, [r7, #0x14]
	str r4, [r7, #0x20]
	str r4, [r7, #0x1c]
	add r8, r8, #1
	str r4, [r7, #0x24]
	str r4, [r7, #0x28]
	cmp r8, #4
	blt _022ED9F0
	add r0, sl, #0x200
	ldrsh r3, [r0, #0xbe]
	b _022EDB58
_022EDA44:
	mov r0, #0xc
	mul r2, r4, r0
	add r0, sl, #0x200
	ldrb r7, [sl, #0x2bc]
	ldr r6, _022EDD10 ; =0x02320C18
	cmp r4, #0
	add r6, r6, r7, lsl #3
	moveq r8, #0
	movne r8, #2
	cmp r4, #0
	moveq fp, #0
	add r5, sl, #0x1c8
	ldrsh r1, [r0, #0xc6]
	ldrsh r0, [r5, r2]
	ldr r7, [r6, r3, lsl #2]
	add r6, r5, r2
	add r0, r1, r0
	add r5, r7, r0, lsl #5
	add r0, sl, #0xc4
	movne fp, #4
	mov r7, #0
	add lr, sb, #0xc4
	str r0, [sp, #0xc]
_022EDAA0:
	mov r0, #0x2c
	mul r1, r8, r0
	ldr r0, [sp, #0xc]
	add r2, lr, r1
	add r1, r0, r1
	mov ip, #0xa
	add r0, sp, #0x18
	mla r0, fp, ip, r0
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0
	beq _022EDB3C
	ldr r0, [r2, #8]
	ldr ip, [r2, #0xc]
	add r2, r6, r7, lsl #1
	str r0, [r1, #8]
	str ip, [r1, #0xc]
	mov r0, #1
	strb r0, [r1]
	strb r0, [r1, #1]
	ldr ip, [r1, #8]
	str ip, [r1, #0x10]
	add r0, ip, #4
	ldrsh ip, [ip, #2]
	str r0, [r1, #0x18]
	add ip, r0, ip, lsl #2
	str r0, [r1, #0x14]
	str ip, [r1, #0x20]
	str ip, [r1, #0x1c]
	mov r0, #0
	strh r0, [r1, #2]
	ldr r0, [r1, #0x18]
	ldr r0, [r0]
	strh r0, [r1, #4]
	str r5, [r1, #0x24]
	ldrsh r0, [r2, #2]
	mov r0, r0, lsl #5
	str r0, [r1, #0x28]
	ldrsh r0, [r2, #2]
	add r5, r5, r0, lsl #5
_022EDB3C:
	add r7, r7, #1
	cmp r7, #2
	add fp, fp, #1
	add r8, r8, #1
	blt _022EDAA0
	add r4, r4, #1
	add r3, r3, #1
_022EDB58:
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc0]
	cmp r4, r1
	blt _022EDA44
	ldrsh r5, [r0, #0xbe]
	mov r4, #0
	b _022EDBF0
_022EDB74:
	mov r0, #0xc
	mul r0, r4, r0
	add r1, sb, #0x1c8
	ldrsh r2, [r1, r0]
	add r3, r1, r0
	mov r1, #0
_022EDB8C:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #2]
	add r1, r1, #1
	cmp r1, #4
	add r2, r2, r0
	blt _022EDB8C
	cmp r2, #0
	ble _022EDBD0
	ldrb r0, [sl, #0x2bc]
	ldr r3, _022EDD10 ; =0x02320C18
	ldrb r1, [sb, #0x2bc]
	add r0, r3, r0, lsl #3
	ldr r0, [r0, r5, lsl #2]
	add r1, r3, r1, lsl #3
	ldr r1, [r1, r5, lsl #2]
	mov r2, r2, lsl #5
	bl Memcpy16
_022EDBD0:
	add r2, sb, r4, lsl #2
	ldr r0, [r2, #0x2dc]
	add r1, sl, r4, lsl #2
	str r0, [r1, #0x2dc]
	ldr r0, [r2, #0x2e4]
	add r4, r4, #1
	str r0, [r1, #0x2e4]
	add r5, r5, #1
_022EDBF0:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r4, r0
	blt _022EDB74
	ldr r0, [sb, #0x1fc]
	add r4, sb, #0x210
	str r0, [sl, #0x1fc]
	add r5, sl, #0x210
	mov r6, #0
	b _022EDCB8
_022EDC18:
	mov sb, r4
	mov r8, r5
	mov r7, #5
_022EDC24:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _022EDC24
	ldr r1, [sb]
	mov r0, #0
	str r1, [r8]
	ldrsh r7, [r5, #2]
	add r1, sl, #0x200
	b _022EDC64
_022EDC4C:
	add r2, sl, r7, lsl #2
	ldr r3, [r2, #0x2ec]
	add r2, r5, r0, lsl #2
	str r3, [r2, #0x2c]
	add r0, r0, #1
	add r7, r7, #1
_022EDC64:
	ldrsh r2, [r5, #4]
	cmp r0, r2
	bge _022EDC7C
	ldrsh r2, [r1, #0xc0]
	cmp r7, r2
	blt _022EDC4C
_022EDC7C:
	mov r2, #0
	b _022EDC98
_022EDC84:
	add r1, r5, r0, lsl #2
	str r2, [r1, #0x1c]
	str r2, [r1, #0x24]
	str r2, [r1, #0x2c]
	add r0, r0, #1
_022EDC98:
	cmp r0, #2
	blt _022EDC84
	mov r0, r5
	add r1, sl, #0x200
	bl ov11_022EE9B0
	add r6, r6, #1
	add r5, r5, #0x54
	add r4, r4, #0x54
_022EDCB8:
	ldr r0, [sl, #0x1fc]
	cmp r6, r0
	blt _022EDC18
	mov r4, #0
	b _022EDCF0
_022EDCCC:
	str r4, [sp]
	mov r0, r5
	mov r1, sl
	mov r2, r4
	mov r3, r4
	str r4, [sp, #4]
	bl ov11_022EE8CC
	add r6, r6, #1
	add r5, r5, #0x54
_022EDCF0:
	cmp r6, #2
	blt _022EDCCC
	mov r0, #1
_022EDCFC:
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EDD04: .word 0x02324CBC
_022EDD08: .word 0x02320BF4
_022EDD0C: .word 0x02320BE8
_022EDD10: .word 0x02320C18
	arm_func_end ov11_022ED69C

	arm_func_start ov11_022EDD14
ov11_022EDD14: ; 0x022EDD14
	mov r1, #1
	strb r1, [r0, #0x1c0]
	bx lr
	arm_func_end ov11_022EDD14

	arm_func_start ov11_022EDD20
ov11_022EDD20: ; 0x022EDD20
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xf0
	mov r5, r0
	add r0, r5, #0x18c
	mov r4, r1
	bl PointsToZero
	cmp r0, #0
	bne _022EDD48
	add r0, r5, #0x18c
	bl UnloadFile
_022EDD48:
	add r0, r5, #0x100
	strh r4, [r0, #0xbe]
	ldrsh r1, [r0, #0xbe]
	add r0, sp, #0x80
	bl ov11_022EBB40
	ldr r1, _022EDE5C ; =0x02320C80
	add r0, sp, #0
	add r2, sp, #0x94
	bl Sprintf
	ldr r2, _022EDE60 ; =0x0000030F
	add r1, sp, #0
	add r0, r5, #0x18c
	bl LoadFileFromRom__02008C3C
	ldr lr, [r5, #0x18c]
	add r4, r5, #0x1e0
	ldrb r2, [lr]
	add r0, r5, #0x2e4
	add r1, lr, #0xc
	strb r2, [r5, #0x1e0]
	ldrb ip, [lr, #1]
	add r2, r5, #0x2bc
	mov r3, r4
	strb ip, [r4, #1]
	ldrb ip, [lr, #4]
	strb ip, [r4, #2]
	ldrb ip, [lr, #5]
	strb ip, [r4, #3]
	ldrb ip, [lr, #6]
	strh ip, [r4, #4]
	ldrb ip, [lr, #8]
	strh ip, [r4, #6]
	ldrb ip, [lr, #0xa]
	strh ip, [r4, #8]
	bl ov11_022EE2D4
	mov r1, r0
	str r1, [r5, #0x1f0]
	ldr r0, [r5, #0x2d8]
	cmp r0, #0
	beq _022EDDF8
	add r2, r5, #0x200
	ldrsh r3, [r2, #0xce]
	ldr ip, [r5, #0x2d4]
	mov r2, r4
	blx ip
_022EDDF8:
	add r0, r5, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r0, #0
	mov r0, r5
	ble _022EDE18
	mov r1, #1
	bl ov11_022EE620
	b _022EDE20
_022EDE18:
	mov r1, #0
	bl ov11_022EE620
_022EDE20:
	ldr r1, [r5, #0x228]
	add r0, r5, #0x210
	blx r1
	mov r1, #1
	add r0, r5, #0x18c
	strb r1, [r5, #0x2ba]
	bl PointsToZero
	cmp r0, #0
	bne _022EDE4C
	add r0, r5, #0x18c
	bl UnloadFile
_022EDE4C:
	mov r0, #0
	strb r0, [r5, #0x1c0]
	add sp, sp, #0xf0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EDE5C: .word 0x02320C80
_022EDE60: .word 0x0000030F
	arm_func_end ov11_022EDD20

	arm_func_start ov11_022EDE64
ov11_022EDE64: ; 0x022EDE64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	bl ov11_022EC08C
	mov r1, #4
	strh r1, [sl]
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r0, #1
	mov r0, sl
	bne _022EDEA4
	mov r1, #1
	bl ov11_022EE620
	b _022EDEA8
_022EDEA4:
	bl ov11_022EE620
_022EDEA8:
	ldr r3, _022EE0B8 ; =0x02320BF0
	add r2, sp, #0xc
	mov r6, #0
	mov r1, #4
_022EDEB8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022EDEB8
	b _022EE0A0
_022EDECC:
	cmp r6, #0
	ldreq r1, [sp]
	ldrne r1, [sp, #4]
	cmp r1, #0
	beq _022EE074
	ldr r2, _022EE0BC ; =0x0000030F
	add r0, sp, #0x18
	bl LoadFileFromRom__02008C3C
	ldr r0, [sp, #0x18]
	bl GetAtSize
	mov r4, r0
	cmp r4, #0
	ldrle r0, [sp, #0x1c]
	ldrle r5, [sp, #0x18]
	strle r0, [sp, #8]
	ble _022EDF34
	ldr r1, _022EE0BC ; =0x0000030F
	bl MemAlloc
	ldr r2, [sp, #0x18]
	mov r1, r4
	mov r5, r0
	bl DecompressAtNormalVeneer
	ldr r1, [r5, #0xc]
	add r0, sp, #0x18
	str r1, [sp, #8]
	bl UnloadFile
_022EDF34:
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc2]
	ldr r0, _022EE0C0 ; =0x02324CBC
	ldr r2, [r5]
	ldr r4, [r0]
	mov r1, r1, lsl #0x14
	ldrb r3, [sl, #0x2bc]
	mov r0, #0x28
	add r4, r4, #0x98
	smulbb fp, r3, r0
	mov r7, r1, lsr #0x10
	add sb, r5, r2
	mov r8, #0
	b _022EDFE8
_022EDF6C:
	add r3, sp, #0xc
	add r2, sp, #0x10
	mov r1, #4
_022EDF78:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022EDF78
	ldrb r0, [sb]
	add r3, sp, #0x10
	add r2, sp, #0x14
	strb r0, [sp, #0x10]
	ldrb r0, [sb, #1]
	mov r1, #4
	strb r0, [sp, #0x11]
	ldrb r0, [sb, #2]
	strb r0, [sp, #0x12]
	ldrb r0, [sb, #3]
	strb r0, [sp, #0x13]
_022EDFB4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022EDFB4
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r7
	mov r7, r0, lsr #0x10
	add r0, r4, fp
	add r2, sp, #0x14
	bl sub_0200A590
	add r8, r8, #1
	add sb, sb, #4
_022EDFE8:
	ldr r1, [r5, #4]
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	cmp r8, r0, asr #2
	blt _022EDF6C
	add r0, r4, fp
	bl sub_0200A504
	add r0, sl, #0x200
	ldrsh r2, [r0, #0xbe]
	ldr r1, [r5, #8]
	ldrb r7, [sl, #0x2bc]
	ldr r4, _022EE0C4 ; =0x02320C18
	add r3, r2, r6
	add r2, r4, r7, lsl #3
	ldr r3, [r2, r3, lsl #2]
	ldrsh r0, [r0, #0xc6]
	ldr r2, [sp, #8]
	add r1, r5, r1
	add r0, r3, r0, lsl #5
	bl Memcpy16
	add r0, sl, r6, lsl #2
	ldr r1, [r5, #0x10]
	ldr r3, [r0, #0x2ec]
	add r2, r5, r1
	mov r1, #0
_022EE04C:
	ldrh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x400
	strh r0, [r3], #2
	blt _022EE04C
	mov r1, #1
	mov r0, r5
	strb r1, [sl, #0x2ba]
	bl MemFree
	b _022EE09C
_022EE074:
	add r0, sl, r6, lsl #2
	ldr r2, [r0, #0x2ec]
	mov r1, #0
	mov r0, r1
_022EE084:
	add r1, r1, #1
	cmp r1, #0x400
	strh r0, [r2], #2
	blt _022EE084
	mov r0, #1
	strb r0, [sl, #0x2ba]
_022EE09C:
	add r6, r6, #1
_022EE0A0:
	add r0, sl, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r6, r0
	blt _022EDECC
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE0B8: .word 0x02320BF0
_022EE0BC: .word 0x0000030F
_022EE0C0: .word 0x02324CBC
_022EE0C4: .word 0x02320C18
	arm_func_end ov11_022EDE64

	arm_func_start ov11_022EE0C8
ov11_022EE0C8: ; 0x022EE0C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _022EE12C ; =0x02320C28
	mov r4, r0
	bl ov11_022EBC18
	mov r0, r4
	bl ov11_022EC08C
	mov r2, #5
	mov r0, r4
	mov r1, #1
	strh r2, [r4]
	bl ov11_022EE620
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldr r0, _022EE130 ; =0x02324CBC
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xe
	str r2, [sp]
	stmib sp, {r0, r2}
	ldr r0, _022EE134 ; =0x06010000
	add r3, r1, #0x98
	bl sub_02016300
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022EE12C: .word 0x02320C28
_022EE130: .word 0x02324CBC
_022EE134: .word 0x06010000
	arm_func_end ov11_022EE0C8

	arm_func_start ov11_022EE138
ov11_022EE138: ; 0x022EE138
	ldr ip, _022EE140 ; =sub_020163E4
	bx ip
	.align 2, 0
_022EE140: .word sub_020163E4
	arm_func_end ov11_022EE138

	arm_func_start ov11_022EE144
ov11_022EE144: ; 0x022EE144
	ldr ip, _022EE158 ; =sub_02016378
	mov r0, r1
	mov r1, r2
	mov r2, #3
	bx ip
	.align 2, 0
_022EE158: .word sub_02016378
	arm_func_end ov11_022EE144

	arm_func_start ov11_022EE15C
ov11_022EE15C: ; 0x022EE15C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	bl sub_02016468
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE15C

	arm_func_start ov11_022EE17C
ov11_022EE17C: ; 0x022EE17C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_0201641C
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE17C

	arm_func_start ov11_022EE198
ov11_022EE198: ; 0x022EE198
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r4, r1
	ldr r1, _022EE204 ; =0x02320C28
	mov r5, r0
	bl ov11_022EBC18
	mov r0, r5
	bl ov11_022EC08C
	mov r2, #6
	mov r0, r5
	mov r1, #1
	strh r2, [r5]
	bl ov11_022EE620
	mov r0, #1
	strb r0, [r5, #0x1c0]
	strb r0, [r5, #0x1c1]
	ldr r0, _022EE208 ; =0x02324CBC
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xe
	str r2, [sp]
	stmib sp, {r0, r4}
	ldr r0, _022EE20C ; =0x06010000
	add r3, r1, #0x98
	bl sub_02016300
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022EE204: .word 0x02320C28
_022EE208: .word 0x02324CBC
_022EE20C: .word 0x06010000
	arm_func_end ov11_022EE198

	arm_func_start ov11_022EE210
ov11_022EE210: ; 0x022EE210
	ldr ip, _022EE218 ; =sub_020163E4
	bx ip
	.align 2, 0
_022EE218: .word sub_020163E4
	arm_func_end ov11_022EE210

	arm_func_start ov11_022EE21C
ov11_022EE21C: ; 0x022EE21C
	ldrsh r1, [r0]
	cmp r1, #6
	ldreqb r0, [r0, #0x1c1]
	movne r0, #0
	bx lr
	arm_func_end ov11_022EE21C

	arm_func_start ov11_022EE230
ov11_022EE230: ; 0x022EE230
	stmdb sp!, {r4, lr}
	cmp r1, #5
	moveq r3, #4
	mov r4, r0
	mov r0, r1
	movne r3, #3
	mov r1, r2
	mov r2, r3
	bl sub_02016378
	mov r0, #0
	strb r0, [r4, #0x1c0]
	mov r0, #1
	strb r0, [r4, #0x1c1]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE230

	arm_func_start ov11_022EE268
ov11_022EE268: ; 0x022EE268
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _022EE2C4 ; =0x02320C28
	mov r4, r0
	bl ov11_022EBC18
	mov r0, r4
	bl ov11_022EC08C
	mov r2, #5
	mov r0, r4
	mov r1, #1
	strh r2, [r4]
	bl ov11_022EE620
	ldr r0, _022EE2C8 ; =0x02324CBC
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xe
	str r2, [sp]
	stmib sp, {r0, r2}
	ldr r0, _022EE2CC ; =0x06010000
	add r3, r1, #0x98
	bl sub_02015328
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022EE2C4: .word 0x02320C28
_022EE2C8: .word 0x02324CBC
_022EE2CC: .word 0x06010000
	arm_func_end ov11_022EE268

	arm_func_start ov11_022EE2D0
ov11_022EE2D0: ; 0x022EE2D0
	bx lr
	arm_func_end ov11_022EE2D0

	arm_func_start ov11_022EE2D4
ov11_022EE2D4: ; 0x022EE2D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r5, #0
	b _022EE5C8
_022EE2E4:
	sub r4, r4, r5
	add r4, r0, r4, lsl #2
	ldr sl, [r4, #-4]
	mov r7, #0
	b _022EE588
_022EE2F8:
	cmp r7, #0
	mov r6, #0
	bne _022EE410
	b _022EE400
_022EE308:
	ldrb sb, [r1], #1
	cmp sb, #0xc0
	blt _022EE368
	mov r8, #0xc0
	b _022EE354
_022EE31C:
	ldrb lr, [r1]
	ldrb ip, [r1, #1]
	ldrb r4, [r1, #2]
	add r1, r1, #3
	orr ip, lr, ip, lsl #8
	orr r4, ip, r4, lsl #16
	ldr ip, _022EE5E0 ; =0x00000FFF
	add r8, r8, #1
	and ip, r4, ip
	strh ip, [sl]
	ldr ip, _022EE5E0 ; =0x00000FFF
	and r4, ip, r4, asr #12
	strh r4, [sl, #2]
	add sl, sl, #4
_022EE354:
	cmp r8, sb
	ble _022EE31C
	sub r4, sb, #0xbf
	add r6, r6, r4, lsl #1
	b _022EE400
_022EE368:
	cmp sb, #0x80
	blt _022EE3D4
	ldrb ip, [r1]
	ldrb fp, [r1, #1]
	ldrb r8, [r1, #2]
	add r1, r1, #3
	orr fp, ip, fp, lsl #8
	orr fp, fp, r8, lsl #16
	ldr r8, _022EE5E0 ; =0x00000FFF
	ldr ip, _022EE5E0 ; =0x00000FFF
	and r8, fp, r8
	and fp, ip, fp, asr #12
	mov r8, r8, lsl #0x10
	mov fp, fp, lsl #0x10
	mov r4, #0x80
	mov r8, r8, lsr #0x10
	mov fp, fp, lsr #0x10
	b _022EE3C0
_022EE3B0:
	strh r8, [sl]
	strh fp, [sl, #2]
	add sl, sl, #4
	add r4, r4, #1
_022EE3C0:
	cmp r4, sb
	ble _022EE3B0
	sub r4, sb, #0x7f
	add r6, r6, r4, lsl #1
	b _022EE400
_022EE3D4:
	mov fp, #0
	b _022EE3F0
_022EE3DC:
	mov r4, #0
	strh r4, [sl]
	strh r4, [sl, #2]
	add sl, sl, #4
	add fp, fp, #1
_022EE3F0:
	cmp fp, sb
	ble _022EE3DC
	add r4, sb, #1
	add r6, r6, r4, lsl #1
_022EE400:
	ldrb r4, [r3, #2]
	cmp r6, r4
	blt _022EE308
	b _022EE57C
_022EE410:
	sub sb, sl, #0x80
	b _022EE560
_022EE418:
	ldrb fp, [r1], #1
	cmp fp, #0xc0
	blt _022EE49C
	mov ip, #0xc0
	b _022EE488
_022EE42C:
	ldrb r8, [r1, #1]
	ldrb lr, [r1]
	ldrb r4, [r1, #2]
	str r8, [sp, #0xc]
	ldrh r8, [sb]
	add r1, r1, #3
	add ip, ip, #1
	str r8, [sp, #4]
	ldr r8, [sp, #0xc]
	orr r8, lr, r8, lsl #8
	orr lr, r8, r4, lsl #16
	ldr r4, _022EE5E0 ; =0x00000FFF
	and r8, lr, r4
	ldr r4, [sp, #4]
	eor r4, r4, r8
	strh r4, [sl]
	ldr r4, _022EE5E0 ; =0x00000FFF
	and lr, r4, lr, asr #12
	ldrh r4, [sb, #2]
	add sb, sb, #4
	eor r4, r4, lr
	strh r4, [sl, #2]
	add sl, sl, #4
_022EE488:
	cmp ip, fp
	ble _022EE42C
	sub r4, fp, #0xbf
	add r6, r6, r4, lsl #1
	b _022EE560
_022EE49C:
	cmp fp, #0x80
	blt _022EE524
	ldrb r4, [r1]
	ldrb lr, [r1, #1]
	ldrb r8, [r1, #2]
	add r1, r1, #3
	orr r4, r4, lr, lsl #8
	orr r4, r4, r8, lsl #16
	ldr r8, _022EE5E0 ; =0x00000FFF
	mov ip, #0x80
	and r8, r4, r8
	str r8, [sp]
	ldr r8, _022EE5E0 ; =0x00000FFF
	and r4, r8, r4, asr #12
	str r4, [sp, #8]
	b _022EE510
_022EE4DC:
	ldrh r8, [sb]
	ldr r4, [sp]
	add lr, sb, #2
	eor r4, r8, r4
	strh r4, [sl]
	ldrh lr, [lr]
	ldr r4, [sp, #8]
	add r8, sl, #2
	eor r4, lr, r4
	add sb, sb, #4
	add sl, sl, #4
	strh r4, [r8]
	add ip, ip, #1
_022EE510:
	cmp ip, fp
	ble _022EE4DC
	sub r4, fp, #0x7f
	add r6, r6, r4, lsl #1
	b _022EE560
_022EE524:
	mov r4, #0
	b _022EE550
_022EE52C:
	ldrh ip, [sb]
	add r8, sb, #2
	add sb, sb, #4
	strh ip, [sl]
	ldrh r8, [r8]
	add ip, sl, #2
	add sl, sl, #4
	strh r8, [ip]
	add r4, r4, #1
_022EE550:
	cmp r4, fp
	ble _022EE52C
	add r4, fp, #1
	add r6, r6, r4, lsl #1
_022EE560:
	ldrb r4, [r3, #2]
	cmp r6, r4
	blt _022EE418
	b _022EE57C
_022EE570:
	mov r4, #0
	strh r4, [sl], #2
	add r6, r6, #1
_022EE57C:
	cmp r6, #0x40
	blt _022EE570
	add r7, r7, #1
_022EE588:
	ldrb r4, [r3, #3]
	cmp r7, r4
	blt _022EE2F8
	mov r6, #0
	mov r8, r6
	b _022EE5B8
_022EE5A0:
	mov r4, r8
_022EE5A4:
	add r4, r4, #1
	cmp r4, #0x40
	strh r6, [sl], #2
	blt _022EE5A4
	add r7, r7, #1
_022EE5B8:
	ldrsh r4, [r2, #0x14]
	cmp r7, r4
	blt _022EE5A0
	add r5, r5, #1
_022EE5C8:
	ldrsh r4, [r2, #4]
	cmp r5, r4
	blt _022EE2E4
	mov r0, r1
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE5E0: .word 0x00000FFF
	arm_func_end ov11_022EE2D4

	arm_func_start ov11_022EE5E4
ov11_022EE5E4: ; 0x022EE5E4
	strb r1, [r0, #0x1ee]
	bx lr
	arm_func_end ov11_022EE5E4

	arm_func_start ov11_022EE5EC
ov11_022EE5EC: ; 0x022EE5EC
	ldr r3, [r0, #0x1f4]
	cmp r3, #0
	strneb r1, [r0, #0x1f8]
	strneb r2, [r0, #0x1f9]
	strneb r2, [r0, #0x1fa]
	movne r1, #1
	strneb r1, [r0, #0x1fb]
	bx lr
	arm_func_end ov11_022EE5EC

	arm_func_start ov11_022EE60C
ov11_022EE60C: ; 0x022EE60C
	ldr r1, [r0, #0x1f4]
	cmp r1, #0
	ldrneb r0, [r0, #0x1fb]
	moveq r0, #0
	bx lr
	arm_func_end ov11_022EE60C

	arm_func_start ov11_022EE620
ov11_022EE620: ; 0x022EE620
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mov r5, r1
	cmp r5, #6
	add sb, r4, #0x210
	addls pc, pc, r5, lsl #2
	b _022EE688
_022EE640: ; jump table
	b _022EE65C ; case 0
	b _022EE688 ; case 1
	b _022EE688 ; case 2
	b _022EE6C4 ; case 3
	b _022EE6F4 ; case 4
	b _022EE6F4 ; case 5
	b _022EE6F4 ; case 6
_022EE65C:
	mov r2, #0
	str r2, [r4, #0x1fc]
	str r2, [sp]
	mov r0, sb
	mov r1, r4
	mov r3, r2
	str r2, [sp, #4]
	bl ov11_022EE8CC
	ldr r0, _022EE8AC ; =0x022EEA60
	str r0, [sb, #0x18]
	b _022EE760
_022EE688:
	mov r7, #1
	str r7, [r4, #0x1fc]
	add r0, r4, #0x200
	ldrsh r6, [r0, #0xc0]
	cmp r5, #2
	mov r2, #0
	movne r7, #0
	str r6, [sp]
	and r6, r7, #0xff
	mov r0, sb
	mov r1, r4
	mov r3, r2
	str r6, [sp, #4]
	bl ov11_022EE8CC
	b _022EE760
_022EE6C4:
	mov r0, #1
	str r0, [r4, #0x1fc]
	add r0, r4, #0x200
	ldrsh r1, [r0, #0xc0]
	mov r2, #0
	mov r0, sb
	str r1, [sp]
	mov r1, r4
	mov r3, r2
	str r2, [sp, #4]
	bl ov11_022EE8CC
	b _022EE760
_022EE6F4:
	mov r0, #2
	cmp r5, #6
	moveq r3, #1
	str r0, [r4, #0x1fc]
	movne r3, #0
	mov r2, #1
	and r6, r3, #0xff
	str r2, [sp]
	mov r0, sb
	mov r1, r4
	mov r3, #0
	str r6, [sp, #4]
	bl ov11_022EE8CC
	add r0, r4, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r5, #4
	movne r2, #1
	moveq r2, #0
	sub r0, r0, #1
	and r6, r2, #0xff
	str r0, [sp]
	mov r1, r4
	add r0, sb, #0x54
	mov r2, #0
	mov r3, #1
	str r6, [sp, #4]
	bl ov11_022EE8CC
_022EE760:
	cmp r5, #3
	bne _022EE780
	ldr r2, _022EE8B0 ; =0x022EEA64
	mov r0, sb
	add r1, r4, #0x200
	str r2, [sb, #0x18]
	bl ov11_022EE9B0
	b _022EE84C
_022EE780:
	ldr r0, _022EE8B4 ; =0x02320BE4
	mov sl, #0
	ldr r8, [r0, #0x24]
	ldr r7, [r0, #0x28]
	str r8, [sp, #8]
	str r7, [sp, #0xc]
	add r5, r4, #0x200
	ldr fp, _022EE8B8 ; =0x022EEA84
	ldr r6, _022EE8B0 ; =0x022EEA64
	b _022EE840
_022EE7A8:
	mov r0, #0x54
	mla r0, sl, r0, sb
	add r1, r4, sl, lsl #3
	str r8, [r1, #0x200]
	str r7, [r1, #0x204]
	ldrsh r1, [r0, #4]
	cmp r1, #1
	beq _022EE7D0
	cmp r1, #2
	beq _022EE804
_022EE7D0:
	ldrsh r1, [r0]
	cmp r1, #0
	beq _022EE7E4
	cmp r1, #1
	beq _022EE7EC
_022EE7E4:
	str r6, [r0, #0x18]
	b _022EE834
_022EE7EC:
	ldrb r1, [r0, #6]
	cmp r1, #0
	ldrne r1, _022EE8BC ; =ov11_022EEBF8
	ldreq r1, _022EE8C0 ; =ov11_022EEAAC
	str r1, [r0, #0x18]
	b _022EE834
_022EE804:
	ldrsh r1, [r0]
	cmp r1, #0
	beq _022EE818
	cmp r1, #1
	beq _022EE820
_022EE818:
	str fp, [r0, #0x18]
	b _022EE834
_022EE820:
	ldrb r1, [r0, #6]
	cmp r1, #0
	ldrne r1, _022EE8C4 ; =ov11_022EEFC0
	ldreq r1, _022EE8C8 ; =ov11_022EED98
	str r1, [r0, #0x18]
_022EE834:
	add r1, r5, sl, lsl #3
	bl ov11_022EE9B0
	add sl, sl, #1
_022EE840:
	ldr r0, [r4, #0x1fc]
	cmp sl, r0
	blt _022EE7A8
_022EE84C:
	ldr r0, _022EE8B4 ; =0x02320BE4
	ldr r7, [r4, #0x1fc]
	ldr r6, [r0, #0x24]
	ldr r5, [r0, #0x28]
	str r6, [sp, #0x10]
	str r5, [sp, #0x14]
	mov sl, #0
	mov r8, #0x54
	b _022EE89C
_022EE870:
	mla r0, r7, r8, sb
	add r1, r4, r7, lsl #3
	str r6, [r1, #0x200]
	str r5, [r1, #0x204]
	str sl, [sp]
	mov r1, r4
	mov r2, sl
	mov r3, sl
	str sl, [sp, #4]
	bl ov11_022EE8CC
	add r7, r7, #1
_022EE89C:
	cmp r7, #2
	blt _022EE870
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE8AC: .word 0x022EEA60
_022EE8B0: .word 0x022EEA64
_022EE8B4: .word 0x02320BE4
_022EE8B8: .word 0x022EEA84
_022EE8BC: .word ov11_022EEBF8
_022EE8C0: .word ov11_022EEAAC
_022EE8C4: .word ov11_022EEFC0
_022EE8C8: .word ov11_022EED98
	arm_func_end ov11_022EE620

	arm_func_start ov11_022EE8CC
ov11_022EE8CC: ; 0x022EE8CC
	stmdb sp!, {r4, r5, r6, lr}
	add r2, r1, #0x200
	ldrsh r2, [r2, #0xb8]
	ldrb r4, [sp, #0x14]
	ldr ip, [sp, #0x10]
	strh r2, [r0]
	strh r3, [r0, #2]
	strh ip, [r0, #4]
	strb r4, [r0, #6]
	ldrb r2, [r1, #0x1e2]
	cmp r4, #0
	str r2, [r0, #8]
	ldrb r2, [r1, #0x1e3]
	str r2, [r0, #0xc]
	ldrb r2, [r1, #0x1e0]
	movne r2, r2, lsl #3
	strne r2, [r0, #0x10]
	ldrneb r2, [r1, #0x1e1]
	movne r2, r2, lsl #3
	bne _022EE934
	mov r2, r2, lsl #3
	sub r2, r2, #0x100
	str r2, [r0, #0x10]
	ldrb r2, [r1, #0x1e1]
	mov r2, r2, lsl #3
	sub r2, r2, #0xc0
_022EE934:
	str r2, [r0, #0x14]
	mov r2, #0
	add lr, r1, #0x200
	b _022EE96C
_022EE944:
	add r6, r1, r3, lsl #2
	ldr r4, [r6, #0x2dc]
	add r5, r0, r2, lsl #2
	str r4, [r5, #0x1c]
	ldr r4, [r6, #0x2e4]
	add r2, r2, #1
	str r4, [r5, #0x24]
	ldr r4, [r6, #0x2ec]
	add r3, r3, #1
	str r4, [r5, #0x2c]
_022EE96C:
	cmp r2, ip
	bge _022EE980
	ldrsh r4, [lr, #0xc0]
	cmp r3, r4
	blt _022EE944
_022EE980:
	mov ip, #0
	b _022EE99C
_022EE988:
	add r3, r0, r2, lsl #2
	str ip, [r3, #0x1c]
	str ip, [r3, #0x24]
	str ip, [r3, #0x2c]
	add r2, r2, #1
_022EE99C:
	cmp r2, #2
	blt _022EE988
	add r1, r1, #0x200
	bl ov11_022EE9B0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022EE8CC

	arm_func_start ov11_022EE9B0
ov11_022EE9B0: ; 0x022EE9B0
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	mov r4, r0
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	str r2, [r4, #0x34]
	mov r0, r0, asr #3
	str r0, [r4, #0x3c]
	ldr r1, [r1, #4]
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	str r1, [r4, #0x38]
	mov r0, r0, asr #3
	str r0, [r4, #0x40]
	ldrsh r0, [r4]
	cmp r0, #0
	beq _022EEA00
	cmp r0, #1
	beq _022EEA18
	ldmia sp!, {r4, pc}
_022EEA00:
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldmia sp!, {r4, pc}
_022EEA18:
	ldr r0, [r4, #0x3c]
	mov r1, #3
	bl DivideInt
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl DivideInt
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x34]
	mov r1, #0x18
	bl DivideInt
	add r0, r1, #0x10
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x38]
	mov r1, #0x18
	bl DivideInt
	str r1, [r4, #0x50]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE9B0

	arm_func_start ov11_022EEA60
ov11_022EEA60: ; 0x022EEA60
	bx lr
	arm_func_end ov11_022EEA60

	arm_func_start ov11_022EEA64
ov11_022EEA64: ; 0x022EEA64
	ldr r2, [r0, #0x2c]
	mov r1, #0
	mov r0, r1
_022EEA70:
	add r1, r1, #1
	cmp r1, #0x800
	strh r0, [r2], #2
	blt _022EEA70
	bx lr
	arm_func_end ov11_022EEA64

	arm_func_start ov11_022EEA84
ov11_022EEA84: ; 0x022EEA84
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	mov r1, #0
	mov r0, r1
_022EEA94:
	strh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x800
	strh r0, [r3], #2
	blt _022EEA94
	bx lr
	arm_func_end ov11_022EEA84

	arm_func_start ov11_022EEAAC
ov11_022EEAAC: ; 0x022EEAAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r2, [r0, #0x44]
	ldr r1, [r0, #0x48]
	ldr r3, [r0, #0x24]
	add r1, r2, r1, lsl #6
	add ip, r3, r1, lsl #1
	mov lr, #2
	mov r5, #0
_022EEAD0:
	ldr r4, [r0, #0x2c]
	mov r7, ip
	mov r3, #0
	add r1, sp, #0
_022EEAE0:
	add r2, r4, lr, lsl #1
	str r2, [r1, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	add lr, lr, #0x20
	blt _022EEAE0
	mov r4, #0
	add r2, sp, #0
	mov r3, r4
_022EEB04:
	ldrh r1, [r7], #2
	ldr r6, [r0, #0x1c]
	mov r8, r3
	add r1, r1, r1, lsl #3
	add r6, r6, r1, lsl #1
_022EEB18:
	ldrh sb, [r6]
	ldr r1, [r2, r8, lsl #2]
	add sl, r6, #4
	strh sb, [r1]
	ldrh fp, [r6, #2]
	add sb, r1, #6
	add r6, r6, #6
	strh fp, [r1, #2]
	ldrh sl, [sl]
	strh sl, [r1, #4]
	str sb, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEB18
	add r4, r4, #1
	cmp r4, #0xa
	blt _022EEB04
	mov r3, #0
	add r2, sp, #0
_022EEB64:
	ldr r1, [r2, r3, lsl #2]
	add r1, r1, #0x7c0
	str r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blt _022EEB64
	add r2, sp, #0
	mov r3, #0
	b _022EEBD8
_022EEB88:
	ldrh r1, [r7], #2
	ldr r6, [r0, #0x1c]
	mov r8, r3
	add r1, r1, r1, lsl #3
	add r6, r6, r1, lsl #1
_022EEB9C:
	ldrh sb, [r6]
	ldr r1, [r2, r8, lsl #2]
	add sl, r6, #4
	strh sb, [r1]
	ldrh fp, [r6, #2]
	add sb, r1, #6
	add r6, r6, #6
	strh fp, [r1, #2]
	ldrh sl, [sl]
	strh sl, [r1, #4]
	str sb, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEB9C
	add r4, r4, #1
_022EEBD8:
	cmp r4, #0xc
	blt _022EEB88
	add r5, r5, #1
	cmp r5, #9
	add ip, ip, #0x80
	blt _022EEAD0
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEAAC

	arm_func_start ov11_022EEBF8
ov11_022EEBF8: ; 0x022EEBF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r6, [r0, #0x48]
	ldr r5, [r0, #0x44]
	ldr r2, [r0, #8]
	ldr r3, [r0, #0xc]
	sub r2, r2, r5
	str r2, [sp]
	ldr r4, [r0, #0x24]
	add r1, r5, r6, lsl #6
	add r1, r4, r1, lsl #1
	sub ip, r3, r6
	mov r2, #2
	mov fp, #0
_022EEC30:
	cmp ip, #0
	movgt r4, r1
	subgt ip, ip, #1
	ldrle r3, [r0, #0x44]
	ldrle r1, [r0, #0x24]
	ldr lr, [sp]
	addle r1, r1, r3, lsl #1
	ldrle ip, [r0, #0xc]
	ldr r7, [r0, #0x2c]
	movle r4, r1
	mov r6, #0
	add r3, sp, #4
_022EEC60:
	add r5, r7, r2, lsl #1
	str r5, [r3, r6, lsl #2]
	add r6, r6, #1
	cmp r6, #3
	add r2, r2, #0x20
	blt _022EEC60
	mov r3, #0
_022EEC7C:
	ldrh r5, [r4], #2
	ldr r6, [r0, #0x1c]
	mov sl, #0
	add r5, r5, r5, lsl #3
	add sb, r6, r5, lsl #1
_022EEC90:
	add r6, sp, #4
	ldr r8, [r6, sl, lsl #2]
	ldrh r5, [sb]
	add r6, sb, #4
	strh r5, [r8]
	ldrh r7, [sb, #2]
	add r5, r8, #6
	add sb, sb, #6
	strh r7, [r8, #2]
	ldrh r6, [r6]
	strh r6, [r8, #4]
	add r6, sp, #4
	str r5, [r6, sl, lsl #2]
	add sl, sl, #1
	cmp sl, #3
	blt _022EEC90
	sub lr, lr, #1
	cmp lr, #0
	ldrle lr, [r0, #8]
	add r3, r3, #1
	suble r4, r4, lr, lsl #1
	cmp r3, #0xa
	blt _022EEC7C
	mov r7, #0
	add r6, sp, #4
_022EECF4:
	ldr r5, [r6, r7, lsl #2]
	add r5, r5, #0x7c0
	str r5, [r6, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EECF4
	b _022EED78
_022EED10:
	ldrh r5, [r4], #2
	ldr r6, [r0, #0x1c]
	mov sl, #0
	add r5, r5, r5, lsl #3
	add sb, r6, r5, lsl #1
_022EED24:
	add r6, sp, #4
	ldr r8, [r6, sl, lsl #2]
	ldrh r5, [sb]
	add r6, sb, #4
	strh r5, [r8]
	ldrh r7, [sb, #2]
	add r5, r8, #6
	add sb, sb, #6
	strh r7, [r8, #2]
	ldrh r6, [r6]
	strh r6, [r8, #4]
	add r6, sp, #4
	str r5, [r6, sl, lsl #2]
	add sl, sl, #1
	cmp sl, #3
	blt _022EED24
	sub lr, lr, #1
	cmp lr, #0
	ldrle lr, [r0, #8]
	add r3, r3, #1
	suble r4, r4, lr, lsl #1
_022EED78:
	cmp r3, #0xc
	blt _022EED10
	add fp, fp, #1
	cmp fp, #9
	add r1, r1, #0x80
	blt _022EEC30
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEBF8

	arm_func_start ov11_022EED98
ov11_022EED98: ; 0x022EED98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r3, [r0, #0x44]
	ldr r2, [r0, #0x48]
	ldr r1, [r0, #0x24]
	add r3, r3, r2, lsl #6
	add r1, r1, r3, lsl #1
	ldr r2, [r0, #0x28]
	str r1, [sp, #8]
	add r1, r2, r3, lsl #1
	str r1, [sp, #4]
	mov r1, #0
	mov r3, #2
	str r1, [sp]
_022EEDD0:
	ldr sb, [r0, #0x2c]
	ldr sl, [r0, #0x30]
	ldr r5, [sp, #8]
	ldr r6, [sp, #4]
	mov r8, #0
	add r4, sp, #0x18
	add r1, sp, #0xc
_022EEDEC:
	add r7, sb, r3, lsl #1
	add r2, sl, r3, lsl #1
	str r7, [r4, r8, lsl #2]
	str r2, [r1, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	add r3, r3, #0x20
	blt _022EEDEC
	mov ip, #0
_022EEE10:
	ldrh r2, [r5], #2
	ldrh r1, [r6], #2
	ldr r4, [r0, #0x1c]
	add r2, r2, r2, lsl #3
	add lr, r4, r2, lsl #1
	ldr r2, [r0, #0x20]
	add r1, r1, r1, lsl #3
	add r4, r2, r1, lsl #1
	mov r7, #0
_022EEE34:
	add r1, sp, #0x18
	ldr r2, [r1, r7, lsl #2]
	add r1, sp, #0xc
	ldrh sl, [lr]
	ldr r1, [r1, r7, lsl #2]
	add r8, lr, #4
	strh sl, [r2]
	ldrh sl, [lr, #2]
	add fp, r2, #6
	add sb, r4, #4
	strh sl, [r2, #2]
	ldrh sl, [r8]
	add r8, r1, #6
	add lr, lr, #6
	strh sl, [r2, #4]
	ldrh r2, [r4]
	strh r2, [r1]
	ldrh r2, [r4, #2]
	add r4, r4, #6
	strh r2, [r1, #2]
	ldrh r2, [sb]
	strh r2, [r1, #4]
	add r1, sp, #0x18
	str fp, [r1, r7, lsl #2]
	add r1, sp, #0xc
	str r8, [r1, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EEE34
	add ip, ip, #1
	cmp ip, #0xa
	blt _022EEE10
	mov r8, #0
	add r7, sp, #0x18
	mov r2, r1
_022EEEC0:
	ldr r4, [r7, r8, lsl #2]
	ldr r1, [r2, r8, lsl #2]
	add r4, r4, #0x7c0
	add r1, r1, #0x7c0
	str r4, [r7, r8, lsl #2]
	str r1, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEEC0
	b _022EEF84
_022EEEE8:
	ldrh r2, [r5], #2
	ldrh r1, [r6], #2
	ldr r4, [r0, #0x1c]
	add r2, r2, r2, lsl #3
	add r4, r4, r2, lsl #1
	ldr r2, [r0, #0x20]
	add r1, r1, r1, lsl #3
	add r7, r2, r1, lsl #1
	mov r8, #0
_022EEF0C:
	add r1, sp, #0x18
	ldr r2, [r1, r8, lsl #2]
	add r1, sp, #0xc
	ldrh fp, [r4]
	ldr r1, [r1, r8, lsl #2]
	add sb, r4, #4
	strh fp, [r2]
	ldrh fp, [r4, #2]
	add lr, r2, #6
	add sl, r7, #4
	strh fp, [r2, #2]
	ldrh fp, [sb]
	add sb, r1, #6
	add r4, r4, #6
	strh fp, [r2, #4]
	ldrh r2, [r7]
	strh r2, [r1]
	ldrh r2, [r7, #2]
	add r7, r7, #6
	strh r2, [r1, #2]
	ldrh r2, [sl]
	strh r2, [r1, #4]
	add r1, sp, #0x18
	str lr, [r1, r8, lsl #2]
	add r1, sp, #0xc
	str sb, [r1, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEF0C
	add ip, ip, #1
_022EEF84:
	cmp ip, #0xc
	blt _022EEEE8
	ldr r1, [sp]
	add r1, r1, #1
	str r1, [sp]
	cmp r1, #9
	ldr r1, [sp, #8]
	add r1, r1, #0x80
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0x80
	str r1, [sp, #4]
	blt _022EEDD0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EED98

	arm_func_start ov11_022EEFC0
ov11_022EEFC0: ; 0x022EEFC0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r7, [r0, #0x48]
	ldr r6, [r0, #0x44]
	ldr r1, [r0, #0x28]
	add r5, r6, r7, lsl #6
	add r1, r1, r5, lsl #1
	ldr r4, [r0, #0x24]
	ldr r2, [r0, #8]
	str r1, [sp, #8]
	sub r1, r2, r6
	str r1, [sp]
	mov r1, #0
	ldr r3, [r0, #0xc]
	add fp, r4, r5, lsl #1
	sub r5, r3, r7
	mov lr, #2
	str r1, [sp, #4]
_022EF008:
	cmp r5, #0
	ldr r6, [sp]
	movgt r1, fp
	ldrgt r2, [sp, #8]
	subgt r5, r5, #1
	bgt _022EF044
	ldr r3, [r0, #0x44]
	ldr r1, [r0, #0x24]
	ldr r2, [r0, #0x28]
	add r1, r1, r3, lsl #1
	str r1, [sp, #8]
	add fp, r2, r3, lsl #1
	ldr r5, [r0, #0xc]
	ldr r2, [sp, #8]
	mov r1, fp
_022EF044:
	ldr r4, [r0, #0x2c]
	ldr r7, [r0, #0x30]
	mov r3, #0
	add sl, sp, #0x50
	add r8, sp, #0x44
_022EF058:
	add sb, r4, lr, lsl #1
	str sb, [sl, r3, lsl #2]
	add sb, r7, lr, lsl #1
	str sb, [r8, r3, lsl #2]
	add lr, lr, #0x20
	add r3, r3, #1
	cmp r3, #3
	blt _022EF058
	mov r4, #0
_022EF07C:
	ldrh r7, [r1], #2
	ldrh r3, [r2], #2
	ldr sb, [r0, #0x1c]
	add r7, r7, r7, lsl #3
	add r7, sb, r7, lsl #1
	ldr r8, [r0, #0x20]
	add r3, r3, r3, lsl #3
	add r8, r8, r3, lsl #1
	mov sb, #0
_022EF0A0:
	ldrh sl, [r7]
	add r3, sp, #0x50
	ldr ip, [r3, sb, lsl #2]
	str sl, [sp, #0x2c]
	add sl, r7, #4
	add r3, sp, #0x44
	str sl, [sp, #0xc]
	add sl, r8, #4
	str sl, [sp, #0x10]
	ldr r3, [r3, sb, lsl #2]
	ldr sl, [sp, #0x2c]
	strh sl, [ip]
	ldrh sl, [r7, #2]
	add r7, r7, #6
	str sl, [sp, #0x30]
	add sl, ip, #6
	str sl, [sp, #0x14]
	ldr sl, [sp, #0x30]
	strh sl, [ip, #2]
	ldr sl, [sp, #0xc]
	ldrh sl, [sl]
	str sl, [sp, #0x34]
	add sl, r3, #6
	str sl, [sp, #0x18]
	ldr sl, [sp, #0x34]
	strh sl, [ip, #4]
	ldrh sl, [r8]
	strh sl, [r3]
	ldrh sl, [r8, #2]
	add r8, r8, #6
	strh sl, [r3, #2]
	ldr sl, [sp, #0x10]
	ldrh sl, [sl]
	strh sl, [r3, #4]
	ldr sl, [sp, #0x14]
	add r3, sp, #0x50
	str sl, [r3, sb, lsl #2]
	ldr sl, [sp, #0x18]
	add r3, sp, #0x44
	str sl, [r3, sb, lsl #2]
	add sb, sb, #1
	cmp sb, #3
	blt _022EF0A0
	sub r6, r6, #1
	cmp r6, #0
	ldrle r6, [r0, #8]
	add r4, r4, #1
	suble r1, r1, r6, lsl #1
	suble r2, r2, r6, lsl #1
	cmp r4, #0xa
	blt _022EF07C
	mov r7, #0
	add r3, sp, #0x50
	add sb, sp, #0x44
_022EF178:
	ldr sl, [r3, r7, lsl #2]
	ldr r8, [sb, r7, lsl #2]
	add sl, sl, #0x7c0
	str sl, [r3, r7, lsl #2]
	add r8, r8, #0x7c0
	str r8, [sb, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EF178
	b _022EF288
_022EF1A0:
	ldrh r7, [r1], #2
	ldrh r3, [r2], #2
	ldr sb, [r0, #0x1c]
	add r7, r7, r7, lsl #3
	add r7, sb, r7, lsl #1
	ldr r8, [r0, #0x20]
	add r3, r3, r3, lsl #3
	add r8, r8, r3, lsl #1
	mov sb, #0
_022EF1C4:
	ldrh sl, [r7]
	add r3, sp, #0x50
	ldr ip, [r3, sb, lsl #2]
	str sl, [sp, #0x38]
	add sl, r7, #4
	add r3, sp, #0x44
	str sl, [sp, #0x1c]
	add sl, r8, #4
	str sl, [sp, #0x20]
	ldr r3, [r3, sb, lsl #2]
	ldr sl, [sp, #0x38]
	strh sl, [ip]
	ldrh sl, [r7, #2]
	add r7, r7, #6
	str sl, [sp, #0x3c]
	add sl, ip, #6
	str sl, [sp, #0x24]
	ldr sl, [sp, #0x3c]
	strh sl, [ip, #2]
	ldr sl, [sp, #0x1c]
	ldrh sl, [sl]
	str sl, [sp, #0x40]
	add sl, r3, #6
	str sl, [sp, #0x28]
	ldr sl, [sp, #0x40]
	strh sl, [ip, #4]
	ldrh sl, [r8]
	strh sl, [r3]
	ldrh sl, [r8, #2]
	add r8, r8, #6
	strh sl, [r3, #2]
	ldr sl, [sp, #0x20]
	ldrh sl, [sl]
	strh sl, [r3, #4]
	ldr sl, [sp, #0x24]
	add r3, sp, #0x50
	str sl, [r3, sb, lsl #2]
	ldr sl, [sp, #0x28]
	add r3, sp, #0x44
	str sl, [r3, sb, lsl #2]
	add sb, sb, #1
	cmp sb, #3
	blt _022EF1C4
	sub r6, r6, #1
	cmp r6, #0
	ldrle r6, [r0, #8]
	add r4, r4, #1
	suble r1, r1, r6, lsl #1
	suble r2, r2, r6, lsl #1
_022EF288:
	cmp r4, #0xc
	blt _022EF1A0
	ldr r1, [sp, #4]
	add fp, fp, #0x80
	add r1, r1, #1
	str r1, [sp, #4]
	cmp r1, #9
	ldr r1, [sp, #8]
	add r1, r1, #0x80
	str r1, [sp, #8]
	blt _022EF008
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEFC0

	arm_func_start ov11_022EF2BC
ov11_022EF2BC: ; 0x022EF2BC
	add r0, r0, r1, lsl #3
	ldr r1, [r0, #0x200]
	ldr r0, [r0, #0x204]
	str r1, [r2]
	str r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF2BC

	arm_func_start ov11_022EF2D4
ov11_022EF2D4: ; 0x022EF2D4
	ldr r3, [r2]
	ldr r2, [r2, #4]
	add r0, r0, r1, lsl #3
	str r3, [r0, #0x200]
	str r2, [r0, #0x204]
	bx lr
	arm_func_end ov11_022EF2D4

	arm_func_start ov11_022EF2EC
ov11_022EF2EC: ; 0x022EF2EC
	add r3, r0, #0x210
	mov r0, #0x54
	ldr ip, [r2]
	mla r0, r1, r0, r3
	cmp ip, #0
	bge _022EF334
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF328
_022EF310:
	ldr r3, [r2]
	ldr r1, [r0, #0x10]
	adds r1, r3, r1
	str r1, [r2]
	bmi _022EF310
	b _022EF380
_022EF328:
	mov r1, #0
	str r1, [r2]
	b _022EF380
_022EF334:
	ldr r3, [r0, #0x10]
	cmp ip, r3
	blt _022EF380
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF36C
_022EF34C:
	ldr r3, [r2]
	ldr r1, [r0, #0x10]
	sub r3, r3, r1
	str r3, [r2]
	ldr r1, [r0, #0x10]
	cmp r3, r1
	bge _022EF34C
	b _022EF380
_022EF36C:
	cmp r3, #0
	subgt r1, r3, #1
	strgt r1, [r2]
	movle r1, #0
	strle r1, [r2]
_022EF380:
	ldr r1, [r2, #4]
	cmp r1, #0
	bge _022EF3BC
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF3B0
_022EF398:
	ldr r3, [r2, #4]
	ldr r1, [r0, #0x14]
	adds r1, r3, r1
	str r1, [r2, #4]
	bmi _022EF398
	bx lr
_022EF3B0:
	mov r0, #0
	str r0, [r2, #4]
	bx lr
_022EF3BC:
	ldr r3, [r0, #0x14]
	cmp r1, r3
	bxlt lr
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF3F4
_022EF3D4:
	ldr r3, [r2, #4]
	ldr r1, [r0, #0x14]
	sub r3, r3, r1
	str r3, [r2, #4]
	ldr r1, [r0, #0x14]
	cmp r3, r1
	bge _022EF3D4
	bx lr
_022EF3F4:
	cmp r3, #0
	subgt r0, r3, #1
	strgt r0, [r2, #4]
	movle r0, #0
	strle r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF2EC

	arm_func_start ov11_022EF40C
ov11_022EF40C: ; 0x022EF40C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, #0
	add r5, sp, #0
	mov r4, #1
	b _022EF484
_022EF430:
	add r0, r8, r6, lsl #3
	ldr r3, [r0, #0x200]
	ldr ip, [r0, #0x204]
	mov r0, sb
	str r3, [sp]
	str ip, [sp, #4]
	ldr r2, [r7]
	mov r1, r4
	add r2, r3, r2
	str r2, [sp]
	ldr r3, [r7, #4]
	mov r2, r5
	add r3, ip, r3
	str r3, [sp, #4]
	bl ov11_022EF2EC
	add r2, sb, r6, lsl #3
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r6, r6, #1
	str r1, [r2, #0x200]
	str r0, [r2, #0x204]
_022EF484:
	ldr r0, [sb, #0x1fc]
	cmp r6, r0
	blt _022EF430
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov11_022EF40C

	arm_func_start ov11_022EF498
ov11_022EF498: ; 0x022EF498
	mov r3, #0
	str r3, [r1]
	str r3, [r1, #4]
	ldrb r1, [r0, #0x1e0]
	mov r1, r1, lsl #0xb
	str r1, [r2]
	ldrb r0, [r0, #0x1e1]
	mov r0, r0, lsl #0xb
	str r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF498

	arm_func_start ov11_022EF4C0
ov11_022EF4C0: ; 0x022EF4C0
	stmdb sp!, {r4, lr}
	ldr lr, [r0, #0x2d8]
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr ip, [r2]
	ldr r0, [r2, #4]
	ldr r4, [r3, #4]
	add r0, ip, r0, lsl #8
	add r0, r0, #5
	add r0, r0, #0x400
	add r2, lr, r0
	b _022EF52C
_022EF4F4:
	mov lr, r2
	ldr ip, [r3]
	b _022EF51C
_022EF500:
	ldrb r0, [lr], #1
	and r0, r0, r1
	and r0, r0, #0xff
	cmp r0, r1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	sub ip, ip, #1
_022EF51C:
	cmp ip, #0
	bgt _022EF500
	add r2, r2, #0x100
	sub r4, r4, #1
_022EF52C:
	cmp r4, #0
	bgt _022EF4F4
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EF4C0

	arm_func_start ov11_022EF53C
ov11_022EF53C: ; 0x022EF53C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r1, r4
	mov r0, #2
	bl sub_020091B0
	mov r1, r4
	mov r0, #3
	bl sub_020091B0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EF53C

	arm_func_start ov11_022EF594
ov11_022EF594: ; 0x022EF594
	stmdb sp!, {r3, lr}
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_022EF5A4: ; jump table
	b _022EF5F4 ; case 0
	b _022EF604 ; case 1
	b _022EF610 ; case 2
	b _022EF61C ; case 3
	b _022EF634 ; case 4
	b _022EF628 ; case 5
	b _022EF640 ; case 6
	b _022EF64C ; case 7
	b _022EF664 ; case 8
	b _022EF658 ; case 9
	b _022EF670 ; case 10
	b _022EF67C ; case 11
	b _022EF688 ; case 12
	b _022EF694 ; case 13
	b _022EF6A0 ; case 14
	b _022EF6AC ; case 15
	b _022EF6C0 ; case 16
	b _022EF6D4 ; case 17
	b _022EF6E4 ; case 18
	b _022EF6F0 ; case 19
_022EF5F4:
	mov r1, #3
	mov r2, #0
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF604:
	mov r1, #1
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF610:
	mov r1, #2
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF61C:
	mov r1, #3
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF628:
	mov r1, #3
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF634:
	mov r1, #4
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF640:
	mov r1, #4
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF64C:
	mov r1, #6
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF658:
	mov r1, #6
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF664:
	mov r1, #7
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF670:
	mov r1, #7
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF67C:
	mov r1, #5
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF688:
	mov r1, #5
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF694:
	mov r1, #8
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF6A0:
	mov r1, #8
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF6AC:
	mov r1, r2, lsl #0x10
	mov r2, r1, asr #0x10
	mov r1, #5
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
_022EF6C0:
	mov r1, r2, lsl #0x10
	mov r2, r1, asr #0x10
	mov r1, #8
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
_022EF6D4:
	mov r1, r2
	mov r0, #1
	bl ov11_022F2B00
	ldmia sp!, {r3, pc}
_022EF6E4:
	mov r1, #9
	bl ov11_022E9E74
	ldmia sp!, {r3, pc}
_022EF6F0:
	mov r1, #0xa
	mov r2, #0
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022EF594

	arm_func_start ov11_022EF700
ov11_022EF700: ; 0x022EF700
	ldr ip, _022EF708 ; =ov11_022E9FA4
	bx ip
	.align 2, 0
_022EF708: .word ov11_022E9FA4
	arm_func_end ov11_022EF700

	arm_func_start ov11_022EF70C
ov11_022EF70C: ; 0x022EF70C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sl, r0
	ldrsh r0, [sl]
	sub r0, r0, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	bhi _022EF800
	add r6, sl, #0x210
	mov r8, #0
	add r4, sl, #0x200
	ldr r5, _022EFB64 ; =0x02324CBC
	mov fp, #0x1c
	b _022EF7BC
_022EF750:
	ldr r1, _022EFB68 ; =0x02320C10
	mov r0, r6
	bl ov11_022EE9B0
	ldrsh r1, [r6, #2]
	ldrsh r0, [r4, #0xbe]
	mov sb, #0
	add r7, r1, r0
	b _022EF7A8
_022EF770:
	ldrb r0, [sl, #0x2bc]
	add r1, r6, #0x4c
	cmp r0, #0
	ldr r0, [r5]
	bne _022EF790
	mla r0, r7, fp, r0
	bl sub_0200B3C0
	b _022EF7A0
_022EF790:
	add r2, r0, #0x38
	mov r0, #0x1c
	mla r0, r7, r0, r2
	bl sub_0200B3C0
_022EF7A0:
	add sb, sb, #1
	add r7, r7, #1
_022EF7A8:
	ldrsh r0, [r6, #4]
	cmp sb, r0
	blt _022EF770
	add r8, r8, #1
	add r6, r6, #0x54
_022EF7BC:
	ldr r0, [sl, #0x1fc]
	cmp r8, r0
	blt _022EF750
	mov r0, #0
	strb r0, [sl, #0x1c1]
	ldrsh r0, [sl]
	cmp r0, #6
	ldreqb r0, [sl, #0x1c0]
	cmpeq r0, #0
	bne _022EF7F4
	bl sub_020163AC
	cmp r0, #1
	moveq r0, #1
	streqb r0, [sl, #0x1c1]
_022EF7F4:
	mov r0, #1
	strb r0, [sl, #0x2ba]
	b _022EFB5C
_022EF800:
	add fp, sl, #0x100
	ldrsh r1, [fp, #0xbe]
	mvn r0, #0
	cmp r1, r0
	beq _022EFB5C
	ldrsh r0, [fp, #0xec]
	cmp r0, #0
	beq _022EF9C4
	ldrb r0, [sl, #0x1ee]
	cmp r0, #0
	bne _022EF9C4
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc2]
	str r0, [sp, #0xc]
	ldr r0, _022EFB64 ; =0x02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov sb, #0
	mov r0, #0x28
	str sb, [sp, #8]
	smulbb r4, r2, r0
	mov r1, r1, lsl #0x14
	ldrb r0, [sl, #0x1f9]
	ldr r7, [sl, #0x1f4]
	add r5, r3, #0x98
	add r6, sl, #4
	mov r8, r1, lsr #0x10
	str r0, [sp, #4]
	b _022EF974
_022EF874:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _022EF95C
	ldrsh r0, [r6, #2]
	sub r0, r0, #1
	strh r0, [r6, #2]
	ldrsh r0, [r6, #2]
	cmp r0, #0
	bgt _022EF954
	ldrsh r0, [r6]
	sub r0, r0, #1
	strh r0, [r6]
	ldrsh r0, [r6]
	cmp r0, #0
	bgt _022EF8F4
	ldrb r0, [sl, #0x1f9]
	cmp r0, #0
	beq _022EF8D8
	ldrsh r0, [r7]
	strh r0, [r6, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r6]
	ldr r0, [r6, #4]
	str r0, [r6, #8]
	b _022EF904
_022EF8D8:
	mov r0, #0
	strh r0, [r6]
	mov r0, r0
	strh r0, [r6, #2]
	mov r0, #0
	str r0, [r6, #8]
	b _022EF904
_022EF8F4:
	ldrsh r1, [r7]
	mov r0, #1
	str r0, [sp, #4]
	strh r1, [r6, #2]
_022EF904:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _022EF95C
	mov r0, #1
	str r0, [sp, #8]
	ldr r2, _022EFB6C ; =0x02320BF4
	add r0, r5, r4
	mov r1, r8
	bl sub_0200A590
	add r1, r8, #1
	mov r1, r1, lsl #0x10
	ldr r2, [r6, #8]
	add r0, r5, r4
	mov r1, r1, lsr #0x10
	mov r3, #0xf
	bl sub_0200A5B0
	ldr r0, [r6, #8]
	add r0, r0, #0x3c
	str r0, [r6, #8]
	b _022EF95C
_022EF954:
	mov r0, #1
	str r0, [sp, #4]
_022EF95C:
	add sb, sb, #1
	add r6, r6, #0xc
	add r7, r7, #4
	add r0, r8, #0x10
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
_022EF974:
	ldrsh r0, [fp, #0xea]
	cmp sb, r0
	ldrlt r0, [sp, #0xc]
	ldrltsh r0, [r0, #0xc4]
	cmplt sb, r0
	blt _022EF874
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022EF9A0
	add r0, r5, r4
	bl sub_0200A504
_022EF9A0:
	ldrb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	ldrb r0, [sl, #0x1f8]
	cmp r0, #0
	movne r0, #0
	strneb r0, [sl, #0x1fb]
	ldreq r0, [sp, #4]
	streqb r0, [sl, #0x1fb]
	b _022EF9CC
_022EF9C4:
	mov r0, #0
	strb r0, [sl, #0x1fb]
_022EF9CC:
	ldrb r0, [sl, #0x1bc]
	cmp r0, #0
	beq _022EF9F0
	mov r1, #0
	add r0, sl, #0x1a0
	mov r2, #0xa0
	mov r3, #0x20
	str r1, [sp]
	bl sub_02063830
_022EF9F0:
	ldrb r0, [sl, #0x1ee]
	cmp r0, #0
	bne _022EFAA4
	mov r1, #0
	add r0, sl, #0xc4
	mov r6, r1
	mov r5, #1
	mov r3, #0x2c
_022EFA10:
	mul r2, r1, r3
	ldrb r4, [r0, r2]
	add r2, r0, r2
	cmp r4, #0
	beq _022EFA98
	ldrsh r7, [r2, #4]
	sub r4, r7, #1
	strh r4, [r2, #4]
	cmp r7, #0
	bgt _022EFA98
	ldr r4, [r2, #0x18]
	add r4, r4, #4
	str r4, [r2, #0x18]
	ldr r4, [r2, #0x28]
	ldr r7, [r2, #0x20]
	bic r4, r4, #1
	add r4, r7, r4
	str r4, [r2, #0x20]
	ldrsh r4, [r2, #2]
	add r4, r4, #1
	strh r4, [r2, #2]
	ldr r4, [r2, #0x10]
	ldrsh r7, [r2, #2]
	ldrsh r4, [r4, #2]
	cmp r7, r4
	ldrge r4, [r2, #0x14]
	strge r4, [r2, #0x18]
	ldrge r4, [r2, #0x1c]
	strge r4, [r2, #0x20]
	strgeh r6, [r2, #2]
	strb r5, [r2, #1]
	ldr r4, [r2, #0x18]
	ldr r4, [r4]
	strh r4, [r2, #4]
_022EFA98:
	add r1, r1, #1
	cmp r1, #4
	blt _022EFA10
_022EFAA4:
	ldrb r0, [sl, #0x1c0]
	cmp r0, #0
	bne _022EFB5C
	add r5, sl, #0x210
	add r6, sl, #0x200
	mov r8, #0
	b _022EFB48
_022EFAC0:
	mov r0, r5
	mov r1, r6
	bl ov11_022EE9B0
	ldr r1, [r5, #0x18]
	mov r0, r5
	blx r1
	add r0, sl, #0x200
	ldrsh r1, [r5, #2]
	ldrsh r0, [r0, #0xbe]
	mov sb, #0
	ldr r4, _022EFB64 ; =0x02324CBC
	add r7, r1, r0
	mov fp, #0x1c
	b _022EFB30
_022EFAF8:
	ldrb r0, [sl, #0x2bc]
	add r1, r5, #0x4c
	cmp r0, #0
	ldr r0, [r4]
	bne _022EFB18
	mla r0, r7, fp, r0
	bl sub_0200B3C0
	b _022EFB28
_022EFB18:
	add r2, r0, #0x38
	mov r0, #0x1c
	mla r0, r7, r0, r2
	bl sub_0200B3C0
_022EFB28:
	add sb, sb, #1
	add r7, r7, #1
_022EFB30:
	ldrsh r0, [r5, #4]
	cmp sb, r0
	blt _022EFAF8
	add r8, r8, #1
	add r5, r5, #0x54
	add r6, r6, #8
_022EFB48:
	ldr r0, [sl, #0x1fc]
	cmp r8, r0
	blt _022EFAC0
	mov r0, #1
	strb r0, [sl, #0x2ba]
_022EFB5C:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EFB64: .word 0x02324CBC
_022EFB68: .word 0x02320C10
_022EFB6C: .word 0x02320BF4
	arm_func_end ov11_022EF70C

	arm_func_start ov11_022EFB70
ov11_022EFB70: ; 0x022EFB70
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	ldrsh r0, [r7]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #6
	beq _022EFBD4
	mov r5, #0
	add r4, r7, #0xc4
	mov sl, r5
	mov sb, #1
	mov r8, #0x2c
_022EFBA0:
	mla r6, r5, r8, r4
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _022EFBC8
	ldr r0, [r6, #0x24]
	ldr r1, [r6, #0x20]
	ldr r2, [r6, #0x28]
	bl Memcpy32
	strb sl, [r6, #1]
	strb sb, [r7, #0x2ba]
_022EFBC8:
	add r5, r5, #1
	cmp r5, #4
	blt _022EFBA0
_022EFBD4:
	ldrb r0, [r7, #0x2ba]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add sb, r7, #0x200
	ldrsh r0, [sb, #0xc0]
	ldrsh r4, [sb, #0xbe]
	mov r5, #0
	cmp r0, #0
	ble _022EFC44
	mov r6, #0x1c
	ldr sl, _022EFC50 ; =0x02324CBC
	mov r8, r6
	b _022EFC38
_022EFC08:
	ldrb r0, [r7, #0x2bc]
	cmp r0, #0
	ldr r0, [sl]
	bne _022EFC24
	mla r0, r4, r8, r0
	bl sub_0200B330
	b _022EFC30
_022EFC24:
	add r0, r0, #0x38
	mla r0, r4, r6, r0
	bl sub_0200B330
_022EFC30:
	add r5, r5, #1
	add r4, r4, #1
_022EFC38:
	ldrsh r0, [sb, #0xc0]
	cmp r5, r0
	blt _022EFC08
_022EFC44:
	mov r0, #0
	strb r0, [r7, #0x2ba]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022EFC50: .word 0x02324CBC
	arm_func_end ov11_022EFB70

	arm_func_start ov11_022EFC54
ov11_022EFC54: ; 0x022EFC54
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov10_022BF864
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl sub_0200A510
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A180
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl sub_0200A510
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A180
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B33C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFCE0: .word 0x02324CBC
	arm_func_end ov11_022EFC54

	arm_func_start ov11_022EFCE4
ov11_022EFCE4: ; 0x022EFCE4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _022EFD58 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A184
	ldr r0, _022EFD58 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A184
	ldr r0, _022EFD58 ; =0x02324CBC
	ldr r0, [r0]
	bl sub_0200B340
	ldr r0, _022EFD58 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B340
	ldr r0, _022EFD58 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B340
	ldr r0, _022EFD58 ; =0x02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B340
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFD58: .word 0x02324CBC
	arm_func_end ov11_022EFCE4

	arm_func_start ov11_022EFD5C
ov11_022EFD5C: ; 0x022EFD5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrb r1, [r5, #0x2bc]
	mov r2, #0
	str r5, [r0]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
	str r2, [r0, #0x18]
	add r0, r5, #0x100
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	ldrsh r0, [r0, #0xbe]
	and r4, r1, #0xff
	cmp r0, #0x160
	bgt _022EFEF0
	bge _022F0114
	ldr r3, _022F03B8 ; =0x00000113
	cmp r0, r3
	bgt _022EFE44
	sub r1, r3, #1
	cmp r0, r1
	blt _022EFDD4
	beq _022EFFF4
	cmp r0, r3
	beq _022F038C
	b _022F03A8
_022EFDD4:
	cmp r0, #0xdc
	bgt _022EFE04
	bge _022EFFF4
	cmp r0, #0x85
	bgt _022EFDF8
	bge _022EFFF4
	cmp r0, #8
	beq _022F0008
	b _022F03A8
_022EFDF8:
	cmp r0, #0xd4
	beq _022EFFF4
	b _022F03A8
_022EFE04:
	cmp r0, #0x10c
	bgt _022EFE34
	bge _022F03B0
	cmp r0, #0xf5
	bgt _022F03A8
	cmp r0, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r0, #0xf4
	cmpne r0, #0xf5
	beq _022F0028
	b _022F03A8
_022EFE34:
	sub r1, r3, #2
	cmp r0, r1
	beq _022F0114
	b _022F03A8
_022EFE44:
	add r1, r3, #0x1e
	cmp r0, r1
	bgt _022EFEC0
	add r1, r3, #0x12
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022EFE94
_022EFE60: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022EFE94:
	ldr r1, _022F03BC ; =0x00000123
	cmp r0, r1
	bgt _022EFEB4
	bge _022F0054
	sub r1, r1, #1
	cmp r0, r1
	beq _022F0038
	b _022F03A8
_022EFEB4:
	cmp r0, #0x124
	beq _022F0054
	b _022F03A8
_022EFEC0:
	add r1, r3, #0x44
	cmp r0, r1
	bgt _022EFEE0
	bge _022F0008
	add r1, r3, #0x43
	cmp r0, r1
	beq _022F0064
	b _022F03A8
_022EFEE0:
	add r1, r3, #0x4c
	cmp r0, r1
	beq _022F00BC
	b _022F03A8
_022EFEF0:
	ldr r3, _022F03C0 ; =0x00000195
	cmp r0, r3
	bgt _022EFF64
	bge _022EFFF4
	cmp r0, #0x178
	bgt _022EFF38
	bge _022EFFF4
	sub r1, r3, #0x26
	cmp r0, r1
	bgt _022EFF2C
	bge _022F0028
	sub r1, r3, #0x2b
	cmp r0, r1
	beq _022F0028
	b _022F03A8
_022EFF2C:
	cmp r0, #0x170
	beq _022F0028
	b _022F03A8
_022EFF38:
	sub r1, r3, #0xe
	cmp r0, r1
	bgt _022EFF58
	bge _022EFFF4
	sub r1, r3, #0x13
	cmp r0, r1
	beq _022F0028
	b _022F03A8
_022EFF58:
	cmp r0, #0x190
	beq _022F0018
	b _022F03A8
_022EFF64:
	add r1, r3, #0x16
	cmp r0, r1
	bgt _022EFFA0
	bge _022F0038
	add r1, r3, #0xc
	cmp r0, r1
	bgt _022EFF90
	bge _022F0038
	cmp r0, #0x1a0
	beq _022F0038
	b _022F03A8
_022EFF90:
	add r1, r3, #0x10
	cmp r0, r1
	beq _022EFFF4
	b _022F03A8
_022EFFA0:
	cmp r0, #0x1b0
	bgt _022EFFB8
	bge _022F01D0
	cmp r0, #0x1ac
	beq _022F0038
	b _022F03A8
_022EFFB8:
	add r1, r3, #0x1c
	sub r0, r0, r1
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022EFFCC: ; jump table
	b _022F01D0 ; case 0
	b _022F0244 ; case 1
	b _022F0228 ; case 2
	b _022F0244 ; case 3
	b _022F03A8 ; case 4
	b _022F02A4 ; case 5
	b _022F0304 ; case 6
	b _022F0314 ; case 7
	b _022F03A8 ; case 8
	b _022F032C ; case 9
_022EFFF4:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl ov11_022EE5EC
	b _022F03B0
_022F0008:
	mov r0, r5
	mov r1, #2
	bl ov11_022EE620
	b _022F03B0
_022F0018:
	mov r0, r5
	mov r1, #4
	bl ov11_022EE620
	b _022F03B0
_022F0028:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	b _022F03B0
_022F0038:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	b _022F03B0
_022F0048:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
_022F0054:
	mov r0, r5
	mov r1, #4
	bl ov11_022EE620
	b _022F03B0
_022F0064:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x80
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F00BC:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x40
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F0114:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x40
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F016C:
	mov r0, r5
	mov r1, #1
	bl ov11_022EE5EC
	mov r0, r5
	mov r1, #1
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0
	mov r1, #0x80
	bl sub_020094C4
	b _022F03B0
_022F01D0:
	mov r0, r5
	mov r1, #2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	b _022F03B0
_022F0228:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
	mov r1, r4
	mov r0, #2
	bl sub_02009194
	b _022F03B0
_022F0244:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	mov r0, #1
	bl ov11_022F294C
	b _022F03B0
_022F02A4:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	mov r0, #2
	bl ov11_022F294C
	b _022F03B0
_022F0304:
	mov r0, r5
	mov r1, #3
	bl ov11_022EE620
	b _022F03B0
_022F0314:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, #0
	bl ov11_022F294C
	b _022F03B0
_022F032C:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x5a
	mov r1, #0x1e
	bl sub_020094C4
	mov r0, #3
	bl ov11_022F294C
	b _022F03B0
_022F038C:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
	mov r1, r4
	mov r0, #2
	bl sub_02009194
	b _022F03B0
_022F03A8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022F03B0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F03B8: .word 0x00000113
_022F03BC: .word 0x00000123
_022F03C0: .word 0x00000195
	arm_func_end ov11_022EFD5C

	arm_func_start ov11_022F03C4
ov11_022F03C4: ; 0x022F03C4
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	str r3, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	str r3, [r0, #0xc]
	str r2, [r0, #0x10]
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x18]
	str r2, [r0, #0x14]
	str r1, [r0, #0x18]
	bx lr
	arm_func_end ov11_022F03C4

	arm_func_start ov11_022F03F8
ov11_022F03F8: ; 0x022F03F8
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end ov11_022F03F8

	arm_func_start ov11_022F040C
ov11_022F040C: ; 0x022F040C
	ldr r3, [r1]
	ldr r2, [r1, #4]
	mov r1, #0
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ov11_022F040C

	arm_func_start ov11_022F042C
ov11_022F042C: ; 0x022F042C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r6, r0
	ldr r4, [r6]
	ldr r0, _022F11D4 ; =0x0000016A
	add r2, r4, #0x100
	ldrsh r2, [r2, #0xbe]
	mov r5, r1
	cmp r2, r0
	bgt _022F054C
	bge _022F07FC
	sub r1, r0, #0x47
	cmp r2, r1
	bgt _022F04D4
	bge _022F0C44
	cmp r2, #0x10c
	bgt _022F04A8
	bge _022F0FB4
	cmp r2, #8
	bgt _022F0484
	beq _022F0634
	b _022F11C0
_022F0484:
	cmp r2, #0xf5
	bgt _022F11C0
	cmp r2, #0xf3
	blt _022F11C0
	cmpne r2, #0xf4
	beq _022F07FC
	cmp r2, #0xf5
	beq _022F0AF0
	b _022F11C0
_022F04A8:
	sub r1, r0, #0x59
	cmp r2, r1
	bgt _022F04C4
	sub r0, r0, #0x59
	cmp r2, r0
	beq _022F0F04
	b _022F11C0
_022F04C4:
	sub r0, r0, #0x48
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F04D4:
	sub r1, r0, #0x13
	cmp r2, r1
	bgt _022F0524
	bge _022F0634
	sub r0, r0, #0x41
	cmp r2, r0
	bgt _022F0514
	subs r0, r2, #0x124
	addpl pc, pc, r0, lsl #2
	b _022F11C0
_022F04FC: ; jump table
	b _022F0C44 ; case 0
	b _022F0DA4 ; case 1
	b _022F0C44 ; case 2
	b _022F11C0 ; case 3
	b _022F11C0 ; case 4
	b _022F0DA4 ; case 5
_022F0514:
	ldr r0, _022F11D8 ; =0x00000156
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0524:
	sub r1, r0, #0xb
	cmp r2, r1
	bgt _022F0540
	sub r0, r0, #0xb
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0540:
	cmp r2, #0x160
	beq _022F0F04
	b _022F11C0
_022F054C:
	add r1, r0, #0x37
	cmp r2, r1
	bgt _022F05B0
	bge _022F0C44
	add r1, r0, #0x18
	cmp r2, r1
	bgt _022F0594
	bge _022F09F4
	add r1, r0, #5
	cmp r2, r1
	bgt _022F0588
	add r0, r0, #5
	cmp r2, r0
	beq _022F07FC
	b _022F11C0
_022F0588:
	cmp r2, #0x170
	beq _022F0700
	b _022F11C0
_022F0594:
	cmp r2, #0x190
	bgt _022F05A4
	beq _022F08F8
	b _022F11C0
_022F05A4:
	cmp r2, #0x1a0
	beq _022F0C44
	b _022F11C0
_022F05B0:
	cmp r2, #0x1b0
	bgt _022F05E4
	bge _022F1090
	add r1, r0, #0x41
	cmp r2, r1
	bgt _022F05D8
	add r0, r0, #0x41
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F05D8:
	cmp r2, #0x1ac
	beq _022F0C44
	b _022F11C0
_022F05E4:
	add r1, r0, #0x48
	cmp r2, r1
	bgt _022F0604
	bge _022F1128
	add r0, r0, #0x47
	cmp r2, r0
	beq _022F1090
	b _022F11C0
_022F0604:
	add r1, r0, #0x50
	cmp r2, r1
	bgt _022F11C0
	cmp r2, #0x1b4
	blt _022F11C0
	beq _022F1128
	add r1, r0, #0x4c
	cmp r2, r1
	addne r0, r0, #0x50
	cmpne r2, r0
	beq _022F0FF8
	b _022F11C0
_022F0634:
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #0
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x78
	add r0, r1, r0
	str r0, [sp, #0x78]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	mov r0, r4
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x7c]
	bl ov11_022EF2EC
	add r2, sp, #0x78
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F0700:
	ldr r0, [r5]
	add r2, sp, #0x70
	str r0, [sp, #0x70]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x74]
	bl ov11_022EF2EC
	add r2, sp, #0x70
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x70]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x70
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x74]
	bl ov11_022EF2EC
	add r2, sp, #0x70
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F07FC:
	ldr r0, [r5]
	add r2, sp, #0x68
	str r0, [sp, #0x68]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x6c]
	bl ov11_022EF2EC
	add r2, sp, #0x68
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x68]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x68
	add r3, r3, r1
	mov r1, #1
	str r3, [sp, #0x6c]
	bl ov11_022EF2EC
	add r2, sp, #0x68
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F08F8:
	ldr r0, [r5]
	add r2, sp, #0x60
	str r0, [sp, #0x60]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x64]
	bl ov11_022EF2EC
	add r2, sp, #0x60
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	add r1, ip, r1, asr #8
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	add r1, ip, r1, asr #8
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #24
	add r3, ip, r3, ror #24
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #24
	add r3, ip, r3, ror #24
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x60]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x60
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x64]
	bl ov11_022EF2EC
	add r2, sp, #0x60
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F09F4:
	ldr r0, [r5]
	add r2, sp, #0x58
	str r0, [sp, #0x58]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x5c]
	bl ov11_022EF2EC
	add r2, sp, #0x58
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x58]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x58
	add r3, r3, r1
	mov r1, #1
	str r3, [sp, #0x5c]
	bl ov11_022EF2EC
	add r2, sp, #0x58
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0AF0:
	ldr r0, [r5]
	add r2, sp, #0x50
	str r0, [sp, #0x50]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x54]
	bl ov11_022EF2EC
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #4]
	add r2, r1, r0
	str r2, [r6, #0xc]
	mov r0, r2, asr #2
	ldr r1, [r6, #0x14]
	add r0, r2, r0, lsr #29
	add r0, r1, r0, asr #3
	str r0, [r6, #0x14]
	ldr r0, [r6, #0xc]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	str r0, [r6, #0xc]
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	adds r1, r1, r0
	str r1, [sp, #0x50]
	ldr r2, [r6, #0x14]
	ldr r3, [r5, #4]
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	add r0, r3, r0, asr #3
	str r0, [sp, #0x54]
	bpl _022F0BB4
	mov r2, r1, asr #7
	add r2, r1, r2, lsr #24
	mov r3, r1, lsr #0x1f
	mov r2, r2, asr #8
	rsb r1, r3, r1, lsl #24
	sub r2, r2, #1
	add r1, r3, r1, ror #24
	sub r2, r0, r2, lsl #5
	add r0, r1, #0x100
	str r2, [sp, #0x54]
	str r0, [sp, #0x50]
	b _022F0BE0
_022F0BB4:
	cmp r1, #0x100
	blt _022F0BE0
	mov r2, r1, asr #7
	add r2, r1, r2, lsr #24
	mov r3, r1, lsr #0x1f
	mov r2, r2, asr #8
	rsb r1, r3, r1, lsl #24
	sub r2, r0, r2, lsl #5
	add r0, r3, r1, ror #24
	str r2, [sp, #0x54]
	str r0, [sp, #0x50]
_022F0BE0:
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x50
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [sp, #0x50]
	ldr r1, [r6, #0x14]
	ldr r3, [r5, #4]
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	add r3, r3, r0, asr #4
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x54]
	bl ov11_022EF2EC
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0C44:
	ldr r0, [r5]
	add r2, sp, #0x48
	str r0, [sp, #0x48]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x4c]
	bl ov11_022EF2EC
	add r2, sp, #0x48
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #4]
	add r2, sp, #0x48
	add r0, r1, r0
	str r0, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	mov r0, r4
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #0
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	ldr r3, [r6, #0x14]
	str r3, [sp, #0x48]
	str r1, [sp, #0x4c]
	bl ov11_022EF2EC
	ldr r0, [sp, #0x48]
	add r2, sp, #0x48
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x18]
	mov r0, r4
	str r1, [sp, #0x48]
	mov r1, #0
	bl ov11_022EF2EC
	ldr r1, [sp, #0x48]
	mov r0, r4
	str r1, [r6, #0x18]
	ldr r3, [r5]
	ldr r2, [r6, #0x14]
	mov r1, #0
	add r2, r3, r2
	str r2, [sp, #0x48]
	ldr r3, [r5, #4]
	add r2, sp, #0x48
	str r3, [sp, #0x4c]
	bl ov11_022EF2EC
	mov r0, r4
	mov r1, #0
	add r2, sp, #0x48
	bl ov11_022EF2D4
	ldr r1, [r6, #0x18]
	ldr r2, [r5]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x48]
	ldr r2, [r5, #4]
	mov r1, #1
	str r2, [sp, #0x4c]
	add r2, sp, #0x48
	bl ov11_022EF2EC
	add r2, sp, #0x48
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0DA4:
	ldr r0, [r5]
	add r2, sp, #0x40
	str r0, [sp, #0x40]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	add r2, sp, #0x40
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r0, [r6, #4]
	mov r1, #0
	add r0, r2, r0
	str r0, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r0, [r6, #8]
	add r2, sp, #0x40
	add r0, r3, r0
	str r0, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r0, r4
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	str r1, [sp, #0x40]
	ldr r3, [r6, #0x14]
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	ldr r0, [sp, #0x44]
	add r2, sp, #0x40
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x18]
	mov r0, r4
	str r1, [sp, #0x44]
	mov r1, #1
	bl ov11_022EF2EC
	ldr r1, [sp, #0x44]
	mov r0, r4
	str r1, [r6, #0x18]
	ldr r2, [r5]
	mov r1, #0
	str r2, [sp, #0x40]
	ldr ip, [r5, #4]
	ldr r3, [r6, #0x14]
	add r2, sp, #0x40
	add r3, ip, r3
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	mov r0, r4
	mov r1, #0
	add r2, sp, #0x40
	bl ov11_022EF2D4
	ldr r1, [r5]
	mov r0, r4
	str r1, [sp, #0x40]
	ldr r3, [r5, #4]
	ldr r2, [r6, #0x18]
	mov r1, #1
	add r2, r3, r2
	str r2, [sp, #0x44]
	add r2, sp, #0x40
	bl ov11_022EF2EC
	add r2, sp, #0x40
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0F04:
	ldr r1, [r6, #0xc]
	mov r0, r4
	add r3, r1, #2
	str r3, [r6, #0xc]
	mov r1, r3, asr #1
	ldr r2, [r6, #0x14]
	add r1, r3, r1, lsr #30
	add r1, r2, r1, asr #2
	str r1, [r6, #0x14]
	ldr r1, [r6, #0xc]
	add r2, r6, #0x14
	and r1, r1, #3
	str r1, [r6, #0xc]
	mov r1, #0
	bl ov11_022EF2EC
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x38
	add r0, r1, r0
	str r0, [sp, #0x38]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x3c]
	bl ov11_022EF2EC
	add r2, sp, #0x38
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x38
	sub r0, r1, r0
	str r0, [sp, #0x38]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x3c]
	bl ov11_022EF2EC
	add r2, sp, #0x38
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0FB4:
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x30
	add r0, r1, r0
	str r0, [sp, #0x30]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	mov r0, r4
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x34]
	bl ov11_022EF2EC
	add r2, sp, #0x30
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F0FF8:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #0x28]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #7
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0x20
	and r4, r4, #7
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0x2c]
	sub r3, r3, r4
	str r3, [sp, #0x20]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #0x24]
	bl ov11_022F2B28
	b _022F11C8
_022F1090:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #0x18]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #7
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0x10
	and r4, r4, #7
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0x1c]
	sub r3, r3, r4
	str r3, [sp, #0x10]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #0x14]
	bl ov11_022F2B28
	b _022F11C8
_022F1128:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #8]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #1
	add r0, r5, r0, lsr #30
	add r0, ip, r0, asr #2
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #1
	add r0, r5, r0, lsr #30
	add r0, ip, r0, asr #2
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #3
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0
	and r4, r4, #3
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0xc]
	sub r3, r3, r4
	str r3, [sp]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #4]
	bl ov11_022F2B28
	b _022F11C8
_022F11C0:
	mov r0, #1
	b _022F11CC
_022F11C8:
	mov r0, #0
_022F11CC:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F11D4: .word 0x0000016A
_022F11D8: .word 0x00000156
	arm_func_end ov11_022F042C

	arm_func_start ov11_022F11DC
ov11_022F11DC: ; 0x022F11DC
	stmdb sp!, {r3, lr}
	mov r0, #0x3c
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F1210 ; =0x02324CC0
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	bl ov11_022F2F58
	mov r0, #0
	bl ov11_022F2278
	bl ov11_022F1244
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1210: .word 0x02324CC0
	arm_func_end ov11_022F11DC

	arm_func_start ov11_022F1214
ov11_022F1214: ; 0x022F1214
	stmdb sp!, {r3, lr}
	bl ov11_022F1244
	bl ov11_022F2FE8
	bl ov11_022F22C8
	ldr r0, _022F1240 ; =0x02324CC0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F1240 ; =0x02324CC0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1240: .word 0x02324CC0
	arm_func_end ov11_022F1214

	arm_func_start ov11_022F1244
ov11_022F1244: ; 0x022F1244
	stmdb sp!, {r3, lr}
	bl ov11_0231145C
	cmp r0, #0
	beq _022F1258
	bl ov11_023113E8
_022F1258:
	bl ov11_0231195C
	cmp r0, #0
	beq _022F1268
	bl ov11_023118E8
_022F1268:
	ldr r0, _022F12BC ; =0x02324CC0
	mov r2, #0
	ldr r1, [r0, #4]
	strb r2, [r1, #3]
	ldr r0, [r0, #4]
	strb r2, [r0, #2]
	bl ov11_022F3010
	mov r0, #0
	bl ov11_022F22F4
	ldr r0, _022F12BC ; =0x02324CC0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EBEAC
	ldr r0, _022F12BC ; =0x02324CC0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F12BC ; =0x02324CC0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F12BC: .word 0x02324CC0
	arm_func_end ov11_022F1244

	arm_func_start ov11_022F12C0
ov11_022F12C0: ; 0x022F12C0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	ldr r1, _022F1534 ; =0x02320FB4
	mov r2, r5
	mov r0, #1
	bl DebugPrint
	bl ov11_022F1244
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F1538 ; =0x02324CC0
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r5, r1
	strh r5, [r0]
	bne _022F134C
	ldr r0, [r2]
	ldr r1, _022F153C ; =0x02320CD8
	bl ov11_022EBC18
	ldr r0, _022F1538 ; =0x02324CC0
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F1538 ; =0x02324CC0
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F1538 ; =0x02324CC0
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	b _022F14E8
_022F134C:
	mov r0, #0xc
	smulbb r3, r5, r0
	ldr r4, _022F1540 ; =0x020A5488
	ldrsh r0, [r4, r3]
	add r4, r4, r3
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022F146C
_022F1370: ; jump table
	b _022F1444 ; case 0
	b _022F146C ; case 1
	b _022F146C ; case 2
	b _022F146C ; case 3
	b _022F146C ; case 4
	b _022F146C ; case 5
	b _022F13A4 ; case 6
	b _022F13A4 ; case 7
	b _022F13A4 ; case 8
	b _022F13A4 ; case 9
	b _022F13A4 ; case 10
	b _022F13C4 ; case 11
	b _022F13C4 ; case 12
_022F13A4:
	ldr r0, [r2]
	ldr r1, _022F1544 ; =0x02320CF4
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #2
	bl ov11_022F22F4
	b _022F148C
_022F13C4:
	ldr r6, _022F1548 ; =0x02320D2C
	b _022F1414
_022F13CC:
	cmp r0, r5
	bne _022F1410
	ldr r0, _022F1538 ; =0x02324CC0
	ldr r0, [r0]
	bl MemFree
	ldrsh r1, [r4]
	ldr r0, _022F1538 ; =0x02324CC0
	mov r3, #0
	str r3, [r0]
	cmp r1, #0xb
	moveq r3, #1
	ldr r2, [r6, #4]
	mov r0, r5
	add r1, r6, #2
	and r3, r3, #0xff
	bl ov11_022F155C
	b _022F152C
_022F1410:
	add r6, r6, #8
_022F1414:
	ldrsh r0, [r6]
	cmp r0, r1
	bne _022F13CC
	ldr r0, _022F1538 ; =0x02324CC0
	ldr r1, _022F154C ; =0x02320D10
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
	b _022F148C
_022F1444:
	ldr r0, _022F1550 ; =0x02320CA8
	ldrsh r3, [r4]
	ldr ip, [r0, #0x1c]
	ldr lr, [r0, #0x18]
	ldr r1, _022F1554 ; =0x02320FCC
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl FatalError
_022F146C:
	ldr r0, _022F1538 ; =0x02324CC0
	ldr r1, _022F153C ; =0x02320CD8
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
_022F148C:
	ldr r0, _022F1538 ; =0x02324CC0
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F1538 ; =0x02324CC0
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F1538 ; =0x02324CC0
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldrsh r0, [r4, #6]
	mvn r1, #0
	cmp r0, r1
	beq _022F14D4
	bl ov11_022F25A4
_022F14D4:
	ldr r0, _022F1538 ; =0x02324CC0
	ldr r2, _022F1558 ; =0x02320CA8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F14E8:
	ldr r0, _022F1538 ; =0x02324CC0
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	bl ov11_0231145C
	cmp r0, #0
	beq _022F1514
	mov r0, #0
	mov r1, r0
	bl ov11_0230D318
	b _022F152C
_022F1514:
	bl ov11_0231195C
	cmp r0, #0
	beq _022F152C
	mov r0, #0
	mov r1, r0
	bl ov11_0230D318
_022F152C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F1534: .word 0x02320FB4
_022F1538: .word 0x02324CC0
_022F153C: .word 0x02320CD8
_022F1540: .word 0x020A5488
_022F1544: .word 0x02320CF4
_022F1548: .word 0x02320D2C
_022F154C: .word 0x02320D10
_022F1550: .word 0x02320CA8
_022F1554: .word 0x02320FCC
_022F1558: .word 0x02320CA8
	arm_func_end ov11_022F12C0

	arm_func_start ov11_022F155C
ov11_022F155C: ; 0x022F155C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldr r1, _022F16F0 ; =0x02320FE8
	mov r2, r8
	mov r0, #1
	mov r5, r3
	bl DebugPrint
	bl ov11_022F1244
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F16F4 ; =0x02324CC0
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r8, r1
	strh r8, [r0]
	ldrneb r0, [r7]
	cmpne r0, #0xff
	bne _022F1600
	ldr r0, _022F16F4 ; =0x02324CC0
	ldr r1, _022F16F8 ; =0x02320CD8
	ldr r0, [r0]
	bl ov11_022EBC18
	ldr r0, _022F16F4 ; =0x02324CC0
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F16F4 ; =0x02324CC0
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F16F4 ; =0x02324CC0
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	b _022F16D8
_022F1600:
	mov r0, #0xc
	smulbb r1, r8, r0
	ldr r2, _022F16FC ; =0x020A5488
	ldrsh r0, [r2, r1]
	add r4, r2, r1
	cmp r0, #0xa
	cmpne r0, #0xb
	beq _022F1644
	ldr r1, _022F1700 ; =0x02320CA8
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _022F1704 ; =0x02321004
	mov r2, r8
	str ip, [sp]
	str r3, [sp, #4]
	bl FatalError
_022F1644:
	ldr r0, _022F16F4 ; =0x02324CC0
	ldr r1, _022F1708 ; =0x02320D10
	ldr r0, [r0]
	bl ov11_022EBC18
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
	cmp r5, #0
	beq _022F1688
	ldr r0, _022F16F4 ; =0x02324CC0
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	mov r2, r7
	mov r3, r6
	bl ov11_022ED244
	b _022F16A0
_022F1688:
	ldr r0, _022F16F4 ; =0x02324CC0
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	mov r2, r7
	mov r3, r6
	bl ov11_022ECD24
_022F16A0:
	ldr r0, _022F16F4 ; =0x02324CC0
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F16F4 ; =0x02324CC0
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldr r0, _022F16F4 ; =0x02324CC0
	ldr r2, _022F170C ; =0x02320CB8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F16D8:
	ldr r0, _022F16F4 ; =0x02324CC0
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F16F0: .word 0x02320FE8
_022F16F4: .word 0x02324CC0
_022F16F8: .word 0x02320CD8
_022F16FC: .word 0x020A5488
_022F1700: .word 0x02320CA8
_022F1704: .word 0x02321004
_022F1708: .word 0x02320D10
_022F170C: .word 0x02320CB8
	arm_func_end ov11_022F155C

	arm_func_start ov11_022F1710
ov11_022F1710: ; 0x022F1710
	ldr r0, _022F1734 ; =0x02324CC0
	mov r2, #0
	ldr r1, [r0, #4]
	ldr ip, _022F1738 ; =ov11_022EDD14
	strb r2, [r1, #3]
	ldr r1, [r0, #4]
	strb r2, [r1, #2]
	ldr r0, [r0]
	bx ip
	.align 2, 0
_022F1734: .word 0x02324CC0
_022F1738: .word ov11_022EDD14
	arm_func_end ov11_022F1710

	arm_func_start ov11_022F173C
ov11_022F173C: ; 0x022F173C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022F178C ; =0x02321018
	mov r2, r4
	mov r0, #1
	bl DebugPrint
	ldr r2, _022F1790 ; =0x02324CC0
	ldr r1, _022F1794 ; =0x020A5488
	ldr r3, [r2, #4]
	mov r0, #0xc
	strh r4, [r3]
	smlabb r0, r4, r0, r1
	ldrsh r1, [r0, #4]
	ldr r0, [r2]
	bl ov11_022EDD20
	ldr r0, _022F1790 ; =0x02324CC0
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F178C: .word 0x02321018
_022F1790: .word 0x02324CC0
_022F1794: .word 0x020A5488
	arm_func_end ov11_022F173C

	arm_func_start ov11_022F1798
ov11_022F1798: ; 0x022F1798
	ldr r0, _022F17B0 ; =0x02324CC0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldrnesh r0, [r0]
	mvneq r0, #0
	bx lr
	.align 2, 0
_022F17B0: .word 0x02324CC0
	arm_func_end ov11_022F1798

	arm_func_start ov11_022F17B4
ov11_022F17B4: ; 0x022F17B4
	ldr r0, _022F17E0 ; =0x02324CC0
	ldr r0, [r0, #4]
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	ldrsh r2, [r0]
	mov r0, #0xc
	ldr r1, _022F17E4 ; =0x020A5488
	smulbb r0, r2, r0
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_022F17E0: .word 0x02324CC0
_022F17E4: .word 0x020A5488
	arm_func_end ov11_022F17B4

	arm_func_start ov11_022F17E8
ov11_022F17E8: ; 0x022F17E8
	ldr r1, _022F17F8 ; =0x02324CC0
	ldr ip, _022F17FC ; =ov11_022ED69C
	ldr r1, [r1]
	bx ip
	.align 2, 0
_022F17F8: .word 0x02324CC0
_022F17FC: .word ov11_022ED69C
	arm_func_end ov11_022F17E8

	arm_func_start ov11_022F1800
ov11_022F1800: ; 0x022F1800
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrsh r4, [r2, #6]
	mov r5, #0
	cmp r4, #0
	mov r4, #0xff
	ble _022F1A3C
	mov r7, r0
	mov r6, r5
_022F1820:
	mov r8, r6
_022F1824:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r7], #1
	blt _022F1824
	add r5, r5, #1
	cmp r5, #4
	blt _022F1820
	ldrb r6, [r2, #1]
	mov r4, #0
	cmp r6, #0
	ble _022F1A0C
	b _022F1A00
_022F1854:
	mov sb, #0
	mov r6, #0xff
_022F185C:
	add sb, sb, #1
	cmp sb, #5
	strb r6, [r7], #1
	blt _022F185C
	cmp r4, #0
	mov lr, #0
	bne _022F1924
	mov r8, lr
	mov ip, #0xc0
	b _022F1914
_022F1884:
	ldrb r6, [r1]
	add sl, r1, #1
	mov r1, sl
	cmp r6, #0xc0
	blt _022F18C0
	mov fp, ip
	b _022F18AC
_022F18A0:
	ldrb sl, [r1], #1
	add fp, fp, #1
	strb sl, [r7], #1
_022F18AC:
	cmp fp, r6
	ble _022F18A0
	sub r6, r6, #0xbf
	add lr, lr, r6
	b _022F1914
_022F18C0:
	cmp r6, #0x80
	blt _022F18F4
	add r1, sl, #1
	ldrb sl, [sl]
	mov fp, #0x80
	b _022F18E0
_022F18D8:
	strb sl, [r7], #1
	add fp, fp, #1
_022F18E0:
	cmp fp, r6
	ble _022F18D8
	sub r6, r6, #0x7f
	add lr, lr, r6
	b _022F1914
_022F18F4:
	mov sl, #0
	b _022F1904
_022F18FC:
	strb r8, [r7], #1
	add sl, sl, #1
_022F1904:
	cmp sl, r6
	ble _022F18FC
	add r6, r6, #1
	add lr, lr, r6
_022F1914:
	ldrb r6, [r2]
	cmp lr, r6
	blt _022F1884
	b _022F19DC
_022F1924:
	sub ip, r7, #0x100
	b _022F19D0
_022F192C:
	ldrb r6, [r1]
	add r8, r1, #1
	mov r1, r8
	cmp r6, #0xc0
	blt _022F1970
	mov r8, #0xc0
	b _022F195C
_022F1948:
	ldrb fp, [r1], #1
	ldrb sl, [ip], #1
	add r8, r8, #1
	eor sl, fp, sl
	strb sl, [r7], #1
_022F195C:
	cmp r8, r6
	ble _022F1948
	sub r6, r6, #0xbf
	add lr, lr, r6
	b _022F19D0
_022F1970:
	cmp r6, #0x80
	blt _022F19AC
	add r1, r8, #1
	ldrb r8, [r8]
	mov sl, #0x80
	b _022F1998
_022F1988:
	ldrb fp, [ip], #1
	add sl, sl, #1
	eor fp, r8, fp
	strb fp, [r7], #1
_022F1998:
	cmp sl, r6
	ble _022F1988
	sub r6, r6, #0x7f
	add lr, lr, r6
	b _022F19D0
_022F19AC:
	mov sl, #0
	b _022F19C0
_022F19B4:
	ldrb r8, [ip], #1
	add sl, sl, #1
	strb r8, [r7], #1
_022F19C0:
	cmp sl, r6
	ble _022F19B4
	add r6, r6, #1
	add lr, lr, r6
_022F19D0:
	ldrb r6, [r2]
	cmp lr, r6
	blt _022F192C
_022F19DC:
	add sb, sb, r6
	mov r6, #0xff
	b _022F19F0
_022F19E8:
	strb r6, [r7], #1
	add sb, sb, #1
_022F19F0:
	cmp sb, #0x100
	blt _022F19E8
	add r4, r4, #1
	add r5, r5, #1
_022F1A00:
	ldrb r6, [r2, #1]
	cmp r4, r6
	blt _022F1854
_022F1A0C:
	mov r4, #0xff
	mov r6, #0
	b _022F1A30
_022F1A18:
	mov r8, r6
_022F1A1C:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r7], #1
	blt _022F1A1C
	add r5, r5, #1
_022F1A30:
	cmp r5, r3
	blt _022F1A18
	b _022F1B10
_022F1A3C:
	mov r6, r0
	mov r7, r5
_022F1A44:
	mov r8, r7
_022F1A48:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r6], #1
	blt _022F1A48
	add r5, r5, #1
	cmp r5, #4
	blt _022F1A44
	ldrb r7, [r2, #1]
	mov r4, #0
	cmp r7, #0
	ble _022F1AE4
	mov r8, #0xff
	mov sb, r4
	mov sl, r8
	mov ip, r4
	b _022F1AD8
_022F1A88:
	mov lr, ip
_022F1A8C:
	add lr, lr, #1
	strb sl, [r6], #1
	cmp lr, #5
	blt _022F1A8C
	mov fp, #0
	b _022F1AAC
_022F1AA4:
	strb sb, [r6], #1
	add fp, fp, #1
_022F1AAC:
	ldrb r7, [r2]
	cmp fp, r7
	blt _022F1AA4
	add lr, lr, r7
	b _022F1AC8
_022F1AC0:
	strb r8, [r6], #1
	add lr, lr, #1
_022F1AC8:
	cmp lr, #0x100
	blt _022F1AC0
	add r4, r4, #1
	add r5, r5, #1
_022F1AD8:
	ldrb r7, [r2, #1]
	cmp r4, r7
	blt _022F1A88
_022F1AE4:
	mov r4, #0xff
	mov r7, #0
	b _022F1B08
_022F1AF0:
	mov r8, r7
_022F1AF4:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r6], #1
	blt _022F1AF4
	add r5, r5, #1
_022F1B08:
	cmp r5, r3
	blt _022F1AF0
_022F1B10:
	ldrsh r3, [r2, #8]
	cmp r3, #0
	ldrgtb r3, [r2, #1]
	addgt r4, r0, #0x400
	movgt r6, #0
	cmpgt r3, #0
	ble _022F1C58
	b _022F1C4C
_022F1B30:
	cmp r6, #0
	add r4, r4, #5
	mov r5, #0
	bne _022F1BA0
	mov r7, #0x80
	b _022F1B90
_022F1B48:
	ldrb sb, [r1], #1
	cmp sb, #0x80
	blt _022F1B84
	mov r8, r7
	b _022F1B70
_022F1B5C:
	mov sl, r4
	ldrb r3, [r4], #1
	add r8, r8, #1
	orr r3, r3, #0x80
	strb r3, [sl]
_022F1B70:
	cmp r8, sb
	ble _022F1B5C
	sub r3, sb, #0x7f
	add r5, r5, r3
	b _022F1B90
_022F1B84:
	add r3, sb, #1
	add r4, r4, r3
	add r5, r5, r3
_022F1B90:
	ldrb r8, [r2]
	cmp r5, r8
	blt _022F1B48
	b _022F1C3C
_022F1BA0:
	sub r7, r4, #0x100
	mov ip, #0x80
	mov r3, r5
	b _022F1C30
_022F1BB0:
	ldrb lr, [r1], #1
	cmp lr, #0x80
	blt _022F1BF8
	mov r8, ip
	b _022F1BE4
_022F1BC4:
	ldrb sb, [r7], #1
	add r8, r8, #1
	tst sb, #0x80
	moveq sl, r4
	ldreqb sb, [r4], #1
	addne r4, r4, #1
	orreq sb, sb, #0x80
	streqb sb, [sl]
_022F1BE4:
	cmp r8, lr
	ble _022F1BC4
	sub r8, lr, #0x7f
	add r5, r5, r8
	b _022F1C30
_022F1BF8:
	mov r8, r3
	b _022F1C20
_022F1C00:
	ldrb sb, [r7], #1
	add r8, r8, #1
	tst sb, #0x80
	movne sl, r4
	ldrneb sb, [r4], #1
	addeq r4, r4, #1
	orrne sb, sb, #0x80
	strneb sb, [sl]
_022F1C20:
	cmp r8, lr
	ble _022F1C00
	add r8, lr, #1
	add r5, r5, r8
_022F1C30:
	ldrb r8, [r2]
	cmp r5, r8
	blt _022F1BB0
_022F1C3C:
	rsb r3, r8, #0x100
	sub r3, r3, #5
	add r4, r4, r3
	add r6, r6, #1
_022F1C4C:
	ldrb r3, [r2, #1]
	cmp r6, r3
	blt _022F1B30
_022F1C58:
	ldrsh r3, [r2, #8]
	cmp r3, #1
	ldrgtb r4, [r2, #1]
	addgt r3, r0, #0x400
	movgt r5, #0
	cmpgt r4, #0
	ble _022F1DA0
	b _022F1D94
_022F1C78:
	cmp r5, #0
	add r3, r3, #5
	mov r4, #0
	bne _022F1CE8
	mov r6, #0x80
	b _022F1CD8
_022F1C90:
	ldrb r8, [r1], #1
	cmp r8, #0x80
	blt _022F1CCC
	mov r7, r6
	b _022F1CB8
_022F1CA4:
	mov sb, r3
	ldrb r0, [r3], #1
	add r7, r7, #1
	orr r0, r0, #0x40
	strb r0, [sb]
_022F1CB8:
	cmp r7, r8
	ble _022F1CA4
	sub r0, r8, #0x7f
	add r4, r4, r0
	b _022F1CD8
_022F1CCC:
	add r0, r8, #1
	add r3, r3, r0
	add r4, r4, r0
_022F1CD8:
	ldrb r8, [r2]
	cmp r4, r8
	blt _022F1C90
	b _022F1D84
_022F1CE8:
	sub r7, r3, #0x100
	mov r0, #0x80
	mov sb, r4
	b _022F1D78
_022F1CF8:
	ldrb r6, [r1], #1
	cmp r6, #0x80
	blt _022F1D40
	mov fp, r0
	b _022F1D2C
_022F1D0C:
	ldrb r8, [r7], #1
	add fp, fp, #1
	tst r8, #0x40
	moveq sl, r3
	ldreqb r8, [r3], #1
	addne r3, r3, #1
	orreq r8, r8, #0x40
	streqb r8, [sl]
_022F1D2C:
	cmp fp, r6
	ble _022F1D0C
	sub r6, r6, #0x7f
	add r4, r4, r6
	b _022F1D78
_022F1D40:
	mov fp, sb
	b _022F1D68
_022F1D48:
	ldrb r8, [r7], #1
	add fp, fp, #1
	tst r8, #0x40
	movne sl, r3
	ldrneb r8, [r3], #1
	addeq r3, r3, #1
	orrne r8, r8, #0x40
	strneb r8, [sl]
_022F1D68:
	cmp fp, r6
	ble _022F1D48
	add r6, r6, #1
	add r4, r4, r6
_022F1D78:
	ldrb r8, [r2]
	cmp r4, r8
	blt _022F1CF8
_022F1D84:
	rsb r0, r8, #0x100
	sub r0, r0, #5
	add r3, r3, r0
	add r5, r5, #1
_022F1D94:
	ldrb r0, [r2, #1]
	cmp r5, r0
	blt _022F1C78
_022F1DA0:
	mov r0, r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022F1800

	arm_func_start ov11_022F1DA8
ov11_022F1DA8: ; 0x022F1DA8
	stmdb sp!, {r3, lr}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_022F1DB8: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _022F1DD0 ; case 1
	b _022F1DE8 ; case 2
	b _022F1E00 ; case 3
	b _022F1E18 ; case 4
	b _022F1E2C ; case 5
_022F1DD0:
	ldr r0, _022F1E40 ; =0x02324CC0
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1DE8:
	ldr r0, _022F1E40 ; =0x02324CC0
	mov r1, #1
	ldr r0, [r0]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1E00:
	ldr r0, _022F1E40 ; =0x02324CC0
	mov r1, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1E18:
	ldr r0, _022F1E40 ; =0x02324CC0
	mov r1, #1
	ldr r0, [r0]
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_022F1E2C:
	ldr r0, _022F1E40 ; =0x02324CC0
	mov r1, #0
	ldr r0, [r0]
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1E40: .word 0x02324CC0
	arm_func_end ov11_022F1DA8

	arm_func_start ov11_022F1E44
ov11_022F1E44: ; 0x022F1E44
	stmdb sp!, {r3, lr}
	cmp r0, #1
	cmpne r0, #3
	bne _022F1E64
	ldr r0, _022F1E6C ; =0x02324CC0
	ldr r0, [r0]
	bl ov11_022EE60C
	ldmia sp!, {r3, pc}
_022F1E64:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1E6C: .word 0x02324CC0
	arm_func_end ov11_022F1E44

	arm_func_start ov11_022F1E70
ov11_022F1E70: ; 0x022F1E70
	ldr r1, _022F1E88 ; =0x02324CC0
	ldr ip, _022F1E8C ; =ov11_022EF2BC
	mov r2, r0
	ldr r0, [r1]
	mov r1, #0
	bx ip
	.align 2, 0
_022F1E88: .word 0x02324CC0
_022F1E8C: .word ov11_022EF2BC
	arm_func_end ov11_022F1E70

	arm_func_start ov11_022F1E90
ov11_022F1E90: ; 0x022F1E90
	ldr r3, _022F1EA4 ; =0x02324CC0
	ldr ip, _022F1EA8 ; =ov11_022EF40C
	mov r2, r1
	ldr r1, [r3]
	bx ip
	.align 2, 0
_022F1EA4: .word 0x02324CC0
_022F1EA8: .word ov11_022EF40C
	arm_func_end ov11_022F1E90

	arm_func_start ov11_022F1EAC
ov11_022F1EAC: ; 0x022F1EAC
	ldr r2, _022F1EC4 ; =0x02324CC0
	mov r1, r0
	ldr r0, [r2, #4]
	ldr ip, _022F1EC8 ; =ov11_022F03F8
	add r0, r0, #4
	bx ip
	.align 2, 0
_022F1EC4: .word 0x02324CC0
_022F1EC8: .word ov11_022F03F8
	arm_func_end ov11_022F1EAC

	arm_func_start ov11_022F1ECC
ov11_022F1ECC: ; 0x022F1ECC
	ldr r2, _022F1EE4 ; =0x02324CC0
	mov r1, r0
	ldr r0, [r2, #4]
	ldr ip, _022F1EE8 ; =ov11_022F040C
	add r0, r0, #4
	bx ip
	.align 2, 0
_022F1EE4: .word 0x02324CC0
_022F1EE8: .word ov11_022F040C
	arm_func_end ov11_022F1ECC

	arm_func_start ov11_022F1EEC
ov11_022F1EEC: ; 0x022F1EEC
	ldr r1, _022F1F00 ; =0x02324CC0
	ldr ip, _022F1F04 ; =ov11_022F03C4
	ldr r1, [r1, #4]
	add r1, r1, #0x20
	bx ip
	.align 2, 0
_022F1F00: .word 0x02324CC0
_022F1F04: .word ov11_022F03C4
	arm_func_end ov11_022F1EEC

	arm_func_start ov11_022F1F08
ov11_022F1F08: ; 0x022F1F08
	stmdb sp!, {r3, lr}
	ldr r2, _022F1F38 ; =0x02324CC0
	mov r3, r0
	ldr r0, [r2]
	mov r2, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, r3
	bl ov11_022EF498
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1F38: .word 0x02324CC0
	arm_func_end ov11_022F1F08

	arm_func_start ov11_022F1F3C
ov11_022F1F3C: ; 0x022F1F3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022F2044 ; =0x02324CC0
	mov r7, r0
	ldr r0, [r2]
	mov r6, r1
	cmp r0, #0
	ldrne r2, [r2, #4]
	mvnne r1, #0
	ldrnesh r4, [r2]
	cmpne r4, r1
	beq _022F203C
	mov r3, #0xc
	mov r1, r7
	mov r2, r6
	smulbb r4, r4, r3
	ldr r5, _022F2048 ; =0x020A5488
	bl ov11_022EF498
	ldr r0, [r7]
	add r0, r0, #0x8000
	str r0, [r7]
	bl ov11_0231145C
	cmp r0, #0
	ldrne r0, [r7, #4]
	addne r0, r0, #0x12000
	strne r0, [r7, #4]
	bne _022F1FC0
	bl ov11_0231195C
	cmp r0, #0
	ldr r0, [r7, #4]
	addne r0, r0, #0x16000
	strne r0, [r7, #4]
	addeq r0, r0, #0x6000
	streq r0, [r7, #4]
_022F1FC0:
	ldr r0, [r6]
	sub r0, r0, #0x8000
	str r0, [r6]
	ldr r0, [r6, #4]
	sub r0, r0, #0x6000
	str r0, [r6, #4]
	ldrsh r0, [r5, r4]
	cmp r0, #0xa
	bne _022F2014
	ldr r0, [r7]
	add r0, r0, #0x1800
	str r0, [r7]
	ldr r0, [r7, #4]
	add r0, r0, #0x1800
	str r0, [r7, #4]
	ldr r0, [r6]
	sub r0, r0, #0x1800
	str r0, [r6]
	ldr r0, [r6, #4]
	sub r0, r0, #0x1800
	str r0, [r6, #4]
_022F2014:
	ldr r1, [r7]
	ldr r0, [r6]
	cmp r1, r0
	strgt r1, [r6]
	ldr r1, [r7, #4]
	ldr r0, [r6, #4]
	cmp r1, r0
	strgt r1, [r6, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022F203C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F2044: .word 0x02324CC0
_022F2048: .word 0x020A5488
	arm_func_end ov11_022F1F3C

	arm_func_start ov11_022F204C
ov11_022F204C: ; 0x022F204C
	stmdb sp!, {r3, lr}
	ldr r2, _022F20C8 ; =0x02324CC0
	ldr r3, [r0]
	ldr r0, [r0, #4]
	ldr r2, [r2]
	add r0, r3, r0, lsl #8
	add r0, r0, #5
	ldr r2, [r2, #0x2d8]
	ldr r3, [r1, #4]
	add r0, r0, #0x400
	cmp r2, #0
	add r2, r2, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	b _022F20B8
_022F2088:
	mov lr, r2
	ldr ip, [r1]
	b _022F20A8
_022F2094:
	ldrb r0, [lr], #1
	tst r0, #0x88
	movne r0, #1
	ldmneia sp!, {r3, pc}
	sub ip, ip, #1
_022F20A8:
	cmp ip, #0
	bgt _022F2094
	add r2, r2, #0x100
	sub r3, r3, #1
_022F20B8:
	cmp r3, #0
	bgt _022F2088
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F20C8: .word 0x02324CC0
	arm_func_end ov11_022F204C

	arm_func_start ov11_022F20CC
ov11_022F20CC: ; 0x022F20CC
	stmdb sp!, {r3, lr}
	ldr r2, _022F2148 ; =0x02324CC0
	ldr r3, [r0]
	ldr r0, [r0, #4]
	ldr r2, [r2]
	add r0, r3, r0, lsl #8
	add r0, r0, #5
	ldr r2, [r2, #0x2d8]
	ldr r3, [r1, #4]
	add r0, r0, #0x400
	cmp r2, #0
	add r2, r2, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	b _022F2138
_022F2108:
	mov lr, r2
	ldr ip, [r1]
	b _022F2128
_022F2114:
	ldrb r0, [lr], #1
	tst r0, #0x48
	movne r0, #1
	ldmneia sp!, {r3, pc}
	sub ip, ip, #1
_022F2128:
	cmp ip, #0
	bgt _022F2114
	add r2, r2, #0x100
	sub r3, r3, #1
_022F2138:
	cmp r3, #0
	bgt _022F2108
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2148: .word 0x02324CC0
	arm_func_end ov11_022F20CC

	arm_func_start ov11_022F214C
ov11_022F214C: ; 0x022F214C
	stmdb sp!, {r4, lr}
	ldr ip, _022F2174 ; =0x02324CC0
	mov r4, r0
	mov lr, r1
	mov r3, r2
	ldr r0, [ip]
	mov r1, r4
	mov r2, lr
	bl ov11_022EF4C0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F2174: .word 0x02324CC0
	arm_func_end ov11_022F214C

	arm_func_start ov11_022F2178
ov11_022F2178: ; 0x022F2178
	stmdb sp!, {r3, lr}
	bl ov11_022F27F0
	bl ov11_022F30FC
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022F2178

	arm_func_start ov11_022F2188
ov11_022F2188: ; 0x022F2188
	ldr ip, _022F2190 ; =ov11_022F37D0
	bx ip
	.align 2, 0
_022F2190: .word ov11_022F37D0
	arm_func_end ov11_022F2188

	arm_func_start ov11_022F2194
ov11_022F2194: ; 0x022F2194
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022F2240 ; =0x02324CC0
	ldr r0, [r0, #4]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _022F2230
	add r1, sp, #0
	mov r0, #0
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _022F2240 ; =0x02324CC0
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldr r0, _022F2240 ; =0x02324CC0
	add r1, sp, #0
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #4
	bl ov11_022F042C
	cmp r0, #0
	beq _022F2214
	ldr r0, _022F2240 ; =0x02324CC0
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F2214:
	ldr r0, _022F2240 ; =0x02324CC0
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _022F2240 ; =0x02324CC0
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
_022F2230:
	bl ov11_022F27F4
	bl ov11_022F3E70
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2240: .word 0x02324CC0
	arm_func_end ov11_022F2194

	arm_func_start ov11_022F2244
ov11_022F2244: ; 0x022F2244
	stmdb sp!, {r3, lr}
	ldr r0, _022F2274 ; =0x02324CC0
	ldr r1, [r0, #4]
	ldrb r1, [r1, #3]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	beq _022F2268
	bl ov11_022EFB70
_022F2268:
	bl ov11_022F2924
	bl ov11_022F4358
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2274: .word 0x02324CC0
	arm_func_end ov11_022F2244

	arm_func_start ov11_022F2278
ov11_022F2278: ; 0x022F2278
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x28
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F22C4 ; =0x02324CC8
	mov ip, #0
	str r0, [r1]
	strb ip, [r0, #9]
	ldr r2, [r1]
	mov r0, r4
	strb ip, [r2, #8]
	ldr r3, [r1]
	sub r2, ip, #1
	str r4, [r3, #4]
	ldr r1, [r1]
	strh r2, [r1]
	bl ov11_022F22F4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F22C4: .word 0x02324CC8
	arm_func_end ov11_022F2278

	arm_func_start ov11_022F22C8
ov11_022F22C8: ; 0x022F22C8
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov11_022F22F4
	ldr r0, _022F22F0 ; =0x02324CC8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F22F0 ; =0x02324CC8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F22F0: .word 0x02324CC8
	arm_func_end ov11_022F22C8

	arm_func_start ov11_022F22F4
ov11_022F22F4: ; 0x022F22F4
	stmdb sp!, {r4, lr}
	ldr r1, _022F2598 ; =0x02324CC8
	mov r4, r0
	ldr r0, [r1]
	ldr r2, [r0, #4]
	cmp r2, #3
	bne _022F231C
	ldr r0, [r1, #4]
	bl ov11_022EE138
	b _022F2344
_022F231C:
	sub r0, r2, #4
	cmp r0, #3
	bhi _022F2334
	ldr r0, [r1, #4]
	bl ov11_022EE210
	b _022F2344
_022F2334:
	cmp r2, #8
	bne _022F2344
	ldr r0, [r1, #4]
	bl ov11_022EE2D0
_022F2344:
	ldr r0, _022F2598 ; =0x02324CC8
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #1
	strb r3, [r1, #9]
	ldr r1, [r0]
	strb r3, [r1, #8]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	strh r2, [r1]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022F239C
	bl ov11_022EBEAC
	ldr r0, _022F2598 ; =0x02324CC8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F2598 ; =0x02324CC8
	mov r1, #0
	str r1, [r0, #4]
	bl ov11_022F2AC4
_022F239C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F2598 ; =0x02324CC8
	cmp r4, #3
	str r0, [r1, #4]
	bne _022F23F8
	bl ov11_022EE0C8
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F23F8:
	cmp r4, #4
	bne _022F243C
	mov r1, #2
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F243C:
	cmp r4, #5
	bne _022F2480
	mov r1, #3
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2480:
	cmp r4, #6
	bne _022F24C4
	mov r1, #4
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F24C4:
	cmp r4, #7
	bne _022F2508
	mov r1, #1
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2508:
	cmp r4, #8
	bne _022F2548
	bl ov11_022EE268
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2548:
	cmp r4, #1
	ldreq r1, _022F259C ; =0x02321040
	ldr r0, _022F2598 ; =0x02324CC8
	ldrne r1, _022F25A0 ; =0x0232105C
	ldr r0, [r0, #4]
	bl ov11_022EBC18
	ldr r0, _022F2598 ; =0x02324CC8
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _022F2598 ; =0x02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
_022F2584:
	ldr r0, _022F2598 ; =0x02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F2598: .word 0x02324CC8
_022F259C: .word 0x02321040
_022F25A0: .word 0x0232105C
	arm_func_end ov11_022F22F4

	arm_func_start ov11_022F25A4
ov11_022F25A4: ; 0x022F25A4
	stmdb sp!, {r4, lr}
	ldr r1, _022F26D0 ; =0x02324CC8
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _022F26D4 ; =0x02321078
	ldr r3, [r0, #4]
	mov r2, r4
	mov r0, #1
	bl DebugPrint
	ldr r2, _022F26D0 ; =0x02324CC8
	mov r1, #0
	ldr r0, [r2]
	strb r1, [r0, #9]
	ldr r0, [r2]
	strb r1, [r0, #8]
	ldr r0, [r2]
	strh r4, [r0]
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #1
	cmp r4, r0
	bne _022F2628
	ldr r0, [r2, #4]
	sub r1, r1, #1
	bl ov11_022EC27C
	ldr r0, _022F26D0 ; =0x02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _022F26BC
_022F2628:
	ldr r1, _022F26D8 ; =0x0231DE10
	mov r0, r4, lsl #2
	ldrsh r0, [r1, r0]
	add r4, r1, r4, lsl #2
	ldrsh r1, [r4, #2]
	cmp r0, #2
	ldr r0, [r2, #4]
	bne _022F2650
	bl ov11_022EC240
	b _022F2654
_022F2650:
	bl ov11_022EC27C
_022F2654:
	ldr r0, _022F26D0 ; =0x02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	cmp r0, #0
	beq _022F26BC
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	ldrsh r0, [r4]
	cmp r0, #1
	bne _022F26BC
	ldr r0, _022F26D0 ; =0x02324CC8
	mov r1, #2
	ldr r0, [r0, #4]
	bl ov11_022EE620
_022F26BC:
	ldr r0, _022F26D0 ; =0x02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F26D0: .word 0x02324CC8
_022F26D4: .word 0x02321078
_022F26D8: .word 0x0231DE10
	arm_func_end ov11_022F25A4

	arm_func_start ov11_022F26DC
ov11_022F26DC: ; 0x022F26DC
	stmdb sp!, {r3, lr}
	cmp r0, #1
	beq _022F26FC
	cmp r0, #2
	beq _022F2714
	cmp r0, #3
	beq _022F272C
	ldmia sp!, {r3, pc}
_022F26FC:
	ldr r0, _022F2744 ; =0x02324CC8
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F2714:
	ldr r0, _022F2744 ; =0x02324CC8
	mov r1, #1
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F272C:
	ldr r0, _022F2744 ; =0x02324CC8
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2744: .word 0x02324CC8
	arm_func_end ov11_022F26DC

	arm_func_start ov11_022F2748
ov11_022F2748: ; 0x022F2748
	ldr r2, _022F2764 ; =0x02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F2768 ; =ov11_022EE144
	mov r1, r3
	bx ip
	.align 2, 0
_022F2764: .word 0x02324CC8
_022F2768: .word ov11_022EE144
	arm_func_end ov11_022F2748

	arm_func_start ov11_022F276C
ov11_022F276C: ; 0x022F276C
	ldr r2, _022F2788 ; =0x02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F278C ; =ov11_022EE15C
	mov r1, r3
	bx ip
	.align 2, 0
_022F2788: .word 0x02324CC8
_022F278C: .word ov11_022EE15C
	arm_func_end ov11_022F276C

	arm_func_start ov11_022F2790
ov11_022F2790: ; 0x022F2790
	ldr r2, _022F27AC ; =0x02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F27B0 ; =ov11_022EE17C
	mov r1, r3
	bx ip
	.align 2, 0
_022F27AC: .word 0x02324CC8
_022F27B0: .word ov11_022EE17C
	arm_func_end ov11_022F2790

	arm_func_start ov11_022F27B4
ov11_022F27B4: ; 0x022F27B4
	ldr r2, _022F27D0 ; =0x02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F27D4 ; =ov11_022EE230
	mov r1, r3
	bx ip
	.align 2, 0
_022F27D0: .word 0x02324CC8
_022F27D4: .word ov11_022EE230
	arm_func_end ov11_022F27B4

	arm_func_start ov11_022F27D8
ov11_022F27D8: ; 0x022F27D8
	ldr r0, _022F27E8 ; =0x02324CC8
	ldr ip, _022F27EC ; =ov11_022EE21C
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_022F27E8: .word 0x02324CC8
_022F27EC: .word ov11_022EE21C
	arm_func_end ov11_022F27D8

	arm_func_start ov11_022F27F0
ov11_022F27F0: ; 0x022F27F0
	bx lr
	arm_func_end ov11_022F27F0

	arm_func_start ov11_022F27F4
ov11_022F27F4: ; 0x022F27F4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr r0, _022F2914 ; =0x02324CC8
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #0
	beq _022F290C
	ldr r2, [r2, #4]
	sub r1, r2, #3
	cmp r1, #3
	bhi _022F283C
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _022F2914 ; =0x02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _022F290C
_022F283C:
	cmp r2, #7
	cmpne r2, #8
	beq _022F290C
	add r1, sp, #0x10
	mov r0, #0
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp, #0x10]
	streq r0, [sp, #0x14]
	add r0, sp, #8
	bl ov11_022F1E70
	ldr r0, _022F2914 ; =0x02324CC8
	add r1, sp, #0x10
	ldr r0, [r0]
	add r2, sp, #8
	add r0, r0, #0xc
	bl ov11_022F042C
	cmp r0, #0
	beq _022F28F0
	ldr r0, _022F2914 ; =0x02324CC8
	ldr r1, _022F2918 ; =0x0231DE10
	ldr r2, [r0]
	ldrsh r2, [r2]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bne _022F28CC
	add r0, sp, #0
	bl ov11_022F1E70
	ldr r0, _022F2914 ; =0x02324CC8
	add r2, sp, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
	b _022F28F0
_022F28CC:
	cmp r1, #2
	ldr r0, [r0, #4]
	mov r1, #0
	bne _022F28E8
	ldr r2, _022F291C ; =0x02321038
	bl ov11_022EF2D4
	b _022F28F0
_022F28E8:
	ldr r2, _022F2920 ; =0x02321030
	bl ov11_022EF2D4
_022F28F0:
	ldr r0, _022F2914 ; =0x02324CC8
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _022F2914 ; =0x02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
_022F290C:
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2914: .word 0x02324CC8
_022F2918: .word 0x0231DE10
_022F291C: .word 0x02321038
_022F2920: .word 0x02321030
	arm_func_end ov11_022F27F4

	arm_func_start ov11_022F2924
ov11_022F2924: ; 0x022F2924
	stmdb sp!, {r3, lr}
	ldr r0, _022F2948 ; =0x02324CC8
	ldr r1, [r0]
	ldrb r1, [r1, #9]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #4]
	bl ov11_022EFB70
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2948: .word 0x02324CC8
	arm_func_end ov11_022F2924

	arm_func_start ov11_022F294C
ov11_022F294C: ; 0x022F294C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _022F2AA0 ; =0x02324CD0
	mvn r3, #0
	str r0, [r2, #0xc]
	strh r3, [r2, #4]
	ldr r0, _022F2AA4 ; =0x02321278
	mov r1, #0xd80
	strh r3, [r2, #2]
	bl DebugPrint0__0200C1FC
	bl ov11_022F2F1C
	ldr r0, _022F2AA0 ; =0x02324CD0
	mov r1, #1
	strb r1, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _022F29A4
	cmp r0, #2
	beq _022F2A14
	cmp r0, #3
	beq _022F2A58
	b _022F2A98
_022F29A4:
	ldr r1, _022F2AA8 ; =0x02321298
	add r0, sp, #0
	mov r2, #0
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl sub_0201E13C
	ldr r1, _022F2AAC ; =0x023212B0
	add r0, sp, #0
	mov r2, #0
	bl LoadWteFromRom
	add r0, sp, #0
	mov r1, #0x4000
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0
	bl sub_0201E13C
	ldr r0, _022F2AB0 ; =0x023212C8
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =0x02324CD0
	str r0, [r1, #8]
	b _022F2A98
_022F2A14:
	ldr r1, _022F2AB4 ; =0x023212E0
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl sub_0201E13C
	ldr r0, _022F2AB8 ; =0x023212F8
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =0x02324CD0
	str r0, [r1, #8]
	b _022F2A98
_022F2A58:
	ldr r1, _022F2ABC ; =0x02321310
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl sub_0201E13C
	ldr r0, _022F2AC0 ; =0x02321328
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =0x02324CD0
	str r0, [r1, #8]
_022F2A98:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2AA0: .word 0x02324CD0
_022F2AA4: .word 0x02321278
_022F2AA8: .word 0x02321298
_022F2AAC: .word 0x023212B0
_022F2AB0: .word 0x023212C8
_022F2AB4: .word 0x023212E0
_022F2AB8: .word 0x023212F8
_022F2ABC: .word 0x02321310
_022F2AC0: .word 0x02321328
	arm_func_end ov11_022F294C

	arm_func_start ov11_022F2AC4
ov11_022F2AC4: ; 0x022F2AC4
	stmdb sp!, {r3, lr}
	bl ov11_022F2F1C
	ldr r0, _022F2AF8 ; =0x02324CD0
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022F2AFC ; =0x02324CD8
	bl sub_0201E020
	ldr r0, _022F2AF8 ; =0x02324CD0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2AF8: .word 0x02324CD0
_022F2AFC: .word 0x02324CD8
	arm_func_end ov11_022F2AC4

	arm_func_start ov11_022F2B00
ov11_022F2B00: ; 0x022F2B00
	cmp r0, #1
	bxne lr
	ldr r0, _022F2B24 ; =0x02324CD0
	ldr r2, [r0, #0xc]
	cmp r2, #3
	streqh r1, [r0, #2]
	ldreqsh r1, [r0, #2]
	streqh r1, [r0, #4]
	bx lr
	.align 2, 0
_022F2B24: .word 0x02324CD0
	arm_func_end ov11_022F2B00

	arm_func_start ov11_022F2B28
ov11_022F2B28: ; 0x022F2B28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r7, _022F2F04 ; =0x02324CD0
	mov r5, r1
	ldr r0, [r7, #0xc]
	cmp r0, #1
	beq _022F2B58
	cmp r0, #2
	beq _022F2C68
	cmp r0, #3
	beq _022F2D7C
	b _022F2ECC
_022F2B58:
	ldr r0, _022F2F08 ; =0x0000049C
	ldr sb, _022F2F0C ; =0x023892A0
	rsb r6, r0, #0x39c
	mov r4, #0
	mov fp, r6
_022F2B6C:
	mov r0, #0x48
	mul r8, r4, r0
	ldr r0, [r5]
	mov r1, #0x480
	add sl, sb, r8
	bl DivideInt
	ldr r0, _022F2F10 ; =0x023210D4
	ldr r0, [r0, r4, lsl #2]
	sub r0, r0, r1
	str r0, [sb, r8]
	ldr r0, [r5, #4]
	ldr r1, _022F2F08 ; =0x0000049C
	bl DivideInt
	ldr r0, _022F2F10 ; =0x023210D4
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x8c]
	sub r0, r0, r1
	str r0, [sl, #4]
	ldr r0, [sb, r8]
	cmp r0, #0x100
	bgt _022F2BC8
	cmp r0, r6
	bge _022F2BD0
_022F2BC8:
	mov r0, #0x12c
	str r0, [sl]
_022F2BD0:
	ldr r0, [sl, #4]
	cmp r0, #0x100
	bgt _022F2BE4
	cmp r0, fp
	bge _022F2BEC
_022F2BE4:
	mov r0, #0x12c
	str r0, [sl, #4]
_022F2BEC:
	mov r0, #0x48
	mul r8, r4, r0
	add sl, sb, r8
	mov r0, #0
	strb r0, [sl, #0x44]
	ldr r3, _022F2F10 ; =0x023210D4
	str r0, [sp]
	str r0, [sp, #4]
	add r3, r3, r4, lsl #2
	ldr r1, [r7, #8]
	ldr r3, [r3, #0x118]
	add r0, sl, #8
	mov r2, #0
	bl sub_0201E7D8
	ldr r0, [sb, r8]
	add r4, r4, #1
	strh r0, [sl, #8]
	ldr r0, [sl, #4]
	cmp r4, #0x23
	strh r0, [sl, #0xa]
	mov r0, #0x34
	strb r0, [sl, #0x37]
	ldrb r0, [sl, #0x45]
	bic r0, r0, #2
	strb r0, [sl, #0x45]
	mov r0, #0x3f
	strb r0, [sl, #0x46]
	mov r0, #0x7e
	strh r0, [sl, #0x32]
	blt _022F2B6C
	b _022F2ECC
_022F2C68:
	ldr r6, _022F2F0C ; =0x023892A0
	mov sl, #0
	mvn r4, #0xff
_022F2C74:
	mov r0, #0x48
	mul r8, sl, r0
	mov r0, sl
	mov r1, #5
	add sb, r6, r8
	bl DivideInt
	ldr r0, _022F2F14 ; =0x023210AC
	ldr r3, [r0, r1, lsl #2]
	ldr r1, [r5]
	mov r0, sl
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #23
	add r1, r2, r1, ror #23
	sub r1, r3, r1
	str r1, [r6, r8]
	mov r1, #5
	bl DivideInt
	mov fp, r0
	ldr r0, [r5, #4]
	mov r1, #0x300
	bl DivideInt
	ldr r0, _022F2F14 ; =0x023210AC
	add r0, r0, fp, lsl #2
	ldr r0, [r0, #0x14]
	sub r0, r0, r1
	str r0, [sb, #4]
	ldr r0, [r6, r8]
	cmp r0, #0x100
	bgt _022F2CF0
	cmp r0, r4
	bge _022F2CF8
_022F2CF0:
	mov r0, #0x12c
	str r0, [sb]
_022F2CF8:
	ldr r0, [sb, #4]
	cmp r0, #0x100
	bgt _022F2D0C
	cmp r0, r4
	bge _022F2D14
_022F2D0C:
	mov r0, #0x12c
	str r0, [sb, #4]
_022F2D14:
	mov r0, #0
	strb r0, [sb, #0x44]
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r1, [r7, #8]
	add r0, sb, #8
	mov r3, r2
	bl sub_0201E7D8
	ldr r0, [sb]
	add sl, sl, #1
	strh r0, [sb, #8]
	ldr r0, [sb, #4]
	cmp sl, #0x19
	strh r0, [sb, #0xa]
	mov r0, #0x80
	strb r0, [sb, #0x37]
	ldrb r0, [sb, #0x45]
	bic r0, r0, #2
	strb r0, [sb, #0x45]
	mov r0, #0x3f
	strb r0, [sb, #0x46]
	mov r0, #0x7e
	strh r0, [sb, #0x32]
	blt _022F2C74
	b _022F2ECC
_022F2D7C:
	ldrsh r1, [r7, #4]
	cmp r1, #0
	blt _022F2DB4
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movle r0, #0
	ble _022F2DB8
	sub r0, r0, #1
	strh r0, [r7, #2]
	ldrsh r2, [r7, #2]
	mov r0, #0xa0
	smulbb r0, r2, r0
	bl DivideInt
	b _022F2DB8
_022F2DB4:
	mov r0, #0xa0
_022F2DB8:
	ldr fp, _022F2F0C ; =0x023892A0
	mov sl, #0
	and r6, r0, #0xff
	mvn r4, #0xff
_022F2DC8:
	mov r0, #0x48
	mul r8, sl, r0
	mov r0, sl
	mov r1, #5
	add sb, fp, r8
	bl DivideInt
	mov r7, r1
	ldr r0, [r5]
	mov r1, #0xf0
	bl DivideInt
	ldr r0, _022F2F18 ; =0x02321098
	ldr r2, [r0, r7, lsl #2]
	mov r0, sl
	sub r1, r2, r1
	str r1, [fp, r8]
	mov r1, #5
	bl DivideInt
	mov r7, r0
	ldr r0, [r5, #4]
	mov r1, #0x300
	bl DivideInt
	ldr r0, _022F2F14 ; =0x023210AC
	add r0, r0, r7, lsl #2
	ldr r0, [r0, #0x14]
	sub r0, r0, r1
	str r0, [sb, #4]
	ldr r0, [fp, r8]
	cmp r0, #0x100
	bgt _022F2E44
	cmp r0, r4
	bge _022F2E4C
_022F2E44:
	mov r0, #0x12c
	str r0, [sb]
_022F2E4C:
	ldr r0, [sb, #4]
	cmp r0, #0x100
	bgt _022F2E60
	cmp r0, r4
	bge _022F2E68
_022F2E60:
	mov r0, #0x12c
	str r0, [sb, #4]
_022F2E68:
	mov r0, #0
	strb r0, [sb, #0x44]
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, _022F2F04 ; =0x02324CD0
	mov r2, #0
	ldr r1, [r1, #8]
	add r0, sb, #8
	mov r3, r2
	bl sub_0201E7D8
	ldr r0, [sb]
	add sl, sl, #1
	strh r0, [sb, #8]
	ldr r0, [sb, #4]
	cmp sl, #0x19
	strh r0, [sb, #0xa]
	strb r6, [sb, #0x37]
	ldrb r0, [sb, #0x45]
	bic r0, r0, #2
	strb r0, [sb, #0x45]
	mov r0, #0x3f
	strb r0, [sb, #0x46]
	mov r0, #0x7e
	strh r0, [sb, #0x32]
	blt _022F2DC8
_022F2ECC:
	ldr r5, _022F2F0C ; =0x023892A0
	mov r6, #0
	mov r4, #0x48
_022F2ED8:
	mla r1, r6, r4, r5
	ldrb r0, [r1, #0x45]
	tst r0, #2
	bne _022F2EF0
	add r0, r1, #8
	bl sub_0201F1D4
_022F2EF0:
	add r6, r6, #1
	cmp r6, #0x30
	blt _022F2ED8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F2F04: .word 0x02324CD0
_022F2F08: .word 0x0000049C
_022F2F0C: .word 0x023892A0
_022F2F10: .word 0x023210D4
_022F2F14: .word 0x023210AC
_022F2F18: .word 0x02321098
	arm_func_end ov11_022F2B28

	arm_func_start ov11_022F2F1C
ov11_022F2F1C: ; 0x022F2F1C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _022F2F54 ; =0x023892A0
	mov r6, #0
	mov r4, #0x48
_022F2F2C:
	mla r7, r6, r4, r5
	add r0, r7, #8
	bl sub_0201E730
	ldrb r0, [r7, #0x45]
	add r6, r6, #1
	cmp r6, #0x30
	orr r0, r0, #2
	strb r0, [r7, #0x45]
	blt _022F2F2C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F2F54: .word 0x023892A0
	arm_func_end ov11_022F2F1C

	arm_func_start ov11_022F2F58
ov11_022F2F58: ; 0x022F2F58
	stmdb sp!, {r3, lr}
	mov r0, #0x358
	mov r1, #1
	bl MemAlloc
	ldr r2, _022F2FE4 ; =0x02324CE0
	mov r1, #0
	str r0, [r2]
	str r1, [r0]
	ldr r0, [r2]
	strh r1, [r0, #4]
	ldr r0, [r2]
	strh r1, [r0, #6]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh r1, [r0, #0x38]
	ldr r0, [r2]
	strb r1, [r0, #0x10]
	ldr r0, [r2]
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	strb r1, [r0, #0x12]
	ldr r0, [r2]
	strb r1, [r0, #0x13]
	ldr r0, [r2]
	strb r1, [r0, #0x14]
	ldr r0, [r2]
	strb r1, [r0, #0x16]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	bl ov11_022F3010
	ldr r0, _022F2FE4 ; =0x02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x354]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2FE4: .word 0x02324CE0
	arm_func_end ov11_022F2F58

	arm_func_start ov11_022F2FE8
ov11_022F2FE8: ; 0x022F2FE8
	stmdb sp!, {r3, lr}
	bl ov11_022F3010
	ldr r0, _022F300C ; =0x02324CE0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F300C ; =0x02324CE0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F300C: .word 0x02324CE0
	arm_func_end ov11_022F2FE8

	arm_func_start ov11_022F3010
ov11_022F3010: ; 0x022F3010
	stmdb sp!, {r3, lr}
	bl ov11_022F4480
	ldr r2, _022F3050 ; =0x02324CE0
	mov r3, #0
	ldr r0, [r2]
	mov r1, #0x10
	str r3, [r0]
	ldr r0, [r2]
	strh r3, [r0, #4]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh r3, [r0, #0x38]
	ldr r0, [r2]
	add r0, r0, #0x344
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F3050: .word 0x02324CE0
	arm_func_end ov11_022F3010

	arm_func_start ov11_022F3054
ov11_022F3054: ; 0x022F3054
	ldr r0, _022F3088 ; =0x02324CE0
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022F3088: .word 0x02324CE0
	arm_func_end ov11_022F3054

	arm_func_start ov11_022F308C
ov11_022F308C: ; 0x022F308C
	ldr r0, _022F30D0 ; =0x02324CE0
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	beq _022F30C8
	ldr r0, [r1]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	bxls lr
_022F30C8:
	mov r0, #0
	bx lr
	.align 2, 0
_022F30D0: .word 0x02324CE0
	arm_func_end ov11_022F308C

	arm_func_start ov11_022F30D4
ov11_022F30D4: ; 0x022F30D4
	ldr ip, _022F30F8 ; =0x02324CE0
	ldr r3, [ip]
	add r3, r3, #0x300
	strh r0, [r3, #0x38]
	ldr r0, [ip]
	str r1, [r0, #0x33c]
	ldr r0, [ip]
	str r2, [r0, #0x340]
	bx lr
	.align 2, 0
_022F30F8: .word 0x02324CE0
	arm_func_end ov11_022F30D4

	arm_func_start ov11_022F30FC
ov11_022F30FC: ; 0x022F30FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	ldr r6, _022F37C4 ; =0x02324CE0
	ldr r2, [r6]
	ldr r0, [r2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022F373C
_022F311C: ; jump table
	b _022F350C ; case 0
	b _022F373C ; case 1
	b _022F3130 ; case 2
	b _022F373C ; case 3
	b _022F373C ; case 4
_022F3130:
	ldrsh r0, [r2, #4]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _022F373C
_022F3140: ; jump table
	b _022F373C ; case 0
	b _022F31A0 ; case 1
	b _022F373C ; case 2
	b _022F373C ; case 3
	b _022F3298 ; case 4
	b _022F3298 ; case 5
	b _022F3298 ; case 6
	b _022F3360 ; case 7
	b _022F373C ; case 8
	b _022F373C ; case 9
	b _022F3474 ; case 10
	b _022F373C ; case 11
	b _022F373C ; case 12
	b _022F3360 ; case 13
	b _022F3360 ; case 14
	b _022F373C ; case 15
	b _022F32FC ; case 16
	b _022F337C ; case 17
	b _022F337C ; case 18
	b _022F3360 ; case 19
	b _022F31A0 ; case 20
	b _022F3298 ; case 21
	b _022F3360 ; case 22
	b _022F3280 ; case 23
_022F31A0:
	add r1, r2, #0x100
	ldrh r3, [r1, #0xae]
	ldr r2, _022F37C8 ; =0x0000F3FF
	mov r4, #0x800
	orr r3, r3, #0x200
	strh r3, [r1, #0xae]
	ldr r1, [r6]
	mov r0, #0
	add r1, r1, #0x100
	strh r2, [r1, #0xa0]
	ldr r3, [r6]
	mov r1, r0
	add r3, r3, #0x100
	strh r4, [r3, #0xa6]
	ldr r5, [r6]
	mov r3, r0
	add r5, r5, #0x100
	strh r2, [r5, #0xa4]
	ldr r5, [r6]
	mov r2, #1
	add r5, r5, #0x100
	strh r4, [r5, #0xaa]
	bl sub_020091F8
	mov r0, #1
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #0
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #1
	str r0, [sp]
	mov r1, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r2, r4
	str r2, [sp, #8]
	bl sub_02009358
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0x800
	mov r2, r4
	add r0, r0, #0x1a0
	bl ov11_022F52E8
	mov r0, r6
	ldr r3, [r0]
	mov r2, r4
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3280:
	mov r1, #0
	str r1, [r2, #0x32c]
	ldr r0, [r6]
	str r1, [r0, #0x330]
	ldr r0, [r6]
	str r1, [r0, #0x334]
_022F3298:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	ldr r5, _022F37C4 ; =0x02324CE0
	mov r6, #0
	str r0, [r5, #4]
	mov r4, #0xc4
_022F32B4:
	ldr r0, [r5, #4]
	ldr r1, [r5]
	mla r0, r6, r4, r0
	add r1, r1, #0x1a0
	bl ov11_022F6F08
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F32B4
	ldr r0, _022F37C4 ; =0x02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F32FC:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	mov r5, r6
	mov r6, #0
	str r0, [r5, #4]
	mov r4, #0xc4
_022F3318:
	ldr r0, [r5, #4]
	ldr r1, [r5]
	mla r0, r6, r4, r0
	add r1, r1, #0x1a0
	bl ov11_022F6F08
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F3318
	ldr r0, _022F37C4 ; =0x02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3360:
	strh r0, [r2, #6]
	ldr r0, [r6]
	mov r1, #0
	strh r1, [r0, #4]
	ldr r0, [r6]
	str r1, [r0]
	b _022F373C
_022F337C:
	add r0, r2, #0x1a0
	mov r1, #0x800
	mov r2, #0
	bl ov11_022F52E8
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0x800
	mov r2, #0
	add r0, r0, #0x264
	bl ov11_022F52E8
	mov r7, r6
	ldr r1, [r7]
	ldr r5, _022F37C8 ; =0x0000F3FF
	add r2, r1, #0x100
	ldrh r3, [r2, #0xae]
	mov r4, #0x800
	mov r0, #0
	orr r3, r3, #0x200
	strh r3, [r2, #0xae]
	ldr r3, [r7]
	mov r1, r0
	add r3, r3, #0x100
	strh r5, [r3, #0xa0]
	ldr r6, [r7]
	mov r2, #1
	add r6, r6, #0x100
	strh r4, [r6, #0xa6]
	ldr r6, [r7]
	mov r3, r0
	add r6, r6, #0x100
	strh r5, [r6, #0xa4]
	ldr r5, [r7]
	add r5, r5, #0x100
	strh r4, [r5, #0xaa]
	bl sub_020091F8
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, r0
	mov r2, r0
	str r0, [sp, #8]
	bl sub_02009358
	mov r0, r7
	ldr r3, [r0]
	mov r2, #0
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3474:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	mov r5, r6
	ldr r6, _022F37CC ; =0x00000802
	mov r8, #0
	str r0, [r5, #4]
	mov sl, r8
	sub r7, r6, #1
	mov r4, #0xc4
_022F349C:
	mul sb, r8, r4
	ldr r0, [r5, #4]
	ldr r1, [r5]
	add r0, r0, sb
	add r1, r1, #0x1a0
	bl ov11_022F6F08
	cmp r8, #4
	movlt r1, r7
	movge r1, r6
	ldr r0, [r5, #4]
	mov r1, r1, lsl #0x10
	mov r2, sl
	add r0, r0, sb
	mov r1, r1, asr #0x10
	bl ov11_022F52E8
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F349C
	ldr r0, _022F37C4 ; =0x02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F350C:
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	beq _022F373C
	strh r0, [r2, #4]
	ldr r2, [r6]
	mov r0, #0
	ldr r1, [r2, #0x33c]
	str r1, [r2, #8]
	ldr r2, [r6]
	ldr r1, [r2, #0x340]
	str r1, [r2, #0xc]
	ldr r1, [r6]
	add r1, r1, #0x300
	strh r0, [r1, #0x38]
	ldr r2, [r6]
	ldrsh r1, [r2, #4]
	cmp r1, #0x22
	addls pc, pc, r1, lsl #2
	b _022F3734
_022F355C: ; jump table
	b _022F3734 ; case 0
	b _022F35F8 ; case 1
	b _022F35F0 ; case 2
	b _022F35E8 ; case 3
	b _022F35F8 ; case 4
	b _022F35F8 ; case 5
	b _022F35F8 ; case 6
	b _022F35F8 ; case 7
	b _022F3734 ; case 8
	b _022F3734 ; case 9
	b _022F35F8 ; case 10
	b _022F3734 ; case 11
	b _022F3734 ; case 12
	b _022F3604 ; case 13
	b _022F35F8 ; case 14
	b _022F3734 ; case 15
	b _022F35F8 ; case 16
	b _022F35F8 ; case 17
	b _022F35F8 ; case 18
	b _022F35F8 ; case 19
	b _022F35F8 ; case 20
	b _022F35F8 ; case 21
	b _022F35F8 ; case 22
	b _022F35F8 ; case 23
	b _022F3610 ; case 24
	b _022F3638 ; case 25
	b _022F3650 ; case 26
	b _022F365C ; case 27
	b _022F3678 ; case 28
	b _022F3698 ; case 29
	b _022F36AC ; case 30
	b _022F36D4 ; case 31
	b _022F36F4 ; case 32
	b _022F3704 ; case 33
	b _022F3714 ; case 34
_022F35E8:
	bl ov11_022F4480
	b _022F373C
_022F35F0:
	bl ov11_022F4480
	b _022F373C
_022F35F8:
	mov r0, #1
	str r0, [r2]
	b _022F373C
_022F3604:
	mov r0, #1
	str r0, [r2]
	b _022F373C
_022F3610:
	mov r0, #1
	bl sub_0206AA5C
	bl sub_0206AB98
	mov r0, #0
	bl ov11_022F44D0
	mov r0, r6
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x354]
	b _022F373C
_022F3638:
	ldrb r1, [r2, #0x354]
	cmp r1, #0
	moveq r0, #1
	and r0, r0, #0xff
	bl ov11_022F44D0
	b _022F373C
_022F3650:
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F365C:
	bl ov10_022C3138
	mov r1, r6
	ldr r1, [r1]
	mov r0, #1
	strb r0, [r1, #0x354]
	bl ov11_022F44D0
	b _022F373C
_022F3678:
	ldr r1, [r2, #0x33c]
	mov r0, #1
	str r1, [r2, #0x344]
	ldr r2, [r6]
	ldr r1, [r2, #0x340]
	str r1, [r2, #0x348]
	bl ov11_022F44D0
	b _022F373C
_022F3698:
	ldr r1, [r2, #0x33c]
	mov r0, #1
	str r1, [r2, #0x34c]
	bl ov11_022F44D0
	b _022F373C
_022F36AC:
	ldr r0, [r2, #0x33c]
	str r0, [r2, #0x350]
	ldr r0, [r6]
	ldr r1, [r0, #0x34c]
	ldr r2, [r0, #0x350]
	add r0, r0, #0x344
	bl ov10_022C328C
	mov r0, #0
	bl ov11_022F44D0
	b _022F373C
_022F36D4:
	ldr r0, [r2, #0x33c]
	str r0, [r2, #0x350]
	ldr r0, [r6]
	ldr r0, [r0, #0x350]
	bl ov10_022C3324
	mov r0, #0
	bl ov11_022F44D0
	b _022F373C
_022F36F4:
	bl ov10_022C3890
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F3704:
	bl ov11_022F4480
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F3714:
	mov r1, #1
	str r1, [r2]
	bl ov11_022F44D0
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0
	strb r1, [r0, #0x354]
	b _022F373C
_022F3734:
	mov r0, #0
	strh r0, [r2, #4]
_022F373C:
	ldr r0, _022F37C4 ; =0x02324CE0
	ldr r1, [r0]
	ldrsh r0, [r1, #6]
	sub r0, r0, #0x18
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022F37BC
_022F3758: ; jump table
	b _022F3778 ; case 0
	b _022F3778 ; case 1
	b _022F3794 ; case 2
	b _022F37BC ; case 3
	b _022F379C ; case 4
	b _022F379C ; case 5
	b _022F379C ; case 6
	b _022F379C ; case 7
_022F3778:
	ldrb r0, [r1, #0x354]
	cmp r0, #0
	beq _022F378C
	bl sub_0206AD80
	b _022F37BC
_022F378C:
	bl ov11_022F44F8
	b _022F37BC
_022F3794:
	bl sub_0206ADB8
	b _022F37BC
_022F379C:
	bl ov10_022C3378
	cmp r0, #0
	beq _022F37BC
	sub r0, r0, #2
	cmp r0, #1
	bhi _022F37B8
	bl ov11_022F44F8
_022F37B8:
	bl ov10_022C34F0
_022F37BC:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F37C4: .word 0x02324CE0
_022F37C8: .word 0x0000F3FF
_022F37CC: .word 0x00000802
	arm_func_end ov11_022F30FC

	arm_func_start ov11_022F37D0
ov11_022F37D0: ; 0x022F37D0
	stmdb sp!, {r3, lr}
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #1
	bne _022F3DE0
	ldrsh r0, [r3, #4]
	cmp r0, #0x22
	addls pc, pc, r0, lsl #2
	b _022F3DE0
_022F37F8: ; jump table
	b _022F3DE0 ; case 0
	b _022F38AC ; case 1
	b _022F3DE0 ; case 2
	b _022F3DE0 ; case 3
	b _022F38DC ; case 4
	b _022F393C ; case 5
	b _022F399C ; case 6
	b _022F3B80 ; case 7
	b _022F3DE0 ; case 8
	b _022F3DE0 ; case 9
	b _022F3D50 ; case 10
	b _022F3DE0 ; case 11
	b _022F3DE0 ; case 12
	b _022F3BEC ; case 13
	b _022F3BBC ; case 14
	b _022F3DE0 ; case 15
	b _022F3A44 ; case 16
	b _022F3C64 ; case 17
	b _022F3CD0 ; case 18
	b _022F3A98 ; case 19
	b _022F38AC ; case 20
	b _022F39F0 ; case 21
	b _022F3884 ; case 22
	b _022F399C ; case 23
	b _022F3DE0 ; case 24
	b _022F3DE0 ; case 25
	b _022F3DE0 ; case 26
	b _022F3DE0 ; case 27
	b _022F3DE0 ; case 28
	b _022F3DE0 ; case 29
	b _022F3DE0 ; case 30
	b _022F3DE0 ; case 31
	b _022F3DE0 ; case 32
	b _022F3DE0 ; case 33
	b _022F3DB0 ; case 34
_022F3884:
	mov r0, #0xe
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F38AC:
	ldr r1, _022F3E4C ; =0x0000012D
	ldr r2, _022F3E50 ; =0x08080000
	add r0, r3, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F38DC:
	mov r0, #1
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r2, _022F3E50 ; =0x08080000
	ldr r0, [r0]
	mov r1, #0xbd
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F393C:
	mov r0, #2
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r2, _022F3E50 ; =0x08080000
	ldr r0, [r0]
	mov r1, #0xbd
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F399C:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #3
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E54 ; =0x08080005
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xb6
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F39F0:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #4
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E54 ; =0x08080005
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xbe
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3A44:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #0x12
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	ldr r1, _022F3E58 ; =0x00000222
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	mov r2, #0x8000000
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3A98:
	bl ov14_0238CC94
	ldr r1, _022F3E48 ; =0x02324CE0
	ldr r1, [r1]
	str r0, [r1, #0x33c]
	bl ov14_0238CCA8
	ldr r1, _022F3E48 ; =0x02324CE0
	ldr r1, [r1]
	str r0, [r1, #0x340]
	mov r0, #0x11
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E5C ; =0x0B040000
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	ldr r1, [r0, #0x33c]
	add r0, r0, #0x18
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5BBC
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r2, _022F3E5C ; =0x0B040000
	ldr r1, [r0]
	add r0, r1, #0xdc
	ldr r1, [r1, #0x340]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5BBC
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #4
	add r0, r0, #0x18
	bl ov11_022F52E8
	bl ov14_0238CCA8
	bl FemaleToMaleForm
	ldr r1, _022F3E60 ; =0x00000807
	bl ov11_022F5D50
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r2, #0
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl ov11_022F52E8
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x13]
	ldr r2, [r0]
	strb r3, [r2, #0x14]
	ldr r2, [r0]
	strb r3, [r2, #0x16]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3B80:
	mov r0, #5
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3BBC:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #7
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3BEC:
	bl ov11_02314684
	cmp r0, #0
	beq _022F3C28
	bl ov11_023146B0
	cmp r0, #0
	bne _022F3C10
	ldr r0, _022F3E64 ; =0x02321340
	bl DebugPrint0__0200C1FC
	b _022F3DE0
_022F3C10:
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023146D4
	b _022F3C44
_022F3C28:
	mov r0, #0xc
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
_022F3C44:
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3C64:
	mov r0, #0xf
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E68 ; =0x0C080000
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xee
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xef
	add r0, r0, #0x264
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r2, [r0]
	strb r3, [r2, #0x12]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3CD0:
	mov r0, #0x10
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xec
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xed
	add r0, r0, #0x264
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r2, [r0]
	strb r3, [r2, #0x12]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3D50:
	mov r0, #8
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r1, _022F3E6C ; =0x0000010D
	ldr r0, [r0]
	ldr r2, _022F3E50 ; =0x08080000
	add r0, r0, #0x1a0
	bl ov11_022F6E60
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3DB0:
	mov r0, #0xb
	bl ov11_02314670
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_022F44F8
_022F3DE0:
	ldr r0, _022F3E48 ; =0x02324CE0
	ldr r1, [r0]
	ldrb r0, [r1, #0x354]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsh r0, [r1, #6]
	sub r0, r0, #0x18
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022F3E34
_022F3E08: ; jump table
	b _022F3E28 ; case 0
	b _022F3E28 ; case 1
	b _022F3E28 ; case 2
	b _022F3E30 ; case 3
	b _022F3E30 ; case 4
	b _022F3E30 ; case 5
	b _022F3E30 ; case 6
	b _022F3E30 ; case 7
_022F3E28:
	bl sub_0206ABB0
	b _022F3E34
_022F3E30:
	bl ov10_022C31A4
_022F3E34:
	ldr r0, _022F3E48 ; =0x02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x354]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F3E48: .word 0x02324CE0
_022F3E4C: .word 0x0000012D
_022F3E50: .word 0x08080000
_022F3E54: .word 0x08080005
_022F3E58: .word 0x00000222
_022F3E5C: .word 0x0B040000
_022F3E60: .word 0x00000807
_022F3E64: .word 0x02321340
_022F3E68: .word 0x0C080000
_022F3E6C: .word 0x0000010D
	arm_func_end ov11_022F37D0

	arm_func_start ov11_022F3E70
ov11_022F3E70: ; 0x022F3E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _022F434C ; =0x02324CE0
	ldr r2, [r3]
	ldrsh r0, [r2, #6]
	cmp r0, #0x22
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3E8C: ; jump table
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 0
	b _022F3F18 ; case 1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 3
	b _022F3F38 ; case 4
	b _022F3F38 ; case 5
	b _022F3F38 ; case 6
	b _022F41C0 ; case 7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 9
	b _022F426C ; case 10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 11
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 12
	b _022F41C0 ; case 13
	b _022F41C0 ; case 14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 15
	b _022F3FF4 ; case 16
	b _022F41D0 ; case 17
	b _022F41D0 ; case 18
	b _022F40D0 ; case 19
	b _022F3F18 ; case 20
	b _022F3F38 ; case 21
	b _022F41C0 ; case 22
	b _022F3F38 ; case 23
	b _022F41C8 ; case 24
	b _022F41C8 ; case 25
	b _022F41C8 ; case 26
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 27
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 29
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 31
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 32
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 33
	b _022F4344 ; case 34
_022F3F18:
	mov r4, #0x8000
	str r4, [r3, #8]
	add r0, r2, #0x1a0
	ldr r1, _022F4350 ; =0x02324CE8
	mov r2, #0
	str r4, [r3, #0xc]
	bl ov11_022F6F14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3F38:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov sl, #0xc4
	ldr r6, _022F4350 ; =0x02324CE8
	ldr r4, _022F434C ; =0x02324CE0
	mov r7, r8
	mov r5, r8
	mov sb, sl
_022F3F60:
	mov r0, r8
	bl ov11_0231598C
	ldrh r1, [r0]
	cmp r1, #0xff
	cmpne r1, #0
	beq _022F3FE4
	ldmib r0, {r3, fp}
	mov r2, r3, asr #0xb
	mov r1, fp, asr #0xb
	add r2, r3, r2, lsr #20
	add r1, fp, r1, lsr #20
	mov r2, r2, asr #0xc
	mov r3, r1, asr #0xc
	mov r1, r2, lsl #8
	str r1, [r4, #8]
	mov r1, r3, lsl #8
	str r1, [r4, #0xc]
	ldrh r1, [r0, #0x14]
	cmp r1, #8
	bhs _022F3FD0
	ldr r2, [r4, #4]
	ldr r1, [r0, #0xc]
	mla r0, r8, sl, r2
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r2, r7
	mov r1, r1, asr #0x10
	bl ov11_022F52E8
_022F3FD0:
	ldr r0, [r4, #4]
	mov r1, r6
	mla r0, r8, sb, r0
	mov r2, r5
	bl ov11_022F6F14
_022F3FE4:
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F3F60
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3FF4:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	mov r5, #0xc4
	ldr r6, _022F434C ; =0x02324CE0
	mov fp, sb
	mov r7, #1
	mov r4, r5
_022F4018:
	mov r0, sb
	bl ov11_023159B0
	mov r8, r0
	ldrh r0, [r8]
	cmp r0, #0xff
	beq _022F40C0
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	bne _022F4088
	mul sl, sb, r5
	ldr r0, [r6, #4]
	ldr r1, [r6]
	add r0, r0, sl
	add r1, r1, #0x1a0
	bl ov11_022F6F08
	ldr r0, [r6, #4]
	ldr r1, [r8, #0xc]
	add r0, r0, sl
	bl ov11_022F4974
	ldr r0, [r6, #4]
	ldrh r1, [r8, #0x14]
	add r0, r0, sl
	mov r2, fp
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F52E8
	strh r7, [r8, #0x16]
_022F4088:
	ldr r0, [r8, #8]
	cmp r0, #0xf000
	bls _022F40C0
	ldr r0, [r8, #4]
	ldr r1, _022F4350 ; =0x02324CE8
	sub r0, r0, #0x2000
	str r0, [r6, #8]
	ldr r0, [r8, #8]
	mov r2, #0
	sub r0, r0, #0x11000
	str r0, [r6, #0xc]
	ldr r0, [r6, #4]
	mla r0, sb, r4, r0
	bl ov11_022F6F14
_022F40C0:
	add sb, sb, #1
	cmp sb, #0x40
	blt _022F4018
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F40D0:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl ov11_0231598C
	ldr r1, _022F434C ; =0x02324CE0
	mov r2, #0x8100
	mov r4, r0
	str r2, [r1, #8]
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _022F414C
	ldr r0, [r1]
	ldr r0, [r0, #0x33c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl FemaleToMaleForm
	ldr r1, _022F4354 ; =0x00000807
	bl ov11_022F5D50
	ldrh r2, [r4, #0x10]
	ldr r1, _022F434C ; =0x02324CE0
	mov r2, r2, lsr #2
	add r2, r2, #4
	and r2, r2, #7
	ldr r3, [r1]
	mov r1, r0, lsl #0x10
	mov r2, r2, lsl #0x18
	add r0, r3, #0x18
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x18
	bl ov11_022F52E8
_022F414C:
	ldr r1, [r4, #8]
	ldr r0, _022F434C ; =0x02324CE0
	rsb r1, r1, #0xf0
	mov r1, r1, lsl #8
	str r1, [r0, #0xc]
	ldr r0, [r0]
	ldr r2, _022F4350 ; =0x02324CE8
	ldr r1, [r0, #0x33c]
	add r0, r0, #0x18
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _022F434C ; =0x02324CE0
	mov r1, #0x8100
	str r1, [r0, #8]
	ldr r1, [r4, #4]
	ldr r2, _022F4350 ; =0x02324CE8
	rsb r1, r1, #0xf0
	mov r1, r1, lsl #8
	str r1, [r0, #0xc]
	ldr r0, [r0]
	mov r3, #0
	ldr r1, [r0, #0x340]
	add r0, r0, #0xdc
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5C94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41C0:
	bl ov11_0231474C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41C8:
	bl sub_0206B9DC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41D0:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl ov11_0231598C
	ldrh r1, [r0]
	cmp r1, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r0, #4]
	ldr r2, _022F434C ; =0x02324CE0
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r1, _022F4350 ; =0x02324CE8
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r2, #0xc]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x1a0
	bl ov11_022F6F14
	mov r0, #1
	bl ov11_0231598C
	ldr r1, [r0, #4]
	ldr r2, _022F434C ; =0x02324CE0
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r1, _022F4350 ; =0x02324CE8
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r2, #0xc]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x264
	bl ov11_022F6F14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F426C:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r5, #0xc4
	ldr fp, _022F4350 ; =0x02324CE8
	ldr r6, _022F434C ; =0x02324CE0
	mov r7, r8
	mov r4, r5
_022F4290:
	mov r0, r8
	bl ov11_0231598C
	mov sb, r0
	ldrh r1, [sb]
	cmp r1, #0xff
	beq _022F4334
	ldrh r0, [sb, #0x14]
	cmp r0, #2
	bhs _022F4300
	mul sl, r8, r5
	add r0, r1, #0x800
	ldr r3, [r6, #4]
	mov r1, r0, lsl #0x10
	mov r2, r7
	add r0, r3, sl
	mov r1, r1, asr #0x10
	bl ov11_022F52E8
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #29
	add r0, r1, r0, ror #29
	ldr r1, [r6, #4]
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r0, r1, sl
	strh r2, [r0, #0x14]
	ldr r0, [r6, #4]
	add r0, r0, sl
	strh r2, [r0, #0x16]
_022F4300:
	ldr r0, [sb, #4]
	mov r1, fp
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #8]
	ldr r0, [sb, #8]
	mov r2, #0
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #0xc]
	ldr r0, [r6, #4]
	mla r0, r8, r4, r0
	bl ov11_022F6F14
_022F4334:
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F4290
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F4344:
	bl ov11_0231474C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F434C: .word 0x02324CE0
_022F4350: .word 0x02324CE8
_022F4354: .word 0x00000807
	arm_func_end ov11_022F3E70

	arm_func_start ov11_022F4358
ov11_022F4358: ; 0x022F4358
	bx lr
	arm_func_end ov11_022F4358

	arm_func_start ov11_022F435C
ov11_022F435C: ; 0x022F435C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022F447C ; =0x02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x11]
	cmp r1, #0
	beq _022F4388
	mov r1, #0
	strb r1, [r2, #0x11]
	ldr r0, [r0]
	add r0, r0, #0x1a0
	bl ov11_022F6EFC
_022F4388:
	ldr r0, _022F447C ; =0x02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x12]
	cmp r1, #0
	beq _022F43B0
	mov r1, #0
	strb r1, [r2, #0x12]
	ldr r0, [r0]
	add r0, r0, #0x264
	bl ov11_022F6EFC
_022F43B0:
	ldr r0, _022F447C ; =0x02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x13]
	cmp r1, #0
	beq _022F43D8
	mov r1, #0
	strb r1, [r2, #0x13]
	ldr r0, [r0]
	add r0, r0, #0x18
	bl ov11_022F6EFC
_022F43D8:
	ldr r0, _022F447C ; =0x02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	beq _022F4400
	mov r1, #0
	strb r1, [r2, #0x14]
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl ov11_022F6EFC
_022F4400:
	ldr r0, _022F447C ; =0x02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x16]
	cmp r1, #0
	beq _022F4430
	mov r1, #0
	strb r1, [r2, #0x16]
	ldr r0, [r0]
	ldr r0, [r0, #0x328]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_022F4430:
	ldr r5, _022F447C ; =0x02324CE0
	ldr r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	mov r4, #0xc4
_022F4448:
	ldr r0, [r5, #4]
	mla r0, r6, r4, r0
	bl ov11_022F6EFC
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F4448
	ldr r0, _022F447C ; =0x02324CE0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F447C ; =0x02324CE0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F447C: .word 0x02324CE0
	arm_func_end ov11_022F435C

	arm_func_start ov11_022F4480
ov11_022F4480: ; 0x022F4480
	stmdb sp!, {r3, lr}
	ldr r0, _022F44CC ; =0x02324CE0
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #6]
	bl sub_0206BA5C
	bl ov10_022C3890
	bl ov11_022F435C
	ldr r0, _022F44CC ; =0x02324CE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_023146F8
	ldr r0, _022F44CC ; =0x02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F44CC: .word 0x02324CE0
	arm_func_end ov11_022F4480

	arm_func_start ov11_022F44D0
ov11_022F44D0: ; 0x022F44D0
	stmdb sp!, {r3, lr}
	ldr r1, _022F44F4 ; =0x02324CE0
	cmp r0, #0
	ldr r1, [r1]
	ldrsh r0, [r1, #4]
	strh r0, [r1, #6]
	ldmeqia sp!, {r3, pc}
	bl ov11_022F44F8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F44F4: .word 0x02324CE0
	arm_func_end ov11_022F44D0

	arm_func_start ov11_022F44F8
ov11_022F44F8: ; 0x022F44F8
	ldr r0, _022F4514 ; =0x02324CE0
	mov r2, #0
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	bx lr
	.align 2, 0
_022F4514: .word 0x02324CE0
	arm_func_end ov11_022F44F8

	arm_func_start ov11_022F4518
ov11_022F4518: ; 0x022F4518
	stmdb sp!, {r3, lr}
	mov r0, #0x380
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F467C ; =0x02324CF0
	mov r1, #0x1c0
	str r0, [r2]
	mov r0, #0x2c0
	mov r2, #0
	bl ov10_022BDA84
	mov r0, #0x8000
	mov r1, #0xb
	bl ov10_022BDB80
	mov r0, #0x3c0
	bl sub_0205882C
	ldr r0, _022F467C ; =0x02324CF0
	mov r2, #0x20
	ldr r0, [r0]
	mov r1, #0
	str r2, [sp]
	mov r2, #0x2c0
	add r3, r0, #0x20
	bl ov11_022F5B88
	ldr r0, _022F467C ; =0x02324CF0
	mov r2, #0x10
	ldr r3, [r0]
	mov r1, #0
	str r2, [sp]
	add r0, r3, #0x10
	add r3, r3, #0x120
	mov r2, #0x7c
	bl ov11_022F5B88
	ldr r0, _022F467C ; =0x02324CF0
	mov r1, #0
	ldr r0, [r0]
	mov r3, r1
	add r2, r0, #0x1a0
_022F45AC:
	add r0, r1, #1
	str r3, [r2]
	add r1, r1, #4
	mov r0, r0, lsl #0x10
	str r1, [r2, #4]
	mov r1, r0, asr #0x10
	str r3, [r2, #8]
	cmp r1, #0x1c
	add r2, r2, #0xc
	blt _022F45AC
	ldr r0, _022F467C ; =0x02324CF0
	mov r1, #0
	ldr r0, [r0]
	add r2, r0, #0x2f0
_022F45E4:
	add r0, r3, #1
	stmia r2, {r1, r3}
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	str r1, [r2, #8]
	cmp r3, #0xc
	add r2, r2, #0xc
	blt _022F45E4
	ldr r0, _022F4680 ; =0x0238A034
	bl sub_0201C000
	ldr r0, _022F4684 ; =0x0238A040
	bl sub_0201C000
	ldr r1, _022F4688 ; =0x0238A020
	mov r2, #2
	ldrh ip, [r1, #0x18]
	mov r3, #0
	sub r0, r2, #3
	bic ip, ip, #0xc00
	strh ip, [r1, #0x18]
	ldrh ip, [r1, #0x1e]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x1e]
	ldrh ip, [r1, #0x24]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x24]
	ldrh ip, [r1, #0x2a]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x2a]
	ldrh ip, [r1, #0x2a]
	orr ip, ip, #0x800
	strh ip, [r1, #0x2a]
	str r3, [r1, #4]
	str r2, [r1, #8]
	str r3, [r1]
	bl ov11_022F46B4
	mvn r0, #0
	bl ov11_022F4734
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F467C: .word 0x02324CF0
_022F4680: .word 0x0238A034
_022F4684: .word 0x0238A040
_022F4688: .word 0x0238A020
	arm_func_end ov11_022F4518

	arm_func_start ov11_022F468C
ov11_022F468C: ; 0x022F468C
	stmdb sp!, {r3, lr}
	mov r2, #0
	ldr r1, _022F46B0 ; =0x0238A020
	sub r0, r2, #1
	str r2, [r1]
	bl ov11_022F46B4
	mvn r0, #0
	bl ov11_022F4734
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F46B0: .word 0x0238A020
	arm_func_end ov11_022F468C

	arm_func_start ov11_022F46B4
ov11_022F46B4: ; 0x022F46B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F472C ; =0x0238A05C
	mov r5, r0
	mov r0, r4
	bl sub_0201C000
	mov r0, r5
	bl sub_02065014
	cmp r0, #0
	ldrh r1, [r4, #0xa]
	ldrh r3, [r4, #4]
	beq _022F4700
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	ldr r0, _022F4730 ; =0x0238A020
	bic r3, r3, #0xc00
	mov r1, #3
	orr r2, r2, #0xc00
	b _022F471C
_022F4700:
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	ldr r0, _022F4730 ; =0x0238A020
	bic r3, r3, #0xc00
	mov r1, #2
	orr r2, r2, #0x800
_022F471C:
	strh r3, [r4, #4]
	strh r2, [r4, #0xa]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F472C: .word 0x0238A05C
_022F4730: .word 0x0238A020
	arm_func_end ov11_022F46B4

	arm_func_start ov11_022F4734
ov11_022F4734: ; 0x022F4734
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F47B4 ; =0x0238A068
	mov r5, r0
	mov r0, r4
	bl sub_0201C000
	mov r0, r5
	bl sub_02065014
	cmp r0, #0
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #4]
	beq _022F4788
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	bic r2, r2, #0xc00
	ldr r0, _022F47B8 ; =0x0238A020
	orr r1, r1, #0xc00
	strh r1, [r4, #0xa]
	strh r2, [r4, #4]
	mov r1, #3
	b _022F47AC
_022F4788:
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	bic r2, r2, #0xc00
	ldr r0, _022F47B8 ; =0x0238A020
	orr r1, r1, #0x800
	strh r1, [r4, #0xa]
	strh r2, [r4, #4]
	mov r1, #2
_022F47AC:
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F47B4: .word 0x0238A068
_022F47B8: .word 0x0238A020
	arm_func_end ov11_022F4734

	arm_func_start ov11_022F47BC
ov11_022F47BC: ; 0x022F47BC
	ldr r3, _022F47E8 ; =0x0238A05C
	ldr r2, _022F47EC ; =0x0238A068
	mov r1, #6
_022F47C8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F47C8
	ldr r0, _022F47F0 ; =0x0238A020
	ldr r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_022F47E8: .word 0x0238A05C
_022F47EC: .word 0x0238A068
_022F47F0: .word 0x0238A020
	arm_func_end ov11_022F47BC

	arm_func_start ov11_022F47F4
ov11_022F47F4: ; 0x022F47F4
	stmdb sp!, {r3, lr}
	bl ov10_022BDC0C
	ldr r0, _022F4818 ; =0x02324CF0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F4818 ; =0x02324CF0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F4818: .word 0x02324CF0
	arm_func_end ov11_022F47F4

	arm_func_start ov11_022F481C
ov11_022F481C: ; 0x022F481C
	strh r1, [r0, #0x90]
	ldrh r1, [r0, #0x90]
	tst r1, #0x2000
	bne _022F4860
	tst r1, #2
	movne r2, #0
	moveq r2, #0x38
	tst r1, #4
	movne r3, #0x38
	moveq r3, #0
	tst r1, #1
	movne ip, #8
	moveq ip, #0
	add r1, r3, r2
	add r1, ip, r1
	add r1, r1, #0x38
	str r1, [r0, #0xa8]
_022F4860:
	ldrh r1, [r0, #0x90]
	mov r2, #6
	tst r1, #0x10
	beq _022F488C
	ldr ip, _022F4948 ; =0x0238A034
	mov r3, r0
_022F4878:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F4878
	b _022F48EC
_022F488C:
	tst r1, #8
	beq _022F48B0
	ldr ip, _022F494C ; =0x0238A040
	mov r3, r0
_022F489C:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F489C
	b _022F48EC
_022F48B0:
	tst r1, #0x8000
	beq _022F48D4
	ldr ip, _022F4950 ; =0x0238A068
	mov r3, r0
_022F48C0:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F48C0
	b _022F48EC
_022F48D4:
	ldr ip, _022F4954 ; =0x0238A05C
	mov r3, r0
_022F48DC:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F48DC
_022F48EC:
	ldrh r2, [r0]
	ldr r1, _022F4958 ; =0x0000F3FF
	and r2, r2, r1
	strh r2, [r0]
	ldrh r2, [r0, #6]
	and r1, r2, r1
	strh r1, [r0, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x40
	ldrneh r1, [r0, #6]
	orrne r1, r1, #0x400
	strneh r1, [r0, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x20
	beq _022F493C
	ldrsh r1, [r0, #0xb0]
	cmp r1, #0
	ldreqsh r1, [r0, #0xb4]
	streqh r1, [r0, #0xb0]
	bx lr
_022F493C:
	mov r1, #0
	strh r1, [r0, #0xb0]
	bx lr
	.align 2, 0
_022F4948: .word 0x0238A034
_022F494C: .word 0x0238A040
_022F4950: .word 0x0238A068
_022F4954: .word 0x0238A05C
_022F4958: .word 0x0000F3FF
	arm_func_end ov11_022F481C

	arm_func_start ov11_022F495C
ov11_022F495C: ; 0x022F495C
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	ldr ip, _022F4970 ; =ov11_022F481C
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_022F4970: .word ov11_022F481C
	arm_func_end ov11_022F495C

	arm_func_start ov11_022F4974
ov11_022F4974: ; 0x022F4974
	ldrh r2, [r0, #0x90]
	tst r2, #0x2000
	strne r1, [r0, #0xa8]
	bx lr
	arm_func_end ov11_022F4974

	arm_func_start ov11_022F4984
ov11_022F4984: ; 0x022F4984
	strh r1, [r0, #0xb2]
	strh r2, [r0, #0xb4]
	bx lr
	arm_func_end ov11_022F4984

	arm_func_start ov11_022F4990
ov11_022F4990: ; 0x022F4990
	stmdb sp!, {r3, lr}
	ldrsh r1, [r0, #0x92]
	cmp r1, #0
	movlt r0, #0
	ldmltia sp!, {r3, pc}
	add r0, r0, #0xc
	bl sub_0201D1B0
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022F4990

	arm_func_start ov11_022F49B0
ov11_022F49B0: ; 0x022F49B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x9e]
	cmp r0, #0
	beq _022F4A0C
	ldrsh r1, [r4, #0x9c]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrsh r1, [r4, #0xa2]
	cmp r1, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0xa2]
	bl ov10_022BF964
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mvn r0, #0
	strh r0, [r4, #0xa2]
	mov r0, #0
	strh r0, [r4, #0x9e]
_022F4A0C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F49B0

	arm_func_start ov11_022F4A14
ov11_022F4A14: ; 0x022F4A14
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x80
	strh r0, [r4, #0x90]
	mov r0, #0
	ldr r3, _022F4AB4 ; =0x0238A05C
	mov r2, r4
	str r0, [r4, #0xa8]
	mov r1, #6
_022F4A38:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F4A38
	mov r1, #0
	str r1, [r4, #0xb8]
	str r1, [r4, #0xbc]
	sub r0, r1, #1
	str r0, [r4, #0xc0]
	strb r1, [r4, #0xb6]
	strh r1, [r4, #0xac]
	strh r1, [r4, #0xae]
	strh r0, [r4, #0x92]
	strh r1, [r4, #0x94]
	strh r0, [r4, #0x96]
	strb r0, [r4, #0x98]
	strh r1, [r4, #0x9a]
	strh r0, [r4, #0x9c]
	strh r1, [r4, #0x9e]
	strb r0, [r4, #0xa0]
	strh r0, [r4, #0xa2]
	mov r1, #0xff
	add r0, r4, #0xc
	strb r1, [r4, #0xa4]
	bl sub_0201C0B0
	mov r0, #0
	strb r0, [r4, #0x8a]
	strh r0, [r4, #0x8c]
	strh r0, [r4, #0x8e]
	strh r0, [r4, #0x88]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F4AB4: .word 0x0238A05C
	arm_func_end ov11_022F4A14

	arm_func_start ov11_022F4AB8
ov11_022F4AB8: ; 0x022F4AB8
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r5, r1
	mov r1, r3, lsr #0x10
	mov r6, r0
	mov r4, r2
	bl ov11_022F481C
	mov r1, #0
	str r1, [r6, #0xb8]
	str r1, [r6, #0xbc]
	sub r0, r1, #1
	str r0, [r6, #0xc0]
	strb r1, [r6, #0xb6]
	strh r1, [r6, #0xac]
	strh r1, [r6, #0xae]
	strh r0, [r6, #0x92]
	strh r1, [r6, #0x94]
	strh r0, [r6, #0x96]
	strb r0, [r6, #0x98]
	strh r1, [r6, #0x9a]
	strh r0, [r6, #0x9c]
	strh r1, [r6, #0x9e]
	strb r0, [r6, #0xa0]
	strh r0, [r6, #0xa2]
	mov r0, #0xff
	strb r0, [r6, #0xa4]
	strh r1, [r6, #0xb0]
	mov r1, #1
	strh r1, [r6, #0xb2]
	add r0, r6, #0xc
	strh r1, [r6, #0xb4]
	bl sub_0201C0B0
	mov r1, #0
	strh r1, [r6, #0x8c]
	strh r1, [r6, #0x8e]
	ldrh r0, [r6, #0x90]
	tst r0, #0x8000
	movne r1, #1
	strb r1, [r6, #0x8a]
	strh r4, [r6, #0x88]
	ldrsh r1, [r6, #0x88]
	cmp r1, #0
	beq _022F4B88
	add r0, r6, #0xc
	bl sub_0201C0E8
	add r0, r6, #0xc
	bl sub_0201D170
	strh r0, [r6, #0x8c]
	add r0, r6, #0xc
	bl sub_0201D100
	strh r0, [r6, #0x8e]
_022F4B88:
	cmp r5, #0
	beq _022F4BB4
	ldrsh r0, [r5, #2]
	cmp r0, #0
	ble _022F4BB4
	ldrh r0, [r5]
	strh r0, [r6, #0x8a]
	ldrh r0, [r5, #2]
	strh r0, [r6, #0x8c]
	ldrh r0, [r5, #4]
	strh r0, [r6, #0x8e]
_022F4BB4:
	ldrsh r0, [r6, #0x8c]
	cmp r0, #0
	mvnle r0, #0
	strleh r0, [r6, #0x8c]
	ldmleia sp!, {r4, r5, r6, pc}
	ldrh r2, [r6, #0xe]
	mov r0, r6
	add r1, r6, #0x8a
	orr r2, r2, #0x10
	strh r2, [r6, #0xe]
	bl ov11_022F4CD4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F4AB8

	arm_func_start ov11_022F4BE4
ov11_022F4BE4: ; 0x022F4BE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #0x90]
	tst r0, #0x200
	ldrnesh r0, [r4, #0x9e]
	cmpne r0, #0
	ldrnesh r1, [r4, #0xa2]
	mvnne r0, #0
	cmpne r1, r0
	beq _022F4C14
	ldrsh r0, [r4, #0xa2]
	bl ov10_022BDE50
_022F4C14:
	ldrh r0, [r4, #0x90]
	tst r0, #0x4000
	beq _022F4C2C
	mov r0, r4
	bl ov11_022F4A14
	ldmia sp!, {r4, pc}
_022F4C2C:
	add r0, r4, #0xc
	bl sub_0201D18C
	ldrsh r1, [r4, #0x88]
	cmp r1, #0
	beq _022F4C54
	ldr r0, _022F4C60 ; =0x020AFC68
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	mov r0, #0
	strh r0, [r4, #0x88]
_022F4C54:
	mov r0, r4
	bl ov11_022F509C
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F4C60: .word 0x020AFC68
	arm_func_end ov11_022F4BE4

	arm_func_start ov11_022F4C64
ov11_022F4C64: ; 0x022F4C64
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov lr, r5
	mov ip, #0xc
_022F4C78:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022F4C78
	ldr r0, [r4]
	mov r2, #0
	str r0, [lr]
	ldrh r3, [r5, #0x90]
	sub r1, r2, #1
	mov r0, #0xff
	orr r3, r3, #0x4000
	strh r3, [r5, #0x90]
	str r2, [r5, #0xb8]
	str r2, [r5, #0xbc]
	str r1, [r5, #0xc0]
	strb r2, [r5, #0xb6]
	strh r2, [r5, #0xac]
	strh r2, [r5, #0xae]
	strh r2, [r5, #0x9e]
	strb r1, [r5, #0xa0]
	strh r1, [r5, #0xa2]
	strb r0, [r5, #0xa4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022F4C64

	arm_func_start ov11_022F4CD4
ov11_022F4CD4: ; 0x022F4CD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	ldrb r0, [r8, #0x8a]
	mov r7, #0
	ldrsh sb, [r1, #2]
	cmp r0, #0
	ldreq r3, _022F508C ; =0x02324CF0
	moveq r0, #0x1c
	ldreq r3, [r3]
	ldrsh r2, [r1, #4]
	addeq r3, r3, #0x1a0
	ldrne r3, _022F508C ; =0x02324CF0
	mov r1, #0
	ldrne r3, [r3]
	movne r0, #0xc
	addne r3, r3, #0x2f0
	mov r6, r7
	b _022F4D6C
_022F4D20:
	ldr r4, [r3]
	cmp r4, #0
	bne _022F4D58
	add r1, r1, #1
	cmp r1, r2
	blt _022F4D5C
	sub r4, r1, #1
	mov r0, #0xc
	mul r6, r4, r0
	sub r0, r7, r4
	mov r0, r0, lsl #0x10
	sub r3, r3, r6
	mov r7, r0, asr #0x10
	b _022F4D74
_022F4D58:
	mov r1, r6
_022F4D5C:
	add r4, r7, #1
	mov r4, r4, lsl #0x10
	mov r7, r4, asr #0x10
	add r3, r3, #0xc
_022F4D6C:
	cmp r7, r0
	blt _022F4D20
_022F4D74:
	cmp r1, r2
	blt _022F4DC0
	strh r7, [r8, #0x96]
	ldr r0, [r3, #4]
	mov r6, #1
	strb r0, [r8, #0x98]
	strh r2, [r8, #0x9a]
	str r6, [r3]
	str r8, [r3, #8]
	mov r4, #2
	mov r0, #0xc
	b _022F4DB0
_022F4DA4:
	mul r1, r6, r0
	str r4, [r3, r1]
	add r6, r6, #1
_022F4DB0:
	cmp r6, r2
	blt _022F4DA4
	mov r0, #1
	b _022F4DC4
_022F4DC0:
	mov r0, #0
_022F4DC4:
	cmp r0, #0
	beq _022F4DDC
	ldrsb r0, [r8, #0x98]
	cmp r0, #0x10
	movge sb, sb, lsl #1
	b _022F4DE4
_022F4DDC:
	mov r0, #0
	b _022F5084
_022F4DE4:
	ldrb r0, [r8, #0x8a]
	mov ip, #3
	cmp r0, #0
	ldreq r0, _022F508C ; =0x02324CF0
	ldreq r7, [r0]
	ldrne r0, _022F508C ; =0x02324CF0
	ldrne r0, [r0]
	addne r7, r0, #0x10
	and r0, ip, #2
	cmp r0, #2
	ldrsh r0, [r7, #0xe]
	bne _022F4F20
	ldr r3, [r7]
	mov r1, sb, lsl #0x10
	mov r6, r1, asr #0x10
	mov r2, r3
	sub r4, ip, #4
	add r0, r0, #1
	ldr lr, [r7, #4]
	mov r1, #0
	b _022F4E64
_022F4E38:
	ldr sl, [r2]
	tst sl, #1
	bne _022F4E5C
	ldrsh sl, [r2, #6]
	cmp sl, r6
	blt _022F4E5C
	cmp sl, r0
	movlt r4, r1
	movlt r0, sl
_022F4E5C:
	add r1, r1, #1
	add r2, r2, #8
_022F4E64:
	cmp r1, lr
	blt _022F4E38
	cmp r4, #0
	blt _022F5024
	add r5, r3, r4, lsl #3
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ble _022F4F10
	add r2, r3, lr, lsl #3
	b _022F4EA4
_022F4E8C:
	ldr r1, [r2, #-8]
	ldr r0, [r2, #-4]
	sub lr, lr, #1
	str r1, [r2]
	str r0, [r2, #4]
	sub r2, r2, #8
_022F4EA4:
	cmp lr, r4
	bgt _022F4E8C
	ldr r0, [r7, #4]
	add r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	cmp r1, r0
	ble _022F4EE8
	ldr r1, _022F5090 ; =0x0232134C
	add r0, sp, #0xc
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x18]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r1, _022F5094 ; =0x02321388
	ldmib r7, {r2, r3}
	bl FatalError
_022F4EE8:
	ldr r1, [r7]
	add r0, r4, #1
	add r1, r1, r0, lsl #3
	ldrsh r0, [r1, #4]
	add r0, r0, r6
	strh r0, [r1, #4]
	ldrsh r0, [r1, #6]
	sub r0, r0, r6
	strh r0, [r1, #6]
	strh r6, [r5, #6]
_022F4F10:
	mov r0, #3
	str r0, [r5]
	ldrsh r5, [r5, #4]
	b _022F5050
_022F4F20:
	mov r4, sb, lsl #0x10
	ldmia r7, {r3, lr}
	sub r1, lr, #1
	sub sl, ip, #4
	add r0, r0, #1
	add r2, r3, r1, lsl #3
	mov r6, r4, asr #0x10
	b _022F4F6C
_022F4F40:
	ldr r4, [r2]
	tst r4, #1
	bne _022F4F64
	ldrsh r4, [r2, #6]
	cmp r4, r6
	blt _022F4F64
	cmp r4, r0
	movlt sl, r1
	movlt r0, r4
_022F4F64:
	sub r1, r1, #1
	sub r2, r2, #8
_022F4F6C:
	cmp r1, #0
	bge _022F4F40
	cmp sl, #0
	blt _022F5024
	add r4, r3, sl, lsl #3
	ldrsh r0, [r4, #6]
	cmp r0, r6
	ble _022F5014
	add r2, r3, lr, lsl #3
	b _022F4FAC
_022F4F94:
	ldr r1, [r2, #-8]
	ldr r0, [r2, #-4]
	sub lr, lr, #1
	str r1, [r2]
	str r0, [r2, #4]
	sub r2, r2, #8
_022F4FAC:
	cmp lr, sl
	bgt _022F4F94
	ldr r0, [r7, #4]
	add r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	cmp r1, r0
	ble _022F4FF0
	ldr r1, _022F5090 ; =0x0232134C
	add r0, sp, #4
	ldr r2, [r1, #0xc]
	ldr r1, [r1, #8]
	str r2, [sp, #8]
	str r1, [sp, #4]
	ldr r1, _022F5094 ; =0x02321388
	ldmib r7, {r2, r3}
	bl FatalError
_022F4FF0:
	ldrsh r0, [r4, #6]
	sub r0, r0, r6
	strh r0, [r4, #6]
	ldrsh r1, [r4, #4]
	ldrsh r0, [r4, #6]
	add r4, r4, #8
	add r0, r1, r0
	strh r0, [r4, #4]
	strh r6, [r4, #6]
_022F5014:
	mov r0, #3
	str r0, [r4]
	ldrsh r5, [r4, #4]
	b _022F5050
_022F5024:
	ldr r1, _022F5090 ; =0x0232134C
	add r0, sp, #0x14
	ldr r4, [r1, #0x14]
	ldr sl, [r1, #0x10]
	ldr r1, _022F5098 ; =0x023213B0
	mov r2, r7
	mov r3, r6
	str sl, [sp, #0x14]
	str r4, [sp, #0x18]
	str ip, [sp]
	bl FatalError
_022F5050:
	cmp r5, #0
	strgeh sb, [r8, #0x94]
	strgeh r5, [r8, #0x92]
	movge r0, #1
	bge _022F5084
	mvn r1, #0
	str r1, [r8, #0xc0]
	mov r0, #0
	strb r0, [r8, #0xb6]
	strh r1, [r8, #0x92]
	strh r0, [r8, #0x94]
	strh r0, [r8, #0xac]
	strh r0, [r8, #0xae]
_022F5084:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F508C: .word 0x02324CF0
_022F5090: .word 0x0232134C
_022F5094: .word 0x02321388
_022F5098: .word 0x023213B0
	arm_func_end ov11_022F4CD4

	arm_func_start ov11_022F509C
ov11_022F509C: ; 0x022F509C
	stmdb sp!, {r3, r4, r5, lr}
	ldrsh r4, [r0, #0x92]
	cmp r4, #0
	blt _022F51D0
	ldrb r1, [r0, #0x8a]
	mov r3, #0
	cmp r1, #0
	ldreq r1, _022F5270 ; =0x02324CF0
	ldreq ip, [r1]
	ldrne r1, _022F5270 ; =0x02324CF0
	ldrne r1, [r1]
	addne ip, r1, #0x10
	ldmia ip, {r2, r5}
	b _022F51C8
_022F50D4:
	ldrsh r1, [r2, #4]
	cmp r1, r4
	bne _022F51C0
	mov r1, #0
	str r1, [r2]
	ldr r1, [ip, #4]
	sub r1, r1, #1
	cmp r3, r1
	bge _022F5150
	ldr r4, [r2, #8]
	add r1, r2, #8
	cmp r4, #0
	bne _022F5150
	ldrsh lr, [r2, #6]
	ldrsh r4, [r1, #6]
	add r5, r3, #1
	add r4, lr, r4
	strh r4, [r2, #6]
	ldr r4, [ip, #4]
	sub r4, r4, #1
	str r4, [ip, #4]
	b _022F5144
_022F512C:
	ldr lr, [r1, #8]
	ldr r4, [r1, #0xc]
	add r5, r5, #1
	str lr, [r1]
	str r4, [r1, #4]
	add r1, r1, #8
_022F5144:
	ldr r4, [ip, #4]
	cmp r5, r4
	blt _022F512C
_022F5150:
	cmp r3, #0
	ble _022F51AC
	ldr r1, [r2, #-8]
	sub r4, r2, #8
	cmp r1, #0
	bne _022F51AC
	ldrsh lr, [r4, #6]
	ldrsh r1, [r2, #6]
	add r1, lr, r1
	strh r1, [r4, #6]
	ldr r1, [ip, #4]
	sub r1, r1, #1
	str r1, [ip, #4]
	b _022F51A0
_022F5188:
	ldr lr, [r2, #8]
	ldr r1, [r2, #0xc]
	add r3, r3, #1
	str lr, [r2]
	str r1, [r2, #4]
	add r2, r2, #8
_022F51A0:
	ldr r1, [ip, #4]
	cmp r3, r1
	blt _022F5188
_022F51AC:
	mvn r1, #0
	strh r1, [r0, #0x92]
	mov r1, #0
	strh r1, [r0, #0x94]
	b _022F51D0
_022F51C0:
	add r3, r3, #1
	add r2, r2, #8
_022F51C8:
	cmp r3, r5
	blt _022F50D4
_022F51D0:
	ldrsh r4, [r0, #0x96]
	cmp r4, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldrb r1, [r0, #0x8a]
	cmp r1, #0
	bne _022F5204
	ldr r1, _022F5270 ; =0x02324CF0
	mov r2, #0xc
	ldr r3, [r1]
	mov r1, #0x1c
	add r3, r3, #0x1a0
	smlabb r5, r4, r2, r3
	b _022F5218
_022F5204:
	ldr r2, _022F5270 ; =0x02324CF0
	mov r1, #0xc
	ldr r2, [r2]
	add r2, r2, #0x2f0
	smlabb r5, r4, r1, r2
_022F5218:
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	mov r3, #0
	str r3, [r5, #8]
	str r3, [r5], #0xc
	mov r4, r2, asr #0x10
	b _022F5250
_022F5234:
	ldr r2, [r5]
	cmp r2, #2
	bne _022F5258
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	str r3, [r5], #0xc
	mov r4, r2, asr #0x10
_022F5250:
	cmp r4, r1
	blt _022F5234
_022F5258:
	mvn r1, #0
	strh r1, [r0, #0x96]
	strb r1, [r0, #0x98]
	mov r1, #0
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F5270: .word 0x02324CF0
	arm_func_end ov11_022F509C

	arm_func_start ov11_022F5274
ov11_022F5274: ; 0x022F5274
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, #0
	ldr r5, _022F52E0 ; =0x0238A04C
	mov r4, r6
_022F5288:
	mov r0, r6
	add r1, r5, r6, lsl #3
	bl ov11_022EB3C8
	cmp r0, #0
	streq r4, [r5, r6, lsl #3]
	addeq r0, r5, r6, lsl #3
	add r6, r6, #1
	streq r4, [r0, #4]
	cmp r6, #2
	blt _022F5288
	bl ov11_022FBA68
	bl ov11_022FD510
	bl ov11_022FE8CC
	ldr r1, _022F52E4 ; =0x0238A020
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	strh r2, [sp]
	strh r1, [sp, #2]
	bl ov10_022BF7E0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F52E0: .word 0x0238A04C
_022F52E4: .word 0x0238A020
	arm_func_end ov11_022F5274

	arm_func_start ov11_022F52E8
ov11_022F52E8: ; 0x022F52E8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldrsh r3, [r6, #0x92]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	bge _022F5324
	ldrsh r1, [r6, #0x8c]
	cmp r1, #0
	ble _022F5400
	add r1, r6, #0x8a
	bl ov11_022F4CD4
	cmp r0, #0
	beq _022F5400
_022F5324:
	tst r5, #0x400
	ldrneh r0, [r6, #0xc]
	bicne r0, r0, #0x1000
	strneh r0, [r6, #0xc]
	bne _022F5400
	mov r1, #1
	and r0, r5, #0x700
	strb r1, [r6, #0xb6]
	sub r1, r1, #2
	str r1, [r6, #0xc0]
	cmp r0, #0x100
	bgt _022F5360
	bge _022F5384
	cmp r0, #0
	b _022F5390
_022F5360:
	cmp r0, #0x200
	bgt _022F5370
	beq _022F539C
	b _022F5390
_022F5370:
	cmp r0, #0x300
	bne _022F5390
	mov r0, #0
	strh r0, [r6, #0xac]
	b _022F53A4
_022F5384:
	mov r0, #0x80
	strh r0, [r6, #0xac]
	b _022F53A4
_022F5390:
	mov r0, #0x100
	strh r0, [r6, #0xac]
	b _022F53A4
_022F539C:
	mov r0, #0x200
	strh r0, [r6, #0xac]
_022F53A4:
	mov r3, #0
	strh r3, [r6, #0xae]
	ldrb r2, [r6, #0x98]
	tst r5, #0x800
	movne r3, #1
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	and r1, r3, #0xff
	str r1, [sp, #8]
	ldrb r3, [r6, #0x8a]
	mov r0, r4, asr #2
	add r1, r4, r0, lsr #29
	str r3, [sp, #0xc]
	and r2, r5, #0xff
	add r1, r2, r1, asr #3
	ldrsh r3, [r6, #0x92]
	add r0, r6, #0xc
	and r2, r4, #7
	bl sub_0201C2CC
	ldrh r0, [r6, #0xe]
	orr r0, r0, #0x10
	strh r0, [r6, #0xe]
_022F5400:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F52E8

	arm_func_start ov11_022F5408
ov11_022F5408: ; 0x022F5408
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh ip, [r6, #0x90]
	mov r5, r1
	mov r4, r2
	tst ip, #0x200
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	streqh r4, [r6, #0x9e]
	ldreq r0, [sp, #0x10]
	streqb r3, [r6, #0xa0]
	streqb r0, [r6, #0xa4]
	beq _022F5458
	bl ov11_022F49B0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #1
	ldrnesh r0, [r6, #0x9e]
	cmpne r4, r0
	ldmneia sp!, {r4, r5, r6, pc}
_022F5458:
	strh r5, [r6, #0x9c]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F5408

	arm_func_start ov11_022F5460
ov11_022F5460: ; 0x022F5460
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x34
	mov r7, r2
	ldr r4, [r7]
	ldr r2, [r7, #4]
	mov r5, r0
	str r4, [r5, #0xb8]
	str r2, [r5, #0xbc]
	mov r2, #0
	str r2, [r5, #0xc0]
	ldrh r0, [r5, #0x90]
	mov r4, r1
	mov r6, r3
	tst r0, #0x200
	beq _022F5624
	ldrsh r0, [r5, #0x9e]
	cmp r0, #0
	beq _022F561C
	ldrsh r0, [r5, #0x9c]
	cmp r0, #1
	bne _022F54E8
	ldrsh r1, [r5, #0xa2]
	sub r0, r2, #1
	cmp r1, r0
	beq _022F54D4
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BDE50
	mvn r0, #0
	strh r0, [r5, #0xa2]
_022F54D4:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	mov r0, #0
	strh r0, [r5, #0x9e]
	b _022F5624
_022F54E8:
	cmp r0, #0
	bne _022F55B4
	ldrsh r1, [r5, #0xa2]
	sub r0, r2, #1
	cmp r1, r0
	bne _022F55A8
	add r0, sp, #8
	bl ov10_022BF274
	ldrsh r1, [r5, #0x9e]
	mov r0, #0
	ldr ip, _022F58F0 ; =0x0000FFFF
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r2, [r7]
	sub lr, r0, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0x14]
	ldr r2, [r7, #4]
	ldr r3, _022F58F4 ; =0x0232136C
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0x16]
	add r2, sp, #0x24
	strh r0, [sp, #0x18]
	strh r0, [sp, #0x1a]
	strb lr, [sp, #0x1c]
	str ip, [sp, #0x20]
	mov r1, #6
_022F5568:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F5568
	ldrh r0, [sp, #0x2e]
	orr r0, r0, #0x1c0
	strh r0, [sp, #0x2e]
	ldrh r0, [r5, #0x90]
	tst r0, #0x8000
	movne r1, #1
	moveq r1, #0
	add r0, sp, #8
	bl ov10_022BF2E4
	strh r0, [r5, #0xa2]
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF35C
_022F55A8:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	b _022F5624
_022F55B4:
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF964
	cmp r0, #0
	beq _022F5608
	ldrsh r0, [r5, #0x9c]
	cmp r0, #2
	bne _022F55DC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF394
	b _022F55FC
_022F55DC:
	cmp r0, #3
	bne _022F55FC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF444
	cmp r0, #0
	beq _022F55FC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF3EC
_022F55FC:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	b _022F5624
_022F5608:
	mvn r0, #0
	strh r0, [r5, #0xa2]
	mov r0, #0
	strh r0, [r5, #0x9e]
	b _022F5624
_022F561C:
	sub r0, r2, #1
	strh r0, [r5, #0x9c]
_022F5624:
	ldrsh r0, [r5, #0x92]
	cmp r0, #0
	movlt r0, #0
	blt _022F58E8
	ldrh r0, [r5, #0x90]
	tst r0, #0x80
	movne r0, #0
	bne _022F58E8
	ldr ip, [r7]
	ldr r7, [r7, #4]
	mov r2, ip, asr #7
	mov r3, r7, asr #7
	add r2, ip, r2, lsr #24
	add r3, r7, r3, lsr #24
	tst r0, #0x8000
	movne r1, #1
	mov ip, r2, asr #8
	mov r7, r3, asr #8
	moveq r1, #0
	str ip, [sp]
	str r7, [sp, #4]
	tst r0, #0x800
	bne _022F56A0
	ldr r3, _022F58F8 ; =0x0238A04C
	ldr r2, _022F58FC ; =0x0238A050
	ldr r3, [r3, r1, lsl #3]
	ldr r1, [r2, r1, lsl #3]
	sub r2, ip, r3
	sub r1, r7, r1
	str r2, [sp]
	str r1, [sp, #4]
_022F56A0:
	mov r1, r6, asr #7
	ldr r7, [sp, #4]
	add r1, r6, r1, lsr #24
	tst r0, #0x400
	sub r6, r7, r1, asr #8
	bne _022F56F4
	ldr r1, [sp]
	mvn r2, #0x3f
	cmp r1, r2
	blt _022F5870
	cmp r1, #0x140
	bge _022F5870
	add r1, r2, #0x30
	cmp r7, r1
	blt _022F5870
	cmp r7, #0xf0
	bge _022F5870
	cmp r6, r1
	blt _022F5870
	cmp r6, #0xf0
	bge _022F5870
_022F56F4:
	tst r0, #0x20
	beq _022F57D8
	ldrsh r1, [r5, #0xb4]
	mov r0, #0
	cmp r1, #0
	bne _022F5720
	ldr r1, _022F5900 ; =0x0238A020
	ldr r1, [r1]
	tst r1, #1
	movne r0, #1
	b _022F5768
_022F5720:
	ldrsh r1, [r5, #0xb0]
	cmp r1, #0
	ble _022F574C
	sub r1, r1, #1
	strh r1, [r5, #0xb0]
	ldrsh r1, [r5, #0xb0]
	cmp r1, #0
	ldrlesh r1, [r5, #0xb4]
	rsble r1, r1, #0
	strleh r1, [r5, #0xb0]
	b _022F5768
_022F574C:
	add r0, r1, #1
	strh r0, [r5, #0xb0]
	ldrsh r1, [r5, #0xb0]
	mov r0, #1
	cmp r1, #0
	ldrgesh r1, [r5, #0xb2]
	strgeh r1, [r5, #0xb0]
_022F5768:
	cmp r0, #0
	beq _022F57D8
	mov r0, r5
	mov r1, #0
	bl ov11_022F5904
	mov r0, #0x240
	strh r0, [r5, #0x28]
	mov r0, #0x130
	strh r0, [r5, #0x2a]
	mov r0, #0
	strh r0, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	mov r1, r5
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl sub_0201D110
	add r0, r5, #0xc
	bl sub_0201CF5C
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F57D0
	add r0, r5, #0xc
	bl sub_0201C108
_022F57D0:
	mov r0, #0
	b _022F58E8
_022F57D8:
	ldrb r1, [r5, #0xb6]
	mov r0, r5
	bl ov11_022F5904
	ldrh r0, [r5, #0x90]
	tst r0, #0x2000
	ldrne r2, [r5, #0xa8]
	bne _022F5808
	ldr r0, [r5, #0xa8]
	add r0, r7, r0
	add r2, r0, #2
	cmp r2, #2
	movlt r2, #2
_022F5808:
	ldr r0, [sp]
	mov r1, r5
	strh r0, [r5, #0x28]
	strh r6, [r5, #0x2a]
	strh r2, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl sub_0201D110
	add r0, r5, #0xc
	bl sub_0201CF5C
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F5854
	add r0, r5, #0xc
	bl sub_0201C108
_022F5854:
	cmp r4, #0
	ldrne r1, [sp]
	ldrne r0, [sp, #4]
	strne r1, [r4]
	strne r0, [r4, #4]
	mov r0, #1
	b _022F58E8
_022F5870:
	ldrb r0, [r5, #0xb6]
	cmp r0, #0
	beq _022F58E4
	mov r0, r5
	mov r1, #1
	bl ov11_022F5904
	mov r0, #0x240
	strh r0, [r5, #0x28]
	mov r0, #0x130
	strh r0, [r5, #0x2a]
	mov r0, #0
	strh r0, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	mov r1, r5
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl sub_0201D110
	add r0, r5, #0xc
	bl sub_0201CF5C
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F58DC
	add r0, r5, #0xc
	bl sub_0201C108
_022F58DC:
	mov r0, #0
	b _022F58E8
_022F58E4:
	mov r0, #0
_022F58E8:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F58F0: .word 0x0000FFFF
_022F58F4: .word 0x0232136C
_022F58F8: .word 0x0238A04C
_022F58FC: .word 0x0238A050
_022F5900: .word 0x0238A020
	arm_func_end ov11_022F5460

	arm_func_start ov11_022F5904
ov11_022F5904: ; 0x022F5904
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _022F5928
	mov r1, #0
	add r0, r4, #0xc
	strh r1, [r4, #0xae]
	bl sub_0201C458
	ldmia sp!, {r4, pc}
_022F5928:
	ldrsh r1, [r4, #0xae]
	ldrsh r0, [r4, #0xac]
	add r0, r1, r0
	strh r0, [r4, #0xae]
	b _022F5950
_022F593C:
	ldrsh r1, [r4, #0xae]
	add r0, r4, #0xc
	sub r1, r1, #0x100
	strh r1, [r4, #0xae]
	bl sub_0201C458
_022F5950:
	ldrsh r0, [r4, #0xae]
	cmp r0, #0x100
	bge _022F593C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F5904

	arm_func_start ov11_022F5960
ov11_022F5960: ; 0x022F5960
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrh lr, [r0, #0x90]
	tst lr, #0x200
	ldrnesh r4, [r0, #0xa2]
	mvnne ip, #0
	cmpne r4, ip
	beq _022F5A5C
	tst lr, #0x8000
	ldr lr, _022F5A68 ; =0x0232134C
	movne ip, #1
	ldrh r4, [lr, #4]
	moveq ip, #0
	strh r4, [sp, #4]
	ldrh r4, [lr, #6]
	strh r4, [sp, #6]
	ldr r4, [r1]
	mov lr, r4, asr #7
	add lr, r4, lr, lsr #24
	mov r4, lr, asr #8
	strh r4, [sp, #4]
	ldr lr, [r1, #4]
	mov r1, lr, asr #7
	add r1, lr, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x2000
	ldrne r1, [r0, #0xa8]
	addne ip, r1, #4
	bne _022F5A00
	ldr r1, _022F5A6C ; =0x0238A050
	ldrsh lr, [sp, #6]
	ldr r1, [r1, ip, lsl #3]
	ldr ip, [r0, #0xa8]
	sub r1, lr, r1
	add r1, ip, r1
	add ip, r1, #4
	cmp ip, #4
	movlt ip, #4
_022F5A00:
	ldrsh lr, [sp, #6]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	sub r1, lr, r1, asr #8
	strh r1, [sp, #6]
	cmp r2, #0
	beq _022F5A3C
	ldrsh lr, [sp, #4]
	ldr r1, [r2]
	ldrsh r3, [sp, #6]
	add r1, lr, r1
	strh r1, [sp, #4]
	ldr r1, [r2, #4]
	add r1, r3, r1
	strh r1, [sp, #6]
_022F5A3C:
	str r0, [sp]
	ldrsh r0, [r0, #0xa2]
	add r1, sp, #4
	mov r3, ip
	mov r2, #0
	bl ov10_022BF45C
	mov r0, #1
	b _022F5A60
_022F5A5C:
	mov r0, #0
_022F5A60:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5A68: .word 0x0232134C
_022F5A6C: .word 0x0238A050
	arm_func_end ov11_022F5960

	arm_func_start ov11_022F5A70
ov11_022F5A70: ; 0x022F5A70
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r3, r0
	ldrh r0, [r3, #0x90]
	tst r0, #0x100
	beq _022F5B58
	ldr r4, [r1]
	tst r0, #0x8000
	mov ip, r4, asr #7
	add ip, r4, ip, lsr #24
	mov r4, ip, asr #8
	strh r4, [sp, #8]
	ldr r4, [r1, #4]
	movne r0, #1
	mov r1, r4, asr #7
	add r1, r4, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	ldrh r1, [r3, #0x90]
	moveq r0, #0
	tst r1, #0x800
	bne _022F5AF0
	ldr ip, _022F5B64 ; =0x0238A04C
	ldr r1, _022F5B68 ; =0x0238A050
	ldrsh r4, [sp, #8]
	ldr lr, [ip, r0, lsl #3]
	ldrsh ip, [sp, #0xa]
	ldr r0, [r1, r0, lsl #3]
	sub r1, r4, lr
	sub r0, ip, r0
	strh r1, [sp, #8]
	strh r0, [sp, #0xa]
_022F5AF0:
	ldrh r1, [r3, #0x90]
	tst r1, #0x10
	ldrne r0, _022F5B6C ; =0x0238A020
	ldrne r4, [r0, #4]
	bne _022F5B28
	tst r1, #8
	ldrne r0, _022F5B6C ; =0x0238A020
	ldrne r4, [r0, #8]
	bne _022F5B28
	tst r1, #0x8000
	ldrne r0, _022F5B6C ; =0x0238A020
	ldrne r4, [r0, #0x10]
	ldreq r0, _022F5B6C ; =0x0238A020
	ldreq r4, [r0, #0xc]
_022F5B28:
	tst r1, #0x40
	movne ip, #1
	moveq ip, #0
	mov r0, r2
	add r2, r3, #0xc
	add r1, sp, #8
	str r4, [sp]
	and ip, ip, #0xff
	mov r3, #1
	str ip, [sp, #4]
	bl sub_02058AFC
	b _022F5B5C
_022F5B58:
	mov r0, #0
_022F5B5C:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022F5B64: .word 0x0238A04C
_022F5B68: .word 0x0238A050
_022F5B6C: .word 0x0238A020
	arm_func_end ov11_022F5A70

	arm_func_start ov11_022F5B70
ov11_022F5B70: ; 0x022F5B70
	ldr r0, _022F5B84 ; =0x0238A020
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
_022F5B84: .word 0x0238A020
	arm_func_end ov11_022F5B70

	arm_func_start ov11_022F5B88
ov11_022F5B88: ; 0x022F5B88
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r3, [r0]
	mov ip, #1
	ldr r3, [sp]
	str ip, [r0, #4]
	str r3, [r0, #8]
	ldr r3, [r0]
	mov r0, #0
	str r0, [r3]
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	bx lr
	arm_func_end ov11_022F5B88

	arm_func_start ov11_022F5BBC
ov11_022F5BBC: ; 0x022F5BBC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r6, r0
	tst r5, #0x80000000
	movne r4, #0xf
	mov r0, r1
	moveq r4, #0xe
	bl GetSpriteIndex__02052724
	mov r2, #0
	str r2, [sp]
	ldr r1, _022F5C38 ; =0x020AFC68
	mov r2, r0
	ldr r0, [r1]
	mov r3, r4
	mov r1, #2
	bl sub_0201D484
	mov r2, r0
	mov r0, r6
	mov r3, r5
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r6, #0x92]
	cmp r0, #0
	blt _022F5C30
	mov r0, r6
	mov r1, #0x300
	mov r2, #0
	bl ov11_022F52E8
_022F5C30:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F5C38: .word 0x020AFC68
	arm_func_end ov11_022F5BBC

	arm_func_start ov11_022F5C3C
ov11_022F5C3C: ; 0x022F5C3C
	ldr ip, _022F5C44 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F5C44: .word ov11_022F4BE4
	arm_func_end ov11_022F5C3C

	arm_func_start ov11_022F5C48
ov11_022F5C48: ; 0x022F5C48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [sp, #0x18]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	bge _022F5C74
	mov r0, r5
	bl ov10_022BF00C
	str r0, [sp, #0x18]
_022F5C74:
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov11_022F5408
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022F5C48

	arm_func_start ov11_022F5C94
ov11_022F5C94: ; 0x022F5C94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r6, r1
	add r1, sp, #0xc
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl ov11_022F5460
	cmp r0, #0
	beq _022F5D48
	ldrsh r1, [r7, #0xa2]
	mvn r0, #0
	cmp r1, r0
	beq _022F5D38
	ldrb r0, [r7, #0xa4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022F5D24
_022F5CDC: ; jump table
	b _022F5CEC ; case 0
	b _022F5CEC ; case 1
	b _022F5CEC ; case 2
	b _022F5CEC ; case 3
_022F5CEC:
	ldrb r2, [r7, #0xa4]
	add r0, sp, #8
	add r1, r7, #0xc
	bl sub_0201CF90
	ldrsh lr, [sp, #8]
	ldrsh ip, [sp, #0xa]
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	mov r3, r4
	str lr, [sp]
	str ip, [sp, #4]
	bl ov11_022F5960
	b _022F5D38
_022F5D24:
	mov r0, r7
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
_022F5D38:
	mov r0, r7
	mov r1, r5
	mov r2, r6
	bl ov11_022F5A70
_022F5D48:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov11_022F5C94

	arm_func_start ov11_022F5D50
ov11_022F5D50: ; 0x022F5D50
	ldr r2, _022F6CF4 ; =0x000002C6
	cmp r0, r2
	bgt _022F6824
	bge _022F6E18
	sub r3, r2, #0xd3
	cmp r0, r3
	bgt _022F654C
	bge _022F6E18
	sub r3, r2, #0x160
	cmp r0, r3
	bgt _022F62EC
	bge _022F6E18
	cmp r0, #0x140
	bgt _022F6244
	bge _022F6E18
	ldr r2, _022F6CF8 ; =0x00000121
	cmp r0, r2
	bgt _022F61D0
	bge _022F6E20
	cmp r0, #0xfa
	bgt _022F6144
	bge _022F6E18
	sub r2, r0, #0xc
	cmp r2, #0xe2
	addls pc, pc, r2, lsl #2
	b _022F6E44
_022F5DB8: ; jump table
	b _022F6E18 ; case 0
	b _022F6E44 ; case 1
	b _022F6E44 ; case 2
	b _022F6E18 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E44 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E18 ; case 10
	b _022F6E44 ; case 11
	b _022F6E44 ; case 12
	b _022F6E44 ; case 13
	b _022F6E44 ; case 14
	b _022F6E44 ; case 15
	b _022F6E44 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E44 ; case 19
	b _022F6E44 ; case 20
	b _022F6E44 ; case 21
	b _022F6E44 ; case 22
	b _022F6E44 ; case 23
	b _022F6E44 ; case 24
	b _022F6E44 ; case 25
	b _022F6E44 ; case 26
	b _022F6E44 ; case 27
	b _022F6E44 ; case 28
	b _022F6E18 ; case 29
	b _022F6E18 ; case 30
	b _022F6E44 ; case 31
	b _022F6E44 ; case 32
	b _022F6E44 ; case 33
	b _022F6E44 ; case 34
	b _022F6E44 ; case 35
	b _022F6E44 ; case 36
	b _022F6E18 ; case 37
	b _022F6E20 ; case 38
	b _022F6E20 ; case 39
	b _022F6E44 ; case 40
	b _022F6E20 ; case 41
	b _022F6E44 ; case 42
	b _022F6E44 ; case 43
	b _022F6E44 ; case 44
	b _022F6E44 ; case 45
	b _022F6E20 ; case 46
	b _022F6E20 ; case 47
	b _022F6E44 ; case 48
	b _022F6E44 ; case 49
	b _022F6E44 ; case 50
	b _022F6E18 ; case 51
	b _022F6E44 ; case 52
	b _022F6E28 ; case 53
	b _022F6E44 ; case 54
	b _022F6E44 ; case 55
	b _022F6E44 ; case 56
	b _022F6E44 ; case 57
	b _022F6E44 ; case 58
	b _022F6E20 ; case 59
	b _022F6E18 ; case 60
	b _022F6E18 ; case 61
	b _022F6E18 ; case 62
	b _022F6E44 ; case 63
	b _022F6E44 ; case 64
	b _022F6E44 ; case 65
	b _022F6E44 ; case 66
	b _022F6E44 ; case 67
	b _022F6E44 ; case 68
	b _022F6E18 ; case 69
	b _022F6E18 ; case 70
	b _022F6E44 ; case 71
	b _022F6E44 ; case 72
	b _022F6E44 ; case 73
	b _022F6E44 ; case 74
	b _022F6E44 ; case 75
	b _022F6E18 ; case 76
	b _022F6E18 ; case 77
	b _022F6E44 ; case 78
	b _022F6E20 ; case 79
	b _022F6E18 ; case 80
	b _022F6E18 ; case 81
	b _022F6E44 ; case 82
	b _022F6E44 ; case 83
	b _022F6E44 ; case 84
	b _022F6E44 ; case 85
	b _022F6E20 ; case 86
	b _022F6E20 ; case 87
	b _022F6E44 ; case 88
	b _022F6E44 ; case 89
	b _022F6E44 ; case 90
	b _022F6E44 ; case 91
	b _022F6E44 ; case 92
	b _022F6E44 ; case 93
	b _022F6E44 ; case 94
	b _022F6E44 ; case 95
	b _022F6E44 ; case 96
	b _022F6E18 ; case 97
	b _022F6E18 ; case 98
	b _022F6E44 ; case 99
	b _022F6E44 ; case 100
	b _022F6E44 ; case 101
	b _022F6E44 ; case 102
	b _022F6E44 ; case 103
	b _022F6E18 ; case 104
	b _022F6E18 ; case 105
	b _022F6E18 ; case 106
	b _022F6E18 ; case 107
	b _022F6E44 ; case 108
	b _022F6E44 ; case 109
	b _022F6E44 ; case 110
	b _022F6E44 ; case 111
	b _022F6E44 ; case 112
	b _022F6E44 ; case 113
	b _022F6E44 ; case 114
	b _022F6E44 ; case 115
	b _022F6E44 ; case 116
	b _022F6E18 ; case 117
	b _022F6E18 ; case 118
	b _022F6E44 ; case 119
	b _022F6E20 ; case 120
	b _022F6E20 ; case 121
	b _022F6E20 ; case 122
	b _022F6E20 ; case 123
	b _022F6E44 ; case 124
	b _022F6E18 ; case 125
	b _022F6E44 ; case 126
	b _022F6E44 ; case 127
	b _022F6E44 ; case 128
	b _022F6E44 ; case 129
	b _022F6E18 ; case 130
	b _022F6E44 ; case 131
	b _022F6E18 ; case 132
	b _022F6E18 ; case 133
	b _022F6E18 ; case 134
	b _022F6E44 ; case 135
	b _022F6E44 ; case 136
	b _022F6E44 ; case 137
	b _022F6E20 ; case 138
	b _022F6E18 ; case 139
	b _022F6E44 ; case 140
	b _022F6E44 ; case 141
	b _022F6E44 ; case 142
	b _022F6E44 ; case 143
	b _022F6E44 ; case 144
	b _022F6E44 ; case 145
	b _022F6E44 ; case 146
	b _022F6E44 ; case 147
	b _022F6E44 ; case 148
	b _022F6E44 ; case 149
	b _022F6E20 ; case 150
	b _022F6E20 ; case 151
	b _022F6E20 ; case 152
	b _022F6E18 ; case 153
	b _022F6E18 ; case 154
	b _022F6E44 ; case 155
	b _022F6E44 ; case 156
	b _022F6E18 ; case 157
	b _022F6E44 ; case 158
	b _022F6E44 ; case 159
	b _022F6E44 ; case 160
	b _022F6E44 ; case 161
	b _022F6E44 ; case 162
	b _022F6E44 ; case 163
	b _022F6E44 ; case 164
	b _022F6E44 ; case 165
	b _022F6E44 ; case 166
	b _022F6E44 ; case 167
	b _022F6E44 ; case 168
	b _022F6E44 ; case 169
	b _022F6E44 ; case 170
	b _022F6E44 ; case 171
	b _022F6E44 ; case 172
	b _022F6E44 ; case 173
	b _022F6E44 ; case 174
	b _022F6E20 ; case 175
	b _022F6E20 ; case 176
	b _022F6E18 ; case 177
	b _022F6E20 ; case 178
	b _022F6E20 ; case 179
	b _022F6E44 ; case 180
	b _022F6E18 ; case 181
	b _022F6E44 ; case 182
	b _022F6E44 ; case 183
	b _022F6E44 ; case 184
	b _022F6E44 ; case 185
	b _022F6E20 ; case 186
	b _022F6E44 ; case 187
	b _022F6E18 ; case 188
	b _022F6E18 ; case 189
	b _022F6E18 ; case 190
	b _022F6E18 ; case 191
	b _022F6E18 ; case 192
	b _022F6E18 ; case 193
	b _022F6E18 ; case 194
	b _022F6E18 ; case 195
	b _022F6E18 ; case 196
	b _022F6E18 ; case 197
	b _022F6E18 ; case 198
	b _022F6E18 ; case 199
	b _022F6E18 ; case 200
	b _022F6E18 ; case 201
	b _022F6E18 ; case 202
	b _022F6E18 ; case 203
	b _022F6E18 ; case 204
	b _022F6E18 ; case 205
	b _022F6E18 ; case 206
	b _022F6E18 ; case 207
	b _022F6E18 ; case 208
	b _022F6E18 ; case 209
	b _022F6E18 ; case 210
	b _022F6E18 ; case 211
	b _022F6E18 ; case 212
	b _022F6E18 ; case 213
	b _022F6E18 ; case 214
	b _022F6E18 ; case 215
	b _022F6E18 ; case 216
	b _022F6E44 ; case 217
	b _022F6E44 ; case 218
	b _022F6E44 ; case 219
	b _022F6E18 ; case 220
	b _022F6E20 ; case 221
	b _022F6E18 ; case 222
	b _022F6E44 ; case 223
	b _022F6E44 ; case 224
	b _022F6E44 ; case 225
	b _022F6E18 ; case 226
_022F6144:
	cmp r0, #0xfd
	bgt _022F6154
	beq _022F6E18
	b _022F6E44
_022F6154:
	sub r1, r0, #0xfe
	cmp r1, #0x1a
	addls pc, pc, r1, lsl #2
	b _022F6E44
_022F6164: ; jump table
	b _022F6E20 ; case 0
	b _022F6E44 ; case 1
	b _022F6E44 ; case 2
	b _022F6E44 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E18 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E44 ; case 10
	b _022F6E44 ; case 11
	b _022F6E44 ; case 12
	b _022F6E44 ; case 13
	b _022F6E44 ; case 14
	b _022F6E44 ; case 15
	b _022F6E44 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E44 ; case 19
	b _022F6E20 ; case 20
	b _022F6E44 ; case 21
	b _022F6E20 ; case 22
	b _022F6E18 ; case 23
	b _022F6E18 ; case 24
	b _022F6E18 ; case 25
	b _022F6E20 ; case 26
_022F61D0:
	ldr r2, _022F6CFC ; =0x00000133
	cmp r0, r2
	bgt _022F6224
	bge _022F6E18
	sub r1, r2, #0xa
	cmp r0, r1
	bgt _022F6214
	sub r1, r2, #0x11
	cmp r0, r1
	blt _022F6E44
	beq _022F6E20
	sub r1, r2, #0xc
	cmp r0, r1
	subne r1, r2, #0xa
	cmpne r0, r1
	beq _022F6E18
	b _022F6E44
_022F6214:
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6224:
	cmp r0, #0x138
	bgt _022F6234
	beq _022F6E18
	b _022F6E44
_022F6234:
	add r1, r2, #0xc
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6244:
	sub r1, r2, #0x16c
	cmp r0, r1
	bgt _022F6298
	bge _022F6E18
	ldr r2, _022F6D00 ; =0x0000014F
	cmp r0, r2
	bgt _022F6274
	bge _022F6E18
	sub r1, r2, #6
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6274:
	add r1, r2, #6
	cmp r0, r1
	bgt _022F6288
	beq _022F6E20
	b _022F6E44
_022F6288:
	add r1, r2, #7
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6298:
	ldr r2, _022F6D04 ; =0x0000015D
	cmp r0, r2
	bgt _022F62C8
	bge _022F6E18
	sub r1, r2, #2
	cmp r0, r1
	bgt _022F62BC
	beq _022F6E18
	b _022F6E44
_022F62BC:
	cmp r0, #0x15c
	beq _022F6E18
	b _022F6E44
_022F62C8:
	add r1, r2, #4
	cmp r0, r1
	bgt _022F62DC
	beq _022F6E18
	b _022F6E44
_022F62DC:
	add r1, r2, #8
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F62EC:
	sub r1, r2, #0xf3
	cmp r0, r1
	bgt _022F64AC
	bge _022F6E18
	ldr r2, _022F6D08 ; =0x000001AB
	cmp r0, r2
	bgt _022F6454
	sub r1, r2, #0x3d
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022F6410
_022F6318: ; jump table
	b _022F6E18 ; case 0
	b _022F6E44 ; case 1
	b _022F6E18 ; case 2
	b _022F6E44 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E18 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E44 ; case 10
	b _022F6E18 ; case 11
	b _022F6E44 ; case 12
	b _022F6E18 ; case 13
	b _022F6E18 ; case 14
	b _022F6E18 ; case 15
	b _022F6E18 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E18 ; case 19
	b _022F6E44 ; case 20
	b _022F6E18 ; case 21
	b _022F6E44 ; case 22
	b _022F6E44 ; case 23
	b _022F6E44 ; case 24
	b _022F6E44 ; case 25
	b _022F6E44 ; case 26
	b _022F6E44 ; case 27
	b _022F6E18 ; case 28
	b _022F6E20 ; case 29
	b _022F6E44 ; case 30
	b _022F6E44 ; case 31
	b _022F6E20 ; case 32
	b _022F6E18 ; case 33
	b _022F6E44 ; case 34
	b _022F6E44 ; case 35
	b _022F6E18 ; case 36
	b _022F6E44 ; case 37
	b _022F6E44 ; case 38
	b _022F6E20 ; case 39
	b _022F6E18 ; case 40
	b _022F6E44 ; case 41
	b _022F6E44 ; case 42
	b _022F6E44 ; case 43
	b _022F6E18 ; case 44
	b _022F6E44 ; case 45
	b _022F6E18 ; case 46
	b _022F6E18 ; case 47
	b _022F6E18 ; case 48
	b _022F6E44 ; case 49
	b _022F6E18 ; case 50
	b _022F6E18 ; case 51
	b _022F6E18 ; case 52
	b _022F6E18 ; case 53
	b _022F6E18 ; case 54
	b _022F6E18 ; case 55
	b _022F6E44 ; case 56
	b _022F6E44 ; case 57
	b _022F6E44 ; case 58
	b _022F6E20 ; case 59
	b _022F6E20 ; case 60
	b _022F6E20 ; case 61
_022F6410:
	ldr r2, _022F6D0C ; =0x0000016A
	cmp r0, r2
	bgt _022F6430
	bge _022F6E20
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6430:
	add r1, r2, #1
	cmp r0, r1
	bgt _022F6444
	beq _022F6E20
	b _022F6E44
_022F6444:
	add r1, r2, #3
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6454:
	add r1, r2, #0x1b
	cmp r0, r1
	bgt _022F6488
	bge _022F6E18
	add r1, r2, #0x10
	cmp r0, r1
	bgt _022F6478
	beq _022F6E20
	b _022F6E44
_022F6478:
	add r1, r2, #0x1a
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6488:
	add r1, r2, #0x1c
	cmp r0, r1
	bgt _022F649C
	beq _022F6E18
	b _022F6E44
_022F649C:
	add r1, r2, #0x27
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F64AC:
	sub r1, r2, #0xe7
	cmp r0, r1
	bgt _022F64F8
	bge _022F6E18
	sub r1, r2, #0xef
	cmp r0, r1
	bgt _022F64D8
	bge _022F6E18
	cmp r0, #0x1d4
	beq _022F6E18
	b _022F6E44
_022F64D8:
	cmp r0, #0x1d8
	bgt _022F64E8
	beq _022F6E20
	b _022F6E44
_022F64E8:
	sub r1, r2, #0xe8
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F64F8:
	sub r1, r2, #0xdc
	cmp r0, r1
	bgt _022F6528
	bge _022F6E20
	cmp r0, #0x1e4
	bgt _022F6518
	beq _022F6E18
	b _022F6E44
_022F6518:
	sub r1, r2, #0xdd
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6528:
	sub r1, r2, #0xd5
	cmp r0, r1
	bgt _022F653C
	beq _022F6E18
	b _022F6E44
_022F653C:
	sub r1, r2, #0xd4
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F654C:
	sub r3, r2, #0x45
	cmp r0, r3
	bgt _022F66B0
	mov r1, r3
	cmp r0, r1
	bge _022F6E18
	cmp r0, #0x214
	bgt _022F6610
	bge _022F6E18
	sub r1, r2, #0xc4
	cmp r0, r1
	bgt _022F65BC
	bge _022F6E18
	cmp r0, #0x1f8
	bgt _022F6598
	bge _022F6E18
	cmp r0, #0x1f4
	beq _022F6E18
	b _022F6E44
_022F6598:
	sub r1, r2, #0xc8
	cmp r0, r1
	bgt _022F65AC
	beq _022F6E18
	b _022F6E44
_022F65AC:
	sub r1, r2, #0xc7
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F65BC:
	sub r1, r2, #0xb9
	cmp r0, r1
	bgt _022F65EC
	bge _022F6E20
	cmp r0, #0x204
	bgt _022F65DC
	beq _022F6E18
	b _022F6E44
_022F65DC:
	sub r1, r2, #0xbd
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F65EC:
	sub r1, r2, #0xb8
	cmp r0, r1
	bgt _022F6600
	beq _022F6E20
	b _022F6E44
_022F6600:
	sub r1, r2, #0xb3
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6610:
	sub r1, r2, #0x91
	cmp r0, r1
	bgt _022F665C
	bge _022F6E20
	sub r1, r2, #0xaf
	cmp r0, r1
	bgt _022F6640
	bge _022F6E20
	sub r1, r2, #0xb1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6640:
	cmp r0, #0x218
	bgt _022F6650
	beq _022F6E18
	b _022F6E44
_022F6650:
	cmp r0, #0x228
	beq _022F6E20
	b _022F6E44
_022F665C:
	cmp r0, #0x264
	bgt _022F668C
	bge _022F6E18
	sub r1, r2, #0x90
	cmp r0, r1
	bgt _022F667C
	beq _022F6E20
	b _022F6E44
_022F667C:
	sub r1, r2, #0x88
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F668C:
	sub r1, r2, #0x5f
	cmp r0, r1
	bgt _022F66A0
	beq _022F6E18
	b _022F6E44
_022F66A0:
	sub r1, r2, #0x58
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F66B0:
	cmp r0, #0x2a0
	bgt _022F6780
	bge _022F6E18
	sub r3, r2, #0x39
	cmp r0, r3
	bgt _022F6718
	mov r1, r3
	cmp r0, r1
	bge _022F6E20
	sub r1, r2, #0x3d
	cmp r0, r1
	bgt _022F66F4
	bge _022F6E18
	sub r1, r2, #0x44
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F66F4:
	sub r1, r2, #0x3c
	cmp r0, r1
	bgt _022F6708
	beq _022F6E20
	b _022F6E44
_022F6708:
	sub r1, r2, #0x3b
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6718:
	sub r3, r2, #0x2f
	cmp r0, r3
	bgt _022F6754
	mov r1, r3
	cmp r0, r1
	bge _022F6E18
	sub r1, r2, #0x34
	cmp r0, r1
	bgt _022F6744
	beq _022F6E20
	b _022F6E44
_022F6744:
	sub r1, r2, #0x33
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6754:
	sub r3, r2, #0x2d
	cmp r0, r3
	bgt _022F6770
	sub r2, r2, #0x2d
	cmp r0, r2
	beq _022F6E28
	b _022F6E44
_022F6770:
	sub r1, r2, #0x27
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6780:
	sub r1, r2, #0x13
	cmp r0, r1
	bgt _022F67D0
	bge _022F6E20
	sub r1, r2, #0x24
	cmp r0, r1
	bgt _022F67B0
	bge _022F6E18
	sub r1, r2, #0x25
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F67B0:
	cmp r0, #0x2b0
	bgt _022F67C0
	beq _022F6E18
	b _022F6E44
_022F67C0:
	sub r1, r2, #0x15
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F67D0:
	sub r1, r2, #0xc
	cmp r0, r1
	bgt _022F6800
	bge _022F6E20
	cmp r0, #0x2b4
	bgt _022F67F0
	beq _022F6E18
	b _022F6E44
_022F67F0:
	sub r1, r2, #0x11
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6800:
	sub r1, r2, #0xb
	cmp r0, r1
	bgt _022F6814
	beq _022F6E20
	b _022F6E44
_022F6814:
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6824:
	add r1, r2, #0xec
	cmp r0, r1
	bgt _022F6AF8
	bge _022F6E18
	add r1, r2, #0x53
	cmp r0, r1
	bgt _022F69A0
	bge _022F6E18
	add r1, r2, #0x34
	cmp r0, r1
	bgt _022F68FC
	bge _022F6E20
	add r1, r2, #0x13
	cmp r0, r1
	bgt _022F68A4
	bge _022F6E18
	add r1, r2, #7
	cmp r0, r1
	bgt _022F6880
	bge _022F6E18
	cmp r0, #0x2cc
	beq _022F6E18
	b _022F6E44
_022F6880:
	add r1, r2, #8
	cmp r0, r1
	bgt _022F6894
	beq _022F6E18
	b _022F6E44
_022F6894:
	add r1, r2, #9
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F68A4:
	add r1, r2, #0x18
	cmp r0, r1
	bgt _022F68D8
	bge _022F6E20
	add r1, r2, #0x14
	cmp r0, r1
	bgt _022F68C8
	beq _022F6E18
	b _022F6E44
_022F68C8:
	add r1, r2, #0x17
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F68D8:
	add r1, r2, #0x19
	cmp r0, r1
	bgt _022F68EC
	beq _022F6E20
	b _022F6E44
_022F68EC:
	add r1, r2, #0x20
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F68FC:
	add r1, r2, #0x3b
	cmp r0, r1
	bgt _022F694C
	bge _022F6E18
	cmp r0, #0x2fc
	bgt _022F6928
	bge _022F6E20
	add r1, r2, #0x35
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6928:
	add r1, r2, #0x37
	cmp r0, r1
	bgt _022F693C
	beq _022F6E18
	b _022F6E44
_022F693C:
	add r1, r2, #0x38
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F694C:
	add r1, r2, #0x4f
	cmp r0, r1
	bgt _022F697C
	bge _022F6E18
	add r1, r2, #0x4d
	cmp r0, r1
	bgt _022F6970
	beq _022F6E20
	b _022F6E44
_022F6970:
	cmp r0, #0x314
	beq _022F6E20
	b _022F6E44
_022F697C:
	add r1, r2, #0x50
	cmp r0, r1
	bgt _022F6990
	beq _022F6E20
	b _022F6E44
_022F6990:
	add r1, r2, #0x51
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69A0:
	cmp r0, #0x370
	bgt _022F6A50
	bge _022F6E20
	add r1, r2, #0x7c
	cmp r0, r1
	bgt _022F69F8
	bge _022F6E18
	cmp r0, #0x320
	bgt _022F69D8
	bge _022F6E18
	add r1, r2, #0x58
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69D8:
	cmp r0, #0x340
	bgt _022F69E8
	beq _022F6E18
	b _022F6E44
_022F69E8:
	add r1, r2, #0x7b
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69F8:
	add r1, r2, #0x8f
	cmp r0, r1
	bgt _022F6A2C
	bge _022F6E18
	add r1, r2, #0x80
	cmp r0, r1
	bgt _022F6A1C
	beq _022F6E18
	b _022F6E44
_022F6A1C:
	add r1, r2, #0x8c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6A2C:
	add r1, r2, #0x90
	cmp r0, r1
	bgt _022F6A40
	beq _022F6E20
	b _022F6E44
_022F6A40:
	add r1, r2, #0xa4
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6A50:
	add r1, r2, #0xc4
	cmp r0, r1
	bgt _022F6AA4
	bge _022F6E18
	add r1, r2, #0xb4
	cmp r0, r1
	bgt _022F6A80
	bge _022F6E20
	add r1, r2, #0xb3
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6A80:
	add r1, r2, #0xb9
	cmp r0, r1
	bgt _022F6A94
	beq _022F6E18
	b _022F6E44
_022F6A94:
	add r1, r2, #0xbb
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6AA4:
	add r1, r2, #0xd1
	cmp r0, r1
	bgt _022F6AD4
	bge _022F6E18
	add r1, r2, #0xc5
	cmp r0, r1
	bgt _022F6AC8
	beq _022F6E18
	b _022F6E44
_022F6AC8:
	cmp r0, #0x390
	beq _022F6E18
	b _022F6E44
_022F6AD4:
	add r1, r2, #0xdb
	cmp r0, r1
	bgt _022F6AE8
	beq _022F6E20
	b _022F6E44
_022F6AE8:
	add r1, r2, #0xe1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6AF8:
	add r1, r2, #0x124
	cmp r0, r1
	bgt _022F6C94
	bge _022F6E18
	ldr r1, _022F6D10 ; =0x000003D1
	cmp r0, r1
	bgt _022F6BD4
	bge _022F6E18
	sub r2, r1, #0x14
	cmp r0, r2
	bgt _022F6B70
	bge _022F6E20
	cmp r0, #0x3b4
	bgt _022F6B44
	bge _022F6E18
	sub r1, r1, #0x1e
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B44:
	sub r2, r1, #0x1c
	cmp r0, r2
	bgt _022F6B60
	sub r1, r1, #0x1c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B60:
	sub r1, r1, #0x18
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B70:
	sub r2, r1, #0xf
	cmp r0, r2
	bgt _022F6BAC
	bge _022F6E20
	sub r2, r1, #0x13
	cmp r0, r2
	bgt _022F6B9C
	sub r1, r1, #0x13
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B9C:
	sub r1, r1, #0x10
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6BAC:
	sub r2, r1, #0xe
	cmp r0, r2
	bgt _022F6BC8
	sub r1, r1, #0xe
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6BC8:
	cmp r0, #0x3c8
	beq _022F6E18
	b _022F6E44
_022F6BD4:
	add r2, r1, #8
	cmp r0, r2
	bgt _022F6C2C
	bge _022F6E18
	cmp r0, #0x3d4
	bgt _022F6C00
	bge _022F6E18
	add r1, r1, #2
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C00:
	add r2, r1, #4
	cmp r0, r2
	bgt _022F6C1C
	add r1, r1, #4
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C1C:
	add r1, r1, #5
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C2C:
	add r2, r1, #0x12
	cmp r0, r2
	bgt _022F6C68
	bge _022F6E20
	add r2, r1, #0xa
	cmp r0, r2
	bgt _022F6C58
	add r1, r1, #0xa
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C58:
	add r1, r1, #0x11
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C68:
	add r2, r1, #0x15
	cmp r0, r2
	bgt _022F6C84
	add r1, r1, #0x15
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6C84:
	add r1, r1, #0x16
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C94:
	cmp r0, #0x430
	bgt _022F6D70
	bge _022F6E20
	ldr r2, _022F6D14 ; =0x00000413
	cmp r0, r2
	bgt _022F6D18
	bge _022F6E20
	sub r1, r2, #0x12
	cmp r0, r1
	bgt _022F6CD0
	bge _022F6E20
	sub r1, r2, #0x26
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6CD0:
	sub r1, r2, #0x11
	cmp r0, r1
	bgt _022F6CE4
	beq _022F6E20
	b _022F6E44
_022F6CE4:
	sub r1, r2, #0x10
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
	.align 2, 0
_022F6CF4: .word 0x000002C6
_022F6CF8: .word 0x00000121
_022F6CFC: .word 0x00000133
_022F6D00: .word 0x0000014F
_022F6D04: .word 0x0000015D
_022F6D08: .word 0x000001AB
_022F6D0C: .word 0x0000016A
_022F6D10: .word 0x000003D1
_022F6D14: .word 0x00000413
_022F6D18:
	add r1, r2, #0x18
	cmp r0, r1
	bgt _022F6D4C
	bge _022F6E18
	add r1, r2, #0xb
	cmp r0, r1
	bgt _022F6D3C
	beq _022F6E18
	b _022F6E44
_022F6D3C:
	add r1, r2, #0x17
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6D4C:
	add r1, r2, #0x19
	cmp r0, r1
	bgt _022F6D60
	beq _022F6E18
	b _022F6E44
_022F6D60:
	add r1, r2, #0x1c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6D70:
	add r1, r2, #0x184
	cmp r0, r1
	bgt _022F6DC4
	bge _022F6E18
	ldr r2, _022F6E4C ; =0x00000441
	cmp r0, r2
	bgt _022F6DA0
	bge _022F6E20
	sub r1, r2, #5
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DA0:
	add r1, r2, #1
	cmp r0, r1
	bgt _022F6DB4
	beq _022F6E20
	b _022F6E44
_022F6DB4:
	add r1, r2, #8
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DC4:
	add r1, r2, #0x190
	cmp r0, r1
	bgt _022F6DF8
	bge _022F6E18
	ldr r1, _022F6E50 ; =0x0000044B
	cmp r0, r1
	bgt _022F6DE8
	beq _022F6E18
	b _022F6E44
_022F6DE8:
	add r1, r1, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DF8:
	ldr r1, _022F6E54 ; =0x00000457
	cmp r0, r1
	bgt _022F6E0C
	beq _022F6E18
	b _022F6E44
_022F6E0C:
	add r1, r1, #3
	cmp r0, r1
	bne _022F6E44
_022F6E18:
	ldr r0, _022F6E58 ; =0x00000807
	bx lr
_022F6E20:
	ldr r0, _022F6E5C ; =0x00000307
	bx lr
_022F6E28:
	ldr r0, _022F6E58 ; =0x00000807
	cmp r1, r0
	subne r0, r0, #0x500
	cmpne r1, r0
	ldreq r0, _022F6E58 ; =0x00000807
	movne r0, #0x300
	bx lr
_022F6E44:
	mov r0, #0x300
	bx lr
	.align 2, 0
_022F6E4C: .word 0x00000441
_022F6E50: .word 0x0000044B
_022F6E54: .word 0x00000457
_022F6E58: .word 0x00000807
_022F6E5C: .word 0x00000307
	arm_func_end ov11_022F5D50

	arm_func_start ov11_022F6E60
ov11_022F6E60: ; 0x022F6E60
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r6, r2
	mov r4, r0
	tst r6, #0x80000000
	movne r5, #0xf
	ldr r2, _022F6EF0 ; =0x0231EE54
	mov r0, #0xc
	moveq r5, #0xe
	smlabb r0, r1, r0, r2
	ldr r2, [r0, #4]
	cmp r2, #0
	moveq r2, #0
	beq _022F6EBC
	ldr r1, _022F6EF4 ; =0x023213F0
	add r0, sp, #0
	bl Sprintf
	ldr r0, _022F6EF8 ; =0x020AFC68
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, r5
	bl LoadWanTableEntry
	mov r2, r0
_022F6EBC:
	mov r0, r4
	mov r3, r6
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r4, #0x92]
	cmp r0, #0
	blt _022F6EE8
	mov r0, r4
	mov r1, #0x800
	mov r2, #0
	bl ov11_022F52E8
_022F6EE8:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F6EF0: .word 0x0231EE54
_022F6EF4: .word 0x023213F0
_022F6EF8: .word 0x020AFC68
	arm_func_end ov11_022F6E60

	arm_func_start ov11_022F6EFC
ov11_022F6EFC: ; 0x022F6EFC
	ldr ip, _022F6F04 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F6F04: .word ov11_022F4BE4
	arm_func_end ov11_022F6EFC

	arm_func_start ov11_022F6F08
ov11_022F6F08: ; 0x022F6F08
	ldr ip, _022F6F10 ; =ov11_022F4C64
	bx ip
	.align 2, 0
_022F6F10: .word ov11_022F4C64
	arm_func_end ov11_022F6F08

	arm_func_start ov11_022F6F14
ov11_022F6F14: ; 0x022F6F14
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F6F14

	arm_func_start ov11_022F6F4C
ov11_022F6F4C: ; 0x022F6F4C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mvn lr, #0
	mov ip, #1
	mov r3, r2
	add r1, sp, #0
	mov r4, r0
	strh lr, [sp, #2]
	strh ip, [sp, #4]
	mov r2, #0
	bl ov11_022F4AB8
	ldrsh r0, [r4, #0x92]
	cmp r0, #0
	blt _022F6F94
	mov r0, r4
	mov r1, #0x800
	mov r2, #0
	bl ov11_022F52E8
_022F6F94:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F6F4C

	arm_func_start ov11_022F6F9C
ov11_022F6F9C: ; 0x022F6F9C
	ldr ip, _022F6FA4 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F6FA4: .word ov11_022F4BE4
	arm_func_end ov11_022F6F9C

	arm_func_start ov11_022F6FA8
ov11_022F6FA8: ; 0x022F6FA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F6FA8

	arm_func_start ov11_022F6FE0
ov11_022F6FE0: ; 0x022F6FE0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r3, r1
	mov r5, r0
	mov r4, r2
	ldr r1, _022F7050 ; =0x02321400
	add r0, sp, #0
	mov r2, r3
	bl Sprintf
	ldr r0, _022F7054 ; =0x020AFC68
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0xe
	bl LoadWanTableEntry
	mov r2, r0
	mov r3, r4
	mov r0, r5
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r5, #0x92]
	cmp r0, #0
	blt _022F7048
	mov r0, r5
	mov r1, #0x800
	mov r2, #0
	bl ov11_022F52E8
_022F7048:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7050: .word 0x02321400
_022F7054: .word 0x020AFC68
	arm_func_end ov11_022F6FE0

	arm_func_start ov11_022F7058
ov11_022F7058: ; 0x022F7058
	ldr ip, _022F7060 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F7060: .word ov11_022F4BE4
	arm_func_end ov11_022F7058

	arm_func_start ov11_022F7064
ov11_022F7064: ; 0x022F7064
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F7064

	arm_func_start ov11_022F709C
ov11_022F709C: ; 0x022F709C
	stmdb sp!, {r3, lr}
	mov r0, #0x124
	mov r1, #6
	bl MemAlloc
	ldr r3, _022F70C8 ; =0x02324CF4
	ldr r1, _022F70CC ; =0x02321414
	mov r2, #0
	str r0, [r3]
	bl ov11_022DC8E8
	bl ov11_022F7104
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F70C8: .word 0x02324CF4
_022F70CC: .word 0x02321414
	arm_func_end ov11_022F709C

	arm_func_start ov11_022F70D0
ov11_022F70D0: ; 0x022F70D0
	stmdb sp!, {r3, lr}
	bl ov11_022F7104
	ldr r0, _022F7100 ; =0x02324CF4
	ldr r0, [r0]
	bl ov11_022DC934
	ldr r0, _022F7100 ; =0x02324CF4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F7100 ; =0x02324CF4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7100: .word 0x02324CF4
	arm_func_end ov11_022F70D0

	arm_func_start ov11_022F7104
ov11_022F7104: ; 0x022F7104
	stmdb sp!, {r3, lr}
	ldr r0, _022F713C ; =0x02324CF4
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xf0]
	ldr r1, [r0]
	str r2, [r1, #0x10c]
	ldr r0, [r0]
	bl ov11_022DCAE0
	ldr r0, _022F713C ; =0x02324CF4
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F713C: .word 0x02324CF4
	arm_func_end ov11_022F7104

	arm_func_start ov11_022F7140
ov11_022F7140: ; 0x022F7140
	stmdb sp!, {r3, lr}
	ldr r1, _022F7180 ; =0x02321464
	mov r0, #2
	bl DebugPrint
	ldr r1, _022F7184 ; =0x02324CF4
	mov r2, #1
	ldr r0, [r1]
	mov r3, #0x48
	str r2, [r0, #0x10c]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x100
	strh r3, [r0, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0x11d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7180: .word 0x02321464
_022F7184: .word 0x02324CF4
	arm_func_end ov11_022F7140

	arm_func_start ov11_022F7188
ov11_022F7188: ; 0x022F7188
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _022F71DC ; =0x023214A0
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl DebugPrint
	ldr r1, _022F71E0 ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r5, [r0, #0x10]
	ldr r0, [r1]
	strb r4, [r0, #0x11d]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F71DC: .word 0x023214A0
_022F71E0: .word 0x02324CF4
	arm_func_end ov11_022F7188

	arm_func_start ov11_022F71E4
ov11_022F71E4: ; 0x022F71E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022F7224 ; =0x023214E4
	mov r2, r4
	mov r0, #2
	bl DebugPrint
	ldr r0, _022F7228 ; =0x02324CF4
	ldr r2, [r0]
	ldr r1, [r2, #0x10c]
	cmp r1, #1
	movne r1, #3
	strne r1, [r2, #0x10c]
	ldrne r0, [r0]
	addne r0, r0, #0x100
	strneh r4, [r0, #0x12]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7224: .word 0x023214E4
_022F7228: .word 0x02324CF4
	arm_func_end ov11_022F71E4

	arm_func_start ov11_022F722C
ov11_022F722C: ; 0x022F722C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r6, r0
	mov r4, r2
	ldr r1, _022F7298 ; =0x0232150C
	mov r2, r6
	mov r3, r5
	mov r0, #2
	str r4, [sp]
	bl DebugPrint
	ldr r1, _022F729C ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7290
	mov r0, #4
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r6, [r0, #0x12]
	ldr r0, [r1]
	strb r5, [r0, #0x11c]
	ldr r0, [r1]
	strb r4, [r0, #0x11d]
_022F7290:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F7298: .word 0x0232150C
_022F729C: .word 0x02324CF4
	arm_func_end ov11_022F722C

	arm_func_start ov11_022F72A0
ov11_022F72A0: ; 0x022F72A0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #2
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetDebugFlag2
	cmp r0, #0
	beq _022F72F0
	add r1, sp, #8
	mov r0, r6
	bl ov11_022E466C
	str r5, [sp]
	ldr r1, _022F734C ; =0x02321548
	add r3, sp, #8
	mov r2, r7
	mov r0, #2
	str r4, [sp, #4]
	bl DebugPrint
_022F72F0:
	ldr r1, _022F7350 ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7344
	mov r0, #5
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r7, [r0, #0x12]
	ldr r3, [r1]
	add r1, r3, #0x114
_022F7324:
	ldrb r0, [r6], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F7324
	ldr r0, _022F7350 ; =0x02324CF4
	strb r5, [r3, #0x11c]
	ldr r0, [r0]
	strb r4, [r0, #0x11d]
_022F7344:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F734C: .word 0x02321548
_022F7350: .word 0x02324CF4
	arm_func_end ov11_022F72A0

	arm_func_start ov11_022F7354
ov11_022F7354: ; 0x022F7354
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #2
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetDebugFlag2
	cmp r0, #0
	beq _022F73A4
	add r1, sp, #8
	mov r0, r6
	bl ov11_022E466C
	str r5, [sp]
	ldr r1, _022F7400 ; =0x02321580
	add r3, sp, #8
	mov r2, r7
	mov r0, #2
	str r4, [sp, #4]
	bl DebugPrint
_022F73A4:
	ldr r1, _022F7404 ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F73F8
	mov r0, #6
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r7, [r0, #0x12]
	ldr r3, [r1]
	add r1, r3, #0x114
_022F73D8:
	ldrb r0, [r6], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F73D8
	ldr r0, _022F7404 ; =0x02324CF4
	strb r5, [r3, #0x11c]
	ldr r0, [r0]
	strb r4, [r0, #0x11d]
_022F73F8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F7400: .word 0x02321580
_022F7404: .word 0x02324CF4
	arm_func_end ov11_022F7354

	arm_func_start ov11_022F7408
ov11_022F7408: ; 0x022F7408
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl GetDebugFlag2
	cmp r0, #0
	beq _022F7444
	add r1, sp, #0
	mov r0, r5
	bl ov11_022E466C
	ldr r1, _022F7498 ; =0x023215B8
	add r2, sp, #0
	mov r0, #2
	bl DebugPrint
_022F7444:
	ldr r1, _022F749C ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7490
	mov r0, #7
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #6
	add r0, r0, #0x100
	strh r2, [r0, #0x1e]
	ldr r3, [r1]
	mov r1, #8
	add r2, r3, #0x114
_022F747C:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022F747C
	strb r4, [r3, #0x11d]
_022F7490:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022F7498: .word 0x023215B8
_022F749C: .word 0x02324CF4
	arm_func_end ov11_022F7408

	arm_func_start ov11_022F74A0
ov11_022F74A0: ; 0x022F74A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _022F74F8 ; =0x023215E4
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl DebugPrint
	ldr r1, _022F74FC ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #8
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r5, [r0, #0x1e]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r4, [r0, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F74F8: .word 0x023215E4
_022F74FC: .word 0x02324CF4
	arm_func_end ov11_022F74A0

	arm_func_start ov11_022F7500
ov11_022F7500: ; 0x022F7500
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl GetDebugFlag2
	cmp r0, #0
	beq _022F7540
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022F758C ; =0x02321614
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl DebugPrint
_022F7540:
	ldr r1, _022F7590 ; =0x02324CF4
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7584
	mov r0, #9
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r5, [r0, #0x12]
	ldr r0, [r1]
	add r1, r0, #0x114
_022F7574:
	ldrb r0, [r4], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F7574
_022F7584:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022F758C: .word 0x02321614
_022F7590: .word 0x02324CF4
	arm_func_end ov11_022F7500

	arm_func_start ov11_022F7594
ov11_022F7594: ; 0x022F7594
	stmdb sp!, {r3, lr}
	ldr r1, _022F75BC ; =0x02324CF4
	mov ip, #1
	ldr r3, [r1]
	mov r2, r0
	strb ip, [r3, #0xec]
	ldr r0, [r1]
	mov r1, #0
	bl ov11_022DCCEC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F75BC: .word 0x02324CF4
	arm_func_end ov11_022F7594

	arm_func_start ov11_022F75C0
ov11_022F75C0: ; 0x022F75C0
	ldr r0, _022F75EC ; =0x02324CF4
	ldr r1, [r0]
	ldr r0, [r1, #0x10c]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldr r0, [r1, #0xf0]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xec]
	bx lr
	.align 2, 0
_022F75EC: .word 0x02324CF4
	arm_func_end ov11_022F75C0

	arm_func_start ov11_022F75F0
ov11_022F75F0: ; 0x022F75F0
	stmdb sp!, {r4, lr}
	ldr r1, _022F7624 ; =0x02324CF4
	mov r4, r0
	ldr r0, [r1]
	bl ov11_022DC958
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _022F7624 ; =0x02324CF4
	mov r1, r4
	ldr r0, [r0]
	bl ov11_022DCA58
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7624: .word 0x02324CF4
	arm_func_end ov11_022F75F0

	arm_func_start ov11_022F7628
ov11_022F7628: ; 0x022F7628
	stmdb sp!, {r3, lr}
	ldr r0, _022F764C ; =0x02324CF4
	ldr r0, [r0]
	ldr r1, [r0, #0x10c]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl ov11_022DCA70
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F764C: .word 0x02324CF4
	arm_func_end ov11_022F7628

	arm_func_start ov11_022F7650
ov11_022F7650: ; 0x022F7650
	ldr r2, _022F7664 ; =0x02324CF4
	ldr ip, _022F7668 ; =ov11_022DD0EC
	mov r1, r0
	ldr r0, [r2]
	bx ip
	.align 2, 0
_022F7664: .word 0x02324CF4
_022F7668: .word ov11_022DD0EC
	arm_func_end ov11_022F7650

	arm_func_start ov11_022F766C
ov11_022F766C: ; 0x022F766C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r0, _022F7BB8 ; =0x02324CF4
	ldr r1, [r0]
	ldr r0, [r1, #0xf0]
	cmp r0, #2
	bne _022F78F8
	ldr r2, [r1, #0xf4]
	ldr r1, _022F7BBC ; =0x02321644
	mov r0, #2
	bl DebugPrint
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r4, #0
	ldr r1, [r0]
	str r4, [r1, #0xf0]
	ldr r1, [r0]
	ldr r0, [r1, #0xf4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022F7B80
_022F76BC: ; jump table
	b _022F7B80 ; case 0
	b _022F7B80 ; case 1
	b _022F7B80 ; case 2
	b _022F76E0 ; case 3
	b _022F773C ; case 4
	b _022F77BC ; case 5
	b _022F783C ; case 6
	b _022F78B0 ; case 7
	b _022F78E0 ; case 8
_022F76E0:
	mov r1, #1
	add r0, sp, #4
	mov r3, r1
	sub r2, r1, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r3, #1
	ldr r0, [r0]
	add r2, sp, #4
	mov r1, r4
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, #0xa
	strb r3, [r2, #0xec]
	bl ov11_022F881C
	b _022F7B80
_022F773C:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	mov r3, r1
	sub r2, r1, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =0x02324CF4
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrb r0, [r0, #0x105]
	cmp r0, #0
	bne _022F7B80
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F77BC:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	sub r2, r1, #2
	mov r3, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =0x02324CF4
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrb r0, [r0, #0x105]
	cmp r0, #0
	bne _022F7B80
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F783C:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	sub r2, r1, #2
	mov r3, #3
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F78A0
	ldr r0, _022F7BB8 ; =0x02324CF4
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78A0:
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F78B0:
	ldrb r0, [r1, #0x105]
	cmp r0, #0
	movne r0, #2
	moveq r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E5BF4
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78E0:
	bl ov11_022E5C84
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78F8:
	cmp r0, #0
	bne _022F7B80
	ldr r2, [r1, #0x10c]
	cmp r2, #0
	beq _022F7B80
	ldr r1, _022F7BC0 ; =0x02321664
	mov r0, #2
	bl DebugPrint
	ldr ip, _022F7BB8 ; =0x02324CF4
	ldr r5, [ip]
	add r4, r5, #0x10c
	add lr, r5, #0xf4
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	mov r1, #1
	str r1, [r5, #0xf0]
	ldr r2, [ip]
	mov r0, #0
	str r0, [r2, #0x10c]
	ldr r3, [ip]
	ldr r2, [r3, #0xf4]
	cmp r2, #9
	addls pc, pc, r2, lsl #2
	b _022F7B78
_022F7960: ; jump table
	b _022F7B78 ; case 0
	b _022F7988 ; case 1
	b _022F7988 ; case 2
	b _022F79E8 ; case 3
	b _022F7A10 ; case 4
	b _022F7A4C ; case 5
	b _022F7A8C ; case 6
	b _022F7ADC ; case 7
	b _022F7B2C ; case 8
	b _022F7B68 ; case 9
_022F7988:
	ldrsh r1, [r3, #0xf8]
	add r0, sp, #4
	bl ov11_022E7FB8
	cmp r0, #0
	beq _022F79D4
	ldr r0, _022F7BB8 ; =0x02324CF4
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
_022F79D4:
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xf0]
	b _022F7B80
_022F79E8:
	mov r0, r3
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xfa]
	bl ov11_022E5148
	b _022F7B80
_022F7A10:
	ldrb r0, [r3, #0x105]
	cmp r0, #0
	movne r1, #2
	mov r1, r1, lsl #0x10
	mov r0, r3
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xfa]
	bl ov11_022E5148
	b _022F7B80
_022F7A4C:
	ldrb r0, [r3, #0x105]
	cmp r0, #0
	movne r1, #2
	mov r1, r1, lsl #0x10
	mov r0, r3
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r1, [r0]
	ldrsh r0, [r1, #0xfa]
	add r1, r1, #0xfc
	bl ov11_022E5188
	b _022F7B80
_022F7A8C:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =0x02324CF4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r1, #2
	moveq r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r1, [r0]
	ldrsh r0, [r1, #0xfa]
	add r1, r1, #0xfc
	bl ov11_022E5314
	b _022F7B80
_022F7ADC:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =0x02324CF4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r1, #2
	moveq r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #6]
	bl ov11_022E53E4
	b _022F7B80
_022F7B2C:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r1, #1
	ldr r0, [r0]
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =0x02324CF4
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #6]
	bl ov11_022E53E4
	b _022F7B80
_022F7B68:
	ldrsh r0, [r3, #0xfa]
	add r1, r3, #0xfc
	bl ov11_022E5258
	b _022F7B80
_022F7B78:
	mov r0, #0
	str r0, [r3, #0xf0]
_022F7B80:
	ldr r0, _022F7BB8 ; =0x02324CF4
	ldr r0, [r0]
	ldr r1, [r0, #0xf0]
	cmp r1, #0
	bne _022F7B98
	bl ov11_022DD164
_022F7B98:
	ldr r0, _022F7BB8 ; =0x02324CF4
	ldr r0, [r0]
	bl ov11_022DC940
	ldr r1, _022F7BB8 ; =0x02324CF4
	ldr r1, [r1]
	strb r0, [r1, #0xec]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7BB8: .word 0x02324CF4
_022F7BBC: .word 0x02321644
_022F7BC0: .word 0x02321664
	arm_func_end ov11_022F766C

	arm_func_start ov11_022F7BC4
ov11_022F7BC4: ; 0x022F7BC4
	stmdb sp!, {r3, lr}
	ldr r0, _022F7CB8 ; =0x02324CF4
	ldr r3, [r0]
	ldr r0, [r3, #0xf0]
	cmp r0, #1
	bne _022F7C9C
	ldr r0, [r3, #0xf4]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F7C8C
_022F7BEC: ; jump table
	b _022F7C8C ; case 0
	b _022F7C8C ; case 1
	b _022F7C8C ; case 2
	b _022F7C14 ; case 3
	b _022F7C20 ; case 4
	b _022F7C2C ; case 5
	b _022F7C44 ; case 6
	b _022F7C5C ; case 7
	b _022F7C68 ; case 8
	b _022F7C7C ; case 9
_022F7C14:
	ldrsh r0, [r3, #0xfa]
	bl ov11_022E544C
	b _022F7C8C
_022F7C20:
	ldrsh r0, [r3, #0xfa]
	bl ov11_022E544C
	b _022F7C8C
_022F7C2C:
	add r1, r3, #0x100
	ldrsh r0, [r3, #0xfa]
	ldrsb r2, [r1, #4]
	add r1, r3, #0xfc
	bl ov11_022E551C
	b _022F7C8C
_022F7C44:
	add r1, r3, #0x100
	ldrsh r0, [r3, #0xfa]
	ldrsb r2, [r1, #4]
	add r1, r3, #0xfc
	bl ov11_022E56B8
	b _022F7C8C
_022F7C5C:
	add r0, r3, #0xfc
	bl ov11_022E584C
	b _022F7C8C
_022F7C68:
	add r1, r3, #0x100
	ldrsh r0, [r1, #6]
	ldrsh r1, [r1, #8]
	bl ov11_022E590C
	b _022F7C8C
_022F7C7C:
	ldrsh r0, [r3, #0xfa]
	add r1, r3, #0xfc
	mov r2, #0
	bl ov11_022E551C
_022F7C8C:
	ldr r0, _022F7CB8 ; =0x02324CF4
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xf0]
_022F7C9C:
	ldr r0, _022F7CB8 ; =0x02324CF4
	ldr r0, [r0]
	ldr r1, [r0, #0xf0]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	bl ov11_022DD2C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7CB8: .word 0x02324CF4
	arm_func_end ov11_022F7BC4

	arm_func_start ov11_022F7CBC
ov11_022F7CBC: ; 0x022F7CBC
	stmdb sp!, {r3, lr}
	mov r0, #0x330
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F7D14 ; =0x02324CF8
	mov r1, #6
	str r0, [r2]
	mov r0, #0x3780
	bl MemAlloc
	ldr r1, _022F7D14 ; =0x02324CF8
	mov r3, #0
	str r0, [r1, #4]
	mvn r2, #0
_022F7CF0:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #2]
	cmp r3, #0x18
	add r0, r0, #0x250
	blt _022F7CF0
	bl ov11_022F7D18
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7D14: .word 0x02324CF8
	arm_func_end ov11_022F7CBC

	arm_func_start ov11_022F7D18
ov11_022F7D18: ; 0x022F7D18
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022F7DD0 ; =0x02324CF8
	mov r5, #0
	ldr r6, [r0, #4]
	mvn r4, #0
_022F7D2C:
	ldrsh r0, [r6, #2]
	cmp r0, r4
	beq _022F7D40
	mov r0, r5
	bl ov11_022F8578
_022F7D40:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x18
	add r6, r6, #0x250
	blt _022F7D2C
	ldr r2, _022F7DD0 ; =0x02324CF8
	mvn lr, #0
	ldr r0, [r2]
	mov r5, #0
	str lr, [r0, #0x24]
	mov r0, r5
	mov r1, #0xc
_022F7D74:
	mul r3, r5, r1
	ldr r4, [r2]
	add r5, r5, #1
	add ip, r4, r3
	str lr, [ip, #8]
	str r0, [r4, r3]
	str r0, [ip, #4]
	cmp r5, #3
	blt _022F7D74
	ldr r2, _022F7DD0 ; =0x02324CF8
	mov r3, #0
	mov r1, #0xc
_022F7DA4:
	mul r4, r0, r1
	ldr ip, [r2]
	add r0, r0, #1
	add ip, ip, #0x28
	str r3, [ip, r4]
	add r4, ip, r4
	str r3, [r4, #4]
	str r3, [r4, #8]
	cmp r0, #0x40
	blt _022F7DA4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F7DD0: .word 0x02324CF8
	arm_func_end ov11_022F7D18

	arm_func_start ov11_022F7DD4
ov11_022F7DD4: ; 0x022F7DD4
	stmdb sp!, {r3, lr}
	bl ov11_022F7D18
	ldr r0, _022F7E0C ; =0x02324CF8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F7E0C ; =0x02324CF8
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F7E0C ; =0x02324CF8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7E0C: .word 0x02324CF8
	arm_func_end ov11_022F7DD4

	arm_func_start ov11_022F7E10
ov11_022F7E10: ; 0x022F7E10
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	bl sub_02065050
	ldrsh r3, [sp, #8]
	mvn r0, #0
	cmp r3, r0
	beq _022F7E64
	ldr r1, _022F7E74 ; =0x02324CF8
	mov r0, #0
	ldr r2, [r1, #4]
	b _022F7E5C
_022F7E40:
	ldrsh r1, [r2, #2]
	cmp r1, r3
	beq _022F7E68
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add r2, r2, #0x250
_022F7E5C:
	cmp r0, #0x18
	blt _022F7E40
_022F7E64:
	mvn r0, #0
_022F7E68:
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F7E74: .word 0x02324CF8
	arm_func_end ov11_022F7E10

	arm_func_start ov11_022F7E78
ov11_022F7E78: ; 0x022F7E78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r8, r1
	ldrh r4, [r8]
	mov sb, r0
	add r0, sp, #0x12
	add r1, sp, #0x10
	strh r4, [sp, #0x12]
	mov sl, r2
	mov fp, r3
	bl sub_0206549C
	mov r6, r0
	ldrsh r1, [sp, #0x12]
	mvn r0, #0
	cmp r1, r0
	beq _022F83D8
	cmp r6, #0
	beq _022F7ED4
	cmp r6, #1
	beq _022F7EDC
	cmp r6, #2
	beq _022F7EE4
	b _022F7EFC
_022F7ED4:
	mov sb, #0
	b _022F7EFC
_022F7EDC:
	mov sb, #1
	b _022F7EFC
_022F7EE4:
	mov r0, #0
	mov r1, #0x35
	bl LoadScriptVariableValue
	cmp r0, #0
	moveq r6, #1
	mov sb, #2
_022F7EFC:
	ldrsh r3, [sp, #0x12]
	ldrsh r4, [sp, #0x10]
	ldr r7, _022F83E0 ; =0x020A7FF0
	mov ip, #0xc
	ldr r1, _022F83E4 ; =0x02321974
	mov r2, sb
	mov r0, #1
	str r4, [sp]
	smlabb r4, r3, ip, r7
	bl DebugPrint
	cmp sb, #0
	bge _022F7FE8
	ldrsh r0, [sp, #0x12]
	cmp r0, #0x3c
	beq _022F7F44
	cmp r0, #0x3f
	beq _022F7F68
	b _022F7F8C
_022F7F44:
	ldr r1, _022F83E8 ; =0x02324CF8
	ldr r1, [r1, #4]
	ldrsh r1, [r1, #2]
	cmp r1, #1
	mvneq r0, #0
	beq _022F83D8
	bl ov11_022F7E10
	mov sb, r0
	b _022F7F94
_022F7F68:
	ldr r1, _022F83E8 ; =0x02324CF8
	ldr r1, [r1, #4]
	ldrsh r1, [r1, #2]
	cmp r1, #4
	mvneq r0, #0
	beq _022F83D8
	bl ov11_022F7E10
	mov sb, r0
	b _022F7F94
_022F7F8C:
	bl ov11_022F7E10
	mov sb, r0
_022F7F94:
	cmp sb, #0
	bge _022F7FDC
	ldr r0, _022F83E8 ; =0x02324CF8
	mov r1, #3
	ldr r0, [r0, #4]
	mvn r2, #0
	add r0, r0, #0x6f0
	b _022F7FD4
_022F7FB4:
	ldrsh r3, [r0, #2]
	cmp r3, r2
	moveq sb, r1
	beq _022F7FDC
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	add r0, r0, #0x250
_022F7FD4:
	cmp r1, #0x18
	blt _022F7FB4
_022F7FDC:
	cmp sb, #0
	mvnlt r0, #0
	blt _022F83D8
_022F7FE8:
	ldr r0, _022F83E8 ; =0x02324CF8
	ldrsh r1, [r4]
	ldr r2, [r0, #4]
	mov r0, #0x250
	stmia sp, {r1, sl, fp}
	ldrsh r3, [sp, #0x12]
	smlabb r7, sb, r0, r2
	ldr r1, _022F83EC ; =0x023219A4
	mov r2, sb
	mov r0, #1
	bl DebugPrint
	ldrsh r1, [r7, #2]
	mvn r0, #0
	cmp r1, r0
	bne _022F803C
	mov r1, #0
	add r0, r7, #0x18c
	strb r1, [r7, #4]
	mov r5, #1
	bl ov11_022F4A14
	b _022F8048
_022F803C:
	ldrsh r0, [sp, #0x12]
	cmp r1, r0
	moveq r5, #0
_022F8048:
	sub r0, sl, #1
	strh sb, [r7]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	ldrsh r1, [sp, #0x12]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0xc]
	strh r1, [r7, #2]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	strlsh sl, [r7, #6]
	strlsb fp, [r7, #8]
	mvnls r0, #0
	strlsb r0, [r7, #9]
	bls _022F809C
	cmp r5, #0
	mvnne r0, #0
	strneh r0, [r7, #6]
	strneb r0, [r7, #8]
	strb fp, [r7, #9]
_022F809C:
	ldrsh r1, [sp, #0x10]
	add r0, r7, #0x12c
	strh r1, [r7, #0xa]
	bl ov11_022EA954
	mov r0, #9
	str r0, [r7, #0x12c]
	mov r2, #0
	str r2, [r7, #0x14c]
	mov r1, #1
	strb r1, [r7, #0x156]
	ldrsh r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _022F8164
_022F80D4: ; jump table
	b _022F8164 ; case 0
	b _022F8104 ; case 1
	b _022F8114 ; case 2
	b _022F8120 ; case 3
	b _022F8164 ; case 4
	b _022F8164 ; case 5
	b _022F8164 ; case 6
	b _022F812C ; case 7
	b _022F8138 ; case 8
	b _022F8144 ; case 9
	b _022F814C ; case 10
	b _022F8158 ; case 11
_022F8104:
	ldr r0, _022F83F0 ; =0x03000743
	str r0, [r7, #0x128]
	str r1, [r7, #0x12c]
	b _022F816C
_022F8114:
	ldr r0, _022F83F4 ; =0x03000002
	str r0, [r7, #0x128]
	b _022F816C
_022F8120:
	ldr r0, _022F83F8 ; =0x03002358
	str r0, [r7, #0x128]
	b _022F816C
_022F812C:
	mov r0, #0x340
	str r0, [r7, #0x128]
	b _022F816C
_022F8138:
	mov r0, #0x20000
	str r0, [r7, #0x128]
	b _022F816C
_022F8144:
	str r2, [r7, #0x128]
	b _022F816C
_022F814C:
	mov r0, #0xc0000
	str r0, [r7, #0x128]
	b _022F816C
_022F8158:
	mov r0, #0x10000
	str r0, [r7, #0x128]
	b _022F816C
_022F8164:
	ldr r0, _022F83F8 ; =0x03002358
	str r0, [r7, #0x128]
_022F816C:
	ldrb r0, [r4, #0xa]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0xc]
	ldrb r0, [r4, #0xb]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r7, #0x18]
	ldrsb r0, [r8, #2]
	strb r0, [r7, #0x1c]
	ldrb r0, [r8, #5]
	tst r0, #4
	bne _022F81D8
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x20]
	ldrb r0, [r8, #5]
	tst r0, #2
	ldrne r0, [r7, #0x20]
	addne r0, r0, #0x400
	strne r0, [r7, #0x20]
_022F81D8:
	ldrb r0, [r8, #6]
	tst r0, #4
	bne _022F8204
	ldrb r0, [r8, #4]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x24]
	ldrb r0, [r8, #6]
	tst r0, #2
	ldrne r0, [r7, #0x24]
	addne r0, r0, #0x400
	strne r0, [r7, #0x24]
_022F8204:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	ldrne r0, [r7, #0x128]
	orrne r0, r0, #0x800000
	strne r0, [r7, #0x128]
	cmp r5, #0
	beq _022F82D4
	ldrsb r1, [r7, #0x1c]
	mov r0, #0
	mov r2, #0xc
	strb r1, [r7, #0x15a]
	ldr r3, [r7, #0x20]
	ldr r1, [r7, #0x14]
	sub r1, r3, r1
	str r1, [r7, #0x15c]
	ldr sl, [r7, #0x20]
	ldr r3, [r7, #0x14]
	add r1, r7, #0x100
	add r3, sl, r3
	str r3, [r7, #0x164]
	ldr fp, [r7, #0x24]
	ldr sl, [r7, #0x18]
	ldr r3, _022F83E8 ; =0x02324CF8
	sub sl, fp, sl
	str sl, [r7, #0x160]
	ldr ip, [r7, #0x24]
	ldr fp, [r7, #0x18]
	smulbb sl, r6, r2
	add fp, ip, fp
	str fp, [r7, #0x168]
	str r0, [r7, #0x170]
	str r0, [r7, #0x16c]
	strh r6, [r1, #0x50]
	ldr r3, [r3]
	sub r1, r2, #0xd
	add r2, r3, sl
	str r1, [r2, #8]
	str r0, [r3, sl]
	str r0, [r2, #4]
	ldrsh r0, [r7, #2]
	cmp r0, #0x1e
	blt _022F82C8
	cmp r0, #0x2d
	bgt _022F82C8
	mov r0, #0x12
	bl RandInt
	add r1, r7, #0x100
	strh r0, [r1, #0x58]
	b _022F82D4
_022F82C8:
	add r0, r7, #0x100
	mov r1, #0
	strh r1, [r0, #0x58]
_022F82D4:
	mov r0, #1
	strb r0, [r7, #0x152]
	sub r1, r0, #2
	add r0, r7, #0x100
	strh r1, [r0, #0x54]
	cmp r5, #0
	beq _022F8354
	add r0, r7, #0x28
	add r1, r7, #0x30
	bl ov11_022F1F08
	mvn r6, #0
	strb r6, [r7, #0x175]
	add r0, r7, #0x100
	mov r1, #0x300
	strh r1, [r0, #0x76]
	mov r3, #1
	strh r3, [r0, #0x78]
	mov r2, #0
	ldr r1, _022F83FC ; =0x00000807
	str r2, [r7, #0x17c]
	strh r1, [r0, #0x80]
	strb r3, [r7, #0x174]
	strh r6, [r0, #0x82]
	strh r2, [r0, #0x84]
	ldrsh r1, [r7, #0xa]
	ldr r2, [r7, #0x128]
	add r0, r7, #0x18c
	bl ov11_022F5BBC
	ldr r1, _022F8400 ; =0x0232187C
	mov r2, r7
	add r0, r7, #0x38
	bl ov11_022DC8E8
_022F8354:
	ldr r0, [r7, #0x160]
	ldr r1, _022F8404 ; =0x023219E8
	str r0, [sp]
	ldrsh r2, [r7, #2]
	ldr r3, [r7, #0x15c]
	mov r0, #1
	bl DebugPrint
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ldrlssh r1, [r8, #8]
	addls r0, r7, #0x100
	strlsh r1, [r0, #0x24]
	bls _022F8398
	cmp r5, #0
	addne r0, r7, #0x100
	mvnne r1, #0
	strneh r1, [r0, #0x24]
_022F8398:
	cmp r5, #0
	beq _022F83CC
	ldrsh r0, [r4]
	cmp r0, #1
	bne _022F83CC
	mov r0, #0
	bl ov11_022EB2A4
	cmp r0, #0
	beq _022F83CC
	mov r2, sb
	mov r0, #0
	mov r1, #2
	bl ov11_022EB128
_022F83CC:
	mov r1, #1
	mov r0, sb
	strb r1, [r7, #4]
_022F83D8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F83E0: .word 0x020A7FF0
_022F83E4: .word 0x02321974
_022F83E8: .word 0x02324CF8
_022F83EC: .word 0x023219A4
_022F83F0: .word 0x03000743
_022F83F4: .word 0x03000002
_022F83F8: .word 0x03002358
_022F83FC: .word 0x00000807
_022F8400: .word 0x0232187C
_022F8404: .word 0x023219E8
	arm_func_end ov11_022F7E78

	arm_func_start ov11_022F8408
ov11_022F8408: ; 0x022F8408
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022F8568 ; =0x02321A14
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022F84D0
	ldr r0, _022F856C ; =0x02324CF8
	mvn r4, #1
	ldr r7, [r0, #4]
	ldr fp, _022F8570 ; =0x02321A40
	add r5, r4, #1
	mov r6, #1
_022F8464:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F84B4
	ldrsh r2, [r7, #6]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #6]
	cmp sl, r0
	bne _022F84B4
	cmp sb, r4
	ldrnesb r0, [r7, #8]
	cmpne sb, r0
	bne _022F84B4
	mov r0, r8
	bl ov11_022F8578
_022F84B4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r7, r7, #0x250
	blt _022F8464
	b _022F8560
_022F84D0:
	ldr r0, _022F856C ; =0x02324CF8
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0, #4]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022F84EC:
	ldrsh r3, [sl, #2]
	cmp r3, r7
	beq _022F8548
	ldrsb ip, [sl, #9]
	ldr r1, _022F8574 ; =0x02321A6C
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl DebugPrint
	ldrsb r0, [sl, #9]
	cmp r0, r6
	beq _022F8534
	cmp sb, r5
	cmpne sb, r0
	bne _022F8548
	mov r0, r8
	bl ov11_022F8578
	b _022F8548
_022F8534:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	bne _022F8548
	mov r0, r8
	bl ov11_022F8578
_022F8548:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add sl, sl, #0x250
	blt _022F84EC
_022F8560:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8568: .word 0x02321A14
_022F856C: .word 0x02324CF8
_022F8570: .word 0x02321A40
_022F8574: .word 0x02321A6C
	arm_func_end ov11_022F8408

	arm_func_start ov11_022F8578
ov11_022F8578: ; 0x022F8578
	stmdb sp!, {r4, lr}
	ldr r1, _022F85B8 ; =0x02324CF8
	mov r2, r0
	ldr r1, [r1, #4]
	mov r0, #0x250
	smlabb r4, r2, r0, r1
	ldr r1, _022F85BC ; =0x02321A8C
	mov r0, #1
	bl DebugPrint
	add r0, r4, #0x18c
	bl ov11_022F5C3C
	add r0, r4, #0x38
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F85B8: .word 0x02324CF8
_022F85BC: .word 0x02321A8C
	arm_func_end ov11_022F8578

	arm_func_start ov11_022F85C0
ov11_022F85C0: ; 0x022F85C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022F8720 ; =0x02321AA8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022F8698
	ldr r0, _022F8724 ; =0x02324CF8
	mvn r5, #0
	ldr r7, [r0, #4]
	ldr fp, _022F8728 ; =0x02321A40
	sub r4, r5, #1
	mov r6, #1
_022F861C:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F867C
	ldrsh r2, [r7, #6]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #6]
	cmp sl, r0
	bne _022F867C
	cmp sb, r4
	ldrnesb r0, [r7, #8]
	cmpne sb, r0
	bne _022F867C
	mov r1, #0
	add r0, r7, #0x38
	bl ov11_022DCFC4
	strh r5, [r7, #6]
	add r0, r7, #0x100
	strh r5, [r0, #0x24]
_022F867C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r7, r7, #0x250
	blt _022F861C
	b _022F8718
_022F8698:
	ldr r0, _022F8724 ; =0x02324CF8
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0, #4]
	ldr r6, _022F8728 ; =0x02321A40
	sub r4, r5, #1
	mov fp, r7
_022F86B4:
	ldrsh r3, [sl, #2]
	cmp r3, r5
	beq _022F8700
	ldrsh r2, [sl, #6]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	cmp sb, r4
	ldrnesb r0, [sl, #9]
	cmpne sb, r0
	bne _022F8700
	mov r1, fp
	add r0, sl, #0x38
	bl ov11_022DCFC4
	strb r5, [sl, #9]
_022F8700:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add sl, sl, #0x250
	blt _022F86B4
_022F8718:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8720: .word 0x02321AA8
_022F8724: .word 0x02324CF8
_022F8728: .word 0x02321A40
	arm_func_end ov11_022F85C0

	arm_func_start ov11_022F872C
ov11_022F872C: ; 0x022F872C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F87B4 ; =0x02324CF8
	mov r2, #0x250
	ldr r4, [r3, #4]
	mvn ip, #0
	smlabb r4, r0, r2, r4
	ldrsh r0, [r4, #2]
	mov r5, r1
	cmp r0, ip
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x50]
	cmp r1, #0
	bne _022F8774
	tst r5, #2
	beq _022F879C
	bl ov11_022FBA28
	b _022F879C
_022F8774:
	tst r5, #2
	beq _022F879C
	mov r0, #0xc
	smulbb r1, r1, r0
	ldr r2, [r3]
	mov r0, #0
	add r3, r2, r1
	str ip, [r3, #8]
	str r0, [r2, r1]
	str r0, [r3, #4]
_022F879C:
	ldr r1, [r4, #0x128]
	add r0, r4, #0x18c
	orr r1, r1, r5
	str r1, [r4, #0x128]
	bl ov11_022F495C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F87B4: .word 0x02324CF8
	arm_func_end ov11_022F872C

	arm_func_start ov11_022F87B8
ov11_022F87B8: ; 0x022F87B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F8818 ; =0x02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r4, r0, r2, ip
	ldrsh r0, [r4, #2]
	mov r5, r1
	cmp r0, r3
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsh r0, [r0, #0x50]
	cmp r0, #0
	bne _022F87FC
	tst r5, #2
	beq _022F87FC
	bl ov11_022FBA28
_022F87FC:
	ldr r1, [r4, #0x128]
	mvn r0, r5
	and r1, r1, r0
	add r0, r4, #0x18c
	str r1, [r4, #0x128]
	bl ov11_022F495C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8818: .word 0x02324CF8
	arm_func_end ov11_022F87B8

	arm_func_start ov11_022F881C
ov11_022F881C: ; 0x022F881C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F8870 ; =0x02324CF8
	mov r2, #0x250
	ldr r3, [r3, #4]
	mov r5, r1
	smlabb r4, r0, r2, r3
	mov r0, r5
	bl ov11_022EA920
	ldrsh r1, [r4, #2]
	mvn r0, #0
	cmp r1, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	add r0, r4, #0x12c
	bl ov11_022EA990
	mov r0, #1
	strb r0, [r4, #0x152]
	sub r1, r0, #2
	add r0, r4, #0x100
	strh r1, [r0, #0x54]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8870: .word 0x02324CF8
	arm_func_end ov11_022F881C

	arm_func_start ov11_022F8874
ov11_022F8874: ; 0x022F8874
	ldr r2, _022F889C ; =0x02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r1, r0, r1, r3
	ldrsh r0, [r1, #2]
	cmp r0, r2
	addne r0, r1, #0x38
	moveq r0, #0
	bx lr
	.align 2, 0
_022F889C: .word 0x02324CF8
	arm_func_end ov11_022F8874

	arm_func_start ov11_022F88A0
ov11_022F88A0: ; 0x022F88A0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	add r0, sp, #0x10
	bl sub_02065050
	ldrsh r1, [sp, #0x10]
	mvn r0, #0
	cmp r1, r0
	beq _022F890C
	ldr r0, _022F891C ; =0x02324CF8
	mov r5, #0
	ldr r4, [r0, #4]
	b _022F8904
_022F88D0:
	ldrsh r1, [r4, #2]
	ldrsh r0, [sp, #0x10]
	cmp r1, r0
	bne _022F88F4
	add r0, r4, #0x38
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	bne _022F8910
_022F88F4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	add r4, r4, #0x250
_022F8904:
	cmp r5, #0x18
	blt _022F88D0
_022F890C:
	mov r0, #0
_022F8910:
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F891C: .word 0x02324CF8
	arm_func_end ov11_022F88A0

	arm_func_start ov11_022F8920
ov11_022F8920: ; 0x022F8920
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r3, _022F8988 ; =0x02324CF8
	mov r5, r2
	ldr ip, [r3, #4]
	mov r3, #0x250
	smlabb r4, r0, r3, ip
	str r5, [sp]
	mov r6, r1
	mov r2, r0
	ldrsh r3, [r4, #2]
	ldr r1, _022F898C ; =0x02321AD4
	mov r0, #1
	bl DebugPrint
	ldrsh r1, [r4, #2]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	beq _022F8980
	mov r1, r6
	mov r2, r5
	add r0, r4, #0x38
	bl ov11_022DCCEC
	mov r0, #1
_022F8980:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F8988: .word 0x02324CF8
_022F898C: .word 0x02321AD4
	arm_func_end ov11_022F8920

	arm_func_start ov11_022F8990
ov11_022F8990: ; 0x022F8990
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	add r0, sp, #0x10
	mov r4, r1
	bl sub_02065050
	ldrsh r1, [sp, #0x10]
	mvn r0, #0
	cmp r1, r0
	beq _022F8A0C
	ldr r0, _022F8A1C ; =0x02324CF8
	mov r6, #0
	ldr r5, [r0, #4]
	b _022F8A04
_022F89C4:
	ldrsh r1, [r5, #2]
	ldrsh r0, [sp, #0x10]
	cmp r1, r0
	bne _022F89F4
	add r0, r5, #0x38
	bl ov11_022DC958
	cmp r0, #0
	beq _022F89F4
	mov r1, r4
	add r0, r5, #0x38
	bl ov11_022DCA58
	b _022F8A10
_022F89F4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x250
_022F8A04:
	cmp r6, #0x18
	blt _022F89C4
_022F8A0C:
	mov r0, #1
_022F8A10:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F8A1C: .word 0x02324CF8
	arm_func_end ov11_022F8990

	arm_func_start ov11_022F8A20
ov11_022F8A20: ; 0x022F8A20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022F8AA0 ; =0x02324CF8
	mov r2, r0
	ldr r1, [r1, #4]
	mov r0, #0x250
	smlabb r4, r2, r0, r1
	ldrsh r3, [r4, #6]
	add r0, r4, #0x100
	ldr r1, _022F8AA4 ; =0x02321AFC
	str r3, [sp]
	ldrsh r3, [r0, #0x24]
	mov r0, #1
	str r3, [sp, #4]
	ldrsh r3, [r4, #2]
	bl DebugPrint
	ldrsh r0, [r4, #2]
	mvn r2, #0
	cmp r0, r2
	addne r1, r4, #0x100
	ldrnesh r1, [r1, #0x24]
	cmpne r1, r2
	moveq r0, #0
	beq _022F8A98
	bl ScriptSpecialProcess0x3E
	add r1, r4, #0x100
	ldrsh r0, [r4, #6]
	ldrsh r1, [r1, #0x24]
	bl ov11_022F74A0
	mov r0, #1
_022F8A98:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8AA0: .word 0x02324CF8
_022F8AA4: .word 0x02321AFC
	arm_func_end ov11_022F8A20

	arm_func_start ov11_022F8AA8
ov11_022F8AA8: ; 0x022F8AA8
	stmdb sp!, {r3, lr}
	add r2, r0, #0x100
	mov r3, #0x300
	strh r3, [r2, #0x76]
	mov lr, #1
	strh lr, [r2, #0x78]
	mov r3, #0
	str r3, [r0, #0x17c]
	ldrsh ip, [r2, #0x80]
	ldr r3, _022F8AF0 ; =0x00000807
	cmp ip, r3
	strneh r3, [r2, #0x80]
	strneb lr, [r0, #0x174]
	mov r0, r1
	mov r1, #0
	bl ov11_022F7188
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F8AF0: .word 0x00000807
	arm_func_end ov11_022F8AA8

	arm_func_start ov11_022F8AF4
ov11_022F8AF4: ; 0x022F8AF4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	cmpge r4, #0
	blt _022F8B48
	ldr r2, _022F8B50 ; =0x02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #2]
	cmp r0, r2
	beq _022F8B48
	bl ScriptSpecialProcess0x3D
	mov r0, r4
	bl ov11_022F8A20
	cmp r0, #0
	beq _022F8B48
	bl KeyWaitInit__02006DA4
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8B48:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8B50: .word 0x02324CF8
	arm_func_end ov11_022F8AF4

	arm_func_start ov11_022F8B54
ov11_022F8B54: ; 0x022F8B54
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	cmpge r4, #0
	blt _022F8BA8
	ldr r2, _022F8BB0 ; =0x02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #2]
	cmp r0, r2
	beq _022F8BA8
	bl ScriptSpecialProcess0x3D
	mov r0, r4
	bl ov11_022FC83C
	cmp r0, #0
	beq _022F8BA8
	bl KeyWaitInit__02006DA4
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8BA8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8BB0: .word 0x02324CF8
	arm_func_end ov11_022F8B54

	arm_func_start ov11_022F8BB4
ov11_022F8BB4: ; 0x022F8BB4
	stmdb sp!, {r4, lr}
	cmp r0, #0
	cmpge r1, #0
	blt _022F8C0C
	ldr r3, _022F8C14 ; =0x02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r4, r0, r2, ip
	ldrsh r0, [r4, #2]
	cmp r0, r3
	beq _022F8C0C
	mov r0, r1
	bl ov11_022FED74
	cmp r0, #0
	beq _022F8C0C
	bl KeyWaitInit__02006DA4
	ldrsh r0, [r4, #2]
	mvn r1, #0
	bl sub_02065B3C
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8C0C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8C14: .word 0x02324CF8
	arm_func_end ov11_022F8BB4

	arm_func_start ov11_022F8C18
ov11_022F8C18: ; 0x022F8C18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022F8D64
	ldr r1, _022F8E5C ; =0x02321B40
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022F8E60 ; =0x02324CF8
	mvn r4, #1
	ldr r6, [r0, #4]
	ldr fp, _022F8E64 ; =0x020A7FF0
	mov r7, r8
	add r5, r4, #1
_022F8C74:
	ldrsh r3, [r6, #2]
	cmp r3, r5
	beq _022F8D48
	ldrsh r0, [r6, #6]
	cmp r0, sl
	bne _022F8D48
	cmp sb, r4
	ldrnesb r0, [r6, #8]
	cmpne r0, sb
	bne _022F8D48
	ldr r1, _022F8E68 ; =0x02321B80
	mov r0, #1
	mov r2, r7
	bl DebugPrint
	str sb, [sp]
	ldrsh r2, [r6, #2]
	add r0, sp, #4
	mov r1, #3
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	bne _022F8D04
	ldrsh r1, [r6, #2]
	mov r0, #0xc
	smulbb r0, r1, r0
	ldrsh r0, [fp, r0]
	add r1, sp, #4
	cmp r0, #1
	cmpne r0, #2
	mov r0, #0
	beq _022F8CFC
	mov r2, #0xc
	bl ov11_022DCAB0
	b _022F8D04
_022F8CFC:
	mov r2, #0xe
	bl ov11_022DCAB0
_022F8D04:
	mov r0, #0
	strh r0, [sp, #0x1c]
	add r0, r6, #0x38
	add r1, sp, #4
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022F8D48
	add r0, r6, #0x28
	add r1, r6, #0x30
	bl ov11_022F1F08
	add r0, r6, #0x38
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x174]
_022F8D48:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add r6, r6, #0x250
	blt _022F8C74
	b _022F8E50
_022F8D64:
	ldr r1, _022F8E6C ; =0x02321B94
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022F8E60 ; =0x02324CF8
	mvn r4, #1
	ldr r7, [r0, #4]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022F8D8C:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F8E38
	cmp sb, r4
	ldrnesb r0, [r7, #9]
	cmpne r0, sb
	bne _022F8E38
	ldr r1, _022F8E68 ; =0x02321B80
	mov r0, #1
	mov r2, r6
	bl DebugPrint
	str sb, [sp]
	ldrsh r2, [r7, #2]
	add r0, sp, #4
	mov r1, #3
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F8DFC
	add r0, r7, #0x38
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x174]
	b _022F8E38
_022F8DFC:
	cmp sl, #3
	bne _022F8E38
	mov r0, #0
	add r1, sp, #4
	mov r2, #6
	bl ov11_022DCAB0
	mov r0, #1
	strh r0, [sp, #0x1c]
	add r0, r7, #0x38
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x174]
_022F8E38:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x18
	add r7, r7, #0x250
	blt _022F8D8C
_022F8E50:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8E5C: .word 0x02321B40
_022F8E60: .word 0x02324CF8
_022F8E64: .word 0x020A7FF0
_022F8E68: .word 0x02321B80
_022F8E6C: .word 0x02321B94
	arm_func_end ov11_022F8C18

	arm_func_start ov11_022F8E70
ov11_022F8E70: ; 0x022F8E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022F8F28
	ldr r1, _022F8FB4 ; =0x02321BD4
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022F8FB8 ; =0x02324CF8
	mvn r4, #1
	ldr r6, [r0, #4]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022F8EC8:
	ldrsh r3, [r6, #2]
	cmp r3, r5
	beq _022F8F0C
	ldrsh r0, [r6, #6]
	cmp sl, r0
	bne _022F8F0C
	cmp sb, r4
	ldrnesb r0, [r6, #8]
	cmpne sb, r0
	bne _022F8F0C
	ldr r1, _022F8FBC ; =0x02321B80
	mov r0, fp
	mov r2, r7
	bl DebugPrint
	add r0, r6, #0x38
	bl ov11_022DCAE0
	orr r8, r8, r0
_022F8F0C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add r6, r6, #0x250
	blt _022F8EC8
	b _022F8FAC
_022F8F28:
	ldr r1, _022F8FC0 ; =0x02321C14
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022F8FB8 ; =0x02324CF8
	mvn r5, #0
	ldr sl, [r0, #4]
	ldr fp, _022F8FBC ; =0x02321B80
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022F8F54:
	ldrsh r3, [sl, #2]
	cmp r3, r5
	beq _022F8F94
	ldrsb r0, [sl, #9]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022F8F94
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl DebugPrint
	add r0, sl, #0x38
	bl ov11_022DD080
	strb r5, [sl, #9]
	orr r8, r8, r0
_022F8F94:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add sl, sl, #0x250
	blt _022F8F54
_022F8FAC:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8FB4: .word 0x02321BD4
_022F8FB8: .word 0x02324CF8
_022F8FBC: .word 0x02321B80
_022F8FC0: .word 0x02321C14
	arm_func_end ov11_022F8E70

	arm_func_start ov11_022F8FC4
ov11_022F8FC4: ; 0x022F8FC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022F9014 ; =0x02324CF8
	mov r4, #0
	ldr r7, [r0, #4]
	mov r6, r4
	mvn r5, #0
_022F8FDC:
	ldrsh r0, [r7, #2]
	cmp r0, r5
	beq _022F8FF4
	add r0, r7, #0x38
	bl ov11_022DCB00
	orr r4, r4, r0
_022F8FF4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x18
	add r7, r7, #0x250
	blt _022F8FDC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F9014: .word 0x02324CF8
	arm_func_end ov11_022F8FC4

	arm_func_start ov11_022F9018
ov11_022F9018: ; 0x022F9018
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022F9070 ; =0x02324CF8
	mov r5, #0
	ldr r4, [r1, #4]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022F9034:
	ldrsh r0, [r4, #2]
	cmp r0, r7
	beq _022F9050
	mov r1, r6
	add r0, r4, #0x38
	bl ov11_022DD0EC
	orr r5, r5, r0
_022F9050:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r4, r4, #0x250
	blt _022F9034
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F9070: .word 0x02324CF8
	arm_func_end ov11_022F9018

	arm_func_start ov11_022F9074
ov11_022F9074: ; 0x022F9074
	stmdb sp!, {r3, lr}
	ldr r1, _022F90B0 ; =0x02324CF8
	mvn r0, #0
	ldr r2, [r1, #4]
	ldrsh r1, [r2, #2]
	cmp r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x12c
	bl ov11_022EA9E4
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F90B0: .word 0x02324CF8
	arm_func_end ov11_022F9074

	arm_func_start ov11_022F90B4
ov11_022F90B4: ; 0x022F90B4
	ldr r3, _022F90F0 ; =0x02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #2]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	ldrne r2, [ip, #0xc]
	ldrne r0, [ip, #0x10]
	strne r2, [r1]
	str r0, [r1, #4]
	ldrsh r0, [ip, #2]
	bx lr
	.align 2, 0
_022F90F0: .word 0x02324CF8
	arm_func_end ov11_022F90B4

	arm_func_start ov11_022F90F4
ov11_022F90F4: ; 0x022F90F4
	ldr r3, _022F9144 ; =0x02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #2]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022F9138
	ldr r2, [ip, #0x15c]
	ldr r0, [ip, #0x14]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x160]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
_022F9138:
	str r0, [r1, #4]
	ldrsh r0, [ip, #2]
	bx lr
	.align 2, 0
_022F9144: .word 0x02324CF8
	arm_func_end ov11_022F90F4

	arm_func_start ov11_022F9148
ov11_022F9148: ; 0x022F9148
	ldr r3, _022F917C ; =0x02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r2, r0, r2, ip
	ldrsh r0, [r2, #2]
	cmp r0, r3
	streqb r3, [r1]
	addne r0, r2, #0x100
	ldrnesb r0, [r0, #0x5a]
	strneb r0, [r1]
	ldrsh r0, [r2, #2]
	bx lr
	.align 2, 0
_022F917C: .word 0x02324CF8
	arm_func_end ov11_022F9148

	arm_func_start ov11_022F9180
ov11_022F9180: ; 0x022F9180
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022F9218 ; =0x02324CF8
	mov ip, #0
	ldr lr, [r4, #4]
	mvn r4, #0
	b _022F9208
_022F9198:
	cmp ip, r0
	ldrnesh r5, [lr, #2]
	cmpne r5, r4
	beq _022F91F8
	ldr r5, [lr, #0x128]
	tst r5, r1
	beq _022F91F8
	ldr r6, [lr, #0x15c]
	ldr r5, [r3]
	cmp r6, r5
	bge _022F91F8
	ldr r6, [lr, #0x164]
	ldr r5, [r2]
	cmp r6, r5
	ble _022F91F8
	ldr r6, [lr, #0x160]
	ldr r5, [r3, #4]
	cmp r6, r5
	bge _022F91F8
	ldr r6, [lr, #0x168]
	ldr r5, [r2, #4]
	cmp r6, r5
	movgt r0, ip
	ldmgtia sp!, {r4, r5, r6, pc}
_022F91F8:
	add ip, ip, #1
	mov ip, ip, lsl #0x10
	mov ip, ip, asr #0x10
	add lr, lr, #0x250
_022F9208:
	cmp ip, #0x18
	blt _022F9198
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F9218: .word 0x02324CF8
	arm_func_end ov11_022F9180

	arm_func_start ov11_022F921C
ov11_022F921C: ; 0x022F921C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r6, r0
	add r0, r6, #0x38
	mov r5, r1
	mov r4, r2
	bl ov11_022DC958
	cmp r0, #0
	bne _022F93B8
	ldr r1, _022F93C4 ; =0x02321684
	add r0, sp, #0x10
	ldr r2, [r1, #0x114]
	ldr r1, [r1, #0x110]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r3, [r5]
	add r1, sp, #0
	mov r2, r3, asr #2
	add r2, r3, r2, lsr #29
	mov r3, r2, asr #3
	mov r2, r3, asr #7
	add ip, r3, r2, lsr #24
	mov r2, ip, asr #8
	str r2, [sp, #0x10]
	ldr r3, [r5, #4]
	mov r2, r3, asr #2
	add r2, r3, r2, lsr #29
	mov r3, r2, asr #3
	mov r2, r3, asr #7
	add lr, r3, r2, lsr #24
	mov r2, lr, asr #8
	str r2, [sp, #0x14]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	sub r8, r3, #1
	sub r7, r2, #1
	mov r2, r8, asr #2
	mov r3, r7, asr #2
	add r2, r8, r2, lsr #29
	add r3, r7, r3, lsr #29
	mov sb, r2, asr #3
	mov r8, r3, asr #3
	mov r2, sb, asr #7
	add r2, sb, r2, lsr #24
	mov r3, r2, asr #8
	mov r7, r8, asr #7
	add r2, r8, r7, lsr #24
	mov r2, r2, asr #8
	sub ip, r3, ip, asr #8
	sub r7, r2, lr, asr #8
	add ip, ip, #1
	add r7, r7, #1
	str ip, [sp]
	str r7, [sp, #4]
	ldr r7, [r6, #0x128]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	tst r7, #0x40
	beq _022F9318
	bl ov11_022F204C
	cmp r0, #0
	movne r0, #0x40
	bne _022F93BC
_022F9318:
	ldr r0, [r6, #0x128]
	tst r0, #0x80
	beq _022F933C
	add r0, sp, #0x10
	add r1, sp, #0
	bl ov11_022F20CC
	cmp r0, #0
	movne r0, #0x40
	bne _022F93BC
_022F933C:
	ldr r0, [r6, #0x128]
	tst r0, #0x100
	beq _022F9368
	ldrsh r0, [r6]
	mov r2, r5
	mov r3, r4
	mov r1, #0x100
	bl ov11_022F9180
	cmp r0, #0
	movge r0, #0x100
	bge _022F93BC
_022F9368:
	ldr r0, [r6, #0x128]
	tst r0, #0x200
	beq _022F9390
	mov r1, r5
	mov r2, r4
	mov r0, #0x100
	bl ov11_022FCD18
	cmp r0, #0
	movge r0, #0x200
	bge _022F93BC
_022F9390:
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F93B8
	mov r1, r5
	mov r2, r4
	mov r0, #0x1000
	bl ov11_022FEDF8
	cmp r0, #0
	movge r0, #0x400
	bge _022F93BC
_022F93B8:
	mov r0, #0
_022F93BC:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F93C4: .word 0x02321684
	arm_func_end ov11_022F921C

	arm_func_start ov11_022F93C8
ov11_022F93C8: ; 0x022F93C8
	stmdb sp!, {r4, lr}
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	mov r4, r0
	tst r1, #0x800
	mov r2, r2, lsr #0x10
	beq _022F9400
	add r0, r4, #0x100
	mov r1, #0x400
	strh r1, [r0, #0x80]
	mov r0, #1
	strb r0, [r4, #0x174]
	ldmia sp!, {r4, pc}
_022F9400:
	cmp r3, #0
	addne r0, r4, #0x100
	strneh r3, [r0, #0x78]
	cmp r2, #0
	addne r0, r4, #0x100
	strneh r2, [r0, #0x76]
	add r2, r4, #0x100
	ldrh r3, [r2, #0x78]
	cmp r3, #1
	bne _022F9450
	cmp r1, #0x1000
	moveq r0, #4
	streq r0, [r4, #0x17c]
	moveq r0, #0x800
	beq _022F9498
	ldr r0, [r4, #0x17c]
	cmp r0, #0
	movgt r0, #0x800
	ldrle r0, _022F9520 ; =0x00000807
	b _022F9498
_022F9450:
	cmp r3, #2
	bne _022F948C
	cmp r1, #0x1000
	moveq r0, #4
	streq r0, [r4, #0x17c]
	moveq r0, #0x800
	beq _022F9498
	ldr r0, [r4, #0x17c]
	cmp r0, #0
	movgt r0, #0x800
	bgt _022F9498
	ldrsh r0, [r4, #0xa]
	ldrsh r1, [r2, #0x80]
	bl ov11_022F5D50
	b _022F9498
_022F948C:
	ldr r0, _022F9524 ; =0x023218CC
	mov r1, r3, lsl #1
	ldrsh r0, [r0, r1]
_022F9498:
	tst r0, #0x700
	bne _022F94F0
	add r1, r4, #0x100
	ldrh r1, [r1, #0x76]
	cmp r1, #0x200
	bgt _022F94C8
	bge _022F94E4
	cmp r1, #0x100
	orreq r0, r0, #0x300
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	b _022F94F0
_022F94C8:
	cmp r1, #0x300
	ble _022F94F0
	cmp r1, #0x400
	orreq r0, r0, #0x200
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	b _022F94F0
_022F94E4:
	orr r0, r0, #0x100
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_022F94F0:
	add r1, r4, #0x100
	ldrsh r2, [r1, #0x80]
	cmp r2, r0
	strneh r0, [r1, #0x80]
	movne r0, #1
	strneb r0, [r4, #0x174]
	bne _022F9518
	tst r2, #0x1000
	movne r0, #1
	strneb r0, [r4, #0x174]
_022F9518:
	ldrb r0, [r4, #0x174]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9520: .word 0x00000807
_022F9524: .word 0x023218CC
	arm_func_end ov11_022F93C8

	arm_func_start ov11_022F9528
ov11_022F9528: ; 0x022F9528
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _022F9634 ; =0x02321684
	mov r4, r0
	ldr r0, [r2, #0x6c]
	ldr r3, [r2, #0x68]
	str r0, [sp, #0xc]
	str r3, [sp, #8]
	ldr ip, [r1]
	ldr r3, [r4, #0x14]
	add r0, r4, #0x38
	sub r3, ip, r3
	str r3, [sp, #8]
	ldr ip, [r1, #4]
	ldr r3, [r4, #0x18]
	sub r3, ip, r3
	str r3, [sp, #0xc]
	ldr r3, [r2, #0xd8]
	ldr r2, [r2, #0xdc]
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, [r4, #0x14]
	add r2, r3, r2
	str r2, [sp]
	ldr r2, [r1, #4]
	ldr r1, [r4, #0x18]
	add r1, r2, r1
	str r1, [sp, #4]
	bl ov11_022DC958
	cmp r0, #0
	bne _022F9608
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022F95E8
	ldr r1, [sp]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022F95E8
	ldr r1, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022F95E8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022F95F0
_022F95E8:
	mov r0, #0x40
	b _022F962C
_022F95F0:
	add r1, sp, #8
	add r2, sp, #0
	mov r0, r4
	bl ov11_022F921C
	cmp r0, #0
	bne _022F962C
_022F9608:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #0
	str r2, [r4, #0x15c]
	str r1, [r4, #0x160]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r4, #0x164]
	str r1, [r4, #0x168]
_022F962C:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9634: .word 0x02321684
	arm_func_end ov11_022F9528

	arm_func_start ov11_022F9638
ov11_022F9638: ; 0x022F9638
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	ldr r2, _022F99C4 ; =0x02321684
	mov r6, r0
	ldr r0, [r2, #0xc4]
	ldr r3, [r2, #0xc0]
	str r0, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r3, [r6, #0x15c]
	ldr r0, [r1]
	add r0, r3, r0
	str r0, [sp, #0x24]
	ldr r4, [r6, #0x160]
	ldr r3, [r1, #4]
	add r3, r4, r3
	str r3, [sp, #0x28]
	ldr r3, [r2, #0x40]
	ldr r2, [r2, #0x44]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r3, [r6, #0x164]
	ldr r2, [r1]
	add r3, r3, r2
	str r3, [sp, #0x1c]
	ldr r2, [r6, #0x168]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0x20]
	ldr r1, [r6, #0x28]
	cmp r0, r1
	bge _022F96CC
	str r1, [sp, #0x24]
	ldr r1, [r6, #0x28]
	ldr r0, [r6, #0xc]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	b _022F96E8
_022F96CC:
	ldr r1, [r6, #0x30]
	cmp r3, r1
	ldrge r0, [r6, #0xc]
	subge r0, r1, r0
	strge r0, [sp, #0x24]
	ldrge r0, [r6, #0x30]
	strge r0, [sp, #0x1c]
_022F96E8:
	ldr r1, [r6, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bge _022F9710
	str r1, [sp, #0x28]
	ldr r1, [r6, #0x2c]
	ldr r0, [r6, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x20]
	b _022F9730
_022F9710:
	ldr r1, [r6, #0x34]
	ldr r0, [sp, #0x20]
	cmp r0, r1
	ldrge r0, [r6, #0x10]
	subge r0, r1, r0
	strge r0, [sp, #0x28]
	ldrge r0, [r6, #0x34]
	strge r0, [sp, #0x20]
_022F9730:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	sub r5, r1, #1
	sub r4, r0, #1
	ldr lr, [sp, #0x24]
	ldr ip, [sp, #0x28]
	mov r2, r5, asr #2
	mov r3, r4, asr #2
	mov r0, lr, asr #2
	add r2, r5, r2, lsr #29
	mov r1, ip, asr #2
	add r3, r4, r3, lsr #29
	add r0, lr, r0, lsr #29
	mov r5, r2, asr #3
	add r1, ip, r1, lsr #29
	mov r4, r3, asr #3
	mov lr, r0, asr #3
	mov r2, r5, asr #7
	mov ip, r1, asr #3
	mov r3, r4, asr #7
	mov r0, lr, asr #7
	add r2, r5, r2, lsr #24
	mov r1, ip, asr #7
	add r3, r4, r3, lsr #24
	add r0, lr, r0, lsr #24
	mov r5, r2, asr #8
	mov r4, r3, asr #8
	add r1, ip, r1, lsr #24
	mov lr, r0, asr #8
	mov ip, r1, asr #8
	sub r3, r5, r0, asr #8
	sub r2, r4, r1, asr #8
	add r1, r3, #1
	add r0, r2, #1
	str r1, [sp, #0x10]
	str lr, [sp]
	str ip, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x128]
	str r5, [sp, #8]
	tst r0, #0x40
	str r4, [sp, #0xc]
	add r0, sp, #0
	add r1, sp, #0x10
	beq _022F97F4
	bl ov11_022F204C
	cmp r0, #0
	movne r5, #1
	bne _022F9910
_022F97F4:
	ldr r0, [r6, #0x128]
	tst r0, #0x80
	beq _022F9818
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov11_022F20CC
	cmp r0, #0
	movne r5, #1
	bne _022F9910
_022F9818:
	ldr r0, [r6, #0x128]
	tst r0, #0x100
	beq _022F9878
	ldrsh r0, [r6]
	add r2, sp, #0x24
	add r3, sp, #0x1c
	mov r1, #0x1100
	bl ov11_022F9180
	movs r1, r0
	bmi _022F9878
	ldr r2, _022F99C8 ; =0x02324CF8
	mov r0, #0x250
	ldr r2, [r2, #4]
	smlabb r0, r1, r0, r2
	ldr r0, [r0, #0x128]
	tst r0, #0x1000
	beq _022F9870
	ldrsh r0, [r6]
	bl ov11_022F8AF4
	cmp r0, #0
	movne r5, #2
	bne _022F9910
_022F9870:
	mov r5, #1
	b _022F9910
_022F9878:
	ldr r0, [r6, #0x128]
	tst r0, #0x200
	beq _022F98D0
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x1100
	bl ov11_022FCD18
	movs r4, r0
	bmi _022F98D0
	add r1, sp, #0x18
	bl ov11_022FCCA0
	ldr r0, [sp, #0x18]
	tst r0, #0x1000
	beq _022F98C8
	ldrsh r0, [r6]
	arm_func_end ov11_022F9638

	arm_func_start ov11_022F98B4
ov11_022F98B4: ; 0x022F98B4
	mov r1, r4
	bl ov11_022F8B54
	cmp r0, #0
	movne r5, #2
	bne _022F9910
_022F98C8:
	mov r5, #1
	b _022F9910
_022F98D0:
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F990C
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x1000
	bl ov11_022FEDF8
	movs r1, r0
	bmi _022F990C
	ldrsh r0, [r6]
	bl ov11_022F8BB4
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	b _022F9910
_022F990C:
	mov r5, #0
_022F9910:
	cmp r5, #0
	bne _022F99B8
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	str r1, [r6, #0x15c]
	str r0, [r6, #0x160]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	str r1, [r6, #0x164]
	str r0, [r6, #0x168]
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F99B0
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x800
	bl ov11_022FEDF8
	movs r4, r0
	bmi _022F999C
	ldrb r0, [r6, #0x152]
	cmp r0, #0
	add r0, r6, #0x100
	strneh r4, [r0, #0x54]
	bne _022F99A8
	ldrsh r0, [r0, #0x54]
	cmp r0, r4
	beq _022F99A8
	ldrsh r0, [r6]
	mov r1, r4
	bl ov11_022F8BB4
	cmp r0, #0
	addne r0, r6, #0x100
	strneh r4, [r0, #0x54]
	movne r5, #2
	b _022F99A8
_022F999C:
	add r0, r6, #0x100
	mvn r1, #0
	strh r1, [r0, #0x54]
_022F99A8:
	mov r0, #0
	strb r0, [r6, #0x152]
_022F99B0:
	mov r0, r5
	b _022F99BC
_022F99B8:
	mov r0, r5
_022F99BC:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F99C4: .word 0x02321684
_022F99C8: .word 0x02324CF8
	arm_func_end ov11_022F98B4

	arm_func_start ov11_022F99CC
ov11_022F99CC: ; 0x022F99CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	ldmia r3, {r4, sb}
	ldr r3, [sp, #0x48]
	str r4, [sp, #0x20]
	str sb, [sp, #0x24]
	ldr lr, [r3]
	ldr r3, [r3, #4]
	sub r8, lr, #1
	sub r7, r3, #1
	mov ip, r8, asr #0xa
	mov r6, r7, asr #0xa
	mov sl, r4, asr #0xa
	mov r5, sb, asr #0xa
	add r8, r8, ip, lsr #21
	add r6, r7, r6, lsr #21
	mov ip, r8, asr #0xb
	add r5, sb, r5, lsr #21
	add r4, r4, sl, lsr #21
	mov r7, r6, asr #0xb
	sub r6, ip, r4, asr #11
	mov sb, r4, asr #0xb
	sub sl, r7, r5, asr #11
	mov r8, r5, asr #0xb
	add r6, r6, #1
	add sl, sl, #1
	str r3, [sp, #0x1c]
	mov r4, r2
	mov r5, r1
	str lr, [sp, #0x18]
	str sb, [sp, #0x10]
	str r8, [sp, #0x14]
	str r6, [sp]
	str sl, [sp, #4]
	ldrsh r0, [r0]
	add r2, sp, #0x20
	add r3, sp, #0x18
	mov r1, #0x2000
	str ip, [sp, #8]
	str r7, [sp, #0xc]
	bl ov11_022F9180
	cmp r0, #0
	blt _022F9A88
	cmp r5, r0
	moveq r0, #3
	movne r0, #0
	b _022F9ACC
_022F9A88:
	add r1, sp, #0x20
	add r2, sp, #0x18
	mov r0, #0x2000
	bl ov11_022FCD18
	cmp r0, #0
	blt _022F9AB0
	cmp r4, r0
	moveq r0, #3
	movne r0, #0
	b _022F9ACC
_022F9AB0:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, #0x10
	bl ov11_022F214C
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
_022F9ACC:
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov11_022F99CC

	arm_func_start ov11_022F9AD4
ov11_022F9AD4: ; 0x022F9AD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov r6, r1
	mov sl, r0
	mov sb, r2
	add r1, sp, #0x2c
	mov r0, r6
	mov r2, #0x100
	mov r8, r3
	bl sub_02005494
	ldr r1, _022F9F54 ; =0x02321684
	ldr r7, [sp, #0x2c]
	ldr r0, [r1, #0x9c]
	ldr r2, [r1, #0x98]
	str r0, [sp, #0x28]
	str r2, [sp, #0x24]
	ldr r0, [sl, #0x15c]
	ldr r5, [sp, #0x30]
	add r0, r0, r7
	str r0, [sp, #0x24]
	ldr r2, [sl, #0x160]
	add r3, sp, #0x24
	add r2, r2, r5
	str r2, [sp, #0x28]
	ldr fp, [r1, #0x90]
	ldr r2, [r1, #0x94]
	add r4, sp, #0x1c
	str r2, [sp, #0x20]
	str fp, [sp, #0x1c]
	ldr fp, [sl, #0x164]
	mov r0, sl
	add r7, fp, r7
	str r7, [sp, #0x1c]
	ldr r7, [sl, #0x168]
	mov r1, sb
	add r5, r7, r5
	str r5, [sp, #0x20]
	mov r2, r8
	str r4, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9B8C
	ldr r0, _022F9F58 ; =0x02321C54
	bl DebugPrint0__0200C1FC
	mov r0, #1
	b _022F9F4C
_022F9B8C:
	ldr r1, [sl, #0xc]
	ldr r3, _022F9F54 ; =0x02321684
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	ldr r2, [sp, #0x2c]
	add r1, r1, #0x200
	mul r4, r2, r1
	ldr r2, [sl, #0x10]
	mov r1, r4, asr #7
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	add r1, r4, r1, lsr #24
	mov ip, r1, asr #8
	ldr r7, [r3, #0x80]
	ldr r5, [r3, #0x84]
	ldr r3, [sp, #0x30]
	add r2, r2, #0x200
	mul r4, r3, r2
	mov r2, r4, asr #7
	add r2, r4, r2, lsr #24
	ldr r4, _022F9F5C ; =0x023217F8
	mov fp, r2, asr #8
	str fp, [sp, #0x18]
	str r7, [sp, #0xc]
	str r5, [sp, #0x10]
	ldr r7, [sl, #0x15c]
	ldr r5, [sl, #0x14]
	ldr r3, _022F9F60 ; =0x02321818
	add r5, r7, r5
	add r1, r5, r1, asr #8
	sub r5, r1, #0x300
	str r5, [sp, #0xc]
	ldr r7, [sl, #0x160]
	ldr r1, [sl, #0x18]
	add r5, r5, #0x600
	add r1, r7, r1
	add r1, r1, r2, asr #8
	sub r2, r1, #0x300
	add r1, r2, #0x600
	str r5, [sp, #4]
	ldr lr, _022F9F64 ; =0x02321838
	str ip, [sp, #0x14]
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	ldr r4, [r4, r6, lsl #2]
	ldr r5, [r3, r6, lsl #2]
	ldr r6, [lr, r6, lsl #2]
	add fp, sp, #4
	mov r7, #0x200
	b _022F9D20
_022F9C54:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9C94
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9C94
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9C94
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9CA8
_022F9C94:
	ldr r0, _022F9F68 ; =0x02321C68
	mov r1, r7
	bl DebugPrint0__0200C1FC
	mov r0, #0
	b _022F9F4C
_022F9CA8:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	add r3, sp, #0xc
	str fp, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9CDC
	ldr r0, _022F9F6C ; =0x02321C88
	mov r1, r7
	bl DebugPrint0__0200C1FC
	mov r0, #1
	b _022F9F4C
_022F9CDC:
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	add ip, r2, r3
	add r1, r1, r3
	ldr r3, [sp, #0x30]
	ldr r2, [sp, #0x10]
	str ip, [sp, #0xc]
	ldr ip, [sp, #8]
	str r1, [sp, #4]
	add r2, r2, r3
	add r1, ip, r3
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	cmp r0, #6
	beq _022F9D28
	add r7, r7, #0x100
_022F9D20:
	cmp r7, r4
	blt _022F9C54
_022F9D28:
	cmp r0, #6
	beq _022F9D44
	ldr r0, _022F9F70 ; =0x02321CA0
	mov r1, r7
	bl DebugPrint0__0200C1FC
	mov r0, #0
	b _022F9F4C
_022F9D44:
	add r8, sp, #4
	mvn r4, #0
	b _022F9E1C
_022F9D50:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9D90
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9D90
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9D90
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9DA4
_022F9D90:
	ldr r0, _022F9F74 ; =0x02321CBC
	mov r1, r7
	bl DebugPrint0__0200C1FC
	mov r0, #0
	b _022F9F4C
_022F9DA4:
	mov r0, sl
	mov r1, sb
	mov r2, r4
	add r3, sp, #0xc
	str r8, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9DD8
	ldr r0, _022F9F78 ; =0x02321CDC
	mov r1, r7
	bl DebugPrint0__0200C1FC
	mov r0, #1
	b _022F9F4C
_022F9DD8:
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	add r2, r2, r3
	add fp, r1, r3
	ldr r1, [sp, #0x30]
	ldr ip, [sp, #0x10]
	ldr r3, [sp, #8]
	str r2, [sp, #0xc]
	add r2, ip, r1
	add r1, r3, r1
	str r2, [sp, #0x10]
	str fp, [sp, #4]
	str r1, [sp, #8]
	cmp r0, #6
	bne _022F9E24
	add r7, r7, #0x100
_022F9E1C:
	cmp r7, r5
	blt _022F9D50
_022F9E24:
	cmp r0, #6
	bne _022F9E40
	ldr r0, _022F9F7C ; =0x02321CF4
	mov r1, r7
	bl DebugPrint0__0200C1FC
	mov r0, #0
	b _022F9F4C
_022F9E40:
	mov r8, #0
	add r7, sp, #4
	mvn r5, #0
	add r4, sp, #0xc
	b _022F9F34
_022F9E54:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9E94
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9E94
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9E94
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9EA8
_022F9E94:
	ldr r0, _022F9F80 ; =0x02321D10
	mov r1, r8
	bl DebugPrint0__0200C1FC
	mov r0, #0
	b _022F9F4C
_022F9EA8:
	mov r0, sl
	mov r1, sb
	mov r2, r5
	mov r3, r4
	str r7, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9EDC
	ldr r0, _022F9F84 ; =0x02321D30
	mov r1, r8
	bl DebugPrint0__0200C1FC
	mov r0, #1
	b _022F9F4C
_022F9EDC:
	cmp r0, #6
	bne _022F9EF8
	ldr r0, _022F9F88 ; =0x02321D48
	mov r1, r8
	bl DebugPrint0__0200C1FC
	mov r0, #0
	b _022F9F4C
_022F9EF8:
	ldr r2, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	add r0, r0, r2
	add r2, r1, r2
	ldr fp, [sp, #0x30]
	ldr r3, [sp, #0x10]
	ldr r1, [sp, #8]
	add r3, r3, fp
	add r1, r1, fp
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r2, [sp, #4]
	str r1, [sp, #8]
	add r8, r8, #0x100
_022F9F34:
	cmp r8, r6
	blt _022F9E54
	ldr r0, _022F9F8C ; =0x02321D6C
	mov r1, r8
	bl DebugPrint0__0200C1FC
	mov r0, #0
_022F9F4C:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F9F54: .word 0x02321684
_022F9F58: .word 0x02321C54
_022F9F5C: .word 0x023217F8
_022F9F60: .word 0x02321818
_022F9F64: .word 0x02321838
_022F9F68: .word 0x02321C68
_022F9F6C: .word 0x02321C88
_022F9F70: .word 0x02321CA0
_022F9F74: .word 0x02321CBC
_022F9F78: .word 0x02321CDC
_022F9F7C: .word 0x02321CF4
_022F9F80: .word 0x02321D10
_022F9F84: .word 0x02321D30
_022F9F88: .word 0x02321D48
_022F9F8C: .word 0x02321D6C
	arm_func_end ov11_022F9AD4

	arm_func_start ov11_022F9F90
ov11_022F9F90: ; 0x022F9F90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	movs r5, r1
	mov r6, r0
	mov r4, r2
	bmi _022FA028
	add r1, sp, #0x10
	mov r0, r5
	bl ov11_022F90F4
	ldr r1, [r6, #0x15c]
	ldr r0, [r6, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	sub r0, r2, r0
	str r0, [sp, #8]
	ldr r1, [r6, #0x160]
	ldr r0, [r6, #0x18]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	sub r1, r2, r0
	add r0, sp, #8
	str r1, [sp, #0xc]
	bl sub_020055C8
	mov r7, r0
	mvn r1, #0
	cmp r7, r1
	beq _022FA028
	add r1, sp, #0
	mov r2, #0x100
	bl sub_02005494
	mov r0, r6
	mov r1, r7
	mov r2, r5
	mvn r3, #0
	bl ov11_022F9AD4
	cmp r0, #0
	movne r0, #1
	bne _022FA0B4
_022FA028:
	cmp r4, #0
	blt _022FA0B0
	add r1, sp, #0x10
	mov r0, r4
	bl ov11_022FCCC4
	ldr r1, [r6, #0x15c]
	ldr r0, [r6, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	sub r0, r2, r0
	str r0, [sp, #8]
	ldr r1, [r6, #0x160]
	ldr r0, [r6, #0x18]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	sub r1, r2, r0
	add r0, sp, #8
	str r1, [sp, #0xc]
	bl sub_020055C8
	mvn r1, #0
	cmp r0, r1
	beq _022FA0B0
	add r1, sp, #0
	mov r2, #0x100
	bl sub_02005494
	add r0, r6, #0x100
	ldrsb r1, [r0, #0x5a]
	mov r0, r6
	mov r3, r4
	mvn r2, #0
	bl ov11_022F9AD4
	cmp r0, #0
	movne r0, #1
	bne _022FA0B4
_022FA0B0:
	mov r0, #0
_022FA0B4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022F9F90

	arm_func_start ov11_022FA0BC
ov11_022FA0BC: ; 0x022FA0BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	ldr r4, [r2]
	ldr r2, [r2, #4]
	mov r5, r4, asr #0xa
	str r4, [sp, #0x20]
	str r2, [sp, #0x24]
	ldr lr, [r3]
	ldr ip, [r3, #4]
	sub sb, lr, #1
	sub r8, ip, #1
	mov r3, sb, asr #0xa
	mov r7, r8, asr #0xa
	mov r6, r2, asr #0xa
	add r3, sb, r3, lsr #21
	add r5, r4, r5, lsr #21
	mov r4, r1
	mov r3, r3, asr #0xb
	add r7, r8, r7, lsr #21
	add r6, r2, r6, lsr #21
	mov r2, r7, asr #0xb
	sub r8, r3, r5, asr #11
	mov r1, r5, asr #0xb
	mov sb, r6, asr #0xb
	sub r7, r2, r6, asr #11
	add r8, r8, #1
	add r6, r7, #1
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r5, r0
	str lr, [sp, #0x18]
	str ip, [sp, #0x1c]
	str r1, [sp, #0x10]
	str sb, [sp, #0x14]
	str r8, [sp]
	str r6, [sp, #4]
	tst r4, #0x100
	add r2, sp, #0x20
	add r3, sp, #0x18
	beq _022FA184
	ldrsh r0, [r5]
	mov r1, #0x2000
	bl ov11_022F9180
	movs r1, r0
	bmi _022FA184
	ldrsh r0, [r5]
	bl ov11_022F8AF4
	cmp r0, #0
	movne r0, #3
	bne _022FA1D4
_022FA184:
	tst r4, #0x200
	beq _022FA1B8
	add r1, sp, #0x20
	add r2, sp, #0x18
	mov r0, #0x2000
	bl ov11_022FCD18
	movs r1, r0
	bmi _022FA1B8
	ldrsh r0, [r5]
	bl ov11_022F8B54
	cmp r0, #0
	movne r0, #3
	bne _022FA1D4
_022FA1B8:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, #0x10
	bl ov11_022F214C
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
_022FA1D4:
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov11_022FA0BC

	arm_func_start ov11_022FA1DC
ov11_022FA1DC: ; 0x022FA1DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x58
	mov r4, r0
	add r0, r4, #0x100
	mov r5, #0x300
	mvn r7, #0
	strh r5, [r0, #0x76]
	mov r5, #1
	strh r5, [r0, #0x78]
	str r1, [r4, #0x14c]
	cmp r2, r7
	beq _022FA21C
	cmp r3, #0
	mov r5, r2
	strneb r2, [r4, #0x15a]
	b _022FA220
_022FA21C:
	ldrsb r5, [r0, #0x5a]
_022FA220:
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _022FA924
_022FA22C: ; jump table
	b _022FA924 ; case 0
	b _022FA2A4 ; case 1
	b _022FA27C ; case 2
	b _022FA2CC ; case 3
	b _022FA2CC ; case 4
	b _022FA2CC ; case 5
	b _022FA2CC ; case 6
	b _022FA2CC ; case 7
	b _022FA2CC ; case 8
	b _022FA47C ; case 9
	b _022FA4C8 ; case 10
	b _022FA4A4 ; case 11
	b _022FA924 ; case 12
	b _022FA924 ; case 13
	b _022FA924 ; case 14
	b _022FA924 ; case 15
	b _022FA924 ; case 16
	b _022FA924 ; case 17
	b _022FA8F0 ; case 18
	b _022FA914 ; case 19
_022FA27C:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FA93C
_022FA2A4:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	mov r7, #0x300
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FA93C
_022FA2CC:
	mvn r0, #0
	cmp r2, r0
	beq _022FA450
	mov sb, #4
	str sb, [r4, #0x17c]
	cmp r1, #8
	mov r8, #0
	addls pc, pc, r1, lsl #2
	b _022FA334
_022FA2F0: ; jump table
	b _022FA334 ; case 0
	b _022FA334 ; case 1
	b _022FA334 ; case 2
	b _022FA314 ; case 3
	b _022FA320 ; case 4
	b _022FA32C ; case 5
	b _022FA314 ; case 6
	b _022FA320 ; case 7
	b _022FA32C ; case 8
_022FA314:
	mov r7, #0x900
	mov sb, #1
	b _022FA340
_022FA320:
	mov r7, #0x800
	mov sb, #2
	b _022FA340
_022FA32C:
	mov r7, #0xa00
	b _022FA340
_022FA334:
	mov sb, #0
	ldr r7, _022FA9C4 ; =0x00000807
	str sb, [r4, #0x17c]
_022FA340:
	mov r0, r2
	add r1, sp, #0x50
	mov r2, #0x100
	bl sub_02005494
	ldr r0, _022FA9C8 ; =0x02321684
	mov sl, #0
	ldr r6, [r0, #0x30]
	ldr r2, [r0, #0x34]
	ldr r1, [r0, #0x20]
	ldr r5, [r0, #0x24]
	str r6, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp]
	str r5, [sp, #4]
	add fp, sp, #0x50
	b _022FA408
_022FA380:
	mov r0, r4
	mov r1, fp
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	bne _022FA3A4
	add r0, r4, #0x12c
	bl ov11_022EAF60
	b _022FA410
_022FA3A4:
	cmp r8, #1
	bne _022FA404
	ldr r1, [sp, #0x54]
	add r0, r4, #0x12c
	str r6, [sp, #0x48]
	str r1, [sp, #0x4c]
	bl ov11_022EAF60
	mov r0, r4
	add r1, sp, #0x48
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	beq _022FA410
	cmp r8, #1
	bne _022FA404
	ldr r2, [sp, #0x50]
	mov r0, r4
	add r1, sp, #0x40
	str r5, [sp, #0x44]
	str r2, [sp, #0x40]
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	beq _022FA410
_022FA404:
	add sl, sl, #1
_022FA408:
	cmp sl, sb
	blt _022FA380
_022FA410:
	cmp r8, #2
	ldr r0, [r4, #0x128]
	bne _022FA438
	mvn r7, #0
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FA93C
_022FA438:
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FA93C
_022FA450:
	mov r0, #0
	str r0, [r4, #0x14c]
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FA93C
_022FA47C:
	ldrsh r0, [r4, #2]
	mov r1, #0xa
	bl sub_02065B3C
	mov r0, r4
	mov r1, #0xa
	bl ov11_022F8AA8
	mov r0, #0
	mov r1, #0xb
	bl ov11_022F881C
	b _022FA93C
_022FA4A4:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA4C8
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
_022FA4C8:
	add r1, sp, #0x10
	mov r0, r5
	mov r2, #0x100
	bl sub_02005494
	ldr r0, _022FA9C8 ; =0x02321684
	ldr r1, [sp, #0x10]
	ldr r2, [r0, #0x5c]
	ldr r3, [r0, #0x58]
	str r2, [sp, #0x1c]
	str r3, [sp, #0x18]
	ldr r2, [r4, #0x15c]
	ldr r6, [sp, #0x14]
	add r2, r2, r1
	str r2, [sp, #0x18]
	ldr r3, [r4, #0x160]
	add r2, sp, #0x18
	add r3, r3, r6
	str r3, [sp, #0x1c]
	ldr r8, [r0, #0x50]
	ldr r0, [r0, #0x54]
	add r3, sp, #0x20
	str r0, [sp, #0x24]
	str r8, [sp, #0x20]
	ldr r8, [r4, #0x164]
	mov r0, r4
	add r1, r8, r1
	str r1, [sp, #0x20]
	ldr r8, [r4, #0x168]
	mov r1, #0x300
	add r6, r8, r6
	str r6, [sp, #0x24]
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA55C
	ldr r0, _022FA9CC ; =0x02321C54
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA55C:
	ldr r1, [r4, #0xc]
	ldr sl, _022FA9D0 ; =0x023217F8
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	ldr r2, [sp, #0x10]
	add r1, r1, #0x200
	mul r8, r2, r1
	ldr r2, [r4, #0x10]
	mov r1, r8, asr #7
	add r2, r2, r2, lsr #31
	ldr r3, _022FA9C8 ; =0x02321684
	mov r6, r2, asr #1
	add r8, r8, r1, lsr #24
	ldr sb, [sp, #0x14]
	ldr r2, [r3, #0x160]
	ldr r1, [r3, #0x164]
	add r3, r6, #0x200
	mul r6, sb, r3
	mov r3, r6, asr #7
	add sb, r6, r3, lsr #24
	mov r6, r8, asr #8
	mov r3, sb, asr #8
	str r2, [sp, #0x30]
	str r1, [sp, #0x34]
	ldr r2, [r4, #0x15c]
	ldr r1, [r4, #0x14]
	str r6, [sp, #0x28]
	add r1, r2, r1
	add r1, r1, r8, asr #8
	sub r2, r1, #0x300
	str r2, [sp, #0x30]
	ldr fp, _022FA9D4 ; =0x02321838
	ldr r6, [r4, #0x160]
	ldr r1, [r4, #0x18]
	add r2, r2, #0x600
	add r1, r6, r1
	add r1, r1, sb, asr #8
	sub r6, r1, #0x300
	ldr ip, _022FA9D8 ; =0x02321818
	add r1, r6, #0x600
	str r6, [sp, #0x34]
	ldr r8, [fp, r5, lsl #2]
	str r3, [sp, #0x2c]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	ldr sl, [sl, r5, lsl #2]
	ldr sb, [ip, r5, lsl #2]
	add r5, sp, #0x30
	add fp, sp, #0x38
	mov r6, #0x200
	b _022FA6E8
_022FA628:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA668
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA668
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA668
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA678
_022FA668:
	ldr r0, _022FA9DC ; =0x02321C68
	mov r1, r6
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA678:
	mov r0, r4
	mov r1, #0x300
	mov r2, r5
	mov r3, fp
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA6A4
	ldr r0, _022FA9E0 ; =0x02321C88
	mov r1, r6
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA6A4:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add ip, r2, r3
	add r1, r1, r3
	ldr r3, [sp, #0x14]
	ldr r2, [sp, #0x34]
	str ip, [sp, #0x30]
	ldr ip, [sp, #0x3c]
	str r1, [sp, #0x38]
	add r2, r2, r3
	add r1, ip, r3
	str r2, [sp, #0x34]
	str r1, [sp, #0x3c]
	cmp r0, #6
	beq _022FA6F0
	add r6, r6, #0x100
_022FA6E8:
	cmp r6, sl
	blt _022FA628
_022FA6F0:
	cmp r0, #6
	beq _022FA708
	ldr r0, _022FA9E4 ; =0x02321CA0
	mov r1, r6
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA708:
	mov sl, #0x100
	add r5, sp, #0x30
	b _022FA7D4
_022FA714:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA754
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA754
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA754
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA764
_022FA754:
	ldr r0, _022FA9E8 ; =0x02321CBC
	mov r1, r6
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA764:
	mov r0, r4
	mov r1, sl
	mov r2, r5
	add r3, sp, #0x38
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA790
	ldr r0, _022FA9EC ; =0x02321CDC
	mov r1, r6
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA790:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add r2, r2, r3
	add fp, r1, r3
	ldr r1, [sp, #0x14]
	ldr ip, [sp, #0x34]
	ldr r3, [sp, #0x3c]
	str r2, [sp, #0x30]
	add r2, ip, r1
	add r1, r3, r1
	str r2, [sp, #0x34]
	str fp, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r0, #6
	bne _022FA7DC
	add r6, r6, #0x100
_022FA7D4:
	cmp r6, sb
	blt _022FA714
_022FA7DC:
	cmp r0, #6
	bne _022FA7F4
	ldr r0, _022FA9F0 ; =0x02321CF4
	mov r1, r6
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA7F4:
	mov sl, #0
	mov sb, #0x100
	add r6, sp, #0x30
	add r5, sp, #0x38
	b _022FA8D8
_022FA808:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA848
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA848
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA848
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA858
_022FA848:
	ldr r0, _022FA9F4 ; =0x02321D10
	mov r1, sl
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA858:
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, r5
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA884
	ldr r0, _022FA9F8 ; =0x02321D30
	mov r1, sl
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA884:
	cmp r0, #6
	bne _022FA89C
	ldr r0, _022FA9FC ; =0x02321D48
	mov r1, sl
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA89C:
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add r0, r0, r2
	add r2, r1, r2
	ldr fp, [sp, #0x14]
	ldr r3, [sp, #0x34]
	ldr r1, [sp, #0x3c]
	add r3, r3, fp
	add r1, r1, fp
	str r0, [sp, #0x30]
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	add sl, sl, #0x100
_022FA8D8:
	cmp sl, r8
	blt _022FA808
	ldr r0, _022FAA00 ; =0x02321D6C
	mov r1, sl
	bl DebugPrint0__0200C1FC
	b _022FA93C
_022FA8F0:
	bl KeyWaitInit__02006DA4
	mov r0, #4
	bl sub_02017CCC
	bl sub_020676AC
	bl ov11_02300D5C
	add r0, r4, #0x12c
	mov r1, #6
	bl ov11_022EA990
	b _022FA93C
_022FA914:
	mov r0, r4
	mov r1, #0x2ac
	bl ov11_022F8AA8
	b _022FA93C
_022FA924:
	ldr r0, [r4, #0x128]
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl ov11_022F872C
_022FA93C:
	mvn r0, #0
	cmp r7, r0
	addne r2, r4, #0x100
	ldrnesh r0, [r2, #0x80]
	cmpne r7, r0
	beq _022FA97C
	mov r0, #0
	strb r0, [r4, #0x174]
	ldrsb r1, [r2, #0x5a]
	add r0, r4, #0x18c
	strb r1, [r4, #0x175]
	strh r7, [r2, #0x80]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl ov11_022F52E8
	b _022FA9BC
_022FA97C:
	ldrb r0, [r4, #0x174]
	cmp r0, #0
	addeq r0, r4, #0x100
	ldreqsb r1, [r0, #0x75]
	ldreqsb r0, [r0, #0x5a]
	cmpeq r1, r0
	beq _022FA9BC
	mov r0, #0
	strb r0, [r4, #0x174]
	add r2, r4, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r4, #0x18c
	strb r1, [r4, #0x175]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl ov11_022F52E8
_022FA9BC:
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FA9C4: .word 0x00000807
_022FA9C8: .word 0x02321684
_022FA9CC: .word 0x02321C54
_022FA9D0: .word 0x023217F8
_022FA9D4: .word 0x02321838
_022FA9D8: .word 0x02321818
_022FA9DC: .word 0x02321C68
_022FA9E0: .word 0x02321C88
_022FA9E4: .word 0x02321CA0
_022FA9E8: .word 0x02321CBC
_022FA9EC: .word 0x02321CDC
_022FA9F0: .word 0x02321CF4
_022FA9F4: .word 0x02321D10
_022FA9F8: .word 0x02321D30
_022FA9FC: .word 0x02321D48
_022FAA00: .word 0x02321D6C
	arm_func_end ov11_022FA1DC

	arm_func_start ov11_022FAA04
ov11_022FAA04: ; 0x022FAA04
	ldrsh r0, [r0]
	bx lr
	arm_func_end ov11_022FAA04

	arm_func_start ov11_022FAA0C
ov11_022FAA0C: ; 0x022FAA0C
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x10]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end ov11_022FAA0C

	arm_func_start ov11_022FAA20
ov11_022FAA20: ; 0x022FAA20
	cmp r1, #0
	beq _022FAA6C
	ldr r3, [r1]
	ldr r2, [r0, #0x14]
	sub r2, r3, r2
	str r2, [r0, #0x15c]
	ldr r3, [r1]
	ldr r2, [r0, #0x14]
	add r2, r3, r2
	str r2, [r0, #0x164]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x160]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x18]
	add r1, r2, r1
	str r1, [r0, #0x168]
	bx lr
_022FAA6C:
	ldr r3, [r0, #0x20]
	ldr r1, [r0, #0x14]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x15c]
	ldr r3, [r0, #0x20]
	ldr r1, [r0, #0x14]
	add r1, r3, r1
	str r1, [r0, #0x164]
	ldr ip, [r0, #0x24]
	ldr r3, [r0, #0x18]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x160]
	ldr ip, [r0, #0x24]
	ldr r3, [r0, #0x18]
	add r3, ip, r3
	str r3, [r0, #0x168]
	str r2, [r0, #0x170]
	str r2, [r0, #0x16c]
	ldrsb r2, [r1, #0x5a]
	ldrsb r1, [r0, #0x1c]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x174]
	ldrsb r1, [r0, #0x1c]
	strb r1, [r0, #0x15a]
	bx lr
	arm_func_end ov11_022FAA20

	arm_func_start ov11_022FAADC
ov11_022FAADC: ; 0x022FAADC
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x28]
	str r1, [r0, #0x2c]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end ov11_022FAADC

	arm_func_start ov11_022FAB00
ov11_022FAB00: ; 0x022FAB00
	ldr r3, [r0, #0x15c]
	ldr r2, [r0, #0x14]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x160]
	ldr r0, [r0, #0x18]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end ov11_022FAB00

	arm_func_start ov11_022FAB24
ov11_022FAB24: ; 0x022FAB24
	ldr ip, _022FAB2C ; =ov11_022F9528
	bx ip
	.align 2, 0
_022FAB2C: .word ov11_022F9528
	arm_func_end ov11_022FAB24

	arm_func_start ov11_022FAB30
ov11_022FAB30: ; 0x022FAB30
	ldr r3, [r0, #0x16c]
	str r3, [r1]
	ldr r0, [r0, #0x170]
	str r0, [r2]
	bx lr
	arm_func_end ov11_022FAB30

	arm_func_start ov11_022FAB44
ov11_022FAB44: ; 0x022FAB44
	str r1, [r0, #0x16c]
	bx lr
	arm_func_end ov11_022FAB44

	arm_func_start ov11_022FAB4C
ov11_022FAB4C: ; 0x022FAB4C
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x5a]
	strb r0, [r1]
	bx lr
	arm_func_end ov11_022FAB4C

	arm_func_start ov11_022FAB5C
ov11_022FAB5C: ; 0x022FAB5C
	mvn r2, #0
	cmp r1, r2
	strneb r1, [r0, #0x15a]
	addne r1, r0, #0x100
	ldrnesb r2, [r1, #0x75]
	ldrnesb r1, [r1, #0x5a]
	cmpne r2, r1
	movne r1, #1
	strneb r1, [r0, #0x174]
	bx lr
	arm_func_end ov11_022FAB5C

	arm_func_start ov11_022FAB84
ov11_022FAB84: ; 0x022FAB84
	ldrh r2, [r0]
	cmp r2, #2
	bhi _022FABC0
	ldrsh r3, [r0, #0xa]
	ldr r2, _022FABC8 ; =0x00000119
	cmp r3, r2
	addne r2, r2, #0x258
	cmpne r3, r2
	bne _022FABC0
	and r2, r1, #0xff
	cmp r2, #0x16
	andhs r1, r1, #0x1f00
	orrhs r1, r1, #0x53
	movhs r1, r1, lsl #0x10
	movhs r1, r1, lsr #0x10
_022FABC0:
	ldr ip, _022FABCC ; =ov11_022F93C8
	bx ip
	.align 2, 0
_022FABC8: .word 0x00000119
_022FABCC: .word ov11_022F93C8
	arm_func_end ov11_022FAB84

	arm_func_start ov11_022FABD0
ov11_022FABD0: ; 0x022FABD0
	add ip, r0, #0x100
	strh r1, [ip, #0x82]
	strh r2, [ip, #0x84]
	str r3, [r0, #0x188]
	bx lr
	arm_func_end ov11_022FABD0

	arm_func_start ov11_022FABE4
ov11_022FABE4: ; 0x022FABE4
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x174]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x18c
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FABE4

	arm_func_start ov11_022FAC04
ov11_022FAC04: ; 0x022FAC04
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r1, [r1, #0x84]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x18c
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FAC04

	arm_func_start ov11_022FAC28
ov11_022FAC28: ; 0x022FAC28
	ldr r0, [r0, #0x128]
	str r0, [r1]
	bx lr
	arm_func_end ov11_022FAC28

	arm_func_start ov11_022FAC34
ov11_022FAC34: ; 0x022FAC34
	ldr ip, _022FAC40 ; =ov11_022F872C
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_022FAC40: .word ov11_022F872C
	arm_func_end ov11_022FAC34

	arm_func_start ov11_022FAC44
ov11_022FAC44: ; 0x022FAC44
	ldr ip, _022FAC50 ; =ov11_022F87B8
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_022FAC50: .word ov11_022F87B8
	arm_func_end ov11_022FAC44

	arm_func_start ov11_022FAC54
ov11_022FAC54: ; 0x022FAC54
	ldr ip, _022FAC60 ; =ov11_022F4984
	add r0, r0, #0x18c
	bx ip
	.align 2, 0
_022FAC60: .word ov11_022F4984
	arm_func_end ov11_022FAC54

	arm_func_start ov11_022FAC64
ov11_022FAC64: ; 0x022FAC64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r2, _022FAE54 ; =0x02321684
	mov r5, r0
	ldr r0, [r2, #0xd4]
	ldr r3, [r2, #0xd0]
	str r0, [sp, #4]
	str r3, [sp]
	ldr r4, [r5, #0x15c]
	ldr r3, [r1]
	add r0, r5, #0x38
	add r3, r4, r3
	str r3, [sp]
	ldr r4, [r5, #0x160]
	ldr r3, [r1, #4]
	add r3, r4, r3
	str r3, [sp, #4]
	ldr r3, [r2, #0xc8]
	ldr r2, [r2, #0xcc]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r5, #0x164]
	ldr r2, [r1]
	add r2, r3, r2
	str r2, [sp, #8]
	ldr r2, [r5, #0x168]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0xc]
	bl ov11_022DC958
	cmp r0, #0
	bne _022FAE0C
	ldr r1, [r5, #0x28]
	ldr r0, [sp]
	mov r4, #0
	cmp r0, r1
	bge _022FAD14
	str r1, [sp]
	ldr r1, [r5, #0x28]
	ldr r0, [r5, #0xc]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #8]
	b _022FAD3C
_022FAD14:
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #8]
	cmp r0, r1
	blt _022FAD3C
	ldr r0, [r5, #0xc]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #0x30]
	str r0, [sp, #8]
_022FAD3C:
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #4]
	cmp r0, r1
	bge _022FAD68
	str r1, [sp, #4]
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x10]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #0xc]
	b _022FAD90
_022FAD68:
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _022FAD90
	ldr r0, [r5, #0x10]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0xc]
_022FAD90:
	add r1, sp, #0
	add r2, sp, #8
	mov r0, r5
	bl ov11_022F921C
	movs r6, r0
	beq _022FADC4
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE48
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FAE48
_022FADC4:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r4, #0
	str r1, [r5, #0x15c]
	str r0, [r5, #0x160]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x164]
	str r0, [r5, #0x168]
	beq _022FAE2C
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE04
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl ov11_022F872C
_022FAE04:
	mov r6, #0x40
	b _022FAE48
_022FAE0C:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [r5, #0x15c]
	str r0, [r5, #0x160]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x164]
	str r0, [r5, #0x168]
_022FAE2C:
	ldr r0, [r5, #0x128]
	tst r0, #0x20
	beq _022FAE44
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl ov11_022F872C
_022FAE44:
	mov r6, #0
_022FAE48:
	mov r0, r6
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FAE54: .word 0x02321684
	arm_func_end ov11_022FAC64

	arm_func_start ov11_022FAE58
ov11_022FAE58: ; 0x022FAE58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x9c
	ldr r1, _022FBA18 ; =0x02324CF8
	mvn r2, #0
	ldmia r1, {r0, r5}
	add r0, r0, #0x300
	strh r2, [r0, #0x28]
	ldr r0, [r1]
	mov r4, #0
	ldr fp, _022FBA1C ; =0x02321684
	str r4, [r0, #0x32c]
	ldr sl, [fp, #0xb8]
	ldr sb, [fp, #0xbc]
	ldr r8, [fp, #8]
	ldr r7, [fp, #0xc]
	ldr r6, [fp, #0x150]
	ldr r3, [fp, #0x154]
	ldr r2, [fp, #0xb0]
	ldr r1, [fp, #0xb4]
	ldr r0, [fp, #0x158]
	ldr fp, [fp, #0x15c]
	str sl, [sp, #0x2c]
	str sb, [sp, #0x30]
	str r8, [sp, #0x24]
	str r7, [sp, #0x28]
	str r6, [sp, #0x1c]
	str r3, [sp, #0x20]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0xc]
	str fp, [sp, #0x10]
_022FAED4:
	ldrsh r1, [r5, #2]
	mvn r0, #0
	cmp r1, r0
	ldrneb r0, [r5, #4]
	cmpne r0, #0
	beq _022FB894
	add r0, r5, #0x38
	bl ov11_022DD164
	cmp r0, #0
	beq _022FAF24
	mov r1, #1
	strb r1, [r5, #0x152]
	strb r1, [r5, #0x156]
	mov r1, #0
	str r1, [r5, #0x14c]
	cmp r0, #6
	bne _022FB864
	mov r0, r4
	bl ov11_022F8578
	b _022FB894
_022FAF24:
	ldrsh r1, [r5, #6]
	mvn r0, #0
	cmp r1, r0
	bne _022FAF4C
	mov r0, #1
	strb r0, [r5, #0x152]
	strb r0, [r5, #0x156]
	mov r0, #0
	str r0, [r5, #0x14c]
	b _022FB864
_022FAF4C:
	ldr r1, [r5, #0x128]
	tst r1, #1
	beq _022FB39C
	mov r1, #0
	str r1, [sp, #0x98]
	strb r0, [sp, #8]
	str r1, [sp, #0x94]
	bl ov11_022F9074
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r5, #0x152]
	streqb r0, [r5, #0x156]
	beq _022FAFA0
	ldrb r0, [r5, #0x156]
	cmp r0, #0
	beq _022FAFA0
	bl sub_02006DC8
	add r0, r5, #0x12c
	bl ov11_022EAF60
	mov r0, #0
	strb r0, [r5, #0x156]
_022FAFA0:
	ldr r2, _022FBA18 ; =0x02324CF8
	add r3, sp, #0x8c
	ldr r0, [r2]
	add r1, sp, #0x98
	add r0, r0, #0x300
	strh r4, [r0, #0x28]
	ldr r0, [r2]
	add r2, sp, #8
	str r5, [r0, #0x32c]
	str r3, [sp]
	ldr r6, [r5, #0x128]
	add r3, sp, #0x94
	add r0, r5, #0x12c
	str r6, [sp, #4]
	bl ov11_022EAA24
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022FB864
_022FAFE8: ; jump table
	b _022FB864 ; case 0
	b _022FB00C ; case 1
	b _022FB090 ; case 2
	b _022FB108 ; case 3
	b _022FB270 ; case 4
	b _022FB864 ; case 5
	b _022FB068 ; case 6
	b _022FB864 ; case 7
	b _022FB068 ; case 8
_022FB00C:
	ldr r0, [sp, #0x98]
	cmp r0, #0
	beq _022FB024
	sub r0, r0, #3
	cmp r0, #2
	bhi _022FB040
_022FB024:
	ldrsb r1, [sp, #8]
	mvn r0, #0
	cmp r1, r0
	beq _022FB048
	add r0, r5, #0x12c
	bl ov11_022EAF60
	b _022FB048
_022FB040:
	add r0, r5, #0x12c
	bl ov11_022EAF60
_022FB048:
	ldr r1, [sp, #0x94]
	mov r0, r5
	str r1, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB068:
	add r0, r5, #0x12c
	bl ov11_022EAF60
	ldr r1, [sp, #0x94]
	mov r0, r5
	str r1, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB090:
	ldr r1, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r2, [sp, #0x90]
	add r1, r1, r0
	mov r0, r1, asr #7
	ldr r3, [sp, #0x8c]
	add r0, r1, r0, lsr #24
	sub r0, r3, r0, asr #8
	str r0, [sp, #0x84]
	ldr r1, [r5, #0x160]
	ldr r0, [r5, #0x18]
	add r2, r2, #8
	add r1, r1, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	sub r1, r2, r0, asr #8
	add r0, sp, #0x84
	str r1, [sp, #0x88]
	bl sub_020054C0
	strb r0, [sp, #8]
	add r0, r5, #0x12c
	bl ov11_022EAF60
	mov r0, #0
	str r0, [sp]
	ldrsb r2, [sp, #8]
	ldr r1, [sp, #0x98]
	mov r0, r5
	mov r3, #1
	bl ov11_022FA1DC
	b _022FB864
_022FB108:
	ldr r1, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r3, [sp, #0x90]
	add r1, r1, r0
	mov r0, r1, asr #7
	ldr r2, [sp, #0x8c]
	add r0, r1, r0, lsr #24
	sub r0, r2, r0, asr #8
	str r0, [sp, #0x7c]
	ldr r2, [r5, #0x160]
	ldr r1, [r5, #0x18]
	add r3, r3, #8
	add r2, r2, r1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	sub r2, r3, r1, asr #8
	str r2, [sp, #0x80]
	ldr r1, [r5, #0x14c]
	sub r1, r1, #3
	cmp r1, #2
	bhi _022FB194
	mvn r1, #3
	cmp r0, r1
	blt _022FB1CC
	cmp r0, #4
	bgt _022FB1CC
	cmp r2, r1
	blt _022FB1CC
	cmp r2, #4
	bgt _022FB1CC
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB194:
	mvn r1, #0xb
	cmp r0, r1
	blt _022FB1CC
	cmp r0, #0xc
	bgt _022FB1CC
	cmp r2, r1
	blt _022FB1CC
	cmp r2, #0xc
	bgt _022FB1CC
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB1CC:
	add r0, sp, #0x7c
	bl sub_020054C0
	strb r0, [sp, #8]
	ldrsb r2, [sp, #8]
	mvn r0, #0
	cmp r2, r0
	beq _022FB264
	ldr r0, [sp, #0x98]
	cmp r0, #0xc
	beq _022FB208
	cmp r0, #0xd
	beq _022FB224
	cmp r0, #0xe
	beq _022FB240
	b _022FB25C
_022FB208:
	mov r6, #0
	mov r0, r5
	mov r1, #3
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB224:
	mov r6, #0
	mov r0, r5
	mov r1, #4
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB240:
	mov r6, #0
	mov r0, r5
	mov r1, #5
	mov r3, #1
	str r6, [sp]
	bl ov11_022FA1DC
	b _022FB264
_022FB25C:
	mov r0, #0
	str r0, [r5, #0x14c]
_022FB264:
	add r0, r5, #0x12c
	bl ov11_022EAF60
	b _022FB864
_022FB270:
	ldr r0, [sp, #0x94]
	ldr r6, [sp, #0x90]
	cmp r0, #0
	ldr r2, [r5, #0x15c]
	ldr r0, [r5, #0x14]
	ldr r3, [sp, #0x8c]
	add r2, r2, r0
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	sub r0, r3, r0, asr #8
	str r0, [sp, #0x74]
	ldr r3, [r5, #0x160]
	ldr r2, [r5, #0x18]
	movne r1, #1
	add r3, r3, r2
	mov r2, r3, asr #7
	add r6, r6, #8
	add r2, r3, r2, lsr #24
	sub r3, r6, r2, asr #8
	moveq r1, #0
	mvn r2, #1
	str r3, [sp, #0x78]
	cmp r0, r2
	and r6, r1, #0xff
	blt _022FB300
	cmp r0, #2
	bgt _022FB300
	cmp r3, r2
	blt _022FB300
	cmp r3, #2
	bgt _022FB300
	mov r1, #0
	add r0, r5, #0x12c
	str r1, [r5, #0x14c]
	bl ov11_022EAF60
	b _022FB864
_022FB300:
	add r0, sp, #0x74
	bl sub_020054C0
	strb r0, [sp, #8]
	ldrsb r2, [sp, #8]
	mvn r0, #0
	cmp r2, r0
	beq _022FB864
	ldr r0, [sp, #0x98]
	cmp r0, #0xf
	beq _022FB33C
	cmp r0, #0x10
	beq _022FB358
	cmp r0, #0x11
	beq _022FB374
	b _022FB390
_022FB33C:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #6
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB358:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #7
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB374:
	mov r7, #0
	mov r0, r5
	mov r3, r6
	mov r1, #8
	str r7, [sp]
	bl ov11_022FA1DC
	b _022FB864
_022FB390:
	mov r0, #0
	str r0, [r5, #0x14c]
	b _022FB864
_022FB39C:
	tst r1, #2
	beq _022FB864
	mov r0, #0
	str r0, [r5, #0x14c]
	add r1, r5, #0x100
	ldr r3, _022FBA18 ; =0x02324CF8
	ldrsh r8, [r1, #0x50]
	ldr r6, [r3]
	mov r2, #0xc
	smlabb r7, r8, r2, r6
	cmp r8, #0
	beq _022FB864
	mov r2, #0x300
	strh r2, [r1, #0x76]
	mov r2, #1
	strh r2, [r1, #0x78]
	ldr r8, [r5, #0x15c]
	ldr r6, [r5, #0x14]
	ldr r2, [r5, #0x160]
	ldr r1, [r5, #0x18]
	add r6, r8, r6
	add r2, r2, r1
	str r6, [sp, #0x3c]
	str r2, [sp, #0x40]
	ldr r1, [r7, #8]
	str r6, [sp, #0x34]
	str r2, [sp, #0x38]
	cmp r1, #0
	bge _022FB42C
	ldr r1, [r3]
	ldr r1, [r1, #0x24]
	cmp r1, #0
	blt _022FB864
	str r1, [r7, #8]
	str r0, [r7]
	str r0, [r7, #4]
_022FB42C:
	ldr sl, [r7]
	mov sb, #1
	ldr lr, _022FBA18 ; =0x02324CF8
	mov fp, #0xc
	b _022FB570
_022FB440:
	ldr ip, [lr]
	ldr r0, [r7, #8]
	add r1, ip, #0x28
	mla r8, r0, fp, r1
	ldr r6, [r8, #4]
	ldr r2, [sp, #0x3c]
	ldr r1, [r8, #8]
	sub r3, r6, r2
	str r3, [sp, #0x44]
	cmp r3, #0
	ldr r0, [sp, #0x40]
	sub r0, r1, r0
	str r0, [sp, #0x48]
	ble _022FB494
	cmp r3, sl
	addgt r0, r2, sl
	strgt r0, [sp, #0x3c]
	movgt sb, #0
	strle r6, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	b _022FB4C4
_022FB494:
	cmp r3, #0
	bge _022FB4C0
	rsb r0, sl, #0
	cmp r3, r0
	sublt r0, r2, sl
	strlt r0, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	movlt sb, #0
	strge r6, [sp, #0x3c]
	rsb r1, r0, #0
	b _022FB4C4
_022FB4C0:
	mov r1, #0
_022FB4C4:
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _022FB4FC
	cmp r0, sl
	ldrgt r0, [sp, #0x40]
	movgt sb, #0
	addgt r0, r0, sl
	strgt r0, [sp, #0x40]
	bgt _022FB530
	ldr r2, [r8, #8]
	cmp r0, r1
	str r2, [sp, #0x40]
	movgt r1, r0
	b _022FB530
_022FB4FC:
	bge _022FB530
	rsb r2, sl, #0
	cmp r0, r2
	ldrlt r0, [sp, #0x40]
	movlt sb, #0
	sublt r0, r0, sl
	strlt r0, [sp, #0x40]
	blt _022FB530
	ldr r3, [r8, #8]
	rsb r2, r1, #0
	cmp r0, r2
	str r3, [sp, #0x40]
	rsblt r1, r0, #0
_022FB530:
	cmp sb, #0
	beq _022FB570
	sub sl, sl, r1
	cmp sl, #0
	movle sb, #0
	ble _022FB570
	ldr r0, [ip, #0x24]
	ldr r1, [r7, #8]
	cmp r1, r0
	moveq sb, #0
	beq _022FB570
	add r0, r1, #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r0, r1, r0, ror #26
	str r0, [r7, #8]
_022FB570:
	cmp sb, #0
	bne _022FB440
	ldr r0, _022FBA18 ; =0x02324CF8
	ldr r3, [r7, #8]
	ldr r1, [r0]
	mov r6, #0
	ldr r0, [r1, #0x24]
	cmp r0, r3
	ble _022FB5BC
	add sb, r3, #1
	mov r2, #0xc
	b _022FB5B0
_022FB5A0:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB5B0:
	cmp sb, r0
	blt _022FB5A0
	b _022FB608
_022FB5BC:
	bge _022FB608
	add sb, r3, #1
	mov r2, #0xc
	b _022FB5DC
_022FB5CC:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB5DC:
	cmp sb, #0x40
	blt _022FB5CC
	mov sb, #0
	mov r2, #0xc
	b _022FB600
_022FB5F0:
	mla r8, sb, r2, r1
	ldr r8, [r8, #0x28]
	add sb, sb, #1
	add r6, r6, r8
_022FB600:
	cmp sb, r0
	blt _022FB5F0
_022FB608:
	ldr r0, _022FBA18 ; =0x02324CF8
	ldr lr, [sp, #0x14]
	ldr r2, [r0]
	ldr ip, [sp, #0x18]
	add r8, r5, #0x100
	add r0, r2, #0x28
	mov r1, #0xc
	mla r0, r3, r1, r0
	ldrsh r3, [r8, #0x50]
	ldr sl, _022FBA20 ; =0x023217EC
	ldr r8, [sp, #0x40]
	mla r2, r3, r1, r2
	ldmib r0, {r1, sb}
	ldr r0, [sp, #0x3c]
	sub r8, sb, r8
	sub r0, r1, r0
	ldr r2, [r2, #-8]
	ldr r1, [sl, r3, lsl #2]
	str r8, [sp, #0x50]
	str lr, [sp, #0x54]
	str r0, [sp, #0x4c]
	str ip, [sp, #0x58]
	add r8, r2, r1
	bl Abs
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x50]
	bl Abs
	ldr r1, [sp, #0x54]
	str r0, [sp, #0x58]
	cmp r1, r0
	movle r1, r0
	add r1, r6, r1
	str r1, [r7, #4]
	cmp r1, r8
	bgt _022FB6A8
	ldr r0, [r7]
	cmp r0, #0
	subgt r0, r0, #0x100
	strgt r0, [r7]
	b _022FB700
_022FB6A8:
	add r0, r5, #0x100
	ldrsh r2, [r0, #0x50]
	mov r0, #0x1800
	mul r0, r2, r0
	cmp r1, r0
	bgt _022FB6D4
	ldr r0, [r7]
	cmp r0, #0x100
	addlt r0, r0, #0x100
	strlt r0, [r7]
	b _022FB700
_022FB6D4:
	ldr r1, _022FBA18 ; =0x02324CF8
	mov r0, #0xc
	ldr r1, [r1]
	mla r0, r2, r0, r1
	ldr r1, [r0, #-0xc]
	ldr r0, [r7]
	cmp r1, #0x100
	movlt r1, #0x100
	cmp r0, r1
	addlt r0, r0, #0x100
	strlt r0, [r7]
_022FB700:
	ldr r2, _022FBA18 ; =0x02324CF8
	ldr r0, [r7, #8]
	ldr r1, [r2]
	ldr r3, [r1, #0x24]
	add r1, r3, #0x40
	sub r0, r1, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r0, r1, r0, ror #26
	cmp r0, #0x3c
	blt _022FB75C
	add r0, r3, #5
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #26
	add r3, r1, r0, ror #26
	str r3, [r7, #8]
	ldr r1, [r2]
	mov r0, #0xc
	mla r0, r3, r0, r1
	ldr r1, [r0, #0x2c]
	ldr r0, [r0, #0x30]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
_022FB75C:
	add r1, sp, #0x3c
	mov r0, r5
	bl ov11_022F9528
	cmp r0, #0
	bne _022FB864
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x38]
	sub r2, r3, r2
	sub r1, r1, r0
	add r0, sp, #0x5c
	str r2, [sp, #0x5c]
	str r1, [sp, #0x60]
	bl sub_020054C0
	add r2, r5, #0x100
	mov r1, r0
	ldrsb r0, [r2, #0x5a]
	bl sub_02005430
	strb r0, [r5, #0x15a]
	ldr r0, [r7]
	cmp r0, #0
	ble _022FB7F4
	mov r0, #4
	str r0, [r5, #0x17c]
	ldr r0, [r7]
	ldr r1, [r5, #0x128]
	cmp r0, #0x200
	movgt r0, #0xa00
	movle r0, #0x800
	mov r0, r0, lsl #0x10
	tst r1, #0x20
	mov r6, r0, asr #0x10
	beq _022FB818
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl ov11_022F872C
	b _022FB818
_022FB7F4:
	mov r0, #0
	str r0, [r5, #0x17c]
	ldr r0, [r5, #0x128]
	ldr r6, _022FBA24 ; =0x00000807
	tst r0, #0x20
	beq _022FB818
	ldrsh r0, [r5]
	mov r1, #0x1000000
	bl ov11_022F872C
_022FB818:
	ldrb r0, [r5, #0x174]
	cmp r0, #0
	addeq r0, r5, #0x100
	ldreqsh r1, [r0, #0x80]
	cmpeq r6, r1
	ldreqsb r1, [r0, #0x75]
	ldreqsb r0, [r0, #0x5a]
	cmpeq r1, r0
	beq _022FB864
	mov r0, #0
	strb r0, [r5, #0x174]
	add r2, r5, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r5, #0x18c
	strb r1, [r5, #0x175]
	strh r6, [r2, #0x80]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl ov11_022F52E8
_022FB864:
	ldrb r0, [r5, #0x174]
	cmp r0, #0
	beq _022FB894
	mov r0, #0
	strb r0, [r5, #0x174]
	add r2, r5, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r5, #0x18c
	strb r1, [r5, #0x175]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl ov11_022F52E8
_022FB894:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x18
	add r5, r5, #0x250
	blt _022FAED4
	ldr r7, _022FBA18 ; =0x02324CF8
	mov r2, #0
	ldr r5, [r7]
	ldr r1, [r7, #4]
	sub r0, r2, #1
	str r2, [r5]
	str r2, [r5, #4]
	ldrsh r3, [r1, #2]
	cmp r3, r0
	bne _022FB8DC
	bl ov11_022FBA28
	b _022FBA10
_022FB8DC:
	ldr r0, [r1, #0x128]
	tst r0, #2
	beq _022FBA0C
	ldr r0, [r7]
	ldr r6, [r0, #0x24]
	cmp r6, #0
	bge _022FB948
	str r2, [r0, #0x24]
	str r2, [r0, #0x28]
	ldr r4, [r1, #0x15c]
	ldr r3, [r1, #0x14]
	add r3, r4, r3
	str r3, [r0, #0x2c]
	ldr r3, [r1, #0x160]
	ldr r1, [r1, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x30]
	ldr r1, [r7]
	mov r0, r2
_022FB928:
	str r0, [r1, #8]
	str r0, [r1]
	add r2, r2, #1
	str r0, [r1, #4]
	cmp r2, #3
	add r1, r1, #0xc
	blt _022FB928
	b _022FBA10
_022FB948:
	add r2, r6, #1
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #26
	add r2, r3, r2, ror #26
	str r2, [r0, #0x24]
	ldr r3, [r7]
	mov r0, #0xc
	ldr r2, [r3, #0x24]
	add r3, r3, #0x28
	mla r4, r2, r0, r3
	ldr r8, [r1, #0x15c]
	ldr r3, [r1, #0x14]
	ldr r2, _022FBA1C ; =0x02321684
	add r3, r8, r3
	str r3, [r4, #4]
	ldr r3, [r1, #0x160]
	ldr r1, [r1, #0x18]
	add r1, r3, r1
	str r1, [r4, #8]
	ldr r1, [r7]
	ldr r3, [r2, #0x18]
	add r1, r1, #0x28
	mla r7, r6, r0, r1
	ldr r1, [r2, #0x1c]
	ldr r0, [r7, #8]
	ldr r2, [r4, #8]
	ldr r8, [r4, #4]
	sub r2, r2, r0
	ldr r7, [r7, #4]
	str r2, [sp, #0x70]
	sub r0, r8, r7
	str r3, [sp, #0x64]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x68]
	bl Abs
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x70]
	bl Abs
	ldr r1, [sp, #0x64]
	str r0, [sp, #0x68]
	cmp r1, r0
	movle r1, r0
	cmp r1, #0
	ldrle r0, _022FBA18 ; =0x02324CF8
	str r1, [r4]
	ldrle r0, [r0]
	strle r6, [r0, #0x24]
	strgt r1, [r5]
	b _022FBA10
_022FBA0C:
	bl ov11_022FBA28
_022FBA10:
	add sp, sp, #0x9c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBA18: .word 0x02324CF8
_022FBA1C: .word 0x02321684
_022FBA20: .word 0x023217EC
_022FBA24: .word 0x00000807
	arm_func_end ov11_022FAE58

	arm_func_start ov11_022FBA28
ov11_022FBA28: ; 0x022FBA28
	ldr r0, _022FBA64 ; =0x02324CF8
	mvn r2, #0
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0x24]
	ldr r1, [r0]
	mov r0, r3
_022FBA44:
	str r2, [r1, #8]
	str r0, [r1]
	add r3, r3, #1
	str r0, [r1, #4]
	cmp r3, #3
	add r1, r1, #0xc
	blt _022FBA44
	bx lr
	.align 2, 0
_022FBA64: .word 0x02324CF8
	arm_func_end ov11_022FBA28

	arm_func_start ov11_022FBA68
ov11_022FBA68: ; 0x022FBA68
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FBBC0 ; =0x02321684
	ldr r1, _022FBBC4 ; =0x02324CF8
	ldr r8, [r0, #0x48]
	ldr r7, [r0, #0x4c]
	mov sb, #0
	ldr sl, [r1, #4]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FBA98:
	ldrsh r0, [sl, #2]
	cmp r0, r4
	ldrneb r0, [sl, #4]
	cmpne r0, #0
	beq _022FBBA0
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r1, [sl, #0x15c]
	ldr r0, [sl, #0x14]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [sl, #0x160]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sl, #0x17c]
	ldr r6, [sl, #0x16c]
	cmp r0, #0
	ldr r5, [sl, #0x170]
	ble _022FBB20
	sub r0, r0, #1
	str r0, [sl, #0x17c]
	arm_func_end ov11_022FBA68

	arm_func_start ov11_022FBAF0
ov11_022FBAF0: ; 0x022FBAF0
	cmp r0, #0
	bgt _022FBB20
	add r0, sl, #0x100
	ldrh r1, [r0, #0x78]
	add r0, r1, #0xff
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022FBB20
	mov r0, sl
	bl ov11_022F93C8
_022FBB20:
	add r0, sl, #0x200
	ldrsh r1, [r0, #0x1e]
	cmp r1, #0
	bge _022FBB54
	ldrsh r0, [r0, #0x18]
	cmp r0, #0
	ble _022FBB54
	strb fp, [sl, #0x174]
	add r0, sl, #0x100
	ldrsh r1, [r0, #0x80]
	ldrsb r2, [r0, #0x75]
	add r0, sl, #0x18c
	bl ov11_022F52E8
_022FBB54:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x82]
	cmp r1, r4
	beq _022FBB8C
	ldr r2, [sl, #0x188]
	add r0, sl, #0x18c
	str r2, [sp]
	ldrsh r2, [r3, #0x84]
	ldrsb r3, [r3, #0x5a]
	bl ov11_022F5C48
	add r1, sl, #0x100
	strh r4, [r1, #0x82]
	mov r0, #0
	strh r0, [r1, #0x84]
_022FBB8C:
	ldrsh r1, [sl, #0xa]
	add r2, sp, #0xc
	add r0, sl, #0x18c
	add r3, r6, r5
	bl ov11_022F5C94
_022FBBA0:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x18
	add sl, sl, #0x250
	blt _022FBA98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBBC0: .word 0x02321684
_022FBBC4: .word 0x02324CF8
	arm_func_end ov11_022FBAF0

	arm_func_start ov11_022FBBC8
ov11_022FBBC8: ; 0x022FBBC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl ov11_022EB3C8
	ldr r1, [sp]
	ldr r0, [r5]
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	add r0, r1, r0
	str r0, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022FBBC8

	arm_func_start ov11_022FBC0C
ov11_022FBC0C: ; 0x022FBC0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr sb, _022FBDB8 ; =0x02324CF8
	ldmia r1, {r2, r3}
	add r7, r3, #8
	ldr r8, [sb]
	sub r6, r2, #0xc
	add r3, r2, #0xc
	add r1, r7, #0x14
	ldr fp, [r8, #0x32c]
	mov ip, r6, lsl #8
	sub r4, r7, #4
	mov r6, r4, lsl #8
	mov r3, r3, lsl #8
	mov lr, r1, lsl #8
	mov r5, #0
	str ip, [sp, #0x10]
	str r3, [sp, #8]
	str r6, [sp, #0x14]
	str lr, [sp, #0xc]
	str r5, [sp, #4]
	str r2, [sp, #0x18]
	ldr r2, [sb, #4]
	mov r4, r0
	mov r1, r5
	str r7, [sp, #0x1c]
	add r8, r8, #0x300
	mvn sb, #0
	b _022FBD1C
_022FBC80:
	ldrsh r0, [r2, #2]
	cmp r0, sb
	beq _022FBD0C
	ldr sl, [r2, #0x15c]
	cmp sl, r3
	bge _022FBD0C
	ldr sl, [r2, #0x164]
	cmp sl, ip
	ble _022FBD0C
	ldr sl, [r2, #0x160]
	cmp sl, lr
	bge _022FBD0C
	ldr sl, [r2, #0x168]
	cmp sl, r6
	ble _022FBD0C
	ldrsh sl, [r8, #0x28]
	cmp r1, sl
	moveq r5, #1
	beq _022FBD0C
	cmp r0, #0xd
	moveq r0, #1
	streq r0, [sp, #4]
	beq _022FBD0C
	ldr r0, [r2, #0x128]
	tst r0, #0x2000
	beq _022FBD0C
	add r2, sp, #8
	str r2, [sp]
	add r3, sp, #0x10
	mov r0, fp
	mvn r2, #0
	bl ov11_022F9F90
	strb r0, [r4]
	mov r0, #0
	b _022FBDB0
_022FBD0C:
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r2, r2, #0x250
_022FBD1C:
	cmp r1, #0x18
	blt _022FBC80
	ldr r0, [sp, #0x18]
	sub r1, r7, #6
	sub r3, r0, #6
	mov r6, r1, lsl #8
	add r2, r0, #6
	add r0, r7, #6
	mov r8, r3, lsl #8
	mov r7, r2, lsl #8
	mov r3, r0, lsl #8
	add r1, sp, #0x10
	add r2, sp, #8
	mov r0, #0x2000
	str r8, [sp, #0x10]
	str r7, [sp, #8]
	str r6, [sp, #0x14]
	str r3, [sp, #0xc]
	bl ov11_022FCDB0
	movs r2, r0
	bmi _022FBD94
	add r1, sp, #8
	str r1, [sp]
	add r3, sp, #0x10
	mov r0, fp
	mvn r1, #0
	bl ov11_022F9F90
	strb r0, [r4]
	mov r0, #1
	b _022FBDB0
_022FBD94:
	cmp r5, #0
	movne r0, #2
	bne _022FBDB0
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #3
	mvneq r0, #0
_022FBDB0:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FBDB8: .word 0x02324CF8
	arm_func_end ov11_022FBC0C

	arm_func_start ov11_022FBDBC
ov11_022FBDBC: ; 0x022FBDBC
	stmdb sp!, {r3, lr}
	mov r0, #0x2180
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FBE00 ; =0x02324D00
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FBDDC:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #6]
	cmp r3, #0x10
	add r0, r0, #0x218
	blt _022FBDDC
	bl ov11_022FBE04
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE00: .word 0x02324D00
	arm_func_end ov11_022FBDBC

	arm_func_start ov11_022FBE04
ov11_022FBE04: ; 0x022FBE04
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FBE48 ; =0x02324D00
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FBE18:
	ldrsh r0, [r6, #6]
	cmp r0, r4
	beq _022FBE2C
	mov r0, r5
	bl ov11_022FC44C
_022FBE2C:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x10
	add r6, r6, #0x218
	blt _022FBE18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FBE48: .word 0x02324D00
	arm_func_end ov11_022FBE04

	arm_func_start ov11_022FBE4C
ov11_022FBE4C: ; 0x022FBE4C
	stmdb sp!, {r3, lr}
	bl ov11_022FBE04
	ldr r0, _022FBE70 ; =0x02324D00
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FBE70 ; =0x02324D00
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE70: .word 0x02324D00
	arm_func_end ov11_022FBE4C

	arm_func_start ov11_022FBE74
ov11_022FBE74: ; 0x022FBE74
	mvn r1, #0
	cmp r0, r1
	beq _022FBEB8
	ldr r1, _022FBEC0 ; =0x02324D00
	mov r3, #0
	ldr r2, [r1]
	b _022FBEB0
_022FBE90:
	ldrsh r1, [r2, #6]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r2, r2, #0x218
_022FBEB0:
	cmp r3, #0x10
	blt _022FBE90
_022FBEB8:
	mvn r0, #0
	bx lr
	.align 2, 0
_022FBEC0: .word 0x02324D00
	arm_func_end ov11_022FBE74

	arm_func_start ov11_022FBEC4
ov11_022FBEC4: ; 0x022FBEC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrsh r4, [r8]
	ldr r5, _022FC2C0 ; =0x0231EE54
	mov r1, #0xc
	mov sb, r0
	smlabb r5, r4, r1, r5
	mov r7, r2
	mov sl, r3
	cmp sb, #0
	bge _022FBF58
	cmp r4, #5
	bne _022FBF08
	mov r0, r4
	bl ov11_022FBE74
	mov sb, r0
_022FBF08:
	cmp sb, #0
	bge _022FBF4C
	ldr r0, _022FC2C4 ; =0x02324D00
	mov r3, #0
	ldr r2, [r0]
	mvn r1, #0
	b _022FBF44
_022FBF24:
	ldrsh r0, [r2, #6]
	cmp r0, r1
	moveq sb, r3
	beq _022FBF4C
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x218
_022FBF44:
	cmp r3, #0x10
	blt _022FBF24
_022FBF4C:
	cmp sb, #0
	mvnlt r0, #0
	blt _022FC2B8
_022FBF58:
	ldr r0, _022FC2C4 ; =0x02324D00
	ldrh r1, [r8]
	ldr r2, [r0]
	mov r0, #0x218
	str r1, [sp]
	ldrsh r1, [r5]
	smlabb r6, sb, r0, r2
	stmib sp, {r1, r7}
	ldr r1, _022FC2C8 ; =0x02321E4C
	mov r2, sb
	mov r3, r4
	str sl, [sp, #0xc]
	mov r0, #1
	bl DebugPrint
	ldrsh r1, [r6, #6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	ands fp, r0, #0xff
	beq _022FBFBC
	mov r1, #0
	add r0, r6, #0x154
	strb r1, [r6, #8]
	bl ov11_022F4A14
_022FBFBC:
	sub r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	strh sb, [r6, #4]
	mov r0, r0, lsr #0x10
	cmp r0, #1
	strh r4, [r6, #6]
	strlsh r7, [r6, #0xa]
	strlsb sl, [r6, #0xc]
	mvnls r0, #0
	strlsb r0, [r6, #0xd]
	bls _022FC004
	cmp fp, #0
	mvnne r0, #0
	strneh r0, [r6, #0xa]
	strneb r0, [r6, #0xc]
	strb sl, [r6, #0xd]
_022FC004:
	ldrsh r0, [r5]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _022FC100
_022FC014: ; jump table
	b _022FC100 ; case 0
	b _022FC058 ; case 1
	b _022FC0F4 ; case 2
	b _022FC0B8 ; case 3
	b _022FC0C4 ; case 4
	b _022FC0C4 ; case 5
	b _022FC0D0 ; case 6
	b _022FC0DC ; case 7
	b _022FC0E8 ; case 8
	b _022FC0AC ; case 9
	b _022FC064 ; case 10
	b _022FC058 ; case 11
	b _022FC070 ; case 12
	b _022FC0A0 ; case 13
	b _022FC094 ; case 14
	b _022FC088 ; case 15
	b _022FC07C ; case 16
_022FC058:
	mov r0, #0
	str r0, [r6, #0x12c]
	b _022FC108
_022FC064:
	mov r0, #0x20000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC070:
	mov r0, #0x40000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC07C:
	mov r0, #0x20000000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC088:
	mov r0, #0x20c0000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC094:
	mov r0, #0x20c0000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0A0:
	mov r0, #0x10000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0AC:
	mov r0, #0x140
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0B8:
	ldr r0, _022FC2CC ; =0x02006100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0C4:
	mov r0, #0x6100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0D0:
	mov r0, #0x1100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0DC:
	mov r0, #0x2100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0E8:
	mov r0, #0x6000
	str r0, [r6, #0x12c]
	b _022FC108
_022FC0F4:
	ldr r0, _022FC2D0 ; =0x02003100
	str r0, [r6, #0x12c]
	b _022FC108
_022FC100:
	ldr r0, _022FC2D4 ; =0x02006140
	str r0, [r6, #0x12c]
_022FC108:
	ldrb r0, [r5, #8]
	cmp r0, #0
	ldrne r0, [r6, #0x12c]
	orrne r0, r0, #0x80000000
	strne r0, [r6, #0x12c]
	ldrb r0, [r5, #2]
	cmp r0, #0
	ldreqb r0, [r8, #3]
	moveq r0, r0, lsl #0xb
	streq r0, [r6, #0x10]
	ldreqb r0, [r8, #4]
	movne r0, r0, lsl #0xb
	strne r0, [r6, #0x10]
	ldrneb r0, [r5, #3]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x14]
	ldr r0, [r6, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x14]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r6, #0x1c]
	ldrsb r0, [r8, #2]
	strb r0, [r6, #0x20]
	ldrb r0, [r8, #7]
	tst r0, #4
	bne _022FC19C
	ldrb r0, [r8, #5]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x24]
	ldrb r0, [r8, #7]
	tst r0, #2
	ldrne r0, [r6, #0x24]
	addne r0, r0, #0x400
	strne r0, [r6, #0x24]
_022FC19C:
	ldrb r0, [r8, #8]
	tst r0, #4
	bne _022FC1C8
	ldrb r0, [r8, #6]
	mov r0, r0, lsl #0xb
	str r0, [r6, #0x28]
	ldrb r0, [r8, #8]
	tst r0, #2
	ldrne r0, [r6, #0x28]
	addne r0, r0, #0x400
	strne r0, [r6, #0x28]
_022FC1C8:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	ldrne r0, [r6, #0x12c]
	orrne r0, r0, #0x800000
	strne r0, [r6, #0x12c]
	cmp fp, #0
	beq _022FC2A0
	ldrsb r0, [r6, #0x20]
	mov r2, #0
	strb r0, [r6, #0x130]
	ldr r3, [r6, #0x24]
	ldr r1, [r6, #0x18]
	add r0, r6, #0x2c
	sub r1, r3, r1
	str r1, [r6, #0x134]
	ldr r4, [r6, #0x24]
	ldr r3, [r6, #0x18]
	add r1, r6, #0x34
	add r3, r4, r3
	str r3, [r6, #0x13c]
	ldr r4, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	sub r3, r4, r3
	str r3, [r6, #0x138]
	ldr r4, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	add r3, r4, r3
	str r3, [r6, #0x140]
	str r2, [r6, #0x148]
	str r2, [r6, #0x144]
	bl ov11_022F1F08
	add r0, r6, #0x100
	mov r2, #0x800
	mov r1, #1
	strh r2, [r0, #0x4e]
	strb r1, [r6, #0x14c]
	sub r1, r1, #2
	strh r1, [r0, #0x50]
	mov r1, #0
	strh r1, [r0, #0x52]
	ldrsh r1, [r6, #6]
	ldr r2, [r6, #0x12c]
	add r0, r6, #0x154
	bl ov11_022F6E60
	ldr r1, _022FC2D8 ; =0x02321DFC
	mov r2, r6
	add r0, r6, #0x3c
	bl ov11_022DC8E8
	ldrsh r0, [r5]
	cmp r0, #0x10
	bne _022FC2A0
	add r0, r6, #0x154
	mov r1, #0
	bl ov11_022F4974
_022FC2A0:
	ldrsh r2, [r8, #0xa]
	add r0, r6, #0x100
	mov r1, #1
	strh r2, [r0, #0x28]
	mov r0, sb
	strb r1, [r6, #8]
_022FC2B8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC2C0: .word 0x0231EE54
_022FC2C4: .word 0x02324D00
_022FC2C8: .word 0x02321E4C
_022FC2CC: .word 0x02006100
_022FC2D0: .word 0x02003100
_022FC2D4: .word 0x02006140
_022FC2D8: .word 0x02321DFC
	arm_func_end ov11_022FBEC4

	arm_func_start ov11_022FC2DC
ov11_022FC2DC: ; 0x022FC2DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FC43C ; =0x02321E98
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FC3A4
	ldr r0, _022FC440 ; =0x02324D00
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FC444 ; =0x02321EC4
	add r5, r4, #1
	mov r6, #1
_022FC338:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FC388
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FC388
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FC388
	mov r0, r8
	bl ov11_022FC44C
_022FC388:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x218
	blt _022FC338
	b _022FC434
_022FC3A4:
	ldr r0, _022FC440 ; =0x02324D00
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022FC3C0:
	ldrsh r3, [sl, #6]
	cmp r3, r7
	beq _022FC41C
	ldrsb ip, [sl, #0xd]
	ldr r1, _022FC448 ; =0x02321EF0
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl DebugPrint
	ldrsb r0, [sl, #0xd]
	cmp r0, r6
	beq _022FC408
	cmp sb, r5
	cmpne sb, r0
	bne _022FC41C
	mov r0, r8
	bl ov11_022FC44C
	b _022FC41C
_022FC408:
	ldrsh r0, [sl, #0xa]
	cmp r0, r4
	bne _022FC41C
	mov r0, r8
	bl ov11_022FC44C
_022FC41C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x218
	blt _022FC3C0
_022FC434:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC43C: .word 0x02321E98
_022FC440: .word 0x02324D00
_022FC444: .word 0x02321EC4
_022FC448: .word 0x02321EF0
	arm_func_end ov11_022FC2DC

	arm_func_start ov11_022FC44C
ov11_022FC44C: ; 0x022FC44C
	stmdb sp!, {r4, lr}
	ldr r1, _022FC48C ; =0x02324D00
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x218
	smlabb r4, r2, r0, r1
	ldr r1, _022FC490 ; =0x02321F10
	mov r0, #1
	bl DebugPrint
	add r0, r4, #0x154
	bl ov11_022F6EFC
	add r0, r4, #0x3c
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FC48C: .word 0x02324D00
_022FC490: .word 0x02321F10
	arm_func_end ov11_022FC44C

	arm_func_start ov11_022FC494
ov11_022FC494: ; 0x022FC494
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FC5EC ; =0x02321F2C
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FC564
	ldr r0, _022FC5F0 ; =0x02324D00
	mvn r5, #0
	ldr r7, [r0]
	ldr fp, _022FC5F4 ; =0x02321EC4
	sub r4, r5, #1
	mov r6, #1
_022FC4F0:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FC548
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FC548
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FC548
	mov r1, #0
	add r0, r7, #0x3c
	bl ov11_022DCFC4
	strh r5, [r7, #0xa]
_022FC548:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x218
	blt _022FC4F0
	b _022FC5E4
_022FC564:
	ldr r0, _022FC5F0 ; =0x02324D00
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0]
	ldr r6, _022FC5F4 ; =0x02321EC4
	sub r4, r5, #1
	mov fp, r7
_022FC580:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FC5CC
	ldrsh r2, [sl, #0xa]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	cmp sb, r4
	ldrnesb r0, [sl, #0xd]
	cmpne sb, r0
	bne _022FC5CC
	mov r1, fp
	add r0, sl, #0x3c
	bl ov11_022DCFC4
	strb r5, [sl, #0xd]
_022FC5CC:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x218
	blt _022FC580
_022FC5E4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC5EC: .word 0x02321F2C
_022FC5F0: .word 0x02324D00
_022FC5F4: .word 0x02321EC4
	arm_func_end ov11_022FC494

	arm_func_start ov11_022FC5F8
ov11_022FC5F8: ; 0x022FC5F8
	stmdb sp!, {r3, lr}
	ldr r3, _022FC634 ; =0x02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x12c]
	add r0, ip, #0x154
	orr r1, r2, r1
	str r1, [ip, #0x12c]
	bl ov11_022F495C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FC634: .word 0x02324D00
	arm_func_end ov11_022FC5F8

	arm_func_start ov11_022FC638
ov11_022FC638: ; 0x022FC638
	stmdb sp!, {r3, lr}
	ldr r3, _022FC678 ; =0x02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x12c]
	eor r0, r1, r3
	and r1, r2, r0
	add r0, ip, #0x154
	str r1, [ip, #0x12c]
	bl ov11_022F495C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FC678: .word 0x02324D00
	arm_func_end ov11_022FC638

	arm_func_start ov11_022FC67C
ov11_022FC67C: ; 0x022FC67C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FC6D8
	ldr r0, _022FC6E0 ; =0x02324D00
	mov r6, #0
	ldr r5, [r0]
	b _022FC6D0
_022FC6A0:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FC6C0
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FC6C0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x218
_022FC6D0:
	cmp r6, #0x10
	blt _022FC6A0
_022FC6D8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FC6E0: .word 0x02324D00
	arm_func_end ov11_022FC67C

	arm_func_start ov11_022FC6E4
ov11_022FC6E4: ; 0x022FC6E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FC740
	ldr r0, _022FC748 ; =0x02324D00
	mov r6, #0
	ldr r5, [r0]
	b _022FC738
_022FC708:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FC728
	add r0, r5, #0x3c
	bl ov11_022DC9A0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FC728:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x218
_022FC738:
	cmp r6, #0x10
	blt _022FC708
_022FC740:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FC748: .word 0x02324D00
	arm_func_end ov11_022FC6E4

	arm_func_start ov11_022FC74C
ov11_022FC74C: ; 0x022FC74C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0
	sub r3, r0, #1
	mov r8, r1
	mov r7, r2
	cmp sb, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _022FC7B8 ; =0x02324D00
	mov r6, r0
	ldr r5, [r1]
	mov r4, #1
_022FC77C:
	ldrsh r1, [r5, #6]
	cmp r1, sb
	bne _022FC79C
	mov r1, r8
	mov r2, r7
	add r0, r5, #0x3c
	bl ov11_022DCCEC
	mov r0, r4
_022FC79C:
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r6, r1, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x218
	blt _022FC77C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC7B8: .word 0x02324D00
	arm_func_end ov11_022FC74C

	arm_func_start ov11_022FC7BC
ov11_022FC7BC: ; 0x022FC7BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	mov sb, r0
	sub r0, r7, #2
	mov r8, r1
	cmp sb, r0
	beq _022FC830
	ldr r0, _022FC838 ; =0x02324D00
	mov r6, #0
	ldr r5, [r0]
	mov r4, r6
_022FC7E8:
	ldrsh r0, [r5, #6]
	cmp r0, sb
	bne _022FC818
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	beq _022FC818
	mov r1, r8
	add r0, r5, #0x3c
	bl ov11_022DCA58
	cmp r0, #0
	moveq r7, r4
_022FC818:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x218
	blt _022FC7E8
_022FC830:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC838: .word 0x02324D00
	arm_func_end ov11_022FC7BC

	arm_func_start ov11_022FC83C
ov11_022FC83C: ; 0x022FC83C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022FC8BC ; =0x02324D00
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x218
	smlabb r4, r2, r0, r1
	ldrsh r3, [r4, #0xa]
	add r0, r4, #0x100
	ldr r1, _022FC8C0 ; =0x02321F58
	str r3, [sp]
	ldrsh r3, [r0, #0x28]
	mov r0, #1
	str r3, [sp, #4]
	ldrsh r3, [r4, #6]
	bl DebugPrint
	ldrsh r1, [r4, #6]
	mvn r0, #0
	cmp r1, r0
	addne r1, r4, #0x100
	ldrnesh r1, [r1, #0x28]
	cmpne r1, r0
	moveq r0, #0
	beq _022FC8B4
	bl ScriptSpecialProcess0x3E
	add r1, r4, #0x100
	ldrsh r0, [r4, #0xa]
	ldrsh r1, [r1, #0x28]
	bl ov11_022F74A0
	mov r0, #1
_022FC8B4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FC8BC: .word 0x02324D00
_022FC8C0: .word 0x02321F58
	arm_func_end ov11_022FC83C

	arm_func_start ov11_022FC8C4
ov11_022FC8C4: ; 0x022FC8C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FC9D4
	ldr r1, _022FCA8C ; =0x02321FA0
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FCA90 ; =0x02324D00
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, r8
_022FC920:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FC9B8
	ldrsh r0, [r6, #0xa]
	cmp r0, sl
	bne _022FC9B8
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne r0, sb
	bne _022FC9B8
	ldr r1, _022FCA94 ; =0x02321FE0
	mov r0, #1
	mov r2, r7
	bl DebugPrint
	str sb, [sp]
	ldrsh r2, [r6, #6]
	add r0, sp, #4
	mov r1, #4
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FC9B8
	add r0, r6, #0x3c
	add r1, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022FC9B8
	add r0, r6, #0x2c
	add r1, r6, #0x34
	bl ov11_022F1F08
	add r0, r6, #0x3c
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x14c]
_022FC9B8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x218
	blt _022FC920
	b _022FCA80
_022FC9D4:
	ldr r1, _022FCA98 ; =0x02321FF4
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FCA90 ; =0x02324D00
	mvn r4, #1
	ldr r7, [r0]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022FC9FC:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FCA68
	cmp sb, r4
	ldrnesb r0, [r7, #0xd]
	cmpne r0, sb
	bne _022FCA68
	ldr r1, _022FCA94 ; =0x02321FE0
	mov r0, #1
	mov r2, r6
	bl DebugPrint
	str sb, [sp]
	ldrsh r2, [r7, #6]
	add r0, sp, #4
	mov r1, #4
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FCA68
	add r0, r7, #0x3c
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x14c]
_022FCA68:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x218
	blt _022FC9FC
_022FCA80:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCA8C: .word 0x02321FA0
_022FCA90: .word 0x02324D00
_022FCA94: .word 0x02321FE0
_022FCA98: .word 0x02321FF4
	arm_func_end ov11_022FC8C4

	arm_func_start ov11_022FCA9C
ov11_022FCA9C: ; 0x022FCA9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FCB54
	ldr r1, _022FCBE0 ; =0x02322034
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FCBE4 ; =0x02324D00
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022FCAF4:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FCB38
	ldrsh r0, [r6, #0xa]
	cmp sl, r0
	bne _022FCB38
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne sb, r0
	bne _022FCB38
	ldr r1, _022FCBE8 ; =0x02321FE0
	mov r0, fp
	mov r2, r7
	bl DebugPrint
	add r0, r6, #0x3c
	bl ov11_022DCAE0
	orr r8, r8, r0
_022FCB38:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x218
	blt _022FCAF4
	b _022FCBD8
_022FCB54:
	ldr r1, _022FCBEC ; =0x02322074
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FCBE4 ; =0x02324D00
	mvn r5, #0
	ldr sl, [r0]
	ldr fp, _022FCBE8 ; =0x02321FE0
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022FCB80:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FCBC0
	ldrsb r0, [sl, #0xd]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022FCBC0
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl DebugPrint
	add r0, sl, #0x3c
	bl ov11_022DD080
	strb r5, [sl, #0xd]
	orr r8, r8, r0
_022FCBC0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add sl, sl, #0x218
	blt _022FCB80
_022FCBD8:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCBE0: .word 0x02322034
_022FCBE4: .word 0x02324D00
_022FCBE8: .word 0x02321FE0
_022FCBEC: .word 0x02322074
	arm_func_end ov11_022FCA9C

	arm_func_start ov11_022FCBF0
ov11_022FCBF0: ; 0x022FCBF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FCC40 ; =0x02324D00
	mov r4, #0
	ldr r7, [r0]
	mov r6, r4
	mvn r5, #0
_022FCC08:
	ldrsh r0, [r7, #6]
	cmp r0, r5
	beq _022FCC20
	add r0, r7, #0x3c
	bl ov11_022DCB00
	orr r4, r4, r0
_022FCC20:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x218
	blt _022FCC08
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FCC40: .word 0x02324D00
	arm_func_end ov11_022FCBF0

	arm_func_start ov11_022FCC44
ov11_022FCC44: ; 0x022FCC44
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022FCC9C ; =0x02324D00
	mov r5, #0
	ldr r4, [r1]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022FCC60:
	ldrsh r0, [r4, #6]
	cmp r0, r7
	beq _022FCC7C
	mov r1, r6
	add r0, r4, #0x3c
	bl ov11_022DD0EC
	orr r5, r5, r0
_022FCC7C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r4, r4, #0x218
	blt _022FCC60
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FCC9C: .word 0x02324D00
	arm_func_end ov11_022FCC44

	arm_func_start ov11_022FCCA0
ov11_022FCCA0: ; 0x022FCCA0
	ldr r3, _022FCCC0 ; =0x02324D00
	mov r2, #0x218
	ldr r3, [r3]
	smlabb r2, r0, r2, r3
	ldr r0, [r2, #0x12c]
	str r0, [r1]
	ldrsh r0, [r2, #6]
	bx lr
	.align 2, 0
_022FCCC0: .word 0x02324D00
	arm_func_end ov11_022FCCA0

	arm_func_start ov11_022FCCC4
ov11_022FCCC4: ; 0x022FCCC4
	ldr r3, _022FCD14 ; =0x02324D00
	mov r2, #0x218
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022FCD08
	ldr r2, [ip, #0x134]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x138]
	ldr r0, [ip, #0x1c]
	add r0, r2, r0
_022FCD08:
	str r0, [r1, #4]
	ldrsh r0, [ip, #6]
	bx lr
	.align 2, 0
_022FCD14: .word 0x02324D00
	arm_func_end ov11_022FCCC4

	arm_func_start ov11_022FCD18
ov11_022FCD18: ; 0x022FCD18
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FCDAC ; =0x02324D00
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FCD9C
_022FCD30:
	ldrsh r4, [ip, #6]
	cmp r4, lr
	beq _022FCD8C
	ldr r4, [ip, #0x12c]
	tst r4, r0
	beq _022FCD8C
	ldr r5, [ip, #0x134]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FCD8C
	ldr r5, [ip, #0x13c]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FCD8C
	ldr r5, [ip, #0x138]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FCD8C
	ldr r5, [ip, #0x140]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FCD8C:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x218
_022FCD9C:
	cmp r3, #0x10
	blt _022FCD30
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FCDAC: .word 0x02324D00
	arm_func_end ov11_022FCD18

	arm_func_start ov11_022FCDB0
ov11_022FCDB0: ; 0x022FCDB0
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FCE44 ; =0x02324D00
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FCE34
_022FCDC8:
	ldrsh r4, [ip, #6]
	cmp r4, lr
	beq _022FCE24
	ldr r4, [ip, #0x12c]
	tst r4, r0
	beq _022FCE24
	ldr r5, [ip, #0x134]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FCE24
	ldr r5, [ip, #0x13c]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FCE24
	ldr r5, [ip, #0x138]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FCE24
	ldr r5, [ip, #0x140]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FCE24:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x218
_022FCE34:
	cmp r3, #0x10
	blt _022FCDC8
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FCE44: .word 0x02324D00
	arm_func_end ov11_022FCDB0

	arm_func_start ov11_022FCE48
ov11_022FCE48: ; 0x022FCE48
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, _022FCF6C ; =0x02321D88
	mov r5, r1
	ldr r1, [r3, #0xc]
	ldr r3, [r3, #8]
	str r1, [sp, #0x14]
	str r3, [sp, #0x10]
	ldr r1, [r5]
	mov r6, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r1, r0, asr #3
	mov r0, r1, asr #7
	add r1, r1, r0, lsr #24
	mov r0, r1, asr #8
	str r0, [sp, #0x10]
	ldr r3, [r5, #4]
	mov r4, r2
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	mov r2, r0, asr #3
	mov r0, r2, asr #7
	add r2, r2, r0, lsr #24
	mov r0, r2, asr #8
	str r0, [sp, #0x14]
	ldr r3, [r4]
	ldr r0, [r4, #4]
	sub lr, r3, #1
	sub ip, r0, #1
	mov r0, lr, asr #2
	mov r3, ip, asr #2
	add r0, lr, r0, lsr #29
	add r3, ip, r3, lsr #29
	mov lr, r0, asr #3
	mov ip, r3, asr #3
	mov r0, lr, asr #7
	mov r3, ip, asr #7
	add r0, lr, r0, lsr #24
	mov r0, r0, asr #8
	add r3, ip, r3, lsr #24
	mov ip, r3, asr #8
	sub r3, r0, r1, asr #8
	sub r1, ip, r2, asr #8
	add r2, r3, #1
	add r1, r1, #1
	str r0, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	ldr r1, [r6, #0x12c]
	str ip, [sp, #0xc]
	tst r1, #0x40
	add r0, sp, #0x10
	add r1, sp, #0
	beq _022FCF34
	bl ov11_022F204C
	cmp r0, #0
	movne r0, #0x40
	bne _022FCF64
_022FCF34:
	ldr r0, [r6, #0x12c]
	tst r0, #0x100
	beq _022FCF60
	mov r2, r5
	mov r3, r4
	mvn r0, #0
	mov r1, #0x100
	bl ov11_022F9180
	cmp r0, #0
	movge r0, #0x100
	bge _022FCF64
_022FCF60:
	mov r0, #0
_022FCF64:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FCF6C: .word 0x02321D88
	arm_func_end ov11_022FCE48

	arm_func_start ov11_022FCF70
ov11_022FCF70: ; 0x022FCF70
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r5, _022FD05C ; =0x02321D88
	mov r4, r0
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x30]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	ldr r3, [r1]
	ldr r2, [r4, #0x18]
	add lr, sp, #8
	sub ip, r3, r2
	str ip, [sp, #8]
	ldr r6, [r1, #4]
	ldr r3, [r4, #0x1c]
	add r2, sp, #0
	sub r3, r6, r3
	str r3, [sp, #0xc]
	ldr r6, [r5, #0x28]
	ldr r5, [r5, #0x2c]
	str r6, [sp]
	str r5, [sp, #4]
	ldr r6, [r1]
	ldr r5, [r4, #0x18]
	add r6, r6, r5
	str r6, [sp]
	ldr r5, [r1, #4]
	ldr r1, [r4, #0x1c]
	add r5, r5, r1
	str r5, [sp, #4]
	ldr r1, [r4, #0x2c]
	cmp ip, r1
	blt _022FD018
	ldr r1, [r4, #0x34]
	cmp r6, r1
	bge _022FD018
	ldr r1, [r4, #0x30]
	cmp r3, r1
	blt _022FD018
	ldr r1, [r4, #0x38]
	cmp r5, r1
	blt _022FD020
_022FD018:
	mov r0, #0x40
	b _022FD054
_022FD020:
	mov r1, lr
	bl ov11_022FCE48
	cmp r0, #0
	bne _022FD054
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #0
	str r2, [r4, #0x134]
	str r1, [r4, #0x138]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r4, #0x13c]
	str r1, [r4, #0x140]
_022FD054:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FD05C: .word 0x02321D88
	arm_func_end ov11_022FCF70

	arm_func_start ov11_022FD060
ov11_022FD060: ; 0x022FD060
	ldrsh r0, [r0, #4]
	bx lr
	arm_func_end ov11_022FD060

	arm_func_start ov11_022FD068
ov11_022FD068: ; 0x022FD068
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end ov11_022FD068

	arm_func_start ov11_022FD07C
ov11_022FD07C: ; 0x022FD07C
	cmp r1, #0
	beq _022FD0C8
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x134]
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r0, #0x13c]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x1c]
	sub r2, r3, r2
	str r2, [r0, #0x138]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x140]
	bx lr
_022FD0C8:
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x134]
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x13c]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x138]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r3, ip, r3
	str r3, [r0, #0x140]
	str r2, [r0, #0x148]
	str r2, [r0, #0x144]
	ldrsb r2, [r1, #0x30]
	ldrsb r1, [r0, #0x20]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x14c]
	ldrsb r1, [r0, #0x20]
	strb r1, [r0, #0x130]
	bx lr
	arm_func_end ov11_022FD07C

	arm_func_start ov11_022FD138
ov11_022FD138: ; 0x022FD138
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x34]
	str r1, [r0, #0x38]
	bx lr
	arm_func_end ov11_022FD138

	arm_func_start ov11_022FD15C
ov11_022FD15C: ; 0x022FD15C
	ldr r3, [r0, #0x134]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x138]
	ldr r0, [r0, #0x1c]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end ov11_022FD15C

	arm_func_start ov11_022FD180
ov11_022FD180: ; 0x022FD180
	ldr ip, _022FD188 ; =ov11_022FCF70
	bx ip
	.align 2, 0
_022FD188: .word ov11_022FCF70
	arm_func_end ov11_022FD180

	arm_func_start ov11_022FD18C
ov11_022FD18C: ; 0x022FD18C
	ldr r3, [r0, #0x144]
	str r3, [r1]
	ldr r0, [r0, #0x148]
	str r0, [r2]
	bx lr
	arm_func_end ov11_022FD18C

	arm_func_start ov11_022FD1A0
ov11_022FD1A0: ; 0x022FD1A0
	str r1, [r0, #0x144]
	bx lr
	arm_func_end ov11_022FD1A0

	arm_func_start ov11_022FD1A8
ov11_022FD1A8: ; 0x022FD1A8
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x30]
	strb r0, [r1]
	bx lr
	arm_func_end ov11_022FD1A8

	arm_func_start ov11_022FD1B8
ov11_022FD1B8: ; 0x022FD1B8
	mvn r2, #0
	cmp r1, r2
	strneb r1, [r0, #0x130]
	bx lr
	arm_func_end ov11_022FD1B8

	arm_func_start ov11_022FD1C8
ov11_022FD1C8: ; 0x022FD1C8
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	tst r1, #0x800
	mov ip, r2, lsr #0x10
	beq _022FD1F8
	add r1, r0, #0x100
	mov r2, #0x400
	strh r2, [r1, #0x4e]
	mov r1, #1
	strb r1, [r0, #0x14c]
	bx lr
_022FD1F8:
	cmp r3, #0
	ldrne r1, _022FD284 ; =0x02321DC8
	movne r2, r3, lsl #1
	ldrnesh r3, [r1, r2]
	addeq r1, r0, #0x100
	ldreqsh r3, [r1, #0x4e]
	cmp ip, #0x200
	bgt _022FD230
	bge _022FD24C
	cmp ip, #0x100
	orreq r1, r3, #0x300
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FD258
_022FD230:
	cmp ip, #0x300
	ble _022FD258
	cmp ip, #0x400
	orreq r1, r3, #0x200
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FD258
_022FD24C:
	orr r1, r3, #0x100
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_022FD258:
	add r1, r0, #0x100
	ldrsh r2, [r1, #0x4e]
	cmp r2, r3
	strneh r3, [r1, #0x4e]
	movne r1, #1
	strneb r1, [r0, #0x14c]
	bxne lr
	tst r2, #0x1000
	movne r1, #1
	strneb r1, [r0, #0x14c]
	bx lr
	.align 2, 0
_022FD284: .word 0x02321DC8
	arm_func_end ov11_022FD1C8

	arm_func_start ov11_022FD288
ov11_022FD288: ; 0x022FD288
	add r0, r0, #0x100
	strh r1, [r0, #0x50]
	strh r2, [r0, #0x52]
	bx lr
	arm_func_end ov11_022FD288

	arm_func_start ov11_022FD298
ov11_022FD298: ; 0x022FD298
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x14c]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x154
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FD298

	arm_func_start ov11_022FD2B8
ov11_022FD2B8: ; 0x022FD2B8
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r1, [r1, #0x52]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x154
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FD2B8

	arm_func_start ov11_022FD2DC
ov11_022FD2DC: ; 0x022FD2DC
	ldr r0, [r0, #0x12c]
	str r0, [r1]
	bx lr
	arm_func_end ov11_022FD2DC

	arm_func_start ov11_022FD2E8
ov11_022FD2E8: ; 0x022FD2E8
	ldr ip, _022FD2F4 ; =ov11_022FC5F8
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FD2F4: .word ov11_022FC5F8
	arm_func_end ov11_022FD2E8

	arm_func_start ov11_022FD2F8
ov11_022FD2F8: ; 0x022FD2F8
	ldr ip, _022FD304 ; =ov11_022FC638
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FD304: .word ov11_022FC638
	arm_func_end ov11_022FD2F8

	arm_func_start ov11_022FD308
ov11_022FD308: ; 0x022FD308
	ldr ip, _022FD314 ; =ov11_022F4984
	add r0, r0, #0x154
	bx ip
	.align 2, 0
_022FD314: .word ov11_022F4984
	arm_func_end ov11_022FD308

	arm_func_start ov11_022FD318
ov11_022FD318: ; 0x022FD318
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r2, _022FD478 ; =0x02321D88
	mov r5, r0
	ldr r0, [r2, #4]
	ldr r3, [r2]
	str r0, [sp, #4]
	str r3, [sp]
	ldr r3, [r5, #0x134]
	ldr r0, [r1]
	mov r4, #0
	add r0, r3, r0
	str r0, [sp]
	ldr ip, [r5, #0x138]
	ldr r3, [r1, #4]
	add r3, ip, r3
	str r3, [sp, #4]
	ldr r3, [r2, #0x38]
	ldr r2, [r2, #0x3c]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r3, [r5, #0x13c]
	ldr r2, [r1]
	add r3, r3, r2
	str r3, [sp, #8]
	ldr r2, [r5, #0x140]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r1, [r5, #0x2c]
	cmp r0, r1
	bge _022FD3B4
	str r1, [sp]
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x10]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #8]
	b _022FD3D8
_022FD3B4:
	ldr r1, [r5, #0x34]
	cmp r3, r1
	blt _022FD3D8
	ldr r0, [r5, #0x10]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r5, #0x34]
	str r0, [sp, #8]
_022FD3D8:
	ldr r1, [r5, #0x30]
	ldr r0, [sp, #4]
	cmp r0, r1
	bge _022FD404
	str r1, [sp, #4]
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x14]
	mov r4, #1
	add r0, r1, r0
	str r0, [sp, #0xc]
	b _022FD42C
_022FD404:
	ldr r1, [r5, #0x38]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _022FD42C
	ldr r0, [r5, #0x14]
	mov r4, #1
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #0x38]
	str r0, [sp, #0xc]
_022FD42C:
	add r1, sp, #0
	add r2, sp, #8
	mov r0, r5
	bl ov11_022FCE48
	cmp r0, #0
	bne _022FD470
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r4, #0
	str r1, [r5, #0x134]
	str r0, [r5, #0x138]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [r5, #0x13c]
	str r0, [r5, #0x140]
	movne r0, #0x40
	moveq r0, #0
_022FD470:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FD478: .word 0x02321D88
	arm_func_end ov11_022FD318

	arm_func_start ov11_022FD47C
ov11_022FD47C: ; 0x022FD47C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FD50C ; =0x02324D00
	mov r4, #0
	ldr r5, [r0]
	mov r7, r4
	mvn r6, #0
_022FD494:
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ldrneb r0, [r5, #8]
	cmpne r0, #0
	beq _022FD4F0
	add r0, r5, #0x3c
	bl ov11_022DD164
	cmp r0, #0
	beq _022FD4CC
	cmp r0, #6
	bne _022FD4CC
	mov r0, r4
	bl ov11_022FC44C
	b _022FD4F0
_022FD4CC:
	ldrb r0, [r5, #0x14c]
	cmp r0, #0
	beq _022FD4F0
	strb r7, [r5, #0x14c]
	add r0, r5, #0x100
	ldrsh r1, [r0, #0x4e]
	mov r2, r7
	add r0, r5, #0x154
	bl ov11_022F52E8
_022FD4F0:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	add r5, r5, #0x218
	blt _022FD494
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FD50C: .word 0x02324D00
	arm_func_end ov11_022FD47C

	arm_func_start ov11_022FD510
ov11_022FD510: ; 0x022FD510
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FD61C ; =0x02321D88
	ldr r1, _022FD620 ; =0x02324D00
	ldr r8, [r0, #0x10]
	ldr r7, [r0, #0x14]
	mov sb, #0
	ldr sl, [r1]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FD540:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	ldrneb r0, [sl, #8]
	cmpne r0, #0
	beq _022FD5FC
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r2, [sl, #0x134]
	ldr r1, [sl, #0x18]
	add r0, sl, #0x100
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r2, [sl, #0x138]
	ldr r1, [sl, #0x1c]
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldrsh r1, [r0, #0xe6]
	ldr r6, [sl, #0x144]
	ldr r5, [sl, #0x148]
	cmp r1, #0
	bge _022FD5B4
	ldrsh r1, [r0, #0xe0]
	cmp r1, #0
	ble _022FD5B4
	strb fp, [sl, #0x14c]
	ldrsh r1, [r0, #0x4e]
	mov r2, fp
	add r0, sl, #0x154
	bl ov11_022F52E8
_022FD5B4:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x50]
	cmp r1, r4
	beq _022FD5EC
	mov r0, #0
	str r0, [sp]
	ldrsh r2, [r3, #0x52]
	ldrsb r3, [r3, #0x30]
	add r0, sl, #0x154
	bl ov11_022F5408
	add r1, sl, #0x100
	strh r4, [r1, #0x50]
	mov r0, #0
	strh r0, [r1, #0x52]
_022FD5EC:
	add r1, sp, #0xc
	add r0, sl, #0x154
	add r2, r6, r5
	bl ov11_022F6F14
_022FD5FC:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	add sl, sl, #0x218
	blt _022FD540
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FD61C: .word 0x02321D88
_022FD620: .word 0x02324D00
	arm_func_end ov11_022FD510

	arm_func_start ov11_022FD624
ov11_022FD624: ; 0x022FD624
	stmdb sp!, {r3, lr}
	mov r0, #0x2140
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FD668 ; =0x02324D04
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FD644:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #6]
	cmp r3, #0x10
	add r0, r0, #0x214
	blt _022FD644
	bl ov11_022FD66C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FD668: .word 0x02324D04
	arm_func_end ov11_022FD624

	arm_func_start ov11_022FD66C
ov11_022FD66C: ; 0x022FD66C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FD6B0 ; =0x02324D04
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FD680:
	ldrsh r0, [r6, #6]
	cmp r0, r4
	beq _022FD694
	mov r0, r5
	bl ov11_022FDBEC
_022FD694:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x10
	add r6, r6, #0x214
	blt _022FD680
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FD6B0: .word 0x02324D04
	arm_func_end ov11_022FD66C

	arm_func_start ov11_022FD6B4
ov11_022FD6B4: ; 0x022FD6B4
	stmdb sp!, {r3, lr}
	bl ov11_022FD66C
	ldr r0, _022FD6D8 ; =0x02324D04
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FD6D8 ; =0x02324D04
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FD6D8: .word 0x02324D04
	arm_func_end ov11_022FD6B4

	arm_func_start ov11_022FD6DC
ov11_022FD6DC: ; 0x022FD6DC
	mvn r1, #0
	cmp r0, r1
	beq _022FD720
	ldr r1, _022FD728 ; =0x02324D04
	mov r3, #0
	ldr r2, [r1]
	b _022FD718
_022FD6F8:
	ldrsh r1, [r2, #6]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r2, r2, #0x214
_022FD718:
	cmp r3, #0x10
	blt _022FD6F8
_022FD720:
	mvn r0, #0
	bx lr
	.align 2, 0
_022FD728: .word 0x02324D04
	arm_func_end ov11_022FD6DC

	arm_func_start ov11_022FD72C
ov11_022FD72C: ; 0x022FD72C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r8, r1
	ldrh r5, [r8]
	ldr r1, _022FDA68 ; =0x02320858
	movs sb, r0
	mov r7, r2
	mov r6, r3
	add r4, r1, r5, lsl #2
	bpl _022FD7C0
	ldrsb r0, [r4]
	cmp r0, #1
	bne _022FD770
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022FD6DC
	mov sb, r0
_022FD770:
	cmp sb, #0
	bge _022FD7B4
	ldr r0, _022FDA6C ; =0x02324D04
	mov r3, #0
	ldr r2, [r0]
	mvn r1, #0
	b _022FD7AC
_022FD78C:
	ldrsh r0, [r2, #6]
	cmp r0, r1
	moveq sb, r3
	beq _022FD7B4
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x214
_022FD7AC:
	cmp r3, #0x10
	blt _022FD78C
_022FD7B4:
	cmp sb, #0
	mvnlt r0, #0
	blt _022FDA60
_022FD7C0:
	ldr r0, _022FDA6C ; =0x02324D04
	ldrsb r1, [r4]
	ldr r2, [r0]
	mov r0, #0x214
	stmia sp, {r1, r7}
	str r6, [sp, #8]
	ldrh r3, [r8]
	smlabb r5, sb, r0, r2
	ldr r1, _022FDA70 ; =0x02322160
	mov r2, sb
	mov r0, #1
	bl DebugPrint
	ldrsh r1, [r5, #6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	ands sl, r0, #0xff
	beq _022FD81C
	mov r1, #0
	add r0, r5, #0x150
	strb r1, [r5, #8]
	bl ov11_022F4A14
_022FD81C:
	sub r0, r7, #1
	strh sb, [r5, #4]
	mov r0, r0, lsl #0x10
	ldrh r1, [r8]
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	strh r1, [r5, #6]
	strlsh r7, [r5, #0xa]
	strlsb r6, [r5, #0xc]
	mvnls r0, #0
	strlsb r0, [r5, #0xd]
	bls _022FD868
	cmp sl, #0
	mvnne r0, #0
	strneh r0, [r5, #0xa]
	strneb r0, [r5, #0xc]
	strb r6, [r5, #0xd]
_022FD868:
	ldrsb r0, [r4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022FD8CC
_022FD878: ; jump table
	b _022FD8CC ; case 0
	b _022FD890 ; case 1
	b _022FD89C ; case 2
	b _022FD8A8 ; case 3
	b _022FD8B4 ; case 4
	b _022FD8C0 ; case 5
_022FD890:
	mov r0, #0x800000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD89C:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8A8:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8B4:
	mov r0, #0x2000000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8C0:
	ldr r0, _022FDA74 ; =0x02020000
	str r0, [r5, #0x128]
	b _022FD8D4
_022FD8CC:
	mov r0, #0x20c0000
	str r0, [r5, #0x128]
_022FD8D4:
	ldrb r0, [r4, #3]
	cmp r0, #0
	ldrne r0, [r5, #0x128]
	orrne r0, r0, #0x80000000
	strne r0, [r5, #0x128]
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldreqb r0, [r8, #3]
	moveq r0, r0, lsl #0xb
	streq r0, [r5, #0x10]
	ldreqb r0, [r8, #4]
	movne r0, r0, lsl #0xb
	strne r0, [r5, #0x10]
	ldrneb r0, [r4, #2]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x14]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r5, #0x1c]
	ldrsb r0, [r8, #2]
	strb r0, [r5, #0x20]
	ldrb r0, [r8, #7]
	tst r0, #4
	bne _022FD968
	ldrb r0, [r8, #5]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x24]
	ldrb r0, [r8, #7]
	tst r0, #2
	ldrne r0, [r5, #0x24]
	addne r0, r0, #0x400
	strne r0, [r5, #0x24]
_022FD968:
	ldrb r0, [r8, #8]
	tst r0, #4
	bne _022FD994
	ldrb r0, [r8, #6]
	mov r0, r0, lsl #0xb
	str r0, [r5, #0x28]
	ldrb r0, [r8, #8]
	tst r0, #2
	ldrne r0, [r5, #0x28]
	addne r0, r0, #0x400
	strne r0, [r5, #0x28]
_022FD994:
	ldrb r0, [sp, #0x30]
	cmp r0, #0
	ldrne r0, [r5, #0x128]
	orrne r0, r0, #0x800000
	strne r0, [r5, #0x128]
	cmp sl, #0
	beq _022FDA54
	ldrsb r0, [r5, #0x20]
	mov r2, #0
	strb r0, [r5, #0x12c]
	ldr r3, [r5, #0x24]
	ldr r1, [r5, #0x18]
	add r0, r5, #0x2c
	sub r1, r3, r1
	str r1, [r5, #0x130]
	ldr r4, [r5, #0x24]
	ldr r3, [r5, #0x18]
	add r1, r5, #0x34
	add r3, r4, r3
	str r3, [r5, #0x138]
	ldr r4, [r5, #0x28]
	ldr r3, [r5, #0x1c]
	sub r3, r4, r3
	str r3, [r5, #0x134]
	ldr r4, [r5, #0x28]
	ldr r3, [r5, #0x1c]
	add r3, r4, r3
	str r3, [r5, #0x13c]
	str r2, [r5, #0x144]
	str r2, [r5, #0x140]
	bl ov11_022F1F08
	add r0, r5, #0x100
	mov r2, #0x800
	mov r1, #1
	strh r2, [r0, #0x4a]
	strb r1, [r5, #0x148]
	sub r1, r1, #2
	strh r1, [r0, #0x4c]
	mov r1, #0
	strh r1, [r0, #0x4e]
	ldrsh r1, [r5, #6]
	ldr r2, [r5, #0x128]
	add r0, r5, #0x150
	bl ov11_022F6F4C
	ldr r1, _022FDA78 ; =0x02322110
	mov r2, r5
	add r0, r5, #0x3c
	bl ov11_022DC8E8
_022FDA54:
	mov r1, #1
	mov r0, sb
	strb r1, [r5, #8]
_022FDA60:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FDA68: .word 0x02320858
_022FDA6C: .word 0x02324D04
_022FDA70: .word 0x02322160
_022FDA74: .word 0x02020000
_022FDA78: .word 0x02322110
	arm_func_end ov11_022FD72C

	arm_func_start ov11_022FDA7C
ov11_022FDA7C: ; 0x022FDA7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FDBDC ; =0x023221A8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FDB44
	ldr r0, _022FDBE0 ; =0x02324D04
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FDBE4 ; =0x023221D8
	add r5, r4, #1
	mov r6, #1
_022FDAD8:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FDB28
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FDB28
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FDB28
	mov r0, r8
	bl ov11_022FDBEC
_022FDB28:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDAD8
	b _022FDBD4
_022FDB44:
	ldr r0, _022FDBE0 ; =0x02324D04
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022FDB60:
	ldrsh r3, [sl, #6]
	cmp r3, r7
	beq _022FDBBC
	ldrsb ip, [sl, #0xd]
	ldr r1, _022FDBE8 ; =0x02322204
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl DebugPrint
	ldrsb r0, [sl, #0xd]
	cmp r0, r6
	beq _022FDBA8
	cmp sb, r5
	cmpne sb, r0
	bne _022FDBBC
	mov r0, r8
	bl ov11_022FDBEC
	b _022FDBBC
_022FDBA8:
	ldrsh r0, [sl, #0xa]
	cmp r0, r4
	bne _022FDBBC
	mov r0, r8
	bl ov11_022FDBEC
_022FDBBC:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x214
	blt _022FDB60
_022FDBD4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDBDC: .word 0x023221A8
_022FDBE0: .word 0x02324D04
_022FDBE4: .word 0x023221D8
_022FDBE8: .word 0x02322204
	arm_func_end ov11_022FDA7C

	arm_func_start ov11_022FDBEC
ov11_022FDBEC: ; 0x022FDBEC
	stmdb sp!, {r4, lr}
	ldr r1, _022FDC2C ; =0x02324D04
	mov r2, r0
	ldr r1, [r1]
	mov r0, #0x214
	smlabb r4, r2, r0, r1
	ldr r1, _022FDC30 ; =0x02322224
	mov r0, #1
	bl DebugPrint
	add r0, r4, #0x150
	bl ov11_022F6F9C
	add r0, r4, #0x3c
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FDC2C: .word 0x02324D04
_022FDC30: .word 0x02322224
	arm_func_end ov11_022FDBEC

	arm_func_start ov11_022FDC34
ov11_022FDC34: ; 0x022FDC34
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FDD8C ; =0x023221A8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022FDD04
	ldr r0, _022FDD90 ; =0x02324D04
	mvn r5, #0
	ldr r7, [r0]
	ldr fp, _022FDD94 ; =0x023221D8
	sub r4, r5, #1
	mov r6, #1
_022FDC90:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FDCE8
	ldrsh r2, [r7, #0xa]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #0xa]
	cmp sl, r0
	bne _022FDCE8
	cmp sb, r4
	ldrnesb r0, [r7, #0xc]
	cmpne sb, r0
	bne _022FDCE8
	mov r1, #0
	add r0, r7, #0x3c
	bl ov11_022DCFC4
	strh r5, [r7, #0xa]
_022FDCE8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDC90
	b _022FDD84
_022FDD04:
	ldr r0, _022FDD90 ; =0x02324D04
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0]
	ldr r6, _022FDD94 ; =0x023221D8
	sub r4, r5, #1
	mov fp, r7
_022FDD20:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FDD6C
	ldrsh r2, [sl, #0xa]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #0xc]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	cmp sb, r4
	ldrnesb r0, [sl, #0xd]
	cmpne sb, r0
	bne _022FDD6C
	mov r1, fp
	add r0, sl, #0x3c
	bl ov11_022DCFC4
	strb r5, [sl, #0xd]
_022FDD6C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add sl, sl, #0x214
	blt _022FDD20
_022FDD84:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDD8C: .word 0x023221A8
_022FDD90: .word 0x02324D04
_022FDD94: .word 0x023221D8
	arm_func_end ov11_022FDC34

	arm_func_start ov11_022FDD98
ov11_022FDD98: ; 0x022FDD98
	stmdb sp!, {r3, lr}
	ldr r3, _022FDDD4 ; =0x02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x128]
	add r0, ip, #0x150
	orr r1, r2, r1
	str r1, [ip, #0x128]
	bl ov11_022F495C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FDDD4: .word 0x02324D04
	arm_func_end ov11_022FDD98

	arm_func_start ov11_022FDDD8
ov11_022FDDD8: ; 0x022FDDD8
	stmdb sp!, {r3, lr}
	ldr r3, _022FDE18 ; =0x02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	ldmeqia sp!, {r3, pc}
	ldr r2, [ip, #0x128]
	eor r0, r1, r3
	and r1, r2, r0
	add r0, ip, #0x150
	str r1, [ip, #0x128]
	bl ov11_022F495C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FDE18: .word 0x02324D04
	arm_func_end ov11_022FDDD8

	arm_func_start ov11_022FDE1C
ov11_022FDE1C: ; 0x022FDE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FDE78
	ldr r0, _022FDE80 ; =0x02324D04
	mov r6, #0
	ldr r5, [r0]
	b _022FDE70
_022FDE40:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FDE60
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FDE60:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x214
_022FDE70:
	cmp r6, #0x10
	blt _022FDE40
_022FDE78:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FDE80: .word 0x02324D04
	arm_func_end ov11_022FDE1C

	arm_func_start ov11_022FDE84
ov11_022FDE84: ; 0x022FDE84
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _022FDEE0
	ldr r0, _022FDEE8 ; =0x02324D04
	mov r6, #0
	ldr r5, [r0]
	b _022FDED8
_022FDEA8:
	ldrsh r0, [r5, #6]
	cmp r0, r4
	bne _022FDEC8
	add r0, r5, #0x3c
	bl ov11_022DC9A0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_022FDEC8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x214
_022FDED8:
	cmp r6, #0x10
	blt _022FDEA8
_022FDEE0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FDEE8: .word 0x02324D04
	arm_func_end ov11_022FDE84

	arm_func_start ov11_022FDEEC
ov11_022FDEEC: ; 0x022FDEEC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mvn r0, #0
	mov r5, r1
	mov r4, r2
	cmp r6, r0
	beq _022FDF48
	ldr r0, _022FDF50 ; =0x02324D04
	mov r8, #0
	ldr r7, [r0]
_022FDF14:
	ldrsh r0, [r7, #6]
	cmp r0, r6
	bne _022FDF30
	mov r1, r5
	mov r2, r4
	add r0, r7, #0x3c
	bl ov11_022DCCEC
_022FDF30:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r7, r7, #0x214
	blt _022FDF14
_022FDF48:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FDF50: .word 0x02324D04
	arm_func_end ov11_022FDEEC

	arm_func_start ov11_022FDF54
ov11_022FDF54: ; 0x022FDF54
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	mov sb, r0
	sub r0, r7, #2
	mov r8, r1
	cmp sb, r0
	beq _022FDFC8
	ldr r0, _022FDFD0 ; =0x02324D04
	mov r6, #0
	ldr r5, [r0]
	mov r4, r6
_022FDF80:
	ldrsh r0, [r5, #6]
	cmp r0, sb
	bne _022FDFB0
	add r0, r5, #0x3c
	bl ov11_022DC958
	cmp r0, #0
	beq _022FDFB0
	mov r1, r8
	add r0, r5, #0x3c
	bl ov11_022DCA58
	cmp r0, #0
	moveq r7, r4
_022FDFB0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r5, r5, #0x214
	blt _022FDF80
_022FDFC8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FDFD0: .word 0x02324D04
	arm_func_end ov11_022FDF54

	arm_func_start ov11_022FDFD4
ov11_022FDFD4: ; 0x022FDFD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FE0E4
	ldr r1, _022FE19C ; =0x02322244
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FE1A0 ; =0x02324D04
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, r8
_022FE030:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FE0C8
	ldrsh r0, [r6, #0xa]
	cmp r0, sl
	bne _022FE0C8
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne r0, sb
	bne _022FE0C8
	ldr r1, _022FE1A4 ; =0x02322288
	mov r0, #1
	mov r2, r7
	bl DebugPrint
	str sb, [sp]
	ldrsh r2, [r6, #6]
	add r0, sp, #4
	mov r1, #5
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FE0C8
	add r0, r6, #0x3c
	add r1, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022FE0C8
	add r0, r6, #0x2c
	add r1, r6, #0x34
	bl ov11_022F1F08
	add r0, r6, #0x3c
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x148]
_022FE0C8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x214
	blt _022FE030
	b _022FE190
_022FE0E4:
	ldr r1, _022FE1A8 ; =0x0232229C
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FE1A0 ; =0x02324D04
	mvn r4, #1
	ldr r7, [r0]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022FE10C:
	ldrsh r3, [r7, #6]
	cmp r3, r5
	beq _022FE178
	cmp sb, r4
	ldrnesb r0, [r7, #0xd]
	cmpne r0, sb
	bne _022FE178
	ldr r1, _022FE1A4 ; =0x02322288
	mov r0, #1
	mov r2, r6
	bl DebugPrint
	str sb, [sp]
	ldrsh r2, [r7, #6]
	add r0, sp, #4
	mov r1, #5
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022FE178
	add r0, r7, #0x3c
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x148]
_022FE178:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x214
	blt _022FE10C
_022FE190:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE19C: .word 0x02322244
_022FE1A0: .word 0x02324D04
_022FE1A4: .word 0x02322288
_022FE1A8: .word 0x0232229C
	arm_func_end ov11_022FDFD4

	arm_func_start ov11_022FE1AC
ov11_022FE1AC: ; 0x022FE1AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022FE264
	ldr r1, _022FE2F0 ; =0x023222E0
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FE2F4 ; =0x02324D04
	mvn r4, #1
	ldr r6, [r0]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022FE204:
	ldrsh r3, [r6, #6]
	cmp r3, r5
	beq _022FE248
	ldrsh r0, [r6, #0xa]
	cmp sl, r0
	bne _022FE248
	cmp sb, r4
	ldrnesb r0, [r6, #0xc]
	cmpne sb, r0
	bne _022FE248
	ldr r1, _022FE2F8 ; =0x02322288
	mov r0, fp
	mov r2, r7
	bl DebugPrint
	add r0, r6, #0x3c
	bl ov11_022DCAE0
	orr r8, r8, r0
_022FE248:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add r6, r6, #0x214
	blt _022FE204
	b _022FE2E8
_022FE264:
	ldr r1, _022FE2FC ; =0x02322324
	mov r2, sl
	mov r3, sb
	bl DebugPrint
	ldr r0, _022FE2F4 ; =0x02324D04
	mvn r5, #0
	ldr sl, [r0]
	ldr fp, _022FE2F8 ; =0x02322288
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022FE290:
	ldrsh r3, [sl, #6]
	cmp r3, r5
	beq _022FE2D0
	ldrsb r0, [sl, #0xd]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022FE2D0
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl DebugPrint
	add r0, sl, #0x3c
	bl ov11_022DD080
	strb r5, [sl, #0xd]
	orr r8, r8, r0
_022FE2D0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x10
	add sl, sl, #0x214
	blt _022FE290
_022FE2E8:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE2F0: .word 0x023222E0
_022FE2F4: .word 0x02324D04
_022FE2F8: .word 0x02322288
_022FE2FC: .word 0x02322324
	arm_func_end ov11_022FE1AC

	arm_func_start ov11_022FE300
ov11_022FE300: ; 0x022FE300
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FE350 ; =0x02324D04
	mov r4, #0
	ldr r7, [r0]
	mov r6, r4
	mvn r5, #0
_022FE318:
	ldrsh r0, [r7, #6]
	cmp r0, r5
	beq _022FE330
	add r0, r7, #0x3c
	bl ov11_022DCB00
	orr r4, r4, r0
_022FE330:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	add r7, r7, #0x214
	blt _022FE318
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE350: .word 0x02324D04
	arm_func_end ov11_022FE300

	arm_func_start ov11_022FE354
ov11_022FE354: ; 0x022FE354
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022FE3AC ; =0x02324D04
	mov r5, #0
	ldr r4, [r1]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022FE370:
	ldrsh r0, [r4, #6]
	cmp r0, r7
	beq _022FE38C
	mov r1, r6
	add r0, r4, #0x3c
	bl ov11_022DD0EC
	orr r5, r5, r0
_022FE38C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x10
	add r4, r4, #0x214
	blt _022FE370
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FE3AC: .word 0x02324D04
	arm_func_end ov11_022FE354

	arm_func_start ov11_022FE3B0
ov11_022FE3B0: ; 0x022FE3B0
	ldr r3, _022FE400 ; =0x02324D04
	mov r2, #0x214
	ldr ip, [r3]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #6]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022FE3F4
	ldr r2, [ip, #0x130]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x134]
	ldr r0, [ip, #0x1c]
	add r0, r2, r0
_022FE3F4:
	str r0, [r1, #4]
	ldrsh r0, [ip, #6]
	bx lr
	.align 2, 0
_022FE400: .word 0x02324D04
	arm_func_end ov11_022FE3B0

	arm_func_start ov11_022FE404
ov11_022FE404: ; 0x022FE404
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r5, [r0, #0x18]
	ldr r3, [r1]
	ldr lr, [r0, #0x1c]
	ldr r2, [r1, #4]
	sub r4, r3, r5
	ldr r1, [r0, #0x2c]
	sub ip, r2, lr
	add r3, r3, r5
	add r2, r2, lr
	str r4, [sp, #8]
	str ip, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	cmp r4, r1
	blt _022FE46C
	ldr r1, [r0, #0x34]
	cmp r3, r1
	bge _022FE46C
	ldr r1, [r0, #0x30]
	cmp ip, r1
	blt _022FE46C
	ldr r1, [r0, #0x38]
	cmp r2, r1
	blt _022FE474
_022FE46C:
	mov r0, #0x40
	b _022FE488
_022FE474:
	str r4, [r0, #0x130]
	str ip, [r0, #0x134]
	str r3, [r0, #0x138]
	str r2, [r0, #0x13c]
	mov r0, #0
_022FE488:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022FE404

	arm_func_start ov11_022FE490
ov11_022FE490: ; 0x022FE490
	ldrsh r0, [r0, #4]
	bx lr
	arm_func_end ov11_022FE490

	arm_func_start ov11_022FE498
ov11_022FE498: ; 0x022FE498
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end ov11_022FE498

	arm_func_start ov11_022FE4AC
ov11_022FE4AC: ; 0x022FE4AC
	cmp r1, #0
	beq _022FE4F8
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x130]
	ldr r3, [r1]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r0, #0x138]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x1c]
	sub r2, r3, r2
	str r2, [r0, #0x134]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x13c]
	bx lr
_022FE4F8:
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x130]
	ldr r3, [r0, #0x24]
	ldr r1, [r0, #0x18]
	add r1, r3, r1
	str r1, [r0, #0x138]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x134]
	ldr ip, [r0, #0x28]
	ldr r3, [r0, #0x1c]
	add r3, ip, r3
	str r3, [r0, #0x13c]
	str r2, [r0, #0x144]
	str r2, [r0, #0x140]
	ldrsb r2, [r1, #0x2c]
	ldrsb r1, [r0, #0x20]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x148]
	ldrsb r1, [r0, #0x20]
	strb r1, [r0, #0x12c]
	bx lr
	arm_func_end ov11_022FE4AC

	arm_func_start ov11_022FE568
ov11_022FE568: ; 0x022FE568
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x34]
	str r1, [r0, #0x38]
	bx lr
	arm_func_end ov11_022FE568

	arm_func_start ov11_022FE58C
ov11_022FE58C: ; 0x022FE58C
	ldr r3, [r0, #0x130]
	ldr r2, [r0, #0x18]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x134]
	ldr r0, [r0, #0x1c]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end ov11_022FE58C

	arm_func_start ov11_022FE5B0
ov11_022FE5B0: ; 0x022FE5B0
	ldr ip, _022FE5B8 ; =ov11_022FE404
	bx ip
	.align 2, 0
_022FE5B8: .word ov11_022FE404
	arm_func_end ov11_022FE5B0

	arm_func_start ov11_022FE5BC
ov11_022FE5BC: ; 0x022FE5BC
	ldr r3, [r0, #0x140]
	str r3, [r1]
	ldr r0, [r0, #0x144]
	str r0, [r2]
	bx lr
	arm_func_end ov11_022FE5BC

	arm_func_start ov11_022FE5D0
ov11_022FE5D0: ; 0x022FE5D0
	str r1, [r0, #0x140]
	bx lr
	arm_func_end ov11_022FE5D0

	arm_func_start ov11_022FE5D8
ov11_022FE5D8: ; 0x022FE5D8
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x2c]
	strb r0, [r1]
	bx lr
	arm_func_end ov11_022FE5D8

	arm_func_start ov11_022FE5E8
ov11_022FE5E8: ; 0x022FE5E8
	mvn r2, #0
	cmp r1, r2
	strneb r1, [r0, #0x12c]
	bx lr
	arm_func_end ov11_022FE5E8

	arm_func_start ov11_022FE5F8
ov11_022FE5F8: ; 0x022FE5F8
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	tst r1, #0x800
	mov ip, r2, lsr #0x10
	beq _022FE628
	add r1, r0, #0x100
	mov r2, #0x400
	strh r2, [r1, #0x4a]
	mov r1, #1
	strb r1, [r0, #0x148]
	bx lr
_022FE628:
	cmp r3, #0
	ldrne r1, _022FE6B4 ; =0x023220DC
	movne r2, r3, lsl #1
	ldrnesh r3, [r1, r2]
	addeq r1, r0, #0x100
	ldreqsh r3, [r1, #0x4a]
	cmp ip, #0x200
	bgt _022FE660
	bge _022FE67C
	cmp ip, #0x100
	orreq r1, r3, #0x300
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FE688
_022FE660:
	cmp ip, #0x300
	ble _022FE688
	cmp ip, #0x400
	orreq r1, r3, #0x200
	moveq r1, r1, lsl #0x10
	moveq r3, r1, asr #0x10
	b _022FE688
_022FE67C:
	orr r1, r3, #0x100
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_022FE688:
	add r1, r0, #0x100
	ldrsh r2, [r1, #0x4a]
	cmp r2, r3
	strneh r3, [r1, #0x4a]
	movne r1, #1
	strneb r1, [r0, #0x148]
	bxne lr
	tst r2, #0x1000
	movne r1, #1
	strneb r1, [r0, #0x148]
	bx lr
	.align 2, 0
_022FE6B4: .word 0x023220DC
	arm_func_end ov11_022FE5F8

	arm_func_start ov11_022FE6B8
ov11_022FE6B8: ; 0x022FE6B8
	add r0, r0, #0x100
	strh r1, [r0, #0x4c]
	strh r2, [r0, #0x4e]
	bx lr
	arm_func_end ov11_022FE6B8

	arm_func_start ov11_022FE6C8
ov11_022FE6C8: ; 0x022FE6C8
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x148]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x150
	bl ov11_022F4990
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FE6C8

	arm_func_start ov11_022FE6E8
ov11_022FE6E8: ; 0x022FE6E8
	stmdb sp!, {r3, lr}
	add r1, r0, #0x100
	ldrsh r3, [r1, #0x4c]
	mvn r2, #0
	cmp r3, r2
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldrsh r1, [r1, #0x4e]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	add r0, r0, #0x150
	bl ov11_022F49B0
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FE6E8

	arm_func_start ov11_022FE720
ov11_022FE720: ; 0x022FE720
	ldr r0, [r0, #0x128]
	str r0, [r1]
	bx lr
	arm_func_end ov11_022FE720

	arm_func_start ov11_022FE72C
ov11_022FE72C: ; 0x022FE72C
	ldr ip, _022FE738 ; =ov11_022FDD98
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FE738: .word ov11_022FDD98
	arm_func_end ov11_022FE72C

	arm_func_start ov11_022FE73C
ov11_022FE73C: ; 0x022FE73C
	ldr ip, _022FE748 ; =ov11_022FDDD8
	ldrsh r0, [r0, #4]
	bx ip
	.align 2, 0
_022FE748: .word ov11_022FDDD8
	arm_func_end ov11_022FE73C

	arm_func_start ov11_022FE74C
ov11_022FE74C: ; 0x022FE74C
	ldr ip, _022FE758 ; =ov11_022F4984
	add r0, r0, #0x150
	bx ip
	.align 2, 0
_022FE758: .word ov11_022F4984
	arm_func_end ov11_022FE74C

	arm_func_start ov11_022FE75C
ov11_022FE75C: ; 0x022FE75C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr ip, [r1]
	ldr r2, [r0, #0x130]
	ldr lr, [r1, #4]
	add r4, r2, ip
	ldr r1, [r0, #0x13c]
	ldr r3, [r0, #0x138]
	ldr r2, [r0, #0x2c]
	add r3, r3, ip
	add r1, r1, lr
	ldr ip, [r0, #0x134]
	str r1, [sp, #0xc]
	cmp r4, r2
	ldrlt r1, [r0, #0x10]
	add ip, ip, lr
	str r4, [sp]
	str r3, [sp, #8]
	addlt r1, r2, r1
	str ip, [sp, #4]
	strlt r2, [sp]
	strlt r1, [sp, #8]
	blt _022FE7D0
	ldr r2, [r0, #0x34]
	cmp r3, r2
	ldrge r1, [r0, #0x10]
	strge r2, [sp, #8]
	subge r1, r2, r1
	strge r1, [sp]
_022FE7D0:
	ldr r2, [r0, #0x30]
	ldr r1, [sp, #4]
	cmp r1, r2
	ldrlt r1, [r0, #0x14]
	strlt r2, [sp, #4]
	addlt r1, r2, r1
	strlt r1, [sp, #0xc]
	blt _022FE80C
	ldr r2, [r0, #0x38]
	ldr r1, [sp, #0xc]
	cmp r1, r2
	ldrge r1, [r0, #0x14]
	strge r2, [sp, #0xc]
	subge r1, r2, r1
	strge r1, [sp, #4]
_022FE80C:
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r0, #0x130]
	ldr r2, [sp, #8]
	str r1, [r0, #0x134]
	ldr r1, [sp, #0xc]
	str r2, [r0, #0x138]
	str r1, [r0, #0x13c]
	mov r0, #0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022FE75C

	arm_func_start ov11_022FE838
ov11_022FE838: ; 0x022FE838
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022FE8C8 ; =0x02324D04
	mov r4, #0
	ldr r5, [r0]
	mov r7, r4
	mvn r6, #0
_022FE850:
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ldrneb r0, [r5, #8]
	cmpne r0, #0
	beq _022FE8AC
	add r0, r5, #0x3c
	bl ov11_022DD164
	cmp r0, #0
	beq _022FE888
	cmp r0, #6
	bne _022FE888
	mov r0, r4
	bl ov11_022FDBEC
	b _022FE8AC
_022FE888:
	ldrb r0, [r5, #0x148]
	cmp r0, #0
	beq _022FE8AC
	strb r7, [r5, #0x148]
	add r0, r5, #0x100
	ldrsh r1, [r0, #0x4a]
	mov r2, r7
	add r0, r5, #0x150
	bl ov11_022F52E8
_022FE8AC:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	add r5, r5, #0x214
	blt _022FE850
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE8C8: .word 0x02324D04
	arm_func_end ov11_022FE838

	arm_func_start ov11_022FE8CC
ov11_022FE8CC: ; 0x022FE8CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r0, _022FE9D8 ; =0x023220B4
	ldr r1, _022FE9DC ; =0x02324D04
	ldr r8, [r0, #0x18]
	ldr r7, [r0, #0x1c]
	mov sb, #0
	ldr sl, [r1]
	str r8, [sp, #4]
	str r7, [sp, #8]
	mov fp, sb
	mvn r4, #0
_022FE8FC:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	ldrneb r0, [sl, #8]
	cmpne r0, #0
	beq _022FE9B8
	str r8, [sp, #0xc]
	str r7, [sp, #0x10]
	ldr r2, [sl, #0x130]
	ldr r1, [sl, #0x18]
	add r0, sl, #0x100
	add r1, r2, r1
	str r1, [sp, #0xc]
	ldr r2, [sl, #0x134]
	ldr r1, [sl, #0x1c]
	add r1, r2, r1
	str r1, [sp, #0x10]
	ldrsh r1, [r0, #0xe2]
	ldr r6, [sl, #0x140]
	ldr r5, [sl, #0x144]
	cmp r1, #0
	bge _022FE970
	ldrsh r1, [r0, #0xdc]
	cmp r1, #0
	ble _022FE970
	strb fp, [sl, #0x148]
	ldrsh r1, [r0, #0x4a]
	mov r2, fp
	add r0, sl, #0x150
	bl ov11_022F52E8
_022FE970:
	add r3, sl, #0x100
	ldrsh r1, [r3, #0x4c]
	cmp r1, r4
	beq _022FE9A8
	mov r0, #0
	str r0, [sp]
	ldrsh r2, [r3, #0x4e]
	ldrsb r3, [r3, #0x2c]
	add r0, sl, #0x150
	bl ov11_022F5408
	add r1, sl, #0x100
	strh r4, [r1, #0x4c]
	mov r0, #0
	strh r0, [r1, #0x4e]
_022FE9A8:
	add r1, sp, #0xc
	add r0, sl, #0x150
	add r2, r6, r5
	bl ov11_022F6FA8
_022FE9B8:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	add sl, sl, #0x214
	blt _022FE8FC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FE9D8: .word 0x023220B4
_022FE9DC: .word 0x02324D04
	arm_func_end ov11_022FE8CC

	arm_func_start ov11_022FE9E0
ov11_022FE9E0: ; 0x022FE9E0
	stmdb sp!, {r3, lr}
	mov r0, #0x400
	mov r1, #6
	bl MemAlloc
	ldr r1, _022FEA24 ; =0x02324D08
	mov r3, #0
	str r0, [r1]
	mvn r2, #0
_022FEA00:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #2]
	cmp r3, #0x20
	add r0, r0, #0x20
	blt _022FEA00
	bl ov11_022FEA28
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FEA24: .word 0x02324D08
	arm_func_end ov11_022FE9E0

	arm_func_start ov11_022FEA28
ov11_022FEA28: ; 0x022FEA28
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022FEA6C ; =0x02324D08
	mov r5, #0
	ldr r6, [r0]
	mvn r4, #0
_022FEA3C:
	ldrsh r0, [r6, #2]
	cmp r0, r4
	beq _022FEA50
	mov r0, r5
	bl ov11_022FEC68
_022FEA50:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x20
	add r6, r6, #0x20
	blt _022FEA3C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FEA6C: .word 0x02324D08
	arm_func_end ov11_022FEA28

	arm_func_start ov11_022FEA70
ov11_022FEA70: ; 0x022FEA70
	stmdb sp!, {r3, lr}
	bl ov11_022FEA28
	ldr r0, _022FEA94 ; =0x02324D08
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022FEA94 ; =0x02324D08
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FEA94: .word 0x02324D08
	arm_func_end ov11_022FEA70

	arm_func_start ov11_022FEA98
ov11_022FEA98: ; 0x022FEA98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bpl _022FEB00
	ldr r0, _022FEBF4 ; =0x02324D08
	mov r2, #0
	ldr r4, [r0]
	mvn r1, #0
	b _022FEAE8
_022FEAC8:
	ldrsh r0, [r4, #2]
	cmp r0, r1
	moveq sl, r2
	beq _022FEAF0
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r4, r4, #0x20
_022FEAE8:
	cmp r2, #0x20
	blt _022FEAC8
_022FEAF0:
	cmp sl, #0
	bge _022FEB0C
	mvn r0, #0
	b _022FEBEC
_022FEB00:
	ldr r0, _022FEBF4 ; =0x02324D08
	ldr r0, [r0]
	add r4, r0, sl, lsl #5
_022FEB0C:
	str r8, [sp]
	str r7, [sp, #4]
	ldrsh r3, [sb]
	ldr r1, _022FEBF8 ; =0x02322368
	mov r2, sl
	mov r0, #1
	bl DebugPrint
	ldrsh r0, [sb]
	bl ov11_022E7FA8
	strh sl, [r4]
	ldrsh r1, [sb]
	strh r1, [r4, #2]
	strh r8, [r4, #4]
	strb r7, [r4, #6]
	ldrsh r1, [sb, #8]
	strh r1, [r4, #8]
	ldrsh r0, [r0, #2]
	cmp r0, #1
	cmpne r0, #2
	beq _022FEB64
	cmp r0, #7
	b _022FEB70
_022FEB64:
	mov r0, #0x1800
	str r0, [r4, #0xc]
	b _022FEB78
_022FEB70:
	mov r0, #0x800
	str r0, [r4, #0xc]
_022FEB78:
	ldrb r2, [sb, #2]
	ldrb r0, [sb, #3]
	ldrb r1, [sb, #6]
	mov r2, r2, lsl #0xb
	mov r0, r0, lsl #0xb
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	tst r1, #4
	bne _022FEBAC
	ldrb r0, [sb, #4]
	tst r1, #2
	mov r5, r0, lsl #0xb
	addne r5, r5, #0x400
_022FEBAC:
	ldrb r1, [sb, #7]
	tst r1, #4
	bne _022FEBC8
	ldrb r0, [sb, #5]
	tst r1, #2
	mov r6, r0, lsl #0xb
	addne r6, r6, #0x400
_022FEBC8:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r5, [r4, #0x10]
	add r1, r5, r1
	str r1, [r4, #0x18]
	str r6, [r4, #0x14]
	add r1, r6, r0
	mov r0, sl
	str r1, [r4, #0x1c]
_022FEBEC:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FEBF4: .word 0x02324D08
_022FEBF8: .word 0x02322368
	arm_func_end ov11_022FEA98

	arm_func_start ov11_022FEBFC
ov11_022FEBFC: ; 0x022FEBFC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _022FEC64 ; =0x02324D08
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	mov r5, #0
	mvn r8, #0
_022FEC18:
	ldrsh r0, [r4, #2]
	cmp r0, r8
	beq _022FEC48
	ldrsh r0, [r4, #4]
	cmp r0, r7
	bne _022FEC48
	cmp r6, r8
	ldrnesb r0, [r4, #6]
	cmpne r6, r0
	bne _022FEC48
	mov r0, r5
	bl ov11_022FEC68
_022FEC48:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x20
	add r4, r4, #0x20
	blt _022FEC18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FEC64: .word 0x02324D08
	arm_func_end ov11_022FEBFC

	arm_func_start ov11_022FEC68
ov11_022FEC68: ; 0x022FEC68
	stmdb sp!, {r4, lr}
	ldr r1, _022FEC94 ; =0x02324D08
	mov r2, r0
	ldr r3, [r1]
	ldr r1, _022FEC98 ; =0x023223A4
	mov r0, #1
	add r4, r3, r2, lsl #5
	bl DebugPrint
	mvn r0, #0
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FEC94: .word 0x02324D08
_022FEC98: .word 0x023223A4
	arm_func_end ov11_022FEC68

	arm_func_start ov11_022FEC9C
ov11_022FEC9C: ; 0x022FEC9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022FED68 ; =0x023223C0
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl DebugPrint
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022FED60
	ldr r0, _022FED6C ; =0x02324D08
	mvn r4, #1
	ldr r7, [r0]
	ldr fp, _022FED70 ; =0x023223EC
	mov r8, #0
	add r5, r4, #1
	mov r6, #1
_022FECF8:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022FED48
	ldrsh r2, [r7, #4]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #6]
	mov r2, r8
	str ip, [sp, #4]
	bl DebugPrint
	ldrsh r0, [r7, #4]
	cmp sl, r0
	bne _022FED48
	cmp sb, r4
	ldrnesb r0, [r7, #6]
	cmpne sb, r0
	bne _022FED48
	mov r0, r8
	bl ov11_022FEC68
_022FED48:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x20
	add r7, r7, #0x20
	blt _022FECF8
_022FED60:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FED68: .word 0x023223C0
_022FED6C: .word 0x02324D08
_022FED70: .word 0x023223EC
	arm_func_end ov11_022FEC9C

	arm_func_start ov11_022FED74
ov11_022FED74: ; 0x022FED74
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022FEDF0 ; =0x02324D08
	mov r2, r0
	ldr r0, [r1]
	ldr r1, _022FEDF4 ; =0x02322418
	add r4, r0, r2, lsl #5
	ldrsh r3, [r4, #4]
	mov r0, #1
	str r3, [sp]
	ldrsh r3, [r4, #8]
	str r3, [sp, #4]
	ldrsh r3, [r4, #2]
	bl DebugPrint
	ldrsh r0, [r4, #2]
	mvn r2, #0
	cmp r0, r2
	beq _022FEDE4
	ldrsh r1, [r4, #8]
	cmp r1, r2
	bne _022FEDD4
	mov r1, #0
	bl ov11_022F7188
	b _022FEDDC
_022FEDD4:
	ldrsh r0, [r4, #4]
	bl ov11_022F74A0
_022FEDDC:
	mov r0, #1
	b _022FEDE8
_022FEDE4:
	mov r0, #0
_022FEDE8:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FEDF0: .word 0x02324D08
_022FEDF4: .word 0x02322418
	arm_func_end ov11_022FED74

	arm_func_start ov11_022FEDF8
ov11_022FEDF8: ; 0x022FEDF8
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _022FEE8C ; =0x02324D08
	mov r3, #0
	ldr ip, [ip]
	mvn lr, #0
	b _022FEE7C
_022FEE10:
	ldrsh r4, [ip, #2]
	cmp r4, lr
	beq _022FEE6C
	ldr r4, [ip, #0xc]
	tst r4, r0
	beq _022FEE6C
	ldr r5, [ip, #0x10]
	ldr r4, [r2]
	cmp r5, r4
	bge _022FEE6C
	ldr r5, [ip, #0x18]
	ldr r4, [r1]
	cmp r5, r4
	ble _022FEE6C
	ldr r5, [ip, #0x14]
	ldr r4, [r2, #4]
	cmp r5, r4
	bge _022FEE6C
	ldr r5, [ip, #0x1c]
	ldr r4, [r1, #4]
	cmp r5, r4
	movgt r0, r3
	ldmgtia sp!, {r3, r4, r5, pc}
_022FEE6C:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	add ip, ip, #0x20
_022FEE7C:
	cmp r3, #0x20
	blt _022FEE10
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FEE8C: .word 0x02324D08
	arm_func_end ov11_022FEDF8

	arm_func_start ov11_022FEE90
ov11_022FEE90: ; 0x022FEE90
	bx lr
	arm_func_end ov11_022FEE90

	arm_func_start ov11_022FEE94
ov11_022FEE94: ; 0x022FEE94
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r0, #0x378
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	bl GetGameMode
	cmp r0, #3
	ldreq r0, _022FEF18 ; =0x0232246C
	add r5, sp, #0
	ldrne r0, _022FEF1C ; =0x0232245C
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r2, _022FEF20 ; =ov11_022FEFA4
	str r4, [sp, #0xc]
	add r0, sp, #0
	mov r1, #1
	str r2, [r4]
	bl sub_02027648
	mov r2, #1
	mov r5, r0
	mov r1, #0
	str r2, [r4, #0x370]
	str r1, [r4, #0x374]
	sub r1, r1, #2
	add r0, r4, #8
	strb r1, [r4, #4]
	bl InitPortraitBox
	mov r1, #3
	mov r0, r5
	str r1, [r4, #0x18]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FEF18: .word 0x0232246C
_022FEF1C: .word 0x0232245C
_022FEF20: .word ov11_022FEFA4
	arm_func_end ov11_022FEE94

	arm_func_start ov11_022FEF24
ov11_022FEF24: ; 0x022FEF24
	stmdb sp!, {r3, lr}
	bl GetDialogBoxField0xC
	mov r1, #4
	str r1, [r0, #0x370]
	ldrsb r0, [r0, #4]
	sub r1, r1, #6
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F954
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FEF24

	arm_func_start ov11_022FEF4C
ov11_022FEF4C: ; 0x022FEF4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetDialogBoxField0xC
	mov r4, r0
	ldrsb r0, [r4, #4]
	mvn r1, #1
	cmp r0, r1
	beq _022FEF70
	bl sub_0202F8FC
_022FEF70:
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl sub_02028194
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov11_022FEF4C

	arm_func_start ov11_022FEF84
ov11_022FEF84: ; 0x022FEF84
	stmdb sp!, {r3, lr}
	bl GetDialogBoxField0xC
	ldr r0, [r0, #0x370]
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022FEF84

	arm_func_start ov11_022FEFA4
ov11_022FEFA4: ; 0x022FEFA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r8, r0
	ldr r4, [r8, #0xc]
	ldr r0, [r4, #0x370]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022FF1B4
_022FEFC8: ; jump table
	b _022FF1B4 ; case 0
	b _022FEFDC ; case 1
	b _022FEFFC ; case 2
	b _022FF1B4 ; case 3
	b _022FF17C ; case 4
_022FEFDC:
	ldrsb r0, [r8, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _022FF1B4
	mov r0, #2
	str r0, [r4, #0x370]
	mov r0, #1
	str r0, [r4, #0x374]
_022FEFFC:
	ldr r6, [r8, #0xc]
	bl GetGameMode
	mov r5, r0
	ldrsb r0, [r8, #0x10]
	bl sub_02027B1C
	cmp r5, #3
	beq _022FF118
	bl sub_02050C74
	str r0, [sp, #0x14]
	bl sub_02050BB8
	cmp r0, #0
	ldreq r7, _022FF1C0 ; =0x00000222
	str r0, [sp, #0x28]
	add ip, sp, #4
	ldr r2, _022FF1C4 ; =0x0000021F
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	ldrne r7, _022FF1CC ; =0x00000221
	str ip, [sp]
	bl PreprocessStringFromMessageId
	add r0, sp, #0x54
	bl sub_020265A8
	ldrsb r0, [r8, #0x10]
	mov r1, #0x3a
	mov r2, #4
	add r3, sp, #0x54
	bl sub_02026214
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _022FF0AC
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _022FF1D0 ; =0x00000226
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromMessageId
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	mov r1, #0x28
	mov r2, #0x16
	bl sub_02026214
_022FF0AC:
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r2, r7
	mov r1, #0x100
	bl PreprocessStringFromMessageId
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	mov r1, #0x3a
	mov r2, #0x16
	bl sub_02026214
	ldrsb r0, [r6, #4]
	mvn r1, #1
	cmp r0, r1
	beq _022FF0F8
	bl sub_0202F8FC
	mvn r0, #1
	strb r0, [r6, #4]
_022FF0F8:
	bl sub_02050C74
	mov r1, #3
	mov r3, r1
	mov r2, #0x12
	bl sub_0202A434
	strb r0, [r6, #4]
	ldrsb r0, [r8, #0x10]
	bl sub_02027AF0
_022FF118:
	bl GetGold
	str r0, [sp, #0x28]
	add r6, sp, #4
	ldr r3, _022FF1C8 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	mov r2, #0x224
	str r6, [sp]
	bl PreprocessStringFromMessageId
	cmp r5, #3
	ldrsb r0, [r8, #0x10]
	add r3, sp, #0x54
	beq _022FF15C
	mov r1, #0x9a
	mov r2, #4
	bl sub_02026214
	b _022FF168
_022FF15C:
	mov r1, #0x10
	mov r2, #2
	bl sub_02026214
_022FF168:
	mov r0, #3
	str r0, [r4, #0x370]
	sub r0, r0, #4
	str r0, [r8, #0xb8]
	b _022FF1B4
_022FF17C:
	mov r1, #4
	str r1, [r4, #0x374]
	ldrsb r0, [r4, #4]
	sub r1, r1, #6
	cmp r0, r1
	beq _022FF198
	bl sub_0202F954
_022FF198:
	ldrsb r0, [r8, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r8, #0xb8]
	movne r0, #5
	strne r0, [r4, #0x370]
_022FF1B4:
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FF1C0: .word 0x00000222
_022FF1C4: .word 0x0000021F
_022FF1C8: .word 0x0000C402
_022FF1CC: .word 0x00000221
_022FF1D0: .word 0x00000226
	arm_func_end ov11_022FEFA4

	arm_func_start ov11_022FF1D4
ov11_022FF1D4: ; 0x022FF1D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022FF20C ; =0x0232247C
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FF210 ; =0x02324D0C
	ldr r0, _022FF214 ; =0x0238A074
	ldr r2, _022FF218 ; =0x000002BD
	strh r4, [r1]
	strh r5, [r0]
	strh r2, [r1, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF20C: .word 0x0232247C
_022FF210: .word 0x02324D0C
_022FF214: .word 0x0238A074
_022FF218: .word 0x000002BD
	arm_func_end ov11_022FF1D4

	arm_func_start ov11_022FF21C
ov11_022FF21C: ; 0x022FF21C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r0, #0x620
	mov r1, #8
	mov r4, #0
	bl MemAlloc
	ldr r1, _022FF304 ; =0x02324D0C
	str r0, [r1, #4]
	add r0, r0, #0xc
	bl sub_02034A38
	ldr r3, _022FF304 ; =0x02324D0C
	mov r1, r4
	ldr ip, [r3, #4]
	ldr r2, _022FF308 ; =0x0238A074
	str r0, [ip, #8]
	ldrsh r2, [r2]
	ldr r0, [r3, #4]
	ldr lr, _022FF30C ; =0x0231C828
	strh r2, [r0, #0xa4]
	ldr r0, _022FF310 ; =0x000002BD
	mov r5, r1
_022FF270:
	ldr r6, [r3, #4]
	ldrsh ip, [lr, #2]
	ldrsh r2, [r6, #0xa4]
	cmp ip, r2
	bne _022FF29C
	ldrsh r2, [r3]
	cmp r2, r5
	add r2, r6, r1, lsl #1
	moveq r4, r1
	strh r5, [r2, #0xa6]
	add r1, r1, #1
_022FF29C:
	add r5, r5, #1
	cmp r5, r0
	add lr, lr, #8
	blt _022FF270
	ldr r2, _022FF304 ; =0x02324D0C
	mov r3, #0xa
	ldr ip, [r2, #4]
	ldr r0, _022FF314 ; =0x0232248C
	str r4, [ip, #0xc]
	stmia sp, {r1, r3}
	ldr r1, [r2, #4]
	ldr r3, _022FF318 ; =ov11_022FF438
	add r2, r1, #0xc
	mov r1, #0x33
	bl CreateAdvancedMenu
	ldr r1, _022FF304 ; =0x02324D0C
	mov r4, #0
	ldr r3, [r1, #4]
	ldr r2, _022FF310 ; =0x000002BD
	strb r0, [r3]
	ldr r3, [r1, #4]
	mov r0, #1
	str r4, [r3, #4]
	strh r2, [r1, #2]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FF304: .word 0x02324D0C
_022FF308: .word 0x0238A074
_022FF30C: .word 0x0231C828
_022FF310: .word 0x000002BD
_022FF314: .word 0x0232248C
_022FF318: .word ov11_022FF438
	arm_func_end ov11_022FF21C

	arm_func_start ov11_022FF31C
ov11_022FF31C: ; 0x022FF31C
	stmdb sp!, {r3, lr}
	ldr r0, _022FF354 ; =0x02324D0C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _022FF354 ; =0x02324D0C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FF354 ; =0x02324D0C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF354: .word 0x02324D0C
	arm_func_end ov11_022FF31C

	arm_func_start ov11_022FF358
ov11_022FF358: ; 0x022FF358
	stmdb sp!, {r3, lr}
	ldr r0, _022FF434 ; =0x02324D0C
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _022FF384
	cmp r1, #1
	beq _022FF3A4
	cmp r1, #2
	beq _022FF3FC
	b _022FF42C
_022FF384:
	ldrsb r0, [r2]
	bl IsAdvancedMenuActive
	cmp r0, #0
	ldreq r0, _022FF434 ; =0x02324D0C
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _022FF42C
_022FF3A4:
	ldrsb r0, [r2]
	bl sub_0202BCBC
	cmp r0, #0
	bne _022FF42C
	ldr r0, _022FF434 ; =0x02324D0C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	ldrlt r0, _022FF434 ; =0x02324D0C
	mvnlt r1, #0
	strlth r1, [r0, #2]
	ldrge r1, _022FF434 ; =0x02324D0C
	ldrge r2, [r1, #4]
	addge r0, r2, r0, lsl #1
	ldrgesh r0, [r0, #0xa6]
	strgeh r0, [r1, #2]
	ldr r0, _022FF434 ; =0x02324D0C
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF42C
_022FF3FC:
	mov r1, #3
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	tst r1, #0x100
	beq _022FF424
	ldrsh r1, [r0, #2]
	ldr r0, [r2, #0x94]
	ldr r2, [r2, #0x90]
	blx r2
_022FF424:
	mov r0, #4
	ldmia sp!, {r3, pc}
_022FF42C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF434: .word 0x02324D0C
	arm_func_end ov11_022FF358

	arm_func_start ov11_022FF438
ov11_022FF438: ; 0x022FF438
	ldr r0, _022FF458 ; =0x02324D0C
	ldr r2, _022FF45C ; =0x0231C828
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #1
	ldrsh r0, [r0, #0xa6]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022FF458: .word 0x02324D0C
_022FF45C: .word 0x0231C828
	arm_func_end ov11_022FF438

	arm_func_start ov11_022FF460
ov11_022FF460: ; 0x022FF460
	ldr r2, _022FF488 ; =0x02324D0C
	ldr r1, _022FF48C ; =0x000002BD
	ldrsh r3, [r2, #2]
	strh r3, [r0]
	ldrsh r0, [r2, #2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022FF488: .word 0x02324D0C
_022FF48C: .word 0x000002BD
	arm_func_end ov11_022FF460

	arm_func_start ov11_022FF490
ov11_022FF490: ; 0x022FF490
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, _022FF4F0 ; =0x0232249C
	mov r5, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FF4F4 ; =0x000001AF
	ldr r0, _022FF4F8 ; =0x02324D14
	cmp r5, #0
	strh r1, [r0, #2]
	bne _022FF4CC
	ldr r0, _022FF4FC ; =0x0238A078
	bl ov11_022E45F4
	b _022FF4E4
_022FF4CC:
	ldr r2, _022FF4FC ; =0x0238A078
	mov r1, #8
_022FF4D4:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF4D4
_022FF4E4:
	ldr r0, _022FF4F8 ; =0x02324D14
	strh r4, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FF4F0: .word 0x0232249C
_022FF4F4: .word 0x000001AF
_022FF4F8: .word 0x02324D14
_022FF4FC: .word 0x0238A078
	arm_func_end ov11_022FF490

	arm_func_start ov11_022FF500
ov11_022FF500: ; 0x022FF500
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	mov r1, #8
	bl MemAlloc
	ldr r1, _022FF57C ; =0x02324D14
	mvn r2, #1
	str r0, [r1, #4]
	strb r2, [r0]
	ldrsh ip, [r1]
	add r0, r2, #1
	ldr r3, _022FF580 ; =0x0238A078
	cmp ip, r0
	ldr r0, [r1, #4]
	moveq r1, #0
	movne r1, #2
	str r1, [r0, #4]
	ldr r0, _022FF57C ; =0x02324D14
	mov r1, #8
	ldr r2, [r0, #4]
	strh ip, [r2, #0x1c]
	ldr r0, [r0, #4]
	add r2, r0, #0x14
_022FF558:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF558
	ldr r2, _022FF584 ; =0x000001AF
	ldr r1, _022FF57C ; =0x02324D14
	mov r0, #1
	strh r2, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF57C: .word 0x02324D14
_022FF580: .word 0x0238A078
_022FF584: .word 0x000001AF
	arm_func_end ov11_022FF500

	arm_func_start ov11_022FF588
ov11_022FF588: ; 0x022FF588
	stmdb sp!, {r3, lr}
	ldr r0, _022FF5CC ; =0x02324D14
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _022FF5B0
	bl FreeAdvancedMenu
_022FF5B0:
	ldr r0, _022FF5CC ; =0x02324D14
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FF5CC ; =0x02324D14
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FF5CC: .word 0x02324D14
	arm_func_end ov11_022FF588

	arm_func_start ov11_022FF5D0
ov11_022FF5D0: ; 0x022FF5D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x128
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _022FF9D4
_022FF5F0: ; jump table
	b _022FF608 ; case 0
	b _022FF694 ; case 1
	b _022FF724 ; case 2
	b _022FF8B8 ; case 3
	b _022FF950 ; case 4
	b _022FF9C4 ; case 5
_022FF608:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF644
	bl sub_0202BCBC
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _022FF9E0 ; =0x02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF644:
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r1, _022FF9E4 ; =0x000001AF
	ldr r2, [r0, #4]
	ldr r0, _022FF9E8 ; =0x023224AC
	ldrsh r4, [r2, #0x1c]
	ldr r3, _022FF9EC ; =0x022FF9FC
	add r2, sp, #0x90
	str r4, [sp, #0x90]
	str r1, [sp]
	mov r4, #0xa
	mov r1, #0x33
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _022FF9E0 ; =0x02324D14
	mov r2, #1
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _022FF9D4
_022FF694:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	bge _022FF6EC
	ldr r0, _022FF9E0 ; =0x02324D14
	mvn r2, #0
	ldr r1, [r0, #4]
	strh r2, [r1, #0x1c]
	ldr r0, [r0, #4]
	add r0, r0, #0x14
	bl ov11_022E45F4
	ldr r0, _022FF9E0 ; =0x02324D14
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF6EC:
	ldr r1, _022FF9E0 ; =0x02324D14
	ldr r3, [r1, #4]
	ldrsh r2, [r3, #0x1c]
	cmp r2, r0
	beq _022FF710
	strh r0, [r3, #0x1c]
	ldr r0, [r1, #4]
	add r0, r0, #0x14
	bl ov11_022E45F4
_022FF710:
	ldr r0, _022FF9E0 ; =0x02324D14
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF724:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF760
	bl sub_0202BCBC
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _022FF9E0 ; =0x02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF760:
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0x1c]
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022FF9F0 ; =0x023224BC
	add r0, sp, #0x10
	mov r3, r2
	mov r5, #0
	bl Sprintf
	add r0, sp, #0x10
	bl sub_02008BA8
	cmp r0, #0
	ldrle r0, _022FF9E0 ; =0x02324D14
	movle r1, r5
	ldrle r0, [r0, #4]
	strle r1, [r0, #4]
	ble _022FF9D4
	ldr r0, _022FF9E0 ; =0x02324D14
	add r1, sp, #0x10
	ldr r0, [r0, #4]
	mov r2, #8
	add r0, r0, #8
	bl LoadFileFromRom__022E46DC
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	ldrh r1, [r1]
	str r1, [r2, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bgt _022FF800
	add r0, r1, #8
	bl UnloadFile
	ldr r0, _022FF9E0 ; =0x02324D14
	mov r1, r5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _022FF9D4
_022FF800:
	add r0, r1, #0x14
	bl ov11_022E4630
	cmp r0, #0
	bne _022FF86C
	ldr r8, _022FF9E0 ; =0x02324D14
	mov r7, r5
	ldr r0, [r8, #4]
	add r4, sp, #8
	ldr r6, [r0, #8]
	b _022FF85C
_022FF828:
	mov r0, r7, lsl #3
	add r1, r0, #2
	mov r0, r4
	add r1, r6, r1
	bl ov11_022E4600
	ldr r1, [r8, #4]
	mov r0, r4
	add r1, r1, #0x14
	bl ov11_022E465C
	cmp r0, #0
	movne r5, r7
	bne _022FF86C
	add r7, r7, #1
_022FF85C:
	ldr r0, [r8, #4]
	ldr r0, [r0, #0x10]
	cmp r7, r0
	blt _022FF828
_022FF86C:
	ldr r0, _022FF9E0 ; =0x02324D14
	str r5, [sp, #0x90]
	ldr r1, [r0, #4]
	ldr r0, _022FF9E8 ; =0x023224AC
	ldr r1, [r1, #0x10]
	ldr r3, _022FF9F4 ; =0x022FFA14
	str r1, [sp]
	mov r4, #0xa
	add r2, sp, #0x90
	mov r1, #0x33
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _022FF9E0 ; =0x02324D14
	mov r2, #3
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _022FF9D4
_022FF8B8:
	ldrsb r0, [r1]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	ldrlt r0, _022FF9E0 ; =0x02324D14
	movlt r1, #0
	ldrlt r0, [r0, #4]
	strlt r1, [r0, #4]
	blt _022FF93C
	ldr r1, _022FF9E0 ; =0x02324D14
	mov r0, r0, lsl #3
	ldr r3, [r1, #4]
	add r1, r0, #2
	ldr r2, [r3, #8]
	add r0, r3, #0x14
	add r1, r2, r1
	bl ov11_022E4600
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r2, _022FF9F8 ; =0x0238A078
	ldr r4, [r0, #4]
	mov r1, #8
	add r3, r4, #0x14
_022FF924:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF924
	mov r0, #4
	str r0, [r4, #4]
_022FF93C:
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl UnloadFile
	b _022FF9D4
_022FF950:
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _022FF98C
	bl sub_0202BCBC
	cmp r0, #0
	bne _022FF9D4
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _022FF9E0 ; =0x02324D14
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_022FF98C:
	ldr r0, _022FF9E0 ; =0x02324D14
	ldr r2, _022FF9F8 ; =0x0238A078
	ldr r5, [r0, #4]
	mov r1, #8
	ldrsh r4, [r5, #0x1c]
	add r3, r5, #0x14
	strh r4, [r0, #2]
_022FF9A8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022FF9A8
	mov r0, #5
	str r0, [r5, #4]
	b _022FF9D4
_022FF9C4:
	mov r0, #6
	str r0, [r1, #4]
	mov r0, #4
	b _022FF9D8
_022FF9D4:
	mov r0, #1
_022FF9D8:
	add sp, sp, #0x128
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FF9E0: .word 0x02324D14
_022FF9E4: .word 0x000001AF
_022FF9E8: .word 0x023224AC
_022FF9EC: .word 0x022FF9FC
_022FF9F0: .word 0x023224BC
_022FF9F4: .word 0x022FFA14
_022FF9F8: .word 0x0238A078
	arm_func_end ov11_022FF5D0

	arm_func_start ov11_022FF9FC
ov11_022FF9FC: ; 0x022FF9FC
	ldr r2, _022FFA10 ; =0x020A5488
	mov r0, #0xc
	mla r0, r1, r0, r2
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_022FFA10: .word 0x020A5488
	arm_func_end ov11_022FF9FC

	arm_func_start ov11_022FFA14
ov11_022FFA14: ; 0x022FFA14
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _022FFA58 ; =0x02324D14
	mov r1, r1, lsl #3
	ldr r2, [r2, #4]
	mov r4, r0
	ldr r2, [r2, #8]
	add r1, r1, #2
	add r0, sp, #0
	add r1, r2, r1
	bl ov11_022E4600
	add r0, sp, #0
	mov r1, r4
	bl ov11_022E466C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FFA58: .word 0x02324D14
	arm_func_end ov11_022FFA14

	arm_func_start ov11_022FFA5C
ov11_022FFA5C: ; 0x022FFA5C
	ldr r2, _022FFAA0 ; =0x02324D14
	ldr r3, _022FFAA4 ; =0x0238A078
	ldrsh ip, [r2, #2]
	mov r2, #8
	strh ip, [r0]
_022FFA70:
	ldrb r0, [r3], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022FFA70
	ldr r1, _022FFAA0 ; =0x02324D14
	ldr r0, _022FFAA8 ; =0x000001AF
	ldrsh r1, [r1, #2]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022FFAA0: .word 0x02324D14
_022FFAA4: .word 0x0238A078
_022FFAA8: .word 0x000001AF
	arm_func_end ov11_022FFA5C

	arm_func_start ov11_022FFAAC
ov11_022FFAAC: ; 0x022FFAAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022FFAE4 ; =0x023224FC
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022FFAE8 ; =0x0238A080
	ldr r0, _022FFAEC ; =0x02324D1C
	str r5, [r1]
	strh r4, [r0, #2]
	mov r1, #0xd5
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FFAE4: .word 0x023224FC
_022FFAE8: .word 0x0238A080
_022FFAEC: .word 0x02324D1C
	arm_func_end ov11_022FFAAC

	arm_func_start ov11_022FFAF0
ov11_022FFAF0: ; 0x022FFAF0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _022FFE60 ; =0x00000518
	mov r1, #8
	mov r4, #0
	bl MemAlloc
	ldr r1, _022FFE64 ; =0x0238A080
	ldr r2, _022FFE68 ; =0x02324D1C
	ldr r1, [r1]
	str r0, [r2, #4]
	str r1, [r0, #8]
	ldr r1, [r2, #4]
	ldr r0, [r1, #8]
	cmp r0, #0
	cmpne r0, #4
	moveq r0, #1
	streqb r0, [r1, #0xc]
	beq _022FFB48
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r1, #0xc]
	movne r0, r4
	strneb r0, [r1, #0xc]
_022FFB48:
	ldr r5, _022FFE68 ; =0x02324D1C
	ldr r0, [r5, #4]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _022FFBA8
	mov r6, #0
_022FFB60:
	add r0, r6, #0xb4
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #0
	beq _022FFB98
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #1
	strh r7, [r1, #0x18]
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFB98:
	add r6, r6, #1
	cmp r6, #0xb
	blt _022FFB60
	b _022FFE08
_022FFBA8:
	cmp r0, #3
	bne _022FFBFC
	mov r6, #0
_022FFBB4:
	add r0, r6, #0xbf
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #0
	beq _022FFBEC
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #1
	strh r7, [r1, #0x18]
	ldr r1, [r5, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFBEC:
	add r6, r6, #1
	cmp r6, #0xa
	blt _022FFBB4
	b _022FFE08
_022FFBFC:
	cmp r0, #4
	bne _022FFCB4
	mov r6, #0
_022FFC08:
	mov r0, r6, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x6f
	blt _022FFC20
	cmp r7, #0xa4
	ble _022FFCA4
_022FFC20:
	mov r0, r7
	bl GetDungeonMode
	mov r8, r0
	mov r0, r7
	bl DungeonSwapIdxToId
	bl GetMaxReachedFloor
	cmp r0, #0
	ble _022FFCA4
	cmp r7, #0x26
	cmpne r7, #0x29
	bne _022FFC78
	sub r0, r8, #2
	cmp r0, #1
	bhi _022FFCA4
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #1
	strh r7, [r0, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str r8, [r0, #0x1c4]
	add r4, r4, #1
	b _022FFCA4
_022FFC78:
	cmp r7, #0x36
	beq _022FFCA4
	cmp r8, #3
	bne _022FFCA4
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #1
	strh r7, [r0, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str r8, [r0, #0x1c4]
	add r4, r4, #1
_022FFCA4:
	add r6, r6, #1
	cmp r6, #0xae
	ble _022FFC08
	b _022FFE08
_022FFCB4:
	cmp r0, #1
	mov r5, #0
	bne _022FFD08
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022FFD08
_022FFCD0: ; jump table
	b _022FFCE4 ; case 0
	b _022FFCEC ; case 1
	b _022FFCF4 ; case 2
	b _022FFCFC ; case 3
	b _022FFD04 ; case 4
_022FFCE4:
	ldr r5, _022FFE6C ; =0x023224D0
	b _022FFD08
_022FFCEC:
	ldr r5, _022FFE70 ; =0x023224DC
	b _022FFD08
_022FFCF4:
	ldr r5, _022FFE74 ; =0x023224EA
	b _022FFD08
_022FFCFC:
	ldr r5, _022FFE78 ; =0x0232251C
	b _022FFD08
_022FFD04:
	ldr r5, _022FFE7C ; =0x02322548
_022FFD08:
	cmp r5, #0
	beq _022FFD60
	ldr r7, _022FFE68 ; =0x02324D1C
	mvn r6, #0
	b _022FFD50
_022FFD1C:
	ldrsh r8, [r5], #2
	mov r0, r8
	bl GetDungeonMode
	cmp r0, #1
	cmpne r0, #3
	bne _022FFD50
	ldr r1, [r7, #4]
	add r1, r1, r4, lsl #1
	strh r8, [r1, #0x18]
	ldr r1, [r7, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #0x1c4]
	add r4, r4, #1
_022FFD50:
	ldrsh r0, [r5]
	cmp r0, r6
	bne _022FFD1C
	b _022FFE08
_022FFD60:
	mov r7, #0xd4
	ldr r5, _022FFE68 ; =0x02324D1C
	mov r8, #0
	mov r6, r7
_022FFD70:
	ldr r1, [r5, #4]
	mov r0, r8, lsl #0x10
	ldr r1, [r1, #8]
	mov sb, r0, asr #0x10
	cmp r1, #0
	bne _022FFDA0
	cmp sb, #0xb0
	beq _022FFDFC
	cmp sb, #0x7b
	blt _022FFDA0
	cmp sb, #0xa4
	ble _022FFDFC
_022FFDA0:
	mov r0, sb
	bl GetDungeonMode
	mov sl, r0
	cmp sl, #1
	cmpne sl, #3
	bne _022FFDFC
	ldr r0, [r5, #4]
	cmp sb, #6
	add r0, r0, r4, lsl #1
	strh sb, [r0, #0x18]
	bne _022FFDEC
	mov r0, r7
	bl GetDungeonMode
	cmp r0, #1
	cmpne r0, #3
	ldreq r1, [r5, #4]
	moveq sl, r0
	addeq r0, r1, r4, lsl #1
	streqh r6, [r0, #0x18]
_022FFDEC:
	ldr r0, [r5, #4]
	add r0, r0, r4, lsl #2
	str sl, [r0, #0x1c4]
	add r4, r4, #1
_022FFDFC:
	add r8, r8, #1
	cmp r8, #0xb4
	blt _022FFD70
_022FFE08:
	ldr r0, _022FFE68 ; =0x02324D1C
	mvn r2, #1
	ldr r1, [r0, #4]
	cmp r4, #0
	strb r2, [r1]
	ldr r1, [r0, #4]
	strb r2, [r1, #1]
	ldr r1, [r0, #4]
	strb r2, [r1, #2]
	ldr r1, [r0, #4]
	str r4, [r1, #0x14]
	addeq r1, r2, #1
	streqh r1, [r0]
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	mov r1, #0xd5
	strh r1, [r0]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FFE60: .word 0x00000518
_022FFE64: .word 0x0238A080
_022FFE68: .word 0x02324D1C
_022FFE6C: .word 0x023224D0
_022FFE70: .word 0x023224DC
_022FFE74: .word 0x023224EA
_022FFE78: .word 0x0232251C
_022FFE7C: .word 0x02322548
	arm_func_end ov11_022FFAF0

	arm_func_start ov11_022FFE80
ov11_022FFE80: ; 0x022FFE80
	stmdb sp!, {r3, lr}
	ldr r0, _022FFEFC ; =0x02324D1C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _022FFEA8
	bl FreeAdvancedMenu
_022FFEA8:
	ldr r0, _022FFEFC ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _022FFEC4
	bl FreeDBox
_022FFEC4:
	ldr r0, _022FFEFC ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _022FFEE0
	bl sub_0202AABC
_022FFEE0:
	ldr r0, _022FFEFC ; =0x02324D1C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022FFEFC ; =0x02324D1C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FFEFC: .word 0x02324D1C
	arm_func_end ov11_022FFE80

	arm_func_start ov11_022FFF00
ov11_022FFF00: ; 0x022FFF00
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xf0
	ldr r0, _0230057C ; =0x02324D1C
	ldr r2, [r0, #4]
	ldr r0, [r2, #4]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02300570
_022FFF20: ; jump table
	b _022FFF4C ; case 0
	b _022FFF90 ; case 1
	b _02300024 ; case 2
	b _02300040 ; case 3
	b _0230018C ; case 4
	b _02300218 ; case 5
	b _02300300 ; case 6
	b _02300570 ; case 7
	b _023003E4 ; case 8
	b _02300458 ; case 9
	b _02300560 ; case 10
_022FFF4C:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _022FFF84
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	mov r0, #2
	bl ov11_0230F004
	bl ov11_0230E964
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_022FFF84:
	mov r0, #3
	str r0, [r2, #4]
	b _02300570
_022FFF90:
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #0
	ldr lr, [r0, #4]
	mov r2, r1
	ldrsh r3, [r0, #2]
	ldr ip, [lr, #0x14]
	b _022FFFD0
_022FFFB8:
	add r0, lr, r2, lsl #1
	ldrsh r0, [r0, #0x18]
	cmp r3, r0
	moveq r1, r2
	beq _022FFFD8
	add r2, r2, #1
_022FFFD0:
	cmp r2, ip
	blt _022FFFB8
_022FFFD8:
	add r0, lr, r1, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =0x02324D1C
	ldr r2, [r1, #4]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F0C4
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300024:
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02300040:
	ldr r2, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr ip, [r2, #4]
	ldrsb r0, [ip, #1]
	cmp r0, r1
	ldreqsb r3, [ip, #2]
	cmpeq r3, r1
	beq _023000F8
	mvn r1, #1
	cmp r0, r1
	beq _02300078
	bl IsDBoxActive
	cmp r0, #0
	bne _02300570
_02300078:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0230009C
	bl sub_0202AB40
	cmp r0, #0
	bne _02300570
_0230009C:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023000C8
	bl FreeDBox
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_023000C8:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02300570
	bl sub_0202AABC
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	b _02300570
_023000F8:
	ldrsb r0, [ip]
	cmp r0, r1
	bne _02300178
	mov r1, #0
	str r1, [sp, #0x58]
	ldrsh r2, [r2, #2]
	ldr r3, [ip, #0x14]
	b _02300130
_02300118:
	add r0, ip, r1, lsl #1
	ldrsh r0, [r0, #0x18]
	cmp r2, r0
	streq r1, [sp, #0x58]
	beq _02300138
	add r1, r1, #1
_02300130:
	cmp r1, r3
	blt _02300118
_02300138:
	ldr r1, _02300580 ; =0x0000022E
	mov r0, #0x10
	strh r1, [sp, #0x60]
	str r0, [sp, #0x64]
	ldr ip, [ip, #0x14]
	ldr r0, _02300584 ; =0x0232250C
	str ip, [sp]
	mov ip, #8
	ldr r1, _02300588 ; =0x00801833
	ldr r3, _0230058C ; =ov11_023005A0
	add r2, sp, #0x58
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0230057C ; =0x02324D1C
	ldr r1, [r1, #4]
	strb r0, [r1]
_02300178:
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_0230018C:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _023001F4
	bl ov11_0230D220
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0230057C ; =0x02324D1C
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =0x02324D1C
	ldr r2, [r1, #4]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F0C4
_023001F4:
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202BBF0
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300218:
	ldrb r0, [r2, #0xc]
	cmp r0, #0
	beq _0230027C
	ldrsb r0, [r2]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0230057C ; =0x02324D1C
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	bl DungeonSwapIdxToId
	bl sub_0206A84C
	ldr r1, _0230057C ; =0x02324D1C
	ldr r3, [r1, #4]
	ldrsh r2, [r3, #0xe]
	cmp r2, r0
	beq _0230027C
	strh r0, [r3, #0xe]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F1EC
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #0xc
	ldr r0, [r0, #4]
	ldrsh r0, [r0, #0xe]
	bl ov11_0230F138
_0230027C:
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl IsAdvancedMenuActive
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	cmp r0, #0
	bge _023002E4
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _023002C4
	bl ov11_0230CFF4
_023002C4:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r3, #0
	ldr r2, [r0, #4]
	mov r1, #9
	str r3, [r2, #0x10]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_023002E4:
	ldr r1, _0230057C ; =0x02324D1C
	mov r2, #6
	ldr r3, [r1, #4]
	arm_func_end ov11_022FFF00

	arm_func_start ov11_023002F0
ov11_023002F0: ; 0x023002F0
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _02300570
_02300300:
	ldrsb r0, [r2]
	mvn r1, #1
	cmp r0, r1
	beq _02300340
	bl sub_0202BCBC
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
	b _02300570
_02300340:
	ldrsb r0, [r2, #1]
	cmp r0, r1
	bne _02300398
	mov r0, #0
	bl CreateDBox
	ldr r1, _0230057C ; =0x02324D1C
	ldr r2, [r1, #4]
	strb r0, [r2, #1]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0x10]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x18]
	strh r0, [r1, #2]
	bl DungeonSwapIdxToId
	ldr r1, _0230057C ; =0x02324D1C
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	ldr r1, _02300590 ; =0x00000408
	ldrsb r0, [r0, #1]
	ldr r2, _02300594 ; =0x0000022F
	add r3, sp, #8
	bl ShowMessageInDBox
_02300398:
	ldr r1, _0230057C ; =0x02324D1C
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #2]
	cmp r1, r0
	bne _023003D0
	mov r0, #0
	ldr r1, _02300598 ; =0x00400013
	ldr r3, _0230059C ; =0x02322530
	mov r2, r0
	bl sub_0202A5CC
	ldr r1, _0230057C ; =0x02324D1C
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
_023003D0:
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_023003E4:
	ldrsb r0, [r2, #2]
	bl sub_0202AB60
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	bl sub_0202ABB0
	cmp r0, #2
	bne _02300430
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F334
	ldr r0, _0230057C ; =0x02324D1C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02300570
_02300430:
	cmp r0, #1
	ldreq r0, _0230057C ; =0x02324D1C
	moveq r1, #3
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	ldrne r0, _0230057C ; =0x02324D1C
	movne r1, #9
	ldrne r0, [r0, #4]
	strne r1, [r0, #4]
	b _02300570
_02300458:
	ldrsb r0, [r2]
	mvn r1, #1
	cmp r0, r1
	beq _02300494
	bl sub_0202BCBC
	cmp r0, #0
	bne _02300570
	ldr r0, _0230057C ; =0x02324D1C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
_02300494:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _023004B8
	bl IsDBoxActive
	cmp r0, #0
	bne _02300570
_023004B8:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _023004DC
	bl sub_0202AB40
	cmp r0, #0
	bne _02300570
_023004DC:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _02300508
	bl FreeDBox
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #1]
_02300508:
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _02300534
	bl sub_0202AABC
	ldr r0, _0230057C ; =0x02324D1C
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
_02300534:
	ldr r0, _0230057C ; =0x02324D1C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	mvnlt r1, #0
	addge r1, r2, r1, lsl #1
	ldrgesh r1, [r1, #0x18]
	strh r1, [r0]
	mov r0, #0xa
	str r0, [r2, #4]
	b _02300570
_02300560:
	mov r0, #0xb
	str r0, [r2, #4]
	mov r0, #4
	b _02300574
_02300570:
	mov r0, #1
_02300574:
	add sp, sp, #0xf0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230057C: .word 0x02324D1C
_02300580: .word 0x0000022E
_02300584: .word 0x0232250C
_02300588: .word 0x00801833
_0230058C: .word ov11_023005A0
_02300590: .word 0x00000408
_02300594: .word 0x0000022F
_02300598: .word 0x00400013
_0230059C: .word 0x02322530
	arm_func_end ov11_023002F0

	arm_func_start ov11_023005A0
ov11_023005A0: ; 0x023005A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x54
	ldr r2, _02300660 ; =0x02324D1C
	mov r8, r0
	ldr r2, [r2, #4]
	add r0, r2, r1, lsl #1
	ldrsh r4, [r0, #0x18]
	add r0, r2, r1, lsl #2
	ldr r5, [r0, #0x1c4]
	mov r0, r4
	bl DungeonSwapIdxToId
	ldr r1, _02300660 ; =0x02324D1C
	mov r6, r0
	ldr r1, [r1, #4]
	ldr r7, _02300664 ; =0x0232256C
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _0230060C
	cmp r5, #1
	ldreq r7, _02300668 ; =0x02322574
	beq _02300630
	cmp r5, #3
	bne _02300630
	bl AnyDungeonRequestsDone
	cmp r0, #0
	ldrne r7, _0230066C ; =0x02322580
	b _02300630
_0230060C:
	sub r0, r1, #2
	cmp r0, #1
	bhi _02300630
	cmp r4, #0xbe
	beq _02300630
	mov r0, r4
	bl sub_0204CF0C
	cmp r0, #0
	ldrne r7, _02300670 ; =0x0232258C
_02300630:
	ldr r2, _02300674 ; =0x02322598
	ldr r3, _02300678 ; =0x0000C402
	add r4, sp, #4
	mov r0, r8
	str r6, [sp, #0x14]
	str r7, [sp, #0x3c]
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r0, r8
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02300660: .word 0x02324D1C
_02300664: .word 0x0232256C
_02300668: .word 0x02322574
_0230066C: .word 0x02322580
_02300670: .word 0x0232258C
_02300674: .word 0x02322598
_02300678: .word 0x0000C402
	arm_func_end ov11_023005A0

	arm_func_start ov11_0230067C
ov11_0230067C: ; 0x0230067C
	ldr r1, _023006A0 ; =0x02324D1C
	ldrsh r2, [r1]
	strh r2, [r0]
	ldrsh r0, [r1]
	cmp r0, #0xd5
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023006A0: .word 0x02324D1C
	arm_func_end ov11_0230067C

	arm_func_start ov11_023006A4
ov11_023006A4: ; 0x023006A4
	stmdb sp!, {r3, lr}
	ldr r0, _023006D8 ; =0x02324D24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x460
	mov r1, #8
	bl MemAlloc
	ldr r1, _023006D8 ; =0x02324D24
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023006D8: .word 0x02324D24
	arm_func_end ov11_023006A4

	arm_func_start ov11_023006DC
ov11_023006DC: ; 0x023006DC
	stmdb sp!, {r3, lr}
	ldr r0, _02300720 ; =0x02324D24
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _02300724 ; =0x023225BC
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300720: .word 0x02324D24
_02300724: .word 0x023225BC
	arm_func_end ov11_023006DC

	arm_func_start ov11_02300728
ov11_02300728: ; 0x02300728
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov11_023006A4
	ldr r0, _023007A4 ; =0x02324D24
	mov r1, r7
	ldr r0, [r0, #4]
	add r0, r0, #0x58
	bl Strcpy
	ldr r0, _023007A4 ; =0x02324D24
	mov r1, r6
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl sub_020236FC
	ldr r1, _023007A4 ; =0x02324D24
	ldr r0, _023007A8 ; =0x023225BC
	ldr r3, [r1, #4]
	mov r2, #2
	str r5, [r3, #0x458]
	ldr r3, [r1, #4]
	str r4, [r3, #0x45c]
	ldr r1, [r1, #4]
	str r2, [r1]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _023007A8 ; =0x023225BC
	bl sub_020348E4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023007A4: .word 0x02324D24
_023007A8: .word 0x023225BC
	arm_func_end ov11_02300728

	arm_func_start ov11_023007AC
ov11_023007AC: ; 0x023007AC
	stmdb sp!, {r3, lr}
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r1, _023007E8 ; =0x02324D24
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r0, _023007EC ; =0x023225CC
	bl CreateDBox
	ldr r1, _023007E8 ; =0x02324D24
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023007E8: .word 0x02324D24
_023007EC: .word 0x023225CC
	arm_func_end ov11_023007AC

	arm_func_start ov11_023007F0
ov11_023007F0: ; 0x023007F0
	stmdb sp!, {r3, lr}
	ldr r0, _02300848 ; =0x02324D24
	ldr r0, [r0]
	cmp r0, #0
	beq _02300824
	ldrsb r0, [r0]
	bl FreeDBox
	ldr r0, _02300848 ; =0x02324D24
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300848 ; =0x02324D24
	mov r1, #0
	str r1, [r0]
_02300824:
	ldr r0, _02300848 ; =0x02324D24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02300848 ; =0x02324D24
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300848: .word 0x02324D24
	arm_func_end ov11_023007F0

	arm_func_start ov11_0230084C
ov11_0230084C: ; 0x0230084C
	stmdb sp!, {r3, lr}
	ldr r0, _02300A20 ; =0x02324D24
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02300A18
_02300868: ; jump table
	b _02300880 ; case 0
	b _023008A4 ; case 1
	b _02300964 ; case 2
	b _02300990 ; case 3
	b _023009C4 ; case 4
	b _023009F4 ; case 5
_02300880:
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _02300A18
	mov r1, #1
	mov r0, #0
	str r1, [r3, #4]
	bl ov11_022E9BD0
	b _02300A18
_023008A4:
	ldr r2, [r0, #4]
	ldr r1, _02300A24 ; =0x00000408
	ldr r0, [r2, #0x45c]
	cmp r0, #0
	ldr r0, [r2]
	movge r1, #0x20
	cmp r0, #1
	beq _023008D0
	cmp r0, #2
	beq _023008EC
	b _02300904
_023008D0:
	ldr r2, _02300A20 ; =0x02324D24
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	add r3, r3, #8
	bl ShowMessageInDBox
	b _02300904
_023008EC:
	ldr r2, _02300A20 ; =0x02324D24
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	add r2, r3, #0x58
	add r3, r3, #8
	bl sub_0202F23C
_02300904:
	ldr r0, _02300A20 ; =0x02324D24
	ldmia r0, {r1, r2}
	ldr r2, [r2, #0x458]
	str r2, [r1, #8]
	ldmia r0, {r1, r2}
	ldr r2, [r2, #0x45c]
	str r2, [r1, #0xc]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x45c]
	cmp r1, #0
	blt _02300940
	ldr r0, [r0]
	mov r2, r1
	ldrsb r0, [r0]
	bl sub_0202F190
_02300940:
	ldr r0, _02300A20 ; =0x02324D24
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_022E9B84
	ldr r0, _02300A20 ; =0x02324D24
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_02300964:
	bl ov11_022E9F48
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =0x02324D24
	mov r2, #3
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F3F8
	b _02300A18
_02300990:
	ldrsb r0, [r3]
	bl IsDBoxActive
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =0x02324D24
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_022E9BD0
	ldr r0, _02300A20 ; =0x02324D24
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_023009C4:
	bl ov11_022E9F48
	cmp r0, #0
	bne _02300A18
	ldr r0, _02300A20 ; =0x02324D24
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02300A20 ; =0x02324D24
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02300A18
_023009F4:
	ldrsb r0, [r3]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	bne _02300A18
	mov r0, #0
	bl ov11_022E9B84
	mov r0, #4
	ldmia sp!, {r3, pc}
_02300A18:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300A20: .word 0x02324D24
_02300A24: .word 0x00000408
	arm_func_end ov11_0230084C

	arm_func_start ov11_02300A28
ov11_02300A28: ; 0x02300A28
	stmdb sp!, {r3, lr}
	ldr r0, _02300A5C ; =0x02324D2C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x460
	mov r1, #8
	bl MemAlloc
	ldr r1, _02300A5C ; =0x02324D2C
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300A5C: .word 0x02324D2C
	arm_func_end ov11_02300A28

	arm_func_start ov11_02300A60
ov11_02300A60: ; 0x02300A60
	stmdb sp!, {r3, lr}
	ldr r0, _02300AC4 ; =0x02324D2C
	ldr r1, [r0]
	ldr r0, [r0, #4]
	cmp r1, #0
	beq _02300A8C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	ldmia sp!, {r3, pc}
_02300A8C:
	cmp r0, #0
	beq _02300AA8
	ldr r0, [r0]
	cmp r0, #0
	beq _02300ABC
	mov r0, #1
	ldmia sp!, {r3, pc}
_02300AA8:
	ldr r0, _02300AC8 ; =0x023225DC
	bl sub_02034840
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02300ABC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300AC4: .word 0x02324D2C
_02300AC8: .word 0x023225DC
	arm_func_end ov11_02300A60

	arm_func_start ov11_02300ACC
ov11_02300ACC: ; 0x02300ACC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov11_02300A28
	ldr r0, _02300B48 ; =0x02324D2C
	mov r1, r7
	ldr r0, [r0, #4]
	add r0, r0, #0x58
	bl Strcpy
	ldr r0, _02300B48 ; =0x02324D2C
	mov r1, r6
	ldr r0, [r0, #4]
	add r0, r0, #8
	bl sub_020236FC
	ldr r1, _02300B48 ; =0x02324D2C
	ldr r0, _02300B4C ; =0x023225DC
	ldr r3, [r1, #4]
	mov r2, #2
	str r5, [r3, #0x458]
	ldr r3, [r1, #4]
	str r4, [r3, #0x45c]
	ldr r1, [r1, #4]
	str r2, [r1]
	bl sub_02034840
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02300B4C ; =0x023225DC
	bl sub_020348E4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02300B48: .word 0x02324D2C
_02300B4C: .word 0x023225DC
	arm_func_end ov11_02300ACC

	arm_func_start ov11_02300B50
ov11_02300B50: ; 0x02300B50
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _02300B94 ; =0x02324D2C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, _02300B98 ; =0x023225EC
	strb r2, [r1, #8]
	bl CreateDBox
	ldr r1, _02300B94 ; =0x02324D2C
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300B94: .word 0x02324D2C
_02300B98: .word 0x023225EC
	arm_func_end ov11_02300B50

	arm_func_start ov11_02300B9C
ov11_02300B9C: ; 0x02300B9C
	stmdb sp!, {r3, lr}
	ldr r0, _02300BF4 ; =0x02324D2C
	ldr r0, [r0]
	cmp r0, #0
	beq _02300BD0
	ldrsb r0, [r0]
	bl FreeDBox
	ldr r0, _02300BF4 ; =0x02324D2C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300BF4 ; =0x02324D2C
	mov r1, #0
	str r1, [r0]
_02300BD0:
	ldr r0, _02300BF4 ; =0x02324D2C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02300BF4 ; =0x02324D2C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300BF4: .word 0x02324D2C
	arm_func_end ov11_02300B9C

	arm_func_start ov11_02300BF8
ov11_02300BF8: ; 0x02300BF8
	stmdb sp!, {r3, lr}
	ldr r0, _02300D58 ; =0x02324D2C
	ldr r3, [r0]
	ldr r1, [r3, #4]
	cmp r1, #0
	beq _02300C24
	cmp r1, #1
	beq _02300CC8
	cmp r1, #2
	beq _02300D38
	b _02300D50
_02300C24:
	ldr r0, [r0, #4]
	ldr r2, [r0]
	cmp r2, #0
	beq _02300D50
	ldr r0, [r0, #0x458]
	mov r1, #0x218
	cmp r0, #0
	movge r1, #0x20
	cmp r2, #1
	beq _02300C58
	cmp r2, #2
	beq _02300C74
	b _02300C8C
_02300C58:
	ldr r2, _02300D58 ; =0x02324D2C
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	add r3, r3, #8
	bl ShowMessageInDBox
	b _02300C8C
_02300C74:
	ldr r2, _02300D58 ; =0x02324D2C
	ldrsb r0, [r3]
	ldr r3, [r2, #4]
	add r2, r3, #0x58
	add r3, r3, #8
	bl sub_0202F23C
_02300C8C:
	ldr r0, _02300D58 ; =0x02324D2C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x458]
	cmp r1, #0
	blt _02300CB0
	ldr r0, [r0]
	ldr r2, [r2, #0x45c]
	ldrsb r0, [r0]
	bl sub_0202F190
_02300CB0:
	ldr r0, _02300D58 ; =0x02324D2C
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #8]
	ldr r0, [r0]
	str r2, [r0, #4]
_02300CC8:
	ldr r0, _02300D58 ; =0x02324D2C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsDBoxActive
	ldr r1, _02300D58 ; =0x02324D2C
	cmp r0, #0
	ldr r2, [r1]
	strb r0, [r2, #8]
	bne _02300D50
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl sub_0202F16C
	cmp r0, #0x10
	cmpne r0, #0
	bne _02300D24
	ldr r0, _02300D58 ; =0x02324D2C
	mov r3, #2
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
	b _02300D50
_02300D24:
	ldr r0, _02300D58 ; =0x02324D2C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F2C4
	b _02300D50
_02300D38:
	ldrsb r0, [r3]
	bl sub_020282F4
	mvn r1, #5
	cmp r0, r1
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
_02300D50:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300D58: .word 0x02324D2C
	arm_func_end ov11_02300BF8

	arm_func_start ov11_02300D5C
ov11_02300D5C: ; 0x02300D5C
	stmdb sp!, {r3, lr}
	ldr r0, _02300D80 ; =0x0232260C
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _02300D84 ; =0x02324D34
	movne r1, #0
	strne r1, [r0, #8]
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300D80: .word 0x0232260C
_02300D84: .word 0x02324D34
	arm_func_end ov11_02300D5C

	arm_func_start ov11_02300D88
ov11_02300D88: ; 0x02300D88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x98
	bl GetGameMode
	mov r4, r0
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	add r2, r4, #0xff
	ldr r1, _02300ED8 ; =0x02324D34
	and r2, r2, #0xff
	cmp r2, #1
	str r0, [r1]
	ldrls r8, _02300EDC ; =0x02322684
	bls _02300DCC
	cmp r4, #3
	ldreq r8, _02300EE0 ; =0x02322654
	ldrne r8, _02300EE4 ; =0x0232262C
_02300DCC:
	ldr r0, _02300ED8 ; =0x02324D34
	mov fp, #1
	ldr r0, [r0]
	mov sb, r8
	add sl, r0, #8
	add r0, r4, #0xff
	mov r4, #0
	str sl, [sp, #0x60]
	and r6, r0, #0xff
	mov r5, r4
	mov r7, fp
	b _02300E5C
_02300DFC:
	ldr r0, [sb, #4]
	cmp r0, #2
	beq _02300E1C
	cmp r0, #3
	beq _02300E24
	cmp r0, #4
	beq _02300E2C
	b _02300E44
_02300E1C:
	bl ov11_02304AC4
	b _02300E48
_02300E24:
	mov r0, r7
	b _02300E48
_02300E2C:
	cmp r6, #1
	movhi r0, r4
	bhi _02300E48
	mov r0, r5
	bl ov11_0230488C
	b _02300E48
_02300E44:
	mov r0, fp
_02300E48:
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	strb r0, [sl], #1
	add sb, sb, #8
_02300E5C:
	ldrh r0, [sb]
	cmp r0, #0
	bne _02300DFC
	ldr r0, _02300EE8 ; =0x023225FC
	ldr r1, _02300EEC ; =0x00400213
	add r2, sp, #0
	mov r3, r8
	bl sub_0202A5CC
	ldr r2, _02300ED8 ; =0x02324D34
	mov r1, #0x13
	ldr r3, [r2]
	mov r2, #0
	strb r0, [r3]
	ldr r0, _02300EF0 ; =0x0232261C
	mov r3, #0x10000
	bl sub_0202FBBC
	ldr r1, _02300ED8 ; =0x02324D34
	ldr r1, [r1]
	strb r0, [r1, #1]
	bl ov11_022FEE94
	ldr r1, _02300ED8 ; =0x02324D34
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2, #2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #8]
	str r3, [r1, #4]
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02300ED8: .word 0x02324D34
_02300EDC: .word 0x02322684
_02300EE0: .word 0x02322654
_02300EE4: .word 0x0232262C
_02300EE8: .word 0x023225FC
_02300EEC: .word 0x00400213
_02300EF0: .word 0x0232261C
	arm_func_end ov11_02300D88

	arm_func_start ov11_02300EF4
ov11_02300EF4: ; 0x02300EF4
	stmdb sp!, {r3, lr}
	ldr r0, _02300F4C ; =0x02324D34
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202AABC
	ldr r0, _02300F4C ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_0202FD50
	ldr r0, _02300F4C ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF4C
	ldr r0, _02300F4C ; =0x02324D34
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02300F4C ; =0x02324D34
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02300F4C: .word 0x02324D34
	arm_func_end ov11_02300EF4

	arm_func_start ov11_02300F50
ov11_02300F50: ; 0x02300F50
	stmdb sp!, {r3, lr}
	ldr r0, _02301138 ; =0x02324D34
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02301130
_02300F6C: ; jump table
	b _02300F80 ; case 0
	b _02300FA4 ; case 1
	b _0230100C ; case 2
	b _02301060 ; case 3
	b _023010B0 ; case 4
_02300F80:
	bl ov11_0230D220
	cmp r0, #0
	bne _02301130
	bl ov11_0230D000
	ldr r0, _02301138 ; =0x02324D34
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_02300FA4:
	ldrsb r0, [r2]
	bl sub_0202AB60
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _02301138 ; =0x02324D34
	cmp r0, #1
	str r0, [r1, #8]
	ldr r0, [r1]
	movne r1, #2
	strne r1, [r0, #4]
	bne _02301130
	ldrsb r0, [r0, #1]
	bl sub_0202FD3C
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF24
	ldr r0, _02301138 ; =0x02324D34
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_0230100C:
	ldrsb r0, [r2]
	bl sub_0202AB40
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202AAA8
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_0202FD3C
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF24
	ldr r0, _02301138 ; =0x02324D34
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02301130
_02301060:
	ldrsb r0, [r2]
	bl sub_0202AB40
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_0202FD6C
	cmp r0, #0
	bne _02301130
	ldr r0, _02301138 ; =0x02324D34
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ov11_022FEF84
	cmp r0, #0
	ldreq r0, _02301138 ; =0x02324D34
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02301130
_023010B0:
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0, #8]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230111C
_023010C8: ; jump table
	b _0230111C ; case 0
	b _0230111C ; case 1
	b _023010E8 ; case 2
	b _023010F4 ; case 3
	b _02301100 ; case 4
	b _02301110 ; case 5
	b _0230111C ; case 6
	b _0230111C ; case 7
_023010E8:
	bl ov11_02304AE0
	mov r0, #4
	ldmia sp!, {r3, pc}
_023010F4:
	bl ov11_02304BC4
	mov r0, #4
	ldmia sp!, {r3, pc}
_02301100:
	mov r0, #0
	bl ov11_023048AC
	mov r0, #4
	ldmia sp!, {r3, pc}
_02301110:
	bl ov11_02301174
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230111C:
	ldr r1, _02301138 ; =0x02324D34
	mov r0, #4
	ldr r2, [r1, #8]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
_02301130:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301138: .word 0x02324D34
	arm_func_end ov11_02300F50

	arm_func_start ov11_0230113C
ov11_0230113C: ; 0x0230113C
	ldr r1, _02301148 ; =0x02324D34
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_02301148: .word 0x02324D34
	arm_func_end ov11_0230113C

	arm_func_start ov11_0230114C
ov11_0230114C: ; 0x0230114C
	ldr r1, _02301170 ; =0x02324D34
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02301170: .word 0x02324D34
	arm_func_end ov11_0230114C

	arm_func_start ov11_02301174
ov11_02301174: ; 0x02301174
	stmdb sp!, {r3, lr}
	ldr r0, _02301194 ; =0x023226C4
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _02301198 ; =0x02324D40
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301194: .word 0x023226C4
_02301198: .word 0x02324D40
	arm_func_end ov11_02301174

	arm_func_start ov11_0230119C
ov11_0230119C: ; 0x0230119C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _0230120C ; =0x02324D40
	ldr r4, _02301210 ; =0x00000227
	str r0, [r1, #4]
	mov lr, #0x10
	mov ip, #0
	ldr r0, _02301214 ; =0x023226B4
	ldr r1, _02301218 ; =0x00001813
	ldr r3, _0230121C ; =0x023226D4
	add r2, sp, #0
	strh r4, [sp, #8]
	str lr, [sp, #0xc]
	str ip, [sp]
	bl sub_0202A5CC
	ldr r1, _0230120C ; =0x02324D40
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230120C: .word 0x02324D40
_02301210: .word 0x00000227
_02301214: .word 0x023226B4
_02301218: .word 0x00001813
_0230121C: .word 0x023226D4
	arm_func_end ov11_0230119C

	arm_func_start ov11_02301220
ov11_02301220: ; 0x02301220
	stmdb sp!, {r3, lr}
	ldr r0, _02301258 ; =0x02324D40
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202AABC
	ldr r0, _02301258 ; =0x02324D40
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02301258 ; =0x02324D40
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301258: .word 0x02324D40
	arm_func_end ov11_02301220

	arm_func_start ov11_0230125C
ov11_0230125C: ; 0x0230125C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x130
	ldr r0, _02301398 ; =0x02324D40
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _0230128C
	cmp r1, #1
	beq _023012AC
	cmp r1, #2
	beq _023012E4
	b _0230138C
_0230128C:
	ldrsb r0, [r2]
	bl sub_0202AB60
	cmp r0, #0
	ldreq r0, _02301398 ; =0x02324D40
	moveq r1, #1
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _0230138C
_023012AC:
	ldrsb r0, [r2]
	bl sub_0202AB40
	cmp r0, #0
	bne _0230138C
	ldr r0, _02301398 ; =0x02324D40
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _02301398 ; =0x02324D40
	mov r2, #2
	str r0, [r1]
	ldr r0, [r1, #4]
	str r2, [r0, #4]
	b _0230138C
_023012E4:
	mov r1, #3
	str r1, [r2, #4]
	ldr r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230137C
_023012FC: ; jump table
	b _0230137C ; case 0
	b _0230131C ; case 1
	b _02301328 ; case 2
	b _0230134C ; case 3
	b _0230137C ; case 4
	b _0230137C ; case 5
	b _0230137C ; case 6
	b _02301370 ; case 7
_0230131C:
	bl ov11_02300D5C
	mov r0, #4
	b _02301390
_02301328:
	ldr r3, _0230139C ; =ov11_023013A0
	mov r2, #0
	add r1, sp, #0x98
	mov r0, #0x100
	str r3, [sp, #0x11c]
	str r2, [sp, #0x120]
	bl sub_0203559C
	mov r0, #4
	b _02301390
_0230134C:
	ldr r3, _0230139C ; =ov11_023013A0
	mov r0, #0
	add r2, sp, #0
	mov r1, #0x100
	str r3, [sp, #0x84]
	str r0, [sp, #0x88]
	bl sub_02035CE4
	mov r0, #4
	b _02301390
_02301370:
	bl ov11_0230A07C
	mov r0, #4
	b _02301390
_0230137C:
	mov r0, #1
	bl ov11_0230113C
	mov r0, #4
	b _02301390
_0230138C:
	mov r0, #1
_02301390:
	add sp, sp, #0x130
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301398: .word 0x02324D40
_0230139C: .word ov11_023013A0
	arm_func_end ov11_0230125C

	arm_func_start ov11_023013A0
ov11_023013A0: ; 0x023013A0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	beq _023013B8
	mov r0, #1
	bl ov11_0230113C
	ldmia sp!, {r3, pc}
_023013B8:
	ldr r0, _023013D4 ; =0x023226C4
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _023013D8 ; =0x02324D40
	movne r1, #0
	strne r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023013D4: .word 0x023226C4
_023013D8: .word 0x02324D40
	arm_func_end ov11_023013A0

	arm_func_start ov11_023013DC
ov11_023013DC: ; 0x023013DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x258
	mov r1, #6
	bl MemAlloc
	ldr r1, _023014A8 ; =0x02324D48
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #0x1c]
	ldr r0, [r1]
	str r2, [r0, #0x184]
	ldr r0, [r1]
	str r2, [r0, #0xc]
	ldr r0, [r1]
	add r0, r0, #0x188
	bl InitPreprocessorArgs
	ldr r1, _023014A8 ; =0x02324D48
	ldrsh r2, [r5, #4]
	ldr r0, [r1]
	cmp r4, #0
	add r0, r0, #0x200
	strh r2, [r0, #0x4c]
	ldrb r2, [r5, #1]
	ldr r0, [r1]
	str r2, [r0, #0x250]
	ldreq r0, [r1]
	mov r2, #0
	streqb r2, [r0, #0x24]
	beq _02301468
	ldrb r0, [r5, #2]
	ldr r3, [r1]
	strb r0, [r3, #0x24]
	ldrb r0, [r5, #3]
	strb r0, [r3, #0x25]
_02301468:
	ldr r0, [r1]
	mvn r3, #1
	strb r2, [r0, #0x25]
	ldr r2, _023014A8 ; =0x02324D48
	mov r0, #0
	ldr r4, [r2]
	add r1, r4, #0x200
	ldrsh r1, [r1, #0x4c]
	str r1, [r4, #0x188]
	ldr r1, [r2]
	strb r3, [r1, #0x254]
	ldr r1, [r2]
	strb r3, [r1, #0x255]
	bl ov11_023014AC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023014A8: .word 0x02324D48
	arm_func_end ov11_023013DC

	arm_func_start ov11_023014AC
ov11_023014AC: ; 0x023014AC
	stmdb sp!, {r3, lr}
	ldr r3, _02301A10 ; =0x02324D48
	ldr r1, [r3]
	str r0, [r1]
	ldr r2, [r3]
	ldr r0, [r2]
	cmp r0, #0x16
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_023014D0: ; jump table
	b _0230152C ; case 0
	b _023015BC ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _023015F0 ; case 3
	b _02301618 ; case 4
	b _023017B4 ; case 5
	b _0230187C ; case 6
	b _023015D8 ; case 7
	b _023016E8 ; case 8
	b _02301680 ; case 9
	b _02301780 ; case 10
	ldmia sp!, {r3, pc} ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	b _02301658 ; case 14
	ldmia sp!, {r3, pc} ; case 15
	ldmia sp!, {r3, pc} ; case 16
	b _0230191C ; case 17
	b _02301938 ; case 18
	b _023019A0 ; case 19
	b _023019DC ; case 20
	b _023019F8 ; case 21
	b _02301A04 ; case 22
_0230152C:
	add r0, r2, #0x200
	ldrsb r1, [r0, #0x54]
	mvn r0, #1
	cmp r1, r0
	bne _02301554
	mov r0, #0
	bl CreateDBox
	ldr r1, _02301A10 ; =0x02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x254]
_02301554:
	ldr r0, _02301A10 ; =0x02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	cmp r1, #0x214
	bne _0230157C
	mov r0, #8
	str r0, [r2]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230157C:
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x6e
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r0, _02301A10 ; =0x02324D48
	ldr r2, _02301A14 ; =0x000002A5
	ldr ip, [r0]
	mov r1, #8
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_023015BC:
	bl ov11_02302618
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_023015D8:
	mov r1, #2
	str r1, [r2, #0x20]
	ldr r0, [r3]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_023015F0:
	ldr r0, _02301A18 ; =0x023226FC
	mov r2, #0
	ldr r1, _02301A1C ; =0x00300011
	ldr r3, _02301A20 ; =0x0232271C
	str r2, [sp]
	bl CreateNormalMenu
	ldr r1, _02301A10 ; =0x02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301618:
	mov r0, #0xc
	str r0, [r2]
	ldr r0, [r3]
	mov r1, #0xe
	str r1, [r0, #4]
	ldr ip, [r3]
	ldr r2, _02301A24 ; =0x0000038F
	ldrsh r0, [ip, #0x14]
	mov r1, #8
	str r0, [ip, #0x19c]
	ldr r3, [r3]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_02301658:
	ldr r0, _02301A18 ; =0x023226FC
	mov r2, #0
	ldr r1, _02301A1C ; =0x00300011
	ldr r3, _02301A20 ; =0x0232271C
	str r2, [sp]
	bl CreateNormalMenu
	ldr r1, _02301A10 ; =0x02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301680:
	add r0, r2, #0x1d8
	bl sub_0206351C
	ldr r1, _02301A10 ; =0x02324D48
	mov ip, #6
	ldr r2, [r1]
	ldr r3, _02301A28 ; =0x023226F4
	add r0, r2, #0x200
	ldrsh lr, [r0, #0x4c]
	add r0, r2, #0x100
	mov r2, #0
	strh lr, [r0, #0xfc]
	ldr r0, [r1]
	strb ip, [r0, #0x1da]
	ldr ip, [r1]
	str r3, [sp]
	add r0, ip, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, ip, #0x204
	add r3, ip, #0x24
	bl sub_02052E2C
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x204
	bl ov11_023061E4
	ldmia sp!, {r3, pc}
_023016E8:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _02301730
	ldr r0, _02301A10 ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02301730
	mov r0, #5
	str r0, [r1]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301730:
	ldr r0, _02301A10 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301768
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301768:
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301780:
	mov r0, #0xc
	str r0, [r2]
	ldr r0, [r3]
	mov r1, #0
	str r1, [r0, #4]
	ldr r2, [r3]
	mov r1, #0x18
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r2, #0x188
	mov r2, #0x3a4
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_023017B4:
	mov r1, #1
	mov r0, #0x214
	str r1, [r2, #0x20]
	bl sub_020558F4
	mvn r1, #0
	cmp r0, r1
	bne _02301804
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #0
	ldr r2, [r0]
	ldr r3, _02301A28 ; =0x023226F4
	str r1, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301A10 ; =0x02324D48
	b _0230180C
_02301804:
	bl GetTeamMember
	ldr r1, _02301A10 ; =0x02324D48
_0230180C:
	ldr r1, [r1]
	str r0, [r1, #0x248]
	ldr r0, _02301A10 ; =0x02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301A10 ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
	bl SpecialStrcpy
	ldr r0, _02301A10 ; =0x02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_020544C8
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230187C:
	mov r0, #1
	str r0, [r2, #0x20]
	ldr r2, [r3]
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	ldr r3, _02301A28 ; =0x023226F4
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301A10 ; =0x02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301A10 ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
	bl SpecialStrcpy
	ldr r0, _02301A10 ; =0x02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_020544C8
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_0230191C:
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02301A10 ; =0x02324D48
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
_02301938:
	bl ov11_02310BDC
	ldr r0, _02301A10 ; =0x02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x4e
	str r3, [r1, #4]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r3, #0x6e
	bl GetNameWithGender
	ldr r0, _02301A10 ; =0x02324D48
	ldr r2, _02301A2C ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x18
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_023019A0:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl FreeDBox
	ldr r1, _02301A10 ; =0x02324D48
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x254]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x6e
	add r1, r3, #0x100
	add r3, r3, #0x100
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_023019DC:
	add r0, r2, #0x6e
	add r1, r2, #0x46
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_023019F8:
	mov r0, #0
	str r0, [r2, #0xc]
	ldmia sp!, {r3, pc}
_02301A04:
	add r0, r2, #0x26
	bl sub_0203909C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301A10: .word 0x02324D48
_02301A14: .word 0x000002A5
_02301A18: .word 0x023226FC
_02301A1C: .word 0x00300011
_02301A20: .word 0x0232271C
_02301A24: .word 0x0000038F
_02301A28: .word 0x023226F4
_02301A2C: .word 0x000003A3
	arm_func_end ov11_023014AC

	arm_func_start ov11_02301A30
ov11_02301A30: ; 0x02301A30
	stmdb sp!, {r3, lr}
	ldr r0, _02301F8C ; =0x02324D48
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_02301A4C: ; jump table
	b _02301AA8 ; case 0
	b _02301B38 ; case 1
	ldmia sp!, {r3, pc} ; case 2
	b _02301B6C ; case 3
	b _02301B94 ; case 4
	b _02301D30 ; case 5
	b _02301DF8 ; case 6
	b _02301B54 ; case 7
	b _02301C64 ; case 8
	b _02301BFC ; case 9
	b _02301CFC ; case 10
	ldmia sp!, {r3, pc} ; case 11
	ldmia sp!, {r3, pc} ; case 12
	ldmia sp!, {r3, pc} ; case 13
	b _02301BD4 ; case 14
	ldmia sp!, {r3, pc} ; case 15
	ldmia sp!, {r3, pc} ; case 16
	b _02301E98 ; case 17
	b _02301EB4 ; case 18
	b _02301F1C ; case 19
	b _02301F58 ; case 20
	b _02301F74 ; case 21
	b _02301F80 ; case 22
_02301AA8:
	add r0, r2, #0x200
	ldrsb r1, [r0, #0x54]
	mvn r0, #1
	cmp r1, r0
	bne _02301AD0
	mov r0, #0
	bl CreateDBox
	ldr r1, _02301F8C ; =0x02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x254]
_02301AD0:
	ldr r0, _02301F8C ; =0x02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	cmp r1, #0x214
	bne _02301AF8
	mov r0, #8
	str r0, [r2]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301AF8:
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x6e
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r0, _02301F8C ; =0x02324D48
	ldr r2, _02301F90 ; =0x000002A5
	ldr ip, [r0]
	mov r1, #8
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_02301B38:
	bl ov11_02302618
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301B54:
	mov r1, #2
	str r1, [r2, #0x20]
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301B6C:
	ldr r0, _02301F94 ; =0x023226FC
	mov r2, #0
	ldr r1, _02301F98 ; =0x00300011
	ldr r3, _02301F9C ; =0x0232271C
	str r2, [sp]
	bl CreateNormalMenu
	ldr r1, _02301F8C ; =0x02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301B94:
	mov r1, #0xc
	str r1, [r2]
	ldr r1, [r0]
	mov r2, #0xe
	str r2, [r1, #4]
	ldr ip, [r0]
	ldr r2, _02301FA0 ; =0x0000038F
	ldrsh r3, [ip, #0x14]
	mov r1, #8
	str r3, [ip, #0x19c]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_02301BD4:
	ldr r0, _02301F94 ; =0x023226FC
	mov r2, #0
	ldr r1, _02301F98 ; =0x00300011
	ldr r3, _02301F9C ; =0x0232271C
	str r2, [sp]
	bl CreateNormalMenu
	ldr r1, _02301F8C ; =0x02324D48
	ldr r1, [r1]
	strb r0, [r1, #0x255]
	ldmia sp!, {r3, pc}
_02301BFC:
	add r0, r2, #0x1d8
	bl sub_0206351C
	ldr r1, _02301F8C ; =0x02324D48
	mov ip, #6
	ldr r2, [r1]
	ldr r3, _02301FA4 ; =0x023226F4
	add r0, r2, #0x200
	ldrsh lr, [r0, #0x4c]
	add r0, r2, #0x100
	mov r2, #0
	strh lr, [r0, #0xfc]
	ldr r0, [r1]
	strb ip, [r0, #0x1da]
	ldr ip, [r1]
	str r3, [sp]
	add r0, ip, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, ip, #0x204
	add r3, ip, #0x24
	bl sub_02052E2C
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x204
	bl ov11_023061E4
	ldmia sp!, {r3, pc}
_02301C64:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	beq _02301CAC
	ldr r0, _02301F8C ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02301CAC
	mov r0, #5
	str r0, [r1]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CAC:
	ldr r0, _02301F8C ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02301CE4
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CE4:
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301CFC:
	mov r1, #0xc
	str r1, [r2]
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1, #4]
	ldr r2, [r0]
	mov r1, #0x18
	add r0, r2, #0x200
	add r3, r2, #0x188
	ldrsb r0, [r0, #0x54]
	mov r2, #0x3a4
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_02301D30:
	mov r1, #1
	mov r0, #0x214
	str r1, [r2, #0x20]
	bl sub_020558F4
	mvn r1, #0
	cmp r0, r1
	bne _02301D80
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #0
	ldr r2, [r0]
	ldr r3, _02301FA4 ; =0x023226F4
	str r1, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301F8C ; =0x02324D48
	b _02301D88
_02301D80:
	bl GetTeamMember
	ldr r1, _02301F8C ; =0x02324D48
_02301D88:
	ldr r1, [r1]
	str r0, [r1, #0x248]
	ldr r0, _02301F8C ; =0x02324D48
	ldr r2, [r0]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301F8C ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
	bl SpecialStrcpy
	ldr r0, _02301F8C ; =0x02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_020544C8
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301DF8:
	mov r1, #1
	str r1, [r2, #0x20]
	ldr r2, [r0]
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0x200
	add r1, r2, #0x6e
	ldrsh r0, [r0, #0x4c]
	ldr r3, _02301FA4 ; =0x023226F4
	add r1, r1, #0x100
	add r2, r2, #0x24
	bl sub_02055DD0
	ldr r1, _02301F8C ; =0x02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _02301F8C ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
	bl SpecialStrcpy
	ldr r0, _02301F8C ; =0x02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_020544C8
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_02301A30
	ldmia sp!, {r3, pc}
_02301E98:
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02301F8C ; =0x02324D48
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
_02301EB4:
	bl ov11_02310BDC
	ldr r0, _02301F8C ; =0x02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x19
	str r2, [r1, #0xc]
	ldr r1, [r0]
	mov r2, #0x4e
	str r3, [r1, #4]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r3, #0x6e
	bl GetNameWithGender
	ldr r0, _02301F8C ; =0x02324D48
	ldr r2, _02301FA8 ; =0x000003A3
	ldr ip, [r0]
	mov r1, #0x18
	add r3, ip, #0x6e
	str r3, [ip, #0x1c0]
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrsb r0, [r0, #0x54]
	add r3, r3, #0x188
	bl ShowMessageInDBox
	ldmia sp!, {r3, pc}
_02301F1C:
	add r0, r2, #0x200
	ldrsb r0, [r0, #0x54]
	bl FreeDBox
	ldr r1, _02301F8C ; =0x02324D48
	mvn r3, #1
	ldr r2, [r1]
	mov r0, #2
	strb r3, [r2, #0x254]
	ldr r1, [r1]
	mov r2, #0
	add r3, r1, #0x6e
	add r1, r3, #0x100
	add r3, r3, #0x100
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_02301F58:
	add r0, r2, #0x6e
	add r1, r2, #0x46
	add r3, r0, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	ldmia sp!, {r3, pc}
_02301F74:
	mov r0, #0
	str r0, [r2, #0xc]
	ldmia sp!, {r3, pc}
_02301F80:
	add r0, r2, #0x26
	bl sub_0203909C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301F8C: .word 0x02324D48
_02301F90: .word 0x000002A5
_02301F94: .word 0x023226FC
_02301F98: .word 0x00300011
_02301F9C: .word 0x0232271C
_02301FA0: .word 0x0000038F
_02301FA4: .word 0x023226F4
_02301FA8: .word 0x000003A3
	arm_func_end ov11_02301A30

	arm_func_start ov11_02301FAC
ov11_02301FAC: ; 0x02301FAC
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02302000 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDBoxActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02302000 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDBox
	ldr r0, _02302000 ; =0x02324D48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov11_023014AC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302000: .word 0x02324D48
	arm_func_end ov11_02301FAC

	arm_func_start ov11_02302004
ov11_02302004: ; 0x02302004
	stmdb sp!, {r3, lr}
	ldr r0, _0230202C ; =0x02324D48
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230202C ; =0x02324D48
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230202C: .word 0x02324D48
	arm_func_end ov11_02302004

	arm_func_start ov11_02302030
ov11_02302030: ; 0x02302030
	stmdb sp!, {r4, lr}
	ldr r1, _023025E4 ; =0x02324D48
	ldr r0, [r1]
	ldr r2, [r0, #0x184]
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _023025DC
_0230204C: ; jump table
	b _0230205C ; case 0
	b _02302068 ; case 1
	b _023025A4 ; case 2
	b _023025CC ; case 3
_0230205C:
	mov r1, #1
	str r1, [r0, #0x184]
	b _023025DC
_02302068:
	ldr r2, [r0]
	cmp r2, #0x19
	addls pc, pc, r2, lsl #2
	b _02302550
_02302078: ; jump table
	b _023020E0 ; case 0
	b _02302550 ; case 1
	b _023022D4 ; case 2
	b _02302114 ; case 3
	b _0230228C ; case 4
	b _02302550 ; case 5
	b _02302550 ; case 6
	b _02302550 ; case 7
	b _02302550 ; case 8
	b _023021A4 ; case 9
	b _02302550 ; case 10
	b _023022E0 ; case 11
	b _02302550 ; case 12
	b _02302550 ; case 13
	b _0230228C ; case 14
	b _02302480 ; case 15
	b _023024C4 ; case 16
	b _023024EC ; case 17
	b _02302504 ; case 18
	b _0230232C ; case 19
	b _0230232C ; case 20
	b _02302390 ; case 21
	b _023023B8 ; case 22
	b _02302460 ; case 23
	b _02302378 ; case 24
	b _0230250C ; case 25
_023020E0:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDBoxActive
	cmp r0, #0
	bne _02302554
	mov r0, #3
	bl ov11_023014AC
	ldr r0, _023025E4 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDBox
	b _02302554
_02302114:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _02302170
	cmp r0, #4
	beq _0230213C
	cmp r0, #5
	beq _02302170
	b _02302554
_0230213C:
	ldr r0, _023025E4 ; =0x02324D48
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	bl ov11_02302618
	ldr r0, _023025E4 ; =0x02324D48
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0xf
	str r3, [r2, #0xc]
	ldr r0, [r0]
	str r1, [r0]
	b _02302554
_02302170:
	bl ov11_02302618
	ldr r0, _023025E4 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02302198
	mov r0, #0xa
	bl ov11_023014AC
	b _02302554
_02302198:
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023021A4:
	bl ov11_02306C9C
	cmp r0, #3
	beq _023021D4
	cmp r0, #4
	bne _02302554
	bl ov11_02306C64
	ldr r1, _023025E4 ; =0x02324D48
	ldr r1, [r1]
	str r0, [r1, #0x248]
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023021D4:
	bl ov11_02306C64
	ldr r1, _023025E4 ; =0x02324D48
	ldr r2, [r1]
	str r0, [r2, #0x248]
	ldr r2, [r1]
	ldr r0, [r2, #0x248]
	cmp r0, #0
	bne _0230221C
	add r0, r2, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #0x214
	bne _02302210
	mov r0, #0xa
	bl ov11_023014AC
	b _02302554
_02302210:
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_0230221C:
	mov r0, #1
	str r0, [r2, #0x20]
	ldr r2, [r1]
	add r0, r2, #0x200
	ldrsh r1, [r0, #0x4c]
	add r0, r2, #0x5a
	bl GetNameRaw
	ldr r0, _023025E4 ; =0x02324D48
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x5a
	bl SpecialStrcpy
	ldr r0, _023025E4 ; =0x02324D48
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x250]
	ldr r0, [r0, #0x248]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_020544C8
	ldr r0, _023025E4 ; =0x02324D48
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	str r2, [r1, #0xc]
	bl ov11_023014AC
	b _02302554
_0230228C:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _023022C4
	cmp r0, #4
	beq _023022B4
	cmp r0, #5
	beq _023022C4
	b _02302554
_023022B4:
	bl ov11_02302618
	mov r0, #8
	bl ov11_023014AC
	b _02302554
_023022C4:
	bl ov11_02302618
	mov r0, #7
	bl ov11_023014AC
	b _02302554
_023022D4:
	bl ov11_0230D71C
	mov r0, #3
	b _02302558
_023022E0:
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl IsDBoxActive
	cmp r0, #0
	bne _02302554
	ldr r0, _023025E4 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl ShowDBox
	ldr r0, _023025E4 ; =0x02324D48
	mov r2, #0x1a
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _02302554
_0230232C:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02302554
	bl GetKeyboardStringResult
	ldr r1, _023025E4 ; =0x02324D48
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x26
	mov r2, #0x10
	bl StrncpySimpleNoPadSafe
	ldr r0, _023025E4 ; =0x02324D48
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x46
	bl StrcpySimple
	mov r0, #0x18
	bl ov11_023014AC
	b _02302554
_02302378:
	bl sub_02037468
	cmp r0, #0
	beq _02302554
	mov r0, #0x15
	bl ov11_023014AC
	b _02302554
_02302390:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	ble _02302554
	mov r0, #0x16
	bl ov11_023014AC
	b _02302554
_023023B8:
	bl sub_0203931C
	cmp r0, #0
	bne _0230243C
	ldr r0, _023025E4 ; =0x02324D48
	mov r2, #1
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r1, [r0]
	add r0, r1, #0x6e
	add r0, r0, #0x100
	add r1, r1, #0x46
	bl StrcpySimple
	ldr r0, _023025E4 ; =0x02324D48
	mov r2, #0xa
	ldr r1, [r0]
	ldr r0, [r1, #0x248]
	add r1, r1, #0x6e
	add r0, r0, #0x3a
	add r1, r1, #0x100
	bl StrncpySimple
	ldr r0, _023025E4 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	bl sub_02065BC8
	ldr r0, _023025E4 ; =0x02324D48
	mov r1, #0xf
	ldr r0, [r0]
	add r0, r0, #0x46
	bl sub_02065C08
	mov r0, #0x17
	bl ov11_023014AC
	b _02302554
_0230243C:
	cmp r0, #1
	bne _02302554
	ldr r0, _023025E4 ; =0x02324D48
	mov r2, #0x14
	ldr r1, [r0]
	mov r0, #0x17
	str r2, [r1, #8]
	bl ov11_023014AC
	b _02302554
_02302460:
	bl sub_02039218
	cmp r0, #0
	beq _02302554
	ldr r0, _023025E4 ; =0x02324D48
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_023014AC
	b _02302554
_02302480:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	cmpne r0, #2
	beq _02302554
	cmp r0, #3
	bne _02302554
	ldr r0, [r1, #4]
	bl ov11_023014AC
	ldr r0, _023025E4 ; =0x02324D48
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _02302554
_023024C4:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	ble _02302554
	mov r0, #0x11
	bl ov11_023014AC
	b _02302554
_023024EC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02302554
	mov r0, #0x12
	bl ov11_023014AC
	b _02302554
_02302504:
	bl ov11_02301FAC
	b _02302554
_0230250C:
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _02302534
	cmp r0, #0xa
	beq _02302544
	b _02302554
_02302534:
	add r0, r1, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _02302554
_02302544:
	mov r0, #0x13
	bl ov11_023014AC
	b _02302554
_02302550:
	bl ov11_02301FAC
_02302554:
	mov r0, #0
_02302558:
	cmp r0, #3
	bne _023025DC
	ldr r0, _023025E4 ; =0x02324D48
	mov r3, #2
	ldr r2, [r0]
	sub r1, r3, #4
	str r3, [r2, #0x184]
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	cmp r0, r1
	beq _023025DC
	bl sub_0202836C
	ldr r0, _023025E4 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	bl sub_0202F2C4
	b _023025DC
_023025A4:
	mov r2, #3
	str r2, [r0, #0x184]
	ldr r0, [r1]
	sub r1, r2, #5
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x54]
	cmp r0, r1
	beq _023025DC
	bl FreeDBox
	b _023025DC
_023025CC:
	ldr r0, [r0, #0x20]
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r4, pc}
_023025DC:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_023025E4: .word 0x02324D48
	arm_func_end ov11_02302030

	arm_func_start ov11_023025E8
ov11_023025E8: ; 0x023025E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02302614 ; =0x0232270C
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov11_023013DC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302614: .word 0x0232270C
	arm_func_end ov11_023025E8

	arm_func_start ov11_02302618
ov11_02302618: ; 0x02302618
	stmdb sp!, {r3, lr}
	ldr r0, _02302664 ; =0x02324D48
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02302664 ; =0x02324D48
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsb r0, [r0, #0x55]
	bl FreeNormalMenu
	ldr r0, _02302664 ; =0x02324D48
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x255]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302664: .word 0x02324D48
	arm_func_end ov11_02302618

	arm_func_start ov11_02302668
ov11_02302668: ; 0x02302668
	stmdb sp!, {r3, lr}
	ldr r0, _02302844 ; =0x02324D4C
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _023027D0
_02302684: ; jump table
	b _023027D0 ; case 0
	b _02302744 ; case 1
	b _0230283C ; case 2
	b _023027D0 ; case 3
	b _023027D0 ; case 4
	b _023027D0 ; case 5
	b _023027D0 ; case 6
	b _023026B8 ; case 7
	b _0230274C ; case 8
	b _023027D0 ; case 9
	b _023027D0 ; case 10
	b _023027D0 ; case 11
	b _0230278C ; case 12
_023026B8:
	bl ov11_02305B98
	cmp r0, #1
	beq _0230283C
	ldr r0, _02302844 ; =0x02324D4C
	ldr r0, [r0]
	add r0, r0, #0xfe
	bl ov11_02305B40
	cmp r0, #3
	beq _023026E8
	cmp r0, #5
	beq _0230271C
	b _0230283C
_023026E8:
	ldr r1, _02302844 ; =0x02324D4C
	mov r3, #1
	ldr r0, [r1]
	ldr r2, _02302848 ; =0x00000276
	str r3, [r0, #0x20]
	ldr ip, [r1]
	mov r0, #4
	ldrsh r3, [ip, #0xfe]
	str r3, [ip, #0x44]
	ldr r1, [r1]
	str r2, [r1, #0xf8]
	bl ov11_02302850
	b _0230283C
_0230271C:
	ldr r0, _02302844 ; =0x02324D4C
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _0230284C ; =0x00000287
	str r3, [r1, #0x20]
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0xf8]
	bl ov11_02302850
	b _0230283C
_02302744:
	mov r0, #3
	ldmia sp!, {r3, pc}
_0230274C:
	ldrsb r0, [r2, #0xfc]
	bl IsDBoxActive
	cmp r0, #0
	bne _0230283C
	ldr r0, _02302844 ; =0x02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl ShowDBox
	ldr r0, _02302844 ; =0x02324D4C
	mov r2, #0xd
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl sub_0202F2C4
	b _0230283C
_0230278C:
	ldr r1, [r2, #0xc]
	add r1, r1, #1
	str r1, [r2, #0xc]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	cmpne r0, #2
	beq _0230283C
	cmp r0, #3
	bne _0230283C
	ldr r0, [r1, #4]
	bl ov11_02302850
	ldr r0, _02302844 ; =0x02324D4C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xc]
	b _0230283C
_023027D0:
	ldrsb r0, [r2, #0xfc]
	bl IsDBoxActive
	cmp r0, #0
	bne _0230283C
	ldr r0, _02302844 ; =0x02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl ShowDBox
	ldr r0, _02302844 ; =0x02324D4C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	cmp r0, r1
	beq _0230282C
	bl sub_0202F2C4
	ldr r0, _02302844 ; =0x02324D4C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xfc]
	bl FreeDBox
	ldr r0, _02302844 ; =0x02324D4C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xfc]
_0230282C:
	ldr r0, _02302844 ; =0x02324D4C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov11_02302850
_0230283C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302844: .word 0x02324D4C
_02302848: .word 0x00000276
_0230284C: .word 0x00000287
	arm_func_end ov11_02302668

	arm_func_start ov11_02302850
ov11_02302850: ; 0x02302850
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r1, _02302A44 ; =0x02324D4C
	ldr r2, [r1]
	str r0, [r2]
	ldr ip, [r1]
	ldr r0, [ip]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_02302878: ; jump table
	b _023028A8 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302998 ; case 4
	b _023028B4 ; case 5
	b _023028EC ; case 6
	b _023028C0 ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_023028A8:
	mov r0, #1
	str r0, [ip]
	b _02302A3C
_023028B4:
	mov r0, #1
	str r0, [ip, #4]
	b _02302A3C
_023028C0:
	ldr r0, [ip, #0xf4]
	ldrsh r1, [ip, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #0
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_023028EC:
	mov r2, #7
	str r2, [ip]
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_02302908: ; jump table
	b _02302938 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302988 ; case 4
	b _02302944 ; case 5
	b _0230297C ; case 6
	b _02302950 ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_02302938:
	mov r0, #1
	str r0, [r1]
	b _02302A3C
_02302944:
	mov r0, #1
	str r0, [r1, #4]
	b _02302A3C
_02302950:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #6
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #6
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_0230297C:
	str r2, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302988:
	mov r0, #0
	str r0, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302998:
	mov r3, #0
	str r3, [ip]
	ldr r1, [r1]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302A3C
_023029B4: ; jump table
	b _023029E4 ; case 0
	b _02302A3C ; case 1
	b _02302A3C ; case 2
	b _02302A3C ; case 3
	b _02302A34 ; case 4
	b _023029F0 ; case 5
	b _02302A24 ; case 6
	b _023029FC ; case 7
	b _02302A3C ; case 8
	b _02302A3C ; case 9
	b _02302A3C ; case 10
	b _02302A3C ; case 11
_023029E4:
	mov r0, #1
	str r0, [r1]
	b _02302A3C
_023029F0:
	mov r0, #1
	str r0, [r1, #4]
	b _02302A3C
_023029FC:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0xc
	mov r2, r2, asr #0x10
	bl sub_0200CF6C
	add r0, sp, #0xc
	mov r1, #0
	bl ov11_02304CAC
	b _02302A3C
_02302A24:
	mov r0, #7
	str r0, [r1]
	bl ov11_02302A48
	b _02302A3C
_02302A34:
	str r3, [r1]
	bl ov11_02302A48
_02302A3C:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02302A44: .word 0x02324D4C
	arm_func_end ov11_02302850

	arm_func_start ov11_02302A48
ov11_02302A48: ; 0x02302A48
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _02302C34 ; =0x02324D4C
	ldr ip, [r0]
	ldr r1, [ip]
	cmp r1, #0xb
	addls pc, pc, r1, lsl #2
	b _02302C2C
_02302A68: ; jump table
	b _02302A98 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302B88 ; case 4
	b _02302AA4 ; case 5
	b _02302ADC ; case 6
	b _02302AB0 ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302A98:
	mov r0, #1
	str r0, [ip]
	b _02302C2C
_02302AA4:
	mov r0, #1
	str r0, [ip, #4]
	b _02302C2C
_02302AB0:
	ldr r0, [ip, #0xf4]
	ldrsh r1, [ip, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0xc
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #0xc
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302ADC:
	mov r2, #7
	str r2, [ip]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302C2C
_02302AF8: ; jump table
	b _02302B28 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302B78 ; case 4
	b _02302B34 ; case 5
	b _02302B6C ; case 6
	b _02302B40 ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302B28:
	mov r0, #1
	str r0, [r1]
	b _02302C2C
_02302B34:
	mov r0, #1
	str r0, [r1, #4]
	b _02302C2C
_02302B40:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #6
	mov r2, r2, asr #0x10
	mov r3, #0
	bl sub_0200CF6C
	add r0, sp, #6
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302B6C:
	str r2, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302B78:
	mov r0, #0
	str r0, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302B88:
	mov r3, #0
	str r3, [ip]
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02302C2C
_02302BA4: ; jump table
	b _02302BD4 ; case 0
	b _02302C2C ; case 1
	b _02302C2C ; case 2
	b _02302C2C ; case 3
	b _02302C24 ; case 4
	b _02302BE0 ; case 5
	b _02302C14 ; case 6
	b _02302BEC ; case 7
	b _02302C2C ; case 8
	b _02302C2C ; case 9
	b _02302C2C ; case 10
	b _02302C2C ; case 11
_02302BD4:
	mov r0, #1
	str r0, [r1]
	b _02302C2C
_02302BE0:
	mov r0, #1
	str r0, [r1, #4]
	b _02302C2C
_02302BEC:
	ldr r0, [r1, #0xf4]
	ldrsh r1, [r1, #0xf0]
	mov r2, r0, lsl #0x10
	add r0, sp, #0
	mov r2, r2, asr #0x10
	bl sub_0200CF6C
	add r0, sp, #0
	mov r1, #0
	bl ov11_02304CAC
	b _02302C2C
_02302C14:
	mov r0, #7
	str r0, [r1]
	bl ov11_02302A48
	b _02302C2C
_02302C24:
	str r3, [r1]
	bl ov11_02302A48
_02302C2C:
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02302C34: .word 0x02324D4C
	arm_func_end ov11_02302A48

	arm_func_start ov11_02302C38
ov11_02302C38: ; 0x02302C38
	stmdb sp!, {r3, lr}
	ldr r0, _02302C60 ; =0x02324D4C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02302C60 ; =0x02324D4C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302C60: .word 0x02324D4C
	arm_func_end ov11_02302C38

	arm_func_start ov11_02302C64
ov11_02302C64: ; 0x02302C64
	stmdb sp!, {r3, lr}
	ldr r0, _02302CDC ; =0x02324D4C
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02302CD4
_02302C80: ; jump table
	b _02302C90 ; case 0
	b _02302C9C ; case 1
	b _02302CB8 ; case 2
	b _02302CC4 ; case 3
_02302C90:
	mov r0, #1
	str r0, [r1, #0x28]
	b _02302CD4
_02302C9C:
	bl ov11_02302668
	cmp r0, #3
	ldreq r0, _02302CDC ; =0x02324D4C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0x28]
	b _02302CD4
_02302CB8:
	mov r0, #3
	str r0, [r1, #0x28]
	b _02302CD4
_02302CC4:
	ldr r0, [r1, #0x20]
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02302CD4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302CDC: .word 0x02324D4C
	arm_func_end ov11_02302C64

	arm_func_start ov11_02302CE0
ov11_02302CE0: ; 0x02302CE0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02302D84 ; =0x02322740
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x104
	mov r1, #6
	bl MemAlloc
	ldr r2, _02302D88 ; =0x02324D4C
	mov r1, #0
	str r0, [r2]
	str r1, [r0, #0x1c]
	ldr r0, [r2]
	sub r3, r1, #2
	str r1, [r0, #0x28]
	ldr r0, [r2]
	str r1, [r0, #0xc]
	ldrsh ip, [r5, #4]
	ldr r0, [r2]
	strh ip, [r0, #0xf0]
	ldrh ip, [r5, #2]
	ldr r0, [r2]
	str ip, [r0, #0xf4]
	ldr r0, [r2]
	strb r4, [r0, #0x100]
	ldr r0, [r2]
	strh r1, [r0, #0xfe]
	ldr r0, [r2]
	strb r3, [r0, #0xfc]
	ldr r0, [r2]
	add r0, r0, #0x2c
	bl InitPreprocessorArgs
	ldr r0, _02302D88 ; =0x02324D4C
	ldrsh r2, [r5, #4]
	ldr r1, [r0]
	mov r0, #7
	str r2, [r1, #0x3c]
	bl ov11_02302850
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302D84: .word 0x02322740
_02302D88: .word 0x02324D4C
	arm_func_end ov11_02302CE0

	arm_func_start ov11_02302D8C
ov11_02302D8C: ; 0x02302D8C
	stmdb sp!, {r3, lr}
	ldr r0, _02302DB4 ; =0x02324D4C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02302DB4 ; =0x02324D4C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02302DB4: .word 0x02324D4C
	arm_func_end ov11_02302D8C

	arm_func_start ov11_02302DB8
ov11_02302DB8: ; 0x02302DB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _023031E4 ; =0x02324D4C
	ldr r3, [sb, #4]
	ldr r0, [r3]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _023031DC
_02302DD4: ; jump table
	b _02302E0C ; case 0
	b _02302E4C ; case 1
	b _02302E74 ; case 2
	b _02302EA8 ; case 3
	b _02302F4C ; case 4
	b _02302FF4 ; case 5
	b _0230301C ; case 6
	b _02303050 ; case 7
	b _02303088 ; case 8
	b _023030F4 ; case 9
	b _0230311C ; case 10
	b _0230313C ; case 11
	b _023031A4 ; case 12
	b _023031C0 ; case 13
_02302E0C:
	add r0, r3, #0x3c
	str r0, [r3, #0x174]
	ldr r1, [sb, #4]
	mvn r0, #1
	ldrsb r1, [r1, #9]
	cmp r1, r0
	bne _023031DC
	mov r0, #0
	bl CreateDBox
	mov r1, sb
	ldr r3, [r1, #4]
	mov r2, #1
	strb r0, [r3, #9]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02302E4C:
	ldrsb r0, [r3, #9]
	ldr r2, _023031E8 ; =0x000002C5
	mov r1, #0x10
	mov r3, #0
	bl ShowMessageInDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0]
	b _023031DC
_02302E74:
	ldrsb r0, [r3, #9]
	bl IsDBoxActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl ShowDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #3
	str r1, [r0]
	b _023031DC
_02302EA8:
	add r0, r3, #0x3c
	mov r7, #0
	ldr r5, _023031EC ; =0x02322780
	str r0, [r3, #0x174]
	mov r6, #0x100
	mov r4, r7
_02302EC0:
	ldr r3, [sb, #4]
	mov r0, r7, lsl #3
	add r1, r3, #0x13c
	str r1, [sp]
	ldrh r2, [r5, r0]
	add r8, r7, r7, lsl #6
	add r0, r3, #0x18c
	mov r1, r6
	mov r3, r4
	add r0, r0, r8, lsl #2
	bl PreprocessStringFromMessageId
	add r1, r5, r7, lsl #3
	ldr r0, [sb, #4]
	add r7, r7, #1
	ldr r1, [r1, #4]
	add r0, r0, r8, lsl #2
	str r1, [r0, #0x28c]
	cmp r7, #3
	blt _02302EC0
	mov r1, #3
	ldr r0, _023031E4 ; =0x02324D4C
	str r1, [sp]
	ldr r2, [r0, #4]
	ldr r0, _023031F0 ; =0x02322750
	ldr r1, _023031F4 ; =0x00300011
	add r3, r2, #0x18c
	mov r2, #0
	bl sub_0202B1AC
	ldr r1, _023031E4 ; =0x02324D4C
	mov r2, #4
	ldr r3, [r1, #4]
	strb r0, [r3, #0xa]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02302F4C:
	ldrsb r0, [r3, #0xa]
	bl IsNormalMenuActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0xa]
	bl GetNormalMenuResult
	mov r1, sb
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #0xa]
	bl FreeNormalMenu
	mov r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02302FA8
	cmp r0, #1
	beq _02302FC4
	cmp r0, #2
	b _02302FE8
_02302FA8:
	ldrsb r0, [r1, #9]
	bl FreeDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #0xb
	str r1, [r0]
	b _023031DC
_02302FC4:
	ldrsb r0, [r1, #9]
	bl FreeDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl ov11_02302CE0
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02302FE8:
	mov r0, #5
	str r0, [r1]
	b _023031DC
_02302FF4:
	ldrsb r0, [r3, #9]
	ldr r2, _023031F8 ; =0x000002C9
	add r3, r3, #0x13c
	mov r1, #0x10
	bl ShowMessageInDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #6
	str r1, [r0]
	b _023031DC
_0230301C:
	ldrsb r0, [r3, #9]
	bl IsDBoxActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl ShowDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #7
	str r1, [r0]
	b _023031DC
_02303050:
	ldr r0, _023031FC ; =0x02322760
	mov r4, #2
	ldr r1, _02303200 ; =0x00300013
	ldr r3, _02303204 ; =0x02322798
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	mov r1, sb
	ldr r3, [r1, #4]
	mov r2, #8
	strb r0, [r3, #0xa]
	ldr r0, [r1, #4]
	str r2, [r0]
	b _023031DC
_02303088:
	ldrsb r0, [r3, #0xa]
	bl IsNormalMenuActive
	cmp r0, #0
	bne _023031DC
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #0xa]
	bl GetNormalMenuResult
	mov r1, sb
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #0xa]
	bl FreeNormalMenu
	mov r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #3
	beq _023030DC
	cmp r0, #4
	b _023030E8
_023030DC:
	mov r0, #9
	str r0, [r1]
	b _023031DC
_023030E8:
	mov r0, #1
	str r0, [r1]
	b _023031DC
_023030F4:
	ldrsb r0, [r3, #9]
	mov r1, #0x218
	add r2, r1, #0xb2
	add r3, r3, #0x13c
	bl ShowMessageInDBox
	mov r0, sb
	ldr r0, [r0, #4]
	mov r1, #0xa
	str r1, [r0]
	b _023031DC
_0230311C:
	ldrsb r0, [r3, #9]
	bl IsDBoxActive
	cmp r0, #0
	moveq r0, sb
	ldreq r0, [r0, #4]
	moveq r1, #0xd
	streq r1, [r0]
	b _023031DC
_0230313C:
	add r0, r3, #0x10
	bl sub_0206351C
	mov r0, sb
	ldr r1, [r0, #4]
	mov r3, #1
	str r3, [r1, #0x1c]
	ldr r2, [r0, #4]
	ldr r1, [r2, #0xc]
	ldrh r0, [r1]
	strh r0, [r2, #0x20]
	ldrh r0, [r1, #2]
	strh r0, [r2, #0x22]
	ldrh r0, [r1, #4]
	mov r1, #0
	strh r0, [r2, #0x24]
	ldrb r0, [r2, #8]
	cmp r0, #0
	movne r3, #8
	add r0, r2, #0x10
	orr r2, r3, #6
	bl sub_0203D438
	ldr r0, _023031E4 ; =0x02324D4C
	mov r1, #0xc
	ldr r0, [r0, #4]
	str r1, [r0]
	b _023031DC
_023031A4:
	bl sub_0203D538
	cmp r0, #1
	bne _023031DC
	bl sub_0203EFD4
	bl ov11_022E6E68
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_023031C0:
	bl ov11_022E6E68
	mov r0, sb
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #9]
	bl FreeDBox
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_023031DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023031E4: .word 0x02324D4C
_023031E8: .word 0x000002C5
_023031EC: .word 0x02322780
_023031F0: .word 0x02322750
_023031F4: .word 0x00300011
_023031F8: .word 0x000002C9
_023031FC: .word 0x02322760
_02303200: .word 0x00300013
_02303204: .word 0x02322798
	arm_func_end ov11_02302DB8

	arm_func_start ov11_02303208
ov11_02303208: ; 0x02303208
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _023032B4 ; =0x02322770
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _023032B8 ; =0x02324D4C
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02303248
	ldr r0, _023032BC ; =0x00000498
	mov r1, #6
	bl MemAlloc
	ldr r1, _023032B8 ; =0x02324D4C
	str r0, [r1, #4]
_02303248:
	ldr r0, _023032B8 ; =0x02324D4C
	mvn r3, #1
	ldr r2, [r0, #4]
	mov r1, #0
	strb r3, [r2, #9]
	ldr r3, [r0, #4]
	ldr r2, _023032C0 ; =0x02322734
	str r5, [r3, #0xc]
	ldr r5, [r0, #4]
	mov r3, #1
	strb r4, [r5, #8]
	ldr r0, [r0, #4]
	str r1, [sp]
	ldr r1, [r0, #0xc]
	add r0, r0, #0x3c
	bl sub_0200D310
	ldr r0, _023032B8 ; =0x02324D4C
	ldr r0, [r0, #4]
	add r0, r0, #0x13c
	bl InitPreprocessorArgs
	ldr r0, _023032B8 ; =0x02324D4C
	cmp r4, #0
	movne r1, #0xb
	ldr r0, [r0, #4]
	moveq r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023032B4: .word 0x02322770
_023032B8: .word 0x02324D4C
_023032BC: .word 0x00000498
_023032C0: .word 0x02322734
	arm_func_end ov11_02303208

	arm_func_start ov11_023032C4
ov11_023032C4: ; 0x023032C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0xc80
	mov r1, #6
	bl MemAlloc
	ldr r2, _023033F0 ; =0x02324D54
	mov r1, #0x5c
	str r0, [r2]
	mov r0, #0
	bl LoadScriptVariableValue
	ldr r1, _023033F0 ; =0x02324D54
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r1, [r1]
	sub r2, r3, #2
	ldr r0, [r1, #0x10]
	cmp r0, #0
	movle r0, #5
	strle r0, [r1, #0x10]
	ldr r0, _023033F0 ; =0x02324D54
	ldr r1, [r0]
	str r3, [r1, #0x1c]
	ldr r1, [r0]
	str r3, [r1, #0xc24]
	ldr r1, [r0]
	str r3, [r1, #0x14]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	strb r2, [r1, #0xc7d]
	ldr r0, [r0]
	add r0, r0, #0x28
	add r0, r0, #0xc00
	bl InitPreprocessorArgs
	ldr r0, _023033F0 ; =0x02324D54
	mov r1, #0x400
	ldr r2, [r0]
	ldr r3, _023033F4 ; =0x0000C402
	add r0, r2, #0x28
	add r4, r0, #0xc00
	add r0, r2, #0x24
	add r2, r1, #0x4a
	str r4, [sp]
	bl PreprocessStringFromMessageId
	ldr r6, _023033F8 ; =0x023227B0
	ldr r5, _023033F4 ; =0x0000C402
	ldr r4, _023033F0 ; =0x02324D54
	mov r8, #0
	mov r7, #0x400
_02303390:
	ldr r3, [r4]
	mov r1, r7
	add r0, r3, #0x28
	add r0, r0, #0xc00
	str r0, [sp]
	ldr r2, [r3, #4]
	add r0, r3, #0x24
	mov r2, r2, lsl #1
	ldrh r2, [r6, r2]
	add ip, r0, #0x400
	mov r3, r5
	add r0, r8, r2
	mov r2, r0, lsl #0x10
	add r0, ip, r8, lsl #6
	mov r2, r2, lsr #0x10
	bl PreprocessStringFromMessageId
	add r8, r8, #1
	cmp r8, #0x1e
	blt _02303390
	mov r0, #0
	bl ov11_023035C0
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023033F0: .word 0x02324D54
_023033F4: .word 0x0000C402
_023033F8: .word 0x023227B0
	arm_func_end ov11_023032C4

	arm_func_start ov11_023033FC
ov11_023033FC: ; 0x023033FC
	stmdb sp!, {r3, lr}
	ldr r0, _023035BC ; =0x02324D54
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0xc
	addls pc, pc, r1, lsl #2
	b _02303538
_02303418: ; jump table
	b _0230344C ; case 0
	b _02303538 ; case 1
	b _023034A0 ; case 2
	b _023035B4 ; case 3
	b _02303538 ; case 4
	b _02303538 ; case 5
	b _02303538 ; case 6
	b _02303538 ; case 7
	b _023034A8 ; case 8
	b _02303538 ; case 9
	b _02303538 ; case 10
	b _02303538 ; case 11
	b _023034F4 ; case 12
_0230344C:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl sub_0202BCBC
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =0x02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl GetAdvancedMenuResult
	ldr r1, _023035BC ; =0x02324D54
	add r2, r0, #1
	ldr r0, [r1]
	str r2, [r0, #0x18]
	ldr r0, [r1]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7c]
	bl FreeAdvancedMenu
	mov r0, #2
	bl ov11_023035C0
	b _023035B4
_023034A0:
	mov r0, #3
	ldmia sp!, {r3, pc}
_023034A8:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl IsDBoxActive
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =0x02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl ShowDBox
	ldr r0, _023035BC ; =0x02324D54
	mov r2, #0xd
	ldr r1, [r0]
	str r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl sub_0202F2C4
	b _023035B4
_023034F4:
	ldr r1, [r2, #0x14]
	add r1, r1, #1
	str r1, [r2, #0x14]
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	cmp r0, #1
	cmpne r0, #2
	beq _023035B4
	cmp r0, #3
	bne _023035B4
	ldr r0, [r1, #8]
	bl ov11_023035C0
	ldr r0, _023035BC ; =0x02324D54
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _023035B4
_02303538:
	add r0, r2, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl IsDBoxActive
	cmp r0, #0
	bne _023035B4
	ldr r0, _023035BC ; =0x02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl ShowDBox
	ldr r0, _023035BC ; =0x02324D54
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	cmp r0, r1
	beq _023035A4
	bl sub_0202F2C4
	ldr r0, _023035BC ; =0x02324D54
	ldr r0, [r0]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0x7d]
	bl FreeDBox
	ldr r0, _023035BC ; =0x02324D54
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xc7d]
_023035A4:
	ldr r0, _023035BC ; =0x02324D54
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov11_023035C0
_023035B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023035BC: .word 0x02324D54
	arm_func_end ov11_023033FC

	arm_func_start ov11_023035C0
ov11_023035C0: ; 0x023035C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r1, _02303724 ; =0x02324D54
	ldr r2, [r1]
	str r0, [r2]
	ldr r3, [r1]
	ldr r0, [r3]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0230371C
_023035E8: ; jump table
	b _02303618 ; case 0
	b _023036A4 ; case 1
	b _023036C0 ; case 2
	b _023036E8 ; case 3
	b _0230371C ; case 4
	b _02303700 ; case 5
	b _023036CC ; case 6
	b _0230371C ; case 7
	b _0230371C ; case 8
	b _0230371C ; case 9
	b _0230371C ; case 10
	b _023036F4 ; case 11
_02303618:
	ldr r0, [r3, #4]
	mov r1, #0
	add r0, r0, #0x4c
	add r2, r0, #0x400
	mov r0, #0x10
	strh r2, [sp, #0x10]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x84]
	str r0, [sp, #0x14]
	ldr r0, [r3, #4]
	ldr ip, [r3, #0x10]
	cmp r0, #2
	ldr r1, _02303728 ; =0x00001813
	add r2, sp, #8
	beq _0230367C
	ldr r0, _0230372C ; =0x023227D8
	str ip, [sp]
	mov ip, #8
	ldr r3, _02303730 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02303724 ; =0x02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _0230371C
_0230367C:
	ldr r0, _02303734 ; =0x023227B8
	str ip, [sp]
	mov ip, #8
	ldr r3, _02303730 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02303724 ; =0x02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _0230371C
_023036A4:
	ldr r0, _02303738 ; =0x023227E8
	bl DebugPrint0__0200C1FC
	ldr r0, _02303724 ; =0x02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0230371C
_023036C0:
	ldr r0, _0230373C ; =0x02322808
	bl DebugPrint0__0200C1FC
	b _0230371C
_023036CC:
	ldr r0, _02303740 ; =0x02322828
	bl DebugPrint0__0200C1FC
	ldr r0, _02303724 ; =0x02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230371C
_023036E8:
	ldr r0, _02303744 ; =0x02322850
	bl DebugPrint0__0200C1FC
	b _0230371C
_023036F4:
	ldr r0, _02303748 ; =0x0232287C
	bl DebugPrint0__0200C1FC
	b _0230371C
_02303700:
	ldr r0, _0230374C ; =0x02322894
	bl DebugPrint0__0200C1FC
	ldr r0, _02303724 ; =0x02324D54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230377C
_0230371C:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303724: .word 0x02324D54
_02303728: .word 0x00001813
_0230372C: .word 0x023227D8
_02303730: .word ov11_02303750
_02303734: .word 0x023227B8
_02303738: .word 0x023227E8
_0230373C: .word 0x02322808
_02303740: .word 0x02322828
_02303744: .word 0x02322850
_02303748: .word 0x0232287C
_0230374C: .word 0x02322894
	arm_func_end ov11_023035C0

	arm_func_start ov11_02303750
ov11_02303750: ; 0x02303750
	stmdb sp!, {r4, lr}
	ldr r2, _02303778 ; =0x02324D54
	mov r4, r0
	ldr r2, [r2]
	add r2, r2, #0x24
	add r2, r2, #0x400
	add r1, r2, r1, lsl #6
	bl Strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02303778: .word 0x02324D54
	arm_func_end ov11_02303750

	arm_func_start ov11_0230377C
ov11_0230377C: ; 0x0230377C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r0, _023038D8 ; =0x02324D54
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _023038D0
_0230379C: ; jump table
	b _023037CC ; case 0
	b _02303858 ; case 1
	b _02303874 ; case 2
	b _0230389C ; case 3
	b _023038D0 ; case 4
	b _023038B4 ; case 5
	b _02303880 ; case 6
	b _023038D0 ; case 7
	b _023038D0 ; case 8
	b _023038D0 ; case 9
	b _023038D0 ; case 10
	b _023038A8 ; case 11
_023037CC:
	ldr r0, [r3, #4]
	mov r1, #0
	add r0, r0, #0x4c
	add r2, r0, #0x400
	mov r0, #0x10
	strh r2, [sp, #0x10]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x84]
	str r0, [sp, #0x14]
	ldr r0, [r3, #4]
	ldr ip, [r3, #0x10]
	cmp r0, #2
	ldr r1, _023038DC ; =0x00001813
	add r2, sp, #8
	beq _02303830
	ldr r0, _023038E0 ; =0x023227D8
	str ip, [sp]
	mov ip, #8
	ldr r3, _023038E4 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _023038D8 ; =0x02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _023038D0
_02303830:
	ldr r0, _023038E8 ; =0x023227B8
	str ip, [sp]
	mov ip, #8
	ldr r3, _023038E4 ; =ov11_02303750
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _023038D8 ; =0x02324D54
	ldr r1, [r1]
	strb r0, [r1, #0xc7c]
	b _023038D0
_02303858:
	ldr r0, _023038EC ; =0x023227E8
	bl DebugPrint0__0200C1FC
	ldr r0, _023038D8 ; =0x02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _023038D0
_02303874:
	ldr r0, _023038F0 ; =0x02322808
	bl DebugPrint0__0200C1FC
	b _023038D0
_02303880:
	ldr r0, _023038F4 ; =0x02322828
	bl DebugPrint0__0200C1FC
	ldr r0, _023038D8 ; =0x02324D54
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023038D0
_0230389C:
	ldr r0, _023038F8 ; =0x02322850
	bl DebugPrint0__0200C1FC
	b _023038D0
_023038A8:
	ldr r0, _023038FC ; =0x0232287C
	bl DebugPrint0__0200C1FC
	b _023038D0
_023038B4:
	ldr r0, _02303900 ; =0x02322894
	bl DebugPrint0__0200C1FC
	ldr r0, _023038D8 ; =0x02324D54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	bl ov11_0230377C
_023038D0:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023038D8: .word 0x02324D54
_023038DC: .word 0x00001813
_023038E0: .word 0x023227D8
_023038E4: .word ov11_02303750
_023038E8: .word 0x023227B8
_023038EC: .word 0x023227E8
_023038F0: .word 0x02322808
_023038F4: .word 0x02322828
_023038F8: .word 0x02322850
_023038FC: .word 0x0232287C
_02303900: .word 0x02322894
	arm_func_end ov11_0230377C

	arm_func_start ov11_02303904
ov11_02303904: ; 0x02303904
	stmdb sp!, {r3, lr}
	ldr r0, _0230392C ; =0x02324D54
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230392C ; =0x02324D54
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230392C: .word 0x02324D54
	arm_func_end ov11_02303904

	arm_func_start ov11_02303930
ov11_02303930: ; 0x02303930
	stmdb sp!, {r3, lr}
	ldr r0, _023039A8 ; =0x02324D54
	ldr r1, [r0]
	ldr r0, [r1, #0xc24]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _023039A0
_0230394C: ; jump table
	b _0230395C ; case 0
	b _02303968 ; case 1
	b _02303984 ; case 2
	b _02303990 ; case 3
_0230395C:
	mov r0, #1
	str r0, [r1, #0xc24]
	b _023039A0
_02303968:
	bl ov11_023033FC
	cmp r0, #3
	ldreq r0, _023039A8 ; =0x02324D54
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0xc24]
	b _023039A0
_02303984:
	mov r0, #3
	str r0, [r1, #0xc24]
	b _023039A0
_02303990:
	ldr r0, [r1, #0x18]
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_023039A0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023039A8: .word 0x02324D54
	arm_func_end ov11_02303930

	arm_func_start ov11_023039AC
ov11_023039AC: ; 0x023039AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023039D0 ; =0x023227C8
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov11_023032C4
	ldmia sp!, {r4, pc}
	.align 2, 0
_023039D0: .word 0x023227C8
	arm_func_end ov11_023039AC

	arm_func_start ov11_023039D4
ov11_023039D4: ; 0x023039D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x21c
	mov r1, #8
	bl MemAlloc
	ldr r1, _02303AF8 ; =0x02324D58
	cmp r4, #0
	str r0, [r1, #4]
	str r4, [r0, #0x14]
	bne _02303A14
	ldr r0, [r1, #4]
	add r0, r0, #0x60
	bl sub_02034A38
	ldr r1, _02303AF8 ; =0x02324D58
	ldr r1, [r1, #4]
	str r0, [r1, #0x5c]
_02303A14:
	mov r2, #0
	ldr r0, _02303AF8 ; =0x02324D58
	mov r3, r2
_02303A20:
	ldr r1, [r0, #4]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str r3, [r1, #0x38]
	cmp r2, #8
	blt _02303A20
	ldr r2, _02303AF8 ; =0x02324D58
	mov lr, #1
	ldr r0, [r2, #4]
	mov ip, #4
	str r3, [r0, #0x18]
	ldr r1, [r2, #4]
	ldr r0, _02303AFC ; =0x023228E0
	str r3, [r1, #0x1c]
	ldr r3, [r2, #4]
	ldr r1, _02303B00 ; =ov11_023042A8
	str lr, [r3, #0x20]
	ldr r3, [r2, #4]
	str lr, [r3, #0x24]
	ldr r3, [r2, #4]
	str lr, [r3, #0x28]
	ldr r3, [r2, #4]
	str lr, [r3, #0x2c]
	ldr r3, [r2, #4]
	str lr, [r3, #0x30]
	ldr r3, [r2, #4]
	str lr, [r3, #0x34]
	ldr r3, [r2, #4]
	str ip, [r3, #0x40]
	ldr r3, [r2, #4]
	ldr r2, [r3, #0x40]
	sub r2, r2, #2
	str r2, [r3, #0x10]
	bl sub_0202F8C4
	ldr r1, _02303AF8 ; =0x02324D58
	mov r2, #1
	ldr r3, [r1, #4]
	strb r0, [r3, #1]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	ldr r0, [r0, #8]
	bl ov11_02303BC0
	ldr r0, _02303AF8 ; =0x02324D58
	ldr r0, [r0, #4]
	add r0, r0, #0x1bc
	bl InitPreprocessorArgs
	ldr r1, _02303AF8 ; =0x02324D58
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	strb r3, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02303AF8: .word 0x02324D58
_02303AFC: .word 0x023228E0
_02303B00: .word ov11_023042A8
	arm_func_end ov11_023039D4

	arm_func_start ov11_02303B04
ov11_02303B04: ; 0x02303B04
	stmdb sp!, {r3, lr}
	ldr r0, _02303B4C ; =0x02324D58
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #1]
	bl sub_0202836C
	ldr r0, _02303B4C ; =0x02324D58
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl sub_0202F8FC
	ldr r0, _02303B4C ; =0x02324D58
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02303B4C ; =0x02324D58
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303B4C: .word 0x02324D58
	arm_func_end ov11_02303B04

	arm_func_start ov11_02303B50
ov11_02303B50: ; 0x02303B50
	stmdb sp!, {r3, lr}
	ldr r0, _02303BBC ; =0x02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02303B7C
	cmp r1, #1
	beq _02303BB4
	cmp r1, #2
	beq _02303B84
	b _02303BB4
_02303B7C:
	bl ov11_02303D80
	b _02303BB4
_02303B84:
	mov r1, #3
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x5c]
	tst r1, #0x100
	beq _02303BAC
	ldrb r1, [r0]
	ldr r0, [r2, #0xe8]
	ldr r2, [r2, #0xe4]
	blx r2
_02303BAC:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02303BB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303BBC: .word 0x02324D58
	arm_func_end ov11_02303B50

	arm_func_start ov11_02303BC0
ov11_02303BC0: ; 0x02303BC0
	stmdb sp!, {r3, lr}
	ldr r1, _02303D68 ; =0x02324D58
	ldr r2, [r1, #4]
	str r0, [r2, #8]
	ldr r3, [r1, #4]
	ldr r0, [r3, #8]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_02303BE4: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _02303BFC ; case 1
	b _02303C5C ; case 2
	b _02303C94 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	b _02303D4C ; case 5
_02303BFC:
	ldr r2, _02303D6C ; =0x00003CFF
	add r0, r3, #0x100
	strh r2, [r0]
	ldr r0, [r1, #4]
	mov r2, #0x10
	str r2, [r0, #0x104]
	ldr ip, [r1, #4]
	mov r2, #4
	ldr r3, [ip, #0x3c]
	ldr r0, _02303D70 ; =0x023228D0
	str r3, [ip, #0xf8]
	str r2, [sp]
	ldr r1, [r1, #4]
	ldr r3, _02303D74 ; =0x023228F0
	add r2, r1, #0xf8
	mov r1, #0x33
	bl CreateNormalMenu
	ldr r1, _02303D68 ; =0x02324D58
	ldr r2, [r1, #4]
	strb r0, [r2, #2]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	ldmia sp!, {r3, pc}
_02303C5C:
	ldr r2, [r3, #0x40]
	mov r0, #3
	str r2, [r3, #0xf8]
	str r0, [sp]
	ldr r1, [r1, #4]
	ldr r0, _02303D70 ; =0x023228D0
	add r2, r1, #0xf8
	ldr r3, _02303D78 ; =0x02322910
	mov r1, #0x33
	bl CreateNormalMenu
	ldr r1, _02303D68 ; =0x02324D58
	ldr r1, [r1, #4]
	strb r0, [r1, #2]
	ldmia sp!, {r3, pc}
_02303C94:
	mov r0, #0
	str r0, [r3, #0x198]
	ldr r0, [r1, #4]
	mov r2, #0x50
	str r2, [r0, #0x1b0]
	ldr r0, [r1, #4]
	mov r2, #4
	str r2, [r0, #0x1b4]
	ldr r0, [r1, #4]
	mov ip, #0x12
	str ip, [r0, #0x1a8]
	ldr r0, [r1, #4]
	mov r3, #0xc
	str r3, [r0, #0x1ac]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _02303CF4
	mov r0, #0x1f
	str r0, [r2, #0x19c]
	ldr r0, [r1, #4]
	ldr r1, _02303D7C ; =0x0000FFF2
	str r1, [r0, #0x1a0]
	b _02303D24
_02303CF4:
	cmp r0, #1
	addne r0, ip, #0x470
	strne r0, [r2, #0x19c]
	ldrne r0, [r1, #4]
	rsbne r1, r3, #0x10000
	strne r1, [r0, #0x1a0]
	bne _02303D24
	mov r0, #0x14
	str r0, [r2, #0x19c]
	ldr r0, [r1, #4]
	ldr r1, _02303D7C ; =0x0000FFF2
	str r1, [r0, #0x1a0]
_02303D24:
	ldr r0, _02303D68 ; =0x02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x18]
	str r1, [r2, #0x194]
	ldr r0, [r0, #4]
	add r0, r0, #0x190
	bl sub_02039460
	ldmia sp!, {r3, pc}
_02303D4C:
	ldrsb r0, [r3, #2]
	bl FreeNormalMenu
	ldr r0, _02303D68 ; =0x02324D58
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02303D68: .word 0x02324D58
_02303D6C: .word 0x00003CFF
_02303D70: .word 0x023228D0
_02303D74: .word 0x023228F0
_02303D78: .word 0x02322910
_02303D7C: .word 0x0000FFF2
	arm_func_end ov11_02303BC0

	arm_func_start ov11_02303D80
ov11_02303D80: ; 0x02303D80
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xa8
	ldr r0, _02304298 ; =0x02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #8]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0230428C
_02303DA0: ; jump table
	b _0230428C ; case 0
	b _02303DBC ; case 1
	b _0230406C ; case 2
	b _0230417C ; case 3
	b _02304250 ; case 4
	b _02304268 ; case 5
	b _0230422C ; case 6
_02303DBC:
	ldrsb r0, [r2, #2]
	bl GetNormalMenuResult
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0230428C
_02303DD0: ; jump table
	b _0230428C ; case 0
	b _0230404C ; case 1
	b _02303DE8 ; case 2
	b _02303E10 ; case 3
	b _02303E38 ; case 4
	b _02303E60 ; case 5
_02303DE8:
	ldr r1, _02304298 ; =0x02324D58
	mov r4, #5
	ldr r2, [r1, #4]
	mov r3, #2
	str r4, [r2, #8]
	ldr r2, [r1, #4]
	str r3, [r2, #0xc]
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	b _0230428C
_02303E10:
	ldr r1, _02304298 ; =0x02324D58
	mov r4, #5
	ldr r2, [r1, #4]
	mov r3, #3
	str r4, [r2, #8]
	ldr r2, [r1, #4]
	str r3, [r2, #0xc]
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	b _0230428C
_02303E38:
	ldr r1, _02304298 ; =0x02324D58
	mov r3, #5
	ldr r4, [r1, #4]
	mov r2, #1
	str r0, [r4, #0x3c]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	b _0230428C
_02303E60:
	ldr r1, _02304298 ; =0x02324D58
	ldr r2, [r1, #4]
	str r0, [r2, #0x3c]
	ldr r3, [r1, #4]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _02303E90
	cmp r0, #1
	beq _02303F30
	cmp r0, #2
	beq _02303FD0
	b _0230402C
_02303E90:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	bne _02303F00
	bl GetHero
	ldr r1, _02304298 ; =0x02324D58
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _0230429C ; =0x02322978
	ldr r2, [r0, #0x18]
	add r0, sp, #6
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #6
	add r0, r4, #0x3a
	mov r2, #0xa
	bl sub_02025314
	ldrsh r2, [r4, #4]
	mov r0, #0
	mov r1, #0x3e
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x3f
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	bl sub_020572EC
	b _0230402C
_02303F00:
	add r0, sp, #0x1c
	bl sub_02048764
	ldr r0, _02304298 ; =0x02324D58
	ldr r1, _0230429C ; =0x02322978
	ldr r2, [r0, #4]
	add r0, sp, #0x1c
	ldr r2, [r2, #0x18]
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [sp, #0x1c]
	bl sub_02048794
	b _0230402C
_02303F30:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	bne _02303FA0
	bl GetPartner
	ldr r1, _02304298 ; =0x02324D58
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _023042A0 ; =0x02322930
	ldr r2, [r0, #0x1c]
	add r0, sp, #6
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #6
	add r0, r4, #0x3a
	mov r2, #0xa
	bl sub_02025314
	ldrsh r2, [r4, #4]
	mov r0, #0
	mov r1, #0x40
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x41
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	bl sub_020572EC
	b _0230402C
_02303FA0:
	add r0, sp, #0x58
	bl sub_02048764
	ldr r0, _02304298 ; =0x02324D58
	ldr r1, _023042A0 ; =0x02322930
	ldr r2, [r0, #4]
	add r0, sp, #0x58
	ldr r2, [r2, #0x1c]
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [sp, #0x5a]
	bl sub_02048794
	b _0230402C
_02303FD0:
	ldr r1, _023042A4 ; =0x023228BC
	add r0, sp, #0x94
	ldrb r2, [r1]
	strb r2, [sp, #4]
	ldrb r1, [r1, #1]
	strb r1, [sp, #5]
	ldr r1, [r3, #0x20]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl GetNameRaw
	add r0, sp, #0x94
	mov r1, r0
	bl SpecialStrcpy
	mov r3, #0
	ldr r0, _02304298 ; =0x02324D58
	str r3, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0x94
	ldr r0, [r0, #0x20]
	add r2, sp, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02055DD0
_0230402C:
	ldr r0, _02304298 ; =0x02324D58
	mov r3, #5
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0230428C
_0230404C:
	ldr r0, _02304298 ; =0x02324D58
	mov r3, #5
	ldr r2, [r0, #4]
	mov r1, #6
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	str r1, [r0, #0xc]
	b _0230428C
_0230406C:
	ldrsb r0, [r2, #2]
	bl GetNormalMenuResult
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0230428C
_02304080: ; jump table
	b _0230428C ; case 0
	b _02304150 ; case 1
	b _02304094 ; case 2
	b _023040D4 ; case 3
	b _02304110 ; case 4
_02304094:
	ldr r1, _02304298 ; =0x02324D58
	mov ip, #0
	ldr r2, [r1, #4]
	mov r3, #5
	str r0, [r2, #0x40]
	ldr r0, [r1, #4]
	mov r2, #1
	str ip, [r0, #0x10]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_023040D4:
	ldr r1, _02304298 ; =0x02324D58
	mov r3, #1
	ldr ip, [r1, #4]
	mov r2, #5
	str r0, [ip, #0x40]
	ldr r0, [r1, #4]
	str r3, [r0, #0x10]
	ldr r0, [r1, #4]
	str r2, [r0, #8]
	ldr r0, [r1, #4]
	str r3, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_02304110:
	ldr r1, _02304298 ; =0x02324D58
	mov ip, #2
	ldr r2, [r1, #4]
	mov r3, #5
	str r0, [r2, #0x40]
	ldr r0, [r1, #4]
	mov r2, #1
	str ip, [r0, #0x10]
	ldr r0, [r1, #4]
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	str r2, [r0, #0xc]
	ldr r0, [r1, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_02304150:
	ldr r0, _02304298 ; =0x02324D58
	mov r3, #5
	ldr r1, [r0, #4]
	mov r2, #1
	str r3, [r1, #8]
	ldr r1, [r0, #4]
	str r2, [r1, #0xc]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	b _0230428C
_0230417C:
	add r0, r2, #0x190
	ldr r4, [r2, #0x190]
	bl sub_02039528
	mvn r1, #1
	cmp r0, r1
	beq _023041D8
	add r1, r1, #1
	cmp r0, r1
	ldr r1, _02304298 ; =0x02324D58
	ldreq r0, _02304298 ; =0x02324D58
	ldr lr, [r1, #4]
	ldreq r0, [r0, #4]
	ldr ip, [lr, #0x10]
	ldreq r0, [r0, #0x194]
	add ip, lr, ip, lsl #2
	str r0, [ip, #0x18]
	ldr r0, [r1, #4]
	mov r3, #4
	str r3, [r0, #8]
	ldr r0, [r1, #4]
	mov r2, #1
	str r2, [r0, #0xc]
	b _0230428C
_023041D8:
	ldr r0, _02304298 ; =0x02324D58
	ldr r0, [r0, #4]
	ldr r3, [r0, #0x190]
	cmp r4, r3
	bne _023041F8
	ldr r0, [r0, #0x58]
	cmp r0, #0xff
	bne _0230428C
_023041F8:
	ldr r0, _02304298 ; =0x02324D58
	ldr r2, [r0, #4]
	ldr r1, [r2, #0x10]
	add r1, r2, r1, lsl #2
	str r3, [r1, #0x18]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl ov11_023042A8
	ldr r0, _02304298 ; =0x02324D58
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x58]
	b _0230428C
_0230422C:
	mov r1, #2
	str r1, [r2, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _02304248
	bl ov11_02303B04
_02304248:
	mvn r0, #0
	b _02304290
_02304250:
	ldr r1, [r2, #0xc]
	str r1, [r2, #8]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	bl ov11_02303BC0
	b _0230428C
_02304268:
	ldrsb r0, [r2, #2]
	bl FreeNormalMenu
	ldr r0, _02304298 ; =0x02324D58
	mvn r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2, #2]
	ldr r0, [r0, #4]
	str r1, [r0, #8]
_0230428C:
	mov r0, #0
_02304290:
	add sp, sp, #0xa8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304298: .word 0x02324D58
_0230429C: .word 0x02322978
_023042A0: .word 0x02322930
_023042A4: .word 0x023228BC
	arm_func_end ov11_02303D80

	arm_func_start ov11_023042A8
ov11_023042A8: ; 0x023042A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	ldr r0, _02304390 ; =0x02324D58
	ldr r2, _02304394 ; =0x02324D60
	ldr r1, [r0, #4]
	mov r0, r4
	ldr r3, [r1, #0x10]
	mov r1, #1
	ldr r3, [r2, r3, lsl #2]
	mov r2, #3
	bl sub_02026214
	ldr r0, _02304390 ; =0x02324D58
	ldr r3, [r0, #4]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	beq _02304300
	cmp r0, #1
	beq _02304314
	b _02304328
_02304300:
	ldr r1, [r3, #0x18]
	ldr r0, _02304398 ; =0x02322978
	mov r1, r1, lsl #1
	ldrsh r2, [r0, r1]
	b _02304334
_02304314:
	ldr r1, [r3, #0x1c]
	ldr r0, _0230439C ; =0x02322930
	mov r1, r1, lsl #1
	ldrsh r2, [r0, r1]
	b _02304334
_02304328:
	ldr r0, [r3, #0x20]
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_02304334:
	ldr r0, _02304390 ; =0x02324D58
	str r2, [r3, #0x1bc]
	ldr r1, [r0, #4]
	orr r2, r2, #0x10000
	str r2, [r1, #0x1cc]
	ldr r1, [r0, #4]
	ldr r2, _023043A0 ; =0x023229B8
	add ip, r1, #0x1bc
	ldr r3, _023043A4 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #4
	mov r0, r4
	mov r1, #0x3c
	mov r2, #3
	bl sub_02026214
	mov r0, r4
	bl sub_02027AF0
	add sp, sp, #4
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02304390: .word 0x02324D58
_02304394: .word 0x02324D60
_02304398: .word 0x02322978
_0230439C: .word 0x02322930
_023043A0: .word 0x023229B8
_023043A4: .word 0x0000C402
	arm_func_end ov11_023042A8

	arm_func_start ov11_023043A8
ov11_023043A8: ; 0x023043A8
	ldr ip, _023043B4 ; =sub_020348E4
	ldr r0, _023043B8 ; =0x023229DC
	bx ip
	.align 2, 0
_023043B4: .word sub_020348E4
_023043B8: .word 0x023229DC
	arm_func_end ov11_023043A8

	arm_func_start ov11_023043BC
ov11_023043BC: ; 0x023043BC
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _023043E4 ; =0x02324D6C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023043E4: .word 0x02324D6C
	arm_func_end ov11_023043BC

	arm_func_start ov11_023043E8
ov11_023043E8: ; 0x023043E8
	stmdb sp!, {r3, lr}
	ldr r0, _02304410 ; =0x02324D6C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304410 ; =0x02324D6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304410: .word 0x02324D6C
	arm_func_end ov11_023043E8

	arm_func_start ov11_02304414
ov11_02304414: ; 0x02304414
	stmdb sp!, {r3, lr}
	ldr r0, _02304510 ; =0x02324D6C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304440
	cmp r0, #1
	beq _02304478
	cmp r0, #2
	beq _023044C4
	b _02304508
_02304440:
	mov r0, #9
	bl sub_02067584
	cmp r0, #0
	beq _02304460
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304460:
	bl ov11_0230D71C
	ldr r0, _02304510 ; =0x02324D6C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304508
_02304478:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304508
	mov r0, #9
	bl sub_020668B4
	cmp r0, #0
	bne _023044AC
	bl sub_02067664
	mvn r0, #0
	bl ov11_022E6E8C
	bl ov11_0230D000
	mov r0, #4
	ldmia sp!, {r3, pc}
_023044AC:
	bl ov11_02310BDC
	ldr r0, _02304510 ; =0x02324D6C
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304508
_023044C4:
	bl sub_02066A44
	cmp r0, #0
	beq _02304508
	mvn r1, #0
	cmp r0, r1
	bne _023044E8
	mov r0, r1
	bl ov11_022E6E8C
	b _023044F8
_023044E8:
	cmp r0, #1
	bne _023044F8
	bl sub_020674CC
	bl ov11_022E6E8C
_023044F8:
	bl sub_02067664
	bl ov11_0230D000
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304508:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304510: .word 0x02324D6C
	arm_func_end ov11_02304414

	arm_func_start ov11_02304514
ov11_02304514: ; 0x02304514
	ldr ip, _02304520 ; =sub_020348E4
	ldr r0, _02304524 ; =0x023229EC
	bx ip
	.align 2, 0
_02304520: .word sub_020348E4
_02304524: .word 0x023229EC
	arm_func_end ov11_02304514

	arm_func_start ov11_02304528
ov11_02304528: ; 0x02304528
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _02304550 ; =0x02324D70
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304550: .word 0x02324D70
	arm_func_end ov11_02304528

	arm_func_start ov11_02304554
ov11_02304554: ; 0x02304554
	stmdb sp!, {r3, lr}
	ldr r0, _0230457C ; =0x02324D70
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230457C ; =0x02324D70
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230457C: .word 0x02324D70
	arm_func_end ov11_02304554

	arm_func_start ov11_02304580
ov11_02304580: ; 0x02304580
	stmdb sp!, {r3, lr}
	ldr r0, _02304660 ; =0x02324D70
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023045AC
	cmp r0, #1
	beq _023045E0
	cmp r0, #2
	beq _02304630
	b _02304658
_023045AC:
	bl ov11_022E8340
	cmp r0, #0
	bne _023045CC
	bl ov11_022E84AC
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_023045CC:
	ldr r0, _02304660 ; =0x02324D70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304658
_023045E0:
	bl ov11_022E83F8
	cmp r0, #0
	beq _02304658
	cmp r0, #1
	bne _02304608
	mvn r0, #0
	bl ov11_022E6E8C
	bl ov11_022E84AC
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304608:
	cmp r0, #2
	bne _02304658
	ldr r0, _02304660 ; =0x02324D70
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2, #8]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304658
_02304630:
	ldr r0, [r1, #8]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r1, #8]
	bgt _02304658
	bl ov11_022E84AC
	mov r0, #0
	bl ov11_022E6EE8
	mov r0, #3
	ldmia sp!, {r3, pc}
_02304658:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304660: .word 0x02324D70
	arm_func_end ov11_02304580

	arm_func_start ov11_02304664
ov11_02304664: ; 0x02304664
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02304684 ; =0x023229FC
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _02304688 ; =0x0238A084
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304684: .word 0x023229FC
_02304688: .word 0x0238A084
	arm_func_end ov11_02304664

	arm_func_start ov11_0230468C
ov11_0230468C: ; 0x0230468C
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _023046B4 ; =0x02324D74
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023046B4: .word 0x02324D74
	arm_func_end ov11_0230468C

	arm_func_start ov11_023046B8
ov11_023046B8: ; 0x023046B8
	stmdb sp!, {r3, lr}
	ldr r0, _023046E0 ; =0x02324D74
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _023046E0 ; =0x02324D74
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023046E0: .word 0x02324D74
	arm_func_end ov11_023046B8

	arm_func_start ov11_023046E4
ov11_023046E4: ; 0x023046E4
	stmdb sp!, {r3, lr}
	ldr r0, _02304880 ; =0x02324D74
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02304878
_02304700: ; jump table
	b _02304718 ; case 0
	b _0230473C ; case 1
	b _023047AC ; case 2
	b _023047C8 ; case 3
	b _023047EC ; case 4
	b _02304810 ; case 5
_02304718:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	bl ov11_0230D71C
	ldr r0, _02304880 ; =0x02324D74
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_0230473C:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304884 ; =0x0238A084
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bl sub_020664B8
	cmp r0, #0
	bne _0230477C
	bl sub_02066888
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230477C:
	ldr r0, _02304884 ; =0x0238A084
	ldr r0, [r0]
	cmp r0, #0
	bne _02304794
	bl ov11_02310BF0
	b _02304798
_02304794:
	bl ov11_02310C04
_02304798:
	ldr r0, _02304880 ; =0x02324D74
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_023047AC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304880 ; =0x02324D74
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_023047C8:
	bl sub_02066510
	cmp r0, #0
	beq _02304878
	ldr r1, _02304880 ; =0x02324D74
	mov r2, #4
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0, #4]
_023047EC:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	bl ov11_0230D71C
	ldr r0, _02304880 ; =0x02324D74
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304878
_02304810:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304878
	ldr r0, _02304880 ; =0x02324D74
	ldr r1, _02304888 ; =0x02322A0C
	ldr r2, [r0]
	b _0230483C
_0230482C:
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _02304848
	add r1, r1, #8
_0230483C:
	ldr r3, [r1]
	cmp r3, #0
	bne _0230482C
_02304848:
	cmp r3, #0
	beq _02304864
	ldrsh r0, [r1, #4]
	bl sub_0206C110
	mov r0, #1
	bl ov11_022E6E8C
	b _0230486C
_02304864:
	mov r0, #0
	bl ov11_022E6E8C
_0230486C:
	bl sub_02066888
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304878:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304880: .word 0x02324D74
_02304884: .word 0x0238A084
_02304888: .word 0x02322A0C
	arm_func_end ov11_023046E4

	arm_func_start ov11_0230488C
ov11_0230488C: ; 0x0230488C
	stmdb sp!, {r3, lr}
	mov r0, #0xe
	bl sub_02067584
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230488C

	arm_func_start ov11_023048AC
ov11_023048AC: ; 0x023048AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023048CC ; =0x02322AB4
	bl sub_020348E4
	cmp r0, #0
	ldrne r0, _023048D0 ; =0x0238A088
	strne r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023048CC: .word 0x02322AB4
_023048D0: .word 0x0238A088
	arm_func_end ov11_023048AC

	arm_func_start ov11_023048D4
ov11_023048D4: ; 0x023048D4
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _023048FC ; =0x02324D78
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023048FC: .word 0x02324D78
	arm_func_end ov11_023048D4

	arm_func_start ov11_02304900
ov11_02304900: ; 0x02304900
	stmdb sp!, {r3, lr}
	ldr r0, _02304928 ; =0x02324D78
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304928 ; =0x02324D78
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304928: .word 0x02324D78
	arm_func_end ov11_02304900

	arm_func_start ov11_0230492C
ov11_0230492C: ; 0x0230492C
	stmdb sp!, {r3, lr}
	ldr r0, _02304ABC ; =0x02324D78
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02304AB4
_02304948: ; jump table
	b _02304960 ; case 0
	b _023049A4 ; case 1
	b _023049D0 ; case 2
	b _023049EC ; case 3
	b _02304A10 ; case 4
	b _02304A34 ; case 5
_02304960:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	mov r0, #0xe
	bl sub_02067584
	cmp r0, #0
	beq _0230498C
	mvn r0, #0
	bl ov11_022E6E8C
	mov r0, #4
	ldmia sp!, {r3, pc}
_0230498C:
	bl ov11_0230D71C
	ldr r0, _02304ABC ; =0x02324D78
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_023049A4:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	mov r0, #0xe
	bl sub_020668B4
	bl ov11_02310BDC
	ldr r0, _02304ABC ; =0x02324D78
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_023049D0:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	ldr r0, _02304ABC ; =0x02324D78
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
_023049EC:
	bl sub_02066A44
	cmp r0, #0
	beq _02304AB4
	ldr r1, _02304ABC ; =0x02324D78
	mov r2, #4
	ldr r3, [r1]
	str r0, [r3, #8]
	ldr r0, [r1]
	str r2, [r0, #4]
_02304A10:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	bl ov11_0230D71C
	ldr r0, _02304ABC ; =0x02324D78
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304AB4
_02304A34:
	bl ov11_0230D220
	cmp r0, #0
	bne _02304AB4
	ldr r1, _02304ABC ; =0x02324D78
	mvn r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, r0
	bne _02304A60
	bl ov11_02300D5C
	b _02304AA8
_02304A60:
	ldr r1, _02304AC0 ; =0x02322AC4
	b _02304A78
_02304A68:
	ldr r0, [r2, #8]
	cmp r0, r3
	beq _02304A84
	add r1, r1, #8
_02304A78:
	ldr r3, [r1]
	cmp r3, #0
	bne _02304A68
_02304A84:
	cmp r3, #0
	beq _02304AA0
	ldrsh r0, [r1, #4]
	bl sub_0206C110
	mov r0, #6
	bl ov11_0230113C
	b _02304AA8
_02304AA0:
	mov r0, #1
	bl ov11_0230113C
_02304AA8:
	bl sub_02067664
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304AB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304ABC: .word 0x02324D78
_02304AC0: .word 0x02322AC4
	arm_func_end ov11_0230492C

	arm_func_start ov11_02304AC4
ov11_02304AC4: ; 0x02304AC4
	stmdb sp!, {r3, lr}
	bl GetNbItemsInBag
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov11_02304AC4

	arm_func_start ov11_02304AE0
ov11_02304AE0: ; 0x02304AE0
	ldr ip, _02304AEC ; =sub_020348E4
	ldr r0, _02304AF0 ; =0x02322B6C
	bx ip
	.align 2, 0
_02304AEC: .word sub_020348E4
_02304AF0: .word 0x02322B6C
	arm_func_end ov11_02304AE0

	arm_func_start ov11_02304AF4
ov11_02304AF4: ; 0x02304AF4
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02304B1C ; =0x02324D7C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304B1C: .word 0x02324D7C
	arm_func_end ov11_02304AF4

	arm_func_start ov11_02304B20
ov11_02304B20: ; 0x02304B20
	stmdb sp!, {r3, lr}
	ldr r0, _02304B48 ; =0x02324D7C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304B48 ; =0x02324D7C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304B48: .word 0x02324D7C
	arm_func_end ov11_02304B20

	arm_func_start ov11_02304B4C
ov11_02304B4C: ; 0x02304B4C
	stmdb sp!, {r3, lr}
	ldr r0, _02304BC0 ; =0x02324D7C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304B70
	cmp r0, #1
	beq _02304B9C
	b _02304BB8
_02304B70:
	bl ov11_02307244
	cmp r0, #0
	bne _02304B88
	bl ov11_02308D1C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304B88:
	ldr r0, _02304BC0 ; =0x02324D7C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304BB8
_02304B9C:
	bl ov11_02307334
	cmp r0, #0
	beq _02304BB8
	bl ov11_02300D5C
	bl ov11_02308D1C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304BB8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304BC0: .word 0x02324D7C
	arm_func_end ov11_02304B4C

	arm_func_start ov11_02304BC4
ov11_02304BC4: ; 0x02304BC4
	ldr ip, _02304BD0 ; =sub_020348E4
	ldr r0, _02304BD4 ; =0x02322B7C
	bx ip
	.align 2, 0
_02304BD0: .word sub_020348E4
_02304BD4: .word 0x02322B7C
	arm_func_end ov11_02304BC4

	arm_func_start ov11_02304BD8
ov11_02304BD8: ; 0x02304BD8
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _02304C00 ; =0x02324D80
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304C00: .word 0x02324D80
	arm_func_end ov11_02304BD8

	arm_func_start ov11_02304C04
ov11_02304C04: ; 0x02304C04
	stmdb sp!, {r3, lr}
	ldr r0, _02304C2C ; =0x02324D80
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02304C2C ; =0x02324D80
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304C2C: .word 0x02324D80
	arm_func_end ov11_02304C04

	arm_func_start ov11_02304C30
ov11_02304C30: ; 0x02304C30
	stmdb sp!, {r3, lr}
	ldr r0, _02304CA8 ; =0x02324D80
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02304C54
	cmp r0, #1
	beq _02304C84
	b _02304CA0
_02304C54:
	mov r0, #0
	bl ov11_02309040
	cmp r0, #0
	bne _02304C70
	bl ov11_02309DF8
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304C70:
	ldr r0, _02304CA8 ; =0x02324D80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02304CA0
_02304C84:
	bl ov11_023090DC
	cmp r0, #0
	beq _02304CA0
	bl ov11_02309DF8
	bl ov11_02300D5C
	mov r0, #4
	ldmia sp!, {r3, pc}
_02304CA0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02304CA8: .word 0x02324D80
	arm_func_end ov11_02304C30

	arm_func_start ov11_02304CAC
ov11_02304CAC: ; 0x02304CAC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02304D8C ; =0x02324D84
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	bne _02304CDC
	ldr r0, _02304D90 ; =0x000004C4
	mov r1, #8
	bl MemAlloc
	ldr r1, _02304D8C ; =0x02324D84
	str r0, [r1]
_02304CDC:
	ldr r0, _02304D8C ; =0x02324D84
	ldrh r1, [r5]
	ldr r2, [r0]
	strh r1, [r2]
	ldrh r1, [r5, #2]
	add r0, r2, #0x54
	strh r1, [r2, #2]
	ldrh r1, [r5, #4]
	strh r1, [r2, #4]
	bl ItemZInit
	ldr r0, _02304D8C ; =0x02324D84
	ldr r0, [r0]
	add r0, r0, #0x15c
	bl InitPreprocessorArgs
	ldr r0, _02304D8C ; =0x02324D84
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #2
	str r3, [r1, #0x50]
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r1, [r0]
	strb r2, [r1, #0x4a]
	ldr r1, [r0]
	strb r2, [r1, #0x49]
	ldr r1, [r0]
	strb r2, [r1, #0x4b]
	ldr r1, [r0]
	str r3, [r1, #0x44]
_02304D50:
	ldr r1, [r0]
	add r1, r1, r3
	strb r3, [r1, #0x4bc]
	add r3, r3, #1
	cmp r3, #5
	blt _02304D50
	ldr r1, _02304D8C ; =0x02324D84
	mov r0, #0
	ldr r2, [r1]
	str r0, [r2, #0x1ac]
	ldr r1, [r1]
	strb r4, [r1, #0x4c]
	bl ov11_02304DC8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02304D8C: .word 0x02324D84
_02304D90: .word 0x000004C4
	arm_func_end ov11_02304CAC

	arm_func_start ov11_02304D94
ov11_02304D94: ; 0x02304D94
	stmdb sp!, {r4, lr}
	ldr ip, _02304DC4 ; =0x02324D84
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add ip, r2, r1
	mov r2, #1
	mov r4, r0
	strb lr, [ip, #6]
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02304DC4: .word 0x02324D84
	arm_func_end ov11_02304D94

	arm_func_start ov11_02304DC8
ov11_02304DC8: ; 0x02304DC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x198
	ldr r1, _02305444 ; =0x02324D84
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r4, [r1]
	ldr r0, [r4, #0x38]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _0230543C
_02304DF0: ; jump table
	b _02304E50 ; case 0
	b _02304EA8 ; case 1
	b _02304EDC ; case 2
	b _02304F24 ; case 3
	b _0230527C ; case 4
	b _023052D0 ; case 5
	b _023050BC ; case 6
	b _0230543C ; case 7
	b _0230543C ; case 8
	b _0230543C ; case 9
	b _0230543C ; case 10
	b _02305138 ; case 11
	b _0230523C ; case 12
	b _02305300 ; case 13
	b _02305310 ; case 14
	b _02305374 ; case 15
	b _023053CC ; case 16
	b _0230543C ; case 17
	b _0230543C ; case 18
	b _02305348 ; case 19
	b _02304FE4 ; case 20
	b _0230508C ; case 21
	b _0230543C ; case 22
	b _02305408 ; case 23
_02304E50:
	bl IsBagFull
	cmp r0, #0
	beq _02304E90
	ldr r0, _02305444 ; =0x02324D84
	ldr r1, [r0]
	ldrb r0, [r1, #0x4c]
	cmp r0, #0
	beq _02304E80
	mov r0, #0x17
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _0230543C
_02304E80:
	mov r0, #1
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02304EA8
_02304E90:
	ldr r0, _02305444 ; =0x02324D84
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_02304EA8:
	ldr r0, _02305444 ; =0x02324D84
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldr r2, _02305448 ; =0x000002D7
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _0230543C
_02304EDC:
	mov r0, #3
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02305444 ; =0x02324D84
	mov r3, #3
	ldr r1, [r0]
	rsb r2, r3, #0x2e0
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _0230543C
_02304F24:
	add r0, r4, #0x1b0
	mov r1, #0x2d8
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x18
	str r1, [r4, #0x2b0]
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _02305444 ; =0x02324D84
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _0230544C ; =0x02322B8C
	add r0, r1, #0x5a
	mov r3, #1
	bl sub_0200D310
	ldr r0, _02305444 ; =0x02324D84
	ldr r2, _02305450 ; =0x000002D9
	ldr r5, [r0]
	add ip, sp, #0x18
	ldrsh r3, [r5, #4]
	add r0, r4, #0x2b4
	mov r1, #0x100
	orr r3, r3, #0x10000
	str r3, [sp, #0x28]
	ldrh lr, [r5, #2]
	mov r3, #0
	str lr, [sp, #0x3c]
	ldrb lr, [r5]
	str lr, [sp, #0x40]
	str ip, [sp]
	bl PreprocessStringFromMessageId
	mov r2, #3
	str r2, [r4, #0x3b4]
	mov r0, #0
	strb r0, [r4, #0x3b8]
	mov r1, #1
	str r1, [r4, #0x4b8]
	str r2, [sp]
	ldr r3, _02305444 ; =0x02324D84
	mov r1, #0x11
	ldr r3, [r3]
	mov r2, r0
	add r3, r3, #0x1b0
	bl sub_0202B1AC
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02304FE4:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305444 ; =0x02324D84
	mov r4, #0
	ldr lr, [r0]
	mov r3, #0x15
	ldrh ip, [lr, #0x54]
	ldr r2, _0230544C ; =0x02322B8C
	add r1, sp, #0xc
	strh ip, [sp, #0xc]
	ldrh ip, [lr, #0x56]
	strh ip, [sp, #0xe]
	ldrh ip, [lr, #0x58]
	strh ip, [sp, #0x10]
	strb r4, [sp, #0xc]
	str r3, [lr, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0xda
	bl sub_0200D670
	ldr r0, _02305444 ; =0x02324D84
	ldr r1, [r0]
	add r0, r1, #0xda
	str r0, [r1, #0x194]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02305444 ; =0x02324D84
	mov r4, #0x15
	ldr r3, [r0]
	mov r1, #8
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	add r2, r4, #0x2bc
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _0230543C
_0230508C:
	mov r4, #3
	str r4, [sp, #0x68]
	ldr r0, _02305454 ; =0x02322B98
	ldr r1, _02305458 ; =0x00300033
	ldr r3, _0230545C ; =0x02322BC8
	add r2, sp, #0x68
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_023050BC:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r4, _02305444 ; =0x02324D84
	ldr r0, _02305460 ; =0x02322BA8
	ldr lr, [r4]
	ldr r1, _02305464 ; =0x00001013
	ldrsh ip, [lr, #0x58]
	ldr r3, _02305468 ; =0x000008E4
	mov r2, #0
	str ip, [lr, #0x16c]
	ldr lr, [r4]
	ldrh ip, [lr, #0x56]
	add ip, ip, #0xbc
	str ip, [lr, #0x174]
	ldr r4, [r4]
	add ip, r4, #0x15c
	str ip, [sp]
	ldrsh r4, [r4, #0x58]
	add r4, r4, #0xd1
	add r4, r4, #0x2900
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl sub_0202E3CC
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _0230543C
_02305138:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305444 ; =0x02324D84
	mov r1, #0
	ldr r2, [r0]
	ldrh r0, [r2, #0x54]
	strh r0, [sp, #0x12]
	ldrh r0, [r2, #0x56]
	strh r0, [sp, #0x14]
	ldrh r0, [r2, #0x58]
	strh r0, [sp, #0x16]
	strb r1, [sp, #0x12]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldrsh r3, [sp, #0x16]
	ldr r2, [r0]
	add r1, sp, #0x12
	str r3, [r2, #0x16c]
	ldr r0, [r0]
	ldr r2, _0230544C ; =0x02322B8C
	add r0, r0, #0x5a
	bl sub_0200D670
	ldr r0, _02305444 ; =0x02324D84
	ldr r2, _0230544C ; =0x02322B8C
	ldr r3, [r0]
	add r1, r3, #0x5a
	str r1, [r3, #0x194]
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	add r0, r1, #0xda
	bl sub_0200D670
	ldr r0, _02305444 ; =0x02324D84
	ldr r2, _0230546C ; =0x000002DF
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0xda
	str r3, [r4, #0x198]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	ldr r0, _02305444 ; =0x02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _02305444 ; =0x02324D84
	ldr r0, [r0]
	bl AddItemToBagNoHeld
	cmp r0, #0
	ldrne r0, _02305444 ; =0x02324D84
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0, #0x3c]
	ldreq r0, _02305444 ; =0x02324D84
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0x3c]
	b _0230543C
_0230523C:
	mov r0, r4
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _02305264
	ldr r0, _02305444 ; =0x02324D84
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_02305264:
	ldr r0, _02305444 ; =0x02324D84
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _0230543C
_0230527C:
	add r0, r4, #0x5a
	str r0, [r4, #0x19c]
	ldr r0, [r1]
	mov r1, #5
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02305444 ; =0x02324D84
	mov r3, #5
	ldr r1, [r0]
	ldr r2, _02305470 ; =0x000002D6
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _0230543C
_023052D0:
	mov r4, #3
	str r4, [sp, #0x100]
	ldr r0, _02305454 ; =0x02322B98
	ldr r1, _02305458 ; =0x00300033
	ldr r3, _0230545C ; =0x02322BC8
	add r2, sp, #0x100
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02305300:
	mov r0, #9
	str r0, [r4, #0x38]
	bl ov11_02305488
	b _0230543C
_02305310:
	mov r0, #0xa
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldr r2, _02305474 ; =0x000002DE
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x5a
	str r3, [r4, #0x19c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _0230543C
_02305348:
	ldr r0, _02305478 ; =0x02322BB8
	mov r4, #3
	ldr r3, _0230547C ; =0x02322BE0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _0230543C
_02305374:
	ldrsb r0, [r4, #0x48]
	bl FreeDBox
	ldr r0, _02305444 ; =0x02324D84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r4, [r0]
	bl GetNbItemsInBag
	ldr r2, _02305480 ; =0x02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _0230543C
_023053CC:
	bl GetNbItemsInBag
	ldr r2, _02305480 ; =0x02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305444 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _0230543C
_02305408:
	mov r0, #0xf
	str r0, [r4, #0x3c]
	ldr r0, [r1]
	mov r1, #0x16
	str r1, [r0, #0x38]
	bl ov11_02306194
	ldr r0, _02305444 ; =0x02324D84
	ldr r2, _02305484 ; =0x000002DA
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
_0230543C:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02305444: .word 0x02324D84
_02305448: .word 0x000002D7
_0230544C: .word 0x02322B8C
_02305450: .word 0x000002D9
_02305454: .word 0x02322B98
_02305458: .word 0x00300033
_0230545C: .word 0x02322BC8
_02305460: .word 0x02322BA8
_02305464: .word 0x00001013
_02305468: .word 0x000008E4
_0230546C: .word 0x000002DF
_02305470: .word 0x000002D6
_02305474: .word 0x000002DE
_02305478: .word 0x02322BB8
_0230547C: .word 0x02322BE0
_02305480: .word 0x02304D94
_02305484: .word 0x000002DA
	arm_func_end ov11_02304DC8

	arm_func_start ov11_02305488
ov11_02305488: ; 0x02305488
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x198
	ldr r0, _02305AFC ; =0x02324D84
	ldr r4, [r0]
	ldr r1, [r4, #0x38]
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _02305AF4
_023054A8: ; jump table
	b _02305508 ; case 0
	b _02305560 ; case 1
	b _02305594 ; case 2
	b _023055DC ; case 3
	b _02305934 ; case 4
	b _02305988 ; case 5
	b _02305774 ; case 6
	b _02305AF4 ; case 7
	b _02305AF4 ; case 8
	b _02305AF4 ; case 9
	b _02305AF4 ; case 10
	b _023057F0 ; case 11
	b _023058F4 ; case 12
	b _023059B8 ; case 13
	b _023059C8 ; case 14
	b _02305A2C ; case 15
	b _02305A84 ; case 16
	b _02305AF4 ; case 17
	b _02305AF4 ; case 18
	b _02305A00 ; case 19
	b _0230569C ; case 20
	b _02305744 ; case 21
	b _02305AF4 ; case 22
	b _02305AC0 ; case 23
_02305508:
	bl IsBagFull
	cmp r0, #0
	beq _02305548
	ldr r0, _02305AFC ; =0x02324D84
	ldr r1, [r0]
	ldrb r0, [r1, #0x4c]
	cmp r0, #0
	beq _02305538
	mov r0, #0x17
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305538:
	mov r0, #1
	str r0, [r1, #0x38]
	bl ov11_02305488
	b _02305560
_02305548:
	ldr r0, _02305AFC ; =0x02324D84
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305560:
	ldr r0, _02305AFC ; =0x02324D84
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldr r2, _02305B00 ; =0x000002D7
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _02305AF4
_02305594:
	mov r0, #3
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02305AFC ; =0x02324D84
	mov r3, #3
	ldr r1, [r0]
	rsb r2, r3, #0x2e0
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _02305AF4
_023055DC:
	add r0, r4, #0x1b0
	mov r1, #0x2d8
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x148
	str r1, [r4, #0x2b0]
	bl InitPreprocessorArgs
	mov r1, #0
	ldr r0, _02305AFC ; =0x02324D84
	str r1, [sp]
	ldr r1, [r0]
	ldr r2, _02305B04 ; =0x02322B8C
	add r0, r1, #0x5a
	mov r3, #1
	bl sub_0200D310
	ldr r0, _02305AFC ; =0x02324D84
	ldr r2, _02305B08 ; =0x000002D9
	ldr r5, [r0]
	add ip, sp, #0x148
	ldrsh r3, [r5, #4]
	add r0, r4, #0x2b4
	mov r1, #0x100
	orr r3, r3, #0x10000
	str r3, [sp, #0x158]
	ldrh lr, [r5, #2]
	mov r3, #0
	str lr, [sp, #0x16c]
	ldrb lr, [r5]
	str lr, [sp, #0x170]
	str ip, [sp]
	bl PreprocessStringFromMessageId
	mov r2, #3
	str r2, [r4, #0x3b4]
	mov r0, #0
	strb r0, [r4, #0x3b8]
	mov r1, #1
	str r1, [r4, #0x4b8]
	str r2, [sp]
	ldr r3, _02305AFC ; =0x02324D84
	mov r1, #0x11
	ldr r3, [r3]
	mov r2, r0
	add r3, r3, #0x1b0
	bl sub_0202B1AC
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_0230569C:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305AFC ; =0x02324D84
	mov r4, #0
	ldr lr, [r0]
	mov r3, #0x15
	ldrh ip, [lr, #0x54]
	ldr r2, _02305B04 ; =0x02322B8C
	add r1, sp, #0x12
	strh ip, [sp, #0x12]
	ldrh ip, [lr, #0x56]
	strh ip, [sp, #0x14]
	ldrh ip, [lr, #0x58]
	strh ip, [sp, #0x16]
	strb r4, [sp, #0x12]
	str r3, [lr, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0xda
	bl sub_0200D670
	ldr r0, _02305AFC ; =0x02324D84
	ldr r1, [r0]
	add r0, r1, #0xda
	str r0, [r1, #0x194]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02305AFC ; =0x02324D84
	mov r4, #0x15
	ldr r3, [r0]
	mov r1, #8
	str r4, [r3, #0x3c]
	ldr r3, [r0]
	add r2, r4, #0x2bc
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _02305AF4
_02305744:
	mov r4, #3
	str r4, [sp, #0xb0]
	ldr r0, _02305B0C ; =0x02322B98
	ldr r1, _02305B10 ; =0x00300033
	ldr r3, _02305B14 ; =0x02322BC8
	add r2, sp, #0xb0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_02305774:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r4, _02305AFC ; =0x02324D84
	ldr r0, _02305B18 ; =0x02322BA8
	ldr lr, [r4]
	ldr r1, _02305B1C ; =0x00001013
	ldrsh ip, [lr, #0x58]
	ldr r3, _02305B20 ; =0x000008E4
	mov r2, #0
	str ip, [lr, #0x16c]
	ldr lr, [r4]
	ldrh ip, [lr, #0x56]
	add ip, ip, #0xbc
	str ip, [lr, #0x174]
	ldr r4, [r4]
	add ip, r4, #0x15c
	str ip, [sp]
	ldrsh r4, [r4, #0x58]
	add r4, r4, #0xd1
	add r4, r4, #0x2900
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl sub_0202E3CC
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4b]
	b _02305AF4
_023057F0:
	ldr r0, [r4, #0x44]
	add r1, r4, #0x54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl CopyItemAtIdx
	ldr r0, _02305AFC ; =0x02324D84
	mov r1, #0
	ldr r2, [r0]
	ldrh r0, [r2, #0x54]
	strh r0, [sp, #0xc]
	ldrh r0, [r2, #0x56]
	strh r0, [sp, #0xe]
	ldrh r0, [r2, #0x58]
	strh r0, [sp, #0x10]
	strb r1, [sp, #0xc]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldrsh r3, [sp, #0x10]
	ldr r2, [r0]
	add r1, sp, #0xc
	str r3, [r2, #0x16c]
	ldr r0, [r0]
	ldr r2, _02305B04 ; =0x02322B8C
	add r0, r0, #0x5a
	bl sub_0200D670
	ldr r0, _02305AFC ; =0x02324D84
	ldr r2, _02305B04 ; =0x02322B8C
	ldr r3, [r0]
	add r1, r3, #0x5a
	str r1, [r3, #0x194]
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	str r1, [r3, #0x174]
	ldr r1, [r0]
	add r0, r1, #0xda
	bl sub_0200D670
	ldr r0, _02305AFC ; =0x02324D84
	ldr r2, _02305B24 ; =0x000002DF
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0xda
	str r3, [r4, #0x198]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	ldr r0, _02305AFC ; =0x02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHole
	ldr r0, _02305AFC ; =0x02324D84
	ldr r0, [r0]
	bl AddItemToBagNoHeld
	cmp r0, #0
	ldrne r0, _02305AFC ; =0x02324D84
	movne r1, #7
	ldrne r0, [r0]
	strne r1, [r0, #0x3c]
	ldreq r0, _02305AFC ; =0x02324D84
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0x3c]
	b _02305AF4
_023058F4:
	mov r0, r4
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _0230591C
	ldr r0, _02305AFC ; =0x02324D84
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_0230591C:
	ldr r0, _02305AFC ; =0x02324D84
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x38]
	bl ov11_02305488
	b _02305AF4
_02305934:
	add r1, r4, #0x5a
	str r1, [r4, #0x19c]
	ldr r0, [r0]
	mov r1, #5
	str r1, [r0, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02305AFC ; =0x02324D84
	mov r3, #5
	ldr r1, [r0]
	ldr r2, _02305B28 ; =0x000002D6
	str r3, [r1, #0x3c]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _02305AF4
_02305988:
	mov r4, #3
	str r4, [sp, #0x18]
	ldr r0, _02305B0C ; =0x02322B98
	ldr r1, _02305B10 ; =0x00300033
	ldr r3, _02305B14 ; =0x02322BC8
	add r2, sp, #0x18
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_023059B8:
	mov r0, #9
	str r0, [r4, #0x38]
	bl ov11_02305488
	b _02305AF4
_023059C8:
	mov r0, #0xa
	str r0, [r4, #0x3c]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldr r2, _02305B2C ; =0x000002DE
	ldr r4, [r0]
	mov r1, #0x18
	add r3, r4, #0x5a
	str r3, [r4, #0x19c]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
	b _02305AF4
_02305A00:
	ldr r0, _02305B30 ; =0x02322BB8
	mov r4, #3
	ldr r3, _02305B34 ; =0x02322BE0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x4a]
	b _02305AF4
_02305A2C:
	ldrsb r0, [r4, #0x48]
	bl FreeDBox
	ldr r0, _02305AFC ; =0x02324D84
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x48]
	ldr r4, [r0]
	bl GetNbItemsInBag
	ldr r2, _02305B38 ; =0x02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _02305AF4
_02305A84:
	bl GetNbItemsInBag
	ldr r2, _02305B38 ; =0x02304D94
	add r1, r4, #0xbc
	str r2, [sp]
	add r1, r1, #0x400
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x44]
	add r3, r4, #6
	bl ov10_022BD474
	ldr r1, _02305AFC ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x49]
	b _02305AF4
_02305AC0:
	mov r1, #0xf
	str r1, [r4, #0x3c]
	ldr r0, [r0]
	mov r1, #0x16
	str r1, [r0, #0x38]
	bl ov11_02306194
	ldr r0, _02305AFC ; =0x02324D84
	ldr r2, _02305B3C ; =0x000002DA
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x48]
	add r3, r3, #0x15c
	bl ShowMessageInDBox
_02305AF4:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02305AFC: .word 0x02324D84
_02305B00: .word 0x000002D7
_02305B04: .word 0x02322B8C
_02305B08: .word 0x000002D9
_02305B0C: .word 0x02322B98
_02305B10: .word 0x00300033
_02305B14: .word 0x02322BC8
_02305B18: .word 0x02322BA8
_02305B1C: .word 0x00001013
_02305B20: .word 0x000008E4
_02305B24: .word 0x000002DF
_02305B28: .word 0x000002D6
_02305B2C: .word 0x000002DE
_02305B30: .word 0x02322BB8
_02305B34: .word 0x02322BE0
_02305B38: .word 0x02304D94
_02305B3C: .word 0x000002DA
	arm_func_end ov11_02305488

	arm_func_start ov11_02305B40
ov11_02305B40: ; 0x02305B40
	stmdb sp!, {r4, lr}
	ldr r1, _02305B94 ; =0x02324D84
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _02305B84
	cmp r0, #0
	ldr r4, [r1, #0x1ac]
	ldrnesh r1, [r1, #0x58]
	strneh r1, [r0]
	ldr r0, _02305B94 ; =0x02324D84
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02305B94 ; =0x02324D84
	mov r1, #0
	str r1, [r0]
	b _02305B8C
_02305B84:
	cmp r0, #0
	strneh r4, [r0]
_02305B8C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02305B94: .word 0x02324D84
	arm_func_end ov11_02305B40

	arm_func_start ov11_02305B98
ov11_02305B98: ; 0x02305B98
	stmdb sp!, {r3, lr}
	ldr r0, _02306148 ; =0x02324D84
	ldr r3, [r0]
	ldr r1, [r3, #0x50]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02306140
_02305BB4: ; jump table
	b _02305BC4 ; case 0
	b _02305BD0 ; case 1
	b _02306120 ; case 2
	b _02306138 ; case 3
_02305BC4:
	mov r0, #1
	str r0, [r3, #0x50]
	b _02306140
_02305BD0:
	ldr r1, [r3, #0x38]
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	b _02306090
_02305BE0: ; jump table
	b _023060C0 ; case 0
	b _02306090 ; case 1
	b _02306090 ; case 2
	b _02305C3C ; case 3
	b _02306090 ; case 4
	b _02305CC4 ; case 5
	b _02305FE0 ; case 6
	b _0230602C ; case 7
	b _02306038 ; case 8
	b _02306044 ; case 9
	b _02306044 ; case 10
	b _02306090 ; case 11
	b _023060C0 ; case 12
	b _02306090 ; case 13
	b _02306090 ; case 14
	b _02305D08 ; case 15
	b _02305D08 ; case 16
	b _02305ECC ; case 17
	b _02305F00 ; case 18
	b _02305F24 ; case 19
	b _02306090 ; case 20
	b _02305C80 ; case 21
	b _02306050 ; case 22
_02305C3C:
	ldrsb r0, [r3, #0x4a]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _02305C70
	cmp r0, #2
	beq _02305C60
	cmp r0, #3
	beq _02305C70
	b _023060C0
_02305C60:
	bl ov11_0230614C
	mov r0, #0x17
	bl ov11_02304DC8
	b _023060C0
_02305C70:
	bl ov11_0230614C
	mov r0, #4
	bl ov11_02304DC8
	b _023060C0
_02305C80:
	ldrsb r0, [r3, #0x4a]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _02305CB4
	cmp r0, #2
	beq _02305CA4
	cmp r0, #3
	beq _02305CB4
	b _023060C0
_02305CA4:
	bl ov11_0230614C
	mov r0, #0xb
	bl ov11_02304DC8
	b _023060C0
_02305CB4:
	bl ov11_0230614C
	mov r0, #0x17
	bl ov11_02304DC8
	b _023060C0
_02305CC4:
	ldrsb r0, [r3, #0x4a]
	bl GetNormalMenuResult
	cmp r0, #1
	beq _02305CF8
	cmp r0, #2
	beq _02305CE8
	cmp r0, #3
	beq _02305CF8
	b _023060C0
_02305CE8:
	bl ov11_0230614C
	mov r0, #0xe
	bl ov11_02304DC8
	b _023060C0
_02305CF8:
	bl ov11_0230614C
	mov r0, #0
	bl ov11_02304DC8
	b _023060C0
_02305D08:
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _02305D9C
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BD374
	cmp r0, #0
	beq _02305D9C
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCDA8
	cmp r0, #0
	blt _02305D9C
	ldr r1, _02306148 ; =0x02324D84
	ldr r1, [r1]
	str r0, [r1, #0x44]
	mov r0, #0
	bl sub_02017CCC
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov00_022BCD10
	ldr r0, _02306148 ; =0x02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #6
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305D9C:
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BD374
	cmp r0, #0
	beq _02305E44
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCE58
	ldrh r1, [sp]
	tst r1, #4
	cmpeq r0, #0
	beq _02305E44
	cmp r0, #0
	bne _02305DE4
	mov r0, #5
	bl sub_02017CCC
_02305DE4:
	bl sub_0200FC24
	bl GetNbItemsInBag
	ldr r2, _02306148 ; =0x02324D84
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCC60
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCCB0
	bl IsBagFull
	cmp r0, #0
	bne _02305E44
	ldr r0, _02306148 ; =0x02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x11
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305E44:
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCD68
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCD88
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCDBC
	mvn r1, #0
	cmp r0, r1
	bne _02305EB4
	ldr r1, _02306148 ; =0x02324D84
	mov r3, #2
	ldr r2, [r1]
	mov r0, #0x11
	str r3, [r2, #0x40]
	ldr r1, [r1]
	str r3, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305EB4:
	ldr r1, _02306148 ; =0x02324D84
	ldr r1, [r1]
	str r0, [r1, #0x44]
	mov r0, #0x13
	bl ov11_02304DC8
	b _023060C0
_02305ECC:
	ldr r2, [r3, #0x40]
	sub r1, r2, #1
	str r1, [r3, #0x40]
	cmp r2, #0
	bne _023060C0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov00_022BCCF4
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F00:
	ldr r2, [r3, #0x40]
	sub r1, r2, #1
	str r1, [r3, #0x40]
	cmp r2, #0
	bne _023060C0
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F24:
	ldrsb r0, [r3, #0x4a]
	bl GetNormalMenuResult
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _023060C0
_02305F38: ; jump table
	b _023060C0 ; case 0
	b _02305FBC ; case 1
	b _023060C0 ; case 2
	b _023060C0 ; case 3
	b _02305F54 ; case 4
	b _02305F80 ; case 5
	b _02305FBC ; case 6
_02305F54:
	bl ov11_0230614C
	ldr r0, _02306148 ; =0x02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x11
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305F80:
	bl ov11_0230614C
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCCE0
	ldr r0, _02306148 ; =0x02324D84
	mov r3, #2
	ldr r1, [r0]
	mov r2, #6
	str r3, [r1, #0x40]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x3c]
	bl ov11_02304DC8
	b _023060C0
_02305FBC:
	bl ov11_0230614C
	ldr r0, _02306148 ; =0x02324D84
	mov r2, #0xf
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCC7C
	b _023060C0
_02305FE0:
	ldrsb r0, [r3, #0x4b]
	bl sub_0202E6E4
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4b]
	bl sub_0202E6C8
	ldr r0, _02306148 ; =0x02324D84
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0xf
	strb r3, [r1, #0x4b]
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x49]
	bl ov10_022BCCCC
	b _023060C0
_0230602C:
	bl ov11_022DC504
	mov r2, #3
	b _023060C4
_02306038:
	bl ov11_022DC504
	mov r2, #2
	b _023060C4
_02306044:
	bl ov11_022DC504
	mov r2, #5
	b _023060C4
_02306050:
	ldrsb r0, [r3, #0x48]
	bl IsDBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02306148 ; =0x02324D84
	mov r2, #0x18
	ldr r1, [r0]
	str r2, [r1, #0x38]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	b _023060C0
_02306090:
	ldrsb r0, [r3, #0x48]
	bl IsDBoxActive
	cmp r0, #0
	bne _023060C0
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl ShowDBox
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bl ov11_02304DC8
_023060C0:
	mov r2, #1
_023060C4:
	ldr r0, _02306148 ; =0x02324D84
	ldr r1, [r0]
	str r2, [r1, #0x1ac]
	ldr r2, [r0]
	ldr r1, [r2, #0x1ac]
	cmp r1, #1
	beq _02306140
	cmp r1, #2
	moveq r1, #3
	streq r1, [r2, #0x1ac]
	ldreq r0, [r0]
	streq r1, [r0, #0x50]
	beq _02306140
	mov r1, #2
	str r1, [r2, #0x50]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202836C
	ldr r0, _02306148 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl sub_0202F2C4
	b _02306140
_02306120:
	mov r1, #3
	str r1, [r3, #0x50]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x48]
	bl FreeDBox
	b _02306140
_02306138:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02306140:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02306148: .word 0x02324D84
	arm_func_end ov11_02305B98

	arm_func_start ov11_0230614C
ov11_0230614C: ; 0x0230614C
	stmdb sp!, {r3, lr}
	ldr r0, _02306190 ; =0x02324D84
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02306190 ; =0x02324D84
	ldr r0, [r0]
	ldrsb r0, [r0, #0x4a]
	bl FreeNormalMenu
	ldr r0, _02306190 ; =0x02324D84
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4a]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02306190: .word 0x02324D84
	arm_func_end ov11_0230614C

	arm_func_start ov11_02306194
ov11_02306194: ; 0x02306194
	stmdb sp!, {r3, lr}
	ldr r1, _023061C8 ; =0x02324D84
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x48]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDBox
	ldr r1, _023061C8 ; =0x02324D84
	ldr r1, [r1]
	strb r0, [r1, #0x48]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023061C8: .word 0x02324D84
	arm_func_end ov11_02306194

	arm_func_start ov11_023061CC
ov11_023061CC: ; 0x023061CC
	ldr ip, _023061E0 ; =ov11_023061FC
	mov r2, #1
	mov r3, r2
	mov r1, #3
	bx ip
	.align 2, 0
_023061E0: .word ov11_023061FC
	arm_func_end ov11_023061CC

	arm_func_start ov11_023061E4
ov11_023061E4: ; 0x023061E4
	ldr ip, _023061F8 ; =ov11_023061FC
	mov r2, r1
	mov r1, #3
	mov r3, #0
	bx ip
	.align 2, 0
_023061F8: .word ov11_023061FC
	arm_func_end ov11_023061E4

	arm_func_start ov11_023061FC
ov11_023061FC: ; 0x023061FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _023062B8 ; =0x02324D88
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, #0
	bne _02306234
	mov r0, #0x124
	mov r1, #8
	bl MemAlloc
	ldr r1, _023062B8 ; =0x02324D88
	str r0, [r1]
_02306234:
	ldr r0, _023062B8 ; =0x02324D88
	mov r2, #0
	ldr r1, [r0]
	str r4, [r1, #0x24]
	ldr r1, [r0]
	str r6, [r1, #0x88]
	ldr r1, [r0]
	strb r5, [r1, #0x20]
	ldr r1, [r0]
	str r7, [r1]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	add r0, r0, #0x30
	bl InitPreprocessorArgs
	ldr r1, _023062B8 ; =0x02324D88
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #2
	str r0, [r2, #0x7c]
	ldr r2, [r1]
	str r0, [r2, #0x30]
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r2, [r1]
	strb r3, [r2, #0x21]
	ldr r2, [r1]
	strb r3, [r2, #0x22]
	ldr r1, [r1]
	str r0, [r1, #0x80]
	bl ov11_023062BC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023062B8: .word 0x02324D88
	arm_func_end ov11_023061FC

	arm_func_start ov11_023062BC
ov11_023062BC: ; 0x023062BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x7c
	ldr r1, _02306768 ; =0x02324D88
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	ldr r0, [r2, #0x10]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _02306760
_023062E4: ; jump table
	b _02306344 ; case 0
	b _02306388 ; case 1
	b _023063BC ; case 2
	b _02306404 ; case 3
	b _02306430 ; case 4
	b _02306474 ; case 5
	b _023064B8 ; case 6
	b _02306760 ; case 7
	b _02306760 ; case 8
	b _02306760 ; case 9
	b _02306760 ; case 10
	b _02306524 ; case 11
	b _023065CC ; case 12
	b _02306760 ; case 13
	b _02306600 ; case 14
	b _023066F4 ; case 15
	b _02306760 ; case 16
	b _0230671C ; case 17
	b _02306760 ; case 18
	b _02306610 ; case 19
	b _0230663C ; case 20
	b _0230666C ; case 21
	b _02306760 ; case 22
	b _0230672C ; case 23
_02306344:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02306370
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306388
_02306370:
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306760
_02306388:
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #8
	ldr r3, [r0]
	mov r2, #0x2e0
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	b _02306760
_023063BC:
	mov r0, #3
	str r0, [r2, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDBox
	ldr r0, _02306768 ; =0x02324D88
	mov r3, #3
	ldr r1, [r0]
	rsb r2, r3, #0x2ec
	str r3, [r1, #0x14]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	b _02306760
_02306404:
	ldr r0, _0230676C ; =0x02322C10
	mov r4, #3
	ldr r1, _02306770 ; =0x00300011
	ldr r3, _02306774 ; =0x02322C38
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02306768 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306760
_02306430:
	bl ov11_0230720C
	ldr r0, _02306768 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDBox
	ldr r0, _02306768 ; =0x02324D88
	ldr r2, _02306778 ; =0x000002EA
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306474:
	mov r0, #3
	str r0, [r2, #0x8c]
	mov r0, #2
	str r0, [sp]
	ldr r2, [r1]
	ldr r0, _0230676C ; =0x02322C10
	ldr r1, _0230677C ; =0x00300031
	ldr r3, _02306780 ; =0x02322C20
	add r2, r2, #0x8c
	bl CreateNormalMenu
	ldr r1, _02306768 ; =0x02324D88
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #0x22]
	ldr r0, [r1]
	str r2, [r0, #0x14]
	b _02306760
_023064B8:
	ldrsb r0, [r2, #0x22]
	bl IsNormalMenuActive
	cmp r0, #0
	bne _02306760
	ldr r0, _02306768 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl GetNormalMenuResult
	ldr r1, _02306768 ; =0x02324D88
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x22]
	bl FreeNormalMenu
	cmp r4, #2
	beq _023064FC
	cmp r4, #3
	b _02306510
_023064FC:
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306510:
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306760
_02306524:
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	beq _02306538
	mov r0, #3
	bl sub_02017C50
_02306538:
	ldr r0, _02306768 ; =0x02324D88
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x2c]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #0x218
	ldr ip, [r0]
	mov r2, #0x2e4
	ldr r3, [ip, #4]
	ldrsh r3, [r3, #4]
	str r3, [ip, #0x30]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	ldr r0, _02306768 ; =0x02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl sub_02055B20
	bl sub_0203AF0C
	bl sub_02057180
	ldr r0, _02306768 ; =0x02324D88
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r1, #8]
	beq _02306760
	bl sub_02055D4C
	ldr r1, _02306768 ; =0x02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
	b _02306760
_023065CC:
	ldr r0, [r2]
	cmp r0, #0
	beq _023065E8
	bl sub_02055D4C
	ldr r1, _02306768 ; =0x02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
_023065E8:
	ldr r0, _02306768 ; =0x02324D88
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306760
_02306600:
	mov r0, #0xa
	str r0, [r2, #0x10]
	bl ov11_02306794
	b _02306760
_02306610:
	ldr r0, _02306784 ; =0x02322C00
	mov ip, #4
	ldr r3, _02306788 ; =0x02322C50
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _02306768 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306760
_0230663C:
	ldrsh r1, [r2, #0xc]
	add r0, sp, #4
	bl sub_0205B028
	ldr r1, _02306768 ; =0x02324D88
	add r0, sp, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x88]
	bl sub_0203F150
	ldr r1, _02306768 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x84]
	b _02306760
_0230666C:
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _023066C0
	bl sub_0205633C
	cmp r0, #0
	beq _023066C0
	ldr r0, _02306768 ; =0x02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _023066C0
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	b _02306760
_023066C0:
	ldr r1, _02306768 ; =0x02324D88
	ldr r0, _0230678C ; =0x020B0A48
	ldr r2, [r1]
	ldr r1, [r0]
	ldrsh r2, [r2, #0xc]
	mov r0, #0x44
	mov r3, #0
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	bl PrintIqSkillsMenu
	b _02306760
_023066F4:
	ldrsb r0, [r2, #0x21]
	bl FreeDBox
	ldr r0, _02306768 ; =0x02324D88
	mvn r3, #1
	ldr r2, [r0]
	mov r0, #4
	mov r1, #0
	strb r3, [r2, #0x21]
	bl sub_02039C2C
	b _02306760
_0230671C:
	mov r0, #4
	mov r1, #0
	bl sub_02039C2C
	b _02306760
_0230672C:
	mov r0, #0xf
	str r0, [r2, #0x14]
	ldr r0, [r1]
	mov r1, #0x16
	str r1, [r0, #0x10]
	bl ov11_0230720C
	ldr r0, _02306768 ; =0x02324D88
	ldr r2, _02306790 ; =0x000002E3
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
_02306760:
	add sp, sp, #0x7c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02306768: .word 0x02324D88
_0230676C: .word 0x02322C10
_02306770: .word 0x00300011
_02306774: .word 0x02322C38
_02306778: .word 0x000002EA
_0230677C: .word 0x00300031
_02306780: .word 0x02322C20
_02306784: .word 0x02322C00
_02306788: .word 0x02322C50
_0230678C: .word 0x020B0A48
_02306790: .word 0x000002E3
	arm_func_end ov11_023062BC

	arm_func_start ov11_02306794
ov11_02306794: ; 0x02306794
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x7c
	ldr r0, _02306C38 ; =0x02324D88
	ldr r2, [r0]
	ldr r1, [r2, #0x10]
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _02306C30
_023067B4: ; jump table
	b _02306814 ; case 0
	b _02306858 ; case 1
	b _0230688C ; case 2
	b _023068D4 ; case 3
	b _02306900 ; case 4
	b _02306944 ; case 5
	b _02306988 ; case 6
	b _02306C30 ; case 7
	b _02306C30 ; case 8
	b _02306C30 ; case 9
	b _02306C30 ; case 10
	b _023069F4 ; case 11
	b _02306A9C ; case 12
	b _02306C30 ; case 13
	b _02306AD0 ; case 14
	b _02306BC4 ; case 15
	b _02306C30 ; case 16
	b _02306BEC ; case 17
	b _02306C30 ; case 18
	b _02306AE0 ; case 19
	b _02306B0C ; case 20
	b _02306B3C ; case 21
	b _02306C30 ; case 22
	b _02306BFC ; case 23
_02306814:
	mov r0, #0
	bl GetFirstEmptyMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02306840
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306858
_02306840:
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306C30
_02306858:
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #8
	ldr r3, [r0]
	mov r2, #0x2e0
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	b _02306C30
_0230688C:
	mov r0, #3
	str r0, [r2, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDBox
	ldr r0, _02306C38 ; =0x02324D88
	mov r3, #3
	ldr r1, [r0]
	rsb r2, r3, #0x2ec
	str r3, [r1, #0x14]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	b _02306C30
_023068D4:
	ldr r0, _02306C3C ; =0x02322C10
	mov r4, #3
	ldr r1, _02306C40 ; =0x00300011
	ldr r3, _02306C44 ; =0x02322C38
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _02306C38 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306C30
_02306900:
	bl ov11_0230720C
	ldr r0, _02306C38 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDBox
	ldr r0, _02306C38 ; =0x02324D88
	ldr r2, _02306C48 ; =0x000002EA
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_02306944:
	mov r1, #3
	str r1, [r2, #0x8c]
	mov r1, #2
	str r1, [sp]
	ldr r2, [r0]
	ldr r0, _02306C3C ; =0x02322C10
	ldr r1, _02306C4C ; =0x00300031
	ldr r3, _02306C50 ; =0x02322C20
	add r2, r2, #0x8c
	bl CreateNormalMenu
	ldr r1, _02306C38 ; =0x02324D88
	mov r2, #6
	ldr r3, [r1]
	strb r0, [r3, #0x22]
	ldr r0, [r1]
	str r2, [r0, #0x14]
	b _02306C30
_02306988:
	ldrsb r0, [r2, #0x22]
	bl IsNormalMenuActive
	cmp r0, #0
	bne _02306C30
	ldr r0, _02306C38 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl GetNormalMenuResult
	ldr r1, _02306C38 ; =0x02324D88
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0x22]
	bl FreeNormalMenu
	cmp r4, #2
	beq _023069CC
	cmp r4, #3
	b _023069E0
_023069CC:
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_023069E0:
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x14]
	b _02306C30
_023069F4:
	ldrb r0, [r2, #0x20]
	cmp r0, #0
	beq _02306A08
	mov r0, #3
	bl sub_02017C50
_02306A08:
	ldr r0, _02306C38 ; =0x02324D88
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x2c]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #0x218
	ldr ip, [r0]
	mov r2, #0x2e4
	ldr r3, [ip, #4]
	ldrsh r3, [r3, #4]
	str r3, [ip, #0x30]
	ldr r3, [r0]
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
	ldr r0, _02306C38 ; =0x02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl sub_02055B20
	bl sub_0203AF0C
	bl sub_02057180
	ldr r0, _02306C38 ; =0x02324D88
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r1, #8]
	beq _02306C30
	bl sub_02055D4C
	ldr r1, _02306C38 ; =0x02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
	b _02306C30
_02306A9C:
	ldr r0, [r2]
	cmp r0, #0
	beq _02306AB8
	bl sub_02055D4C
	ldr r1, _02306C38 ; =0x02324D88
	ldr r1, [r1]
	str r0, [r1, #8]
_02306AB8:
	ldr r0, _02306C38 ; =0x02324D88
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl ov11_02306794
	b _02306C30
_02306AD0:
	mov r0, #0xa
	str r0, [r2, #0x10]
	bl ov11_02306794
	b _02306C30
_02306AE0:
	ldr r0, _02306C54 ; =0x02322C00
	mov ip, #4
	ldr r3, _02306C58 ; =0x02322C50
	mov r1, #0x13
	mov r2, #0
	str ip, [sp]
	bl CreateNormalMenu
	ldr r1, _02306C38 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x22]
	b _02306C30
_02306B0C:
	ldrsh r1, [r2, #0xc]
	add r0, sp, #4
	bl sub_0205B028
	ldr r1, _02306C38 ; =0x02324D88
	add r0, sp, #4
	ldr r1, [r1]
	ldr r1, [r1, #0x88]
	bl sub_0203F150
	ldr r1, _02306C38 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x84]
	b _02306C30
_02306B3C:
	ldr r0, [r2, #0x24]
	cmp r0, #0
	bne _02306B90
	bl sub_0205633C
	cmp r0, #0
	beq _02306B90
	ldr r0, _02306C38 ; =0x02324D88
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc]
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _02306B90
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	b _02306C30
_02306B90:
	ldr r1, _02306C38 ; =0x02324D88
	ldr r0, _02306C5C ; =0x020B0A48
	ldr r2, [r1]
	ldr r1, [r0]
	ldrsh r2, [r2, #0xc]
	mov r0, #0x44
	mov r3, #0
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	bl PrintIqSkillsMenu
	b _02306C30
_02306BC4:
	ldrsb r0, [r2, #0x21]
	bl FreeDBox
	ldr r0, _02306C38 ; =0x02324D88
	mvn r3, #1
	ldr r2, [r0]
	mov r0, #4
	mov r1, #0
	strb r3, [r2, #0x21]
	bl sub_02039C2C
	b _02306C30
_02306BEC:
	mov r0, #4
	mov r1, #0
	bl sub_02039C2C
	b _02306C30
_02306BFC:
	mov r1, #0xf
	str r1, [r2, #0x14]
	ldr r0, [r0]
	mov r1, #0x16
	str r1, [r0, #0x10]
	bl ov11_0230720C
	ldr r0, _02306C38 ; =0x02324D88
	ldr r2, _02306C60 ; =0x000002E3
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #0x21]
	add r3, r3, #0x30
	bl ShowMessageInDBox
_02306C30:
	add sp, sp, #0x7c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02306C38: .word 0x02324D88
_02306C3C: .word 0x02322C10
_02306C40: .word 0x00300011
_02306C44: .word 0x02322C38
_02306C48: .word 0x000002EA
_02306C4C: .word 0x00300031
_02306C50: .word 0x02322C20
_02306C54: .word 0x02322C00
_02306C58: .word 0x02322C50
_02306C5C: .word 0x020B0A48
_02306C60: .word 0x000002E3
	arm_func_end ov11_02306794

	arm_func_start ov11_02306C64
ov11_02306C64: ; 0x02306C64
	stmdb sp!, {r4, lr}
	ldr r0, _02306C98 ; =0x02324D88
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _02306C90
	ldr r4, [r0, #8]
	bl MemFree
	ldr r0, _02306C98 ; =0x02324D88
	mov r1, #0
	str r1, [r0]
_02306C90:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02306C98: .word 0x02324D88
	arm_func_end ov11_02306C64

	arm_func_start ov11_02306C9C
ov11_02306C9C: ; 0x02306C9C
	stmdb sp!, {r3, lr}
	ldr r0, _023071C0 ; =0x02324D88
	ldr r2, [r0]
	ldr r1, [r2, #0x28]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _023071B8
_02306CB8: ; jump table
	b _02306CC8 ; case 0
	b _02306CD4 ; case 1
	b _0230717C ; case 2
	b _023071B0 ; case 3
_02306CC8:
	mov r0, #1
	str r0, [r2, #0x28]
	b _023071B8
_02306CD4:
	ldr r0, [r2, #0x10]
	cmp r0, #0x16
	addls pc, pc, r0, lsl #2
	b _023070B0
_02306CE4: ; jump table
	b _02307120 ; case 0
	b _023070B0 ; case 1
	b _023070B0 ; case 2
	b _02306D40 ; case 3
	b _023070B0 ; case 4
	b _023070B0 ; case 5
	b _023070B0 ; case 6
	b _023070E4 ; case 7
	b _02307058 ; case 8
	b _02307060 ; case 9
	b _02307068 ; case 10
	b _023070B0 ; case 11
	b _02307120 ; case 12
	b _02307104 ; case 13
	b _023070B0 ; case 14
	b _02306DE8 ; case 15
	b _02306DDC ; case 16
	b _02306DE8 ; case 17
	b _02306ED0 ; case 18
	b _02306EFC ; case 19
	b _02306FDC ; case 20
	b _02307018 ; case 21
	b _02307070 ; case 22
_02306D40:
	ldrsb r0, [r2, #0x22]
	bl GetNormalMenuResult
	cmp r0, #1
	ldrne r1, _023071C0 ; =0x02324D88
	ldrne r1, [r1]
	strne r0, [r1, #0x1c]
	cmp r0, #1
	beq _02306D84
	cmp r0, #2
	beq _02306D74
	cmp r0, #3
	beq _02306D84
	b _02307120
_02306D74:
	bl ov11_023071C4
	mov r0, #0x17
	bl ov11_023062BC
	b _02307120
_02306D84:
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	beq _02306DA0
	mov r0, #3
	bl sub_02017C50
_02306DA0:
	bl ov11_023071C4
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl FreeDBox
	ldr r0, _023071C0 ; =0x02324D88
	mvn r3, #1
	ldr r1, [r0]
	mov r2, #0xa
	strb r3, [r1, #0x21]
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #0x2c]
	bl ov11_023062BC
	b _02307120
_02306DDC:
	mov r0, #0x11
	bl ov11_023062BC
	b _02307120
_02306DE8:
	bl sub_0203A5A8
	cmp r0, #0
	beq _02306E70
	bl sub_0203A9EC
	cmp r0, #0
	beq _02307120
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _02307120
	bl sub_0203AAB0
	ldr r1, _023071C0 ; =0x02324D88
	ldr r1, [r1]
	strh r0, [r1, #0xc]
	bl GetTeamMember
	ldr r1, _023071C0 ; =0x02324D88
	ldr r1, [r1]
	str r0, [r1, #4]
	mov r0, #0
	bl sub_02017CCC
	bl sub_0203A5F0
	bl sub_0203A51C
	ldr r0, _023071C0 ; =0x02324D88
	mov r3, #0xc
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306E70:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _02306EA8
	bl sub_0203A51C
	ldr r1, _023071C0 ; =0x02324D88
	mov r3, #2
	ldr r2, [r1]
	mov r0, #0x12
	str r3, [r2, #0x18]
	ldr r1, [r1]
	str r3, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306EA8:
	ldr r1, _023071C0 ; =0x02324D88
	ldr r1, [r1]
	strh r0, [r1, #0xc]
	bl GetTeamMember
	ldr r1, _023071C0 ; =0x02324D88
	ldr r1, [r1]
	str r0, [r1, #4]
	mov r0, #0x13
	bl ov11_023062BC
	b _02307120
_02306ED0:
	ldr r1, [r2, #0x18]
	sub r0, r1, #1
	str r0, [r2, #0x18]
	cmp r1, #0
	bne _02307120
	bl sub_0203A51C
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov11_023062BC
	b _02307120
_02306EFC:
	ldrsb r0, [r2, #0x22]
	bl GetNormalMenuResult
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02307120
_02306F10: ; jump table
	b _02307120 ; case 0
	b _02306FC0 ; case 1
	b _02307120 ; case 2
	b _02307120 ; case 3
	b _02306F30 ; case 4
	b _02306F60 ; case 5
	b _02306F90 ; case 6
	b _02306FC0 ; case 7
_02306F30:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =0x02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #4
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306F60:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =0x02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x14
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306F90:
	bl ov11_023071C4
	bl sub_0203A51C
	ldr r0, _023071C0 ; =0x02324D88
	mov r3, #2
	ldr r1, [r0]
	mov r2, #0x15
	str r3, [r1, #0x18]
	ldr r1, [r0]
	mov r0, #0x12
	str r2, [r1, #0x14]
	bl ov11_023062BC
	b _02307120
_02306FC0:
	bl ov11_023071C4
	ldr r0, _023071C0 ; =0x02324D88
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl sub_0203A638
	b _02307120
_02306FDC:
	bl sub_0203F398
	cmp r0, #1
	bne _02307120
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x84]
	bl sub_0202836C
	bl sub_0203F990
	ldr r0, _023071C0 ; =0x02324D88
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1, #0x84]
	bl ov11_023062BC
	b _02307120
_02307018:
	bl sub_02041B7C
	cmp r0, #1
	bne _02307120
	bl sub_020420F4
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _0230704C
	bl sub_0205633C
	cmp r0, #0
	bne _0230704C
	bl sub_020572EC
_0230704C:
	mov r0, #0x10
	bl ov11_023062BC
	b _02307120
_02307058:
	mov r2, #3
	b _02307124
_02307060:
	mov r2, #2
	b _02307124
_02307068:
	mov r2, #4
	b _02307124
_02307070:
	ldrsb r0, [r2, #0x21]
	bl IsDBoxActive
	cmp r0, #0
	bne _02307120
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDBox
	ldr r0, _023071C0 ; =0x02324D88
	mov r2, #0x18
	ldr r1, [r0]
	str r2, [r1, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl sub_0202F2C4
	b _02307120
_023070B0:
	ldrsb r0, [r2, #0x21]
	bl IsDBoxActive
	cmp r0, #0
	bne _02307120
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x21]
	bl ShowDBox
	ldr r0, _023071C0 ; =0x02324D88
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bl ov11_023062BC
	b _02307120
_023070E4:
	ldr r1, [r2, #0x2c]
	sub r0, r1, #1
	str r0, [r2, #0x2c]
	cmp r1, #0
	bgt _02307120
	mov r0, #8
	bl ov11_023062BC
	b _02307120
_02307104:
	ldr r1, [r2, #0x2c]
	sub r0, r1, #1
	str r0, [r2, #0x2c]
	cmp r1, #0
	bgt _02307120
	mov r0, #0xe
	bl ov11_023062BC
_02307120:
	mov r2, #1
_02307124:
	ldr r0, _023071C0 ; =0x02324D88
	ldr r1, [r0]
	str r2, [r1, #0x80]
	ldr r2, [r0]
	ldr r1, [r2, #0x80]
	cmp r1, #1
	beq _023071B8
	cmp r1, #2
	moveq r1, #3
	streq r1, [r2, #0x80]
	ldreq r0, [r0]
	streq r1, [r0, #0x28]
	beq _023071B8
	mov r1, #2
	str r1, [r2, #0x28]
	ldr r0, [r0]
	sub r1, r1, #4
	ldrsb r0, [r0, #0x21]
	cmp r0, r1
	beq _023071B8
	bl sub_0202F2C4
	b _023071B8
_0230717C:
	mov r1, #3
	str r1, [r2, #0x28]
	ldr r0, [r0]
	sub r1, r1, #5
	ldrsb r0, [r0, #0x21]
	cmp r0, r1
	beq _023071B8
	bl FreeDBox
	ldr r0, _023071C0 ; =0x02324D88
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x21]
	b _023071B8
_023071B0:
	ldr r0, [r2, #0x80]
	ldmia sp!, {r3, pc}
_023071B8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023071C0: .word 0x02324D88
	arm_func_end ov11_02306C9C

	arm_func_start ov11_023071C4
ov11_023071C4: ; 0x023071C4
	stmdb sp!, {r3, lr}
	ldr r0, _02307208 ; =0x02324D88
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02307208 ; =0x02324D88
	ldr r0, [r0]
	ldrsb r0, [r0, #0x22]
	bl FreeNormalMenu
	ldr r0, _02307208 ; =0x02324D88
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x22]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02307208: .word 0x02324D88
	arm_func_end ov11_023071C4

	arm_func_start ov11_0230720C
ov11_0230720C: ; 0x0230720C
	stmdb sp!, {r3, lr}
	ldr r1, _02307240 ; =0x02324D88
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x21]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDBox
	ldr r1, _02307240 ; =0x02324D88
	ldr r1, [r1]
	strb r0, [r1, #0x21]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02307240: .word 0x02324D88
	arm_func_end ov11_0230720C

	arm_func_start ov11_02307244
ov11_02307244: ; 0x02307244
	stmdb sp!, {r3, lr}
	mov r0, #0x330
	mov r1, #8
	bl MemAlloc
	ldr r1, _023072FC ; =0x02324D8C
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x31c
	bl sub_020580C4
	ldr r2, _023072FC ; =0x02324D8C
	mvn lr, #1
	ldr r0, [r2]
	add ip, lr, #1
	strb lr, [r0, #4]
	ldr r0, [r2]
	mov r3, #0
	strb lr, [r0, #5]
	ldr r1, [r2]
	mov r0, #1
	strb lr, [r1, #6]
	ldr r1, [r2]
	strb lr, [r1, #7]
	ldr r1, [r2]
	strb lr, [r1, #8]
	ldr r1, [r2]
	strb lr, [r1, #9]
	ldr r1, [r2]
	strb lr, [r1, #0xa]
	ldr r1, [r2]
	strb lr, [r1, #0xb]
	ldr r1, [r2]
	strb lr, [r1, #0xc]
	ldr r1, [r2]
	str ip, [r1, #0x18]
	ldr r1, [r2]
	str r3, [r1, #0x10]
	ldr r1, [r2]
	add r1, r1, #0x200
	strh ip, [r1, #0x54]
	ldr r1, [r2]
	str r3, [r1]
	ldr r1, [r2]
	str r3, [r1, #0x324]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023072FC: .word 0x02324D8C
	arm_func_end ov11_02307244

	arm_func_start ov11_02307300
ov11_02307300: ; 0x02307300
	stmdb sp!, {r4, lr}
	ldr ip, _02307330 ; =0x02324D8C
	mov r3, r2
	ldr r2, [ip]
	mov lr, #0
	add ip, r2, r1
	mov r2, #1
	mov r4, r0
	strb lr, [ip, #0x104]
	bl ov10_022BD394
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02307330: .word 0x02324D8C
	arm_func_end ov11_02307300

	arm_func_start ov11_02307334
ov11_02307334: ; 0x02307334
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x5a0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r4, [r0]
	ldr r1, [r4]
	cmp r1, #0x29
	addls pc, pc, r1, lsl #2
	b _02308CF0
_02307354: ; jump table
	b _023073FC ; case 0
	b _023074B8 ; case 1
	b _02307464 ; case 2
	b _023078D4 ; case 3
	b _02308844 ; case 4
	b _02308940 ; case 5
	b _023089C0 ; case 6
	b _02308A14 ; case 7
	b _02308A54 ; case 8
	b _02308A88 ; case 9
	b _02308AB4 ; case 10
	b _02308B70 ; case 11
	b _02308BB0 ; case 12
	b _02308C4C ; case 13
	b _02308C84 ; case 14
	b _02308C90 ; case 15
	b _02308CE8 ; case 16
	b _02307A14 ; case 17
	b _02307A30 ; case 18
	b _02307C14 ; case 19
	b _02307CD0 ; case 20
	b _02307D08 ; case 21
	b _02307E68 ; case 22
	b _02307F20 ; case 23
	b _02307F58 ; case 24
	b _02307F84 ; case 25
	b _02308658 ; case 26
	b _0230871C ; case 27
	b _02308748 ; case 28
	b _023087A0 ; case 29
	b _023087D4 ; case 30
	b _023081D0 ; case 31
	b _02308214 ; case 32
	b _02308054 ; case 33
	b _023080BC ; case 34
	b _023083E0 ; case 35
	b _02308450 ; case 36
	b _02308470 ; case 37
	b _023084AC ; case 38
	b _023085C8 ; case 39
	b _02308614 ; case 40
	b _0230880C ; case 41
_023073FC:
	bl GetNbItemsInBag
	ldr r2, _023082B8 ; =ov11_02307300
	add r1, r4, #0x31c
	str r2, [sp]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r2, [r4, #0x10]
	add r3, r4, #0x104
	bl ov10_022BD474
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r2, [r2]
	strb r0, [r2, #4]
	ldr r0, _023082BC ; =0x02322C88
	bl sub_0202F8C4
	ldr r1, _023082B4 ; =0x02324D8C
	mvn r3, #0
	ldr r4, [r1]
	mov r2, #1
	strb r0, [r4, #5]
	ldr r0, [r1]
	str r3, [r0, #0x18]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02307464:
	bl ov11_02304AC4
	cmp r0, #0
	bne _02307494
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCCE0
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307494:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCC7C
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023074B8:
	add r1, sp, #0xe
	mov r0, #0
	bl GetPressedButtons
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCE58
	ldrh r1, [sp, #0xe]
	tst r1, #4
	bne _023074EC
	tst r1, #0x800
	cmpeq r0, #0
	beq _02307548
_023074EC:
	cmp r0, #0
	bne _023074FC
	mov r0, #5
	bl sub_02017CCC
_023074FC:
	bl sub_0200FC24
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x10]
	bl GetNbItemsInBag
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #4]
	bl ov10_022BCC60
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x18]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCCB0
	b _02308CF0
_02307548:
	ldr r1, _023082B4 ; =0x02324D8C
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r5, [r1, #5]
	cmp r5, r0
	beq _0230760C
	ldrsb r0, [r1, #4]
	bl ov10_022BCDA8
	ldr r1, _023082B4 ; =0x02324D8C
	mov r4, r0
	ldr r0, [r1]
	ldr r0, [r0, #0x18]
	cmp r0, r4
	beq _0230760C
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldr r1, _023082B4 ; =0x02324D8C
	mov r6, r0
	ldr r1, [r1]
	mov r0, r5
	str r4, [r1, #0x18]
	bl sub_02027B1C
	ldrb r0, [r6]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023075E4
	ldrsh r0, [r6, #4]
	add r0, r0, #0x49
	add r0, r0, #0x2f00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromMessageId
	mov r1, r0
	add r0, sp, #0x20
	bl Strcpy
	b _023075F0
_023075E4:
	ldr r1, _023082C0 ; =0x02322DB0
	add r0, sp, #0x20
	bl Strcpy
_023075F0:
	mov r1, #2
	add r3, sp, #0x20
	mov r0, r5
	mov r2, r1
	bl sub_02026214
	mov r0, r5
	bl sub_02027AF0
_0230760C:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCD68
	cmp r0, #0
	bne _02307840
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCDBC
	cmp r0, #0
	blt _0230781C
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldr r1, _023082B4 ; =0x02324D8C
	mov r4, r0
	ldr r0, [r1]
	ldrsh r1, [r4, #4]
	add r0, r0, #0x200
	strh r1, [r0, #0x4e]
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrne r0, _023082B4 ; =0x02324D8C
	ldrnesh r1, [r4, #4]
	ldreq r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	moveq r1, #0
	add r0, r0, #0x200
	strh r1, [r0, #0x4e]
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl GetItemCategoryVeneer
	mov r5, r0
	bl GetGameMode
	mov r6, r0
	cmp r5, #5
	bne _0230777C
	cmp r6, #4
	cmpne r6, #5
	beq _0230777C
	mov sb, #0
	mov r8, sb
	mov r7, #3
	ldr r6, _023082C4 ; =0x02322D38
	ldr r5, _023082B4 ; =0x02324D8C
	ldr r4, _023082C8 ; =0x000002B6
	b _02307734
_023076F4:
	ldr r0, [r5]
	cmp r1, r4
	add r0, r0, sb
	strb r8, [r0, #0x276]
	bne _02307728
	ldr r0, [r5]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl ov11_02309E48
	cmp r0, #0
	ldreq r0, [r5]
	addeq r0, r0, sb
	streqb r7, [r0, #0x276]
_02307728:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02307734:
	mov r0, sb, lsl #3
	ldrh r1, [r6, r0]
	cmp r1, #0
	bne _023076F4
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r0, _023082CC ; =0x02322CB8
	ldr r2, [r1]
	ldr r1, _023082D0 ; =0x00400213
	add r2, r2, #0x76
	add r4, r2, #0x200
	add r2, sp, #0x470
	mov r3, r6
	str r4, [sp, #0x4d0]
	bl sub_0202A5CC
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _02307808
_0230777C:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl IsGummi
	cmp r0, #0
	cmpne r6, #4
	cmpne r6, #5
	ldr r1, _023082D4 ; =0x00400013
	beq _023077C4
	ldr r0, _023082CC ; =0x02322CB8
	ldr r3, _023082D8 ; =0x02322D88
	mov r2, #0
	bl sub_0202A5CC
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _02307808
_023077C4:
	ldrb r0, [r4, #1]
	mov r2, #0
	cmp r0, #0
	beq _023077F0
	ldr r0, _023082DC ; =0x02322CA8
	ldr r3, _023082E0 ; =0x02322D10
	bl sub_0202A5CC
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
	b _02307808
_023077F0:
	ldr r0, _023082DC ; =0x02322CA8
	ldr r3, _023082E4 ; =0x02322D60
	bl sub_0202A5CC
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	strb r0, [r1, #6]
_02307808:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_0230781C:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov00_022BCD10
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0xe
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307840:
	add r1, sp, #0xc
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0xc]
	tst r0, #8
	beq _02308CF0
	mov r0, #0
	bl sub_02017CCC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCDF4
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCDA8
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	ldrsb r0, [r0, #5]
	bl sub_0202F918
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov00_022BCCF4
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0xa
	strb r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023078D4:
	ldrsb r0, [r4, #6]
	bl sub_0202AB40
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_0202ABB0
	cmp r0, #8
	beq _023079E4
	ldr r1, _023082B4 ; =0x02324D8C
	cmp r0, #0
	ldr r1, [r1]
	str r0, [r1, #0x14]
	bne _02307928
	bl ov11_02308D48
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307928:
	cmp r0, #1
	bne _02307948
	bl ov11_02308D48
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307948:
	cmp r0, #2
	bne _0230798C
	add r2, sp, #0x500
	mov r4, #5
	ldr r0, _023082E8 ; =0x02322C98
	ldr r3, _023082EC ; =0x02322CD8
	add r2, r2, #8
	mov r1, #0x33
	str r4, [sp, #0x508]
	bl sub_0202A5CC
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #7]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_0230798C:
	cmp r0, #6
	bne _023079AC
	bl ov11_02308D48
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023079AC:
	cmp r0, #7
	bne _023079CC
	bl ov11_02308D48
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x18
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023079CC:
	bl ov11_02308D48
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023079E4:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_0202AABC
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #6]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307A14:
	mov r0, #1
	bl ov11_02309040
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307A30:
	bl ov11_023090DC
	cmp r0, #0
	beq _02308CF0
	bl ov11_02309E24
	mvn r1, #0
	cmp r0, r1
	beq _02307BFC
	ldr r1, _023082B4 ; =0x02324D8C
	add r0, sp, #0x18
	ldr r4, [r1]
	add r5, r4, #0x238
	bl ov11_02309DAC
	add r1, sp, #0x18
	mov r0, r5
	bl ov11_02308F4C
	ldr r2, [r5, #0x10]
	ldr r0, _023082B4 ; =0x02324D8C
	ldrsh r1, [r5, #8]
	ldr r0, [r0]
	ldrsh r2, [r2]
	add r0, r0, #0x280
	bl GetLearnableIqSkills
	ldr r1, _023082B4 ; =0x02324D8C
	mvn r2, #0
	ldr r3, [r1]
	str r0, [r3, #0x30c]
	ldr r0, [r1]
	add r0, r0, #0x200
	strh r2, [r0, #0x50]
	ldr r2, [r5, #0x10]
	ldr r0, [r1]
	ldrsh r2, [r2]
	str r2, [r0, #0x318]
	ldr r6, [r1]
	ldr r1, [r4, #0x238]
	add r0, r6, #0x200
	cmp r1, #0
	ldrsh r4, [r0, #0x4e]
	bne _02307AE8
	ldrsh r0, [r5, #4]
	bl GetTeamMember
	mov r1, r4
	add r3, r6, #0x250
	mov r2, #1
	bl sub_02011528
	b _02307B08
_02307AE8:
	cmp r1, #1
	bne _02307B08
	ldrsh r0, [r5, #4]
	bl GetActiveTeamMember
	mov r1, r4
	add r3, r6, #0x250
	mov r2, #1
	bl sub_02011554
_02307B08:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r1, [r5, #0x10]
	ldr r2, [r0]
	ldrsh r0, [r1]
	ldr r1, [r2, #0x318]
	sub r0, r1, r0
	str r0, [r2, #0x318]
	bl ov11_022DC504
	ldr r0, [r5]
	cmp r0, #1
	bne _02307B3C
	ldrsh r0, [r5, #4]
	bl sub_02058794
_02307B3C:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, [r5, #0x10]
	ldr r0, [r0]
	ldrsh r1, [r5, #8]
	add r0, r0, #0xc5
	ldrsh r2, [r2]
	add r0, r0, #0x200
	bl GetLearnableIqSkills
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #1
	ldr r3, [r1]
	str r0, [r3, #0x310]
	ldr r0, [r1]
	str r2, [r0, #0x314]
	ldr r0, [r1]
	add r0, r0, #0x200
	ldrsh r4, [r0, #0x50]
	bl ov11_02308EDC
	cmp r4, #0
	blt _02307BCC
	cmp r4, #3
	bgt _02307BCC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHoleCheck
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #0x13
	str r3, [r2, #0x18]
	ldr r0, [r0]
	str r1, [r0]
	b _02307C0C
_02307BCC:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, _023082F0 ; =0x000002BE
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _02307C0C
_02307BFC:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
_02307C0C:
	bl ov11_02309DF8
	b _02308CF0
_02307C14:
	add r0, r4, #0x200
	ldrsh r1, [r0, #0x50]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02307C58
_02307C28: ; jump table
	b _02307C38 ; case 0
	b _02307C40 ; case 1
	b _02307C48 ; case 2
	b _02307C50 ; case 3
_02307C38:
	ldr r5, _023082F4 ; =0x000002B9
	b _02307C5C
_02307C40:
	ldr r5, _023082F8 ; =0x000002BA
	b _02307C5C
_02307C48:
	ldr r5, _023082FC ; =0x000002BB
	b _02307C5C
_02307C50:
	mov r5, #0x2bc
	b _02307C5C
_02307C58:
	mov r5, #0
_02307C5C:
	ldr r0, [r4, #0x318]
	cmp r0, #0
	bne _02307C78
	cmp r1, #0
	blt _02307C78
	cmp r1, #3
	ldrle r5, _02308300 ; =0x000002BD
_02307C78:
	cmp r5, #0
	moveq r0, #0x10
	streq r0, [r4]
	beq _02308CF0
	add r0, r4, #0x238
	bl ov11_0230901C
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	str r0, [r1, #0xb4]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	mov r2, r5
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307CD0:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307D08:
	mov r2, #1
	mov r1, #0
	mov r0, r2
	mov r3, r1
_02307D18:
	ldr r6, _023082B4 ; =0x02324D8C
	mov r5, r3
	ldr ip, [r6]
	mov r6, r3
	mov sb, r3
	ldr lr, [ip, #0x30c]
	b _02307D50
_02307D34:
	add r7, ip, sb
	ldrb r7, [r7, #0x280]
	ldr r8, [ip, #0x314]
	cmp r8, r7
	moveq r5, r2
	beq _02307D58
	add sb, sb, #1
_02307D50:
	cmp sb, lr
	blt _02307D34
_02307D58:
	ldr r8, _023082B4 ; =0x02324D8C
	mov r7, r1
	ldr ip, [r8]
	ldr lr, [ip, #0x310]
	b _02307D88
_02307D6C:
	add r8, ip, r7
	ldrb r8, [r8, #0x2c5]
	ldr sb, [ip, #0x314]
	cmp sb, r8
	moveq r6, r0
	beq _02307D90
	add r7, r7, #1
_02307D88:
	cmp r7, lr
	blt _02307D6C
_02307D90:
	cmp r5, r6
	beq _02307E2C
	add r0, r4, #0x238
	bl ov11_0230901C
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r2, [r1]
	str r0, [r2, #0xb4]
	ldr r2, [r1]
	mov r0, #4
	ldr r1, [r2, #0x314]
	str r1, [r2, #0xc4]
	bl sub_02017C50
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, _02308304 ; =0x000002BF
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r1, [r0]
	ldr r0, [r1, #0x244]
	ldr r1, [r1, #0x314]
	and r1, r1, #0xff
	bl EnableIqSkill
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308FD0
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x14
	ldr r3, [r0]
	ldr r2, [r3, #0x314]
	add r2, r2, #1
	str r2, [r3, #0x314]
	ldr r0, [r0]
	str r1, [r0]
	b _02307E4C
_02307E2C:
	ldr r6, [r4, #0x314]
	ldr r5, _023082B4 ; =0x02324D8C
	add r6, r6, #1
	str r6, [r4, #0x314]
	ldr r4, [r5]
	ldr r5, [r4, #0x314]
	cmp r5, #0x45
	blt _02307D18
_02307E4C:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r1, [r0]
	ldr r0, [r1, #0x314]
	cmp r0, #0x45
	movge r0, #0x16
	strge r0, [r1]
	b _02308CF0
_02307E68:
	add r0, r4, #0x200
	ldrh r0, [r0, #0x52]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02307EC8
_02307E7C: ; jump table
	b _02307EA0 ; case 0
	b _02307EA8 ; case 1
	b _02307EB0 ; case 2
	b _02307EC8 ; case 3
	b _02307EB8 ; case 4
	b _02307EC8 ; case 5
	b _02307EC8 ; case 6
	b _02307EC8 ; case 7
	b _02307EC0 ; case 8
_02307EA0:
	mov r0, #0
	b _02307ECC
_02307EA8:
	ldr r0, _02308308 ; =0x000002C1
	b _02307ECC
_02307EB0:
	ldr r0, _0230830C ; =0x000002C2
	b _02307ECC
_02307EB8:
	ldr r0, _02308310 ; =0x000002C3
	b _02307ECC
_02307EC0:
	mov r0, #0x2c4
	b _02307ECC
_02307EC8:
	mov r0, #0x2c0
_02307ECC:
	cmp r0, #0
	moveq r0, #0x10
	streq r0, [r4]
	beq _02308CF0
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, _02308304 ; =0x000002BF
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x17
	ldr r3, [r0]
	ldr r2, [r3, #0x314]
	add r2, r2, #1
	str r2, [r3, #0x314]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307F20:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307F58:
	ldr r0, [r4, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	bl ov11_02309084
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x19
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02307F84:
	bl ov11_023090DC
	cmp r0, #0
	beq _02308CF0
	bl ov11_02309E24
	mvn r1, #0
	cmp r0, r1
	beq _0230803C
	ldr r1, _023082B4 ; =0x02324D8C
	add r0, sp, #0x10
	ldr r4, [r1]
	bl ov11_02309DAC
	add r1, sp, #0x10
	add r0, r4, #0x238
	bl ov11_02308F4C
	add r0, r4, #0x238
	bl ov11_02308FEC
	bl sub_020415BC
	cmp r0, #0
	ldrne r0, _023082B4 ; =0x02324D8C
	movne r1, #0x1d
	ldrne r0, [r0]
	strne r1, [r0]
	bne _0230804C
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl IsHM
	cmp r0, #0
	bne _02308028
	ldrsh r2, [r4, #4]
	mov r0, r4
	mov r1, #0xbb
	sub r2, r2, #0xbc
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl SetItemAcquired
_02308028:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0]
	b _0230804C
_0230803C:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
_0230804C:
	bl ov11_02309DF8
	b _02308CF0
_02308054:
	add r0, r4, #0x200
	ldrsh r2, [r0, #0x40]
	ldrb r3, [r4, #0x242]
	add r0, r4, #0x328
	mov r1, #2
	bl sub_02053CA0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4e]
	bl GetItemMoveId16
	bl sub_0203FD14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	add r3, r0, #0x328
	mov r0, #6
	bl sub_0204019C
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #0x22
	ldr r3, [r1]
	strb r0, [r3, #0xa]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_023080BC:
	bl sub_020407EC
	cmp r0, #1
	beq _023080F0
	cmp r0, #2
	beq _023080DC
	cmp r0, #7
	beq _02308124
	b _02308CF0
_023080DC:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x1f
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023080F0:
	bl sub_020407C0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl sub_020308A0
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x18
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308124:
	bl sub_02041094
	cmp r0, #4
	bge _02308168
	bl sub_0203FD38
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl Memcpy
	bl sub_02041094
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	add r1, r1, #0x200
	strh r0, [r1, #0x54]
	b _0230819C
_02308168:
	bl sub_0203FD2C
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #8
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl Memcpy
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x200
	strh r1, [r0, #0x54]
_0230819C:
	bl sub_020407C0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl sub_020308A0
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x27
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023081D0:
	mov r1, #1
	str r1, [r4, #0x1c]
	mov r1, #3
	str r1, [sp]
	ldr r1, [r0]
	ldr r0, _02308314 ; =0x02322CC8
	ldr r3, _02308318 ; =0x02322CF0
	add r2, r1, #0x1c
	mov r1, #0x33
	bl CreateNormalMenu
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #0x20
	ldr r3, [r1]
	strb r0, [r3, #0xc]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308214:
	ldrsb r0, [r4, #0xc]
	bl IsNormalMenuActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc]
	bl GetNormalMenuResult
	ldr r1, _023082B4 ; =0x02324D8C
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0xc]
	bl FreeNormalMenu
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	cmp r4, #0
	strb r1, [r0, #0xc]
	beq _02308274
	cmp r4, #1
	beq _0230831C
	cmp r4, #2
	beq _023083C8
	b _02308CF0
_02308274:
	bl sub_02041094
	ldr r2, _023082B4 ; =0x02324D8C
	ldr r1, [r2]
	add r1, r1, #0x200
	strh r0, [r1, #0x4c]
	ldr r0, [r2]
	ldrsb r0, [r0, #0xa]
	bl sub_020308A0
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x23
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
	.align 2, 0
_023082B4: .word 0x02324D8C
_023082B8: .word ov11_02307300
_023082BC: .word 0x02322C88
_023082C0: .word 0x02322DB0
_023082C4: .word 0x02322D38
_023082C8: .word 0x000002B6
_023082CC: .word 0x02322CB8
_023082D0: .word 0x00400213
_023082D4: .word 0x00400013
_023082D8: .word 0x02322D88
_023082DC: .word 0x02322CA8
_023082E0: .word 0x02322D10
_023082E4: .word 0x02322D60
_023082E8: .word 0x02322C98
_023082EC: .word 0x02322CD8
_023082F0: .word 0x000002BE
_023082F4: .word 0x000002B9
_023082F8: .word 0x000002BA
_023082FC: .word 0x000002BB
_02308300: .word 0x000002BD
_02308304: .word 0x000002BF
_02308308: .word 0x000002C1
_0230830C: .word 0x000002C2
_02308310: .word 0x000002C3
_02308314: .word 0x02322CC8
_02308318: .word 0x02322CF0
_0230831C:
	bl sub_02041094
	cmp r0, #4
	bge _02308360
	bl sub_0203FD38
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl Memcpy
	bl sub_02041094
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	add r1, r1, #0x200
	strh r0, [r1, #0x54]
	b _02308394
_02308360:
	bl sub_0203FD2C
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, r0
	ldr r0, [r2]
	mov r2, #8
	add r0, r0, #0x56
	add r0, r0, #0x200
	bl Memcpy
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x200
	strh r1, [r0, #0x54]
_02308394:
	bl sub_020407C0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl sub_020308A0
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x27
	strb r3, [r2, #0xa]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023083C8:
	bl sub_020416FC
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x22
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023083E0:
	add r0, r4, #0x200
	ldrsh r0, [r0, #0x4c]
	bl sub_02041154
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r4, _02308CFC ; =0x000008D7
	ldr r2, [r1]
	str r0, [r2, #0xc4]
	ldr r0, [r1]
	add r0, r0, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #3
	bge _0230841C
	bl sub_02041364
	cmp r0, #0
	subne r4, r4, #1
_0230841C:
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	mov r2, r4
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x24
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308450:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	ldreq r0, _023082B4 ; =0x02324D8C
	moveq r1, #0x25
	ldreq r0, [r0]
	streq r1, [r0]
	b _02308CF0
_02308470:
	add r2, sp, #0x500
	mov r4, #5
	ldr r3, _023082EC ; =0x02322CD8
	add r2, r2, #8
	mov r0, #0
	mov r1, #0x33
	str r4, [sp, #0x508]
	bl sub_0202A5CC
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #0x26
	ldr r3, [r1]
	strb r0, [r3, #7]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_023084AC:
	ldrsb r0, [r4, #7]
	bl sub_0202AB40
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202ABB0
	cmp r0, #4
	bne _02308570
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl IsHM
	cmp r0, #0
	bne _0230852C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02308510
	bl sub_020582E0
_02308510:
	ldrsh r2, [r4, #4]
	mov r0, r4
	mov r1, #0xbb
	sub r2, r2, #0xbc
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl SetItemAcquired
_0230852C:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r2, #0x1a
	ldr r1, [r0]
	str r2, [r1]
	ldr r1, [r0]
	add r0, r1, #0x200
	ldrsh r0, [r0, #0x4c]
	cmp r0, #4
	movge r0, #0x1b
	strge r0, [r1]
	bge _02308594
	bl sub_02041484
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0]
	b _02308594
_02308570:
	bl sub_020407C0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308FEC
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0]
_02308594:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202AABC
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #7]
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02308F14
	b _02308CF0
_023085C8:
	add r0, r4, #0x200
	ldrsh r0, [r0, #0x54]
	mov r3, #1
	cmp r0, #0
	movlt r2, #0
	movge r2, r0
	cmp r0, #0
	movlt r1, #1
	add r0, r4, #0x56
	movge r1, #4
	add r0, r0, #0x200
	bl sub_020417A8
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #0x28
	ldr r3, [r1]
	strb r0, [r3, #0xb]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308614:
	ldrsb r0, [r4, #0xb]
	bl sub_0202E6E4
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl sub_0202E6C8
	bl sub_02041A00
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x21
	strb r3, [r2, #0xb]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308658:
	add r0, r4, #0x200
	ldrsh r0, [r0, #0x4e]
	bl GetItemMoveId16
	mov r4, r0
	ldr r0, _02308D00 ; =0x0000131B
	mov r1, #0x100
	bl sub_02017C74
	mov r0, r4
	bl sub_02041614
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r1, [r0]
	ldr r0, [r1, #0x238]
	add r1, r1, #0x238
	cmp r0, #0
	bne _023086A0
	ldrsh r0, [r1, #4]
	bl sub_0203FD80
	b _023086B0
_023086A0:
	cmp r0, #1
	bne _023086B0
	ldrsh r0, [r1, #4]
	bl sub_0203FDEC
_023086B0:
	bl sub_020407C0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r1, [r0]
	str r4, [r1, #0xc4]
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308DD8
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	str r0, [r1, #0xec]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, _02308D04 ; =0x00000F23
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x238
	bl ov11_02308FD0
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x29
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_0230871C:
	bl sub_020407C0
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x1c
	ldr r0, [r0]
	str r1, [r0]
	bl sub_020037A4
	ldr r1, _023082B4 ; =0x02324D8C
	add r2, r0, #0xa
	ldr r0, [r1]
	str r2, [r0, #0x32c]
	b _02308CF0
_02308748:
	bl sub_020037A4
	ldr r1, [r4, #0x32c]
	cmp r0, r1
	ble _02308CF0
	add r0, r4, #0x238
	bl ov11_02308DD8
	ldr r1, _023082B4 ; =0x02324D8C
	ldr r1, [r1]
	str r0, [r1, #0xec]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, _02308D08 ; =0x00000F24
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x29
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023087A0:
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x18
	ldr r0, [r0]
	add r2, r1, #0xf10
	ldrsb r0, [r0, #8]
	mov r3, #0
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x1e
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023087D4:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_0230880C:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308844:
	ldrsb r0, [r4, #7]
	bl sub_0202AB40
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202ABB0
	ldr r1, _023082B4 ; =0x02324D8C
	mov r3, #2
	ldr r2, [r1]
	cmp r0, #8
	str r3, [r2]
	beq _02308900
	cmp r0, #4
	bne _02308900
	ldr r3, [r1]
	mov r2, #0
	add r0, r3, #0x200
	ldrsh r0, [r0, #0x4e]
	str r0, [r3, #0xc4]
	ldr r0, [r1]
	str r2, [r0, #0xd8]
	ldr r0, [r1]
	ldr r0, [r0, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItemNoHoleCheck
	bl ov11_022DC504
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x18]
	bl GetNbItemsInBag
	ldr r2, _023082B4 ; =0x02324D8C
	mov r1, r0
	ldr r0, [r2]
	ldrsb r0, [r0, #4]
	bl ov10_022BCC60
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov10_022BCCE0
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
_02308900:
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl sub_0202AABC
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #7]
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl sub_0202AABC
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
	b _02308CF0
_02308940:
	ldrsb r0, [r4, #4]
	bl ov10_022BCD68
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202F918
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov00_022BCCF4
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
	bl ov11_02308EDC
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r2, _02308D0C ; =0x000002CB
	ldr r3, [r0]
	mov r1, #0x18
	ldrsb r0, [r3, #8]
	add r3, r3, #0xb4
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_023089C0:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02304AC4
	cmp r0, #0
	ldreq r0, _023082B4 ; =0x02324D8C
	moveq r1, #0xc
	ldreq r0, [r0]
	streq r1, [r0]
	beq _02308CF0
	bl ov11_02308F14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308A14:
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r4, #0x10]
	mov r3, r2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #2
	bl sub_02044688
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #8
	ldr r3, [r1]
	str r0, [r3, #0x324]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308A54:
	ldr r0, [r4, #0x324]
	bl sub_02044800
	cmp r0, #1
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x324
	bl sub_020448EC
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308A88:
	ldr r0, [r4, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrb r0, [r0, #1]
	bl sub_020582E0
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308AB4:
	ldr r0, [r4, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrne r0, _023082B4 ; =0x02324D8C
	ldrnesh r1, [r4, #4]
	ldreq r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	moveq r1, #0
	add r0, r0, #0x200
	strh r1, [r0, #0x4e]
	add r0, sp, #0x420
	bl InitPreprocessorArgs
	ldr r0, _023082B4 ; =0x02324D8C
	add r6, sp, #0x420
	ldr r1, [r0]
	ldr r0, _02308D10 ; =0x02322C78
	add r5, r1, #0x200
	ldrsh r2, [r5, #0x4e]
	ldr r1, _02308D14 ; =0x00001013
	ldr r3, _02308D18 ; =0x000008E4
	str r2, [sp, #0x430]
	ldrh r4, [r4, #2]
	mov r2, #0
	add r4, r4, #0xbc
	str r4, [sp, #0x438]
	str r6, [sp]
	ldrsh r4, [r5, #0x4e]
	add r4, r4, #0xd1
	add r4, r4, #0x2900
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, r6}
	bl sub_0202E3CC
	ldr r1, _023082B4 ; =0x02324D8C
	mov r2, #0xb
	ldr r3, [r1]
	strb r0, [r3, #9]
	ldr r0, [r1]
	str r2, [r0]
	b _02308CF0
_02308B70:
	ldrsb r0, [r4, #9]
	bl sub_0202E6E4
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #9]
	bl sub_0202E6C8
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #9]
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308BB0:
	ldrsb r0, [r4, #5]
	mvn r1, #1
	cmp r0, r1
	beq _02308BD4
	bl sub_0202F918
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
_02308BD4:
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _02308C00
	bl ov00_022BCCF4
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_02308C00:
	ldr r1, _023082B4 ; =0x02324D8C
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _02308C1C
	bl ov11_02308EDC
_02308C1C:
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x18
	ldr r0, [r0]
	mov r2, #0x2b4
	ldrsb r0, [r0, #8]
	mov r3, #0
	bl ShowMessageInDBox
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308C4C:
	ldrsb r0, [r4, #8]
	bl IsDBoxActive
	cmp r0, #0
	bne _02308CF0
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ShowDBox
	bl ov11_02308F14
	ldr r0, _023082B4 ; =0x02324D8C
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0]
	b _02308CF0
_02308C84:
	mov r0, #0xf
	str r0, [r4]
	b _02308CF0
_02308C90:
	ldrsb r0, [r4, #4]
	bl ov10_022BCD68
	cmp r0, #0
	bne _02308CE8
	ldr r0, _023082B4 ; =0x02324D8C
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202F918
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1, #5]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov00_022BCCF4
	ldr r0, _023082B4 ; =0x02324D8C
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #0x10
	strb r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
_02308CE8:
	mov r0, #1
	b _02308CF4
_02308CF0:
	mov r0, #0
_02308CF4:
	add sp, sp, #0x5a0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02308CFC: .word 0x000008D7
_02308D00: .word 0x0000131B
_02308D04: .word 0x00000F23
_02308D08: .word 0x00000F24
_02308D0C: .word 0x000002CB
_02308D10: .word 0x02322C78
_02308D14: .word 0x00001013
_02308D18: .word 0x000008E4
	arm_func_end ov11_02307334

	arm_func_start ov11_02308D1C
ov11_02308D1C: ; 0x02308D1C
	stmdb sp!, {r3, lr}
	ldr r0, _02308D44 ; =0x02324D8C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02308D44 ; =0x02324D8C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308D44: .word 0x02324D8C
	arm_func_end ov11_02308D1C

	arm_func_start ov11_02308D48
ov11_02308D48: ; 0x02308D48
	stmdb sp!, {r3, lr}
	ldr r0, _02308DD4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _02308D78
	bl sub_0202AABC
	ldr r0, _02308DD4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
_02308D78:
	ldr r0, _02308DD4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	beq _02308DA4
	bl sub_0202F918
	ldr r0, _02308DD4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
_02308DA4:
	ldr r0, _02308DD4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ov00_022BCCF4
	ldr r0, _02308DD4 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308DD4: .word 0x02324D8C
	arm_func_end ov11_02308D48

	arm_func_start ov11_02308DD8
ov11_02308DD8: ; 0x02308DD8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, [r0]
	cmp r1, #0
	bne _02308E20
	ldrsh r0, [r0, #4]
	bl GetTeamMember
	mov r4, r0
	bl sub_02055894
	bl sub_020564B0
	ldr r1, _02308EAC ; =0x02324D8C
	mov r2, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x36
	add r0, r0, #0x100
	bl sub_02056094
	b _02308E94
_02308E20:
	cmp r1, #1
	bne _02308E94
	ldrsh r0, [r0, #4]
	bl GetActiveTeamMember
	mov r4, r0
	add r0, sp, #0
	add r1, r4, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldrb r0, [r4]
	mov r2, #0x44
	ldr r1, _02308EB0 ; =0x02322DB8
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrb r0, [r4, #1]
	movne r2, #0x46
	add r3, sp, #0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldr r0, _02308EAC ; =0x02324D8C
	movne r2, #0x59
	ldr r0, [r0]
	add r0, r0, #0x36
	add r0, r0, #0x100
	bl ov11_02308EB4
_02308E94:
	ldr r0, _02308EAC ; =0x02324D8C
	ldr r0, [r0]
	add r0, r0, #0x36
	add r0, r0, #0x100
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02308EAC: .word 0x02324D8C
_02308EB0: .word 0x02322DB8
	arm_func_end ov11_02308DD8

	arm_func_start ov11_02308EB4
ov11_02308EB4: ; 0x02308EB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl Vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov11_02308EB4

	arm_func_start ov11_02308EDC
ov11_02308EDC: ; 0x02308EDC
	stmdb sp!, {r3, lr}
	ldr r1, _02308F10 ; =0x02324D8C
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #8]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDBox
	ldr r1, _02308F10 ; =0x02324D8C
	ldr r1, [r1]
	strb r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308F10: .word 0x02324D8C
	arm_func_end ov11_02308EDC

	arm_func_start ov11_02308F14
ov11_02308F14: ; 0x02308F14
	stmdb sp!, {r3, lr}
	ldr r0, _02308F48 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl FreeDBox
	ldr r0, _02308F48 ; =0x02324D8C
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02308F48: .word 0x02324D8C
	arm_func_end ov11_02308F14

	arm_func_start ov11_02308F4C
ov11_02308F4C: ; 0x02308F4C
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	ldr r1, [r1, #4]
	mov r4, r0
	str r2, [r4]
	str r1, [r4, #4]
	ldr r0, [r4]
	cmp r0, #0
	bne _02308F9C
	ldrsh r0, [r4, #4]
	bl GetTeamMember
	ldrsh r3, [r0, #4]
	add r2, r0, #0x14
	add r1, r0, #8
	strh r3, [r4, #8]
	ldrb r0, [r0, #2]
	strb r0, [r4, #0xa]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	ldmia sp!, {r4, pc}
_02308F9C:
	cmp r0, #1
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #4]
	bl GetActiveTeamMember
	ldrsh r3, [r0, #0xc]
	add r2, r0, #0x4c
	add r1, r0, #6
	strh r3, [r4, #8]
	ldrb r0, [r0, #3]
	strb r0, [r4, #0xa]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_02308F4C

	arm_func_start ov11_02308FD0
ov11_02308FD0: ; 0x02308FD0
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #1
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl sub_02058794
	ldmia sp!, {r3, pc}
	arm_func_end ov11_02308FD0

	arm_func_start ov11_02308FEC
ov11_02308FEC: ; 0x02308FEC
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _02309008
	ldrsh r0, [r0, #4]
	bl sub_0203FA64
	ldmia sp!, {r3, pc}
_02309008:
	cmp r1, #1
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl sub_0203FBD4
	ldmia sp!, {r3, pc}
	arm_func_end ov11_02308FEC

	arm_func_start ov11_0230901C
ov11_0230901C: ; 0x0230901C
	ldr r1, [r0]
	cmp r1, #0
	ldreqsh r0, [r0, #4]
	orreq r0, r0, #0x20000
	bxeq lr
	cmp r1, #1
	ldreqsh r0, [r0, #4]
	orreq r0, r0, #0x30000
	bx lr
	arm_func_end ov11_0230901C

	arm_func_start ov11_02309040
ov11_02309040: ; 0x02309040
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230907C ; =0x00000794
	mov r1, #8
	bl MemAlloc
	ldr r1, _02309080 ; =0x02324D90
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	strne r4, [r0, #0x114]
	ldrne r0, [r1]
	movne r1, #0
	strne r1, [r0]
	movne r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230907C: .word 0x00000794
_02309080: .word 0x02324D90
	arm_func_end ov11_02309040

	arm_func_start ov11_02309084
ov11_02309084: ; 0x02309084
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _023090D4 ; =0x00000794
	mov r1, #8
	bl MemAlloc
	ldr r1, _023090D8 ; =0x02324D90
	cmp r0, #0
	str r0, [r1]
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #2
	str r2, [r0, #0x114]
	ldr r0, [r1]
	mov r2, #0
	str r2, [r0]
	ldr r1, [r1]
	mov r0, #1
	add r1, r1, #0x100
	strh r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023090D4: .word 0x00000794
_023090D8: .word 0x02324D90
	arm_func_end ov11_02309084

	arm_func_start ov11_023090DC
ov11_023090DC: ; 0x023090DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x124
	ldr r0, _02309D80 ; =0x02324D90
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #0x1b
	addls pc, pc, r0, lsl #2
	b _02309D74
_023090FC: ; jump table
	b _0230916C ; case 0
	b _0230955C ; case 1
	b _02309518 ; case 2
	b _02309724 ; case 3
	b _023097EC ; case 4
	b _0230984C ; case 5
	b _0230987C ; case 6
	b _023098A8 ; case 7
	b _023098E4 ; case 8
	b _023099B0 ; case 9
	b _023099CC ; case 10
	b _023099F8 ; case 11
	b _02309A2C ; case 12
	b _02309A68 ; case 13
	b _02309A8C ; case 14
	b _02309AB4 ; case 15
	b _02309AD0 ; case 16
	b _02309B40 ; case 17
	b _02309B5C ; case 18
	b _02309BA4 ; case 19
	b _02309C04 ; case 20
	b _02309CA4 ; case 21
	b _02309CE0 ; case 22
	b _02309CF8 ; case 23
	b _02309D20 ; case 24
	b _02309D38 ; case 25
	b _02309D54 ; case 26
	b _02309D6C ; case 27
_0230916C:
	ldr r5, [r3, #0x114]
	mov r0, #0
	str r0, [sp, #4]
	ldr r8, [sp, #4]
	add r4, r3, #0x11c
	mov r2, r8
	add r3, r3, #0x100
	str r2, [sp, #8]
	ldrsh r2, [r3, #0x18]
	mov r0, r4
	mov r1, r5
	str r2, [sp, #0x10]
	ldr r2, _02309D84 ; =0x00401833
	add r7, r4, #0x38
	str r2, [sp, #0x14]
	bl ov11_02309EE4
	mov r2, #0
	mov r1, r2
	b _023091C4
_023091B8:
	add r0, r4, r2
	strb r1, [r0, #0x70]
	add r2, r2, #1
_023091C4:
	ldr r0, [r4, #0x30]
	cmp r2, r0
	blt _023091B8
	cmp r5, #2
	bne _023092FC
	mov sl, #0
	b _023092F0
_023091E0:
	ldr r0, [sp, #0x10]
	add fp, r4, sl, lsl #3
	bl GetItemMoveId16
	ldr r1, [r4, sl, lsl #3]
	mov r6, r0
	cmp r1, #1
	bne _02309258
	ldrsh r0, [fp, #4]
	bl GetTeamMember
	ldrsh r1, [r0, #4]
	mov sb, #0
	mov r3, sb
	str r1, [sp, #0xc]
	mov fp, #1
	mov r1, #6
	b _0230924C
_02309220:
	mla ip, sb, r1, r0
	ldrb r2, [ip, #0x22]
	tst r2, #1
	movne r2, fp
	moveq r2, r3
	tst r2, #0xff
	beq _02309248
	ldrh r2, [ip, #0x24]
	cmp r6, r2
	beq _023092B8
_02309248:
	add sb, sb, #1
_0230924C:
	cmp sb, #4
	blt _02309220
	b _023092B8
_02309258:
	cmp r1, #2
	bne _023092B8
	ldrsh r0, [fp, #4]
	bl GetActiveTeamMember
	ldrsh r1, [r0, #0xc]
	mov sb, #0
	mov r2, sb
	str r1, [sp, #0xc]
	mov r3, #1
	b _023092B0
_02309280:
	add r1, r0, sb, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _023092AC
	add r1, r0, sb, lsl #3
	ldrh r1, [r1, #0x20]
	cmp r6, r1
	beq _023092B8
_023092AC:
	add sb, sb, #1
_023092B0:
	cmp sb, #4
	blt _02309280
_023092B8:
	ldr r1, [sp, #0xc]
	mov r0, r6
	bl sub_02053D1C
	cmp r0, #0
	beq _023092E0
	cmp sb, #4
	addlt r0, r4, sl
	movlt r1, #3
	strltb r1, [r0, #0x70]
	b _023092EC
_023092E0:
	add r0, r4, sl
	mov r1, #3
	strb r1, [r0, #0x70]
_023092EC:
	add sl, sl, #1
_023092F0:
	ldr r0, [r4, #0x30]
	cmp sl, r0
	blt _023091E0
_023092FC:
	mov sl, #0
	add r6, r4, #0x76
	add fp, sp, #0x5c
	b _02309450
_0230930C:
	add sb, r4, sl, lsl #3
	ldr r0, [r4, sl, lsl #3]
	cmp r0, #1
	bne _0230935C
	ldrsh r0, [sb, #4]
	bl GetTeamMember
	ldrsh r1, [sb, #4]
	mov sb, r0
	orr r0, r1, #0x20000
	str r0, [sp, #0x5c]
	ldrsh r0, [sb, #4]
	bl GetDexNumber
	str r0, [sp, #0x80]
	add r1, sb, #0x3a
	add r0, sp, #0x1a
	mov r2, #0
	bl sub_02054F44
	add r0, sp, #0x1a
	str r0, [sp, #0x94]
	b _023093A0
_0230935C:
	cmp r0, #2
	bne _023093A0
	ldrsh r0, [sb, #4]
	bl GetActiveTeamMember
	ldrsh r1, [sb, #4]
	mov sb, r0
	orr r0, r1, #0x30000
	str r0, [sp, #0x5c]
	ldrsh r0, [sb, #0xc]
	bl GetDexNumber
	str r0, [sp, #0x80]
	add r1, sb, #0x5e
	add r0, sp, #0x1a
	mov r2, #0
	bl sub_02054F44
	add r0, sp, #0x1a
	str r0, [sp, #0x94]
_023093A0:
	cmp r5, #1
	mov r1, #0x100
	mov r3, #0
	bne _023093C8
	ldr r2, _02309D88 ; =0x02322E58
	add r0, r6, r8, lsl #8
	str fp, [sp]
	mov sb, r8, lsl #8
	bl PreprocessString
	b _0230941C
_023093C8:
	cmp r5, #2
	bne _02309408
	add r0, r4, sl
	ldrb r0, [r0, #0x70]
	mov sb, r8, lsl #8
	tst r0, #2
	str fp, [sp]
	beq _023093F8
	ldr r2, _02309D8C ; =0x02322E7C
	add r0, r6, r8, lsl #8
	bl PreprocessString
	b _0230941C
_023093F8:
	ldr r2, _02309D88 ; =0x02322E58
	add r0, r6, r8, lsl #8
	bl PreprocessString
	b _0230941C
_02309408:
	ldr r2, _02309D90 ; =0x02322EA0
	add r0, r6, r8, lsl #8
	str fp, [sp]
	mov sb, r8, lsl #8
	bl PreprocessString
_0230941C:
	add r0, r4, sl
	ldrb r0, [r0, #0x70]
	add r8, r8, #1
	cmp r0, #0
	ldreq r0, [sp, #4]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #4]
	add r0, r6, sb
	stmia r7, {r0, sl}
	streq sl, [sp, #8]
	add r7, r7, #8
	add sl, sl, #1
_02309450:
	ldr r0, [r4, #0x30]
	cmp sl, r0
	blt _0230930C
	mov r3, #0
	str r3, [r7]
	sub r0, r3, #1
	str r0, [r7, #4]
	ldr r0, [sp, #8]
	ldr r1, _02309D80 ; =0x02324D90
	str r0, [r4, #0x34]
	ldr r0, [r1]
	mov r2, #0x10
	str r2, [r0, #0x88]
	ldr r0, [r1]
	str r3, [r0, #0x7c]
	ldr r3, [r1]
	ldr r0, [r3, #0x114]
	cmp r0, #1
	ldreq r0, _02309D94 ; =0x000002F2
	streqh r0, [r3, #0x84]
	beq _023094E0
	cmp r0, #2
	ldrne r0, _02309D98 ; =0x00000A3A
	strneh r0, [r3, #0x84]
	bne _023094E0
	ldr r2, _02309D94 ; =0x000002F2
	ldr r0, [sp, #0x14]
	strh r2, [r3, #0x84]
	orr r0, r0, #0x200
	ldr r2, [r1]
	str r0, [sp, #0x14]
	add r0, r2, #0x18c
	str r0, [r2, #0xdc]
	ldr r1, [r1]
	ldr r0, [r1, #0x150]
	str r0, [r1, #0x7c]
_023094E0:
	ldr r1, _02309D80 ; =0x02324D90
	ldr r0, _02309D9C ; =0x02322DD0
	ldr r3, [r1]
	ldr r1, [sp, #0x14]
	add r2, r3, #0x7c
	add r3, r3, #0x154
	bl sub_0202A690
	ldr r1, _02309D80 ; =0x02324D90
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3, #4]
	ldr r0, [r1]
	str r2, [r0]
	b _02309D74
_02309518:
	ldrsb r0, [r3, #4]
	bl sub_02028354
	cmp r0, #3
	bne _02309538
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202810C
_02309538:
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202A954
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_0230955C:
	add r1, sp, #0x18
	mov r0, #0
	ldr r5, [r3, #0x114]
	bl GetPressedButtons
	ldrh r0, [sp, #0x18]
	tst r0, #8
	beq _02309584
	cmp r5, #0
	moveq r0, #1
	beq _02309588
_02309584:
	mov r0, #0
_02309588:
	cmp r0, #0
	beq _023095E0
	ldr r0, _02309D80 ; =0x02324D90
	ldr r4, [r0]
	ldrsb r0, [r4, #4]
	bl sub_0202AB80
	add r0, r4, r0, lsl #3
	ldr r1, [r0, #0x158]
	ldr r0, _02309D80 ; =0x02324D90
	str r1, [r4, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202B030
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202812C
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023095E0:
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202AB40
	cmp r0, #0
	bne _02309D74
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202ABB0
	cmp r0, #0
	blt _02309704
	ldr r1, _02309D80 ; =0x02324D90
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r1, [r1]
	add r2, r1, #0x11c
	ldr r1, [r2, r0, lsl #3]
	add r5, r2, r0, lsl #3
	cmp r1, #1
	bne _02309644
	ldrsh r0, [r5, #4]
	bl GetTeamMember
	ldrsh r4, [r0, #4]
	b _02309658
_02309644:
	cmp r1, #2
	bne _02309658
	ldrsh r0, [r5, #4]
	bl GetActiveTeamMember
	ldrsh r4, [r0, #0xc]
_02309658:
	mov r0, r5
	bl ov11_0230A044
	ldr r1, _02309D80 ; =0x02324D90
	mov r5, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x114]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #0x1a
	strls r0, [r1]
	bls _02309D74
	bl GetGameMode
	cmp r0, #5
	beq _023096D0
	cmp r4, #0x140
	bne _023096D0
	mov r0, r5
	mov r1, r4
	bl StrcmpMonsterName
	cmp r0, #0
	beq _023096D0
	ldr r0, _02309DA0 ; =0x02322DE0
	ldr r3, _02309DA4 ; =0x02322E28
	mov r1, #0x13
	mov r2, #0
	bl sub_0202A5CC
	ldr r1, _02309D80 ; =0x02324D90
	ldr r1, [r1]
	strb r0, [r1, #5]
	b _023096F0
_023096D0:
	ldr r0, _02309DA0 ; =0x02322DE0
	ldr r3, _02309DA8 ; =0x02322E00
	mov r1, #0x13
	mov r2, #0
	bl sub_0202A5CC
	ldr r1, _02309D80 ; =0x02324D90
	ldr r1, [r1]
	strb r0, [r1, #5]
_023096F0:
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309704:
	ldr r0, _02309D80 ; =0x02324D90
	mov r3, #0x1a
	ldr r2, [r0]
	sub r1, r3, #0x1b
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _02309D74
_02309724:
	ldrsb r0, [r3, #5]
	bl sub_0202AB40
	cmp r0, #0
	bne _02309D74
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202ABB0
	mvn r1, #0
	cmp r0, r1
	beq _023097C8
	ldr r1, _02309D80 ; =0x02324D90
	cmp r0, #3
	ldr r2, [r1]
	str r0, [r2, #0x14]
	addls pc, pc, r0, lsl #2
	b _023097B4
_02309768: ; jump table
	b _02309778 ; case 0
	b _02309788 ; case 1
	b _02309798 ; case 2
	b _023097A8 ; case 3
_02309778:
	ldr r0, [r1]
	mov r1, #4
	str r1, [r0]
	b _023097B4
_02309788:
	ldr r0, [r1]
	mov r1, #7
	str r1, [r0]
	b _023097B4
_02309798:
	ldr r0, [r1]
	mov r1, #0xc
	str r1, [r0]
	b _023097B4
_023097A8:
	ldr r0, [r1]
	mov r1, #0xe
	str r1, [r0]
_023097B4:
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202812C
	b _023097D8
_023097C8:
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
_023097D8:
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202AABC
	b _02309D74
_023097EC:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c
	add r4, r1, r0, lsl #3
	ldrsh r0, [r4, #4]
	bl GetActiveTeamMember
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r5, #1
	ldrsh r0, [r4, #4]
	moveq r5, #0
	bl GetActiveTeamMember
	mov r1, r0
	add r0, sp, #0xac
	and r2, r5, #0xff
	bl sub_0205AE28
	add r0, sp, #0xac
	mov r1, #3
	bl sub_0203F150
	ldr r1, _02309D80 ; =0x02324D90
	mov r2, #5
	ldr r3, [r1]
	strb r0, [r3, #9]
	ldr r0, [r1]
	str r2, [r0]
_0230984C:
	bl sub_0203F398
	cmp r0, #1
	bne _02309D74
	bl sub_0203F974
	ldr r0, _02309D80 ; =0x02324D90
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2, #0x18]
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_0230987C:
	ldr r1, [r3, #0x18]
	sub r0, r1, #1
	str r0, [r3, #0x18]
	cmp r1, #0
	bne _02309D74
	bl sub_0203F990
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023098A8:
	ldr r0, [r3, #0x10]
	add r0, r3, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20]
	bl sub_0203FBD4
	mov r1, #0
	mov r2, r1
	mov r0, #9
	bl sub_0204018C
	ldr r1, _02309D80 ; =0x02324D90
	mov r2, #8
	ldr r3, [r1]
	strb r0, [r3, #0xa]
	ldr r0, [r1]
	str r2, [r0]
_023098E4:
	bl sub_020407EC
	cmp r0, #1
	bne _02309934
	ldr r0, _02309D80 ; =0x02324D90
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	add r0, r1, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20]
	bl sub_0203FDEC
	bl sub_020407C0
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl sub_020308A0
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309934:
	cmp r0, #2
	cmpne r0, #7
	bne _02309D74
	ldr r0, _02309D80 ; =0x02324D90
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	add r1, r1, #0x11c
	add r4, r1, r0, lsl #3
	bl sub_0203FD38
	ldr r2, _02309D80 ; =0x02324D90
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x1e
	bl MemcpySimple
	bl sub_02041094
	ldr r1, _02309D80 ; =0x02324D90
	ldr r1, [r1]
	strh r0, [r1, #0x1c]
	ldrsh r0, [r4, #4]
	bl sub_0203FDEC
	bl sub_020407C0
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl sub_020308A0
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023099B0:
	ldrsb r0, [r3, #0xa]
	bl sub_020307EC
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023099CC:
	ldrsh r2, [r3, #0x1c]
	add r0, r3, #0x1e
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _02309D80 ; =0x02324D90
	mov r2, #0xb
	ldr r3, [r1]
	strb r0, [r3, #0xb]
	ldr r0, [r1]
	str r2, [r0]
_023099F8:
	bl sub_02041A18
	cmp r0, #1
	bne _02309D74
	bl sub_02041A00
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl sub_0202E6C8
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309A2C:
	ldr r0, [r3, #0x10]
	add r0, r3, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20]
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
_02309A68:
	bl sub_02041B7C
	cmp r0, #1
	bne _02309D74
	bl sub_020420F4
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309A8C:
	bl ov11_0230D92C
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202AABC
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309AB4:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =0x02324D90
	moveq r1, #0x10
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309AD0:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c
	add r0, r1, r0, lsl #3
	bl ov11_0230A044
	ldr r2, _02309D80 ; =0x02324D90
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	add r0, r0, #0x3e
	bl StrncpySimpleNoPad
	ldr r0, _02309D80 ; =0x02324D90
	ldr r1, [r0]
	add r0, r1, #0x52
	add r1, r1, #0x3e
	bl StrcpySimple
	ldr r1, _02309D80 ; =0x02324D90
	mov r0, #2
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e
	add r3, r3, #0x52
	bl ShowKeyboard
	bl ov11_02310BDC
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309B40:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =0x02324D90
	moveq r1, #0x12
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309B5C:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02309D74
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x18]
	bl GetKeyboardStringResult
	ldr r2, _02309D80 ; =0x02324D90
	mov r1, r0
	ldr r0, [r2]
	add r0, r0, #0x3e
	bl StrcpySimple
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x13
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309BA4:
	bl sub_02037468
	cmp r0, #0
	beq _02309D74
	ldr r0, _02309D80 ; =0x02324D90
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	sub r1, r2, #1
	str r1, [r3, #0x18]
	cmp r2, #0
	bgt _02309D74
	ldr r1, [r0]
	mov r2, #0xa
	add r0, r1, #0x66
	add r1, r1, #0x3e
	bl StrncpySimpleNoPadSafe
	ldr r0, _02309D80 ; =0x02324D90
	ldr r0, [r0]
	add r0, r0, #0x66
	bl sub_0203909C
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309C04:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c
	add r4, r1, r0, lsl #3
	mov r0, r4
	bl ov11_0230A044
	mov r5, r0
	bl sub_0203931C
	mvn r1, #0
	cmp r0, r1
	beq _02309D74
	cmp r0, #0
	beq _02309C4C
	cmp r0, #1
	ldreq r0, _02309D80 ; =0x02324D90
	moveq r1, #0x15
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309C4C:
	ldr r1, _02309D80 ; =0x02324D90
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0xa
	add r1, r1, #0x3e
	bl StrncpySimple
	ldr r1, _02309D80 ; =0x02324D90
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0xa
	add r1, r1, #0x3e
	bl StrncpySimple
	ldr r0, [r4]
	cmp r0, #2
	bne _02309C90
	ldrsh r0, [r4, #4]
	bl sub_02058794
_02309C90:
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CA4:
	bl sub_02039218
	cmp r0, #0
	beq _02309D74
	ldr r1, _02309D80 ; =0x02324D90
	mov r0, #2
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e
	add r3, r3, #0x52
	bl ShowKeyboard
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CE0:
	bl ov11_0230D92C
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CF8:
	bl ov11_0230D220
	cmp r0, #0
	bne _02309D74
	bl sub_02039218
	cmp r0, #0
	ldrne r0, _02309D80 ; =0x02324D90
	movne r1, #0x18
	ldrne r0, [r0]
	strne r1, [r0]
	b _02309D74
_02309D20:
	bl ov11_0230D000
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x19
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309D38:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =0x02324D90
	moveq r1, #0
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309D54:
	ldrsb r0, [r3, #4]
	bl sub_0202AABC
	ldr r0, _02309D80 ; =0x02324D90
	mov r1, #0x1b
	ldr r0, [r0]
	str r1, [r0]
_02309D6C:
	mov r0, #1
	b _02309D78
_02309D74:
	mov r0, #0
_02309D78:
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02309D80: .word 0x02324D90
_02309D84: .word 0x00401833
_02309D88: .word 0x02322E58
_02309D8C: .word 0x02322E7C
_02309D90: .word 0x02322EA0
_02309D94: .word 0x000002F2
_02309D98: .word 0x00000A3A
_02309D9C: .word 0x02322DD0
_02309DA0: .word 0x02322DE0
_02309DA4: .word 0x02322E28
_02309DA8: .word 0x02322E00
	arm_func_end ov11_023090DC

	arm_func_start ov11_02309DAC
ov11_02309DAC: ; 0x02309DAC
	ldr r1, _02309DF4 ; =0x02324D90
	ldr r1, [r1]
	ldr r2, [r1, #0x10]
	add r3, r1, #0x11c
	ldr r1, [r3, r2, lsl #3]
	add r2, r3, r2, lsl #3
	cmp r1, #1
	moveq r1, #0
	streq r1, [r0]
	ldreqsh r1, [r2, #4]
	streqh r1, [r0, #4]
	bxeq lr
	cmp r1, #2
	moveq r1, #1
	streq r1, [r0]
	ldreqsh r1, [r2, #4]
	streqh r1, [r0, #4]
	bx lr
	.align 2, 0
_02309DF4: .word 0x02324D90
	arm_func_end ov11_02309DAC

	arm_func_start ov11_02309DF8
ov11_02309DF8: ; 0x02309DF8
	stmdb sp!, {r3, lr}
	ldr r0, _02309E20 ; =0x02324D90
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02309E20 ; =0x02324D90
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02309E20: .word 0x02324D90
	arm_func_end ov11_02309DF8

	arm_func_start ov11_02309E24
ov11_02309E24: ; 0x02309E24
	ldr r0, _02309E44 ; =0x02324D90
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0x10]
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	mvneq r0, #0
	bx lr
	.align 2, 0
_02309E44: .word 0x02324D90
	arm_func_end ov11_02309E24

	arm_func_start ov11_02309E48
ov11_02309E48: ; 0x02309E48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0x34
	mov r1, #0
	mov r5, #1
	bl MemAlloc
	mov r1, #2
	mov r4, r0
	bl ov11_02309EE4
	mov r6, #0
	b _02309EBC
_02309E74:
	ldr r0, [r4, r6, lsl #3]
	add r1, r4, r6, lsl #3
	cmp r0, #1
	bne _02309E9C
	ldrsh r0, [r1, #4]
	mov r1, r7
	bl sub_02055FCC
	cmp r0, #0
	bne _02309EC8
	b _02309EB8
_02309E9C:
	cmp r0, #2
	bne _02309EB8
	ldrsh r0, [r1, #4]
	mov r1, r7
	bl sub_020586F0
	cmp r0, #0
	bne _02309EC8
_02309EB8:
	add r6, r6, #1
_02309EBC:
	ldr r0, [r4, #0x30]
	cmp r6, r0
	blt _02309E74
_02309EC8:
	ldr r0, [r4, #0x30]
	cmp r6, r0
	mov r0, r4
	moveq r5, #0
	bl MemFree
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_02309E48

	arm_func_start ov11_02309EE4
ov11_02309EE4: ; 0x02309EE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov sl, r0
	mov r5, r1
	mov r1, r4
	str r4, [sl, #0x30]
	mov r0, r4
_02309F00:
	str r0, [sl, r1, lsl #3]
	add r1, r1, #1
	cmp r1, #6
	blt _02309F00
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _02309F2C
	bl sub_0205633C
	cmp r0, #0
	moveq r4, #1
_02309F2C:
	cmp r4, #0
	beq _02309FD4
	sub r0, r5, #1
	cmp r0, #1
	bhi _02309FD4
	bl GetGameMode
	cmp r0, #1
	ldrls sb, _0230A03C ; =0x02322DC8
	mov fp, #2
	ldrhi sb, _0230A040 ; =0x02322DF0
	mov r5, #1
	mvn r4, #0
	b _02309FB8
_02309F60:
	ldrsh r0, [sb], #2
	bl GetActorMatchingStorageId
	ldr r1, [sl, #0x30]
	mov r7, r0
	cmp r7, r4
	add r8, sl, r1, lsl #3
	beq _02309FB8
	bl GetActiveRosterIndex
	mov r6, r0
	cmp r6, r4
	streq r5, [r8]
	streqh r7, [r8, #4]
	beq _02309FAC
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl sub_02056264
	cmp r0, #0
	streq fp, [r8]
	streqh r6, [r8, #4]
_02309FAC:
	ldr r0, [sl, #0x30]
	add r0, r0, #1
	str r0, [sl, #0x30]
_02309FB8:
	ldrsh r0, [sb]
	cmp r0, r4
	beq _0230A034
	ldr r0, [sl, #0x30]
	cmp r0, #6
	blt _02309F60
	b _0230A034
_02309FD4:
	mov r7, #0
	mov r8, sl
	mov r5, r7
	mov r6, #1
	mov r4, #2
_02309FE8:
	mov r0, r7
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0230A020
	str r4, [r8]
	strh r7, [r8, #4]
	ldr r0, [sl, #0x30]
	add r8, r8, #8
	add r0, r0, #1
	str r0, [sl, #0x30]
_0230A020:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _02309FE8
_0230A034:
	ldr r0, [sl, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230A03C: .word 0x02322DC8
_0230A040: .word 0x02322DF0
	arm_func_end ov11_02309EE4

	arm_func_start ov11_0230A044
ov11_0230A044: ; 0x0230A044
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #1
	bne _0230A064
	ldrsh r0, [r0, #4]
	bl GetTeamMember
	add r0, r0, #0x3a
	ldmia sp!, {r3, pc}
_0230A064:
	cmp r1, #2
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl GetActiveTeamMember
	add r0, r0, #0x5e
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230A044

	arm_func_start ov11_0230A07C
ov11_0230A07C: ; 0x0230A07C
	stmdb sp!, {r3, lr}
	ldr r0, _0230A0CC ; =0x02322ECC
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230A0D0 ; =0x02324D94
	mov r3, #0
	str r0, [r1]
	str r3, [r0, #4]
	ldr r0, [r1]
	sub r2, r3, #2
	str r3, [r0, #8]
	ldr r0, [r1]
	strb r2, [r0]
	ldr r0, [r1]
	strb r2, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230A0CC: .word 0x02322ECC
_0230A0D0: .word 0x02324D94
	arm_func_end ov11_0230A07C

	arm_func_start ov11_0230A0D4
ov11_0230A0D4: ; 0x0230A0D4
	stmdb sp!, {r3, lr}
	ldr r0, _0230A0FC ; =0x02324D94
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230A0FC ; =0x02324D94
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230A0FC: .word 0x02324D94
	arm_func_end ov11_0230A0D4

	arm_func_start ov11_0230A100
ov11_0230A100: ; 0x0230A100
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x138
	ldr r0, _0230A2B0 ; =0x02324D94
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0230A2A4
_0230A120: ; jump table
	b _0230A13C ; case 0
	b _0230A184 ; case 1
	b _0230A13C ; case 2
	b _0230A1F4 ; case 3
	b _0230A258 ; case 4
	b _0230A298 ; case 5
	b _0230A298 ; case 6
_0230A13C:
	ldr lr, [r2, #4]
	ldr ip, _0230A2B4 ; =0x00003FB8
	mov r4, #0x10
	ldr r0, _0230A2B8 ; =0x02322EAC
	ldr r1, _0230A2BC ; =0x00401833
	ldr r3, _0230A2C0 ; =0x02322EDC
	add r2, sp, #0xa0
	str lr, [sp, #0xa0]
	strh ip, [sp, #0xa8]
	str r4, [sp, #0xac]
	bl sub_0202A5CC
	ldr r1, _0230A2B0 ; =0x02324D94
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0230A2A4
_0230A184:
	ldrsb r0, [r2]
	bl sub_0202AB40
	cmp r0, #0
	bne _0230A2A4
	ldr r0, _0230A2B0 ; =0x02324D94
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _0230A2B0 ; =0x02324D94
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl sub_0202AABC
	ldr r0, _0230A2B0 ; =0x02324D94
	mvn r2, #1
	ldr r1, [r0]
	cmp r4, #0
	strb r2, [r1]
	ldrlt r0, [r0]
	movlt r1, #6
	strlt r1, [r0, #8]
	blt _0230A2A4
	ldr r2, [r0]
	mov r1, #3
	str r4, [r2, #4]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230A2A4
_0230A1F4:
	mov r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, [r2, #4]
	ldr r0, _0230A2C0 ; =0x02322EDC
	mov r1, r1, lsl #3
	ldrh r1, [r0, r1]
	mov r4, #8
	ldr r0, _0230A2C4 ; =0x02322EBC
	strh r1, [sp, #0x10]
	ldr r2, [r2, #4]
	ldr r1, _0230A2C8 ; =0x00009833
	str r2, [sp, #8]
	str r4, [sp]
	mov r4, #1
	ldr r3, _0230A2CC ; =0x0230A2D0
	add r2, sp, #8
	str r4, [sp, #4]
	bl sub_020305B4
	ldr r1, _0230A2B0 ; =0x02324D94
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0230A2A4
_0230A258:
	ldrsb r0, [r2, #1]
	bl sub_020308C4
	cmp r0, #0
	bne _0230A2A4
	ldr r0, _0230A2B0 ; =0x02324D94
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl sub_020308A0
	ldr r0, _0230A2B0 ; =0x02324D94
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #1]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230A2A4
_0230A298:
	bl ov11_02301174
	mov r0, #4
	b _0230A2A8
_0230A2A4:
	mov r0, #1
_0230A2A8:
	add sp, sp, #0x138
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230A2B0: .word 0x02324D94
_0230A2B4: .word 0x00003FB8
_0230A2B8: .word 0x02322EAC
_0230A2BC: .word 0x00401833
_0230A2C0: .word 0x02322EDC
_0230A2C4: .word 0x02322EBC
_0230A2C8: .word 0x00009833
_0230A2CC: .word 0x0230A2D0
	arm_func_end ov11_0230A100

	arm_func_start ov11_0230A2D0
ov11_0230A2D0: ; 0x0230A2D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02030A18
	mov r4, r0
	ldr r0, _0230A318 ; =0x02322EDC
	mov r1, r4, lsl #3
	ldrh r1, [r0, r1]
	mov r0, r5
	bl sub_02030A2C
	add r0, r4, #0xc1
	add r0, r0, #0x3f00
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r3, r1, lsr #0x10
	mov r1, #4
	mov r2, #0x10
	bl sub_02026268
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230A318: .word 0x02322EDC
	arm_func_end ov11_0230A2D0

	arm_func_start ov11_0230A31C
ov11_0230A31C: ; 0x0230A31C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x148
	mov r1, #8
	bl MemAlloc
	ldr r2, _0230A38C ; =0x02324D98
	mov r1, #0x148
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0230A38C ; =0x02324D98
	mov ip, #4
	ldr r4, [r0, #4]
	stmib r4, {r5, r6}
	add lr, r4, #0xc
_0230A358:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230A358
	ldr r1, [r6]
	mvn r0, #1
	str r1, [lr]
	strb r0, [r4, #0x74]
	strb r0, [r4, #0x78]
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x144]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230A38C: .word 0x02324D98
	arm_func_end ov11_0230A31C

	arm_func_start ov11_0230A390
ov11_0230A390: ; 0x0230A390
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1b4
	ldr r0, _0230AD0C ; =0x02324D98
	ldr sb, [r0, #4]
	ldr r0, [sb]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0230AD00
_0230A3B0: ; jump table
	b _0230A3EC ; case 0
	b _0230A41C ; case 1
	b _0230A4B8 ; case 2
	b _0230A510 ; case 3
	b _0230A68C ; case 4
	b _0230A68C ; case 5
	b _0230A6C8 ; case 6
	b _0230A6E4 ; case 7
	b _0230A750 ; case 8
	b _0230A844 ; case 9
	b _0230A958 ; case 10
	b _0230A98C ; case 11
	b _0230A9D0 ; case 12
	b _0230AB1C ; case 13
	b _0230ACE4 ; case 14
_0230A3EC:
	ldr r0, [sb, #8]
	ldrb r0, [r0, #1]
	cmp r0, #0x64
	bhs _0230A410
	ldr r0, [sb, #4]
	cmp r0, #0
	ble _0230A410
	mov r0, #1
	bl sub_02017C50
_0230A410:
	mov r0, #1
	str r0, [sb]
	b _0230AD00
_0230A41C:
	ldr r5, [sb, #8]
	ldrb r2, [r5, #1]
	cmp r2, #0x64
	bhs _0230A440
	ldrb r1, [sb, #0xd]
	ldr r0, [sb, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _0230A44C
_0230A440:
	mov r0, #0xd
	str r0, [sb]
	b _0230AD00
_0230A44C:
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, r5
	bl sub_020546E8
	add r0, sp, #0x164
	bl InitPreprocessorArgs
	mov r0, r5
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r4
	mov r1, r5
	bl sub_02056094
	str r4, [sp, #0x19c]
	ldrb r2, [r5, #1]
	ldr r1, _0230AD10 ; =0x000004A6
	mov r0, #0x1c
	str r2, [sp, #0x188]
	add r2, sp, #0x164
	bl sub_02046BE8
	mov r0, r4
	bl MemFree
	mov r0, #2
	str r0, [sb]
	b _0230AD00
_0230A4B8:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	bne _0230AD00
	ldr r3, [sb, #8]
	add r0, sb, #0x54
	ldrsh r1, [r3, #4]
	ldrb r2, [r3, #1]
	ldrsh r3, [r3, #8]
	bl sub_02053A0C
	strh r0, [sb, #0x50]
	mov r0, #0
	strh r0, [sb, #0x52]
	ldrh r0, [sb, #0x50]
	cmp r0, #0
	movne r0, #3
	strne r0, [sb]
	moveq r0, #1
	streq r0, [sb]
	b _0230AD00
_0230A510:
	ldrh r1, [sb, #0x52]
	ldrh r0, [sb, #0x50]
	ldr r4, [sb, #8]
	mov r8, #0
	cmp r1, r0
	movhs r0, #1
	sub r5, r8, #1
	strhs r0, [sb]
	bhs _0230AD00
	mov sl, r8
	add r2, sb, r1, lsl #1
	mov r6, r8
	mov r7, #1
	mov r0, #6
	b _0230A58C
_0230A54C:
	mla r3, sl, r0, r4
	ldrb r1, [r3, #0x22]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _0230A580
	ldrh r3, [r3, #0x24]
	ldrh r1, [r2, #0x54]
	cmp r3, r1
	bne _0230A588
	mov r8, #1
	b _0230A594
_0230A580:
	cmp r5, #0
	movlt r5, sl
_0230A588:
	add sl, sl, #1
_0230A58C:
	cmp sl, #4
	blt _0230A54C
_0230A594:
	cmp r8, #0
	ldrneh r0, [sb, #0x52]
	addne r0, r0, #1
	strneh r0, [sb, #0x52]
	bne _0230AD00
	add r0, sp, #0x114
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	mov r0, r4
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl sub_02056094
	str r6, [sp, #0x14c]
	cmp r5, #0
	blt _0230A644
	ldrh r1, [sb, #0x52]
	add r2, r4, #0x22
	mov r0, #6
	add r1, sb, r1, lsl #1
	mla r0, r5, r0, r2
	ldrh r1, [r1, #0x54]
	bl GetInfoMoveGround
	ldrh r2, [sb, #0x52]
	ldr r0, _0230AD14 ; =0x0000131B


