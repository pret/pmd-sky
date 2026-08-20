	.include "asm/macros.inc"
	.include "include/main_02072054.inc"

	.text

	arm_func_start DseTrackEvent_TuningFade
DseTrackEvent_TuningFade: ; 0x02072054
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r3
	ldrb r1, [r6, #4]
	ldrb r4, [r7]
	ldrb r0, [r7, #1]
	tst r1, #2
	ldrb r2, [r7, #2]
	add r0, r4, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	ldr r4, [r6, #0xc4]
	moveq r1, #0
	streq r1, [r6, #0x1c]
	ldr r1, [r6, #0x1c]
	mov r0, r2, lsl #0x18
	mov r1, r1, asr #0x10
	add r0, r1, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r0, lsl #0x10
	str r1, [r6, #0x24]
	cmp r5, #0
	streq r1, [r6, #0x1c]
	beq _020720D4
	ldr r0, [r6, #0x1c]
	subs r0, r1, r0
	moveq r5, #0
	beq _020720D4
	mov r1, r5
	bl _s32_div_f
	str r0, [r6, #0x20]
_020720D4:
	strh r5, [r6, #0x28]
	ldr r0, [r6, #0x1c]
	ldrsh r1, [r6, #0x54]
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	ldrsh r2, [r4, #4]
	add r0, r1, r0, lsr #16
	ldr r1, _02072140 ; =0x04000208
	add r0, r2, r0
	strh r0, [r6, #0x16]
	ldrh r3, [r1]
	mov r0, #0
	strh r0, [r1]
	ldr r1, [r6, #0xb4]
	cmp r1, #0
	beq _0207212C
_02072114:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x10
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072114
_0207212C:
	ldr r2, _02072140 ; =0x04000208
	add r0, r7, #3
	ldrh r1, [r2]
	strh r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02072140: .word 0x04000208
	arm_func_end DseTrackEvent_TuningFade
