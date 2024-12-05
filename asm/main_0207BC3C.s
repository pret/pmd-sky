	.include "asm/macros.inc"
	.include "main_0207BC3C.inc"

	.text

	arm_func_start sub_0207BC3C
sub_0207BC3C: ; 0x0207BC3C
	ldr r1, _0207BC48 ; =0x04000247
	strb r0, [r1]
	bx lr
	.align 2, 0
_0207BC48: .word 0x04000247
	arm_func_end sub_0207BC3C

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
	bl sub_0207C264
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

	arm_func_start sub_0207BD3C
sub_0207BD3C: ; 0x0207BD3C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r2, r5
	mov r3, #0
	bl sub_0207C264
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
	arm_func_end sub_0207BD3C

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
	bl sub_0207C264
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
	bl sub_0207C264
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
	bl sub_0207C264
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
	bl sub_0207C264
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

	arm_func_start sub_0207C164
sub_0207C164: ; 0x0207C164
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
	arm_func_end sub_0207C164

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

	arm_func_start sub_0207C264
sub_0207C264: ; 0x0207C264
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
	arm_func_end sub_0207C264

	arm_func_start ArrayFill16
ArrayFill16: ; 0x0207C2B8
	mov r3, #0
_0207C2BC:
	cmp r3, r2
	blt _0207C2C8
	b _0207C2CC
_0207C2C8:
	strh r0, [r1, r3]
_0207C2CC:
	blt _0207C2D4
	b _0207C2D8
_0207C2D4:
	add r3, r3, #2
_0207C2D8:
	blt _0207C2BC
	bx lr
	arm_func_end ArrayFill16

	arm_func_start ArrayCopy16
ArrayCopy16: ; 0x0207C2E0
	mov ip, #0
_0207C2E4:
	cmp ip, r2
	blt _0207C2F0
	b _0207C2F4
_0207C2F0:
	ldrh r3, [r0, ip]
_0207C2F4:
	blt _0207C2FC
	b _0207C300
_0207C2FC:
	strh r3, [r1, ip]
_0207C300:
	blt _0207C308
	b _0207C30C
_0207C308:
	add ip, ip, #2
_0207C30C:
	blt _0207C2E4
	bx lr
	arm_func_end ArrayCopy16

	arm_func_start ArrayFill32
ArrayFill32: ; 0x0207C314
	add ip, r1, r2
_0207C318:
	cmp r1, ip
	blt _0207C324
	b _0207C328
_0207C324:
	stmia r1!, {r0}
_0207C328:
	blt _0207C318
	bx lr
	arm_func_end ArrayFill32

	arm_func_start ArrayCopy32
ArrayCopy32: ; 0x0207C330
	add ip, r1, r2
_0207C334:
	cmp r1, ip
	blt _0207C340
	b _0207C344
_0207C340:
	ldmia r0!, {r2}
_0207C344:
	blt _0207C34C
	b _0207C350
_0207C34C:
	stmia r1!, {r2}
_0207C350:
	blt _0207C334
	bx lr
	arm_func_end ArrayCopy32

	arm_func_start ArrayFill32Fast
ArrayFill32Fast: ; 0x0207C358
	stmdb sp!, {r4, r5, r6, r7, r8, sb}
	add sb, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
	mov r2, r0
	mov r3, r2
	mov r4, r2
	mov r5, r2
	mov r6, r2
	mov r7, r2
	mov r8, r2
_0207C384:
	cmp r1, ip
	blt _0207C390
	b _0207C394
_0207C390:
	stmia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
_0207C394:
	blt _0207C384
_0207C398:
	cmp r1, sb
	blt _0207C3A4
	b _0207C3A8
_0207C3A4:
	stmia r1!, {r0}
_0207C3A8:
	blt _0207C398
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end ArrayFill32Fast

	arm_func_start ArrayCopy32Fast
ArrayCopy32Fast: ; 0x0207C3B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
_0207C3C4:
	cmp r1, ip
	blt _0207C3D0
	b _0207C3D4
_0207C3D0:
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
_0207C3D4:
	blt _0207C3DC
	b _0207C3E0
_0207C3DC:
	stmia r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
_0207C3E0:
	blt _0207C3C4
_0207C3E4:
	cmp r1, sl
	blt _0207C3F0
	b _0207C3F4
_0207C3F0:
	ldmia r0!, {r2}
_0207C3F4:
	blt _0207C3FC
	b _0207C400
_0207C3FC:
	stmia r1!, {r2}
_0207C400:
	blt _0207C3E4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end ArrayCopy32Fast

	arm_func_start MemsetFast
MemsetFast: ; 0x0207C40C
	cmp r2, #0
	beq _0207C418
	b _0207C41C
_0207C418:
	bx lr
_0207C41C:
	tst r0, #1
	beq _0207C448
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	beq _0207C444
	b _0207C448
_0207C444:
	bx lr
_0207C448:
	cmp r2, #2
	blo _0207C4A0
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _0207C470
	strh r1, [r0], #2
	subs r2, r2, #2
	beq _0207C46C
	b _0207C470
_0207C46C:
	bx lr
_0207C470:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _0207C490
	sub r2, r2, r3
	add ip, r3, r0
_0207C484:
	str r1, [r0], #4
	cmp r0, ip
	blo _0207C484
_0207C490:
	tst r2, #2
	bne _0207C49C
	b _0207C4A0
_0207C49C:
	strh r1, [r0], #2
_0207C4A0:
	tst r2, #1
	beq _0207C4AC
	b _0207C4B0
_0207C4AC:
	bx lr
_0207C4B0:
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end MemsetFast

	arm_func_start MemcpyFast
MemcpyFast: ; 0x0207C4C8
	cmp r2, #0
	beq _0207C4D4
	b _0207C4D8
_0207C4D4:
	bx lr
_0207C4D8:
	tst r1, #1
	beq _0207C530
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	bne _0207C4F4
	b _0207C4F8
_0207C4F4:
	ldrh r3, [r0, #-1]
_0207C4F8:
	bne _0207C500
	b _0207C504
_0207C500:
	mov r3, r3, lsr #8
_0207C504:
	beq _0207C50C
	b _0207C510
_0207C50C:
	ldrh r3, [r0]
_0207C510:
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	beq _0207C52C
	b _0207C530
_0207C52C:
	bx lr
_0207C530:
	eor ip, r1, r0
	tst ip, #1
	beq _0207C58C
	bic r0, r0, #1
	ldrh ip, [r0], #2
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _0207C568
_0207C550:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
	subs r2, r2, #2
	bhs _0207C550
_0207C568:
	tst r2, #1
	beq _0207C574
	b _0207C578
_0207C574:
	bx lr
_0207C578:
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_0207C58C:
	tst ip, #2
	beq _0207C5B8
	bics r3, r2, #1
	beq _0207C61C
	sub r2, r2, r3
	add ip, r3, r1
_0207C5A4:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _0207C5A4
	b _0207C61C
_0207C5B8:
	cmp r2, #2
	blo _0207C61C
	tst r1, #2
	beq _0207C5E0
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	beq _0207C5DC
	b _0207C5E0
_0207C5DC:
	bx lr
_0207C5E0:
	bics r3, r2, #3
	beq _0207C600
	sub r2, r2, r3
	add ip, r3, r1
_0207C5F0:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _0207C5F0
_0207C600:
	tst r2, #2
	bne _0207C60C
	b _0207C610
_0207C60C:
	ldrh r3, [r0], #2
_0207C610:
	bne _0207C618
	b _0207C61C
_0207C618:
	strh r3, [r1], #2
_0207C61C:
	tst r2, #1
	beq _0207C628
	b _0207C62C
_0207C628:
	bx lr
_0207C62C:
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end MemcpyFast

	arm_func_start AtomicExchange
AtomicExchange: ; 0x0207C648
	.word 0xE1010090
	bx lr
	arm_func_end AtomicExchange

	arm_func_start sub_0207C650
sub_0207C650: ; 0x0207C650
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r5, [r0], #4
	mov r2, r5, lsr #8
	mov r7, #0
	tst r5, #0xf
	bne _0207C66C
	b _0207C670
_0207C66C:
	mov r7, #1
_0207C670:
	cmp r2, #0
	ble _0207C748
	ldrb lr, [r0], #1
	mov r4, #8
_0207C680:
	subs r4, r4, #1
	blt _0207C670
	tst lr, #0x80
	bne _0207C6A4
	ldrb r6, [r0], #1
	.word 0xE1416096
	add r1, r1, #1
	sub r2, r2, #1
	b _0207C730
_0207C6A4:
	ldrb r5, [r0]
	cmp r7, #0
	beq _0207C6B4
	b _0207C6B8
_0207C6B4:
	mov r6, #3
_0207C6B8:
	beq _0207C6FC
	tst r5, #0xe0
	bne _0207C6C8
	b _0207C6CC
_0207C6C8:
	mov r6, #1
_0207C6CC:
	bne _0207C6FC
	add r0, r0, #1
	and r6, r5, #0xf
	mov r6, r6, lsl #4
	tst r5, #0x10
	beq _0207C6F4
	mov r6, r6, lsl #8
	ldrb r5, [r0], #1
	add r6, r6, r5, lsl #4
	add r6, r6, #0x100
_0207C6F4:
	add r6, r6, #0x11
	ldrb r5, [r0]
_0207C6FC:
	add r3, r6, r5, asr #4
	add r0, r0, #1
	and r5, r5, #0xf
	mov ip, r5, lsl #8
	ldrb r6, [r0], #1
	orr r5, r6, ip
	add ip, r5, #1
	sub r2, r2, r3
_0207C71C:
	ldrb r5, [r1, -ip]
	.word 0xE1415095
	add r1, r1, #1
	subs r3, r3, #1
	bgt _0207C71C
_0207C730:
	cmp r2, #0
	bgt _0207C73C
	b _0207C740
_0207C73C:
	mov lr, lr, lsl #1
_0207C740:
	bgt _0207C680
	b _0207C670
_0207C748:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_0207C650

	arm_func_start sub_0207C750
sub_0207C750: ; 0x0207C750
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r6, r0
	mov r7, r3
	mvn r1, #0
	mov r4, r2
	bl sub_0207C1E0
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0x1000000
	bl sub_0207C264
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, r6, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r1, r0, #0x4000000
_0207C79C:
	ldr r0, [r1]
	tst r0, #0x80000000
	bne _0207C79C
	ldr r3, _0207C7C0 ; =0xAF000001
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl InitDmaTransfer_Standard
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207C7C0: .word 0xAF000001
	arm_func_end sub_0207C750

	arm_func_start sub_0207C7C4
sub_0207C7C4: ; 0x0207C7C4
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl sub_0207BC3C
	mov r0, #0
	bl sub_0207C164
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C7C4

	arm_func_start sub_0207C7DC
sub_0207C7DC: ; 0x0207C7DC
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #1
	str r2, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C7DC

	arm_func_start sub_0207C7FC
sub_0207C7FC: ; 0x0207C7FC
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #2
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C7FC

	arm_func_start sub_0207C824
sub_0207C824: ; 0x0207C824
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #3
	str r2, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C824

	arm_func_start sub_0207C844
sub_0207C844: ; 0x0207C844
	ldr ip, _0207C858 ; =sub_0207CB7C
	mov r2, r1
	mov r1, #6
	mov r3, #2
	bx ip
	.align 2, 0
_0207C858: .word sub_0207CB7C
	arm_func_end sub_0207C844

	arm_func_start sub_0207C85C
sub_0207C85C: ; 0x0207C85C
	ldr ip, _0207C870 ; =sub_0207CB7C
	mov r2, r1
	mov r1, #4
	mov r3, #1
	bx ip
	.align 2, 0
_0207C870: .word sub_0207CB7C
	arm_func_end sub_0207C85C

	arm_func_start sub_0207C874
sub_0207C874: ; 0x0207C874
	stmdb sp!, {r3, lr}
	mov r3, r2
	mov ip, #2
	mov r2, #0xc
	str ip, [sp]
	bl sub_0207CBA4
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C874

	arm_func_start sub_0207C890
sub_0207C890: ; 0x0207C890
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0
	mov r1, r0
	mov r2, lr
	mov r0, #9
	str ip, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C890

	arm_func_start sub_0207C8B8
sub_0207C8B8: ; 0x0207C8B8
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0xc
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C8B8

	arm_func_start sub_0207C8E0
sub_0207C8E0: ; 0x0207C8E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	mov r5, r7
	mov r4, #0
	b _0207C918
_0207C900:
	tst r5, #1
	beq _0207C910
	mov r0, r4
	bl sub_0207D3B0
_0207C910:
	add r4, r4, #1
	mov r5, r5, lsr #1
_0207C918:
	cmp r4, #8
	bge _0207C928
	cmp r5, #0
	bne _0207C900
_0207C928:
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, #0xd
	str r6, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0207C8E0

	arm_func_start sub_0207C944
sub_0207C944: ; 0x0207C944
	stmdb sp!, {r3, lr}
	mov r1, r1, lsl #0x1e
	orr r0, r1, r0, lsl #31
	ldr ip, [sp, #8]
	mov r1, r2
	orr r0, r0, ip, lsl #29
	ldr r2, [sp, #0xc]
	mov lr, #0
	orr r0, r0, r2, lsl #28
	ldr ip, [sp, #0x10]
	mov r2, r3
	orr r3, r0, ip, lsl #27
	mov r0, #0x11
	str lr, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C944

	arm_func_start sub_0207C984
sub_0207C984: ; 0x0207C984
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r2
	mov r5, r1
	ldr r2, [sp, #0x18]
	mov r6, r0
	mov r1, r3
	bl sub_0207D3D0
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	mov r0, #0x12
	bl sub_0207CBCC
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_0207C984

	arm_func_start sub_0207C9C4
sub_0207C9C4: ; 0x0207C9C4
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1a
	str r3, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C9C4

	arm_func_start sub_0207C9E4
sub_0207C9E4: ; 0x0207C9E4
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1b
	str r3, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207C9E4

	arm_func_start sub_0207CA04
sub_0207CA04: ; 0x0207CA04
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x13
	str r3, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CA04

	arm_func_start sub_0207CA24
sub_0207CA24: ; 0x0207CA24
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0
	mov r1, r0
	mov r2, lr
	mov r0, #0x14
	str ip, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CA24

	arm_func_start sub_0207CA4C
sub_0207CA4C: ; 0x0207CA4C
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x15
	str r3, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CA4C

	arm_func_start sub_0207CA6C
sub_0207CA6C: ; 0x0207CA6C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [sp, #0x1c]
	mov r1, r1, lsl #0x18
	orr r4, r1, r3, lsl #26
	ldr r5, [sp, #0x24]
	mov r1, ip, lsl #0x16
	ldr r3, [sp, #0x18]
	ldr ip, [sp, #0x10]
	orr r4, r4, r5, lsl #16
	orr r4, ip, r4
	ldr lr, [sp, #0x20]
	orr r3, r1, r3, lsl #24
	ldr ip, [sp, #0x14]
	orr r1, r0, lr, lsl #16
	orr r3, ip, r3
	mov r0, #0xe
	str r4, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207CA6C

	arm_func_start sub_0207CAB8
sub_0207CAB8: ; 0x0207CAB8
	stmdb sp!, {r3, lr}
	ldr lr, [sp, #8]
	ldr ip, [sp, #0xc]
	str r1, [sp]
	orr r2, r2, r3, lsl #8
	mov r1, r0
	orr r3, ip, lr, lsl #8
	mov r0, #0xf
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CAB8

	arm_func_start sub_0207CAE0
sub_0207CAE0: ; 0x0207CAE0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x10]
	mov r4, r1
	mov lr, #0
	mov r1, r0
	orr r2, r4, r2, lsl #8
	orr r3, ip, r3, lsl #8
	mov r0, #0x10
	str lr, [sp]
	bl sub_0207CBCC
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0207CAE0

	arm_func_start sub_0207CB14
sub_0207CB14: ; 0x0207CB14
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1f
	str r3, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CB14

	arm_func_start sub_0207CB34
sub_0207CB34: ; 0x0207CB34
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x20
	str r3, [sp]
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CB34

	arm_func_start sub_0207CB54
sub_0207CB54: ; 0x0207CB54
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0x19
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CB54

	arm_func_start sub_0207CB7C
sub_0207CB7C: ; 0x0207CB7C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #6
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CB7C

	arm_func_start sub_0207CBA4
sub_0207CBA4: ; 0x0207CBA4
	stmdb sp!, {r3, lr}
	ldr ip, [sp, #8]
	mov lr, r2
	str r3, [sp]
	mov r2, r1
	orr r1, r0, ip, lsl #24
	mov r3, lr
	mov r0, #7
	bl sub_0207CBCC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207CBA4

	arm_func_start sub_0207CBCC
sub_0207CBCC: ; 0x0207CBCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #1
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_0207CE54
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r7, [r0, #4]
	str r6, [r0, #8]
	str r5, [r0, #0xc]
	ldr r1, [sp, #0x18]
	str r4, [r0, #0x10]
	str r1, [r0, #0x14]
	bl sub_0207CEDC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207CBCC

	arm_func_start sub_0207CC10
sub_0207CC10: ; 0x0207CC10
	stmdb sp!, {r3, lr}
	ldr r1, _0207CC40 ; =_022B99EC
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0207CC44 ; =_022B99F0
	mov r2, #1
	str r2, [r1]
	bl sub_0207A030
	bl sub_0207CC70
	bl sub_0207D380
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207CC40: .word _022B99EC
_0207CC44: .word _022B99F0
	arm_func_end sub_0207CC10

	arm_func_start sub_0207CC48
sub_0207CC48: ; 0x0207CC48
	ldr ip, _0207CC54 ; =sub_0207A048
	ldr r0, _0207CC58 ; =_022B99F0
	bx ip
	.align 2, 0
_0207CC54: .word sub_0207A048
_0207CC58: .word _022B99F0
	arm_func_end sub_0207CC48

	arm_func_start sub_0207CC5C
sub_0207CC5C: ; 0x0207CC5C
	ldr ip, _0207CC68 ; =sub_0207A0CC
	ldr r0, _0207CC6C ; =_022B99F0
	bx ip
	.align 2, 0
_0207CC68: .word sub_0207A0CC
_0207CC6C: .word _022B99F0
	arm_func_end sub_0207CC5C

	arm_func_start sub_0207CC70
sub_0207CC70: ; 0x0207CC70
	stmdb sp!, {r4, lr}
	bl sub_0207D270
	ldr lr, _0207CD2C ; =_022B9D00
	ldr r0, _0207CD30 ; =_022B9A20
	mov r4, #0
	str lr, [r0]
	mov r0, #0x18
	mov r1, r0
	b _0207CCA8
_0207CC94:
	add r3, r4, #1
	mul r2, r4, r1
	mla ip, r3, r0, lr
	mov r4, r3
	str ip, [lr, r2]
_0207CCA8:
	cmp r4, #0xff
	blt _0207CC94
	ldr r0, _0207CD34 ; =_022BAA20
	mov r3, #0
	str r3, [r0, #0xac8]
	ldr r1, _0207CD38 ; =_022BB4E8
	ldr r2, _0207CD30 ; =_022B9A20
	mov r0, #1
	str r1, [r2, #0x10]
	str r3, [r2, #8]
	str r3, [r2, #0xc]
	str r3, [r2, #0x1c]
	str r3, [r2, #0x14]
	str r3, [r2, #0x18]
	str r0, [r2, #0x20]
	ldr r0, _0207CD3C ; =_022B9A80
	ldr r1, _0207CD40 ; =_022BB560
	str r3, [r2, #4]
	str r0, [r1]
	bl sub_0207D4C4
	mov r0, #1
	bl sub_0207CE54
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0x1d
	ldr r1, _0207CD40 ; =_022BB560
	str r2, [r0, #4]
	ldr r1, [r1]
	str r1, [r0, #8]
	bl sub_0207CEDC
	mov r0, #1
	bl sub_0207CF14
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207CD2C: .word _022B9D00
_0207CD30: .word _022B9A20
_0207CD34: .word _022BAA20
_0207CD38: .word _022BB4E8
_0207CD3C: .word _022B9A80
_0207CD40: .word _022BB560
	arm_func_end sub_0207CC70

	arm_func_start sub_0207CD44
sub_0207CD44: ; 0x0207CD44
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r4, r0
	tst r5, #1
	beq _0207CDA0
	bl sub_0207D49C
	ldr r5, _0207CE4C ; =_022B9A20
	ldr r1, [r5, #4]
	cmp r1, r0
	bne _0207CDC4
	mov r6, #0x64
_0207CD74:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	bl sub_0207B854
	bl EnableIrqFlag
	mov r4, r0
	bl sub_0207D49C
	ldr r1, [r5, #4]
	cmp r1, r0
	beq _0207CD74
	b _0207CDC4
_0207CDA0:
	bl sub_0207D49C
	ldr r1, _0207CE4C ; =_022B9A20
	ldr r1, [r1, #4]
	cmp r1, r0
	bne _0207CDC4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0207CDC4:
	ldr r0, _0207CE4C ; =_022B9A20
	ldr r2, _0207CE50 ; =_022B9A44
	ldr r3, [r0, #0x14]
	add r1, r3, #1
	ldr r5, [r2, r3, lsl #2]
	str r1, [r0, #0x14]
	cmp r1, #8
	movgt r1, #0
	strgt r1, [r0, #0x14]
	ldr r0, [r5]
	mov r2, r5
	cmp r0, #0
	beq _0207CE08
_0207CDF8:
	ldr r2, [r2]
	ldr r0, [r2]
	cmp r0, #0
	bne _0207CDF8
_0207CE08:
	ldr r0, _0207CE4C ; =_022B9A20
	ldr r1, [r0, #0x10]
	cmp r1, #0
	strne r5, [r1]
	streq r5, [r0]
	ldr r1, _0207CE4C ; =_022B9A20
	mov r0, r4
	str r2, [r1, #0x10]
	ldr r2, [r1, #0x1c]
	sub r2, r2, #1
	str r2, [r1, #0x1c]
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207CE4C: .word _022B9A20
_0207CE50: .word _022B9A44
	arm_func_end sub_0207CD44

	arm_func_start sub_0207CE54
sub_0207CE54: ; 0x0207CE54
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0207D340
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_0207D2F8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	tst r4, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_0207D230
	cmp r0, #0
	ble _0207CEB4
	mov r4, #0
_0207CE94:
	mov r0, r4
	bl sub_0207CD44
	cmp r0, #0
	bne _0207CE94
	bl sub_0207D2F8
	cmp r0, #0
	beq _0207CEBC
	ldmia sp!, {r4, pc}
_0207CEB4:
	mov r0, #1
	bl sub_0207CF14
_0207CEBC:
	bl sub_0207D2D0
	mov r4, #1
_0207CEC4:
	mov r0, r4
	bl sub_0207CD44
	bl sub_0207D2F8
	cmp r0, #0
	beq _0207CEC4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207CE54

	arm_func_start sub_0207CEDC
sub_0207CEDC: ; 0x0207CEDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207CF10 ; =_022B9A20
	ldr r2, [r1, #0xc]
	cmp r2, #0
	streq r4, [r1, #8]
	strne r4, [r2]
	str r4, [r1, #0xc]
	mov r1, #0
	str r1, [r4]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207CF10: .word _022B9A20
	arm_func_end sub_0207CEDC

	arm_func_start sub_0207CF14
sub_0207CF14: ; 0x0207CF14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl EnableIrqFlag
	ldr r4, _0207D0C4 ; =_022B9A20
	mov sb, r0
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _0207CF40
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CF40:
	ldr r1, [r4, #0x1c]
	cmp r1, #8
	blt _0207CF98
	tst sl, #1
	bne _0207CF60
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CF60:
	mov r5, #1
_0207CF64:
	mov r0, r5
	bl sub_0207CD44
	ldr r0, [r4, #0x1c]
	cmp r0, #8
	bge _0207CF64
	ldr r0, _0207D0C4 ; =_022B9A20
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0207CF98
	mov r0, sb
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CF98:
	ldr r0, _0207D0C8 ; =_022B9D00
	mov r1, #0x1800
	bl sub_0207A2DC
	ldr r1, _0207D0C4 ; =_022B9A20
	mov r0, #7
	ldr r1, [r1, #8]
	mov r2, #0
	bl sub_0207DB20
	cmp r0, #0
	bge _0207D058
	tst sl, #1
	bne _0207CFD8
	mov r0, sb
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CFD8:
	mov fp, #0
	mov r5, #7
	mov r8, fp
	ldr r7, _0207D0C8 ; =_022B9D00
	mov r6, #0x1800
	ldr r4, _0207D0C4 ; =_022B9A20
	b _0207D034
_0207CFF4:
	mov r0, sb
	bl SetIrqFlag
	mov r0, r8
	bl sub_0207CD44
	bl EnableIrqFlag
	mov sb, r0
	mov r0, r7
	mov r1, r6
	bl sub_0207A2DC
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0207D034
	mov r0, sb
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207D034:
	ldr r0, [r4, #0x1c]
	cmp r0, #8
	bge _0207CFF4
	ldr r1, [r4, #8]
	mov r0, r5
	mov r2, fp
	bl sub_0207DB20
	cmp r0, #0
	blt _0207CFF4
_0207D058:
	ldr r0, _0207D0C4 ; =_022B9A20
	ldr r2, _0207D0CC ; =_022B9A44
	ldr r3, [r0, #0x18]
	ldr r4, [r0, #8]
	add r1, r3, #1
	str r4, [r2, r3, lsl #2]
	str r1, [r0, #0x18]
	cmp r1, #8
	movgt r1, #0
	strgt r1, [r0, #0x18]
	ldr r1, _0207D0C4 ; =_022B9A20
	mov r0, #0
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r2, [r1, #0x1c]
	mov r0, sb
	add r2, r2, #1
	str r2, [r1, #0x1c]
	ldr r2, [r1, #0x20]
	add r2, r2, #1
	str r2, [r1, #0x20]
	bl SetIrqFlag
	tst sl, #2
	beq _0207D0BC
	bl sub_0207D2D0
_0207D0BC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207D0C4: .word _022B9A20
_0207D0C8: .word _022B9D00
_0207D0CC: .word _022B9A44
	arm_func_end sub_0207CF14

	arm_func_start sub_0207D0D0
sub_0207D0D0: ; 0x0207D0D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0207D168
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #0
_0207D0E8:
	mov r0, r4
	bl sub_0207CD44
	cmp r0, #0
	bne _0207D0E8
	mov r0, r5
	bl sub_0207D168
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl sub_0207D2D0
	mov r0, r5
	bl sub_0207D168
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #1
_0207D120:
	mov r0, r4
	bl sub_0207CD44
	mov r0, r5
	bl sub_0207D168
	cmp r0, #0
	beq _0207D120
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207D0D0

	arm_func_start sub_0207D13C
sub_0207D13C: ; 0x0207D13C
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D164 ; =_022B9A20
	ldr r2, [r1, #8]
	cmp r2, #0
	ldreq r4, [r1, #4]
	ldrne r4, [r1, #0x20]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D164: .word _022B9A20
	arm_func_end sub_0207D13C

	arm_func_start sub_0207D168
sub_0207D168: ; 0x0207D168
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207D1B4 ; =_022B9A20
	ldr r1, [r1, #4]
	cmp r4, r1
	bls _0207D198
	sub r1, r4, r1
	cmp r1, #0x80000000
	movlo r4, #0
	movhs r4, #1
	b _0207D1A8
_0207D198:
	sub r1, r1, r4
	cmp r1, #0x80000000
	movlo r4, #1
	movhs r4, #0
_0207D1A8:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D1B4: .word _022B9A20
	arm_func_end sub_0207D168

	arm_func_start sub_0207D1B8
sub_0207D1B8: ; 0x0207D1B8
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D1F0 ; =_022B9A20
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _0207D1E4
_0207D1D4:
	ldr r1, [r1]
	add r4, r4, #1
	cmp r1, #0
	bne _0207D1D4
_0207D1E4:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D1F0: .word _022B9A20
	arm_func_end sub_0207D1B8

	arm_func_start sub_0207D1F4
sub_0207D1F4: ; 0x0207D1F4
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D22C ; =_022B9A20
	mov r4, #0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _0207D220
_0207D210:
	ldr r1, [r1]
	add r4, r4, #1
	cmp r1, #0
	bne _0207D210
_0207D220:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D22C: .word _022B9A20
	arm_func_end sub_0207D1F4

	arm_func_start sub_0207D230
sub_0207D230: ; 0x0207D230
	stmdb sp!, {r4, lr}
	bl sub_0207D1B8
	mov r4, r0
	bl sub_0207D1F4
	rsb r1, r4, #0x100
	sub r0, r1, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207D230

	arm_func_start sub_0207D24C
sub_0207D24C: ; 0x0207D24C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl EnableIrqFlag
	mov r4, r0
	mov r0, r5
	bl sub_0207D400
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207D24C

	arm_func_start sub_0207D270
sub_0207D270: ; 0x0207D270
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0207D2CC ; =sub_0207D24C
	mov r0, #7
	bl sub_0207DAB0
	bl sub_0207D340
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #7
	mov r1, #1
	bl sub_0207DAFC
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r6, #0x64
	mov r5, #7
	mov r4, #1
_0207D2AC:
	mov r0, r6
	bl sub_0207B854
	mov r0, r5
	mov r1, r4
	bl sub_0207DAFC
	cmp r0, #0
	beq _0207D2AC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207D2CC: .word sub_0207D24C
	arm_func_end sub_0207D270

	arm_func_start sub_0207D2D0
sub_0207D2D0: ; 0x0207D2D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #7
	mov r4, #0
_0207D2DC:
	mov r0, r5
	mov r1, r4
	mov r2, r4
	bl sub_0207DB20
	cmp r0, #0
	blt _0207D2DC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207D2D0

	arm_func_start sub_0207D2F8
sub_0207D2F8: ; 0x0207D2F8
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D33C ; =_022B9A20
	ldr r4, [r1]
	cmp r4, #0
	bne _0207D31C
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, pc}
_0207D31C:
	ldr r2, [r4]
	str r2, [r1]
	cmp r2, #0
	moveq r2, #0
	streq r2, [r1, #0x10]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D33C: .word _022B9A20
	arm_func_end sub_0207D2F8

	arm_func_start sub_0207D340
sub_0207D340: ; 0x0207D340
	stmdb sp!, {r4, lr}
	bl sub_02079D98
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl EnableIrqFlag
	ldr r1, _0207D37C ; =0x04FFF200
	mov r2, #0x10
	str r2, [r1]
	ldr r4, [r1]
	bl SetIrqFlag
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D37C: .word 0x04FFF200
	arm_func_end sub_0207D340

	arm_func_start sub_0207D380
sub_0207D380: ; 0x0207D380
	mov r1, #0
	ldr r2, _0207D3AC ; =_022BB500
	mov r0, r1
_0207D38C:
	str r0, [r2]
	str r0, [r2, #4]
	add r1, r1, #1
	strb r0, [r2, #8]
	cmp r1, #8
	add r2, r2, #0xc
	blt _0207D38C
	bx lr
	.align 2, 0
_0207D3AC: .word _022BB500
	arm_func_end sub_0207D380

	arm_func_start sub_0207D3B0
sub_0207D3B0: ; 0x0207D3B0
	ldr r2, _0207D3CC ; =_022BB500
	mov r1, #0xc
	mla r1, r0, r1, r2
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_0207D3CC: .word _022BB500
	arm_func_end sub_0207D3B0

	arm_func_start sub_0207D3D0
sub_0207D3D0: ; 0x0207D3D0
	mov r3, #0xc
	mul r3, r0, r3
	ldr r0, _0207D3FC ; =_022BB500
	str r1, [r0, r3]
	add r1, r0, r3
	str r2, [r1, #4]
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0207D3FC: .word _022BB500
	arm_func_end sub_0207D3D0

	arm_func_start sub_0207D400
sub_0207D400: ; 0x0207D400
	stmdb sp!, {r3, lr}
	ldr r3, _0207D440 ; =_022BB500
	and r2, r0, #0xff
	mov r1, #0xc
	mla r3, r2, r1, r3
	mov r1, r0, asr #8
	ldrb r0, [r3, #8]
	and r1, r1, #0xff
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	ldr r1, [r3]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r3, #4]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D440: .word _022BB500
	arm_func_end sub_0207D400

	arm_func_start sub_0207D444
sub_0207D444: ; 0x0207D444
	stmdb sp!, {r3, lr}
	ldr r0, _0207D46C ; =_022BB560
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #4
	bl sub_0207A2A4
	ldr r0, _0207D46C ; =_022BB560
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D46C: .word _022BB560
	arm_func_end sub_0207D444

	arm_func_start sub_0207D470
sub_0207D470: ; 0x0207D470
	stmdb sp!, {r3, lr}
	ldr r0, _0207D498 ; =_022BB560
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #8
	bl sub_0207A2A4
	ldr r0, _0207D498 ; =_022BB560
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D498: .word _022BB560
	arm_func_end sub_0207D470

	arm_func_start sub_0207D49C
sub_0207D49C: ; 0x0207D49C
	stmdb sp!, {r3, lr}
	ldr r0, _0207D4C0 ; =_022BB560
	mov r1, #4
	ldr r0, [r0]
	bl sub_0207A2A4
	ldr r0, _0207D4C0 ; =_022BB560
	ldr r0, [r0]
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D4C0: .word _022BB560
	arm_func_end sub_0207D49C

	arm_func_start sub_0207D4C4
sub_0207D4C4: ; 0x0207D4C4
	stmdb sp!, {r4, lr}
	mov ip, #0
	str ip, [r0, #4]
	strh ip, [r0, #8]
	strh ip, [r0, #0xa]
	mov r4, r0
	str ip, [r0]
	mvn r2, #0
	mov r3, ip
_0207D4E8:
	mov lr, r3
	str r3, [r4, #0x40]
_0207D4F0:
	add r1, r4, lr, lsl #1
	add lr, lr, #1
	strh r2, [r1, #0x20]
	cmp lr, #0x10
	blt _0207D4F0
	add ip, ip, #1
	cmp ip, #0x10
	add r4, r4, #0x24
	blt _0207D4E8
	mov r3, #0
	mvn r2, #0
_0207D51C:
	add r1, r0, r3, lsl #1
	add r1, r1, #0x200
	add r3, r3, #1
	strh r2, [r1, #0x60]
	cmp r3, #0x10
	blt _0207D51C
	mov r1, #0x280
	bl sub_0207A2DC
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207D4C4

	arm_func_start sub_0207D540
sub_0207D540: ; 0x0207D540
	ldr r1, _0207D5A8 ; =0xFFFFFD2D
	cmp r0, r1
	movlt r0, r1
	blt _0207D558
	cmp r0, #0
	movgt r0, #0
_0207D558:
	add r1, r0, #0xd3
	mvn r2, #0xef
	cmp r0, r2
	ldr r3, _0207D5AC ; =ARM9_UNKNOWN_TABLE__NA_20AE924
	add r1, r1, #0x200
	ldrb r3, [r3, r1]
	movlt r0, #3
	blt _0207D598
	add r1, r2, #0x78
	cmp r0, r1
	movlt r0, #2
	blt _0207D598
	add r1, r2, #0xb4
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
_0207D598:
	orr r0, r3, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_0207D5A8: .word 0xFFFFFD2D
_0207D5AC: .word ARM9_UNKNOWN_TABLE__NA_20AE924
	arm_func_end sub_0207D540

	arm_func_start sub_0207D5B0
sub_0207D5B0: ; 0x0207D5B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_0207CC48
	add r3, r6, r5, lsl #3
	ldr r2, [r3, #0x18]
	cmp r2, #0
	beq _0207D640
	cmp r4, r2
	bne _0207D5E4
	bl sub_0207CC5C
	ldmia sp!, {r4, r5, r6, pc}
_0207D5E4:
	add r1, r6, #0x18
	ldr r0, [r2, #0x18]
	add ip, r1, r5, lsl #3
	cmp ip, r0
	bne _0207D610
	ldr r0, [r3, #0x1c]
	mov r1, #0x3c
	str r0, [r2, #0x18]
	ldr r0, [r3, #0x18]
	bl sub_0207A2C0
	b _0207D640
_0207D610:
	cmp r0, #0
	beq _0207D62C
_0207D618:
	ldr r1, [r0, #4]
	cmp ip, r1
	movne r0, r1
	cmpne r1, #0
	bne _0207D618
_0207D62C:
	add r1, r6, r5, lsl #3
	ldr r2, [r1, #0x1c]
	mov r1, #8
	str r2, [r0, #4]
	bl sub_0207A2C0
_0207D640:
	add r0, r6, #0x18
	ldr r1, [r4, #0x18]
	add r0, r0, r5, lsl #3
	str r0, [r4, #0x18]
	add r0, r6, r5, lsl #3
	str r1, [r0, #0x1c]
	str r4, [r0, #0x18]
	bl sub_0207CC5C
	mov r0, r6
	mov r1, #0x3c
	bl sub_0207A2C0
	mov r0, r4
	mov r1, #0x3c
	bl sub_0207A2C0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207D5B0

	arm_func_start sub_0207D67C
sub_0207D67C: ; 0x0207D67C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	bl sub_0207CC48
	add r5, r7, #0x18
	mov r6, #0
	mov r8, #8
	mov r4, #0x3c
_0207D698:
	add r1, r7, r6, lsl #3
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _0207D6FC
	ldr r3, [r0, #0x18]
	cmp r5, r3
	bne _0207D6C8
	ldr r2, [r1, #0x1c]
	mov r1, r4
	str r2, [r0, #0x18]
	bl sub_0207A2C0
	b _0207D6FC
_0207D6C8:
	cmp r3, #0
	beq _0207D6E4
_0207D6D0:
	ldr r0, [r3, #4]
	cmp r5, r0
	movne r3, r0
	cmpne r0, #0
	bne _0207D6D0
_0207D6E4:
	add r0, r7, r6, lsl #3
	ldr r2, [r0, #0x1c]
	mov r0, r3
	mov r1, r8
	str r2, [r3, #4]
	bl sub_0207A2C0
_0207D6FC:
	add r6, r6, #1
	cmp r6, #4
	add r5, r5, #8
	blt _0207D698
	bl sub_0207CC5C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207D67C

	arm_func_start sub_0207D714
sub_0207D714: ; 0x0207D714
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	bl sub_0207CC48
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0207D754
	mov r5, #0
	mov r4, #8
_0207D734:
	ldr r6, [r0, #4]
	mov r1, r4
	str r5, [r0]
	str r5, [r0, #4]
	bl sub_0207A2C0
	mov r0, r6
	cmp r6, #0
	bne _0207D734
_0207D754:
	bl sub_0207CC5C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207D714

	arm_func_start sub_0207D75C
sub_0207D75C: ; 0x0207D75C
	sub sp, sp, #8
	mov r1, #0
	str r1, [r0]
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [r0, #4]
	add sp, sp, #8
	bx lr
	arm_func_end sub_0207D75C

	arm_func_start sub_0207D77C
sub_0207D77C: ; 0x0207D77C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r2]
	ldr r3, [r0, #0x38]
	cmp r4, r3
	bhs _0207D924
	mov ip, #0
_0207D794:
	add r3, r0, r4, lsl #2
	ldr r4, [r3, #0x3c]
	and r3, r4, #0xff
	strb r4, [r1]
	cmp r3, #0x10
	mov r4, r4, lsr #8
	bgt _0207D7DC
	cmp r3, #0x10
	bge _0207D828
	cmp r3, #5
	addls pc, pc, r3, lsl #2
	b _0207D908
_0207D7C4: ; jump table
	b _0207D908 ; case 0
	b _0207D7E8 ; case 1
	b _0207D7E8 ; case 2
	b _0207D7E8 ; case 3
	b _0207D7E8 ; case 4
	b _0207D7E8 ; case 5
_0207D7DC:
	cmp r3, #0x11
	beq _0207D89C
	b _0207D908
_0207D7E8:
	add r5, r0, r4
	ldrh r4, [r0, r4]
	ldrh r3, [r5, #2]
	mov r0, #1
	strh r4, [r1, #2]
	strh r3, [r1, #4]
	ldrh r4, [r5, #4]
	ldrh r3, [r5, #6]
	strh r4, [r1, #6]
	strh r3, [r1, #8]
	ldrh r3, [r5, #8]
	strh r3, [r1, #0xa]
	ldr r1, [r2]
	add r1, r1, #1
	str r1, [r2]
	ldmia sp!, {r3, r4, r5, pc}
_0207D828:
	add r5, r0, r4
	b _0207D87C
_0207D830:
	mov r0, #0xc
	mla ip, lr, r0, r5
	ldrh r4, [ip, #2]
	ldrh r3, [ip, #4]
	mov r0, #1
	strh r4, [r1]
	strh r3, [r1, #2]
	ldrh r4, [ip, #6]
	ldrh r3, [ip, #8]
	strh r4, [r1, #4]
	strh r3, [r1, #6]
	ldrh r4, [ip, #0xa]
	ldrh r3, [ip, #0xc]
	strh r4, [r1, #8]
	strh r3, [r1, #0xa]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0207D87C:
	ldrb r4, [r5, #1]
	ldrb r3, [r5]
	ldr lr, [r2, #4]
	sub r3, r4, r3
	add r3, r3, #1
	cmp lr, r3
	blo _0207D830
	b _0207D908
_0207D89C:
	add r4, r0, r4
	b _0207D8FC
_0207D8A4:
	ldrb lr, [r4, r3]
	cmp lr, #0
	beq _0207D908
	mov r0, #0xc
	mla lr, r3, r0, r4
	ldrh ip, [lr, #8]
	ldrh r3, [lr, #0xa]
	mov r0, #1
	strh ip, [r1]
	strh r3, [r1, #2]
	ldrh ip, [lr, #0xc]
	ldrh r3, [lr, #0xe]
	strh ip, [r1, #4]
	strh r3, [r1, #6]
	ldrh ip, [lr, #0x10]
	ldrh r3, [lr, #0x12]
	strh ip, [r1, #8]
	strh r3, [r1, #0xa]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0207D8FC:
	ldr r3, [r2, #4]
	cmp r3, #8
	blo _0207D8A4
_0207D908:
	ldr r3, [r2]
	add r3, r3, #1
	stmia r2, {r3, ip}
	ldr r4, [r2]
	ldr r3, [r0, #0x38]
	cmp r4, r3
	blo _0207D794
_0207D924:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207D77C

	arm_func_start sub_0207D92C
sub_0207D92C: ; 0x0207D92C
	ldr r0, [r0, #0x38]
	bx lr
	arm_func_end sub_0207D92C

	arm_func_start sub_0207D934
sub_0207D934: ; 0x0207D934
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_0207CC48
	add r0, r6, #0x3c
	add r2, r6, r5, lsl #2
	add r0, r0, r5, lsl #2
	mov r1, #4
	str r4, [r2, #0x3c]
	bl sub_0207A2C0
	bl sub_0207CC5C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207D934

	arm_func_start sub_0207D968
sub_0207D968: ; 0x0207D968
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_0207CC48
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _0207D994
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _0207D998
_0207D994:
	mov r4, #0
_0207D998:
	bl sub_0207CC5C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207D968

	arm_func_start sub_0207D9A4
sub_0207D9A4: ; 0x0207D9A4
	ldr ip, _0207D9AC ; =sub_0207D9B0
	bx ip
	.align 2, 0
_0207D9AC: .word sub_0207D9B0
	arm_func_end sub_0207D9A4

	arm_func_start sub_0207D9B0
sub_0207D9B0: ; 0x0207D9B0
	stmdb sp!, {r3, r4, r5, lr}
	bl EnableIrqFlag
	ldr r1, _0207DA94 ; =_022BB564
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _0207DA88
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	ldr r0, _0207DA98 ; =0x027FFC00
	mov r1, r2
	str r2, [r0, #0x388]
	ldr r0, _0207DA9C ; =_022BB568
_0207D9E8:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _0207D9E8
	ldr r2, _0207DAA0 ; =0x0000C408
	ldr r1, _0207DAA4 ; =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl sub_02078CC8
	ldr r1, _0207DAA8 ; =sub_0207DBA8
	mov r0, #0x40000
	bl sub_02078A98
	mov r0, #0x40000
	bl sub_02078C68
	mov r5, #0
	ldr r3, _0207DAAC ; =0x04000180
	mov r1, r5
	mov r2, #0x3e8
_0207DA30:
	ldrh r0, [r3]
	ands lr, r0, #0xf
	mov r0, lr, lsl #8
	strh r0, [r3]
	bne _0207DA4C
	cmp r5, #4
	bgt _0207DA88
_0207DA4C:
	ldrh r0, [r3]
	mov ip, r2
	and r0, r0, #0xf
	cmp r0, lr
	bne _0207DA80
_0207DA60:
	cmp ip, #0
	movle r5, r1
	ble _0207DA80
	ldrh r0, [r3]
	sub ip, ip, #1
	and r0, r0, #0xf
	cmp r0, lr
	beq _0207DA60
_0207DA80:
	add r5, r5, #1
	b _0207DA30
_0207DA88:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207DA94: .word _022BB564
_0207DA98: .word 0x027FFC00
_0207DA9C: .word _022BB568
_0207DAA0: .word 0x0000C408
_0207DAA4: .word 0x04000184
_0207DAA8: .word sub_0207DBA8
_0207DAAC: .word 0x04000180
	arm_func_end sub_0207D9B0

	arm_func_start sub_0207DAB0
sub_0207DAB0: ; 0x0207DAB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl EnableIrqFlag
	ldr r1, _0207DAF4 ; =_022BB568
	ldr r3, _0207DAF8 ; =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x388]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	mvneq r1, r1, lsl r4
	ldreq r2, [r3, #0x388]
	andeq r1, r2, r1
	str r1, [r3, #0x388]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207DAF4: .word _022BB568
_0207DAF8: .word 0x027FFC00
	arm_func_end sub_0207DAB0

	arm_func_start sub_0207DAFC
sub_0207DAFC: ; 0x0207DAFC
	ldr r2, _0207DB1C ; =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_0207DB1C: .word 0x027FFC00
	arm_func_end sub_0207DAFC

	arm_func_start sub_0207DB20
sub_0207DB20: ; 0x0207DB20
	stmdb sp!, {r3, lr}
	ldr ip, [sp]
	ldr r3, _0207DBA4 ; =0x04000184
	bic ip, ip, #0x1f
	and r0, r0, #0x1f
	orr ip, ip, r0
	ldrh r0, [r3]
	bic ip, ip, #0x20
	mov r2, r2, lsl #0x1f
	orr r2, ip, r2, lsr #26
	and r2, r2, #0x3f
	orr r1, r2, r1, lsl #6
	str r1, [sp]
	tst r0, #0x4000
	beq _0207DB70
	ldrh r1, [r3]
	mvn r0, #0
	orr r1, r1, #0xc000
	strh r1, [r3]
	ldmia sp!, {r3, pc}
_0207DB70:
	bl EnableIrqFlag
	ldr r2, _0207DBA4 ; =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _0207DB90
	bl SetIrqFlag
	mvn r0, #1
	ldmia sp!, {r3, pc}
_0207DB90:
	ldr r1, [sp]
	str r1, [r2, #4]
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207DBA4: .word 0x04000184
	arm_func_end sub_0207DB20

	arm_func_start sub_0207DBA8
sub_0207DBA8: ; 0x0207DBA8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mvn r8, #3
	ldr r6, [sp]
	ldr sb, _0207DCB8 ; =0x04000184
	ldr r4, _0207DCBC ; =_022BB568
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_0207DBCC:
	ldrh r0, [sb]
	tst r0, #0x4000
	beq _0207DBEC
	ldrh r0, [sb]
	add r1, r8, #1
	orr r0, r0, #0xc000
	strh r0, [sb]
	b _0207DC18
_0207DBEC:
	bl EnableIrqFlag
	ldrh r1, [sb]
	tst r1, #0x100
	beq _0207DC08
	bl SetIrqFlag
	mov r1, r8
	b _0207DC18
_0207DC08:
	ldr r6, [r7]
	str r6, [sp]
	bl SetIrqFlag
	mov r1, r5
_0207DC18:
	cmp r1, r8
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r1, sl
	beq _0207DBCC
	mov r0, r6, lsl #0x1b
	movs r0, r0, lsr #0x1b
	beq _0207DBCC
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _0207DC58
	mov r2, r6, lsl #0x1a
	mov r1, r6, lsr #6
	mov r2, r2, lsr #0x1f
	blx r3
	b _0207DBCC
_0207DC58:
	mov r0, r6, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _0207DBCC
	ldrh r0, [sb]
	orr r6, r6, #0x20
	str r6, [sp]
	tst r0, #0x4000
	beq _0207DC88
	ldrh r0, [sb]
	orr r0, r0, #0xc000
	strh r0, [sb]
	b _0207DBCC
_0207DC88:
	bl EnableIrqFlag
	ldrh r1, [sb]
	tst r1, #2
	beq _0207DCA0
	bl SetIrqFlag
	b _0207DBCC
_0207DCA0:
	mov r1, r6
	str r1, [sb, #4]
	bl SetIrqFlag
	b _0207DBCC
_0207DCB0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0207DCB8: .word 0x04000184
_0207DCBC: .word _022BB568
	arm_func_end sub_0207DBA8

	arm_func_start sub_0207DCC0
sub_0207DCC0: ; 0x0207DCC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r6, r0
	ldr r0, [r5, #4]
	cmp r1, #0
	strne r0, [r1, #4]
	cmp r0, #0
	strne r1, [r0]
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	ldr r1, [r5, #0xc]
	add r0, r5, #0x18
	bic r1, r1, #0x4f
	str r1, [r5, #0xc]
	str r4, [r5, #0x14]
	bl sub_020798D8
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207DCC0

	arm_func_start sub_0207DD1C
sub_0207DD1C: ; 0x0207DD1C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0xc]
	ldr r5, [r8, #8]
	mov r7, r1
	mov r1, #1
	tst r0, #4
	mov r6, r1, lsl r7
	moveq r1, #0
	ldr r0, [r5, #0x1c]
	cmp r1, #0
	orrne r0, r0, #0x200
	orreq r0, r0, #0x100
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x58]
	tst r0, r6
	beq _0207DDC4
	ldr r2, [r5, #0x54]
	mov r0, r8
	mov r1, r7
	blx r2
	mov r4, r0
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0207DDC8
_0207DD80: ; jump table
	b _0207DDA4 ; case 0
	b _0207DDA4 ; case 1
	b _0207DDC8 ; case 2
	b _0207DDC8 ; case 3
	b _0207DDA4 ; case 4
	b _0207DDC8 ; case 5
	b _0207DDC8 ; case 6
	b _0207DDC8 ; case 7
	b _0207DDAC ; case 8
_0207DDA4:
	str r4, [r8, #0x14]
	b _0207DDC8
_0207DDAC:
	ldr r1, [r5, #0x58]
	mvn r0, r6
	and r0, r1, r0
	str r0, [r5, #0x58]
	mov r4, #7
	b _0207DDC8
_0207DDC4:
	mov r4, #7
_0207DDC8:
	cmp r4, #7
	bne _0207DDE4
	ldr r1, _0207DEA8 ; =_020AEBF8
	mov r0, r8
	ldr r1, [r1, r7, lsl #2]
	blx r1
	mov r4, r0
_0207DDE4:
	cmp r4, #6
	bne _0207DE5C
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DEA0
	bl EnableIrqFlag
	ldr r1, [r5, #0x1c]
	mov r7, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DE4C
	mov r4, #0
	mov r6, #1
_0207DE2C:
	add r0, r5, #0xc
	bl sub_02079888
	ldr r0, [r5, #0x1c]
	tst r0, #0x200
	movne r0, r6
	moveq r0, r4
	cmp r0, #0
	bne _0207DE2C
_0207DE4C:
	mov r0, r7
	ldr r4, [r8, #0x14]
	bl SetIrqFlag
	b _0207DEA0
_0207DE5C:
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207DE90
	ldr r1, [r5, #0x1c]
	mov r0, r8
	bic r2, r1, #0x100
	mov r1, r4
	str r2, [r5, #0x1c]
	bl sub_0207DCC0
	b _0207DEA0
_0207DE90:
	ldr r0, [r5, #0x1c]
	bic r0, r0, #0x200
	str r0, [r5, #0x1c]
	str r4, [r8, #0x14]
_0207DEA0:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207DEA8: .word _020AEBF8
	arm_func_end sub_0207DD1C

	arm_func_start sub_0207DEAC
sub_0207DEAC: ; 0x0207DEAC
	stmdb sp!, {r3, lr}
	cmp r2, #0
	mov lr, #0
	bls _0207DEF4
_0207DEBC:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	sub ip, ip, #0x41
	cmp ip, #0x19
	sub r3, r3, #0x41
	addls ip, ip, #0x20
	cmp r3, #0x19
	addls r3, r3, #0x20
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blo _0207DEBC
_0207DEF4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207DEAC

	arm_func_start sub_0207DEFC
sub_0207DEFC: ; 0x0207DEFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldr r4, [r7]
	mov r6, r2
	ldr r2, [r4, #0x1c]
	mov r0, r4
	orr r2, r2, #0x200
	str r2, [r4, #0x1c]
	ldr r2, [r7, #4]
	ldr r5, [r4, #0x50]
	mov r3, r6
	blx r5
	cmp r0, #0
	cmpne r0, #1
	beq _0207DF44
	cmp r0, #6
	beq _0207DF54
	b _0207DFAC
_0207DF44:
	ldr r1, [r4, #0x1c]
	bic r1, r1, #0x200
	str r1, [r4, #0x1c]
	b _0207DFAC
_0207DF54:
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DF9C
	mov r8, #0
	mov sb, #1
_0207DF7C:
	add r0, r4, #0xc
	bl sub_02079888
	ldr r0, [r4, #0x1c]
	tst r0, #0x200
	movne r0, sb
	moveq r0, r8
	cmp r0, #0
	bne _0207DF7C
_0207DF9C:
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0x14]
_0207DFAC:
	ldr r1, [r7, #4]
	add r1, r1, r6
	str r1, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0207DEFC

	arm_func_start sub_0207DFBC
sub_0207DFBC: ; 0x0207DFBC
	ldr r3, [r0, #0xc]
	mov r2, #0
	orr r3, r3, #4
	str r3, [r0, #0xc]
	ldr r3, [r0, #8]
	ldr ip, _0207DFEC ; =sub_0207DD1C
	str r3, [r0, #0x30]
	str r2, [r0, #0x38]
	strh r2, [r0, #0x36]
	strh r1, [r0, #0x34]
	mov r1, #2
	bx ip
	.align 2, 0
_0207DFEC: .word sub_0207DD1C
	arm_func_end sub_0207DFBC

	arm_func_start sub_0207DFF0
sub_0207DFF0: ; 0x0207DFF0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x48]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207DFF0

	arm_func_start sub_0207E01C
sub_0207E01C: ; 0x0207E01C
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x4c]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207E01C

	arm_func_start sub_0207E048
sub_0207E048: ; 0x0207E048
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r4, [r6, #8]
	add r5, r6, #0x30
	str r4, [sp]
	ldrh r1, [r5, #4]
	ldr r2, [r4, #0x34]
	add r0, sp, #0
	add r3, r2, r1, lsl #3
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl sub_0207DEFC
	movs r3, r0
	bne _0207E0D0
	add ip, r6, #0x20
	ldmia r5, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldrh r0, [r5, #6]
	cmp r0, #0
	ldreq r0, [r5, #8]
	cmpeq r0, #0
	bne _0207E0C0
	ldrh r0, [sp, #0xc]
	strh r0, [r6, #0x26]
	ldr r1, [r4, #0x34]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r6, #0x28]
_0207E0C0:
	ldrh r1, [sp, #0xe]
	ldr r0, _0207E0DC ; =0x00000FFF
	and r0, r1, r0
	str r0, [r6, #0x2c]
_0207E0D0:
	mov r0, r3
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207E0DC: .word 0x00000FFF
	arm_func_end sub_0207E048

	arm_func_start sub_0207E0E0
sub_0207E0E0: ; 0x0207E0E0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r4, [r5, #0x30]
	ldr r1, [r5, #8]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r3, [r5, #0x28]
	add r1, sp, #0
	mov r2, #1
	str r3, [sp, #8]
	bl sub_0207DEFC
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldrb r1, [sp]
	and r2, r1, #0x7f
	mov r1, r1, asr #7
	str r2, [r4, #0x10]
	and r1, r1, #1
	str r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	cmp r2, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _0207E180
	add r0, sp, #4
	add r1, r4, #0x14
	bl sub_0207DEFC
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r1, [r4, #0x10]
	mov r2, #0
	add r1, r4, r1
	strb r2, [r1, #0x14]
	b _0207E18C
_0207E180:
	ldr r1, [sp, #8]
	add r1, r1, r2
	str r1, [sp, #8]
_0207E18C:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _0207E1DC
	add r0, sp, #4
	add r1, sp, #2
	mov r2, #2
	bl sub_0207DEFC
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r2, [r5, #8]
	ldr r1, _0207E208 ; =0x00000FFF
	str r2, [r4]
	ldrh r3, [sp, #2]
	mov r2, #0
	and r1, r3, r1
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	str r2, [r4, #8]
	b _0207E1F8
_0207E1DC:
	ldr r1, [r5, #8]
	str r1, [r4]
	ldrh r1, [r5, #0x26]
	str r1, [r4, #4]
	ldrh r1, [r5, #0x26]
	add r1, r1, #1
	strh r1, [r5, #0x26]
_0207E1F8:
	ldr r1, [sp, #8]
	str r1, [r5, #0x28]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0207E208: .word 0x00000FFF
	arm_func_end sub_0207E0E0

	arm_func_start sub_0207E20C
sub_0207E20C: ; 0x0207E20C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x94
	mov sb, r0
	ldr r5, [sb, #0x3c]
	mov r1, #2
	ldr r6, [sb, #0x40]
	bl sub_0207DD1C
	ldrb r3, [r5]
	cmp r3, #0
	beq _0207E3C4
_0207E234:
	mov r8, #0
	mov r0, #1
	mov r1, r8
	b _0207E248
_0207E244:
	add r8, r8, #1
_0207E248:
	ldrb r7, [r5, r8]
	mov r2, r1
	cmp r7, #0
	cmpne r7, #0x2f
	cmpne r7, #0x5c
	movne r2, r0
	cmp r2, #0
	bne _0207E244
	cmp r7, #0
	cmpeq r6, #0
	movne r7, #1
	cmp r8, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r3, #0x2e
	bne _0207E2DC
	cmp r8, #1
	addeq r5, r5, #1
	beq _0207E3A8
	ldrb r0, [r5, #1]
	cmp r8, #2
	moveq r1, #1
	movne r1, #0
	cmp r0, #0x2e
	moveq r0, #1
	movne r0, #0
	tst r1, r0
	beq _0207E2DC
	ldrh r0, [sb, #0x24]
	cmp r0, #0
	beq _0207E2D4
	ldr r1, [sb, #0x2c]
	mov r0, sb
	bl sub_0207DFBC
_0207E2D4:
	add r5, r5, #2
	b _0207E3A8
_0207E2DC:
	cmp r8, #0x7f
	addgt sp, sp, #0x94
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0
	mov r0, #0
	str r1, [sb, #0x30]
	str r0, [sb, #0x34]
	add sl, sp, #0x14
	mov r4, #3
_0207E304:
	mov r0, sb
	mov r1, r4
	bl sub_0207DD1C
	cmp r0, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [sp, #0xc]
	cmp r7, r0
	ldreq r0, [sp, #0x10]
	cmpeq r8, r0
	bne _0207E304
	mov r0, r5
	mov r1, sl
	mov r2, r8
	bl sub_0207DEAC
	cmp r0, #0
	bne _0207E304
	cmp r7, #0
	beq _0207E378
	add r0, sp, #0
	add r3, sb, #0x30
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, sb
	mov r1, #2
	add r5, r5, r8
	bl sub_0207DD1C
	b _0207E3A8
_0207E378:
	cmp r6, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add sp, sp, #0x94
	str r2, [r3]
	mov r0, #0
	str r1, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_0207E3A8:
	ldrb r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldrb r3, [r5, r0]!
	cmp r3, #0
	bne _0207E234
_0207E3C4:
	cmp r6, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	add r0, sb, #0x20
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #0
	add sp, sp, #0x94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0207E20C

	arm_func_start sub_0207E3F0
sub_0207E3F0: ; 0x0207E3F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe0
	mov sl, r0
	ldr r1, [sl, #8]
	add r0, sp, #4
	str r1, [sp]
	bl FileInit
	ldr r0, [sl, #8]
	str r0, [sp, #0xc]
	ldr r0, [sl, #0xc]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldrneh sb, [sl, #0x24]
	movne r6, #0x10000
	bne _0207E4D4
	ldrh r0, [sl, #0x38]
	ldr r6, [sl, #0x20]
	cmp r0, #0
	ldrneh sb, [sl, #0x3a]
	bne _0207E4D4
	mov r7, #0
	mov r8, r7
	mov sb, #0x10000
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_0207E460:
	mov r0, r5
	mov r1, r7
	bl sub_0207DFBC
	mov r2, #1
	cmp r7, #0
	mov r0, r5
	mov r1, #3
	ldreq r8, [sp, #0x30]
	str fp, [sp, #0x34]
	str r2, [sp, #0x38]
	bl sub_0207DD1C
	cmp r0, #0
	bne _0207E4C0
_0207E494:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	ldreqh sb, [sp, #0x28]
	beq _0207E4C0
	mov r0, r5
	mov r1, r4
	bl sub_0207DD1C
	cmp r0, #0
	beq _0207E494
_0207E4C0:
	cmp sb, #0x10000
	bne _0207E4D4
	add r7, r7, #1
	cmp r7, r8
	blo _0207E460
_0207E4D4:
	cmp sb, #0x10000
	bne _0207E4F0
	mov r0, #0
	strh r0, [sl, #0x38]
	add sp, sp, #0xe0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207E4F0:
	ldrh r0, [sl, #0x38]
	cmp r0, #0
	bne _0207E5D4
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0]
	cmp r0, #0xff
	addls r8, r1, #1
	bls _0207E520
	cmp r0, #0xff00
	addls r8, r1, #2
	addhi r8, r1, #3
_0207E520:
	cmp r6, #0x10000
	ldrne r0, [sp, #0x5c]
	add r8, r8, #2
	addne r8, r8, r0
	mov r7, sb
	cmp sb, #0
	beq _0207E5C8
	add r0, sp, #4
	mov r1, sb
	bl sub_0207DFBC
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_0207E554:
	ldr r1, [sp, #0x30]
	mov r0, r5
	bl sub_0207DFBC
	mov r1, #1
	str r1, [sp, #0x38]
	mov r0, r5
	mov r1, #3
	str fp, [sp, #0x34]
	bl sub_0207DD1C
	cmp r0, #0
	bne _0207E5BC
_0207E580:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _0207E5A8
	ldrh r0, [sp, #0x50]
	cmp r0, r7
	bne _0207E5A8
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	add r8, r8, r0
	b _0207E5BC
_0207E5A8:
	mov r0, r5
	mov r1, r4
	bl sub_0207DD1C
	cmp r0, #0
	beq _0207E580
_0207E5BC:
	ldrh r7, [sp, #0x28]
	cmp r7, #0
	bne _0207E554
_0207E5C8:
	add r0, r8, #1
	strh r0, [sl, #0x38]
	strh sb, [sl, #0x3a]
_0207E5D4:
	ldr r5, [sl, #0x30]
	cmp r5, #0
	addeq sp, sp, #0xe0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r4, [sl, #0x38]
	ldr r0, [sl, #0x34]
	cmp r0, r4
	addlo sp, sp, #0xe0
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp]
	mov r7, #0
	ldr r0, [r0]
	cmp r0, #0xff
	movls r8, #1
	bls _0207E624
	cmp r0, #0xff00
	movls r8, #2
	movhi r8, #3
_0207E624:
	ldr r0, [sp]
	mov r1, r5
	mov r2, r8
	bl MemcpyFast
	add r1, r7, r8
	ldr r0, _0207E798 ; =_020B2BB0
	add r1, r5, r1
	mov r2, #2
	bl MemcpyFast
	add r0, sp, #4
	mov r1, sb
	bl sub_0207DFBC
	cmp r6, #0x10000
	beq _0207E6D4
	add r3, sp, #0x4c
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	bl sub_0207DD1C
	cmp r0, #0
	bne _0207E6B0
	add r8, sp, #4
	mov r7, #3
_0207E688:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	beq _0207E6B0
	mov r0, r8
	mov r1, r7
	bl sub_0207DD1C
	cmp r0, #0
	beq _0207E688
_0207E6B0:
	ldr r0, [sp, #0x5c]
	add r1, r5, r4
	add r6, r0, #1
	add r0, sp, #0x60
	mov r2, r6
	sub r1, r1, r6
	bl MemcpyFast
	sub r4, r4, r6
	b _0207E6E4
_0207E6D4:
	add r0, r5, r4
	mov r1, #0
	strb r1, [r0, #-1]
	sub r4, r4, #1
_0207E6E4:
	cmp sb, #0
	beq _0207E78C
	add sl, sp, #4
	mov r6, #3
	add r8, sp, #0x4c
	mov r7, #0
	mov fp, #0x2f
_0207E700:
	ldr r1, [sp, #0x30]
	mov r0, sl
	bl sub_0207DFBC
	add r1, r5, r4
	str r8, [sp, #0x34]
	str r7, [sp, #0x38]
	strb fp, [r1, #-1]
	mov r0, sl
	mov r1, #3
	sub r4, r4, #1
	bl sub_0207DD1C
	cmp r0, #0
	bne _0207E780
_0207E734:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _0207E76C
	ldrh r0, [sp, #0x50]
	cmp r0, sb
	bne _0207E76C
	ldr sb, [sp, #0x5c]
	add r1, r5, r4
	add r0, sp, #0x60
	mov r2, sb
	sub r1, r1, sb
	bl MemcpyFast
	sub r4, r4, sb
	b _0207E780
_0207E76C:
	mov r0, sl
	mov r1, r6
	bl sub_0207DD1C
	cmp r0, #0
	beq _0207E734
_0207E780:
	ldrh sb, [sp, #0x28]
	cmp sb, #0
	bne _0207E700
_0207E78C:
	mov r0, #0
	add sp, sp, #0xe0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207E798: .word _020B2BB0
	arm_func_end sub_0207E3F0

	arm_func_start sub_0207E79C
sub_0207E79C: ; 0x0207E79C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r1, [r5, #8]
	ldr r4, [r5, #0x34]
	ldr r0, [r1, #0x30]
	mov r2, r4, lsl #3
	cmp r0, r4, lsl #3
	addls sp, sp, #0x10
	movls r0, #1
	ldmlsia sp!, {r3, r4, r5, pc}
	str r1, [sp]
	ldr r1, [r1, #0x2c]
	add r0, sp, #0
	add r3, r1, r2
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl sub_0207DEFC
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #8]
	mov r0, r5
	str r1, [r5, #0x30]
	ldr r2, [sp, #0xc]
	mov r1, #7
	str r2, [r5, #0x34]
	str r4, [r5, #0x38]
	bl sub_0207DD1C
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207E79C

	arm_func_start sub_0207E81C
sub_0207E81C: ; 0x0207E81C
	ldr r1, [r0, #0x30]
	str r1, [r0, #0x24]
	ldr r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x34]
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x38]
	str r1, [r0, #0x20]
	mov r0, #0
	bx lr
	arm_func_end sub_0207E81C

	arm_func_start sub_0207E844
sub_0207E844: ; 0x0207E844
	mov r0, #0
	bx lr
	arm_func_end sub_0207E844

	arm_func_start sub_0207E84C
sub_0207E84C: ; 0x0207E84C
	stmdb sp!, {r3, lr}
	cmp r1, #3
	mov r3, #0
	bgt _0207E89C
	mov ip, r3
	cmp r1, #0
	ble _0207E89C
	mov lr, r3
_0207E86C:
	ldrb r2, [r0, ip]
	cmp r2, #0
	beq _0207E89C
	sub r2, r2, #0x41
	cmp r2, #0x19
	addls r2, r2, #0x61
	addhi r2, r2, #0x41
	add ip, ip, #1
	orr r3, r3, r2, lsl lr
	cmp ip, r1
	add lr, lr, #8
	blt _0207E86C
_0207E89C:
	mov r0, r3
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207E84C

	arm_func_start sub_0207E8A4
sub_0207E8A4: ; 0x0207E8A4
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x28]
	add r0, r0, r2
	mov r2, r3
	bl MemcpyFast
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207E8A4

	arm_func_start sub_0207E8C0
sub_0207E8C0: ; 0x0207E8C0
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x28]
	mov r0, r1
	add r1, ip, r2
	mov r2, r3
	bl MemcpyFast
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207E8C0

	arm_func_start sub_0207E8E0
sub_0207E8E0: ; 0x0207E8E0
	stmdb sp!, {r3, lr}
	mov r0, r2
	mov r2, r3
	bl MemcpyFast
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0207E8E0

	arm_func_start sub_0207E8F8
sub_0207E8F8: ; 0x0207E8F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x48
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207E98C
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0x20
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _0207E98C
	mov r8, #0
	mov sb, #1
	mov r7, #3
_0207E948:
	ldr r1, [r0, #0xc]
	ldr r5, [r0, #4]
	tst r1, #2
	movne r1, sb
	moveq r1, r8
	cmp r1, #0
	beq _0207E980
	ldr r1, [r6, #0x24]
	cmp r1, r0
	mov r1, r7
	streq r5, [r6, #0x24]
	bl sub_0207DCC0
	cmp r5, #0
	ldreq r5, [r6, #0x24]
_0207E980:
	mov r0, r5
	cmp r5, #0
	bne _0207E948
_0207E98C:
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207EA7C
	ldr r0, [r6, #0x1c]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207EA7C
	ldr r5, [r6, #0x24]
	cmp r5, #0
	beq _0207EA7C
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	moveq r7, #1
	movne r7, #0
	cmp r7, #0
	ldrne r0, [r6, #0x1c]
	orrne r0, r0, #0x10
	strne r0, [r6, #0x1c]
	mov r0, r4
	bl SetIrqFlag
	cmp r7, #0
	beq _0207EA20
	ldr r0, [r6, #0x58]
	tst r0, #0x200
	beq _0207EA20
	ldr r2, [r6, #0x54]
	mov r0, r5
	mov r1, #9
	blx r2
_0207EA20:
	bl EnableIrqFlag
	ldr r1, [r5, #0xc]
	mov r4, r0
	orr r0, r1, #0x40
	str r0, [r5, #0xc]
	ldr r0, [r5, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207EA68
	add r0, r5, #0x18
	bl sub_020798D8
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x48
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0207EA68:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x48
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0207EA7C:
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207EAC8
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0x10
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x58]
	tst r0, #0x400
	beq _0207EAC8
	add r0, sp, #0
	bl FileInit
	str r6, [sp, #8]
	ldr r2, [r6, #0x54]
	add r0, sp, #0
	mov r1, #0xa
	blx r2
_0207EAC8:
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207EAF8
	ldr r1, [r6, #0x1c]
	add r0, r6, #0x14
	bic r1, r1, #0x40
	orr r1, r1, #8
	str r1, [r6, #0x1c]
	bl sub_020798D8
_0207EAF8:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0207E8F8

	arm_func_start sub_0207EB0C
sub_0207EB0C: ; 0x0207EB0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r6, r0
	ldr r4, [r6, #8]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r7, #0
	mov r8, #1
_0207EB24:
	bl EnableIrqFlag
	ldr r1, [r6, #0xc]
	mov r5, r0
	orr r0, r1, #0x40
	str r0, [r6, #0xc]
	ldr r0, [r6, #0xc]
	tst r0, #4
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	beq _0207EB64
	add r0, r6, #0x18
	bl sub_020798D8
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207EB64:
	ldr r1, [r6, #0xc]
	mov r0, r5
	orr r1, r1, #8
	str r1, [r6, #0xc]
	bl SetIrqFlag
	ldr r1, [r6, #0x10]
	mov r0, r6
	bl sub_0207DD1C
	cmp r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl sub_0207E8F8
	movs r6, r0
	bne _0207EB24
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207EB0C

	arm_func_start sub_0207EBA0
sub_0207EBA0: ; 0x0207EBA0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	bl sub_0207DD1C
	mov r1, r0
	mov r0, r4
	bl sub_0207DCC0
	ldr r0, [r4, #8]
	bl sub_0207E8F8
	cmp r0, #0
	beq _0207EBD0
	bl sub_0207EB0C
_0207EBD0:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207EBA0

	arm_func_start sub_0207EBE4
sub_0207EBE4: ; 0x0207EBE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r4, [r6, #8]
	mov r2, #1
	str r1, [r6, #0x10]
	mov r0, #2
	str r0, [r6, #0x14]
	ldr r0, [r6, #0xc]
	mov r7, r2, lsl r1
	orr r0, r0, #1
	str r0, [r6, #0xc]
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x80
	beq _0207EC40
	mov r0, r6
	mov r1, #3
	bl sub_0207DCC0
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207EC40:
	tst r7, #0x1fc
	ldrne r0, [r6, #0xc]
	orrne r0, r0, #4
	strne r0, [r6, #0xc]
	ldr r1, [r6]
	ldr r2, [r6, #4]
	cmp r1, #0
	strne r2, [r1, #4]
	cmp r2, #0
	add r0, r4, #0x20
	strne r1, [r2]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0207EC88
_0207EC78:
	mov r0, r1
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _0207EC78
_0207EC88:
	str r6, [r0, #4]
	str r0, [r6]
	mov r1, #0
	str r1, [r6, #4]
	ldr r0, [r4, #0x1c]
	tst r0, #8
	movne r1, #1
	cmp r1, #0
	bne _0207ED38
	ldr r0, [r4, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207ED38
	ldr r1, [r4, #0x1c]
	mov r0, r5
	orr r1, r1, #0x10
	str r1, [r4, #0x1c]
	bl SetIrqFlag
	ldr r0, [r4, #0x58]
	tst r0, #0x200
	beq _0207ECF4
	ldr r2, [r4, #0x54]
	mov r0, r6
	mov r1, #9
	blx r2
_0207ECF4:
	bl EnableIrqFlag
	ldr r1, [r6, #0xc]
	orr r1, r1, #0x40
	str r1, [r6, #0xc]
	ldr r1, [r6, #0xc]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _0207ED30
	bl SetIrqFlag
	mov r0, r6
	bl sub_0207EB0C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207ED30:
	bl SetIrqFlag
	b _0207ED7C
_0207ED38:
	ldr r0, [r6, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207ED60
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207ED60:
	add r0, r6, #0x18
	bl sub_02079888
	ldr r0, [r6, #0xc]
	tst r0, #0x40
	beq _0207ED60
	mov r0, r5
	bl SetIrqFlag
_0207ED7C:
	mov r0, r6
	bl sub_0207EBA0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207EBE4

	arm_func_start sub_0207ED88
sub_0207ED88: ; 0x0207ED88
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x5c
	mov r4, r0
	bl MemsetFast
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	str r0, [r4, #0x18]
	str r0, [r4, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0207ED88

	arm_func_start sub_0207EDB4
sub_0207EDB4: ; 0x0207EDB4
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_0207E84C
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207EDF0 ; =_022BB5E8
	ldr r5, [r1]
	b _0207EDD4
_0207EDD0:
	ldr r5, [r5, #4]
_0207EDD4:
	cmp r5, #0
	ldrne r1, [r5]
	cmpne r1, r4
	bne _0207EDD0
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207EDF0: .word _022BB5E8
	arm_func_end sub_0207EDB4

	arm_func_start sub_0207EDF4
sub_0207EDF4: ; 0x0207EDF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r5, r2
	mov r7, r0
	mov r8, #0
	bl EnableIrqFlag
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl sub_0207EDB4
	cmp r0, #0
	bne _0207EE94
	ldr r0, _0207EEA4 ; =_022BB5E8
	ldr r1, [r0]
	cmp r1, #0
	bne _0207EE50
	str r7, [r0]
	str r7, [r0, #4]
	mov r1, r8
	str r1, [r0, #0xc]
	strh r1, [r0, #0xa]
	strh r1, [r0, #8]
	b _0207EE74
_0207EE50:
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0207EE6C
_0207EE5C:
	mov r1, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0207EE5C
_0207EE6C:
	str r7, [r1, #4]
	str r1, [r7, #8]
_0207EE74:
	mov r0, r6
	mov r1, r5
	bl sub_0207E84C
	str r0, [r7]
	ldr r0, [r7, #0x1c]
	mov r8, #1
	orr r0, r0, #1
	str r0, [r7, #0x1c]
_0207EE94:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207EEA4: .word _022BB5E8
	arm_func_end sub_0207EDF4

	arm_func_start sub_0207EEA8
sub_0207EEA8: ; 0x0207EEA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl EnableIrqFlag
	ldr r2, [r4, #4]
	mov r3, #0
	cmp r2, #0
	ldrne r1, [r4, #8]
	strne r1, [r2, #8]
	ldr r2, [r4, #8]
	cmp r2, #0
	ldrne r1, [r4, #4]
	strne r1, [r2, #4]
	str r3, [r4]
	str r3, [r4, #8]
	str r3, [r4, #4]
	ldr r2, [r4, #0x1c]
	ldr r1, _0207EF28 ; =_022BB5E8
	bic r2, r2, #1
	str r2, [r4, #0x1c]
	ldr r2, [r1, #4]
	cmp r2, r4
	bne _0207EF20
	ldr r2, [r1]
	str r2, [r1, #4]
	str r3, [r1, #0xc]
	strh r3, [r1, #0xa]
	strh r3, [r1, #8]
_0207EF20:
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207EF28: .word _022BB5E8
	arm_func_end sub_0207EEA8

	arm_func_start sub_0207EF2C
sub_0207EF2C: ; 0x0207EF2C
	str r1, [r0, #0x28]
	str r3, [r0, #0x30]
	str r2, [r0, #0x3c]
	ldr r3, [sp, #4]
	str r2, [r0, #0x2c]
	ldr ip, [sp, #8]
	ldr r1, [sp]
	str r3, [r0, #0x38]
	str r1, [r0, #0x40]
	str r1, [r0, #0x34]
	cmp ip, #0
	ldreq ip, _0207EF94 ; =sub_0207E8A4
	ldr r1, [sp, #0xc]
	str ip, [r0, #0x48]
	cmp r1, #0
	ldreq r1, _0207EF98 ; =sub_0207E8C0
	str r1, [r0, #0x4c]
	ldr r2, [r0, #0x48]
	mov r1, #0
	str r2, [r0, #0x50]
	str r1, [r0, #0x44]
	ldr r1, [r0, #0x1c]
	orr r1, r1, #2
	str r1, [r0, #0x1c]
	mov r0, #1
	bx lr
	.align 2, 0
_0207EF94: .word sub_0207E8A4
_0207EF98: .word sub_0207E8C0
	arm_func_end sub_0207EF2C

	arm_func_start sub_0207EF9C
sub_0207EF9C: ; 0x0207EF9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #2
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207F04C
	mov r0, r6
	ldr r1, [r6, #0x1c]
	bl sub_0207F20C
	ldr r1, [r6, #0x1c]
	mov r5, r0
	orr r0, r1, #0x80
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _0207F008
	mov r7, #3
_0207EFF0:
	ldr r8, [r0, #4]
	mov r1, r7
	bl sub_0207DCC0
	mov r0, r8
	cmp r8, #0
	bne _0207EFF0
_0207F008:
	mov r0, #0
	str r0, [r6, #0x24]
	cmp r5, #0
	beq _0207F020
	mov r0, r6
	bl sub_0207F2A8
_0207F020:
	mov r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x2c]
	str r0, [r6, #0x30]
	str r0, [r6, #0x34]
	str r0, [r6, #0x38]
	str r0, [r6, #0x40]
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0xa2
	str r0, [r6, #0x1c]
_0207F04C:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207EF9C

	arm_func_start sub_0207F05C
sub_0207F05C: ; 0x0207F05C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	mov r7, r0
	ldr r3, [r7, #0x30]
	ldr r0, [r7, #0x38]
	mov r6, r1
	add r0, r3, r0
	add r0, r0, #0x3f
	bic r4, r0, #0x1f
	cmp r4, r2
	bhi _0207F170
	add r1, r6, #0x1f
	add r0, sp, #4
	bic r5, r1, #0x1f
	bl FileInit
	ldr r2, [r7, #0x2c]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r7, #0x30]
	add r0, sp, #4
	mov r1, r7
	add r3, r2, r3
	bl sub_0207F60C
	cmp r0, #0
	beq _0207F0F0
	ldr r2, [r7, #0x30]
	add r0, sp, #4
	mov r1, r5
	bl sub_0207F818
	cmp r0, #0
	bge _0207F0E8
	ldr r2, [r7, #0x30]
	mov r0, r5
	mov r1, #0
	bl MemsetFast
_0207F0E8:
	add r0, sp, #4
	bl sub_0207F70C
_0207F0F0:
	str r5, [r7, #0x2c]
	ldr ip, [r7, #0x30]
	ldr r2, [r7, #0x34]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r7, #0x38]
	add r0, sp, #4
	mov r1, r7
	add r3, r2, r3
	add r5, r5, ip
	bl sub_0207F60C
	cmp r0, #0
	beq _0207F154
	ldr r2, [r7, #0x38]
	add r0, sp, #4
	mov r1, r5
	bl sub_0207F818
	cmp r0, #0
	bge _0207F14C
	ldr r2, [r7, #0x38]
	mov r0, r5
	mov r1, #0
	bl MemsetFast
_0207F14C:
	add r0, sp, #4
	bl sub_0207F70C
_0207F154:
	str r5, [r7, #0x34]
	ldr r0, _0207F17C ; =sub_0207E8E0
	str r6, [r7, #0x44]
	str r0, [r7, #0x50]
	ldr r0, [r7, #0x1c]
	orr r0, r0, #4
	str r0, [r7, #0x1c]
_0207F170:
	mov r0, r4
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0207F17C: .word sub_0207E8E0
	arm_func_end sub_0207F05C

	arm_func_start sub_0207F180
sub_0207F180: ; 0x0207F180
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	tst r0, #2
	movne r0, #1
	moveq r0, r4
	cmp r0, #0
	beq _0207F204
	mov r0, r5
	bl sub_0207F20C
	ldr r1, [r5, #0x1c]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	beq _0207F1F4
	ldr r2, [r5, #0x1c]
	mov r1, #0
	bic r2, r2, #4
	str r2, [r5, #0x1c]
	ldr r4, [r5, #0x44]
	str r1, [r5, #0x44]
	ldr r1, [r5, #0x3c]
	str r1, [r5, #0x2c]
	ldr r1, [r5, #0x40]
	str r1, [r5, #0x34]
	ldr r1, [r5, #0x48]
	str r1, [r5, #0x50]
_0207F1F4:
	cmp r0, #0
	beq _0207F204
	mov r0, r5
	bl sub_0207F2A8
_0207F204:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0207F180

	arm_func_start sub_0207F20C
sub_0207F20C: ; 0x0207F20C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	moveq r5, #1
	movne r5, #0
	cmp r5, #0
	beq _0207F298
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldr r0, [r6, #0x1c]
	beq _0207F290
	orr r0, r0, #0x40
	str r0, [r6, #0x1c]
	mov r7, #0
	mov r8, #1
_0207F26C:
	add r0, r6, #0x14
	bl sub_02079888
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	bne _0207F26C
	b _0207F298
_0207F290:
	orr r0, r0, #8
	str r0, [r6, #0x1c]
_0207F298:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0207F20C

	arm_func_start sub_0207F2A8
sub_0207F2A8: ; 0x0207F2A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, #0
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r6, r0
	tst r1, #8
	movne r0, #1
	moveq r0, r5
	cmp r0, #0
	moveq r7, #1
	movne r7, #0
	cmp r7, #0
	bne _0207F2F8
	ldr r1, [r4, #0x1c]
	mov r0, r4
	bic r1, r1, #8
	str r1, [r4, #0x1c]
	bl sub_0207E8F8
	mov r5, r0
_0207F2F8:
	mov r0, r6
	bl SetIrqFlag
	cmp r5, #0
	beq _0207F310
	mov r0, r5
	bl sub_0207EB0C
_0207F310:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0207F2A8

	arm_func_start sub_0207F318
sub_0207F318: ; 0x0207F318
	cmp r2, #0
	moveq r1, #0
	beq _0207F32C
	cmp r1, #0
	moveq r2, #0
_0207F32C:
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	bx lr
	arm_func_end sub_0207F318

	arm_func_start sub_0207F338
sub_0207F338: ; 0x0207F338
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, [r4, #0x1c]
	mov r6, r1
	tst r0, #0x100
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207F38C
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x24]
	bic r2, r1, #0x100
	mov r1, r6
	str r2, [r4, #0x1c]
	bl sub_0207DCC0
	mov r0, r4
	bl sub_0207E8F8
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_0207EB0C
	ldmia sp!, {r4, r5, r6, pc}
_0207F38C:
	ldr r5, [r4, #0x24]
	bl EnableIrqFlag
	str r6, [r5, #0x14]
	ldr r1, [r4, #0x1c]
	mov r5, r0
	bic r1, r1, #0x200
	add r0, r4, #0xc
	str r1, [r4, #0x1c]
	bl sub_020798D8
	mov r0, r5
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207F338

	arm_func_start sub_0207F3BC
sub_0207F3BC: ; 0x0207F3BC
	stmdb sp!, {r3, lr}
	ldr r1, _0207F3E0 ; =_022BB5F8
	ldr r2, [r1]
	cmp r2, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	str r2, [r1]
	bl sub_0207F9DC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207F3E0: .word _022BB5F8
	arm_func_end sub_0207F3BC
