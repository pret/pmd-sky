	.include "asm/macros.inc"
	.include "overlay_29_0232B5E8.inc"

	.text

	arm_func_start DoMoveDamageConstrict10
DoMoveDamageConstrict10: ; 0x0232B5E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r2
	ldrh ip, [r5, #4]
	ldr r2, _0232B69C ; =0x00000123
	mov r7, r0
	cmp ip, r2
	mov r6, r1
	mov r4, r3
	mov r8, #0
	cmpne ip, #0x20c
	bne _0232B628
	mov r0, r7
	mov r1, r6
	bl EndFrozenStatus
	mov sb, #0x13c
	b _0232B640
_0232B628:
	cmp ip, #0x45
	moveq sb, #0x75
	beq _0232B640
	cmp ip, #0x7d
	moveq sb, #0x7e
	movne sb, #0xf1
_0232B640:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0x100
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	beq _0232B694
	ldr r1, _0232B6A0 ; =WHIRLPOOL_CONSTRICTION_CHANCE
	mov r0, r7
	ldrsh r2, [r1]
	mov r1, r6
	mov r8, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232B694
	mov r0, r7
	mov r1, r6
	mov r2, sb
	mov r3, #0
	bl TryInflictConstrictionStatus
_0232B694:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0232B69C: .word 0x00000123
_0232B6A0: .word WHIRLPOOL_CONSTRICTION_CHANCE
	arm_func_end DoMoveDamageConstrict10
