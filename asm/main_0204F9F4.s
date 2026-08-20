	.include "asm/macros.inc"
	.include "main_0204F9F4.inc"

	.text

	arm_func_start sub_0204F9F4
sub_0204F9F4: ; 0x0204F9F4
	ldr ip, _0204FA04 ; =sub_02050E5C
	mov r1, r0
	ldr r0, _0204FA08 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA04: .word sub_02050E5C
_0204FA08: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204F9F4

	arm_func_start sub_0204FA0C
sub_0204FA0C: ; 0x0204FA0C
	ldr ip, _0204FA1C ; =sub_02050E8C
	mov r1, r0
	ldr r0, _0204FA20 ; =PLAY_TIME_SECONDS
	bx ip
	.align 2, 0
_0204FA1C: .word sub_02050E8C
_0204FA20: .word PLAY_TIME_SECONDS
	arm_func_end sub_0204FA0C
