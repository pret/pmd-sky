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
	bl sub_0202F9B8
	ldr r0, _0203CE04 ; =_020AFE70
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl sub_0202F9B8
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
	bl sub_02026268
	mov r0, r8
	bl GetTypeStringId
	mov r3, r0
	mov r0, r6
	mov r1, #0x38
	mov r2, r5
	bl sub_02026268
	cmp r7, #0
	beq _0203D098
	mov r0, r7
	bl GetTypeStringId
	mov r3, r0
	mov r0, r6
	mov r1, #0x68
	mov r2, r5
	bl sub_02026268
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
	ldr r2, _0203D534 ; =_020AFE74
	mov r1, #0x3c0
	str r0, [r2]
	bl MemZero
	ldr r0, _0203D534 ; =_020AFE74
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
	ldr r0, _0203D534 ; =_020AFE74
	str r1, [r7, #0x10]
	ldr r1, [r0]
	str r5, [r1, #8]
	ldr r1, [r0]
	str r4, [r1, #0xe4]
	ldr r0, [r0]
	add r0, r0, #0x8c
	bl InitPreprocessorArgs
	ldr r0, _0203D534 ; =_020AFE74
	mov r2, #0x70000
	ldr r1, [r0]
	str r2, [r1, #0xd8]
	ldr r2, [r0]
	ldrsh r1, [r2, #0x14]
	str r1, [r2, #0x8c]
	ldr r0, [r0]
	add r0, r0, #0x190
	bl InitPortraitParams
	ldr r0, _0203D534 ; =_020AFE74
	ldr r0, [r0]
	ldrsh r1, [r0, #0x14]
	cmp r1, #0
	beq _0203D4F8
	add r0, r0, #0x190
	bl InitPortraitParamsWithMonsterId
_0203D4F8:
	ldr r1, _0203D534 ; =_020AFE74
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
_0203D534: .word _020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
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
	bl sub_0201077C
	cmp r0, #0
	bne _0203D6B4
	mov r0, #0x1e
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _0203D73C
_0203D6B4:
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldrsh r0, [r0, #0x38]
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0203D73C
_0203D718:
	ldr r1, _0203E4B0 ; =_020AFE74
	mov r3, #0
	ldr r2, [r1]
	sub r0, r3, #1
	strh r3, [r2, #0x38]
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	mul r0, r1, r0
	str r0, [r2, #0x1c]
_0203D73C:
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr sb, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl AddMoneyCarried
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203D954:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4D0 ; =0x00003008
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r1, [r1]
	str r0, [r1, #0x18c]
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	add r1, sp, #0x22 + SUB_0203D538_STACK_OFFSET
	ldr r0, [r0]
	ldr r3, _0203E4DC ; =_0209C844
	str r1, [sp]
	ldrsh r1, [r0, #0x38]
	add r0, r0, #0x40
	mov r2, #0
	bl sub_02052E2C
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	add r0, r0, #0x40
	bl sub_02055D4C
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DC68:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r3, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4E4 ; =0x0000100C
	ldr r4, [r3]
	ldr r1, _0203E4E8 ; =0x000002A6
	add r2, r4, #0xb5
	add r2, r2, #0x200
	str r2, [r4, #0xc4]
	ldr r2, [r3]
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r2, #0xa
	ldr r0, [r0]
	ldr r1, [r0, #0x3b8]
	add r0, r0, #0xab
	add r0, r0, #0x100
	add r1, r1, #0x3a
	bl MemcpySimple
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r2, #0xa
	ldr r1, [r0]
	add r0, r1, #0xb5
	add r0, r0, #0x100
	add r1, r1, #0xab
	add r1, r1, #0x100
	bl StrncpySimpleNoPadSafe
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0xa0]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _0203E4B0 ; =_020AFE74
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0xa0]
	bl CloseSimpleMenu
	ldr r0, _0203E4B0 ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1a0]
	bl sub_02046D20
	cmp r4, #0
	beq _0203DE10
	cmp r4, #1
	b _0203DE24
_0203DE10:
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DE24:
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x20
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DE38:
	bl ov11_0230D92C
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x13
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DE50:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DEA0:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =_020AFE74
	moveq r1, #0x16
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DEBC:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _0203EF9C
	bl GetKeyboardStringResult
	ldr r2, _0203E4B0 ; =_020AFE74
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	add r0, r0, #0xab
	add r0, r0, #0x100
	bl MemcpySimple
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r2, #0xa
	ldr r1, [r0]
	add r0, r1, #0xb5
	add r1, r1, #0xab
	add r0, r0, #0x100
	add r1, r1, #0x100
	bl StrncpySimpleNoPadSafe
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DF1C:
	bl sub_02037468
	cmp r0, #0
	beq _0203EF9C
	bl ov11_0230D92C
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x18
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DF40:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =_020AFE74
	moveq r1, #0x19
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DF5C:
	bl ov11_0230D92C
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DF74:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =_020AFE74
	moveq r1, #0x1b
	ldreq r0, [r0]
	streq r1, [r0]
	b _0203EF9C
_0203DF90:
	add r0, r4, #0xb5
	add r0, r0, #0x100
	bl sub_0203909C
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x1c
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203DFB0:
	bl sub_0203931C
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E0BC:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldreq r0, _0203E4B0 ; =_020AFE74
	moveq r1, #0x23
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0203EF9C
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r2, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x24
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E1DC:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	mov r3, #0x3e8
	ldr r2, [r1]
	ldr r0, _0203E4B8 ; =0x0000101C
	str r3, [r2, #0xb0]
	ldr r2, [r1]
	ldr r1, _0203E500 ; =0x00000285
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x27
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E274:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r3, _0203E4B0 ; =_020AFE74
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
	bl sub_0200D670
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x2a
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E440:
	mov r0, #0x2c
	str r0, [r1]
	b _0203EF9C
_0203E44C:
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x33
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E460:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
_0203E4B0: .word _020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #2
	bne _0203E550
	mov r0, #4
	bl sub_02017C50
_0203E550:
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r2, [r0]
	ldr r0, [r2, #0xe4]
	tst r0, #4
	bne _0203E588
	ldr r1, _0203EFA8 ; =0x00000273
	add r2, r2, #0x8c
	mov r0, #0x1c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #1
	moveq r1, #1
	movne r1, #0
	add r0, sp, #0x16 + SUB_0203D538_STACK_OFFSET
	and r1, r1, #0xff
	bl sub_020453F8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x2d
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E658:
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	add r0, r0, #0xde
	bl sub_02045FD0
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r3, #0xa
	ldr r2, [r0]
	mov r1, #0x36
	str r3, [r2, #0x188]
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E688:
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	add r0, r0, #0xde
	bl sub_02045FD0
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #2
	bne _0203E710
	mov r0, #4
	bl sub_02017C50
_0203E710:
	ldr r0, _0203E4B0 ; =_020AFE74
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
	bl sub_0200D670
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r2, _0203E508 ; =_0209C850
	ldr r0, [r0]
	add r1, sp, #0x10 + SUB_0203D538_STACK_OFFSET
	add r0, r0, #0x138
	bl sub_0200D670
	ldr r2, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E7D8:
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #2
	bne _0203E844
	mov r0, #4
	bl sub_02017C50
_0203E844:
	ldr r1, _0203E4B0 ; =_020AFE74
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
	bl sub_0200D670
	ldr r2, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r4, [r2]
	ldr r1, _0203EFB0 ; =0x00000277
	add r3, r4, #0xe8
	str r3, [r4, #0xc4]
	ldr r2, [r2]
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E8D4:
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	add r0, r0, #0xde
	bl sub_02045FD0
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x2e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E934:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x31
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203E9A8:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	mov r1, r4
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldrsh r0, [r0, #0x38]
	bl sub_02010794
	mov r0, #4
	bl RandIntSafe
	add r0, r0, #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020107F4
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	ldr r1, _0203EFC4 ; =0x00000272
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x3e
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EB64:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	bl sub_0203F05C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r2, [r1]
	strb r0, [r2, #0xc]
	ldr r0, [r1]
	ldr r0, [r0, #0x3c]
	bl sub_02050C10
	mov r0, #4
	bl sub_02017C50
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
	ldr r1, _0203EFC8 ; =0x000002A1
	ldr r3, [r2, #0x3c]
	add r2, sp, #0xcc + SUB_0203D538_STACK_OFFSET_2
	str r3, [sp, #0xf0 + SUB_0203D538_STACK_OFFSET_2]
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x41
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EC28:
	bl sub_02046C78
	cmp r0, #0
	beq _0203EF9C
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldrb r0, [r0, #0xc]
	str r0, [sp, #0x94 + SUB_0203D538_STACK_OFFSET_2]
	bl GetRank
	str r0, [sp, #0x98 + SUB_0203D538_STACK_OFFSET_2]
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r1, _0203EFCC ; =0x000002A2
	add r2, sp, #0x7c + SUB_0203D538_STACK_OFFSET_2
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x43
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203ECA8:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =_020AFE74
	movne r1, #0x44
	ldrne r0, [r0]
	strne r1, [r0]
	b _0203EF9C
_0203ECC4:
	add r0, sp, #0x2c + SUB_0203D538_STACK_OFFSET_2
	bl InitPreprocessorArgs
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldreq r0, _0203E4B0 ; =_020AFE74
	moveq r1, #0x46
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0203EF9C
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r1, _0203EFD0 ; =0x000002A3
	add r2, sp, #0x2c + SUB_0203D538_STACK_OFFSET_2
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x45
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203ED34:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldrsh r3, [r4, #0x88]
	ldr r1, [r0]
	mov r2, #0
	str r3, [r1, #0x9c]
	ldr r1, [r0]
	mov r0, #4
	str r2, [r1, #0xb0]
	bl sub_02017C50
	ldr r1, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r2, [r1]
#ifdef JAPAN
	ldr r1, _0203F370 ; =0x00002478
#else
	mov r1, #0x2a4
#endif
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x47
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EDFC:
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x4c
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EE14:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =_020AFE74
	movne r1, #0x48
	ldrne r0, [r0]
	strne r1, [r0]
	b _0203EF9C
_0203EE30:
	add r0, r4, #0x84
	bl AddItemToStorage
	cmp r0, #0
	ldreq r0, _0203E4B0 ; =_020AFE74
	moveq r1, #0x49
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0203EF9C
	bl sub_02046D20
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r0, [r0]
	ldr r0, [r0, #0xe4]
	tst r0, #1
	moveq r1, #1
	movne r1, #0
	add r0, sp, #0xa + SUB_0203D538_STACK_OFFSET
	and r1, r1, #0xff
	bl sub_020453F8
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r1, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
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
	ldr r0, _0203E4B0 ; =_020AFE74
	ldr r2, _0203E508 ; =_0209C850
	ldr r0, [r0]
	add r1, sp, #4
	add r0, r0, #0xe8
	bl sub_0200D670
	ldr r2, _0203E4B0 ; =_020AFE74
	ldr r0, _0203E4B8 ; =0x0000101C
	ldr r4, [r2]
	ldr r1, _0203EFB4 ; =0x00000286
	add r3, r4, #0xe8
	str r3, [r4, #0xc4]
	ldr r2, [r2]
#endif
	add r2, r2, #0x8c
	bl sub_02046BE8
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x4b
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EF64:
	ldr r0, _0203E4B0 ; =_020AFE74
	mov r1, #0x48
	ldr r0, [r0]
	str r1, [r0]
	b _0203EF9C
_0203EF78:
	bl sub_02046C78
	cmp r0, #0
	ldrne r0, _0203E4B0 ; =_020AFE74
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

	arm_func_start sub_0203EFD4
sub_0203EFD4: ; 0x0203EFD4
	stmdb sp!, {r3, lr}
	ldr r0, _0203F008 ; =_020AFE74
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0203F05C
	ldr r0, _0203F008 ; =_020AFE74
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0203F008 ; =_020AFE74
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F008: .word _020AFE74
	arm_func_end sub_0203EFD4

	arm_func_start sub_0203F00C
sub_0203F00C: ; 0x0203F00C
	stmdb sp!, {r3, lr}
	ldr r1, _0203F058 ; =_020AFE74
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #6]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0203F058 ; =_020AFE74
	ldr r2, [r1]
	strb r0, [r2, #6]
	ldr r1, [r1]
	ldrsb r0, [r1, #6]
	add r1, r1, #0x190
	bl ShowPortraitInPortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F058: .word _020AFE74
	arm_func_end sub_0203F00C

	arm_func_start sub_0203F05C
sub_0203F05C: ; 0x0203F05C
	stmdb sp!, {r3, lr}
	ldr r0, _0203F0EC ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	cmp r0, r1
	beq _0203F08C
	bl CloseParentMenu
	ldr r0, _0203F0EC ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_0203F08C:
	ldr r0, _0203F0EC ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	cmp r0, r1
	beq _0203F0B8
	bl CloseDialogueBox
	ldr r0, _0203F0EC ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #5]
_0203F0B8:
	ldr r0, _0203F0EC ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	cmp r0, r1
	beq _0203F0E4
	bl ClosePortraitBox
	ldr r0, _0203F0EC ; =_020AFE74
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
_0203F0E4:
	bl sub_02046D20
	ldmia sp!, {r3, pc}
	.align 2, 0
_0203F0EC: .word _020AFE74
	arm_func_end sub_0203F05C

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
	bl sub_02030940
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

	arm_func_start sub_02042258
sub_02042258: ; 0x02042258
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	mov r0, #0xa0
	mov r1, #8
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r1, _020423B4 ; =_020AFEA8
	str r0, [r1, #4]
	str r6, [r0]
	bl RemoveEmptyItemsInBag
	mov r0, #0x14
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r1, _020423B4 ; =_020AFEA8
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
	ldr r0, _020423B4 ; =_020AFEA8
	str r5, [sp, #8]
	ldr r2, [r0, #4]
	ldr r0, _020423C4 ; =_0209C9E4
	ldr r1, _020423C8 ; =0x00443C33
	ldr r3, _020423CC ; =sub_02042760
	add r2, r2, #8
	bl CreateCollectionMenu
	ldr r2, _020423B4 ; =_020AFEA8
	ldr r1, _020423D0 ; =sub_0204262C
	ldr r3, [r2, #4]
	strb r0, [r3, #4]
	ldr r0, [r2, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202D068
	ldr r0, _020423B4 ; =_020AFEA8
	ldr r1, _020423D4 ; =sub_0204263C
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl SetCollectionMenuVoidFn
	ldr r0, _020423B4 ; =_020AFEA8
	mov r1, #0xd
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl SetCollectionMenuField0x1BC
	ldr r0, _020423B4 ; =_020AFEA8
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
	ldr r0, _020423B4 ; =_020AFEA8
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
	ldr r0, _020423B4 ; =_020AFEA8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020423B4: .word _020AFEA8
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
	arm_func_end sub_02042258

	arm_func_start sub_020423D8
sub_020423D8: ; 0x020423D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _02042618 ; =_020AFEA8
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
	bl sub_02042AF8
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
	ldr r4, _02042618 ; =_020AFEA8
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
	ldr r1, _02042618 ; =_020AFEA8
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
	ldr r0, _02042618 ; =_020AFEA8
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
	ldr r0, _02042618 ; =_020AFEA8
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
	ldr r0, _02042618 ; =_020AFEA8
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
	ldr r0, _02042618 ; =_020AFEA8
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
	ldr r0, _02042618 ; =_020AFEA8
	mov r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202D16C
	b _02042610
_020425FC:
	ldr r0, _02042618 ; =_020AFEA8
	mov r1, #0
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202D16C
_02042610:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02042618: .word _020AFEA8
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

	arm_func_start sub_02042664
sub_02042664: ; 0x02042664
	stmdb sp!, {r3, lr}
	ldr r0, _020426B0 ; =_020AFEA8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02044474
	bl sub_020442CC
	bl sub_020445C8
	ldr r0, _020426B0 ; =_020AFEA8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl CloseCollectionMenu
	ldr r0, _020426B0 ; =_020AFEA8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020426B0 ; =_020AFEA8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020426B0: .word _020AFEA8
	arm_func_end sub_02042664

	arm_func_start sub_020426B4
sub_020426B4: ; 0x020426B4
	stmdb sp!, {r3, lr}
	ldr r0, _0204272C ; =_020AFEA8
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #4]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _02042708
	ldr r0, _0204272C ; =_020AFEA8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202C75C
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0204272C ; =_020AFEA8
	moveq r0, #2
	strneh r0, [r1]
	movne r0, #3
	ldmia sp!, {r3, pc}
_02042708:
	ldr r0, _0204272C ; =_020AFEA8
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bl sub_0202C748
	and r1, r0, #0xff
	mov r0, #0x14
	bl Arm9StoreUnkFieldNa0x2029ED8
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204272C: .word _020AFEA8
	arm_func_end sub_020426B4

	arm_func_start sub_02042730
sub_02042730: ; 0x02042730
	ldr r0, _02042740 ; =_020AFEA8
	mov r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_02042740: .word _020AFEA8
	arm_func_end sub_02042730

	arm_func_start sub_02042744
sub_02042744: ; 0x02042744
	ldr r0, _02042758 ; =_020AFEA8
	ldr ip, _0204275C ; =sub_0202C620
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bx ip
	.align 2, 0
_02042758: .word _020AFEA8
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
	ldr r3, _02042A68 ; =_020AFEA8
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
	bl sub_0200D670
	b _02042A3C
_020427E4:
	mov r7, #0
	mov r3, #1
	add r2, sp, #8
	str r7, [sp, #8]
	strb r7, [sp, #0xc]
	strb r3, [sp, #0x10]
	strb r3, [sp]
	bl sub_0200D670
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
	bl sub_0200D670
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
	bl sub_0200D65C
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
	bl sub_0200D670
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
	bl sub_0200D65C
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
	bl sub_0200D65C
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
	bl sub_0200D670
	b _02042A3C
_02042A24:
	add r0, sp, #0x14
	bl sub_0200D65C
	ldr r1, _02042A80 ; =_0209CA2C
	add r2, sp, #0x14
	mov r0, r6
	bl SprintfStatic__02042A84
_02042A3C:
	ldr r0, _02042A68 ; =_020AFEA8
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
_02042A68: .word _020AFEA8
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
	ldr r0, _02042AD8 ; =_020AFEA8
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
_02042AD8: .word _020AFEA8
	arm_func_end sub_02042AAC

	arm_func_start sub_02042ADC
sub_02042ADC: ; 0x02042ADC
	ldr r0, _02042AF0 ; =_020AFEA8
	ldr ip, _02042AF4 ; =sub_0202D0EC
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #4]
	bx ip
	.align 2, 0
_02042AF0: .word _020AFEA8
_02042AF4: .word sub_0202D0EC
	arm_func_end sub_02042ADC

	arm_func_start sub_02042AF8
sub_02042AF8: ; 0x02042AF8
	mov r3, #0
	ldr r0, _02042B1C ; =_020AFEA8
	mov r2, r3
_02042B04:
	ldr r1, [r0, #8]
	str r2, [r1, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x32
	blt _02042B04
	bx lr
	.align 2, 0
_02042B1C: .word _020AFEA8
	arm_func_end sub_02042AF8

	arm_func_start sub_02042B20
sub_02042B20: ; 0x02042B20
	ldr r1, _02042B4C ; =_020AFEA8
	mov r0, #0
	ldr r3, [r1, #8]
	mov r2, r0
_02042B30:
	ldr r1, [r3, r2, lsl #2]
	add r2, r2, #1
	tst r1, #1
	addne r0, r0, #1
	cmp r2, #0x32
	blt _02042B30
	bx lr
	.align 2, 0
_02042B4C: .word _020AFEA8
	arm_func_end sub_02042B20

	arm_func_start sub_02042B50
sub_02042B50: ; 0x02042B50
	ldr r1, _02042B80 ; =_020AFEA8
	mov r0, #0
	ldr r2, [r1, #8]
	b _02042B70
_02042B60:
	ldr r1, [r2, r0, lsl #2]
	tst r1, #1
	bxne lr
	add r0, r0, #1
_02042B70:
	cmp r0, #0x32
	blt _02042B60
	mvn r0, #0
	bx lr
	.align 2, 0
_02042B80: .word _020AFEA8
	arm_func_end sub_02042B50

	arm_func_start sub_02042B84
sub_02042B84: ; 0x02042B84
	ldr r1, _02042B94 ; =_020AFEA8
	ldr r1, [r1, #8]
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_02042B94: .word _020AFEA8
	arm_func_end sub_02042B84

	arm_func_start sub_02042B98
sub_02042B98: ; 0x02042B98
	stmdb sp!, {r3, lr}
	mov r0, #0xc8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02042BB8 ; =_020AFEA8
	str r0, [r1, #8]
	bl sub_02042AF8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02042BB8: .word _020AFEA8
	arm_func_end sub_02042B98

	arm_func_start sub_02042BBC
sub_02042BBC: ; 0x02042BBC
	stmdb sp!, {r3, lr}
	ldr r0, _02042BDC ; =_020AFEA8
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _02042BDC ; =_020AFEA8
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02042BDC: .word _020AFEA8
	arm_func_end sub_02042BBC

	arm_func_start sub_02042BE0
sub_02042BE0: ; 0x02042BE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	bl GetNbItemsInBag
	mov r1, #6
	mov r4, r0
	mov r0, #0
	ldr ip, _02042CE8 ; =_020AFEA8
	ldr r3, _02042CEC ; =BAG_ITEMS_PTR_MIRROR
	mov r2, r1
	b _02042C44
_02042C04:
	ldr r5, [ip, #8]
	ldr r5, [r5, r0, lsl #2]
	tst r5, #1
	muleq r6, r0, r1
	ldreq r5, [r3]
	ldreq r7, [r5, #0x384]
	ldreqb r5, [r7, r6]
	biceq r5, r5, #0x80
	beq _02042C3C
	mul r6, r0, r2
	ldr r5, [r3]
	ldr r7, [r5, #0x384]
	ldrb r5, [r7, r6]
	orr r5, r5, #0x80
_02042C3C:
	strb r5, [r7, r6]
	add r0, r0, #1
_02042C44:
	cmp r0, r4
	blt _02042C04
	bl SortItemsInBag
	mov r2, #0
	mov r7, r2
	mov r0, #1
	mov r3, #6
	ldr lr, _02042CEC ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _02042CE8 ; =_020AFEA8
	b _02042CA4
_02042C6C:
	mul r1, r2, r3
	ldr r5, [lr]
	ldr r5, [r5, #0x384]
	ldrb r5, [r5, r1]
	tst r5, #0x80
	ldr r5, [ip, #8]
	strne r0, [r5, r2, lsl #2]
	streq r7, [r5, r2, lsl #2]
	ldr r5, [lr]
	add r2, r2, #1
	ldr r6, [r5, #0x384]
	ldrb r5, [r6, r1]
	bic r5, r5, #0x80
	strb r5, [r6, r1]
_02042CA4:
	cmp r2, r4
	blt _02042C6C
	ldr r1, _02042CE8 ; =_020AFEA8
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #4]
	cmp r1, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetNbItemsInBag
	ldr r2, _02042CE8 ; =_020AFEA8
	mov r1, r0
	ldr r0, [r2, #4]
	mov r2, #8
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl sub_0202C654
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02042CE8: .word _020AFEA8
_02042CEC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02042BE0

	arm_func_start sub_02042CF0
sub_02042CF0: ; 0x02042CF0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #0x18c0
	mov r1, #8
	mov r4, r2
	bl MemAlloc
	ldr r2, _02042F88 ; =_020AFEB4
	mvn r3, #1
	str r0, [r2, #4]
	str r5, [r0]
	ldr r0, [r2, #4]
	mov r1, #0
	strb r3, [r0, #0x7d5]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d6]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d7]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d8]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d9]
	ldr r0, [r2, #4]
	str r1, [r0, #0x90c]
	ldr r0, [r2, #4]
	add r0, r0, #0x900
	strh r1, [r0, #0x10]
	ldr r0, [r2, #0x10]
	bl sub_02043BFC
	ldr r2, _02042F88 ; =_020AFEB4
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r0, [r2, #4]
	add r0, r0, #0x900
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	ble _02042DB4
	ldr r0, [r2, #0x10]
	cmp r0, #5
	bne _02042DB4
	ldrsh r0, [r2]
	cmp r0, #0
	beq _02042DB4
	bl sub_020440F8
	ldr r1, _02042F88 ; =_020AFEB4
	ldr r1, [r1, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
_02042DB4:
	ldr r0, _02042F88 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x900
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	bgt _02042DF0
	mov r0, #9
	mov r1, #0
	bl sub_02043BFC
	ldr r2, _02042F88 ; =_020AFEB4
	mov r3, #9
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	str r3, [r2, #0x10]
_02042DF0:
	ldr r1, _02042F88 ; =_020AFEB4
	sub r2, r5, #2
	ldr r0, [r1, #4]
	ldr r5, _02042F8C ; =0x000002F3
	add r0, r0, #0x1000
	str r4, [r0, #0x8bc]
	ldrsh ip, [r1, #2]
	ldr r0, [r1, #4]
	mov r3, #0x10
	str ip, [r0, #0x7dc]
	ldr r0, [r1, #4]
	mov ip, #0xd
	add r0, r0, #0x700
	strh r5, [r0, #0xe4]
	ldr r0, [r1, #4]
	ldr r5, _02042F90 ; =_0204357C
	str r3, [r0, #0x7e8]
	ldr r0, [r1, #4]
	ldr r3, _02042F94 ; =_020441BC
	str ip, [r0, #0x7e0]
	ldr r0, [r1, #4]
	cmp r2, #5
	str r5, [r0, #0x858]
	ldr r0, [r1, #4]
	mov r5, #0
	str r3, [r0, #0x850]
	bhi _02042E6C
	mov r0, #1
	mov r1, r0, lsl r2
	tst r1, #0x2b
	movne r5, r0
_02042E6C:
	ldr r1, _02042F88 ; =_020AFEB4
	cmp r5, #0
	movne r2, #0
	ldr r3, [r1, #4]
	ldreq r2, _02042F98 ; =sub_02042FB8
	ldr r0, _02042F9C ; =_0209CA58
	str r2, [sp]
	add r2, r3, #0x900
	ldrsh r5, [r2, #0x10]
	add r2, r3, #0x3dc
	ldr r1, _02042FA0 ; =0x00447C33
	str r5, [sp, #4]
	ldr r3, _02042FA4 ; =_020432B4
	add r2, r2, #0x400
	str r4, [sp, #8]
	bl CreateCollectionMenu
	ldr r2, _02042F88 ; =_020AFEB4
	ldr r1, _02042FA8 ; =sub_020430F4
	ldr r3, [r2, #4]
	strb r0, [r3, #0x7d4]
	ldr r0, [r2, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D068
	ldr r0, _02042F88 ; =_020AFEB4
	ldr r1, _02042FAC ; =sub_02043148
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl SetCollectionMenuVoidFn
	ldr r0, _02042F88 ; =_020AFEB4
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02042F70
_02042EFC: ; jump table
	b _02042F70 ; case 0
	b _02042F28 ; case 1
	b _02042F28 ; case 2
	b _02042F1C ; case 3
	b _02042F28 ; case 4
	b _02042F60 ; case 5
	b _02042F3C ; case 6
	b _02042F60 ; case 7
_02042F1C:
	mov r0, #0
	bl sub_0204440C
	b _02042F70
_02042F28:
	mov r0, #0
	bl sub_0204440C
	mov r0, #2
	bl sub_0204426C
	b _02042F70
_02042F3C:
	ldr r0, _02042FB0 ; =_0209CA48
	ldr r1, _02042FB4 ; =sub_02044210
	bl CreateTextBox
	ldr r1, _02042F88 ; =_020AFEB4
	ldr r1, [r1, #4]
	strb r0, [r1, #0x7d5]
	mov r0, #1
	bl sub_0204426C
	b _02042F70
_02042F60:
	mov r0, #0
	bl sub_0204440C
	mov r0, #1
	bl sub_0204426C
_02042F70:
	ldr r0, _02042F88 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02042F88: .word _020AFEB4
#ifdef JAPAN
_02042F8C: .word 0x0000239B
#else
_02042F8C: .word 0x000002F3
#endif
_02042F90: .word sub_0204357C
_02042F94: .word sub_020441BC
_02042F98: .word sub_02042FB8
_02042F9C: .word _0209CA58
_02042FA0: .word 0x00447C33
_02042FA4: .word sub_020432B4
_02042FA8: .word sub_020430F4
_02042FAC: .word sub_02043148
_02042FB0: .word _0209CA48
_02042FB4: .word sub_02044210
	arm_func_end sub_02042CF0

	arm_func_start sub_02042FB8
sub_02042FB8: ; 0x02042FB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	tst r0, #0x400
	mov r4, #0
	beq _020430A8
	ldr r0, _020430F0 ; =_020AFEB4
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #1
	cmpne r0, #4
	cmpne r0, #6
	bne _020430A8
	bl sub_02043468
	ldr r1, _020430F0 ; =_020AFEB4
	mov r5, r0
	ldr r0, [r1, #8]
	ldrb r0, [r0, r5]
	tst r0, #1
	movne r4, #1
	bne _0204303C
	ldr r0, [r1, #4]
	ldr r0, [r0]
	cmp r0, #1
	bne _02043038
	bl GetNbItemsInBag
	mov r7, r0
	bl sub_020434FC
	mov r6, r0
	bl GetCurrentBagCapacity
	add r1, r7, r6
	cmp r1, r0
	movlt r4, #1
	b _0204303C
_02043038:
	mov r4, #1
_0204303C:
	cmp r4, #0
	beq _020430A0
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, _020430F0 ; =_020AFEB4
	mvn r1, #1
	ldr r3, [r0, #8]
	ldrb r2, [r3, r5]
	eor r2, r2, #1
	strb r2, [r3, r5]
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _0204307C
	bl sub_0202F9B8
_0204307C:
	ldr r0, _020430F0 ; =_020AFEB4
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #6
	bne _020430A8
	add r0, r1, #0x700
	ldrsb r0, [r0, #0xd5]
	bl sub_0202F9B8
	b _020430A8
_020430A0:
	mov r0, #2
	bl PlaySeVolumeWrapper
_020430A8:
	bl sub_020434FC
	cmp r0, #0
	ble _020430D0
	ldr r0, _020430F0 ; =_020AFEB4
	mov r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D16C
	b _020430E8
_020430D0:
	ldr r0, _020430F0 ; =_020AFEB4
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D16C
_020430E8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020430F0: .word _020AFEB4
	arm_func_end sub_02042FB8

	arm_func_start sub_020430F4
sub_020430F4: ; 0x020430F4
	stmdb sp!, {r3, lr}
	ldr r0, _02043144 ; =_020AFEB4
	mov r1, #1
	ldr r0, [r0, #0x10]
	bl sub_02043BFC
	ldr r2, _02043144 ; =_020AFEB4
	mov r3, #0
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r2, [r2, #4]
	add r0, r2, #0x700
	add r1, r2, #0x900
	add r2, r2, #0x1000
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	ldr r2, [r2, #0x8bc]
	bl sub_0202C654
	bl sub_02044308
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043144: .word _020AFEB4
	arm_func_end sub_020430F4

	arm_func_start sub_02043148
sub_02043148: ; 0x02043148
	stmdb sp!, {r3, lr}
	ldr r1, _02043168 ; =_020AFEB4
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #4]
	bl sub_02010044
	bl sub_020444B0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043168: .word _020AFEB4
	arm_func_end sub_02043148

	arm_func_start sub_0204316C
sub_0204316C: ; 0x0204316C
	cmp r0, #0
	movne r0, #5
	moveq r0, #7
	bx lr
	arm_func_end sub_0204316C

	arm_func_start sub_0204317C
sub_0204317C: ; 0x0204317C
	stmdb sp!, {r3, lr}
	ldr r0, _02043214 ; =_020AFEB4
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02044474
	bl sub_020442CC
	bl sub_020445C8
	ldr r0, _02043214 ; =_020AFEB4
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #6
	bne _020431BC
	add r0, r1, #0x700
	ldrsb r0, [r0, #0xd5]
	bl CloseTextBox
_020431BC:
	ldr r0, _02043214 ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _020431DC
	bl CloseTextBox
_020431DC:
	ldr r1, _02043214 ; =_020AFEB4
	ldr r0, [r1, #4]
	ldr r2, [r0]
	add r0, r0, #0x700
	str r2, [r1, #0xc]
	ldrsb r0, [r0, #0xd4]
	bl CloseCollectionMenu
	ldr r0, _02043214 ; =_020AFEB4
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02043214 ; =_020AFEB4
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043214: .word _020AFEB4
	arm_func_end sub_0204317C

	arm_func_start sub_02043218
sub_02043218: ; 0x02043218
	ldr r0, _02043228 ; =_020AFEB4
	mov r1, #0
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_02043228: .word _020AFEB4
	arm_func_end sub_02043218

	arm_func_start sub_0204322C
sub_0204322C: ; 0x0204322C
	ldr r1, _02043238 ; =_020AFEB4
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_02043238: .word _020AFEB4
	arm_func_end sub_0204322C

	arm_func_start sub_0204323C
sub_0204323C: ; 0x0204323C
	stmdb sp!, {r3, lr}
	bl sub_02043254
	ldr r1, _02043250 ; =_020AFEB4
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043250: .word _020AFEB4
	arm_func_end sub_0204323C

	arm_func_start sub_02043254
sub_02043254: ; 0x02043254
	ldr r1, _02043298 ; =_020AFEB4
	mov r3, #0
	ldr ip, [r1, #4]
	mvn r1, #0
	b _02043278
_02043268:
	cmp r0, r2
	moveq r0, r3
	bxeq lr
	add r3, r3, #1
_02043278:
	cmp r3, #0x3e8
	bge _02043290
	add r2, ip, r3, lsl #1
	ldrsh r2, [r2, #4]
	cmp r2, r1
	bne _02043268
_02043290:
	mov r0, #0
	bx lr
	.align 2, 0
_02043298: .word _020AFEB4
	arm_func_end sub_02043254

	arm_func_start sub_0204329C
sub_0204329C: ; 0x0204329C
	ldr r1, _020432B0 ; =_020AFEB4
	ldr r1, [r1, #4]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #4]
	bx lr
	.align 2, 0
_020432B0: .word _020AFEB4
	arm_func_end sub_0204329C

	arm_func_start sub_020432B4
sub_020432B4: ; 0x020432B4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _02043318 ; =_020AFEB4
	mov r5, r0
	ldr r0, [r3, #4]
	mov r4, r2
	add r0, r0, r1, lsl #1
	ldrsh r6, [r0, #4]
	add r1, sp, #0
	mov r0, r6
	bl ConvertStorageItemAtIdxToItem
	ldr r2, _0204331C ; =_0209CA3C
	add r1, sp, #0
	mov r0, r5
	bl sub_0200D670
	ldr r0, _02043318 ; =_020AFEB4
	ldr r0, [r0, #8]
	ldrb r0, [r0, r6]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	str r0, [r4]
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02043318: .word _020AFEB4
_0204331C: .word _0209CA3C
	arm_func_end sub_020432B4

	arm_func_start sub_02043320
sub_02043320: ; 0x02043320
	stmdb sp!, {r3, lr}
	cmp r0, #7
	bne _02043344
	bl CountNbOfValidItemsInTimeDarknessInStorage
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_02043344:
	sub r0, r0, #5
	cmp r0, #1
	bhi _02043368
	bl CountNbOfValidItemsInStorage
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_02043368:
	bl CountNbOfItemsInStorage
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02043320

	arm_func_start sub_02043380
sub_02043380: ; 0x02043380
	stmdb sp!, {r3, lr}
	cmp r0, #8
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsStorageFull
	ldmia sp!, {r3, pc}
	arm_func_end sub_02043380

	arm_func_start sub_02043398
sub_02043398: ; 0x02043398
	stmdb sp!, {r3, lr}
	ldr r0, _020433BC ; =_020AFEB4
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D134
	ldmia sp!, {r3, pc}
	.align 2, 0
_020433BC: .word _020AFEB4
	arm_func_end sub_02043398

	arm_func_start sub_020433C0
sub_020433C0: ; 0x020433C0
	ldr r0, _020433D8 ; =_020AFEB4
	ldr ip, _020433DC ; =sub_0202C620
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bx ip
	.align 2, 0
_020433D8: .word _020AFEB4
_020433DC: .word sub_0202C620
	arm_func_end sub_020433C0

	arm_func_start sub_020433E0
sub_020433E0: ; 0x020433E0
	ldr r0, _020433FC ; =_020AFEB4
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020433FC: .word _020AFEB4
	arm_func_end sub_020433E0

	arm_func_start sub_02043400
sub_02043400: ; 0x02043400
	stmdb sp!, {r3, lr}
	ldr r0, _02043430 ; =_020AFEB4
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x700
	ldrnesb r0, [r0, #0xd4]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsCollectionMenuActive
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043430: .word _020AFEB4
	arm_func_end sub_02043400

	arm_func_start sub_02043434
sub_02043434: ; 0x02043434
	stmdb sp!, {r3, lr}
	ldr r0, _02043464 ; =_020AFEB4
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x700
	ldrnesb r0, [r0, #0xd4]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsCollectionMenuState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043464: .word _020AFEB4
	arm_func_end sub_02043434

	arm_func_start sub_02043468
sub_02043468: ; 0x02043468
	stmdb sp!, {r3, lr}
	ldr r0, _020434D0 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl IsCollectionMenuActive
	cmp r0, #0
	beq _020434A0
	ldr r0, _020434D0 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C748
	b _020434B4
_020434A0:
	ldr r0, _020434D0 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C75C
_020434B4:
	cmp r0, #0
	ldrge r1, _020434D0 ; =_020AFEB4
	mvnlt r0, #0
	ldrge r1, [r1, #4]
	addge r0, r1, r0, lsl #1
	ldrgesh r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020434D0: .word _020AFEB4
	arm_func_end sub_02043468

	arm_func_start sub_020434D4
sub_020434D4: ; 0x020434D4
	mov r3, #0
	ldr r0, _020434F8 ; =_020AFEB4
	mov r2, r3
_020434E0:
	ldr r1, [r0, #8]
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, #0x3e8
	blt _020434E0
	bx lr
	.align 2, 0
_020434F8: .word _020AFEB4
	arm_func_end sub_020434D4

	arm_func_start sub_020434FC
sub_020434FC: ; 0x020434FC
	ldr r1, _02043528 ; =_020AFEB4
	mov r0, #0
	ldr r3, [r1, #8]
	mov r2, r0
_0204350C:
	ldrb r1, [r3, r2]
	add r2, r2, #1
	tst r1, #1
	addne r0, r0, #1
	cmp r2, #0x3e8
	blt _0204350C
	bx lr
	.align 2, 0
_02043528: .word _020AFEB4
	arm_func_end sub_020434FC

	arm_func_start sub_0204352C
sub_0204352C: ; 0x0204352C
	ldr r0, _02043564 ; =_020AFEB4
	mov r1, #0
	ldr r2, [r0, #8]
	b _02043554
_0204353C:
	ldrb r0, [r2, r1]
	tst r0, #1
	movne r0, r1, lsl #0x10
	movne r0, r0, asr #0x10
	bxne lr
	add r1, r1, #1
_02043554:
	cmp r1, #0x3e8
	blt _0204353C
	mvn r0, #0
	bx lr
	.align 2, 0
_02043564: .word _020AFEB4
	arm_func_end sub_0204352C

	arm_func_start sub_02043568
sub_02043568: ; 0x02043568
	ldr r1, _02043578 ; =_020AFEB4
	ldr r1, [r1, #8]
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02043578: .word _020AFEB4
	arm_func_end sub_02043568

	arm_func_start sub_0204357C
sub_0204357C: ; 0x0204357C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	ldr r4, _020435C4 ; =_0209CA98
	add lr, sp, #0
	ldmia r4!, {r0, r1, r2, r3}
	mov ip, lr
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1, r2}
	ldr r3, _020435C8 ; =_020AFEB4
	stmia lr, {r0, r1, r2}
	ldr r0, [r3, #4]
	ldr r0, [r0, #0x90c]
	cmp r0, #7
	bge _020435BC
	ldr r0, [ip, r0, lsl #2]
	blx r0
_020435BC:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020435C4: .word _0209CA98
_020435C8: .word _020AFEB4
	arm_func_end sub_0204357C

	arm_func_start sub_020435CC
sub_020435CC: ; 0x020435CC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _02043760 ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd8]
	cmp r0, r1
	bne _0204361C
	ldr r0, _02043764 ; =_0209CA68
	mov r4, #0xa
	ldr r3, _02043768 ; =_0209CAB4
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02043760 ; =_020AFEB4
	ldr r1, [r1, #4]
	strb r0, [r1, #0x7d8]
	b _02043758
_0204361C:
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02043758
	ldr r0, _02043760 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd8]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _02043760 ; =_020AFEB4
	mov r4, r0
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd8]
	bl CloseSimpleMenu
	ldr r0, _02043760 ; =_020AFEB4
	mvn r2, #1
	ldr r1, [r0, #4]
	cmp r4, #8
	strb r2, [r1, #0x7d8]
	ldreq r0, [r0, #4]
	mov r1, #0
	streq r1, [r0, #0x90c]
	beq _02043744
	mov r0, r4
	bl sub_02043BFC
	mvn r1, #0
	cmp r0, r1
	bne _020436F4
	ldr r0, _02043760 ; =_020AFEB4
	sub r1, r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r1
	beq _020436AC
	bl sub_0202812C
_020436AC:
	ldr r0, _02043760 ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _020436CC
	bl sub_0202812C
_020436CC:
	ldr r0, _02043760 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202812C
	ldr r0, _02043760 ; =_020AFEB4
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	b _02043758
_020436F4:
	ldr r2, _02043760 ; =_020AFEB4
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #0x700
	add r1, r1, #0x900
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	bl sub_0202C6D4
	cmp r4, #5
	ldreq r0, _02043760 ; =_020AFEB4
	moveq r1, #4
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x90c]
	beq _02043758
	ldr r0, _02043760 ; =_020AFEB4
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
_02043744:
	ldr r0, _02043760 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C620
_02043758:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02043760: .word _020AFEB4
_02043764: .word _0209CA68
_02043768: .word _0209CAB4
	arm_func_end sub_020435CC

	arm_func_start sub_0204376C
sub_0204376C: ; 0x0204376C
	stmdb sp!, {r3, lr}
	ldr r0, _020437B4 ; =_0209CA88
	bl CreateDialogueBox
	ldr r3, _020437B8 ; =_020AFEB4
	ldr r1, _020437BC ; =0x00000418
	ldr ip, [r3, #4]
	ldr r2, _020437C0 ; =0x000002FF
	strb r0, [ip, #0x7d7]
	ldr r0, [r3, #4]
	mov r3, #0
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	bl ShowStringIdInDialogueBox
	ldr r0, _020437B8 ; =_020AFEB4
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020437B4: .word _0209CA88
_020437B8: .word _020AFEB4
_020437BC: .word 0x00000418
#ifdef JAPAN
_020437C0: .word 0x000023A7
#else
_020437C0: .word 0x000002FF
#endif
	arm_func_end sub_0204376C

	arm_func_start sub_020437C4
sub_020437C4: ; 0x020437C4
	stmdb sp!, {r3, lr}
	ldr r0, _02043840 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	mov r1, #0
	bl sub_02043BFC
	ldr r2, _02043840 ; =_020AFEB4
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #0x700
	add r1, r1, #0x900
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	bl sub_0202C6D4
	ldr r0, _02043840 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	bl sub_0202F2C4
	ldr r0, _02043840 ; =_020AFEB4
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043840: .word _020AFEB4
	arm_func_end sub_020437C4

	arm_func_start sub_02043844
sub_02043844: ; 0x02043844
	stmdb sp!, {r3, lr}
	ldr r0, _02043940 ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseDialogueBox
	ldr r0, _02043940 ; =_020AFEB4
	mvn r2, #1
	ldr r1, [r0, #4]
	strb r2, [r1, #0x7d7]
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r2
	beq _020438AC
	bl sub_02028354
	cmp r0, #3
	bne _020438AC
	ldr r0, _02043940 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	bl sub_0202810C
_020438AC:
	ldr r0, _02043940 ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _020438E8
	bl sub_02028354
	cmp r0, #3
	bne _020438E8
	ldr r0, _02043940 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	bl sub_0202810C
_020438E8:
	ldr r0, _02043940 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_02028354
	cmp r0, #3
	bne _02043918
	ldr r0, _02043940 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202810C
_02043918:
	ldr r0, _02043940 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C620
	ldr r0, _02043940 ; =_020AFEB4
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043940: .word _020AFEB4
	arm_func_end sub_02043844

	arm_func_start sub_02043944
sub_02043944: ; 0x02043944
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020439E8 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0xb4
	add r0, r0, #0x1800
	bl sub_020547C8
	ldr r0, _020439E8 ; =_020AFEB4
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb4
	add r0, r0, #0x1800
	bl sub_02054804
	ldr r1, _020439E8 ; =_020AFEB4
	ldr r2, _020439EC ; =0x000002FE
	ldr r0, [r1, #4]
	mov r3, #0x10
	add r0, r0, #0x800
	strh r2, [r0, #0x7c]
	ldr r2, [r1, #4]
	ldr r0, _020439F0 ; =_0209CA78
	str r3, [r2, #0x880]
	ldr r3, [r1, #4]
	ldr r1, _020439F4 ; =0x00481813
	add r2, r3, #0x1800
	ldrsh ip, [r2, #0xb4]
	add r2, r3, #0x74
	ldr r3, _020439F8 ; =sub_02043BAC
	str ip, [sp]
	mov ip, #9
	add r2, r2, #0x800
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _020439E8 ; =_020AFEB4
	mov r2, #5
	ldr r3, [r1, #4]
	strb r0, [r3, #0x7d9]
	ldr r0, [r1, #4]
	str r2, [r0, #0x90c]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020439E8: .word _020AFEB4
#ifdef JAPAN
_020439EC: .word 0x000023A6
#else
_020439EC: .word 0x000002FE
#endif
_020439F0: .word _0209CA78
_020439F4: .word 0x00481813
_020439F8: .word sub_02043BAC
	arm_func_end sub_02043944

	arm_func_start sub_020439FC
sub_020439FC: ; 0x020439FC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02043B78 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02043B78 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _02043B78 ; =_020AFEB4
	mov r4, r0, lsl #0x10
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl GetAdvancedMenuResult
	ldr r1, _02043B78 ; =_020AFEB4
	mov r5, r0, lsl #0x10
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl CloseAdvancedMenu
	ldr r0, _02043B78 ; =_020AFEB4
	mvn r3, #1
	ldr r1, [r0, #4]
	mov r2, r4, asr #0xf
	strb r3, [r1, #0x7d9]
	ldr r1, [r0, #4]
	add r0, r1, #0x1000
	add r1, r1, #0xb4
	ldr r3, [r0, #0x8b8]
	add r0, r1, #0x1800
	ldrsh r4, [r3, r2]
	bl sub_020547D8
	mvn r0, #0
	cmp r0, r5, asr #16
	bne _02043AB8
	ldr r0, _02043B78 ; =_020AFEB4
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r0, #4]
	mov r1, #6
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, r4, r5, pc}
_02043AB8:
	mov r0, r4
	bl sub_020440F8
	cmp r0, #0
	bgt _02043B38
	ldr r0, _02043B78 ; =_020AFEB4
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r0, #4]
	sub r1, r1, #2
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r1
	beq _02043AF0
	bl sub_0202812C
_02043AF0:
	ldr r0, _02043B78 ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _02043B10
	bl sub_0202812C
_02043B10:
	ldr r0, _02043B78 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202812C
	ldr r0, _02043B78 ; =_020AFEB4
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, r4, r5, pc}
_02043B38:
	ldr r2, _02043B78 ; =_020AFEB4
	strh r4, [r2]
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #0x700
	add r1, r1, #0x900
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	bl sub_0202C6D4
	ldr r0, _02043B78 ; =_020AFEB4
	mov r1, #6
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02043B78: .word _020AFEB4
	arm_func_end sub_020439FC

	arm_func_start sub_02043B7C
sub_02043B7C: ; 0x02043B7C
	stmdb sp!, {r3, lr}
	ldr r0, _02043BA8 ; =_020AFEB4
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C620
	ldr r0, _02043BA8 ; =_020AFEB4
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043BA8: .word _020AFEB4
	arm_func_end sub_02043B7C

	arm_func_start sub_02043BAC
sub_02043BAC: ; 0x02043BAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	blt _02043BD4
	ldr r2, _02043BF8 ; =_020AFEB4
	ldr r3, [r2, #4]
	add r2, r3, #0x1800
	ldrsh r2, [r2, #0xb4]
	cmp r1, r2
	blt _02043BDC
_02043BD4:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02043BDC:
	add r2, r3, #0x1000
	ldr r2, [r2, #0x8b8]
	mov r1, r1, lsl #1
	ldrsh r1, [r2, r1]
	bl GetNameRaw
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02043BF8: .word _020AFEB4
	arm_func_end sub_02043BAC

	arm_func_start sub_02043BFC
sub_02043BFC: ; 0x02043BFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _0204408C ; =_020AFEB4
	mov sb, r0
	ldr r0, [r2, #4]
	mov r4, r1
	ldr r6, [r0]
	bl sub_0200FD48
	sub r1, r6, #5
	mov r5, r0
	cmp r1, #2
	mov r7, #0
	movls r0, #1
	movhi r0, r7
	cmp r4, #0
	and r4, r0, #0xff
	beq _02043D0C
	mov r0, #0x3e8
	mov r1, #8
	bl MemAlloc
	mov r8, r0
	mov sl, #0
	ldr r0, _0204408C ; =_020AFEB4
	mov r1, sl
	mov r2, #1
_02043C5C:
	ldr r3, [r0, #8]
	ldrb r3, [r3, sl]
	cmp r3, #1
	moveq r3, r2
	movne r3, r1
	strb r3, [r8, sl]
	add sl, sl, #1
	cmp sl, #0x3e8
	blt _02043C5C
	bl sub_0200FD48
	mov r1, r0
	mov r0, r8
	bl SortItemsInStorage
	mov sl, #0
	ldr r0, _0204408C ; =_020AFEB4
	mov r2, sl
	mov r3, #1
_02043CA0:
	ldrb r1, [r8, sl]
	cmp r1, #0
	movne fp, r3
	ldr r1, [r0, #8]
	moveq fp, r2
	strb fp, [r1, sl]
	add sl, sl, #1
	cmp sl, #0x3e8
	blt _02043CA0
	mov r0, r8
	bl MemFree
	ldr r0, _0204408C ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r1
	beq _02043CEC
	bl sub_0202F9B8
_02043CEC:
	ldr r0, _0204408C ; =_020AFEB4
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _02043D0C
	bl sub_0202F9B8
_02043D0C:
	mov r8, #0
	b _02043DE4
_02043D14:
	ldr r0, _02044090 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x8a]
	cmp r1, #0
	beq _02043DEC
	cmp r4, #0
	beq _02043D48
	ldrsh r0, [r0, #0x8a]
	bl IsItemValidVeneer
	cmp r0, #0
	beq _02043DD8
_02043D48:
	cmp r6, #7
	bne _02043DBC
	ldr r0, _02044090 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r1, r0, r8, lsl #1
	add r0, r1, #0x300
	ldrsh sl, [r0, #0x8a]
	add r0, r1, #0xb00
	ldrh fp, [r0, #0x5a]
	mov r0, sl
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _02043DB0
	mov r0, sl
	bl IsTreasureBox
	cmp r0, #0
	beq _02043DA8
	mov r0, fp, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _02043DB0
	mov r0, #1
	b _02043DB4
_02043DA8:
	mov r0, #1
	b _02043DB4
_02043DB0:
	mov r0, #0
_02043DB4:
	cmp r0, #0
	beq _02043DD8
_02043DBC:
	ldr r0, _0204408C ; =_020AFEB4
	add r2, r7, #1
	ldr r0, [r0, #4]
	add r1, r0, r7, lsl #1
	mov r0, r2, lsl #0x10
	strh r8, [r1, #4]
	mov r7, r0, asr #0x10
_02043DD8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02043DE4:
	cmp r8, r5
	blt _02043D14
_02043DEC:
	mov r4, r7
	mvn r3, #0
	ldr r1, _0204408C ; =_020AFEB4
	b _02043E14
_02043DFC:
	ldr r2, [r1, #4]
	add r0, r4, #1
	add r2, r2, r4, lsl #1
	mov r0, r0, lsl #0x10
	strh r3, [r2, #4]
	mov r4, r0, asr #0x10
_02043E14:
	cmp r4, r5
	blt _02043DFC
	mov r0, r7, lsl #0x10
	ldr r4, _0204408C ; =_020AFEB4
	mov r5, r0, asr #0x10
	cmp r5, #0
	str sb, [r4, #0x10]
	movle r0, #9
	strle r0, [r4, #0x10]
	suble r0, r0, #0xa
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #9
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r7, r8
	mov fp, #1
	ldr sl, _02044090 ; =BAG_ITEMS_PTR_MIRROR
	b _02044070
_02043E60:
	ldr r1, [r4, #4]
	ldr r0, [sl]
	add r1, r1, r7, lsl #1
	ldrsh r6, [r1, #4]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	bl GetItemCategoryVeneer
	ldr r1, [sl]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r1, #0x5c
	bgt _02043EA0
	beq _02043F20
	b _02043F24
_02043EA0:
	sub r1, r1, #0x190
	cmp r1, #0x1b
	addls pc, pc, r1, lsl #2
	b _02043F24
_02043EB0: ; jump table
	b _02043F20 ; case 0
	b _02043F20 ; case 1
	b _02043F20 ; case 2
	b _02043F20 ; case 3
	b _02043F20 ; case 4
	b _02043F20 ; case 5
	b _02043F20 ; case 6
	b _02043F20 ; case 7
	b _02043F20 ; case 8
	b _02043F20 ; case 9
	b _02043F20 ; case 10
	b _02043F20 ; case 11
	b _02043F20 ; case 12
	b _02043F20 ; case 13
	b _02043F20 ; case 14
	b _02043F20 ; case 15
	b _02043F20 ; case 16
	b _02043F20 ; case 17
	b _02043F20 ; case 18
	b _02043F20 ; case 19
	b _02043F20 ; case 20
	b _02043F20 ; case 21
	b _02043F20 ; case 22
	b _02043F20 ; case 23
	b _02043F20 ; case 24
	b _02043F20 ; case 25
	b _02043F20 ; case 26
	b _02043F20 ; case 27
_02043F20:
	mov r0, #7
_02043F24:
	cmp sb, #9
	addls pc, pc, sb, lsl #2
	b _0204402C
_02043F30: ; jump table
	b _02043F58 ; case 0
	b _02043F70 ; case 1
	b _02043F88 ; case 2
	b _02043F9C ; case 3
	b _02043FB4 ; case 4
	b _02043FC8 ; case 5
	b _02043FDC ; case 6
	b _02043FF8 ; case 7
	b _0204402C ; case 8
	b _0204402C ; case 9
_02043F58:
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043F70:
	cmp r0, #2
	cmpne r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043F88:
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043F9C:
	cmp r0, #5
	cmpne r0, #0xb
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FB4:
	cmp r0, #9
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FC8:
	cmp r0, #0xf
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FDC:
	add r0, r0, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FF8:
	add r0, r0, #0xfa
	and r0, r0, #0xff
	cmp r0, #4
	mov r1, #0
	bhi _02044018
	mov r0, fp, lsl r0
	tst r0, #0x17
	movne r1, fp
_02044018:
	cmp r1, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _02044030
_0204402C:
	mov r0, #1
_02044030:
	cmp r0, #0
	beq _02044064
	ldr r0, [r4, #4]
	add r1, r8, #1
	mov r1, r1, lsl #0x10
	add r2, r0, r8, lsl #1
	ldrsh r2, [r2, #4]
	add r0, r0, r7, lsl #1
	strh r2, [r0, #4]
	ldr r0, [r4, #4]
	add r0, r0, r8, lsl #1
	strh r6, [r0, #4]
	mov r8, r1, asr #0x10
_02044064:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02044070:
	cmp r7, r5
	blt _02043E60
	cmp r8, #0
	mvnle r8, #0
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204408C: .word _020AFEB4
_02044090: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02043BFC

	arm_func_start sub_02044094
sub_02044094: ; 0x02044094
	stmdb sp!, {r3, lr}
	mov r0, #0x3e8
	mov r1, #8
	bl MemAlloc
	ldr r1, _020440B4 ; =_020AFEB4
	str r0, [r1, #8]
	bl sub_020434D4
	ldmia sp!, {r3, pc}
	.align 2, 0
_020440B4: .word _020AFEB4
	arm_func_end sub_02044094

	arm_func_start sub_020440B8
sub_020440B8: ; 0x020440B8
	stmdb sp!, {r3, lr}
	ldr r0, _020440D8 ; =_020AFEB4
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _020440D8 ; =_020AFEB4
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020440D8: .word _020AFEB4
	arm_func_end sub_020440B8

	arm_func_start sub_020440DC
sub_020440DC: ; 0x020440DC
	ldr r0, _020440F4 ; =_020AFEB4
	mov r1, #9
	str r1, [r0, #0x10]
	mov r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_020440F4: .word _020AFEB4
	arm_func_end sub_020440DC

	arm_func_start sub_020440F8
sub_020440F8: ; 0x020440F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov sl, r0
	mov r1, sb
	bl GetType
	mov r6, r0
	mov r0, sl
	mov r1, #1
	bl GetType
	mov r7, r0
	mov r8, sb
	ldr r4, _020441B4 ; =_020AFEB4
	ldr fp, _020441B8 ; =BAG_ITEMS_PTR_MIRROR
	b _02044198
_02044130:
	add r0, r1, r8, lsl #1
	ldrsh r5, [r0, #4]
	ldr r0, [fp]
	mov r1, sl
	add r0, r0, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	mov r2, r6
	mov r3, r7
	bl IsExclusiveItemIdForMonster
	cmp r0, #0
	beq _0204418C
	ldr r3, [r4, #4]
	add r0, sb, #1
	add r1, r3, sb, lsl #1
	ldrsh r2, [r1, #4]
	add r1, r3, r8, lsl #1
	mov r0, r0, lsl #0x10
	strh r2, [r1, #4]
	ldr r1, [r4, #4]
	add r1, r1, sb, lsl #1
	strh r5, [r1, #4]
	mov sb, r0, asr #0x10
_0204418C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02044198:
	ldr r1, [r4, #4]
	add r0, r1, #0x900
	ldrsh r0, [r0, #0x10]
	cmp r8, r0
	blt _02044130
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020441B4: .word _020AFEB4
_020441B8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020440F8

	arm_func_start sub_020441BC
sub_020441BC: ; 0x020441BC
	stmdb sp!, {r3, lr}
	ldr r0, _0204420C ; =_020AFEB4
	mov r1, #1
	ldr r0, [r0, #0x10]
	bl sub_02043BFC
	ldr r2, _0204420C ; =_020AFEB4
	mov r3, #0
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r2, [r2, #4]
	add r0, r2, #0x700
	add r1, r2, #0x900
	add r2, r2, #0x1000
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	ldr r2, [r2, #0x8bc]
	bl sub_0202C654
	bl sub_02044308
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204420C: .word _020AFEB4
	arm_func_end sub_020441BC

	arm_func_start sub_02044210
sub_02044210: ; 0x02044210
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	bl sub_02027B1C
#ifdef JAPAN
	ldr r3, _020445D8 ; =0x000023A8
#endif
	mov r0, r4
	mov r1, #0xa
	mov r2, #2
#ifndef JAPAN
	mov r3, #0x300
#endif
	bl sub_02026268
	bl sub_020434FC
	str r0, [sp, #0x28]
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _02044268 ; =0x00000301
	mov r0, r4
	mov r1, #0x66
	mov r2, #2
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_020445D8: .word 0x000023A8
_02044268: .word 0x000023A9
#else
_02044268: .word 0x00000301
#endif
	arm_func_end sub_02044210

	arm_func_start sub_0204426C
sub_0204426C: ; 0x0204426C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _020442C0 ; =_020AFEC8
	mov r3, #1
	str r0, [r1]
	str r4, [r0]
	ldr r0, [r1]
	ldr r2, _020442C4 ; =_0209CB0C
	strb r3, [r0, #4]
	ldr r0, [r1]
	ldr r1, _020442C8 ; =sub_02044338
	ldr r0, [r0]
	add r0, r2, r0, lsl #4
	bl CreateTextBox
	ldr r1, _020442C0 ; =_020AFEC8
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020442C0: .word _020AFEC8
_020442C4: .word _0209CB0C
_020442C8: .word sub_02044338
	arm_func_end sub_0204426C

	arm_func_start sub_020442CC
sub_020442CC: ; 0x020442CC
	stmdb sp!, {r3, lr}
	ldr r0, _02044304 ; =_020AFEC8
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _02044304 ; =_020AFEC8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02044304 ; =_020AFEC8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02044304: .word _020AFEC8
	arm_func_end sub_020442CC

	arm_func_start sub_02044308
sub_02044308: ; 0x02044308
	stmdb sp!, {r3, lr}
	ldr r0, _02044334 ; =_020AFEC8
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r2, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202F9B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02044334: .word _020AFEC8
	arm_func_end sub_02044308

	arm_func_start sub_02044338
sub_02044338: ; 0x02044338
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	ldr r1, _02044404 ; =_020AFEC8
	mov r5, r0
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	cmp r1, #0
	beq _020443FC
	mov r1, #0
	strb r1, [r2, #4]
	mov r4, #2
	bl sub_02027B1C
	ldr r0, _02044404 ; =_020AFEC8
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	cmpne r0, #2
	bne _020443B0
	bl GetNbItemsInBag
	str r0, [sp, #0x28]
	bl GetCurrentBagCapacity
#ifdef JAPAN
	str r0, [sp, #0x2c]
	add r2, sp, #4
	str r2, [sp]
	ldr r3, _0204477C ; =0x000031F7
	mov r0, r5
	mov r1, #0
	mov r2, #2
#else
	mov r2, #2
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	mov r0, r5
	add r3, r2, #0x330
	mov r1, #0
#endif
	bl sub_020262E0
	add r4, r4, #0x10
_020443B0:
	ldr r0, _02044404 ; =_020AFEC8
	ldr r0, [r0]
	ldr r0, [r0]
	sub r0, r0, #1
	cmp r0, #1
	bhi _020443F4
	bl CountNbOfItemsInStorage
	str r0, [sp, #0x28]
	bl sub_0200FD48
	str r0, [sp, #0x2c]
	add ip, sp, #4
	ldr r3, _02044408 ; =0x00000333
	mov r0, r5
	mov r2, r4
	mov r1, #0
	str ip, [sp]
	bl sub_020262E0
_020443F4:
	mov r0, r5
	bl UpdateWindow
_020443FC:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02044404: .word _020AFEC8
#ifdef JAPAN
_0204477C: .word 0x000031F7
_02044408: .word 0x000031F8
#else
_02044408: .word 0x00000333
#endif
	arm_func_end sub_02044338

	arm_func_start sub_0204440C
sub_0204440C: ; 0x0204440C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r2, _02044468 ; =_020AFECC
	mov ip, #0
	str r0, [r2]
	str r4, [r0]
	ldr r1, [r2]
	ldr r0, _0204446C ; =_0209CB3C
	strh ip, [r1, #6]
	ldr r3, [r2]
	ldr r1, _02044470 ; =sub_020444F0
	strh ip, [r3, #8]
	ldr r2, [r2]
	mov r3, #1
	strb r3, [r2, #4]
	bl CreateTextBox
	ldr r1, _02044468 ; =_020AFECC
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02044468: .word _020AFECC
_0204446C: .word _0209CB3C
_02044470: .word sub_020444F0
	arm_func_end sub_0204440C

	arm_func_start sub_02044474
sub_02044474: ; 0x02044474
	stmdb sp!, {r3, lr}
	ldr r0, _020444AC ; =_020AFECC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #0xa]
	bl CloseTextBox2
	ldr r0, _020444AC ; =_020AFECC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _020444AC ; =_020AFECC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020444AC: .word _020AFECC
	arm_func_end sub_02044474

	arm_func_start sub_020444B0
sub_020444B0: ; 0x020444B0
	stmdb sp!, {r3, lr}
	ldr r1, _020444EC ; =_020AFECC
	ldr r3, [r1]
	cmp r3, #0
	ldrnesh r2, [r3, #6]
	cmpne r2, r0
	ldmeqia sp!, {r3, pc}
	strh r0, [r3, #6]
	ldr r0, [r1]
	mov r2, #1
	strb r2, [r0, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #0xa]
	bl sub_0202F9B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020444EC: .word _020AFECC
	arm_func_end sub_020444B0

	arm_func_start sub_020444F0
sub_020444F0: ; 0x020444F0
	stmdb sp!, {r4, lr}
	ldr r1, _02044564 ; =_020AFECC
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	strb r1, [r2, #4]
	bl sub_02027B1C
	ldr r0, _02044564 ; =_020AFECC
	ldr r2, [r0]
	ldrsh r1, [r2, #6]
	strh r1, [r2, #8]
	ldr r0, [r0]
	ldrsh r0, [r0, #8]
	cmp r0, #0
	beq _02044558
#if defined(EUROPE)
	add r0, r0, #0x4b
	add r0, r0, #0x2f00
#elif defined(JAPAN)
	add r0, r0, #0x41
	add r0, r0, #0x1d00
#else
	add r0, r0, #0x49
	add r0, r0, #0x2f00
#endif
	mov r3, r0, lsl #0x10
	mov r1, #2
	mov r0, r4
	mov r2, r1
	mov r3, r3, lsr #0x10
	bl sub_02026268
_02044558:
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_02044564: .word _020AFECC
	arm_func_end sub_020444F0

	arm_func_start sub_02044568
sub_02044568: ; 0x02044568
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _020445BC ; =_020AFED0
	mov r3, #1
	str r0, [r1]
	str r4, [r0]
	ldr r0, [r1]
	ldr r2, _020445C0 ; =_0209CB4C
	strb r3, [r0, #4]
	ldr r0, [r1]
	ldr r1, _020445C4 ; =sub_02044604
	ldr r0, [r0]
	add r0, r2, r0, lsl #4
	bl CreateTextBox
	ldr r1, _020445BC ; =_020AFED0
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020445BC: .word _020AFED0
_020445C0: .word _0209CB4C
_020445C4: .word sub_02044604
	arm_func_end sub_02044568

	arm_func_start sub_020445C8
sub_020445C8: ; 0x020445C8
	stmdb sp!, {r3, lr}
	ldr r0, _02044600 ; =_020AFED0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _02044600 ; =_020AFED0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02044600 ; =_020AFED0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02044600: .word _020AFED0
	arm_func_end sub_020445C8

	arm_func_start sub_02044604
sub_02044604: ; 0x02044604
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	ldr r1, _02044680 ; =_020AFED0
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	cmp r1, #0
	beq _02044678
	mov r1, #0
	strb r1, [r2, #4]
	bl sub_02027B1C
#ifdef JAPAN
	ldr r3, _020449FC ; =0x000031F9
#endif
	mov r0, r4
	mov r1, #4
	mov r2, #0
#ifndef JAPAN
	mov r3, #0x334
#endif
	bl sub_02026268
	bl GetMoneyCarried
	mov r1, #0x18
	str r1, [sp, #0x2c]
	str r0, [sp, #0x28]
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _02044684 ; =0x00000335
	mov r0, r4
	mov r1, #0x10
	mov r2, #0xc
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
_02044678:
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02044680: .word _020AFED0
#ifdef JAPAN
_020449FC: .word 0x000031F9
_02044684: .word 0x000031FA
#else
_02044684: .word 0x00000335
#endif
	arm_func_end sub_02044604

	arm_func_start sub_02044688
sub_02044688: ; 0x02044688
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xa4
	mov r6, r0
	mov r5, r1
	ldr r0, _020447E8 ; =0x00000944
	mov r1, #8
	mov r8, r2
	mov r7, r3
	bl MemAlloc
	ldr r1, _020447E8 ; =0x00000944
	mov r4, r0
	bl MemZero
	mov r1, r8
	mov r2, r7
	mov r3, #0
	strb r3, [r4, #0x72e]
	strb r3, [r4, #0x82e]
	str r3, [r4, #0x940]
	sub r0, r3, #1
	str r0, [r4, #0x930]
	str r3, [r4, #0x940]
	ldr r3, [sp, #0xc4]
	add r0, r4, #4
	str r3, [sp]
	ldrb r3, [sp, #0xc0]
	bl sub_02044BF8
	ldr r0, _020447EC ; =_0209CB78
	ldr r1, _020447F0 ; =sub_02044964
	mov r2, r4
	bl CreateTextBoxWithArg
	strb r0, [r4, #0x72c]
	cmp r5, #3
	mov r0, #0x10
	str r0, [sp, #0x18]
	ldr r1, _020447F4 ; =0x00000A36
	add r0, r4, #0x2e
	add r0, r0, #0x700
	str r0, [sp, #0x54]
	strh r1, [sp, #0x14]
	bne _02044760
	add r1, r1, #3
	add r0, r4, #0x900
	strh r1, [r0, #0x2e]
	str r4, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r0, _020447F8 ; =_0209CB88
	ldr r3, _020447FC ; =sub_02044990
	add r2, sp, #0xc
	mov r1, #0x800
	bl CreateAdvancedTextBoxWithArg
	strb r0, [r4, #0x72d]
	b _020447A8
_02044760:
	cmp r5, #2
	addne r1, r1, #3
	addne r0, r4, #0x900
	strneh r1, [r0, #0x2e]
	bne _020447A8
	add r1, r1, #2
	add r0, r4, #0x900
	strh r1, [r0, #0x2e]
	str r4, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r0, _020447F8 ; =_0209CB88
	ldr r3, _020447FC ; =sub_02044990
	add r2, sp, #0xc
	mov r1, #0x800
	bl CreateAdvancedTextBoxWithArg
	strb r0, [r4, #0x72d]
_020447A8:
	mov r0, r6
	str r6, [r4, #0x934]
	bl GetItemAtIdx
	ldrh r2, [r0]
	add r1, r4, #0x900
	strh r2, [r1, #0x38]
	ldrh r2, [r0, #2]
	strh r2, [r1, #0x3a]
	ldrh r2, [r0, #4]
	mov r0, r4
	strh r2, [r1, #0x3c]
	str r5, [r4]
	bl sub_02044AEC
	mov r0, r4
	add sp, sp, #0xa4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020447E8: .word 0x00000944
_020447EC: .word _0209CB78
_020447F0: .word sub_02044964
#ifdef JAPAN
_020447F4: .word 0x00000871
#else
_020447F4: .word 0x00000A36
#endif
_020447F8: .word _0209CB88
_020447FC: .word sub_02044990
	arm_func_end sub_02044688

	arm_func_start sub_02044800
sub_02044800: ; 0x02044800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x940]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020448E4
_02044818: ; jump table
	b _02044828 ; case 0
	b _02044830 ; case 1
	b _020448B8 ; case 2
	b _020448DC ; case 3
_02044828:
	mov r0, #1
	str r0, [r5, #0x940]
_02044830:
	add r0, r5, #4
	bl sub_020451D8
	mov r4, r0
	mov r0, r5
	bl sub_02044AEC
	cmp r4, #0
	beq _020448E4
	mov r0, #2
	str r0, [r5, #0x940]
	cmp r4, #2
	bne _020448E4
	add r0, r5, #4
	bl sub_020452A0
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020448A0
_02044870: ; jump table
	b _02044880 ; case 0
	b _02044888 ; case 1
	b _02044890 ; case 2
	b _02044898 ; case 3
_02044880:
	mov r1, #1
	b _020448A4
_02044888:
	mov r1, #2
	b _020448A4
_02044890:
	mov r1, #3
	b _020448A4
_02044898:
	mov r1, #4
	b _020448A4
_020448A0:
	mov r1, #0
_020448A4:
	ldr r0, [r5, #0x934]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02058460
	b _020448E4
_020448B8:
	add r0, r5, #4
	bl sub_020452B8
	cmp r0, #0
	beq _020448E4
	mov r0, r5
	bl sub_02044918
	mov r0, #3
	str r0, [r5, #0x940]
	b _020448E4
_020448DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020448E4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02044800

	arm_func_start sub_020448EC
sub_020448EC: ; 0x020448EC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_02044918
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020448EC

	arm_func_start sub_02044918
sub_02044918: ; 0x02044918
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x700
	ldrsb r0, [r0, #0x2d]
	mvn r1, #1
	cmp r0, r1
	beq _02044940
	bl CloseAdvancedTextBox
	mvn r0, #1
	strb r0, [r4, #0x72d]
_02044940:
	add r0, r4, #0x700
	ldrsb r0, [r0, #0x2c]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl CloseTextBox
	mvn r0, #1
	strb r0, [r4, #0x72c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02044918

	arm_func_start sub_02044964
sub_02044964: ; 0x02044964
	stmdb sp!, {r4, lr}
	add r1, r1, #0x900
	mov r4, r0
	ldrh r0, [r1, #0x2e]
	bl StringFromId
	mov r1, #2
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	ldmia sp!, {r4, pc}
	arm_func_end sub_02044964

	arm_func_start sub_02044990
sub_02044990: ; 0x02044990
	ldr ip, _020449A8 ; =DrawTextInWindow
	add r1, r1, #0x2e
	add r3, r1, #0x800
	mov r1, #2
	mov r2, #0x10
	bx ip
	.align 2, 0
_020449A8: .word DrawTextInWindow
	arm_func_end sub_02044990

	arm_func_start sub_020449AC
sub_020449AC: ; 0x020449AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	add r0, r6, #4
	mov r5, r1
	mov r4, #0
	bl sub_02045298
	cmp r0, #0
#ifdef JAPAN
	beq _02044A30
#else
	bne _020449E8
	mov r0, r5
	bl sub_02045330
	add r2, r6, #0x2e
	mov r1, r0
	add r0, r2, #0x700
	bl sub_020584FC
	b _02044A30
_020449E8:
#endif
	ldr r1, _02044ADC ; =DUNGEON_PTR
	add r0, r6, #0x2e
	ldr r1, [r1]
	add r0, r0, #0x700
	add r1, r1, r5, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	mov r2, r4
	ldr r7, [r1, #0xb4]
	bl ov29_022E2A78
	ldrb r0, [r7, #0xbc]
	cmp r0, #7
	beq _02044A2C
	mov r0, r7
	bl IsExperienceLocked
	cmp r0, #0
	beq _02044A30
_02044A2C:
	mov r4, #1
_02044A30:
	cmp r4, #0
	beq _02044A4C
	add r0, r6, #0x2e
	ldr r1, _02044AE0 ; =0x00000A3D
	add r0, r0, #0x800
	bl GetStringFromFileVeneer
	b _02044ACC
_02044A4C:
	add r0, r6, #4
	bl sub_02045298
	cmp r0, #0
	bne _02044A70
	mov r0, r5
	bl sub_02045330
	bl GetActiveTeamMember
	add r1, r0, #0x3e
	b _02044A8C
_02044A70:
	ldr r0, _02044ADC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	ldr r0, [r0, #0xb4]
	add r1, r0, #0x62
_02044A8C:
	ldrb r0, [r1]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	add r0, r6, #0x2e
	bne _02044AB8
	ldr r1, _02044AE4 ; =0x00000A37
	add r0, r0, #0x800
	bl GetStringFromFileVeneer
	b _02044ACC
_02044AB8:
	ldr r2, _02044AE8 ; =_0209CB6C
	mov r3, #1
	add r0, r0, #0x800
	str r3, [sp]
	bl sub_0200D310
_02044ACC:
	add r0, r6, #0x700
	ldrsb r0, [r0, #0x2d]
	bl SetAdvancedTextBoxField0x1C2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02044ADC: .word DUNGEON_PTR
#ifdef JAPAN
_02044AE0: .word 0x00000878
_02044AE4: .word 0x00000872
#else
_02044AE0: .word 0x00000A3D
_02044AE4: .word 0x00000A37
#endif
_02044AE8: .word _0209CB6C
	arm_func_end sub_020449AC

	arm_func_start sub_02044AEC
sub_02044AEC: ; 0x02044AEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	add r0, r7, #4
	bl sub_020452A0
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	ldrne r0, [r7, #0x930]
	ldr r5, [r7]
	cmpne r0, r4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r7, #4
	bl sub_02045298
	cmp r0, #0
	bne _02044B5C
	cmp r5, #1
	addne r0, r7, #0x700
	ldrnesb r1, [r0, #0x2d]
	mvnne r0, #1
	cmpne r1, r0
	beq _02044BEC
	sub r0, r5, #2
	cmp r0, #1
	bhi _02044BEC
	mov r0, r7
	mov r1, r4
	bl sub_020449AC
	b _02044BEC
_02044B5C:
	ldr r0, _02044BF4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa84]
#else
	ldr r6, [r0, #0xb28]
#endif
	cmp r6, #0
	moveq r0, #0
	beq _02044B90
	ldr r0, [r6]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02044B90:
	cmp r0, #0
	cmpne r5, #1
	beq _02044BC8
	sub r0, r5, #2
	cmp r0, #1
	bhi _02044BC8
	add r0, r7, #0x700
	ldrsb r1, [r0, #0x2d]
	mvn r0, #1
	cmp r1, r0
	beq _02044BC8
	mov r0, r7
	mov r1, r4
	bl sub_020449AC
_02044BC8:
	mov r0, r6
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	mov r2, #1
	mov r3, r2
	add r0, r6, #4
	mov r1, #0
	bl DrawTileGrid
_02044BEC:
	str r4, [r7, #0x930]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02044BF4: .word DUNGEON_PTR
	arm_func_end sub_02044AEC

	arm_func_start sub_02044BF8
sub_02044BF8: ; 0x02044BF8
#ifdef JAPAN
#define SUB_02044BF8_LOAD_OFFSET #0xa84
#else
#define SUB_02044BF8_LOAD_OFFSET #0xb28
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xbc
	mov fp, r1
	str r2, [sp, #4]
	ldr r1, _0204519C ; =0x00000728
	mov sl, r0
	str r3, [sp, #8]
	bl MemZero
	ldr sb, [sp, #0xe0]
	add r0, sl, #0x20c
	mov r4, #0
	str r4, [sl]
	cmp sb, #0
	add r7, r0, #0x400
	bne _02044CD8
	mov r8, r4
	mov fp, r4
	mov r6, #1
	mov r5, r4
_02044C44:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r1, r6
	moveq r1, fp
	tst r1, #0xff
	beq _02044C88
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r1, r7, r4, lsl #2
	addne r0, r7, r4
	strne r8, [r1, #8]
	strneb r5, [r0, #0x18]
	addne r4, r4, #1
_02044C88:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02044C44
	mov r0, r4, lsl #0x10
	mov r5, r0, asr #0x10
	mvn r3, #0
	mov r2, #0
	b _02044CCC
_02044CB0:
	add r1, r7, r5, lsl #2
	add r0, r5, #1
	str r3, [r1, #8]
	add r1, r7, r5
	mov r0, r0, lsl #0x10
	strb r2, [r1, #0x18]
	mov r5, r0, asr #0x10
_02044CCC:
	cmp r5, #4
	blt _02044CB0
	b _02044D78
_02044CD8:
	mov r5, r4
_02044CDC:
	ldr r0, _020451A0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, SUB_02044BF8_LOAD_OFFSET]
	mov r0, r6
	bl sub_0204533C
	cmp r0, #0
	beq _02044D40
	cmp fp, #0
	beq _02044D18
	mov r0, r6
	ldr r8, [r6, #0xb4]
	bl ov29_02347100
#ifdef JAPAN
	strb r0, [r8, #0x15d]
#else
	strb r0, [r8, #0x161]
#endif
_02044D18:
	add r0, r7, r4, lsl #2
	str r5, [r0, #8]
	ldr r0, [r6, #0xb4]
#ifdef JAPAN
	ldrb r0, [r0, #0x15d]
#else
	ldrb r0, [r0, #0x161]
#endif
	cmp r0, #0
	movne r1, #0
	add r0, r7, r4
	moveq r1, #3
	strb r1, [r0, #0x18]
	add r4, r4, #1
_02044D40:
	add r5, r5, #1
	cmp r5, #4
	blt _02044CDC
	mov r5, r4
	mvn r3, #0
	mov r1, #0
	b _02044D70
_02044D5C:
	add r2, r7, r5, lsl #2
	add r0, r7, r5
	str r3, [r2, #8]
	strb r1, [r0, #0x18]
	add r5, r5, #1
_02044D70:
	cmp r5, #4
	blt _02044D5C
_02044D78:
	ldr r0, [sp, #0xe0]
	str r4, [r7, #0x1c]
	str r0, [r7]
	cmp sb, #0
	moveq r0, #0
	beq _02044D98
	mov r0, #0xb
	bl Arm9LoadUnkFieldNa0x2029EC8
_02044D98:
	str r0, [sl, #0x6e8]
	str r4, [sl, #0x6ec]
	str r4, [sl, #0x6f0]
	mov sb, #0
	str sb, [sl, #0x6f4]
	str sb, [sl, #0x6f8]
	add r0, sl, #0x18c
	str sb, [sl, #0x6dc]
	add r2, sl, #0x20c
	add r0, r0, #0x400
	mov r1, #0x40
	str sb, [sl, #0x6e0]
	add r5, r2, #0x400
	bl MemZero
	add r0, sl, #0x1cc
	add r0, r0, #0x400
	mov r1, #0x40
	bl MemZero
	add r0, sl, #0x18c
	add r0, r0, #0x400
	str r0, [sp, #0x14]
	add r0, sl, #0x3c
	add r1, sl, #0x1cc
	add r2, sl, #0x13c
	str r0, [sp, #0x10]
	add r0, r2, #0x400
	str r0, [sp, #0x18]
	ldr r0, _020451A4 ; =0x000003E7
	mov r6, sb
	sub r0, r0, #0x3e8
	str r0, [sp, #0x20]
	ldr r0, _020451A4 ; =0x000003E7
	add r4, r1, #0x400
	sub r0, r0, #0x3e8
	str r0, [sp, #0x1c]
	b _020450F8
_02044E28:
	mov r0, r5
	mov r1, r6
	bl sub_02045360
	mov fp, r0
	ldr r0, [sp, #0x1c]
	cmp fp, r0
	beq _020450F4
	ldr r0, [sp, #0x10]
	mov r1, r6
	add r0, r0, sb, lsl #8
	str r0, [sp, #0xc]
	mov r0, r5
	bl sub_02045360
	mov r1, r0
	ldr r0, [sp, #0x20]
	cmp r1, r0
	beq _02044EC4
	ldr r0, [r5]
	cmp r0, #0
	bne _02044E8C
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	ldr r0, [sp, #0x14]
	bl sub_020584FC
	b _02044EC4
_02044E8C:
	ldr r3, _020451A0 ; =DUNGEON_PTR
	add r0, r5, r6
	ldr r3, [r3]
	ldrb r0, [r0, #0x18]
	add r1, r3, r1, lsl #2
	add r1, r1, #0x12000
	cmp r0, #0
	movne r0, #0x57
	ldr r1, [r1, SUB_02044BF8_LOAD_OFFSET]
	moveq r0, #0x44
	and r2, r0, #0xff
	ldr r0, [sp, #0x14]
	ldr r1, [r1, #0xb4]
	bl ov29_023002F0
_02044EC4:
	ldr r0, [sp, #0x14]
	str r0, [sl, #0x574]
	ldr r0, [r5]
	cmp r0, #0
	bne _02044EE8
	ldr r1, _020451A8 ; =_0209CBA8
	mov r0, r4
	bl strcpy
	b _020450A8
_02044EE8:
	ldr r0, _020451A0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, fp, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, SUB_02044BF8_LOAD_OFFSET]
	bl sub_0204533C
	cmp r0, #0
	beq _020450F4
	ldr r0, _020451A0 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldr r0, _020451AC ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	add r0, r2, fp, lsl #2
	add r0, r0, #0x12000
	ldr r2, [r0, SUB_02044BF8_LOAD_OFFSET]
	add r0, r1, #0x9000
	ldr r8, [r2, #0xb4]
	ldr r2, [r0, #0x84c]
	ldrsh r1, [r8, #0xc]
	mov r0, #0x68
	smlabb r0, r1, r0, r2
	ldrsh r0, [r0, #8]
	bl sub_02056228
	cmp r0, #0
	ldrsh r1, [r8, #0x12]
	ldrsh r0, [r8, #0x16]
	beq _02045000
	add r1, r1, r0
	ldr r0, _020451A4 ; =0x000003E7
	cmp r1, r0
	movgt r3, r0
	movle r3, r1
	mov r2, r3, asr #1
	ldrsh r0, [r8, #0x10]
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	bgt _02044F8C
	ldr r1, _020451B0 ; =_0209CBB0
	mov r0, r4
	bl strcpy
	b _020450A8
_02044F8C:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r3, r2
	movle r3, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	cmp r0, r2, lsl #1
	bgt _02044FC0
	ldr r1, _020451B4 ; =_0209CBB8
	mov r0, r4
	bl strcpy
	b _020450A8
_02044FC0:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r1, r2
	mov r2, r1, asr #1
	add r1, r1, r2, lsr #30
	mov r1, r1, asr #2
	add r1, r1, r1, lsl #1
	cmp r0, r1
	mov r0, r4
	bgt _02044FF4
	ldr r1, _020451B8 ; =_0209CBC0
	bl strcpy
	b _020450A8
_02044FF4:
	ldr r1, _020451BC ; =_0209CBC8
	bl strcpy
	b _020450A8
_02045000:
	add r1, r1, r0
	ldr r0, _020451A4 ; =0x000003E7
	cmp r1, r0
	movgt r3, r0
	movle r3, r1
	mov r2, r3, asr #1
	ldrsh r0, [r8, #0x10]
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	bgt _02045038
	ldr r1, _020451C0 ; =_0209CBD0
	mov r0, r4
	bl strcpy
	b _020450A8
_02045038:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r3, r2
	movle r3, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	cmp r0, r2, lsl #1
	bgt _0204506C
	ldr r1, _020451C4 ; =_0209CBD8
	mov r0, r4
	bl strcpy
	b _020450A8
_0204506C:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r1, r2
	mov r2, r1, asr #1
	add r1, r1, r2, lsr #30
	mov r1, r1, asr #2
	add r1, r1, r1, lsl #1
	cmp r0, r1
	mov r0, r4
	bgt _020450A0
	ldr r1, _020451C8 ; =_0209CBE0
	bl strcpy
	b _020450A8
_020450A0:
	ldr r1, _020451A8 ; =_0209CBA8
	bl strcpy
_020450A8:
	str r4, [sl, #0x578]
	ldr r0, [r5]
	cmp r0, #0
	bne _020450C4
	mov r0, fp, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
_020450C4:
	ldr r0, [sp, #0x18]
	ldr r2, _020451CC ; =_0209CBE8
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r1, #0x100
	mov r3, #0
	bl PreprocessString
	add r1, sl, sb, lsl #3
	ldr r0, [sp, #0xc]
	add sb, sb, #1
	str r0, [r1, #0xc]
	str sb, [r1, #0x10]
_020450F4:
	add r6, r6, #1
_020450F8:
	ldr r0, [r5, #0x1c]
	cmp r6, r0
	blt _02044E28
	mov r0, #0
	add r1, sl, sb, lsl #3
	str r0, [r1, #0xc]
	sub r0, r0, #1
	str r0, [r1, #0x10]
	ldr r0, [sp, #4]
	add r2, sp, #0x24
	cmp r0, #0
	ldrne r1, _020451D0 ; =0x00000A3A
	movne r0, #0x10
	strne r0, [sp, #0x30]
	strneh r1, [sp, #0x2c]
	ldr r1, [sl, #0x6e8]
	add r0, r7, #0x18
	add r1, r1, #1
	str r1, [sp, #0x24]
	str r0, [sp, #0x84]
	ldr r0, [sp, #4]
	add r3, sl, #0xc
	cmp r0, #0
	movne r1, #0x800
	ldr r0, [sp, #8]
	moveq r1, #0
	cmp r0, #0
	movne r0, #0x400000
	moveq r0, #0
	orr r0, r0, #0x33
	orr r1, r0, r1
	ldr r0, _020451D4 ; =_0209CB98
	orr r1, r1, #0x1200
	bl CreateParentMenu
	ldr r1, [sp, #0xe0]
	strb r0, [sl, #8]
	cmp r1, #1
	bne _02045194
	bl ov29_022EA62C
_02045194:
	add sp, sp, #0xbc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204519C: .word 0x00000728
_020451A0: .word DUNGEON_PTR
_020451A4: .word 0x000003E7
_020451A8: .word _0209CBA8
_020451AC: .word TEAM_MEMBER_TABLE_PTR
_020451B0: .word _0209CBB0
_020451B4: .word _0209CBB8
_020451B8: .word _0209CBC0
_020451BC: .word _0209CBC8
_020451C0: .word _0209CBD0
_020451C4: .word _0209CBD8
_020451C8: .word _0209CBE0
_020451CC: .word _0209CBE8
#ifdef JAPAN
_020451D0: .word 0x00000875
#else
_020451D0: .word 0x00000A3A
#endif
_020451D4: .word _0209CB98
	arm_func_end sub_02044BF8

	arm_func_start sub_020451D8
sub_020451D8: ; 0x020451D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4]
	add r0, r4, #0x20c
	cmp r1, #0
	add r5, r0, #0x400
	beq _02045208
	cmp r1, #1
	beq _02045220
	cmp r1, #2
	beq _02045288
	b _02045290
_02045208:
	ldrsb r0, [r4, #8]
	bl IsParentMenuActive
	cmp r0, #0
	beq _02045290
	mov r0, #1
	str r0, [r4]
_02045220:
	ldrsb r0, [r4, #8]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02045278
	mov r0, #2
	str r0, [r4]
	ldrsb r0, [r4, #8]
	bl GetSimpleMenuResult__0202AEA4
	subs r0, r0, #1
	bmi _0204526C
	str r0, [r4, #0x6e8]
	add r0, r5, r0
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	moveq r0, #2
	streq r0, [r4, #0x724]
	movne r0, #1
	strne r0, [r4, #0x724]
	b _02045290
_0204526C:
	mov r0, #1
	str r0, [r4, #0x724]
	b _02045290
_02045278:
	ldrsb r0, [r4, #8]
	bl GetWindowIdSelectedItemOnPage
	str r0, [r4, #0x6e8]
	b _02045290
_02045288:
	ldr r0, [r4, #0x724]
	ldmia sp!, {r3, r4, r5, pc}
_02045290:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020451D8

	arm_func_start sub_02045298
sub_02045298: ; 0x02045298
	ldr r0, [r0, #0x60c]
	bx lr
	arm_func_end sub_02045298

	arm_func_start sub_020452A0
sub_020452A0: ; 0x020452A0
	ldr ip, _020452B4 ; =sub_02045360
	add r2, r0, #0x20c
	ldr r1, [r0, #0x6e8]
	add r0, r2, #0x400
	bx ip
	.align 2, 0
_020452B4: .word sub_02045360
	arm_func_end sub_020452A0

	arm_func_start sub_020452B8
sub_020452B8: ; 0x020452B8
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldrnesb r0, [r4, #8]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl sub_0202AAE8
	cmp r0, #0
	ldrsb r0, [r4, #8]
	beq _02045310
	bl sub_020282F4
	add r0, r0, #5
	cmp r0, #1
	movhi r0, #0
	bhi _02045320
	ldrsb r0, [r4, #8]
	bl CloseParentMenu
	mvn r0, #1
	strb r0, [r4, #8]
	mov r0, #1
	b _02045320
_02045310:
	bl CloseParentMenu
	mvn r0, #1
	strb r0, [r4, #8]
	mov r0, #1
_02045320:
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020452B8

	arm_func_start sub_02045330
sub_02045330: ; 0x02045330
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_02045330

	arm_func_start sub_0204533C
sub_0204533C: ; 0x0204533C
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0204533C

	arm_func_start sub_02045360
sub_02045360: ; 0x02045360
	stmdb sp!, {r4, lr}
	add r1, r0, r1, lsl #2
	ldr r4, [r1, #8]
	mvn r1, #0
	cmp r4, r1
	moveq r0, r1
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	cmp r0, #0
	bne _020453C8
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _020453C0
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _020453EC
_020453C0:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_020453C8:
	ldr r0, _020453F4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl sub_0204533C
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
_020453EC:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020453F4: .word DUNGEON_PTR
	arm_func_end sub_02045360

	arm_func_start sub_020453F8
sub_020453F8: ; 0x020453F8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020454DC ; =_020AFED4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	bne _02045428
	mov r0, #0x410
	mov r1, #8
	bl MemAlloc
	ldr r1, _020454DC ; =_020AFED4
	str r0, [r1]
_02045428:
	bl sub_02044094
	bl sub_020440DC
	ldr r1, _020454DC ; =_020AFED4
	mov r2, #0
	ldr r0, [r1]
	strb r4, [r0, #0x386]
	ldr r0, [r1]
	add r0, r0, #0x300
	strh r2, [r0, #0x88]
	ldr r0, [r1]
	str r2, [r0, #0x38c]
	ldr r0, [r1]
	add r0, r0, #0x1c
	bl InitPreprocessorArgs
	ldr r1, _020454DC ; =_020AFED4
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #2
	str r0, [r2, #0x68]
	ldr r2, [r1]
	cmp r4, #0
	str r0, [r2, #0x1c]
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r2, [r1]
	strb r3, [r2, #0x14]
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r2, [r1]
	strb r3, [r2, #0x15]
	ldr r2, [r1]
	strb r3, [r2, #0x17]
	ldr r3, [r1]
	ldrh r2, [r5]
	add r1, r3, #0x300
	strh r2, [r1, #0x80]
	ldrh r2, [r5, #2]
	strh r2, [r1, #0x82]
	ldrh r2, [r5, #4]
	strh r2, [r1, #0x84]
	str r0, [r3, #0x6c]
	moveq r0, #0x13
	bl sub_020454E0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020454DC: .word _020AFED4
	arm_func_end sub_020453F8

	arm_func_start sub_020454E0
sub_020454E0: ; 0x020454E0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x194
	ldr r1, _02045A1C ; =_020AFED4
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r4, [r1]
	ldr r0, [r4, #4]
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _02045A14
_02045508: ; jump table
	b _02045558 ; case 0
	b _02045584 ; case 1
	b _020455CC ; case 2
	b _02045A14 ; case 3
	b _02045A14 ; case 4
	b _02045A14 ; case 5
	b _020458C0 ; case 6
	b _02045914 ; case 7
	b _02045844 ; case 8
	b _02045948 ; case 9
	b _02045984 ; case 10
	b _020459C0 ; case 11
	b _02045A14 ; case 12
	b _02045A14 ; case 13
	b _02045958 ; case 14
	b _02045798 ; case 15
	b _02045688 ; case 16
	b _02045764 ; case 17
	b _02045A14 ; case 18
	b _020459E0 ; case 19
_02045558:
	mov r0, #2
	str r0, [r4, #8]
	bl sub_02046624
	ldr r0, _02045A1C ; =_020AFED4
	ldr r2, _02045A20 ; =0x000002CD
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_02045584:
	mov r0, #2
	str r0, [r4, #8]
	bl sub_02046624
	ldr r0, _02045A1C ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045A1C ; =_020AFED4
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _02045A24 ; =0x000002D5
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_020455CC:
	ldr r1, _02045A28 ; =0x000002CE
	add r0, r4, #0x70
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x14
	str r1, [r4, #0x170]
	bl InitPreprocessorArgs
	ldr r0, _02045A1C ; =_020AFED4
	ldr r2, _02045A2C ; =_0209CC0C
	ldr r1, [r0]
	add r0, r1, #0x390
	add r1, r1, #0x380
	bl sub_0200D670
	ldr r0, _02045A1C ; =_020AFED4
	ldr r2, _02045A30 ; =0x000002CF
	ldr r5, [r0]
	add ip, sp, #0x14
	add r3, r5, #0x300
	ldrsh lr, [r3, #0x84]
	add r0, r4, #0x174
	mov r1, #0x100
	orr lr, lr, #0x10000
	str lr, [sp, #0x24]
	ldrh lr, [r3, #0x82]
	mov r3, #0
	str lr, [sp, #0x38]
	ldrb lr, [r5, #0x380]
	str lr, [sp, #0x3c]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r1, #3
	str r1, [r4, #0x274]
	mov r2, #0
	strb r2, [r4, #0x278]
	mov r0, #1
	str r0, [r4, #0x378]
	str r1, [sp]
	ldr r3, _02045A1C ; =_020AFED4
	ldr r0, _02045A34 ; =_0209CC38
	ldr r3, [r3]
	ldr r1, _02045A38 ; =0x00300011
	add r3, r3, #0x70
	bl CreateSimpleMenu
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045688:
	mov r0, #0x11
	str r0, [r4, #8]
	ldr r0, [r1]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045A1C ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r1, [r2]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	strh r0, [sp, #0x10]
	ldr r0, [r1]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r3, _02045A1C ; =_020AFED4
	ldr r2, _02045A2C ; =_0209CC0C
	ldr r4, [r3]
	add r1, sp, #0xc
	str r0, [r4, #0x38c]
	ldr r0, [r3]
	mov r3, #0
	ldr r4, [r0, #0x38c]
	add r0, r0, #0x390
	strh r4, [sp, #0xe]
	strb r3, [sp, #0xc]
	bl sub_0200D670
	ldr r0, _02045A1C ; =_020AFED4
	ldr r2, [r0]
	add r1, r2, #0x390
	str r1, [r2, #0x54]
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r1, #0x2c]
	bl sub_02046624
	ldr r0, _02045A1C ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045A1C ; =_020AFED4
	mov r4, #0x11
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02045D9C ; =0x00002FC5
	str r4, [r3, #8]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #8]
	ldr r3, [r0]
	add r2, r4, #0x2c0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_02045764:
	mov r4, #3
	str r4, [sp, #0x64]
	mov r4, #2
	ldr r0, _02045A34 ; =_0209CC38
	ldr r1, _02045A3C ; =0x00300033
	ldr r3, _02045A40 ; =_0209CC48
	add r2, sp, #0x64
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045798:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045A1C ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r4, _02045A1C ; =_020AFED4
	ldr r1, _02045A44 ; =0x00001013
	ldr r2, [r4]
	ldr r3, _02045A48 ; =0x000008E4
	str r0, [r2, #0x38c]
	ldr lr, [r4]
	ldr r0, _02045A4C ; =_0209CC28
	add r2, lr, #0x300
	ldrsh ip, [r2, #0x88]
	mov r2, #0
	str ip, [lr, #0x2c]
	ldr lr, [r4]
	ldr ip, [lr, #0x38c]
	add ip, ip, #0xbc
	str ip, [lr, #0x34]
	ldr r4, [r4]
	add ip, r4, #0x1c
	add r4, r4, #0x300
	str ip, [sp]
	ldrsh r4, [r4, #0x88]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x17]
	b _02045A14
_02045844:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045A1C ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r1, _02045A1C ; =_020AFED4
	mov r2, #3
	ldr r3, [r1]
	str r0, [r3, #0x38c]
	ldr r3, [r1]
	add r0, r3, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r3, #0x2c]
	ldr r0, [r1]
	str r2, [r0, #4]
	bl sub_02045A5C
	ldr r0, _02045A1C ; =_020AFED4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010154
	b _02045A14
_020458C0:
	add r0, r4, #0x390
	str r0, [r4, #0x5c]
	ldr r0, [r1]
	mov r1, #7
	str r1, [r0, #8]
	bl sub_02046624
	ldr r0, _02045A1C ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045A1C ; =_020AFED4
	mov r3, #7
	ldr r1, [r0]
	ldr r2, _02045A50 ; =0x000002D6
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_02045914:
	mov r4, #3
	str r4, [sp, #0xfc]
	mov r4, #2
	ldr r0, _02045A34 ; =_0209CC38
	ldr r1, _02045A3C ; =0x00300033
	ldr r3, _02045A40 ; =_0209CC48
	add r2, sp, #0xfc
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045948:
	mov r0, #4
	str r0, [r4, #4]
	bl sub_02045A5C
	b _02045A14
_02045958:
	ldr r0, _02045A54 ; =_0209CC18
	mov r4, #3
	ldr r3, _02045A58 ; =_0209CC60
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045984:
	ldrsb r0, [r4, #0x14]
	bl CloseDialogueBox
	ldr r0, _02045A1C ; =_020AFED4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	bl sub_02043218
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045A14
_020459C0:
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _02045A1C ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045A14
_020459E0:
	mov r0, #0xa
	str r0, [r4, #8]
	ldr r0, [r1]
	mov r1, #0x12
	str r1, [r0, #4]
	bl sub_02046624
	ldr r0, _02045A1C ; =_020AFED4
#ifdef JAPAN
	ldr r2, _02045DC0 ; =0x00002FC4
	ldr r3, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r3, [r0]
	mov r2, #0x2d0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
_02045A14:
	add sp, sp, #0x194
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_020454E0_OFFSET 0x2CF4
#else
#define SUB_020454E0_OFFSET 0
#endif
_02045A1C: .word _020AFED4
_02045A20: .word 0x000002CD + SUB_020454E0_OFFSET
_02045A24: .word 0x000002D5 + SUB_020454E0_OFFSET
_02045A28: .word 0x000002CE + SUB_020454E0_OFFSET
_02045A2C: .word _0209CC0C
_02045A30: .word 0x000002CF + SUB_020454E0_OFFSET
_02045A34: .word _0209CC38
_02045A38: .word 0x00300011
#ifdef JAPAN
_02045D9C: .word 0x00002FC5
#endif
_02045A3C: .word 0x00300033
_02045A40: .word _0209CC48
_02045A44: .word 0x00001013
#ifdef JAPAN
_02045A48: .word 0x00001D3C
#else
_02045A48: .word 0x000008E4
#endif
_02045A4C: .word _0209CC28
_02045A50: .word 0x000002D6 + SUB_020454E0_OFFSET
_02045A54: .word _0209CC18
_02045A58: .word _0209CC60
#ifdef JAPAN
_02045DC0: .word 0x00002FC4
#endif
	arm_func_end sub_020454E0

	arm_func_start sub_02045A5C
sub_02045A5C: ; 0x02045A5C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x194
	ldr r0, _02045F90 ; =_020AFED4
	ldr r4, [r0]
	ldr r1, [r4, #4]
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _02045F88
_02045A7C: ; jump table
	b _02045ACC ; case 0
	b _02045AF8 ; case 1
	b _02045B40 ; case 2
	b _02045F88 ; case 3
	b _02045F88 ; case 4
	b _02045F88 ; case 5
	b _02045E34 ; case 6
	b _02045E88 ; case 7
	b _02045DB8 ; case 8
	b _02045EBC ; case 9
	b _02045EF8 ; case 10
	b _02045F34 ; case 11
	b _02045F88 ; case 12
	b _02045F88 ; case 13
	b _02045ECC ; case 14
	b _02045D0C ; case 15
	b _02045BFC ; case 16
	b _02045CD8 ; case 17
	b _02045F88 ; case 18
	b _02045F54 ; case 19
_02045ACC:
	mov r0, #2
	str r0, [r4, #8]
	bl sub_02046624
	ldr r0, _02045F90 ; =_020AFED4
	ldr r2, _02045F94 ; =0x000002CD
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045AF8:
	mov r0, #2
	str r0, [r4, #8]
	bl sub_02046624
	ldr r0, _02045F90 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045F90 ; =_020AFED4
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _02045F98 ; =0x000002D5
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045B40:
	ldr r1, _02045F9C ; =0x000002CE
	add r0, r4, #0x70
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x144
	str r1, [r4, #0x170]
	bl InitPreprocessorArgs
	ldr r0, _02045F90 ; =_020AFED4
	ldr r2, _02045FA0 ; =_0209CC0C
	ldr r1, [r0]
	add r0, r1, #0x390
	add r1, r1, #0x380
	bl sub_0200D670
	ldr r0, _02045F90 ; =_020AFED4
	ldr r2, _02045FA4 ; =0x000002CF
	ldr r5, [r0]
	add ip, sp, #0x144
	add r3, r5, #0x300
	ldrsh lr, [r3, #0x84]
	add r0, r4, #0x174
	mov r1, #0x100
	orr lr, lr, #0x10000
	str lr, [sp, #0x154]
	ldrh lr, [r3, #0x82]
	mov r3, #0
	str lr, [sp, #0x168]
	ldrb lr, [r5, #0x380]
	str lr, [sp, #0x16c]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r1, #3
	str r1, [r4, #0x274]
	mov r2, #0
	strb r2, [r4, #0x278]
	mov r0, #1
	str r0, [r4, #0x378]
	str r1, [sp]
	ldr r3, _02045F90 ; =_020AFED4
	ldr r0, _02045FA8 ; =_0209CC38
	ldr r3, [r3]
	ldr r1, _02045FAC ; =0x00300011
	add r3, r3, #0x70
	bl CreateSimpleMenu
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045BFC:
	mov r1, #0x11
	str r1, [r4, #8]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045F90 ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r1, [r2]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	strh r0, [sp, #0x10]
	ldr r0, [r1]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r3, _02045F90 ; =_020AFED4
	ldr r2, _02045FA0 ; =_0209CC0C
	ldr r4, [r3]
	add r1, sp, #0xc
	str r0, [r4, #0x38c]
	ldr r0, [r3]
	mov r3, #0
	ldr r4, [r0, #0x38c]
	add r0, r0, #0x390
	strh r4, [sp, #0xe]
	strb r3, [sp, #0xc]
	bl sub_0200D670
	ldr r0, _02045F90 ; =_020AFED4
	ldr r2, [r0]
	add r1, r2, #0x390
	str r1, [r2, #0x54]
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r1, #0x2c]
	bl sub_02046624
	ldr r0, _02045F90 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045F90 ; =_020AFED4
	mov r4, #0x11
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02046318 ; =0x00002FC5
	str r4, [r3, #8]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #8]
	ldr r3, [r0]
	add r2, r4, #0x2c0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045CD8:
	mov r4, #3
	str r4, [sp, #0xac]
	mov r4, #2
	ldr r0, _02045FA8 ; =_0209CC38
	ldr r1, _02045FB0 ; =0x00300033
	ldr r3, _02045FB4 ; =_0209CC48
	add r2, sp, #0xac
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045D0C:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045F90 ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r4, _02045F90 ; =_020AFED4
	ldr r1, _02045FB8 ; =0x00001013
	ldr r2, [r4]
	ldr r3, _02045FBC ; =0x000008E4
	str r0, [r2, #0x38c]
	ldr lr, [r4]
	ldr r0, _02045FC0 ; =_0209CC28
	add r2, lr, #0x300
	ldrsh ip, [r2, #0x88]
	mov r2, #0
	str ip, [lr, #0x2c]
	ldr lr, [r4]
	ldr ip, [lr, #0x38c]
	add ip, ip, #0xbc
	str ip, [lr, #0x34]
	ldr r4, [r4]
	add ip, r4, #0x1c
	add r4, r4, #0x300
	str ip, [sp]
	ldrsh r4, [r4, #0x88]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x17]
	b _02045F88
_02045DB8:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045F90 ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r1, _02045F90 ; =_020AFED4
	mov r2, #3
	ldr r3, [r1]
	str r0, [r3, #0x38c]
	ldr r3, [r1]
	add r0, r3, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r3, #0x2c]
	ldr r0, [r1]
	str r2, [r0, #4]
	bl sub_02045A5C
	ldr r0, _02045F90 ; =_020AFED4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010154
	b _02045F88
_02045E34:
	add r1, r4, #0x390
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	mov r1, #7
	str r1, [r0, #8]
	bl sub_02046624
	ldr r0, _02045F90 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045F90 ; =_020AFED4
	mov r3, #7
	ldr r1, [r0]
	ldr r2, _02045FC4 ; =0x000002D6
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045E88:
	mov r4, #3
	str r4, [sp, #0x14]
	mov r4, #2
	ldr r0, _02045FA8 ; =_0209CC38
	ldr r1, _02045FB0 ; =0x00300033
	ldr r3, _02045FB4 ; =_0209CC48
	add r2, sp, #0x14
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045EBC:
	mov r0, #4
	str r0, [r4, #4]
	bl sub_02045A5C
	b _02045F88
_02045ECC:
	ldr r0, _02045FC8 ; =_0209CC18
	mov r4, #3
	ldr r3, _02045FCC ; =_0209CC60
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045EF8:
	ldrsb r0, [r4, #0x14]
	bl CloseDialogueBox
	ldr r0, _02045F90 ; =_020AFED4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	bl sub_02043218
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045F88
_02045F34:
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl sub_02042CF0
	ldr r1, _02045F90 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045F88
_02045F54:
	mov r1, #0xa
	str r1, [r4, #8]
	ldr r0, [r0]
	mov r1, #0x12
	str r1, [r0, #4]
	bl sub_02046624
	ldr r0, _02045F90 ; =_020AFED4
#ifdef JAPAN
	ldr r2, _0204633C ; =0x00002FC4
	ldr r3, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r3, [r0]
	mov r2, #0x2d0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
_02045F88:
	add sp, sp, #0x194
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_02045A5C_OFFSET 0x2CF4
#else
#define SUB_02045A5C_OFFSET 0
#endif
_02045F90: .word _020AFED4
_02045F94: .word 0x000002CD + SUB_02045A5C_OFFSET
_02045F98: .word 0x000002D5 + SUB_02045A5C_OFFSET
_02045F9C: .word 0x000002CE + SUB_02045A5C_OFFSET
_02045FA0: .word _0209CC0C
_02045FA4: .word 0x000002CF + SUB_02045A5C_OFFSET
_02045FA8: .word _0209CC38
_02045FAC: .word 0x00300011
#ifdef JAPAN
_02046318: .word 0x00002FC5
#endif
_02045FB0: .word 0x00300033
_02045FB4: .word _0209CC48
_02045FB8: .word 0x00001013
#ifdef JAPAN
_02045FBC: .word 0x00001D3C
#else
_02045FBC: .word 0x000008E4
#endif
_02045FC0: .word _0209CC28
_02045FC4: .word 0x000002D6 + SUB_02045A5C_OFFSET
_02045FC8: .word _0209CC18
_02045FCC: .word _0209CC60
#ifdef JAPAN
_0204633C: .word 0x00002FC4
#endif
	arm_func_end sub_02045A5C

	arm_func_start sub_02045FD0
sub_02045FD0: ; 0x02045FD0
	stmdb sp!, {r3, lr}
	ldr r2, _02046024 ; =_020AFED4
	ldr r1, [r2]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #4]
	ldmeqia sp!, {r3, pc}
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x88]
	strh r1, [r0, #4]
	ldr r1, [r2]
	ldr r1, [r1, #0x38c]
	strh r1, [r0, #2]
	bl sub_020440B8
	ldr r0, _02046024 ; =_020AFED4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02046024 ; =_020AFED4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046024: .word _020AFED4
	arm_func_end sub_02045FD0

	arm_func_start sub_02046028
sub_02046028: ; 0x02046028
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020465D8 ; =_020AFED4
	ldr r2, [r0]
	ldr r1, [r2, #0x18]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _020465CC
_02046048: ; jump table
	b _02046058 ; case 0
	b _02046064 ; case 1
	b _02046590 ; case 2
	b _020465C4 ; case 3
_02046058:
	mov r0, #1
	str r0, [r2, #0x18]
	b _020465CC
_02046064:
	ldr r1, [r2, #4]
	cmp r1, #0x12
	addls pc, pc, r1, lsl #2
	b _0204650C
_02046074: ; jump table
	b _0204650C ; case 0
	b _0204650C ; case 1
	b _020460C0 ; case 2
	b _020464B4 ; case 3
	b _020464BC ; case 4
	b _020464C4 ; case 5
	b _0204650C ; case 6
	b _02046168 ; case 7
	b _0204650C ; case 8
	b _0204650C ; case 9
	b _020461BC ; case 10
	b _020461BC ; case 11
	b _02046334 ; case 12
	b _02046364 ; case 13
	b _020463B4 ; case 14
	b _02046478 ; case 15
	b _0204650C ; case 16
	b _02046114 ; case 17
	b _020464CC ; case 18
_020460C0:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _020465D8 ; =_020AFED4
	ldrne r1, [r1]
	strne r0, [r1, #0x10]
	cmp r0, #1
	beq _02046104
	cmp r0, #2
	beq _020460F4
	cmp r0, #3
	beq _02046104
	b _0204653C
_020460F4:
	bl sub_020465DC
	mov r0, #0x13
	bl sub_020454E0
	b _0204653C
_02046104:
	bl sub_020465DC
	mov r0, #6
	bl sub_020454E0
	b _0204653C
_02046114:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _020465D8 ; =_020AFED4
	ldrne r1, [r1]
	strne r0, [r1, #0x10]
	cmp r0, #1
	beq _02046158
	cmp r0, #2
	beq _02046148
	cmp r0, #3
	beq _02046158
	b _0204653C
_02046148:
	bl sub_020465DC
	mov r0, #8
	bl sub_020454E0
	b _0204653C
_02046158:
	bl sub_020465DC
	mov r0, #0x13
	bl sub_020454E0
	b _0204653C
_02046168:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _020465D8 ; =_020AFED4
	ldrne r1, [r1]
	strne r0, [r1, #0x10]
	cmp r0, #1
	beq _020461AC
	cmp r0, #2
	beq _0204619C
	cmp r0, #3
	beq _020461AC
	b _0204653C
_0204619C:
	bl sub_020465DC
	mov r0, #9
	bl sub_020454E0
	b _0204653C
_020461AC:
	bl sub_020465DC
	mov r0, #0
	bl sub_020454E0
	b _0204653C
_020461BC:
	bl sub_02043468
	mov r4, r0
	bl sub_02043400
	cmp r0, #0
	bne _02046234
	mvn r0, #0
	cmp r4, r0
	bne _02046214
	bl sub_0204317C
	ldr r0, _020465D8 ; =_020AFED4
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_02046214:
	ldr r1, _020465D8 ; =_020AFED4
	mov r0, r4
	ldr r1, [r1]
	str r4, [r1]
	bl sub_0204323C
	mov r0, #0xe
	bl sub_020454E0
	b _0204653C
_02046234:
	bl sub_02043434
	cmp r0, #0
	beq _0204653C
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _020462F4
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r1, _020465D8 ; =_020AFED4
	mov r0, r4
	ldr r1, [r1]
	str r4, [r1]
	bl sub_0204323C
	ldr r0, _020465D8 ; =_020AFED4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _020465D8 ; =_020AFED4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r1, _020465D8 ; =_020AFED4
	ldr r1, [r1]
	str r0, [r1, #0x38c]
	bl sub_020465DC
	bl sub_0204317C
	ldr r0, _020465D8 ; =_020AFED4
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #0xf
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
_020462F4:
	bl CountNbOfItemsInStorage
	mov r4, r0
	bl sub_0200FD48
	cmp r4, r0
	bge _0204653C
	bl sub_02043398
	ldr r0, _020465D8 ; =_020AFED4
	mov r3, #0xa
	ldr r1, [r0]
	mov r2, #5
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_02046334:
	mvn r1, #1
	strb r1, [r2, #0x15]
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	sub r1, r2, #1
	str r1, [r3, #0xc]
	cmp r2, #0
	bne _0204653C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_020454E0
	b _0204653C
_02046364:
	ldr r1, [r2, #0xc]
	sub r1, r1, #1
	str r1, [r2, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bgt _02046394
	bl sub_0204317C
	ldr r0, _020465D8 ; =_020AFED4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x15]
_02046394:
	ldr r0, _020465D8 ; =_020AFED4
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bgt _0204653C
	ldr r0, [r1, #8]
	bl sub_020454E0
	b _0204653C
_020463B4:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0204653C
_020463C8: ; jump table
	b _0204653C ; case 0
	b _0204645C ; case 1
	b _0204653C ; case 2
	b _0204653C ; case 3
	b _020463E4 ; case 4
	b _02046420 ; case 5
	b _0204645C ; case 6
_020463E4:
	bl sub_020465DC
	bl sub_0204317C
	ldr r0, _020465D8 ; =_020AFED4
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #0x10
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_02046420:
	bl sub_020465DC
	bl sub_0204317C
	ldr r0, _020465D8 ; =_020AFED4
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #0xf
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_0204645C:
	bl sub_020465DC
	bl sub_020433C0
	ldr r0, _020465D8 ; =_020AFED4
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0204653C
_02046478:
	ldrsb r0, [r2, #0x17]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0204653C
	ldr r0, _020465D8 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x17]
	bl CloseScrollBox
	ldr r0, _020465D8 ; =_020AFED4
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xb
	strb r2, [r1, #0x17]
	bl sub_020454E0
	b _0204653C
_020464B4:
	mov r2, #2
	b _02046540
_020464BC:
	mov r2, #4
	b _02046540
_020464C4:
	mov r2, #3
	b _02046540
_020464CC:
	ldrsb r0, [r2, #0x14]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0204653C
	ldr r0, _020465D8 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _020465D8 ; =_020AFED4
	mov r2, #0x14
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl sub_0202F2C4
	b _0204653C
_0204650C:
	ldrsb r0, [r2, #0x14]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0204653C
	ldr r0, _020465D8 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _020465D8 ; =_020AFED4
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_020454E0
_0204653C:
	mov r2, #1
_02046540:
	ldr r0, _020465D8 ; =_020AFED4
	ldr r1, [r0]
	str r2, [r1, #0x6c]
	ldr r2, [r0]
	ldr r1, [r2, #0x6c]
	cmp r1, #1
	beq _020465CC
	mov r1, #2
	str r1, [r2, #0x18]
	ldr r0, [r0]
	sub r1, r1, #4
	ldrsb r0, [r0, #0x14]
	cmp r0, r1
	beq _020465CC
	bl sub_0202836C
	ldr r0, _020465D8 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl sub_0202F2C4
	b _020465CC
_02046590:
	mov r1, #3
	str r1, [r2, #0x18]
	ldr r0, [r0]
	sub r1, r1, #5
	ldrsb r0, [r0, #0x14]
	cmp r0, r1
	beq _020465CC
	bl CloseDialogueBox
	ldr r0, _020465D8 ; =_020AFED4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _020465CC
_020465C4:
	ldr r0, [r2, #0x6c]
	b _020465D0
_020465CC:
	mov r0, #1
_020465D0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020465D8: .word _020AFED4
	arm_func_end sub_02046028

	arm_func_start sub_020465DC
sub_020465DC: ; 0x020465DC
	stmdb sp!, {r3, lr}
	ldr r0, _02046620 ; =_020AFED4
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02046620 ; =_020AFED4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	bl CloseSimpleMenu
	ldr r0, _02046620 ; =_020AFED4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x16]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046620: .word _020AFED4
	arm_func_end sub_020465DC

	arm_func_start sub_02046624
sub_02046624: ; 0x02046624
	stmdb sp!, {r3, lr}
	ldr r1, _02046658 ; =_020AFED4
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x14]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02046658 ; =_020AFED4
	ldr r1, [r1]
	strb r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046658: .word _020AFED4
	arm_func_end sub_02046624

	arm_func_start sub_0204665C
sub_0204665C: ; 0x0204665C
	stmdb sp!, {r3, lr}
	ldr r0, _02046694 ; =_020AFED8
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseAdvancedTextBox
	ldr r0, _02046694 ; =_020AFED8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02046694 ; =_020AFED8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046694: .word _020AFED8
	arm_func_end sub_0204665C

	arm_func_start sub_02046698
sub_02046698: ; 0x02046698
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xa0
	mov r4, r0
	mov r0, #0xec
	mov r1, #0
	bl MemAlloc
	ldr r2, _0204672C ; =_020AFED8
	mov r1, #0xec
	str r0, [r2]
	bl MemZero
	ldr r0, _0204672C ; =_020AFED8
	mov ip, #0xe
	ldr r0, [r0]
	add lr, r0, #4
_020466D0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _020466D0
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	ldr r1, _02046730 ; =0x00000A43
	mov r0, #0x10
	strh r1, [sp, #0x10]
	str r0, [sp, #0x14]
	mov ip, #0
	str ip, [sp]
	ldr r0, _02046734 ; =_0209CC80
	ldr r1, _02046738 ; =0x00001815
	ldr r3, _0204673C ; =sub_02046798
	add r2, sp, #8
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _0204672C ; =_020AFED8
	ldr r1, [r1]
	strb r0, [r1]
	add sp, sp, #0xa0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204672C: .word _020AFED8
#ifdef JAPAN
_02046730: .word 0x00000B8A
#else
_02046730: .word 0x00000A43
#endif
_02046734: .word _0209CC80
_02046738: .word 0x00001815
_0204673C: .word sub_02046798
	arm_func_end sub_02046698

	arm_func_start sub_02046740
sub_02046740: ; 0x02046740
	stmdb sp!, {r3, lr}
	ldr r1, _02046774 ; =_020AFED8
	ldr r0, _02046778 ; =0x00000279
	ldr r1, [r1]
	ldrsh r1, [r1, #0x5e]
	cmp r1, r0
	blt _02046768
	mov r0, #0x14
	bl PlayBgmByIdVeneer
	ldmia sp!, {r3, pc}
_02046768:
	mov r0, #0x13
	bl PlayBgmByIdVeneer
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046774: .word _020AFED8
_02046778: .word 0x00000279
	arm_func_end sub_02046740

	arm_func_start sub_0204677C
sub_0204677C: ; 0x0204677C
	ldr r0, _02046790 ; =_020AFED8
	ldr ip, _02046794 ; =IsAdvancedTextBoxActive
	ldr r0, [r0]
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02046790: .word _020AFED8
_02046794: .word IsAdvancedTextBoxActive
	arm_func_end sub_0204677C

	arm_func_start sub_02046798
sub_02046798: ; 0x02046798
	ldr r1, _020467AC ; =_020AFED8
	ldr ip, _020467B0 ; =sub_0200C5DC
	ldr r1, [r1]
	add r1, r1, #4
	bx ip
	.align 2, 0
_020467AC: .word _020AFED8
_020467B0: .word sub_0200C5DC
	arm_func_end sub_02046798

	arm_func_start sub_020467B4
sub_020467B4: ; 0x020467B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _020467E8
	add r0, sp, #0
	bl GetReleasedStylus
	add r0, sp, #0
	mov r2, r4
	mov r1, #2
	bl sub_02006C8C
_020467E8:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020467B4

	arm_func_start sub_020467F0
sub_020467F0: ; 0x020467F0
	ldr ip, _020467FC ; =sub_020467B4
	ldr r0, _02046800 ; =_0209CC90
	bx ip
	.align 2, 0
_020467FC: .word sub_020467B4
_02046800: .word _0209CC90
	arm_func_end sub_020467F0

	arm_func_start sub_02046804
sub_02046804: ; 0x02046804
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02046824 ; =_0209CCA0
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _02046828 ; =_022AAE64
	strneh r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02046824: .word _0209CCA0
_02046828: .word _022AAE64
	arm_func_end sub_02046804

	arm_func_start sub_0204682C
sub_0204682C: ; 0x0204682C
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02046890 ; =_020AFEDC
	str r0, [r1]
	add r0, r0, #0x10
	bl CopyMenuControlWindowExtraInfo
	ldr r2, _02046890 ; =_020AFEDC
	ldr r1, _02046894 ; =_022AAE64
	ldr r3, [r2]
	str r0, [r3, #0xc]
	ldrh r3, [r1]
	ldr r1, [r2]
	mov r0, #0
	strh r3, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _02046890 ; =_020AFEDC
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046890: .word _020AFEDC
_02046894: .word _022AAE64
	arm_func_end sub_0204682C

	arm_func_start sub_02046898
sub_02046898: ; 0x02046898
	stmdb sp!, {r3, lr}
	ldr r0, _020468D0 ; =_020AFEDC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _020468D0 ; =_020AFEDC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _020468D0 ; =_020AFEDC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020468D0: .word _020AFEDC
	arm_func_end sub_02046898

	arm_func_start sub_020468D4
sub_020468D4: ; 0x020468D4
	stmdb sp!, {r3, lr}
	ldr r0, _020469B4 ; =_020AFEDC
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _020469AC
_020468F0: ; jump table
	b _02046900 ; case 0
	b _02046928 ; case 1
	b _0204695C ; case 2
	b _0204697C ; case 3
_02046900:
	ldrsb r0, [r2]
	ldrh r2, [r2, #8]
	ldr r1, _020469B8 ; =0x00000618
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _020469B4 ; =_020AFEDC
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _020469AC
_02046928:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _020469AC
	ldr r0, _020469B4 ; =_020AFEDC
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _020469B4 ; =_020AFEDC
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _020469AC
_0204695C:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _020469B4 ; =_020AFEDC
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _020469AC
_0204697C:
	mov r1, #4
	str r1, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	tst r0, #0x100
	beq _020469A4
	ldr r0, [r1, #0x98]
	ldr r2, [r1, #0x94]
	mov r1, #0
	blx r2
_020469A4:
	mov r0, #4
	ldmia sp!, {r3, pc}
_020469AC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020469B4: .word _020AFEDC
_020469B8: .word 0x00000618
	arm_func_end sub_020468D4

	arm_func_start sub_020469BC
sub_020469BC: ; 0x020469BC
	stmdb sp!, {r3, lr}
	mov r0, #0x2c
	mov r1, #8
	bl MemAlloc
	ldr r2, _020469E4 ; =_020AFEE0
	mov r1, #0x2c
	str r0, [r2]
	bl MemZero
	bl sub_020471AC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020469E4: .word _020AFEE0
	arm_func_end sub_020469BC

	arm_func_start sub_020469E8
sub_020469E8: ; 0x020469E8
	stmdb sp!, {r3, lr}
	ldr r0, _02046A1C ; =_020AFEE0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020471E8
	ldr r0, _02046A1C ; =_020AFEE0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02046A1C ; =_020AFEE0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046A1C: .word _020AFEE0
	arm_func_end sub_020469E8

	arm_func_start sub_02046A20
sub_02046A20: ; 0x02046A20
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r4, _02046A98 ; =_020AFEE0
	mov r6, r1
	ldr r4, [r4]
	mov r7, r0
	mov r0, r4
	mov r1, #0x2c
	mov r5, r2
	mov r8, r3
	bl MemZero
	ldr r0, [sp, #0x28]
	str r8, [sp]
	ldrh r1, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r1, [sp, #8]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r0, [sp, #0xc]
	add r0, r4, #0x10
	bl sub_02046D50
	mov r0, #1
	str r0, [r4, #0x14]
	str r5, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x28]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02046A98: .word _020AFEE0
	arm_func_end sub_02046A20

	arm_func_start sub_02046A9C
sub_02046A9C: ; 0x02046A9C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xa4
	mov r7, r0
	mov r6, r1
	add r0, sp, #0xc
	mov r1, #0x98
	mov r5, r2
	mov r4, r3
	bl MemZero
	ldrsb r0, [sp, #0xb8]
	add r3, sp, #0xc
	mov r1, r6
	cmp r0, #0
	addge r0, r5, r0, lsl #3
	ldrge r0, [r0, #4]
	mov ip, #0
	movlt r0, #0
	str r0, [sp, #0xc]
	str r5, [sp]
	str r4, [sp, #4]
	mov r0, r7
	mov r2, #0x33
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_02046A9C

	arm_func_start sub_02046B04
sub_02046B04: ; 0x02046B04
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02046B9C ; =_020AFEE0
	ldr r5, [r0]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _02046B94
	cmp r0, #1
	beq _02046B30
	cmp r0, #9
	beq _02046B64
	b _02046B94
_02046B30:
	ldr r0, [r5, #0x10]
	bl sub_02046F40
	ldr r0, [r5, #0x10]
	bl sub_02047030
	mov r4, r0
	ldr r0, [r5, #0x10]
	bl sub_02047038
	mvn r1, #0
	str r0, [r5, #0x28]
	cmp r4, r1
	movne r0, #9
	strne r0, [r5, #0x14]
	b _02046B94
_02046B64:
	ldr r0, [r5, #0x10]
	bl sub_02047030
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x24]
	tst r0, #0x400000
	bne _02046B8C
	add r0, r5, #0x10
	bl sub_02047040
	mov r0, #0
	str r0, [r5, #0x14]
_02046B8C:
	ldr r0, [r5, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
_02046B94:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02046B9C: .word _020AFEE0
	arm_func_end sub_02046B04

	arm_func_start sub_02046BA0
sub_02046BA0: ; 0x02046BA0
	ldr r0, _02046BB0 ; =_020AFEE0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_02046BB0: .word _020AFEE0
	arm_func_end sub_02046BA0

	arm_func_start sub_02046BB4
sub_02046BB4: ; 0x02046BB4
	stmdb sp!, {r4, lr}
	ldr r0, _02046BE4 ; =_020AFEE0
	ldr r4, [r0]
	add r0, r4, #0x10
	bl sub_02047040
	mov r1, #0
	ldr r0, _02046BE4 ; =_020AFEE0
	str r1, [r4, #0x14]
	ldr r0, [r0]
	sub r1, r1, #2
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02046BE4: .word _020AFEE0
	arm_func_end sub_02046BB4

	arm_func_start sub_02046BE8
sub_02046BE8: ; 0x02046BE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02046C2C ; =_020AFEE0
	mov r6, r1
	ldr r4, [r3]
	mov r7, r0
	mov r5, r2
	mov r0, r4
	mov r1, #0x2c
	bl MemZero
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_020472A4
	mov r0, #1
	str r0, [r4, #0x14]
	strh r7, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02046C2C: .word _020AFEE0
	arm_func_end sub_02046BE8

	arm_func_start sub_02046C30
sub_02046C30: ; 0x02046C30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02046C74 ; =_020AFEE0
	mov r6, r1
	ldr r4, [r3]
	mov r7, r0
	mov r5, r2
	mov r0, r4
	mov r1, #0x2c
	bl MemZero
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_02047358
	mov r0, #1
	str r0, [r4, #0x14]
	strh r7, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02046C74: .word _020AFEE0
	arm_func_end sub_02046C30

	arm_func_start sub_02046C78
sub_02046C78: ; 0x02046C78
	stmdb sp!, {r4, lr}
	ldr r0, _02046D1C ; =_020AFEE0
	ldr r4, [r0]
	ldr r0, [r4, #0x14]
	cmp r0, #9
	bgt _02046CB4
	bge _02046CF0
	cmp r0, #1
	bgt _02046D14
	cmp r0, #0
	blt _02046D14
	beq _02046D14
	cmp r0, #1
	beq _02046CC0
	b _02046D14
_02046CB4:
	cmp r0, #0xa
	beq _02046D00
	b _02046D14
_02046CC0:
	bl sub_020473FC
	cmp r0, #2
	bne _02046D14
	ldrh r0, [r4, #0x18]
	tst r0, #0x400
	movne r0, #0xa
	strne r0, [r4, #0x14]
	movne r0, #0x3c
	strne r0, [r4, #0x1c]
	moveq r0, #9
	streq r0, [r4, #0x14]
	b _02046D14
_02046CF0:
	mov r0, #0
	str r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_02046D00:
	ldr r0, [r4, #0x1c]
	subs r0, r0, #1
	str r0, [r4, #0x1c]
	movmi r0, #9
	strmi r0, [r4, #0x14]
_02046D14:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02046D1C: .word _020AFEE0
	arm_func_end sub_02046C78

	arm_func_start sub_02046D20
sub_02046D20: ; 0x02046D20
	ldr ip, _02046D28 ; =sub_020473A4
	bx ip
	.align 2, 0
_02046D28: .word sub_020473A4
	arm_func_end sub_02046D20

	arm_func_start sub_02046D2C
sub_02046D2C: ; 0x02046D2C
	ldr r1, _02046D40 ; =_020AFEE0
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_02046D40: .word _020AFEE0
	arm_func_end sub_02046D2C

	arm_func_start sub_02046D44
sub_02046D44: ; 0x02046D44
	ldr ip, _02046D4C ; =sub_020474B8
	bx ip
	.align 2, 0
_02046D4C: .word sub_020474B8
	arm_func_end sub_02046D44

	arm_func_start sub_02046D50
sub_02046D50: ; 0x02046D50
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x410
	mov r4, r0
	mov r5, r1
	mov r0, #0xcc
	mov r1, #8
	mov sb, r2
	mov r8, r3
	ldr r7, [sp, #0x434]
	bl MemAlloc
	mov r1, #0xcc
	mov r6, r0
	str r0, [r4]
	bl MemZero
	cmp r5, #0
	bne _02046E48
	mov r5, #0
	sub r0, r5, #1
	str r5, [sp]
	strb r0, [sp, #9]
	cmp r7, #0
	beq _02046E54
	mov r4, r5
	add sl, sp, #0x10
	b _02046DE0
_02046DB4:
	mov r0, r4, lsl #3
	ldrh r1, [r7, r0]
	cmp r1, #0
	beq _02046DE8
	mov r0, sl
	bl GetStringFromFileVeneer
	mov r0, sl
	bl sub_020265A8
	cmp r0, r5
	movgt r5, r0
	add r4, r4, #1
_02046DE0:
	cmp r4, #0x64
	blt _02046DB4
_02046DE8:
	mov r0, #0xe
	mul r1, r4, r0
	add r3, r5, #7
	mov r0, r3, asr #2
	add r2, r1, #7
	add r0, r3, r0, lsr #29
	mov r0, r0, asr #3
	add r3, r0, #2
	mov r1, r2, asr #2
	add r0, r2, r1, lsr #29
	mov r5, r0, asr #3
	rsb r4, r3, #0x1e
	rsb r2, r5, #0xf
	mov r1, #0
	strb r4, [sp, #4]
	add r0, sp, #0
	strb r5, [sp, #7]
	add r4, r6, #4
	strb r2, [sp, #5]
	strb r3, [sp, #6]
	str r1, [sp, #0xc]
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	b _02046E54
_02046E48:
	add r4, r6, #4
	ldmia r5, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
_02046E54:
	add r0, sp, #0x420
	ldrh r1, [r0, #0x18]
	ldr ip, [sp, #0x430]
	ldr r0, [sp, #0x43c]
	strh r1, [r6, #0x20]
	strh sb, [r6, #0x22]
	str r0, [r6, #0x24]
	str r7, [r6, #0x1c]
	mvn r0, #0
	str r0, [r6, #0x14]
	str r8, [r6, #0x28]
	mov r0, #0
	str r0, [r6, #0x18]
	cmp ip, #0
	streqb r0, [r6, #0xc4]
	beq _02046EBC
	add r5, r6, #0x2c
	mov r4, #9
_02046E9C:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02046E9C
	ldmia ip, {r0, r1}
	stmia r5, {r0, r1}
	mov r0, #1
	strb r0, [r6, #0xc4]
_02046EBC:
	mvn r0, #1
	strb r0, [r6]
	ldrh r0, [r6, #0x20]
	cmp r0, #0
	moveq r0, #0
	beq _02046EF8
	bl sub_020473FC
	cmp r0, #1
	bne _02046EE4
	bl sub_02047220
_02046EE4:
	ldrh r0, [r6, #0x22]
	ldrh r1, [r6, #0x20]
	ldr r2, [r6, #0x24]
	bl sub_02047244
	mov r0, #1
_02046EF8:
	cmp r0, #0
	bne _02046F2C
	ldrb r0, [r6, #0xc4]
	ldr r1, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	cmp r0, #0
	addne r2, r6, #0x2c
	moveq r2, #0
	add r0, r6, #4
	bl CreateParentMenuFromStringIds
	strb r0, [r6]
	mov r0, #1
	b _02046F30
_02046F2C:
	mov r0, #6
_02046F30:
	str r0, [r6, #0xc8]
	mov r0, #1
	add sp, sp, #0x410
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02046D50

	arm_func_start sub_02046F40
sub_02046F40: ; 0x02046F40
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #0xc8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_02046F58: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _02046FBC ; case 1
	ldmia sp!, {r3, r4, r5, pc} ; case 2
	ldmia sp!, {r3, r4, r5, pc} ; case 3
	ldmia sp!, {r3, r4, r5, pc} ; case 4
	ldmia sp!, {r3, r4, r5, pc} ; case 5
	b _02046F80 ; case 6
	ldmia sp!, {r3, r4, r5, pc} ; case 7
	ldmia sp!, {r3, r4, r5, pc} ; case 8
	b _02047024 ; case 9
_02046F80:
	bl sub_020473FC
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xc4]
	ldr r1, [r4, #0x28]
	ldr r3, [r4, #0x1c]
	cmp r0, #0
	addne r2, r4, #0x2c
	moveq r2, #0
	add r0, r4, #4
	bl CreateParentMenuFromStringIds
	strb r0, [r4]
	mov r0, #1
	str r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
_02046FBC:
	ldrsb r0, [r4]
	bl sub_020282F4
	mov r5, r0
	ldrsb r0, [r4]
	bl GetWindowIdSelectedItemOnPage
	str r0, [r4, #0x18]
	ldrsb r0, [r4]
	bl IsParentMenuActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mvn r1, #3
	cmp r5, r1
	bne _02047008
	ldrsb r0, [r4]
	bl GetSimpleMenuResult__0202AEA4
	str r0, [r4, #0x14]
	mov r0, #9
	str r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
_02047008:
	sub r0, r1, #1
	cmp r5, r0
	addeq r0, r1, #2
	streq r0, [r4, #0x14]
	moveq r0, #9
	streq r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
_02047024:
	mov r0, #0xa
	str r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02046F40

	arm_func_start sub_02047030
sub_02047030: ; 0x02047030
	ldr r0, [r0, #0x14]
	bx lr
	arm_func_end sub_02047030

	arm_func_start sub_02047038
sub_02047038: ; 0x02047038
	ldr r0, [r0, #0x18]
	bx lr
	arm_func_end sub_02047038

	arm_func_start sub_02047040
sub_02047040: ; 0x02047040
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r4]
	mvn r1, #1
	cmp r0, r1
	beq _02047068
	bl CloseParentMenu
_02047068:
	mov r0, r4
	bl MemFree
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02047040

	arm_func_start sub_0204707C
sub_0204707C: ; 0x0204707C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0xc
	mov r1, #8
	mov r5, r2
	bl MemAlloc
	mov r1, #0xc
	mov r4, r0
	str r0, [r7]
	bl MemZero
	mov r0, r6
	mov r1, r5
	bl CreateTextBox
	strb r0, [r4]
	mov r0, #3
	str r0, [r4, #8]
	sub r0, r0, #4
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204707C

	arm_func_start sub_020470D0
sub_020470D0: ; 0x020470D0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020470FC
	cmp r0, #3
	beq _02047108
	cmp r0, #4
	moveq r0, #8
	streq r0, [r4, #8]
	ldmia sp!, {r4, pc}
_020470FC:
	mov r0, #3
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
_02047108:
	ldrsb r0, [r4]
	bl sub_020282F4
	mvn r2, #3
	cmp r0, r2
	addeq r0, r2, #1
	streq r0, [r4, #4]
	moveq r0, #4
	streq r0, [r4, #8]
	ldmeqia sp!, {r4, pc}
	sub r1, r2, #1
	cmp r0, r1
	addeq r0, r2, #2
	streq r0, [r4, #4]
	moveq r0, #4
	streq r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020470D0

	arm_func_start sub_02047148
sub_02047148: ; 0x02047148
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_02047148

	arm_func_start sub_02047150
sub_02047150: ; 0x02047150
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r4]
	bl sub_0202812C
	ldrsb r0, [r4]
	bl CloseTextBox2
	mov r0, r4
	bl MemFree
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02047150

	arm_func_start sub_02047188
sub_02047188: ; 0x02047188
	stmdb sp!, {r4, lr}
	ldr r4, [r0]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldrsb r0, [r4]
	bl sub_02027B1C
	ldrsb r0, [r4]
	bl sub_0202F9B8
	ldmia sp!, {r4, pc}
	arm_func_end sub_02047188

	arm_func_start sub_020471AC
sub_020471AC: ; 0x020471AC
	stmdb sp!, {r3, lr}
	mov r0, #0x70
	mov r1, #8
	bl MemAlloc
	ldr r2, _020471E4 ; =_020AFEE4
	mov r1, #0x70
	str r0, [r2]
	bl MemZero
	ldr r0, _020471E4 ; =_020AFEE4
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020471E4: .word _020AFEE4
	arm_func_end sub_020471AC

	arm_func_start sub_020471E8
sub_020471E8: ; 0x020471E8
	stmdb sp!, {r3, lr}
	ldr r0, _0204721C ; =_020AFEE4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020473A4
	ldr r0, _0204721C ; =_020AFEE4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204721C ; =_020AFEE4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204721C: .word _020AFEE4
	arm_func_end sub_020471E8

	arm_func_start sub_02047220
sub_02047220: ; 0x02047220
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02047240 ; =_020AFEE4
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02047240: .word _020AFEE4
	arm_func_end sub_02047220

	arm_func_start sub_02047244
sub_02047244: ; 0x02047244
	stmdb sp!, {r4, lr}
	ldr r3, _020472A0 ; =_020AFEE4
	mov r4, r2
	ldr r2, [r3]
	strh r1, [r2, #0x14]
	ldr r1, [r3]
	strh r0, [r1, #0x68]
	ldr r0, [r3]
	ldrsb r0, [r0]
	bl sub_020288DC
	ldr r0, _020472A0 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDialogueBox
	ldr r0, _020472A0 ; =_020AFEE4
	mov r3, r4
	ldr r2, [r0]
	ldrsb r0, [r2]
	ldrh r1, [r2, #0x68]
	ldrh r2, [r2, #0x14]
	bl ShowStringIdInDialogueBox
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_020472A0: .word _020AFEE4
	arm_func_end sub_02047244

	arm_func_start sub_020472A4
sub_020472A4: ; 0x020472A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020473FC
	cmp r0, #1
	bne _020472D4
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _020472EC ; =_020AFEE4
	ldr r1, [r1]
	strb r0, [r1]
_020472D4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02047244
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020472EC: .word _020AFEE4
	arm_func_end sub_020472A4

	arm_func_start sub_020472F0
sub_020472F0: ; 0x020472F0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02047354 ; =_020AFEE4
	mov ip, #0
	ldr r4, [r3]
	mov r5, r1
	strh ip, [r4, #0x14]
	ldr r1, [r3]
	mov r4, r2
	strh r0, [r1, #0x68]
	ldr r0, [r3]
	ldrsb r0, [r0]
	bl sub_020288DC
	ldr r0, _02047354 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDialogueBox
	ldr r0, _02047354 ; =_020AFEE4
	mov r2, r5
	ldr r1, [r0]
	mov r3, r4
	ldrsb r0, [r1]
	ldrh r1, [r1, #0x68]
	bl ShowStringInDialogueBox
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02047354: .word _020AFEE4
	arm_func_end sub_020472F0

	arm_func_start sub_02047358
sub_02047358: ; 0x02047358
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020473FC
	cmp r0, #1
	bne _02047388
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _020473A0 ; =_020AFEE4
	ldr r1, [r1]
	strb r0, [r1]
_02047388:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020472F0
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020473A0: .word _020AFEE4
	arm_func_end sub_02047358

	arm_func_start sub_020473A4
sub_020473A4: ; 0x020473A4
	stmdb sp!, {r3, lr}
	ldr r0, _020473F8 ; =_020AFEE4
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _020473F8 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F2C4
	ldr r0, _020473F8 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _020473F8 ; =_020AFEE4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020473F8: .word _020AFEE4
	arm_func_end sub_020473A4

	arm_func_start sub_020473FC
sub_020473FC: ; 0x020473FC
	stmdb sp!, {r4, lr}
	ldr r0, _0204749C ; =_020AFEE4
	mov r4, #0
	ldr r0, [r0]
	sub r1, r4, #2
	ldrsb r0, [r0]
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #4
	bne _02047440
	ldr r0, _0204749C ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F16C
_02047440:
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02047494
_0204744C: ; jump table
	b _02047494 ; case 0
	b _02047490 ; case 1
	b _02047494 ; case 2
	b _02047494 ; case 3
	b _02047488 ; case 4
	b _02047494 ; case 5
	b _02047494 ; case 6
	b _02047494 ; case 7
	b _02047478 ; case 8
	b _02047478 ; case 9
	b _02047480 ; case 10
_02047478:
	mov r4, #4
	b _02047494
_02047480:
	mov r4, #5
	b _02047494
_02047488:
	mov r4, #3
	b _02047494
_02047490:
	mov r4, #2
_02047494:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204749C: .word _020AFEE4
	arm_func_end sub_020473FC

	arm_func_start sub_020474A0
sub_020474A0: ; 0x020474A0
	ldr r1, _020474B4 ; =_020AFEE4
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_020474B4: .word _020AFEE4
	arm_func_end sub_020474A0

	arm_func_start sub_020474B8
sub_020474B8: ; 0x020474B8
	ldr r2, _020474D8 ; =_020AFEE4
	mov r3, r0
	ldr r0, [r2]
	ldr ip, _020474DC ; =ReadStringFromDialogueBox
	mov r2, r1
	ldrsb r0, [r0]
	mov r1, r3
	bx ip
	.align 2, 0
_020474D8: .word _020AFEE4
_020474DC: .word ReadStringFromDialogueBox
	arm_func_end sub_020474B8

	arm_func_start sub_020474E0
sub_020474E0: ; 0x020474E0
	stmdb sp!, {r3, lr}
	ldr r0, _02047574 ; =_022AAE68
	ldr r2, [r0]
	cmp r2, #0
	beq _0204756C
	ldr r1, [r2, #0x10]
	cmp r1, #2
	bgt _02047520
	cmp r1, #0
	blt _0204756C
	beq _02047528
	cmp r1, #1
	beq _02047534
	cmp r1, #2
	beq _02047554
	b _0204756C
_02047520:
	cmp r1, #0xff
	b _0204756C
_02047528:
	add r0, r1, #1
	str r0, [r2, #0x10]
	b _0204756C
_02047534:
	mov r0, #0
	bl sub_02047C40
	cmp r0, #0
	ldrne r0, _02047574 ; =_022AAE68
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x10]
	b _0204756C
_02047554:
	mov r1, #1
	str r1, [r0, #4]
	mov r0, #0xff
	str r0, [r2, #0x10]
	mov r0, #4
	ldmia sp!, {r3, pc}
_0204756C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02047574: .word _022AAE68
	arm_func_end sub_020474E0

	arm_func_start sub_02047578
sub_02047578: ; 0x02047578
	stmdb sp!, {r3, lr}
	ldr r0, _020475B0 ; =_022AAE68
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl sub_02047EF4
	ldr r0, _020475B0 ; =_022AAE68
	ldr r0, [r0]
	bl MemFree
	ldr r0, _020475B0 ; =_022AAE68
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020475B0: .word _022AAE68
	arm_func_end sub_02047578

	arm_func_start sub_020475B4
sub_020475B4: ; 0x020475B4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r3, _02047658 ; =_022AAE68
	mov ip, #0
	ldr r0, _0204765C ; =_0209CCB0
	mov r5, r1
	mov r4, r2
	str ip, [r3, #4]
	bl InitMenu
	cmp r0, #0
	beq _02047650
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r2, _02047658 ; =_022AAE68
	mov r1, #0x14
	str r0, [r2]
	bl MemZero
	ldr r2, _02047658 ; =_022AAE68
	mov r1, #0
	str r1, [r2, #4]
	ldr r3, [r2]
	mov r0, r5
	str r6, [r3, #4]
	ldr r3, [r2]
	strh r1, [r3, #0xa]
	ldr r2, [r2]
	strh r5, [r2, #0xc]
	bl sub_02047760
	ldr r0, _02047658 ; =_022AAE68
	mov r2, #0
	ldr r5, [r0]
	mov r1, r4
	str r2, [sp]
	ldrsh r3, [r5, #0xc]
	ldr r0, [r5, #4]
	add r2, r5, #0xa
	bl sub_02047F38
_02047650:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02047658: .word _022AAE68
_0204765C: .word _0209CCB0
	arm_func_end sub_020475B4

	arm_func_start sub_02047660
sub_02047660: ; 0x02047660
	ldr r0, _0204766C ; =_022AAE68
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0204766C: .word _022AAE68
	arm_func_end sub_02047660

	arm_func_start sub_02047670
sub_02047670: ; 0x02047670
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x60
	mov r1, #8
	bl MemAlloc
	ldr r2, _020476E8 ; =_020AFEE8
	mov r1, #0x60
	str r0, [r2]
	bl MemZero
	ldr r0, _020476E8 ; =_020AFEE8
	ldr r0, [r0]
	bl InitPreprocessorArgs
	ldr r1, _020476E8 ; =_020AFEE8
	mov r0, r4
	ldr r2, [r1]
	mov r3, #0
	mov r1, #1
	str r3, [r2, #0x4c]
	bl sub_02047760
	ldr r1, _020476E8 ; =_020AFEE8
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	strh r3, [r2, #0x58]
	ldr r2, [r1]
	strh r4, [r2, #0x56]
	ldr r1, [r1]
	str r5, [r1, #0x50]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020476E8: .word _020AFEE8
	arm_func_end sub_02047670

	arm_func_start sub_020476EC
sub_020476EC: ; 0x020476EC
	stmdb sp!, {r3, lr}
	ldr r1, _02047718 ; =_020AFEE8
	mov r2, #1
	ldr ip, [r1]
	mov r1, r0
	str r2, [sp]
	ldrsh r3, [ip, #0x56]
	ldr r0, [ip, #0x50]
	add r2, ip, #0x58
	bl sub_02047F38
	ldmia sp!, {r3, pc}
	.align 2, 0
_02047718: .word _020AFEE8
	arm_func_end sub_020476EC

	arm_func_start sub_0204771C
sub_0204771C: ; 0x0204771C
	stmdb sp!, {r3, lr}
	ldr r0, _0204775C ; =_020AFEE8
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl sub_02047EF4
	ldr r0, _0204775C ; =_020AFEE8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204775C ; =_020AFEE8
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204775C: .word _020AFEE8
	arm_func_end sub_0204771C

	arm_func_start sub_02047760
sub_02047760: ; 0x02047760
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r2, _02047920 ; =_020AFEEC
	mov r5, r1
	ldr r1, [r2, r5, lsl #2]
	mov r6, r0
	cmp r1, #0
	movne r0, #0
	bne _02047918
	ldr r0, _02047924 ; =0x00002020
	mov r1, #8
	bl MemAlloc
	ldr r1, _02047924 ; =0x00002020
	mov r4, r0
	bl MemZero
	cmp r5, #0
	bne _02047850
	ldr r0, _02047928 ; =_0209CCC0
	add lr, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov ip, #0
	add r2, r4, #0x384
	str ip, [sp, #8]
	str r4, [sp, #0x14]
	strb ip, [sp, #0x10]
	add r0, r4, #0x1000
#ifdef JAPAN
	mov r1, #0x10
	str r1, [r0, #0xf90]
	add r0, r4, #0x1f00
	mov r1, #0x1540
#else
	mov r3, #0x10
	str r3, [r0, #0xf90]
	ldr r1, _0204792C ; =0x00000A44
	add r0, r4, #0x1f00
#endif
	strh r1, [r0, #0x8c]
	str ip, [sp]
	ldr r1, _02047930 ; =0x0040180A
	ldr r3, _02047934 ; =sub_02047AB4
	mov r0, lr
	add r2, r2, #0x1c00
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	add r1, r4, #0x100
	strb r0, [r4, #0x120]
	ldrsb r0, [r1, #0x20]
	mov r1, #1
	bl SetAdvancedTextBoxPartialMenu
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #1
	bl sub_02030AAC
	add r0, r4, #0x1f00
	mov r1, #0x14
	strh r1, [r0, #0x80]
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A90
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A74
	b _020478A0
_02047850:
	ldr r0, _02047938 ; =_0209CCD0
	add ip, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r1, #0
	mov r0, #1
	add r2, r4, #0x384
	strb r0, [sp, #0x10]
	str r1, [sp, #8]
	str r4, [sp, #0x14]
	str r1, [sp]
	ldr r3, _02047934 ; =sub_02047AB4
	mov r0, ip
	add r2, r2, #0x1c00
	str r1, [sp, #4]
	bl CreateAdvancedTextBox
	strb r0, [r4, #0x120]
	add r0, r4, #0x1f00
	mov r1, #8
	strh r1, [r0, #0x80]
_020478A0:
	add r0, r4, #0x1000
	strb r5, [r0, #0xf7c]
	add r0, r4, #0x100
	ldrsb r1, [r0, #0x20]
	mov r0, r4
	bl sub_02025E84
	mov ip, #0
	str ip, [r4, #0x11c]
	add r2, r4, #0x1f00
	strh r6, [r2, #0x72]
	strb ip, [r4, #0x128]
	ldrb r1, [sp, #0xe]
	mov r3, #0x3c
	add r0, r4, #0x2000
	mov r1, r1, lsl #3
	strh r1, [r2, #0x78]
	strb ip, [r0, #0x1c]
	add r0, r4, #0x1000
	mov r1, #0x80
	str r1, [r0, #0xf6c]
	add r0, r4, #0x12c
	add r1, r3, #0x1e00
	strh r3, [r2, #0x68]
	bl MemZero
	add r0, r4, #0x1000
	mov r2, #0
	ldr r1, _02047920 ; =_020AFEEC
	strb r2, [r0, #0xf82]
	str r4, [r1, r5, lsl #2]
	mov r0, #1
_02047918:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02047920: .word _020AFEEC
_02047924: .word 0x00002020
_02047928: .word _0209CCC0
#ifndef JAPAN
_0204792C: .word 0x00000A44
#endif
_02047930: .word 0x0040180A
_02047934: .word sub_02047AB4
_02047938: .word _0209CCD0
	arm_func_end sub_02047760

	arm_func_start sub_0204793C
sub_0204793C: ; 0x0204793C
	ldr r1, _0204795C ; =_020AFEEC
	mov r2, #0
	ldr r3, [r1, r0, lsl #2]
	mov r1, #1
	add r0, r3, #0x1f00
	strh r2, [r0, #0x70]
	strb r1, [r3, #0x128]
	bx lr
	.align 2, 0
_0204795C: .word _020AFEEC
	arm_func_end sub_0204793C

	arm_func_start sub_02047960
sub_02047960: ; 0x02047960
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02047A0C ; =_020AFEEC
	mov r5, r0
	ldr r4, [r1, r5, lsl #2]
	add r0, r4, #0x1f00
	ldrsh r1, [r0, #0x70]
	cmp r1, #0
	addle r0, r4, #0x2000
	movle r1, #1
	strleb r1, [r0, #0x1c]
	movle r2, #0
	ble _020479B0
	ldrsh r0, [r0, #0x72]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	movs r2, r0, asr #0x10
	addmi r0, r4, #0x2000
	movmi r1, #1
	strmib r1, [r0, #0x1c]
	movmi r2, #0
_020479B0:
	add r0, r4, #0x1f00
	strh r2, [r0, #0x74]
	mov r1, #0
	strb r1, [r4, #0x128]
	strh r2, [r0, #0x7e]
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	bl SetAdvancedTextBoxField0x1C2
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x2000
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A74
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A74
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02047A0C: .word _020AFEEC
	arm_func_end sub_02047960

	arm_func_start sub_02047A10
sub_02047A10: ; 0x02047A10
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _02047AB0 ; =_020AFEEC
	mov r6, r0
	ldr r4, [r4, r3, lsl #2]
	mov r5, r2
	ldrb r0, [r4, #0x128]
	cmp r0, #0
	beq _02047AA8
	add r0, r4, #0x1f00
	ldrsh r3, [r0, #0x70]
	ldrsh r2, [r0, #0x68]
	cmp r3, r2
	bge _02047AA8
	add r2, r3, r3, lsl #7
	add r2, r4, r2
	strb r1, [r2, #0x1ac]
	ldrsh r0, [r0, #0x70]
	add r2, r4, #0x12c
	mov r1, r6
	add r0, r0, r0, lsl #7
	add r0, r2, r0
	bl strcpy
	str r5, [sp]
	add r0, r4, #0x1f00
	ldrsh r1, [r0, #0x70]
	add r0, r4, #0x1000
	add r5, r4, #0x12c
	add r3, r1, r1, lsl #7
	ldr r1, [r0, #0xf6c]
	mov r2, r6
	add r0, r5, r3
	mov r3, #0x400
	bl PreprocessString
	add r0, r4, #0x1f00
	ldrsh r1, [r0, #0x70]
	add r1, r1, #1
	strh r1, [r0, #0x70]
_02047AA8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02047AB0: .word _020AFEEC
	arm_func_end sub_02047A10

	arm_func_start sub_02047AB4
sub_02047AB4: ; 0x02047AB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	bl sub_02028324
	cmp r0, #0
	moveq r1, #0
	beq _02047ADC
	cmp r0, #1
	moveq r1, #1
	bne _02047C34
_02047ADC:
	ldr r0, _02047C3C ; =_020AFEEC
	ldr r5, [r0, r1, lsl #2]
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	bl sub_02027B1C
	ldr r0, [r5, #0x11c]
	cmp r0, #2
	beq _02047B0C
	mov r0, r5
	bl sub_0202613C
	mov r0, #1
	str r0, [r5, #0x11c]
_02047B0C:
	add r4, r5, #0x1f00
	ldrsh r0, [r4, #0x70]
	ldrsh r7, [r4, #0x7e]
	cmp r7, r0
	bge _02047C34
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #4]
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r8, r1, asr #0x10
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	mov r6, #0
	add fp, r5, #0x12c
	b _02047BBC
_02047B48:
	add sb, r7, r7, lsl #7
	add r0, r5, sb
	ldrb r0, [r0, #0x1ac]
	cmp r0, #0
	beq _02047B80
	mov r0, #0x17
	str r0, [sp]
	ldrsh r1, [r4, #0x80]
	ldrsh r3, [r4, #0x78]
	mov r0, sl
	mla r1, r6, r8, r1
	sub r2, r1, #2
	mov r1, #0
	bl sub_02025D50
_02047B80:
	ldrsh r2, [r4, #0x80]
	ldr r1, [sp, #4]
	mov r0, sl
	mla r2, r6, r8, r2
	add r3, fp, sb
	bl sub_020264A4
	add r0, r7, #1
	mov r1, r0, lsl #0x10
	ldrsh r0, [r4, #0x70]
	mov r7, r1, asr #0x10
	cmp r0, r1, asr #16
	ble _02047BC8
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r6, r1, asr #0x10
_02047BBC:
	ldrsh r1, [r4, #0x72]
	cmp r6, r1
	blt _02047B48
_02047BC8:
	add r1, r5, #0x1f00
	ldrsh r2, [r1, #0x72]
	cmp r0, r2
	ble _02047C18
	sub r0, r0, r2
	sub r0, r0, #1
	ldrsh r1, [r1, #0x74]
	mov r0, r0, lsl #0x10
	cmp r1, r0, asr #16
	addeq r0, r5, #0x1000
	moveq r1, #1
	streqb r1, [r0, #0xf82]
	beq _02047C2C
	cmp r1, #0
	add r0, r5, #0x1000
	moveq r1, #2
	streqb r1, [r0, #0xf82]
	movne r1, #3
	strneb r1, [r0, #0xf82]
	b _02047C2C
_02047C18:
	add r0, r5, #0x1000
	mov r1, #0
	strb r1, [r0, #0xf82]
	strb r1, [r0, #0xf7a]
	strb r1, [r0, #0xf7b]
_02047C2C:
	mov r0, sl
	bl UpdateWindow
_02047C34:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02047C3C: .word _020AFEEC
	arm_func_end sub_02047AB4

	arm_func_start sub_02047C40
sub_02047C40: ; 0x02047C40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r1, _02047EF0 ; =_020AFEEC
	mov r6, #0
	ldr r5, [r1, r0, lsl #2]
	add r1, sp, #0
	mov r0, r6
	bl sub_020063F4
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	bl GetAdvancedTextBoxFlags2
	ldr r1, [r5, #0x11c]
	mov r4, r0
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02047EE4
_02047C80: ; jump table
	b _02047C94 ; case 0
	b _02047CAC ; case 1
	b _02047CB8 ; case 2
	b _02047EC0 ; case 3
	b _02047ECC ; case 4
_02047C94:
	mov r0, r5
	bl sub_020261D4
	cmp r0, #0
	beq _02047EE4
	mov r0, #1
	str r0, [r5, #0x11c]
_02047CAC:
	mov r0, #2
	str r0, [r5, #0x11c]
	b _02047EE4
_02047CB8:
	mov r0, r5
	bl sub_02026204
	add r1, r5, #0x1000
	ldrb r1, [r1, #0xf7c]
	mov r7, r0
	cmp r1, #1
	beq _02047EE4
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	beq _02047CF0
	ands r8, r4, #2
	beq _02047D0C
_02047CF0:
	mov r0, #1
	bl PlaySeVolumeWrapper
	mov r0, #3
	str r0, [r5, #0x11c]
	mov r0, #1
	str r0, [r5, #0x124]
	b _02047EE4
_02047D0C:
	add r0, r5, #0x1f00
	ldrsh r3, [r0, #0x72]
	ldrsh ip, [r0, #0x70]
	cmp ip, r3
	ble _02047E9C
	ldrh r0, [sp]
	tst r0, #0x40
	bne _02047D34
	tst r4, #0x40000
	beq _02047D7C
_02047D34:
	add r0, r5, #0x1f00
	ldrsh r1, [r0, #0x74]
	sub r1, r1, #1
	strh r1, [r0, #0x74]
	ldrsh r1, [r0, #0x74]
	cmp r1, #0
	bge _02047D6C
	mov r1, #0
	strh r1, [r0, #0x74]
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A74
	b _02047D74
_02047D6C:
	mov r0, #3
	bl PlaySeVolumeWrapper
_02047D74:
	mov r6, #1
	b _02047DC4
_02047D7C:
	tst r0, #0x80
	bne _02047D8C
	tst r4, #0x80000
	beq _02047DC4
_02047D8C:
	add r1, r5, #0x1f00
	ldrsh r2, [r1, #0x74]
	sub r0, ip, r3
	mov r0, r0, lsl #0x10
	add r2, r2, #1
	strh r2, [r1, #0x74]
	ldrsh r2, [r1, #0x74]
	mov r3, r0, asr #0x10
	cmp r2, r0, asr #16
	strgth r3, [r1, #0x74]
	bgt _02047DC0
	mov r0, #3
	bl PlaySeVolumeWrapper
_02047DC0:
	mov r6, #1
_02047DC4:
	add r0, r5, #0x1f00
	ldrsh r2, [r0, #0x74]
	cmp r2, #1
	blt _02047E0C
	ldrsh r1, [r0, #0x70]
	ldrsh r0, [r0, #0x72]
	sub r0, r1, r0
	cmp r2, r0
	bge _02047E0C
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A90
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A90
	b _02047E70
_02047E0C:
	cmp r2, #0
	bne _02047E38
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A74
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A90
	b _02047E70
_02047E38:
	add r0, r5, #0x1f00
	ldrsh r1, [r0, #0x70]
	ldrsh r0, [r0, #0x72]
	sub r0, r1, r0
	cmp r2, r0
	bne _02047E70
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A90
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A74
_02047E70:
	ldrb r0, [r5, #0x129]
	cmp r0, #0
	bne _02047E9C
	cmp r6, #0
	beq _02047E9C
	add r0, r5, #0x1f00
	ldrsh r2, [r0, #0x74]
	add r1, r5, #0x100
	strh r2, [r0, #0x7e]
	ldrsb r0, [r1, #0x20]
	bl SetAdvancedTextBoxField0x1C2
_02047E9C:
	cmp r8, #0
	bne _02047EAC
	cmp r7, #0x10
	bne _02047EE4
_02047EAC:
	mov r1, #3
	mov r0, #1
	str r1, [r5, #0x11c]
	bl PlaySeVolumeWrapper
	b _02047EE4
_02047EC0:
	mov r0, #4
	str r0, [r5, #0x11c]
	b _02047EE4
_02047ECC:
	mov r1, r6
	mov r0, r5
	str r1, [r5, #0x11c]
	bl sub_0202613C
	mov r0, #1
	b _02047EE8
_02047EE4:
	mov r0, #0
_02047EE8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02047EF0: .word _020AFEEC
	arm_func_end sub_02047C40

	arm_func_start sub_02047EF4
sub_02047EF4: ; 0x02047EF4
	stmdb sp!, {r4, lr}
	ldr r1, _02047F34 ; =_020AFEEC
	mov r4, r0
	ldr r0, [r1, r4, lsl #2]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x20]
	bl CloseAdvancedTextBox2
	ldr r0, _02047F34 ; =_020AFEEC
	ldr r0, [r0, r4, lsl #2]
	bl MemFree
	ldr r0, _02047F34 ; =_020AFEEC
	mov r1, #0
	str r1, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02047F34: .word _020AFEEC
	arm_func_end sub_02047EF4

	arm_func_start sub_02047F38
sub_02047F38: ; 0x02047F38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	ldr r6, [sp, #0x28]
	mov r0, sb
	mov r1, #0x3c
	mov r8, r2
	mov r7, r3
	bl _s32_div_f
	mov r1, r1, lsl #0x10
	mov r2, #0
	mov r0, r6
	strh r2, [r8]
	mov sb, r1, asr #0x10
	bl sub_0204793C
	mov r5, #0
	mov fp, #0x3c
	mov r4, #0xd4
_02047F80:
	smulbb r1, sb, r4
	ldrb r0, [sl, r1]
	add r2, sl, r1
	cmp r0, #0
	beq _02047FB4
	ldrb r1, [r2, #1]
	mov r3, r6
	add r0, r2, #3
	add r2, r2, #0x84
	bl sub_02047A10
	ldrsh r0, [r8]
	add r0, r0, #1
	strh r0, [r8]
_02047FB4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov r1, fp
	mov r0, r0, asr #0x10
	bl _s32_div_f
	add r0, r5, #1
	mov r2, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r5, r2, asr #0x10
	cmp r5, #0x3c
	mov sb, r0, asr #0x10
	blt _02047F80
	ldrsh r0, [r8]
	cmp r0, r7
	mov r0, r6
	strlth r7, [r8]
	bl sub_02047960
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02047F38

	arm_func_start sub_02047FFC
sub_02047FFC: ; 0x02047FFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x39c0
	mov r1, #0
	bl MemAlloc
	ldr r2, _02048048 ; =_020AFEF4
	mov r1, #0x39c0
	str r0, [r2]
	bl MemZero
	ldr r1, _02048048 ; =_020AFEF4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r4, [r0, #0x1bc]
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0x1b3]
	bl sub_020480CC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02048048: .word _020AFEF4
	arm_func_end sub_02047FFC

	arm_func_start sub_0204804C
sub_0204804C: ; 0x0204804C
	stmdb sp!, {r3, lr}
	ldr r0, _02048074 ; =_020AFEF4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02048074 ; =_020AFEF4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048074: .word _020AFEF4
	arm_func_end sub_0204804C

	arm_func_start sub_02048078
sub_02048078: ; 0x02048078
	ldr r1, _0204809C ; =_020AFEF4
	ldr r1, [r1]
	cmp r1, #0
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	addne r1, r1, #0x3000
	strneb r0, [r1, #0x1b3]
	bx lr
	.align 2, 0
_0204809C: .word _020AFEF4
	arm_func_end sub_02048078

	arm_func_start sub_020480A0
sub_020480A0: ; 0x020480A0
	ldr r0, _020480C8 ; =_020AFEF4
	ldr r0, [r0]
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	addne r0, r0, #0x3000
	ldrneb r0, [r0, #0x1b3]
	moveq r0, #0
	bx lr
	.align 2, 0
_020480C8: .word _020AFEF4
	arm_func_end sub_020480A0

	arm_func_start sub_020480CC
sub_020480CC: ; 0x020480CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _02048130 ; =_020AFEF4
	mov r7, #0xd4
	ldr r0, [r6]
	mov r4, #0
	add r0, r0, #0x3100
	strh r4, [r0, #0xb8]
	ldr r0, [r6]
	mov r1, #1
	add r0, r0, #0x3000
	strb r1, [r0, #0x1b0]
	mov r5, r7
_020480FC:
	mul r8, r4, r5
	ldr r0, [r6]
	mov r1, r7
	add r0, r0, r8
	bl MemZero
	ldr r0, [r6]
	add r0, r0, r8
	add r0, r0, #0x84
	bl InitPreprocessorArgs
	add r4, r4, #1
	cmp r4, #0x3c
	blt _020480FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02048130: .word _020AFEF4
	arm_func_end sub_020480CC

	arm_func_start sub_02048134
sub_02048134: ; 0x02048134
	ldr r0, _0204814C ; =_020AFEF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	strb r1, [r0, #0x1b0]
	bx lr
	.align 2, 0
_0204814C: .word _020AFEF4
	arm_func_end sub_02048134

	arm_func_start sub_02048150
sub_02048150: ; 0x02048150
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020480A0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _0204823C ; =_020AFEF4
	mov r1, #0xd4
	ldr lr, [r2]
	mov r3, #1
	add r0, lr, #0x3100
	ldrsh r0, [r0, #0xb8]
	smulbb ip, r0, r1
	strb r3, [lr, ip]
	ldr r0, [r2]
	add r1, lr, ip
	add r0, r0, ip
	strb r5, [r0, #1]
	ldr r0, [r2]
	add r2, r1, #3
	add r0, r0, ip
	strb r4, [r0, #2]
	add r1, r1, #0x82
_020481B0:
	ldrb r0, [r6]
	cmp r0, #0
	cmpne r0, #0xd
	beq _020481D0
	cmp r2, r1
	strlob r0, [r2], #1
	add r6, r6, #1
	b _020481B0
_020481D0:
	mov r3, #0
	ldr r1, _0204823C ; =_020AFEF4
	strb r3, [r2]
	ldr r0, [r1]
	add r0, r0, #0x3100
	ldrsh r2, [r0, #0xb8]
	add r2, r2, #1
	strh r2, [r0, #0xb8]
	ldr r0, [r1]
	mov r2, #1
	add r0, r0, #0x3100
	ldrsh r1, [r0, #0xb8]
	cmp r1, #0x3c
	ldr r1, _0204823C ; =_020AFEF4
	strgeh r3, [r0, #0xb8]
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0x1b0]
	ldr r1, [r1]
	add r0, r1, #0x3000
	ldrb r0, [r0, #0x1b2]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r1, #0x3100
	ldrsh r0, [r0, #0xb8]
	bl sub_020476EC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0204823C: .word _020AFEF4
	arm_func_end sub_02048150

	arm_func_start sub_02048240
sub_02048240: ; 0x02048240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _02048334 ; =_020AFEF4
	mov r1, r0
	ldr r0, [r2]
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r0, #0x31c0
	mov r8, #0
	bl strcpy
	ldr r4, _02048334 ; =_020AFEF4
	mov r7, r8
	mov r6, #0x400
	mov fp, #0x440
	mov r5, r8
_02048284:
	ldr sb, [r4]
	add r0, sb, r8
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x1c0]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r2, sb, #0x31c0
	mov r1, r6
	mov r3, fp
	str r7, [sp]
	add r0, sb, #0x35c0
	add r2, r2, r8
	bl PreprocessString
	ldr r1, [r4]
	add r8, r8, r0
	add r0, r1, r0
	add r0, r0, #0x3000
	strb r5, [r0, #0x5c0]
	ldr sl, [r4]
	add r0, sl, r8
	add r0, r0, #0x3000
	ldrb sb, [r0, #0x1c0]
	cmp sb, #0
	beq _0204831C
	add r0, sl, #0x31c0
	ldr r1, _02048338 ; =_0209CCE0
	mov r2, #3
	add r0, r0, r8
	bl strncmp
	cmp r0, #0
	bne _02048310
	ldr r0, _02048338 ; =_0209CCE0
	bl strlen
	add r8, r8, r0
	b _0204831C
_02048310:
	cmp sb, #0xd
	cmpne sb, #0xa
	addeq r8, r8, #1
_0204831C:
	mov r1, #0
	mov r2, r1
	add r0, sl, #0x35c0
	bl sub_02048150
	b _02048284
_02048330:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02048334: .word _020AFEF4
_02048338: .word _0209CCE0
	arm_func_end sub_02048240

	arm_func_start sub_0204833C
sub_0204833C: ; 0x0204833C
	ldr r0, _02048358 ; =_020AFEF4
	ldr ip, _0204835C ; =sub_020475B4
	ldr r0, [r0]
	mov r1, #9
	add r2, r0, #0x3100
	ldrsh r2, [r2, #0xb8]
	bx ip
	.align 2, 0
_02048358: .word _020AFEF4
_0204835C: .word sub_020475B4
	arm_func_end sub_0204833C

	arm_func_start sub_02048360
sub_02048360: ; 0x02048360
	stmdb sp!, {r3, lr}
	bl sub_02047660
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r0, #2
	moveq r0, #2
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048360

	arm_func_start sub_02048384
sub_02048384: ; 0x02048384
	stmdb sp!, {r3, lr}
	ldr r0, _020483B4 ; =_020AFEF4
	mov r1, #0xb
	ldr r0, [r0]
	bl sub_02047670
	cmp r0, #0
	ldrne r1, _020483B4 ; =_020AFEF4
	movne r2, #1
	ldrne r1, [r1]
	addne r1, r1, #0x3000
	strneb r2, [r1, #0x1b2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020483B4: .word _020AFEF4
	arm_func_end sub_02048384

	arm_func_start sub_020483B8
sub_020483B8: ; 0x020483B8
	ldr r0, _020483D0 ; =_020AFEF4
	ldr ip, _020483D4 ; =sub_020476EC
	ldr r0, [r0]
	add r0, r0, #0x3100
	ldrsh r0, [r0, #0xb8]
	bx ip
	.align 2, 0
_020483D0: .word _020AFEF4
_020483D4: .word sub_020476EC
	arm_func_end sub_020483B8

	arm_func_start sub_020483D8
sub_020483D8: ; 0x020483D8
	stmdb sp!, {r3, lr}
	bl sub_0204771C
	cmp r0, #0
	ldrne r1, _020483FC ; =_020AFEF4
	movne r2, #0
	ldrne r1, [r1]
	addne r1, r1, #0x3000
	strneb r2, [r1, #0x1b2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020483FC: .word _020AFEF4
	arm_func_end sub_020483D8

	arm_func_start sub_02048400
sub_02048400: ; 0x02048400
	ldr r0, _0204841C ; =_020AFEF4
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0204841C: .word _020AFEF4
	arm_func_end sub_02048400

	arm_func_start sub_02048420
sub_02048420: ; 0x02048420
	stmdb sp!, {r3, lr}
	bl DebugPrintEventFlagSize
	bl sub_02048B74
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048420

	arm_func_start sub_02048430
sub_02048430: ; 0x02048430
	stmdb sp!, {r3, lr}
	bl sub_0206637C
	mov r0, #0
	bl sub_02048C0C
	mvn r0, #0
	bl sub_02048C4C
	bl sub_0204F9B8
	bl sub_02048B48
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048430

	arm_func_start sub_02048454
sub_02048454: ; 0x02048454
	stmdb sp!, {r3, lr}
	bl ClearAdventureLogStruct
	bl sub_0206637C
	mov r0, #0
	bl sub_02048C0C
	mvn r0, #0
	bl sub_02048C4C
	bl sub_0204F9B8
	bl sub_02048B48
	bl sub_02048C5C
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048454

	arm_func_start sub_02048480
sub_02048480: ; 0x02048480
	stmdb sp!, {r3, lr}
	bl sub_02048C3C
	mvn r1, #0
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048480

	arm_func_start GetNotifyNote
GetNotifyNote: ; 0x020484A0
	ldr r0, _020484AC ; =NOTIFY_NOTE
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_020484AC: .word NOTIFY_NOTE
	arm_func_end GetNotifyNote

	arm_func_start SetNotifyNote
SetNotifyNote: ; 0x020484B0
	ldr r1, _020484BC ; =NOTIFY_NOTE
	strb r0, [r1]
	bx lr
	.align 2, 0
_020484BC: .word NOTIFY_NOTE
	arm_func_end SetNotifyNote

	arm_func_start sub_020484C0
sub_020484C0: ; 0x020484C0
	stmdb sp!, {r3, lr}
	bl sub_0206637C
	mov r0, #0
	bl sub_02048C0C
	mvn r0, #0
	bl sub_02048C4C
	bl sub_0204F9B8
	bl sub_02048B48
	bl sub_02048C5C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020484C0

	arm_func_start InitSpecialEpisodeHero
InitSpecialEpisodeHero: ; 0x020484E8
	stmdb sp!, {r4, lr}
	bl GetSpecialEpisodeType
	mov r4, r0
	bl sub_02052CD8
	bl sub_0200CAD4
	bl sub_0204CDB8
	mov r0, r4
	mov r1, #1
	bl SetSpecialEpisodeOpenOld
	cmp r4, #4
	addls pc, pc, r4, lsl #2
	b _02048578
_02048518: ; jump table
	b _0204852C ; case 0
	b _0204853C ; case 1
	b _0204854C ; case 2
	b _0204855C ; case 3
	b _0204856C ; case 4
_0204852C:
	ldr r1, _020485AC ; =_020A2830
	mov r0, #2
	bl sub_02048AC4
	b _02048578
_0204853C:
	ldr r1, _020485B0 ; =_020A2808
	mov r0, #2
	bl sub_02048AC4
	b _02048578
_0204854C:
	ldr r1, _020485B4 ; =_020A2844
	mov r0, #2
	bl sub_02048AC4
	b _02048578
_0204855C:
	ldr r1, _020485B8 ; =_020A2880
	mov r0, #2
	bl sub_02048AC4
	b _02048578
_0204856C:
	ldr r1, _020485BC ; =_020A2894
	mov r0, #2
	bl sub_02048AC4
_02048578:
	mov r0, #2
	bl GetTeamMember
	mov r4, r0
	mov r0, #2
	bl GetTeamMember
	ldr r1, _020485C0 ; =FORBIDDEN_FORGOT_MOVE_LIST
	bl sub_02053628
	mov r1, r0
	mov r0, r4
	mov r2, #1
	bl sub_02053660
	bl SetTeamSetupHeroAndPartnerOnly
	ldmia sp!, {r4, pc}
	.align 2, 0
_020485AC: .word _020A2830
_020485B0: .word _020A2808
_020485B4: .word _020A2844
_020485B8: .word _020A2880
_020485BC: .word _020A2894
_020485C0: .word FORBIDDEN_FORGOT_MOVE_LIST
	arm_func_end InitSpecialEpisodeHero

	arm_func_start sub_020485C4
sub_020485C4: ; 0x020485C4
	stmdb sp!, {r3, lr}
	bl sub_02052CE8
	bl sub_0200CAE4
	bl sub_02056B58
	ldmia sp!, {r3, pc}
	arm_func_end sub_020485C4

	arm_func_start sub_020485D8
sub_020485D8: ; 0x020485D8
	stmdb sp!, {r3, lr}
	bl sub_02052CE8
	bl sub_0200CAE4
	bl sub_02056BD4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020485D8

	arm_func_start sub_020485EC
sub_020485EC: ; 0x020485EC
	stmdb sp!, {r3, lr}
	bl sub_0206637C
	mov r0, #0
	bl sub_02048C0C
	mvn r0, #0
	bl sub_02048C4C
	bl sub_0204F9B8
	bl sub_02048B48
	bl sub_02048C5C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020485EC

	arm_func_start sub_02048614
sub_02048614: ; 0x02048614
	stmdb sp!, {r3, lr}
	bl sub_02048B48
	bl InitMainTeamAfterQuiz
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048614

	arm_func_start sub_02048624
sub_02048624: ; 0x02048624
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #0
	bl SetActiveTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048624

	arm_func_start sub_02048644
sub_02048644: ; 0x02048644
	stmdb sp!, {r4, lr}
	bl GetGameMode
	mov r4, r0
	bl EventFlagResume
	cmp r4, #4
	bne _02048678
	mov r0, #2
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #2
	bl SetActiveTeam
	b _020486D8
_02048678:
	cmp r4, #5
	bne _0204869C
	mov r0, #2
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #2
	bl SetActiveTeam
	b _020486D8
_0204869C:
	cmp r4, #3
	bne _020486C0
	mov r0, #1
	bl SetActiveInventory
	mov r0, #1
	bl SetActiveKecleonShop
	mov r0, #1
	bl SetActiveTeam
	b _020486D8
_020486C0:
	mov r0, #0
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #0
	bl SetActiveTeam
_020486D8:
	cmp r4, #3
	bne _020486EC
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r4, pc}
_020486EC:
	bl GetHeroMemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _02048720
	mov r0, #0
	mov r1, #0x42
	bl LoadScriptVariableValue
	cmp r0, #5
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl SetBothScreensWindowsColor
	ldmia sp!, {r4, pc}
_02048720:
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r4, pc}
	arm_func_end sub_02048644

	arm_func_start sub_0204872C
sub_0204872C: ; 0x0204872C
	stmdb sp!, {r3, lr}
	bl EventFlagBackup
	mov r0, #2
	bl SetBothScreensWindowsColor
	mov r0, #0
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #0
	bl SetActiveTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204872C

	arm_func_start EventFlagBackupVeneer
EventFlagBackupVeneer: ; 0x02048758
	ldr ip, _02048760 ; =EventFlagBackup
	bx ip
	.align 2, 0
_02048760: .word EventFlagBackup
	arm_func_end EventFlagBackupVeneer

	arm_func_start sub_02048764
sub_02048764: ; 0x02048764
	stmdb sp!, {r4, lr}
	ldr lr, _02048790 ; =DEFAULT_HERO_ID
	mov r4, r0
	mov ip, #3
_02048774:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02048774
	ldmia lr, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	ldmia sp!, {r4, pc}
	.align 2, 0
_02048790: .word DEFAULT_HERO_ID
	arm_func_end sub_02048764

	arm_func_start sub_02048794
sub_02048794: ; 0x02048794
	stmdb sp!, {r4, lr}
	ldr lr, _020487C0 ; =DEFAULT_HERO_ID
	mov r4, r0
	mov ip, #3
_020487A4:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _020487A4
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldmia sp!, {r4, pc}
	.align 2, 0
_020487C0: .word DEFAULT_HERO_ID
	arm_func_end sub_02048794

	arm_func_start InitMainTeamAfterQuiz
InitMainTeamAfterQuiz: ; 0x020487C4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	mov r4, #0
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _020487FC
	ldr r1, _020489F8 ; =0x00000232
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r0, _020489FC ; =_020AFF00
	add r1, sp, #0
	mov r2, #0xa
	bl StrncpyName
_020487FC:
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	bne _02048828
	ldr r1, _02048A00 ; =0x00000233
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r0, _02048A04 ; =_020AFF14
	add r1, sp, #0
	mov r2, #0xa
	bl StrncpyName
_02048828:
	bl GetHeroMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02048898
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldr r3, _020489FC ; =_020AFF00
	ldrsh r1, [r0, #4]
	mov r0, #0
	mov r2, #0xd6
	bl sub_02055B78
	bl GetHero
	ldr r1, _020489F4 ; =NOTIFY_NOTE
	mov r4, r0
	ldrsh r2, [r1, #4]
	mov r0, #0
	mov r1, #0x3e
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x3f
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	mov r0, r4
	mov r1, #5
	mov r2, #0
	bl ApplyLevelUpBoostsToGroundMonster
	mov r0, r4
	bl sub_02053568
	mov r4, #1
_02048898:
	bl GetPartnerMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02048908
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldr r3, _02048A04 ; =_020AFF14
	ldrsh r1, [r0, #6]
	mov r0, #1
	mov r2, #0xd7
	bl sub_02055B78
	bl GetPartner
	ldr r1, _020489F4 ; =NOTIFY_NOTE
	mov r4, r0
	ldrsh r2, [r1, #6]
	mov r0, #0
	mov r1, #0x40
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x41
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	mov r0, r4
	mov r1, #5
	mov r2, #0
	bl ApplyLevelUpBoostsToGroundMonster
	mov r0, r4
	bl sub_02053568
	mov r4, #1
_02048908:
	cmp r4, #0
	beq _02048914
	bl SetTeamSetupHeroAndPartnerOnly
_02048914:
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldrsh r0, [r0, #4]
	cmp r0, #0
	beq _02048940
	bl GetMonsterGenderVeneer
	cmp r0, #2
	moveq r2, #5
	movne r2, #4
	mov r0, #0
	mov r1, #0x42
	bl SaveScriptVariableValue
_02048940:
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldrsh r1, [r0, #6]
	cmp r1, #0
	beq _02048980
	ldr r0, _02048A08 ; =PARTNER_TALK_KIND_TABLE
	b _02048964
_02048958:
	cmp r1, r2
	beq _02048970
	add r0, r0, #8
_02048964:
	ldrsh r2, [r0, #4]
	cmp r2, #0
	bne _02048958
_02048970:
	ldr r2, [r0]
	mov r0, #0
	mov r1, #0x43
	bl SaveScriptVariableValue
_02048980:
	ldr r1, _020489F4 ; =NOTIFY_NOTE
	mov r0, #0
	ldr r2, [r1, #0x30]
	mov r1, #0x45
	bl SaveScriptVariableValue
	mov r0, #1
	bl sub_02048C0C
	bl sub_02048C3C
	mvn r1, #0
	cmp r0, r1
	bne _020489B4
	bl Rand32Bit
	bl sub_02048C4C
_020489B4:
	bl GetGameMode
	cmp r0, #1
	bhi _020489CC
	mov r0, #2
	bl SetBothScreensWindowsColor
	b _020489EC
_020489CC:
	mov r0, #0
	mov r1, #0x42
	bl LoadScriptVariableValue
	cmp r0, #5
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl SetBothScreensWindowsColor
_020489EC:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020489F4: .word NOTIFY_NOTE
#ifdef JAPAN
_020489F8: .word 0x000004C3
_020489FC: .word _020AFF00
_02048A00: .word 0x000004C4
#else
_020489F8: .word 0x00000232
_020489FC: .word _020AFF00
_02048A00: .word 0x00000233
#endif
_02048A04: .word _020AFF14
_02048A08: .word PARTNER_TALK_KIND_TABLE
	arm_func_end InitMainTeamAfterQuiz

	arm_func_start InitSpecialEpisodePartners
InitSpecialEpisodePartners: ; 0x02048A0C
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02048A6C
_02048A20: ; jump table
	b _02048A6C ; case 0
	b _02048A34 ; case 1
	b _02048A6C ; case 2
	b _02048A44 ; case 3
	b _02048A60 ; case 4
_02048A34:
	ldr r1, _02048A74 ; =_020A28A8
	mov r0, #3
	bl sub_02048AC4
	b _02048A6C
_02048A44:
	ldr r1, _02048A78 ; =_020A2858
	mov r0, #3
	bl sub_02048AC4
	ldr r1, _02048A7C ; =_020A281C
	mov r0, #4
	bl sub_02048AC4
	b _02048A6C
_02048A60:
	ldr r1, _02048A80 ; =_020A286C
	mov r0, #3
	bl sub_02048AC4
_02048A6C:
	bl SetTeamSetupHeroAndPartnerOnly
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048A74: .word _020A28A8
_02048A78: .word _020A2858
_02048A7C: .word _020A281C
_02048A80: .word _020A286C
	arm_func_end InitSpecialEpisodePartners

	arm_func_start InitSpecialEpisodeExtraPartner
InitSpecialEpisodeExtraPartner: ; 0x02048A84
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02048AB8
_02048A98: ; jump table
	b _02048AB8 ; case 0
	b _02048AB8 ; case 1
	b _02048AB8 ; case 2
	b _02048AB8 ; case 3
	b _02048AAC ; case 4
_02048AAC:
	ldr r1, _02048AC0 ; =SPECIAL_EPISODE_MAIN_CHARACTERS
	mov r0, #4
	bl sub_02048AC4
_02048AB8:
	bl SetTeamSetupHeroAndPartnerOnly
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048AC0: .word SPECIAL_EPISODE_MAIN_CHARACTERS
	arm_func_end InitSpecialEpisodeExtraPartner

	arm_func_start sub_02048AC4
sub_02048AC4: ; 0x02048AC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrsh r1, [r5]
	ldrb r2, [r5, #2]
	mov r4, r0
	mov r3, #0
	bl sub_02055B78
	mov r0, r4
	bl GetTeamMember
	ldrsh r1, [r5, #0xe]
	ldrb r2, [r5, #0xc]
	mov r4, r0
	bl ApplyLevelUpBoostsToGroundMonster
	ldrsh r0, [r5, #0x12]
	cmp r0, #0
	strneh r0, [r4, #0xa]
	ldrsh r2, [r5, #0x10]
	add r0, r4, #0x14
	strh r2, [r4, #8]
	ldrsh r1, [r4, #4]
	bl EnableAllLearnableIqSkills
	ldrh r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0xc]
	add r1, r5, #4
	cmp r0, #0
	add r0, r4, #0x22
	beq _02048B40
	bl LearnMoves
	ldmia sp!, {r3, r4, r5, pc}
_02048B40:
	bl GetInfoGroundMoveset
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02048AC4

	arm_func_start sub_02048B48
sub_02048B48: ; 0x02048B48
	stmdb sp!, {r3, lr}
	bl InitOptions
	bl InitScriptVariableValues
	bl sub_02052C74
	bl sub_0200CABC
	bl StoreDefaultTeamData
	bl ResetGlobalProgress
	bl sub_0205B478
	bl sub_0205C75C
	bl sub_02012AB8
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048B48

	arm_func_start sub_02048B74
sub_02048B74: ; 0x02048B74
	stmdb sp!, {r3, lr}
	ldr r1, _02048BA8 ; =_020AFF38
	ldr r0, _02048BAC ; =_0209CD4C
	ldr r1, [r1, #4]
	mov r2, #0
	bl Debug_Print0
	mov r3, #0
	ldr r1, _02048BA8 ; =_020AFF38
	ldr r0, _02048BB0 ; =_022AAE70
	sub r2, r3, #1
	str r3, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048BA8: .word _020AFF38
_02048BAC: .word _0209CD4C
_02048BB0: .word _022AAE70
	arm_func_end sub_02048B74

	arm_func_start ReadStringSave
ReadStringSave: ; 0x02048BB4
	ldr r1, _02048BC8 ; =_020AFF38
	ldr ip, _02048BCC ; =strncpy
	mov r2, #0x20
	ldr r1, [r1]
	bx ip
	.align 2, 0
_02048BC8: .word _020AFF38
_02048BCC: .word strncpy
	arm_func_end ReadStringSave

	arm_func_start CheckStringSave
CheckStringSave: ; 0x02048BD0
	stmdb sp!, {r3, lr}
	ldr r1, _02048BF8 ; =_020AFF38
	mov r2, #0x20
	ldr r1, [r1]
	bl strncmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048BF8: .word _020AFF38
	arm_func_end CheckStringSave

	arm_func_start sub_02048BFC
sub_02048BFC: ; 0x02048BFC
	ldr r0, _02048C08 ; =_020AFF38
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02048C08: .word _020AFF38
	arm_func_end sub_02048BFC

	arm_func_start sub_02048C0C
sub_02048C0C: ; 0x02048C0C
	stmdb sp!, {r4, lr}
	ldr r1, _02048C34 ; =_020AFF38
	mov r4, r0
	ldr r1, [r1, #4]
	ldr r0, _02048C38 ; =_0209CD4C
	mov r2, r4
	bl Debug_Print0
	ldr r0, _02048C34 ; =_020AFF38
	str r4, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02048C34: .word _020AFF38
_02048C38: .word _0209CD4C
	arm_func_end sub_02048C0C

	arm_func_start sub_02048C3C
sub_02048C3C: ; 0x02048C3C
	ldr r0, _02048C48 ; =_022AAE70
	ldr r0, [r0]
	bx lr
	.align 2, 0
_02048C48: .word _022AAE70
	arm_func_end sub_02048C3C

	arm_func_start sub_02048C4C
sub_02048C4C: ; 0x02048C4C
	ldr r1, _02048C58 ; =_022AAE70
	str r0, [r1]
	bx lr
	.align 2, 0
_02048C58: .word _022AAE70
	arm_func_end sub_02048C4C

	arm_func_start sub_02048C5C
sub_02048C5C: ; 0x02048C5C
	stmdb sp!, {r3, lr}
	ldr r0, _02048CA4 ; =_022AAE74
	mov r1, #0
	mov r2, #0x30
	bl MemsetSimple
	ldr r2, _02048CA8 ; =0x09011416
	ldr r1, _02048CAC ; =_022AAE74
	ldr r0, _02048CB0 ; =_022AAE78
	str r2, [r1, #0x24]
	bl ReadStringSave
	ldr r2, _02048CB4 ; =0x000F1206
	ldr r0, _02048CAC ; =_022AAE74
	mov r1, #0xff
	str r2, [r0, #0x28]
	strb r1, [r0, #0x2c]
	mov r1, #0
	strb r1, [r0, #0x2d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048CA4: .word _022AAE74
_02048CA8: .word 0x09011416
_02048CAC: .word _022AAE74
_02048CB0: .word _022AAE78
_02048CB4: .word 0x000F1206
	arm_func_end sub_02048C5C

	arm_func_start sub_02048CB8
sub_02048CB8: ; 0x02048CB8
	stmdb sp!, {r3, lr}
	mov r0, #9
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02048CE4
	ldr r1, _02048CF0 ; =_022AAE74
	ldr r0, _02048CF4 ; =0x000F1208
	ldr r1, [r1, #0x28]
	cmp r1, r0
	subeq r0, r0, #1
	ldmeqia sp!, {r3, pc}
_02048CE4:
	ldr r0, _02048CF0 ; =_022AAE74
	ldr r0, [r0, #0x28]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048CF0: .word _022AAE74
_02048CF4: .word 0x000F1208
	arm_func_end sub_02048CB8

	arm_func_start sub_02048CF8
sub_02048CF8: ; 0x02048CF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x100
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	ldr r3, _02048DB0 ; =0x000001EA
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x100
	str r3, [sp]
	bl ReadSaveFile
	movs r5, r0
	cmpne r5, #2
	bne _02048D54
	add r0, r4, #4
	bl CheckStringSave
	cmp r0, #0
	moveq r5, #5
	beq _02048D54
	ldr r1, [r4, #0x24]
	ldr r0, _02048DB4 ; =0x09011416
	cmp r1, r0
	movne r5, #4
_02048D54:
	bl sub_02048C5C
	cmp r5, #0
	bne _02048D80
	ldr r1, [r4, #0x28]
	ldr r0, _02048DB8 ; =_022AAE74
	str r1, [r0, #0x28]
	ldrb r1, [r4, #0x2c]
	strb r1, [r0, #0x2c]
	ldrb r1, [r4, #0x2d]
	strb r1, [r0, #0x2d]
	b _02048DA0
_02048D80:
	sub r0, r5, #4
	cmp r0, #1
	ldrls r1, _02048DBC ; =0x000F1206
	ldrls r0, _02048DB8 ; =_022AAE74
	strls r1, [r0, #0x28]
	ldrhi r1, _02048DC0 ; =0x000F1209
	ldrhi r0, _02048DB8 ; =_022AAE74
	strhi r1, [r0, #0x28]
_02048DA0:
	mov r0, r4
	bl MemFree
	bl sub_02048CB8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02048DB0: .word 0x000001EA
_02048DB4: .word 0x09011416
_02048DB8: .word _022AAE74
_02048DBC: .word 0x000F1206
_02048DC0: .word 0x000F1209
	arm_func_end sub_02048CF8

	arm_func_start sub_02048DC4
sub_02048DC4: ; 0x02048DC4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, #0x100
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	bl sub_02048C5C
	ldr r5, _02048E68 ; =_022AAE74
	mov lr, r4
	mov ip, #3
_02048DF0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02048DF0
	str r6, [r4, #0x28]
	bl GetAdventureLogDungeonFloor
	ldrb r2, [r0]
	ldr r3, _02048E6C ; =0x000001EA
	mov r1, r4
	strb r2, [r4, #0x2c]
	ldrb ip, [r0, #1]
	add r0, sp, #0
	mov r2, #0x100
	strb ip, [r4, #0x2d]
	str r3, [sp]
	bl WriteSaveFile
	movs r5, r0
	bne _02048E54
	ldr r1, [r4, #0x28]
	ldr r0, _02048E70 ; =_022AAE74
	str r1, [r0, #0x28]
	ldrb r1, [r4, #0x2c]
	strb r1, [r0, #0x2c]
	ldrb r1, [r4, #0x2d]
	strb r1, [r0, #0x2d]
_02048E54:
	mov r0, r4
	bl MemFree
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02048E68: .word _022AAE74
_02048E6C: .word 0x000001EA
_02048E70: .word _022AAE74
	arm_func_end sub_02048DC4

	arm_func_start WriteSaveFile
WriteSaveFile: ; 0x02048E74
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r2
	add r3, r5, #0xff
	mov r2, r3, asr #7
	ldr r4, [r0]
	add r2, r3, r2, lsr #24
	mov r6, r1
	add r1, r4, r2, asr #8
	str r1, [r0]
	mov r0, r6
	mov r1, r5
	bl CalcChecksum
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0204A9C8
	cmp r0, #4
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WriteSaveFile

	arm_func_start ReadSaveFile
ReadSaveFile: ; 0x02048ED0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	add ip, r4, #0xff
	mov r3, ip, asr #7
	ldr lr, [r0]
	add r3, ip, r3, lsr #24
	add r3, lr, r3, asr #8
	str r3, [r0]
	mov r0, lr
	mov r5, r1
	bl sub_0204A8E0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl CheckChecksumInvalid
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadSaveFile

	arm_func_start CalcChecksum
CalcChecksum: ; 0x02048F24
	mov r3, #0
	mov ip, #1
	b _02048F3C
_02048F30:
	ldr r2, [r0, ip, lsl #2]
	add ip, ip, #1
	add r3, r3, r2
_02048F3C:
	cmp ip, r1, lsr #2
	blt _02048F30
	str r3, [r0]
	bx lr
	arm_func_end CalcChecksum

	arm_func_start CheckChecksumInvalid
CheckChecksumInvalid: ; 0x02048F4C
	mov r3, #0
	mov ip, #1
	b _02048F64
_02048F58:
	ldr r2, [r0, ip, lsl #2]
	add ip, ip, #1
	add r3, r3, r2
_02048F64:
	cmp ip, r1, lsr #2
	blt _02048F58
	ldr r0, [r0]
	cmp r0, r3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end CheckChecksumInvalid

	arm_func_start NoteSaveBase
NoteSaveBase: ; 0x02048F84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r0, _02049218 ; =0x0000B65C
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	add r0, r4, #0x64
	add r5, r0, #0x400
	bl sub_02048BFC
	mov r2, r0
	ldr r0, _0204921C ; =_0209CD6C
	mov r1, sb
	bl Debug_Print0
	mov r0, #0
	bl SetNotifyNote
	bl GetTime
	mov r7, r0
	bl EventFlagBackupVeneer
	cmp sb, #3
	bne _02048FE0
	bl sub_02048BFC
	mov sb, r0
	b _02048FE8
_02048FE0:
	mov r0, sb
	bl sub_02048C0C
_02048FE8:
	str sb, [r4, #0x2c]
	bl sub_02048C3C
	str r0, [r4, #0x28]
	bl GetRngSeed
	str r0, [r4, #0x30]
	cmp sb, #0
	mvneq r0, #0
	beq _0204900C
	bl GetLanguageType
_0204900C:
	ldr r1, _02049220 ; =0x09011416
	strb r0, [r4, #0x34]
	add r0, r4, #4
	str r1, [r4, #0x24]
	bl ReadStringSave
	add r0, r4, #0x38
	bl DumpScriptVariableValues
	ldr r1, _02049224 ; =0x00007F6B
	mov r0, r5
	bl WriteMonsterInfoToSave
	str r0, [r4, #0x438]
	add r0, r5, #0x6b
	ldr r1, _02049228 ; =0x000005DC
	add r0, r0, #0x7f00
	bl sub_020597B0
	str r0, [r4, #0x43c]
	add r0, r5, #0x47
	ldr r1, _0204922C ; =0x000001F7
	add r0, r0, #0x8500
	bl CopyProgressInfoFromScratchTo
	str r0, [r4, #0x440]
	add r0, r5, #0x3e
	ldr r1, _02049230 ; =0x00000DAC
	add r0, r0, #0x8700
	bl WriteItemsToSave
	str r0, [r4, #0x444]
	add r0, r5, #0xea
	add r0, r0, #0x9400
	mov r1, #0x10
	bl sub_02050CF8
	str r0, [r4, #0x448]
	add r0, r5, #0xfa
	add r0, r0, #0x9400
	mov r1, #0x340
	bl sub_0204E154
	str r0, [r4, #0x450]
	add r0, r5, #0x3a
	ldr r1, _02049234 ; =0x000015A0
	add r0, r0, #0x9800
	bl sub_0205BFB0
	str r0, [r4, #0x454]
	add r0, r5, #0xda
	ldr r1, _02049238 ; =0x00000237
	add r0, r0, #0xad00
	bl sub_0205FC20
	str r0, [r4, #0x458]
	add r0, r5, #0x11
	add r0, r0, #0xb000
	mov r1, #0xb
	bl sub_020131F0
	add r1, r5, #0x1c
	str r0, [r4, #0x45c]
	add r0, r1, #0xb000
#ifdef JAPAN
	mov r1, #0x18c
#else
	mov r1, #0x1dc
#endif
	bl sub_0204A3E4
	str r0, [r4, #0x460]
	bl GetTime
	mov r1, r7
	mov r7, r0
	bl _fsub
	bl _f2d
	mov r3, r0
	mov r2, r1
	ldr r0, _0204923C ; =_0209CD84
	mov r1, r3
	bl Debug_Print0
	cmp sb, #2
	moveq r5, #0
	beq _0204912C
	ldr r0, _02049240 ; =0x000F1206
	bl sub_02048DC4
	mov r5, r0
_0204912C:
	cmp r5, #0
	bne _020491C4
	bl sub_02049350
	cmp r0, #1
	add r0, sp, #0
	ldr r2, _02049218 ; =0x0000B65C
	bne _02049188
	mov r3, #0
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	movs r6, r0
	bne _02049168
	mov r0, #0
	bl sub_02049360
_02049168:
	ldr r2, _02049218 ; =0x0000B65C
	mov r3, #0xc8
	add r0, sp, #0
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	mov r8, r0
	b _020491C4
_02049188:
	mov r3, #0xc8
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	movs r8, r0
	bne _020491A8
	mov r0, #1
	bl sub_02049360
_020491A8:
	ldr r2, _02049218 ; =0x0000B65C
	mov r3, #0
	add r0, sp, #0
	mov r1, r4
	str r3, [sp]
	bl WriteSaveFile
	mov r6, r0
_020491C4:
	bl GetTime
	mov r1, r7
	bl _fsub
	bl _f2d
	mov r3, r0
	mov r2, r1
	ldr r0, _02049244 ; =_0209CD94
	mov r1, r3
	bl Debug_Print0
	mov r0, r4
	bl MemFree
	cmp r5, #0
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	movne r0, r6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r8, #0
	moveq r8, #0
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02049218: .word 0x0000B60C
#else
_02049218: .word 0x0000B65C
#endif
_0204921C: .word _0209CD6C
_02049220: .word 0x09011416
_02049224: .word 0x00007F6B
_02049228: .word 0x000005DC
_0204922C: .word 0x000001F7
_02049230: .word 0x00000DAC
_02049234: .word 0x000015A0
_02049238: .word 0x00000237
_0204923C: .word _0209CD84
_02049240: .word 0x000F1206
_02049244: .word _0209CD94
	arm_func_end NoteSaveBase

	arm_func_start WriteQuickSaveInfo
WriteQuickSaveInfo: ; 0x02049248
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r2, r1
	mov r3, #0x190
	add r0, sp, #0
	mov r1, ip
	str r3, [sp]
	bl WriteSaveFile
	ldmia sp!, {r3, pc}
	arm_func_end WriteQuickSaveInfo

	arm_func_start ReadSaveHeader
ReadSaveHeader: ; 0x0204926C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _0204932C ; =0x0000B65C
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	ldr r3, _02049330 ; =_020AFF40
	mov r0, #0
	mov r1, r4
	mov r2, #0x38
	str r0, [r3]
	bl sub_0204A8E0
	cmp r0, #0
	beq _020492B4
	mov r1, r4
	mov r0, #0xc8
	mov r2, #0x38
	bl sub_0204A8E0
_020492B4:
	cmp r0, #0
	ldrne r0, _02049330 ; =_020AFF40
	movne r1, #1
	strne r1, [r0, #4]
	bne _02049310
	add r0, r4, #4
	bl CheckStringSave
	cmp r0, #0
	ldreq r0, _02049330 ; =_020AFF40
	moveq r1, #5
	streq r1, [r0, #4]
	beq _02049310
	ldr r1, [r4, #0x24]
	ldr r0, _02049334 ; =0x09011416
	cmp r1, r0
	ldrne r0, _02049330 ; =_020AFF40
	movne r1, #4
	strne r1, [r0, #4]
#ifdef EUROPE
	bne _02049310
	ldr r1, [r4, #0x2c]
	ldr r0, _02049330 ; =_020AFF40
	mov r2, #0
	stmia r0, {r1, r2}
	ldr r1, [r4, #0x28]
	sub r0, r2, #1
	cmp r1, r0
	beq _02049310
	ldrsb r0, [r4, #0x34]
	bl sub_020205C0
	bl sub_0202059C
#else
	ldreq r2, [r4, #0x2c]
	ldreq r0, _02049330 ; =_020AFF40
	moveq r1, #0
	streq r2, [r0]
	streq r1, [r0, #4]
#endif
_02049310:
	mov r0, r4
	bl MemFree
	ldr r0, _02049330 ; =_020AFF40
	ldr r1, [r0]
	str r1, [r5]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0204932C: .word 0x0000B60C
#else
_0204932C: .word 0x0000B65C
#endif
_02049330: .word _020AFF40
_02049334: .word 0x09011416
	arm_func_end ReadSaveHeader

	arm_func_start sub_02049338
sub_02049338: ; 0x02049338
	ldr r1, _0204934C ; =_020AFF40
	ldr r2, [r1]
	str r2, [r0]
	ldr r0, [r1, #4]
	bx lr
	.align 2, 0
_0204934C: .word _020AFF40
	arm_func_end sub_02049338

	arm_func_start sub_02049350
sub_02049350: ; 0x02049350
	ldr r0, _0204935C ; =_020AFF40
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_0204935C: .word _020AFF40
	arm_func_end sub_02049350

	arm_func_start sub_02049360
sub_02049360: ; 0x02049360
	ldr r1, _0204936C ; =_020AFF40
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0204936C: .word _020AFF40
	arm_func_end sub_02049360

	arm_func_start NoteLoadBase
NoteLoadBase: ; 0x02049370
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r0, _020495FC ; =0x0000B65C
	mov r1, #5
	bl MemAlloc
	mov r4, r0
	add r0, r4, #0x64
	add r6, r0, #0x400
	bl sub_02048BFC
	mov r1, r0
	ldr r0, _02049600 ; =_0209CDA4
	bl Debug_Print0
	mov r0, #0
	bl SetNotifyNote
	mov r0, #0
	str r0, [sp]
	ldr r2, _020495FC ; =0x0000B65C
	add r0, sp, #0
	mov r1, r4
	bl ReadSaveFile
	movs r5, r0
	beq _02049400
	ldr r2, _020495FC ; =0x0000B65C
	mov r3, #0xc8
	add r0, sp, #0
	mov r1, r4
	str r3, [sp]
	bl ReadSaveFile
	movs r5, r0
	ldrne r0, _02049604 ; =_020AFF40
	mvnne r1, #0
	strne r1, [r0, #8]
	ldreq r0, _02049604 ; =_020AFF40
	moveq r1, #1
	streq r1, [r0, #8]
	b _0204940C
_02049400:
	ldr r0, _02049604 ; =_020AFF40
	mov r1, #0
	str r1, [r0, #8]
_0204940C:
	cmp r5, #0
	cmpne r5, #2
	bne _0204943C
	add r0, r4, #4
	bl CheckStringSave
	cmp r0, #0
	moveq r5, #5
	beq _0204943C
	ldr r1, [r4, #0x24]
	ldr r0, _02049608 ; =0x09011416
	cmp r1, r0
	movne r5, #4
_0204943C:
	cmp r5, #0
	bne _020494A0
	ldr r1, [r4, #0x2c]
	ldr r0, _0204960C ; =_0209CDB8
	bl Debug_Print0
	ldr r0, [r4, #0x2c]
	bl sub_02048C0C
	ldr r0, [r4, #0x28]
	bl sub_02048C4C
	ldr r0, [r4, #0x30]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SetRngSeed
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	mvneq r0, #0
	streqb r0, [r4, #0x34]
	beq _020494A0
	ldr r1, [r4, #0x28]
	mvn r0, #0
	cmp r1, r0
	beq _020494A0
	ldrsb r0, [r4, #0x34]
	bl sub_020205C0
	bl sub_0202059C
_020494A0:
	cmp r5, #0
	bne _020494B8
	add r0, r4, #0x38
	bl RestoreScriptVariableValues
	cmp r0, #0
	moveq r5, #4
_020494B8:
	cmp r5, #0
	bne _020495D4
	ldr r1, _02049610 ; =0x00007F6B
	mov r0, r6
	bl ReadMonsterInfoFromSave
	ldr r1, [r4, #0x438]
	cmp r0, r1
	add r0, r6, #0x6b
	ldr r1, _02049614 ; =0x000005DC
	add r0, r0, #0x7f00
	movne r5, #3
	bl sub_02059A74
	ldr r1, [r4, #0x43c]
	cmp r0, r1
	add r0, r6, #0x47
	ldr r1, _02049618 ; =0x000001F7
	add r0, r0, #0x8500
	movne r5, #3
	bl CopyProgressInfoFromScratchFrom
	ldr r1, [r4, #0x440]
	cmp r0, r1
	add r0, r6, #0x3e
	ldr r1, _0204961C ; =0x00000DAC
	add r0, r0, #0x8700
	movne r5, #3
	bl ReadItemsFromSave
	ldr r1, [r4, #0x444]
	cmp r0, r1
	add r0, r6, #0xea
	add r0, r0, #0x9400
	mov r1, #0x10
	movne r5, #3
	bl sub_02050D84
	ldr r1, [r4, #0x448]
	cmp r0, r1
	add r0, r6, #0xfa
	add r0, r0, #0x9400
	mov r1, #0x340
	movne r5, #3
	bl sub_0204E19C
	ldr r1, [r4, #0x450]
	cmp r0, r1
	add r0, r6, #0x3a
	ldr r1, _02049620 ; =0x000015A0
	add r0, r0, #0x9800
	movne r5, #3
	bl sub_0205BD9C
	ldr r1, [r4, #0x454]
	cmp r0, r1
	add r0, r6, #0xda
	ldr r1, _02049624 ; =0x00000237
	add r0, r0, #0xad00
	movne r5, #3
	bl sub_0205FAB0
	ldr r1, [r4, #0x458]
	cmp r0, r1
	add r0, r6, #0x11
	add r0, r0, #0xb000
	mov r1, #0xb
	movne r5, #3
	bl sub_02013190
	ldr r1, [r4, #0x45c]
	cmp r0, r1
	add r0, r6, #0x1c
	add r0, r0, #0xb000
#ifdef JAPAN
	mov r1, #0x18c
#else
	mov r1, #0x1dc
#endif
	movne r5, #3
	bl sub_0204A1DC
	ldr r1, [r4, #0x460]
	cmp r0, r1
	movne r5, #3
_020495D4:
	cmp r5, #0
	bne _020495E4
	bl sub_02048CF8
	b _020495E8
_020495E4:
	bl sub_02048C5C
_020495E8:
	mov r0, r4
	bl MemFree
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_020495FC: .word 0x0000B60C
#else
_020495FC: .word 0x0000B65C
#endif
_02049600: .word _0209CDA4
_02049604: .word _020AFF40
_02049608: .word 0x09011416
_0204960C: .word _0209CDB8
_02049610: .word 0x00007F6B
_02049614: .word 0x000005DC
_02049618: .word 0x000001F7
_0204961C: .word 0x00000DAC
_02049620: .word 0x000015A0
_02049624: .word 0x00000237
	arm_func_end NoteLoadBase

	arm_func_start ReadQuickSaveInfo
ReadQuickSaveInfo: ; 0x02049628
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r2, r1
	mov r3, #0x190
	add r0, sp, #0
	mov r1, ip
	str r3, [sp]
	bl ReadSaveFile
	ldmia sp!, {r3, pc}
	arm_func_end ReadQuickSaveInfo

	arm_func_start sub_0204964C
sub_0204964C: ; 0x0204964C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02049678 ; =_0209CDD0
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r1, _0204967C ; =_022AAEA4
	ldrne r0, _02049680 ; =_020AFF4C
	movne r2, #0
	strne r4, [r1]
	strne r2, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02049678: .word _0209CDD0
_0204967C: .word _022AAEA4
_02049680: .word _020AFF4C
	arm_func_end sub_0204964C

	arm_func_start sub_02049684
sub_02049684: ; 0x02049684
	stmdb sp!, {r3, lr}
	mov r0, #0xb4
	mov r1, #8
	bl MemAlloc
	ldr r1, _020496EC ; =_020AFF4C
	str r0, [r1]
	add r0, r0, #0x1c
	bl CopyMenuControlWindowExtraInfo
	ldr r2, _020496EC ; =_020AFF4C
	ldr r1, _020496F0 ; =_022AAEA4
	ldr r3, [r2]
	str r0, [r3, #0x18]
	ldr r3, [r1]
	ldr r1, [r2]
	mov r0, #0
	str r3, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _020496EC ; =_020AFF4C
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020496EC: .word _020AFF4C
_020496F0: .word _022AAEA4
	arm_func_end sub_02049684

	arm_func_start sub_020496F4
sub_020496F4: ; 0x020496F4
	stmdb sp!, {r3, lr}
	ldr r0, _0204972C ; =_020AFF4C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0204972C ; =_020AFF4C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204972C ; =_020AFF4C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204972C: .word _020AFF4C
	arm_func_end sub_020496F4

	arm_func_start sub_02049730
sub_02049730: ; 0x02049730
	stmdb sp!, {r3, lr}
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r3, [r1]
	ldr r0, [r3, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02049A10
_0204974C: ; jump table
	b _02049770 ; case 0
	b _020497A4 ; case 1
	b _020497C4 ; case 2
	b _020497E8 ; case 3
	b _020498C8 ; case 4
	b _0204996C ; case 5
	b _020499A0 ; case 6
	b _020499CC ; case 7
	b _020499FC ; case 8
_02049770:
	ldr r0, [r3, #8]
	ldr r1, _02049A1C ; =_0209CDE0
	mov r2, r0, lsl #1
	ldrsb r0, [r3]
	ldrh r2, [r1, r2]
	ldr r1, _02049A20 ; =0x00000408
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020497A4:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _02049A18 ; =_020AFF4C
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02049A10
_020497C4:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020497E8:
	bl sub_02003B94
	ldr r0, _02049A18 ; =_020AFF4C
	ldr r1, _02049A24 ; =_0209CE10
	ldr r3, [r0]
	ldr r2, [r3, #8]
	ldr r1, [r1, r2, lsl #2]
	str r1, [r3, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #4
	bne _02049834
	ldr r0, _02049A28 ; =0x000F120A
	bl sub_02048DC4
	mov r0, #2
	bl NoteSaveBase
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r1, [r1]
	str r0, [r1, #0xc]
	b _020498B0
_02049834:
	cmp r0, #2
	bne _020498A0
	bl sub_02048CB8
	ldr r2, _02049A18 ; =_020AFF4C
	ldr r1, _02049A2C ; =0x000F1207
	ldr r3, [r2]
	str r0, [r3, #0x14]
	ldr r0, [r2]
	ldr r0, [r0, #0x14]
	cmp r0, r1
	bne _02049868
	add r0, r1, #1
	bl sub_02048DC4
_02049868:
	mov r0, #2
	bl NoteSaveBase
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r2, [r1]
	str r0, [r2, #0xc]
	ldr r1, [r1]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	ldreq r0, [r1, #0x14]
	ldreq r1, _02049A2C ; =0x000F1207
	cmpeq r0, r1
	bne _020498B0
	bl sub_02048DC4
	b _020498B0
_020498A0:
	bl NoteSaveBase
	ldr r1, _02049A18 ; =_020AFF4C
	ldr r1, [r1]
	str r0, [r1, #0xc]
_020498B0:
	bl sub_02003BC8
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020498C8:
	bl sub_02029FBC
	ldr r0, _02049A18 ; =_020AFF4C
	ldr r3, [r0]
	ldr r0, [r3, #0xc]
	cmp r0, #1
	bne _02049908
#ifdef JAPAN
	ldr r1, _02049A30 ; =0x0000040C
	ldrsb r0, [r3]
	add r2, r1, #0xbd
#else
	ldrsb r0, [r3]
	ldr r1, _02049A30 ; =0x0000040C
	mov r2, #0x238
#endif
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_02049908:
	cmp r0, #0
	bne _02049944
	ldr r0, [r3, #8]
	ldr r1, _02049A34 ; =_0209CDF8
	mov r2, r0, lsl #1
	ldrsb r0, [r3]
	ldrh r2, [r1, r2]
	ldr r1, _02049A38 ; =0x0000061C
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_02049944:
	ldrsb r0, [r3]
	ldr r1, _02049A38 ; =0x0000061C
	ldr r2, _02049A3C ; =0x00000239
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_0204996C:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049A10
	ldr r0, _02049A18 ; =_020AFF4C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049A10
_020499A0:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049A10
	ldr r0, _02049A18 ; =_020AFF4C
	mov r1, #2
	str r1, [r0, #4]
	ldr r0, [r0]
	mov r1, #7
	str r1, [r0, #4]
	b _02049A10
_020499CC:
	mov r0, #9
	str r0, [r3, #4]
	ldr r2, [r1]
	ldr r0, [r2, #0x18]
	tst r0, #0x100
	beq _020499F4
	ldr r0, [r2, #0xa4]
	ldr r1, [r1, #4]
	ldr r2, [r2, #0xa0]
	blx r2
_020499F4:
	mov r0, #4
	ldmia sp!, {r3, pc}
_020499FC:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049A10
	bl CardBackupError
_02049A10:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049A18: .word _020AFF4C
_02049A1C: .word _0209CDE0
_02049A20: .word 0x00000408
_02049A24: .word _0209CE10
_02049A28: .word 0x000F120A
_02049A2C: .word 0x000F1207
_02049A30: .word 0x0000040C
_02049A34: .word _0209CDF8
_02049A38: .word 0x0000061C
#ifdef JAPAN
_02049A3C: .word 0x000004CA
#else
_02049A3C: .word 0x00000239
#endif
	arm_func_end sub_02049730

	arm_func_start sub_02049A40
sub_02049A40: ; 0x02049A40
	stmdb sp!, {r3, lr}
	mov r3, r0
	mov r2, r1
	ldr r0, _02049A6C ; =_0209CE40
	mov r1, r3
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _02049A70 ; =_020AFF54
	movne r1, #0
	strne r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049A6C: .word _0209CE40
_02049A70: .word _020AFF54
	arm_func_end sub_02049A40

	arm_func_start sub_02049A74
sub_02049A74: ; 0x02049A74
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02049ACC ; =_020AFF54
	str r0, [r1]
	add r0, r0, #0x10
	bl CopyMenuControlWindowExtraInfo
	ldr r1, _02049ACC ; =_020AFF54
	ldr r1, [r1]
	str r0, [r1, #0xc]
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02049ACC ; =_020AFF54
	mov r3, #0
	ldr r2, [r1]
	strb r0, [r2]
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049ACC: .word _020AFF54
	arm_func_end sub_02049A74

	arm_func_start sub_02049AD0
sub_02049AD0: ; 0x02049AD0
	stmdb sp!, {r3, lr}
	ldr r0, _02049B08 ; =_020AFF54
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02049B08 ; =_020AFF54
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02049B08 ; =_020AFF54
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049B08: .word _020AFF54
	arm_func_end sub_02049AD0

	arm_func_start sub_02049B0C
sub_02049B0C: ; 0x02049B0C
	stmdb sp!, {r3, lr}
	ldr r0, _02049D34 ; =_020AFF54
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02049D2C
_02049B28: ; jump table
	b _02049B4C ; case 0
	b _02049B74 ; case 1
	b _02049B94 ; case 2
	b _02049BB8 ; case 3
	b _02049BEC ; case 4
	b _02049C74 ; case 5
	b _02049CA8 ; case 6
	b _02049CD4 ; case 7
	b _02049D18 ; case 8
_02049B4C:
	ldrsb r0, [r2]
	ldr r1, _02049D38 ; =0x00000408
#ifdef JAPAN
	mov r2, #0x4e0
#else
	ldr r2, _02049D3C ; =0x0000024F
#endif
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049B74:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _02049D34 ; =_020AFF54
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _02049D2C
_02049B94:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049BB8:
	bl sub_02003B94
	bl sub_02048454
	mov r0, #0
	bl NoteSaveBase
	ldr r1, _02049D34 ; =_020AFF54
	ldr r1, [r1]
	str r0, [r1, #8]
	bl sub_02003BC8
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049BEC:
	bl sub_02029FBC
	ldr r0, _02049D34 ; =_020AFF54
	mov r3, #0
#ifdef JAPAN
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #1
	bne _02049C2C
	ldr r1, _02049D40 ; =0x0000040C
	ldrsb r0, [r2]
	add r2, r1, #0xbd
#else
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	bne _02049C2C
	ldrsb r0, [r1]
	ldr r1, _02049D40 ; =0x0000040C
	mov r2, #0x238
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049C2C:
	cmp r0, #0
#ifdef JAPAN
	ldrsb r0, [r2]
	ldr r1, _02049D44 ; =0x0000061C
	bne _02049C58
	ldr r2, _0204A0B0 ; =0x000004E1
#else
	ldrsb r0, [r1]
	ldr r1, _02049D44 ; =0x0000061C
	bne _02049C58
	mov r2, #0x250
#endif
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049C58:
	ldr r2, _02049D48 ; =0x0000023A
	bl ShowStringIdInDialogueBox
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049C74:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049D2C
	ldr r0, _02049D34 ; =_020AFF54
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02049D2C
_02049CA8:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049D2C
	ldr r0, _02049D34 ; =_020AFF54
	mov r1, #2
	str r1, [r0, #4]
	ldr r0, [r0]
	mov r1, #7
	str r1, [r0, #4]
	b _02049D2C
_02049CD4:
	mov r1, #9
	add r0, sp, #0
	str r1, [r2, #4]
	bl CopyFrameTypeOption
	ldrb r0, [sp]
	bl sub_02027180
	ldr r0, _02049D34 ; =_020AFF54
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	tst r0, #0x100
	beq _02049D10
	ldr r0, [r1, #0x98]
	ldr r2, [r1, #0x94]
	mov r1, #8
	blx r2
_02049D10:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02049D18:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049D2C
	bl CardBackupError
_02049D2C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049D34: .word _020AFF54
_02049D38: .word 0x00000408
#ifdef JAPAN
_02049D40: .word 0x0000040C
_02049D44: .word 0x0000061C
_0204A0B0: .word 0x000004E1
_02049D48: .word 0x000004CB
#else
_02049D3C: .word 0x0000024F
_02049D40: .word 0x0000040C
_02049D44: .word 0x0000061C
_02049D48: .word 0x0000023A
#endif
	arm_func_end sub_02049B0C

	arm_func_start sub_02049D4C
sub_02049D4C: ; 0x02049D4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02049D78 ; =_0209CE58
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r1, _02049D7C ; =_022AAEA8
	ldrne r0, _02049D80 ; =_020AFF5C
	movne r2, #0
	strne r4, [r1]
	strne r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02049D78: .word _0209CE58
_02049D7C: .word _022AAEA8
_02049D80: .word _020AFF5C
	arm_func_end sub_02049D4C

	arm_func_start sub_02049D84
sub_02049D84: ; 0x02049D84
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02049DEC ; =_020AFF5C
	str r0, [r1, #4]
	add r0, r0, #0x10
	bl CopyMenuControlWindowExtraInfo
	ldr r2, _02049DEC ; =_020AFF5C
	ldr r1, _02049DF0 ; =_022AAEA8
	ldr r3, [r2, #4]
	str r0, [r3, #0xc]
	ldr r3, [r1]
	ldr r1, [r2, #4]
	mov r0, #0
	str r3, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _02049DEC ; =_020AFF5C
	mov r3, #0
	ldr r2, [r1, #4]
	strb r0, [r2]
	ldr r2, [r1, #4]
	mov r0, #1
	str r3, [r2, #4]
	str r3, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049DEC: .word _020AFF5C
_02049DF0: .word _022AAEA8
	arm_func_end sub_02049D84

	arm_func_start sub_02049DF4
sub_02049DF4: ; 0x02049DF4
	stmdb sp!, {r3, lr}
	ldr r0, _02049E2C ; =_020AFF5C
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _02049E2C ; =_020AFF5C
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02049E2C ; =_020AFF5C
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02049E2C: .word _020AFF5C
	arm_func_end sub_02049DF4

	arm_func_start sub_02049E30
sub_02049E30: ; 0x02049E30
	stmdb sp!, {r3, lr}
	ldr r1, _0204A004 ; =_020AFF5C
	ldr r3, [r1, #4]
	ldr r0, [r3, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02049FFC
_02049E4C: ; jump table
	b _02049E6C ; case 0
	b _02049EA0 ; case 1
	b _02049EC0 ; case 2
	b _02049EE4 ; case 3
	b _02049F2C ; case 4
	b _02049F6C ; case 5
	b _02049FA0 ; case 6
	b _02049FCC ; case 7
_02049E6C:
	ldr r0, [r3, #8]
	ldr r1, _0204A008 ; =_0209CE54
	mov r2, r0, lsl #1
	ldrsb r0, [r3]
	ldrh r2, [r1, r2]
	ldr r1, _0204A00C ; =0x00000408
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049EA0:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _0204A004 ; =_020AFF5C
	moveq r1, #2
	ldreq r0, [r0, #4]
	streq r1, [r0, #4]
	b _02049FFC
_02049EC0:
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049EE4:
	bl sub_02003B94
	ldr r0, _0204A004 ; =_020AFF5C
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02049F08
	cmp r0, #1
	beq _02049F10
	b _02049F14
_02049F08:
	bl sub_0204A624
	b _02049F14
_02049F10:
	bl sub_0204A72C
_02049F14:
	bl sub_02003BC8
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049F2C:
	bl sub_02029FBC
	ldr r0, _0204A004 ; =_020AFF5C
	ldr r2, _0204A010 ; =_0209CE50
	ldr r0, [r0, #4]
	ldr r1, _0204A014 ; =0x0000061C
	ldr r3, [r0, #8]
	ldrsb r0, [r0]
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049F6C:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049FFC
	ldr r0, _0204A004 ; =_020AFF5C
	ldr r0, [r0, #4]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #6
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _02049FFC
_02049FA0:
	ldrsb r0, [r3]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _02049FFC
	ldr r0, _0204A004 ; =_020AFF5C
	mov r1, #2
	str r1, [r0]
	ldr r0, [r0, #4]
	mov r1, #7
	str r1, [r0, #4]
	b _02049FFC
_02049FCC:
	mov r0, #8
	str r0, [r3, #4]
	ldr r2, [r1, #4]
	ldr r0, [r2, #0xc]
	tst r0, #0x100
	beq _02049FF4
	ldr r0, [r2, #0x98]
	ldr r1, [r1]
	ldr r2, [r2, #0x94]
	blx r2
_02049FF4:
	mov r0, #4
	ldmia sp!, {r3, pc}
_02049FFC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A004: .word _020AFF5C
_0204A008: .word _0209CE54
_0204A00C: .word 0x00000408
_0204A010: .word _0209CE50
_0204A014: .word 0x0000061C
	arm_func_end sub_02049E30

	arm_func_start sub_0204A018
sub_0204A018: ; 0x0204A018
	ldr ip, _0204A024 ; =InitMenu
	ldr r0, _0204A028 ; =_0209CE68
	bx ip
	.align 2, 0
_0204A024: .word InitMenu
_0204A028: .word _0209CE68
	arm_func_end sub_0204A018

	arm_func_start sub_0204A02C
sub_0204A02C: ; 0x0204A02C
	stmdb sp!, {r3, lr}
	mov r0, #1
	mov r1, #8
	bl MemAlloc
	ldr r1, _0204A078 ; =_020AFF64
	str r0, [r1]
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _0204A078 ; =_020AFF64
	ldr r1, _0204A07C ; =0x00000408
	ldr ip, [r3]
#ifdef JAPAN
	add r2, r1, #0xc1
#else
	mov r2, #0x238
#endif
	strb r0, [ip]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0]
	bl ShowStringIdInDialogueBox
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A078: .word _020AFF64
_0204A07C: .word 0x00000408
	arm_func_end sub_0204A02C

	arm_func_start sub_0204A080
sub_0204A080: ; 0x0204A080
	stmdb sp!, {r3, lr}
	ldr r0, _0204A0B8 ; =_020AFF64
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0204A0B8 ; =_020AFF64
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204A0B8 ; =_020AFF64
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A0B8: .word _020AFF64
	arm_func_end sub_0204A080

	arm_func_start sub_0204A0BC
sub_0204A0BC: ; 0x0204A0BC
	stmdb sp!, {r3, lr}
	ldr r0, _0204A0E4 ; =_020AFF64
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0204A0DC
	bl CardBackupError
_0204A0DC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A0E4: .word _020AFF64
	arm_func_end sub_0204A0BC

	arm_func_start sub_0204A0E8
sub_0204A0E8: ; 0x0204A0E8
	ldr ip, _0204A0F4 ; =InitMenu
	ldr r0, _0204A0F8 ; =_0209CE78
	bx ip
	.align 2, 0
_0204A0F4: .word InitMenu
_0204A0F8: .word _0209CE78
	arm_func_end sub_0204A0E8

	arm_func_start sub_0204A0FC
sub_0204A0FC: ; 0x0204A0FC
	stmdb sp!, {r3, lr}
	mov r0, #1
	mov r1, #8
	bl MemAlloc
	ldr r1, _0204A148 ; =_020AFF68
	str r0, [r1]
	mov r0, #0
	bl CreateDialogueBox
	ldr r3, _0204A148 ; =_020AFF68
	ldr r1, _0204A14C ; =0x00000408
	ldr ip, [r3]
#ifdef JAPAN
	add r2, r1, #0xd0
#else
	ldr r2, _0204A150 ; =0x00000247
#endif
	strb r0, [ip]
	ldr r0, [r3]
	mov r3, #0
	ldrsb r0, [r0]
	bl ShowStringIdInDialogueBox
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A148: .word _020AFF68
_0204A14C: .word 0x00000408
#ifndef JAPAN
_0204A150: .word 0x00000247
#endif
	arm_func_end sub_0204A0FC

	arm_func_start sub_0204A154
sub_0204A154: ; 0x0204A154
	stmdb sp!, {r3, lr}
	ldr r0, _0204A18C ; =_020AFF68
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0204A18C ; =_020AFF68
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204A18C ; =_020AFF68
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A18C: .word _020AFF68
	arm_func_end sub_0204A154

	arm_func_start sub_0204A190
sub_0204A190: ; 0x0204A190
	mov r0, #1
	bx lr
	arm_func_end sub_0204A190

	arm_func_start sub_0204A198
sub_0204A198: ; 0x0204A198
	ldr ip, _0204A1A0 ; =sub_0207B9EC
	bx ip
	.align 2, 0
_0204A1A0: .word sub_0207B9EC
	arm_func_end sub_0204A198

	arm_func_start sub_0204A1A4
sub_0204A1A4: ; 0x0204A1A4
	stmdb sp!, {r3, lr}
	ldr r0, _0204A1C4 ; =_022AAEAC
#ifdef JAPAN
	mov r1, #0x1a0
#else
	mov r1, #0x1f0
#endif
	bl MemZero
	ldr r1, _0204A1C4 ; =_022AAEAC
	ldr r0, _0204A1C8 ; =_020AFF6C
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204A1C4: .word _022AAEAC
_0204A1C8: .word _020AFF6C
	arm_func_end sub_0204A1A4

	arm_func_start sub_0204A1CC
sub_0204A1CC: ; 0x0204A1CC
	ldr r0, _0204A1D8 ; =_020AFF6C
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0204A1D8: .word _020AFF6C
	arm_func_end sub_0204A1CC

	arm_func_start sub_0204A1DC
sub_0204A1DC: ; 0x0204A1DC
#ifdef JAPAN
#define SUB_0204A1DC_OFFSET -0x50
#else
#define SUB_0204A1DC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl sub_02050974
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x200
	bl CopyBitsFrom
#ifdef JAPAN
	ldr r4, _0204A3E0 ; =_020AFF6C
	mov r7, #0
	add r6, sp, #4
	mov r5, #0x28
_0204A220:
	ldr r0, [r4]
	add r1, r7, r7, lsl #2
	add r3, r0, #0x40
	mov r0, r6
	mov r2, r5
	add r1, r3, r1
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x10
#else
	ldr r5, _0204A3E0 ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x50
	mov r4, #0xa
_0204A220:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0x40
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsFrom
	add r8, r8, #1
	cmp r8, #0x10
#endif
	blt _0204A220
	ldr r5, _0204A3E0 ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x60
	mov r4, #0xc
_0204A258:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0xe0 + SUB_0204A1DC_OFFSET
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsFrom
	add r8, r8, #1
	cmp r8, #0x10
	blt _0204A258
	mov sb, #0
	mov r5, #1
	ldr sl, _0204A3E0 ; =_020AFF6C
	mov r4, sb
	add r8, sp, #4
	add r7, sp, #0
	mov r6, r5
_0204A298:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	ldr r0, [sl]
	movne r1, r5
	add r0, r0, sb
	moveq r1, r4
	add sb, sb, #1
	strb r1, [r0, #0x1a0 + SUB_0204A1DC_OFFSET]
	cmp sb, #0x10
	blt _0204A298
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x1b0
	add r1, r1, #0x1b0 + SUB_0204A1DC_OFFSET
	bl CopyBitsFrom
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0xe6 + SUB_0204A1DC_OFFSET
	add r1, r1, #0x100
	bl CopyBitsFrom
	ldr r1, _0204A3E0 ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x1e8 + SUB_0204A1DC_OFFSET
	bl CopyBitsFrom
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r3, #1
	ldr r2, [r1]
	moveq r3, #0
	strb r3, [r2, #0x1ea + SUB_0204A1DC_OFFSET]
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r3, #1
	ldr r2, [r1]
	moveq r3, #0
	strb r3, [r2, #0x1eb + SUB_0204A1DC_OFFSET]
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r3, #1
	ldr r2, [r1]
	moveq r3, #0
	strb r3, [r2, #0x1ec + SUB_0204A1DC_OFFSET]
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _0204A3E0 ; =_020AFF6C
	cmp r0, #0
	movne r2, #1
	ldr r1, [r1]
	moveq r2, #0
	add r0, sp, #4
	strb r2, [r1, #0x1ed + SUB_0204A1DC_OFFSET]
	bl sub_020509BC
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204A3E0: .word _020AFF6C
	arm_func_end sub_0204A1DC

	arm_func_start sub_0204A3E4
sub_0204A3E4: ; 0x0204A3E4
#ifdef JAPAN
#define SUB_0204A3E4_OFFSET -0x50
#else
#define SUB_0204A3E4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r2, r1
	mov r4, #0xff
	mov r3, #0
	add r0, sp, #4
	mov r1, r5
	strb r4, [sp, #1]
	strb r3, [sp]
	bl sub_02050990
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x200
	bl CopyBitsTo
#ifdef JAPAN
	ldr r4, _0204A5CC ; =_020AFF6C
	mov r7, #0
	add r6, sp, #4
	mov r5, #0x28
_0204A438:
	ldr r0, [r4]
	add r1, r7, r7, lsl #2
	add r3, r0, #0x40
	mov r0, r6
	mov r2, r5
	add r1, r3, r1
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x10
#else
	ldr r5, _0204A5CC ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x50
	mov r4, #0xa
_0204A438:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0x40
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, #0x10
#endif
	blt _0204A438
	ldr r5, _0204A5CC ; =_020AFF6C
	mov r8, #0
	add r7, sp, #4
	mov r6, #0x60
	mov r4, #0xc
_0204A470:
	ldr r1, [r5]
	mov r0, r7
	add r1, r1, #0xe0 + SUB_0204A3E4_OFFSET
	mla r1, r8, r4, r1
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, #0x10
	blt _0204A470
	ldr r5, _0204A5CC ; =_020AFF6C
	mov r4, #0
	add r8, sp, #0
	add sb, sp, #1
	add r7, sp, #4
	mov r6, #1
_0204A4AC:
	ldr r0, [r5]
	mov r2, r6
	add r0, r0, r4
	ldrb r0, [r0, #0x1a0 + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	movne r1, sb
	moveq r1, r8
	mov r0, r7
	bl CopyBitsTo
	add r4, r4, #1
	cmp r4, #0x10
	blt _0204A4AC
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0x1b0
	add r1, r1, #0x1b0 + SUB_0204A3E4_OFFSET
	bl CopyBitsTo
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0xe6 + SUB_0204A3E4_OFFSET
	add r1, r1, #0x100
	bl CopyBitsTo
	ldr r1, _0204A5CC ; =_020AFF6C
	add r0, sp, #4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x1e8 + SUB_0204A3E4_OFFSET
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1ea + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1eb + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1ec + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	ldr r0, _0204A5CC ; =_020AFF6C
	mov r2, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x1ed + SUB_0204A3E4_OFFSET]
	cmp r0, #0
	addne r1, sp, #1
	addeq r1, sp, #0
	add r0, sp, #4
	bl CopyBitsTo
	add r0, sp, #4
	bl sub_020509BC
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204A5CC: .word _020AFF6C
	arm_func_end sub_0204A3E4

	arm_func_start sub_0204A5D0
sub_0204A5D0: ; 0x0204A5D0
	stmdb sp!, {r4, lr}
	bl sub_02084304
	bl OS_GetLockID
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208346C
	ldr r0, _0204A61C ; =0x00001101
	bl sub_02083B3C
	bl sub_02083B14
	ldr r2, _0204A620 ; =_022AB09C
	mov r1, r4, lsl #0x10
	str r0, [r2]
	mov r0, r1, lsr #0x10
	bl sub_0208347C
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204A61C: .word 0x00001101
_0204A620: .word _022AB09C
	arm_func_end sub_0204A5D0

	arm_func_start sub_0204A624
sub_0204A624: ; 0x0204A624
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	sub sp, sp, #0x400
	bl sub_02083B00
	and r0, r0, #0xff
	cmp r0, #1
	bne _0204A720
	mov r1, #0
	mov r0, #0xff
	add r8, sp, #0x14
_0204A64C:
	strb r0, [r8, r1]
	add r1, r1, #1
	cmp r1, #0x400
	blt _0204A64C
	mov r7, #0
	mov fp, r7
_0204A664:
	mov r6, #0
	mov sb, r7, lsl #8
	b _0204A70C
_0204A670:
	bl OS_GetLockID
	mov r5, r0
	bl sub_02002580
	mov r4, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208346C
	mov r0, r4
	mov r1, #0x13
	bl sub_020027F8
	str fp, [sp]
	mov sl, r0
	str fp, [sp, #4]
	mov r1, #8
	str r1, [sp, #8]
	mov r1, #0xa
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	mov r0, r8
	mov r1, sb
	mov r2, #0x400
	mov r3, fp
	bl sub_02083A18
	mov r1, sl
	mov sl, r0
	mov r0, r4
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208347C
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	cmp sl, #0
	bne _0204A714
	mov r0, #0
	bl CardPullOutWithStatus
	add r6, r6, #1
_0204A70C:
	cmp r6, #4
	blt _0204A670
_0204A714:
	add r7, r7, #1
	cmp r7, #0x100
	blt _0204A664
_0204A720:
	add sp, sp, #0x14
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A624

	arm_func_start sub_0204A72C
sub_0204A72C: ; 0x0204A72C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	sub sp, sp, #0x400
	mov r0, #0x400
	bl RandInt
	str r0, [sp, #0x14]
	bl sub_02083B00
	and r0, r0, #0xff
	cmp r0, #1
	bne _0204A8D4
	mov r2, #0
	mov r1, #0xff
_0204A75C:
	add r0, sp, #0x18
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x400
	blt _0204A75C
	mov r5, #0
_0204A774:
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #22
	mov r8, r5, lsl #8
	add sb, r1, r0, ror #22
	mov r4, #0
	b _0204A8C0
_0204A78C:
	bl OS_GetLockID
	mov r6, r0
	bl sub_02002580
	mov r7, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208346C
	mov r0, r7
	mov r1, #0x13
	bl sub_020027F8
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	mov fp, r0
	mov r0, r8
	add r1, sp, #0x18
	mov r2, #0x400
	mov r3, #0
	bl sub_02083A18
	cmp r0, #0
	beq _0204A820
	mov r0, r7
	mov r1, fp
	bl sub_020027F8
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208347C
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	b _0204A8C8
_0204A820:
	ldr r0, [sp, #0x14]
	cmp sb, r0
	bne _0204A84C
	mov sl, #0
_0204A830:
	mov r0, #0x100
	bl RandInt
	add r1, sp, #0x18
	strb r0, [r1, sl]
	add sl, sl, #1
	cmp sl, #0x400
	blt _0204A830
_0204A84C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	add r0, sp, #0x18
	mov r1, r8
	mov r2, #0x400
	mov r3, #0
	bl sub_02083A18
	mov sl, r0
	mov r1, fp
	mov r0, r7
	bl sub_020027F8
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208347C
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	cmp sl, #0
	bne _0204A8C8
	mov r0, #0
	bl CardPullOutWithStatus
	add r4, r4, #1
_0204A8C0:
	cmp r4, #4
	blt _0204A78C
_0204A8C8:
	add r5, r5, #1
	cmp r5, #0x100
	blt _0204A774
_0204A8D4:
	add sp, sp, #0x18
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A72C

	arm_func_start sub_0204A8E0
sub_0204A8E0: ; 0x0204A8E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl sub_02083B00
	and r0, r0, #0xff
	cmp r0, #1
	movne r0, #3
	bne _0204A9C0
	mov r6, #0
	mov r7, r4, lsl #8
	mov fp, r6
	b _0204A9B4
_0204A918:
	bl OS_GetLockID
	mov r5, r0
	bl sub_02002580
	mov r4, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208346C
	mov r0, r4
	mov r1, #0x13
	bl sub_020027F8
	str fp, [sp]
	mov sl, r0
	str fp, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, fp
	str fp, [sp, #0x10]
	bl sub_02083A18
	mov r1, sl
	mov sl, r0
	mov r0, r4
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208347C
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	cmp sl, #0
	movne r0, #0
	bne _0204A9C0
	mov r0, #0
	bl CardPullOutWithStatus
	add r6, r6, #1
_0204A9B4:
	cmp r6, #4
	blt _0204A918
	mov r0, #3
_0204A9C0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A8E0

	arm_func_start sub_0204A9C8
sub_0204A9C8: ; 0x0204A9C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x214
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl sub_02083B00
	and r0, r0, #0xff
	cmp r0, #1
	movne r0, #3
	bne _0204AB10
	mov r7, r4, lsl #8
	mov r6, #0
	mov fp, #6
	b _0204AB04
_0204AA00:
	bl OS_GetLockID
	mov r5, r0
	bl sub_02002580
	mov r1, #0x13
	mov r4, r0
	bl sub_020027F8
	mov sl, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208346C
	mov r0, #0
	str r0, [sp]
	stmib sp, {r0, fp}
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, r7
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0
	bl sub_02083A18
	cmp r0, #0
	bne _0204AA8C
	mov r0, r4
	mov r1, sl
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208347C
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	mov r0, #4
	b _0204AB10
_0204AA8C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, sb
	mov r1, r7
	mov r2, r8
	mov r3, #0
	bl sub_02083A18
	mov r1, sl
	mov sl, r0
	mov r0, r4
	bl sub_020027F8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0208347C
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02079094
	cmp sl, #0
	movne r0, #0
	bne _0204AB10
	mov r0, #0
	bl CardPullOutWithStatus
	add r6, r6, #1
_0204AB04:
	cmp r6, #4
	blt _0204AA00
	mov r0, #3
_0204AB10:
	add sp, sp, #0x214
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0204A9C8

