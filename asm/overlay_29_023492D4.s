	.include "asm/macros.inc"
	.include "overlay_29_023492D4.inc"

	.text

	arm_func_start IsLegendaryChallengeFloor
IsLegendaryChallengeFloor: ; 0x023492D4
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349308
	ldr r0, _02349310 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x762]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	ldmlsia sp!, {r3, pc}
_02349308:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349310: .word DUNGEON_PTR
	arm_func_end IsLegendaryChallengeFloor
