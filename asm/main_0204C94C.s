	.include "asm/macros.inc"
	.include "main_0204C94C.inc"

	.text

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
