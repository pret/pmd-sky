	.include "asm/macros.inc"
	.include "overlay_29_02301498.inc"

	.text

	arm_func_start IsAtJunction
IsAtJunction: ; 0x02301498
#ifdef JAPAN
#define OV29_02301498_OFFSET -4
#else
#define OV29_02301498_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r1, [r5, #0xb4]
	ldrsh r1, [r1, #2]
	bl GetMobilityTypeCheckSlipAndFloating
#ifdef JAPAN
	mov r4, r0
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _02302A30_JP
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _02302A30_JP
	mov r0, r5
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _02302A30_JP
	mov r0, r5
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _02302A30_JP
	mov r0, r5
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
_02302A30_JP:
#else
	mov r1, r0
	mov r0, r5
	mov r2, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	cmp r4, #3
	bne _023014FC
	ldr r4, [r5, #0xb4]
	mov r0, #0x64
	bl DungeonRandInt
	add r1, r4, #0x200
	ldrsh r2, [r1, #0x12 + OV29_02301498_OFFSET]
	add r0, r2, r0
	strh r0, [r1, #0x12 + OV29_02301498_OFFSET]
	ldrsh r0, [r1, #0x12 + OV29_02301498_OFFSET]
	cmp r0, #0xc8
	mov r0, #0
	strgeh r0, [r1, #0x12 + OV29_02301498_OFFSET]
	movge r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_023014FC:
	ldr r0, _0230158C ; =DUNGEON_PTR
	ldr r1, _02301590 ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	ldrb r0, [r1, r0]
	cmp r0, #1
	cmpeq r4, #1
	bne _02301534
	mov r0, r5
	mov r1, #0x14
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #0
_02301534:
	ldrsh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	bl GetTile
	add r0, r0, r4
	ldrb r0, [r0, #8]
	cmp r0, #0x54
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x51
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x45
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x15
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x55
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230158C: .word DUNGEON_PTR
_02301590: .word SECONDARY_TERRAIN_TYPES
	arm_func_end IsAtJunction
