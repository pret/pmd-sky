	.include "asm/macros.inc"
	.include "overlay_29_0232CE50.inc"

	.text

	arm_func_start DoMoveVacuumCut
DoMoveVacuumCut: ; 0x0232CE50
	stmdb sp!, {r3, lr}
	ldr ip, _0232CE78 ; =ov10_022C456C
	str r3, [sp]
	ldrsh r3, [ip]
	bl ov29_02332F18
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0232CE78: .word ov10_022C456C
	arm_func_end DoMoveVacuumCut

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
