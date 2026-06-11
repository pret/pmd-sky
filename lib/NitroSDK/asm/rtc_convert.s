	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Rtc_ConvertDateToDay
Rtc_ConvertDateToDay: ; 0x02082F30
	ldr r3, [r0]
	cmp r3, #0x64
	bhs _02082F80
	ldr r2, [r0, #4]
	cmp r2, #1
	blo _02082F80
	cmp r2, #0xc
	bhi _02082F80
	ldr r1, [r0, #8]
	cmp r1, #1
	blo _02082F80
	cmp r1, #0x1f
	bhi _02082F80
	ldr r0, [r0, #0xc]
	cmp r0, #7
	bge _02082F80
	cmp r2, #1
	blo _02082F80
	cmp r2, #0xc
	bls _02082F88
_02082F80:
	mvn r0, #0
	bx lr
_02082F88:
	ldr r0, _02082FBC ; =_020B2E9C
	sub r1, r1, #1
	ldr r0, [r0, r2, lsl #2]
	cmp r2, #3
	add r2, r1, r0
	blo _02082FA8
	tst r3, #3
	addeq r2, r2, #1
_02082FA8:
	ldr r0, _02082FC0 ; =0x0000016D
	add r1, r3, #3
	mla r0, r3, r0, r2
	add r0, r0, r1, lsr #2
	bx lr
	.align 2, 0
_02082FBC: .word _020B2E9C
_02082FC0: .word 0x0000016D
	arm_func_end Rtc_ConvertDateToDay

	arm_func_start Rtci_ConvertTimeToSecond
Rtci_ConvertTimeToSecond: ; 0x02082FC4
	mov r1, #0x3c
	ldmia r0, {r2, r3}
	mla r3, r2, r1, r3
	ldr r0, [r0, #8]
	mla r0, r3, r1, r0
	bx lr
	arm_func_end Rtci_ConvertTimeToSecond

	arm_func_start Rtc_ConvertDateTimeToSecond
Rtc_ConvertDateTimeToSecond: ; 0x02082FDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl Rtc_ConvertDateToDay
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r1, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl Rtci_ConvertTimeToSecond
	mvn r2, #0
	cmp r0, r2
	moveq r1, r2
	beq _02083034
	ldr r1, _0208303C ; =0x00015180
	mov r2, #0
	umull ip, r3, r4, r1
	mla r3, r4, r2, r3
	mov r2, r4, asr #0x1f
	mla r3, r2, r1, r3
	adds r2, r0, ip
	adc r1, r3, r0, asr #31
_02083034:
	mov r0, r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0208303C: .word 0x00015180
	arm_func_end Rtc_ConvertDateTimeToSecond

	arm_func_start Rtc_GetDayOfWeek
Rtc_GetDayOfWeek: ; 0x02083040
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #4]
	ldr r2, [r0]
	sub r1, r1, #2
	cmp r1, #1
	add ip, r2, #0x7d0
	sublt ip, ip, #1
	ldr r6, _020830F0 ; =0x51EB851F
	ldr lr, [r0, #8]
	smull r3, r2, r6, ip
	smull r4, r3, r6, ip
	mov r5, ip, lsr #0x1f
	add r3, r5, r3, asr #5
	add r2, r5, r2, asr #5
	mov r5, #0x64
	smull r2, r4, r5, r2
	sub r2, ip, r2
	addlt r1, r1, #0xc
	mov r0, #0x1a
	mul r0, r1, r0
	sub r1, r0, #2
	ldr r0, _020830F4 ; =0x66666667
	mov r5, r1, lsr #0x1f
	smull r1, ip, r0, r1
	add ip, r5, ip, asr #2
	mov r4, r2, asr #1
	add r0, lr, ip
	add r1, r2, r4, lsr #30
	add r2, r2, r0
	mov r6, r3, asr #1
	add r0, r3, r6, lsr #30
	add r1, r2, r1, asr #2
	add r1, r1, r0, asr #2
	add r0, r3, r3, lsl #2
	add r4, r1, r0
	ldr r3, _020830F8 ; =0x92492493
	mov r1, r4, lsr #0x1f
	smull r2, r0, r3, r4
	add r0, r4, r0
	add r0, r1, r0, asr #2
	mov r2, #7
	smull r0, r1, r2, r0
	sub r0, r4, r0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020830F0: .word 0x51EB851F
_020830F4: .word 0x66666667
_020830F8: .word 0x92492493
	arm_func_end Rtc_GetDayOfWeek

