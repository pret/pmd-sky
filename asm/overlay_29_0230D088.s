	.include "asm/macros.inc"
	.include "overlay_29_0230D088.inc"

	.text

	arm_func_start ov29_0230D088
ov29_0230D088: ; 0x0230D088
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x1c
	ldr r5, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov lr, r0
	strb r2, [r5, #0xc]
	cmp r4, #1
	strb r3, [r5, #0xd]
	mov ip, r1
	str r2, [sp]
	mov r2, ip
	ldr r0, _0230D118 ; =0x000003E7
	movlt r4, #1
	cmp r4, r0
	movgt r4, r0
	add r0, sp, #0x14
	mov r1, lr
	mov r3, r4
	str r5, [sp, #4]
	mov ip, #0
	str ip, [sp, #8]
	bl CalcTypeBasedDamageEffects
	add r0, sp, #0xc
	mov r1, r4
	bl IntToFixedPoint64
	add r0, sp, #0xc
	add r2, sp, #0x14
	mov r1, r0
	bl MultiplyFixedPoint64
	add r0, sp, #0xc
	bl FixedPoint64ToInt
	str r0, [r5]
	mov r0, #0
	str r0, [r5, #4]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230D118: .word 0x000003E7
	arm_func_end ov29_0230D088

	arm_func_start ApplyDamageAndEffectsWrapper
ApplyDamageAndEffectsWrapper: ; 0x0230D11C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xdc
	mov r7, r0
	add r0, sp, #0x10
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ResetDamageData
	add r0, sp, #0x24
	bl CreateTemporaryEntity
	mov r3, #0
	mov r0, #2
	str r0, [sp, #0x18]
	str r6, [sp, #0x10]
	str r5, [sp, #0x14]
	strb r3, [sp, #0x1c]
	strb r3, [sp, #0x1e]
	strb r3, [sp, #0x1f]
	strb r3, [sp, #0x20]
	stmia sp, {r3, r4}
	str r3, [sp, #8]
	mov r1, r7
	add r0, sp, #0x24
	add r2, sp, #0x10
	str r3, [sp, #0xc]
	bl ApplyDamageAndEffects
	add sp, sp, #0xdc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ApplyDamageAndEffectsWrapper

	arm_func_start CalcRecoilDamageFixed
CalcRecoilDamageFixed: ; 0x0230D18C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230D238
	ldr r0, [r7]
	cmp r0, #1
	bne _0230D1F0
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	beq _0230D238
	mov r0, r7
	mov r1, #0x5c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0230D1F0
	mov r0, r6, lsl #8
	mov r1, #0x180
	bl MultiplyByFixedPoint
	mov r6, r0, asr #8
_0230D1F0:
	ldrb r1, [sp, #0x34]
	str r4, [sp]
	ldrsh r0, [sp, #0x38]
	str r1, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	ldr r1, [sp, #0x3c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x10]
	ldr r4, [sp, #0x44]
	str r0, [sp, #0x14]
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r4, [sp, #0x18]
	bl CalcDamageFixed
_0230D238:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end CalcRecoilDamageFixed

	arm_func_start CalcDamageFixed
CalcDamageFixed: ; 0x0230D240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x2c
	mov sl, r0
	add r0, sp, #0x18
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x54]
	bl ResetDamageData
	mov r5, #0
	ldrb r0, [sp, #0x58]
	ldr r1, [sp, #0x60]
	mov r2, #2
	str r2, [sp, #0x20]
	str r1, [sp, #0x1c]
	strb r6, [sp, #0x24]
	strb r5, [sp, #0x26]
	strb r5, [sp, #0x27]
	strb r0, [sp, #0x25]
	cmp r6, #0
	beq _0230D2F8
	add r4, sp, #0x10
_0230D298:
	mov r2, r5, lsl #0x10
	mov r0, sl
	mov r1, sb
	mov r3, r6
	mov r2, r2, asr #0x10
	bl GetTypeMatchup
	str r0, [r4, r5, lsl #2]
	add r5, r5, #1
	cmp r5, #2
	blt _0230D298
	mov r0, sl
	mov r1, sb
	mov r2, #0x35
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__0230A940
	cmp r0, #0
	beq _0230D2F8
	ldr r2, [sp, #0x10]
	ldr r0, _0230D39C ; =TYPE_MATCHUP_COMBINATOR_TABLE
	ldr r1, [sp, #0x14]
	add r0, r0, r2, lsl #4
	ldr r0, [r0, r1, lsl #2]
	cmp r0, #3
	movne r8, #0
_0230D2F8:
	ldrsh r1, [sp, #0x5c]
	ldr r0, _0230D3A0 ; =0x00000256
	mov r8, r8, lsl #8
	cmp r1, r0
	bne _0230D334
	mov r0, sl
	mov r1, #0x2f
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0230D334
	ldr r1, _0230D3A4 ; =POWER_PITCHER_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	mov r8, r0
_0230D334:
	mov r0, r8
	bl RoundUpDiv256
	str r0, [sp, #0x18]
	cmp r8, #0
	moveq r0, #1
	streqb r0, [sp, #0x28]
	movne r0, #0
	strneb r0, [sp, #0x28]
	ldrsh r1, [sp, #0x5c]
	str r7, [sp]
	ldr r0, [sp, #0x64]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r4, [sp, #0x68]
	add r2, sp, #0x18
	mov r0, sl
	mov r1, sb
	mov r3, #0
	str r4, [sp, #0xc]
	bl ApplyDamageAndEffects
	ldr r1, [sp, #0x50]
	cmp r1, #0
	ldrneb r0, [sp, #0x28]
	strneb r0, [r1]
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0230D39C: .word TYPE_MATCHUP_COMBINATOR_TABLE
_0230D3A0: .word 0x00000256
_0230D3A4: .word POWER_PITCHER_DAMAGE_MULTIPLIER
	arm_func_end CalcDamageFixed

	arm_func_start CalcDamageFixedNoCategory
CalcDamageFixedNoCategory: ; 0x0230D3A8
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	ldr lr, [sp, #0x20]
	ldrb ip, [sp, #0x24]
	str lr, [sp]
	ldrsh lr, [sp, #0x28]
	str ip, [sp, #4]
	mov ip, #3
	str ip, [sp, #8]
	ldr ip, [sp, #0x2c]
	str lr, [sp, #0xc]
	ldr lr, [sp, #0x30]
	str ip, [sp, #0x10]
	ldr ip, [sp, #0x34]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	bl CalcDamageFixed
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	arm_func_end CalcDamageFixedNoCategory

	arm_func_start CalcDamageFixedWrapper
CalcDamageFixedWrapper: ; 0x0230D3F4
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	ldr ip, [sp, #0x20]
	ldrb lr, [sp, #0x24]
	str ip, [sp]
	ldrb ip, [sp, #0x28]
	str lr, [sp, #4]
	ldrsh lr, [sp, #0x2c]
	str ip, [sp, #8]
	ldr ip, [sp, #0x30]
	str lr, [sp, #0xc]
	ldr lr, [sp, #0x34]
	str ip, [sp, #0x10]
	ldr ip, [sp, #0x38]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	bl CalcDamageFixed
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	arm_func_end CalcDamageFixedWrapper

	arm_func_start UpdateShopkeeperModeAfterAttack
UpdateShopkeeperModeAfterAttack: ; 0x0230D440
	ldr r2, [r1, #0xb4]
	ldrb r1, [r2, #9]
	cmp r1, #0
	bxeq lr
	ldr r1, [r0]
	cmp r1, #1
	bxne lr
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #2
	strneb r0, [r2, #9]
	moveq r0, #3
	streqb r0, [r2, #9]
	bx lr
	arm_func_end UpdateShopkeeperModeAfterAttack

	arm_func_start UpdateShopkeeperModeAfterTrap
UpdateShopkeeperModeAfterTrap: ; 0x0230D47C
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #9]
	cmp r0, #0
	bxeq lr
	cmp r1, #0
	movne r0, #2
	strneb r0, [r2, #9]
	moveq r0, #3
	streqb r0, [r2, #9]
	bx lr
	arm_func_end UpdateShopkeeperModeAfterTrap

	arm_func_start ov29_0230D4A4
ov29_0230D4A4: ; 0x0230D4A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r1, #0xe
	mov r5, r2
	ldr r4, [r6, #0xb4]
	bl MonsterIsType
	cmp r0, #0
	beq _0230D4E8
	cmp r5, #1
	cmpne r5, #7
	bne _0230D4E8
	ldrb r0, [r4, #0xfe]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0230D4E8:
	mov r4, #0
	b _0230D518
_0230D4F0:
	mov r2, r4, lsl #0x10
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, r2, asr #0x10
	bl GetTypeMatchup
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r4, r4, #1
_0230D518:
	cmp r4, #2
	blt _0230D4F0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0230D4A4

	arm_func_start ResetDamageCalcDiagnostics
ResetDamageCalcDiagnostics: ; 0x0230D528
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0230D614 ; =DUNGEON_PTR
	mov r1, #0x54
	ldr r4, [r0]
	add r5, r4, #0x184
	mov r0, r5
	bl MemZero
	mov r1, #0
	strb r1, [r4, #0x184]
	str r1, [r5, #4]
	strb r1, [r5, #8]
	strb r1, [r5, #9]
	mov r0, #0xa
	strb r0, [r5, #0xa]
	strb r0, [r5, #0xb]
	mov r0, #1
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x12]
	strh r1, [r5, #0x16]
	strh r1, [r5, #0x1c]
	str r1, [r5, #0x20]
	str r1, [r5, #0x28]
	str r1, [r5, #0x2c]
	strb r1, [r5, #0x30]
	strb r1, [r5, #0x31]
	strb r1, [r5, #0x36]
	strb r1, [r5, #0x37]
	strb r1, [r5, #0x34]
	strb r1, [r5, #0x35]
	strb r1, [r5, #0x38]
	strb r1, [r5, #0x39]
	strb r1, [r5, #0x3a]
	strb r1, [r5, #0x3b]
	strb r1, [r5, #0x3c]
	strb r1, [r5, #0x3d]
	strb r1, [r5, #0x3e]
	strb r1, [r5, #0x40]
	strb r1, [r5, #0x3f]
	strb r1, [r5, #0x41]
	strb r1, [r5, #0x42]
	strb r1, [r5, #0x43]
	strb r1, [r5, #0x44]
	strb r1, [r5, #0x45]
	strb r1, [r5, #0x46]
	strb r1, [r5, #0x47]
	strb r1, [r5, #0x48]
	strb r1, [r5, #0x4b]
	strb r1, [r5, #0x4c]
	strb r1, [r5, #0x4d]
	strb r1, [r5, #0x4e]
	strb r1, [r5, #0x4f]
	strb r1, [r5, #0x50]
	strb r1, [r5, #0x51]
	strb r1, [r5, #0x32]
	strb r1, [r5, #0x33]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D614: .word DUNGEON_PTR
	arm_func_end ResetDamageCalcDiagnostics

	arm_func_start ov29_0230D618
ov29_0230D618: ; 0x0230D618
	ldr r1, _0230D624 ; =ov29_02352894
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0230D624: .word ov29_02352894
	arm_func_end ov29_0230D618

	arm_func_start ov29_0230D628
ov29_0230D628: ; 0x0230D628
	stmdb sp!, {r3, lr}
	ldr r1, _0230D650 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x1a000
#ifdef JAPAN
	ldr r1, [r1, #0x188]
#else
	ldr r1, [r1, #0x22c]
#endif
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	bl PointCameraToMonster
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D650: .word DUNGEON_PTR
	arm_func_end ov29_0230D628

	arm_func_start IsEitherMonsterInvalid
IsEitherMonsterInvalid: ; 0x0230D654
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl EntityIsValid__02308FBC
	cmp r0, #0
	beq _0230D678
	mov r0, r4
	bl EntityIsValid__02308FBC
	cmp r0, #0
	bne _0230D680
_0230D678:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0230D680:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsEitherMonsterInvalid

	arm_func_start ov29_0230D688
ov29_0230D688: ; 0x0230D688
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldrh r3, [r4]
	mov r1, #0x55
	mov r2, #2
	strh r3, [sp]
	ldrh r3, [r4, #2]
	strh r3, [sp, #2]
	ldrh r3, [r4, #4]
	strh r3, [sp, #4]
	bl GenerateStandardItem
	mov r0, r4
	bl SetItemAcquired
	ldrb r0, [sp, #1]
	strb r0, [r4, #1]
	cmp r0, #0
	beq _0230D6FC
	add r0, sp, #0
	bl GetEquivItemIndex
	cmp r0, #0
	blt _0230D6FC
	bl GetItemAtIdx
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
_0230D6FC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230D688

	arm_func_start ov29_0230D704
ov29_0230D704: ; 0x0230D704
	mov r0, #0
	bx lr
	arm_func_end ov29_0230D704

	arm_func_start ov29_0230D70C
ov29_0230D70C: ; 0x0230D70C
	stmdb sp!, {r3, lr}
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0230D734 ; =ov10_022C45B4
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D734: .word ov10_022C45B4
	arm_func_end ov29_0230D70C

	arm_func_start ov29_0230D738
ov29_0230D738: ; 0x0230D738
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _0230D760
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0230D768 ; =ov10_022C45B4
	ldrsh r1, [r1]
	cmp r0, r1
	movlt r0, #1
	ldmltia sp!, {r3, pc}
_0230D760:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D768: .word ov10_022C45B4
	arm_func_end ov29_0230D738

	arm_func_start ov29_0230D76C
ov29_0230D76C: ; 0x0230D76C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsMonster__0230A994
	cmp r0, #0
	beq _0230D798
	mov r0, r5
	bl IsMonster__0230A994
	cmp r0, #0
	bne _0230D7A0
_0230D798:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0230D7A0:
	ldr r0, [r6, #0xb4]
	ldr r1, [r5, #0xb4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r1, #2]
	bl GendersNotEqualNotGenderless
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov29_0230D738
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0230D76C

	arm_func_start ov29_0230D7D4
ov29_0230D7D4: ; 0x0230D7D4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	ldr r2, _0230D870 ; =ov29_023535D4
	mvn r1, #0
	ldrsh r3, [r2]
	mov r4, r0
	cmp r3, r1
	beq _0230D808
	ldrsh r0, [r2]
	bl TerminateEffectWrapper
	ldr r0, _0230D870 ; =ov29_023535D4
	mvn r1, #0
	strh r1, [r0]
_0230D808:
	mov r2, #0
	mov r1, #1
	str r2, [sp]
	stmib sp, {r1, r2}
	mov r0, r4
	rsb r1, r1, #0x2b8
	mov r3, #3
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mvn r0, #0
	cmp r5, r0
	beq _0230D868
	mov r4, #0x18
	b _0230D850
_0230D848:
	mov r0, r4
	bl AdvanceFrame
_0230D850:
	mov r0, r5
	bl ov10_022BF964
	cmp r0, #0
	bne _0230D848
	mov r0, r5
	bl TerminateEffectWrapper
_0230D868:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230D870: .word ov29_023535D4
	arm_func_end ov29_0230D7D4

	arm_func_start SwapDefensiveStages
SwapDefensiveStages: ; 0x0230D874
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x28]
	ldrsh r1, [lr, #0x2a]
	ldrsh r0, [ip, #0x28]
	cmp r2, #0
	strh r0, [lr, #0x28]
	ldrsh r0, [ip, #0x2a]
	strh r0, [lr, #0x2a]
	strh r3, [ip, #0x28]
	strh r1, [ip, #0x2a]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D8E4 ; =0x00000F2D
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230D8E4: .word 0x00002494
#else
_0230D8E4: .word 0x00000F2D
#endif
	arm_func_end SwapDefensiveStages

	arm_func_start SwapDefensiveMultipliers
SwapDefensiveMultipliers: ; 0x0230D8E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldr r3, [lr, #0x3c]
	ldr r1, [lr, #0x40]
	ldr r0, [ip, #0x3c]
	cmp r2, #0
	str r0, [lr, #0x3c]
	ldr r0, [ip, #0x40]
	str r0, [lr, #0x40]
	str r3, [ip, #0x3c]
	str r1, [ip, #0x40]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D958 ; =0x00000F2E
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230D958: .word 0x00002495
#else
_0230D958: .word 0x00000F2E
#endif
	arm_func_end SwapDefensiveMultipliers

	arm_func_start SwapOffensiveStages
SwapOffensiveStages: ; 0x0230D95C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x24]
	ldrsh r1, [lr, #0x26]
	ldrsh r0, [ip, #0x24]
	cmp r2, #0
	strh r0, [lr, #0x24]
	ldrsh r0, [ip, #0x26]
	strh r0, [lr, #0x26]
	strh r3, [ip, #0x24]
	strh r1, [ip, #0x26]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230D9CC ; =0x00000F2B
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230D9CC: .word 0x00002492
#else
_0230D9CC: .word 0x00000F2B
#endif
	arm_func_end SwapOffensiveStages

	arm_func_start SwapOffensiveMultipliers
SwapOffensiveMultipliers: ; 0x0230D9D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldr r3, [lr, #0x34]
	ldr r1, [lr, #0x38]
	ldr r0, [ip, #0x34]
	cmp r2, #0
	str r0, [lr, #0x34]
	ldr r0, [ip, #0x38]
	str r0, [lr, #0x38]
	str r3, [ip, #0x34]
	str r1, [ip, #0x38]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230DA40 ; =0x00000F2C
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230DA40: .word 0x00002493
#else
_0230DA40: .word 0x00000F2C
#endif
	arm_func_end SwapOffensiveMultipliers

	arm_func_start SwapHitChanceStages
SwapHitChanceStages: ; 0x0230DA44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr lr, [r5, #0xb4]
	ldr ip, [r4, #0xb4]
	ldrsh r3, [lr, #0x2c]
	ldrsh r1, [lr, #0x2e]
	ldrsh r0, [ip, #0x2c]
	cmp r2, #0
	strh r0, [lr, #0x2c]
	ldrsh r0, [ip, #0x2e]
	strh r0, [lr, #0x2e]
	strh r3, [ip, #0x2c]
	strh r1, [ip, #0x2e]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0230DAB4 ; =0x00000F2F
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0230DAB4: .word 0x00002496
#else
_0230DAB4: .word 0x00000F2F
#endif
	arm_func_end SwapHitChanceStages

	arm_func_start SwapUserAtkAndDefModifiers
SwapUserAtkAndDefModifiers: ; 0x0230DAB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr ip, [r5, #0xb4]
	mov r4, r1
	ldrsh r1, [ip, #0x24]
	ldr r3, [ip, #0x34]
	ldr r0, [ip, #0x3c]
	cmp r2, #0
	str r0, [ip, #0x34]
	ldrsh r0, [ip, #0x28]
	strh r0, [ip, #0x24]
	str r3, [ip, #0x3c]
	strh r1, [ip, #0x28]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldr r2, _0230F050 ; =0x00002497
	mov r0, r5
	mov r1, r4
#else
	mov r0, r5
	mov r1, r4
	mov r2, #0xf30
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
#ifdef JAPAN
_0230F050: .word 0x00002497
#endif
	arm_func_end SwapUserAtkAndDefModifiers
