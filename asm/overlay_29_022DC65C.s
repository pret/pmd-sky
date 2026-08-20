	.include "asm/macros.inc"
	.include "overlay_29_022DC65C.inc"

	.text

	arm_func_start ov29_022DC65C
ov29_022DC65C: ; 0x022DC65C
	ldr ip, _022DC668 ; =ov29_022DC2B8
	ldr r0, _022DC66C ; =ov29_023538B4
	bx ip
	.align 2, 0
_022DC668: .word ov29_022DC2B8
_022DC66C: .word ov29_023538B4
	arm_func_end ov29_022DC65C

	arm_func_start ov29_022DC670
ov29_022DC670: ; 0x022DC670
	ldr ip, _022DC67C ; =ov29_022DC33C
	ldr r0, _022DC680 ; =ov29_023538B4
	bx ip
	.align 2, 0
_022DC67C: .word ov29_022DC33C
_022DC680: .word ov29_023538B4
	arm_func_end ov29_022DC670
