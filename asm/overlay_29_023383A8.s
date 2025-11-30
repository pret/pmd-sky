	.include "asm/macros.inc"
	.include "overlay_29_023383A8.inc"

	.text

	arm_func_start RevealAttackedTile
RevealAttackedTile: ; 0x02338430
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #1
	bl TryRevealAttackedTrap
	mov r0, r4
	bl PositionIsOnHiddenStairs
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #1
	bl HiddenStairsTrigger
	ldmia sp!, {r4, pc}
	arm_func_end RevealAttackedTile

	arm_func_start ov29_0233845C
ov29_0233845C: ; 0x0233845C
	ldr r1, _02338474 ; =DUNGEON_PTR
	ldr r0, _02338478 ; =0x00012AFE
	ldr r1, [r1]
	mov r2, #0
	strh r2, [r1, r0]
	bx lr
	.align 2, 0
_02338474: .word DUNGEON_PTR
#ifdef JAPAN
_02338478: .word 0x00012A5A
#else
_02338478: .word 0x00012AFE
#endif
	arm_func_end ov29_0233845C

	arm_func_start ov29_0233847C
ov29_0233847C: ; 0x0233847C
	stmdb sp!, {r4, lr}
	ldr r1, _023384B8 ; =DUNGEON_PTR
	ldr r0, _023384BC ; =0x00012AFE
	ldr r3, [r1]
	ldrsh r2, [r3, r0]
	add r2, r2, #1
	strh r2, [r3, r0]
	ldr r1, [r1]
	ldrsh r4, [r1, r0]
	bl GetVictoriesOnOneFloor
	cmp r4, r0
	ldmleia sp!, {r4, pc}
	mov r0, r4
	bl SetVictoriesOnOneFloor
	ldmia sp!, {r4, pc}
	.align 2, 0
_023384B8: .word DUNGEON_PTR
#ifdef JAPAN
_023384BC: .word 0x00012A5A
#else
_023384BC: .word 0x00012AFE
#endif
	arm_func_end ov29_0233847C
