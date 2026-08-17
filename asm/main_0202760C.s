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

	arm_func_start sub_02027624
sub_02027624: ; 0x02027624
	ldr r2, _02027644 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r2, r0, r1, r2
	ldrb r1, [r2, #6]
	ldrb r0, [r2, #7]
	smulbb r0, r1, r0
	mov r0, r0, lsl #5
	bx lr
	.align 2, 0
_02027644: .word WINDOW_LIST
	arm_func_end sub_02027624
