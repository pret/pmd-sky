	.include "asm/macros.inc"
	.include "itcm_01FFB2C8.inc"

	.section .itcm,4,1,4

	arm_func_start CalculateAiTargetPos
CalculateAiTargetPos: ; 0x01FFB2C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FFB61C ; =DUNGEON_PTR
	mov sl, r0
	ldr r0, [r1]
	ldr sb, [sl, #0xb4]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	ldrb r4, [sl, #0x25]
	mov r5, #0
	cmp r0, #0xa5
	beq _01FFB304
	cmp r0, #0xaa
	blo _01FFB31C
	cmp r0, #0xdc
	bhs _01FFB31C
_01FFB304:
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #0x100
	movne r5, #1
_01FFB31C:
	cmp r5, #0
	bne _01FFB32C
	cmp r4, #0xff
	bne _01FFB3F0
_01FFB32C:
	ldrb r1, [sb, #0x4c]
	mov r0, sl
	mov r7, #0
	add r1, r1, #4
	and r6, r1, #7
	bl ov29_02301498
	cmp r0, #0
	beq _01FFB35C
	mov r0, #8
	bl DungeonRandInt
	strb r0, [sb, #0x4c]
	mov r7, #1
_01FFB35C:
	mov r5, #0
	ldr r4, _01FFB620 ; =FACING_DIRECTION_INCREMENTS
	add fp, sp, #1
	b _01FFB3E4
_01FFB36C:
	ldrb r1, [sb, #0x4c]
	ldr r0, [r4, r5, lsl #2]
	cmp r7, #0
	add r0, r1, r0
	and r8, r0, #7
	beq _01FFB38C
	cmp r8, r6
	beq _01FFB3E0
_01FFB38C:
	mov r0, sl
	mov r1, r8
	mov r2, fp
	bl CanAiMonsterMoveInDirection
	cmp r0, #0
	beq _01FFB3E0
	mov r0, #3
	strb r0, [sb, #0x7c]
	ldr r0, _01FFB624 ; =DIRECTIONS_XY
	mov r3, r8, lsl #2
	ldrsh r2, [r0, r3]
	ldrsh r4, [sl, #4]
	ldr r1, _01FFB628 ; =DIRECTIONS_XY + 2
	mov r0, #1
	add r2, r4, r2
	strh r2, [sb, #0x8c]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, r3]
	add r1, r2, r1
	strh r1, [sb, #0x8e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFB3E0:
	add r5, r5, #1
_01FFB3E4:
	cmp r5, #8
	blt _01FFB36C
	b _01FFB5D8
_01FFB3F0:
	ldr r0, _01FFB61C ; =DUNGEON_PTR
#ifdef JAPAN
	ldr r1, [sb, #0x11c]
	ldr r2, [r0]
	cmp r1, #0
	add r0, r2, r4, lsl #1
	add r1, r2, #0x204
	add r0, r0, #0xf100
	add r1, r1, #0xf000
	add r6, r1, r4, lsl #7
	ldrsh r5, [r0, #0xc4]
#else
	ldr r1, [sb, #0x120]
	ldr r2, [r0]
	cmp r1, #0
	add r0, r2, r4, lsl #1
	add r1, r2, #0x2a8
	add r0, r0, #0xf200
	add r1, r1, #0xf000
	add r6, r1, r4, lsl #7
	ldrsh r5, [r0, #0x68]
#endif
	beq _01FFB460
	mov r0, #8
	bl DungeonRandInt
	mov r1, #6
	strb r1, [sb, #0x7c]
	mov r3, r0, lsl #2
	ldr r0, _01FFB624 ; =DIRECTIONS_XY
	ldrsh r4, [sl, #4]
	ldrsh r2, [r0, r3]
	ldr r1, _01FFB628 ; =DIRECTIONS_XY + 2
	mov r0, #1
	add r2, r4, r2
	strh r2, [sb, #0x8c]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, r3]
	add r1, r2, r1
	strh r1, [sb, #0x8e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFB460:
	ldrb r0, [sb, #0x7c]
	cmp r0, #4
	beq _01FFB520
	cmp r5, #0
	bne _01FFB4B8
	mov r0, #8
	bl DungeonRandInt
	mov r1, #6
	strb r1, [sb, #0x7c]
	mov r3, r0, lsl #2
	ldr r0, _01FFB624 ; =DIRECTIONS_XY
	ldrsh r4, [sl, #4]
	ldrsh r2, [r0, r3]
	ldr r1, _01FFB628 ; =DIRECTIONS_XY + 2
	mov r0, #1
	add r2, r4, r2
	strh r2, [sb, #0x8c]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, r3]
	add r1, r2, r1
	strh r1, [sb, #0x8e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFB4B8:
	mov r4, #0
	b _01FFB518
_01FFB4C0:
	mov r0, r5
	bl DungeonRandInt
	mov r2, r0, lsl #2
	ldrsh r3, [sl, #4]
	ldrsh r1, [r6, r2]
	cmp r3, r1
	addeq r1, r6, r2
	ldreqsh r2, [sl, #6]
	ldreqsh r1, [r1, #2]
	cmpeq r2, r1
	beq _01FFB514
	mov r1, #4
	strb r1, [sb, #0x7c]
	mov r1, r0, lsl #2
	ldrsh r2, [r6, r1]
	add r1, r6, r0, lsl #2
	mov r0, #1
	strh r2, [sb, #0x8c]
	ldrsh r1, [r1, #2]
	strh r1, [sb, #0x8e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFB514:
	add r4, r4, #1
_01FFB518:
	cmp r4, #0xa
	blt _01FFB4C0
_01FFB520:
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldrh r0, [r0]
	tst r0, #8
	beq _01FFB5D0
	mov r0, #8
	bl DungeonRandInt
	mov r8, r0
	mov r5, #0
	add fp, sp, #0
	ldr r4, _01FFB624 ; =DIRECTIONS_XY
	b _01FFB5C8
_01FFB554:
	and r8, r8, #7
	mov r1, r8, lsl #2
	add r0, r4, r8, lsl #2
	ldrsh r6, [sl, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r0, #2]
	add r6, r6, r3
	mov r0, r6
	add r7, r2, r1
	mov r1, r7
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	bne _01FFB5C0
	mov r0, sl
	mov r1, r8
	mov r2, fp
	bl CanAiMonsterMoveInDirection
	cmp r0, #0
	beq _01FFB5C0
	mov r0, #3
	strb r0, [sb, #0x7c]
	strh r6, [sb, #0x8c]
	strh r7, [sb, #0x8e]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFB5C0:
	add r5, r5, #1
	add r8, r8, #1
_01FFB5C8:
	cmp r5, #8
	blt _01FFB554
_01FFB5D0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFB5D8:
	mov r0, #8
	bl DungeonRandInt
	mov r1, #6
	strb r1, [sb, #0x7c]
	mov r3, r0, lsl #2
	ldr r0, _01FFB624 ; =DIRECTIONS_XY
	ldrsh r4, [sl, #4]
	ldrsh r2, [r0, r3]
	ldr r1, _01FFB628 ; =DIRECTIONS_XY + 2
	mov r0, #1
	add r2, r4, r2
	strh r2, [sb, #0x8c]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r1, r3]
	add r1, r2, r1
	strh r1, [sb, #0x8e]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FFB61C: .word DUNGEON_PTR
_01FFB620: .word FACING_DIRECTION_INCREMENTS
_01FFB624: .word DIRECTIONS_XY
_01FFB628: .word DIRECTIONS_XY + 2
	arm_func_end CalculateAiTargetPos

	arm_func_start sub_01FFB62C
sub_01FFB62C: ; 0x01FFB62C
	ldr r3, [r0, #0xb4]
	mov r2, #0
	strb r2, [r3, #0x7c]
	ldrh r1, [r0, #4]
	strh r1, [r3, #0x8c]
	ldrh r0, [r0, #6]
	strh r0, [r3, #0x8e]
	str r2, [r3, #0x84]
	strh r2, [r3, #0x80]
	bx lr
	arm_func_end sub_01FFB62C

	.global _01FFB654
_01FFB654:
	.byte 0x05, 0x03, 0x00, 0x00
