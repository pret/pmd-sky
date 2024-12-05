	.include "asm/macros.inc"
	.include "overlay_29_02320788.inc"

	.text

	arm_func_start TryAftermathExplosion
TryAftermathExplosion: ; 0x02320788
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sl, r0
	ldr r0, [sp, #0x38]
	mov sb, r1
	str r0, [sp, #0x38]
	str r2, [sp, #4]
	mov r8, r3
	ldr fp, [sp, #0x3c]
	mov r5, #0
	mov r7, #0x15
	ldr r4, _02320A8C ; =DUNGEON_PTR
	b _023207F4
_023207BC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__02320764
	cmp r0, #0
	beq _023207F0
	mov r0, r6
	mov r1, r7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _023207FC
_023207F0:
	add r5, r5, #1
_023207F4:
	cmp r5, #0x14
	blt _023207BC
_023207FC:
	cmp r5, #0x14
	beq _02320834
	mov r0, sl
	mov r1, sb
	bl ov29_022E55F0
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02320A90 ; =0x00000BFC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02320A84
_02320834:
	mov r0, sb
	bl GetApparentWeather
	cmp r0, #4
	bne _02320858
	ldr r2, _02320A90 ; =0x00000BFC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02320A84
_02320858:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl ov29_022E5560
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02320A94 ; =0x00000BFB
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r0, _02320A98 ; =ov29_023529B8
	mov r6, #0
	ldr r4, [r0, r8, lsl #2]
	mov r7, r6
	b _023209EC
_0232089C:
	ldr r0, [sp, #4]
	ldrsh r0, [r0]
	add r0, r1, r0
	strh r0, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrsh r2, [r4, #2]
	ldrsh r1, [r0, #2]
	ldrsh r0, [sp, #0xc]
	add r1, r2, r1
	strh r1, [sp, #0xe]
	cmp r0, #0
	ldrgesh r1, [sp, #0xe]
	cmpge r1, #0
	blt _023209E8
	cmp r0, #0x38
	cmplt r1, #0x20
	bge _023209E8
	bl GetTileSafe
	ldrsh r1, [sp, #0xc]
	mov r5, r0
	cmp r1, #1
	ldrgesh r0, [sp, #0xe]
	cmpge r0, #1
	blt _02320974
	cmp r1, #0x37
	cmplt r0, #0x1f
	bge _02320974
	ldrh r0, [r5]
	tst r0, #3
	bne _02320974
	ldrh r0, [r5]
	tst r0, #0x10
	bne _02320974
	bic r0, r0, #3
	strh r0, [r5]
	ldrh r0, [r5]
	mvn r7, #0
	str r7, [sp, #8]
	orr r0, r0, #1
	strh r0, [r5]
_0232093C:
	ldr r6, [sp, #8]
_02320940:
	ldrsh r0, [sp, #0xc]
	ldrsh r1, [sp, #0xe]
	add r0, r0, r6
	add r1, r1, r7
	bl ov29_02336694
	add r6, r6, #1
	cmp r6, #1
	ble _02320940
	add r7, r7, #1
	cmp r7, #1
	ble _0232093C
	mov r6, #1
	mov r7, r6
_02320974:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _023209A4
	cmp r0, sb
	beq _023209A0
	ldr r0, [r0]
	cmp r0, #3
	bne _023209A0
	add r0, sp, #0xc
	mov r1, #0
	bl RemoveGroundItem
_023209A0:
	mov r6, #1
_023209A4:
	ldr r1, [r5, #0xc]
	cmp r1, #0
	cmpne r1, sb
	beq _023209E8
	ldr r0, [r1]
	cmp r0, #1
	bne _023209E8
	ldr r2, _02320A9C ; =ov29_02353700
	mov r0, sl
	ldr r5, [r2, r8, lsl #2]
	ldr r2, [sp, #0x38]
	mov r3, fp
	str r5, [sp]
	bl ov29_02320BCC
	bl IsFloorOver
	cmp r0, #0
	bne _023209F8
_023209E8:
	add r4, r4, #4
_023209EC:
	ldrsh r1, [r4]
	cmp r1, #0x63
	bne _0232089C
_023209F8:
	bl IsFloorOver
	cmp r0, #0
	bne _02320A84
	ldr r0, [sb]
	cmp r0, #1
	bne _02320A3C
	ldr r0, _02320AA0 ; =0x0000026F
	cmp fp, r0
	beq _02320A3C
	ldr r1, _02320A9C ; =ov29_02353700
	ldr r2, [sp, #0x38]
	ldr r4, [r1, r8, lsl #2]
	mov r0, sl
	mov r1, sb
	mov r3, fp
	str r4, [sp]
	bl ov29_02320BCC
_02320A3C:
	cmp r6, #0
	beq _02320A84
	cmp r7, #0
	beq _02320A7C
	mov r6, #0
	mov r4, r6
_02320A54:
	mov r5, r4
_02320A58:
	mov r0, r5
	mov r1, r6
	bl DetermineTileWalkableNeighbors
	add r5, r5, #1
	cmp r5, #0x38
	blt _02320A58
	add r6, r6, #1
	cmp r6, #0x20
	blt _02320A54
_02320A7C:
	bl UpdateMinimap
	bl UpdateTrapsVisibility
_02320A84:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02320A8C: .word DUNGEON_PTR
#ifdef JAPAN
_02320A90: .word 0x0000093B
_02320A94: .word 0x0000093A
#else
_02320A90: .word 0x00000BFC
_02320A94: .word 0x00000BFB
#endif
_02320A98: .word ov29_023529B8
_02320A9C: .word ov29_02353700
_02320AA0: .word 0x0000026F
	arm_func_end TryAftermathExplosion

	arm_func_start ov29_02320AA4
ov29_02320AA4: ; 0x02320AA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	bl EntityIsValid__02320764
	cmp r0, #0
	beq _02320BC0
	ldr r1, _02320BC8 ; =0x00000163
	add r0, sp, #0x1a
	ldr r4, [r7, #0xb4]
	bl InitMove
	add r1, sp, #0x1a
	mov r0, r7
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _02320BC0
	ldrb r0, [r4, #6]
	mov r1, #2
	cmp r0, #0
	bne _02320B2C
	ldrsh r2, [r4, #0x10]
	mov r0, r7
	add r2, r2, r2, lsr #31
	mov r4, r2, asr #1
	bl MonsterIsType
	cmp r0, #0
	addne r0, r4, r4, lsr #31
	movne r4, r0, asr #1
	cmp r4, #1
	movlt r4, #1
	b _02320B44
_02320B2C:
	mov r0, r7
	ldr r4, [sp, #0x40]
	bl MonsterIsType
	cmp r0, #0
	addne r0, r4, r4, lsr #31
	movne r4, r0, asr #1
_02320B44:
	mov ip, #7
	mov r0, r8
	mov r1, r7
	mov r2, #1
#ifdef JAPAN
	mov r3, #0xb00
#else
	mov r3, #0xdc0
#endif
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r4, #1
	bne _02320B94
	mov r2, #1
	mov ip, #6
	mov r0, r8
	mov r1, r7
#ifdef JAPAN
	rsb r3, r2, #0xb00
#else
	rsb r3, r2, #0xdc0
#endif
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	addne r0, r4, r4, lsr #31
	movne r4, r0, asr #1
_02320B94:
	add r0, sp, #0x18
	stmia sp, {r0, r6}
	mov r3, #0
	str r5, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #0x14]
	bl CalcDamageFixedNoCategory
_02320BC0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02320BC8: .word 0x00000163
	arm_func_end ov29_02320AA4

	arm_func_start ov29_02320BCC
ov29_02320BCC: ; 0x02320BCC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r1
	mov sb, r0
	mov r0, r8
	mov r7, r2
	mov r6, r3
	bl EntityIsValid__02320764
	cmp r0, #0
	beq _02320CFC
	ldr r1, _02320D04 ; =0x00000163
	add r0, sp, #0x1a
	ldr r5, [r8, #0xb4]
	bl InitMove
	add r1, sp, #0x1a
	mov r0, r8
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _02320CFC
	ldrb r0, [r5, #6]
	mov r1, #2
	cmp r0, #0
	bne _02320C54
	ldrsh r2, [r5, #0x10]
	mov r0, r8
	add r2, r2, r2, lsr #31
	mov r4, r2, asr #1
	bl MonsterIsType
	cmp r0, #0
	addne r0, r4, r4, lsr #31
	movne r4, r0, asr #1
	cmp r4, #1
	movlt r4, #1
	b _02320C6C
_02320C54:
	mov r0, r8
	ldr r4, [sp, #0x40]
	bl MonsterIsType
	cmp r0, #0
	addne r0, r4, r4, lsr #31
	movne r4, r0, asr #1
_02320C6C:
	mov ip, #7
	mov r0, sb
	mov r1, r8
	mov r2, #1
#ifdef JAPAN
	mov r3, #0xb00
#else
	mov r3, #0xdc0
#endif
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	movne r4, #1
	bne _02320CBC
	mov r2, #1
	mov ip, #6
	mov r0, sb
	mov r1, r8
#ifdef JAPAN
	rsb r3, r2, #0xb00
#else
	rsb r3, r2, #0xdc0
#endif
	str ip, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	addne r0, r4, r4, lsr #31
	movne r4, r0, asr #1
_02320CBC:
	ldrsh r0, [r5, #0x10]
	mov r3, #0
	mov r1, r8
	cmp r4, r0
	subge r4, r0, #1
	add r0, sp, #0x18
	stmia sp, {r0, r7}
	str r6, [sp, #8]
	cmp r4, #0
	movlt r4, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r0, sb
	mov r2, r4
	str r3, [sp, #0x14]
	bl CalcDamageFixedNoCategory
_02320CFC:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02320D04: .word 0x00000163
	arm_func_end ov29_02320BCC

	arm_func_start TryWarp
TryWarp: ; 0x02320D08

#ifdef JAPAN
#define TRY_WARP_OFFSET -0xA4
#else
#define TRY_WARP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r0, r4
	mov r2, r4
	mov r6, r3
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	cmp sb, r8
	beq _02320D78
	cmp sb, #0
	moveq r0, r4
	beq _02320D58
	ldr r0, [sb]
	cmp r0, #1
	moveq r0, #1
	movne r0, r4
	and r0, r0, #0xff
_02320D58:
	cmp r0, #0
	beq _02320D78
	mov r0, sb
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _02320D84
_02320D78:
	mov r0, r8
	mov r1, #0xe
	bl AbilityIsActiveVeneer
_02320D84:
	cmp r0, #0
	beq _02320DA0
	ldr r2, _023210E8 ; =0x00000E74
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02320DA0:
	ldr r0, _023210EC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + TRY_WARP_OFFSET]
	bl AreTileJumpsAllowed
	cmp r0, #0
	bne _02320DD0
	ldr r2, _023210F0 ; =0x00000E72
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02320DD0:
	cmp r7, #1
	bne _02320E20
	ldr r0, _023210EC ; =DUNGEON_PTR
	ldrsh r1, [r8, #4]
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r2, [r0, #0xe4 + TRY_WARP_OFFSET]
	cmp r2, r1
	ldreqsh r1, [r0, #0xe6 + TRY_WARP_OFFSET]
	ldreqsh r0, [r8, #6]
	cmpeq r1, r0
	bne _02320E20
	ldr r2, _023210F4 ; =0x00000E73
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	mov r1, r8
	bl TryInflictPetrifiedStatus
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02320E20:
	ldr r2, _023210F8 ; =0x00000E71
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	mov r1, r8
	bl ov29_02307BDC
	mov r0, sb
	mov r1, r8
	bl ov29_022E5650
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02320EA4
	ldrb sl, [r5, #0x4c]
	ldr fp, _023210FC ; =ov29_0237C850
_02320E60:
	ldr r0, [r8, #0x1c]
	add r0, r0, #0x800
	str r0, [r8, #0x1c]
	cmp r0, #0xa000
	bge _02320EA4
	ldr r0, [fp]
	tst r0, #3
	bne _02320E98
	add r0, sl, #1
	and sl, r0, #7
	mov r0, r8
	mov r1, sl
	strb sl, [r5, #0x4c]
	bl ov29_02304A48
_02320E98:
	mov r0, #0x22
	bl AdvanceFrame
	b _02320E60
_02320EA4:
	cmp r7, #5
	addls pc, pc, r7, lsl #2
	b _02320EC8
_02320EB0: ; jump table
	b _02320EC8 ; case 0
	b _02320EF4 ; case 1
	b _02320F30 ; case 2
	b _02320F60 ; case 3
	b _02320F74 ; case 4
	b _02320FB0 ; case 5
_02320EC8:
	add r0, sp, #0
	mov r1, #1
	bl GetRandomTile
	cmp r0, #0
	bne _02321008
	ldrh r0, [r8, #4]
	mov r4, #1
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	b _02321008
_02320EF4:
	ldr r1, _023210EC ; =DUNGEON_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0
#ifdef JAPAN
	add r1, r1, #0xc40
	add r1, r1, #0xc000
#else
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
#endif
	bl FindClosestUnoccupiedTileWithin2
	cmp r0, #0
	bne _02321008
	ldrh r0, [r8, #4]
	mov r4, #1
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	b _02321008
_02320F30:
	add r0, sp, #0
	mov r1, r6
	mov r2, #0
	bl FindClosestUnoccupiedTileWithin2
	cmp r0, #0
	bne _02321008
	ldrh r0, [r8, #4]
	mov r4, #1
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	b _02321008
_02320F60:
	ldrh r0, [r6]
	strh r0, [sp]
	ldrh r0, [r6, #2]
	strh r0, [sp, #2]
	b _02321008
_02320F74:
	ldr r1, _023210EC ; =DUNGEON_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #1
#ifdef JAPAN
	add r1, r1, #0xc40
	add r1, r1, #0xc000
#else
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
#endif
	bl FindUnoccupiedTileWithin3
	cmp r0, #0
	bne _02321008
	ldrh r0, [r8, #4]
	mov r4, #1
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	b _02321008
_02320FB0:
	ldrb r0, [r5, #6]
	cmp r0, #0
	ldreqb r0, [r5, #7]
	cmpeq r0, #0
	bne _02320FE4
	bl GetLeader
	mov r1, r0
	add r0, sp, #0
	add r1, r1, #4
	mov r2, #0
	bl FindClosestUnoccupiedTileWithin2
	cmp r0, #0
	bne _02321008
_02320FE4:
	add r0, sp, #0
	mov r1, #1
	bl GetRandomTile
	cmp r0, #0
	ldreqh r0, [r8, #4]
	moveq r4, #1
	streqh r0, [sp]
	ldreqh r0, [r8, #6]
	streqh r0, [sp, #2]
_02321008:
	ldrsh r1, [sp]
	ldrsh r2, [sp, #2]
	mov r0, r8
	mov r3, #1
	bl MoveMonsterToPos
	mov r0, r8
	mov r1, #0
	bl UpdateEntityPixelPos
	mov r0, r8
	bl sub_01FFB62C
	mov r0, #1
	bl UpdateCamera
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _023210A0
	ldrb sl, [r5, #0x4c]
	mov r0, #0xa000
	ldr r6, _023210FC ; =ov29_0237C850
	str r0, [r8, #0x1c]
	mov fp, #0x22
_0232105C:
	ldr r0, [r8, #0x1c]
	sub r0, r0, #0x400
	str r0, [r8, #0x1c]
	cmp r0, #0
	ble _023210A0
	ldr r0, [r6]
	tst r0, #3
	bne _02321094
	add r0, sl, #1
	and sl, r0, #7
	mov r0, r8
	mov r1, sl
	strb sl, [r5, #0x4c]
	bl ov29_02304A48
_02321094:
	mov r0, fp
	bl AdvanceFrame
	b _0232105C
_023210A0:
	mov r1, #0
	mov r0, #0x22
	str r1, [r8, #0x1c]
	bl AdvanceFrame
	cmp r4, #0
	beq _023210C8
	ldr r2, _02321100 ; =0x00000E75
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_023210C8:
	cmp r7, #1
	bne _023210DC
	mov r0, sb
	mov r1, r8
	bl TryInflictPetrifiedStatus
_023210DC:
	mov r0, r8
	bl ov29_02321238
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_WARP_DATA_OFFSET -0x2BE
#else
#define TRY_WARP_DATA_OFFSET 0
#endif
_023210E8: .word 0x00000E74 + TRY_WARP_DATA_OFFSET
_023210EC: .word DUNGEON_PTR
_023210F0: .word 0x00000E72 + TRY_WARP_DATA_OFFSET
_023210F4: .word 0x00000E73 + TRY_WARP_DATA_OFFSET
_023210F8: .word 0x00000E71 + TRY_WARP_DATA_OFFSET
_023210FC: .word ov29_0237C850
_02321100: .word 0x00000E75 + TRY_WARP_DATA_OFFSET
	arm_func_end TryWarp

	arm_func_start EnsureCanStandCurrentTile
EnsureCanStandCurrentTile: ; 0x02321104
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r1, r4, #4
	bl CannotStandOnTile
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, r4
	mov r2, #5
	mov r3, #0
	bl TryWarp
	ldmia sp!, {r4, pc}
	arm_func_end EnsureCanStandCurrentTile

	arm_func_start ov29_02321134
ov29_02321134: ; 0x02321134
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r1, r4, #4
	bl ov29_022FF958
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, r4
	mov r2, #5
	mov r3, #0
	bl TryWarp
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02321134

	arm_func_start ov29_02321164
ov29_02321164: ; 0x02321164
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	add r1, r4, #4
	bl CannotStandOnTile
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #5
	mov r3, #0
	bl TryWarp
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02321164

	arm_func_start ov29_0232119C
ov29_0232119C: ; 0x0232119C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	mov r5, r2
	moveq r0, #0
	beq _023211C4
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_023211C4:
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	beq _023211E0
	mov r0, r4
	mov r1, #8
	bl ov29_02304A48
_023211E0:
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _02321210
	cmp r5, #0
	beq _02321200
	mov r0, r4
	bl ov29_022F42F8
_02321200:
	add r0, r4, #4
	bl DiscoverMinimap
	mov r0, #0
	bl ov29_022F62CC
_02321210:
	mov r0, r4
	bl ov29_022F9C74
	ldr r1, _02321234 ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl ov29_02305814
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02321234: .word DUNGEON_PTR
	arm_func_end ov29_0232119C

	arm_func_start ov29_02321238
ov29_02321238: ; 0x02321238
	ldr ip, _02321248 ; =ov29_0232119C
	mov r1, #0
	mov r2, #1
	bx ip
	.align 2, 0
_02321248: .word ov29_0232119C
	arm_func_end ov29_02321238

	arm_func_start ov29_0232124C
ov29_0232124C: ; 0x0232124C
	ldr ip, _0232125C ; =ov29_0232119C
	mov r1, #1
	mov r2, r1
	bx ip
	.align 2, 0
_0232125C: .word ov29_0232119C
	arm_func_end ov29_0232124C

	arm_func_start ov29_02321260
ov29_02321260: ; 0x02321260
	ldr ip, _02321270 ; =ov29_0232119C
	mov r1, #0
	mov r2, r1
	bx ip
	.align 2, 0
_02321270: .word ov29_0232119C
	arm_func_end ov29_02321260

	arm_func_start ov29_02321274
ov29_02321274: ; 0x02321274
	ldr ip, _02321284 ; =ov29_0232119C
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_02321284: .word ov29_0232119C
	arm_func_end ov29_02321274

	arm_func_start ov29_02321288
ov29_02321288: ; 0x02321288
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x34]
	ldr r5, [sl, #0xb4]
	bl ov29_022F87C0
	movs r4, r0
	bne _023212E0
	mov r0, sl
	mov r1, r6
	bl ov29_022FAA04
	ldrh r2, [r6, #2]
	mov r0, sl
	mov r1, #1
	orr r2, r2, #8
	strh r2, [r6, #2]
	bl UpdateMovePp
	mov r0, #0
	b _02321428
_023212E0:
	add r2, sp, #8
	mov r3, r6
	mov r1, #4
_023212EC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023212EC
	mov r0, r4
	bl ov29_023247B4
	strh r0, [sp, #0xc]
	ldrh r0, [sp, #0xc]
	cmp r0, #0
	bne _02321360
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02321430 ; =0x00000F11
	mov r0, sl
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, r6
	bl ov29_022FAA04
	ldrh r2, [r6, #2]
	mov r0, sl
	mov r1, #1
	orr r2, r2, #8
	strh r2, [r6, #2]
	bl UpdateMovePp
	mov r0, #0
	b _02321428
_02321360:
	mov r0, sl
	mov r1, r6
	mov r2, #1
	bl CanMonsterUseMove
	cmp r0, #0
	beq _023213E4
	mov r0, r4
	bl ov29_022E4C84
	mov r0, sl
	bl ov29_022E4CD4
	mov r0, #1
#ifdef JAPAN
	strb r0, [r5, #0x21d]
#else
	strb r0, [r5, #0x221]
#endif
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02321434 ; =0x00000F12
	mov r1, r4
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	ldr r4, [sp, #0x30]
	add r0, sp, #8
	str r4, [sp]
	str r0, [sp, #4]
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, sl
	bl ov29_02322374
	mov r4, r0
	mov r0, #0
#ifdef JAPAN
	strb r0, [r5, #0x21d]
#else
	strb r0, [r5, #0x221]
#endif
	b _02321408
_023213E4:
	ldr r1, [sp, #0x30]
	mov r0, sl
	str r1, [sp]
	mov r1, sb
	mov r2, r8
	mov r3, r7
	str r6, [sp, #4]
	bl ov29_02322374
	mov r4, r0
_02321408:
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _02321424
	mov r0, sl
	mov r1, r6
	bl ov29_022FAA04
_02321424:
	mov r0, r4
_02321428:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#ifdef JAPAN
_02321430: .word 0x00000C53
_02321434: .word 0x00000C54
#else
_02321430: .word 0x00000F11
_02321434: .word 0x00000F12
#endif
	arm_func_end ov29_02321288
