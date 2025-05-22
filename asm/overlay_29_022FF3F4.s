	.include "asm/macros.inc"
	.include "overlay_29_022FF3F4.inc"

	.text

	arm_func_start ov29_022FF3F4
ov29_022FF3F4: ; 0x022FF3F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r4, #0
	ldr r6, [r7, #0xb4]
	mov r0, r4
	mov r1, r7
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	add r0, r6, #0x4a
	mov r1, #1
	bl SetMonsterActionFields
	ldrb r0, [r6, #0xbd]
	cmp r0, #1
	cmpne r0, #3
	cmpne r0, #5
	bne _022FF448
	ldr r1, _022FF60C ; =0x00000C2E
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF448:
	ldrb r0, [r6, #0xc4]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _022FF4B8
_022FF458: ; jump table
	b _022FF4B8 ; case 0
	b _022FF474 ; case 1
	b _022FF4B8 ; case 2
	b _022FF488 ; case 3
	b _022FF49C ; case 4
	b _022FF4B8 ; case 5
	b _022FF4B0 ; case 6
_022FF474:
	ldr r1, _022FF610 ; =0x00000C28
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF488:
	ldr r1, _022FF614 ; =0x00000C29
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF49C:
	ldr r1, _022FF618 ; =0x00000C2A
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF4B0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF4B8:
	ldrb r0, [r6, #0xd0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022FF51C
_022FF4C8: ; jump table
	b _022FF51C ; case 0
	b _022FF51C ; case 1
	b _022FF4EC ; case 2
	b _022FF4F4 ; case 3
	b _022FF51C ; case 4
	b _022FF51C ; case 5
	b _022FF51C ; case 6
	b _022FF508 ; case 7
	b _022FF51C ; case 8
_022FF4EC:
	mov r4, #1
	b _022FF51C
_022FF4F4:
	ldr r1, _022FF61C ; =0x00000C2B
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF508:
	ldr r1, _022FF620 ; =0x00000C2C
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF51C:
	ldrb r0, [r6, #0xd2]
	cmp r0, #1
	bne _022FF53C
	ldr r1, _022FF624 ; =0x00000C2D
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF53C:
	cmp r0, #0
	cmpne r0, #0xb
	cmpne r0, #0xc
	beq _022FF604
	cmp r4, #0
	beq _022FF564
	ldr r1, _022FF628 ; =0x00000C2F
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022FF5FC
_022FF564:
	mov r5, #0
#ifdef JAPAN
	add r4, r6, #0x120
#else
	add r4, r6, #0x124
#endif
	mov r8, r5
	mov sb, #1
	b _022FF5F4
_022FF578:
	ldrb r0, [r4, r5, lsl #3]
	mov r1, r5, lsl #3
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _022FF5F0
	mov r0, r7
	add r1, r4, r1
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _022FF5F0
	ldrb r0, [r6, #0xd4]
	cmp r0, r5
	bne _022FF5F0
	b _022FF5CC
_022FF5B8:
	add r0, r6, r5, lsl #3
#ifdef JAPAN
	ldrb r0, [r0, #0x120]
#else
	ldrb r0, [r0, #0x124]
#endif
	tst r0, #2
	beq _022FF5D4
	sub r5, r5, #1
_022FF5CC:
	cmp r5, #0
	bgt _022FF5B8
_022FF5D4:
	ldrb r1, [r6, #0x4e]
	mov r2, r5, lsl #0x10
	add r0, r6, #0x4a
	mov r2, r2, asr #0x10
	bl SetActionUseMovePlayer
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FF5F0:
	add r5, r5, #1
_022FF5F4:
	cmp r5, #4
	blt _022FF578
_022FF5FC:
	mov r0, r7
	bl ov29_02318D58
_022FF604:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022FF3F4_OFFSET -0x2C1
#else
#define OV29_022FF3F4_OFFSET 0
#endif
_022FF60C: .word 0x00000C2E + OV29_022FF3F4_OFFSET
_022FF610: .word 0x00000C28 + OV29_022FF3F4_OFFSET
_022FF614: .word 0x00000C29 + OV29_022FF3F4_OFFSET
_022FF618: .word 0x00000C2A + OV29_022FF3F4_OFFSET
_022FF61C: .word 0x00000C2B + OV29_022FF3F4_OFFSET
_022FF620: .word 0x00000C2C + OV29_022FF3F4_OFFSET
_022FF624: .word 0x00000C2D + OV29_022FF3F4_OFFSET
_022FF628: .word 0x00000C2F + OV29_022FF3F4_OFFSET
	arm_func_end ov29_022FF3F4

	arm_func_start GetMobilityTypeCheckSlip
GetMobilityTypeCheckSlip: ; 0x022FF62C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetMobilityType
	cmp r4, #0
	beq _022FF660
	cmp r0, #0
	cmpne r0, #4
	moveq r1, #1
	movne r1, #0
	tst r1, #0xff
	ldrne r0, _022FF670 ; =ov29_0237C9B8
	ldrneb r0, [r0, #5]
	ldmneia sp!, {r4, pc}
_022FF660:
	cmp r0, #4
	ldrhs r1, _022FF670 ; =ov29_0237C9B8
	ldrhsb r0, [r1, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FF670: .word ov29_0237C9B8
	arm_func_end GetMobilityTypeCheckSlip

	arm_func_start GetMobilityTypeCheckSlipAndFloating
GetMobilityTypeCheckSlipAndFloating: ; 0x022FF674
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xef]
	cmp r0, #4
	moveq r2, #1
	movne r2, #0
	mov r0, r1
	and r1, r2, #0xff
	bl GetMobilityTypeCheckSlip
	mov r4, r0
	cmp r4, #3
	beq _022FF6BC
	mov r0, r5
	bl IsFloating
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
_022FF6BC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMobilityTypeCheckSlipAndFloating

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
