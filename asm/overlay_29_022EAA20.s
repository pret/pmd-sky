	.include "asm/macros.inc"
	.include "overlay_29_022EAA20.inc"

	.text

; https://decomp.me/scratch/UiD3J
	arm_func_start DungeonRand16Bit
DungeonRand16Bit: ; 0x022EAA20
	stmdb sp!, {r3, lr}
	ldr r1, _022EAA88 ; =DUNGEON_PRNG_STATE
	ldrb r0, [r1]
	cmp r0, #0
	ldr r0, _022EAA8C ; =0x5D588B65
	beq _022EAA5C
	ldr lr, [r1, #0x10]
	ldr r3, _022EAA90 ; =DUNGEON_PRNG_STATE_SECONDARY_VALUES
	ldr r1, _022EAA94 ; =0x00269EC3
	ldr r2, [r3, lr, lsl #2]
	umull ip, r0, r2, r0
	adds r1, ip, r1
	mov r0, r1, lsl #0x10
	str r1, [r3, lr, lsl #2]
	b _022EAA80
_022EAA5C:
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	ldr r2, [r1, #0xc]
	mul r0, r2, r0
	add r2, r0, #1
	mov r0, r2, lsr #0x10
	mov r0, r0, lsl #0x10
	str r2, [r1, #0xc]
_022EAA80:
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EAA88: .word DUNGEON_PRNG_STATE
_022EAA8C: .word 0x5D588B65
_022EAA90: .word DUNGEON_PRNG_STATE_SECONDARY_VALUES
_022EAA94: .word 0x00269EC3
	arm_func_end DungeonRand16Bit
