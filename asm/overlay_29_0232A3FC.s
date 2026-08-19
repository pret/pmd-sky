	.include "asm/macros.inc"
	.include "overlay_29_0232A3FC.inc"

	.text

	arm_func_start DoMoveAssist
DoMoveAssist: ; 0x0232A3FC
	stmdb sp!, {r3, lr}
	ldr r2, _0232A410 ; =0x00000EE3
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_0232A410: .word 0x00000C25
#else
_0232A410: .word 0x00000EE3
#endif
	arm_func_end DoMoveAssist

	arm_func_start DoMoveRest
DoMoveRest: ; 0x0232A414
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _0232A454
	mov r0, #0x32
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	movne r2, #1
	moveq r2, #2
	mov r0, r5
	mov r1, r4
	bl TryInflictNappingStatus
	b _0232A474
_0232A454:
	ldr r1, _0232A47C ; =REST_TURN_RANGE
	mov r0, r4
	mov r2, #0
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl TryInflictNappingStatus
_0232A474:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232A47C: .word REST_TURN_RANGE
	arm_func_end DoMoveRest
