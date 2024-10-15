	.include "asm/macros.inc"
	.include "overlay_29_0231FC20.inc"

	.text

	arm_func_start TryPounce
TryPounce: ; 0x0231FC20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	mov r6, r0
	mov r5, r2
	cmp r6, sl
	ldr r4, [sl, #0xb4]
	beq _0231FC7C
	cmp r6, #0
	moveq r0, #0
	beq _0231FC5C
	ldr r0, [r6]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_0231FC5C:
	cmp r0, #0
	beq _0231FC7C
	mov r0, r6
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0231FC88
_0231FC7C:
	mov r0, sl
	mov r1, #0xe
	bl AbilityIsActiveVeneer
_0231FC88:
	cmp r0, #0
	beq _0231FCB4
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231FDD0 ; =0x00000E56
	mov r0, r6
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231FCB4:
	ldr r0, _0231FDD4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreTileJumpsAllowed
	cmp r0, #0
	bne _0231FCE4
	ldr r2, _0231FDD8 ; =0x00000E55
	mov r0, r6
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231FCE4:
	cmp r5, #8
	ldreqb r5, [r4, #0x4c]
	mov r0, sl
	mov r1, #6
	mov r2, r5
	bl ChangeMonsterAnimation
	ldr r1, _0231FDDC ; =DIRECTIONS_XY
	mov r2, r5, lsl #2
	add r0, r1, r5, lsl #2
	mov r5, #0
	ldrsh r8, [r1, r2]
	ldrsh sb, [r0, #2]
	mov r4, r5
	mov fp, #0x3a
_0231FD1C:
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	add r0, r0, r8
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r1, r1, sb
	mov r0, r1, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r6, #0
	cmpgt r7, #0
	ble _0231FDB4
	cmp r6, #0x37
	cmplt r7, #0x1f
	bge _0231FDB4
	mov r0, r6
	mov r1, r7
	bl GetTile
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _0231FDB4
	ldrh r0, [r0]
	tst r0, #3
	beq _0231FDB4
	mov r0, sl
	mov r1, r6
	mov r2, r7
	mov r3, r5
	bl MoveMonsterToPos
	mov r0, sl
	mov r1, r4
	bl UpdateEntityPixelPos
	mov r0, sl
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0231FD1C
	mov r0, fp
	bl AdvanceFrame
	b _0231FD1C
_0231FDB4:
	mov r0, sl
	bl ov29_022F9C74
	mov r0, sl
	bl EnsureCanStandCurrentTile
	mov r0, sl
	bl ov29_0232124C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_0231FDD0: .word 0x00000B98
_0231FDD4: .word DUNGEON_PTR
_0231FDD8: .word 0x00000B97
#else
_0231FDD0: .word 0x00000E56
_0231FDD4: .word DUNGEON_PTR
_0231FDD8: .word 0x00000E55
#endif
_0231FDDC: .word DIRECTIONS_XY
	arm_func_end TryPounce

	arm_func_start TryBlowAway
TryBlowAway: ; 0x0231FDE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r3, _02320154 ; =DUNGEON_PTR
	mov sl, r0
	ldr r0, [r3]
	mov sb, r1
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	mov r1, #0xa
	mov r4, r2
	str r1, [sp, #0x20]
	mov fp, #0
	bl AreTileJumpsAllowed
	cmp r0, #0
	bne _0231FE30
	ldr r2, _02320158 ; =0x00000B97
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232014C
_0231FE30:
	cmp sl, sb
	mov r0, fp
	mov r1, sb
	bne _0231FE5C
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232015C ; =0x00000B98
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232014C
_0231FE5C:
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp sl, sb
	beq _0231FEAC
	cmp sl, #0
	moveq r0, fp
	beq _0231FE8C
	ldr r0, [sl]
	cmp r0, #1
	moveq r0, #1
	movne r0, fp
	and r0, r0, #0xff
_0231FE8C:
	cmp r0, #0
	beq _0231FEAC
	mov r0, sl
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0231FEB8
_0231FEAC:
	mov r0, sb
	mov r1, #0xe
	bl AbilityIsActiveVeneer
_0231FEB8:
	cmp r0, #0
	beq _0231FED4
	ldr r2, _02320160 ; =0x00000B99
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232014C
_0231FED4:
	add r0, r4, #4
	and r2, r0, #7
	ldr r3, [sb, #0xb4]
	mov r0, sb
	mov r1, #6
	strb r2, [r3, #0x4c]
	bl ChangeMonsterAnimation
	ldr r1, _02320164 ; =0x00000212
	mov r0, sb
	bl ov29_022E56A0
	ldr r2, _02320168 ; =0x00000B96
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r1, _0232016C ; =DIRECTIONS_XY
	mov r2, r4, lsl #2
	add r0, r1, r4, lsl #2
	ldrsh r8, [r1, r2]
	ldrsh r7, [r0, #2]
	mov r5, #1
	mov r4, #0
_0231FF28:
	ldrh r0, [sb, #4]
	strh r0, [sp, #0x2c]
	ldrh r1, [sb, #6]
	ldrsh r0, [sp, #0x2c]
	strh r1, [sp, #0x2e]
	add r0, r0, r8
	strh r0, [sp, #0x2c]
	ldrsh r0, [sp, #0x2e]
	ldrsh r1, [sp, #0x2c]
	add r0, r0, r7
	strh r0, [sp, #0x2e]
	cmp r1, #0
	ldrgesh r0, [sp, #0x2e]
	cmpge r0, #0
	blt _0232003C
	cmp r1, #0x38
	cmplt r0, #0x20
	bge _0232003C
	mov r0, r7, lsl #0xa
	str r0, [sp, #0x1c]
	mov r0, r8, lsl #0xa
	str r0, [sp, #0x18]
	mov r6, #0
_0231FF84:
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	mov r0, sb
	bl IncrementEntityPixelPosXY
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _0231FFAC
	mov r0, #0x19
	bl AdvanceFrame
_0231FFAC:
	add r6, r6, #1
	cmp r6, #6
	blt _0231FF84
	ldrsh r0, [sp, #0x2c]
	ldrsh r1, [sp, #0x2e]
	bl GetTile
	mov r6, r0
	ldr r0, [r6, #0xc]
	cmp r0, #0
	movne r4, r0
	movne r5, #0
	bne _0232003C
	add r1, sp, #0x2c
	mov r0, sb
	bl ov29_022FFB90
	cmp r0, #0
	beq _02320010
	ldrh r0, [r6]
	tst r0, #3
	moveq r5, #0
	beq _0232003C
	tst r0, #0x13
	movne fp, #1
	mov r5, #1
	b _0232003C
_02320010:
	ldrsh r1, [sp, #0x2c]
	ldrsh r2, [sp, #0x2e]
	mov r0, sb
	mov r3, #1
	bl MoveMonsterToPos
	ldr r0, [sp, #0x20]
	sub r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0
	bgt _0231FF28
	mov r5, #1
_0232003C:
	cmp r5, #0
	bne _02320088
	mov r0, sb
	add r1, sb, #4
	bl ov29_0232033C
	mov r3, #0
	str r3, [sp]
	ldr r0, _02320170 ; =ov10_022C4570
	str r3, [sp, #4]
	mov r1, #0x258
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, sl
	mov r1, sb
	str r3, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0232009C
_02320088:
	cmp fp, #0
	beq _0232009C
	mov r0, sb
	add r1, sb, #4
	bl ov29_0232033C
_0232009C:
	bl IsFloorOver
	cmp r0, #0
	bne _0232014C
	mov r0, r4
	bl EntityIsValid__0232017C
	cmp r0, #0
	beq _02320118
	ldr r1, _02320174 ; =0x00000163
	add r0, sp, #0x24
	bl InitMove
	add r1, sp, #0x24
	mov r0, r4
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _02320118
	mov r0, sl
	mov r1, r4
	bl ov29_02307BDC
	mov r3, #0
	str r3, [sp]
	ldr r0, _02320170 ; =ov10_022C4570
	ldr r1, _02320178 ; =0x00000259
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, sl
	mov r1, r4
	str r3, [sp, #0x14]
	bl CalcDamageFixedNoCategory
_02320118:
	bl IsFloorOver
	cmp r0, #0
	bne _0232014C
	mov r0, sb
	bl EntityIsValid__0232017C
	cmp r0, #0
	beq _0232014C
	mov r0, sb
	bl ov29_022F9C74
	mov r0, sb
	bl EnsureCanStandCurrentTile
	mov r0, sb
	bl ov29_02321238
_0232014C:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_BLOW_AWAY_OFFSET -0x2C1
#else
#define TRY_BLOW_AWAY_OFFSET 0
#endif
_02320154: .word DUNGEON_PTR
_02320158: .word 0x00000B97 + TRY_BLOW_AWAY_OFFSET
_0232015C: .word 0x00000B98 + TRY_BLOW_AWAY_OFFSET
_02320160: .word 0x00000B99 + TRY_BLOW_AWAY_OFFSET
_02320164: .word 0x00000212
_02320168: .word 0x00000B96 + TRY_BLOW_AWAY_OFFSET
_0232016C: .word DIRECTIONS_XY
_02320170: .word ov10_022C4570
_02320174: .word 0x00000163
_02320178: .word 0x00000259
	arm_func_end TryBlowAway
