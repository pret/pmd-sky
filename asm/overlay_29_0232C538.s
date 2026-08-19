	.include "asm/macros.inc"
	.include "overlay_29_0232C538.inc"

	.text

	arm_func_start DoMoveSwitchPositions
DoMoveSwitchPositions: ; 0x0232C538
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
#ifdef JAPAN
	ldrb r2, [r3, #0x107]
	cmp r2, #1
	movlo r2, #1
	strlob r2, [r3, #0x107]
#else
	ldrb r2, [r3, #0x108]
	cmp r2, #1
	movlo r2, #1
	strlob r2, [r3, #0x108]
#endif
	mov r2, #1
	bl TrySwitchPlace
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveSwitchPositions
