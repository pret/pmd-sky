	.include "asm/macros.inc"
	.include "overlay_29_023008DC.inc"

	.text

	arm_func_start ov29_023008DC
ov29_023008DC: ; 0x023008DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	cmp r1, #0
	ldr r4, [r5, #0xb4]
	beq _02300904
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02300904:
	ldrb r0, [r4, #0xbd]
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #5
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #7
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xc4]
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #4
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ov29_02300D00
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xc4]
	cmp r0, #6
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
#ifdef JAPAN
	ldrb r0, [r4, #0x104]
#else
	ldrb r0, [r4, #0x105]
#endif
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023008DC

	arm_func_start ov29_023009A0
ov29_023009A0: ; 0x023009A0
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r4, r0
	bl IsChargingAnyTwoTurnMove
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl CheckVariousStatuses2
	ldmia sp!, {r4, pc}
	arm_func_end ov29_023009A0

	arm_func_start ov29_023009CC
ov29_023009CC: ; 0x023009CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	mov r1, #0
	bl IsChargingAnyTwoTurnMove
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xbd]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ShouldMonsterRunAway
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xf3]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r3, [r4, #0xc4]
	cmp r3, #6
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r3, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r2, [r4, #0xd0]
	cmp r2, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0xbd]
	cmp r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xef]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #5
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r2, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r3, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r3, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xf1]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd8]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #7
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023009CC

	arm_func_start ov29_02300B04
ov29_02300B04: ; 0x02300B04
	ldr r1, [r0, #0xb4]
	ldrb r0, [r1, #0xbd]
	cmp r0, #1
	cmpne r0, #5
	cmpne r0, #3
	beq _02300B30
	ldrb r0, [r1, #0xc4]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #6
	bhi _02300B38
_02300B30:
	mov r0, #0
	bx lr
_02300B38:
	mov r0, #1
	bx lr
	arm_func_end ov29_02300B04
