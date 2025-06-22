	.include "asm/macros.inc"
	.include "overlay_29_0231AD38.inc"

	.text

	arm_func_start ov29_0231AD38
ov29_0231AD38: ; 0x0231AD38
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	and r4, r0, #0xf
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	cmp r4, #3
	and r0, r0, #0xf
	cmpne r4, #1
	cmpne r0, #4
	cmpne r0, #3
	cmpne r0, #1
	cmpne r0, #6
	beq _0231ADA0
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x70
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_0231ADA0:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0231AD38

	arm_func_start ov29_0231ADA8
ov29_0231ADA8: ; 0x0231ADA8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, [r0, #0xb4]
	mov r0, #0
	mov r5, r0
#ifdef JAPAN
	add r4, r1, #0x120
#else
	add r4, r1, #0x124
#endif
	mov ip, r0
	mov lr, #1
	add r2, sp, #0
_0231ADCC:
	ldrb r1, [r4, r5, lsl #3]
	add r3, r4, r5, lsl #3
	tst r1, #1
	movne r1, lr
	moveq r1, ip
	tst r1, #0xff
	beq _0231AE00
	ldrh r3, [r3, #4]
	add r1, r0, #1
	mov r0, r0, lsl #1
	mov r1, r1, lsl #0x10
	strh r3, [r2, r0]
	mov r0, r1, lsr #0x10
_0231AE00:
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, lsr #0x10
	cmp r5, #4
	blo _0231ADCC
	cmp r0, #0
	moveq r0, #0
	beq _0231AE34
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0
	mov r0, r0, lsr #0xf
	ldrh r0, [r1, r0]
_0231AE34:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0231ADA8

	arm_func_start ov29_0231AE3C
ov29_0231AE3C: ; 0x0231AE3C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov r0, #0
	mov lr, r0
	mov r2, r0
	mov r3, #1
_0231AE54:
	add r1, ip, lr, lsl #3
#ifdef JAPAN
	ldrb r1, [r1, #0x120]
#else
	ldrb r1, [r1, #0x124]
#endif
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	add r1, lr, #1
	addne r0, r0, #1
	mov r1, r1, lsl #0x10
	movne r0, r0, lsl #0x10
	mov lr, r1, lsr #0x10
	movne r0, r0, lsr #0x10
	cmp lr, #4
	blo _0231AE54
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0231AE3C

	arm_func_start GetEntityNaturalGiftInfo
GetEntityNaturalGiftInfo: ; 0x0231AE90
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl IsMonster__0231A9D4
	cmp r0, #0
	ldrne r4, [r4, #0xb4]
	ldrnesh r0, [r4, #0x66]
	cmpne r0, #0
	beq _0231AF00
	mov ip, #0
	ldr r3, _0231AF08 ; =NATURAL_GIFT_ITEM_TABLE
	mov lr, ip
	mov r1, #6
_0231AEC0:
	smulbb r5, lr, r1
	ldrsh r2, [r3, r5]
	cmp r2, #0
	beq _0231AEF0
	ldrsh r0, [r4, #0x66]
	cmp r0, r2
	moveq ip, #1
	beq _0231AEF0
	add r0, lr, #1
	mov r0, r0, lsl #0x10
	mov lr, r0, asr #0x10
	b _0231AEC0
_0231AEF0:
	cmp ip, #0
	ldrne r0, _0231AF08 ; =NATURAL_GIFT_ITEM_TABLE
	addne r0, r0, r5
	ldmneia sp!, {r3, r4, r5, pc}
_0231AF00:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231AF08: .word NATURAL_GIFT_ITEM_TABLE
	arm_func_end GetEntityNaturalGiftInfo

	arm_func_start GetEntityWeatherBallType
GetEntityWeatherBallType: ; 0x0231AF0C
	stmdb sp!, {r3, lr}
	bl GetApparentWeather
	ldr r1, _0231AF20 ; =WEATHER_BALL_TYPE_TABLE
	ldrb r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231AF20: .word WEATHER_BALL_TYPE_TABLE
	arm_func_end GetEntityWeatherBallType

	arm_func_start ov29_0231AF24
ov29_0231AF24: ; 0x0231AF24
#ifdef JAPAN
#define OV29_0231AF24_OFFSET -4
#else
#define OV29_0231AF24_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsMonster__0231A9D4
	cmp r0, #0
	beq _0231AFAC
	mov r0, r6
	mov r1, r5
	bl ov29_022FB9E0
	mov r1, r0
	cmp r4, #0
	beq _0231AF98
	cmp r1, #0
	bge _0231AF98
	ldr r4, [r6, #0xb4]
	mov r1, #0
	mov r2, r1
	add r0, r4, #0x4a
	bl SetActionUseMoveAi
	mov r2, #1
	strb r2, [r4, #0x124 + OV29_0231AF24_OFFSET]
	add r0, r4, #0x100
	mov r1, #0
	strh r1, [r0, #0x26 + OV29_0231AF24_OFFSET]
	strh r5, [r0, #0x28 + OV29_0231AF24_OFFSET]
	strb r2, [r4, #0x12a + OV29_0231AF24_OFFSET]
	strb r1, [r4, #0x12b + OV29_0231AF24_OFFSET]
_0231AF98:
	mov r3, #0
	mov r0, r6
	mov r2, #1
	str r3, [sp]
	bl ov29_0232145C
_0231AFAC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov29_0231AF24

	arm_func_start ov29_0231AFB4
ov29_0231AFB4: ; 0x0231AFB4
	stmdb sp!, {r4, lr}
	mov ip, #0
	ldr r1, _0231B004 ; =DUNGEON_PTR
	mov r2, ip
	mov r3, ip
_0231AFC8:
	ldr r0, [r1]
	mov r4, r3
#ifdef JAPAN
	add r0, r0, #0x1840
	add r0, r0, #0x18000
#else
	add r0, r0, #0xe4
	add r0, r0, #0x19800
#endif
	add lr, r0, ip, lsl #4
_0231AFDC:
	str r2, [lr, r4, lsl #3]
	add r0, lr, r4, lsl #3
	add r4, r4, #1
	str r2, [r0, #4]
	cmp r4, #2
	blt _0231AFDC
	add ip, ip, #1
	cmp ip, #2
	blt _0231AFC8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231B004: .word DUNGEON_PTR
	arm_func_end ov29_0231AFB4

	arm_func_start ov29_0231B008
ov29_0231B008: ; 0x0231B008
	stmdb sp!, {r3, r4, r5, lr}
	mov lr, #0
	ldr r1, _0231B05C ; =DUNGEON_PTR
	mov r3, lr
	mov r2, #2
	mov ip, lr
_0231B020:
	ldr r0, [r1]
	mov r5, ip
#ifdef JAPAN
	add r0, r0, #0x1840
	add r0, r0, #0x18000
#else
	add r0, r0, #0xe4
	add r0, r0, #0x19800
#endif
	add r4, r0, lr, lsl #4
_0231B034:
	str r3, [r4, r5, lsl #3]
	add r0, r4, r5, lsl #3
	add r5, r5, #1
	str r2, [r0, #4]
	cmp r5, #2
	blt _0231B034
	add lr, lr, #1
	cmp lr, #2
	blt _0231B020
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231B05C: .word DUNGEON_PTR
	arm_func_end ov29_0231B008

	arm_func_start ActivateMotorDrive
ActivateMotorDrive: ; 0x0231B060
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
#ifdef JAPAN
	mov ip, #0x66
	mov r4, r0
	rsb r2, ip, #0x9e0
#else
	ldr r2, _0231B0A0 ; =0x00000C3B
	mov ip, #0x66
	mov r4, r0
#endif
	mov r1, #0
	mov r3, #2
	str ip, [sp]
	bl LogMessageByIdWithPopupCheckParticipants
	mov r0, r4
	mov r1, r4
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifndef JAPAN
_0231B0A0: .word 0x00000C3B
#endif
	arm_func_end ActivateMotorDrive

	arm_func_start TryActivateFrisk
TryActivateFrisk: ; 0x0231B0A4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__0231B194
	cmp r0, #0
	beq _0231B184
	mov r0, r4
	bl EntityIsValid__0231B194
	cmp r0, #0
	beq _0231B184
	ldr r0, [r5, #0xb4]
	ldr r6, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0231B184
	bl ov29_0232E80C
	cmp r4, r0
	ldrneb r0, [r6, #6]
	cmpne r0, #0
	beq _0231B184
	ldrsh r0, [r6, #0x66]
	cmp r0, #0
	bne _0231B150
	ldrsh r0, [r6, #2]
	add r1, sp, #0
	bl GetTreasureBoxChances
	ldrsh r0, [sp, #4]
	cmp r0, #0
	ldrlesh r0, [sp, #6]
	cmple r0, #0
	ble _0231B184
	mov r0, r5
	bl ov29_022E4110
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231B18C ; =0x00000C3D
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231B184
_0231B150:
	mov r0, r5
	bl ov29_022E4110
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	add r1, r6, #0x62
	mov r0, #2
	bl ov29_02344B44
	ldr r2, _0231B190 ; =0x00000C3C
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_0231B184:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0231B18C: .word 0x0000097C
_0231B190: .word 0x0000097B
#else
_0231B18C: .word 0x00000C3D
_0231B190: .word 0x00000C3C
#endif
	arm_func_end TryActivateFrisk
