	.include "asm/macros.inc"
	.include "overlay_29_0233AE84.inc"

	.text

	arm_func_start DungeonRand100
DungeonRand100: ; 0x0233AE84
	ldr ip, _0233AE90 ; =DungeonRandInt
	mov r0, #0x64
	bx ip
	.align 2, 0
_0233AE90: .word DungeonRandInt
	arm_func_end DungeonRand100

	arm_func_start ClearHiddenStairs
ClearHiddenStairs: ; 0x0233AE94
	stmdb sp!, {r3, lr}
	ldr r0, _0233AF04 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0233AF08 ; =FLOOR_GENERATION_STATUS
	mvn r2, #0
	ldrsh r0, [r1, #0x1c]
	cmp r0, r2
	ldrnesh r1, [r1, #0x1e]
	cmpne r1, r2
	beq _0233AEFC
	bl GetTileSafe
	mov r2, #0
	strh r2, [r0]
	ldr r1, _0233AF08 ; =FLOOR_GENERATION_STATUS
	strh r2, [r0, #2]
	ldrsh r0, [r1, #0x1c]
	ldrsh r1, [r1, #0x1e]
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0233AEFC:
	bl ResetHiddenStairsSpawn
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233AF04: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_0233AF08: .word FLOOR_GENERATION_STATUS
	arm_func_end ClearHiddenStairs

	arm_func_start FlagHallwayJunctions
FlagHallwayJunctions: ; 0x0233AF0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov fp, r1
	mov sb, r2
	mov r8, r3
	b _0233B01C
_0233AF24:
	mov r7, fp
	sub r6, sl, #1
	b _0233B010
_0233AF30:
	mov r0, sl
	mov r1, r7
	mov r4, #0
	bl GetTileSafe
	mov r5, r0
	ldrh r0, [r5]
	bic r0, r0, #4
	strh r0, [r5]
	ldrb r0, [r5, #7]
	cmp r0, #0xff
	ldreqh r0, [r5]
	andeq r0, r0, #3
	cmpeq r0, #1
	bne _0233B00C
	cmp sl, #0
	ble _0233AF90
	mov r0, r6
	mov r1, r7
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	moveq r0, r4
	addeq r4, r0, #1
_0233AF90:
	cmp r7, #0
	ble _0233AFB4
	mov r0, sl
	sub r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	addeq r4, r4, #1
_0233AFB4:
	cmp sl, #0x36
	bge _0233AFD8
	mov r1, r7
	add r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	addeq r4, r4, #1
_0233AFD8:
	cmp sl, #0x1e
	bge _0233AFFC
	mov r0, sl
	add r1, r7, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	addeq r4, r4, #1
_0233AFFC:
	cmp r4, #3
	ldrgeh r0, [r5]
	orrge r0, r0, #8
	strgeh r0, [r5]
_0233B00C:
	add r7, r7, #1
_0233B010:
	cmp r7, r8
	blt _0233AF30
	add sl, sl, #1
_0233B01C:
	cmp sl, sb
	blt _0233AF24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end FlagHallwayJunctions

	arm_func_start GenerateStandardFloor
GenerateStandardFloor: ; 0x0233B028
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r5, r1
	mov r6, r0
	mov r4, r2
	add r0, sp, #0x44
	add r1, sp, #8
	mov r2, r6
	mov r3, r5
	bl GetGridPositions
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl InitDungeonGrid
	ldrsb r3, [r4, #1]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl AssignRooms
	add r1, sp, #8
	str r1, [sp]
	ldrb r3, [r4, #0xd]
	add r0, sp, #0x80
	mov r1, r6
	str r3, [sp, #4]
	mov r2, r5
	add r3, sp, #0x44
	bl CreateRoomsAndAnchors
	mov r0, r6
	bl DungeonRandInt
	mov r7, r0
	mov r0, r5
	bl DungeonRandInt
	stmia sp, {r0, r4}
	mov r3, r7
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl AssignGridCellConnections
	add r1, sp, #8
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	add r3, sp, #0x44
	bl CreateGridCellConnections
	add r1, sp, #8
	str r1, [sp]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	add r3, sp, #0x44
	bl EnsureConnectedGrid
	ldrb r3, [r4, #9]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateMazeRoom
	ldr r3, _0233B18C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0xc]
	mov r1, r6
	mov r2, r5
	bl GenerateKecleonShop
	ldr r3, _0233B18C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0x10]
	mov r1, r6
	mov r2, r5
	bl GenerateMonsterHouse
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateExtraHallways
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateRoomImperfections
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateSecondaryStructures
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233B18C: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateStandardFloor

	arm_func_start GenerateOuterRingFloor
GenerateOuterRingFloor: ; 0x0233B190
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f4
	sub sp, sp, #0x1800
	mov r1, #5
	mov r2, #0x1c
	add r3, r2, #0x33
	add r3, r3, r3, lsr #31
	mov r8, r3, asr #1
	mov fp, #0x33
	mov sl, #0x38
	mov r7, #2
	mov r6, #7
	mov r5, #0x10
	mov r3, #0x1e
	str r2, [sp, #0x64]
	add r4, r1, #0x1c
	str r0, [sp, #8]
	add r0, r4, r4, lsr #31
	mov sb, r0, asr #1
	mov r0, #0
	mov r4, #0x19
	str r0, [sp, #0x58]
	str r1, [sp, #0x5c]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	str fp, [sp, #0x6c]
	str sl, [sp, #0x70]
	str sb, [sp, #0x60]
	str r8, [sp, #0x68]
	str r7, [sp, #0x1c]
	str r6, [sp, #0x20]
	str r5, [sp, #0x24]
	str r4, [sp, #0x28]
	str r3, [sp, #0x2c]
	bl InitDungeonGrid
	mov r3, #0
	ldr r0, _0233B614 ; =0x000001C2
	add r1, sp, #0x94
	mov r4, r3
_0233B230:
	mla r2, r3, r0, r1
	strb r4, [r2, #0xa]
	add r3, r3, #1
	strb r4, [r2, #0x64]
	cmp r3, #6
	blt _0233B230
	add r2, sp, #0x94
	mov r1, #0
	mov r0, #0x1e
_0233B254:
	mla r3, r4, r0, r2
	strb r1, [r3, #0xa]
	add r4, r4, #1
	strb r1, [r3, #0x8d4]
	cmp r4, #4
	blt _0233B254
	mov r7, #1
	ldr r1, _0233B614 ; =0x000001C2
	mov r3, r7
	mov r5, r7
	add r4, sp, #0x94
	mov r0, #0x1e
_0233B284:
	mla r6, r7, r1, r4
	mov r8, r5
_0233B28C:
	mla r2, r8, r0, r6
	add r8, r8, #1
	strb r3, [r2, #0xa]
	cmp r8, #3
	blt _0233B28C
	add r7, r7, #1
	cmp r7, #5
	blt _0233B284
	mov sl, #0
	str sl, [sp, #0xc]
_0233B2B4:
	add r1, sp, #0x94
	mov r0, #0x1e
	mla r7, sl, r0, r1
	add r0, sp, #0x1c
	add r0, r0, sl, lsl #2
	mov sb, #0
	str r0, [sp, #0x10]
_0233B2D0:
	ldr r0, _0233B614 ; =0x000001C2
	mla r0, sb, r0, r7
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	add r0, sp, #0x58
	add r1, r0, sb, lsl #2
	beq _0233B3F8
	ldr r8, [r0, sb, lsl #2]
	add r0, sp, #0x1c
	ldr r1, [r1, #4]
	ldr r4, [r0, sl, lsl #2]
	sub r0, r1, r8
	sub r5, r0, #3
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, #5
	sub r1, r1, r4
	sub r6, r1, #3
	mov r1, r5
	bl DungeonRandRange
	mov fp, r0
	mov r0, #4
	mov r1, r6
	bl DungeonRandRange
	str r0, [sp, #0x14]
	sub r0, r5, fp
	bl DungeonRandInt
	add r1, r8, #2
	add r8, r1, r0
	ldr r0, [sp, #0x14]
	sub r0, r6, r0
	bl DungeonRandInt
	add r1, r4, #2
	add r4, r1, r0
	ldr r0, [sp, #0x14]
	add fp, r8, fp
	add r5, r4, r0
	ldr r0, _0233B614 ; =0x000001C2
	mul r0, sb, r0
	strh r8, [r7, r0]
	add r0, r7, r0
	strh fp, [r0, #4]
	strh r4, [r0, #2]
	strh r5, [r0, #6]
	ldr r0, [sp, #0xc]
	and r0, r0, #0xff
	str r0, [sp, #0x18]
	b _0233B3E0
_0233B390:
	mov r6, r4
	b _0233B3D4
_0233B398:
	mov r0, r8
	mov r1, r6
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r6
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r8
	bl GetTileSafe
	ldr r1, [sp, #0x18]
	add r6, r6, #1
	strb r1, [r0, #7]
_0233B3D4:
	cmp r6, r5
	blt _0233B398
	add r8, r8, #1
_0233B3E0:
	cmp r8, fp
	blt _0233B390
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _0233B4A0
_0233B3F8:
	ldr r2, [r0, sb, lsl #2]
	ldr r1, [r1, #4]
	add r0, r2, #1
	sub r1, r1, r2
	add r2, sp, #0x1c
	ldr r3, [r2, sl, lsl #2]
	ldr r2, [sp, #0x10]
	sub r1, r1, #3
	ldr r2, [r2, #4]
	add r1, r0, r1
	sub r2, r2, r3
	add r4, r3, #1
	sub r5, r2, #3
	bl DungeonRandRange
	add r1, r4, r5
	mov r5, r0
	mov r0, r4
	bl DungeonRandRange
	mov r4, r0
	ldr r0, _0233B614 ; =0x000001C2
	mul r0, sb, r0
	strh r5, [r7, r0]
	add r1, r7, r0
	add r0, r5, #1
	strh r0, [r1, #4]
	strh r4, [r1, #2]
	add r0, r4, #1
	strh r0, [r1, #6]
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	mov r1, #0xff
	strb r1, [r0, #7]
_0233B4A0:
	add sb, sb, #1
	cmp sb, #6
	blt _0233B2D0
	add sl, sl, #1
	cmp sl, #4
	blt _0233B2B4
	mov r1, #1
	mov r0, #6
	strb r1, [sp, #0xaa]
	strb r1, [sp, #0x26b]
	strb r1, [sp, #0x26c]
	strb r1, [sp, #0x42d]
	strb r1, [sp, #0x42e]
	strb r1, [sp, #0x5ef]
	strb r1, [sp, #0x5f0]
	strb r1, [sp, #0x7b1]
	strb r1, [sp, #0x7b2]
	strb r1, [sp, #0x973]
	strb r1, [sp, #0xa8]
	strb r1, [sp, #0xc5]
	strb r1, [sp, #0xc6]
	strb r1, [sp, #0xe3]
	strb r1, [sp, #0xe4]
	strb r1, [sp, #0x101]
	strb r1, [sp, #0x104]
	strb r1, [sp, #0x2c5]
	strb r1, [sp, #0x2c6]
	strb r1, [sp, #0x487]
	strb r1, [sp, #0x488]
	strb r1, [sp, #0x649]
	strb r1, [sp, #0x64a]
	strb r1, [sp, #0x80b]
	strb r1, [sp, #0x80c]
	strb r1, [sp, #0x9cd]
	strb r1, [sp, #0x972]
	strb r1, [sp, #0x98f]
	strb r1, [sp, #0x990]
	strb r1, [sp, #0x9ad]
	strb r1, [sp, #0x9ae]
	strb r1, [sp, #0x9cb]
	bl DungeonRandInt
	mov r4, r0
	mov r0, #4
	bl DungeonRandInt
	mov r3, r4
	str r0, [sp]
	ldr r4, [sp, #8]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	str r4, [sp, #4]
	bl AssignGridCellConnections
	add r1, sp, #0x1c
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	add r3, sp, #0x58
	bl CreateGridCellConnections
	add r1, sp, #0x1c
	str r1, [sp]
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	add r3, sp, #0x58
	bl EnsureConnectedGrid
	ldr r1, _0233B618 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x94
	ldrsh r3, [r1, #0xc]
	mov r1, #6
	mov r2, #4
	bl GenerateKecleonShop
	ldr r1, _0233B618 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x94
	ldrsh r3, [r1, #0x10]
	mov r1, #6
	mov r2, #4
	bl GenerateMonsterHouse
	ldr r0, [sp, #8]
	mov r1, #6
	ldrb r3, [r0, #0x13]
	add r0, sp, #0x94
	mov r2, #4
	bl GenerateExtraHallways
	add r0, sp, #0x94
	mov r1, #6
	mov r2, #4
	bl GenerateRoomImperfections
	add sp, sp, #0x2f4
	add sp, sp, #0x1800
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233B614: .word 0x000001C2
_0233B618: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateOuterRingFloor

	arm_func_start GenerateCrossroadsFloor
GenerateCrossroadsFloor: ; 0x0233B61C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x1800
	mov r1, #0
	mov r2, #0xb
	str r0, [sp, #8]
	mov fp, #0x16
	mov sl, #0x21
	mov sb, #0x2c
	mov r8, #0x38
	mov r7, #1
	mov r6, #9
	mov r5, #0x10
	mov r4, #0x17
	mov r3, #0x1f
	str r1, [sp, #0x5c]
	str r2, [sp, #0x60]
	add r0, sp, #0x98
	mov r1, #5
	mov r2, #4
	str fp, [sp, #0x64]
	str sl, [sp, #0x68]
	str sb, [sp, #0x6c]
	str r8, [sp, #0x70]
	str r7, [sp, #0x20]
	str r6, [sp, #0x24]
	str r5, [sp, #0x28]
	str r4, [sp, #0x2c]
	str r3, [sp, #0x30]
	bl InitDungeonGrid
	ldr r0, _0233BA74 ; =0x000001C2
	mov r4, #0
	add r2, sp, #0x98
	mov r1, r7
_0233B6A4:
	mla r3, r4, r0, r2
	strb r1, [r3, #0xa]
	add r4, r4, #1
	strb r1, [r3, #0x64]
	cmp r4, #5
	blt _0233B6A4
	mov r3, #0
	add r1, sp, #0x98
	mov r7, #1
	mov r0, #0x1e
_0233B6CC:
	mla r2, r3, r0, r1
	strb r7, [r2, #0xa]
	add r3, r3, #1
	strb r7, [r2, #0x712]
	cmp r3, #4
	blt _0233B6CC
	ldr r1, _0233BA74 ; =0x000001C2
	mov r4, #0
	mov r5, #1
	add r3, sp, #0x98
	mov r0, #0x1e
_0233B6F8:
	mla r6, r7, r1, r3
	mov r8, r5
_0233B700:
	mla r2, r8, r0, r6
	add r8, r8, #1
	strb r4, [r2, #0xa]
	cmp r8, #3
	blt _0233B700
	add r7, r7, #1
	cmp r7, #4
	blt _0233B6F8
	mov r0, #1
	mov sl, r4
	strb r0, [sp, #0xa0]
	strb r0, [sp, #0x7a8]
	strb r0, [sp, #0xfa]
	strb r0, [sp, #0x802]
_0233B738:
	add r1, sp, #0x98
	mov r0, #0x1e
	mla r7, sl, r0, r1
	add r0, sp, #0x20
	add r0, r0, sl, lsl #2
	mov sb, #0
	str r0, [sp, #0x10]
_0233B754:
	ldr r0, _0233BA74 ; =0x000001C2
	mla r1, sb, r0, r7
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _0233B938
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	add r0, sp, #0x5c
	add r1, r0, sb, lsl #2
	beq _0233B890
	ldr r8, [r0, sb, lsl #2]
	add r0, sp, #0x20
	ldr r1, [r1, #4]
	ldr r5, [r0, sl, lsl #2]
	sub r0, r1, r8
	sub r6, r0, #3
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, #5
	sub r1, r1, r5
	sub fp, r1, #3
	mov r1, r6
	bl DungeonRandRange
	str r0, [sp, #0x14]
	mov r0, #4
	mov r1, fp
	bl DungeonRandRange
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	sub r0, r6, r0
	bl DungeonRandInt
	add r1, r8, #2
	add r8, r1, r0
	ldr r0, [sp, #0x18]
	sub r0, fp, r0
	bl DungeonRandInt
	add r1, r5, #2
	add r5, r1, r0
	ldr r0, [sp, #0x14]
	add r0, r8, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add fp, r5, r0
	ldr r0, _0233BA74 ; =0x000001C2
	mul r0, sb, r0
	strh r8, [r7, r0]
	add r1, r7, r0
	ldr r0, [sp, #0xc]
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	and r0, r4, #0xff
	strh fp, [r1, #6]
	str r0, [sp, #0x1c]
	b _0233B87C
_0233B82C:
	mov r6, r5
	b _0233B870
_0233B834:
	mov r0, r8
	mov r1, r6
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r6
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r8
	bl GetTileSafe
	ldr r1, [sp, #0x1c]
	add r6, r6, #1
	strb r1, [r0, #7]
_0233B870:
	cmp r6, fp
	blt _0233B834
	add r8, r8, #1
_0233B87C:
	ldr r0, [sp, #0xc]
	cmp r8, r0
	blt _0233B82C
	add r4, r4, #1
	b _0233B938
_0233B890:
	ldr r2, [r0, sb, lsl #2]
	ldr r1, [r1, #4]
	add r0, r2, #1
	sub r1, r1, r2
	add r2, sp, #0x20
	ldr r3, [r2, sl, lsl #2]
	ldr r2, [sp, #0x10]
	sub r1, r1, #3
	ldr r2, [r2, #4]
	add r1, r0, r1
	sub r2, r2, r3
	add r5, r3, #1
	sub r6, r2, #3
	bl DungeonRandRange
	add r1, r5, r6
	mov r6, r0
	mov r0, r5
	bl DungeonRandRange
	mov r5, r0
	ldr r0, _0233BA74 ; =0x000001C2
	mul r0, sb, r0
	strh r6, [r7, r0]
	add r1, r7, r0
	add r0, r6, #1
	strh r0, [r1, #4]
	strh r5, [r1, #2]
	add r0, r5, #1
	strh r0, [r1, #6]
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r5
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r6
	bl GetTileSafe
	mov r1, #0xff
	strb r1, [r0, #7]
_0233B938:
	add sb, sb, #1
	cmp sb, #5
	blt _0233B754
	add sl, sl, #1
	cmp sl, #4
	blt _0233B738
	mov r7, #1
	ldr r2, _0233BA74 ; =0x000001C2
	mov r0, r7
	mov r5, #0
	add r4, sp, #0x98
	mov r1, #0x1e
_0233B968:
	mla r6, r7, r2, r4
	mov r8, r5
_0233B970:
	mla r3, r8, r1, r6
	strb r0, [r3, #0x14]
	add r8, r8, #1
	strb r0, [r3, #0x31]
	cmp r8, #3
	blt _0233B970
	add r7, r7, #1
	cmp r7, #4
	blt _0233B968
	ldr r1, _0233BA74 ; =0x000001C2
	mov r4, #1
	mov r6, #0
	add r5, sp, #0x98
	mov r2, #0x1e
_0233B9A8:
	mla r7, r0, r2, r5
	mov r8, r6
_0233B9B0:
	mla r3, r8, r1, r7
	strb r4, [r3, #0x16]
	add r8, r8, #1
	strb r4, [r3, #0x1d7]
	cmp r8, #4
	blt _0233B9B0
	add r0, r0, #1
	cmp r0, #3
	blt _0233B9A8
	add r1, sp, #0x20
	str r1, [sp]
	add r0, sp, #0x98
	add r3, sp, #0x5c
	mov r1, #5
	mov r2, #4
	str r4, [sp, #4]
	bl CreateGridCellConnections
	add r4, sp, #0x20
	add r0, sp, #0x98
	add r3, sp, #0x5c
	mov r1, #5
	mov r2, #4
	str r4, [sp]
	bl EnsureConnectedGrid
	ldr r1, _0233BA78 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x98
	ldrsh r3, [r1, #0xc]
	mov r1, #5
	mov r2, #4
	bl GenerateKecleonShop
	ldr r1, _0233BA78 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x98
	ldrsh r3, [r1, #0x10]
	mov r1, #5
	mov r2, #4
	bl GenerateMonsterHouse
	ldr r0, [sp, #8]
	mov r1, #5
	ldrb r3, [r0, #0x13]
	add r0, sp, #0x98
	mov r2, #4
	bl GenerateExtraHallways
	add r0, sp, #0x98
	mov r1, #5
	mov r2, #4
	bl GenerateRoomImperfections
	add sp, sp, #0x2f8
	add sp, sp, #0x1800
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233BA74: .word 0x000001C2
_0233BA78: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateCrossroadsFloor

	arm_func_start GenerateLineFloor
GenerateLineFloor: ; 0x0233BA7C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r7, #0
	mov r6, #0xb
	mov lr, #0x16
	mov ip, #0x21
	mov r5, #0x2c
	mov r3, #0x38
	mov r2, #4
	mov r1, #0xf
	mov r4, r0
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0x80
	str r7, [sp, #0x44]
	str r6, [sp, #0x48]
	str lr, [sp, #0x4c]
	str ip, [sp, #0x50]
	str r5, [sp, #0x54]
	str r3, [sp, #0x58]
	mov r1, #5
	mov r2, #1
	bl InitDungeonGrid
	ldrsb r3, [r4, #1]
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl AssignRooms
	add r1, sp, #8
	str r1, [sp]
	ldrb r2, [r4, #0xd]
	add r0, sp, #0x80
	add r3, sp, #0x44
	str r2, [sp, #4]
	mov r1, #5
	mov r2, #1
	bl CreateRoomsAndAnchors
	mov r0, #5
	bl DungeonRandInt
	mov r5, r0
	mov r0, #1
	bl DungeonRandInt
	stmia sp, {r0, r4}
	mov r3, r5
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl AssignGridCellConnections
	add r0, sp, #8
	mov r2, #1
	stmia sp, {r0, r2}
	add r0, sp, #0x80
	mov r1, #5
	add r3, sp, #0x44
	bl CreateGridCellConnections
	add r1, sp, #8
	str r1, [sp]
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	add r3, sp, #0x44
	bl EnsureConnectedGrid
	ldr r3, _0233BBD8 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0xc]
	mov r1, #5
	mov r2, #1
	bl GenerateKecleonShop
	ldr r1, _0233BBD8 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r1, #0x10]
	mov r1, #5
	mov r2, #1
	bl GenerateMonsterHouse
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl GenerateExtraHallways
	add r0, sp, #0x80
	mov r1, #5
	mov r2, #1
	bl GenerateRoomImperfections
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233BBD8: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateLineFloor

	arm_func_start GenerateCrossFloor
GenerateCrossFloor: ; 0x0233BBDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r1, #3
	mov r8, #0xb
	mov r4, r0
	mov r7, #0x16
	mov r6, #0x21
	mov r5, #0x2c
	mov lr, #2
	mov ip, #0x14
	mov r3, #0x1e
	add r0, sp, #0x80
	mov r2, r1
	str r8, [sp, #0x44]
	str r7, [sp, #0x48]
	str r6, [sp, #0x4c]
	str r5, [sp, #0x50]
	str lr, [sp, #8]
	str r8, [sp, #0xc]
	str ip, [sp, #0x10]
	str r3, [sp, #0x14]
	bl InitDungeonGrid
	mov r5, #0
	ldr r1, _0233BD6C ; =0x000001C2
	mov r3, #1
	mov lr, r5
	add ip, sp, #0x80
	mov r0, #0x1e
_0233BC50:
	mla r7, r5, r1, ip
	mov r6, lr
_0233BC58:
	mla r2, r6, r0, r7
	add r6, r6, #1
	strb r3, [r2, #0xa]
	cmp r6, #3
	blt _0233BC58
	add r5, r5, #1
	cmp r5, #3
	blt _0233BC50
	add r0, sp, #8
	strb r3, [sp, #0x88]
	strb r3, [sp, #0x40c]
	mov r1, #3
	strb r3, [sp, #0xc4]
	strb r3, [sp, #0x448]
	str r0, [sp]
	ldrb ip, [r4, #0xd]
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateRoomsAndAnchors
	mov ip, #1
	mov r1, #3
	add r0, sp, #8
	strb ip, [sp, #0xb4]
	strb ip, [sp, #0x275]
	strb ip, [sp, #0x276]
	strb ip, [sp, #0x437]
	strb ip, [sp, #0x256]
	strb ip, [sp, #0x273]
	strb ip, [sp, #0x274]
	strb ip, [sp, #0x291]
	str r0, [sp]
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateGridCellConnections
	mov r1, #3
	add ip, sp, #8
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp]
	bl EnsureConnectedGrid
	ldr r1, _0233BD70 ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r1, #0xc]
	mov r1, #3
	mov r2, r1
	bl GenerateKecleonShop
	ldr r3, _0233BD70 ; =FLOOR_GENERATION_STATUS
	mov r1, #3
	ldrsh r3, [r3, #0x10]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateMonsterHouse
	mov r1, #3
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateExtraHallways
	mov r1, #3
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateRoomImperfections
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233BD6C: .word 0x000001C2
_0233BD70: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateCrossFloor

	arm_func_start GenerateBeetleFloor
GenerateBeetleFloor: ; 0x0233BD74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r1, #3
	mov r4, r0
	mov sb, #5
	mov r8, #0xf
	mov r7, #0x23
	mov r6, #0x32
	mov r5, #2
	mov lr, #0xb
	mov ip, #0x14
	mov r3, #0x1e
	add r0, sp, #0x80
	mov r2, r1
	str sb, [sp, #0x44]
	str r8, [sp, #0x48]
	str r7, [sp, #0x4c]
	str r6, [sp, #0x50]
	str r5, [sp, #8]
	str lr, [sp, #0xc]
	str ip, [sp, #0x10]
	str r3, [sp, #0x14]
	bl InitDungeonGrid
	mov r5, #0
	ldr r1, _0233BF28 ; =0x000001C2
	mov r3, #1
	mov lr, r5
	add ip, sp, #0x80
	mov r0, #0x1e
_0233BDEC:
	mla r7, r5, r1, ip
	mov r6, lr
_0233BDF4:
	mla r2, r6, r0, r7
	add r6, r6, #1
	strb r3, [r2, #0xa]
	cmp r6, #3
	blt _0233BDF4
	add r5, r5, #1
	cmp r5, #3
	blt _0233BDEC
	add r0, sp, #8
	str r0, [sp]
	ldrb ip, [r4, #0xd]
	mov r1, #3
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateRoomsAndAnchors
	mov r3, #0
	add r0, sp, #0x80
	mov ip, #1
	mov r1, #0x1e
_0233BE48:
	mla r2, r3, r1, r0
	strb ip, [r2, #0x16]
	strb ip, [r2, #0x1d7]
	strb ip, [r2, #0x1d8]
	add r3, r3, #1
	strb ip, [r2, #0x399]
	cmp r3, #3
	blt _0233BE48
	add r2, sp, #8
	str r2, [sp]
	mov r1, #3
	add r3, sp, #0x44
	mov r2, r1
	str ip, [sp, #4]
	bl CreateGridCellConnections
	mov r0, #1
	add r3, sp, #0x80
	mov r2, r0
	mov r1, #0
	bl MergeRoomsVertically
	add r3, sp, #0x80
	mov r0, #1
	mov r1, #0
	mov r2, #2
	bl MergeRoomsVertically
	add r1, sp, #8
	str r1, [sp]
	mov r1, #3
	add r0, sp, #0x80
	mov r2, r1
	add r3, sp, #0x44
	bl EnsureConnectedGrid
	ldr r3, _0233BF2C ; =FLOOR_GENERATION_STATUS
	mov r1, #3
	ldrsh r3, [r3, #0xc]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateKecleonShop
	ldr r3, _0233BF2C ; =FLOOR_GENERATION_STATUS
	mov r1, #3
	ldrsh r3, [r3, #0x10]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateMonsterHouse
	mov r1, #3
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateExtraHallways
	mov r1, #3
	add r0, sp, #0x80
	mov r2, r1
	bl GenerateRoomImperfections
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233BF28: .word 0x000001C2
_0233BF2C: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateBeetleFloor

	arm_func_start MergeRoomsVertically
MergeRoomsVertically: ; 0x0233BF30
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov r5, #0x1e
	add r4, r5, #0x1a4
	add r2, r1, r2
	mul r7, r0, r4
	mov sl, r3
	mul r8, r2, r5
	add fp, sl, r7
	ldrsh r0, [fp, r8]
	mul r6, r1, r5
	str r0, [sp]
	ldrsh r0, [fp, r6]
	ldr r1, [sp]
	cmp r0, r1
	add r1, sl, #4
	add r1, r1, r7
	strlt r0, [sp]
	str r1, [sp, #0x14]
	ldrsh r2, [r1, r8]
	ldrsh sb, [r1, r6]
	add r1, sl, #2
	add r1, r1, r7
	str r1, [sp, #0x10]
	ldrsh r1, [r1, r6]
	cmp sb, r2
	movle sb, r2
	str r1, [sp, #8]
	add r1, sl, #6
	add r1, r1, r7
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrsh r2, [r2, r8]
	str r2, [sp, #0xc]
	bl GetTile
	ldrb r0, [r0, #7]
	ldr r5, [sp]
	and r0, r0, #0xff
	str r0, [sp, #0x18]
	b _0233C01C
_0233BFD4:
	ldr r4, [sp, #8]
	b _0233C00C
_0233BFDC:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r1, [r0]
	add r4, r4, #1
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #7]
_0233C00C:
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blt _0233BFDC
	add r5, r5, #1
_0233C01C:
	cmp r5, sb
	blt _0233BFD4
	ldr r0, [sp]
	add r3, sl, #0x12
	strh r0, [fp, r6]
	ldr r0, [sp, #0x14]
	add r2, sl, r7
	strh sb, [r0, r6]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	strh r1, [r0, r6]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0, r6]
	add r0, r3, r7
	mov r3, #1
	strb r3, [r0, r8]
	strb r3, [r0, r6]
	add r0, r2, r8
	mov r1, #0
	strb r1, [r0, #0xb]
	strb r3, [r0, #0x11]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end MergeRoomsVertically

	arm_func_start GenerateOuterRoomsFloor
GenerateOuterRoomsFloor: ; 0x0233C07C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xae0
	sub sp, sp, #0x1000
	mov r5, r1
	mov r6, r0
	mov r4, r2
	add r0, sp, #0x44
	add r1, sp, #8
	mov r2, r6
	mov r3, r5
	bl GetGridPositions
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl InitDungeonGrid
	mov sb, #0
	mov r3, #1
	mov r8, sb
	add r7, sp, #0x80
	mov r0, #0x1e
	ldr r1, _0233C308 ; =0x000001C2
	b _0233C0F8
_0233C0D4:
	mla fp, sb, r1, r7
	mov sl, r8
	b _0233C0EC
_0233C0E0:
	mla r2, sl, r0, fp
	strb r3, [r2, #0xa]
	add sl, sl, #1
_0233C0EC:
	cmp sl, r5
	blt _0233C0E0
	add sb, sb, #1
_0233C0F8:
	cmp sb, r6
	blt _0233C0D4
	mov fp, #1
	sub r3, r5, #1
	sub r2, r6, #1
	mov r8, fp
	mov lr, fp
	add sb, sp, #0x80
	mov r0, #0x1e
	ldr r1, _0233C308 ; =0x000001C2
	b _0233C148
_0233C124:
	mla sl, fp, r1, sb
	mov ip, lr
	b _0233C13C
_0233C130:
	mla r7, ip, r0, sl
	strb r8, [r7, #8]
	add ip, ip, #1
_0233C13C:
	cmp ip, r3
	blt _0233C130
	add fp, fp, #1
_0233C148:
	cmp fp, r2
	blt _0233C124
	add r1, sp, #8
	str r1, [sp]
	ldrb r7, [r4, #0xd]
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r1, r6
	mov r2, r5
	str r7, [sp, #4]
	bl CreateRoomsAndAnchors
	mov r2, #1
	add r3, sp, #0x80
	sub r1, r5, #1
	mov r0, #0x1e
	mla r7, r1, r0, r3
	mov r8, #0
	sub r1, r6, #2
	sub r0, r6, #1
	mov fp, r2
	ldr sb, _0233C308 ; =0x000001C2
	b _0233C1D4
_0233C1A0:
	cmp r8, #0
	mulne ip, r8, sb
	addne sl, r3, ip
	strneb r2, [sl, #0x16]
	addne sl, r7, ip
	strneb r2, [sl, #0x16]
	cmp r8, r1
	mullt ip, r8, sb
	addlt sl, r3, ip
	strltb fp, [sl, #0x1d7]
	addlt sl, r7, ip
	strltb fp, [sl, #0x1d7]
	add r8, r8, #1
_0233C1D4:
	cmp r8, r0
	blt _0233C1A0
	ldr r2, _0233C308 ; =0x000001C2
	add r1, sp, #0x80
	mla r2, r0, r2, r1
	mov r0, #1
	mov ip, #0x1e
	mov r3, #0
	sub sl, r5, #2
	sub lr, r5, #1
	mov r8, r0
	mov fp, ip
	b _0233C23C
_0233C208:
	cmp r3, #0
	mulne sb, r3, ip
	addne r7, r1, sb
	strneb r0, [r7, #0x13]
	addne r7, r2, sb
	strneb r0, [r7, #0x13]
	cmp r3, sl
	mullt sb, r3, fp
	addlt r7, r1, sb
	strltb r8, [r7, #0x14]
	addlt r7, r2, sb
	strltb r8, [r7, #0x14]
	add r3, r3, #1
_0233C23C:
	cmp r3, lr
	blt _0233C208
	add r7, sp, #8
	str r7, [sp]
	mov r7, #0
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r1, r6
	mov r2, r5
	str r7, [sp, #4]
	bl CreateGridCellConnections
	add r7, sp, #8
	add r0, sp, #0x80
	add r3, sp, #0x44
	mov r1, r6
	mov r2, r5
	str r7, [sp]
	bl EnsureConnectedGrid
	ldrb r3, [r4, #9]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateMazeRoom
	ldr r3, _0233C30C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0xc]
	mov r1, r6
	mov r2, r5
	bl GenerateKecleonShop
	ldr r3, _0233C30C ; =FLOOR_GENERATION_STATUS
	add r0, sp, #0x80
	ldrsh r3, [r3, #0x10]
	mov r1, r6
	mov r2, r5
	bl GenerateMonsterHouse
	ldrb r3, [r4, #0x13]
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateExtraHallways
	add r0, sp, #0x80
	mov r1, r6
	mov r2, r5
	bl GenerateRoomImperfections
	mov r1, r6
	mov r2, r5
	add r0, sp, #0x80
	bl GenerateSecondaryStructures
	add sp, sp, #0xae0
	add sp, sp, #0x1000
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233C308: .word 0x000001C2
_0233C30C: .word FLOOR_GENERATION_STATUS
	arm_func_end GenerateOuterRoomsFloor

	arm_func_start IsNotFullFloorFixedRoom
IsNotFullFloorFixedRoom: ; 0x0233C310
	cmp r0, #0
	ble _0233C324
	cmp r0, #0xa5
	movlt r0, #0
	bxlt lr
_0233C324:
	mov r0, #1
	bx lr
	arm_func_end IsNotFullFloorFixedRoom

	arm_func_start GenerateFixedRoom
GenerateFixedRoom: ; 0x0233C32C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x1800
	ldr r2, _0233C764 ; =DUNGEON_PTR
	str r1, [sp, #0x10]
	ldr r2, [r2]
	mov sl, r0
	add r1, r2, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa00]
#else
	ldr r1, [r1, #0xaa4]
#endif
	ldr r1, [r1, sl, lsl #2]
	ldrh r4, [r1]
	ldrh r5, [r1, #2]
	cmp r4, #0
	cmpne r5, #0
	bne _0233C374
	bl GenerateOneRoomMonsterHouseFloor
	mov r0, #0
	b _0233C758
_0233C374:
	bl IsNotFullFloorFixedRoom
	cmp r0, #0
	bne _0233C590
	ldr r0, _0233C764 ; =DUNGEON_PTR
#ifdef JAPAN
	ldr r2, _0233C768 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr r4, [r0]
	ldr r1, _0233C76C ; =FLOOR_GENERATION_STATUS
	add r0, r4, #0x12000
	ldr r3, [r0, #0xa00]
	add r4, r4, #0xcc00
	ldr r5, [r3, sl, lsl #2]
	mov r3, #0
	ldrh r7, [r5]
	ldrh r6, [r5, #2]
	mov sb, #5
	add fp, r7, #5
	strh r7, [r4, #0x90]
	strh r6, [r4, #0x92]
	ldr r0, [r0, #0xa00]
	ldr r0, [r0, sl, lsl #2]
	add r0, r0, #6
	str r0, [r2, #4]
	add r0, r6, #5
	strh r3, [r1, #0xa]
	str r0, [sp, #0x1c]
#else
	ldr r4, _0233C768 ; =HIDDEN_STAIRS_SPAWN_BLOCKED
	ldr r0, [r0]
	ldr r3, _0233C76C ; =FLOOR_GENERATION_STATUS
	add r2, r0, #0x12000
	ldr r5, [r2, #0xaa4]
	add r1, r0, #0xcd00
	ldr r6, [r5, sl, lsl #2]
	add r0, r0, #0xcc00
	ldrh r7, [r6]
	ldrh r6, [r6, #2]
	mov r5, #0
	mov sb, #5
	strh r7, [r1, #0x34]
	strh r6, [r1, #0x36]
	ldr r1, [r2, #0xaa4]
	add fp, r6, #5
	ldr r1, [r1, sl, lsl #2]
	str r0, [sp, #0x1c]
	add r1, r1, #6
	str r1, [r4, #4]
	strh r5, [r3, #0xa]
	add r4, r7, #5
#endif
	b _0233C450
_0233C3E0:
	mov r0, sb, lsl #0x10
	mov r8, #5
	mov r5, r0, asr #0x10
	b _0233C444
_0233C3F0:
	bl GetNextFixedRoomAction
	str r0, [sp, #0x18]
	mov r0, r8
	mov r1, sb
	bl GetTileSafe
	ldrh ip, [r0]
	ldr r1, [sp, #0x18]
	mov r2, r8
	orr ip, ip, #0x100
	strh ip, [r0]
	mov ip, #0
	strb ip, [r0, #6]
	mov ip, #1
	mov r3, sb
	str ip, [sp]
	bl PlaceFixedRoomTile
	cmp r0, #0
#ifdef JAPAN
	strneh r8, [r4, #0x40]
	strneh r5, [r4, #0x42]
#else
	ldrne r0, [sp, #0x1c]
	strneh r8, [r0, #0xe4]
	strneh r5, [r0, #0xe6]
#endif
	add r8, r8, #1
_0233C444:
#ifdef JAPAN
	cmp r8, fp
#else
	cmp r8, r4
#endif
	blt _0233C3F0
	add sb, sb, #1
_0233C450:
#ifdef JAPAN
	ldr r0, [sp, #0x1c]
	cmp sb, r0
#else
	cmp sb, fp
#endif
	blt _0233C3E0
	mov r8, #0
	add r4, r6, #5
	ldr sb, _0233C76C ; =FLOOR_GENERATION_STATUS
	add r5, r7, #5
	mov r6, r8
_0233C46C:
	mov r7, r6
_0233C470:
	cmp r7, #5
	blt _0233C490
	cmp r7, r5
	bge _0233C490
	cmp r8, #5
	blt _0233C490
	cmp r8, r4
	blt _0233C4D4
_0233C490:
	mov r0, r7
	mov r1, r8
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x10
	strh r1, [r0]
	ldrb r1, [sb, #4]
	cmp r1, #0
	ldrh r1, [r0]
	biceq r1, r1, #3
	streqh r1, [r0]
	beq _0233C4D4
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #3
	strh r1, [r0]
_0233C4D4:
	add r7, r7, #1
	cmp r7, #0x38
	blt _0233C470
	add r8, r8, #1
	cmp r8, #0x20
	blt _0233C46C
	cmp sl, #4
	bne _0233C534
	mov r5, #5
	mov r4, #2
_0233C4FC:
	mov r6, r4
_0233C500:
	mov r0, r6
	mov r1, r5
	bl GetTileSafe
	ldrh r1, [r0]
	add r6, r6, #1
	cmp r6, #5
	orr r1, r1, #0x10
	bic r1, r1, #3
	strh r1, [r0]
	blt _0233C500
	add r5, r5, #1
	cmp r5, #0x10
	ble _0233C4FC
_0233C534:
	bl IsCurrentTilesetBackground
	cmp r0, #0
	beq _0233C584
	mov r6, #0
	mov r4, r6
_0233C548:
	mov r5, r4
_0233C54C:
	mov r0, r5
	mov r1, r6
	bl GetTileSafe
	ldrh r1, [r0]
	add r5, r5, #1
	tst r1, #3
	ldreqh r1, [r0]
	orreq r1, r1, #0x10
	streqh r1, [r0]
	cmp r5, #0x38
	blt _0233C54C
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233C548
_0233C584:
	bl FinalizeJunctions
	mov r0, #1
	b _0233C758
_0233C590:
	add r1, r4, #4
	mov r0, #0x38
	bl _s32_div_f
	mov r6, r0
	cmp r6, #2
	add r1, r5, #4
	mov r0, #0x20
	movlt r6, #1
	bl _s32_div_f
	mov r7, r0
	cmp r7, #2
	movlt r7, #1
	mov r1, #0
	str r1, [sp, #0x14]
	add r0, sp, #0x20
	add r1, sp, #0x5c
	mov r2, r6
	mov r3, r7
	ldr r8, [sp, #0x14]
	bl GetGridPositions
	add r0, sp, #0x98
	mov r1, r6
	mov r2, r7
	bl InitDungeonGrid
	ldr r3, [sp, #0x10]
	add r0, sp, #0x98
	ldrsb r3, [r3, #1]
	mov r1, r6
	mov r2, r7
	bl AssignRooms
	mov sb, #0
	mov r3, #1
	mov lr, sb
	add fp, sp, #0x98
	mov r0, #0x1e
	ldr r1, _0233C770 ; =0x000001C2
	b _0233C648
_0233C624:
	mla ip, sb, r1, fp
	mov r8, lr
	b _0233C63C
_0233C630:
	mla r2, r8, r0, ip
	strb r3, [r2, #0x1b]
	add r8, r8, #1
_0233C63C:
	cmp r8, r7
	blt _0233C630
	add sb, sb, #1
_0233C648:
	cmp sb, r6
	blt _0233C624
	mov fp, #0
	b _0233C69C
_0233C658:
	mov r0, r6
	bl DungeonRandInt
	mov sb, r0
	mov r0, r7
	bl DungeonRandInt
	mov r8, r0
	ldr r1, _0233C770 ; =0x000001C2
	add r0, sp, #0x98
	mla r1, sb, r1, r0
	mov r0, #0x1e
	mla r0, r8, r0, r1
	ldrb r1, [r0, #0xa]
	mla r0, r6, r8, sb
	str r0, [sp, #0x14]
	cmp r1, #0
	bne _0233C6A4
	add fp, fp, #1
_0233C69C:
	cmp fp, #0x40
	blt _0233C658
_0233C6A4:
	add r1, sp, #0x5c
	str r1, [sp]
	ldr r1, [sp, #0x14]
	add r0, sp, #0x98
	stmib sp, {r1, r4}
	add r3, sp, #0x20
	mov r1, r6
	mov r2, r7
	str r5, [sp, #0xc]
	bl ov29_0234217C
	cmp r6, #1
	cmpeq r7, #1
	beq _0233C738
	ldr r4, [sp, #0x10]
	str r8, [sp]
	add r0, sp, #0x98
	mov r1, r6
	mov r2, r7
	mov r3, sb
	str r4, [sp, #4]
	bl AssignGridCellConnections
	add r4, sp, #0x5c
	str r4, [sp]
	mov r4, #1
	add r0, sp, #0x98
	add r3, sp, #0x20
	mov r1, r6
	mov r2, r7
	str r4, [sp, #4]
	bl CreateGridCellConnections
	add r0, sp, #0x5c
	str r0, [sp]
	mov r1, r6
	add r0, sp, #0x98
	mov r2, r7
	add r3, sp, #0x20
	bl EnsureConnectedGrid
_0233C738:
	ldr r0, _0233C770 ; =0x000001C2
	add r2, sp, #0x98
	mla r0, sb, r0, r2
	mov r1, #0x1e
	mla r0, r8, r1, r0
	mov r1, sl
	bl ov29_02342594
	mov r0, #0
_0233C758:
	add sp, sp, #0x2f8
	add sp, sp, #0x1800
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233C764: .word DUNGEON_PTR
_0233C768: .word HIDDEN_STAIRS_SPAWN_BLOCKED
_0233C76C: .word FLOOR_GENERATION_STATUS
_0233C770: .word 0x000001C2
	arm_func_end GenerateFixedRoom

	arm_func_start GenerateOneRoomMonsterHouseFloor
GenerateOneRoomMonsterHouseFloor: ; 0x0233C774
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa60
	sub sp, sp, #0x1000
	mov r1, #1
	add r0, sp, #0
	mov r2, r1
	bl InitDungeonGrid
	mov r5, #2
	mov r1, #1
	mov r0, #0
	mov r3, #0x36
	mov r2, #0x1e
	strh r5, [sp]
	strh r3, [sp, #4]
	strh r5, [sp, #2]
	strh r2, [sp, #6]
	strb r1, [sp, #0xa]
	strb r1, [sp, #0xb]
	strb r0, [sp, #8]
	mov r6, r0
	b _0233C818
_0233C7C8:
	ldrsh r4, [sp, #2]
	b _0233C808
_0233C7D0:
	mov r0, r5
	mov r1, r4
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, r4
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r5
	bl GetTileSafe
	strb r6, [r0, #7]
	add r4, r4, #1
_0233C808:
	ldrsh r0, [sp, #6]
	cmp r4, r0
	blt _0233C7D0
	add r5, r5, #1
_0233C818:
	ldrsh r0, [sp, #4]
	cmp r5, r0
	blt _0233C7C8
	mov r1, #1
	add r0, sp, #0
	mov r2, r1
	rsb r3, r1, #0x3e8
	bl GenerateMonsterHouse
	add sp, sp, #0xa60
	add sp, sp, #0x1000
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GenerateOneRoomMonsterHouseFloor

	arm_func_start GenerateTwoRoomsWithMonsterHouseFloor
GenerateTwoRoomsWithMonsterHouseFloor: ; 0x0233C844
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2e4
	sub sp, sp, #0x1800
	mov r1, #2
	mov r5, #0x1c
	mov r4, #0x36
	mov r3, #0x1e
	str r5, [sp, #0x4c]
	add r0, sp, #0x84
	mov r2, #1
	str r1, [sp, #0x48]
	str r4, [sp, #0x50]
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r5, #0
	bl InitDungeonGrid
	mov r6, r5
_0233C888:
	add r1, sp, #0x48
	add r0, r1, r6, lsl #2
	ldr sb, [r1, r6, lsl #2]
	ldr r1, [r0, #4]
	ldr sl, [sp, #0xc]
	ldr r0, [sp, #0x10]
	sub r1, r1, sb
	sub r7, r1, #3
	sub r0, r0, sl
	sub r8, r0, #3
	mov r1, r7
	mov r0, #0xa
	bl DungeonRandRange
	mov r4, r0
	mov r1, r8
	mov r0, #0x10
	bl DungeonRandRange
	mov fp, r0
	sub r0, r7, r4
	bl DungeonRandInt
	add r1, sb, #1
	add r7, r1, r0
	sub r0, r8, fp
	bl DungeonRandInt
	ldr r1, _0233C9E4 ; =0x000001C2
	add r2, sl, #1
	add r8, r2, r0
	mul r1, r6, r1
	add r0, sp, #0x84
	add r2, r0, r1
	mov r0, #1
	strb r0, [r2, #0xa]
	add r0, sp, #0x84
	strh r7, [r0, r1]
	add r0, r7, r4
	strh r0, [r2, #4]
	strh r8, [r2, #2]
	add sb, r8, fp
	str r0, [sp, #8]
	strh sb, [r2, #6]
	and r4, r5, #0xff
	b _0233C97C
_0233C930:
	mov sl, r8
	b _0233C970
_0233C938:
	mov r0, r7
	mov r1, sl
	bl GetTileSafe
	ldrh r2, [r0]
	mov r1, sl
	bic r2, r2, #3
	strh r2, [r0]
	ldrh r2, [r0]
	orr r2, r2, #1
	strh r2, [r0]
	mov r0, r7
	bl GetTileSafe
	strb r4, [r0, #7]
	add sl, sl, #1
_0233C970:
	cmp sl, sb
	blt _0233C938
	add r7, r7, #1
_0233C97C:
	ldr r0, [sp, #8]
	cmp r7, r0
	blt _0233C930
	add r6, r6, #1
	cmp r6, #2
	add r5, r5, #1
	blt _0233C888
	mov r2, #1
	add r1, sp, #0xc
	strb r2, [sp, #0x9a]
	strb r2, [sp, #0x25b]
	str r1, [sp]
	mov r4, #0
	add r0, sp, #0x84
	add r3, sp, #0x48
	mov r1, #2
	str r4, [sp, #4]
	bl CreateGridCellConnections
	mov r2, #1
	add r0, sp, #0x84
	rsb r3, r2, #0x3e8
	mov r1, #2
	bl GenerateMonsterHouse
	add sp, sp, #0x2e4
	add sp, sp, #0x1800
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233C9E4: .word 0x000001C2
	arm_func_end GenerateTwoRoomsWithMonsterHouseFloor
