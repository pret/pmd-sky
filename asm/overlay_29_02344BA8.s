	.include "asm/macros.inc"
	.include "overlay_29_02344BA8.inc"

	.text

	arm_func_start PrepareItemForPrinting2
PrepareItemForPrinting2: ; 0x02344BA8
	stmdb sp!, {r3, lr}
	add r3, r0, r1, lsl #2
	orr ip, r1, #0x40000
	mov r0, r1
	mov r1, r2
	ldr r2, _02344BCC ; =ov29_023531BC
	str ip, [r3, #0x10]
	bl SubstitutePlaceholderItemTags
	ldmia sp!, {r3, pc}
	.align 2, 0
_02344BCC: .word ov29_023531BC
	arm_func_end PrepareItemForPrinting2
