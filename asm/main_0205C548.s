	.include "asm/macros.inc"
	.include "main_0205C548.inc"

	.text

	arm_func_start sub_0205C548
sub_0205C548: ; 0x0205C548
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	bl sub_02051620
	ldrb r0, [r4]
	cmp r0, #1
	bne _0205C584
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsTo
_0205C584:
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x40
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1d
	mov r2, #0x50
	bl CopyBitsTo
	ldrb r0, [r4]
	cmp r0, #1
	beq _0205C5E0
	mov r0, r5
	add r1, r4, #0xa0
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xa2
	mov r2, #0xa
	bl CopyBitsTo
_0205C5E0:
	mov r0, r5
	add r1, r4, #0xa4
	mov r2, #0x40
	bl CopyBitsTo
	ldrb r0, [r4, #0xae]
	mov r2, #1
	tst r0, #1
	ldreq r1, _0205C680 ; =_020A3671
	mov r0, r5
	ldrne r1, _0205C684 ; =_020A3672
	bl CopyBitsTo
	ldr r1, _0205C684 ; =_020A3672
	mov r0, r5
	mov r2, #1
	bl CopyBitsTo
	ldrb r0, [r4]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xae]
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r2, [r4, #0xa0]
	add r1, sp, #2
	mov r0, r5
	mov r2, r2, asr #0xa
	strh r2, [sp, #2]
	ldrsh r3, [r4, #0xa2]
	mov r2, #1
	mov r3, r3, asr #0xa
	strh r3, [sp]
	bl CopyBitsTo
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205C680: .word _020A3671
_0205C684: .word _020A3672
	arm_func_end sub_0205C548

	arm_func_start sub_0205C688
sub_0205C688: ; 0x0205C688
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	bne _0205C6C4
	mov r0, r4
	bl sub_02054F18
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_0205C6C4:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205C688

	arm_func_start sub_0205C6CC
sub_0205C6CC: ; 0x0205C6CC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	mov r0, r4
	bne _0205C6F8
	bl IsMovesetValidInTimeDarkness
	ldmia sp!, {r4, pc}
_0205C6F8:
	bl IsMovesetValid
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205C6CC

	arm_func_start sub_0205C700
sub_0205C700: ; 0x0205C700
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl sub_0205C688
	cmp r0, #0
	beq _0205C72C
	mov r0, r5
	mov r1, r4
	bl sub_0205C6CC
	cmp r0, #0
	bne _0205C734
_0205C72C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205C734:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205C700
