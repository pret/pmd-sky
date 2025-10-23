	.include "asm/macros.inc"
	.include "overlay_29_022F9744.inc"

	.text

	arm_func_start TryActivateConversion2
TryActivateConversion2: ; 0x022F9744
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r4, r2
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne r7, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r6, #0xb4]
	mov r0, r6
	bl Conversion2IsActive
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r4
	bl GetMoveTypeForMonster
	bl GetConversion2ConvertToType
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov29_02307CE0
	mov r0, r6
	strb r4, [r5, #0x5e]
	mov r1, #0
	strb r1, [r5, #0x5f]
	bl ov29_022E4160
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #0
	bl SetPreprocessorArgsIdVal
	mov r0, r7
	mov r1, r6
	ldr r2, _022F97EC ; =0x00000C16
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_022F97EC: .word 0x00000955
#else
_022F97EC: .word 0x00000C16
#endif
	arm_func_end TryActivateConversion2

	arm_func_start TryActivateTruant
TryActivateTruant: ; 0x022F97F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F9838
	mov r0, r4
	mov r1, #0x2a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F9838
	mov r2, #0
	str r2, [sp]
	mov r0, r4
	mov r1, r4
	mov r3, #1
	str r2, [sp, #4]
	bl TryInflictPausedStatus
_022F9838:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end TryActivateTruant

	arm_func_start ov29_022F9840
ov29_022F9840: ; 0x022F9840
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5]
	cmp r0, #1
	bne _022F987C
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	and r4, r0, #0xff
_022F987C:
	bl sub_0204AEF0
	cmp r0, #0
	moveq r4, #0
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	mov r0, r5
	mov r2, r1
	bl TryPointCameraToMonster
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022F9840

	arm_func_start TryPointCameraToMonster
TryPointCameraToMonster: ; 0x022F98B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022F9968 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldr r0, [r0, #0x188]
#else
	ldr r0, [r0, #0x22c]
#endif
	cmp r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	beq _022F9928
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r7, #0x34
	ldr r5, _022F9968 ; =DUNGEON_PTR
	b _022F9918
_022F9910:
	mov r0, r7
	bl AdvanceFrame
_022F9918:
	ldr r0, [r5]
	ldrsh r0, [r0, #0x1c]
	cmp r0, #0x3c
	blt _022F9910
_022F9928:
	mov r0, #4
	mov r1, #0x44
	bl ov29_022EA370
	mov r0, r6
	mov r1, r4
	bl PointCameraToMonster
	cmp r4, #0
	beq _022F9950
	add r0, r6, #4
	bl DiscoverMinimap
_022F9950:
	ldr r0, _022F9968 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #0x1c]
	bl ov29_022E81F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F9968: .word DUNGEON_PTR
	arm_func_end TryPointCameraToMonster

	arm_func_start ov29_022F996C
ov29_022F996C: ; 0x022F996C
	bx lr
	arm_func_end ov29_022F996C

	arm_func_start ReevaluateSnatchMonster
ReevaluateSnatchMonster: ; 0x022F9970
#ifdef JAPAN
#define OV29_022F9970_OFFSET -0xA4
#else
#define OV29_022F9970_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	ldr r6, _022F99E8 ; =DUNGEON_PTR
	b _022F99DC
_022F9980:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78 + OV29_022F9970_OFFSET]
	mov r0, r5
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F99D8
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #3
	bne _022F99D8
	ldr r1, _022F99E8 ; =DUNGEON_PTR
	ldr r0, [r1]
	add r0, r0, #0x19000
	str r5, [r0, #0x904 + OV29_022F9970_OFFSET]
	ldr r2, [r5, #0xb4]
	ldr r0, [r1]
	ldr r1, [r2, #0xb0]
	add r0, r0, #0x19000
	str r1, [r0, #0x90c + OV29_022F9970_OFFSET]
	ldmia sp!, {r4, r5, r6, pc}
_022F99D8:
	add r4, r4, #1
_022F99DC:
	cmp r4, #0x14
	blt _022F9980
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F99E8: .word DUNGEON_PTR
	arm_func_end ReevaluateSnatchMonster

	arm_func_start GetRandomExplorerMazeMonster
GetRandomExplorerMazeMonster: ; 0x022F99EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x40
	mov r4, #0
	ldr r6, _022F9A70 ; =DUNGEON_PTR
	mov r5, r4
	add r7, sp, #0
_022F9A04:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xa94]
#else
	ldr r8, [r0, #0xb38]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F9A40
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xbc]
	cmp r0, #0xb
	blo _022F9A40
	cmp r0, #0xe
	strls r8, [r7, r4, lsl #2]
	addls r4, r4, #1
_022F9A40:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022F9A04
	cmp r4, #0
	movle r0, #0
	ble _022F9A68
	mov r0, r4
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
_022F9A68:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F9A70: .word DUNGEON_PTR
	arm_func_end GetRandomExplorerMazeMonster

	arm_func_start RestorePpAllMovesSetFlags
RestorePpAllMovesSetFlags: ; 0x022F9A74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, [r0, #0xb4]
	mov r7, #0
#ifdef JAPAN
	add r6, r0, #0x120
#else
	add r6, r0, #0x124
#endif
	mov r4, r7
	mov r5, #1
_022F9A8C:
	ldrb r0, [r6, r7, lsl #3]
	add r8, r6, r7, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022F9AE4
	ldrh r1, [r8, #2]
	mov r0, r8
	bic r1, r1, #8
	strh r1, [r8, #2]
	ldrh r1, [r8, #2]
	bic r1, r1, #0x10
	strh r1, [r8, #2]
	ldrh r1, [r8, #2]
	bic r1, r1, #0x40
	strh r1, [r8, #2]
	ldrh r1, [r8, #2]
	orr r1, r1, #4
	strh r1, [r8, #2]
	bl GetMaxPpWrapper
	strb r0, [r8, #6]
_022F9AE4:
	add r7, r7, #1
	cmp r7, #4
	blt _022F9A8C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end RestorePpAllMovesSetFlags

	arm_func_start ov29_022F9AF4
ov29_022F9AF4: ; 0x022F9AF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r1, [sb, #0xb4]
	mov r5, #0
	ldrb r8, [r1, #6]
	bl ov29_022F87C0
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mvn r7, #0
	mov r4, r7
_022F9B20:
	mov r6, r4
_022F9B24:
	ldrsh r0, [sb, #4]
	ldrsh r1, [sb, #6]
	add r0, r0, r6
	add r1, r1, r7
	bl GetTileSafe
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _022F9B60
	ldr r0, [r1]
	cmp r0, #1
	bne _022F9B60
	ldr r0, [r1, #0xb4]
	ldrb r0, [r0, #6]
	cmp r8, r0
	addne r5, r5, #1
_022F9B60:
	add r6, r6, #1
	cmp r6, #1
	ble _022F9B24
	add r7, r7, #1
	cmp r7, #1
	ble _022F9B20
	cmp r5, #2
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_022F9AF4

	arm_func_start ov29_022F9B8C
ov29_022F9B8C: ; 0x022F9B8C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r2, #0
	mov r1, #1
	mov r4, r0
	strb r2, [sp, #4]
	strb r1, [sp, #5]
	str r2, [sp]
	ldrsh r1, [r4, #2]
	add r0, sp, #8
	add r3, sp, #4
	bl sub_02052E2C
	ldrsh r0, [r4, #2]
	mov r1, #0
	mov r2, #6
	strh r0, [sp, #0xc]
	ldrb r0, [r4, #0xa]
	strb r0, [sp, #9]
	ldrsh r0, [r4, #0xe]
	strh r0, [sp, #0x10]
	ldrb r0, [r4, #0x1a]
	strb r0, [sp, #0x14]
	ldrb r0, [r4, #0x1c]
	strb r0, [sp, #0x16]
	ldrb r0, [r4, #0x48]
	strb r0, [sp, #0xa]
	ldrb r0, [r4, #0x49]
	strb r0, [sp, #0xb]
	add r0, sp, #8
_022F9C00:
	mla lr, r1, r2, r0
	add r3, r4, r1, lsl #3
#ifdef JAPAN
	ldrb ip, [r3, #0x120]
#else
	ldrb ip, [r3, #0x124]
#endif
	add r3, r3, #0x100
	add r1, r1, #1
	strb ip, [lr, #0x22]
#ifdef JAPAN
	ldrh r3, [r3, #0x24]
#else
	ldrh r3, [r3, #0x28]
#endif
	cmp r1, #4
	strh r3, [lr, #0x24]
	blt _022F9C00
	bl GetMonsterEvoStatus
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov29_022F9B8C

	arm_func_start ov29_022F9C34
ov29_022F9C34: ; 0x022F9C34
	ldr ip, _022F9C3C ; =sub_02056228
	bx ip
	.align 2, 0
_022F9C3C: .word sub_02056228
	arm_func_end ov29_022F9C34

	arm_func_start CheckTeamMemberIdxVeneer
CheckTeamMemberIdxVeneer: ; 0x022F9C40
	ldr ip, _022F9C48 ; =CheckTeamMemberIdx
	bx ip
	.align 2, 0
_022F9C48: .word CheckTeamMemberIdx
	arm_func_end CheckTeamMemberIdxVeneer

	arm_func_start ov29_022F9C4C
ov29_022F9C4C: ; 0x022F9C4C
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrsh r0, [r0, #0xc]
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl CheckTeamMemberIdx
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022F9C4C

	arm_func_start IsMonsterIdInNormalRangeVeneer
IsMonsterIdInNormalRangeVeneer: ; 0x022F9C68
	ldr ip, _022F9C70 ; =IsMonsterIdInNormalRange
	bx ip
	.align 2, 0
_022F9C70: .word IsMonsterIdInNormalRange
	arm_func_end IsMonsterIdInNormalRangeVeneer

	arm_func_start ov29_022F9C74
ov29_022F9C74: ; 0x022F9C74
#ifdef JAPAN
#define OV29_022F9C74_OFFSET -4
#else
#define OV29_022F9C74_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	bl EntityIsValid__022F7364
#ifndef JAPAN
	cmp r0, #0
	beq _022F9E80
	ldr r5, [r6, #0xb4]
	ldrb r0, [r5, #0x103]
#endif
	cmp r0, #0
	beq _022F9E78
	mov r0, r6
	bl GetTileAtEntity
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	bne _022F9D50
	ldr r0, _022F9E88 ; =DUNGEON_PTR
	ldr r1, _022F9E8C ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
#ifdef JAPAN
	ldr r4, [r6, #0xb4]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0x30]
#else
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _022F9D34
#ifdef JAPAN
	ldrb r0, [r4, #0xc4]
#else
	ldrb r0, [r5, #0xc4]
#endif
	cmp r0, #1
	bne _022F9CF0
	mov r0, r6
	mov r1, r6
	mov r2, #1
	bl EndFrozenClassStatus
_022F9CF0:
#ifdef JAPAN
	ldrsh r0, [r4, #2]
	bl GetMobilityType
	cmp r0, #4
	ldrnesh r1, [r4, #2]
#else
	ldrsh r0, [r5, #2]
	bl GetMobilityType
	cmp r0, #4
	ldrnesh r1, [r5, #2]
#endif
	ldrne r0, _022F9E90 ; =0x00000115
	cmpne r1, r0
	cmpne r1, #0x92
#ifdef JAPAN
	ldrneb r0, [r4, #0xbf]
#else
	ldrneb r0, [r5, #0xbf]
#endif
	cmpne r0, #1
	beq _022F9E78
	mov r3, #0
	mov r0, r6
	mov r1, r6
	mov r2, #1
	str r3, [sp]
	bl TryInflictBurnStatus
	b _022F9E78
_022F9D34:
#ifdef JAPAN
	ldrb r0, [r4, #0xbf]
#else
	ldrb r0, [r5, #0xbf]
#endif
	cmp r0, #1
	bne _022F9E78
	mov r0, r6
	mov r1, r6
	bl EndBurnClassStatus
	b _022F9E78
_022F9D50:
	cmp r0, #0
	bne _022F9E78
#ifdef JAPAN
	ldr r5, [r6, #0xb4]
#endif
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _022F9E78
	add r0, r5, #0x100
	ldrh r1, [r0, #0x48 + OV29_022F9C74_OFFSET]
	ldrh r4, [r0, #0x46 + OV29_022F9C74_OFFSET]
	sub r3, sp, #4
	strh r1, [sp, #0xa]
	mov r0, r1
	strh r4, [r3]
	strh r0, [r3, #2]
	ldr r1, _022F9E94 ; =BELLY_DRAIN_IN_WALLS_INT
	ldr r0, [r3]
	ldrh r2, [r1]
	strh r4, [sp, #8]
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r1, [sp, #4]
	add r0, r5, #0x100
	ldrh r3, [sp, #6]
	strh r1, [r0, #0x46 + OV29_022F9C74_OFFSET]
	ldrh r2, [sp, #8]
	strh r3, [r0, #0x48 + OV29_022F9C74_OFFSET]
	sub r0, sp, #4
	ldrh r1, [sp, #0xa]
	strh r2, [r0]
	mov r4, #0
	strh r1, [r0, #2]
	ldr r0, [r0]
	bl CeilFixedPoint
	cmp r0, #0x14
	blt _022F9E18
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46 + OV29_022F9C74_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_022F9C74_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0x14
	ldrlt r4, _022F9E98 ; =0x00000C1A
_022F9E18:
	ldrh r1, [sp, #8]
	ldrh r0, [sp, #0xa]
	sub r2, sp, #4
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	blt _022F9E64
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46 + OV29_022F9C74_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + OV29_022F9C74_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	ldrlt r4, _022F9E9C ; =0x00000C1B
_022F9E64:
	cmp r4, #0
	beq _022F9E78
	mov r0, r6
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUser
_022F9E78:
#ifndef JAPAN
	mov r0, #0
	strb r0, [r5, #0x103]
_022F9E80:
#endif
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F9E88: .word DUNGEON_PTR
_022F9E8C: .word SECONDARY_TERRAIN_TYPES
_022F9E90: .word 0x00000115
_022F9E94: .word BELLY_DRAIN_IN_WALLS_INT
#ifdef JAPAN
_022F9E98: .word 0x00000959
_022F9E9C: .word 0x0000095A
#else
_022F9E98: .word 0x00000C1A
_022F9E9C: .word 0x00000C1B
#endif
	arm_func_end ov29_022F9C74

	arm_func_start ov29_022F9EA0
ov29_022F9EA0: ; 0x022F9EA0
#ifdef JAPAN
#define OV29_022F9EA0_OFFSET -4
#else
#define OV29_022F9EA0_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r1, #0x6f
	ldr r4, [r5, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _022F9FEC
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _022F9FBC
	mov r0, r5
	mov r1, #0x11
	bl HasHeldItem
	cmp r0, #0
	bne _022F9EF4
	mov r0, r5
	mov r1, #0x32
	bl HasHeldItem
	cmp r0, #0
	beq _022F9F60
_022F9EF4:
	mov r0, #0xa
	bl sub_02050FF8
	add r1, r4, #0x100
	ldrh r2, [r1, #0x46 + OV29_022F9EA0_OFFSET]
	sub r3, sp, #4
	strh r0, [sp, #8]
	strh r2, [r3]
	ldrh r1, [r1, #0x48 + OV29_022F9EA0_OFFSET]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	strh r1, [r3, #2]
	ldrh r2, [sp, #8]
	ldr r0, [r3]
	ldrh r1, [sp, #0xa]
	strh r2, [r3]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r2, [sp, #4]
	add r0, r4, #0x100
	ldrh r1, [sp, #6]
	strh r2, [r0, #0x46 + OV29_022F9EA0_OFFSET]
	strh r1, [r0, #0x48 + OV29_022F9EA0_OFFSET]
	b _022F9F9C
_022F9F60:
	mov r0, r5
	mov r1, #0x22
	bl HasHeldItem
	cmp r0, #0
	beq _022F9F9C
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r2, [sp]
	add r0, r4, #0x100
	ldrh r1, [sp, #2]
	strh r2, [r0, #0x46 + OV29_022F9EA0_OFFSET]
	strh r1, [r0, #0x48 + OV29_022F9EA0_OFFSET]
_022F9F9C:
	ldr r0, _022FA028 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x78d]
	cmp r0, #0
	beq _022F9FEC
	mov r0, r5
	bl UpdateStatusIconFlags
	b _022F9FEC
_022F9FBC:
	ldrsh r1, [r4, #0x66]
	ldrsh r0, [r4, #0x68]
	cmp r0, r1
	beq _022F9FEC
	cmp r1, #0x18
	cmpne r0, #0x18
	cmpne r1, #0xe
	cmpne r0, #0xe
	bne _022F9FEC
	mov r0, #1
	bl UpdateCamera
	bl UpdateMinimap
_022F9FEC:
	ldrsh r1, [r4, #0x68]
	ldrsh r0, [r4, #0x66]
	cmp r1, r0
	beq _022FA000
	bl ov29_02307DD0
_022FA000:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrnesh r0, [r4, #0x66]
	moveq r0, #0
	strh r0, [r4, #0x68]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022FA028: .word DUNGEON_PTR
	arm_func_end ov29_022F9EA0

	arm_func_start ov29_022FA02C
ov29_022FA02C: ; 0x022FA02C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x90
	mov sl, r0
	mov r3, r1
	ldrsh r1, [sl, #2]
	mov sb, r2
	add r0, sp, #4
	mov r2, r3
	bl GetLearnableIqSkills
	mov r6, r0
	ldrsh r1, [sl, #2]
	ldrsh r2, [sl, #0xe]
	add r0, sp, #0x49
	bl GetLearnableIqSkills
	mov r7, r0
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, sl
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	mov r8, #1
	add r5, sp, #4
	mov r4, r8
	mov fp, #0
_022FA090:
	mov r1, #0
	mov r2, r1
	mov r3, r1
	b _022FA0B4
_022FA0A0:
	ldrb r0, [r5, r3]
	cmp r0, r8
	moveq r1, r4
	beq _022FA0BC
	add r3, r3, #1
_022FA0B4:
	cmp r3, r6
	blt _022FA0A0
_022FA0BC:
	mov r3, fp
	b _022FA0DC
_022FA0C4:
	add r0, r5, r3
	ldrb r0, [r0, #0x45]
	cmp r8, r0
	moveq r2, #1
	beq _022FA0E4
	add r3, r3, #1
_022FA0DC:
	cmp r3, r7
	blt _022FA0C4
_022FA0E4:
	cmp r1, r2
	beq _022FA12C
	add r0, sl, #0x90
	and r1, r8, #0xff
	bl EnableIqSkill
	add r0, sl, #0x9c
	and r1, r8, #0xff
	bl EnableIqSkill
	cmp sb, #0
	bne _022FA12C
	mov r0, #4
	bl sub_02017C50
	mov r0, #0
	and r1, r8, #0xff
	bl SetPreprocessorArgsIdVal
	ldr r1, _022FA140 ; =0x00000C1C
	mov r0, #0
	bl LogMessageByIdWithPopup
_022FA12C:
	add r8, r8, #1
	cmp r8, #0x45
	blt _022FA090
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_022FA140: .word 0x0000095B
#else
_022FA140: .word 0x00000C1C
#endif
	arm_func_end ov29_022FA02C

	arm_func_start BoostIQ
BoostIQ: ; 0x022FA144
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r5, [r7, #0xb4]
	ldr r0, _022FA1CC ; =0x000003E7
	ldrsh r4, [r5, #0xe]
	mov r6, r2
	add r1, r4, r1
	strh r1, [r5, #0xe]
	ldrsh r1, [r5, #0xe]
	cmp r1, r0
	strgth r0, [r5, #0xe]
	cmp r6, #0
	bne _022FA1B0
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r5, #0xe]
	cmp r4, r0
	bne _022FA1A4
	ldr r1, _022FA1D0 ; =0x00000C27
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022FA1B0
_022FA1A4:
	ldr r1, _022FA1D4 ; =0x00000C26
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
_022FA1B0:
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl ov29_022FA02C
	mov r0, r7
	bl ov29_023021F0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FA1CC: .word 0x000003E7
#ifdef JAPAN
_022FA1D0: .word 0x00000966
_022FA1D4: .word 0x00000965
#else
_022FA1D0: .word 0x00000C27
_022FA1D4: .word 0x00000C26
#endif
	arm_func_end BoostIQ

	arm_func_start ov29_022FA1D8
ov29_022FA1D8: ; 0x022FA1D8
#ifdef JAPAN
#define OV29_022FA1D8_OFFSET -4
#else
#define OV29_022FA1D8_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	ldrb r1, [r4, #7]
	cmp r1, #0
	beq _022FA210
	ldrsh r1, [r6, #4]
	add r0, r4, #0x100
	strh r1, [r0, #0x7e + OV29_022FA1D8_OFFSET]
	ldrsh r1, [r6, #6]
	add r1, r1, #1
	strh r1, [r0, #0x80 + OV29_022FA1D8_OFFSET]
	b _022FA27C
_022FA210:
	ldrb r1, [r4, #0x16a + OV29_022FA1D8_OFFSET]
	cmp r1, #0xff
	beq _022FA274
	ldrsh r1, [r4, #2]
	add r0, r4, #0x4a
	bl SetActionPassTurnOrWalk
	ldrb r2, [r4, #0x16a + OV29_022FA1D8_OFFSET]
	ldr r1, _022FA2E8 ; =DIRECTIONS_XY
	add r0, r4, #0x100
	strb r2, [r4, #0x4c]
	mov r2, r2, lsl #2
	ldrsh r3, [r1, r2]
	ldrsh ip, [r6, #4]
	ldr r2, _022FA2EC ; =DIRECTIONS_XY + 2
	mov r1, #0xff
	add r3, ip, r3
	strh r3, [r0, #0x7e + OV29_022FA1D8_OFFSET]
	ldrb r3, [r4, #0x4c]
	ldrsh ip, [r6, #6]
	mov r3, r3, lsl #2
	ldrsh r2, [r2, r3]
	add r2, ip, r2
	strh r2, [r0, #0x80 + OV29_022FA1D8_OFFSET]
	strb r1, [r4, #0x16a + OV29_022FA1D8_OFFSET]
	b _022FA27C
_022FA274:
	mov r1, r2
	bl AiMovement
_022FA27C:
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x7e + OV29_022FA1D8_OFFSET]
	cmp r1, #0
	ldreqsh r0, [r0, #0x80 + OV29_022FA1D8_OFFSET]
	cmpeq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, #1
	bl CheckVariousStatuses2__02301244
	cmp r0, #0
	beq _022FA2B8
	mov r0, r6
	bl CheckVariousStatuses__023016DC
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_022FA2B8:
	add r1, r4, #0x7e + OV29_022FA1D8_OFFSET
	add r0, r6, #4
	add r1, r1, #0x100
	bl GetDirectionTowardsPosition
	mov r1, r0
	and r0, r1, #7
	strb r0, [r4, #0x4c]
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_02304A48
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FA2E8: .word DIRECTIONS_XY
_022FA2EC: .word DIRECTIONS_XY + 2
	arm_func_end ov29_022FA1D8

	arm_func_start ov29_022FA2F0
ov29_022FA2F0: ; 0x022FA2F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _022FA35C ; =DUNGEON_PTR
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
_022FA308:
	ldr r0, [sb]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r4, [r0, #0xad4]
#else
	ldr r4, [r0, #0xb78]
#endif
	mov r0, r4
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA34C
	cmp r7, #0
	ldrne r0, [r4, #0xb4]
	ldrneb r0, [r0, #0xbc]
	cmpne r0, #7
	bne _022FA34C
	mov r0, r4
	mov r1, r8
	mov r2, r6
	bl ov29_022FA1D8
_022FA34C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022FA308
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FA35C: .word DUNGEON_PTR
	arm_func_end ov29_022FA2F0

	arm_func_start ov29_022FA360
ov29_022FA360: ; 0x022FA360
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0xb4]
	and r1, r5, #7
	mov r0, r6
	strb r1, [r4, #0x4c]
	bl GetIdleAnimationId
	mov r1, r0
	ldrb r2, [r4, #0x4c]
	mov r0, r6
	bl ChangeMonsterAnimation
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022FA360

	arm_func_start ov29_022FA3A0
ov29_022FA3A0: ; 0x022FA3A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r4
	add r0, r5, #4
	bl GetDirectionTowardsPosition
	and r1, r0, #0xff
	mov r0, r5
	bl ov29_022FA360
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FA3A0

	arm_func_start ov29_022FA3D4
ov29_022FA3D4: ; 0x022FA3D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022FA414 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	mov r6, #0
#ifdef JAPAN
	add r0, r0, #0x284
#else
	add r0, r0, #0x328
#endif
	add r5, r0, #0x12800
_022FA3F0:
	ldr r0, [r5, r6, lsl #2]
	mov r1, r4
	bl ov29_022FA3A0
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _022FA3F0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FA414: .word DUNGEON_PTR
	arm_func_end ov29_022FA3D4

	arm_func_start ov29_022FA418
ov29_022FA418: ; 0x022FA418
	stmdb sp!, {r3, lr}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_022EF938
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FA418
