	.include "asm/macros.inc"
	.include "main_02052890.inc"

	.text

	arm_func_start GetRegenSpeed
GetRegenSpeed: ; 0x02052890
	ldr r2, _020528B0 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x30]
	mov r0, r0, lsl #1
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020528B0: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetRegenSpeed

	arm_func_start GetCanMoveFlag
GetCanMoveFlag: ; 0x020528B4
	ldr r2, _020528DC ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x1a]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020528DC: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetCanMoveFlag

	arm_func_start GetChanceAsleep
GetChanceAsleep: ; 0x020528E0
	ldr r2, _020528F8 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x2f]
	bx lr
	.align 2, 0
_020528F8: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetChanceAsleep

	arm_func_start GetWeightMultiplier
GetWeightMultiplier: ; 0x020528FC
	ldr r2, _02052914 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x28]
	bx lr
	.align 2, 0
_02052914: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetWeightMultiplier

	arm_func_start GetSize
GetSize: ; 0x02052918
	ldr r2, _02052930 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x2a]
	bx lr
	.align 2, 0
_02052930: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetSize

	arm_func_start GetBaseHp
GetBaseHp: ; 0x02052934
	ldr r2, _0205294C ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x20]
	bx lr
	.align 2, 0
_0205294C: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetBaseHp
