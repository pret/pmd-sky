	.include "asm/macros.inc"
	.include "overlay_29_0232CE7C.inc"

	.text

	arm_func_start DoMoveReviver
DoMoveReviver: ; 0x0232CE7C
	stmdb sp!, {r3, lr}
	ldr r2, _0232CE90 ; =0x00000F09
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_0232CE90: .word 0x00000C4B
#else
_0232CE90: .word 0x00000F09
#endif
	arm_func_end DoMoveReviver
