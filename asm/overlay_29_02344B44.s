	.include "asm/macros.inc"
	.include "overlay_29_02344B44.inc"

	.text

	arm_func_start PrepareItemForPrinting__02345728
PrepareItemForPrinting__02345728: ; 0x02344B44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	orr r1, r5, #0x40000
	bl SetPreprocessorArgsIdVal
	ldr r2, _02344B6C ; =ov29_023531BC
	mov r0, r5
	mov r1, r4
	bl SubstitutePlaceholderItemTags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02344B6C: .word ov29_023531BC
	arm_func_end PrepareItemForPrinting__02345728

	arm_func_start PrepareItemForPrinting__02345754
PrepareItemForPrinting__02345754: ; 0x02344B70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	orr r1, r5, #0x40000
	bl SetPreprocessorArgsIdVal
	ldr r2, _02344B98 ; =ov29_023531A4
	mov r0, r5
	mov r1, r4
	bl SubstitutePlaceholderItemTags
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02344B98: .word ov29_023531A4
	arm_func_end PrepareItemForPrinting__02345754
