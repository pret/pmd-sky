	.include "asm/macros.inc"
	.include "overlay_29_0232A490.inc"

	.text

	arm_func_start DoMoveSwallow
DoMoveSwallow: ; 0x0232A490
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, [r1, #0xb4]
#ifdef JAPAN
	ldrb r3, [r4, #0x11a]
#else
	ldrb r3, [r4, #0x11e]
#endif
	cmp r3, #0
	beq _0232A4CC
	ldr r2, _0232A4E0 ; =ov10_022C49D4
	mov ip, #1
	ldr r2, [r2, r3, lsl #2]
	mov r3, #0
	str ip, [sp]
	bl TryIncreaseHp
	mov r0, #0
#ifdef JAPAN
	strb r0, [r4, #0x11a]
#else
	strb r0, [r4, #0x11e]
#endif
	b _0232A4D4
_0232A4CC:
	ldr r2, _0232A4E4 ; =0x00000EE4
	bl LogMessageByIdWithPopupCheckUserTarget
_0232A4D4:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0232A4E0: .word ov10_022C49D4
#ifdef JAPAN
_0232A4E4: .word 0x00000C26
#else
_0232A4E4: .word 0x00000EE4
#endif
	arm_func_end DoMoveSwallow
