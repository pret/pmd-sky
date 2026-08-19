	.include "asm/macros.inc"
	.include "overlay_29_02326E20.inc"

	.text

	arm_func_start DoMoveGust
DoMoveGust: ; 0x02326E20
	stmdb sp!, {r3, lr}
	ldr ip, [r1, #0xb4]
	mov lr, #1
	ldrb ip, [ip, #0xd2]
	add ip, ip, #0xf9
	and ip, ip, #0xff
	cmp ip, #1
	movls lr, #2
	str r3, [sp]
	mov r3, lr, lsl #8
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end DoMoveGust
