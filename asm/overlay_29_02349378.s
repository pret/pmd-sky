	.include "asm/macros.inc"
	.include "overlay_29_02349378.inc"

	.text

	arm_func_start ov29_02349378
ov29_02349378: ; 0x02349378
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _023493F4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r6, r0, #0x760
	mov r0, r6
	bl FloorHasMissionMonster
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0xc]
	mov r4, #0
	mov r5, r4
	cmp r0, #0
	beq _023493E0
	bl GetSpriteFileSize
	add r4, r4, r0
	b _023493E0
_023493BC:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	beq _023493D4
	bl GetSpriteFileSize
	add r4, r4, r0
_023493D4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_023493E0:
	ldrsh r0, [r6, #0x14]
	cmp r5, r0
	blt _023493BC
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023493F4: .word DUNGEON_PTR
	arm_func_end ov29_02349378

	arm_func_start LoadMissionMonsterSprites
LoadMissionMonsterSprites: ; 0x023493F8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0234946C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r6, r0, #0x760
	mov r0, r6
	bl FloorHasMissionMonster
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0xc]
	cmp r0, #0
	beq _0234942C
	mov r1, #1
	bl LoadMonsterSprite
_0234942C:
	mov r5, #0
	mov r4, #1
	b _0234945C
_02349438:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	beq _02349450
	mov r1, r4
	bl LoadMonsterSprite
_02349450:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_0234945C:
	ldrsh r0, [r6, #0x14]
	cmp r5, r0
	blt _02349438
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234946C: .word DUNGEON_PTR
	arm_func_end LoadMissionMonsterSprites
