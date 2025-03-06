	.include "asm/macros.inc"
	.include "overlay_29_0230A9B8.inc"

	.text

	arm_func_start ExclusiveItemEffectIsActive__0230A9B8
ExclusiveItemEffectIsActive__0230A9B8: ; 0x0230A9B8
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__0230A9B8
