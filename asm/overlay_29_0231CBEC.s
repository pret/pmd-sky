	.include "asm/macros.inc"
	.include "overlay_29_0231CBEC.inc"

	.text

	arm_func_start ApplyCheriBerryEffect
ApplyCheriBerryEffect: ; 0x0231CBEC
	stmdb sp!, {r3, lr}
	ldr r2, [r1, #0xb4]
	ldrb r2, [r2, #0xbf]
	cmp r2, #4
	bne _0231CC08
	bl EndBurnClassStatus
	ldmia sp!, {r3, pc}
_0231CC08:
	ldr r2, _0231CC14 ; =0x00000BE9
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231CC14: .word 0x00000BE9
	arm_func_end ApplyCheriBerryEffect

	arm_func_start ApplyPechaBerryEffect
ApplyPechaBerryEffect: ; 0x0231CC18
	stmdb sp!, {r3, lr}
	ldr r2, [r1, #0xb4]
	ldrb r2, [r2, #0xbf]
	add r2, r2, #0xfe
	and r2, r2, #0xff
	cmp r2, #1
	bhi _0231CC3C
	bl EndBurnClassStatus
	ldmia sp!, {r3, pc}
_0231CC3C:
	ldr r2, _0231CC48 ; =0x00000BE9
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231CC48: .word 0x00000BE9
	arm_func_end ApplyPechaBerryEffect

	arm_func_start ApplyRawstBerryEffect
ApplyRawstBerryEffect: ; 0x0231CC4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r2, [r4, #0xb4]
	mov r5, r0
	ldrb r2, [r2, #0xbf]
	cmp r2, #1
	bne _0231CC70
	bl EndBurnClassStatus
	ldmia sp!, {r3, r4, r5, pc}
_0231CC70:
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231CC90 ; =0x00000BEA
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231CC90: .word 0x00000BEA
	arm_func_end ApplyRawstBerryEffect

	arm_func_start ApplyHungerSeedEffect
ApplyHungerSeedEffect: ; 0x0231CC94
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	ldr r4, [r5, #0xb4]
	mov r6, r0
	ldrb r2, [r4, #7]
	cmp r2, #0
	beq _0231CCC4
	mov r2, #0
	mov r3, #5
	bl TryDecreaseBelly
	b _0231CD6C
_0231CCC4:
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r5
	mov r1, #0x12
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231CCF8
	ldr r2, _0231CD74 ; =0x00000BEB
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CD6C
_0231CCF8:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	beq _0231CD5C
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r0, [sp]
	add r3, r4, #0x100
	ldrh r4, [sp, #2]
	strh r0, [r3, #0x46]
	ldr r2, _0231CD78 ; =0x00000BEC
	mov r0, r6
	mov r1, r5
	strh r4, [r3, #0x48]
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CD6C
_0231CD5C:
	ldr r2, _0231CD7C ; =0x00000BED
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0231CD6C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0231CD74: .word 0x00000BEB
_0231CD78: .word 0x00000BEC
_0231CD7C: .word 0x00000BED
	arm_func_end ApplyHungerSeedEffect

	arm_func_start ApplyVileSeedEffect
ApplyVileSeedEffect: ; 0x0231CD80
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r4, r1
	ldr r1, _0231CE10 ; =ov29_023529AC
	ldr ip, [r4, #0xb4]
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	ldrsh r1, [ip, #0x28]
	mov r5, r0
	ldrsh r0, [ip, #0x2a]
	mov ip, #1
	strh r3, [sp, #8]
	cmp r1, #0
	strgth r1, [sp, #8]
	str ip, [sp]
	strh r2, [sp, #0xa]
	cmp r0, #0
	strgth r0, [sp, #0xa]
	ldr r0, _0231CE14 ; =ov29_02352AEC
	ldrsh r3, [sp, #8]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	str ip, [sp, #4]
	bl LowerDefensiveStat
	ldr r0, _0231CE18 ; =ov29_02352AE8
	mov ip, #1
	ldr r2, [r0]
	str ip, [sp]
	ldrsh r3, [sp, #0xa]
	mov r0, r5
	mov r1, r4
	str ip, [sp, #4]
	bl LowerDefensiveStat
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0231CE10: .word ov29_023529AC
_0231CE14: .word ov29_02352AEC
_0231CE18: .word ov29_02352AE8
	arm_func_end ApplyVileSeedEffect

	arm_func_start ApplyViolentSeedEffect
ApplyViolentSeedEffect: ; 0x0231CE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xb4]
	ldr r2, _0231CE60 ; =ov29_02352AEC
	ldrsh r3, [r4, #0x24]
	ldr r2, [r2]
	mov r6, r0
	rsb r3, r3, #0x14
	bl BoostOffensiveStat
	ldrsh r3, [r4, #0x26]
	ldr r1, _0231CE64 ; =ov29_02352AE8
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	rsb r3, r3, #0x14
	bl BoostOffensiveStat
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0231CE60: .word ov29_02352AEC
_0231CE64: .word ov29_02352AE8
	arm_func_end ApplyViolentSeedEffect

	arm_func_start ApplyGinsengEffect
ApplyGinsengEffect: ; 0x0231CE68
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r0, #0x64
	ldr r6, [r8, #0xb4]
	mov r4, #0
	mov r5, #1
	bl DungeonRandInt
	ldr r1, _0231CF78 ; =ov10_022C46C0
	mov ip, #0
	ldrsh r1, [r1]
	add r3, r6, #0x124
	cmp r0, r1
	movlt r5, #3
	mov r0, ip
	mov r1, #1
	b _0231CF10
_0231CEAC:
	ldrb r2, [r3, ip, lsl #3]
	add r7, r3, ip, lsl #3
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	beq _0231CF0C
	mov r0, r7
	bl GetMoveBasePower
	cmp r0, #0
	beq _0231CF18
	mov r0, r7
	ldrb r6, [r7, #7]
	bl GetMoveMaxGinsengBoost
	ldrb r1, [r7, #7]
	add r2, r1, r5
	and r1, r2, #0xff
	strb r2, [r7, #7]
	cmp r1, r0
	strgeb r0, [r7, #7]
	ldrb r0, [r7, #7]
	cmp r6, r0
	movne r4, #1
	b _0231CF18
_0231CF0C:
	add ip, ip, #1
_0231CF10:
	cmp ip, #4
	blt _0231CEAC
_0231CF18:
	cmp r4, #0
	beq _0231CF64
	ldrh r1, [r7, #4]
	mov r0, #0
	bl ov29_0234B084
	mov r0, sb
	mov r1, r8
	mov r2, #0xbf0
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp r5, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0xa
	mov r1, #0x40
	bl ov29_022EA370
	ldr r2, _0231CF7C ; =0x00000BEF
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231CF64:
	ldr r2, _0231CF80 ; =0x00000BEE
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231CF78: .word ov10_022C46C0
_0231CF7C: .word 0x00000BEF
_0231CF80: .word 0x00000BEE
	arm_func_end ApplyGinsengEffect

	arm_func_start ApplyBlastSeedEffect
ApplyBlastSeedEffect: ; 0x0231CF84
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _0231D00C
	ldr r7, [r5, #0xb4]
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	ldrne r0, _0231D0A8 ; =ov10_022C45D8
	ldreq r0, _0231D0AC ; =ov10_022C45D4
	ldrsh r4, [r0]
	ldrb r0, [r7, #0xc4]
	cmp r0, #1
	bne _0231CFD0
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl EndFrozenClassStatus
_0231CFD0:
	add r0, sp, #0x18
	str r0, [sp]
	mov ip, #0
	ldr r0, _0231D0B0 ; =0x00000255
	str ip, [sp, #4]
	str r0, [sp, #8]
	str ip, [sp, #0xc]
	str ip, [sp, #0x10]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #1
	str ip, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231D0A0
_0231D00C:
	bl ov29_022E5BD8
	mov r0, r6
	bl ov29_022F8830
	movs r4, r0
	bne _0231D034
	ldr r2, _0231D0B4 ; =0x00000BF2
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231D0A0
_0231D034:
	ldr r7, [r4, #0xb4]
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	ldrne r0, _0231D0B8 ; =ov10_022C45DC
	ldreq r0, _0231D0BC ; =ov10_022C44E8
	ldrsh r5, [r0]
	ldrb r0, [r7, #0xc4]
	cmp r0, #1
	bne _0231D068
	mov r0, r6
	mov r1, r4
	mov r2, #1
	bl EndFrozenClassStatus
_0231D068:
	add r0, sp, #0x18
	str r0, [sp]
	mov ip, #0
	ldr r0, _0231D0B0 ; =0x00000255
	str ip, [sp, #4]
	str r0, [sp, #8]
	str ip, [sp, #0xc]
	str ip, [sp, #0x10]
	mov r0, r6
	mov r1, r4
	mov r2, r5
	mov r3, #1
	str ip, [sp, #0x14]
	bl CalcDamageFixedNoCategory
_0231D0A0:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0231D0A8: .word ov10_022C45D8
_0231D0AC: .word ov10_022C45D4
_0231D0B0: .word 0x00000255
_0231D0B4: .word 0x00000BF2
_0231D0B8: .word ov10_022C45DC
_0231D0BC: .word ov10_022C44E8
	arm_func_end ApplyBlastSeedEffect

	arm_func_start ApplyGummiBoostsDungeonMode
ApplyGummiBoostsDungeonMode: ; 0x0231D0C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, #0
	mov sb, r1
	mov sl, r0
	mov r8, r3
	mov r3, r4
	mov r5, r4
	cmp r2, #0xff
	ldr r7, [sb, #0xb4]
	bne _0231D108
	ldr r1, _0231D468 ; =WONDER_GUMMI_IQ_GAIN
	ldr r0, _0231D46C ; =_020A1894
	ldrsh r1, [r1]
	ldrsh r0, [r0]
	add fp, r4, r1
	add r3, r4, r0
	b _0231D164
_0231D108:
	ldrb r1, [r7, #0x5e]
	ldrb r6, [r7, #0x5f]
	mov r0, #0x24
	smulbb r1, r1, r0
	ldr fp, _0231D470 ; =IQ_GUMMI_GAIN_TABLE
	smulbb r6, r6, r0
	add ip, fp, r1
	mov r0, r2, lsl #1
	add fp, fp, r6
	ldrsh ip, [r0, ip]
	ldrsh r0, [r0, fp]
	cmp ip, r0
	addgt fp, r4, ip
	addle fp, r4, r0
	ldr ip, _0231D474 ; =_020A2538
	mov r0, r2, lsl #1
	add r2, ip, r1
	add r1, ip, r6
	ldrsh r2, [r0, r2]
	ldrsh r0, [r0, r1]
	cmp r2, r0
	addgt r3, r3, r2
	addle r3, r3, r0
_0231D164:
	mov r6, #1
	mov r0, sl
	mov r1, sb
	mov r2, r3
	str r6, [sp]
	mov r3, #0
	bl TryIncreaseBelly
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _0231D284
	mov r0, r7
	bl IsExperienceLocked
	cmp r0, #0
	bne _0231D284
	ldrsh r6, [r7, #0xe]
	add r2, r6, fp
	strh r2, [r7, #0xe]
	ldrsh r0, [r7, #0xe]
	cmp r0, #1
	movlt r0, #1
	strlth r0, [r7, #0xe]
	ldrsh r1, [r7, #0xe]
	ldr r0, _0231D478 ; =0x000003E7
	cmp r1, r0
	strgth r0, [r7, #0xe]
	ldrsh r1, [r7, #0xe]
	cmp r6, r1
	bne _0231D1EC
	ldr r2, _0231D47C ; =0x00000BF3
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r4, #1
	b _0231D284
_0231D1EC:
	sub r0, r2, r6
	cmp r0, #9
	movge r5, #0
	bge _0231D214
	cmp r0, #5
	movge r5, #1
	bge _0231D214
	cmp r0, #3
	movge r5, #2
	movlt r5, #3
_0231D214:
	sub r0, r1, r6
	cmp r0, #9
	movge fp, #0
	bge _0231D23C
	cmp r0, #5
	movge fp, #1
	bge _0231D23C
	cmp r0, #3
	movge fp, #2
	movlt fp, #3
_0231D23C:
	ldr r0, _0231D480 ; =ov29_023532D0
	mov r1, r5, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, _0231D484 ; =ov29_02353324
	mov r1, fp, lsl #1
	ldrh r2, [r0, r1]
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	mov r2, #0
	bl ov29_022FA02C
	mov r0, sb
	bl ov29_023021F0
_0231D284:
	cmp r5, #3
	beq _0231D460
	ldr r0, _0231D488 ; =ov10_022C44CC
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0231D460
	ldr r5, [sb, #0xb4]
	ldr r0, _0231D48C ; =ov10_022C45E4
	ldrb r1, [r5, #0x1a]
	ldrsh r0, [r0]
	str r1, [sp, #4]
	ldrb fp, [r5, #0x1b]
	ldrb r6, [r5, #0x1c]
	ldrb r7, [r5, #0x1d]
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r4, #0
	cmpeq r0, #0xa
	moveq r0, #0xf
	beq _0231D2F4
	mov r0, #4
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	ldr r1, _0231D490 ; =ov29_023529B0
	mov r0, r0, lsr #0xf
	ldrh r0, [r1, r0]
_0231D2F4:
	tst r0, #1
	beq _0231D328
	ldrb r1, [r5, #0x1a]
	cmp r1, #0xff
	bge _0231D320
	add r1, r1, r8
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	cmp r1, #0xff
	movgt r1, #0xff
	b _0231D324
_0231D320:
	bic r0, r0, #1
_0231D324:
	strb r1, [r5, #0x1a]
_0231D328:
	tst r0, #2
	beq _0231D35C
	ldrb r1, [r5, #0x1b]
	cmp r1, #0xff
	bge _0231D354
	add r1, r1, r8
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	cmp r1, #0xff
	movgt r1, #0xff
	b _0231D358
_0231D354:
	bic r0, r0, #2
_0231D358:
	strb r1, [r5, #0x1b]
_0231D35C:
	tst r0, #4
	beq _0231D390
	ldrb r1, [r5, #0x1c]
	cmp r1, #0xff
	bge _0231D388
	add r1, r1, r8
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	cmp r1, #0xff
	movgt r1, #0xff
	b _0231D38C
_0231D388:
	bic r0, r0, #4
_0231D38C:
	strb r1, [r5, #0x1c]
_0231D390:
	tst r0, #8
	beq _0231D3BC
	ldrb r0, [r5, #0x1d]
	cmp r0, #0xff
	bge _0231D3B8
	add r0, r0, r8
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xff
	movgt r0, #0xff
_0231D3B8:
	strb r0, [r5, #0x1d]
_0231D3BC:
	ldrb r1, [r5, #0x1a]
	ldr r0, [sp, #4]
	cmp r1, r0
	ble _0231D3E8
	sub r1, r1, r0
	mov r0, #0
	bl ov29_0234B09C
	ldr r2, _0231D494 ; =0x00000BF7
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231D3E8:
	ldrb r0, [r5, #0x1b]
	cmp r0, fp
	ble _0231D410
	sub r1, r0, fp
	mov r0, #0
	bl ov29_0234B09C
	ldr r2, _0231D498 ; =0x00000BF8
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231D410:
	ldrb r0, [r5, #0x1c]
	cmp r0, r6
	ble _0231D438
	sub r1, r0, r6
	mov r0, #0
	bl ov29_0234B09C
	ldr r2, _0231D49C ; =0x00000BF9
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231D438:
	ldrb r0, [r5, #0x1d]
	cmp r0, r7
	ble _0231D460
	sub r1, r0, r7
	mov r0, #0
	bl ov29_0234B09C
	ldr r2, _0231D4A0 ; =0x00000BFA
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231D460:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231D468: .word WONDER_GUMMI_IQ_GAIN
_0231D46C: .word _020A1894
_0231D470: .word IQ_GUMMI_GAIN_TABLE
_0231D474: .word _020A2538
_0231D478: .word 0x000003E7
_0231D47C: .word 0x00000BF3
_0231D480: .word ov29_023532D0
_0231D484: .word ov29_02353324
_0231D488: .word ov10_022C44CC
_0231D48C: .word ov10_022C45E4
_0231D490: .word ov29_023529B0
_0231D494: .word 0x00000BF7
_0231D498: .word 0x00000BF8
_0231D49C: .word 0x00000BF9
_0231D4A0: .word 0x00000BFA
	arm_func_end ApplyGummiBoostsDungeonMode

	arm_func_start CanMonsterUseItem
CanMonsterUseItem: ; 0x0231D4A4
	stmdb sp!, {r4, lr}
	ldrb r2, [r1]
	mov r4, r0
	ldr r0, [r4, #0xb4]
	tst r2, #8
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	beq _0231D4E4
	mov r0, #0
	bl ov29_02344B44
	ldr r1, _0231D52C ; =0x00000BE7
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	ldmia sp!, {r4, pc}
_0231D4E4:
	ldrb r0, [r0, #0xf3]
	cmp r0, #1
	bne _0231D524
	ldrsh r0, [r1, #4]
	bl IsEdible
	cmp r0, #0
	beq _0231D524
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231D530 ; =0x00000BF6
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	ldmia sp!, {r4, pc}
_0231D524:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231D52C: .word 0x00000BE7
_0231D530: .word 0x00000BF6
	arm_func_end CanMonsterUseItem

	arm_func_start ApplyGrimyFoodEffect
ApplyGrimyFoodEffect: ; 0x0231D534
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov ip, #1
	mov r4, r1
	mov r2, #0x1e
	mov r3, #0
	mov r5, r0
	str ip, [sp]
	bl TryIncreaseBelly
	mov r0, r4
	mov r1, #0x25
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _0231D580
	mov r0, r4
	mov r1, #0x59
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0231D598
_0231D580:
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0231D674 ; =ov10_022C4680
	ldrsh r1, [r1]
	cmp r0, r1
	blt _0231D66C
_0231D598:
	mov r0, #5
	bl DungeonRandInt
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0231D66C
_0231D5AC: ; jump table
	b _0231D5C0 ; case 0
	b _0231D5D8 ; case 1
	b _0231D5EC ; case 2
	b _0231D60C ; case 3
	b _0231D624 ; case 4
_0231D5C0:
	mov r0, r5
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
	b _0231D66C
_0231D5D8:
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl TryInflictShadowHoldStatus
	b _0231D66C
_0231D5EC:
	mov r2, #1
	mov ip, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	str ip, [sp]
	bl TryInflictBurnStatus
	b _0231D66C
_0231D60C:
	mov r0, r5
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
	b _0231D66C
_0231D624:
	ldr r0, _0231D678 ; =ov29_02352AEC
	mov ip, #1
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r5
	mov r1, r4
	mov r3, #3
	str ip, [sp, #4]
	bl LowerOffensiveStat
	ldr r0, _0231D67C ; =ov29_02352AE8
	mov ip, #1
	str ip, [sp]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	mov r3, #3
	str ip, [sp, #4]
	bl LowerOffensiveStat
_0231D66C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231D674: .word ov10_022C4680
_0231D678: .word ov29_02352AEC
_0231D67C: .word ov29_02352AE8
	arm_func_end ApplyGrimyFoodEffect

	arm_func_start ApplyMixElixirEffect
ApplyMixElixirEffect: ; 0x0231D680
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r2, [r5, #0xb4]
	mov r6, r0
	ldrsh r4, [r2, #2]
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r4, #0x124
	cmpne r4, #0x37c
	bne _0231D6C4
	ldr r2, _0231D6D8 ; =0x000003E7
	mov r0, r6
	mov r1, r5
	mov r3, #0
	bl RestoreAllMovePP
	ldmia sp!, {r4, r5, r6, pc}
_0231D6C4:
	ldr r2, _0231D6DC ; =0x00000C64
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0231D6D8: .word 0x000003E7
_0231D6DC: .word 0x00000C64
	arm_func_end ApplyMixElixirEffect

	arm_func_start ApplyDoughSeedEffect
ApplyDoughSeedEffect: ; 0x0231D6E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0
	mov r4, r1
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0231D730
	bl ov29_02338530
	cmp r0, #0
	bne _0231D730
	mov r0, #1
	bl SetDoughSeedFlag
	ldr r2, _0231D744 ; =0x00000C6E
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
_0231D730:
	ldr r2, _0231D748 ; =0x00000C6F
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231D744: .word 0x00000C6E
_0231D748: .word 0x00000C6F
	arm_func_end ApplyDoughSeedEffect

	arm_func_start ApplyViaSeedEffect
ApplyViaSeedEffect: ; 0x0231D74C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0
	mov r4, r1
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r4
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0231D788
	ldr r1, _0231D7B8 ; =0x00000C68
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0231D7A0
_0231D788:
	ldr r2, _0231D7BC ; =0x00000C69
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0xa
	bl ov29_0234BA54
_0231D7A0:
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryWarp
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231D7B8: .word 0x00000C68
_0231D7BC: .word 0x00000C69
	arm_func_end ApplyViaSeedEffect

	arm_func_start ApplyGravelyrockEffect
ApplyGravelyrockEffect: ; 0x0231D7C0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r6, r0
	ldrsh r0, [r1, #2]
	bl FemaleToMaleForm
	mov r1, #1
	mov r4, r0
	str r1, [sp]
	ldr r0, _0231D830 ; =ov10_022C47E0
	mov r1, r5
	ldrsh r2, [r0]
	ldrsh r3, [r0, #2]
	mov r0, r6
	bl TryIncreaseBelly
	cmp r4, #0x1e0
	cmpne r4, #0xb9
	bne _0231D828
	ldr r1, _0231D834 ; =ov10_022C47F0
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl BoostIQ
_0231D828:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0231D830: .word ov10_022C47E0
_0231D834: .word ov10_022C47F0
	arm_func_end ApplyGravelyrockEffect

	arm_func_start ApplyGonePebbleEffect
ApplyGonePebbleEffect: ; 0x0231D838
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0231D978
	mov r0, #1
	bl ov29_022EFB20
	bl ov29_022EAF20
	mov r4, r0
	mov r0, #3
	bl ov29_022EAF34
	ldr r1, _0231D9B0 ; =0x000003FF
	mov r0, #4
	add r2, sp, #4
	mov r3, #0
	bl AllocAndLoadFileInPack
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	mov r0, r5
	bl ov29_022F04F0
	ldrb r0, [r5, #0xaa]
	mov r1, #1
	bl ov29_022DE47C
	mov r0, #0
	bl ov29_022DD828
	ldr r0, [sp]
	mov r1, #6
	bl ov29_022F085C
	ldr r0, _0231D9B4 ; =0x00000C65
	bl ov29_022F0780
	bl ov29_022F05E4
	mov r0, #0
	bl ov29_022EFB84
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231D9B8 ; =0x00000C66
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, r6
	mov r1, r5
	bl TryInflictEndureStatus
	ldr r0, _0231D9BC ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd6]
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
	mov r0, r4
	bl ov29_022EAF34
	bl UpdateMinimap
	mov r0, #1
	bl ov29_02339FF4
	mov r0, #0
	bl GetApparentWeather
	bl GetWeatherColorTable
	mov r1, #6
	bl ov29_022F085C
	mov r0, r5
	bl ov29_022F0518
	add r0, sp, #4
	bl UnloadFile
	ldrb r0, [r5, #0xaa]
	mov r1, #0
	bl ov29_022DE47C
	bl ov29_022DE608
	mov r0, #1
	bl ov29_022DD828
	mov r0, #0xa
	mov r1, r0
	bl ov29_022EA370
	b _0231D9A8
_0231D978:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231D9B8 ; =0x00000C66
	mov r0, r5
	bl LogMessageByIdWithPopup
	mov r0, #0xa
	bl ov29_0234BA54
	mov r0, r6
	mov r1, r5
	bl TryInflictEndureStatus
_0231D9A8:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0231D9B0: .word 0x000003FF
_0231D9B4: .word 0x00000C65
_0231D9B8: .word 0x00000C66
_0231D9BC: .word ov29_02353538
	arm_func_end ApplyGonePebbleEffect

	arm_func_start ApplyGracideaEffect
ApplyGracideaEffect: ; 0x0231D9C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x1a
	mov r5, r1
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0231DA50
	mov r0, r5
	mov r1, #1
	bl ChangeShayminForme
	mov r4, r0
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r4, #3
	bne _0231DA10
	ldr r1, _0231DA70 ; =0x00000C71
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_0231DA10:
	cmp r4, #1
	bne _0231DA28
	ldr r1, _0231DA74 ; =0x00000C72
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_0231DA28:
	cmp r4, #2
	bne _0231DA40
	ldr r1, _0231DA78 ; =0x00000C74
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_0231DA40:
	ldr r1, _0231DA7C ; =0x00000C73
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_0231DA50:
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231DA7C ; =0x00000C73
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231DA70: .word 0x00000C71
_0231DA74: .word 0x00000C72
_0231DA78: .word 0x00000C74
_0231DA7C: .word 0x00000C73
	arm_func_end ApplyGracideaEffect

	arm_func_start ov29_0231DA80
ov29_0231DA80: ; 0x0231DA80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	ldrsh r0, [sb, #4]
	bl GetItemMoveId16
	ldrb r1, [sb]
	mov r5, r0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0231DAC8
	ldr r1, _0231DBE0 ; =0x00000BE7
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231DAC8:
	ldrsh r0, [sb, #4]
	bl IsHM
	cmp r0, #0
	beq _0231DAF0
	ldr r1, _0231DBE4 ; =0x00000BF4
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231DAF0:
	ldr fp, _0231DBE8 ; =ov29_02353538
	mov r4, #0
_0231DAF8:
	ldr r0, [fp]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	beq _0231DB70
	ldr r8, [r7, #0xb4]
	mov r0, r5
	ldrsh r1, [r8, #2]
	bl sub_02053D1C
	mov r6, r0
	mov r0, r7
	mov r1, r5
	bl ov29_022FBA54
	cmp r0, #0
	mov r0, r7
	movne r6, #0
	bl ov29_023009A0
	cmp r0, #0
	ldrb r0, [r8, #0xbc]
	movne r6, #0
	cmp r0, #7
	mov r0, r8
	moveq r6, #0
	bl IsExperienceLocked
	cmp r0, #0
	movne r6, #0
	strb r6, [r8, #0x161]
_0231DB70:
	add r4, r4, #1
	cmp r4, #4
	blt _0231DAF8
	mov r0, #0
	mov r2, r0
	mov r3, r0
	mov r1, #1
	bl ov31_023877EC
	mov r4, r0
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r4
	mov r1, sb
	bl ov29_022E5AE4
	mov r0, r4
	mov r1, r5
	bl ov29_023038D4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, _0231DBEC ; =0x00000141
	mov r0, sl
	mov r1, #0
	bl ov29_022EB668
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231DBE0: .word 0x00000BE7
_0231DBE4: .word 0x00000BF4
_0231DBE8: .word ov29_02353538
_0231DBEC: .word 0x00000141
	arm_func_end ov29_0231DA80

	arm_func_start ov29_0231DBF0
ov29_0231DBF0: ; 0x0231DBF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrb r1, [sb]
	mov sl, r0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0231DC2C
	ldr r1, _0231DD50 ; =0x00000BE7
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231DC2C:
	ldr r4, _0231DD54 ; =ov29_02353538
	ldr r0, [r4]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _0231DC58
	ldr r1, _0231DD58 ; =0x00000BA4
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231DC58:
	mov r5, #0
	mov fp, #1
_0231DC60:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	beq _0231DCEC
	ldr r8, [r7, #0xb4]
	mov r6, fp
	ldrsh r0, [r8, #0xc]
	cmp r0, #4
	movge r6, #0
	bge _0231DCAC
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl CheckTeamMemberIdxVeneer
	cmp r0, #0
	movne r6, #0
_0231DCAC:
	mov r0, r7
	mov r1, #0
	bl ov29_02300818
	cmp r0, #0
	ldrb r0, [r8, #0xbc]
	movne r6, #0
	cmp r0, #7
	mov r0, r8
	moveq r6, #0
	bl IsExperienceLocked
	cmp r0, #0
	ldrb r0, [r8, #7]
	movne r6, #0
	cmp r0, #0
	movne r6, #0
	strb r6, [r8, #0x161]
_0231DCEC:
	add r5, r5, #1
	cmp r5, #4
	blt _0231DC60
	mov r0, #0
	mov r1, #1
	mov r2, r0
	mov r3, r1
	bl ov31_023877EC
	mov r4, r0
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, sb
	bl ov29_022E5AE4
	ldr r0, _0231DD54 ; =ov29_02353538
	ldr r2, _0231DD5C ; =0x00000142
	ldr r3, [r0]
	mov r0, sl
	mov r1, #0
	str r4, [r3, #0xc8]
	bl ov29_022EB668
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231DD50: .word 0x00000BE7
_0231DD54: .word ov29_02353538
_0231DD58: .word 0x00000BA4
_0231DD5C: .word 0x00000142
	arm_func_end ov29_0231DBF0

	arm_func_start ov29_0231DD60
ov29_0231DD60: ; 0x0231DD60
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sb, r1
	ldrb r1, [sb]
	mov sl, r0
	mov r6, #0
	tst r1, #8
	movne r0, #1
	moveq r0, r6
	ldr r4, [sl, #0xb4]
	tst r0, #0xff
	beq _0231DDA8
	ldr r1, _0231E04C ; =0x00000BE7
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #0
	b _0231E044
_0231DDA8:
	ldr fp, _0231E050 ; =ov29_02353538
	mov r5, #0
_0231DDB0:
	ldr r0, [fp]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	beq _0231DE0C
	ldr r8, [r7, #0xb4]
	mov r0, r7
	mov r1, #0
	mov r7, #1
	bl ov29_023008DC
	cmp r0, #0
	ldrb r0, [r8, #0xbc]
	movne r7, #0
	cmp r0, #7
	mov r0, r8
	moveq r7, #0
	bl IsExperienceLocked
	cmp r0, #0
	movne r7, #0
	strb r7, [r8, #0x161]
_0231DE0C:
	add r5, r5, #1
	cmp r5, #4
	blt _0231DDB0
	mov r0, #0
	mov r2, r0
	mov r3, r0
	mov r1, #1
	bl ov31_023877EC
	str r0, [sp, #4]
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	moveq r0, #0
	beq _0231E044
	add r2, sp, #8
	add r3, r4, #0x4a
	mov r1, #0xa
_0231DE4C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0231DE4C
	mov fp, #1
	ldr r5, _0231E054 ; =0x0000016A
	add r7, sp, #4
	mov r8, fp
_0231DE6C:
	add r0, r4, #0x4a
	bl ClearMonsterActionFields
	ldrsh r0, [sb, #4]
	mov r2, #0
	cmp r0, r5
	beq _0231DE9C
	mov r0, r7
	mov r1, r8
	mov r3, r2
	str r8, [sp]
	bl ov30_023853BC
	b _0231DEB0
_0231DE9C:
	mov r0, r7
	mov r1, fp
	mov r3, r2
	str fp, [sp]
	bl ov30_023853E0
_0231DEB0:
	cmp r0, #0
	beq _0231DF1C
	cmp r6, #0
	beq _0231DFF4
	ldrsh r0, [sb, #4]
	ldr r1, _0231E058 ; =0x00000BF5
	cmp r0, r5
	bne _0231DF00
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r2, #1
	mov r3, r0
	bl YesNoMenu
	cmp r0, #1
	bne _0231DF1C
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	b _0231DFF4
_0231DF00:
	mov r0, #0
	mov r2, r0
	mov r3, r0
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	beq _0231DFF4
_0231DF1C:
	ldrh r0, [r4, #0x4a]
	cmp r0, #0x1d
	bne _0231DF34
	add r0, r4, #0x4a
	bl ov30_02385FE0
	b _0231DE6C
_0231DF34:
	cmp r0, #0x20
	bne _0231DF60
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add r0, r4, #0x4a
	bl ov31_02386204
	mov r0, #1
	bl ov29_022EB398
	mov r6, #1
	b _0231DE6C
_0231DF60:
	cmp r0, #0x21
	bne _0231DF8C
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add r0, r4, #0x4a
	mov r1, #0
	bl ov31_02386308
	mov r0, #1
	bl ov29_022EB398
	b _0231DE6C
_0231DF8C:
	cmp r0, #0x1e
	bne _0231DFB0
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add r0, r4, #0x4a
	mov r1, #0
	bl ov31_023860A4
	b _0231DE6C
_0231DFB0:
	cmp r0, #0x33
	bne _0231DFD4
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add r0, r4, #0x4a
	mov r1, #0
	bl ov31_023860A4
	b _0231DE6C
_0231DFD4:
	cmp r0, #0x1f
	bne _0231DE6C
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add r0, r4, #0x4a
	bl ov31_0238619C
	b _0231DE6C
_0231DFF4:
	cmp r6, #0
	beq _0231E038
	add r3, sp, #8
	add r2, r4, #0x4a
	mov r1, #0xa
_0231E008:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0231E008
	mov r0, sl
	mov r1, #0
	mov r2, #0x6e
	bl RemoveUsedItem
	add r0, r4, #0x4a
	mov r1, #0x2c
	bl SetMonsterActionFields
	b _0231E040
_0231E038:
	mov r0, #1
	bl ov29_022EB398
_0231E040:
	mov r0, r6
_0231E044:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231E04C: .word 0x00000BE7
_0231E050: .word ov29_02353538
_0231E054: .word 0x0000016A
_0231E058: .word 0x00000BF5
	arm_func_end ov29_0231DD60

	arm_func_start ov29_0231E05C
ov29_0231E05C: ; 0x0231E05C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	tst r2, #1
	mov r4, #0
	movne r0, #1
	moveq r0, r4
	ldrsh r1, [r1, #4]
	tst r2, #2
	and r5, r0, #0xff
	movne r0, #1
	moveq r0, #0
	ldr r6, [r7, #0xb4]
	and r0, r0, #0xff
	cmp r1, #0xa7
	bgt _0231E2D0
	bge _0231E7DC
	cmp r1, #0x89
	addls pc, pc, r1, lsl #2
	b _0231E8DC
_0231E0A8: ; jump table
	b _0231E8DC ; case 0
	b _0231E2F0 ; case 1
	b _0231E2F0 ; case 2
	b _0231E2F0 ; case 3
	b _0231E2F0 ; case 4
	b _0231E2F0 ; case 5
	b _0231E2F0 ; case 6
	b _0231E2F0 ; case 7
	b _0231E2F0 ; case 8
	b _0231E2F0 ; case 9
	b _0231E2F0 ; case 10
	b _0231E8DC ; case 11
	b _0231E8DC ; case 12
	b _0231E8DC ; case 13
	b _0231E8B0 ; case 14
	b _0231E8B0 ; case 15
	b _0231E8DC ; case 16
	b _0231E8DC ; case 17
	b _0231E8DC ; case 18
	b _0231E8DC ; case 19
	b _0231E34C ; case 20
	b _0231E8DC ; case 21
	b _0231E8DC ; case 22
	b _0231E8DC ; case 23
	b _0231E8DC ; case 24
	b _0231E8DC ; case 25
	b _0231E8DC ; case 26
	b _0231E8DC ; case 27
	b _0231E8DC ; case 28
	b _0231E8DC ; case 29
	b _0231E8DC ; case 30
	b _0231E8DC ; case 31
	b _0231E8DC ; case 32
	b _0231E8DC ; case 33
	b _0231E2FC ; case 34
	b _0231E8DC ; case 35
	b _0231E8DC ; case 36
	b _0231E8DC ; case 37
	b _0231E8DC ; case 38
	b _0231E8DC ; case 39
	b _0231E8DC ; case 40
	b _0231E8DC ; case 41
	b _0231E8DC ; case 42
	b _0231E8DC ; case 43
	b _0231E8DC ; case 44
	b _0231E8DC ; case 45
	b _0231E8DC ; case 46
	b _0231E338 ; case 47
	b _0231E338 ; case 48
	b _0231E8DC ; case 49
	b _0231E8DC ; case 50
	b _0231E8DC ; case 51
	b _0231E8DC ; case 52
	b _0231E8DC ; case 53
	b _0231E8DC ; case 54
	b _0231E8DC ; case 55
	b _0231E8DC ; case 56
	b _0231E8DC ; case 57
	b _0231E8DC ; case 58
	b _0231E8DC ; case 59
	b _0231E8DC ; case 60
	b _0231E8DC ; case 61
	b _0231E8DC ; case 62
	b _0231E8DC ; case 63
	b _0231E8DC ; case 64
	b _0231E8DC ; case 65
	b _0231E8DC ; case 66
	b _0231E8DC ; case 67
	b _0231E8DC ; case 68
	b _0231E448 ; case 69
	b _0231E354 ; case 70
	b _0231E354 ; case 71
	b _0231E4D8 ; case 72
	b _0231E8DC ; case 73
	b _0231E5D0 ; case 74
	b _0231E730 ; case 75
	b _0231E52C ; case 76
	b _0231E4B4 ; case 77
	b _0231E6E4 ; case 78
	b _0231E6FC ; case 79
	b _0231E504 ; case 80
	b _0231E5A4 ; case 81
	b _0231E554 ; case 82
	b _0231E57C ; case 83
	b _0231E670 ; case 84
	b _0231E8DC ; case 85
	b _0231E600 ; case 86
	b _0231E76C ; case 87
	b _0231E6DC ; case 88
	b _0231E6C8 ; case 89
	b _0231E6B0 ; case 90
	b _0231E744 ; case 91
	b _0231E448 ; case 92
	b _0231E8DC ; case 93
	b _0231E804 ; case 94
	b _0231E8DC ; case 95
	b _0231E814 ; case 96
	b _0231E828 ; case 97
	b _0231E8DC ; case 98
	b _0231E3BC ; case 99
	b _0231E464 ; case 100
	b _0231E478 ; case 101
	b _0231E48C ; case 102
	b _0231E8DC ; case 103
	b _0231E8C0 ; case 104
	b _0231E8DC ; case 105
	b _0231E798 ; case 106
	b _0231E8B0 ; case 107
	b _0231E4A0 ; case 108
	b _0231E864 ; case 109
	b _0231E864 ; case 110
	b _0231E898 ; case 111
	b _0231E864 ; case 112
	b _0231E8DC ; case 113
	b _0231E8DC ; case 114
	b _0231E8DC ; case 115
	b _0231E3BC ; case 116
	b _0231E8B0 ; case 117
	b _0231E784 ; case 118
	b _0231E8DC ; case 119
	b _0231E8DC ; case 120
	b _0231E8DC ; case 121
	b _0231E8DC ; case 122
	b _0231E8DC ; case 123
	b _0231E8DC ; case 124
	b _0231E8DC ; case 125
	b _0231E8DC ; case 126
	b _0231E8DC ; case 127
	b _0231E8DC ; case 128
	b _0231E8DC ; case 129
	b _0231E8DC ; case 130
	b _0231E8DC ; case 131
	b _0231E8DC ; case 132
	b _0231E8DC ; case 133
	b _0231E8DC ; case 134
	b _0231E8DC ; case 135
	b _0231E8DC ; case 136
	b _0231E83C ; case 137
_0231E2D0:
	cmp r1, #0xa8
	bgt _0231E2E0
	beq _0231E8B0
	b _0231E8DC
_0231E2E0:
	ldr r0, _0231E8E8 ; =0x0000014F
	cmp r1, r0
	beq _0231E8A0
	b _0231E8DC
_0231E2F0:
	cmp r5, #0
	movne r4, #0x46
	b _0231E8E0
_0231E2FC:
	cmp r5, #0
	beq _0231E330
	add r0, r6, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	movgt r0, #0x32
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231E330:
	mov r4, #0
	b _0231E8E0
_0231E338:
	cmp r5, #0
	movne r0, #0x32
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	b _0231E8E0
_0231E34C:
	mov r4, #0x28
	b _0231E8E0
_0231E354:
	ldrsh r1, [r6, #0x12]
	ldrsh r0, [r6, #0x16]
	ldr r2, _0231E8EC ; =0x000003E7
	add r3, r1, r0
	cmp r3, r2
	ldrsh r1, [r6, #0x10]
	movle r2, r3
	cmp r1, r2
	bge _0231E8E0
	ldr r0, _0231E8EC ; =0x000003E7
	cmp r3, r0
	movgt r3, r0
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	cmp r1, r0, asr #2
	bgt _0231E8E0
	cmp r5, #0
	bne _0231E3B4
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x64
	moveq r4, #0x32
	b _0231E8E0
_0231E3B4:
	mov r4, #0x32
	b _0231E8E0
_0231E3BC:
	cmp r1, #0x74
	mov r1, #1
	bne _0231E3D8
	ldrsh r0, [r6, #4]
	cmp r0, #0x124
	cmpne r0, #0x37c
	movne r1, #0
_0231E3D8:
	cmp r1, #0
	beq _0231E8E0
	mov r4, #0
	add r7, r6, #0x124
	mov r8, r4
	mov r5, r4
	mov r6, #1
_0231E3F4:
	ldrb r0, [r7, r8, lsl #3]
	add sb, r7, r8, lsl #3
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0231E430
	ldrb r0, [sb, #6]
	cmp r0, #0
	mov r0, sb
	addeq r4, r4, #0x1e
	bl GetMaxPpWrapper
	ldrb r1, [sb, #6]
	cmp r1, r0
	addne r4, r4, #6
_0231E430:
	add r8, r8, #1
	cmp r8, #4
	blt _0231E3F4
	cmp r4, #0x63
	movge r4, #0x63
	b _0231E8E0
_0231E448:
	mov r0, r7
	mov r1, #1
	bl MonsterHasNegativeStatus
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #0
	b _0231E8E0
_0231E464:
	ldrb r0, [r6, #0x1a]
	cmp r0, #0xfa
	movhs r4, #0
	movlo r4, #0x64
	b _0231E8E0
_0231E478:
	ldrb r0, [r6, #0x1b]
	cmp r0, #0xfa
	movhs r4, #0
	movlo r4, #0x64
	b _0231E8E0
_0231E48C:
	ldrb r0, [r6, #0x1c]
	cmp r0, #0xfa
	movhs r4, #0
	movlo r4, #0x64
	b _0231E8E0
_0231E4A0:
	ldrb r0, [r6, #0x1d]
	cmp r0, #0xfa
	movhs r4, #0
	movlo r4, #0x64
	b _0231E8E0
_0231E4B4:
	cmp r5, #0
	movne r4, #0
	bne _0231E8E0
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0xa
	moveq r4, #0x64
	b _0231E8E0
_0231E4D8:
	mov r0, r7
	bl CanSeeInvisibleMonsters
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #5
	b _0231E8E0
_0231E504:
	ldr r0, [r6, #0x110]
	cmp r0, #3
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #5
	b _0231E8E0
_0231E52C:
	ldrb r0, [r6, #0xf1]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #5
	b _0231E8E0
_0231E554:
	ldrb r0, [r6, #0xbf]
	cmp r0, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #0x1e
	b _0231E8E0
_0231E57C:
	ldrb r0, [r6, #0xd0]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #0xf
	b _0231E8E0
_0231E5A4:
	ldrb r0, [r6, #0xbf]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x64
	moveq r4, #0x32
	b _0231E8E0
_0231E5D0:
	mov r0, r7
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #5
	b _0231E8E0
_0231E600:
	cmp r0, #0
	bne _0231E620
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x28
	moveq r4, #5
	b _0231E8E0
_0231E620:
	ldrsh r2, [r6, #0x12]
	ldrsh r1, [r6, #0x16]
	ldr r0, _0231E8EC ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [r6, #0x10]
	cmp r0, r1
	cmplt r0, #0x14
	bge _0231E8E0
	cmp r5, #0
	bne _0231E668
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x64
	moveq r4, #0x32
	b _0231E8E0
_0231E668:
	mov r4, #0x32
	b _0231E8E0
_0231E670:
	ldrb r0, [r6, #0xbd]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r0, #5
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #5
	b _0231E8E0
_0231E6B0:
	ldrb r0, [r6, #0xbd]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #5
	b _0231E8E0
_0231E6C8:
	ldrb r0, [r6, #0xa]
	cmp r0, #0x63
	movlo r4, #0x50
	movhs r4, #0
	b _0231E8E0
_0231E6DC:
	mov r4, #0x50
	b _0231E8E0
_0231E6E4:
	ldrb r0, [r6, #0xbf]
	cmp r0, #1
	moveq r0, #0x32
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	b _0231E8E0
_0231E6FC:
	add r0, r6, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	movgt r0, #0x32
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	b _0231E8E0
_0231E730:
	ldrb r0, [r6, #0xa]
	cmp r0, #1
	movhi r4, #0x50
	movls r4, #0
	b _0231E8E0
_0231E744:
	ldrb r0, [r6, #0xc4]
	cmp r0, #6
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #5
	b _0231E8E0
_0231E76C:
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #0x1e
	b _0231E8E0
_0231E784:
	ldrb r0, [r6, #6]
	cmp r0, #0
	movne r4, #0
	moveq r4, #0x64
	b _0231E8E0
_0231E798:
	ldrsh r0, [r6, #2]
	bl GetMobilityType
	cmp r0, #0
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	ldrneb r0, [r6, #0xef]
	cmpne r0, #4
	moveq r4, #0
	beq _0231E8E0
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0xa
	moveq r4, #0x64
	b _0231E8E0
_0231E7DC:
	ldrb r0, [r6, #0xd5]
	cmp r0, #9
	moveq r4, #0
	beq _0231E8E0
	mov r0, r7
	bl ov29_0231E8F0
	cmp r0, #0
	movne r4, #0x50
	moveq r4, #0
	b _0231E8E0
_0231E804:
	cmp r5, #0
	movne r4, #0x46
	moveq r4, #0
	b _0231E8E0
_0231E814:
	ldrsh r0, [r6, #0x26]
	cmp r0, #0x14
	movge r4, #0
	movlt r4, #0x50
	b _0231E8E0
_0231E828:
	ldrb r0, [r6, #0xef]
	cmp r0, #1
	movne r4, #0x50
	moveq r4, #0
	b _0231E8E0
_0231E83C:
	ldrsh r0, [r6, #4]
	bl FemaleToMaleForm
	ldrsh r0, [r6, #4]
	cmp r0, #0x1e0
	cmpne r0, #0xb9
	bne _0231E8E0
	cmp r5, #0
	movne r4, #0x46
	moveq r4, #0x64
	b _0231E8E0
_0231E864:
	add r0, r6, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	movlt r0, #0x64
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	b _0231E8E0
_0231E898:
	mov r4, #0x1e
	b _0231E8E0
_0231E8A0:
	cmp r5, #0
	movne r4, #0
	moveq r4, #0x14
	b _0231E8E0
_0231E8B0:
	cmp r5, #0
	movne r4, #0x50
	moveq r4, #0
	b _0231E8E0
_0231E8C0:
	ldrb r0, [r6, #0xf1]
	cmp r0, #4
	beq _0231E8E0
	cmp r5, #0
	movne r4, #0x50
	moveq r4, #0
	b _0231E8E0
_0231E8DC:
	mov r4, #0
_0231E8E0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231E8E8: .word 0x0000014F
_0231E8EC: .word 0x000003E7
	arm_func_end ov29_0231E05C

	arm_func_start ov29_0231E8F0
ov29_0231E8F0: ; 0x0231E8F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, #0
	mov sl, #1
	mov r6, r0
	mov sb, r5
	mov r8, r5
	mov r7, sl
	ldr r4, _0231E98C ; =DIRECTIONS_XY
	b _0231E97C
_0231E914:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh ip, [r6, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [r6, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0231E978
	ldr r0, [r1]
	cmp r0, #0
	moveq r0, sl
	movne r0, sb
	cmp r0, #1
	beq _0231E978
	mov r0, r6
	mov r2, r8
	mov r3, r7
	bl ov29_0230175C
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0231E978:
	add r5, r5, #1
_0231E97C:
	cmp r5, #8
	blt _0231E914
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0231E98C: .word DIRECTIONS_XY
	arm_func_end ov29_0231E8F0

	arm_func_start ShouldTryEatItem
ShouldTryEatItem: ; 0x0231E990
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x45
	blt _0231E9A8
	cmp r4, #0x8a
	ble _0231E9B0
_0231E9A8:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0231E9B0:
	bl IsItemValidVeneer
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _0231E9EC ; =ov10_022C4B74
	b _0231E9D8
_0231E9C8:
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r0, #2
_0231E9D8:
	ldrsh r1, [r0]
	cmp r1, #0
	bne _0231E9C8
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231E9EC: .word ov10_022C4B74
	arm_func_end ShouldTryEatItem

	arm_func_start GetMaxPpWrapper
GetMaxPpWrapper: ; 0x0231E9F0
	stmdb sp!, {r3, lr}
	bl GetMaxPp
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	arm_func_end GetMaxPpWrapper

	arm_func_start ov29_0231EA04
ov29_0231EA04: ; 0x0231EA04
	ldr ip, _0231EA14 ; =InitMove
	mov r0, r1
	mov r1, r2
	bx ip
	.align 2, 0
_0231EA14: .word InitMove
	arm_func_end ov29_0231EA04

	arm_func_start MoveIsNotPhysical
MoveIsNotPhysical: ; 0x0231EA18
	stmdb sp!, {r3, lr}
	bl GetMoveCategory
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end MoveIsNotPhysical

	arm_func_start CategoryIsNotPhysical
CategoryIsNotPhysical: ; 0x0231EA30
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end CategoryIsNotPhysical

	arm_func_start ov29_0231EA40
ov29_0231EA40: ; 0x0231EA40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl IsFullFloorFixedRoom
	cmp r0, #0
	bne _0231EA80
	ldr r0, _0231EDC8 ; =ov29_02353538
	ldr r0, [r0]
	add r1, r0, #0x4000
	ldrsh r0, [r1, #0xd4]
	sub r2, r0, #0x1a
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #1
	bhi _0231EA90
_0231EA80:
	ldr r1, _0231EDCC ; =0x00000E01
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231EA90:
	ldrb r2, [r1, #0xc4]
	cmp r2, #0
	beq _0231EAAC
	ldr r1, _0231EDD0 ; =0x00000DFF
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231EAAC:
	ldrb r1, [r1, #0xc7]
	cmp r1, #0
	beq _0231EAC8
	mov r0, sl
	mov r1, #0xe00
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231EAC8:
	bl ov29_022E0378
	cmp r0, #0
	movne r7, #3
	moveq r7, #2
	mov r6, #0
	mov sb, #1
_0231EAE0:
	ldr fp, _0231EDC8 ; =ov29_02353538
	mov r5, #1
	mov r4, #0
_0231EAEC:
	mov r0, sb
	mov r1, r5
	mov r8, #0
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #0x400
	strh r1, [r0]
	strb r4, [r0, #7]
	ldrh r1, [r0]
	tst r1, #0x10
	bne _0231EBCC
	tst r1, #0x100
	bne _0231EBCC
	ldrh r1, [r0, #2]
	orr r1, r1, #3
	strh r1, [r0, #2]
	ldrh r1, [r0]
	bic r1, r1, #8
	strh r1, [r0]
	ldrh r1, [r0]
	tst r1, #0x40
	ldrh r1, [r0]
	movne r6, #1
	and r2, r1, #3
	cmp r2, #2
	cmpne r2, #3
	beq _0231EBCC
	cmp sb, #1
	cmpne r5, #1
	cmpne sb, #0x36
	cmpne r5, #0x1e
	bne _0231EB84
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldreq r1, [fp]
	ldreqb r1, [r1, #0x78f]
	cmpeq r1, #0
	moveq r8, #1
_0231EB84:
	cmp r8, #0
	beq _0231EBA8
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, r7
	strh r1, [r0]
	b _0231EBCC
_0231EBA8:
	cmp r2, #1
	beq _0231EBCC
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	orr r1, r1, #0x400
	strh r1, [r0]
_0231EBCC:
	add r5, r5, #1
	cmp r5, #0x1f
	blt _0231EAEC
	add sb, sb, #1
	cmp sb, #0x37
	blt _0231EAE0
	ldr r0, _0231EDC8 ; =ov29_02353538
	mov r2, #1
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe4]
	ldrsh r1, [r1, #0xe6]
	bl StairsAlwaysReachable
	cmp r0, #0
	beq _0231EC64
	mov r5, #0
	mov r4, r5
_0231EC10:
	mov r8, r4
_0231EC14:
	mov r0, r5
	mov r1, r8
	bl GetTileSafe
	ldrh r1, [r0]
	tst r1, #0x100
	bne _0231EC4C
	tst r1, #0x400
	beq _0231EC4C
	tst r1, #0x8000
	bicne r1, r1, #3
	strneh r1, [r0]
	ldrneh r1, [r0]
	orrne r1, r1, r7
	strneh r1, [r0]
_0231EC4C:
	add r8, r8, #1
	cmp r8, #0x20
	blt _0231EC14
	add r5, r5, #1
	cmp r5, #0x38
	blt _0231EC10
_0231EC64:
	cmp r6, #0
	ldrne r0, _0231EDC8 ; =ov29_02353538
	mov r5, #0
	ldrne r0, [r0]
	movne r1, #0
	addne r0, r0, #0x4000
	strneb r1, [r0, #0xc9]
	mov r4, r5
_0231EC84:
	mov r7, r4
_0231EC88:
	cmp r6, #0
	beq _0231ECA8
	mov r0, r5
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x40
	strh r1, [r0]
_0231ECA8:
	mov r0, r5
	mov r1, r7
	bl DetermineTileWalkableNeighbors
	add r7, r7, #1
	cmp r7, #0x20
	blt _0231EC88
	add r5, r5, #1
	cmp r5, #0x38
	blt _0231EC84
	ldr r4, _0231EDC8 ; =ov29_02353538
	mov r5, #0
_0231ECD4:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78]
	mov r0, r6
	bl EntityIsValid__0231EDD8
	cmp r0, #0
	beq _0231ED08
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	strb r0, [r6, #0x25]
_0231ED08:
	add r5, r5, #1
	cmp r5, #0x14
	blt _0231ECD4
	bl ov29_0233FB1C
	bl ov29_0233785C
	bl ov29_0233665C
	bl ov29_02304B64
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	ldr r1, _0231EDD4 ; =0x00000DFE
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x28
	mov r1, #0x2b
	bl ov29_022EA370
	mov r0, sl
	mov r1, #1
	bl ov29_02305814
	ldr r4, _0231EDC8 ; =ov29_02353538
	mov r6, #0
_0231ED58:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78]
	mov r0, r5
	bl EntityIsValid__0231EDD8
	cmp r0, #0
	beq _0231ED98
	mov r0, r5
	bl ov29_022F9C74
	mov r0, r5
	bl EntityIsValid__0231EDD8
	cmp r0, #0
	beq _0231ED98
	mov r0, r5
	bl EnsureCanStandCurrentTile
_0231ED98:
	add r6, r6, #1
	cmp r6, #0x14
	blt _0231ED58
	ldr r0, _0231EDC8 ; =ov29_02353538
	mov r3, #1
	ldr r1, [r0]
	mov r0, #0x14
	add r2, r1, #0x4000
	mov r1, #0x2b
	strb r3, [r2, #0xc4]
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231EDC8: .word ov29_02353538
_0231EDCC: .word 0x00000E01
_0231EDD0: .word 0x00000DFF
_0231EDD4: .word 0x00000DFE
	arm_func_end ov29_0231EA40
