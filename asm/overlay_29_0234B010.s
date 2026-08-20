	.include "asm/macros.inc"
	.include "overlay_29_0234B010.inc"

	.text

	arm_func_start ov29_0234B010
ov29_0234B010: ; 0x0234B010
	ldr r1, _0234B020 ; =MESSAGE_LOG_INFO
	ldr r1, [r1, #4]
	strb r0, [r1, #0xcee]
	bx lr
	.align 2, 0
_0234B020: .word MESSAGE_LOG_INFO
	arm_func_end ov29_0234B010
