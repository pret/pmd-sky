	.include "asm/macros.inc"
	.include "overlay_29_02349638.inc"

	.text

	arm_func_start GetMissionEnemyMinionGroup
GetMissionEnemyMinionGroup: ; 0x02349638
	ldr r1, _02349654 ; =DUNGEON_PTR
	add r0, r0, #1
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bx lr
	.align 2, 0
_02349654: .word DUNGEON_PTR
	arm_func_end GetMissionEnemyMinionGroup

	arm_func_start ov29_02349658
ov29_02349658: ; 0x02349658
	ldr r0, _02349684 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #1]
	ldr r1, [r0]
	strb r2, [r1, #2]
	ldr r0, [r0]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_02349684: .word DUNGEON_PTR
	arm_func_end ov29_02349658
