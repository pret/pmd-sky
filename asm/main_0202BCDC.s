	.include "asm/macros.inc"
	.include "main_0202BCDC.inc"

	.text

	arm_func_start IsAdvancedMenuActive
IsAdvancedMenuActive: ; 0x0202BCDC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive
