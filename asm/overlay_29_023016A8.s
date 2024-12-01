	.include "asm/macros.inc"
	.include "overlay_29_023016A8.inc"

	.text

	arm_func_start ShouldMonsterRunAwayVariation
ShouldMonsterRunAwayVariation: ; 0x023016A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ShouldMonsterRunAway
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov29_023016D8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShouldMonsterRunAwayVariation

	arm_func_start ov29_023016D8
ov29_023016D8: ; 0x023016D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	ldrb r1, [r4, #7]
	cmp r1, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r1, #0x2b
	bl AbilityIsActive
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02301758 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	ldrsh r1, [r4, #0x10]
	add r0, r2, r2, lsr #31
	cmp r1, r0, asr #1
	movle r1, #1
	movgt r1, #0
	and r2, r1, #0xff
	mov r0, r4
	mov r1, #4
	bl UpdateStateFlags
	cmp r5, #0
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_022E62A8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02301758: .word 0x000003E7
	arm_func_end ov29_023016D8

	arm_func_start GetTreatmentBetweenMonsters
GetTreatmentBetweenMonsters: ; 0x0230175C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #0xb4]
	ldr r5, [r1, #0xb4]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #9]
	cmp r1, #1
	ldrneb r1, [r5, #9]
	cmpne r1, #1
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0xbc]
	cmp r1, #7
	ldrneb r1, [r5, #0xbc]
	cmpne r1, #7
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r3, #0
	beq _023017C4
	ldrb r1, [r4, #6]
	cmp r1, #0
	ldreqb r1, [r5, #0xc4]
	cmpeq r1, #6
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
_023017C4:
	cmp r2, #0
	ldreqb r1, [r5, #0xef]
	cmpeq r1, #1
	bne _023017E4
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
_023017E4:
#ifdef JAPAN
	ldrb r0, [r4, #0x10b]
#else
	ldrb r0, [r4, #0x10c]
#endif
	cmp r0, #0
	bne _02301804
	ldrb r0, [r4, #7]
	cmp r0, #0
	movne r1, #0
	moveq r1, #1
	b _02301810
_02301804:
	cmp r0, #1
	moveq r1, #2
	movne r1, #3
_02301810:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _02301828
	cmp r0, #3
	moveq r2, #1
	b _02301844
_02301828:
	ldrb r0, [r4, #6]
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	cmp r0, #0
	ldrneb r0, [r4, #8]
	cmpne r0, #0
_02301844:
	ldrb r0, [r5, #9]
	movne r2, #0
	cmp r0, #0
	beq _02301860
	cmp r0, #3
	moveq r3, #1
	b _0230187C
_02301860:
	ldrb r0, [r5, #6]
	cmp r0, #0
	movne r3, #1
	moveq r3, #0
	cmp r0, #0
	ldrneb r0, [r5, #8]
	cmpne r0, #0
_0230187C:
	ldrb r0, [r5, #0xd8]
	movne r3, #0
	cmp r0, #2
	ldr r0, _023018A8 ; =ov29_023527A0
	moveq r4, #1
	add r0, r0, r1, lsl #3
	add r0, r0, r2, lsl #2
	movne r4, #0
	add r0, r0, r3, lsl #1
	ldrb r0, [r4, r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023018A8: .word ov29_023527A0
	arm_func_end GetTreatmentBetweenMonsters

	arm_func_start ov29_023018AC
ov29_023018AC: ; 0x023018AC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #0xb4]
	ldr r5, [r1, #0xb4]
	ldrb r0, [r4, #0xbc]
	cmp r0, #7
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
#ifndef JAPAN
	cmpne r0, #3
#endif
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0xbc]
	cmp r0, #7
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #9]
	cmp r0, #0
#ifndef JAPAN
	cmpne r0, #3
#endif
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #6]
	ldrb r0, [r5, #6]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
#ifdef JAPAN
	and r0, r0, #0xff
#endif
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023018AC

	arm_func_start SafeguardIsActive
SafeguardIsActive: ; 0x02301940
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r3, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r3, #0xd5]
	cmp r0, #2
	bne _02301988
	cmp r2, #0
	beq _02301980
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02301990 ; =0x00000C36
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02301980:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_02301988:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02301990: .word 0x00000975
#else
_02301990: .word 0x00000C36
#endif
	arm_func_end SafeguardIsActive

	arm_func_start LeafGuardIsActive
LeafGuardIsActive: ; 0x02301994
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetApparentWeather
	cmp r0, #1
	bne _02301A00
	mov r0, r6
	mov r1, r5
	mov r2, #0x7b
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	beq _02301A00
	cmp r4, #0
	beq _023019F8
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02301A08 ; =0x00000C37
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023019F8:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02301A00:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02301A08: .word 0x00000976
#else
_02301A08: .word 0x00000C37
#endif
	arm_func_end LeafGuardIsActive

	arm_func_start DefenderAbilityIsActive__02301A0C
DefenderAbilityIsActive__02301A0C: ; 0x02301A0C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	cmp r6, r5
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
#endif
	beq _02301A50
	bl IsMonster__02301A60
	cmp r0, #0
#ifdef JAPAN
	beq _02301A50
	mov r0, r6
#else
	cmpne r4, #0
	beq _02301A50
	mov r0, r7
#endif
	mov r1, #0x53
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #0
#ifdef JAPAN
	ldmneia sp!, {r4, r5, r6, pc}
_02301A50:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActive
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02301A50:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActive
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end DefenderAbilityIsActive__02301A0C

	arm_func_start IsMonster__02301A60
IsMonster__02301A60: ; 0x02301A60
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__02301A60

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

	arm_func_start NoGastroAcidStatus
NoGastroAcidStatus: ; 0x02301CDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__02301A60
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #4
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end NoGastroAcidStatus
