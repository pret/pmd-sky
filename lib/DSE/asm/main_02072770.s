	.include "asm/macros.inc"
	.include "include/main_02072770.inc"

	.text

	arm_func_start DseTrackEvent_SetupLfo
DseTrackEvent_SetupLfo: ; 0x02072770
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb ip, [r3, #0x61]
	add r3, r3, #0x74
	add r1, r2, r1, lsl #8
	mov r1, r1, lsl #0x10
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb r2, [r0, #4]
	add r3, r3, ip, lsl #4
	mov r1, r1, asr #0x10
	strb r2, [r3, #3]
	str r1, [r3, #4]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #8]
	mov r1, #0
	strh r1, [r3, #0xa]
	strh r1, [r3, #0xc]
	strb r1, [r3, #0xe]
	add r0, r0, #5
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetupLfo
