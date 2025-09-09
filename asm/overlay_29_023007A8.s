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
