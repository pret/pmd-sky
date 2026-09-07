	.include "asm/macros.inc"
	.include "overlay_29_02343980.inc"

	.text

    .public TryOpenKeyDoor
    .public LoadFixedRoomData 
    .public ov29_02343DD8

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
