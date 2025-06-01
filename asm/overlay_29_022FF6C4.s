	.include "asm/macros.inc"
	.include "overlay_29_022FF6C4.inc"

	.text

	arm_func_start IsInvalidSpawnTile
IsInvalidSpawnTile: ; 0x022FF6C4
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4, #0xc]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4]
	tst r1, #0x10
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r1, #0
	bl GetMobilityTypeCheckSlip
	ldrh r1, [r4]
	cmp r0, #3
	and r1, r1, #3
	addls pc, pc, r0, lsl #2
	b _022FF754
_022FF708: ; jump table
	b _022FF718 ; case 0
	b _022FF728 ; case 1
	b _022FF744 ; case 2
	b _022FF754 ; case 3
_022FF718:
	cmp r1, #1
	bne _022FF75C
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF728:
	cmp r1, #2
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r1, #1
	bne _022FF75C
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF744:
	cmp r1, #0
	beq _022FF75C
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF754:
	mov r0, #0
	ldmia sp!, {r4, pc}
_022FF75C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end IsInvalidSpawnTile

	arm_func_start ov29_022FF764
ov29_022FF764: ; 0x022FF764
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r0
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	ldr r5, [r6, #0xb4]
	bl GetTile
	ldrsh r1, [r7]
	mov r4, r0
	cmp r1, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movlt r0, #1
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, #0x38
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0x20
	movge r0, #1
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r4]
	tst r0, #0x10
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl IsCurrentTilesetBackground
	cmp r0, #0
	bne _022FF810
	ldrb r0, [r5, #0xef]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, #0x10
	bl ItemIsActive__022FF898
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FF810:
	ldrsh r1, [r5, #2]
	mov r0, r6
	bl GetMobilityTypeCheckSlipAndFloating
	ldrh r2, [r4]
#ifdef JAPAN
	mov r4, r0
	mov r0, r6
	mov r1, #0xc
	and r5, r2, #3
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r6
	mov r1, #0xd
	movne r4, #2
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r4, #3
	cmp r4, #3
	addls pc, pc, r4, lsl #2
#else
	mov r1, r0
	mov r0, r6
	and r4, r2, #3
	bl GetMobilityTypeAfterIqSkills
	cmp r0, #3
	addls pc, pc, r0, lsl #2
#endif
	b _022FF888
_022FF83C: ; jump table
	b _022FF84C ; case 0
	b _022FF85C ; case 1
	b _022FF878 ; case 2
	b _022FF888 ; case 3
_022FF84C:
#ifdef JAPAN
	cmp r5, #1
#else
	cmp r4, #1
#endif
	bne _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF85C:
#ifdef JAPAN
	cmp r5, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #1
#else
	cmp r4, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #1
#endif
	bne _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF878:
#ifdef JAPAN
	cmp r5, #0
#else
	cmp r4, #0
#endif
	beq _022FF890
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF888:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022FF890:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FF764
