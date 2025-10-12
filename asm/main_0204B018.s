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
