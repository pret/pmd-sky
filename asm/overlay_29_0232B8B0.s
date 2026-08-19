	.include "asm/macros.inc"
	.include "overlay_29_0232B8B0.inc"

	.text

	arm_func_start DoMoveDamage__0232B8B0
DoMoveDamage__0232B8B0: ; 0x0232B8B0
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveDamage__0232B8B0
