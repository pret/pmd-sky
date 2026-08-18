	.include "asm/macros.inc"
	.include "overlay_29_023495E8.inc"

	.text

	arm_func_start IsDestinationFloorWithFleeingOutlaw
IsDestinationFloorWithFleeingOutlaw: ; 0x023495E8
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	mov r1, #5
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _02349618
	mov r0, #9
	mov r1, #2
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_02349618:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end IsDestinationFloorWithFleeingOutlaw
