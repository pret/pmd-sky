	.include "asm/macros.inc"
	.include "overlay_29_0232C310.inc"

	.text

	arm_func_start DoMoveTakeaway
DoMoveTakeaway: ; 0x0232C310
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r8, r0
	mov r7, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232C4DC
	mov r2, r4
	mov r0, r8
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232C4BC
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	ldr r6, [r7, #0xb4]
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, r4
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r8
	mov r1, r7
	mov r2, #0x2c
#ifndef JAPAN
	mov r3, r4
#endif
	bl DefenderAbilityIsActiveMoveEffects__0232BDD0
	cmp r0, #0
	beq _0232C3B0
#ifdef JAPAN
	mov r0, r8
	mov r1, r7
	mov r2, #0xc40
#else
	ldr r2, _0232C4E8 ; =0x00000EFE
	mov r0, r8
	mov r1, r7
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r4
	b _0232C4E0
_0232C3B0:
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, r4
	moveq r0, #0
	tst r0, #0xff
	beq _0232C3E0
	ldr r2, _0232C4EC ; =0x00000EFA
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	b _0232C4E0
_0232C3E0:
	ldrb r0, [r6, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0232C410
	ldr r2, _0232C4F0 ; =0x00000EFB
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	b _0232C4E0
_0232C410:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0232C440
	bl IsBagFull
	cmp r0, #0
	beq _0232C440
	ldr r2, _0232C4F4 ; =0x00000EFC
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	b _0232C4E0
_0232C440:
	ldrh r0, [r6, #0x62]
	strh r0, [r5, #0x62]
	ldrh r0, [r6, #0x64]
	strh r0, [r5, #0x64]
	ldrh r0, [r6, #0x66]
	strh r0, [r5, #0x66]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0232C46C
	mov r0, r5
	bl AddHeldItemToBag
_0232C46C:
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0232C480
	add r0, r6, #0x62
	bl RemoveEquivItem
_0232C480:
	add r0, r6, #0x62
	bl ItemZInit
	mov r0, r8
	bl ov29_022F9EA0
	mov r0, r7
	bl ov29_022F9EA0
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
#endif
	ldr r2, _0232C4F8 ; =0x00000EF9
	mov r1, r7
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r5, #0x107]
#else
	strlob r0, [r5, #0x108]
#endif
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0232C4DC
_0232C4BC:
	mov r0, r7
	bl EntityIsValidMoveEffects__0232C500
	cmp r0, #0
	beq _0232C4DC
	ldr r2, _0232C4FC ; =0x00000EFD
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_0232C4DC:
	mov r0, r4
_0232C4E0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define DO_MOVE_TAKEAWAY_OFFSET -0x2BE
#else
#define DO_MOVE_TAKEAWAY_OFFSET 0
#endif
#ifndef JAPAN
_0232C4E8: .word 0x00000EFE
#endif
_0232C4EC: .word 0x00000EFA + DO_MOVE_TAKEAWAY_OFFSET
_0232C4F0: .word 0x00000EFB + DO_MOVE_TAKEAWAY_OFFSET
_0232C4F4: .word 0x00000EFC + DO_MOVE_TAKEAWAY_OFFSET
_0232C4F8: .word 0x00000EF9 + DO_MOVE_TAKEAWAY_OFFSET
_0232C4FC: .word 0x00000EFD + DO_MOVE_TAKEAWAY_OFFSET
	arm_func_end DoMoveTakeaway
