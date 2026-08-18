	.include "asm/macros.inc"
	.include "overlay_29_0233861C.inc"

	.text

	arm_func_start UpdateShouldBoostHiddenStairsSpawnChance
UpdateShouldBoostHiddenStairsSpawnChance: ; 0x0233861C
	stmdb sp!, {r3, lr}
	ldr r0, _02338658 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x5f
	add r1, r1, #0x12000
#ifdef JAPAN
	strb r2, [r1, #0xa81]
#else
	strb r2, [r1, #0xb25]
#endif
	bl TeamMemberHasExclusiveItemEffectActive
	cmp r0, #0
	ldrne r0, _02338658 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	addne r0, r0, #0x12000
#ifdef JAPAN
	strneb r1, [r0, #0xa81]
#else
	strneb r1, [r0, #0xb25]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338658: .word DUNGEON_PTR
	arm_func_end UpdateShouldBoostHiddenStairsSpawnChance
