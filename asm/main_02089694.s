	.include "asm/macros.inc"
	.include "main_02089694.inc"

	.text

; https://decomp.me/scratch/4hRt5
	arm_func_start strcpy
strcpy: ; 0x02089694
	stmdb sp!, {r3, r4, r5, lr}
	and r4, r1, #3
	and r3, r0, #3
	mov r2, r0
	cmp r3, r4
	bne _02089730
	cmp r4, #0
	beq _020896EC
	ldrb r3, [r1]
	strb r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	rsbs r4, r4, #3
	beq _020896E4
_020896CC:
	ldrb r3, [r1, #1]!
	cmp r3, #0
	strb r3, [r2, #1]!
	ldmeqia sp!, {r3, r4, r5, pc}
	subs r4, r4, #1
	bne _020896CC
_020896E4:
	add r2, r2, #1
	add r1, r1, #1
_020896EC:
	ldr r5, [r1]
	ldr r3, _02089754 ; =0xFEFEFEFF
	mvn r4, r5
	add lr, r5, r3
	ldr ip, _02089758 ; =0x80808080
	and r4, lr, r4
	tst r4, ip
	bne _02089730
	sub r2, r2, #4
_02089710:
	str r5, [r2, #4]!
	ldr r5, [r1, #4]!
	add r4, r5, r3
	mvn lr, r5
	and lr, r4, lr
	tst lr, ip
	beq _02089710
	add r2, r2, #4
_02089730:
	ldrb r3, [r1]
	strb r3, [r2]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02089740:
	ldrb r3, [r1, #1]!
	cmp r3, #0
	strb r3, [r2, #1]!
	bne _02089740
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02089754: .word 0xFEFEFEFF
_02089758: .word 0x80808080
	arm_func_end strcpy

	arm_func_start strncpy
strncpy: ; 0x0208975C
	stmdb sp!, {r3, lr}
	mov lr, r0
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
_0208976C:
	ldrsb r3, [r1], #1
	mov ip, lr
	strb r3, [lr], #1
	ldrsb r3, [ip]
	cmp r3, #0
	bne _020897A0
	subs r2, r2, #1
	ldmeqia sp!, {r3, pc}
	mov r1, #0
_02089790:
	strb r1, [lr], #1
	subs r2, r2, #1
	bne _02089790
	ldmia sp!, {r3, pc}
_020897A0:
	subs r2, r2, #1
	bne _0208976C
	ldmia sp!, {r3, pc}
	arm_func_end strncpy
