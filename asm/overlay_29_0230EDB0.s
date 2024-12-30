	.include "asm/macros.inc"
	.include "overlay_29_0230EDB0.inc"

	.text

	arm_func_start GetPossibleAiThrownItemDirections
GetPossibleAiThrownItemDirections: ; 0x0230EDB0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r4, _0230EFF4 ; =AI_THROWN_ITEM_ACTION_CHOICE_COUNT
	mov r5, #0
	mov sl, r0
	str r3, [sp, #8]
	ldr r0, _0230EFF8 ; =ov29_0237C9D0
	str r1, [sp]
	str r2, [sp, #4]
	str r5, [r4]
	mov fp, r5
_0230EDDC:
	strb fp, [r0, r5]
	add r5, r5, #1
	cmp r5, #8
	blt _0230EDDC
	mvn r0, #0
	str r0, [sp, #0x10]
_0230EDF4:
	ldr r0, _0230EFFC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, fp, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r4, [r0, #0xad4]
#else
	ldr r4, [r0, #0xb78]
#endif
	mov r0, r4
	bl EntityIsValid__0230F008
	cmp r0, #0
	cmpne sl, r4
	beq _0230EFE0
	ldr r0, [sp]
	mov r2, #0
	cmp r0, #1
	mov r0, sl
	mov r1, r4
	bne _0230EE50
	mov r3, r2
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _0230EFE0
	mov r0, #3
	str r0, [sp, #0xc]
	b _0230EE68
_0230EE50:
	mov r3, #1
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	bne _0230EFE0
	mov r0, #1
	str r0, [sp, #0xc]
_0230EE68:
	mov r0, sl
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	beq _0230EFE0
	ldrsh r6, [r4, #4]
	ldrsh r7, [sl, #4]
	sub r0, r7, r6
	bl abs
	mov r5, r0
	ldrsh r8, [r4, #6]
	ldrsh sb, [sl, #6]
	sub r0, sb, r8
	bl abs
	ldr r1, [sl, #0xb4]
	ldrb r1, [r1, #0xee]
	cmp r1, #0
	bne _0230EEC4
	cmp r5, r0
	movgt r1, r5
	movle r1, r0
	cmp r1, #0xa
	bgt _0230EFE0
_0230EEC4:
	cmp r5, r0
	ldr r5, [sp, #0x10]
	bne _0230EF08
	cmp r7, r6
	cmplt sb, r8
	movlt r5, #1
	blt _0230EF54
	cmp r7, r6
	bge _0230EEF4
	cmp sb, r8
	movgt r5, #3
	bgt _0230EF54
_0230EEF4:
	cmp r7, r6
	cmpgt sb, r8
	movgt r5, #5
	movle r5, #7
	b _0230EF54
_0230EF08:
	cmp r7, r6
	bne _0230EF1C
	cmp sb, r8
	movlt r5, #0
	blt _0230EF54
_0230EF1C:
	cmp r7, r6
	bge _0230EF30
	cmp sb, r8
	moveq r5, #2
	beq _0230EF54
_0230EF30:
	cmp r7, r6
	bne _0230EF44
	cmp sb, r8
	movgt r5, #4
	bgt _0230EF54
_0230EF44:
	cmp r7, r6
	ble _0230EF54
	cmp sb, r8
	moveq r5, #6
_0230EF54:
	cmp r5, #0
	blt _0230EFE0
	ldr r0, _0230EFF8 ; =ov29_0237C9D0
	ldrb r0, [r0, r5]
	cmp r0, #0
	bne _0230EFE0
	mov r0, sl
	mov r1, r4
	mov r2, r5
	mov r3, #0xa
	bl IsTargetInRange
	cmp r0, #0
	beq _0230EFE0
	ldr r0, _0230EFF8 ; =ov29_0237C9D0
	mov r1, #1
	strb r1, [r0, r5]
	ldr r0, [sp, #8]
	cmp r0, #0
	ldr r0, _0230EFF4 ; =AI_THROWN_ITEM_ACTION_CHOICE_COUNT
	ldr r1, [r0]
	ldr r0, _0230F000 ; =AI_THROWN_ITEM_DIRECTIONS
	str r5, [r0, r1, lsl #2]
	movne r0, #0x64
	bne _0230EFC4
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	mov r0, r4
	bl GetAiUseItemProbability
_0230EFC4:
	ldr r1, _0230EFF4 ; =AI_THROWN_ITEM_ACTION_CHOICE_COUNT
	ldr r2, [r1]
	ldr r1, _0230F004 ; =AI_THROWN_ITEM_PROBABILITIES
	str r0, [r1, r2, lsl #2]
	ldr r0, _0230EFF4 ; =AI_THROWN_ITEM_ACTION_CHOICE_COUNT
	add r1, r2, #1
	str r1, [r0]
_0230EFE0:
	add fp, fp, #1
	cmp fp, #0x14
	blt _0230EDF4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230EFF4: .word AI_THROWN_ITEM_ACTION_CHOICE_COUNT
_0230EFF8: .word ov29_0237C9D0
_0230EFFC: .word DUNGEON_PTR
_0230F000: .word AI_THROWN_ITEM_DIRECTIONS
_0230F004: .word AI_THROWN_ITEM_PROBABILITIES
	arm_func_end GetPossibleAiThrownItemDirections
