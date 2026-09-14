	.include "asm/macros.inc"
	.include "main_020559D8.inc"

	.text

	arm_func_start sub_020559D8
sub_020559D8: ; 0x020559D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02055B18 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr lr, [r1]
	mov r8, r0
	mov r2, r4
	mov r3, #1
	mvn r1, #0
_020559F8:
	ldrb r0, [lr]
	add lr, lr, #0x44
	tst r0, #1
	movne r0, r3
	moveq r0, r2
	tst r0, #0xff
	mov r0, r4, lsl #1
	strneh r4, [r8, r0]
	add r4, r4, #1
	streqh r1, [r8, r0]
	cmp r4, #5
	blt _020559F8
	mov r2, #0
	mov r3, #1
	ldr r0, _02055B1C ; =0x0000022B
	b _02055B0C
_02055A38:
	ldrb r1, [lr]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	bne _02055AFC
	mvn ip, #0
	mov r0, r4, lsl #1
	mov r7, lr
	mov r6, r4
	strh ip, [r8, r0]
	add lr, lr, #0x44
	add r4, r4, #1
	add sb, ip, #0x22c
	b _02055AD4
_02055A74:
	ldrb r0, [lr]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02055AC4
	mov r5, r7
	mov fp, lr
	add r7, r7, #0x44
	mov sl, #4
_02055A9C:
	ldmia fp!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs sl, sl, #1
	bne _02055A9C
	ldr r0, [fp]
	str r0, [r5]
	mov r0, r4, lsl #1
	strh r6, [r8, r0]
	add r6, r6, #1
	b _02055ACC
_02055AC4:
	mov r0, r4, lsl #1
	strh ip, [r8, r0]
_02055ACC:
	add r4, r4, #1
	add lr, lr, #0x44
_02055AD4:
	cmp r4, sb
	blt _02055A74
	mov r1, #0
	ldr r0, _02055B1C ; =0x0000022B
	b _02055AF0
_02055AE8:
	strb r1, [r7], #0x44
	add r6, r6, #1
_02055AF0:
	cmp r6, r0
	blt _02055AE8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02055AFC:
	mov r1, r4, lsl #1
	strh r4, [r8, r1]
	add r4, r4, #1
	add lr, lr, #0x44
_02055B0C:
	cmp r4, r0
	blt _02055A38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02055B18: .word TEAM_MEMBER_TABLE_PTR
_02055B1C: .word 0x0000022B
	arm_func_end sub_020559D8
