	.include "asm/macros.inc"
	.include "overlay_29_022E1618.inc"

	.text

	arm_func_start ov29_022E1618
ov29_022E1618: ; 0x022E1618
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end ov29_022E1618

	arm_func_start ov29_022E1620
ov29_022E1620: ; 0x022E1620
	ldr r0, [r0, #0xb4]
	bx lr
	arm_func_end ov29_022E1620

	arm_func_start GetTileAtEntity
GetTileAtEntity: ; 0x022E1628
	ldr ip, _022E163C ; =GetTileSafe
	mov r1, r0
	ldrsh r0, [r1, #4]
	ldrsh r1, [r1, #6]
	bx ip
	.align 2, 0
_022E163C: .word GetTileSafe
	arm_func_end GetTileAtEntity

	arm_func_start ov29_022E1640
ov29_022E1640: ; 0x022E1640
#ifdef JAPAN
#define OV29_022E1640_OFFSET -0xA4
#else
#define OV29_022E1640_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, #0
	ldr r4, _022E1848 ; =DUNGEON_PTR
	mov r5, r6
	mov r8, r6
	mov r7, #0xb8
_022E1658:
	ldr r2, [r4]
	add r0, r2, #0x1cc + OV29_022E1640_OFFSET
	add r0, r0, #0x12c00
	mla r1, r6, r7, r0
	add r0, r2, r6, lsl #2
	add r0, r0, #0x12000
	str r1, [r0, #0xb28 + OV29_022E1640_OFFSET]
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV29_022E1640_OFFSET]
	str r5, [r0]
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV29_022E1640_OFFSET]
	add r0, r0, #0x2c
	bl InitAnimationControlWithSet__0201C0CC
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV29_022E1640_OFFSET]
	add r6, r6, #1
	strh r8, [r0, #0xa8]
	cmp r6, #4
	blt _022E1658
	ldr r0, _022E184C ; =ov29_0237C754
	mov r7, #0
_022E16C8:
	strb r7, [r0, r8]
	add r8, r8, #1
	cmp r8, #0x48
	blt _022E16C8
	mov r5, #0
	ldr r4, _022E1848 ; =DUNGEON_PTR
	mov r6, r5
	mov r8, #0xb8
_022E16E8:
	ldr r2, [r4]
	add r0, r2, #0xac + OV29_022E1640_OFFSET
	add r0, r0, #0x13000
	mla r1, r7, r8, r0
	add r0, r2, r7, lsl #2
	add r0, r0, #0x12000
	str r1, [r0, #0xb38 + OV29_022E1640_OFFSET]
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb38 + OV29_022E1640_OFFSET]
	str r5, [r0]
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb38 + OV29_022E1640_OFFSET]
	add r0, r0, #0x2c
	bl InitAnimationControlWithSet__0201C0CC
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb38 + OV29_022E1640_OFFSET]
	add r7, r7, #1
	strh r6, [r0, #0xa8]
	cmp r7, #0x10
	blt _022E16E8
	ldr r0, _022E1850 ; =ov29_0237C79C
	mov r3, #0
_022E1758:
	strb r3, [r0, r6]
	add r6, r6, #1
	cmp r6, #0xae
	blt _022E1758
	ldr r2, _022E1848 ; =DUNGEON_PTR
	mov r0, #0
_022E1770:
	ldr r1, [r2]
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
	add r3, r3, #1
	str r0, [r1, #0xb78 + OV29_022E1640_OFFSET]
	cmp r3, #0x14
	blt _022E1770
	ldr r4, _022E1848 ; =DUNGEON_PTR
	mov r1, #0
	mov r3, #0xb8
_022E1798:
	ldr r6, [r4]
#ifdef JAPAN
	add r2, r6, #0x388
	add r2, r2, #0x13800
#else
	add r2, r6, #0x2c
	add r2, r2, #0x13c00
#endif
	mla r5, r0, r3, r2
	add r2, r6, r0, lsl #2
	add r2, r2, #0x12000
	str r5, [r2, #0xbc8 + OV29_022E1640_OFFSET]
	ldr r2, [r4]
	add r2, r2, r0, lsl #2
	add r2, r2, #0x12000
	ldr r2, [r2, #0xbc8 + OV29_022E1640_OFFSET]
	add r0, r0, #1
	str r1, [r2]
	cmp r0, #0x40
	blt _022E1798
	ldr r4, _022E1848 ; =DUNGEON_PTR
	mov r0, #0
	mov r3, #0xb8
_022E17E0:
	ldr r6, [r4]
	add r2, r6, #0x22c + OV29_022E1640_OFFSET
	add r2, r2, #0x16800
	mla r5, r1, r3, r2
	add r2, r6, r1, lsl #2
	add r2, r2, #0x12000
	str r5, [r2, #0xcc8 + OV29_022E1640_OFFSET]
	ldr r2, [r4]
	add r2, r2, r1, lsl #2
	add r2, r2, #0x12000
	ldr r2, [r2, #0xcc8 + OV29_022E1640_OFFSET]
	add r1, r1, #1
	str r0, [r2]
	cmp r1, #0x40
	blt _022E17E0
	ldr r2, _022E1848 ; =DUNGEON_PTR
	ldr r4, [r2]
#ifdef JAPAN
	add r1, r4, #0x388
	add r3, r1, #0x19400
#else
	add r1, r4, #0x2c
	add r3, r1, #0x19800
#endif
	add r1, r4, #0x12000
	str r3, [r1, #0xdc8 + OV29_022E1640_OFFSET]
	ldr r1, [r2]
	add r1, r1, #0x12000
	ldr r1, [r1, #0xdc8 + OV29_022E1640_OFFSET]
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022E1848: .word DUNGEON_PTR
_022E184C: .word ov29_0237C754
_022E1850: .word ov29_0237C79C
	arm_func_end ov29_022E1640

	arm_func_start ov29_022E1854
ov29_022E1854: ; 0x022E1854
#ifdef JAPAN
#define OV29_022E1854_OFFSET -0xA4
#else
#define OV29_022E1854_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r4, _022E1A18 ; =DUNGEON_PTR
	ldr r0, [r4]
	add r0, r0, #0x1a000
	ldrb r1, [r0, #0x23e + OV29_022E1854_OFFSET]
	ldrb r8, [r0, #0x245 + OV29_022E1854_OFFSET]
	cmp r1, #0
	beq _022E1900
	mov r6, #0
	add r8, sp, #4
	mov r7, r6
_022E1884:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78 + OV29_022E1854_OFFSET]
	mov r0, r5
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E18F0
	ldr r0, [r4]
	add r0, r0, #0x1a000
	ldr r0, [r0, #0x22c + OV29_022E1854_OFFSET]
	cmp r5, r0
	mov r0, r5
	bne _022E18C4
	bl ov29_02303F18
	b _022E18F0
_022E18C4:
	ldr sb, [r5, #0xb4]
	bl ov29_023046E8
	mov r0, r8
	mov r1, r5
	bl ov29_022E3A40
	str r7, [sp]
	ldrsh r1, [sb, #4]
	ldr r0, [sb, #0xb0]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	bl ov29_022DD7D8
_022E18F0:
	add r6, r6, #1
	cmp r6, #0x14
	blt _022E1884
	b _022E1A10
_022E1900:
	mov r5, #0
	mov r6, r5
_022E1908:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + OV29_022E1854_OFFSET]
	mov r0, r7
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E196C
	ldr r0, [r7]
	cmp r0, #1
	bne _022E196C
	mov r0, r7
	bl ov29_02303F18
	ldr r0, [r7, #0xb4]
#ifdef JAPAN
	ldrb r0, [r0, #0x161]
#else
	ldrb r0, [r0, #0x165]
#endif
	cmp r0, #0
	bne _022E196C
	mov r2, r6, lsl #0x10
	mov r0, r7
	mov r1, r5
	mov r2, r2, asr #0x10
	bl ov29_022E8270
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022E196C:
	add r6, r6, #1
	cmp r6, #4
	blt _022E1908
	ldr r4, _022E1A18 ; =DUNGEON_PTR
	mov r5, #0
_022E1980:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb38 + OV29_022E1854_OFFSET]
	mov r0, r6
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	beq _022E19A8
	mov r0, r6
	bl ov29_02303F18
_022E19A8:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022E1980
	mov sb, #0
	mov r7, sb
	mov r6, #1
	mov r5, #0xff
	ldr r4, _022E1A18 ; =DUNGEON_PTR
	b _022E19F0
_022E19CC:
	add r0, r1, sb, lsl #2
	str r7, [sp]
	add r0, r0, #0x12000
	ldr r0, [r0, #0xbc8 + OV29_022E1854_OFFSET]
	mov r1, r8
	mov r2, r6
	mov r3, r5
	bl ov29_023457C8
	add sb, sb, #1
_022E19F0:
	ldr r1, [r4]
	add r0, r1, #0x3f00
	ldrsh r0, [r0, #0xc0 + OV29_022E1854_OFFSET]
	cmp sb, r0
	blt _022E19CC
	cmp r8, #0
	beq _022E1A10
	bl ov29_022ED9D0
_022E1A10:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E1A18: .word DUNGEON_PTR
	arm_func_end ov29_022E1854
