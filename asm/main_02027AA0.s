	.include "asm/macros.inc"
	.include "main_02027AA0.inc"

	.text

	arm_func_start sub_02027AA0
sub_02027AA0: ; 0x02027AA0
	cmp r0, #1
	ldreq r0, _02027AE4 ; =_020AFD4C
	moveq r1, #1
#ifdef JAPAN
	streqb r1, [r0, #3]
#else
	streqb r1, [r0]
#endif
	bxeq lr
	cmp r0, #2
	ldreq r0, _02027AE4 ; =_020AFD4C
	moveq r1, #1
#ifdef JAPAN
	streqb r1, [r0]
#else
	streqb r1, [r0, #3]
#endif
	bxeq lr
	ldr r0, _02027AE8 ; =_020AFD9C
	ldr r1, _02027AEC ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #1
	eor r0, r0, #1
	strb r2, [r1, r0]
	bx lr
	.align 2, 0
_02027AE4: .word _020AFD4C
_02027AE8: .word _020AFD9C
_02027AEC: .word _020AFD94
	arm_func_end sub_02027AA0
