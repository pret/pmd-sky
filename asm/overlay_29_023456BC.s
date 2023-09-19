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
	ldr r1, _023457C4 ; =0x02353538
	ldr r2, [r1]
	ldr r1, [r2, #0x7bc]
	sub r0, r1, r0
	str r0, [r2, #0x7bc]
	b _02345770
_02345754:
	mov r0, r4
	bl GetActualSellPrice
	ldr r1, _023457C4 ; =0x02353538
	ldr r2, [r1]
	ldr r1, [r2, #0x7c0]
	sub r0, r1, r0
	str r0, [r2, #0x7c0]
_02345770:
	mov r4, #0
	str r4, [r5, #0x10]
	ldr r5, _023457C4 ; =0x02353538
	mov r7, r4
	str r4, [r6]
_02345784:
	ldr r0, [r5]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xbc8]
	bl EntityIsValid__02345698
	cmp r0, #0
	addne r4, r7, #1
	add r7, r7, #1
	cmp r7, #0x40
	blt _02345784
	ldr r1, _023457C4 ; =0x02353538
	mov r0, #1
	ldr r1, [r1]
	add r1, r1, #0x3f00
	strh r4, [r1, #0xc0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023457C4: .word 0x02353538
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
	ldr r0, _02345A20 ; =0x02353538
	ldr r3, _02345A24 ; =0x0001A224
	ldr r2, [r0]
	add r0, r3, #2
	ldrsh r1, [r2, r0]
	add r0, r2, #0x1a000
	ldr sl, [r7, #0x10]
	ldr sb, [r7, #0x1c]
	ldr r0, [r0, #0x230]
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
	ldr r0, _02345A28 ; =0x0237C864
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
	ldr r0, _02345A28 ; =0x0237C864
	ldr r1, _02345A2C ; =0x023537BC
	ldrh r2, [r0, #2]
	ldrb r1, [r1, r5]
	ldr r3, _02345A30 ; =0x023537B4
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
	ldr r1, _02345A28 ; =0x0237C864
	mov r0, r0, lsl #0x1c
	ldrh r2, [r1, #4]
	bic r2, r2, #0xf000
	strh r2, [r1, #4]
	ldrh r2, [r1, #4]
	orr r0, r2, r0, lsr #16
	strh r0, [r1, #4]
_02345958:
	ldr r1, _02345A28 ; =0x0237C864
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
	ldr r0, _02345A38 ; =0x020AFC4C
	ldr r1, _02345A28 ; =0x0237C864
	ldr r0, [r0]
	bl sub_0201B9F8
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02345A18:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02345A20: .word 0x02353538
_02345A24: .word 0x0001A224
_02345A28: .word 0x0237C864
_02345A2C: .word 0x023537BC
_02345A30: .word 0x023537B4
_02345A34: .word 0xFFFF000F
_02345A38: .word 0x020AFC4C
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
	bl ov29_022E1A84
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
	ldr fp, _02345D68 ; =0x02351844
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
	ldr r2, _02345D6C ; =0x023531BC
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
_02345D64: .word 0x00000BD8
_02345D68: .word 0x02351844
_02345D6C: .word 0x023531BC
_02345D70: .word 0x00000BD9
_02345D74: .word 0x00000BDA
_02345D78: .word 0x00000BDB
_02345D7C: .word 0x00000BDF
_02345D80: .word 0x00000BDC
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
	ldr r0, _02346048 ; =0x02353538
	mov r4, #0
	ldr r0, [r0]
	ldr r1, _0234604C ; =SECONDARY_TERRAIN_TYPES
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4]
	mov r7, r4
	mov r8, r4
	ldrb r0, [r1, r0]
	mov r6, #1
	mov fp, #0
	cmp r0, #1
	ldrsh r0, [sl, #4]
	moveq r7, #1
	ldr r5, _02346050 ; =0x023518AC
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
	ldr r0, _02346048 ; =0x02353538
	ldrsh r2, [sp, #0x14]
	ldr r3, [r0]
	mov r0, #0x18
	ldrsh r1, [sp, #0x16]
	smulbb r2, r2, r0
	smulbb r1, r1, r0
	add r0, r3, #0x1a000
	add r2, r2, #4
	add r1, r1, #4
	ldrb fp, [r0, #0x245]
	mov r5, #0x10000
	mov r7, r2, lsl #8
	mov r8, r1, lsl #8
	mov r0, sl
	mov r1, r7
	mov r2, r8
	str r5, [sl, #0x1c]
	bl ov29_022E1A84
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
	bl ov29_022E1A84
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
	ldr r2, _02346054 ; =0x023531BC
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
_02346048: .word 0x02353538
_0234604C: .word SECONDARY_TERRAIN_TYPES
_02346050: .word 0x023518AC
_02346054: .word 0x023531BC
_02346058: .word 0x00000B74
_0234605C: .word 0x00000B75
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
	ldr r0, _023460D8 ; =0x022C4474
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
_023460D8: .word 0x022C4474
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
	ldr r1, _02346338 ; =0x022C48EC
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
	ldr r1, _0234633C ; =0x022C44C8
	ldrsh r1, [r1]
	cmp r1, r0
	movlt r5, #1
_02346230:
	cmp r5, #0
	movne r5, #0x67
	bne _02346310
	ldr r0, _02346340 ; =0x02353538
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
	ldr r0, _02346340 ; =0x02353538
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
	ldr r0, _02346340 ; =0x02353538
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
_02346338: .word 0x022C48EC
_0234633C: .word 0x022C44C8
_02346340: .word 0x02353538
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
	bl ov29_022E1A84
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
	bl __divsi3
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
	bl __divsi3
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
	ldr r2, _023467D4 ; =0x023531BC
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
	ldr r0, _023467E0 ; =0x02353538
	mov r6, #0
	ldr r0, [r0]
	mov fp, r6
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x245]
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
	bl ov29_022E1A90
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
	ldr r2, _023467D4 ; =0x023531BC
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
	mov r0, r8, lsl #2
	add r1, r6, r8, lsl #2
	ldrsh r0, [r6, r0]
	ldrsh r1, [r1, #2]
	bl DrawMinimapTile
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
_023467D0: .word 0x00000BDD
_023467D4: .word 0x023531BC
_023467D8: .word 0x00000BDC
_023467DC: .word 0x00000BDE
_023467E0: .word 0x02353538
	arm_func_end ov29_02346344

	arm_func_start HasHeldItem
HasHeldItem: ; 0x023467E4
	ldr r0, [r0, #0xb4]
	ldrb r2, [r0, #0x62]
	tst r2, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	moveq r0, #0
	bxeq lr
	tst r2, #8
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	movne r0, #0
	bxne lr
	ldrsh r0, [r0, #0x66]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end HasHeldItem

	arm_func_start GenerateMoneyQuantity
GenerateMoneyQuantity: ; 0x02346834
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x64
	mov r4, r1
	bl DungeonRandInt
	mov r3, #0
	ldr r2, _02346884 ; =0x020A1F20
	b _02346870
_02346854:
	ldr r1, [r2, r0, lsl #2]
	cmp r1, r4
	strleh r0, [r5, #2]
	ldmleia sp!, {r3, r4, r5, pc}
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	add r3, r3, #1
_02346870:
	cmp r3, #0xc8
	blt _02346854
	mov r0, #1
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02346884: .word 0x020A1F20
	arm_func_end GenerateMoneyQuantity

	arm_func_start ov29_02346888
ov29_02346888: ; 0x02346888
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _023468F8 ; =0x02353538
	mov r0, #7
	ldr r1, [r1]
	ldrb r4, [r1, #0xc]
	bl IsCurrentMissionType
	ldr r1, _023468F8 ; =0x02353538
	mov r0, #0
	ldr r2, [r1]
	strb r0, [r2, #0xc]
	ldr r1, [r1]
	ldrb r1, [r1, #0xc]
	cmp r1, #1
	cmpeq r4, #0
	bne _023468F0
	mov r2, r0
	mov r3, r0
	mov r1, #0xbe0
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _023468F0
	mov r0, #2
	mov r1, #1
	bl ov29_022E09E8
_023468F0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_023468F8: .word 0x02353538
	arm_func_end ov29_02346888

	arm_func_start ov29_023468FC
ov29_023468FC: ; 0x023468FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #5
	bne _023469D4
	ldrsh r0, [r4, #4]
	bl GetItemMoveId16
	mov r8, r0
	ldrsh r0, [r4, #4]
	bl IsHM
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r7, #0
	mov r6, r7
	mov r5, r7
	mov fp, r7
	ldr r4, _023469DC ; =0x02353538
	b _023469C4
_0234694C:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb28]
	mov r0, sl
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _023469C0
	ldr r1, [sl, #0xb4]
	mov r0, r8
	ldrsh r1, [r1, #2]
	bl sub_02053D1C
	mov sb, r0
	mov r0, sl
	bl ov29_023009A0
	cmp r0, #0
	movne sb, r6
	mov r0, sl
	mov r1, r8
	bl ov29_022FBA54
	cmp r0, #0
	movne sb, r5
	mov r0, sl
	bl ov29_022FBA70
	cmp r0, #0
	movne sb, fp
	cmp sb, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023469C0:
	add r7, r7, #1
_023469C4:
	cmp r7, #4
	blt _0234694C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023469D4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023469DC: .word 0x02353538
	arm_func_end ov29_023468FC

	arm_func_start ov29_023469E0
ov29_023469E0: ; 0x023469E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	ldr r5, _02346A60 ; =0x020AF6B8
	mov sl, r0
	mov r6, r8
	mov r7, #1
	mov fp, r8
	mov r4, #6
_02346A00:
	mul r1, r8, r4
	ldr r0, [r5]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sb, r2, r1
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02346A48
	ldrb r0, [sb]
	tst r0, sl
	beq _02346A48
	ldrb r0, [sb, #1]
	mov r1, fp
	bl ClearItem
	mov r0, sb
	bl ItemZInit
_02346A48:
	add r8, r8, #1
	cmp r8, #0x32
	blt _02346A00
	bl RemoveEmptyItemsInBag
	bl ov29_022FB920
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346A60: .word 0x020AF6B8
	arm_func_end ov29_023469E0

	arm_func_start ov29_02346A64
ov29_02346A64: ; 0x02346A64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	ldr r5, _02346BD0 ; =0x02353538
	mov r7, #0x55
	mov r6, r4
_02346A78:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28]
	mov r0, r8
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _02346AC4
	ldr sb, [r8, #0xb4]
	add r0, sb, #0x62
	bl IsLosableItem
	cmp r0, #0
	beq _02346AC4
	mov r1, r7
	mov r2, r6
	add r0, sb, #0x62
	ldrb r8, [sb, #0x63]
	bl InitStandardItem
	strb r8, [sb, #0x63]
_02346AC4:
	add r4, r4, #1
	cmp r4, #4
	blt _02346A78
	mov sb, #0
	mov r7, #1
	mov r6, sb
	mov r4, sb
	mov r5, r7
	mov fp, #0x55
_02346AE8:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	mov r8, r0
	ldrb r0, [r8]
	tst r0, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _02346B5C
	tst r0, #2
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02346B5C
	ldrsh r0, [r8, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02346B5C
	add r0, r8, #0x3e
	bl IsLosableItem
	cmp r0, #0
	beq _02346B5C
	mov r1, fp
	mov r2, #0
	add r0, r8, #0x3e
	ldrb sl, [r8, #0x3f]
	bl InitStandardItem
	strb sl, [r8, #0x3f]
_02346B5C:
	add sb, sb, #1
	cmp sb, #4
	blt _02346AE8
	mov r4, #0
	ldr r6, _02346BD4 ; =0x020AF6B8
	mov r8, #0x55
	mov r7, r4
	mov r5, #6
_02346B7C:
	ldr r0, [r6]
	ldr r0, [r0, #0x384]
	mla sb, r4, r5, r0
	mov r0, sb
	bl IsLosableItem
	cmp r0, #0
	beq _02346BB8
	mov r0, sb
	mov r1, r8
	mov r2, r7
	ldrb sl, [sb, #1]
	bl InitStandardItem
	mov r0, sb
	bl SetItemAcquired
	strb sl, [sb, #1]
_02346BB8:
	add r4, r4, #1
	cmp r4, #0x32
	blt _02346B7C
	bl RemoveEmptyItemsInBag
	bl ov29_022FB920
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346BD0: .word 0x02353538
_02346BD4: .word 0x020AF6B8
	arm_func_end ov29_02346A64

	arm_func_start CheckTeamItemsFlags
CheckTeamItemsFlags: ; 0x02346BD8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02346CB4 ; =0x020AF6B8
	mov r7, #0
	mov r5, r0
	ldr r8, [r1]
	mov r2, r7
	mov r3, #1
	mov r0, #6
	b _02346C30
_02346BFC:
	mul r4, r7, r0
	ldr r6, [r8, #0x384]
	ldrb r1, [r6, r4]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _02346C2C
	ldrb r1, [r6, r4]
	tst r1, r5
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02346C2C:
	add r7, r7, #1
_02346C30:
	cmp r7, #0x32
	blt _02346BFC
	bl RemoveEmptyItemsInBag
	bl ov29_022FB920
	mov r4, #0
	mov r7, r4
	mov r8, #1
	ldr r6, _02346CB8 ; =0x02353538
	b _02346CA4
_02346C54:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb28]
	mov r0, sb
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _02346CA0
	ldr r1, [sb, #0xb4]
	ldrb r0, [r1, #0x62]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _02346CA0
	ldrb r0, [r1, #0x62]
	tst r0, r5
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02346CA0:
	add r4, r4, #1
_02346CA4:
	cmp r4, #4
	blt _02346C54
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02346CB4: .word 0x020AF6B8
_02346CB8: .word 0x02353538
	arm_func_end CheckTeamItemsFlags

	arm_func_start ov29_02346CBC
ov29_02346CBC: ; 0x02346CBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov r8, #1
	ldr r5, _02346DA0 ; =0x020AF6B8
	mov r7, sb
	mov fp, sb
	mov r6, r8
	mov r4, #6
_02346CDC:
	mul r1, sb, r4
	ldr r0, [r5]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sl, r2, r1
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _02346D8C
	ldrb r0, [sl]
	bic r0, r0, #8
	strb r0, [sl]
	ldrsh r0, [sl, #4]
	cmp r0, #0xb7
	bne _02346D78
	mov r0, sl
	bl sub_0200D8AC
	bl AddMoneyCarried
	ldrb r0, [sl, #1]
	cmp r0, #0
	beq _02346D70
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	ldrb r1, [r0, #0x3e]
	tst r1, #1
	movne r1, r6
	moveq r1, fp
	tst r1, #0xff
	beq _02346D70
	ldrsh r1, [r0, #0x42]
	cmp r1, #0xb7
	bne _02346D70
	add r0, r0, #0x3e
	bl ItemZInit
_02346D70:
	mov r0, sl
	bl ItemZInit
_02346D78:
	ldrb r0, [sl]
	tst r0, #2
	beq _02346D8C
	mov r0, sl
	bl ItemZInit
_02346D8C:
	add sb, sb, #1
	cmp sb, #0x32
	blt _02346CDC
	bl RemoveEmptyItemsInBag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346DA0: .word 0x020AF6B8
	arm_func_end ov29_02346CBC

	arm_func_start ov29_02346DA4
ov29_02346DA4: ; 0x02346DA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl ov29_02346CBC
	bl RemoveEmptyItemsInBag
	bl ov29_022FB920
	mov r8, #0
	mov r7, #1
	mov r6, r8
	mov r4, r8
	mov r5, r7
_02346DC8:
	mov r0, r8
	bl GetActiveTeamMember
	mov sb, r0
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02346E30
	ldrb r0, [sb, #0x3e]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02346E30
	ldrb r0, [sb, #0x3e]
	bic r0, r0, #8
	strb r0, [sb, #0x3e]
	ldrsh r0, [sb, #0x42]
	cmp r0, #0xb7
	bne _02346E30
	add r0, sb, #0x3e
	bl sub_0200D8AC
	bl AddMoneyCarried
	add r0, sb, #0x3e
	bl ItemZInit
_02346E30:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02346DC8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02346DA4

	arm_func_start ov29_02346E48
ov29_02346E48: ; 0x02346E48
	stmdb sp!, {r3, lr}
	bl ov29_02346CBC
	bl sub_02057CE8
	bl sub_0200F910
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02346E48

	arm_func_start ov29_02346E5C
ov29_02346E5C: ; 0x02346E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r1, _02346EB8 ; =0x020AF6B8
	mov r3, r5
	mov ip, #1
	mov r0, #6
_02346E74:
	mul lr, r5, r0
	ldr r2, [r1]
	ldr r4, [r2, #0x384]
	ldrb r2, [r4, lr]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02346EA8
	ldrb r2, [r4, lr]
	tst r2, #4
	bicne r2, r2, #4
	strneb r2, [r4, lr]
_02346EA8:
	add r5, r5, #1
	cmp r5, #0x32
	blt _02346E74
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02346EB8: .word 0x020AF6B8
	arm_func_end ov29_02346E5C

	arm_func_start ov29_02346EBC
ov29_02346EBC: ; 0x02346EBC
	ldrb r1, [r0, #6]
	cmp r1, #0
	bne _02346F04
	ldr r1, _02346F0C ; =0x02353538
	mov r3, #0
	ldr r1, [r1]
	add r1, r1, #0x3f4
	add r2, r1, #0x400
	b _02346EFC
_02346EE0:
	add r1, r3, r3, lsl #3
	add r1, r2, r1, lsl #6
	cmp r1, r0
	ldreq r0, _02346F10 ; =0x023531C8
	ldreqb r0, [r0, r3]
	bxeq lr
	add r3, r3, #1
_02346EFC:
	cmp r3, #4
	blt _02346EE0
_02346F04:
	mov r0, #0
	bx lr
	.align 2, 0
_02346F0C: .word 0x02353538
_02346F10: .word 0x023531C8
	arm_func_end ov29_02346EBC

	arm_func_start AddHeldItemToBag
AddHeldItemToBag: ; 0x02346F14
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl GetCurrentBagCapacity
	ldr r1, _02346FB4 ; =0x020AF6B8
	mov lr, #0
	ldr r6, [r1]
	mov r2, lr
	mov r3, #1
	mov r1, #6
	b _02346FA4
_02346F3C:
	mul r4, lr, r1
	ldr ip, [r6, #0x384]
	ldrb ip, [ip, r4]
	tst ip, #1
	movne ip, r3
	moveq ip, r2
	tst ip, #0xff
	bne _02346FA0
	mov r0, r5
	bl ov29_02346EBC
	strb r0, [r5, #0x63]
	ldr r0, _02346FB4 ; =0x020AF6B8
	ldrh r1, [r5, #0x62]
	ldr r2, [r0]
	add r0, r5, #0x62
	ldr r2, [r2, #0x384]
	strh r1, [r2, r4]
	ldrh r1, [r5, #0x64]
	add r2, r2, r4
	strh r1, [r2, #2]
	ldrh r1, [r5, #0x66]
	strh r1, [r2, #4]
	bl SetItemAcquired
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02346FA0:
	add lr, lr, #1
_02346FA4:
	cmp lr, r0
	blt _02346F3C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02346FB4: .word 0x020AF6B8
	arm_func_end AddHeldItemToBag

	arm_func_start ov29_02346FB8
ov29_02346FB8: ; 0x02346FB8
	ldr r1, _02346FFC ; =0x02353538
	mov r3, #0
	ldr r1, [r1]
	add r1, r1, #0x56
	add r2, r1, #0x800
	b _02346FE4
_02346FD0:
	add r1, r3, r3, lsl #3
	add r1, r2, r1, lsl #6
	cmp r1, r0
	beq _02346FEC
	add r3, r3, #1
_02346FE4:
	cmp r3, #4
	blt _02346FD0
_02346FEC:
	cmp r3, #4
	mvneq r0, #0
	movne r0, r3
	bx lr
	.align 2, 0
_02346FFC: .word 0x02353538
	arm_func_end ov29_02346FB8

	arm_func_start ov29_02347000
ov29_02347000: ; 0x02347000
	ldr r1, _0234702C ; =0x022C4CD8
	b _02347018
_02347008:
	cmp r0, r2
	moveq r0, #1
	bxeq lr
	add r1, r1, #2
_02347018:
	ldrsh r2, [r1]
	cmp r2, #0
	bne _02347008
	mov r0, #0
	bx lr
	.align 2, 0
_0234702C: .word 0x022C4CD8
	arm_func_end ov29_02347000

	arm_func_start RemoveEmptyItemsInBagWrapper
RemoveEmptyItemsInBagWrapper: ; 0x02347030
	stmdb sp!, {r3, lr}
	bl RemoveEmptyItemsInBag
	bl ov29_022FB920
	ldmia sp!, {r3, pc}
	arm_func_end RemoveEmptyItemsInBagWrapper

	arm_func_start ov29_02347040
ov29_02347040: ; 0x02347040
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	ldr r5, _023470F8 ; =0x02353538
	ldr r6, _023470FC ; =0x020AF6B8
	mov fp, r8
	mov r7, #1
	mov r4, #6
_0234705C:
	mul sl, r8, r4
	ldr r0, [r6]
	ldr r1, [r0, #0x384]
	ldrb r0, [r1, sl]
	add r1, r1, sl
	tst r0, #1
	movne r0, r7
	moveq r0, fp
	tst r0, #0xff
	ldrneb r1, [r1, #1]
	cmpne r1, #0
	beq _023470E8
	ldr r0, [r5]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb24]
	mov r0, sb
	bl EntityIsValid__02345698
	cmp r0, #0
	bne _023470C0
	ldr r0, [r6]
	ldr r0, [r0, #0x384]
	add r0, r0, sl
	bl sub_0200D894
	b _023470E8
_023470C0:
	ldr r1, [r6]
	ldr r0, [sb, #0xb4]
	ldr r2, [r1, #0x384]
	ldrh r1, [r2, sl]
	add r2, r2, sl
	strh r1, [r0, #0x62]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x64]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x66]
_023470E8:
	add r8, r8, #1
	cmp r8, #0x32
	blt _0234705C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023470F8: .word 0x02353538
_023470FC: .word 0x020AF6B8
	arm_func_end ov29_02347040

	arm_func_start ov29_02347100
ov29_02347100: ; 0x02347100
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetLeader
	mov r4, r0
	bl ov29_022EBB8C
	mov r1, r0
	mov r0, r4
	mov r2, #0xa
	bl GetItemToUseByIndex
	mov r4, r0
	bl ov29_022EBB98
	cmp r0, #0x90
	bhs _0234717C
	mov r0, r4
	bl GetItemAction
	cmp r0, #0
	beq _0234717C
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_023468FC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0234717C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02347100

	arm_func_start ov29_02347184
ov29_02347184: ; 0x02347184
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	mov sb, #0
	mov r7, #1
	mov sl, r0
	mov r8, sb
	mov r6, sb
	mov fp, sb
	mov r5, r7
	add r4, sp, #0
_023471AC:
	mov r0, r8
	bl GetItemAtIdx
	cmp sl, #0
	beq _023471F4
	mov r2, sl
	b _023471E0
_023471C4:
	ldrsh r1, [r0, #4]
	cmp r3, r1
	bne _023471DC
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _023471EC
_023471DC:
	add r2, r2, #2
_023471E0:
	ldrsh r3, [r2]
	cmp r3, #0
	bne _023471C4
_023471EC:
	cmp r3, #0
	bne _02347224
_023471F4:
	ldrb r1, [r0]
	tst r1, #1
	movne r2, r7
	moveq r2, r6
	tst r2, #0xff
	beq _02347224
	tst r1, #8
	movne r1, r5
	moveq r1, fp
	tst r1, #0xff
	streq r0, [r4, sb, lsl #2]
	addeq sb, sb, #1
_02347224:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x32
	blt _023471AC
	cmp sb, #0
	moveq r0, #0
	beq _023472B8
	bl DungeonRand16Bit
	mov r1, sb
	bl __divsi3
	mov r0, r1, lsl #0x10
	add r1, sp, #0
	mov r0, r0, asr #0x10
	ldr r3, [r1, r0, lsl #2]
	ldrb r0, [r3]
	orr r0, r0, #8
	strb r0, [r3]
	ldrb r1, [r3, #1]
	cmp r1, #0
	beq _023472B4
	ldr r0, _023472C0 ; =0x02353538
	sub r1, r1, #1
	ldr r0, [r0]
	add r1, r1, r1, lsl #3
	add r0, r0, #0x56
	add r2, r0, #0x800
	ldrb r0, [r2, r1, lsl #6]
	mov r1, r1, lsl #6
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r2, r1]
	orrne r0, r0, #8
	strneb r0, [r2, r1]
_023472B4:
	ldrsh r0, [r3, #4]
_023472B8:
	add sp, sp, #0xc8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023472C0: .word 0x02353538
	arm_func_end ov29_02347184

	arm_func_start GenerateItem
GenerateItem: ; 0x023472C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r3
	mov r4, r1
	mov r3, #0
	mov r5, r0
	bl sub_0200CF6C
	mov r0, r4
	mov r6, #0
	bl IsNotMoney
	cmp r0, #0
	beq _02347324
	cmp r7, #0
	bne _0234731C
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02347374 ; =0x02353538
	ldr r1, [r1]
	add r1, r1, #0x28000
	ldrb r1, [r1, #0x6bc]
	cmp r0, r1
	movlt r6, #1
	b _02347324
_0234731C:
	cmp r7, #1
	moveq r6, #1
_02347324:
	cmp r6, #0
	ldrneb r0, [r5]
	orrne r0, r0, #8
	strneb r0, [r5]
	mov r0, r4
	bl GetItemCategoryVeneer
	cmp r0, #6
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02347374 ; =0x02353538
	ldr r1, [r0]
	ldr r0, [r1, #0x7cc]
	cmp r0, #0
	add r0, r1, #0x28000
	ldrb r2, [r0, #0x6c9]
	moveq r3, #5
	movne r3, #0x28
	mul r1, r2, r3
	mov r0, r5
	bl GenerateMoneyQuantity
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02347374: .word 0x02353538
	arm_func_end GenerateItem

	arm_func_start ov29_02347378
ov29_02347378: ; 0x02347378
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r3, _02347514 ; =0x02353538
	mov sl, r0
	ldr r0, [r3]
	cmp r2, #0
	add r0, r0, #0x1a000
	ldrb fp, [r0, #0x245]
	beq _023473B0
	cmp r2, #0
	beq _023473B8
	ldrb r0, [r0, #0x23e]
	cmp r0, #0
	bne _023473B8
_023473B0:
	mov r3, #1
	b _023473BC
_023473B8:
	mov r3, #0
_023473BC:
	ldrsh r2, [r1]
	ldrsh r1, [r1, #2]
	mov r0, #0x18
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r1, r2, #4
	add r0, r0, #4
	ands r4, r3, #0xff
	mov r8, r1, lsl #8
	mov sb, r0, lsl #8
	beq _023474CC
	ldr r5, [sl, #0xc]
	sub r0, r5, r8
	bl abs
	cmp r0, #0xc
	bge _02347410
	ldr r0, [sl, #0x10]
	sub r0, r0, sb
	bl abs
	cmp r0, #0xc
	blt _023474CC
_02347410:
	str r5, [sp, #0xc]
	ldr r0, [sl, #0x10]
	mov r6, #0
	str r0, [sp, #0x10]
	sub r0, r8, r5
	mov r1, #0x18
	mov r7, r6
	bl __divsi3
	ldr r1, [sp, #0x10]
	str r0, [sp, #8]
	sub r0, sb, r1
	mov r1, #0x18
	bl __divsi3
	str r0, [sp, #4]
	mov r5, r6
_0234744C:
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	add r0, r2, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r0, r1, r0
	str r0, [sp, #0x10]
	mov r0, r7
	bl sub_020018D0
	mov r1, #0xc
	mul r1, r0, r1
	str r1, [sl, #0x1c]
	mov r0, sl
	add r1, sp, #0xc
	bl UpdateEntityPixelPos
	mov r0, #0
	str r0, [sp]
	mov r0, sl
	mov r1, fp
	mov r2, #0
	and r3, r6, #0xff
	bl ov29_023457C8
	mov r0, #0x13
	bl AdvanceFrame
	tst r5, #3
	addeq r6, r6, #1
	add r5, r5, #1
	add r7, r7, #0x55
	and r6, r6, #7
	cmp r5, #0x18
	blt _0234744C
_023474CC:
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl ov29_022E1A84
	mov r5, #0
	str r5, [sl, #0x1c]
	cmp r4, #0
	beq _02347504
	mov r0, sl
	mov r1, fp
	mov r2, #1
	mov r3, #0xff
	str r5, [sp]
	bl ov29_023457C8
_02347504:
	mov r0, #0x13
	bl AdvanceFrame
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02347514: .word 0x02353538
	arm_func_end ov29_02347378

	arm_func_start ov29_02347518
ov29_02347518: ; 0x02347518
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x248
	ldr r4, _02347B3C ; =0x02353538
	mov sl, r0
	ldr r4, [r4]
	mov r6, #3
	add r0, r4, #0x1a000
	ldrb r0, [r0, #0x245]
	mov r5, #0
	mov sb, r3
	str r0, [sp, #0x20]
	str r6, [r4, #0xcc]
	mov r0, #1
	strb r5, [r4, #0xf0]
	strb r0, [r4, #0xec]
	strb r5, [r4, #0xee]
	mov r0, r1
	str r0, [r4, #0x180]
	str r5, [r4, #0xe8]
	ldrh r6, [r2]
	str r1, [sp, #8]
	mov r1, #0x18
	strh r6, [r4, #0xd0]
	ldrh r6, [r2, #2]
	add r0, r4, #0xcc
	ldr r8, [sp, #0x270]
	strh r6, [r4, #0xd2]
	ldrsh r3, [r2]
	ldrsh r2, [r2, #2]
	smulbb r3, r3, r1
	smulbb r2, r2, r1
	add r1, r3, #4
	mov r1, r1, lsl #8
	mov r2, r2, lsl #8
	bl ov29_022E1A84
	mov r0, r5
	str r0, [sp, #0x1c]
	strh r0, [r4, #0xf2]
	ldr r0, [sl]
	cmp r0, #1
	bne _023475D4
	mov r0, sl
	mov r1, #0x31
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x1c]
_023475D4:
	ldrsh r1, [r8, #2]
	mov r0, #1
	mov r6, #0
	str r1, [sp, #0x24]
	bl ov29_0234B4CC
_023475E8:
	ldrh r2, [r4, #0xd0]
	ldrh r1, [r4, #0xd2]
	ldrb r0, [r8, #1]
	strh r2, [sp, #0x44]
	strh r1, [sp, #0x46]
	cmp r0, #0
	beq _023476BC
	ldrb r0, [r8]
	cmp r0, #0
	bne _023476BC
	ldr r1, _02347B40 ; =0x0235171C
	mov r2, sb, lsl #2
	add r0, r1, sb, lsl #2
	ldrsh r7, [r4, #0xd0]
	ldrsh r3, [r1, r2]
	ldrsh r2, [r4, #0xd2]
	ldrsh r1, [r0, #2]
	add r0, r7, r3
	add r1, r2, r1
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	bne _023476BC
	ldrsh r0, [sp, #0x46]
	mov r7, #0
	str r0, [sp, #0x10]
	ldrsh r0, [sp, #0x44]
	str r0, [sp, #0xc]
	ldr r0, _02347B44 ; =0x023516FC
	add r0, r0, sb, lsl #2
	str r0, [sp, #0x28]
	b _023476B4
_02347668:
	ldr r0, [sp, #0x28]
	ldrb fp, [r7, r0]
	cmp fp, #8
	bge _023476B0
	ldr r0, _02347B40 ; =0x0235171C
	mov r1, fp, lsl #2
	ldrsh r1, [r0, r1]
	add r0, r0, fp, lsl #2
	ldrsh r2, [r0, #2]
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	ldr r1, [sp, #0x10]
	add r1, r1, r2
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	movne sb, fp
	bne _023476BC
_023476B0:
	add r7, r7, #1
_023476B4:
	cmp r7, #4
	blt _02347668
_023476BC:
	mov r0, sb, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, _02347B40 ; =0x0235171C
	mov r2, r1, lsl #2
	ldrh r2, [r0, r2]
	add r1, r0, r1, lsl #2
	ldrsh r3, [r4, #0xd0]
	strh r2, [sp, #0x3c]
	ldrsh r2, [sp, #0x3c]
	ldrh r1, [r1, #2]
	add r2, r3, r2
	strh r1, [sp, #0x3e]
	strh r2, [r4, #0xd0]
	ldrsh r1, [sp, #0x3e]
	ldrsh r2, [r4, #0xd2]
	add r1, r2, r1
	strh r1, [r4, #0xd2]
	ldrsh r2, [r4, #0xd0]
	cmp r2, #0
	ldrgesh r1, [r4, #0xd2]
	cmpge r1, #0
	blt _02347720
	cmp r2, #0x38
	cmplt r1, #0x20
	blt _02347728
_02347720:
	mov r7, #2
	b _02347978
_02347728:
	mov r2, sb, lsl #2
	add r1, r0, sb, lsl #2
	ldrsh r0, [r0, r2]
	ldrsh r1, [r1, #2]
	mov r7, #0
	mov r0, r0, lsl #0xa
	str r0, [sp, #0x14]
	and r0, sb, #0xff
	mov fp, r1, lsl #0xa
	str r0, [sp, #0x2c]
_02347750:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r0, r4, #0xcc
	mov r2, fp
	bl ov29_022E1A90
	bl IsWaterTileset
	cmp r0, #0
	ldr r0, [r4, #0xd8]
	ldr r1, [r4, #0xdc]
	movne r2, #3
	mov r0, r0, asr #8
	mov r1, r1, asr #8
	moveq r2, #0
	add r0, r0, #8
	add r1, r1, #0x10
	bl ov29_022E9488
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x2c]
	add r0, r4, #0xcc
	mov r2, #0
	bl ov29_023457C8
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x18]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _023477DC
	mov r0, #0x12
	bl AdvanceFrame
_023477DC:
	add r7, r7, #1
	cmp r7, #6
	blt _02347750
	ldrsh r0, [r4, #0xd0]
	ldrsh r1, [r4, #0xd2]
	bl GetTile
	mov r7, r0
	ldrh r0, [r7]
	tst r0, #3
	ldreqb r0, [r8]
	cmpeq r0, #0
	bne _02347824
	ldrh r1, [sp, #0x44]
	ldrh r0, [sp, #0x46]
	mov r7, #1
	strh r1, [r4, #0xd0]
	strh r0, [r4, #0xd2]
	b _02347978
_02347824:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _02347960
	ldrb r1, [r8]
	mov fp, #0
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, #1
	bne _02347870
	mov r1, #0x2d
	bl ItemIsActive__02347B50
	cmp r0, #0
	bne _0234786C
	ldr r0, [r7, #0xc]
	mov r1, #0x54
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _02347870
_0234786C:
	mov fp, #1
_02347870:
	cmp fp, #0
	beq _02347894
	add r5, r5, #1
	cmp r5, #2
	movge r7, #1
	bge _02347978
	add r0, sb, #4
	and sb, r0, #7
	b _02347960
_02347894:
	ldr r0, [r7, #0xc]
	mov fp, #1
	ldr r0, [r0]
	cmp r0, #1
	bne _0234791C
	add r0, sp, #0x34
	add r1, fp, #0x194
	bl InitMove
	ldr r0, [r7, #0xc]
	add r1, sp, #0x34
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	ldr r0, [sp, #8]
	mov r1, #1
	ldrsh r0, [r0, #4]
	movne fp, #0
	bl TestItemAiFlag
	cmp r0, #0
	bne _0234791C
	mov r0, sl
	mov r1, #0x2e
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _02347908
	mov r0, sl
	mov r1, #0x60
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _0234791C
_02347908:
	ldr r1, [r7, #0xc]
	mov r0, sl
	bl ov29_022FAFD4
	cmp r0, #0
	movne fp, #0
_0234791C:
	cmp fp, #0
	beq _02347960
	cmp r6, #0x40
	bge _02347950
	ldr r1, [r7, #0xc]
	add r2, sp, #0x48
	mov r0, sl
	str r1, [r2, r6, lsl #3]
	bl ov29_02348020
	add r1, sp, #0x48
	add r1, r1, r6, lsl #3
	strb r0, [r1, #4]
	add r6, r6, #1
_02347950:
	ldrb r0, [r8]
	cmp r0, #0
	moveq r7, #0
	beq _02347978
_02347960:
	ldr r0, [sp, #0x24]
	sub r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0
	bgt _023475E8
	mov r7, #1
_02347978:
	mov r0, #0
	bl ov29_0234B4CC
	mov r5, #0
	b _02347A94
_02347988:
	mov r0, sl
	bl EntityIsValid__02347BA4
	cmp r0, #0
	beq _02347A9C
	add r0, sp, #0x48
	ldr fp, [r0, r5, lsl #3]
	mov r0, fp
	bl EntityIsValid__02347BA4
	cmp r0, #0
	beq _02347A90
	add r0, sp, #0x48
	add r0, r0, r5, lsl #3
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02347A38
	mov r0, #0
	mov r1, fp
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B70
	ldr r2, _02347B48 ; =0x00000BE1
	mov r0, sl
	mov r1, fp
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, fp
	bl ov29_02307BDC
	mov r2, r0
	ldr r0, [sp, #0x1c]
	mov r3, sl
	cmp r0, #0
	ldreqb r0, [r8]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	and r1, r0, #0xff
	ldr r0, [sp, #8]
	str fp, [sp]
	str r0, [sp, #4]
	mov r0, #1
	bl ApplyItemEffect
	b _02347A90
_02347A38:
	ldrb r0, [r8]
	mov r1, fp
	cmp r0, #0
	mov r0, #0
	cmpeq r6, #1
	mov r2, r0
	moveq r7, #1
	bl SubstitutePlaceholderStringTags
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B44
	ldrb r0, [r8]
	mov r1, fp
	ldr r2, _02347B48 ; =0x00000BE1
	cmp r0, #0
	mov r0, sl
	beq _02347A88
	add r2, r2, #1
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02347A90
_02347A88:
	add r2, r2, #2
	bl LogMessageByIdWithPopupCheckUserTarget
_02347A90:
	add r5, r5, #1
_02347A94:
	cmp r5, r6
	blt _02347988
_02347A9C:
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	ldr r1, _02347B40 ; =0x0235171C
	mov r2, r0, lsl #2
	add r0, r1, r0, lsl #2
	ldrh r1, [r1, r2]
	ldrh r0, [r0, #2]
	cmp r7, #0
	strh r1, [sp, #0x30]
	strh r0, [sp, #0x32]
	ldrsh r1, [sp, #0x30]
	ldrsh r0, [sp, #0x32]
	mov r1, r1, lsl #3
	mov r0, r0, lsl #3
	strh r1, [sp, #0x40]
	strh r0, [sp, #0x42]
	beq _02347B34
	cmp r7, #1
	beq _02347AF4
	cmp r7, #2
	beq _02347B1C
	b _02347B34
_02347AF4:
	add r1, sp, #0x40
	str r1, [sp]
	mov r5, #0
	ldr r2, [sp, #8]
	mov r0, sl
	add r1, r4, #0xcc
	mov r3, #1
	str r5, [sp, #4]
	bl SpawnDroppedItem
	b _02347B34
_02347B1C:
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B70
	ldr r1, _02347B4C ; =0x00000BE5
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_02347B34:
	add sp, sp, #0x248
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02347B3C: .word 0x02353538
_02347B40: .word 0x0235171C
_02347B44: .word 0x023516FC
_02347B48: .word 0x00000BE1
_02347B4C: .word 0x00000BE5
	arm_func_end ov29_02347518

	arm_func_start ItemIsActive__02347B50
ItemIsActive__02347B50: ; 0x02347B50
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__02347B50

	arm_func_start ExclusiveItemEffectIsActive__02347B80
ExclusiveItemEffectIsActive__02347B80: ; 0x02347B80
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__02347B80
