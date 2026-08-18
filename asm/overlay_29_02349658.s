	.include "asm/macros.inc"
	.include "overlay_29_02349658.inc"

	.text

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
