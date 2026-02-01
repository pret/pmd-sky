	.include "asm/macros.inc"
	.include "overlay_29_022FBB1C.inc"

	.text

	arm_func_start ov29_022FBB1C
ov29_022FBB1C: ; 0x022FBB1C
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _022FBBE4 ; =DUNGEON_PTR
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r4, _022FBBE4 ; =DUNGEON_PTR
	ldr sl, _022FBBE8 ; =0x00019914
#endif
	mov r7, #0
	add r6, sp, #0
	mov r5, #3
_022FBB38:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBBD0
	ldr sb, [r8, #0xb4]
	ldr r2, [r4]
	ldrsh r1, [sb, #4]
	add r0, r8, #0x2c
	add r1, r2, r1, lsl #1
#ifdef JAPAN
	add r1, r1, #0x19800
	ldrsh r1, [r1, #0x70]
#else
	ldrsh r1, [r1, sl]
#endif
	strh r1, [r8, #0xa8]
	bl InitAnimationControlWithSet__0201C0CC
	ldrsh r1, [r8, #0xa8]
	add r0, r8, #0x2c
	bl SetSpriteIdForAnimationControl
	mov r0, r8
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r8
	bl ov29_02304830
	ldrh r0, [r8, #4]
	mov r2, r6
	mov r3, r5
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	ldr r0, [sb, #0xb0]
	ldrsh r1, [sb, #4]
	bl ov29_022DDA54
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTileSafe
	ldrb r0, [r0, #7]
	strb r0, [r8, #0x25]
_022FBBD0:
	add r7, r7, #1
	cmp r7, #0x14
	blt _022FBB38
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#else
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
#endif
	.align 2, 0
_022FBBE4: .word DUNGEON_PTR
#ifndef JAPAN
_022FBBE8: .word 0x00019914
#endif
	arm_func_end ov29_022FBB1C
