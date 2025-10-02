	.include "asm/macros.inc"
	.include "main_020513C0.inc"

	.text

	arm_func_start GetLeaderChangeFlag
GetLeaderChangeFlag: ; 0x020513C0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020513E4 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020513E4: .word DUNGEON_RESTRICTIONS
	arm_func_end GetLeaderChangeFlag

	arm_func_start GetRandomMovementChance
GetRandomMovementChance: ; 0x020513E8
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020513FC ; =_020A0C6E
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_020513FC: .word _020A0C6E
	arm_func_end GetRandomMovementChance

	arm_func_start CanEnemyEvolve
CanEnemyEvolve: ; 0x02051400
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051424 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051424: .word DUNGEON_RESTRICTIONS
	arm_func_end CanEnemyEvolve

	arm_func_start GetMaxMembersAllowed
GetMaxMembersAllowed: ; 0x02051428
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205143C ; =_020A0C6A
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_0205143C: .word _020A0C6A
	arm_func_end GetMaxMembersAllowed

	arm_func_start IsIqEnabled
IsIqEnabled: ; 0x02051440
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051464 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x100
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051464: .word DUNGEON_RESTRICTIONS
	arm_func_end IsIqEnabled

	arm_func_start IsTrapInvisibleWhenAttacking
IsTrapInvisibleWhenAttacking: ; 0x02051468
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205148C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x200
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205148C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsTrapInvisibleWhenAttacking

	arm_func_start JoinedAtRangeCheck
JoinedAtRangeCheck: ; 0x02051490
	cmp r0, #0xd9
	blo _020514A4
	cmp r0, #0xe4
	movlo r0, #1
	blo _020514A8
_020514A4:
	mov r0, #0
_020514A8:
	and r0, r0, #0xff
	bx lr
	arm_func_end JoinedAtRangeCheck
