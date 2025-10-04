	.include "asm/macros.inc"
	.include "itcm_01FFB62C.inc"

	.section .itcm,4,1,4

	arm_func_start sub_01FFB62C
sub_01FFB62C: ; 0x01FFB62C
	ldr r3, [r0, #0xb4]
	mov r2, #0
	strb r2, [r3, #0x7c]
	ldrh r1, [r0, #4]
	strh r1, [r3, #0x8c]
	ldrh r0, [r0, #6]
	strh r0, [r3, #0x8e]
	str r2, [r3, #0x84]
	strh r2, [r3, #0x80]
	bx lr
	arm_func_end sub_01FFB62C

	.global _01FFB654
_01FFB654:
	.byte 0x05, 0x03, 0x00, 0x00
