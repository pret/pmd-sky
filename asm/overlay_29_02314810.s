	.include "asm/macros.inc"
	.include "overlay_29_02314810.inc"

	.text

	arm_func_start BoostSpeed
BoostSpeed: ; 0x02314810
#ifdef JAPAN
#define BOOST_SPEED_OFFSET -4
#else
#define BOOST_SPEED_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r0, r8
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	bne _02314850
	ldr r1, _0231492C ; =SPEED_BOOST_TURN_RANGE
	mov r0, r8
	mov r2, #0
	bl CalcStatusDuration
	add r6, r0, #1
_02314850:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	mov r1, r7
	bl CalcSpeedStage
	mov r4, r0
	cmp r4, #4
	bne _0231489C
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _02314920
	ldr r2, _02314930 ; =0x00000DDB
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314920
_0231489C:
	mov r2, #0
	b _023148BC
_023148A4:
	add r1, r5, r2
	ldrb r0, [r1, #0x114 + BOOST_SPEED_OFFSET]
	cmp r0, #0
	streqb r6, [r1, #0x114 + BOOST_SPEED_OFFSET]
	beq _023148C4
	add r2, r2, #1
_023148BC:
	cmp r2, #5
	blt _023148A4
_023148C4:
	mov r0, r8
	mov r1, r7
	bl CalcSpeedStage
	mov r6, r0
	cmp r4, r6
	bne _023148F0
	ldr r2, _02314934 ; =0x00000DDA
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314920
_023148F0:
	mov r0, r8
	bl ov29_022E44CC
	ldr r0, _02314938 ; =ov29_02353318
	mov r1, r6, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	strb r0, [r5, #0x101]
	mov r0, #0
	strb r0, [r5, #0x152 + BOOST_SPEED_OFFSET]
_02314920:
	mov r0, r8
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231492C: .word SPEED_BOOST_TURN_RANGE
#ifdef JAPAN
_02314930: .word 0x00000B1B
_02314934: .word 0x00000B1A
#else
_02314930: .word 0x00000DDB
_02314934: .word 0x00000DDA
#endif
_02314938: .word ov29_02353318
	arm_func_end BoostSpeed

	arm_func_start BoostSpeedOneStage
BoostSpeedOneStage: ; 0x0231493C
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, r2
	mov r2, #1
	bl BoostSpeed
	ldmia sp!, {r3, pc}
	arm_func_end BoostSpeedOneStage

	arm_func_start LowerSpeed
LowerSpeed: ; 0x02314954
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r7, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl SafeguardIsActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	mov r1, sb
	mov r2, r0
	ldr r4, [sb, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	bl CalcSpeedStageWrapper
	movs fp, r0
	bne _023149E8
	cmp r7, #0
	beq _02314AA0
	ldr r2, _02314AAC ; =0x00000DDC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314AA0
_023149E8:
	mov r5, #0
	b _02314A34
_023149F0:
	mov r1, #0
	b _02314A28
_023149F8:
	add r6, r4, r1
#ifdef JAPAN
	ldrb r0, [r6, #0x115]
#else
	ldrb r0, [r6, #0x119]
#endif
	cmp r0, #0
	bne _02314A24
	ldr r1, _02314AB0 ; =ov10_022C488C
	mov r0, sb
	mov r2, #1
	bl CalcStatusDuration
	add r0, r0, #1
#ifdef JAPAN
	strb r0, [r6, #0x115]
#else
	strb r0, [r6, #0x119]
#endif
	b _02314A30
_02314A24:
	add r1, r1, #1
_02314A28:
	cmp r1, #5
	blt _023149F8
_02314A30:
	add r5, r5, #1
_02314A34:
	cmp r5, r8
	blt _023149F0
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r4, r0
	cmp fp, r4
	bne _02314A6C
	cmp r7, #0
	beq _02314AA0
	ldr r2, _02314AB4 ; =0x00000DDA
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314AA0
_02314A6C:
	mov r0, sb
	bl ov29_022E451C
	ldr r0, _02314AB8 ; =ov29_02353318
	mov r1, r4, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp r4, #0
	bne _02314AA0
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
_02314AA0:
	mov r0, sb
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02314AAC: .word 0x00000B1C
_02314AB0: .word ov10_022C488C
_02314AB4: .word 0x00000B1A
#else
_02314AAC: .word 0x00000DDC
_02314AB0: .word ov10_022C488C
_02314AB4: .word 0x00000DDA
#endif
_02314AB8: .word ov29_02353318
	arm_func_end LowerSpeed

	arm_func_start TrySealMove
TrySealMove: ; 0x02314ABC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, #0
	movs r7, r1
	mov r8, r0
	mov r6, r2
	moveq r0, r5
	beq _02314C18
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, r5
	bne _02314C18
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, r5
	bne _02314C18
	ldr r0, [r7, #0xb4]
	mov r4, r5
#ifdef JAPAN
	add ip, r0, #0x120
#else
	add ip, r0, #0x124
#endif
	mov lr, r4
	mov r2, r5
	mov r3, #1
	add r0, sp, #4
_02314B28:
	ldrb r1, [ip, lr, lsl #3]
	add sb, ip, lr, lsl #3
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _02314B54
	ldrh r1, [sb, #2]
	tst r1, #1
	streq sb, [r0, r4, lsl #2]
	addeq r4, r4, #1
_02314B54:
	add lr, lr, #1
	cmp lr, #4
	blt _02314B28
	cmp r6, #0
	beq _02314B74
	cmp r4, #0
	moveq r0, #0
	beq _02314C18
_02314B74:
	cmp r4, #0
	beq _02314BE8
	ldr r3, _02314C20 ; =0x00000DBE
	mov r5, #8
	mov r0, r8
	mov r1, r7
	mov r2, #1
	str r5, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	bne _02314C18
	cmp r6, #0
	movne r0, #1
	bne _02314C18
	mov r0, r4
	bl DungeonRandInt
	add r1, sp, #4
	ldr r2, [r1, r0, lsl #2]
	mov r0, #0
	ldrh r1, [r2, #2]
	orr r1, r1, #1
	strh r1, [r2, #2]
	ldrh r1, [r2, #4]
	bl SetPreprocessorArgsIdVal
	mov r0, r8
	mov r1, r7
	mov r5, #1
	bl TryActivateQuickFeet
_02314BE8:
	cmp r5, #0
	beq _02314C04
	ldr r2, _02314C24 ; =0x00000DE3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314C14
_02314C04:
	ldr r2, _02314C28 ; =0x00000DE4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02314C14:
	mov r0, #1
_02314C18:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_02314C20: .word 0x00000AFE
_02314C24: .word 0x00000B23
_02314C28: .word 0x00000B24
#else
_02314C20: .word 0x00000DBE
_02314C24: .word 0x00000DE3
_02314C28: .word 0x00000DE4
#endif
	arm_func_end TrySealMove

	arm_func_start BoostOrLowerSpeed
BoostOrLowerSpeed: ; 0x02314C2C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0x32
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	mov r2, #1
	mov r0, r5
	beq _02314C74
	mov r1, r4
	mov r3, r2
	bl LowerSpeed
	b _02314C84
_02314C74:
	mov r1, r4
	mov r3, #0
	str r2, [sp]
	bl BoostSpeed
_02314C84:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end BoostOrLowerSpeed

	arm_func_start ResetHitChanceStat
ResetHitChanceStat: ; 0x02314C8C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r8, r2
	mov r4, r3
	mov r7, #0
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r5, #0xb4]
	add r1, r0, r8, lsl #1
	ldrsh r0, [r1, #0x2c]
	cmp r0, #0xa
	movne r0, #0xa
	movne r7, #1
	strneh r0, [r1, #0x2c]
	cmp r7, #0
	beq _02314CE4
	mov r0, r5
	bl ov29_022E543C
	b _02314CF4
_02314CE4:
	cmp r4, #0
	beq _02314CF4
	mov r0, r5
	bl ov29_022E543C
_02314CF4:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r7, #0
	beq _02314D20
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xaa0
#else
	mov r2, #0xd60
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314D30
_02314D20:
	ldr r2, _02314D3C ; =0x00000D61
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02314D30:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02314D3C: .word 0x00000AA1
#else
_02314D3C: .word 0x00000D61
#endif
	arm_func_end ResetHitChanceStat

	arm_func_start ExclusiveItemEffectIsActiveWithLogging
ExclusiveItemEffectIsActiveWithLogging: ; 0x02314D40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r1
	ldrb r1, [sp, #0x20]
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	bl ExclusiveItemEffectIsActive__023147EC
	cmp r0, #0
	beq _02314DB8
	cmp r5, #0
	beq _02314DB0
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r1, [sp, #0x20]
	add r2, sp, #0
	mov r0, r6
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02314DB0:
	mov r0, #1
	b _02314DBC
_02314DB8:
	mov r0, #0
_02314DBC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ExclusiveItemEffectIsActiveWithLogging

	arm_func_start ov29_02314DC4
ov29_02314DC4: ; 0x02314DC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r0, #0
	mov r5, r2
	mov r2, r0
	mov r6, r1
	mov r4, r3
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, r6
	mov r1, r4
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_02314DC4

	arm_func_start TryActivateQuickFeet
TryActivateQuickFeet: ; 0x02314E1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0x6d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #0
	mov r0, r5
	mov r1, r4
	mov r2, #1
	str r3, [sp]
	bl BoostSpeed
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end TryActivateQuickFeet

	arm_func_start TryInflictTerrifiedStatus
TryInflictTerrifiedStatus: ; 0x02314E60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02314EB0 ; =ov10_022C4618
	mov r4, r1
	ldr ip, [r4, #0xb4]
	mov r3, #1
	mov r5, r0
	ldrsh r1, [r2]
#ifdef JAPAN
	strb r3, [ip, #0x103]
	mov r0, r4
	strb r1, [ip, #0x104]
#else
	strb r3, [ip, #0x104]
	mov r0, r4
	strb r1, [ip, #0x105]
#endif
	bl ov29_022E60E4
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02314EB4 ; =0x00000DE5
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02314EB0: .word ov10_022C4618
#ifdef JAPAN
_02314EB4: .word 0x00000B25
#else
_02314EB4: .word 0x00000DE5
#endif
	arm_func_end TryInflictTerrifiedStatus

	arm_func_start TryInflictGrudgeStatus
TryInflictGrudgeStatus: ; 0x02314EB8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	ldr r5, [r7, #0xb4]
	mov r8, r0
	mov r4, #0
	mov r6, r2
	mov r2, r4
	mov r0, #1
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #0xfd]
	cmp r0, #0
	beq _02314F04
	cmp r6, #0
	beq _02314F2C
	ldr r2, _02314F34 ; =0x00000ED1
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314F2C
_02314F04:
	mov r4, #1
	mov r0, r7
	strb r4, [r5, #0xfd]
	bl UpdateStatusIconFlags
	cmp r6, #0
	beq _02314F2C
#ifdef JAPAN
	ldr r2, _0231640C ; =0x00000C12
	mov r0, r8
	mov r1, r7
#else
	mov r0, r8
	mov r1, r7
	mov r2, #0xed0
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02314F2C:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02314F34: .word 0x00000C13
_0231640C: .word 0x00000C12
#else
_02314F34: .word 0x00000ED1
#endif
	arm_func_end TryInflictGrudgeStatus

	arm_func_start TryInflictConfusedStatus
TryInflictConfusedStatus: ; 0x02314F38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, r3
	bl EntityIsValid__02315118
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
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, #0x19
	bl ItemIsActive__0231513C
	cmp r0, #0
	beq _02314FD8
	cmp r5, #0
	beq _02314FD0
	ldr r2, _02315100 ; =0x00000DAF
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314FD0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02314FD8:
	mov ip, #2
	ldr r3, _02315104 ; =0x00000DBA
	mov r0, r7
	mov r1, r6
	mov r2, r5
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, r6
	beq _02315048
	cmp r7, #0
	moveq r0, #0
	beq _02315028
	ldr r0, [r7]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_02315028:
	cmp r0, #0
	beq _02315048
	mov r0, r7
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _02315054
_02315048:
	mov r0, r6
	mov r1, #0x40
	bl AbilityIsActiveVeneer
_02315054:
	cmp r0, #0
	beq _0231507C
	cmp r5, #0
	beq _02315074
	ldr r2, _02315108 ; =0x00000DA7
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02315074:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0231507C:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov29_022E41CC
	ldr r4, [r6, #0xb4]
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	beq _023150E0
	ldr r1, _0231510C ; =ov10_022C4890
	mov r3, #2
	mov r0, r6
	mov r2, #1
	strb r3, [r4, #0xd0]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _02315110 ; =0x00000CFE
	mov r0, r7
	mov r1, r6
	strb r3, [r4, #0xd1]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _023150F0
_023150E0:
	ldr r2, _02315114 ; =0x00000CFF
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023150F0:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CONFUSED_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CONFUSED_STATUS_OFFSET 0
#endif
_02315100: .word 0x00000DAF + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_02315104: .word 0x00000DBA + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_02315108: .word 0x00000DA7 + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_0231510C: .word ov10_022C4890
_02315110: .word 0x00000CFE + TRY_INFLICT_CONFUSED_STATUS_OFFSET
_02315114: .word 0x00000CFF + TRY_INFLICT_CONFUSED_STATUS_OFFSET
	arm_func_end TryInflictConfusedStatus
