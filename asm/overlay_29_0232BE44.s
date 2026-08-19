	.include "asm/macros.inc"
	.include "overlay_29_0232BE44.inc"

	.text

	arm_func_start DoMoveRecycle
DoMoveRecycle: ; 0x0232BE44
#ifdef JAPAN
#define DO_MOVE_RECYCLE_OFFSET 4
#else
#define DO_MOVE_RECYCLE_OFFSET 0
#endif

	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r6, r0
	ldrb r0, [r1, #6]
	mov sb, #0
	cmp r0, #0
	bne _0232BF34
	ldr r7, _0232BF68 ; =DUNGEON_PTR
	ldr r8, _0232BF6C ; =BAG_ITEMS_PTR_MIRROR
	mov sl, sb
	mov fp, #6
_0232BE74:
	mul r4, sl, fp
	ldr r0, [r8]
	ldr r0, [r0, #0x384]
	ldrb r1, [r0, r4]
	add r2, r0, r4
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0232BF28
	ldrb r1, [r2]
	tst r1, #2
	ldreqsh r1, [r2, #4]
	cmpeq r1, #0xbb
	bne _0232BF28
	ldrh r1, [r2, #2]
	add r1, r1, #0xbc
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	cmp r1, #0xfe
	beq _0232BF28
	add r0, r0, r4
	mov r2, #0
	ldrb sb, [r0, #1]
	bl InitStandardItem
	ldr r0, [r8]
	cmp sb, #0
	ldr r0, [r0, #0x384]
	add r0, r0, r4
	strb sb, [r0, #1]
	beq _0232BF24
#ifdef JAPAN
	ldr r2, [r7]
	mov r0, #0x23c
	ldr r1, [r8]
	mla r0, sb, r0, r2
	ldr r1, [r1, #0x384]
	add r0, r0, #0x600
	add r2, r1, r4
	ldrh r1, [r1, r4]
#else
	ldr r1, [r8]
	ldr r2, [r7]
	add r0, sb, sb, lsl #3
	add r0, r2, r0, lsl #6
	ldr r2, [r1, #0x384]
	add r0, r0, #0x600
	ldrh r1, [r2, r4]
	add r2, r2, r4
#endif
	strh r1, [r0, #0x16 + DO_MOVE_RECYCLE_OFFSET]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x18 + DO_MOVE_RECYCLE_OFFSET]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x1a + DO_MOVE_RECYCLE_OFFSET]
_0232BF24:
	mov sb, #1
_0232BF28:
	add sl, sl, #1
	cmp sl, #0x32
	blt _0232BE74
_0232BF34:
	cmp sb, #0
	beq _0232BF50
	ldr r2, _0232BF70 ; =0x00000EF3
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232BF60
_0232BF50:
	ldr r2, _0232BF74 ; =0x00000EF4
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_0232BF60:
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232BF68: .word DUNGEON_PTR
_0232BF6C: .word BAG_ITEMS_PTR_MIRROR
#ifdef JAPAN
_0232BF70: .word 0x00000C35
_0232BF74: .word 0x00000C36
#else
_0232BF70: .word 0x00000EF3
_0232BF74: .word 0x00000EF4
#endif
	arm_func_end DoMoveRecycle
