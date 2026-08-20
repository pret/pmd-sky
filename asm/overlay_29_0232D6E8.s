	.include "asm/macros.inc"
	.include "overlay_29_0232D6E8.inc"

	.text

	arm_func_start DoMoveBrine
DoMoveBrine: ; 0x0232D6E8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, [r1, #0xb4]
	ldr ip, _0232D734 ; =0x000003E7
	ldrsh r4, [r5, #0x12]
	ldrsh lr, [r5, #0x16]
	add r4, r4, lr
	cmp r4, ip
	movgt r4, ip
	ldrsh ip, [r5, #0x10]
	cmp r4, ip, lsl #1
	movge r4, #2
	movlt r4, #1
	str r3, [sp]
	mov r3, r4, lsl #8
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D734: .word 0x000003E7
	arm_func_end DoMoveBrine

	arm_func_start DoMoveNaturalGift
DoMoveNaturalGift: ; 0x0232D738
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldr r0, [r7, #0xb4]
	mov r6, r1
	ldrsh r0, [r0, #0x66]
	mov r5, r2
	mov r4, r3
	cmp r0, #0
	beq _0232D7C8
	add r2, sp, #0xc
	mov r3, r5
	mov r1, #4
_0232D76C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0232D76C
	mov r0, r7
	bl GetEntityNaturalGiftInfo
	cmp r0, #0
	beq _0232D7C8
	str r4, [sp]
	ldrb r3, [r0, #2]
	add r2, sp, #0xc
	mov r1, r6
	str r3, [sp, #4]
	ldrsh r4, [r0, #4]
	mov r0, r7
	mov r3, #0x100
	str r4, [sp, #8]
	bl DealDamageWithTypeAndPowerBoost
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _0232D7F0
_0232D7C8:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0x100
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0232D7F0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end DoMoveNaturalGift

	arm_func_start DoMoveGyroBall
DoMoveGyroBall: ; 0x0232D7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr ip, [r8, #0xb4]
	mov r7, r1
#ifdef JAPAN
	ldr ip, [ip, #0x10c]
#else
	ldr ip, [ip, #0x110]
#endif
	mov r6, r2
	cmp ip, #0
	mov r5, r3
	movne r4, #1
	bne _0232D830
	ldr r2, _0232D85C ; =0x00000F0D
	mov r4, #2
	bl LogMessageByIdWithPopupCheckUserTarget
_0232D830:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r4, lsl #8
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_0232D85C: .word 0x00000C4F
#else
_0232D85C: .word 0x00000F0D
#endif
	arm_func_end DoMoveGyroBall

	arm_func_start DoMoveShadowForce
DoMoveShadowForce: ; 0x0232D860
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _0232D8CC
	ldr r1, _0232D8F4 ; =SHADOW_FORCE_DAMAGE_MULTIPLIER
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	moveq r4, #0
	mov r0, r7
	bl EndTwoTurnMove
	tst r4, #0xff
	beq _0232D8EC
	mov r0, r7
	mov r1, r6
	bl EndProtectStatus
	b _0232D8EC
_0232D8CC:
	ldr r0, _0232D8F8 ; =0x00000CD7
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, #0xd
	bl BeginChargedMove
_0232D8EC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D8F4: .word SHADOW_FORCE_DAMAGE_MULTIPLIER
#ifdef JAPAN
_0232D8F8: .word 0x00000A17
#else
_0232D8F8: .word 0x00000CD7
#endif
	arm_func_end DoMoveShadowForce
