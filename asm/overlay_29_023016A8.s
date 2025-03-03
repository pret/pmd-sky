	.include "asm/macros.inc"
	.include "overlay_29_023016A8.inc"

	.text

	arm_func_start ShouldMonsterRunAwayVariation
ShouldMonsterRunAwayVariation: ; 0x023016A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ShouldMonsterRunAway
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov29_023016D8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShouldMonsterRunAwayVariation

	arm_func_start ov29_023016D8
ov29_023016D8: ; 0x023016D8
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
	bl ov29_022E62A8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02301758: .word 0x000003E7
	arm_func_end ov29_023016D8
