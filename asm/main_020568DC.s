	.include "asm/macros.inc"
	.include "main_020568DC.inc"

	.text

	arm_func_start sub_020568DC
sub_020568DC: ; 0x020568DC
	ldr r1, _02056910 ; =TEAM_MEMBER_TABLE_PTR
	mvn r3, #0
	ldr r2, [r1]
	add r1, r2, r0, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x50]
	cmp r1, r3
	addne r0, r2, r0, lsl #3
	addne r0, r0, r1, lsl #1
	addne r0, r0, #0x9800
	ldrnesh r3, [r0, #0x56]
	mov r0, r3
	bx lr
	.align 2, 0
_02056910: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020568DC
