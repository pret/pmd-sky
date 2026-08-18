	.include "asm/macros.inc"
	.include "main_0204FE58.inc"

	.text

	arm_func_start SetPokemonBattled
SetPokemonBattled: ; 0x0204FE58
	stmdb sp!, {r3, lr}
	bl GetDexNumberVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _0204FEB0 ; =ADVENTURE_LOG_PTR
	mov r1, r0, asr #4
	ldr lr, [r3]
	add r1, r0, r1, lsr #27
	ldr ip, [lr]
	mov r2, r0, lsr #0x1f
	orr ip, ip, #2
	str ip, [lr]
	ldr r3, [r3]
	rsb r0, r2, r0, lsl #27
	add lr, r3, #0xd8
	mov ip, r1, asr #5
	ldr r3, [lr, ip, lsl #2]
	add r0, r2, r0, ror #27
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [lr, ip, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204FEB0: .word ADVENTURE_LOG_PTR
	arm_func_end SetPokemonBattled
