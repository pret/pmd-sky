	.include "asm/macros.inc"
	.include "overlay_29_022EBC74.inc"

	.text

	arm_func_start SetActionStruggle
SetActionStruggle: ; 0x022EBC74
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x17
	mov r5, r0
	bl SetMonsterActionFields
	cmp r4, #0xff
	andne r0, r4, #7
	strneb r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetActionStruggle

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
