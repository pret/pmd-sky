	.include "asm/macros.inc"
	.include "overlay_29_022EC62C.inc"

	.text

; https://decomp.me/scratch/y7m40
	arm_func_start ov29_022EC62C
ov29_022EC62C: ; 0x022EC62C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	bl GetLeader
	cmp r6, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r7, _022EC6D8 ; =DUNGEON_PTR
	ldr r1, [r7]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	strb r4, [r1, #0x10]
	mov sb, r4
	mov r8, r4
	b _022EC6CC
_022EC668:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xad4]
#else
	ldr r5, [r0, #0xb78]
#endif
	mov r0, r5
	bl EntityIsValid__022EC608
	cmp r0, #0
	cmpne r6, r5
	beq _022EC6C8
	ldr r0, [r5, #0xb4]
	ldrh r0, [r0]
	tst r0, #0x8000
	beq _022EC6C8
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	mov r1, sb
	bl RunMonsterAi
	mov r0, r5
	bl ExecuteMonsterAction
	bl IsFloorOver2
	mov r0, r8
	bl TryForcedLoss
_022EC6C8:
	add r4, r4, #1
_022EC6CC:
	cmp r4, #0x14
	blt _022EC668
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022EC6D8: .word DUNGEON_PTR
	arm_func_end ov29_022EC62C

	arm_func_start TrySpawnMonsterAndActivatePlusMinus
TrySpawnMonsterAndActivatePlusMinus: ; 0x022EC6DC
#ifdef JAPAN
#define TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET -0xA4
#else
#define TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _022EC7E0 ; =DUNGEON_PTR
	ldr r1, _022EC7E4 ; =ov29_023522B6
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x80]
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl TrySpawnMonsterAndTickSpawnCounter
	ldr r4, _022EC7E0 ; =DUNGEON_PTR
	mov r8, #0
	ldr r0, [r4]
	mov fp, #1
	add r0, r0, #0x3000
	strb r8, [r0, #0xe34 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
	ldr r0, [r4]
	mov r7, r8
	add r0, r0, #0x3000
	strb r8, [r0, #0xe35 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
	ldr r0, [r4]
	mov r6, fp
	add r0, r0, #0x3000
	strb r8, [r0, #0xe36 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
	ldr r0, [r4]
	mov r5, fp
	add r0, r0, #0x3000
	strb r8, [r0, #0xe37 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
_022EC750:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
	mov r0, sb
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC7C8
	ldr r0, [sb, #0xb4]
	mov r1, #0x3f
#ifdef JAPAN
	strb r7, [r0, #0x14e]
#else
	strb r7, [r0, #0x152]
#endif
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq sl, fp
	mov r0, sb
	movne sl, r7
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	mov r1, #0x38
	addne r0, r0, sl
	addne r0, r0, #0x3000
	strneb r6, [r0, #0xe36 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
	mov r0, sb
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	addne r0, r0, sl
	addne r0, r0, #0x3000
	strneb r5, [r0, #0xe34 + TRY_SPAWN_MONSTER_AND_ACTIVATE_PLUS_MINUS_OFFSET]
_022EC7C8:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022EC750
	mov r0, #0
	bl TryForcedLoss
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC7E0: .word DUNGEON_PTR
_022EC7E4: .word ov29_023522B6
	arm_func_end TrySpawnMonsterAndActivatePlusMinus
