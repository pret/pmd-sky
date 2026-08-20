	.include "asm/macros.inc"
	.include "overlay_29_0232CF84.inc"

	.text

	arm_func_start DoMoveFillIn
DoMoveFillIn: ; 0x0232CF84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	mov r7, r0
	ldr r5, [r6, #0xb4]
	mov r4, #0
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _0232CFB8
	ldr r1, _0232D0E0 ; =0x00000F0B
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0232CFB8:
	ldrb r1, [r5, #0x4c]
	ldr r0, _0232D0E4 ; =DIRECTIONS_XY
	ldrsh r3, [r6, #4]
	mov r1, r1, lsl #2
	ldrsh r2, [r0, r1]
	ldr r1, _0232D0E8 ; =DIRECTIONS_XY + 2
	add r0, sp, #0
	add r2, r3, r2
	strh r2, [sp]
	ldrb r2, [r5, #0x4c]
	ldrsh r3, [r6, #6]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	strh r1, [sp, #2]
	bl ov29_022E6770
	ldrsh r0, [sp]
	ldrsh r1, [sp, #2]
	bl GetTileSafe
	ldrh r1, [r0]
	and r1, r1, #3
	cmp r1, #2
	bne _0232D06C
	ldrh r1, [r0]
	mvn r4, #0
	mov r5, r4
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	strh r1, [r0]
_0232D034:
	mov r8, r5
_0232D038:
	ldrsh r0, [sp]
	ldrsh r1, [sp, #2]
	add r0, r0, r8
	add r1, r1, r4
	bl ov29_02336694
	add r8, r8, #1
	cmp r8, #1
	ble _0232D038
	add r4, r4, #1
	cmp r4, #1
	ble _0232D034
	mov r4, #1
	bl DetermineAllMonsterShadow
_0232D06C:
	mov r8, #0
	mov r5, r8
_0232D074:
	mov sb, r5
_0232D078:
	mov r0, sb
	mov r1, r8
	bl DetermineTileWalkableNeighbors
	add sb, sb, #1
	cmp sb, #0x38
	blt _0232D078
	add r8, r8, #1
	cmp r8, #0x20
	blt _0232D074
	cmp r4, #0
	beq _0232D0C0
	add r0, sp, #0
	bl ov29_022E6784
	ldr r2, _0232D0EC ; =0x00000F0A
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232D0D0
_0232D0C0:
	ldr r2, _0232D0E0 ; =0x00000F0B
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D0D0:
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232D0E0: .word 0x00000C4D
_0232D0E4: .word DIRECTIONS_XY
_0232D0E8: .word DIRECTIONS_XY + 2
_0232D0EC: .word 0x00000C4C
#else
_0232D0E0: .word 0x00000F0B
_0232D0E4: .word DIRECTIONS_XY
_0232D0E8: .word DIRECTIONS_XY + 2
_0232D0EC: .word 0x00000F0A
#endif
	arm_func_end DoMoveFillIn

	arm_func_start DoMoveTrapper
DoMoveTrapper: ; 0x0232D0F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	bne _0232D11C
#ifdef JAPAN
	mov r0, r5
	mov r1, #0xbc0
#else
	ldr r1, _0232D144 ; =0x00000E7E
	mov r0, r5
#endif
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0232D11C:
	ldr r0, [r4, #0xb4]
	mov r1, #0x19
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r4, #4
	bl PrepareTrapperTrap
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifndef JAPAN
_0232D144: .word 0x00000E7E
#endif
	arm_func_end DoMoveTrapper

	arm_func_start DoMoveItemize
DoMoveItemize: ; 0x0232D148
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r4, r1
	ldrh r2, [r4, #4]
	mov r5, r0
	strh r2, [sp, #6]
	ldrh r2, [r4, #6]
	strh r2, [sp, #8]
	ldr r2, [r4, #0xb4]
	ldrb r2, [r2, #0xbc]
	cmp r2, #6
	bls _0232D188
	ldr r2, _0232D1D4 ; =0x00000F0C
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	b _0232D1CC
_0232D188:
	mov r0, #0
	strb r0, [r4, #0x20]
	bl GetItemIdToSpawn
	mov r1, r0
	add r0, sp, #0
	mov r2, #0
	bl GenerateStandardItem
	add r1, sp, #6
	add r2, sp, #0
	mov r0, r5
	mov r3, #0
	bl SpawnDroppedItemWrapper
	ldr r1, _0232D1D8 ; =0x00000257
	mov r0, r4
	mov r2, r5
	bl HandleFaint
	mov r0, #1
_0232D1CC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_0232D1D4: .word 0x00000C4E
#else
_0232D1D4: .word 0x00000F0C
#endif
_0232D1D8: .word 0x00000257
	arm_func_end DoMoveItemize
