	.include "asm/macros.inc"
	.include "include/main_02072554.inc"

	.text

	arm_func_start DseTrackEvent_SetPan
DseTrackEvent_SetPan: ; 0x02072554
	stmdb sp!, {r3, lr}
	ldrb lr, [r0]
	mov ip, #0
	cmp lr, #0x7f
	movgt lr, #0x7f
	mov r1, lr, lsl #0x10
	str r1, [r3, #0x44]
	str r1, [r3, #0x3c]
	strh ip, [r3, #0x48]
	ldr r2, [r3, #0xc4]
	ldr r1, _020725D0 ; =0x04000208
	ldrsb r2, [r2, #7]
	sub r2, r2, #0x40
	add r2, lr, r2
	strh r2, [r3, #0x1a]
	ldrh lr, [r1]
	strh ip, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020725BC
_020725A4:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x40
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _020725A4
_020725BC:
	ldr r2, _020725D0 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh lr, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020725D0: .word 0x04000208
	arm_func_end DseTrackEvent_SetPan

	arm_func_start DseTrackEvent_PanDelta
DseTrackEvent_PanDelta: ; 0x020725D4
	stmdb sp!, {r3, lr}
	ldrsb r2, [r0]
	ldr r1, [r3, #0x3c]
	add lr, r2, r1, asr #16
	cmp lr, #0x7f
	movgt lr, #0x7f
	bgt _020725F8
	cmp lr, #0
	movlt lr, #0
_020725F8:
	mov r1, lr, lsl #0x10
	str r1, [r3, #0x44]
	str r1, [r3, #0x3c]
	mov ip, #0
	strh ip, [r3, #0x48]
	ldr r2, [r3, #0xc4]
	ldr r1, _02072664 ; =0x04000208
	ldrsb r2, [r2, #7]
	sub r2, r2, #0x40
	add r2, lr, r2
	strh r2, [r3, #0x1a]
	ldrh lr, [r1]
	strh ip, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02072650
_02072638:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x40
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02072638
_02072650:
	ldr r2, _02072664 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh lr, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02072664: .word 0x04000208
	arm_func_end DseTrackEvent_PanDelta

	arm_func_start DseTrackEvent_PanFade
DseTrackEvent_PanFade: ; 0x02072668
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrsb r1, [r5, #2]
	ldrb r2, [r5]
	ldrb r0, [r5, #1]
	mov r4, r3
	mov r1, r1, lsl #0x10
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	str r1, [r4, #0x44]
	movs r6, r0, lsr #0x10
	streq r1, [r4, #0x3c]
	beq _020726B8
	ldr r0, [r4, #0x3c]
	subs r0, r1, r0
	moveq r6, #0
	beq _020726B8
	mov r1, r6
	bl _s32_div_f
	str r0, [r4, #0x40]
_020726B8:
	strh r6, [r4, #0x48]
	add r0, r5, #3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseTrackEvent_PanFade

	arm_func_start DseTrackEvent_SetupPanLfo
DseTrackEvent_SetupPanLfo: ; 0x020726C4
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r1, [r0, #1]
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb ip, [r0, #4]
	mov r2, #1
	add r1, r5, r1, lsl #8
	mov r1, r1, lsl #0x10
	strb r2, [r3, #0x95]
	mov r2, #3
	strb r2, [r3, #0x96]
	strb ip, [r3, #0x97]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x98]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #0x9c]
	mov r1, #0
	strh r1, [r3, #0x9e]
	strh r1, [r3, #0xa0]
	strb r1, [r3, #0xa2]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupPanLfo
