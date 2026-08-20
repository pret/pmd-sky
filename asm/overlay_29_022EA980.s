	.include "asm/macros.inc"
	.include "overlay_29_022EA980.inc"

	.text

	arm_func_start GenerateDungeonRngSeed
GenerateDungeonRngSeed: ; 0x022EA980
	ldr r2, _022EA9C4 ; =DUNGEON_PRNG_STATE
	mov r1, #0x10000
	ldr r3, [r2, #8]
	ldr r0, _022EA9C8 ; =0x5D588B65
	rsb r1, r1, #0
	mul ip, r3, r0
	add ip, ip, #1
	mul r0, ip, r0
	add r3, r0, #1
	mov r0, ip, lsr #0x10
	mov r0, r0, lsl #0x10
	and r1, r3, r1
	orr r0, r1, r0, lsr #16
	bic r0, r0, #0xff000000
	str r3, [r2, #8]
	orr r0, r0, #1
	bx lr
	.align 2, 0
_022EA9C4: .word DUNGEON_PRNG_STATE
_022EA9C8: .word 0x5D588B65
	arm_func_end GenerateDungeonRngSeed
