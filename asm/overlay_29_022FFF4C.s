	.include "asm/macros.inc"
	.include "overlay_29_022FFF4C.inc"

	.text

	arm_func_start CalcSpeedStageWrapper
CalcSpeedStageWrapper: ; 0x022FFF4C
	ldr ip, _022FFF58 ; =CalcSpeedStage
	mov r1, #1
	bx ip
	.align 2, 0
_022FFF58: .word CalcSpeedStage
	arm_func_end CalcSpeedStageWrapper

	arm_func_start GetNumberOfAttacks
GetNumberOfAttacks: ; 0x022FFF5C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r5, #0
	mov sl, r0
	mov sb, r1
	mov r6, r5
	mov r7, r5
	bl EntityIsValid__023000E4
	cmp r0, #0
	moveq r0, r5
	beq _023000D4
	mov r0, sl
	bl GetApparentWeather
	mov r8, r0
	cmp r8, #4
	bne _022FFFB8
	mov r0, sl
	mov r1, #0x1b
	bl AbilityIsActive
	cmp r0, #0
	movne r5, #1
	movne r6, r5
	b _022FFFD8
_022FFFB8:
	cmp r8, #1
	bne _022FFFD8
	mov r0, sl
	mov r1, #0x4a
	bl AbilityIsActive
	cmp r0, #0
	movne r5, #1
	movne r6, r5
_022FFFD8:
	ldr r4, _023000DC ; =EXCL_ITEM_EFFECTS_WEATHER_ATK_SPEED_BOOST
	ldrb r0, [r4, r8]
	cmp r0, #0
	beq _02300000
	ldrb r1, [r4, r8]
	mov r0, sl
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	ldrneb r7, [r4, r8]
	movne r5, #1
_02300000:
	mov r0, sl
	mov r1, #0x54
	bl AbilityIsActive
	cmp r0, #0
	beq _02300028
	ldr r0, [sl, #0xb4]
	ldrsh r0, [r0, #0x66]
	cmp r0, #0
	moveq r5, #1
	moveq r6, r5
_02300028:
	cmp sb, #0
	beq _023000C8
	cmp r6, #0
	beq _02300068
	ldr r0, [sl, #0xb4]
	mov r2, r5
	mov r1, #0x40
	bl UpdateStateFlags
	cmp r0, #0
	beq _023000C8
	mov r0, sl
	bl ov29_022E655C
#ifdef JAPAN
	ldr r1, _02301510 ; =0x0000096F
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xc30
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _023000C8
_02300068:
	cmp r7, #0
	beq _023000C8
	ldr r0, [sl, #0xb4]
	mov r2, r5
	mov r1, #0x40
	bl UpdateStateFlags
	cmp r0, #0
	beq _023000C8
	mov r0, sl
	bl ov29_022E655C
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, sl
	mov r1, r7
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #0
	bl PrepareItemForPrinting__02345728
#ifdef JAPAN
	mov r0, sl
	mov r1, #0x970
#else
	ldr r1, _023000E0 ; =0x00000C31
	mov r0, sl
#endif
	bl LogMessageByIdWithPopupCheckUser
_023000C8:
	cmp r5, #0
	movne r0, #2
	moveq r0, #1
_023000D4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023000DC: .word EXCL_ITEM_EFFECTS_WEATHER_ATK_SPEED_BOOST
#ifdef JAPAN
_02301510: .word 0x0000096F
#else
_023000E0: .word 0x00000C31
#endif
	arm_func_end GetNumberOfAttacks
