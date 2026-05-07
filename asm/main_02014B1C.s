	.include "asm/macros.inc"
	.include "main_02014B1C.inc"

	.text

	arm_func_start sub_02014B1C
sub_02014B1C: ; 0x02014B1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014B1C

	arm_func_start sub_02014B74
sub_02014B74: ; 0x02014B74
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_02014B84:
	mov r0, r6
	add r1, r5, r4, lsl #3
	bl sub_02014B1C
	add r4, r4, #1
	cmp r4, #4
	blt _02014B84
	mov r0, r6
	add r1, r5, #0x20
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02014B74

	arm_func_start sub_02014BB0
sub_02014BB0: ; 0x02014BB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #8
	bl memset
	mov r0, r5
	mov r1, r4
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014BB0

	arm_func_start sub_02014C20
sub_02014C20: ; 0x02014C20
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_02014C30:
	mov r0, r6
	add r1, r5, r4, lsl #3
	bl sub_02014BB0
	add r4, r4, #1
	cmp r4, #4
	blt _02014C30
	mov r3, #0
	mov r0, r6
	add r1, r5, #0x20
	mov r2, #8
	strb r3, [r5, #0x20]
	bl CopyBitsFrom
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02014C20
