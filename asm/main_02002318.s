	.include "asm/macros.inc"
	.include "main_02002318.inc"

	.text

	arm_func_start RandRangeSafe
RandRangeSafe: ; 0x02002318
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	bge _0200234C
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r4, r5
	mul r0, r1, r0
	add r0, r5, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
_0200234C:
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r5, r4
	mul r0, r1, r0
	add r0, r4, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RandRangeSafe

	arm_func_start sub_02002368
sub_02002368: ; 0x02002368
	b _02002378
_0200236C:
	cmp r2, r1
	bxeq lr
	add r0, r0, #1
	arm_func_end sub_02002368
_02002378:
	ldrsb r2, [r0]
	cmp r2, #0
	bne _0200236C
	mov r0, #0
	bx lr
