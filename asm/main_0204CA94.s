	.include "asm/macros.inc"
	.include "main_0204CA94.inc"

	.text

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
