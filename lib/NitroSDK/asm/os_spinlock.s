	.include "asm/macros.inc"
	.include "include/os_spinlock.inc"

	.text

    arm_func_start OS_InitLock
OS_InitLock: ; 0x02078D28
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02078DE4 ; =_022B9644
	ldr r0, [r3]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _02078DE8 ; =0x027FFFF0
	mov r4, #1
	mov r2, #0
	mov r0, #0x7e
	str r4, [r3]
	str r2, [r1]
	bl OS_LockByWord
	ldr r5, _02078DE8 ; =0x027FFFF0
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _02078D80
	mov r4, #0x400
_02078D6C:
	mov r0, r4
	blx SVC_WaitByLoop
	ldrh r0, [r5, #6]
	cmp r0, #0
	bne _02078D6C
_02078D80:
	ldr ip, _02078DEC ; =0x027FFFB0
	mvn r0, #0
	str r0, [ip]
	mov r3, r0, lsl #0x10
	add r1, ip, #0x10
	mov r0, #0
	mov r2, #0x28
	str r3, [ip, #4]
	bl MTi_CpuClear32
	ldr ip, _02078DF0 ; =0x04000204
	ldr r1, _02078DE8 ; =0x027FFFF0
	ldrh r3, [ip]
	mov r0, #0x7e
	mov r2, #0
	orr r3, r3, #0x800
	strh r3, [ip]
	ldrh r3, [ip]
	orr r3, r3, #0x80
	strh r3, [ip]
	bl OS_UnlockByWord
	ldr r1, _02078DE8 ; =0x027FFFF0
	mov r0, #0x7f
	mov r2, #0
	bl OS_LockByWord
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02078DE4: .word _022B9644
_02078DE8: .word 0x027FFFF0
_02078DEC: .word 0x027FFFB0
_02078DF0: .word 0x04000204
	arm_func_end OS_InitLock

	arm_func_start sub_02078DF4
sub_02078DF4: ; 0x02078DF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_02078ED4
	cmp r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r4, #0x400
_02078E18:
	mov r0, r4
	blx SVC_WaitByLoop
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl sub_02078ED4
	cmp r0, #0
	bgt _02078E18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02078DF4

	arm_func_start OS_LockByWord
OS_LockByWord: ; 0x02078E40
	ldr ip, _02078E4C ; =sub_02078DF4
	mov r3, #0
	bx ip
	.align 2, 0
_02078E4C: .word sub_02078DF4
	arm_func_end OS_LockByWord

	arm_func_start OSi_DoUnlockByWord
OSi_DoUnlockByWord: ; 0x02078E50
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	mov r5, r3
	cmp r0, r1
	mvnne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	beq _02078E80
	bl EnableIrqFiqFlags
	b _02078E84
_02078E80:
	bl EnableIrqFlag
_02078E84:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _02078E9C
	blx r6
_02078E9C:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _02078EB8
	bl SetIrqFiqFlags
	b _02078EBC
_02078EB8:
	bl SetIrqFlag
_02078EBC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OSi_DoUnlockByWord

	arm_func_start OS_UnlockByWord
OS_UnlockByWord: ; 0x02078EC4
	ldr ip, _02078ED0 ; =OSi_DoUnlockByWord
	mov r3, #0
	bx ip
	.align 2, 0
_02078ED0: .word OSi_DoUnlockByWord
	arm_func_end OS_UnlockByWord

	arm_func_start sub_02078ED4
sub_02078ED4: ; 0x02078ED4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _02078EF4
	bl EnableIrqFiqFlags
	b _02078EF8
_02078EF4:
	bl EnableIrqFlag
_02078EF8:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl AtomicExchange
	movs r4, r0
	bne _02078F20
	cmp r7, #0
	beq _02078F1C
	blx r7
_02078F1C:
	strh sb, [r8, #4]
_02078F20:
	cmp r6, #0
	mov r0, r5
	beq _02078F34
	bl SetIrqFiqFlags
	b _02078F38
_02078F34:
	bl SetIrqFlag
_02078F38:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02078ED4

	arm_func_start OS_UnlockCartridge
OS_UnlockCartridge: ; 0x02078F40
	ldr ip, _02078F54 ; =OSi_DoUnlockByWord
	ldr r1, _02078F58 ; =0x027FFFE8
	ldr r2, _02078F5C ; =OSi_FreeCartridgeBus
	mov r3, #1
	bx ip
	.align 2, 0
_02078F54: .word OSi_DoUnlockByWord
_02078F58: .word 0x027FFFE8
_02078F5C: .word OSi_FreeCartridgeBus
	arm_func_end OS_UnlockCartridge

	arm_func_start OS_UnlockCartridgeVeneer
OS_UnlockCartridgeVeneer: ; 0x02078F60
	ldr r1, _02078F68 ; =OS_UnlockCartridge
	bx r1
	.align 2, 0
_02078F68: .word OS_UnlockCartridge
	arm_func_end OS_UnlockCartridgeVeneer

	arm_func_start sub_02078F6C
sub_02078F6C: ; 0x02078F6C
	ldr ip, _02078F80 ; =sub_02078ED4
	ldr r1, _02078F84 ; =0x027FFFE8
	ldr r2, _02078F88 ; =sub_02078F8C
	mov r3, #1
	bx ip
	.align 2, 0
_02078F80: .word sub_02078ED4
_02078F84: .word 0x027FFFE8
_02078F88: .word sub_02078F8C
	arm_func_end sub_02078F6C

	arm_func_start sub_02078F8C
sub_02078F8C: ; 0x02078F8C
	ldr r1, _02078FA0 ; =0x04000204
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_02078FA0: .word 0x04000204
	arm_func_end sub_02078F8C

	arm_func_start OSi_FreeCartridgeBus
OSi_FreeCartridgeBus: ; 0x02078FA4
	ldr r1, _02078FB8 ; =0x04000204
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_02078FB8: .word 0x04000204
	arm_func_end OSi_FreeCartridgeBus

	arm_func_start sub_02078FBC
sub_02078FBC: ; 0x02078FBC
	ldr ip, _02078FCC ; =OS_LockByWord
	ldr r1, _02078FD0 ; =0x027FFFE0
	ldr r2, _02078FD4 ; =sub_02078FF4
	bx ip
	.align 2, 0
_02078FCC: .word OS_LockByWord
_02078FD0: .word 0x027FFFE0
_02078FD4: .word sub_02078FF4
	arm_func_end sub_02078FBC

	arm_func_start sub_02078FD8
sub_02078FD8: ; 0x02078FD8
	ldr ip, _02078FE8 ; =OS_UnlockByWord
	ldr r1, _02078FEC ; =0x027FFFE0
	ldr r2, _02078FF0 ; =sub_0207900C
	bx ip
	.align 2, 0
_02078FE8: .word OS_UnlockByWord
_02078FEC: .word 0x027FFFE0
_02078FF0: .word sub_0207900C
	arm_func_end sub_02078FD8

	arm_func_start sub_02078FF4
sub_02078FF4: ; 0x02078FF4
	ldr r1, _02079008 ; =0x04000204
	ldrh r0, [r1]
	bic r0, r0, #0x800
	strh r0, [r1]
	bx lr
	.align 2, 0
_02079008: .word 0x04000204
	arm_func_end sub_02078FF4

	arm_func_start sub_0207900C
sub_0207900C: ; 0x0207900C
	ldr r1, _02079020 ; =0x04000204
	ldrh r0, [r1]
	orr r0, r0, #0x800
	strh r0, [r1]
	bx lr
	.align 2, 0
_02079020: .word 0x04000204
	arm_func_end sub_0207900C

	arm_func_start sub_02079024
sub_02079024: ; 0x02079024
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end sub_02079024

	arm_func_start OS_GetLockID
OS_GetLockID: ; 0x0207902C
	ldr r3, _0207908C ; =0x027FFFB0
	ldr r1, [r3]
	clz r2, r1
	cmp r2, #0x20
	bne _02079044
	b _02079048
_02079044:
	mov r0, #0x40
_02079048:
	bne _02079070
	add r3, r3, #4
	ldr r1, [r3]
	clz r2, r1
	cmp r2, #0x20
	ldr r0, _02079090 ; =0xFFFFFFFD
	beq _02079068
	b _0207906C
_02079068:
	bx lr
_0207906C:
	mov r0, #0x60
_02079070:
	add r0, r0, r2
	mov r1, #0x80000000
	mov r1, r1, lsr r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_0207908C: .word 0x027FFFB0
_02079090: .word 0xFFFFFFFD
	arm_func_end OS_GetLockID

	arm_func_start sub_02079094
sub_02079094: ; 0x02079094
	ldr r3, _020790D8 ; =0x027FFFB0
	cmp r0, #0x60
	bpl _020790A4
	b _020790A8
_020790A4:
	add r3, r3, #4
_020790A8:
	bpl _020790B0
	b _020790B4
_020790B0:
	sub r0, r0, #0x60
_020790B4:
	bmi _020790BC
	b _020790C0
_020790BC:
	sub r0, r0, #0x40
_020790C0:
	mov r1, #0x80000000
	mov r1, r1, lsr r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_020790D8: .word 0x027FFFB0
	arm_func_end sub_02079094

	arm_func_start sub_020790DC
sub_020790DC: ; 0x020790DC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl sub_02079104
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_020790DC

	arm_func_start sub_02079104
sub_02079104: ; 0x02079104
	ldr ip, _02079118 ; =sub_02079144
	mov r3, r2
	mov r2, r1
	mvn r1, #0x80000000
	bx ip
	.align 2, 0
_02079118: .word sub_02079144
	arm_func_end sub_02079104

	arm_func_start sub_0207911C
sub_0207911C: ; 0x0207911C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl sub_02079144
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0207911C

	arm_func_start sub_02079144
sub_02079144: ; 0x02079144
	ldr ip, _0207914C ; =sub_02085BD4
	bx ip
	.align 2, 0
_0207914C: .word sub_02085BD4
	arm_func_end sub_02079144

