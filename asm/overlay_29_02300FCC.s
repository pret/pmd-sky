	.include "asm/macros.inc"
	.include "overlay_29_02300FCC.inc"

	.text

	arm_func_start ov29_02300FCC
ov29_02300FCC: ; 0x02300FCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _02301050 ; =DIRECTIONS_XY
	mov ip, r4, lsl #2
	ldr r0, _02301054 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r1, ip]
	ldrsh lr, [r5, #4]
	ldrsh r1, [r0, ip]
	ldrsh r2, [r5, #6]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	bl GetTile
	ldr r1, _02301058 ; =DIRECTIONAL_BIT_MASKS__02352790
	and r2, r4, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02301050: .word DIRECTIONS_XY
_02301054: .word DIRECTIONS_XY + 2
_02301058: .word DIRECTIONAL_BIT_MASKS__02352790
	arm_func_end ov29_02300FCC

	arm_func_start ov29_0230105C
ov29_0230105C: ; 0x0230105C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r2, [r6, #0xb4]
	mov r5, r1
	ldrsh r1, [r2, #2]
	bl GetMobilityTypeCheckSlipAndFloating
	ldr r2, _0230110C ; =DIRECTIONS_XY
	mov ip, r5, lsl #2
	ldr r1, _02301110 ; =DIRECTIONS_XY + 2
	ldrsh r3, [r2, ip]
	ldrsh lr, [r6, #4]
	mov r4, r0
	ldrsh r2, [r6, #6]
	ldrsh r1, [r1, ip]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x10
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ldrne r0, [r0]
	cmpne r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
#ifdef JAPAN
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _023024DC_JP
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #3
	moveq r4, #3
	beq _023024DC_JP
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r4, #3
	bne _023024DC_JP
	mov r0, r6
	mov r1, #0xc
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #2
	bne _023024DC_JP
	mov r0, r6
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _023024DC_JP
	tst r5, #1
	movne r4, #2
	moveq r4, #3
_023024DC_JP:
#else
	mov r0, r6
	mov r1, r4
	and r2, r5, #0xff
	bl GetDirectionalMobilityType
	mov r4, r0
#endif
	ldrsh r0, [r6, #4]
	ldrsh r1, [r6, #6]
	bl GetTile
	add r0, r0, r4
	ldr r1, _02301114 ; =DIRECTIONAL_BIT_MASKS__02352788
	and r2, r5, #7
	ldrb r1, [r1, r2]
	ldrb r0, [r0, #8]
	tst r1, r0
#ifdef JAPAN
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
#else
	moveq r0, #0
	movne r0, #1
#endif
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230110C: .word DIRECTIONS_XY
_02301110: .word DIRECTIONS_XY + 2
_02301114: .word DIRECTIONAL_BIT_MASKS__02352788
	arm_func_end ov29_0230105C
