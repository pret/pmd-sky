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

	arm_func_start ov29_022FBBEC
ov29_022FBBEC: ; 0x022FBBEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, #0
	ldr r6, _022FBC48 ; =DUNGEON_PTR
	b _022FBC38
_022FBC00:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xad4]
#else
	ldr r7, [r0, #0xb78]
#endif
	mov r0, r7
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBC34
	ldr r0, [r7, #0xb4]
	ldrb r0, [r0, #0xbc]
	cmp r5, r0
	moveq r0, r7
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022FBC34:
	add r4, r4, #1
_022FBC38:
	cmp r4, #0x14
	blt _022FBC00
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FBC48: .word DUNGEON_PTR
	arm_func_end ov29_022FBBEC

	arm_func_start ov29_022FBC4C
ov29_022FBC4C: ; 0x022FBC4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _022FBC90 ; =DUNGEON_PTR
	b _022FBC80
_022FBC5C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl EntityIsValid__022F7364
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r5, r5, #1
_022FBC80:
	cmp r5, #4
	blt _022FBC5C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FBC90: .word DUNGEON_PTR
	arm_func_end ov29_022FBC4C

	arm_func_start ov29_022FBC94
ov29_022FBC94: ; 0x022FBC94
	stmdb sp!, {r4, r5, r6, lr}
	bl GetBodySize
	ldr r6, _022FBD04 ; =DUNGEON_PTR
	mov r4, r0
	mov r5, #0
_022FBCA8:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBCE4
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	ldr r0, [r0, #0xb4]
	ldrsh r0, [r0, #2]
	bl GetBodySize
	add r4, r4, r0
_022FBCE4:
	add r5, r5, #1
	cmp r5, #4
	blt _022FBCA8
	cmp r4, #6
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FBD04: .word DUNGEON_PTR
	arm_func_end ov29_022FBC94

#ifndef JAPAN
	arm_func_start ov29_022FBD08
ov29_022FBD08: ; 0x022FBD08
	ldr r0, _022FBD20 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0xe1c]
	bx lr
	.align 2, 0
_022FBD20: .word DUNGEON_PTR
	arm_func_end ov29_022FBD08

	arm_func_start ov29_022FBD24
ov29_022FBD24: ; 0x022FBD24
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022FBD7C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1cc
	add r3, r0, #0x3c00
	ldr r2, [r3, #0x50]
	cmp r2, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xb4]
	mov r0, #1
	ldr r1, [r1, #0xb0]
	str r1, [r3, r2, lsl #2]
	ldr r1, [r3, #0x50]
	add r1, r1, #1
	str r1, [r3, #0x50]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FBD7C: .word DUNGEON_PTR
	arm_func_end ov29_022FBD24

	arm_func_start ov29_022FBD80
ov29_022FBD80: ; 0x022FBD80
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBDD4
	ldr r0, _022FBDDC ; =DUNGEON_PTR
	ldr r1, [r4, #0xb4]
	ldr r0, [r0]
	ldr r2, [r1, #0xb0]
	add r0, r0, #0x1cc
	add r1, r0, #0x3c00
	ldr ip, [r1, #0x50]
	mov r3, #0
	b _022FBDCC
_022FBDB8:
	ldr r0, [r1, r3, lsl #2]
	cmp r2, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r3, r3, #1
_022FBDCC:
	cmp r3, ip
	blt _022FBDB8
_022FBDD4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FBDDC: .word DUNGEON_PTR
	arm_func_end ov29_022FBD80
#endif
