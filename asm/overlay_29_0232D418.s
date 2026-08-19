	.include "asm/macros.inc"
	.include "overlay_29_0232D418.inc"

	.text

	arm_func_start DoMoveThunderFang
DoMoveThunderFang: ; 0x0232D418
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D4A4 ; =THUNDER_FANG_PARALYZE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D46C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictParalysisStatus
_0232D46C:
	ldr r1, _0232D4A8 ; =THUNDER_FANG_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D49C
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232D49C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D4A4: .word THUNDER_FANG_PARALYZE_CHANCE
_0232D4A8: .word THUNDER_FANG_CRINGE_CHANCE
	arm_func_end DoMoveThunderFang

	arm_func_start DoMoveDefog
DoMoveDefog: ; 0x0232D4AC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	ldr r4, [r5, #0xb4]
	bl MistIsActive
	cmp r0, #0
	bne _0232D4E0
	ldrb r0, [r4, #0xd5]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0232D4FC
_0232D4E0:
	ldr r2, _0232D550 ; =0x00000ED2
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r6
	mov r1, r5
	bl EndReflectClassStatus
_0232D4FC:
	ldr r1, _0232D554 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
	mov r0, r6
	bl GetApparentWeather
	cmp r0, #6
	bne _0232D548
	ldr r1, _0232D558 ; =WEATHER_MOVE_TURN_COUNT
	ldr r0, _0232D55C ; =DUNGEON_PTR
	ldrsh r3, [r1]
	ldr r1, [r0]
	mov r0, #1
#ifdef JAPAN
	add r2, r1, #0xcc00
	mov r1, #0
	strh r3, [r2, #0x96]
#else
	add r2, r1, #0xcd00
	mov r1, #0
	strh r3, [r2, #0x3a]
#endif
	bl TryActivateWeather
_0232D548:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_0232D550: .word 0x00000C14
#else
_0232D550: .word 0x00000ED2
#endif
_0232D554: .word SPATK_STAT_IDX
_0232D558: .word WEATHER_MOVE_TURN_COUNT
_0232D55C: .word DUNGEON_PTR
	arm_func_end DoMoveDefog

	arm_func_start DoMoveTrumpCard
DoMoveTrumpCard: ; 0x0232D560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, r2
	ldrb r4, [r6, #6]
	mov r8, r0
	mov r0, r6
	mov r7, r1
	mov r5, r3
	bl GetMaxPp
	movs r1, r0
	mov r0, #0x64
	mul r0, r4, r0
	moveq r1, #1
	bl _s32_div_f
	cmp r0, #0x19
	bgt _0232D5BC
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x140
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D5BC:
	cmp r0, #0x32
	bgt _0232D5E0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D5E0:
	cmp r0, #0x4b
	mov r0, r8
	mov r1, r7
	bgt _0232D604
	mov r2, r6
	mov r3, #0xc0
	str r5, [sp]
	bl DealDamage
	b _0232D614
_0232D604:
	mov r2, r6
	mov r3, #0x80
	str r5, [sp]
	bl DealDamage
_0232D614:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end DoMoveTrumpCard

	arm_func_start DoMoveIceFang
DoMoveIceFang: ; 0x0232D620
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, r1
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0232D6A8 ; =ICE_FANG_FREEZE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D670
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl TryInflictFrozenStatus
_0232D670:
	ldr r1, _0232D6AC ; =ICE_FANG_CRINGE_CHANCE
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r4
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232D6A0
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl TryInflictCringeStatus
_0232D6A0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232D6A8: .word ICE_FANG_FREEZE_CHANCE
_0232D6AC: .word ICE_FANG_CRINGE_CHANCE
	arm_func_end DoMoveIceFang

	arm_func_start DoMovePsychoShift
DoMovePsychoShift: ; 0x0232D6B0
	stmdb sp!, {r3, lr}
	cmp r0, r1
	beq _0232D6C8
	mov r2, #0
	mov r3, r2
	bl TransferNegativeStatusCondition
_0232D6C8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMovePsychoShift
