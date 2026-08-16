	.include "asm/macros.inc"
	.include "include/main_020721D4.inc"

	.text

	arm_func_start DseTrackEvent_SetupKeyBendLfo
DseTrackEvent_SetupKeyBendLfo: ; 0x020721D4
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r4, [r0, #1]
	ldrb lr, [r0, #2]
	ldrb ip, [r0, #3]
	ldrb r2, [r0, #4]
	mov r1, #1
	add r4, r5, r4, lsl #8
	strb r1, [r3, #0x75]
	strb r1, [r3, #0x76]
	mov r1, r4, lsl #0x10
	strb r2, [r3, #0x77]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x78]
	add r1, lr, ip, lsl #8
	strh r1, [r3, #0x7c]
	mov r1, #0
	strh r1, [r3, #0x7e]
	strh r1, [r3, #0x80]
	strb r1, [r3, #0x82]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupKeyBendLfo
