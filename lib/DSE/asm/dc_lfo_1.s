	.include "asm/macros.inc"
	.include "include/dc_lfo_1.inc"

	.text

; https://decomp.me/scratch/Md0hi
	arm_func_start SoundLfoBankSet
SoundLfoBankSet: ; 0x020750B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov sb, r0
	ldr ip, _0207529C ; =LFO_OUTPUT_VOICE_UPDATE_FLAGS
	add r7, sp, #0
	mov r8, r1
	add r4, sb, #0xc
	add r5, sb, #0x10
	mov r6, #0
	mov r3, #4
_020750DC:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	strh r1, [r7]
	strh r0, [r7, #2]
	add r7, r7, #4
	subs r3, r3, #1
	bne _020750DC
	ldr r1, _020752A0 ; =0x81020409
	mov r3, r2, lsl #8
	smull r0, r7, r1, r3
	add r7, r7, r2, lsl #8
	mov r0, r3, lsr #0x1f
	add r7, r0, r7, asr #6
	mov r7, r7, lsl #0x10
_02075118:
	ldrb lr, [r8, #1]
	cmp lr, #0
	beq _02075278
	add ip, sp, #0
	add r3, sp, #0x10
	mov r2, #4
_02075130:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	subs r2, r2, #1
	bne _02075130
	strb lr, [r5, #1]
	mov r1, #0
	strb r1, [r5]
	str r1, [r5, #8]
	ldrb r0, [r8, #1]
	cmp r0, #1
	bne _020751D8
	ldrh r2, [r8, #0xa]
	mov r0, #0x3e8
	ldr r1, _020752A4 ; =DRIVER_WORK
	mul r0, r2, r0
	ldrsh r1, [r1, #0x28]
	bl _s32_div_f
	strh r0, [r5, #0x1a]
	ldr r1, _020752A4 ; =DRIVER_WORK
	ldrh r2, [r8, #0xc]
	mov r0, #0x3e8
	ldrsh r1, [r1, #0x28]
	mul r0, r2, r0
	bl _s32_div_f
	movs r1, r0
	strh r1, [r5, #0x1e]
	beq _020751C4
	mov r0, #0
	str r0, [r5, #0x20]
	mov r0, #0x1000000
	bl _s32_div_f
	str r0, [r5, #0x24]
	b _020751E4
_020751C4:
	mov r0, #0x1000000
	str r0, [r5, #0x20]
	mov r0, #0
	str r0, [r5, #0x24]
	b _020751E4
_020751D8:
	strh r1, [r5, #0x1a]
	strh r1, [r5, #0x1e]
	str r7, [r5, #0x20]
_020751E4:
	mov r0, #0
	strh r0, [r5, #6]
	str r0, [r5, #0x14]
	ldrh r1, [r8, #8]
	cmp r1, #0
	streqh r0, [r5, #6]
	streqh r0, [r5, #4]
	beq _02075240
	mov r0, #0x3e8
	mul r0, r1, r0
	ldr r1, _020752A4 ; =DRIVER_WORK
	ldrsh r1, [r1, #0x28]
	bl _s32_div_f
	movs r1, r0
	addeq r1, r1, #1
	strh r1, [r5, #4]
	mov r0, #0
	strh r0, [r5, #6]
	ldr r0, [r8, #4]
	mov r0, r0, lsl #0xa
	str r0, [r5, #0xc]
	bl _s32_div_f
	str r0, [r5, #0x14]
_02075240:
	ldrb r2, [r8, #3]
	ldr r1, _020752A8 ; =LFO_WAVEFORM_CALLBACKS
	add r0, sp, #0x10
	ldr r1, [r1, r2, lsl #2]
	str r1, [r5, #0x2c]
	ldrb r1, [r8, #2]
	add r1, sb, r1, lsl #1
	str r1, [r5, #0x28]
	ldrb r1, [r8, #2]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	strh r0, [r5, #2]
	str r5, [r4]
	add r4, r5, #0x30
_02075278:
	add r6, r6, #1
	cmp r6, #4
	add r8, r8, #0x10
	add r5, r5, #0x34
	blt _02075118
	mov r0, #0
	str r0, [r4]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0207529C: .word LFO_OUTPUT_VOICE_UPDATE_FLAGS
_020752A0: .word 0x81020409
_020752A4: .word DRIVER_WORK
_020752A8: .word LFO_WAVEFORM_CALLBACKS
	arm_func_end SoundLfoBankSet
