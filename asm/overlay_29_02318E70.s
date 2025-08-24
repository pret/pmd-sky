	.include "asm/macros.inc"
	.include "overlay_29_02318E70.inc"

	.text

	arm_func_start TryInflictSafeguardStatus
TryInflictSafeguardStatus: ; 0x02318E70
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #2
	beq _02318EE8
	ldr r1, _02318F04 ; =ov10_022C4734
	mov r3, #2
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E3F74
	ldr r2, _02318F08 ; =0x00000CEE
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318EF8
_02318EE8:
	ldr r2, _02318F0C ; =0x00000CEF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318EF8:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318F04: .word ov10_022C4734
#ifdef JAPAN
_02318F08: .word 0x00000A2E
_02318F0C: .word 0x00000A2F
#else
_02318F08: .word 0x00000CEE
_02318F0C: .word 0x00000CEF
#endif
	arm_func_end TryInflictSafeguardStatus

	arm_func_start TryInflictMistStatus
TryInflictMistStatus: ; 0x02318F10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0xe
	beq _02318F88
	ldr r1, _02318FA4 ; =ov10_022C4738
	mov r3, #0xe
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E3F78
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xa30
#else
	mov r2, #0xcf0
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02318F98
_02318F88:
	ldr r2, _02318FA8 ; =0x00000CF1
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02318F98:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02318FA4: .word ov10_022C4738
#ifdef JAPAN
_02318FA8: .word 0x00000A31
#else
_02318FA8: .word 0x00000CF1
#endif
	arm_func_end TryInflictMistStatus

	arm_func_start TryInflictWishStatus
TryInflictWishStatus: ; 0x02318FAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #6
	beq _02319024
	ldr r1, _02319040 ; =ov10_022C4794
	mov r3, #6
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E3F7C
	ldr r2, _02319044 ; =0x00000CDE
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319034
_02319024:
	ldr r2, _02319048 ; =0x00000CDF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02319034:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02319040: .word ov10_022C4794
#ifdef JAPAN
_02319044: .word 0x00000A1E
_02319048: .word 0x00000A1F
#else
_02319044: .word 0x00000CDE
_02319048: .word 0x00000CDF
#endif
	arm_func_end TryInflictWishStatus

	arm_func_start TryInflictMagicCoatStatus
TryInflictMagicCoatStatus: ; 0x0231904C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #5
	beq _023190C4
	ldr r1, _023190E0 ; =ov10_022C4740
	mov r3, #5
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E3FC8
	ldr r2, _023190E4 ; =0x00000CE7
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023190D4
_023190C4:
	ldr r2, _023190E8 ; =0x00000CE8
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023190D4:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023190E0: .word ov10_022C4740
#ifdef JAPAN
_023190E4: .word 0x00000A27
_023190E8: .word 0x00000A28
#else
_023190E4: .word 0x00000CE7
_023190E8: .word 0x00000CE8
#endif
	arm_func_end TryInflictMagicCoatStatus

	arm_func_start TryInflictLightScreenStatus
TryInflictLightScreenStatus: ; 0x023190EC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #3
	beq _02319164
	ldr r1, _02319180 ; =ov10_022C4730
	mov r3, #3
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E4014
	ldr r2, _02319184 ; =0x00000CF4
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319174
_02319164:
	ldr r2, _02319188 ; =0x00000CF5
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02319174:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02319180: .word ov10_022C4730
#ifdef JAPAN
_02319184: .word 0x00000A34
_02319188: .word 0x00000A35
#else
_02319184: .word 0x00000CF4
_02319188: .word 0x00000CF5
#endif
	arm_func_end TryInflictLightScreenStatus

	arm_func_start TryInflictReflectStatus
TryInflictReflectStatus: ; 0x0231918C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #1
	beq _02319204
	ldr r1, _02319220 ; =REFLECT_LIGHT_SCREEN_TURN_RANGE
	mov r3, #1
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E4068
	ldr r2, _02319224 ; =0x00000CF6
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319214
_02319204:
	ldr r2, _02319228 ; =0x00000CF7
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02319214:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02319220: .word REFLECT_LIGHT_SCREEN_TURN_RANGE
#ifdef JAPAN
_02319224: .word 0x00000A36
_02319228: .word 0x00000A37
#else
_02319224: .word 0x00000CF6
_02319228: .word 0x00000CF7
#endif
	arm_func_end TryInflictReflectStatus

	arm_func_start TryInflictProtectStatus
TryInflictProtectStatus: ; 0x0231922C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl ov29_022E40B8
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xd5]
	cmp r0, #7
	beq _023192A4
	ldr r1, _023192D0 ; =ov10_022C47B8
	mov r3, #7
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r3, r0, #1
	mov r0, #0
	mov r1, r5
	mov r2, r0
	strb r3, [r4, #0xd6]
	bl SubstitutePlaceholderStringTags
	ldr r2, _023192D4 ; =0x00000D47
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023192C4
_023192A4:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023192D8 ; =0x00000D48
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023192C4:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023192D0: .word ov10_022C47B8
#ifdef JAPAN
_023192D4: .word 0x00000A87
_023192D8: .word 0x00000A88
#else
_023192D4: .word 0x00000D47
_023192D8: .word 0x00000D48
#endif
	arm_func_end TryInflictProtectStatus

	arm_func_start TryInflictMirrorCoatStatus
TryInflictMirrorCoatStatus: ; 0x023192DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #8
	beq _02319354
	ldr r1, _02319370 ; =ov10_022C47CC
	mov r3, #8
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E40BC
	ldr r2, _02319374 ; =0x00000D4F
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319364
_02319354:
	mov r0, r6
	mov r1, r5
#ifdef JAPAN
	mov r2, #0xA90
#else
	mov r2, #0xd50
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02319364:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02319370: .word ov10_022C47CC
#ifdef JAPAN
_02319374: .word 0x00000A8F
#else
_02319374: .word 0x00000D4F
#endif
	arm_func_end TryInflictMirrorCoatStatus

	arm_func_start TryInflictEndureStatus
TryInflictEndureStatus: ; 0x02319378
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #9
	beq _023193F0
	ldr r1, _0231940C ; =ov10_022C47F4
	mov r3, #9
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E4108
	ldr r2, _02319410 ; =0x00000D58
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319400
_023193F0:
	ldr r2, _02319414 ; =0x00000D59
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02319400:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0231940C: .word ov10_022C47F4
#ifdef JAPAN
_02319410: .word 0x00000A98
_02319414: .word 0x00000A99
#else
_02319410: .word 0x00000D58
_02319414: .word 0x00000D59
#endif
	arm_func_end TryInflictEndureStatus

	arm_func_start TryInflictMirrorMoveStatus
TryInflictMirrorMoveStatus: ; 0x02319418
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0xb
	beq _02319490
	ldr r1, _023194AC ; =ov10_022C4840
	mov r3, #0xb
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E410C
	ldr r2, _023194B0 ; =0x00000D5A
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023194A0
_02319490:
	ldr r2, _023194B4 ; =0x00000D5B
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023194A0:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023194AC: .word ov10_022C4840
#ifdef JAPAN
_023194B0: .word 0x00000A9A
_023194B4: .word 0x00000A9B
#else
_023194B0: .word 0x00000D5A
_023194B4: .word 0x00000D5B
#endif
	arm_func_end TryInflictMirrorMoveStatus

	arm_func_start TryInflictConversion2Status
TryInflictConversion2Status: ; 0x023194B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	mov r1, #0x25
	ldr r4, [r5, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02319500
	ldr r2, _02319574 ; =0x00000DC4
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r4, r5, r6, pc}
_02319500:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0xc
	beq _02319558
	ldr r1, _02319578 ; =ov10_022C4854
	mov r3, #0xc
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E415C
	ldr r2, _0231957C ; =0x00000D5C
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319568
_02319558:
	ldr r2, _02319580 ; =0x00000D5D
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_02319568:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CONVERSION2_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CONVERSION2_STATUS_OFFSET 0
#endif
_02319574: .word 0x00000DC4 + TRY_INFLICT_CONVERSION2_STATUS_OFFSET
_02319578: .word ov10_022C4854
_0231957C: .word 0x00000D5C + TRY_INFLICT_CONVERSION2_STATUS_OFFSET
_02319580: .word 0x00000D5D + TRY_INFLICT_CONVERSION2_STATUS_OFFSET
	arm_func_end TryInflictConversion2Status

	arm_func_start TryInflictVitalThrowStatus
TryInflictVitalThrowStatus: ; 0x02319584
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd5]
	cmp r0, #0xd
	beq _023195FC
	ldr r1, _02319618 ; =ov10_022C485C
	mov r3, #0xd
	mov r0, r5
	mov r2, #0
	strb r3, [r4, #0xd5]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r5
	strb r1, [r4, #0xd6]
	bl ov29_022E41AC
	ldr r2, _0231961C ; =0x00000D5E
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231960C
_023195FC:
	ldr r2, _02319620 ; =0x00000D5F
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231960C:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02319618: .word ov10_022C485C
#ifdef JAPAN
_0231961C: .word 0x00000A9E
_02319620: .word 0x00000A9F
#else
_0231961C: .word 0x00000D5E
_02319620: .word 0x00000D5F
#endif
	arm_func_end TryInflictVitalThrowStatus

	arm_func_start TryResetStatChanges
TryResetStatChanges: ; 0x02319624
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	mov r4, #0
	bl EntityIsValid__02318E4C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, #0xa
	mov sl, #0x100
	ldr r3, [r6, #0xb4]
	mov ip, r4
	mov fp, #1
	mov r1, r2
	mov r0, r2
	mov lr, sl
_02319668:
	add sb, r3, ip, lsl #1
	ldrsh r8, [sb, #0x24]
	cmp r8, #0xa
	strneh r2, [sb, #0x24]
	add sb, r3, ip, lsl #1
	ldrsh r8, [sb, #0x28]
	movne r4, fp
	cmp r8, #0xa
	strneh r1, [sb, #0x28]
	add sb, r3, ip, lsl #1
	ldrsh r8, [sb, #0x2c]
	movne r4, #1
	cmp r8, #0xa
	strneh r0, [sb, #0x2c]
	add sb, r3, ip, lsl #2
	ldr r8, [sb, #0x34]
	movne r4, #1
	cmp r8, #0x100
	strne sl, [sb, #0x34]
	add sb, r3, ip, lsl #2
	ldr r8, [sb, #0x3c]
	movne r4, #1
	cmp r8, #0x100
	add ip, ip, #1
	strne lr, [sb, #0x3c]
	movne r4, #1
	cmp ip, #2
	blt _02319668
	cmp r4, #0
	beq _023196EC
	mov r0, r6
	bl ov29_022E543C
	b _023196FC
_023196EC:
	cmp r5, #0
	beq _023196FC
	mov r0, r6
	bl ov29_022E543C
_023196FC:
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r4, #0
	beq _02319728
	mov r0, r7
	mov r1, r6
#ifdef JAPAN
	mov r2, #0xaa0
#else
	mov r2, #0xd60
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02319738
_02319728:
	ldr r2, _02319744 ; =0x00000D61
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02319738:
	mov r0, r6
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02319744: .word 0x00000AA1
#else
_02319744: .word 0x00000D61
#endif
	arm_func_end TryResetStatChanges
