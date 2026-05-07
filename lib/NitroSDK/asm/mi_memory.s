	.include "asm/macros.inc"
	.include "include/mi_memory.inc"

	.text

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

