	.include "asm/macros.inc"
	.include "main_0205EC38.inc"

	.text

	arm_func_start sub_0205EC38
sub_0205EC38: ; 0x0205EC38
	ldr r1, _0205EC4C ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x320
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205EC4C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EC38

	arm_func_start sub_0205EC50
sub_0205EC50: ; 0x0205EC50
	ldr r1, _0205EC74 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x320]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205EC74: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EC50
