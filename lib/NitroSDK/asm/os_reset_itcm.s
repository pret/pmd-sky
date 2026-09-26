	.include "asm/macros.inc"
	.include "itcm.inc"

	.section .itcm,4,1,4

    arm_func_start OSi_DoResetSystem
OSi_DoResetSystem: ; 0x01FF97CC
	stmdb sp!, {r3, lr}
	ldr r0, _01FF97F8 ; =OSi_IsInitReset
_01FF97D4:
	ldrh r1, [r0]
	cmp r1, #0
	beq _01FF97D4
	ldr r0, _01FF97FC ; =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl OSi_ReloadRomData
	bl OSi_DoBoot
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF97F8: .word OSi_IsInitReset
_01FF97FC: .word 0x04000208
	arm_func_end OSi_DoResetSystem

	arm_func_start OSi_DoBoot
OSi_DoBoot: ; 0x01FF9800
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _01FF98AC ; =OS_IRQTable
	add r1, r1, #0x3fc0
	add r1, r1, #0x3c
	mov r0, #0
	str r0, [r1]
	ldr r1, _01FF98B0 ; =0x04000180
_01FF9820:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _01FF9820
	mov r0, #0x100
	strh r0, [r1]
	mov r0, #0
	ldr r3, _01FF98B4 ; =0x027FFD9C
	ldr r4, [r3]
	ldr r1, _01FF98B8 ; =0x027FFD80
	mov r2, #0x80
	bl OSi_CpuClear32
	str r4, [r3]
	ldr r1, _01FF98BC ; =0x027FFF80
	mov r2, #0x18
	bl OSi_CpuClear32
	ldr r1, _01FF98C0 ; =0x027FFF98
	strh r0, [r1]
	ldr r1, _01FF98C4 ; =0x027FFF9C
	mov r2, #0x64
	bl OSi_CpuClear32
	ldr r1, _01FF98B0 ; =0x04000180
_01FF9878:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	beq _01FF9878
	mov r0, #0
	strh r0, [r1]
	ldr r3, _01FF98C8 ; =0x027FFE00
	ldr ip, [r3, #0x24]
	mov lr, ip
	ldr fp, _01FF98BC ; =0x027FFF80
	ldmia fp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl}
	mov fp, #0
	bx ip
	.align 2, 0
_01FF98AC: .word OS_IRQTable
_01FF98B0: .word 0x04000180
_01FF98B4: .word 0x027FFD9C
_01FF98B8: .word 0x027FFD80
_01FF98BC: .word 0x027FFF80
_01FF98C0: .word 0x027FFF98
_01FF98C4: .word 0x027FFF9C
_01FF98C8: .word 0x027FFE00
	arm_func_end OSi_DoBoot

	arm_func_start OSi_CpuClear32
OSi_CpuClear32: ; 0x01FF98CC
	add ip, r1, r2
_01FF98D0:
	cmp r1, ip
	blt _01FF98DC
	b _01FF98E0
_01FF98DC:
	stmia r1!, {r0}
_01FF98E0:
	blt _01FF98D0
	bx lr
	arm_func_end OSi_CpuClear32

	arm_func_start OSi_ReloadRomData
OSi_ReloadRomData: ; 0x01FF98E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FF9988 ; =0x027FFC2C
	ldr r4, [r1]
	cmp r4, #0x8000
	blo _01FF990C
	mov r0, r4
	add r1, r1, #0x1d4
	mov r2, #0x160
	bl OSi_ReadCardRom32
_01FF990C:
	ldr r0, _01FF998C ; =0x027FFE20
	ldr r5, [r0]
	ldr r6, [r0, #8]
	ldr r7, [r0, #0xc]
	ldr r8, [r0, #0x10]
	ldr sb, [r0, #0x18]
	ldr sl, [r0, #0x1c]
	bl EnableIrqFlag
	mov fp, r0
	bl DC_StoreAll
	bl DC_InvalidateAll
	mov r0, fp
	bl SetIrqFlag
	bl IC_InvalidateAll
	bl DC_WaitWriteBufferEmpty
	add r5, r5, r4
	cmp r5, #0x8000
	bhs _01FF9964
	rsb r0, r5, #0x8000
	add r6, r6, r0
	sub r7, r7, r0
	mov r5, #0x8000
_01FF9964:
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl OSi_ReadCardRom32
	mov r1, sb
	mov r2, sl
	add r0, r8, r4
	bl OSi_ReadCardRom32
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9988: .word 0x027FFC2C
_01FF998C: .word 0x027FFE20
	arm_func_end OSi_ReloadRomData

	arm_func_start OSi_ReadCardRom32
OSi_ReadCardRom32: ; 0x01FF9990
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _01FF9A54 ; =0x027FFE60
	ldr r3, _01FF9A58 ; =0x000001FF
	ldr r5, [r4]
	and r4, r0, r3
	bic r3, r5, #0x7000000
	ldr r5, _01FF9A5C ; =0x040001A4
	orr r3, r3, #0xa1000000
	rsb ip, r4, #0
_01FF99B4:
	ldr r4, [r5]
	tst r4, #0x80000000
	bne _01FF99B4
	ldr r7, _01FF9A60 ; =0x040001A1
	mov r4, #0x80
	strb r4, [r7]
	cmp ip, r2
	add r0, r0, ip
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r4, _01FF9A64 ; =0x04100010
	mov sb, r0, lsr #8
	mov r6, #0xb7
	mov r5, #0
_01FF99E8:
	strb r6, [r7, #7]
	mov lr, r0, lsr #0x18
	strb lr, [r7, #8]
	mov lr, r0, lsr #0x10
	strb lr, [r7, #9]
	strb sb, [r7, #0xa]
	strb r0, [r7, #0xb]
	strb r5, [r7, #0xc]
	strb r5, [r7, #0xd]
	strb r5, [r7, #0xe]
	str r3, [r7, #3]
_01FF9A14:
	ldr r8, [r7, #3]
	tst r8, #0x800000
	beq _01FF9A38
	cmp ip, #0
	ldr lr, [r4]
	blt _01FF9A34
	cmp ip, r2
	strlt lr, [r1, ip]
_01FF9A34:
	add ip, ip, #4
_01FF9A38:
	tst r8, #0x80000000
	bne _01FF9A14
	cmp ip, r2
	add sb, sb, #2
	add r0, r0, #0x200
	blt _01FF99E8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_01FF9A54: .word 0x027FFE60
_01FF9A58: .word 0x000001FF
_01FF9A5C: .word 0x040001A4
_01FF9A60: .word 0x040001A1
_01FF9A64: .word 0x04100010
	arm_func_end OSi_ReadCardRom32

