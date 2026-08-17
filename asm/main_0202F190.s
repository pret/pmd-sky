	.include "asm/macros.inc"
	.include "main_0202F190.inc"

	.text

	arm_func_start sub_0202F190
sub_0202F190: ; 0x0202F190
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r5
	mov r2, r4
	add r0, r0, #0xc
	bl sub_02026184
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202F190

	arm_func_start ShowStringIdInDialogueBox
ShowStringIdInDialogueBox: ; 0x0202F1B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F1EC
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F200
_0202F1EC:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F200
	add r0, r4, #0x128
	bl sub_02048240
_0202F200:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessStringFromId
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringIdInDialogueBox

	arm_func_start ShowStringInDialogueBox
ShowStringInDialogueBox: ; 0x0202F23C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F274
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F288
_0202F274:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F288
	add r0, r4, #0x128
	bl sub_02048240
_0202F288:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessString
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringInDialogueBox

	arm_func_start sub_0202F2C4
sub_0202F2C4: ; 0x0202F2C4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F31C
_0202F2E0: ; jump table
	b _0202F31C ; case 0
	b _0202F2F4 ; case 1
	b _0202F308 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F2F4:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F308:
	add r0, r4, #0xc
	bl sub_020261A4
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F31C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F2C4

	arm_func_start sub_0202F334
sub_0202F334: ; 0x0202F334
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F38C
_0202F350: ; jump table
	b _0202F38C ; case 0
	b _0202F364 ; case 1
	b _0202F378 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F364:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F378:
	mov r0, #3
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F38C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F334

	arm_func_start ShowDialogueBox
ShowDialogueBox: ; 0x0202F3A4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F3E0
_0202F3C0: ; jump table
	b _0202F3E0 ; case 0
	b _0202F3D4 ; case 1
	b _0202F3D4 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F3D4:
	add r0, r4, #0xc
	bl sub_020261C4
	ldmia sp!, {r4, pc}
_0202F3E0:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end ShowDialogueBox

	arm_func_start sub_0202F3F8
sub_0202F3F8: ; 0x0202F3F8
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F434
_0202F414: ; jump table
	b _0202F434 ; case 0
	b _0202F428 ; case 1
	b _0202F428 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F428:
	add r0, r4, #0xc
	bl sub_020261B4
	ldmia sp!, {r4, pc}
_0202F434:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F3F8

	arm_func_start ReadStringFromDialogueBox
ReadStringFromDialogueBox: ; 0x0202F44C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r0
	mov r0, r5
	mov r2, r4
	add r1, r1, #0x128
	bl MemcpySimple
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadStringFromDialogueBox

	arm_func_start sub_0202F474
sub_0202F474: ; 0x0202F474
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xa]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F474

	arm_func_start UpdateDialogueBox
UpdateDialogueBox: ; 0x0202F488
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F4A4: ; jump table
	b _0202F4B8 ; case 0
	b _0202F4E4 ; case 1
	b _0202F504 ; case 2
	b _0202F568 ; case 3
	b _0202F57C ; case 4
_0202F4B8:
	add r0, r4, #0xc
	bl sub_020261D4
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F4E4:
	mov r0, #1
	strb r0, [r4, #8]
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F504:
	add r0, r4, #0xc
	bl sub_02026204
	cmp r0, #0x10
	moveq r0, #3
	streq r0, [r4, #4]
	moveq r0, #1
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r5, [r4, #8]
	add r0, r4, #0xc
	bl sub_020261E4
	strb r0, [r4, #8]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #8]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x128
	bl sub_02048240
	mov r0, #0
	strb r0, [r4, #9]
	ldmia sp!, {r3, r4, r5, pc}
_0202F568:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
_0202F57C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateDialogueBox

	arm_func_start CreatePortraitBox
CreatePortraitBox: ; 0x0202F5AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r4, r1
	mov r0, #0x380
	mov r1, #8
	mov r6, r2
	bl MemAlloc
	ldr r1, _0202F648 ; =PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
	mov r5, r0
	add ip, sp, #0
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, _0202F64C ; =UpdatePortraitBox
	cmp r6, #0
	str r0, [sp]
	mvnne r0, #3
	mvneq r0, #6
	strb r0, [sp, #9]
	str r5, [sp, #0xc]
	strb r7, [sp, #8]
	add r0, sp, #0
	strb r6, [r5, #0x2a]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r5]
	mov r1, #0
	add r0, r5, #8
	str r1, [r5, #4]
	bl InitPortraitParams
	add r0, r5, #0x18
	bl InitPortraitParams
	str r4, [r5, #0x2c]
	mov r0, #0
	strb r0, [r5, #0x28]
	strb r0, [r5, #0x29]
	ldrsb r0, [r5]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202F648: .word PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
_0202F64C: .word UpdatePortraitBox
	arm_func_end CreatePortraitBox

	arm_func_start ClosePortraitBox
ClosePortraitBox: ; 0x0202F650
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end ClosePortraitBox

	arm_func_start PortraitBoxNeedsUpdate
PortraitBoxNeedsUpdate: ; 0x0202F66C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end PortraitBoxNeedsUpdate

	arm_func_start ShowPortraitInPortraitBox
ShowPortraitInPortraitBox: ; 0x0202F690
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #1
	strne r0, [r4, #4]
	cmp r5, #0
	addne ip, r4, #0x18
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	bne _0202F6D0
	add r0, r4, #0x18
	bl InitPortraitParams
_0202F6D0:
	mov r0, #1
	strb r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShowPortraitInPortraitBox

	arm_func_start HidePortraitBox
HidePortraitBox: ; 0x0202F6DC
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	bl InitPortraitParams
	ldr r0, [r4, #4]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x29]
	ldmia sp!, {r4, pc}
	arm_func_end HidePortraitBox

	arm_func_start UpdatePortraitBox
UpdatePortraitBox: ; 0x0202F70C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F728: ; jump table
	b _0202F73C ; case 0
	b _0202F760 ; case 1
	b _0202F778 ; case 2
	b _0202F86C ; case 3
	b _0202F894 ; case 4
_0202F73C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	mov r0, #1
	strb r1, [r4, #0x28]
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F760:
	ldrsb r0, [r5, #0x10]
	bl sub_0202811C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F778:
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	add ip, r4, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	bne _0202F86C
	mov r0, ip
	bl IsValidPortrait
	cmp r0, #0
	beq _0202F854
	add r0, r4, #8
	add r1, r4, #0x30
	bl LoadPortrait
	cmp r0, #0
	beq _0202F824
	ldr r2, [r4, #0x2c]
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0x30
	mov r2, r2, lsl #4
	bl sub_02027040
	ldrsb r0, [r5, #0x10]
	ldr r2, [r4, #0x2c]
	add r1, r4, #0x60
	bl sub_02026E3C
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x11]
	ldrb r0, [r4, #0x2a]
	cmp r0, #0
	ldrsb r0, [r4]
	beq _0202F808
	mvn r1, #3
	bl sub_02028080
	b _0202F810
_0202F808:
	mvn r1, #6
	bl sub_02028080
_0202F810:
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0xc
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F824:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	ldrsb r0, [r4]
	mov r1, #0
	bl sub_02028080
	add r1, r4, #0xc
	ldrsb r0, [r5, #0x10]
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F854:
	mov r0, #1
	strb r0, [r4, #0x29]
_0202F85C:
	mov r0, #3
	str r0, [r4, #4]
	sub r0, r0, #4
	str r0, [r5, #0xb8]
_0202F86C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	movne r0, #4
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0202F894:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl InitPortraitParams
	mov r0, #0
	strb r0, [r4, #0x29]
	str r0, [r4, #4]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdatePortraitBox

	arm_func_start CreateTextBox
CreateTextBox: ; 0x0202F8C4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl CreateTextBoxInternal
	str r4, [r0, #4]
	ldrsb r0, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end CreateTextBox

	arm_func_start CreateTextBoxWithArg
CreateTextBoxWithArg: ; 0x0202F8DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r5, r1
	bl CreateTextBoxInternal
	str r4, [r0, #0x14]
	str r5, [r0, #8]
	ldrsb r0, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CreateTextBoxWithArg

	arm_func_start CloseTextBox
CloseTextBox: ; 0x0202F8FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox

	arm_func_start CloseTextBox2
CloseTextBox2: ; 0x0202F918
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl sub_0202836C
	mov r0, r4
	bl sub_02027B1C
	mov r0, r4
	bl sub_0202F954
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox2

	arm_func_start sub_0202F954
sub_0202F954: ; 0x0202F954
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0202F9AC
_0202F96C: ; jump table
	b _0202F9AC ; case 0
	b _0202F988 ; case 1
	b _0202F994 ; case 2
	b _0202F9A0 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	ldmia sp!, {r3, pc} ; case 5
	ldmia sp!, {r3, pc} ; case 6
_0202F988:
	mov r1, #5
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F994:
	mov r1, #3
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9A0:
	mov r1, #4
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9AC:
	mov r1, #0
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F954

	arm_func_start IsTextboxState3
IsTextboxState3: ; 0x0202F9B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x10]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsTextboxState3

	arm_func_start CreateTextBoxInternal
CreateTextBoxInternal: ; 0x0202F9DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x18
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r5, #0
	ldreq r0, _0202FA54 ; =TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _0202FA58 ; =UpdateTextBox
	add r0, sp, #0
	str r1, [sp]
	str r4, [sp, #0xc]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0x14]
	str r0, [r4, #0x10]
	ldr r1, _0202FA58 ; =UpdateTextBox
	mov r0, r4
	str r1, [r4, #0xc]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202FA54: .word TEXT_BOX_DEFAULT_WINDOW_PARAMS
_0202FA58: .word UpdateTextBox
	arm_func_end CreateTextBoxInternal

	arm_func_start UpdateTextBox
UpdateTextBox: ; 0x0202FA5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldr r0, [r4, #0x10]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202FA84: ; jump table
	b _0202FAA0 ; case 0
	b _0202FAB0 ; case 1
	b _0202FAC8 ; case 2
	b _0202FB04 ; case 3
	b _0202FB50 ; case 4
	b _0202FB68 ; case 5
	b _0202FB88 ; case 6
_0202FAA0:
	mvn r0, #0
	str r0, [r5, #0xb8]
	mov r0, #1
	str r0, [r4, #0x10]
_0202FAB0:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #0x10]
_0202FAC8:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _0202FAE4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x14]
	blx r2
	b _0202FAF8
_0202FAE4:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0202FAF8
	ldrsb r0, [r5, #0x10]
	blx r1
_0202FAF8:
	mov r0, #3
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB04:
	ldrb r0, [r5, #8]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp]
	tst r0, #2
	ldrnesb r2, [r5, #9]
	mvnne r1, #1
	cmpne r2, r1
	subne r0, r1, #3
	cmpne r2, r0
	subne r0, r1, #6
	cmpne r2, r0
	subne r0, r1, #7
	cmpne r2, r0
	movne r0, #4
	strne r0, [r4, #0x10]
	ldr r0, [r4, #0x10]
	cmp r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
_0202FB50:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #0x10]
_0202FB68:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	movne r0, #6
	strne r0, [r4, #0x10]
	subne r0, r0, #0xc
	strne r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB88:
	mvn r0, #4
	str r0, [r5, #0xb8]
	mov r0, #7
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateTextBox

	arm_func_start IsTextBoxActive
IsTextBoxActive: ; 0x0202FB9C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x10]
	cmp r0, #7
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTextBoxActive

	arm_func_start CreateAreaNameBox
CreateAreaNameBox: ; 0x0202FBBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x64
	mov r7, r0
	mov r6, r1
	mov r0, #0x1b4
	mov r1, #8
	mov r5, r2
	mov r8, r3
	bl MemAlloc
	mov r4, r0
	str r8, [r4, #0xa4]
	add r0, sp, #0x14
	str r8, [sp, #0x24]
	str r0, [sp]
	ldr r2, _0202FD2C ; =_0209AF6C
	ldr r3, _0202FD30 ; =0x0000C402
	add r0, r4, #0xac
	mov r1, #0x100
	bl PreprocessString
	add r0, r4, #0xac
	bl sub_020265A8
	mov ip, r0
	cmp r7, #0
	str ip, [r4, #0xa8]
	addne lr, sp, #4
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FD34 ; =UpdateAreaNameBox
	strne r0, [sp, #4]
	bne _0202FC48
	ldr r0, _0202FD38 ; =AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	add r7, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	orr r6, r6, #0x300000
_0202FC48:
	ldrb r0, [sp, #0xa]
	str r4, [sp, #0x10]
	cmp r0, #0
	addeq r1, ip, #7
	moveq r0, r1, asr #2
	addeq r0, r1, r0, lsr #29
	moveq r0, r0, asr #3
	streqb r0, [sp, #0xa]
	ldrb r0, [sp, #0xb]
	cmp r0, #0
	moveq r0, #2
	streqb r0, [sp, #0xb]
	tst r6, #0x200000
	ldrneb r1, [sp, #8]
	ldrneb r0, [sp, #0xa]
	subne r0, r1, r0
	strneb r0, [sp, #8]
	tst r6, #0x100000
	ldrneb r1, [sp, #9]
	ldrneb r0, [sp, #0xb]
	subne r0, r1, r0
	strneb r0, [sp, #9]
	ldrb r1, [sp, #0xa]
	ldr r0, [r4, #0xa8]
	rsb r0, r0, r1, lsl #3
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1b0]
	ldrb r0, [sp, #0xb]
	mov r0, r0, lsl #3
	sub r0, r0, #0xc
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [r4, #0x1b0]
	ldr r0, _0202FD34 ; =UpdateAreaNameBox
	cmp r5, #0
	stmia r4, {r0, r6}
	beq _0202FD10
	add r7, r4, #8
	mov r6, #9
_0202FCF8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202FCF8
	ldmia r5, {r0, r1}
	stmia r7, {r0, r1}
_0202FD10:
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r2, [r4, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202FD2C: .word _0209AF6C
_0202FD30: .word 0x0000C402
_0202FD34: .word UpdateAreaNameBox
_0202FD38: .word AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAreaNameBox
