	.include "asm/macros.inc"
	.include "overlay_29_023491C4.inc"

	.text

	arm_func_start IsOutlawOrChallengeRequestFloor
IsOutlawOrChallengeRequestFloor: ; 0x023491C4
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023491F8
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023491F8
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349200
_023491F8:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02349200:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsOutlawOrChallengeRequestFloor
