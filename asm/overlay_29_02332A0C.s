	.include "asm/macros.inc"
	.include "overlay_29_02332A0C.inc"

	.text

	arm_func_start DefenderAbilityIsActive__02332A0C
DefenderAbilityIsActive__02332A0C: ; 0x02332A0C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	cmp r0, r5
	beq _02332A60
	cmp r0, #0
	moveq r1, #0
	beq _02332A40
	ldr r1, [r0]
	cmp r1, #1
	moveq r1, #1
	movne r1, #0
	and r1, r1, #0xff
_02332A40:
	cmp r1, #0
#ifndef JAPAN
	cmpne r3, #0
#endif
	beq _02332A60
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02332A60:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DefenderAbilityIsActive__02332A0C

	arm_func_start DoMoveDamageInlined
DoMoveDamageInlined: ; 0x02332A70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	mov r5, r2
	mov r6, r1
	mov r7, r0
	mov r1, r5
	mov r4, r3
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x14
	str r1, [sp, #4]
	mov r0, #0x100
	str r0, [sp, #8]
	ldrh ip, [r5, #4]
	mov r1, #1
	mov r2, sb
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r3, r8
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	mov r1, r4
	mov r0, r5
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl PerformDamageSequence
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DoMoveDamageInlined

	arm_func_start DealDamage
DealDamage: ; 0x02332B20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	mov r5, r2
	mov r6, r1
	mov r7, r0
	mov r1, r5
	mov r4, r3
	bl GetMoveTypeForMonster
	mov sb, r0
	mov r0, r7
	mov r1, r5
	bl GetMovePower
	mov r8, r0
	mov r0, r5
	bl GetMoveCritChance
	str r0, [sp]
	add r0, sp, #0x14
	stmib sp, {r0, r4}
	ldrh r4, [r5, #4]
	mov r2, sb
	mov r3, r8
	mov ip, #1
	str r4, [sp, #0xc]
	mov r0, r7
	mov r1, r6
	str ip, [sp, #0x10]
	bl CalcDamage
	ldr r1, [sp, #0x48]
	mov r0, r5
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end DealDamage

	arm_func_start DealDamageWithTypeAndPowerBoost
DealDamageWithTypeAndPowerBoost: ; 0x02332BB8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r5, r2
	mov r6, r1
	mov r1, r5
	mov r7, r0
	mov r4, r3
	bl GetMovePower
	ldrsh r1, [sp, #0x48]
	add r0, r1, r0
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r8, r1, asr #0x10
	bl GetMoveCritChance
	str r0, [sp]
	add r0, sp, #0x14
	stmib sp, {r0, r4}
	ldrh r4, [r5, #4]
	mov r2, #1
	mov r3, r8
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r2, [sp, #0x44]
	mov r0, r7
	mov r1, r6
	bl CalcDamage
	ldr r1, [sp, #0x40]
	mov r0, r5
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r0, r7
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DealDamageWithTypeAndPowerBoost

	arm_func_start DealDamageProjectile
DealDamageProjectile: ; 0x02332C4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r4, r2
	mov r5, r1
	mov r1, r4
	mov r6, r0
	mov r8, r3
	bl GetMoveTypeForMonster
	mov r7, r0
	mov r0, r4
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x14
	str r1, [sp, #4]
	ldr r0, [sp, #0x40]
	mov r1, #1
	str r0, [sp, #8]
	ldrh ip, [r4, #4]
	mov r2, r7
	mov r3, r8
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, r6
	mov r1, r5
	bl CalcDamage
	ldr r1, [sp, #0x44]
	mov r0, r4
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r5
	mov r2, r4
	mov r0, r6
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DealDamageProjectile

	arm_func_start DealDamageWithType
DealDamageWithType: ; 0x02332CDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r4, r3
	mov r5, r1
	mov r1, r4
	mov r6, r0
	mov r8, r2
	bl GetMovePower
	mov r7, r0
	mov r0, r4
	bl GetMoveCritChance
	str r0, [sp]
	add r1, sp, #0x14
	str r1, [sp, #4]
	ldr r0, [sp, #0x40]
	mov r1, #1
	str r0, [sp, #8]
	ldrh ip, [r4, #4]
	mov r2, r8
	mov r3, r7
	str ip, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, r6
	mov r1, r5
	bl CalcDamage
	ldr r1, [sp, #0x44]
	mov r0, r4
	bl GetDamageSourceWrapper
	str r0, [sp]
	mov r1, r5
	mov r2, r4
	mov r0, r6
	add r3, sp, #0x14
	bl PerformDamageSequence
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DealDamageWithType

	arm_func_start PerformDamageSequence
PerformDamageSequence: ; 0x02332D6C
#ifdef JAPAN
#define PERFORM_DAMAGE_SEQUENCE_OFFSET -4
#else
#define PERFORM_DAMAGE_SEQUENCE_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r4, [r8, #0xb4]
	mov r6, r3
	mov r3, #1
	mov r7, r1
	mov r5, r2
	str r3, [sp]
	bl MoveHitCheck
	cmp r0, #0
	beq _02332E3C
	ldrh r1, [r5, #4]
	ldr r0, _02332F04 ; =0x0000013A
	mov r2, #0x2e
	cmp r1, r0
	moveq r5, #1
	mov r0, r8
	mov r1, r7
#ifndef JAPAN
	mov r3, #1
#endif
	movne r5, #0
	bl DefenderAbilityIsActive__02332A0C
	cmp r0, #0
	beq _02332DFC
	ldr r1, _02332F08 ; =DUNGEON_PTR
	ldr r2, _02332F0C ; =0x000003E7
	ldr r0, [r1]
	add r0, r0, #0x700
	strh r2, [r0, #0x82]
	ldr r0, [r1]
	add r0, r0, #0x19000
#ifdef JAPAN
	str r7, [r0, #0x864]
#else
	str r7, [r0, #0x908]
#endif
	ldr r0, [r1]
	ldrh r1, [r7, #0x26]
	add r0, r0, #0x19000
#ifdef JAPAN
	str r1, [r0, #0x86c]
#else
	str r1, [r0, #0x910]
#endif
_02332DFC:
	ldrsh r0, [sp, #0x28]
	mov ip, #1
	str ip, [sp]
	str r0, [sp, #4]
	mov r3, r5
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str ip, [sp, #8]
	mov r5, #0
	str r5, [sp, #0xc]
	bl ApplyDamageAndEffects
	mov r0, r5
	strb r0, [r4, #0x166 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
	strb r0, [r4, #0x167 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
	b _02332ED0
_02332E3C:
	bl ov29_0234B034
	mov r3, #0
	str r3, [sp]
	ldr r2, [r7, #0xb4]
	mov r1, #1
	bl ov29_0230040C
	mov r0, r8
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02332EA8
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _02332EA8
	mov r2, #1
	ldr r0, _02332F10 ; =0x0000270F
	mov r1, r7
	sub r3, r2, #2
	bl DisplayAnimatedNumbers
	ldr r2, _02332F14 ; =0x00000EC3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdQuietCheckUserTarget
	mov r0, r8
	mov r1, r7
	bl ov29_022E576C
	b _02332EB8
_02332EA8:
	ldr r2, _02332F14 ; =0x00000EC3
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_02332EB8:
	mov r2, #1
	strb r2, [r6, #0x10]
	ldrh r1, [r5, #4]
	rsb r0, r2, #0x164
	cmp r1, r0
	strneb r2, [r4, #0x166 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
_02332ED0:
	ldrb r0, [r6, #0x10]
	cmp r0, #0
	movne r0, #0
	bne _02332EFC
	mov r0, r7
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	movne r1, #1
	strneb r1, [r0, #0x164 + PERFORM_DAMAGE_SEQUENCE_OFFSET]
	ldr r0, [r6]
_02332EFC:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02332F04: .word 0x0000013A
_02332F08: .word DUNGEON_PTR
_02332F0C: .word 0x000003E7
_02332F10: .word 0x0000270F
#ifdef JAPAN
_02332F14: .word 0x00000C05
#else
_02332F14: .word 0x00000EC3
#endif
	arm_func_end PerformDamageSequence

	arm_func_start ov29_02332F18
ov29_02332F18: ; 0x02332F18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r6, r2
	mov r7, r1
	mov r1, r6
	mov r8, r0
	mov r5, r3
	bl GetMoveTypeForMonster
	mov r4, r0
	ldrh r0, [r6, #4]
	bl GetMoveCategory
	mov r3, r0
	str r5, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	mov r2, r4
	mov r0, r8
	mov r1, r7
	bl ov29_0230D088
	ldr r1, [sp, #0x40]
	mov r0, r6
	bl GetDamageSourceWrapper
	mov r1, #1
	str r1, [sp]
	stmib sp, {r0, r1}
	mov r3, #0
	mov r0, r8
	str r3, [sp, #0xc]
	mov r1, r7
	add r2, sp, #0x10
	bl ApplyDamageAndEffects
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	movne r0, #0
	bne _02332FC0
	mov r0, r7
	bl EntityIsValid__0232E840
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	movne r1, #1
#ifdef JAPAN
	strneb r1, [r0, #0x160]
#else
	strneb r1, [r0, #0x164]
#endif
	ldr r0, [sp, #0x10]
_02332FC0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_02332F18

	arm_func_start CanHitWithRegularAttack
CanHitWithRegularAttack: ; 0x02332FC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #4]
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	bgt _02333010
	ldrsh r1, [r5, #6]
	ldrsh r0, [r4, #6]
	sub r0, r1, r0
	bl abs
	cmp r0, #1
	ble _02333018
_02333010:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02333018:
	add r0, r4, #4
	add r1, r5, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r4
	bl CanAttackInDirection
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanHitWithRegularAttack

	arm_func_start ov29_02333044
ov29_02333044: ; 0x02333044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #4
	add r1, r1, #4
	ldr r4, [r5, #0xb4]
	bl GetDirectionTowardsPosition
	mov r1, r0
	and r2, r1, #7
	mov r0, r5
	strb r2, [r4, #0x4c]
	bl ov29_02304A48
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02333044
