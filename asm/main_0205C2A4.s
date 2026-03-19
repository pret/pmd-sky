	.include "asm/macros.inc"
	.include "main_0205C2A4.inc"

	.text

	arm_func_start sub_0205C2A4
sub_0205C2A4: ; 0x0205C2A4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	bl sub_02051648
	ldrb r0, [r4]
	cmp r0, #1
	movne r0, #0
	strne r0, [r4, #8]
	bne _0205C2EC
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsFrom
_0205C2EC:
	mov r3, #0
	str r3, [r4, #0xc]
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x40
	str r3, [r4, #0x10]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x1d
	mov r2, #0x50
	bl CopyBitsFrom
	ldrb r0, [r4]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r4, #0xa0]
	streqh r0, [r4, #0xa2]
	beq _0205C360
	mov r0, r5
	add r1, r4, #0xa0
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xa2
	mov r2, #0xa
	bl CopyBitsFrom
_0205C360:
	mov r0, r5
	add r1, r4, #0xa4
	mov r2, #0x40
	bl CopyBitsFrom
	ldrb r0, [r4, #4]
	bl GetMaxRescueAttempts
	strb r0, [r4, #0xac]
	mov r2, #1
	add r1, sp, #0
	mov r0, r5
	strb r2, [r4, #0xad]
	bl CopyBitsFrom
	ldrb r0, [sp]
	add r1, sp, #0
	cmp r0, #0
	moveq r2, #0
	movne r2, #1
	strb r2, [r4, #0xae]
	mov r0, r5
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #1
	moveq r1, #2
	ldrb r0, [r4, #0xae]
	movne r1, #0
	orr r0, r0, r1
	strb r0, [r4, #0xae]
	ldrb r0, [r4]
	cmp r0, #1
	beq _0205C438
	ldrb r0, [r4, #0xae]
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _0205C438
	add r1, sp, #4
	mov r0, r5
	mov r2, #1
	bl CopyBitsFrom
	add r1, sp, #2
	mov r0, r5
	mov r2, #1
	bl CopyBitsFrom
	ldrh r1, [r4, #0xa0]
	ldrh r0, [sp, #4]
	orr r0, r1, r0, lsl #10
	strh r0, [r4, #0xa0]
	ldrsh r1, [r4, #0xa2]
	ldrsh r0, [sp, #2]
	orr r0, r1, r0, lsl #10
	strh r0, [r4, #0xa2]
_0205C438:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205C2A4
