	.include "asm/macros.inc"
	.include "overlay_29_0232E130.inc"

	.text

	arm_func_start DoMoveFlareBlitz
DoMoveFlareBlitz: ; 0x0232E130
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r7, r1
	mov r4, r2
	mov r6, r3
	bl EndFrozenStatus
	mov r0, r5
	mov r1, r7
	mov r2, r4
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232E240
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E1B4
	ldr r1, _0232E248 ; =FLARE_BLITZ_BURN_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r7
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232E1B4
	mov r2, #0
	mov r0, r5
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_0232E1B4:
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E23C
	mov r0, r5
	mov r1, #7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0232E23C
	ldr r1, [r5, #0xb4]
	ldr r0, _0232E24C ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	ldrh r3, [r4, #4]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	movs r1, r0, asr #3
	mov r2, #0
	str r3, [sp]
	mov r0, #0x23c
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x14
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	moveq r1, #1
	mov r0, r5
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_0232E23C:
	mov r0, #1
_0232E240:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232E248: .word FLARE_BLITZ_BURN_CHANCE
_0232E24C: .word 0x000003E7
	arm_func_end DoMoveFlareBlitz
