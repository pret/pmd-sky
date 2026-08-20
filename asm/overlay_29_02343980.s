	.include "asm/macros.inc"
	.include "overlay_29_02343980.inc"

	.text

	arm_func_start ov29_02343980
ov29_02343980: ; 0x02343980
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r4, r7
	mov r5, r7
_02343990:
	mov r6, r5
_02343994:
	mov r0, r6
	mov r1, r7
	bl GetTileSafe
	ldrb r1, [r0, #6]
	cmp r1, #0x10
	blo _023439BC
	mov r2, r6
	mov r3, r7
	str r4, [sp]
	bl PlaceFixedRoomTile
_023439BC:
	add r6, r6, #1
	cmp r6, #0x38
	blt _02343994
	add r7, r7, #1
	cmp r7, #0x20
	blt _02343990
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_02343980

	arm_func_start TryOpenKeyDoor
TryOpenKeyDoor: ; 0x023439D8
#ifdef JAPAN
#define OV29_023439D8_OFFSET -0xA4
#else
#define OV29_023439D8_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r4, _02343CD0 ; =DUNGEON_PTR
	mov sb, r1
	ldr r4, [r4]
	mov sl, r0
	add r1, r4, #0x4000
	ldrb r1, [r1, #0xc5 + OV29_023439D8_OFFSET]
	str r2, [sp, #4]
	cmp r1, #0
	bne _02343CC0
	bl IsFullFloorFixedRoom
	ldrsh r1, [sl, #4]
	cmp r0, #0
	str r0, [sp, #8]
	strh r1, [sp, #0xc]
	ldrsh r0, [sl, #6]
	sub r0, r0, #1
	strh r0, [sp, #0xe]
	ldrb fp, [sl, #0x25]
	bne _02343C24
	ldrsh r0, [sl, #6]
	sub r8, r0, #0x15
	b _02343B68
_02343A38:
	ldrsh r0, [sl, #4]
	sub r4, r0, #0x14
	b _02343B54
_02343A44:
	ldr r0, _02343CD0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldr r1, [r0, #0xd24 + OV29_023439D8_OFFSET]
	ldr r2, [r0, #0xd28 + OV29_023439D8_OFFSET]
	subs r5, r4, r1
	sub r6, r8, r2
	bmi _02343B50
	cmp r6, #0
	blt _02343B50
	cmp r5, #8
	cmplt r6, #8
	bge _02343B50
	add r1, r1, #1
	cmp r4, r1
	addge r1, r2, #1
	cmpge r8, r1
	blt _02343B50
	ldr r1, [r0, #0xd2c + OV29_023439D8_OFFSET]
	sub r1, r1, #1
	cmp r4, r1
	ldrlt r0, [r0, #0xd30 + OV29_023439D8_OFFSET]
	sublt r0, r0, #1
	cmplt r8, r0
	bge _02343B50
	mov r0, r4
	mov r1, r8
	bl GetTileSafe
	mov r7, r0
	ldrh r0, [r7]
	tst r0, #0x100
	beq _02343B0C
	mov r0, #0xa0
	mul r1, r5, r0
	mov r0, #0x14
	ldr r2, _02343CD0 ; =DUNGEON_PTR
	mul r0, r6, r0
	ldr r2, [r2]
	add r2, r2, r1
	add r2, r0, r2
#ifdef JAPAN
	add r2, r2, #0xcc00
	ldrh r2, [r2, #0xbc]
#else
	add r2, r2, #0xcd00
	ldrh r2, [r2, #0x60]
#endif
	strh r2, [r7]
	ldr r2, _02343CD0 ; =DUNGEON_PTR
	ldr r2, [r2]
	add r1, r2, r1
	add r0, r0, r1
#ifdef JAPAN
	add r0, r0, #0xcc00
	ldrh r0, [r0, #0xbe]
#else
	add r0, r0, #0xcd00
	ldrh r0, [r0, #0x62]
#endif
	strh r0, [r7, #2]
_02343B0C:
	mov r0, #1
	str r0, [sp]
	ldr r1, _02343CD0 ; =DUNGEON_PTR
	mov r0, r7
	ldr r1, [r1]
	mov r2, r4
	add r1, r1, r5, lsl #4
	add r1, r1, r6, lsl #1
#ifdef JAPAN
	add r1, r1, #0xd100
	ldrh r1, [r1, #0xbc]
#else
	add r1, r1, #0xd200
	ldrh r1, [r1, #0x60]
#endif
	mov r3, r8
	bl PlaceFixedRoomTile
	ldrh r0, [r7, #2]
	cmp fp, #0xff
	orr r0, r0, #3
	strh r0, [r7, #2]
	strneb fp, [r7, #7]
_02343B50:
	add r4, r4, #1
_02343B54:
	ldrsh r0, [sl, #4]
	add r0, r0, #0x14
	cmp r4, r0
	ble _02343A44
	add r8, r8, #1
_02343B68:
	ldrsh r1, [sl, #6]
	add r0, r1, #0x13
	cmp r8, r0
	ble _02343A38
	sub r4, r1, #0x15
	b _02343C14
_02343B80:
	ldrsh r0, [sl, #4]
	ldr r6, _02343CD0 ; =DUNGEON_PTR
	sub r5, r0, #0x14
	b _02343C00
_02343B90:
	ldr r0, [r6]
	add r0, r0, #0xc000
	ldr r7, [r0, #0xd24 + OV29_023439D8_OFFSET]
	ldr r2, [r0, #0xd28 + OV29_023439D8_OFFSET]
	subs r3, r5, r7
	sub r1, r4, r2
	bmi _02343BFC
	cmp r1, #0
	blt _02343BFC
	cmp r3, #8
	cmplt r1, #8
	bge _02343BFC
	add r1, r7, #1
	cmp r5, r1
	addge r1, r2, #1
	cmpge r4, r1
	blt _02343BFC
	ldr r1, [r0, #0xd2c + OV29_023439D8_OFFSET]
	sub r1, r1, #1
	cmp r5, r1
	ldrlt r0, [r0, #0xd30 + OV29_023439D8_OFFSET]
	sublt r0, r0, #1
	cmplt r4, r0
	bge _02343BFC
	mov r0, r5
	mov r1, r4
	bl ov29_02336694
_02343BFC:
	add r5, r5, #1
_02343C00:
	ldrsh r0, [sl, #4]
	add r0, r0, #0x14
	cmp r5, r0
	ble _02343B90
	add r4, r4, #1
_02343C14:
	ldrsh r0, [sl, #6]
	add r0, r0, #0x13
	cmp r4, r0
	ble _02343B80
_02343C24:
	ldr r0, _02343CD0 ; =DUNGEON_PTR
	mov r2, #1
	ldr r0, [r0]
	ldr r1, _02343CD4 ; =0xFFFFCFEF
	add r0, r0, #0x4000
	strb r2, [r0, #0xc5 + OV29_023439D8_OFFSET]
	ldr r0, [sp, #8]
	ldrh r2, [sb]
	cmp r0, #0
	and r0, r2, r1
	strh r0, [sb]
	beq _02343C6C
	ldrh r0, [sb]
	bic r0, r0, #3
	strh r0, [sb]
	ldrh r0, [sb]
	orr r0, r0, #1
	strh r0, [sb]
_02343C6C:
	ldrsh r1, [sl, #6]
	ldrsh r0, [sl, #4]
	sub r1, r1, #1
	bl ov29_02336694
	bl DetermineAllTilesWalkableNeighbors
	bl UpdateTrapsVisibility
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	add r0, sp, #0xc
	and r1, r1, #0xff
	bl PlayKeyDoorUnlockEffect
	ldr r1, [sp, #4]
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x14
	mov r1, #0x3c
	bl ov29_022EA370
	b _02343CC8
_02343CC0:
	mov r1, r3
	bl LogMessageByIdWithPopupCheckUser
_02343CC8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02343CD0: .word DUNGEON_PTR
_02343CD4: .word 0xFFFFCFEF
	arm_func_end TryOpenKeyDoor

	arm_func_start ApplyKeyEffect
ApplyKeyEffect: ; 0x02343CD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r1, [r4, #6]
	ldrsh r0, [r4, #4]
	sub r1, r1, #1
	bl GetTileSafe
	mov r1, r0
	ldrh r0, [r1]
	tst r0, #0x1000
	bne _02343D10
	ldr r1, _02343D28 ; =0x00000B94
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, pc}
_02343D10:
	ldr r2, _02343D2C ; =0x00000B93
	mov r0, r4
	add r3, r2, #1
	bl TryOpenKeyDoor
	bl UpdateMinimap
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02343D28: .word 0x000008A6
_02343D2C: .word 0x000008A5
#else
_02343D28: .word 0x00000B94
_02343D2C: .word 0x00000B93
#endif
	arm_func_end ApplyKeyEffect

	arm_func_start ov29_02343D30
ov29_02343D30: ; 0x02343D30
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrsh r1, [r5, #6]
	ldrsh r0, [r5, #4]
	sub r1, r1, #1
	bl GetTileSafe
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #0x2000
	bne _02343D68
	ldr r1, _02343D88 ; =0x00000B95
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_02343D68:
	bl ov29_02348BE8
	ldr r2, _02343D8C ; =0x00000B93
	mov r0, r5
	mov r1, r4
	add r3, r2, #2
	bl TryOpenKeyDoor
	bl UpdateMinimap
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02343D88: .word 0x000008A7
_02343D8C: .word 0x000008A5
#else
_02343D88: .word 0x00000B95
_02343D8C: .word 0x00000B93
#endif
	arm_func_end ov29_02343D30

	arm_func_start LoadFixedRoomData
LoadFixedRoomData: ; 0x02343D90
	stmdb sp!, {r3, lr}
	ldr r0, _02343DBC ; =FIXED_ROOM_DATA_PTR
	ldr r1, _02343DC0 ; =ov29_02353110
	ldr r0, [r0]
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02343DBC ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	ldr r1, [r0], #8
	bl HandleSir0Translation
	ldmia sp!, {r3, pc}
	.align 2, 0
_02343DBC: .word FIXED_ROOM_DATA_PTR
_02343DC0: .word ov29_02353110
	arm_func_end LoadFixedRoomData

	arm_func_start ov29_02343DC4
ov29_02343DC4: ; 0x02343DC4
	ldr r0, _02343DD4 ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_02343DD4: .word FIXED_ROOM_DATA_PTR
	arm_func_end ov29_02343DC4

	arm_func_start ov29_02343DD8
ov29_02343DD8: ; 0x02343DD8
	stmdb sp!, {r3, lr}
	ldr r0, _02343E1C ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02343E1C ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	bl UnloadFile
	ldr r0, _02343E1C ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	bl ZInit8
	ldr r0, _02343E1C ; =FIXED_ROOM_DATA_PTR
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02343E1C: .word FIXED_ROOM_DATA_PTR
	arm_func_end ov29_02343DD8

	arm_func_start LoadFixedRoom
LoadFixedRoom: ; 0x02343E20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	movs r4, r2
	mov sl, r0
	str r1, [sp]
	str r3, [sp, #4]
	moveq r0, #0
	beq _0234402C
	bl LoadFixedRoomData
	ldr r0, _02344034 ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r0, [r0, r4, lsl #2]
	ldrh r4, [r0]
	ldrh r5, [r0, #2]
	bl ov29_02342BEC
	mul fp, r4, r5
	mov sb, #0
	str r0, [sp, #8]
	mov r4, r0
	mov r5, sb
	b _02344014
_02343E78:
	ldrh r2, [r4]
	ldr r1, _02344038 ; =0x00000FFF
	ldr r0, [sp]
	and r2, r2, r1
	cmp sb, r0
	bge _0234401C
	cmp r2, #0x10
	blt _0234400C
	sub r0, r1, #0xe00
	cmp r2, r0
	bgt _0234400C
	ldr r1, _0234403C ; =FIXED_ROOM_ENTITY_SPAWN_TABLE
	sub r2, r2, #0x10
	mov r0, #0xc
	smlabb r0, r2, r0, r1
	ldr r6, [r0, #4]
	ldrsh r0, [r6]
	cmp r0, #0
	ldrne r1, _02344040 ; =0x00000229
	cmpne r0, r1
	ldrne r1, _02344044 ; =0x00000483
	cmpne r0, r1
	beq _0234400C
	bl GetMatchingMonsterId
	movs r8, r0
	beq _0234400C
	mov r7, #0
	b _02343EFC
_02343EE8:
	add r0, sl, r7, lsl #3
	bl GetMonsterIdFromSpawnEntry
	cmp r8, r0
	beq _02343F04
	add r7, r7, #1
_02343EFC:
	cmp r7, sb
	blt _02343EE8
_02343F04:
	cmp r7, sb
	bne _0234400C
	ldrb r0, [r6, #3]
	cmp r0, #1
	bne _02343F40
	ldr r0, _02344048 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetOutlawLevel
	mov r1, r0
	add r0, sp, #0xc
	mov r2, r8
	bl SetMonsterLevelAndId
	b _02343FE8
_02343F40:
	cmp r0, #4
	bne _02343F70
	ldr r0, _02344048 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetOutlawLeaderLevel
	mov r1, r0
	add r0, sp, #0xc
	mov r2, r8
	bl SetMonsterLevelAndId
	b _02343FE8
_02343F70:
	cmp r0, #5
	bne _02343FA0
	ldr r0, _02344048 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetOutlawMinionLevel
	mov r1, r0
	add r0, sp, #0xc
	mov r2, r8
	bl SetMonsterLevelAndId
	b _02343FE8
_02343FA0:
	ldrb r3, [r6, #2]
	cmp r3, #0
	ldrnesh r1, [r6]
	ldrne r0, _0234404C ; =0x00000485
	cmpne r1, r0
	bne _02343FCC
	ldr r1, [sp, #4]
	add r0, sp, #0xc
	mov r2, r8
	bl SetMonsterLevelAndId
	b _02343FE8
_02343FCC:
	mov r0, #0xc
	mul r2, r3, r0
	ldr r1, _02344050 ; =FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	add r0, sp, #0xc
	ldrsh r1, [r1, r2]
	mov r2, r8
	bl SetMonsterLevelAndId
_02343FE8:
	mov r0, sb, lsl #3
	add r3, sp, #0xc
	add sb, sb, #1
	add r2, sl, r0
	mov r1, #4
_02343FFC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02343FFC
_0234400C:
	add r5, r5, #1
	add r4, r4, #2
_02344014:
	cmp r5, fp
	blt _02343E78
_0234401C:
	ldr r0, [sp, #8]
	bl MemFree
	bl ov29_02343DD8
	mov r0, sb
_0234402C:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02344034: .word FIXED_ROOM_DATA_PTR
_02344038: .word 0x00000FFF
_0234403C: .word FIXED_ROOM_ENTITY_SPAWN_TABLE
_02344040: .word 0x00000229
_02344044: .word 0x00000483
_02344048: .word DUNGEON_PTR
_0234404C: .word 0x00000485
_02344050: .word FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	arm_func_end LoadFixedRoom

	arm_func_start OpenFixedBin
OpenFixedBin: ; 0x02344054
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0
	bl MemAlloc
	ldr r2, _02344084 ; =FIXED_ROOM_DATA_PTR
	mov r1, #0xc
	str r0, [r2]
	bl MemZero
	ldr r0, _02344084 ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	bl ZInit8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02344084: .word FIXED_ROOM_DATA_PTR
	arm_func_end OpenFixedBin

	arm_func_start CloseFixedBin
CloseFixedBin: ; 0x02344088
	stmdb sp!, {r3, lr}
	ldr r0, _023440A8 ; =FIXED_ROOM_DATA_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023440A8 ; =FIXED_ROOM_DATA_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023440A8: .word FIXED_ROOM_DATA_PTR
	arm_func_end CloseFixedBin

	arm_func_start AreOrbsAllowed
AreOrbsAllowed: ; 0x023440AC
	cmp r0, #0
	beq _023440BC
	cmp r0, #0xa5
	blo _023440C4
_023440BC:
	mov r0, #1
	bx lr
_023440C4:
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _023440D8 ; =ov10_022C6C77
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_023440D8: .word ov10_022C6C77
	arm_func_end AreOrbsAllowed

	arm_func_start AreTileJumpsAllowed
AreTileJumpsAllowed: ; 0x023440DC
	cmp r0, #0
	beq _023440EC
	cmp r0, #0xa5
	blo _023440F4
_023440EC:
	mov r0, #1
	bx lr
_023440F4:
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02344108 ; =ov10_022C6C78
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02344108: .word ov10_022C6C78
	arm_func_end AreTileJumpsAllowed

	arm_func_start AreTrawlOrbsAllowed
AreTrawlOrbsAllowed: ; 0x0234410C
	cmp r0, #0
	beq _0234411C
	cmp r0, #0xa5
	blo _02344124
_0234411C:
	mov r0, #1
	bx lr
_02344124:
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02344138 ; =ov10_022C6C79
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02344138: .word ov10_022C6C79
	arm_func_end AreTrawlOrbsAllowed

	arm_func_start AreOrbsAllowedVeneer
AreOrbsAllowedVeneer: ; 0x0234413C
	ldr ip, _02344144 ; =AreOrbsAllowed
	bx ip
	.align 2, 0
_02344144: .word AreOrbsAllowed
	arm_func_end AreOrbsAllowedVeneer

	arm_func_start AreLateGameTrapsEnabled
AreLateGameTrapsEnabled: ; 0x02344148
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0234415C ; =ov10_022C6C75
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_0234415C: .word ov10_022C6C75
	arm_func_end AreLateGameTrapsEnabled
