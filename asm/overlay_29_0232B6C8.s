	.include "asm/macros.inc"
	.include "overlay_29_0232B6C8.inc"

	.text

	arm_func_start DoMoveSpikes
DoMoveSpikes: ; 0x0232B6C8
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x13
	cmp r0, #0
	movne r2, #2
	moveq r2, #1
	add r0, r6, #4
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	bl AreLateGameTrapsEnabledWrapper
	cmp r0, #0
	beq _0232B718
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x13
#endif
	mov r3, #1
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232B728
_0232B718:
	ldr r2, _0232B734 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232B728:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232B734: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232B734: .word 0x00000EEF
#endif
	arm_func_end DoMoveSpikes

	arm_func_start DoMoveMagnitude
DoMoveMagnitude: ; 0x0232B738
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _0232B7B0 ; =ov29_0237CA84
	ldr r5, _0232B7B4 ; =DUNGEON_PTR
	ldr ip, [r4]
	ldr r6, _0232B7B8 ; =ov29_02352B1C
	ldr r4, [r5]
	ldr r6, [r6, ip, lsl #2]
	ldr lr, [r1, #0xb4]
	add r4, r4, #0x1a000
#ifdef JAPAN
	str r6, [r4, #0x190]
#else
	str r6, [r4, #0x234]
#endif
	ldr r4, [r5]
	mov r5, #0
	add r4, r4, #0x1a000
#ifdef JAPAN
	str r5, [r4, #0x194]
#else
	str r5, [r4, #0x238]
#endif
	ldrb r4, [lr, #0xd2]
	ldr r5, _0232B7BC ; =ov10_022C4924
	mov ip, ip, lsl #1
	cmp r4, #0xa
	ldrsh r4, [r5, ip]
	str r3, [sp]
	moveq r4, r4, lsl #1
	mov r3, r4
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232B7B0: .word ov29_0237CA84
_0232B7B4: .word DUNGEON_PTR
_0232B7B8: .word ov29_02352B1C
_0232B7BC: .word ov10_022C4924
	arm_func_end DoMoveMagnitude
