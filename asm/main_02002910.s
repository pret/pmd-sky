	.include "asm/macros.inc"
	.include "main_02002910.inc"

	.text

	arm_func_start sub_02002910
sub_02002910: ; 0x02002910
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_TryLockMutex
	tst r0, #0xff
	beq _02002944
	ldr r0, [r4, #0xc]
	cmp r0, #1
	movle r0, #1
	ldmleia sp!, {r4, pc}
	mov r0, r4
	bl OS_UnlockMutex
	mov r0, #0
	ldmia sp!, {r4, pc}
_02002944:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002910

	arm_func_start sub_0200294C
sub_0200294C: ; 0x0200294C
	bx lr
	arm_func_end sub_0200294C

	arm_func_start sub_02002950
sub_02002950: ; 0x02002950
	stmdb sp!, {r3, lr}
	mov r3, r0
	add r1, r3, #4
	add r0, r3, #8
	mov r2, #1
	str r1, [r3]
	bl OS_InitMessageQueue
	bl sub_02002670
	ldr r0, _0200299C ; =_0229B0E8
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	ldrgt r1, [r0]
	strgt r1, [r0, #4]
	bl sub_020026B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200299C: .word _0229B0E8
	arm_func_end sub_02002950

	arm_func_start sub_020029A0
sub_020029A0: ; 0x020029A0
	ldr ip, _020029B4 ; =OS_SendMessage
	mov r1, #0
	mov r2, r1
	add r0, r0, #8
	bx ip
	.align 2, 0
_020029B4: .word OS_SendMessage
	arm_func_end sub_020029A0

	arm_func_start sub_020029B8
sub_020029B8: ; 0x020029B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02002A40 ; =OSi_ThreadInfo
	mov r4, r0
	ldr sb, [r1, #4]
	mov r7, #0
	mov r0, sb
	bl OS_GetThreadPriority
	mov r8, r0
	mov r0, sb
	mov r1, #7
	bl OS_SetThreadPriority
	mov r5, r7
	b _020029F0
_020029EC:
	add r7, r7, #1
_020029F0:
	mov r1, r5
	mov r2, r5
	add r0, r4, #8
	bl OS_SendMessage
	cmp r0, #0
	bne _020029EC
	add r6, sp, #0
	mov r5, #0
_02002A10:
	mov r1, r6
	mov r2, r5
	add r0, r4, #8
	bl OS_ReceiveMessage
	cmp r0, #0
	subne r7, r7, #1
	bne _02002A10
	mov r0, sb
	mov r1, r8
	bl OS_SetThreadPriority
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02002A40: .word OSi_ThreadInfo
	arm_func_end sub_020029B8

	arm_func_start sub_02002A44
sub_02002A44: ; 0x02002A44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002A94 ; =OSi_ThreadInfo
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	mov r4, r0
	mov r0, r5
	mov r1, #6
	bl OS_SetThreadPriority
	add r1, sp, #0
	add r0, r6, #8
	mov r2, #1
	bl OS_ReceiveMessage
	mov r0, r5
	mov r1, r4
	bl OS_SetThreadPriority
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002A94: .word OSi_ThreadInfo
	arm_func_end sub_02002A44

	arm_func_start sub_02002A98
sub_02002A98: ; 0x02002A98
	bx lr
	arm_func_end sub_02002A98

	arm_func_start sub_02002A9C
sub_02002A9C: ; 0x02002A9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	str r1, [r6, #0xa4]
	add r1, r6, #4
	str r2, [r6, #0xa8]
	str r1, [r6]
	ldr r2, [r6, #0xa4]
	add r0, r6, #0x84
	bl OS_InitMessageQueue
	mov r5, #0
	mov r4, r5
	b _02002AE0
_02002ACC:
	mov r1, r4
	mov r2, r4
	add r0, r6, #0x84
	bl OS_SendMessage
	add r5, r5, #1
_02002AE0:
	ldr r0, [r6, #0xa8]
	cmp r5, r0
	blt _02002ACC
	bl sub_02002670
	ldr r0, _02002B1C ; =_0229B0F0
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	ldrgt r1, [r0]
	strgt r1, [r0, #4]
	bl sub_020026B8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002B1C: .word _0229B0F0
	arm_func_end sub_02002A9C

	arm_func_start sub_02002B20
sub_02002B20: ; 0x02002B20
	ldr ip, _02002B34 ; =OS_SendMessage
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bx ip
	.align 2, 0
_02002B34: .word OS_SendMessage
	arm_func_end sub_02002B20

	arm_func_start sub_02002B38
sub_02002B38: ; 0x02002B38
	ldr ip, _02002B4C ; =OS_SendMessage
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bx ip
	.align 2, 0
_02002B4C: .word OS_SendMessage
	arm_func_end sub_02002B38

	arm_func_start sub_02002B50
sub_02002B50: ; 0x02002B50
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0x98]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bl OS_SendMessage
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002B50

	arm_func_start sub_02002B7C
sub_02002B7C: ; 0x02002B7C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002BCC ; =OSi_ThreadInfo
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	mov r4, r0
	mov r0, r5
	mov r1, #6
	bl OS_SetThreadPriority
	add r1, sp, #0
	add r0, r6, #0x84
	mov r2, #1
	bl OS_ReceiveMessage
	mov r0, r5
	mov r1, r4
	bl OS_SetThreadPriority
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002BCC: .word OSi_ThreadInfo
	arm_func_end sub_02002B7C

	arm_func_start sub_02002BD0
sub_02002BD0: ; 0x02002BD0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002C28 ; =OSi_ThreadInfo
	mov r5, r0
	ldr r6, [r1, #4]
	mov r0, r6
	bl OS_GetThreadPriority
	mov r4, r0
	mov r0, r6
	mov r1, #6
	bl OS_SetThreadPriority
	add r1, sp, #0
	add r0, r5, #0x84
	mov r2, #0
	bl OS_ReceiveMessage
	and r5, r0, #0xff
	mov r0, r6
	mov r1, r4
	bl OS_SetThreadPriority
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002C28: .word OSi_ThreadInfo
	arm_func_end sub_02002BD0

	arm_func_start sub_02002C2C
sub_02002C2C: ; 0x02002C2C
	ldr ip, _02002C38 ; =OS_InitMutex
	ldr r0, _02002C3C ; =_0229B0F8
	bx ip
	.align 2, 0
_02002C38: .word OS_InitMutex
_02002C3C: .word _0229B0F8
	arm_func_end sub_02002C2C

	arm_func_start sub_02002C40
sub_02002C40: ; 0x02002C40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002CA4 ; =OSi_ThreadInfo
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl OS_SetThreadPriority
	ldr r0, _02002CA8 ; =_0229B0F8
	bl OS_LockMutex
	mov r0, r6
	bl sub_020028B0
	bl sub_02002580
	str r0, [r6, #0x18]
	mov r0, #0
	str r0, [r6, #0x20]
	str r0, [r6, #0x1c]
	ldr r0, _02002CA8 ; =_0229B0F8
	bl OS_UnlockMutex
	mov r0, r5
	mov r1, r4
	bl OS_SetThreadPriority
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002CA4: .word OSi_ThreadInfo
_02002CA8: .word _0229B0F8
	arm_func_end sub_02002C40

	arm_func_start sub_02002CAC
sub_02002CAC: ; 0x02002CAC
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02002CAC

	arm_func_start sub_02002CB4
sub_02002CB4: ; 0x02002CB4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002D10 ; =OSi_ThreadInfo
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	ldr r1, [r6, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002CF4
	cmp r1, r4
	movhs r4, #0
	bhs _02002CF8
	mov r0, r5
	bl OS_SetThreadPriority
	b _02002CF8
_02002CF4:
	mov r4, #0
_02002CF8:
	mov r0, r6
	bl sub_02002904
	str r4, [r6, #0x1c]
	bl sub_02002580
	str r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002D10: .word OSi_ThreadInfo
	arm_func_end sub_02002CB4

	arm_func_start sub_02002D14
sub_02002D14: ; 0x02002D14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02002D7C ; =OSi_ThreadInfo
	mov r7, r0
	ldr r5, [r2, #4]
	mov r6, r1
	mov r0, r5
	bl OS_GetThreadPriority
	ldr r1, [r7, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002D58
	cmp r1, r4
	movhs r4, #0
	bhs _02002D5C
	mov r0, r5
	bl OS_SetThreadPriority
	b _02002D5C
_02002D58:
	mov r4, #0
_02002D5C:
	mov r0, r6
	bl sub_02002B7C
	mov r0, r7
	bl sub_02002904
	str r4, [r7, #0x1c]
	bl sub_02002580
	str r0, [r7, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02002D7C: .word OSi_ThreadInfo
	arm_func_end sub_02002D14

	arm_func_start sub_02002D80
sub_02002D80: ; 0x02002D80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl sub_02002580
	mov r4, r0
	ldr r0, [r4]
	bl OS_GetThreadPriority
	ldr r1, [r7, #0x20]
	mov r5, r0
	cmp r1, #0
	beq _02002DC4
	cmp r1, r5
	movhs r5, #0
	bhs _02002DC8
	ldr r0, [r4]
	bl OS_SetThreadPriority
	b _02002DC8
_02002DC4:
	mov r5, #0
_02002DC8:
	mov r0, r6
	bl sub_02002BD0
	cmp r0, #0
	beq _02002DF4
	mov r0, r7
	bl sub_02002904
	str r5, [r7, #0x1c]
	bl sub_02002580
	str r0, [r7, #0x18]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02002DF4:
	cmp r5, #0
	beq _02002E08
	mov r0, r4
	mov r1, r5
	bl sub_020027F8
_02002E08:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02002D80

	arm_func_start sub_02002E10
sub_02002E10: ; 0x02002E10
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002E94 ; =OSi_ThreadInfo
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	ldr r1, [r6, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002E50
	cmp r1, r4
	movhs r4, #0
	bhs _02002E54
	mov r0, r5
	bl OS_SetThreadPriority
	b _02002E54
_02002E50:
	mov r4, #0
_02002E54:
	mov r0, r6
	bl sub_02002910
	cmp r0, #0
	beq _02002E78
	str r4, [r6, #0x1c]
	bl sub_02002580
	str r0, [r6, #0x18]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02002E78:
	cmp r4, #0
	beq _02002E8C
	mov r0, r5
	mov r1, r4
	bl OS_SetThreadPriority
_02002E8C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002E94: .word OSi_ThreadInfo
	arm_func_end sub_02002E10

	arm_func_start sub_02002E98
sub_02002E98: ; 0x02002E98
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #0x1c]
	ldr r5, [r0, #0x18]
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	bl sub_020028F8
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl sub_020027F8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02002E98

	arm_func_start sub_02002ECC
sub_02002ECC: ; 0x02002ECC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x1c]
	ldr r5, [r0, #0x18]
	mov r2, #0
	str r2, [r0, #0x18]
	mov r6, r1
	str r2, [r0, #0x1c]
	bl sub_020028F8
	mov r0, r6
	bl sub_02002B20
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	mov r1, r4
	bl sub_020027F8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02002ECC

	arm_func_start sub_02002F0C
sub_02002F0C: ; 0x02002F0C
	stmdb sp!, {r3, lr}
	ldr r0, _02002F30 ; =_020AEF58
	bl sub_02002C40
	ldr r0, _02002F30 ; =_020AEF58
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02002F30 ; =_020AEF58
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02002F30: .word _020AEF58
	arm_func_end sub_02002F0C

	arm_func_start sub_02002F34
sub_02002F34: ; 0x02002F34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02002F78 ; =_020AEF58
	mov r4, r1
	bl sub_02002CB4
	mov r0, r4, lsl #2
	mov r1, #1
	bl MemAlloc
	str r0, [r5, #0x20]
	str r4, [r5, #0x24]
	ldr r1, [r5, #0x20]
	mov r0, r5
	mov r2, r4
	bl OS_InitMessageQueue
	ldr r0, _02002F78 ; =_020AEF58
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02002F78: .word _020AEF58
	arm_func_end sub_02002F34

	arm_func_start sub_02002F7C
sub_02002F7C: ; 0x02002F7C
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	bl OS_SendMessage
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002F7C

	arm_func_start sub_02002F98
sub_02002F98: ; 0x02002F98
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	bl OS_ReceiveMessage
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002F98

	arm_func_start sub_02002FB4
sub_02002FB4: ; 0x02002FB4
	bx lr
	arm_func_end sub_02002FB4

	arm_func_start sub_02002FB8
sub_02002FB8: ; 0x02002FB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02003024 ; =_0229B110
	mov r6, #0
	strh r6, [r0]
	cmp r6, #6
	ldr r5, _02003028 ; =_0229B114
	bge _0200301C
	mov r4, r6
	b _02003014
_02002FDC:
	mov r0, r5
	bl sub_02002C40
	cmp r6, #4
	str r4, [r5, #0x24]
	cmpne r6, #5
	bne _02003000
	bl OS_GetLockID
	strh r0, [r5, #0x28]
	b _02003004
_02003000:
	strh r4, [r5, #0x28]
_02003004:
	mov r0, r5
	bl sub_02002E98
	add r6, r6, #1
	add r5, r5, #0x2c
_02003014:
	cmp r6, #6
	blt _02002FDC
_0200301C:
	bl sub_020059A8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02003024: .word _0229B110
_02003028: .word _0229B114
	arm_func_end sub_02002FB8

	arm_func_start sub_0200302C
sub_0200302C: ; 0x0200302C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	movs r8, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	bl sub_02002580
	mov r7, r0
	mov r6, #0
	ldr r5, _020030C4 ; =_0229B114
	mov r4, #1
	ldr sl, _020030C8 ; =_0229B110
	b _020030B8
_02003054:
	mov r0, r4, lsl r6
	mov sb, r0, lsl #0x10
	tst r8, sb, lsr #16
	beq _020030B0
	mov r0, r5
	bl sub_02002CB4
	bl InterruptMasterDisable
	ldrh r0, [sl]
	ldrh r0, [sl]
	str r7, [r5, #0x24]
	orr r0, r0, sb, lsr #16
	strh r0, [sl]
	bl InterruptMasterEnable
	cmp r6, #4
	beq _0200309C
	cmp r6, #5
	beq _020030A8
	b _020030B0
_0200309C:
	ldrh r0, [r5, #0x28]
	bl Card_LockRom
	b _020030B0
_020030A8:
	ldrh r0, [r5, #0x28]
	bl Card_LockBackup
_020030B0:
	add r6, r6, #1
	add r5, r5, #0x2c
_020030B8:
	cmp r6, #6
	blt _02003054
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020030C4: .word _0229B114
_020030C8: .word _0229B110
	arm_func_end sub_0200302C

	arm_func_start InterruptMasterDisable
InterruptMasterDisable: ; 0x020030CC
	ldr r2, _020030E0 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_020030E0: .word 0x04000208
	arm_func_end InterruptMasterDisable

	arm_func_start InterruptMasterEnable
InterruptMasterEnable: ; 0x020030E4
	ldr r2, _020030F8 ; =0x04000208
	mov r1, #1
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_020030F8: .word 0x04000208
	arm_func_end InterruptMasterEnable

	arm_func_start sub_020030FC
sub_020030FC: ; 0x020030FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_02002580
	mov r1, #7
	mov r8, r0
	bl sub_020027F8
	mov sb, r0
	mov r7, #0
	ldr r6, _020031B8 ; =_0229B114
	mov fp, #1
	ldr r5, _020031BC ; =_0229B110
	b _020031A0
_02003130:
	mov r0, fp, lsl r7
	mov r4, r0, lsl #0x10
	tst sl, r4, lsr #16
	beq _02003198
	cmp r7, #4
	beq _02003154
	cmp r7, #5
	beq _02003160
	b _02003168
_02003154:
	ldrh r0, [r6, #0x28]
	bl Card_UnlockRom
	b _02003168
_02003160:
	ldrh r0, [r6, #0x28]
	bl Card_UnlockBackup
_02003168:
	bl InterruptMasterDisable
	ldrh r0, [r5]
	mvn r1, r4, lsr #16
	ldrh r0, [r5]
	ldrh r2, [r5]
	mov r0, #0
	str r0, [r6, #0x24]
	and r0, r2, r1
	strh r0, [r5]
	bl InterruptMasterEnable
	mov r0, r6
	bl sub_02002E98
_02003198:
	add r7, r7, #1
	add r6, r6, #0x2c
_020031A0:
	cmp r7, #6
	blt _02003130
	mov r0, r8
	mov r1, sb
	bl sub_020027F8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020031B8: .word _0229B114
_020031BC: .word _0229B110
	arm_func_end sub_020030FC

	arm_func_start sub_020031C0
sub_020031C0: ; 0x020031C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_02002580
	mov r5, #0
	mov lr, r5
	cmp r5, #6
	ldr ip, _02003218 ; =_0229B114
	bge _02003210
	mov r3, #1
	b _02003208
_020031E8:
	mov r1, r3, lsl lr
	mov r1, r1, lsl #0x10
	tst r4, r1, lsr #16
	ldrne r2, [ip, #0x24]
	add lr, lr, #1
	cmpne r2, r0
	orrne r5, r5, r1, lsr #16
	add ip, ip, #0x2c
_02003208:
	cmp lr, #6
	blt _020031E8
_02003210:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02003218: .word _0229B114
	arm_func_end sub_020031C0

	arm_func_start InitMemAllocTableVeneer
InitMemAllocTableVeneer: ; 0x0200321C
	ldr ip, _02003224 ; =InitMemAllocTable
	bx ip
	.align 2, 0
_02003224: .word InitMemAllocTable
	arm_func_end InitMemAllocTableVeneer
