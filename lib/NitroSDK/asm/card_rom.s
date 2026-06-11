	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start CARDi_ReadFromCache
CARDi_ReadFromCache: ; 0x02083C8C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02083D14 ; =_022BB7E0
	mov r1, #0x200
	ldr r3, [r4, #0x1c]
	rsb r1, r1, #0
	ldr r2, [r0, #8]
	and r3, r3, r1
	cmp r3, r2
	bne _02083D00
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	sub r3, r2, r3
	rsb r5, r3, #0x200
	cmp r5, r1
	movhi r5, r1
	add r0, r0, #0x20
	ldr r1, [r4, #0x20]
	mov r2, r5
	add r0, r0, r3
	bl MI_CpuCopy8
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x24]
	add r2, r2, r5
	add r1, r1, r5
	sub r0, r0, r5
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r0, [r4, #0x24]
_02083D00:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02083D14: .word _022BB7E0
	arm_func_end CARDi_ReadFromCache

	arm_func_start CARDi_SetRomOp
CARDi_SetRomOp: ; 0x02083D18
	ldr r3, _02083D70 ; =0x040001A4
_02083D1C:
	ldr r2, [r3]
	tst r2, #0x80000000
	bne _02083D1C
	ldr r3, _02083D74 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_02083D70: .word 0x040001A4
_02083D74: .word 0x040001A1
	arm_func_end CARDi_SetRomOp

	arm_func_start sub_02083D78
sub_02083D78: ; 0x02083D78
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _02083DBC ; =_022BB7E0
	ldr r1, _02083DC0 ; =0x04100010
	ldr r0, [r4, #0x28]
	ldr r2, [r4, #0x20]
	mov r3, #0x200
	ldr r5, _02083DC4 ; =_022BBE20
	bl MTi_CardDmaCopy32
	ldr r1, [r4, #0x1c]
	mov r0, r1, lsr #8
	orr r0, r0, #0xb7000000
	mov r1, r1, lsl #0x18
	bl CARDi_SetRomOp
	ldr r1, [r5, #4]
	ldr r0, _02083DC8 ; =0x040001A4
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02083DBC: .word _022BB7E0
_02083DC0: .word 0x04100010
_02083DC4: .word _022BBE20
_02083DC8: .word 0x040001A4
	arm_func_end sub_02083D78

	arm_func_start sub_02083DCC
sub_02083DCC: ; 0x02083DCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02083E98 ; =_022BB7E0
	ldr r0, [r0, #0x28]
	bl MI_StopDma
	ldr r3, _02083E98 ; =_022BB7E0
	ldr r0, [r3, #0x24]
	ldr r2, [r3, #0x1c]
	ldr r1, [r3, #0x20]
	subs r0, r0, #0x200
	str r0, [r3, #0x24]
	movne r0, #1
	add r2, r2, #0x200
	add r1, r1, #0x200
	moveq r0, #0
	str r2, [r3, #0x1c]
	str r1, [r3, #0x20]
	cmp r0, #0
	bne _02083E90
	mov r0, #0x80000
	bl OS_DisableIrqMask
	mov r0, #0x80000
	bl OS_ResetRequestIrqMask
	ldr r4, _02083E98 ; =_022BB7E0
	bl sub_02084118
	bl Cardi_CheckPulledOutCore
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r5, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl EnableIrqFlag
	ldr r1, [r4, #0x114]
	mov r7, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0x114]
	add r0, r4, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _02083E74
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_02083E74:
	mov r0, r7
	bl SetIrqFlag
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02083E90:
	bl sub_02083D78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02083E98: .word _022BB7E0
	arm_func_end sub_02083DCC

	arm_func_start Cardi_TryReadCardDma
Cardi_TryReadCardDma: ; 0x02083E9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02084014 ; =_022BB7E0
	mov r6, #0
	ldr sb, [r4, #0x20]
	mov fp, r0
	mov r7, r6
	mov r8, r6
	mov r1, r6
	ands sl, sb, #0x1f
	ldr r5, [r4, #0x24]
	bne _02083ED4
	ldr r0, [r4, #0x28]
	cmp r0, #3
	movls r1, #1
_02083ED4:
	cmp r1, #0
	beq _02083F28
	bl OS_GetDTCMAddress
	ldr r1, _02084018 ; =CopyAndInterleave
	add r3, sb, r5
	cmp r3, r1
	mov r1, #1
	mov r2, #0
	bls _02083F00
	cmp sb, #0x2000000
	movlo r2, r1
_02083F00:
	cmp r2, #0
	bne _02083F20
	cmp r0, r3
	bhs _02083F1C
	add r0, r0, #0x4000
	cmp r0, sb
	bhi _02083F20
_02083F1C:
	mov r1, #0
_02083F20:
	cmp r1, #0
	moveq r8, #1
_02083F28:
	cmp r8, #0
	beq _02083F44
	ldr r1, [r4, #0x1c]
	ldr r0, _0208401C ; =0x000001FF
	orr r1, r1, r5
	tst r1, r0
	moveq r7, #1
_02083F44:
	ldr r0, _02084020 ; =_020B2ED0
	cmp r7, #0
	ldr r0, [r0]
	cmpne r5, #0
	ldr r0, [r0, #0x60]
	movne r6, #1
	bic r0, r0, #0x7000000
	orr r0, r0, #0xa1000000
	cmp r6, #0
	str r0, [fp, #4]
	beq _0208400C
	bl EnableIrqFlag
	ldr r1, [r4, #0x118]
	mov r7, r0
	cmp r5, r1
	bhs _02083F94
	mov r0, sb
	mov r1, r5
	bl IC_InvalidateRange
	b _02083F98
_02083F94:
	bl IC_InvalidateAll
_02083F98:
	ldr r0, [r4, #0x11c]
	cmp r5, r0
	bhs _02083FE0
	cmp sl, #0
	beq _02083FCC
	sub sb, sb, sl
	mov r0, sb
	mov r1, #0x20
	bl DC_StoreRange
	add r0, sb, r5
	mov r1, #0x20
	bl DC_StoreRange
	add r5, r5, #0x20
_02083FCC:
	mov r0, sb
	mov r1, r5
	bl DC_InvalidateRange
	bl DC_WaitWriteBufferEmpty
	b _02083FE4
_02083FE0:
	bl DC_FlushAll
_02083FE4:
	ldr r1, _02084024 ; =_02083DCC
	mov r0, #0x80000
	bl OS_SetIrqFunction
	mov r0, #0x80000
	bl OS_ResetRequestIrqMask
	mov r0, #0x80000
	bl OS_EnableIrqMask
	mov r0, r7
	bl SetIrqFlag
	bl sub_02083D78
_0208400C:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02084014: .word _022BB7E0
_02084018: .word CopyAndInterleave
_0208401C: .word 0x000001FF
_02084020: .word _020B2ED0
_02084024: .word sub_02083DCC
	arm_func_end Cardi_TryReadCardDma

	arm_func_start CARDi_ReadCard
CARDi_ReadCard: ; 0x02084028
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _0208410C ; =_022BB7E0
	mov r6, r0
_02084034:
	mov r0, #0x200
	ldr r1, [r4, #0x1c]
	rsb r0, r0, #0
	and r2, r1, r0
	cmp r2, r1
	bne _02084064
	ldr r5, [r4, #0x20]
	tst r5, #3
	bne _02084064
	ldr r0, [r4, #0x24]
	cmp r0, #0x200
	bhs _0208406C
_02084064:
	str r2, [r6, #8]
	add r5, r6, #0x20
_0208406C:
	mov r0, r2, lsr #8
	orr r0, r0, #0xb7000000
	mov r1, r2, lsl #0x18
	bl CARDi_SetRomOp
	mov ip, #0
	ldr r0, [r6, #4]
	ldr r2, _02084110 ; =0x040001A4
	mov lr, ip
	str r0, [r2]
	ldr r1, _02084114 ; =0x04100010
_02084094:
	ldr r3, [r2]
	tst r3, #0x800000
	beq _020840B4
	ldr r0, [r1]
	cmp lr, #0x200
	strlo r0, [r5, ip, lsl #2]
	addlo lr, lr, #4
	addlo ip, ip, #1
_020840B4:
	tst r3, #0x80000000
	bne _02084094
	ldr r0, [r4, #0x20]
	cmp r5, r0
	bne _020840F8
	ldr r0, _0208410C ; =_022BB7E0
	ldr r1, [r0, #0x1c]
	add r1, r1, #0x200
	str r1, [r0, #0x1c]
	ldr r1, [r0, #0x20]
	add r1, r1, #0x200
	str r1, [r0, #0x20]
	ldr r1, [r0, #0x24]
	subs r1, r1, #0x200
	str r1, [r0, #0x24]
	ldmeqia sp!, {r4, r5, r6, pc}
	b _02084034
_020840F8:
	mov r0, r6
	bl CARDi_ReadFromCache
	cmp r0, #0
	bne _02084034
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0208410C: .word _022BB7E0
_02084110: .word 0x040001A4
_02084114: .word 0x04100010
	arm_func_end CARDi_ReadCard

	arm_func_start sub_02084118
sub_02084118: ; 0x02084118
	stmdb sp!, {r3, lr}
	mov r0, #0xb8000000
	mov r1, #0
	bl CARDi_SetRomOp
	ldr r1, _02084168 ; =_020B2ED0
	mov r0, #0x2000
	ldr r1, [r1]
	rsb r0, r0, #0
	ldr r2, [r1, #0x60]
	ldr r1, _0208416C ; =0x040001A4
	bic r2, r2, #0x7000000
	orr r2, r2, #0xa7000000
	and r0, r2, r0
	str r0, [r1]
_02084150:
	ldr r0, [r1]
	tst r0, #0x800000
	beq _02084150
	ldr r0, _02084170 ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084168: .word _020B2ED0
_0208416C: .word 0x040001A4
_02084170: .word 0x04100010
	arm_func_end sub_02084118

	arm_func_start Cardi_ReadRomSyncCore
Cardi_ReadRomSyncCore: ; 0x02084174
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _02084204 ; =_022BBE20
	mov r0, r4
	bl CARDi_ReadFromCache
	cmp r0, #0
	beq _02084198
	ldr r1, [r4]
	mov r0, r4
	blx r1
_02084198:
	ldr r4, _02084208 ; =_022BB7E0
	bl sub_02084118
	bl Cardi_CheckPulledOutCore
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r5, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl EnableIrqFlag
	ldr r1, [r4, #0x114]
	mov r7, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0x114]
	add r0, r4, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _020841E8
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_020841E8:
	mov r0, r7
	bl SetIrqFlag
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02084204: .word _022BBE20
_02084208: .word _022BB7E0
	arm_func_end Cardi_ReadRomSyncCore

	arm_func_start Cardi_ReadRom
Cardi_ReadRom: ; 0x0208420C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r4, _020842F0 ; =_022BBE20
	ldr r5, _020842F4 ; =_022BB7E0
	bl Card_CheckEnabled
	bl EnableIrqFlag
	mov r6, r0
	b _02084240
_02084238:
	add r0, r5, #0x10c
	bl OS_SleepThread
_02084240:
	ldr r0, [r5, #0x114]
	tst r0, #4
	bne _02084238
	ldr r0, [r5, #0x114]
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	orr r3, r0, #4
	mov r0, r6
	str r3, [r5, #0x114]
	str r2, [r5, #0x38]
	str r1, [r5, #0x3c]
	bl SetIrqFlag
	ldr r0, _020842F8 ; =_022BBE00
	str sl, [r5, #0x28]
	ldr r0, [r0]
	str r8, [r5, #0x20]
	add r0, sb, r0
	str r0, [r5, #0x1c]
	str r7, [r5, #0x24]
	cmp sl, #3
	bhi _0208429C
	mov r0, sl
	bl MI_StopDma
_0208429C:
	mov r0, r4
	bl Cardi_TryReadCardDma
	cmp r0, #0
	beq _020842C0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	bl Card_WaitRomAsync
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020842C0:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020842D8
	ldr r0, _020842FC ; =Cardi_ReadRomSyncCore
	bl Cardi_SetTask
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020842D8:
	ldr r1, _02084300 ; =OSi_ThreadInfo
	mov r0, r5
	ldr r1, [r1, #4]
	str r1, [r5, #0x104]
	bl Cardi_ReadRomSyncCore
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020842F0: .word _022BBE20
_020842F4: .word _022BB7E0
_020842F8: .word _022BBE00
_020842FC: .word Cardi_ReadRomSyncCore
_02084300: .word OSi_ThreadInfo
	arm_func_end Cardi_ReadRom

	arm_func_start CARD_Init
CARD_Init: ; 0x02084304
	stmdb sp!, {r3, lr}
	ldr ip, _02084360 ; =_022BB7E0
	ldr r0, [ip, #0x114]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #0
	ldr r0, _02084364 ; =_022BBE00
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0x114]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r2, [ip, #0x1c]
	str r1, [ip, #0x28]
	str r2, [ip, #0x38]
	str r2, [ip, #0x3c]
	str r2, [r0]
	bl CARDi_InitCommon
	bl CARDi_GetRomAccessor
	ldr r1, _02084364 ; =_022BBE00
	str r0, [r1, #0x20]
	bl CARD_InitPulledOutCallback
	ldmia sp!, {r3, pc}
	.align 2, 0
_02084360: .word _022BB7E0
_02084364: .word _022BBE00
	arm_func_end CARD_Init

	arm_func_start Card_WaitRomAsync
Card_WaitRomAsync: ; 0x02084368
	ldr ip, _02084370 ; =Cardi_WaitAsync
	bx ip
	.align 2, 0
_02084370: .word Cardi_WaitAsync
	arm_func_end Card_WaitRomAsync

	arm_func_start CARDi_GetRomAccessor
CARDi_GetRomAccessor: ; 0x02084374
	ldr r0, _0208437C ; =CARDi_ReadCard
	bx lr
	.align 2, 0
_0208437C: .word CARDi_ReadCard
	arm_func_end CARDi_GetRomAccessor

