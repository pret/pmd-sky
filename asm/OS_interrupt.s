	.include "asm/macros.inc"
	.include "include/OS_interrupt.inc"

	.text

    arm_func_start sub_02078900
sub_02078900: ; 0x02078900
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	cmp r5, #0
	beq _02078930
	ldr r1, _0207896C ; =OS_IRQTable
	mvn r2, r4
	add r1, r1, #0x3000
	ldr r3, [r1, #0xff8]
	and r2, r3, r2
	str r2, [r1, #0xff8]
_02078930:
	bl SetIrqFlag
	ldr r1, _0207896C ; =OS_IRQTable
	add r0, r1, #0x3000
	ldr r0, [r0, #0xff8]
	tst r4, r0
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r1, #0x3f8
	ldr r5, _02078970 ; =DTCM_BSS
	add r6, r0, #0x3c00
_02078954:
	mov r0, r5
	bl OS_SleepThread
	ldr r0, [r6]
	tst r4, r0
	beq _02078954
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207896C: .word OS_IRQTable
_02078970: .word DTCM_BSS
	arm_func_end sub_02078900

	arm_func_start sub_02078974
sub_02078974: ; 0x02078974
	bx lr
	arm_func_end sub_02078974

	arm_func_start sub_02078978
sub_02078978: ; 0x02078978
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _020789EC ; =_022B95E4
	ldr r3, _020789F0 ; =_020B2B9C
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _020789BC
	ldr r0, _020789F4 ; =_022B95EC
	ldr r0, [r0, r5]
	blx r1
_020789BC:
	ldr r0, _020789F8 ; =OS_IRQTable
	ldr r1, _020789FC ; =_022B95E8
	add r0, r0, #0x3000
	ldr r2, [r0, #0xff8]
	ldr r1, [r1, r5]
	orr r2, r2, r4
	str r2, [r0, #0xff8]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl OS_DisableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020789EC: .word _022B95E4
_020789F0: .word _020B2B9C
_020789F4: .word _022B95EC
_020789F8: .word OS_IRQTable
_020789FC: .word _022B95E8
	arm_func_end sub_02078978

	arm_func_start sub_02078A00
sub_02078A00: ; 0x02078A00
	ldr ip, _02078A0C ; =sub_02078978
	mov r0, #0
	bx ip
	.align 2, 0
_02078A0C: .word sub_02078978
	arm_func_end sub_02078A00

	arm_func_start sub_02078A10
sub_02078A10: ; 0x02078A10
	ldr ip, _02078A1C ; =sub_02078978
	mov r0, #1
	bx ip
	.align 2, 0
_02078A1C: .word sub_02078978
	arm_func_end sub_02078A10

	arm_func_start sub_02078A20
sub_02078A20: ; 0x02078A20
	ldr ip, _02078A2C ; =sub_02078978
	mov r0, #2
	bx ip
	.align 2, 0
_02078A2C: .word sub_02078978
	arm_func_end sub_02078A20

	arm_func_start sub_02078A30
sub_02078A30: ; 0x02078A30
	ldr ip, _02078A3C ; =sub_02078978
	mov r0, #3
	bx ip
	.align 2, 0
_02078A3C: .word sub_02078978
	arm_func_end sub_02078A30

	arm_func_start sub_02078A40
sub_02078A40: ; 0x02078A40
	ldr ip, _02078A4C ; =sub_02078978
	mov r0, #4
	bx ip
	.align 2, 0
_02078A4C: .word sub_02078978
	arm_func_end sub_02078A40

	arm_func_start sub_02078A50
sub_02078A50: ; 0x02078A50
	ldr ip, _02078A5C ; =sub_02078978
	mov r0, #5
	bx ip
	.align 2, 0
_02078A5C: .word sub_02078978
	arm_func_end sub_02078A50

	arm_func_start sub_02078A60
sub_02078A60: ; 0x02078A60
	ldr ip, _02078A6C ; =sub_02078978
	mov r0, #6
	bx ip
	.align 2, 0
_02078A6C: .word sub_02078978
	arm_func_end sub_02078A60

	arm_func_start sub_02078A70
sub_02078A70: ; 0x02078A70
	ldr ip, _02078A7C ; =sub_02078978
	mov r0, #7
	bx ip
	.align 2, 0
_02078A7C: .word sub_02078978
	arm_func_end sub_02078A70

    arm_func_start OS_InitIrqTable
OS_InitIrqTable: ; 0x02078A80
	ldr r0, _02078A94 ; =DTCM_BSS
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	bx lr
	.align 2, 0
_02078A94: .word DTCM_BSS
	arm_func_end OS_InitIrqTable

	arm_func_start OS_SetIrqFunction
OS_SetIrqFunction: ; 0x02078A98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, #0
	mov r2, #0xc
	ldr r4, _02078B18 ; =OS_IRQTable
	ldr r6, _02078B1C ; =_022B95E4
	mov r7, r8
	mov lr, r8
	mov ip, #1
	mov r3, r2
_02078ABC:
	tst r0, #1
	beq _02078B04
	mov sb, r7
	cmp r8, #8
	blt _02078AE0
	cmp r8, #0xb
	suble r5, r8, #8
	mlale sb, r5, r3, r6
	ble _02078AFC
_02078AE0:
	cmp r8, #3
	blt _02078AF8
	cmp r8, #6
	addle r5, r8, #1
	mlale sb, r5, r2, r6
	ble _02078AFC
_02078AF8:
	str r1, [r4, r8, lsl #2]
_02078AFC:
	cmp sb, #0
	stmneia sb, {r1, ip, lr}
_02078B04:
	add r8, r8, #1
	cmp r8, #0x16
	mov r0, r0, lsr #1
	blt _02078ABC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02078B18: .word OS_IRQTable
_02078B1C: .word _022B95E4
	arm_func_end OS_SetIrqFunction

	arm_func_start sub_02078B20
sub_02078B20: ; 0x02078B20
	ldr r2, _02078BA4 ; =OS_IRQTable
	mov r1, #0
_02078B28:
	tst r0, #1
	beq _02078B88
	cmp r1, #8
	blt _02078B58
	cmp r1, #0xb
	bgt _02078B58
	sub r1, r1, #8
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _02078BA8 ; =_022B95E4
	ldr r0, [r0, r2]
	bx lr
_02078B58:
	cmp r1, #3
	blt _02078B80
	cmp r1, #6
	bgt _02078B80
	add r1, r1, #1
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _02078BA8 ; =_022B95E4
	ldr r0, [r0, r2]
	bx lr
_02078B80:
	ldr r0, [r2]
	bx lr
_02078B88:
	add r1, r1, #1
	cmp r1, #0x16
	mov r0, r0, lsr #1
	add r2, r2, #4
	blt _02078B28
	mov r0, #0
	bx lr
	.align 2, 0
_02078BA4: .word OS_IRQTable
_02078BA8: .word _022B95E4
	arm_func_end sub_02078B20

	arm_func_start sub_02078BAC
sub_02078BAC: ; 0x02078BAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0xc
	mul r6, r0, r3
	ldr ip, _02078BE8 ; =_022B95E4
	add r4, r0, #8
	mov r5, #1
	mov r0, r5, lsl r4
	ldr r3, _02078BEC ; =_022B95EC
	str r1, [ip, r6]
	str r2, [r3, r6]
	bl OS_EnableIrqMask
	and r1, r0, r5, lsl r4
	ldr r0, _02078BF0 ; =_022B95E8
	str r1, [r0, r6]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02078BE8: .word _022B95E4
_02078BEC: .word _022B95EC
_02078BF0: .word _022B95E8
	arm_func_end sub_02078BAC

	arm_func_start sub_02078BF4
sub_02078BF4: ; 0x02078BF4
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _02078C30 ; =_022B9614
	add r0, r0, #3
	mov r3, #1
	mov r0, r3, lsl r0
	ldr r3, _02078C34 ; =_022B961C
	str r1, [ip, r4]
	str r2, [r3, r4]
	bl OS_EnableIrqMask
	ldr r0, _02078C38 ; =_022B9618
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02078C30: .word _022B9614
_02078C34: .word _022B961C
_02078C38: .word _022B9618
	arm_func_end sub_02078BF4

	arm_func_start OS_SetIrqMask
OS_SetIrqMask: ; 0x02078C3C
	ldr r3, _02078C64 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #8]
	str r0, [r3, #8]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078C64: .word 0x04000208
	arm_func_end OS_SetIrqMask

	arm_func_start OS_EnableIrqMask
OS_EnableIrqMask: ; 0x02078C68
	ldr r3, _02078C94 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #8]
	orr r0, r1, r0
	str r0, [r3, #8]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078C94: .word 0x04000208
	arm_func_end OS_EnableIrqMask

	arm_func_start OS_DisableIrqMask
OS_DisableIrqMask: ; 0x02078C98
	ldr ip, _02078CC4 ; =0x04000208
	mov r2, #0
	ldrh r3, [ip]
	mvn r1, r0
	strh r2, [ip]
	ldr r0, [ip, #8]
	and r1, r0, r1
	str r1, [ip, #8]
	ldrh r1, [ip]
	strh r3, [ip]
	bx lr
	.align 2, 0
_02078CC4: .word 0x04000208
	arm_func_end OS_DisableIrqMask

	arm_func_start OS_ResetRequestIrqMask
OS_ResetRequestIrqMask: ; 0x02078CC8
	ldr r3, _02078CF0 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #0xc]
	str r0, [r3, #0xc]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078CF0: .word 0x04000208
	arm_func_end OS_ResetRequestIrqMask

	arm_func_start OS_SetIrqStackChecker
OS_SetIrqStackChecker: ; 0x02078CF4
	ldr ip, _02078D18 ; =OS_IRQTable
	ldr r3, _02078D1C ; =0xFDDB597D
	add r0, ip, #0x3000
	ldr r2, _02078D20 ; =0x7BF9DD5B
	ldr r1, _02078D24 ; =0x00000800
	str r3, [r0, #0xf7c]
	add r0, ip, #0x3f80
	str r2, [r0, -r1]
	bx lr
	.align 2, 0
_02078D18: .word OS_IRQTable
_02078D1C: .word 0xFDDB597D
_02078D20: .word 0x7BF9DD5B
_02078D24: .word 0x00000800
	arm_func_end OS_SetIrqStackChecker

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
	bl ArrayFill32
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

	arm_func_start IncrementThreadCount
IncrementThreadCount: ; 0x02079150
	ldr r1, _02079164 ; =THREAD_INFO_STRUCT
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	bx lr
	.align 2, 0
_02079164: .word THREAD_INFO_STRUCT
	arm_func_end IncrementThreadCount

	arm_func_start OSi_InsertLinkToQueue
OSi_InsertLinkToQueue: ; 0x02079168
	ldr ip, [r0]
	b _0207917C
_02079170:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x80]
_0207917C:
	cmp ip, #0
	beq _02079194
	ldr r3, [ip, #0x70]
	ldr r2, [r1, #0x70]
	cmp r3, r2
	bls _02079170
_02079194:
	cmp ip, #0
	bne _020791C0
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	mov r2, #0
	str r2, [r1, #0x80]
	str r1, [r0, #4]
	bx lr
_020791C0:
	ldr r2, [ip, #0x7c]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	str ip, [r1, #0x80]
	str r1, [ip, #0x7c]
	bx lr
	arm_func_end OSi_InsertLinkToQueue

	arm_func_start sub_020791E0
sub_020791E0: ; 0x020791E0
	ldr r2, [r0]
	cmp r2, #0
	beq _0207920C
	ldr r1, [r2, #0x80]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x7c]
	moveq r1, #0
	streq r1, [r0, #4]
	streq r1, [r2, #0x78]
_0207920C:
	mov r0, r2
	bx lr
	arm_func_end sub_020791E0

	arm_func_start sub_02079214
sub_02079214: ; 0x02079214
	ldr ip, [r0]
	mov r2, ip
	cmp ip, #0
	beq _02079260
_02079224:
	cmp r2, r1
	ldr r3, [r2, #0x80]
	bne _02079254
	cmp ip, r2
	ldr ip, [r2, #0x7c]
	streq r3, [r0]
	strne r3, [ip, #0x80]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x7c]
	b _02079260
_02079254:
	mov r2, r3
	cmp r3, #0
	bne _02079224
_02079260:
	mov r0, r2
	bx lr
	arm_func_end sub_02079214

	arm_func_start sub_02079268
sub_02079268: ; 0x02079268
	ldr r2, [r0]
	cmp r2, #0
	beq _02079290
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_02079290:
	mov r0, r2
	bx lr
	arm_func_end sub_02079268

	arm_func_start InsertThreadIntoList
InsertThreadIntoList: ; 0x02079298
	stmdb sp!, {r3, lr}
	ldr r1, _020792F4 ; =THREAD_INFO_STRUCT
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _020792B8
_020792B0:
	mov ip, r3
	ldr r3, [r3, #0x68]
_020792B8:
	cmp r3, #0
	beq _020792D0
	ldr r2, [r3, #0x70]
	ldr r1, [r0, #0x70]
	cmp r2, r1
	blo _020792B0
_020792D0:
	cmp ip, #0
	ldrne r1, [ip, #0x68]
	strne r1, [r0, #0x68]
	strne r0, [ip, #0x68]
	ldmneia sp!, {r3, pc}
	ldr r1, _020792F4 ; =THREAD_INFO_STRUCT
	str lr, [r0, #0x68]
	str r0, [r1, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020792F4: .word THREAD_INFO_STRUCT
	arm_func_end InsertThreadIntoList

	arm_func_start sub_020792F8
sub_020792F8: ; 0x020792F8
	ldr r1, _0207933C ; =THREAD_INFO_STRUCT
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _02079310
_02079308:
	mov r2, r1
	ldr r1, [r1, #0x68]
_02079310:
	cmp r1, #0
	cmpne r1, r0
	bne _02079308
	cmp r2, #0
	ldrne r0, [r0, #0x68]
	strne r0, [r2, #0x68]
	bxne lr
	ldr r1, [r0, #0x68]
	ldr r0, _0207933C ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
_0207933C: .word THREAD_INFO_STRUCT
	arm_func_end sub_020792F8

	arm_func_start OS_RescheduleThread
OS_RescheduleThread: ; 0x02079340
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r0, #0x26]
	ldr r4, _02079404 ; =_022B966C
	cmp r0, #0
	bne _02079370
	bl GetProcessorMode
	cmp r0, #0x12
	bne _0207937C
_02079370:
	mov r0, #1
	strh r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
_0207937C:
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl OS_SelectThread
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r6, #0x64]
	cmp r0, #2
	beq _020793B8
	mov r0, r6
	bl OS_SaveContext
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_020793B8:
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r2, [r0]
	cmp r2, #0
	beq _020793D4
	mov r0, r6
	mov r1, r5
	blx r2
_020793D4:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _020793EC
	mov r0, r6
	mov r1, r5
	blx r2
_020793EC:
	ldr r1, _02079400 ; =THREAD_INFO_STRUCT
	mov r0, r5
	str r5, [r1, #0x28]
	bl OS_LoadContext
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02079400: .word THREAD_INFO_STRUCT
_02079404: .word _022B966C
	arm_func_end OS_RescheduleThread

	arm_func_start OS_InitThread
OS_InitThread: ; 0x02079408
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02079518 ; =THREAD_INFO_STRUCT
	ldr r1, [r0, #0xc]
	cmp r1, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	mov r2, #1
	ldr r1, _0207951C ; =_022B9670
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	mov r1, #0x10
	str r1, [r0, #0x164]
	mov r3, #0
	str r3, [r0, #0x160]
	str r2, [r0, #0x158]
	str r3, [r0, #0x15c]
	ldr r2, _02079520 ; =0x00000000
	ldr r1, _02079524 ; =_022B973C
	str r3, [r0, #0x168]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _02079528 ; =SDK_SECTION_ARENA_DTCM_START
	ble _0207947C
	ldr r1, _0207952C ; =OS_IRQTable
	ldr r0, _02079530 ; =0x00000800
	add r1, r1, #0x3f80
	sub r0, r1, r0
_0207947C:
	ldr r1, _0207952C ; =OS_IRQTable
	sub ip, r0, r2
	add r2, r1, #0x3f80
	ldr r0, _02079530 ; =0x00000800
	ldr r1, _02079518 ; =THREAD_INFO_STRUCT
	sub r3, r2, r0
	str r3, [r1, #0x188]
	str ip, [r1, #0x184]
	mov r0, #0
	ldr r2, _02079534 ; =0xFDDB597D
	str r0, [r1, #0x18c]
	str r2, [r3, #-4]
	ldr r2, [r1, #0x184]
	ldr ip, _02079538 ; =0x7BF9DD5B
	ldr r3, _0207953C ; =_022B966C
	str ip, [r2]
	str r0, [r1, #0x194]
	str r0, [r1, #0x190]
	strh r0, [r1, #0x24]
	ldr r2, _02079540 ; =0x027FFFA0
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl OS_SetSwitchThreadCallback
	mov r2, #0xc8
	str r2, [sp]
	mov ip, #0x1f
	ldr r0, _02079544 ; =_022B967C
	ldr r1, _02079548 ; =_02079C04
	ldr r3, _0207954C ; =_022B98C4
	mov r2, #0
	str ip, [sp, #4]
	bl StartThread
	ldr r0, _02079518 ; =THREAD_INFO_STRUCT
	mov r1, #0x20
	str r1, [r0, #0xa4]
	mov r1, #1
	str r1, [r0, #0x98]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02079518: .word THREAD_INFO_STRUCT
_0207951C: .word _022B9670
_02079520: .word 0x00000000
_02079524: .word _022B973C
_02079528: .word SDK_SECTION_ARENA_DTCM_START
_0207952C: .word OS_IRQTable
_02079530: .word 0x00000800
_02079534: .word 0xFDDB597D
_02079538: .word 0x7BF9DD5B
_0207953C: .word _022B966C
_02079540: .word 0x027FFFA0
_02079544: .word _022B967C
_02079548: .word OSi_IdleThreadProc
_0207954C: .word _022B98C4
	arm_func_end OS_InitThread

	arm_func_start sub_02079550
sub_02079550: ; 0x02079550
	ldr r0, _0207955C ; =_022B9654
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0207955C: .word _022B9654
	arm_func_end sub_02079550

	arm_func_start StartThread
StartThread: ; 0x02079560
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl EnableIrqFlag
	mov r4, r0
	bl IncrementThreadCount
	ldr r2, [sp, #0x1c]
	mov r1, #0
	str r2, [r8, #0x70]
	str r0, [r8, #0x6c]
	str r1, [r8, #0x64]
	mov r0, r8
	str r1, [r8, #0x74]
	bl InsertThreadIntoList
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x94]
	sub r5, r6, r0
	sub r2, r6, #4
	mov ip, #0
	str r5, [r8, #0x90]
	str ip, [r8, #0x98]
	ldr r6, _02079650 ; =0xFDDB597D
	ldr r0, [r8, #0x94]
	ldr r3, _02079654 ; =0x7BF9DD5B
	str r6, [r0, #-4]
	ldr r0, [r8, #0x90]
	str r3, [r0]
	str ip, [r8, #0xa0]
	mov r0, r8
	str ip, [r8, #0x9c]
	bl InitThread
	ldr r2, _02079658 ; =ThreadExit
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl ArrayFill32
	mov r1, #0
	str r1, [r8, #0x84]
	str r1, [r8, #0x88]
	mov r0, r8
	str r1, [r8, #0x8c]
	bl SetThreadField0xB4
	mov r0, #0
	str r0, [r8, #0x78]
	str r0, [r8, #0x80]
	add r1, r8, #0xa4
	mov r2, #0xc
	str r0, [r8, #0x7c]
	bl ArrayFill32
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0xb0]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079650: .word 0xFDDB597D
_02079654: .word 0x7BF9DD5B
_02079658: .word ThreadExit
	arm_func_end StartThread

	arm_func_start ThreadExit
ThreadExit: ; 0x0207965C
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r0, _02079678 ; =THREAD_INFO_STRUCT
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl sub_0207967C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02079678: .word THREAD_INFO_STRUCT
	arm_func_end ThreadExit

	arm_func_start sub_0207967C
sub_0207967C: ; 0x0207967C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020796D0 ; =THREAD_INFO_STRUCT
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _020796C4
	ldr r1, _020796D4 ; =sub_020796D8
	bl InitThread
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x64]
	bl OS_LoadContext
	ldmia sp!, {r3, r4, r5, pc}
_020796C4:
	mov r0, r4
	bl sub_020796D8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020796D0: .word THREAD_INFO_STRUCT
_020796D4: .word sub_020796D8
	arm_func_end sub_0207967C

	arm_func_start sub_020796D8
sub_020796D8: ; 0x020796D8
	stmdb sp!, {r3, lr}
	ldr r1, _0207970C ; =THREAD_INFO_STRUCT
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02079704
	mov r1, #0
	str r1, [r3, #0xb4]
	blx r2
	bl EnableIrqFlag
_02079704:
	bl sub_02079710
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207970C: .word THREAD_INFO_STRUCT
	arm_func_end sub_020796D8

	arm_func_start sub_02079710
sub_02079710: ; 0x02079710
	stmdb sp!, {r4, lr}
	ldr r0, _02079768 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl sub_02079C14
	mov r0, r4
	bl sub_0207A128
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _02079740
	mov r1, r4
	bl sub_02079214
_02079740:
	mov r0, r4
	bl sub_020792F8
	mov r1, #2
	add r0, r4, #0x9c
	str r1, [r4, #0x64]
	bl sub_020798D8
	bl sub_02079C48
	bl sub_02079990
	bl WaitForever2
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079768: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079710

	arm_func_start sub_0207976C
sub_0207976C: ; 0x0207976C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _020797E4 ; =THREAD_INFO_STRUCT
	mov r4, r0
	ldr r0, [r1, #0x28]
	cmp r0, r5
	bne _02079790
	bl sub_02079710
_02079790:
	bl sub_02079C14
	mov r0, r5
	bl sub_0207A128
	mov r0, r5
	bl sub_020797E8
	ldr r0, [r5, #0x78]
	cmp r0, #0
	beq _020797B8
	mov r1, r5
	bl sub_02079214
_020797B8:
	mov r0, r5
	bl sub_020792F8
	mov r1, #2
	add r0, r5, #0x9c
	str r1, [r5, #0x64]
	bl sub_020798D8
	bl sub_02079C48
	mov r0, r4
	bl SetIrqFlag
	bl sub_02079990
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020797E4: .word THREAD_INFO_STRUCT
	arm_func_end sub_0207976C

	arm_func_start sub_020797E8
sub_020797E8: ; 0x020797E8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0207B1E8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020797E8

	arm_func_start sub_02079800
sub_02079800: ; 0x02079800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5, #0x64]
	mov r4, r0
	cmp r1, #2
	beq _02079824
	add r0, r5, #0x9c
	bl OS_SleepThread
_02079824:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02079800

	arm_func_start sub_02079830
sub_02079830: ; 0x02079830
	ldr r0, [r0, #0x64]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_02079830

	arm_func_start sub_02079844
sub_02079844: ; 0x02079844
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	bl EnableIrqFlag
	mov r4, r0
	cmp r5, #0
	beq _02079870
	mov r0, r5
	mov r1, r6
	str r5, [r6, #0x78]
	bl OSi_InsertLinkToQueue
_02079870:
	mov r0, #0
	str r0, [r6, #0x64]
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02079844

	arm_func_start OS_SleepThread
OS_SleepThread: ; 0x02079888
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, _020798D4 ; =THREAD_INFO_STRUCT
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _020798BC
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x78]
	bl OSi_InsertLinkToQueue
_020798BC:
	mov r0, #0
	str r0, [r5, #0x64]
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020798D4: .word THREAD_INFO_STRUCT
	arm_func_end OS_SleepThread

	arm_func_start sub_020798D8
sub_020798D8: ; 0x020798D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl EnableIrqFlag
	ldr r1, [r7]
	mov r6, r0
	cmp r1, #0
	beq _02079934
	beq _02079924
	mov r5, #1
	mov r4, #0
_02079900:
	mov r0, r7
	bl sub_020791E0
	str r5, [r0, #0x64]
	str r4, [r0, #0x78]
	str r4, [r0, #0x80]
	str r4, [r0, #0x7c]
	ldr r0, [r7]
	cmp r0, #0
	bne _02079900
_02079924:
	mov r0, #0
	str r0, [r7, #4]
	str r0, [r7]
	bl OS_RescheduleThread
_02079934:
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020798D8

	arm_func_start OS_WakeupThreadDirect
OS_WakeupThreadDirect: ; 0x02079940
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x64]
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OS_WakeupThreadDirect

	arm_func_start OS_SelectThread
OS_SelectThread: ; 0x02079968
	ldr r0, _0207998C ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #0x2c]
	b _02079978
_02079974:
	ldr r0, [r0, #0x68]
_02079978:
	cmp r0, #0
	ldrne r1, [r0, #0x64]
	cmpne r1, #1
	bne _02079974
	bx lr
	.align 2, 0
_0207998C: .word THREAD_INFO_STRUCT
	arm_func_end OS_SelectThread

	arm_func_start sub_02079990
sub_02079990: ; 0x02079990
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	arm_func_end sub_02079990

	arm_func_start sub_020799AC
sub_020799AC: ; 0x020799AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02079A60 ; =THREAD_INFO_STRUCT
	mov r4, #0
	mov r5, r4
	mov r6, r4
	ldr r8, [r0, #0x28]
	bl EnableIrqFlag
	ldr r1, _02079A60 ; =THREAD_INFO_STRUCT
	mov r7, r0
	ldr r1, [r1, #0x2c]
	mov r0, r4
	cmp r1, #0
	beq _02079A0C
	ldr r2, [r8, #0x70]
_020799E4:
	cmp r1, r8
	moveq r4, r0
	ldr r0, [r1, #0x70]
	cmp r2, r0
	moveq r5, r1
	mov r0, r1
	ldr r1, [r1, #0x68]
	addeq r6, r6, #1
	cmp r1, #0
	bne _020799E4
_02079A0C:
	cmp r6, #1
	ble _02079A1C
	cmp r5, r8
	bne _02079A28
_02079A1C:
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02079A28:
	cmp r4, #0
	ldrne r0, [r8, #0x68]
	strne r0, [r4, #0x68]
	bne _02079A44
	ldr r1, [r8, #0x68]
	ldr r0, _02079A60 ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
_02079A44:
	ldr r0, [r5, #0x68]
	str r0, [r8, #0x68]
	str r8, [r5, #0x68]
	bl OS_RescheduleThread
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079A60: .word THREAD_INFO_STRUCT
	arm_func_end sub_020799AC

	arm_func_start sub_02079A64
sub_02079A64: ; 0x02079A64
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02079B04 ; =THREAD_INFO_STRUCT
	mov r7, r0
	mov r6, r1
	ldr r8, [r2, #0x2c]
	mov r4, #0
	bl EnableIrqFlag
	mov r5, r0
	b _02079A90
_02079A88:
	mov r4, r8
	ldr r8, [r8, #0x68]
_02079A90:
	cmp r8, #0
	cmpne r8, r7
	bne _02079A88
	cmp r8, #0
	ldrne r0, _02079B08 ; =_022B967C
	cmpne r8, r0
	bne _02079ABC
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02079ABC:
	ldr r0, [r8, #0x70]
	cmp r0, r6
	beq _02079AF4
	cmp r4, #0
	ldrne r0, [r7, #0x68]
	strne r0, [r4, #0x68]
	bne _02079AE4
	ldr r1, [r7, #0x68]
	ldr r0, _02079B04 ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
_02079AE4:
	mov r0, r7
	str r6, [r7, #0x70]
	bl InsertThreadIntoList
	bl OS_RescheduleThread
_02079AF4:
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079B04: .word THREAD_INFO_STRUCT
_02079B08: .word _022B967C
	arm_func_end sub_02079A64

	arm_func_start sub_02079B0C
sub_02079B0C: ; 0x02079B0C
	ldr r0, [r0, #0x70]
	bx lr
	arm_func_end sub_02079B0C

	arm_func_start sub_02079B14
sub_02079B14: ; 0x02079B14
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r4, r0
	add r0, sp, #8
	bl sub_0207B040
	ldr r0, _02079BB0 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl EnableIrqFlag
	ldr r1, _02079BB4 ; =0x000082EA
	mov r2, #0
	umull r5, r3, r4, r1
	mla r3, r4, r2, r3
	mla r3, r2, r1, r3
	mov r1, r5, lsr #6
	mov r4, r0
	ldr r5, [sp, #4]
	add r0, sp, #8
	add r2, sp, #4
	str r0, [r5, #0xb0]
	str r2, [sp]
	mov r2, r3, lsr #6
	orr r1, r1, r3, lsl #26
	ldr r3, _02079BB8 ; =sub_02079BBC
	bl sub_0207B17C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02079BA0
	mov r5, #0
_02079B8C:
	mov r0, r5
	bl OS_SleepThread
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02079B8C
_02079BA0:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02079BB0: .word THREAD_INFO_STRUCT
_02079BB4: .word 0x000082EA
_02079BB8: .word sub_02079BBC
	arm_func_end sub_02079B14

	arm_func_start sub_02079BBC
sub_02079BBC: ; 0x02079BBC
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _02079BD8 ; =OS_WakeupThreadDirect
	mov r0, r2
	str r1, [r2, #0xb0]
	bx ip
	.align 2, 0
_02079BD8: .word OS_WakeupThreadDirect
	arm_func_end sub_02079BBC

	arm_func_start OS_SetSwitchThreadCallback
OS_SetSwitchThreadCallback: ; 0x02079BDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _02079C00 ; =THREAD_INFO_STRUCT
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02079C00: .word THREAD_INFO_STRUCT
	arm_func_end OS_SetSwitchThreadCallback

	arm_func_start OSi_IdleThreadProc
OSi_IdleThreadProc: ; 0x02079C04
	stmdb sp!, {r3, lr}
	bl ClearIrqFlag
_02079C0C:
	bl WaitForInterrupt
	b _02079C0C
	arm_func_end OSi_IdleThreadProc

	arm_func_start sub_02079C14
sub_02079C14: ; 0x02079C14
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r2, _02079C44 ; =THREAD_INFO_STRUCT
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	movlo r4, r3
	strlo r1, [r2, #4]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079C44: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079C14

	arm_func_start sub_02079C48
sub_02079C48: ; 0x02079C48
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _02079C78 ; =THREAD_INFO_STRUCT
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	movne r4, r3
	strne r2, [r1, #4]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079C78: .word THREAD_INFO_STRUCT
	arm_func_end sub_02079C48

	arm_func_start SetThreadField0xB4
SetThreadField0xB4: ; 0x02079C7C
	str r1, [r0, #0xb4]
	bx lr
	arm_func_end SetThreadField0xB4

	arm_func_start InitThread
InitThread: ; 0x02079C84
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	bne _02079CA0
	b _02079CA4
_02079CA0:
	sub r2, r2, #4
_02079CA4:
	str r2, [r0, #0x38]
	ands r1, r1, #1
	bne _02079CB4
	b _02079CB8
_02079CB4:
	mov r1, #0x3f
_02079CB8:
	beq _02079CC0
	b _02079CC4
_02079CC0:
	mov r1, #0x1f
_02079CC4:
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end InitThread

	arm_func_start OS_SaveContext
OS_SaveContext: ; 0x02079D08
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D50 ; =sub_02080EF0
	blx r1
	ldmia sp!, {r0, lr}
	add r1, r0, #0
	mrs r2, cpsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 ; =_02079D50
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	.align 2, 0
_02079D50: .word sub_02080EF0
	arm_func_end OS_SaveContext

	arm_func_start OS_LoadContext
OS_LoadContext: ; 0x02079D54
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D94 ; =sub_02080F30
	blx r1
	ldmia sp!, {r0, lr}
	mrs r1, cpsr
	bic r1, r1, #0x1f
	orr r1, r1, #0xd3
	msr cpsr_c, r1
	ldr r1, [r0], #4
	msr spsr_fsxc, r1
	ldr sp, [r0, #0x40]
	ldr lr, [r0, #0x3c]
	ldmia r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	subs pc, lr, #4
	.align 2, 0
_02079D94: .word sub_02080F30
	arm_func_end OS_LoadContext

	arm_func_start sub_02079D98
sub_02079D98: ; 0x02079D98
	mov r0, #0
	bx lr
	arm_func_end sub_02079D98

	arm_func_start sub_02079DA0
sub_02079DA0: ; 0x02079DA0
	ldr r0, _02079DB0 ; =0x82000001
	ldr r1, _02079DB4 ; =_020B2BAC
	str r0, [r1]
	bx lr
	.align 2, 0
_02079DB0: .word 0x82000001
_02079DB4: .word _020B2BAC
	arm_func_end sub_02079DA0

	arm_func_start sub_02079DB8
sub_02079DB8: ; 0x02079DB8
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0]
	str r3, [r0, #0xc]
	str r3, [r0, #8]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	bx lr
	arm_func_end sub_02079DB8

	arm_func_start sub_02079DE0
sub_02079DE0: ; 0x02079DE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r2, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	mov r6, r0
	cmp r1, r2
	bgt _02079E3C
	and r7, r7, #1
_02079E0C:
	cmp r7, #0
	bne _02079E24
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079E24:
	mov r0, r5
	bl OS_SleepThread
	ldr r2, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	cmp r1, r2
	ble _02079E0C
_02079E3C:
	ldr r0, [r5, #0x18]
	add r0, r0, r2
	bl _s32_div_f
	ldr r2, [r5, #0x10]
	add r0, r5, #8
	str r4, [r2, r1, lsl #2]
	ldr r1, [r5, #0x1c]
	add r1, r1, #1
	str r1, [r5, #0x1c]
	bl sub_020798D8
	mov r0, r6
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079DE0

	arm_func_start sub_02079E74
sub_02079E74: ; 0x02079E74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _02079EC8
	and r7, r7, #1
_02079E9C:
	cmp r7, #0
	bne _02079EB4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079EB4:
	add r0, r6, #8
	bl OS_SleepThread
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02079E9C
_02079EC8:
	cmp r5, #0
	beq _02079EE0
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x18]
	ldr r0, [r1, r0, lsl #2]
	str r0, [r5]
_02079EE0:
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_020798D8
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079E74

	arm_func_start sub_02079F18
sub_02079F18: ; 0x02079F18
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x14]
	ldr r2, [r6, #0x1c]
	mov r4, r0
	cmp r1, r2
	bgt _02079F74
	and r7, r7, #1
_02079F44:
	cmp r7, #0
	bne _02079F5C
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079F5C:
	mov r0, r6
	bl OS_SleepThread
	ldr r1, [r6, #0x14]
	ldr r0, [r6, #0x1c]
	cmp r1, r0
	ble _02079F44
_02079F74:
	ldr r0, [r6, #0x18]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r1, [r6, #0x18]
	ldr r0, [r6, #0x10]
	str r5, [r0, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r0, r6, #8
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl sub_020798D8
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079F18

	arm_func_start sub_02079FB4
sub_02079FB4: ; 0x02079FB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _0207A008
	and r7, r7, #1
_02079FDC:
	cmp r7, #0
	bne _02079FF4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079FF4:
	add r0, r6, #8
	bl OS_SleepThread
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02079FDC
_0207A008:
	cmp r5, #0
	beq _0207A020
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x18]
	ldr r0, [r1, r0, lsl #2]
	str r0, [r5]
_0207A020:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02079FB4

	arm_func_start OS_InitMutex
OS_InitMutex: ; 0x0207A030
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end OS_InitMutex

	arm_func_start sub_0207A048
sub_0207A048: ; 0x0207A048
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A0C8 ; =_022B966C
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_0207A064:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0207A090
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl sub_0207A1D8
	b _0207A0BC
_0207A090:
	cmp r0, r7
	bne _0207A0A8
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0207A0BC
_0207A0A8:
	mov r0, r5
	str r5, [r7, #0x84]
	bl OS_SleepThread
	str r6, [r7, #0x84]
	b _0207A064
_0207A0BC:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A0C8: .word _022B966C
	arm_func_end sub_0207A048

	arm_func_start sub_0207A0CC
sub_0207A0CC: ; 0x0207A0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A124 ; =_022B966C
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _0207A118
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _0207A118
	mov r1, r5
	bl sub_0207A1FC
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl sub_020798D8
_0207A118:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A124: .word _022B966C
	arm_func_end sub_0207A0CC

	arm_func_start sub_0207A128
sub_0207A128: ; 0x0207A128
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x88]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
_0207A140:
	add r0, r5, #0x88
	bl sub_02079268
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl sub_020798D8
	ldr r0, [r5, #0x88]
	cmp r0, #0
	bne _0207A140
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207A128

	arm_func_start sub_0207A164
sub_0207A164: ; 0x0207A164
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r2, [r5, #8]
	ldr r1, _0207A1D4 ; =_022B966C
	mov r4, r0
	cmp r2, #0
	ldr r0, [r1, #4]
	bne _0207A1A8
	str r0, [r5, #8]
	ldr r2, [r5, #0xc]
	mov r1, r5
	add r2, r2, #1
	str r2, [r5, #0xc]
	bl sub_0207A1D8
	mov r6, #1
	b _0207A1C4
_0207A1A8:
	cmp r2, r0
	movne r6, #0
	bne _0207A1C4
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
_0207A1C4:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207A1D4: .word _022B966C
	arm_func_end sub_0207A164

	arm_func_start sub_0207A1D8
sub_0207A1D8: ; 0x0207A1D8
	ldr r2, [r0, #0x8c]
	cmp r2, #0
	streq r1, [r0, #0x88]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x8c]
	bx lr
	arm_func_end sub_0207A1D8

	arm_func_start sub_0207A1FC
sub_0207A1FC: ; 0x0207A1FC
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x8c]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x88]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end sub_0207A1FC

	arm_func_start sub_0207A220
sub_0207A220: ; 0x0207A220
	mrc p15, 0, r1, c1, c0, 0
	and r0, r1, #4
	mov r0, r0, lsr #2
	orr r1, r1, #4
	mcr p15, 0, r1, c1, c0, 0
	bx lr
	arm_func_end sub_0207A220

	arm_func_start sub_0207A238
sub_0207A238: ; 0x0207A238
	mov r0, #0
	mcr p15, 0, r0, c7, c6, 0
	bx lr
	arm_func_end sub_0207A238

	arm_func_start sub_0207A244
sub_0207A244: ; 0x0207A244
	mov r1, #0
_0207A248:
	mov r0, #0
_0207A24C:
	orr r2, r1, r0
	mcr p15, 0, r2, c7, c10, 2
	add r0, r0, #0x20
	cmp r0, #0x400
	blt _0207A24C
	add r1, r1, #0x40000000
	cmp r1, #0
	bne _0207A248
	bx lr
	arm_func_end sub_0207A244

	arm_func_start DC_FlushAll
DC_FlushAll: ; 0x0207A270
	mov ip, #0
	mov r1, #0
_0207A278:
	mov r0, #0
_0207A27C:
	orr r2, r1, r0
	mcr p15, 0, ip, c7, c10, 4
	mcr p15, 0, r2, c7, c14, 2
	add r0, r0, #0x20
	cmp r0, #0x400
	blt _0207A27C
	add r1, r1, #0x40000000
	cmp r1, #0
	bne _0207A278
	bx lr
	arm_func_end DC_FlushAll

	arm_func_start DC_InvalidateRange
DC_InvalidateRange: ; 0x0207A2A4
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2AC:
	mcr p15, 0, r0, c7, c6, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2AC
	bx lr
	arm_func_end DC_InvalidateRange

	arm_func_start sub_0207A2C0
sub_0207A2C0: ; 0x0207A2C0
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2C8:
	mcr p15, 0, r0, c7, c10, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2C8
	bx lr
	arm_func_end sub_0207A2C0

	arm_func_start DC_FlushRange
DC_FlushRange: ; 0x0207A2DC
	mov ip, #0
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A2E8:
	mcr p15, 0, ip, c7, c10, 4
	mcr p15, 0, r0, c7, c14, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A2E8
	bx lr
	arm_func_end DC_FlushRange

	arm_func_start sub_0207A300
sub_0207A300: ; 0x0207A300
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4
	bx lr
	arm_func_end sub_0207A300

	arm_func_start sub_0207A30C
sub_0207A30C: ; 0x0207A30C
	mrc p15, 0, r1, c1, c0, 0
	and r0, r1, #0x1000
	mov r0, r0, lsr #0xc
	orr r1, r1, #0x1000
	mcr p15, 0, r1, c1, c0, 0
	bx lr
	arm_func_end sub_0207A30C

	arm_func_start sub_0207A324
sub_0207A324: ; 0x0207A324
	mov r0, #0
	mcr p15, 0, r0, c7, c5, 0
	bx lr
	arm_func_end sub_0207A324

	arm_func_start sub_0207A330
sub_0207A330: ; 0x0207A330
	add r1, r1, r0
	bic r0, r0, #0x1f
_0207A338:
	mcr p15, 0, r0, c7, c5, 1
	add r0, r0, #0x20
	cmp r0, r1
	blt _0207A338
	bx lr
	arm_func_end sub_0207A330

	arm_func_start OSi_WaitVCount0
OSi_WaitVCount0: ; 0x0207A34C
	mov ip, #0x4000000
	ldr r1, [ip, #0x208]
	str ip, [ip, #0x208]
_0207A358:
	ldrh r0, [ip, #6]
	cmp r0, #0
	bne _0207A358
	str r1, [ip, #0x208]
	bx lr
	arm_func_end OSi_WaitVCount0

; https://decomp.me/scratch/EcUDd
	arm_func_start OS_Init
OS_Init: ; 0x0207A36C
	stmdb sp!, {r3, lr}
	bl OS_InitArena
	bl PXI_Init
	bl OS_InitLock
	bl OS_InitArenaEx
	bl OS_InitIrqTable
	bl OS_SetIrqStackChecker
	bl OS_InitException
	bl MI_Init
	bl OS_InitVAlarm
	bl OSi_InitVramExclusive
	bl OS_InitThread
	bl OS_InitReset
	bl CTRDG_Init
	bl CARD_Init
	bl PM_Init
	bl OSi_WaitVCount0
	ldmia sp!, {r3, pc}
	arm_func_end OS_Init

	arm_func_start OS_InitArena
OS_InitArena: ; 0x0207A3B4
	stmdb sp!, {r3, lr}
	ldr r1, _0207A4B4 ; =_022B98C4
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	str r2, [r1]
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #0
	bl OS_SetArenaHi
	mov r0, #0
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #0
	bl OS_SetArenaLo
	mov r0, #2
	mov r1, #0
	bl OS_SetArenaLo
	mov r0, #2
	mov r1, #0
	bl OS_SetArenaHi
	mov r0, #3
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #3
	bl OS_SetArenaHi
	mov r0, #3
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #3
	bl OS_SetArenaLo
	mov r0, #4
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #4
	bl OS_SetArenaHi
	mov r0, #4
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #4
	bl OS_SetArenaLo
	mov r0, #5
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #5
	bl OS_SetArenaHi
	mov r0, #5
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #5
	bl OS_SetArenaLo
	mov r0, #6
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #6
	bl OS_SetArenaHi
	mov r0, #6
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #6
	bl OS_SetArenaLo
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A4B4: .word _022B98C4
	arm_func_end OS_InitArena

	arm_func_start OS_InitArenaEx
OS_InitArenaEx: ; 0x0207A4B8
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl OS_GetInitArenaHi
	mov r1, r0
	mov r0, #2
	bl OS_SetArenaHi
	mov r0, #2
	bl OS_GetInitArenaLo
	mov r1, r0
	mov r0, #2
	bl OS_SetArenaLo
	ldr r0, _0207A518 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A504
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	ldmneia sp!, {r3, pc}
_0207A504:
	ldr r0, _0207A51C ; =_0200002B
	bl OS_SetProtectionRegion1
	ldr r0, _0207A520 ; =0x023E0021
	bl OS_SetProtectionRegion2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A518: .word _022B98C4
_0207A51C: .word _0200002B
_0207A520: .word 0x023E0021
	arm_func_end OS_InitArenaEx

	arm_func_start sub_0207A524
sub_0207A524: ; 0x0207A524
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xdc4]
	bx lr
	arm_func_end sub_0207A524

	arm_func_start sub_0207A538
sub_0207A538: ; 0x0207A538
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	ldr r0, [r0, #0xda0]
	bx lr
	arm_func_end sub_0207A538

	arm_func_start OS_GetInitArenaHi
OS_GetInitArenaHi: ; 0x0207A54C
	stmdb sp!, {r3, lr}
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0207A608
_0207A55C: ; jump table
	b _0207A578 ; case 0
	b _0207A608 ; case 1
	b _0207A580 ; case 2
	b _0207A5B0 ; case 3
	b _0207A5B8 ; case 4
	b _0207A5F8 ; case 5
	b _0207A600 ; case 6
_0207A578:
	ldr r0, _0207A610 ; =SDK_SECTION_ARENA_EX_START
	ldmia sp!, {r3, pc}
_0207A580:
	ldr r0, _0207A614 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A5A0
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	bne _0207A5A8
_0207A5A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207A5A8:
	mov r0, #0x2700000
	ldmia sp!, {r3, pc}
_0207A5B0:
	mov r0, #0x2000000
	ldmia sp!, {r3, pc}
_0207A5B8:
	ldr r0, _0207A618 ; =OS_IRQTable
	ldr r1, _0207A61C ; =0x00000000
	ldr r2, _0207A620 ; =0x00000800
	add r3, r0, #0x3f80
	cmp r1, #0
	sub r2, r3, r2
	bne _0207A5E4
	ldr r1, _0207A624 ; =SDK_SECTION_ARENA_DTCM_START
	cmp r0, r1
	movlo r0, r1
	ldmia sp!, {r3, pc}
_0207A5E4:
	cmp r1, #0
	ldrlt r0, _0207A624 ; =SDK_SECTION_ARENA_DTCM_START
	sublt r0, r0, r1
	subge r0, r2, r1
	ldmia sp!, {r3, pc}
_0207A5F8:
	ldr r0, _0207A628 ; =0x027FF680
	ldmia sp!, {r3, pc}
_0207A600:
	ldr r0, _0207A62C ; =0x037F8000
	ldmia sp!, {r3, pc}
_0207A608:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A610: .word SDK_SECTION_ARENA_EX_START
_0207A614: .word _022B98C4
_0207A618: .word OS_IRQTable
_0207A61C: .word 0x00000000
_0207A620: .word 0x00000800
_0207A624: .word SDK_SECTION_ARENA_DTCM_START
_0207A628: .word 0x027FF680
_0207A62C: .word 0x037F8000
	arm_func_end OS_GetInitArenaHi

	arm_func_start OS_GetInitArenaLo
OS_GetInitArenaLo: ; 0x0207A630
	stmdb sp!, {r3, lr}
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0207A6B4
_0207A640: ; jump table
	b _0207A65C ; case 0
	b _0207A6B4 ; case 1
	b _0207A664 ; case 2
	b _0207A694 ; case 3
	b _0207A69C ; case 4
	b _0207A6A4 ; case 5
	b _0207A6AC ; case 6
_0207A65C:
	ldr r0, _0207A6BC ; =SDK_MAIN_ARENA_LO
	ldmia sp!, {r3, pc}
_0207A664:
	ldr r0, _0207A6C0 ; =_022B98C4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0207A684
	bl sub_02079DA0
	and r0, r0, #3
	cmp r0, #1
	bne _0207A68C
_0207A684:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0207A68C:
	ldr r0, _0207A6C4 ; =SDK_SECTION_ARENA_EX_START
	ldmia sp!, {r3, pc}
_0207A694:
	ldr r0, _0207A6C8 ; =SDK_SECTION_ARENA_ITCM_START
	ldmia sp!, {r3, pc}
_0207A69C:
	ldr r0, _0207A6CC ; =SDK_SECTION_ARENA_DTCM_START
	ldmia sp!, {r3, pc}
_0207A6A4:
	ldr r0, _0207A6D0 ; =0x027FF000
	ldmia sp!, {r3, pc}
_0207A6AC:
	ldr r0, _0207A6D4 ; =0x037F8000
	ldmia sp!, {r3, pc}
_0207A6B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207A6BC: .word SDK_MAIN_ARENA_LO
_0207A6C0: .word _022B98C4
_0207A6C4: .word SDK_SECTION_ARENA_EX_START
_0207A6C8: .word SDK_SECTION_ARENA_ITCM_START
_0207A6CC: .word SDK_SECTION_ARENA_DTCM_START
_0207A6D0: .word 0x027FF000
_0207A6D4: .word 0x037F8000
	arm_func_end OS_GetInitArenaLo

	arm_func_start OS_SetArenaHi
OS_SetArenaHi: ; 0x0207A6D8
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xdc4]
	bx lr
	arm_func_end OS_SetArenaHi

	arm_func_start OS_SetArenaLo
OS_SetArenaLo: ; 0x0207A6EC
	mov r0, r0, lsl #2
	add r0, r0, #0x2700000
	add r0, r0, #0xff000
	str r1, [r0, #0xda0]
	bx lr
	arm_func_end OS_SetArenaLo

	arm_func_start sub_0207A700
sub_0207A700: ; 0x0207A700
	str r0, [r1, #4]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	strne r1, [r0]
	mov r0, r1
	bx lr
	arm_func_end sub_0207A700

	arm_func_start sub_0207A71C
sub_0207A71C: ; 0x0207A71C
	ldr r3, [r1, #4]
	cmp r3, #0
	ldrne r2, [r1]
	strne r2, [r3]
	ldr r2, [r1]
	cmp r2, #0
	ldreq r0, [r1, #4]
	ldrne r1, [r1, #4]
	strne r1, [r2, #4]
	bx lr
	arm_func_end sub_0207A71C

	arm_func_start sub_0207A744
sub_0207A744: ; 0x0207A744
	stmdb sp!, {r3, lr}
	mov lr, r0
	cmp r0, #0
	mov ip, #0
	beq _0207A770
_0207A758:
	cmp r1, lr
	bls _0207A770
	mov ip, lr
	ldr lr, [lr, #4]
	cmp lr, #0
	bne _0207A758
_0207A770:
	stmia r1, {ip, lr}
	cmp lr, #0
	beq _0207A7AC
	str r1, [lr]
	ldr r3, [r1, #8]
	add r2, r1, r3
	cmp r2, lr
	bne _0207A7AC
	ldr r2, [lr, #8]
	add r2, r3, r2
	str r2, [r1, #8]
	ldr lr, [lr, #4]
	str lr, [r1, #4]
	cmp lr, #0
	strne r1, [lr]
_0207A7AC:
	cmp ip, #0
	beq _0207A7E4
	str r1, [ip, #4]
	ldr r2, [ip, #8]
	add r3, ip, r2
	cmp r3, r1
	ldmneia sp!, {r3, pc}
	ldr r1, [r1, #8]
	cmp lr, #0
	add r1, r2, r1
	str r1, [ip, #8]
	str lr, [ip, #4]
	strne ip, [lr]
	ldmia sp!, {r3, pc}
_0207A7E4:
	mov r0, r1
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207A744

	arm_func_start sub_0207A7EC
sub_0207A7EC: ; 0x0207A7EC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, _0207A8F0 ; =_022B98CC
	mov r6, r0
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	bne _0207A820
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207A820:
	cmp r5, #0
	ldrlt r5, [r1]
	ldr r1, [r1, #0x10]
	mov r0, #0xc
	mla r4, r5, r0, r1
	ldr r0, [r4, #4]
	add r1, r7, #0x3f
	mov r5, r0
	cmp r0, #0
	bic r7, r1, #0x1f
	beq _0207A864
_0207A84C:
	ldr r1, [r5, #8]
	cmp r7, r1
	ble _0207A864
	ldr r5, [r5, #4]
	cmp r5, #0
	bne _0207A84C
_0207A864:
	cmp r5, #0
	bne _0207A87C
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207A87C:
	ldr r1, [r5, #8]
	sub r1, r1, r7
	cmp r1, #0x40
	bhs _0207A89C
	mov r1, r5
	bl sub_0207A71C
	str r0, [r4, #4]
	b _0207A8D0
_0207A89C:
	str r7, [r5, #8]
	add r2, r5, r7
	str r1, [r2, #8]
	ldr r0, [r5]
	str r0, [r5, r7]
	ldr r0, [r5, #4]
	str r0, [r2, #4]
	cmp r0, #0
	strne r2, [r0]
	ldr r0, [r2]
	cmp r0, #0
	strne r2, [r0, #4]
	streq r2, [r4, #4]
_0207A8D0:
	ldr r0, [r4, #8]
	mov r1, r5
	bl sub_0207A700
	str r0, [r4, #8]
	mov r0, r6
	bl SetIrqFlag
	add r0, r5, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A8F0: .word _022B98CC
	arm_func_end sub_0207A7EC

	arm_func_start sub_0207A8F4
sub_0207A8F4: ; 0x0207A8F4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r1, _0207A958 ; =_022B98CC
	mov r4, r0
	ldr r0, [r1, r7, lsl #2]
	cmp r6, #0
	ldrlt r6, [r0]
	ldr r1, [r0, #0x10]
	mov r0, #0xc
	mla r7, r6, r0, r1
	sub r5, r5, #0x20
	ldr r0, [r7, #8]
	mov r1, r5
	bl sub_0207A71C
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	mov r1, r5
	bl sub_0207A744
	str r0, [r7, #4]
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A958: .word _022B98CC
	arm_func_end sub_0207A8F4

	arm_func_start sub_0207A95C
sub_0207A95C: ; 0x0207A95C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _0207A988 ; =_022B98CC
	ldr r1, [r1, r4, lsl #2]
	ldr r4, [r1]
	str r5, [r1]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A988: .word _022B98CC
	arm_func_end sub_0207A95C

	arm_func_start sub_0207A98C
sub_0207A98C: ; 0x0207A98C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r4, r2
	mov r6, r3
	bl EnableIrqFlag
	ldr r2, _0207AA30 ; =_022B98CC
	mov r1, #0xc
	str r5, [r2, r7, lsl #2]
	add r2, r5, #0x14
	str r2, [r5, #0x10]
	mul r1, r6, r1
	str r6, [r5, #4]
	cmp r6, #0
	mov lr, #0
	ble _0207AA00
	mov r6, lr
	mvn ip, #0
	mov r3, lr
_0207A9D8:
	ldr r2, [r5, #0x10]
	add lr, lr, #1
	str ip, [r2, r6]
	add r2, r2, r6
	str r3, [r2, #8]
	str r3, [r2, #4]
	ldr r2, [r5, #4]
	add r6, r6, #0xc
	cmp lr, r2
	blt _0207A9D8
_0207AA00:
	mvn r2, #0
	str r2, [r5]
	ldr r3, [r5, #0x10]
	bic r2, r4, #0x1f
	add r1, r3, r1
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	bl SetIrqFlag
	ldr r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207AA30: .word _022B98CC
	arm_func_end sub_0207A98C

	arm_func_start sub_0207AA34
sub_0207AA34: ; 0x0207AA34
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	bl EnableIrqFlag
	ldr r2, _0207AAC8 ; =_022B98CC
	add r1, r6, #0x1f
	ldr r2, [r2, r4, lsl #2]
	bic r6, r1, #0x1f
	ldr ip, [r2, #4]
	bic r5, r5, #0x1f
	cmp ip, #0
	mov r4, #0
	ble _0207AABC
	ldr r3, [r2, #0x10]
_0207AA70:
	ldr r1, [r3]
	cmp r1, #0
	bge _0207AAAC
	sub r1, r5, r6
	str r1, [r3]
	mov r2, #0
	str r2, [r6]
	str r2, [r6, #4]
	ldr r1, [r3]
	str r1, [r6, #8]
	str r6, [r3, #4]
	str r2, [r3, #8]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_0207AAAC:
	add r4, r4, #1
	cmp r4, ip
	add r3, r3, #0xc
	blt _0207AA70
_0207AABC:
	bl SetIrqFlag
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AAC8: .word _022B98CC
	arm_func_end sub_0207AA34

	arm_func_start sub_0207AACC
sub_0207AACC: ; 0x0207AACC
	mrc p15, 0, r0, c9, c1, 0
	ldr r1, _0207AADC ; =0xFFFFF000
	and r0, r0, r1
	bx lr
	.align 2, 0
_0207AADC: .word 0xFFFFF000
	arm_func_end sub_0207AACC

	arm_func_start sub_0207AAE0
sub_0207AAE0: ; 0x0207AAE0
	mrc p15, 0, r0, c1, c0, 0
	orr r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	arm_func_end sub_0207AAE0

	arm_func_start sub_0207AAF0
sub_0207AAF0: ; 0x0207AAF0
	mrc p15, 0, r0, c1, c0, 0
	bic r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	arm_func_end sub_0207AAF0

	arm_func_start sub_0207AB00
sub_0207AB00: ; 0x0207AB00
	mrc p15, 0, r2, c5, c0, 2
	bic r2, r2, r0
	orr r2, r2, r1
	mcr p15, 0, r2, c5, c0, 2
	bx lr
	arm_func_end sub_0207AB00

	arm_func_start OS_SetProtectionRegion1
OS_SetProtectionRegion1: ; 0x0207AB14
	mcr p15, 0, r0, c6, c1, 0
	bx lr
	arm_func_end OS_SetProtectionRegion1

	arm_func_start OS_SetProtectionRegion2
OS_SetProtectionRegion2: ; 0x0207AB1C
	mcr p15, 0, r0, c6, c2, 0
	bx lr
	arm_func_end OS_SetProtectionRegion2

	arm_func_start OS_InitException
OS_InitException: ; 0x0207AB24
	ldr r0, _0207AB84 ; =0x027FFD9C
	ldr r1, [r0]
	cmp r1, #0x2600000
	blo _0207AB44
	cmp r1, #0x2800000
	ldrlo r0, _0207AB88 ; =_022B98F0
	strlo r1, [r0]
	blo _0207AB50
_0207AB44:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0]
_0207AB50:
	ldr r0, _0207AB88 ; =_022B98F0
	ldr r0, [r0]
	cmp r0, #0
	bne _0207AB74
	ldr r2, _0207AB8C ; =OSi_ExceptionHandler
	ldr r1, _0207AB84 ; =0x027FFD9C
	ldr r0, _0207AB90 ; =0x027E3000
	str r2, [r1]
	str r2, [r0, #0xfdc]
_0207AB74:
	ldr r0, _0207AB88 ; =_022B98F0
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_0207AB84: .word 0x027FFD9C
_0207AB88: .word _022B98F0
_0207AB8C: .word OSi_ExceptionHandler
_0207AB90: .word 0x027E3000
	arm_func_end OS_InitException

	arm_func_start OSi_ExceptionHandler
OSi_ExceptionHandler: ; 0x0207AB94
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
	bne _0207ABA8
	b _0207ABAC
_0207ABA8:
	mov lr, pc
_0207ABAC:
	bne _0207ABB4
	b _0207ABB8
_0207ABB4:
	bx ip
_0207ABB8:
	ldr ip, _0207AC14 ; =_02000000
	stmdb ip!, {r0, r1, r2, r3, sp, lr}
	and r0, sp, #1
	mov sp, ip
	mrs r1, cpsr
	and r1, r1, #0x1f
	teq r1, #0x17
	bne _0207ABE0
	bl sub_0207AC18
	b _0207ABEC
_0207ABE0:
	teq r1, #0x1b
	bne _0207ABEC
	bl sub_0207AC18
_0207ABEC:
	ldr ip, _0207AC10 ; =_022B98F0
	ldr ip, [ip]
	cmp ip, #0
_0207ABF8:
	beq _0207ABF8
_0207ABFC:
	mov r0, r0
	b _0207ABFC
_0207AC04:
	ldmia sp!, {r0, r1, r2, r3, ip, lr}
	mov sp, ip
	bx lr
	.align 2, 0
_0207AC10: .word _022B98F0
_0207AC14: .word _secure
	arm_func_end OSi_ExceptionHandler

	arm_func_start sub_0207AC18
sub_0207AC18: ; 0x0207AC18
	stmdb sp!, {r0, lr}
	bl sub_0207AC2C
	bl sub_0207ACBC
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_0207AC18

	arm_func_start sub_0207AC2C
sub_0207AC2C: ; 0x0207AC2C
	ldr r1, _0207ACB8 ; =_022B991C
	mrs r2, cpsr
	str r2, [r1, #0x74]
	str r0, [r1, #0x6c]
	ldr r0, [ip]
	str r0, [r1, #4]
	ldr r0, [ip, #4]
	str r0, [r1, #8]
	ldr r0, [ip, #8]
	str r0, [r1, #0xc]
	ldr r0, [ip, #0xc]
	str r0, [r1, #0x10]
	ldr r2, [ip, #0x10]
	bic r2, r2, #1
	add r0, r1, #0x14
	stmia r0, {r4, r5, r6, r7, r8, sb, sl, fp}
	str ip, [r1, #0x70]
	ldr r0, [r2]
	str r0, [r1, #0x64]
	ldr r3, [r2, #4]
	str r3, [r1]
	ldr r0, [r2, #8]
	str r0, [r1, #0x34]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x40]
	mrs r0, cpsr
	orr r3, r3, #0x80
	bic r3, r3, #0x20
	msr cpsr_fsxc, r3
	str sp, [r1, #0x38]
	str lr, [r1, #0x3c]
	mrs r2, spsr
	str r2, [r1, #0x7c]
	msr cpsr_fsxc, r0
	bx lr
	.align 2, 0
_0207ACB8: .word _022B991C
	arm_func_end sub_0207AC2C

	arm_func_start sub_0207ACBC
sub_0207ACBC: ; 0x0207ACBC
	stmdb sp!, {r3, lr}
	ldr r0, _0207AD20 ; =_022B98F0
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mrs r2, cpsr
	mov r0, sp
	ldr r1, _0207AD24 ; =0x0000009F
	msr cpsr_fsxc, r1
	mov r1, sp
	mov sp, r0
	stmdb sp!, {r1, r2}
	bl sub_0207AAE0
	ldr r0, _0207AD28 ; =_022B991C
	ldr r1, _0207AD2C ; =_022B98F4
	ldr r1, [r1]
	ldr ip, _0207AD30 ; =_022B98F8
	ldr ip, [ip]
	ldr lr, _0207AD34 ; =_0207AD0C
	bx ip
_0207AD0C:
	bl sub_0207AAF0
	ldmia sp!, {r1, r2}
	mov sp, r1
	msr cpsr_fsxc, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207AD20: .word _022B98F0
_0207AD24: .word 0x0000009F
_0207AD28: .word _022B991C
_0207AD2C: .word _022B98F4
_0207AD30: .word _022B98F8
_0207AD34: .word _0207AD0C
	arm_func_end sub_0207ACBC

	arm_func_start sub_0207AD38
sub_0207AD38: ; 0x0207AD38
	ldr r1, _0207AD50 ; =_022B999C
	mov r2, #1
	ldrh r3, [r1]
	orr r0, r3, r2, lsl r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0207AD50: .word _022B999C
	arm_func_end sub_0207AD38

	arm_func_start sub_0207AD54
sub_0207AD54: ; 0x0207AD54
	stmdb sp!, {r3, lr}
	ldr r1, _0207ADC0 ; =_022B99A0
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0
	strh r2, [r1]
	bl sub_0207AD38
	ldr r0, _0207ADC0 ; =_022B99A0
	mov r2, #0
	str r2, [r0, #8]
	ldr r3, _0207ADC4 ; =0x04000102
	str r2, [r0, #0xc]
	strh r2, [r3]
	ldr r1, _0207ADC8 ; =sub_0207ADDC
	strh r2, [r3, #-2]
	mov r2, #0xc1
	mov r0, #8
	strh r2, [r3]
	bl OS_SetIrqFunction
	mov r0, #8
	bl OS_EnableIrqMask
	ldr r0, _0207ADC0 ; =_022B99A0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207ADC0: .word _022B99A0
_0207ADC4: .word 0x04000102
_0207ADC8: .word sub_0207ADDC
	arm_func_end sub_0207AD54

	arm_func_start sub_0207ADCC
sub_0207ADCC: ; 0x0207ADCC
	ldr r0, _0207ADD8 ; =_022B99A0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207ADD8: .word _022B99A0
	arm_func_end sub_0207ADCC

	arm_func_start sub_0207ADDC
sub_0207ADDC: ; 0x0207ADDC
	ldr r0, _0207AE34 ; =_022B99A0
	mov r3, #0
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r2, #1
	str r2, [r0, #8]
	adc r1, r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0207AE20
	ldr r2, _0207AE38 ; =0x04000102
	mov r1, #0xc1
	strh r3, [r2]
	strh r3, [r2, #-2]
	strh r1, [r2]
	str r3, [r0, #4]
_0207AE20:
	ldr ip, _0207AE3C ; =sub_02078BF4
	mov r0, #0
	ldr r1, _0207AE40 ; =sub_0207ADDC
	mov r2, r0
	bx ip
	.align 2, 0
_0207AE34: .word _022B99A0
_0207AE38: .word 0x04000102
_0207AE3C: .word sub_02078BF4
_0207AE40: .word sub_0207ADDC
	arm_func_end sub_0207ADDC

	arm_func_start sub_0207AE44
sub_0207AE44: ; 0x0207AE44
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl EnableIrqFlag
	ldr lr, _0207AED8 ; =0x04000100
	ldr r2, _0207AEDC ; =0x0000FFFF
	ldrh ip, [lr]
	ldr r3, _0207AEE0 ; =_022B99A0
	sub r1, r2, #0x10000
	strh ip, [sp]
	ldr ip, [r3, #8]
	ldr r3, [r3, #0xc]
	and ip, ip, r1
	and r1, r3, r2
	str ip, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [lr, #0x114]
	tst r1, #8
	beq _0207AEB0
	ldrh r1, [sp]
	tst r1, #0x8000
	bne _0207AEB0
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	adds r2, r2, #1
	adc r1, r1, #0
	str r2, [sp, #4]
	str r1, [sp, #8]
_0207AEB0:
	bl SetIrqFlag
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	ldrh r0, [sp]
	mov r1, r1, lsl #0x10
	orr r1, r1, r2, lsr #16
	orr r1, r1, r0, asr #31
	orr r0, r0, r2, lsl #16
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_0207AED8: .word 0x04000100
_0207AEDC: .word 0x0000FFFF
_0207AEE0: .word _022B99A0
	arm_func_end sub_0207AE44

	arm_func_start GetTimer0Control
GetTimer0Control: ; 0x0207AEE4
	ldr r0, _0207AEF0 ; =0x04000100
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207AEF0: .word 0x04000100
	arm_func_end GetTimer0Control

	arm_func_start sub_0207AEF4
sub_0207AEF4: ; 0x0207AEF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	mov r3, r5, lsr #0x10
	mov ip, #1
	rsb r1, ip, #0x10000
	ldr lr, _0207AF58 ; =0x04000214
	mov r6, #8
	ldr r2, _0207AF5C ; =_022B99A0
	str r6, [lr]
	str ip, [r2, #4]
	orr r3, r3, r4, lsl #16
	str r3, [r2, #8]
	mov r4, r4, lsr #0x10
	ldr r3, _0207AF60 ; =0x04000102
	str r4, [r2, #0xc]
	mov r2, #0
	strh r2, [r3]
	and r1, r5, r1
	strh r1, [r3, #-2]
	mov r1, #0xc1
	strh r1, [r3]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207AF58: .word 0x04000214
_0207AF5C: .word _022B99A0
_0207AF60: .word 0x04000102
	arm_func_end sub_0207AEF4

	arm_func_start sub_0207AF64
sub_0207AF64: ; 0x0207AF64
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_0207AE44
	ldr r3, _0207AFE0 ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _0207AFE4 ; =sub_0207B270
	mov r0, #1
	bl sub_02078BF4
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _0207AFE8 ; =0x0000FFFE
	blt _0207AFC4
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	bge _0207AFC4
	mvn r0, r5
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
_0207AFC4:
	ldr r2, _0207AFEC ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207AFE0: .word 0x04000106
_0207AFE4: .word sub_0207B270
_0207AFE8: .word 0x0000FFFE
_0207AFEC: .word 0x04000104
	arm_func_end sub_0207AF64

	arm_func_start sub_0207AFF0
sub_0207AFF0: ; 0x0207AFF0
	stmdb sp!, {r3, lr}
	ldr r1, _0207B02C ; =_022B99B0
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	bl sub_0207AD38
	ldr r1, _0207B02C ; =_022B99B0
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl OS_DisableIrqMask
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B02C: .word _022B99B0
	arm_func_end sub_0207AFF0

	arm_func_start sub_0207B030
sub_0207B030: ; 0x0207B030
	ldr r0, _0207B03C ; =_022B99B0
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207B03C: .word _022B99B0
	arm_func_end sub_0207B030

	arm_func_start sub_0207B040
sub_0207B040: ; 0x0207B040
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0207B040

	arm_func_start sub_0207B050
sub_0207B050: ; 0x0207B050
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _0207B0C4
	bl sub_0207AE44
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _0207B0C4
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl _ll_udiv
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_0207B0C4:
	str r7, [r8, #0xc]
	ldr r0, _0207B178 ; =_022B99B0
	str r6, [r8, #0x10]
	ldr r5, [r0, #4]
	cmp r5, #0
	beq _0207B140
	mov r2, #0
	mov r1, r2
_0207B0E4:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _0207B134
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r1, _0207B178 ; =_022B99B0
	mov r0, r8
	str r8, [r1, #4]
	bl sub_0207AF64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207B134:
	ldr r5, [r5, #0x18]
	cmp r5, #0
	bne _0207B0E4
_0207B140:
	ldr r1, _0207B178 ; =_022B99B0
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl sub_0207AF64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207B178: .word _022B99B0
	arm_func_end sub_0207B050

	arm_func_start sub_0207B17C
sub_0207B17C: ; 0x0207B17C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _0207B1A0
	ldr r0, [r6]
	cmp r0, #0
	beq _0207B1A4
_0207B1A0:
	bl WaitForever2
_0207B1A4:
	bl EnableIrqFlag
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl sub_0207AE44
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl sub_0207B050
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207B17C

	arm_func_start sub_0207B1E8
sub_0207B1E8: ; 0x0207B1E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B20C
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B20C:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	bne _0207B22C
	ldr r2, [r5, #0x14]
	ldr r1, _0207B26C ; =_022B99B0
	str r2, [r1, #8]
_0207B22C:
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _0207B250
	ldr r1, _0207B26C ; =_022B99B0
	cmp r0, #0
	str r0, [r1, #4]
	beq _0207B250
	bl sub_0207AF64
_0207B250:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B26C: .word _022B99B0
	arm_func_end sub_0207B1E8

	arm_func_start sub_0207B270
sub_0207B270: ; 0x0207B270
	stmdb sp!, {r0, lr}
	bl sub_0207B280
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end sub_0207B270

	arm_func_start sub_0207B280
sub_0207B280: ; 0x0207B280
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0207B364 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl OS_DisableIrqMask
	ldr r0, _0207B368 ; =OS_IRQTable
	add r0, r0, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #0x10
	str r1, [r0, #0xff8]
	bl sub_0207AE44
	ldr r2, _0207B36C ; =_022B99B0
	ldr r4, [r2, #4]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _0207B2E0
	mov r0, r4
	bl sub_0207AF64
	ldmia sp!, {r3, r4, r5, pc}
_0207B2E0:
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r1, [r2, #4]
	cmp r1, #0
	streq r0, [r2, #8]
	strne r0, [r1, #0x14]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	ldr r5, [r4]
	mov r0, #0
	cmpeq r1, #0
	streq r0, [r4]
	cmp r5, #0
	beq _0207B324
	ldr r0, [r4, #4]
	blx r5
_0207B324:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _0207B34C
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl sub_0207B050
_0207B34C:
	ldr r0, _0207B36C ; =_022B99B0
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_0207AF64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B364: .word 0x04000106
_0207B368: .word OS_IRQTable
_0207B36C: .word _022B99B0
	arm_func_end sub_0207B280

	arm_func_start OS_InitVAlarm
OS_InitVAlarm: ; 0x0207B370
	stmdb sp!, {r3, lr}
	ldr r1, _0207B3B4 ; =_022B99BC
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	mov r2, #0
	str r2, [r1, #0xc]
	mov r0, #4
	str r2, [r1, #0x10]
	bl OS_DisableIrqMask
	ldr r0, _0207B3B4 ; =_022B99BC
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B3B4: .word _022B99BC
	arm_func_end OS_InitVAlarm

	arm_func_start sub_0207B3B8
sub_0207B3B8: ; 0x0207B3B8
	stmdb sp!, {r3, lr}
	ldr r1, _0207B430 ; =_022B99BC
	ldr r3, [r1, #0xc]
	cmp r3, #0
	beq _0207B428
	ldr ip, [r0, #0xc]
_0207B3D0:
	ldr r1, [r3, #0xc]
	cmp r1, ip
	blo _0207B41C
	bne _0207B3F0
	ldrsh r2, [r3, #0x10]
	ldrsh r1, [r0, #0x10]
	cmp r2, r1
	ble _0207B41C
_0207B3F0:
	ldr r1, [r3, #0x14]
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r0, [r3, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	ldmneia sp!, {r3, pc}
	ldr r1, _0207B430 ; =_022B99BC
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
_0207B41C:
	ldr r3, [r3, #0x18]
	cmp r3, #0
	bne _0207B3D0
_0207B428:
	bl sub_0207B434
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B430: .word _022B99BC
	arm_func_end sub_0207B3B8

	arm_func_start sub_0207B434
sub_0207B434: ; 0x0207B434
	stmdb sp!, {r3, lr}
	ldr r1, _0207B468 ; =_022B99BC
	mov r2, #0
	ldr r3, [r1, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r0, [r1, #0x10]
	cmp r3, #0
	strne r0, [r3, #0x18]
	ldmneia sp!, {r3, pc}
	str r0, [r1, #0xc]
	bl sub_0207B544
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B468: .word _022B99BC
	arm_func_end sub_0207B434

	arm_func_start sub_0207B46C
sub_0207B46C: ; 0x0207B46C
	cmp r0, #0
	bxeq lr
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	cmp r2, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r1, [r2, #0x14]
	streq r1, [r0, #0x10]
	cmp r1, #0
	ldreq r0, _0207B4A0 ; =_022B99BC
	strne r2, [r1, #0x18]
	streq r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0207B4A0: .word _022B99BC
	arm_func_end sub_0207B46C

	arm_func_start sub_0207B4A4
sub_0207B4A4: ; 0x0207B4A4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_0207B4A4

	arm_func_start sub_0207B4B8
sub_0207B4B8: ; 0x0207B4B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl EnableIrqFlag
	mov r4, r0
	cmp r8, #0
	beq _0207B4E8
	ldr r0, [r8]
	cmp r0, #0
	beq _0207B4EC
_0207B4E8:
	bl WaitForever2
_0207B4EC:
	ldr r0, _0207B540 ; =0x04000006
	ldrh sb, [r0]
	mov r0, sb
	bl sub_0207B790
	mov r1, #1
	str r1, [r8, #0x1c]
	cmp r7, sb
	strh r7, [r8, #0x10]
	addle r0, r0, #1
	str r0, [r8, #0xc]
	strh r6, [r8, #0x12]
	ldr r1, [sp, #0x20]
	str r5, [r8]
	str r1, [r8, #4]
	mov r1, #0
	mov r0, r8
	str r1, [r8, #0x24]
	bl sub_0207B3B8
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0207B540: .word 0x04000006
	arm_func_end sub_0207B4B8

	arm_func_start sub_0207B544
sub_0207B544: ; 0x0207B544
	stmdb sp!, {r4, lr}
	ldr r1, _0207B57C ; =sub_0207B5CC
	mov r4, r0
	mov r0, #4
	bl OS_SetIrqFunction
	ldrsh r0, [r4, #0x10]
	bl GX_HBlankIntr
	ldr r2, _0207B580 ; =0x04000004
	mov r0, #4
	ldrh r1, [r2]
	orr r1, r1, #0x20
	strh r1, [r2]
	bl OS_EnableIrqMask
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B57C: .word sub_0207B5CC
_0207B580: .word 0x04000004
	arm_func_end sub_0207B544

	arm_func_start sub_0207B584
sub_0207B584: ; 0x0207B584
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	str r1, [r5, #0x24]
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B5B0
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B5B0:
	mov r0, r5
	bl sub_0207B46C
	mov r1, #0
	mov r0, r4
	str r1, [r5]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207B584

	arm_func_start sub_0207B5CC
sub_0207B5CC: ; 0x0207B5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	bl OS_DisableIrqMask
	ldr r2, _0207B734 ; =0x04000004
	ldr r0, _0207B738 ; =OS_IRQTable
	ldrh r1, [r2]
	add r0, r0, #0x3000
	bic r1, r1, #0x20
	strh r1, [r2]
	ldr r1, [r0, #0xff8]
	orr r1, r1, #4
	str r1, [r0, #0xff8]
	ldrh r0, [r2]
	mov r1, r0, asr #8
	mov r0, r0, lsl #1
	and r1, r1, #0xff
	and r0, r0, #0x100
	orr r0, r1, r0
	sub r0, r0, #1
	bl sub_0207B790
	ldr r4, _0207B73C ; =_022B99BC
	ldr sl, [r4, #0xc]
	cmp sl, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, _0207B740 ; =0x04000006
	mov fp, #4
	sub r6, sb, #2
	mov r5, #0
_0207B63C:
	ldrh r8, [sb]
	mov r0, r8
	bl sub_0207B790
	mov r7, r0
	mov r0, sl
	mov r1, r7
	mov r2, r8
	bl sub_0207B744
	cmp r0, #0
	beq _0207B678
	cmp r0, #1
	beq _0207B6B4
	cmp r0, #2
	beq _0207B708
	b _0207B724
_0207B678:
	mov r0, sl
	bl sub_0207B544
	ldrh r1, [sb]
	ldrsh r0, [sl, #0x10]
	cmp r0, r1
	ldreq r0, [sl, #0xc]
	cmpeq r0, r7
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, fp
	bl OS_DisableIrqMask
	ldrh r1, [r6]
	mov r0, #4
	bic r1, r1, #0x20
	strh r1, [r6]
	bl OS_ResetRequestIrqMask
_0207B6B4:
	ldr r7, [sl]
	mov r0, sl
	bl sub_0207B46C
	str r5, [sl]
	cmp r7, #0
	beq _0207B6D4
	ldr r0, [sl, #4]
	blx r7
_0207B6D4:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _0207B724
	ldr r0, [sl, #0x24]
	cmp r0, #0
	bne _0207B724
	str r7, [sl]
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
	b _0207B724
_0207B708:
	mov r0, sl
	bl sub_0207B46C
	ldr r1, [r4, #8]
	mov r0, sl
	add r1, r1, #1
	str r1, [sl, #0xc]
	bl sub_0207B3B8
_0207B724:
	ldr sl, [r4, #0xc]
	cmp sl, #0
	bne _0207B63C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207B734: .word 0x04000004
_0207B738: .word OS_IRQTable
_0207B73C: .word _022B99BC
_0207B740: .word 0x04000006
	arm_func_end sub_0207B5CC

	arm_func_start sub_0207B744
sub_0207B744: ; 0x0207B744
	ldrsh r3, [r0, #0x10]
	ldr ip, [r0, #0xc]
	subs r1, r1, ip
	sub r2, r2, r3
	bmi _0207B768
	cmp r1, #0
	bne _0207B770
	cmp r2, #0
	bge _0207B770
_0207B768:
	mov r0, #0
	bx lr
_0207B770:
	ldrsh r0, [r0, #0x12]
	cmp r2, #0
	addlt r1, r2, #7
	addlt r2, r1, #0x100
	cmp r2, r0
	movle r0, #1
	movgt r0, #2
	bx lr
	arm_func_end sub_0207B744

	arm_func_start sub_0207B790
sub_0207B790: ; 0x0207B790
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207B7CC ; =_022B99BC
	ldr r2, [r1, #4]
	cmp r4, r2
	ldrlt r2, [r1, #8]
	addlt r2, r2, #1
	strlt r2, [r1, #8]
	ldr r1, _0207B7CC ; =_022B99BC
	str r4, [r1, #4]
	bl SetIrqFlag
	ldr r0, _0207B7CC ; =_022B99BC
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B7CC: .word _022B99BC
	arm_func_end sub_0207B790

