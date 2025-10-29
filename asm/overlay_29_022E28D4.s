	.include "asm/macros.inc"
	.include "overlay_29_022E28D4.inc"

	.text

	arm_func_start ov29_022E28D4
ov29_022E28D4: ; 0x022E28D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl EntityIsValid__022E1A1C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl HasDropeyeStatus
	mov r2, r0
	add r0, r5, #4
	add r1, r4, #4
	bl IsPositionActuallyInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E28D4

	arm_func_start ov29_022E2930
ov29_022E2930: ; 0x022E2930
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl HasDropeyeStatus
	mov r2, r0
	mov r1, r4
	add r0, r5, #4
	bl IsPositionActuallyInSight
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E2930
