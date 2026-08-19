	.include "asm/macros.inc"
	.include "overlay_29_02327DE0.inc"

	.text

	arm_func_start DoMoveWaterSpout
DoMoveWaterSpout: ; 0x02327DE0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [r0, #0xb4]
	ldr r6, _02327E8C ; =0x000003E7
	ldrsh r5, [ip, #0x12]
	ldrsh r4, [ip, #0x16]
	ldrsh ip, [ip, #0x10]
	add lr, r5, r4
	cmp lr, r6
	movle r6, lr
	mov r4, r6, asr #1
	add r4, r6, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #0
	ble _02327E64
	ldr r4, _02327E8C ; =0x000003E7
	cmp lr, r4
	movle r4, lr
	mov r5, r4, lsl #1
	mov r4, r5, asr #1
	add r4, r5, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #1
	ble _02327E64
	ldr r4, _02327E8C ; =0x000003E7
	cmp lr, r4
	movgt lr, r4
	add r4, lr, lr, lsl #1
	mov lr, r4, asr #1
	add lr, r4, lr, lsr #30
	cmp ip, lr, asr #2
	movle r5, #2
	movgt r5, #3
_02327E64:
	ldr r4, _02327E90 ; =WATER_SPOUT_DAMAGE_MULT_TABLE
	str r3, [sp]
	ldr r3, [r4, r5, lsl #2]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327E8C: .word 0x000003E7
_02327E90: .word WATER_SPOUT_DAMAGE_MULT_TABLE
	arm_func_end DoMoveWaterSpout

	arm_func_start DoMovePsychUp
DoMovePsychUp: ; 0x02327E94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r0, r6
	ldr r5, [r7, #0xb4]
	ldr r4, [r6, #0xb4]
	bl ov29_022E5474
	mov r0, #0
_02327EB4:
	add lr, r4, r0, lsl #1
	ldrsh r1, [lr, #0x24]
	add ip, r5, r0, lsl #1
	add r3, r4, r0, lsl #2
	strh r1, [ip, #0x24]
	ldrsh r1, [lr, #0x28]
	add r2, r5, r0, lsl #2
	add r0, r0, #1
	strh r1, [ip, #0x28]
	ldrsh r1, [lr, #0x2c]
	cmp r0, #2
	strh r1, [ip, #0x2c]
	ldr r1, [r3, #0x34]
	str r1, [r2, #0x34]
	ldr r1, [r3, #0x3c]
	str r1, [r2, #0x3c]
	blt _02327EB4
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02327F30 ; =0x00000D62
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, #1
	strlob r0, [r5, #0x108]
#endif
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02327F30: .word 0x00000AA2
#else
_02327F30: .word 0x00000D62
#endif
	arm_func_end DoMovePsychUp

	arm_func_start DoMoveDamageWithRecoil
DoMoveDamageWithRecoil: ; 0x02327F34
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	str r3, [sp]
	mov r3, #0x100
	mov r7, r0
	mov r6, r2
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327FFC
	mov r0, r7
	bl EntityIsValidMoveEffects__0232800C
	cmp r0, #0
	beq _02327FFC
	ldr r1, [r7, #0xb4]
	ldr r0, _02328008 ; =0x000003E7
	ldrsh r2, [r1, #0x12]
	ldrsh r1, [r1, #0x16]
	mov r4, #1
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	movs r5, r0, asr #3
	mov r0, r7
	mov r1, #7
	moveq r5, #1
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02327FFC
	mov r0, r7
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _02327FFC
	ldrh r1, [r6, #4]
	mov r2, #0
	mov r0, #0x23c
	stmia sp, {r1, r2}
	str r0, [sp, #8]
	mov r0, #0x14
	str r0, [sp, #0xc]
	mov r0, r4
	str r0, [sp, #0x10]
	mov r0, r7
	mov r1, r5
	mov r3, r2
	str r2, [sp, #0x14]
	bl CalcRecoilDamageFixed
_02327FFC:
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02328008: .word 0x000003E7
	arm_func_end DoMoveDamageWithRecoil
