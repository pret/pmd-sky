	.include "asm/macros.inc"
	.include "overlay_29_022E46D0.inc"

	.text

	arm_func_start ov29_022E46D0
ov29_022E46D0: ; 0x022E46D0
	bx lr
	arm_func_end ov29_022E46D0

	arm_func_start DisplayStockpileNumbers
DisplayStockpileNumbers: ; 0x022E46D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	mov r1, r4
#ifdef JAPAN
	ldrb r0, [r0, #0x11a]
#else
	ldrb r0, [r0, #0x11e]
#endif
	mov r2, #1
	mov r3, #0xb
	bl DisplayAnimatedNumbers
	ldmia sp!, {r4, pc}
	arm_func_end DisplayStockpileNumbers
