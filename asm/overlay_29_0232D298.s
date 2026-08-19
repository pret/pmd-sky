	.include "asm/macros.inc"
	.include "overlay_29_0232D298.inc"

	.text

	arm_func_start DoMoveHealingWish
DoMoveHealingWish: ; 0x0232D298
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _0232D2E4 ; =HEALING_WISH_HP_RESTORATION
	mov ip, #1
	ldrsh r2, [r2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r2, #1
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl EndNegativeStatusConditionWrapper
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D2E4: .word HEALING_WISH_HP_RESTORATION
	arm_func_end DoMoveHealingWish

	arm_func_start DoMoveCloseCombat
DoMoveCloseCombat: ; 0x0232D2E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r4, r0
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232D358
	ldr r0, _0232D360 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, r4
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
	ldr r0, _0232D364 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, r4
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
_0232D358:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232D360: .word ATK_STAT_IDX
_0232D364: .word SPATK_STAT_IDX
	arm_func_end DoMoveCloseCombat
