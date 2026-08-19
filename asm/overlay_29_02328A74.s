	.include "asm/macros.inc"
	.include "overlay_29_02328A74.inc"

	.text

	arm_func_start DoMoveDamagePoison40
DoMoveDamagePoison40: ; 0x02328A74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328AD0
	ldr r1, _02328ADC ; =SMOG_POISON_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328AD0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictPoisonedStatus
_02328AD0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328ADC: .word SMOG_POISON_CHANCE
	arm_func_end DoMoveDamagePoison40
