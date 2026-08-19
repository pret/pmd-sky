	.include "asm/macros.inc"
	.include "overlay_29_0232C524.inc"

	.text

	arm_func_start DoMoveRebound
DoMoveRebound: ; 0x0232C524
	stmdb sp!, {r3, lr}
	mov r2, #0xa
	bl SetReflectStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveRebound

	arm_func_start DoMoveSwitchPositions
DoMoveSwitchPositions: ; 0x0232C538
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
#ifdef JAPAN
	ldrb r2, [r3, #0x107]
	cmp r2, #1
	movlo r2, #1
	strlob r2, [r3, #0x107]
#else
	ldrb r2, [r3, #0x108]
	cmp r2, #1
	movlo r2, #1
	strlob r2, [r3, #0x108]
#endif
	mov r2, #1
	bl TrySwitchPlace
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSwitchPositions

	arm_func_start DoMoveStayAway
DoMoveStayAway: ; 0x0232C560
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryWarp
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveStayAway

	arm_func_start DoMoveCleanse
DoMoveCleanse: ; 0x0232C578
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldr r1, [sb, #0xb4]
	mov sl, r0
	ldrb r0, [r1, #6]
	mov r6, #0
	cmp r0, #0
	bne _0232C66C
	mov fp, #1
	ldr r4, _0232C6A8 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, r6
	mov r8, r6
	mov r5, fp
	mov r3, #6
_0232C5B0:
	mul r0, r2, r3
	ldr r1, [r4]
	ldr r1, [r1, #0x384]
	ldrb r7, [r1, r0]
	tst r7, #1
	movne r7, fp
	moveq r7, r8
	tst r7, #0xff
	beq _0232C5E8
	ldrb r7, [r1, r0]
	tst r7, #8
	bicne r7, r7, #8
	movne r6, r5
	strneb r7, [r1, r0]
_0232C5E8:
	add r2, r2, #1
	cmp r2, #0x32
	blt _0232C5B0
	mov r8, #0
	ldr r4, _0232C6AC ; =DUNGEON_PTR
	mov fp, r8
	mov r5, #1
_0232C604:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValidMoveEffects__0232C500
	cmp r0, #0
	beq _0232C660
	ldr r1, [r7, #0xb4]
	ldrb r0, [r1, #0x62]
	tst r0, #1
	movne r2, r5
	moveq r2, fp
	tst r2, #0xff
	beq _0232C660
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r1, #0x62]
	movne r6, #1
	bicne r0, r0, #8
	strneb r0, [r1, #0x62]
_0232C660:
	add r8, r8, #1
	cmp r8, #4
	blt _0232C604
_0232C66C:
	cmp r6, #0
	beq _0232C688
	ldr r2, _0232C6B0 ; =0x00000EFF
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232C698
_0232C688:
#ifdef JAPAN
	ldr r2, _0232DAF8 ; =0x00000C42
	mov r0, sl
	mov r1, sb
#else
	mov r0, sl
	mov r1, sb
	mov r2, #0xf00
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232C698:
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232C6A8: .word BAG_ITEMS_PTR_MIRROR
_0232C6AC: .word DUNGEON_PTR
#ifdef JAPAN
_0232C6B0: .word 0x00000C41
_0232DAF8: .word 0x00000C42
#else
_0232C6B0: .word 0x00000EFF
#endif
	arm_func_end DoMoveCleanse

	arm_func_start DoMoveSiesta
DoMoveSiesta: ; 0x0232C6B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _0232C6EC ; =SLEEP_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	mov r3, #1
	bl TryInflictSleepStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232C6EC: .word SLEEP_TURN_RANGE
	arm_func_end DoMoveSiesta

	arm_func_start DoMoveTwoEdge
DoMoveTwoEdge: ; 0x0232C6F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov sb, r1
	strb r4, [sp, #0x1d]
	strb r4, [sp, #0x1c]
	mov sl, r0
	ldr r1, [sb, #0xb4]
	mov r8, r2
	ldrsh r0, [r1, #0x10]
	mov r7, r3
	ldr r6, [sl, #0xb4]
	subs r5, r0, #1
	ldrh r0, [r8, #4]
	movmi r5, r4
	bl GetMoveCategory
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	mov r2, r5
	add r5, sp, #0x1d
	mov r3, #0
	str r5, [sp]
	stmib sp, {r3, r4}
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r1, sb
	str r3, [sp, #0x18]
	mov r0, sl
	bl CalcDamageFixedWrapper
	ldrsh r0, [r6, #0x10]
	add r0, r0, r0, lsr #31
	movs r5, r0, asr #1
	ldrh r0, [r8, #4]
	movmi r5, #0
	bl GetMoveCategory
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl GetDamageSourceWrapper
	add r1, sp, #0x1c
	mov r3, #0
	stmia sp, {r1, r3, r4}
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, sl
	mov r1, sl
	mov r2, r5
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1d]
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	ldrb r0, [sp, #0x1c]
	strb r1, [sp, #0x1d]
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	ldrb r0, [sp, #0x1d]
	strb r1, [sp, #0x1c]
	cmp r0, #0
	bne _0232C800
	tst r1, #0xff
	beq _0232C808
_0232C800:
	mov r0, #1
	b _0232C80C
_0232C808:
	mov r0, #0
_0232C80C:
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end DoMoveTwoEdge
