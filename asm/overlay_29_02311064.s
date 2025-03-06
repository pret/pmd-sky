	.include "asm/macros.inc"
	.include "overlay_29_02311064.inc"

	.text

	arm_func_start ExclusiveItemEffectIsActive__02311064
ExclusiveItemEffectIsActive__02311064: ; 0x02311064
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__02311064

	arm_func_start TickStatusAndHealthRegen
TickStatusAndHealthRegen: ; 0x02311088
#ifdef JAPAN
#define TICK_STATUS_AND_HEALTH_REGEN_OFFSET -4
#define TICK_STATUS_AND_HEALTH_REGEN_OFFSET_2 -1
#else
#define TICK_STATUS_AND_HEALTH_REGEN_OFFSET 0
#define TICK_STATUS_AND_HEALTH_REGEN_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ov29_0234B294
	ldr r7, [sl, #0xb4]
	ldrb r0, [r7, #0xbf]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _023110E0
	mov r0, sl
	mov r1, #0x72
	bl AbilityIsActiveVeneer
	cmp r0, #0
	moveq r4, #1
_023110E0:
	ldrb r0, [r7, #0x150 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	cmp r0, #0
	cmpeq r4, #0
	bne _023112A8
	ldrb r0, [r7, #0xd8]
	cmp r0, #5
	ldrneb r0, [r7, #0xbd]
	cmpne r0, #3
	beq _023112A8
	ldrb r0, [r7, #6]
	mov r4, #0
	cmp r0, #0
	bne _02311120
	ldrsh r0, [r7, #2]
	bl GetRegenSpeed
	mov r4, r0
_02311120:
	cmp r4, #0
	beq _023112A8
	mov r0, sl
	mov r1, #0x11
	bl ItemIsActive__02311034
	cmp r0, #0
	bne _02311150
	mov r0, sl
	mov r1, #0x35
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _0231115C
_02311150:
	ldr r0, _02311800 ; =ov10_022C46F8
	ldrsh r0, [r0]
	add r4, r4, r0
_0231115C:
	ldrb r0, [r7, #0xd5]
	mov r1, #3
	cmp r0, #6
	ldreq r0, _02311804 ; =WISH_BONUS_REGEN
	ldreqsh r0, [r0]
	addeq r4, r4, r0
	mov r0, sl
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _0231119C
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #4
	ldreq r0, _02311808 ; =RAIN_ABILITY_BONUS_REGEN
	ldreqsh r0, [r0]
	addeq r4, r4, r0
_0231119C:
	mov r0, sl
	mov r1, #0x55
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023111C8
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #4
	ldreq r0, _02311808 ; =RAIN_ABILITY_BONUS_REGEN
	ldreqsh r0, [r0]
	addeq r4, r4, r0
_023111C8:
	mov r0, sl
	mov r1, #0x4d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023111F4
	mov r0, sl
	bl GetApparentWeather
	cmp r0, #5
	ldreq r0, _0231180C ; =ICE_BODY_BONUS_REGEN
	ldreqsh r0, [r0]
	addeq r4, r4, r0
_023111F4:
	mov r0, sl
	mov r1, #0x49
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	ldrne r0, _02311810 ; =ov10_022C4674
	ldrsh r2, [r7, #0x12]
	ldrnesh r0, [r0]
	ldrsh r1, [r7, #0x16]
	addne r4, r4, r0
	cmp r4, #0x1f4
	movgt r4, #0x1f4
	add r3, r2, r1
	cmp r4, #0x1e
	ldr r0, _02311814 ; =0x000003E7
	movlt r4, #0x1e
	cmp r3, r0
	movgt r3, r0
	add r0, r7, #0x200
	ldrsh r1, [r0, #0x10 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	add r2, r7, #0x210 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET
	add r1, r1, r3
	strh r1, [r0, #0x10 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	b _02311268
_02311250:
	ldrsh r1, [r7, #0x10]
	add r1, r1, #1
	strh r1, [r7, #0x10]
	ldrsh r1, [r2]
	sub r1, r1, r4
	strh r1, [r2]
_02311268:
	ldrsh r1, [r0, #0x10 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	cmp r1, r4
	bge _02311250
	ldrsh r1, [r7, #0x12]
	ldrsh r0, [r7, #0x16]
	ldr r2, _02311814 ; =0x000003E7
	add r1, r1, r0
	cmp r1, r2
	ldrsh r0, [r7, #0x10]
	movle r2, r1
	cmp r0, r2
	blt _023112A8
	ldr r0, _02311814 ; =0x000003E7
	cmp r1, r0
	movgt r1, r0
	strh r1, [r7, #0x10]
_023112A8:
	ldrb r0, [r7, #0xbd]
	cmp r0, #0
	beq _0231131C
	add r0, r7, #0xbe
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xbe]
	cmp r0, #0
	bne _0231131C
#ifndef JAPAN
	ldr r0, [r7, #0x110]
	cmp r0, #1
	ble _02311304
#endif
	ldrb r0, [r7, #0xbd]
	cmp r0, #4
	bne _02311304
	mov r0, #0
	bl DisplayActions
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02311304:
	mov r2, #1
	mov r0, sl
	mov r1, sl
	mov r3, r2
	str r2, [sp]
	bl EndSleepClassStatus
_0231131C:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xbf]
	cmp r0, #0
	beq _02311364
	add r0, r7, #0xc0
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xc0]
	cmp r0, #0
	bne _02311364
	mov r0, sl
	mov r1, sl
	bl EndBurnClassStatus
_02311364:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xc4]
	cmp r0, #0
	beq _023113B0
	add r0, r7, #0xcc
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xcc]
	cmp r0, #0
	bne _023113B0
	mov r0, sl
	mov r1, sl
	mov r2, #1
	bl EndFrozenClassStatus
_023113B0:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xd0]
	cmp r0, #0
	beq _023113F8
	add r0, r7, #0xd1
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xd1]
	cmp r0, #0
	bne _023113F8
	mov r0, sl
	mov r1, sl
	bl EndCringeClassStatus
_023113F8:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xd5]
	cmp r0, #0
	beq _02311468
	add r0, r7, #0xd6
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xd5]
	cmp r0, #0x10
	bne _02311450
	add r0, r7, #0xd7
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xd7]
	cmp r0, #0
	bne _02311450
	mov r0, sl
	bl ApplyAquaRingHealing
_02311450:
	ldrb r0, [r7, #0xd6]
	cmp r0, #0
	bne _02311468
	mov r0, sl
	mov r1, sl
	bl EndReflectClassStatus
_02311468:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xd8]
	cmp r0, #0
	beq _023114B8
	add r0, r7, #0xdb
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xdb]
	cmp r0, #0
	bne _023114B8
	mov r0, sl
	mov r1, sl
	mov r2, #0
	mov r3, #1
	bl EndCurseClassStatus
_023114B8:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xe0]
	cmp r0, #0
	beq _02311500
	add r0, r7, #0xe9
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xe9]
	cmp r0, #0
	bne _02311500
	mov r0, sl
	mov r1, sl
	bl EndLeechSeedClassStatus
_02311500:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xec]
	cmp r0, #0
	beq _02311548
	add r0, r7, #0xed
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xed]
	cmp r0, #0
	bne _02311548
	mov r0, sl
	mov r1, sl
	bl EndSureShotClassStatus
_02311548:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xef]
	cmp r0, #0
	beq _02311594
	add r0, r7, #0xf0
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xf0]
	cmp r0, #0
	bne _02311594
	mov r0, sl
	mov r1, sl
	mov r2, #0
	bl EndInvisibleClassStatus
_02311594:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xf1]
	cmp r0, #0
	beq _023115DC
	add r0, r7, #0xf2
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xf2]
	cmp r0, #0
	bne _023115DC
	mov r0, sl
	mov r1, sl
	bl EndBlinkerClassStatus
_023115DC:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xf3]
	cmp r0, #0
	beq _02311624
	add r0, r7, #0xf4
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xf4]
	cmp r0, #0
	bne _02311624
	mov r0, sl
	mov r1, sl
	bl EndMuzzledStatus
_02311624:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xf5]
	cmp r0, #0
	beq _0231166C
	add r0, r7, #0xf6
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xf6]
	cmp r0, #0
	bne _0231166C
	mov r0, sl
	mov r1, sl
	bl EndMiracleEyeStatus
_0231166C:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0xf7]
	cmp r0, #0
	beq _023116B4
	add r0, r7, #0xf8
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0xf8]
	cmp r0, #0
	bne _023116B4
	mov r0, sl
	mov r1, sl
	bl EndMagnetRiseStatus
_023116B4:
	mov r0, sl
	bl EntityIsValid__02311010
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #0x105 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET_2]
	cmp r0, #0
	beq _0231174C
#ifdef JAPAN
	add r0, r7, #0x104
#else
	add r0, r7, #5
	add r0, r0, #0x100
#endif
	bl TickStatusTurnCounter
	ldrb r0, [r7, #0x105 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET_2]
	cmp r0, #0
	bne _0231174C
	ldrb r0, [r7, #0x104 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET_2]
	cmp r0, #2
	bne _02311720
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02311818 ; =0x00000CC6
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _02311744
_02311720:
	cmp r0, #1
	bne _02311744
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231181C ; =0x00000CC7
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_02311744:
	mov r0, #0
	strb r0, [r7, #0x104 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET_2]
_0231174C:
	mov r6, #0
	add r0, r7, #0x19 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET
	mov sb, r6
	add r5, r0, #0x100
	add r4, r7, #0x114 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET
	mov fp, #1
_02311764:
	add r8, r7, sb
	ldrb r0, [r8, #0x119 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	cmp r0, #0
	beq _02311788
	add r0, r5, sb
	bl TickStatusTurnCounter
	ldrb r0, [r8, #0x119 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	cmp r0, #0
	moveq r6, fp
_02311788:
	ldrb r0, [r8, #0x114 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	cmp r0, #0
	beq _023117A8
	add r0, r4, sb
	bl TickStatusTurnCounter
	ldrb r0, [r8, #0x114 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	cmp r0, #0
	moveq r6, #1
_023117A8:
	add sb, sb, #1
	cmp sb, #5
	blt _02311764
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sl, #0xb4]
	mov r0, sl
	ldr r5, [r1, #0x110 + TICK_STATUS_AND_HEALTH_REGEN_OFFSET]
	bl CalcSpeedStageWrapper
	mov r4, r0
	cmp r5, r4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r0, _02311820 ; =ov29_02353318
	mov r1, r4, lsl #1
	ldrh r1, [r0, r1]
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02311800: .word ov10_022C46F8
_02311804: .word WISH_BONUS_REGEN
_02311808: .word RAIN_ABILITY_BONUS_REGEN
_0231180C: .word ICE_BODY_BONUS_REGEN
_02311810: .word ov10_022C4674
_02311814: .word 0x000003E7
#ifdef JAPAN
_02311818: .word 0x00000A06
_0231181C: .word 0x00000A07
#else
_02311818: .word 0x00000CC6
_0231181C: .word 0x00000CC7
#endif
_02311820: .word ov29_02353318
	arm_func_end TickStatusAndHealthRegen

	arm_func_start InflictSleepStatusSingle
InflictSleepStatusSingle: ; 0x02311824
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r4, #0
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r7, #0xb4]
	ldrb r0, [r5, #0xbd]
	cmp r0, #3
	beq _023118A0
	cmp r0, #1
	beq _02311898
	mov r0, #1
	strb r0, [r5, #0xbd]
	cmp r6, #0x7f
	beq _02311890
	mov r0, r7
	mov r1, #0x2f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02311890
	add r0, r6, r6, lsr #31
	mov r6, r0, asr #1
	cmp r6, #1
	movlt r6, #1
_02311890:
	strb r6, [r5, #0xbe]
	b _023118A4
_02311898:
	mov r4, #1
	b _023118A4
_023118A0:
	mov r4, #2
_023118A4:
	mov r0, r7
	bl UpdateStatusIconFlags
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end InflictSleepStatusSingle
