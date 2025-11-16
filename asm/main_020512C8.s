	.include "asm/macros.inc"
	.include "main_020512C8.inc"

	.text

	arm_func_start DoesNotSaveWhenEntering
DoesNotSaveWhenEntering: ; 0x020512C8
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512EC ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020512EC: .word DUNGEON_RESTRICTIONS
	arm_func_end DoesNotSaveWhenEntering

	arm_func_start TreasureBoxDropsEnabled
TreasureBoxDropsEnabled: ; 0x020512F0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051314 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x400
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051314: .word DUNGEON_RESTRICTIONS
	arm_func_end TreasureBoxDropsEnabled

	arm_func_start IsLevelResetDungeon
IsLevelResetDungeon: ; 0x02051318
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205133C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205133C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsLevelResetDungeon

	arm_func_start GetMaxItemsAllowed
GetMaxItemsAllowed: ; 0x02051340
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051354 ; =_020A0C69
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02051354: .word _020A0C69
	arm_func_end GetMaxItemsAllowed

	arm_func_start IsMoneyAllowed
IsMoneyAllowed: ; 0x02051358
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205137C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205137C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsMoneyAllowed

	arm_func_start GetMaxRescueAttempts
GetMaxRescueAttempts: ; 0x02051380
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051394 ; =_020A0C68
	ldrsb r0, [r0, r1]
	bx lr
	.align 2, 0
_02051394: .word _020A0C68
	arm_func_end GetMaxRescueAttempts
