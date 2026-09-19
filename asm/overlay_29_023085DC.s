	.include "asm/macros.inc"
	.include "overlay_29_023085DC.inc"

	.text

	arm_func_start ov29_023085DC
ov29_023085DC: ; 0x023085DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	cmp r1, #0
	ldr r4, [r5, #0xb4]
	beq _02308618
	ldrb r1, [r4, #0xd0]
	cmp r1, #4
	bne _02308618
	ldrb r1, [r4, #0x4c]
	add r2, r1, #4
	and r1, r2, #0xff
	and r1, r1, #7
	strb r1, [r4, #0x4c]
	bl UpdateAiTargetPos
	ldmia sp!, {r3, r4, r5, pc}
_02308618:
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #8
	bl DungeonRandInt
	strb r0, [r4, #0x4c]
	mov r0, r5
	bl UpdateAiTargetPos
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023085DC
