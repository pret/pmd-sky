	.include "asm/macros.inc"
	.include "overlay_29_02340CE4.inc"

	.text

	arm_func_start ShuffleSpawnPositions
ShuffleSpawnPositions: ; 0x02340CE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	b _02340D40
_02340CF8:
	mov r0, r6
	bl DungeonRandInt
	mov r4, r0
	mov r0, r6
	bl DungeonRandInt
	add lr, r7, r4, lsl #1
	ldrb ip, [r7, r4, lsl #1]
	ldrb r3, [lr, #1]
	ldrb r1, [r7, r0, lsl #1]
	add r2, r7, r0, lsl #1
	strb ip, [sp]
	strb r1, [r7, r4, lsl #1]
	ldrb r1, [r2, #1]
	strb r3, [sp, #1]
	add r5, r5, #1
	strb r1, [lr, #1]
	strb ip, [r7, r0, lsl #1]
	strb r3, [r2, #1]
_02340D40:
	cmp r5, r6, lsl #1
	blt _02340CF8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShuffleSpawnPositions

	arm_func_start MarkNonEnemySpawns
MarkNonEnemySpawns: ; 0x02340D4C
#ifdef JAPAN
#define MARK_NON_ENEMY_SPAWNS_OFFSET -0xA4
#else
#define MARK_NON_ENEMY_SPAWNS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe00
	ldr r3, _02341458 ; =DUNGEON_PTR
	mov sl, r0
	ldr r5, [r3]
	mvn r2, #0
	add r0, r5, #0xcc00
	ldrsh r3, [r0, #0xe4 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	mov sb, r1
	cmp r3, r2
	ldrnesh r0, [r0, #0xe6 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	cmpne r0, r2
	bne _02340EC8
	mov r6, #0
	mov r8, r6
	add fp, sp, #0
_02340D8C:
	mov r7, #0
	and r4, r8, #0xff
_02340D94:
	mov r0, r8
	mov r1, r7
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _02340DF4
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _02340DF4
	tst r2, #0x20
	bne _02340DF4
	ldrh r0, [r0, #2]
	tst r0, #8
	bne _02340DF4
	tst r0, #0x10
	bne _02340DF4
	tst r2, #8
	bne _02340DF4
	tst r2, #0x100
	streqb r4, [fp, r6, lsl #1]
	addeq r0, fp, r6, lsl #1
	streqb r7, [r0, #1]
	addeq r6, r6, #1
_02340DF4:
	add r7, r7, #1
	cmp r7, #0x20
	blt _02340D94
	add r8, r8, #1
	cmp r8, #0x38
	blt _02340D8C
	cmp r6, #0
	beq _02340EC8
	mov r0, r6
	bl DungeonRandInt
	add r1, r5, #0xc4 + MARK_NON_ENEMY_SPAWNS_OFFSET
	add r2, sp, #0
	mov r4, r0
	add r0, r2, r4, lsl #1
	add r1, r1, #0x4000
	mov r2, #0
	bl SpawnStairs
	ldr r0, _0234145C ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _02340EC8
	sub r0, r6, #1
	add r3, sp, #0
	b _02340E6C
_02340E54:
	add r2, r3, r4, lsl #1
	ldrb r1, [r2, #2]
	strb r1, [r3, r4, lsl #1]
	ldrb r1, [r2, #3]
	add r4, r4, #1
	strb r1, [r2, #1]
_02340E6C:
	cmp r4, r0
	blt _02340E54
	ldr r0, _02341458 ; =DUNGEON_PTR
	ldr r1, _0234145C ; =FLOOR_GENERATION_STATUS
	ldr r2, [r0]
	ldr r4, [r1, #0x2c]
	add r0, r2, #0x2c000
	ldrb r1, [r2, #0x749]
	ldrb r0, [r0, #0xaf4 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	add r1, r1, #1
	cmp r1, r0
	bge _02340EC8
	mov r0, #3
	bl DungeonRngSetSecondary
	sub r0, r6, #1
	bl DungeonRandInt
	add r3, sp, #0
	add r1, r5, #0xc4 + MARK_NON_ENEMY_SPAWNS_OFFSET
	mov r2, r4
	add r0, r3, r0, lsl #1
	add r1, r1, #0x4000
	bl SpawnStairs
	bl DungeonRngSetPrimary
_02340EC8:
	mov r6, #0
	mov r7, r6
	add fp, sp, #0
_02340ED4:
	mov r8, #0
	and r4, r7, #0xff
_02340EDC:
	mov r0, r7
	mov r1, r8
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _02340F30
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	beq _02340F30
	tst r2, #0x20
	bne _02340F30
	tst r2, #0x40
	bne _02340F30
	tst r2, #8
	bne _02340F30
	tst r2, #0x100
	streqb r4, [fp, r6, lsl #1]
	addeq r0, fp, r6, lsl #1
	streqb r8, [r0, #1]
	addeq r6, r6, #1
_02340F30:
	add r8, r8, #1
	cmp r8, #0x20
	blt _02340EDC
	add r7, r7, #1
	cmp r7, #0x38
	blt _02340ED4
	cmp r6, #0
	beq _02340FFC
	ldrb r4, [sl, #0xf]
	cmp r4, #0
	beq _02340F74
	sub r0, r4, #2
	add r1, r4, #2
	bl DungeonRandRange
	mov r4, r0
	cmp r4, #1
	movlt r4, #1
_02340F74:
	ldr r1, _02341458 ; =DUNGEON_PTR
	ldr r0, _02341460 ; =0x0002C9E8
	ldr r2, [r1]
	ldrsh r0, [r2, r0]
	cmp r0, #0
	addne r4, r4, #1
	add r1, r4, #1
	ldr r0, _02341464 ; =0x00012AFA
	cmp r1, #0
	strh r1, [r2, r0]
	ble _02340FFC
	add r0, sp, #0
	mov r1, r6
	bl ShuffleSpawnPositions
	mov r0, r6
	bl DungeonRandInt
	mov r8, r0
	mov r7, #0
	add r4, r4, #1
	add fp, sp, #0
	b _02340FF4
_02340FC8:
	add r1, fp, r8, lsl #1
	ldrb r0, [fp, r8, lsl #1]
	ldrb r1, [r1, #1]
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r8, r8, #1
	cmp r8, r6
	orr r1, r1, #2
	strh r1, [r0, #2]
	moveq r8, #0
	add r7, r7, #1
_02340FF4:
	cmp r7, r4
	blt _02340FC8
_02340FFC:
	mov r6, #0
	mov r7, r6
	add fp, sp, #0
_02341008:
	mov r8, #0
	and r4, r7, #0xff
_02341010:
	mov r0, r7
	mov r1, r8
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	streqb r4, [fp, r6, lsl #1]
	addeq r0, fp, r6, lsl #1
	streqb r8, [r0, #1]
	add r8, r8, #1
	addeq r6, r6, #1
	cmp r8, #0x20
	blt _02341010
	add r7, r7, #1
	cmp r7, #0x38
	blt _02341008
	cmp r6, #0
	beq _023410D0
	ldrb r7, [sl, #0x14]
	cmp r7, #0
	beq _02341070
	sub r0, r7, #2
	add r1, r7, #2
	bl DungeonRandRange
	mov r7, r0
_02341070:
	cmp r7, #0
	ble _023410D0
	add r0, sp, #0
	mov r1, r6
	bl ShuffleSpawnPositions
	mov r0, r6
	bl DungeonRandInt
	mov r4, r0
	mov r8, #0
	add fp, sp, #0
	b _023410C8
_0234109C:
	add r1, fp, r4, lsl #1
	ldrb r0, [fp, r4, lsl #1]
	ldrb r1, [r1, #1]
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r4, r4, #1
	cmp r4, r6
	orr r1, r1, #2
	strh r1, [r0, #2]
	moveq r4, #0
	add r8, r8, #1
_023410C8:
	cmp r8, r7
	blt _0234109C
_023410D0:
	cmp sb, #0
	mov r6, #0
	bne _0234113C
	mov r8, r6
	add r4, sp, #0
	mov fp, r6
_023410E8:
	mov sb, fp
	and r7, r8, #0xff
_023410F0:
	mov r0, r8
	mov r1, sb
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x20
	bne _02341124
	tst r0, #0x40
	beq _02341124
	tst r0, #8
	streqb r7, [r4, r6, lsl #1]
	addeq r0, r4, r6, lsl #1
	streqb sb, [r0, #1]
	addeq r6, r6, #1
_02341124:
	add sb, sb, #1
	cmp sb, #0x20
	blt _023410F0
	add r8, r8, #1
	cmp r8, #0x38
	blt _023410E8
_0234113C:
	cmp r6, #0
	beq _02341228
	add r0, r6, r6, lsl #2
	mov r1, #0xa
	bl _s32_div_f
	mov r4, r0
	mov r0, r6, lsl #3
	mov r1, #0xa
	bl _s32_div_f
	mov r1, r0
	mov r0, r4
	bl DungeonRandRange
	mov r8, r0
	ldr r0, _02341468 ; =MONSTER_HOUSE_MAX_NON_MONSTER_SPAWNS
	cmp r8, #6
	ldrsh r0, [r0]
	movlt r8, #6
	mov r1, r6
	cmp r8, r0
	movge r8, r0
	add r0, sp, #0
	bl ShuffleSpawnPositions
	mov r0, r6
	bl DungeonRandInt
	ldr r1, _0234146C ; =FIRST_DUNGEON_WITH_MONSTER_HOUSE_TRAPS
	mov r7, r0
	ldrb fp, [r1]
	mov sb, #0
	b _02341220
_023411B0:
	add r0, sp, #0
	add r1, r0, r7, lsl #1
	ldrb r0, [r0, r7, lsl #1]
	ldrb r1, [r1, #1]
	bl GetTileSafe
	mov r4, r0
	mov r0, #2
	bl DungeonRandInt
	cmp r0, #0
	ldrneh r0, [r4, #2]
	orrne r0, r0, #2
	strneh r0, [r4, #2]
	bne _02341210
	ldr r0, _02341458 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x75c]
	cmp r0, #0
	bne _02341204
	ldrb r0, [r1, #0x748]
	cmp r0, fp
	blo _02341210
_02341204:
	ldrh r0, [r4, #2]
	orr r0, r0, #4
	strh r0, [r4, #2]
_02341210:
	add r7, r7, #1
	cmp r7, r6
	moveq r7, #0
	add sb, sb, #1
_02341220:
	cmp sb, r8
	blt _023411B0
_02341228:
	mov r7, #0
	mov r8, r7
	add r4, sp, #0
	mov fp, r7
_02341238:
	mov sb, fp
	and r6, r8, #0xff
_02341240:
	mov r0, r8
	mov r1, sb
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _02341298
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _02341298
	tst r2, #0x20
	bne _02341298
	ldrh r0, [r0, #2]
	tst r0, #2
	bne _02341298
	tst r2, #8
	bne _02341298
	tst r2, #0x100
	streqb r6, [r4, r7, lsl #1]
	addeq r0, r4, r7, lsl #1
	streqb sb, [r0, #1]
	addeq r7, r7, #1
_02341298:
	add sb, sb, #1
	cmp sb, #0x20
	blt _02341240
	add r8, r8, #1
	cmp r8, #0x38
	blt _02341238
	cmp r7, #0
	beq _02341334
	ldrb r1, [sl, #0x10]
	mov r0, r1, lsr #1
	bl DungeonRandRange
	mov r8, r0
	cmp r8, #0
	ble _02341334
	add r0, sp, #0
	cmp r8, #0x38
	mov r1, r7
	movge r8, #0x38
	bl ShuffleSpawnPositions
	mov r0, r7
	bl DungeonRandInt
	mov sb, #0
	mov r6, r0
	mov sl, sb
	add r4, sp, #0
	b _0234132C
_02341300:
	add r1, r4, r6, lsl #1
	ldrb r0, [r4, r6, lsl #1]
	ldrb r1, [r1, #1]
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r6, r6, #1
	cmp r6, r7
	orr r1, r1, #4
	strh r1, [r0, #2]
	moveq r6, sl
	add sb, sb, #1
_0234132C:
	cmp sb, r8
	blt _02341300
_02341334:
	bl GetFloorType
	cmp r0, #2
	add r0, r5, #0xcc00
	moveq r3, #1
	movne r3, #0
	ldrsh r2, [r0, #0xe0 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	mvn r1, #0
	and r7, r3, #0xff
	cmp r2, r1
	ldrnesh r0, [r0, #0xe2 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	cmpne r0, r1
	bne _02341450
	mov r8, #0
	mov sb, r8
_0234136C:
	mov sl, #0
	and r6, sb, #0xff
	add r4, r5, #0x4000
	add fp, sp, #0
_0234137C:
	mov r0, sb
	mov r1, sl
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _0234140C
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0234140C
	tst r2, #0x20
	bne _0234140C
	tst r2, #8
	bne _0234140C
	tst r2, #0x100
	bne _0234140C
	ldrh r0, [r0, #2]
	tst r0, #2
	bne _0234140C
	tst r0, #8
	bne _0234140C
	tst r0, #4
	bne _0234140C
	cmp r7, #0
	beq _023413E8
	tst r0, #1
	bne _0234140C
_023413E8:
	ldr r0, _0234145C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #8]
	cmp r0, #0
	ldrneb r0, [r4, #0xc9 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	cmpne r0, r1
	streqb r6, [fp, r8, lsl #1]
	addeq r0, fp, r8, lsl #1
	streqb sl, [r0, #1]
	addeq r8, r8, #1
_0234140C:
	add sl, sl, #1
	cmp sl, #0x20
	blt _0234137C
	add sb, sb, #1
	cmp sb, #0x38
	blt _0234136C
	cmp r8, #0
	beq _02341450
	mov r0, r8
	bl DungeonRandInt
	add r2, sp, #0
	ldrb r3, [r2, r0, lsl #1]
	add r1, r5, #0xcc00
	add r2, sp, #1
	strh r3, [r1, #0xe0 + MARK_NON_ENEMY_SPAWNS_OFFSET]
	ldrb r0, [r2, r0, lsl #1]
	strh r0, [r1, #0xe2 + MARK_NON_ENEMY_SPAWNS_OFFSET]
_02341450:
	add sp, sp, #0xe00
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02341458: .word DUNGEON_PTR
_0234145C: .word FLOOR_GENERATION_STATUS
_02341460: .word 0x0002C9E8 + MARK_NON_ENEMY_SPAWNS_OFFSET
_02341464: .word 0x00012AFA + MARK_NON_ENEMY_SPAWNS_OFFSET
_02341468: .word MONSTER_HOUSE_MAX_NON_MONSTER_SPAWNS
_0234146C: .word FIRST_DUNGEON_WITH_MONSTER_HOUSE_TRAPS
	arm_func_end MarkNonEnemySpawns

	arm_func_start MarkEnemySpawns
MarkEnemySpawns: ; 0x02341470
#ifdef JAPAN
#define MARK_ENEMY_SPAWNS_OFFSET -0xA4
#else
#define MARK_ENEMY_SPAWNS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x204
	sub sp, sp, #0xc00
	str r1, [sp]
	ldrb r1, [r0, #6]
	ldr r0, _02341760 ; =DUNGEON_PTR
	cmp r1, #1
	ldr sb, [r0]
	blt _023414B0
	add r0, r1, r1, lsr #31
	mov r0, r0, asr #1
	bl DungeonRandRange
	mov r8, r0
	cmp r8, #1
	movlt r8, #1
	b _023414BC
_023414B0:
	mov r0, r1
	bl abs
	mov r8, r0
_023414BC:
	mov r6, #0
	mov sl, r6
_023414C4:
	mov r7, #0
	and r5, sl, #0xff
	add r4, sb, #0xcc00
	add fp, sb, #0x4000
_023414D4:
	mov r0, sl
	mov r1, r7
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _0234156C
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _0234156C
	tst r2, #0x20
	bne _0234156C
	ldrh r0, [r0, #2]
	tst r0, #2
	bne _0234156C
	tst r0, #1
	bne _0234156C
	tst r2, #8
	bne _0234156C
	tst r2, #0x100
	bne _0234156C
	ldrsh r0, [r4, #0xe0 + MARK_ENEMY_SPAWNS_OFFSET]
	cmp sl, r0
	ldreqsh r0, [r4, #0xe2 + MARK_ENEMY_SPAWNS_OFFSET]
	cmpeq r7, r0
	beq _0234156C
	ldr r0, _02341764 ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _02341558
	ldrb r0, [fp, #0xc9 + MARK_ENEMY_SPAWNS_OFFSET]
	cmp r0, r1
	beq _0234156C
_02341558:
	add r0, sp, #4
	strb r5, [r0, r6, lsl #1]
	add r0, r0, r6, lsl #1
	strb r7, [r0, #1]
	add r6, r6, #1
_0234156C:
	add r7, r7, #1
	cmp r7, #0x20
	blt _023414D4
	add sl, sl, #1
	cmp sl, #0x38
	blt _023414C4
	cmp r6, #0
	beq _023415F4
	adds r0, r8, #1
	beq _023415F4
	add r0, sp, #4
	mov r1, r6
	bl ShuffleSpawnPositions
	mov r0, r6
	bl DungeonRandInt
	mov r5, #0
	mov r7, r0
	add r8, r8, #1
	mov sl, r5
	add r4, sp, #4
	b _023415EC
_023415C0:
	add r1, r4, r7, lsl #1
	ldrb r0, [r4, r7, lsl #1]
	ldrb r1, [r1, #1]
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r7, r7, #1
	cmp r7, r6
	orr r1, r1, #8
	strh r1, [r0, #2]
	moveq r7, sl
	add r5, r5, #1
_023415EC:
	cmp r5, r8
	blt _023415C0
_023415F4:
	add r0, sb, #0x4000
	ldrb r2, [r0, #0xc4 + MARK_ENEMY_SPAWNS_OFFSET]
	cmp r2, #0
	beq _02341754
	ldr r1, _02341768 ; =MONSTER_HOUSE_MAX_MONSTER_SPAWNS
	ldr r0, [sp]
	ldrsh r6, [r1]
	cmp r0, #0
	mov r7, #0
	movne r6, #3
	cmp r2, #0
	addne r0, r6, r6, lsl #1
	addne r0, r0, r0, lsr #31
	movne r6, r0, asr #1
	mov r8, #0
	add fp, sp, #4
_02341634:
	mov sl, #0
	and r5, r8, #0xff
	add r4, sb, #0xcc00
_02341640:
	mov r0, r8
	mov r1, sl
	bl GetTile
	ldrh r2, [r0]
	and r1, r2, #3
	cmp r1, #1
	bne _023416A0
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	beq _023416A0
	tst r2, #0x20
	bne _023416A0
	tst r2, #0x100
	bne _023416A0
	tst r2, #0x40
	beq _023416A0
	ldrsh r0, [r4, #0xe0 + MARK_ENEMY_SPAWNS_OFFSET]
	cmp r8, r0
	ldreqsh r0, [r4, #0xe2 + MARK_ENEMY_SPAWNS_OFFSET]
	cmpeq sl, r0
	strneb r5, [fp, r7, lsl #1]
	addne r0, fp, r7, lsl #1
	strneb sl, [r0, #1]
	addne r7, r7, #1
_023416A0:
	add sl, sl, #1
	cmp sl, #0x20
	blt _02341640
	add r8, r8, #1
	cmp r8, #0x38
	blt _02341634
	cmp r7, #0
	beq _02341754
	rsb r0, r7, r7, lsl #3
	mov r1, #0xa
	bl _s32_div_f
	mov r4, r0
	mov r0, r7, lsl #3
	mov r1, #0xa
	bl _s32_div_f
	mov r1, r0
	mov r0, r4
	bl DungeonRandRange
	movs r5, r0
	moveq r5, #1
	cmp r5, r6
	add r0, sp, #4
	mov r1, r7
	movge r5, r6
	bl ShuffleSpawnPositions
	mov r0, r7
	bl DungeonRandInt
	mov r8, #0
	mov r6, r0
	mov sb, r8
	add r4, sp, #4
	b _0234174C
_02341720:
	add r1, r4, r6, lsl #1
	ldrb r0, [r4, r6, lsl #1]
	ldrb r1, [r1, #1]
	bl GetTileSafe
	ldrh r1, [r0, #2]
	add r6, r6, #1
	cmp r6, r7
	orr r1, r1, #8
	strh r1, [r0, #2]
	moveq r6, sb
	add r8, r8, #1
_0234174C:
	cmp r8, r5
	blt _02341720
_02341754:
	add sp, sp, #0x204
	add sp, sp, #0xc00
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02341760: .word DUNGEON_PTR
_02341764: .word FLOOR_GENERATION_STATUS
_02341768: .word MONSTER_HOUSE_MAX_MONSTER_SPAWNS
	arm_func_end MarkEnemySpawns

	arm_func_start SetSecondaryTerrainOnWall
SetSecondaryTerrainOnWall: ; 0x0234176C
	ldrh r1, [r0]
	mov r2, #1
	tst r1, #3
	ldrh r1, [r0]
	movne r2, #0
	tst r1, #0x10
	movne r2, #0
	cmp r2, #0
	bxeq lr
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #2
	strh r1, [r0]
	bx lr
	arm_func_end SetSecondaryTerrainOnWall

