	.include "asm/macros.inc"
	.include "overlay_29_0230F9A4.inc"

	.text

	arm_func_start ov29_0230F9A4
ov29_0230F9A4: ; 0x0230F9A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__0230F980
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_0234908C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0230F9A4

	arm_func_start TrySpawnEnemyItemDrop
TrySpawnEnemyItemDrop: ; 0x0230F9D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _0230FB28 ; =DUNGEON_PTR
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	ldrb r0, [r0, #0x748]
	bl TreasureBoxDropsEnabled
	cmp r0, #0
	ldrne r4, [r5, #0xb4]
	ldrneb r0, [r4, #6]
	cmpne r0, #0
	beq _0230FB20
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #1
	bne _0230FA54
	mov r0, r6
	mov r1, #0x43
	bl IqSkillIsEnabled
	cmp r0, #0
	addne r0, r7, #1
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	mov r0, r6
	mov r1, #0x56
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	addne r0, r7, #1
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
_0230FA54:
	ldrsh r1, [r4, #2]
	add r0, sp, #0
	mov r2, r7
	bl TryGenerateUnownStoneDrop
	cmp r0, #0
	beq _0230FA84
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
	b _0230FB20
_0230FA84:
	mov r0, r6
	mov r1, #0x75
	bl AbilityIsActiveVeneer
	mov r2, r0
	add r0, sp, #0
	mov r1, r5
	mov r3, r7
	bl ov29_023460DC
	cmp r0, #0
	beq _0230FAC4
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
	b _0230FB20
_0230FAC4:
	mov r0, r6
	bl IsMonster__0230F980
	cmp r0, #0
	beq _0230FB20
	mov r0, r6
	mov r1, #0x62
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	beq _0230FB20
	ldr r0, _0230FB2C ; =ov10_022C4650
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230FB20
	add r0, sp, #0
	mov r1, #0xb7
	mov r2, #2
	bl GenerateStandardItem
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
_0230FB20:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230FB28: .word DUNGEON_PTR
_0230FB2C: .word ov10_022C4650
	arm_func_end TrySpawnEnemyItemDrop

	arm_func_start ov29_0230FB30
ov29_0230FB30: ; 0x0230FB30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230FB88 ; =ov29_023529A8
	mov r5, r0
	ldrh r2, [r1]
	add r0, sp, #0
	strh r2, [sp]
	ldrh r1, [r1, #2]
	strh r1, [sp, #2]
	bl ov29_02347184
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0230FB8C ; =0x00000F62
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FB88: .word ov29_023529A8
#ifdef JAPAN
_0230FB8C: .word 0x000009B6
#else
_0230FB8C: .word 0x00000F62
#endif
	arm_func_end ov29_0230FB30

	arm_func_start TickNoSlipCap
TickNoSlipCap: ; 0x0230FB90
#ifdef JAPAN
#define TICK_NO_SLIP_CAP_OFFSET -1
#else
#define TICK_NO_SLIP_CAP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0230FBB8
	mov r0, r5
	mov r1, #0xd
	bl HasHeldItem
_0230FBB8:
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	add r1, r0, #1
	and r0, r1, #0xff
	cmp r0, #0x14
	strb r1, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	movhs r0, #0x13
	strhsb r0, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	mov r0, #0x64
	bl DungeonRandInt
	ldrb r2, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	ldr r1, _0230FC20 ; =ov10_022C4BE4
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	cmp r0, r1
	ldmgeia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ov29_0230FB30
	mov r0, #0
	strb r0, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FC20: .word ov10_022C4BE4
	arm_func_end TickNoSlipCap

	arm_func_start ov29_0230FC24
ov29_0230FC24: ; 0x0230FC24
#ifdef JAPAN
#define OV29_0230FC24_OFFSET -4
#define OV29_0230FC24_OFFSET_2 -0xA4
#define OV29_0230FC24_OFFSET_3 -1
#else
#define OV29_0230FC24_OFFSET 0
#define OV29_0230FC24_OFFSET_2 0
#define OV29_0230FC24_OFFSET_3 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x34
	movs r5, r0
	beq _02310FF4
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r4, [r5, #0xb4]
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0x150 + OV29_0230FC24_OFFSET]
	bl ov29_022FB718
	bl ov29_0234B294
	mov r0, r5
	bl TryWeatherFormChange
	mov r0, r5
	mov r1, #0x1d
	bl ItemIsActive__02311034
	cmp r0, #0
	beq _0230FD0C
	ldrb r0, [r4, #0x17c + OV29_0230FC24_OFFSET]
	add r1, r0, #1
	and r0, r1, #0xff
	cmp r0, #0x14
	strb r1, [r4, #0x17c + OV29_0230FC24_OFFSET]
	movhs r0, #0x13
	strhsb r0, [r4, #0x17c + OV29_0230FC24_OFFSET]
	mov r0, #0x64
	bl DungeonRandInt
	ldrb r2, [r4, #0x17c + OV29_0230FC24_OFFSET]
	ldr r1, _02310A6C ; =ov10_022C4BBC
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bge _0230FD0C
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0x17c + OV29_0230FC24_OFFSET]
	bl ov29_022EC62C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r2, #0
	mov r0, r5
	mov r1, r5
	mov r3, r2
	bl TryWarp
	mov r0, r5
	bl ov29_022F42F8
_0230FD0C:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0231013C
	mov r0, r5
	mov r1, #0x1e
	mov r7, #0xa
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, r7
	moveq r2, #0
	mov r0, r5
	mov r1, #0x26
	sub r7, r7, r2
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x10
	sub r7, r7, r2
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r5
	mov r1, #0x22
	subne r7, r7, #1
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x11
	add r7, r7, r2
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x32
	add r7, r7, r2
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x59
	add r7, r7, r2
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	adds r7, r7, r0
	movmi r7, #0
	ldr r3, _02310A70 ; =0x0000199A
	cmp r7, #0x13
	mov r6, #0
	ldr r2, _02310A74 ; =ov10_022C4FC4
	movgt r7, #0x13
	add r0, sp, #0x2c
	add r1, sp, #0x24
	str r6, [sp, #0x24]
	str r3, [sp, #0x28]
	add r2, r2, r7, lsl #3
	bl MultiplyFixedPoint64
	ldrb r2, [r4, #0x15d + OV29_0230FC24_OFFSET]
	cmp r2, #1
	ldrhi r0, _02310A78 ; =ov10_022C4A5C
	ldrhi r1, [sp, #0x30]
	ldrhi r0, [r0, r2, lsl #2]
	addhi r0, r1, r0, lsl #16
	strhi r0, [sp, #0x30]
	mov r0, #0
	strb r0, [r4, #0x15d + OV29_0230FC24_OFFSET]
	add r0, r4, #0x100
	ldrh r2, [r0, #0x46 + OV29_0230FC24_OFFSET]
	ldrh r1, [r0, #0x48 + OV29_0230FC24_OFFSET]
	add r0, sp, #0x2c
	strh r2, [sp, #0x20]
	strh r1, [sp, #0x22]
	bl BinToDecFixedPoint
	strh r0, [sp, #0x14]
	mov r0, r0, lsr #0x10
	add r1, r4, #0x100
	strh r0, [sp, #0x16]
	ldrh r0, [r1, #0x46 + OV29_0230FC24_OFFSET]
	sub r3, sp, #4
	ldrh r2, [sp, #0x14]
	strh r0, [r3]
	ldrh r0, [r1, #0x48 + OV29_0230FC24_OFFSET]
	ldrh r1, [sp, #0x16]
	strh r0, [r3, #2]
	ldr r0, [r3]
	strh r2, [r3]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #0x10]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x12]
	ldrh r1, [sp, #0x10]
	add r0, r4, #0x100
	ldrh r3, [sp, #0x12]
	strh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	ldrh r2, [sp, #0x20]
	strh r3, [r0, #0x48 + OV29_0230FC24_OFFSET]
	sub r0, sp, #4
	ldrh r1, [sp, #0x22]
	strh r2, [r0]
	mov r6, #0
	strh r1, [r0, #2]
	ldr r0, [r0]
	mov r7, #1
	bl CeilFixedPoint
	cmp r0, #0x14
	blt _0230FEFC
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_0230FC24_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0x14
	ldrlt r6, _02310A7C ; =0x00000DE6
_0230FEFC:
	ldrh r1, [sp, #0x20]
	ldrh r0, [sp, #0x22]
	sub r2, sp, #4
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	blt _0230FF48
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_0230FC24_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	ldrlt r6, _02310A80 ; =0x00000DE7
_0230FF48:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_0230FC24_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _0230FF98
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp, #0xc]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xe]
	ldrh r2, [sp, #0xc]
	add r0, r4, #0x100
	ldrh r1, [sp, #0xe]
	strh r2, [r0, #0x46 + OV29_0230FC24_OFFSET]
	strh r1, [r0, #0x48 + OV29_0230FC24_OFFSET]
_0230FF98:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_0230FC24_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bge _0230FFE8
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp, #8]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	ldrh r2, [sp, #8]
	add r0, r4, #0x100
	ldrh r1, [sp, #0xa]
	strh r2, [r0, #0x46 + OV29_0230FC24_OFFSET]
	strh r1, [r0, #0x48 + OV29_0230FC24_OFFSET]
_0230FFE8:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_0230FC24_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _023100D8
	bl ov29_022F2FE4
	mov r0, r5
	bl ov29_022EC62C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r0, _02310A84 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x799]
	cmp r0, #0xa
	addlo r0, r0, #1
	strlob r0, [r1, #0x799]
	ldr r0, _02310A84 ; =DUNGEON_PTR
	mov r1, r5
	ldr r0, [r0]
	ldrb r0, [r0, #0x799]
	cmp r0, #1
	ldreq r6, _02310A88 ; =0x00000DE8
	cmp r0, #2
	ldreq r6, _02310A8C ; =0x00000DE9
	moveq r7, #0
	cmp r0, #3
	mov r0, r5
	ldreq r6, _02310A90 ; =0x00000DEA
	moveq r7, #0
	bl ov29_02307BDC
	mov r0, r5
	mov r1, #1
	mov r2, #0xe
	mov r3, #0x250
	bl ApplyDamageAndEffectsWrapper
	mov r0, #1
	strb r0, [r4, #0x150 + OV29_0230FC24_OFFSET]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_0230FC24_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_0230FC24_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	movne r6, #0
	b _023100E8
_023100D8:
	ldr r0, _02310A84 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x799]
_023100E8:
	cmp r6, #0
	beq _0231013C
	cmp r7, #0
	beq _02310124
#if defined(EUROPE)
	mov r0, r5
	bl ov29_022E34A8_EU
#elif defined(JAPAN)
	mov r0, r5
	bl EntityIsValid__02311010
#else
	ldr r0, _02310A84 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _02310124
	mov r0, r5
	bl EntityIsValid__02311010
#endif
	cmp r0, #0
	beq _02310124
	ldr r0, _02310A94 ; =0x00001303
	bl ov29_022EACCC
_02310124:
	mov r0, r5
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x1e
	mov r1, #0x32
	bl ov29_022EA370
_0231013C:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r0, _02310A84 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5a + OV29_0230FC24_OFFSET_2]
	cmp r0, #0
	bne _0231037C
	mov r0, r5
	bl GetApparentWeather
	cmp r0, #5
	mov r0, r5
	bne _023101FC
	mov r1, #0x77
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #0x4d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	ldr r0, _02310A9C ; =ov10_022C46EC
	ldr r3, _02310AA0 ; =0x0000025F
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0x12
	bl ApplyDamageAndEffectsWrapper
	b _02310360
_023101FC:
	bl GetApparentWeather
	cmp r0, #2
	mov r0, r5
	bne _02310298
	mov r1, #0x1d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #9
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #0xd
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #0x11
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	ldr r0, _02310A9C ; =ov10_022C46EC
	ldr r3, _02310AA0 ; =0x0000025F
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0x12
	bl ApplyDamageAndEffectsWrapper
	b _02310360
_02310298:
	bl GetApparentWeather
	cmp r0, #1
	bne _02310360
	mov r0, r5
	mov r1, #0x5a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310304
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	mov r0, #2
	mov r1, #0x5a
	bl ov29_0234B084
	ldr r0, _02310A9C ; =ov10_022C46EC
	mov r2, #0x19
	ldrsh r1, [r0]
	mov r0, r5
	rsb r3, r2, #0x278
	bl ApplyDamageAndEffectsWrapper
	b _02310360
_02310304:
	mov r0, r5
	mov r1, #0x55
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310360
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	mov r0, #2
	mov r1, #0x55
	bl ov29_0234B084
	ldr r0, _02310A9C ; =ov10_022C46EC
	ldr r3, _02310AA0 ; =0x0000025F
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0x1a
	bl ApplyDamageAndEffectsWrapper
_02310360:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_0231037C:
	mov r0, #0x64
	bl DungeonRandInt
	mov r6, r0
	mov r0, r5
	mov r1, #0x21
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023103F8
	ldr r0, _02310AA4 ; =ov10_022C46A0
	ldrsh r0, [r0]
	cmp r6, r0
	bge _023103F8
	mov r0, r5
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	beq _023103F8
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl EndNegativeStatusConditionWrapper
_023103F8:
	mov r0, r5
	mov r1, #0x51
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310474
	mov r0, r5
	bl GetApparentWeather
	cmp r0, #4
	bne _02310474
	mov r0, r5
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	ldrneb r0, [r4, #0xc4]
	cmpne r0, #3
	beq _02310474
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r3, #0
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r3, [sp]
	bl EndNegativeStatusCondition
_02310474:
	mov r0, r5
	mov r1, #0xb
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023104C0
	ldrb r1, [r4, #0x11f + OV29_0230FC24_OFFSET]
	ldr r0, _02310AA8 ; =SPEED_BOOST_TURNS
	add r2, r1, #1
	ldrsh r0, [r0]
	and r1, r2, #0xff
	strb r2, [r4, #0x11f + OV29_0230FC24_OFFSET]
	cmp r1, r0
	blt _023104C0
	mov r3, #0
	mov r0, r5
	mov r1, r5
	mov r2, #0x7f
	strb r3, [r4, #0x11f + OV29_0230FC24_OFFSET]
	bl BoostSpeedOneStage
_023104C0:
	ldrb r0, [r4, #0xbd]
	cmp r0, #4
	bne _023104F8
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	bl ov29_022E53F0
_023104F8:
	ldrb r0, [r4, #0xbf]
	cmp r0, #1
	bne _02310590
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xc1]
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	bne _02310574
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AAC ; =BURN_DAMAGE_COOLDOWN
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xc1]
	bl ov29_02307BDC
	ldr r0, _02310AB0 ; =BURN_DAMAGE
	mov r2, #1
	ldrsh r1, [r0]
	mov r0, r5
	rsb r3, r2, #0x248
	bl ApplyDamageAndEffectsWrapper
_02310574:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310590:
	bl GravityIsActive
	cmp r0, #0
	beq _023105DC
	mov r0, r5
	bl IsFloating
	cmp r0, #0
	beq _023105C0
	mov r0, r5
	mov r1, r5
	bl EndMagnetRiseStatus
	mov r0, r5
	bl EnsureCanStandCurrentTile
_023105C0:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_023105DC:
	mov r0, r5
	mov r1, #0x69
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310614
	mov r0, r5
	bl TryActivateBadDreams
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310614:
	mov r0, r5
	bl GetTileAtEntity
	bl ov29_02337E2C
	cmp r0, #0
	bne _023106A4
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02310AB4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	bge _0231067C
	mov r0, r5
	mov r1, #0x64
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	beq _0231067C
	ldr r0, _02310AB8 ; =ov10_022C4664
	mov r3, #0
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	str r3, [sp]
	bl TryIncreaseHp
_0231067C:
	mov r0, r5
	mov r1, #0x65
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	beq _023106A4
	mov r2, #1
	mov r0, r5
	mov r1, r5
	mov r3, r2
	bl EndNegativeStatusConditionWrapper
_023106A4:
	mov r0, r5
	mov r1, #0x5c
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	beq _02310754
	mov sl, #0
	ldr r6, _02310A84 ; =DUNGEON_PTR
	mov sb, sl
	mov r7, #1
_023106C8:
	ldr r0, [r6]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28 + OV29_0230FC24_OFFSET_2]
	mov r0, r8
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310718
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xbf]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02310718
	mov r0, r8
	bl ov29_022E543C
	mov r0, r8
	mov r1, r8
	bl EndBurnClassStatus
	mov sl, r7
_02310718:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _023106C8
	cmp sl, #0
	beq _02310754
	ldr r0, _02310ABC ; =ov10_022C464C
	mov r6, #1
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_02310754:
	ldrb r0, [r4, #0xbf]
	cmp r0, #2
	bne _02310830
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xc1]
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	bne _02310810
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r4, #0xbf]
	cmpeq r0, #2
	bne _02310FF4
	ldr r1, _02310AC0 ; =POISON_DAMAGE_COOLDOWN
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xc1]
	bl ov29_02307BDC
	mov r0, r5
	mov r1, #0x72
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023107F8
	ldr r0, _02310AC4 ; =POISON_DAMAGE
	mov r6, #1
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
	b _02310810
_023107F8:
	ldr r0, _02310AC4 ; =POISON_DAMAGE
	mov r2, #3
	ldrsh r1, [r0]
	mov r0, r5
	rsb r3, r2, #0x24c
	bl ApplyDamageAndEffectsWrapper
_02310810:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	beq _0231092C
	b _02310FF4
_02310830:
	cmp r0, #3
	bne _0231092C
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xc1]
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	bne _02310910
	ldrb r6, [r4, #0xc2]
	cmp r6, #0x1d
	addlo r0, r6, #1
	strlob r0, [r4, #0xc2]
	ldr r0, _02310AC8 ; =BAD_POISON_DAMAGE_COOLDOWN
	cmp r6, #0x1d
	ldrsh r0, [r0]
	movge r6, #0x1d
	cmp r6, #0
	strb r0, [r4, #0xc1]
	mov r0, #0
	movlt r6, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r4, #0xbf]
	cmpeq r0, #3
	bne _02310FF4
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	mov r0, r5
	mov r1, #0x72
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023108F4
	ldr r0, _02310ACC ; =BAD_POISON_DAMAGE_TABLE
	mov r1, r6, lsl #1
	ldrsh r2, [r0, r1]
	mov r6, #1
	mov r0, r5
	mov r1, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
	b _02310910
_023108F4:
	ldr r0, _02310ACC ; =BAD_POISON_DAMAGE_TABLE
	mov r1, r6, lsl #1
	ldrsh r1, [r0, r1]
	mov r2, #3
	mov r0, r5
	rsb r3, r2, #0x24c
	bl ApplyDamageAndEffectsWrapper
_02310910:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_0231092C:
	ldrb r0, [r4, #0xc4]
	cmp r0, #7
	bne _023109D4
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xcd]
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	bne _023109B4
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AD0 ; =ov10_022C4454
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xcd]
	bl ov29_02307BDC
	ldr r1, [r4, #0xc8]
	mov r0, r5
	bl PlayEffectAnimationEntityStandard
	ldr r1, _02310AD4 ; =ov10_022C446C
	mov r0, r5
	ldrsh r1, [r1]
	mov r2, #2
	mov r3, #0x248
	bl ApplyDamageAndEffectsWrapper
_023109B4:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	beq _02310B6C
	b _02310FF4
_023109D4:
	cmp r0, #4
	bne _02310AF8
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xcd]
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	bne _02310A4C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AD8 ; =ov10_022C45F0
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xcd]
	bl ov29_02307BDC
	ldr r0, _02310ADC ; =ov10_022C45D0
	ldr r3, _02310AE0 ; =0x0000024A
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #5
	bl ApplyDamageAndEffectsWrapper
_02310A4C:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	beq _02310B6C
	b _02310FF4
	.align 2, 0
#ifdef JAPAN
#define OV29_0230FC24_DATA_OFFSET -0x2C0
#else
#define OV29_0230FC24_DATA_OFFSET 0
#endif
_02310A6C: .word ov10_022C4BBC
_02310A70: .word 0x0000199A
_02310A74: .word ov10_022C4FC4
_02310A78: .word ov10_022C4A5C
_02310A7C: .word 0x00000DE6 + OV29_0230FC24_DATA_OFFSET
_02310A80: .word 0x00000DE7 + OV29_0230FC24_DATA_OFFSET
_02310A84: .word DUNGEON_PTR
_02310A88: .word 0x00000DE8 + OV29_0230FC24_DATA_OFFSET
_02310A8C: .word 0x00000DE9 + OV29_0230FC24_DATA_OFFSET
_02310A90: .word 0x00000DEA + OV29_0230FC24_DATA_OFFSET
_02310A94: .word 0x00001303
_02310A98: .word 0x00000DBD + OV29_0230FC24_DATA_OFFSET
_02310A9C: .word ov10_022C46EC
_02310AA0: .word 0x0000025F
_02310AA4: .word ov10_022C46A0
_02310AA8: .word SPEED_BOOST_TURNS
_02310AAC: .word BURN_DAMAGE_COOLDOWN
_02310AB0: .word BURN_DAMAGE
_02310AB4: .word 0x000003E7
_02310AB8: .word ov10_022C4664
_02310ABC: .word ov10_022C464C
_02310AC0: .word POISON_DAMAGE_COOLDOWN
_02310AC4: .word POISON_DAMAGE
_02310AC8: .word BAD_POISON_DAMAGE_COOLDOWN
_02310ACC: .word BAD_POISON_DAMAGE_TABLE
_02310AD0: .word ov10_022C4454
_02310AD4: .word ov10_022C446C
_02310AD8: .word ov10_022C45F0
_02310ADC: .word ov10_022C45D0
_02310AE0: .word 0x0000024A
_02310AE4: .word ov10_022C45E8
_02310AE8: .word ov10_022C4590
_02310AEC: .word ov10_022C44BC
_02310AF0: .word LEECH_SEED_DAMAGE_COOLDOWN
_02310AF4: .word LEECH_SEED_HP_DRAIN
_02310AF8:
	cmp r0, #5
	bne _02310B6C
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xcd]
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	bne _02310B6C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AE4 ; =ov10_022C45E8
	ldr r0, _02310AE8 ; =ov10_022C4590
	ldrsh r3, [r1]
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	strb r3, [r4, #0xcd]
	mov r6, #1
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_02310B6C:
	ldrb r0, [r4, #0xd8]
	cmp r0, #1
	bne _02310C28
	ldrb r0, [r4, #0xdc]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xdc]
	ldrb r0, [r4, #0xdc]
	cmp r0, #0
	bne _02310C0C
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02310AB4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	ldr r1, _02310AEC ; =ov10_022C44BC
	movs r6, r0, asr #2
	ldrsh r1, [r1]
	mov r0, #0
	addeq r6, r6, #1
	strb r1, [r4, #0xdc]
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	mov r2, #7
	mov r0, r5
	mov r1, r6
	add r3, r2, #0x244
	bl ApplyDamageAndEffectsWrapper
_02310C0C:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310C28:
	ldrb r0, [r4, #0xe0]
	cmp r0, #1
	bne _02310DE0
	ldrb r0, [r4, #0xea]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xea]
	ldrb r0, [r4, #0xea]
	cmp r0, #0
	bne _02310DC4
	ldr r0, _02310A84 ; =DUNGEON_PTR
	ldrb r2, [r4, #0xe8]
	ldr r0, [r0]
	ldr r1, _02310AF0 ; =LEECH_SEED_DAMAGE_COOLDOWN
	add r0, r0, r2, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78 + OV29_0230FC24_OFFSET_2]
	ldrsh r1, [r1]
	ldr r0, _02310AF4 ; =LEECH_SEED_HP_DRAIN
	cmp r7, #0
	ldrsh r6, [r0]
	strb r1, [r4, #0xea]
	moveq r0, #0
	streqb r0, [r4, #0xe0]
	beq _02310DC4
	ldr r0, [r7, #0xb4]
	ldr r1, [r4, #0xe4]
	ldr r0, [r0, #0xb0]
	cmp r1, r0
	movne r0, #0
	strneb r0, [r4, #0xe0]
	bne _02310DC4
	cmp r7, r5
	beq _02310CF0
	cmp r7, #0
	moveq r0, #0
	beq _02310CD0
	ldr r0, [r7]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_02310CD0:
	cmp r0, #0
	beq _02310CF0
	mov r0, r7
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r8, #0
	bne _02310D00
_02310CF0:
	mov r0, r5
	mov r1, #0x3a
	bl AbilityIsActiveVeneer
	mov r8, r0
_02310D00:
	mov r0, r5
	bl ov29_022EC62C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	mov r0, r7
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldrb r0, [r4, #0xc4]
	cmp r0, #1
	beq _02310DC4
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	mov r0, r5
	mov r1, r6
	mov r2, #9
	mov r3, #0x24c
	bl ApplyDamageAndEffectsWrapper
	cmp r8, #0
	beq _02310D94
	mov r0, r7
	mov r1, r7
	bl ov29_02307BDC
	mov r2, #0xd
	mov r0, r7
	mov r1, r6
	add r3, r2, #0x22c
	bl ApplyDamageAndEffectsWrapper
	b _02310DC4
_02310D94:
	mov r0, r5
	mov r1, #0x73
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310DC4
	mov r8, #1
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, #0
	str r8, [sp]
	bl TryIncreaseHp
_02310DC4:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310DE0:
	ldrb r0, [r4, #0x106 + OV29_0230FC24_OFFSET_3]
	cmp r0, #0
	beq _02310E9C
	add r0, r4, #6 + OV29_0230FC24_OFFSET_3
	add r0, r0, #0x100
	bl TickStatusTurnCounter
	ldrb r0, [r4, #0x106 + OV29_0230FC24_OFFSET_3]
	cmp r0, #0
	bne _02310E9C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02310FFC ; =0x00000DEB
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	ldrb r0, [r4, #0xd5]
	cmp r0, #7
	bne _02310E6C
	ldr r1, _02311000 ; =0x00000DEC
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02310E80
_02310E6C:
	mov r2, #0xb
	ldr r1, _02311004 ; =0x0000270F
	mov r0, r5
	rsb r3, r2, #0x258
	bl ApplyDamageAndEffectsWrapper
_02310E80:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310E9C:
	ldrb r0, [r4, #0xd2]
	cmp r0, #1
	bne _02310F70
	add r0, r4, #0xd3
	bl TickStatusTurnCounter
	ldrb r0, [r4, #0xd3]
	cmp r0, #0
	bne _02310F70
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xd2]
	bl CheckVariousStatuses2
	cmp r0, #0
	bne _02310F70
	mov r0, r5
	mov r1, #0
	bl MonsterCannotAttack
	cmp r0, #0
	bne _02310F70
	mov r0, r5
	bl CheckVariousStatuses
	cmp r0, #0
	bne _02310F70
	mov r0, #0
	bl DisplayActions
	ldrh r0, [r4, #0xac]
	cmp r0, #0
	ldreq r0, _02311008 ; =0x00000165
	streqh r0, [r4, #0xac]
	ldrh r1, [r4, #0xac]
	add r0, sp, #0x18
	bl InitMove
	mov r1, #0
	ldrb r0, [sp, #0x18]
	add r6, sp, #0x18
	mov r2, r1
	orr r0, r0, #0x10
	strb r0, [sp, #0x18]
	mov r0, r5
	mov r3, r1
	stmia sp, {r1, r6}
	bl ov29_02322374
	mov r1, #0
	mov r0, r5
	strh r1, [r4, #0xac]
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, #0
	str r0, [r4, #0xb8]
_02310F70:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldrb r0, [r4, #0xd2]
	cmp r0, #0xc
	bne _02310FD0
	add r0, r4, #0xd3
	bl TickStatusTurnCounter
	ldrb r0, [r4, #0xd3]
	cmp r0, #0
	bne _02310FD0
	mov r0, #0
	strb r0, [r4, #0xd2]
	mov r1, r5
	mov r2, r0
	strb r0, [r4, #0x154 + OV29_0230FC24_OFFSET]
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231100C ; =0x00000CBA
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_02310FD0:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	bl TickNoSlipCap
_02310FF4:
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02310FFC: .word 0x00000DEB + OV29_0230FC24_DATA_OFFSET
_02311000: .word 0x00000DEC + OV29_0230FC24_DATA_OFFSET
_02311004: .word 0x0000270F
_02311008: .word 0x00000165
_0231100C: .word 0x00000CBA + OV29_0230FC24_DATA_OFFSET
	arm_func_end ov29_0230FC24
