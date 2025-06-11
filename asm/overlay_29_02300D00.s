	.include "asm/macros.inc"
	.include "overlay_29_02300D00.inc"

	.text

	arm_func_start ov29_02300D00
ov29_02300D00: ; 0x02300D00
	ldr r1, [r0, #0xb4]
	ldrb r0, [r1, #0xbd]
	cmp r0, #2
	cmpne r0, #4
	cmpne r0, #0
	movne r0, #1
	bxne lr
	ldrb r0, [r1, #0xc4]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #6
	moveq r0, #1
	bxeq lr
	ldrb r0, [r1, #0xd2]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov29_02300D00

	arm_func_start ov29_02300D50
ov29_02300D50: ; 0x02300D50
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0xb4]
	ldrb r3, [r1, #0xc4]
	cmp r3, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r3, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r1, #0xd0]
	cmp r2, #7
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r2, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r1, #0xbf]
	cmp r1, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r3, #6
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r2, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl CheckVariousStatuses
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02300D50

	arm_func_start ov29_02300DC0
ov29_02300DC0: ; 0x02300DC0
	ldr ip, _02300DC8 ; =ov29_02300D50
	bx ip
	.align 2, 0
_02300DC8: .word ov29_02300D50
	arm_func_end ov29_02300DC0

	arm_func_start MonsterCannotAttack
MonsterCannotAttack: ; 0x02300DCC
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldr r2, [r0, #0xb4]
	bne _02300DF4
	ldrb r1, [r2, #0xbd]
	cmp r1, #2
	cmpne r1, #4
	cmpne r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_02300DF4:
	ldrb r1, [r2, #0xc4]
	cmp r1, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #6
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r2, #0xd0]
	cmp r1, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r1, #7
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r2, #0xbf]
	cmp r1, #4
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl ShouldMonsterRunAway
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end MonsterCannotAttack
