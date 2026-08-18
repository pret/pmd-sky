	.include "asm/macros.inc"
	.include "overlay_29_02338684.inc"

	.text

	arm_func_start IsSecretFloor
IsSecretFloor: ; 0x02338684
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	bne _023386A0
	bl IsSecretRoom
	cmp r0, #0
	beq _023386A8
_023386A0:
	mov r0, #1
	ldmia sp!, {r3, pc}
_023386A8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsSecretFloor

	arm_func_start GetCurrentHiddenStairsType
GetCurrentHiddenStairsType: ; 0x023386B0
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl IsSecretRoom
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetCurrentHiddenStairsType

	arm_func_start HiddenStairsPresent
HiddenStairsPresent: ; 0x023386D8
	ldr r0, _02338704 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
#ifdef JAPAN
	ldrsh r2, [r0, #0x44]
	cmp r2, r1
	ldrnesh r0, [r0, #0x46]
#else
	ldrsh r2, [r0, #0xe8]
	cmp r2, r1
	ldrnesh r0, [r0, #0xea]
#endif
	cmpne r0, r1
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_02338704: .word DUNGEON_PTR
	arm_func_end HiddenStairsPresent

	arm_func_start PositionIsOnHiddenStairs
PositionIsOnHiddenStairs: ; 0x02338708
	ldr r1, _02338738 ; =DUNGEON_PTR
	ldrsh r2, [r0]
	ldr r1, [r1]
	add r1, r1, #0xcc00
#ifdef JAPAN
	ldrsh r3, [r1, #0x44]
	cmp r3, r2
	ldreqsh r1, [r1, #0x46]
#else
	ldrsh r3, [r1, #0xe8]
	cmp r3, r2
	ldreqsh r1, [r1, #0xea]
#endif
	ldreqsh r0, [r0, #2]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02338738: .word DUNGEON_PTR
	arm_func_end PositionIsOnHiddenStairs

	arm_func_start ov29_0233873C
ov29_0233873C: ; 0x0233873C
	stmdb sp!, {r3, lr}
	bl HiddenStairsPresent
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _02338764 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x44
#else
	add r0, r0, #0xe8
#endif
	add r0, r0, #0xcc00
	bl ov29_02338768
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338764: .word DUNGEON_PTR
	arm_func_end ov29_0233873C

	arm_func_start ov29_02338768
ov29_02338768: ; 0x02338768
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_022E2418
	mov r4, r0
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTileSafe
	str r4, [r0, #0x10]
	mov r0, #0
	strb r0, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02338768

	arm_func_start HiddenStairsTrigger
HiddenStairsTrigger: ; 0x02338794
#ifdef JAPAN
#define HIDDEN_STAIRS_TRIGGER_OFFSET -0xA4
#else
#define HIDDEN_STAIRS_TRIGGER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl HiddenStairsPresent
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02338848 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	ldrsh r1, [r1, #0xea + HIDDEN_STAIRS_TRIGGER_OFFSET]
	bl GetTileSafe
	mov r4, r0
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02338848 ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x1a000
	ldrb r1, [r0, #0x246 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	cmp r1, #0
	ldreqb r0, [r0, #0x244 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	cmpeq r0, #0
	bne _0233881C
	cmp r5, #0
	beq _0233881C
	add r0, r2, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET
	add r0, r0, #0xcc00
	mov r1, #0x41
	mov r2, #1
	bl PlayEffectAnimationPos
	bl GetLeader
	ldr r1, _0233884C ; =0x00000F31
	bl LogMessageByIdWithPopupCheckUser
_0233881C:
	ldr r1, [r4, #0x10]
	mov r2, #1
	ldr r0, _02338848 ; =DUNGEON_PTR
	strb r2, [r1, #0x20]
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	ldrsh r1, [r1, #0xea + HIDDEN_STAIRS_TRIGGER_OFFSET]
	bl DrawMinimapTile
	bl UpdateTrapsVisibility
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02338848: .word DUNGEON_PTR
#ifdef JAPAN
_0233884C: .word 0x000008A8
#else
_0233884C: .word 0x00000F31
#endif
	arm_func_end HiddenStairsTrigger
