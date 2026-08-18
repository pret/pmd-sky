	.include "asm/macros.inc"
	.include "main_02050420.inc"

	.text

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
