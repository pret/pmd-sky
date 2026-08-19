	.include "asm/macros.inc"
	.include "overlay_29_023283A4.inc"

	.text

	arm_func_start DoMoveFissure
DoMoveFissure: ; 0x023283A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r2
	mov sb, r0
	mov r2, #0
	mov r0, r7
	mov r8, r1
	mov r6, r3
	strb r2, [sp, #0x1c]
	mov r5, #1
	bl GetMoveType
	mov r4, r0
	mov r0, sb
	mov r1, #0x57
	bl AbilityIsActiveVeneer
	mov r3, r0
	mov r2, r4
	mov r0, sb
	mov r1, r8
	bl ov29_0230D4A4
	cmp r0, #0
	mov r0, sb
	mov r1, #0x53
	moveq r5, #0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02328420
	mov r0, r8
	bl LevitateIsActive
	cmp r0, #0
	movne r5, #0
_02328420:
	cmp r5, #0
	bne _0232843C
	ldr r2, _023284B4 ; =0x00000ED3
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023284A8
_0232843C:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r5}
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	ldr r2, _023284B8 ; =0x0000270F
	mov r1, r8
	mov r0, sb
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
_023284A8:
	ldrb r0, [sp, #0x1c]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_023284B4: .word 0x00000C15
#else
_023284B4: .word 0x00000ED3
#endif
_023284B8: .word 0x0000270F
	arm_func_end DoMoveFissure

	arm_func_start DoMoveDamageCringe10
DoMoveDamageCringe10: ; 0x023284BC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02328518
	ldr r1, _02328524 ; =EXTRASENSORY_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02328518
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02328518:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02328524: .word EXTRASENSORY_CRINGE_CHANCE
	arm_func_end DoMoveDamageCringe10
