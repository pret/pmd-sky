	.include "asm/macros.inc"
	.include "overlay_29_0234969C.inc"

	.text

	arm_func_start ov29_0234969C
ov29_0234969C: ; 0x0234969C
	ldr r1, _023496AC ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_023496AC: .word DUNGEON_PTR
	arm_func_end ov29_0234969C

	arm_func_start ov29_023496B0
ov29_023496B0: ; 0x023496B0
	ldr r0, _023496C0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_023496C0: .word DUNGEON_PTR
	arm_func_end ov29_023496B0
