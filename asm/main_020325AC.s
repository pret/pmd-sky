	.include "asm/macros.inc"
	.include "main_020325AC.inc"

	.text

	arm_func_start sub_020325AC
sub_020325AC: ; 0x020325AC
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325AC

	arm_func_start sub_020325E8
sub_020325E8: ; 0x020325E8
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r2, [r0, #0xbc]
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0, #0xbc]
	subge r1, r1, #1
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325E8

	arm_func_start sub_0203261C
sub_0203261C: ; 0x0203261C
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_0203261C

	arm_func_start sub_02032654
sub_02032654: ; 0x02032654
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	movmi r1, #0
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032654

	arm_func_start sub_02032684
sub_02032684: ; 0x02032684
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	strb r0, [r5, #0xd4]
	movs r4, r1
	ldr r0, [r5, #0x10]
	movmi r4, #0
	tst r0, #0x8000
	beq _020326E0
	ldr r0, [r5, #0xd0]
	ldr r1, [r5, #0xc4]
	cmp r4, r0
	subge r4, r0, #1
	mov r0, r4
	bl _s32_div_f
	str r0, [r5, #0xc8]
	ldr r1, [r5, #0xc4]
	mov r0, r4
	bl _s32_div_f
	mov r0, r5
	str r1, [r5, #0xbc]
	bl sub_02032754
	ldmia sp!, {r3, r4, r5, pc}
_020326E0:
	ldr r0, [r5, #0xc0]
	cmp r4, r0
	subge r0, r0, #1
	strge r0, [r5, #0xbc]
	strlt r4, [r5, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02032684

	arm_func_start sub_020326F8
sub_020326F8: ; 0x020326F8
	mov r3, #1
	cmp r1, #0
	movlt r1, #0
	strb r3, [r0, #0xd4]
	cmp r1, r2
	ldrge r1, [r0, #0xc0]
	subge r1, r1, #1
	str r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020326F8

	arm_func_start sub_0203271C
sub_0203271C: ; 0x0203271C
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_02032754
	ldr r0, [r4, #0xcc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	orrge r0, r0, #0x10000
	biclt r0, r0, #0x10000
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203271C

	arm_func_start sub_02032754
sub_02032754: ; 0x02032754
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldr r1, [r4, #0xc8]
	sub r0, r0, #1
	cmp r1, r0
	strge r0, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032754
