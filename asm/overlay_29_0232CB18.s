	.include "asm/macros.inc"
	.include "overlay_29_0232CB18.inc"

	.text

	arm_func_start DoMoveTrapBuster
DoMoveTrapBuster: ; 0x0232CB18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r7, #0
	bl GetTileAtEntity
	mov r4, r0
	bl IsFullFloorFixedRoom
	cmp r0, #0
	beq _0232CB58
	ldr r1, _0232CCB0 ; =0x00000F07
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r7
	b _0232CCA8
_0232CB58:
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	beq _0232CB74
	mov r0, sb
	bl HasDropeyeStatus
	cmp r0, #0
	beq _0232CB94
_0232CB74:
	bl GetVisibilityRange
	ldrsh r2, [sb, #4]
	ldrsh r1, [sb, #6]
	sub r8, r2, r0
	sub fp, r1, r0
	add r4, r2, r0
	add r5, r1, r0
	b _0232CBD0
_0232CB94:
	ldr r0, _0232CCB4 ; =DUNGEON_PTR
	ldrb r2, [r4, #7]
	ldr r0, [r0]
	mov r1, #0x1c
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r0, r2, r1, r0
	ldrsh r3, [r0, #2]
	ldrsh r2, [r0, #4]
	ldrsh r1, [r0, #6]
	ldrsh r0, [r0, #8]
	sub r8, r3, #1
	sub fp, r2, #1
	add r4, r1, #1
	add r5, r0, #1
_0232CBD0:
	ldr r0, _0232CCB8 ; =ov29_02352B38
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	strh r1, [sp, #4]
	strh r0, [sp, #6]
	b _0232CC68
_0232CBE8:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	mov r6, fp
	str r0, [sp]
	b _0232CC5C
_0232CBFC:
	mov r0, r8
	mov r1, r6
	bl GetTileSafe
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0232CC58
	ldr r1, [r0]
	cmp r1, #2
	bne _0232CC58
	bl GetTrapInfo
	ldrb r1, [r0, #2]
	tst r1, #1
	bne _0232CC58
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0232CC58
	ldr r2, [sp]
	add r0, sp, #8
	mov r1, #0
	strh r2, [sp, #8]
	strh r6, [sp, #0xa]
	bl TryRemoveTrap
	mov r7, #1
_0232CC58:
	add r6, r6, #1
_0232CC5C:
	cmp r6, r5
	ble _0232CBFC
	add r8, r8, #1
_0232CC68:
	cmp r8, r4
	ble _0232CBE8
	cmp r7, #0
	beq _0232CC94
	ldr r2, _0232CCBC ; =0x00000F05
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	b _0232CCA4
_0232CC94:
	ldr r2, _0232CCC0 ; =0x00000F06
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0232CCA4:
	mov r0, r7
_0232CCA8:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define DO_MOVE_TRAP_BUSTER_OFFSET -0x2Be
#else
#define DO_MOVE_TRAP_BUSTER_OFFSET 0
#endif
_0232CCB0: .word 0x00000F07 + DO_MOVE_TRAP_BUSTER_OFFSET
_0232CCB4: .word DUNGEON_PTR
_0232CCB8: .word ov29_02352B38
_0232CCBC: .word 0x00000F05 + DO_MOVE_TRAP_BUSTER_OFFSET
_0232CCC0: .word 0x00000F06 + DO_MOVE_TRAP_BUSTER_OFFSET
	arm_func_end DoMoveTrapBuster

	arm_func_start DoMoveWildCall
DoMoveWildCall: ; 0x0232CCC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #0xb4]
	mov sb, r1
	ldrb r0, [r0, #6]
	mov r6, #0
	mov r4, #0
	cmp r0, #0
	ldrne r0, _0232CD88 ; =DUNGEON_PTR
	movne r5, #0x10
	ldrne r0, [r0]
	moveq r5, #4
#ifdef JAPAN
	addne r0, r0, #0x294
#else
	addne r0, r0, #0x338
#endif
	ldreq r0, _0232CD88 ; =DUNGEON_PTR
	mov fp, #1
	ldreq r0, [r0]
#ifdef JAPAN
	addeq r0, r0, #0x284
#else
	addeq r0, r0, #0x328
#endif
	add r7, r0, #0x12800
	b _0232CD60
_0232CD10:
	ldr r8, [r7, r4, lsl #2]
	mov r0, r8
	bl EntityIsValidMoveEffects__0232C500
	cmp r0, #0
	cmpne sl, r8
	beq _0232CD5C
	mov r0, sl
	mov r1, r8
	mov r2, fp
	mov r3, #0
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	bne _0232CD5C
	mov r0, sl
	mov r1, r8
	mov r2, #2
	add r3, sl, #4
	bl TryWarp
	mov r6, #1
_0232CD5C:
	add r4, r4, #1
_0232CD60:
	cmp r4, r5
	blt _0232CD10
	cmp r6, #0
	bne _0232CD80
	ldr r2, _0232CD8C ; =0x00000F08
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0232CD80:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232CD88: .word DUNGEON_PTR
#ifdef JAPAN
_0232CD8C: .word 0x00000C4A
#else
_0232CD8C: .word 0x00000F08
#endif
	arm_func_end DoMoveWildCall

	arm_func_start DoMoveInvisify
DoMoveInvisify: ; 0x0232CD90
	stmdb sp!, {r3, lr}
	mov r1, r0
	bl TryInflictInvisibleStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveInvisify

	arm_func_start DoMoveOneShot
DoMoveOneShot: ; 0x0232CDA4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x20
	mov r5, #0
	strb r5, [sp, #0x1c]
	mov r7, r2
	mov r4, r0
	mov r0, r7
	mov r8, r1
	mov r5, r3
	bl GetMoveType
	mov r6, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r5
	mov r5, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r6}
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, _0232CE3C ; =0x0000270F
	mov r1, r8
	mov r0, r4
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232CE3C: .word 0x0000270F
	arm_func_end DoMoveOneShot
