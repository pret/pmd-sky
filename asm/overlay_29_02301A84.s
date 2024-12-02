	.include "asm/macros.inc"
	.include "overlay_29_02301A84.inc"

	.text

	arm_func_start ov29_02301A84
ov29_02301A84: ; 0x02301A84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov sb, r2
	bl GetApparentWeather
	ldr r6, _02301B24 ; =EXCL_ITEM_EFFECTS_WEATHER_NO_STATUS
	mov r7, r0
	ldrb r0, [r6, r7]
	mov r8, #0
	cmp r0, #0
	beq _02301B18
	ldrb r1, [r6, r7]
	mov r0, r4
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	beq _02301B18
	cmp sb, #0
	ldrb r6, [r6, r7]
	beq _02301B14
	mov r0, r8
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, r4
	mov r1, r6
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _02301B28 ; =0x00000C39
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02301B14:
	mov r8, #1
_02301B18:
	mov r0, r8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02301B24: .word EXCL_ITEM_EFFECTS_WEATHER_NO_STATUS
#ifdef JAPAN
_02301B28: .word 0x00000978
#else
_02301B28: .word 0x00000C39
#endif
	arm_func_end ov29_02301A84

	arm_func_start IsProtectedFromStatDrops
IsProtectedFromStatDrops: ; 0x02301B2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0
	mov r5, r2
	mov r6, r1
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	bl MistIsActive
	movs r4, r0
	beq _02301BB0
	cmp r5, #0
	beq _02301BA8
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r4, #1
	bne _02301B8C
	ldr r2, _02301C20 ; =0x00000C38
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02301BA8
_02301B8C:
	cmp r4, #2
	bne _02301BA8
	ldr r2, _02301C24 ; =0x00000C39
	mov r0, r7
	mov r1, r6
	mov r3, #0x26
	bl ov29_02314DC4
_02301BA8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02301BB0:
	mov r0, r7
	mov r1, r6
	mov r2, #0xf
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	bne _02301BE8
	mov r0, r7
	mov r1, r6
	mov r2, #0x18
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	beq _02301C18
_02301BE8:
	cmp r5, #0
	beq _02301C10
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02301C28 ; =0x00000C3A
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02301C10:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02301C18:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02301C20: .word 0x00000977
_02301C24: .word 0x00000978
_02301C28: .word 0x00000979
#else
_02301C20: .word 0x00000C38
_02301C24: .word 0x00000C39
_02301C28: .word 0x00000C3A
#endif
	arm_func_end IsProtectedFromStatDrops

	arm_func_start ov29_02301C2C
ov29_02301C2C: ; 0x02301C2C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r8, [sl, #0xb4]
	mov sb, r1
	ldrb r0, [r8, #0xbd]
	cmp r0, #1
	cmpne r0, #5
	cmpne r0, #3
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0
#ifdef JAPAN
	add r5, r8, #0x120
#else
	add r5, r8, #0x124
#endif
	mov fp, r6
	mov r4, #1
	b _02301CCC
_02301C68:
	ldrb r1, [r5, r6, lsl #3]
	add r7, r5, r6, lsl #3
	tst r1, #1
	movne r0, r4
	moveq r0, fp
	tst r0, #0xff
	beq _02301CC8
	ldrb r0, [r8, #7]
	cmp r0, #0
	bne _02301C98
	tst r1, #4
	beq _02301CC8
_02301C98:
	mov r0, sl
	mov r1, r7
	mov r2, #1
	bl ov29_02324BE8
	cmp r0, #0
	ldrneb r0, [r7, #6]
	cmpne r0, #0
	beq _02301CC8
	ldrh r0, [r7, #4]
	cmp r0, sb
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02301CC8:
	add r6, r6, #1
_02301CCC:
	cmp r6, #4
	blt _02301C68
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02301C2C
