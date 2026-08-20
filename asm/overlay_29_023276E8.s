	.include "asm/macros.inc"
	.include "overlay_29_023276E8.inc"

	.text

	arm_func_start DoMoveTickle
DoMoveTickle: ; 0x023276E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r2, _02327740 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2, #4]
	str r3, [sp]
	mov r5, r0
	mov r4, r1
	str r2, [sp, #8]
	str r3, [sp, #4]
	bl LowerOffensiveStat
	add r0, sp, #8
	mov r3, #1
	ldr r2, [r0]
	str r3, [sp]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02327740: .word SPATK_STAT_IDX
	arm_func_end DoMoveTickle
