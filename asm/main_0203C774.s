	.include "asm/macros.inc"
	.include "main_0203C774.inc"

	.text

	arm_func_start sub_0203C774
sub_0203C774: ; 0x0203C774
	cmp r0, #0
	movne r0, #7
	moveq r0, #8
	bx lr
	arm_func_end sub_0203C774

	arm_func_start sub_0203C784
sub_0203C784: ; 0x0203C784
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	bl sub_02027B1C
	ldr r0, _0203C7DC ; =_020AFE5C
	ldr r1, _0203C7E0 ; =_0209C60C
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	bl StringFromId
	str r0, [sp, #0x3c]
	add ip, sp, #4
#ifdef JAPAN
	ldr r3, _0203CBC8 ; =0x000023B4
#endif
	mov r0, r4
	mov r1, #0xa
	mov r2, #2
#ifndef JAPAN
	mov r3, #0x30c
#endif
	str ip, [sp]
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0203C7DC: .word _020AFE5C
_0203C7E0: .word _0209C60C
#ifdef JAPAN
_0203CBC8: .word 0x000023B4
#endif
	arm_func_end sub_0203C784

	arm_func_start sub_0203C7E4
sub_0203C7E4: ; 0x0203C7E4
	stmdb sp!, {r4, lr}
	ldr r1, _0203C870 ; =_020AFE70
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _0203C810
	mov r0, #0x10
	mov r1, #8
	bl MemAlloc
	ldr r1, _0203C870 ; =_020AFE70
	str r0, [r1]
_0203C810:
	ldr r1, _0203C870 ; =_020AFE70
	mvn r3, #0
	ldr r2, [r1]
	mov r0, r4
	strh r3, [r2, #6]
	ldr r1, [r1]
	strh r3, [r1, #4]
	bl sub_0203C9A0
	ldr r0, _0203C870 ; =_020AFE70
	mvn r2, #1
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #1]
	ldr r0, [r0]
	strb r2, [r0, #2]
	bl sub_0203C984
	ldr r0, _0203C870 ; =_020AFE70
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0xa]
	ldr r0, [r0]
	str r2, [r0, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203C870: .word _020AFE70
	arm_func_end sub_0203C7E4

	arm_func_start sub_0203C874
sub_0203C874: ; 0x0203C874
	ldr r0, _0203C8DC ; =_020AFE70
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xa]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	bx lr
_0203C898: ; jump table
	b _0203C8AC ; case 0
	b _0203C8B8 ; case 1
	b _0203C8C4 ; case 2
	bx lr ; case 3
	b _0203C8D0 ; case 4
_0203C8AC:
	mov r0, #7
	str r0, [r1, #0xc]
	bx lr
_0203C8B8:
	mov r0, #7
	str r0, [r1, #0xc]
	bx lr
_0203C8C4:
	mov r0, #7
	str r0, [r1, #0xc]
	bx lr
_0203C8D0:
	mov r0, #5
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0203C8DC: .word _020AFE70
	arm_func_end sub_0203C874

	arm_func_start sub_0203C8E0
sub_0203C8E0: ; 0x0203C8E0
	ldr r0, _0203C90C ; =_020AFE70
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0, #0xc]
	cmp r0, #0xa
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0203C90C: .word _020AFE70
	arm_func_end sub_0203C8E0

	arm_func_start sub_0203C910
sub_0203C910: ; 0x0203C910
	ldr r0, _0203C93C ; =_020AFE70
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0, #0xc]
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0203C93C: .word _020AFE70
	arm_func_end sub_0203C910

	arm_func_start sub_0203C940
sub_0203C940: ; 0x0203C940
	stmdb sp!, {r3, lr}
	ldr r0, _0203C980 ; =_020AFE70
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0, #0xc]
	cmp r1, #0xa
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0203C980 ; =_020AFE70
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203C980: .word _020AFE70
	arm_func_end sub_0203C940

	arm_func_start sub_0203C984
sub_0203C984: ; 0x0203C984
	ldr r0, _0203C99C ; =_020AFE70
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	strneh r0, [r1, #8]
	bx lr
	.align 2, 0
_0203C99C: .word _020AFE70
	arm_func_end sub_0203C984

	arm_func_start sub_0203C9A0
sub_0203C9A0: ; 0x0203C9A0
	ldr r1, _0203C9C0 ; =_020AFE70
	ldr r2, [r1]
	ldrsh r1, [r2, #4]
	cmp r0, r1
	moveq r0, #0
	strneh r0, [r2, #4]
	movne r0, #1
	bx lr
	.align 2, 0
_0203C9C0: .word _020AFE70
	arm_func_end sub_0203C9A0

	arm_func_start sub_0203C9C4
sub_0203C9C4: ; 0x0203C9C4
	ldr r0, _0203C9E0 ; =_020AFE70
	mvn r2, #0
	ldr r1, [r0]
	strh r2, [r1, #6]
	ldr r0, [r0]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
_0203C9E0: .word _020AFE70
	arm_func_end sub_0203C9C4

	arm_func_start sub_0203C9E4
sub_0203C9E4: ; 0x0203C9E4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x2c
	ldr r0, _0203CA38 ; =_020AFE70
	ldr r5, [r0]
	cmp r5, #0
	beq _0203CA30
	ldr r4, _0203CA3C ; =_0209C7F4
	add lr, sp, #0
	mov ip, #2
_0203CA08:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0203CA08
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldr r1, [r5, #0xc]
	add r0, sp, #0
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0203CA30:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0203CA38: .word _020AFE70
_0203CA3C: .word _0209C7F4
	arm_func_end sub_0203C9E4

	arm_func_start sub_0203CA40
sub_0203CA40: ; 0x0203CA40
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov11_0230D92C
	ldr r0, _0203CA68 ; =_020AFE70
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CA68: .word _020AFE70
	arm_func_end sub_0203CA40

	arm_func_start sub_0203CA6C
sub_0203CA6C: ; 0x0203CA6C
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203CA8C ; =_020AFE70
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CA8C: .word _020AFE70
	arm_func_end sub_0203CA6C

	arm_func_start sub_0203CA90
sub_0203CA90: ; 0x0203CA90
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0203CAC8 ; =_020AFE70
	ldr r0, [r0]
	ldrsh r0, [r0, #4]
	bl sub_0203CCD8
	bl ov11_02310C18
	ldr r0, _0203CAC8 ; =_020AFE70
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CAC8: .word _020AFE70
	arm_func_end sub_0203CA90

	arm_func_start sub_0203CACC
sub_0203CACC: ; 0x0203CACC
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203CAEC ; =_020AFE70
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CAEC: .word _020AFE70
	arm_func_end sub_0203CACC

	arm_func_start sub_0203CAF0
sub_0203CAF0: ; 0x0203CAF0
	stmdb sp!, {r3, lr}
	ldr r0, _0203CB54 ; =_020AFE70
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	movne r0, #5
	strne r0, [r2, #0xc]
	ldmneia sp!, {r3, pc}
	ldrh r1, [r2, #8]
	add r1, r1, #1
	strh r1, [r2, #8]
	ldr r3, [r0]
	ldrh r1, [r3, #8]
	cmp r1, #0x1e
	ldmloia sp!, {r3, pc}
	ldrsh r2, [r3, #4]
	ldrsh r1, [r3, #6]
	cmp r2, r1
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strh r1, [r3, #8]
	ldr r0, [r0]
	ldrsh r0, [r0, #4]
	bl sub_0203CCD8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CB54: .word _020AFE70
	arm_func_end sub_0203CAF0

	arm_func_start sub_0203CB58
sub_0203CB58: ; 0x0203CB58
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov11_0230D92C
	ldr r0, _0203CB80 ; =_020AFE70
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CB80: .word _020AFE70
	arm_func_end sub_0203CB58

	arm_func_start sub_0203CB84
sub_0203CB84: ; 0x0203CB84
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0203CC5C ; =_020AFE70
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0]
	cmp r0, r1
	beq _0203CBD0
	bl HidePortraitBox
	ldr r0, _0203CC5C ; =_020AFE70
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ClosePortraitBox
	ldr r0, _0203CC5C ; =_020AFE70
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_0203CBD0:
	ldr r0, _0203CC5C ; =_020AFE70
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	cmp r0, r1
	beq _0203CC0C
	bl sub_0202F954
	ldr r0, _0203CC5C ; =_020AFE70
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseTextBox
	ldr r0, _0203CC5C ; =_020AFE70
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #2]
_0203CC0C:
	ldr r0, _0203CC5C ; =_020AFE70
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	cmp r0, r1
	beq _0203CC48
	bl sub_0202F954
	ldr r0, _0203CC5C ; =_020AFE70
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseTextBox
	ldr r0, _0203CC5C ; =_020AFE70
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #1]
_0203CC48:
	ldr r0, _0203CC5C ; =_020AFE70
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CC5C: .word _020AFE70
	arm_func_end sub_0203CB84

	arm_func_start sub_0203CC60
sub_0203CC60: ; 0x0203CC60
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203CC80 ; =_020AFE70
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CC80: .word _020AFE70
	arm_func_end sub_0203CC60

	arm_func_start sub_0203CC84
sub_0203CC84: ; 0x0203CC84
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov11_0230D000
	ldr r0, _0203CCAC ; =_020AFE70
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CCAC: .word _020AFE70
	arm_func_end sub_0203CC84

	arm_func_start sub_0203CCB0
sub_0203CCB0: ; 0x0203CCB0
	stmdb sp!, {r3, lr}
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203CCD0 ; =_020AFE70
	moveq r1, #0xa
	ldreq r0, [r0]
	streq r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203CCD0: .word _020AFE70
	arm_func_end sub_0203CCB0

	arm_func_start sub_0203CCD4
sub_0203CCD4: ; 0x0203CCD4
	bx lr
	arm_func_end sub_0203CCD4

	arm_func_start sub_0203CCD8
sub_0203CCD8: ; 0x0203CCD8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, _0203CE00 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, _0203CE04 ; =_020AFE70
	ldr r4, [r1]
	ldr r3, [r2]
	mov r1, #0x44
	strh r0, [r3, #6]
	ldr r3, [r2]
	sub r2, r1, #0x46
	ldrsb r3, [r3]
	smlabb r4, r0, r1, r4
	cmp r3, r2
	bne _0203CD2C
	mov r0, #1
	mov r1, #3
	mov r2, #0
	bl CreatePortraitBox
	ldr r1, _0203CE04 ; =_020AFE70
	ldr r1, [r1]
	strb r0, [r1]
_0203CD2C:
	ldr r1, _0203CE04 ; =_020AFE70
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #1]
	cmp r1, r0
	bne _0203CD5C
	ldr r0, _0203CE08 ; =_0209C7E4
	ldr r1, _0203CE0C ; =sub_0203CE1C
	bl CreateTextBox
	ldr r1, _0203CE04 ; =_020AFE70
	ldr r1, [r1]
	strb r0, [r1, #1]
_0203CD5C:
	ldr r1, _0203CE04 ; =_020AFE70
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #2]
	cmp r1, r0
	bne _0203CD8C
	ldr r0, _0203CE10 ; =_0209C7D4
	ldr r1, _0203CE14 ; =sub_0203CFCC
	bl CreateTextBox
	ldr r1, _0203CE04 ; =_020AFE70
	ldr r1, [r1]
	strb r0, [r1, #2]
_0203CD8C:
	add r0, sp, #0
	bl InitPortraitParams
	ldrsh r1, [r4, #4]
	add r0, sp, #0
	bl InitPortraitParamsWithMonsterId
	add r0, sp, #0
	mov r1, #2
	bl SetPortraitLayout
	ldr r1, _0203CE18 ; =_0209C7CC
	add r0, sp, #0
	bl SetPortraitOffset
	add r0, sp, #0
	mov r1, #0
	bl SetPortraitEmotion
	ldr r0, _0203CE04 ; =_020AFE70
	add r1, sp, #0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowPortraitInPortraitBox
	ldr r0, _0203CE04 ; =_020AFE70
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl IsTextboxState3
	ldr r0, _0203CE04 ; =_020AFE70
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl IsTextboxState3
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203CE00: .word TEAM_MEMBER_TABLE_PTR
_0203CE04: .word _020AFE70
_0203CE08: .word _0209C7E4
_0203CE0C: .word sub_0203CE1C
_0203CE10: .word _0209C7D4
_0203CE14: .word sub_0203CFCC
_0203CE18: .word _0209C7CC
	arm_func_end sub_0203CCD8

	arm_func_start sub_0203CE1C
sub_0203CE1C: ; 0x0203CE1C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1d4
	mov r5, r0
	mvn r1, #1
	cmp r5, r1
	beq _0203CF84
	ldr r1, _0203CF8C ; =_020AFE70
	ldr r2, _0203CF90 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r1]
	ldr r3, [r2]
	ldrsh r2, [r1, #6]
	mov r1, #0x44
	smlabb r4, r2, r1, r3
	bl ClearWindow
	ldrsh r0, [r4, #4]
	bl GetDexNumber
	str r0, [sp, #0xa8]
	add r1, sp, #0x84
	str r1, [sp]
	ldr r2, _0203CF94 ; =_0209C820
	ldr r3, _0203CF98 ; =0x0000C402
	add r0, sp, #0xd4
	mov r1, #0x100
	bl PreprocessString
	mov r0, r5
	mov r1, #0x20
	mov r2, #0
	add r3, sp, #0xd4
	bl DrawTextInWindow
	ldr r0, _0203CF8C ; =_020AFE70
	ldr r0, [r0]
	ldrsh r0, [r0, #6]
	bl sub_02056410
	cmp r0, #0
	beq _0203CEC8
	ldr r0, _0203CF8C ; =_020AFE70
	ldr r0, [r0]
	ldrsh r0, [r0, #6]
	bl sub_020564B0
	cmp r0, #0
	movne r0, #0x59
	moveq r0, #0x46
	b _0203CEE4
_0203CEC8:
	ldr r0, _0203CF8C ; =_020AFE70
	ldr r0, [r0]
	ldrsh r0, [r0, #6]
	bl sub_02056F60
	cmp r0, #0
	movne r0, #0x44
	moveq r0, #0x57
_0203CEE4:
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r0, sp, #0xd4
	add r1, r4, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldr r1, _0203CF9C ; =_0209C82C
	add r0, sp, #0x44
	add r3, sp, #0xd4
	mov r2, r6
	bl SprintfStatic__0203CFA4
	ldrsh r1, [r4, #4]
	add r0, sp, #0xd4
	bl GetSpeciesString
	ldr r1, _0203CF9C ; =_0209C82C
	add r0, sp, #4
	mov r2, #0x4b
	add r3, sp, #0xd4
	bl SprintfStatic__0203CFA4
	ldr r1, _0203CFA0 ; =_0209C83C
	add r0, sp, #0xd4
	add r2, sp, #0x44
	add r3, sp, #4
	bl SprintfStatic__0203CFA4
	mov r0, r5
	mov r1, #0x4c
	mov r2, #0
	add r3, sp, #0xd4
	bl DrawTextInWindow
	ldrsh r1, [r4, #4]
	add r0, sp, #0xd4
	orr r1, r1, #0x10000
	bl sub_02024D7C
	mov r0, r5
	mov r1, #0xd0
	mov r2, #0
	add r3, sp, #0xd4
	bl DrawTextInWindow
	mov r0, r5
	bl UpdateWindow
_0203CF84:
	add sp, sp, #0x1d4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0203CF8C: .word _020AFE70
_0203CF90: .word TEAM_MEMBER_TABLE_PTR
_0203CF94: .word _0209C820
_0203CF98: .word 0x0000C402
_0203CF9C: .word _0209C82C
_0203CFA0: .word _0209C83C
	arm_func_end sub_0203CE1C

	arm_func_start SprintfStatic__0203CFA4
SprintfStatic__0203CFA4: ; 0x0203CFA4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__0203CFA4

	arm_func_start sub_0203CFCC
sub_0203CFCC: ; 0x0203CFCC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xcc
	sub sp, sp, #0x400
	mov r5, #4
	mov r6, r0
	sub r0, r5, #6
	cmp r6, r0
	beq _0203D3F4
	ldr r1, _0203D400 ; =_020AFE70
	add r0, sp, #4
	ldr r1, [r1]
	ldrsh r1, [r1, #6]
	bl sub_0205B028
	ldr r0, _0203D400 ; =_020AFE70
	ldr r1, _0203D404 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldr r3, [r1]
	ldrsh r2, [r0, #6]
	mov r1, #0x44
	mov r0, r6
	smlabb r4, r2, r1, r3
	bl ClearWindow
	ldrsh r0, [sp, #4]
	mov r1, #0
	bl GetType
	mov r8, r0
	ldrsh r0, [sp, #4]
	mov r1, #1
	bl GetType
	mov r1, r5
	mov r7, r0
	ldr r3, _0203D408 ; =0x00000976
	mov r0, r6
	mov r2, r1
	bl AppendStandardStringToMission
	mov r0, r8
	bl GetTypeStringId
	mov r3, r0
	mov r0, r6
	mov r1, #0x38
	mov r2, r5
	bl AppendStandardStringToMission
	cmp r7, #0
	beq _0203D098
	mov r0, r7
	bl GetTypeStringId
	mov r3, r0
	mov r0, r6
	mov r1, #0x68
	mov r2, r5
	bl AppendStandardStringToMission
_0203D098:
	add r0, r5, #0xc
	mov r1, r0, lsl #0x10
	ldr r2, [sp, #0x30]
	ldr r0, _0203D40C ; =0x00000977
	str r2, [sp, #0xa0]
	mov r5, r1, asr #0x10
	bl StringFromId
	mov r2, r0
	add ip, sp, #0x7c
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0xcc
	mov r0, r6
	mov r1, #4
	mov r2, r5
	bl DrawTextInWindow
	add r0, r5, #0xc
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #0xa4]
	ldr r0, _0203D410 ; =0x00000978
	str r1, [sp, #0xa0]
	bl StringFromId
	add r1, sp, #0x7c
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, r5
	add r3, sp, #0xcc
	bl DrawTextInWindow
	add r0, r5, #0xc
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	ldr r0, _0203D414 ; =0x00000979
	bl StringFromId
	add r1, sp, #0x7c
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, r5
	add r3, sp, #0xcc
	bl DrawTextInWindow
	ldrb r2, [sp, #0x38]
	ldrb r1, [sp, #0x3d]
	ldr r0, _0203D418 ; =0x0000097B
	str r2, [sp, #0xa0]
	cmp r1, #0
	addne r1, r2, r1
	addne r0, r0, #1
	strne r1, [sp, #0xa0]
	bl StringFromId
	mov r2, r0
	add ip, sp, #0x7c
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0xcc
	mov r0, r6
	mov r2, r5
	mov r1, #4
	bl DrawTextInWindow
	ldrb r2, [sp, #0x3a]
	ldrb r1, [sp, #0x3f]
	ldr r0, _0203D41C ; =0x0000097F
	str r2, [sp, #0xa0]
	cmp r1, #0
#ifdef JAPAN
	addne r1, r2, r1
	strne r1, [sp, #0xa0]
	addne r0, r0, #1
#else
	addne r0, r2, r1
	strne r0, [sp, #0xa0]
	movne r0, #0x980
#endif
	bl StringFromId
	mov r2, r0
	add ip, sp, #0x7c
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0xcc
	mov r0, r6
	mov r2, r5
	mov r1, #4
	bl DrawTextInWindow
	add r0, r5, #0xc
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	ldr r0, _0203D420 ; =0x0000097A
	bl StringFromId
	add r1, sp, #0x7c
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, r5
	add r3, sp, #0xcc
	bl DrawTextInWindow
	ldrb r2, [sp, #0x39]
	ldrb r1, [sp, #0x3e]
	ldr r0, _0203D424 ; =0x0000097D
	str r2, [sp, #0xa0]
	cmp r1, #0
	addne r1, r2, r1
	addne r0, r0, #1
	strne r1, [sp, #0xa0]
	bl StringFromId
	mov r2, r0
	add ip, sp, #0x7c
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0xcc
	mov r0, r6
	mov r2, r5
	mov r1, #4
	bl DrawTextInWindow
	ldrb r2, [sp, #0x3b]
	ldrb r1, [sp, #0x40]
	ldr r0, _0203D428 ; =0x00000981
	str r2, [sp, #0xa0]
	cmp r1, #0
	addne r1, r2, r1
	addne r0, r0, #1
	strne r1, [sp, #0xa0]
	bl StringFromId
	mov r2, r0
	add ip, sp, #0x7c
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0xcc
	mov r0, r6
	mov r2, r5
	mov r1, #4
	bl DrawTextInWindow
	ldrsh r0, [sp, #0x42]
	mov r1, #0xa
	str r0, [sp, #0xa0]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	movs r0, r0, asr #0x10
	movmi r0, #0
	bmi _0203D338
	cmp r0, #0x63
	movge r0, #0x63
_0203D338:
	bl sub_0205B0A0
	str r0, [sp, #0xb4]
	ldr r0, _0203D42C ; =0x00000983
	bl StringFromId
	add r1, sp, #0x7c
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0xcc
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	add r0, r5, #0xc
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r0, r6
	mov r1, #4
	mov r2, r5
	add r3, sp, #0xcc
	bl DrawTextInWindow
	ldrsh r0, [r4, #4]
	ldrsh r1, [sp, #0x42]
	bl GetNextIqSkill
	cmp r0, #0
	add r4, sp, #0x7c
	mov r1, #0x400
	bne _0203D3B8
	ldr r2, _0203D430 ; =0x00000986
	add r0, sp, #0xcc
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _0203D3D0
_0203D3B8:
	ldr r2, _0203D434 ; =0x00000985
	str r0, [sp, #0x8c]
	add r0, sp, #0xcc
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
_0203D3D0:
	add r0, r5, #0xc
	mov r1, r0, lsl #0x10
	mov r2, r1, asr #0x10
	add r3, sp, #0xcc
	mov r0, r6
	mov r1, #4
	bl DrawTextInWindow
	mov r0, r6
	bl UpdateWindow
_0203D3F4:
	add sp, sp, #0xcc
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_0203CFCC_OFFSET 0x19D0
#else
#define SUB_0203CFCC_OFFSET 0
#endif
_0203D400: .word _020AFE70
_0203D404: .word TEAM_MEMBER_TABLE_PTR
_0203D408: .word 0x00000976 + SUB_0203CFCC_OFFSET
_0203D40C: .word 0x00000977 + SUB_0203CFCC_OFFSET
_0203D410: .word 0x00000978 + SUB_0203CFCC_OFFSET
_0203D414: .word 0x00000979 + SUB_0203CFCC_OFFSET
_0203D418: .word 0x0000097B + SUB_0203CFCC_OFFSET
_0203D41C: .word 0x0000097F + SUB_0203CFCC_OFFSET
_0203D420: .word 0x0000097A + SUB_0203CFCC_OFFSET
_0203D424: .word 0x0000097D + SUB_0203CFCC_OFFSET
_0203D428: .word 0x00000981 + SUB_0203CFCC_OFFSET
_0203D42C: .word 0x00000983 + SUB_0203CFCC_OFFSET
_0203D430: .word 0x00000986 + SUB_0203CFCC_OFFSET
_0203D434: .word 0x00000985 + SUB_0203CFCC_OFFSET
	arm_func_end sub_0203CFCC

	arm_func_start sub_0203D438
sub_0203D438: ; 0x0203D438
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x3c0
	mov r1, #8
	mov r4, r2
	bl MemAlloc
	ldr r2, _0203D534 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x3c0
	str r0, [r2]
	bl MemZero
	ldr r0, _0203D534 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov ip, #2
	ldr r7, [r0]
	add lr, r7, #0x14
_0203D474:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0203D474
	ldmia r6, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	mov r1, #0
	ldr r0, _0203D534 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	str r1, [r7, #0x10]
	ldr r1, [r0]
	str r5, [r1, #8]
	ldr r1, [r0]
	str r4, [r1, #0xe4]
	ldr r0, [r0]
	add r0, r0, #0x8c
	bl InitPreprocessorArgs
	ldr r0, _0203D534 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0x70000
	ldr r1, [r0]
	str r2, [r1, #0xd8]
	ldr r2, [r0]
	ldrsh r1, [r2, #0x14]
	str r1, [r2, #0x8c]
	ldr r0, [r0]
	add r0, r0, #0x190
	bl InitPortraitParams
	ldr r0, _0203D534 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldrsh r1, [r0, #0x14]
	cmp r1, #0
	beq _0203D4F8
	add r0, r0, #0x190
	bl InitPortraitParamsWithMonsterId
_0203D4F8:
	ldr r1, _0203D534 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r4, #1
	ldr r0, [r1]
	mov r3, #0
	strb r4, [r0, #4]
	ldr r2, [r1]
	mov r0, #1
	strb r4, [r2, #5]
	ldr r2, [r1]
	strb r4, [r2, #6]
	ldr r2, [r1]
	str r3, [r2]
	ldr r1, [r1]
	strb r4, [r1, #0x1a0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0203D534: .word MISSION_REWARD_STRUCT_MAIN_PTR
	arm_func_end sub_0203D438

	arm_func_start sub_0203D538
sub_0203D538: ; 0x0203D538
#ifdef JAPAN
#define SUB_0203D538_STACK_OFFSET -6
#define SUB_0203D538_STACK_OFFSET_2 -8
#else
#define SUB_0203D538_STACK_OFFSET 0
#define SUB_0203D538_STACK_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x11c + SUB_0203D538_STACK_OFFSET_2
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r4, [r1]
	ldr r0, [r4]
	cmp r0, #0x4c
	addls pc, pc, r0, lsl #2
	b _0203EF9C
_0203D558: ; jump table
	b _0203D68C ; case 0
	b _0203D7D4 ; case 1
	b _0203D89C ; case 2
	b _0203D8CC ; case 3
	b _0203D8EC ; case 4
	b _0203D954 ; case 5
	b _0203D984 ; case 6
	b _0203D9A4 ; case 7
	b _0203DA64 ; case 8
	b _0203DAA0 ; case 9
	b _0203DAEC ; case 10
	b _0203DB20 ; case 11
	b _0203DBB0 ; case 12
	b _0203DC68 ; case 13
	b _0203DC98 ; case 14
	b _0203DCB8 ; case 15
	b _0203DD68 ; case 16
	b _0203DDAC ; case 17
	b _0203DE38 ; case 18
	b _0203DE50 ; case 19
	b _0203DE6C ; case 20
	b _0203DEA0 ; case 21
	b _0203DEBC ; case 22
	b _0203DF1C ; case 23
	b _0203DF40 ; case 24
	b _0203DF5C ; case 25
	b _0203DF74 ; case 26
	b _0203DF90 ; case 27
	b _0203DFB0 ; case 28
	b _0203DFD8 ; case 29
	b _0203E10C ; case 30
	b _0203E150 ; case 31
	b _0203E038 ; case 32
	b _0203E0BC ; case 33
	b _0203E0EC ; case 34
	b _0203E198 ; case 35
	b _0203E1DC ; case 36
	b _0203E20C ; case 37
	b _0203E22C ; case 38
	b _0203E274 ; case 39
	b _0203E2A4 ; case 40
	b _0203E2C4 ; case 41
	b _0203E460 ; case 42
	b _0203E490 ; case 43
	b _0203E518 ; case 44
	b _0203E8E8 ; case 45
	b _0203E934 ; case 46
	b _0203E964 ; case 47
	b _0203E984 ; case 48
	b _0203E9A8 ; case 49
	b _0203E9D8 ; case 50
	b _0203E9F8 ; case 51
	b _0203E5B4 ; case 52
	b _0203E61C ; case 53
	b _0203E6B8 ; case 54
	b _0203E6D8 ; case 55
	b _0203E7EC ; case 56
	b _0203E80C ; case 57
	b _0203EA24 ; case 58
	b _0203EAB8 ; case 59
	b _0203EAE8 ; case 60
	b _0203EB08 ; case 61
	b _0203EB64 ; case 62
	b _0203EB94 ; case 63
	b _0203EBB4 ; case 64
	b _0203EC28 ; case 65
	b _0203EC5C ; case 66
	b _0203ECA8 ; case 67
	b _0203ECC4 ; case 68
	b _0203ED34 ; case 69
	b _0203ED50 ; case 70
	b _0203EE14 ; case 71
	b _0203EE30 ; case 72
	b _0203EE68 ; case 73
	b _0203EEBC ; case 74
	b _0203EF78 ; case 75
	b _0203EF94 ; case 76
_0203D68C:
	ldrb r0, [r4, #0x36]
	cmp r0, #0
	beq _0203D6E4
	bl GetEggSpecies
	cmp r0, #0
	bne _0203D6B4
	mov r0, #0x1e
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _0203D73C
_0203D6B4:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r0, #0
	ldr r4, [r1]
	mov r2, #0
	ldr r3, [r4, #0x1c]
	mul r0, r3, r0
	str r0, [r4, #0x1c]
	ldr r0, [r1]
	strb r2, [r0, #0x36]
	ldr r0, [r1]
	strh r2, [r0, #0x38]
	b _0203D73C
_0203D6E4:
	ldrsh r0, [r4, #0x38]
	cmp r0, #0
	beq _0203D73C
	mov r0, #0x1d
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _0203D718
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldrsh r0, [r0, #0x38]
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0203D73C
_0203D718:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0
	ldr r2, [r1]
	sub r0, r3, #1
	strh r3, [r2, #0x38]
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	mul r0, r1, r0
	str r0, [r2, #0x1c]
_0203D73C:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #0x10
	bne _0203D7C0
	mov r0, #0x1f
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _0203D7C0
	mov r5, #0
	mov r4, r5
	ldr sb, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r7, #0
	mov r8, #6
	b _0203D7B0
_0203D778:
	mul r6, r5, r8
	add r0, r1, r6
	ldrsh r0, [r0, #0x28]
	bl GetItemCategory
	cmp r0, #0xf
	bne _0203D7AC
	ldr r0, [sb]
	add r0, r0, r6
	strh r4, [r0, #0x28]
	ldr r2, [sb]
	ldr r0, [r2, #0x1c]
	mul r1, r0, r7
	str r1, [r2, #0x1c]
_0203D7AC:
	add r5, r5, #1
_0203D7B0:
	ldr r1, [sb]
	ldr r0, [r1, #0x20]
	cmp r5, r0
	blt _0203D778
_0203D7C0:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203D7D4:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	movle r0, #7
	strle r0, [r4]
	ble _0203EF9C
	str r0, [r4, #0xb0]
#ifdef JAPAN
	ldr r3, [r1]
	mov r0, #0xa
	ldr r2, [r3, #0x1c]
	mul r0, r2, r0
	str r0, [r3, #0xb4]
	ldr r1, [r1]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0203D890
	cmp r0, #2
	bne _0203DC0C
	ldr r4, _0203E4B4 ; =0x0000245D
	bl sub_0203F00C
	b _0203D864
_0203DC0C:
	cmp r0, #3
	bne _0203DC20
	ldr r4, _0203E89C ; =0x0000245E
	bl sub_0203F00C
	b _0203D864
_0203DC20:
	cmp r0, #4
	ldrne r4, _0203E8A0 ; =0x0000245C
#else
	ldr r4, [r1]
	mov r0, #0xa
	ldr r2, [r4, #0x1c]
	mul r3, r2, r0
	str r3, [r4, #0xb4]
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, #0
	beq _0203D890
	cmp r1, #2
	bne _0203D824
	ldr r4, _0203E4B4 ; =0x00000289
	bl sub_0203F00C
	b _0203D864
_0203D824:
	cmp r1, #3
	bne _0203D838
	add r4, r0, #0x280
	bl sub_0203F00C
	b _0203D864
_0203D838:
	cmp r1, #4
	movne r4, #0x288
#endif
	bne _0203D864
	mov r0, #0
	mov r1, #0x69
	bl LoadScriptVariableValue
#ifdef JAPAN
	add r0, r0, #0x5f
	add r0, r0, #0x2400
#else
	add r0, r0, #0x8b
	add r0, r0, #0x200
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl sub_0203F00C
_0203D864:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203D890:
	mov r0, #4
#ifdef JAPAN
	str r0, [r1]
#else
	str r0, [r2]
#endif
	b _0203EF9C
_0203D89C:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #3
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203D8CC:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #4
	strle r1, [r0]
	b _0203EF9C
_0203D8EC:
	mov r0, #4
	bl sub_02017C50
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl AddMoneyCarried
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #2
	ldreq r1, _0203E4BC ; =0x0000026F
	beq _0203D934
	cmp r0, #3
#ifdef JAPAN
	ldreq r1, _0203E8AC ; =0x00002444
#else
	moveq r1, #0x270
#endif
	beq _0203D934
	cmp r0, #4
	ldreq r1, _0203E4C0 ; =0x00000271
	ldrne r1, _0203E4C4 ; =0x0000026E
_0203D934:
	ldr r0, _0203E4B8 ; =0x0000101C
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203D954:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203D984:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #7
	strle r1, [r0]
	b _0203EF9C
_0203D9A4:
	ldrsh r0, [r4, #0x38]
	cmp r0, #0
	beq _0203D9BC
	ldrb r0, [r4, #0x36]
	cmp r0, #0
	beq _0203D9C8
_0203D9BC:
	mov r0, #0x29
	str r0, [r4]
	b _0203EF9C
_0203D9C8:
	ldrsh r0, [r4, #0x14]
	str r0, [r4, #0x8c]
	ldr r2, [r1]
	ldrsh r0, [r2, #0x38]
	str r0, [r2, #0x90]
	ldr r1, [r1]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0203DA58
	cmp r0, #2
	bne _0203DA00
	ldr r4, _0203E4C8 ; =0x0000029A
	bl sub_0203F00C
	b _0203DA2C
_0203DA00:
	cmp r0, #4
	ldrne r4, _0203E4CC ; =0x00000299
	bne _0203DA2C
	mov r0, #0
	mov r1, #0x69
	bl LoadScriptVariableValue
#ifdef JAPAN
	add r0, r0, #0x6f
	add r0, r0, #0x2400
#else
	add r0, r0, #0x9b
	add r0, r0, #0x200
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl sub_0203F00C
_0203DA2C:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4D0 ; =0x00003008
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DA58:
	mov r0, #0xb
	str r0, [r1]
	b _0203EF9C
_0203DA64:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	mov r0, #0
	ldr r3, _0203E4D4 ; =_0209C884
	mov r2, r0
	mov r1, #0x11
	bl CreateParentMenuFromStringIds
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #9
	ldr r3, [r1]
	strb r0, [r3, #4]
	ldr r0, [r1]
	str r2, [r0]
	b _0203EF9C
_0203DAA0:
	ldrsb r0, [r4, #4]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0203EF9C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r1, [r1]
	str r0, [r1, #0x18c]
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0xa
	ldr r1, [r0]
	str r2, [r1, #0x188]
	ldr r0, [r0]
	str r2, [r0]
	b _0203EF9C
_0203DAEC:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	bgt _0203EF9C
	ldr r1, [r1]
	ldr r0, [r1, #0x18c]
	cmp r0, #0
	moveq r0, #0xb
	streq r0, [r1]
	movne r0, #0x23
	strne r0, [r1]
	b _0203EF9C
_0203DB20:
	ldr r3, _0203E4D8 ; =_0209C846
	add r2, sp, #0x22 + SUB_0203D538_STACK_OFFSET
	mov r1, #4
_0203DB2C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0203DB2C
	ldrsh r1, [r4, #0x38]
	add r0, sp, #0x22 + SUB_0203D538_STACK_OFFSET
	mov r2, #1
	mov r3, #0
	bl sub_02053A0C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	add r1, sp, #0x22 + SUB_0203D538_STACK_OFFSET
	ldr r0, [r0]
	ldr r3, _0203E4DC ; =_0209C844
	str r1, [sp]
	ldrsh r1, [r0, #0x38]
	add r0, r0, #0x40
	mov r2, #0
	bl sub_02052E2C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	add r0, r0, #0x40
	bl sub_02055D4C
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r1]
	str r0, [r2, #0x3b8]
	ldr r1, [r1]
	ldr r0, [r1, #0x3b8]
	cmp r0, #0
	movne r0, #0xc
	strne r0, [r1]
	moveq r0, #0x1e
	streq r0, [r1]
	b _0203EF9C
_0203DBB0:
	ldr r0, [r4, #0x18]
	cmp r0, #1
	ble _0203DBD0
	mov r1, r0, lsl #0x10
	ldr r0, [r4, #0x3b8]
	mov r1, r1, asr #0x10
	mov r2, #1
	bl ApplyLevelUpBoostsToGroundMonster
_0203DBD0:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r0]
	ldrsh r1, [r2, #0x38]
	str r1, [r2, #0x8c]
	ldr r4, [r0]
	ldr r0, [r4, #8]
	cmp r0, #2
	bne _0203DC18
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r1, _0203E4E0 ; =0x0000027A
	add r2, r4, #0x8c
	bl sub_02046BE8
	bl sub_0203F00C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DC18:
	cmp r0, #4
	movne r0, #0xf
	strne r0, [r4]
	bne _0203EF9C
	mov r0, #0
	mov r1, #0x69
	bl LoadScriptVariableValue
#ifdef JAPAN
	add r0, r0, #0x4f
	add r0, r0, #0x2400
#else
	add r0, r0, #0x7b
	add r0, r0, #0x200
#endif
	mov r1, r0, lsl #0x10
	ldr r0, _0203E4B8 ; =0x0000101C
	mov r1, r1, lsr #0x10
	add r2, r4, #0x8c
	bl sub_02046BE8
	bl sub_0203F00C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DC68:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0xe
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DC98:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0xf
	strle r1, [r0]
	b _0203EF9C
_0203DCB8:
	ldrsh r1, [r4, #0x38]
	add r0, r4, #0xb5
	add r0, r0, #0x200
	mov r2, #0x4e
	bl GetNameWithGender
	ldr r3, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4E4 ; =0x0000100C
	ldr r4, [r3]
	ldr r1, _0203E4E8 ; =0x000002A6
	add r2, r4, #0xb5
	add r2, r2, #0x200
	str r2, [r4, #0xc4]
	ldr r2, [r3]
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
#ifndef JAPAN
	mov r2, #0xa
#endif
	ldr r0, [r0]
	ldr r1, [r0, #0x3b8]
	add r0, r0, #0xa1
	add r0, r0, #0x100
	add r1, r1, #0x3a
#ifdef JAPAN
	bl StrcpySimple
#else
	bl StrncpySimple
#endif
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, [r0, #0x3b8]
	add r0, r0, #0xab
	add r0, r0, #0x100
	add r1, r1, #0x3a
	bl MemcpySimple
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0xa
	ldr r1, [r0]
	add r0, r1, #0xb5
	add r0, r0, #0x100
	add r1, r1, #0xab
	add r1, r1, #0x100
	bl StrncpySimpleNoPadSafe
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x10
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DD68:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	ldr r0, _0203E4EC ; =_0209C85C
	mov r4, #2
	ldr r1, _0203E4F0 ; =0x00300011
	ldr r3, _0203E4F4 ; =_0209C86C
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0x11
	ldr r3, [r1]
	strb r0, [r3, #0x1a0]
	ldr r0, [r1]
	str r2, [r0]
	b _0203EF9C
_0203DDAC:
	add r0, r4, #0x100
	ldrsb r0, [r0, #0xa0]
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _0203EF9C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0xa0]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0xa0]
	bl CloseSimpleMenu
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1a0]
	bl sub_02046D20
	cmp r4, #0
	beq _0203DE10
	cmp r4, #1
	b _0203DE24
_0203DE10:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DE24:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DE38:
	bl ov11_0230D92C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x13
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DE50:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x14
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DE6C:
	add r0, r4, #0xab
	add r2, r4, #0xa1
	add r1, r0, #0x100
	add r3, r2, #0x100
	mov r0, #2
	mov r2, #0
	bl ShowKeyboard
	bl ov11_02310BDC
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DEA0:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x16
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DEBC:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0203EF9C
	bl GetKeyboardStringResult
	ldr r2, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	add r0, r0, #0xab
	add r0, r0, #0x100
	bl MemcpySimple
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0xa
	ldr r1, [r0]
	add r0, r1, #0xb5
	add r1, r1, #0xab
	add r0, r0, #0x100
	add r1, r1, #0x100
	bl StrncpySimpleNoPadSafe
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DF1C:
	bl sub_02037468
	cmp r0, #0
	beq _0203EF9C
	bl ov11_0230D92C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x18
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DF40:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x19
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DF5C:
	bl ov11_0230D92C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DF74:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x1b
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DF90:
	add r0, r4, #0xb5
	add r0, r0, #0x100
	bl sub_0203909C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x1c
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DFB0:
	bl sub_0203931C
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r1]
	str r0, [r2, #0x3bc]
	ldr r1, [r1]
	ldr r0, [r1, #0x3bc]
	cmp r0, #0
	movge r0, #0x1d
	strge r0, [r1]
	b _0203EF9C
_0203DFD8:
	bl sub_02039218
	cmp r0, #0
	beq _0203EF9C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x3bc]
	cmp r0, #0
	beq _0203E000
	cmp r0, #1
	b _0203E02C
_0203E000:
	ldr r0, [r1, #0x3b8]
	add r1, r1, #0xab
	add r0, r0, #0x3a
	add r1, r1, #0x100
	mov r2, #0xa
	bl MemcpySimple
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E02C:
	mov r0, #0x12
	str r0, [r1]
	b _0203EF9C
_0203E038:
	ldrsh r0, [r4, #0x38]
	mov r2, #0xa
	orr r0, r0, #0x80000
	str r0, [r4, #0x8c]
	ldr r1, [r1]
	add r0, r1, #0xb5
	add r1, r1, #0xab
	add r0, r0, #0x100
	add r1, r1, #0x100
	bl StrncpySimpleNoPadSafe
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r1]
	add r0, r2, #0xb5
	add r0, r0, #0x100
	str r0, [r2, #0xc4]
	ldr r0, [r1]
	ldr r0, [r0, #8]
	cmp r0, #2
	ldreq r4, _0203E4F8 ; =0x00000283
	mov r0, #5
	ldrne r4, _0203E4FC ; =0x00000281
	bl sub_02017C50
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E0BC:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x22
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E0EC:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x29
	strle r1, [r0]
	b _0203EF9C
_0203E10C:
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r1, [r0]
	ldr r0, [r1, #8]
	sub r0, r0, #2
	cmp r0, #1
	add r0, r1, #0x40
	bhi _0203E138
	mov r1, #1
	bl ov11_023061E4
	b _0203E13C
_0203E138:
	bl ov11_023061CC
_0203E13C:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x1f
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E150:
	bl ov11_02306C9C
	cmp r0, #3
	cmpne r0, #4
	bne _0203EF9C
	bl ov11_02306C64
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x23
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0203EF9C
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r2, #0xc
	ldr r3, [r1]
	str r0, [r3, #0x3b8]
	ldr r0, [r1]
	str r2, [r0]
	b _0203EF9C
_0203E198:
	ldrsh r1, [r4, #0x38]
	add r0, r4, #0xe8
	bl GetNameRaw
	ldr r2, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r4, [r2]
#ifdef JAPAN
	ldr r1, _0203E8F0 ; =0x00002458
#else
	mov r1, #0x284
#endif
	add r3, r4, #0xe8
	str r3, [r4, #0xc4]
	ldr r2, [r2]
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x24
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E1DC:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E20C:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x26
	strle r1, [r0]
	b _0203EF9C
_0203E22C:
	mov r0, #4
	bl sub_02017C50
	mov r0, #0x3e8
	bl AddMoneyCarried
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0x3e8
	ldr r2, [r1]
	ldr r0, _0203E4B8 ; =0x0000101C
	str r3, [r2, #0xb0]
	ldr r2, [r1]
	ldr r1, _0203E500 ; =0x00000285
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x27
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E274:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x28
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E2A4:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x29
	strle r1, [r0]
	b _0203EF9C
_0203E2C4:
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	movge r0, #0x3a
	strge r0, [r4]
	bge _0203EF9C
	mov r0, #6
	mla r0, r1, r0, r4
	ldrsh r0, [r0, #0x28]
	mov r1, #0
	strh r0, [sp, #0x20 + SUB_0203D538_STACK_OFFSET]
	strb r1, [sp, #0x1c + SUB_0203D538_STACK_OFFSET]
	bl IsStorableItem
	cmp r0, #0
	beq _0203E44C
	ldrsh r0, [sp, #0x20 + SUB_0203D538_STACK_OFFSET]
	bl IsThrownItem
	cmp r0, #0
	bne _0203E328
	ldrsh r1, [sp, #0x20 + SUB_0203D538_STACK_OFFSET]
	cmp r1, #0x16c
	blt _0203E348
	ldr r0, _0203E504 ; =0x0000018F
	cmp r1, r0
	bgt _0203E348
_0203E328:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r0, #6
	ldr r2, [r1]
	ldr r1, [r2, #0x10]
	mla r0, r1, r0, r2
	ldrh r0, [r0, #0x26]
	strh r0, [sp, #0x1e + SUB_0203D538_STACK_OFFSET]
	b _0203E350
_0203E348:
	mov r0, #0
	strh r0, [sp, #0x1e + SUB_0203D538_STACK_OFFSET]
_0203E350:
	ldr r3, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r0, #1
	ldr r6, [r3]
	strb r0, [sp, #0x1c + SUB_0203D538_STACK_OFFSET]
	ldr r1, [r6, #0x10]
	mov r0, #6
	mla r5, r1, r0, r6
	ldrh r0, [sp, #0x1c + SUB_0203D538_STACK_OFFSET]
	mov r4, #0
	ldr r2, _0203E508 ; =_0209C850
	strh r0, [r5, #0x24]
	ldrh r0, [sp, #0x1e + SUB_0203D538_STACK_OFFSET]
	add r1, sp, #0x1c + SUB_0203D538_STACK_OFFSET
	strh r0, [r5, #0x26]
	ldrh r0, [sp, #0x20 + SUB_0203D538_STACK_OFFSET]
	strh r0, [r5, #0x28]
	ldrsh r0, [sp, #0x20 + SUB_0203D538_STACK_OFFSET]
	str r0, [r6, #0x9c]
	ldr r0, [r3]
	str r4, [r0, #0xb0]
	ldr r0, [r3]
	add r0, r0, #0xe8
	bl MaybeGetColoredFormattedItemName
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r0]
	add r1, r2, #0xe8
	str r1, [r2, #0xc4]
	ldr r2, [r0]
	ldrsh r1, [r2, #0x14]
	str r1, [r2, #0x8c]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0203E440
	cmp r0, #2
	bne _0203E3EC
	ldr r4, _0203E50C ; =0x00000296
	bl sub_0203F00C
	b _0203E414
_0203E3EC:
	cmp r0, #3
	bne _0203E400
	ldr r4, _0203E510 ; =0x00000297
	bl sub_0203F00C
	b _0203E414
_0203E400:
	cmp r0, #4
	ldrne r4, _0203E514 ; =0x00000295
	bne _0203E414
#ifdef JAPAN
	ldr r4, _0203E90C ; =0x0000246C
#else
	mov r4, #0x298
#endif
	bl sub_0203F00C
_0203E414:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x2a
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E440:
	mov r0, #0x2c
	str r0, [r1]
	b _0203EF9C
_0203E44C:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x33
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E460:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x2b
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E490:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x2c
	strle r1, [r0]
	b _0203EF9C
	.align 2, 0
#ifdef JAPAN
#define SUB_0203D538_DATA_OFFSET 0x21D4
#else
#define SUB_0203D538_DATA_OFFSET 0
#endif
_0203E4B0: .word MISSION_REWARD_STRUCT_MAIN_PTR
_0203E4B4: .word 0x00000289 + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203E89C: .word 0x0000245E
_0203E8A0: .word 0x0000245C
#endif
_0203E4B8: .word 0x0000101C
_0203E4BC: .word 0x0000026F + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203E8AC: .word 0x00002444
#endif
_0203E4C0: .word 0x00000271 + SUB_0203D538_DATA_OFFSET
_0203E4C4: .word 0x0000026E + SUB_0203D538_DATA_OFFSET
_0203E4C8: .word 0x0000029A + SUB_0203D538_DATA_OFFSET
_0203E4CC: .word 0x00000299 + SUB_0203D538_DATA_OFFSET
_0203E4D0: .word 0x00003008
_0203E4D4: .word _0209C884
_0203E4D8: .word _0209C846
_0203E4DC: .word _0209C844
_0203E4E0: .word 0x0000027A + SUB_0203D538_DATA_OFFSET
_0203E4E4: .word 0x0000100C
_0203E4E8: .word 0x000002A6 + SUB_0203D538_DATA_OFFSET
_0203E4EC: .word _0209C85C
_0203E4F0: .word 0x00300011
_0203E4F4: .word _0209C86C
_0203E4F8: .word 0x00000283 + SUB_0203D538_DATA_OFFSET
_0203E4FC: .word 0x00000281 + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203E8F0: .word 0x00002458
#endif
_0203E500: .word 0x00000285 + SUB_0203D538_DATA_OFFSET
_0203E504: .word 0x0000018F
_0203E508: .word _0209C850
_0203E50C: .word 0x00000296 + SUB_0203D538_DATA_OFFSET
_0203E510: .word 0x00000297 + SUB_0203D538_DATA_OFFSET
_0203E514: .word 0x00000295 + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203E90C: .word 0x0000246C
#endif
_0203E518:
	ldr r1, [r4, #0x10]
	add r2, r4, #0x24
	mov r0, #6
	mla r0, r1, r0, r2
	bl AddItemToStorage
	cmp r0, #0
	beq _0203E5A0
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #2
	bne _0203E550
	mov r0, #4
	bl sub_02017C50
_0203E550:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r0]
	ldr r0, [r2, #0xe4]
	tst r0, #4
	bne _0203E588
	ldr r1, _0203EFA8 ; =0x00000273
	add r2, r2, #0x8c
	mov r0, #0x1c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E588:
	tst r0, #8
	movne r0, #0x30
	strne r0, [r2]
	moveq r0, #0x33
	streq r0, [r2]
	b _0203EF9C
_0203E5A0:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x34
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E5B4:
	ldr r2, [r4, #0x10]
	mov r0, #6
	mla r1, r2, r0, r4
	ldrsh r2, [r1, #0x28]
	mov r1, #0
	strh r2, [sp, #0x1a + SUB_0203D538_STACK_OFFSET]
	ldr r2, [r4, #0x10]
	mla r0, r2, r0, r4
	ldrh r0, [r0, #0x26]
	strh r0, [sp, #0x18 + SUB_0203D538_STACK_OFFSET]
	strb r1, [sp, #0x16 + SUB_0203D538_STACK_OFFSET]
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #1
	moveq r1, #1
	movne r1, #0
	add r0, sp, #0x16 + SUB_0203D538_STACK_OFFSET
	and r1, r1, #0xff
	bl InitUnkStorageStruct0x410
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x35
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E61C:
	bl sub_02046028
	cmp r0, #2
	beq _0203E658
	cmp r0, #3
	beq _0203E688
	cmp r0, #4
	bne _0203EF9C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x2d
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E658:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	add r0, r0, #0xde
	bl sub_02045FD0
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x36
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E688:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	add r0, r0, #0xde
	bl sub_02045FD0
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x38
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E6B8:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x37
	strle r1, [r0]
	b _0203EF9C
_0203E6D8:
	ldr r1, [r4, #0x10]
	add r2, r4, #0x24
	mov r0, #6
	mla r0, r1, r0, r2
	bl AddItemToStorage
	cmp r0, #0
	beq _0203E7D8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #2
	bne _0203E710
	mov r0, #4
	bl sub_02017C50
_0203E710:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #6
	ldr r5, [r0]
	mov r6, #0
	ldr r4, [r5, #0x10]
	ldr r2, _0203E508 ; =_0209C850
	mla r3, r4, r1, r5
	ldrsh r3, [r3, #0x28]
	str r3, [r5, #0x9c]
	ldr r3, [r0]
	str r6, [r3, #0xb0]
	ldr r4, [r0]
	ldrsh r3, [r4, #0xdc]
	str r3, [r4, #0xa4]
	ldr r3, [r0]
	str r6, [r3, #0xb8]
	ldr r5, [r0]
	ldrsh r3, [r5, #0xe2]
	add r4, r5, #0x24
	add r0, r5, #0xe8
	strh r3, [sp, #0x14 + SUB_0203D538_STACK_OFFSET]
	ldrh r3, [r5, #0xe0]
	strb r6, [sp, #0x10 + SUB_0203D538_STACK_OFFSET]
	strh r3, [sp, #0x12 + SUB_0203D538_STACK_OFFSET]
	ldr r3, [r5, #0x10]
	mla r1, r3, r1, r4
	bl MaybeGetColoredFormattedItemName
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, _0203E508 ; =_0209C850
	ldr r0, [r0]
	add r1, sp, #0x10 + SUB_0203D538_STACK_OFFSET
	add r0, r0, #0x138
	bl MaybeGetColoredFormattedItemName
	ldr r2, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r4, [r2]
	ldr r1, _0203EFAC ; =0x00000275
	add r3, r4, #0x138
	str r3, [r4, #0xcc]
	ldr r4, [r2]
	add r3, r4, #0xe8
	str r3, [r4, #0xc4]
	ldr r2, [r2]
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E7D8:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x34
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E7EC:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x39
	strle r1, [r0]
	b _0203EF9C
_0203E80C:
	ldr r1, [r4, #0x10]
	add r2, r4, #0x24
	mov r0, #6
	mla r0, r1, r0, r2
	bl AddItemToStorage
	cmp r0, #0
	beq _0203E8D4
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #2
	bne _0203E844
	mov r0, #4
	bl sub_02017C50
_0203E844:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r0, #6
	ldr r6, [r1]
	mov r5, #0
	ldr r4, [r6, #0x10]
	ldr r2, _0203E508 ; =_0209C850
	mla r3, r4, r0, r6
	ldrsh r3, [r3, #0x28]
	str r3, [r6, #0x9c]
	ldr r3, [r1]
	str r5, [r3, #0xb0]
	ldr r4, [r1]
	ldrsh r3, [r4, #0xdc]
	str r3, [r4, #0xa4]
	ldr r3, [r1]
	str r5, [r3, #0xb8]
	ldr r4, [r1]
	ldr r3, [r4, #0x10]
	add r1, r4, #0x24
	mla r1, r3, r0, r1
	add r0, r4, #0xe8
	bl MaybeGetColoredFormattedItemName
	ldr r2, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r4, [r2]
	ldr r1, _0203EFB0 ; =0x00000277
	add r3, r4, #0xe8
	str r3, [r4, #0xc4]
	ldr r2, [r2]
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E8D4:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x34
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E8E8:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	bgt _0203EF9C
	ldr r2, [r1]
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r1, _0203EFB4 ; =0x00000286
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	add r0, r0, #0xde
	bl sub_02045FD0
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E934:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x2f
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E964:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x33
	strle r1, [r0]
	b _0203EF9C
_0203E984:
	ldr r0, _0203E4B8 ; =0x0000101C
#ifdef JAPAN
	ldr r1, _0203F34C_JP ; =0x00002FEC
	add r2, r4, #0x8c
#else
	add r2, r4, #0x8c
	mov r1, #0x2cc
#endif
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x31
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E9A8:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x32
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E9D8:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x33
	strle r1, [r0]
	b _0203EF9C
_0203E9F8:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r1]
	ldr r0, [r1, #0x10]
	cmp r0, #3
	movlt r0, #0x29
	strlt r0, [r1]
	movge r0, #0x3a
	strge r0, [r1]
	b _0203EF9C
_0203EA24:
	ldrb r0, [r4, #0x36]
	cmp r0, #0
	moveq r0, #0x40
	streq r0, [r4]
	beq _0203EF9C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0203EAAC
	cmp r0, #2
	bne _0203EA58
	ldr r4, _0203EFB8 ; =0x00000292
	bl sub_0203F00C
	b _0203EA80
_0203EA58:
	cmp r0, #3
	bne _0203EA6C
	ldr r4, _0203EFBC ; =0x00000293
	bl sub_0203F00C
	b _0203EA80
_0203EA6C:
	cmp r0, #4
	ldrne r4, _0203EFC0 ; =0x00000291
	bne _0203EA80
#ifdef JAPAN
	ldr r4, _0203F35C_JP ; =0x00002468
#else
	mov r4, #0x294
#endif
	bl sub_0203F00C
_0203EA80:
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x3b
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EAAC:
	mov r0, #0x3d
	str r0, [r4]
	b _0203EF9C
_0203EAB8:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x3c
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EAE8:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x3d
	strle r1, [r0]
	b _0203EF9C
_0203EB08:
	mov r0, #5
	bl sub_02017C50
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldrsh r0, [r0, #0x38]
	bl SetEggSpecies
	mov r0, #4
	bl RandIntSafe
	add r0, r0, #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SetEggHatchTimer
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	ldr r1, _0203EFC4 ; =0x00000272
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x3e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EB64:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x3f
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EB94:
	ldr r2, [r4, #0x188]
	sub r0, r2, #1
	str r0, [r4, #0x188]
	cmp r2, #0
	ldrle r0, [r1]
	movle r1, #0x40
	strle r1, [r0]
	b _0203EF9C
_0203EBB4:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	moveq r0, #0x4c
	streq r0, [r4]
	beq _0203EF9C
	add r0, sp, #0xcc + SUB_0203D538_STACK_OFFSET_2
	bl InitPreprocessorArgs
	bl GetRank
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r1]
	strb r0, [r2, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0x3c]
	bl sub_02050C10
	mov r0, #4
	bl sub_02017C50
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	ldr r1, _0203EFC8 ; =0x000002A1
	ldr r3, [r2, #0x3c]
	add r2, sp, #0xcc + SUB_0203D538_STACK_OFFSET_2
	str r3, [sp, #0xf0 + SUB_0203D538_STACK_OFFSET_2]
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x41
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EC28:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r4, [r0]
	bl GetRank
	ldrb r1, [r4, #0xc]
	cmp r1, r0
	movne r0, #0x42
	strne r0, [r4]
	moveq r0, #0x4c
	streq r0, [r4]
	b _0203EF9C
_0203EC5C:
	mov r0, #2
	bl sub_02017C50
	add r0, sp, #0x7c + SUB_0203D538_STACK_OFFSET_2
	bl InitPreprocessorArgs
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	str r0, [sp, #0x94 + SUB_0203D538_STACK_OFFSET_2]
	bl GetRank
	str r0, [sp, #0x98 + SUB_0203D538_STACK_OFFSET_2]
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r1, _0203EFCC ; =0x000002A2
	add r2, sp, #0x7c + SUB_0203D538_STACK_OFFSET_2
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x43
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203ECA8:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	movne r1, #0x44
	ldrne r0, [r0]
	strne r1, [r0]
	b _0203EF9C
_0203ECC4:
	add r0, sp, #0x2c + SUB_0203D538_STACK_OFFSET_2
	bl InitPreprocessorArgs
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	bl GetRankUpEntry
	ldr r0, [r0, #8]
	str r0, [sp, #0x50 + SUB_0203D538_STACK_OFFSET_2]
	bl GetRank
	bl GetRankUpEntry
	ldr r1, [r0, #8]
	ldr r0, [sp, #0x50 + SUB_0203D538_STACK_OFFSET_2]
	str r1, [sp, #0x54 + SUB_0203D538_STACK_OFFSET_2]
	cmp r0, r1
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x46
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0203EF9C
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r1, _0203EFD0 ; =0x000002A3
	add r2, sp, #0x2c + SUB_0203D538_STACK_OFFSET_2
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x45
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203ED34:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	movne r1, #0x46
	ldrne r0, [r0]
	strne r1, [r0]
	b _0203EF9C
_0203ED50:
	bl GetRank
	bl GetRankUpEntry
	ldrsh r0, [r0, #0xc]
	strh r0, [r4, #0x88]
	cmp r0, #0
	bne _0203ED80
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x4c
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203ED80:
	bl IsStorableItem
	cmp r0, #0
	beq _0203EDFC
	ldrsh r0, [r4, #0x88]
	bl IsThrownItem
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r4, #0x86]
	mov r0, #1
	strb r0, [r4, #0x84]
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldrsh r3, [r4, #0x88]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x9c]
	ldr r1, [r0]
	mov r0, #4
	str r2, [r1, #0xb0]
	bl sub_02017C50
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
#ifdef JAPAN
	ldr r1, _0203F370 ; =0x00002478
#else
	mov r1, #0x2a4
#endif
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x47
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EDFC:
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x4c
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EE14:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	movne r1, #0x48
	ldrne r0, [r0]
	strne r1, [r0]
	b _0203EF9C
_0203EE30:
	add r0, r4, #0x84
	bl AddItemToStorage
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	moveq r1, #0x49
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0203EF9C
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x4c
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EE68:
	ldrsh r1, [r4, #0x88]
	mov r0, #0
	strh r1, [sp, #0xe + SUB_0203D538_STACK_OFFSET]
	ldrh r1, [r4, #0x86]
	strh r1, [sp, #0xc + SUB_0203D538_STACK_OFFSET]
	strb r0, [sp, #0xa + SUB_0203D538_STACK_OFFSET]
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #1
	moveq r1, #1
	movne r1, #0
	add r0, sp, #0xa + SUB_0203D538_STACK_OFFSET
	and r1, r1, #0xff
	bl InitUnkStorageStruct0x410
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x4a
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EEBC:
	bl sub_02046028
#ifdef JAPAN
	cmp r0, #2
	cmpne r0, #3
	beq _0203EF64
	cmp r0, #4
	bne _0203EF9C
	ldr r1, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	ldr r1, _0203EFB4 ; =0x0000245A
#else
	mov r4, r0
	cmp r4, #1
	beq _0203EF9C
	add r0, sp, #4
	bl sub_02045FD0
	ldrsh r0, [sp, #8]
	cmp r0, #0
	bne _0203EF00
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r1, [r0]
	ldrh r0, [r1, #0x84]
	strh r0, [sp, #4]
	ldrh r0, [r1, #0x86]
	strh r0, [sp, #6]
	ldrh r0, [r1, #0x88]
	strh r0, [sp, #8]
_0203EF00:
	cmp r4, #2
	cmpne r4, #3
	beq _0203EF64
	cmp r4, #4
	bne _0203EF9C
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, _0203E508 ; =_0209C850
	ldr r0, [r0]
	add r1, sp, #4
	add r0, r0, #0xe8
	bl MaybeGetColoredFormattedItemName
	ldr r2, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r4, [r2]
	ldr r1, _0203EFB4 ; =0x00000286
	add r3, r4, #0xe8
	str r3, [r4, #0xc4]
	ldr r2, [r2]
#endif
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x4b
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EF64:
	ldr r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0x48
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EF78:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	movne r1, #0x4c
	ldrne r0, [r0]
	strne r1, [r0]
	b _0203EF9C
_0203EF94:
	mov r0, #1
	b _0203EFA0
_0203EF9C:
	mov r0, #0
_0203EFA0:
	add sp, sp, #0x11c + SUB_0203D538_STACK_OFFSET_2
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0203EFA8: .word 0x00000273 + SUB_0203D538_DATA_OFFSET
_0203EFAC: .word 0x00000275 + SUB_0203D538_DATA_OFFSET
_0203EFB0: .word 0x00000277 + SUB_0203D538_DATA_OFFSET
_0203EFB4: .word 0x00000286 + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203F34C_JP: .word 0x00002FEC
#endif
_0203EFB8: .word 0x00000292 + SUB_0203D538_DATA_OFFSET
_0203EFBC: .word 0x00000293 + SUB_0203D538_DATA_OFFSET
_0203EFC0: .word 0x00000291 + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203F35C_JP: .word 0x00002468
#endif
_0203EFC4: .word 0x00000272 + SUB_0203D538_DATA_OFFSET
_0203EFC8: .word 0x000002A1 + SUB_0203D538_DATA_OFFSET
_0203EFCC: .word 0x000002A2 + SUB_0203D538_DATA_OFFSET
_0203EFD0: .word 0x000002A3 + SUB_0203D538_DATA_OFFSET
#ifdef JAPAN
_0203F370: .word 0x00002478
#endif
	arm_func_end sub_0203D538

	arm_func_start FreeMissionRewardStructMain
FreeMissionRewardStructMain: ; 0x0203EFD4
	stmdb sp!, {r3, lr}
	ldr r0, _0203F008 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MissionRewardCloseAllBoxes
	ldr r0, _0203F008 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0203F008 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F008: .word MISSION_REWARD_STRUCT_MAIN_PTR
	arm_func_end FreeMissionRewardStructMain

	arm_func_start sub_0203F00C
sub_0203F00C: ; 0x0203F00C
	stmdb sp!, {r3, lr}
	ldr r1, _0203F058 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #6]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0203F058 ; =MISSION_REWARD_STRUCT_MAIN_PTR
	ldr r2, [r1]
	strb r0, [r2, #6]
	ldr r1, [r1]
	ldrsb r0, [r1, #6]
	add r1, r1, #0x190
	bl ShowPortraitInPortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F058: .word MISSION_REWARD_STRUCT_MAIN_PTR
	arm_func_end sub_0203F00C

	arm_func_start MissionRewardCloseAllBoxes
MissionRewardCloseAllBoxes: ; 0x0203F05C
	stmdb sp!, {r3, lr}
	ldr r0, _0203F0EC ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _0203F08C
	bl CloseParentMenu
	ldr r0, _0203F0EC ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_0203F08C:
	ldr r0, _0203F0EC ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	beq _0203F0B8
	bl CloseDialogueBox
	ldr r0, _0203F0EC ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
_0203F0B8:
	ldr r0, _0203F0EC ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _0203F0E4
	bl ClosePortraitBox
	ldr r0, _0203F0EC ; =MISSION_REWARD_STRUCT_MAIN_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
_0203F0E4:
	bl sub_02046D20
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F0EC: .word MISSION_REWARD_STRUCT_MAIN_PTR
	arm_func_end MissionRewardCloseAllBoxes

	arm_func_start sub_0203F0F0
sub_0203F0F0: ; 0x0203F0F0
	stmdb sp!, {r4, lr}
	ldr r1, _0203F148 ; =_020AFE78
	ldr r2, _0203F14C ; =_0209C89C
	ldr r3, [r1]
	mov r4, r0
	ldrsh r1, [r3, #0xc]
	add r0, r3, #0xdc
	add r1, r3, r1, lsl #2
	ldr r1, [r1, #0x14]
	mov r1, r1, lsl #1
	ldrh r1, [r2, r1]
	bl GetStringFromFileVeneer
	ldr r0, _0203F148 ; =_020AFE78
	mov r3, r4
	ldr r4, [r0]
	ldrsh r0, [r4, #0xc]
	add r1, r4, #0x64
	add r2, r4, #0x30
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x14]
	bl sub_0205A4B4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203F148: .word _020AFE78
_0203F14C: .word _0209C89C
	arm_func_end sub_0203F0F0

	arm_func_start sub_0203F150
sub_0203F150: ; 0x0203F150
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa0
	mov r6, r0
	mov r5, r1
	mov r0, #0xfc
	mov r1, #8
	bl MemAlloc
	ldr r2, _0203F340 ; =_020AFE78
	mvn r1, #1
	str r0, [r2]
	mov ip, #0
	strb r1, [r0]
	mov r0, ip
_0203F184:
	add r1, ip, #1
	ldr r3, [r2]
	mov r1, r1, lsl #0x10
	add r3, r3, ip, lsl #2
	mov ip, r1, asr #0x10
	str r0, [r3, #0x14]
	cmp ip, #6
	blt _0203F184
	ldr r3, _0203F344 ; =_0209C8C8
	ldr r2, _0203F340 ; =_020AFE78
	mov r1, #0x18
	ldr ip, [r2]
	mla r1, r5, r1, r3
	strh r0, [ip, #0xe]
	b _0203F1E0
_0203F1C0:
	ldr r0, [r2]
	ldr r3, [r1, lr, lsl #2]
	add r0, r0, lr, lsl #2
	str r3, [r0, #0x14]
	ldr r3, [r2]
	ldrsh r0, [r3, #0xe]
	add r0, r0, #1
	strh r0, [r3, #0xe]
_0203F1E0:
	ldr ip, [r2]
	ldrsh lr, [ip, #0xe]
	cmp lr, #6
	bge _0203F1FC
	ldr r0, [r1, lr, lsl #2]
	cmp r0, #0
	bne _0203F1C0
_0203F1FC:
	mov r3, #0
	strh r3, [ip, #0xc]
	ldr r0, _0203F340 ; =_020AFE78
	sub r2, r3, #1
	ldr r1, [r0]
	mov ip, #1
	strh r2, [r1, #0x10]
	ldr r1, [r0]
	strh r3, [r1, #0x12]
	ldr r2, [r0]
	mov r1, r6
	strb ip, [r2, #0x2c]
	ldr r3, [r0]
	mov r2, #0x78
	str r5, [r3, #4]
	ldr r3, [r0]
	str ip, [r3, #8]
	ldr r0, [r0]
	add r0, r0, #0x64
	bl memcpy
	ldr r0, _0203F340 ; =_020AFE78
	ldr r1, _0203F348 ; =0x00000975
	ldr r3, [r0]
	mov r0, #0x10
	str r0, [sp, #0x14]
	strh r1, [sp, #0x10]
	ldrsh r2, [r3, #0xc]
	add r0, r3, #0xdc
	mov r1, #0xc
	str r1, [sp, #0xc]
	str r0, [sp, #0x50]
	str r2, [sp, #8]
	ldrsh r2, [r3, #0xc]
	ldr r1, _0203F34C ; =_0209C89C
	add r2, r3, r2, lsl #2
	ldr r2, [r2, #0x14]
	mov r2, r2, lsl #1
	ldrh r1, [r1, r2]
	bl GetStringFromFileVeneer
	ldr r0, _0203F340 ; =_020AFE78
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0203F324
_0203F2B0: ; jump table
	b _0203F2C0 ; case 0
	b _0203F2C0 ; case 1
	b _0203F2FC ; case 2
	b _0203F2FC ; case 3
_0203F2C0:
	cmp r0, #1
	ldrsh r4, [r2, #0xe]
	ldreq r1, _0203F350 ; =0x60481C3B
	ldr r0, _0203F354 ; =_0209C8A8
	str r4, [sp]
	mov r4, #1
	ldrne r1, _0203F358 ; =0x60489C3B
	ldr r3, _0203F35C ; =sub_0203F0F0
	add r2, sp, #8
	str r4, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _0203F360 ; =sub_0203F928
	mov r4, r0
	bl SetUnkAdvancedTextBoxWindowFn
	b _0203F324
_0203F2FC:
	ldrsh r4, [r2, #0xe]
	ldr r0, _0203F354 ; =_0209C8A8
	ldr r1, _0203F364 ; =0x60089C3B
	str r4, [sp]
	mov r4, #1
	ldr r3, _0203F35C ; =sub_0203F0F0
	add r2, sp, #8
	str r4, [sp, #4]
	bl CreateAdvancedTextBox
	mov r4, r0
_0203F324:
	ldr r0, _0203F340 ; =_020AFE78
	ldr r1, [r0]
	strb r4, [r1]
	ldr r0, [r0]
	ldrsb r0, [r0]
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0203F340: .word _020AFE78
_0203F344: .word _0209C8C8
#ifdef JAPAN
_0203F348: .word 0x00002345
#else
_0203F348: .word 0x00000975
#endif
_0203F34C: .word _0209C89C
_0203F350: .word 0x60481C3B
_0203F354: .word _0209C8A8
_0203F358: .word 0x60489C3B
_0203F35C: .word sub_0203F0F0
_0203F360: .word sub_0203F928
_0203F364: .word 0x60089C3B
	arm_func_end sub_0203F150

	arm_func_start sub_0203F368
sub_0203F368: ; 0x0203F368
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0203F394 ; =_020AFE78
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x64
	bl sub_0205B0B8
	str r0, [r5]
	mov r0, #0xc
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203F394: .word _020AFE78
	arm_func_end sub_0203F368

	arm_func_start sub_0203F398
sub_0203F398: ; 0x0203F398
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r4, [r0]
	cmp r4, #0
	moveq r0, #1
	beq _0203F8CC
	ldr r0, [r4, #8]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0203F8C8
_0203F3C4: ; jump table
	b _0203F3D8 ; case 0
	b _0203F404 ; case 1
	b _0203F8C8 ; case 2
	b _0203F83C ; case 3
	b _0203F898 ; case 4
_0203F3D8:
	ldrsb r0, [r4]
	bl sub_020307EC
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202810C
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0203F8C8
_0203F404:
	ldrsb r0, [r4]
	mov r1, #0
	bl SetUnkAdvancedTextBoxFn
	ldr r0, _0203F8D4 ; =_020AFE78
#ifdef JAPAN
	ldr r1, [r0]
	ldrb r0, [r1, #0x2c]
	cmp r0, #0
	beq _0203F464
	ldrsb r0, [r1]
	ldrsh r1, [r1, #0x12]
#else
	ldr r2, [r0]
	ldrb r0, [r2, #0x2c]
	cmp r0, #0
	beq _0203F464
	ldrsh r0, [r2, #0xc]
	add r0, r2, r0, lsl #2
	ldr r0, [r0, #0x14]
	cmp r0, #1
	ldreqsh r1, [r2, #0x12]
	ldrsb r0, [r2]
	movne r1, #0
#endif
	bl sub_02030A50
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl SetAdvancedTextBoxField0x1C2
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x2c]
_0203F464:
	add r1, sp, #0xc
	mov r0, #0
	bl sub_02006498
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetWindowIdPageStart
	ldr r1, _0203F8D4 ; =_020AFE78
	ldr r2, [r1]
	strh r0, [r2, #0xc]
	ldr r3, [r1]
	ldrsh r2, [r3, #0xc]
	ldrsh r0, [r3, #0x10]
	cmp r0, r2
	strneh r2, [r3, #0x10]
	ldrne r0, [r1]
	movne r1, #1
	strneb r1, [r0, #0x2c]
	bne _0203F8C8
	add r0, r3, r2, lsl #2
	ldr r0, [r0, #0x14]
	cmp r0, #1
	ldrsb r0, [r3]
	bne _0203F7EC
	ldr r1, _0203F8D8 ; =sub_0203F368
	bl SetUnkAdvancedTextBoxFn
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetAdvancedTextBoxFlags2
	ldr r1, _0203F8D4 ; =_020AFE78
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl sub_02028354
	cmp r0, #3
	beq _0203F508
	bl sub_0203F8EC
	cmp r0, #0
	movne r1, #1
	bne _0203F50C
_0203F508:
	mov r1, #0
_0203F50C:
	ldr r0, _0203F8D4 ; =_020AFE78
	and r5, r1, #0xff
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _0203F588
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02030908
	cmp r0, #0
	blt _0203F558
	bl sub_0203F8EC
	cmp r0, #0
	beq _0203F558
	bl sub_02001808
	cmp r0, #0xa000
	bge _0203F560
_0203F558:
	mov r0, #1
	b _0203F8CC
_0203F560:
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202812C
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #3
	ldr r0, [r0]
	mov r5, #0
	str r1, [r0, #8]
	b _0203F748
_0203F588:
	ldrh r0, [sp, #0xc]
	tst r0, #8
	cmpne r5, #0
	beq _0203F5FC
	bl sub_0203F8EC
	cmp r0, #0
	beq _0203F748
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #0
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl PlayAdvancedTextBoxInputSound
	bl sub_02001808
	cmp r0, #0xa000
	blt _0203F748
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02030EF0
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202812C
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #3
	ldr r0, [r0]
	mov r5, #0
	str r1, [r0, #8]
	b _0203F748
_0203F5FC:
	tst r0, #0x40
	bne _0203F60C
	tst r4, #0x40000
	beq _0203F698
_0203F60C:
	cmp r5, #0
	beq _0203F698
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r2, [r0]
	ldrsh r1, [r2, #0x12]
	cmp r1, #0
	bne _0203F660
	ldrsh r1, [r2, #0xba]
	cmp r1, #0
	beq _0203F748
	sub r1, r1, #1
	strh r1, [r2, #0xba]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x2c]
	ldrh r0, [sp, #0xc]
	tst r0, #0x40
	beq _0203F748
	mov r0, #3
	bl PlaySeVolumeWrapper
	b _0203F748
_0203F660:
	ldrsb r0, [r2]
	bl sub_02030A64
	cmp r0, #0
	bne _0203F680
	tst r4, #0x40000
	bne _0203F680
	mov r0, #3
	bl PlaySeVolumeWrapper
_0203F680:
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r1, [r0]
	ldrsh r0, [r1, #0x12]
	sub r0, r0, #1
	strh r0, [r1, #0x12]
	b _0203F748
_0203F698:
	tst r0, #0x80
	bne _0203F6A8
	tst r4, #0x80000
	beq _0203F748
_0203F6A8:
	cmp r5, #0
	beq _0203F748
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r3, [r0]
	ldrsh r1, [r3, #0x12]
	cmp r1, #8
	bne _0203F708
	ldrsh r2, [r3, #0xba]
	add r1, r2, #9
	add r1, r3, r1
	ldrb r1, [r1, #0xbc]
	cmp r1, #0
	beq _0203F748
	add r1, r2, #1
	strh r1, [r3, #0xba]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x2c]
	ldrh r0, [sp, #0xc]
	tst r0, #0x80
	beq _0203F748
	mov r0, #3
	bl PlaySeVolumeWrapper
	b _0203F748
_0203F708:
	ldrsb r0, [r3]
	bl sub_02030A64
	cmp r0, #8
	bne _0203F728
	tst r4, #0x80000
	bne _0203F728
	mov r0, #3
	bl PlaySeVolumeWrapper
_0203F728:
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r2, [r0]
	ldrsh r0, [r2, #0x12]
	add r1, r0, #1
	add r0, r2, r1
	ldrb r0, [r0, #0xbc]
	cmp r0, #0
	strneh r1, [r2, #0x12]
_0203F748:
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r1, [r0]
	ldrsh r0, [r1, #0xba]
	add r0, r0, #9
	add r0, r1, r0
	ldrb r0, [r0, #0xbc]
	cmp r0, #0
	ldrsb r0, [r1]
	mov r1, #0x40000000
	beq _0203F778
	bl sub_02030A90
	b _0203F77C
_0203F778:
	bl sub_02030A74
_0203F77C:
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r1, [r0]
	ldrsh r0, [r1, #0xba]
	cmp r0, #0
	ldrsb r0, [r1]
	mov r1, #0x20000000
	bne _0203F7A0
	bl sub_02030A74
	b _0203F7A4
_0203F7A0:
	bl sub_02030A90
_0203F7A4:
	cmp r5, #0
	beq _0203F7D8
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r3, #0xc
	ldr r0, [r0]
	mov r1, #1
	ldrsh r4, [r0, #0x12]
	ldrsb r0, [r0]
	mov r2, #3
	smulbb r3, r4, r3
	add r3, r3, #0x11
	bl sub_02030978
	b _0203F8C8
_0203F7D8:
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_020288DC
	b _0203F8C8
_0203F7EC:
	mov r1, #0x20000000
	bl sub_02030A74
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #0x40000000
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_02030A74
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	beq _0203F834
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_020288DC
	b _0203F8C8
_0203F834:
	mov r0, #1
	b _0203F8CC
_0203F83C:
	ldrsh r2, [r4, #0xba]
	ldrsh r0, [r4, #0x12]
	ldr r3, _0203F8DC ; =_0209E912
	ldr r1, _0203F8E0 ; =STATUSES_FULL_DESCRIPTION_STRING_IDS
	add r0, r2, r0
	add r0, r4, r0
	ldrb r4, [r0, #0xbc]
	mov r2, #0
	ldr r0, _0203F8E4 ; =_0209C8B8
	mov r5, r4, lsl #2
	ldrh r4, [r3, r5]
	ldrh r3, [r1, r5]
	ldr r1, _0203F8E8 ; =0x00001013
	stmia sp, {r2, r4}
	str r2, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _0203F8D4 ; =_020AFE78
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0203F8C8
_0203F898:
	ldrsb r0, [r4, #1]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0203F8C8
	ldr r0, _0203F8D4 ; =_020AFE78
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseScrollBox
	ldr r0, _0203F8D4 ; =_020AFE78
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
_0203F8C8:
	mov r0, #0
_0203F8CC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203F8D4: .word _020AFE78
_0203F8D8: .word sub_0203F368
_0203F8DC: .word _0209E912
_0203F8E0: .word STATUSES_FULL_DESCRIPTION_STRING_IDS
_0203F8E4: .word _0209C8B8
_0203F8E8: .word 0x00001013
	arm_func_end sub_0203F398

	arm_func_start sub_0203F8EC
sub_0203F8EC: ; 0x0203F8EC
	ldr r0, _0203F924 ; =_020AFE78
	mov r1, #0
	ldr r2, [r0]
	b _0203F914
_0203F8FC:
	add r0, r2, r1
	ldrb r0, [r0, #0xbc]
	cmp r0, #0
	movne r0, #1
	bxne lr
	add r1, r1, #1
_0203F914:
	cmp r1, #0x1e
	blt _0203F8FC
	mov r0, #0
	bx lr
	.align 2, 0
_0203F924: .word _020AFE78
	arm_func_end sub_0203F8EC

	arm_func_start sub_0203F928
sub_0203F928: ; 0x0203F928
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	bl sub_02030908
	ldr r2, _0203F970 ; =_020AFE78
	mov r3, #0xc
	ldr ip, [r2]
	mov r1, #1
	strh r0, [ip, #0x12]
	ldr r2, [r2]
	mov r0, r4
	ldrsh ip, [r2, #0x12]
	mov r2, #3
	smulbb r3, ip, r3
	add r3, r3, #0x11
	bl sub_02030978
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203F970: .word _020AFE78
	arm_func_end sub_0203F928

	arm_func_start sub_0203F974
sub_0203F974: ; 0x0203F974
	ldr r0, _0203F988 ; =_020AFE78
	ldr ip, _0203F98C ; =SetAdvancedTextBoxState5
	ldr r0, [r0]
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0203F988: .word _020AFE78
_0203F98C: .word SetAdvancedTextBoxState5
	arm_func_end sub_0203F974

	arm_func_start sub_0203F990
sub_0203F990: ; 0x0203F990
	stmdb sp!, {r3, lr}
	ldr r0, _0203F9C8 ; =_020AFE78
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseAdvancedTextBox
	ldr r0, _0203F9C8 ; =_020AFE78
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0203F9C8 ; =_020AFE78
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F9C8: .word _020AFE78
	arm_func_end sub_0203F990

	arm_func_start sub_0203F9CC
sub_0203F9CC: ; 0x0203F9CC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0203FA50 ; =_022AADFC
	mov r2, #0
	mov r5, r0
	str r2, [r1]
	ldr r4, [r5, #0xb4]
	ldr r0, _0203FA54 ; =_022AAE00
	mov r1, r4
	bl GetMonsterName
	ldr r0, _0203FA58 ; =_022AAE2A
#ifdef JAPAN
	add r1, r4, #0x120
#else
	add r1, r4, #0x124
#endif
	mov r2, #0x22
	bl memcpy
	ldrb r2, [r4, #7]
	ldr r1, _0203FA50 ; =_022AADFC
	mov r0, #0
	strb r2, [r1, #0x2c]
	str r5, [r1]
	strb r0, [r1, #0x58]
	ldrsh r2, [r4, #4]
	ldr r0, _0203FA5C ; =0x000001A2
	ldr r3, _0203FA60 ; =_022AAE58
	cmp r2, r0
	moveq r0, #1
	streqb r0, [r1, #0x58]
	ldrsh r1, [r4, #2]
	ldr r0, _0203FA50 ; =_022AADFC
	strh r1, [r0, #0x5a]
	add r0, r4, #0x9c
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203FA50: .word _022AADFC
_0203FA54: .word _022AAE00
_0203FA58: .word _022AAE2A
_0203FA5C: .word 0x000001A2
_0203FA60: .word _022AAE58
	arm_func_end sub_0203F9CC

	arm_func_start sub_0203FA64
sub_0203FA64: ; 0x0203FA64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _0203FBBC ; =TEAM_MEMBER_TABLE_PTR
	mov sl, r0
	mov r0, #0x44
	smulbb r2, sl, r0
	ldr r1, [r1]
	mov r4, #0x46
	ldrb r0, [r1, r2]
	add r8, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	beq _0203FBB4
	ldr r1, _0203FBC0 ; =_022AADFC
	mov r2, #0
	mov r0, sl
	str r2, [r1]
	bl sub_02056410
	cmp r0, #0
	mov r0, sl
	beq _0203FAD4
	bl sub_020564B0
	cmp r0, #0
	movne r4, #0x59
	b _0203FAE4
_0203FAD4:
	bl sub_02056F60
	cmp r0, #0
	movne r4, #0x44
	moveq r4, #0x57
_0203FAE4:
	add r0, sp, #0
	add r1, r8, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldr r0, _0203FBC4 ; =_022AAE00
	ldr r1, _0203FBC8 ; =_0209C96C
	add r3, sp, #0
	and r2, r4, #0xff
	bl SprintfStatic__0204174C
	ldrsh r1, [r8, #4]
	ldr r0, _0203FBC0 ; =_022AADFC
	ldr r3, _0203FBCC ; =_022AAE58
	strh r1, [r0, #0x5a]
	add r4, r8, #0x14
	ldmia r4, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldrsh r0, [r8, #4]
	mov r1, r4
	bl GetPpIncrease
	mov r6, #0
	ldr r5, _0203FBD0 ; =_022AAE2A
	ldr r4, _0203FBC0 ; =_022AADFC
	mov r7, r0
	mov fp, r6
_0203FB44:
	mov r0, #6
	mla sb, r6, r0, r8
	ldrh r1, [sb, #0x24]
	add r0, r5, r6, lsl #3
	bl InitMove
	ldrb r1, [sb, #0x22]
	add r2, r4, r6, lsl #3
	add r0, r5, r6, lsl #3
	strb r1, [r2, #0x2e]
	strh r7, [r2, #0x30]
	strb fp, [r2, #0x34]
	ldrb r1, [sb, #0x26]
	strb r1, [r2, #0x35]
	bl GetMaxPp
	add r1, r6, #1
	add r2, r4, r6, lsl #3
	mov r1, r1, lsl #0x10
	mov r6, r1, lsr #0x10
	strb r0, [r2, #0x34]
	cmp r6, #4
	blo _0203FB44
	mov r0, sl
	bl sub_020564B0
	ldr r1, _0203FBC0 ; =_022AADFC
	strb r0, [r1, #0x2c]
	ldrsh r0, [r8, #4]
	bl sub_02041724
	mov r0, #1
_0203FBB4:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0203FBBC: .word TEAM_MEMBER_TABLE_PTR
_0203FBC0: .word _022AADFC
_0203FBC4: .word _022AAE00
_0203FBC8: .word _0209C96C
_0203FBCC: .word _022AAE58
_0203FBD0: .word _022AAE2A
	arm_func_end sub_0203FA64

	arm_func_start sub_0203FBD4
sub_0203FBD4: ; 0x0203FBD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _0203FCFC ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r1, [r1]
	ldr r3, _0203FD00 ; =_022AADFC
	add r1, r1, #0x9000
	ldr r1, [r1, #0x84c]
	mov r4, #0
	smlabb r8, r0, r2, r1
	str r4, [r3]
	ldrsh r0, [r8, #8]
	sub r1, r4, #1
	cmp r0, r1
	streqb r4, [r3, #0x2c]
	beq _0203FC20
	bl sub_020564B0
	ldr r1, _0203FD00 ; =_022AADFC
	strb r0, [r1, #0x2c]
_0203FC20:
	ldr r0, _0203FD00 ; =_022AADFC
	add r1, r8, #0x5e
	ldrb r0, [r0, #0x2c]
	mov r2, #0xa
	cmp r0, #0
	movne r4, #0x59
	add r0, sp, #0
	moveq r4, #0x46
	bl StrncpySimpleNoPadSafe
	ldr r0, _0203FD04 ; =_022AAE00
	ldr r1, _0203FD08 ; =_0209C96C
	add r3, sp, #0
	and r2, r4, #0xff
	bl SprintfStatic__0204174C
	ldrsh r0, [r8, #0xc]
	add r1, r8, #0x4c
	bl GetPpIncrease
	ldr r5, _0203FD0C ; =_022AAE2A
	ldr r4, _0203FD00 ; =_022AADFC
	mov r7, r0
	mov r6, #0
_0203FC74:
	add r0, r8, r6, lsl #3
	ldrh r1, [r0, #0x20]
	add r0, r5, r6, lsl #3
	bl InitMove
	add r3, r8, r6, lsl #3
	ldrb r1, [r3, #0x1c]
	add r2, r4, r6, lsl #3
	add r0, r5, r6, lsl #3
	strb r1, [r2, #0x2e]
	strh r7, [r2, #0x30]
	ldrb r1, [r3, #0x22]
	strb r1, [r2, #0x34]
	ldrb r1, [r3, #0x23]
	strb r1, [r2, #0x35]
	bl GetMaxPp
	add r1, r6, #1
	add r2, r4, r6, lsl #3
	mov r1, r1, lsl #0x10
	mov r6, r1, lsr #0x10
	strb r0, [r2, #0x34]
	cmp r6, #4
	blo _0203FC74
	ldrsh r0, [r8, #0xc]
	bl sub_02041724
	ldrsh r1, [r8, #0xc]
	ldr r0, _0203FD00 ; =_022AADFC
	ldr r3, _0203FD10 ; =_022AAE58
	strh r1, [r0, #0x5a]
	add r0, r8, #0x4c
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0203FCFC: .word TEAM_MEMBER_TABLE_PTR
_0203FD00: .word _022AADFC
_0203FD04: .word _022AAE00
_0203FD08: .word _0209C96C
_0203FD0C: .word _022AAE2A
_0203FD10: .word _022AAE58
	arm_func_end sub_0203FBD4

	arm_func_start sub_0203FD14
sub_0203FD14: ; 0x0203FD14
	ldr ip, _0203FD24 ; =InitMove
	mov r1, r0
	ldr r0, _0203FD28 ; =LAST_NEW_MOVE
	bx ip
	.align 2, 0
_0203FD24: .word InitMove
_0203FD28: .word LAST_NEW_MOVE
	arm_func_end sub_0203FD14

	arm_func_start sub_0203FD2C
sub_0203FD2C: ; 0x0203FD2C
	ldr r0, _0203FD34 ; =LAST_NEW_MOVE
	bx lr
	.align 2, 0
_0203FD34: .word LAST_NEW_MOVE
	arm_func_end sub_0203FD2C

	arm_func_start sub_0203FD38
sub_0203FD38: ; 0x0203FD38
	ldr r0, _0203FD40 ; =_022AAE2A
	bx lr
	.align 2, 0
_0203FD40: .word _022AAE2A
	arm_func_end sub_0203FD38

	arm_func_start sub_0203FD44
sub_0203FD44: ; 0x0203FD44
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	ldr r1, _0203FD74 ; =_022AAE2A
#ifdef JAPAN
	add r0, r4, #0x120
#else
	add r0, r4, #0x124
#endif
	mov r2, #0x22
	bl memcpy
	ldr r1, _0203FD78 ; =_022AADFC
	ldr r0, _0203FD7C ; =_020AFE7C
	ldrb r1, [r1, #0x2c]
	strb r1, [r4, #7]
	ldrsh r0, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203FD74: .word _022AAE2A
_0203FD78: .word _022AADFC
_0203FD7C: .word _020AFE7C
	arm_func_end sub_0203FD44

	arm_func_start sub_0203FD80
sub_0203FD80: ; 0x0203FD80
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0203FDE0 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	ldr ip, _0203FDE4 ; =_022AADFC
	mla r5, r0, r1, r2
	mov r4, #0
	mov r0, #6
_0203FDA0:
	mla lr, r4, r0, r5
	add r3, ip, r4, lsl #3
	ldrb r2, [r3, #0x2e]
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	strb r2, [lr, #0x22]
	ldrh r2, [r3, #0x32]
	mov r4, r1, lsr #0x10
	cmp r4, #4
	strh r2, [lr, #0x24]
	ldrb r1, [r3, #0x35]
	strb r1, [lr, #0x26]
	blo _0203FDA0
	ldr r0, _0203FDE8 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203FDE0: .word TEAM_MEMBER_TABLE_PTR
_0203FDE4: .word _022AADFC
_0203FDE8: .word _020AFE7C
	arm_func_end sub_0203FD80

	arm_func_start sub_0203FDEC
sub_0203FDEC: ; 0x0203FDEC
	stmdb sp!, {r4, lr}
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	ldr lr, _0203FE54 ; =_022AADFC
	mov r4, #0
_0203FE04:
	add ip, lr, r4, lsl #3
	ldrb r2, [ip, #0x2e]
	add r3, r0, r4, lsl #3
	add r1, r4, #1
	strb r2, [r3, #0x1c]
	ldrh r2, [ip, #0x30]
	mov r1, r1, lsl #0x10
	mov r4, r1, lsr #0x10
	strh r2, [r3, #0x1e]
	ldrh r1, [ip, #0x32]
	cmp r4, #4
	strh r1, [r3, #0x20]
	ldrb r1, [ip, #0x34]
	strb r1, [r3, #0x22]
	ldrb r1, [ip, #0x35]
	strb r1, [r3, #0x23]
	blo _0203FE04
	ldr r0, _0203FE58 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203FE54: .word _022AADFC
_0203FE58: .word _020AFE7C
	arm_func_end sub_0203FDEC

	arm_func_start sub_0203FE5C
sub_0203FE5C: ; 0x0203FE5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r0, #0x3fc
	mov r1, #8
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r1, _02040154 ; =_020AFE7C
	mvn r2, #1
	str r0, [r1, #8]
	strb r2, [r0]
	ldr r0, [r1, #0xc]
	ldr r2, _02040154 ; =_020AFE7C
	cmp r0, r7
	strne r7, [r1, #0xc]
	movne r0, #0
	strneh r0, [r1, #2]
	ldr r0, _02040154 ; =_020AFE7C
	ldr r3, _02040158 ; =0x00000A3E
	ldrsh r1, [r0, #4]
	mov r7, #0x17
	cmp r1, r6
	strneh r6, [r0, #4]
	movne r1, #0
	strneh r1, [r0, #2]
	ldr r0, [r2, #8]
	mov r1, #0x10
	str r1, [r0, #0x10]
	ldr r0, [r2, #8]
	str r1, [r0, #8]
	ldr r0, [r2, #8]
	mov r1, #0
	strh r3, [r0, #0xc]
	ldr r0, [r2, #8]
	ldr r3, _0204015C ; =_022AAE00
	str r7, [r0, #0x98]
	ldr r0, [r2, #8]
	str r1, [r0, #0x64]
	ldr r0, [r2, #8]
	str r3, [r0, #0x4c]
	ldr r0, [r2, #8]
	strb r1, [r0, #0x3f8]
	ldr r0, [r2, #8]
	str r4, [r0, #0x3f4]
	ldr r0, [r2, #0xc]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0203FF44
_0203FF24: ; jump table
	b _02040084 ; case 0
	b _0203FF44 ; case 1
	b _0203FFAC ; case 2
	b _0204003C ; case 3
	b _0203FF44 ; case 4
	b _0203FF44 ; case 5
	b _0203FFF4 ; case 6
	b _0203FF7C ; case 7
_0203FF44:
	mov r1, #0
	str r1, [sp]
	ldr r0, _02040154 ; =_020AFE7C
	str r1, [sp, #4]
	ldr r2, [r0, #8]
	ldr r0, _02040160 ; =_0209C93C
	ldr r1, _02040164 ; =0x00401803
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
	b _020400FC
_0203FF7C:
	str r1, [sp]
	str r1, [sp, #4]
	ldr r2, [r2, #8]
	ldr r0, _0204016C ; =_0209C94C
	ldr r1, _02040170 ; =0x00400800
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
	b _020400FC
_0203FFAC:
	ldr r0, [r2, #8]
	mov r3, #1
	strb r3, [r0, #0x3f8]
	ldr r4, [r2, #8]
	ldr r0, _02040174 ; =_0209C92C
	add r3, r4, #0x3e0
	str r3, [r4, #0x64]
	str r1, [sp]
	str r1, [sp, #4]
	ldr r2, [r2, #8]
	ldr r1, _02040164 ; =0x00401803
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
	b _020400FC
_0203FFF4:
	ldr r0, [r2, #8]
	mov r3, #1
	strb r3, [r0, #0x3f8]
	ldr r4, [r2, #8]
	ldr r0, _02040174 ; =_0209C92C
	add r3, r4, #0x3e0
	str r3, [r4, #0x64]
	str r1, [sp]
	str r1, [sp, #4]
	ldr r2, [r2, #8]
	ldr r1, _02040178 ; =0x00401A03
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
	b _020400FC
_0204003C:
	ldr r0, [r2, #8]
	mov r3, #1
	strb r3, [r0, #0x3f8]
	ldr r4, [r2, #8]
	ldr r0, _0204017C ; =_0209C95C
	add r3, r4, #0x3e0
	str r3, [r4, #0x64]
	str r1, [sp]
	str r1, [sp, #4]
	ldr r2, [r2, #8]
	ldr r1, _02040180 ; =0x00400A00
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
	b _020400FC
_02040084:
	cmp r6, #1
	ble _020400C8
	ldr r1, [r2, #8]
	mov r0, #1
	str r5, [r1, #4]
	str r6, [sp]
	str r0, [sp, #4]
	ldr r2, [r2, #8]
	ldr r0, _02040160 ; =_0209C93C
	ldr r1, _02040184 ; =0x00409823
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
	b _020400FC
_020400C8:
	ldr r3, [r2, #8]
	ldr r0, _02040160 ; =_0209C93C
	str r1, [r3, #4]
	str r1, [sp]
	str r1, [sp, #4]
	ldr r2, [r2, #8]
	ldr r1, _02040188 ; =0x00401823
	ldr r3, _02040168 ; =sub_020401A8
	add r2, r2, #4
	bl CreateAdvancedTextBox
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	strb r0, [r1]
_020400FC:
	ldr r0, _02040154 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl GetWindowIdPageStart
	ldr r1, _02040154 ; =_020AFE7C
	ldr r1, [r1, #8]
	add r1, r1, #0x300
	strh r0, [r1, #0xe8]
	mov r0, #1
	bl sub_0204027C
	bl PrintMoveOptionMenu
	ldr r1, _02040154 ; =_020AFE7C
	mov r2, #0
	ldr r0, [r1, #8]
	strb r2, [r0, #0x3e5]
	ldr r0, [r1, #8]
	add r0, r0, #0x300
	strh r2, [r0, #0xe6]
	ldr r0, [r1, #8]
	ldrsb r0, [r0]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02040154: .word _020AFE7C
#ifdef JAPAN
_02040158: .word 0x00000879
#else
_02040158: .word 0x00000A3E
#endif
_0204015C: .word _022AAE00
_02040160: .word _0209C93C
_02040164: .word 0x00401803
_02040168: .word sub_020401A8
_0204016C: .word _0209C94C
_02040170: .word 0x00400800
_02040174: .word _0209C92C
_02040178: .word 0x00401A03
_0204017C: .word _0209C95C
_02040180: .word 0x00400A00
_02040184: .word 0x00409823
_02040188: .word 0x00401823
	arm_func_end sub_0203FE5C

	arm_func_start sub_0204018C
sub_0204018C: ; 0x0204018C
	ldr ip, _02040198 ; =sub_0203FE5C
	mov r3, #0
	bx ip
	.align 2, 0
_02040198: .word sub_0203FE5C
	arm_func_end sub_0204018C

	arm_func_start sub_0204019C
sub_0204019C: ; 0x0204019C
	ldr ip, _020401A4 ; =sub_0203FE5C
	bx ip
	.align 2, 0
_020401A4: .word sub_0203FE5C
	arm_func_end sub_0204019C

	arm_func_start sub_020401A8
sub_020401A8: ; 0x020401A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl sub_02027B1C
	ldr r4, _02040274 ; =_020AFE7C
	mov sb, #0
	ldr r0, [r4, #8]
	ldr r7, _02040278 ; =_022AADFC
	ldr r0, [r0, #0x10]
	mov fp, #8
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	mov r6, #0xd
	mov r5, #0x17
	b _02040250
_020401E0:
	add r0, r7, sb, lsl #3
	ldrb r0, [r0, #0x2e]
	tst r0, #2
	add r0, r2, sb, lsl #3
	movne r1, r6
	ldr r3, [r0, #0xa8]
	moveq r1, fp
	mov r0, sl
	add r2, r8, #2
	bl DrawTextInWindow
	cmp sb, #0
	ble _02040238
	add r0, r7, sb, lsl #3
	ldrb r0, [r0, #0x2e]
	tst r0, #2
	bne _02040238
	mov r0, sl
	mov r1, #0x10
	mov r2, r8
	mov r3, #0x7e
	str r5, [sp]
	bl sub_02025D50
_02040238:
	add r0, r8, #0x10
	add r1, sb, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r8, r0, asr #0x10
	mov sb, r1, asr #0x10
_02040250:
	ldr r2, [r4, #8]
	ldrsh r0, [r2, #0xa4]
	cmp sb, r0
	blt _020401E0
	mov r0, #1
	bl sub_0204027C
	mov r0, sl
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02040274: .word _020AFE7C
_02040278: .word _022AADFC
	arm_func_end sub_020401A8

	arm_func_start sub_0204027C
sub_0204027C: ; 0x0204027C
	cmp r0, #0
	ldrne r0, _020402BC ; =_020AFE7C
	movne r3, #2
	ldrne r2, [r0, #8]
	ldreq r0, _020402BC ; =_020AFE7C
	moveq r3, #1
	ldreq r2, [r0, #8]
	movne r1, #1
	str r3, [r2, #0x3ec]
	ldr r0, [r0, #8]
	moveq r1, #2
	str r1, [r0, #0x3f0]
	ldr r0, _020402BC ; =_020AFE7C
	ldr r0, [r0, #0xc]
	cmp r0, #7
	bx lr
	.align 2, 0
_020402BC: .word _020AFE7C
	arm_func_end sub_0204027C

	arm_func_start PrintMoveOptionMenu
PrintMoveOptionMenu: ; 0x020402C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r0, _020407AC ; =_020AFE7C
	ldr r2, _020407B0 ; =_022AAE00
	ldr r1, [r0, #8]
	str r2, [r1, #0x4c]
	ldr r1, [r0, #0xc]
	cmp r1, #2
	cmpne r1, #3
	cmpne r1, #6
	beq _020402FC
	ldrsh r1, [r0, #2]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #2]
_020402FC:
	ldr r0, _020407AC ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_020410A4
	ldr r1, _020407AC ; =_020AFE7C
	mov r0, #0
	ldr r1, [r1, #8]
	strh r0, [r1, #0xa4]
_02040318:
	ldr r1, _020407AC ; =_020AFE7C
	ldr r2, _020407B4 ; =_022AAE2A
	ldr r1, [r1, #8]
	mov r3, #0
	add r1, r1, r0
	strb r3, [r1, #0x3e0]
	ldrb r1, [r2, r0, lsl #3]
	add r4, r2, r0, lsl #3
	tst r1, #1
	movne r3, #1
	tst r3, #0xff
	beq _020403B4
	ldr r1, _020407AC ; =_020AFE7C
	ldr r3, [r1, #8]
	ldrsh r2, [r3, #0xa4]
	add r2, r2, #1
	strh r2, [r3, #0xa4]
	ldr r5, [r1, #8]
	ldrb r1, [r5, #0x3f8]
	cmp r1, #0
	ldrne r2, [r5, #0x3f4]
	cmpne r2, #0
	beq _020403C8
	ldrh r1, [r4, #4]
	b _02040388
_0204037C:
	cmp r3, r1
	beq _02040394
	add r2, r2, #2
_02040388:
	ldrh r3, [r2]
	cmp r3, #0
	bne _0204037C
_02040394:
	cmp r3, #0
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	addne r1, r5, r0
	movne r2, #3
	strneb r2, [r1, #0x3e0]
	b _020403C8
_020403B4:
	ldr r1, _020407AC ; =_020AFE7C
	ldrsh r2, [r1, #2]
	cmp r0, r2
	moveq r2, #0
	streqh r2, [r1, #2]
_020403C8:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	blt _02040318
	ldr r1, _020407AC ; =_020AFE7C
	mov r0, #0
	ldr r2, [r1, #8]
	strb r0, [r2, #0x3e4]
	ldr r2, [r1, #8]
	ldrb r1, [r2, #0x3f8]
	cmp r1, #0
	ldrne r1, [r2, #0x3f4]
	cmpne r1, #0
	beq _020404B4
_02040404:
	ldr r1, _020407AC ; =_020AFE7C
	ldr r3, _020407B4 ; =_022AAE2A
	ldr r2, [r1, #8]
	add r2, r2, r0
	ldrb r2, [r2, #0x3e0]
	tst r2, #1
	beq _020404A0
	ldrb r2, [r3, r0, lsl #3]
	tst r2, #2
	beq _02040464
	sub r6, r0, #1
	mov r5, #3
	ldr r3, _020407B8 ; =_022AADFC
	b _0204045C
_0204043C:
	ldr r4, [r1, #8]
	add r2, r3, r6, lsl #3
	add r4, r4, r6
	strb r5, [r4, #0x3e0]
	ldrb r2, [r2, #0x2e]
	tst r2, #2
	beq _02040464
	sub r6, r6, #1
_0204045C:
	cmp r6, #0
	bge _0204043C
_02040464:
	add r5, r0, #1
	ldr r4, _020407B8 ; =_022AADFC
	mov r3, #3
	ldr r1, _020407AC ; =_020AFE7C
	b _02040498
_02040478:
	add r2, r4, r5, lsl #3
	ldrb r2, [r2, #0x2e]
	tst r2, #2
	beq _020404A0
	ldr r2, [r1, #8]
	add r2, r2, r5
	strb r3, [r2, #0x3e0]
	add r5, r5, #1
_02040498:
	cmp r5, #4
	blt _02040478
_020404A0:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	blt _02040404
_020404B4:
	ldr r0, _020407AC ; =_020AFE7C
	mov r8, #0
	ldr r0, [r0, #0xc]
	ldr fp, _020407B4 ; =_022AAE2A
	cmp r0, #2
	cmpne r0, #3
	cmpne r0, #6
	ldreq r0, _020407AC ; =_020AFE7C
	ldr r5, _020407B8 ; =_022AADFC
	ldreq r1, [r0, #8]
	ldr r4, _020407AC ; =_020AFE7C
	ldreqsh r0, [r1, #0xa4]
	mov sb, r8
	mov r7, r8
	addeq r0, r0, #1
	streqh r0, [r1, #0xa4]
	mov r6, #0x6a
_020404F8:
	ldrb r0, [fp, sb, lsl #3]
	str r7, [sp]
	str r6, [sp, #4]
	tst r0, #1
	movne r0, #1
	moveq r0, r7
	strb r7, [sp, #8]
	strb r7, [sp, #9]
	add sl, fp, sb, lsl #3
	tst r0, #0xff
	beq _02040634
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	movne r0, #2
	strne r0, [sp]
	moveq r0, #4
	streq r0, [sp]
	ldr r0, [r4, #0xc]
	cmp r0, #1
	cmpne r0, #5
	bne _02040574
	ldrh r0, [sl, #4]
	bl Is2TurnsMove
	cmp r0, #0
	movne r0, #1
	strneb r0, [sp, #9]
	bne _02040574
	ldrh r0, [sl, #4]
	cmp r0, #0x8a
	moveq r0, #1
	streqb r0, [sp, #8]
_02040574:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	cmpne r0, #1
	bne _020405A4
	ldr r0, [r5]
	mov r1, sl
	mov r2, #1
	bl CanMonsterUseMove
	cmp r0, #0
	moveq r0, #1
	streqb r0, [sp, #8]
	b _020405B4
_020405A4:
	ldrb r0, [sl, #6]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [sp, #8]
_020405B4:
	ldr r1, [r4, #8]
	ldrb r0, [r1, #0x3f8]
	cmp r0, #0
	beq _020405D8
	add r0, r1, sb
	ldrb r0, [r0, #0x3e0]
	tst r0, #2
	movne r0, #1
	strneb r0, [sp, #8]
_020405D8:
	mov r2, sl
	add r0, sp, #0xc
	mov r1, #0
	add r3, sp, #0
	bl FormatMoveStringMore
	mov r0, #0
	bl GetDungeonResultString
	mov r1, r0
	ldr r0, [r4, #8]
	add r0, r0, #0xe0
	add r0, r0, r8, lsl #7
	bl strcpy
	ldr r3, [r4, #8]
	add r0, r8, #1
	add r1, r3, #0xe0
	add r2, r1, r8, lsl #7
	add r1, r3, r8, lsl #3
	str r2, [r1, #0xa8]
	ldr r1, [r4, #8]
	mov r0, r0, lsl #0x10
	add r1, r1, r8, lsl #3
	str r8, [r1, #0xac]
	mov r8, r0, asr #0x10
_02040634:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _020404F8
	cmp r8, #4
	bne _02040710
	ldr r0, _020407AC ; =_020AFE7C
	ldr r0, [r0, #0xc]
	cmp r0, #2
	cmpne r0, #3
	cmpne r0, #6
	bne _02040710
	ldr r0, _020407B8 ; =_022AADFC
	mov r2, #0
	ldrb r0, [r0, #0x2c]
	str r2, [sp]
	strb r2, [sp, #8]
	strb r2, [sp, #9]
	ldr r2, _020407BC ; =LAST_NEW_MOVE
	cmp r0, #0
	ldrb r0, [r2]
	mov r1, #0x6a
	str r1, [sp, #4]
	movne r1, #2
	bicne r0, r0, #8
	strne r1, [sp]
	moveq r1, #4
	biceq r0, r0, #4
	streq r1, [sp]
	strb r0, [r2]
	add r0, sp, #0xc
	add r3, sp, #0
	mov r1, #0
	bl FormatMoveStringMore
	mov r0, #0
	bl GetDungeonResultString
	ldr r2, _020407AC ; =_020AFE7C
	mov r1, r0
	ldr r0, [r2, #8]
	add r0, r0, #0xe0
	add r0, r0, r8, lsl #7
	bl strcpy
	ldr r1, _020407AC ; =_020AFE7C
	add r0, r8, #1
	ldr r4, [r1, #8]
	mov r0, r0, lsl #0x10
	add r2, r4, #0xe0
	add r3, r2, r8, lsl #7
	add r2, r4, r8, lsl #3
	str r3, [r2, #0xa8]
	ldr r1, [r1, #8]
	add r1, r1, r8, lsl #3
	str r8, [r1, #0xac]
	mov r8, r0, asr #0x10
_02040710:
	ldr r0, _020407AC ; =_020AFE7C
	mov r4, #0
	ldr r1, [r0, #8]
	sub r3, r4, #1
	add r1, r1, r8, lsl #3
	str r4, [r1, #0xa8]
	ldr r2, [r0, #8]
	sub r1, r4, #2
	add r2, r2, r8, lsl #3
	str r3, [r2, #0xac]
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	cmp r0, r1
	beq _0204075C
	bl sub_020307EC
	ldr r0, _020407AC ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl SetAdvancedTextBoxField0x1C2
_0204075C:
	ldr r0, _020407AC ; =_020AFE7C
	ldr r1, [r0, #0xc]
	cmp r1, #7
	ldrne r3, [r0, #8]
	ldrne r2, [r3, #0x3ec]
	ldrne r1, [r3, #0x3f0]
	cmpne r2, r1
	beq _020407A4
	str r1, [r3, #0x3ec]
	ldr r3, [r0, #8]
	ldrsh r1, [r0, #2]
	ldr r2, [r3, #0x10]
	ldrsb r0, [r3]
	add r2, r2, r1, lsl #4
	ldr r1, [r3, #0x3ec]
	add r3, r2, #4
	mov r2, #0
	bl sub_02030978
_020407A4:
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020407AC: .word _020AFE7C
_020407B0: .word _022AAE00
_020407B4: .word _022AAE2A
_020407B8: .word _022AADFC
_020407BC: .word LAST_NEW_MOVE
	arm_func_end PrintMoveOptionMenu

	arm_func_start sub_020407C0
sub_020407C0: ; 0x020407C0
	stmdb sp!, {r3, lr}
	ldr r0, _020407E8 ; =_020AFE7C
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _020407E8 ; =_020AFE7C
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020407E8: .word _020AFE7C
	arm_func_end sub_020407C0

	arm_func_start sub_020407EC
sub_020407EC: ; 0x020407EC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x34
	add r1, sp, #0xc
	mov r0, #0
	bl GetHeldButtons
	add r1, sp, #0xa
	mov r0, #0
	bl GetPressedButtons
	add r1, sp, #8
	mov r0, #0
	bl sub_020063F4
	ldrh r0, [sp, #0xc]
	ldr r5, _02040F90 ; =_022AAE2A
	tst r0, #0x200
	movne r1, #1
	moveq r1, #0
	and r6, r1, #0xff
	ldr r1, _02040F94 ; =_020AFE7C
	tst r0, #0x100
	movne r0, #1
	moveq r0, #0
	ldr r3, [r1, #8]
	and r7, r0, #0xff
	add r0, r3, #0x300
	ldrsh r2, [r0, #0xe6]
	cmp r2, #0
	ble _0204087C
	sub r2, r2, #1
	strh r2, [r0, #0xe6]
	ldr r0, [r1, #8]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0xe6]
	cmp r0, #0
	moveq r0, #2
	movne r0, #0
	b _02040F88
_0204087C:
	ldrsb r0, [r3]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _020408B8
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl GetDigitInputResult
	mvn r1, #0
	cmp r0, r1
	bne _020408B8
	mov r0, #1
	bl PlaySeVolumeWrapper
	mov r0, #1
	b _02040F88
_020408B8:
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #0xc]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02040958
_020408CC: ; jump table
	b _02040958 ; case 0
	b _0204094C ; case 1
	b _0204090C ; case 2
	b _020408F4 ; case 3
	b _02040958 ; case 4
	b _02040958 ; case 5
	b _0204090C ; case 6
	b _0204093C ; case 7
	b _02040924 ; case 8
	b _0204090C ; case 9
_020408F4:
	ldrh r0, [sp, #0xa]
	mov r6, #0
	mov r7, r6
	bic r0, r0, #6
	strh r0, [sp, #0xa]
	b _02040958
_0204090C:
	ldrh r0, [sp, #0xa]
	mov r6, #0
	mov r7, r6
	bic r0, r0, #4
	strh r0, [sp, #0xa]
	b _02040958
_02040924:
	ldrh r0, [sp, #0xa]
	mov r6, #0
	mov r7, r6
	bic r0, r0, #4
	strh r0, [sp, #0xa]
	b _02040958
_0204093C:
	mov r6, #0
	mov r7, r6
	strh r6, [sp, #0xa]
	b _02040958
_0204094C:
	ldrh r0, [sp, #8]
	bic r0, r0, #0x30
	strh r0, [sp, #8]
_02040958:
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x3e5]
	cmp r0, #0
	beq _02040980
	bl PrintMoveOptionMenu
	ldr r0, _02040F94 ; =_020AFE7C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x3e5]
_02040980:
	ldrh r0, [sp, #8]
	tst r0, #0x80
	beq _02040A44
	bl sub_02041178
	cmp r7, #0
	beq _020409E4
	ldr r1, _02040F94 ; =_020AFE7C
	ldr r0, _02040F90 ; =_022AAE2A
	ldrsh r1, [r1, #2]
	bl sub_02013E54
	ldr r1, _02040F94 ; =_020AFE7C
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1, #2]
	mov r4, r0, asr #0x10
	cmp r1, r0, asr #16
	beq _020409D8
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r1, _02040F94 ; =_020AFE7C
	mov r0, #3
	strh r4, [r1, #2]
	b _02040F88
_020409D8:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02040A44
_020409E4:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r1, [r0, #8]
	ldrsh r2, [r0, #2]
	ldrsh r1, [r1, #0xa4]
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	b _02040A24
_02040A0C:
	ldrb r0, [r5, r3, lsl #3]
	tst r0, #2
	beq _02040A2C
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_02040A24:
	cmp r2, r1
	blt _02040A0C
_02040A2C:
	cmp r3, r1
	ldr r1, _02040F94 ; =_020AFE7C
	movge r3, #0
	mov r0, #9
	strh r3, [r1, #2]
	b _02040F88
_02040A44:
	ldrh r0, [sp, #8]
	tst r0, #0x40
	beq _02040B10
	bl sub_02041178
	cmp r7, #0
	beq _02040AA8
	ldr r1, _02040F94 ; =_020AFE7C
	ldr r0, _02040F90 ; =_022AAE2A
	ldrsh r1, [r1, #2]
	bl sub_02013F58
	ldr r1, _02040F94 ; =_020AFE7C
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1, #2]
	mov r4, r0, asr #0x10
	cmp r1, r0, asr #16
	beq _02040A9C
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r1, _02040F94 ; =_020AFE7C
	mov r0, #4
	strh r4, [r1, #2]
	b _02040F88
_02040A9C:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02040B10
_02040AA8:
	mov r0, #3
	bl PlaySeVolumeWrapper
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r1, [r0, #2]
	cmp r1, #0
	subgt r0, r1, #1
	ldrle r0, [r0, #8]
	ldrlesh r0, [r0, #0xa4]
	suble r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	b _02040AF0
_02040AD8:
	ldrb r0, [r5, r2, lsl #3]
	tst r0, #2
	beq _02040AF8
	sub r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_02040AF0:
	cmp r1, #0
	bge _02040AD8
_02040AF8:
	ldr r1, _02040F94 ; =_020AFE7C
	cmp r2, #0
	movlt r2, #0
	mov r0, #9
	strh r2, [r1, #2]
	b _02040F88
_02040B10:
	mov r4, #0
	bl IsTouchScreenNotOff
	cmp r0, #0
	add r0, sp, #0x10
	beq _02040B2C
	bl GetReleasedStylus
	b _02040B30
_02040B2C:
	bl sub_02006BFC
_02040B30:
	ldrh r0, [sp, #0x10]
	tst r0, #0x40
	beq _02040C38
	tst r0, #2
	ldrne r0, _02040F94 ; =_020AFE7C
	ldrne r0, [r0, #0xc]
	cmpne r0, #7
	beq _02040C38
	cmp r0, #2
	cmpne r0, #3
	cmpne r0, #6
	bne _02040B68
	mov r1, #0x70
	b _02040B6C
_02040B68:
	mov r1, #0x60
_02040B6C:
	ldr r0, [sp, #0x14]
	cmp r0, #0x10
	blt _02040C38
	cmp r0, #0xa0
	bge _02040C38
	ldr r0, [sp, #0x18]
	cmp r0, #0x20
	blt _02040C38
	cmp r0, r1
	bge _02040C38
	sub r1, r0, #0x20
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, lsl #0xc
	ldr r2, _02040F94 ; =_020AFE7C
	mov r1, r0, asr #0x10
	ldr r5, [r2, #8]
	add r7, r1, #1
	mov r3, #0
	mvn r2, #0
	b _02040BDC
_02040BC0:
	add r0, r5, r3, lsl #3
	ldr r0, [r0, #0xac]
	cmp r0, r2
	beq _02040BE4
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_02040BDC:
	cmp r3, r7
	blt _02040BC0
_02040BE4:
	cmp r3, r1
	ble _02040C38
	ldr r0, _02040F90 ; =_022AAE2A
	ldrb r0, [r0, r1, lsl #3]
	tst r0, #2
	bne _02040C38
	mov r0, r1, lsl #4
	ldr r3, _02040F94 ; =_020AFE7C
	add r0, r0, #0x20
	mov r2, r0, lsl #0x10
	mov r0, #0x10
	ldr r4, _02040F98 ; =_0209C928
	strh r1, [r3, #2]
	mov r3, r0
	str r4, [sp]
	mov r4, #0x40
	mov r1, r2, asr #0x10
	mov r2, #0x90
	str r4, [sp, #4]
	mov r4, #1
	bl sub_0202A2A4
_02040C38:
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r5, [r0, #8]
	ldrsb r0, [r5]
	bl GetWindowIdPageStart
	add r1, r5, #0x300
	ldrsh r1, [r1, #0xe8]
	cmp r1, r0
	beq _02040C90
	mov r0, #4
	bl PlaySeVolumeWrapper
	ldr r0, _02040F94 ; =_020AFE7C
	mov r1, #0
	strh r1, [r0, #2]
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl GetWindowIdPageStart
	ldr r1, _02040F94 ; =_020AFE7C
	ldr r1, [r1, #8]
	add r1, r1, #0x300
	strh r0, [r1, #0xe8]
	mov r0, #5
	b _02040F88
_02040C90:
	ldrh r0, [sp, #0xa]
	tst r0, #2
	beq _02040CAC
	mov r0, #1
	bl PlaySeVolumeWrapper
	mov r0, #1
	b _02040F88
_02040CAC:
	tst r0, #4
	beq _02040D0C
	ldr r0, _02040F9C ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r1, [r0, #0xc]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02040CF4
_02040CD4: ; jump table
	b _02040CE4 ; case 0
	b _02040CE4 ; case 1
	b _02040CE4 ; case 2
	b _02040CE4 ; case 3
_02040CE4:
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl sub_02030EF0
	b _02040D04
_02040CF4:
	bl sub_02041178
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_02041000
_02040D04:
	mov r0, #6
	b _02040F88
_02040D0C:
	tst r0, #8
	beq _02040D28
	ldr r0, _02040FA0 ; =0x00003F04
	mov r1, #0x100
	bl sub_02017C74
	mov r0, #7
	b _02040F88
_02040D28:
#ifndef JAPAN
	ldrsb r0, [r5]
	bl sub_020308E4
	cmp r0, #0
	bne _02040F84
	ldrh r0, [sp, #0xa]
#endif
	tst r0, #0x400
	bne _02040D50
	tst r0, #1
	cmpeq r4, #0
	beq _02040F84
_02040D50:
#ifdef JAPAN
	ldrb r0, [r5, #0x3f8]
	cmp r0, #0
	beq _020410EC
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	add r0, r5, r0
	ldrb r0, [r0, #0x3e0]
	tst r0, #1
	bne _02040F70
_020410EC:
	cmp r4, #0
	addne r0, r5, #0x300
#else
	ldr r0, _02040F94 ; =_020AFE7C
	mov r2, #0
	ldr r3, [r0, #8]
	ldrb r1, [r3, #0x3f8]
	cmp r1, #0
	beq _02040D7C
	ldrsh r0, [r0, #2]
	add r0, r3, r0
	ldrb r0, [r0, #0x3e0]
	tst r0, #1
	movne r2, #1
_02040D7C:
	cmp r2, #0
	bne _02040F70
	cmp r4, #0
	addne r0, r3, #0x300
#endif
	movne r1, #6
	strneh r1, [r0, #0xe6]
	cmp r6, #0
	beq _02040EC8
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #0xc]
	cmp r0, #1
	cmpne r0, #5
	bne _02040EC8
	cmp r4, #0
	ldrne r0, _02040F94 ; =_020AFE7C
	movne r1, #0
	ldrne r0, [r0, #8]
	addne r0, r0, #0x300
	strneh r1, [r0, #0xe6]
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r1, [r0, #0xc]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02040E34
_02040DDC: ; jump table
	b _02040DEC ; case 0
	b _02040DEC ; case 1
	b _02040DEC ; case 2
	b _02040DEC ; case 3
_02040DEC:
	ldrsh r0, [r0, #2]
	bl sub_02041194
	cmp r0, #0
	bne _02040E10
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_02041364
	cmp r0, #0
	beq _02040E34
_02040E10:
	ldr r0, _02040F9C ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl sub_02030EF0
	mov r0, #8
	b _02040F88
_02040E34:
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_02041194
	cmp r0, #0
	beq _02040E88
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r1, [r0, #0xc]
	cmp r1, #5
	ldreqb r0, [r0]
	cmpeq r0, #0
	bne _02040E6C
	ldr r0, _02040FA4 ; =0x00001308
	bl PlaySeByIdVolumeWrapper
	b _02040E78
_02040E6C:
	ldr r0, _02040F9C ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
_02040E78:
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_020412B0
	b _02040EC0
_02040E88:
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_02041364
	cmp r0, #0
	beq _02040EB8
	ldr r0, _02040F9C ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldr r0, _02040F94 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bl sub_02041394
	b _02040EC0
_02040EB8:
	mov r0, #2
	bl PlaySeVolumeWrapper
_02040EC0:
	bl sub_02041178
	b _02040F84
_02040EC8:
	cmp r4, #0
	beq _02040EEC
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl sub_02030EF0
	b _02040F18
_02040EEC:
	ldrh r0, [sp, #0xa]
	tst r0, #0x400
	mov r0, #0
	beq _02040F14
	bl PlaySeVolumeWrapper
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl sub_02030EF0
	b _02040F18
_02040F14:
	bl PlaySeVolumeWrapper
_02040F18:
	ldr r0, _02040F94 ; =_020AFE7C
	mov r1, #2
	ldr r3, [r0, #8]
	mov r2, #0
	str r1, [r3, #0x3ec]
	ldr r3, [r0, #8]
	str r1, [r3, #0x3f0]
	ldr r6, [r0, #8]
	ldrsh r3, [r0, #2]
	ldr r5, [r6, #0x10]
	ldrsb r0, [r6]
	add r3, r5, r3, lsl #4
	add r3, r3, #4
	bl sub_02030978
	ldr r0, _02040F94 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl UpdateWindow
	cmp r4, #0
	bne _02040F84
	mov r0, #2
	b _02040F88
_02040F70:
	mov r0, #2
	bl PlaySeVolumeWrapper
	cmp r4, #0
	beq _02040F84
	bl sub_02041178
_02040F84:
	mov r0, #0
_02040F88:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02040F90: .word _022AAE2A
_02040F94: .word _020AFE7C
_02040F98: .word _0209C928
_02040F9C: .word 0x00003F07
_02040FA0: .word 0x00003F04
_02040FA4: .word 0x00001308
	arm_func_end sub_020407EC

	arm_func_start sub_02040FA8
sub_02040FA8: ; 0x02040FA8
	ldr r0, _02040FF4 ; =_022AADFC
	ldrb r0, [r0, #0x2c]
	cmp r0, #0
	beq _02040FD0
	ldr r0, _02040FF8 ; =_020AFE7C
	ldr r1, _02040FFC ; =_022AAE2A
	ldrsh r0, [r0, #2]
	ldrb r0, [r1, r0, lsl #3]
	tst r0, #8
	b _02040FE4
_02040FD0:
	ldr r0, _02040FF8 ; =_020AFE7C
	ldr r1, _02040FFC ; =_022AAE2A
	ldrsh r0, [r0, #2]
	ldrb r0, [r1, r0, lsl #3]
	tst r0, #4
_02040FE4:
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02040FF4: .word _022AADFC
_02040FF8: .word _020AFE7C
_02040FFC: .word _022AAE2A
	arm_func_end sub_02040FA8

	arm_func_start sub_02041000
sub_02041000: ; 0x02041000
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02041178
	ldr r2, _0204108C ; =_022AADFC
	ldrb r0, [r2, #0x2c]
	cmp r0, #0
	beq _02041078
	ldr r1, _02041090 ; =_022AAE2A
	ldrb r0, [r1, r4, lsl #3]
	tst r0, #8
	eorne r0, r0, #8
	strneb r0, [r1, r4, lsl #3]
	ldmneia sp!, {r4, pc}
	mov r3, #0
_02041038:
	add r0, r2, r3, lsl #3
	ldrb r0, [r0, #0x2e]
	tst r0, #8
	bne _02041050
	cmp r3, r4
	bne _02041060
_02041050:
	add r1, r2, r3, lsl #3
	ldrb r0, [r1, #0x2e]
	eor r0, r0, #8
	strb r0, [r1, #0x2e]
_02041060:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	cmp r3, #4
	blt _02041038
	ldmia sp!, {r4, pc}
_02041078:
	ldr r1, _02041090 ; =_022AAE2A
	ldrb r0, [r1, r4, lsl #3]
	eor r0, r0, #4
	strb r0, [r1, r4, lsl #3]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204108C: .word _022AADFC
_02041090: .word _022AAE2A
	arm_func_end sub_02041000

	arm_func_start sub_02041094
sub_02041094: ; 0x02041094
	ldr r0, _020410A0 ; =_020AFE7C
	ldrsh r0, [r0, #2]
	bx lr
	.align 2, 0
_020410A0: .word _020AFE7C
	arm_func_end sub_02041094

	arm_func_start sub_020410A4
sub_020410A4: ; 0x020410A4
	ldr r1, _0204114C ; =_020AFE7C
	cmp r0, #0
	strh r0, [r1, #2]
	movlt r0, #0
	strlth r0, [r1, #2]
	ldr r0, _0204114C ; =_020AFE7C
	ldrsh r2, [r0, #2]
	cmp r2, #4
	blt _02041100
	ldr r1, [r0, #0xc]
	cmp r1, #2
	cmpne r1, #3
	arm_func_end sub_020410A4

	arm_func_start sub_020410D4
sub_020410D4: ; 0x020410D4
	cmpne r1, #6
	arm_func_end sub_020410D4

	arm_func_start sub_020410D8
sub_020410D8: ; 0x020410D8
	bne _020410F8
	arm_func_end sub_020410D8

	arm_func_start sub_020410DC
sub_020410DC: ; 0x020410DC
	cmp r2, #4
	ldreq r0, _0204114C ; =_020AFE7C
	moveq r1, #4
	ldrne r0, _0204114C ; =_020AFE7C
	movne r1, #0
	strh r1, [r0, #2]
	bx lr
_020410F8:
	mov r1, #3
	strh r1, [r0, #2]
_02041100:
	ldr r2, _02041150 ; =_022AADFC
	ldr r0, _0204114C ; =_020AFE7C
_02041108:
	ldrsh r1, [r0, #2]
	cmp r1, #0
	ldrlt r0, _0204114C ; =_020AFE7C
	movlt r1, #0
	strlth r1, [r0, #2]
	bxlt lr
	add r1, r2, r1, lsl #3
	ldrb r1, [r1, #0x2e]
	tst r1, #1
	beq _02041138
	tst r1, #2
	bxeq lr
_02041138:
	ldrsh r1, [r0, #2]
	sub r1, r1, #1
	strh r1, [r0, #2]
	b _02041108
_02041148:
	bx lr
	.align 2, 0
_0204114C: .word _020AFE7C
_02041150: .word _022AADFC
	arm_func_end sub_020410DC

	arm_func_start sub_02041154
sub_02041154: ; 0x02041154
	cmp r0, #4
	ldreq r0, _02041170 ; =_022AADFC
	ldrne r1, _02041174 ; =_022AAE2E
	ldreqh r0, [r0, #0x54]
	movne r0, r0, lsl #3
	ldrneh r0, [r1, r0]
	bx lr
	.align 2, 0
_02041170: .word _022AADFC
_02041174: .word _022AAE2E
	arm_func_end sub_02041154

	arm_func_start sub_02041178
sub_02041178: ; 0x02041178
	ldr r0, _02041190 ; =_020AFE7C
	ldr r1, [r0, #8]
	cmp r1, #0
	movne r0, #1
	strneb r0, [r1, #0x3e5]
	bx lr
	.align 2, 0
_02041190: .word _020AFE7C
	arm_func_end sub_02041178

	arm_func_start sub_02041194
sub_02041194: ; 0x02041194
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020412AC ; =_022AAE2A
	mov r6, r0
	add r0, r4, r6, lsl #3
	ldrh r0, [r0, #4]
	bl IsNot2TurnsMoveOrSketch
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r5, r6, #1
	mov r7, #0
	mov r8, #1
	b _0204129C
_020411C8:
	ldrb r0, [r4, r5, lsl #3]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _020412A4
	add r0, r4, r5, lsl #3
	ldrh r0, [r0, #4]
	bl IsNot2TurnsMoveOrSketch
	cmp r0, #0
	beq _020412A4
	ldrb r0, [r4, r5, lsl #3]
	tst r0, #2
	bne _02041298
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	b _02041228
_02041210:
	ldrb r1, [r4, r0, lsl #3]
	tst r1, #2
	beq _02041230
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_02041228:
	cmp r0, #4
	blt _02041210
_02041230:
	mov r1, r6, lsl #0x10
	mov r5, r1, asr #0x10
	b _02041288
_0204123C:
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	add r1, r4, r5, lsl #3
	ldrh r2, [r1, #4]
	b _02041274
_02041254:
	add r1, r4, r3, lsl #3
	ldrh r1, [r1, #4]
	cmp r2, r1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02041274:
	cmp r3, r0
	blt _02041254
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
_02041288:
	cmp r5, r0
	blt _0204123C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02041298:
	add r5, r5, #1
_0204129C:
	cmp r5, #4
	blt _020411C8
_020412A4:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020412AC: .word _022AAE2A
	arm_func_end sub_02041194

	arm_func_start sub_020412B0
sub_020412B0: ; 0x020412B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02041194
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, r4, #1
	ldr r0, _02041358 ; =_022AAE2A
	mov r3, #0
	mov ip, #1
	b _0204133C
_020412D8:
	ldrb r2, [r0, r1, lsl #3]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02041344
	ldrb r2, [r0, r1, lsl #3]
	tst r2, #2
	bne _02041338
	ldr r2, _0204135C ; =_022AADFC
	ldr lr, _02041358 ; =_022AAE2A
	ldrb r2, [r2, #0x2c]
	cmp r2, #0
	ldrne r3, _02041358 ; =_022AAE2A
	ldrneb r2, [r3, r1, lsl #3]
	bicne r2, r2, #8
	strneb r2, [r3, r1, lsl #3]
	ldrb ip, [lr, r1, lsl #3]
	ldr r2, _02041360 ; =_020AFE7C
	mov r3, #1
	strb r3, [r2]
	bic r2, ip, #4
	strb r2, [lr, r1, lsl #3]
	b _02041344
_02041338:
	add r1, r1, #1
_0204133C:
	cmp r1, #4
	blt _020412D8
_02041344:
	ldrb r2, [r0, r1, lsl #3]
	orr r2, r2, #2
	strb r2, [r0, r1, lsl #3]
	bl sub_02041178
	ldmia sp!, {r4, pc}
	.align 2, 0
_02041358: .word _022AAE2A
_0204135C: .word _022AADFC
_02041360: .word _020AFE7C
	arm_func_end sub_020412B0

	arm_func_start sub_02041364
sub_02041364: ; 0x02041364
	cmp r0, #3
	ldr r1, _02041390 ; =_022AAE2A
	moveq r0, #0
	bxeq lr
	add r0, r0, #1
	ldrb r0, [r1, r0, lsl #3]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02041390: .word _022AAE2A
	arm_func_end sub_02041364

	arm_func_start sub_02041394
sub_02041394: ; 0x02041394
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02041364
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add ip, r4, #1
	ldr r3, _020413FC ; =_022AAE2A
	mov r1, #0
	mov r2, #1
	b _020413EC
_020413BC:
	ldrb r0, [r3, ip, lsl #3]
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _020413F4
	ldrb r0, [r3, ip, lsl #3]
	tst r0, #2
	beq _020413F4
	eor r0, r0, #2
	strb r0, [r3, ip, lsl #3]
	add ip, ip, #1
_020413EC:
	cmp ip, #4
	blt _020413BC
_020413F4:
	bl sub_02041178
	ldmia sp!, {r4, pc}
	.align 2, 0
_020413FC: .word _022AAE2A
	arm_func_end sub_02041394

	arm_func_start sub_02041400
sub_02041400: ; 0x02041400
	ldr r0, _02041410 ; =_020AFE7C
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_02041410: .word _020AFE7C
	arm_func_end sub_02041400

	arm_func_start sub_02041414
sub_02041414: ; 0x02041414
	ldr r0, _02041420 ; =_020AFE7C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_02041420: .word _020AFE7C
	arm_func_end sub_02041414

	arm_func_start sub_02041424
sub_02041424: ; 0x02041424
	cmp r0, #0
	movgt r0, #1
	bxgt lr
	mov ip, #1
	ldr r3, _02041480 ; =_022AAE2A
	mov r1, #0
	mov r2, ip
	b _02041470
_02041444:
	ldrb r0, [r3, ip, lsl #3]
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _02041478
	ldrb r0, [r3, ip, lsl #3]
	tst r0, #2
	moveq r0, #1
	bxeq lr
	add ip, ip, #1
_02041470:
	cmp ip, #4
	blt _02041444
_02041478:
	mov r0, #0
	bx lr
	.align 2, 0
_02041480: .word _022AAE2A
	arm_func_end sub_02041424

	arm_func_start sub_02041484
sub_02041484: ; 0x02041484
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x20
	ldr r1, _02041594 ; =_020AFE7C
	ldr r0, _02041598 ; =_022AAE2A
	ldrsh r2, [r1, #2]
	mov r1, #0
	mov r3, r1
	strb r1, [r0, r2, lsl #3]
	add r5, r2, #1
	mov r4, #1
	b _020414DC
_020414B0:
	ldrb r2, [r0, r5, lsl #3]
	tst r2, #1
	movne r2, r4
	moveq r2, r3
	tst r2, #0xff
	beq _020414E4
	ldrb r2, [r0, r5, lsl #3]
	tst r2, #2
	beq _020414E4
	strb r1, [r0, r5, lsl #3]
	add r5, r5, #1
_020414DC:
	cmp r5, #4
	blt _020414B0
_020414E4:
	mov r6, #0
	mov r7, r6
	mov r4, r6
	mov r5, #1
	add lr, sp, #0
_020414F8:
	ldrb r1, [r0, r7, lsl #3]
	tst r1, #1
	movne r1, r5
	moveq r1, r4
	tst r1, #0xff
	beq _02041530
	add ip, r0, r7, lsl #3
	add r3, lr, r6, lsl #3
	mov r2, #4
_0204151C:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0204151C
	add r6, r6, #1
_02041530:
	add r7, r7, #1
	cmp r7, #4
	blt _020414F8
	mov r2, #0
	add r1, sp, #0
	b _02041550
_02041548:
	strb r2, [r1, r6, lsl #3]
	add r6, r6, #1
_02041550:
	cmp r6, #4
	blt _02041548
	mov r4, #0
	add lr, sp, #0
_02041560:
	add ip, lr, r4, lsl #3
	add r3, r0, r4, lsl #3
	mov r2, #4
_0204156C:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0204156C
	add r4, r4, #1
	cmp r4, #4
	blt _02041560
	bl sub_02041178
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02041594: .word _020AFE7C
_02041598: .word _022AAE2A
	arm_func_end sub_02041484

	arm_func_start sub_0204159C
sub_0204159C: ; 0x0204159C
	ldr r0, _020415B8 ; =_022AADFC
	ldrb r0, [r0, #0x58]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020415B8: .word _022AADFC
	arm_func_end sub_0204159C

	arm_func_start sub_020415BC
sub_020415BC: ; 0x020415BC
	mov r3, #0
	ldr ip, _02041610 ; =_022AAE2A
	mov r1, r3
	mov r2, #1
	b _020415F4
_020415D0:
	ldrb r0, [ip, r3, lsl #3]
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _020415FC
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_020415F4:
	cmp r3, #4
	blt _020415D0
_020415FC:
	cmp r3, #4
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02041610: .word _022AAE2A
	arm_func_end sub_020415BC

	arm_func_start sub_02041614
sub_02041614: ; 0x02041614
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _020416B0 ; =_022AAE2A
	mov r2, r5
	mov r3, #1
	b _02041694
_0204162C:
	ldrb r1, [r4, r5, lsl #3]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	bne _02041688
	mov r1, #5
	strb r1, [r4, r5, lsl #3]
	add r2, r4, r5, lsl #3
	strh r0, [r2, #4]
	mov r1, #0
	ldr r0, _020416B4 ; =_022AADFC
	strb r1, [r2, #7]
	ldrsh r0, [r0, #0x5a]
	ldr r1, _020416B8 ; =_022AAE58
	bl GetPpIncrease
	add r1, r4, r5, lsl #3
	strh r0, [r1, #2]
	mov r0, r1
	bl GetMaxPp
	add r1, r4, r5, lsl #3
	strb r0, [r1, #6]
	b _0204169C
_02041688:
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
_02041694:
	cmp r5, #4
	blt _0204162C
_0204169C:
	cmp r5, #4
	mvnge r5, #0
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020416B0: .word _022AAE2A
_020416B4: .word _022AADFC
_020416B8: .word _022AAE58
	arm_func_end sub_02041614

	arm_func_start sub_020416BC
sub_020416BC: ; 0x020416BC
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _020416D8 ; =_022AAE2A
	bl sub_02013F58
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_020416D8: .word _022AAE2A
	arm_func_end sub_020416BC

	arm_func_start sub_020416DC
sub_020416DC: ; 0x020416DC
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _020416F8 ; =_022AAE2A
	bl sub_02013E54
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_020416F8: .word _022AAE2A
	arm_func_end sub_020416DC

	arm_func_start sub_020416FC
sub_020416FC: ; 0x020416FC
	stmdb sp!, {r3, lr}
	ldr r0, _02041720 ; =_020AFE7C
	ldr r0, [r0, #8]
	ldrsb r0, [r0]
	bl sub_020307EC
	mov r0, #1
	bl sub_0204027C
	bl sub_02041178
	ldmia sp!, {r3, pc}
	.align 2, 0
_02041720: .word _020AFE7C
	arm_func_end sub_020416FC

	arm_func_start sub_02041724
sub_02041724: ; 0x02041724
	stmdb sp!, {r3, lr}
	bl IsDeoxys
	cmp r0, #0
	ldrne r0, _02041748 ; =_022AADFC
	movne r1, #1
	ldreq r0, _02041748 ; =_022AADFC
	moveq r1, #0
	strb r1, [r0, #0x58]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02041748: .word _022AADFC
	arm_func_end sub_02041724

	arm_func_start SprintfStatic__0204174C
SprintfStatic__0204174C: ; 0x0204174C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__0204174C

	arm_func_start sub_02041774
sub_02041774: ; 0x02041774
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x2bc
	mov r1, #8
	bl MemAlloc
	ldr r1, _020417A4 ; =_020AFE8C
	mvn r2, #1
	str r0, [r1]
	str r4, [r0, #4]
	ldr r0, [r1]
	strb r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020417A4: .word _020AFE8C
	arm_func_end sub_02041774

	arm_func_start sub_020417A8
sub_020417A8: ; 0x020417A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	mov r4, r2
	mov r7, r0
	cmp r4, r6
	mvnge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r7, r4, lsl #3]
	tst r0, #1
	mvneq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r3
	bl sub_02041774
	ldr r0, _0204185C ; =_020AFE8C
	add r1, r7, r4, lsl #3
	ldr r0, [r0]
	mov r2, #8
	add r0, r0, #8
	bl memcpy
	add r5, r4, #1
	mov r4, #1
	mov sb, #8
	ldr r8, _0204185C ; =_020AFE8C
	b _02041840
_02041808:
	ldrb r0, [r7, r5, lsl #3]
	mov r1, r5, lsl #3
	tst r0, #1
	beq _0204183C
	tst r0, #2
	beq _02041848
	ldr r0, [r8]
	mov r2, sb
	add r0, r0, #8
	add r0, r0, r4, lsl #3
	add r1, r7, r1
	bl memcpy
	add r4, r4, #1
_0204183C:
	add r5, r5, #1
_02041840:
	cmp r5, r6
	blt _02041808
_02041848:
	ldr r0, _0204185C ; =_020AFE8C
	ldr r0, [r0]
	strh r4, [r0, #0x28]
	bl sub_020418A4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204185C: .word _020AFE8C
	arm_func_end sub_020417A8

	arm_func_start sub_02041860
sub_02041860: ; 0x02041860
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_02041774
	ldr r0, _020418A0 ; =_020AFE8C
	mov r1, r4
	ldr r0, [r0]
	mov r2, #8
	add r0, r0, #8
	bl memcpy
	ldr r0, _020418A0 ; =_020AFE8C
	mov r1, #1
	ldr r0, [r0]
	strh r1, [r0, #0x28]
	bl sub_020418A4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020418A0: .word _020AFE8C
	arm_func_end sub_02041860

	arm_func_start sub_020418A4
sub_020418A4: ; 0x020418A4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r7, #0
	ldr r6, _020419F0 ; =0x000008D4
	ldr r5, _020419F4 ; =_020AFE8C
	mov r4, #0x50
	b _02041950
_020418C0:
	ldr r1, [r5]
	mul r8, r7, r4
	add r0, r1, r7, lsl #3
	ldrh r0, [r0, #0xc]
	add r1, r1, r7, lsl #1
	add r1, r1, #0x200
	strh r6, [r1, #0xac]
	ldr r2, [r5]
#if defined(EUROPE)
	add r1, r0, #0x3a4
#elif defined(JAPAN)
	add r1, r0, #0x9f
#else
	add r1, r0, #0xa2
#endif
	add r2, r2, r8
	str r0, [r2, #0x3c]
	ldr r2, [r5]
#if defined(EUROPE)
	add r3, r1, #0x2400
#elif defined(JAPAN)
	add r3, r1, #0x3f00
#else
	add r3, r1, #0x2700
#endif
	add r1, r2, r7, lsl #1
	add r1, r1, #0x200
	strh r3, [r1, #0xb4]
	ldr r1, [r5]
	add r1, r1, r8
	str r0, [r1, #0x17c]
	ldr r0, [r5]
	add r0, r0, #8
	add r0, r0, r7, lsl #3
	bl GetMoveRangeId
	ldr r1, [r5]
	add r1, r1, r8
	str r0, [r1, #0x180]
	ldr r0, [r5]
	add r0, r0, #8
	add r0, r0, r7, lsl #3
	bl GetMoveType
	ldr r2, [r5]
	add r1, r7, #1
	add r2, r2, r8
	mov r1, r1, lsl #0x10
	str r0, [r2, #0x184]
	mov r7, r1, asr #0x10
_02041950:
	ldr r2, [r5]
	ldrsh r3, [r2, #0x28]
	cmp r7, r3
	blt _020418C0
	cmp r3, #1
	ble _020419A0
	add r0, r2, #0x2ac
	str r0, [sp]
	add r0, r2, #0x2c
	str r0, [sp, #4]
	add r4, r2, #0x2b4
	str r4, [sp, #8]
	add r4, r2, #0x16c
	ldr r0, _020419F8 ; =_0209C97C
	ldr r1, _020419FC ; =0x00001013
	mov r2, #0
	str r4, [sp, #0xc]
	bl CreateScrollBoxMulti
	ldr r1, _020419F4 ; =_020AFE8C
	b _020419D4
_020419A0:
	add r0, r2, #0x2c
	str r0, [sp]
	add r1, r2, #0x200
	ldrh r3, [r1, #0xb4]
	add r2, r2, #0x16c
	ldr r0, _020419F8 ; =_0209C97C
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrh r3, [r1, #0xac]
	ldr r1, _020419FC ; =0x00001013
	mov r2, #0
	bl CreateScrollBoxSingle
	ldr r1, _020419F4 ; =_020AFE8C
_020419D4:
	ldr r1, [r1]
	strb r0, [r1]
	ldr r0, _020419F4 ; =_020AFE8C
	ldr r0, [r0]
	ldrsb r0, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_020419F0: .word 0x00001D2C
#else
_020419F0: .word 0x000008D4
#endif
_020419F4: .word _020AFE8C
_020419F8: .word _0209C97C
_020419FC: .word 0x00001013
	arm_func_end sub_020418A4

	arm_func_start sub_02041A00
sub_02041A00: ; 0x02041A00
	ldr r0, _02041A10 ; =_020AFE8C
	ldr ip, _02041A14 ; =MemFree
	ldr r0, [r0]
	bx ip
	.align 2, 0
_02041A10: .word _020AFE8C
_02041A14: .word MemFree
	arm_func_end sub_02041A00

	arm_func_start sub_02041A18
sub_02041A18: ; 0x02041A18
	stmdb sp!, {r3, lr}
	ldr r0, _02041A3C ; =_020AFE8C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsScrollBoxActive
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02041A3C: .word _020AFE8C
	arm_func_end sub_02041A18

	arm_func_start PrintIqSkillsMenu
PrintIqSkillsMenu: ; 0x02041A40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xa0
	mov r7, r0
	mov r6, r1
	add r0, sp, #8
	mov r1, #0x98
	mov r5, r2
	mov r4, r3
	bl MemZero
	mov r1, #0xd
#ifdef JAPAN
	ldr r0, _02041ED4 ; =0x00001586
#else
	rsb r0, r1, #0xa80
#endif
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x10
	strh r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r0, #0x840
	mov r1, #8
	bl MemAlloc
	ldr r2, _02041B6C ; =_020AFE90
	mov r1, #0x840
	str r0, [r2, #4]
	bl MemZero
	ldr r3, _02041B6C ; =_020AFE90
	mov r1, r7
	ldr r0, [r3, #4]
	mov r2, r5
	str r6, [r0, #0x790]
	ldr r0, [r3, #4]
	add r0, r0, #0x700
	strh r7, [r0, #0x94]
	ldr r0, [r3, #4]
	str r5, [r0, #0x798]
	ldr r0, [r3, #4]
	add r0, r0, #0x64
	bl GetLearnableIqSkills
	ldr r3, _02041B6C ; =_020AFE90
	ldr r1, _02041B70 ; =0x80401C33
	ldr r2, [r3, #4]
	mov r5, #8
	add r2, r2, #0x700
	strh r0, [r2, #0x8c]
	ldr r2, [r3, #4]
	ldr r0, _02041B74 ; =_0209C98C
	add r2, r2, #0x700
	ldrsh r6, [r2, #0x8c]
	ldr r3, _02041B78 ; =GetCheckIqMenuSkillString
	add r2, sp, #8
	str r6, [sp]
	str r5, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _02041B6C ; =_020AFE90
	mov r2, #0
	ldr r3, [r1, #4]
	strb r0, [r3]
	ldr r0, [r1, #4]
	str r2, [r0, #0x6f0]
	ldr r0, [r1, #4]
	str r2, [r0, #0x6ec]
	ldr r0, [r1, #4]
	strb r4, [r0, #0x83c]
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	strh r2, [r0, #0x8e]
	ldr r0, [r1, #4]
	add r0, r0, #0x14
	bl InitPreprocessorArgs
	ldr r0, _02041B6C ; =_020AFE90
	ldr r1, [r0, #4]
	add r0, r1, #0x34
	add r0, r0, #0x800
	str r0, [r1, #0x7fc]
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02041ED4: .word 0x00001586
#endif
_02041B6C: .word _020AFE90
_02041B70: .word 0x80401C33
_02041B74: .word _0209C98C
_02041B78: .word GetCheckIqMenuSkillString
	arm_func_end PrintIqSkillsMenu

	arm_func_start sub_02041B7C
sub_02041B7C: ; 0x02041B7C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xf8
	ldr r1, _020420BC ; =_020AFE90
	ldr r3, [r1, #4]
	ldr r0, [r3, #0x6f0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020420B0
_02041B9C: ; jump table
	b _02041BC0 ; case 0
	b _02041DB0 ; case 1
	b _02041E40 ; case 2
	b _02041EBC ; case 3
	b _02041F30 ; case 4
	b _02041EE4 ; case 5
	b _02041FA4 ; case 6
	b _02041FE8 ; case 7
	b _020420A0 ; case 8
_02041BC0:
	ldrsb r0, [r3]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _02041CF8
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	ldr r2, _020420BC ; =_020AFE90
	mvn r1, #0
	ldr r3, [r2, #4]
	str r0, [r3, #0x838]
	ldr r2, [r2, #4]
	ldr r0, [r2, #0x838]
	cmp r0, r1
	moveq r0, #8
	streq r0, [r2, #0x6f0]
	beq _020420B0
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _020420BC ; =_020AFE90
	ldr r2, _020420C0 ; =_0209C9B0
	ldrsb r3, [r0]
	ldr r1, [r0, #4]
	ldr r2, [r2, r3, lsl #3]
	str r2, [r1, #0x79c]
	ldr r3, [r0, #4]
	ldr r2, [r3, #0x838]
	ldrb r1, [r3, #0x83c]
	add r2, r3, r2
	ldrb r2, [r2, #0x64]
	cmp r1, #0
	bne _02041C60
	cmp r2, #0x18
	cmpne r2, #0x1b
	beq _02041C60
	add r1, r2, #0xc8
	and r1, r1, #0xff
	cmp r1, #1
	bhi _02041C7C
_02041C60:
	mov r1, #3
	ldr r0, _020420BC ; =_020AFE90
	strb r1, [r3, #0x834]
	ldr r0, [r0, #4]
	mov r1, #0
	strb r1, [r0, #0x835]
	b _02041C8C
_02041C7C:
	mov r1, #0
	strb r1, [r3, #0x834]
	ldr r0, [r0, #4]
	strb r1, [r0, #0x835]
_02041C8C:
	ldr r0, _020420BC ; =_020AFE90
	mov r1, #0x98
	ldr r0, [r0, #4]
	add r0, r0, #0x39c
	add r0, r0, #0x400
	bl MemZero
	ldr r2, _020420BC ; =_020AFE90
	ldr r3, _020420C4 ; =_0209C9AC
	ldr r4, [r2, #4]
	mov r1, #0
	add r0, r4, #0x34
	add r0, r0, #0x800
	str r0, [r4, #0x7fc]
	str r3, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r2, #4]
	ldr r0, _020420C8 ; =_0209C99C
	add r3, r2, #0x39c
	ldr r2, _020420CC ; =0x80000233
	add r3, r3, #0x400
	bl sub_02046A20
	ldr r0, _020420BC ; =_020AFE90
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0x6f0]
	b _020420B0
_02041CF8:
	add r1, sp, #0xc
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp, #0xc]
	tst r0, #8
	beq _02041D54
	ldr r0, _020420D0 ; =0x00003F04
	bl PlaySeByIdVolumeWrapper
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202C1E4
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	ldr r1, _020420BC ; =_020AFE90
	mov r2, #3
	ldr r3, [r1, #4]
	str r0, [r3, #0x838]
	ldr r0, [r1, #4]
	str r2, [r0, #0x6f0]
	b _020420B0
_02041D54:
	tst r0, #4
	beq _020420B0
	ldr r0, _020420BC ; =_020AFE90
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x83c]
	cmp r0, #0
	beq _02041D7C
	ldr r0, _020420D4 ; =0x00003F03
	bl PlaySeByIdVolumeWrapper
	b _020420B0
_02041D7C:
	ldrsb r0, [r1]
	bl sub_0202C1E4
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl GetAdvancedMenuResult
	ldr r1, _020420BC ; =_020AFE90
	mov r2, #2
	ldr r3, [r1, #4]
	str r0, [r3, #0x838]
	ldr r0, [r1, #4]
	str r2, [r0, #0x6f0]
	b _020420B0
_02041DB0:
	bl sub_02046B04
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _020420BC ; =_020AFE90
	add r2, r4, #2
	strb r0, [r1]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _020420B0
_02041DD4: ; jump table
	b _02041DF0 ; case 0
	b _020420B0 ; case 1
	b _02041E14 ; case 2
	b _02041E24 ; case 3
	b _02041DE8 ; case 4
_02041DE8:
	mov r0, #0
	bl PlaySeVolumeWrapper
_02041DF0:
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	ldr r0, _020420BC ; =_020AFE90
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x6f0]
	b _020420B0
_02041E14:
	ldr r0, [r1, #4]
	mov r1, #2
	str r1, [r0, #0x6f0]
	b _020420B0
_02041E24:
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _020420BC ; =_020AFE90
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #0x6f0]
	b _020420B0
_02041E40:
	ldr r1, [r3, #0x838]
	add r2, r3, #0x64
	ldrb r0, [r2, r1]
	cmp r0, #0x18
	bne _02041E60
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02041E98
_02041E60:
	cmp r0, #0x1b
	beq _02041E78
	add r0, r0, #0xc8
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02041E84
_02041E78:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _02041E98
_02041E84:
	ldrb r1, [r2, r1]
	ldr r0, [r3, #0x790]
	bl DisableIqSkill
	ldr r0, _020420D8 ; =0x00003F07
	bl PlaySeByIdVolumeWrapper
_02041E98:
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl ResumeAdvancedMenu
	ldr r0, _020420BC ; =_020AFE90
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x6f0]
	b _020420B0
_02041EBC:
	ldrsb r0, [r3]
	bl sub_0202812C
	ldr r1, _020420BC ; =_020AFE90
	mov r2, #5
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	strh r2, [r0, #0x8e]
	ldr r0, [r1, #4]
	str r2, [r0, #0x6f0]
	b _020420B0
_02041EE4:
	add r0, r3, #0x700
	ldrsh r2, [r0, #0x8e]
	sub r2, r2, #1
	strh r2, [r0, #0x8e]
	ldr r2, [r1, #4]
	add r0, r2, #0x700
	ldrsh r0, [r0, #0x8e]
	cmp r0, #0
	bge _020420B0
	mov r0, #4
	str r0, [r2, #0x6f0]
	ldr r0, [r1, #4]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _020420BC ; =_020AFE90
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0]
	b _020420B0
_02041F30:
	add r0, sp, #0xa8
	bl InitPreprocessorArgs
	ldr r0, _020420BC ; =_020AFE90
	add ip, sp, #0xa8
	ldr r3, [r0, #4]
	ldr r0, _020420DC ; =_020AFE98
	ldr r2, [r3, #0x838]
	ldr r1, _020420E0 ; =0x00001013
	add r2, r3, r2
	ldrb lr, [r2, #0x64]
	ldr r3, _020420E4 ; =0x00000A77
	mov r2, #0
	str lr, [sp, #0xb8]
	str ip, [sp]
	ldr ip, [sp, #0xb8]
#if defined(EUROPE)
	add ip, ip, #0x32c
	add ip, ip, #0x2400
#elif defined(JAPAN)
	add ip, ip, #0x358
	add ip, ip, #0x3c00
#else
	add ip, ip, #0x2a
	add ip, ip, #0x2700
#endif
	mov ip, ip, lsl #0x10
	mov ip, ip, lsr #0x10
	str ip, [sp, #4]
	str r2, [sp, #8]
	bl CreateScrollBoxSingle
	ldr r1, _020420BC ; =_020AFE90
	mov r2, #6
	ldr r3, [r1, #4]
	strb r0, [r3, #1]
	ldr r0, [r1, #4]
	str r2, [r0, #0x6f0]
	b _020420B0
_02041FA4:
	ldrsb r0, [r3, #1]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _020420B0
	ldr r0, _020420BC ; =_020AFE90
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #1]
	bl CloseScrollBox
	ldr r0, _020420BC ; =_020AFE90
	mov r3, #7
	ldr r2, [r0, #4]
	mov r1, #8
	str r3, [r2, #0x6f0]
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	strh r1, [r0, #0x8e]
	b _020420B0
_02041FE8:
	add r0, r3, #0x700
	ldrsh r2, [r0, #0x8e]
	sub r2, r2, #1
	strh r2, [r0, #0x8e]
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsh r2, [r0, #0x8e]
	cmp r2, #0
	bge _020420B0
	mov r3, #0
	strh r3, [r0, #0x8e]
	ldr r2, [r1, #4]
	mov r0, #0xd
	str r3, [r2, #0x6f0]
	ldr r3, [r1, #4]
	str r0, [sp, #0x14]
	ldr r2, [r3, #0x838]
#ifdef JAPAN
	ldr r1, _02042454 ; =0x00001586
#else
	rsb r1, r0, #0xa80
#endif
	mov r0, #0x10
	str r0, [sp, #0x1c]
	str r2, [sp, #0x10]
	strh r1, [sp, #0x18]
	add r0, r3, #0x700
	ldrsh r1, [r0, #0x94]
	ldr r2, [r3, #0x798]
	add r0, r3, #0x64
	bl GetLearnableIqSkills
	ldr ip, _020420BC ; =_020AFE90
	ldr r1, _020420E8 ; =0x80401C33
	ldr r3, [ip, #4]
	add r2, sp, #0x10
	add r3, r3, #0x700
	strh r0, [r3, #0x8c]
	ldr r3, [ip, #4]
	ldr r0, _020420EC ; =_0209C98C
	add r3, r3, #0x700
	ldrsh lr, [r3, #0x8c]
	ldr r3, _020420F0 ; =GetCheckIqMenuSkillString
	mov ip, #8
	str lr, [sp]
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _020420BC ; =_020AFE90
	ldr r1, [r1, #4]
	strb r0, [r1]
	b _020420B0
_020420A0:
	mov r0, #9
	str r0, [r3, #0x6f0]
	mov r0, #1
	b _020420B4
_020420B0:
	mov r0, #0
_020420B4:
	add sp, sp, #0xf8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020420BC: .word _020AFE90
_020420C0: .word _0209C9B0
_020420C4: .word _0209C9AC
_020420C8: .word _0209C99C
_020420CC: .word 0x80000233
_020420D0: .word 0x00003F04
_020420D4: .word 0x00003F03
_020420D8: .word 0x00003F07
_020420DC: .word _020AFE98
_020420E0: .word 0x00001013
#ifdef JAPAN
_020420E4: .word 0x0000158A
_02042454: .word 0x00001586
#else
_020420E4: .word 0x00000A77
#endif
_020420E8: .word 0x80401C33
_020420EC: .word _0209C98C
_020420F0: .word GetCheckIqMenuSkillString
	arm_func_end sub_02041B7C

	arm_func_start sub_020420F4
sub_020420F4: ; 0x020420F4
	stmdb sp!, {r3, lr}
	ldr r0, _02042138 ; =_020AFE90
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	mvn r1, #1
	cmp r0, r1
	beq _0204211C
	bl CloseAdvancedMenu
_0204211C:
	ldr r0, _02042138 ; =_020AFE90
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02042138 ; =_020AFE90
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02042138: .word _020AFE90
	arm_func_end sub_020420F4

	arm_func_start GetCheckIqMenuSkillString
GetCheckIqMenuSkillString: ; 0x0204213C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x84
	ldr r2, _02042248 ; =_020AFE90
	mov r4, r0
	ldr r2, [r2, #4]
	mov r6, #0
	add r0, r2, r1
	ldrb r5, [r0, #0x64]
	ldr r0, [r2, #0x790]
	cmp r5, #0x18
	bne _02042174
	mov r0, #3
	bl GetResolvedPerformanceProgressFlag
	b _0204217C
_02042174:
	mov r1, r5
	bl IqSkillFlagTest
_0204217C:
	cmp r0, #0
	movne r6, #1
	cmp r6, #0
	beq _020421DC
	cmp r5, #0x38
	bgt _020421B4
	bge _020421BC
	cmp r5, #0x1b
	bgt _020421CC
	cmp r5, #0x18
	blt _020421CC
	cmpne r5, #0x1b
	beq _020421BC
	b _020421CC
_020421B4:
	cmp r5, #0x39
	bne _020421CC
_020421BC:
	ldr r1, _0204224C ; =_0209C9CC
	add r0, sp, #0x44
	bl strcpy
	b _020421E8
_020421CC:
	ldr r1, _02042250 ; =_0209C9D4
	add r0, sp, #0x44
	bl strcpy
	b _020421E8
_020421DC:
	ldr r1, _02042254 ; =_0209C9DC
	add r0, sp, #0x44
	bl strcpy
_020421E8:
	ldr r1, _02042248 ; =_020AFE90
	mov r0, r5
	ldr r1, [r1, #4]
	str r5, [r1, #0x24]
	bl GetIqSkillStringId
	mov r1, r0
	add r0, sp, #4
	mov r2, #0x40
	bl CopyNStringFromId
	add r0, sp, #0x44
	add r1, sp, #4
	bl strcat
	ldr r1, _02042248 ; =_020AFE90
	mov r0, r4
	ldr r2, [r1, #4]
	mov r1, #0x40
	add r2, r2, #0x14
	str r2, [sp]
	add r2, sp, #0x44
	mov r3, #0
	bl PreprocessString
	mov r0, r4
	add sp, sp, #0x84
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02042248: .word _020AFE90
_0204224C: .word _0209C9CC
_02042250: .word _0209C9D4
_02042254: .word _0209C9DC
	arm_func_end GetCheckIqMenuSkillString

	arm_func_start InitUnkStorageStruct0xA0
InitUnkStorageStruct0xA0: ; 0x02042258
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	mov r0, #0xa0
	mov r1, #8
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r1, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	str r0, [r1, #4]
	str r6, [r0]
	bl RemoveEmptyItemsInBag
	mov r0, #0x14
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r1, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	cmp r4, #0
	ldr r3, [r1, #4]
	ldrne r4, _020423B8 ; =sub_020423D8
	str r0, [r3, #8]
	ldr r2, _020423BC ; =0x0000032F
	ldr r0, [r1, #4]
	mov ip, #0x10
	strh r2, [r0, #0x10]
	ldr r0, [r1, #4]
	mov r3, #0xd
	str ip, [r0, #0x14]
	ldr r0, [r1, #4]
	ldr r2, _020423C0 ; =sub_0204261C
	str r3, [r0, #0xc]
	ldr r0, [r1, #4]
	moveq r4, #0
	str r2, [r0, #0x7c]
	bl GetNbItemsInBag
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	str r5, [sp, #8]
	ldr r2, [r0, #4]
	ldr r0, _020423C4 ; =_0209C9E4
	ldr r1, _020423C8 ; =0x00443C33
	ldr r3, _020423CC ; =sub_02042760
	add r2, r2, #8
	bl CreateCollectionMenu
	ldr r2, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	ldr r1, _020423D0 ; =sub_0204262C
	ldr r3, [r2, #4]
	strb r0, [r3, #4]
	ldr r0, [r2, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202D068
	ldr r0, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	ldr r1, _020423D4 ; =sub_0204263C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl SetCollectionMenuVoidFn
	ldr r0, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	mov r1, #0xd
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl SetCollectionMenuField0x1BC
	ldr r0, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #3
	beq _02042368
	cmp r0, #4
	beq _0204237C
	b _020423A0
_02042368:
#ifdef EUROPE
	ldrsb r0, [r1, #4]
	mov r1, #9
	bl SetCollectionMenuField0x1BC
#endif
	mov r0, #0
	bl sub_0204440C
	mov r0, #2
	bl sub_0204426C
	b _020423A0
_0204237C:
	ldrsb r0, [r1, #4]
#ifdef EUROPE
	mov r1, #9
	bl SetCollectionMenuField0x1BC
	ldr r0, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
#endif
	mov r1, #0x76
#ifdef EUROPE
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
#endif
	bl SetCollectionMenuWidth
	mov r0, #0
	bl sub_0204440C
	mov r0, #0
	bl sub_0204426C
	mov r0, #0
	bl sub_02044568
_020423A0:
	ldr r0, _020423B4 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020423B4: .word UNK_STORAGE_STRUCT_0XC
_020423B8: .word sub_020423D8
#ifdef JAPAN
_020423BC: .word 0x000031F4
#else
_020423BC: .word 0x0000032F
#endif
_020423C0: .word sub_0204261C
_020423C4: .word _0209C9E4
_020423C8: .word 0x00443C33
_020423CC: .word sub_02042760
_020423D0: .word sub_0204262C
_020423D4: .word sub_0204263C
	arm_func_end InitUnkStorageStruct0xA0

	arm_func_start sub_020423D8
sub_020423D8: ; 0x020423D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	mov r5, #0
	ldr r2, [r1, #4]
	ldr r1, [r2]
	cmp r1, #3
	bne _02042498
	tst r0, #0x800
	beq _02042498
	bl sub_02042B20
	cmp r0, #0
	ble _0204241C
	bl ClearBagSelectedItemTable
	mov r0, #6
	bl PlaySeVolumeWrapper
	mov r5, #1
	b _020425D8
_0204241C:
	bl sub_0200FD48
	mov r4, r0
	bl CountNbOfItemsInStorage
	sub r7, r4, r0
	mov r8, r5
	mov r6, #1
	ldr r4, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	b _02042470
_0204243C:
	cmp r7, #0
	ble _02042478
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	bl IsStorableItem
	cmp r0, #0
	ldrne r0, [r4, #8]
	movne r5, r6
	strne r6, [r0, r8, lsl #2]
	subne r7, r7, #1
	add r8, r8, #1
_02042470:
	cmp r8, #0x32
	blt _0204243C
_02042478:
	cmp r5, #0
	beq _0204248C
	mov r0, #6
	bl PlaySeVolumeWrapper
	b _020425D8
_0204248C:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _020425D8
_02042498:
	tst r0, #0x400
	beq _020425D8
	ldrsb r0, [r2, #4]
	bl sub_0202D0EC
	ldr r1, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r0, [r0]
	cmp r0, #3
	beq _020424CC
	cmp r0, #4
	beq _02042570
	b _020425D8
_020424CC:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	bl IsStorableItem
	cmp r0, #0
	beq _02042560
	ldr r0, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	ldr r2, [r0, #8]
	ldr r0, [r2, r4, lsl #2]
	tst r0, #1
	beq _02042514
	mov r1, #0
	mov r0, #6
	str r1, [r2, r4, lsl #2]
	bl PlaySeVolumeWrapper
	mov r5, #1
	b _020425D8
_02042514:
	bl CountNbOfItemsInStorage
	mov r6, r0
	bl sub_02042B20
	mov r5, r0
	bl sub_0200FD48
	add r1, r6, r5
	cmp r1, r0
	bge _02042550
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	mov r5, #1
	ldr r0, [r0, #8]
	str r5, [r0, r4, lsl #2]
	b _020425D8
_02042550:
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r5, #0
	b _020425D8
_02042560:
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r5, #0
	b _020425D8
_02042570:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _020425CC
	ldr r0, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	mov r5, #1
	ldr r2, [r0, #8]
	ldr r0, [r2, r4, lsl #2]
	tst r0, #1
	mov r0, #6
	beq _020425B8
	mov r1, #0
	str r1, [r2, r4, lsl #2]
	bl PlaySeVolumeWrapper
	b _020425D8
_020425B8:
	bl PlaySeVolumeWrapper
	ldr r0, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #8]
	str r5, [r0, r4, lsl #2]
	b _020425D8
_020425CC:
	mov r0, #2
	bl PlaySeVolumeWrapper
	mov r5, #0
_020425D8:
	bl sub_02042B20
	cmp r0, #0
	beq _020425FC
	ldr r0, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	mov r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202D16C
	b _02042610
_020425FC:
	ldr r0, _02042618 ; =UNK_STORAGE_STRUCT_0XC
	mov r1, #0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202D16C
_02042610:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02042618: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end sub_020423D8

	arm_func_start sub_0204261C
sub_0204261C: ; 0x0204261C
	stmdb sp!, {r3, lr}
	bl sub_02042BE0
	bl sub_02044308
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204261C

	arm_func_start sub_0204262C
sub_0204262C: ; 0x0204262C
	stmdb sp!, {r3, lr}
	bl sub_02042BE0
	bl sub_02044308
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204262C

	arm_func_start sub_0204263C
sub_0204263C: ; 0x0204263C
	ldr r2, _0204265C ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	ldr ip, _02042660 ; =sub_020444B0
	ldr r2, [r2, #0x384]
	mla r1, r0, r1, r2
	ldrsh r0, [r1, #4]
	bx ip
	.align 2, 0
_0204265C: .word BAG_ITEMS_PTR_MIRROR
_02042660: .word sub_020444B0
	arm_func_end sub_0204263C

	arm_func_start FreeUnkStorageStruct0xA0
FreeUnkStorageStruct0xA0: ; 0x02042664
	stmdb sp!, {r3, lr}
	ldr r0, _020426B0 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02044474
	bl sub_020442CC
	bl sub_020445C8
	ldr r0, _020426B0 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl CloseCollectionMenu
	ldr r0, _020426B0 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020426B0 ; =UNK_STORAGE_STRUCT_0XC
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020426B0: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end FreeUnkStorageStruct0xA0

	arm_func_start sub_020426B4
sub_020426B4: ; 0x020426B4
	stmdb sp!, {r3, lr}
	ldr r0, _0204272C ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #4]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _02042708
	ldr r0, _0204272C ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202C75C
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0204272C ; =UNK_STORAGE_STRUCT_0XC
	moveq r0, #2
	strneh r0, [r1]
	movne r0, #3
	ldmia sp!, {r3, pc}
_02042708:
	ldr r0, _0204272C ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl GetWindowIdSelectedMenuItemIdx
	and r1, r0, #0xff
	mov r0, #0x14
	bl Arm9StoreUnkFieldNa0x2029ED8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204272C: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end sub_020426B4

	arm_func_start sub_02042730
sub_02042730: ; 0x02042730
	ldr r0, _02042740 ; =UNK_STORAGE_STRUCT_0XC
	mov r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_02042740: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end sub_02042730

	arm_func_start sub_02042744
sub_02042744: ; 0x02042744
	ldr r0, _02042758 ; =UNK_STORAGE_STRUCT_0XC
	ldr ip, _0204275C ; =sub_0202C620
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bx ip
	.align 2, 0
_02042758: .word UNK_STORAGE_STRUCT_0XC
_0204275C: .word sub_0202C620
	arm_func_end sub_02042744

	arm_func_start sub_02042760
sub_02042760: ; 0x02042760
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x64
	mov r5, r1
	mov r1, #6
	ldr r3, _02042A64 ; =BAG_ITEMS_PTR_MIRROR
	mul r4, r5, r1
	ldr r1, [r3]
	ldr r3, _02042A68 ; =UNK_STORAGE_STRUCT_0XC
	ldr r6, [r1, #0x384]
	ldr r7, [r3, #4]
	ldrh r1, [r6, r4]
	add lr, r6, r4
	mov r4, r2
	strh r1, [sp]
	ldrh ip, [lr, #2]
	mov r6, r0
	add r1, sp, #0
	strh ip, [sp, #2]
	ldrh r2, [lr, #4]
	strh r2, [sp, #4]
	ldr r2, [r7]
	cmp r2, #5
	addls pc, pc, r2, lsl #2
	b _02042A3C
_020427C0: ; jump table
	b _020427D8 ; case 0
	b _020427E4 ; case 1
	b _020427E4 ; case 2
	b _02042808 ; case 3
	b _020428D4 ; case 4
	b _020429E8 ; case 5
_020427D8:
	mov r2, #0
	bl MaybeGetColoredFormattedItemName
	b _02042A3C
_020427E4:
	mov r7, #0
	mov r3, #1
	add r2, sp, #8
	str r7, [sp, #8]
	strb r7, [sp, #0xc]
	strb r3, [sp, #0x10]
	strb r3, [sp]
	bl MaybeGetColoredFormattedItemName
	b _02042A3C
_02042808:
	mov r1, #0
	mov r0, #1
	str r1, [sp, #8]
	strb r1, [sp, #0xc]
	strb r0, [sp, #0x10]
	strb r0, [sp]
	ldr r0, [r3, #8]
	ldr r0, [r0, r5, lsl #2]
	tst r0, #1
	bne _0204284C
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	bl IsStorableItem
	cmp r0, #0
	beq _02042890
_0204284C:
	add r0, sp, #0x14
	add r1, sp, #0
	add r2, sp, #8
	bl MaybeGetColoredFormattedItemName
	ldrb r2, [sp, #1]
	cmp r2, #0
	beq _0204287C
	ldr r1, _02042A6C ; =_0209C9F4
	add r3, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_0204287C:
	ldr r1, _02042A70 ; =_0209C9FC
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_02042890:
	add r0, sp, #0x14
	add r1, sp, #0
	add r2, sp, #8
	bl MaybeGetUncoloredFormattedItemName
	ldrb r2, [sp, #1]
	cmp r2, #0
	beq _020428C0
	ldr r1, _02042A74 ; =_0209CA08
	add r3, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_020428C0:
	ldr r1, _02042A78 ; =_0209CA18
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_020428D4:
	ldrsh r0, [sp, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _020429A4
	mov r7, #3
	mov r3, #0
	mov r2, #0x6a
	mov r1, #1
	add r0, sp, #0
	str r7, [sp, #8]
	strb r3, [sp, #0xc]
	strh r2, [sp, #0xe]
	strb r1, [sp, #0x10]
	strb r7, [sp]
	bl GetActualSellPrice
	mov r7, r0
	bl GetMoneyCarried
	ldr r1, _02042A7C ; =0x0001869F
	add r0, r7, r0
	cmp r0, r1
	add r0, sp, #0x14
	add r1, sp, #0
	add r2, sp, #8
	bgt _0204296C
	bl MaybeGetColoredFormattedItemName
	ldrb r2, [sp, #1]
	cmp r2, #0
	beq _02042958
	ldr r1, _02042A6C ; =_0209C9F4
	add r3, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_02042958:
	ldr r1, _02042A70 ; =_0209C9FC
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_0204296C:
	bl MaybeGetUncoloredFormattedItemName
	ldrb r2, [sp, #1]
	cmp r2, #0
	beq _02042990
	ldr r1, _02042A74 ; =_0209CA08
	add r3, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_02042990:
	ldr r1, _02042A78 ; =_0209CA18
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_020429A4:
	add r0, sp, #0x14
	add r1, sp, #0
	mov r2, #0
	bl MaybeGetUncoloredFormattedItemName
	ldrb r2, [sp, #1]
	cmp r2, #0
	beq _020429D4
	ldr r1, _02042A74 ; =_0209CA08
	add r3, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_020429D4:
	ldr r1, _02042A78 ; =_0209CA18
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
	b _02042A3C
_020429E8:
	ldrsh r0, [sp, #4]
	mov r2, #0
	mov r1, #1
	str r2, [sp, #8]
	strb r2, [sp, #0xc]
	strb r1, [sp, #0x10]
	strb r1, [sp]
	bl IsGummi
	cmp r0, #0
	add r1, sp, #0
	add r2, sp, #8
	beq _02042A24
	mov r0, r6
	bl MaybeGetColoredFormattedItemName
	b _02042A3C
_02042A24:
	add r0, sp, #0x14
	bl MaybeGetUncoloredFormattedItemName
	ldr r1, _02042A80 ; =_0209CA2C
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
_02042A3C:
	ldr r0, _02042A68 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #8]
	ldr r0, [r0, r5, lsl #2]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	str r0, [r4]
	mov r0, r6
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02042A64: .word BAG_ITEMS_PTR_MIRROR
_02042A68: .word UNK_STORAGE_STRUCT_0XC
_02042A6C: .word _0209C9F4
_02042A70: .word _0209C9FC
_02042A74: .word _0209CA08
_02042A78: .word _0209CA18
_02042A7C: .word 0x0001869F
_02042A80: .word _0209CA2C
	arm_func_end sub_02042760

	arm_func_start SprintfStatic__02042A84
SprintfStatic__02042A84: ; 0x02042A84
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02042A84

	arm_func_start sub_02042AAC
sub_02042AAC: ; 0x02042AAC
	stmdb sp!, {r3, lr}
	ldr r0, _02042AD8 ; =UNK_STORAGE_STRUCT_0XC
	ldr r0, [r0, #4]
	cmp r0, #0
	ldrnesb r0, [r0, #4]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsCollectionMenuState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_02042AD8: .word UNK_STORAGE_STRUCT_0XC
	arm_func_end sub_02042AAC

	arm_func_start sub_02042ADC
sub_02042ADC: ; 0x02042ADC
	ldr r0, _02042AF0 ; =UNK_STORAGE_STRUCT_0XC
	ldr ip, _02042AF4 ; =sub_0202D0EC
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bx ip
	.align 2, 0
_02042AF0: .word UNK_STORAGE_STRUCT_0XC
_02042AF4: .word sub_0202D0EC
	arm_func_end sub_02042ADC
