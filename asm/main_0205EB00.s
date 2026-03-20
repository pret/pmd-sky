	.include "asm/macros.inc"
	.include "main_0205EB00.inc"

	.text

	arm_func_start sub_0205EB00
sub_0205EB00: ; 0x0205EB00
	ldr r1, _0205EB24 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x200]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205EB24: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EB00

	arm_func_start sub_0205EB28
sub_0205EB28: ; 0x0205EB28
	ldrb r3, [r1, #4]
	ldrb r2, [r0, #4]
	mov ip, #1
	cmp r2, r3
	bhi _0205EB54
	bne _0205EB50
	ldrb r2, [r0, #5]
	ldrb r0, [r1, #5]
	cmp r2, r0
	bhi _0205EB54
_0205EB50:
	mov ip, #0
_0205EB54:
	and r0, ip, #0xff
	bx lr
	arm_func_end sub_0205EB28

	arm_func_start sub_0205EB5C
sub_0205EB5C: ; 0x0205EB5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	cmpne r0, #0xe
	bne _0205EBCC
	mov r1, #0
	add r0, sp, #0
	str r1, [sp]
	bl GetAllPossibleMonsters
	mov r5, r0
	cmp r5, #0
	ldmleia sp!, {r3, r4, r5, pc}
_0205EB90:
	mov r0, r5
	bl RandInt
	ldrb r1, [r4, #1]
	ldr r2, [sp]
	mov r0, r0, lsl #1
	cmp r1, #0xb
	ldrsh r0, [r2, r0]
	ldreqsh r1, [r4, #0xe]
	cmpeq r1, r0
	bne _0205EBC4
	cmp r5, #1
	ldmleia sp!, {r3, r4, r5, pc}
	b _0205EB90
_0205EBC4:
	bl sub_02065B94
	ldmia sp!, {r3, r4, r5, pc}
_0205EBCC:
	ldrsh r0, [r4, #0xe]
	bl sub_02065B94
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205EB5C
