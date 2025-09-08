	.include "asm/macros.inc"
	.include "main_0204B018.inc"

	.text

	arm_func_start sub_0204B018
sub_0204B018: ; 0x0204B018
	ldr r1, _0204B024 ; =GAME_MODE
	strb r0, [r1]
	bx lr
	.align 2, 0
_0204B024: .word GAME_MODE
	arm_func_end sub_0204B018

	arm_func_start sub_0204B028
sub_0204B028: ; 0x0204B028
	ldr r1, _0204B040 ; =_0209DF70
	ldr ip, _0204B044 ; =Debug_Print0
	ldr r0, _0204B048 ; =_0209CF0C
	ldrsh r1, [r1, #0x24]
	mov r2, #0x400
	bx ip
	.align 2, 0
_0204B040: .word _0209DF70
_0204B044: .word Debug_Print0
_0204B048: .word _0209CF0C
	arm_func_end sub_0204B028

	arm_func_start InitScriptVariableValues
InitScriptVariableValues: ; 0x0204B04C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r1, #0
	ldr r0, _0204B2F8 ; =SCRIPT_VARS_VALUES
	mov r7, r1
_0204B05C:
	strb r7, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x400
	blt _0204B05C
	mov r4, #0
	ldr r6, _0204B2FC ; =SCRIPT_VARS
	mov r5, r4
_0204B078:
	mov r0, r7, lsl #4
	ldrsh r0, [r6, r0]
	add r8, r6, r7, lsl #4
	cmp r0, #0
	cmpne r0, #9
	beq _0204B0C4
	mov sb, r5
	b _0204B0B8
_0204B098:
	ldrsh r3, [r8, #0xa]
	mov r0, r4
	mov r1, r7
	mov r2, sb
	bl SaveScriptVariableValueAtIndex
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
_0204B0B8:
	ldrsh r0, [r8, #8]
	cmp sb, r0
	blt _0204B098
_0204B0C4:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x72
	blt _0204B078
	mov r0, #0
	mov r2, r0
	mov r1, #0x46
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #1
	bl ZinitScriptVariable
	bl InitEventFlagScriptVars
	mov sl, #0
#ifdef JAPAN
	mov sb, sl
	mov r8, #0x21
	mov r7, #0x13c
	mov r6, sl
	mov r5, #0x22
	mov fp, sl
	mvn r4, #0
#else
	ldr r7, _0204B300 ; =0x00000137
	mov sb, sl
#ifdef EUROPE
	sub r4, r7, #0x144
#else
	sub r4, r7, #0x138
#endif
	mov r8, #0x21
	mov r6, sl
	mov r5, #0x22
	mov fp, sl
#endif
_0204B118:
	mov r2, sl, lsl #0x10
	mov r0, sb
	mov r1, r8
	mov r2, r2, lsr #0x10
	mov r3, r7
	bl SaveScriptVariableValueAtIndex
	mov r2, sl, lsl #0x10
	mov r0, r6
	mov r1, r5
	mov r2, r2, lsr #0x10
	mov r3, r6
	bl SaveScriptVariableValueAtIndex
	mov r2, sl, lsl #0x10
	mov r0, fp
	mov r1, #0x23
	mov r2, r2, lsr #0x10
#ifdef JAPAN
	mov r3, #0x13c
#else
	mov r3, r7
#endif
	bl SaveScriptVariableValueAtIndex
	mov r2, sl, lsl #0x10
	mov r0, #0
	mov r1, #0x24
	mov r2, r2, lsr #0x10
	mov r3, r4
	bl SaveScriptVariableValueAtIndex
	mov r2, sl, lsl #0x10
	mov r0, #0
	mov r1, #0x25
	mov r2, r2, lsr #0x10
	mov r3, #0xbb
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, sl, lsl #0x10
	mov r1, #0x2d
	mov r2, r2, lsr #0x10
	mov r3, r0
	bl SaveScriptVariableValueAtIndex
	mov r2, sl, lsl #0x10
	mov r0, #0
	mov r1, #0x2f
	mov r2, r2, lsr #0x10
	mov r3, r4
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, sl, lsl #0x10
	mov r1, #0x31
	mov r2, r2, lsr #0x10
	mov r3, r0
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, sl, lsl #0x10
	mov r1, #0x32
	mov r2, r2, lsr #0x10
	mov r3, r0
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, sl, lsl #0x10
	mov r1, #0x37
	mov r2, r2, lsr #0x10
	mov r3, r0
	bl SaveScriptVariableValueAtIndex
	mov r2, sl, lsl #0x10
	mov r0, #0
	mov r1, #0x38
	mov r2, r2, lsr #0x10
	mov r3, #2
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, sl, lsl #0x10
	mov r1, #0x39
	mov r2, r2, lsr #0x10
	mov r3, r0
	bl SaveScriptVariableValueAtIndex
	add sl, sl, #1
	cmp sl, #4
	blt _0204B118
	mov r1, #0x26
	sub r2, r1, #0x27
	mov r0, #0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x33
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6e
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x3e
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x40
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x42
	mov r2, #4
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x43
	mov r2, #1
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x4a
	sub r2, r1, #0x4b
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x4b
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x4c
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x4d
	bl ZinitScriptVariable
	bl InitScenarioScriptVars
	bl InitWorldMapScriptVars
	bl InitDungeonListScriptVars
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204B2F8: .word SCRIPT_VARS_VALUES
_0204B2FC: .word SCRIPT_VARS
#if defined(EUROPE)
_0204B300: .word 0x00000143
#elif !defined(JAPAN)
_0204B300: .word 0x00000137
#endif
	arm_func_end InitScriptVariableValues

	arm_func_start InitEventFlagScriptVars
InitEventFlagScriptVars: ; 0x0204B304
	stmdb sp!, {r3, lr}
#ifdef JAPAN
	mov r0, #0
	mov r1, #0x1c
	mov r2, #0x13c
#else
	ldr r2, _0204B3CC ; =0x00000137
	mov r0, #0
	mov r1, #0x1c
#endif
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x1d
	bl SaveScriptVariableValue
#ifdef JAPAN
	mov r0, #0
	mov r1, #0x1e
	mov r2, #0x13c
#else
	ldr r2, _0204B3CC ; =0x00000137
	mov r0, #0
	mov r1, #0x1e
#endif
	bl SaveScriptVariableValue
	mov r1, #0x1f
	sub r2, r1, #0x20
	mov r0, #0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x20
	mov r2, #0xbb
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x27
	mov r2, r0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x29
	sub r2, r1, #0x2a
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2b
	mov r2, r0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2c
	mov r2, r0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x34
	mov r2, r0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x35
	mov r2, #2
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x36
	mov r2, r0
	bl SaveScriptVariableValue
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_0204B3CC: .word 0x00000143
#elif !defined(JAPAN)
_0204B3CC: .word 0x00000137
#endif
	arm_func_end InitEventFlagScriptVars

	arm_func_start sub_0204B3D0
sub_0204B3D0: ; 0x0204B3D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	cmp r4, #0x400
	mov r5, r0
	ldrlt r0, _0204B42C ; =SCRIPT_VARS
	ldrge r1, _0204B430 ; =SCRIPT_VARS_LOCALS
	addlt r7, r0, r4, lsl #4
	subge r0, r4, #0x400
	addge r7, r1, r0, lsl #4
	mov r6, #0
	b _0204B41C
_0204B3FC:
	ldrsh r3, [r7, #0xa]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl SaveScriptVariableValueAtIndex
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
_0204B41C:
	ldrsh r0, [r7, #8]
	cmp r6, r0
	blt _0204B3FC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0204B42C: .word SCRIPT_VARS
_0204B430: .word SCRIPT_VARS_LOCALS
	arm_func_end sub_0204B3D0

	arm_func_start ZinitScriptVariable
ZinitScriptVariable: ; 0x0204B434
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	cmp r5, #0x400
	mov r6, r0
	ldrlt r0, _0204B494 ; =SCRIPT_VARS
	mov r8, #0
	addlt r4, r0, r5, lsl #4
	ldrge r1, _0204B498 ; =SCRIPT_VARS_LOCALS
	subge r0, r5, #0x400
	addge r4, r1, r0, lsl #4
	mov r7, r8
	b _0204B484
_0204B464:
	mov r0, r6
	mov r1, r5
	mov r2, r8
	mov r3, r7
	bl SaveScriptVariableValueAtIndex
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
_0204B484:
	ldrsh r0, [r4, #8]
	cmp r8, r0
	blt _0204B464
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0204B494: .word SCRIPT_VARS
_0204B498: .word SCRIPT_VARS_LOCALS
	arm_func_end ZinitScriptVariable

	arm_func_start LoadScriptVariableRaw
LoadScriptVariableRaw: ; 0x0204B49C
	cmp r2, #0x400
	bge _0204B4C0
	ldr r1, _0204B4E0 ; =SCRIPT_VARS
	ldr r3, _0204B4E4 ; =SCRIPT_VARS_VALUES
	add r1, r1, r2, lsl #4
	str r1, [r0]
	ldrsh r1, [r1, #4]
	add r1, r3, r1
	b _0204B4D8
_0204B4C0:
	ldr r3, _0204B4E8 ; =SCRIPT_VARS_LOCALS
	sub r2, r2, #0x400
	add r2, r3, r2, lsl #4
	str r2, [r0]
	ldrsh r2, [r2, #4]
	add r1, r1, r2, lsl #2
_0204B4D8:
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_0204B4E0: .word SCRIPT_VARS
_0204B4E4: .word SCRIPT_VARS_VALUES
_0204B4E8: .word SCRIPT_VARS_LOCALS
	arm_func_end LoadScriptVariableRaw

	arm_func_start LoadScriptVariableValue
LoadScriptVariableValue: ; 0x0204B4EC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r2, r0
	mov r4, r1
	mov r1, r2
	add r0, sp, #0
	mov r2, r4
	bl LoadScriptVariableRaw
	ldr r1, [sp]
	ldrsh r0, [r1]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0204B66C
_0204B520: ; jump table
	b _0204B66C ; case 0
	b _0204B548 ; case 1
	b _0204B56C ; case 2
	b _0204B56C ; case 3
	b _0204B578 ; case 4
	b _0204B584 ; case 5
	b _0204B590 ; case 6
	b _0204B59C ; case 7
	b _0204B59C ; case 8
	b _0204B5A8 ; case 9
_0204B548:
	ldrsh r1, [r1, #6]
	ldr r2, [sp, #4]
	mov r0, #1
	mov r1, r0, lsl r1
	ldrb r2, [r2]
	and r1, r1, #0xff
	tst r2, r1
	moveq r0, #0
	b _0204B670
_0204B56C:
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	b _0204B670
_0204B578:
	ldr r0, [sp, #4]
	ldrsb r0, [r0]
	b _0204B670
_0204B584:
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	b _0204B670
_0204B590:
	ldr r0, [sp, #4]
	ldrsh r0, [r0]
	b _0204B670
_0204B59C:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	b _0204B670
_0204B5A8:
	cmp r4, #0x48
	bgt _0204B5E4
	bge _0204B62C
	cmp r4, #0x3d
	bgt _0204B5D8
	subs r0, r4, #0x3a
	addpl pc, pc, r0, lsl #2
	b _0204B66C
_0204B5C8: ; jump table
	b _0204B600 ; case 0
	b _0204B608 ; case 1
	b _0204B614 ; case 2
	b _0204B61C ; case 3
_0204B5D8:
	cmp r4, #0x47
	beq _0204B624
	b _0204B66C
_0204B5E4:
	cmp r4, #0x49
	bgt _0204B5F4
	beq _0204B634
	b _0204B66C
_0204B5F4:
	cmp r4, #0x70
	beq _0204B664
	b _0204B66C
_0204B600:
	mov r0, #1
	b _0204B670
_0204B608:
	mov r0, #0
	bl GetPartyMembers
	b _0204B670
_0204B614:
	bl GetMoneyCarried
	b _0204B670
_0204B61C:
	bl GetMoneyStored
	b _0204B670
_0204B624:
	bl GetLanguageType
	b _0204B670
_0204B62C:
	bl GetGameMode
	b _0204B670
_0204B634:
	bl GetGameMode
	cmp r0, #1
	beq _0204B64C
	cmp r0, #3
	beq _0204B654
	b _0204B65C
_0204B64C:
	bl sub_0204C918
	b _0204B670
_0204B654:
	bl GetSpecialEpisodeType
	b _0204B670
_0204B65C:
	mvn r0, #0
	b _0204B670
_0204B664:
	bl GetNotifyNote
	b _0204B670
_0204B66C:
	mov r0, #0
_0204B670:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end LoadScriptVariableValue

	arm_func_start LoadScriptVariableValueAtIndex
LoadScriptVariableValueAtIndex: ; 0x0204B678
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r1, r3
	mov r2, r5
	bl LoadScriptVariableRaw
	ldr r1, [sp]
	ldrsh r0, [r1]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0204B814
_0204B6B0: ; jump table
	b _0204B814 ; case 0
	b _0204B6D8 ; case 1
	b _0204B70C ; case 2
	b _0204B70C ; case 3
	b _0204B718 ; case 4
	b _0204B724 ; case 5
	b _0204B734 ; case 6
	b _0204B744 ; case 7
	b _0204B744 ; case 8
	b _0204B750 ; case 9
_0204B6D8:
	ldrsh r1, [r1, #6]
	ldr r2, [sp, #4]
	mov r0, #1
	add r1, r4, r1
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	and r1, r3, #7
	mov r1, r0, lsl r1
	ldrb r2, [r2, r3, lsr #3]
	and r1, r1, #0xff
	tst r2, r1
	moveq r0, #0
	b _0204B818
_0204B70C:
	ldr r0, [sp, #4]
	ldrb r0, [r0, r4]
	b _0204B818
_0204B718:
	ldr r0, [sp, #4]
	ldrsb r0, [r0, r4]
	b _0204B818
_0204B724:
	ldr r1, [sp, #4]
	mov r0, r4, lsl #1
	ldrh r0, [r1, r0]
	b _0204B818
_0204B734:
	ldr r1, [sp, #4]
	mov r0, r4, lsl #1
	ldrsh r0, [r1, r0]
	b _0204B818
_0204B744:
	ldr r0, [sp, #4]
	ldr r0, [r0, r4, lsl #2]
	b _0204B818
_0204B750:
	cmp r5, #0x48
	bgt _0204B78C
	bge _0204B7D4
	cmp r5, #0x3d
	bgt _0204B780
	subs r0, r5, #0x3a
	addpl pc, pc, r0, lsl #2
	b _0204B814
_0204B770: ; jump table
	b _0204B7A8 ; case 0
	b _0204B7B0 ; case 1
	b _0204B7BC ; case 2
	b _0204B7C4 ; case 3
_0204B780:
	cmp r5, #0x47
	beq _0204B7CC
	b _0204B814
_0204B78C:
	cmp r5, #0x49
	bgt _0204B79C
	beq _0204B7DC
	b _0204B814
_0204B79C:
	cmp r5, #0x70
	beq _0204B80C
	b _0204B814
_0204B7A8:
	mov r0, #1
	b _0204B818
_0204B7B0:
	mov r0, #0
	bl GetPartyMembers
	b _0204B818
_0204B7BC:
	bl GetMoneyCarried
	b _0204B818
_0204B7C4:
	bl GetMoneyStored
	b _0204B818
_0204B7CC:
	bl GetLanguageType
	b _0204B818
_0204B7D4:
	bl GetGameMode
	b _0204B818
_0204B7DC:
	bl GetGameMode
	cmp r0, #1
	beq _0204B7F4
	cmp r0, #3
	beq _0204B7FC
	b _0204B804
_0204B7F4:
	bl sub_0204C918
	b _0204B818
_0204B7FC:
	bl GetSpecialEpisodeType
	b _0204B818
_0204B804:
	mvn r0, #0
	b _0204B818
_0204B80C:
	bl GetNotifyNote
	b _0204B818
_0204B814:
	mov r0, #0
_0204B818:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end LoadScriptVariableValueAtIndex

	arm_func_start SaveScriptVariableValue
SaveScriptVariableValue: ; 0x0204B820
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r1, r3
	mov r2, r5
	bl LoadScriptVariableRaw
	ldr r1, [sp]
	ldrsh r0, [r1]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0204B980
_0204B858: ; jump table
	b _0204B980 ; case 0
	b _0204B880 ; case 1
	b _0204B8C0 ; case 2
	b _0204B8C0 ; case 3
	b _0204B8CC ; case 4
	b _0204B8D8 ; case 5
	b _0204B8E4 ; case 6
	b _0204B8F0 ; case 7
	b _0204B8F0 ; case 8
	b _0204B8FC ; case 9
_0204B880:
	ldrsh r0, [r1, #6]
	mov r1, #1
	cmp r4, #0
	mov r0, r1, lsl r0
	ldrne r1, [sp, #4]
	and r2, r0, #0xff
	ldrneb r0, [r1]
	orrne r0, r0, r2
	strneb r0, [r1]
	bne _0204B980
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	orr r0, r0, r2
	eor r0, r2, r0
	strb r0, [r1]
	b _0204B980
_0204B8C0:
	ldr r0, [sp, #4]
	strb r4, [r0]
	b _0204B980
_0204B8CC:
	ldr r0, [sp, #4]
	strb r4, [r0]
	b _0204B980
_0204B8D8:
	ldr r0, [sp, #4]
	strh r4, [r0]
	b _0204B980
_0204B8E4:
	ldr r0, [sp, #4]
	strh r4, [r0]
	b _0204B980
_0204B8F0:
	ldr r0, [sp, #4]
	str r4, [r0]
	b _0204B980
_0204B8FC:
	cmp r5, #0x49
	bgt _0204B928
	bge _0204B954
	cmp r5, #0x3d
	bgt _0204B980
	cmp r5, #0x3c
	blt _0204B980
	beq _0204B934
	cmp r5, #0x3d
	beq _0204B948
	b _0204B980
_0204B928:
	cmp r5, #0x70
	beq _0204B96C
	b _0204B980
_0204B934:
	mov r0, r4
	bl SetMoneyCarried
	mov r0, #0
	bl AddMoneyCarried
	b _0204B980
_0204B948:
	mov r0, r4
	bl SetMoneyStored
	b _0204B980
_0204B954:
	bl GetGameMode
	cmp r0, #1
	bne _0204B980
	mov r0, r4
	bl sub_0204C928
	b _0204B980
_0204B96C:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bl SetNotifyNote
_0204B980:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SaveScriptVariableValue

	arm_func_start SaveScriptVariableValueAtIndex
SaveScriptVariableValueAtIndex: ; 0x0204B988
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov r1, r4
	add r0, sp, #0
	mov r2, r6
	mov r4, r3
	bl LoadScriptVariableRaw
	ldr r1, [sp]
	ldrsh r0, [r1]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0204BAF8
_0204B9C4: ; jump table
	b _0204BAF8 ; case 0
	b _0204B9EC ; case 1
	b _0204BA30 ; case 2
	b _0204BA30 ; case 3
	b _0204BA3C ; case 4
	b _0204BA48 ; case 5
	b _0204BA58 ; case 6
	b _0204BA68 ; case 7
	b _0204BA68 ; case 8
	b _0204BA74 ; case 9
_0204B9EC:
	ldrsh r0, [r1, #6]
	mov r1, #1
	ldr r2, [sp, #4]
	add r0, r5, r0
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	and r0, r3, #7
	mov r0, r1, lsl r0
	and r1, r0, #0xff
	ldrb r0, [r2, r3, lsr #3]
	cmp r4, #0
	orrne r0, r0, r1
	strneb r0, [r2, r3, lsr #3]
	orreq r0, r0, r1
	eoreq r0, r1, r0
	streqb r0, [r2, r3, lsr #3]
	b _0204BAF8
_0204BA30:
	ldr r0, [sp, #4]
	strb r4, [r0, r5]
	b _0204BAF8
_0204BA3C:
	ldr r0, [sp, #4]
	strb r4, [r0, r5]
	b _0204BAF8
_0204BA48:
	ldr r1, [sp, #4]
	mov r0, r5, lsl #1
	strh r4, [r1, r0]
	b _0204BAF8
_0204BA58:
	ldr r1, [sp, #4]
	mov r0, r5, lsl #1
	strh r4, [r1, r0]
	b _0204BAF8
_0204BA68:
	ldr r0, [sp, #4]
	str r4, [r0, r5, lsl #2]
	b _0204BAF8
_0204BA74:
	cmp r6, #0x49
	bgt _0204BAA0
	bge _0204BACC
	cmp r6, #0x3d
	bgt _0204BAF8
	cmp r6, #0x3c
	blt _0204BAF8
	beq _0204BAAC
	cmp r6, #0x3d
	beq _0204BAC0
	b _0204BAF8
_0204BAA0:
	cmp r6, #0x70
	beq _0204BAE4
	b _0204BAF8
_0204BAAC:
	mov r0, r4
	bl SetMoneyCarried
	mov r0, #0
	bl AddMoneyCarried
	b _0204BAF8
_0204BAC0:
	mov r0, r4
	bl SetMoneyStored
	b _0204BAF8
_0204BACC:
	bl GetGameMode
	cmp r0, #1
	bne _0204BAF8
	mov r0, r4
	bl sub_0204C928
	b _0204BAF8
_0204BAE4:
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bl SetNotifyNote
_0204BAF8:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SaveScriptVariableValueAtIndex

	arm_func_start LoadScriptVariableValueSum
LoadScriptVariableValueSum: ; 0x0204BB00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r1
	mov r4, #0
	mov r7, r0
	add r0, sp, #0
	mov r1, r4
	mov r2, r6
	bl LoadScriptVariableRaw
	mov r5, r4
	b _0204BB48
_0204BB2C:
	mov r2, r5, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	add r4, r4, r0
	add r5, r5, #1
_0204BB48:
	ldr r0, [sp]
	ldrsh r0, [r0, #8]
	cmp r5, r0
	blt _0204BB2C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LoadScriptVariableValueSum

	arm_func_start LoadScriptVariableValueBytes
LoadScriptVariableValueBytes: ; 0x0204BB64
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r2, r3
	mov r1, #0
	bl LoadScriptVariableRaw
	ldr r2, [sp, #4]
	mov r1, #0
	b _0204BBA0
_0204BB94:
	ldrb r0, [r2], #1
	add r1, r1, #1
	strb r0, [r5], #1
_0204BBA0:
	cmp r1, r4
	blt _0204BB94
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end LoadScriptVariableValueBytes

	arm_func_start sub_0204BBB0
sub_0204BBB0: ; 0x0204BBB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl LoadScriptVariableValueBytes
	mov r0, #0
	strb r0, [r5, r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204BBB0

	arm_func_start SaveScriptVariableValueBytes
SaveScriptVariableValueBytes: ; 0x0204BBCC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r2, r3
	mov r1, #0
	bl LoadScriptVariableRaw
	ldr r2, [sp, #4]
	mov r1, #0
	b _0204BC08
_0204BBFC:
	ldrb r0, [r5], #1
	add r1, r1, #1
	strb r0, [r2], #1
_0204BC08:
	cmp r1, r4
	blt _0204BBFC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SaveScriptVariableValueBytes

	arm_func_start ScriptVariablesEqual
ScriptVariablesEqual: ; 0x0204BC18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r7, r1
	mov r6, r2
	add r0, sp, #8
	mov r1, r8
	mov r2, r7
	bl LoadScriptVariableRaw
	add r0, sp, #0
	mov r1, r8
	mov r2, r6
	bl LoadScriptVariableRaw
	ldr r0, [sp, #8]
	mov r5, #0
	ldrsh r4, [r0, #8]
	b _0204BC98
_0204BC5C:
	mov r2, r5, lsl #0x10
	mov r0, r8
	mov r1, r7
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r5, lsl #0x10
	mov sb, r0
	mov r0, r8
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	cmp sb, r0
	movne r0, #0
	bne _0204BCA4
	add r5, r5, #1
_0204BC98:
	cmp r5, r4
	blt _0204BC5C
	mov r0, #1
_0204BCA4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ScriptVariablesEqual

	arm_func_start sub_0204BCAC
sub_0204BCAC: ; 0x0204BCAC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	cmp r2, #0xb
	addls pc, pc, r2, lsl #2
	b _0204BD68
_0204BCC0: ; jump table
	b _0204BCF0 ; case 0
	b _0204BCF8 ; case 1
	b _0204BD00 ; case 2
	b _0204BD08 ; case 3
	b _0204BD14 ; case 4
	b _0204BD1C ; case 5
	b _0204BD28 ; case 6
	b _0204BD30 ; case 7
	b _0204BD38 ; case 8
	b _0204BD40 ; case 9
	b _0204BD4C ; case 10
	b _0204BD5C ; case 11
_0204BCF0:
	mov r0, r1
	b _0204BD88
_0204BCF8:
	sub r0, r0, r1
	b _0204BD88
_0204BD00:
	add r0, r0, r1
	b _0204BD88
_0204BD08:
	mul r1, r0, r1
	mov r0, r1
	b _0204BD88
_0204BD14:
	bl _s32_div_f
	b _0204BD88
_0204BD1C:
	bl _s32_div_f
	mov r0, r1
	b _0204BD88
_0204BD28:
	and r0, r0, r1
	b _0204BD88
_0204BD30:
	orr r0, r0, r1
	b _0204BD88
_0204BD38:
	eor r0, r0, r1
	b _0204BD88
_0204BD40:
	mov r2, #1
	orr r0, r0, r2, lsl r1
	b _0204BD88
_0204BD4C:
	mov r2, #1
	mvn r1, r2, lsl r1
	and r0, r0, r1
	b _0204BD88
_0204BD5C:
	mov r0, r1
	bl RandInt
	b _0204BD88
_0204BD68:
	ldr r1, _0204BD90 ; =_0209CEAC
	add r0, sp, #0
	ldr r3, [r1, #4]
	ldr ip, [r1]
	ldr r1, _0204BD94 ; =_0209CF28
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_0204BD88:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204BD90: .word _0209CEAC
_0204BD94: .word _0209CF28
	arm_func_end sub_0204BCAC

	arm_func_start sub_0204BD98
sub_0204BD98: ; 0x0204BD98
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _0204BE9C
_0204BDAC: ; jump table
	b _0204BDD8 ; case 0
	b _0204BDE0 ; case 1
	b _0204BDE8 ; case 2
	b _0204BE10 ; case 3
	b _0204BE38 ; case 4
	b _0204BE24 ; case 5
	b _0204BE4C ; case 6
	b _0204BDFC ; case 7
	b _0204BE60 ; case 8
	b _0204BE74 ; case 9
	b _0204BE88 ; case 10
_0204BDD8:
	mov r0, #1
	b _0204BEBC
_0204BDE0:
	mov r0, #0
	b _0204BEBC
_0204BDE8:
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BDFC:
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE10:
	cmp r0, r1
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE24:
	cmp r0, r1
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE38:
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE4C:
	cmp r0, r1
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE60:
	tst r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE74:
	teq r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _0204BEBC
_0204BE88:
	mov r2, #1
	tst r0, r2, lsl r1
	moveq r2, #0
	and r0, r2, #0xff
	b _0204BEBC
_0204BE9C:
	ldr r1, _0204BEC4 ; =_0209CEAC
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _0204BEC8 ; =_0209CF48
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_0204BEBC:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204BEC4: .word _0209CEAC
_0204BEC8: .word _0209CF48
	arm_func_end sub_0204BD98

	arm_func_start sub_0204BECC
sub_0204BECC: ; 0x0204BECC
	ldr ip, _0204BED4 ; =sub_0204BCAC
	bx ip
	.align 2, 0
_0204BED4: .word sub_0204BCAC
	arm_func_end sub_0204BECC

	arm_func_start sub_0204BED8
sub_0204BED8: ; 0x0204BED8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r4, r3
	mov r7, r0
	mov r6, r1
	bl LoadScriptVariableValue
	mov r1, r5
	mov r2, r4
	bl sub_0204BCAC
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl SaveScriptVariableValue
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204BED8

	arm_func_start sub_0204BF10
sub_0204BF10: ; 0x0204BF10
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r6, r2
	mov r7, r1
	mov r5, r3
	bl LoadScriptVariableValue
	mov r4, r0
	mov r0, r8
	mov r1, r6
	bl LoadScriptVariableValue
	mov r1, r0
	mov r0, r4
	mov r2, r5
	bl sub_0204BCAC
	mov r2, r0
	mov r0, r8
	mov r1, r7
	bl SaveScriptVariableValue
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0204BF10

	arm_func_start sub_0204BF5C
sub_0204BF5C: ; 0x0204BF5C
	ldr ip, _0204BF64 ; =sub_0204BD98
	bx ip
	.align 2, 0
_0204BF64: .word sub_0204BD98
	arm_func_end sub_0204BF5C

	arm_func_start sub_0204BF68
sub_0204BF68: ; 0x0204BF68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r2
	mov r4, r3
	bl LoadScriptVariableValue
	mov r1, r5
	mov r2, r4
	bl sub_0204BD98
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204BF68

	arm_func_start sub_0204BF88
sub_0204BF88: ; 0x0204BF88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r2
	mov r5, r3
	bl LoadScriptVariableValue
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl LoadScriptVariableValue
	mov r1, r0
	mov r0, r4
	mov r2, r5
	bl sub_0204BD98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204BF88

	arm_func_start EventFlagResume
EventFlagResume: ; 0x0204BFC0
	stmdb sp!, {r4, lr}
	bl GetGameMode
	cmp r0, #1
	ldmlsia sp!, {r4, pc}
	sub r4, r0, #2
	ldr r0, _0204C1E0 ; =_0209CF64
	mov r1, r4
	bl Debug_Print0
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x21
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x1c
	bl SaveScriptVariableValue
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x22
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x1d
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x23
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x1e
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x24
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x1f
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x25
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x20
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2d
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x27
	bl SaveScriptVariableValue
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x2e
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x28
	bl SaveScriptVariableValue
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x2f
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x29
	bl SaveScriptVariableValue
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x30
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x2a
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x31
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x2b
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x32
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x2c
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x37
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x34
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x38
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x35
	bl SaveScriptVariableValue
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x39
	bl LoadScriptVariableValueAtIndex
	mov r2, r0
	mov r0, #0
	mov r1, #0x36
	bl SaveScriptVariableValue
	bl sub_0204CBE8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204C1E0: .word _0209CF64
	arm_func_end EventFlagResume

	arm_func_start EventFlagBackup
EventFlagBackup: ; 0x0204C1E4
	stmdb sp!, {r4, lr}
	bl GetGameMode
	cmp r0, #1
	ldmlsia sp!, {r4, pc}
	sub r4, r0, #2
	ldr r0, _0204C404 ; =_0209CF84
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	mov r1, #0x1c
	bl LoadScriptVariableValue
	mov r1, r4, lsl #0x10
	mov r3, r0
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x21
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x1d
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x22
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x1e
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x23
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x1f
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x24
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x25
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x2d
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r1, r4, lsl #0x10
	mov r3, r0
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x2e
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r1, r4, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r3, r0
	mov r0, #0
	mov r1, #0x2f
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x2a
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x30
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x2b
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x31
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x2c
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x32
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x34
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, #0
	mov r1, #0x37
	mov r2, r4, lsl #0x10
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x35
	bl LoadScriptVariableValue
	mov r3, r0
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x38
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #0x36
	bl LoadScriptVariableValue
	mov r1, r4, lsl #0x10
	mov r3, r0
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x39
	bl SaveScriptVariableValueAtIndex
	bl ScenarioFlagBackup
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204C404: .word _0209CF84
	arm_func_end EventFlagBackup

	arm_func_start DumpScriptVariableValues
DumpScriptVariableValues: ; 0x0204C408
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EventFlagBackup
	ldr r1, _0204C42C ; =SCRIPT_VARS_VALUES
	mov r0, r4
	mov r2, #0x400
	bl MemcpySimple
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204C42C: .word SCRIPT_VARS_VALUES
	arm_func_end DumpScriptVariableValues

	arm_func_start RestoreScriptVariableValues
RestoreScriptVariableValues: ; 0x0204C430
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r1, #0
	mov r4, r0
	add r0, sp, #0
	mov r2, r1
	bl LoadScriptVariableRaw
	ldr r0, _0204C484 ; =SCRIPT_VARS_VALUES
	mov r1, r4
	mov r2, #0x400
	bl MemcpySimple
	ldr r1, [sp]
	ldr r0, [sp, #4]
	ldrsh r1, [r1, #0xa]
	ldr r0, [r0]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204C484: .word SCRIPT_VARS_VALUES
	arm_func_end RestoreScriptVariableValues

	arm_func_start InitScenarioScriptVars
InitScenarioScriptVars: ; 0x0204C488
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r1, #0
	mov r2, r1
	mov r0, #2
	bl SetScenarioScriptVar
	mov r1, #0
	mov r2, r1
	mov r0, #3
	bl SetScenarioScriptVar
	mov r1, #0
	mov r2, r1
	mov r0, #4
	bl SetScenarioScriptVar
	mov r1, #0
	mov r2, r1
	mov r0, #5
	bl SetScenarioScriptVar
	mov r1, #0
	mov r2, r1
	mov r0, #6
	bl SetScenarioScriptVar
	mov r1, #0
	mov r0, #7
	mov r2, r1
	bl SetScenarioScriptVar
	mov r1, #0
	mov r0, #8
	mov r2, r1
	bl SetScenarioScriptVar
	mov r1, #0
	mov r0, #9
	mov r2, r1
	bl SetScenarioScriptVar
	mov r1, #0
	mov r0, #0xa
	mov r2, r1
	bl SetScenarioScriptVar
	mov r1, #0
	mov r0, #0xb
	mov r2, r1
	bl SetScenarioScriptVar
	mov r1, #0
	mov r0, #0xc
	mov r2, r1
	bl SetScenarioScriptVar
	mov r0, #0
	mov r1, #0x11
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x1b
	bl ZinitScriptVariable
	mov r8, #0
	mov r6, #0x1a
	mov r7, r8
	mov r5, r8
	mov r4, r6
_0204C568:
	mov r2, r8, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r3, r7
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	add r0, r8, #4
	mov r2, r0, lsl #0x10
	mov r0, r5
	mov r1, r4
	mov r3, r5
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	add r8, r8, #1
	cmp r8, #4
	blt _0204C568
	mov r0, #0
	mov r2, r0
	mov r1, #0x13
	bl SaveScriptVariableValue
	mov r1, #0x14
	sub r2, r1, #0x15
	mov r0, #0
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6f
	bl SaveScriptVariableValue
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end InitScenarioScriptVars

	arm_func_start sub_0204C5DC
sub_0204C5DC: ; 0x0204C5DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0
	mov r4, r2
	mov r1, r6
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	str r0, [r5]
	mov r1, r6
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	str r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0204C5DC

	arm_func_start SetScenarioScriptVar
SetScenarioScriptVar: ; 0x0204C618
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r7, r1
	mov r0, #0
	mov r6, r2
	mov r1, r8
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	mov r5, r0
	mov r1, r8
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	stmia sp, {r4, r7}
	ldr r1, _0204C6C4 ; =_0209DFA0
	mov r0, #9
	mov r2, r8
	mov r3, r5
	str r6, [sp, #8]
	bl Debug_Print
	cmp r8, #3
	bne _0204C694
	cmp r7, r5
	cmpeq r6, r4
	beq _0204C694
	mov r0, #0
	mov r2, r0
	mov r1, #0x33
	bl SaveScriptVariableValue
_0204C694:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	mov r3, r7
	bl SaveScriptVariableValueAtIndex
	mov r1, r8
	mov r3, r6
	mov r0, #0
	mov r2, #1
	bl SaveScriptVariableValueAtIndex
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0204C6C4: .word _0209DFA0
	arm_func_end SetScenarioScriptVar

	arm_func_start sub_0204C6C8
sub_0204C6C8: ; 0x0204C6C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov r5, r2
	mov r1, r7
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	mov r1, r7
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r4, #0x35
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, r6
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	bne _0204C72C
	cmp r5, #0
	blt _0204C72C
	cmp r0, r5
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
_0204C72C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204C6C8

	arm_func_start sub_0204C734
sub_0204C734: ; 0x0204C734
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov r5, r2
	mov r1, r7
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	mov r1, r7
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r4, #0x35
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, r6
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	bne _0204C7A4
	cmp r5, #0
	blt _0204C79C
	cmp r0, r5
	bgt _0204C7A4
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204C79C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204C7A4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204C734

	arm_func_start sub_0204C7AC
sub_0204C7AC: ; 0x0204C7AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov r5, r2
	mov r1, r7
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	mov r1, r7
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r4, r6
	bne _0204C800
	cmp r5, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, r5
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0204C800:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204C7AC

	arm_func_start sub_0204C808
sub_0204C808: ; 0x0204C808
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov r5, r2
	mov r1, r7
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	mov r1, r7
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r4, #0x35
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, r6
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
	bne _0204C878
	cmp r5, #0
	blt _0204C870
	cmp r0, r5
	blt _0204C878
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204C870:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204C878:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204C808

	arm_func_start sub_0204C880
sub_0204C880: ; 0x0204C880
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov r5, r2
	mov r1, r7
	mov r2, r0
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	mov r1, r7
	mov r0, #0
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r4, #0x35
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, r6
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
	bne _0204C8E4
	cmp r5, #0
	blt _0204C8E4
	cmp r0, r5
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
_0204C8E4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204C880

	arm_func_start GetSpecialEpisodeType
GetSpecialEpisodeType: ; 0x0204C8EC
	ldr ip, _0204C8FC ; =LoadScriptVariableValue
	mov r0, #0
	mov r1, #0x4a
	bx ip
	.align 2, 0
_0204C8FC: .word LoadScriptVariableValue
	arm_func_end GetSpecialEpisodeType

	arm_func_start SetSpecialEpisodeType
SetSpecialEpisodeType: ; 0x0204C900
	ldr ip, _0204C914 ; =SaveScriptVariableValue
	mov r2, r0
	mov r0, #0
	mov r1, #0x4a
	bx ip
	.align 2, 0
_0204C914: .word SaveScriptVariableValue
	arm_func_end SetSpecialEpisodeType

	arm_func_start sub_0204C918
sub_0204C918: ; 0x0204C918
	ldr r0, _0204C924 ; =DEBUG_SPECIAL_EPISODE_NUMBER
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0204C924: .word DEBUG_SPECIAL_EPISODE_NUMBER
	arm_func_end sub_0204C918

	arm_func_start sub_0204C928
sub_0204C928: ; 0x0204C928
	ldr r1, _0204C934 ; =DEBUG_SPECIAL_EPISODE_NUMBER
	str r0, [r1]
	bx lr
	.align 2, 0
_0204C934: .word DEBUG_SPECIAL_EPISODE_NUMBER
	arm_func_end sub_0204C928

	arm_func_start GetExecuteSpecialEpisodeType
GetExecuteSpecialEpisodeType: ; 0x0204C938
	ldr ip, _0204C948 ; =LoadScriptVariableValue
	mov r0, #0
	mov r1, #0x49
	bx ip
	.align 2, 0
_0204C948: .word LoadScriptVariableValue
	arm_func_end GetExecuteSpecialEpisodeType

	arm_func_start IsSpecialEpisodeOpen
IsSpecialEpisodeOpen: ; 0x0204C94C
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x4b
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsSpecialEpisodeOpen

	arm_func_start sub_0204C978
sub_0204C978: ; 0x0204C978
	ldr ip, _0204C99C ; =SaveScriptVariableValueAtIndex
	cmp r1, #0
	movne r3, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	moveq r3, #0
	mov r0, #0
	mov r1, #0x4b
	bx ip
	.align 2, 0
_0204C99C: .word SaveScriptVariableValueAtIndex
	arm_func_end sub_0204C978

	arm_func_start sub_0204C9A0
sub_0204C9A0: ; 0x0204C9A0
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x4b
	mov r2, #0x4c
	bl ScriptVariablesEqual
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204C9A0

	arm_func_start sub_0204C9C8
sub_0204C9C8: ; 0x0204C9C8
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x4c
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204C9C8

	arm_func_start sub_0204C9F4
sub_0204C9F4: ; 0x0204C9F4
	ldr ip, _0204CA18 ; =SaveScriptVariableValueAtIndex
	cmp r1, #0
	movne r3, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	moveq r3, #0
	mov r0, #0
	mov r1, #0x4c
	bx ip
	.align 2, 0
_0204CA18: .word SaveScriptVariableValueAtIndex
	arm_func_end sub_0204C9F4

	arm_func_start sub_0204CA1C
sub_0204CA1C: ; 0x0204CA1C
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x4d
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CA1C

	arm_func_start sub_0204CA48
sub_0204CA48: ; 0x0204CA48
	ldr ip, _0204CA6C ; =SaveScriptVariableValueAtIndex
	cmp r1, #0
	movne r3, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	moveq r3, #0
	mov r0, #0
	mov r1, #0x4d
	bx ip
	.align 2, 0
_0204CA6C: .word SaveScriptVariableValueAtIndex
	arm_func_end sub_0204CA48

	arm_func_start HasPlayedOldGame
HasPlayedOldGame: ; 0x0204CA70
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x6f
	bl LoadScriptVariableValue
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end HasPlayedOldGame

	arm_func_start GetPerformanceFlagWithChecks
GetPerformanceFlagWithChecks: ; 0x0204CA94
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #7
	addls pc, pc, r4, lsl #2
	b _0204CB10
_0204CAA8: ; jump table
	b _0204CAC8 ; case 0
	b _0204CB00 ; case 1
	b _0204CB00 ; case 2
	b _0204CAEC ; case 3
	b _0204CAEC ; case 4
	b _0204CAEC ; case 5
	b _0204CAEC ; case 6
	b _0204CAEC ; case 7
_0204CAC8:
	mov r0, #0
	mov r2, r0
	mov r1, #3
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0x35
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_0204CAEC:
	bl GetGameMode
	cmp r0, #3
	bne _0204CB10
	mov r0, #0
	ldmia sp!, {r4, pc}
_0204CB00:
	bl GetGameMode
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0204CB10:
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x4e
	bl LoadScriptVariableValueAtIndex
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end GetPerformanceFlagWithChecks

	arm_func_start sub_0204CB2C
sub_0204CB2C: ; 0x0204CB2C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #7
	addls pc, pc, r5, lsl #2
	b _0204CB70
_0204CB44: ; jump table
	b _0204CB70 ; case 0
	b _0204CB64 ; case 1
	b _0204CB64 ; case 2
	b _0204CB64 ; case 3
	b _0204CB64 ; case 4
	b _0204CB64 ; case 5
	b _0204CB64 ; case 6
	b _0204CB64 ; case 7
_0204CB64:
	bl GetGameMode
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
_0204CB70:
	cmp r4, #0
	movne r3, #1
	mov r0, r5, lsl #0x10
	mov r2, r0, lsr #0x10
	moveq r3, #0
	mov r0, #0
	mov r1, #0x4e
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204CB2C

	arm_func_start GetScenarioBalance
GetScenarioBalance: ; 0x0204CB94
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x49
	bl LoadScriptVariableValue
	mvn r1, #0
	cmp r0, r1
	bne _0204CBD8
	mov r0, #0
	mov r1, #0x14
	bl LoadScriptVariableValue
	cmp r0, #0
	bge _0204CBD0
	mov r0, #0
	mov r1, #0x13
	bl LoadScriptVariableValue
_0204CBD0:
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0204CBD8:
	cmp r0, #0
	moveq r0, #1
	movne r0, #3
	ldmia sp!, {r3, pc}
	arm_func_end GetScenarioBalance

	arm_func_start sub_0204CBE8
sub_0204CBE8: ; 0x0204CBE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl GetGameMode
	cmp r0, #1
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r4, r0, #2
	ldr r0, _0204CCB4 ; =_0209DFC8
	mov r1, r4
	bl Debug_Print0
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x1a
	bl LoadScriptVariableValueAtIndex
	mov r3, r0
	mov r0, #0
	mov r2, r0
	mov r1, #2
	bl SaveScriptVariableValueAtIndex
	add r2, r4, #4
	mov r2, r2, lsl #0x10
	mov r0, #0
	mov r1, #0x1a
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r3, r0
	mov r0, #0
	mov r1, #2
	mov r2, #1
	bl SaveScriptVariableValueAtIndex
	mov r8, #0
	mov sb, r4, lsl #7
	mov r7, r8
	mov r6, #0x1b
	mov r5, r8
	mov r4, #0x11
_0204CC74:
	mov r2, sb, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, r8, lsl #0x10
	mov r3, r0
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	add r8, r8, #1
	cmp r8, #0x80
	add sb, sb, #1
	blt _0204CC74
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204CCB4: .word _0209DFC8
	arm_func_end sub_0204CBE8

	arm_func_start ScenarioFlagBackup
ScenarioFlagBackup: ; 0x0204CCB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl GetGameMode
	cmp r0, #1
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r4, r0, #2
	ldr r0, _0204CD84 ; =_0209DFE8
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	mov r2, r0
	mov r1, #2
	bl LoadScriptVariableValueAtIndex
	mov r1, r4, lsl #0x10
	mov r3, r0
	mov r2, r1, lsr #0x10
	mov r0, #0
	mov r1, #0x1a
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r1, #2
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	add r2, r4, #4
	mov r2, r2, lsl #0x10
	mov r3, r0
	mov r0, #0
	mov r1, #0x1a
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	mov r8, #0
	mov sb, r4, lsl #7
	mov r7, r8
	mov r6, #0x11
	mov r5, r8
	mov r4, #0x1b
_0204CD44:
	mov r2, r8, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl LoadScriptVariableValueAtIndex
	mov r2, sb, lsl #0x10
	mov r3, r0
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsr #0x10
	bl SaveScriptVariableValueAtIndex
	add r8, r8, #1
	cmp r8, #0x80
	add sb, sb, #1
	blt _0204CD44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204CD84: .word _0209DFE8
	arm_func_end ScenarioFlagBackup

	arm_func_start InitWorldMapScriptVars
InitWorldMapScriptVars: ; 0x0204CD88
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x55
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x56
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x57
	mov r2, #1
	bl SaveScriptVariableValue
	ldmia sp!, {r3, pc}
	arm_func_end InitWorldMapScriptVars

	arm_func_start sub_0204CDB8
sub_0204CDB8: ; 0x0204CDB8
	ldr ip, _0204CDC8 ; =ZinitScriptVariable
	mov r0, #0
	mov r1, #0x56
	bx ip
	.align 2, 0
_0204CDC8: .word ZinitScriptVariable
	arm_func_end sub_0204CDB8

	arm_func_start sub_0204CDCC
sub_0204CDCC: ; 0x0204CDCC
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x57
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CDCC

	arm_func_start sub_0204CDE8
sub_0204CDE8: ; 0x0204CDE8
	ldr ip, _0204CDFC ; =SaveScriptVariableValue
	mov r2, r0
	mov r0, #0
	mov r1, #0x57
	bx ip
	.align 2, 0
_0204CDFC: .word SaveScriptVariableValue
	arm_func_end sub_0204CDE8

	arm_func_start sub_0204CE00
sub_0204CE00: ; 0x0204CE00
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetGameMode
	cmp r0, #3
	mov r0, r4, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	bne _0204CE2C
	mov r1, #0x56
	bl LoadScriptVariableValueAtIndex
	b _0204CE34
_0204CE2C:
	mov r1, #0x55
	bl LoadScriptVariableValueAtIndex
_0204CE34:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204CE00

	arm_func_start sub_0204CE48
sub_0204CE48: ; 0x0204CE48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetGameMode
	cmp r0, #3
	mov r0, r5, lsl #0x10
	mov r3, r4
	bne _0204CE7C
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x56
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r3, r4, r5, pc}
_0204CE7C:
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x55
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204CE48

	arm_func_start InitDungeonListScriptVars
InitDungeonListScriptVars: ; 0x0204CE90
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x4f
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x54
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x50
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x51
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x52
	bl ZinitScriptVariable
	mov r0, #0
	mov r1, #0x53
	bl ZinitScriptVariable
	ldmia sp!, {r3, pc}
	arm_func_end InitDungeonListScriptVars

	arm_func_start sub_0204CEE0
sub_0204CEE0: ; 0x0204CEE0
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x50
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CEE0

	arm_func_start sub_0204CF0C
sub_0204CF0C: ; 0x0204CF0C
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x52
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204CF0C

	arm_func_start SetDungeonConquest
SetDungeonConquest: ; 0x0204CF38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r0, r0, lsl #0x10
	mov r3, r1
	mov r2, r0, lsr #0x10
	mov r0, #0
	mov r1, #0x52
	bl SaveScriptVariableValueAtIndex
	mov r7, #0
	ldr r6, _0204CF98 ; =_0209E008
	mov r5, r7
	mov r4, #0x52
_0204CF64:
	ldrb r2, [r6, r7]
	add r7, r7, #1
	cmp r2, #0xff
	bne _0204CF80
	mov r0, #0x23
	bl SetAdventureLogCompleted
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204CF80:
	mov r0, r5
	mov r1, r4
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	bne _0204CF64
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0204CF98: .word _0209E008
	arm_func_end SetDungeonConquest

	arm_func_start GetDungeonMode
GetDungeonMode: ; 0x0204CF9C
	stmdb sp!, {r4, lr}
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x4f
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	mov r2, r4
	mov r0, #0
	mov r1, #0x54
	beq _0204CFF8
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #3
	moveq r0, #1
	ldmia sp!, {r4, pc}
_0204CFF8:
	bl LoadScriptVariableValueAtIndex
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetDungeonMode

	arm_func_start sub_0204D018
sub_0204D018: ; 0x0204D018
	stmdb sp!, {r4, lr}
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r4, pc}
_0204D028: ; jump table
	b _0204D038 ; case 0
	b _0204D06C ; case 1
	b _0204D0A0 ; case 2
	b _0204D0D4 ; case 3
_0204D038:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x4f
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x54
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
_0204D06C:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x4f
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x54
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
_0204D0A0:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, #0
	mov r2, r4
	mov r3, r0
	mov r1, #0x4f
	bl SaveScriptVariableValueAtIndex
	mov r2, r4
	mov r0, #0
	mov r1, #0x54
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
_0204D0D4:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r2, r4
	mov r0, #0
	mov r1, #0x4f
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	mov r2, r4
	mov r0, #0
	mov r1, #0x54
	mov r3, #1
	bl SaveScriptVariableValueAtIndex
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204D018

	arm_func_start GlobalProgressAlloc
GlobalProgressAlloc: ; 0x0204D108
	stmdb sp!, {r3, lr}
	mov r0, #0x20c
	mov r1, #0
	bl MemAlloc
	ldr r2, _0204D12C ; =GLOBAL_PROGRESS_PTR
	mov r1, #0x20c
	str r0, [r2]
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D12C: .word GLOBAL_PROGRESS_PTR
	arm_func_end GlobalProgressAlloc

	arm_func_start ResetGlobalProgress
ResetGlobalProgress: ; 0x0204D130
	ldr r0, _0204D144 ; =GLOBAL_PROGRESS_PTR
	ldr ip, _0204D148 ; =MemZero
	mov r1, #0x20c
	ldr r0, [r0]
	bx ip
	.align 2, 0
_0204D144: .word GLOBAL_PROGRESS_PTR
_0204D148: .word MemZero
	arm_func_end ResetGlobalProgress

	arm_func_start SetMonsterFlag1
SetMonsterFlag1: ; 0x0204D14C
	stmdb sp!, {r3, lr}
	ldr r3, _0204D184 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #27
	ldr lr, [r3]
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D184: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetMonsterFlag1

	arm_func_start GetMonsterFlag1
GetMonsterFlag1: ; 0x0204D188
	ldr r3, _0204D1C0 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r2, r0, r1, lsr #27
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	ldr r3, [r3]
	mov r2, r2, asr #5
	ldr r2, [r3, r2, lsl #2]
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204D1C0: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetMonsterFlag1

	arm_func_start SetMonsterFlag2
SetMonsterFlag2: ; 0x0204D1C4
	stmdb sp!, {r3, lr}
	bl FemaleToMaleForm
	ldr r2, _0204D204 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	ldr r3, [r2]
	add r1, r0, r1, lsr #27
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0x98
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D204: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetMonsterFlag2

	arm_func_start HasMonsterBeenAttackedInDungeons
HasMonsterBeenAttackedInDungeons: ; 0x0204D208
	stmdb sp!, {r3, lr}
	bl FemaleToMaleForm
	ldr r3, _0204D24C ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r2, r0, r1, lsr #27
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	ldr r3, [r3]
	mov r2, r2, asr #5
	add r2, r3, r2, lsl #2
	ldr r2, [r2, #0x98]
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D24C: .word GLOBAL_PROGRESS_PTR
	arm_func_end HasMonsterBeenAttackedInDungeons

	arm_func_start SetDungeonTipShown
SetDungeonTipShown: ; 0x0204D250
	stmdb sp!, {r3, lr}
	ldr r2, _0204D28C ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	ldr r3, [r2]
	add r1, r0, r1, lsr #27
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0x94
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D28C: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetDungeonTipShown

	arm_func_start GetDungeonTipShown
GetDungeonTipShown: ; 0x0204D290
	cmp r0, #0x1f
	movge r0, #0
	bxge lr
	ldr r2, _0204D2D8 ; =GLOBAL_PROGRESS_PTR
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	ldr r3, [r2]
	mov r2, r1, asr #5
	mov r1, r0, lsr #0x1f
	add r2, r3, r2, lsl #2
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	ldr r2, [r2, #0x94]
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204D2D8: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetDungeonTipShown

	arm_func_start SetMaxReachedFloor
SetMaxReachedFloor: ; 0x0204D2DC
	cmp r0, #0xb4
	ldrlo r2, _0204D2F4 ; =GLOBAL_PROGRESS_PTR
	ldrlo r2, [r2]
	addlo r0, r2, r0
	strlob r1, [r0, #0x143]
	bx lr
	.align 2, 0
_0204D2F4: .word GLOBAL_PROGRESS_PTR
	arm_func_end SetMaxReachedFloor

	arm_func_start GetMaxReachedFloor
GetMaxReachedFloor: ; 0x0204D2F8
	cmp r0, #0xb4
	ldrlo r1, _0204D314 ; =GLOBAL_PROGRESS_PTR
	movhs r0, #0
	ldrlo r1, [r1]
	addlo r0, r1, r0
	ldrlob r0, [r0, #0x143]
	bx lr
	.align 2, 0
_0204D314: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetMaxReachedFloor

	arm_func_start IncrementNbAdventures
IncrementNbAdventures: ; 0x0204D318
	ldr r0, _0204D344 ; =GLOBAL_PROGRESS_PTR
	ldr r1, _0204D348 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x1f8]
	add r2, r2, #1
	str r2, [r3, #0x1f8]
	ldr r2, [r0]
	ldr r0, [r2, #0x1f8]
	cmp r0, r1
	strhi r1, [r2, #0x1f8]
	bx lr
	.align 2, 0
_0204D344: .word GLOBAL_PROGRESS_PTR
_0204D348: .word 0x000F423F
	arm_func_end IncrementNbAdventures

	arm_func_start GetNbAdventures
GetNbAdventures: ; 0x0204D34C
	ldr r0, _0204D35C ; =GLOBAL_PROGRESS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x1f8]
	bx lr
	.align 2, 0
_0204D35C: .word GLOBAL_PROGRESS_PTR
	arm_func_end GetNbAdventures

	arm_func_start CanMonsterSpawn
CanMonsterSpawn: ; 0x0204D360
	mov r0, #1
	bx lr
	arm_func_end CanMonsterSpawn

	arm_func_start IncrementExclusiveMonsterCounts
IncrementExclusiveMonsterCounts: ; 0x0204D368
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0204D3B8 ; =VERSION_EXCLUSIVE_MONSTERS
	ldr r7, _0204D3BC ; =GLOBAL_PROGRESS_PTR
	mov r6, r0
	mov r5, #0
	mov r8, #1
_0204D380:
	mov r0, r5, lsl #2
	ldrsh r0, [r4, r0]
	bl GetDexNumber
	mov sb, r0
	mov r0, r6
	bl GetDexNumber
	cmp sb, r0
	ldreq r0, [r7]
	addeq r0, r0, r5
	add r5, r5, #1
	streqb r8, [r0, #0x12c]
	cmp r5, #0x17
	blt _0204D380
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204D3B8: .word VERSION_EXCLUSIVE_MONSTERS
_0204D3BC: .word GLOBAL_PROGRESS_PTR
	arm_func_end IncrementExclusiveMonsterCounts

	arm_func_start CopyProgressInfoTo
CopyProgressInfoTo: ; 0x0204D3C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0204D538 ; =0x00000483
	mov r5, r0
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D3D8:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterFlag1
	strb r0, [sp]
	mov r0, r5
	mov r1, r7
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, r4
	blt _0204D3D8
	mov r7, #0
	add r6, sp, #0
	mov r4, #1
_0204D410:
	mov r0, r7
	bl GetDungeonTipShown
	strb r0, [sp]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x1f
	blt _0204D410
	ldr r4, _0204D538 ; =0x00000483
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D448:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl HasMonsterBeenAttackedInDungeons
	strb r0, [sp]
	mov r0, r5
	mov r1, r7
	mov r2, r6
	bl CopyBitsTo
	add r8, r8, #1
	cmp r8, r4
	blt _0204D448
	ldr r8, _0204D53C ; =_0209E011
	ldr sb, _0204D540 ; =_0209E010
	ldr r6, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r4, #0
	mov r7, #1
_0204D488:
	ldr r0, [r6]
	mov r2, r7
	add r0, r0, r4
	ldrb r0, [r0, #0x12c]
	cmp r0, #0
	movne r1, sb
	moveq r1, r8
	mov r0, r5
	bl CopyBitsTo
	add r4, r4, #1
	cmp r4, #0x17
	blt _0204D488
	ldr r4, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	mov r6, #7
_0204D4C4:
	ldr r1, [r4]
	mov r0, r5
	add r1, r1, #0x43
	add r1, r1, #0x100
	mov r2, r6
	add r1, r1, r7
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0xb4
	blt _0204D4C4
	ldr r1, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x1f8
	bl CopyBitsTo
	ldr r4, _0204D544 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	mov r6, #8
_0204D510:
	ldr r1, [r4]
	mov r0, r5
	add r1, r1, #0x1fc
	mov r2, r6
	add r1, r1, r7
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x10
	blt _0204D510
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204D538: .word 0x00000483
_0204D53C: .word _0209E011
_0204D540: .word _0209E010
_0204D544: .word GLOBAL_PROGRESS_PTR
	arm_func_end CopyProgressInfoTo

	arm_func_start CopyProgressInfoFromScratchTo
CopyProgressInfoFromScratchTo: ; 0x0204D548
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	add r0, sp, #0
	bl CopyProgressInfoTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end CopyProgressInfoFromScratchTo

	arm_func_start CopyProgressInfoFrom
CopyProgressInfoFrom: ; 0x0204D580
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r1, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x20c
	bl MemZero
	ldr r5, _0204D744 ; =0x00000483
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D5AC:
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	beq _0204D5D4
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetMonsterFlag1
_0204D5D4:
	add r8, r8, #1
	cmp r8, r5
	blt _0204D5AC
	mov r7, #0
	add r6, sp, #0
	mov r5, #1
_0204D5EC:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	beq _0204D610
	mov r0, r7
	bl SetDungeonTipShown
_0204D610:
	add r7, r7, #1
	cmp r7, #0x1f
	blt _0204D5EC
	ldr r5, _0204D744 ; =0x00000483
	mov r8, #0
	add r7, sp, #0
	mov r6, #1
_0204D62C:
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #0
	beq _0204D654
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl SetMonsterFlag2
_0204D654:
	add r8, r8, #1
	cmp r8, r5
	blt _0204D62C
	mov sb, #0
	mov r6, #1
	ldr sl, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r5, sb
	add r8, sp, #1
	mov r7, r6
_0204D678:
	mov r0, r4
	mov r1, r8
	mov r2, r7
	bl CopyBitsFrom
	ldrb r0, [sp, #1]
	tst r0, #1
	ldr r0, [sl]
	movne r1, r6
	add r0, r0, sb
	moveq r1, r5
	add sb, sb, #1
	strb r1, [r0, #0x12c]
	cmp sb, #0x17
	blt _0204D678
	ldr r8, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	add r6, sp, #1
	mov r5, #7
_0204D6C0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl CopyBitsFrom
	ldrb r1, [sp, #1]
	ldr r0, [r8]
	add r0, r0, r7
	and r1, r1, #0x7f
	add r7, r7, #1
	strb r1, [r0, #0x143]
	cmp r7, #0xb4
	blt _0204D6C0
	ldr r1, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x1f8
	bl CopyBitsFrom
	ldr r5, _0204D740 ; =GLOBAL_PROGRESS_PTR
	mov r7, #0
	mov r6, #8
_0204D714:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, #0x1fc
	mov r2, r6
	add r1, r1, r7
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x10
	blt _0204D714
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204D740: .word GLOBAL_PROGRESS_PTR
_0204D744: .word 0x00000483
	arm_func_end CopyProgressInfoFrom

	arm_func_start CopyProgressInfoFromScratchFrom
CopyProgressInfoFromScratchFrom: ; 0x0204D748
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	add r0, sp, #0
	bl CopyProgressInfoFrom
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end CopyProgressInfoFromScratchFrom

	arm_func_start InitKaomadoStream
InitKaomadoStream: ; 0x0204D780
	stmdb sp!, {r3, lr}
	bl FileRom_InitDataTransfer
	ldr r0, _0204D798 ; =KAOMADO_STREAM
	bl FileRom_Veneer_FileInit
	bl FileRom_StopDataTransfer
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D798: .word KAOMADO_STREAM
	arm_func_end InitKaomadoStream

	arm_func_start InitPortraitParams
InitPortraitParams: ; 0x0204D79C
	mov r2, #0
	strh r2, [r0]
	sub r1, r2, #2
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	mov r1, #2
	str r1, [r0, #4]
	mov r1, #9
	str r1, [r0, #8]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	bx lr
	arm_func_end InitPortraitParams

	arm_func_start InitPortraitParamsWithMonsterId
InitPortraitParamsWithMonsterId: ; 0x0204D7D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl InitPortraitParams
	strh r4, [r5]
	mov r0, #0
	strb r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitPortraitParamsWithMonsterId

	arm_func_start SetPortraitEmotion
SetPortraitEmotion: ; 0x0204D7F4
	ldrsh r2, [r0]
	cmp r2, #0
	strneb r1, [r0, #2]
	bx lr
	arm_func_end SetPortraitEmotion

	arm_func_start SetPortraitLayout
SetPortraitLayout: ; 0x0204D804
	ldrsh r2, [r0]
	cmp r2, #0
	cmpne r1, #0x20
	bxeq lr
	mov r2, #6
	mul r2, r1, r2
	ldr r3, _0204D844 ; =PORTRAIT_LAYOUTS
	strb r1, [r0, #3]
	ldrsh r1, [r3, r2]
	add r2, r3, r2
	str r1, [r0, #4]
	ldrsh r1, [r2, #2]
	str r1, [r0, #8]
	ldrb r1, [r2, #4]
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0204D844: .word PORTRAIT_LAYOUTS
	arm_func_end SetPortraitLayout

	arm_func_start SetPortraitOffset
SetPortraitOffset: ; 0x0204D848
	stmdb sp!, {r3, lr}
	ldrsh r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r3, [r0, #3]
	mov r2, #6
	ldr lr, _0204D890 ; =PORTRAIT_LAYOUTS
	smulbb ip, r3, r2
	ldrsh r3, [lr, ip]
	ldr r2, [r1]
	add ip, lr, ip
	add r2, r3, r2
	str r2, [r0, #4]
	ldrsh r2, [ip, #2]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204D890: .word PORTRAIT_LAYOUTS
	arm_func_end SetPortraitOffset

	arm_func_start AllowPortraitDefault
AllowPortraitDefault: ; 0x0204D894
	strb r1, [r0, #0xf]
	bx lr
	arm_func_end AllowPortraitDefault

	arm_func_start IsValidPortrait
IsValidPortrait: ; 0x0204D89C
	ldrsh r1, [r0]
	cmp r1, #0
	ldrnesb r1, [r0, #2]
	mvnne r0, #1
	cmpne r1, r0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end IsValidPortrait

	arm_func_start LoadPortrait
LoadPortrait: ; 0x0204D8BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov sb, r1
	ldrsh r7, [sl]
	ldrsb r8, [sl, #2]
	bl FileRom_InitDataTransfer
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	ldr r1, _0204DA18 ; =KAOMADO_FILEPATH
	bl FileRom_HandleOpen
	mov fp, #0
	mov r4, fp
	mov r5, #1
	b _0204D9DC
_0204D8F4:
	mov r0, #0x28
	mul r0, r7, r0
	add r0, r0, r8, lsl #1
	mov r1, r0, lsl #2
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	mov r2, #0
	sub r7, r7, #0x258
	bl FileRom_HandleSeek
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	add r1, sp, #0
	mov r2, #0xc
	bl FileRom_HandleRead
	ldr r0, [sp, #4]
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	strb r0, [sl, #0xd]
	ldrb r0, [sl, #0xc]
	cmp r0, #0
	beq _0204D984
	ldr r0, [sp, #4]
	cmp r0, #0
	mov r1, r0
	bge _0204D96C
	ldr r1, [sp]
	cmp r0, #0
	rsblt r0, r0, #0
	sub r6, r0, r1
	strb r5, [sl, #0xe]
	b _0204D99C
_0204D96C:
	ldr r2, [sp, #8]
	cmp r2, #0
	rsblt r2, r2, #0
	sub r6, r2, r0
	strb r4, [sl, #0xe]
	b _0204D99C
_0204D984:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	rsblt r0, r0, #0
	sub r6, r0, r1
	strb fp, [sl, #0xe]
_0204D99C:
	cmp r1, #0
	ble _0204D9DC
	cmp sb, #0
	beq _0204D9C8
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	mov r1, sb
	mov r2, r6
	bl FileRom_HandleRead
_0204D9C8:
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, #1
	b _0204DA0C
_0204D9DC:
	cmp r7, #0
	bgt _0204D8F4
	ldrb r0, [sl, #0xf]
	cmp r0, #0
	cmpne r8, #0
	movne r8, #0
	ldrnesh r7, [sl]
	bne _0204D9DC
	ldr r0, _0204DA14 ; =KAOMADO_STREAM
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, #0
_0204DA0C:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204DA14: .word KAOMADO_STREAM
_0204DA18: .word KAOMADO_FILEPATH
	arm_func_end LoadPortrait

	arm_func_start sub_0204DA1C
sub_0204DA1C: ; 0x0204DA1C
	ldr r1, _0204DA28 ; =ARM9_UNKNOWN_TABLE__NA_209E164
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_0204DA28: .word ARM9_UNKNOWN_TABLE__NA_209E164
	arm_func_end sub_0204DA1C

	arm_func_start sub_0204DA2C
sub_0204DA2C: ; 0x0204DA2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x68
	mov r4, r2
	mov r2, #0
	mov r5, r1
	mov r6, r2
	add r1, sp, #0
_0204DA48:
	strb r6, [r1, r2]
	add r2, r2, #1
	cmp r2, #0x22
	blt _0204DA48
	add r3, sp, #0x22
	ldr r2, _0204DB04 ; =ARM9_UNKNOWN_TABLE__NA_209E164
	b _0204DA84
_0204DA64:
	ldrb r1, [r0]
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	strb r1, [r3, r6]
	moveq r0, #0
	beq _0204DAFC
	add r0, r0, #1
	add r6, r6, #1
_0204DA84:
	cmp r6, r4
	blt _0204DA64
	add r1, r4, r4, lsl #2
	and r0, r1, #7
	add r0, r0, #7
	mov r0, r0, asr #3
	add sl, r0, r1, asr #3
	add r0, sp, #0x58
	add r1, sp, #0
	mov r2, sl
	bl sub_02050990
	mov sb, #0
	add r8, sp, #0x58
	add r7, sp, #0x22
	mov r6, #5
	b _0204DAD8
_0204DAC4:
	mov r0, r8
	mov r2, r6
	add r1, r7, sb
	bl CopyBitsTo
	add sb, sb, #1
_0204DAD8:
	cmp sb, r4
	blt _0204DAC4
	add r0, sp, #0x58
	bl sub_020509BC
	add r1, sp, #0
	mov r0, r5
	mov r2, sl
	bl MemcpySimple
	mov r0, #1
_0204DAFC:
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204DB04: .word ARM9_UNKNOWN_TABLE__NA_209E164
	arm_func_end sub_0204DA2C

	arm_func_start sub_0204DB08
sub_0204DB08: ; 0x0204DB08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x48
	mov r4, r2
	add r3, r4, r4, lsl #2
	and r2, r3, #7
	add r2, r2, #7
	mov r2, r2, asr #3
	mov r5, r0
	add r0, sp, #0x38
	add r2, r2, r3, asr #3
	bl sub_02050974
	mov sb, #0
	add r8, sp, #0x38
	add r7, sp, #0
	mov r6, #5
	b _0204DB5C
_0204DB48:
	mov r0, r8
	mov r2, r6
	add r1, r7, sb
	bl CopyBitsFrom
	add sb, sb, #1
_0204DB5C:
	cmp sb, r4
	blt _0204DB48
	add r0, sp, #0x38
	bl sub_020509BC
	mov r3, #0
	add r2, sp, #0
	ldr r1, _0204DB9C ; =WONDER_MAIL_BITS_MAP
	b _0204DB8C
_0204DB7C:
	ldrb r0, [r2, r3]
	add r3, r3, #1
	ldrb r0, [r1, r0]
	strb r0, [r5], #1
_0204DB8C:
	cmp r3, r4
	blt _0204DB7C
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204DB9C: .word WONDER_MAIL_BITS_MAP
	arm_func_end sub_0204DB08

	arm_func_start sub_0204DBA0
sub_0204DBA0: ; 0x0204DBA0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa0
	mov r2, r0
	mov r5, r1
	mov r1, r2
	add r0, sp, #0x10
	mov r2, #0x36
	mov r4, #0
	bl MemcpySimple
	ldr r3, _0204DC9C ; =ARM9_UNKNOWN_TABLE__NA_209E12C
	mov r6, r4
	add r2, sp, #0x10
	add r0, sp, #0x46
	mov ip, r4
_0204DBD8:
	mov lr, ip
	ldrb r1, [r3, r6]
	b _0204DBF0
_0204DBE4:
	cmp lr, r1
	beq _0204DBF8
	add lr, lr, #1
_0204DBF0:
	cmp lr, #0x36
	blt _0204DBE4
_0204DBF8:
	ldrb r1, [r2, lr]
	strb r1, [r0, r6]
	add r6, r6, #1
	cmp r6, #0x36
	blt _0204DBD8
	add r1, sp, #0x7c
	mov r2, #0x36
	bl sub_0204DA2C
	cmp r0, #0
	moveq r0, #0
	beq _0204DC94
	ldrb r0, [sp, #0x7c]
	add r1, sp, #0x7d
	mov r2, #0x20
	bl sub_0204E0A0
	mov r3, #1
	add r2, sp, #0x7c
_0204DC3C:
	ldrb r1, [r2, r3]
	and r0, r3, #0xff
	add r3, r3, #1
	add r0, r1, r0
	add r0, r4, r0
	cmp r3, #0x21
	and r4, r0, #0xff
	blt _0204DC3C
	ldrb r0, [sp, #0x7c]
	cmp r0, r4
	movne r0, #0
	bne _0204DC94
	add r0, sp, #0
	add r1, sp, #0x7d
	mov r2, #0x20
	bl sub_02050974
	add r0, sp, #0
	mov r1, r5
	bl sub_0205C2A4
	add r0, sp, #0
	bl sub_020509BC
	mov r0, #1
_0204DC94:
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0204DC9C: .word ARM9_UNKNOWN_TABLE__NA_209E12C
	arm_func_end sub_0204DBA0

	arm_func_start sub_0204DCA0
sub_0204DCA0: ; 0x0204DCA0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa0
	mov r4, #0
	mov r5, r0
	mov r6, r1
	mov r2, r4
	mov r1, r4
	add r0, sp, #0x7c
_0204DCC0:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x22
	blt _0204DCC0
	add r0, sp, #0
	add r1, sp, #0x7d
	mov r2, #0x20
	bl sub_02050990
	add r0, sp, #0
	mov r1, r6
	bl sub_0205C548
	add r0, sp, #0
	bl sub_020509BC
	mov r3, #1
	add r2, sp, #0x7c
_0204DCFC:
	ldrb r1, [r2, r3]
	and r0, r3, #0xff
	add r3, r3, #1
	add r0, r1, r0
	add r0, r4, r0
	cmp r3, #0x21
	and r4, r0, #0xff
	blt _0204DCFC
	add r1, sp, #0x7d
	mov r0, r4
	mov r2, #0x20
	strb r4, [sp, #0x7c]
	bl sub_0204E02C
	add r0, sp, #0x46
	add r1, sp, #0x7c
	mov r2, #0x36
	bl sub_0204DB08
	ldr r2, _0204DD7C ; =ARM9_UNKNOWN_TABLE__NA_209E12C
	mov ip, #0
	add r4, sp, #0x46
	add r1, sp, #0x10
_0204DD50:
	ldrb r3, [r4, ip]
	ldrb r0, [r2, ip]
	add ip, ip, #1
	cmp ip, #0x36
	strb r3, [r1, r0]
	blt _0204DD50
	mov r0, r5
	mov r2, #0x36
	bl MemcpySimple
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0204DD7C: .word ARM9_UNKNOWN_TABLE__NA_209E12C
	arm_func_end sub_0204DCA0

; https://decomp.me/scratch/7hzkc
	arm_func_start WonderMailPasswordToMission
WonderMailPasswordToMission: ; 0x0204DD80
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x6c
	mov r2, r0
	mov r4, r1
	mov r1, r2
	add r0, sp, #0x10
	mov r2, #0x22
	bl MemcpySimple
	mov lr, #0
	ldr r3, _0204DE74 ; =WONDER_MAIL_BITS_SWAP
	add r2, sp, #0x10
	add r0, sp, #0x32
	mov r5, lr
_0204DDB4:
	mov ip, r5
	ldrb r1, [r3, lr]
	b _0204DDCC
_0204DDC0:
	cmp ip, r1
	beq _0204DDD4
	add ip, ip, #1
_0204DDCC:
	cmp ip, #0x22
	blt _0204DDC0
_0204DDD4:
	ldrb r1, [r2, ip]
	strb r1, [r0, lr]
	add lr, lr, #1
	cmp lr, #0x22
	blt _0204DDB4
	add r1, sp, #0x54
	mov r2, #0x22
	bl sub_0204DA2C
	cmp r0, #0
	moveq r0, #0
	beq _0204DE6C
	ldrb r0, [sp, #0x54]
	add r1, sp, #0x58
	mov r2, #0x11
	bl sub_0204E0A0
	add r0, sp, #0x58
	mov r1, #0x11
	bl sub_02004F80
	mov r5, r0
	ldrb r2, [sp, #0x54]
	ldr r0, _0204DE78 ; =_0209E264
	mov r1, r5
	bl Debug_Print0
	ldr r0, [sp, #0x54]
	cmp r0, r5
	movne r0, #0
	bne _0204DE6C
	add r0, sp, #0
	add r1, sp, #0x58
	mov r2, #0x11
	bl sub_02050974
	add r0, sp, #0
	mov r1, r4
	mov r2, #1
	bl sub_0205FD88
	add r0, sp, #0
	bl sub_020509BC
	mov r0, #1
_0204DE6C:
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0204DE74: .word WONDER_MAIL_BITS_SWAP
_0204DE78: .word _0209E264
	arm_func_end WonderMailPasswordToMission

	arm_func_start MissionToWonderMailPassword
MissionToWonderMailPassword: ; 0x0204DE7C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x6c
	mov r2, #0
	mov r4, r0
	mov r5, r1
	mov r1, r2
	add r0, sp, #0x54
_0204DE98:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x16
	blt _0204DE98
	add r0, sp, #0
	add r1, sp, #0x58
	mov r2, #0x11
	bl sub_02050990
	add r0, sp, #0
	mov r1, r5
	mov r2, #1
	bl sub_0205FE80
	add r0, sp, #0
	bl sub_020509BC
	add r0, sp, #0x58
	mov r1, #0x11
	bl sub_02004F80
	mov r1, r0
	str r1, [sp, #0x54]
	ldrb r2, [sp, #0x54]
	ldr r0, _0204DF4C ; =_0209E264
	bl Debug_Print0
	ldrb r0, [sp, #0x54]
	add r1, sp, #0x58
	mov r2, #0x11
	bl sub_0204E02C
	add r0, sp, #0x32
	add r1, sp, #0x54
	mov r2, #0x22
	bl sub_0204DB08
	ldr r2, _0204DF50 ; =WONDER_MAIL_BITS_SWAP
	mov lr, #0
	add ip, sp, #0x32
	add r1, sp, #0x10
_0204DF20:
	ldrb r3, [ip, lr]
	ldrb r0, [r2, lr]
	add lr, lr, #1
	cmp lr, #0x22
	strb r3, [r1, r0]
	blt _0204DF20
	mov r0, r4
	mov r2, #0x22
	bl MemcpySimple
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0204DF4C: .word _0209E264
_0204DF50: .word WONDER_MAIL_BITS_SWAP
	arm_func_end MissionToWonderMailPassword

	arm_func_start sub_0204DF54
sub_0204DF54: ; 0x0204DF54
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	tst r2, #0x1f
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r5, #0
	ldr ip, _0204DFAC ; =ARM9_UNKNOWN_TABLE__NA_209E280
	mov r4, r5
	b _0204DF9C
_0204DF74:
	mov r6, r4
	add r7, r1, r5
	add r8, r0, r5
_0204DF80:
	ldrb lr, [r7, r6]
	ldrb r3, [ip, r6]
	add r6, r6, #1
	cmp r6, #0x20
	strb lr, [r8, r3]
	blt _0204DF80
	add r5, r5, #0x20
_0204DF9C:
	cmp r5, r2
	blo _0204DF74
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0204DFAC: .word ARM9_UNKNOWN_TABLE__NA_209E280
	arm_func_end sub_0204DF54

	arm_func_start sub_0204DFB0
sub_0204DFB0: ; 0x0204DFB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	tst r2, #0x1f
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	mov lr, r5
	ldr ip, _0204E028 ; =ARM9_UNKNOWN_TABLE__NA_209E280
	mov r4, r5
	b _0204E018
_0204DFD4:
	mov sb, r4
	add r7, r1, r5
	add r8, r0, r5
_0204DFE0:
	mov r6, lr
	ldrb r3, [ip, sb]
	b _0204DFF8
_0204DFEC:
	cmp r6, r3
	beq _0204E000
	add r6, r6, #1
_0204DFF8:
	cmp r6, #0x20
	blt _0204DFEC
_0204E000:
	ldrb r3, [r7, r6]
	strb r3, [r8, sb]
	add sb, sb, #1
	cmp sb, #0x20
	blt _0204DFE0
	add r5, r5, #0x20
_0204E018:
	cmp r5, r2
	blo _0204DFD4
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204E028: .word ARM9_UNKNOWN_TABLE__NA_209E280
	arm_func_end sub_0204DFB0

	arm_func_start sub_0204E02C
sub_0204E02C: ; 0x0204E02C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	and r0, sl, #0xf
	add r0, r0, sl, asr #4
	add r0, r0, #8
	tst sl, #1
	movne r7, #1
	mov r5, #0
	mov sb, r1
	mov r8, r2
	and r6, r0, #0xff
	mvneq r7, #0
	mov r1, r5
	ldr r4, _0204E09C ; =WONDER_MAIL_ENCRYPTION_TABLE
	b _0204E090
_0204E068:
	mla r0, r1, r7, sl
	and r0, r0, #0xff
	ldrb r3, [sb, r5]
	ldrb r2, [r4, r0]
	add r0, r1, #1
	mov r1, r6
	add r2, r3, r2
	strb r2, [sb, r5]
	bl _s32_div_f
	add r5, r5, #1
_0204E090:
	cmp r5, r8
	blo _0204E068
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204E09C: .word WONDER_MAIL_ENCRYPTION_TABLE
	arm_func_end sub_0204E02C

	arm_func_start sub_0204E0A0
sub_0204E0A0: ; 0x0204E0A0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	and r0, sl, #0xf
	add r0, r0, sl, asr #4
	add r0, r0, #8
	tst sl, #1
	movne r7, #1
	mov r5, #0
	mov sb, r1
	mov r8, r2
	and r6, r0, #0xff
	mvneq r7, #0
	mov r1, r5
	ldr r4, _0204E110 ; =WONDER_MAIL_ENCRYPTION_TABLE
	b _0204E104
_0204E0DC:
	mla r0, r1, r7, sl
	and r0, r0, #0xff
	ldrb r3, [sb, r5]
	ldrb r2, [r4, r0]
	add r0, r1, #1
	mov r1, r6
	sub r2, r3, r2
	strb r2, [sb, r5]
	bl _s32_div_f
	add r5, r5, #1
_0204E104:
	cmp r5, r8
	blo _0204E0DC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0204E110: .word WONDER_MAIL_ENCRYPTION_TABLE
	arm_func_end sub_0204E0A0

	arm_func_start sub_0204E114
sub_0204E114: ; 0x0204E114
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetDungeonModeSpecial
	cmp r0, #3
#ifdef JAPAN
	moveq r0, #0x37c
#else
	ldreq r0, _0204E14C ; =0x00000B2C
#endif
	beq _0204E144
	cmp r4, #0xd4
	ldreq r0, _0204E150 ; =0x00000B2D
#ifdef JAPAN
	addne r0, r4, #0x2c8
#else
	addne r0, r4, #0x278
	addne r0, r0, #0x800
#endif
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
_0204E144:
	bl StringFromId
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0204E150: .word 0x0000037D
#else
_0204E14C: .word 0x00000B2C
_0204E150: .word 0x00000B2D
#endif
	arm_func_end sub_0204E114

	arm_func_start sub_0204E154
sub_0204E154: ; 0x0204E154
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	add r0, sp, #0
	bl sub_0204ABB8
	add r0, sp, #0
	bl sub_0204F9F4
	add r0, sp, #0
	bl CopyLogTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E154

	arm_func_start sub_0204E19C
sub_0204E19C: ; 0x0204E19C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	add r0, sp, #0
	bl sub_0204ACDC
	add r0, sp, #0
	bl sub_0204FA0C
	add r0, sp, #0
	bl CopyLogFrom
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E19C

	arm_func_start sub_0204E1E4
sub_0204E1E4: ; 0x0204E1E4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_0204E8EC
	ldr r1, _0204E208 ; =_022AB4F8
	mov r2, #0
	ldr r0, _0204E20C ; =_022AB5AC
	strb r2, [r1, #1]
	bl sub_0200C4CC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E208: .word _022AB4F8
_0204E20C: .word _022AB5AC
	arm_func_end sub_0204E1E4

	arm_func_start sub_0204E210
sub_0204E210: ; 0x0204E210
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #1
	mov r0, #0
	bhi _0204E2AC
	mov r2, r0
	mov r1, #0x32
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E258
	mov r2, r0
	mov r1, #0x2e
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
_0204E258:
	mov r1, #0x32
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E28C
	mov r1, #0x2e
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
_0204E28C:
	mov r1, #0x32
	mov r2, #2
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	bne _0204E2D4
	mov r0, #2
	ldmia sp!, {r3, pc}
_0204E2AC:
	mov r1, #0x2c
	bl LoadScriptVariableValue
	cmp r0, #6
	bne _0204E2D4
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
_0204E2D4:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E210

	arm_func_start sub_0204E2DC
sub_0204E2DC: ; 0x0204E2DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetGameMode
	strb r0, [r4]
	cmp r0, #1
	mov r0, #0
	bhi _0204E398
	mov r2, r0
	mov r1, #0x32
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E334
	mov r3, #2
	mov r2, r0
	mov r1, #0x2e
	strb r3, [r4]
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0204E334:
	mov r1, #0x32
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	mov r0, #0
	bne _0204E370
	mov r3, #3
	mov r1, #0x2e
	mov r2, #1
	strb r3, [r4]
	bl LoadScriptVariableValueAtIndex
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0204E370:
	mov r1, #0x32
	mov r2, #2
	bl LoadScriptVariableValueAtIndex
	cmp r0, #6
	cmpne r0, #0xa
	bne _0204E3C0
	mov r0, #4
	strb r0, [r4]
	mov r0, #2
	ldmia sp!, {r4, pc}
_0204E398:
	mov r1, #0x2c
	bl LoadScriptVariableValue
	cmp r0, #6
	bne _0204E3C0
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0204E3C0:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204E2DC

	arm_func_start sub_0204E3C8
sub_0204E3C8: ; 0x0204E3C8
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E400
	bl sub_02048CB8
	ldr r1, _0204E408 ; =0x000F1207
	cmp r0, r1
	bne _0204E400
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E400:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E408: .word 0x000F1207
	arm_func_end sub_0204E3C8

	arm_func_start sub_0204E40C
sub_0204E40C: ; 0x0204E40C
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E458
	bl sub_02048CB8
	ldr r1, _0204E460 ; =0x000F1207
	cmp r0, r1
	bne _0204E458
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E458
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_0204E458:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E460: .word 0x000F1207
	arm_func_end sub_0204E40C

	arm_func_start sub_0204E464
sub_0204E464: ; 0x0204E464
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E4B0
	bl sub_02048CB8
	ldr r1, _0204E4B8 ; =0x000F1207
	cmp r0, r1
	bne _0204E4B0
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	beq _0204E4B0
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E4B0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E4B8: .word 0x000F1207
	arm_func_end sub_0204E464

	arm_func_start sub_0204E4BC
sub_0204E4BC: ; 0x0204E4BC
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E4E0
	bl sub_02048CB8
	ldr r1, _0204E4E8 ; =0x000F1207
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0204E4E0:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E4E8: .word 0x000F1207
	arm_func_end sub_0204E4BC

	arm_func_start sub_0204E4EC
sub_0204E4EC: ; 0x0204E4EC
	stmdb sp!, {r4, lr}
	bl sub_02048CB8
	mov r4, r0
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E524
	ldr r1, _0204E52C ; =0x000F1207
	cmp r4, r1
	addne r0, r1, #1
	cmpne r4, r0
	addne r0, r1, #3
	cmpne r4, r0
	movne r0, #1
	ldmneia sp!, {r4, pc}
_0204E524:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E52C: .word 0x000F1207
	arm_func_end sub_0204E4EC

	arm_func_start sub_0204E530
sub_0204E530: ; 0x0204E530
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E57C
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E57C
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E57C
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E57C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E530

	arm_func_start sub_0204E584
sub_0204E584: ; 0x0204E584
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E5DC
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E5DC
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E5DC
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _0204E5DC
	bl sub_0205633C
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E5DC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E584

	arm_func_start sub_0204E5E4
sub_0204E5E4: ; 0x0204E5E4
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E63C
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E63C
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E63C
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _0204E63C
	bl sub_02056360
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E63C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E5E4

	arm_func_start sub_0204E644
sub_0204E644: ; 0x0204E644
	stmdb sp!, {r3, lr}
	mov r0, #4
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0204E69C
	bl sub_02048BFC
	cmp r0, #1
	bne _0204E69C
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E69C
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	bne _0204E69C
	bl sub_0205633C
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E69C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204E644

	arm_func_start sub_0204E6A4
sub_0204E6A4: ; 0x0204E6A4
	stmdb sp!, {r3, lr}
	bl sub_02048BFC
	cmp r0, #2
	bne _0204E6F0
	bl sub_02048CB8
	ldr r1, _0204E6F8 ; =0x000F1207
	cmp r0, r1
	bne _0204E6F0
	mov r0, #1
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	beq _0204E6F0
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0204E6F0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E6F8: .word 0x000F1207
	arm_func_end sub_0204E6A4

	arm_func_start sub_0204E6FC
sub_0204E6FC: ; 0x0204E6FC
	ldr r0, _0204E708 ; =PENDING_DUNGEON_ID
	ldrsb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_0204E708: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E6FC

	arm_func_start sub_0204E70C
sub_0204E70C: ; 0x0204E70C
	stmdb sp!, {r4, lr}
	ldr r0, _0204E75C ; =PENDING_DUNGEON_ID
	ldrsb r4, [r0, #0xd]
	and r1, r4, #0xff
	cmp r1, #1
	bhi _0204E754
	ldrsh r0, [r0, #2]
	bl GetDungeonModeSpecial
	cmp r0, #1
	beq _0204E744
	cmp r0, #2
	beq _0204E74C
	cmp r0, #3
	bne _0204E754
_0204E744:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0204E74C:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0204E754:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E75C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E70C

	arm_func_start sub_0204E760
sub_0204E760: ; 0x0204E760
	ldr r0, _0204E76C ; =PENDING_DUNGEON_ID
	ldrsh r0, [r0, #2]
	bx lr
	.align 2, 0
_0204E76C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E760

	arm_func_start sub_0204E770
sub_0204E770: ; 0x0204E770
	ldr r0, _0204E77C ; =PENDING_DUNGEON_ID
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0204E77C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E770

	arm_func_start sub_0204E780
sub_0204E780: ; 0x0204E780
	ldr r0, _0204E78C ; =PENDING_DUNGEON_ID
	ldrb r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0204E78C: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E780

	arm_func_start sub_0204E790
sub_0204E790: ; 0x0204E790
	stmdb sp!, {r4, lr}
	ldr lr, _0204E7B4 ; =PENDING_DUNGEON_ID
	mov r4, r0
	mov ip, #0xb
_0204E7A0:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204E7A0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E7B4: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204E790

	arm_func_start sub_0204E7B8
sub_0204E7B8: ; 0x0204E7B8
	stmdb sp!, {r3, lr}
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsb r2, [r1, #0xd]
	mov r1, #0x28
	bl SaveScriptVariableValue
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsh r2, [r1, #2]
	mov r1, #0x27
	bl SaveScriptVariableValue
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsh r2, [r1, #2]
	mov r1, #0x29
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2c
	mov r2, #6
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x2b
	mov r2, #6
	bl SaveScriptVariableValue
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldrsb r0, [r0, #0xd]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0204E8D4
_0204E82C: ; jump table
	b _0204E8D4 ; case 0
	b _0204E83C ; case 1
	b _0204E8B0 ; case 2
	b _0204E8D4 ; case 3
_0204E83C:
	mov r0, #0
	mov r1, #0x27
	mov r2, #0xd7
	bl SaveScriptVariableValue
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldr r1, _0204E8E4 ; =_022AB518
	ldrb r0, [r0]
	bl sub_0205F00C
	cmp r0, #0
	beq _0204E8D4
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldrb r1, [r1, #0x1d]
	cmp r1, #0
	beq _0204E8A0
	add r0, r0, #4
	bl sub_0204F7A8
	ldr r1, _0204E8E8 ; =CLIENT_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r1, [r1, r0]
	ldr r3, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov ip, #1
	ldr r0, _0204E8E4 ; =_022AB518
	mov r2, #0
	strb ip, [r3, #0x1d]
	bl ApplyLevelUpBoostsToGroundMonster
_0204E8A0:
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r1, #1
	strb r1, [r0, #0xf]
	b _0204E8D4
_0204E8B0:
	mov r0, #0
	mov r1, #0x27
	mov r2, #0xd6
	bl SaveScriptVariableValue
	ldr r1, _0204E8E0 ; =PENDING_DUNGEON_ID
	mov r0, #0
	ldrsb r2, [r1, #0x12]
	mov r1, #0x29
	bl SaveScriptVariableValue
_0204E8D4:
	ldr r0, _0204E8E0 ; =PENDING_DUNGEON_ID
	ldrsb r0, [r0, #0xd]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E8E0: .word PENDING_DUNGEON_ID
_0204E8E4: .word _022AB518
_0204E8E8: .word CLIENT_LEVEL_TABLE
	arm_func_end sub_0204E7B8

	arm_func_start sub_0204E8EC
sub_0204E8EC: ; 0x0204E8EC
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _0204E920
	ldr lr, _0204E944 ; =PENDING_DUNGEON_ID
	mov ip, #0xb
_0204E900:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204E900
	ldr r0, _0204E948 ; =_022AB4F8
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r4, pc}
_0204E920:
	mov r3, #0
	ldr r0, _0204E944 ; =PENDING_DUNGEON_ID
	sub r2, r3, #1
	strb r2, [r0, #0xd]
	ldr r1, _0204E948 ; =_022AB4F8
	strb r2, [r0, #0xe]
	strb r3, [r1]
	strh r2, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204E944: .word PENDING_DUNGEON_ID
_0204E948: .word _022AB4F8
	arm_func_end sub_0204E8EC

	arm_func_start SetEnterDungeon
SetEnterDungeon: ; 0x0204E94C
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _0204E96C ; =PENDING_DUNGEON_ID
	bl InitDungeonInit
	ldr r0, _0204E970 ; =_022AB4F8
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204E96C: .word PENDING_DUNGEON_ID
_0204E970: .word _022AB4F8
	arm_func_end SetEnterDungeon

	arm_func_start sub_0204E974
sub_0204E974: ; 0x0204E974
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0205B77C
	ldr r2, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r1, #2
	mov r4, r0
	strb r1, [r2, #0xd]
	sub r0, r1, #3
	strb r0, [r2, #0xe]
	mov r0, #0xd6
	strh r0, [r2, #2]
	ldr r0, _0204EA50 ; =_022AB510
	mov r1, r5
	strb r5, [r2, #0x12]
	bl sub_0205BB7C
	ldr r0, _0204EA54 ; =_022AB5A8
	mov r1, r5
	bl sub_0205BD14
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r2, #0
	strb r2, [r1, #0xf]
	strb r2, [r1, #0x10]
	strb r2, [r1, #4]
	mov r0, #7
	strb r2, [r1, #0x11]
	bl GetPerformanceFlagWithChecks
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r2, #0
	strb r0, [r1, #5]
	mov r0, #6
	strb r2, [r1, #6]
	bl GetPerformanceFlagWithChecks
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	strb r0, [r1, #8]
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	ldr r1, _0204EA4C ; =PENDING_DUNGEON_ID
	mov r2, #0
	strb r0, [r1, #9]
	strb r2, [r1, #0xa]
	strb r2, [r1, #0xb]
	strb r2, [r1, #7]
	strb r2, [r1, #0xc]
	ldrb r0, [r4, #4]
	add r0, r0, #0xda
	and r0, r0, #0xff
	cmp r0, #5
	strlsb r2, [r1, #5]
	movls r0, #1
	strlsb r0, [r1, #7]
	ldr r0, _0204EA58 ; =_022AB4F8
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204EA4C: .word PENDING_DUNGEON_ID
_0204EA50: .word _022AB510
_0204EA54: .word _022AB5A8
_0204EA58: .word _022AB4F8
	arm_func_end sub_0204E974

	arm_func_start InitDungeonInit
InitDungeonInit: ; 0x0204EA5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl GetGameMode
	mov r4, r0
	mov r0, r6
	strh r6, [r7, #2]
	bl DungeonSwapIdxToId
	strb r0, [r7]
	mov r1, #1
	strb r1, [r7, #1]
	sub r1, r1, #2
	strb r1, [r7, #0x12]
	mov r0, #0
	str r0, [r7, #0xac]
	strb r0, [r7, #0xd]
	strb r1, [r7, #0xe]
	strb r0, [r7, #4]
	strb r0, [r7, #0xf]
	strb r0, [r7, #0x10]
	strb r0, [r7, #0x11]
	cmp r4, #2
	strneb r0, [r7, #5]
	strneb r0, [r7, #6]
	strneb r0, [r7, #8]
	bne _0204EAF0
	mov r0, #7
	bl GetPerformanceFlagWithChecks
	strb r0, [r7, #5]
	mov r0, #5
	bl GetPerformanceFlagWithChecks
	strb r0, [r7, #6]
	mov r0, #6
	bl GetPerformanceFlagWithChecks
	strb r0, [r7, #8]
	mov r0, #1
	bl GetPerformanceFlagWithChecks
_0204EAF0:
	strb r0, [r7, #9]
	mov r3, #0
	strb r3, [r7, #0xa]
	strb r3, [r7, #0xb]
	strb r3, [r7, #7]
	strb r3, [r7, #0xc]
	mov r1, r3
	mov r0, #0x44
_0204EB10:
	mla r2, r3, r0, r7
	strb r1, [r2, #0x1c]
	add r3, r3, #1
	strh r1, [r2, #0x20]
	cmp r3, #2
	blt _0204EB10
	cmp r4, #5
	bne _0204EB88
	mov r0, #1
	strb r0, [r7, #5]
	strb r1, [r7, #6]
	strb r1, [r7, #8]
	strb r1, [r7, #9]
	strb r1, [r7, #0xb]
	mov r0, #3
	strb r0, [r7, #0xd]
	strb r1, [r7, #4]
	sub r0, r6, #0x26
	strb r1, [r7, #0x11]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0204EB84
_0204EB68: ; jump table
	b _0204EB80 ; case 0
	b _0204EB80 ; case 1
	b _0204EB80 ; case 2
	b _0204EB80 ; case 3
	b _0204EB80 ; case 4
	b _0204EB80 ; case 5
_0204EB80:
	strb r1, [r7, #5]
_0204EB84:
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0204EB88:
	mov r0, r6
	bl GetDungeonModeSpecial
	cmp r0, #1
	beq _0204EBB0
	cmp r0, #2
	beq _0204EF50
	cmp r0, #3
	moveq r0, #0
	streqb r0, [r7, #0xd]
	b _0204EF88
_0204EBB0:
	mov r4, #0
	mov r0, r6
	strb r4, [r7, #0xd]
	mov r5, r4
	bl IsNoLossPenaltyDungeon
	strb r0, [r7, #0xc]
	cmp r6, #0x44
	bgt _0204ECA4
	bge _0204EE70
	cmp r6, #0x3e
	bgt _0204EC60
	bge _0204EE68
	cmp r6, #0x21
	bgt _0204EC1C
	bge _0204EDEC
	cmp r6, #0xb
	bgt _0204EC10
	subs r0, r6, #8
	addpl pc, pc, r0, lsl #2
	b _0204EF34
_0204EC00: ; jump table
	b _0204ED88 ; case 0
	b _0204ED9C ; case 1
	b _0204EDB0 ; case 2
	b _0204EDC4 ; case 3
_0204EC10:
	cmp r6, #0x20
	beq _0204EDD8
	b _0204EF34
_0204EC1C:
	cmp r6, #0x22
	bgt _0204EC2C
	beq _0204EE10
	b _0204EF34
_0204EC2C:
	sub r0, r6, #0x23
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0204EF34
_0204EC3C: ; jump table
	b _0204EE24 ; case 0
	b _0204EF34 ; case 1
	b _0204EF34 ; case 2
	b _0204EE48 ; case 3
	b _0204EE48 ; case 4
	b _0204EE48 ; case 5
	b _0204EE60 ; case 6
	b _0204EE60 ; case 7
	b _0204EE60 ; case 8
_0204EC60:
	cmp r6, #0x41
	bgt _0204EC88
	bge _0204EE68
	cmp r6, #0x3f
	bgt _0204EC7C
	beq _0204EE68
	b _0204EF34
_0204EC7C:
	cmp r6, #0x40
	beq _0204EE68
	b _0204EF34
_0204EC88:
	cmp r6, #0x42
	bgt _0204EC98
	beq _0204EE68
	b _0204EF34
_0204EC98:
	cmp r6, #0x43
	beq _0204EE70
	b _0204EF34
_0204ECA4:
	cmp r6, #0x73
	bgt _0204ECF4
	bge _0204EE88
	cmp r6, #0x70
	bgt _0204ECD8
	bge _0204EE88
	cmp r6, #0x45
	bgt _0204ECCC
	beq _0204EE70
	b _0204EF34
_0204ECCC:
	cmp r6, #0x6f
	beq _0204EE88
	b _0204EF34
_0204ECD8:
	cmp r6, #0x71
	bgt _0204ECE8
	beq _0204EE88
	b _0204EF34
_0204ECE8:
	cmp r6, #0x72
	beq _0204EE88
	b _0204EF34
_0204ECF4:
	cmp r6, #0x76
	bgt _0204ED1C
	bge _0204EE88
	cmp r6, #0x74
	bgt _0204ED10
	beq _0204EE88
	b _0204EF34
_0204ED10:
	cmp r6, #0x75
	beq _0204EE88
	b _0204EF34
_0204ED1C:
	cmp r6, #0x87
	bgt _0204ED7C
	subs r0, r6, #0x78
	addpl pc, pc, r0, lsl #2
	b _0204ED70
_0204ED30: ; jump table
	b _0204EE88 ; case 0
	b _0204EE88 ; case 1
	b _0204EE88 ; case 2
	b _0204EE9C ; case 3
	b _0204EEC4 ; case 4
	b _0204EF34 ; case 5
	b _0204EF34 ; case 6
	b _0204EF34 ; case 7
	b _0204EEEC ; case 8
	b _0204EF34 ; case 9
	b _0204EF34 ; case 10
	b _0204EF34 ; case 11
	b _0204EF34 ; case 12
	b _0204EF34 ; case 13
	b _0204EF34 ; case 14
	b _0204EF10 ; case 15
_0204ED70:
	cmp r6, #0x77
	beq _0204EE88
	b _0204EF34
_0204ED7C:
	cmp r6, #0xa4
	beq _0204EF24
	b _0204EF34
_0204ED88:
	ldr r2, _0204EF98 ; =_020A2904
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204ED9C:
	ldr r2, _0204EF9C ; =_020A2AD8
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EDB0:
	ldr r2, _0204EFA0 ; =_020A2AB4
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EDC4:
	ldr r2, _0204EFA4 ; =_020A294C
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EDD8:
	ldr r2, _0204EFA8 ; =_020A2970
	mov r0, r7
	mov r1, #0
	bl AddGuestMonster
	b _0204EF34
_0204EDEC:
	ldr r2, _0204EFAC ; =_020A2A48
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	ldr r2, _0204EFB0 ; =_020A2A24
	mov r0, r7
	mov r1, #1
	bl AddGuestMonster
	b _0204EF34
_0204EE10:
	ldr r2, _0204EFB4 ; =_020A29DC
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EE24:
	mov r0, #0x19
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _0204EF34
	ldr r2, _0204EFB8 ; =_020A2A00
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EE48:
	ldr r2, _0204EFBC ; =_020A2A6C
	mov r0, r7
	mov r1, r4
	mov r5, #1
	bl AddGuestMonster
	b _0204EF34
_0204EE60:
	mov r4, #1
	b _0204EF34
_0204EE68:
	mov r4, #1
	b _0204EF34
_0204EE70:
	ldr r2, _0204EFC0 ; =_020A2A90
	mov r0, r7
	mov r1, #0
	bl AddGuestMonster
	mov r4, #1
	b _0204EF34
_0204EE88:
	ldr r2, _0204EFC4 ; =_020A2AFC
	mov r0, r7
	mov r1, #0
	bl AddGuestMonster
	b _0204EF34
_0204EE9C:
	mov r0, r4
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	bne _0204EF34
	ldr r2, _0204EFC8 ; =_020A2B20
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EEC4:
	mov r0, r4
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	bne _0204EF34
	ldr r2, _0204EFCC ; =_020A2928
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EEEC:
	ldr r2, _0204EFD0 ; =GUEST_MONSTER_DATA
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	ldr r2, _0204EFD4 ; =_020A28E0
	mov r0, r7
	mov r1, #1
	bl AddGuestMonster
	b _0204EF34
_0204EF10:
	ldr r2, _0204EFD8 ; =_020A29B8
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
	b _0204EF34
_0204EF24:
	ldr r2, _0204EFDC ; =_020A2994
	mov r0, r7
	mov r1, r4
	bl AddGuestMonster
_0204EF34:
	cmp r4, #0
	movne r0, #1
	strneb r0, [r7, #0xb]
	cmp r5, #0
	movne r0, #1
	strneb r0, [r7, #7]
	b _0204EF88
_0204EF50:
	sub r0, r6, #0x26
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0204EF80
_0204EF60: ; jump table
	b _0204EF78 ; case 0
	b _0204EF78 ; case 1
	b _0204EF78 ; case 2
	b _0204EF78 ; case 3
	b _0204EF78 ; case 4
	b _0204EF78 ; case 5
_0204EF78:
	mov r0, #1
	strb r0, [r7, #0xb]
_0204EF80:
	mov r0, #1
	strb r0, [r7, #0xd]
_0204EF88:
	mov r0, #0
	strb r0, [r7, #4]
	strb r0, [r7, #0x11]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0204EF98: .word _020A2904
_0204EF9C: .word _020A2AD8
_0204EFA0: .word _020A2AB4
_0204EFA4: .word _020A294C
_0204EFA8: .word _020A2970
_0204EFAC: .word _020A2A48
_0204EFB0: .word _020A2A24
_0204EFB4: .word _020A29DC
_0204EFB8: .word _020A2A00
_0204EFBC: .word _020A2A6C
_0204EFC0: .word _020A2A90
_0204EFC4: .word _020A2AFC
_0204EFC8: .word _020A2B20
_0204EFCC: .word _020A2928
_0204EFD0: .word GUEST_MONSTER_DATA
_0204EFD4: .word _020A28E0
_0204EFD8: .word _020A29B8
_0204EFDC: .word _020A2994
	arm_func_end InitDungeonInit

	arm_func_start IsNoLossPenaltyDungeon
IsNoLossPenaltyDungeon: ; 0x0204EFE0
	stmdb sp!, {r4, lr}
	cmp r0, #0x1a
	mov r4, #0
	cmpne r0, #0x79
	beq _0204F000
	cmp r0, #0x7d
	beq _0204F008
	b _0204F01C
_0204F000:
	mov r4, #1
	b _0204F01C
_0204F008:
	mov r0, r4
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	moveq r4, #1
_0204F01C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end IsNoLossPenaltyDungeon

	arm_func_start sub_0204F024
sub_0204F024: ; 0x0204F024
	ldr r1, _0204F030 ; =PENDING_DUNGEON_ID
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0204F030: .word PENDING_DUNGEON_ID
	arm_func_end sub_0204F024

	arm_func_start sub_0204F034
sub_0204F034: ; 0x0204F034
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x28
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F034

	arm_func_start sub_0204F050
sub_0204F050: ; 0x0204F050
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mvn r1, #0
	cmp r0, r1
	cmpne r0, #0xd6
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xd7
	cmpeq r0, #0xd9
	cmpeq r0, #0xd8
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F050

	arm_func_start sub_0204F0A0
sub_0204F0A0: ; 0x0204F0A0
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mvn r1, #0
	cmp r1, r0, asr #16
	mov r0, r0, asr #0x10
	moveq r0, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xd6
	moveq r0, #0xd4
	ldmeqia sp!, {r3, pc}
	sub r1, r0, #0xd7
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	bhi _0204F104
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_0204F104:
	bl DungeonSwapIdxToId
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F0A0

	arm_func_start sub_0204F10C
sub_0204F10C: ; 0x0204F10C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mvn r0, #0
	cmp r1, r0
	cmpne r1, #0xd6
	cmpne r1, #0xd7
	cmpne r1, #0xd8
	cmpne r1, #0xd9
	movne r0, #1
	strneh r1, [r4]
	mvneq r0, #0
	streqh r0, [r4]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F10C

	arm_func_start sub_0204F158
sub_0204F158: ; 0x0204F158
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xd7
	bne _0204F1AC
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	cmp r0, #0xff
	beq _0204F1AC
	cmp r0, #0xb4
	strlob r0, [r4]
	movlo r0, #1
	ldmloia sp!, {r4, pc}
_0204F1AC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F158

	arm_func_start sub_0204F1B4
sub_0204F1B4: ; 0x0204F1B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xd6
	mov r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, #0x29
	bl LoadScriptVariableValue
	strb r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F1B4

	arm_func_start sub_0204F1F0
sub_0204F1F0: ; 0x0204F1F0
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	beq _0204F22C
	ldr lr, _0204F23C ; =_022AB5AC
	mov ip, #0xe
_0204F208:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F208
	ldmia r5, {r0, r1}
	ldr r2, _0204F240 ; =_022AB4F8
	stmia lr, {r0, r1}
	strb r4, [r2, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F22C:
	ldr r0, _0204F240 ; =_022AB4F8
	mov r1, #0
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204F23C: .word _022AB5AC
_0204F240: .word _022AB4F8
	arm_func_end sub_0204F1F0

	arm_func_start sub_0204F244
sub_0204F244: ; 0x0204F244
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _0204F270
	ldr lr, _0204F27C ; =_022AB5AC
	mov ip, #0xe
_0204F258:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F258
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
_0204F270:
	ldr r0, _0204F280 ; =_022AB4F8
	ldrb r0, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204F27C: .word _022AB5AC
_0204F280: .word _022AB4F8
	arm_func_end sub_0204F244

	arm_func_start sub_0204F284
sub_0204F284: ; 0x0204F284
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	add r0, sp, #0
	mov sb, r1
	bl GetPartyMembers
	mov r6, r0
	mov r0, sl
	bl GetMaxMembersAllowed
	cmp r6, r0
	ble _0204F2C0
	cmp r0, #1
	ldreq r0, _0204F354 ; =0x00000301
	ldrne r0, _0204F358 ; =0x00000101
	b _0204F34C
_0204F2C0:
	cmp sb, #0
	beq _0204F2D8
	add r0, r6, #1
	cmp r0, #4
	ldrgt r0, _0204F358 ; =0x00000101
	bgt _0204F34C
_0204F2D8:
	mov r7, #0
	mov r8, r7
	add r5, sp, #0
	ldr r4, _0204F35C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, #0x44
	b _0204F310
_0204F2F0:
	mov r0, r8, lsl #1
	ldrsh r0, [r5, r0]
	ldr r1, [r4]
	smlabb r0, r0, fp, r1
	ldrsh r0, [r0, #4]
	bl GetBodySize
	add r7, r7, r0
	add r8, r8, #1
_0204F310:
	cmp r8, r6
	blt _0204F2F0
	cmp sb, #0
	beq _0204F32C
	mov r0, sb
	bl GetBodySize
	add r7, r7, r0
_0204F32C:
	cmp r7, #6
	movgt r0, #0x81
	bgt _0204F34C
	mov r0, sl
	bl IsLevelResetDungeon
	cmp r0, #0
	ldrne r0, _0204F360 ; =0x00002002
	moveq r0, #0
_0204F34C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204F354: .word 0x00000301
_0204F358: .word 0x00000101
_0204F35C: .word TEAM_MEMBER_TABLE_PTR
_0204F360: .word 0x00002002
	arm_func_end sub_0204F284

	arm_func_start sub_0204F364
sub_0204F364: ; 0x0204F364
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	bl GetMaxItemsAllowed
	mov r4, r0
	bl GetNbItemsInBag
	cmp r4, #0
	ble _0204F39C
	cmp r4, r0
	bge _0204F39C
	orr r5, r5, #2
	cmp r4, #0
	orreq r5, r5, #0x800
	orrne r5, r5, #0x400
_0204F39C:
	mov r0, r6
	bl IsMoneyAllowed
	cmp r0, #0
	bne _0204F3BC
	bl GetMoneyCarried
	cmp r0, #0
	orrgt r5, r5, #2
	orrgt r5, r5, #0x1000
_0204F3BC:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0204F364

	arm_func_start CheckMissionRestrictions
CheckMissionRestrictions: ; 0x0204F3C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetGameMode
	cmp r0, #2
	bne _0204F424
	mov r0, r5
	bl DungeonSwapIdToIdx
	bl GetDungeonModeSpecial
	cmp r0, #2
	bne _0204F424
	add r1, sp, #2
	add r2, sp, #0
	mov r0, r5
	bl sub_0205EE40
	cmp r0, #0
	beq _0204F424
	ldrsh r0, [sp]
	cmp r0, #0
	movne r0, #0x21
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #2]
	cmp r0, #0
	movne r0, #0x41
	ldmneia sp!, {r3, r4, r5, pc}
_0204F424:
	cmp r5, #0x26
	cmpne r5, #0x29
	cmpne r5, #0x3f
	cmpne r5, #0x63
	cmpne r5, #0x64
	cmpne r5, #0x65
	cmpne r5, #0x66
	cmpne r5, #0x67
	cmpne r5, #0x68
	cmpne r5, #0x6b
	cmpne r5, #0x6c
	cmpne r5, #0x6d
	cmpne r5, #0x6e
	cmpne r5, #0xae
	ldreq r0, _0204F484 ; =0x00004001
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0
	bl sub_0204F284
	mov r4, r0
	mov r0, r5
	bl sub_0204F364
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204F484: .word 0x00004001
	arm_func_end CheckMissionRestrictions

	arm_func_start sub_0204F488
sub_0204F488: ; 0x0204F488
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl DungeonSwapIdToIdx
	mov r5, r0
	mov r0, sb
	bl GetMaxReachedFloor
	mov r6, r0
	mov r0, r5
	bl GetDungeonMode
	mov r4, r0
	cmp r4, #1
	moveq r0, #0x11
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #1
	bge _0204F4EC
	mov r0, r5
	bl sub_0204CEE0
	cmp r0, #0
	bne _0204F4EC
	cmp r4, #3
	movne r0, #5
	moveq r0, #9
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0204F4EC:
	cmp r8, r6
	movgt r0, #9
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp sb, #0x26
	cmpne sb, #0x29
	cmpne sb, #0x3f
	cmpne sb, #0x63
	cmpne sb, #0x64
	cmpne sb, #0x65
	cmpne sb, #0x66
	cmpne sb, #0x67
	cmpne sb, #0x68
	cmpne sb, #0x6b
	cmpne sb, #0x6c
	cmpne sb, #0x6d
	cmpne sb, #0x6e
	cmpne sb, #0xae
	ldreq r0, _0204F558 ; =0x00004001
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r7
	bl sub_0204F284
	mov r4, r0
	mov r0, sb
	bl sub_0204F364
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204F558: .word 0x00004001
	arm_func_end sub_0204F488

	arm_func_start sub_0204F55C
sub_0204F55C: ; 0x0204F55C
	ldr r1, _0204F578 ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r1, r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0204F578: .word SECONDARY_TERRAIN_TYPES
	arm_func_end sub_0204F55C

	arm_func_start GetNbFloors
GetNbFloors: ; 0x0204F57C
	cmp r0, #0xb4
	blo _0204F590
	cmp r0, #0xbd
	movls r0, #5
	bxls lr
_0204F590:
	cmp r0, #0xbe
	moveq r0, #1
	bxeq lr
	cmp r0, #0xbf
	ldrlo r1, _0204F5B0 ; =DUNGEON_DATA_LIST
	movhs r0, #0x30
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5B0: .word DUNGEON_DATA_LIST
	arm_func_end GetNbFloors

	arm_func_start GetNbFloorsPlusOne
GetNbFloorsPlusOne: ; 0x0204F5B4
	stmdb sp!, {r3, lr}
	bl GetNbFloors
	add r0, r0, #1
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end GetNbFloorsPlusOne

	arm_func_start GetDungeonGroup
GetDungeonGroup: ; 0x0204F5C8
	cmp r0, #0xb4
	ldrlo r1, _0204F5DC ; =_0209E3A1
	movhs r0, #0x35
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5DC: .word _0209E3A1
	arm_func_end GetDungeonGroup

	arm_func_start GetNbPrecedingFloors
GetNbPrecedingFloors: ; 0x0204F5E0
	cmp r0, #0xb4
	ldrlo r1, _0204F5F4 ; =_0209E3A2
	movhs r0, #0
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5F4: .word _0209E3A2
	arm_func_end GetNbPrecedingFloors

	arm_func_start GetNbFloorsDungeonGroup
GetNbFloorsDungeonGroup: ; 0x0204F5F8
	cmp r0, #0xb4
	ldrlo r1, _0204F60C ; =_0209E3A3
	movhs r0, #0
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F60C: .word _0209E3A3
	arm_func_end GetNbFloorsDungeonGroup

	arm_func_start sub_0204F610
sub_0204F610: ; 0x0204F610
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0xb4
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	bl GetMaxMembersAllowed
	cmp r0, #1
	bne _0204F644
	mov r0, r4
	bl IsRecruitingAllowed
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0204F644:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F610

	arm_func_start DungeonFloorToGroupFloor
DungeonFloorToGroupFloor: ; 0x0204F64C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r0
	ldrb r0, [r5]
	cmp r0, #0xb4
	blo _0204F690
	cmp r0, #0xbd
	bhi _0204F690
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	sub r0, r0, #0xb4
	add r0, r0, r0, lsl #2
	add r0, r1, r0
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F690:
	cmp r0, #0xbe
	bne _0204F6B0
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5, #1]
	add r0, r0, #0x32
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F6B0:
	cmp r0, #0xbf
	blo _0204F6D8
	cmp r0, #0xd3
	bhi _0204F6D8
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5, #1]
	add r0, r0, #0x33
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F6D8:
	bl GetDungeonGroup
	strb r0, [r4]
	ldrb r0, [r5]
	bl GetNbPrecedingFloors
	ldrb r1, [r5, #1]
	add r0, r1, r0
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonFloorToGroupFloor

	arm_func_start sub_0204F6F8
sub_0204F6F8: ; 0x0204F6F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r1, r2
	bl sub_0204F77C
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _0204F770
_0204F718: ; jump table
	b _0204F728 ; case 0
	b _0204F734 ; case 1
	b _0204F74C ; case 2
	b _0204F760 ; case 3
_0204F728:
	bl GetGroundNameId
	mov r4, r0
	b _0204F770
_0204F734:
	bl GetGroundNameId
#ifdef JAPAN
	add r0, r0, #3
	add r0, r0, #0x100
#else
	ldr r1, _0204F778 ; =0xFFFFFEFD
	add r0, r0, r1
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	b _0204F770
_0204F74C:
#if defined(EUROPE)
	add r0, r0, #0xbe
	add r0, r0, #0x4300
#elif defined(JAPAN)
	add r0, r0, #0x26c
	add r0, r0, #0x400
#else
	add r0, r0, #0x3bc
	add r0, r0, #0x4000
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	b _0204F770
_0204F760:
#if defined(EUROPE)
	add r0, r0, #0xbd
	add r0, r0, #0x4200
#elif defined(JAPAN)
	add r0, r0, #0x6f
	add r0, r0, #0x700
#else
	add r0, r0, #0xbb
	add r0, r0, #0x4200
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
_0204F770:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifndef JAPAN
_0204F778: .word 0xFFFFFEFD
#endif
	arm_func_end sub_0204F6F8

	arm_func_start sub_0204F77C
sub_0204F77C: ; 0x0204F77C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	beq _0204F7A0
	cmp r5, #0xae
	bne _0204F7A0
	bl GetNbFloorsDungeonGroup
	cmp r4, r0
	moveq r5, #0x7f
_0204F7A0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204F77C

	arm_func_start sub_0204F7A8
sub_0204F7A8: ; 0x0204F7A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb4
	movhs r0, #1
	bhs _0204F808
	bl GetNbFloors
	add r1, r0, #1
	ldrb r0, [r4, #1]
	and r1, r1, #0xff
	cmp r0, r1
	movhs r0, #1
	bhs _0204F808
	add r0, sp, #0
	mov r1, r4
	bl DungeonFloorToGroupFloor
	ldrb r2, [sp]
	cmp r2, #0x64
	movhs r0, #1
	ldrlo r1, _0204F810 ; =MISSION_FLOOR_RANKS_PTRS
	ldrlob r0, [sp, #1]
	ldrlo r1, [r1, r2, lsl #2]
	ldrlob r0, [r1, r0]
_0204F808:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0204F810: .word MISSION_FLOOR_RANKS_PTRS
	arm_func_end sub_0204F7A8

	arm_func_start GetMissionRank
GetMissionRank: ; 0x0204F814
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb4
	movhs r0, #1
	bhs _0204F880
	bl GetNbFloors
	add r1, r0, #1
	ldrb r0, [r4, #1]
	and r1, r1, #0xff
	cmp r0, r1
	movhs r0, #1
	bhs _0204F880
	add r0, sp, #0
	mov r1, r4
	bl DungeonFloorToGroupFloor
	ldrb r2, [sp]
	cmp r2, #0x64
	movhs r0, #1
	bhs _0204F880
	ldrb r1, [sp, #1]
	ldr r0, _0204F888 ; =MISSION_FLOOR_RANKS_PTRS
	cmp r1, #1
	ldr r0, [r0, r2, lsl #2]
	movle r1, #2
	ldrb r0, [r0, r1]
_0204F880:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0204F888: .word MISSION_FLOOR_RANKS_PTRS
	arm_func_end GetMissionRank

	arm_func_start GetOutlawLevel
GetOutlawLevel: ; 0x0204F88C
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8A4 ; =OUTLAW_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8A4: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawLevel

	arm_func_start GetOutlawLeaderLevel
GetOutlawLeaderLevel: ; 0x0204F8A8
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8C0 ; =OUTLAW_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8C0: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawLeaderLevel

	arm_func_start GetOutlawMinionLevel
GetOutlawMinionLevel: ; 0x0204F8C4
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8DC ; =OUTLAW_MINION_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8DC: .word OUTLAW_MINION_LEVEL_TABLE
	arm_func_end GetOutlawMinionLevel

	arm_func_start AddGuestMonster
AddGuestMonster: ; 0x0204F8E0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	add lr, sp, #0x18
	mov r5, r0
	mov r4, r1
	mov r6, r2
	mov ip, #2
_0204F8FC:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F8FC
	ldr r1, [r6]
	mov r0, #1
	str r1, [lr]
	strb r0, [r5, #0xf]
	ldrsh r0, [sp, #0x1c]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0
	mov r2, #0xa
	bl StrncpyName
	add r2, sp, #0
	add r1, r5, #0x1c
	mov r0, #0x44
	mla r0, r4, r0, r1
	add r1, sp, #0x18
	str r2, [sp, #0x18]
	bl GuestMonsterToGroundMonster
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end AddGuestMonster

	arm_func_start GetGroundNameId
GetGroundNameId: ; 0x0204F958
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #6
	bne _0204F980
	mov r0, #0x1b
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _0204F99C
	ldr r0, _0204F9B0 ; =0x000042B9
	ldmia sp!, {r4, pc}
_0204F980:
	cmp r4, #0x15
	bne _0204F99C
	mov r0, #0x1c
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
#ifdef JAPAN
	moveq r0, #0x1c4
#else
	ldreq r0, _0204F9B4 ; =0x000042BA
#endif
	ldmeqia sp!, {r4, pc}
_0204F99C:
#if defined(EUROPE)
	add r0, r4, #0xba
	add r0, r0, #0x4100
#elif defined(JAPAN)
	add r0, r4, #0xc2
#else
	add r0, r4, #0x1b8
	add r0, r0, #0x4000
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0204F9B0: .word 0x000042BB
_0204F9B4: .word 0x000042BC
#elif defined(JAPAN)
_0204F9B0: .word 0x000001C3
#else
_0204F9B0: .word 0x000042B9
_0204F9B4: .word 0x000042BA
#endif
	arm_func_end GetGroundNameId

	arm_func_start sub_0204F9B8
sub_0204F9B8: ; 0x0204F9B8
	ldr ip, _0204F9C4 ; =ResetPlayTimer
	ldr r0, _0204F9C8 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9C4: .word ResetPlayTimer
_0204F9C8: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9B8

	arm_func_start sub_0204F9CC
sub_0204F9CC: ; 0x0204F9CC
	ldr ip, _0204F9D8 ; =PlayTimerTick
	ldr r0, _0204F9DC ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9D8: .word PlayTimerTick
_0204F9DC: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9CC

	arm_func_start sub_0204F9E0
sub_0204F9E0: ; 0x0204F9E0
	ldr ip, _0204F9EC ; =GetPlayTimeSeconds
	ldr r0, _0204F9F0 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9EC: .word GetPlayTimeSeconds
_0204F9F0: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9E0

	arm_func_start sub_0204F9F4
sub_0204F9F4: ; 0x0204F9F4
	ldr ip, _0204FA04 ; =sub_02050E5C
	mov r1, r0
	ldr r0, _0204FA08 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA04: .word sub_02050E5C
_0204FA08: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9F4

	arm_func_start sub_0204FA0C
sub_0204FA0C: ; 0x0204FA0C
	ldr ip, _0204FA1C ; =sub_02050E8C
	mov r1, r0
	ldr r0, _0204FA20 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA1C: .word sub_02050E8C
_0204FA20: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204FA0C

	arm_func_start SetAdventureLogStructLocation
SetAdventureLogStructLocation: ; 0x0204FA24
	ldr r1, _0204FA34 ; =_022AB69C
	ldr r0, _0204FA38 ; =ADVENTURE_LOG_PTR
	str r1, [r0]
	bx lr
	.align 2, 0
_0204FA34: .word _022AB69C
_0204FA38: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogStructLocation

	arm_func_start SetAdventureLogDungeonFloor
SetAdventureLogDungeonFloor: ; 0x0204FA3C
	ldr r1, _0204FA58 ; =ADVENTURE_LOG_PTR
	ldrb r2, [r0]
	ldr r1, [r1]
	strb r2, [r1, #0x278]
	ldrb r0, [r0, #1]
	strb r0, [r1, #0x279]
	bx lr
	.align 2, 0
_0204FA58: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogDungeonFloor

	arm_func_start GetAdventureLogDungeonFloor
GetAdventureLogDungeonFloor: ; 0x0204FA5C
	ldr r0, _0204FA6C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	add r0, r0, #0x278
	bx lr
	.align 2, 0
_0204FA6C: .word ADVENTURE_LOG_PTR
	arm_func_end GetAdventureLogDungeonFloor

	arm_func_start ClearAdventureLogStruct
ClearAdventureLogStruct: ; 0x0204FA70
	mov r3, #0
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r0, r3
_0204FA7C:
	ldr r2, [r1]
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #4
	blt _0204FA7C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x2c]
	ldr r2, [r1]
	str r0, [r2, #0x30]
	ldr r2, [r1]
	str r0, [r2, #0x34]
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	str r0, [r2, #0x14]
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r2, [r1]
	str r0, [r2, #0x1c]
	ldr r2, [r1]
	str r0, [r2, #0x20]
	ldr r2, [r1]
	str r0, [r2, #0x24]
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r2, [r1]
	str r0, [r2, #0x3c]
	ldr r2, [r1]
	str r0, [r2, #0x40]
_0204FB00:
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	str r3, [r2, #0x44]
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	add r0, r0, #1
	str r3, [r2, #0xd8]
	cmp r0, #0x25
	blt _0204FB00
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r2, #0
_0204FB2C:
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x16c]
	cmp r3, #0x11
	blt _0204FB2C
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov ip, #0
_0204FB4C:
	ldr r1, [r0]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str ip, [r1, #0x1b0]
	cmp r2, #0x2c
	blt _0204FB4C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	ldr r0, [r1]
	str ip, [r0, #0x260]
	mov r0, #0x3e8
_0204FB74:
	rsb r2, ip, #5
	mul r3, r2, r0
	ldr r2, [r1]
	add r2, r2, ip, lsl #2
	add ip, ip, #1
	str r3, [r2, #0x264]
	cmp ip, #5
	blt _0204FB74
	bx lr
	.align 2, 0
_0204FB98: .word ADVENTURE_LOG_PTR
	arm_func_end ClearAdventureLogStruct

	arm_func_start SetAdventureLogCompleted
SetAdventureLogCompleted: ; 0x0204FB9C
	ldr r1, _0204FBC0 ; =ADVENTURE_LOG_PTR
	mov r3, r0, asr #5
	ldr ip, [r1]
	and r0, r0, #0x1f
	ldr r2, [ip, r3, lsl #2]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [ip, r3, lsl #2]
	bx lr
	.align 2, 0
_0204FBC0: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogCompleted

	arm_func_start IsAdventureLogNotEmpty
IsAdventureLogNotEmpty: ; 0x0204FBC4
	ldr r0, _0204FBF8 ; =ADVENTURE_LOG_PTR
	mov r1, #0
	ldr r2, [r0]
	b _0204FBE8
_0204FBD4:
	ldr r0, [r2, r1, lsl #2]
	cmp r0, #0
	movne r0, #1
	bxne lr
	add r1, r1, #1
_0204FBE8:
	cmp r1, #4
	blt _0204FBD4
	mov r0, #0
	bx lr
	.align 2, 0
_0204FBF8: .word ADVENTURE_LOG_PTR
	arm_func_end IsAdventureLogNotEmpty

	arm_func_start GetAdventureLogCompleted
GetAdventureLogCompleted: ; 0x0204FBFC
	ldr r1, _0204FC24 ; =ADVENTURE_LOG_PTR
	mov r2, r0, asr #5
	ldr r1, [r1]
	and r3, r0, #0x1f
	ldr r0, [r1, r2, lsl #2]
	mov r1, #1
	tst r0, r1, lsl r3
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204FC24: .word ADVENTURE_LOG_PTR
	arm_func_end GetAdventureLogCompleted

	arm_func_start IncrementNbDungeonsCleared
IncrementNbDungeonsCleared: ; 0x0204FC28
	ldr r0, _0204FC64 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FC68 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x10]
	add r2, r2, #1
	str r2, [r3, #0x10]
	ldr r3, [r0]
	ldr r2, [r3]
	orr r2, r2, #0x10
	str r2, [r3]
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, r1
	strgt r1, [r2, #0x10]
	bx lr
	.align 2, 0
_0204FC64: .word ADVENTURE_LOG_PTR
_0204FC68: .word 0x000F423F
	arm_func_end IncrementNbDungeonsCleared

	arm_func_start GetNbDungeonsCleared
GetNbDungeonsCleared: ; 0x0204FC6C
	ldr r0, _0204FC7C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0204FC7C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbDungeonsCleared

	arm_func_start IncrementNbFriendRescues
IncrementNbFriendRescues: ; 0x0204FC80
	ldr r0, _0204FCC0 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FCC4 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x14]
	add r2, r2, #1
	str r2, [r3, #0x14]
	ldr r2, [r0]
	ldr r0, [r2, #0x14]
	cmp r0, r1
	ldr r0, _0204FCC0 ; =ADVENTURE_LOG_PTR
	strgt r1, [r2, #0x14]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x40
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FCC0: .word ADVENTURE_LOG_PTR
_0204FCC4: .word 0x000F423F
	arm_func_end IncrementNbFriendRescues

	arm_func_start GetNbFriendRescues
GetNbFriendRescues: ; 0x0204FCC8
	ldr r0, _0204FCD8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0204FCD8: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbFriendRescues

	arm_func_start IncrementNbEvolutions
IncrementNbEvolutions: ; 0x0204FCDC
	ldr r0, _0204FD1C ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FD20 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	add r2, r2, #1
	str r2, [r3, #0x18]
	ldr r2, [r0]
	ldr r0, [r2, #0x18]
	cmp r0, r1
	ldr r0, _0204FD1C ; =ADVENTURE_LOG_PTR
	strgt r1, [r2, #0x18]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x80
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FD1C: .word ADVENTURE_LOG_PTR
_0204FD20: .word 0x000F423F
	arm_func_end IncrementNbEvolutions

	arm_func_start GetNbEvolutions
GetNbEvolutions: ; 0x0204FD24
	ldr r0, _0204FD34 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bx lr
	.align 2, 0
_0204FD34: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbEvolutions

	arm_func_start IncrementNbSteals
IncrementNbSteals: ; 0x0204FD38
	bx lr
	arm_func_end IncrementNbSteals

	arm_func_start IncrementNbEggsHatched
IncrementNbEggsHatched: ; 0x0204FD3C
	ldr r1, _0204FD70 ; =ADVENTURE_LOG_PTR
	ldr r0, _0204FD74 ; =0x000F423F
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	cmp r1, r0
	addlt r0, r1, #1
	strlt r0, [r2, #0x1c]
	ldr r0, _0204FD70 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x100
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FD70: .word ADVENTURE_LOG_PTR
_0204FD74: .word 0x000F423F
	arm_func_end IncrementNbEggsHatched

	arm_func_start GetNbEggsHatched
GetNbEggsHatched: ; 0x0204FD78
	ldr r0, _0204FD88 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bx lr
	.align 2, 0
_0204FD88: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbEggsHatched

	arm_func_start GetNbPokemonJoined
GetNbPokemonJoined: ; 0x0204FD8C
	ldr r0, _0204FD9C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bx lr
	.align 2, 0
_0204FD9C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbPokemonJoined

	arm_func_start GetNbMovesLearned
GetNbMovesLearned: ; 0x0204FDA0
	ldr r0, _0204FDB0 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bx lr
	.align 2, 0
_0204FDB0: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbMovesLearned

	arm_func_start SetVictoriesOnOneFloor
SetVictoriesOnOneFloor: ; 0x0204FDB4
	ldr r1, _0204FDE0 ; =0x000F423F
	cmp r0, r1
	movgt r0, r1
	ldr r1, _0204FDE4 ; =ADVENTURE_LOG_PTR
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r1, [r1]
	ldr r0, [r1]
	orr r0, r0, #0x200
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FDE0: .word 0x000F423F
_0204FDE4: .word ADVENTURE_LOG_PTR
	arm_func_end SetVictoriesOnOneFloor

	arm_func_start GetVictoriesOnOneFloor
GetVictoriesOnOneFloor: ; 0x0204FDE8
	ldr r0, _0204FDF8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_0204FDF8: .word ADVENTURE_LOG_PTR
	arm_func_end GetVictoriesOnOneFloor

	arm_func_start SetPokemonJoined
SetPokemonJoined: ; 0x0204FDFC
	stmdb sp!, {r3, lr}
	bl GetDexNumberVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _0204FE54 ; =ADVENTURE_LOG_PTR
	mov r1, r0, asr #4
	ldr lr, [r3]
	add r1, r0, r1, lsr #27
	ldr ip, [lr]
	mov r2, r0, lsr #0x1f
	orr ip, ip, #1
	str ip, [lr]
	ldr r3, [r3]
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0x44
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204FE54: .word ADVENTURE_LOG_PTR
	arm_func_end SetPokemonJoined

	arm_func_start SetPokemonBattled
SetPokemonBattled: ; 0x0204FE58
	stmdb sp!, {r3, lr}
	bl GetDexNumberVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _0204FEB0 ; =ADVENTURE_LOG_PTR
	mov r1, r0, asr #4
	ldr lr, [r3]
	add r1, r0, r1, lsr #27
	ldr ip, [lr]
	mov r2, r0, lsr #0x1f
	orr ip, ip, #2
	str ip, [lr]
	ldr r3, [r3]
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0xd8
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204FEB0: .word ADVENTURE_LOG_PTR
	arm_func_end SetPokemonBattled

	arm_func_start GetNbPokemonBattled
GetNbPokemonBattled: ; 0x0204FEB4
	ldr r0, _0204FEC4 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0204FEC4: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbPokemonBattled

	arm_func_start IncrementNbBigTreasureWins
IncrementNbBigTreasureWins: ; 0x0204FEC8
	ldr r0, _0204FEE0 ; =ADVENTURE_LOG_PTR
	ldr ip, _0204FEE4 ; =SetNbBigTreasureWins
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	add r0, r0, #1
	bx ip
	.align 2, 0
_0204FEE0: .word ADVENTURE_LOG_PTR
_0204FEE4: .word SetNbBigTreasureWins
	arm_func_end IncrementNbBigTreasureWins

	arm_func_start SetNbBigTreasureWins
SetNbBigTreasureWins: ; 0x0204FEE8
	ldr r2, _0204FF18 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FF1C ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x400
	ldr r1, _0204FF18 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0204FF18: .word ADVENTURE_LOG_PTR
_0204FF1C: .word 0x000F423F
	arm_func_end SetNbBigTreasureWins

	arm_func_start GetNbBigTreasureWins
GetNbBigTreasureWins: ; 0x0204FF20
	ldr r0, _0204FF30 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bx lr
	.align 2, 0
_0204FF30: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbBigTreasureWins

	arm_func_start SetNbRecycled
SetNbRecycled: ; 0x0204FF34
	ldr r2, _0204FF64 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FF68 ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x800
	ldr r1, _0204FF64 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0204FF64: .word ADVENTURE_LOG_PTR
_0204FF68: .word 0x000F423F
	arm_func_end SetNbRecycled

	arm_func_start GetNbRecycled
GetNbRecycled: ; 0x0204FF6C
	ldr r0, _0204FF7C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bx lr
	.align 2, 0
_0204FF7C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbRecycled

	arm_func_start IncrementNbSkyGiftsSent
IncrementNbSkyGiftsSent: ; 0x0204FF80
	ldr r0, _0204FF98 ; =ADVENTURE_LOG_PTR
	ldr ip, _0204FF9C ; =SetNbSkyGiftsSent
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	add r0, r0, #1
	bx ip
	.align 2, 0
_0204FF98: .word ADVENTURE_LOG_PTR
_0204FF9C: .word SetNbSkyGiftsSent
	arm_func_end IncrementNbSkyGiftsSent

	arm_func_start SetNbSkyGiftsSent
SetNbSkyGiftsSent: ; 0x0204FFA0
	ldr r2, _0204FFD0 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FFD4 ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x1000
	ldr r1, _0204FFD0 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
_0204FFD0: .word ADVENTURE_LOG_PTR
_0204FFD4: .word 0x000F423F
	arm_func_end SetNbSkyGiftsSent

	arm_func_start GetNbSkyGiftsSent
GetNbSkyGiftsSent: ; 0x0204FFD8
	ldr r0, _0204FFE8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bx lr
	.align 2, 0
_0204FFE8: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbSkyGiftsSent

	arm_func_start ComputeSpecialCounters
ComputeSpecialCounters: ; 0x0204FFEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r8, r4
_0204FFF8:
	mov r0, #0x44
	mul sl, r8, r0
	ldr r0, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0, sl]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205009C
	mov sb, #0
	mov r7, #1
	ldr r3, _02050230 ; =ADVENTURE_LOG_PTR
	ldr ip, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, sb
	mov lr, r7
	mov r2, #6
_0205003C:
	mul r1, sb, r2
	ldr r0, [ip]
	add r0, r0, sl
	add r5, r0, #0x22
	ldrb r0, [r5, r1]
	add r1, r5, r1
	tst r0, #1
	movne r0, r7
	moveq r0, fp
	tst r0, #0xff
	beq _02050090
	ldrh r0, [r1, #2]
	ldr r5, [r3]
	mov r1, r0, lsr #5
	add r6, r5, r1, lsl #2
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	ldr r5, [r6, #0x16c]
	add r0, r1, r0, ror #27
	orr r0, r5, lr, lsl r0
	str r0, [r6, #0x16c]
_02050090:
	add sb, sb, #1
	cmp sb, #4
	blt _0205003C
_0205009C:
	ldr r0, _02050234 ; =0x0000022B
	add r8, r8, #1
	cmp r8, r0
	blt _0204FFF8
	mov r6, #0
	add r5, r0, #0x258
_020500B4:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDexNumberVeneer
	add r6, r6, #1
	cmp r6, r5
	blt _020500B4
	mov r7, #0
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sb, _02050238 ; =0x0000021F
	mov r8, r7
	mov r6, #1
_020500E0:
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	bl IsRealMove
	cmp r0, #0
	beq _02050120
	mov r0, r8, asr #4
	add r0, r8, r0, lsr #27
	ldr r2, [r5]
	mov r0, r0, asr #5
	add r2, r2, r0, lsl #2
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #27
	ldr r2, [r2, #0x16c]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	addne r7, r7, #1
_02050120:
	add r8, r8, #1
	cmp r8, sb
	blt _020500E0
	cmp r7, #0
	ble _02050150
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	str r7, [r1, #0x34]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
_02050150:
	mov sb, #1
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sl, _0205023C ; =0x00000483
	mov r8, #0
	mov r6, sb
_02050164:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetBaseFormCastformCherrimDeoxys
	mov r7, r0
	bl GetDexNumberVeneer
	cmp r0, #0
	beq _020501B4
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	ldr r3, [r5]
	mov r2, r1, asr #5
	mov r1, r0, lsr #0x1f
	add r2, r3, r2, lsl #2
	rsb r0, r1, r0, lsl #27
	ldr r2, [r2, #0x44]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	beq _020501B4
	mov r0, r7
	bl RecruitSpecialPokemonLog
_020501B4:
	add sb, sb, #1
	cmp sb, sl
	blt _02050164
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	mov r2, #1
	ldr r1, [r0]
	ldr r3, _02050240 ; =0x000001ED
	mov r0, r2
_020501D4:
	mov r5, r2, asr #4
	add r5, r2, r5, lsr #27
	mov sb, r5, asr #5
	mov r6, r2, lsr #0x1f
	rsb r5, r6, r2, lsl #27
	add r7, r1, sb, lsl #2
	add r6, r6, r5, ror #27
	add r5, r1, sb, lsl #2
	ldr r7, [r7, #0x44]
	ldr r5, [r5, #0xd8]
	tst r7, r0, lsl r6
	addne r8, r8, #1
	tst r5, r0, lsl r6
	add r2, r2, #1
	addne r4, r4, #1
	cmp r2, r3
	blt _020501D4
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	str r8, [r1, #0x2c]
	ldr r0, [r0]
	str r4, [r0, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205022C: .word TEAM_MEMBER_TABLE_PTR
_02050230: .word ADVENTURE_LOG_PTR
_02050234: .word 0x0000022B
_02050238: .word 0x0000021F
_0205023C: .word 0x00000483
_02050240: .word 0x000001ED
	arm_func_end ComputeSpecialCounters

	arm_func_start RecruitSpecialPokemonLog
RecruitSpecialPokemonLog: ; 0x02050244
	stmdb sp!, {r3, lr}
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	ldr r2, _020502AC ; =ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	mov r3, #0
	movge r0, r0, asr #0x10
_02050260:
	mov r1, r3, lsl #1
	ldrsh r1, [r2, r1]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r1, #0xc9
	bne _0205028C
	cmp r0, #0xc9
	blt _02050294
	cmp r0, #0xe4
	ble _0205029C
	b _02050294
_0205028C:
	cmp r1, r0
	beq _0205029C
_02050294:
	add r3, r3, #1
	b _02050260
_0205029C:
	add r0, r3, #0x24
	and r0, r0, #0xff
	bl SetAdventureLogCompleted
	ldmia sp!, {r3, pc}
	.align 2, 0
_020502AC: .word ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	arm_func_end RecruitSpecialPokemonLog

	arm_func_start IncrementNbFainted
IncrementNbFainted: ; 0x020502B0
	ldr r1, _020502E4 ; =ADVENTURE_LOG_PTR
	ldr r0, _020502E8 ; =0x000F423F
	ldr r2, [r1]
	ldr r1, [r2, #0x24]
	cmp r1, r0
	addlt r0, r1, #1
	strlt r0, [r2, #0x24]
	ldr r0, _020502E4 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x20
	str r0, [r1]
	bx lr
	.align 2, 0
_020502E4: .word ADVENTURE_LOG_PTR
_020502E8: .word 0x000F423F
	arm_func_end IncrementNbFainted

	arm_func_start GetNbFainted
GetNbFainted: ; 0x020502EC
	ldr r0, _020502FC ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bx lr
	.align 2, 0
_020502FC: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbFainted

	arm_func_start SetItemAcquired
SetItemAcquired: ; 0x02050300
	stmdb sp!, {r4, r5, r6, lr}
	ldrsh r0, [r0, #4]
	bl NormalizeTreasureBox
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsItemValidVeneer
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0x3b
	blt _02050380
	cmp r4, #0x41
	bgt _02050380
	sub r0, r4, #0x21
	and r0, r0, #0xff
	mov r5, #1
	bl SetAdventureLogCompleted
	mov r6, #0x1a
	b _02050364
_0205034C:
	and r0, r6, #0xff
	bl GetAdventureLogCompleted
	cmp r0, #0
	moveq r5, #0
	beq _0205036C
	add r6, r6, #1
_02050364:
	cmp r6, #0x20
	ble _0205034C
_0205036C:
	cmp r5, #0
	beq _02050380
	mov r0, #0x15
	mov r1, #1
	bl sub_0204CB2C
_02050380:
	ldr r3, _020503C8 ; =ADVENTURE_LOG_PTR
	mov r0, r4, asr #4
	ldr ip, [r3]
	add r0, r4, r0, lsr #27
	mov r2, r4, lsr #0x1f
	rsb r1, r2, r4, lsl #27
	add lr, ip, #0x1b0
	mov ip, r0, asr #5
	ldr r4, [lr, ip, lsl #2]
	add r0, r2, r1, ror #27
	mov r1, #1
	orr r0, r4, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldr r1, [r3]
	ldr r0, [r1]
	orr r0, r0, #8
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020503C8: .word ADVENTURE_LOG_PTR
	arm_func_end SetItemAcquired

	arm_func_start GetNbItemAcquired
GetNbItemAcquired: ; 0x020503CC
	stmdb sp!, {r4, lr}
	ldr r1, _0205041C ; =ADVENTURE_LOG_PTR
	mov r0, #0
	ldr r4, [r1]
	mov lr, r0
	mov ip, #1
_020503E4:
	mov r1, lr, asr #4
	add r1, lr, r1, lsr #27
	mov r1, r1, asr #5
	add r3, r4, r1, lsl #2
	mov r2, lr, lsr #0x1f
	rsb r1, r2, lr, lsl #27
	ldr r3, [r3, #0x1b0]
	add r1, r2, r1, ror #27
	tst r3, ip, lsl r1
	add lr, lr, #1
	addne r0, r0, #1
	cmp lr, #0x580
	blt _020503E4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205041C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbItemAcquired

	arm_func_start SetChallengeLetterCleared
SetChallengeLetterCleared: ; 0x02050420
	stmdb sp!, {r4, lr}
	ldr r3, _020504A0 ; =ADVENTURE_LOG_PTR
	mov r2, r0, lsr #0x1f
	ldr ip, [r3]
	rsb r1, r2, r0, lsl #27
	mov lr, r0, lsr #5
	add r4, ip, #0x260
	ldr ip, [r4, lr, lsl #2]
	add r1, r2, r1, ror #27
	mov r0, #1
	orr r1, ip, r0, lsl r1
	str r1, [r4, lr, lsl #2]
	ldr r4, [r3]
	mov ip, r0
	b _02050488
_0205045C:
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	mov r1, r1, asr #5
	add r3, r4, r1, lsl #2
	mov r2, r0, lsr #0x1f
	rsb r1, r2, r0, lsl #27
	ldr r3, [r3, #0x260]
	add r1, r2, r1, ror #27
	tst r3, ip, lsl r1
	ldmeqia sp!, {r4, pc}
	add r0, r0, #1
_02050488:
	cmp r0, #6
	blt _0205045C
	ldr r0, [r4, #4]
	orr r0, r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020504A0: .word ADVENTURE_LOG_PTR
	arm_func_end SetChallengeLetterCleared

	arm_func_start GetSentryDutyGamePoints
GetSentryDutyGamePoints: ; 0x020504A4
	ldr r1, _020504B8 ; =ADVENTURE_LOG_PTR
	ldr r1, [r1]
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0x264]
	bx lr
	.align 2, 0
_020504B8: .word ADVENTURE_LOG_PTR
	arm_func_end GetSentryDutyGamePoints

	arm_func_start SetSentryDutyGamePoints
SetSentryDutyGamePoints: ; 0x020504BC
	stmdb sp!, {r3, lr}
	ldr r1, _02050548 ; =ADVENTURE_LOG_PTR
	mov lr, #0
	ldr r2, [r1]
	b _020504EC
_020504D0:
	add r1, r2, lr, lsl #2
	ldr r1, [r1, #0x264]
	cmp r0, r1
	bhi _020504F4
	add r1, lr, #1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
_020504EC:
	cmp lr, #5
	blt _020504D0
_020504F4:
	cmp lr, #5
	mvnge r0, #0
	ldmgeia sp!, {r3, pc}
	mov ip, #4
	ldr r2, _02050548 ; =ADVENTURE_LOG_PTR
	b _02050528
_0205050C:
	ldr r3, [r2]
	sub r1, ip, #1
	add ip, r3, ip, lsl #2
	ldr r3, [ip, #0x260]
	mov r1, r1, lsl #0x10
	str r3, [ip, #0x264]
	mov ip, r1, asr #0x10
_02050528:
	cmp ip, lr
	bgt _0205050C
	ldr r1, _02050548 ; =ADVENTURE_LOG_PTR
	ldr r1, [r1]
	add r1, r1, lr, lsl #2
	str r0, [r1, #0x264]
	mov r0, lr
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050548: .word ADVENTURE_LOG_PTR
	arm_func_end SetSentryDutyGamePoints

	arm_func_start CopyLogTo
CopyLogTo: ; 0x0205054C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ComputeSpecialCounters
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x10
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x14
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x18
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x80
	ldr r1, [r1]
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x30
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #9
	ldr r1, [r1]
	add r1, r1, #0x34
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x28
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x24
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x1c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x38
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x3c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x40
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0x44
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0xd8
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x220
	add r1, r1, #0x16c
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x580
	add r1, r1, #0x1b0
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x260
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xa0
	add r1, r1, #0x264
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x278
	bl sub_020515C4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050734: .word ADVENTURE_LOG_PTR
	arm_func_end CopyLogTo

	arm_func_start CopyLogFrom
CopyLogFrom: ; 0x02050738
	stmdb sp!, {r4, lr}
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	mov r4, r0
	add r1, r1, #0x10
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x14
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x18
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x80
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x2c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x30
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #9
	ldr r1, [r1]
	add r1, r1, #0x34
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x28
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x24
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x1c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x38
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x3c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x40
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0x44
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0xd8
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x220
	add r1, r1, #0x16c
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x580
	add r1, r1, #0x1b0
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x260
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xa0
	add r1, r1, #0x264
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x278
	bl Copy16BitsFrom
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050918: .word ADVENTURE_LOG_PTR
	arm_func_end CopyLogFrom

	arm_func_start GetAbilityString
GetAbilityString: ; 0x0205091C
#if defined(EUROPE)
	add r1, r1, #0x5e0
	add r1, r1, #0x3000
#elif defined(JAPAN)
	add r1, r1, #0x81
	add r1, r1, #0x4800
#else
	add r1, r1, #0xde
	add r1, r1, #0x3500
#endif
	mov r1, r1, lsl #0x10
	ldr ip, _02050938 ; =CopyNStringFromId
	mov r1, r1, lsr #0x10
	mov r2, #0x50
	bx ip
	.align 2, 0
_02050938: .word CopyNStringFromId
	arm_func_end GetAbilityString

	arm_func_start GetAbilityDescStringId
GetAbilityDescStringId: ; 0x0205093C
#if defined(EUROPE)
	add r0, r0, #0x25c
	add r0, r0, #0x3400
#elif defined(JAPAN)
	add r0, r0, #0xfd
	add r0, r0, #0x4800
#else
	add r0, r0, #0x5a
	add r0, r0, #0x3600
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetAbilityDescStringId

	arm_func_start GetTypeStringId
GetTypeStringId: ; 0x02050950
#if defined(EUROPE)
	add r0, r0, #0xcd
	add r0, r0, #0x3500
#elif defined(JAPAN)
	add r0, r0, #0x6e
	add r0, r0, #0x4800
#else
	add r0, r0, #0xcb
	add r0, r0, #0x3500
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetTypeStringId

	arm_func_start GetConversion2ConvertToType
GetConversion2ConvertToType: ; 0x02050964
	ldr r1, _02050970 ; =_020A192C
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02050970: .word _020A192C
	arm_func_end GetConversion2ConvertToType

	arm_func_start sub_02050974
sub_02050974: ; 0x02050974
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_02050974

	arm_func_start sub_02050990
sub_02050990: ; 0x02050990
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r3, r1, r2
	str r3, [r0, #4]
	mov r0, r1
	ldr ip, _020509B8 ; =MemZero
	mov r1, r2
	bx ip
	.align 2, 0
_020509B8: .word MemZero
	arm_func_end sub_02050990

	arm_func_start sub_020509BC
sub_020509BC: ; 0x020509BC
	bx lr
	arm_func_end sub_020509BC

	arm_func_start CopyBitsTo
CopyBitsTo: ; 0x020509C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0
	mov r3, #1
	mov r5, ip
	mov r4, ip
	b _02050A34
_020509D8:
	ldrb r6, [r1]
	sub r2, r2, #1
	tst r6, r3, lsl ip
	ldrne r7, [r0]
	ldrne lr, [r0, #8]
	ldrneb r6, [r7]
	add ip, ip, #1
	orrne r6, r6, r3, lsl lr
	strneb r6, [r7]
	ldr lr, [r0, #8]
	cmp ip, #8
	add lr, lr, #1
	moveq ip, r5
	addeq r1, r1, #1
	str lr, [r0, #8]
	cmp lr, #8
	ldreq lr, [r0]
	addeq lr, lr, #1
	streq lr, [r0]
	streq r4, [r0, #8]
	ldr lr, [r0, #0xc]
	add lr, lr, #1
	str lr, [r0, #0xc]
_02050A34:
	cmp r2, #0
	bne _020509D8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyBitsTo

	arm_func_start CopyBitsFrom
CopyBitsFrom: ; 0x02050A40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov lr, #0
	mov ip, lr
	mov r3, #1
	mov r6, lr
	mov r5, lr
	b _02050AC0
_02050A5C:
	cmp lr, #0
	streqb ip, [r1]
	ldr r7, [r0]
	ldr r4, [r0, #8]
	ldrb r7, [r7]
	sub r2, r2, #1
	tst r7, r3, lsl r4
	ldrneb r4, [r1]
	orrne r4, r4, r3, lsl lr
	strneb r4, [r1]
	ldr r4, [r0, #8]
	add lr, lr, #1
	cmp lr, #8
	add r4, r4, #1
	moveq lr, r6
	addeq r1, r1, #1
	str r4, [r0, #8]
	cmp r4, #8
	ldreq r4, [r0]
	addeq r4, r4, #1
	streq r4, [r0]
	streq r5, [r0, #8]
	ldr r4, [r0, #0xc]
	add r4, r4, #1
	str r4, [r0, #0xc]
_02050AC0:
	cmp r2, #0
	bne _02050A5C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyBitsFrom

	arm_func_start StoreDefaultTeamData
StoreDefaultTeamData: ; 0x02050ACC
	stmdb sp!, {lr}
	sub sp, sp, #0x14
#ifdef JAPAN
	ldr r1, _02050E54 ; =0x000004C5
	add r0, sp, #0
#else
	add r0, sp, #0
	mov r1, #0x234
#endif
	bl GetStringFromFileVeneer
	ldr r0, _02050B08 ; =TEAM_NAME
	add r1, sp, #0
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpyName
	ldr r0, _02050B0C ; =TEAM_NAME
	mov r1, #0
#ifdef JAPAN
	str r1, [r0, #8]
	strb r1, [r0, #0xc]
#else
	str r1, [r0, #0xc]
	strb r1, [r0, #0x10]
#endif
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
#ifdef JAPAN
_02050E54: .word 0x000004C5
#endif
_02050B08: .word TEAM_NAME
_02050B0C: .word TEAM_NAME
	arm_func_end StoreDefaultTeamData

	arm_func_start GetMainTeamNameWithCheck
GetMainTeamNameWithCheck: ; 0x02050B10
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	mov r4, r0
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldrne r0, _02050B70 ; =TEAM_NAME
	ldrneb r0, [r0]
	cmpne r0, #0
	beq _02050B4C
	ldr r1, _02050B74 ; =TEAM_NAME
	mov r0, r4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPad
	b _02050B68
_02050B4C:
	ldr r1, _02050B78 ; =0x00000237
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r1, sp, #0
	mov r0, r4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpyName
_02050B68:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050B70: .word TEAM_NAME
_02050B74: .word TEAM_NAME
#ifdef JAPAN
_02050B78: .word 0x000004C8
#else
_02050B78: .word 0x00000237
#endif
	arm_func_end GetMainTeamNameWithCheck

	arm_func_start GetMainTeamName
GetMainTeamName: ; 0x02050B7C
	ldr ip, _02050B8C ; =StrncpySimpleNoPadSafe
	ldr r1, _02050B90 ; =TEAM_NAME
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bx ip
	.align 2, 0
_02050B8C: .word StrncpySimpleNoPadSafe
_02050B90: .word TEAM_NAME
	arm_func_end GetMainTeamName

	arm_func_start SetMainTeamName
SetMainTeamName: ; 0x02050B94
	ldr r1, _02050BB4 ; =TEAM_NAME
	mov r3, #0
_02050B9C:
	ldrb r2, [r0], #1
	strb r2, [r1, r3]
	add r3, r3, #1
#ifdef JAPAN
	cmp r3, #5
#else
	cmp r3, #0xa
#endif
	blt _02050B9C
	bx lr
	.align 2, 0
_02050BB4: .word TEAM_NAME
	arm_func_end SetMainTeamName

	arm_func_start GetRankupPoints
GetRankupPoints: ; 0x02050BB8
	stmdb sp!, {r4, lr}
	bl GetRank
	mov r4, r0
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02050BE4
	cmp r4, #0xc
	bne _02050BF0
	mov r0, #0
	ldmia sp!, {r4, pc}
_02050BE4:
	cmp r4, #8
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
_02050BF0:
	mov r0, r4
	bl GetRankUpEntry
	ldr r1, _02050C0C ; =TEAM_NAME
	ldr r2, [r0, #4]
#ifdef JAPAN
	ldr r0, [r1, #8]
#else
	ldr r0, [r1, #0xc]
#endif
	sub r0, r2, r0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050C0C: .word TEAM_NAME
	arm_func_end GetRankupPoints

	arm_func_start sub_02050C10
sub_02050C10: ; 0x02050C10
#ifdef JAPAN
#define SUB_02050C10_OFFSET #8
#else
#define SUB_02050C10_OFFSET #0xc
#endif
	stmdb sp!, {r3, lr}
	ldr r1, _02050C6C ; =TEAM_NAME
	ldr r2, [r1, SUB_02050C10_OFFSET]
	add r2, r2, r0
	mov r0, #0x16
	str r2, [r1, SUB_02050C10_OFFSET]
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02050C4C
	ldr r0, _02050C6C ; =TEAM_NAME
	ldr r1, _02050C70 ; =0x05F5E0FF
	ldr r2, [r0, SUB_02050C10_OFFSET]
	cmp r2, r1
	strgt r1, [r0, SUB_02050C10_OFFSET]
	ldmia sp!, {r3, pc}
_02050C4C:
	mov r0, #7
	bl GetRankUpEntry
	ldr r1, _02050C6C ; =TEAM_NAME
	ldr r2, [r0, #4]
	ldr r0, [r1, SUB_02050C10_OFFSET]
	cmp r0, r2
	strgt r2, [r1, SUB_02050C10_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050C6C: .word TEAM_NAME
_02050C70: .word 0x05F5E0FF
	arm_func_end sub_02050C10

	arm_func_start GetRank
GetRank: ; 0x02050C74
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _02050CCC ; =TEAM_NAME
	b _02050CA4
_02050C84:
	mov r0, r5
	bl GetRankUpEntry
#ifdef JAPAN
	ldr r1, [r4, #8]
#else
	ldr r1, [r4, #0xc]
#endif
	ldr r0, [r0, #4]
	cmp r1, r0
	blt _02050CAC
	add r0, r5, #1
	and r5, r0, #0xff
_02050CA4:
	cmp r5, #0xc
	blo _02050C84
_02050CAC:
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _02050CC4
	cmp r5, #8
	movhi r5, #8
_02050CC4:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02050CCC: .word TEAM_NAME
	arm_func_end GetRank

	arm_func_start sub_02050CD0
sub_02050CD0: ; 0x02050CD0
	stmdb sp!, {r3, lr}
	bl GetRank
	cmp r0, #8
	movhi r0, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_02050CD0

	arm_func_start GetRankStorageSize
GetRankStorageSize: ; 0x02050CE4
	stmdb sp!, {r3, lr}
	bl GetRank
	bl GetRankUpEntry
	ldr r0, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end GetRankStorageSize

	arm_func_start sub_02050CF8
sub_02050CF8: ; 0x02050CF8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r1, _02050D70 ; =TEAM_NAME
	add r0, sp, #0
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x50
#endif
	bl CopyBitsTo
	ldr r1, _02050D74 ; =_022AB924
	add r0, sp, #0
	mov r2, #0x20
	bl CopyBitsTo
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	ldr r1, _02050D78 ; =TEAM_NAME
	tst r0, #0xff
#ifdef JAPAN
	strb r0, [r1, #0xc]
#else
	strb r0, [r1, #0x10]
#endif
	ldrne r1, _02050D7C ; =ARM9_UNKNOWN_DATA__NA_209E6BC
	add r0, sp, #0
	ldreq r1, _02050D80 ; =_0209E6BD
	mov r2, #1
	bl CopyBitsTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050D70: .word TEAM_NAME
_02050D74: .word _022AB924
_02050D78: .word TEAM_NAME
_02050D7C: .word ARM9_UNKNOWN_DATA__NA_209E6BC
_02050D80: .word _0209E6BD
	arm_func_end sub_02050CF8

	arm_func_start sub_02050D84
sub_02050D84: ; 0x02050D84
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl sub_02050974
	ldr r1, _02050DFC ; =TEAM_NAME
	add r0, sp, #4
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x50
#endif
	bl CopyBitsFrom
	ldr r1, _02050E00 ; =_022AB924
	add r0, sp, #4
	mov r2, #0x20
	bl CopyBitsFrom
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _02050E04 ; =TEAM_NAME
	tst r0, #1
	movne r2, #1
	moveq r2, #0
	add r0, sp, #4
#ifdef JAPAN
	strb r2, [r1, #0xc]
#else
	strb r2, [r1, #0x10]
#endif
	bl sub_020509BC
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02050DFC: .word TEAM_NAME
_02050E00: .word _022AB924
_02050E04: .word TEAM_NAME
	arm_func_end sub_02050D84

	arm_func_start ResetPlayTimer
ResetPlayTimer: ; 0x02050E08
	mov r1, #0
	strb r1, [r0, #4]
	str r1, [r0]
	bx lr
	arm_func_end ResetPlayTimer

	arm_func_start PlayTimerTick
PlayTimerTick: ; 0x02050E18
	ldrb r1, [r0, #4]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #4]
	cmp r1, #0x3c
	bxlo lr
	mov r1, #0
	strb r1, [r0, #4]
	ldr r2, [r0]
	ldr r1, _02050E50 ; =0x022550FF
	cmp r2, r1
	addlo r1, r2, #1
	strlo r1, [r0]
	bx lr
	.align 2, 0
_02050E50: .word 0x022550FF
	arm_func_end PlayTimerTick

	arm_func_start GetPlayTimeSeconds
GetPlayTimeSeconds: ; 0x02050E54
	ldr r0, [r0]
	bx lr
	arm_func_end GetPlayTimeSeconds

	arm_func_start sub_02050E5C
sub_02050E5C: ; 0x02050E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #4
	mov r2, #6
	bl CopyBitsTo
	mov r0, r4
	mov r1, r5
	mov r2, #0x20
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02050E5C

	arm_func_start sub_02050E8C
sub_02050E8C: ; 0x02050E8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #4
	mov r2, #6
	bl CopyBitsFrom
	mov r0, r4
	mov r1, r5
	mov r2, #0x20
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02050E8C

	arm_func_start sub_02050EBC
sub_02050EBC: ; 0x02050EBC
	stmdb sp!, {r0, r1, r2, r3}
	ldrsh r3, [sp, #2]
	ldrsh r0, [sp, #6]
	ldrsh r2, [sp]
	ldrsh r1, [sp, #4]
	add r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r0, [sp, #2]
	add r1, r2, r1
	strh r1, [sp]
	cmp r0, #0x3e8
	subge r0, r0, #0x3e8
	ldrgesh r1, [sp]
	strgeh r0, [sp, #2]
	addge r0, r1, #1
	strgeh r0, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02050EBC

	arm_func_start SubFixedPoint
SubFixedPoint: ; 0x02050F10
	stmdb sp!, {r0, r1, r2, r3}
	ldrsh r3, [sp, #2]
	ldrsh r0, [sp, #6]
	ldrsh r2, [sp]
	ldrsh r1, [sp, #4]
	sub r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r0, [sp, #2]
	sub r1, r2, r1
	strh r1, [sp]
	cmp r0, #0
	addlt r0, r0, #0x3e8
	ldrltsh r1, [sp]
	strlth r0, [sp, #2]
	sublt r0, r1, #1
	strlth r0, [sp]
	ldrsh r0, [sp]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [sp, #2]
	strlth r0, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #0x10
	bx lr
	arm_func_end SubFixedPoint

	arm_func_start sub_02050F78
sub_02050F78: ; 0x02050F78
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldrsh r1, [sp, #8]
	ldrsh r0, [sp, #0xc]
	cmp r1, r0
	ldrgth r1, [sp, #0xe]
	ldrgth r0, [sp, #0xc]
	orrgt r0, r0, r1, lsl #16
	bgt _02050FE8
	ldrlth r1, [sp, #0xa]
	ldrlth r0, [sp, #8]
	orrlt r0, r0, r1, lsl #16
	blt _02050FE8
	ldrsh r1, [sp, #0xa]
	ldrsh r0, [sp, #0xe]
	cmp r1, r0
	ldrgth r1, [sp, #0xc]
	ldrgth r0, [sp, #0xe]
	strgth r1, [sp]
	strgth r0, [sp, #2]
	ldrleh r1, [sp, #8]
	ldrleh r0, [sp, #0xa]
	strleh r1, [sp]
	strleh r0, [sp, #2]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
_02050FE8:
	add sp, sp, #4
	ldmia sp!, {r3}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02050F78

	arm_func_start sub_02050FF8
sub_02050FF8: ; 0x02050FF8
	stmdb sp!, {r3}
	sub sp, sp, #4
	strh r0, [sp]
	ldrh r0, [sp]
	mov r1, #0
	strh r1, [sp, #2]
	orr r0, r0, r1, lsl #16
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end sub_02050FF8

	arm_func_start BinToDecFixedPoint
BinToDecFixedPoint: ; 0x02051020
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r2, [r0, #4]
	mov r1, #0x3e8
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mul r1, r0, r1
	mov r2, r2, lsr #0x10
	mov r0, r1, lsr #0x10
	strh r2, [sp]
	strh r0, [sp, #2]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end BinToDecFixedPoint
