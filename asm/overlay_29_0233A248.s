	.include "asm/macros.inc"
	.include "overlay_29_0233A248.inc"

	.text

	arm_func_start ov29_0233A248
ov29_0233A248: ; 0x0233A248
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	bl ov29_0233A0E8
	cmp r4, #0
	bne _0233A274
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #0
	strb r1, [r0, #0x447]
_0233A274:
	cmp r4, #1
	ldmneia sp!, {r4, pc}
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #0
	strb r1, [r0, #0x448]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0233A248

	arm_func_start InitWeirdMinimapMatrix
InitWeirdMinimapMatrix: ; 0x0233A290
	stmdb sp!, {r3, r4, r5, lr}
	bl GetMinimapData
	add r1, r0, #0xe000
	ldrb r1, [r1, #0x446]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
	mov r3, r4
	mov ip, r4
	mov r2, #0x1c
_0233A2B8:
	mla r5, r4, r2, r0
	mov lr, ip
_0233A2C0:
	add r1, r5, lr
	add r1, r1, #0xe000
	add lr, lr, #1
	strb r3, [r1]
	cmp lr, #0x38
	blt _0233A2C0
	add r4, r4, #1
	cmp r4, #0x20
	blt _0233A2B8
	add r0, r0, #0xe000
	strb r3, [r0, #0x446]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitWeirdMinimapMatrix

	arm_func_start InitMinimapDisplayTile
InitMinimapDisplayTile: ; 0x0233A2F0
	ldr r3, [r0]
	ldmia r1, {r2, ip}
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0]
	ldr r3, [r0, #4]
	ldr r2, [r1, #8]
	ldr ip, [r1, #0xc]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #4]
	ldr r3, [r0, #8]
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0x14]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #8]
	ldr r3, [r0, #0xc]
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x1c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0xc]
	ldr r3, [r0, #0x10]
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x24]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x10]
	ldr r3, [r0, #0x14]
	ldr r2, [r1, #0x28]
	ldr ip, [r1, #0x2c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x14]
	ldr r3, [r0, #0x18]
	ldr r2, [r1, #0x30]
	ldr ip, [r1, #0x34]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	ldr r2, [r1, #0x38]
	ldr ip, [r1, #0x3c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x1c]
	ldr r3, [r0, #0x20]
	ldr r2, [r1, #0x40]
	ldr ip, [r1, #0x44]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r2, [r1, #0x48]
	ldr ip, [r1, #0x4c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x24]
	ldr r3, [r0, #0x28]
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x54]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x28]
	ldr r3, [r0, #0x2c]
	ldr r2, [r1, #0x58]
	ldr ip, [r1, #0x5c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r1, #0x60]
	ldr ip, [r1, #0x64]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x30]
	ldr r3, [r0, #0x34]
	ldr r2, [r1, #0x68]
	ldr ip, [r1, #0x6c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x34]
	ldr r3, [r0, #0x38]
	ldr r2, [r1, #0x70]
	ldr ip, [r1, #0x74]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x38]
	ldr r3, [r0, #0x3c]
	ldr r2, [r1, #0x78]
	ldr ip, [r1, #0x7c]
	and r1, r3, r2
	orr r1, ip, r1
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end InitMinimapDisplayTile

	arm_func_start ov29_0233A470
ov29_0233A470: ; 0x0233A470
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	add r2, r0, #0x21c0
	add r5, r0, #0xe000
	add ip, r2, #0xc000
	ldr r0, _0233A544 ; =ov29_0235377C
	mov r6, r4
	b _0233A534
_0233A490:
	add lr, ip, r4, lsl #4
	add r2, lr, r1, lsl #2
	ldr r3, [r2, #4]
	ldr sb, [ip, r4, lsl #4]
	ldr r8, [r0, r1, lsl #2]
	ldr r7, [r3]
	add r2, sb, r8
	str r7, [sb, r8]
	ldr r7, [r3, #4]
	add r4, r4, #1
	str r7, [r2, #4]
	ldr r7, [r3, #8]
	str r7, [r2, #8]
	ldr r7, [r3, #0xc]
	str r7, [r2, #0xc]
	ldr r7, [r3, #0x10]
	str r7, [r2, #0x10]
	ldr r7, [r3, #0x14]
	str r7, [r2, #0x14]
	ldr r7, [r3, #0x18]
	str r7, [r2, #0x18]
	ldr r7, [r3, #0x1c]
	str r7, [r2, #0x1c]
	ldr r7, [r3, #0x20]
	str r7, [r2, #0x20]
	ldr r7, [r3, #0x24]
	str r7, [r2, #0x24]
	ldr r7, [r3, #0x28]
	str r7, [r2, #0x28]
	ldr r7, [r3, #0x2c]
	str r7, [r2, #0x2c]
	ldr r7, [r3, #0x30]
	str r7, [r2, #0x30]
	ldr r7, [r3, #0x34]
	str r7, [r2, #0x34]
	ldr r7, [r3, #0x38]
	str r7, [r2, #0x38]
	ldr r3, [r3, #0x3c]
	str r3, [r2, #0x3c]
	ldr r2, [lr, #0xc]
	strb r6, [r2]
_0233A534:
	ldr r2, [r5, #0x440]
	cmp r4, r2
	blt _0233A490
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233A544: .word ov29_0235377C
	arm_func_end ov29_0233A470

	arm_func_start ov29_0233A548
ov29_0233A548: ; 0x0233A548
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0233A5E0 ; =MAP_COLOR_TABLE
	ldr r7, _0233A5E4 ; =ov29_0235376C
	mov r6, r1
	add r5, r2, r0, lsl #2
	mov r4, #0
_0233A560:
	cmp r4, #7
	bne _0233A5B0
	cmp r6, #0
	bne _0233A58C
	add r0, r4, #0x100
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r2, r6
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
	b _0233A5D0
_0233A58C:
	ldr r1, [r7, #8]
	add r0, r4, #0x100
	ldr r3, [r1, #4]
	mov r1, r0, lsl #0x10
	mov r2, r6
	add r0, r3, r4, lsl #2
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
	b _0233A5D0
_0233A5B0:
	ldr r1, [r7, #8]
	add r0, r4, #0x100
	ldr r3, [r1, #4]
	mov r1, r0, lsl #0x10
	mov r2, r6
	add r0, r3, r4, lsl #2
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
_0233A5D0:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0233A560
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233A5E0: .word MAP_COLOR_TABLE
_0233A5E4: .word ov29_0235376C
	arm_func_end ov29_0233A548

	arm_func_start ov29_0233A5E8
ov29_0233A5E8: ; 0x0233A5E8
	stmdb sp!, {r4, lr}
	ldr ip, _0233A620 ; =ov29_0235352C
	mov r3, #0xc
	ldr ip, [ip]
	mov lr, r0
	add r0, ip, #0x20
	mla r4, r2, r3, r0
	ldr r0, [r4, #8]
	mov r2, r1
	mov r1, lr
	bl sub_0200C008
	ldr r0, [r4, #8]
	bl sub_0200A174
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A620: .word ov29_0235352C
	arm_func_end ov29_0233A5E8

	arm_func_start LoadFixedRoomDataVeneer
LoadFixedRoomDataVeneer: ; 0x0233A624
	ldr ip, _0233A62C ; =LoadFixedRoomData
	bx ip
	.align 2, 0
_0233A62C: .word LoadFixedRoomData
	arm_func_end LoadFixedRoomDataVeneer

	arm_func_start UnloadFixedRoomData
UnloadFixedRoomData: ; 0x0233A630
	stmdb sp!, {r3, lr}
	bl ov29_02343DD8
	ldr r0, _0233A650 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x12000
#ifdef JAPAN
	str r1, [r0, #0xa00]
#else
	str r1, [r0, #0xaa4]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A650: .word DUNGEON_PTR
	arm_func_end UnloadFixedRoomData

	arm_func_start IsNormalFloor
IsNormalFloor: ; 0x0233A654
	stmdb sp!, {r3, lr}
	bl IsHiddenStairsFloor
	cmp r0, #0
	bne _0233A6C4
	bl IsGoldenChamber
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xa
	mov r1, #6
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	bne _0233A6C4
	ldr r0, _0233A6D4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0
	beq _0233A6CC
	cmp r0, #0xa5
	bhs _0233A6CC
_0233A6C4:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0233A6CC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A6D4: .word DUNGEON_PTR
	arm_func_end IsNormalFloor

	arm_func_start GenerateFloor
GenerateFloor: ; 0x0233A6D8
#ifdef JAPAN
#define GENERATE_FLOOR_OFFSET -0xA4
#else
#define GENERATE_FLOOR_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	ldr r2, _0233AE64 ; =DUNGEON_PTR
	mov r8, #0
	ldr r3, [r2]
	ldr r0, _0233AE68 ; =0x000286B2
	add r1, r3, #0x12000
	str r8, [r1, #0xaa4 + GENERATE_FLOOR_OFFSET]
	ldr r1, [r2]
	add sb, r3, r0
	add r0, r1, #0x3f00
	strh r8, [r0, #0xc2 + GENERATE_FLOOR_OFFSET]
	bl LoadFixedRoomDataVeneer
	bl ov29_02343DC4
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r1, [r1]
	mov r3, r8
	add r1, r1, #0x12000
	str r0, [r1, #0xaa4 + GENERATE_FLOOR_OFFSET]
	strb r3, [r2, #3]
	strb r3, [r2, #1]
	strb r3, [r2, #7]
	bl ResetHiddenStairsSpawn
	bl IsOutlawMonsterHouseFloor
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r3, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r2, [r1]
	mov r1, sb
	add r2, r2, #0xc4 + GENERATE_FLOOR_OFFSET
	strb r0, [r3, #8]
	add r0, r2, #0x4000
	bl GetHiddenStairsType
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r1, [r1]
	str r0, [r2, #0x2c]
	add r0, r1, #0x4000
	ldrsh r1, [r0, #0xd4 + GENERATE_FLOOR_OFFSET]
	ldr r0, _0233AE70 ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r0, r1]
	mov r1, #0xff
	cmp r0, #2
	moveq r2, #1
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	movne r2, r8
	strb r2, [r0, #4]
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #6]
	ldrb r0, [sb, #7]
	bl GetFinalKecleonShopSpawnChance
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	strh r0, [r1, #0xc]
	ldrb r0, [sb, #8]
	strh r0, [r1, #0x10]
	ldrb r0, [r1, #8]
	cmp r0, #0
	movne r0, #0x64
	strneh r0, [r1, #0x10]
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r1, #1
	strb r1, [r0]
	sub r1, r1, #2
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bl ResetFloor
	bl IsNormalFloor
	cmp r0, #0
	bne _0233A810
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0x86]
	b _0233A828
_0233A810:
	ldrb r0, [sb, #6]
	bl abs
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x700
	strh r0, [r1, #0x86]
_0233A828:
	ldr r3, _0233AE64 ; =DUNGEON_PTR
	mov r7, #0
	ldr r0, [r3]
	ldr r1, _0233AE74 ; =0x00012AFA
	add r0, r0, #0x4000
	strb r7, [r0, #0xc5 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r3]
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	add r0, r0, #0x4000
	strb r7, [r0, #0xc6 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r3]
	strh r7, [r0, r1]
	ldr r0, [r3]
	add r0, r0, #0x4000
	str r7, [r0, #0xcc + GENERATE_FLOOR_OFFSET]
	ldrb r0, [sb, #0xc]
	str r0, [r2, #0x18]
	b _0233AD3C
_0233A870:
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	mov r0, #0
	str r0, [sp]
	ldr r0, [r1]
	add r0, r0, #0xc4 + GENERATE_FLOOR_OFFSET
	add r0, r0, #0x4000
	bl ResetImportantSpawnPositions
	mov r6, #0
	mvn r5, #0
	ldr r4, _0233AE64 ; =DUNGEON_PTR
	b _0233AC50
_0233A89C:
	ldr r0, [sp]
	cmp r0, #0
	beq _0233A8C8
	ldr r0, [r4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + GENERATE_FLOOR_OFFSET]
	bl IsNotFullFloorFixedRoom
	cmp r0, #0
	beq _0233AC58
	mov r0, #0
	str r0, [sp]
_0233A8C8:
	ldr r0, [r4]
	cmp r6, #1
	add r0, r0, #0x4000
	strh r6, [r0, #0xde + GENERATE_FLOOR_OFFSET]
	ldrge r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	movge r1, #0
	strge r1, [r0, #0x18]
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r1, #0
	strb r1, [r0, #5]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	bl ResetFloor
	ldr r0, [r4]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe0 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe2 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #0
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + GENERATE_FLOOR_OFFSET]
	cmp r0, #0
	beq _0233A954
	mov r1, sb
	bl GenerateFixedRoom
	cmp r0, #0
	bne _0233AC58
	mov r0, #1
	str r0, [sp]
	b _0233AB78
_0233A954:
	mov r0, #2
	ldrb sl, [sb]
	mov fp, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	b _0233A9DC
_0233A96C:
	cmp sl, #8
	mov r0, #2
	beq _0233A998
	mov r1, #9
	bl DungeonRandRange
	str r0, [sp, #8]
	mov r0, #2
	mov r1, #8
	bl DungeonRandRange
	str r0, [sp, #4]
	b _0233A9B4
_0233A998:
	mov r1, #5
	bl DungeonRandRange
	str r0, [sp, #8]
	mov r0, #2
	mov r1, #4
	bl DungeonRandRange
	str r0, [sp, #4]
_0233A9B4:
	ldr r0, [sp, #8]
	cmp r0, #6
	ldrle r0, [sp, #4]
	cmple r0, #4
	ble _0233A9E4
	subs fp, fp, #1
	moveq r0, #4
	streq r0, [sp, #8]
	streq r0, [sp, #4]
	beq _0233A9E4
_0233A9DC:
	cmp fp, #0
	bne _0233A96C
_0233A9E4:
	ldr r1, [sp, #8]
	mov r0, #0x38
	bl _s32_div_f
	cmp r0, #7
	movle r0, #1
	strle r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, #0x20
	bl _s32_div_f
	ldr r1, [r4]
	cmp r0, #7
	add r2, r1, #0x4000
	mov r1, #0
	strb r1, [r2, #0xc4 + GENERATE_FLOOR_OFFSET]
	ldr r1, [r4]
	movle r0, #1
	add r2, r1, #0x4000
	mov r1, #0xff
	strb r1, [r2, #0xc9 + GENERATE_FLOOR_OFFSET]
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	strle r0, [sp, #4]
	and r0, sl, #0xf
	cmp r0, #0xb
	str sl, [r1, #0x28]
	addls pc, pc, r0, lsl #2
	b _0233AAD4
_0233AA4C: ; jump table
	b _0233AAD4 ; case 0
	b _0233AA7C ; case 1
	b _0233AAEC ; case 2
	b _0233AB04 ; case 3
	b _0233AB14 ; case 4
	b _0233AB24 ; case 5
	b _0233AB3C ; case 6
	b _0233AB4C ; case 7
	b _0233AAD4 ; case 8
	b _0233AB58 ; case 9
	b _0233AB64 ; case 10
	b _0233AAA8 ; case 11
_0233AA7C:
	mov r0, #2
	bl DungeonRandInt
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, #1
	strb r2, [r1, #6]
	add r1, r0, #2
	mov r0, #4
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAA8:
	mov r0, #2
	bl DungeonRandInt
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, #2
	strb r2, [r1, #6]
	add r1, r0, #2
	mov r0, #4
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAD4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAEC:
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #1
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	b _0233AB78
_0233AB04:
	mov r0, sb
	bl GenerateOuterRingFloor
	mov r8, #1
	b _0233AB78
_0233AB14:
	mov r0, sb
	bl GenerateCrossroadsFloor
	mov r8, #1
	b _0233AB78
_0233AB24:
	bl GenerateTwoRoomsWithMonsterHouseFloor
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #1
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	b _0233AB78
_0233AB3C:
	mov r0, sb
	bl GenerateLineFloor
	mov r8, #1
	b _0233AB78
_0233AB4C:
	mov r0, sb
	bl GenerateCrossFloor
	b _0233AB78
_0233AB58:
	mov r0, sb
	bl GenerateBeetleFloor
	b _0233AB78
_0233AB64:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r2, sb
	bl GenerateOuterRoomsFloor
	mov r8, #1
_0233AB78:
	bl ResetInnerBoundaryTileRows
	bl EnsureImpassableTilesAreWalls
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0233AC4C
	mov sl, #0
	mov r2, sl
_0233AB98:
	mov r1, #0
	add r0, sp, #0x14
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x40
	blt _0233AB98
	mov r0, r1
	str r0, [sp, #0xc]
_0233ABB8:
	mov fp, #0
_0233ABBC:
	ldr r0, [sp, #0xc]
	mov r1, fp
	bl GetTile
	str r0, [sp, #0x10]
	bl GetTileTerrain
	cmp r0, #1
	bne _0233ABFC
	ldr r0, [sp, #0x10]
	ldrb r2, [r0, #7]
	cmp r2, #0xf0
	bhi _0233ABFC
	cmp r2, #0x40
	movlo r1, #1
	addlo r0, sp, #0x14
	add sl, sl, #1
	strlob r1, [r0, r2]
_0233ABFC:
	add fp, fp, #1
	cmp fp, #0x20
	blt _0233ABBC
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x38
	blt _0233ABB8
	mov r1, #0
	mov r2, r1
_0233AC24:
	add r0, sp, #0x14
	ldrb r0, [r0, r2]
	add r2, r2, #1
	cmp r0, #0
	addne r1, r1, #1
	cmp r2, #0x40
	blt _0233AC24
	cmp sl, #0x1e
	cmpge r1, #2
	bge _0233AC58
_0233AC4C:
	add r6, r6, #1
_0233AC50:
	cmp r6, #0xa
	blt _0233A89C
_0233AC58:
	cmp r6, #0xa
	bne _0233AC88
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mvn r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xc4 + GENERATE_FLOOR_OFFSET]
_0233AC88:
	bl FinalizeJunctions
	cmp r8, #0
	beq _0233ACA0
	mov r1, sb
	mov r0, #1
	bl GenerateSecondaryTerrainFormations
_0233ACA0:
	bl DungeonRand100
	ldrb r1, [sb, #0x19]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r4, r0, #0xff
	mov r0, sb
	mov r1, r4
	bl MarkNonEnemySpawns
	mov r0, sb
	mov r1, r4
	bl MarkEnemySpawns
	bl ResolveInvalidSpawns
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r2, [r0, #0xe0 + GENERATE_FLOOR_OFFSET]
	cmp r2, r1
	ldrnesh r0, [r0, #0xe2 + GENERATE_FLOOR_OFFSET]
	cmpne r0, r1
	beq _0233AD38
	bl GetFloorType
	cmp r0, #1
	beq _0233AD44
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mvn r2, #0
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe4 + GENERATE_FLOOR_OFFSET]
	cmp r0, r2
	ldrnesh r1, [r1, #0xe6 + GENERATE_FLOOR_OFFSET]
	cmpne r1, r2
	beq _0233AD38
	mov r2, #0
	bl StairsAlwaysReachable
	cmp r0, #0
	bne _0233AD44
_0233AD38:
	add r7, r7, #1
_0233AD3C:
	cmp r7, #0xa
	blt _0233A870
_0233AD44:
	cmp r7, #0xa
	bne _0233AD98
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mvn r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	bl ResetFloor
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xc4 + GENERATE_FLOOR_OFFSET]
	bl FinalizeJunctions
	mov r0, sb
	mov r1, #0
	bl MarkNonEnemySpawns
	mov r0, sb
	mov r1, #0
	bl MarkEnemySpawns
	bl ResolveInvalidSpawns
_0233AD98:
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrsh r1, [r0, #0x20]
	cmp r1, #0
	ldrgesh r0, [r0, #0x22]
	cmpge r0, #0
	blt _0233ADCC
	bl GetKecleonIdToSpawnByFloor
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, r0
	ldrsh r0, [r1, #0x20]
	ldrsh r1, [r1, #0x22]
	mov r3, #0
	bl MarkShopkeeperSpawn
_0233ADCC:
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x30]
	cmp r0, #0
	ldrlt r0, _0233AE64 ; =DUNGEON_PTR
	movlt r1, #0
	blt _0233ADF4
	mov r0, sb
	bl ov29_023427E4
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
_0233ADF4:
	ldr r0, [r0]
	mov r2, #0x38
	add r0, r0, #0x4000
	strb r1, [r0, #0xc6 + GENERATE_FLOOR_OFFSET]
	mov r0, #0
	mov r1, r0
	mov r3, #0x20
	bl FlagHallwayJunctions
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0233AE28
	bl ConvertSecondaryTerrainToChasms
_0233AE28:
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4 + GENERATE_FLOOR_OFFSET]
	sub r0, r0, #0x1a
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0233AE58
	bl ConvertWallsToChasms
_0233AE58:
	bl UnloadFixedRoomData
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233AE64: .word DUNGEON_PTR
_0233AE68: .word 0x000286B2 + GENERATE_FLOOR_OFFSET
_0233AE6C: .word FLOOR_GENERATION_STATUS
_0233AE70: .word SECONDARY_TERRAIN_TYPES
_0233AE74: .word 0x00012AFA + GENERATE_FLOOR_OFFSET
	arm_func_end GenerateFloor
