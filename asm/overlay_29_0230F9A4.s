	.include "asm/macros.inc"
	.include "overlay_29_0230F9A4.inc"

	.text

	arm_func_start ov29_0230F9A4
ov29_0230F9A4: ; 0x0230F9A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__0230F980
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_0234908C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0230F9A4

	arm_func_start TrySpawnEnemyItemDrop
TrySpawnEnemyItemDrop: ; 0x0230F9D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _0230FB28 ; =DUNGEON_PTR
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	ldrb r0, [r0, #0x748]
	bl TreasureBoxDropsEnabled
	cmp r0, #0
	ldrne r4, [r5, #0xb4]
	ldrneb r0, [r4, #6]
	cmpne r0, #0
	beq _0230FB20
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #1
	bne _0230FA54
	mov r0, r6
	mov r1, #0x43
	bl IqSkillIsEnabled
	cmp r0, #0
	addne r0, r7, #1
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	mov r0, r6
	mov r1, #0x56
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	addne r0, r7, #1
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
_0230FA54:
	ldrsh r1, [r4, #2]
	add r0, sp, #0
	mov r2, r7
	bl TryGenerateUnownStoneDrop
	cmp r0, #0
	beq _0230FA84
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
	b _0230FB20
_0230FA84:
	mov r0, r6
	mov r1, #0x75
	bl AbilityIsActiveVeneer
	mov r2, r0
	add r0, sp, #0
	mov r1, r5
	mov r3, r7
	bl ov29_023460DC
	cmp r0, #0
	beq _0230FAC4
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
	b _0230FB20
_0230FAC4:
	mov r0, r6
	bl IsMonster__0230F980
	cmp r0, #0
	beq _0230FB20
	mov r0, r6
	mov r1, #0x62
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	beq _0230FB20
	ldr r0, _0230FB2C ; =ov10_022C4650
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230FB20
	add r0, sp, #0
	mov r1, #0xb7
	mov r2, #2
	bl GenerateStandardItem
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
_0230FB20:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230FB28: .word DUNGEON_PTR
_0230FB2C: .word ov10_022C4650
	arm_func_end TrySpawnEnemyItemDrop

	arm_func_start ov29_0230FB30
ov29_0230FB30: ; 0x0230FB30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230FB88 ; =ov29_023529A8
	mov r5, r0
	ldrh r2, [r1]
	add r0, sp, #0
	strh r2, [sp]
	ldrh r1, [r1, #2]
	strh r1, [sp, #2]
	bl ov29_02347184
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0230FB8C ; =0x00000F62
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FB88: .word ov29_023529A8
#ifdef JAPAN
_0230FB8C: .word 0x000009B6
#else
_0230FB8C: .word 0x00000F62
#endif
	arm_func_end ov29_0230FB30

	arm_func_start TickNoSlipCap
TickNoSlipCap: ; 0x0230FB90
#ifdef JAPAN
#define TICK_NO_SLIP_CAP_OFFSET -1
#else
#define TICK_NO_SLIP_CAP_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0230FBB8
	mov r0, r5
	mov r1, #0xd
	bl HasHeldItem
_0230FBB8:
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	add r1, r0, #1
	and r0, r1, #0xff
	cmp r0, #0x14
	strb r1, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	movhs r0, #0x13
	strhsb r0, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	mov r0, #0x64
	bl DungeonRandInt
	ldrb r2, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	ldr r1, _0230FC20 ; =ov10_022C4BE4
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	cmp r0, r1
	ldmgeia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ov29_0230FB30
	mov r0, #0
	strb r0, [r4, #0x107 + TICK_NO_SLIP_CAP_OFFSET]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FC20: .word ov10_022C4BE4
	arm_func_end TickNoSlipCap
