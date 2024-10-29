	.include "asm/macros.inc"
	.include "main_0207F40C.inc"

	.text

	arm_func_start sub_0207F40C
sub_0207F40C: ; 0x0207F40C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r7, r1
	ldrb r1, [r7]
	mov r8, r0
	mov r6, r2
	cmp r1, #0x2f
	mov r5, r3
	cmpne r1, #0x5c
	bne _0207F458
	ldr r0, _0207F54C ; =_022BB5EC
	mov r1, #0
	ldr r0, [r0]
	strh r1, [sp, #4]
	str r0, [sp]
	str r1, [sp, #8]
	strh r1, [sp, #6]
	add r7, r7, #1
	b _0207F4FC
_0207F458:
	ldr r0, _0207F54C ; =_022BB5EC
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r4, #0
_0207F46C:
	ldrb r0, [r7, r4]
	cmp r0, #0
	cmpne r0, #0x2f
	cmpne r0, #0x5c
	beq _0207F4FC
	cmp r0, #0x3a
	bne _0207F4F0
	mov r0, r7
	mov r1, r4
	bl sub_0207EDB4
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, [r0, #0x1c]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #8]
	strh r1, [sp, #6]
	strh r1, [sp, #4]
	add r0, r4, #1
	ldrb r0, [r7, r0]!
	cmp r0, #0x2f
	cmpne r0, #0x5c
	addeq r7, r7, #1
	b _0207F4FC
_0207F4F0:
	add r4, r4, #1
	cmp r4, #3
	ble _0207F46C
_0207F4FC:
	ldr r1, [sp]
	add r0, sp, #0
	str r1, [r8, #8]
	str r7, [r8, #0x3c]
	add r3, r8, #0x30
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	cmp r5, #0
	moveq r0, #0
	streq r0, [r8, #0x40]
	streq r6, [r8, #0x44]
	beq _0207F538
	mov r0, #1
	str r0, [r8, #0x40]
	str r5, [r8, #0x44]
_0207F538:
	mov r0, r8
	mov r1, #4
	bl sub_0207EBE4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207F54C: .word _022BB5EC
	arm_func_end sub_0207F40C

; https://decomp.me/scratch/ioqaD
	arm_func_start sub_0207F550
sub_0207F550: ; 0x0207F550
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #0x2c]
	ldr r0, [r7, #0x28]
	mov r6, r2
	str r1, [r7, #0x30]
	sub r0, r0, r4
	cmp r6, r0
	movgt r6, r0
	cmp r6, #0
	movlt r6, #0
	str r2, [r7, #0x34]
	mov r5, r3
	str r6, [r7, #0x38]
	cmp r5, #0
	ldreq r0, [r7, #0xc]
	mov r1, #0
	orreq r0, r0, #4
	streq r0, [r7, #0xc]
	mov r0, r7
	bl sub_0207EBE4
	cmp r5, #0
	bne _0207F5C4
	mov r0, r7
	bl sub_0207F748
	cmp r0, #0
	ldrne r0, [r7, #0x2c]
	subne r6, r0, r4
	mvneq r6, #0
_0207F5C4:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207F550

	arm_func_start sub_0207F5CC
sub_0207F5CC: ; 0x0207F5CC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	add r0, sp, #0
	mov r4, r1
	bl FileInit
	add r0, sp, #0
	mov r1, r4
	mov r2, r5
	mov r3, #0
	bl sub_0207F40C
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207F5CC

	arm_func_start sub_0207F60C
sub_0207F60C: ; 0x0207F60C
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #8]
	ldr ip, [sp, #8]
	mov r1, #7
	str ip, [r4, #0x38]
	str r2, [r4, #0x30]
	str r3, [r4, #0x34]
	bl sub_0207EBE4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc]
	mov r0, #1
	orr r1, r1, #0x10
	bic r1, r1, #0x20
	str r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207F60C

	arm_func_start sub_0207F654
sub_0207F654: ; 0x0207F654
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r1, [sp, #0xc]
	mov r4, r0
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	str r1, [r4, #8]
	str r1, [r4, #0x30]
	ldr r2, [sp, #0x10]
	mov r1, #6
	str r2, [r4, #0x34]
	bl sub_0207EBE4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, [r4, #0xc]
	mov r0, #1
	orr r1, r1, #0x10
	bic r1, r1, #0x20
	str r1, [r4, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0207F654

	arm_func_start sub_0207F6C4
sub_0207F6C4: ; 0x0207F6C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	add r0, sp, #0
	bl sub_0207F5CC
	cmp r0, #0
	beq _0207F700
	add r1, sp, #0
	mov r0, r4
	ldmia r1, {r1, r2}
	bl sub_0207F654
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r4, pc}
_0207F700:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207F6C4

	arm_func_start sub_0207F70C
sub_0207F70C: ; 0x0207F70C
	stmdb sp!, {r4, lr}
	mov r1, #8
	mov r4, r0
	bl sub_0207EBE4
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r4, pc}
	str r0, [r4, #8]
	mov r0, #0xe
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xc]
	mov r0, #1
	bic r1, r1, #0x30
	str r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207F70C

	arm_func_start sub_0207F748
sub_0207F748: ; 0x0207F748
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, #0
	bl EnableIrqFlag
	ldr r1, [r6, #0xc]
	mov r4, r0
	tst r1, #1
	movne r0, #1
	moveq r0, r5
	cmp r0, #0
	beq _0207F7D8
	ldr r0, [r6, #0xc]
	tst r0, #0x44
	moveq r5, #1
	movne r5, #0
	cmp r5, #0
	beq _0207F7B0
	ldr r0, [r6, #0xc]
	orr r0, r0, #4
	str r0, [r6, #0xc]
_0207F798:
	add r0, r6, #0x18
	bl sub_02079888
	ldr r0, [r6, #0xc]
	tst r0, #0x40
	beq _0207F798
	b _0207F7D8
_0207F7B0:
	mov r7, #0
	mov r8, #1
_0207F7B8:
	add r0, r6, #0x18
	bl sub_02079888
	ldr r0, [r6, #0xc]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	bne _0207F7B8
_0207F7D8:
	mov r0, r4
	bl SetIrqFlag
	cmp r5, #0
	beq _0207F7F4
	mov r0, r6
	bl sub_0207EBA0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207F7F4:
	ldr r0, [r6, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207F748

	arm_func_start sub_0207F808
sub_0207F808: ; 0x0207F808
	ldr ip, _0207F814 ; =sub_0207F550
	mov r3, #1
	bx ip
	.align 2, 0
_0207F814: .word sub_0207F550
	arm_func_end sub_0207F808
