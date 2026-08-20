	.include "asm/macros.inc"
	.include "overlay_29_02344B1C.inc"

	.text

	arm_func_start ov29_02344B1C
ov29_02344B1C: ; 0x02344B1C
	ldr r0, _02344B2C ; =ov29_023537B0
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_02344B2C: .word ov29_023537B0
	arm_func_end ov29_02344B1C

	arm_func_start ov29_02344B30
ov29_02344B30: ; 0x02344B30
	ldr r0, _02344B40 ; =ov29_023537B0
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_02344B40: .word ov29_023537B0
	arm_func_end ov29_02344B30

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

	arm_func_start ov29_02344B9C
ov29_02344B9C: ; 0x02344B9C
	ldr ip, _02344BA4 ; =SetPreprocessorArgsIdVal
	bx ip
	.align 2, 0
_02344BA4: .word SetPreprocessorArgsIdVal
	arm_func_end ov29_02344B9C

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

	arm_func_start GenerateStandardItem
GenerateStandardItem: ; 0x02344BD0
	ldr ip, _02344BE0 ; =GenerateItem
	mov r3, r2
	mov r2, #0
	bx ip
	.align 2, 0
_02344BE0: .word GenerateItem
	arm_func_end GenerateStandardItem
