	.include "asm/macros.inc"

	.text

    .public _020B2BAC 

    arm_func_start OS_IsRunOnEmulator
OS_IsRunOnEmulator: ; 0x02079D98
	mov r0, #0
	bx lr
	arm_func_end OS_IsRunOnEmulator

	arm_func_start OS_GetConsoleType
OS_GetConsoleType: ; 0x02079DA0
	ldr r0, _02079DB0 ; =0x82000001
	ldr r1, _02079DB4 ; =_020B2BAC
	str r0, [r1]
	bx lr
	.align 2, 0
_02079DB0: .word 0x82000001
_02079DB4: .word _020B2BAC
	arm_func_end OS_GetConsoleType
