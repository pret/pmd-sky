	.include "asm/macros.inc"
	.include "include/mi_memory.inc"

	.text

    arm_func_start sub_0207BC4C
sub_0207BC4C: ; 0x0207BC4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r5, r0, #0x4000000
_0207BC78:
	ldr r0, [r5]
	tst r0, #0x80000000
	bne _0207BC78
	bl EnableIrqFlag
	mov r2, r8, lsl #2
	add r1, r2, #0xe0
	mov r3, r4, lsr #2
	mov r4, r0
	add ip, r2, #0x4000000
	mov r0, r8
	mov r2, r7
	add r1, r1, #0x4000000
	orr r3, r3, #0x85000000
	str r6, [ip, #0xe0]
	bl sub_01FF9B3C
	mov r0, r4
	bl SetIrqFlag
_0207BCBC:
	ldr r0, [r5]
	tst r0, #0x80000000
	bne _0207BCBC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207BC4C

	arm_func_start sub_0207BCCC
sub_0207BCCC: ; 0x0207BCCC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r4, r0, #0x4000000
_0207BD08:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _0207BD08
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x84000000
	bl sub_01FF9AA8
_0207BD2C:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _0207BD2C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207BCCC

	arm_func_start MI_DmaCopy16
MI_DmaCopy16: ; 0x0207BD3C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r2, r5
	mov r3, #0
	bl MIi_CheckDma0SourceAddress
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r4, r0, #0x4000000
_0207BD74:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _0207BD74
	mov r3, r5, lsr #1
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x80000000
	bl sub_01FF9AA8
_0207BD98:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _0207BD98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy16

	arm_func_start sub_0207BDA8
sub_0207BDA8: ; 0x0207BDA8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r3
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r8, [sp, #0x18]
	bne _0207BDD8
	cmp r8, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BDD8:
	bl sub_0207C0FC
	cmp r8, #0
	beq _0207BE30
	ldr r2, [sp, #0x1c]
	mov r0, r7
	mov r1, r8
	bl sub_02078BAC
	bl EnableIrqFlag
	mov r3, r4, lsr #2
	mov r2, r7, lsl #2
	add r1, r2, #0xe0
	add r2, r2, #0x4000000
	str r5, [r2, #0xe0]
	mov r4, r0
	mov r0, r7
	mov r2, r6
	add r1, r1, #0x4000000
	orr r3, r3, #0xc5000000
	bl sub_01FF9B18
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BE30:
	bl EnableIrqFlag
	mov r2, r7, lsl #2
	add r1, r2, #0xe0
	mov r3, r4, lsr #2
	mov r4, r0
	add ip, r2, #0x4000000
	mov r0, r7
	mov r2, r6
	add r1, r1, #0x4000000
	orr r3, r3, #0x85000000
	str r5, [ip, #0xe0]
	bl sub_01FF9B18
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207BDA8

	arm_func_start sub_0207BE6C
sub_0207BE6C: ; 0x0207BE6C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	ldr r4, [sp, #0x18]
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	bne _0207BEAC
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BEAC:
	mov r0, r8
	bl sub_0207C0FC
	cmp r4, #0
	beq _0207BEE8
	ldr r2, [sp, #0x1c]
	mov r0, r8
	mov r1, r4
	bl sub_02078BAC
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0xc4000000
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BEE8:
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x84000000
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207BE6C

	arm_func_start sub_0207BF04
sub_0207BF04: ; 0x0207BF04
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	ldr r4, [sp, #0x18]
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	bne _0207BF44
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BF44:
	mov r0, r8
	bl sub_0207C0FC
	cmp r4, #0
	beq _0207BF84
	ldr r2, [sp, #0x1c]
	mov r0, r8
	mov r1, r4
	bl sub_02078BAC
	mov r3, #0x3bc00000
	rsb r3, r3, #0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, r5, lsr #2
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BF84:
	ldr r3, _0207BFA0 ; =0x84400000
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, r5, lsr #2
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207BFA0: .word 0x84400000
	arm_func_end sub_0207BF04

	arm_func_start sub_0207BFA4
sub_0207BFA4: ; 0x0207BFA4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	ldr r4, [sp, #0x18]
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	bne _0207BFE4
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207BFE4:
	mov r0, r8
	bl sub_0207C0FC
	cmp r4, #0
	beq _0207C020
	ldr r2, [sp, #0x1c]
	mov r0, r8
	mov r1, r4
	bl sub_02078BAC
	mov r3, r5, lsr #1
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0xc0000000
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207C020:
	mov r3, r5, lsr #1
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x80000000
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207BFA4

	arm_func_start sub_0207C03C
sub_0207C03C: ; 0x0207C03C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	ldr r4, [sp, #0x18]
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	bne _0207C07C
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207C07C:
	mov r0, r8
	bl sub_0207C0FC
	cmp r4, #0
	beq _0207C0BC
	ldr r2, [sp, #0x1c]
	mov r0, r8
	mov r1, r4
	bl sub_02078BAC
	mov r3, #0x3fc00000
	rsb r3, r3, #0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, r5, lsr #1
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207C0BC:
	ldr r3, _0207C0D8 ; =0x80400000
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, r5, lsr #1
	bl InitDmaTransfer_Standard
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207C0D8: .word 0x80400000
	arm_func_end sub_0207C03C

	arm_func_start sub_0207C0DC
sub_0207C0DC: ; 0x0207C0DC
	add r0, r0, r0, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0x4000000
	ldr r0, [r0, #0xb0]
	and r0, r0, #0x80000000
	mov r0, r0, lsr #0x1f
	bx lr
	arm_func_end sub_0207C0DC

	arm_func_start sub_0207C0FC
sub_0207C0FC: ; 0x0207C0FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	mov r1, r1, lsl #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_0207C11C:
	ldr r1, [r2]
	tst r1, #0x80000000
	bne _0207C11C
	cmp r4, #0
	bne _0207C158
	mov r1, #0xc
	mul r2, r4, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	mov r3, #0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _0207C160 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_0207C158:
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207C160: .word 0x81400001
	arm_func_end sub_0207C0FC

	arm_func_start MI_StopDma
MI_StopDma: ; 0x0207C164
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	mov r1, #6
	mul r1, r4, r1
	add r1, r1, #5
	mov r1, r1, lsl #1
	add r1, r1, #0x4000000
	ldrh r2, [r1, #0xb0]
	cmp r4, #0
	bic r2, r2, #0x3a00
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	bic r2, r2, #0x8000
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	ldrh r1, [r1, #0xb0]
	bne _0207C1D4
	mov r1, #0xc
	mul r2, r4, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	mov r3, #0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _0207C1DC ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_0207C1D4:
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207C1DC: .word 0x81400001
	arm_func_end MI_StopDma

	arm_func_start sub_0207C1E0
sub_0207C1E0: ; 0x0207C1E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _0207C260 ; =0x040000B8
	mov r7, r0
	mov r6, r1
	mov r4, #0
_0207C1F4:
	cmp r4, r7
	beq _0207C24C
	ldr r0, [r5]
	tst r0, #0x80000000
	andne r0, r0, #0x38000000
	cmpne r0, r6
	beq _0207C24C
	cmp r0, #0x8000000
	cmpeq r6, #0x10000000
	beq _0207C24C
	cmp r0, #0x10000000
	cmpeq r6, #0x8000000
	beq _0207C24C
	cmp r0, #0x18000000
	cmpne r0, #0x20000000
	cmpne r0, #0x28000000
	cmpne r0, #0x30000000
	cmpne r0, #0x38000000
	cmpne r0, #0x8000000
	cmpne r0, #0x10000000
	bne _0207C24C
	bl WaitForever2
_0207C24C:
	add r4, r4, #1
	cmp r4, #3
	add r5, r5, #0xc
	blt _0207C1F4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207C260: .word 0x040000B8
	arm_func_end sub_0207C1E0

	arm_func_start MIi_CheckDma0SourceAddress
MIi_CheckDma0SourceAddress: ; 0x0207C264
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	cmp r3, #0
	and ip, r1, #0xff000000
	beq _0207C288
	cmp r3, #0x800000
	subeq r1, r1, r2
	b _0207C28C
_0207C288:
	add r1, r1, r2
_0207C28C:
	cmp ip, #0x4000000
	and r0, r1, #0xff000000
	beq _0207C2B0
	cmp ip, #0x8000000
	bhs _0207C2B0
	cmp r0, #0x4000000
	beq _0207C2B0
	cmp r0, #0x8000000
	ldmloia sp!, {r3, pc}
_0207C2B0:
	bl WaitForever2
	ldmia sp!, {r3, pc}
	arm_func_end MIi_CheckDma0SourceAddress

