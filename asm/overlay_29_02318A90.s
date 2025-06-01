	.include "asm/macros.inc"
	.include "overlay_29_02318A90.inc"

	.text

	arm_func_start ov29_02318A90
ov29_02318A90: ; 0x02318A90
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__02318AB0
	cmp r0, #0
	ldrne r0, [r5, #0xb4]
#ifdef JAPAN
	strneb r4, [r0, #0x10a]
#else
	strneb r4, [r0, #0x10b]
#endif
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02318A90
