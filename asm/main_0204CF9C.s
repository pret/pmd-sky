	.include "asm/macros.inc"
	.include "main_0204CF9C.inc"

	.text

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
