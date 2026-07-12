	.include "asm/macros.inc"
	.include "main_02015090.inc"

	.text

	arm_func_start sub_02015090
sub_02015090: ; 0x02015090
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	mov lr, r4
	mov r2, r4
	mov r3, #1
	mov r0, #6
	b _020150E0
_020150B4:
	mul ip, lr, r0
	ldrb r1, [r6, ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [r6, ip]
	addne r4, r4, #1
	bicne r1, r1, #2
	strneb r1, [r6, ip]
_020150E0:
	cmp lr, r5
	blt _020150B4
	bl Rand16Bit
	mov r1, r4
	bl _s32_div_f
	mov r0, #6
	mla r0, r1, r0, r6
	ldrh r0, [r0, #2]
	sub r3, r5, #1
	mov r2, #6
	b _02015130
_0201510C:
	mul r5, r1, r2
	add ip, r6, r5
	ldrh r4, [ip, #6]
	add r1, r1, #1
	strh r4, [r6, r5]
	ldrh r4, [ip, #8]
	strh r4, [ip, #2]
	ldrh r4, [ip, #0xa]
	strh r4, [ip, #4]
_02015130:
	cmp r1, r3
	blt _0201510C
	mov r1, #6
	mul r1, r3, r1
	mov r2, #0
	strb r2, [r6, r1]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02015090
