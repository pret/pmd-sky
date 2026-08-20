	.include "asm/macros.inc"
	.include "overlay_29_0232E400.inc"

	.text

	arm_func_start DoMoveWakeUpSlap
DoMoveWakeUpSlap: ; 0x0232E400
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	ldr ip, [r5, #0xb4]
	mov r6, r0
	ldrb ip, [ip, #0xbd]
	cmp ip, #1
	cmpne ip, #3
	cmpne ip, #5
	str r3, [sp]
	bne _0232E468
	mov r0, r6
	mov r1, r5
	mov r3, #0x200
	bl DealDamage
	cmp r0, #0
	movne r4, #1
	moveq r4, #0
	mov r2, #0
	mov r0, r6
	mov r1, r5
	mov r3, #1
	str r2, [sp]
	and r4, r4, #0xff
	bl EndSleepClassStatus
	b _0232E480
_0232E468:
	mov r3, #0x100
	bl DealDamage
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r4, r0, #0xff
_0232E480:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end DoMoveWakeUpSlap
