	.include "asm/macros.inc"
	.include "overlay_29_0232DC64.inc"

	.text

	arm_func_start DoMoveToxicSpikes
DoMoveToxicSpikes: ; 0x0232DC64
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0xb4]
	mov r5, r1
	ldrb r0, [r0, #6]
	mov r4, #0
	mov r1, #0x15
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
	beq _0232DCB4
	mov r2, r5
	add r0, r7, #4
	mov r1, #0x15
#endif
	mov r3, #1
	bl TrySpawnTrap
	cmp r0, #0
	movne r4, #1
	bne _0232DCC4
_0232DCB4:
	ldr r2, _0232DCD0 ; =0x00000EEF
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
#else
	mov r0, r7
	mov r1, r6
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DCC4:
	bl UpdateTrapsVisibility
	mov r0, r4
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0232DCD0: .word 0x00000C31
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232DCD0: .word 0x00000EEF
#endif
	arm_func_end DoMoveToxicSpikes

	arm_func_start DoMoveLastResort
DoMoveLastResort: ; 0x0232DCD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl CountMovesOutOfPp
	cmp r0, #0
	ble _0232DD10
	ldrb r1, [r6, #6]
	cmp r1, #0
	subeq r0, r0, #1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
_0232DD10:
	cmp r0, #0
	ble _0232DD44
	ldr r1, _0232DD70 ; =LAST_RESORT_DAMAGE_MULT_TABLE
	sub r0, r0, #1
	ldr r3, [r1, r0, lsl #2]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
#ifdef JAPAN
	moveq r4, #1
#else
	movgt r4, #1
#endif
	b _0232DD64
_0232DD44:
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0232DD74 ; =0x00000EBC
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_0232DD64:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232DD70: .word LAST_RESORT_DAMAGE_MULT_TABLE
#ifdef JAPAN
_0232DD74: .word 0x00000BFE
#else
_0232DD74: .word 0x00000EBC
#endif
	arm_func_end DoMoveLastResort
