	.include "asm/macros.inc"
	.include "overlay_29_022F52B0.inc"

	.text

	arm_func_start ov29_022F52B0
ov29_022F52B0: ; 0x022F52B0
	ldr ip, _022F52B8 ; =ov29_02343D30
	bx ip
	.align 2, 0
_022F52B8: .word ov29_02343D30
	arm_func_end ov29_022F52B0
