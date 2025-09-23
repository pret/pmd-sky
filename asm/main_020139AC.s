	.include "asm/macros.inc"
	.include "main_020139AC.inc"

	.text

	arm_func_start GetMoveNbStrikes
GetMoveNbStrikes: ; 0x020139AC
	ldr r1, _020139C8 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_020139C8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveNbStrikes

	arm_func_start GetMoveBasePower
GetMoveBasePower: ; 0x020139CC
	ldrh r2, [r0, #4]
	mov r0, #0x1a
	ldr r1, _020139E8 ; =DUNGEON_MOVE_TABLES
	mul r0, r2, r0
	ldr r1, [r1, #8]
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_020139E8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePower

	arm_func_start GetMoveBasePowerGround
GetMoveBasePowerGround: ; 0x020139EC
	ldrh r2, [r0, #2]
	mov r0, #0x1a
	ldr r1, _02013A08 ; =DUNGEON_MOVE_TABLES
	mul r0, r2, r0
	ldr r1, [r1, #8]
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_02013A08: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePowerGround
