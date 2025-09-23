	.include "asm/macros.inc"
	.include "main_02013884.inc"

	.text

	arm_func_start GetMovesetLevelUpPtr
GetMovesetLevelUpPtr: ; 0x02013884
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _020138C4 ; =_02098D64
	ldreq r1, _020138C8 ; =DUNGEON_MOVE_TABLES
	moveq r0, #0xc
	smulbbeq r0, r4, r0
	ldreq r1, [r1]
	ldreq r0, [r1, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020138C4: .word _02098D64
_020138C8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetLevelUpPtr

	arm_func_start IsInvalidMoveset
IsInvalidMoveset: ; 0x020138CC
	cmp r0, #0
	ble _020138E0
	ldr r1, _020138F0 ; =0x00000229
	cmp r0, r1
	blt _020138E8
_020138E0:
	mov r0, #1
	bx lr
_020138E8:
	mov r0, #0
	bx lr
	.align 2, 0
_020138F0: .word 0x00000229
	arm_func_end IsInvalidMoveset

	arm_func_start GetMovesetHmTmPtr
GetMovesetHmTmPtr: ; 0x020138F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _02013938 ; =_02098D64
	ldmneia sp!, {r4, pc}
	ldr r1, _0201393C ; =DUNGEON_MOVE_TABLES
	mov r0, #0xc
	ldr r1, [r1]
	smlabb r0, r4, r0, r1
	ldr r0, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02013938: .word _02098D64
_0201393C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetHmTmPtr

	arm_func_start GetMovesetEggPtr
GetMovesetEggPtr: ; 0x02013940
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _02013984 ; =_02098D64
	ldmneia sp!, {r4, pc}
	ldr r1, _02013988 ; =DUNGEON_MOVE_TABLES
	mov r0, #0xc
	ldr r1, [r1]
	smlabb r0, r4, r0, r1
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02013984: .word _02098D64
_02013988: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetEggPtr
