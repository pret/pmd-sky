	.include "asm/macros.inc"
	.include "main_02071CC8.inc"

	.text

	arm_func_start DseTrackEvent_RestoreEnvelopeDefaults
DseTrackEvent_RestoreEnvelopeDefaults: ; 0x02071CC8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r3, #0x64
	bl SoundEnvelopeParameters_Reset
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_RestoreEnvelopeDefaults

	arm_func_start DseTrackEvent_SetEnvelopeAttackBegin
DseTrackEvent_SetEnvelopeAttackBegin: ; 0x02071CE0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x6c]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeAttackBegin

	arm_func_start DseTrackEvent_SetEnvelopeAttackTime
DseTrackEvent_SetEnvelopeAttackTime: ; 0x02071D00
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x6d]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeAttackTime

	arm_func_start DseTrackEvent_SetEnvelopeHoldTime
DseTrackEvent_SetEnvelopeHoldTime: ; 0x02071D20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x70]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeHoldTime

	arm_func_start DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel
DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel: ; 0x02071D40
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0xff
	strneb r0, [r3, #0x6e]
	ldrb r0, [r4, #1]
	cmp r0, #0xff
	strneb r0, [r3, #0x6f]
	add r0, r3, #0x64
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #2
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeDecayTimeAndSustainLevel

	arm_func_start DseTrackEvent_SetEnvelopeSustainTime
DseTrackEvent_SetEnvelopeSustainTime: ; 0x02071D70
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x71]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeSustainTime

	arm_func_start DseTrackEvent_SetEnvelopeReleaseTime
DseTrackEvent_SetEnvelopeReleaseTime: ; 0x02071D90
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	add r0, r3, #0x64
	strb r1, [r3, #0x72]
	bl SoundEnvelopeParameters_CheckValidity
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetEnvelopeReleaseTime

	arm_func_start DseTrackEvent_SetNoteDurationMultiplier
DseTrackEvent_SetNoteDurationMultiplier: ; 0x02071DB0
	ldrb r1, [r0], #1
	strb r1, [r2, #5]
	bx lr
	arm_func_end DseTrackEvent_SetNoteDurationMultiplier

	arm_func_start DseTrackEvent_ForceLfoEnvelopeLevel
DseTrackEvent_ForceLfoEnvelopeLevel: ; 0x02071DBC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r1, [r4]
	mov r0, r3
	bl DseChannel_SetLfoConstEnvelopeLevel
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_ForceLfoEnvelopeLevel

	arm_func_start DseTrackEvent_SetHoldNotes
DseTrackEvent_SetHoldNotes: ; 0x02071DD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4]
	ldr r0, [r2, #0x54]
	cmp r1, #0x40
	ldrb r1, [r0, #4]
	orrhs r1, r1, #1
	strhsb r1, [r0, #4]
	bhs _02071E08
	bic r1, r1, #1
	strb r1, [r0, #4]
	bl DseVoice_ReleaseHeld
_02071E08:
	add r0, r4, #1
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_SetHoldNotes

	arm_func_start DseTrackEvent_SetFlagBit1Unknown
DseTrackEvent_SetFlagBit1Unknown: ; 0x02071E10
	ldrb r1, [r3, #4]
	orr r1, r1, #2
	strb r1, [r3, #4]
	bx lr
	arm_func_end DseTrackEvent_SetFlagBit1Unknown

	arm_func_start DseTrackEvent_SetOptionalVolume
DseTrackEvent_SetOptionalVolume: ; 0x02071E20
	ldrb r1, [r0], #1
	strb r1, [r3, #0x58]
	bx lr
	arm_func_end DseTrackEvent_SetOptionalVolume

	arm_func_start DseTrackEvent_Dummy2Bytes
DseTrackEvent_Dummy2Bytes: ; 0x02071E2C
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_Dummy2Bytes

	arm_func_start DseTrackEvent_SetTuning
DseTrackEvent_SetTuning: ; 0x02071E34
	stmdb sp!, {r4, lr}
	ldrsb r1, [r0]
	ldr ip, _02071EB0 ; =0x04000208
	mov r2, #0
	mov r1, r1, lsl #0x18
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
	beq _02071E9C
_02071E84:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x10
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02071E84
_02071E9C:
	ldr r2, _02071EB0 ; =0x04000208
	add r0, r0, #1
	ldrh r1, [r2]
	strh r4, [r2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02071EB0: .word 0x04000208
	arm_func_end DseTrackEvent_SetTuning

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

	arm_func_start DseTrackEvent_SetTuningJitterAmplitude
DseTrackEvent_SetTuningJitterAmplitude: ; 0x0207216C
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r0, r0, #2
	add r1, r2, r1, lsl #8
	strh r1, [r3, #0xa]
	bx lr
	arm_func_end DseTrackEvent_SetTuningJitterAmplitude

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

	arm_func_start DseTrackEvent_SetUnknown2
DseTrackEvent_SetUnknown2: ; 0x020721B0
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r0, r0, #2
	add r1, r1, r2, lsl #8
	strh r1, [r3, #0x56]
	bx lr
	arm_func_end DseTrackEvent_SetUnknown2

	arm_func_start DseTrackEvent_SetKeyBendRange
DseTrackEvent_SetKeyBendRange: ; 0x020721C8
	ldrb r1, [r0], #1
	strb r1, [r3, #0x59]
	bx lr
	arm_func_end DseTrackEvent_SetKeyBendRange

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

	arm_func_start DseTrackEvent_Dummy2Bytes2
DseTrackEvent_Dummy2Bytes2: ; 0x0207299C
	add r0, r0, #2
	bx lr
	arm_func_end DseTrackEvent_Dummy2Bytes2

	arm_func_start sub_020729A4
sub_020729A4: ; 0x020729A4
	ldr r0, _020729B4 ; =_022B9584
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_020729B4: .word _022B9584
	arm_func_end sub_020729A4

	arm_func_start sub_020729B8
sub_020729B8: ; 0x020729B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr sb, _02072BB4 ; =_022B9584
	ldr r8, [sb]
	ldrb r6, [r8, #0x86]
	cmp r6, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r5, [r8, #0x85]
	mov r1, #0
	cmp r6, #0
	str r1, [sp]
	beq _02072B98
	mov fp, #3
	mov r1, #2
	mov r2, r1
	mov r3, fp
	mov ip, r1
	mov lr, fp
	mov r4, fp
_02072A04:
	ldrb sl, [r8, #0x88]
	add r7, r8, r5
	add r5, r5, #1
	sub r6, r6, #1
	and r5, r5, #0xff
	cmp r5, #0x80
	moveq r5, #0
	ldrb r7, [r7, #4]
	and r6, r6, #0xff
	cmp sl, #0
	bne _02072B28
	tst r7, #0x80
	bne _02072A4C
	add sl, sl, #1
	strb sl, [r8, #0x88]
	ldr r8, [sb]
	strb r7, [r8, #0x8c]
	b _02072B30
_02072A4C:
	and sl, r7, #0xf0
	strb sl, [r8, #0x8a]
	and r8, r7, #0xf
	ldr r7, [sb]
	strb r8, [r7, #0x8b]
	ldr r7, [sb]
	ldrb r8, [r7, #0x8a]
	cmp r8, #0xc0
	bgt _02072AA8
	bge _02072AF8
	cmp r8, #0x90
	bgt _02072A8C
	bge _02072AE0
	cmp r8, #0x80
	beq _02072AD8
	b _02072B1C
_02072A8C:
	cmp r8, #0xa0
	bgt _02072A9C
	beq _02072AE8
	b _02072B1C
_02072A9C:
	cmp r8, #0xb0
	beq _02072AF0
	b _02072B1C
_02072AA8:
	cmp r8, #0xe0
	bgt _02072AC0
	bge _02072B08
	cmp r8, #0xd0
	beq _02072B00
	b _02072B1C
_02072AC0:
	cmp r8, #0xf0
	bgt _02072AD0
	beq _02072B10
	b _02072B1C
_02072AD0:
	cmp r8, #0xff
	b _02072B1C
_02072AD8:
	strb r4, [r7, #0x87]
	b _02072B30
_02072AE0:
	strb lr, [r7, #0x87]
	b _02072B30
_02072AE8:
	strb ip, [r7, #0x87]
	b _02072B30
_02072AF0:
	strb r3, [r7, #0x87]
	b _02072B30
_02072AF8:
	strb r2, [r7, #0x87]
	b _02072B30
_02072B00:
	strb r1, [r7, #0x87]
	b _02072B30
_02072B08:
	strb fp, [r7, #0x87]
	b _02072B30
_02072B10:
	mov r8, #3
	strb r8, [r7, #0x87]
	b _02072B30
_02072B1C:
	mov r8, #0
	strb r8, [r7, #0x87]
	b _02072B30
_02072B28:
	add r8, r8, sl
	strb r7, [r8, #0x8b]
_02072B30:
	ldr r7, [sb]
	ldrb r8, [r7, #0x88]
	add r8, r8, #1
	strb r8, [r7, #0x88]
	ldr r8, [sb]
	ldrb sl, [r8, #0x88]
	ldrb r7, [r8, #0x87]
	cmp sl, r7
	bne _02072B90
	mov r2, #0
	ldr r1, _02072BB4 ; =_022B9584
	strb r2, [r8, #0x88]
	ldr r3, [r1]
	mov r1, #1
	str r1, [sp]
	ldrb r2, [r3, #0x8a]
	ldrb r1, [r3, #0x8b]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #0x8c]
	ldrb r1, [r3, #0x8d]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	b _02072B98
_02072B90:
	cmp r6, #0
	bne _02072A04
_02072B98:
	ldr r1, _02072BB4 ; =_022B9584
	ldr r0, [sp]
	ldr r2, [r1]
	strb r6, [r2, #0x86]
	ldr r1, [r1]
	strb r5, [r1, #0x85]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02072BB4: .word _022B9584
	arm_func_end sub_020729B8

	arm_func_start sub_02072BB8
sub_02072BB8: ; 0x02072BB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r0, _02072D94 ; =_022B9584
	ldr r0, [r0]
	ldr r4, [r0]
	cmp r4, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #8
	bl sub_020729B8
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add sb, r4, #0x10
	mov r6, #0
	ldr r4, _02072D98 ; =_020B0D50
	add r7, sp, #0
	mov r5, #1
	mov r8, r6
	mov fp, #0xc8
_02072C08:
	ldrb r1, [sp, #9]
	ldrb r0, [sp, #8]
	mla sl, r1, fp, sb
	cmp r0, #0xc0
	bgt _02072C4C
	bge _02072D4C
	cmp r0, #0x90
	bgt _02072C38
	bge _02072CC0
	cmp r0, #0x80
	beq _02072C8C
	b _02072D7C
_02072C38:
	cmp r0, #0xa0
	ble _02072D7C
	cmp r0, #0xb0
	beq _02072D2C
	b _02072D7C
_02072C4C:
	cmp r0, #0xf0
	bgt _02072C6C
	bge _02072D7C
	cmp r0, #0xd0
	ble _02072D7C
	cmp r0, #0xe0
	beq _02072D5C
	b _02072D7C
_02072C6C:
	cmp r0, #0xf7
	ble _02072D7C
	cmp r0, #0xff
	bgt _02072D7C
	cmp r0, #0xfe
	blt _02072D7C
	cmpne r0, #0xff
	b _02072D7C
_02072C8C:
	ldrb r1, [sp, #0xa]
	ldrb r0, [sp, #0xb]
	str r8, [sp, #4]
	strb r1, [sp, #2]
	strb r0, [sp, #3]
	strb r8, [sp]
	ldrb r0, [sl, #4]
	tst r0, #1
	bne _02072D7C
	mov r0, sl
	mov r1, r7
	bl DseChannel_ReleaseNoteInternal
	b _02072D7C
_02072CC0:
	ldrb r0, [sp, #0xb]
	ldrb r1, [sp, #0xa]
	str r6, [sp, #4]
	strb r0, [sp, #3]
	strb r1, [sp, #2]
	tst r0, #0xff
	beq _02072D0C
	mov r0, sl
	mov r1, r7
	strb r5, [sp]
	bl DseChannel_ReleaseNote
	mov r0, sl
	mov r1, r7
	bl DseChannel_AllocateNote
	movs r1, r0
	beq _02072D7C
	mov r0, sl
	bl DseVoice_PlayNote
	b _02072D7C
_02072D0C:
	strb r6, [sp]
	ldrb r0, [sl, #4]
	tst r0, #1
	bne _02072D7C
	mov r0, sl
	mov r1, r7
	bl DseChannel_ReleaseNoteInternal
	b _02072D7C
_02072D2C:
	ldrb r0, [sp, #0xa]
	ldr r2, [r4, r0, lsl #2]
	cmp r2, #0
	beq _02072D7C
	ldrb r1, [sp, #0xb]
	mov r0, sl
	blx r2
	b _02072D7C
_02072D4C:
	ldrb r1, [sp, #0xa]
	mov r0, sl
	bl DseChannel_SetInstrument
	b _02072D7C
_02072D5C:
	ldrb r2, [sp, #0xa]
	ldrb r1, [sp, #0xb]
	mov r0, sl
	add r1, r2, r1, lsl #7
	sub r1, r1, #0x2000
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl DseChannel_SetKeyBend
_02072D7C:
	add r0, sp, #8
	bl sub_020729B8
	cmp r0, #0
	bne _02072C08
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02072D94: .word _022B9584
_02072D98: .word _020B0D50
	arm_func_end sub_02072BB8

	arm_func_start sub_02072D9C
sub_02072D9C: ; 0x02072D9C
	ldrh r2, [r0, #0xe]
	ldr ip, _02072DB8 ; =DseChannel_SetBank
	and r2, r2, #0xff
	add r1, r2, r1, lsl #8
	strh r1, [r0, #0xe]
	ldrh r1, [r0, #0xe]
	bx ip
	.align 2, 0
_02072DB8: .word DseChannel_SetBank
	arm_func_end sub_02072D9C

	arm_func_start sub_02072DBC
sub_02072DBC: ; 0x02072DBC
	ldrh r2, [r0, #0xe]
	ldr ip, _02072DD8 ; =DseChannel_SetBank
	bic r2, r2, #0xff
	add r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_02072DD8: .word DseChannel_SetBank
	arm_func_end sub_02072DBC

	arm_func_start sub_02072DDC
sub_02072DDC: ; 0x02072DDC
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	ldr ip, _02072DF0 ; =DseChannel_SetLfoConstEnvelopeLevel
	strb r1, [r0, #0x51]
	bx ip
	.align 2, 0
_02072DF0: .word DseChannel_SetLfoConstEnvelopeLevel
	arm_func_end sub_02072DDC

	arm_func_start sub_02072DF4
sub_02072DF4: ; 0x02072DF4
	mov r2, #0xa
	mul r2, r1, r2
	strh r2, [r0, #0x56]
	bx lr
	arm_func_end sub_02072DF4

	arm_func_start sub_02072E04
sub_02072E04: ; 0x02072E04
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	str r2, [r0, #0x34]
	str r2, [r0, #0x2c]
	mov r4, #0
	strh r4, [r0, #0x38]
	ldrb r3, [r0, #0x50]
	ldr lr, [r0, #0xc4]
	ldr r2, _02072E88 ; =0x82061029
	mul ip, r1, r3
	ldrsb r1, [lr, #8]
	ldr r3, _02072E8C ; =0x04000208
	mul ip, r1, ip
	smull r1, lr, r2, ip
	add lr, ip, lr
	mov r1, ip, lsr #0x1f
	add lr, r1, lr, asr #13
	strh lr, [r0, #0x18]
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r1, [r0, #0xb4]
	cmp r1, #0
	beq _02072E78
_02072E60:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x20
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072E60
_02072E78:
	ldr r1, _02072E8C ; =0x04000208
	ldrh r0, [r1]
	strh r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02072E88: .word 0x82061029
_02072E8C: .word 0x04000208
	arm_func_end sub_02072E04

	arm_func_start sub_02072E90
sub_02072E90: ; 0x02072E90
	mov r1, r1, lsl #0x10
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	mov r2, #0
	ldr r1, _02072EE4 ; =0x04000208
	strh r2, [r0, #0x48]
	ldrh r3, [r1]
	strh r2, [r1]
	ldr r1, [r0, #0xb4]
	cmp r1, #0
	beq _02072ED4
_02072EBC:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x40
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072EBC
_02072ED4:
	ldr r1, _02072EE4 ; =0x04000208
	ldrh r0, [r1]
	strh r3, [r1]
	bx lr
	.align 2, 0
_02072EE4: .word 0x04000208
	arm_func_end sub_02072E90

	arm_func_start sub_02072EE8
sub_02072EE8: ; 0x02072EE8
	ldr r2, _02072F30 ; =0x04000208
	strb r1, [r0, #0x50]
	ldrh r3, [r2]
	mov r1, #0
	strh r1, [r2]
	ldr r1, [r0, #0xb4]
	cmp r1, #0
	beq _02072F20
_02072F08:
	ldrh r0, [r1, #6]
	orr r0, r0, #0x20
	strh r0, [r1, #6]
	ldr r1, [r1, #0x154]
	cmp r1, #0
	bne _02072F08
_02072F20:
	ldr r1, _02072F30 ; =0x04000208
	ldrh r0, [r1]
	strh r3, [r1]
	bx lr
	.align 2, 0
_02072F30: .word 0x04000208
	arm_func_end sub_02072EE8

	arm_func_start sub_02072F34
sub_02072F34: ; 0x02072F34
	strb r1, [r0, #0x58]
	bx lr
	arm_func_end sub_02072F34

	arm_func_start sub_02072F3C
sub_02072F3C: ; 0x02072F3C
	stmdb sp!, {r3, lr}
	cmp r1, #0x40
	ldrb r1, [r0, #4]
	orrhs r1, r1, #1
	strhsb r1, [r0, #4]
	ldmhsia sp!, {r3, pc}
	bic r1, r1, #1
	strb r1, [r0, #4]
	bl DseVoice_ReleaseHeld
	ldmia sp!, {r3, pc}
	arm_func_end sub_02072F3C

	arm_func_start sub_02072F64
sub_02072F64: ; 0x02072F64
	bx lr
	arm_func_end sub_02072F64

	arm_func_start sub_02072F68
sub_02072F68: ; 0x02072F68
	bx lr
	arm_func_end sub_02072F68

	arm_func_start sub_02072F6C
sub_02072F6C: ; 0x02072F6C
	bx lr
	arm_func_end sub_02072F6C

	arm_func_start sub_02072F70
sub_02072F70: ; 0x02072F70
	bx lr
	arm_func_end sub_02072F70

	arm_func_start sub_02072F74
sub_02072F74: ; 0x02072F74
	strb r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x60]
	bx lr
	arm_func_end sub_02072F74

	arm_func_start sub_02072F84
sub_02072F84: ; 0x02072F84
	strb r1, [r0, #0x5a]
	mov r1, #0
	strb r1, [r0, #0x60]
	bx lr
	arm_func_end sub_02072F84

	arm_func_start sub_02072F94
sub_02072F94: ; 0x02072F94
	strb r1, [r0, #0x5b]
	mov r1, #0
	strb r1, [r0, #0x60]
	bx lr
	arm_func_end sub_02072F94

	arm_func_start sub_02072FA4
sub_02072FA4: ; 0x02072FA4
	bx lr
	arm_func_end sub_02072FA4

	arm_func_start sub_02072FA8
sub_02072FA8: ; 0x02072FA8
	bx lr
	arm_func_end sub_02072FA8

	arm_func_start sub_02072FAC
sub_02072FAC: ; 0x02072FAC
	stmdb sp!, {r3, lr}
	ldr r0, _02072FD4 ; =_022B9584
	ldr r0, [r0]
	ldr r0, [r0]
	bl DseSynth_StopChannels
	ldr r0, _02072FD4 ; =_022B9584
	ldr r0, [r0]
	ldr r0, [r0]
	bl DseSynth_ClearHeldNotes
	ldmia sp!, {r3, pc}
	.align 2, 0
_02072FD4: .word _022B9584
	arm_func_end sub_02072FAC

	arm_func_start sub_02072FD8
sub_02072FD8: ; 0x02072FD8
	ldr r0, _02072FF4 ; =_022B9584
	mov r1, #0
	ldr r0, [r0]
	ldr ip, _02072FF8 ; =DseSynth_SetBankAndSequence
	mov r2, r1
	ldr r0, [r0]
	bx ip
	.align 2, 0
_02072FF4: .word _022B9584
_02072FF8: .word DseSynth_SetBankAndSequence
	arm_func_end sub_02072FD8

	arm_func_start sub_02072FFC
sub_02072FFC: ; 0x02072FFC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl DseChannel_DeallocateVoices
	ldr r1, _02073074 ; =0x04000208
	mov r0, #0
	ldrh r5, [r1]
	strh r0, [r1]
	ldr lr, [r4, #0xb8]
	cmp lr, #0
	ldreqh r0, [r1]
	streqh r5, [r1]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, lr
	mvn r1, #0
	mov r3, r0
_02073038:
	str r1, [lr, #4]
	strb r3, [ip, #1]
	ldr r0, [ip, #8]
	cmp r0, #0
	movne ip, r0
	bne _02073038
	ldr r0, _02073078 ; =DRIVER_WORK
	ldr r1, _02073074 ; =0x04000208
	ldr r2, [r0, #0x650]
	str r2, [ip, #8]
	str lr, [r0, #0x650]
	str r3, [r4, #0xb8]
	ldrh r0, [r1]
	strh r5, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073074: .word 0x04000208
_02073078: .word DRIVER_WORK
	arm_func_end sub_02072FFC

	arm_func_start sub_0207307C
sub_0207307C: ; 0x0207307C
	mov r1, #0
	strb r1, [r0, #7]
	bx lr
	arm_func_end sub_0207307C

	arm_func_start sub_02073088
sub_02073088: ; 0x02073088
	mov r1, #1
	strb r1, [r0, #7]
	bx lr
	arm_func_end sub_02073088

	arm_func_start sub_02073094
sub_02073094: ; 0x02073094
	ldr ip, _020730A4 ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x72]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730A4: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_02073094

	arm_func_start sub_020730A8
sub_020730A8: ; 0x020730A8
	ldr ip, _020730B8 ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x6d]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730B8: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_020730A8

	arm_func_start sub_020730BC
sub_020730BC: ; 0x020730BC
	ldr ip, _020730CC ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x6e]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730CC: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_020730BC

	arm_func_start sub_020730D0
sub_020730D0: ; 0x020730D0
	ldr ip, _020730E0 ; =SoundEnvelopeParameters_CheckValidity
	strb r1, [r0, #0x71]
	add r0, r0, #0x64
	bx ip
	.align 2, 0
_020730E0: .word SoundEnvelopeParameters_CheckValidity
	arm_func_end sub_020730D0

	arm_func_start sub_020730E4
sub_020730E4: ; 0x020730E4
	ldrb r2, [r0, #0x61]
	add r1, r1, r1, lsl #2
	add r0, r0, r2, lsl #4
	strh r1, [r0, #0x7c]
	bx lr
	arm_func_end sub_020730E4

	arm_func_start sub_020730F8
sub_020730F8: ; 0x020730F8
	and r3, r1, #2
	add r2, r0, #0x74
	strb r3, [r0, #0x61]
	add r2, r2, r3, lsl #4
	mov r0, r1, asr #2
	strb r0, [r2, #1]
	add r0, r3, #1
	strb r0, [r2, #2]
	bx lr
	arm_func_end sub_020730F8

	arm_func_start sub_0207311C
sub_0207311C: ; 0x0207311C
	ldrb r2, [r0, #0x61]
	add r0, r0, r2, lsl #4
	strb r1, [r0, #0x77]
	bx lr
	arm_func_end sub_0207311C

	arm_func_start sub_0207312C
sub_0207312C: ; 0x0207312C
	ldrb r2, [r0, #0x61]
	add r0, r0, #0x74
	add r0, r0, r2, lsl #4
	ldrb r2, [r0, #2]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _020731AC
_02073148: ; jump table
	b _020731AC ; case 0
	b _0207315C ; case 1
	b _02073170 ; case 2
	b _02073184 ; case 3
	b _02073198 ; case 4
_0207315C:
	mov r2, #0xa
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_02073170:
	mvn r2, #0x13
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_02073184:
	mov r2, #0x14
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_02073198:
	mov r2, #0xa
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
	b _020731BC
_020731AC:
	mov r2, #0x14
	mul r2, r1, r2
	mov r1, r2, lsl #0x10
	mov r1, r1, asr #0x10
_020731BC:
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_0207312C

	arm_func_start sub_020731C4
sub_020731C4: ; 0x020731C4
	mov r2, #0x14
	mul r2, r1, r2
	ldrb r1, [r0, #0x61]
	add r0, r0, r1, lsl #4
	strh r2, [r0, #0x7e]
	bx lr
	arm_func_end sub_020731C4

	arm_func_start sub_020731DC
sub_020731DC: ; 0x020731DC
	mov r2, #0x14
	mul r2, r1, r2
	ldrb r1, [r0, #0x61]
	add r0, r0, r1, lsl #4
	strh r2, [r0, #0x80]
	bx lr
	arm_func_end sub_020731DC

	arm_func_start sub_020731F4
sub_020731F4: ; 0x020731F4
	strb r1, [r0, #0x59]
	bx lr
	arm_func_end sub_020731F4

	arm_func_start sub_020731FC
sub_020731FC: ; 0x020731FC
	bx lr
	arm_func_end sub_020731FC

	arm_func_start sub_02073200
sub_02073200: ; 0x02073200
	bx lr
	arm_func_end sub_02073200

	arm_func_start sub_02073204
sub_02073204: ; 0x02073204
	bx lr
	arm_func_end sub_02073204

	arm_func_start DseSynth_Reset
DseSynth_Reset: ; 0x02073208
	stmdb sp!, {r4, lr}
	ldr r1, _02073274 ; =DRIVER_WORK
	mov r2, #1
	ldrsb r3, [r1, #0x41]
	mov r4, #0
	mov r1, #0x7f
	strb r3, [r0, #2]
	strb r2, [r0, #3]
	strh r4, [r0, #4]
	strb r1, [r0, #6]
	mov r1, #0x40
	strb r1, [r0, #7]
	ldrb ip, [r0, #2]
	ldrsb r1, [r0, #6]
	ldr r2, _02073278 ; =0x81020409
	ldr r3, _0207327C ; =_022B7A30
	smulbb ip, ip, r1
	smull r1, lr, r2, ip
	add lr, ip, lr
	mov r1, ip, lsr #0x1f
	add lr, r1, lr, asr #6
	strb lr, [r0, #8]
	strb r4, [r0, #9]
	strb r4, [r0, #0xa]
	ldrh r1, [r3, #0x2e]
	strb r1, [r0, #0xb]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02073274: .word DRIVER_WORK
_02073278: .word 0x81020409
_0207327C: .word _022B7A30
	arm_func_end DseSynth_Reset

	arm_func_start DseSynth_AllocateNew
DseSynth_AllocateNew: ; 0x02073280
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0xc8
	mul r0, r5, r0
	mov r2, r1
	add r0, r0, #0x10
	mov r1, #0x10
	bl DseMem_Allocate
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	strb r1, [r4]
	strb r5, [r4, #1]
	str r1, [r4, #0xc]
	bl DseSynth_Reset
	cmp r5, #0
	add r1, r4, #0x10
	mov r2, #0
	ble _02073300
	mov r0, r2
_020732D4:
	str r0, [r1]
	strb r2, [r1, #5]
	str r0, [r1, #0xb4]
	str r0, [r1, #0xb8]
	str r0, [r1, #0xbc]
	str r0, [r1, #0xc0]
	add r2, r2, #1
	str r4, [r1, #0xc4]
	cmp r2, r5
	add r1, r1, #0xc8
	blt _020732D4
_02073300:
	ldr r1, _02073348 ; =0x04000208
	mov r0, #0
	ldrh r3, [r1]
	ldr r2, _0207334C ; =_022B7988
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	beq _02073330
_02073320:
	add r2, r0, #0xc
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _02073320
_02073330:
	ldr r1, _02073348 ; =0x04000208
	str r4, [r2]
	ldrh r0, [r1]
	mov r0, r4
	strh r3, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073348: .word 0x04000208
_0207334C: .word _022B7988
	arm_func_end DseSynth_AllocateNew

	arm_func_start DseSynth_Unload
DseSynth_Unload: ; 0x02073350
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl DseSynth_StopChannels
	ldr r2, _020733B4 ; =0x04000208
	mov r0, r5
	ldrh r4, [r2]
	mov r1, #0
	strh r1, [r2]
	bl DseSynth_ClearHeldNotes
	ldr r1, _020733B8 ; =_022B7988
	b _02073380
_0207337C:
	add r1, r0, #0xc
_02073380:
	ldr r0, [r1]
	cmp r0, #0
	cmpne r0, r5
	bne _0207337C
	cmp r0, r5
	ldreq r0, [r5, #0xc]
	ldr r2, _020733B4 ; =0x04000208
	streq r0, [r1]
	ldrh r1, [r2]
	mov r0, r5
	strh r4, [r2]
	bl DseMem_Free
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020733B4: .word 0x04000208
_020733B8: .word _022B7988
	arm_func_end DseSynth_Unload

	arm_func_start DseSynth_ClearHeldNotes
DseSynth_ClearHeldNotes: ; 0x020733BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrb r3, [r0, #1]
	add r1, r0, #0x10
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r7, _02073450 ; =0x04000208
	ldr ip, _02073454 ; =DRIVER_WORK
	mvn r5, #0
	mov r4, r2
	mov r6, r2
_020733E8:
	ldrh r3, [r7]
	strh r6, [r7]
	ldr sb, [r1, #0xb8]
	cmp sb, #0
	ldreqh lr, [r7]
	streqh r3, [r7]
	beq _02073438
	mov r8, sb
_02073408:
	str r5, [sb, #4]
	strb r4, [r8, #1]
	ldr lr, [r8, #8]
	cmp lr, #0
	movne r8, lr
	bne _02073408
	ldr lr, [ip, #0x650]
	str lr, [r8, #8]
	str sb, [ip, #0x650]
	str r4, [r1, #0xb8]
	ldrh lr, [r7]
	strh r3, [r7]
_02073438:
	ldrb r3, [r0, #1]
	add r2, r2, #1
	add r1, r1, #0xc8
	cmp r2, r3
	blt _020733E8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02073450: .word 0x04000208
_02073454: .word DRIVER_WORK
	arm_func_end DseSynth_ClearHeldNotes

	arm_func_start DseSynth_ResetAndSetBankAndSequence
DseSynth_ResetAndSetBankAndSequence: ; 0x02073458
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl DseSynth_Reset
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl DseSynth_SetBankAndSequence
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseSynth_ResetAndSetBankAndSequence

	arm_func_start DseSynth_StopChannels
DseSynth_StopChannels: ; 0x02073480
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r5, [r0, #1]
	add r4, r0, #0x10
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02073494:
	mov r0, r4
	bl DseChannel_DeallocateVoices
	subs r5, r5, #1
	add r4, r4, #0xc8
	bne _02073494
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseSynth_StopChannels

	arm_func_start DseSynth_ResetAllVoiceTimersAndVolumes
DseSynth_ResetAllVoiceTimersAndVolumes: ; 0x020734AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02073500 ; =0x04000208
	mov r2, #0
	ldrh r6, [r3]
	mov r7, r1
	add r4, r0, #0x10
	strh r2, [r3]
	strb r7, [r0, #9]
	ldrb r5, [r0, #1]
	cmp r5, #0
	beq _020734F0
_020734D8:
	mov r0, r4
	mov r1, r7
	bl DseChannel_ResetTimerAndVolumeForVoices
	subs r5, r5, #1
	add r4, r4, #0xc8
	bne _020734D8
_020734F0:
	ldr r1, _02073500 ; =0x04000208
	ldrh r0, [r1]
	strh r6, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02073500: .word 0x04000208
	arm_func_end DseSynth_ResetAllVoiceTimersAndVolumes

	arm_func_start DseSynth_RestoreHeldNotes
DseSynth_RestoreHeldNotes: ; 0x02073504
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02073568 ; =0x04000208
	ldrb r6, [r0, #1]
	ldrh r4, [r2]
	mov r1, #0
	cmp r6, #0
	strh r1, [r2]
	add r5, r0, #0x10
	beq _02073558
_02073528:
	ldr r7, [r5, #0xb8]
	cmp r7, #0
	beq _0207354C
_02073534:
	mov r0, r5
	mov r1, r7
	bl DseVoice_PlayNote
	ldr r7, [r7, #8]
	cmp r7, #0
	bne _02073534
_0207354C:
	subs r6, r6, #1
	add r5, r5, #0xc8
	bne _02073528
_02073558:
	ldr r1, _02073568 ; =0x04000208
	ldrh r0, [r1]
	strh r4, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02073568: .word 0x04000208
	arm_func_end DseSynth_RestoreHeldNotes

	arm_func_start DseSynth_SetGlobalVolumeIndex
DseSynth_SetGlobalVolumeIndex: ; 0x0207356C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _02073644 ; =_022B7370
	ldr r4, _02073648 ; =0x81020409
	ldrsb r5, [r3, r1]
	add r3, r0, #0x10
	mov ip, #0
	strb r5, [r0, #2]
	strb r1, [r0, #3]
	ldrb r5, [r0, #2]
	ldrsb r1, [r0, #6]
	smulbb r5, r5, r1
	smull r1, r6, r4, r5
	add r6, r5, r6
	mov r1, r5, lsr #0x1f
	add r6, r1, r6, asr #6
	strb r6, [r0, #8]
	ldrb r1, [r0, #1]
	cmp r1, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r6, _0207364C ; =0x04000208
	mov r5, ip
_020735C0:
	ldr r4, [r3, #0x2c]
	ldrb r1, [r3, #0x50]
	mov r4, r4, asr #0x10
	ldrsb lr, [r0, #8]
	mul r1, r4, r1
	mul r7, lr, r1
	ldr r4, _02073650 ; =0x82061029
	mov r1, r7, lsr #0x1f
	smull lr, r8, r4, r7
	add r8, r7, r8
	add r8, r1, r8, asr #13
	strh r8, [r3, #0x18]
	cmp r2, #1
	bne _0207362C
	ldrh r7, [r6]
	strh r5, [r6]
	ldr r4, [r3, #0xb4]
	cmp r4, #0
	beq _02073624
_0207360C:
	ldrh r1, [r4, #6]
	orr r1, r1, #0x20
	strh r1, [r4, #6]
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _0207360C
_02073624:
	ldrh r1, [r6]
	strh r7, [r6]
_0207362C:
	ldrb r1, [r0, #1]
	add ip, ip, #1
	add r3, r3, #0xc8
	cmp ip, r1
	blt _020735C0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02073644: .word _022B7370
_02073648: .word 0x81020409
_0207364C: .word 0x04000208
_02073650: .word 0x82061029
	arm_func_end DseSynth_SetGlobalVolumeIndex

	arm_func_start DseSynth_SetBend
DseSynth_SetBend: ; 0x02073654
	stmdb sp!, {r3, r4, r5, lr}
	strh r1, [r0, #4]
	ldrb r3, [r0, #1]
	add r1, r0, #0x10
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr lr, _020736E4 ; =0x04000208
	mov ip, r2
_02073678:
	ldr r3, [r1, #0x1c]
	ldrsh r4, [r1, #0x54]
	mov r3, r3, asr #0x10
	mov r3, r3, lsl #0x10
	ldrsh r5, [r0, #4]
	add r3, r4, r3, asr #16
	add r3, r5, r3
	strh r3, [r1, #0x16]
	ldrh r5, [lr]
	strh ip, [lr]
	ldr r4, [r1, #0xb4]
	cmp r4, #0
	beq _020736C4
_020736AC:
	ldrh r3, [r4, #6]
	orr r3, r3, #0x10
	strh r3, [r4, #6]
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _020736AC
_020736C4:
	ldrh r3, [lr]
	add r2, r2, #1
	add r1, r1, #0xc8
	strh r5, [lr]
	ldrb r3, [r0, #1]
	cmp r2, r3
	blt _02073678
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020736E4: .word 0x04000208
	arm_func_end DseSynth_SetBend

	arm_func_start DseSynth_SetVolume
DseSynth_SetVolume: ; 0x020736E8
	stmdb sp!, {r4, r5, r6, lr}
	strb r1, [r0, #6]
	ldrb r4, [r0, #2]
	ldrsb r2, [r0, #6]
	ldr r3, _020737AC ; =0x81020409
	add r1, r0, #0x10
	smulbb r4, r4, r2
	smull r2, r5, r3, r4
	add r5, r4, r5
	mov r2, r4, lsr #0x1f
	add r5, r2, r5, asr #6
	strb r5, [r0, #8]
	ldrb r3, [r0, #1]
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r4, r5, r6, pc}
	ldr r4, _020737B0 ; =0x04000208
	ldr ip, _020737B4 ; =0x82061029
	mov lr, r2
_02073734:
	ldr r5, [r1, #0x2c]
	ldrb r3, [r1, #0x50]
	mov r5, r5, asr #0x10
	ldrsb r6, [r0, #8]
	mul r3, r5, r3
	mul r5, r6, r3
	smull r3, r6, ip, r5
	add r6, r5, r6
	mov r3, r5, lsr #0x1f
	add r6, r3, r6, asr #13
	strh r6, [r1, #0x18]
	ldrh r6, [r4]
	strh lr, [r4]
	ldr r5, [r1, #0xb4]
	cmp r5, #0
	beq _0207378C
_02073774:
	ldrh r3, [r5, #6]
	orr r3, r3, #0x20
	strh r3, [r5, #6]
	ldr r5, [r5, #0x154]
	cmp r5, #0
	bne _02073774
_0207378C:
	ldrh r3, [r4]
	add r2, r2, #1
	add r1, r1, #0xc8
	strh r6, [r4]
	ldrb r3, [r0, #1]
	cmp r2, r3
	blt _02073734
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020737AC: .word 0x81020409
_020737B0: .word 0x04000208
_020737B4: .word 0x82061029
	arm_func_end DseSynth_SetVolume

	arm_func_start DseSynth_SetPan
DseSynth_SetPan: ; 0x020737B8
	stmdb sp!, {r3, r4, r5, lr}
	strb r1, [r0, #7]
	ldrb r3, [r0, #1]
	add r1, r0, #0x10
	mov r2, #0
	cmp r3, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr lr, _02073848 ; =0x04000208
	mov ip, r2
_020737DC:
	ldr r3, [r1, #0xc4]
	ldr r4, [r1, #0x3c]
	ldrsb r3, [r3, #7]
	mov r4, r4, asr #0x10
	and r4, r4, #0xff
	sub r3, r3, #0x40
	add r3, r4, r3
	strh r3, [r1, #0x1a]
	ldrh r5, [lr]
	strh ip, [lr]
	ldr r4, [r1, #0xb4]
	cmp r4, #0
	beq _02073828
_02073810:
	ldrh r3, [r4, #6]
	orr r3, r3, #0x40
	strh r3, [r4, #6]
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _02073810
_02073828:
	ldrh r3, [lr]
	add r2, r2, #1
	add r1, r1, #0xc8
	strh r5, [lr]
	ldrb r3, [r0, #1]
	cmp r2, r3
	blt _020737DC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073848: .word 0x04000208
	arm_func_end DseSynth_SetPan

	arm_func_start DseSynth_SetBankAndSequence
DseSynth_SetBankAndSequence: ; 0x0207384C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r3, _020738D8 ; =DRIVER_WORK
	mov sl, r0
	ldrsb r6, [r3, #0x3d]
	mov r7, #0
	mov sb, r1
	strb r7, [r3, #0x3d]
	ldrb r0, [sl, #1]
	mov r8, r2
	add r5, sl, #0x10
	cmp r0, #0
	ble _020738CC
	mov r0, sb, lsl #0x10
	mov r4, r0, lsr #0x10
_02073884:
	mov r0, r5
	bl DseChannel_DeallocateVoices
	mov r0, r5
	mov r1, r8
	bl DseChannel_Init
	cmp sb, #0
	blt _020738B8
	mov r0, r5
	mov r1, r4
	bl DseChannel_SetBank
	mov r0, r5
	mov r1, r4
	bl DseChannel_SetInstrument
_020738B8:
	ldrb r0, [sl, #1]
	add r7, r7, #1
	add r5, r5, #0xc8
	cmp r7, r0
	blt _02073884
_020738CC:
	ldr r0, _020738D8 ; =DRIVER_WORK
	strb r6, [r0, #0x3d]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020738D8: .word DRIVER_WORK
	arm_func_end DseSynth_SetBankAndSequence

	arm_func_start DseChannel_Init
DseChannel_Init: ; 0x020738DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	str r1, [r4]
	mov r0, #0
	strb r0, [r4, #4]
	strb r0, [r4, #6]
	mov r1, #1
	strb r1, [r4, #7]
	ldr r1, _02073A80 ; =_022B7A30
	strb r0, [r4, #8]
	ldrh r3, [r1, #0x2e]
	ldr r1, _02073A84 ; =DRIVER_WORK
	mov r2, #0x7f
	strb r3, [r4, #9]
	strh r0, [r4, #0xa]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	add r1, r1, #0x600
	ldrsb ip, [r1, #0x74]
	ldrsb r3, [r1, #0x94]
	add r3, r3, ip, lsl #8
	strh r3, [r4, #0xe]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
	str r0, [r4, #0x1c]
	strh r0, [r4, #0x28]
	ldrsb r3, [r1, #0x7b]
	mov r3, r3, lsl #0x10
	str r3, [r4, #0x2c]
	strh r0, [r4, #0x38]
	ldrsb r3, [r1, #0x7e]
	mov r3, r3, lsl #0x10
	str r3, [r4, #0x3c]
	strh r0, [r4, #0x48]
	strh r0, [r4, #0x54]
	ldrsb r3, [r1, #0x7f]
	strb r3, [r4, #0x50]
	ldrsb r1, [r1, #0x75]
	strb r1, [r4, #0x51]
	strh r0, [r4, #0x52]
	strh r0, [r4, #0x56]
	strb r2, [r4, #0x58]
	strb r0, [r4, #0x59]
	strb r0, [r4, #0x5a]
	strb r0, [r4, #0x5b]
	strb r0, [r4, #0x5c]
	strb r0, [r4, #0x5d]
	strb r0, [r4, #0x5e]
	strb r0, [r4, #0x5f]
	strb r0, [r4, #0x60]
	mov r2, r0
_020739A8:
	add r1, r4, r0, lsl #4
	strb r2, [r1, #0x75]
	add r0, r0, #1
	strb r2, [r1, #0x76]
	cmp r0, #4
	blt _020739A8
	add r0, r4, #0x64
	bl SoundEnvelopeParameters_Reset
	mov r0, #0
	ldr r1, _02073A88 ; =0x04000208
	str r0, [r4, #0xb4]
	ldrh r5, [r1]
	strh r0, [r1]
	ldr lr, [r4, #0xb8]
	cmp lr, #0
	ldreqh r0, [r1]
	streqh r5, [r1]
	beq _02073A34
	mov ip, lr
	mvn r1, #0
	mov r3, r0
_020739FC:
	str r1, [lr, #4]
	strb r3, [ip, #1]
	ldr r0, [ip, #8]
	cmp r0, #0
	movne ip, r0
	bne _020739FC
	ldr r0, _02073A84 ; =DRIVER_WORK
	ldr r1, _02073A88 ; =0x04000208
	ldr r2, [r0, #0x650]
	str r2, [ip, #8]
	str lr, [r0, #0x650]
	str r3, [r4, #0xb8]
	ldrh r0, [r1]
	strh r5, [r1]
_02073A34:
	mov r1, #0
	str r1, [r4, #0xbc]
	ldr r0, _02073A84 ; =DRIVER_WORK
	str r1, [r4, #0xc0]
	strh r1, [r4, #0x16]
	add r0, r0, #0x600
	ldrsb r3, [r0, #0x7b]
	ldrsb r0, [r0, #0x7f]
	ldr r1, _02073A8C ; =0x82061029
	mov r2, #0x40
	smulbb r0, r3, r0
	rsb r3, r0, r0, lsl #7
	smull r0, ip, r1, r3
	add ip, r3, ip
	mov r0, r3, lsr #0x1f
	add ip, r0, ip, asr #13
	strh ip, [r4, #0x18]
	strh r2, [r4, #0x1a]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02073A80: .word _022B7A30
_02073A84: .word DRIVER_WORK
_02073A88: .word 0x04000208
_02073A8C: .word 0x82061029
	arm_func_end DseChannel_Init

	arm_func_start DseChannel_DeallocateVoices
DseChannel_DeallocateVoices: ; 0x02073A90
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, [r0, #0xb4]
	mov r1, #0
	str r1, [r0, #0xb4]
	cmp r6, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r8, _02073B10 ; =_022B7A30
	mov r5, r1
	mov r4, r1
_02073AB4:
	ldr r7, [r6, #0x154]
	add r0, r6, #0x3c
	strh r5, [r6, #4]
	str r5, [r6, #0x158]
	str r5, [r6, #0x154]
	bl SoundEnvelope_Stop
	ldr r0, [r6, #0x14c]
	cmp r7, #0
	and r0, r0, #0xff
	str r0, [r6, #0x14c]
	str r4, [r6]
	strh r4, [r6, #0x18]
	ldrh r2, [r6, #0xa]
	ldrh r1, [r8, #0x32]
	mov r6, r7
	mvn r0, r2
	and r0, r1, r0
	strh r0, [r8, #0x32]
	ldrh r0, [r8, #0x36]
	orr r0, r0, r2
	strh r0, [r8, #0x36]
	bne _02073AB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02073B10: .word _022B7A30
	arm_func_end DseChannel_DeallocateVoices

	arm_func_start DseChannel_ResetTimerAndVolumeForVoices
DseChannel_ResetTimerAndVolumeForVoices: ; 0x02073B14
	cmp r1, #1
	bne _02073B5C
	ldrb r1, [r0, #4]
	orr r1, r1, #0x40
	strb r1, [r0, #4]
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	bxeq lr
	mov r1, #0
_02073B38:
	str r1, [r2, #0x13c]
	str r1, [r2, #0x140]
	ldrh r0, [r2, #6]
	orr r0, r0, #0x30
	strh r0, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02073B38
	bx lr
_02073B5C:
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	beq _02073B80
_02073B68:
	ldrh r1, [r2, #6]
	orr r1, r1, #0x30
	strh r1, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02073B68
_02073B80:
	ldrb r1, [r0, #4]
	bic r1, r1, #0x40
	strb r1, [r0, #4]
	bx lr
	arm_func_end DseChannel_ResetTimerAndVolumeForVoices

	arm_func_start DseChannel_SetBank
DseChannel_SetBank: ; 0x02073B90
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	strh r1, [r4, #0xe]
	bl DseSwd_GetBankById
	str r0, [r4, #0xbc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0xc0]
	ldmeqia sp!, {r4, pc}
	ldrh r1, [r4, #0x10]
	mov r0, r4
	bl DseChannel_SetInstrument
	ldmia sp!, {r4, pc}
	arm_func_end DseChannel_SetBank

	arm_func_start DseChannel_SetInstrument
DseChannel_SetInstrument: ; 0x02073BC8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	ldr r0, [r5, #0xbc]
	mov r4, r1
	cmp r0, #0
	bne _02073BF0
	mov r0, #0
	str r0, [r5, #0xc0]
	strh r0, [r5, #0x10]
	b _02073C4C
_02073BF0:
	mov r0, r4, lsl #0x10
	mov r1, r0, asr #0x10
	strh r1, [r5, #0x10]
	ldr r0, [r5, #0xbc]
	bl DseSwd_GetInstrument
	movs lr, r0
	beq _02073C48
	mov r6, #0
	strb r6, [r5, #0x59]
	add r7, lr, #0x10
	add r8, r5, #0x74
	mov ip, r6
_02073C20:
	ldrb r0, [r7, #1]
	add r6, r6, #1
	cmp r0, #0
	ldmneia r7, {r0, r1, r2, r3}
	stmneia r8, {r0, r1, r2, r3}
	streqb ip, [r8, #1]
	cmp r6, #4
	add r7, r7, #0x10
	add r8, r8, #0x10
	blt _02073C20
_02073C48:
	str lr, [r5, #0xc0]
_02073C4C:
	add r0, r5, #0x64
	bl SoundEnvelopeParameters_Reset
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end DseChannel_SetInstrument

	arm_func_start DseChannel_SetLfoConstEnvelopeLevel
DseChannel_SetLfoConstEnvelopeLevel: ; 0x02073C5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	strb r5, [r0, #0x51]
	ldr r4, [r0, #0xb4]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02073C74:
	mov r1, r5
	add r0, r4, #0x5c
	bl SoundLfoBank_SetConstEnvelopes
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _02073C74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseChannel_SetLfoConstEnvelopeLevel

	arm_func_start DseChannel_SetKeyBend
DseChannel_SetKeyBend: ; 0x02073C90
	strh r1, [r0, #0x52]
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	bxeq lr
	mov r3, r1, lsl #8
_02073CA4:
	ldrb r0, [r2, #0xf]
	mul r1, r0, r3
	mov r0, r1, asr #0xc
	add r0, r1, r0, lsr #19
	mov r0, r0, asr #0xd
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #6]
	orr r0, r0, #0x10
	strh r0, [r2, #6]
	ldr r2, [r2, #0x154]
	cmp r2, #0
	bne _02073CA4
	bx lr
	arm_func_end DseChannel_SetKeyBend

	arm_func_start DseChannel_AllocateNote
DseChannel_AllocateNote: ; 0x02073CD8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrb r2, [r5, #0xd]
	mov r4, r1
	cmp r2, #0
	beq _02073D18
	ldrb r0, [r5, #0xc]
	sub r0, r2, r0
	add r6, r0, #1
	bl DseUtil_GetRandomNumber
	mul r1, r6, r0
	mov r0, r1, asr #0xe
	ldrb r2, [r5, #0xc]
	add r0, r1, r0, lsr #17
	add r0, r2, r0, asr #15
	strb r0, [r4, #2]
_02073D18:
	ldr r1, _02073D64 ; =DRIVER_WORK
	ldr r0, [r1, #0x650]
	cmp r0, #0
	moveq r0, #0
	ldrne r2, [r0, #8]
	strne r2, [r1, #0x650]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r3, [r4]
	ldr r2, [r4, #4]
	mov r1, #1
	str r3, [r0]
	str r2, [r0, #4]
	strb r1, [r0, #1]
	ldr r1, [r5, #0xb8]
	str r1, [r0, #8]
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02073D64: .word DRIVER_WORK
	arm_func_end DseChannel_AllocateNote

	arm_func_start DseChannel_ReleaseNoteInternal
DseChannel_ReleaseNoteInternal: ; 0x02073D68
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r4, [r7, #0xb8]
	mov r6, r1
	cmp r4, #0
	add r5, r7, #0xb8
	beq _02073DE4
	ldrb r1, [r6, #2]
_02073D88:
	ldrb r0, [r4, #2]
	cmp r0, r1
	bne _02073DD4
	ldr r8, [r7, #0xb4]
	cmp r8, #0
	beq _02073DC8
_02073DA0:
	ldrb r1, [r8, #0xd]
	ldrb r0, [r6, #2]
	cmp r1, r0
	bne _02073DBC
	mov r0, r7
	mov r1, r8
	bl DseVoice_Release
_02073DBC:
	ldr r8, [r8, #0x154]
	cmp r8, #0
	bne _02073DA0
_02073DC8:
	ldr r0, [r4, #8]
	str r0, [r5]
	b _02073DE4
_02073DD4:
	add r5, r4, #8
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _02073D88
_02073DE4:
	ldr r0, _02073E0C ; =DRIVER_WORK
	mvn r2, #0
	ldr r3, [r0, #0x650]
	mov r1, #0
	str r3, [r4, #8]
	str r4, [r0, #0x650]
	str r2, [r4, #4]
	mov r0, r4
	strb r1, [r4, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02073E0C: .word DRIVER_WORK
	arm_func_end DseChannel_ReleaseNoteInternal

	arm_func_start DseChannel_ChangeNote
DseChannel_ChangeNote: ; 0x02073E10
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb8]
	cmp r4, #0
	beq _02073E54
_02073E20:
	ldrb r3, [r4, #2]
	cmp r3, r2
	bne _02073E48
	ldr lr, [r1]
	ldr ip, [r1, #4]
	mov r3, #1
	str lr, [r4]
	str ip, [r4, #4]
	strb r3, [r4, #1]
	b _02073E54
_02073E48:
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _02073E20
_02073E54:
	ldr ip, [r0, #0xb4]
	cmp ip, #0
	ldmeqia sp!, {r4, pc}
_02073E60:
	ldrb r0, [ip, #0xd]
	cmp r0, r2
	bne _02073E90
	ldrb r0, [r1, #2]
	strb r0, [ip, #0xd]
	ldrb r3, [r1, #2]
	ldrsh r0, [ip, #0x14]
	add r0, r0, r3, lsl #8
	strh r0, [ip, #0x12]
	ldrh r0, [ip, #6]
	orr r0, r0, #0x10
	strh r0, [ip, #6]
_02073E90:
	ldr ip, [ip, #0x154]
	cmp ip, #0
	bne _02073E60
	ldmia sp!, {r4, pc}
	arm_func_end DseChannel_ChangeNote

	arm_func_start DseChannel_ReleaseNote
DseChannel_ReleaseNote: ; 0x02073EA0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb8]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r3, [r1, #2]
_02073EB4:
	ldrb r1, [r2, #2]
	cmp r1, r3
	bne _02073ECC
	mov r1, r2
	bl DseChannel_ReleaseNoteInternal
	ldmia sp!, {r3, pc}
_02073ECC:
	ldr r2, [r2, #8]
	cmp r2, #0
	bne _02073EB4
	ldmia sp!, {r3, pc}
	arm_func_end DseChannel_ReleaseNote

	arm_func_start DseVoice_PlayNote
DseVoice_PlayNote: ; 0x02073EDC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldrsh r4, [sl, #0xa]
	mov sb, r1
	cmp r4, #0
	moveq r0, #0
	streq r0, [sp]
	beq _02073F28
	bl DseUtil_GetRandomNumber
	mov r1, r4, lsl #1
	mul r2, r1, r0
	mov r0, r2, asr #0xe
	ldrsh r1, [sl, #0xa]
	add r0, r2, r0, lsr #17
	rsb r0, r1, r0, asr #15
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp]
_02073F28:
	ldr r6, [sl, #0xc0]
	cmp r6, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sl, #0xbc]
	mov r5, #0
_02073F40:
	ldrb r2, [sb, #2]
	ldrsb r3, [sb, #3]
	mov r0, r6
	mov r1, r5
	bl DseSwd_GetNextSplitInRange
	movs r5, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r3, [r5, #0x1a]
	ldrb r0, [r7, #0xc]
	ldr r2, [r7, #0x18]
	cmp r3, r0
	movge r3, #0
	add r1, r2, r3, lsl #3
	ldr r2, [r2, r3, lsl #3]
	ldr r1, [r1, #4]
	mov r0, r7
	str r2, [sp, #4]
	str r1, [sp, #8]
	ldrsh r1, [r5, #0x12]
	bl ReadWaviEntry
	movs fp, r0
	beq _02073F40
	ldrb r3, [sl, #5]
	ldrb r2, [r5, #0x1a]
	mov r0, sl
	add r1, sp, #4
	add r8, r2, r3, lsl #8
	ldrb r3, [sp, #7]
	mov r2, r8
	bl DseVoice_Allocate
	movs r4, r0
	beq _02073F40
	mov r0, #0
	strh r0, [r4, #4]
	ldr r0, [sl]
	add fp, fp, #0x10
	str r0, [r4]
	strh r8, [r4, #0x18]
	ldrsh r0, [r5, #0x12]
	add ip, r4, #0x1c
	strb r0, [r4, #0xe]
	ldmia fp!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia fp, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, [r4, #0x30]
	ldr r0, [r7, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x30]
	ldrb r0, [sb, #2]
	strb r0, [r4, #0xd]
	ldrsb r1, [r5, #0x17]
	ldrsh r0, [r5, #0x14]
	add r1, r0, r1, lsl #8
	ldr r0, [sp]
	add r0, r0, r1
	strh r0, [r4, #0x14]
	ldrb r1, [sb, #2]
	ldrsh r0, [r4, #0x14]
	add r0, r0, r1, lsl #8
	strh r0, [r4, #0x12]
	ldrb r0, [r5, #0x19]
	strb r0, [r4, #0x17]
	ldr r0, _02074144 ; =DRIVER_WORK
	ldrb r0, [r0, #0x39]
	cmp r0, #7
	bne _02074084
	ldrb r1, [sl, #0x58]
	ldrb r0, [sb, #3]
	ldrb r2, [r6, #4]
	ldrb r3, [r5, #0x18]
	smulbb r0, r1, r0
	mul r0, r2, r0
	mul r2, r3, r0
	ldr r0, _02074148 ; =0x4186143D
	smull r1, r3, r0, r2
	mov r0, r2, lsr #0x1f
	add r3, r0, r3, asr #19
	strb r3, [r4, #0x16]
	b _020740B0
_02074084:
	ldrb r1, [sb, #3]
	ldrb r0, [r6, #4]
	ldrb r2, [r5, #0x18]
	smulbb r0, r1, r0
	mul r3, r2, r0
	ldr r0, _0207414C ; =0x82061029
	smull r1, r2, r0, r3
	add r2, r3, r2
	mov r0, r3, lsr #0x1f
	add r2, r0, r2, asr #13
	strb r2, [r4, #0x16]
_020740B0:
	ldrb r2, [sl, #0x59]
	ldrsh r3, [sl, #0x52]
	add r0, r4, #0x5c
	cmp r2, #0
	ldreqb r2, [r5, #2]
	mov r3, r3, lsl #8
	add r1, sl, #0x74
	mul r8, r2, r3
	mov r3, r8, asr #0xc
	add r3, r8, r3, lsr #19
	mov r3, r3, asr #0xd
	strh r3, [r4, #0x10]
	strb r2, [r4, #0xf]
	ldrh r2, [r4, #6]
	orr r2, r2, #0xff0
	strh r2, [r4, #6]
	ldrsb r2, [sl, #0x51]
	bl SoundLfoBank_Set
	add r0, r5, #0x20
	add r8, r4, #0x3c
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	mov r0, #1
	strb r0, [r4, #0x3c]
	ldrb r0, [sl, #0x64]
	cmp r0, #0
	beq _02074128
	mov r0, r8
	add r1, sl, #0x64
	bl SoundEnvelope_SetParameters
_02074128:
	mov r1, r4
	mov r0, sl
	ldrb r2, [sp, #7]
	bl DseVoice_Start
	b _02073F40
_0207413C:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02074144: .word DRIVER_WORK
_02074148: .word 0x4186143D
_0207414C: .word 0x82061029
	arm_func_end DseVoice_PlayNote

	arm_func_start DseVoice_ReleaseNote
DseVoice_ReleaseNote: ; 0x02074150
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_02074168:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r5, #2]
	cmp r1, r0
	bne _02074184
	mov r0, r6
	mov r1, r4
	bl DseVoice_Release
_02074184:
	ldr r4, [r4, #0x154]
	cmp r4, #0
	bne _02074168
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DseVoice_ReleaseNote

	arm_func_start DseVoice_UpdateParameters
DseVoice_UpdateParameters: ; 0x02074194
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr fp, _0207431C ; =_022B7A30
	ldr r7, _02074320 ; =_022B7A6C
	ldrh r0, [fp, #0x2e]
	mov sb, #0
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r6, _02074324 ; =_020B1310
	ldr r5, _02074328 ; =_020B1394
	ldr r4, _0207432C ; =0x00FFB0FF
_020741BC:
	ldr r8, [r7, #0x158]
	cmp r8, #0
	beq _02074304
	ldrh sl, [r7, #6]
	cmp sl, #0
	beq _02074300
	tst sl, #0x10
	beq _02074264
	ldrh r2, [r8, #0x16]
	ldrsh r1, [r7, #0x12]
	ldrsh r3, [r7, #0x10]
	ldrsh r0, [r7, #0x5e]
	add r1, r2, r1
	add r1, r3, r1
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, asr #8
	and r0, r0, #0x7f
	ldrb r0, [r6, r0]
	and r2, r1, #0xff
	mov r1, r0, lsl #0x1c
	add r1, r2, r1, lsr #20
	mov r1, r1, lsl #1
	mov r0, r0, asr #4
	ldrh r1, [r5, r1]
	rsbs r0, r0, #4
	movpl r1, r1, lsr r0
	rsbmi r0, r0, #0
	movmi r1, r1, lsl r0
	ldrb r0, [r7, #0x1f]
	cmp r0, #3
	mov r0, r4
	blo _0207425C
	mov r2, r1, asr #3
	add r1, r1, r2, lsr #28
	mov r1, r1, asr #4
	bl _s32_div_f
	str r0, [r7, #0x13c]
	b _02074264
_0207425C:
	bl _s32_div_f
	str r0, [r7, #0x13c]
_02074264:
	tst sl, #0x20
	beq _020742C4
	ldrb r1, [r7, #0x16]
	ldrsh r0, [r7, #0x60]
	add r1, r1, r0, asr #6
	cmp r1, #0x7f
	movgt r1, #0x7f
	bgt _0207428C
	cmp r1, #0
	movlt r1, #0
_0207428C:
	ldrh r0, [r8, #0x18]
	ldrb r2, [r7, #0x14c]
	mul r1, r0, r1
	mul r3, r2, r1
	ldr r0, _02074330 ; =0x828CBFBF
	smull r1, r2, r0, r3
	add r2, r3, r2
	mov r0, r3, lsr #0x1f
	add r2, r0, r2, asr #12
	mul r1, r2, r2
	mov r0, r1, asr #8
	add r0, r1, r0, lsr #23
	mov r0, r0, asr #9
	str r0, [r7, #0x140]
_020742C4:
	tst sl, #0x40
	beq _02074300
	ldrsb r1, [r7, #0x17]
	ldrsh r2, [r8, #0x1a]
	ldrsh r0, [r7, #0x62]
	sub r1, r1, #0x40
	add r1, r2, r1
	adds r1, r1, r0, asr #6
	ldr r0, _02074334 ; =_022B8330
	movmi r1, #0
	cmp r1, #0x7f
	ldr r0, [r0, #0xed4]
	movgt r1, #0x7f
	ldrb r0, [r0, r1]
	str r0, [r7, #0x144]
_02074300:
	strh sl, [r7, #6]
_02074304:
	ldrh r0, [fp, #0x2e]
	add sb, sb, #1
	add r7, r7, #0x15c
	cmp sb, r0
	blt _020741BC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207431C: .word _022B7A30
_02074320: .word _022B7A6C
_02074324: .word _020B1310
_02074328: .word _020B1394
_0207432C: .word 0x00FFB0FF
_02074330: .word 0x828CBFBF
_02074334: .word _022B8330
	arm_func_end DseVoice_UpdateParameters

	arm_func_start DseVoice_ResetAll
DseVoice_ResetAll: ; 0x02074338
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr sl, _020743D0 ; =_022B7A30
	mov r8, #0
	ldrh r0, [sl, #0x2e]
	cmp r0, #0
	ble _020743C0
	ldr sb, _020743D4 ; =_022B7A6C
	mov r7, r8
	mov r6, #1
	mov r5, #0x40
	mov r4, r8
_02074364:
	strh r7, [sb, #4]
	strh r7, [sb, #6]
	mov r0, r6, lsl r8
	strh r8, [sb, #8]
	strh r0, [sb, #0xa]
	str r7, [sb]
	str r7, [sb, #0x14c]
	strb r7, [sb, #0xd]
	strb r7, [sb, #0xe]
	strh r7, [sb, #0x12]
	strb r7, [sb, #0x16]
	add r0, sb, #0x3c
	strb r5, [sb, #0x17]
	bl SoundEnvelope_Reset
	add r0, sb, #0x5c
	bl SoundLfoBank_Reset
	str r4, [sb, #0x154]
	str r4, [sb, #0x158]
	ldrh r0, [sl, #0x2e]
	add r8, r8, #1
	add sb, sb, #0x15c
	cmp r8, r0
	blt _02074364
_020743C0:
	ldr r0, _020743D8 ; =DRIVER_WORK
	mov r1, #0
	str r1, [r0, #0x654]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020743D0: .word _022B7A30
_020743D4: .word _022B7A6C
_020743D8: .word DRIVER_WORK
	arm_func_end DseVoice_ResetAll

	arm_func_start DseVoice_ResetHW
DseVoice_ResetHW: ; 0x020743DC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ble _02074414
	ldr r1, _0207447C ; =_022B7A30
	mov r2, #0x10
	strh r2, [r1, #0x2c]
	cmp r0, #0x10
	movgt r0, r2, lsl #0x10
	ldr r2, _0207447C ; =_022B7A30
	movgt r0, r0, asr #0x10
	strh r0, [r2, #0x2e]
	ldr r1, _02074480 ; =_022B8330
	mov r0, #0
	strb r0, [r1, #0xd0c]
_02074414:
	ldr r2, _0207447C ; =_022B7A30
	mov r0, #0
	strh r0, [r2, #0x32]
	strh r0, [r2, #0x34]
	ldr r1, _02074484 ; =DRIVER_WORK
	strh r0, [r2, #0x36]
	strb r0, [r1, #0x738]
	strb r0, [r1, #0x739]
	ldr ip, _02074480 ; =_022B8330
	strh r0, [r2, #0x30]
	str r0, [ip, #0xcfc]
	str r0, [ip, #0xd00]
	sub r2, r0, #1
	str r2, [ip, #0xd04]
	ldrsh lr, [r1, #0x28]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str lr, [ip, #0xd08]
	bl sub_0207C8B8
	ldr r0, _02074488 ; =0x0000FFFF
	mov r3, #0
	mov r1, r0
	mov r2, r0
	bl sub_0207C8E0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207447C: .word _022B7A30
_02074480: .word _022B8330
_02074484: .word DRIVER_WORK
_02074488: .word 0x0000FFFF
	arm_func_end DseVoice_ResetHW

	arm_func_start UpdateChannels
UpdateChannels: ; 0x0207448C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _02074570 ; =_022B7A30
	mov r7, #0
	ldrh r0, [sb, #0x2e]
	mov r6, r7
	ldr r5, _02074574 ; =_022B7A6C
	cmp r0, #0
	ble _0207452C
	mov r4, #2
_020744B0:
	add r0, r5, #0x3c
	bl SoundEnvelope_Tick
	ldrsb r1, [r5, #0x5a]
	mov r8, r0
	cmp r1, #1
	bne _02074514
	add r0, r5, #0x5c
	bl SoundLfoBank_Tick
	ldrh r1, [r5, #6]
	orr r0, r1, r0
	strh r0, [r5, #6]
	ldrb r0, [r5, #0x58]
	cmp r0, #8
	bne _020744F8
	strb r4, [r5, #0x58]
	ldrh r0, [r5, #6]
	orr r0, r0, #2
	strh r0, [r5, #6]
_020744F8:
	ldrb r0, [r5, #0x14c]
	cmp r0, r8
	ldrneh r0, [r5, #6]
	orrne r0, r0, #0x20
	strneh r0, [r5, #6]
	cmp r8, #0
	addgt r7, r7, #1
_02074514:
	strb r8, [r5, #0x14c]
	ldrh r0, [sb, #0x2e]
	add r6, r6, #1
	add r5, r5, #0x15c
	cmp r6, r0
	blt _020744B0
_0207452C:
	ldr r0, _02074578 ; =_022B8330
	ldr r1, [r0, #0xd04]
	cmp r1, #0
	movlt r1, #0
	strlt r1, [r0, #0xd00]
	ldr r0, _02074578 ; =_022B8330
	str r7, [r0, #0xcfc]
	ldr r1, [r0, #0xd00]
	cmp r1, r7
	strlt r7, [r0, #0xd00]
	movlt r1, #0x64
	strlt r1, [r0, #0xd04]
	ldr r0, _02074578 ; =_022B8330
	ldr r1, [r0, #0xd04]
	sub r1, r1, #1
	str r1, [r0, #0xd04]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02074570: .word _022B7A30
_02074574: .word _022B7A6C
_02074578: .word _022B8330
	arm_func_end UpdateChannels

	arm_func_start DseVoice_Cleanup
DseVoice_Cleanup: ; 0x0207457C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _02074610 ; =_022B7A6C
	bl sub_0207D470
	ldr r4, _02074614 ; =_022B7A30
	mov r0, r0, lsl #0x10
	ldrh r2, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	mov r7, #0
	orr r0, r2, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	cmp r1, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r5, r7
_020745B4:
	ldrsb r0, [r6, #0x5a]
	cmp r0, #1
	bne _020745DC
	tst r8, #1
	bne _020745F0
	add r0, r6, #0x3c
	bl SoundEnvelope_Stop2
	add r0, r6, #0x100
	strh r5, [r0, #0x4c]
	b _020745F0
_020745DC:
	and r0, r8, #1
	cmp r0, #1
	bne _020745F0
	mov r0, r6
	bl DseVoice_FlagForDeactivation
_020745F0:
	ldrh r1, [r4, #0x2e]
	mov r0, r8, lsl #0xf
	add r7, r7, #1
	cmp r7, r1
	mov r8, r0, lsr #0x10
	add r6, r6, #0x15c
	blt _020745B4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02074610: .word _022B7A6C
_02074614: .word _022B7A30
	arm_func_end DseVoice_Cleanup

	arm_func_start DseVoice_Allocate
DseVoice_Allocate: ; 0x02074618
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _02074774 ; =_022B7A30
	mov r3, r3, lsl #0x10
	ldrh r5, [r4, #0x2e]
	add r3, r3, #0xff
	add r8, r3, #0x100
	ldrb r4, [r1, #5]
	sub r5, r5, #1
	ldrb r3, [r0, #7]
	cmp r4, r5
	movgt r4, r5
	ldrb r7, [r1, #4]
	mov r6, #0
	cmp r3, #0
	beq _02074660
	cmp r3, #1
	beq _0207466C
	b _0207476C
_02074660:
	ldr r6, [r0, #0xb4]
	cmp r6, #0
	bne _0207476C
_0207466C:
	ldrb r3, [r1]
	cmp r3, #0
	beq _02074708
	ldr r5, _02074778 ; =_022B7A6C
	mov r3, #0x15c
	mla r3, r7, r3, r5
	mov ip, r7
	mov lr, r4
	mov r5, r8
	cmp r7, r4
	mov r6, #0
	bgt _020746E4
	ldr r0, [r0]
_020746A0:
	ldr sb, [r3]
	cmp sb, r0
	ldreqh sb, [r3, #0x18]
	cmpeq sb, r2
	bne _020746D4
	ldr sb, [r3, #0x14c]
	add r6, r6, #1
	cmp r5, sb
	movhi r5, sb
	ldrb sb, [r1, #2]
	movhi lr, ip
	cmp r6, sb
	bge _020746E4
_020746D4:
	add ip, ip, #1
	cmp ip, r4
	add r3, r3, #0x15c
	ble _020746A0
_020746E4:
	ldrb r0, [r1, #2]
	cmp r6, r0
	blt _02074708
	ldr r1, _02074778 ; =_022B7A6C
	mov r0, #0x15c
	mla r6, lr, r0, r1
	mov r0, r6
	bl DseVoice_Deallocate
	b _0207476C
_02074708:
	cmp r7, r4
	add r2, r4, #1
	bgt _0207474C
	ldr r1, _0207477C ; =DRIVER_WORK
	mov r0, #0x15c
	mla r1, r7, r0, r1
_02074720:
	ldr r0, [r1, #0x888]
	cmp r8, r0
	bls _0207473C
	mov r2, r7
	cmp r0, #0
	beq _0207474C
	mov r8, r0
_0207473C:
	add r7, r7, #1
	cmp r7, r4
	add r1, r1, #0x15c
	ble _02074720
_0207474C:
	cmp r2, r4
	movgt r6, #0
	bgt _0207476C
	ldr r1, _02074778 ; =_022B7A6C
	mov r0, #0x15c
	mla r6, r2, r0, r1
	mov r0, r6
	bl DseVoice_Deallocate
_0207476C:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02074774: .word _022B7A30
_02074778: .word _022B7A6C
_0207477C: .word DRIVER_WORK
	arm_func_end DseVoice_Allocate

	arm_func_start DseVoice_Start
DseVoice_Start: ; 0x02074780
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r3, [r4, #6]
	mov r1, r2, lsl #0x10
	add r1, r1, #0xff
	orr r2, r3, #1
	bic r2, r2, #2
	strh r2, [r4, #6]
	ldr r2, [r4, #0x14c]
	add r1, r1, #0x100
	orr r1, r2, r1
	mov r5, r0
	str r1, [r4, #0x14c]
	add r0, r4, #0x3c
	bl UpdateTrackVolumeEnvelopes
	ldr r0, [r4, #0x158]
	cmp r0, r5
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	str r0, [r4, #0x154]
	str r4, [r5, #0xb4]
	str r5, [r4, #0x158]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseVoice_Start

	arm_func_start DseVoice_ReleaseHeld
DseVoice_ReleaseHeld: ; 0x020747DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	ldrb r0, [r7, #4]
	tst r0, #3
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r4, [r7, #0xb8]
	add r6, r7, #0xb8
	cmp r4, #0
	beq _0207484C
	ldr r8, _02074858 ; =DRIVER_WORK
	mvn sl, #0
	mov sb, #0
_0207480C:
	ldmib r4, {r0, r5}
	cmp r0, #0
	strgt r4, [r6]
	addgt r6, r4, #8
	bgt _02074840
	mov r0, r7
	mov r1, r4
	bl DseChannel_ReleaseNoteInternal
	ldr r0, [r8, #0x650]
	str r0, [r4, #8]
	str r4, [r8, #0x650]
	str sl, [r4, #4]
	strb sb, [r4, #1]
_02074840:
	mov r4, r5
	cmp r5, #0
	bne _0207480C
_0207484C:
	mov r0, #0
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02074858: .word DRIVER_WORK
	arm_func_end DseVoice_ReleaseHeld

	arm_func_start DseVoice_Release
DseVoice_Release: ; 0x0207485C
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldrh r1, [r4, #4]
	orr r1, r1, #2
	strh r1, [r4, #4]
	ldrb r0, [r0, #4]
	tst r0, #1
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0x14c]
	add r0, r4, #0x3c
	and r1, r1, #0xff
	str r1, [r4, #0x14c]
	bl SoundEnvelope_Release
	ldrh r0, [r4, #6]
	bic r0, r0, #1
	strh r0, [r4, #6]
	ldmia sp!, {r4, pc}
	arm_func_end DseVoice_Release

	arm_func_start DseVoice_Deallocate
DseVoice_Deallocate: ; 0x020748A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x158]
	cmp r1, #0
	beq _02074948
	ldr r2, [r1, #0xb4]
	cmp r2, r4
	ldreq r0, [r4, #0x154]
	streq r0, [r1, #0xb4]
	beq _020748F0
	cmp r2, #0
	beq _020748F0
_020748D0:
	ldr r0, [r2, #0x154]
	cmp r0, r4
	ldreq r0, [r4, #0x154]
	streq r0, [r2, #0x154]
	beq _020748F0
	mov r2, r0
	cmp r0, #0
	bne _020748D0
_020748F0:
	mov r0, #0
	strh r0, [r4, #4]
	str r0, [r4, #0x158]
	str r0, [r4, #0x154]
	add r0, r4, #0x3c
	bl SoundEnvelope_Stop
	ldr r1, [r4, #0x14c]
	mov r0, #0
	and r1, r1, #0xff
	str r1, [r4, #0x14c]
	str r0, [r4]
	strh r0, [r4, #0x18]
	ldr r1, _020749A0 ; =_022B7A30
	ldrh r0, [r4, #0xa]
	ldrh r3, [r1, #0x32]
	mvn r2, r0
	and r2, r3, r2
	strh r2, [r1, #0x32]
	ldrh r2, [r1, #0x36]
	orr r2, r2, r0
	strh r2, [r1, #0x36]
	ldmia sp!, {r4, pc}
_02074948:
	mov r0, #0
	strh r0, [r4, #4]
	str r0, [r4, #0x158]
	str r0, [r4, #0x154]
	add r0, r4, #0x3c
	bl SoundEnvelope_Stop
	ldr r1, [r4, #0x14c]
	mov r0, #0
	and r1, r1, #0xff
	str r1, [r4, #0x14c]
	str r0, [r4]
	strh r0, [r4, #0x18]
	ldr r1, _020749A0 ; =_022B7A30
	ldrh r0, [r4, #0xa]
	ldrh r3, [r1, #0x32]
	mvn r2, r0
	and r2, r3, r2
	strh r2, [r1, #0x32]
	ldrh r2, [r1, #0x36]
	orr r2, r2, r0
	strh r2, [r1, #0x36]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020749A0: .word _022B7A30
	arm_func_end DseVoice_Deallocate

	arm_func_start DseVoice_FlagForActivation
DseVoice_FlagForActivation: ; 0x020749A4
	mov r1, #0xff0
	strh r1, [r0, #6]
	ldr r2, [r0, #0x14c]
	ldr r1, _020749F0 ; =_022B7A30
	orr r2, r2, #0xff
	orr r2, r2, #0x100
	str r2, [r0, #0x14c]
	ldrh r3, [r0, #0xa]
	ldrh r0, [r1, #0x34]
	mvn r2, r3
	and r0, r0, r2
	strh r0, [r1, #0x34]
	ldrh r0, [r1, #0x36]
	and r0, r0, r2
	strh r0, [r1, #0x36]
	ldrh r0, [r1, #0x32]
	orr r0, r0, r3
	strh r0, [r1, #0x32]
	bx lr
	.align 2, 0
_020749F0: .word _022B7A30
	arm_func_end DseVoice_FlagForActivation

	arm_func_start DseVoice_FlagForDeactivation
DseVoice_FlagForDeactivation: ; 0x020749F4
	ldr r2, [r0, #0x14c]
	ldr r1, _02074A28 ; =_022B7A30
	bic r2, r2, #0xff00
	str r2, [r0, #0x14c]
	ldrh r3, [r0, #0xa]
	ldrh r2, [r1, #0x32]
	mvn r0, r3
	and r0, r2, r0
	strh r0, [r1, #0x32]
	ldrh r0, [r1, #0x34]
	orr r0, r0, r3
	strh r0, [r1, #0x34]
	bx lr
	.align 2, 0
_02074A28: .word _022B7A30
	arm_func_end DseVoice_FlagForDeactivation

	arm_func_start DseVoice_CountNumActiveInChannel
DseVoice_CountNumActiveInChannel: ; 0x02074A2C
	ldr r2, [r0, #0xb4]
	mov r0, #0
	cmp r2, #0
	bxeq lr
_02074A3C:
	ldrb r1, [r2, #0x14c]
	ldr r2, [r2, #0x154]
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #0
	bne _02074A3C
	bx lr
	arm_func_end DseVoice_CountNumActiveInChannel

	arm_func_start DseVoice_UpdateHardware
DseVoice_UpdateHardware: ; 0x02074A58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r4, _02074C64 ; =_022B7A30
	ldr r7, _02074C68 ; =_022B7A6C
	ldrh r0, [r4, #0x2e]
	mov r8, #0
	cmp r0, #0
	ble _02074BC8
	mov fp, #2
	mov sl, #1
	mov r6, r8
	mov r5, r8
_02074A88:
	ldrh sb, [r7, #6]
	cmp sb, #0
	beq _02074BB4
	tst sb, #1
	beq _02074B5C
	ldrsb r0, [r7, #0x21]
	ldrb r1, [r7, #0x1f]
	cmp r0, #0
	movne r3, sl
	moveq r3, fp
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02074B50
_02074ABC: ; jump table
	b _02074AD0 ; case 0
	b _02074AD0 ; case 1
	b _02074AD0 ; case 2
	b _02074B0C ; case 3
	b _02074B34 ; case 4
_02074AD0:
	ldr r0, [r7, #0x34]
	str r0, [sp]
	ldr r0, [r7, #0x38]
	str r0, [sp, #4]
	ldr r0, [r7, #0x140]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r7, #0x13c]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x144]
	str r0, [sp, #0x14]
	ldrh r0, [r7, #8]
	ldr r2, [r7, #0x30]
	bl sub_0207CA6C
	b _02074B50
_02074B0C:
	ldr r0, [r7, #0x13c]
	mov r3, #0
	str r0, [sp]
	ldr r0, [r7, #0x144]
	str r0, [sp, #4]
	ldrh r0, [r7, #8]
	ldrb r1, [r7, #0x25]
	ldr r2, [r7, #0x140]
	bl sub_0207CAB8
	b _02074B50
_02074B34:
	ldr r0, [r7, #0x144]
	mov r2, #0
	str r0, [sp]
	ldrh r0, [r7, #8]
	ldr r1, [r7, #0x140]
	ldr r3, [r7, #0x13c]
	bl sub_0207CAE0
_02074B50:
	mov r0, r7
	bl DseVoice_FlagForActivation
	b _02074BB0
_02074B5C:
	tst sb, #2
	beq _02074B70
	mov r0, r7
	bl DseVoice_FlagForDeactivation
	mov sb, #0
_02074B70:
	tst sb, #0x10
	beq _02074B84
	ldrh r0, [r7, #0xa]
	ldr r1, [r7, #0x13c]
	bl sub_0207CA04
_02074B84:
	tst sb, #0x20
	beq _02074B9C
	ldrh r0, [r7, #0xa]
	ldr r1, [r7, #0x140]
	mov r2, #0
	bl sub_0207CA24
_02074B9C:
	tst sb, #0x40
	beq _02074BB0
	ldrh r0, [r7, #0xa]
	ldr r1, [r7, #0x144]
	bl sub_0207CA4C
_02074BB0:
	strh r5, [r7, #6]
_02074BB4:
	ldrh r0, [r4, #0x2e]
	add r8, r8, #1
	add r7, r7, #0x15c
	cmp r8, r0
	blt _02074A88
_02074BC8:
	ldr r1, _02074C64 ; =_022B7A30
	ldr r2, _02074C6C ; =DRIVER_WORK
	ldrh r0, [r1, #0x32]
	strh r0, [r1, #0x30]
	ldrb r1, [r2, #0x73a]
	ldrb r2, [r2, #0x738]
	orr r3, r0, r1
	orrs r3, r2, r3
	beq _02074C0C
	mov r3, #0
	bl sub_0207C8B8
	ldr r1, _02074C6C ; =DRIVER_WORK
	mov r2, #0
	strb r2, [r1, #0x738]
	ldr r0, _02074C64 ; =_022B7A30
	strb r2, [r1, #0x73a]
	strh r2, [r0, #0x32]
_02074C0C:
	ldr r1, _02074C64 ; =_022B7A30
	ldr r0, _02074C6C ; =DRIVER_WORK
	ldrh r4, [r1, #0x34]
	ldrh r3, [r1, #0x36]
	ldrb r1, [r0, #0x73b]
	ldrb r2, [r0, #0x739]
	orr r0, r4, r3
	orr r3, r1, r0
	orrs r3, r2, r3
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, #0
	bl sub_0207C8E0
	ldr r1, _02074C6C ; =DRIVER_WORK
	mov r2, #0
	strb r2, [r1, #0x739]
	ldr r0, _02074C64 ; =_022B7A30
	strb r2, [r1, #0x73b]
	strh r2, [r0, #0x36]
	strh r2, [r0, #0x34]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02074C64: .word _022B7A30
_02074C68: .word _022B7A6C
_02074C6C: .word DRIVER_WORK
	arm_func_end DseVoice_UpdateHardware
