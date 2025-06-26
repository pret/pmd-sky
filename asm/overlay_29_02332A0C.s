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

	arm_func_start StatusCheckerCheck
StatusCheckerCheck: ; 0x02333074
#ifdef JAPAN
#define STATUS_CHECKER_CHECK_OFFSET -4
#define STATUS_CHECKER_CHECK_OFFSET_2 -0xA4
#else
#define STATUS_CHECKER_CHECK_OFFSET 0
#define STATUS_CHECKER_CHECK_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrh r2, [r1, #4]
	ldr r1, _02333F98 ; =0x00000109
	mov r4, r0
	cmp r2, r1
	ldr r3, [r4, #0xb4]
	bgt _02333314
	cmp r2, r1
	bge _02333834
	cmp r2, #0x9c
	bgt _023331F4
	bge _023339D8
	cmp r2, #0x4a
	bgt _02333170
	bge _0233397C
	cmp r2, #0x2b
	bgt _02333114
	bge _02333BCC
	cmp r2, #0x13
	bgt _023330F8
	bge _02333620
	sub r1, r2, #7
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02333F90
_023330D8: ; jump table
	b _02333BCC ; case 0
	b _023339F0 ; case 1
	b _02333F90 ; case 2
	b _02333F90 ; case 3
	b _02333F90 ; case 4
	b _02333918 ; case 5
	b _02333F90 ; case 6
	b _0233360C ; case 7
_023330F8:
	cmp r2, #0x26
	bgt _02333108
	beq _02333634
	b _02333F90
_02333108:
	cmp r2, #0x28
	beq _02333648
	b _02333F90
_02333114:
	cmp r2, #0x37
	bgt _0233313C
	bge _02333660
	cmp r2, #0x31
	bgt _02333130
	beq _02333A84
	b _02333F90
_02333130:
	cmp r2, #0x33
	beq _02333634
	b _02333F90
_0233313C:
	cmp r2, #0x3d
	bgt _02333164
	cmp r2, #0x38
	blt _02333F90
	beq _02333B00
	cmp r2, #0x3a
	beq _023336B0
	cmp r2, #0x3d
	beq _023336D8
	b _02333F90
_02333164:
	cmp r2, #0x46
	beq _023336B0
	b _02333F90
_02333170:
	cmp r2, #0x68
	bgt _023331B0
	bge _02333730
	cmp r2, #0x62
	bgt _02333194
	bge _02333700
	cmp r2, #0x5f
	beq _023336EC
	b _02333F90
_02333194:
	cmp r2, #0x63
	bgt _023331A4
	beq _02333714
	b _02333F90
_023331A4:
	cmp r2, #0x66
	beq _02333A98
	b _02333F90
_023331B0:
	cmp r2, #0x86
	bgt _023331D8
	bge _02333954
	cmp r2, #0x80
	bgt _023331CC
	beq _02333744
	b _02333F90
_023331CC:
	cmp r2, #0x82
	beq _02333758
	b _02333F90
_023331D8:
	cmp r2, #0x8d
	bgt _023331E8
	beq _0233392C
	b _02333F90
_023331E8:
	cmp r2, #0x94
	beq _02333B14
	b _02333F90
_023331F4:
	cmp r2, #0xd7
	bgt _02333284
	bge _023336C4
	cmp r2, #0xb9
	bgt _02333240
	bge _02333BF4
	cmp r2, #0xa9
	bgt _02333224
	bge _02333780
	cmp r2, #0xa0
	beq _02333AB8
	b _02333F90
_02333224:
	cmp r2, #0xb5
	bgt _02333234
	beq _02333B28
	b _02333F90
_02333234:
	cmp r2, #0xb8
	beq _02333BE0
	b _02333F90
_02333240:
	cmp r2, #0xc3
	bgt _02333268
	bge _02333660
	cmp r2, #0xba
	bgt _0233325C
	beq _023336B0
	b _02333F90
_0233325C:
	cmp r2, #0xbb
	beq _02333BCC
	b _02333F90
_02333268:
	cmp r2, #0xca
	bgt _02333278
	beq _023336B0
	b _02333F90
_02333278:
	cmp r2, #0xd4
	beq _02333A44
	b _02333F90
_02333284:
	cmp r2, #0xec
	bgt _023332C4
	bge _023337D4
	cmp r2, #0xe1
	bgt _023332A8
	bge _02333B3C
	cmp r2, #0xdf
	beq _02333940
	b _02333F90
_023332A8:
	cmp r2, #0xe8
	bgt _023332B8
	beq _023339B0
	b _02333F90
_023332B8:
	cmp r2, #0xe9
	beq _02333794
	b _02333F90
_023332C4:
	sub r0, r1, #8
	cmp r2, r0
	bgt _023332F0
	bge _02333674
	cmp r2, #0xf5
	bgt _023332E4
	beq _0233380C
	b _02333F90
_023332E4:
	cmp r2, #0x100
	beq _02333820
	b _02333F90
_023332F0:
	sub r0, r1, #7
	cmp r2, r0
	bgt _02333304
	beq _023336B0
	b _02333F90
_02333304:
	sub r0, r1, #6
	cmp r2, r0
	beq _0233376C
	b _02333F90
_02333314:
	add r5, r1, #0x68
	cmp r2, r5
	bgt _023334B4
	bge _02333BCC
	add r5, r1, #0x34
	cmp r2, r5
	bgt _02333414
	bge _02333820
	cmp r2, #0x120
	bgt _02333398
	bge _02333884
	add r4, r1, #0x11
	cmp r2, r4
	bgt _02333378
	mov r0, r4
	cmp r2, r0
	bge _02333B60
	add r0, r1, #4
	cmp r2, r0
	bgt _02333F90
	cmp r2, #0x10c
	blt _02333F90
	cmpne r2, r0
	beq _02333BCC
	b _02333F90
_02333378:
	cmp r2, #0x11c
	bgt _02333388
	beq _02333BCC
	b _02333F90
_02333388:
	add r1, r1, #0x15
	cmp r2, r1
	beq _02333850
	b _02333F90
_02333398:
	add r0, r1, #0x2a
	cmp r2, r0
	bgt _023333F4
	add r0, r1, #0x24
	subs r0, r2, r0
	addpl pc, pc, r0, lsl #2
	b _023333D0
_023333B4: ; jump table
	b _02333904 ; case 0
	b _023336B0 ; case 1
	b _02333F90 ; case 2
	b _02333A98 ; case 3
	b _02333904 ; case 4
	b _02333F90 ; case 5
	b _02333A64 ; case 6
_023333D0:
	ldr r0, _02333F9C ; =0x00000127
	cmp r2, r0
	bgt _023333E4
	beq _02333B84
	b _02333F90
_023333E4:
	add r0, r0, #3
	cmp r2, r0
	beq _023338F0
	b _02333F90
_023333F4:
	add r0, r1, #0x30
	cmp r2, r0
	bgt _02333408
	beq _02333898
	b _02333F90
_02333408:
	cmp r2, #0x13c
	beq _023338AC
	b _02333F90
_02333414:
	cmp r2, #0x154
	bgt _02333464
	bge _023336D8
	add r0, r1, #0x44
	cmp r2, r0
	bgt _02333440
	bge _02333660
	add r0, r1, #0x36
	cmp r2, r0
	beq _02333B9C
	b _02333F90
_02333440:
	add r0, r1, #0x45
	cmp r2, r0
	bgt _02333454
	beq _02333BB8
	b _02333F90
_02333454:
	add r0, r1, #0x49
	cmp r2, r0
	beq _023338C0
	b _02333F90
_02333464:
	cmp r2, #0x16c
	bgt _02333494
	bge _02333990
	add r0, r1, #0x4e
	cmp r2, r0
	bgt _02333484
	beq _023338D4
	b _02333F90
_02333484:
	add r0, r1, #0x54
	cmp r2, r0
	beq _02333700
	b _02333F90
_02333494:
	add r0, r1, #0x66
	cmp r2, r0
	bgt _023334A8
	beq _02333BCC
	b _02333F90
_023334A8:
	cmp r2, #0x170
	beq _02333BCC
	b _02333F90
_023334B4:
	cmp r2, #0x1d8
	bgt _02333578
	bge _02333634
	add r5, r1, #0x7e
	cmp r2, r5
	bgt _02333520
	mov r4, r5
	cmp r2, r4
	bge _02333968
	add r4, r1, #0x71
	cmp r2, r4
	bgt _02333500
	mov r0, r4
	cmp r2, r0
	bge _02333ACC
	add r0, r1, #0x6e
	cmp r2, r0
	beq _02333BCC
	b _02333F90
_02333500:
	cmp r2, #0x17c
	bgt _02333510
	beq _02333A98
	b _02333F90
_02333510:
	add r1, r1, #0x7c
	cmp r2, r1
	beq _02333A1C
	b _02333F90
_02333520:
	cmp r2, #0x1bc
	bgt _02333550
	bge _023336EC
	add r0, r1, #0x8d
	cmp r2, r0
	bgt _02333540
	beq _02333BCC
	b _02333F90
_02333540:
	add r0, r1, #0xa9
	cmp r2, r0
	beq _02333CEC
	b _02333F90
_02333550:
	add r5, r1, #0xb6
	cmp r2, r5
	bgt _0233356C
	mov r0, r5
	cmp r2, r0
	beq _02333D00
	b _02333F90
_0233356C:
	cmp r2, #0x1d0
	beq _02333DE0
	b _02333F90
_02333578:
	add r0, r1, #0xea
	cmp r2, r0
	bgt _023335C0
	bge _02333F24
	cmp r2, #0x1ec
	bgt _023335A0
	bge _02333DF8
	cmp r2, #0x1e0
	beq _02333B84
	b _02333F90
_023335A0:
	add r0, r1, #0xe4
	cmp r2, r0
	bgt _023335B4
	beq _02333F10
	b _02333F90
_023335B4:
	cmp r2, #0x1f0
	beq _02333B84
	b _02333F90
_023335C0:
	rsb r0, r1, #0x320
	cmp r2, r0
	bgt _023335EC
	bge _023336D8
	cmp r2, #0x208
	bgt _023335E0
	beq _02333F38
	b _02333F90
_023335E0:
	cmp r2, #0x214
	beq _02333F6C
	b _02333F90
_023335EC:
	cmp r2, #0x21c
	bgt _023335FC
	beq _023336EC
	b _02333F90
_023335FC:
	ldr r0, _02333FA0 ; =0x0000021E
	cmp r2, r0
	beq _02333F80
	b _02333F90
_0233360C:
	bl GetApparentWeather
	cmp r0, #5
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333620:
	ldrb r0, [r3, #0xd2]
	cmp r0, #0xc
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333634:
	ldrb r0, [r3, #0xd5]
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333648:
	mov r0, r4
	bl MirrorMoveIsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333660:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333674:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	bgt _023336A8
	add r0, r3, #0x100
	ldrh r1, [r0, #0x46 + STATUS_CHECKER_CHECK_OFFSET]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + STATUS_CHECKER_CHECK_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #1
	bge _02333F90
_023336A8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336B0:
	ldrsh r0, [r3, #0x28]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336C4:
	ldrsh r0, [r3, #0x2a]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336D8:
	ldrb r0, [r3, #0xd2]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023336EC:
	ldr r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #3
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333700:
	ldrb r0, [r3, #0xec]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333714:
	ldrsh r0, [r3, #0x28]
	cmp r0, #0x13
	ldrgtsh r0, [r3, #0x2a]
	cmpgt r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333730:
	ldrb r0, [r3, #0xd5]
	cmp r0, #9
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333744:
	ldrb r0, [r3, #0xd2]
	cmp r0, #0xb
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333758:
	bl MistIsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233376C:
	ldrb r0, [r3, #0xd5]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333780:
	ldrsh r0, [r3, #0x2e]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333794:
	ldrb r0, [r3, #0xc4]
	cmp r0, #5
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r4, [r3, #0x12]
	ldrsh r2, [r3, #0x16]
	rsb r0, r1, #0x4f0
	ldrsh r1, [r3, #0x10]
	add r2, r4, r2
	cmp r2, r0
	movgt r2, r0
	add r0, r2, r2, lsr #31
	cmp r1, r0, asr #1
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023337D4:
	ldrsh r4, [r3, #0x12]
	ldrsh r2, [r3, #0x16]
	rsb r0, r1, #0x4f0
	add r2, r4, r2
	cmp r2, r0
	movgt r2, r0
	ldrsh r0, [r3, #0x10]
	cmp r2, r0
	ble _02333804
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #0
	bne _02333F90
_02333804:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233380C:
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333820:
	ldrb r0, [r3, #0xec]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333834:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ldrgtsh r0, [r3, #0x28]
	cmpgt r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333850:
	ldr r1, _02333FA4 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r1, [r1]
	ldr r3, _02333FA8 ; =ov10_022C6322
	add r1, r1, #0x4000
#ifdef JAPAN
	ldrsh r1, [r1, #0x30]
#else
	ldrsh r1, [r1, #0xd4]
#endif
	smulbb r1, r1, r2
	ldrb r1, [r3, r1]
	bl MonsterIsType
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333884:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x13
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333898:
	ldrb r0, [r3, #0xe0]
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338AC:
	ldrb r0, [r3, #0xd5]
	cmp r0, #8
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338C0:
	ldrb r0, [r3, #0xd5]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338D4:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x13
	ldrgt r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmpgt r0, #3
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023338F0:
	ldrb r0, [r3, #0xd5]
	cmp r0, #5
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333904:
	ldrb r0, [r3, #0xd5]
	cmp r0, #7
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333918:
	bl GetApparentWeather
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233392C:
	bl GetApparentWeather
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333940:
	bl GetApparentWeather
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333954:
	ldrb r0, [r3, #0xd5]
	cmp r0, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333968:
	ldrb r0, [r3, #0xef]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0233397C:
	ldrb r0, [r3, #0xec]
	cmp r0, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333990:
	ldrb r0, [r3, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339B0:
	bl ov29_023007DC
	cmp r0, #0
	bne _02333F90
	mov r0, r4
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339D8:
	bl GetTileAtEntity
	bl IsTileGround
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_023339F0:
	bl GetTileAtEntity
	mov r4, r0
	bl IsTileGround
	cmp r0, #0
	beq _02333A14
	ldrh r0, [r4]
	and r0, r0, #3
	cmp r0, #1
	beq _02333F90
_02333A14:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A1C:
	bl GetTileAtEntity
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r0]
	cmp r0, #2
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A44:
	ldr r0, _02333FA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5b + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A64:
	ldr r0, _02333FA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5c + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A84:
	ldrb r0, [r3, #0xfd]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333A98:
	ldr r0, _02333FA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe38 + STATUS_CHECKER_CHECK_OFFSET_2]
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333AB8:
	ldrb r0, [r3, #0x11e + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #3
	blo _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333ACC:
	ldrb r0, [r3, #0x62]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02333F90
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B00:
	ldrsh r0, [r3, #0x2e]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B14:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B28:
	ldrsh r0, [r3, #0x24]
	cmp r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B3C:
	ldrb r0, [r3, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r3, #0xd5]
	cmp r0, #6
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B60:
	ldrb r0, [r3, #0xef]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B84:
	add r0, r4, #4
	bl CanLayTrap
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333B9C:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	ldrgesh r0, [r3, #0x2a]
	cmpge r0, #0x14
	blt _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BB8:
	ldrb r0, [r3, #0xd8]
	cmp r0, #3
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BCC:
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BE0:
	bl Conversion2IsActive
	cmp r0, #0
	beq _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333BF4:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333C78
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333C60
_02333C0C:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333C5C
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333C5C
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrltsh r0, [r1, #0x26]
	cmplt r0, #0x14
	blt _02333C68
_02333C5C:
	add r5, r5, #1
_02333C60:
	cmp r5, #0x10
	blt _02333C0C
_02333C68:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333C78:
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333CD4
_02333C80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333CD0
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333CD0
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrltsh r0, [r1, #0x26]
	cmplt r0, #0x14
	blt _02333CDC
_02333CD0:
	add r5, r5, #1
_02333CD4:
	cmp r5, #4
	blt _02333C80
_02333CDC:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333CEC:
	ldrb r0, [r3, #0xd5]
	cmp r0, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333D00:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333D78
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333D60
_02333D18:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333D5C
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	ldrneb r0, [r0, #0xd5]
	cmpne r0, #0x11
	bne _02333D68
_02333D5C:
	add r5, r5, #1
_02333D60:
	cmp r5, #0x10
	blt _02333D18
_02333D68:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333D78:
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333DC8
_02333D80:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333DC4
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	ldrne r0, [r7, #0xb4]
	ldrneb r0, [r0, #0xd5]
	cmpne r0, #0x11
	bne _02333DD0
_02333DC4:
	add r5, r5, #1
_02333DC8:
	cmp r5, #4
	blt _02333D80
_02333DD0:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DE0:
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333DF8:
	ldrb r0, [r3, #6]
	mov r5, #0
	cmp r0, #0
	beq _02333E8C
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333E74
_02333E10:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333E70
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333E70
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x26]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x2a]
	cmpge r0, #0x14
	blt _02333E7C
_02333E70:
	add r5, r5, #1
_02333E74:
	cmp r5, #0x10
	blt _02333E10
_02333E7C:
	cmp r5, #0x10
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333E8C:
	ldr r6, _02333FA4 ; =DUNGEON_PTR
	b _02333EF8
_02333E94:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + STATUS_CHECKER_CHECK_OFFSET_2]
	mov r0, r7
	bl EntityIsValid__02333FAC
	cmp r0, #0
	cmpne r7, r4
	beq _02333EF4
	mov r0, r4
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _02333EF4
	ldr r1, [r7, #0xb4]
	ldrsh r0, [r1, #0x24]
	cmp r0, #0x14
	ldrgesh r0, [r1, #0x28]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x26]
	cmpge r0, #0x14
	ldrgesh r0, [r1, #0x2a]
	cmpge r0, #0x14
	blt _02333F00
_02333EF4:
	add r5, r5, #1
_02333EF8:
	cmp r5, #4
	blt _02333E94
_02333F00:
	cmp r5, #4
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F10:
	ldrb r0, [r3, #0xf7]
	cmp r0, #1
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F24:
	ldr r0, [r3, #0x110 + STATUS_CHECKER_CHECK_OFFSET]
	cmp r0, #1
	ble _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F38:
	mov r1, #0
	b _02333F54
_02333F40:
	add r0, r3, r1, lsl #1
	ldrsh r0, [r0, #0x28]
	cmp r0, #0x14
	blt _02333F5C
	add r1, r1, #1
_02333F54:
	cmp r1, #2
	blt _02333F40
_02333F5C:
	cmp r1, #2
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F6C:
	ldrb r0, [r3, #0xd5]
	cmp r0, #0xf
	bne _02333F90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02333F80:
	ldrsh r0, [r3, #0x26]
	cmp r0, #0x14
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_02333F90:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02333F98: .word 0x00000109
_02333F9C: .word 0x00000127
_02333FA0: .word 0x0000021E
_02333FA4: .word DUNGEON_PTR
_02333FA8: .word ov10_022C6322
	arm_func_end StatusCheckerCheck
