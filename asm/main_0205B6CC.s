	.include "asm/macros.inc"
	.include "main_0205B6CC.inc"

	.text

	arm_func_start sub_0205B6CC
sub_0205B6CC: ; 0x0205B6CC
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0xc]
	cmp r1, #0
	cmpeq r0, #2
	mov r0, #0
	movhs r0, #1
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0205B6CC
