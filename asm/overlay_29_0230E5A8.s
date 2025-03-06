	.include "asm/macros.inc"
	.include "overlay_29_0230E5A8.inc"

	.text

	arm_func_start ov29_0230E5A8
ov29_0230E5A8: ; 0x0230E5A8
	stmdb sp!, {r4, lr}
	ldr r4, [r1, #0xb4]
	mov r1, r2
	ldrsh r0, [r4, #2]
	mov r2, r3
	mov r3, #1
	bl ov29_022FD318
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #2]
	bl ov29_022FBC94
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_02056830
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0230E5A8

	arm_func_start ov29_0230E5FC
ov29_0230E5FC: ; 0x0230E5FC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x44
	mov r5, r0
	mov r4, r1
	add r0, sp, #0
	mov r1, r5
	bl sub_020534BC
	mov r1, #0
	sub r0, r1, #1
	strb r1, [sp, #6]
	strb r1, [sp, #7]
	cmp r4, r0
	bne _0230E640
	add r0, sp, #0
	bl sub_02055CCC
	mov r4, r0
	b _0230E64C
_0230E640:
	ldrsh r0, [r5, #8]
	add r1, sp, #0
	bl sub_02055D7C
_0230E64C:
	mov r0, r4
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_0230E5FC

	arm_func_start ov29_0230E658
ov29_0230E658: ; 0x0230E658
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	mov r0, r4
	bl StringFromId
	mov r4, r0
	bl ov29_0234B034
	mov r2, r4
	str r0, [sp]
	mov r0, r5
	mov r1, #0x400
	mov r3, r1
	bl PreprocessString
	mov r0, r5
	bl ov29_0234BB50
	bl ov29_0234B034
	mov r1, r0
	mov r0, r5
	mov r2, #1
	str r2, [sp]
	mov r2, #0
	mov r3, r2
	bl ov29_0234D6C8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0230E658

	arm_func_start TrySpawnMonsterAndTickSpawnCounter
TrySpawnMonsterAndTickSpawnCounter: ; 0x0230E6BC
#ifdef JAPAN
#define TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET -0xA4
#else
#define TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r0, _0230E8D8 ; =DUNGEON_PTR
	mov r6, #0
	ldr r7, [r0]
	add r0, r7, #0x700
	ldrsh r1, [r0, #0x86]
	cmp r1, #0
	beq _0230E8D0
	ldrsh r1, [r0, #0x82]
	add r1, r1, #1
	strh r1, [r0, #0x82]
	ldrb r1, [r7, #0x790]
	cmp r1, #0
	bne _0230E710
	ldr r1, _0230E8DC ; =SPAWN_COOLDOWN
	ldrsh r2, [r0, #0x82]
	ldrsh r0, [r1]
	cmp r2, r0
	bge _0230E724
	b _0230E8D0
_0230E710:
	ldr r1, _0230E8E0 ; =SPAWN_COOLDOWN_THIEF_ALERT
	ldrsh r2, [r0, #0x82]
	ldrsh r0, [r1]
	cmp r2, r0
	blt _0230E8D0
_0230E724:
	cmp r2, #0x384
	ble _0230E76C
	add r0, r7, #0x19000
	ldr r4, [r0, #0x908 + TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET]
	mov r0, r4
	bl EntityIsValid__0230E8F0
	cmp r0, #0
	beq _0230E76C
	add r0, r7, #0x19000
	ldrh r1, [r4, #0x26]
	ldr r0, [r0, #0x910 + TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET]
	cmp r1, r0
	bne _0230E76C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r6, r4
_0230E76C:
	mov r5, #0
	add r0, r7, #0x700
	strh r5, [r0, #0x82]
	add r0, r7, #0x19000
	mov r4, r5
	str r5, [r0, #0x908 + TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET]
_0230E784:
	add r0, r7, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb38 + TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET]
	mov r0, r8
	bl EntityIsValid__0230E8F0
	cmp r0, #0
	beq _0230E7B8
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x100
	addeq r5, r5, #1
_0230E7B8:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0230E784
	ldrb r0, [r7, #0x790]
	cmp r0, #0
	bne _0230E80C
	ldr r0, _0230E8D8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xc9 + TRY_SPAWN_MONSTER_AND_TICK_SPAWN_COUNTER_OFFSET]
	cmp r0, #0xff
	bne _0230E7FC
	ldr r0, _0230E8E4 ; =SPAWN_CAP_NO_MONSTER_HOUSE
	ldrsh r0, [r0]
	cmp r5, r0
	blt _0230E80C
	b _0230E8D0
_0230E7FC:
	ldr r0, _0230E8E8 ; =SPAWN_CAP_WITH_MONSTER_HOUSE
	ldrsh r0, [r0]
	cmp r5, r0
	bge _0230E8D0
_0230E80C:
	cmp r6, #0
	beq _0230E828
	ldr r1, _0230E8EC ; =0x00000C5D
	mov r0, #0
	bl LogMessageByIdWithPopup
	mov r0, r6
	bl ov29_022E62F0
_0230E828:
	ldrb r0, [r7, #0x790]
	cmp r0, #0
	beq _0230E83C
	bl GetKecleonIdToSpawnByFloor
	b _0230E844
_0230E83C:
	mov r0, #0
	bl GetMonsterIdToSpawn
_0230E844:
	mov r5, r0
	mov r0, r5
	bl GetMonsterLevelToSpawn
	movs r4, r0
	mov r0, r5
	mov r1, #0
	moveq r4, #1
	bl MewSpawnCheck
	cmp r0, #0
	beq _0230E8D0
	add r0, sp, #0xa
	mov r1, #0
	bl GetRandomTile
	cmp r0, #0
	beq _0230E8D0
	mov r1, #0
	mov r0, #0x64
	strh r5, [sp]
	strh r4, [sp, #8]
	strb r1, [sp, #2]
	bl DungeonRandInt
	ldr r1, _0230E8D8 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl GetRandomMovementChance
	cmp r4, r0
	movlt r0, #1
	strlt r0, [sp, #4]
	movge r0, #0
	strge r0, [sp, #4]
	mov r1, #0
	add r0, sp, #0
	strb r1, [sp, #0xe]
	bl SpawnMonster
_0230E8D0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0230E8D8: .word DUNGEON_PTR
_0230E8DC: .word SPAWN_COOLDOWN
_0230E8E0: .word SPAWN_COOLDOWN_THIEF_ALERT
_0230E8E4: .word SPAWN_CAP_NO_MONSTER_HOUSE
_0230E8E8: .word SPAWN_CAP_WITH_MONSTER_HOUSE
#ifdef JAPAN
_0230E8EC: .word 0x0000099C
#else
_0230E8EC: .word 0x00000C5D
#endif
	arm_func_end TrySpawnMonsterAndTickSpawnCounter
