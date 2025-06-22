	.include "asm/macros.inc"
	.include "overlay_29_02319880.inc"

	.text

; https://decomp.me/scratch/jVfou
#ifndef NONMATCHING
	arm_func_start AiConsiderMove
AiConsiderMove: ; 0x02319880
#ifdef JAPAN
#define AI_CONSIDER_MOVE_OFFSET -0xA4
#else
#define AI_CONSIDER_MOVE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r1
	str r0, [sp, #8]
	mov r0, #1
	mov sb, r2
	ldr r6, [sl, #0xb4]
	str r0, [sp, #0x14]
	mov r5, #0
	bl ResetAiCanAttackInDirection
	mov r0, sl
	mov r1, sb
	mov r2, #1
	bl GetEntityMoveTargetAndRange
	str r0, [sp, #0x24]
	mov r0, sl
	mov r1, #8
	bl IqSkillIsEnabled
	mov r4, r0
	ldr r0, [sp, #8]
	mov r1, r5
	strb r1, [r0]
	ldrb r0, [r6, #0xd0]
	cmp r0, #5
	bne _023198F8
	mov r0, sb
	bl IsAffectedByTaunt
	cmp r0, #0
	moveq r0, #1
	beq _02319F64
_023198F8:
	cmp r4, #0
	beq _02319918
	mov r0, sl
	mov r1, sb
	bl StatusCheckerCheck
	cmp r0, #0
	moveq r0, #1
	beq _02319F64
_02319918:
	mov r0, sb
	mov r1, #0
	bl GetMoveTargetAndRange
	ldr r1, _02319F6C ; =0x00000273
	cmp r0, r1
	bne _02319958
	ldrsh r3, [r6, #0x12]
	ldrsh r2, [r6, #0x16]
	add r0, r1, #0x174
	add r2, r3, r2
	cmp r2, r0
	movgt r2, r0
	ldrsh r0, [r6, #0x10]
	cmp r0, r2
	moveq r0, #1
	beq _02319F64
_02319958:
	ldr r0, [sp, #0x24]
	ands r7, r0, #0xf0
	cmpne r7, #0x10
	cmpne r7, #0x20
	bne _02319A54
	mov r0, sl
	mov r1, #1
	bl IsBlinded
	cmp r0, #0
	beq _023199C0
	ldrb r6, [r6, #0x4c]
	ldr r4, _02319F70 ; =AI_CAN_ATTACK_IN_DIRECTION
	ldrb r0, [r4, r6]
	cmp r0, #0
	bne _02319E88
	ldr r1, _02319F74 ; =AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
	mov r3, #1
	ldr r0, _02319F78 ; =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	mov r2, #0x63
	strb r3, [r4, r6]
	strb r6, [r1]
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #0x20]
	add r5, r5, #1
	b _02319E88
_023199C0:
	ldr fp, _02319F7C ; =DIRECTIONS_XY
	mov r8, #0
_023199C8:
	mov r1, r8, lsl #2
	add r0, fp, r8, lsl #2
	ldrsh r6, [sl, #4]
	ldrsh r3, [fp, r1]
	ldrsh r2, [sl, #6]
	ldrsh r1, [r0, #2]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	cmp r6, #0
	beq _02319A44
	ldr r0, [r6]
	cmp r0, #1
	bne _02319A44
	cmp r7, #0x10
	cmpne r7, #0x20
	beq _02319A24
	mov r0, sl
	mov r1, r8
	bl CanAttackInDirection
	cmp r0, #0
	beq _02319A44
_02319A24:
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	mov r3, r6
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319A44:
	add r8, r8, #1
	cmp r8, #8
	blt _023199C8
	b _02319E88
_02319A54:
	cmp r7, #0x30
	bne _02319AC8
	ldr r7, _02319F80 ; =DUNGEON_PTR
	mov r6, #0
_02319A64:
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78 + AI_CONSIDER_MOVE_OFFSET]
	mov r0, r8
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _02319AB8
	mov r0, sl
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	beq _02319AB8
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	mov r3, r8
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319AB8:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02319A64
	b _02319E88
_02319AC8:
	cmp r7, #0x40
	bne _02319BB0
	mov r8, #0
_02319AD4:
	ldr r0, _02319F7C ; =DIRECTIONS_XY
	mov r2, r8, lsl #2
	add r0, r0, r8, lsl #2
	ldrsh r6, [r0, #2]
	ldr r0, _02319F7C ; =DIRECTIONS_XY
	ldrsh r1, [sl, #6]
	ldrsh r7, [r0, r2]
	ldrsh r0, [sl, #4]
	add r1, r1, r6
	add r0, r0, r7
	bl GetTile
	mov fp, r0
	mov r0, sl
	mov r1, r8
	bl CanAttackInDirection
	cmp r0, #0
	beq _02319BA0
	ldr r3, [fp, #0xc]
	cmp r3, #0
	beq _02319B58
	ldr r0, [r3]
	cmp r0, #1
	bne _02319B58
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	str r4, [sp, #4]
	mov fp, r5
	bl TryAddTargetToAiTargetList
	mov r5, r0
	cmp fp, r5
	bne _02319BA0
_02319B58:
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	add r0, r0, r7, lsl #1
	add r1, r1, r6, lsl #1
	bl GetTile
	ldr r3, [r0, #0xc]
	cmp r3, #0
	beq _02319BA0
	ldr r0, [r3]
	cmp r0, #1
	bne _02319BA0
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319BA0:
	add r8, r8, #1
	cmp r8, #8
	blt _02319AD4
	b _02319E88
_02319BB0:
	cmp r7, #0x50
	cmpne r7, #0x80
	cmpne r7, #0x90
	bne _02319E00
	cmp r7, #0x50
	moveq r0, #0xa
	streq r0, [sp, #0xc]
	movne r0, #1
	strne r0, [sp, #0xc]
	cmp r7, #0x90
	moveq r0, #2
	streq r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x20]
	mvn r0, #0
	str r0, [sp, #0x28]
_02319BF0:
	ldr r0, _02319F80 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [sp, #0x20]
	add r0, r1, r0, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb78 + AI_CONSIDER_MOVE_OFFSET]
	str r0, [sp, #0x18]
	bl EntityIsValid__02319F8C
	cmp r0, #0
	ldrne r0, [sp, #0x18]
	cmpne sl, r0
	beq _02319DE8
	ldr r1, [sp, #0x18]
	add r0, sl, #4
	add r1, r1, #4
	bl GetDirectionTowardsPosition
	ldr r1, _02319F70 ; =AI_CAN_ATTACK_IN_DIRECTION
	str r0, [sp, #0x1c]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02319DE8
	ldr r1, [sp, #0x18]
	mov r0, sl
	bl CanSeeTarget
	cmp r0, #0
	beq _02319DE8
	ldr r0, [sp, #0x18]
	ldrsh r6, [sl, #4]
	ldrsh fp, [r0, #4]
	sub r0, r6, fp
	bl abs
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldrsh r8, [sl, #6]
	ldrsh r7, [r0, #6]
	sub r0, r8, r7
	bl abs
	ldr r1, [sp, #0x10]
	cmp r1, r0
	movgt r2, r1
	movle r2, r0
	cmp r2, #0xa
	movgt r0, #0
	bgt _02319D50
	ldr r1, [sp, #0xc]
	cmp r2, r1
	movgt r0, #0
	bgt _02319D50
	ldr r1, [sp, #0x10]
	cmp r1, r0
	ldr r0, [sp, #0x28]
	bne _02319CF8
	cmp r6, fp
	cmplt r8, r7
	movlt r0, #1
	blt _02319D44
	cmp r6, fp
	bge _02319CE4
	cmp r8, r7
	movgt r0, #3
	bgt _02319D44
_02319CE4:
	cmp r6, fp
	cmpgt r8, r7
	movgt r0, #5
	movle r0, #7
	b _02319D44
_02319CF8:
	cmp r6, fp
	bne _02319D0C
	cmp r8, r7
	movlt r0, #0
	blt _02319D44
_02319D0C:
	cmp r6, fp
	bge _02319D20
	cmp r8, r7
	moveq r0, #2
	beq _02319D44
_02319D20:
	cmp r6, fp
	bne _02319D34
	cmp r8, r7
	movgt r0, #4
	bgt _02319D44
_02319D34:
	cmp r6, fp
	ble _02319D44
	cmp r8, r7
	moveq r0, #6
_02319D44:
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
_02319D50:
	cmp r0, #0
	beq _02319DE8
	str r4, [sp]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x18]
	mov r1, sl
	mov r3, sb
	bl IsAiTargetEligible
	cmp r0, #0
	beq _02319DE8
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0xc]
	mov r0, sl
	bl IsTargetInRange
	cmp r0, #0
	beq _02319DE8
	ldr r1, _02319F70 ; =AI_CAN_ATTACK_IN_DIRECTION
	ldr r0, [sp, #0x1c]
	mov r2, #1
	strb r2, [r1, r0]
	mov r1, r0
	ldr r0, _02319F74 ; =AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
	strb r1, [r0, r5]
	mov r0, sl
	mov r1, sb
	bl GetMoveTypeForMonster
	mov r3, r0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	mov r0, sl
	bl WeightMoveWithIqSkills
	ldr r1, _02319F84 ; =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	str r0, [r1, r5, lsl #2]
	ldr r1, [sp, #0x18]
	ldr r0, _02319F88 ; =AI_POTENTIAL_ATTACK_TARGETS
	str r1, [r0, r5, lsl #2]
	add r5, r5, #1
_02319DE8:
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0x14
	blt _02319BF0
	b _02319E88
_02319E00:
	cmp r7, #0x60
	bne _02319E60
	ldr r7, _02319F80 ; =DUNGEON_PTR
	mov r6, #0
_02319E10:
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78 + AI_CONSIDER_MOVE_OFFSET]
	mov r0, r8
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _02319E50
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r0, r5
	mov r2, sl
	mov r3, r8
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319E50:
	add r6, r6, #1
	cmp r6, #0x14
	blt _02319E10
	b _02319E88
_02319E60:
	cmp r7, #0x70
	bne _02319E88
	str sb, [sp]
	ldr r1, [sp, #0x24]
	mov r2, sl
	mov r3, sl
	mov r0, #0
	str r4, [sp, #4]
	bl TryAddTargetToAiTargetList
	mov r5, r0
_02319E88:
	cmp r5, #0
	ldreq r0, [sp, #8]
	moveq r1, #0
	streqb r1, [r0]
	beq _02319F60
	mov r0, #0
	str r0, [sp, #0x14]
	mov r4, r0
	ldr r3, _02319F84 ; =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	b _02319EC4
_02319EB0:
	ldr r2, [r3, r4, lsl #2]
	ldr r1, [sp, #0x14]
	add r4, r4, #1
	cmp r1, r2
	strlt r2, [sp, #0x14]
_02319EC4:
	cmp r4, r5
	blt _02319EB0
	mov r6, #0
	mov r2, r6
	ldr r4, _02319F84 ; =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	b _02319EF0
_02319EDC:
	ldr r3, [r4, r6, lsl #2]
	ldr r1, [sp, #0x14]
	cmp r1, r3
	strne r2, [r4, r6, lsl #2]
	add r6, r6, #1
_02319EF0:
	cmp r6, r5
	blt _02319EDC
	mov r3, #0
	ldr r2, _02319F84 ; =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	b _02319F10
_02319F04:
	ldr r1, [r2, r3, lsl #2]
	add r3, r3, #1
	add r0, r0, r1
_02319F10:
	cmp r3, r5
	blt _02319F04
	bl DungeonRandInt
	mov r3, #0
	ldr r2, _02319F84 ; =AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
	b _02319F38
_02319F28:
	ldr r1, [r2, r3, lsl #2]
	subs r0, r0, r1
	bmi _02319F40
	add r3, r3, #1
_02319F38:
	cmp r3, r5
	blt _02319F28
_02319F40:
	ldr r1, _02319F74 ; =AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0]
	ldrb r2, [r1, r3]
	mov r1, #8
	strb r2, [r0, #1]
	str r1, [r0, #4]
_02319F60:
	ldr r0, [sp, #0x14]
_02319F64:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02319F6C: .word 0x00000273
_02319F70: .word AI_CAN_ATTACK_IN_DIRECTION
_02319F74: .word AI_POTENTIAL_ATTACK_TARGET_DIRECTIONS
_02319F78: .word AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
_02319F7C: .word DIRECTIONS_XY
_02319F80: .word DUNGEON_PTR
_02319F84: .word AI_POTENTIAL_ATTACK_TARGET_WEIGHTS
_02319F88: .word AI_POTENTIAL_ATTACK_TARGETS
	arm_func_end AiConsiderMove
#endif
