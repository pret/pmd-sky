	.include "asm/macros.inc"
	.include "overlay_29_0234EC38.inc"

	.text

	arm_func_start ov29_0234EC38
ov29_0234EC38: ; 0x0234EC38
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	bl EntityIsValid__0234EC14
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r0, [sp, #0x20]
	ldr r4, [r7, #0xb4]
	cmp r0, #0
	ldrneb r0, [r4, #7]
	cmpne r0, #0
	bne _0234EC9C
	bl StoryRestrictionsEnabled
	cmp r0, #0
	ldrneb r0, [sp, #0x20]
	cmpne r0, #0
	beq _0234ECA4
	ldrb r0, [r4, #0x48]
	bl JoinedAtRangeCheck2Veneer
	cmp r0, #0
	beq _0234ECA4
_0234EC9C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0234ECA4:
	ldrb r0, [sp, #0x24]
	cmp r0, #0
	beq _0234ECCC
	ldrsh r0, [r4, #0xc]
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0234ECCC:
	cmp r5, #0
	beq _0234ECE4
	mov r0, r7
	ldr r5, [r7, #0xb4]
	bl ov29_02347100
#ifdef JAPAN
	strb r0, [r5, #0x15d]
#else
	strb r0, [r5, #0x161]
#endif
_0234ECE4:
	ldrsh r0, [r4, #0xc]
	ldr r5, [r8, #0x88]
	add sb, r8, #4
	add sl, sb, r5, lsl #5
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl ov29_022F9C34
	strb r0, [sl, #4]
	str r7, [sl, #0x1c]
	str r6, [sb, r5, lsl #5]
#ifdef JAPAN
	ldrb r0, [r4, #0x15d]
#else
	ldrb r0, [r4, #0x161]
#endif
	ldr r1, [r8, #0x88]
	cmp r0, #0
	movne r2, #0
	moveq r2, #3
	add r1, r8, r1
	mov r0, #1
	strb r2, [r1, #0x84]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov29_0234EC38

	arm_func_start ov29_0234ED30
ov29_0234ED30: ; 0x0234ED30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldrb r1, [r6]
	mov r7, r0
	mov r5, r2
	tst r1, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	mov r4, r3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	beq _0234ED84
	ldrb r0, [r6, #1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0234ED84:
	ldrb r0, [sp, #0x18]
	cmp r0, #0
	beq _0234EDA4
	ldrsh r0, [r6, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0234EDA4:
	bl StoryRestrictionsEnabled
	cmp r0, #0
	cmpne r4, #0
	beq _0234EDE4
	ldrb r0, [r6, #3]
	bl JoinedAtRangeCheck2
	cmp r0, #0
	bne _0234EDDC
	ldrb r0, [r6, #3]
	cmp r0, #0xd6
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _0234EDE4
_0234EDDC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0234EDE4:
	ldr r0, [r7, #0x88]
	add r1, r7, #4
	add r2, r1, r0, lsl #5
	str r6, [r2, #0x1c]
	str r5, [r1, r0, lsl #5]
	ldr r0, [r7, #0x88]
	mov r1, #0
	add r0, r7, r0
	strb r1, [r0, #0x84]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234ED30

	arm_func_start ov29_0234EE10
ov29_0234EE10: ; 0x0234EE10
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x98
	mov r7, r0
	mov r6, r1
	mov r4, #0
	bl ov29_0234DD90
	mov r3, #1
	ldr r1, [r7, #0xb4]
	rsb r0, r3, #0x3e8
#ifdef JAPAN
	strb r3, [r1, #0x15d]
#else
	strb r3, [r1, #0x161]
#endif
	ldr ip, [r7, #0xb4]
	ldrsh r2, [ip, #0x12]
	ldrsh r1, [ip, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [ip, #0x10]
	bl ov29_0234EBCC
	mov r1, #1
	add r0, sp, #0xc
	mov r3, r1
	mov r2, #0
	str r1, [sp]
	bl ov29_0234EA18
	mov r2, #1
	str r2, [sp]
	str r2, [sp, #4]
	add r0, sp, #0xc
	mov r1, r7
	rsb r2, r2, #0x3e8
	mov r3, #0
	bl ov29_0234EB28
	cmp r0, #0
	blt _0234EEAC
	add r2, sp, #0x10
	add r0, r2, r0, lsl #5
	mov r1, r6
	mov r2, #0x4e
	bl ov29_0234EBAC
_0234EEAC:
	mov r2, #0
	add r0, sp, #0xc
	mov r3, r2
	mov r1, #2
	bl ov31_02388114
	ldr r1, _0234EF20 ; =ov29_023533B0
	str r0, [sp, #8]
	bl ov31_02388444
	ldr r0, [sp, #8]
	bl ov31_02388534
	ldr r0, [sp, #8]
	bl ov31_023886D4
	cmp r0, #1
	moveq r4, #1
	beq _0234EEFC
	cmp r0, #3
	bne _0234EEFC
	ldr r0, [sp, #8]
	bl ov31_023886DC
	mov r5, r0
_0234EEFC:
	add r0, sp, #8
	bl ov31_02388714
	bl ov29_0234DDB0
	cmp r4, #0
	movne r0, #0
	addeq r0, sp, #0x2c
	ldreq r0, [r0, r5, lsl #5]
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234EF20: .word ov29_023533B0
	arm_func_end ov29_0234EE10

	arm_func_start ov29_0234EF24
ov29_0234EF24: ; 0x0234EF24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x98
	mov r6, #0
	mov sl, r0
	mov sb, r1
	bl ov29_0234DD90
	add r0, sp, #0xc
	mov r1, r6
	bl ov29_0234E9E8
	mov r7, r6
	mov r5, #1
	mov r4, r6
	add fp, sp, #0xc
	b _0234EF7C
_0234EF5C:
	str r5, [sp]
	str r4, [sp, #4]
	ldr r1, [sl, r7, lsl #2]
	mov r0, fp
	mov r2, r7
	mov r3, r4
	bl ov29_0234EB28
	add r7, r7, #1
_0234EF7C:
	cmp r7, sb
	blt _0234EF5C
	mov r2, #0
	add r0, sp, #0xc
	mov r3, r2
	mov r1, #2
	bl ov31_02388114
	ldr r1, _0234F004 ; =ov29_023533B0
	str r0, [sp, #8]
	bl ov31_02388444
	ldr r0, [sp, #8]
	bl ov31_02388534
	ldr r0, [sp, #8]
	bl ov31_023886D4
	cmp r0, #1
	moveq r6, #1
	beq _0234EFD4
	cmp r0, #3
	bne _0234EFD4
	ldr r0, [sp, #8]
	bl ov31_023886DC
	mov r8, r0
_0234EFD4:
	add r0, sp, #8
	bl ov31_02388714
	bl ov29_0234DDB0
	mov r0, #0xa
	mov r1, #0x62
	bl ov29_022EA370
	cmp r6, #0
	movne r0, #0
	addeq r0, sp, #0x2c
	ldreq r0, [r0, r8, lsl #5]
	add sp, sp, #0x98
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234F004: .word ov29_023533B0
	arm_func_end ov29_0234EF24

	arm_func_start DungeonModeSetupAndShowNameKeyboard
DungeonModeSetupAndShowNameKeyboard: ; 0x0234F008
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x40
	mov r4, #0
	mov r7, r0
	mov r6, r1
	mov r1, r4
	mov r0, #8
	mov r5, r2
	bl ov29_022EA428
	ldr r0, _0234F1D8 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bl sub_0200B3D4
	mov r0, #0xe
	bl AdvanceFrame
	b _0234F1A0
_0234F048:
	mov r0, #1
	bl ov29_022E8834
	bl ov29_022E8768
	mov r8, #0xe
	b _0234F064
_0234F05C:
	mov r0, r8
	bl AdvanceFrame
_0234F064:
	bl ov29_022E8848
	cmp r0, #0
	beq _0234F05C
	mov r1, r7
	mov r3, r6
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	mov r0, #0
	bl ov29_022E8834
	mov r8, #0xe
_0234F090:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0234F0C0
	mov r0, r7
	mov r1, #0xa
	bl MemZero
	bl GetKeyboardStringResult
	mov r1, r0
	mov r0, r7
	mov r2, #0xa
	bl StrncpySimple
	b _0234F0CC
_0234F0C0:
	mov r0, r8
	bl AdvanceFrame
	b _0234F090
_0234F0CC:
	mov r0, #1
	bl ov29_022E87FC
	bl ov29_022E8708
	mov r8, #0xe
	b _0234F0E8
_0234F0E0:
	mov r0, r8
	bl AdvanceFrame
_0234F0E8:
	bl ov29_022E8810
	cmp r0, #0
	beq _0234F0E0
	mov r8, #0xe
_0234F0F8:
	bl sub_02037468
	cmp r0, #0
	bne _0234F110
	mov r0, r8
	bl AdvanceFrame
	b _0234F0F8
_0234F110:
	mov r0, #0xe
	bl AdvanceFrame
	mov r0, #0xe
	bl AdvanceFrame
	mov r0, #0
	bl ov29_022E87FC
	mov r8, #0xe
_0234F12C:
	bl ov29_022E87DC
	cmp r0, #0
	bne _0234F144
	mov r0, r8
	bl AdvanceFrame
	b _0234F12C
_0234F144:
	add r0, sp, #0
	mov r1, #0x40
	bl MemZero
	add r0, sp, #0
	mov r1, r7
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0
	bl sub_0203909C
	mov r8, #0xe
_0234F16C:
	mov r0, r8
	bl AdvanceFrame
	bl sub_0203931C
	cmp r0, #0
	moveq r4, #1
	beq _0234F18C
	cmp r0, #1
	bne _0234F16C
_0234F18C:
	bl sub_02039218
	cmp r0, #0
	beq _0234F18C
	mov r0, #0xe
	bl AdvanceFrame
_0234F1A0:
	cmp r4, #0
	beq _0234F048
	mov r0, #0xe
	bl AdvanceFrame
	mov r0, #0xe
	bl AdvanceFrame
	cmp r5, #0
	beq _0234F1CC
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234F1CC:
	mov r0, #1
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234F1D8: .word ov29_0235352C
	arm_func_end DungeonModeSetupAndShowNameKeyboard

	arm_func_start ov29_0234F1DC
ov29_0234F1DC: ; 0x0234F1DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _0234F214 ; =ov29_023533D0
	mov r4, r1
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov29_0234F2CC
	ldr r1, _0234F218 ; =ov29_02353834
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234F214: .word ov29_023533D0
_0234F218: .word ov29_02353834
	arm_func_end ov29_0234F1DC

	arm_func_start ov29_0234F21C
ov29_0234F21C: ; 0x0234F21C
	stmdb sp!, {r3, lr}
	ldr r0, _0234F244 ; =ov29_02353834
	ldr r0, [r0]
	bl ov29_0234F304
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ov29_0234F77C
	mov r0, #4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234F244: .word ov29_02353834
	arm_func_end ov29_0234F21C

	arm_func_start ov29_0234F248
ov29_0234F248: ; 0x0234F248
	ldr ip, _0234F254 ; =ov29_0234F3F4
	ldr r0, _0234F258 ; =ov29_02353834
	bx ip
	.align 2, 0
_0234F254: .word ov29_0234F3F4
_0234F258: .word ov29_02353834
	arm_func_end ov29_0234F248

	arm_func_start ov29_0234F25C
ov29_0234F25C: ; 0x0234F25C
	stmdb sp!, {r3, lr}
	mov r2, #1
	bl ov29_0234F2CC
	ldr r1, _0234F274 ; =ov29_02353834
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234F274: .word ov29_02353834
	arm_func_end ov29_0234F25C

	arm_func_start ov29_0234F278
ov29_0234F278: ; 0x0234F278
	ldr r0, _0234F288 ; =ov29_02353834
	ldr ip, _0234F28C ; =ov29_0234F304
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0234F288: .word ov29_02353834
_0234F28C: .word ov29_0234F304
	arm_func_end ov29_0234F278

	arm_func_start ov29_0234F290
ov29_0234F290: ; 0x0234F290
	stmdb sp!, {r3, lr}
	ldr r0, _0234F2B4 ; =ov29_02353834
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl SetAdvancedTextBoxField0x1C2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234F2B4: .word ov29_02353834
	arm_func_end ov29_0234F290

	arm_func_start ov29_0234F2B8
ov29_0234F2B8: ; 0x0234F2B8
	ldr ip, _0234F2C4 ; =ov29_0234F3F4
	ldr r0, _0234F2C8 ; =ov29_02353838
	bx ip
	.align 2, 0
_0234F2C4: .word ov29_0234F3F4
_0234F2C8: .word ov29_02353838
	arm_func_end ov29_0234F2B8

	arm_func_start ov29_0234F2CC
ov29_0234F2CC: ; 0x0234F2CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0xc
	mov r1, #8
	mov r4, r2
	bl MemAlloc
	strb r6, [r0]
	strb r5, [r0, #1]
	mvn r1, #1
	strb r1, [r0, #2]
	mov r1, #0
	stmib r0, {r1, r4}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0234F2CC

	arm_func_start ov29_0234F304
ov29_0234F304: ; 0x0234F304
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xa4
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0234F3D4
_0234F320: ; jump table
	b _0234F334 ; case 0
	b _0234F398 ; case 1
	b _0234F3CC ; case 2
	b _0234F3D4 ; case 3
	b _0234F3D4 ; case 4
_0234F334:
	ldr r0, _0234F3E0 ; =0x000008DD
	mov r1, #0x10
	str r1, [sp, #0x18]
	strh r0, [sp, #0x14]
	ldr r0, [r4, #8]
	cmp r0, #0
	movne r1, #4
	strne r1, [r4, #4]
	ldrne r0, _0234F3E4 ; =ov29_023533E0
	movne r1, #0x800
	bne _0234F374
	ldr r0, [r4, #4]
	ldr r1, _0234F3E8 ; =0x00001813
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, _0234F3EC ; =ov29_023533C0
_0234F374:
	str r4, [sp]
	mov ip, #0
	str ip, [sp, #4]
	ldr r3, _0234F3F0 ; =ov29_0234F430
	add r2, sp, #0xc
	str ip, [sp, #8]
	bl CreateAdvancedTextBoxWithArg
	strb r0, [r4, #2]
	b _0234F3D4
_0234F398:
	ldrsb r0, [r4, #2]
	bl sub_020282F4
	add r0, r0, #5
	cmp r0, #1
	bhi _0234F3D4
	ldrsb r0, [r4, #2]
	bl CloseAdvancedTextBox
	mvn r0, #1
	strb r0, [r4, #2]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0234F3D4
_0234F3CC:
	mov r0, #1
	b _0234F3D8
_0234F3D4:
	mov r0, #0
_0234F3D8:
	add sp, sp, #0xa4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_0234F3E0: .word 0x00001D35
#else
_0234F3E0: .word 0x000008DD
#endif
_0234F3E4: .word ov29_023533E0
_0234F3E8: .word 0x00001813
_0234F3EC: .word ov29_023533C0
_0234F3F0: .word ov29_0234F430
	arm_func_end ov29_0234F304

	arm_func_start ov29_0234F3F4
ov29_0234F3F4: ; 0x0234F3F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsb r0, [r0, #2]
	mvn r1, #1
	cmp r0, r1
	beq _0234F41C
	bl CloseAdvancedTextBox
_0234F41C:
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234F3F4

	arm_func_start ov29_0234F430
ov29_0234F430: ; 0x0234F430
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xbc
	mov r4, r1
	ldrb r1, [r4]
	mov r5, r0
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0234F718
_0234F450: ; jump table
	b _0234F718 ; case 0
	b _0234F508 ; case 1
	b _0234F460 ; case 2
	b _0234F6F8 ; case 3
_0234F460:
	add r0, sp, #4
	bl sub_0204F1B4
	ldrsb r0, [sp, #4]
	bl sub_0205B77C
	mov r6, r0
	ldr r3, _0234F764 ; =ov29_023533F0
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
	ldrb r0, [r4, #1]
	bl DungeonGoesUp
	cmp r0, #0
	movne r2, #1
	ldrb r1, [r6, #5]
	mvneq r2, #0
	add r4, sp, #8
	mul r2, r1, r2
	str r2, [sp, #0x2c]
	ldr r2, _0234F768 ; =ov29_023533F8
	add r0, sp, #0x58
	mov r1, #0x64
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	add r3, sp, #0x58
	mov r0, r5
	mov r1, #0x15
	mov r2, #0x13
	bl DrawTextInWindow
	mov r2, #0
	add r0, sp, #0x58
	mov r3, r2
	mov r1, #0x64
	str r2, [sp]
	bl sub_02061DC8
	add r3, sp, #0x58
	mov r0, r5
	mov r1, #0x3c
	mov r2, #0x13
	bl DrawTextInWindow
	b _0234F75C
_0234F508:
	ldrb r0, [r4, #1]
	bl DungeonRequestsDoneWrapper
	cmp r0, #0
	bne _0234F598
	ldrb r0, [r4, #1]
	cmp r0, #0x49
	blo _0234F578
	cmp r0, #0x56
	bhi _0234F578
	ldr r0, _0234F76C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x4c]
	bl GetDungeonMode
	cmp r0, #1
	beq _0234F578
	ldrb r0, [r4, #1]
#ifdef JAPAN
	add r0, r0, #0x2c8
#else
	add r0, r0, #0x278
	add r0, r0, #0x800
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
	b _0234F75C
_0234F578:
	ldr r0, _0234F770 ; =0x000008DE
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
	b _0234F75C
_0234F598:
	mov sb, #0
	mov r8, sb
	mov r7, #0x13
	mvn r6, #0
	add fp, sp, #8
_0234F5AC:
	mov r0, r8, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sl, r0
	ldrb r1, [sl, #4]
	ldrb r0, [r4, #1]
	cmp r1, r0
	bne _0234F6BC
	ldrb r1, [sl]
	cmp r1, #0
	cmpne r1, #4
	cmpne r1, #6
	beq _0234F6BC
	ldrb r0, [sl, #1]
	cmp r0, #0xc
	moveq sb, #1
	beq _0234F6BC
	cmp r1, #7
	mov r0, r5
	mov r1, #0xa
	mov r2, r7
	bne _0234F610
	ldr r3, _0234F774 ; =ov29_02353404
	bl DrawTextInWindow
	b _0234F618
_0234F610:
	ldr r3, _0234F764 ; =ov29_023533F0
	bl DrawTextInWindow
_0234F618:
	ldrb r1, [sl, #1]
	cmp r1, #3
	ldreqb r0, [sl, #2]
	cmpeq r0, #3
	beq _0234F694
	cmp r1, #6
	ldreqb r0, [sl, #2]
	cmpeq r0, #4
	beq _0234F694
	cmp r1, #8
	cmpne r1, #5
	beq _0234F694
	ldrb r0, [r4, #1]
	bl DungeonGoesUp
	cmp r0, #0
	movne r3, #1
	ldrb r2, [sl, #5]
	moveq r3, r6
	add r0, sp, #0x58
	mul r3, r2, r3
	str r3, [sp, #0x2c]
	ldr r2, _0234F768 ; =ov29_023533F8
	mov r1, #0x64
	mov r3, #0
	str fp, [sp]
	bl PreprocessString
	mov r0, r5
	mov r1, #0x15
	mov r2, r7
	add r3, sp, #0x58
	bl DrawTextInWindow
_0234F694:
	mov r2, sl
	add r0, sp, #0x58
	mov r1, #0x64
	bl sub_02061F44
	mov r0, r5
	mov r1, #0x3c
	mov r2, r7
	add r3, sp, #0x58
	bl DrawTextInWindow
	add r7, r7, #0xe
_0234F6BC:
	add r8, r8, #1
	cmp r8, #8
	blt _0234F5AC
	cmp sb, #0
	beq _0234F75C
	cmp r7, #0x13
	bne _0234F75C
	ldr r0, _0234F770 ; =0x000008DE
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
	b _0234F75C
_0234F6F8:
	ldr r0, _0234F770 ; =0x000008DE
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
	b _0234F75C
_0234F718:
	add r0, sp, #6
	bl sub_0204F10C
	cmp r0, #0
	beq _0234F748
	ldrsh r0, [sp, #6]
	bl sub_0204E114
	mov r3, r0
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
	b _0234F75C
_0234F748:
	ldr r3, _0234F778 ; =ov29_0235340C
	mov r0, r5
	mov r1, #0xa
	mov r2, #0x13
	bl DrawTextInWindow
_0234F75C:
	add sp, sp, #0xbc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234F764: .word ov29_023533F0
_0234F768: .word ov29_023533F8
_0234F76C: .word DUNGEON_PTR
#ifdef JAPAN
_0234F770: .word 0x00001D36
#else
_0234F770: .word 0x000008DE
#endif
_0234F774: .word ov29_02353404
_0234F778: .word ov29_0235340C
	arm_func_end ov29_0234F430

	arm_func_start ov29_0234F77C
ov29_0234F77C: ; 0x0234F77C
	stmdb sp!, {r3, lr}
	ldr r0, _0234F7B8 ; =ov29_0235342C
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x10
	mov r1, #8
	bl MemAlloc
	ldr r1, _0234F7BC ; =ov29_0235383C
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0, #0xc]
	mov r0, #9
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234F7B8: .word ov29_0235342C
_0234F7BC: .word ov29_0235383C
	arm_func_end ov29_0234F77C

	arm_func_start OthersMenuLoop
OthersMenuLoop: ; 0x0234F7C0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x98
	ldr r0, _0234F9C8 ; =ov29_0235383C
	ldr r2, [r0, #4]
	ldr r1, [r2, #0xc]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0234F9BC
_0234F7E0: ; jump table
	b _0234F7F0 ; case 0
	b _0234F8A0 ; case 1
	b _0234F8E8 ; case 2
	b _0234F9BC ; case 3
_0234F7F0:
	mov r3, #0
	mov r2, r3
_0234F7F8:
	ldr r1, [r0, #4]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #1]
	cmp r3, #8
	blt _0234F7F8
	mov r0, #0x1d
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldreq r4, _0234F9CC ; =ov29_0235343C
	beq _0234F840
	ldr r4, _0234F9D0 ; =ov29_02353474
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldrne r0, _0234F9C8 ; =ov29_0235383C
	movne r1, #3
	ldrne r0, [r0, #4]
	strneb r1, [r0, #6]
_0234F840:
	ldr r1, _0234F9C8 ; =ov29_0235383C
	mov r0, #1
	ldr r1, [r1, #4]
	add r1, r1, #1
	str r1, [sp, #0x60]
	bl Arm9LoadUnkFieldNa0x2029EC8
	str r0, [sp]
	ldr lr, _0234F9D4 ; =0x000008B9
	mov ip, #0x10
	ldr r0, _0234F9D8 ; =ov29_0235341C
	ldr r1, _0234F9DC ; =0x00001A33
	add r2, sp, #0
	mov r3, r4
	strh lr, [sp, #8]
	str ip, [sp, #0xc]
	bl CreateParentMenuFromStringIds
	ldr r1, _0234F9C8 ; =ov29_0235383C
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r1, [r1, #4]
	ldr r0, [r1, #0xc]
	add r0, r0, #1
	str r0, [r1, #0xc]
	b _0234F9BC
_0234F8A0:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	beq _0234F8D0
	ldr r0, _0234F9C8 ; =ov29_0235383C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202AB80
	and r1, r0, #0xff
	mov r0, #1
	bl Arm9StoreUnkFieldNa0x2029ED8
	b _0234F9BC
_0234F8D0:
	ldr r0, _0234F9C8 ; =ov29_0235383C
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xc]
	add r0, r0, #1
	str r0, [r1, #0xc]
	b _0234F9BC
_0234F8E8:
	add r1, r1, #1
	str r1, [r2, #0xc]
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	ldr r1, _0234F9C8 ; =ov29_0235383C
	cmp r0, #8
	str r0, [r1, #8]
	addls pc, pc, r0, lsl #2
	b _0234F9B4
_0234F910: ; jump table
	b _0234F934 ; case 0
	b _0234F940 ; case 1
	b _0234F94C ; case 2
	b _0234F95C ; case 3
	b _0234F96C ; case 4
	b _0234F988 ; case 5
	b _0234F990 ; case 6
	b _0234F998 ; case 7
	b _0234F9A4 ; case 8
_0234F934:
	ldr r0, _0234F9E0 ; =ov29_0234F77C
	bl ov31_023833D8
	b _0234F9B4
_0234F940:
	ldr r0, _0234F9E0 ; =ov29_0234F77C
	bl ov31_02383434
	b _0234F9B4
_0234F94C:
	mov r0, #2
	str r0, [r1]
	mov r0, #4
	b _0234F9C0
_0234F95C:
	mov r0, #3
	str r0, [r1]
	mov r0, #4
	b _0234F9C0
_0234F96C:
	ldr r0, _0234F9E4 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x700
	ldrsb r0, [r0, #0x98]
	ldrb r1, [r1, #0x748]
	bl ov29_0234F1DC
	b _0234F9B4
_0234F988:
	bl ov31_02388E88
	b _0234F9B4
_0234F990:
	bl ov31_0238941C
	b _0234F9B4
_0234F998:
	mov r0, #7
	str r0, [r1]
	b _0234F9B4
_0234F9A4:
	bl EntryOverlay31
	ldr r0, _0234F9C8 ; =ov29_0235383C
	mov r1, #8
	str r1, [r0]
_0234F9B4:
	mov r0, #3
	b _0234F9C0
_0234F9BC:
	mov r0, #1
_0234F9C0:
	add sp, sp, #0x98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234F9C8: .word ov29_0235383C
_0234F9CC: .word ov29_0235343C
_0234F9D0: .word ov29_02353474
#ifdef JAPAN
_0234F9D4: .word 0x00001D11
#else
_0234F9D4: .word 0x000008B9
#endif
_0234F9D8: .word ov29_0235341C
_0234F9DC: .word 0x00001A33
_0234F9E0: .word ov29_0234F77C
_0234F9E4: .word DUNGEON_PTR
	arm_func_end OthersMenuLoop

	arm_func_start ov29_0234F9E8
ov29_0234F9E8: ; 0x0234F9E8
	stmdb sp!, {r3, lr}
	ldr r0, _0234FA20 ; =ov29_0235383C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _0234FA20 ; =ov29_0235383C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0234FA20 ; =ov29_0235383C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234FA20: .word ov29_0235383C
	arm_func_end ov29_0234F9E8

	arm_func_start OthersMenu
OthersMenu: ; 0x0234FA24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _0234FAE4 ; =ov29_0235383C
	mov r1, #9
	str r1, [r0]
	bl ov29_0234F77C
	mov r0, #0
	ldr r5, _0234FAE8 ; =ov29_0238280C
	mov r7, #9
	ldr r4, _0234FAE4 ; =ov29_0235383C
	strh r0, [r5]
	mov sb, r0
	mov fp, #1
	mov r8, r0
	mov r6, r7
	mov sl, #0x62
_0234FA60:
	mov r0, sl
	bl AdvanceFrame
	ldrh r0, [r5]
	cmp r0, #0
	beq _0234FA8C
	ldrh r1, [r5]
	mov r0, sb
	mov r2, fp
	bl DisplayMessage
	strh r8, [r5]
	bl ov29_0234F77C
_0234FA8C:
	ldr r0, [r4]
	cmp r0, #8
	beq _0234FADC
	cmp r0, #3
	bne _0234FAB8
	mov r0, #0
	mov r1, r0
	bl OpenMessageLog
	bl ov29_0234F77C
	str r7, [r4]
	b _0234FA60
_0234FAB8:
	cmp r0, #2
	bne _0234FA60
	mov r0, #1
	bl ov29_022F0C98
	mov r0, #0x62
	bl AdvanceFrame
	bl ov29_0234F77C
	str r6, [r4]
	b _0234FA60
_0234FADC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234FAE4: .word ov29_0235383C
_0234FAE8: .word ov29_0238280C
	arm_func_end OthersMenu

	arm_func_start ov29_0234FAEC
ov29_0234FAEC: ; 0x0234FAEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov29_0234DDA0
	cmp r0, #0
	bne _0234FB30
	bl ov29_0234DD90
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl ov31_0238647C
	mov r4, r0
	bl ov29_0234DDB0
	b _0234FB48
_0234FB30:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl ov31_0238647C
	mov r4, r0
_0234FB48:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234FAEC

	arm_func_start ov29_0234FB50
ov29_0234FB50: ; 0x0234FB50
	ldr ip, _0234FB5C ; =CheckVariousStatuses2
	mov r1, #1
	bx ip
	.align 2, 0
_0234FB5C: .word CheckVariousStatuses2
	arm_func_end ov29_0234FB50

	arm_func_start ov29_0234FB60
ov29_0234FB60: ; 0x0234FB60
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #0
	beq _0234FB84
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0234FB84:
	cmp r0, #0
	beq _0234FBC4
	ldr r0, [r4, #0xb4]
	ldrb r1, [r0, #7]
	cmp r1, #0
	ldreqb r1, [r0, #6]
	cmpeq r1, #0
	bne _0234FBC4
	bl IsExperienceLocked
	cmp r0, #0
	bne _0234FBC4
	mov r0, r4
	mov r1, #1
	bl CheckVariousStatuses2
	cmp r0, #0
	beq _0234FBCC
_0234FBC4:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0234FBCC:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234FB60

	arm_func_start ov29_0234FBD4
ov29_0234FBD4: ; 0x0234FBD4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _0234FC18 ; =DUNGEON_PTR
	b _0234FC08
_0234FBE4:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl ov29_0234FB60
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	add r5, r5, #1
_0234FC08:
	cmp r5, #4
	blt _0234FBE4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234FC18: .word DUNGEON_PTR
	arm_func_end ov29_0234FBD4

	arm_func_start ov29_0234FC1C
ov29_0234FC1C: ; 0x0234FC1C
	stmdb sp!, {r4, lr}
	ldr r1, _0234FC4C ; =ov29_02353848
	mov r4, r0
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	bl StringFromId
	mov r3, r0
	mov r0, r4
	mov r1, #4
	mov r2, #0
	bl DrawTextInWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234FC4C: .word ov29_02353848
	arm_func_end ov29_0234FC1C

	arm_func_start ov29_0234FC50
ov29_0234FC50: ; 0x0234FC50
	stmdb sp!, {r4, lr}
	ldr r1, _0234FC9C ; =ov29_02353848
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, #4
	mov r1, #8
	bl MemAlloc
	ldr r2, _0234FC9C ; =ov29_02353848
	ldr r1, _0234FCA0 ; =ov29_0234FC1C
	str r0, [r2]
	strh r4, [r0, #2]
	ldr r0, _0234FCA4 ; =ov29_023534B4
	bl CreateTextBox
	ldr r1, _0234FC9C ; =ov29_02353848
	ldr r1, [r1]
	strb r0, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234FC9C: .word ov29_02353848
_0234FCA0: .word ov29_0234FC1C
_0234FCA4: .word ov29_023534B4
	arm_func_end ov29_0234FC50

	arm_func_start ov29_0234FCA8
ov29_0234FCA8: ; 0x0234FCA8
	stmdb sp!, {r3, lr}
	ldr r0, _0234FCF8 ; =ov29_02353848
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202F954
	ldr r0, _0234FCF8 ; =ov29_02353848
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseTextBox
	ldr r0, _0234FCF8 ; =ov29_02353848
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234FCF8 ; =ov29_02353848
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234FCF8: .word ov29_02353848
	arm_func_end ov29_0234FCA8
	; 0x0234FCFC

	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xFC, 0x0C, 0x00
