	.include "asm/macros.inc"
	.include "main_02013B70.inc"

	.text

	arm_func_start GetMoveRangeId
GetMoveRangeId: ; 0x02013B70
	ldr r1, _02013B8C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x15]
	bx lr
	.align 2, 0
_02013B8C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveRangeId

	arm_func_start GetMoveActualAccuracy
GetMoveActualAccuracy: ; 0x02013B90
	stmdb sp!, {r3, lr}
	ldr r2, _02013BE4 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x63
	bne _02013BDC
	ldrb r2, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	cmp r2, #0x7d
	ldmeqia sp!, {r3, pc}
	mul r0, r2, r0
	mov r1, #0x64
	bl _s32_div_f
	ldmia sp!, {r3, pc}
_02013BDC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02013BE4: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveActualAccuracy

	arm_func_start GetMoveBasePowerFromId
GetMoveBasePowerFromId: ; 0x02013BE8
	mov r1, #0x1a
	mul r1, r0, r1
	ldr r0, _02013C00 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #8]
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_02013C00: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePowerFromId
