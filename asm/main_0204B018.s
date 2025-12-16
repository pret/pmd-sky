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

	arm_func_start sub_0204B028
sub_0204B028: ; 0x0204B028
	ldr r1, _0204B040 ; =_0209DF70
	ldr ip, _0204B044 ; =Debug_Print0
	ldr r0, _0204B048 ; =EVENT_FLAG_SIZE_DEBUG_MSG
	ldrsh r1, [r1, #0x24]
	mov r2, #0x400
	bx ip
	.align 2, 0
_0204B040: .word _0209DF70
_0204B044: .word Debug_Print0
_0204B048: .word EVENT_FLAG_SIZE_DEBUG_MSG
	arm_func_end sub_0204B028
