	.include "asm/macros.inc"
	.include "include/main_020724A8.inc"

	.text

	arm_func_start DseTrackEvent_SetupVolumeLfo
DseTrackEvent_SetupVolumeLfo: ; 0x020724A8
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r1, [r0, #1]
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb ip, [r0, #4]
	mov r2, #1
	add r1, r5, r1, lsl #8
	mov r1, r1, lsl #0x10
	strb r2, [r3, #0x85]
	mov r2, #2
	strb r2, [r3, #0x86]
	strb ip, [r3, #0x87]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x88]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #0x8c]
	mov r1, #0
	strh r1, [r3, #0x8e]
	strh r1, [r3, #0x90]
	strb r1, [r3, #0x92]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupVolumeLfo
