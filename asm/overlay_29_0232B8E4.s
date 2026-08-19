	.include "asm/macros.inc"
	.include "overlay_29_0232B8E4.inc"

	.text

	arm_func_start DoMoveCalmMind
DoMoveCalmMind: ; 0x0232B8E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0232B924 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	str r2, [sp]
	bl BoostOffensiveStat
	add r1, sp, #0
	ldr r2, [r1]
	mov r0, r5
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232B924: .word SPATK_STAT_IDX
	arm_func_end DoMoveCalmMind
