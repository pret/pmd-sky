	.include "asm/macros.inc"
	.include "overlay_29_023261A0.inc"

	.text

	arm_func_start DoMoveBubble
DoMoveBubble: ; 0x023261A0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023261FC
	ldr r1, _02326208 ; =BUBBLE_LOWER_SPEED_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023261FC
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
_023261FC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326208: .word BUBBLE_LOWER_SPEED_CHANCE
	arm_func_end DoMoveBubble
