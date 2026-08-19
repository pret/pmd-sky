	.include "asm/macros.inc"
	.include "overlay_29_0232D378.inc"

	.text

	arm_func_start DoMoveGuardSwap
DoMoveGuardSwap: ; 0x0232D378
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0
	bl SwapDefensiveStages
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SwapDefensiveMultipliers
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, r4
	ldr r2, _0232D3D4 ; =0x00000F2E
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232D3D4: .word 0x00002495
#else
_0232D3D4: .word 0x00000F2E
#endif
	arm_func_end DoMoveGuardSwap

	arm_func_start DoMoveHealOrder
DoMoveHealOrder: ; 0x0232D3D8
	stmdb sp!, {r3, lr}
	ldr r2, _0232D3FC ; =HEAL_ORDER_HP_RESTORATION
	mov ip, #1
	ldrsh r2, [r2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232D3FC: .word HEAL_ORDER_HP_RESTORATION
	arm_func_end DoMoveHealOrder
