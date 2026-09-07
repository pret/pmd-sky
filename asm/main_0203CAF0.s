	.include "asm/macros.inc"
	.include "main_0203CAF0.inc"

	.text

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
