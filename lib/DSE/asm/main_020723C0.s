	.include "asm/macros.inc"
	.include "include/main_020723C0.inc"

	.text

	arm_func_start DseTrackEvent_VolumeFade
DseTrackEvent_VolumeFade: ; 0x020723C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrsb r1, [r5, #2]
	ldrb r2, [r5]
	ldrb r0, [r5, #1]
	mov r4, r3
	mov r1, r1, lsl #0x10
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	str r1, [r4, #0x34]
	movs r6, r0, lsr #0x10
	streq r1, [r4, #0x2c]
	beq _02072410
	ldr r0, [r4, #0x2c]
	subs r0, r1, r0
	moveq r6, #0
	beq _02072410
	mov r1, r6
	bl _s32_div_f
	str r0, [r4, #0x30]
_02072410:
	strh r6, [r4, #0x38]
	add r0, r5, #3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseTrackEvent_VolumeFade
