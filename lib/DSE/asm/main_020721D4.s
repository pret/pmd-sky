	.include "asm/macros.inc"
	.include "include/main_020721D4.inc"

	.text

	arm_func_start DseTrackEvent_SetupKeyBendLfo
DseTrackEvent_SetupKeyBendLfo: ; 0x020721D4
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0]
	ldrb r4, [r0, #1]
	ldrb lr, [r0, #2]
	ldrb ip, [r0, #3]
	ldrb r2, [r0, #4]
	mov r1, #1
	add r4, r5, r4, lsl #8
	strb r1, [r3, #0x75]
	strb r1, [r3, #0x76]
	mov r1, r4, lsl #0x10
	strb r2, [r3, #0x77]
	mov r1, r1, asr #0x10
	str r1, [r3, #0x78]
	add r1, lr, ip, lsl #8
	strh r1, [r3, #0x7c]
	mov r1, #0
	strh r1, [r3, #0x7e]
	strh r1, [r3, #0x80]
	strb r1, [r3, #0x82]
	add r0, r0, #5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_SetupKeyBendLfo

	arm_func_start DseTrackEvent_SetupKeyBendLfoEnvelope
DseTrackEvent_SetupKeyBendLfoEnvelope: ; 0x0207222C
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x7e]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x80]
	bx lr
	arm_func_end DseTrackEvent_SetupKeyBendLfoEnvelope

	arm_func_start DseTrackEvent_UseKeyBendLfo
DseTrackEvent_UseKeyBendLfo: ; 0x02072254
	ldrb r1, [r0]
	add r0, r0, #1
	cmp r1, #2
	moveq r1, #1
	strb r1, [r3, #0x75]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strb r1, [r3, #0x76]
	bx lr
	arm_func_end DseTrackEvent_UseKeyBendLfo

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

	arm_func_start DseTrackEvent_SetupVolumeLfoEnvelope
DseTrackEvent_SetupVolumeLfoEnvelope: ; 0x02072504
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x8e]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x90]
	bx lr
	arm_func_end DseTrackEvent_SetupVolumeLfoEnvelope

	arm_func_start DseTrackEvent_UseVolumeLfo
DseTrackEvent_UseVolumeLfo: ; 0x0207252C
	ldrb r1, [r0]
	add r0, r0, #1
	cmp r1, #2
	moveq r1, #1
	strb r1, [r3, #0x85]
	cmp r1, #0
	moveq r1, #0
	movne r1, #2
	strb r1, [r3, #0x86]
	bx lr
	arm_func_end DseTrackEvent_UseVolumeLfo

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

	arm_func_start DseTrackEvent_SetupPanLfoEnvelope
DseTrackEvent_SetupPanLfoEnvelope: ; 0x02072720
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0x9e]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xa0]
	bx lr
	arm_func_end DseTrackEvent_SetupPanLfoEnvelope

	arm_func_start DseTrackEvent_UsePanLfo
DseTrackEvent_UsePanLfo: ; 0x02072748
	ldrb r1, [r0]
	add r0, r0, #1
	cmp r1, #2
	moveq r1, #1
	strb r1, [r3, #0x95]
	cmp r1, #0
	moveq r1, #0
	movne r1, #3
	strb r1, [r3, #0x96]
	bx lr
	arm_func_end DseTrackEvent_UsePanLfo

	arm_func_start DseTrackEvent_SetupLfo
DseTrackEvent_SetupLfo: ; 0x02072770
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb ip, [r3, #0x61]
	add r3, r3, #0x74
	add r1, r2, r1, lsl #8
	mov r1, r1, lsl #0x10
	ldrb r4, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb r2, [r0, #4]
	add r3, r3, ip, lsl #4
	mov r1, r1, asr #0x10
	strb r2, [r3, #3]
	str r1, [r3, #4]
	add r1, r4, lr, lsl #8
	strh r1, [r3, #8]
	mov r1, #0
	strh r1, [r3, #0xa]
	strh r1, [r3, #0xc]
	strb r1, [r3, #0xe]
	add r0, r0, #5
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetupLfo

	arm_func_start DseTrackEvent_SetupLfoEnvelope
DseTrackEvent_SetupLfoEnvelope: ; 0x020727C8
	ldrb ip, [r3, #0x61]
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r3, r3, #0x74
	add r3, r3, ip, lsl #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xa]
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #3]
	add r0, r0, #4
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xc]
	bx lr
	arm_func_end DseTrackEvent_SetupLfoEnvelope

	arm_func_start DseTrackEvent_SetLfoParameter
DseTrackEvent_SetLfoParameter: ; 0x020727FC
	ldrb r1, [r3, #0x61]
	ldrb ip, [r0]
	add r2, r3, #0x74
	add r1, r2, r1, lsl #4
	ldrb r2, [r0, #1]
	cmp ip, #0xa
	addls pc, pc, ip, lsl #2
	b _02072930
_0207281C: ; jump table
	b _02072930 ; case 0
	b _02072848 ; case 1
	b _02072850 ; case 2
	b _02072858 ; case 3
	b _02072860 ; case 4
	b _02072868 ; case 5
	b _020728E0 ; case 6
	b _020728EC ; case 7
	b _020728FC ; case 8
	b _02072910 ; case 9
	b _02072924 ; case 10
_02072848:
	strb r2, [r3, #0x61]
	b _02072930
_02072850:
	strb r2, [r1, #1]
	b _02072930
_02072858:
	strb r2, [r1, #2]
	b _02072930
_02072860:
	strb r2, [r1, #3]
	b _02072930
_02072868:
	ldrb r3, [r1, #2]
	cmp r3, #4
	addls pc, pc, r3, lsl #2
	b _020728CC
_02072878: ; jump table
	b _020728CC ; case 0
	b _0207288C ; case 1
	b _0207289C ; case 2
	b _020728AC ; case 3
	b _020728BC ; case 4
_0207288C:
	mov r3, #0xa
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_0207289C:
	mvn r3, #0x13
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728AC:
	mov r3, #0x14
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728BC:
	mov r3, #0xa
	mul r3, r2, r3
	mov r2, r3
	b _020728D8
_020728CC:
	mov r3, #0x14
	mul r3, r2, r3
	mov r2, r3
_020728D8:
	str r2, [r1, #4]
	b _02072930
_020728E0:
	add r2, r2, r2, lsl #2
	strh r2, [r1, #8]
	b _02072930
_020728EC:
	mov r3, #0x14
	mul r3, r2, r3
	strh r3, [r1, #0xa]
	b _02072930
_020728FC:
	ldrh r3, [r1, #0xa]
	and r3, r3, #0xff00
	orr r2, r3, r2
	strh r2, [r1, #0xa]
	b _02072930
_02072910:
	ldrh r3, [r1, #0xa]
	and r3, r3, #0xff
	orr r2, r3, r2, lsl #8
	strh r2, [r1, #0xa]
	b _02072930
_02072924:
	mov r3, #0x14
	mul r3, r2, r3
	strh r3, [r1, #0xc]
_02072930:
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_SetLfoParameter

	arm_func_start DseTrackEvent_UseLfo
DseTrackEvent_UseLfo: ; 0x02072938
	stmdb sp!, {r3, lr}
	ldrb ip, [r0, #1]
	ldrb r2, [r0]
	ldrb lr, [r0, #2]
	add r1, r3, #0x74
	cmp ip, #2
	strb r2, [r3, #0x61]
	add r1, r1, r2, lsl #4
	moveq ip, #1
	strb ip, [r1, #1]
	strb lr, [r1, #2]
	add r0, r0, #3
	ldmia sp!, {r3, pc}
	arm_func_end DseTrackEvent_UseLfo

	arm_func_start DseTrackEvent_Signal
DseTrackEvent_Signal: ; 0x0207296C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r2, [r4]
	mov ip, r1
	mov r1, #8
	strb r2, [ip, #0x16]
	ldr r0, [ip, #0x28]
	ldr r3, [ip, #0xa0]
	ldr ip, [ip, #0x9c]
	blx ip
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_Signal
