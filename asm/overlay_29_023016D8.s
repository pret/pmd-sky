	.include "asm/macros.inc"
	.include "overlay_29_023016D8.inc"

	.text

	arm_func_start DisplayRunAwayIfTriggered
DisplayRunAwayIfTriggered: ; 0x023016D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	ldrb r1, [r4, #7]
	cmp r1, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r1, #0x2b
	bl AbilityIsActive
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02301758 ; =0x000003E7
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	ldrsh r1, [r4, #0x10]
	add r0, r2, r2, lsr #31
	cmp r1, r0, asr #1
	movle r1, #1
	movgt r1, #0
	and r2, r1, #0xff
	mov r0, r4
	mov r1, #4
	bl UpdateStateFlags
	cmp r5, #0
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl PlayEffectAnimation0x29
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02301758: .word 0x000003E7
	arm_func_end DisplayRunAwayIfTriggered
