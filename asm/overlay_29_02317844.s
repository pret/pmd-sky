	.include "asm/macros.inc"
	.include "overlay_29_02317844.inc"

	.text

	arm_func_start TryInflictCrossEyedStatus
TryInflictCrossEyedStatus: ; 0x02317844
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	beq _02317930
	mov r0, r5
	bl ov29_022E48B8
	ldr r2, _02317950 ; =0x00000D36
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r3, #2
	ldr r1, _02317954 ; =ov10_022C4830
	mov r0, r5
	mov r2, #1
	strb r3, [r4, #0xf1]
	bl CalcStatusDuration
	add r2, r0, #1
	mov r0, r6
	mov r1, r5
	strb r2, [r4, #0xf2]
	bl TryActivateSteadfast
	mov r0, #1
	bl UpdateCamera
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02317940
_02317930:
	ldr r2, _02317958 ; =0x00000D37
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317940:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02317950: .word 0x00000A76
_02317954: .word ov10_022C4830
_02317958: .word 0x00000A77
#else
_02317950: .word 0x00000D36
_02317954: .word ov10_022C4830
_02317958: .word 0x00000D37
#endif
	arm_func_end TryInflictCrossEyedStatus

	arm_func_start TryInflictEyedropStatus
TryInflictEyedropStatus: ; 0x0231795C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf1]
	cmp r0, #3
	beq _023179E4
	ldr r1, _02317A00 ; =ov10_022C4838
	mov r3, #3
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xf1]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf2]
	bl ov29_022E4914
	ldr r2, _02317A04 ; =0x00000D38
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	b _023179F4
_023179E4:
	ldr r2, _02317A08 ; =0x00000D39
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023179F4:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317A00: .word ov10_022C4838
#ifdef JAPAN
_02317A04: .word 0x00000A78
_02317A08: .word 0x00000A79
#else
_02317A04: .word 0x00000D38
_02317A08: .word 0x00000D39
#endif
	arm_func_end TryInflictEyedropStatus

	arm_func_start TryInflictSlipStatus
TryInflictSlipStatus: ; 0x02317A0C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317A4C
	ldr r0, [r4, #0xb4]
	ldrsh r0, [r0, #2]
	bl GetMobilityType
	cmp r0, #0
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	bne _02317A54
_02317A4C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02317A54:
	ldr r6, [r4, #0xb4]
	ldrb r0, [r6, #0xef]
	cmp r0, #4
	beq _02317AB8
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl EndInvisibleClassStatus
	mov r3, #4
	ldr r1, _02317AE8 ; =ov10_022C486C
	mov r0, r4
	mov r2, #1
	strb r3, [r6, #0xef]
	bl CalcStatusDuration
	add r3, r0, #1
	mov r0, #0
	mov r1, r4
	mov r2, r0
	strb r3, [r6, #0xf0]
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317AEC ; =0x00000D3A
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317AD8
_02317AB8:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317AF0 ; =0x00000D3B
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02317AD8:
	mov r0, r4
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02317AE8: .word ov10_022C486C
#ifdef JAPAN
_02317AEC: .word 0x00000A7A
_02317AF0: .word 0x00000A7B
#else
_02317AEC: .word 0x00000D3A
_02317AF0: .word 0x00000D3B
#endif
	arm_func_end TryInflictSlipStatus

	arm_func_start TryInflictDropeyeStatus
TryInflictDropeyeStatus: ; 0x02317AF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317B40
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	bne _02317B40
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	beq _02317B48
_02317B40:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02317B48:
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xf1]
	cmp r0, #1
	bne _02317B70
	ldr r2, _02317C0C ; =0x00000D3E
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02317B70:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf1]
	cmp r0, #4
	beq _02317BEC
	ldr r1, _02317C10 ; =ov10_022C487C
	mov r3, #4
	mov r0, r5
	mov r2, #1
	strb r3, [r4, #0xf1]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xf2]
	bl sub_01FFB62C
	ldr r0, _02317C14 ; =0x00000115
	bl ov29_022EACCC
	ldr r2, _02317C18 ; =0x00000D3C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0x31
	bl AdvanceFrame
	bl UpdateTrapsVisibility
	bl UpdateMinimap
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02317BFC
_02317BEC:
	ldr r2, _02317C1C ; =0x00000D3D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317BFC:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_DROPEYE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_DROPEYE_STATUS_OFFSET 0
#endif
_02317C0C: .word 0x00000D3E + TRY_INFLICT_DROPEYE_STATUS_OFFSET
_02317C10: .word ov10_022C487C
_02317C14: .word 0x00000115
_02317C18: .word 0x00000D3C + TRY_INFLICT_DROPEYE_STATUS_OFFSET
_02317C1C: .word 0x00000D3D + TRY_INFLICT_DROPEYE_STATUS_OFFSET
	arm_func_end TryInflictDropeyeStatus

	arm_func_start RestoreAllMovePP
RestoreAllMovePP: ; 0x02317C20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov fp, r2
	mov r8, r3
	mov r6, #0
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317D48
	ldr r0, [sb, #0xb4]
	mov r5, r6
#ifdef JAPAN
	add r4, r0, #0x120
#else
	add r4, r0, #0x124
#endif
_02317C58:
	ldrb r0, [r4, r5, lsl #3]
	add r7, r4, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02317CD0
	ldrb r1, [r7, #6]
	mov r0, r7
	str r1, [sp, #4]
	bl GetMaxPp
	str r0, [sp]
	mov r0, r7
	bl GetMaxPpWrapper
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bge _02317CD0
	ldr r0, [sp, #4]
	mov r6, #1
	add r0, r0, fp
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	ldrgt r0, [sp]
	strgt r0, [sp, #4]
	ldr r0, [sp, #4]
	strb r0, [r7, #6]
_02317CD0:
	add r5, r5, #1
	cmp r5, #4
	blt _02317C58
	cmp r6, #0
	beq _02317D18
	mov r0, sb
	bl ShowPpRestoreEffect
	cmp r8, #0
	bne _02317D40
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317D50 ; =0x00000DB3
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317D40
_02317D18:
	cmp r8, #0
	bne _02317D40
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317D54 ; =0x00000DB4
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02317D40:
	mov r0, sb
	bl UpdateStatusIconFlags
_02317D48:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02317D50: .word 0x00000AF3
_02317D54: .word 0x00000AF4
#else
_02317D50: .word 0x00000DB3
_02317D54: .word 0x00000DB4
#endif
	arm_func_end RestoreAllMovePP

	arm_func_start RestoreOneMovePP
RestoreOneMovePP: ; 0x02317D58
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r5, r2
	mov r6, r3
	mov r4, #0
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _02317E78
	ldr r0, [r7, #0xb4]
#ifdef JAPAN
	add r1, r0, #0x120
#else
	add r1, r0, #0x124
#endif
	ldrb r0, [r1, r5, lsl #3]
	add r5, r1, r5, lsl #3
	tst r0, #1
	movne r0, #1
	moveq r0, r4
	tst r0, #0xff
	beq _02317E78
	ldrb r1, [r5, #6]
	mov r0, r5
	str r1, [sp, #4]
	bl GetMaxPp
	str r0, [sp]
	mov r0, r5
	bl GetMaxPpWrapper
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bge _02317E04
	ldr r0, [sp, #4]
	mov r4, #1
	add r0, r0, r6
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	ldrgt r0, [sp]
	strgt r0, [sp, #4]
	ldr r0, [sp, #4]
	strb r0, [r5, #6]
_02317E04:
	cmp r4, #0
	beq _02317E44
	mov r0, r7
	bl ShowPpRestoreEffect
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _02317E70
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317E80 ; =0x00000DB3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317E70
_02317E44:
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _02317E70
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02317E84 ; =0x00000DB4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02317E70:
	mov r0, r7
	bl UpdateStatusIconFlags
_02317E78:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_02317E80: .word 0x00000AF3
_02317E84: .word 0x00000AF4
#else
_02317E80: .word 0x00000DB3
_02317E84: .word 0x00000DB4
#endif
	arm_func_end RestoreOneMovePP

	arm_func_start RestoreRandomMovePP
RestoreRandomMovePP: ; 0x02317E88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sb, r1
	ldr r1, [sb, #0xb4]
	mov r6, #0
	mov sl, r0
	mov r8, r2
	mov r7, r3
	mov r5, r6
#ifdef JAPAN
	add r4, r1, #0x120
#else
	add r4, r1, #0x124
#endif
	add fp, sp, #0xc
_02317EB4:
	ldrb r1, [r4, r5, lsl #3]
	add r0, r4, r5, lsl #3
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02317F00
	ldrb r1, [r0, #6]
	str r1, [sp, #8]
	bl GetMaxPp
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	cmp r1, r0
	addlt r0, r6, #1
	movlt r1, r6, lsl #1
	movlt r0, r0, lsl #0x10
	strlth r5, [fp, r1]
	movlt r6, r0, asr #0x10
_02317F00:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _02317EB4
	cmp r6, #0
	ble _02317F48
	mov r0, r6
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0xc
	mov r0, r0, asr #0xf
	ldrh r2, [r1, r0]
	mov r0, sl
	mov r1, sb
	mov r3, r8
	str r7, [sp]
	bl RestoreOneMovePP
_02317F48:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end RestoreRandomMovePP

	arm_func_start ApplyProteinEffect
ApplyProteinEffect: ; 0x02317F50
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1a]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1a]
	cmp r3, r0
	bhs _02317FC0
	mov r0, r5
	bl ov29_022E49B4
	ldr r2, _02317FDC ; =0x00000D96
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02317FD0
_02317FC0:
	ldr r2, _02317FE0 ; =0x00000D97
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02317FD0:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02317FDC: .word 0x00000AD6
_02317FE0: .word 0x00000AD7
#else
_02317FDC: .word 0x00000D96
_02317FE0: .word 0x00000D97
#endif
	arm_func_end ApplyProteinEffect

	arm_func_start ApplyCalciumEffect
ApplyCalciumEffect: ; 0x02317FE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1b]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1b]
	cmp r3, r0
	bhs _02318054
	mov r0, r5
	bl ov29_022E4A04
	ldr r2, _02318070 ; =0x00000D98
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318064
_02318054:
	ldr r2, _02318074 ; =0x00000D99
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318064:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02318070: .word 0x00000AD8
_02318074: .word 0x00000AD9
#else
_02318070: .word 0x00000D98
_02318074: .word 0x00000D99
#endif
	arm_func_end ApplyCalciumEffect

	arm_func_start ApplyIronEffect
ApplyIronEffect: ; 0x02318078
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1c]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1c]
	cmp r3, r0
	bhs _023180E8
	mov r0, r5
	bl ov29_022E4A54
	ldr r2, _02318104 ; =0x00000D9A
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023180F8
_023180E8:
	ldr r2, _02318108 ; =0x00000D9B
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023180F8:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02318104: .word 0x00000ADA
_02318108: .word 0x00000ADB
#else
_02318104: .word 0x00000D9A
_02318108: .word 0x00000D9B
#endif
	arm_func_end ApplyIronEffect

	arm_func_start ApplyZincEffect
ApplyZincEffect: ; 0x0231810C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, [r5, #0xb4]
	ldrb r3, [r2, #0x1d]
	add r1, r3, r4
	cmp r1, #0xff
	movge r1, #0xff
	and r0, r1, #0xff
	strb r1, [r2, #0x1d]
	cmp r3, r0
	bhs _0231817C
	mov r0, r5
	bl ov29_022E4AA4
	ldr r2, _02318198 ; =0x00000D9C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231818C
_0231817C:
	ldr r2, _0231819C ; =0x00000D9D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231818C:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02318198: .word 0x00000ADC
_0231819C: .word 0x00000ADD
#else
_02318198: .word 0x00000D9C
_0231819C: .word 0x00000D9D
#endif
	arm_func_end ApplyZincEffect

	arm_func_start TryInflictLongTossStatus
TryInflictLongTossStatus: ; 0x023181A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xb4]
	mov r6, r0
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xee]
	cmp r0, #1
	beq _023181EC
	mov r1, #1
	mov r0, r5
	strb r1, [r4, #0xee]
	bl ov29_022E4AF0
	ldr r2, _02318208 ; =0x00000DDD
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023181FC
_023181EC:
	ldr r2, _0231820C ; =0x00000DDE
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023181FC:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02318208: .word 0x00000B1D
_0231820C: .word 0x00000B1E
#else
_02318208: .word 0x00000DDD
_0231820C: .word 0x00000DDE
#endif
	arm_func_end TryInflictLongTossStatus

	arm_func_start TryInflictPierceStatus
TryInflictPierceStatus: ; 0x02318210
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xb4]
	mov r6, r0
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xee]
	cmp r0, #2
	beq _0231825C
	mov r1, #2
	mov r0, r5
	strb r1, [r4, #0xee]
	bl ov29_022E4B3C
	ldr r2, _02318278 ; =0x00000DDF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231826C
_0231825C:
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xb20
#else
	mov r2, #0xde0
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0231826C:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02318278: .word 0x00000B1F
#else
_02318278: .word 0x00000DDF
#endif
	arm_func_end TryInflictPierceStatus

	arm_func_start TryInflictGastroAcidStatus
TryInflictGastroAcidStatus: ; 0x0231827C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r8, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r6
	bl EntityIsValid__02315118
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, r6
	mov r2, r0
	ldr r4, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r4, #0xd8]
	cmp r0, #4
	beq _02318388
	mov r0, r7
	mov r1, r6
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r3, #4
	ldr r1, _023183B0 ; =ov10_022C476C
	mov r0, r6
	mov r2, #1
	strb r3, [r4, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r4, #0xdb]
	mov r1, #0
	ldr r0, _023183B4 ; =DUNGEON_PTR
	strb r1, [r4, #0xdc]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0xe]
	cmp r5, #0
	beq _02318370
	ldr r2, _023183B8 ; =0x00000D7B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02318370:
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	mov r0, r6
	bl ov29_022FB984
	b _023183A0
_02318388:
	cmp r5, #0
	beq _023183A0
	ldr r2, _023183BC ; =0x00000D7C
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023183A0:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023183B0: .word ov10_022C476C
_023183B4: .word DUNGEON_PTR
#ifdef JAPAN
_023183B8: .word 0x00000ABB
_023183BC: .word 0x00000ABC
#else
_023183B8: .word 0x00000D7B
_023183BC: .word 0x00000D7C
#endif
	arm_func_end TryInflictGastroAcidStatus

	arm_func_start SetAquaRingHealingCountdownTo4
SetAquaRingHealingCountdownTo4: ; 0x023183C0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	ldrne r0, _023183E4 ; =ov10_022C4620
	ldrne r1, [r4, #0xb4]
	ldrnesh r0, [r0]
	strneb r0, [r1, #0xd7]
	ldmia sp!, {r4, pc}
	.align 2, 0
_023183E4: .word ov10_022C4620
	arm_func_end SetAquaRingHealingCountdownTo4

	arm_func_start ApplyAquaRingHealing
ApplyAquaRingHealing: ; 0x023183E8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	beq _0231844C
	ldr r3, [r4, #0xb4]
	ldr r0, _02318454 ; =0x000003E7
	ldrsh r2, [r3, #0x12]
	ldrsh r1, [r3, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [r3, #0x10]
	cmp r0, r1
	bge _02318444
	ldr r0, _02318458 ; =ov10_022C4628
	mov r3, #0
	ldrsh r2, [r0]
	mov r0, r4
	mov r1, r4
	str r3, [sp]
	bl TryIncreaseHp
_02318444:
	mov r0, r4
	bl SetAquaRingHealingCountdownTo4
_0231844C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02318454: .word 0x000003E7
_02318458: .word ov10_022C4628
	arm_func_end ApplyAquaRingHealing

	arm_func_start TryInflictAquaRingStatus
TryInflictAquaRingStatus: ; 0x0231845C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0x10
	beq _023184E0
	ldr r1, _023184FC ; =ov10_022C4764
	mov r3, #0x10
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl SetAquaRingHealingCountdownTo4
	ldr r2, _02318500 ; =0x00000D7D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023184F0
_023184E0:
	ldr r2, _02318504 ; =0x00000D7E
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023184F0:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023184FC: .word ov10_022C4764
#ifdef JAPAN
_02318500: .word 0x00000ABD
_02318504: .word 0x00000ABE
#else
_02318500: .word 0x00000D7D
_02318504: .word 0x00000D7E
#endif
	arm_func_end TryInflictAquaRingStatus

	arm_func_start TryInflictLuckyChantStatus
TryInflictLuckyChantStatus: ; 0x02318508
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0x11
	beq _02318584
	ldr r1, _023185A0 ; =ov10_022C4768
	mov r3, #0x11
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _023185A4 ; =0x00000D7F
	mov r0, r6
	mov r1, r5
	strb r3, [r4, #0xd6]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318594
_02318584:
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xac0
#else
	mov r2, #0xd80
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02318594:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023185A0: .word ov10_022C4768
#ifdef JAPAN
_023185A4: .word 0x00000ABF
#else
_023185A4: .word 0x00000D7F
#endif
	arm_func_end TryInflictLuckyChantStatus

	arm_func_start TryInflictHealBlockStatus
TryInflictHealBlockStatus: ; 0x023185A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r7, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xd8]
	cmp r0, #5
	beq _02318698
	mov r0, r6
	mov r1, r5
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r3, #5
	ldr r1, _023186C0 ; =ov10_022C4774
	mov r0, r5
	mov r2, #1
	strb r3, [r7, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xdb]
	cmp r4, #0
	beq _02318688
	ldr r2, _023186C4 ; =0x00000D81
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318688:
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _023186B0
_02318698:
	cmp r4, #0
	beq _023186B0
	ldr r2, _023186C8 ; =0x00000D82
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023186B0:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023186C0: .word ov10_022C4774
#ifdef JAPAN
_023186C4: .word 0x00000AC1
_023186C8: .word 0x00000AC2
#else
_023186C4: .word 0x00000D81
_023186C8: .word 0x00000D82
#endif
	arm_func_end TryInflictHealBlockStatus

	arm_func_start MonsterHasEmbargoStatus
MonsterHasEmbargoStatus: ; 0x023186CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #6
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end MonsterHasEmbargoStatus

	arm_func_start LogItemBlockedByEmbargo
LogItemBlockedByEmbargo: ; 0x02318700
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02318728 ; =0x00000D86
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02318728: .word 0x00000AC6
#else
_02318728: .word 0x00000D86
#endif
	arm_func_end LogItemBlockedByEmbargo

	arm_func_start TryInflictEmbargoStatus
TryInflictEmbargoStatus: ; 0x0231872C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r7, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xd8]
	cmp r0, #6
	beq _0231881C
	mov r0, r6
	mov r1, r5
	bl TryRemoveSnatchedMonsterFromDungeonStruct
	mov r3, #6
	ldr r1, _02318844 ; =ov10_022C4778
	mov r0, r5
	mov r2, #1
	strb r3, [r7, #0xd8]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xdb]
	cmp r4, #0
	beq _0231880C
	ldr r2, _02318848 ; =0x00000D84
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231880C:
	mov r0, r6
	mov r1, r5
	bl TryActivateQuickFeet
	b _02318834
_0231881C:
	cmp r4, #0
	beq _02318834
	ldr r2, _0231884C ; =0x00000D85
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318834:
	mov r0, r5
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02318844: .word ov10_022C4778
#ifdef JAPAN
_02318848: .word 0x00000AC4
_0231884C: .word 0x00000AC5
#else
_02318848: .word 0x00000D84
_0231884C: .word 0x00000D85
#endif
	arm_func_end TryInflictEmbargoStatus

	arm_func_start TryInflictMiracleEyeStatus
TryInflictMiracleEyeStatus: ; 0x02318850
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl EntityIsValid__02315118
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #1
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r6
	mov r2, r0
	ldr r4, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, #0x10
	bl HasTypeAffectedByGravity
	cmp r0, #0
	bne _02318900
	cmp r5, #0
	bne _023188F8
	ldr r2, _02318974 ; =0x00000D89
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023188F8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02318900:
	cmp r5, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r4, #0xf5]
	cmp r0, #1
	beq _02318954
	ldr r1, _02318978 ; =ov10_022C477C
	mov r2, #1
	mov r0, r6
	strb r2, [r4, #0xf5]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _0231897C ; =0x00000D87
	mov r0, r7
	mov r1, r6
	strb r3, [r4, #0xf6]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02318964
_02318954:
	ldr r2, _02318980 ; =0x00000D88
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02318964:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_MIRACLE_EYE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_MIRACLE_EYE_STATUS_OFFSET 0
#endif
_02318974: .word 0x00000D89 + TRY_INFLICT_MIRACLE_EYE_STATUS_OFFSET
_02318978: .word ov10_022C477C
_0231897C: .word 0x00000D87 + TRY_INFLICT_MIRACLE_EYE_STATUS_OFFSET
_02318980: .word 0x00000D88 + TRY_INFLICT_MIRACLE_EYE_STATUS_OFFSET
	arm_func_end TryInflictMiracleEyeStatus

	arm_func_start TryInflictMagnetRiseStatus
TryInflictMagnetRiseStatus: ; 0x02318984
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl GravityIsActive
	cmp r0, #0
	beq _023189B0
	ldr r2, _02318A3C ; =0x00000D8C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r4, r5, r6, pc}
_023189B0:
	mov r0, r6
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02315118
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xf7]
	cmp r0, #1
	beq _02318A20
	ldr r1, _02318A40 ; =ov10_022C4780
	mov r2, #1
	mov r0, r5
	strb r2, [r4, #0xf7]
	bl CalcStatusDuration
	add r3, r0, #1
	ldr r2, _02318A44 ; =0x00000D8A
	mov r0, r6
	mov r1, r5
	strb r3, [r4, #0xf8]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318A30
_02318A20:
	ldr r2, _02318A48 ; =0x00000D8B
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318A30:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_MAGNET_RISE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_MAGNET_RISE_STATUS_OFFSET 0
#endif
_02318A3C: .word 0x00000D8C + TRY_INFLICT_MAGNET_RISE_STATUS_OFFSET
_02318A40: .word ov10_022C4780
_02318A44: .word 0x00000D8A + TRY_INFLICT_MAGNET_RISE_STATUS_OFFSET
_02318A48: .word 0x00000D8B + TRY_INFLICT_MAGNET_RISE_STATUS_OFFSET
	arm_func_end TryInflictMagnetRiseStatus
