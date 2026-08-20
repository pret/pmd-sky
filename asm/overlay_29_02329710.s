	.include "asm/macros.inc"
	.include "overlay_29_02329710.inc"

	.text

	arm_func_start DoMoveThundershock
DoMoveThundershock: ; 0x02329710
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232976C
	ldr r1, _02329778 ; =THUNDERSHOCK_PARALYZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232976C
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_0232976C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02329778: .word THUNDERSHOCK_PARALYZE_CHANCE
	arm_func_end DoMoveThundershock

	arm_func_start DoMoveThunderWave
DoMoveThunderWave: ; 0x0232977C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	bl GetMoveTypeForMonster
	mov r4, r0
	mov r0, r5
	bl GetMoveType
	cmp r4, r0
	bne _023297D4
	mov r0, r7
	mov r1, r6
	mov r2, #0x66
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActiveMoveEffects__02328634
	cmp r0, #0
	beq _023297D4
	mov r0, r6
	bl ActivateMotorDrive
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023297D4:
	mov r0, r7
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMoveThunderWave

	arm_func_start DoMoveZapCannon
DoMoveZapCannon: ; 0x023297F0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02329848
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02329848
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_02329848:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end DoMoveZapCannon
