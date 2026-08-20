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
	bl WaitUntilAlertBoxPauseIsOver
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
	bl WaitUntilAlertBoxPauseIsOver
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
	bl IsTileGround
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
	bl WaitUntilAlertBoxPauseIsOver
	mov r0, #0x5d
	bl AdvanceFrame
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #5
	mov r1, #0
	bl UnkMapRelatedFunc
	mov r0, #0x5c
	bl AdvanceFrame
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02325D7C
