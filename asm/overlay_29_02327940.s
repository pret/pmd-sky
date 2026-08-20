	.include "asm/macros.inc"
	.include "overlay_29_02327940.inc"

	.text

	arm_func_start DoMoveRapidSpin
DoMoveRapidSpin: ; 0x02327940
	stmdb sp!, {r3, r4, r5, lr}
	str r3, [sp]
	mov r3, #0x100
	mov r5, r0
	mov r4, #0
	bl DealDamage
	cmp r0, #0
	beq _023279A0
	mov r1, r4
	mov r0, r5
	mov r4, #1
	bl DungeonRandOutcomeUserAction
	cmp r0, #0
	beq _023279A0
	ldr r0, [r5, #0xb4]
	add r0, r0, #0x100
#ifdef JAPAN
	ldrh r0, [r0, #0x8e]
#else
	ldrh r0, [r0, #0x92]
#endif
	tst r0, #2
	ldrne r0, _023279A8 ; =RAPID_SPIN_BINDING_REMOVAL
	movne r1, #0
	strneb r1, [r0]
	ldreq r0, _023279A8 ; =RAPID_SPIN_BINDING_REMOVAL
	moveq r1, r4
	streqb r1, [r0]
_023279A0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023279A8: .word RAPID_SPIN_BINDING_REMOVAL
	arm_func_end DoMoveRapidSpin
