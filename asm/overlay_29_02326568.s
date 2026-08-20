	.include "asm/macros.inc"
	.include "overlay_29_02326568.inc"

	.text

	arm_func_start DoMoveSwagger
DoMoveSwagger: ; 0x02326568
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	mov r3, #0
	mov r5, r0
	mov r4, r1
	bl TryInflictConfusedStatus
	ldr r1, _023265A0 ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023265A0: .word ATK_STAT_IDX
	arm_func_end DoMoveSwagger

	arm_func_start DoMoveSnore
DoMoveSnore: ; 0x023265A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02326624
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326634
	ldr r1, _02326640 ; =SNORE_CRINGE_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326634
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictCringeStatus
	b _02326634
_02326624:
	ldr r2, _02326644 ; =0x00000ECD
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02326634:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326640: .word SNORE_CRINGE_CHANCE
#ifdef JAPAN
_02326644: .word 0x00000C0F
#else
_02326644: .word 0x00000ECD
#endif
	arm_func_end DoMoveSnore
