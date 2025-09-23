	.include "asm/macros.inc"
	.include "main_020018A4.inc"

	.text

	arm_func_start sub_020018A4
sub_020018A4: ; 0x020018A4
	and r2, r1, #0
	and r3, r0, #0xff
	cmp r2, #0
	cmpeq r3, #0
	mov r2, #0
	beq _020018C4
	adds r0, r0, #0x100
	adc r1, r1, r2
_020018C4:
	mov r0, r0, lsr #8
	orr r0, r0, r1, lsl #24
	bx lr
	arm_func_end sub_020018A4
