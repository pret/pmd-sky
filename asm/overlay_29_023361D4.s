	.include "asm/macros.inc"
	.include "overlay_29_023361D4.inc"

	.text

	arm_func_start IsFullFloorFixedRoom
IsFullFloorFixedRoom: ; 0x023361D4
	ldr r0, _02336200 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0
	beq _023361F8
	cmp r0, #0xa5
	movlo r0, #1
	bxlo lr
_023361F8:
	mov r0, #0
	bx lr
	.align 2, 0
_02336200: .word DUNGEON_PTR
	arm_func_end IsFullFloorFixedRoom
