	.include "asm/macros.inc"
	.include "overlay_29_02313CE4.inc"

	.text

	arm_func_start ActivateFlashFire
ActivateFlashFire: ; 0x02313CE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r0, r5
	bl EntityIsValid__023118B4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	ldr r4, [r5, #0xb4]
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r4, #0x30]
	add r1, r0, #1
	cmp r1, #2
	movge r1, #2
	cmp r0, r1
	beq _02313D34
	mov r0, r5
	strh r1, [r4, #0x30]
	bl ov29_022E4338
_02313D34:
	mov r0, r5
	bl UpdateStatusIconFlags
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ActivateFlashFire

	arm_func_start ApplyOffensiveStatMultiplier
ApplyOffensiveStatMultiplier: ; 0x02313D40
#ifdef JAPAN
#define APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET -0x2C0
#else
#define APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET 0
#endif
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r7, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r0, r8
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _02313F3C
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313D94
	ldr r1, _02313F48 ; =0x00000DCB
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
	b _02313DAC
_02313D94:
	ldr r1, _02313F4C ; =0x00000DCA
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
_02313DAC:
	cmp r7, #0x100
	bge _02313DCC
	ldrb r2, [sp, #0x30]
	mov r0, sb
	mov r1, r8
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _02313F3C
_02313DCC:
	mov r0, r8
	mov r1, #0x12
	bl ItemIsActive__02311BF8
	cmp r0, #0
	beq _02313E0C
	cmp r7, #0x100
	bge _02313E0C
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02313F50 ; =0x00000DB2
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F3C
_02313E0C:
	mov r0, sb
	mov r1, r8
	mov r2, #9
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02313E6C
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _02313E6C
	cmp r7, #0x100
	bge _02313E6C
	ldrb r0, [sp, #0x30]
	cmp r0, #0
	beq _02313F3C
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02313F54 ; =0x00000D9E
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F3C
_02313E6C:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	ldr r6, [sp, #0x28]
	cmp r7, #0x100
	add r0, r5, r6, lsl #2
	ldr r4, [r0, #0x34]
	add r1, sp, #0x28
	mov r0, r8
	bge _02313EA8
	ldr r1, [r1]
	bl ov29_022E5068
	b _02313EB0
_02313EA8:
	ldr r1, [r1]
	bl ov29_022E4FC0
_02313EB0:
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x34]
	mov r1, r7
	bl MultiplyByFixedPoint
	add r1, r5, r6, lsl #2
	str r0, [r1, #0x34]
	cmp r0, #2
	movlt r0, #2
	strlt r0, [r1, #0x34]
	add r2, r5, r6, lsl #2
	ldr r1, [r2, #0x34]
	ldr r0, _02313F58 ; =0x000063FD
	cmp r1, r0
	strgt r0, [r2, #0x34]
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x34]
	cmp r4, r0
	ble _02313F0C
	ldr r2, _02313F5C ; =0x00000DD1
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F34
_02313F0C:
	bge _02313F24
	mov r0, sb
	mov r1, r8
	mov r2, #0xdd0 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02313F34
_02313F24:
	ldr r2, _02313F60 ; =0x00000DD3
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_02313F34:
	mov r0, r8
	bl UpdateStatusIconFlags
_02313F3C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02313F48: .word 0x00000DCB + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F4C: .word 0x00000DCA + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F50: .word 0x00000DB2 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F54: .word 0x00000D9E + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F58: .word 0x000063FD
_02313F5C: .word 0x00000DD1 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
_02313F60: .word 0x00000DD3 + APPLY_OFFENSIVE_STAT_MULTIPLIER_OFFSET
	arm_func_end ApplyOffensiveStatMultiplier

	arm_func_start ApplyDefensiveStatMultiplier
ApplyDefensiveStatMultiplier: ; 0x02313F64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	mov r7, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r0, r8
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023140C0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02313FB8
	ldr r1, _023140CC ; =0x00000DC9
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
	b _02313FD0
_02313FB8:
	ldr r1, _023140D0 ; =0x00000DC8
	mov r0, r4
	bl CopyStringFromId
	mov r1, r4
	mov r0, #1
	bl SetMessageLogPreprocessorArgsString
_02313FD0:
	cmp r7, #0x100
	bge _02313FF0
	ldrb r2, [sp, #0x30]
	mov r0, sb
	mov r1, r8
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _023140C0
_02313FF0:
	mov r0, #0
	mov r1, r8
	mov r2, r0
	ldr r5, [r8, #0xb4]
	bl SubstitutePlaceholderStringTags
	ldr r6, [sp, #0x28]
	cmp r7, #0x100
	add r0, r5, r6, lsl #2
	ldr r4, [r0, #0x3c]
	add r1, sp, #0x28
	mov r0, r8
	bge _0231402C
	ldr r1, [r1]
	bl ov29_022E51B0
	b _02314034
_0231402C:
	ldr r1, [r1]
	bl ov29_022E510C
_02314034:
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x3c]
	mov r1, r7
	bl MultiplyByFixedPoint
	add r1, r5, r6, lsl #2
	str r0, [r1, #0x3c]
	cmp r0, #2
	movlt r0, #2
	strlt r0, [r1, #0x3c]
	add r2, r5, r6, lsl #2
	ldr r1, [r2, #0x3c]
	ldr r0, _023140D4 ; =0x000063FD
	cmp r1, r0
	strgt r0, [r2, #0x3c]
	add r0, r5, r6, lsl #2
	ldr r0, [r0, #0x3c]
	cmp r4, r0
	ble _02314090
	ldr r2, _023140D8 ; =0x00000DCF
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023140B8
_02314090:
	bge _023140A8
	ldr r2, _023140DC ; =0x00000DCE
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023140B8
_023140A8:
	ldr r2, _023140E0 ; =0x00000DD2
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
_023140B8:
	mov r0, r8
	bl UpdateStatusIconFlags
_023140C0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET -0x2C0
#else
#define APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET 0
#endif
_023140CC: .word 0x00000DC9 + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140D0: .word 0x00000DC8 + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140D4: .word 0x000063FD
_023140D8: .word 0x00000DCF + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140DC: .word 0x00000DCE + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
_023140E0: .word 0x00000DD2 + APPLY_DEFENSIVE_STAT_MULTIPLIER_OFFSET
	arm_func_end ApplyDefensiveStatMultiplier

	arm_func_start BoostHitChanceStat
BoostHitChanceStat: ; 0x023140E4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r7, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r8, r0
	mov r0, r6
	mov r4, #1
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _0231420C
	mov r0, #0
	mov r1, r6
	mov r2, r0
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x20
	ldr r1, [r1]
	mov r0, r6
	bl ov29_022E5258
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0231415C
	ldr r1, _02314218 ; =0x00000DC7
	mov r0, r8
	bl CopyStringFromId
	mov r1, r8
	mov r0, r4
	bl SetMessageLogPreprocessorArgsString
	b _02314174
_0231415C:
	ldr r1, _0231421C ; =0x00000DC6
	mov r0, r8
	bl CopyStringFromId
	mov r1, r8
	mov r0, r4
	bl SetMessageLogPreprocessorArgsString
_02314174:
	mov r0, r6
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	ldr r1, [sp, #0x20]
	cmp r0, #0
	movne r0, r4, lsl #0x11
	add r2, r5, r1, lsl #1
	movne r4, r0, asr #0x10
	ldrsh r0, [r2, #0x2c]
	mov r3, r1, lsl #1
	cmp r0, #0x14
	bge _023141F4
	add r1, r5, #0x2c
	ldrsh r0, [r1, r3]
	add r0, r0, r4
	strh r0, [r1, r3]
	ldrsh r0, [r2, #0x2c]
	cmp r0, #0x14
	movgt r0, #0x14
	strgth r0, [r2, #0x2c]
	cmp r4, #2
	blt _023141E0
	ldr r2, _02314220 ; =0x00000D95
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314204
_023141E0:
	ldr r2, _02314224 ; =0x00000D93
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02314204
_023141F4:
	ldr r2, _02314228 ; =0x00000DD5
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314204:
	mov r0, r6
	bl UpdateStatusIconFlags
_0231420C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define BOOST_HIT_CHANCE_STAT_OFFSET -0x2C0
#else
#define BOOST_HIT_CHANCE_STAT_OFFSET 0
#endif
_02314218: .word 0x00000DC7 + BOOST_HIT_CHANCE_STAT_OFFSET
_0231421C: .word 0x00000DC6 + BOOST_HIT_CHANCE_STAT_OFFSET
_02314220: .word 0x00000D95 + BOOST_HIT_CHANCE_STAT_OFFSET
_02314224: .word 0x00000D93 + BOOST_HIT_CHANCE_STAT_OFFSET
_02314228: .word 0x00000DD5 + BOOST_HIT_CHANCE_STAT_OFFSET
	arm_func_end BoostHitChanceStat

	arm_func_start LowerHitChanceStat
LowerHitChanceStat: ; 0x0231422C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r7, r0
	mov r8, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	mov r0, r6
	mov r4, #1
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023143C4
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02314284
	ldr r1, _023143D0 ; =0x00000DC7
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, r4
	bl SetMessageLogPreprocessorArgsString
	b _0231429C
_02314284:
	ldr r1, _023143D4 ; =0x00000DC6
	mov r0, r5
	bl CopyStringFromId
	mov r1, r5
	mov r0, r4
	bl SetMessageLogPreprocessorArgsString
_0231429C:
	mov r0, r7
	mov r1, r6
	mov r2, r8
	bl IsProtectedFromStatDrops
	cmp r0, #0
	bne _023143C4
	mov r0, r7
	mov r1, r6
	mov r2, #0x1e
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02314308
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02314308
	cmp r8, #0
	beq _023143C4
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _023143D8 ; =0x00000D9F
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023143C4
_02314308:
	mov r0, r6
	mov r1, #0x61
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, r4, lsl #0x11
	movne r4, r0, asr #0x10
	mov r0, #0
	mov r1, r6
	mov r2, r0
	ldr r5, [r6, #0xb4]
	bl SubstitutePlaceholderStringTags
	add r1, sp, #0x20
	ldr r1, [r1]
	mov r0, r6
	bl ov29_022E52F8
	ldr r1, [sp, #0x20]
	add r2, r5, r1, lsl #1
	ldrsh r0, [r2, #0x2c]
	mov r3, r1, lsl #1
	cmp r0, #0
	ble _023143AC
	add r1, r5, #0x2c
	ldrsh r0, [r1, r3]
	sub r0, r0, r4
	strh r0, [r1, r3]
	ldrsh r0, [r2, #0x2c]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r2, #0x2c]
	cmp r4, #2
	blt _02314398
	ldr r2, _023143DC ; =0x00000D94
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023143BC
_02314398:
	ldr r2, _023143E0 ; =0x00000D92
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	b _023143BC
_023143AC:
	ldr r2, _023143E4 ; =0x00000DD4
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_023143BC:
	mov r0, r6
	bl UpdateStatusIconFlags
_023143C4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
#ifdef JAPAN
#define LOWER_HIT_CHANCE_STAT_OFFSET -0x2C0
#else
#define LOWER_HIT_CHANCE_STAT_OFFSET 0
#endif
_023143D0: .word 0x00000DC7 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143D4: .word 0x00000DC6 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143D8: .word 0x00000D9F + LOWER_HIT_CHANCE_STAT_OFFSET
_023143DC: .word 0x00000D94 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143E0: .word 0x00000D92 + LOWER_HIT_CHANCE_STAT_OFFSET
_023143E4: .word 0x00000DD4 + LOWER_HIT_CHANCE_STAT_OFFSET
	arm_func_end LowerHitChanceStat

	arm_func_start TryInflictCringeStatus
TryInflictCringeStatus: ; 0x023143E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl AllocateTemp1024ByteBufferFromPool
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r6
	mov r2, #0x1f
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _02314498
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r5, #0
	beq _02314490
	ldr r2, _02314534 ; =0x00000DA2
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314490:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02314498:
	cmp r4, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	ldr r4, [r6, #0xb4]
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r4, #0xd0]
	cmp r0, #1
	beq _02314514
	ldr r1, _02314538 ; =ov10_022C4884
	mov r2, #1
	mov r0, r6
	strb r2, [r4, #0xd0]
	bl CalcStatusDuration
	add r1, r0, #1
	mov r0, r6
	strb r1, [r4, #0xd1]
	bl PlayExclamationPointEffect__022E5D4C
	ldr r2, _0231453C ; =0x00000D02
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r7
	mov r1, r6
	bl TryActivateSteadfast
	mov r0, r7
	mov r1, r6
	bl TryActivateQuickFeet
	b _02314524
_02314514:
	ldr r2, _02314540 ; =0x00000D03
	mov r0, r7
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUserTarget
_02314524:
	mov r0, r6
	bl UpdateStatusIconFlags
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_INFLICT_CRINGE_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_CRINGE_STATUS_OFFSET 0
#endif
_02314534: .word 0x00000DA2 + TRY_INFLICT_CRINGE_STATUS_OFFSET
_02314538: .word ov10_022C4884
_0231453C: .word 0x00000D02 + TRY_INFLICT_CRINGE_STATUS_OFFSET
_02314540: .word 0x00000D03 + TRY_INFLICT_CRINGE_STATUS_OFFSET
	arm_func_end TryInflictCringeStatus

	arm_func_start TryInflictParalysisStatus
TryInflictParalysisStatus: ; 0x02314544
#ifdef JAPAN
#define TRY_INFLICT_PARALYSIS_STATUS_OFFSET -0x2C0
#else
#define TRY_INFLICT_PARALYSIS_STATUS_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r8, r2
	mov r4, r3
	bl EntityIsValid__023118B4
	cmp r0, #0
	moveq r0, #0
	beq _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl SafeguardIsActive
	cmp r0, #0
	movne r0, #0
	bne _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, r8
	bl IsProtectedFromNegativeStatus
	cmp r0, #0
	movne r0, #0
	bne _023147D0
	mov r0, sl
	mov r1, sb
	mov r2, #0x16
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02311B94
	cmp r0, #0
	beq _023145F4
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	cmp r8, #0
	beq _023145EC
	mov r0, sl
	mov r1, sb
	mov r2, #0xda0 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	bl LogMessageByIdWithPopupCheckUserTarget
_023145EC:
	mov r0, #0
	b _023147D0
_023145F4:
	mov r0, sb
	mov r1, #1
	bl ExclusiveItemEffectIsActive__023147EC
	cmp r0, #0
	beq _02314654
	cmp r8, #0
	beq _0231464C
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	add r2, sp, #4
	mov r0, sb
	mov r1, #1
	bl GetExclusiveItemWithEffectFromBag
	add r1, sp, #4
	mov r0, #1
	bl PrepareItemForPrinting__02345728
	ldr r2, _023147D8 ; =0x00000DA1
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_0231464C:
	mov r0, #0
	b _023147D0
_02314654:
	cmp r4, #0
	movne r0, #1
	bne _023147D0
	mov r0, #0
	ldr r7, [sb, #0xb4]
	mov r1, sb
	mov r2, r0
	mov r4, #1
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r7, #0xbf]
	cmp r0, #4
	beq _023146E0
	ldr r1, _023147DC ; =ov10_022C4894
	mov r3, #4
	mov r0, sb
	mov r2, r4
	strb r3, [r7, #0xbf]
	bl CalcStatusDuration
	add r0, r0, #1
	strb r0, [r7, #0xc0]
	mov r4, #0
	strb r4, [r7, #0xc1]
	mov r0, sl
	mov r1, sb
	mov r2, #0xd00 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	strb r4, [r7, #0xc2]
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sb
	bl ov29_022E4240
	mov r0, sb
	bl CalcSpeedStageWrapper
	mov r0, sl
	mov r1, sb
	bl TryActivateQuickFeet
	b _023146F0
_023146E0:
	ldr r2, _023147E0 ; =0x00000D01
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_023146F0:
	mov r0, sb
	mov r1, #0x19
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023147C4
	cmp r4, #0
	bne _023147C4
	mov r5, #0
	ldr fp, _023147E4 ; =DIRECTIONS_XY
	mov r4, r5
_02314718:
	mov r1, r4, lsl #2
	add r0, fp, r4, lsl #2
	ldrsh r6, [sb, #4]
	ldrsh r3, [fp, r1]
	ldrsh r1, [r0, #2]
	ldrsh r2, [sb, #6]
	add r0, r6, r3
	add r1, r2, r1
	bl GetTile
	ldr r6, [r0, #0xc]
	mov r0, r6
	bl EntityIsValid__023118B4
	cmp r0, #0
	beq _023147B8
	ldr r0, [r6]
	cmp r0, #1
	bne _023147B8
	cmp r5, #0
	bne _02314790
	mov r5, #1
	bl GetMessageLogPreprocessorArgs
	mov r1, #0
	mov r2, r7
	mov r3, r1
	str r1, [sp]
	bl SetPreprocessorArgsStringToName
	ldr r2, _023147E8 ; =0x00000DC5
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
_02314790:
	mov r0, sb
	mov r1, r6
	bl GetTreatmentBetweenMonstersIgnoreStatus
	cmp r0, #1
	bne _023147B8
	mov r0, sl
	mov r1, r6
	mov r2, r8
	mov r3, #0
	bl TryInflictParalysisStatus
_023147B8:
	add r4, r4, #1
	cmp r4, #8
	blt _02314718
_023147C4:
	mov r0, sb
	bl UpdateStatusIconFlags
	mov r0, #1
_023147D0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023147D8: .word 0x00000DA1 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
_023147DC: .word ov10_022C4894
_023147E0: .word 0x00000D01 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
_023147E4: .word DIRECTIONS_XY
_023147E8: .word 0x00000DC5 + TRY_INFLICT_PARALYSIS_STATUS_OFFSET
	arm_func_end TryInflictParalysisStatus
