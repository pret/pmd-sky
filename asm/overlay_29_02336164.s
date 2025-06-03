	.include "asm/macros.inc"
	.include "overlay_29_02336164.inc"

	.text

	arm_func_start GetTileSafe
GetTileSafe: ; 0x02336164
	stmdb sp!, {r4, lr}
	cmp r0, #0
	cmpge r1, #0
	blt _02336180
	cmp r0, #0x38
	cmplt r1, #0x20
	blt _023361A8
_02336180:
	ldr r0, _023361C8 ; =DEFAULT_TILE
	ldr lr, _023361CC ; =ov29_0237CAB8
	ldr r4, [r0]
	mov ip, lr
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldr r1, [r4]
	mov r0, ip
	str r1, [lr]
	ldmia sp!, {r4, pc}
_023361A8:
	ldr r3, _023361D0 ; =DUNGEON_PTR
	mov r2, #0xe0
	ldr r3, [r3]
	mla r2, r1, r2, r3
	add r0, r2, r0, lsl #2
	add r0, r0, #0xd000
#ifdef JAPAN
	ldr r0, [r0, #0x240]
#else
	ldr r0, [r0, #0x2e4]
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_023361C8: .word DEFAULT_TILE
_023361CC: .word ov29_0237CAB8
_023361D0: .word DUNGEON_PTR
	arm_func_end GetTileSafe

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
