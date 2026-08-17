	.include "asm/macros.inc"
	.include "main_02030850.inc"

	.text

	arm_func_start CloseAdvancedTextBox2
CloseAdvancedTextBox2: ; 0x02030850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0202836C
	mov r0, r5
	bl sub_020288DC
	mov r0, r5
	bl sub_0202812C
	mov r0, r5
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox2
