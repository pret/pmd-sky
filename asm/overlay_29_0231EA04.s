	.include "asm/macros.inc"
	.include "overlay_29_0231EA04.inc"

	.text

	arm_func_start ov29_0231EA04
ov29_0231EA04: ; 0x0231EA04
	ldr ip, _0231EA14 ; =InitMove
	mov r0, r1
	mov r1, r2
	bx ip
	.align 2, 0
_0231EA14: .word InitMove
	arm_func_end ov29_0231EA04

	arm_func_start MoveIsNotPhysical
MoveIsNotPhysical: ; 0x0231EA18
	stmdb sp!, {r3, lr}
	bl GetMoveCategory
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end MoveIsNotPhysical

	arm_func_start CategoryIsNotPhysical
CategoryIsNotPhysical: ; 0x0231EA30
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end CategoryIsNotPhysical

	arm_func_start ov29_0231EA40
ov29_0231EA40: ; 0x0231EA40
#ifdef JAPAN
#define OV29_0231EA40_OFFSET -0xA4
#else
#define OV29_0231EA40_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl IsFullFloorFixedRoom
	cmp r0, #0
	bne _0231EA80
	ldr r0, _0231EDC8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, #0x4000
	ldrsh r0, [r1, #0xd4 + OV29_0231EA40_OFFSET]
	sub r2, r0, #0x1a
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #1
	bhi _0231EA90
_0231EA80:
	ldr r1, _0231EDCC ; =0x00000E01
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231EA90:
	ldrb r2, [r1, #0xc4 + OV29_0231EA40_OFFSET]
	cmp r2, #0
	beq _0231EAAC
	ldr r1, _0231EDD0 ; =0x00000DFF
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231EAAC:
	ldrb r1, [r1, #0xc7 + OV29_0231EA40_OFFSET]
	cmp r1, #0
	beq _0231EAC8
	mov r0, sl
#ifdef JAPAN
	mov r1, #0xb40
#else
	mov r1, #0xe00
#endif
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0231EAC8:
	bl ov29_022E0378
	cmp r0, #0
	movne r7, #3
	moveq r7, #2
	mov r6, #0
	mov sb, #1
_0231EAE0:
	ldr fp, _0231EDC8 ; =DUNGEON_PTR
	mov r5, #1
	mov r4, #0
_0231EAEC:
	mov r0, sb
	mov r1, r5
	mov r8, #0
	bl GetTileSafe
	ldrh r1, [r0]
	bic r1, r1, #0x400
	strh r1, [r0]
	strb r4, [r0, #7]
	ldrh r1, [r0]
	tst r1, #0x10
	bne _0231EBCC
	tst r1, #0x100
	bne _0231EBCC
	ldrh r1, [r0, #2]
	orr r1, r1, #3
	strh r1, [r0, #2]
	ldrh r1, [r0]
	bic r1, r1, #8
	strh r1, [r0]
	ldrh r1, [r0]
	tst r1, #0x40
	ldrh r1, [r0]
	movne r6, #1
	and r2, r1, #3
	cmp r2, #2
	cmpne r2, #3
	beq _0231EBCC
	cmp sb, #1
	cmpne r5, #1
	cmpne sb, #0x36
	cmpne r5, #0x1e
	bne _0231EB84
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldreq r1, [fp]
	ldreqb r1, [r1, #0x78f]
	cmpeq r1, #0
	moveq r8, #1
_0231EB84:
	cmp r8, #0
	beq _0231EBA8
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, r7
	strh r1, [r0]
	b _0231EBCC
_0231EBA8:
	cmp r2, #1
	beq _0231EBCC
	ldrh r1, [r0]
	bic r1, r1, #3
	strh r1, [r0]
	ldrh r1, [r0]
	orr r1, r1, #1
	orr r1, r1, #0x400
	strh r1, [r0]
_0231EBCC:
	add r5, r5, #1
	cmp r5, #0x1f
	blt _0231EAEC
	add sb, sb, #1
	cmp sb, #0x37
	blt _0231EAE0
	ldr r0, _0231EDC8 ; =DUNGEON_PTR
	mov r2, #1
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe4 + OV29_0231EA40_OFFSET]
	ldrsh r1, [r1, #0xe6 + OV29_0231EA40_OFFSET]
	bl StairsAlwaysReachable
	cmp r0, #0
	beq _0231EC64
	mov r5, #0
	mov r4, r5
_0231EC10:
	mov r8, r4
_0231EC14:
	mov r0, r5
	mov r1, r8
	bl GetTileSafe
	ldrh r1, [r0]
	tst r1, #0x100
	bne _0231EC4C
	tst r1, #0x400
	beq _0231EC4C
	tst r1, #0x8000
	bicne r1, r1, #3
	strneh r1, [r0]
	ldrneh r1, [r0]
	orrne r1, r1, r7
	strneh r1, [r0]
_0231EC4C:
	add r8, r8, #1
	cmp r8, #0x20
	blt _0231EC14
	add r5, r5, #1
	cmp r5, #0x38
	blt _0231EC10
_0231EC64:
	cmp r6, #0
	ldrne r0, _0231EDC8 ; =DUNGEON_PTR
	mov r5, #0
	ldrne r0, [r0]
	movne r1, #0
	addne r0, r0, #0x4000
	strneb r1, [r0, #0xc9 + OV29_0231EA40_OFFSET]
	mov r4, r5
_0231EC84:
	mov r7, r4
_0231EC88:
	cmp r6, #0
	beq _0231ECA8
	mov r0, r5
	mov r1, r7
	bl GetTileSafe
	ldrh r1, [r0]
	orr r1, r1, #0x40
	strh r1, [r0]
_0231ECA8:
	mov r0, r5
	mov r1, r7
	bl DetermineTileWalkableNeighbors
	add r7, r7, #1
	cmp r7, #0x20
	blt _0231EC88
	add r5, r5, #1
	cmp r5, #0x38
	blt _0231EC84
	ldr r4, _0231EDC8 ; =DUNGEON_PTR
	mov r5, #0
_0231ECD4:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78 + OV29_0231EA40_OFFSET]
	mov r0, r6
	bl EntityIsValid__0231EDD8
	cmp r0, #0
	beq _0231ED08
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	strb r0, [r6, #0x25]
_0231ED08:
	add r5, r5, #1
	cmp r5, #0x14
	blt _0231ECD4
	bl ov29_0233FB1C
	bl ov29_0233785C
	bl ov29_0233665C
	bl DetermineAllMonsterShadow
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	ldr r1, _0231EDD4 ; =0x00000DFE
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x28
	mov r1, #0x2b
	bl ov29_022EA370
	mov r0, sl
	mov r1, #1
	bl ov29_02305814
	ldr r4, _0231EDC8 ; =DUNGEON_PTR
	mov r6, #0
_0231ED58:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78 + OV29_0231EA40_OFFSET]
	mov r0, r5
	bl EntityIsValid__0231EDD8
	cmp r0, #0
	beq _0231ED98
	mov r0, r5
	bl ov29_022F9C74
	mov r0, r5
	bl EntityIsValid__0231EDD8
	cmp r0, #0
	beq _0231ED98
	mov r0, r5
	bl EnsureCanStandCurrentTile
_0231ED98:
	add r6, r6, #1
	cmp r6, #0x14
	blt _0231ED58
	ldr r0, _0231EDC8 ; =DUNGEON_PTR
	mov r3, #1
	ldr r1, [r0]
	mov r0, #0x14
	add r2, r1, #0x4000
	mov r1, #0x2b
	strb r3, [r2, #0xc4 + OV29_0231EA40_OFFSET]
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231EDC8: .word DUNGEON_PTR
#ifdef JAPAN
_0231EDCC: .word 0x00000B41
_0231EDD0: .word 0x00000B3F
_0231EDD4: .word 0x00000B3E
#else
_0231EDCC: .word 0x00000E01
_0231EDD0: .word 0x00000DFF
_0231EDD4: .word 0x00000DFE
#endif
	arm_func_end ov29_0231EA40
