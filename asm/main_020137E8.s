	.include "asm/macros.inc"
	.include "main_020137E8.inc"

	.text

	arm_func_start InitMoveCheckId
InitMoveCheckId: ; 0x020137E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r4]
	ldmeqia sp!, {r4, pc}
	mov r2, #5
	strb r2, [r4]
	mov r2, #0
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl GetMaxPp
	strb r0, [r4, #6]
	mov r0, #0
	strb r0, [r4, #7]
	ldmia sp!, {r4, pc}
	arm_func_end InitMoveCheckId

	arm_func_start GetInfoMoveGround
GetInfoMoveGround: ; 0x02013828
	mov r2, #5
	strb r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #4]
	bx lr
	arm_func_end GetInfoMoveGround
