	.include "asm/macros.inc"
	.include "overlay_29_023260A8.inc"

	.text

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
