	.include "asm/macros.inc"
	.include "main_0207199C.inc"

	.text

	arm_func_start DseTrackEvent_WaitUntilFadeout
DseTrackEvent_WaitUntilFadeout: ; 0x0207199C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r3
	mov r4, r2
	bl DseVoice_CountNumActiveInChannel
	cmp r0, #0
	ldrgtb r0, [r5], #-1
	addle r5, r5, #1
	strgt r0, [r4, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseTrackEvent_WaitUntilFadeout

	arm_func_start DseTrackEvent_EndTrack
DseTrackEvent_EndTrack: ; 0x020719C8
	stmdb sp!, {r4, lr}
	ldr ip, [r2, #0x20]
	mov r4, r0
	cmp ip, #0
	bne _020719F4
	mov r1, #0
	mov r0, r3
	strb r1, [r2, #2]
	sub r4, r4, #1
	bl DseChannel_DeallocateVoices
	b _02071A0C
_020719F4:
	ldrh r3, [r2, #0xa]
	mov r0, #1
	add r3, r3, #1
	strh r3, [r2, #0xa]
	strb r0, [r1, #3]
	ldr r4, [r2, #0x20]
_02071A0C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end DseTrackEvent_EndTrack
