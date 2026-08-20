	.include "asm/macros.inc"
	.include "overlay_29_02326CC8.inc"

	.text

	arm_func_start DoMoveDamageBurn10FlameWheel
DoMoveDamageBurn10FlameWheel: ; 0x02326CC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326D40
	ldr r1, _02326D4C ; =FLAME_WHEEL_BURN_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326D40
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_02326D40:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326D4C: .word FLAME_WHEEL_BURN_CHANCE
	arm_func_end DoMoveDamageBurn10FlameWheel

	arm_func_start DoMoveDamageBurn10
DoMoveDamageBurn10: ; 0x02326D50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326DC8
	ldr r1, _02326DD4 ; =FLAMETHROWER_BURN_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326DC8
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_02326DC8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326DD4: .word FLAMETHROWER_BURN_CHANCE
	arm_func_end DoMoveDamageBurn10
