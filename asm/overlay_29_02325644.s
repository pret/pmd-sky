	.include "asm/macros.inc"
	.include "overlay_29_02325644.inc"

	.text

	arm_func_start ov29_02325644
ov29_02325644: ; 0x02325644
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	mov r0, r6
	mov r4, r3
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, r4
	bl GetMoveAnimationId
	bl GetMoveAnimation
	ldrh r1, [r7]
	ldrsh r0, [r0, #2]
	cmp r1, #0
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, #1
	bl ov29_02325D7C
	mov r0, #0x5a
	bl AdvanceFrame
	mov r0, r7
	bl ov10_022BED90
	mov r1, r6
	mov r2, #1
	bl ov29_022E6D68
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_02325644

	arm_func_start PlayMoveAnimation
PlayMoveAnimation: ; 0x023256B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	mov r8, r2
	mov sb, r1
	mov r1, r8
	mov sl, r0
	mov r7, r3
	bl ShouldMovePlayAlternativeAnimation
	cmp r0, #0
	movne r4, #1
	mov r0, sl
	moveq r4, #0
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r8, #4]
	mov r2, r4
	bl GetMoveAnimationId
	mov r4, r0
	bl GetMoveAnimation
	ldrsh r5, [r0, #4]
	mov r0, sb
	mov r6, #0
	bl EntityIsValid__02325620
	cmp r0, #0
	beq _02325730
	mov r0, sb
	ldr r6, [sb, #0xb4]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	bne _02325740
	b _023258E0
_02325730:
	mov r0, r7
	bl ov29_022E2CA0
	cmp r0, #0
	beq _023258E0
_02325740:
	cmp r6, #0
	cmpeq r4, #0x1f4
	beq _023258E0
	mov r0, sl
	mov r1, r8
	bl ov29_02325D20
	cmp r0, #0
	bne _023258E0
	cmp r5, #0
	beq _023258E0
	ldr r1, _023258E8 ; =ov29_02352AD8
	mov r0, r5
	ldrh r2, [r1]
	ldrh r1, [r1, #2]
	strh r2, [sp]
	strh r1, [sp, #2]
	bl GetEffectAnimation
	ldrsb r5, [r0, #0x19]
	mvn r0, #0
	cmp r5, r0
	beq _023257C8
	mov r0, sb
	bl EntityIsValid__02325620
	cmp r0, #0
	ldreqh r1, [sp]
	ldreqh r0, [sp, #2]
	streqh r1, [sp, #0xc]
	streqh r0, [sp, #0xe]
	beq _023257D8
	add r0, sp, #0xc
	add r1, sb, #0x2c
	and r2, r5, #0xff
	bl sub_0201CF90
	b _023257D8
_023257C8:
	ldrh r1, [sp]
	ldrh r0, [sp, #2]
	strh r1, [sp, #0xc]
	strh r0, [sp, #0xe]
_023257D8:
	strh r4, [sp, #4]
	cmp r6, #0
	beq _02325828
	ldrsh r1, [r6, #4]
	cmp r4, #0x1f4
	mov r0, #0
	strh r1, [sp, #6]
	ldr r1, [sb, #0xc]
	cmpne r4, #0x50
	mov r1, r1, asr #8
	strh r1, [sp, #8]
	ldr r1, [sb, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	str r0, [sp, #0x10]
	ldreq r0, [sl, #0xb4]
	ldreqb r0, [r0, #0x4c]
	andeq r0, r0, #7
	streq r0, [sp, #0x10]
	b _0232586C
_02325828:
	mov r0, #1
	strh r0, [sp, #6]
	ldrsh r2, [r7]
	mov r0, #0x18
	mov r1, #0
	smulbb r2, r2, r0
	add r2, r2, #0xc
	mov r2, r2, lsl #8
	mov r2, r2, asr #8
	strh r2, [sp, #8]
	ldrsh r2, [r7, #2]
	smulbb r0, r2, r0
	add r0, r0, #0x10
	mov r0, r0, lsl #8
	mov r0, r0, asr #8
	strh r0, [sp, #0xa]
	str r1, [sp, #0x10]
_0232586C:
	mov r1, #0
	add r0, sp, #4
	str r1, [sp, #0x14]
	bl ov10_022BF160
	cmp r0, #0
	beq _02325894
	mov r0, #0x5d
	bl ov29_0234BA54
	mov r0, #0x5d
	bl AdvanceFrame
_02325894:
	add r0, sp, #4
	bl ov10_022BFC5C
	mov r4, r0
	mov r0, #0x5b
	bl AdvanceFrame
	mov r0, r4
	mov r1, sb
	mov r2, #6
	bl ov29_022E6D68
	mov r0, r4, lsl #0x10
	mov r4, r0, asr #0x10
	mov r5, #0x28
	b _023258D0
_023258C8:
	mov r0, r5
	bl AdvanceFrame
_023258D0:
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	bne _023258C8
_023258E0:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023258E8: .word ov29_02352AD8
	arm_func_end PlayMoveAnimation

	arm_func_start ov29_023258EC
ov29_023258EC: ; 0x023258EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x2c
	mov sl, r2
	mov r4, r1
	mov r1, sl
	mov r5, r0
	bl ShouldMovePlayAlternativeAnimation
	cmp r0, #0
	movne r6, #1
	mov r0, r5
	moveq r6, #0
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sl, #4]
	mov r2, r6
	bl GetMoveAnimationId
	mov r6, r0
	bl GetMoveAnimation
	ldrsh r7, [r0, #4]
	mov r0, r4
	bl EntityIsValid__02325620
	cmp r0, #0
	bne _02325958
	mov r0, r5
	bl EntityIsValid__02325620
	cmp r0, #0
	beq _02325B04
_02325958:
	mov r0, r5
	ldr r8, [r5, #0xb4]
	ldr sb, [r4, #0xb4]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325B04
	mov r0, r4
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325B04
	mov r0, r5
	mov r1, sl
	bl ov29_02325D20
	cmp r0, #0
	bne _02325B04
	cmp r8, #0
	cmpne sb, #0
	beq _02325B04
	cmp r7, #0
	beq _02325B04
	ldr r1, _02325B0C ; =ov29_02352AD8
	mov r0, r7
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	strh r2, [sp]
	strh r1, [sp, #2]
	bl GetEffectAnimation
	ldrsb ip, [r0, #0x19]
	mov r0, #0
	add r7, sp, #0x18
	strh r6, [sp, #0x18]
	sub r6, r0, #1
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldmia r7!, {r0, r1, r2, r3}
	cmp ip, r6
	ldr r6, [r7]
	add r7, sp, #4
	stmia r7!, {r0, r1, r2, r3}
	str r6, [r7]
	beq _02325A24
	and r6, ip, #0xff
	add r0, sp, #0x20
	mov r2, r6
	add r1, r4, #0x2c
	bl sub_0201CF90
	add r0, sp, #0xc
	mov r2, r6
	add r1, r5, #0x2c
	bl sub_0201CF90
	b _02325A3C
_02325A24:
	ldrh r1, [sp]
	ldrh r0, [sp, #2]
	strh r1, [sp, #0x20]
	strh r0, [sp, #0x22]
	strh r1, [sp, #0xc]
	strh r0, [sp, #0xe]
_02325A3C:
	ldrsh r1, [sb, #4]
	add r0, sp, #0x18
	strh r1, [sp, #0x1a]
	ldr r1, [r4, #0xc]
	mov r1, r1, asr #8
	strh r1, [sp, #0x1c]
	ldr r1, [r4, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0x1e]
	ldrsh r1, [r8, #4]
	strh r1, [sp, #6]
	ldr r1, [r5, #0xc]
	mov r1, r1, asr #8
	strh r1, [sp, #8]
	ldr r1, [r5, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	bl ov10_022BF160
	cmp r0, #0
	beq _02325A9C
	mov r0, #0x5d
	bl ov29_0234BA54
	mov r0, #0x5d
	bl AdvanceFrame
_02325A9C:
	add r0, sp, #0x18
	bl ov10_022BFC5C
	mov r7, r0
	add r0, sp, #4
	bl ov10_022BFC5C
	mov r6, r0
	mov r0, #0x5b
	bl AdvanceFrame
	mov r0, r7
	mov r1, r4
	mov r2, #6
	bl ov29_022E6D68
	mov r0, r6
	mov r1, r5
	mov r2, #6
	bl ov29_022E6D68
	mov r0, r7, lsl #0x10
	mov r4, r0, asr #0x10
	mov r5, #0x28
	b _02325AF4
_02325AEC:
	mov r0, r5
	bl AdvanceFrame
_02325AF4:
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	bne _02325AEC
_02325B04:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02325B0C: .word ov29_02352AD8
	arm_func_end ov29_023258EC

	arm_func_start GetMoveAnimationId
GetMoveAnimationId: ; 0x02325B10
	cmp r0, #0x1f
	bne _02325B68
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02325B64
_02325B24: ; jump table
	b _02325B44 ; case 0
	b _02325B48 ; case 1
	b _02325B50 ; case 2
	b _02325B44 ; case 3
	b _02325B58 ; case 4
	b _02325B60 ; case 5
	b _02325B44 ; case 6
	b _02325B60 ; case 7
_02325B44:
	bx lr
_02325B48:
	ldr r0, _02325C44 ; =0x0000021F
	bx lr
_02325B50:
	ldr r0, _02325C48 ; =0x00000222
	bx lr
_02325B58:
	ldr r0, _02325C4C ; =0x00000221
	bx lr
_02325B60:
	mov r0, #0x220
_02325B64:
	bx lr
_02325B68:
	cmp r2, #0
	bxeq lr
	cmp r0, #0x9c
	bgt _02325BDC
	cmp r0, #0x97
	blt _02325B98
	beq _02325C2C
	cmp r0, #0x99
	beq _02325C34
	cmp r0, #0x9c
	ldreq r0, _02325C50 ; =0x00000229
	bx lr
_02325B98:
	cmp r0, #0x3c
	bgt _02325BC0
	bge _02325C24
	cmp r0, #8
	bgt _02325BB4
	ldreq r0, _02325C54 ; =0x00000223
	bx lr
_02325BB4:
	cmp r0, #0x19
	ldreq r0, _02325C58 ; =0x0000022D
	bx lr
_02325BC0:
	cmp r0, #0x4b
	bgt _02325BD0
	ldreq r0, _02325C5C ; =0x00000225
	bx lr
_02325BD0:
	cmp r0, #0x64
	ldreq r0, _02325C60 ; =0x00000226
	bx lr
_02325BDC:
	cmp r0, #0xed
	bgt _02325C04
	bge _02325C3C
	cmp r0, #0xcd
	bgt _02325BF8
	ldreq r0, _02325C64 ; =0x0000022A
	bx lr
_02325BF8:
	cmp r0, #0xe3
	ldreq r0, _02325C68 ; =0x0000022E
	bx lr
_02325C04:
	cmp r0, #0x15c
	bgt _02325C14
	ldreq r0, _02325C6C ; =0x0000022B
	bx lr
_02325C14:
	ldr r1, _02325C70 ; =0x000001DD
	cmp r0, r1
	moveq r0, #0x230
	bx lr
_02325C24:
	mov r0, #0x224
	bx lr
_02325C2C:
	ldr r0, _02325C74 ; =0x00000227
	bx lr
_02325C34:
	mov r0, #0x228
	bx lr
_02325C3C:
	mov r0, #0x22c
	bx lr
	.align 2, 0
_02325C44: .word 0x0000021F
_02325C48: .word 0x00000222
_02325C4C: .word 0x00000221
_02325C50: .word 0x00000229
_02325C54: .word 0x00000223
_02325C58: .word 0x0000022D
_02325C5C: .word 0x00000225
_02325C60: .word 0x00000226
_02325C64: .word 0x0000022A
_02325C68: .word 0x0000022E
_02325C6C: .word 0x0000022B
_02325C70: .word 0x000001DD
_02325C74: .word 0x00000227
	arm_func_end GetMoveAnimationId

	arm_func_start ShouldMovePlayAlternativeAnimation
ShouldMovePlayAlternativeAnimation: ; 0x02325C78
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r1, [r4, #4]
	mov r5, r0
	cmp r1, #0xed
	bne _02325CC8
	bl EntityIsValid__02325620
	cmp r0, #0
	beq _02325D04
	ldr r0, [r5]
	cmp r0, #1
	bne _02325D04
	ldr r1, [r5, #0xb4]
	ldrb r0, [r1, #0x5e]
	cmp r0, #0xe
	ldrneb r0, [r1, #0x5f]
	cmpne r0, #0xe
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02325CC8:
	cmp r1, #0x19
	cmpne r1, #0xe3
	bne _02325CEC
	mov r0, r5
	bl IsMonsterSleeping
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_02325CEC:
	cmp r1, #0x97
	bne _02325D04
	bl GetApparentWeather
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_02325D04:
	mov r0, r5
	mov r1, r4
	bl IsChargingTwoTurnMove
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShouldMovePlayAlternativeAnimation

	arm_func_start ov29_02325D20
ov29_02325D20: ; 0x02325D20
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r1, [r4, #4]
	mov r5, r0
	cmp r1, #0x9c
	bne _02325D4C
	bl GetTileAtEntity
	bl ov29_02337E2C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02325D4C:
	ldrh r0, [r4, #4]
	cmp r0, #8
	bne _02325D74
	mov r0, r5
	bl GetTileAtEntity
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02325D74:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02325D20

	arm_func_start ov29_02325D7C
ov29_02325D7C: ; 0x02325D7C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl ov10_022BF160
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x5d
	bl ov29_0234BA54
	mov r0, #0x5d
	bl AdvanceFrame
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #5
	mov r1, #0
	bl ov29_022EA428
	mov r0, #0x5c
	bl AdvanceFrame
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02325D7C

	arm_func_start DoMoveDamage__02325DC0
DoMoveDamage__02325DC0: ; 0x02325DC0
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDamage__02325DC0

	arm_func_start DoMoveIronTail
DoMoveIronTail: ; 0x02325DE4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02325E50
	ldr r1, _02325E5C ; =IRON_TAIL_LOWER_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02325E50
	ldr r0, _02325E60 ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_02325E50:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02325E5C: .word IRON_TAIL_LOWER_DEFENSE_CHANCE
_02325E60: .word ATK_STAT_IDX
	arm_func_end DoMoveIronTail

	arm_func_start DoMoveDamageMultihitUntilMiss
DoMoveDamageMultihitUntilMiss: ; 0x02325E64
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, _02325EB8 ; =ROLLOUT_ICE_BALL_SUCCESSIVE_HITS
	str r3, [sp]
	ldr ip, [ip]
	ldr r3, _02325EBC ; =ROLLOUT_DAMAGE_MULT_TABLE
	mov r4, #0
	ldr r3, [r3, ip, lsl #2]
	bl DealDamage
	cmp r0, #0
	ldreq r0, _02325EC0 ; =ROLLOUT_ICE_BALL_MISSED
	moveq r1, #1
	streqb r1, [r0]
	ldr r1, _02325EB8 ; =ROLLOUT_ICE_BALL_SUCCESSIVE_HITS
	movne r4, #1
	ldr r2, [r1]
	mov r0, r4
	add r2, r2, #1
	str r2, [r1]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02325EB8: .word ROLLOUT_ICE_BALL_SUCCESSIVE_HITS
_02325EBC: .word ROLLOUT_DAMAGE_MULT_TABLE
_02325EC0: .word ROLLOUT_ICE_BALL_MISSED
	arm_func_end DoMoveDamageMultihitUntilMiss

	arm_func_start DoMoveYawn
DoMoveYawn: ; 0x02325EC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02325EFC ; =YAWN_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	add r2, r2, #1
	bl TryInflictYawningStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02325EFC: .word YAWN_TURN_RANGE
	arm_func_end DoMoveYawn

	arm_func_start DoMoveSleep
DoMoveSleep: ; 0x02325F00
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02325F38 ; =SLEEP_TURN_RANGE
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
_02325F38: .word SLEEP_TURN_RANGE
	arm_func_end DoMoveSleep

	arm_func_start DoMoveNightmare
DoMoveNightmare: ; 0x02325F3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02325F70 ; =NIGHTMARE_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl TryInflictNightmareStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02325F70: .word NIGHTMARE_TURN_RANGE
	arm_func_end DoMoveNightmare

	arm_func_start DoMoveMorningSun
DoMoveMorningSun: ; 0x02325F74
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02325FB0 ; =MORNING_SUN_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02325FB0: .word MORNING_SUN_HP_RESTORATION_TABLE
	arm_func_end DoMoveMorningSun

	arm_func_start DoMoveVitalThrow
DoMoveVitalThrow: ; 0x02325FB4
	stmdb sp!, {r3, lr}
	bl TryInflictVitalThrowStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveVitalThrow

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
	bl ov29_02337E2C
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
	bl ov29_02318D58
	b _02326070
_02326050:
	ldr r0, _02326084 ; =0x00000CD6
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #0xa
	bl ov29_02318BBC
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

	arm_func_start DoMoveHealStatus
DoMoveHealStatus: ; 0x02326188
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl EndNegativeStatusConditionWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHealStatus

	arm_func_start DoMoveBubble
DoMoveBubble: ; 0x023261A0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023261FC
	ldr r1, _02326208 ; =BUBBLE_LOWER_SPEED_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023261FC
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
_023261FC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326208: .word BUBBLE_LOWER_SPEED_CHANCE
	arm_func_end DoMoveBubble

	arm_func_start DoMoveEncore
DoMoveEncore: ; 0x0232620C
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl TryInflictEncoreStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveEncore

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
	bl ov29_02318BBC
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
	bl ov29_0234B034
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
	bl ov29_0234B034
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

	arm_func_start DoMoveStringShot
DoMoveStringShot: ; 0x02326550
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, r2
	bl LowerSpeed
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveStringShot

	arm_func_start DoMoveSwagger
DoMoveSwagger: ; 0x02326568
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	mov r3, #0
	mov r5, r0
	mov r4, r1
	bl TryInflictConfusedStatus
	ldr r1, _023265A0 ; =ATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #2
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023265A0: .word ATK_STAT_IDX
	arm_func_end DoMoveSwagger

	arm_func_start DoMoveSnore
DoMoveSnore: ; 0x023265A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl IsMonsterSleeping
	cmp r0, #0
	beq _02326624
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326634
	ldr r1, _02326640 ; =SNORE_CRINGE_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326634
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictCringeStatus
	b _02326634
_02326624:
	ldr r2, _02326644 ; =0x00000ECD
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02326634:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326640: .word SNORE_CRINGE_CHANCE
#ifdef JAPAN
_02326644: .word 0x00000C0F
#else
_02326644: .word 0x00000ECD
#endif
	arm_func_end DoMoveSnore

	arm_func_start DoMoveScreech
DoMoveScreech: ; 0x02326648
	stmdb sp!, {r3, lr}
	ldr r2, _0232666C ; =ATK_STAT_IDX
	mov ip, #1
	ldr r2, [r2]
	mov r3, #0x40
	str ip, [sp]
	bl ApplyDefensiveStatMultiplier
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232666C: .word ATK_STAT_IDX
	arm_func_end DoMoveScreech

	arm_func_start DoMoveDamageCringe30
DoMoveDamageCringe30: ; 0x02326670
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023266CC
	ldr r1, _023266D8 ; =ROCK_SLIDE_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023266CC
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_023266CC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023266D8: .word ROCK_SLIDE_CRINGE_CHANCE
	arm_func_end DoMoveDamageCringe30

	arm_func_start DoMoveWeatherBall
DoMoveWeatherBall: ; 0x023266DC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetApparentWeather
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl EndFrozenStatus
	ldr ip, _02326748 ; =WEATHER_BALL_DAMAGE_MULT_TABLE
	ldr r2, _0232674C ; =WEATHER_BALL_TYPE_TABLE
	ldr ip, [ip, r4, lsl #2]
	ldrb r2, [r2, r4]
	str ip, [sp]
	mov r0, r8
	mov r1, r7
	mov r3, r6
	str r5, [sp, #4]
	bl DealDamageWithType
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326748: .word WEATHER_BALL_DAMAGE_MULT_TABLE
_0232674C: .word WEATHER_BALL_TYPE_TABLE
	arm_func_end DoMoveWeatherBall

	arm_func_start DoMoveWhirlpool
DoMoveWhirlpool: ; 0x02326750
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r6, r0
	ldrb r0, [r1, #0xd2]
	mov r1, r5
	mov r4, #0
	cmp r0, #9
	moveq ip, #0x200
	movne ip, #0x100
	str r3, [sp]
	mov r0, r6
	mov r3, ip
	bl DealDamage
	cmp r0, #0
	beq _023267C8
	ldr r1, _023267D4 ; =WHIRLPOOL_CONSTRICTION_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023267C8
	mov r0, r6
	mov r1, r5
	mov r2, #0x3b
	mov r3, #0
	bl TryInflictConstrictionStatus
_023267C8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023267D4: .word WHIRLPOOL_CONSTRICTION_CHANCE
	arm_func_end DoMoveWhirlpool

	arm_func_start DoMoveFakeTears
DoMoveFakeTears: ; 0x023267D8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _02326808 ; =SPATK_STAT_IDX
	mov ip, #1
	ldr r2, [r2]
	str ip, [sp]
	mov r3, #2
	str ip, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326808: .word SPATK_STAT_IDX
	arm_func_end DoMoveFakeTears

	arm_func_start DoMoveSpite
DoMoveSpite: ; 0x0232680C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	ldr r1, [r5, #0xb4]
	mov r4, #0
#ifdef JAPAN
	add lr, r1, #0x120
#else
	add lr, r1, #0x124
#endif
	mov ip, #1
	mov r6, r0
	mov r7, r4
	mov r3, r4
	mov r1, r4
	mov r0, ip
_02326838:
	ldrb r2, [lr, r7, lsl #3]
	add r8, lr, r7, lsl #3
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02326864
	ldrb r2, [r8]
	tst r2, #0x10
	movne r4, r0
	strneb r1, [r8, #6]
_02326864:
	add r7, r7, #1
	cmp r7, #4
	blt _02326838
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	cmp r4, #0
	beq _0232689C
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
	mov r2, #0xc10
#else
	ldr r2, _023268B4 ; =0x00000ECE
	mov r0, r6
	mov r1, r5
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023268AC
_0232689C:
	ldr r2, _023268B8 ; =0x00000ECF
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023268AC:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_023268B8: .word 0x00000C11
#else
_023268B4: .word 0x00000ECE
_023268B8: .word 0x00000ECF
#endif
	arm_func_end DoMoveSpite

	arm_func_start DoMoveFocusEnergy
DoMoveFocusEnergy: ; 0x023268BC
	stmdb sp!, {r3, lr}
	bl TryInflictFocusEnergyStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveFocusEnergy

	arm_func_start DoMoveSmokescreen
DoMoveSmokescreen: ; 0x023268CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _02326904 ; =SMOKESCREEN_TURN_RANGE
	mov r0, r4
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl TryInflictWhifferStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02326904: .word SMOKESCREEN_TURN_RANGE
	arm_func_end DoMoveSmokescreen

	arm_func_start DoMoveMirrorMove
DoMoveMirrorMove: ; 0x02326908
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EndFrozenStatus
	mov r0, r5
	mov r1, r4
	bl TryInflictMirrorMoveStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveMirrorMove

	arm_func_start DoMoveOverheat
DoMoveOverheat: ; 0x0232692C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	ldr r5, [sb, #0xb4]
	mov r6, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, #0x100
	str r6, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326988
	mov r1, r4
	mov r0, sb
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	movne r0, r4
#ifdef JAPAN
	strneb r0, [r5, #0x15b]
#else
	strneb r0, [r5, #0x15f]
#endif
_02326988:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveOverheat

	arm_func_start DoMoveAuroraBeam
DoMoveAuroraBeam: ; 0x02326990
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023269F8
	ldr r1, _02326A04 ; =AURORA_BEAM_LOWER_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023269F8
	ldr r0, _02326A08 ; =ATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	mov r3, #0x80
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
_023269F8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326A04: .word AURORA_BEAM_LOWER_ATTACK_CHANCE
_02326A08: .word ATK_STAT_IDX
	arm_func_end DoMoveAuroraBeam

	arm_func_start DoMoveMemento
DoMoveMemento: ; 0x02326A0C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r2, _02326A6C ; =ATK_STAT_IDX
	ldr r4, [r6, #0xb4]
	mov ip, #1
	strh ip, [r4, #0x10]
	ldr r2, [r2]
	mov r3, #0x40
	mov r5, r1
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
	ldr r0, _02326A70 ; =SPATK_STAT_IDX
	mov ip, #1
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	mov r3, #0x40
	str ip, [sp]
	bl ApplyOffensiveStatMultiplier
	mov r0, #1
#ifdef JAPAN
	strb r0, [r4, #0x15a]
#else
	strb r0, [r4, #0x15e]
#endif
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326A6C: .word ATK_STAT_IDX
_02326A70: .word SPATK_STAT_IDX
	arm_func_end DoMoveMemento

	arm_func_start DoMoveOctazooka
DoMoveOctazooka: ; 0x02326A74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02326AD4
	ldr r1, _02326AE0 ; =OCTAZOOKA_LOWER_ACCURACY_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326AD4
	ldr r1, _02326AE4 ; =ATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r5
	mov r3, #0
	bl LowerHitChanceStat
_02326AD4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02326AE0: .word OCTAZOOKA_LOWER_ACCURACY_CHANCE
_02326AE4: .word ATK_STAT_IDX
	arm_func_end DoMoveOctazooka

	arm_func_start DoMoveFlatter
DoMoveFlatter: ; 0x02326AE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	mov r3, #0
	mov r5, r0
	mov r4, r1
	bl TryInflictConfusedStatus
	ldr r1, _02326B20 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02326B20: .word SPATK_STAT_IDX
	arm_func_end DoMoveFlatter

	arm_func_start DoMoveWillOWisp
DoMoveWillOWisp: ; 0x02326B24
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r5, r1
	bl FlashFireShouldActivate
	movs r4, r0
	beq _02326B94
	ldr r3, [r5, #0xb4]
#ifdef JAPAN
	ldrb r0, [r3, #0x158]
#else
	ldrb r0, [r3, #0x15c]
#endif
	cmp r0, #0
	bne _02326BAC
	mov r0, #1
	mov r1, r5
	mov r2, #0
#ifdef JAPAN
	strb r0, [r3, #0x158]
#else
	strb r0, [r3, #0x15c]
#endif
	bl SubstitutePlaceholderStringTags
	cmp r4, #1
	bne _02326B80
	ldr r2, _02326BB8 ; =0x00000CDD
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326BAC
_02326B80:
	ldr r2, _02326BBC ; =0x00000CDC
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02326BAC
_02326B94:
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, #1
	str r2, [sp]
	bl TryInflictBurnStatus
_02326BAC:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02326BB8: .word 0x00000A1D
_02326BBC: .word 0x00000A1C
#else
_02326BB8: .word 0x00000CDD
_02326BBC: .word 0x00000CDC
#endif
	arm_func_end DoMoveWillOWisp

	arm_func_start DoMoveReturn
DoMoveReturn: ; 0x02326BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov sb, r0
	mov r4, r3
	mov r8, r1
	mov r7, r2
	ldr lr, [sb, #0xb4]
	mov r6, #1
	mov ip, #0
	ldr r3, _02326C98 ; =ov10_022C4C0C
	ldr r0, _02326C9C ; =0x000003E7
	b _02326C18
_02326BF0:
	mov r5, ip, lsl #2
	ldrsh r2, [r3, r5]
	cmp r2, #0
	blt _02326C20
	ldrsh r1, [lr, #0xe]
	cmp r1, r2
	ldrlt r0, _02326CA0 ; =ov10_022C4C0E
	ldrltsh r6, [r0, r5]
	blt _02326C20
	add ip, ip, #1
_02326C18:
	cmp ip, r0
	blt _02326BF0
_02326C20:
	mov r0, r7
	bl GetMoveType
	mov r5, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r4
	mov r4, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	add r3, sp, #0x1c
	stmia sp, {r3, r5}
	str r4, [sp, #8]
	mov r2, r6
	str r0, [sp, #0xc]
	mov r6, #0
	str r6, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r1, r8
	mov r0, sb
	str r6, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, r6
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02326C98: .word ov10_022C4C0C
_02326C9C: .word 0x000003E7
_02326CA0: .word ov10_022C4C0E
	arm_func_end DoMoveReturn

	arm_func_start DoMoveGrudge
DoMoveGrudge: ; 0x02326CA4
	ldr ip, _02326CB0 ; =TryInflictGrudgeStatus
	mov r2, #1
	bx ip
	.align 2, 0
_02326CB0: .word TryInflictGrudgeStatus
	arm_func_end DoMoveGrudge

	arm_func_start DoMoveCounter
DoMoveCounter: ; 0x02326CB4
	stmdb sp!, {r3, lr}
	mov r2, #4
	bl ov29_02318D98
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveCounter

	arm_func_start DoMoveDamageBurn10FlameWheel
DoMoveDamageBurn10FlameWheel: ; 0x02326CC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326D40
	ldr r1, _02326D4C ; =FLAME_WHEEL_BURN_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326D40
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_02326D40:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326D4C: .word FLAME_WHEEL_BURN_CHANCE
	arm_func_end DoMoveDamageBurn10FlameWheel

	arm_func_start DoMoveDamageBurn10
DoMoveDamageBurn10: ; 0x02326D50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, #0
	bl EndFrozenStatus
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02326DC8
	ldr r1, _02326DD4 ; =FLAMETHROWER_BURN_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02326DC8
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl TryInflictBurnStatus
_02326DC8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02326DD4: .word FLAMETHROWER_BURN_CHANCE
	arm_func_end DoMoveDamageBurn10

	arm_func_start DoMoveExpose
DoMoveExpose: ; 0x02326DD8
	stmdb sp!, {r3, lr}
	ldrh r3, [r2, #4]
	ldr r2, _02326E00 ; =0x0000013B
	cmp r3, r2
	moveq r2, #0x7a
	movne r2, #0x51
	mov r3, #0
	bl TryInflictExposedStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326E00: .word 0x0000013B
	arm_func_end DoMoveExpose

	arm_func_start DoMoveDoubleTeam
DoMoveDoubleTeam: ; 0x02326E04
	stmdb sp!, {r3, lr}
	ldr r2, _02326E1C ; =SPATK_STAT_IDX
	ldr r2, [r2]
	bl BoostHitChanceStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326E1C: .word SPATK_STAT_IDX
	arm_func_end DoMoveDoubleTeam

	arm_func_start DoMoveGust
DoMoveGust: ; 0x02326E20
	stmdb sp!, {r3, lr}
	ldr ip, [r1, #0xb4]
	mov lr, #1
	ldrb ip, [ip, #0xd2]
	add ip, ip, #0xf9
	and ip, ip, #0xff
	cmp ip, #1
	movls lr, #2
	str r3, [sp]
	mov r3, lr, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveGust

	arm_func_start DoMoveBoostDefense1
DoMoveBoostDefense1: ; 0x02326E60
	stmdb sp!, {r3, lr}
	ldr r2, _02326E7C ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326E7C: .word ATK_STAT_IDX
	arm_func_end DoMoveBoostDefense1

	arm_func_start DoMoveParalyze__02326E80
DoMoveParalyze__02326E80: ; 0x02326E80
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl TryInflictParalysisStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveParalyze__02326E80

	arm_func_start DoMoveBoostAttack1
DoMoveBoostAttack1: ; 0x02326E98
	stmdb sp!, {r3, lr}
	ldr r2, _02326EB4 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	bl BoostOffensiveStat
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02326EB4: .word ATK_STAT_IDX
	arm_func_end DoMoveBoostAttack1

	arm_func_start DoMoveRazorWind
DoMoveRazorWind: ; 0x02326EB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02326F14
	ldr r1, _02326F40 ; =RAZOR_WIND_DAMAGE_MULTIPLIER
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r7
	and r4, r1, #0xff
	bl ov29_02318D58
	b _02326F38
_02326F14:
	ldr r0, _02326F44 ; =0x00000CCD
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #4
	bl ov29_02318BBC
	mov r4, #1
_02326F38:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02326F40: .word RAZOR_WIND_DAMAGE_MULTIPLIER
#ifdef JAPAN
_02326F44: .word 0x00000A0D
#else
_02326F44: .word 0x00000CCD
#endif
	arm_func_end DoMoveRazorWind

	arm_func_start DoMoveBide
DoMoveBide: ; 0x02326F48
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, _02326F88 ; =0x00000CCE
	mov r5, r1
	mov r4, r2
	bl StringFromId
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #1
	bl ov29_02318BBC
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02326F88: .word 0x00000A0E
#else
_02326F88: .word 0x00000CCE
#endif
	arm_func_end DoMoveBide

	arm_func_start DoMoveBideUnleash
DoMoveBideUnleash: ; 0x02326F8C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x20
	mov r3, #0
	mov r6, r0
	strb r3, [sp, #0x1c]
	ldr r3, [r6, #0xb4]
	ldr r0, _0232702C ; =0x000003E7
	ldr r3, [r3, #0xb8]
	mov r8, r2
	mov r4, r3, lsl #1
	cmp r0, r3, lsl #1
	movlt r4, r0
	mov r0, r8
	mov r5, r1
	bl GetMoveType
	mov r7, r0
	ldrh r0, [r8, #4]
	bl GetMoveCategory
	add r2, sp, #0x1c
	stmia sp, {r2, r7}
	str r0, [sp, #8]
	ldr r1, _02327030 ; =0x0000023E
	mov ip, #0
	str r1, [sp, #0xc]
	str ip, [sp, #0x10]
	mov r3, #1
	str r3, [sp, #0x14]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	str ip, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232702C: .word 0x000003E7
_02327030: .word 0x0000023E
	arm_func_end DoMoveBideUnleash

	arm_func_start DoMoveCrunch
DoMoveCrunch: ; 0x02327034
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023270A0
	ldr r1, _023270AC ; =CRUNCH_LOWER_DEFENSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023270A0
	ldr r0, _023270B0 ; =ATK_STAT_IDX
	mov r3, r4
	ldr r2, [r0]
	mov r0, r6
	mov r1, r5
	str r3, [sp]
	mov ip, #0
	str ip, [sp, #4]
	bl LowerDefensiveStat
_023270A0:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023270AC: .word CRUNCH_LOWER_DEFENSE_CHANCE
_023270B0: .word ATK_STAT_IDX
	arm_func_end DoMoveCrunch

	arm_func_start DoMoveDamageCringe20
DoMoveDamageCringe20: ; 0x023270B4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327110
	ldr r1, _0232711C ; =BITE_CRINGE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327110
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictCringeStatus
_02327110:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0232711C: .word BITE_CRINGE_CHANCE
	arm_func_end DoMoveDamageCringe20

	arm_func_start DoMoveDamageParalyze20
DoMoveDamageParalyze20: ; 0x02327120
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _0232717C
	ldr r1, _02327188 ; =THUNDER_PARALYZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _0232717C
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictParalysisStatus
_0232717C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327188: .word THUNDER_PARALYZE_CHANCE
	arm_func_end DoMoveDamageParalyze20

	arm_func_start DoMoveEndeavor
DoMoveEndeavor: ; 0x0232718C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r4, #0
	mov sb, r0
	strb r4, [sp, #0x1c]
	mov r8, r1
	ldr r1, [r8, #0xb4]
	ldr r0, [sb, #0xb4]
	ldrsh r1, [r1, #0x10]
	ldrsh r0, [r0, #0x10]
	mov r7, r2
	mov r6, r3
	subs r5, r1, r0
	mov r0, r8
	movmi r5, r4
	bl MirrorMoveIsActive
	cmp r0, #0
	mov r0, r7
	movne r8, sb
	bl GetMoveType
	mov r4, r0
	ldrh r0, [r7, #4]
	bl GetMoveCategory
	mov r1, r6
	mov r6, r0
	mov r0, r7
	bl GetDamageSourceWrapper
	mov r2, r5
	add r5, sp, #0x1c
	str r5, [sp]
	stmib sp, {r4, r6}
	str r0, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	mov r4, #1
	str r4, [sp, #0x14]
	mov r1, r8
	mov r0, sb
	str r3, [sp, #0x18]
	bl CalcDamageFixedWrapper
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, r4
	movne r0, #0
	strb r0, [sp, #0x1c]
	and r0, r0, #0xff
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveEndeavor

	arm_func_start DoMoveFacade
DoMoveFacade: ; 0x0232724C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov lr, #0x100
	ldrb ip, [ip, #0xbf]
	cmp ip, #0
	ldrne ip, _02327288 ; =FACADE_DAMAGE_MULTIPLIER
	str r3, [sp]
	ldrne lr, [ip]
	mov r3, lr
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02327288: .word FACADE_DAMAGE_MULTIPLIER
	arm_func_end DoMoveFacade

	arm_func_start DoMoveDamageLowerSpeed20
DoMoveDamageLowerSpeed20: ; 0x0232728C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023272E8
	ldr r1, _023272F4 ; =CONSTRICT_LOWER_SPEED_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023272E8
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
_023272E8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023272F4: .word CONSTRICT_LOWER_SPEED_CHANCE
	arm_func_end DoMoveDamageLowerSpeed20

	arm_func_start DoMoveBrickBreak
DoMoveBrickBreak: ; 0x023272F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r5, [r6, #0xb4]
	mov r7, r0
	str r3, [sp]
	mov r3, #0x100
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, r4
	orr r0, r4, r0
	ands r4, r0, #0xff
	beq _0232735C
	ldrb r0, [r5, #0xd5]
	cmp r0, #1
	cmpne r0, #3
	bne _0232735C
	ldr r2, _02327364 ; =0x00000ED2
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl EndReflectClassStatus
_0232735C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
_02327364: .word 0x00000C14
#else
_02327364: .word 0x00000ED2
#endif
	arm_func_end DoMoveBrickBreak

	arm_func_start DoMoveDamageLowerSpeed100
DoMoveDamageLowerSpeed100: ; 0x02327368
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023273C0
	mov r2, r4
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _023273C0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl LowerSpeed
_023273C0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end DoMoveDamageLowerSpeed100

	arm_func_start DoMoveFocusPunch
DoMoveFocusPunch: ; 0x023273CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02327428
	ldr r1, _02327454 ; =FOCUS_PUNCH_DAMAGE_MULTIPLIER
	mov r0, r7
	ldr r3, [r1]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r7
	and r4, r1, #0xff
	bl ov29_02318D58
	b _0232744C
_02327428:
#ifdef JAPAN
	mov r0, #0xa10
#else
	mov r0, #0xcd0
#endif
	bl StringFromId
	str r0, [sp]
	mov r0, r7
	mov r1, r7
	mov r3, r5
	mov r2, #5
	bl ov29_02318BBC
	mov r4, #1
_0232744C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02327454: .word FOCUS_PUNCH_DAMAGE_MULTIPLIER
	arm_func_end DoMoveFocusPunch

	arm_func_start DoMoveDamageDrain
DoMoveDamageDrain: ; 0x02327458
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r5, r3
	cmp sb, r8
	mov r4, #0
	beq _023274B8
	cmp sb, #0
	moveq r0, r4
	beq _02327498
	ldr r0, [sb]
	cmp r0, #1
	moveq r0, #1
	movne r0, r4
	and r0, r0, #0xff
_02327498:
	cmp r0, #0
	beq _023274B8
	mov r0, sb
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r6, #0
	bne _023274C8
_023274B8:
	mov r0, r8
	mov r1, #0x3a
	bl AbilityIsActiveVeneer
	mov r6, r0
_023274C8:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, #0x100
	str r5, [sp]
	bl DealDamage
	movs r5, r0
	movne r4, #1
	cmp r4, #0
	beq _02327590
	mov r0, sb
	mov r1, #0
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _02327590
	ldr r1, [sb, #0xb4]
	add r0, r5, r5, lsr #31
	mov r5, r0, asr #1
#ifdef JAPAN
	ldrb r0, [r1, #0x107]
#else
	ldrb r0, [r1, #0x108]
#endif
	mov r4, #1
	cmp r5, #1
	movlt r5, r4
	cmp r0, #1
	movlo r0, #1
#ifdef JAPAN
	strlob r0, [r1, #0x107]
#else
	strlob r0, [r1, #0x108]
#endif
	cmp r6, #0
	beq _0232754C
	mov r2, #0xd
	mov r0, sb
	mov r1, r5
	add r3, r2, #0x22c
	bl ApplyDamageAndEffectsWrapper
	b _02327590
_0232754C:
	ldr r1, [sb, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _0232756C
#ifdef JAPAN
	add r0, r1, #0x224
#else
	add r0, r1, #0x228
#endif
	mov r1, #0x57
	bl ExclusiveItemEffectFlagTest
_0232756C:
	cmp r0, #0
	movne r5, r5, lsl #1
	mov r6, #1
	mov r0, sb
	mov r1, sb
	mov r2, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_02327590:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveDamageDrain

	arm_func_start DoMoveReversal
DoMoveReversal: ; 0x02327598
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr ip, [r0, #0xb4]
	ldr r6, _02327644 ; =0x000003E7
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
	ble _0232761C
	ldr r4, _02327644 ; =0x000003E7
	cmp lr, r4
	movle r4, lr
	mov r5, r4, lsl #1
	mov r4, r5, asr #1
	add r4, r5, r4, lsr #30
	cmp ip, r4, asr #2
	movle r5, #1
	ble _0232761C
	ldr r4, _02327644 ; =0x000003E7
	cmp lr, r4
	movgt lr, r4
	add r4, lr, lr, lsl #1
	mov lr, r4, asr #1
	add lr, r4, lr, lsr #30
	cmp ip, lr, asr #2
	movle r5, #2
	movgt r5, #3
_0232761C:
	ldr r4, _02327648 ; =REVERSAL_DAMAGE_MULT_TABLE
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
_02327644: .word 0x000003E7
_02327648: .word REVERSAL_DAMAGE_MULT_TABLE
	arm_func_end DoMoveReversal

	arm_func_start DoMoveSmellingSalt
DoMoveSmellingSalt: ; 0x0232764C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr ip, [r4, #0xb4]
	mov r5, r0
	ldrb ip, [ip, #0xbf]
	cmp ip, #4
	str r3, [sp]
	bne _02327694
	mov r3, #0x200
	bl DealDamage
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r1, r4
	mov r0, r5
	and r4, r2, #0xff
	bl EndBurnClassStatus
	b _023276AC
_02327694:
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r4, r0, #0xff
_023276AC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoMoveSmellingSalt

	arm_func_start DoMoveMetalSound
DoMoveMetalSound: ; 0x023276B4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _023276E4 ; =SPATK_STAT_IDX
	mov ip, #1
	ldr r2, [r2]
	str ip, [sp]
	mov r3, #3
	str ip, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_023276E4: .word SPATK_STAT_IDX
	arm_func_end DoMoveMetalSound

	arm_func_start DoMoveTickle
DoMoveTickle: ; 0x023276E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r2, _02327740 ; =SPATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2, #4]
	str r3, [sp]
	mov r5, r0
	mov r4, r1
	str r2, [sp, #8]
	str r3, [sp, #4]
	bl LowerOffensiveStat
	add r0, sp, #8
	mov r3, #1
	ldr r2, [r0]
	str r3, [sp]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #4]
	bl LowerDefensiveStat
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02327740: .word SPATK_STAT_IDX
	arm_func_end DoMoveTickle

	arm_func_start DoMoveShadowHold
DoMoveShadowHold: ; 0x02327744
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl TryInflictShadowHoldStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveShadowHold

	arm_func_start DoMoveHaze
DoMoveHaze: ; 0x02327758
	stmdb sp!, {r3, lr}
	mov r2, #1
	bl TryResetStatChanges
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveHaze

	arm_func_start DoMoveDamageMultihitFatigue
DoMoveDamageMultihitFatigue: ; 0x0232776C
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023277AC
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	ldrne r0, _023277B4 ; =MULTIHIT_FATIGUE_MOVE_USED
	movne r1, r4
	strneb r1, [r0]
_023277AC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023277B4: .word MULTIHIT_FATIGUE_MOVE_USED
	arm_func_end DoMoveDamageMultihitFatigue

	arm_func_start DoMoveDamageWeightDependent
DoMoveDamageWeightDependent: ; 0x023277B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r1, [r6, #0xb4]
	mov r7, r0
	ldrsh r0, [r1, #4]
	mov r5, r2
	mov r4, r3
	bl GetWeightMultiplier
	mov r3, r0
	mov r0, r7
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMoveDamageWeightDependent

	arm_func_start DoMoveDamageBoostAllStats
DoMoveDamageBoostAllStats: ; 0x02327804
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023278D4
	ldr r1, _023278E0 ; =SILVER_WIND_BOOST_CHANCE
	mov r0, r6
	ldrsh r1, [r1]
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023278D4
	mov r0, r6
	mov r1, r6
	mov r2, #0
	mov r3, r4
	ldr r5, [r6, #0xb4]
	bl BoostSpeedOneStage
	ldr r1, _023278E4 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1, #4]
	mov r1, r6
	mov r3, r4
	str r2, [sp, #8]
	bl BoostOffensiveStat
	ldr r1, _023278E4 ; =SPATK_STAT_IDX
	mov r0, r6
	ldr r2, [r1]
	mov r1, r6
	mov r3, r4
	str r2, [sp, #4]
	bl BoostOffensiveStat
	add r2, sp, #8
	ldr r2, [r2]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostDefensiveStat
	add r2, sp, #4
	ldr r2, [r2]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostDefensiveStat
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x108]
#endif
_023278D4:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_023278E0: .word SILVER_WIND_BOOST_CHANCE
_023278E4: .word SPATK_STAT_IDX
	arm_func_end DoMoveDamageBoostAllStats

	arm_func_start DoMoveSynthesis
DoMoveSynthesis: ; 0x023278E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetApparentWeather
	mov ip, #1
	ldr r1, _02327924 ; =SYNTHESIS_HP_RESTORATION_TABLE
	mov r0, r0, lsl #1
	ldrsh r2, [r1, r0]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02327924: .word SYNTHESIS_HP_RESTORATION_TABLE
	arm_func_end DoMoveSynthesis

	arm_func_start DoMoveBoostSpeed1
DoMoveBoostSpeed1: ; 0x02327928
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveBoostSpeed1

	arm_func_start DoMoveRapidSpin
DoMoveRapidSpin: ; 0x02327940
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023279A0
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023279A0
	ldr r0, [r5, #0xb4]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x8e]
#else
	ldrh r0, [r0, #0x92]
#endif
	tst r0, #2
	ldrne r0, _023279A8 ; =RAPID_SPIN_BINDING_REMOVAL
	movne r1, #0
	strneb r1, [r0]
	ldreq r0, _023279A8 ; =RAPID_SPIN_BINDING_REMOVAL
	moveq r1, r4
	streqb r1, [r0]
_023279A0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023279A8: .word RAPID_SPIN_BINDING_REMOVAL
	arm_func_end DoMoveRapidSpin

	arm_func_start DoMoveSureShot
DoMoveSureShot: ; 0x023279AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	ldr r1, _023279E0 ; =SURE_SHOT_TURN_RANGE
	mov r0, r4
	mov r2, #0
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl TryInflictSureShotStatus
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023279E0: .word SURE_SHOT_TURN_RANGE
	arm_func_end DoMoveSureShot

	arm_func_start DoMoveCosmicPower
DoMoveCosmicPower: ; 0x023279E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02327A20 ; =ATK_STAT_IDX
	mov r3, #1
	ldr r2, [r2]
	mov r5, r0
	mov r4, r1
	bl BoostDefensiveStat
	ldr r1, _02327A24 ; =SPATK_STAT_IDX
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	mov r3, #1
	bl BoostDefensiveStat
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02327A20: .word ATK_STAT_IDX
_02327A24: .word SPATK_STAT_IDX
	arm_func_end DoMoveCosmicPower

	arm_func_start DoMoveSkyAttack
DoMoveSkyAttack: ; 0x02327A28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, r2
	mov r7, r1
	mov r1, r6
	mov r8, r0
	mov r5, r3
	mov r4, #0
	bl IsChargingTwoTurnMove
	cmp r0, #0
	beq _02327AB8
	ldr r1, _02327AE8 ; =SKY_ATTACK_DAMAGE_MULTIPLIER
	mov r0, r8
	ldr r3, [r1]
	mov r1, r7
	mov r2, r6
	str r5, [sp]
	bl DealDamage
	cmp r0, #0
	beq _02327AAC
	ldr r1, _02327AEC ; =SKY_ATTACK_CRINGE_CHANCE
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327AAC
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictCringeStatus
_02327AAC:
	mov r0, r8
	bl ov29_02318D58
	b _02327ADC
_02327AB8:
	ldr r0, _02327AF0 ; =0x00000CD1
	bl StringFromId
	str r0, [sp]
	mov r0, r8
	mov r1, r8
	mov r3, r6
	mov r2, #3
	bl ov29_02318BBC
	mov r4, #1
_02327ADC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02327AE8: .word SKY_ATTACK_DAMAGE_MULTIPLIER
_02327AEC: .word SKY_ATTACK_CRINGE_CHANCE
#ifdef JAPAN
_02327AF0: .word 0x00000A11
#else
_02327AF0: .word 0x00000CD1
#endif
	arm_func_end DoMoveSkyAttack

	arm_func_start DoMoveDamageFreeze15
DoMoveDamageFreeze15: ; 0x02327AF4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327B4C
	ldr r1, _02327B58 ; =POWDER_SNOW_FREEZE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327B4C
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl TryInflictFrozenStatus
_02327B4C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327B58: .word POWDER_SNOW_FREEZE_CHANCE
	arm_func_end DoMoveDamageFreeze15

	arm_func_start DoMoveMeteorMash
DoMoveMeteorMash: ; 0x02327B5C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
#ifdef EUROPE
	mov r5, r1
#endif
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327BCC
	ldr r1, _02327BD8 ; =METEOR_MASH_BOOST_ATTACK_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
#ifdef EUROPE
	mov r1, r5
#else
	mov r1, r6
#endif
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327BCC
	ldr r0, _02327BDC ; =ATK_STAT_IDX
	ldr r5, [r6, #0xb4]
	ldr r2, [r0]
	mov r0, r6
	mov r1, r6
	mov r3, r4
	bl BoostOffensiveStat
#ifdef JAPAN
	ldrb r0, [r5, #0x107]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x107]
#else
	ldrb r0, [r5, #0x108]
	cmp r0, #1
	movlo r0, r4
	strlob r0, [r5, #0x108]
#endif
_02327BCC:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327BD8: .word METEOR_MASH_BOOST_ATTACK_CHANCE
_02327BDC: .word ATK_STAT_IDX
	arm_func_end DoMoveMeteorMash

	arm_func_start DoMoveEndure
DoMoveEndure: ; 0x02327BE0
	stmdb sp!, {r3, lr}
	bl TryInflictEndureStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveEndure

	arm_func_start DoMoveLowerSpeed1
DoMoveLowerSpeed1: ; 0x02327BF0
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, r2
	bl LowerSpeed
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveLowerSpeed1

	arm_func_start DoMoveDamageConfuse10
DoMoveDamageConfuse10: ; 0x02327C08
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327C64
	ldr r1, _02327C70 ; =PSYBEAM_CONFUSE_CHANCE
	mov r0, r6
	ldrsh r2, [r1]
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327C64
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl TryInflictConfusedStatus
_02327C64:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02327C70: .word PSYBEAM_CONFUSE_CHANCE
	arm_func_end DoMoveDamageConfuse10

	arm_func_start DoMovePsywave
DoMovePsywave: ; 0x02327C74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0x80
	mov r1, #0x180
	mov r5, r2
	mov r4, r3
	bl DungeonRandRange
	ldr r1, [r7, #0xb4]
	mov r2, r5
	ldrb r1, [r1, #0xa]
	mul r1, r0, r1
	movs r3, r1, asr #8
	movmi r3, #1
	cmp r3, #0xc7
	movgt r3, #0xc7
	mov r0, r7
	mov r1, r6
	str r4, [sp]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DoMovePsywave

	arm_func_start DoMoveDamageLowerDefensiveStatVariable
DoMoveDamageLowerDefensiveStatVariable: ; 0x02327CD8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr ip, [sp, #0x30]
	mov r3, #0x100
	mov r6, r0
	mov r5, r1
	str ip, [sp]
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327D4C
	ldrsh r2, [sp, #0x2c]
	mov r0, r6
	mov r1, r5
	mov r4, #1
	bl DungeonRandOutcomeUserTargetInteraction
	cmp r0, #0
	beq _02327D4C
	add r0, sp, #0x24
	mov ip, r4
	ldr r2, [r0]
	str ip, [sp]
	mov ip, #0
	ldrsh r3, [sp, #0x28]
	mov r0, r6
	mov r1, r5
	str ip, [sp, #4]
	bl LowerDefensiveStat
_02327D4C:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end DoMoveDamageLowerDefensiveStatVariable

	arm_func_start DoMovePsychoBoost
DoMovePsychoBoost: ; 0x02327D60
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _02327DC0
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _02327DC0
	ldr r0, _02327DCC ; =SPATK_STAT_IDX
	mov ip, #0
	ldr r2, [r0]
	str ip, [sp]
	mov r0, r5
	mov r1, r5
	mov r3, #2
	str ip, [sp, #4]
	bl LowerOffensiveStat
_02327DC0:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02327DCC: .word SPATK_STAT_IDX
	arm_func_end DoMovePsychoBoost

	arm_func_start DoMoveUproar
DoMoveUproar: ; 0x02327DD0
	stmdb sp!, {r3, lr}
	bl TryInflictSleeplessStatus
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveUproar

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
