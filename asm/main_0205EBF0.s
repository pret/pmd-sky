	.include "asm/macros.inc"
	.include "main_0205EBF0.inc"

	.text

	arm_func_start sub_0205EBF0
sub_0205EBF0: ; 0x0205EBF0
	ldr r1, _0205EC14 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x300]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205EC14: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EBF0
