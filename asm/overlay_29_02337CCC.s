	.include "asm/macros.inc"
	.include "overlay_29_02337CCC.inc"

	.text

	arm_func_start ov29_02337CCC
ov29_02337CCC: ; 0x02337CCC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	ldrsh r0, [r6]
	ldrsh r1, [r6, #2]
	mov r4, #0
	bl GetTileSafe
	ldrh r1, [r0]
	tst r1, #3
	bne _02337D60
	ldrh r1, [r0]
	tst r1, #0x100
	bne _02337D60
	tst r1, #0x10
	bne _02337D60
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	mov r4, #1
	sub r5, r4, #2
	orr r1, r1, #1
	strh r1, [r0]
	ldrh r1, [r0, #2]
	mov r7, r5
	orr r1, r1, #0x10
	strh r1, [r0, #2]
_02337D30:
	mov r8, r7
_02337D34:
	ldrsh r0, [r6]
	ldrsh r1, [r6, #2]
	add r0, r8, r0
	add r1, r5, r1
	bl DetermineTileWalkableNeighbors
	add r8, r8, #1
	cmp r8, #1
	ble _02337D34
	add r5, r5, #1
	cmp r5, #1
	ble _02337D30
_02337D60:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02337CCC

	arm_func_start ov29_02337D68
ov29_02337D68: ; 0x02337D68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	bl GetTileSafe
	ldrh r1, [r0, #2]
	tst r1, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bic r1, r1, #0x10
	mvn r6, #0
	strh r1, [r0, #2]
	mov r4, r6
_02337D98:
	mov r5, r4
_02337D9C:
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	add r0, r5, r0
	add r1, r6, r1
	bl ov29_02336694
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	add r0, r5, r0
	add r1, r6, r1
	bl DrawMinimapTile
	add r5, r5, #1
	cmp r5, #1
	ble _02337D9C
	add r6, r6, #1
	cmp r6, #1
	ble _02337D98
	ldr r4, _02337E28 ; =DUNGEON_PTR
	mov r5, #0
_02337DE4:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__02337CA8
	cmp r0, #0
	beq _02337E0C
	mov r0, r6
	bl DetermineMonsterShadow
_02337E0C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02337DE4
	bl UpdateTrapsVisibility
	mov r0, r7
	bl ov29_022E66C4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02337E28: .word DUNGEON_PTR
	arm_func_end ov29_02337D68
