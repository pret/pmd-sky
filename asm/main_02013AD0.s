	.include "asm/macros.inc"
	.include "main_02013AD0.inc"

	.text

	arm_func_start GetMoveMaxGinsengBoost
GetMoveMaxGinsengBoost: ; 0x02013AD0
	ldr r1, _02013AEC ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_02013AEC: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveMaxGinsengBoost

	arm_func_start GetMoveMaxGinsengBoostGround
GetMoveMaxGinsengBoostGround: ; 0x02013AF0
	ldr r1, _02013B0C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #2]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_02013B0C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveMaxGinsengBoostGround

	arm_func_start GetMoveCritChance
GetMoveCritChance: ; 0x02013B10
	ldr r1, _02013B2C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xf]
	bx lr
	.align 2, 0
_02013B2C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveCritChance
