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

	arm_func_start SetAreaNameBoxState3
SetAreaNameBoxState3: ; 0x0202FD3C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #3
	str r1, [r0, #0xa0]
	ldmia sp!, {r3, pc}
	arm_func_end SetAreaNameBoxState3

	arm_func_start CloseAreaNameBox
CloseAreaNameBox: ; 0x0202FD50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAreaNameBox

	arm_func_start IsAreaNameBoxActive
IsAreaNameBoxActive: ; 0x0202FD6C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAreaNameBoxActive

	arm_func_start UpdateAreaNameBox
UpdateAreaNameBox: ; 0x0202FD8C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FDA8: ; jump table
	b _0202FDB8 ; case 0
	b _0202FDD0 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FE0C ; case 3
_0202FDB8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FDD0:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1b0]
	ldr r2, [r6, #0x1ac]
	add r3, r6, #0xac
	bl DrawTextInWindow
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FE0C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateAreaNameBox

	arm_func_start CreateControlsChart
CreateControlsChart: ; 0x0202FE2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r5, r1
	mov r0, #0xa8
	mov r1, #8
	mov r4, r2
	mov r6, r3
	bl MemAlloc
	mov ip, r0
	cmp r7, #0
	ldreq r0, _0202FECC ; =CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
	strh r6, [ip, #0xa4]
	add lr, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia lr, {r0, r1, r2, r3}
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FED0 ; =UpdateControlsChart
	str ip, [sp, #0xc]
	strne r0, [sp]
	ldr r0, _0202FED0 ; =UpdateControlsChart
	cmp r4, #0
	stmia ip, {r0, r5}
	beq _0202FEB0
	add lr, ip, #8
	mov r5, #9
_0202FE98:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202FE98
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_0202FEB0:
	mov r2, #0
	add r0, sp, #0
	mov r1, #3
	str r2, [ip, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202FECC: .word CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
_0202FED0: .word UpdateControlsChart
	arm_func_end CreateControlsChart

	arm_func_start CloseControlsChart
CloseControlsChart: ; 0x0202FED4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseControlsChart

	arm_func_start IsControlsChartActive
IsControlsChartActive: ; 0x0202FEF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsControlsChartActive

	arm_func_start UpdateControlsChart
UpdateControlsChart: ; 0x0202FF10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FF2C: ; jump table
	b _0202FF3C ; case 0
	b _0202FF54 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FF90 ; case 3
_0202FF3C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FF54:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldrh r3, [r6, #0xa4]
	mov r1, #4
	mov r2, #2
	bl AppendStandardStringToMission
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FF90:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateControlsChart

	arm_func_start CreateAlertBox
CreateAlertBox: ; 0x0202FFB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x650
	mov r1, #8
	bl MemAlloc
	mov r1, #0x650
	mov r4, r0
	bl MemZero
	cmp r5, #0
	ldreq r0, _0203003C ; =ALERT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030040 ; =UpdateAlertBox
	str r4, [sp, #0xc]
	strne r0, [sp]
	add r0, sp, #0
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	ldrsb r1, [r4]
	add r0, r4, #8
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	add r0, r4, #0x600
	strh r1, [r0, #0x44]
	strh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsb r0, [r4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203003C: .word ALERT_BOX_DEFAULT_WINDOW_PARAMS
_02030040: .word UpdateAlertBox
	arm_func_end CreateAlertBox

	arm_func_start CloseAlertBox
CloseAlertBox: ; 0x02030044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4]
	bl sub_0202836C
	add r0, r4, #8
	bl sub_0202613C
	mov r0, r5
	bl GetWindowContents
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAlertBox

	arm_func_start sub_0203007C
sub_0203007C: ; 0x0203007C
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x44]
	add r1, r1, #1
	strh r1, [r0, #0x44]
	ldrsh r1, [r0, #0x44]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x44]
	bx lr
	arm_func_end sub_0203007C

	arm_func_start sub_020300A0
sub_020300A0: ; 0x020300A0
	add r0, r0, #0x600
	ldrsh r0, [r0, #0x44]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	movge r0, #0
	bx lr
	arm_func_end sub_020300A0

	arm_func_start sub_020300C0
sub_020300C0: ; 0x020300C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add ip, sp, #0
	str r1, [sp]
	mov r1, ip
	add r0, r5, #0xc
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02020B60
	ldr r1, _02030108 ; =0x0000C402
	mov r2, r4
	add r0, r5, #0xc
	bl sub_02020BC4
	add r0, r5, #0xc
	bl AnalyzeText
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02030108: .word 0x0000C402
	arm_func_end sub_020300C0

	arm_func_start AddMessageToAlertBox
AddMessageToAlertBox: ; 0x0203010C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	beq _02030144
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
_02030144:
	mov r0, r4
	bl sub_020300A0
	add r1, r4, #0x600
	ldrsh r2, [r1, #0x46]
	cmp r2, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r5, [sp]
	ldrsh r1, [r1, #0x44]
	add r0, r4, #0x29
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r0, r1, r0, r2
	mov r2, r6
	mov r3, r7
	mov r1, #0x140
	bl PreprocessString
	add r1, r4, #0x600
	add r0, r4, #0x29
	ldrsh r1, [r1, #0x44]
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r2, r1, r0, r2
	mov r1, r7
	add r0, r4, #8
	bl sub_02026194
	add r1, r4, #0x600
	ldrsh r0, [r1, #0x44]
	mov r2, #0x148
	mov r6, #0
	smlabb r0, r0, r2, r4
	add r0, r0, #0x200
	strh r7, [r0, #0x6a]
	ldrsh r5, [r1, #0x44]
	ldrb r3, [sp, #0x18]
	mov r0, r4
	smlabb r5, r5, r2, r4
	str r6, [r5, #0x124]
	ldrsh r1, [r1, #0x44]
	smlabb r1, r1, r2, r4
	strb r3, [r1, #0x128]
	bl sub_0203007C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end AddMessageToAlertBox

	arm_func_start IsAlertBoxActive
IsAlertBoxActive: ; 0x020301F4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAlertBoxActive

	arm_func_start sub_02030214
sub_02030214: ; 0x02030214
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030260
_02030230: ; jump table
	b _02030260 ; case 0
	b _02030248 ; case 1
	b _02030254 ; case 2
	b _02030254 ; case 3
	ldmia sp!, {r4, pc} ; case 4
	ldmia sp!, {r4, pc} ; case 5
_02030248:
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030254:
	mov r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030260:
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030214

	arm_func_start UpdateAlertBox
UpdateAlertBox: ; 0x02030274
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030290: ; jump table
	b _020302A8 ; case 0
	b _020302C8 ; case 1
	b _020302E0 ; case 2
	b _02030438 ; case 3
	b _0203056C ; case 4
	b _02030588 ; case 5
_020302A8:
	add r0, r4, #8
	bl sub_020261D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_020302C8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020302E0:
	ldrsb r0, [r5, #0x10]
	bl GetWindowContents
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x46]
	ldrsh r0, [r0, #0x44]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsb r4, [r5, #0x10]
	mov r0, r4
	bl GetWindowContents
	mov r6, r0
	add r3, r6, #0x600
	ldr r1, [r6, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r5, [r6, #0x10]
	mov r8, r1, asr #0x10
	mla r1, r2, r8, r5
	ldr r2, [r6, #0xc]
	mov r7, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	ldrsh r3, [r3, #0x46]
	mov r1, #0x148
	add r5, r6, #0x124
	smulbb r3, r3, r1
	ldr r1, [r5, r3]
	add r5, r5, r3
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov r7, r7, asr #0x10
	bne _02030388
	mov r5, #0x17
	mov r0, r4
	add r2, r7, r8
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
	b _020303C4
_02030388:
	mov r2, r7
	add r3, r5, #5
	bl sub_020300C0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _020303C4
	cmp r7, r8
	blt _020303C4
	mov r5, #0x17
	mov r0, r4
	sub r2, r7, #2
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
_020303C4:
	mov r0, r4
	bl UpdateWindow
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsh r1, [r0, #0x46]
	add r1, r1, #1
	strh r1, [r0, #0x46]
	ldrsh r1, [r0, #0x46]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x46]
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x4a]
	cmp r1, #3
	movge r1, #3
	strge r1, [r6, #4]
	movge r1, #0
	strgeh r1, [r0, #0x4c]
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r6, #0xa0]
	ldr r0, [r6, #0x10]
	add r2, r1, r8
	mov r1, r8
	sub r0, r2, r0
	bl _s32_div_f
	add r1, r6, #0x600
	strh r0, [r1, #0x4a]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030438:
	ldrsb r5, [r5, #0x10]
	mov r0, r5
	bl GetWindowContents
	mov r7, r0
	add r3, r7, #0x600
	ldr r1, [r7, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r6, [r7, #0x10]
	mov r8, r1, asr #0x10
	ldr r1, [r7, #0xc]
	mla r6, r2, r8, r6
	ldrsh sb, [r3, #0x4c]
	mov r2, r1, lsl #0x10
	ldrsh ip, [r3, #0x48]
	mov r1, #0x148
	add r3, sb, r6
	mov r3, r3, lsl #0x10
	smulbb r6, ip, r1
	add sb, r7, #0x124
	ldr r1, [sb, r6]
	add r6, sb, r6
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov sb, r3, asr #0x10
	bne _020304C0
	mov r6, #0x17
	mov r0, r5
	add r2, sb, r8
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
	b _020304FC
_020304C0:
	mov r2, sb
	add r3, r6, #5
	bl sub_020300C0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _020304FC
	cmp sb, r8
	blt _020304FC
	mov r6, #0x17
	mov r0, r5
	sub r2, sb, #2
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
_020304FC:
	add r0, r7, #0x600
	ldrsh r0, [r0, #0x4c]
	add r0, r0, r8
	cmp r0, #1
	mov r0, r5
	bne _02030528
	bl sub_01FF9128
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #1
	b _02030538
_02030528:
	bl sub_01FF929C
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #2
_02030538:
	strh r1, [r0, #0x4c]
	add r0, r7, #0x600
	ldrsh r2, [r0, #0x4c]
	rsb r1, r8, #0
	cmp r2, r1
	movle r1, #3
	strleh r1, [r0, #0x4a]
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0203056C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030588:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r1, #0
	add r0, r4, #8
	str r1, [r4, #4]
	bl sub_0202613C
	mvn r0, #5
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end UpdateAlertBox

	arm_func_start CreateAdvancedTextBox
CreateAdvancedTextBox: ; 0x020305B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	add r1, r0, #0x100
	str r4, [r0, #0x1a4]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBox

	arm_func_start CreateAdvancedTextBoxWithArg
CreateAdvancedTextBoxWithArg: ; 0x020305E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	ldr r2, [sp, #0x10]
	str r4, [r0, #0x1a8]
	add r1, r0, #0x100
	str r2, [r0, #0x1ac]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBoxWithArg

	arm_func_start CreateAdvancedTextBoxInternal
CreateAdvancedTextBoxInternal: ; 0x0203061C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r8, r0
	mov r7, r1
	mov r0, #0x1c8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x1a4]
	str r0, [r4, #0x1a8]
	str r0, [r4, #0x1ac]
	str r0, [r4, #0x1b8]
	mov r0, #1
	cmp r8, #0
	strb r0, [r4, #0x1c4]
	addne ip, sp, #0x18
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030774 ; =UpdateAdvancedTextBox
	strne r0, [sp, #0x18]
	bne _02030690
	ldr r0, _02030778 ; =ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x18
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r7, r7, #0x300000
_02030690:
	tst r7, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	str r4, [sp, #0x24]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst r7, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02030774 ; =UpdateAdvancedTextBox
	cmp r6, #0
	str r0, [r4]
	str r7, [r4, #0x104]
	beq _020306F0
	add ip, r4, #0x108
	mov r8, #9
_020306D8:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _020306D8
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_020306F0:
	mov r2, #0
	str r2, [r4, #0x1bc]
	strb r2, [r4, #0x1c0]
	strb r2, [r4, #0x1c1]
	strb r2, [r4, #0x1c2]
	str r2, [r4, #0x1b0]
	str r2, [r4, #0x1b4]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r4, #0x1c3]
	bl NewWindowScreenCheck
	add r1, sp, #8
	strb r0, [r4, #0x1a0]
	bl GetWindowRectangle
	mov r1, #0x100
	strh r1, [r4, #0xfc]
	tst r7, #0x8000
	moveq r5, #0
	streq r5, [sp, #0x40]
	strh r1, [r4, #0xfe]
	add r0, r4, #0x100
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #0x40]
	add r3, sp, #8
	mov r1, r7
	add r0, r4, #4
	add r2, r4, #0x108
	stmia sp, {r5, r6}
	bl InitWindowInput
	mov r0, r4
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02030774: .word UpdateAdvancedTextBox
_02030778: .word ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAdvancedTextBoxInternal

	arm_func_start SetAdvancedTextBoxPartialMenu
SetAdvancedTextBoxPartialMenu: ; 0x0203077C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c3]
	ldr r1, [r0, #0x104]
	tst r4, #0xff
	orrne r1, r1, #0x400000
	biceq r1, r1, #0x400000
	str r1, [r0, #0x104]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxPartialMenu

	arm_func_start SetAdvancedTextBoxField0x1C4
SetAdvancedTextBoxField0x1C4: ; 0x020307A4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c4]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxField0x1C4

	arm_func_start sub_020307B8
sub_020307B8: ; 0x020307B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1bc]
	mov r1, #0
	strb r1, [r0, #0x1c0]
	strb r1, [r0, #0x1c1]
	ldr r1, [r0, #0x104]
	bic r1, r1, #0x800000
	str r1, [r0, #0x104]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_020307B8

	arm_func_start sub_020307EC
sub_020307EC: ; 0x020307EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #7
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _02030828
	mov r0, r5
	bl sub_020307B8
	ldmia sp!, {r3, r4, r5, pc}
_02030828:
	ldr r0, [r4, #0x1bc]
	cmp r0, #6
	moveq r0, #0
	streq r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020307EC

	arm_func_start SetAdvancedTextBoxField0x1C2
SetAdvancedTextBoxField0x1C2: ; 0x0203083C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1c2]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxField0x1C2

	arm_func_start CloseAdvancedTextBox2
CloseAdvancedTextBox2: ; 0x02030850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0202836C
	mov r0, r5
	bl sub_020288DC
	mov r0, r5
	bl sub_0202812C
	mov r0, r5
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox2

	arm_func_start SetAdvancedTextBoxState5
SetAdvancedTextBoxState5: ; 0x0203088C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #5
	str r1, [r0, #0x1bc]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxState5

	arm_func_start CloseAdvancedTextBox
CloseAdvancedTextBox: ; 0x020308A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox

	arm_func_start IsAdvancedTextBoxActive
IsAdvancedTextBoxActive: ; 0x020308C4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedTextBoxActive

#ifndef JAPAN
	arm_func_start sub_020308E4
sub_020308E4: ; 0x020308E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	ldrneb r0, [r0, #0x1c1]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020308E4
#endif

	arm_func_start sub_02030908
sub_02030908: ; 0x02030908
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030938
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedItemOnPage
	ldmia sp!, {r3, pc}
_02030938:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030908

	arm_func_start GetDigitInputResult
GetDigitInputResult: ; 0x02030940
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030970
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
_02030970:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetDigitInputResult

	arm_func_start sub_02030978
sub_02030978: ; 0x02030978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetWindowContents
	mov r1, r0
	strh r5, [r1, #0xfc]
	strh r4, [r1, #0xfe]
	mov r0, r7
	mov r2, r6
	mov r3, r5
	add r1, r1, #4
	str r4, [sp]
	bl sub_020289B8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02030978

	arm_func_start sub_020309B8
sub_020309B8: ; 0x020309B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r1, r0
	strh r6, [r1, #0xfc]
	ldr r4, [sp, #0x28]
	strh r5, [r1, #0xfe]
	add ip, r1, #0x100
	ldr lr, [sp, #0x2c]
	strh r4, [ip]
	strh lr, [ip, #2]
	str r5, [sp]
	mov r0, r8
	add r1, r1, #4
	mov r2, r7
	mov r3, r6
	stmib sp, {r4, lr}
	bl sub_02028A08
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020309B8
