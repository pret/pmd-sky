	.include "asm/macros.inc"
	.include "main_0202C75C.inc"

	.text

	arm_func_start sub_0202C75C
sub_0202C75C: ; 0x0202C75C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1b0]
	cmp r1, #0
	beq _0202C78C
	ldrb r1, [r0, #0x1b1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl GetSelectedMenuItemIdx
	ldmia sp!, {r3, pc}
_0202C78C:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C75C
