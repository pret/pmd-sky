	.include "asm/macros.inc"
	.include "overlay_29_0232B44C.inc"

	.text

	arm_func_start DoMoveTransform
DoMoveTransform: ; 0x0232B44C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsFullFloorFixedRoom
	cmp r0, #0
	beq _0232B47C
	ldr r2, _0232B490 ; =0x00000EED
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0232B47C:
	mov r0, r5
	mov r1, r4
	bl TryTransform
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232B490: .word 0x00000C2F
#else
_0232B490: .word 0x00000EED
#endif
	arm_func_end DoMoveTransform

	arm_func_start DoMovePoisonTail
DoMovePoisonTail: ; 0x0232B494
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232B4F0
	ldr r1, _0232B4FC ; =POISON_TAIL_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B4F0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_0232B4F0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232B4FC: .word POISON_TAIL_POISON_CHANCE
	arm_func_end DoMovePoisonTail
