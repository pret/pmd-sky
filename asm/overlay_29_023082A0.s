	.include "asm/macros.inc"
	.include "overlay_29_023082A0.inc"

	.text

	arm_func_start ShouldMonsterFollowLeader
ShouldMonsterFollowLeader: ; 0x023082A0
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r0, [r1, #0xa8]
	bl DoesTacticFollowLeader
	ldmia sp!, {r3, pc}
	arm_func_end ShouldMonsterFollowLeader

	arm_func_start ov29_023082C4
ov29_023082C4: ; 0x023082C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl GetLeader
	movs r4, r0
	beq _02308338
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #2
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, #0
	mov r0, r5
	mov r1, r4
	mov r3, r2
	bl GetTreatmentBetweenMonsters
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl CanTargetEntity
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, pc}
_02308338:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023082C4
