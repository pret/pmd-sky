	.include "asm/macros.inc"
	.include "overlay_29_0232D22C.inc"

	.text

	arm_func_start DoMoveHammerArm
DoMoveHammerArm: ; 0x0232D22C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	str r3, [sp]
	mov r3, #0x100
	mov r4, r0
	bl DealDamage
	cmp r0, #0
	moveq r0, #0
	beq _0232D268
	mov r2, #1
	mov r0, r4
	mov r1, r4
	mov r3, r2
	bl LowerSpeed
	mov r0, #1
_0232D268:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end DoMoveHammerArm
