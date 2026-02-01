	.include "asm/macros.inc"
	.include "overlay_29_022FBC4C.inc"

	.text

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
