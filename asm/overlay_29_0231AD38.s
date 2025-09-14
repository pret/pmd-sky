	.include "asm/macros.inc"
	.include "overlay_29_0231AD38.inc"

	.text

	arm_func_start ov29_0231AD38
ov29_0231AD38: ; 0x0231AD38
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	and r4, r0, #0xf
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	cmp r4, #3
	and r0, r0, #0xf
	cmpne r4, #1
	cmpne r0, #4
	cmpne r0, #3
	cmpne r0, #1
	cmpne r0, #6
	beq _0231ADA0
	mov r0, r6
	mov r1, r5
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	and r0, r0, #0xf0
	cmp r0, #0x70
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_0231ADA0:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_0231AD38

	arm_func_start ov29_0231ADA8
ov29_0231ADA8: ; 0x0231ADA8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, [r0, #0xb4]
	mov r0, #0
	mov r5, r0
#ifdef JAPAN
	add r4, r1, #0x120
#else
	add r4, r1, #0x124
#endif
	mov ip, r0
	mov lr, #1
	add r2, sp, #0
_0231ADCC:
	ldrb r1, [r4, r5, lsl #3]
	add r3, r4, r5, lsl #3
	tst r1, #1
	movne r1, lr
	moveq r1, ip
	tst r1, #0xff
	beq _0231AE00
	ldrh r3, [r3, #4]
	add r1, r0, #1
	mov r0, r0, lsl #1
	mov r1, r1, lsl #0x10
	strh r3, [r2, r0]
	mov r0, r1, lsr #0x10
_0231AE00:
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, lsr #0x10
	cmp r5, #4
	blo _0231ADCC
	cmp r0, #0
	moveq r0, #0
	beq _0231AE34
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0
	mov r0, r0, lsr #0xf
	ldrh r0, [r1, r0]
_0231AE34:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0231ADA8

	arm_func_start ov29_0231AE3C
ov29_0231AE3C: ; 0x0231AE3C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov r0, #0
	mov lr, r0
	mov r2, r0
	mov r3, #1
_0231AE54:
	add r1, ip, lr, lsl #3
#ifdef JAPAN
	ldrb r1, [r1, #0x120]
#else
	ldrb r1, [r1, #0x124]
#endif
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	add r1, lr, #1
	addne r0, r0, #1
	mov r1, r1, lsl #0x10
	movne r0, r0, lsl #0x10
	mov lr, r1, lsr #0x10
	movne r0, r0, lsr #0x10
	cmp lr, #4
	blo _0231AE54
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0231AE3C
