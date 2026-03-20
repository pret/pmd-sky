	.include "asm/macros.inc"
	.include "main_020517F4.inc"

	.text

	arm_func_start GetRankUpEntry
GetRankUpEntry: ; 0x020517F4
	ldr r1, _02051800 ; =RANK_UP_TABLE
	add r0, r1, r0, lsl #4
	bx lr
	.align 2, 0
_02051800: .word RANK_UP_TABLE
	arm_func_end GetRankUpEntry

	arm_func_start sub_02051804
sub_02051804: ; 0x02051804
	stmdb sp!, {r4, lr}
	add ip, r0, #0x100
	ldrsh r4, [ip, #0x40]
	mov ip, #0x14
	ldr lr, [sp, #8]
	smlabb r4, r4, ip, r0
	cmp lr, #1
	moveq r1, #0
	stmeqia r4, {r1, r2}
	streq r1, [r4, #8]
	strne r3, [r4]
	strne r2, [r4, #4]
	strne r1, [r4, #8]
	ldrneh r1, [sp, #0xc]
	str lr, [r4, #0xc]
	add r0, r0, #0x100
	str r1, [r4, #0x10]
	ldrsh r1, [r0, #0x40]
	add r1, r1, #1
	strh r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02051804

	arm_func_start sub_02051858
sub_02051858: ; 0x02051858
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0x1c
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	str r0, [r7, #8]
	str r6, [r7, #0xc]
	mov r0, #1
	strb r0, [r7, #0x16]
	str r5, [r7]
	str r4, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02051858

	arm_func_start sub_02051894
sub_02051894: ; 0x02051894
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	bl MemFree
	mov r0, #0
	strb r0, [r4, #0x16]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02051894

	arm_func_start sub_020518BC
sub_020518BC: ; 0x020518BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	cmp r2, #0
	mov r0, #0
	bne _02051934
	cmp r1, #1
	bne _02051904
	ldr r1, _020519B0 ; =0x06018000
	ldr r2, _020519B4 ; =0x0400001C
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x9000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
	b _02051990
_02051904:
	cmp r1, #0
	bne _02051990
	ldr r1, _020519B8 ; =0x06010000
	ldr r2, _020519BC ; =0x04000018
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x2000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
	b _02051990
_02051934:
	cmp r1, #1
	bne _02051964
	ldr r1, _020519C0 ; =0x06218000
	ldr r2, _020519C4 ; =0x0400101C
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x9000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
	b _02051990
_02051964:
	cmp r1, #0
	bne _02051990
	ldr r1, _020519C8 ; =0x06210000
	ldr r2, _020519CC ; =0x04001018
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x2000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
_02051990:
	cmp r0, #0
	beq _020519A8
	ldr r0, [r4, #8]
	bl sub_0200B3D4
	ldr r0, [r4, #8]
	bl sub_0200B330
_020519A8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020519B0: .word 0x06018000
_020519B4: .word 0x0400001C
_020519B8: .word 0x06010000
_020519BC: .word 0x04000018
_020519C0: .word 0x06218000
_020519C4: .word 0x0400101C
_020519C8: .word 0x06210000
_020519CC: .word 0x04001018
	arm_func_end sub_020518BC

	arm_func_start sub_020519D0
sub_020519D0: ; 0x020519D0
	stmdb sp!, {r3, lr}
	mov r0, #0x21c
	mov r1, #0
	bl MemAlloc
	ldr r2, _02051B3C ; =_020B09B0
	mov r1, #0x21c
	str r0, [r2]
	bl MemZero
	mov r1, #0
	ldr r0, _02051B3C ; =_020B09B0
	str r1, [sp]
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x1a4
	mov r3, #0x5000000
	bl sub_0200A124
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x100
	str r2, [sp]
	add r0, r1, #0x1cc
	add r1, r1, #0x1a4
	bl sub_0200A478
	mov r1, #0
	str r1, [sp]
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0x100
	ldr r0, [r0]
	ldr r3, _02051B40 ; =0x05000400
	add r0, r0, #0x1b8
	bl sub_0200A124
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x100
	str r2, [sp]
	add r0, r1, #0x1f4
	add r1, r1, #0x1b8
	bl sub_0200A478
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0
	ldr r0, [r0]
	mov r3, r2
	add r1, r0, #0x1cc
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0
	add r0, r1, #0x18
	add r1, r1, #0x1cc
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	bl sub_020518BC
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x18
	bl sub_020518BC
	ldr r0, _02051B3C ; =_020B09B0
	ldr r1, [r0]
	add r0, r1, #0x30
	add r1, r1, #0x1f4
	mov r2, #0
	mov r3, #1
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #1
	ldr r1, [r0]
	mov r3, r2
	add r0, r1, #0x48
	add r1, r1, #0x1f4
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #0
	ldr r0, [r0]
	mov r2, #1
	add r0, r0, #0x30
	bl sub_020518BC
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #1
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x48
	bl sub_020518BC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051B3C: .word _020B09B0
_02051B40: .word 0x05000400
	arm_func_end sub_020519D0

	arm_func_start sub_02051B44
sub_02051B44: ; 0x02051B44
	stmdb sp!, {r3, lr}
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x18
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x30
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x48
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1cc
	bl sub_0200A4C4
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1f4
	bl sub_0200A4C4
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1a4
	bl sub_0200A158
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1b8
	bl sub_0200A158
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02051C20 ; =_020B09B0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051C20: .word _020B09B0
	arm_func_end sub_02051B44

	arm_func_start sub_02051C24
sub_02051C24: ; 0x02051C24
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1cc
	bl sub_0200A510
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1f4
	bl sub_0200A510
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1a4
	bl sub_0200A184
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1b8
	bl sub_0200A184
	ldr r0, _02051D64 ; =_020B09B0
	mov r6, #0
	ldr r0, [r0]
	mov r8, r6
	add r4, r0, #0x60
	add r0, r4, #0x100
	ldrsh r5, [r0, #0x40]
	mov r7, #0x14
	b _02051D3C
_02051CE4:
	smlabb r2, r6, r7, r4
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _02051D20
	ldr r1, [r2, #0xc]
	cmp r1, #0
	bne _02051D10
	ldr r1, [r2, #8]
	ldr r2, [r2]
	bl ArrayCopy32
	b _02051D30
_02051D10:
	cmp r1, #1
	bne _02051D30
	bl MemFree
	b _02051D30
_02051D20:
	ldr r1, [r2, #8]
	ldr r2, [r2]
	mov r0, r8
	bl ArrayFill32
_02051D30:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02051D3C:
	cmp r6, r5
	blt _02051CE4
	ldr r0, _02051D64 ; =_020B09B0
	mov r2, #0
	ldr r1, [r0]
	mov r0, #8
	add r1, r1, #0x100
	strh r2, [r1, #0xa0]
	bl sub_020030FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02051D64: .word _020B09B0
	arm_func_end sub_02051C24

	arm_func_start sub_02051D68
sub_02051D68: ; 0x02051D68
	ldr r2, _02051D84 ; =_020B09B0
	mov r1, #0x28
	ldr r2, [r2]
	ldr ip, _02051D88 ; =sub_0200A504
	add r2, r2, #0x1cc
	mla r0, r1, r0, r2
	bx ip
	.align 2, 0
_02051D84: .word _020B09B0
_02051D88: .word sub_0200A504
	arm_func_end sub_02051D68

	arm_func_start sub_02051D8C
sub_02051D8C: ; 0x02051D8C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02051DCC ; =_020B09B0
	str r1, [sp, #4]
	ldr ip, [ip]
	ldr lr, [sp, #0x10]
	mov r1, #0x30
	mla ip, lr, r1, ip
	mov r1, #0x18
	mla r1, r3, r1, ip
	str r0, [sp]
	ldr r0, [r1, #8]
	add r1, sp, #0
	bl sub_0200B3FC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051DCC: .word _020B09B0
	arm_func_end sub_02051D8C

	arm_func_start sub_02051DD0
sub_02051DD0: ; 0x02051DD0
	stmdb sp!, {r3, lr}
	ldr r3, _02051DF8 ; =_020B09B0
	mov r2, #0x30
	ldr ip, [r3]
	mov r3, #0x18
	mla r2, r1, r2, ip
	mla r1, r0, r3, r2
	ldr r0, [r1, #8]
	bl sub_0200B3D4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051DF8: .word _020B09B0
	arm_func_end sub_02051DD0

	arm_func_start sub_02051DFC
sub_02051DFC: ; 0x02051DFC
	ldr r3, _02051E1C ; =_020B09B0
	mov r2, #0x30
	ldr ip, [r3]
	mov r3, #0x18
	mla r2, r1, r2, ip
	mla r1, r0, r3, r2
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_02051E1C: .word _020B09B0
	arm_func_end sub_02051DFC

	arm_func_start sub_02051E20
sub_02051E20: ; 0x02051E20
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02051E5C ; =_020B09B0
	str r1, [sp, #4]
	ldr ip, [ip]
	mov r1, #0x30
	mla ip, r3, r1, ip
	mov r1, #0x18
	mla r1, r2, r1, ip
	str r0, [sp]
	ldr r0, [r1, #8]
	add r1, sp, #0
	bl sub_0200B3C0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051E5C: .word _020B09B0
	arm_func_end sub_02051E20

	arm_func_start sub_02051E60
sub_02051E60: ; 0x02051E60
	stmdb sp!, {r3, lr}
	ldr r3, _02051E88 ; =_020B09B0
	mov r2, #0x30
	ldr ip, [r3]
	mov r3, #0x18
	mla r2, r1, r2, ip
	mla r1, r0, r3, r2
	ldr r0, [r1, #8]
	bl sub_0200B330
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051E88: .word _020B09B0
	arm_func_end sub_02051E60

	arm_func_start GetBgRegionArea
GetBgRegionArea: ; 0x02051E8C
	stmdb sp!, {r3, lr}
	ldr ip, _02051EB4 ; =_020B09B0
	mov r3, #0x30
	ldr lr, [ip]
	mov ip, #0x18
	mla r3, r2, r3, lr
	mla r2, r1, ip, r3
	ldr r1, [r2, #0x10]
	add r0, r1, r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051EB4: .word _020B09B0
	arm_func_end GetBgRegionArea

	arm_func_start sub_02051EB8
sub_02051EB8: ; 0x02051EB8
	ldr r2, _02051ED0 ; =_020B09B0
	mov r1, #0x14
	ldr r2, [r2]
	add r2, r2, #0x1a4
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_02051ED0: .word _020B09B0
	arm_func_end sub_02051EB8

	arm_func_start sub_02051ED4
sub_02051ED4: ; 0x02051ED4
	ldr r2, _02051EEC ; =_020B09B0
	mov r1, #0x28
	ldr r2, [r2]
	add r2, r2, #0x1cc
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_02051EEC: .word _020B09B0
	arm_func_end sub_02051ED4

	arm_func_start sub_02051EF0
sub_02051EF0: ; 0x02051EF0
	stmdb sp!, {r3, lr}
	cmp r3, #0
	beq _02051F4C
	ldrb lr, [r0]
	mov ip, #0xff
	ldrb lr, [r3, lr, lsl #2]
	mul lr, r2, lr
	mov lr, lr, lsr #8
	strb lr, [sp]
	ldrb lr, [r0, #1]
	add lr, r3, lr, lsl #2
	ldrb lr, [lr, #1]
	mul lr, r2, lr
	mov lr, lr, lsr #8
	strb lr, [sp, #1]
	ldrb r0, [r0, #2]
	add r0, r3, r0, lsl #2
	ldrb r0, [r0, #2]
	mul r0, r2, r0
	mov r0, r0, lsr #8
	strb r0, [sp, #2]
	strb ip, [sp, #3]
	b _02051F84
_02051F4C:
	ldrb ip, [r0]
	mov r3, #0xff
	mul lr, ip, r2
	mov ip, lr, lsr #8
	strb ip, [sp]
	ldrb ip, [r0, #1]
	mul lr, ip, r2
	mov ip, lr, lsr #8
	strb ip, [sp, #1]
	ldrb r0, [r0, #2]
	mul r2, r0, r2
	mov r0, r2, lsr #8
	strb r0, [sp, #2]
	strb r3, [sp, #3]
_02051F84:
	ldr r0, _02051FB0 ; =_020B09B0
	mov r1, r1, lsl #0x10
	ldr r0, [r0]
	ldr r2, [sp, #8]
	add r3, r0, #0x1cc
	mov r0, #0x28
	mla r0, r2, r0, r3
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051FB0: .word _020B09B0
	arm_func_end sub_02051EF0

	arm_func_start sub_02051FB4
sub_02051FB4: ; 0x02051FB4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr ip, _02051FEC ; =_020B09B0
	mov r3, r2
	mov r2, r1
	ldr ip, [ip]
	mov r1, r0
	add r0, ip, #0x60
	bl sub_02051804
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051FEC: .word _020B09B0
	arm_func_end sub_02051FB4
