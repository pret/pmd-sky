	.include "asm/macros.inc"
	.include "main_02050300.inc"

	.text

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
