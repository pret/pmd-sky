	.include "asm/macros.inc"
	.include "main_0204FE58.inc"

	.text

	arm_func_start SetPokemonBattled
SetPokemonBattled: ; 0x0204FE58
	stmdb sp!, {r3, lr}
	bl GetDexNumberVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _0204FEB0 ; =ADVENTURE_LOG_PTR
	mov r1, r0, asr #4
	ldr lr, [r3]
	add r1, r0, r1, lsr #27
	ldr ip, [lr]
	mov r2, r0, lsr #0x1f
	orr ip, ip, #2
	str ip, [lr]
	ldr r3, [r3]
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0xd8
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204FEB0: .word ADVENTURE_LOG_PTR
	arm_func_end SetPokemonBattled

	arm_func_start GetNbPokemonBattled
GetNbPokemonBattled: ; 0x0204FEB4
	ldr r0, _0204FEC4 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0204FEC4: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbPokemonBattled

	arm_func_start IncrementNbBigTreasureWins
IncrementNbBigTreasureWins: ; 0x0204FEC8
	ldr r0, _0204FEE0 ; =ADVENTURE_LOG_PTR
	ldr ip, _0204FEE4 ; =SetNbBigTreasureWins
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	add r0, r0, #1
	bx ip
	.align 2, 0
_0204FEE0: .word ADVENTURE_LOG_PTR
_0204FEE4: .word SetNbBigTreasureWins
	arm_func_end IncrementNbBigTreasureWins

	arm_func_start SetNbBigTreasureWins
SetNbBigTreasureWins: ; 0x0204FEE8
	ldr r2, _0204FF18 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FF1C ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x400
	ldr r1, _0204FF18 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0204FF18: .word ADVENTURE_LOG_PTR
_0204FF1C: .word 0x000F423F
	arm_func_end SetNbBigTreasureWins

	arm_func_start GetNbBigTreasureWins
GetNbBigTreasureWins: ; 0x0204FF20
	ldr r0, _0204FF30 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bx lr
	.align 2, 0
_0204FF30: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbBigTreasureWins

	arm_func_start SetNbRecycled
SetNbRecycled: ; 0x0204FF34
	ldr r2, _0204FF64 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FF68 ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x800
	ldr r1, _0204FF64 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0204FF64: .word ADVENTURE_LOG_PTR
_0204FF68: .word 0x000F423F
	arm_func_end SetNbRecycled

	arm_func_start GetNbRecycled
GetNbRecycled: ; 0x0204FF6C
	ldr r0, _0204FF7C ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	bx lr
	.align 2, 0
_0204FF7C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbRecycled

	arm_func_start IncrementNbSkyGiftsSent
IncrementNbSkyGiftsSent: ; 0x0204FF80
	ldr r0, _0204FF98 ; =ADVENTURE_LOG_PTR
	ldr ip, _0204FF9C ; =SetNbSkyGiftsSent
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	add r0, r0, #1
	bx ip
	.align 2, 0
_0204FF98: .word ADVENTURE_LOG_PTR
_0204FF9C: .word SetNbSkyGiftsSent
	arm_func_end IncrementNbSkyGiftsSent

	arm_func_start SetNbSkyGiftsSent
SetNbSkyGiftsSent: ; 0x0204FFA0
	ldr r2, _0204FFD0 ; =ADVENTURE_LOG_PTR
	ldr r1, _0204FFD4 ; =0x000F423F
	ldr r3, [r2]
	cmp r0, r1
	ldr r2, [r3]
	movgt r0, r1
	orr r2, r2, #0x1000
	ldr r1, _0204FFD0 ; =ADVENTURE_LOG_PTR
	str r2, [r3]
	ldr r1, [r1]
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0
_0204FFD0: .word ADVENTURE_LOG_PTR
_0204FFD4: .word 0x000F423F
	arm_func_end SetNbSkyGiftsSent

	arm_func_start GetNbSkyGiftsSent
GetNbSkyGiftsSent: ; 0x0204FFD8
	ldr r0, _0204FFE8 ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	bx lr
	.align 2, 0
_0204FFE8: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbSkyGiftsSent

	arm_func_start ComputeSpecialCounters
ComputeSpecialCounters: ; 0x0204FFEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r8, r4
_0204FFF8:
	mov r0, #0x44
	mul sl, r8, r0
	ldr r0, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0, sl]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205009C
	mov sb, #0
	mov r7, #1
	ldr r3, _02050230 ; =ADVENTURE_LOG_PTR
	ldr ip, _0205022C ; =TEAM_MEMBER_TABLE_PTR
	mov fp, sb
	mov lr, r7
	mov r2, #6
_0205003C:
	mul r1, sb, r2
	ldr r0, [ip]
	add r0, r0, sl
	add r5, r0, #0x22
	ldrb r0, [r5, r1]
	add r1, r5, r1
	tst r0, #1
	movne r0, r7
	moveq r0, fp
	tst r0, #0xff
	beq _02050090
	ldrh r0, [r1, #2]
	ldr r5, [r3]
	mov r1, r0, lsr #5
	add r6, r5, r1, lsl #2
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	ldr r5, [r6, #0x16c]
	add r0, r1, r0, ror #27
	orr r0, r5, lr, lsl r0
	str r0, [r6, #0x16c]
_02050090:
	add sb, sb, #1
	cmp sb, #4
	blt _0205003C
_0205009C:
	ldr r0, _02050234 ; =0x0000022B
	add r8, r8, #1
	cmp r8, r0
	blt _0204FFF8
	mov r6, #0
	add r5, r0, #0x258
_020500B4:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDexNumberVeneer
	add r6, r6, #1
	cmp r6, r5
	blt _020500B4
	mov r7, #0
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sb, _02050238 ; =0x0000021F
	mov r8, r7
	mov r6, #1
_020500E0:
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	bl IsRealMove
	cmp r0, #0
	beq _02050120
	mov r0, r8, asr #4
	add r0, r8, r0, lsr #27
	ldr r2, [r5]
	mov r0, r0, asr #5
	add r2, r2, r0, lsl #2
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #27
	ldr r2, [r2, #0x16c]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	addne r7, r7, #1
_02050120:
	add r8, r8, #1
	cmp r8, sb
	blt _020500E0
	cmp r7, #0
	ble _02050150
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	str r7, [r1, #0x34]
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #4
	str r0, [r1]
_02050150:
	mov sb, #1
	ldr r5, _02050230 ; =ADVENTURE_LOG_PTR
	ldr sl, _0205023C ; =0x00000483
	mov r8, #0
	mov r6, sb
_02050164:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetBaseFormCastformCherrimDeoxys
	mov r7, r0
	bl GetDexNumberVeneer
	cmp r0, #0
	beq _020501B4
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	ldr r3, [r5]
	mov r2, r1, asr #5
	mov r1, r0, lsr #0x1f
	add r2, r3, r2, lsl #2
	rsb r0, r1, r0, lsl #27
	ldr r2, [r2, #0x44]
	add r0, r1, r0, ror #27
	tst r2, r6, lsl r0
	beq _020501B4
	mov r0, r7
	bl RecruitSpecialPokemonLog
_020501B4:
	add sb, sb, #1
	cmp sb, sl
	blt _02050164
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	mov r2, #1
	ldr r1, [r0]
	ldr r3, _02050240 ; =0x000001ED
	mov r0, r2
_020501D4:
	mov r5, r2, asr #4
	add r5, r2, r5, lsr #27
	mov sb, r5, asr #5
	mov r6, r2, lsr #0x1f
	rsb r5, r6, r2, lsl #27
	add r7, r1, sb, lsl #2
	add r6, r6, r5, ror #27
	add r5, r1, sb, lsl #2
	ldr r7, [r7, #0x44]
	ldr r5, [r5, #0xd8]
	tst r7, r0, lsl r6
	addne r8, r8, #1
	tst r5, r0, lsl r6
	add r2, r2, #1
	addne r4, r4, #1
	cmp r2, r3
	blt _020501D4
	ldr r0, _02050230 ; =ADVENTURE_LOG_PTR
	str r8, [r1, #0x2c]
	ldr r0, [r0]
	str r4, [r0, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205022C: .word TEAM_MEMBER_TABLE_PTR
_02050230: .word ADVENTURE_LOG_PTR
_02050234: .word 0x0000022B
_02050238: .word 0x0000021F
_0205023C: .word 0x00000483
_02050240: .word 0x000001ED
	arm_func_end ComputeSpecialCounters

	arm_func_start RecruitSpecialPokemonLog
RecruitSpecialPokemonLog: ; 0x02050244
	stmdb sp!, {r3, lr}
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	ldr r2, _020502AC ; =ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	mov r3, #0
	movge r0, r0, asr #0x10
_02050260:
	mov r1, r3, lsl #1
	ldrsh r1, [r2, r1]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r1, #0xc9
	bne _0205028C
	cmp r0, #0xc9
	blt _02050294
	cmp r0, #0xe4
	ble _0205029C
	b _02050294
_0205028C:
	cmp r1, r0
	beq _0205029C
_02050294:
	add r3, r3, #1
	b _02050260
_0205029C:
	add r0, r3, #0x24
	and r0, r0, #0xff
	bl SetAdventureLogCompleted
	ldmia sp!, {r3, pc}
	.align 2, 0
_020502AC: .word ADVENTURE_LOG_ENCOUNTERS_MONSTER_IDS
	arm_func_end RecruitSpecialPokemonLog

	arm_func_start IncrementNbFainted
IncrementNbFainted: ; 0x020502B0
	ldr r1, _020502E4 ; =ADVENTURE_LOG_PTR
	ldr r0, _020502E8 ; =0x000F423F
	ldr r2, [r1]
	ldr r1, [r2, #0x24]
	cmp r1, r0
	addlt r0, r1, #1
	strlt r0, [r2, #0x24]
	ldr r0, _020502E4 ; =ADVENTURE_LOG_PTR
	ldr r1, [r0]
	ldr r0, [r1]
	orr r0, r0, #0x20
	str r0, [r1]
	bx lr
	.align 2, 0
_020502E4: .word ADVENTURE_LOG_PTR
_020502E8: .word 0x000F423F
	arm_func_end IncrementNbFainted

	arm_func_start GetNbFainted
GetNbFainted: ; 0x020502EC
	ldr r0, _020502FC ; =ADVENTURE_LOG_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bx lr
	.align 2, 0
_020502FC: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbFainted

	arm_func_start SetItemAcquired
SetItemAcquired: ; 0x02050300
	stmdb sp!, {r4, r5, r6, lr}
	ldrsh r0, [r0, #4]
	bl NormalizeTreasureBox
	mov r4, r0
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsItemValidVeneer
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0x3b
	blt _02050380
	cmp r4, #0x41
	bgt _02050380
	sub r0, r4, #0x21
	and r0, r0, #0xff
	mov r5, #1
	bl SetAdventureLogCompleted
	mov r6, #0x1a
	b _02050364
_0205034C:
	and r0, r6, #0xff
	bl GetAdventureLogCompleted
	cmp r0, #0
	moveq r5, #0
	beq _0205036C
	add r6, r6, #1
_02050364:
	cmp r6, #0x20
	ble _0205034C
_0205036C:
	cmp r5, #0
	beq _02050380
	mov r0, #0x15
	mov r1, #1
	bl SetResolvedPerformanceProgressFlag
_02050380:
	ldr r3, _020503C8 ; =ADVENTURE_LOG_PTR
	mov r0, r4, asr #4
	ldr ip, [r3]
	add r0, r4, r0, lsr #27
	mov r2, r4, lsr #0x1f
	rsb r1, r2, r4, lsl #27
	add lr, ip, #0x1b0
	mov ip, r0, asr #5
	ldr r4, [lr, ip, lsl #2]
	add r0, r2, r1, ror #27
	mov r1, #1
	orr r0, r4, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldr r1, [r3]
	ldr r0, [r1]
	orr r0, r0, #8
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020503C8: .word ADVENTURE_LOG_PTR
	arm_func_end SetItemAcquired

	arm_func_start GetNbItemAcquired
GetNbItemAcquired: ; 0x020503CC
	stmdb sp!, {r4, lr}
	ldr r1, _0205041C ; =ADVENTURE_LOG_PTR
	mov r0, #0
	ldr r4, [r1]
	mov lr, r0
	mov ip, #1
_020503E4:
	mov r1, lr, asr #4
	add r1, lr, r1, lsr #27
	mov r1, r1, asr #5
	add r3, r4, r1, lsl #2
	mov r2, lr, lsr #0x1f
	rsb r1, r2, lr, lsl #27
	ldr r3, [r3, #0x1b0]
	add r1, r2, r1, ror #27
	tst r3, ip, lsl r1
	add lr, lr, #1
	addne r0, r0, #1
	cmp lr, #0x580
	blt _020503E4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205041C: .word ADVENTURE_LOG_PTR
	arm_func_end GetNbItemAcquired

	arm_func_start SetChallengeLetterCleared
SetChallengeLetterCleared: ; 0x02050420
	stmdb sp!, {r4, lr}
	ldr r3, _020504A0 ; =ADVENTURE_LOG_PTR
	mov r2, r0, lsr #0x1f
	ldr ip, [r3]
	rsb r1, r2, r0, lsl #27
	mov lr, r0, lsr #5
	add r4, ip, #0x260
	ldr ip, [r4, lr, lsl #2]
	add r1, r2, r1, ror #27
	mov r0, #1
	orr r1, ip, r0, lsl r1
	str r1, [r4, lr, lsl #2]
	ldr r4, [r3]
	mov ip, r0
	b _02050488
_0205045C:
	mov r1, r0, asr #4
	add r1, r0, r1, lsr #27
	mov r1, r1, asr #5
	add r3, r4, r1, lsl #2
	mov r2, r0, lsr #0x1f
	rsb r1, r2, r0, lsl #27
	ldr r3, [r3, #0x260]
	add r1, r2, r1, ror #27
	tst r3, ip, lsl r1
	ldmeqia sp!, {r4, pc}
	add r0, r0, #1
_02050488:
	cmp r0, #6
	blt _0205045C
	ldr r0, [r4, #4]
	orr r0, r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020504A0: .word ADVENTURE_LOG_PTR
	arm_func_end SetChallengeLetterCleared

	arm_func_start GetSentryDutyGamePoints
GetSentryDutyGamePoints: ; 0x020504A4
	ldr r1, _020504B8 ; =ADVENTURE_LOG_PTR
	ldr r1, [r1]
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0x264]
	bx lr
	.align 2, 0
_020504B8: .word ADVENTURE_LOG_PTR
	arm_func_end GetSentryDutyGamePoints

	arm_func_start SetSentryDutyGamePoints
SetSentryDutyGamePoints: ; 0x020504BC
	stmdb sp!, {r3, lr}
	ldr r1, _02050548 ; =ADVENTURE_LOG_PTR
	mov lr, #0
	ldr r2, [r1]
	b _020504EC
_020504D0:
	add r1, r2, lr, lsl #2
	ldr r1, [r1, #0x264]
	cmp r0, r1
	bhi _020504F4
	add r1, lr, #1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
_020504EC:
	cmp lr, #5
	blt _020504D0
_020504F4:
	cmp lr, #5
	mvnge r0, #0
	ldmgeia sp!, {r3, pc}
	mov ip, #4
	ldr r2, _02050548 ; =ADVENTURE_LOG_PTR
	b _02050528
_0205050C:
	ldr r3, [r2]
	sub r1, ip, #1
	add ip, r3, ip, lsl #2
	ldr r3, [ip, #0x260]
	mov r1, r1, lsl #0x10
	str r3, [ip, #0x264]
	mov ip, r1, asr #0x10
_02050528:
	cmp ip, lr
	bgt _0205050C
	ldr r1, _02050548 ; =ADVENTURE_LOG_PTR
	ldr r1, [r1]
	add r1, r1, lr, lsl #2
	str r0, [r1, #0x264]
	mov r0, lr
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050548: .word ADVENTURE_LOG_PTR
	arm_func_end SetSentryDutyGamePoints

	arm_func_start CopyLogTo
CopyLogTo: ; 0x0205054C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ComputeSpecialCounters
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x10
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x14
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x18
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x80
	ldr r1, [r1]
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x30
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #9
	ldr r1, [r1]
	add r1, r1, #0x34
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x28
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x24
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x1c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x38
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x3c
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x40
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0x44
	bl CopyBitsTo
	mov r0, r4
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0xd8
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x220
	add r1, r1, #0x16c
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x580
	add r1, r1, #0x1b0
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x260
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xa0
	add r1, r1, #0x264
	bl CopyBitsTo
	ldr r1, _02050734 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x278
	bl Copy16BitsTo
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050734: .word ADVENTURE_LOG_PTR
	arm_func_end CopyLogTo

	arm_func_start CopyLogFrom
CopyLogFrom: ; 0x02050738
	stmdb sp!, {r4, lr}
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	mov r4, r0
	add r1, r1, #0x10
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x14
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r1, #0x18
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x80
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xe
	add r1, r1, #0x2c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0xe
	ldr r1, [r1]
	add r1, r1, #0x30
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #9
	ldr r1, [r1]
	add r1, r1, #0x34
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x28
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x24
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x1c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x38
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x3c
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x14
	ldr r1, [r1]
	add r1, r1, #0x40
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0x44
	bl CopyBitsFrom
	mov r0, r4
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r2, #0x4a0
	ldr r1, [r1]
	add r1, r1, #0xd8
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x220
	add r1, r1, #0x16c
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x580
	add r1, r1, #0x1b0
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0x20
	add r1, r1, #0x260
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	mov r2, #0xa0
	add r1, r1, #0x264
	bl CopyBitsFrom
	ldr r1, _02050918 ; =ADVENTURE_LOG_PTR
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x278
	bl Copy16BitsFrom
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050918: .word ADVENTURE_LOG_PTR
	arm_func_end CopyLogFrom

	arm_func_start GetAbilityString
GetAbilityString: ; 0x0205091C
#if defined(EUROPE)
	add r1, r1, #0x5e0
	add r1, r1, #0x3000
#elif defined(JAPAN)
	add r1, r1, #0x81
	add r1, r1, #0x4800
#else
	add r1, r1, #0xde
	add r1, r1, #0x3500
#endif
	mov r1, r1, lsl #0x10
	ldr ip, _02050938 ; =CopyNStringFromId
	mov r1, r1, lsr #0x10
	mov r2, #0x50
	bx ip
	.align 2, 0
_02050938: .word CopyNStringFromId
	arm_func_end GetAbilityString

	arm_func_start GetAbilityDescStringId
GetAbilityDescStringId: ; 0x0205093C
#if defined(EUROPE)
	add r0, r0, #0x25c
	add r0, r0, #0x3400
#elif defined(JAPAN)
	add r0, r0, #0xfd
	add r0, r0, #0x4800
#else
	add r0, r0, #0x5a
	add r0, r0, #0x3600
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetAbilityDescStringId

	arm_func_start GetTypeStringId
GetTypeStringId: ; 0x02050950
#if defined(EUROPE)
	add r0, r0, #0xcd
	add r0, r0, #0x3500
#elif defined(JAPAN)
	add r0, r0, #0x6e
	add r0, r0, #0x4800
#else
	add r0, r0, #0xcb
	add r0, r0, #0x3500
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetTypeStringId

	arm_func_start GetConversion2ConvertToType
GetConversion2ConvertToType: ; 0x02050964
	ldr r1, _02050970 ; =_020A192C
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02050970: .word _020A192C
	arm_func_end GetConversion2ConvertToType

	arm_func_start sub_02050974
sub_02050974: ; 0x02050974
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r1, r1, r2
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_02050974

	arm_func_start sub_02050990
sub_02050990: ; 0x02050990
	str r1, [r0]
	mov r3, #0
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	add r3, r1, r2
	str r3, [r0, #4]
	mov r0, r1
	ldr ip, _020509B8 ; =MemZero
	mov r1, r2
	bx ip
	.align 2, 0
_020509B8: .word MemZero
	arm_func_end sub_02050990

	arm_func_start sub_020509BC
sub_020509BC: ; 0x020509BC
	bx lr
	arm_func_end sub_020509BC

	arm_func_start CopyBitsTo
CopyBitsTo: ; 0x020509C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0
	mov r3, #1
	mov r5, ip
	mov r4, ip
	b _02050A34
_020509D8:
	ldrb r6, [r1]
	sub r2, r2, #1
	tst r6, r3, lsl ip
	ldrne r7, [r0]
	ldrne lr, [r0, #8]
	ldrneb r6, [r7]
	add ip, ip, #1
	orrne r6, r6, r3, lsl lr
	strneb r6, [r7]
	ldr lr, [r0, #8]
	cmp ip, #8
	add lr, lr, #1
	moveq ip, r5
	addeq r1, r1, #1
	str lr, [r0, #8]
	cmp lr, #8
	ldreq lr, [r0]
	addeq lr, lr, #1
	streq lr, [r0]
	streq r4, [r0, #8]
	ldr lr, [r0, #0xc]
	add lr, lr, #1
	str lr, [r0, #0xc]
_02050A34:
	cmp r2, #0
	bne _020509D8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyBitsTo

	arm_func_start CopyBitsFrom
CopyBitsFrom: ; 0x02050A40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov lr, #0
	mov ip, lr
	mov r3, #1
	mov r6, lr
	mov r5, lr
	b _02050AC0
_02050A5C:
	cmp lr, #0
	streqb ip, [r1]
	ldr r7, [r0]
	ldr r4, [r0, #8]
	ldrb r7, [r7]
	sub r2, r2, #1
	tst r7, r3, lsl r4
	ldrneb r4, [r1]
	orrne r4, r4, r3, lsl lr
	strneb r4, [r1]
	ldr r4, [r0, #8]
	add lr, lr, #1
	cmp lr, #8
	add r4, r4, #1
	moveq lr, r6
	addeq r1, r1, #1
	str r4, [r0, #8]
	cmp r4, #8
	ldreq r4, [r0]
	addeq r4, r4, #1
	streq r4, [r0]
	streq r5, [r0, #8]
	ldr r4, [r0, #0xc]
	add r4, r4, #1
	str r4, [r0, #0xc]
_02050AC0:
	cmp r2, #0
	bne _02050A5C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyBitsFrom

	arm_func_start StoreDefaultTeamData
StoreDefaultTeamData: ; 0x02050ACC
	stmdb sp!, {lr}
	sub sp, sp, #0x14
#ifdef JAPAN
	ldr r1, _02050E54 ; =0x000004C5
	add r0, sp, #0
#else
	add r0, sp, #0
	mov r1, #0x234
#endif
	bl GetStringFromFileVeneer
	ldr r0, _02050B08 ; =TEAM_NAME
	add r1, sp, #0
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpyName
	ldr r0, _02050B0C ; =TEAM_NAME
	mov r1, #0
#ifdef JAPAN
	str r1, [r0, #8]
	strb r1, [r0, #0xc]
#else
	str r1, [r0, #0xc]
	strb r1, [r0, #0x10]
#endif
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
#ifdef JAPAN
_02050E54: .word 0x000004C5
#endif
_02050B08: .word TEAM_NAME
_02050B0C: .word TEAM_NAME
	arm_func_end StoreDefaultTeamData

	arm_func_start GetMainTeamNameWithCheck
GetMainTeamNameWithCheck: ; 0x02050B10
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	mov r4, r0
	mov r0, #1
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	ldrne r0, _02050B70 ; =TEAM_NAME
	ldrneb r0, [r0]
	cmpne r0, #0
	beq _02050B4C
	ldr r1, _02050B74 ; =TEAM_NAME
	mov r0, r4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPad
	b _02050B68
_02050B4C:
	ldr r1, _02050B78 ; =0x00000237
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r1, sp, #0
	mov r0, r4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpyName
_02050B68:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050B70: .word TEAM_NAME
_02050B74: .word TEAM_NAME
#ifdef JAPAN
_02050B78: .word 0x000004C8
#else
_02050B78: .word 0x00000237
#endif
	arm_func_end GetMainTeamNameWithCheck

	arm_func_start GetMainTeamName
GetMainTeamName: ; 0x02050B7C
	ldr ip, _02050B8C ; =StrncpySimpleNoPadSafe
	ldr r1, _02050B90 ; =TEAM_NAME
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bx ip
	.align 2, 0
_02050B8C: .word StrncpySimpleNoPadSafe
_02050B90: .word TEAM_NAME
	arm_func_end GetMainTeamName

	arm_func_start SetMainTeamName
SetMainTeamName: ; 0x02050B94
	ldr r1, _02050BB4 ; =TEAM_NAME
	mov r3, #0
_02050B9C:
	ldrb r2, [r0], #1
	strb r2, [r1, r3]
	add r3, r3, #1
#ifdef JAPAN
	cmp r3, #5
#else
	cmp r3, #0xa
#endif
	blt _02050B9C
	bx lr
	.align 2, 0
_02050BB4: .word TEAM_NAME
	arm_func_end SetMainTeamName

	arm_func_start GetRankupPoints
GetRankupPoints: ; 0x02050BB8
	stmdb sp!, {r4, lr}
	bl GetRank
	mov r4, r0
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02050BE4
	cmp r4, #0xc
	bne _02050BF0
	mov r0, #0
	ldmia sp!, {r4, pc}
_02050BE4:
	cmp r4, #8
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
_02050BF0:
	mov r0, r4
	bl GetRankUpEntry
	ldr r1, _02050C0C ; =TEAM_NAME
	ldr r2, [r0, #4]
#ifdef JAPAN
	ldr r0, [r1, #8]
#else
	ldr r0, [r1, #0xc]
#endif
	sub r0, r2, r0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02050C0C: .word TEAM_NAME
	arm_func_end GetRankupPoints

	arm_func_start sub_02050C10
sub_02050C10: ; 0x02050C10
#ifdef JAPAN
#define SUB_02050C10_OFFSET #8
#else
#define SUB_02050C10_OFFSET #0xc
#endif
	stmdb sp!, {r3, lr}
	ldr r1, _02050C6C ; =TEAM_NAME
	ldr r2, [r1, SUB_02050C10_OFFSET]
	add r2, r2, r0
	mov r0, #0x16
	str r2, [r1, SUB_02050C10_OFFSET]
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02050C4C
	ldr r0, _02050C6C ; =TEAM_NAME
	ldr r1, _02050C70 ; =0x05F5E0FF
	ldr r2, [r0, SUB_02050C10_OFFSET]
	cmp r2, r1
	strgt r1, [r0, SUB_02050C10_OFFSET]
	ldmia sp!, {r3, pc}
_02050C4C:
	mov r0, #7
	bl GetRankUpEntry
	ldr r1, _02050C6C ; =TEAM_NAME
	ldr r2, [r0, #4]
	ldr r0, [r1, SUB_02050C10_OFFSET]
	cmp r0, r2
	strgt r2, [r1, SUB_02050C10_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050C6C: .word TEAM_NAME
_02050C70: .word 0x05F5E0FF
	arm_func_end sub_02050C10

	arm_func_start GetRank
GetRank: ; 0x02050C74
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _02050CCC ; =TEAM_NAME
	b _02050CA4
_02050C84:
	mov r0, r5
	bl GetRankUpEntry
#ifdef JAPAN
	ldr r1, [r4, #8]
#else
	ldr r1, [r4, #0xc]
#endif
	ldr r0, [r0, #4]
	cmp r1, r0
	blt _02050CAC
	add r0, r5, #1
	and r5, r0, #0xff
_02050CA4:
	cmp r5, #0xc
	blo _02050C84
_02050CAC:
	mov r0, #0x16
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _02050CC4
	cmp r5, #8
	movhi r5, #8
_02050CC4:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02050CCC: .word TEAM_NAME
	arm_func_end GetRank

	arm_func_start sub_02050CD0
sub_02050CD0: ; 0x02050CD0
	stmdb sp!, {r3, lr}
	bl GetRank
	cmp r0, #8
	movhi r0, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_02050CD0

	arm_func_start GetRankStorageSize
GetRankStorageSize: ; 0x02050CE4
	stmdb sp!, {r3, lr}
	bl GetRank
	bl GetRankUpEntry
	ldr r0, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end GetRankStorageSize

	arm_func_start sub_02050CF8
sub_02050CF8: ; 0x02050CF8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r1, _02050D70 ; =TEAM_NAME
	add r0, sp, #0
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x50
#endif
	bl CopyBitsTo
	ldr r1, _02050D74 ; =_022AB924
	add r0, sp, #0
	mov r2, #0x20
	bl CopyBitsTo
	mov r0, #1
	bl GetResolvedPerformanceProgressFlag
	ldr r1, _02050D78 ; =TEAM_NAME
	tst r0, #0xff
#ifdef JAPAN
	strb r0, [r1, #0xc]
#else
	strb r0, [r1, #0x10]
#endif
	ldrne r1, _02050D7C ; =ARM9_UNKNOWN_DATA__NA_209E6BC
	add r0, sp, #0
	ldreq r1, _02050D80 ; =_0209E6BD
	mov r2, #1
	bl CopyBitsTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02050D70: .word TEAM_NAME
_02050D74: .word _022AB924
_02050D78: .word TEAM_NAME
_02050D7C: .word ARM9_UNKNOWN_DATA__NA_209E6BC
_02050D80: .word _0209E6BD
	arm_func_end sub_02050CF8

	arm_func_start sub_02050D84
sub_02050D84: ; 0x02050D84
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	mov r3, r0
	mov r2, r1
	add r0, sp, #4
	mov r1, r3
	bl sub_02050974
	ldr r1, _02050DFC ; =TEAM_NAME
	add r0, sp, #4
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x50
#endif
	bl CopyBitsFrom
	ldr r1, _02050E00 ; =_022AB924
	add r0, sp, #4
	mov r2, #0x20
	bl CopyBitsFrom
	add r0, sp, #4
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	ldr r1, _02050E04 ; =TEAM_NAME
	tst r0, #1
	movne r2, #1
	moveq r2, #0
	add r0, sp, #4
#ifdef JAPAN
	strb r2, [r1, #0xc]
#else
	strb r2, [r1, #0x10]
#endif
	bl sub_020509BC
	ldr r0, [sp, #0xc]
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_02050DFC: .word TEAM_NAME
_02050E00: .word _022AB924
_02050E04: .word TEAM_NAME
	arm_func_end sub_02050D84

	arm_func_start ResetPlayTimer
ResetPlayTimer: ; 0x02050E08
	mov r1, #0
	strb r1, [r0, #4]
	str r1, [r0]
	bx lr
	arm_func_end ResetPlayTimer

	arm_func_start PlayTimerTick
PlayTimerTick: ; 0x02050E18
	ldrb r1, [r0, #4]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #4]
	cmp r1, #0x3c
	bxlo lr
	mov r1, #0
	strb r1, [r0, #4]
	ldr r2, [r0]
	ldr r1, _02050E50 ; =0x022550FF
	cmp r2, r1
	addlo r1, r2, #1
	strlo r1, [r0]
	bx lr
	.align 2, 0
_02050E50: .word 0x022550FF
	arm_func_end PlayTimerTick

	arm_func_start GetPlayTimeSeconds
GetPlayTimeSeconds: ; 0x02050E54
	ldr r0, [r0]
	bx lr
	arm_func_end GetPlayTimeSeconds

	arm_func_start sub_02050E5C
sub_02050E5C: ; 0x02050E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #4
	mov r2, #6
	bl CopyBitsTo
	mov r0, r4
	mov r1, r5
	mov r2, #0x20
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02050E5C

	arm_func_start sub_02050E8C
sub_02050E8C: ; 0x02050E8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #4
	mov r2, #6
	bl CopyBitsFrom
	mov r0, r4
	mov r1, r5
	mov r2, #0x20
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02050E8C

	arm_func_start sub_02050EBC
sub_02050EBC: ; 0x02050EBC
	stmdb sp!, {r0, r1, r2, r3}
	ldrsh r3, [sp, #2]
	ldrsh r0, [sp, #6]
	ldrsh r2, [sp]
	ldrsh r1, [sp, #4]
	add r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r0, [sp, #2]
	add r1, r2, r1
	strh r1, [sp]
	cmp r0, #0x3e8
	subge r0, r0, #0x3e8
	ldrgesh r1, [sp]
	strgeh r0, [sp, #2]
	addge r0, r1, #1
	strgeh r0, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02050EBC

	arm_func_start SubFixedPoint
SubFixedPoint: ; 0x02050F10
	stmdb sp!, {r0, r1, r2, r3}
	ldrsh r3, [sp, #2]
	ldrsh r0, [sp, #6]
	ldrsh r2, [sp]
	ldrsh r1, [sp, #4]
	sub r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r0, [sp, #2]
	sub r1, r2, r1
	strh r1, [sp]
	cmp r0, #0
	addlt r0, r0, #0x3e8
	ldrltsh r1, [sp]
	strlth r0, [sp, #2]
	sublt r0, r1, #1
	strlth r0, [sp]
	ldrsh r0, [sp]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [sp, #2]
	strlth r0, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #0x10
	bx lr
	arm_func_end SubFixedPoint

	arm_func_start sub_02050F78
sub_02050F78: ; 0x02050F78
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldrsh r1, [sp, #8]
	ldrsh r0, [sp, #0xc]
	cmp r1, r0
	ldrgth r1, [sp, #0xe]
	ldrgth r0, [sp, #0xc]
	orrgt r0, r0, r1, lsl #16
	bgt _02050FE8
	ldrlth r1, [sp, #0xa]
	ldrlth r0, [sp, #8]
	orrlt r0, r0, r1, lsl #16
	blt _02050FE8
	ldrsh r1, [sp, #0xa]
	ldrsh r0, [sp, #0xe]
	cmp r1, r0
	ldrgth r1, [sp, #0xc]
	ldrgth r0, [sp, #0xe]
	strgth r1, [sp]
	strgth r0, [sp, #2]
	ldrleh r1, [sp, #8]
	ldrleh r0, [sp, #0xa]
	strleh r1, [sp]
	strleh r0, [sp, #2]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
_02050FE8:
	add sp, sp, #4
	ldmia sp!, {r3}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02050F78

	arm_func_start sub_02050FF8
sub_02050FF8: ; 0x02050FF8
	stmdb sp!, {r3}
	sub sp, sp, #4
	strh r0, [sp]
	ldrh r0, [sp]
	mov r1, #0
	strh r1, [sp, #2]
	orr r0, r0, r1, lsl #16
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end sub_02050FF8

	arm_func_start BinToDecFixedPoint
BinToDecFixedPoint: ; 0x02051020
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r2, [r0, #4]
	mov r1, #0x3e8
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mul r1, r0, r1
	mov r2, r2, lsr #0x10
	mov r0, r1, lsr #0x10
	strh r2, [sp]
	strh r0, [sp, #2]
	ldrh r1, [sp, #2]
	ldrh r0, [sp]
	orr r0, r0, r1, lsl #16
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end BinToDecFixedPoint
