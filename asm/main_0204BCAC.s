	.include "asm/macros.inc"
	.include "main_0204BCAC.inc"

	.text

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
