	.include "asm/macros.inc"
	.include "overlay_29_0232E4A0.inc"

	.text

	arm_func_start DoMoveHeadSmash
DoMoveHeadSmash: ; 0x0232E4A0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r2
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232E554
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	beq _0232E550
	mov r0, r5
	mov r1, #7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _0232E550
	ldr r1, [r5, #0xb4]
	ldr r0, _0232E55C ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	ldrh r3, [r4, #4]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	movs r1, r0, asr #2
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
_0232E550:
	mov r0, #1
_0232E554:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232E55C: .word 0x000003E7
	arm_func_end DoMoveHeadSmash

	arm_func_start DoMoveCaptivate
DoMoveCaptivate: ; 0x0232E560
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	ldr r0, [r6, #0xb4]
	ldr r1, [r5, #0xb4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r1, #2]
	mov r4, #0
	bl GendersNotEqualNotGenderless
	cmp r0, #0
	beq _0232E5D4
	mov r0, r6
	mov r1, r5
	mov r2, #0x29
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActiveMoveEffects__0232DE20
	cmp r0, #0
	bne _0232E5D4
	ldr r0, _0232E61C ; =SPATK_STAT_IDX
	mov ip, #1
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, #2
	str ip, [sp, #4]
	bl LowerOffensiveStat
	mov r4, #1
_0232E5D4:
	cmp r4, #0
	bne _0232E610
	mov r0, r5
	bl EntityIsValidMoveEffects__0232E250
	cmp r0, #0
	moveq r0, r4
	beq _0232E614
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232E620 ; =0x00000F0F
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232E610:
	mov r0, r4
_0232E614:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232E61C: .word SPATK_STAT_IDX
#ifdef JAPAN
_0232E620: .word 0x00000C51
#else
_0232E620: .word 0x00000F0F
#endif
	arm_func_end DoMoveCaptivate

	arm_func_start DoMoveLeafStorm
DoMoveLeafStorm: ; 0x0232E624
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r4, r0
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232E670
	ldr r0, _0232E678 ; =SPATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r4
	mov r1, r4
	mov r3, #2
	str ip, [sp, #4]
	bl LowerOffensiveStat
	mov r0, #1
_0232E670:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232E678: .word SPATK_STAT_IDX
	arm_func_end DoMoveLeafStorm

	arm_func_start DoMoveDracoMeteor
DoMoveDracoMeteor: ; 0x0232E67C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r4, r0
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232E6D4
	ldrsh r0, [sp, #0x10]
	cmp r0, #0
	bne _0232E6D0
	ldr r0, _0232E6DC ; =SPATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r4
	mov r1, r4
	mov r3, #2
	str ip, [sp, #4]
	bl LowerOffensiveStat
_0232E6D0:
	mov r0, #1
_0232E6D4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0232E6DC: .word SPATK_STAT_IDX
	arm_func_end DoMoveDracoMeteor

	arm_func_start DoMoveRockPolish
DoMoveRockPolish: ; 0x0232E6E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #0
	mov r5, r0
	mov r4, r1
	mov r3, r2
	bl BoostSpeedOneStage
	mov r0, r5
	mov r1, r4
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveRockPolish

	arm_func_start DoMoveNastyPlot
DoMoveNastyPlot: ; 0x0232E714
	stmdb sp!, {r3, lr}
	ldr r2, _0232E730 ; =SPATK_STAT_IDX
	mov r3, #2
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232E730: .word SPATK_STAT_IDX
	arm_func_end DoMoveNastyPlot

	arm_func_start DoMoveTag0x1AB
DoMoveTag0x1AB: ; 0x0232E734
	stmdb sp!, {r3, lr}
	bl TryInflictTerrifiedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveTag0x1AB

	arm_func_start ov29_0232E744
ov29_0232E744: ; 0x0232E744
	ldr ip, _0232E74C ; =DoMoveEscape
	bx ip
	.align 2, 0
_0232E74C: .word DoMoveEscape
	arm_func_end ov29_0232E744

	arm_func_start DoMoveTag0x1A6
DoMoveTag0x1A6: ; 0x0232E750
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	mov r0, #1
	bl ov29_0234AFFC
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl DoMoveCleanse
	mov r4, r0
	mov r0, #0
	bl ov29_0234AFFC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMoveTag0x1A6

	arm_func_start DoMoveTag0x1A7
DoMoveTag0x1A7: ; 0x0232E794
#ifdef JAPAN
#define DO_MOVE_TAG_0X147_OFFSET -4
#else
#define DO_MOVE_TAG_0X147_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #1
	bl ov29_0234AFFC
	mov r0, r5
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl EndNegativeStatusConditionWrapper
	ldr r2, _0232E808 ; =0x000003E7
	mov r0, r5
	mov r1, r4
	bl TryRestoreHp
	mov r0, r5
	mov r1, r4
	ldr r2, _0232E808 ; =0x000003E7
	mov r3, #1
	bl RestoreAllMovePP
	ldr r1, [r4, #0xb4]
	mov r0, #0
	add r1, r1, #0x100
	ldrh r2, [r1, #0x4a + DO_MOVE_TAG_0X147_OFFSET]
	strh r2, [r1, #0x46 + DO_MOVE_TAG_0X147_OFFSET]
	ldrh r2, [r1, #0x4c + DO_MOVE_TAG_0X147_OFFSET]
	strh r2, [r1, #0x48 + DO_MOVE_TAG_0X147_OFFSET]
	bl ov29_0234AFFC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232E808: .word 0x000003E7
	arm_func_end DoMoveTag0x1A7

	arm_func_start ov29_0232E80C
ov29_0232E80C: ; 0x0232E80C
	stmdb sp!, {r3, lr}
	ldr r0, _0232E83C ; =ov29_02353718
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, _0232E83C ; =ov29_02353718
	ldrne r0, [r0]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232E83C: .word ov29_02353718
	arm_func_end ov29_0232E80C
