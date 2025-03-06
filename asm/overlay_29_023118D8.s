	.include "asm/macros.inc"
	.include "overlay_29_023118D8.inc"

	.text

	arm_func_start TryInflictSleepStatus
TryInflictSleepStatus: ; 0x023118D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r4, r3
	mov r2, #1
	mov r3, r2
	mov r7, r0
	mov r6, r1
	str r4, [sp]
	bl IsProtectedFromSleepClassStatus
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xbd]
	cmp r0, #2
	bne _02311930
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _023119D0 ; =0x00000D09
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02311930:
	cmp r0, #5
	bne _02311954
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _023119D4 ; =0x00000D0A
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02311954:
	mov r0, r6
	bl ov29_022E3E74
	mov r0, r6
	mov r1, r5
	bl InflictSleepStatusSingle
	mov r4, r0
	mov r0, r6
	mov r1, #8
	bl ov29_02304A48
	cmp r4, #1
	bne _02311994
	ldr r2, _023119D8 ; =0x00000D06
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02311994:
	cmp r4, #2
	bne _023119B0
	ldr r2, _023119DC ; =0x00000D07
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023119B0:
	ldr r2, _023119E0 ; =0x00000D04
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_STATUS_SLEEP_OFFSET -0x2C0
#else
#define TRY_INFLICT_STATUS_SLEEP_OFFSET 0
#endif
_023119D0: .word 0x00000D09 + TRY_INFLICT_STATUS_SLEEP_OFFSET
_023119D4: .word 0x00000D0A + TRY_INFLICT_STATUS_SLEEP_OFFSET
_023119D8: .word 0x00000D06 + TRY_INFLICT_STATUS_SLEEP_OFFSET
_023119DC: .word 0x00000D07 + TRY_INFLICT_STATUS_SLEEP_OFFSET
_023119E0: .word 0x00000D04 + TRY_INFLICT_STATUS_SLEEP_OFFSET
	arm_func_end TryInflictSleepStatus

	arm_func_start IsProtectedFromSleepClassStatus
IsProtectedFromSleepClassStatus: ; 0x023119E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x20]
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #1
	beq _02311B78
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r5, #0
	beq _02311A48
	mov r0, r8
	mov r1, r7
	mov r2, r4
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #1
	bne _02311B78
_02311A48:
	cmp r6, #0
	beq _02311A6C
	mov r0, r8
	mov r1, r7
	mov r2, r4
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #1
	bne _02311B78
_02311A6C:
	mov r0, r7
	mov r1, #0x11
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _02311AA0
	cmp r4, #0
	beq _02311A98
	ldr r2, _02311B80 ; =0x00000DA4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02311A98:
	mov r0, #1
	b _02311B78
_02311AA0:
	mov r0, r8
	mov r1, r7
	mov r2, #0x36
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02311ADC
	cmp r4, #0
	beq _02311AD4
	ldr r2, _02311B84 ; =0x00000DA5
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02311AD4:
	mov r0, #1
	b _02311B78
_02311ADC:
	mov r0, r8
	mov r1, r7
	mov r2, #0x49
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02311B18
	cmp r4, #0
	beq _02311B10
	ldr r2, _02311B88 ; =0x00000DA6
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02311B10:
	mov r0, #1
	b _02311B78
_02311B18:
	mov r0, r7
	mov r1, #0x1c
	bl ItemIsActive__02311BF8
	cmp r0, #0
	beq _02311B4C
	cmp r4, #0
	beq _02311B44
	ldr r2, _02311B8C ; =0x00000DB1
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02311B44:
	mov r0, #1
	b _02311B78
_02311B4C:
	ldr r3, _02311B90 ; =0x00000DC2
	mov ip, #0xa
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02311B78:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET -0x2C0
#else
#define IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET 0
#endif
_02311B80: .word 0x00000DA4 + IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET
_02311B84: .word 0x00000DA5 + IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET
_02311B88: .word 0x00000DA6 + IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET
_02311B8C: .word 0x00000DB1 + IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET
_02311B90: .word 0x00000DC2 + IS_PROTECTED_FROM_SLEEP_CLASS_STATUS_OFFSET
	arm_func_end IsProtectedFromSleepClassStatus

	arm_func_start DefenderAbilityIsActive__02311B94
DefenderAbilityIsActive__02311B94: ; 0x02311B94
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02311BE8
	cmp r0, #0
	moveq r1, #0
	beq _02311BC8
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02311BC8:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _02311BE8
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02311BE8:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActive__02311B94
