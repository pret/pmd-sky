	.include "asm/macros.inc"

	.text

    .public _022B999C

	
    arm_func_start OSi_SetTimerReserved
OSi_SetTimerReserved: ; 0x0207AD38
	ldr r1, _0207AD50 ; =_022B999C
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0207AD50: .word _022B999C
	arm_func_end OSi_SetTimerReserved

