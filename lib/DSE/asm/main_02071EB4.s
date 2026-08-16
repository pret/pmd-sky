	.include "asm/macros.inc"
	.include "include/main_02071EB4.inc"

	.text

	arm_func_start DseTrackEvent_TuningDeltaCoarse
DseTrackEvent_TuningDeltaCoarse: ; 0x02071EB4
	stmdb sp!, {r4, lr}
	ldrsb r4, [r0]
	ldrsh r1, [r3, #0x54]
	ldr ip, _02071F38 ; =0x04000208
	mov r2, #0
	add r1, r1, r4, lsl #8
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	strh r4, [r3, #0x54]
	ldr lr, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh lr, [lr, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, r4, r1, asr #16
	add r1, lr, r1
	strh r1, [r3, #0x16]
	ldrh r4, [ip]
	strh r2, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02071F24
_02071F0C:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02071F0C
_02071F24:
	ldr r2, _02071F38 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071F38: .word 0x04000208
	arm_func_end DseTrackEvent_TuningDeltaCoarse

	arm_func_start DseTrackEvent_TuningDeltaFine
DseTrackEvent_TuningDeltaFine: ; 0x02071F3C
	stmdb sp!, {r4, lr}
	ldrsb r4, [r0]
	ldrsh r1, [r3, #0x54]
	ldr ip, _02071FC0 ; =0x04000208
	mov r2, #0
	add r1, r1, r4, lsl #2
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	strh r4, [r3, #0x54]
	ldr lr, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh lr, [lr, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, r4, r1, asr #16
	add r1, lr, r1
	strh r1, [r3, #0x16]
	ldrh r4, [ip]
	strh r2, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02071FAC
_02071F94:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02071F94
_02071FAC:
	ldr r2, _02071FC0 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071FC0: .word 0x04000208
	arm_func_end DseTrackEvent_TuningDeltaFine

	arm_func_start DseTrackEvent_TuningDeltaFull
DseTrackEvent_TuningDeltaFull: ; 0x02071FC4
	stmdb sp!, {r3, lr}
	ldrb ip, [r0]
	ldrb r1, [r0, #1]
	ldrsh lr, [r3, #0x54]
	ldr r2, _02072050 ; =0x04000208
	add r1, ip, r1, lsl #8
	add r1, lr, r1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
	strh lr, [r3, #0x54]
	ldr ip, [r3, #0xc4]
	ldr r1, [r3, #0x1c]
	ldrsh ip, [ip, #4]
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	add r1, lr, r1, asr #16
	add r1, ip, r1
	strh r1, [r3, #0x16]
	ldrh ip, [r2]
	mov r1, #0
	strh r1, [r2]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _0207203C
_02072024:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02072024
_0207203C:
	ldr r2, _02072050 ; =0x04000208
	add r0, r0, #2
	ldrh r1, [r2]
	strh ip, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02072050: .word 0x04000208
	arm_func_end DseTrackEvent_TuningDeltaFull

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

	arm_func_start DseTrackEvent_SetNoteRandomRegion
DseTrackEvent_SetNoteRandomRegion: ; 0x02072144
	ldrb r1, [r0]
	ldrb ip, [r0, #1]
	add r0, r0, #2
	mov r2, r1
	cmp r1, ip
	movhi r2, ip
	movhi ip, r1
	strb r2, [r3, #0xc]
	strb ip, [r3, #0xd]
	bx lr
	arm_func_end DseTrackEvent_SetNoteRandomRegion
