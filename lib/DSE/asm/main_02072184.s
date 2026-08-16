	.include "asm/macros.inc"
	.include "include/main_02072184.inc"

	.text

	arm_func_start DseTrackEvent_SetKeyBend
DseTrackEvent_SetKeyBend: ; 0x02072184
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	ldrb r1, [r4, #1]
	mov r0, r3
	add r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl DseChannel_SetKeyBend
	add r0, r4, #2
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetKeyBend
