	.include "asm/macros.inc"
	.include "overlay_29_02324698.inc"

	.text

	arm_func_start ov29_02324698
ov29_02324698: ; 0x02324698
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x140
	mov r6, #0
	ldr fp, _02324740 ; =DUNGEON_PTR
	mov r7, r6
	add r4, sp, #0
_023246B0:
	ldr r0, [fp]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xad4]
#else
	ldr sb, [r0, #0xb78]
#endif
	mov r0, sb
	bl EntityIsValid__02321438
	cmp r0, #0
	beq _0232470C
	ldr r0, [sb, #0xb4]
	mov r8, #0
#ifdef JAPAN
	add r5, r0, #0x120
#else
	add r5, r0, #0x124
#endif
_023246DC:
	add sl, r5, r8, lsl #3
	mov r0, sb
	mov r1, sl
	bl ov29_02324748
	cmp r0, #0
	beq _02324700
	cmp r6, #0x50
	strlt sl, [r4, r6, lsl #2]
	addlt r6, r6, #1
_02324700:
	add r8, r8, #1
	cmp r8, #4
	blt _023246DC
_0232470C:
	add r7, r7, #1
	cmp r7, #0x14
	blt _023246B0
	cmp r6, #0
	ldreq r0, _02324744 ; =0x00000163
	beq _02324738
	mov r0, r6
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
	ldrh r0, [r0, #4]
_02324738:
	add sp, sp, #0x140
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02324740: .word DUNGEON_PTR
_02324744: .word 0x00000163
	arm_func_end ov29_02324698

	arm_func_start ov29_02324748
ov29_02324748: ; 0x02324748
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldrb r1, [r4]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02324788
	ldrh r1, [r4, #4]
	bl ov29_02324D60
	cmp r0, #0
	bne _02324788
	ldrh r0, [r4, #4]
	bl IsCopyingMove
	cmp r0, #0
	beq _02324790
_02324788:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02324790:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02324748

	arm_func_start HasMaxGinsengBoost99
HasMaxGinsengBoost99: ; 0x02324798
	stmdb sp!, {r3, lr}
	bl GetMoveMaxGinsengBoost
	cmp r0, #0x63
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end HasMaxGinsengBoost99

	arm_func_start ov29_023247B4
ov29_023247B4: ; 0x023247B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r8, r0
	ldr r0, [r8, #0xb4]
	mov r7, #0
	mov r6, r7
#ifdef JAPAN
	add r5, r0, #0x120
#else
	add r5, r0, #0x124
#endif
	add r4, sp, #0
_023247D4:
	add sb, r5, r6, lsl #3
	mov r0, r8
	mov r1, sb
	bl ov29_02324748
	cmp r0, #0
	beq _02324814
	mov r0, sb
	bl HasMaxGinsengBoost99
	cmp r0, #0
	beq _02324814
	ldrh r2, [sb, #4]
	add r0, r7, #1
	mov r1, r7, lsl #1
	mov r0, r0, lsl #0x10
	strh r2, [r4, r1]
	mov r7, r0, asr #0x10
_02324814:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _023247D4
	cmp r7, #0
	movle r0, #0
	ble _0232484C
	mov r0, r7
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #0
	mov r0, r0, asr #0xf
	ldrh r0, [r1, r0]
_0232484C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_023247B4

	arm_func_start TwoTurnMoveForcedMiss
TwoTurnMoveForcedMiss: ; 0x02324854
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
#ifdef JAPAN
	ldrb r0, [r2, #0x10a]
#else
	ldrb r0, [r2, #0x10b]
#endif
	cmp r0, #1
	bne _023248A4
	ldrh r0, [r1, #4]
	cmp r0, #0x88
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x39
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_023248A4:
	cmp r0, #2
	bne _02324928
	ldrb r0, [r2, #0xd2]
	cmp r0, #9
	bne _023248D8
	ldrh r0, [r1, #4]
	cmp r0, #0x20
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xdb
	bne _02324920
	mov r0, #0
	ldmia sp!, {r3, pc}
_023248D8:
	cmp r0, #0xa
	bne _02324920
	ldrh r0, [r1, #4]
	cmp r0, #0x76
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x128
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x77
	bne _02324920
	bl GetNaturePowerVariant
	ldr r1, _02324930 ; =NATURE_POWER_TABLE
	mov r0, r0, lsl #3
	ldrh r0, [r1, r0]
	cmp r0, #0x76
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_02324920:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02324928:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02324930: .word NATURE_POWER_TABLE
	arm_func_end TwoTurnMoveForcedMiss

	arm_func_start DungeonRandOutcomeUserTargetInteraction
DungeonRandOutcomeUserTargetInteraction: ; 0x02324934
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, [r5, #0xb4]
#ifdef JAPAN
	ldrb r0, [r1, #0x15e]
#else
	ldrb r0, [r1, #0x162]
#endif
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r1, #0x10]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	beq _023249DC
	mov r0, r6
	mov r1, #0x26
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023249CC
	mov r0, r4, lsl #1
	bl DungeonRandOutcome__022EAB50
	mov r4, r0
	b _023249E0
_023249CC:
	mov r0, r4
	bl DungeonRandOutcome__022EAB50
	mov r4, r0
	b _023249E0
_023249DC:
	mov r4, #1
_023249E0:
	cmp r4, #0
	cmpne r6, r5
	beq _02324A18
	mov r0, r6
	mov r1, r5
	mov r2, #0x4c
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02322D64
	cmp r0, #0
	beq _02324A18
	mov r0, r5
	bl ov29_022E65A8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02324A18:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DungeonRandOutcomeUserTargetInteraction

	arm_func_start DungeonRandOutcomeUserAction
DungeonRandOutcomeUserAction: ; 0x02324A20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, #0x26
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02324A68
	mov r0, r4, lsl #1
	bl DungeonRandOutcome__022EAB50
	ldmia sp!, {r3, r4, r5, pc}
_02324A68:
	mov r0, r4
	bl DungeonRandOutcome__022EAB50
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DungeonRandOutcomeUserAction

	arm_func_start CanAiUseMove
CanAiUseMove: ; 0x02324A74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	ldr r3, [r6, #0xb4]
	mov r5, r2
#ifdef JAPAN
	add r0, r3, #0x120
#else
	add r0, r3, #0x124
#endif
	ldrb r2, [r0, r1, lsl #3]
	add r4, r0, r1, lsl #3
	tst r2, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	tst r2, #2
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	tst r2, #0x20
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r4, #2]
	tst r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0
#ifdef JAPAN
	add r7, r3, #0x140
#else
	add r7, r3, #0x144
#endif
	b _02324B14
_02324ADC:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl CanMonsterUseMove
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r4, r4, #8
	cmp r4, r7
	bhs _02324B1C
	ldrb r0, [r4]
	tst r0, #2
	beq _02324B1C
	add r8, r8, #1
_02324B14:
	cmp r8, #4
	blt _02324ADC
_02324B1C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CanAiUseMove

	arm_func_start CanMonsterUseMove
CanMonsterUseMove: ; 0x02324B24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrh r3, [r5, #4]
	ldr r1, _02324BE4 ; =0x00000163
	ldr r4, [r0, #0xb4]
	cmp r3, r1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5]
	tst r0, #0x20
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [r5, #2]
	tst r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #6]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #5
	bne _02324BA0
	mov r0, r5
	bl IsAffectedByTaunt
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324BA0:
	ldrb r0, [r4, #0xd0]
	cmp r0, #6
	bne _02324BDC
	ldrh r0, [r5, #4]
	cmp r0, #0x160
	bne _02324BCC
#ifdef JAPAN
	ldrb r0, [r4, #0x140]
#else
	ldrb r0, [r4, #0x144]
#endif
	tst r0, #0x10
	bne _02324BDC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02324BCC:
	ldrb r0, [r5]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324BDC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02324BE4: .word 0x00000163
	arm_func_end CanMonsterUseMove

	arm_func_start ov29_02324BE8
ov29_02324BE8: ; 0x02324BE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrh r3, [r5, #4]
	ldr r1, _02324C98 ; =0x00000163
	ldr r4, [r0, #0xb4]
	cmp r3, r1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5]
	tst r0, #0x20
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrh r0, [r5, #2]
	tst r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xd0]
	cmp r0, #5
	bne _02324C54
	mov r0, r5
	bl IsAffectedByTaunt
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324C54:
	ldrb r0, [r4, #0xd0]
	cmp r0, #6
	bne _02324C90
	ldrh r0, [r5, #4]
	cmp r0, #0x160
	bne _02324C80
#ifdef JAPAN
	ldrb r0, [r4, #0x140]
#else
	ldrb r0, [r4, #0x144]
#endif
	tst r0, #0x10
	bne _02324C90
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02324C80:
	ldrb r0, [r5]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02324C90:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02324C98: .word 0x00000163
	arm_func_end ov29_02324BE8

	arm_func_start ov29_02324C9C
ov29_02324C9C: ; 0x02324C9C
	stmdb sp!, {lr}
	sub sp, sp, #0x104
	mov ip, #0
	mov lr, ip
	add r2, sp, #0
	b _02324CDC
_02324CB4:
	ldr r3, [r0, lr, lsl #2]
	cmp r3, #0
	beq _02324CE4
	cmp r3, r1
	beq _02324CD8
	cmp ip, #0x40
	bge _02324CE4
	str r3, [r2, ip, lsl #2]
	add ip, ip, #1
_02324CD8:
	add lr, lr, #1
_02324CDC:
	cmp lr, #0x41
	blt _02324CB4
_02324CE4:
	mov lr, #0
	add r2, sp, #0
	b _02324D18
_02324CF0:
	ldr r3, [r0, lr, lsl #2]
	cmp r3, #0
	beq _02324D20
	cmp r3, r1
	bne _02324D14
	cmp ip, #0x40
	bge _02324D20
	str r3, [r2, ip, lsl #2]
	add ip, ip, #1
_02324D14:
	add lr, lr, #1
_02324D18:
	cmp lr, #0x41
	blt _02324CF0
_02324D20:
	mov r2, #0
	add r1, sp, #0
	b _02324D34
_02324D2C:
	str r2, [r1, ip, lsl #2]
	add ip, ip, #1
_02324D34:
	cmp ip, #0x41
	blt _02324D2C
	mov r3, #0
	add r2, sp, #0
_02324D44:
	ldr r1, [r2, r3, lsl #2]
	str r1, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x41
	blt _02324D44
	add sp, sp, #0x104
	ldmia sp!, {pc}
	arm_func_end ov29_02324C9C

	arm_func_start ov29_02324D60
ov29_02324D60: ; 0x02324D60
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r4, #0x97
	bne _02324D80
	bl GetApparentWeather
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02324D80:
	mov r0, r4
	bl Is2TurnsMove
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02324D60

	arm_func_start UpdateMovePp
UpdateMovePp: ; 0x02324D8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__02321438
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	mov r1, #0
_02324DAC:
#ifdef JAPAN
	add r2, r0, #0x120
#else
	add r2, r0, #0x124
#endif
	ldrb r3, [r2, r1, lsl #3]
	add r2, r2, r1, lsl #3
	tst r3, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	beq _02324E34
	ldrh r3, [r2, #2]
	mov lr, #1
	tst r3, #0x10
	bicne r3, r3, #0x10
	strneh r3, [r2, #2]
	ldrh r3, [r2, #2]
	movne lr, #2
	tst r3, #0x40
	bicne r3, r3, #0x40
	strneh r3, [r2, #2]
	ldrh r3, [r2, #2]
	movne lr, #4
	tst r3, #8
	bicne r3, r3, #8
	strneh r3, [r2, #2]
	cmpne r4, #0
	beq _02324E34
	mov ip, #0
	b _02324E2C
_02324E18:
	ldrb r3, [r2, #6]
	add ip, ip, #1
	cmp r3, #0
	subne r3, r3, #1
	strneb r3, [r2, #6]
_02324E2C:
	cmp ip, lr
	blt _02324E18
_02324E34:
	add r1, r1, #1
	cmp r1, #4
	blt _02324DAC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateMovePp

	arm_func_start GetDamageSourceWrapper
GetDamageSourceWrapper: ; 0x02324E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl LowerSshort
	mov r1, r0
	ldrh r0, [r4, #4]
	bl GetDamageSource
	ldmia sp!, {r4, pc}
	arm_func_end GetDamageSourceWrapper

	arm_func_start LowerSshort
LowerSshort: ; 0x02324E64
	cmp r0, #0
	moveq r0, #0
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	bx lr
	arm_func_end LowerSshort

	arm_func_start ov29_02324E78
ov29_02324E78: ; 0x02324E78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r6, r1
	mov r8, r2
	bl ShouldMovePlayAlternativeAnimation
	mov r4, r0
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, r4
	bl GetMoveAnimationId
	bl ov10_022BFD58
	mov sl, r0
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, r4
	bl GetMoveAnimationId
	bl GetMoveAnimation
	ldrsh r5, [r0]
	mov r0, r7
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	moveq r0, sl
	beq _023250C8
	mov r0, r7
	mov r1, r6
	bl ov29_02325D20
	cmp r0, #0
	movne r0, sl
	bne _023250C8
	cmp r8, #0
	moveq r0, sl
	beq _023250C8
	cmp r5, #0
	beq _023250C4
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, r4
	bl GetMoveAnimationId
	mov r4, r0
	ldrh r0, [r6, #4]
	ldr r5, [r7, #0xb4]
	bl ov10_022BFD8C
	mov sb, r0
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r6, #4]
	mov r2, #1
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r5, #4]
	bl ov10_022BF01C
	mov r2, r0
	mvn r0, #0
	cmp r2, r0
	ldreq r0, _023250D0 ; =ov29_02352AD8
	ldreqh r1, [r0, #8]
	streqh r1, [sp, #8]
	ldreqh r0, [r0, #0xa]
	streqh r0, [sp, #0xa]
	beq _02324F98
	add r0, sp, #8
	add r1, r7, #0x2c
	and r2, r2, #0xff
	bl sub_0201CF90
_02324F98:
	strh r4, [sp]
	ldrsh r1, [r5, #4]
	add r0, sp, #0
	mov r2, #0
	strh r1, [sp, #2]
	ldr r3, [r7, #0xc]
	mov r1, #1
	mov r3, r3, asr #8
	strh r3, [sp, #4]
	ldr r3, [r7, #0x10]
	mov r3, r3, asr #8
	strh r3, [sp, #6]
	ldrb r3, [r5, #0x4c]
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	bl ov29_02325D7C
	mov r0, #0x58
	bl AdvanceFrame
	add r0, sp, #0
	bl ov10_022BFAA8
	mov r1, r7
	mov r2, #5
	mov r8, r0
	bl ov29_022E6D68
	mov r0, #1
	bl ov29_022DE5F0
	mov r7, r0
	cmp sb, #0
	bne _0232506C
	ldrh r0, [r6, #4]
	bl ov10_022BFDEC
	cmp r0, #0
	beq _0232506C
	mov r6, #0
	bl ov29_022ED0C4
	mov r5, r0
	mov r0, #1
	bl ov29_022E3560
	mov r4, #0xff
	mov fp, #1
	b _02325064
_0232503C:
	add r0, r5, #0x20
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0xff
	movgt r5, r4
	mov r0, r5
	movgt r6, fp
	bl ov29_022ED0D4
	mov r0, #0x26
	bl AdvanceFrame
_02325064:
	cmp r6, #0
	beq _0232503C
_0232506C:
	mov r0, r8, lsl #0x10
	mov r4, r0, asr #0x10
	mov r8, #0
	mov r6, #1
	mov r5, #0x26
	b _023250B0
_02325084:
	beq _023250A8
	cmp r7, #0x20
	subgt r7, r7, #0x20
	movle r7, r8
	mov r0, r7, lsl #0x10
	mov r1, r6
	mov r0, r0, asr #0x10
	movle sb, r8
	bl ov29_022DE5D8
_023250A8:
	mov r0, r5
	bl AdvanceFrame
_023250B0:
	mov r0, r4
	bl AnimationHasMoreFrames
	cmp r0, #0
	cmpne sb, #0
	bne _02325084
_023250C4:
	mov r0, sl
_023250C8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023250D0: .word ov29_02352AD8
	arm_func_end ov29_02324E78

	arm_func_start ov29_023250D4
ov29_023250D4: ; 0x023250D4
#ifdef JAPAN
#define OV29_023250D4_OFFSET -0xA4
#else
#define OV29_023250D4_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	mov sb, r1
	bl ShouldMovePlayAlternativeAnimation
	mov r8, r0
	ldr r7, [sl, #0xb4]
	mov r1, #0
	mov r0, sl
	str r1, [sp]
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r7, #4]
	bl ov10_022BFA3C
	mov r4, r0
	mov r0, sl
	ldr r6, [sl, #0xb4]
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r5, r0
	bl GetMoveAnimation
	ldrsh r0, [r0, #2]
	cmp r0, #0
	beq _023251E0
	mov r0, sl
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r6, #4]
	bl ov10_022BF01C
	mov r2, r0
	mvn r0, #0
	cmp r2, r0
	ldreq r0, _02325608 ; =ov29_02352AD8
	ldreqh r1, [r0, #4]
	streqh r1, [sp, #0xc]
	ldreqh r0, [r0, #6]
	streqh r0, [sp, #0xe]
	beq _023251A8
	add r0, sp, #0xc
	add r1, sl, #0x2c
	and r2, r2, #0xff
	bl sub_0201CF90
_023251A8:
	strh r5, [sp, #4]
	ldrsh r1, [r6, #4]
	mov r0, #0
	strh r1, [sp, #6]
	ldr r1, [sl, #0xc]
	mov r1, r1, asr #8
	strh r1, [sp, #8]
	ldr r1, [sl, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	ldrb r1, [r6, #0x4c]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	b _023251E8
_023251E0:
	mov r0, #0
	strh r0, [sp, #4]
_023251E8:
	add r0, sp, #4
	mov r1, #1
	bl ov10_022BF1FC
	cmp r0, #0
	ldrne r0, _0232560C ; =DUNGEON_PTR
	ldrne r0, [r0]
	addne r0, r0, #0x1a000
	ldrne r5, [r0, #0x22c + OV29_023250D4_OFFSET]
	bne _02325228
	ldrh r0, [sb, #4]
	cmp r0, #0x52
	ldreq r0, _0232560C ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x1a000
	ldreq r5, [r0, #0x22c + OV29_023250D4_OFFSET]
	movne r5, sl
_02325228:
	mov r0, r5
	bl EntityIsValid__02325620
	cmp r0, #0
	moveq r5, sl
	ldr r1, [r5, #0xc]
	mov r0, r5
	mov r1, r1, asr #8
	strh r1, [sp, #8]
	ldr r1, [r5, #0x10]
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325600
	mov r0, sl
	mov r1, sb
	bl ov29_02325D20
	cmp r0, #0
	bne _02325600
	ldrh r0, [sb, #4]
	cmp r0, #0x128
	bne _023252E4
	mov r0, #7
	bl DungeonRandInt
	ldr r1, _0232560C ; =DUNGEON_PTR
	ldr r6, _02325610 ; =ov29_02352B1C
	ldr r3, [r1]
	ldr r2, _02325614 ; =ov29_0237CA84
	ldr r6, [r6, r0, lsl #2]
	str r0, [r2]
	add r0, r3, #0x1a000
	str r6, [r0, #0x234 + OV29_023250D4_OFFSET]
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x1a000
	ldr r3, [r1, #0x234 + OV29_023250D4_OFFSET]
	str r3, [r1, #0x238 + OV29_023250D4_OFFSET]
	ldr r1, [r2]
	add r1, r1, #4
	bl ov29_0234B09C
	ldr r1, _02325618 ; =0x00000EAA
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, #0x214
	bl ov29_022E56A0
	b _0232531C
_023252E4:
	cmp r0, #0x76
	bne _0232531C
	ldr r2, _0232560C ; =DUNGEON_PTR
	mov r3, #0xc
	ldr r1, [r2]
	mov r0, r5
	add r1, r1, #0x1a000
	str r3, [r1, #0x234 + OV29_023250D4_OFFSET]
	ldr r2, [r2]
	mov r1, #0x214
	add r2, r2, #0x1a000
	ldr r3, [r2, #0x234 + OV29_023250D4_OFFSET]
	str r3, [r2, #0x238 + OV29_023250D4_OFFSET]
	bl ov29_022E56A0
_0232531C:
	mov r0, sl
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [sb, #4]
	mov r2, r8
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r7, #4]
	bl ov10_022BF0F4
	cmp r0, #0x3f00
	beq _02325354
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov29_022EACCC
_02325354:
	cmp r4, #0x63
	bne _023253C8
	mov r0, r5
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325600
	mov r3, r8
	add r0, sp, #4
	mov r1, sl
	mov r2, sb
	ldrb r8, [r7, #0x4c]
	bl ov29_02325644
	mov r7, #0
	mov r6, r7
	mov r5, #2
	mov r4, #0x15
_02325394:
	sub r0, r8, #1
	and r8, r0, #7
	mov r0, sl
	mov r1, r6
	mov r2, r8
	bl ChangeMonsterAnimation
	mov r0, r5
	mov r1, r4
	bl ov29_022EA370
	add r7, r7, #1
	cmp r7, #8
	blt _02325394
	b _02325600
_023253C8:
	cmp r4, #0x62
	bne _0232543C
	mov r0, r5
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _02325600
	add r0, sp, #4
	mov r1, sl
	mov r2, sb
	mov r3, r8
	ldrb r7, [r7, #0x4c]
	bl ov29_02325644
	mov r8, #0
	mov r6, r8
	mov r5, #2
	mov r4, #0x15
_02325408:
	and r7, r7, #7
	mov r0, sl
	mov r1, r6
	mov r2, r7
	bl ChangeMonsterAnimation
	mov r0, r5
	mov r1, r4
	bl ov29_022EA370
	add r8, r8, #1
	cmp r8, #8
	add r7, r7, #1
	ble _02325408
	b _02325600
_0232543C:
	ldrb r0, [r7, #0xd8]
	mov fp, #0
	cmp r0, #2
	moveq fp, #1
	beq _02325470
	ldr r0, _0232560C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldr r1, [r0, #0x22c + OV29_023250D4_OFFSET]
	cmp r1, sl
	ldrneb r0, [r0, #0x245 + OV29_023250D4_OFFSET]
	cmpne r0, #0
	movne fp, #1
_02325470:
	ldrb r0, [sl, #0x28]
	cmp r0, #0
	bne _02325524
	mov r5, #0
_02325480:
	ldr r0, _0232560C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78 + OV29_023250D4_OFFSET]
	mov r0, r6
	bl EntityIsValid__02325620
	cmp r0, #0
	cmpne r6, sl
	ldrneb r0, [r6, #0x28]
	cmpne r0, #0
	beq _023254C8
	ldr r1, [r6, #0xb4]
	mov r0, r6
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
	mov r0, #0
	strb r0, [r6, #0x28]
_023254C8:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02325480
	mov r0, #0x59
	bl AdvanceFrame
	cmp fp, #0
	beq _02325500
	ldr r0, _0232561C ; =0x00000229
	bl GetSpriteIndex__02052708
	mov r1, r0
	mov r0, #1
	bl SetAndLoadCurrentAttackAnimation
	mov r5, r0
	b _02325530
_02325500:
	ldrsh r0, [r7, #4]
	bl GetSpriteIndex__02052708
	mov r1, r0
	mov r0, #1
	bl SetAndLoadCurrentAttackAnimation
	mov r1, #0xff
	mov r5, r0
	strb r1, [sl, #0xaf]
	b _02325530
_02325524:
	mov r0, #0x59
	bl AdvanceFrame
	ldrsh r5, [sl, #0xa8]
_02325530:
	ldrb r2, [r7, #0x4c]
	mov r0, sl
	mov r1, r4
	bl ChangeMonsterAnimation
	ldrb r1, [sl, #0xae]
	mov r0, r5
	bl WanTableSpriteHasAnimationGroup
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	strb r0, [sl, #0x28]
	mov r7, #0
	strb r7, [sl, #0x21]
	mov r5, #0x59
	add fp, sp, #4
	b _023255D8
_02325570:
	mov r0, r5
	bl AdvanceFrame
	add r0, sl, #0x2c
	bl sub_0201D1D4
	cmp r4, #0
	cmpne r4, #7
	mov r6, r0
	cmpne r4, #9
	orreq r6, r6, #2
	tst r6, #2
	beq _023255C4
	ldr r0, [sp]
	cmp r0, #0
	bne _023255C4
	mov r0, fp
	mov r1, sl
	mov r2, sb
	mov r3, r8
	bl ov29_02325644
	mov r0, #1
	str r0, [sp]
_023255C4:
	tst r6, #1
	ldreqb r0, [sl, #0x21]
	cmpeq r0, #0
	bne _023255E0
	add r7, r7, #1
_023255D8:
	cmp r7, #0x78
	blt _02325570
_023255E0:
	mov r0, #0
	strb r0, [sl, #0x21]
	ldrh r0, [sb, #4]
	bl ov10_022BFDCC
	cmp r0, #0
	beq _02325600
	mov r0, #1
	bl AnimationDelayOrSomething
_02325600:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02325608: .word ov29_02352AD8
_0232560C: .word DUNGEON_PTR
_02325610: .word ov29_02352B1C
_02325614: .word ov29_0237CA84
#ifdef JAPAN
_02325618: .word 0x00000BEC
#else
_02325618: .word 0x00000EAA
#endif
_0232561C: .word 0x00000229
	arm_func_end ov29_023250D4
