	.include "asm/macros.inc"
	.include "overlay_29_0231A9F8.inc"

	.text

	arm_func_start ov29_0231A9F8
ov29_0231A9F8: ; 0x0231A9F8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x34
	mov r7, r0
	mov r1, #0
	mov r2, #0x15
	ldr r5, [r7, #0xb4]
	bl GetItemToUse
	mov r1, r0
	ldrb r0, [r1]
	ldrh r4, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1, #4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	strh r4, [sp, #0x18]
	strh r3, [sp, #0x1a]
	strh r2, [sp, #0x1c]
	tst r0, #0xff
	beq _0231AA60
	mov r0, #0
	bl PrepareItemForPrinting__02345728
	ldr r1, _0231AC90 ; =0x00000DF8
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _0231AC88
_0231AA60:
	mov r0, r7
	bl ov29_022FBAB4
	add r2, sp, #0x1e
	add r3, r5, #0x4a
	mov r1, #0xa
_0231AA74:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0231AA74
	ldr r0, _0231AC94 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreOrbsAllowed
	cmp r0, #0
	mov r4, #1
	bne _0231AAB4
	ldr r1, _0231AC98 ; =0x00000DF9
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _0231AC24
_0231AAB4:
	ldrsh r6, [sp, #0x1c]
	mov r0, r6
	bl GetItemMoveId16
	mov r1, r0
	add r0, sp, #0x10
	bl InitMove
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _0231AB18
	mov r2, r4
	mov r3, #0xa
	strb r2, [sp, #8]
	add r0, sp, #8
	mov r1, r7
#ifdef JAPAN
	add r2, r5, #0x120
#else
	add r2, r5, #0x124
#endif
	str r3, [sp, #0xc]
	bl AiConsiderMove
	ldrb r0, [sp, #8]
	cmp r0, #0
	beq _0231AB18
	ldrb r1, [sp, #9]
	mov r0, r7
	and r1, r1, #7
	strb r1, [r5, #0x4c]
	bl UpdateAiTargetPos
_0231AB18:
	ldrb r0, [r5, #0xd0]
	cmp r0, #1
	bne _0231AB48
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231AC9C ; =0x00000DFA
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r4, #0
	b _0231ABA0
_0231AB48:
	cmp r0, #7
	bne _0231AB74
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231ACA0 ; =0x00000DFB
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r4, #0
	b _0231ABA0
_0231AB74:
	ldrb r0, [r5, #0xbf]
	cmp r0, #4
	bne _0231ABA0
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231ACA4 ; =0x00000DFC
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r4, #0
_0231ABA0:
	cmp r4, #0
	beq _0231AC20
	cmp r6, #0x138
	ldrne r0, _0231ACA8 ; =0x00000141
	mov r1, #0
	cmpne r6, r0
	bne _0231AC00
	mov r0, r7
	mov r2, #0x7a
	bl RemoveUsedItem
	ldrb r2, [sp, #0x10]
	mov r0, #0xa
	mov r1, #0
	orr r2, r2, #0xc
	strb r2, [sp, #0x10]
	strb r0, [sp, #0x16]
	add r4, sp, #0x10
	mov r0, r7
	mov r2, r6
	mov r3, r1
	stmia sp, {r1, r4}
	bl ov29_02322374
	mov r4, #0
	b _0231AC24
_0231AC00:
	add r4, sp, #0x10
	mov r0, r7
	mov r2, r6
	mov r3, r1
	stmia sp, {r1, r4}
	bl ov29_02322374
	mov r4, r0
	b _0231AC24
_0231AC20:
	mov r4, #0
_0231AC24:
	mov r0, r7
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _0231AC60
	cmp r4, #0
	beq _0231AC4C
	mov r0, r7
	mov r1, #0
	mov r2, #0x7a
	bl RemoveUsedItem
_0231AC4C:
	mov r0, r7
	bl EnemyEvolution
	mov r0, r7
	bl ov29_02321274
	b _0231AC74
_0231AC60:
	cmp r4, #0
	beq _0231AC74
	add r0, sp, #0x1e
	mov r1, #0
	bl ov29_022EB4E8
_0231AC74:
	bl IsFloorOver
	cmp r0, #0
	bne _0231AC88
	mov r0, r7
	bl TryActivateTruant
_0231AC88:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_0231A9F8_OFFSET -0x2C0
#else
#define OV29_0231A9F8_OFFSET 0
#endif
_0231AC90: .word 0x00000DF8 + OV29_0231A9F8_OFFSET
_0231AC94: .word DUNGEON_PTR
_0231AC98: .word 0x00000DF9 + OV29_0231A9F8_OFFSET
_0231AC9C: .word 0x00000DFA + OV29_0231A9F8_OFFSET
_0231ACA0: .word 0x00000DFB + OV29_0231A9F8_OFFSET
_0231ACA4: .word 0x00000DFC + OV29_0231A9F8_OFFSET
_0231ACA8: .word 0x00000141
	arm_func_end ov29_0231A9F8
