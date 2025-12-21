	.include "asm/macros.inc"
    .include "main_0204AF98.inc"

    .text

	arm_func_start sub_0204AF98
sub_0204AF98: ; 0x0204AF98
	ldr r1, _0204AFA8 ; =_022AB0A0
	ldrb r1, [r1, #9]
	strb r1, [r0]
	bx lr
	.align 2, 0
_0204AFA8: .word _022AB0A0
	arm_func_end sub_0204AF98

	arm_func_start sub_0204AFAC
sub_0204AFAC: ; 0x0204AFAC
	ldrb r1, [r0]
	ldr r0, _0204AFBC ; =_022AB0A0
	strb r1, [r0, #9]
	bx lr
	.align 2, 0
_0204AFBC: .word _022AB0A0
	arm_func_end sub_0204AFAC
