	.include "asm/macros.inc"
	.include "overlay_29_023268CC.inc"

	.text

	arm_func_start DoMoveSmokescreen
DoMoveSmokescreen: ; 0x023268CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02326904 ; =SMOKESCREEN_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl TryInflictWhifferStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02326904: .word SMOKESCREEN_TURN_RANGE
	arm_func_end DoMoveSmokescreen
