	.include "asm/macros.inc"
	.include "overlay_29_02326220.inc"

	.text

	arm_func_start DoMoveRage
DoMoveRage: ; 0x02326220
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, _02326260 ; =0x00000CCF
	mov r5, r1
	mov r4, r2
	bl StringFromId
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0xc
	bl BeginChargedMove
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02326260: .word 0x00000A0F
#else
_02326260: .word 0x00000CCF
#endif
	arm_func_end DoMoveRage

	arm_func_start DoMoveSuperFang
DoMoveSuperFang: ; 0x02326264
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	mov r7, r1
	ldr r5, [r7, #0xb4]
	mov r4, #0
	ldrsh r5, [r5, #0x10]
	mov r8, r0
	mov r6, r2
	add r2, r5, r5, lsr #31
	mov r5, r3
	strb r4, [sp, #0x1c]
	movs sl, r2, asr #1
	beq _02326304
	mov r0, r6
	bl GetMoveType
	mov r4, r0
	ldrh r0, [r6, #4]
	bl GetMoveCategory
	mov sb, r0
	mov r1, r5
	mov r0, r6
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r4, sb}
	str r0, [sp, #0xc]
	mov r5, #0
	str r5, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r7
	mov r2, sl
	mov r0, r8
	str r5, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r5
	strb r0, [sp, #0x1c]
	b _0232630C
_02326304:
	ldr r2, _02326318 ; =0x00000EC9
	bl LogMessageByIdWithPopupCheckUserTarget
_0232630C:
	ldrb r0, [sp, #0x1c]
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#ifdef JAPAN
_02326318: .word 0x00000C0B
#else
_02326318: .word 0x00000EC9
#endif
	arm_func_end DoMoveSuperFang

	arm_func_start DoMovePainSplit
DoMovePainSplit: ; 0x0232631C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r4, [r6, #0xb4]
	ldr r0, [r5, #0xb4]
	ldrsh r3, [r4, #0x10]
	ldrsh r2, [r0, #0x10]
	ldr r1, _02326400 ; =0x000003E7
	add r2, r3, r2
	add r2, r2, r2, lsr #31
	mov r2, r2, lsl #0xf
	mov r2, r2, asr #0x10
	strh r2, [r4, #0x10]
	strh r2, [r0, #0x10]
	ldrsh r3, [r4, #0x12]
	ldrsh r2, [r4, #0x16]
	add r3, r3, r2
	cmp r3, r1
	ldrsh r2, [r4, #0x10]
	movle r1, r3
	cmp r2, r1
	ble _02326384
	ldr r1, _02326400 ; =0x000003E7
	cmp r3, r1
	movgt r3, r1
	strh r3, [r4, #0x10]
_02326384:
	ldrsh r2, [r0, #0x12]
	ldrsh r1, [r0, #0x16]
	ldr r3, _02326400 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r3
	ldrsh r1, [r0, #0x10]
	movle r3, r2
	cmp r1, r3
	ble _023263B8
	ldr r1, _02326400 ; =0x000003E7
	cmp r2, r1
	movgt r2, r1
	strh r2, [r0, #0x10]
_023263B8:
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
#ifdef JAPAN
	ldrb r0, [r4, #0x107]
#else
	ldrb r0, [r4, #0x108]
#endif
	ldr r2, _02326404 ; =0x00000ECA
	mov r1, r5
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r4, #0x107]
#else
	strlob r0, [r4, #0x108]
#endif
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02326400: .word 0x000003E7
#ifdef JAPAN
_02326404: .word 0x00000C0C
#else
_02326404: .word 0x00000ECA
#endif
	arm_func_end DoMovePainSplit

	arm_func_start DoMoveTorment
DoMoveTorment: ; 0x02326408
#ifdef JAPAN
#define DO_MOVE_TORMENT_OFFSET -4
#else
#define DO_MOVE_TORMENT_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	ldr r8, [sb, #0xb4]
	mov r7, #0
	mov sl, r0
	mov r6, r7
	add r5, r8, #0x124 + DO_MOVE_TORMENT_OFFSET
	mov fp, #1
_0232642C:
	ldrb r0, [r5, r6, lsl #3]
	mov r4, r6, lsl #3
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _023264A0
	ldrb r0, [r5, r4]
	tst r0, #0x20
	bne _02326494
	tst r0, #0x10
	beq _023264A0
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	add r2, r5, r4
	mov r3, r1
	bl FormatMoveStringMore
	ldr r2, _02326548 ; =0x00000ECB
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrb r0, [r5, r4]
	mov r7, #1
	orr r0, r0, #0x20
	strb r0, [r5, r4]
	b _023264A0
_02326494:
	tst r0, #0x10
	biceq r0, r0, #0x20
	streqb r0, [r5, r4]
_023264A0:
	add r6, r6, #1
	cmp r6, #4
	blt _0232642C
	ldrb r0, [r8, #0x144 + DO_MOVE_TORMENT_OFFSET]
	tst r0, #0x20
	bne _02326504
	tst r0, #0x10
	beq _02326510
	add r0, sp, #0
	mov r1, #0x160
	bl InitMove
	ldrb r0, [r8, #0x144 + DO_MOVE_TORMENT_OFFSET]
	mov r7, #1
	orr r0, r0, #0x20
	strb r0, [r8, #0x144 + DO_MOVE_TORMENT_OFFSET]
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	add r2, sp, #0
	mov r3, r1
	bl FormatMoveStringMore
	ldr r2, _02326548 ; =0x00000ECB
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326510
_02326504:
	tst r0, #0x10
	biceq r0, r0, #0x20
	streqb r0, [r8, #0x144 + DO_MOVE_TORMENT_OFFSET]
_02326510:
	cmp r7, #0
	beq _0232652C
	ldrb r0, [r8, #0xd2]
	cmp r0, #1
	moveq r0, #0
	streqb r0, [r8, #0xd2]
	b _0232653C
_0232652C:
	ldr r2, _0232654C ; =0x00000ECC
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0232653C:
	mov r0, r7
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02326548: .word 0x00000C0D
_0232654C: .word 0x00000C0E
#else
_02326548: .word 0x00000ECB
_0232654C: .word 0x00000ECC
#endif
	arm_func_end DoMoveTorment
