	.include "asm/macros.inc"
	.include "overlay_29_02313CE4.inc"

	.text



	arm_func_start TryInflictCringeStatus
TryInflictCringeStatus: ; 0x023143E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #0x1f
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02314498
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r5, #0
	beq _02314490
	ldr r2, _02314534 ; =0x00000DA2
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314490:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02314498:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r4, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd0]
	cmp r0, #1
	beq _02314514
	ldr r1, _02314538 ; =ov10_022C4884
	mov r2, #1
	mov r0, r6
	strb r2, [r4, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r6
	strb r1, [r4, #0xd1]
	bl PlayExclamationPointEffect__022E5D4C
	ldr r2, _0231453C ; =0x00000D02
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateSteadfast
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02314524
_02314514:
	ldr r2, _02314540 ; =0x00000D03
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314524:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CRINGE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CRINGE_STATUS_OFFSET 0
#endif
_02314534: .word 0x00000DA2 + TRY_INFLICT_CRINGE_STATUS_OFFSET
_02314538: .word ov10_022C4884
_0231453C: .word 0x00000D02 + TRY_INFLICT_CRINGE_STATUS_OFFSET
_02314540: .word 0x00000D03 + TRY_INFLICT_CRINGE_STATUS_OFFSET
	arm_func_end TryInflictCringeStatus

	arm_func_start TryInflictParalysisStatus
TryInflictParalysisStatus: ; 0x02314544
#ifdef JAPAN
#define TRY_INFLICT_PARALYSIS_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_PARALYSIS_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r4, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	beq _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	bne _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, #0x16
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _023145F4
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r8, #0
	beq _023145EC
	mov r0, sl
	mov r1, sb
	mov r2, #0xda0 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_023145EC:
	mov r0, #0
	b _023147D0
_023145F4:
	mov r0, sb
	mov r1, #1
	bl ExclusiveItemEffectIsActive__023147EC
	cmp r0, #0
	beq _02314654
	cmp r8, #0
	beq _0231464C
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #4
	mov r0, sb
	mov r1, #1
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #4
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldr r2, _023147D8 ; =0x00000DA1
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231464C:
	mov r0, #0
	b _023147D0
_02314654:
	cmp r4, #0
	movne r0, #1
	bne _023147D0
	mov r0, #0
	ldr r7, [sb, #0xb4]
	mov r1, sb
	mov r2, r0
	mov r4, #1
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xbf]
	cmp r0, #4
	beq _023146E0
	ldr r1, _023147DC ; =ov10_022C4894
	mov r3, #4
	mov r0, sb
	mov r2, r4
	strb r3, [r7, #0xbf]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xc0]
	mov r4, #0
	strb r4, [r7, #0xc1]
	mov r0, sl
	mov r1, sb
	mov r2, #0xd00 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	strb r4, [r7, #0xc2]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	bl ov29_022E4240
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	b _023146F0
_023146E0:
	ldr r2, _023147E0 ; =0x00000D01
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023146F0:
	mov r0, sb
	mov r1, #0x19
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023147C4
	cmp r4, #0
	bne _023147C4
	mov r5, #0
	ldr fp, _023147E4 ; =DIRECTIONS_XY
	mov r4, r5
_02314718:
	mov r1, r4, lsl #2
	add r0, fp, r4, lsl #2
	ldrsh r6, [sb, #4]
	ldrsh r3, [fp, r1]
	ldrsh r1, [r0, #2]
	ldrsh r2, [sb, #6]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023147B8
	ldr r0, [r6]
	cmp r0, #1
	bne _023147B8
	cmp r5, #0
	bne _02314790
	mov r5, #1
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldr r2, _023147E8 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02314790:
	mov r0, sb
	mov r1, r6
	bl GetTreatmentBetweenMonstersIgnoreStatus
	cmp r0, #1
	bne _023147B8
	mov r0, sl
	mov r1, r6
	mov r2, r8
	mov r3, #0
	bl TryInflictParalysisStatus
_023147B8:
	add r4, r4, #1
	cmp r4, #8
	blt _02314718
_023147C4:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
_023147D0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023147D8: .word 0x00000DA1 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
_023147DC: .word ov10_022C4894
_023147E0: .word 0x00000D01 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
_023147E4: .word DIRECTIONS_XY
_023147E8: .word 0x00000DC5 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	arm_func_end TryInflictParalysisStatus
