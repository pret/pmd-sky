	.include "asm/macros.inc"
	.include "overlay_29_02307F4C.inc"

	.text

	arm_func_start TryTriggerMonsterHouse
TryTriggerMonsterHouse: ; 0x02307F4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1a0
	mov r4, r0
	mov r5, r1
	bl EntityIsValid__02307EF8
	cmp r0, #0
	beq _02308268
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _02308268
	mov r0, r4
	bl GetTileAtEntity
	ldrh r0, [r0]
	tst r0, #0x40
	beq _02308268
	ldr r0, _02308270 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #0x793]
	cmp r1, #0
	bne _02308268
	mov r1, #1
	strb r1, [r2, #0x793]
	ldr r1, [r0]
	add r0, r1, #0x4000
#ifdef JAPAN
	ldrb r2, [r0, #0x25]
	cmp r2, #0xff
	beq _02308268
	add r0, r1, #0x244
#else
	ldrb r2, [r0, #0xc9]
	cmp r2, #0xff
	beq _02308268
	add r0, r1, #0x2e8
#endif
	add r1, r0, #0xec00
	mov r0, #0x1c
	mla r1, r2, r0, r1
	cmp r5, #0
	mov r5, #0
	beq _02308064
	ldrsh r0, [r4, #6]
	add r7, sp, #0x10
	sub sb, r0, #4
	b _02308050
_02307FE8:
	ldrsh r0, [r4, #4]
	sub r8, r0, #4
	mov r0, sb, lsl #0x10
	mov r6, r0, asr #0x10
	b _0230803C
_02307FFC:
	mov r0, r8
	mov r1, sb
	bl GetTileSafe
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldreqh r0, [r0]
	andeq r0, r0, #3
	cmpeq r0, #1
	bne _02308038
	cmp r5, #0x64
	movlt r1, r5, lsl #2
	addlt r0, r7, r5, lsl #2
	strlth r8, [r7, r1]
	strlth r6, [r0, #2]
	addlt r5, r5, #1
_02308038:
	add r8, r8, #1
_0230803C:
	ldrsh r0, [r4, #4]
	add r0, r0, #4
	cmp r8, r0
	ble _02307FFC
	add sb, sb, #1
_02308050:
	ldrsh r0, [r4, #6]
	add r0, r0, #4
	cmp sb, r0
	ble _02307FE8
	b _02308124
_02308064:
	ldrsh r2, [r4, #4]
	ldrsh r0, [r1, #2]
	add fp, sp, #0x10
	sub r7, r2, #4
	cmp r7, r0
	movle r7, r0
	add r8, r2, #5
	ldrsh r2, [r4, #6]
	ldrsh r0, [r1, #6]
	sub sb, r2, #4
	cmp r8, r0
	movge r8, r0
	ldrsh r0, [r1, #4]
	add sl, r2, #5
	cmp sb, r0
	movle sb, r0
	ldrsh r0, [r1, #8]
	cmp sl, r0
	movge sl, r0
	b _0230811C
_023080B4:
	mov r0, sb, lsl #0x10
	mov r6, r7
	mov r4, r0, asr #0x10
	b _02308110
_023080C4:
	mov r0, r6
	mov r1, sb
	bl GetTileSafe
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldreqh r1, [r0]
	andeq r1, r1, #3
	cmpeq r1, #1
	bne _0230810C
	ldrh r0, [r0]
	tst r0, #0x40
	beq _0230810C
	cmp r5, #0x64
	movlt r1, r5, lsl #2
	addlt r0, fp, r5, lsl #2
	strlth r6, [fp, r1]
	strlth r4, [r0, #2]
	addlt r5, r5, #1
_0230810C:
	add r6, r6, #1
_02308110:
	cmp r6, r8
	blt _023080C4
	add sb, sb, #1
_0230811C:
	cmp sb, sl
	blt _023080B4
_02308124:
	ldr r0, _02308274 ; =ov10_022C4560
	ldr r1, _02308278 ; =MONSTER_HOUSE_MAX_MONSTER_SPAWNS
	ldrsh r0, [r0]
	ldrsh r1, [r1]
	bl DungeonRandRange
	mov r6, r0
	cmp r6, r5
	movge r6, r5
	mov r8, #0
	b _02308258
_0230814C:
	mov r0, r5
	bl DungeonRandInt
	mov r3, #0
	mov r4, r0
	add r2, sp, #0x10
	mov r0, r3
	b _02308188
_02308168:
	mov r1, r4, lsl #2
	ldrsh r1, [r2, r1]
	cmp r1, #0
	bne _02308190
	add r4, r4, #1
	cmp r4, r5
	movge r4, r0
	add r3, r3, #1
_02308188:
	cmp r3, r5
	blt _02308168
_02308190:
	add r0, sp, #0x10
	mov r1, r4, lsl #2
	ldrsh r7, [r0, r1]
	cmp r7, #0
	beq _02308260
	mov r0, #1
	bl GetMonsterIdToSpawn
	add r1, sp, #0x10
	mov r3, #0
	strh r0, [sp]
	add r0, r1, r4, lsl #2
	ldrsh r2, [r0, #2]
	mov r1, #1
	ldrsh r0, [sp]
	strh r3, [sp, #8]
	strb r3, [sp, #2]
	str r3, [sp, #4]
	strb r1, [sp, #0xe]
	strh r7, [sp, #0xa]
	strh r2, [sp, #0xc]
	bl MewSpawnCheck
	cmp r0, #0
	beq _02308254
	add r0, sp, #0
	mov r1, #0
	bl SpawnMonster
	mov r4, r0
	bl EntityIsValid__02307EF8
	cmp r0, #0
	beq _02308254
	mov r0, #0xc800
	str r0, [r4, #0x1c]
	mov sl, #0
	mov sb, #0xaa
	mov r7, #0x57
	b _02308244
_02308220:
	ldr r0, [r4, #0x1c]
	mov r1, sb
	bl MultiplyByFixedPoint
	str r0, [r4, #0x1c]
	cmp r0, #0x100
	blt _0230824C
	mov r0, r7
	bl AdvanceFrame
	add sl, sl, #1
_02308244:
	cmp sl, #0x64
	blt _02308220
_0230824C:
	mov r0, #0
	str r0, [r4, #0x1c]
_02308254:
	add r8, r8, #1
_02308258:
	cmp r8, r6
	blt _0230814C
_02308260:
	mov r0, #1
	bl AnimationDelayOrSomething
_02308268:
	add sp, sp, #0x1a0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02308270: .word DUNGEON_PTR
_02308274: .word ov10_022C4560
_02308278: .word MONSTER_HOUSE_MAX_MONSTER_SPAWNS
	arm_func_end TryTriggerMonsterHouse
