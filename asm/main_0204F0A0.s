	.include "asm/macros.inc"
	.include "main_0204F0A0.inc"

	.text

	arm_func_start sub_0204F0A0
sub_0204F0A0: ; 0x0204F0A0
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mvn r1, #0
	cmp r1, r0, asr #16
	mov r0, r0, asr #0x10
	moveq r0, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xd6
	moveq r0, #0xd4
	ldmeqia sp!, {r3, pc}
	sub r1, r0, #0xd7
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	bhi _0204F104
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_0204F104:
	bl DungeonSwapIdxToId
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204F0A0

	arm_func_start sub_0204F10C
sub_0204F10C: ; 0x0204F10C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	mvn r0, #0
	cmp r1, r0
	cmpne r1, #0xd6
	cmpne r1, #0xd7
	cmpne r1, #0xd8
	cmpne r1, #0xd9
	movne r0, #1
	strneh r1, [r4]
	mvneq r0, #0
	streqh r0, [r4]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F10C

	arm_func_start sub_0204F158
sub_0204F158: ; 0x0204F158
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xd7
	bne _0204F1AC
	mov r0, #0
	mov r1, #0x29
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	cmp r0, #0xff
	beq _0204F1AC
	cmp r0, #0xb4
	strlob r0, [r4]
	movlo r0, #1
	ldmloia sp!, {r4, pc}
_0204F1AC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F158

	arm_func_start sub_0204F1B4
sub_0204F1B4: ; 0x0204F1B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	mov r1, #0x27
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0xd6
	mov r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, #0x29
	bl LoadScriptVariableValue
	strb r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F1B4

	arm_func_start sub_0204F1F0
sub_0204F1F0: ; 0x0204F1F0
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	beq _0204F22C
	ldr lr, _0204F23C ; =_022AB5AC
	mov ip, #0xe
_0204F208:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F208
	ldmia r5, {r0, r1}
	ldr r2, _0204F240 ; =_022AB4F8
	stmia lr, {r0, r1}
	strb r4, [r2, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F22C:
	ldr r0, _0204F240 ; =_022AB4F8
	mov r1, #0
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204F23C: .word _022AB5AC
_0204F240: .word _022AB4F8
	arm_func_end sub_0204F1F0

	arm_func_start sub_0204F244
sub_0204F244: ; 0x0204F244
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _0204F270
	ldr lr, _0204F27C ; =_022AB5AC
	mov ip, #0xe
_0204F258:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F258
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
_0204F270:
	ldr r0, _0204F280 ; =_022AB4F8
	ldrb r0, [r0, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204F27C: .word _022AB5AC
_0204F280: .word _022AB4F8
	arm_func_end sub_0204F244

	arm_func_start sub_0204F284
sub_0204F284: ; 0x0204F284
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	add r0, sp, #0
	mov sb, r1
	bl GetPartyMembers
	mov r6, r0
	mov r0, sl
	bl GetMaxMembersAllowed
	cmp r6, r0
	ble _0204F2C0
	cmp r0, #1
	ldreq r0, _0204F354 ; =0x00000301
	ldrne r0, _0204F358 ; =0x00000101
	b _0204F34C
_0204F2C0:
	cmp sb, #0
	beq _0204F2D8
	add r0, r6, #1
	cmp r0, #4
	ldrgt r0, _0204F358 ; =0x00000101
	bgt _0204F34C
_0204F2D8:
	mov r7, #0
	mov r8, r7
	add r5, sp, #0
	ldr r4, _0204F35C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, #0x44
	b _0204F310
_0204F2F0:
	mov r0, r8, lsl #1
	ldrsh r0, [r5, r0]
	ldr r1, [r4]
	smlabb r0, r0, fp, r1
	ldrsh r0, [r0, #4]
	bl GetBodySize
	add r7, r7, r0
	add r8, r8, #1
_0204F310:
	cmp r8, r6
	blt _0204F2F0
	cmp sb, #0
	beq _0204F32C
	mov r0, sb
	bl GetBodySize
	add r7, r7, r0
_0204F32C:
	cmp r7, #6
	movgt r0, #0x81
	bgt _0204F34C
	mov r0, sl
	bl IsLevelResetDungeon
	cmp r0, #0
	ldrne r0, _0204F360 ; =0x00002002
	moveq r0, #0
_0204F34C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204F354: .word 0x00000301
_0204F358: .word 0x00000101
_0204F35C: .word TEAM_MEMBER_TABLE_PTR
_0204F360: .word 0x00002002
	arm_func_end sub_0204F284

	arm_func_start sub_0204F364
sub_0204F364: ; 0x0204F364
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	bl GetMaxItemsAllowed
	mov r4, r0
	bl GetNbItemsInBag
	cmp r4, #0
	ble _0204F39C
	cmp r4, r0
	bge _0204F39C
	orr r5, r5, #2
	cmp r4, #0
	orreq r5, r5, #0x800
	orrne r5, r5, #0x400
_0204F39C:
	mov r0, r6
	bl IsMoneyAllowed
	cmp r0, #0
	bne _0204F3BC
	bl GetMoneyCarried
	cmp r0, #0
	orrgt r5, r5, #2
	orrgt r5, r5, #0x1000
_0204F3BC:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0204F364

	arm_func_start CheckMissionRestrictions
CheckMissionRestrictions: ; 0x0204F3C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetGameMode
	cmp r0, #2
	bne _0204F424
	mov r0, r5
	bl DungeonSwapIdToIdx
	bl GetDungeonModeSpecial
	cmp r0, #2
	bne _0204F424
	add r1, sp, #2
	add r2, sp, #0
	mov r0, r5
	bl sub_0205EE40
	cmp r0, #0
	beq _0204F424
	ldrsh r0, [sp]
	cmp r0, #0
	movne r0, #0x21
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp, #2]
	cmp r0, #0
	movne r0, #0x41
	ldmneia sp!, {r3, r4, r5, pc}
_0204F424:
	cmp r5, #0x26
	cmpne r5, #0x29
	cmpne r5, #0x3f
	cmpne r5, #0x63
	cmpne r5, #0x64
	cmpne r5, #0x65
	cmpne r5, #0x66
	cmpne r5, #0x67
	cmpne r5, #0x68
	cmpne r5, #0x6b
	cmpne r5, #0x6c
	cmpne r5, #0x6d
	cmpne r5, #0x6e
	cmpne r5, #0xae
	ldreq r0, _0204F484 ; =0x00004001
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0
	bl sub_0204F284
	mov r4, r0
	mov r0, r5
	bl sub_0204F364
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0204F484: .word 0x00004001
	arm_func_end CheckMissionRestrictions

	arm_func_start sub_0204F488
sub_0204F488: ; 0x0204F488
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl DungeonSwapIdToIdx
	mov r5, r0
	mov r0, sb
	bl GetMaxReachedFloor
	mov r6, r0
	mov r0, r5
	bl GetDungeonMode
	mov r4, r0
	cmp r4, #1
	moveq r0, #0x11
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #1
	bge _0204F4EC
	mov r0, r5
	bl sub_0204CEE0
	cmp r0, #0
	bne _0204F4EC
	cmp r4, #3
	movne r0, #5
	moveq r0, #9
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0204F4EC:
	cmp r8, r6
	movgt r0, #9
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp sb, #0x26
	cmpne sb, #0x29
	cmpne sb, #0x3f
	cmpne sb, #0x63
	cmpne sb, #0x64
	cmpne sb, #0x65
	cmpne sb, #0x66
	cmpne sb, #0x67
	cmpne sb, #0x68
	cmpne sb, #0x6b
	cmpne sb, #0x6c
	cmpne sb, #0x6d
	cmpne sb, #0x6e
	cmpne sb, #0xae
	ldreq r0, _0204F558 ; =0x00004001
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r7
	bl sub_0204F284
	mov r4, r0
	mov r0, sb
	bl sub_0204F364
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204F558: .word 0x00004001
	arm_func_end sub_0204F488

	arm_func_start TilesetSecondaryTerrainIsChasm
TilesetSecondaryTerrainIsChasm: ; 0x0204F55C
	ldr r1, _0204F578 ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r1, r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0204F578: .word SECONDARY_TERRAIN_TYPES
	arm_func_end TilesetSecondaryTerrainIsChasm

	arm_func_start GetNbFloors
GetNbFloors: ; 0x0204F57C
	cmp r0, #0xb4
	blo _0204F590
	cmp r0, #0xbd
	movls r0, #5
	bxls lr
_0204F590:
	cmp r0, #0xbe
	moveq r0, #1
	bxeq lr
	cmp r0, #0xbf
	ldrlo r1, _0204F5B0 ; =DUNGEON_DATA_LIST
	movhs r0, #0x30
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5B0: .word DUNGEON_DATA_LIST
	arm_func_end GetNbFloors

	arm_func_start GetNbFloorsPlusOne
GetNbFloorsPlusOne: ; 0x0204F5B4
	stmdb sp!, {r3, lr}
	bl GetNbFloors
	add r0, r0, #1
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end GetNbFloorsPlusOne

	arm_func_start GetDungeonGroup
GetDungeonGroup: ; 0x0204F5C8
	cmp r0, #0xb4
	ldrlo r1, _0204F5DC ; =_0209E3A1
	movhs r0, #0x35
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5DC: .word _0209E3A1
	arm_func_end GetDungeonGroup

	arm_func_start GetNbPrecedingFloors
GetNbPrecedingFloors: ; 0x0204F5E0
	cmp r0, #0xb4
	ldrlo r1, _0204F5F4 ; =_0209E3A2
	movhs r0, #0
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F5F4: .word _0209E3A2
	arm_func_end GetNbPrecedingFloors

	arm_func_start GetNbFloorsDungeonGroup
GetNbFloorsDungeonGroup: ; 0x0204F5F8
	cmp r0, #0xb4
	ldrlo r1, _0204F60C ; =_0209E3A3
	movhs r0, #0
	ldrlob r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_0204F60C: .word _0209E3A3
	arm_func_end GetNbFloorsDungeonGroup

	arm_func_start sub_0204F610
sub_0204F610: ; 0x0204F610
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0xb4
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	bl GetMaxMembersAllowed
	cmp r0, #1
	bne _0204F644
	mov r0, r4
	bl IsRecruitingAllowed
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0204F644:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0204F610

	arm_func_start DungeonFloorToGroupFloor
DungeonFloorToGroupFloor: ; 0x0204F64C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r0
	ldrb r0, [r5]
	cmp r0, #0xb4
	blo _0204F690
	cmp r0, #0xbd
	bhi _0204F690
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	sub r0, r0, #0xb4
	add r0, r0, r0, lsl #2
	add r0, r1, r0
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F690:
	cmp r0, #0xbe
	bne _0204F6B0
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5, #1]
	add r0, r0, #0x32
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F6B0:
	cmp r0, #0xbf
	blo _0204F6D8
	cmp r0, #0xd3
	bhi _0204F6D8
	mov r0, #0x35
	strb r0, [r4]
	ldrb r0, [r5, #1]
	add r0, r0, #0x33
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
_0204F6D8:
	bl GetDungeonGroup
	strb r0, [r4]
	ldrb r0, [r5]
	bl GetNbPrecedingFloors
	ldrb r1, [r5, #1]
	add r0, r1, r0
	strb r0, [r4, #1]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonFloorToGroupFloor

	arm_func_start sub_0204F6F8
sub_0204F6F8: ; 0x0204F6F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r1, r2
	bl sub_0204F77C
	cmp r5, #3
	addls pc, pc, r5, lsl #2
	b _0204F770
_0204F718: ; jump table
	b _0204F728 ; case 0
	b _0204F734 ; case 1
	b _0204F74C ; case 2
	b _0204F760 ; case 3
_0204F728:
	bl GetGroundNameId
	mov r4, r0
	b _0204F770
_0204F734:
	bl GetGroundNameId
#ifdef JAPAN
	add r0, r0, #3
	add r0, r0, #0x100
#else
	ldr r1, _0204F778 ; =0xFFFFFEFD
	add r0, r0, r1
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	b _0204F770
_0204F74C:
#if defined(EUROPE)
	add r0, r0, #0xbe
	add r0, r0, #0x4300
#elif defined(JAPAN)
	add r0, r0, #0x26c
	add r0, r0, #0x400
#else
	add r0, r0, #0x3bc
	add r0, r0, #0x4000
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	b _0204F770
_0204F760:
#if defined(EUROPE)
	add r0, r0, #0xbd
	add r0, r0, #0x4200
#elif defined(JAPAN)
	add r0, r0, #0x6f
	add r0, r0, #0x700
#else
	add r0, r0, #0xbb
	add r0, r0, #0x4200
#endif
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
_0204F770:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifndef JAPAN
_0204F778: .word 0xFFFFFEFD
#endif
	arm_func_end sub_0204F6F8

	arm_func_start sub_0204F77C
sub_0204F77C: ; 0x0204F77C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	beq _0204F7A0
	cmp r5, #0xae
	bne _0204F7A0
	bl GetNbFloorsDungeonGroup
	cmp r4, r0
	moveq r5, #0x7f
_0204F7A0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0204F77C

	arm_func_start sub_0204F7A8
sub_0204F7A8: ; 0x0204F7A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb4
	movhs r0, #1
	bhs _0204F808
	bl GetNbFloors
	add r1, r0, #1
	ldrb r0, [r4, #1]
	and r1, r1, #0xff
	cmp r0, r1
	movhs r0, #1
	bhs _0204F808
	add r0, sp, #0
	mov r1, r4
	bl DungeonFloorToGroupFloor
	ldrb r2, [sp]
	cmp r2, #0x64
	movhs r0, #1
	ldrlo r1, _0204F810 ; =MISSION_FLOOR_RANKS_PTRS
	ldrlob r0, [sp, #1]
	ldrlo r1, [r1, r2, lsl #2]
	ldrlob r0, [r1, r0]
_0204F808:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0204F810: .word MISSION_FLOOR_RANKS_PTRS
	arm_func_end sub_0204F7A8

	arm_func_start GetMissionRank
GetMissionRank: ; 0x0204F814
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xb4
	movhs r0, #1
	bhs _0204F880
	bl GetNbFloors
	add r1, r0, #1
	ldrb r0, [r4, #1]
	and r1, r1, #0xff
	cmp r0, r1
	movhs r0, #1
	bhs _0204F880
	add r0, sp, #0
	mov r1, r4
	bl DungeonFloorToGroupFloor
	ldrb r2, [sp]
	cmp r2, #0x64
	movhs r0, #1
	bhs _0204F880
	ldrb r1, [sp, #1]
	ldr r0, _0204F888 ; =MISSION_FLOOR_RANKS_PTRS
	cmp r1, #1
	ldr r0, [r0, r2, lsl #2]
	movle r1, #2
	ldrb r0, [r0, r1]
_0204F880:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0204F888: .word MISSION_FLOOR_RANKS_PTRS
	arm_func_end GetMissionRank

	arm_func_start GetOutlawLevel
GetOutlawLevel: ; 0x0204F88C
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8A4 ; =OUTLAW_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8A4: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawLevel

	arm_func_start GetOutlawLeaderLevel
GetOutlawLeaderLevel: ; 0x0204F8A8
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8C0 ; =OUTLAW_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8C0: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawLeaderLevel

	arm_func_start GetOutlawMinionLevel
GetOutlawMinionLevel: ; 0x0204F8C4
	stmdb sp!, {r3, lr}
	bl GetMissionRank
	ldr r1, _0204F8DC ; =OUTLAW_MINION_LEVEL_TABLE
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204F8DC: .word OUTLAW_MINION_LEVEL_TABLE
	arm_func_end GetOutlawMinionLevel

	arm_func_start AddGuestMonster
AddGuestMonster: ; 0x0204F8E0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	add lr, sp, #0x18
	mov r5, r0
	mov r4, r1
	mov r6, r2
	mov ip, #2
_0204F8FC:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0204F8FC
	ldr r1, [r6]
	mov r0, #1
	str r1, [lr]
	strb r0, [r5, #0xf]
	ldrsh r0, [sp, #0x1c]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0
	mov r2, #0xa
	bl StrncpyName
	add r2, sp, #0
	add r1, r5, #0x1c
	mov r0, #0x44
	mla r0, r4, r0, r1
	add r1, sp, #0x18
	str r2, [sp, #0x18]
	bl GuestMonsterToGroundMonster
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end AddGuestMonster

	arm_func_start GetGroundNameId
GetGroundNameId: ; 0x0204F958
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #6
	bne _0204F980
	mov r0, #0x1b
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _0204F99C
	ldr r0, _0204F9B0 ; =0x000042B9
	ldmia sp!, {r4, pc}
_0204F980:
	cmp r4, #0x15
	bne _0204F99C
	mov r0, #0x1c
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
#ifdef JAPAN
	moveq r0, #0x1c4
#else
	ldreq r0, _0204F9B4 ; =0x000042BA
#endif
	ldmeqia sp!, {r4, pc}
_0204F99C:
#if defined(EUROPE)
	add r0, r4, #0xba
	add r0, r0, #0x4100
#elif defined(JAPAN)
	add r0, r4, #0xc2
#else
	add r0, r4, #0x1b8
	add r0, r0, #0x4000
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0204F9B0: .word 0x000042BB
_0204F9B4: .word 0x000042BC
#elif defined(JAPAN)
_0204F9B0: .word 0x000001C3
#else
_0204F9B0: .word 0x000042B9
_0204F9B4: .word 0x000042BA
#endif
	arm_func_end GetGroundNameId

	arm_func_start sub_0204F9B8
sub_0204F9B8: ; 0x0204F9B8
	ldr ip, _0204F9C4 ; =ResetPlayTimer
	ldr r0, _0204F9C8 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9C4: .word ResetPlayTimer
_0204F9C8: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9B8

	arm_func_start sub_0204F9CC
sub_0204F9CC: ; 0x0204F9CC
	ldr ip, _0204F9D8 ; =PlayTimerTick
	ldr r0, _0204F9DC ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9D8: .word PlayTimerTick
_0204F9DC: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9CC

	arm_func_start sub_0204F9E0
sub_0204F9E0: ; 0x0204F9E0
	ldr ip, _0204F9EC ; =GetPlayTimeSeconds
	ldr r0, _0204F9F0 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204F9EC: .word GetPlayTimeSeconds
_0204F9F0: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9E0

	arm_func_start sub_0204F9F4
sub_0204F9F4: ; 0x0204F9F4
	ldr ip, _0204FA04 ; =sub_02050E5C
	mov r1, r0
	ldr r0, _0204FA08 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA04: .word sub_02050E5C
_0204FA08: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9F4

	arm_func_start sub_0204FA0C
sub_0204FA0C: ; 0x0204FA0C
	ldr ip, _0204FA1C ; =sub_02050E8C
	mov r1, r0
	ldr r0, _0204FA20 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA1C: .word sub_02050E8C
_0204FA20: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204FA0C

	arm_func_start SetAdventureLogStructLocation
SetAdventureLogStructLocation: ; 0x0204FA24
	ldr r1, _0204FA34 ; =_022AB69C
	ldr r0, _0204FA38 ; =ADVENTURE_LOG_PTR
	str r1, [r0]
	bx lr
	.align 2, 0
_0204FA34: .word _022AB69C
_0204FA38: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogStructLocation

	arm_func_start SetAdventureLogDungeonFloor
SetAdventureLogDungeonFloor: ; 0x0204FA3C
	ldr r1, _0204FA58 ; =ADVENTURE_LOG_PTR
	ldrb r2, [r0]
	ldr r1, [r1]
	strb r2, [r1, #0x278]
	ldrb r0, [r0, #1]
	strb r0, [r1, #0x279]
	bx lr
	.align 2, 0
_0204FA58: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogDungeonFloor

	arm_func_start GetAdventureLogDungeonFloor
GetAdventureLogDungeonFloor: ; 0x0204FA5C
	ldr r0, _0204FA6C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	add r0, r0, #0x278
	bx lr
	.align 2, 0
_0204FA6C: .word ADVENTURE_LOG_PTR
	arm_func_end GetAdventureLogDungeonFloor

	arm_func_start ClearAdventureLogStruct
ClearAdventureLogStruct: ; 0x0204FA70
	mov r3, #0
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r0, r3
_0204FA7C:
	ldr r2, [r1]
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #4
	blt _0204FA7C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r3, #0
	ldr r2, [r1]
	str r0, [r2, #0x2c]
	ldr r2, [r1]
	str r0, [r2, #0x30]
	ldr r2, [r1]
	str r0, [r2, #0x34]
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r2, [r1]
	str r0, [r2, #0x14]
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r2, [r1]
	str r0, [r2, #0x1c]
	ldr r2, [r1]
	str r0, [r2, #0x20]
	ldr r2, [r1]
	str r0, [r2, #0x24]
	ldr r2, [r1]
	str r0, [r2, #0x38]
	ldr r2, [r1]
	str r0, [r2, #0x3c]
	ldr r2, [r1]
	str r0, [r2, #0x40]
_0204FB00:
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	str r3, [r2, #0x44]
	ldr r2, [r1]
	add r2, r2, r0, lsl #2
	add r0, r0, #1
	str r3, [r2, #0xd8]
	cmp r0, #0x25
	blt _0204FB00
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov r2, #0
_0204FB2C:
	ldr r1, [r0]
	add r1, r1, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x16c]
	cmp r3, #0x11
	blt _0204FB2C
	ldr r0, _0204FB98 ; =ADVENTURE_LOG_PTR
	mov ip, #0
_0204FB4C:
	ldr r1, [r0]
	add r1, r1, r2, lsl #2
	add r2, r2, #1
	str ip, [r1, #0x1b0]
	cmp r2, #0x2c
	blt _0204FB4C
	ldr r1, _0204FB98 ; =ADVENTURE_LOG_PTR
	ldr r0, [r1]
	str ip, [r0, #0x260]
	mov r0, #0x3e8
_0204FB74:
	rsb r2, ip, #5
	mul r3, r2, r0
	ldr r2, [r1]
	add r2, r2, ip, lsl #2
	add ip, ip, #1
	str r3, [r2, #0x264]
	cmp ip, #5
	blt _0204FB74
	bx lr
	.align 2, 0
_0204FB98: .word ADVENTURE_LOG_PTR
	arm_func_end ClearAdventureLogStruct

	arm_func_start SetAdventureLogCompleted
SetAdventureLogCompleted: ; 0x0204FB9C
	ldr r1, _0204FBC0 ; =ADVENTURE_LOG_PTR
	mov r3, r0, asr #5
	ldr ip, [r1]
	and r0, r0, #0x1f
	ldr r2, [ip, r3, lsl #2]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [ip, r3, lsl #2]
	bx lr
	.align 2, 0
_0204FBC0: .word ADVENTURE_LOG_PTR
	arm_func_end SetAdventureLogCompleted

	arm_func_start IsAdventureLogNotEmpty
IsAdventureLogNotEmpty: ; 0x0204FBC4
	ldr r0, _0204FBF8 ; =ADVENTURE_LOG_PTR
	mov r1, #0
	ldr r2, [r0]
	b _0204FBE8
_0204FBD4:
	ldr r0, [r2, r1, lsl #2]
	cmp r0, #0
	movne r0, #1
	bxne lr
	add r1, r1, #1
_0204FBE8:
	cmp r1, #4
	blt _0204FBD4
	mov r0, #0
	bx lr
	.align 2, 0
_0204FBF8: .word ADVENTURE_LOG_PTR
	arm_func_end IsAdventureLogNotEmpty

	arm_func_start GetAdventureLogCompleted
GetAdventureLogCompleted: ; 0x0204FBFC
	ldr r1, _0204FC24 ; =ADVENTURE_LOG_PTR
	mov r2, r0, asr #5
	ldr r1, [r1]
	and r3, r0, #0x1f
	ldr r0, [r1, r2, lsl #2]
	mov r1, #1
	tst r0, r1, lsl r3
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_0204FC24: .word ADVENTURE_LOG_PTR
	arm_func_end GetAdventureLogCompleted

	arm_func_start IncrementNbDungeonsCleared
IncrementNbDungeonsCleared: ; 0x0204FC28
	ldr r0, _0204FC64 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FC68 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x10]
	add r2, r2, #1
	str r2, [r3, #0x10]
	ldr r3, [r0]
	ldr r2, [r3]
	orr r2, r2, #0x10
	str r2, [r3]
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, r1
	strgt r1, [r2, #0x10]
	bx lr
	.align 2, 0
_0204FC64: .word ADVENTURE_LOG_PTR
_0204FC68: .word 0x000F423F
	arm_func_end IncrementNbDungeonsCleared

	arm_func_start GetNbDungeonsCleared
GetNbDungeonsCleared: ; 0x0204FC6C
	ldr r0, _0204FC7C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0204FC7C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbDungeonsCleared

	arm_func_start IncrementNbFriendRescues
IncrementNbFriendRescues: ; 0x0204FC80
	ldr r0, _0204FCC0 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FCC4 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x14]
	add r2, r2, #1
	str r2, [r3, #0x14]
	ldr r2, [r0]
	ldr r0, [r2, #0x14]
	cmp r0, r1
	ldr r0, _0204FCC0 ; =ADVENTURE_LOG_PTR
	strgt r1, [r2, #0x14]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x40
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FCC0: .word ADVENTURE_LOG_PTR
_0204FCC4: .word 0x000F423F
	arm_func_end IncrementNbFriendRescues

	arm_func_start GetNbFriendRescues
GetNbFriendRescues: ; 0x0204FCC8
	ldr r0, _0204FCD8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0204FCD8: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbFriendRescues

	arm_func_start IncrementNbEvolutions
IncrementNbEvolutions: ; 0x0204FCDC
	ldr r0, _0204FD1C ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FD20 ; =0x000F423F
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	add r2, r2, #1
	str r2, [r3, #0x18]
	ldr r2, [r0]
	ldr r0, [r2, #0x18]
	cmp r0, r1
	ldr r0, _0204FD1C ; =ADVENTURE_LOG_PTR
	strgt r1, [r2, #0x18]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x80
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FD1C: .word ADVENTURE_LOG_PTR
_0204FD20: .word 0x000F423F
	arm_func_end IncrementNbEvolutions

	arm_func_start GetNbEvolutions
GetNbEvolutions: ; 0x0204FD24
	ldr r0, _0204FD34 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bx lr
	.align 2, 0
_0204FD34: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbEvolutions

	arm_func_start IncrementNbSteals
IncrementNbSteals: ; 0x0204FD38
	bx lr
	arm_func_end IncrementNbSteals

	arm_func_start IncrementNbEggsHatched
IncrementNbEggsHatched: ; 0x0204FD3C
	ldr r1, _0204FD70 ; =ADVENTURE_LOG_PTR
	ldr r0, _0204FD74 ; =0x000F423F
	ldr r2, [r1]
	ldr r1, [r2, #0x1c]
	cmp r1, r0
	addlt r0, r1, #1
	strlt r0, [r2, #0x1c]
	ldr r0, _0204FD70 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x100
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FD70: .word ADVENTURE_LOG_PTR
_0204FD74: .word 0x000F423F
	arm_func_end IncrementNbEggsHatched

	arm_func_start GetNbEggsHatched
GetNbEggsHatched: ; 0x0204FD78
	ldr r0, _0204FD88 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bx lr
	.align 2, 0
_0204FD88: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbEggsHatched

	arm_func_start GetNbPokemonJoined
GetNbPokemonJoined: ; 0x0204FD8C
	ldr r0, _0204FD9C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	bx lr
	.align 2, 0
_0204FD9C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbPokemonJoined

	arm_func_start GetNbMovesLearned
GetNbMovesLearned: ; 0x0204FDA0
	ldr r0, _0204FDB0 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	bx lr
	.align 2, 0
_0204FDB0: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbMovesLearned

	arm_func_start SetVictoriesOnOneFloor
SetVictoriesOnOneFloor: ; 0x0204FDB4
	ldr r1, _0204FDE0 ; =0x000F423F
	cmp r0, r1
	movgt r0, r1
	ldr r1, _0204FDE4 ; =ADVENTURE_LOG_PTR
	ldr r2, [r1]
	str r0, [r2, #0x28]
	ldr r1, [r1]
	ldr r0, [r1]
	orr r0, r0, #0x200
	str r0, [r1]
	bx lr
	.align 2, 0
_0204FDE0: .word 0x000F423F
_0204FDE4: .word ADVENTURE_LOG_PTR
	arm_func_end SetVictoriesOnOneFloor

	arm_func_start GetVictoriesOnOneFloor
GetVictoriesOnOneFloor: ; 0x0204FDE8
	ldr r0, _0204FDF8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_0204FDF8: .word ADVENTURE_LOG_PTR
	arm_func_end GetVictoriesOnOneFloor
