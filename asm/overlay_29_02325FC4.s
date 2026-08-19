	.include "asm/macros.inc"
	.include "overlay_29_02325FC4.inc"

	.text

	arm_func_start DoMoveDig
DoMoveDig: ; 0x02325FC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl GetTileAtEntity
	mov sb, r0
	bl IsTileGround
	cmp r0, #0
	beq _02326000
	ldrh r0, [sb]
	and r0, r0, #3
	cmp r0, #1
	beq _02326014
_02326000:
	ldr r2, _0232607C ; =0x00000EC4
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326074
_02326014:
	mov r0, r8
	mov r1, r6
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02326050
	ldr r1, _02326080 ; =DIG_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	mov r0, r8
	bl EndTwoTurnMove
	b _02326070
_02326050:
	ldr r0, _02326084 ; =0x00000CD6
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #0xa
	bl BeginChargedMove
_02326070:
	mov r4, #1
_02326074:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_0232607C: .word 0x00000C06
_02326080: .word DIG_DAMAGE_MULTIPLIER
_02326084: .word 0x00000A16
#else
_0232607C: .word 0x00000EC4
_02326080: .word DIG_DAMAGE_MULTIPLIER
_02326084: .word 0x00000CD6
#endif
	arm_func_end DoMoveDig

	arm_func_start DoMoveSweetScent
DoMoveSweetScent: ; 0x02326088
	stmdb sp!, {r3, lr}
	ldr r2, _023260A4 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl LowerHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023260A4: .word SPATK_STAT_IDX
	arm_func_end DoMoveSweetScent

	arm_func_start DoMoveCharm
DoMoveCharm: ; 0x023260A8
	stmdb sp!, {r3, lr}
	ldr r2, _023260CC ; =ATK_STAT_IDX
	mov ip, #1
	ldr r2, [r2]
	mov r3, #0x80
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023260CC: .word ATK_STAT_IDX
	arm_func_end DoMoveCharm

	arm_func_start DoMoveRainDance
DoMoveRainDance: ; 0x023260D0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02326120 ; =WEATHER_MOVE_TURN_COUNT
	ldr r2, _02326124 ; =DUNGEON_PTR
	ldrsh r3, [r3]
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
#ifdef JAPAN
	add r2, r2, #0xcc00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x9e]
#else
	add r2, r2, #0xcd00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x42]
#endif
	bl TryActivateWeather
	cmp r0, #0
	bne _02326118
	ldr r2, _02326128 ; =0x00000EC5
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02326118:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02326120: .word WEATHER_MOVE_TURN_COUNT
_02326124: .word DUNGEON_PTR
#ifdef JAPAN
_02326128: .word 0x00000C07
#else
_02326128: .word 0x00000EC5
#endif
	arm_func_end DoMoveRainDance

	arm_func_start DoMoveHail
DoMoveHail: ; 0x0232612C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0232617C ; =WEATHER_MOVE_TURN_COUNT
	ldr r2, _02326180 ; =DUNGEON_PTR
	ldrsh r3, [r3]
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
#ifdef JAPAN
	add r2, r2, #0xcc00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0xa0]
#else
	add r2, r2, #0xcd00
	mov r0, #1
	mov r1, #0
	strh r3, [r2, #0x44]
#endif
	bl TryActivateWeather
	cmp r0, #0
	bne _02326174
	ldr r2, _02326184 ; =0x00000EC8
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02326174:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0232617C: .word WEATHER_MOVE_TURN_COUNT
_02326180: .word DUNGEON_PTR
#ifdef JAPAN
_02326184: .word 0x00000C0A
#else
_02326184: .word 0x00000EC8
#endif
	arm_func_end DoMoveHail
