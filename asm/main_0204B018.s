	.include "asm/macros.inc"
	.include "main_0204B018.inc"

	.text

	arm_func_start sub_0204B018
sub_0204B018: ; 0x0204B018
	ldr r1, _0204B024 ; =GAME_MODE
	strb r0, [r1]
	bx lr
	.align 2, 0
_0204B024: .word GAME_MODE
	arm_func_end sub_0204B018
