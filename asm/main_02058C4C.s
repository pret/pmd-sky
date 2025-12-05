	.include "asm/macros.inc"
	.include "main_02058C4C.inc"

	.text

	arm_func_start GetUnlockedTactics
GetUnlockedTactics: ; 0x02058C4C
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r3, _02058C98 ; =TACTICS_UNLOCK_LEVEL_TABLE
	mov ip, lr
_02058C5C:
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r2, r1
	strleb ip, [r0, lr]
	add ip, ip, #1
	addle lr, lr, #1
	cmp ip, #0xc
	blt _02058C5C
	mov r1, #0xb
	b _02058C8C
_02058C84:
	strb r1, [r0, lr]
	add lr, lr, #1
_02058C8C:
	cmp lr, #0xc
	blt _02058C84
	ldmia sp!, {r3, pc}
	.align 2, 0
_02058C98: .word TACTICS_UNLOCK_LEVEL_TABLE
	arm_func_end GetUnlockedTactics

	arm_func_start GetUnlockedTacticFlags
GetUnlockedTacticFlags: ; 0x02058C9C
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr lr, _02058CD4 ; =TACTICS_UNLOCK_LEVEL_TABLE
	mov r2, r4
	mov r3, #1
_02058CB0:
	mov ip, r4, lsl #1
	ldrsh ip, [lr, ip]
	cmp ip, r1
	strleb r3, [r0, r4]
	strgtb r2, [r0, r4]
	add r4, r4, #1
	cmp r4, #0xc
	blt _02058CB0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02058CD4: .word TACTICS_UNLOCK_LEVEL_TABLE
	arm_func_end GetUnlockedTacticFlags
