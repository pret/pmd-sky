	.include "asm/macros.inc"
	.include "main_0207BC3C.inc"

	.text

    .public MI_SetWramBank
    .public MI_StopDma

    arm_func_start MI_Init
MI_Init: ; 0x0207C7C4
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl MI_SetWramBank
	mov r0, #0
	bl MI_StopDma
	ldmia sp!, {r3, pc}
	arm_func_end MI_Init
