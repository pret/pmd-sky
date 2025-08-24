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
	bl DrawTeamStats
	bl UpdateTeamStats
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
	bl FreeTeamStats
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
	bl UpdateTeamStats
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
	ldr r1, _022DC500 ; =ov11_02316A3C
	ldr r0, [r0]
	ldr r0, [r0, #0x178]
	bl sub_0200B3C0
	ldr r0, _022DC4FC ; =ov11_02324C60
	ldr r1, _022DC500 ; =ov11_02316A3C
	ldr r0, [r0]
	ldr r0, [r0, #0x17c]
	bl sub_0200B3C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC4FC: .word ov11_02324C60
_022DC500: .word ov11_02316A3C
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
	ldr r1, _022DC6B8 ; =_020A1870
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
	bl EnableAllLearnableIqSkills
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
	bl GetHpBoostFromExclusiveItems
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
_022DC6B8: .word _020A1870
_022DC6BC: .word 0x000003E7
_022DC6C0: .word ov11_02324C60
	arm_func_end ov11_022DC534

	arm_func_start ov11_022DC6C4
ov11_022DC6C4: ; 0x022DC6C4
	stmdb sp!, {r3, lr}
	mov r0, #0x400
	mov r1, #6
	bl MemAlloc
	ldr r2, _022DC710 ; =ov11_02324C64
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
_022DC710: .word ov11_02324C64
_022DC714: .word ov11_02324E80
	arm_func_end ov11_022DC6C4

	arm_func_start ov11_022DC718
ov11_022DC718: ; 0x022DC718
	stmdb sp!, {r3, lr}
	bl ov11_022E4B88
	ldr r0, _022DC788 ; =ov11_02324E94
	bl InitPortraitParams
	ldr r0, _022DC78C ; =ov11_02324EA4
	bl InitPortraitParams
	ldr r0, _022DC790 ; =ov11_02324ECC
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
	ldr r1, _022DC798 ; =LOCK_NOTIFY_ARRAY
	ldr r0, _022DC79C ; =ov11_02324F1C
	mov r2, r3
_022DC770:
	strb r2, [r1, r3]
	str r2, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x15
	blt _022DC770
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC788: .word ov11_02324E94
_022DC78C: .word ov11_02324EA4
_022DC790: .word ov11_02324ECC
_022DC794: .word ov11_02324E80
_022DC798: .word LOCK_NOTIFY_ARRAY
_022DC79C: .word ov11_02324F1C
	arm_func_end ov11_022DC718

	arm_func_start ov11_022DC7A0
ov11_022DC7A0: ; 0x022DC7A0
	stmdb sp!, {r3, lr}
	ldr r0, _022DC804 ; =ov11_02324C64
	ldr r0, [r0]
	cmp r0, #0
	beq _022DC7C4
	bl MemFree
	ldr r0, _022DC804 ; =ov11_02324C64
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
	ldr r0, _022DC804 ; =ov11_02324C64
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022DC804 ; =ov11_02324C64
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC804: .word ov11_02324C64
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

	arm_func_start InitScriptRoutineState
InitScriptRoutineState: ; 0x022DC830
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
	arm_func_end InitScriptRoutineState

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
	bl InitScriptRoutineState
	add r0, r4, #0x7c
	bl InitScriptRoutineState
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DC8C0

	arm_func_start InitScriptRoutine
InitScriptRoutine: ; 0x022DC8E8
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
	arm_func_end InitScriptRoutine

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
	bl GetCoroutineInfo
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
	bl InitScriptRoutineState
	add r0, r4, #0x7c
	bl InitScriptRoutineState
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022DCAE0

	arm_func_start ov11_022DCB00
ov11_022DCB00: ; 0x022DCB00
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0xc
	bl InitScriptRoutineState
	add r0, r4, #0x7c
	bl InitScriptRoutineState
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
	bl InitScriptRoutineState
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
	ldr r1, _022DCCDC ; =ov11_02316A44
	add r0, sp, #0x10
	ldr r2, [r1, #0x68]
	ldr r3, [r1, #0x64]
	ldr r1, _022DCCE0 ; =OVERLAY11_DEBUG_STRINGS
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	bl Debug_FatalError
_022DCC10:
	ldrsh r1, [r4, #0x7c]
	mvn r0, #0
	cmp r1, r0
	beq _022DCC40
	ldr r1, _022DCCDC ; =ov11_02316A44
	add r0, sp, #8
	ldr r2, [r1, #0x18]
	ldr r3, [r1, #0x14]
	ldr r1, _022DCCE4 ; =ov11_02319224
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl Debug_FatalError
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
	bl InitScriptRoutineState
	b _022DCC8C
_022DCC6C:
	ldr r1, _022DCCDC ; =ov11_02316A44
	add r0, sp, #0
	ldr r3, [r1, #0x60]
	ldr ip, [r1, #0x5c]
	ldr r1, _022DCCE8 ; =ov11_02319240
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_022DCC8C:
	add r0, r4, #0xc
	bl InitScriptRoutineState
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
_022DCCDC: .word ov11_02316A44
_022DCCE0: .word OVERLAY11_DEBUG_STRINGS
_022DCCE4: .word ov11_02319224
_022DCCE8: .word ov11_02319240
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
	bl InitScriptRoutineState
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
	ldr r1, _022DCEDC ; =ov11_02316A44
	add r0, sp, #0x10
	ldr r2, [r1, #0x70]
	ldr r3, [r1, #0x6c]
	ldr r1, _022DCEE0 ; =OVERLAY11_DEBUG_STRINGS
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	bl Debug_FatalError
_022DCDDC:
	ldrsh r1, [r5, #0x7c]
	mvn r0, #0
	cmp r1, r0
	beq _022DCE0C
	ldr r1, _022DCEDC ; =ov11_02316A44
	add r0, sp, #8
	ldr r2, [r1, #8]
	ldr r3, [r1, #4]
	ldr r1, _022DCEE4 ; =ov11_02319224
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl Debug_FatalError
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
	bl InitScriptRoutineState
	b _022DCE5C
_022DCE38:
	ldr r1, _022DCEDC ; =ov11_02316A44
	add r0, sp, #0
	ldr r2, [r1, #0x90]
	ldr r1, [r1, #0x8c]
	str r2, [sp, #4]
	str r1, [sp]
	ldrsh r2, [r4, #0x18]
	ldr r1, _022DCEE8 ; =ov11_02319240
	bl Debug_FatalError
_022DCE5C:
	add r0, r5, #0xc
	bl InitScriptRoutineState
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
_022DCEDC: .word ov11_02316A44
_022DCEE0: .word OVERLAY11_DEBUG_STRINGS
_022DCEE4: .word ov11_02319224
_022DCEE8: .word ov11_02319240
	arm_func_end ov11_022DCCEC

	arm_func_start LockRoutine
LockRoutine: ; 0x022DCEEC
	strh r1, [r0, #0x3e]
	mov r1, #3
	strh r1, [r0, #0xe]
	ldr r1, _022DCF08 ; =ov11_02324E80
	mov r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022DCF08: .word ov11_02324E80
	arm_func_end LockRoutine

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
	bl InitScriptRoutineState
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022DCFB4:
	add r0, r4, #0xc
	bl InitScriptRoutineState
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
	bl InitScriptRoutineState
	add r0, r4, #0x7c
	bl InitScriptRoutineState
	mov r0, #1
	ldmia sp!, {r4, pc}
_022DCFF8:
	ldrsh r0, [r4, #0x7c]
	cmp r0, #0
	bne _022DD078
	add r0, r4, #0x7c
	bl InitScriptRoutineState
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
	bl InitScriptRoutineState
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
	bl InitScriptRoutineState
	add r0, r4, #0x7c
	bl InitScriptRoutineState
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

	arm_func_start UnlockRoutine
UnlockRoutine: ; 0x022DD0EC
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
	arm_func_end UnlockRoutine

	arm_func_start UnlockScriptingLock
UnlockScriptingLock: ; 0x022DD130
	stmdb sp!, {r3, lr}
	ldr ip, _022DD158 ; =LOCK_NOTIFY_ARRAY
	mov lr, #1
	ldr r1, _022DD15C ; =ov11_02324E80
	ldr r2, _022DD160 ; =ov11_02324F1C
	mov r3, #0
	strb lr, [ip, r0]
	str r3, [r2, r0, lsl #2]
	strb lr, [r1, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DD158: .word LOCK_NOTIFY_ARRAY
_022DD15C: .word ov11_02324E80
_022DD160: .word ov11_02324F1C
	arm_func_end UnlockScriptingLock

	arm_func_start FuncThatCallsRunNextOpcode
FuncThatCallsRunNextOpcode: ; 0x022DD164
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
	bl RunNextOpcode
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
	arm_func_end FuncThatCallsRunNextOpcode

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
	bl ScriptParamToInt
	add r1, sp, #8
	bl ov11_022E68E4
	cmp r0, #0
	beq _022DDD00
	ldr r2, [sp, #8]
	ldr r1, _022DDD0C ; =ov11_02319260
	mov r0, #2
	bl Debug_Print
	ldr r1, [sp, #8]
	mov r0, r4
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD468:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
	mov r5, r0
	str r5, [sp]
	mov r0, #2
	ldr r1, _022DDD10 ; =ov11_02319284
	mov r2, r8
	mov r3, r7
	bl Debug_Print
	mov r2, r7
	mov r3, r5
	mov r0, r4
	and r1, r8, #0xff
	bl ScriptSpecialProcessCall
	mov r2, r8
	mov r5, r0
	mov r0, #2
	ldr r1, _022DDD14 ; =ov11_023192B4
	mov r3, r5
	bl Debug_Print
	cmp r5, #0
	blt _022DDD00
	mov r2, #2
	mov r0, r4
	mov r1, r5
	strh r2, [r4, #0xe]
	bl ScriptCaseProcess
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022F25A4
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD544:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	ldr r1, _022DDD1C ; =ov11_023192E8
	mov r0, #2
	bl Debug_Print
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
	ldr r1, _022DDD20 ; =ov11_02319304
	bl Debug_Print
	b _022DDD00
_022DD5F0:
	ldrsh r0, [r4, #0x48]
	cmp r0, #0
	bne _022DD62C
	bl sub_02034DA8
	cmp r0, #0
	beq _022DD618
	ldr r1, _022DDD24 ; =ov11_02319320
	mov r0, #2
	bl Debug_Print
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
	ldr r1, _022DDD28 ; =ov11_02319338
	bl Debug_Print
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
	ldr r1, _022DDD2C ; =ov11_02319350
	bl Debug_Print
	b _022DDD00
_022DD688:
	ldr r1, _022DDD30 ; =ov11_02319370
	mov r0, #2
	bl Debug_Print
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #8]
	bl ScriptParamToInt
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
	bl ScriptParamToFixedPoint16
	mov r1, r6, lsl #0x10
	str r0, [sp, #0xc]
	mov r0, r1, lsr #0x10
	bl ScriptParamToFixedPoint16
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
	ldr r1, _022DDD3C ; =ov11_02319380
	mov r0, #2
	bl Debug_Print
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
	bl ScriptParamToInt
	ldrsh r1, [r4, #0x44]
	add r6, r6, #6
	cmp r0, r1
	bne _022DD8B0
	ldrh r1, [r8, #2]
	add r0, r4, #0x14
	bl GetSsbString
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
	bl GetSsbString
	mov r5, r0
	b _022DD938
_022DD928:
	str r6, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DD938:
	ldr r1, _022DDD40 ; =ov11_02319398
	mov r0, #2
	bl Debug_Print
	ldr r0, _022DDD44 ; =ov11_02324EA4
	bl sub_02034E28
	ldr r0, _022DDD18 ; =ov11_02324E80
	ldr r2, _022DDD48 ; =ov11_02324ECC
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
	ldr r1, _022DDD50 ; =ov11_023193AC
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	cmp r5, #0
	ble _022DDA04
	add r0, r5, r5, lsl #1
	add r6, r6, r0, lsl #1
	cmp r7, #0xab
	addeq r6, r6, #2
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	ldrh r0, [r6, #4]
	ldr r2, [r4, #0x14]
	ldr r1, _022DDD54 ; =ov11_023193BC
	add r0, r2, r0, lsl #1
	str r0, [r4, #0x1c]
	ldrh r3, [r6, #4]
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022DDA04:
	ldr r0, _022DDD58 ; =ov11_02324C64
	ldr r0, [r0]
	bl MemFree
	ldr r1, _022DDD58 ; =ov11_02324C64
	mov r2, #0
	mov r0, #1
	str r2, [r1]
	bl UnlockScriptingLock
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
	bl ScriptCaseProcess
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
	bl ScriptParamToInt
	bl ov11_022E9558
	mov r0, r4
	mov r1, #0
	bl ScriptCaseProcess
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
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	mov r0, #2
	strh r0, [r4, #0xe]
	b _022DDD00
_022DDC4C:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	bl ov11_022E958C
	mov r0, r4
	mov r1, #1
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022DDD00
_022DDC6C:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r2, r0
	ldr r1, _022DDD5C ; =ov11_023193D4
	add r0, sp, #0x20
	bl sprintf
	ldr r2, _022DDD60 ; =0x0000030F
	add r0, sp, #0x14
	add r1, sp, #0x20
	bl LoadFileFromRom
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
	bl InitBulkItem
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
_022DDD0C: .word ov11_02319260
_022DDD10: .word ov11_02319284
_022DDD14: .word ov11_023192B4
_022DDD18: .word ov11_02324E80
_022DDD1C: .word ov11_023192E8
_022DDD20: .word ov11_02319304
_022DDD24: .word ov11_02319320
_022DDD28: .word ov11_02319338
_022DDD2C: .word ov11_02319350
_022DDD30: .word ov11_02319370
_022DDD34: .word 0x00000113
#if defined(EUROPE)
_022DDD38: .word 0x0000013E
#elif defined(JAPAN)
_022DDD38: .word 0x00000137
#else
_022DDD38: .word 0x00000132
#endif
_022DDD3C: .word ov11_02319380
_022DDD40: .word ov11_02319398
_022DDD44: .word ov11_02324EA4
_022DDD48: .word ov11_02324ECC
_022DDD4C: .word 0x00003008
_022DDD50: .word ov11_023193AC
_022DDD54: .word ov11_023193BC
_022DDD58: .word ov11_02324C64
_022DDD5C: .word ov11_023193D4
_022DDD60: .word 0x0000030F
	arm_func_end ov11_022DD2C0

	arm_func_start RunNextOpcode
RunNextOpcode: ; 0x022DDD64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c8
	mov r4, r0
	ldr r1, [r4, #0x1c]
	ldr r0, _022DED08 ; =SCRIPT_OP_CODES
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
	bl ScriptParamToInt
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
	b _022E04D4 ; case 111
	b _022E04C4 ; case 112
	b _022E04DC ; case 113
	b _022E04DC ; case 114
	b _022E04DC ; case 115
	b _022DEE44 ; case 116
	b _022DEDC4 ; case 117
	b _022DEE00 ; case 118
	b _022DED7C ; case 119
	b _022DED60 ; case 120
	b _022DED98 ; case 121
	b _022DEF04 ; case 122
	b _022DEEBC ; case 123
	b _022DEF8C ; case 124
	b _022DEF64 ; case 125
	b _022DEF28 ; case 126
	b _022DEEDC ; case 127
	b _022DEE84 ; case 128
	b _022E04B8 ; case 129
	b _022E04CC ; case 130
	b _022E04DC ; case 131
	b _022E04DC ; case 132
	b _022E04DC ; case 133
	b _022E04DC ; case 134
	b _022E0410 ; case 135
	b _022E0434 ; case 136
	b _022DE3AC ; case 137
	b _022E04DC ; case 138
	b _022DECDC ; case 139
	b _022E04DC ; case 140
	b _022E04DC ; case 141
	b _022DE458 ; case 142
	b _022DE484 ; case 143
	b _022E04DC ; case 144
	b _022E04DC ; case 145
	b _022E04DC ; case 146
	b _022DE4BC ; case 147
	b _022E04DC ; case 148
	b _022E04DC ; case 149
	b _022DF924 ; case 150
	b _022DF924 ; case 151
	b _022DFA50 ; case 152
	b _022DF8B8 ; case 153
	b _022DF92C ; case 154
	b _022DF924 ; case 155
	b _022DF92C ; case 156
	b _022DE3F0 ; case 157
	b _022DF92C ; case 158
	b _022DFA78 ; case 159
	b _022DF92C ; case 160
	b _022DF728 ; case 161
	b _022DF710 ; case 162
	b _022DF740 ; case 163
	b _022DF760 ; case 164
	b _022DF834 ; case 165
	b _022DF7CC ; case 166
	b _022DF89C ; case 167
	b _022DF8F4 ; case 168
	b _022DFAAC ; case 169
	b _022DFD44 ; case 170
	b _022DFD44 ; case 171
	b _022DFC94 ; case 172
	b _022DFC94 ; case 173
	b _022DF92C ; case 174
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
	b _022DE3AC ; case 201
	b _022E04DC ; case 202
	b _022DE3AC ; case 203
	b _022DE448 ; case 204
	b _022E04DC ; case 205
	b _022E04DC ; case 206
	b _022E04DC ; case 207
	b _022E04DC ; case 208
	b _022E04DC ; case 209
	b _022E04DC ; case 210
	b _022E04DC ; case 211
	b _022E04DC ; case 212
	b _022E048C ; case 213
	b _022E04DC ; case 214
	b _022E0020 ; case 215
	b _022E0108 ; case 216
	b _022DFFC0 ; case 217
	b _022E00A8 ; case 218
	b _022DFFE8 ; case 219
	b _022E00D0 ; case 220
	b _022E04DC ; case 221
	b _022E0278 ; case 222
	b _022E0278 ; case 223
	b _022E0020 ; case 224
	b _022E0108 ; case 225
	b _022E04DC ; case 226
	b _022E04DC ; case 227
	b _022DFFE8 ; case 228
	b _022E00D0 ; case 229
	b _022E01F0 ; case 230
	b _022E04DC ; case 231
	b _022E0190 ; case 232
	b _022E04DC ; case 233
	b _022E01B8 ; case 234
	b _022E04DC ; case 235
	b _022E04DC ; case 236
	b _022E0278 ; case 237
	b _022E0278 ; case 238
	b _022E01F0 ; case 239
	b _022E04DC ; case 240
	b _022E04DC ; case 241
	b _022E04DC ; case 242
	b _022E01B8 ; case 243
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
	b _022DE834 ; case 298
	b _022DE834 ; case 299
	b _022DEBA4 ; case 300
	b _022DEBA4 ; case 301
	b _022DE934 ; case 302
	b _022DE9B8 ; case 303
	b _022DEAC4 ; case 304
	b _022DEA08 ; case 305
	b _022DEA08 ; case 306
	b _022DEAC4 ; case 307
	b _022DE960 ; case 308
	b _022DE960 ; case 309
	b _022DEC7C ; case 310
	b _022DE834 ; case 311
	b _022DE834 ; case 312
	b _022DE834 ; case 313
	b _022DE9B0 ; case 314
	b _022DE834 ; case 315
	b _022DE834 ; case 316
	b _022DE834 ; case 317
	b _022DE9B0 ; case 318
	b _022DF374 ; case 319
	b _022DF374 ; case 320
	b _022DF374 ; case 321
	b _022DF374 ; case 322
	b _022DF374 ; case 323
	b _022DF374 ; case 324
	b _022DF374 ; case 325
	b _022DF374 ; case 326
	b _022DF374 ; case 327
	b _022DF374 ; case 328
	b _022DF374 ; case 329
	b _022DF374 ; case 330
	b _022DF374 ; case 331
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
	b _022DED48 ; case 342
	b _022E0378 ; case 343
	b _022E03B8 ; case 344
	b _022E03C8 ; case 345
	b _022E03C8 ; case 346
	b _022E03E0 ; case 347
	b _022E03E0 ; case 348
	b _022E03E0 ; case 349
	b _022E03C0 ; case 350
	b _022E04DC ; case 351
	b _022E03E8 ; case 352
	b _022E03E8 ; case 353
	b _022E03E8 ; case 354
	b _022E03E0 ; case 355
	b _022E03F0 ; case 356
	b _022E03F0 ; case 357
	b _022E03F0 ; case 358
	b _022E03F0 ; case 359
	b _022E03E0 ; case 360
	b _022E03F8 ; case 361
	b _022E03F8 ; case 362
	b _022E038C ; case 363
	b _022E03E0 ; case 364
	b _022E03E0 ; case 365
	b _022E03E0 ; case 366
	b _022E03E0 ; case 367
	b _022E03D0 ; case 368
	b _022E03D8 ; case 369
	b _022E03D0 ; case 370
_022DE3AC: ; 0x022DE3AC
	ldr r2, [r4, #0x1c]
	ldr r0, _022DED08 ; =SCRIPT_OP_CODES
	ldrh r1, [r2]
	mov r1, r1, lsl #3
	ldrsb r0, [r0, r1]
	cmp r0, #0
	addge r0, r0, #1
	addge r0, r2, r0, lsl #1
	bge _022DE3E4
	ldrh r0, [r2, #2]
	bl ScriptParamToInt
	ldr r1, [r4, #0x1c]
	add r0, r0, #2
	add r0, r1, r0, lsl #1
_022DE3E4:
	str r0, [r4, #0x1c]
	mov r0, #3
	b _022E2478
_022DE3F0: ; 0x022DE3F0
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldr r1, _022DED10 ; =ov11_023193EC
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	add r1, sp, #0x158
	mov r0, r5
	bl ov11_022E60BC
	cmp r0, #0
	movne r0, #5
	bne _022E2478
	ldr r2, [sp, #0x158]
	ldr r1, _022DED14 ; =ov11_02319410
	mov r0, #2
	bl Debug_Print
	ldr r1, [sp, #0x158]
	mov r0, r4
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2474
_022DE448: ; 0x022DE448
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #5
	b _022E2478
_022DE458: ; 0x022DE458
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	ldrh r0, [r6, #2]
	mov r4, r1, asr #0x10
	bl ScriptParamToInt
	mov r2, r0
	mov r0, r4
	mov r1, #0
	bl ov11_022E94D0
	b _022E2474
_022DE484: ; 0x022DE484
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	ldrh r0, [r6, #2]
	mov r5, r1, asr #0x10
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r0
	mov r0, r5
	mov r2, r4
	bl ov11_022E94D0
	b _022E2474
_022DE4BC: ; 0x022DE4BC
	ldrh r0, [r6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	ldr r1, _022DED18 ; =ov11_02324E80
	strh r0, [r1, #8]
	ldrsh r2, [r1, #8]
	mov r0, #2
	strh r2, [r1, #6]
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022DE554
	ldr r3, _022DED18 ; =ov11_02324E80
	mov r0, #0xc
	ldrsh r2, [r3, #8]
	ldr r4, _022DED1C ; =_020A5490
	ldr r1, _022DED20 ; =ov11_02319438
	smulbb r0, r2, r0
	ldr r4, [r4, r0]
	mov r0, #2
	str r4, [sp]
	ldrsh r3, [r3, #6]
	bl Debug_Print
_022DE554:
	ldr r1, _022DED18 ; =ov11_02324E80
	mov r0, #0
	ldrsh r2, [r1, #8]
	mov r1, #0x1f
	bl SaveScriptVariableValue
	ldr r0, _022DED18 ; =ov11_02324E80
	mov r1, #0xc
	ldrsh r3, [r0, #8]
	ldr r2, _022DED24 ; =_020A548A
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
	bl InitPartnerFollowDataAndLiveActorList
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl ov11_022F1244
	mov r0, #5
	b _022E2478
_022DE5BC:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl ov11_022E7E84
	mov r0, #4
	b _022E2478
_022DE5D8:
	ldrh r0, [r6]
	bl ScriptParamToInt
	ldr r1, _022DED18 ; =ov11_02324E80
	strh r0, [r1, #2]
	ldrsh r2, [r1, #2]
	mov r0, #2
	strh r2, [r1, #4]
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022DE62C
	ldr r3, _022DED18 ; =ov11_02324E80
	mov r0, #0xc
	ldrsh r2, [r3, #2]
	ldr r4, _022DED1C ; =_020A5490
	ldr r1, _022DED28 ; =ov11_02319458
	smulbb r0, r2, r0
	ldr r4, [r4, r0]
	mov r0, #2
	str r4, [sp]
	ldrsh r3, [r3, #4]
	bl Debug_Print
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
	bl ScriptParamToInt
	mov r4, r0
	bl ov11_022F1710
	ldr r1, _022DED18 ; =ov11_02324E80
	mov r0, #2
	strh r4, [r1, #6]
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022DE6A4
	ldr r3, _022DED18 ; =ov11_02324E80
	mov r0, #0xc
	ldrsh r2, [r3, #8]
	ldr r4, _022DED1C ; =_020A5490
	ldr r1, _022DED2C ; =ov11_02319478
	smulbb r0, r2, r0
	ldr r4, [r4, r0]
	mov r0, #2
	str r4, [sp]
	ldrsh r3, [r3, #6]
	bl Debug_Print
_022DE6A4:
	mov r0, #5
	b _022E2478
_022DE6AC:
	mov r0, #5
	b _022E2478
_022DE6B4:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0
	mov r0, #1
	bl ov11_022E7F28
	mov r0, #4
	b _022E2478
_022DE6D0:
	ldr r0, _022DED30 ; =ov11_02316A44
	ldr r1, [r0, #0x38]
	ldr r0, [r0, #0x34]
	str r1, [sp, #0x154]
	str r0, [sp, #0x150]
	ldrh r0, [r6]
	bl ScriptParamToInt
	str r0, [sp, #0x150]
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r1, r0
	mov r0, #2
	bl ov11_022E7F28
	b _022E2474
_022DE7C8:
	ldrh r0, [r6]
	bl ScriptParamToInt
	and r0, r0, #0xff
	bl ov11_022F26DC
	b _022E2474
_022DE7DC:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r2, r0
	mov r1, r1, lsr #0x10
	mov r0, #0
	bl ov11_022EF594
	b _022E2474
_022DE808:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r2, r0
	mov r1, r1, lsr #0x10
	mov r0, #1
	bl ov11_022EF594
	b _022E2474
_022DE834: ; 0x022DE834
	ldrh r0, [r6]
	bl ScriptParamToInt
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
_022DE934: ; 0x022DE934
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl ov11_022F7188
	ldrsh r0, [r4, #8]
	cmp r0, #1
	bne _022E2474
	mov r0, #3
	b _022E2478
_022DE960: ; 0x022DE960
	ldrh r1, [r6]
	add r0, r4, #0x14
	bl GetSsbString
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
_022DE9B0: ; 0x022DE9B0
	mov r0, #4
	b _022E2478
_022DE9B8: ; 0x022DE9B8
	ldrh r0, [r6]
	bl ScriptParamToInt
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
_022DEA08: ; 0x022DEA08
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0, lsl #0x10
	ldrh r0, [r6, #2]
	mov r6, r7, asr #0x10
	bl ScriptParamToInt
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
_022DEAC4: ; 0x022DEAC4
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov sb, r0, lsl #0x10
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	mov r7, sb, asr #0x10
	bl GetSsbString
	mov r8, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
_022DEBA4: ; 0x022DEBA4
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov sb, r0, lsl #0x10
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	mov r7, sb, asr #0x10
	bl GetSsbString
	mov r8, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
_022DEC7C: ; 0x022DEC7C
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0, lsl #0x10
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	mov r6, r5, asr #0x10
	bl GetSsbString
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
_022DECDC: ; 0x022DECDC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, r4
	strh r1, [r4, #0x44]
	bl LockRoutine
	cmp r0, #0
	beq _022E2474
	mov r0, #4
	b _022E2478
	.align 2, 0
_022DED08: .word SCRIPT_OP_CODES
_022DED0C: .word 0x00000172
_022DED10: .word ov11_023193EC
_022DED14: .word ov11_02319410
_022DED18: .word ov11_02324E80
_022DED1C: .word _020A5490
_022DED20: .word ov11_02319438
_022DED24: .word _020A548A
_022DED28: .word ov11_02319458
_022DED2C: .word ov11_02319478
_022DED30: .word ov11_02316A44
_022DED34: .word 0x00000137
_022DED38: .word 0x00000135
_022DED3C: .word 0x00000132
_022DED40: .word 0x00000133
_022DED44: .word 0x0000012D
_022DED48: ; 0x022DED48
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl UnlockScriptingLock
	b _022E2474
_022DED60: ; 0x022DED60
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl sub_0204B3D0
	b _022E2474
_022DED7C: ; 0x022DED7C
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl ZinitScriptVariable
	b _022E2474
_022DED98: ; 0x022DED98
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r1, r5, lsl #0x10
	mov r2, r0
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl SaveScriptVariableValue
	b _022E2474
_022DEDC4: ; 0x022DEDC4
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r7, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, r5
	mov r2, r0
	add r0, r4, #0x6c
	bl sub_0204BED8
	b _022E2474
_022DEE00: ; 0x022DEE00
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r7, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, r5
	mov r2, r0
	add r0, r4, #0x6c
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_0204BF10
	b _022E2474
_022DEE44: ; 0x022DEE44
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r7, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, r5, lsl #0x10
	mov r2, r2, lsr #0x10
	mov r3, r0
	add r0, r4, #0x6c
	bl SaveScriptVariableValueAtIndex
	b _022E2474
_022DEE84: ; 0x022DEE84
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r3, r5, lsl #0x10
	mov r2, r0
	mov r1, r4
	mov r0, r3, asr #0x10
	bl SetScenarioScriptVar
	b _022E2474
_022DEEBC: ; 0x022DEEBC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r1, #0
	mov r2, r1
	mov r0, r0, asr #0x10
	bl SetScenarioScriptVar
	b _022E2474
_022DEEDC: ; 0x022DEEDC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r1, r0
	mov r0, r4
	and r1, r1, #0xff
	bl sub_0204CB2C
	b _022E2474
_022DEF04: ; 0x022DEF04
	mov r1, #0x27
	add r0, r4, #0x6c
	sub r2, r1, #0x28
	bl SaveScriptVariableValue
	add r0, r4, #0x6c
	mov r1, #0x2c
	mov r2, #0
	bl SaveScriptVariableValue
	b _022E2474
_022DEF28: ; 0x022DEF28
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
_022DEF64: ; 0x022DEF64
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r2, r4, lsl #0x10
	mov r1, r0
	mov r0, r2, asr #0x10
	bl sub_0204D018
	b _022E2474
_022DEF8C: ; 0x022DEF8C
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	cmp r4, #0x3e8
	blt _022DEFC0
	sub r0, r4, #0x3e8
	mov r1, #1
	bl sub_0204CA48
	ldr r0, _022DFE08 ; =ov11_02316B0C
	sub r1, r4, #0x3e8
	ldrb r0, [r0, r1]
	bl SetAdventureLogCompleted
	b _022E2474
_022DEFC0:
	ldr r0, _022DFE0C ; =ov11_02316CD0
	ldrb r0, [r0, r4]
	bl SetAdventureLogCompleted
	b _022E2474
_022DEFD0:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	cmp r0, #0
	ldreqh r0, [r6, #2]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
_022DF328:
	ldrh r0, [r6]
	bl ScriptParamToInt
	cmp r0, #0
	ldreqh r0, [r6, #2]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
_022DF348:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	mov r0, #0xb
	bl Debug_GetDebugFlag
	cmp r5, r0
	ldreqh r0, [r6, #2]
	ldreq r1, [r4, #0x14]
	addeq r0, r1, r0, lsl #1
	streq r0, [r4, #0x1c]
	b _022E2474
_022DF374: ; 0x022DF374
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
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValue
	mov r7, r0
	b _022DF6FC
_022DF3DC:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	bl RandInt
	mov r7, r0
	b _022DF6FC
_022DF498:
	ldrsb r7, [r4, #0x12]
	b _022DF6FC
_022DF4A0:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	mov r0, #0
	mov r2, r0
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r7, r0
	b _022DF6FC
_022DF4C4:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r7, r0
	b _022DF6FC
_022DF4E8:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDungeonMode
	mov r7, r0
	b _022DF6FC
_022DF504:
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetScriptEntityMonsterId
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	ldr r1, _022DFE10 ; =ov11_02316A60
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	ldr r3, _022DFE10 ; =ov11_02316A60
	add r0, sp, #0xf0
	add r1, sp, #0xe0
	add r2, sp, #0xe8
	bl sub_020058A8
	mov r7, r0
	mvn r0, #0
	cmp r7, r0
	bne _022DF6FC
	ldr r1, _022DFE10 ; =ov11_02316A60
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
	ldr r1, _022DED30 ; =ov11_02316A44
	add r0, sp, #0xd8
	ldr r3, [r1, #0x58]
	ldr r6, [r1, #0x54]
	ldr r1, _022DFE14 ; =ov11_02319498
	mov r2, r5
	str r6, [sp, #0xd8]
	str r3, [sp, #0xdc]
	bl Debug_FatalError
_022DF6FC:
	mov r0, r4
	mov r1, r7
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2474
_022DF710: ; 0x022DF710
	ldr r1, _022DFE18 ; =ov11_02324ECC
	mov r2, #0x60000
	ldr r0, _022DFE1C ; =ov11_02324EA4
	str r2, [r1, #0x4c]
	bl InitPortraitParams
	b _022E2474
_022DF728: ; 0x022DF728
	ldr r1, _022DFE18 ; =ov11_02324ECC
	mov r2, #0x70000
	ldr r0, _022DFE1C ; =ov11_02324EA4
	str r2, [r1, #0x4c]
	bl InitPortraitParams
	b _022E2474
_022DF740: ; 0x022DF740
	ldrh r0, [r6]
	bl ScriptParamToInt
	orr r2, r0, #0x10000
	ldr r1, _022DFE18 ; =ov11_02324ECC
	ldr r0, _022DFE1C ; =ov11_02324EA4
	str r2, [r1, #0x4c]
	bl InitPortraitParams
	b _022E2474
_022DF760: ; 0x022DF760
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r7, lsl #0x10
	mov r4, r0
	mov r0, r1, asr #0x10
	bl GetScriptEntityMonsterId
	mov r1, r0, lsl #0x10
	ldr r2, _022DFE18 ; =ov11_02324ECC
	orr r3, r7, #0x10000
	ldr r0, _022DFE1C ; =ov11_02324EA4
	mov r1, r1, asr #0x10
	str r3, [r2, #0x4c]
	bl InitPortraitParamsWithMonsterId
	mov r1, r5, lsl #0x18
	ldr r0, _022DFE1C ; =ov11_02324EA4
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _022DFE1C ; =ov11_02324EA4
	and r1, r4, #0xff
	bl SetPortraitLayout
	b _022E2474
_022DF7CC: ; 0x022DF7CC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r4, r0
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r3, #0x60000
	mov r0, r1, asr #0x10
	str r3, [r2, #0x4c]
	bl GetScriptEntityMonsterId
	mov r1, r0
	ldr r0, _022DFE1C ; =ov11_02324EA4
	bl InitPortraitParamsWithMonsterId
	mov r1, r5, lsl #0x18
	ldr r0, _022DFE1C ; =ov11_02324EA4
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _022DFE1C ; =ov11_02324EA4
	and r1, r4, #0xff
	bl SetPortraitLayout
	b _022E2474
_022DF834: ; 0x022DF834
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r4, r0
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r3, #0x70000
	mov r0, r1, asr #0x10
	str r3, [r2, #0x4c]
	bl GetScriptEntityMonsterId
	mov r1, r0
	ldr r0, _022DFE1C ; =ov11_02324EA4
	bl InitPortraitParamsWithMonsterId
	mov r1, r5, lsl #0x18
	ldr r0, _022DFE1C ; =ov11_02324EA4
	mov r1, r1, asr #0x18
	bl SetPortraitEmotion
	ldr r0, _022DFE1C ; =ov11_02324EA4
	and r1, r4, #0xff
	bl SetPortraitLayout
	b _022E2474
_022DF89C: ; 0x022DF89C
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0
	ldr r0, _022DFE1C ; =ov11_02324EA4
	and r1, r1, #0xff
	bl SetPortraitLayout
	b _022E2474
_022DF8B8: ; 0x022DF8B8
	ldr r0, _022DED30 ; =ov11_02316A44
	ldr r1, [r0, #0x80]
	ldr r0, [r0, #0x7c]
	str r1, [sp, #0xd4]
	str r0, [sp, #0xd0]
	ldrh r0, [r6]
	bl ScriptParamToInt
	str r0, [sp, #0xd0]
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	str r0, [sp, #0xd4]
	ldr r0, _022DFE1C ; =ov11_02324EA4
	add r1, sp, #0xd0
	bl SetPortraitOffset
	b _022E2474
_022DF8F4: ; 0x022DF8F4
	ldrh r0, [r6]
	bl ScriptParamToInt
	ldr r1, _022DED18 ; =ov11_02324E80
	str r0, [r1, #0xc]
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	ldr r2, _022DED18 ; =ov11_02324E80
	mov r1, r0
	str r1, [r2, #0x10]
	ldr r0, [r2, #0xc]
	bl sub_02034E60
	b _022E2474
_022DF924: ; 0x022DF924
	mov r0, #5
	b _022E2478
_022DF92C: ; 0x022DF92C
	ldrh r1, [r6]
	add r0, r4, #0x14
	bl GetSsbString
	mov r4, r0
	ldr r1, _022DFE20 ; =ov11_023194B0
	mov r0, #2
	bl Debug_Print
	cmp r5, #0x9e
	cmpne r5, #0xae
	bne _022DF960
	ldr r0, _022DFE1C ; =ov11_02324EA4
	bl sub_02034E28
	b _022DF968
_022DF960:
	ldr r0, _022DFE24 ; =ov11_02324E94
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
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DF9D8:
	orr r0, r1, #8
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DF9F4:
	orr r0, r1, #8
	orr r0, r0, #0x3000
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DFA14:
	orr r0, r1, #8
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
	b _022DFA48
_022DFA30:
	orr r0, r1, #4
	mov r0, r0, lsl #0x10
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r1, r4
	mov r0, r0, lsr #0x10
	bl sub_02034F20
_022DFA48:
	mov r0, #5
	b _022E2478
_022DFA50: ; 0x022DFA50
	ldrh r1, [r6]
	add r0, r4, #0x14
	bl GetSsbString
	ldr r3, _022DED18 ; =ov11_02324E80
	ldr r1, _022DFE18 ; =ov11_02324ECC
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x10]
	bl ov11_02300ACC
	mov r0, #5
	b _022E2478
_022DFA78: ; 0x022DFA78
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r1, [r6, #2]
	add r0, r4, #0x14
	bl GetSsbString
	ldr r2, _022DED18 ; =ov11_02324E80
	ldr r1, _022DFE18 ; =ov11_02324ECC
	ldr r3, [r2, #0xc]
	mov r2, r5
	bl ov11_02300728
	mov r0, #5
	b _022E2478
_022DFAAC: ; 0x022DFAAC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldr r1, _022DFE28 ; =ov11_023194C0
	mov r0, #2
	mov r6, #0
	bl Debug_Print
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
	ldr r0, _022DFE1C ; =ov11_02324EA4
	movne sb, #5
	bl sub_02034E28
	ldr ip, _022DFE18 ; =ov11_02324ECC
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
#ifdef JAPAN
	ldr r1, _022E14D4 ; =0x00003008
	mov r0, r0, lsl #0x10
#else
	mov r0, r0, lsl #0x10
	ldr r1, _022DFE30 ; =0x0000025E
#endif
	ldr r2, _022DFE18 ; =ov11_02324ECC
	mov r0, r0, lsr #0x10
#ifdef JAPAN
	rsb r1, r1, #0x3500
#endif
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
	bl GetScriptEntityMonsterId
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
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2474
_022DFC64:
	ldr r0, _022DED18 ; =ov11_02324E80
	ldrsh r0, [r0, #6]
	bl ov11_022F46B4
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl InitPartnerFollowDataAndLiveActorList
	bl ov11_022FBE04
	bl ov11_022FD66C
	bl ov11_022F1244
	mov r0, #4
	b _022E2478
_022DFC94: ; 0x022DFC94
	ldrh r0, [r6]
	ldr r5, [r4, #0x1c]
	bl ScriptParamToInt
	mov r6, r0
	mov r1, r6, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl LoadScriptVariableValue
	strh r0, [r4, #0x44]
	ldrsh r2, [r4, #0x44]
	ldr r1, _022DFE34 ; =ov11_023194D8
	mov r3, r6
	mov r0, #2
	bl Debug_Print
	mov r7, #2
	ldr r6, _022DFE38 ; =ov11_023194F4
	b _022DFD0C
_022DFCD8:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r8, r0
	mov r0, r7
	mov r1, r6
	mov r2, r8
	bl Debug_Print
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
	ldr r1, _022DFE3C ; =ov11_02319504
	mov r0, #2
	bl Debug_Print
	mvn r0, #0
	strh r0, [r4, #0x44]
	mov r0, #5
	b _022E2478
_022DFD44: ; 0x022DFD44
	ldr r0, _022DFE40 ; =0x0000524C
	mov r1, #8
	ldr r7, [r4, #0x1c]
	bl MemAlloc
	ldr r1, _022DFE44 ; =ov11_02324C64
	cmp r5, #0xab
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	ldr r0, [r1]
	movne r8, #0x72
	str r2, [r0, #4]
	bne _022DFD88
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_022DFD88:
	mov fp, #0
	ldr r5, _022DFE44 ; =ov11_02324C64
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
	bl GetSsbString
	mov sl, r0
	b _022DFE70
	.align 2, 0
_022DFE08: .word ov11_02316B0C
_022DFE0C: .word ov11_02316CD0
_022DFE10: .word ov11_02316A60
_022DFE14: .word ov11_02319498
_022DFE18: .word ov11_02324ECC
_022DFE1C: .word ov11_02324EA4
_022DFE20: .word ov11_023194B0
_022DFE24: .word ov11_02324E94
_022DFE28: .word ov11_023194C0
_022DFE2C: .word 0x0001002F
#ifdef JAPAN
_022E14D4: .word 0x00003008
#else
_022DFE30: .word 0x0000025E
#endif
_022DFE34: .word ov11_023194D8
_022DFE38: .word ov11_023194F4
_022DFE3C: .word ov11_02319504
_022DFE40: .word 0x0000524C
_022DFE44: .word ov11_02324C64
_022DFE48: .word 0x0000C402
_022DFE4C: .word ov11_02319518
_022DFE50: .word ov11_02319534
_022DFE54: .word ov11_02319554
_022DFE58:
	ldrh r0, [r7, #2]
	bl ScriptParamToInt
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
	ldr r1, _022DFE4C ; =ov11_02319518
	add r2, r2, #1
	str r2, [sb, #0x100]
	ldrh r2, [r7, #4]
	ldr r3, [r5]
	stmia sp, {r2, sl}
	ldmia r3, {r2, r3}
	bl Debug_Print
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
	ldr r0, _022DFE44 ; =ov11_02324C64
	str r7, [r4, #0x1c]
	ldr r0, [r0]
	ldr r1, _022DFE50 ; =ov11_02319534
	ldmia r0, {r2, r3}
	mov r0, #2
	bl Debug_Print
	ldr r0, _022DFE44 ; =ov11_02324C64
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r1, #0
	ble _022DFFAC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldr r1, _022DFE54 ; =ov11_02319554
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022DFE44 ; =ov11_02324C64
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
	ldr r1, _022DFE44 ; =ov11_02324C64
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
	ldr r0, _022DFE44 ; =ov11_02324C64
	mov r1, #0
	str r1, [r0]
	b _022E2474
_022DFFC0: ; 0x022DFFC0
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	bl ov11_022E9B0C
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
_022DFFE8: ; 0x022DFFE8
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
_022E0020: ; 0x022E0020
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
_022E00A8: ; 0x022E00A8
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	bl ov11_022E9B84
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
_022E00D0: ; 0x022E00D0
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
_022E0108: ; 0x022E0108
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
_022E0190: ; 0x022E0190
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	bl ov11_022E9C98
	cmp r4, #0
	beq _022E2474
	mov r0, #3
	b _022E2478
_022E01B8: ; 0x022E01B8
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
_022E01F0: ; 0x022E01F0
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
_022E0278: ; 0x022E0278
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
	mov sb, r0
	ldrh r0, [r6, #8]
	bl ScriptParamToInt
	mov sl, r0
	ldrh r0, [r6, #0xa]
	bl ScriptParamToInt
	ldr r6, _022E1218 ; =ov11_02316A44
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
_022E0378: ; 0x022E0378
	ldrh r0, [r6]
	bl ScriptParamToInt
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E038C: ; 0x022E038C
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	sub r0, r0, r5
	bl RandInt
	add r0, r5, r0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E03B8: ; 0x022E03B8
	mov r0, #3
	b _022E2478
_022E03C0: ; 0x022E03C0
	mov r0, #3
	b _022E2478
_022E03C8: ; 0x022E03C8
	mov r0, #3
	b _022E2478
_022E03D0: ; 0x022E03D0
	mov r0, #4
	b _022E2478
_022E03D8: ; 0x022E03D8
	mov r0, #4
	b _022E2478
_022E03E0: ; 0x022E03E0
	mov r0, #3
	b _022E2478
_022E03E8: ; 0x022E03E8
	mov r0, #4
	b _022E2478
_022E03F0: ; 0x022E03F0
	mov r0, #4
	b _022E2478
_022E03F8: ; 0x022E03F8
	mov r0, #3
	b _022E2478
_022E0400:
	add r0, r4, #0x14
	add r5, r4, #0x24
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
_022E0410: ; 0x022E0410
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
_022E0434: ; 0x022E0434
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r5, r0
	ldr r1, _022E121C ; =ov11_0231956C
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	mov r1, r5, lsl #0x10
	add r0, sp, #0x15c
	mov r1, r1, asr #0x10
	bl GetCoroutineInfo
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
_022E048C: ; 0x022E048C
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
_022E04B8: ; 0x022E04B8
	mov r0, #0
	str r0, [r4, #0x2c]
	b _022E2474
_022E04C4: ; 0x022E04C4
	mov r0, #0
	b _022E2478
_022E04CC: ; 0x022E04CC
	mov r0, #1
	b _022E2478
_022E04D4: ; 0x022E04D4
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
	bl ScriptParamToInt
	ldr r2, [r4]
	mov r1, r0
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x38]
	blx r2
	b _022E246C
_022E094C:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	tst r5, #0x10
	beq _022E0974
	ldrsh r0, [r4, #0x7c]
	cmp r0, #0
	bne _022E0974
	add r0, r4, #0x7c
	bl InitScriptRoutineState
_022E0974:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r5
	blx r2
	b _022E246C
_022E098C:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, r3, lsl #6
	blx r2
	b _022E246C
_022E09B0:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r3, lsl #6
	blx r2
	b _022E246C
_022E09D4:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, r3, lsl #0xb
	blx r2
	b _022E246C
_022E09F8:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r3, lsl #0xb
	blx r2
	b _022E246C
_022E0A1C:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x38]
	mov r1, r3, lsl #0x10
	blx r2
	b _022E246C
_022E0A40:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x3c]
	mov r1, r3, lsl #0x10
	blx r2
	b _022E246C
_022E0A64:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	ldr r1, _022E122C ; =ov11_02316A44
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
	bl ScriptParamToInt
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
	bl InitScriptRoutineState
_022E0E74:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x1c]
	mov r1, #0
	blx r2
	b _022E246C
_022E0E8C:
	ldr r0, _022E122C ; =ov11_02316A44
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x3c]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
	str r0, [sp, #0x40]
	ldrh r0, [r6, #4]
	bl ScriptParamToFixedPoint16
	str r0, [sp, #0x44]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x24]
	add r1, sp, #0x40
	blx r2
	b _022E246C
_022E0ED0:
	ldr r0, _022E122C ; =ov11_02316A44
	ldr r1, [r0, #0x28]
	ldr r0, [r0, #0x24]
	str r1, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
	str r0, [sp, #0x48]
	ldrh r0, [r6, #4]
	bl ScriptParamToFixedPoint16
	str r0, [sp, #0x4c]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0x44]
	add r1, sp, #0x48
	blx r2
	b _022E246C
_022E0F14:
	ldr r1, _022E122C ; =ov11_02316A44
	ldrh r0, [r6, #2]
	ldr r2, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	str r2, [sp, #0x50]
	str r1, [sp, #0x54]
	bl ScriptParamToInt
	str r0, [sp, #0x50]
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	ldr r1, _022E122C ; =ov11_02316A44
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	b _022E246C
_022E10F4:
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
	movs r7, r0
	bmi _022E246C
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	ldr r0, _022E122C ; =ov11_02316A44
	ldr r1, [r0, #0x20]
	ldr r0, [r0, #0x1c]
	str r1, [sp, #0x8c]
	str r0, [sp, #0x88]
	b _022E126C
	.align 2, 0
_022E1218: .word ov11_02316A44
_022E121C: .word ov11_0231956C
_022E1220: .word 0x00000129
_022E1224: .word 0x00000101
_022E1228: .word 0x0000015F
_022E122C: .word ov11_02316A44
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
	bl ScriptParamToInt
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
	ldr r1, _022E2274 ; =ov11_02316A60
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
	bl ScriptParamToInt
	strb r0, [r4, #0x69]
	mov r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1350:
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r8, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #8]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	strb r0, [r4, #0x42]
	ldr r2, [r4]
	ldrsb r1, [r4, #0x42]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x2c]
	blx r2
	ldrh r0, [r6, #4]
	bl ScriptParamToFixedPoint16
	str r0, [r4, #0x4c]
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1460:
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToFixedPoint16
	str r0, [r4, #0x4c]
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E14C4:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #8]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	mov r0, r4
	strh r5, [r4, #0x46]
	mov r1, r1, asr #0x10
	strh r1, [r4, #0x44]
	bl LockRoutine
	mov r0, #3
	b _022E2478
_022E14F8:
	ldrh r0, [r6, #4]
	bl ScriptParamToFixedPoint16
	str r0, [r4, #0x64]
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
	str r0, [r4, #0x4c]
	mvn r0, #0
	strh r0, [r4, #0x46]
	mov r0, #3
	b _022E2478
_022E1520:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
	and r1, r7, #0xff
	mov r2, r5
	mov r3, r0
	mov r0, r4
	bl ov11_022E7AE4
	mov r0, #3
	b _022E2478
_022E155C:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r6, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r6, #6]
	bl ScriptParamToInt
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
	ldr r2, _022E2278 ; =SCRIPT_COMMAND_PARSING_DATA
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
	ldr r2, _022E2278 ; =SCRIPT_COMMAND_PARSING_DATA
	cmp r7, #0x45
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	movne r5, #1
	ldr r7, [r2, r3, lsl #2]
	blx r1
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
	mov r3, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl ov11_022EB19C
	mov r0, #3
	b _022E2478
_022E16C4:
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
	str r0, [r4, #0x4c]
	ldrsh r1, [r4, #0x3c]
	mov r0, #3
	sub r1, r1, #1
	strh r1, [r4, #0x3c]
	b _022E2478
_022E1760:
	ldr r1, [r4]
	ldrsh r3, [r4, #8]
	ldr r2, _022E2278 ; =SCRIPT_COMMAND_PARSING_DATA
	cmp r7, #0x3b
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	movne r5, #1
	ldr r7, [r2, r3, lsl #2]
	blx r1
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
	mov r3, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl ov11_022EB208
	mov r0, #3
	b _022E2478
_022E17B0:
	ldrh r0, [r6, #2]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	ldr r2, _022E2278 ; =SCRIPT_COMMAND_PARSING_DATA
	cmp r7, #0x40
	moveq r5, #0
	ldr r0, [r4, #4]
	ldr r1, [r1, #4]
	movne r5, #1
	ldr r7, [r2, r3, lsl #2]
	blx r1
	mov r4, r0
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
	mov r3, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl ov11_022EB274
	mov r0, #3
	b _022E2478
_022E18A8:
	ldrh r0, [r6, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0, lsl #0x10
	ldrh r0, [r5, #4]
	mov r5, r6, asr #0x10
	bl ScriptParamToInt
	mvn r1, #0
	mov r7, r0
	cmp r1, r6, asr #16
	bne _022E1C5C
	bl sub_0204E760
	mov r5, r0
	ldr r1, _022E2284 ; =ov11_0231958C
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	mvn r0, #0
	cmp r5, r0
	beq _022E1C48
	mov r0, r7
	bl ov11_022E958C
	mov r0, r4
	mov r1, #1
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2464
_022E1C48:
	mov r0, r4
	mov r1, #0
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2464
_022E1C5C:
	ldr r1, _022E2288 ; =ov11_023195AC
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	mov r0, r5
	bl SetEnterDungeon
	mov r0, r4
	mov r1, #1
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2464
_022E1C88:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r7, r0, lsl #0x10
	ldrh r0, [r5, #4]
#ifdef JAPAN
	mov r5, r7, asr #0x10
#else
	mov r8, r7, asr #0x10
#endif
	bl ScriptParamToInt
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
#ifdef JAPAN
	cmp r5, #0xfb
#else
	cmp r8, #0xfb
#endif
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
#ifdef JAPAN
	cmp r5, #0xfa
#else
	cmp r8, #0xfa
#endif
	moveq r0, #1
	streqh r0, [r4, #0x44]
	beq _022E1E20
#ifndef JAPAN
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
#endif
	cmp r6, #0x8c
	beq _022E1DD0
#ifdef JAPAN
	mov r2, r5
#else
	mov r2, r8
#endif
	mov r0, #0
	mov r1, #0x26
	bl SaveScriptVariableValue
#ifndef JAPAN
	b _022E1E18
#endif
_022E1DD0:
	mov r0, r5
#ifdef JAPAN
	bl SetEnterDungeon
#else
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
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	b _022E2464
_022E1E18:
#endif
	mov r0, #1
	strh r0, [r4, #0x44]
_022E1E20:
	mov r0, #5
	b _022E2478
_022E1E28:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl ScriptCaseProcess
	str r0, [r4, #0x1c]
	mov r0, r5
	bl ov11_022E958C
	b _022E2464
_022E1E50:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	bl WorldMapSetMode
	b _022E2464
_022E1E60:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl WorldMapSetCamera
	b _022E2464
_022E1F44:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_0230F21C
	b _022E2464
_022E1F80:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	cmp r0, #0
	movlt r0, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017ACC
	b _022E2464
_022E20A4:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	ldr r1, _022E229C ; =0x000003E7
	mov r0, r0, lsr #0x10
	cmp r0, r1
	beq _022E20C8
	bl PlayBgmByIdVeneer
	b _022E2464
_022E20C8:
	bl sub_02017B70
	b _022E2464
_022E20D0:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ScriptParamToInt
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
	bl PlayBgmByIdVolumeVeneer
	b _022E2464
_022E2120:
	bl sub_02017B70
	b _022E2464
_022E2128:
	bl sub_02017B70
	b _022E2464
_022E2130:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	cmp r0, #0
	movlt r0, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017B7C
	b _022E2464
_022E2150:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017B88
	b _022E2464
_022E217C:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	cmp r0, #0
	movlt r0, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017BF8
	b _022E2464
_022E2228:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017C04
	b _022E2464
_022E2254:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C50
	b _022E2464
_022E226C:
	bl sub_02017C5C
	b _022E2464
	.align 2, 0
#ifndef JAPAN
_022E2274: .word ov11_02316A60
_022E2278: .word SCRIPT_COMMAND_PARSING_DATA
_022E227C: .word 0x00000127
_022E2280: .word 0x00000179
_022E2284: .word ov11_0231958C
_022E2288: .word ov11_023195AC
_022E228C: .word 0x00000296
_022E2290: .word 0x00000297
_022E2294: .word 0x00000299
_022E2298: .word 0x00000295
_022E229C: .word 0x000003E7
#endif
_022E22A0:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl PlaySeByIdVolumeWrapper
	b _022E2464
_022E22B8:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r1, r4, lsl #0x10
	mov r2, r0, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	bl sub_02017C74
	b _022E2464
_022E22E4:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r2, r0, lsl #0x10
	mov r1, r4, lsl #0x10
	mov r0, r1, lsr #0x10
	mov r3, r2, asr #0x10
	mov r1, #0
	mov r2, #0x100
	bl sub_02017C90
	b _022E2464
#ifdef JAPAN
_022E2274: .word ov11_02316A60
_022E2278: .word SCRIPT_COMMAND_PARSING_DATA
_022E227C: .word 0x00000127
_022E2280: .word 0x00000179
_022E2284: .word ov11_0231958C
_022E2288: .word ov11_023195AC
_022E228C: .word 0x00000296
_022E2290: .word 0x00000297
_022E2294: .word 0x00000299
_022E2298: .word 0x00000295
_022E229C: .word 0x000003E7
#endif
_022E2318:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017CB4
	b _022E2464
_022E23F8:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r4, r0
	ldrh r0, [r5, #4]
	bl ScriptParamToInt
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
	bl ScriptSpecialProcess0x16
	b _022E2464
_022E2440:
	ldrh r0, [r5, #2]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0206C0EC
	mov r0, #1
	bl ov11_022E9710
	mov r0, #1
	bl ScriptSpecialProcess0x16
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
	arm_func_end RunNextOpcode

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
	bl ScriptParamToInt
	mov r6, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
	mov r7, r0
	ldrh r2, [r4, #4]
	mov r0, #2
	ldr r1, _022E38D0 ; =ov11_023195C8
	str r2, [sp]
	mov r2, r6
	mov r3, r7
	bl Debug_Print
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToFixedPoint16
	ldr r1, [sb, #0x50]
	add r0, r1, r0
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToFixedPoint16
	ldr r1, [sb, #0x50]
	add r0, r1, r0
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
	str r0, [sb, #0x58]
	ldr r1, [sb, #0x38]
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToInt
	ldr r1, [sb, #0x38]
	mov r6, r0
	add r0, r1, #2
	str r0, [sb, #0x38]
	ldrh r0, [r1]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	ldr r1, _022E38E0 ; =ov11_02316A44
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
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fdiv
	bl _ffix
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	ldr r0, _022E38E0 ; =ov11_02316A44
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
	ldr r1, _022E38E8 ; =ov11_02316A60
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r4, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetLiveActorIdxFromScriptEntityId
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
	ldrne r0, _022E38E0 ; =ov11_02316A44
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
	ldr r1, _022E38E8 ; =ov11_02316A60
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
	bl ScriptParamToInt
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
_022E38D0: .word ov11_023195C8
_022E38D4: .word 0x00000122
_022E38D8: .word 0x00000121
_022E38DC: .word 0x00000115
_022E38E0: .word ov11_02316A44
_022E38E4: .word 0x0000014D
_022E38E8: .word ov11_02316A60
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
	bl ScriptParamToInt
	mov r7, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r4, #6]
	bl ScriptParamToInt
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
	bl IsScreenFadeInProgress
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r4, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r4, #6]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
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
	ldr r1, _022E4244 ; =ov11_02324F1C
	mov r0, r7
	ldr r1, [r1, r2, lsl #2]
	bl ScriptCaseProcess
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r1, [r4, #4]
	add r0, r7, #0x14
	bl GetSsbString
	mov r1, r0
	mov r0, r5
	bl ov11_022F2748
	b _022E4124
_022E40D4:
	cmp r5, #8
	ldrh r0, [r4, #2]
	bne _022E4104
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	and r0, r5, #0xff
	mov r1, r1, asr #0x10
	bl ov11_022F2790
	b _022E4124
_022E4104:
	bl ScriptParamToInt
	mov r5, r0
	ldrh r1, [r4, #4]
	add r0, r7, #0x14
	bl GetSsbString
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r1, [r4, #0xc]
	add r0, r7, #0x14
	bl GetSsbString
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
	bl ScriptParamToInt
	mov r6, r0
	ldrh r1, [r4, #4]
	add r0, r7, #0x14
	bl GetSsbString
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
_022E4244: .word ov11_02324F1C
	arm_func_end ov11_022E3C68

	arm_func_start GetSsbString
GetSsbString: ; 0x022E4248
	ldr r2, [r0, #0xc]
	mov r0, r1, lsl #1
	ldrh r0, [r2, r0]
	add r0, r2, r0
	bx lr
	arm_func_end GetSsbString

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
	bl ScriptParamToInt
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
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl GetCoroutineInfo
	cmp r0, #0
	beq _022E4344
	ldrh r0, [r4, #4]
	bl ScriptParamToInt
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

	arm_func_start HandleUnlocks
HandleUnlocks: ; 0x022E4350
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _022E43DC ; =ov11_02324E80
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0
	ldr r5, _022E43E0 ; =ov11_023195EC
	ldr r7, _022E43E4 ; =LOCK_NOTIFY_ARRAY
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
	bl Debug_Print
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl UnlockMainRoutine
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl UnlockActorRoutines
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl UnlockObjectRoutines
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl UnlockPerformerRoutines
	strb r4, [r7, r8]
_022E43CC:
	add r8, r8, #1
	cmp r8, #0x15
	blt _022E437C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E43DC: .word ov11_02324E80
_022E43E0: .word ov11_023195EC
_022E43E4: .word LOCK_NOTIFY_ARRAY
	arm_func_end HandleUnlocks

	arm_func_start ScriptCaseProcess
ScriptCaseProcess: ; 0x022E43E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r1
	mov r8, r0
	ldr r1, _022E45A8 ; =ov11_02319600
	mov r2, r7
	mov r0, #2
	ldr r5, [r8, #0x1c]
	mov r6, #0
	bl Debug_Print
	mov r4, #2
	ldr sl, _022E45AC ; =ov11_02319618
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
	bl ScriptParamToInt
	mov sb, r0
	mov r0, r4
	mov r1, sl
	mov r2, sb
	bl Debug_Print
	mov r1, sb
	mov r0, r7
	mov r2, fp
	bl sub_0204BF5C
	cmp r0, #0
	beq _022E44A0
	ldrh r3, [r5, #4]
	ldr r1, _022E45B0 ; =ov11_02319628
	mov r2, r6
	mov r0, #2
	bl Debug_Print
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
	bl ScriptParamToInt
	mov sb, r0
	ldrh r2, [r5, #2]
	ldr r1, _022E45B4 ; =ov11_02319640
	mov r0, #2
	mov r3, sb
	bl Debug_Print
	ldrh r2, [r5, #2]
	mov r1, sb
	mov r0, r7
	bl sub_0204BF5C
	cmp r0, #0
	beq _022E4508
	ldrh r3, [r5, #6]
	ldr r1, _022E45B0 ; =ov11_02319628
	mov r2, r6
	mov r0, #2
	bl Debug_Print
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
	bl ScriptParamToInt
	mov sb, r0
	ldrh r2, [r5, #2]
	ldr r1, _022E45B8 ; =ov11_02319658
	mov r0, #2
	mov r3, sb
	bl Debug_Print
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
	ldr r1, _022E45B0 ; =ov11_02319628
	mov r2, r6
	mov r0, #2
	bl Debug_Print
	ldrh r0, [r5, #6]
	ldr r1, [r8, #0x14]
	add r0, r1, r0, lsl #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022E4580:
	add r5, r5, #8
	add r6, r6, #1
	b _022E4418
_022E458C:
	ldr r0, _022E45BC ; =ov11_02318614
	ldr r1, _022E45C0 ; =ov11_02319674
	ldr r2, [r0, r3, lsl #3]
	mov r0, #2
	bl Debug_Print
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E45A8: .word ov11_02319600
_022E45AC: .word ov11_02319618
_022E45B0: .word ov11_02319628
_022E45B4: .word ov11_02319640
_022E45B8: .word ov11_02319658
_022E45BC: .word ov11_02318614
_022E45C0: .word ov11_02319674
	arm_func_end ScriptCaseProcess

	arm_func_start ov11_022E45C4
ov11_022E45C4: ; 0x022E45C4
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _022E45D8 ; =ov11_02324F70
	strb r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E45D8: .word ov11_02324F70
	arm_func_end ov11_022E45C4

	arm_func_start ov11_022E45DC
ov11_022E45DC: ; 0x022E45DC
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _022E45F0 ; =ov11_02324F70
	strb r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E45F0: .word ov11_02324F70
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
	ldr r1, _022E4658 ; =ov11_0231968C
	mov r2, #8
	bl sub_020023F8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4658: .word ov11_0231968C
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

	arm_func_start LoadFileFromRomVeneer
LoadFileFromRomVeneer: ; 0x022E46DC
	ldr ip, _022E46E4 ; =LoadFileFromRom
	bx ip
	.align 2, 0
_022E46E4: .word LoadFileFromRom
	arm_func_end LoadFileFromRomVeneer

	arm_func_start ov11_022E46E8
ov11_022E46E8: ; 0x022E46E8
	ldr ip, _022E46F8 ; =SsbLoad2
	mov r2, #0
	str r2, [r0]
	bx ip
	.align 2, 0
_022E46F8: .word SsbLoad2
	arm_func_end ov11_022E46E8

	arm_func_start SsbLoad2
SsbLoad2: ; 0x022E46FC
#ifdef EUROPE
#define SSB_LOAD_2_STACK_OFFSET 8
#else
#define SSB_LOAD_2_STACK_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54 + SSB_LOAD_2_STACK_OFFSET
	mov r4, r1
	mov r5, r0
	ldr r1, _022E48A4 ; =ov11_02319694
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	bl FileRom_InitDataTransfer
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	bl FileRom_Veneer_FileInit
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, sp, #0
#ifdef EUROPE
	mov r2, #0x12
#else
	mov r2, #0xc
#endif
	bl FileRom_HandleRead
	ldrh r3, [sp, #4]
	ldrh r2, [sp, #6]
	ldr r0, _022E48A8 ; =ov11_02324F70
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
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldrh r0, [sp]
	cmp r0, #0
	beq _022E47D4
	ldrh r1, [sp, #4]
	ldrh r0, [sp, #2]
	ldrh r2, [sp, #6]
	ldr r3, [r5]
	add r1, r1, r0
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E47D4:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022E488C
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldr r0, _022E48A8 ; =ov11_02324F70
	mov r3, #0
	add r1, r2, r1
#ifdef EUROPE
	add r2, r1, #9
#else
	add r2, r1, #6
#endif
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
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	mov r2, #0
	bl FileRom_HandleSeek
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	ldr r3, [r5]
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldr r0, _022E48A8 ; =ov11_02324F70
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
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	add r1, r5, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E488C:
	add r0, sp, #0xc + SSB_LOAD_2_STACK_OFFSET
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x54 + SSB_LOAD_2_STACK_OFFSET
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E48A4: .word ov11_02319694
_022E48A8: .word ov11_02324F70
	arm_func_end SsbLoad2

	arm_func_start ScriptParamToInt
ScriptParamToInt: ; 0x022E48AC
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
	arm_func_end ScriptParamToInt

	arm_func_start ScriptParamToFixedPoint16
ScriptParamToFixedPoint16: ; 0x022E48E0
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
	arm_func_end ScriptParamToFixedPoint16

	arm_func_start ov11_022E490C
ov11_022E490C: ; 0x022E490C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrh r0, [r7]
	mov r4, r1
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [r7, #2]
	bl ScriptParamToInt
	mov r6, r0
	tst r5, #4
	bne _022E4958
	ldrh r0, [r7, #4]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToInt
	mov r5, r0
	ldrh r0, [sl, #2]
	bl ScriptParamToInt
	mov r6, r0
	ldrh r0, [sl, #8]
	bl ScriptParamToFixedPoint16
	mov r4, r0
	ldrh r0, [sl, #0xa]
	bl ScriptParamToFixedPoint16
	mov fp, r0
	tst r5, #4
	bne _022E49F4
	ldrh r0, [sl, #4]
	bl ScriptParamToFixedPoint16
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
	bl ScriptParamToFixedPoint16
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
	ldr r1, _022E4AF8 ; =ov11_02324F74
	ldr r2, _022E4AFC ; =ov11_02324C6C
	strb r0, [r1, #1]
	mov r0, #0x1000
	mov r1, #6
	str r0, [r2, #0x2c]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #0x28]
	mov r0, #0x1000
	str r0, [r2, #0x24]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #0x20]
	mov r0, #0x1000
	str r0, [r2, #4]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2]
	mov r0, #0x2000
	str r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #8]
	mov r0, #0x2000
	str r0, [r2, #0x14]
	bl MemAlloc
	ldr r2, _022E4AFC ; =ov11_02324C6C
	mov r1, #6
	str r0, [r2, #0x10]
	mov r0, #0x8000
	str r0, [r2, #0x1c]
	bl MemAlloc
	ldr r1, _022E4AFC ; =ov11_02324C6C
	str r0, [r1, #0x18]
	bl ov11_022E4B88
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4AF8: .word ov11_02324F74
_022E4AFC: .word ov11_02324C6C
	arm_func_end ov11_022E4A4C

	arm_func_start ov11_022E4B00
ov11_022E4B00: ; 0x022E4B00
	stmdb sp!, {r3, lr}
	ldr r0, _022E4B84 ; =ov11_02324C6C
	ldr r0, [r0, #0x28]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x28]
	ldr r0, [r0, #0x20]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x20]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0]
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #8]
	ldr r0, [r0, #0x10]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r0, [r0, #0x18]
	bl MemFree
	ldr r0, _022E4B84 ; =ov11_02324C6C
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4B84: .word ov11_02324C6C
	arm_func_end ov11_022E4B00

	arm_func_start ov11_022E4B88
ov11_022E4B88: ; 0x022E4B88
	stmdb sp!, {r3, lr}
	ldr r1, _022E4BC8 ; =ov11_02324F74
	mvn r2, #0
	strh r2, [r1, #6]
	strh r2, [r1, #0xa]
	strh r2, [r1, #8]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	mov r0, #0
	strb r0, [r1]
	ldr r0, _022E4BCC ; =ov11_02324F82
	strh r2, [r1, #0xc]
	bl ov11_022E45F4
	ldr r0, _022E4BD0 ; =ov11_02324F8A
	bl ov11_022E45F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E4BC8: .word ov11_02324F74
_022E4BCC: .word ov11_02324F82
_022E4BD0: .word ov11_02324F8A
	arm_func_end ov11_022E4B88

	arm_func_start StationLoadHanger
StationLoadHanger: ; 0x022E4BD4
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
	ldr r1, _022E4CB8 ; =ov11_023196B0
	add r0, sp, #9
	add r3, sp, #0
	bl sprintf
	ldr r4, _022E4CBC ; =ov11_02324C8C
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
	ldr r1, _022E4CC0 ; =ov11_023196C4
	add r0, sp, #9
	add r3, sp, #0
	bl sprintf
	ldr r4, _022E4CC4 ; =ov11_02324C6C
	b _022E4C84
_022E4C54:
	mov r0, r4
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E4CC8 ; =ov11_023196D8
	add r0, sp, #9
	bl sprintf
	add r0, sp, #9
	bl sub_02008BA8
	cmp r0, #0
	movle r0, #0
	ble _022E4CB0
	ldr r4, _022E4CCC ; =ov11_02324C94
_022E4C84:
	ldr r1, _022E4CD0 ; =ov11_023196EC
	add r3, sp, #9
	mov r2, r5
	mov r0, #2
	bl Debug_Print
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
_022E4CB8: .word ov11_023196B0
_022E4CBC: .word ov11_02324C8C
_022E4CC0: .word ov11_023196C4
_022E4CC4: .word ov11_02324C6C
_022E4CC8: .word ov11_023196D8
_022E4CCC: .word ov11_02324C94
_022E4CD0: .word ov11_023196EC
	arm_func_end StationLoadHanger

	arm_func_start ov11_022E4CD4
ov11_022E4CD4: ; 0x022E4CD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	mov sb, r1
	mov sl, r0
	mov r8, r2
	ldr r1, _022E4FC4 ; =ov11_02319714
	mov r2, sl
	mov r3, sb
	mov r0, #2
	bl Debug_Print
	cmp sl, #2
	ldreq r0, _022E4FC8 ; =ov11_02324C6C
	ldreq r4, [r0, #0x20]
	beq _022E4D20
	cmp sl, #3
	ldreq r0, _022E4FC8 ; =ov11_02324C6C
	ldreq r4, [r0]
	ldrne r0, _022E4FC8 ; =ov11_02324C6C
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
_022E4FC4: .word ov11_02319714
_022E4FC8: .word ov11_02324C6C
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
	ldr r1, _022E512C ; =ov11_02319730
	add r0, sp, #0xd
	add r3, sp, #4
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
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
	ldr r1, _022E5134 ; =ov11_02319744
	add r0, sp, #0xd
	add r3, sp, #4
	str r4, [sp]
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
	b _022E511C
_022E5050:
	cmp r0, #4
	bne _022E507C
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5138 ; =ov11_0231975C
	add r0, sp, #0xd
	mov r3, r4
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
	b _022E511C
_022E507C:
	cmp r0, #6
	bne _022E50A8
	add r1, sp, #4
	mov r0, r3
	bl ov11_022E469C
	ldr r1, _022E513C ; =ov11_02319774
	add r0, sp, #0xd
	add r2, sp, #4
	bl sprintf
	ldr r0, _022E5130 ; =ov11_02324C84
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
	ldr r1, _022E5134 ; =ov11_02319744
	add r0, sp, #0xd
	add r3, sp, #4
	str ip, [sp]
	bl sprintf
	ldr r0, _022E5140 ; =ov11_02324C7C
	b _022E511C
_022E50E8:
	mov r0, r5
	bl sub_02064FFC
	mov r2, r0
	ldr r1, _022E5138 ; =ov11_0231975C
	add r0, sp, #0xd
	mov r3, #0
	bl sprintf
	add r0, sp, #0xd
	bl sub_02008BA8
	cmp r0, #0
	movle r0, #0
	ble _022E5124
	ldr r0, _022E5144 ; =ov11_02324C74
_022E511C:
	add r1, sp, #0xd
	bl SsbLoad1
_022E5124:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E512C: .word ov11_02319730
_022E5130: .word ov11_02324C84
_022E5134: .word ov11_02319744
_022E5138: .word ov11_0231975C
_022E513C: .word ov11_02319774
_022E5140: .word ov11_02324C7C
_022E5144: .word ov11_02324C74
	arm_func_end ov11_022E4FCC

	arm_func_start ov11_022E5148
ov11_022E5148: ; 0x022E5148
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E5180 ; =ov11_0231978C
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r0, _022E5184 ; =ov11_02324F74
	ldrsh r0, [r0, #6]
	cmp r0, r4
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov11_022DCB28
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5180: .word ov11_0231978C
_022E5184: .word ov11_02324F74
	arm_func_end ov11_022E5148

	arm_func_start ov11_022E5188
ov11_022E5188: ; 0x022E5188
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E51C8
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E524C ; =ov11_023197B4
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022E51C8:
	mov r0, r5
	bl ov11_022E5148
	cmp r0, #0
	movne r0, #1
	bne _022E5244
	ldr r0, _022E5250 ; =ov11_02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r5
	bne _022E5210
	cmp r5, #0
	movlt r0, #0
	blt _022E5244
	ldr r0, _022E5254 ; =ov11_02324F82
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
_022E524C: .word ov11_023197B4
_022E5250: .word ov11_02324F74
_022E5254: .word ov11_02324F82
	arm_func_end ov11_022E5188

	arm_func_start ov11_022E5258
ov11_022E5258: ; 0x022E5258
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5298
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5308 ; =ov11_023197D8
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022E5298:
	ldr r0, _022E530C ; =ov11_02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r5
	bne _022E52CC
	cmp r5, #0
	movlt r0, #0
	blt _022E5300
	ldr r0, _022E5310 ; =ov11_02324F82
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
_022E5308: .word ov11_023197D8
_022E530C: .word ov11_02324F74
_022E5310: .word ov11_02324F82
	arm_func_end ov11_022E5258

	arm_func_start ov11_022E5314
ov11_022E5314: ; 0x022E5314
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5354
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E53D8 ; =ov11_02319800
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022E5354:
	mov r0, r5
	bl ov11_022E5148
	cmp r0, #0
	movne r0, #1
	bne _022E53D0
	ldr r1, _022E53DC ; =ov11_02324F74
	mvn r0, #0
	ldrsh r2, [r1, #0xc]
	cmp r2, r0
	ldreqsh r0, [r1, #4]
	cmpeq r0, r5
	bne _022E53A8
	cmp r5, #0
	movlt r0, #0
	blt _022E53D0
	ldr r0, _022E53E0 ; =ov11_02324F8A
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
_022E53D8: .word ov11_02319800
_022E53DC: .word ov11_02324F74
_022E53E0: .word ov11_02324F8A
	arm_func_end ov11_022E5314

	arm_func_start ScriptStationLoadTalk
ScriptStationLoadTalk: ; 0x022E53E4
	stmdb sp!, {r3, lr}
	ldr r1, _022E5444 ; =ov11_02319828
	mov r2, r0
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E5448 ; =ov11_02324F74
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
_022E5444: .word ov11_02319828
_022E5448: .word ov11_02324F74
	arm_func_end ScriptStationLoadTalk

	arm_func_start ov11_022E544C
ov11_022E544C: ; 0x022E544C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, _022E550C ; =ov11_0231984C
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E5510 ; =ov11_02324F74
	ldrsh r0, [r1, #6]
	cmp r0, r4
	moveq r0, #0
	beq _022E5504
	mvn r2, #0
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #2]
	ldr r0, _022E5514 ; =ov11_02324F82
	strh r2, [r1, #4]
	bl ov11_022E45F4
	ldr r0, _022E5518 ; =ov11_02324F8A
	bl ov11_022E45F4
	cmp r4, #0
	ldrlt r0, _022E5510 ; =ov11_02324F74
	mvnlt r1, #0
	strlth r1, [r0, #6]
	blt _022E5500
	ldr r0, _022E5510 ; =ov11_02324F74
	strh r4, [r0, #6]
	bl ov11_022E5A68
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl StationLoadHanger
	cmp r0, #0
	ldrne r0, _022E5510 ; =ov11_02324F74
	mov r3, #0
	strneh r4, [r0, #8]
	mov r0, #1
	mov r1, r4
	sub r2, r0, #2
	str r3, [sp]
	bl ov11_022E4FCC
	cmp r0, #0
	ldrne r0, _022E5510 ; =ov11_02324F74
	strneh r4, [r0, #0xa]
_022E5500:
	mov r0, #1
_022E5504:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E550C: .word ov11_0231984C
_022E5510: .word ov11_02324F74
_022E5514: .word ov11_02324F82
_022E5518: .word ov11_02324F8A
	arm_func_end ov11_022E544C

	arm_func_start ov11_022E551C
ov11_022E551C: ; 0x022E551C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r0, #2
	mov r5, r1
	mov r4, r2
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5564
	add r1, sp, #4
	mov r0, r5
	bl ov11_022E466C
	ldr r1, _022E56AC ; =ov11_0231986C
	add r3, sp, #4
	mov r2, r6
	mov r0, #2
	str r4, [sp]
	bl Debug_Print
_022E5564:
	ldr r0, _022E56B0 ; =ov11_02324F74
	ldrsh r0, [r0, #6]
	cmp r0, r6
	beq _022E557C
	mov r0, r6
	bl ov11_022E544C
_022E557C:
	ldr r0, _022E56B0 ; =ov11_02324F74
	ldrsh r0, [r0, #2]
	cmp r0, r6
	bne _022E55B0
	cmp r6, #0
	movlt r0, #0
	blt _022E56A4
	ldr r0, _022E56B4 ; =ov11_02324F82
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
	ldr r1, _022E56B0 ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E56B4 ; =ov11_02324F82
	strh r2, [r1, #2]
	bl ov11_022E45F4
	ldr r0, _022E56B0 ; =ov11_02324F74
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E56A4
_022E5610:
	mov r1, r6
	mov r2, r5
	mov r0, #2
	bl StationLoadHanger
	cmp r0, #0
	beq _022E5684
	ldr r0, _022E56B0 ; =ov11_02324F74
	ldr r2, _022E56B4 ; =ov11_02324F82
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
	ldrne r0, _022E56B0 ; =ov11_02324F74
	movne r1, #1
	ldreq r0, _022E56B0 ; =ov11_02324F74
	moveq r1, #0
	strb r1, [r0]
	mov r0, #1
	b _022E56A4
_022E5684:
	ldr r1, _022E56B0 ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E56B4 ; =ov11_02324F82
	strh r2, [r1, #2]
	bl ov11_022E45F4
	ldr r1, _022E56B0 ; =ov11_02324F74
	mov r0, #0
	strb r0, [r1]
_022E56A4:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E56AC: .word ov11_0231986C
_022E56B0: .word ov11_02324F74
_022E56B4: .word ov11_02324F82
	arm_func_end ov11_022E551C

	arm_func_start ov11_022E56B8
ov11_022E56B8: ; 0x022E56B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r5, r0
	mov r0, #2
	mov r4, r1
	mov r6, r2
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5700
	add r1, sp, #0xd
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5838 ; =ov11_02319888
	add r3, sp, #0xd
	mov r2, r5
	mov r0, #2
	str r6, [sp]
	bl Debug_Print
_022E5700:
	ldr r0, _022E583C ; =ov11_02324F74
	mvn r1, #0
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #6]
	cmp r0, r5
	beq _022E5720
	mov r0, r5
	bl ov11_022E544C
_022E5720:
	ldr r0, _022E583C ; =ov11_02324F74
	ldrsh r0, [r0, #4]
	cmp r0, r5
	bne _022E5754
	cmp r5, #0
	movlt r0, #0
	blt _022E5830
	ldr r0, _022E5840 ; =ov11_02324F8A
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
	ldr r1, _022E583C ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E5840 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r0, #1
	b _022E5830
_022E579C:
	mov r1, r5
	mov r2, r4
	mov r0, #3
	bl StationLoadHanger
	cmp r0, #0
	beq _022E5818
	ldr r0, _022E583C ; =ov11_02324F74
	ldr r2, _022E5840 ; =ov11_02324F8A
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
	ldr r1, _022E5844 ; =ov11_02319730
	add r0, sp, #0x16
	add r3, sp, #4
	bl sprintf
	ldr r0, _022E5848 ; =ov11_02324C84
	add r1, sp, #0x16
	bl SsbLoad1
	cmp r0, #0
	movne r0, #1
	bne _022E5830
_022E5818:
	ldr r1, _022E583C ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E5840 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r0, #0
_022E5830:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E5838: .word ov11_02319888
_022E583C: .word ov11_02324F74
_022E5840: .word ov11_02324F8A
_022E5844: .word ov11_02319730
_022E5848: .word ov11_02324C84
	arm_func_end ov11_022E56B8

	arm_func_start ov11_022E584C
ov11_022E584C: ; 0x022E584C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #2
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022E5884
	add r1, sp, #4
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022E5900 ; =ov11_023198AC
	add r2, sp, #4
	mov r0, #2
	bl Debug_Print
_022E5884:
	ldr r1, _022E5904 ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E5908 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	mov r2, #0
	ldr r0, _022E5904 ; =ov11_02324F74
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
	ldrne r0, _022E5904 ; =ov11_02324F74
	movne r1, #6
	ldreq r0, _022E5904 ; =ov11_02324F74
	mvneq r1, #0
	strh r1, [r0, #0xc]
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5900: .word ov11_023198AC
_022E5904: .word ov11_02324F74
_022E5908: .word ov11_02324F8A
	arm_func_end ov11_022E584C

	arm_func_start ov11_022E590C
ov11_022E590C: ; 0x022E590C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	ldr r1, _022E59D8 ; =ov11_023198D0
	mov r2, r4
	mov r3, r5
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E59DC ; =ov11_02324F74
	mvn r2, #0
	ldr r0, _022E59E0 ; =ov11_02324F8A
	strh r2, [r1, #4]
	bl ov11_022E45F4
	cmp r4, #2
	bne _022E5970
	ldr r0, _022E59DC ; =ov11_02324F74
	mov r1, #0
	str r1, [sp]
	ldrsh r1, [r0, #2]
	mov r4, #5
	ldr r3, _022E59E4 ; =ov11_02324F82
	mov r0, r4
	mov r2, r5
	bl ov11_022E4FCC
	b _022E5990
_022E5970:
	mov r3, #0
	ldr r0, _022E59DC ; =ov11_02324F74
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
	ldrne r0, _022E59DC ; =ov11_02324F74
	mvneq r1, #0
	strneh r4, [r0, #0xc]
	ldreq r0, _022E59DC ; =ov11_02324F74
	streqh r1, [r0, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022E59D8: .word ov11_023198D0
_022E59DC: .word ov11_02324F74
_022E59E0: .word ov11_02324F8A
_022E59E4: .word ov11_02324F82
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
	ldr r1, _022E5A94 ; =ov11_023198F0
	mov r0, #2
	bl Debug_Print
	mov r0, #0
	bl ov11_022EAFF8
	bl ov11_022FEA28
	bl InitPartnerFollowDataAndLiveActorList
	bl ov11_022FBE04
	bl ov11_022FD66C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E5A94: .word ov11_023198F0
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
	ldr r2, _022E5C80 ; =ov11_02324F74
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
	ldr r1, _022E5C80 ; =ov11_02324F74
	mov r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022F8C18
	ldr r1, _022E5C80 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FC8C4
	ldr r1, _022E5C80 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
_022E5C78:
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5C80: .word ov11_02324F74
	arm_func_end ov11_022E5BF4

	arm_func_start ov11_022E5C84
ov11_022E5C84: ; 0x022E5C84
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	mov r1, #0
	str r1, [sp]
	ldr r0, _022E5D10 ; =ov11_02324F74
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
	ldr r1, _022E5D10 ; =ov11_02324F74
	mov r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022F8C18
	ldr r1, _022E5D10 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FC8C4
	ldr r1, _022E5D10 ; =ov11_02324F74
	orr r4, r4, r0
	ldrsh r0, [r1, #0xc]
	mvn r1, #1
	bl ov11_022FDFD4
	orr r0, r4, r0
_022E5D08:
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E5D10: .word ov11_02324F74
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

	arm_func_start SsbLoad1
SsbLoad1: ; 0x022E5D50
#ifdef EUROPE
#define SSB_LOAD_1_STACK_OFFSET 8
#else
#define SSB_LOAD_1_STACK_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54 + SSB_LOAD_1_STACK_OFFSET
	mov r5, r1
	mov r4, r0
	ldr r1, _022E5EF4 ; =ov11_02319908
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	bl FileRom_InitDataTransfer
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	bl FileRom_Veneer_FileInit
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	mov r1, r5
	bl FileRom_HandleOpen
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, sp, #0
#ifdef EUROPE
	mov r2, #0x12
#else
	mov r2, #0xc
#endif
	bl FileRom_HandleRead
	ldrh r3, [sp, #4]
	ldrh r2, [sp, #6]
	ldr r0, _022E5EF8 ; =ov11_02324F74
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
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldrh r0, [sp]
	cmp r0, #0
	beq _022E5E24
	ldrh r1, [sp, #4]
	ldrh r0, [sp, #2]
	ldrh r2, [sp, #6]
	ldr r3, [r4]
	add r1, r1, r0
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E5E24:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _022E5EDC
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldr r0, _022E5EF8 ; =ov11_02324F74
	mov r3, #0
	add r1, r2, r1
#ifdef EUROPE
	add r2, r1, #9
#else
	add r2, r1, #6
#endif
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
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	mov r2, #0
	bl FileRom_HandleSeek
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	ldr r3, [r4]
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, r3, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
	ldr r0, _022E5EF8 ; =ov11_02324F74
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
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	add r1, r4, r1, lsl #1
	mov r2, r2, lsl #1
	bl FileRom_HandleRead
_022E5EDC:
	add r0, sp, #0xc + SSB_LOAD_1_STACK_OFFSET
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, #1
	add sp, sp, #0x54 + SSB_LOAD_1_STACK_OFFSET
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022E5EF4: .word ov11_02319908
_022E5EF8: .word ov11_02324F74
	arm_func_end SsbLoad1

	arm_func_start ov11_022E5EFC
ov11_022E5EFC: ; 0x022E5EFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r7, r3
	mov sl, r0
	cmp r7, #3
	ldreq r0, _022E608C ; =ov11_02324C6C
	mov sb, r1
	mov r8, r2
	mov r6, #0
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #5
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #4
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #6
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x18]
	beq _022E5F90
	cmp r7, #2
	ldreq r0, _022E608C ; =ov11_02324C6C
	ldreq r4, [r0, #0x10]
	beq _022E5F90
	ldr r2, _022E6090 ; =ov11_02324F74
	sub r1, r6, #1
	ldrsh r2, [r2, #0xa]
	cmp r2, r1
	bne _022E5F88
	bl ov11_022DC89C
	mov r0, r6
	b _022E6084
_022E5F88:
	ldr r0, _022E608C ; =ov11_02324C6C
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
_022E608C: .word ov11_02324C6C
_022E6090: .word ov11_02324F74
	arm_func_end ov11_022E5EFC

	arm_func_start ov11_022E6094
ov11_022E6094: ; 0x022E6094
	ldr r0, _022E60A4 ; =ov11_02324C9C
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E60A4: .word ov11_02324C9C
	arm_func_end ov11_022E6094

	arm_func_start ov11_022E60A8
ov11_022E60A8: ; 0x022E60A8
	ldr r0, _022E60B8 ; =ov11_02324C9C
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_022E60B8: .word ov11_02324C9C
	arm_func_end ov11_022E60A8

	arm_func_start ov11_022E60BC
ov11_022E60BC: ; 0x022E60BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x144
	mov r5, r0
	mov r4, r1
	ldr r1, _022E68C4 ; =ov11_02319924
	mov r2, r5
	mov r0, #2
	bl Debug_Print
	ldr r1, _022E68C8 ; =ov11_02324C9C
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
	bl ov28_0238A140
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
	bl SetupAndShowKeyboard
	b _022E68AC
_022E6260:
	mov r1, #0
	mov r2, r1
	mov r0, #3
	bl SetupAndShowKeyboard
	b _022E68AC
_022E6274:
	add r0, sp, #0xc0
	mov r1, #0xa
	bl sub_02065BD8
	add r1, sp, #0xc0
	mov r0, #2
	mov r2, r1
	bl SetupAndShowKeyboard
	b _022E68AC
_022E6294:
	bl ov11_02310BDC
#ifdef JAPAN
	mov r1, #0x400
#endif
	mov r4, #0
	ldr r3, _022E68CC ; =0x0000C402
	add r0, sp, #0x60
#ifdef JAPAN
	add r2, r1, #0xc5
#else
	mov r1, #0x400
	mov r2, #0x234
#endif
	str r4, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0xa0
	add r1, sp, #0x60
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	add r1, sp, #0xa0
	mov r0, #1
	mov r2, r1
	bl SetupAndShowKeyboard
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
	ldr r0, _022E68D0 ; =ov11_02324F94
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
	ldr r0, _022E68D0 ; =ov11_02324F94
	adds r1, r2, r1
	str r1, [r0]
	moveq r1, #3
	streq r1, [r0]
	ldr r1, _022E68D0 ; =ov11_02324F94
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
	ldr r0, _022E68D4 ; =ov11_0231993C
	bl Debug_Print0
	mov r8, #0
	ldr r0, [sp, #0x3c]
	add sb, sp, #0x34
	mov r7, #0x68
	mov r6, r8
	mov r5, #0x69
	ldr fp, _022E68D8 ; =ov11_02319960
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
	bl Debug_Print0
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
	ldr r1, _022E68D0 ; =ov11_02324F94
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
	ldr r0, _022E68D0 ; =ov11_02324F94
	mvn r1, #0
	str r1, [r0]
	ldr r0, _022E68DC ; =ov11_023199B4
	str r1, [r4]
	bl Debug_Print0
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
	ldr r0, _022E68E0 ; =ov11_023199D4
	str r1, [sp]
	ldrb r2, [sp, #0x24]
	ldrsh r3, [sp, #0x26]
	ldr r1, [sp, #0x2c]
	bl Debug_Print0
	ldrb r0, [sp, #0x24]
	cmp r0, #0
	beq _022E66F8
	bl ov11_0230CDCC
	ldr r0, _022E68C8 ; =ov11_02324C9C
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
	bl ov28_0238A468
	b _022E68AC
_022E67B8:
	mov r0, #0x20
	bl UnloadOverlay
	ldr r1, _022E68D0 ; =ov11_02324F94
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
	bl GetRank
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
	bl ScriptSpecialProcess0x16
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
	ldr r0, _022E68C8 ; =ov11_02324C9C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
_022E68BC:
	add sp, sp, #0x144
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E68C4: .word ov11_02319924
_022E68C8: .word ov11_02324C9C
_022E68CC: .word 0x0000C402
_022E68D0: .word ov11_02324F94
_022E68D4: .word ov11_0231993C
_022E68D8: .word ov11_02319960
_022E68DC: .word ov11_023199B4
_022E68E0: .word ov11_023199D4
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
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r1, _022E6E64 ; =ov11_02324F94
	mov r0, #1
	ldr r1, [r1]
	str r1, [r6]
	b _022E6E58
_022E6A50:
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	mov r0, #0x12
	bl UnloadOverlay
	ldr r1, _022E6E64 ; =ov11_02324F94
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
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =ov11_02324F94
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
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =ov11_02324F94
	ldr r0, [r0]
	cmp r0, #0
	blt _022E6CFC
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205B77C
	ldr r1, _022E6E64 ; =ov11_02324F94
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
	ldr r0, _022E6E64 ; =ov11_02324F94
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
	ldr r0, _022E6E64 ; =ov11_02324F94
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
	ldr r0, _022E6E60 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _022E6E54
	ldr r0, _022E6E64 ; =ov11_02324F94
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
	ldr r1, _022E6E60 ; =ov11_02324C9C
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
	ldr r1, _022E6E60 ; =ov11_02324C9C
	mov r0, #1
	strb r0, [r1]
	b _022E6E58
_022E6E54:
	mov r0, #0
_022E6E58:
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E6E60: .word ov11_02324C9C
_022E6E64: .word ov11_02324F94
	arm_func_end ov11_022E68E4

	arm_func_start ov11_022E6E68
ov11_022E6E68: ; 0x022E6E68
	ldr r1, _022E6E84 ; =ov11_02324C9C
	mov r3, #1
	ldr r0, _022E6E88 ; =ov11_02324F94
	mov r2, #0
	strb r3, [r1]
	str r2, [r0]
	bx lr
	.align 2, 0
_022E6E84: .word ov11_02324C9C
_022E6E88: .word ov11_02324F94
	arm_func_end ov11_022E6E68

	arm_func_start ov11_022E6E8C
ov11_022E6E8C: ; 0x022E6E8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E6EBC ; =ov11_02319A20
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r0, _022E6EC0 ; =ov11_02324F94
	ldr r1, _022E6EC4 ; =ov11_02324C9C
	mov r2, #1
	strb r2, [r1]
	str r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E6EBC: .word ov11_02319A20
_022E6EC0: .word ov11_02324F94
_022E6EC4: .word ov11_02324C9C
	arm_func_end ov11_022E6E8C

	arm_func_start ov11_022E6EC8
ov11_022E6EC8: ; 0x022E6EC8
	ldr r0, _022E6EE4 ; =ov11_02324C9C
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E6EE4: .word ov11_02324C9C
	arm_func_end ov11_022E6EC8

	arm_func_start ov11_022E6EE8
ov11_022E6EE8: ; 0x022E6EE8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x98
	mov r5, r0
	bl GetGameMode
	cmp r5, #0
	ldreq r5, _022E6FB4 ; =ov11_022E6FB8
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
_022E6FB4: .word ov11_022E6FB8
	arm_func_end ov11_022E6EE8

	arm_func_start ov11_022E6FB8
ov11_022E6FB8: ; 0x022E6FB8
	ldr r0, _022E6FD0 ; =ov11_02324F94
	ldr r2, _022E6FD4 ; =ov11_02324C9C
	mov r3, #1
	strb r3, [r2]
	str r1, [r0]
	bx lr
	.align 2, 0
_022E6FD0: .word ov11_02324F94
_022E6FD4: .word ov11_02324C9C
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
#ifdef JAPAN
	ldr r1, _022E872C ; =0x000004F2
#else
	mov r1, #0x258
#endif
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
	bl PreprocessStringFromId
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
	bl PreprocessStringFromId
	b _022E70F8
_022E7088:
	add r0, sp, #0x54
	bl InitPreprocessorArgs
	mov r0, #0xab
	bl CountNbItemsOfTypeInBag
	str r0, [sp, #0x78]
	add ip, sp, #0x54
#ifdef JAPAN
	ldr r2, _022E873C ; =0x000004F6
	mov r0, r4
	mov r1, #0x40
#else
	mov r0, r4
	mov r1, #0x40
	mov r2, #0x25c
#endif
	mov r3, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
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
	bl PreprocessStringFromId
	b _022E70F8
_022E70F0:
	mov r0, #0
	strb r0, [r4]
_022E70F8:
	add sp, sp, #0x144
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_022E872C: .word 0x000004F2
_022E7100: .word 0x000004F3
_022E7104: .word 0x000004F4
_022E7108: .word 0x000004F5
_022E873C: .word 0x000004F6
_022E710C: .word 0x000004F7
#else
_022E7100: .word 0x00000259
_022E7104: .word 0x0000025A
_022E7108: .word 0x0000025B
_022E710C: .word 0x0000025D
#endif
	arm_func_end ov11_022E6FD8

	arm_func_start ov11_022E7110
ov11_022E7110: ; 0x022E7110
	bx lr
	arm_func_end ov11_022E7110

	arm_func_start ov11_022E7114
ov11_022E7114: ; 0x022E7114
	bx lr
	arm_func_end ov11_022E7114

	arm_func_start ScriptSpecialProcessCall
ScriptSpecialProcessCall: ; 0x022E7118
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1b8
	mov r5, r1
	mov r4, r0
	mov r7, r2
	ldr r1, _022E7AC8 ; =ov11_02319A48
	mov r2, r5
	mov r0, #2
	mov r6, r3
	bl Debug_Print
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
	bl GroundMainReturnDungeon
	mov r0, #0
	b _022E7AC0
_022E7254:
	bl InitMainTeamAfterQuiz
	mov r0, #0
	b _022E7AC0
_022E7260:
	bl InitSpecialEpisodePartners
	mov r0, #0
	b _022E7AC0
_022E726C:
	bl InitSpecialEpisodeExtraPartner
	mov r0, #0
	b _022E7AC0
_022E7278:
	bl GroundMainNextDay
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
	ldr r0, _022E7ACC ; =ov11_02319A68
	mov r2, r4
	bl Debug_Print0
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
	bl InitRandomNpcJobs
	mov r0, #0
	b _022E7AC0
_022E73D8:
	bl GetRandomNpcJobType
	b _022E7AC0
_022E73E0:
	bl GetRandomNpcJobSubtype
	and r1, r0, #0xff
	strb r0, [sp]
	mov r0, r1
	strb r1, [sp, #1]
	b _022E7AC0
_022E73F8:
	bl GetRandomNpcJobStillAvailable
	b _022E7AC0
_022E7400:
	bl AcceptRandomNpcJob
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
	ldr r0, _022E7AD0 ; =ov11_02319A38
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
	bl ScriptSpecialProcess0x16
	mov r0, #0
	b _022E7AC0
_022E7534:
	bl KeyWaitInit
	ldr r1, _022E7AD4 ; =ov11_02324CA0
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
	ldr r0, _022E7AD4 ; =ov11_02324CA0
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
	bl RandomizeDemoActors
	mov r0, #0
	b _022E7AC0
_022E75DC:
	mov r0, r7
	bl JumpToTitleScreen
	mov r0, #0
	b _022E7AC0
_022E75EC:
	mvn r0, #0
	bl JumpToTitleScreen
	mov r0, #0
	b _022E7AC0
_022E75FC:
	mov r0, r7
	bl ReturnToTitleScreen
	mov r0, #0
	b _022E7AC0
_022E760C:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpecialRecruitmentSpecies
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7630:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpecialRecruitmentSpecies
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
	bl GetSpecialRecruitmentSpecies
	bl sub_02056EB8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7680:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl PrepareMenuAcceptTeamMember
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
	bl AddBulkItemToStorage
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
	bl AddBulkItemToStorage
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
	bl RemoveBulkItemInStorage
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
	bl RemoveBulkItemInStorage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _022E7AC0
_022E7898:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl PrepareMenuAcceptTeamMember
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
	bl StatusUpdate
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
	bl IsStorageFull
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
	bl SetActorTalkMain
	mov r0, #0
	b _022E7AC0
_022E7AA8:
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetActorTalkSub
	mov r0, #0
	b _022E7AC0
_022E7ABC:
	mov r0, #0
_022E7AC0:
	add sp, sp, #0x1b8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E7AC8: .word ov11_02319A48
_022E7ACC: .word ov11_02319A68
_022E7AD0: .word ov11_02319A38
_022E7AD4: .word ov11_02324CA0
_022E7AD8: .word 0x00000F0F
	arm_func_end ScriptSpecialProcessCall

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
	bl GetLiveActorIdxFromScriptEntityId
	mov r4, r0
	mov r0, #0x2f
	bl GetLiveActorIdxFromScriptEntityId
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
	ldr r1, _022E7E80 ; =ov11_02319A90
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
_022E7E80: .word ov11_02319A90
	arm_func_end ov11_022E7B70

	arm_func_start ov11_022E7E84
ov11_022E7E84: ; 0x022E7E84
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022E7F24 ; =ov11_02319A98
	mov r2, r4
	mov r0, #2
	bl Debug_Print
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
_022E7F24: .word ov11_02319A98
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
	ldr r1, _022E7F74 ; =ov11_02319AB4
	add r0, sp, #0
	bl ov11_022E46E8
	ldr r1, [sp, #4]
	ldr r0, _022E7F78 ; =ov11_02319AD0
	bl Debug_Print0
	ldr r2, [sp]
	ldr r0, _022E7F7C ; =UNIONALL_RAM_ADDRESS
	str r2, [r0]
	ldrh r1, [r2]
	add r1, r2, r1, lsl #1
	str r1, [r0, #4]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7F74: .word ov11_02319AB4
_022E7F78: .word ov11_02319AD0
_022E7F7C: .word UNIONALL_RAM_ADDRESS
	arm_func_end ov11_022E7F34

	arm_func_start ov11_022E7F80
ov11_022E7F80: ; 0x022E7F80
	stmdb sp!, {r3, lr}
	ldr r0, _022E7FA4 ; =UNIONALL_RAM_ADDRESS
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E7FA4 ; =UNIONALL_RAM_ADDRESS
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E7FA4: .word UNIONALL_RAM_ADDRESS
	arm_func_end ov11_022E7F80

	arm_func_start ov11_022E7FA8
ov11_022E7FA8: ; 0x022E7FA8
	ldr r1, _022E7FB4 ; =C_ROUTINES
	add r0, r1, r0, lsl #3
	bx lr
	.align 2, 0
_022E7FB4: .word C_ROUTINES
	arm_func_end ov11_022E7FA8

	arm_func_start GetCoroutineInfo
GetCoroutineInfo: ; 0x022E7FB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl ov11_022DC89C
	ldr r0, _022E8020 ; =UNIONALL_RAM_ADDRESS
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
_022E8020: .word UNIONALL_RAM_ADDRESS
	arm_func_end GetCoroutineInfo

	arm_func_start ov11_022E8024
ov11_022E8024: ; 0x022E8024
	ldr r0, _022E8034 ; =ov11_02324F98
	mvn r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_022E8034: .word ov11_02324F98
	arm_func_end ov11_022E8024

	arm_func_start ov11_022E8038
ov11_022E8038: ; 0x022E8038
	bx lr
	arm_func_end ov11_022E8038

	arm_func_start GetSpecialRecruitmentSpecies
GetSpecialRecruitmentSpecies: ; 0x022E803C
	ldr r1, _022E804C ; =RECRUITMENT_TABLE_SPECIES
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_022E804C: .word RECRUITMENT_TABLE_SPECIES
	arm_func_end GetSpecialRecruitmentSpecies

	arm_func_start ov11_022E8050
ov11_022E8050: ; 0x022E8050
	ldr r1, _022E807C ; =ov11_02320904
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
_022E807C: .word ov11_02320904
	arm_func_end ov11_022E8050

	arm_func_start PrepareMenuAcceptTeamMember
PrepareMenuAcceptTeamMember: ; 0x022E8080
	ldr r1, _022E808C ; =ov11_02324F98
	strh r0, [r1]
	bx lr
	.align 2, 0
_022E808C: .word ov11_02324F98
	arm_func_end PrepareMenuAcceptTeamMember

	arm_func_start ov11_022E8090
ov11_022E8090: ; 0x022E8090
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r1, #1
	strb r1, [r4]
	ldr r0, _022E810C ; =ov11_02324F98
	ldr r1, _022E8110 ; =RECRUITMENT_TABLE_SPECIES
	ldrsh r2, [r0]
	add r0, sp, #0
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	strh r1, [r4, #4]
	bl GetNameRaw
	add r1, sp, #0
	add r0, r4, #0x3a
	mov r2, #0xa
	bl StrncpyName
	mov r0, r4
	bl SetBaseStatsMovesGroundMonster
	ldr r0, _022E810C ; =ov11_02324F98
	ldr r2, _022E8114 ; =RECRUITMENT_TABLE_LEVELS
	ldrsh r3, [r0]
	ldr r1, _022E8118 ; =RECRUITMENT_TABLE_LOCATIONS
	mov r3, r3, lsl #1
	ldrsh r2, [r2, r3]
	strb r2, [r4, #1]
	ldrsh r0, [r0]
	ldrb r0, [r1, r0]
	strb r0, [r4, #2]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E810C: .word ov11_02324F98
_022E8110: .word RECRUITMENT_TABLE_SPECIES
_022E8114: .word RECRUITMENT_TABLE_LEVELS
_022E8118: .word RECRUITMENT_TABLE_LOCATIONS
	arm_func_end ov11_022E8090

	arm_func_start ov11_022E811C
ov11_022E811C: ; 0x022E811C
	bx lr
	arm_func_end ov11_022E811C

	arm_func_start ov11_022E8120
ov11_022E8120: ; 0x022E8120
	bx lr
	arm_func_end ov11_022E8120

	arm_func_start InitRandomNpcJobs
InitRandomNpcJobs: ; 0x022E8124
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _022E8164 ; =ov11_02324F9C
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
_022E8164: .word ov11_02324F9C
	arm_func_end InitRandomNpcJobs

	arm_func_start ov11_022E8168
ov11_022E8168: ; 0x022E8168
	stmdb sp!, {r3, lr}
	ldr r0, _022E81B8 ; =ov11_02324F9C
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
_022E81B8: .word ov11_02324F9C
	arm_func_end ov11_022E8168

	arm_func_start GetRandomNpcJobType
GetRandomNpcJobType: ; 0x022E81BC
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	cmp r0, #0
	ldrneb r0, [r0, #1]
	moveq r0, #0xd
	ldmia sp!, {r3, pc}
	arm_func_end GetRandomNpcJobType

	arm_func_start GetRandomNpcJobSubtype
GetRandomNpcJobSubtype: ; 0x022E81D4
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	cmp r0, #0
	ldrnesb r0, [r0, #2]
	moveq r0, #0
	streqb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end GetRandomNpcJobSubtype

	arm_func_start GetRandomNpcJobStillAvailable
GetRandomNpcJobStillAvailable: ; 0x022E81F0
	stmdb sp!, {r3, lr}
	ldr r0, _022E8254 ; =ov11_02324F9C
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
_022E8254: .word ov11_02324F9C
	arm_func_end GetRandomNpcJobStillAvailable

; https://decomp.me/scratch/bAiXn
	arm_func_start AcceptRandomNpcJob
AcceptRandomNpcJob: ; 0x022E8258
	stmdb sp!, {r3, lr}
	bl ov11_022E8168
	bl AddMissionToJobList
	cmp r0, #0
	bne _022E82C0
	bl sub_0205F5A8
	bl sub_0205F710
	ldr r0, _022E82C8 ; =ov11_02324F9C
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
_022E82C8: .word ov11_02324F9C
	arm_func_end AcceptRandomNpcJob

	arm_func_start ov11_022E82CC
ov11_022E82CC: ; 0x022E82CC
	stmdb sp!, {r4, lr}
	cmp r0, #0
	movne r4, #0xd
	moveq r4, #0xc
	cmp r4, #0xc
	bne _022E82F0
	mov r0, #0x11
	bl GroundMainLoop
	mov r4, r0
_022E82F0:
	cmp r4, #0xc
	bne _022E832C
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	mov r0, #0x12
	bl GroundMainLoop
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
	bl GroundMainLoop
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022E82CC

	arm_func_start ov11_022E8340
ov11_022E8340: ; 0x022E8340
	stmdb sp!, {r3, lr}
	mov r0, #0x198
	mov r1, #8
	bl MemAlloc
	ldr r3, _022E83F0 ; =ov11_02324CAC
	mov r1, #0
	mov r2, #0x198
	str r0, [r3]
	bl MemsetSimple
	mvn ip, #0
	ldr r0, _022E83F0 ; =ov11_02324CAC
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
	bl InitPortraitParams
	ldr r0, _022E83F0 ; =ov11_02324CAC
	ldr r1, _022E83F4 ; =0x00000133
	ldr r0, [r0]
	add r0, r0, #8
	bl InitPortraitParamsWithMonsterId
	ldr r0, _022E83F0 ; =ov11_02324CAC
	mov r1, #0x12
	ldr r0, [r0]
	add r0, r0, #8
	bl SetPortraitLayout
	ldr r0, _022E83F0 ; =ov11_02324CAC
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
_022E83F0: .word ov11_02324CAC
_022E83F4: .word 0x00000133
	arm_func_end ov11_022E8340

	arm_func_start ov11_022E83F8
ov11_022E83F8: ; 0x022E83F8
	stmdb sp!, {r3, lr}
	ldr r0, _022E84A8 ; =ov11_02324CAC
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
	ldr r0, _022E84A8 ; =ov11_02324CAC
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
_022E84A8: .word ov11_02324CAC
	arm_func_end ov11_022E83F8

	arm_func_start ov11_022E84AC
ov11_022E84AC: ; 0x022E84AC
	stmdb sp!, {r3, lr}
	ldr r0, _022E84E0 ; =ov11_02324CAC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022E86E4
	ldr r0, _022E84E0 ; =ov11_02324CAC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022E84E0 ; =ov11_02324CAC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E84E0: .word ov11_02324CAC
	arm_func_end ov11_022E84AC

	arm_func_start ov11_022E84E4
ov11_022E84E4: ; 0x022E84E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _022E865C ; =ov11_02324CAC
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
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, _022E8660 ; =0x00003218
	ldr r3, [r0]
	ldr r2, _022E8664 ; =0x0000025F
	ldrsb r0, [r3, #4]
	add r3, r3, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #8
	bl ShowPortraitInPortraitBox
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
	ldr r0, _022E865C ; =ov11_02324CAC
	ldrsh r1, [sp]
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x178
	bl InitStandardItem
	bl sub_0206309C
	ldr r2, _022E865C ; =ov11_02324CAC
	mov r1, #0
	ldr r2, [r2]
	add r2, r2, #0x100
	strh r0, [r2, #0x7a]
	add r0, r4, #4
	bl sub_02062DC4
	ldr r3, _022E865C ; =ov11_02324CAC
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
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, _022E8660 ; =0x00003218
	ldr r3, [r0]
#ifdef JAPAN
	mov r2, #0x500
#else
	mov r2, #0x260
#endif
	ldrsb r0, [r3, #4]
	add r3, r3, #0x18
	bl ShowStringIdInDialogueBox
	ldr r0, _022E865C ; =ov11_02324CAC
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	add r1, r1, #8
	bl ShowPortraitInPortraitBox
_022E8654:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022E865C: .word ov11_02324CAC
_022E8660: .word 0x00003218
#ifdef JAPAN
_022E8664: .word 0x000004FF
#else
_022E8664: .word 0x0000025F
#endif
_022E8668: .word 0x00000133
	arm_func_end ov11_022E84E4

	arm_func_start ov11_022E866C
ov11_022E866C: ; 0x022E866C
	stmdb sp!, {r3, lr}
	ldr r1, _022E86A0 ; =ov11_02324CAC
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #4]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _022E86A0 ; =ov11_02324CAC
	ldr r1, [r1]
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86A0: .word ov11_02324CAC
	arm_func_end ov11_022E866C

	arm_func_start ov11_022E86A4
ov11_022E86A4: ; 0x022E86A4
	stmdb sp!, {r3, lr}
	ldr r1, _022E86E0 ; =ov11_02324CAC
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #5]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _022E86E0 ; =ov11_02324CAC
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E86E0: .word ov11_02324CAC
	arm_func_end ov11_022E86A4

	arm_func_start ov11_022E86E4
ov11_022E86E4: ; 0x022E86E4
	stmdb sp!, {r3, lr}
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _022E8714
	bl CloseDialogueBox
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_022E8714:
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ClosePortraitBox
	ldr r0, _022E8744 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8744: .word ov11_02324CAC
	arm_func_end ov11_022E86E4

	arm_func_start ov11_022E8748
ov11_022E8748: ; 0x022E8748
	stmdb sp!, {r3, lr}
	ldr r0, _022E8770 ; =ov11_02324CAC
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsDialogueBoxActive
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E8770: .word ov11_02324CAC
	arm_func_end ov11_022E8748

	arm_func_start GroundMainLoop
GroundMainLoop: ; 0x022E8774
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldr r2, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E91EC ; =ov11_023209B0
	mov r1, r4
	bl Debug_Print0
	bl sub_02028E2C
	mov r0, #0
	mov r1, #0xb0000
	mov r2, #0x20
	mov r3, #1
	bl MemArenaAlloc
	ldr r1, _022E91F0 ; =ov11_02324CB0
	ldr r2, _022E91F4 ; =GROUND_MEMORY_ARENA_1
	str r0, [r1, #8]
	mov r0, #0x64000
	str r0, [sp, #0xc]
	add r0, sp, #8
	mov r1, #0x34
	str r2, [sp, #8]
	bl CreateMemArena
	ldr r2, _022E91F0 ; =ov11_02324CB0
	ldr r1, _022E91F8 ; =GetFreeArenaGround
	str r0, [r2, #4]
	ldr r0, _022E91FC ; =GetAllocArenaGround
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r2, #1
	strb r2, [r0]
	mov r1, #0
	strb r1, [r0, #2]
	strb r2, [r0, #4]
	b _022E88B0
_022E885C:
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
	movne r2, #0
	strb r2, [r0, #2]
	strb r1, [r0, #4]
	b _022E88B0
_022E889C:
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	bl AllocAndInitPartnerFollowDataAndLiveActorList
	bl ov11_022FBDBC
	bl ov11_022FD624
	bl ov11_0230CE78
	bl ov11_0230CFF4
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r2, #1
	mov r0, #0
	str r2, [r1, #0x1c]
	str r0, [r1, #0x10]
	sub r2, r0, #1
	str r2, [r1, #0x18]
	mov r1, #0x1c
	bl LoadScriptVariableValue
	ldr r2, _022E91E8 ; =ov11_02324FA0
	mov r1, #0x1d
	strh r0, [r2, #8]
	mov r0, #0
	bl LoadScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mvn r2, #0
	str r0, [r1, #0xc]
	strh r2, [r1, #6]
	ldr r1, _022E91F0 ; =ov11_02324CB0
	mov r2, #1
	ldr r0, _022E9200 ; =ov11_022E9258
	strb r2, [r1]
	bl sub_0200383C
_022E8960:
	mvn r0, #0
	strh r0, [sp, #2]
	bl sub_020038E8
	bl ov11_022DC808
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	cmpne r0, #2
	beq _022E8990
	ldr r0, _022E9204 ; =ov11_023209CC
	bl Debug_Print0
	b _022E8FDC
_022E8990:
	bl sub_02034D0C
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E9208 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl GroundMainNextDay
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	str r1, [r0, #0x14]
	b _022E8CD4
_022E8A24:
	add r0, sp, #2
	bl sub_0206C0D8
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E920C ; =ov11_02320A08
	mov r1, r5
	mov r2, r4
	bl Debug_Print0
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
	ldr r0, _022E9208 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl GroundMainNextDay
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
	ldr r0, _022E9224 ; =ov11_02320A28
	mov r1, r4
	mov r2, r5
	bl Debug_Print0
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E9208 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl GroundMainNextDay
	ldr r1, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
	mov r1, #1
	ldr r0, [r0, #0x14]
	cmp r0, #0xc
	moveq r0, #0x46
	streqh r0, [sp, #2]
	movne r0, #0x47
	strneh r0, [sp, #2]
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022E8D78
	mov r0, #0
	mov r1, #0x1c
	bl LoadScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r4, r0
	ldr r2, [r1, #0x14]
	mov r0, #0
	mov r1, #0x2c
	bl SaveScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	ldr r0, _022E9234 ; =ov11_02320A44
	ldr r1, [r1, #0x14]
	bl Debug_Print0
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r0, #0
	ldrsh r2, [r1, #8]
	mov r1, #0x1c
	bl SaveScriptVariableValue
	ldr r1, _022E91E8 ; =ov11_02324FA0
	mov r0, #0
	ldr r2, [r1, #0xc]
	mov r1, #0x1d
	bl SaveScriptVariableValue
_022E8D78:
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	bl InitPartnerFollowDataAndLiveActorList
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
	ldr r5, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	bl InitPartnerFollowDataAndLiveActorList
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
	ldr r0, _022E91F0 ; =ov11_02324CB0
	ldr r0, [r0, #4]
	bl sub_020012D8
	ldr r0, _022E91F0 ; =ov11_02324CB0
	ldr r0, [r0, #8]
	bl sub_020012D8
	ldr r0, _022E91E8 ; =ov11_02324FA0
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
	ldr r0, _022E923C ; =ov11_02320A60
	bl Debug_Print0
	mov r0, #0xd
	b _022E91E0
_022E90C0:
	ldr r0, _022E9240 ; =ov11_02320A70
	bl Debug_Print0
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
	ldr r0, _022E9244 ; =ov11_02320A7C
	bl Debug_Print0
	mov r0, #4
	b _022E91E0
_022E914C:
	bl sub_0204E6FC
	mov r4, r0
	bl sub_0204E760
	mov r2, r0
	ldr r0, _022E9248 ; =ov11_02320A94
	mov r1, r4
	bl Debug_Print0
	mov r0, #5
	b _022E91E0
_022E9170:
	mov r0, #0
	mov r1, #0x2c
	mov r2, #1
	bl SaveScriptVariableValue
	ldr r0, _022E91E8 ; =ov11_02324FA0
	ldr r1, [r0, #0x1c]
	cmp r1, #5
	bne _022E91A0
	ldr r0, _022E924C ; =ov11_02320AAC
	bl Debug_Print0
	mov r0, #9
	b _022E91E0
_022E91A0:
	cmp r1, #7
	bne _022E91D4
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _022E91C4
	ldr r0, _022E924C ; =ov11_02320AAC
	bl Debug_Print0
	mov r0, #9
	b _022E91E0
_022E91C4:
	ldr r0, _022E9250 ; =ov11_02320AB8
	bl Debug_Print0
	mov r0, #0xb
	b _022E91E0
_022E91D4:
	ldr r0, _022E9254 ; =ov11_02320AC8
	bl Debug_Print0
	mov r0, #0xa
_022E91E0:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E91E8: .word ov11_02324FA0
_022E91EC: .word ov11_023209B0
_022E91F0: .word ov11_02324CB0
_022E91F4: .word GROUND_MEMORY_ARENA_1
_022E91F8: .word GetFreeArenaGround
_022E91FC: .word GetAllocArenaGround
_022E9200: .word ov11_022E9258
_022E9204: .word ov11_023209CC
_022E9208: .word ov11_023209EC
_022E920C: .word ov11_02320A08
_022E9210: .word 0x0000029D
_022E9214: .word 0x0000029E
_022E9218: .word 0x0000029F
_022E921C: .word 0x0000029B
_022E9220: .word 0x0000029A
_022E9224: .word ov11_02320A28
_022E9228: .word 0x000002A5
_022E922C: .word 0x000002A1
_022E9230: .word 0x000002A6
_022E9234: .word ov11_02320A44
_022E9238: .word 0x00000F0F
_022E923C: .word ov11_02320A60
_022E9240: .word ov11_02320A70
_022E9244: .word ov11_02320A7C
_022E9248: .word ov11_02320A94
_022E924C: .word ov11_02320AAC
_022E9250: .word ov11_02320AB8
_022E9254: .word ov11_02320AC8
	arm_func_end GroundMainLoop

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
	bl HandleUnlocks
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
	ldr r0, _022E9358 ; =ov11_02324CB0
	ldrb r0, [r0]
	cmp r0, #0
	bne _022E92E0
	bl sub_0201DDFC
_022E92E0:
	bl sub_02008F84
	bl sub_0201BE28
	bl sub_02017A80
	bl sub_02003A40
	ldr r1, _022E9358 ; =ov11_02324CB0
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _022E930C
	mov r0, #0
	bl sub_02008ED0
_022E930C:
	bl sub_02008F88
	bl G3X_Reset
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
	ldr r1, _022E9358 ; =ov11_02324CB0
	strb r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9358: .word ov11_02324CB0
	arm_func_end ov11_022E9258

	arm_func_start GetAllocArenaGround
GetAllocArenaGround: ; 0x022E935C
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
	ldr r0, _022E93BC ; =ov11_02324CB0
	ldr r0, [r0, #8]
	bx lr
_022E93A8:
	ldr r0, _022E93BC ; =ov11_02324CB0
	ldr r0, [r0, #4]
	bx lr
_022E93B4:
	mov r0, #0
	bx lr
	.align 2, 0
_022E93BC: .word ov11_02324CB0
	arm_func_end GetAllocArenaGround

	arm_func_start GetFreeArenaGround
GetFreeArenaGround: ; 0x022E93C0
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _022E9410 ; =ov11_02324CB0
	ldr r0, [r0, #8]
	bl sub_020017B4
	cmp r0, #0
	ldrne r0, _022E9410 ; =ov11_02324CB0
	ldrne r0, [r0, #8]
	ldmneia sp!, {r4, pc}
	ldr r0, _022E9410 ; =ov11_02324CB0
	mov r1, r4
	ldr r0, [r0, #4]
	bl sub_020017B4
	cmp r0, #0
	ldrne r0, _022E9410 ; =ov11_02324CB0
	ldrne r0, [r0, #4]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9410: .word ov11_02324CB0
	arm_func_end GetFreeArenaGround

	arm_func_start GroundMainReturnDungeon
GroundMainReturnDungeon: ; 0x022E9414
	stmdb sp!, {r3, lr}
	ldr r0, _022E9434 ; =ov11_023209EC
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	bl GroundMainNextDay
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9434: .word ov11_023209EC
	arm_func_end GroundMainReturnDungeon

	arm_func_start GroundMainNextDay
GroundMainNextDay: ; 0x022E9438
	stmdb sp!, {r4, lr}
	bl GetGameMode
	mov r4, r0
	ldr r0, _022E94C8 ; =ov11_02320AD4
	bl Debug_Print0
	cmp r4, #3
	bne _022E9468
	mov r0, #0
	bl GenerateKecleonItems1
	mov r0, #0
	bl GenerateKecleonItems2
	ldmia sp!, {r4, pc}
_022E9468:
	cmp r4, #2
	ldmneia sp!, {r4, pc}
	bl GetScenarioBalance
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
	ldr r0, _022E94CC ; =ov11_02320AEC
	mov r1, r4
	bl Debug_Print0
	mov r0, r4
	bl GenerateKecleonItems1
	mov r0, r4
	bl GenerateKecleonItems2
	bl GenerateDailyMissions
	bl GenerateCroagunkItems
	bl sub_0201080C
	bl sub_02011FA0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E94C8: .word ov11_02320AD4
_022E94CC: .word ov11_02320AEC
	arm_func_end GroundMainNextDay

	arm_func_start ov11_022E94D0
ov11_022E94D0: ; 0x022E94D0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _022E9550 ; =ov11_02324FA0
	mov r5, r0
	ldr r0, [r3, #0x1c]
	mov r4, r1
	mov r6, r2
	cmp r0, #0
	bne _022E9548
	ldr r1, _022E9554 ; =ov11_02320B10
	mov r2, r5
	mov r3, r6
	mov r0, #1
	bl Debug_Print
	ldr r0, _022E9550 ; =ov11_02324FA0
	mov r1, #1
	str r1, [r0, #0x1c]
	str r1, [r0, #0x10]
	str r6, [r0, #0x18]
	cmp r4, #0
	movge r1, #3
	movlt r1, #4
	ldr r0, _022E9550 ; =ov11_02324FA0
	cmp r4, #0
	str r1, [r0, #0x14]
	strh r5, [r0, #8]
	ldr r1, _022E9550 ; =ov11_02324FA0
	movlt r4, #0
	mov r0, #1
	str r4, [r1, #0xc]
	ldmia sp!, {r4, r5, r6, pc}
_022E9548:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022E9550: .word ov11_02324FA0
_022E9554: .word ov11_02320B10
	arm_func_end ov11_022E94D0

	arm_func_start ov11_022E9558
ov11_022E9558: ; 0x022E9558
	ldr r1, _022E9588 ; =ov11_02324FA0
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
_022E9588: .word ov11_02324FA0
	arm_func_end ov11_022E9558

	arm_func_start ov11_022E958C
ov11_022E958C: ; 0x022E958C
	stmdb sp!, {r4, lr}
	ldr r1, _022E95D4 ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E95D8 ; =ov11_02320B34
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _022E95D4 ; =ov11_02324FA0
	mov r0, #4
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E95D4: .word ov11_02324FA0
_022E95D8: .word ov11_02320B34
	arm_func_end ov11_022E958C

	arm_func_start JumpToTitleScreen
JumpToTitleScreen: ; 0x022E95DC
	stmdb sp!, {r4, lr}
	ldr r1, _022E963C ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	bne _022E9634
	ldr r1, _022E9640 ; =ov11_02320B58
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r0, _022E963C ; =ov11_02324FA0
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
_022E963C: .word ov11_02324FA0
_022E9640: .word ov11_02320B58
	arm_func_end JumpToTitleScreen

	arm_func_start ov11_022E9644
ov11_022E9644: ; 0x022E9644
	stmdb sp!, {r4, lr}
	ldr r1, _022E968C ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E9690 ; =ov11_02320B78
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _022E968C ; =ov11_02324FA0
	mov r0, #7
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E968C: .word ov11_02324FA0
_022E9690: .word ov11_02320B78
	arm_func_end ov11_022E9644

	arm_func_start ReturnToTitleScreen
ReturnToTitleScreen: ; 0x022E9694
	stmdb sp!, {r4, lr}
	ldr r1, _022E96DC ; =ov11_02324FA0
	mov r4, r0
	ldr r0, [r1, #0x1c]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r1, _022E96E0 ; =ov11_02320B9C
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _022E96DC ; =ov11_02324FA0
	mov r0, #8
	str r0, [r1, #0x1c]
	mov r0, #1
	str r0, [r1, #0x10]
	str r4, [r1, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E96DC: .word ov11_02324FA0
_022E96E0: .word ov11_02320B9C
	arm_func_end ReturnToTitleScreen

	arm_func_start ov11_022E96E4
ov11_022E96E4: ; 0x022E96E4
	ldr r0, _022E96F0 ; =ov11_02324FA0
	ldrb r0, [r0, #4]
	bx lr
	.align 2, 0
_022E96F0: .word ov11_02324FA0
	arm_func_end ov11_022E96E4

	arm_func_start ScriptSpecialProcess0x16
ScriptSpecialProcess0x16: ; 0x022E96F4
	cmp r0, #0
	moveq r1, #1
	ldr r0, _022E970C ; =ov11_02324FA0
	movne r1, #0
	strb r1, [r0, #2]
	bx lr
	.align 2, 0
_022E970C: .word ov11_02324FA0
	arm_func_end ScriptSpecialProcess0x16

	arm_func_start ov11_022E9710
ov11_022E9710: ; 0x022E9710
	ldr r1, _022E971C ; =ov11_02324FA0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_022E971C: .word ov11_02324FA0
	arm_func_end ov11_022E9710

	arm_func_start ov11_022E9720
ov11_022E9720: ; 0x022E9720
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _022E9824 ; =ov11_02388FC0
	mov r1, #1
	str r0, [r2, #0x10]
	ldr r0, _022E9828 ; =ov11_0238905C
	bl sub_0200B894
	ldr r0, _022E982C ; =ov11_02389128
	mov r1, #0
	bl sub_0200B894
	ldr r0, _022E9830 ; =ov11_023890E4
	mov r1, #0
	bl sub_0200B894
	ldr r0, _022E9834 ; =ov11_02389018
	mov r1, #1
	bl sub_0200B894
	ldr r0, _022E9838 ; =ov11_023890A0
	mov r1, #0
	bl sub_0200B894
	mov r8, #0
	ldr r6, _022E983C ; =ov11_02388FD4
	ldr r5, _022E9840 ; =ov11_0238916C
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
	ldr r0, _022E9830 ; =ov11_023890E4
	bl sub_0200B908
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r0
	ldr r0, _022E9830 ; =ov11_023890E4
	bl sub_0200B908
	mov r0, #1
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E9838 ; =ov11_023890A0
	bl sub_0200B908
	bl ov11_022E98CC
	bl ov11_022E99E0
	ldr r0, _022E9844 ; =ov11_02388FD8
	bl InitRender3dElement64
	mov r2, #0x100
	ldr r0, _022E9844 ; =ov11_02388FD8
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
_022E9824: .word ov11_02388FC0
_022E9828: .word ov11_0238905C
_022E982C: .word ov11_02389128
_022E9830: .word ov11_023890E4
_022E9834: .word ov11_02389018
_022E9838: .word ov11_023890A0
_022E983C: .word ov11_02388FD4
_022E9840: .word ov11_0238916C
_022E9844: .word ov11_02388FD8
	arm_func_end ov11_022E9720

	arm_func_start ov11_022E9848
ov11_022E9848: ; 0x022E9848
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E98B8 ; =ov11_023890E4
	bl sub_0200B918
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r0
	ldr r0, _022E98B8 ; =ov11_023890E4
	bl sub_0200B918
	mov r0, #1
	bl sub_0201BCCC
	mov r1, r0
	ldr r0, _022E98BC ; =ov11_023890A0
	bl sub_0200B918
	bl ov11_022EBB14
	ldr r0, _022E98C0 ; =ov11_0238905C
	bl sub_0200B8B8
	ldr r0, _022E98C4 ; =ov11_02389128
	bl sub_0200B8B8
	ldr r0, _022E98B8 ; =ov11_023890E4
	bl sub_0200B8B8
	ldr r0, _022E98C8 ; =ov11_02389018
	bl sub_0200B8B8
	ldr r0, _022E98BC ; =ov11_023890A0
	bl sub_0200B8B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E98B8: .word ov11_023890E4
_022E98BC: .word ov11_023890A0
_022E98C0: .word ov11_0238905C
_022E98C4: .word ov11_02389128
_022E98C8: .word ov11_02389018
	arm_func_end ov11_022E9848

	arm_func_start ov11_022E98CC
ov11_022E98CC: ; 0x022E98CC
	stmdb sp!, {r3, lr}
	ldr r2, _022E99D0 ; =ov11_02388FC0
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
	ldr r0, _022E99D4 ; =ov11_0238905C
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #2
	bl sub_0200B8D4
	b _022E99A8
_022E9924:
	mov r0, #0
	bl sub_02008F4C
	cmp r0, #0x100
	mov r1, #0
	bne _022E9950
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #1
	bl sub_0200B8D4
	b _022E99A8
_022E9950:
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #0
	bl sub_0200B8D4
	b _022E99A8
_022E9968:
	cmp r2, #0
	bne _022E9994
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #1
	bl sub_0200B8D4
	ldr r0, _022E99D0 ; =ov11_02388FC0
	mov r1, #1
	str r1, [r0, #0x10]
	b _022E99A8
_022E9994:
	ldr r0, _022E99D4 ; =ov11_0238905C
	bl sub_0200B8D4
	ldr r0, _022E99D8 ; =ov11_02389128
	mov r1, #0
	bl sub_0200B8D4
_022E99A8:
	ldr r0, _022E99DC ; =ov11_023890E4
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E99D4 ; =ov11_0238905C
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022E99D8 ; =ov11_02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E99D0: .word ov11_02388FC0
_022E99D4: .word ov11_0238905C
_022E99D8: .word ov11_02389128
_022E99DC: .word ov11_023890E4
	arm_func_end ov11_022E98CC

	arm_func_start ov11_022E99E0
ov11_022E99E0: ; 0x022E99E0
	stmdb sp!, {r3, lr}
	ldr r0, _022E9A6C ; =ov11_02388FC0
	ldr r0, [r0, #0x10]
	cmp r0, #2
	bne _022E9A44
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0x100
	bne _022E9A14
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #2
	bl sub_0200B8D4
	b _022E9A50
_022E9A14:
	mov r0, #1
	bl sub_02008F4C
	cmp r0, #0
	bne _022E9A34
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #1
	bl sub_0200B8D4
	b _022E9A50
_022E9A34:
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #0
	bl sub_0200B8D4
	b _022E9A50
_022E9A44:
	ldr r0, _022E9A70 ; =ov11_02389018
	mov r1, #1
	bl sub_0200B8D4
_022E9A50:
	ldr r0, _022E9A74 ; =ov11_023890A0
	mov r1, #0
	bl sub_0200B8D4
	ldr r0, _022E9A70 ; =ov11_02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9A6C: .word ov11_02388FC0
_022E9A70: .word ov11_02389018
_022E9A74: .word ov11_023890A0
	arm_func_end ov11_022E99E0

	arm_func_start ov11_022E9A78
ov11_022E9A78: ; 0x022E9A78
	ldr ip, _022E9A88 ; =sub_0200B908
	mov r1, r0
	ldr r0, _022E9A8C ; =ov11_023890E4
	bx ip
	.align 2, 0
_022E9A88: .word sub_0200B908
_022E9A8C: .word ov11_023890E4
	arm_func_end ov11_022E9A78

	arm_func_start ov11_022E9A90
ov11_022E9A90: ; 0x022E9A90
	ldr ip, _022E9AA0 ; =sub_0200B908
	mov r1, r0
	ldr r0, _022E9AA4 ; =ov11_023890A0
	bx ip
	.align 2, 0
_022E9AA0: .word sub_0200B908
_022E9AA4: .word ov11_023890A0
	arm_func_end ov11_022E9A90

	arm_func_start ov11_022E9AA8
ov11_022E9AA8: ; 0x022E9AA8
	ldr ip, _022E9AB8 ; =sub_0200B918
	mov r1, r0
	ldr r0, _022E9ABC ; =ov11_023890E4
	bx ip
	.align 2, 0
_022E9AB8: .word sub_0200B918
_022E9ABC: .word ov11_023890E4
	arm_func_end ov11_022E9AA8

	arm_func_start ov11_022E9AC0
ov11_022E9AC0: ; 0x022E9AC0
	ldr ip, _022E9AD0 ; =sub_0200B918
	mov r1, r0
	ldr r0, _022E9AD4 ; =ov11_023890A0
	bx ip
	.align 2, 0
_022E9AD0: .word sub_0200B918
_022E9AD4: .word ov11_023890A0
	arm_func_end ov11_022E9AC0

	arm_func_start ov11_022E9AD8
ov11_022E9AD8: ; 0x022E9AD8
	ldr r1, _022E9AEC ; =ov11_02388FC0
	mov r2, #1
	strb r2, [r1]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_022E9AEC: .word ov11_02388FC0
	arm_func_end ov11_022E9AD8

	arm_func_start ov11_022E9AF0
ov11_022E9AF0: ; 0x022E9AF0
	ldr r2, _022E9B08 ; =ov11_02388FC0
	mov r3, #1
	strb r3, [r2, #2]
	strb r1, [r2, #3]
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
_022E9B08: .word ov11_02388FC0
	arm_func_end ov11_022E9AF0

	arm_func_start ov11_022E9B0C
ov11_022E9B0C: ; 0x022E9B0C
	ldr ip, _022E9B1C ; =sub_0200BB60
	mov r1, r0
	ldr r0, _022E9B20 ; =ov11_0238905C
	bx ip
	.align 2, 0
_022E9B1C: .word sub_0200BB60
_022E9B20: .word ov11_0238905C
	arm_func_end ov11_022E9B0C

	arm_func_start ov11_022E9B24
ov11_022E9B24: ; 0x022E9B24
	ldr ip, _022E9B38 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9B3C ; =ov11_0238905C
	mov r1, #1
	bx ip
	.align 2, 0
_022E9B38: .word sub_0200BB74
_022E9B3C: .word ov11_0238905C
	arm_func_end ov11_022E9B24

	arm_func_start ov11_022E9B40
ov11_022E9B40: ; 0x022E9B40
	ldr ip, _022E9B54 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9B58 ; =ov11_0238905C
	mov r1, #2
	bx ip
	.align 2, 0
_022E9B54: .word sub_0200BB74
_022E9B58: .word ov11_0238905C
	arm_func_end ov11_022E9B40

	arm_func_start ov11_022E9B5C
ov11_022E9B5C: ; 0x022E9B5C
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9B80 ; =ov11_0238905C
	mov r1, lr
	mov r2, ip
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9B80: .word ov11_0238905C
	arm_func_end ov11_022E9B5C

	arm_func_start ov11_022E9B84
ov11_022E9B84: ; 0x022E9B84
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9BC8 ; =ov11_02388FC0
	moveq r1, #1
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022E9BC0
	ldr r0, _022E9BCC ; =ov11_02389128
	mov r1, r4
	bl sub_0200BB60
	ldr r0, _022E9BC8 ; =ov11_02388FC0
	mov r1, #1
_022E9BC0:
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9BC8: .word ov11_02388FC0
_022E9BCC: .word ov11_02389128
	arm_func_end ov11_022E9B84

	arm_func_start ov11_022E9BD0
ov11_022E9BD0: ; 0x022E9BD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9C18 ; =ov11_02388FC0
	moveq r1, #2
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022E9C0C
	ldr r0, _022E9C1C ; =ov11_02389128
	mov r2, r4
	mov r1, #1
	bl sub_0200BB74
	ldr r0, _022E9C18 ; =ov11_02388FC0
_022E9C0C:
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9C18: .word ov11_02388FC0
_022E9C1C: .word ov11_02389128
	arm_func_end ov11_022E9BD0

	arm_func_start ov11_022E9C20
ov11_022E9C20: ; 0x022E9C20
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9C68 ; =ov11_02388FC0
	moveq r1, #3
	streq r1, [r0, #8]
	streq r4, [r0, #4]
	beq _022E9C5C
	ldr r0, _022E9C6C ; =ov11_02389128
	mov r2, r4
	mov r1, #2
	bl sub_0200BB74
	ldr r0, _022E9C68 ; =ov11_02388FC0
_022E9C5C:
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E9C68: .word ov11_02388FC0
_022E9C6C: .word ov11_02389128
	arm_func_end ov11_022E9C20

	arm_func_start ov11_022E9C70
ov11_022E9C70: ; 0x022E9C70
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9C94 ; =ov11_02389128
	mov r1, lr
	mov r2, ip
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9C94: .word ov11_02389128
	arm_func_end ov11_022E9C70

	arm_func_start ov11_022E9C98
ov11_022E9C98: ; 0x022E9C98
	ldr ip, _022E9CA8 ; =sub_0200BB60
	mov r1, r0
	ldr r0, _022E9CAC ; =ov11_02389018
	bx ip
	.align 2, 0
_022E9CA8: .word sub_0200BB60
_022E9CAC: .word ov11_02389018
	arm_func_end ov11_022E9C98

	arm_func_start ov11_022E9CB0
ov11_022E9CB0: ; 0x022E9CB0
	ldr ip, _022E9CC4 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9CC8 ; =ov11_02389018
	mov r1, #1
	bx ip
	.align 2, 0
_022E9CC4: .word sub_0200BB74
_022E9CC8: .word ov11_02389018
	arm_func_end ov11_022E9CB0

	arm_func_start ov11_022E9CCC
ov11_022E9CCC: ; 0x022E9CCC
	ldr ip, _022E9CE0 ; =sub_0200BB74
	mov r2, r0
	ldr r0, _022E9CE4 ; =ov11_02389018
	mov r1, #2
	bx ip
	.align 2, 0
_022E9CE0: .word sub_0200BB74
_022E9CE4: .word ov11_02389018
	arm_func_end ov11_022E9CCC

	arm_func_start ov11_022E9CE8
ov11_022E9CE8: ; 0x022E9CE8
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D0C ; =ov11_02389018
	mov r1, lr
	mov r2, ip
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D0C: .word ov11_02389018
	arm_func_end ov11_022E9CE8

	arm_func_start ov11_022E9D10
ov11_022E9D10: ; 0x022E9D10
	stmdb sp!, {r3, lr}
	mov r2, r0
	ldr r0, _022E9D40 ; =ov11_02389018
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
_022E9D40: .word ov11_02389018
	arm_func_end ov11_022E9D10

	arm_func_start ov11_022E9D44
ov11_022E9D44: ; 0x022E9D44
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D68 ; =ov11_023890E4
	mov r1, lr
	mov r2, ip
	bl sub_0200BC60
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D68: .word ov11_023890E4
	arm_func_end ov11_022E9D44

	arm_func_start ov11_022E9D6C
ov11_022E9D6C: ; 0x022E9D6C
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9D90 ; =ov11_023890E4
	mov r1, lr
	mov r2, ip
	bl sub_0200BCB0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9D90: .word ov11_023890E4
	arm_func_end ov11_022E9D6C

	arm_func_start ov11_022E9D94
ov11_022E9D94: ; 0x022E9D94
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9DB8 ; =ov11_023890A0
	mov r1, lr
	mov r2, ip
	bl sub_0200BC60
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9DB8: .word ov11_023890A0
	arm_func_end ov11_022E9D94

	arm_func_start ov11_022E9DBC
ov11_022E9DBC: ; 0x022E9DBC
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, r1
	mov r3, r2
	ldr r0, _022E9DE0 ; =ov11_023890A0
	mov r1, lr
	mov r2, ip
	bl sub_0200BCB0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9DE0: .word ov11_023890A0
	arm_func_end ov11_022E9DBC

	arm_func_start ov11_022E9DE4
ov11_022E9DE4: ; 0x022E9DE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	mov r6, r2
	ldr r2, _022E9E24 ; =ov11_02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9E28 ; =ov11_0238916C
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
_022E9E24: .word ov11_02388FD4
_022E9E28: .word ov11_0238916C
	arm_func_end ov11_022E9DE4

	arm_func_start ov11_022E9E2C
ov11_022E9E2C: ; 0x022E9E2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	ldr r3, _022E9E6C ; =ov11_02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9E70 ; =ov11_0238916C
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
_022E9E6C: .word ov11_02388FD4
_022E9E70: .word ov11_0238916C
	arm_func_end ov11_022E9E2C

	arm_func_start ov11_022E9E74
ov11_022E9E74: ; 0x022E9E74
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0x44
	mul r4, r0, r3
	mov r6, r2
	ldr r2, _022E9EB4 ; =ov11_02388FD4
	mov r0, r0, lsl #1
	ldr r5, _022E9EB8 ; =ov11_0238916C
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
_022E9EB4: .word ov11_02388FD4
_022E9EB8: .word ov11_0238916C
	arm_func_end ov11_022E9E74

	arm_func_start ov11_022E9EBC
ov11_022E9EBC: ; 0x022E9EBC
	stmdb sp!, {r3, lr}
	ldr ip, _022E9EF4 ; =ov11_0238916C
	mov r3, #0x44
	mov lr, r0, lsl #1
	mla r0, r3, r0, ip
	sub r2, r2, #0x100
	mov r2, r2, lsl #0x10
	ldr r3, _022E9EF8 ; =ov11_02388FD4
	mov r2, r2, asr #0x10
	strh r1, [r3, lr]
	mov r3, r2
	mov r1, #0
	bl sub_0200BBF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9EF4: .word ov11_0238916C
_022E9EF8: .word ov11_02388FD4
	arm_func_end ov11_022E9EBC

	arm_func_start ov11_022E9EFC
ov11_022E9EFC: ; 0x022E9EFC
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F3C ; =ov11_02388FC0
	ldrb r1, [r0]
	cmp r1, #0
	ldreqb r0, [r0, #2]
	cmpeq r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022E9F40 ; =ov11_023890E4
	bl sub_0200BD14
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022E9F44 ; =ov11_0238905C
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F3C: .word ov11_02388FC0
_022E9F40: .word ov11_023890E4
_022E9F44: .word ov11_0238905C
	arm_func_end ov11_022E9EFC

	arm_func_start ov11_022E9F48
ov11_022E9F48: ; 0x022E9F48
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl sub_02002878
	cmp r0, #0
	ldreq r0, _022E9F70 ; =ov11_02388FC0
	ldreqb r0, [r0, #1]
	ldmeqia sp!, {r3, pc}
	ldr r0, _022E9F74 ; =ov11_02389128
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F70: .word ov11_02388FC0
_022E9F74: .word ov11_02389128
	arm_func_end ov11_022E9F48

	arm_func_start IsScreenFadeInProgress
IsScreenFadeInProgress: ; 0x022E9F78
	stmdb sp!, {r3, lr}
	ldr r0, _022E9F9C ; =ov11_023890A0
	bl sub_0200BD14
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, _022E9FA0 ; =ov11_02389018
	bl sub_0200BD14
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9F9C: .word ov11_023890A0
_022E9FA0: .word ov11_02389018
	arm_func_end IsScreenFadeInProgress

	arm_func_start ov11_022E9FA4
ov11_022E9FA4: ; 0x022E9FA4
	ldr r1, _022E9FC4 ; =ov11_02388FD4
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022E9FC4: .word ov11_02388FD4
	arm_func_end ov11_022E9FA4

	arm_func_start ov11_022E9FC8
ov11_022E9FC8: ; 0x022E9FC8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _022E9FE0
	ldr r0, _022E9FEC ; =ov11_02389128
	bl GetFadeStatus
	ldmia sp!, {r3, pc}
_022E9FE0:
	ldr r0, _022E9FF0 ; =ov11_02389018
	bl GetFadeStatus
	ldmia sp!, {r3, pc}
	.align 2, 0
_022E9FEC: .word ov11_02389128
_022E9FF0: .word ov11_02389018
	arm_func_end ov11_022E9FC8

	arm_func_start ov11_022E9FF4
ov11_022E9FF4: ; 0x022E9FF4
	ldr r0, _022EA000 ; =ov11_0238905C
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022EA000: .word ov11_0238905C
	arm_func_end ov11_022E9FF4

	arm_func_start ov11_022EA004
ov11_022EA004: ; 0x022EA004
	ldr r0, _022EA010 ; =ov11_02389128
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022EA010: .word ov11_02389128
	arm_func_end ov11_022EA004

	arm_func_start ov11_022EA014
ov11_022EA014: ; 0x022EA014
	ldr r0, _022EA020 ; =ov11_02389018
	ldrsh r0, [r0, #0x14]
	bx lr
	.align 2, 0
_022EA020: .word ov11_02389018
	arm_func_end ov11_022EA014

	arm_func_start ov11_022EA024
ov11_022EA024: ; 0x022EA024
	stmdb sp!, {r3, lr}
	ldr r0, _022EA0B4 ; =ov11_02388FC0
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
	ldr r0, _022EA0B8 ; =ov11_02389128
	bl sub_0200BB60
	b _022EA088
_022EA064:
	ldr r2, [r0, #4]
	ldr r0, _022EA0B8 ; =ov11_02389128
	mov r1, #1
	bl sub_0200BB74
	b _022EA088
_022EA078:
	ldr r2, [r0, #4]
	ldr r0, _022EA0B8 ; =ov11_02389128
	mov r1, #2
	bl sub_0200BB74
_022EA088:
	ldr r0, _022EA0B4 ; =ov11_02388FC0
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
_022EA0A0:
	ldr r0, _022EA0B8 ; =ov11_02389128
	bl sub_0200BD14
	ldr r1, _022EA0B4 ; =ov11_02388FC0
	strb r0, [r1, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EA0B4: .word ov11_02388FC0
_022EA0B8: .word ov11_02389128
	arm_func_end ov11_022EA024

	arm_func_start ov11_022EA0BC
ov11_022EA0BC: ; 0x022EA0BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _022EA7EC ; =ov11_023890E4
	mov r4, #1
	bl sub_0200BD50
	ldr r0, _022EA7F0 ; =ov11_023890A0
	bl sub_0200BD50
	ldr r0, _022EA7F4 ; =ov11_02388FC0
	ldrb r1, [r0, #2]
	cmp r1, #0
	beq _022EA300
	ldr r0, _022EA7F8 ; =ov11_0238905C
	bl sub_0200BC54
	cmp r0, #0
	ldr r0, _022EA7F8 ; =ov11_0238905C
	movne r4, #0
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022EA7FC ; =ov11_02389128
	bl GetFadeStatus
	cmp r0, #0
	bne _022EA12C
	ldr r1, _022EA7F4 ; =ov11_02388FC0
	ldr r0, _022EA7FC ; =ov11_02389128
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022EA1B4
_022EA12C:
	ldr r0, _022EA7FC ; =ov11_02389128
	bl sub_0200BC54
	cmp r0, #0
	movne r4, #0
	bne _022EA1B4
	ldr r0, _022EA7FC ; =ov11_02389128
	bl GetFadeStatus
	cmp r0, #2
	bne _022EA1B4
	ldr r0, _022EA7F4 ; =ov11_02388FC0
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
	ldr r0, _022EA7FC ; =ov11_02389128
	mov r1, #1
	ldr r2, _022EA7F4 ; =ov11_02388FC0
	ldr r2, [r2, #0xc]
	bl sub_0200BB74
	mov r4, #0
_022EA1B4:
	ldr r0, _022EA7FC ; =ov11_02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldr r0, _022EA800 ; =ov11_02389018
	bl GetFadeStatus
	cmp r0, #0
	bne _022EA1EC
	ldr r1, _022EA7F4 ; =ov11_02388FC0
	ldr r0, _022EA800 ; =ov11_02389018
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022EA264
_022EA1EC:
	ldr r0, _022EA800 ; =ov11_02389018
	bl sub_0200BC54
	cmp r0, #0
	movne r4, #0
	bne _022EA264
	ldr r0, _022EA800 ; =ov11_02389018
	bl GetFadeStatus
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
	ldr r0, _022EA800 ; =ov11_02389018
	mov r1, #1
	ldr r2, _022EA7F4 ; =ov11_02388FC0
	ldr r2, [r2, #0xc]
	bl sub_0200BB74
	mov r4, #0
_022EA264:
	ldr r0, _022EA800 ; =ov11_02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8D4
	cmp r4, #0
	beq _022EA3D4
	ldr r2, _022EA7F4 ; =ov11_02388FC0
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
	ldr r0, _022EA7F8 ; =ov11_0238905C
	bl sub_0200BC54
	cmp r0, #0
	ldr r0, _022EA7F8 ; =ov11_0238905C
	movne r4, #0
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022EA7FC ; =ov11_02389128
	bl GetFadeStatus
	cmp r0, #0
	bne _022EA354
	ldr r1, _022EA7F4 ; =ov11_02388FC0
	ldr r0, _022EA7FC ; =ov11_02389128
	ldr r2, [r1, #0xc]
	mov r1, #1
	bl sub_0200BB74
	mov r4, #0
	b _022EA364
_022EA354:
	ldr r0, _022EA7FC ; =ov11_02389128
	bl sub_0200BC54
	cmp r0, #0
	movne r4, #0
_022EA364:
	ldr r0, _022EA7FC ; =ov11_02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldr r0, _022EA800 ; =ov11_02389018
	bl sub_0200BC54
	ldr r0, _022EA800 ; =ov11_02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8D4
	cmp r4, #0
	ldrne r0, _022EA7F4 ; =ov11_02388FC0
	movne r1, #0
	strneb r1, [r0]
	b _022EA3D4
_022EA398:
	ldr r0, _022EA7F8 ; =ov11_0238905C
	bl sub_0200BC54
	ldr r0, _022EA7F8 ; =ov11_0238905C
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA80C
	ldr r0, _022EA7FC ; =ov11_02389128
	bl sub_0200BC54
	ldr r0, _022EA7FC ; =ov11_02389128
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8A0
	ldr r0, _022EA800 ; =ov11_02389018
	bl sub_0200BC54
	ldr r0, _022EA800 ; =ov11_02389018
	ldrsh r0, [r0, #0x14]
	bl ov11_022EA8D4
_022EA3D4:
	mov r8, #0
	mov fp, #0x44
	ldr r5, _022EA804 ; =ov11_0238916C
	ldr r6, _022EA808 ; =ov11_02388FD4
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
_022EA7EC: .word ov11_023890E4
_022EA7F0: .word ov11_023890A0
_022EA7F4: .word ov11_02388FC0
_022EA7F8: .word ov11_0238905C
_022EA7FC: .word ov11_02389128
_022EA800: .word ov11_02389018
_022EA804: .word ov11_0238916C
_022EA808: .word ov11_02388FD4
	arm_func_end ov11_022EA0BC

	arm_func_start ov11_022EA80C
ov11_022EA80C: ; 0x022EA80C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl Debug_GetDebugFlag
	cmp r0, #0
	ldrne r0, _022EA89C ; =ov11_02388FD8
	movne r1, #0
	strneb r1, [r0, #0x2f]
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	ble _022EA864
	ldr r0, _022EA89C ; =ov11_02388FD8
	mov r1, #0xff
	strb r1, [r0, #0x2c]
	strb r1, [r0, #0x2d]
	strb r1, [r0, #0x2e]
	cmp r4, #0x100
	strgeb r1, [r0, #0x2f]
	strltb r4, [r0, #0x2f]
	ldr r0, _022EA89C ; =ov11_02388FD8
	bl sub_0201F2A0
	ldmia sp!, {r4, pc}
_022EA864:
	ldmgeia sp!, {r4, pc}
	ldr r1, _022EA89C ; =ov11_02388FD8
	mov r2, #0
	strb r2, [r1, #0x2c]
	sub r0, r2, #0x100
	strb r2, [r1, #0x2d]
	cmp r4, r0
	movle r0, #0xff
	strb r2, [r1, #0x2e]
	rsbgt r0, r4, #0
	strb r0, [r1, #0x2f]
	ldr r0, _022EA89C ; =ov11_02388FD8
	bl sub_0201F2A0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EA89C: .word ov11_02388FD8
	arm_func_end ov11_022EA80C

	arm_func_start ov11_022EA8A0
ov11_022EA8A0: ; 0x022EA8A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl Debug_GetDebugFlag
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
	bl Debug_GetDebugFlag
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
	ldr r0, _022EA918 ; =ov11_023891F4
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_022EA918: .word ov11_023891F4
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
	ldreq r1, _022EA950 ; =ov11_023891F4
	streq r0, [r1]
	bx lr
_022EA938:
	ldr r0, _022EA950 ; =ov11_023891F4
	ldr r1, [r0]
	cmp r1, #0xb
	moveq r1, #0
	streq r1, [r0]
	bx lr
	.align 2, 0
_022EA950: .word ov11_023891F4
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
	bl KeyWaitInit
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EA990

	arm_func_start ov11_022EA9E4
ov11_022EA9E4: ; 0x022EA9E4
	stmdb sp!, {r4, lr}
	ldr r1, _022EAA20 ; =ov11_023891F4
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
_022EAA20: .word ov11_023891F4
	arm_func_end ov11_022EA9E4

	arm_func_start ov11_022EAA24
ov11_022EAA24: ; 0x022EAA24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x38
	mov r6, r3
	mvn r4, #0
	ldr r3, _022EAF5C ; =ov11_023891F4
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
	bl KeyWaitInit
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
	bl UnlockScriptingLock
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
_022EAF5C: .word ov11_023891F4
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
	ldr r3, _022EB07C ; =ov11_023891F8
	ldr r2, _022EB080 ; =ov11_02320BBC
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
_022EB07C: .word ov11_023891F8
_022EB080: .word ov11_02320BBC
	arm_func_end ov11_022EAFF8

	arm_func_start ov11_022EB084
ov11_022EB084: ; 0x022EB084
	stmdb sp!, {r3, lr}
	ldr lr, _022EB0BC ; =ov11_023891F8
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
_022EB0BC: .word ov11_023891F8
	arm_func_end ov11_022EB084

	arm_func_start ov11_022EB0C0
ov11_022EB0C0: ; 0x022EB0C0
	mov r2, #0x54
	mul r2, r0, r2
	ldr r3, _022EB0E0 ; =ov11_023891F8
	mov r0, #0
	str r1, [r3, r2]
	add r1, r3, r2
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_022EB0E0: .word ov11_023891F8
	arm_func_end ov11_022EB0C0

	arm_func_start ov11_022EB0E4
ov11_022EB0E4: ; 0x022EB0E4
	mov r3, #0x54
	mul r3, r0, r3
	ldr ip, _022EB124 ; =ov11_023891F8
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
_022EB124: .word ov11_023891F8
	arm_func_end ov11_022EB0E4

	arm_func_start ov11_022EB128
ov11_022EB128: ; 0x022EB128
	mov r3, #0x54
	mul r3, r0, r3
	ldr ip, _022EB14C ; =ov11_023891F8
	mov r0, #0
	str r1, [ip, r3]
	add r1, ip, r3
	str r0, [r1, #8]
	str r2, [r1, #4]
	bx lr
	.align 2, 0
_022EB14C: .word ov11_023891F8
	arm_func_end ov11_022EB128

	arm_func_start ov11_022EB150
ov11_022EB150: ; 0x022EB150
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB198 ; =ov11_023891F8
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
_022EB198: .word ov11_023891F8
	arm_func_end ov11_022EB150

	arm_func_start ov11_022EB19C
ov11_022EB19C: ; 0x022EB19C
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB1C8 ; =ov11_023891F8
	mov r0, #1
	str r1, [lr, ip]
	add r1, lr, ip
	str r0, [r1, #8]
	str r3, [r1, #0xc]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB1C8: .word ov11_023891F8
	arm_func_end ov11_022EB19C

	arm_func_start ov11_022EB1CC
ov11_022EB1CC: ; 0x022EB1CC
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB204 ; =ov11_023891F8
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
_022EB204: .word ov11_023891F8
	arm_func_end ov11_022EB1CC

	arm_func_start ov11_022EB208
ov11_022EB208: ; 0x022EB208
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB234 ; =ov11_023891F8
	mov r0, #2
	str r1, [lr, ip]
	add r1, lr, ip
	str r0, [r1, #8]
	str r3, [r1, #0xc]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB234: .word ov11_023891F8
	arm_func_end ov11_022EB208

	arm_func_start ov11_022EB238
ov11_022EB238: ; 0x022EB238
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB270 ; =ov11_023891F8
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
_022EB270: .word ov11_023891F8
	arm_func_end ov11_022EB238

	arm_func_start ov11_022EB274
ov11_022EB274: ; 0x022EB274
	stmdb sp!, {r3, lr}
	mov ip, #0x54
	mul ip, r0, ip
	ldr lr, _022EB2A0 ; =ov11_023891F8
	mov r0, #3
	str r1, [lr, ip]
	add r1, lr, ip
	str r0, [r1, #8]
	str r3, [r1, #0x10]
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB2A0: .word ov11_023891F8
	arm_func_end ov11_022EB274

	arm_func_start ov11_022EB2A4
ov11_022EB2A4: ; 0x022EB2A4
	mov r1, #0x54
	mul r1, r0, r1
	ldr r0, _022EB2C8 ; =ov11_023891F8
	ldr r0, [r0, r1]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022EB2C8: .word ov11_023891F8
	arm_func_end ov11_022EB2A4

	arm_func_start ov11_022EB2CC
ov11_022EB2CC: ; 0x022EB2CC
	ldr r2, _022EB2F0 ; =ov11_023891F8
	mov r1, #0x54
	mla r1, r0, r1, r2
	ldr r0, [r1, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022EB2F0: .word ov11_023891F8
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
	ldr r3, _022EB3EC ; =ov11_023891F8
	mov r2, #0x54
	mla r3, r0, r2, r3
	ldr r2, [r3, #0x48]
	ldr r0, [r3, #0x4c]
	str r2, [r1]
	str r0, [r1, #4]
	ldrb r0, [r3, #0x50]
	bx lr
	.align 2, 0
_022EB3EC: .word ov11_023891F8
	arm_func_end ov11_022EB3C8

	arm_func_start ov11_022EB3F0
ov11_022EB3F0: ; 0x022EB3F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r0, _022EB840 ; =ov11_02320BBC
	ldr r8, _022EB844 ; =ov11_023891F8
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
	bl _fflt
	mov r1, r0
	ldr r0, [sp, #8]
	bl _fdiv
	bl _ffix
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
_022EB840: .word ov11_02320BBC
_022EB844: .word ov11_023891F8
	arm_func_end ov11_022EB3F0

	arm_func_start ov11_022EB848
ov11_022EB848: ; 0x022EB848
	stmdb sp!, {r3, lr}
	mov r0, #0xe8
	mov r1, #6
	bl MemAlloc
	ldr r1, _022EB97C ; =ov11_02324CBC
	mov r2, #6
	str r0, [r1]
	str r2, [sp]
	ldr r0, [r1]
	ldr r2, _022EB980 ; =0x04000018
	ldr r3, _022EB984 ; =0x0600E000
	mov r1, #1
	bl sub_0200B2C4
	mov r1, #6
	ldr r0, _022EB97C ; =ov11_02324CBC
	str r1, [sp]
	ldr r0, [r0]
	ldr r2, _022EB988 ; =0x0400001C
	ldr r3, _022EB98C ; =0x0600F000
	add r0, r0, #0x1c
	mov r1, #1
	bl sub_0200B2C4
	mov r1, #6
	ldr r0, _022EB97C ; =ov11_02324CBC
	str r1, [sp]
	ldr r0, [r0]
	mov r1, #0
	add r0, r0, #0x70
	mov r2, #0x100
	mov r3, #0x5000000
	bl sub_0200A124
	ldr r0, _022EB97C ; =ov11_02324CBC
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
	ldr r0, _022EB97C ; =ov11_02324CBC
	mov r1, #1
	ldr r0, [r0]
	ldr r2, _022EB990 ; =0x04001018
	add r0, r0, #0x38
	ldr r3, _022EB994 ; =0x0620E000
	bl sub_0200B2C4
	mov r0, #6
	str r0, [sp]
	ldr r0, _022EB97C ; =ov11_02324CBC
	mov r1, #1
	ldr r0, [r0]
	ldr r2, _022EB998 ; =0x0400101C
	add r0, r0, #0x54
	ldr r3, _022EB99C ; =0x0620F000
	bl sub_0200B2C4
	mov r0, #6
	str r0, [sp]
	ldr r0, _022EB97C ; =ov11_02324CBC
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x84
	ldr r3, _022EB9A0 ; =0x05000400
	bl sub_0200A124
	ldr r0, _022EB97C ; =ov11_02324CBC
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
_022EB97C: .word ov11_02324CBC
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
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl sub_0200A4C4
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A158
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	bl sub_0200B314
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B314
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl sub_0200A4C4
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A158
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B314
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B314
	ldr r0, _022EBA40 ; =ov11_02324CBC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022EBA40 ; =ov11_02324CBC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBA40: .word ov11_02324CBC
	arm_func_end ov11_022EB9A4

	arm_func_start ov11_022EBA44
ov11_022EBA44: ; 0x022EBA44
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl ov10_022BDB54
	ldr r1, _022EBA94 ; =ov11_02324CBC
	ldr r0, _022EBA98 ; =0x06010000
	ldr r1, [r1]
	mov r3, #0
	add r2, r1, #0x98
	bl ov10_022BDB60
	ldr r1, _022EBA94 ; =ov11_02324CBC
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
_022EBA94: .word ov11_02324CBC
_022EBA98: .word 0x06010000
_022EBA9C: .word 0x06210000
	arm_func_end ov11_022EBA44

	arm_func_start ov11_022EBAA0
ov11_022EBAA0: ; 0x022EBAA0
	ldr r3, _022EBAE4 ; =ov11_02324CBC
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
_022EBAE4: .word ov11_02324CBC
	arm_func_end ov11_022EBAA0

	arm_func_start ov11_022EBAE8
ov11_022EBAE8: ; 0x022EBAE8
	stmdb sp!, {r3, lr}
	ldr r0, _022EBB10 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl ov11_022E9A78
	ldr r0, _022EBB10 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl ov11_022E9A90
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBB10: .word ov11_02324CBC
	arm_func_end ov11_022EBAE8

	arm_func_start ov11_022EBB14
ov11_022EBB14: ; 0x022EBB14
	stmdb sp!, {r3, lr}
	ldr r0, _022EBB3C ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl ov11_022E9AA8
	ldr r0, _022EBB3C ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl ov11_022E9AC0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EBB3C: .word ov11_02324CBC
	arm_func_end ov11_022EBB14
