	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

    arm_func_start Snd_CalcChannelVolume
Snd_CalcChannelVolume: ; 0x0207D540
	ldr r1, _0207D5A8 ; =0xFFFFFD2D
	cmp r0, r1
	movlt r0, r1
	blt _0207D558
	cmp r0, #0
	movgt r0, #0
_0207D558:
	add r1, r0, #0xd3
	mvn r2, #0xef
	cmp r0, r2
	ldr r3, _0207D5AC ; =VolumeTable
	add r1, r1, #0x200
	ldrb r3, [r3, r1]
	movlt r0, #3
	blt _0207D598
	add r1, r2, #0x78
	cmp r0, r1
	movlt r0, #2
	blt _0207D598
	add r1, r2, #0xb4
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
_0207D598:
	orr r0, r3, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_0207D5A8: .word 0xFFFFFD2D
_0207D5AC: .word VolumeTable
	arm_func_end Snd_CalcChannelVolume

