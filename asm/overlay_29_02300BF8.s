	.include "asm/macros.inc"
	.include "overlay_29_02300BF8.inc"

	.text

	arm_func_start ov29_02300BF8
ov29_02300BF8: ; 0x02300BF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #0xbc]
	cmp r0, #7
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _02300C48
	mov r0, r5
	bl ShouldMonsterRunAway
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02300C48:
	mov r0, r5
	mov r1, #0
	bl ov29_023008DC
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ov29_02300D00
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0
	bl IsChargingAnyTwoTurnMove
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xc4]
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02300BF8
