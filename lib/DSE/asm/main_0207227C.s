	.include "asm/macros.inc"
	.include "include/main_0207227C.inc"

	.text

	arm_func_start DseTrackEvent_SetVolume
DseTrackEvent_SetVolume: ; 0x0207227C
	stmdb sp!, {r3, r4, r5, lr}
	ldrsb r4, [r0]
	mov r5, #0
	ldr r2, _02072308 ; =0x82061029
	mov r1, r4, lsl #0x10
	str r1, [r3, #0x34]
	str r1, [r3, #0x2c]
	strh r5, [r3, #0x38]
	ldr ip, [r3, #0xc4]
	ldrb r1, [r3, #0x50]
	ldrsb lr, [ip, #8]
	ldr ip, _0207230C ; =0x04000208
	smulbb r1, r4, r1
	mul r4, lr, r1
	smull r1, lr, r2, r4
	add lr, r4, lr
	mov r1, r4, lsr #0x1f
	add lr, r1, lr, asr #13
	strh lr, [r3, #0x18]
	ldrh r4, [ip]
	strh r5, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020722F4
_020722DC:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x20
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _020722DC
_020722F4:
	ldr r2, _0207230C ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02072308: .word 0x82061029
_0207230C: .word 0x04000208
	arm_func_end DseTrackEvent_SetVolume

	arm_func_start DseTrackEvent_VolumeDelta
DseTrackEvent_VolumeDelta: ; 0x02072310
	stmdb sp!, {r3, r4, r5, lr}
	ldrsb r2, [r0]
	ldr r1, [r3, #0x2c]
	add r4, r2, r1, asr #16
	cmp r4, #0x7f
	movgt r4, #0x7f
	bgt _02072334
	cmp r4, #0
	movlt r4, #0
_02072334:
	mov r1, r4, lsl #0x10
	str r1, [r3, #0x34]
	str r1, [r3, #0x2c]
	mov r5, #0
	strh r5, [r3, #0x38]
	ldrb r1, [r3, #0x50]
	ldr ip, [r3, #0xc4]
	ldr r2, _020723B8 ; =0x82061029
	mul r1, r4, r1
	ldrsb lr, [ip, #8]
	ldr ip, _020723BC ; =0x04000208
	mul r4, lr, r1
	smull r1, lr, r2, r4
	add lr, r4, lr
	mov r1, r4, lsr #0x1f
	add lr, r1, lr, asr #13
	strh lr, [r3, #0x18]
	ldrh r4, [ip]
	strh r5, [ip]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020723A4
_0207238C:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x20
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _0207238C
_020723A4:
	ldr r2, _020723BC ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020723B8: .word 0x82061029
_020723BC: .word 0x04000208
	arm_func_end DseTrackEvent_VolumeDelta

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

	arm_func_start DseTrackEvent_SetExpression
DseTrackEvent_SetExpression: ; 0x0207241C
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r4, [r0]
	ldr r2, _020724A0 ; =0x82061029
	ldr lr, _020724A4 ; =0x04000208
	strb r4, [r3, #0x50]
	ldr r1, [r3, #0x2c]
	ldr ip, [r3, #0xc4]
	mov r1, r1, asr #0x10
	mul r4, r1, r4
	ldrsb r1, [ip, #8]
	mov ip, #0
	mul r4, r1, r4
	smull r1, r5, r2, r4
	add r5, r4, r5
	mov r1, r4, lsr #0x1f
	add r5, r1, r5, asr #13
	strh r5, [r3, #0x18]
	ldrh r4, [lr]
	strh ip, [lr]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _0207248C
_02072474:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x20
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02072474
_0207248C:
	ldr r2, _020724A4 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020724A0: .word 0x82061029
_020724A4: .word 0x04000208
	arm_func_end DseTrackEvent_SetExpression

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
