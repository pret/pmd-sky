	.include "asm/macros.inc"
	.include "overlay_29_022EAB50.inc"

	.text

	arm_func_start CalcStatusDuration
CalcStatusDuration: ; 0x022EAB80
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrsh r0, [r1]
	ldrsh r1, [r1, #2]
	mov r6, r2
	bl DungeonRandRange
	mov r5, r0
	cmp r4, #0
	moveq r0, #0
	beq _022EABBC
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_022EABBC:
	cmp r0, #0
	beq _022EAC24
	ldr r0, [r4]
	cmp r0, #1
	bne _022EAC24
	cmp r6, #0
	beq _022EAC24
	mov r0, r4
	mov r1, #0x12
	bl IqSkillIsEnabled
	cmp r0, #0
	cmpne r5, #0x7f
	beq _022EAC04
	mov r0, r5, lsl #8
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	bl RoundUpDiv256
	mov r5, r0
_022EAC04:
	mov r0, r4
	mov r1, #0x14
	bl AbilityIsActiveVeneer
	cmp r0, #0
	cmpne r5, #0x7f
	beq _022EAC24
	cmp r5, #5
	movge r5, #5
_022EAC24:
	cmp r5, #1
	movlt r5, #1
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end CalcStatusDuration
