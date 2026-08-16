	.include "asm/macros.inc"
	.include "main_02071A1C.inc"

	.text

	arm_func_start DseTrackEvent_SubLoopBegin
DseTrackEvent_SubLoopBegin: ; 0x02071A1C
	stmdb sp!, {r4, lr}
	ldrb r4, [r2, #6]
	mov r1, #0xc
	ldrb lr, [r0], #1
	smulbb r1, r4, r1
	add r3, r2, #0x24
	str r0, [r3, r1]
	add ip, r3, r1
	mov r1, #0
	str r1, [ip, #4]
	strb lr, [ip, #8]
	ldrb r3, [r2, #4]
	add r1, r4, #1
	strb r3, [ip, #9]
	strb r1, [r2, #6]
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SubLoopBegin

	arm_func_start DseTrackEvent_SubLoopEnd
DseTrackEvent_SubLoopEnd: ; 0x02071A5C
	ldrb ip, [r2, #6]
	add r3, r2, #0x24
	mov r1, #0xc
	sub ip, ip, #1
	mla r3, ip, r1, r3
	ldrb r1, [r3, #8]
	subs r1, r1, #1
	streqb ip, [r2, #6]
	bxeq lr
	str r0, [r3, #4]
	strb r1, [r3, #8]
	ldrb r0, [r3, #9]
	strb r0, [r2, #4]
	ldr r0, [r3]
	bx lr
	arm_func_end DseTrackEvent_SubLoopEnd
