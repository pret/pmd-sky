	.include "asm/macros.inc"
	.include "overlay_29_02329674.inc"

	.text

	arm_func_start DoMoveHelpingHand
DoMoveHelpingHand: ; 0x02329674
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r6, r5
	mov r4, #0
	bne _02329698
	ldr r2, _023296CC ; =0x00000EDA
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023296C4
_02329698:
	ldr r2, _023296D0 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostOffensiveStat
	ldr r1, _023296D4 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #1
	bl BoostOffensiveStat
	mov r4, #1
_023296C4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_023296CC: .word 0x00000C1C
#else
_023296CC: .word 0x00000EDA
#endif
_023296D0: .word ATK_STAT_IDX
_023296D4: .word SPATK_STAT_IDX
	arm_func_end DoMoveHelpingHand
