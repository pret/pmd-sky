	.include "asm/macros.inc"
	.include "main_02013A30.inc"

	.text

	arm_func_start GetMoveBasePp
GetMoveBasePp: ; 0x02013A30
	ldr r1, _02013A4C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_02013A4C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePp
