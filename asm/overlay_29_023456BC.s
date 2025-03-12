	.include "asm/macros.inc"
	.include "overlay_29_023456BC.inc"

	.text

	arm_func_start RemoveGroundItem
RemoveGroundItem: ; 0x023456BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, r0
	mov r7, r1
	ldrsh r0, [r2]
	ldrsh r1, [r2, #2]
	bl GetTileSafe
	mov r5, r0
	ldr r6, [r5, #0x10]
	cmp r6, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6]
	cmp r0, #3
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl GetItemInfo
	ldrh r1, [r5]
	mov r4, r0
	tst r1, #0x20
	beq _02345770
	ldrsh r0, [r4, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _02345770
	ldrb r0, [r4]
	tst r0, #2
	beq _02345754
	cmp r7, #0
	beq _02345770
	mov r0, r4
	bl GetActualBuyPrice
	ldr r1, _023457C4 ; =DUNGEON_PTR
	ldr r2, [r1]
	ldr r1, [r2, #0x7bc]
	sub r0, r1, r0
	str r0, [r2, #0x7bc]
	b _02345770
_02345754:
	mov r0, r4
	bl GetActualSellPrice
	ldr r1, _023457C4 ; =DUNGEON_PTR
	ldr r2, [r1]
	ldr r1, [r2, #0x7c0]
	sub r0, r1, r0
	str r0, [r2, #0x7c0]
_02345770:
	mov r4, #0
	str r4, [r5, #0x10]
	ldr r5, _023457C4 ; =DUNGEON_PTR
	mov r7, r4
	str r4, [r6]
_02345784:
	ldr r0, [r5]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xb24]
#else
	ldr r0, [r0, #0xbc8]
#endif
	bl EntityIsValid__02345698
	cmp r0, #0
	addne r4, r7, #1
	add r7, r7, #1
	cmp r7, #0x40
	blt _02345784
	ldr r1, _023457C4 ; =DUNGEON_PTR
	mov r0, #1
	ldr r1, [r1]
	add r1, r1, #0x3f00
#ifdef JAPAN
	strh r4, [r1, #0x1c]
#else
	strh r4, [r1, #0xc0]
#endif
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023457C4: .word DUNGEON_PTR
	arm_func_end RemoveGroundItem

	arm_func_start ov29_023457C8
ov29_023457C8: ; 0x023457C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	mov r6, r1
	mov r8, r2
	mov r5, r3
	mov r4, #0
	bl EntityIsValid__02345698
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r8, #0
	beq _02345830
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	bl GetTile
	ldrh r0, [r0]
	ands r0, r0, #3
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r0, #2
	moveq r4, #1
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02345830:
	ldr r0, _02345A20 ; =DUNGEON_PTR
	ldr r3, _02345A24 ; =0x0001A224
	ldr r2, [r0]
	add r0, r3, #2
	ldrsh r1, [r2, r0]
	add r0, r2, #0x1a000
	ldr sl, [r7, #0x10]
	ldr sb, [r7, #0x1c]
#ifdef JAPAN
	ldr r0, [r0, #0x18c]
#else
	ldr r0, [r0, #0x230]
#endif
	rsb r8, r1, sl, asr #8
	add r8, r0, r8
	sub sb, sl, sb
	ldrsh r3, [r2, r3]
	rsb sb, r1, sb, asr #8
	add r8, r8, #8
	add r1, r8, r8, lsr #31
	ldr r8, [r7, #0xc]
	mvn r2, #0x1f
	rsb r8, r3, r8, asr #8
	add sb, r0, sb
	cmp r8, r2
	mov sl, r1, asr #1
	cmpge sb, r2
	blt _02345A18
	rsb r0, r2, #0xff
	cmp r8, r0
	cmple sb, #0xe0
	bgt _02345A18
	ldr r0, _02345A28 ; =ov29_0237C864
	cmp r6, #0
	ldrh r1, [r0, #2]
	bic r1, r1, #0x3e00
	strh r1, [r0, #2]
	beq _023458D8
	ldrh r1, [r0, #4]
	mov r6, #0x17
	bic r1, r1, #0xf000
	strh r1, [r0, #4]
	ldrh r1, [r0, #4]
	orr r1, r1, #0xa000
	strh r1, [r0, #4]
	b _02345958
_023458D8:
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #4]
	bl GetItemSpriteId
	mov r6, r0
	cmp r5, #0xff
	beq _0234592C
	cmp r6, #0
	cmpne r6, #0x3b
	bne _0234592C
	ldr r0, _02345A28 ; =ov29_0237C864
	ldr r1, _02345A2C ; =ov29_023537BC
	ldrh r2, [r0, #2]
	ldrb r1, [r1, r5]
	ldr r3, _02345A30 ; =ov29_023537B4
	bic r2, r2, #0x3e00
	strh r2, [r0, #2]
	ldrh r2, [r0, #2]
	mov r1, r1, lsl #0x1e
	ldrb r6, [r3, r5]
	orr r1, r2, r1, lsr #18
	strh r1, [r0, #2]
_0234592C:
	ldr r0, [r7, #0xb4]
	ldrsh r0, [r0, #4]
	bl sub_0200D1FC
	ldr r1, _02345A28 ; =ov29_0237C864
	mov r0, r0, lsl #0x1c
	ldrh r2, [r1, #4]
	bic r2, r2, #0xf000
	strh r2, [r1, #4]
	ldrh r2, [r1, #4]
	orr r0, r2, r0, lsr #16
	strh r0, [r1, #4]
_02345958:
	ldr r1, _02345A28 ; =ov29_0237C864
	mov r2, r6, lsl #1
	ldrh r5, [r1, #6]
	ldr r0, _02345A34 ; =0xFFFF000F
	add r3, r2, #0x110
	and r2, r5, r0
	strh r2, [r1, #6]
	ldrh r6, [r1, #6]
	mov r5, sb, lsl #0x14
	ldrb r2, [sp, #0x20]
	orr r5, r6, r5, lsr #16
	strh r5, [r1, #6]
	ldrh r6, [r1, #2]
	cmp r2, #0
	and r5, r8, r0, lsr #23
	and r6, r6, r0, asr #7
	strh r6, [r1, #2]
	ldrh r6, [r1, #2]
	mov r4, r4, lsl #0x1e
	and r3, r3, r0, lsr #22
	orr r2, r6, r5
	strh r2, [r1, #2]
	ldrh r2, [r1]
	moveq sl, #1
	bic r2, r2, #0xc00
	strh r2, [r1]
	ldrh r2, [r1]
	orr r2, r2, r4, lsr #20
	strh r2, [r1]
	ldrh r2, [r1, #4]
	bic r2, r2, #0xc00
	strh r2, [r1, #4]
	ldrh r2, [r1, #4]
	orr r2, r2, #0xc00
	strh r2, [r1, #4]
	ldrh r2, [r1, #4]
	and r0, r2, r0, asr #6
	strh r0, [r1, #4]
	ldrh r0, [r1, #4]
	mov r2, sl
	orr r0, r0, r3
	strh r0, [r1, #4]
	ldr r0, _02345A38 ; =_020AFC4C
	ldr r1, _02345A28 ; =ov29_0237C864
	ldr r0, [r0]
	bl sub_0201B9F8
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02345A18:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02345A20: .word DUNGEON_PTR
#ifdef JAPAN
_02345A24: .word 0x0001A180
#else
_02345A24: .word 0x0001A224
#endif
_02345A28: .word ov29_0237C864
_02345A2C: .word ov29_023537BC
_02345A30: .word ov29_023537B4
_02345A34: .word 0xFFFF000F
_02345A38: .word _020AFC4C
	arm_func_end ov29_023457C8

	arm_func_start SpawnDroppedItemWrapper
SpawnDroppedItemWrapper: ; 0x02345A3C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xc0
	mov r5, r2
	mov r4, #0
	mov r6, #3
	mov r2, #1
	str r6, [sp, #8]
	strb r2, [sp, #0x28]
	str r5, [sp, #0xbc]
	strb r4, [sp, #0x2c]
	strb r4, [sp, #0x2a]
	ldrh r4, [r1]
	mov r6, r0
	mov r2, #0x18
	strh r4, [sp, #0xc]
	ldrh ip, [r1, #2]
	mov r4, r3
	add r0, sp, #8
	strh ip, [sp, #0xe]
	ldrsh r3, [r1]
	ldrsh r1, [r1, #2]
	smulbb r3, r3, r2
	smulbb r1, r1, r2
	add r2, r1, #4
	add r3, r3, #4
	mov r1, r3, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r0, #0
	strh r0, [sp, #0x2e]
	str r0, [sp]
	add r1, sp, #8
	mov r0, r6
	mov r2, r5
	mov r3, #1
	str r4, [sp, #4]
	bl SpawnDroppedItem
	add sp, sp, #0xc0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SpawnDroppedItemWrapper

	arm_func_start SpawnDroppedItem
SpawnDroppedItem: ; 0x02345AD8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r8, r1
	mov sb, r0
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	mov r7, r2
	mov r4, r3
	ldr r6, [sp, #0x38]
	bl GetTile
	ldr r0, [r0, #0x10]
	mov r5, #0
	cmp r0, #0
	beq _02345B5C
	ldr r0, [r0]
	cmp r0, #2
	bne _02345B5C
	ldrb r2, [sp, #0x3c]
	mov r0, r8
	add r1, r8, #4
	bl ov29_02347378
	add r0, r8, #4
	bl ov29_02338430
	ldr r1, _02345D64 ; =0x00000BD8
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	ldrb r0, [r7]
	tst r0, #1
	movne r0, #1
	moveq r0, r5
	tst r0, #0xff
	moveq r0, #0
	beq _02345D5C
_02345B5C:
	ldrsh r0, [r8, #4]
	cmp r4, #0
	movne r4, #0
	strh r0, [sp, #0xc]
	ldrsh r0, [r8, #6]
	ldrh r1, [sp, #0xc]
	ldr fp, _02345D68 ; =DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
	strh r0, [sp, #0xe]
	ldrh r0, [sp, #0xe]
	strh r1, [sp, #8]
	moveq r4, #1
	strh r0, [sp, #0xa]
_02345B8C:
	mov r0, r4, lsl #2
	ldrsh r3, [fp, r0]
	cmp r3, #0x63
	moveq r5, #0
	beq _02345C44
	ldrsh r2, [r8, #4]
	add r0, fp, r0
	ldrsh r1, [r0, #2]
	add r0, r2, r3
	strh r0, [sp, #0xc]
	ldrsh r2, [r8, #6]
	ldrsh r0, [sp, #0xc]
	add r1, r2, r1
	strh r1, [sp, #0xe]
	ldrsh r1, [sp, #0xe]
	bl GetTile
	mov sl, r0
	ldrh r0, [sl]
	tst r0, #3
	beq _02345C3C
	tst r0, #0x200
	ldreq r0, [sl, #0x10]
	cmpeq r0, #0
	bne _02345C3C
	ldrb r2, [sp, #0x3c]
	add r1, sp, #0xc
	mov r0, r8
	bl ov29_02347378
	ldrh r0, [sl]
	ldrh r2, [sp, #0xc]
	ldrh r1, [sp, #0xe]
	and r0, r0, #3
	cmp r0, #3
	strh r2, [sp, #8]
	strh r1, [sp, #0xa]
	moveq r5, #1
	beq _02345C44
	add r0, sp, #0xc
	mov r1, r7
	mov r2, #1
	bl SpawnItem
	cmp r0, #0
	movne r5, #1
	b _02345C44
_02345C3C:
	add r4, r4, #1
	b _02345B8C
_02345C44:
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345D6C ; =ov29_023531BC
	mov r1, r7
	mov r0, #0
	bl sub_02024FE8
	cmp r5, #0
	beq _02345CF4
	ldrsh r0, [sp, #0xc]
	ldrsh r1, [sp, #0xe]
	bl DrawMinimapTile
	ldrsh r0, [sp, #0xc]
	ldrsh r1, [sp, #0xe]
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02345D58
_02345C94: ; jump table
	b _02345CCC ; case 0
	b _02345CA4 ; case 1
	b _02345CB8 ; case 2
	b _02345CE0 ; case 3
_02345CA4:
	ldr r2, _02345D70 ; =0x00000BD9
	add r1, sp, #0xc
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserUnknown
	b _02345D58
_02345CB8:
	ldr r2, _02345D74 ; =0x00000BDA
	add r1, sp, #0xc
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserUnknown
	b _02345D58
_02345CCC:
	ldr r2, _02345D78 ; =0x00000BDB
	add r1, sp, #0xc
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserUnknown
	b _02345D58
_02345CE0:
	ldr r2, _02345D7C ; =0x00000BDF
	add r1, sp, #0xc
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserUnknown
	b _02345D58
_02345CF4:
	ldrsh r2, [sp, #8]
	ldrsh r1, [sp, #0xa]
	mov r0, #0x18
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r1, r2, #0xc
	add r0, r0, #0xc
	mov r2, r1, lsl #8
	mov r1, r0, lsl #8
	str r2, [sp]
	str r1, [sp, #4]
	cmp r6, #0
	beq _02345D40
	ldrsh r0, [r6]
	add r0, r2, r0, lsl #8
	str r0, [sp]
	ldrsh r0, [r6, #2]
	add r0, r1, r0, lsl #8
	str r0, [sp, #4]
_02345D40:
	add r0, sp, #0
	bl ov29_022E563C
	ldr r2, _02345D80 ; =0x00000BDC
	add r1, sp, #0xc
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUserUnknown
_02345D58:
	mov r0, r5
_02345D5C:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define SPAWN_DROPPED_ITEM_OFFSET -0x2C1
#else
#define SPAWN_DROPPED_ITEM_OFFSET 0
#endif
_02345D64: .word 0x00000BD8 + SPAWN_DROPPED_ITEM_OFFSET
_02345D68: .word DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
_02345D6C: .word ov29_023531BC
_02345D70: .word 0x00000BD9 + SPAWN_DROPPED_ITEM_OFFSET
_02345D74: .word 0x00000BDA + SPAWN_DROPPED_ITEM_OFFSET
_02345D78: .word 0x00000BDB + SPAWN_DROPPED_ITEM_OFFSET
_02345D7C: .word 0x00000BDF + SPAWN_DROPPED_ITEM_OFFSET
_02345D80: .word 0x00000BDC + SPAWN_DROPPED_ITEM_OFFSET
	arm_func_end SpawnDroppedItem

	arm_func_start ov29_02345D84
ov29_02345D84: ; 0x02345D84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r1
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	str r2, [sp, #4]
	mov sb, r3
	bl GetTile
	ldr r0, _02346048 ; =DUNGEON_PTR
	mov r4, #0
	ldr r0, [r0]
	ldr r1, _0234604C ; =SECONDARY_TERRAIN_TYPES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	mov r7, r4
	mov r8, r4
	ldrb r0, [r1, r0]
	mov r6, #1
	mov fp, #0
	cmp r0, #1
	ldrsh r0, [sl, #4]
	moveq r7, #1
	ldr r5, _02346050 ; =DISPLACEMENTS_WITHIN_3
	strh r0, [sp, #0x14]
	ldrsh r0, [sl, #6]
	ldrh r1, [sp, #0x14]
	strh r0, [sp, #0x16]
	ldrh r0, [sp, #0x16]
	strh r1, [sp, #0x10]
	strh r0, [sp, #0x12]
	b _02345F74
_02345E00:
	mov r0, r6, lsl #2
	ldrsh r0, [r5, r0]
	ldrsh r3, [sl, #4]
	cmp r0, #0x63
	moveq r6, fp
	mov r0, r6, lsl #2
	ldrsh r2, [r5, r0]
	add r0, r5, r6, lsl #2
	ldrsh r1, [r0, #2]
	add r0, r3, r2
	strh r0, [sp, #0x14]
	ldrsh r2, [sl, #6]
	ldrsh r0, [sp, #0x14]
	moveq r8, #1
	add r1, r2, r1
	strh r1, [sp, #0x16]
	ldrsh r1, [sp, #0x16]
	bl GetTile
	ldrh r1, [r0]
	ands r2, r1, #3
	beq _02345F70
	tst r1, #0x200
	bne _02345F70
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02345F64
	ldrh r1, [sp, #0x14]
	ldrh r0, [sp, #0x16]
	cmp r2, #3
	strh r1, [sp, #0x10]
	strh r0, [sp, #0x12]
	beq _02345F70
	cmp r7, #0
	beq _02345E90
	cmp r2, #2
	beq _02345F70
_02345E90:
	ldr r0, _02346048 ; =DUNGEON_PTR
	ldrsh r2, [sp, #0x14]
	ldr r3, [r0]
	mov r0, #0x18
	ldrsh r1, [sp, #0x16]
	smulbb r2, r2, r0
	smulbb r1, r1, r0
	add r0, r3, #0x1a000
	add r2, r2, #4
	add r1, r1, #4
#ifdef JAPAN
	ldrb fp, [r0, #0x1a1]
#else
	ldrb fp, [r0, #0x245]
#endif
	mov r5, #0x10000
	mov r7, r2, lsl #8
	mov r8, r1, lsl #8
	mov r0, sl
	mov r1, r7
	mov r2, r8
	str r5, [sl, #0x1c]
	bl SetEntityPixelPosXY
	mov r6, #0
_02345EE0:
	sub r5, r5, #0x800
	mov r2, #0
	str r5, [sl, #0x1c]
	mov r0, sl
	mov r1, fp
	mov r3, r2
	str r2, [sp]
	bl ov29_023457C8
	mov r0, #0x13
	bl AdvanceFrame
	add r6, r6, #1
	cmp r6, #0x20
	blt _02345EE0
	mov r0, sl
	mov r1, r7
	mov r2, r8
	bl SetEntityPixelPosXY
	mov r2, #0
	str r2, [sl, #0x1c]
	mov r0, sl
	mov r1, fp
	mov r3, r2
	str r2, [sp]
	bl ov29_023457C8
	mov r0, #0x13
	bl AdvanceFrame
	ldr r1, [sp, #4]
	add r0, sp, #0x14
	mov r2, #1
	bl SpawnItem
	cmp r0, #0
	movne r4, #1
	b _02345F7C
_02345F64:
	cmp r8, #0
	movne r4, #0
	bne _02345F7C
_02345F70:
	add r6, r6, #1
_02345F74:
	cmp r8, #0
	beq _02345E00
_02345F7C:
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02346054 ; =ov29_023531BC
	ldr r1, [sp, #4]
	mov r0, #0
	bl sub_02024FE8
	cmp r4, #0
	beq _02345FC4
	bl ov29_022EACBC
	ldr r1, _02346058 ; =0x00000B74
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldr r1, _02346058 ; =0x00000B74
	mov r0, #0
	bl LogMessageByIdQuiet
	b _0234603C
_02345FC4:
	ldrsh r2, [sp, #0x10]
	ldrsh r1, [sp, #0x12]
	mov r0, #0x18
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r1, r2, #0xc
	add r0, r0, #0xc
	mov r2, r1, lsl #8
	mov r1, r0, lsl #8
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	cmp sb, #0
	beq _02346010
	ldrsh r0, [sb]
	add r0, r2, r0, lsl #8
	str r0, [sp, #8]
	ldrsh r0, [sb, #2]
	add r0, r1, r0, lsl #8
	str r0, [sp, #0xc]
_02346010:
	add r0, sp, #8
	bl ov29_022E563C
	ldr r1, _0234605C ; =0x00000B75
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldr r1, _0234605C ; =0x00000B75
	mov r0, #0
	bl LogMessageByIdQuiet
	mov r0, #0
	b _02346040
_0234603C:
	mov r0, #1
_02346040:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346048: .word DUNGEON_PTR
_0234604C: .word SECONDARY_TERRAIN_TYPES
_02346050: .word DISPLACEMENTS_WITHIN_3
_02346054: .word ov29_023531BC
#ifdef JAPAN
_02346058: .word 0x00000885
_0234605C: .word 0x00000886
#else
_02346058: .word 0x00000B74
_0234605C: .word 0x00000B75
#endif
	arm_func_end ov29_02345D84

	arm_func_start TryGenerateUnownStoneDrop
TryGenerateUnownStoneDrop: ; 0x02346060
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl IsMarowakTrainingMaze
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl IsUnown
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _023460D8 ; =UNOWN_STONE_DROP_CHANCE
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	sub r0, r5, #0xc9
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add r0, r0, #0x190
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, #0
	mov r3, #2
	bl GenerateItem
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023460D8: .word UNOWN_STONE_DROP_CHANCE
	arm_func_end TryGenerateUnownStoneDrop

	arm_func_start ov29_023460DC
ov29_023460DC: ; 0x023460DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r7, r0
	mov r4, r1
	mov r6, r2
	mov r5, r3
	bl ov29_022FB51C
	cmp r0, #0
	beq _02346134
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	bne _02346134
	bl IsMarowakTrainingMaze
	cmp r0, #0
	bne _02346134
	mov r0, r4
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _02346134
	ldr r0, [r4]
	cmp r0, #1
	beq _0234613C
_02346134:
	mov r0, #0
	b _02346330
_0234613C:
	ldr r4, [r4, #0xb4]
	add r1, sp, #0
	ldrsh r0, [r4, #2]
	bl GetTreasureBoxChances
	cmp r5, #0
	ble _02346184
	ldr r1, _02346338 ; =ov10_022C48EC
	mov lr, #0
	add r3, sp, #0
_02346160:
	mov ip, lr, lsl #1
	ldrsh r2, [r3, ip]
	add lr, lr, #1
	cmp r2, #0
	ldrnesh r0, [r1, ip]
	mlane r0, r5, r0, r2
	strneh r0, [r3, ip]
	cmp lr, #4
	blt _02346160
_02346184:
	mov r2, #0
	mov r1, r2
	add r0, sp, #8
_02346190:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #4
	blt _02346190
	ldrsh r0, [sp]
	mov ip, #1
	add r5, sp, #0
	str r0, [sp, #8]
	add r2, sp, #8
_023461B4:
	mov r3, ip, lsl #1
	add r1, r2, ip, lsl #2
	ldrsh r3, [r5, r3]
	ldr r1, [r1, #-4]
	add r1, r1, r3
	str r1, [r2, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #4
	add r0, r0, r3
	blt _023461B4
	bl DungeonRandInt
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _023461F4
	cmp r0, r1
	bge _023461FC
_023461F4:
	mov r0, #0
	b _02346330
_023461FC:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0234626C
	mov r5, #0
	mov r4, r5
	cmp r6, #0
	beq _02346230
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _0234633C ; =ov10_022C44C8
	ldrsh r1, [r1]
	cmp r1, r0
	movlt r5, #1
_02346230:
	cmp r5, #0
	movne r5, #0x67
	bne _02346310
	ldr r0, _02346340 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r5, r0, #0x348
	add r0, r5, #0x400
	bl sub_0204F7A8
	mov r1, r0
	cmp r1, #0xf
	movgt r1, #0xf
	add r0, r5, #0x400
	bl RetrieveFromItemList1
	mov r5, r0
	b _02346310
_0234626C:
	ldr r1, [sp, #0x10]
	cmp r0, r1
	ldrsh r0, [r4, #2]
	bge _023462C8
	mov r1, #0
	bl GetExclusiveItem
	movs r5, r0
	mov r4, #1
	bne _02346310
	ldr r0, _02346340 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x7cc]
	cmp r0, #0
	moveq r0, #0x6e
	movne r0, #0x6a
	bl DungeonRandInt
	mov r0, r0, lsl #0x12
	mov r0, r0, asr #0x10
	add r0, r0, #0x3e
	add r0, r0, #0x200
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	b _02346310
_023462C8:
	mov r1, #1
	bl GetExclusiveItem
	movs r5, r0
	mov r4, #2
	bne _02346310
	ldr r0, _02346340 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x7cc]
	cmp r0, #0
	moveq r0, #0x6e
	movne r0, #0x6a
	bl DungeonRandInt
	mov r0, r0, lsl #0x12
	mov r0, r0, asr #0x10
	add r0, r0, #0x3f
	add r0, r0, #0x200
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02346310:
	mov r0, r4
	bl ov29_02344BF8
	mov r1, r0
	mov r0, r7
	mov r2, r5
	mov r3, #2
	bl GenerateItem
	mov r0, #1
_02346330:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02346338: .word ov10_022C48EC
_0234633C: .word ov10_022C44C8
_02346340: .word DUNGEON_PTR
	arm_func_end ov29_023460DC

	arm_func_start ov29_02346344
ov29_02346344: ; 0x02346344
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3ec
	sub sp, sp, #0x400
	mov r4, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr sb, [sp, #0x810]
	ldr r8, [sp, #0x814]
	ldr r7, [sp, #0x818]
	mov fp, r2
	mov sl, r3
	mov r1, r4
	mov r6, r4
	add r0, sp, #0x24
_0234637C:
	strb r6, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x1e
	blt _0234637C
	b _0234647C
_02346390:
	ldrsh r1, [fp]
	ldrsh r0, [fp, #2]
	mov r5, #0
	strh r1, [sp, #0x20]
	str r5, [sp, #0x14]
	strh r0, [sp, #0x22]
_023463A8:
	cmp r5, #0x1e
	bge _02346454
	mov r2, r5, lsl #2
	ldrsh r0, [r8, r2]
	cmp r0, #0x63
	beq _02346454
	add r1, sp, #0x24
	ldrb r1, [r1, r5]
	cmp r1, #0
	bne _0234644C
	add r1, r8, r2
	ldrsh r1, [r1, #2]
	ldrsh r3, [fp]
	ldrsh r2, [fp, #2]
	add r3, r3, r0
	add r0, r2, r1
	strh r3, [sp, #0x20]
	strh r0, [sp, #0x22]
	ldrsh r0, [sp, #0x20]
	ldrsh r1, [sp, #0x22]
	bl GetTile
	ldrh r1, [r0]
	tst r1, #3
	beq _0234644C
	tst r1, #0x200
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	bne _0234644C
	ldrh r1, [sp, #0x20]
	add r0, sp, #0x42
	mov r2, r6, lsl #2
	strh r1, [r0, r2]
	mov r1, #1
	ldrh r3, [sp, #0x22]
	str r1, [sp, #0x14]
	mov r2, r1
	add r1, sp, #0x24
	add r0, r0, r6, lsl #2
	strb r2, [r1, r5]
	strh r3, [r0, #2]
	b _02346454
_0234644C:
	add r5, r5, #1
	b _023463A8
_02346454:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _02346478
	add r0, sp, #0x42
	mov r1, r6, lsl #2
	mvn r2, #0
	strh r2, [r0, r1]
	add r0, r0, r6, lsl #2
	strh r2, [r0, #2]
_02346478:
	add r6, r6, #1
_0234647C:
	cmp r6, sb
	blt _02346390
	mov r1, #0
	mov r5, r1
	mov r8, r1
	add fp, sp, #0x42
	b _023465B4
_02346498:
	mov r0, r8, lsl #2
	ldrsh r2, [fp, r0]
	cmp r2, #0
	bge _023464C4
	mov r0, #0xb8
	mul r3, r8, r0
	mov r2, #0
	add r0, sp, #0xbc
	str r2, [r0, r3]
	mov r5, #1
	b _023465B0
_023464C4:
	mov r1, #0xb8
	mul r3, r8, r1
	add r1, sp, #0xbc
	mov r2, #3
	str r2, [r1, r3]
	add r6, r1, r3
	mov r1, #0
	strb r1, [r6, #0x24]
	mov r1, #1
	strb r1, [r6, #0x20]
	mov r1, #0
	strb r1, [r6, #0x22]
	mov r1, #6
	mla r1, r8, r1, sl
	str r1, [r6, #0xb4]
	add r1, fp, r0
	ldrh r2, [fp, r0]
	ldrh r1, [r1, #2]
	mov r0, r6
	strh r2, [r6, #4]
	strh r1, [r6, #6]
	ldr r1, [sp, #8]
	ldrsh r2, [r1]
	ldrsh r3, [r1, #2]
	mov r1, #0x18
	smulbb r1, r2, r1
	mov r2, #0x18
	smulbb r2, r3, r2
	add r1, r1, #4
	add r2, r2, #4
	mov r1, r1, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r0, #0
	strh r0, [r6, #0x26]
	mov r0, r8, lsl #2
	ldrsh r3, [fp, r0]
	mov r1, #0x18
	mov r0, r1
	smulbb r0, r3, r0
	ldr r2, [r6, #0xc]
	add r0, r0, #4
	rsb r0, r2, r0, lsl #8
	bl _s32_div_f
	add r1, sp, #0x6c
	str r0, [r1, r8, lsl #3]
	add r0, fp, r8, lsl #2
	ldrsh r3, [r0, #2]
	mov r1, #0x18
	mov r0, r1
	smulbb r0, r3, r0
	ldr r2, [r6, #0x10]
	add r0, r0, #4
	rsb r0, r2, r0, lsl #8
	bl _s32_div_f
	add r1, sp, #0x6c
	add r1, r1, r8, lsl #3
	str r0, [r1, #4]
	mov r1, #1
_023465B0:
	add r8, r8, #1
_023465B4:
	cmp r8, sb
	blt _02346498
	cmp r1, #0
	bne _02346614
	cmp r7, #0
	beq _0234660C
	cmp sb, #2
	blt _023465E4
	ldr r1, _023467D0 ; =0x00000BDD
	ldr r0, [sp, #4]
	bl LogMessageByIdWithPopupCheckUser
	b _0234660C
_023465E4:
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _023467D4 ; =ov29_023531BC
	mov r1, sl
	mov r0, #0
	bl sub_02024FE8
	ldr r1, _023467D8 ; =0x00000BDC
	ldr r0, [sp, #4]
	bl LogMessageByIdWithPopupCheckUser
_0234660C:
	mov r0, #0
	b _023467C4
_02346614:
	cmp r5, #0
	cmpne r7, #0
	beq _0234662C
	ldr r1, _023467DC ; =0x00000BDE
	ldr r0, [sp, #4]
	bl LogMessageByIdWithPopupCheckUser
_0234662C:
	ldr r0, _023467E0 ; =DUNGEON_PTR
	mov r6, #0
	ldr r0, [r0]
	mov fp, r6
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a1]
#else
	ldrb r0, [r0, #0x245]
#endif
	mov r5, r6
	str r0, [sp, #0x10]
_0234664C:
	and r0, r6, #0xff
	mov r8, #0
	str r0, [sp, #0x1c]
	b _023466E4
_0234665C:
	mov r0, #0xb8
	mul r0, r8, r0
	add r1, sp, #0xbc
	str r0, [sp, #0x18]
	add r0, r1, r0
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _023466E0
	mov r1, #0xb8
	add r0, sp, #0xbc
	mla r0, r8, r1, r0
	add r2, sp, #0x6c
	add r1, sp, #0x6c
	add r2, r2, r8, lsl #3
	ldr r1, [r1, r8, lsl #3]
	ldr r2, [r2, #4]
	str r0, [sp, #0xc]
	bl IncrementEntityPixelPosXY
	mov r0, fp
	bl sub_020018D0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	str r1, [r0, #0x1c]
	ldr r0, [sp, #0x18]
	add r1, sp, #0xbc
	add r0, r1, r0
	mov r1, #0
	str r1, [sp]
	ldr r1, [sp, #0x10]
	mov r2, #1
	bl ov29_023457C8
_023466E0:
	add r8, r8, #1
_023466E4:
	cmp r8, sb
	blt _0234665C
	mov r0, #0x13
	bl AdvanceFrame
	tst r5, #3
	addeq r6, r6, #1
	add r5, r5, #1
	add fp, fp, #0x55
	and r6, r6, #7
	cmp r5, #0x18
	blt _0234664C
	mov r8, #0
	add r6, sp, #0x42
	mov fp, r8
	mov r5, #6
	b _023467B8
_02346724:
	mov r1, r8, lsl #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt _023467B4
	add r1, r6, r1
	ldrsh r1, [r1, #2]
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #3
	bne _02346784
	cmp r7, #0
	beq _023467B4
	mov r0, fp
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _023467D4 ; =ov29_023531BC
	mov r0, #0
	mov r1, sl
	bl sub_02024FE8
	ldr r0, [sp, #4]
	ldr r1, _023467D8 ; =0x00000BDC
	bl LogMessageByIdWithPopupCheckUser
	b _023467B4
_02346784:
	mla r1, r8, r5, sl
	add r0, r6, r8, lsl #2
	mov r2, #1
	bl SpawnItem
#ifndef JAPAN
	mov r0, r8, lsl #2
	add r1, r6, r8, lsl #2
	ldrsh r0, [r6, r0]
	ldrsh r1, [r1, #2]
	bl DrawMinimapTile
#endif
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_023467B4:
	add r8, r8, #1
_023467B8:
	cmp r8, sb
	blt _02346724
	mov r0, r4
_023467C4:
	add sp, sp, #0x3ec
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_02346344_OFFSET -0x2C1
#else
#define OV29_02346344_OFFSET 0
#endif
_023467D0: .word 0x00000BDD + OV29_02346344_OFFSET
_023467D4: .word ov29_023531BC
_023467D8: .word 0x00000BDC + OV29_02346344_OFFSET
_023467DC: .word 0x00000BDE + OV29_02346344_OFFSET
_023467E0: .word DUNGEON_PTR
	arm_func_end ov29_02346344
