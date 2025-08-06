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
