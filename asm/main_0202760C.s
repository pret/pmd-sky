	.include "asm/macros.inc"
	.include "main_0202760C.inc"

	.text

	arm_func_start sub_0202760C
sub_0202760C: ; 0x0202760C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027620 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
#ifdef JAPAN
_02027620: .word _022A88FC
#else
_02027620: .word _022A88F0
#endif
	arm_func_end sub_0202760C

#ifdef JAPAN
	arm_func_start sub_0202796C_JP
sub_0202796C_JP: ; 0x0202796C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027980 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02027980: .word _022A88F0
	arm_func_end sub_0202796C_JP
#endif
