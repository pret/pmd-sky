	.include "asm/macros.inc"
	.include "main_0202B530.inc"

	.text

	arm_func_start sub_0202B530
sub_0202B530: ; 0x0202B530
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetSelectedItemOnPage
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B530

	arm_func_start sub_0202B544
sub_0202B544: ; 0x0202B544
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl GetCurrentPage
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B544
