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

	arm_func_start AbilityIsActive
AbilityIsActive: ; 0x02301D10
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__02301A60
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	ldr r1, [r5, #0xb4]
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #0x60]
	cmp r0, r4
	bne _02301D58
	mov r0, r5
	mov r1, r4
	bl NoGastroAcidStatus
	ldmia sp!, {r3, r4, r5, pc}
_02301D58:
	ldrb r0, [r1, #0x61]
	cmp r0, r4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl NoGastroAcidStatus
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AbilityIsActive

	arm_func_start AbilityIsActiveVeneer
AbilityIsActiveVeneer: ; 0x02301D78
	ldr ip, _02301D80 ; =AbilityIsActive
	bx ip
	.align 2, 0
_02301D80: .word AbilityIsActive
	arm_func_end AbilityIsActiveVeneer

	arm_func_start OtherMonsterAbilityIsActive
OtherMonsterAbilityIsActive: ; 0x02301D84
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	mov r7, #0
	ldr r6, _02301E14 ; =DUNGEON_PTR
	b _02303354
_023032F4:
	ldr r0, [r6]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xad4]
	mov r0, r8
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r5, r8
	beq _02303348
	mov r0, r5
	mov r1, r8
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02303348
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_02303348:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02303354:
	cmp r7, #0x14
	blt _023032F4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #1
	ldr r8, _02301E14 ; =DUNGEON_PTR
	b _02301E04
_02301DA0:
	ldr r0, [r8]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78]
	mov r0, sb
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r7, sb
	beq _02301DF8
	mov r0, r7
	mov r1, sb
	bl ov29_022FAFD4
	cmp r0, #0
	beq _02301DF8
	mov r0, r7
	mov r1, sb
	mov r2, r6
	mov r3, r4
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02301DF8:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02301E04:
	cmp r5, #0x14
	blt _02301DA0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#endif
	.align 2, 0
_02301E14: .word DUNGEON_PTR
	arm_func_end OtherMonsterAbilityIsActive

	arm_func_start LevitateIsActive
LevitateIsActive: ; 0x02301E18
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GravityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x37
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end LevitateIsActive

	arm_func_start MonsterIsType
MonsterIsType: ; 0x02301E50
	cmp r1, #0
	ldr r2, [r0, #0xb4]
	moveq r0, #0
	bxeq lr
	ldrb r0, [r2, #0x5e]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	ldrb r0, [r2, #0x5f]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end MonsterIsType

	arm_func_start IsTypeAffectedByGravity
IsTypeAffectedByGravity: ; 0x02301E88
	stmdb sp!, {r3, lr}
	cmp r1, #0xa
	bne _02301EA4
	bl GravityIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02301EA4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end IsTypeAffectedByGravity

	arm_func_start HasTypeAffectedByGravity
HasTypeAffectedByGravity: ; 0x02301EAC
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r3, #0x5e]
	cmp r2, r1
	bne _02301ED4
	bl IsTypeAffectedByGravity
	ldmia sp!, {r3, pc}
_02301ED4:
	ldrb r2, [r3, #0x5f]
	cmp r2, r1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl IsTypeAffectedByGravity
	ldmia sp!, {r3, pc}
	arm_func_end HasTypeAffectedByGravity

	arm_func_start CanSeeInvisibleMonsters
CanSeeInvisibleMonsters: ; 0x02301EEC
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0xb4]
	ldrb r1, [r1, #0xf1]
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	mov r1, #0x21
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CanSeeInvisibleMonsters

	arm_func_start IsTacticSet
IsTacticSet: ; 0x02301F20
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _02301F38
	cmp r1, #1
	b _02301F40
_02301F38:
	ldrb r0, [r2, #0xa8]
	cmp r0, r1
_02301F40:
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsTacticSet

	arm_func_start HasDropeyeStatus
HasDropeyeStatus: ; 0x02301F50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__023000E4
	cmp r0, #0
	beq _02301F78
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xf1]
	cmp r0, #4
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02301F78:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end HasDropeyeStatus

	arm_func_start IqSkillIsEnabled
IqSkillIsEnabled: ; 0x02301F80
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _02301FAC
	ldr r0, _02301FB8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02301FAC:
	add r0, r2, #0x9c
	bl IqSkillFlagTest
	ldmia sp!, {r3, pc}
	.align 2, 0
_02301FB8: .word DUNGEON_PTR
	arm_func_end IqSkillIsEnabled

	arm_func_start UpdateIqSkills
UpdateIqSkills: ; 0x02301FBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrb r0, [r4, #6]
	mov r6, #0
	cmp r0, #0
	str r6, [r4, #0x9c]
	beq _02302118
	str r6, [r4, #0xa0]
	str r6, [r4, #0xa4]
	b _0230202C
_02301FE4:
	ldrsh r0, [r4, #2]
	and r1, r6, #0xff
	bl GetSpeciesIqSkill
	mov r5, r0
	cmp r5, #0xff
	beq _02302034
	ldrsh r0, [r4, #0xe]
	mov r1, r5
	bl CanLearnIqSkill
	cmp r0, #0
	beq _02302028
	mov r1, r5
	add r0, r4, #0x90
	bl EnableIqSkill
	mov r1, r5
	add r0, r4, #0x9c
	bl EnableIqSkill
_02302028:
	add r6, r6, #1
_0230202C:
	cmp r6, #0x19
	blt _02301FE4
_02302034:
	ldr r0, _023021E8 ; =MIN_IQ_EXCLUSIVE_MOVE_USER
	ldrsh r1, [r4, #0xe]
	ldrsh r0, [r0]
	cmp r1, r0
	bge _02302068
	add r0, r4, #0x9c
	mov r1, #0x17
	bl IqSkillFlagTest
	cmp r0, #0
	beq _02302068
	add r0, r4, #0x9c
	mov r1, #0x17
	bl DisableIqSkill
_02302068:
	mov r0, r4
	bl ov29_022FBDE0
	cmp r0, #0
	bne _0230208C
	ldr r0, _023021EC ; =MIN_IQ_ITEM_MASTER
	ldrsh r1, [r4, #0xe]
	ldrsh r0, [r0]
	cmp r1, r0
	bge _023020AC
_0230208C:
	add r0, r4, #0x9c
	mov r1, #0x16
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023020AC
	add r0, r4, #0x9c
	mov r1, #0x16
	bl DisableIqSkill
_023020AC:
	add r0, r4, #0x9c
	mov r1, #0x15
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023020CC
	add r0, r4, #0x9c
	mov r1, #0x15
	bl DisableIqSkill
_023020CC:
	add r0, r4, #0x9c
	mov r1, #0x14
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023020EC
	add r0, r4, #0x9c
	mov r1, #0x14
	bl DisableIqSkill
_023020EC:
	add r0, r4, #0x9c
	mov r1, #0xb
	bl IqSkillFlagTest
	cmp r0, #0
	beq _0230210C
	add r0, r4, #0x9c
	mov r1, #0xb
	bl DisableIqSkill
_0230210C:
	mov r0, #2
	strb r0, [r4, #0xa8]
	ldmia sp!, {r4, r5, r6, pc}
_02302118:
	str r6, [r4, #0xa0]
	str r6, [r4, #0xa4]
	b _02302174
_02302124:
	ldrsh r0, [r4, #2]
	and r1, r6, #0xff
	bl GetSpeciesIqSkill
	mov r5, r0
	cmp r5, #0xff
	beq _0230217C
	ldrsh r0, [r4, #0xe]
	mov r1, r5
	bl CanLearnIqSkill
	cmp r0, #0
	beq _02302170
	mov r1, r5
	add r0, r4, #0x90
	bl IqSkillFlagTest
	cmp r0, #0
	beq _02302170
	mov r1, r5
	add r0, r4, #0x9c
	bl EnableIqSkill
_02302170:
	add r6, r6, #1
_02302174:
	cmp r6, #0x19
	blt _02302124
_0230217C:
	mov r0, #3
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _023021A4
	add r0, r4, #0x90
	mov r1, #0x18
	bl EnableIqSkill
	add r0, r4, #0x9c
	mov r1, #0x18
	bl EnableIqSkill
_023021A4:
	add r0, r4, #0x90
	mov r1, #0x38
	bl IqSkillFlagTest
	cmp r0, #0
	beq _023021C4
	add r0, r4, #0x9c
	mov r1, #0x38
	bl EnableIqSkill
_023021C4:
	add r0, r4, #0x90
	mov r1, #0x39
	bl IqSkillFlagTest
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r4, #0x9c
	mov r1, #0x39
	bl EnableIqSkill
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023021E8: .word MIN_IQ_EXCLUSIVE_MOVE_USER
_023021EC: .word MIN_IQ_ITEM_MASTER
	arm_func_end UpdateIqSkills

	arm_func_start ov29_023021F0
ov29_023021F0: ; 0x023021F0
	ldr ip, _023021FC ; =UpdateIqSkills
	ldr r0, [r0, #0xb4]
	bx ip
	.align 2, 0
_023021FC: .word UpdateIqSkills
	arm_func_end ov29_023021F0

	arm_func_start ov29_02302200
ov29_02302200: ; 0x02302200
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
	ldr r5, _02302278 ; =DUNGEON_PTR
	b _02302268
_02302228:
	ldr r1, [r5]
	mov r0, r4
	add r1, r1, r6, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r7, [r1, #0xa84]
#else
	ldr r7, [r1, #0xb28]
#endif
	bl EntityIsValid__023000E4
	cmp r0, #0
	cmpne r4, r7
	beq _02302264
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02302264:
	add r6, r6, #1
_02302268:
	cmp r6, #4
	blt _02302228
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02302278: .word DUNGEON_PTR
	arm_func_end ov29_02302200

	arm_func_start GetMoveTypeForMonster
GetMoveTypeForMonster: ; 0x0230227C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldrh r0, [r4, #4]
	bl IsRegularAttackOrProjectile
	cmp r0, #0
	bne _023022C0
	mov r0, r5
	bl EntityIsValid__023000E4
	cmp r0, #0
	beq _023022C0
	mov r0, r5
	mov r1, #0x6b
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_023022C0:
	ldrh r1, [r4, #4]
	cmp r1, #0x144
	ldreq r0, [r5, #0xb4]
	ldreqb r0, [r0, #0x46]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02302318 ; =0x000001D7
	cmp r1, r0
	bne _023022F4
	mov r0, r5
	bl GetEntityNaturalGiftInfo
	cmp r0, #0
	ldrneb r0, [r0, #2]
	ldmneia sp!, {r3, r4, r5, pc}
_023022F4:
	ldrh r0, [r4, #4]
	cmp r0, #0x1f
	bne _0230230C
	mov r0, r5
	bl GetEntityWeatherBallType
	ldmia sp!, {r3, r4, r5, pc}
_0230230C:
	mov r0, r4
	bl GetMoveType
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02302318: .word 0x000001D7
	arm_func_end GetMoveTypeForMonster

	arm_func_start GetMovePower
GetMovePower: ; 0x0230231C
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r2, [r1, #4]
	mov r5, r0
	ldrb r4, [r1, #7]
	cmp r2, #0x144
	ldreq r0, [r5, #0xb4]
	ldreqsh r0, [r0, #0x44]
	addeq r0, r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r1
	bl GetMoveBasePower
	add r4, r4, r0
	mov r0, r5
	mov r1, #0x2b
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, r4, lsl #1
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMovePower

	arm_func_start MonsterCanThrowItems
MonsterCanThrowItems: ; 0x02302368
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #2]
	bl CanThrowItems
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end MonsterCanThrowItems

	arm_func_start ov29_02302388
ov29_02302388: ; 0x02302388
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__023000E4
	cmp r0, #0
	ldrne r0, [r4, #0xb4]
	ldrneb r1, [r0, #0xbc]
	cmpne r1, #7
	beq _023023B8
	bl IsExperienceLocked
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_023023B8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02302388

	arm_func_start UpdateStateFlags
UpdateStateFlags: ; 0x023023C0
#ifdef JAPAN
#define UPDATE_STATE_FLAGS_OFFSET -4
#else
#define UPDATE_STATE_FLAGS_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	add r3, r0, #0x100
	ldrh ip, [r3, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	tst ip, r1
	ldrneh ip, [r3, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	ldreqh lr, [r3, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	orrne ip, ip, r1
	mvneq ip, r1
	andeq ip, lr, ip
	cmp r2, #0
	add r2, r0, #0x100
	strh ip, [r3, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	ldrneh r3, [r2, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	ldreqh ip, [r2, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	add r0, r0, #0x100
	orrne r3, r3, r1
	mvneq r3, r1
	andeq r3, ip, r3
	strh r3, [r2, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	ldrh r2, [r0, #0x5a + UPDATE_STATE_FLAGS_OFFSET]
	tst r2, r1
	bne _02302428
	ldrh r0, [r0, #0x58 + UPDATE_STATE_FLAGS_OFFSET]
	tst r0, r1
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02302428:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end UpdateStateFlags

	arm_func_start IsProtectedFromNegativeStatus
IsProtectedFromNegativeStatus: ; 0x02302430
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl LeafGuardIsActive
	cmp r0, #0
	movne r0, #1
	bne _023024D4
	mov r0, r5
	mov r1, #0x59
	bl ExclusiveItemEffectIsActive__022FFF28
	cmp r0, #0
	beq _023024B4
	cmp r4, #0
	beq _023024AC
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #0
	mov r0, r5
	mov r1, #0x59
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #0
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _023024DC ; =0x00000C39
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023024AC:
	mov r0, #1
	b _023024D4
_023024B4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov29_02301A84
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_023024D4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_023024DC: .word 0x00000978
#else
_023024DC: .word 0x00000C39
#endif
	arm_func_end IsProtectedFromNegativeStatus

	arm_func_start ov29_023024E0
ov29_023024E0: ; 0x023024E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #7
	mov r5, r0
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _02302534
	cmp r4, #0
	beq _02302518
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	bne _0230252C
_02302518:
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xd0]
	cmp r0, #2
	cmpne r0, #4
	bne _02302534
_0230252C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_02302534:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023024E0

	arm_func_start AddExpSpecial
AddExpSpecial: ; 0x0230253C
#ifdef JAPAN
#define ADD_EXP_SPECIAL_OFFSET -4
#else
#define ADD_EXP_SPECIAL_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldr r5, [r7, #0xb4]
	mov r6, r2
	mov r0, r5
	bl IsExperienceLocked
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r5, #0xa]
	cmp r0, #0x64
	bne _02302580
	cmp r6, #0
	ldrgt r0, _023026B4 ; =DUNGEON_PTR
	movgt r1, #1
	ldrgt r0, [r0]
	strgtb r1, [r0, #0xf]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02302580:
	ldr r2, [r5, #0x20]
	mov r0, r7
	mov r1, #0x1c
	add r4, r2, r6
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023025C0
	ldr r0, _023026B8 ; =EXP_ELITE_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_023025C0:
	mov r0, r7
	mov r1, #0x43
	bl ItemIsActive__023026CC
	cmp r0, #0
	beq _023025F8
	ldr r0, _023026BC ; =WONDER_CHEST_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_023025F8:
	mov r0, r7
	mov r1, #0x42
	bl ItemIsActive__023026CC
	cmp r0, #0
	beq _02302630
	ldr r0, _023026C0 ; =MIRACLE_CHEST_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_02302630:
	ldr r1, [r7, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _02302650
	add r0, r1, #0x228 + ADD_EXP_SPECIAL_OFFSET
	mov r1, #0x4f
	bl ExclusiveItemEffectFlagTest
_02302650:
	cmp r0, #0
	beq _0230267C
	ldr r0, _023026C4 ; =EXCLUSIVE_ITEM_EXP_BOOST
	mov r1, #0x64
	ldrsh r0, [r0]
	mov r0, r0, lsl #8
	bl _s32_div_f
	mov r1, r0
	mov r0, r6, lsl #8
	bl MultiplyByFixedPoint
	add r4, r4, r0, asr #8
_0230267C:
	ldr r0, _023026C8 ; =0x0098967F
	cmp r4, r0
	movge r4, r0
	ldr r0, [r5, #0x20]
	subs r2, r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r5, #0x214 + ADD_EXP_SPECIAL_OFFSET]
	ldr r0, _023026B4 ; =DUNGEON_PTR
	add r1, r1, r2
	str r1, [r5, #0x214 + ADD_EXP_SPECIAL_OFFSET]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0xf]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023026B4: .word DUNGEON_PTR
_023026B8: .word EXP_ELITE_EXP_BOOST
_023026BC: .word WONDER_CHEST_EXP_BOOST
_023026C0: .word MIRACLE_CHEST_EXP_BOOST
_023026C4: .word EXCLUSIVE_ITEM_EXP_BOOST
_023026C8: .word 0x0098967F
	arm_func_end AddExpSpecial

	arm_func_start ItemIsActive__023026CC
ItemIsActive__023026CC: ; 0x023026CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__023026CC

	arm_func_start EnemyEvolution
EnemyEvolution: ; 0x023026FC
#ifdef JAPAN
#define ENEMY_EVOLUTION_OFFSET -4
#else
#define ENEMY_EVOLUTION_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x168
	mov sl, r0
	bl AllocateTemp1024ByteBufferFromPool
	ldr r0, _02302A28 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #0xf]
	ldrb r0, [r2, #0x748]
	cmp r1, #0
	str r0, [sp, #8]
	beq _02302A20
	mov r0, #0
	strb r0, [r2, #0xf]
	bl GetForcedLossReason
	cmp r0, #0
	bne _02302A20
	mov r0, sl
	bl EntityIsValid__02302A38
	cmp r0, #0
	bne _02302758
	add r0, sp, #0xb0
	bl ov29_022E2470
	add sl, sp, #0xb0
_02302758:
	ldr r0, _02302A2C ; =ov29_023527F8
	mov r4, #0
	ldr r3, [r0]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
_02302780:
	ldr r0, _02302A28 ; =DUNGEON_PTR
	ldr r3, [sp, #0x14]
	ldr r0, [r0]
	ldr r2, [sp, #0x18]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xad4]
#else
	ldr r5, [r0, #0xb78]
#endif
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r6, #0
	str r6, [sp, #4]
	str r3, [sp, #0x24]
	str r2, [sp, #0x28]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	cmp r5, #0
	beq _02302A14
	mov r0, r5
	bl EntityIsValid__02302A38
	cmp r0, #0
	ldrne sb, [r5, #0xb4]
	ldrnesh r0, [sb, #0x10]
	cmpne r0, #0
	beq _02302A14
	ldrb r0, [sb, #0x102]
	cmp r0, #0
	movne r0, r6
	strneb r0, [sb, #0x102]
	bne _02302A08
	ldr fp, [sb, #0x214 + ENEMY_EVOLUTION_OFFSET]
	cmp fp, #0
	beq _023028C4
	ldrb r0, [sb, #7]
	cmp r0, #0
	beq _02302818
	ldrb r1, [sb, #0xa]
	add r0, sp, #0x54
	bl GetUnlockedTacticFlags
_02302818:
	ldrsh r2, [sb, #0x12]
	ldrsh r0, [sb, #0x16]
	ldrb r7, [sb, #0x1a]
	ldr r1, _02302A30 ; =0x000003E7
	add r0, r2, r0
	ldrb r3, [sb, #0x1b]
	ldrb r2, [sb, #0x1c]
	str r0, [sp, #4]
	cmp r0, r1
	strgt r1, [sp, #4]
	ldrb r1, [sb, #0x1d]
	ldrb r0, [sb, #0xa]
	str r7, [sp, #0x24]
	str r3, [sp, #0x28]
	str r2, [sp, #0x1c]
	str r1, [sp, #0x20]
	cmp r0, #0x64
	beq _023028C4
	ldr r0, [sp, #8]
	bl IsExpEnabledInDungeon
	cmp r0, #0
	beq _023028C4
	ldr r0, [sb, #0x20]
	mov r1, fp
	add r2, r0, fp
	mov r0, #0
	str r2, [sb, #0x20]
	bl ov29_0234B09C
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	mov r2, sb
	mov r3, r1
	bl ov29_0230040C
	mov r0, sl
	ldr r1, _02302A34 ; =0x00000F1F
	bl LogMessageByIdWithPopup
	mov r0, sl
	mov r1, r5
	mov r2, #1
	mov r3, r2
	bl LevelUp
	orr r6, r6, r0
_023028C4:
	ldrb r0, [sb, #0x153 + ENEMY_EVOLUTION_OFFSET]
	cmp r0, #0
	beq _02302968
	ldrsh r0, [sb, #2]
	mov r2, #0
	add r1, sp, #0x2c
	mov r3, r2
	bl GetEvolutions
	movs r6, r0
	beq _02302964
	bl DungeonRandInt
	mov r8, r0
	mov r7, #0
	b _0230293C
_023028FC:
	mov r1, r8, lsl #1
	add r0, sp, #0x2c
	ldrsh r0, [r0, r1]
	bl IsOnMonsterSpawnList
	cmp r0, #0
	beq _0230292C
	mov r1, r8, lsl #1
	add r0, sp, #0x2c
	ldrsh r0, [r0, r1]
	bl DungeonGetSpriteIndex
	cmp r0, #0
	bne _02302944
_0230292C:
	add r8, r8, #1
	cmp r8, r6
	movge r8, #0
	add r7, r7, #1
_0230293C:
	cmp r7, r6
	blt _023028FC
_02302944:
	cmp r7, r6
	bge _02302964
	add r0, sp, #0x2c
	mov r1, r8, lsl #1
	ldrsh r2, [r0, r1]
	mov r0, sl
	mov r1, r5
	bl EvolveMonster
_02302964:
	mov r6, #0
_02302968:
	cmp r6, #0
	beq _023029EC
	ldrb r0, [sb, #6]
	cmp r0, #0
	bne _023029EC
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _02302A30 ; =0x000003E7
	ldr r3, [sp, #0x28]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldr r0, [sp, #4]
	sub r0, r1, r0
	str r0, [sp, #0x84]
	ldrb r2, [sb, #0x1a]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	sub r1, r2, r1
	str r1, [sp, #0x88]
	ldrb r1, [sb, #0x1c]
	ldr r2, [sp, #0x20]
	sub r0, r1, r0
	str r0, [sp, #0x8c]
	ldrb r6, [sb, #0x1b]
	add r1, sp, #0x60
	mov r0, r5
	sub r3, r6, r3
	str r3, [sp, #0x90]
	ldrb r3, [sb, #0x1d]
	sub r2, r3, r2
	str r2, [sp, #0x94]
	bl ov29_02302CC8
_023029EC:
	cmp fp, #0
	beq _02302A08
	add r2, sp, #0x54
	mov r0, sl
	mov r1, r5
	mov r3, #1
	bl ov29_02302C04
_02302A08:
	mov r0, #0
	str r0, [sb, #0x214 + ENEMY_EVOLUTION_OFFSET]
	strb r0, [sb, #0x153 + ENEMY_EVOLUTION_OFFSET]
_02302A14:
	add r4, r4, #1
	cmp r4, #0x14
	blt _02302780
_02302A20:
	add sp, sp, #0x168
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02302A28: .word DUNGEON_PTR
_02302A2C: .word ov29_023527F8
_02302A30: .word 0x000003E7
#ifdef JAPAN
_02302A34: .word 0x00002486
#else
_02302A34: .word 0x00000F1F
#endif
	arm_func_end EnemyEvolution
