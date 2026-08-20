	.include "asm/macros.inc"
	.include "overlay_29_022F2B3C.inc"

	.text

	arm_func_start ov29_022F2B3C
ov29_022F2B3C: ; 0x022F2B3C
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022F2B6C
	ldrb r1, [r0, #8]
	cmp r1, #0
	ldreqb r1, [r0, #9]
	cmpeq r1, #0
	bne _022F2B6C
	ldrb r0, [r0, #0xbc]
	cmp r0, #7
	movne r0, #1
	bxne lr
_022F2B6C:
	mov r0, #0
	bx lr
	arm_func_end ov29_022F2B3C

	arm_func_start ov29_022F2B74
ov29_022F2B74: ; 0x022F2B74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r1, _022F2FBC ; =DUNGEON_PTR
	ldr r8, _022F2FC0 ; =ov29_0237C9A4
	ldr r1, [r1]
	ldrb r2, [r8, #1]
#ifdef JAPAN
	add r1, r1, #0x178
#else
	add r1, r1, #0x21c
#endif
	str r0, [sp]
	cmp r2, #0
	add r5, r1, #0x1a000
	beq _022F2D58
	ldr r0, _022F2FC4 ; =0x0000013F
	mov r6, #0x400
	rsb r6, r6, #0
	add r0, r0, #0x9c
	mov r4, #0
	str r0, [sp, #8]
	add r7, r6, #0x200
_022F2BBC:
	ldr r0, _022F2FC8 ; =ov29_023526D8
	mov r1, #6
	ldrh r2, [sp, #0x10]
	mla r0, r4, r1, r0
	bic r1, r2, #0x100
	strh r1, [sp, #0x10]
	ldrh r2, [sp, #0x10]
	ldrb r1, [r0, #5]
	bic r2, r2, #0x200
	strh r2, [sp, #0x10]
	cmp r1, #0
	ldrh r1, [sp, #0x10]
	movne r2, #0x10
	moveq r2, #0
	bic r1, r1, #0xc00
	strh r1, [sp, #0x10]
	ldrh r1, [sp, #0x10]
	orr r1, r1, #0x400
	strh r1, [sp, #0x10]
	ldrh r1, [sp, #0x10]
	bic r1, r1, #0x1000
	strh r1, [sp, #0x10]
	ldrh r1, [sp, #0x10]
	bic r1, r1, #0x2000
	strh r1, [sp, #0x10]
	ldrh r1, [sp, #0x10]
	orr r1, r1, #0x2000
	strh r1, [sp, #0x10]
	ldrh r1, [sp, #0x10]
	bic r1, r1, #0xc000
	strh r1, [sp, #0x10]
	ldrb r1, [r0, #4]
	cmp r1, #0
	movne r1, #8
	moveq r1, #0
	add r1, r1, r2
	ldrh r3, [sp, #0x12]
	mov sb, r1, lsl #0x1b
	ldrh r1, [sp, #0x16]
	ldrh r2, [sp, #0x14]
	bic r3, r3, #0x3e00
	bic r1, r1, #1
	and r2, r2, r6
	strh r3, [sp, #0x12]
	strh r1, [sp, #0x16]
	strh r2, [sp, #0x14]
	ldrh r1, [sp, #0x12]
	ldrh r3, [sp, #0x14]
	ldrh r2, [sp, #0x16]
	orr r1, r1, sb, lsr #18
	strh r1, [sp, #0x12]
	ldr r1, [sp, #8]
	ldrsh fp, [r0]
	orr r1, r3, r1
	strh r1, [sp, #0x14]
	bic r1, r2, #2
	strh r1, [sp, #0x16]
	ldrh r1, [sp, #0x14]
	ldrh r2, [sp, #0x12]
	ldrsh sb, [r0, #2]
	bic r1, r1, #0xc00
	bic r2, r2, #0xc000
	strh r1, [sp, #0x14]
	strh r2, [sp, #0x12]
	ldrh r2, [sp, #0x14]
	ldrh r0, [sp, #0x12]
	ldrh r1, [sp, #0x16]
	orr r2, r2, #0x800
	strh r2, [sp, #0x14]
	ldrh r2, [sp, #0x14]
	and sl, r0, r7
	ldr r0, _022F2FCC ; =0xFFFF000F
	bic r2, r2, #0xf000
	strh r2, [sp, #0x14]
	ldrsh ip, [r8, #4]
	and r3, r1, r0
	ldr r0, _022F2FD0 ; =OBJ_GRAPHICS_CONTROLS_PTR
	add ip, ip, ip, lsr #31
	strh r3, [sp, #0x16]
	mov r3, ip, asr #1
	and r3, r3, #7
	add r3, r3, #0xa
	strh sl, [sp, #0x12]
	mul sl, fp, r3
	mul r3, sb, r3
	add sb, sl, #0x7c
	and sl, sb, r6, lsr #23
	ldrh fp, [sp, #0x12]
	add r3, r3, #0x62
	ldrh sb, [sp, #0x16]
	mov r3, r3, lsl #0x14
	orr sl, fp, sl
	orr r3, sb, r3, lsr #16
	ldr r0, [r0]
	ldr r2, _022F2FC4 ; =0x0000013F
	add r1, sp, #0x10
	strh sl, [sp, #0x12]
	strh r3, [sp, #0x16]
	bl AddSimpleObjToOam
	add r4, r4, #1
	cmp r4, #4
	blt _022F2BBC
	b _022F2F7C
_022F2D58:
	ldrb r0, [r5, #0x35]
	cmp r0, #0
	beq _022F2F7C
	ldrb r3, [r5, #0x36]
	cmp r3, #0
	blt _022F2F7C
	cmp r3, #8
	bge _022F2F7C
	ldrb r0, [r8, #3]
	ldr r2, _022F2FC0 ; =ov29_0237C9A4
	cmp r0, #0
	ldrneb r0, [r8]
	ldrsh r2, [r2, #4]
	cmpne r0, #0
	mov r0, #0xc
	mul r1, r3, r0
	add r2, r2, r2, lsr #31
	ldr r0, _022F2FD4 ; =ov29_023526F0
	mov r2, r2, asr #1
	and r2, r2, #7
	ldr r3, _022F2FD8 ; =ov29_023526F2
	add r7, r2, #0xa
	ldrsh r4, [r0, r1]
	ldrsh r2, [r3, r1]
	movne sl, #3
	moveq sl, #1
	mul r3, r2, r7
	mul r6, r4, r7
	add r7, r6, #0x7c
	cmp sl, #0
	add r8, r3, #0x62
	mov r6, #0
	ble _022F2F7C
	ldr r3, _022F2FDC ; =ov29_023526F4
	mov r4, #0x400
	ldr r2, _022F2FE0 ; =0x000003FF
	ldr r3, [r3, r1]
	add sb, r0, r1
	sub r0, r2, #0x2c0
	rsb r4, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0x200
	and fp, r3, r2
	str r0, [sp, #0xc]
	b _022F2F74
_022F2E0C:
	ldrh r1, [sp, #0x10]
	ldrb r0, [sb, #9]
	ldrh r3, [sp, #0x12]
	bic r1, r1, #0x100
	strh r1, [sp, #0x10]
	cmp r0, #0
	ldrh r0, [sp, #0x10]
	movne r1, #0x10
	ldrh r2, [sp, #0x14]
	bic r0, r0, #0x200
	strh r0, [sp, #0x10]
	ldrh r0, [sp, #0x10]
	bic r3, r3, #0x3e00
	strh r3, [sp, #0x12]
	bic r0, r0, #0xc00
	strh r0, [sp, #0x10]
	ldrh r0, [sp, #0x10]
	and r2, r2, r4
	strh r2, [sp, #0x14]
	orr r0, r0, #0x400
	strh r0, [sp, #0x10]
	ldrh r0, [sp, #0x10]
	moveq r1, #0
	ldrh r3, [sp, #0x12]
	bic r0, r0, #0x1000
	strh r0, [sp, #0x10]
	ldrh r0, [sp, #0x10]
	ldrh r2, [sp, #0x14]
	bic r0, r0, #0x2000
	strh r0, [sp, #0x10]
	ldrh r0, [sp, #0x10]
	orr r0, r0, #0x2000
	strh r0, [sp, #0x10]
	ldrh r0, [sp, #0x10]
	bic r0, r0, #0xc000
	strh r0, [sp, #0x10]
	ldrb r0, [sb, #8]
	cmp r0, #0
	movne r0, #8
	moveq r0, #0
	add r0, r0, r1
	ldrh r1, [sp, #0x16]
	mov r0, r0, lsl #0x1b
	orr r0, r3, r0, lsr #18
	bic r1, r1, #1
	strh r1, [sp, #0x16]
	strh r0, [sp, #0x12]
	orr r0, r2, fp
	ldrh r2, [sp, #0x12]
	ldrh r1, [sp, #0x16]
	strh r0, [sp, #0x14]
	bic r2, r2, #0xc000
	bic r0, r1, #2
	ldrh r1, [sp, #0x14]
	strh r2, [sp, #0x12]
	strh r0, [sp, #0x16]
	bic r1, r1, #0xc00
	strh r1, [sp, #0x14]
	ldrh r1, [sp, #0x14]
	ldrh r3, [sp, #0x12]
	ldrh r2, [sp, #0x16]
	orr r1, r1, #0x800
	strh r1, [sp, #0x14]
	ldr r1, [sp, #0xc]
	and r0, r7, r4, lsr #23
	and r1, r3, r1
	strh r1, [sp, #0x12]
	ldr r1, _022F2FCC ; =0xFFFF000F
	ldrh r3, [sp, #0x14]
	and r1, r2, r1
	ldrh r2, [sp, #0x12]
	strh r1, [sp, #0x16]
	bic r3, r3, #0xf000
	orr r0, r2, r0
	strh r0, [sp, #0x12]
	ldrh r1, [sp, #0x16]
	mov r0, r8, lsl #0x14
	ldr r2, [sp, #4]
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x16]
	ldr r0, _022F2FD0 ; =OBJ_GRAPHICS_CONTROLS_PTR
	add r1, sp, #0x10
	ldr r0, [r0]
	strh r3, [sp, #0x14]
	bl AddSimpleObjToOam
	ldrsh r1, [sb]
	ldrsh r0, [sb, #2]
	add r6, r6, #1
	add r7, r7, r1, lsl #2
	add r8, r8, r0, lsl #2
_022F2F74:
	cmp r6, sl
	blt _022F2E0C
_022F2F7C:
	ldr r0, _022F2FC0 ; =ov29_0237C9A4
	ldrb r1, [r0, #2]
	cmp r1, #0
	ldrneb r2, [r5, #0x36]
	ldrneb r1, [r5, #0x37]
	cmpne r1, r2
	beq _022F2FB4
	strb r2, [r5, #0x37]
	ldrb r3, [r0, #2]
	ldr r0, [sp]
	ldrb r1, [r5, #0x36]
	add r0, r0, #4
	mov r2, #0
	bl DrawTileGrid
_022F2FB4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F2FBC: .word DUNGEON_PTR
_022F2FC0: .word ov29_0237C9A4
_022F2FC4: .word 0x0000013F
_022F2FC8: .word ov29_023526D8
_022F2FCC: .word 0xFFFF000F
_022F2FD0: .word OBJ_GRAPHICS_CONTROLS_PTR
_022F2FD4: .word ov29_023526F0
_022F2FD8: .word ov29_023526F2
_022F2FDC: .word ov29_023526F4
_022F2FE0: .word 0x000003FF
	arm_func_end ov29_022F2B74

	arm_func_start ov29_022F2FE4
ov29_022F2FE4: ; 0x022F2FE4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022F3084 ; =DUNGEON_PTR
	ldr r2, _022F3088 ; =DUNGEON_BUTTON_INPUT
	ldr r6, [r1]
	mov r4, #0
	ldrb r5, [r6, #0x78c]
	ldrb r0, [r6, #0x78b]
	ldrh r7, [r2]
	sub r3, r4, #1
	orr r0, r5, r0
	strb r0, [r6, #0x78c]
	ldr r0, [r1]
	and r5, r7, #0xf0
	strb r4, [r0, #0x78b]
	ldr r0, [r1]
	mov r8, #0x54
	add r0, r0, #0x100
	strh r3, [r0, #0xd8]
	ldr r0, [r1]
	ldr r7, _022F3088 ; =DUNGEON_BUTTON_INPUT
	add r0, r0, #0x100
	strh r3, [r0, #0xda]
	ldrh r0, [r2]
	ldr r6, _022F3084 ; =DUNGEON_PTR
	tst r0, #0x100
	movne r4, #1
	b _022F3070
_022F3050:
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r7]
	and r0, r0, #0xf0
	tst r5, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	bl AdvanceFrame
_022F3070:
	ldr r0, [r6]
	ldrb r0, [r0, #0x78c]
	cmp r0, #0
	bne _022F3050
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F3084: .word DUNGEON_PTR
_022F3088: .word DUNGEON_BUTTON_INPUT
	arm_func_end ov29_022F2FE4

	arm_func_start ShouldLeaderKeepRunning
ShouldLeaderKeepRunning: ; 0x022F308C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	ldr r0, _022F35D4 ; =DUNGEON_PTR
	ldr r5, [r0]
	bl GetLeader
	mov r4, r0
	ldrsh sl, [r4, #4]
	ldrsh sb, [r4, #6]
	ldr r2, [r4, #0xb4]
	mov r0, sl
	mov r1, sb
	ldrb r7, [r2, #0x4c]
	bl GetTile
	ldrb r1, [r5, #0x78b]
	ldr r3, _022F35D8 ; =DIRECTIONS_XY
	mov r5, r7, lsl #2
	ldr r2, _022F35DC ; =DIRECTIONS_XY + 2
	ldrsh r6, [r3, r5]
	mov r8, r0
	cmp r1, #0
	ldrsh r5, [r2, r5]
	moveq r0, #0
	beq _022F35CC
	ldr r0, [r8, #0x10]
	cmp r0, #0
	movne r0, #0
	bne _022F35CC
	add r1, sp, #0x4c
	mov r0, r4
	strh sl, [sp, #0x4c]
	strh sb, [sp, #0x4e]
	bl ov29_022FFA94
	cmp r0, #0
	movne r0, #0
	bne _022F35CC
	mov r0, r4
	mov r1, r7
	bl ov29_02300FCC
	cmp r0, #0
	moveq r0, #0
	beq _022F35CC
	ldrb r0, [r8, #7]
	str r0, [sp, #0x10]
	cmp r0, #0xff
	bne _022F3160
	add r0, sl, r6
	add r1, sb, r5
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r0, #0xff
	beq _022F3170
	mov r0, #0
	b _022F35CC
_022F3160:
	ldrh r0, [r8]
	tst r0, #8
	movne r0, #0
	bne _022F35CC
_022F3170:
	mvn r6, #0
	ldr r5, _022F35D8 ; =DIRECTIONS_XY
	b _022F31C4
_022F317C:
	add r0, r7, r6
	mov r0, r0, lsl #0x1d
	mov r1, r0, lsr #0x1b
	add r0, r5, r0, lsr #27
	ldrsh r2, [r5, r1]
	ldrsh r1, [r0, #2]
	add r0, sl, r2
	add r1, sb, r1
	bl GetTile
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r0, #0
	bne _022F35CC
	ldrh r0, [r0]
	tst r0, #0x200
	movne r0, #0
	bne _022F35CC
	add r6, r6, #1
_022F31C4:
	cmp r6, #1
	ble _022F317C
	add r1, r7, #4
	add r0, r7, #5
	mov r1, r1, lsl #0x1d
	mov r0, r0, lsl #0x1d
	add r2, r7, #3
	mov r2, r2, lsl #0x1d
	ldr r6, _022F35D8 ; =DIRECTIONS_XY
	mov r5, r1, lsr #0x1b
	mov fp, r0, lsr #0x1b
	ldrsh r1, [r6, r5]
	ldr r8, _022F35DC ; =DIRECTIONS_XY + 2
	mov r3, r2, lsr #0x1b
	add r1, sl, r1
	ldrsh r2, [r6, r3]
	ldrsh r0, [r6, fp]
	ldrsh r6, [r8, r3]
	add r2, sl, r2
	ldrsh r5, [r8, r5]
	ldrsh r3, [r8, fp]
	add r8, sl, r0
	add r0, sb, r5
	str r1, [sp, #8]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r6, sb, r6
	str r0, [sp, #0x60]
	ldr r0, [sp, #4]
	add r1, sb, r3
	str r0, [sp, #0x54]
	and r0, r7, #1
	str r2, [sp, #0x5c]
	str r8, [sp, #0x64]
	str r6, [sp, #0x50]
	str r1, [sp, #0x58]
	str r0, [sp]
	mvn r5, #0
	b _022F33E4
_022F3260:
	add r8, sl, r5
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	mvn r6, #0
	str r0, [sp, #0x14]
	b _022F33D8
_022F3278:
	add fp, sb, r6
	mov r0, r8
	mov r1, fp
	bl GetTile
	ldr r1, [r0, #0x10]
	str r0, [sp, #0xc]
	cmp r1, #0
	beq _022F32DC
	mov r0, #0
	b _022F32C0
_022F32A0:
	add r2, sp, #0x5c
	ldr r2, [r2, r0, lsl #2]
	cmp r8, r2
	addeq r2, sp, #0x50
	ldreq r2, [r2, r0, lsl #2]
	cmpeq fp, r2
	beq _022F32C8
	add r0, r0, #1
_022F32C0:
	cmp r0, #3
	blt _022F32A0
_022F32C8:
	cmp r0, #3
	ldreq r0, [r1]
	cmpeq r0, #3
	moveq r0, #0
	beq _022F35CC
_022F32DC:
	ldr r0, [sp]
	cmp r0, #0
	beq _022F3324
	cmp r1, #0
	beq _022F3368
	ldr r0, [r1]
	cmp r0, #2
	bne _022F3368
	ldrb r0, [r1, #0x20]
	cmp r0, #0
	ldreq r0, _022F35D4 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
#ifdef JAPAN
	ldreqb r0, [r0, #0x1a0]
#else
	ldreqb r0, [r0, #0x244]
#endif
	cmpeq r0, #0
	beq _022F3368
	mov r0, #0
	b _022F35CC
_022F3324:
	cmp r5, #0
	cmpne r6, #0
	bne _022F3368
	cmp r1, #0
	beq _022F3368
	ldr r0, [r1]
	cmp r0, #2
	bne _022F3368
	ldrb r0, [r1, #0x20]
	cmp r0, #0
	ldreq r0, _022F35D4 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
#ifdef JAPAN
	ldreqb r0, [r0, #0x1a0]
#else
	ldreqb r0, [r0, #0x244]
#endif
	cmpeq r0, #0
	movne r0, #0
	bne _022F35CC
_022F3368:
	cmp r5, #0
	cmpne r6, #0
	bne _022F33D4
	cmp r5, #0
	cmpeq r6, #0
	beq _022F33D4
	ldr r0, [sp, #8]
	cmp r0, r8
	ldreq r0, [sp, #4]
	cmpeq r0, fp
	beq _022F33D4
	ldr r0, [sp, #0x14]
	add r1, sp, #0x48
	strh r0, [sp, #0x48]
	mov r0, r4
	strh fp, [sp, #0x4a]
	bl ov29_022FFA94
	cmp r0, #0
	bne _022F33D4
	ldr r0, [sp, #0x10]
	cmp r0, #0xff
	ldrne r0, [sp, #0xc]
	ldrneb r1, [r0, #7]
	ldrne r0, [sp, #0x10]
	cmpne r0, r1
	movne r0, #0
	bne _022F35CC
_022F33D4:
	add r6, r6, #1
_022F33D8:
	cmp r6, #1
	ble _022F3278
	add r5, r5, #1
_022F33E4:
	cmp r5, #1
	ble _022F3260
	ldr r0, [sp]
	cmp r0, #0
	bne _022F35C8
	cmp r7, #0
	cmpne r7, #4
	bne _022F34E8
	sub r3, sl, #1
	sub r2, sb, #1
	add r1, sp, #0x44
	mov r0, r4
	strh r3, [sp, #0x44]
	strh r2, [sp, #0x46]
	bl ov29_022FFA94
	mov r5, r0
	sub r2, sl, #1
	add r1, sp, #0x40
	mov r0, r4
	strh r2, [sp, #0x40]
	strh sb, [sp, #0x42]
	bl ov29_022FFA94
	mov r6, r0
	sub r3, sl, #1
	add r2, sb, #1
	add r1, sp, #0x3c
	mov r0, r4
	strh r3, [sp, #0x3c]
	strh r2, [sp, #0x3e]
	bl ov29_022FFA94
	cmp r6, #0
	bne _022F3474
	cmp r5, r6
	cmpeq r6, r0
	movne r0, #0
	bne _022F35CC
_022F3474:
	add r3, sl, #1
	sub r2, sb, #1
	add r1, sp, #0x38
	mov r0, r4
	strh r3, [sp, #0x38]
	strh r2, [sp, #0x3a]
	bl ov29_022FFA94
	mov r5, r0
	add r2, sl, #1
	add r1, sp, #0x34
	mov r0, r4
	strh r2, [sp, #0x34]
	strh sb, [sp, #0x36]
	bl ov29_022FFA94
	mov r6, r0
	add r3, sl, #1
	add r2, sb, #1
	add r1, sp, #0x30
	mov r0, r4
	strh r3, [sp, #0x30]
	strh r2, [sp, #0x32]
	bl ov29_022FFA94
	cmp r6, #0
	bne _022F35C8
	cmp r5, r6
	cmpeq r6, r0
	beq _022F35C8
	mov r0, #0
	b _022F35CC
_022F34E8:
	sub r3, sl, #1
	sub r2, sb, #1
	add r1, sp, #0x2c
	mov r0, r4
	strh r3, [sp, #0x2c]
	strh r2, [sp, #0x2e]
	bl ov29_022FFA94
	mov r5, r0
	sub r2, sb, #1
	add r1, sp, #0x28
	mov r0, r4
	strh sl, [sp, #0x28]
	strh r2, [sp, #0x2a]
	bl ov29_022FFA94
	mov r6, r0
	add r3, sl, #1
	sub r2, sb, #1
	add r1, sp, #0x24
	mov r0, r4
	strh r3, [sp, #0x24]
	strh r2, [sp, #0x26]
	bl ov29_022FFA94
	cmp r6, #0
	bne _022F3558
	cmp r5, r6
	cmpeq r6, r0
	movne r0, #0
	bne _022F35CC
_022F3558:
	sub r3, sl, #1
	add r2, sb, #1
	add r1, sp, #0x20
	mov r0, r4
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	bl ov29_022FFA94
	mov r5, r0
	add r2, sb, #1
	add r1, sp, #0x1c
	mov r0, r4
	strh sl, [sp, #0x1c]
	strh r2, [sp, #0x1e]
	bl ov29_022FFA94
	mov r6, r0
	add r3, sl, #1
	add r2, sb, #1
	add r1, sp, #0x18
	mov r0, r4
	strh r3, [sp, #0x18]
	strh r2, [sp, #0x1a]
	bl ov29_022FFA94
	cmp r6, #0
	bne _022F35C8
	cmp r5, r6
	cmpeq r6, r0
	movne r0, #0
	bne _022F35CC
_022F35C8:
	mov r0, #1
_022F35CC:
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F35D4: .word DUNGEON_PTR
_022F35D8: .word DIRECTIONS_XY
_022F35DC: .word DIRECTIONS_XY + 2
	arm_func_end ShouldLeaderKeepRunning

	arm_func_start ov29_022F35E0
ov29_022F35E0: ; 0x022F35E0
	ldrb r0, [r0, #0xc4]
	cmp r0, #2
	moveq r0, #0
	bxeq lr
	cmp r0, #1
	moveq r0, #0
	bxeq lr
	cmp r0, #7
	moveq r0, #0
	bxeq lr
	cmp r0, #5
	moveq r0, #0
	bxeq lr
	cmp r0, #3
	moveq r0, #0
	bxeq lr
	cmp r0, #4
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov29_022F35E0

	arm_func_start CheckLeaderTile
CheckLeaderTile: ; 0x022F3634
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl GetLeader
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl IsFloorOver
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl GetTileAtEntity
	mov r5, r0
	mov r0, r4
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, [r4, #0xb4]
	ldrneb r0, [r0, #0xef]
	cmpne r0, #3
	beq _022F3698
	mov r0, r4
	mov r1, #0x10
	bl HasHeldItem
	cmp r0, #0
	bne _022F3698
	add r0, r4, #4
	bl ov29_02337D68
_022F3698:
	ldrh r0, [r5]
	tst r0, #0x200
	ldrne r0, _022F37CC ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	ldr r5, [r5, #0x10]
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r5]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022F36CC: ; jump table
	ldmia sp!, {r4, r5, r6, r7, r8, pc} ; case 0
	ldmia sp!, {r4, r5, r6, r7, r8, pc} ; case 1
	b _022F36E8 ; case 2
	b _022F3778 ; case 3
	ldmia sp!, {r4, r5, r6, r7, r8, pc} ; case 4
	b _022F37C0 ; case 5
	ldmia sp!, {r4, r5, r6, r7, r8, pc} ; case 6
_022F36E8:
	mov r0, r5
	bl GetTrapInfo
	mov r6, r0
	mov r7, #0
	mov r0, r4
	mov r1, #0x13
	mov r8, r7
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022F372C
	ldrb r0, [r5, #0x20]
	cmp r0, #0
	bne _022F372C
	mov r0, #1
	strb r0, [r5, #0x20]
	bl UpdateTrapsVisibility
	mov r8, #1
_022F372C:
	ldrb r0, [r6, #1]
	cmp r0, #0
	moveq r7, #1
	beq _022F3750
	cmp r0, #1
	moveq r7, #0
	beq _022F3750
	cmp r0, #2
	moveq r7, #1
_022F3750:
	cmp r7, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl TryTriggerTrap
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022F3778:
	mov r0, r5
	bl GetItemInfo
	ldrb r0, [r0]
	tst r0, #2
	bne _022F37A0
	add r0, r4, #4
	mov r1, #1
	bl TryLeaderItemPickUp
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022F37A0:
	mov r0, r4
	bl ShouldMonsterRunAway
	cmp r0, #0
	ldreq r0, _022F37CC ; =DUNGEON_PTR
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0, #0x614]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022F37C0:
	mov r0, #1
	bl HiddenStairsTrigger
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F37CC: .word DUNGEON_PTR
	arm_func_end CheckLeaderTile

	arm_func_start ov29_022F37D0
ov29_022F37D0: ; 0x022F37D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r4, r1
	bl GetMonsterInFront
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r5]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl ov29_023009CC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r5, #0xb4]
	mov r6, #1
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _022F3850
	ldrb r0, [r1, #0xbc]
	cmp r0, #7
	cmpne r0, #0x10
	cmpne r0, #0x11
	cmpne r0, #0x12
	cmpne r0, #0x13
	cmpne r0, #0x14
	ldrneb r0, [r1, #9]
	cmpne r0, #1
	movne r6, #0
	b _022F3874
_022F3850:
	mov r2, #0
	mov r0, r7
	mov r1, r5
	mov r3, r2
	bl GetTreatmentBetweenMonsters
	cmp r0, #1
	movne r0, r6
	moveq r0, #0
	and r6, r0, #0xff
_022F3874:
	cmp r6, #0
	beq _022F3888
	add r0, r4, #0x4a
	mov r1, #0x13
	bl SetMonsterActionFields
_022F3888:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022F37D0

	arm_func_start ov29_022F3890
ov29_022F3890: ; 0x022F3890
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r1
	mov r6, r0
	bl GetLeaderMonster
	mov r4, r0
	cmp r5, #0
	beq _022F38D0
	ldrb r0, [r4, #0xd0]
	cmp r0, #4
	bne _022F38D0
	ldrb r0, [r4, #0x4c]
	add r1, r0, #4
	and r0, r1, #0xff
	and r0, r0, #7
	strb r0, [r4, #0x4c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022F38D0:
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #8
	bl DungeonRandInt
	mov sb, r0
	mov r8, #0
	mov r7, #1
	b _022F3928
_022F38F4:
	cmp r5, #0
	movne r0, r7
	bne _022F390C
	mov r0, r6
	mov r1, sb
	bl CanMonsterMoveInDirection
_022F390C:
	cmp r0, #0
	andne r0, sb, #7
	strneb r0, [r4, #0x4c]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, sb, #1
	and sb, r0, #7
	add r8, r8, #1
_022F3928:
	cmp r8, #8
	blt _022F38F4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_022F3890

	arm_func_start ChangeLeader
ChangeLeader: ; 0x022F3934
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _022F3AE4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldr r6, [r0, #0xc8]
	bl GetLeader
	ldr sb, [r6, #0xb4]
	mov fp, r0
	ldrb r0, [sb, #7]
	ldr sl, [fp, #0xb4]
	cmp r0, #0
	beq _022F3970
	ldr r1, _022F3AE8 ; =0x00000BA4
	mov r0, r6
	bl LogMessageByIdWithPopup
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3970:
	mov r0, #2
	bl CheckTeamItemsFlags
	cmp r0, #0
	bne _022F398C
	bl ov29_022F670C
	cmp r0, #0
	beq _022F399C
_022F398C:
	ldr r1, _022F3AEC ; =0x00000BA5
	mov r0, r6
	bl LogMessageByIdWithPopup
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F399C:
	ldr r0, _022F3AE4 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x790]
	cmp r0, #0
	beq _022F39C0
	ldr r1, _022F3AF0 ; =0x00000BA6
	mov r0, r6
	bl LogMessageByIdWithPopup
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F39C0:
	mov r5, #0
	strb r5, [r1, #0x799]
	mov r0, #1
	strb r0, [sb, #7]
	strb r5, [sl, #7]
	mvn r4, #0
_022F39D8:
	mov r0, r5
	bl GetActiveTeamMember
	mov r7, r0
	ldrb r0, [r7]
	mov r8, r4
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F3A40
	ldrsh r0, [r7, #8]
	bl ov29_022F9C34
	cmp r0, #0
	ldrsh r0, [sb, #0xc]
	ldreqsh r8, [r7, #8]
	cmp r5, r0
	bne _022F3A38
	mov r0, #1
	strb r0, [r7, #1]
	cmp r8, r4
	beq _022F3A40
	mov r0, r8
	bl TryAddMonsterToActiveTeam
	b _022F3A40
_022F3A38:
	mov r0, #0
	strb r0, [r7, #1]
_022F3A40:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _022F39D8
	ldr r0, _022F3AF4 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	add r3, sl, #0x4a
	add r2, sb, #0x4a
	mov r1, #0xa
_022F3A6C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F3A6C
	mov r0, r6
	mov r1, #1
	bl PointCameraToMonster
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, fp
	bl PlayQuestionMarkEffect
	bl GetLeader
	bl PlayExclamationPointEffect__022E47D4
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	ldr r1, _022F3AF8 ; =0x00000BA7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0
	bl ov29_022F62CC
	mov r0, fp
	mov r1, #0
	strh r1, [sb, #0x68]
	strh r1, [sl, #0x68]
	bl ov29_022F9EA0
	mov r0, r6
	bl ov29_022F9EA0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define CHANGE_LEADER_OFFSET -0x2C1
#else
#define CHANGE_LEADER_OFFSET 0
#endif
_022F3AE4: .word DUNGEON_PTR
_022F3AE8: .word 0x00000BA4 + CHANGE_LEADER_OFFSET
_022F3AEC: .word 0x00000BA5 + CHANGE_LEADER_OFFSET
_022F3AF0: .word 0x00000BA6 + CHANGE_LEADER_OFFSET
_022F3AF4: .word LEADER_PTR
_022F3AF8: .word 0x00000BA7 + CHANGE_LEADER_OFFSET
	arm_func_end ChangeLeader

	arm_func_start ov29_022F3AFC
ov29_022F3AFC: ; 0x022F3AFC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl ov29_022F89AC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r0, [r0]
	tst r0, #0x2000
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov29_023491B8
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_023009CC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r4
	bl IsValidTargetEntity
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r4
	bl ov29_023009CC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r5, #0x4a
	mov r1, #0x42
	bl SetMonsterActionFields
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022F3AFC

	arm_func_start ov29_022F3B8C
ov29_022F3B8C: ; 0x022F3B8C
	ldr ip, _022F3B94 ; =ResetTriggerFlags
	bx ip
	.align 2, 0
_022F3B94: .word ResetTriggerFlags
	arm_func_end ov29_022F3B8C

	arm_func_start ov29_022F3B98
ov29_022F3B98: ; 0x022F3B98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r4, #0
	str r4, [sp, #4]
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov fp, r4
	str r4, [sp]
	bl GetCheckDirectionOption
	cmp r0, #0
	moveq r0, r4
	beq _022F3E88
	cmp r8, #0
	ldrb r5, [sl, #0xb0]
	beq _022F3C4C
	mov r6, r4
	mov r0, sl
	mov r1, r8
	mov r2, r6
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	mov r1, r0, lsl #0x10
	mov r7, r1, asr #0x10
	mov r0, sl
	mov r1, r8
	mov r2, r4
	bl GetEntityMoveTargetAndRange
	cmp r7, #0
	cmpne r7, #0x10
	cmpne r7, #0x40
	cmpne r7, #0x50
	cmpne r7, #0x80
	and r0, r0, #0xf
	cmpne r7, #0x90
	beq _022F3C3C
	cmp r0, #4
	bne _022F3C40
	ldrh r0, [r8, #4]
	cmp r0, #0x80
	beq _022F3C40
_022F3C3C:
	mov r6, #1
_022F3C40:
	cmp r6, #0
	moveq r0, #1
	beq _022F3E88
_022F3C4C:
	bl ov29_022F2FE4
	ldr r1, _022F3E90 ; =ov29_0237C9A4
	mov r2, #0
	strb r2, [r1, #1]
	mov r0, #1
	strh r2, [r1, #4]
	bl ov29_0234B4CC
	mov r0, #0
	bl ov29_0234B1A4
	ldr r0, _022F3E94 ; =0x00000BA8
	bl ov29_0234FC50
	bl ov29_022E0B44
	ldr r6, _022F3E90 ; =ov29_0237C9A4
	mvn r8, #0
_022F3C84:
	mov r0, #0x62
	bl AdvanceFrame
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _022F3CAC
	mov r0, sl
	bl ov29_022F2B74
	ldrsh r0, [r6, #4]
	add r0, r0, #1
	strh r0, [r6, #4]
_022F3CAC:
	ldr r0, _022F3E98 ; =ov29_0237C6A4
	mov r1, #0
	ldrh r0, [r0]
	tst r0, #0x40
	beq _022F3CC8
	tst r0, #2
	movne r1, #1
_022F3CC8:
	cmp r1, #0
	beq _022F3D10
	add r1, sp, #8
	mov r0, sl
	mov r2, #0x64
	mov r3, #0
	bl ov29_022F3EA0
	ldrsh r2, [sl, #4]
	ldrsh r1, [sp, #8]
	mov r7, r0
	cmp r2, r1
	ldreqsh r1, [sl, #6]
	ldreqsh r0, [sp, #0xa]
	cmpeq r1, r0
	movne r0, #1
	moveq r4, #1
	strne r0, [sp, #4]
	b _022F3DE0
_022F3D10:
	ldr r0, _022F3E9C ; =DUNGEON_BUTTON_INPUT
	ldrh r0, [r0]
	tst r0, #0x100
	and r0, r0, #0xf0
	mov r0, r0, lsl #0x10
	movne r1, #1
	mov r0, r0, lsr #0x10
	strneb r1, [r6, #1]
	bne _022F3D4C
	mov r1, #0
	strb r1, [r6, #1]
	strh r1, [r6, #4]
	ldr r1, _022F3E9C ; =DUNGEON_BUTTON_INPUT
	ldrh r1, [r1, #2]
	and r0, r0, r1
_022F3D4C:
	mov r7, r8
	cmp r0, #0x50
	moveq r7, #3
	cmp r0, #0x60
	moveq r7, #5
	cmp r0, #0x90
	moveq r7, #1
	cmp r0, #0xa0
	moveq r7, #7
	cmp r0, #0x40
	moveq r7, #4
	cmp r0, #0x80
	moveq r7, #0
	cmp r0, #0x10
	moveq r7, #2
	cmp r0, #0x20
	ldrb r0, [r6, #1]
	moveq r7, #6
	cmp r0, #0
	beq _022F3DB0
	cmp r7, #0
	blt _022F3DC0
	tst r7, #1
	bne _022F3DE0
	b _022F3DC0
_022F3DB0:
	cmp r7, #0
	blt _022F3DC0
	tst r7, #1
	beq _022F3DE0
_022F3DC0:
	ldr r0, _022F3E9C ; =DUNGEON_BUTTON_INPUT
	ldrh r0, [r0, #2]
	tst r0, #2
	movne r4, #1
	bne _022F3DE0
	tst r0, #1
	beq _022F3C84
	mov fp, #1
_022F3DE0:
	bl ov29_0234FCA8
	cmp r0, #0
	beq _022F3DFC
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, #0x62
	bl AdvanceFrame
_022F3DFC:
	cmp r4, #0
	bne _022F3E5C
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _022F3E28
	mvn r0, #0
	cmp r7, r0
	beq _022F3E24
	cmp fp, #0
	beq _022F3E28
_022F3E24:
	ldrb r7, [sb, #0x4c]
_022F3E28:
	and r1, r7, #7
	mov r0, sl
	strb r1, [sb, #0x4c]
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, sl
	mov r2, r7
	bl ChangeMonsterAnimation
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, #1
	str r0, [sp]
	b _022F3E68
_022F3E5C:
	mov r0, #1
	strb r5, [sb, #0x4c]
	bl PlaySeVolumeWrapper
_022F3E68:
	ldr r1, _022F3E90 ; =ov29_0237C9A4
	mov r0, #0
	strb r0, [r1, #1]
	strh r0, [r1, #4]
	bl ov29_0234B4CC
	bl ov29_022E0B44
	bl sub_02006B70
	ldr r0, [sp]
_022F3E88:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F3E90: .word ov29_0237C9A4
#ifdef JAPAN
_022F3E94: .word 0x000008E7
#else
_022F3E94: .word 0x00000BA8
#endif
_022F3E98: .word ov29_0237C6A4
_022F3E9C: .word DUNGEON_BUTTON_INPUT
	arm_func_end ov29_022F3B98

	arm_func_start ov29_022F3EA0
ov29_022F3EA0: ; 0x022F3EA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r5, r0
	mov sb, r1
	mov r4, r3
	cmp r2, #0x64
	mov r6, #0
	add r0, sp, #0
	bne _022F3ECC
	bl ov29_022E0C64
	b _022F3EE0
_022F3ECC:
	cmp r2, #0x65
	bne _022F3EDC
	bl ov29_022E0C80
	b _022F3EE0
_022F3EDC:
	bl ov29_022E0C9C
_022F3EE0:
	ldr r1, _022F40AC ; =DUNGEON_PTR
	ldr r0, _022F40B0 ; =0x0001A224
	ldr r7, [r1]
	ldr r2, [sp]
	ldrsh r0, [r7, r0]
	mov r1, #0x18
	add r0, r2, r0
	bl _s32_div_f
	ldr r1, _022F40B4 ; =0x0001A226
	ldr r3, [sp, #4]
	ldrsh r2, [r7, r1]
	mov r7, r0
	mov r1, #0x18
	add r0, r3, r2
	bl _s32_div_f
	mov r8, r0
	strh r7, [sb]
	strh r8, [sb, #2]
	ldrsh r1, [sb]
	ldrsh r0, [r5, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #2
	ble _022F3F58
	ldrsh r1, [sb, #2]
	ldrsh r0, [r5, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #2
	bgt _022F3F5C
_022F3F58:
	mov r6, #1
_022F3F5C:
	mov r0, sb
	bl ov29_022E2CA0
	cmp r0, #0
	cmpeq r6, #0
	beq _022F40A0
	ldrsh r0, [r5, #4]
	mvn r6, #0
	cmp r0, r7
	ldreqsh r1, [r5, #6]
	cmpeq r1, r8
	moveq r6, #0
	cmp r0, r7
	bne _022F3F9C
	ldrsh r1, [r5, #6]
	cmp r1, r8
	movlt r6, #0
_022F3F9C:
	cmp r0, r7
	ldrltsh r1, [r5, #6]
	cmplt r1, r8
	movlt r6, #1
	cmp r0, r7
	bge _022F3FC0
	ldrsh r1, [r5, #6]
	cmp r1, r8
	moveq r6, #2
_022F3FC0:
	cmp r0, r7
	bge _022F3FD4
	ldrsh r1, [r5, #6]
	cmp r1, r8
	movgt r6, #3
_022F3FD4:
	cmp r0, r7
	bne _022F3FE8
	ldrsh r1, [r5, #6]
	cmp r1, r8
	movgt r6, #4
_022F3FE8:
	cmp r0, r7
	ldrgtsh r1, [r5, #6]
	cmpgt r1, r8
	movgt r6, #5
	cmp r0, r7
	ble _022F400C
	ldrsh r1, [r5, #6]
	cmp r1, r8
	moveq r6, #6
_022F400C:
	cmp r0, r7
	ble _022F4020
	ldrsh r0, [r5, #6]
	cmp r0, r8
	movlt r6, #7
_022F4020:
	cmp r6, #0
	movlt r0, r6
	blt _022F40A4
	cmp r4, #0
	beq _022F4098
	mov r0, r5
	mov r1, r6
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	movne r0, r6
	bne _022F40A4
	tst r6, #1
	moveq r0, r6
	beq _022F40A4
	sub r1, r6, #1
	mov r0, r5
	and r1, r1, #7
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	subne r0, r6, #1
	andne r0, r0, #7
	bne _022F40A4
	add r1, r6, #1
	mov r0, r5
	and r1, r1, #7
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	addne r0, r6, #1
	andne r0, r0, #7
	bne _022F40A4
_022F4098:
	mov r0, r6
	b _022F40A4
_022F40A0:
	mvn r0, #0
_022F40A4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F40AC: .word DUNGEON_PTR
#ifdef JAPAN
_022F40B0: .word 0x0001A180
_022F40B4: .word 0x0001A182
#else
_022F40B0: .word 0x0001A224
_022F40B4: .word 0x0001A226
#endif
	arm_func_end ov29_022F3EA0

	arm_func_start ov29_022F40B8
ov29_022F40B8: ; 0x022F40B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	ldrsh r2, [sb]
	mov sl, r0
	cmp r2, #0
	movlt r0, #0
	blt _022F425C
	ldrsh r0, [sb, #2]
	cmp r0, #0
	movlt r0, #0
	blt _022F425C
	add r0, sl, #4
	bl GetDirectionTowardsPosition
	mov r5, r0
	mov r0, sl
	mov r1, r5
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	movne r0, r5
	bne _022F425C
	tst r5, #1
	beq _022F4218
	ldrsh r1, [sl, #4]
	ldrsh r0, [sb]
	sub r0, r1, r0
	bl abs
	ldrsh r2, [sl, #6]
	ldrsh r1, [sb, #2]
	mov r6, r0
	sub r0, r2, r1
	bl abs
	mov r7, r0
	cmp r6, r7
	movgt r1, #1
	ldr r0, _022F4264 ; =ov29_023526C8
	movle r1, #0
	add r0, r0, r1, lsl #3
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _022F4178
	sub r1, r5, #1
	add r0, r5, #1
	and r1, r1, #7
	and r0, r0, #7
	str r1, [sp]
	str r0, [sp, #4]
	b _022F4190
_022F4178:
	add r1, r5, #1
	sub r0, r5, #1
	and r1, r1, #7
	and r0, r0, #7
	str r1, [sp]
	str r0, [sp, #4]
_022F4190:
	mov r4, #0
	b _022F420C
_022F4198:
	add r0, sp, #0
	ldr r8, [r0, r4, lsl #2]
	ldr r0, _022F4268 ; =DIRECTIONS_XY
	mov r1, r8, lsl #2
	ldrsh r1, [r0, r1]
	ldrsh r2, [sl, #4]
	ldrsh r0, [sb]
	add r1, r2, r1
	sub r0, r1, r0
	bl abs
	ldr r1, _022F4268 ; =DIRECTIONS_XY
	ldrsh r3, [sl, #6]
	add r1, r1, r8, lsl #2
	ldrsh r2, [r1, #2]
	mov fp, r0
	ldrsh r1, [sb, #2]
	add r0, r3, r2
	sub r0, r0, r1
	bl abs
	cmp fp, r6
	cmple r0, r7
	bgt _022F4208
	mov r0, sl
	mov r1, r8
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	movne r0, r8
	bne _022F425C
_022F4208:
	add r4, r4, #1
_022F420C:
	cmp r4, #2
	blt _022F4198
	b _022F4258
_022F4218:
	sub r1, r5, #1
	mov r0, sl
	and r1, r1, #7
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	subne r0, r5, #1
	andne r0, r0, #7
	bne _022F425C
	add r1, r5, #1
	mov r0, sl
	and r1, r1, #7
	bl CanMonsterMoveOrSwapWithAllyInDirection
	cmp r0, #0
	addne r0, r5, #1
	andne r0, r0, #7
	bne _022F425C
_022F4258:
	mov r0, r5
_022F425C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F4264: .word ov29_023526C8
_022F4268: .word DIRECTIONS_XY
	arm_func_end ov29_022F40B8

	arm_func_start ov29_022F426C
ov29_022F426C: ; 0x022F426C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTileSafe
	ldr r1, _022F42D4 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	bl CannotStandOnTile__02300384
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F42D4: .word DUNGEON_PTR
	arm_func_end ov29_022F426C

	arm_func_start GetPlayerGender
GetPlayerGender: ; 0x022F42D8
	stmdb sp!, {r3, lr}
	bl GetHero
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl GetMonsterGenderVeneer
	ldmia sp!, {r3, pc}
	arm_func_end GetPlayerGender

	arm_func_start ov29_022F42F8
ov29_022F42F8: ; 0x022F42F8
	cmp r0, #0
	moveq r1, #0
	beq _022F4318
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
_022F4318:
	cmp r1, #0
	ldrne r0, [r0, #0xb4]
	ldrneb r0, [r0, #7]
	cmpne r0, #0
	bxeq lr
	ldr r0, _022F434C ; =DUNGEON_PTR
	mov r3, #0
	ldr r2, [r0]
	sub r1, r3, #1
	strb r3, [r2, #5]
	ldr r0, [r0]
	str r1, [r0, #0x614]
	bx lr
	.align 2, 0
_022F434C: .word DUNGEON_PTR
	arm_func_end ov29_022F42F8

	arm_func_start ov29_022F4350
ov29_022F4350: ; 0x022F4350
	ldr r2, [r0, #0xb4]
	mov r3, #1
	ldr ip, _022F436C ; =TryLeaderItemPickUp
	add r0, r0, #4
	mov r1, #0
	strb r3, [r2, #0x4e]
	bx ip
	.align 2, 0
_022F436C: .word TryLeaderItemPickUp
	arm_func_end ov29_022F4350

	arm_func_start ov29_022F4370
ov29_022F4370: ; 0x022F4370
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, r1
	mov r1, #0
	mov r2, #0xfe
	mov r6, r0
	bl GetItemToUse
	mov sb, #0
	mov lr, #1
	mov r4, r0
	mov ip, sb
	mov fp, sb
	mov r2, lr
	ldr r1, _022F44D4 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #6
	b _022F441C
_022F43AC:
	mul r7, sb, r0
	ldr r3, [r1]
	ldr r8, [r3, #0x384]
	ldrb sl, [r8, r7]
	tst sl, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _022F4418
	ldrb r3, [r8, r7]
	tst r3, #0x10
	beq _022F4418
	tst sl, #8
	movne r3, r2
	moveq r3, fp
	tst r3, #0xff
	beq _022F440C
	add r1, r8, r7
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F44D8 ; =0x00000BA9
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F440C:
	ldrb r3, [r8, r7]
	bic r3, r3, #0x10
	strb r3, [r8, r7]
_022F4418:
	add sb, sb, #1
_022F441C:
	cmp sb, #0x32
	blt _022F43AC
	mov r1, r4
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r0, _022F44DC ; =0x00003F07
	bl PlaySeByIdIfNotSilence
	cmp r5, #0
	beq _022F4494
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4468
	ldr r1, _022F44E0 ; =0x00000BAA
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022F4494
_022F4468:
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #0
	bne _022F4488
	ldr r1, _022F44E4 ; =0x00000BAB
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022F4494
_022F4488:
	ldr r1, _022F44E8 ; =0x00000BAC
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_022F4494:
	ldrb r0, [r4]
	orr r0, r0, #0x10
	strb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	cmpne r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, r4
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F44EC ; =0x00000BAE
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F4370_OFFSET -0x2C1
#else
#define OV29_022F4370_OFFSET 0
#endif
_022F44D4: .word BAG_ITEMS_PTR_MIRROR
_022F44D8: .word 0x00000BA9 + OV29_022F4370_OFFSET
_022F44DC: .word 0x00003F07
_022F44E0: .word 0x00000BAA + OV29_022F4370_OFFSET
_022F44E4: .word 0x00000BAB + OV29_022F4370_OFFSET
_022F44E8: .word 0x00000BAC + OV29_022F4370_OFFSET
_022F44EC: .word 0x00000BAE + OV29_022F4370_OFFSET
	arm_func_end ov29_022F4370

	arm_func_start ov29_022F44F0
ov29_022F44F0: ; 0x022F44F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	mov r7, #1
	mov sl, r0
	mov sb, r1
	mov r6, r8
	mov fp, r7
	ldr r5, _022F45BC ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #6
	b _022F45B0
_022F4518:
	mul r2, r8, r4
	ldr r0, [r5]
	ldr r3, [r0, #0x384]
	ldrb r1, [r3, r2]
	tst r1, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _022F45AC
	ldrb r0, [r3, r2]
	tst r0, #0x10
	beq _022F45AC
	tst r1, #8
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _022F4578
	add r1, r3, r2
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F45C0 ; =0x00000BA9
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F4578:
	ldrb ip, [r3, r2]
	mov r0, #0
	add r1, r3, r2
	bic ip, ip, #0x10
	strb ip, [r3, r2]
	bl PrepareItemForPrinting__02345728
	ldr r0, _022F45C4 ; =0x00003F07
	bl PlaySeByIdIfNotSilence
	cmp sb, #0
	beq _022F45AC
	ldr r1, _022F45C8 ; =0x00000BAD
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_022F45AC:
	add r8, r8, #1
_022F45B0:
	cmp r8, #0x32
	blt _022F4518
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F45BC: .word BAG_ITEMS_PTR_MIRROR
#ifdef JAPAN
_022F45C0: .word 0x000008E8
_022F45C4: .word 0x00003F07
_022F45C8: .word 0x000008EC
#else
_022F45C0: .word 0x00000BA9
_022F45C4: .word 0x00003F07
_022F45C8: .word 0x00000BAD
#endif
	arm_func_end ov29_022F44F0

	arm_func_start HandleHeldItemSwaps
HandleHeldItemSwaps: ; 0x022F45CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	mov sl, r0
	mov r1, #1
	bl ov29_022EB568
	mov r4, r0
	ldr r8, [sl, #0xb4]
	mov r0, sl
	mov r1, #0
	mov r2, #2
	ldr sb, [r4, #0xb4]
	bl GetItemToUse
	ldrb r1, [r8, #0x4e]
	mov r5, r0
	mov r0, r5
	cmp r1, #0x80
	moveq r1, #1
	movne r1, #0
	and r6, r1, #0xff
	bl GetItemIndex
	mov r7, r0
	cmp r6, #0
	bne _022F4668
	ldrb r0, [r5]
	tst r0, #0x10
	beq _022F4668
	ldrb r0, [r5]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4668
	mov r1, r5
	mov r0, #1
	bl PrepareItemForPrinting__02345728
#ifdef JAPAN
	ldr r1, _022F5EB8 ; =0x000008EF
	mov r0, sl
#else
	mov r0, sl
	mov r1, #0xbb0
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _022F48B8
_022F4668:
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [sb, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _022F47CC
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F46C0
	add r1, sb, #0x62
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F48C0 ; =0x00000BAF
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022F48B8
_022F46C0:
	ldrh r0, [sb, #0x62]
	cmp r6, #0
	add r1, sp, #0xc
	strh r0, [sp, #0xc]
	ldrh r2, [sb, #0x64]
	ldrb r0, [sp, #0xc]
	ldrb r3, [sp, #0xd]
	strh r2, [sp, #0xe]
	ldrh r6, [sb, #0x66]
	bic r2, r0, #0x10
	strh r6, [sp, #0x10]
	ldrh r0, [r5]
	strh r0, [sp, #6]
	ldrh r6, [r5, #2]
	ldrb r0, [sp, #6]
	strh r6, [sp, #8]
	ldrh r5, [r5, #4]
	bic r0, r0, #0x10
	strh r5, [sp, #0xa]
	strb r3, [sp, #7]
	strb r2, [sp, #0xc]
	strb r0, [sp, #6]
	beq _022F472C
	add r0, sl, #4
	mov r2, #1
	bl SpawnItem
	b _022F4734
_022F472C:
	mov r0, r1
	bl RemoveHolderForItemInBag
_022F4734:
	ldrh r0, [sp, #6]
	cmp r7, #0
	strh r0, [sb, #0x62]
	ldrh r0, [sp, #8]
	strh r0, [sb, #0x64]
	ldrh r0, [sp, #0xa]
	strh r0, [sb, #0x66]
	blt _022F4770
	ldrb r0, [r8, #0x54]
	bl ov29_022EB594
	mov r2, r0
	add r1, sp, #6
	mov r0, r7
	bl SetHolderForItemInBag
	b _022F4778
_022F4770:
	mov r0, sb
	bl AddHeldItemToBag
_022F4778:
	add r1, sp, #6
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	add r1, sp, #0xc
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldr r0, _022F48C4 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	ldr r1, _022F48C8 ; =0x00000BB2
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldrb r0, [sp, #6]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4878
	ldr r1, _022F48CC ; =0x00000BAE
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022F4878
_022F47CC:
	ldrh r0, [r5]
	cmp r7, #0
	strh r0, [sp]
	ldrh r1, [r5, #2]
	ldrb r0, [sp]
	strh r1, [sp, #2]
	ldrh r1, [r5, #4]
	bic r0, r0, #0x10
	strb r0, [sp]
	ldrh r0, [sp]
	strh r1, [sp, #4]
	strh r0, [sb, #0x62]
	ldrh r0, [sp, #2]
	strh r0, [sb, #0x64]
	ldrh r0, [sp, #4]
	strh r0, [sb, #0x66]
	blt _022F482C
	ldrb r0, [r8, #0x54]
	bl ov29_022EB594
	mov r2, r0
	mov r0, r7
	add r1, sb, #0x62
	bl SetHolderForItemInBag
	b _022F4834
_022F482C:
	mov r0, sb
	bl AddHeldItemToBag
_022F4834:
	add r1, sp, #0
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r0, _022F48C4 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	ldr r1, _022F48D0 ; =0x00000BB3
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	ldrb r0, [sp]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4878
	ldr r1, _022F48CC ; =0x00000BAE
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_022F4878:
	mov r0, r4
	bl ov29_022F9EA0
	mov r0, sl
	mov r1, r4
	bl ov29_02321164
	ldrb r0, [sb, #7]
	ldr r1, _022F48D4 ; =DUNGEON_PTR
	cmp r0, #0
	ldreqh r0, [sb]
	orreq r0, r0, #0x4000
	streqh r0, [sb]
	ldr r1, [r1]
	mov r0, sl
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
_022F48B8:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F45CC_OFFSET -0x2C1
#else
#define OV29_022F45CC_OFFSET 0
#endif
#ifdef JAPAN
_022F5EB8: .word 0x000008EF
#endif
_022F48C0: .word 0x00000BAF + OV29_022F45CC_OFFSET
_022F48C4: .word 0x00001317
_022F48C8: .word 0x00000BB2 + OV29_022F45CC_OFFSET
_022F48CC: .word 0x00000BAE + OV29_022F45CC_OFFSET
_022F48D0: .word 0x00000BB3 + OV29_022F45CC_OFFSET
_022F48D4: .word DUNGEON_PTR
	arm_func_end HandleHeldItemSwaps

	arm_func_start ov29_022F48D8
ov29_022F48D8: ; 0x022F48D8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r1, #0
	mov r6, r0
	bl ov29_022EB568
	mov r4, r0
	ldr r5, [r4, #0xb4]
	ldrb r0, [r5, #0x62]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	mov r0, #0
	beq _022F4928
	add r1, r5, #0x62
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F49D0 ; =0x00000BAE
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	b _022F49C8
_022F4928:
	ldrh r2, [r5, #0x62]
	add r1, sp, #0
	strh r2, [sp]
	ldrh r3, [r5, #0x64]
	ldrb r2, [sp]
	strh r3, [sp, #2]
	ldrh r3, [r5, #0x66]
	bic r2, r2, #0x10
	strh r3, [sp, #4]
	strb r2, [sp]
	bl PrepareItemForPrinting__02345728
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r0, r5, #0x62
	bl ItemZInit
	add r0, sp, #0
	bl RemoveHolderForItemInBag
	ldr r0, _022F49D4 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	ldr r1, _022F49D8 ; =0x00000BB5
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r4
	bl ov29_022F9EA0
	mov r1, r4
	mov r0, r6
	bl ov29_02321164
	ldrb r0, [r5, #7]
	ldr r1, _022F49DC ; =DUNGEON_PTR
	cmp r0, #0
	ldreqh r0, [r5]
	orreq r0, r0, #0x4000
	streqh r0, [r5]
	ldr r1, [r1]
	mov r0, r6
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
_022F49C8:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_022F49D0: .word 0x000008ED
_022F49D4: .word 0x00001317
_022F49D8: .word 0x000008F4
#else
_022F49D0: .word 0x00000BAE
_022F49D4: .word 0x00001317
_022F49D8: .word 0x00000BB5
#endif
_022F49DC: .word DUNGEON_PTR
	arm_func_end ov29_022F48D8

	arm_func_start ov29_022F49E0
ov29_022F49E0: ; 0x022F49E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r1, #0
	mov r7, r0
	bl ov29_022EB568
	mov r4, r0
	ldr r5, [r4, #0xb4]
	ldr r2, _022F4BC8 ; =0x00001565
	mov r0, r7
	mov r1, #1
	bl GetItemToUse
	ldrb r1, [r5, #0x62]
	mov r6, r0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4A44
	add r1, r5, #0x62
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F4BCC ; =0x00000BAE
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022F4BC0
_022F4A44:
	ldrb r0, [r6]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4A84
	ldrb r0, [r6]
	tst r0, #0x10
	beq _022F4A84
	mov r1, r6
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F4BCC ; =0x00000BAE
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022F4BC0
_022F4A84:
	ldrb r2, [r5, #0x62]
	add r1, r5, #0x62
	mov r0, #0
	bic r2, r2, #0x10
	strb r2, [r5, #0x62]
	ldrb r2, [r6]
	bic r2, r2, #0x10
	strb r2, [r6]
	bl PrepareItemForPrinting__02345728
	mov r1, r6
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldrh r3, [r5, #0x62]
	ldrh r2, [r5, #0x64]
	ldrh r1, [r5, #0x66]
	ldrb r0, [r5, #6]
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r1, [sp, #4]
	cmp r0, #0
	bne _022F4AF0
	add r0, r5, #0x62
	bl RemoveEquivItemNoHole
_022F4AF0:
	ldrh r0, [r6]
	strh r0, [r5, #0x62]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x64]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x66]
	ldrb r0, [r5, #6]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x63]
	bne _022F4B24
	mov r0, r5
	bl AddHeldItemToBag
_022F4B24:
	ldrh r2, [sp]
	ldrh r0, [sp, #2]
	ldrh r1, [sp, #4]
	strh r2, [r6]
	strh r0, [r6, #2]
	mov r0, r6
	strh r1, [r6, #4]
	bl ov29_02346FB8
	cmp r0, #0
	movlt r0, #0
	strltb r0, [r6, #1]
	blt _022F4B70
#ifdef JAPAN
	ldr r1, _022F4BD0 ; =DUNGEON_PTR
	mov r2, #0x23c
	ldr r1, [r1]
	add r1, r1, #0x3f4
	add r1, r1, #0x400
	mla r0, r2, r0, r1
#else
	ldr r2, _022F4BD0 ; =DUNGEON_PTR
	add r1, r0, r0, lsl #3
	ldr r0, [r2]
	add r0, r0, #0x3f4
	add r0, r0, #0x400
	add r0, r0, r1, lsl #6
#endif
	bl AddHeldItemToBag
_022F4B70:
	bl RemoveEmptyItemsInBagWrapper
	ldr r0, _022F4BD4 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	ldr r1, _022F4BD8 ; =0x00000BB6
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r7
	mov r1, r4
	bl ov29_02321164
	ldrb r0, [r5, #7]
	ldr r1, _022F4BD0 ; =DUNGEON_PTR
	cmp r0, #0
	ldreqh r0, [r5]
	orreq r0, r0, #0x4000
	streqh r0, [r5]
	ldr r1, [r1]
	mov r0, r7
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
_022F4BC0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F4BC8: .word 0x00001565
#ifdef JAPAN
_022F4BCC: .word 0x000008ED
_022F4BD0: .word DUNGEON_PTR
_022F4BD4: .word 0x00001317
_022F4BD8: .word 0x000008F5
#else
_022F4BCC: .word 0x00000BAE
_022F4BD0: .word DUNGEON_PTR
_022F4BD4: .word 0x00001317
_022F4BD8: .word 0x00000BB6
#endif
	arm_func_end ov29_022F49E0

	arm_func_start ov29_022F4BDC
ov29_022F4BDC: ; 0x022F4BDC
	stmdb sp!, {r3, lr}
	mov r1, #0
	bl ov29_022EB568
	ldr r0, [r0, #0xb4]
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0, #0x108]
#else
	strb r1, [r0, #0x109]
#endif
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022F4BDC

	arm_func_start TryPlaceItem
TryPlaceItem: ; 0x022F4BF8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r1, #0
	mov r2, #4
	ldr r6, [r5, #0xb4]
	bl GetItemToUse
	mov r4, r0
	mov r1, r4
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldrb r1, [r6, #0x4e]
	cmp r1, #0x80
	bne _022F4C3C
	ldr r1, _022F4D94 ; =0x00000BB7
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4C3C:
	cmp r1, #0x33
	bhs _022F4C78
	ldrb r0, [r4]
	tst r0, #0x10
	beq _022F4C78
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4C78
	ldr r1, _022F4D98 ; =0x00000BAE
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4C78:
	cmp r1, #0x81
	bne _022F4CA8
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4CA8
	ldr r1, _022F4D98 ; =0x00000BAE
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4CA8:
	ldrsh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x200
	beq _022F4CD0
	ldr r1, _022F4D9C ; =0x00000BB8
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4CD0:
	and r1, r1, #3
	cmp r1, #1
	beq _022F4CEC
	ldr r1, _022F4D9C ; =0x00000BB8
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4CEC:
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _022F4D08
	ldr r1, _022F4D9C ; =0x00000BB8
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4D08:
	ldrb r2, [r4]
	mov r1, r4
	mov r0, #0
	bic r2, r2, #0x10
	strb r2, [r4]
	bl PrepareItemForPrinting__02345728
	mov r1, r4
	add r0, r5, #4
	mov r2, #1
	bl SpawnItem
	cmp r0, #0
	bne _022F4D48
	ldr r1, _022F4D9C ; =0x00000BB8
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022F4D48:
	mov r0, r4
	bl ItemZInit
	bl RemoveEmptyItemsInBagWrapper
	ldr r0, _022F4DA0 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022F4DA4 ; =0x00000BB9
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	ldr r1, _022F4DA8 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F4BF8_OFFSET -0x2C1
#else
#define OV29_022F4BF8_OFFSET 0
#endif
_022F4D94: .word 0x00000BB7 + OV29_022F4BF8_OFFSET
_022F4D98: .word 0x00000BAE + OV29_022F4BF8_OFFSET
_022F4D9C: .word 0x00000BB8 + OV29_022F4BF8_OFFSET
_022F4DA0: .word 0x00001317
_022F4DA4: .word 0x00000BB9 + OV29_022F4BF8_OFFSET
_022F4DA8: .word DUNGEON_PTR
	arm_func_end TryPlaceItem

	arm_func_start ov29_022F4DAC
ov29_022F4DAC: ; 0x022F4DAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	ldr r6, [r8, #0xb4]
	mov r1, #0
	mov r2, #5
	bl GetItemToUse
	mov r4, r0
	mov r0, r8
	mov r1, #1
	mov r2, #6
	bl GetItemToUse
	ldrb r1, [r6, #0x4e]
	mov r7, r0
	cmp r1, #0x80
	beq _022F4DFC
	ldr r1, _022F503C ; =0x00000BBA
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	b _022F5034
_022F4DFC:
	ldrb r1, [r6, #0x54]
	cmp r1, #0x33
	bhs _022F4E48
	ldrb r0, [r7]
	tst r0, #0x10
	beq _022F4E48
	ldrb r0, [r7]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4E48
	mov r1, r7
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _022F5040 ; =0x00000BAE
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	b _022F5034
_022F4E48:
	cmp r1, #0x81
	bne _022F4E84
	ldrb r0, [r7]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F4E84
	mov r1, r7
	mov r0, #1
	bl PrepareItemForPrinting__02345728
#ifdef JAPAN
	mov r0, r8
	mov r1, #0x8f0
#else
	ldr r1, _022F5044 ; =0x00000BB1
	mov r0, r8
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _022F5034
_022F4E84:
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #3
	beq _022F4EB4
	ldr r1, _022F5048 ; =0x00000BBB
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	b _022F5034
_022F4EB4:
	mov r0, r4
	bl ov29_02348D3C
	ldrh r1, [r4]
	mov r5, r0
	add r0, r6, #0x50
	strh r1, [sp]
	ldrh r2, [r4, #2]
	ldrb r1, [sp]
	mov ip, #0
	strh r2, [sp, #2]
	ldrh r2, [r4, #4]
	bic r3, r1, #0x10
	mov r1, #1
	strh r2, [sp, #4]
	ldrh r2, [r7]
	strh r2, [sp, #6]
	ldrh lr, [r7, #2]
	ldrb r2, [sp, #6]
	ldrb r4, [sp, #7]
	strh lr, [sp, #8]
	ldrh lr, [r7, #4]
	bic r2, r2, #0x10
	strh lr, [sp, #0xa]
	strb ip, [sp, #7]
	strb r3, [sp]
	strb r2, [sp, #6]
	bl RemoveGroundItem
	mov r0, r7
	bl RemoveEquivItemNoHole
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _022F4F3C
	mov r0, r7
	bl ItemZInit
_022F4F3C:
	add r1, sp, #6
	add r0, r6, #0x50
	mov r2, #1
	bl SpawnItem
	cmp r0, #0
	bne _022F4F68
	ldr r1, _022F504C ; =0x00000BBC
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	bl RemoveEmptyItemsInBagWrapper
	b _022F5034
_022F4F68:
	strb r4, [sp, #1]
	ldrb r0, [r6, #0x54]
	cmp r0, #0x81
	bne _022F4F94
	ldrh r0, [sp]
	strh r0, [r6, #0x62]
	ldrh r0, [sp, #2]
	strh r0, [r6, #0x64]
	ldrh r0, [sp, #4]
	strh r0, [r6, #0x66]
	b _022F4FDC
_022F4F94:
	mov r0, r7
	bl ov29_02346FB8
	cmp r0, #0
	blt _022F4FD0
#ifdef JAPAN
	ldr r2, _022F5050 ; =DUNGEON_PTR
	mov r1, #0x23c
	ldr r3, [r2]
	ldrh r2, [sp]
	mla r1, r0, r1, r3
	add r0, r1, #0x800
	strh r2, [r0, #0x56]
#else
	ldr r1, _022F5050 ; =DUNGEON_PTR
	add r0, r0, r0, lsl #3
	ldr r2, [r1]
	ldrh r1, [sp]
	add r0, r2, r0, lsl #6
	add r0, r0, #0x800
	strh r1, [r0, #0x56]
#endif
	ldrh r1, [sp, #2]
	strh r1, [r0, #0x58]
	ldrh r1, [sp, #4]
	strh r1, [r0, #0x5a]
_022F4FD0:
	add r0, sp, #0
	mov r1, r4
	bl AddItemToBag
_022F4FDC:
	bl RemoveEmptyItemsInBagWrapper
	add r1, sp, #6
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	add r1, sp, #0
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldr r0, _022F5054 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	ldr r1, _022F5058 ; =0x00000BBD
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _022F5050 ; =DUNGEON_PTR
	mov r0, r8
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
	add r0, sp, #0
	mov r1, r5
	bl ov29_02348ECC
	cmp r0, #0
_022F5034:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F4DAC_OFFSET -0x2C1
#else
#define OV29_022F4DAC_OFFSET 0
#endif
_022F503C: .word 0x00000BBA + OV29_022F4DAC_OFFSET
_022F5040: .word 0x00000BAE + OV29_022F4DAC_OFFSET
#ifndef JAPAN
_022F5044: .word 0x00000BB1
#endif
_022F5048: .word 0x00000BBB + OV29_022F4DAC_OFFSET
_022F504C: .word 0x00000BBC + OV29_022F4DAC_OFFSET
_022F5050: .word DUNGEON_PTR
_022F5054: .word 0x00001317
_022F5058: .word 0x00000BBD + OV29_022F4DAC_OFFSET
	arm_func_end ov29_022F4DAC

	arm_func_start ov29_022F505C
ov29_022F505C: ; 0x022F505C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	ldrsh r0, [r7, #4]
	ldrsh r1, [r7, #6]
	ldr r5, [r7, #0xb4]
	bl GetTile
	mov r4, r0
	mov r0, r7
	mov r1, #0
	mov r2, #7
	bl GetItemToUse
	mov r6, r0
	mov r1, r6
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldrb r1, [r5, #0x4e]
	cmp r1, #0x33
	bhs _022F50E8
	ldrb r0, [r6]
	tst r0, #0x10
	beq _022F50E8
	ldrb r0, [r6]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F50E8
	mov r1, r6
	mov r0, #1
	bl PrepareItemForPrinting__02345728
#ifdef JAPAN
	mov r0, r7
	mov r1, #0x8f0
#else
	ldr r1, _022F5274 ; =0x00000BB1
	mov r0, r7
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _022F526C
_022F50E8:
	cmp r1, #0x81
	bne _022F5118
	ldrb r0, [r6]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F5118
#ifdef JAPAN
	ldr r1, _022F686C ; =0x000008EF
	mov r0, r7
#else
	mov r0, r7
	mov r1, #0xbb0
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _022F526C
_022F5118:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #3
	beq _022F513C
	ldr r1, _022F5278 ; =0x00000BBB
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022F526C
_022F513C:
	bl GetItemInfo
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldrh r2, [r6]
	add r0, r7, #4
	mov r1, #1
	strh r2, [sp]
	ldrh r3, [r6, #2]
	ldrb r2, [sp]
	strh r3, [sp, #2]
	ldrh ip, [r6, #4]
	bic r3, r2, #0x10
	strh ip, [sp, #4]
	ldrh r2, [r4]
	strh r2, [sp, #6]
	ldrh ip, [r4, #2]
	ldrb r2, [sp, #6]
	strh ip, [sp, #8]
	ldrh r4, [r4, #4]
	bic r2, r2, #0x10
	strh r4, [sp, #0xa]
	strb r3, [sp]
	strb r2, [sp, #6]
	bl RemoveGroundItem
	mov r0, r6
	bl RemoveEquivItemNoHole
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _022F51C0
	mov r0, r6
	bl ItemZInit
_022F51C0:
	add r1, sp, #0
	add r0, r7, #4
	mov r2, #1
	bl SpawnItem
	cmp r0, #0
	bne _022F51EC
	ldr r1, _022F527C ; =0x00000BBC
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	bl RemoveEmptyItemsInBagWrapper
	b _022F526C
_022F51EC:
	add r0, sp, #6
	bl ov29_02348D3C
	ldrb r1, [r5, #0x4e]
	mov r4, r0
	add r0, sp, #6
	cmp r1, #0x81
	bne _022F5228
	ldrh r1, [sp, #6]
	strh r1, [r5, #0x62]
	ldrh r1, [sp, #8]
	strh r1, [r5, #0x64]
	ldrh r1, [sp, #0xa]
	strh r1, [r5, #0x66]
	bl AddItemToBagNoHeld
	b _022F522C
_022F5228:
	bl AddItemToBagNoHeld
_022F522C:
	bl RemoveEmptyItemsInBagWrapper
	ldr r0, _022F5280 ; =0x00001317
	bl PlaySeByIdIfNotSilence
	ldr r1, _022F5284 ; =0x00000BBD
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	ldr r1, _022F5288 ; =DUNGEON_PTR
	mov r0, r7
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
	add r0, sp, #6
	mov r1, r4
	bl ov29_02348ECC
	cmp r0, #0
_022F526C:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F505C_OFFSET -0x2C1
#else
#define OV29_022F505C_OFFSET 0
#endif
#ifdef JAPAN
_022F686C: .word 0x000008EF
#else
_022F5274: .word 0x00000BB1
#endif
_022F5278: .word 0x00000BBB + OV29_022F505C_OFFSET
_022F527C: .word 0x00000BBC + OV29_022F505C_OFFSET
_022F5280: .word 0x00001317
_022F5284: .word 0x00000BBD + OV29_022F505C_OFFSET
_022F5288: .word DUNGEON_PTR
	arm_func_end ov29_022F505C
