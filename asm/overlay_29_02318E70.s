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
	ldr r1, _02318F04 ; =0x022C4734
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
_02318F04: .word 0x022C4734
_02318F08: .word 0x00000CEE
_02318F0C: .word 0x00000CEF
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
	ldr r1, _02318FA4 ; =0x022C4738
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
	mov r2, #0xcf0
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
_02318FA4: .word 0x022C4738
_02318FA8: .word 0x00000CF1
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
	ldr r1, _02319040 ; =0x022C4794
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
_02319040: .word 0x022C4794
_02319044: .word 0x00000CDE
_02319048: .word 0x00000CDF
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
	ldr r1, _023190E0 ; =0x022C4740
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
_023190E0: .word 0x022C4740
_023190E4: .word 0x00000CE7
_023190E8: .word 0x00000CE8
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
	ldr r1, _02319180 ; =0x022C4730
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
_02319180: .word 0x022C4730
_02319184: .word 0x00000CF4
_02319188: .word 0x00000CF5
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
	ldr r1, _02319220 ; =0x022C472C
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
_02319220: .word 0x022C472C
_02319224: .word 0x00000CF6
_02319228: .word 0x00000CF7
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
	ldr r1, _023192D0 ; =0x022C47B8
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
_023192D0: .word 0x022C47B8
_023192D4: .word 0x00000D47
_023192D8: .word 0x00000D48
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
	ldr r1, _02319370 ; =0x022C47CC
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
	mov r2, #0xd50
	bl LogMessageByIdWithPopupCheckUserTarget
_02319364:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02319370: .word 0x022C47CC
_02319374: .word 0x00000D4F
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
	ldr r1, _0231940C ; =0x022C47F4
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
_0231940C: .word 0x022C47F4
_02319410: .word 0x00000D58
_02319414: .word 0x00000D59
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
	ldr r1, _023194AC ; =0x022C4840
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
_023194AC: .word 0x022C4840
_023194B0: .word 0x00000D5A
_023194B4: .word 0x00000D5B
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
	ldr r1, _02319578 ; =0x022C4854
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
_02319574: .word 0x00000DC4
_02319578: .word 0x022C4854
_0231957C: .word 0x00000D5C
_02319580: .word 0x00000D5D
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
	ldr r1, _02319618 ; =0x022C485C
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
_02319618: .word 0x022C485C
_0231961C: .word 0x00000D5E
_02319620: .word 0x00000D5F
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
	mov r2, #0xd60
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
_02319744: .word 0x00000D61
	arm_func_end TryResetStatChanges

	arm_func_start MirrorMoveIsActive
MirrorMoveIsActive: ; 0x02319748
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02318E4C
	cmp r0, #0
	beq _0231979C
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xb
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x25
	bl ExclusiveItemEffectIsActive__023197A8
	cmp r0, #0
	beq _0231979C
	ldr r0, _023197A4 ; =0x022C4648
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r4, pc}
_0231979C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_023197A4: .word 0x022C4648
	arm_func_end MirrorMoveIsActive

	arm_func_start ExclusiveItemEffectIsActive__023197A8
ExclusiveItemEffectIsActive__023197A8: ; 0x023197A8
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__023197A8

	arm_func_start MistIsActive
MistIsActive: ; 0x023197CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02318E4C
	cmp r0, #0
	beq _0231980C
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xe
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x26
	bl ExclusiveItemEffectIsActive__023197A8
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r4, pc}
_0231980C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end MistIsActive

	arm_func_start Conversion2IsActive
Conversion2IsActive: ; 0x02319814
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__02318E4C
	cmp r0, #0
	beq _02319854
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd5]
	cmp r0, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x27
	bl ExclusiveItemEffectIsActive__023197A8
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r4, pc}
_02319854:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end Conversion2IsActive

	arm_func_start ov29_0231985C
ov29_0231985C: ; 0x0231985C
	mov r2, #0
	ldr r0, _0231987C ; =0x0237CA18
	mov r1, r2
_02319868:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #8
	blt _02319868
	bx lr
	.align 2, 0
_0231987C: .word 0x0237CA18
	arm_func_end ov29_0231985C

	arm_func_start AiConsiderMove
AiConsiderMove: ; 0x02319880
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r1
	str r0, [sp, #8]
	mov r0, #1
	mov sb, r2
	ldr r6, [sl, #0xb4]
	str r0, [sp, #0x14]
	mov r5, #0
	bl ov29_0231985C
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	str r0, [sp, #0x24]
	mov r0, sl
	mov r1, #8
	bl IqSkillIsEnabled
	mov r4, r0
	ldr r0, [sp, #8]
	mov r1, r5
	strb r1, [r0]
	ldrb r0, [r6, #0xd0]
	cmp r0, #5
	bne _023198F8
	mov r0, sb
	bl IsAffectedByTaunt
	cmp r0, #0
	moveq r0, #1
	beq _02319F64
_023198F8:
	cmp r4, #0
	beq _02319918
	mov r0, sl
	mov r1, sb
	bl StatusCheckerCheck
	cmp r0, #0
	moveq r0, #1
	beq _02319F64
_02319918:
	mov r0, sb
	mov r1, #0
	bl GetMoveTargetAndRange
	ldr r1, _02319F6C ; =0x00000273
	cmp r0, r1
	bne _02319958
	ldrsh r3, [r6, #0x12]
	ldrsh r2, [r6, #0x16]
	add r0, r1, #0x174
	add r2, r3, r2
	cmp r2, r0
	movgt r2, r0
	ldrsh r0, [r6, #0x10]
	cmp r0, r2
	moveq r0, #1
	beq _02319F64
_02319958:
	ldr r0, [sp, #0x24]
	ands r7, r0, #0xf0
	cmpne r7, #0x10
	cmpne r7, #0x20
	bne _02319A54
	mov r0, sl
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _023199C0
	ldrb r6, [r6, #0x4c]
	ldr r4, _02319F70 ; =0x0237CA18
	ldrb r0, [r4, r6]
	cmp r0, #0
	bne _02319E88
	ldr r1, _02319F74 ; =0x0237CA20
	mov r3, #1
	ldr r0, _02319F78 ; =0x0237CA28
	mov r2, #0x63
	strb r3, [r4, r6]
	strb r6, [r1]
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #0x20]
	add r5, r5, #1
	b _02319E88
_023199C0:
	ldr fp, _02319F7C ; =0x0235171C
	mov r8, #0
_023199C8:
	mov r1, r8, lsl #2
	add r0, fp, r8, lsl #2
	ldrsh r6, [sl, #4]
	ldrsh r3, [fp, r1]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r0, #2]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	cmp r6, #0
	beq _02319A44
	ldr r0, [r6]
	cmp r0, #1
	bne _02319A44
	cmp r7, #0x10
	cmpne r7, #0x20
	beq _02319A24
	mov r0, sl
	mov r1, r8
	bl CanAttackInDirection
	cmp r0, #0
	beq _02319A44
_02319A24:
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	mov r3, r6
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319A44:
	add r8, r8, #1
	cmp r8, #8
	blt _023199C8
	b _02319E88
_02319A54:
	cmp r7, #0x30
	bne _02319AC8
	ldr r7, _02319F80 ; =0x02353538
	mov r6, #0
_02319A64:
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
	mov r0, r8
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _02319AB8
	mov r0, sl
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	beq _02319AB8
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	mov r3, r8
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319AB8:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02319A64
	b _02319E88
_02319AC8:
	cmp r7, #0x40
	bne _02319BB0
	mov r8, #0
_02319AD4:
	ldr r0, _02319F7C ; =0x0235171C
	mov r2, r8, lsl #2
	add r0, r0, r8, lsl #2
	ldrsh r6, [r0, #2]
	ldr r0, _02319F7C ; =0x0235171C
	ldrsh r1, [sl, #6]
	ldrsh r7, [r0, r2]
	ldrsh r0, [sl, #4]
	add r1, r1, r6
	add r0, r0, r7
	bl GetTile
	mov fp, r0
	mov r0, sl
	mov r1, r8
	bl CanAttackInDirection
	cmp r0, #0
	beq _02319BA0
	ldr r3, [fp, #0xc]
	cmp r3, #0
	beq _02319B58
	ldr r0, [r3]
	cmp r0, #1
	bne _02319B58
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	str r4, [sp, #4]
	mov fp, r5
	bl TryAddTargetToAiTargetList
	mov r5, r0
	cmp fp, r5
	bne _02319BA0
_02319B58:
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	add r0, r0, r7, lsl #1
	add r1, r1, r6, lsl #1
	bl GetTile
	ldr r3, [r0, #0xc]
	cmp r3, #0
	beq _02319BA0
	ldr r0, [r3]
	cmp r0, #1
	bne _02319BA0
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319BA0:
	add r8, r8, #1
	cmp r8, #8
	blt _02319AD4
	b _02319E88
_02319BB0:
	cmp r7, #0x50
	cmpne r7, #0x80
	cmpne r7, #0x90
	bne _02319E00
	cmp r7, #0x50
	moveq r0, #0xa
	streq r0, [sp, #0xc]
	movne r0, #1
	strne r0, [sp, #0xc]
	cmp r7, #0x90
	moveq r0, #2
	streq r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x20]
	mvn r0, #0
	str r0, [sp, #0x28]
_02319BF0:
	ldr r0, _02319F80 ; =0x02353538
	ldr r1, [r0]
	ldr r0, [sp, #0x20]
	add r0, r1, r0, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb78]
	str r0, [sp, #0x18]
	bl EntityIsValid__02319F8C
	cmp r0, #0
	ldrne r0, [sp, #0x18]
	cmpne sl, r0
	beq _02319DE8
	ldr r1, [sp, #0x18]
	add r0, sl, #4
	add r1, r1, #4
	bl GetDirectionTowardsPosition
	ldr r1, _02319F70 ; =0x0237CA18
	str r0, [sp, #0x1c]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02319DE8
	ldr r1, [sp, #0x18]
	mov r0, sl
	bl CanSeeTarget
	cmp r0, #0
	beq _02319DE8
	ldr r0, [sp, #0x18]
	ldrsh r6, [sl, #4]
	ldrsh fp, [r0, #4]
	sub r0, r6, fp
	bl abs
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldrsh r8, [sl, #6]
	ldrsh r7, [r0, #6]
	sub r0, r8, r7
	bl abs
	ldr r1, [sp, #0x10]
	cmp r1, r0
	movgt r2, r1
	movle r2, r0
	cmp r2, #0xa
	movgt r0, #0
	bgt _02319D50
	ldr r1, [sp, #0xc]
	cmp r2, r1
	movgt r0, #0
	bgt _02319D50
	ldr r1, [sp, #0x10]
	cmp r1, r0
	ldr r0, [sp, #0x28]
	bne _02319CF8
	cmp r6, fp
	cmplt r8, r7
	movlt r0, #1
	blt _02319D44
	cmp r6, fp
	bge _02319CE4
	cmp r8, r7
	movgt r0, #3
	bgt _02319D44
_02319CE4:
	cmp r6, fp
	cmpgt r8, r7
	movgt r0, #5
	movle r0, #7
	b _02319D44
_02319CF8:
	cmp r6, fp
	bne _02319D0C
	cmp r8, r7
	movlt r0, #0
	blt _02319D44
_02319D0C:
	cmp r6, fp
	bge _02319D20
	cmp r8, r7
	moveq r0, #2
	beq _02319D44
_02319D20:
	cmp r6, fp
	bne _02319D34
	cmp r8, r7
	movgt r0, #4
	bgt _02319D44
_02319D34:
	cmp r6, fp
	ble _02319D44
	cmp r8, r7
	moveq r0, #6
_02319D44:
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
_02319D50:
	cmp r0, #0
	beq _02319DE8
	str r4, [sp]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x18]
	mov r1, sl
	mov r3, sb
	bl IsAiTargetEligible
	cmp r0, #0
	beq _02319DE8
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0xc]
	mov r0, sl
	bl IsTargetInRange
	cmp r0, #0
	beq _02319DE8
	ldr r1, _02319F70 ; =0x0237CA18
	ldr r0, [sp, #0x1c]
	mov r2, #1
	strb r2, [r1, r0]
	mov r1, r0
	ldr r0, _02319F74 ; =0x0237CA20
	strb r1, [r0, r5]
	mov r0, sl
	mov r1, sb
	bl GetMoveTypeForMonster
	mov r3, r0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	mov r0, sl
	bl ov29_0231A364
	ldr r1, _02319F84 ; =0x0237CA28
	str r0, [r1, r5, lsl #2]
	ldr r1, [sp, #0x18]
	ldr r0, _02319F88 ; =0x0237CA48
	str r1, [r0, r5, lsl #2]
	add r5, r5, #1
_02319DE8:
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0x14
	blt _02319BF0
	b _02319E88
_02319E00:
	cmp r7, #0x60
	bne _02319E60
	ldr r7, _02319F80 ; =0x02353538
	mov r6, #0
_02319E10:
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
	mov r0, r8
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _02319E50
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	mov r3, r8
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319E50:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02319E10
	b _02319E88
_02319E60:
	cmp r7, #0x70
	bne _02319E88
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r2, sl
	mov r3, sl
	mov r0, #0
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319E88:
	cmp r5, #0
	ldreq r0, [sp, #8]
	moveq r1, #0
	streqb r1, [r0]
	beq _02319F60
	mov r0, #0
	str r0, [sp, #0x14]
	mov r4, r0
	ldr r3, _02319F84 ; =0x0237CA28
	b _02319EC4
_02319EB0:
	ldr r2, [r3, r4, lsl #2]
	ldr r1, [sp, #0x14]
	add r4, r4, #1
	cmp r1, r2
	strlt r2, [sp, #0x14]
_02319EC4:
	cmp r4, r5
	blt _02319EB0
	mov r6, #0
	mov r2, r6
	ldr r4, _02319F84 ; =0x0237CA28
	b _02319EF0
_02319EDC:
	ldr r3, [r4, r6, lsl #2]
	ldr r1, [sp, #0x14]
	cmp r1, r3
	strne r2, [r4, r6, lsl #2]
	add r6, r6, #1
_02319EF0:
	cmp r6, r5
	blt _02319EDC
	mov r3, #0
	ldr r2, _02319F84 ; =0x0237CA28
	b _02319F10
_02319F04:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	add r0, r0, r1
_02319F10:
	cmp r3, r5
	blt _02319F04
	bl DungeonRandInt
	mov r3, #0
	ldr r2, _02319F84 ; =0x0237CA28
	b _02319F38
_02319F28:
	ldr r1, [r2, r3, lsl #2]
	subs r0, r0, r1
	bmi _02319F40
	add r3, r3, #1
_02319F38:
	cmp r3, r5
	blt _02319F28
_02319F40:
	ldr r1, _02319F74 ; =0x0237CA20
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0]
	ldrb r2, [r1, r3]
	mov r1, #8
	strb r2, [r0, #1]
	str r1, [r0, #4]
_02319F60:
	ldr r0, [sp, #0x14]
_02319F64:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02319F6C: .word 0x00000273
_02319F70: .word 0x0237CA18
_02319F74: .word 0x0237CA20
_02319F78: .word 0x0237CA28
_02319F7C: .word 0x0235171C
_02319F80: .word 0x02353538
_02319F84: .word 0x0237CA28
_02319F88: .word 0x0237CA48
	arm_func_end AiConsiderMove
