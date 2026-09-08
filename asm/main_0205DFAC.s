	.include "asm/macros.inc"
	.include "main_0205DFAC.inc"

	.text

	arm_func_start CountAndPopulateValidMissionTableMonsters
CountAndPopulateValidMissionTableMonsters: ; 0x0205DFAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrh r6, [r1, #2]
	ldrh r8, [r1, #4]
	mov sl, r0
	mov r7, #0
	bl sub_020627F4
	mov r4, r0
	mov r0, r6, lsl #1
	mov r1, #0xf
	bl MemAlloc
	mov sb, r0
	mov r5, r7
	add r4, r4, r8, lsl #1
	b _0205E008
_0205DFE4:
	mov r0, r5, lsl #1
	ldrsh r8, [r0, r4]
	mov r0, r8
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	movne r0, r7, lsl #1
	strneh r8, [sb, r0]
	addne r7, r7, #1
	add r5, r5, #1
_0205E008:
	cmp r5, r6
	blt _0205DFE4
	mov r0, r7
	str sb, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end CountAndPopulateValidMissionTableMonsters
