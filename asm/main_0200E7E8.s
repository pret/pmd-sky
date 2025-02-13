	.include "asm/macros.inc"
	.include "main_0200E7E8.inc"

	.text

	arm_func_start GetExclusiveItemParameter
GetExclusiveItemParameter: ; 0x0200E7E8
	stmdb sp!, {r3, lr}
	bl GetExclusiveItemOffsetEnsureValid
	ldr r1, _0200E804 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	add r0, r1, r0, lsl #2
	ldrsh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E804: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetExclusiveItemParameter
