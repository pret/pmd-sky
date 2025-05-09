	.include "asm/macros.inc"
	.include "overlay_29_023007A8.inc"

	.text

	arm_func_start IsMonsterSleeping
IsMonsterSleeping: ; 0x023007A8
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbd]
	cmp r0, #1
	moveq r0, #1
	bxeq lr
	cmp r0, #5
	moveq r0, #1
	bxeq lr
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonsterSleeping

	arm_func_start ov29_023007DC
ov29_023007DC: ; 0x023007DC
	ldr r3, [r0, #0xb4]
	ldr r0, _02300814 ; =0x000003E7
	ldrsh r2, [r3, #0x12]
	ldrsh r1, [r3, #0x16]
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r3, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movle r0, #1
	movgt r0, #0
	bx lr
	.align 2, 0
_02300814: .word 0x000003E7
	arm_func_end ov29_023007DC
