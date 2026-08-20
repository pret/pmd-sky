	.include "asm/macros.inc"
	.include "overlay_29_0232E2B8.inc"

	.text

	arm_func_start DoMoveFireFang
DoMoveFireFang: ; 0x0232E2B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EndFrozenStatus
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0x100
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _0232E360 ; =FLARE_BLITZ_BURN_CHANCE
	mov r0, r7
	ldrsh r2, [r1]
	mov r1, r6
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232E328
	mov r2, #0
	mov r0, r7
	mov r1, r6
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_0232E328:
	ldr r1, _0232E364 ; =FIRE_FANG_CRINGE_CHANCE
	mov r0, r7
	ldrsh r2, [r1]
	mov r1, r6
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232E358
	mov r2, #0
	mov r0, r7
	mov r1, r6
	mov r3, r2
	bl TryInflictCringeStatus
_0232E358:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232E360: .word FLARE_BLITZ_BURN_CHANCE
_0232E364: .word FIRE_FANG_CRINGE_CHANCE
	arm_func_end DoMoveFireFang

	arm_func_start DoMoveLunarDance
DoMoveLunarDance: ; 0x0232E368
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _0232E3C8 ; =HEALING_WISH_HP_RESTORATION
	mov ip, #1
	ldrsh r2, [r2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	ldr r2, _0232E3CC ; =0x000003E7
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl RestoreAllMovePP
	mov r2, #1
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl EndNegativeStatusConditionWrapper
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232E3C8: .word HEALING_WISH_HP_RESTORATION
_0232E3CC: .word 0x000003E7
	arm_func_end DoMoveLunarDance
