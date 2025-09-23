	.include "asm/macros.inc"
	.include "overlay_29_02324698.inc"

	.text

	arm_func_start ov29_02324698
ov29_02324698: ; 0x02324698
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x140
	mov r6, #0
	ldr fp, _02324740 ; =DUNGEON_PTR
	mov r7, r6
	add r4, sp, #0
_023246B0:
	ldr r0, [fp]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xad4]
#else
	ldr sb, [r0, #0xb78]
#endif
	mov r0, sb
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _0232470C
	ldr r0, [sb, #0xb4]
	mov r8, #0
#ifdef JAPAN
	add r5, r0, #0x120
#else
	add r5, r0, #0x124
#endif
_023246DC:
	add sl, r5, r8, lsl #3
	mov r0, sb
	mov r1, sl
	bl ov29_02324748
	cmp r0, #0
	beq _02324700
	cmp r6, #0x50
	strlt sl, [r4, r6, lsl #2]
	addlt r6, r6, #1
_02324700:
	add r8, r8, #1
	cmp r8, #4
	blt _023246DC
_0232470C:
	add r7, r7, #1
	cmp r7, #0x14
	blt _023246B0
	cmp r6, #0
	ldreq r0, _02324744 ; =0x00000163
	beq _02324738
	mov r0, r6
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
	ldrh r0, [r0, #4]
_02324738:
	add sp, sp, #0x140
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02324740: .word DUNGEON_PTR
_02324744: .word 0x00000163
	arm_func_end ov29_02324698

	arm_func_start ov29_02324748
ov29_02324748: ; 0x02324748
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldrb r1, [r4]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02324788
	ldrh r1, [r4, #4]
	bl ov29_02324D60
	cmp r0, #0
	bne _02324788
	ldrh r0, [r4, #4]
	bl IsCopyingMove
	cmp r0, #0
	beq _02324790
_02324788:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02324790:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02324748

	arm_func_start HasMaxGinsengBoost99
HasMaxGinsengBoost99: ; 0x02324798
	stmdb sp!, {r3, lr}
	bl GetMoveMaxGinsengBoost
	cmp r0, #0x63
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end HasMaxGinsengBoost99

	arm_func_start ov29_023247B4
ov29_023247B4: ; 0x023247B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r8, r0
	ldr r0, [r8, #0xb4]
	mov r7, #0
	mov r6, r7
#ifdef JAPAN
	add r5, r0, #0x120
#else
	add r5, r0, #0x124
#endif
	add r4, sp, #0
_023247D4:
	add sb, r5, r6, lsl #3
	mov r0, r8
	mov r1, sb
	bl ov29_02324748
	cmp r0, #0
	beq _02324814
	mov r0, sb
	bl HasMaxGinsengBoost99
	cmp r0, #0
	beq _02324814
	ldrh r2, [sb, #4]
	add r0, r7, #1
	mov r1, r7, lsl #1
	mov r0, r0, lsl #0x10
	strh r2, [r4, r1]
	mov r7, r0, asr #0x10
_02324814:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _023247D4
	cmp r7, #0
	movle r0, #0
	ble _0232484C
	mov r0, r7
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0
	mov r0, r0, asr #0xf
	ldrh r0, [r1, r0]
_0232484C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_023247B4

	arm_func_start TwoTurnMoveForcedMiss
TwoTurnMoveForcedMiss: ; 0x02324854
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
#ifdef JAPAN
	ldrb r0, [r2, #0x10a]
#else
	ldrb r0, [r2, #0x10b]
#endif
	cmp r0, #1
	bne _023248A4
	ldrh r0, [r1, #4]
	cmp r0, #0x88
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x39
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_023248A4:
	cmp r0, #2
	bne _02324928
	ldrb r0, [r2, #0xd2]
	cmp r0, #9
	bne _023248D8
	ldrh r0, [r1, #4]
	cmp r0, #0x20
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xdb
	bne _02324920
	mov r0, #0
	ldmia sp!, {r3, pc}
_023248D8:
	cmp r0, #0xa
	bne _02324920
	ldrh r0, [r1, #4]
	cmp r0, #0x76
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x128
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x77
	bne _02324920
	bl GetNaturePowerVariant
	ldr r1, _02324930 ; =NATURE_POWER_TABLE
	mov r0, r0, lsl #3
	ldrh r0, [r1, r0]
	cmp r0, #0x76
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_02324920:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02324928:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02324930: .word NATURE_POWER_TABLE
	arm_func_end TwoTurnMoveForcedMiss

	arm_func_start DungeonRandOutcomeUserTargetInteraction
DungeonRandOutcomeUserTargetInteraction: ; 0x02324934
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, [r5, #0xb4]
#ifdef JAPAN
	ldrb r0, [r1, #0x15e]
#else
	ldrb r0, [r1, #0x162]
#endif
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	beq _023249DC
	mov r0, r6
	mov r1, #0x26
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023249CC
	mov r0, r4, lsl #1
	bl DungeonRandOutcome__022EAB50
	mov r4, r0
	b _023249E0
_023249CC:
	mov r0, r4
	bl DungeonRandOutcome__022EAB50
	mov r4, r0
	b _023249E0
_023249DC:
	mov r4, #1
_023249E0:
	cmp r4, #0
	cmpne r6, r5
	beq _02324A18
	mov r0, r6
	mov r1, r5
	mov r2, #0x4c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02324A18
	mov r0, r5
	bl ov29_022E65A8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02324A18:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DungeonRandOutcomeUserTargetInteraction

	arm_func_start DungeonRandOutcomeUserAction
DungeonRandOutcomeUserAction: ; 0x02324A20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0x26
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02324A68
	mov r0, r4, lsl #1
	bl DungeonRandOutcome__022EAB50
	ldmia sp!, {r3, r4, r5, pc}
_02324A68:
	mov r0, r4
	bl DungeonRandOutcome__022EAB50
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonRandOutcomeUserAction
