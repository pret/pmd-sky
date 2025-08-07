	.include "asm/macros.inc"
	.include "include/main_02071AC0.inc"

	.text

	arm_func_start DseTrackEvent_SetOctave
DseTrackEvent_SetOctave: ; 0x02071AC0
	ldrb r1, [r0], #1
	strb r1, [r2, #4]
	bx lr
	arm_func_end DseTrackEvent_SetOctave

	arm_func_start DseTrackEvent_OctaveDelta
DseTrackEvent_OctaveDelta: ; 0x02071ACC
	ldrb r3, [r2, #4]
	ldrsb r1, [r0], #1
	add r1, r3, r1
	strb r1, [r2, #4]
	bx lr
	arm_func_end DseTrackEvent_OctaveDelta

	arm_func_start DseTrackEvent_SetBpm
DseTrackEvent_SetBpm: ; 0x02071AE0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r0, [r5, #0x48]
	ldrb r4, [r6]
	mov r0, r0, asr #0x10
	mul r1, r0, r4
	movs r1, r1, lsr #8
	ldr r0, _02071B1C ; =0x03938700
	moveq r1, #1
	bl _u32_div_f
	str r0, [r5, #0x44]
	strb r4, [r5, #0x17]
	add r0, r6, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02071B1C: .word 0x03938700
	arm_func_end DseTrackEvent_SetBpm

	arm_func_start DseTrackEvent_SetBpm2
DseTrackEvent_SetBpm2: ; 0x02071B20
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r0, [r5, #0x48]
	ldrb r4, [r6]
	mov r0, r0, asr #0x10
	mul r1, r0, r4
	movs r1, r1, lsr #8
	ldr r0, _02071B5C ; =0x03938700
	moveq r1, #1
	bl _u32_div_f
	str r0, [r5, #0x44]
	strb r4, [r5, #0x17]
	add r0, r6, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02071B5C: .word 0x03938700
	arm_func_end DseTrackEvent_SetBpm2

	arm_func_start DseTrackEvent_SetBank
DseTrackEvent_SetBank: ; 0x02071B60
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	ldrb r1, [r4, #1]
	mov r0, r3
	add r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DseChannel_SetBank
	add r0, r4, #2
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetBank

	arm_func_start DseTrackEvent_SetBankMsb
DseTrackEvent_SetBankMsb: ; 0x02071B8C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r1, [r3, #0xe]
	ldrb r2, [r4]
	mov r0, r3
	and r1, r1, #0xff
	add r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DseChannel_SetBank
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetBankMsb

	arm_func_start DseTrackEvent_SetBankLsb
DseTrackEvent_SetBankLsb: ; 0x02071BBC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r2, [r3, #0xe]
	ldrb r1, [r4]
	mov r0, r3
	bic r2, r2, #0xff
	add r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl DseChannel_SetBank
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetBankLsb
