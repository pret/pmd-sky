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
