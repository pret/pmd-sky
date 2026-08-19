	.include "asm/macros.inc"
	.include "overlay_29_0232A2BC.inc"

	.text

	arm_func_start DoMoveFakeOut
DoMoveFakeOut: ; 0x0232A2BC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A318
	ldr r1, _0232A324 ; =FAKE_OUT_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232A318
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_0232A318:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232A324: .word FAKE_OUT_CRINGE_CHANCE
	arm_func_end DoMoveFakeOut

	arm_func_start DoMoveSleepTalk
DoMoveSleepTalk: ; 0x0232A328
	stmdb sp!, {r3, lr}
	ldr r2, _0232A33C ; =0x00000EE2
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_0232A33C: .word 0x00000C24
#else
_0232A33C: .word 0x00000EE2
#endif
	arm_func_end DoMoveSleepTalk

	arm_func_start DoMovePayDay
DoMovePayDay: ; 0x0232A340
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232A3C8
	mov r1, r4
	mov r0, r6
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _0232A3C8
	mov r0, r5
	bl EntityIsValidMoveEffects__0232A3D8
	cmp r0, #0
	bne _0232A3C8
	ldr r3, _0232A3D4 ; =ov29_02352B18
	add r0, sp, #8
	ldrh ip, [r3]
	mov r1, #0xb7
	mov r2, #2
	strh ip, [sp, #4]
	ldrh r3, [r3, #2]
	strh r3, [sp, #6]
	bl GenerateStandardItem
	add r2, sp, #8
	add r3, sp, #4
	mov r0, r6
	mov r1, r5
	bl ov29_0232A834
_0232A3C8:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232A3D4: .word ov29_02352B18
	arm_func_end DoMovePayDay
