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

	arm_func_start DisplayItem
DisplayItem: ; 0x023457C8
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
	ldr r0, _02345A38 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldr r1, _02345A28 ; =ov29_0237C864
	ldr r0, [r0]
	bl AddSimpleObjToOam
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
_02345A38: .word OBJ_GRAPHICS_CONTROLS_PTR
	arm_func_end DisplayItem
