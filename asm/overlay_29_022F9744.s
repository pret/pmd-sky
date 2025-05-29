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
	bl ov29_0234B084
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
	bl ov29_0234B034
	mov r1, #0
	mov r2, sl
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
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
	bl ov29_0234B084
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
	bl CheckVariousStatuses2
	cmp r0, #0
	beq _022FA2B8
	mov r0, r6
	bl CheckVariousStatuses
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

	arm_func_start ShouldMonsterHeadToStairs
ShouldMonsterHeadToStairs: ; 0x022FA430
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	bl GetStairsRoom
	mov r5, r0
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r5, r0
	bne _022FA514
	ldr r1, _022FA51C ; =DUNGEON_PTR
	add r0, sl, #4
	ldr r1, [r1]
#ifdef JAPAN
	add r1, r1, #0xc40
	add r1, r1, #0xc000
#else
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
#endif
	bl GetChebyshevDistance
	ldr r7, _022FA520 ; =0x00002710
	ldr r4, _022FA51C ; =DUNGEON_PTR
	mov r6, r0
	mov r8, #0
_022FA480:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xad4]
#else
	ldr sb, [r0, #0xb78]
#endif
	mov r0, sb
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA4E8
	mov r0, sl
	mov r1, sb
	bl ov29_023018AC
	cmp r0, #1
	bne _022FA4E8
	ldrsh r0, [sb, #4]
	ldrsh r1, [sb, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r5, r0
	bne _022FA4E8
	ldr r1, [r4]
	add r0, sb, #4
#ifdef JAPAN
	add r1, r1, #0xc40
	add r1, r1, #0xc000
#else
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
#endif
	bl GetChebyshevDistance
	cmp r0, r7
	movlt r7, r0
_022FA4E8:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022FA480
	ldr r0, _022FA520 ; =0x00002710
	cmp r7, r0
	beq _022FA50C
	beq _022FA514
	cmp r7, r6
	ble _022FA514
_022FA50C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022FA514:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FA51C: .word DUNGEON_PTR
_022FA520: .word 0x00002710
	arm_func_end ShouldMonsterHeadToStairs

	arm_func_start ov29_022FA524
ov29_022FA524: ; 0x022FA524
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022FA570 ; =DUNGEON_PTR
	mov r5, #0
_022FA530:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA560
	ldr r1, [r6, #0xb4]
	mov r0, r6
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_022FA560:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022FA530
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FA570: .word DUNGEON_PTR
	arm_func_end ov29_022FA524

	arm_func_start ov29_022FA574
ov29_022FA574: ; 0x022FA574
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	mov r1, r4
#ifdef JAPAN
	add r0, r0, #0x120
#else
	add r0, r0, #0x124
#endif
	bl sub_0201405C
	cmp r0, #0
	bne _022FA5B4
	ldr r1, _022FA5E4 ; =0x00000C1D
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_022FA5B4:
	cmp r0, #1
	bne _022FA5CC
	ldr r1, _022FA5E8 ; =0x00000C1E
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_022FA5CC:
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _022FA5EC ; =0x00000C1F
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_022FA5E4: .word 0x0000095C
_022FA5E8: .word 0x0000095D
_022FA5EC: .word 0x0000095E
#else
_022FA5E4: .word 0x00000C1D
_022FA5E8: .word 0x00000C1E
_022FA5EC: .word 0x00000C1F
#endif
	arm_func_end ov29_022FA574

	arm_func_start MewSpawnCheck
MewSpawnCheck: ; 0x022FA5F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl CanMonsterSpawn
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0x97
	bne _022FA63C
	ldr r0, _022FA644 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
#ifdef JAPAN
	ldrb r0, [r0, #0xd95]
#else
	ldrb r0, [r0, #0xe39]
#endif
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_022FA63C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FA644: .word DUNGEON_PTR
	arm_func_end MewSpawnCheck

	arm_func_start ov29_022FA648
ov29_022FA648: ; 0x022FA648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov r6, #1
	mov fp, r6
	mov r5, r7
_022FA65C:
	ldr r0, _022FA74C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xa84]
#else
	ldr r8, [r0, #0xb28]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA730
	ldr sl, [r8, #0xb4]
	ldrb r1, [sl, #7]
	ldrsh r0, [sl, #0xc]
	cmp r1, #0
	beq _022FA6C4
#ifdef JAPAN
	strb r6, [sl, #0x161]
#else
	strb r6, [sl, #0x165]
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	bl ov29_022E0A04
	cmp r0, #1
	mov r0, r8
	bne _022FA6B8
	bl ov29_022E68D8
	b _022FA6BC
_022FA6B8:
	bl ov29_022E68BC
_022FA6BC:
	strb r5, [r8, #0x20]
	b _022FA730
_022FA6C4:
	cmp r0, #0
	blt _022FA730
	mov sb, #0
	bl GetActiveTeamMember
	mov r4, r0
	bl ov29_022E0A04
	cmp r0, #0
	movne sb, #1
	bne _022FA70C
	ldrsh r0, [r4, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	movne sb, #1
	bne _022FA70C
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	movne sb, #1
_022FA70C:
	cmp sb, #0
	beq _022FA730
#ifdef JAPAN
	strb fp, [sl, #0x161]
#else
	strb fp, [sl, #0x165]
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, r8
	bl ov29_022E68BC
	mov r0, #0
	strb r0, [r8, #0x20]
_022FA730:
	add r7, r7, #1
	cmp r7, #4
	blt _022FA65C
	mov r0, #0x1e
	mov r1, #0x4a
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FA74C: .word DUNGEON_PTR
	arm_func_end ov29_022FA648

	arm_func_start ov29_022FA750
ov29_022FA750: ; 0x022FA750
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	ldr r4, _022FA7D8 ; =DUNGEON_PTR
	mov r5, r6
_022FA760:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA7C8
	ldr sb, [r8, #0xb4]
	mov r7, r5
_022FA788:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xad4]
#else
	ldr sl, [r0, #0xb78]
#endif
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne r8, sl
	beq _022FA7BC
	ldrh r1, [sb, #0x80]
	ldrh r0, [sl, #0x26]
	cmp r1, r0
	streq sl, [sb, #0x84]
_022FA7BC:
	add r7, r7, #1
	cmp r7, #0x14
	blt _022FA788
_022FA7C8:
	add r6, r6, #1
	cmp r6, #0x14
	blt _022FA760
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FA7D8: .word DUNGEON_PTR
	arm_func_end ov29_022FA750

	arm_func_start TryEndStatusWithAbility
TryEndStatusWithAbility: ; 0x022FA7DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r2, #0x16
#ifndef JAPAN
	mov r3, #1
#endif
	mov r6, r0
	ldr r4, [r5, #0xb4]
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA81C
	ldrb r0, [r4, #0xbf]
	cmp r0, #4
	bne _022FA81C
	mov r0, r6
	mov r1, r5
	bl EndBurnClassStatus
_022FA81C:
	mov r0, r6
	mov r1, r5
	mov r2, #0x40
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA850
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	bne _022FA850
	mov r0, r6
	mov r1, r5
	bl EndCringeClassStatus
_022FA850:
	mov r0, r6
	mov r1, r5
	mov r2, #0x42
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA884
	ldrb r0, [r4, #0xbf]
	cmp r0, #1
	bne _022FA884
	mov r0, r6
	mov r1, r5
	bl EndBurnClassStatus
_022FA884:
	mov r0, r6
	mov r1, r5
	mov r2, #0x29
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA8B8
	ldrb r0, [r4, #0xd0]
	cmp r0, #7
	bne _022FA8B8
	mov r0, r6
	mov r1, r5
	bl EndCringeClassStatus
_022FA8B8:
	mov r0, r6
	mov r1, r5
	mov r2, #0x36
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	bne _022FA8F0
	mov r0, r6
	mov r1, r5
	mov r2, #0x49
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA924
_022FA8F0:
	mov r0, r5
	bl IsMonsterSleeping
	cmp r0, #0
	bne _022FA90C
	ldrb r0, [r4, #0xbd]
	cmp r0, #4
	bne _022FA924
_022FA90C:
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, #0
	str r3, [sp]
	bl EndSleepClassStatus
_022FA924:
	mov r0, r6
	mov r1, r5
	mov r2, #0x41
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA95C
	ldrb r0, [r4, #0xc4]
	cmp r0, #1
	bne _022FA95C
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl EndFrozenClassStatus
_022FA95C:
	mov r0, r6
	mov r1, r5
	mov r2, #0x45
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA998
	ldrb r0, [r4, #0xbf]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022FA998
	mov r0, r6
	mov r1, r5
	bl EndBurnClassStatus
_022FA998:
	mov r0, r5
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022FA9CC
	mov r0, #0
	strb r0, [r4, #0xff]
	ldrb r0, [r4, #0xd5]
	cmp r0, #0xc
	bne _022FA9CC
	mov r0, r6
	mov r1, r5
	bl EndReflectClassStatus
_022FA9CC:
	mov r0, r5
	mov r1, #0x2b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022FA9FC
	ldrb r0, [r4, #0xc4]
	cmp r0, #2
	bne _022FA9FC
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl EndFrozenClassStatus
_022FA9FC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end TryEndStatusWithAbility

	arm_func_start ov29_022FAA04
ov29_022FAA04: ; 0x022FAA04
#ifdef JAPAN
#define OV29_022FAA04_OFFSET -4
#else
#define OV29_022FAA04_OFFSET 0
#endif
	ldr ip, [r0, #0xb4]
	mov r3, #0
_022FAA0C:
	add r2, ip, r3, lsl #3
	ldrb r0, [r2, #0x124 + OV29_022FAA04_OFFSET]
	add r3, r3, #1
	cmp r3, #4
	bic r0, r0, #0x10
	strb r0, [r2, #0x124 + OV29_022FAA04_OFFSET]
	blt _022FAA0C
	ldrb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	bic r0, r0, #0x10
	strb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	ldrh r0, [r1, #4]
	cmp r0, #0x160
	ldreqb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	orreq r0, r0, #0x10
	streqb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	ldrneb r0, [r1]
	orrne r0, r0, #0x10
	strneb r0, [r1]
	bx lr
	arm_func_end ov29_022FAA04

	arm_func_start ov29_022FAA58
ov29_022FAA58: ; 0x022FAA58
#ifdef JAPAN
#define OV29_022FAA58_OFFSET -4
#else
#define OV29_022FAA58_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _022FAC90 ; =DUNGEON_PTR
	mov sl, r0
	ldr r0, [r1]
	mov r6, #0
#ifdef JAPAN
	add r0, r0, #0x284
#else
	add r0, r0, #0x328
#endif
	add r4, r0, #0x12800
_022FAA78:
	ldr r5, [r4, r6, lsl #2]
	mov r0, r5
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAB98
	mov r0, r5
	mov r1, #0x37
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022FAB98
	ldr sb, [r5, #0xb4]
	mov r8, #0
	mov r7, r8
	add fp, sb, #0x124 + OV29_022FAA58_OFFSET
_022FAAB0:
	ldrb r1, [fp, r7, lsl #3]
	add r0, fp, r7, lsl #3
	str r0, [sp]
	tst r1, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022FAB00
	ldr r0, [sp]
	bl GetMaxPpWrapper
	ldr r1, [sp]
	ldrb r1, [r1, #6]
	cmp r1, r0
	beq _022FAB00
	add r0, r8, #1
	mov r1, r0, lsl #0x10
	mov r2, r8, lsl #1
	add r0, sp, #4
	strh r7, [r0, r2]
	mov r8, r1, asr #0x10
_022FAB00:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FAAB0
	cmp r8, #0
	ble _022FAB4C
	mov r0, r8
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #4
	mov r0, r0, asr #0xf
	ldrsh r0, [r1, r0]
	add r1, sb, #0x124 + OV29_022FAA58_OFFSET
	add r1, r1, r0, lsl #3
	ldrb r0, [r1, #6]
	add r0, r0, #1
	strb r0, [r1, #6]
	b _022FAB54
_022FAB4C:
	mov r0, #0
	b _022FAB58
_022FAB54:
	mov r0, #1
_022FAB58:
	cmp r0, #0
	beq _022FAB98
	mov r0, r5
	bl ShowPpRestoreEffect
	cmp sl, #0
	bne _022FAB98
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, #0x37
	bl ov29_0234B084
#ifdef JAPAN
	ldr r1, _022FC21C ; =0x0000095F
	mov r0, r5
#else
	mov r0, r5
	mov r1, #0xc20
#endif
	bl LogMessageByIdWithPopupCheckUser
_022FAB98:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _022FAA78
	mov r8, #0
	mov fp, r8
_022FABB4:
	ldr sb, [r4, r8, lsl #2]
	mov r0, sb
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAC74
	ldr r6, [sb, #0xb4]
	mov r7, fp
	add r5, r6, #0x124 + OV29_022FAA58_OFFSET
	b _022FABFC
_022FABD8:
	add r0, r5, r7, lsl #3
	bl GetMaxPp
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x12a + OV29_022FAA58_OFFSET]
	cmp r1, r0
	blt _022FAC04
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FABFC:
	cmp r7, #4
	blt _022FABD8
_022FAC04:
	cmp r7, #4
	beq _022FAC74
	mov r0, sb
	mov r1, #0x47
	bl ExclusiveItemEffectIsActive__022FAC98
	cmp r0, #0
	beq _022FAC74
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	mov r1, #0x47
	add r2, sp, #0xc
	bl GetExclusiveItemWithEffectFromBag
	mov r0, #1
	add r1, sp, #0xc
	bl ov29_02344B44
	cmp sl, #0
	bne _022FAC60
	ldr r1, _022FAC94 ; =0x00000C23
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
_022FAC60:
	mov r0, sb
	mov r1, sb
	mov r2, #1
	mov r3, sl
	bl RestoreAllMovePP
_022FAC74:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FABB4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FAC90: .word DUNGEON_PTR
#ifdef JAPAN
_022FC21C: .word 0x0000095F
_022FAC94: .word 0x00000962
#else
_022FAC94: .word 0x00000C23
#endif
	arm_func_end ov29_022FAA58

	arm_func_start ExclusiveItemEffectIsActive__022FAC98
ExclusiveItemEffectIsActive__022FAC98: ; 0x022FAC98
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
	arm_func_end ExclusiveItemEffectIsActive__022FAC98

	arm_func_start ov29_022FACBC
ov29_022FACBC: ; 0x022FACBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r1, _022FAD44 ; =DUNGEON_PTR
	mov sb, r0
	ldr r0, [r1]
	mov r8, #0
#ifdef JAPAN
	add r0, r0, #0x284
#else
	add r0, r0, #0x328
#endif
	ldr r5, _022FAD48 ; =0x000003E7
	add r7, r0, #0x12800
	mov r4, r8
	mov r6, #0x48
_022FACE8:
	ldr sl, [r7, r8, lsl #2]
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAD28
	mov r0, sl
	mov r1, r6
	bl ExclusiveItemEffectIsActive__022FAC98
	cmp r0, #0
	beq _022FAD28
	mov r0, sl
	mov r1, sl
	mov r2, r5
	mov r3, r4
	str sb, [sp]
	bl TryIncreaseHp
_022FAD28:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FACE8
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FAD44: .word DUNGEON_PTR
_022FAD48: .word 0x000003E7
	arm_func_end ov29_022FACBC

	arm_func_start ov29_022FAD4C
ov29_022FAD4C: ; 0x022FAD4C
#ifdef JAPAN
#define OV29_022FAD4C_OFFSET -0xA4
#else
#define OV29_022FAD4C_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022FAF00 ; =DUNGEON_PTR
	mov r8, #0
	ldr r1, [r1]
	sub r3, r8, #1
	add r2, r1, #0xcc00
	ldrsh r4, [r2, #0xe4 + OV29_022FAD4C_OFFSET]
	add r1, r1, #0x328 + OV29_022FAD4C_OFFSET
	add r5, r1, #0x12800
	cmp r4, r3
	ldreqsh r1, [r2, #0xe6 + OV29_022FAD4C_OFFSET]
	mov sb, r0
	moveq r0, r3
	cmpeq r1, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r7, #0
	mov r4, #0x1a
	b _022FADE4
_022FAD94:
	ldr r6, [r5, r7, lsl #2]
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FADD8
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xd9
	blo _022FADC0
	cmp r0, #0xe4
	blo _022FADD8
_022FADC0:
	mov r0, r6
	mov r1, r4
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r8, #1
	bne _022FADEC
_022FADD8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FADE4:
	cmp r7, #4
	blt _022FAD94
_022FADEC:
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetFloorType
	cmp r0, #0
	bne _022FAEEC
	cmp sb, #0
	bne _022FAE14
#ifdef JAPAN
	mov r0, r6
	mov r1, #0x960
#else
	ldr r1, _022FAF04 ; =0x00000C21
	mov r0, r6
#endif
	bl LogMessageByIdWithPopupCheckUser
_022FAE14:
	bl GetLeader
	mov r5, r0
	add r0, sp, #0
	add r1, sp, #2
	mov r4, #0
	bl GetStairsSpawnPosition
	ldrsh r1, [sp]
	ldrsh r3, [r5, #4]
	ldrsh r2, [sp, #2]
	cmp r3, r1
	ldreqsh r0, [r5, #6]
	cmpeq r0, r2
	cmp r3, r1
	bne _022FAE58
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movlt r4, #0
_022FAE58:
	cmp r3, r1
	ldrltsh r0, [r5, #6]
	cmplt r0, r2
	movlt r4, #1
	cmp r3, r1
	bge _022FAE7C
	ldrsh r0, [r5, #6]
	cmp r0, r2
	moveq r4, #2
_022FAE7C:
	cmp r3, r1
	bge _022FAE90
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movgt r4, #3
_022FAE90:
	cmp r3, r1
	bne _022FAEA4
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movgt r4, #4
_022FAEA4:
	cmp r3, r1
	ldrgtsh r0, [r5, #6]
	cmpgt r0, r2
	movgt r4, #5
	cmp r3, r1
	ble _022FAEC8
	ldrsh r0, [r5, #6]
	cmp r0, r2
	moveq r4, #6
_022FAEC8:
	cmp r3, r1
	ble _022FAEDC
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movlt r4, #7
_022FAEDC:
	mov r0, r5
	mov r1, r4
	bl ov29_022E6928
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FAEEC:
	bl GetFloorType
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetFloorType
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FAF00: .word DUNGEON_PTR
#ifndef JAPAN
_022FAF04: .word 0x00000C21
#endif
	arm_func_end ov29_022FAD4C

	arm_func_start ov29_022FAF08
ov29_022FAF08: ; 0x022FAF08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022FAFC8 ; =DUNGEON_PTR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
#ifdef JAPAN
	add r0, r0, #0x284
#else
	add r0, r0, #0x328
#endif
	add r8, r0, #0x12800
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, r5
	mov r7, #0x36
	b _022FAF74
_022FAF3C:
	ldr r4, [r8, sb, lsl #2]
	mov r0, r4
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAF68
	mov r0, r4
	mov r1, r7
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r5, #1
	bne _022FAF7C
_022FAF68:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_022FAF74:
	cmp sb, #4
	blt _022FAF3C
_022FAF7C:
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _022FAFC8 ; =DUNGEON_PTR
	ldr r0, _022FAFCC ; =0x00012AF8
	ldr r1, [r1]
	ldrsh r1, [r1, r0]
	cmp r1, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0
	bl ov29_0234B09C
	ldr r1, _022FAFD0 ; =0x00000C22
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x78
	mov r1, #0xa
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FAFC8: .word DUNGEON_PTR
#ifdef JAPAN
_022FAFCC: .word 0x00012A54
_022FAFD0: .word 0x00000961
#else
_022FAFCC: .word 0x00012AF8
_022FAFD0: .word 0x00000C22
#endif
	arm_func_end ov29_022FAF08

	arm_func_start ov29_022FAFD4
ov29_022FAFD4: ; 0x022FAFD4
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FAFD4

	arm_func_start GetTeamMemberWithIqSkill
GetTeamMemberWithIqSkill: ; 0x022FAFF8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022FB060 ; =DUNGEON_PTR
	mov r4, #0
	ldr r1, [r1]
	mov r5, r0
#ifdef JAPAN
	add r0, r1, #0x284
#else
	add r0, r1, #0x328
#endif
	mov r7, r4
	add r6, r0, #0x12800
	b _022FB050
_022FB01C:
	ldr r0, [r6, r7, lsl #2]
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FB044
	ldr r0, [r6, r7, lsl #2]
	mov r1, r5
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r4, [r6, r7, lsl #2]
	bne _022FB058
_022FB044:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FB050:
	cmp r7, #4
	blt _022FB01C
_022FB058:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FB060: .word DUNGEON_PTR
	arm_func_end GetTeamMemberWithIqSkill

	arm_func_start TeamMemberHasEnabledIqSkill
TeamMemberHasEnabledIqSkill: ; 0x022FB064
	stmdb sp!, {r3, lr}
	bl GetTeamMemberWithIqSkill
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end TeamMemberHasEnabledIqSkill

	arm_func_start TeamLeaderIqSkillIsEnabled
TeamLeaderIqSkillIsEnabled: ; 0x022FB080
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeader
	mov r1, r4
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end TeamLeaderIqSkillIsEnabled

	arm_func_start CountMovesOutOfPp
CountMovesOutOfPp: ; 0x022FB0A8
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov r0, #0
	mov lr, r0
	mov r2, r0
	mov r3, #1
_022FB0C0:
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
	beq _022FB0F4
	add r1, ip, lr, lsl #3
#ifdef JAPAN
	ldrb r1, [r1, #0x126]
#else
	ldrb r1, [r1, #0x12a]
#endif
	cmp r1, #0
	addeq r0, r0, #1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
_022FB0F4:
	add r1, lr, #1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
	cmp lr, #4
	blt _022FB0C0
	ldmia sp!, {r3, pc}
	arm_func_end CountMovesOutOfPp

	arm_func_start HasSuperEffectiveMoveAgainstUser
HasSuperEffectiveMoveAgainstUser: ; 0x022FB10C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldr r6, [sb, #0xb4]
	mov r7, #0
	mov sl, r0
	mov r8, r2
#ifdef JAPAN
	add r4, r6, #0x120
#else
	add r4, r6, #0x124
#endif
	mov fp, r7
	mov r5, #1
	b _022FB198
_022FB134:
	add r0, r6, r7, lsl #3
#ifdef JAPAN
	ldrb r0, [r0, #0x120]
#else
	ldrb r0, [r0, #0x124]
#endif
	tst r0, #1
	movne r0, r5
	moveq r0, fp
	tst r0, #0xff
	beq _022FB18C
	cmp r8, #0
	beq _022FB168
	add r0, r4, r7, lsl #3
	bl HasMaxGinsengBoost99
	cmp r0, #0
	beq _022FB18C
_022FB168:
	add r0, r4, r7, lsl #3
	bl GetMoveType
	mov r2, r0
	mov r0, sb
	mov r1, sl
	bl GetTypeMatchupBothTypes
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022FB18C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FB198:
	cmp r7, #4
	blt _022FB134
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end HasSuperEffectiveMoveAgainstUser

	arm_func_start ov29_022FB1A8
ov29_022FB1A8: ; 0x022FB1A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r6, [r0, #0xb4]
	mov r4, r7
	mov r5, #1
	b _022FB204
_022FB1C0:
	add r0, r6, r7, lsl #3
#ifdef JAPAN
	ldrb r0, [r0, #0x120]
#else
	ldrb r0, [r0, #0x124]
#endif
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022FB1F8
	add r0, r6, r7, lsl #3
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x24]
#else
	ldrh r0, [r0, #0x28]
#endif
	bl IsOneHitKoMove
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FB1F8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FB204:
	cmp r7, #4
	blt _022FB1C0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FB1A8

	arm_func_start TryEatItem
TryEatItem: ; 0x022FB214
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	mov sl, r0
	mov sb, r1
	mov r5, #0
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FB244
	mov r0, sb
	bl EntityIsValid__022F7364
	cmp r0, #0
	bne _022FB24C
_022FB244:
	mov r0, #0
	b _022FB508
_022FB24C:
	ldr r4, [sb, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrsh r0, [r4, #0x66]
	beq _022FB31C
	cmp r0, #0
	beq _022FB504
	ldrsh r0, [r4, #0x66]
	bl ShouldTryEatItem
	cmp r0, #0
	beq _022FB504
	mov r0, sl
	add r1, r4, #0x62
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022FB504
	mov r0, r5
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, r5
	bl SubstitutePlaceholderStringTags
	add r1, r4, #0x62
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _022FB510 ; =0x00000C24
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrh r2, [r4, #0x62]
	mov r0, sl
	add r1, r4, #0x62
	strh r2, [sp, #8]
	ldrh r2, [r4, #0x64]
	strh r2, [sp, #0xa]
	ldrh r2, [r4, #0x66]
	strh r2, [sp, #0xc]
	bl ov29_0230F9A4
	add r0, r4, #0x62
	bl ItemZInit
	mov r0, r5
	str sl, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r3, sb
	mov r1, r0
	mov r2, r0
	bl ApplyItemEffect
	mov r5, #1
	b _022FB504
_022FB31C:
	bl ShouldTryEatItem
	cmp r0, #0
	beq _022FB3D4
	mov r0, sl
	add r1, r4, #0x62
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022FB504
	mov r0, r5
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, r5
	bl SubstitutePlaceholderStringTags
	add r1, r4, #0x62
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _022FB510 ; =0x00000C24
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrh r2, [r4, #0x62]
	mov r0, sl
	add r1, r4, #0x62
	strh r2, [sp, #8]
	ldrh r2, [r4, #0x64]
	strh r2, [sp, #0xa]
	ldrh r2, [r4, #0x66]
	strh r2, [sp, #0xc]
	bl ov29_0230F9A4
	add r0, r4, #0x62
	bl RemoveEquivItem
	add r0, r4, #0x62
	bl ItemZInit
	mov r0, r5
	str sl, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r3, sb
	mov r1, r0
	mov r2, r0
	bl ApplyItemEffect
	mov r5, #1
	b _022FB504
_022FB3D4:
	bl GetNbItemsInBag
	mov r7, r0
	mov r6, r5
	add r4, sp, #0xe
	b _022FB3F8
_022FB3E8:
	mov r0, r7
	bl RandInt
	strb r0, [r4, r6]
	add r6, r6, #1
_022FB3F8:
	cmp r6, r7
	blt _022FB3E8
	add r0, sp, #0xe
	mov r1, #0
	add r0, r0, r7
	b _022FB418
_022FB410:
	strb r1, [r0, r1]
	add r1, r1, #1
_022FB418:
	cmp r1, r7
	blt _022FB410
	mov r8, #0
	add r4, sp, #0xe
	ldr fp, _022FB514 ; =BAG_ITEMS_PTR_MIRROR
	b _022FB4FC
_022FB430:
	ldrb r1, [r4, r8]
	ldr r3, [fp]
	mov r0, #6
	smulbb r2, r1, r0
	ldr r1, [r3, #0x384]
	ldrb r0, [r1, r2]
	add r6, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022FB4F8
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _022FB4F8
	ldrsh r0, [r6, #4]
	bl ShouldTryEatItem
	cmp r0, #0
	beq _022FB4F8
	mov r0, sl
	mov r1, r6
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022FB504
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #1
	bl ov29_02344B44
	mov r0, sl
	mov r1, sb
	ldr r2, _022FB518 ; =0x00000C25
	bl LogMessageByIdWithPopupCheckUserTarget
	str sl, [sp]
	mov r3, sb
	str r6, [sp, #4]
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl ApplyItemEffect
	mov r0, r6
	bl RemoveEquivItem
	mov r5, #1
	b _022FB504
_022FB4F8:
	add r8, r8, #1
_022FB4FC:
	cmp r8, r7, lsl #1
	blt _022FB430
_022FB504:
	mov r0, r5
_022FB508:
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_022FB510: .word 0x00000963
_022FB514: .word BAG_ITEMS_PTR_MIRROR
_022FB518: .word 0x00000964
#else
_022FB510: .word 0x00000C24
_022FB514: .word BAG_ITEMS_PTR_MIRROR
_022FB518: .word 0x00000C25
#endif
	arm_func_end TryEatItem

	arm_func_start ov29_022FB51C
ov29_022FB51C: ; 0x022FB51C
	stmdb sp!, {r3, lr}
	bl GetScenarioBalance
	cmp r0, #2
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FB51C
