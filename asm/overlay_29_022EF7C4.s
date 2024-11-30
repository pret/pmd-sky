	.include "asm/macros.inc"
	.include "overlay_29_022EF7C4.inc"

	.text

	arm_func_start ov29_022EF7C4
ov29_022EF7C4: ; 0x022EF7C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r2
	cmp r1, #5
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r4, _022EF89C ; =DUNGEON_PTR
	ldr r0, [r4]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x26]
#else
	ldrb r0, [r0, #0xca]
#endif
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #3
	beq _022EF874
	mov r5, #1
	mov r6, #0
	b _022EF84C
_022EF804:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa94]
#else
	ldr sb, [r0, #0xb38]
#endif
	cmp r8, sb
	beq _022EF840
	mov r0, sb
	bl EntityIsValid__022EF7A0
	cmp r0, #0
	beq _022EF840
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	moveq r5, #0
	beq _022EF854
_022EF840:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_022EF84C:
	cmp r6, #0x10
	blt _022EF804
_022EF854:
	cmp r5, #0
	beq _022EF874
	mov r0, #0x64
	bl ov29_0234BA54
	ldr r0, _022EF89C ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #6]
_022EF874:
	cmp r7, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022EF89C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022EF8A0 ; =0x000003E7
	bl ChangeDungeonMusic
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022EF89C: .word DUNGEON_PTR
_022EF8A0: .word 0x000003E7
	arm_func_end ov29_022EF7C4

	arm_func_start ov29_022EF8A4
ov29_022EF8A4: ; 0x022EF8A4
#ifdef JAPAN
#define OV29_022EF8A4_OFFSET -0xA4
#else
#define OV29_022EF8A4_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, #1
	ldr r5, _022EF934 ; =DUNGEON_PTR
	mov r7, r8
	mov r6, #0
	mvn r4, #0
_022EF8BC:
	ldr r0, [r5]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb28 + OV29_022EF8A4_OFFSET]
	cmp sb, #0
	beq _022EF918
	mov r0, sb
	bl EntityIsValid__022EF7A0
	cmp r0, #0
	ldrne r0, [r5]
	addne r0, r0, r8, lsl #2
	addne r0, r0, #0xcc00
	ldrnesh r1, [r0, #0xec + OV29_022EF8A4_OFFSET]
	cmpne r1, r4
	ldrnesh r2, [r0, #0xee + OV29_022EF8A4_OFFSET]
	cmpne r2, r4
	beq _022EF918
	mov r0, sb
	mov r3, r7
	bl MoveMonsterToPos
	mov r0, sb
	mov r1, r6
	bl UpdateEntityPixelPos
_022EF918:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022EF8BC
	bl ov29_023444D4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022EF934: .word DUNGEON_PTR
	arm_func_end ov29_022EF8A4

	arm_func_start ov29_022EF938
ov29_022EF938: ; 0x022EF938
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _022EF9B4 ; =DUNGEON_PTR
	mov r4, #0
	mov r6, #4
_022EF948:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	cmp r7, #0
	beq _022EF99C
	mov r0, r7
	bl EntityIsValid__022EF7A0
	cmp r0, #0
	beq _022EF99C
	ldr r0, [r5]
	add r0, r0, r4
	add r0, r0, #0xc000
#ifdef JAPAN
	ldrb r1, [r0, #0xc68]
#else
	ldrb r1, [r0, #0xd0c]
#endif
	mov r0, r7
	cmp r1, #0xff
	beq _022EF994
	bl ov29_022FA360
	b _022EF99C
_022EF994:
	mov r1, r6
	bl ov29_022FA360
_022EF99C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	blt _022EF948
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022EF9B4: .word DUNGEON_PTR
	arm_func_end ov29_022EF938

	arm_func_start ov29_022EF9B8
ov29_022EF9B8: ; 0x022EF9B8
	bx lr
	arm_func_end ov29_022EF9B8

	arm_func_start ov29_022EF9BC
ov29_022EF9BC: ; 0x022EF9BC
	ldr ip, _022EF9C4 ; =ov29_02348F20
	bx ip
	.align 2, 0
_022EF9C4: .word ov29_02348F20
	arm_func_end ov29_022EF9BC

	arm_func_start ov29_022EF9C8
ov29_022EF9C8: ; 0x022EF9C8
	stmdb sp!, {r3, lr}
	bl IsFloorOver
	cmp r0, #0
	ldreq r0, _022EF9E8 ; =DUNGEON_PTR
	ldreq r0, [r0]
	ldreqb r0, [r0, #6]
	cmpeq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EF9E8: .word DUNGEON_PTR
	arm_func_end ov29_022EF9C8
