	.include "asm/macros.inc"
	.include "overlay_29_02327BF0.inc"

	.text

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
