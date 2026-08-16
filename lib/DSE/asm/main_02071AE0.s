	.include "asm/macros.inc"
	.include "include/main_02071AE0.inc"

	.text

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
	ldr r0, _02071B1C
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
	ldr r0, _02071B5C
	moveq r1, #1
	bl _u32_div_f
	str r0, [r5, #0x44]
	strb r4, [r5, #0x17]
	add r0, r6, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02071B5C: .word 0x03938700
	arm_func_end DseTrackEvent_SetBpm2
