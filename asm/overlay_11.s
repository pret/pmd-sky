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
	bl GetRecoloredTeamMemberName
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

; https://decomp.me/scratch/MlEGQ
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
	bl DefaultInitScriptVariable
	b _022E2474
_022DED7C: ; 0x022DED7C
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r1, r0, lsl #0x10
	add r0, r4, #0x6c
	mov r1, r1, asr #0x10
	bl ZeroInitScriptVariable
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
	bl CalcAndUpdateScriptVarWithOtherValue
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
	bl CalcAndUpdateScriptVarWithOtherScriptVar
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
	bl SetScenarioProgressScriptVar
	b _022E2474
_022DEEBC: ; 0x022DEEBC
	ldrh r0, [r6]
	bl ScriptParamToInt
	mov r0, r0, lsl #0x10
	mov r1, #0
	mov r2, r1
	mov r0, r0, asr #0x10
	bl SetScenarioProgressScriptVar
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
	bl SetResolvedPerformanceProgressFlag
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
	bl SetSpecialEpisodeBeaten
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
	bl LoadAndCompareScriptVarAndValue
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
	bl LoadAndCompareScriptVarAndValue
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
	bl LoadAndCompareScriptVars
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
	bl CompareScriptVariablesVeneer
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
	bl IsStoryBeforePoint
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
	bl IsStoryBeforeOrAtPoint
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
	bl IsStoryAtPoint
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
	bl IsStoryAtOrAfterPoint
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
	bl IsStoryAfterPoint
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
	bl GetResolvedPerformanceProgressFlag
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
	bl CalcScriptVariablesVeneer
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
	bl CalcScriptVariablesVeneer
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
	bl GetResolvedPerformanceProgressFlag
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
	bl SetWorldMapLevel
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
	bl SetWorldMapLevel
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
	bl IsMePlaying
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
	bl CompareScriptVariablesVeneer
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
	bl CompareScriptVariablesVeneer
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
	bl CompareScriptVariablesVeneer
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
