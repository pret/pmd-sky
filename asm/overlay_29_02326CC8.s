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

	arm_func_start DoMoveExpose
DoMoveExpose: ; 0x02326DD8
	stmdb sp!, {r3, lr}
	ldrh r3, [r2, #4]
	ldr r2, _02326E00 ; =0x0000013B
	cmp r3, r2
	moveq r2, #0x7a
	movne r2, #0x51
	mov r3, #0
	bl TryInflictExposedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326E00: .word 0x0000013B
	arm_func_end DoMoveExpose

	arm_func_start DoMoveDoubleTeam
DoMoveDoubleTeam: ; 0x02326E04
	stmdb sp!, {r3, lr}
	ldr r2, _02326E1C ; =SPATK_STAT_IDX
	ldr r2, [r2]
	bl BoostHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326E1C: .word SPATK_STAT_IDX
	arm_func_end DoMoveDoubleTeam

	arm_func_start DoMoveGust
DoMoveGust: ; 0x02326E20
	stmdb sp!, {r3, lr}
	ldr ip, [r1, #0xb4]
	mov lr, #1
	ldrb ip, [ip, #0xd2]
	add ip, ip, #0xf9
	and ip, ip, #0xff
	cmp ip, #1
	movls lr, #2
	str r3, [sp]
	mov r3, lr, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveGust

	arm_func_start DoMoveBoostDefense1
DoMoveBoostDefense1: ; 0x02326E60
	stmdb sp!, {r3, lr}
	ldr r2, _02326E7C ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326E7C: .word ATK_STAT_IDX
	arm_func_end DoMoveBoostDefense1
