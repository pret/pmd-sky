	.include "asm/macros.inc"
	.include "overlay_29_022EBC98.inc"

	.text

	arm_func_start SetActionUseMovePlayer
SetActionUseMovePlayer: ; 0x022EBC98
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0x14
	mov r6, r0
	mov r4, r2
	bl SetMonsterActionFields
	strb r5, [r6, #4]
	strb r4, [r6, #0xa]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetActionUseMovePlayer
