	.include "asm/macros.inc"
	.include "overlay_15_0238ADC4.inc"

	.text

; https://decomp.me/scratch/RJN4g
	arm_func_start ov15_0238ADC4
ov15_0238ADC4: ; 0x0238ADC4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	bl GetMoneyCarried
	add ip, sp, #0x400
	str r0, [sp, #0x428]
	add ip, ip, #4
	ldr r2, _0238AE64 ; =0x00000373
	ldr r3, _0238AE68 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #4
	mov r0, r4
	mov r1, #8
	mov r2, #6
	bl DrawTextInWindow
	bl GetMoneyStored
	add r1, sp, #0x400
	str r0, [sp, #0x428]
	add r1, r1, #4
	str r1, [sp]
#ifdef JAPAN
	ldr r2, _0238C3E0 ; =0x00003239
	ldr r3, _0238AE68 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
#else
	ldr r3, _0238AE68 ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	mov r2, #0x374
#endif
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #0x74
	mov r2, #6
	add r3, sp, #4
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_0238AE64: .word 0x00003238
_0238AE68: .word 0x0000C402
_0238C3E0: .word 0x00003239
#else
_0238AE64: .word 0x00000373
_0238AE68: .word 0x0000C402
#endif
	arm_func_end ov15_0238ADC4
