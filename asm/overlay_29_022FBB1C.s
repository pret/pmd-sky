	.include "asm/macros.inc"
	.include "overlay_29_022FBB1C.inc"

	.text

	arm_func_start ov29_022FBB1C
ov29_022FBB1C: ; 0x022FBB1C
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _022FBBE4 ; =DUNGEON_PTR
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r4, _022FBBE4 ; =DUNGEON_PTR
	ldr sl, _022FBBE8 ; =0x00019914
#endif
	mov r7, #0
	add r6, sp, #0
	mov r5, #3
_022FBB38:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBBD0
	ldr sb, [r8, #0xb4]
	ldr r2, [r4]
	ldrsh r1, [sb, #4]
	add r0, r8, #0x2c
	add r1, r2, r1, lsl #1
#ifdef JAPAN
	add r1, r1, #0x19800
	ldrsh r1, [r1, #0x70]
#else
	ldrsh r1, [r1, sl]
#endif
	strh r1, [r8, #0xa8]
	bl InitAnimationControlWithSet__0201C0CC
	ldrsh r1, [r8, #0xa8]
	add r0, r8, #0x2c
	bl SetSpriteIdForAnimationControl
	mov r0, r8
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r8
	bl ov29_02304830
	ldrh r0, [r8, #4]
	mov r2, r6
	mov r3, r5
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	ldr r0, [sb, #0xb0]
	ldrsh r1, [sb, #4]
	bl ov29_022DDA54
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTileSafe
	ldrb r0, [r0, #7]
	strb r0, [r8, #0x25]
_022FBBD0:
	add r7, r7, #1
	cmp r7, #0x14
	blt _022FBB38
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#else
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
#endif
	.align 2, 0
_022FBBE4: .word DUNGEON_PTR
#ifndef JAPAN
_022FBBE8: .word 0x00019914
#endif
	arm_func_end ov29_022FBB1C

	arm_func_start ov29_022FBBEC
ov29_022FBBEC: ; 0x022FBBEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, #0
	ldr r6, _022FBC48 ; =DUNGEON_PTR
	b _022FBC38
_022FBC00:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBC34
	ldr r0, [r7, #0xb4]
	ldrb r0, [r0, #0xbc]
	cmp r5, r0
	moveq r0, r7
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022FBC34:
	add r4, r4, #1
_022FBC38:
	cmp r4, #0x14
	blt _022FBC00
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FBC48: .word DUNGEON_PTR
	arm_func_end ov29_022FBBEC

	arm_func_start ov29_022FBC4C
ov29_022FBC4C: ; 0x022FBC4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _022FBC90 ; =DUNGEON_PTR
	b _022FBC80
_022FBC5C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl EntityIsValid__022F7364
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r5, r5, #1
_022FBC80:
	cmp r5, #4
	blt _022FBC5C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FBC90: .word DUNGEON_PTR
	arm_func_end ov29_022FBC4C

	arm_func_start ov29_022FBC94
ov29_022FBC94: ; 0x022FBC94
	stmdb sp!, {r4, r5, r6, lr}
	bl GetBodySize
	ldr r6, _022FBD04 ; =DUNGEON_PTR
	mov r4, r0
	mov r5, #0
_022FBCA8:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBCE4
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	ldr r0, [r0, #0xb4]
	ldrsh r0, [r0, #2]
	bl GetBodySize
	add r4, r4, r0
_022FBCE4:
	add r5, r5, #1
	cmp r5, #4
	blt _022FBCA8
	cmp r4, #6
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FBD04: .word DUNGEON_PTR
	arm_func_end ov29_022FBC94

#ifndef JAPAN
	arm_func_start ov29_022FBD08
ov29_022FBD08: ; 0x022FBD08
	ldr r0, _022FBD20 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0xe1c]
	bx lr
	.align 2, 0
_022FBD20: .word DUNGEON_PTR
	arm_func_end ov29_022FBD08

	arm_func_start ov29_022FBD24
ov29_022FBD24: ; 0x022FBD24
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022FBD7C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1cc
	add r3, r0, #0x3c00
	ldr r2, [r3, #0x50]
	cmp r2, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xb4]
	mov r0, #1
	ldr r1, [r1, #0xb0]
	str r1, [r3, r2, lsl #2]
	ldr r1, [r3, #0x50]
	add r1, r1, #1
	str r1, [r3, #0x50]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FBD7C: .word DUNGEON_PTR
	arm_func_end ov29_022FBD24

	arm_func_start ov29_022FBD80
ov29_022FBD80: ; 0x022FBD80
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBDD4
	ldr r0, _022FBDDC ; =DUNGEON_PTR
	ldr r1, [r4, #0xb4]
	ldr r0, [r0]
	ldr r2, [r1, #0xb0]
	add r0, r0, #0x1cc
	add r1, r0, #0x3c00
	ldr ip, [r1, #0x50]
	mov r3, #0
	b _022FBDCC
_022FBDB8:
	ldr r0, [r1, r3, lsl #2]
	cmp r2, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r3, r3, #1
_022FBDCC:
	cmp r3, ip
	blt _022FBDB8
_022FBDD4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FBDDC: .word DUNGEON_PTR
	arm_func_end ov29_022FBD80
#endif

	arm_func_start ov29_022FBDE0
ov29_022FBDE0: ; 0x022FBDE0
	ldr ip, _022FBDEC ; =ov29_022EFAE8
	ldrb r0, [r0, #0xbc]
	bx ip
	.align 2, 0
_022FBDEC: .word ov29_022EFAE8
	arm_func_end ov29_022FBDE0

	arm_func_start ov29_022FBDF0
ov29_022FBDF0: ; 0x022FBDF0
	ldr r0, [r0, #0xb4]
	ldr ip, _022FBE00 ; =IsSecretBazaarNpcBehavior
	ldrb r0, [r0, #0xbc]
	bx ip
	.align 2, 0
_022FBE00: .word IsSecretBazaarNpcBehavior
	arm_func_end ov29_022FBDF0

	arm_func_start ov29_022FBE04
ov29_022FBE04: ; 0x022FBE04
	stmdb sp!, {r3, lr}
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _022FBE4C
	ldr r0, _022FBE54 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl GetTurnLimit
	ldr r1, _022FBE54 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x700
	ldrsh r1, [r1, #0x84]
	cmp r1, r0
	bne _022FBE4C
	bl IsFullFloorFixedRoom
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_022FBE4C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE54: .word DUNGEON_PTR
	arm_func_end ov29_022FBE04

	arm_func_start InitOtherMonsterData
InitOtherMonsterData: ; 0x022FBE58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr ip, [r4, #0xb4]
	mov r6, #1
	strb r6, [ip, #0x100]
	ldrsh r5, [ip, #0x12]
	ldrsh r3, [ip, #0x16]
	ldr r7, _022FBF04 ; =FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	mov r0, #0xc
	add r5, r5, r3
	smlabb r3, r1, r0, r7
	rsb lr, r6, #0x3e8
	cmp r5, lr
	movgt r5, lr
	strh r5, [ip, #0x14]
	mov r0, #0
	strh r0, [ip, #0x16]
	strh r0, [ip, #0x18]
	ldrsh r5, [r3, #2]
	add lr, ip, #0x100
	add r0, ip, #0x90
	strh r5, [ip, #0x12]
	ldrsh r5, [r3, #2]
	strh r5, [ip, #0x10]
	ldrb r5, [r3, #6]
	strb r5, [ip, #0x1a]
	ldrb r5, [r3, #7]
	strb r5, [ip, #0x1b]
	ldrb r5, [r3, #8]
	strb r5, [ip, #0x1c]
	ldrb r3, [r3, #9]
	strb r3, [ip, #0x1d]
#ifdef JAPAN
	strh r1, [lr, #0x64]
	strb r2, [ip, #0x166]
#else
	strh r1, [lr, #0x68]
	strb r2, [ip, #0x16a]
#endif
	ldrsh r1, [ip, #2]
	ldrsh r2, [ip, #0xe]
	bl EnableAllLearnableIqSkills
	mov r0, r4
	bl ov29_023021F0
	mov r0, r4
	mov r1, #1
	bl ov29_022FB83C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FBF04: .word FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	arm_func_end InitOtherMonsterData

	arm_func_start ov29_022FBF08
ov29_022FBF08: ; 0x022FBF08
	stmdb sp!, {r3, lr}
	ldr r0, _022FBF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x7cc]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r3, pc}
	bl LoadWazaP2
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBF2C: .word DUNGEON_PTR
	arm_func_end ov29_022FBF08

	arm_func_start ov29_022FBF30
ov29_022FBF30: ; 0x022FBF30
	stmdb sp!, {r3, lr}
	ldr r0, _022FBF54 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x7cc]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r3, pc}
	bl UnloadCurrentWazaP
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBF54: .word DUNGEON_PTR
	arm_func_end ov29_022FBF30

	arm_func_start InitEnemySpawnStats
InitEnemySpawnStats: ; 0x022FBF58
#ifdef JAPAN
#define INIT_ENEMY_SPAWN_STATS_OFFSET -0x50
#else
#define INIT_ENEMY_SPAWN_STATS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x218
	ldr r1, _022FC230 ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r1]
	add r1, r1, #0xf4 + INIT_ENEMY_SPAWN_STATS_OFFSET
	add r5, r1, #0x3400
	bl DungeonRngSetSecondary
	bl ov29_022FBF08
	add r0, sp, #0x16
	mov r1, #0
	bl CopySpawnEntriesMaster
	mov r4, r0
	mov r6, #0
	b _022FC028
_022FBF94:
	add r0, sp, #0x16
	add r7, r0, r6, lsl #3
	mov r0, r7
	bl GetMonsterIdFromSpawnEntry
	strh r0, [r5]
	mov r0, r7
	bl GetMonsterLevelFromSpawnEntry
	strh r0, [r5, #2]
	ldrsh r1, [r5]
	ldrsh r2, [r5, #2]
	add r0, r5, #4
	bl GetMonsterMoves
	ldrh r0, [r5, #4]
	cmp r0, #0
	moveq r0, #0x170
	streqh r0, [r5, #4]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetMaxHpAtLevel
	strh r0, [r5, #0xc]
	mov r7, #0
_022FBFE8:
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r7
	add r8, r5, r7
	bl GetOffensiveStatAtLevel
	strb r0, [r8, #0xe]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r7
	bl GetDefensiveStatAtLevel
	add r7, r7, #1
	strb r0, [r8, #0x10]
	cmp r7, #2
	blt _022FBFE8
	add r5, r5, #0x12
	add r6, r6, #1
_022FC028:
	cmp r6, r4
	blt _022FBF94
	mov r0, #0
	b _022FC040
_022FC038:
	strh r0, [r5], #0x12
	add r6, r6, #1
_022FC040:
	cmp r6, #0x40
	blt _022FC038
	cmp r4, #0x40
	bge _022FC0A8
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	bne _022FC0A8
	bl IsDestinationFloorWithMonster
	cmp r0, #0
	beq _022FC0A8
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	bne _022FC088
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _022FC0A8
_022FC088:
	add r0, sp, #8
	bl GetOutlawSpawnData
	add r0, sp, #0x16
	ldrsh r1, [sp, #0xc]
	ldrsh r2, [sp, #8]
	add r0, r0, r4, lsl #3
	bl SetMonsterLevelAndId
	add r4, r4, #1
_022FC0A8:
	cmp r4, #0x40
	bge _022FC0E0
	ldr r0, _022FC230 ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x700
	ldrsh r1, [r0, #0xa8]
	cmp r1, #0
	beq _022FC0E0
	ldrb r1, [r2, #0x7aa]
	ldrsh r2, [r0, #0xa8]
	add r3, sp, #0x16
	add r0, r3, r4, lsl #3
	bl SetMonsterLevelAndId
	add r4, r4, #1
_022FC0E0:
	mov r2, #0
	ldr r1, _022FC230 ; =DUNGEON_PTR
	mov sl, r2
_022FC0EC:
	ldr r0, [r1]
	add r0, r0, r2
	add r0, r0, #0x3000
	add r2, r2, #1
	strb sl, [r0, #0xb74 + INIT_ENEMY_SPAWN_STATS_OFFSET]
	cmp r2, #0x258
	blt _022FC0EC
	mvn r0, #0
	mov r5, #1
	str r0, [sp]
	b _022FC1E8
_022FC118:
	ldr r6, [sp]
	mov r8, #0
	mov r7, r6
	b _022FC194
_022FC128:
	add r0, sp, #0x16
	add sb, r0, r8, lsl #3
	mov r0, sb
	bl GetMonsterIdFromSpawnEntry
	mov fp, r0
	mov r0, sb
	bl GetMonsterLevelFromSpawnEntry
	str r0, [sp, #4]
	mov r0, fp
	mov r1, #0x258
	bl _s32_div_f
	ldr r0, _022FC230 ; =DUNGEON_PTR
	mov r1, r1, lsl #0x10
	ldr r0, [r0]
	mov sb, r1, asr #0x10
	add r0, r0, r1, asr #16
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xb74 + INIT_ENEMY_SPAWN_STATS_OFFSET]
	cmp r0, #0
	bne _022FC190
	ldr r1, [sp, #4]
	mov r0, sb
	bl GetExp
	cmp r7, r0
	movlt r7, r0
	movlt r6, sb
_022FC190:
	add r8, r8, #1
_022FC194:
	cmp r8, r4
	blt _022FC128
	cmp r6, #0
	blt _022FC1F0
	cmp r5, #0x100
	ble _022FC1C8
	ldr r0, _022FC230 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r6
	add r1, r0, #0x3000
	mov r0, #1
	strb r0, [r1, #0xb74 + INIT_ENEMY_SPAWN_STATS_OFFSET]
	b _022FC1E4
_022FC1C8:
	ldr r0, _022FC230 ; =DUNGEON_PTR
	rsb r1, r5, #0x100
	ldr r0, [r0]
	add r5, r5, #2
	add r0, r0, r6
	add r0, r0, #0x3000
	strb r1, [r0, #0xb74 + INIT_ENEMY_SPAWN_STATS_OFFSET]
_022FC1E4:
	add sl, sl, #1
_022FC1E8:
	cmp sl, r4
	blt _022FC118
_022FC1F0:
	ldr r1, _022FC230 ; =DUNGEON_PTR
	mov r4, #0
	mov r2, #1
_022FC1FC:
	ldr r0, [r1]
	add r0, r0, r4
	add r0, r0, #0x3000
	ldrb r3, [r0, #0xb74 + INIT_ENEMY_SPAWN_STATS_OFFSET]
	add r4, r4, #1
	cmp r3, #0
	streqb r2, [r0, #0xb74 + INIT_ENEMY_SPAWN_STATS_OFFSET]
	cmp r4, #0x258
	blt _022FC1FC
	bl ov29_022FBF30
	bl DungeonRngSetPrimary
	add sp, sp, #0x218
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC230: .word DUNGEON_PTR
	arm_func_end InitEnemySpawnStats

	arm_func_start InitEnemyStatsAndMoves
InitEnemyStatsAndMoves: ; 0x022FC234
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldrsh r0, [sp, #0x30]
	mov sb, r1
	mov r1, #0x258
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x34]
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	ldr r2, _022FC464 ; =DUNGEON_PTR
	mov r4, r0, asr #0x10
	ldr r1, [r2]
	mov fp, #0
#ifdef JAPAN
	add r0, r1, #0xa4
#else
	add r0, r1, #0xf4
#endif
	add r5, r0, #0x3400
	mov r3, r5
	mov r0, #0x12
	b _022FC314
_022FC284:
	mul r2, fp, r0
	ldrsh r1, [r3, r2]
	add r5, r3, r2
	cmp r1, #0
	beq _022FC31C
	cmp r1, r4
	ldreqsh r1, [r5, #2]
	cmpeq r1, r6
	bne _022FC310
	mov r1, r4
	mov r2, r6
	add r0, r5, #4
	bl GetMonsterMoves
	mov r4, #0
_022FC2BC:
	add r0, r5, r4, lsl #1
	ldrh r1, [r0, #4]
	add r0, sl, r4, lsl #3
	bl InitMoveCheckId
	add r4, r4, #1
	cmp r4, #4
	blt _022FC2BC
	ldrsh r0, [r5, #0xc]
	mov r2, #0
	strh r0, [sb]
_022FC2E4:
	add r1, r5, r2
	ldrb r0, [r1, #0xe]
	strb r0, [r8, r2]
	ldrb r0, [r1, #0x10]
	strb r0, [r7, r2]
	add r2, r2, #1
	cmp r2, #2
	blt _022FC2E4
	mov r0, #0
	strb r0, [sl, #0x20]
	b _022FC45C
_022FC310:
	add fp, fp, #1
_022FC314:
	cmp fp, #0x40
	blt _022FC284
_022FC31C:
	cmp fp, #0x40
	bne _022FC3A4
	add r0, sp, #0
	mov r1, r4
	mov r2, r6
	bl GetMonsterMoves
	mov r5, #0
	add fp, sp, #0
_022FC33C:
	mov r0, r5, lsl #1
	ldrh r1, [fp, r0]
	add r0, sl, r5, lsl #3
	bl InitMoveCheckId
	add r5, r5, #1
	cmp r5, #4
	blt _022FC33C
	mov r0, r4
	mov r1, r6
	bl GetMaxHpAtLevel
	strh r0, [sb]
	mov r5, #0
_022FC36C:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl GetOffensiveStatAtLevel
	strb r0, [r8, r5]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl GetDefensiveStatAtLevel
	strb r0, [r7, r5]
	add r5, r5, #1
	cmp r5, #2
	blt _022FC36C
	b _022FC454
_022FC3A4:
	strh r4, [r5]
	mov r1, r4
	mov r2, r6
	strh r6, [r5, #2]
	add r0, r5, #4
	bl GetMonsterMoves
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetMaxHpAtLevel
	strh r0, [r5, #0xc]
	mov r6, #0
_022FC3D0:
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r6
	add r4, r5, r6
	bl GetOffensiveStatAtLevel
	strb r0, [r4, #0xe]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r6
	bl GetDefensiveStatAtLevel
	add r6, r6, #1
	strb r0, [r4, #0x10]
	cmp r6, #2
	blt _022FC3D0
	mov r4, #0
_022FC40C:
	add r0, r5, r4, lsl #1
	ldrh r1, [r0, #4]
	add r0, sl, r4, lsl #3
	bl InitMoveCheckId
	add r4, r4, #1
	cmp r4, #4
	blt _022FC40C
	ldrsh r0, [r5, #0xc]
	mov r2, #0
	strh r0, [sb]
_022FC434:
	add r1, r5, r2
	ldrb r0, [r1, #0xe]
	strb r0, [r8, r2]
	ldrb r0, [r1, #0x10]
	strb r0, [r7, r2]
	add r2, r2, #1
	cmp r2, #2
	blt _022FC434
_022FC454:
	mov r0, #0
	strb r0, [sl, #0x20]
_022FC45C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC464: .word DUNGEON_PTR
	arm_func_end InitEnemyStatsAndMoves

	arm_func_start ov29_022FC468
ov29_022FC468: ; 0x022FC468
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, [sp, #0x24]
	mov sb, r0
	cmp r4, #0xb
	mov r0, #0
	cmp r4, #0xc
	moveq r0, #1
	cmp r4, #0xd
	moveq r0, #2
	cmp r4, #0xe
	moveq r0, #3
	mov r8, r1
	mov r7, r2
	mov r6, r3
	ldr r5, [sp, #0x20]
	bl GetExplorerMazeMonster
	mov r4, r0
	mov r0, sb
	add r1, r4, #0x22
	bl GroundToDungeonMoveset
	ldrsh r0, [r4, #0xa]
	mov r2, #0
	strh r0, [r8]
_022FC4C4:
	add r1, r4, r2
	ldrb r0, [r1, #0xc]
	strb r0, [r7, r2]
	ldrb r0, [r1, #0xe]
	strb r0, [r6, r2]
	add r2, r2, #1
	cmp r2, #2
	blt _022FC4C4
	ldrsh r1, [r4, #8]
	ldr r0, _022FC508 ; =IQ_SKILLS
	ldr r0, [r0, #0x20]
	strh r1, [r5]
	cmp r1, r0
	strlth r0, [r5]
	mov r0, #0
	strb r0, [sb, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC508: .word IQ_SKILLS
	arm_func_end ov29_022FC468

	arm_func_start SpawnTeam
SpawnTeam: ; 0x022FC50C
#ifdef JAPAN
#define SPAWN_TEAM_OFFSET -0xA4
#else
#define SPAWN_TEAM_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	mov sl, r0
	mov r0, #0
	bl DungeonRngSetSecondary
	ldr r0, _022FC98C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe0 + SPAWN_TEAM_OFFSET]
	ldrsh r1, [r1, #0xe2 + SPAWN_TEAM_OFFSET]
	bl GetTile
	ldrb fp, [r0, #7]
	mov r4, #0
_022FC540:
	mov r0, r4
	bl GetActiveTeamMember
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	strh r4, [r0, #0xa]
	mov r4, r1, asr #0x10
	cmp r4, #4
	blt _022FC540
	mov r7, #0
	mov r6, #1
	mov r8, r7
	mov r5, r7
	mov sb, r6
	add r4, sp, #0x34
_022FC578:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r2, r6
	moveq r2, r5
	tst r2, #0xff
	beq _022FC5B0
	tst r1, #2
	movne r1, sb
	moveq r1, #0
	tst r1, #0xff
	strne r0, [r4, r7, lsl #2]
	addne r7, r7, #1
_022FC5B0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FC578
	mov r1, #0
	add r0, sp, #0x34
	b _022FC5D8
_022FC5D0:
	str r1, [r0, r7, lsl #2]
	add r7, r7, #1
_022FC5D8:
	cmp r7, #4
	blt _022FC5D0
	mov r8, #0
	mov r7, r8
	mov r3, r8
	mov r4, #1
	mov r2, r8
	add r5, sp, #0x34
	add r1, sp, #0x24
_022FC5FC:
	ldr r6, [r5, r7, lsl #2]
	cmp r6, #0
	beq _022FC628
	ldrb r0, [r6, #1]
	cmp r0, #0
	movne r0, r4
	moveq r0, r3
	tst r0, #0xff
	strne r6, [r1, r8, lsl #2]
	strne r2, [r5, r7, lsl #2]
	addne r8, r8, #1
_022FC628:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FC5FC
	ldr r0, _022FC98C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _022FC698
	mov r7, #0
	mov r4, r7
	add r5, sp, #0x34
	add sb, sp, #0x24
_022FC660:
	ldr r6, [r5, r7, lsl #2]
	cmp r6, #0
	beq _022FC684
	ldrb r0, [r6, #3]
	bl JoinedAtRangeCheck2Veneer
	cmp r0, #0
	strne r6, [sb, r8, lsl #2]
	strne r4, [r5, r7, lsl #2]
	addne r8, r8, #1
_022FC684:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FC660
_022FC698:
	mov r4, #0
	mov r2, r4
	add r1, sp, #0x24
	add r3, sp, #0x34
_022FC6A8:
	ldr r0, [r3, r4, lsl #2]
	cmp r0, #0
	strne r0, [r1, r8, lsl #2]
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	strne r2, [r3, r4, lsl #2]
	mov r4, r0, asr #0x10
	addne r8, r8, #1
	cmp r4, #4
	blt _022FC6A8
	mov r1, #0
	add r0, sp, #0x24
	b _022FC6E4
_022FC6DC:
	str r1, [r0, r8, lsl #2]
	add r8, r8, #1
_022FC6E4:
	cmp r8, #4
	blt _022FC6DC
	mov sb, #0
_022FC6F0:
	add r0, sp, #0x24
	ldr r5, [r0, sb, lsl #2]
	mov r6, #0
	cmp r5, #0
	beq _022FC8BC
	ldrsh r1, [r5, #0xc]
	sub r0, r1, #0x17c
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	ldrls r0, _022FC990 ; =0x0000017B
	strlsh r0, [r5, #0xc]
	bls _022FC74C
	sub r0, r1, #0x3d4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	ldrls r0, _022FC994 ; =0x000003D3
	strlsh r0, [r5, #0xc]
_022FC74C:
	mov r4, #0
_022FC750:
	ldr r0, _022FC998 ; =ov29_02351E28
	mov r1, r4, lsl #2
	ldrh r1, [r0, r1]
	add r0, r0, r4, lsl #2
	ldrh r0, [r0, #2]
	strh r1, [sp, #0x1e]
	ldrsh r8, [sp, #0x1e]
	strh r0, [sp, #0x20]
	cmp r8, #0x63
	beq _022FC808
	ldr r0, _022FC98C ; =DUNGEON_PTR
	ldrsh r7, [sp, #0x20]
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xe2 + SPAWN_TEAM_OFFSET]
	ldrsh r2, [r0, #0xe0 + SPAWN_TEAM_OFFSET]
	add r1, r7, r1
	add r0, r8, r2
	bl GetTile
	mov r1, r0
	ldrb r0, [r1, #7]
	cmp r0, fp
	bne _022FC800
	ldrsh r0, [r5, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FC800
	ldr r0, _022FC98C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	mov r0, #1
	str r1, [sp]
	stmib sp, {r0, r1, sl}
	str r1, [sp, #0x10]
	add r0, r2, #0xcc00
	ldrsh r1, [r0, #0xe0 + SPAWN_TEAM_OFFSET]
	ldrsh r2, [r0, #0xe2 + SPAWN_TEAM_OFFSET]
	ldrsh r0, [r5, #0xc]
	mov r3, r5
	add r1, r8, r1
	add r2, r7, r2
	bl InitTeamMember
	mov r6, #1
	b _022FC808
_022FC800:
	add r4, r4, #1
	b _022FC750
_022FC808:
	cmp r6, #0
	bne _022FC8BC
	ldr r8, _022FC998 ; =ov29_02351E28
	mov r7, #0
_022FC818:
	mov r0, r7, lsl #2
	ldrh r1, [r8, r0]
	add r0, r8, r7, lsl #2
	ldrh r0, [r0, #2]
	strh r1, [sp, #0x14]
	ldrsh r6, [sp, #0x14]
	strh r0, [sp, #0x16]
	cmp r6, #0x63
	beq _022FC8BC
	ldr r0, _022FC98C ; =DUNGEON_PTR
	ldrsh r4, [sp, #0x16]
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xe2 + SPAWN_TEAM_OFFSET]
	ldrsh r2, [r0, #0xe0 + SPAWN_TEAM_OFFSET]
	add r1, r4, r1
	add r0, r6, r2
	bl GetTile
	mov r1, r0
	ldrsh r0, [r5, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FC8B4
	ldr r0, _022FC98C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	mov r0, #1
	str r1, [sp]
	stmib sp, {r0, r1, sl}
	str r1, [sp, #0x10]
	add r0, r2, #0xcc00
	ldrsh r1, [r0, #0xe0 + SPAWN_TEAM_OFFSET]
	ldrsh r2, [r0, #0xe2 + SPAWN_TEAM_OFFSET]
	ldrsh r0, [r5, #0xc]
	mov r3, r5
	add r1, r6, r1
	add r2, r4, r2
	bl InitTeamMember
	b _022FC8BC
_022FC8B4:
	add r7, r7, #1
	b _022FC818
_022FC8BC:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _022FC6F0
	bl ov29_022FCD04
	mov r2, #0
#ifdef JAPAN
	mov sb, r2
#else
	mov r8, r2
#endif
	add r1, sp, #0x18
_022FC8E0:
	add r0, r2, #1
	mov r0, r0, lsl #0x10
#ifdef JAPAN
	strb sb, [r1, r2]
#else
	strb r8, [r1, r2]
#endif
	mov r2, r0, asr #0x10
	cmp r2, #5
	blt _022FC8E0
#ifdef JAPAN
	ldr r5, _022FC98C ; =DUNGEON_PTR
	mov r7, #0
	mov r8, #1
	add r6, sp, #0x18
	mov r4, #0x23c
_022FC908:
	ldr r0, [r5]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xa84]
#else
	ldr r4, _022FC98C ; =DUNGEON_PTR
	mov r6, #0
	mov r7, #1
	add r5, sp, #0x18
_022FC908:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
#endif
	bl EntityIsValid__022FC99C
	cmp r0, #0
	beq _022FC964
#ifdef JAPAN
	mul r1, sb, r4
	ldr r0, [r5]
	add r0, r0, #0x56
	add r2, r0, #0x800
	ldrb r0, [r2, r1]
	add r2, r2, r1
	tst r0, #1
	movne r0, r8
	moveq r0, r7
#else
	ldr r0, [r4]
	add r1, r8, r8, lsl #3
	add r0, r0, #0x56
	add r2, r0, #0x800
	ldrb r0, [r2, r1, lsl #6]
	add r2, r2, r1, lsl #6
	tst r0, #1
	movne r0, r7
	moveq r0, r6
#endif
	tst r0, #0xff
	ldrneb r1, [r2, #1]
	cmpne r1, #0
#ifdef JAPAN
	addne r0, sb, #1
	andne r0, r0, #0xff
	strneb r0, [r6, r1]
	strneb r0, [r2, #1]
_022FC964:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
#else
	addne r0, r8, #1
	andne r0, r0, #0xff
	strneb r0, [r5, r1]
	strneb r0, [r2, #1]
_022FC964:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
#endif
	blt _022FC908
	add r0, sp, #0x18
	bl sub_0200F9B4
	bl DungeonRngSetPrimary
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC98C: .word DUNGEON_PTR
_022FC990: .word 0x0000017B
_022FC994: .word 0x000003D3
_022FC998: .word ov29_02351E28
	arm_func_end SpawnTeam
