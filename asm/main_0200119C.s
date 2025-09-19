	.include "asm/macros.inc"
	.include "main_0200119C.inc"

	.text

	arm_func_start MemArenaAlloc
MemArenaAlloc: ; 0x0200119C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _0200126C ; =_020AEF08
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl sub_02002CB4
	ldr r1, _02001270 ; =MEMORY_ALLOCATION_ARENA_GETTERS
	mov r0, r5
	ldr r2, [r1]
	mov r1, r6
	blx r2
	movs r5, r0
	ldreq r5, _02001274 ; =_020B3384
	mov r2, r4
	mov r0, r5
	mov r1, #9
	bl FindAvailableMemBlock
	movs r1, r0
	bmi _02001238
	mov r0, r5
	mov r3, r4
	str r6, [sp]
	mov r2, #9
	bl SplitMemBlock
	ldr r2, [r0, #0xc]
	mov r1, r7
	str r2, [sp, #0xc]
	ldr r2, [r0, #0x10]
	add r0, sp, #0xc
	str r2, [sp, #0x10]
	bl CreateMemArena
	mov r4, r0
	ldr r0, _0200126C ; =_020AEF08
	str r5, [r4, #4]
	bl sub_02002E98
	mov r0, r4
	b _02001264
_02001238:
	ldr r0, _0200126C ; =_020AEF08
	bl sub_02002E98
	ldr r1, _02001278 ; =_02090B40
	add r0, sp, #4
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _0200127C ; =_02090BC8
	mov r2, r4
	str ip, [sp, #4]
	str r3, [sp, #8]
	bl Debug_FatalError
_02001264:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0200126C: .word _020AEF08
_02001270: .word MEMORY_ALLOCATION_ARENA_GETTERS
_02001274: .word _020B3384
_02001278: .word _02090B40
_0200127C: .word _02090BC8
	arm_func_end MemArenaAlloc

	arm_func_start CreateMemArena
CreateMemArena: ; 0x02001280
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r3, r1
	mov r1, #0x18
	mul r2, r3, r1
	ldr r1, [r0, #4]
	ldr r4, [r0]
	add r0, r2, #3
	bic ip, r0, #3
	sub r0, r1, #0x1c
	sub r0, r0, ip
	bic lr, r0, #3
	add r2, r4, #0x1c
	add ip, r2, ip
	add r1, sp, #0
	mov r0, r4
	str ip, [sp]
	str lr, [sp, #4]
	bl InitMemArena
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end CreateMemArena

	arm_func_start sub_020012D8
sub_020012D8: ; 0x020012D8
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r1, #0xc]
	cmp r0, #1
	ldreq r0, [r1, #8]
	ldreq r0, [r0, #4]
	cmpeq r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, pc}
	ldr r0, _02001388 ; =_020B3380
	mov ip, #0
	mov r3, ip
	ldr lr, [r0]
	ldr r2, _0200138C ; =_020B33A0
	b _02001368
_02001320:
	ldr r0, [r2, r3, lsl #2]
	cmp r0, r1
	bne _02001364
	ldr r0, _02001388 ; =_020B3380
	ldr r2, [r0]
	sub ip, r2, #1
	str ip, [r0]
	ldr r2, _0200138C ; =_020B33A0
	b _02001354
_02001344:
	add r0, r2, r3, lsl #2
	ldr r0, [r0, #4]
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
_02001354:
	cmp r3, ip
	blt _02001344
	mov ip, #1
	b _02001370
_02001364:
	add r3, r3, #1
_02001368:
	cmp r3, lr
	blt _02001320
_02001370:
	cmp ip, #0
	ldrne r0, [r1, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_02001388: .word _020B3380
_0200138C: .word _020B33A0
	arm_func_end sub_020012D8

	arm_func_start MemLocateSet
MemLocateSet: ; 0x02001390
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov r4, r0
	ldr r0, _0200161C ; =_020AEF08
	mov r5, r1
	orr r7, r2, #0x100
	bl sub_02002CB4
	ldr r1, _02001620 ; =MEMORY_ALLOCATION_ARENA_GETTERS
	mov r0, r4
	ldr r2, [r1]
	mov r1, r7
	blx r2
	movs r4, r0
	mov r0, r7, asr #8
	orr r8, r0, #1
	and r0, r8, #2
	ldreq r4, _02001624 ; =_020B3384
	cmp r0, #2
	and sb, r7, #0xff
	bne _020015A0
	tst r8, #4
	ldr r0, [r4, #8]
	ldr lr, [r4, #0xc]
	beq _02001458
	mov r2, r0
	mov r7, #0
	b _02001420
_020013FC:
	ldr r1, [r2, #4]
	tst r1, #1
	bne _02001418
	ldr r1, [r2, #0x10]
	cmp r1, r5
	blt _0200144C
	b _020014A8
_02001418:
	add r7, r7, #1
	add r2, r2, #0x18
_02001420:
	cmp r7, lr
	blt _020013FC
	b _0200144C
_0200142C:
	ldr r1, [r2, #4]
	tst r1, #1
	bne _02001444
	ldr r1, [r2, #0x10]
	cmp r1, r5
	bge _020014A8
_02001444:
	add r7, r7, #1
	add r2, r2, #0x18
_0200144C:
	cmp r7, lr
	blt _0200142C
	b _020014A4
_02001458:
	mov sl, r0
	mvn r7, #0
	ldr r2, _02001628 ; =0x001E6401
	mov r3, #0
	b _02001498
_0200146C:
	ldr r1, [sl, #4]
	tst r1, #1
	bne _02001490
	ldr r1, [sl, #0x10]
	cmp r1, r5
	blt _02001490
	cmp r1, r2
	movlt r7, r3
	movlt r2, r1
_02001490:
	add r3, r3, #1
	add sl, sl, #0x18
_02001498:
	cmp r3, lr
	blt _0200146C
	b _020014A8
_020014A4:
	mvn r7, #0
_020014A8:
	cmp r7, #0
	blt _020015DC
	mov r1, #0x18
	mla r6, r7, r1, r0
	add r3, r5, #3
	ldr r2, [r6, #0x10]
	bic fp, r3, #3
	cmp r2, fp
	ble _02001584
	mla ip, lr, r1, r0
	b _0200150C
_020014D4:
	sub r0, ip, #0x18
	mov sl, r0
	ldmia sl!, {r0, r1, r2, r3}
	str sl, [sp, #0xc]
	mov sl, ip
	stmia sl!, {r0, r1, r2, r3}
	str ip, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r2, sl
	ldmia r0, {r0, r1}
	stmia r2, {r0, r1}
	str sl, [sp, #8]
	sub lr, lr, #1
	sub ip, ip, #0x18
_0200150C:
	cmp lr, r7
	bgt _020014D4
	ldr r0, [r4, #0xc]
	add r1, r0, #1
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ble _02001554
	ldr r1, _0200162C ; =_02090B40
	add r0, sp, #0x18
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x10]
	str r2, [sp, #0x1c]
	str r1, [sp, #0x18]
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	ldr r1, _02001630 ; =_02090BA0
	bl Debug_FatalError
_02001554:
	ldr r2, [r4, #8]
	add r1, r7, #1
	mov r0, #0x18
	mla r2, r1, r0, r2
	ldr r0, [r2, #0xc]
	add r0, r0, fp
	str r0, [r2, #0xc]
	ldr r0, [r2, #0x10]
	sub r0, r0, fp
	str r0, [r2, #0x10]
	str fp, [r6, #0x10]
	str r5, [r6, #0x14]
_02001584:
	mov r0, r8
	bl MemAllocFlagsToBlockType
	stmia r6, {r0, r8, sb}
	ldr r0, _0200161C ; =_020AEF08
	ldr r6, [r6, #0xc]
	bl sub_02002E98
	b _02001610
_020015A0:
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl FindAvailableMemBlock
	movs r1, r0
	bmi _020015DC
	mov r0, r4
	mov r2, r8
	mov r3, r5
	str sb, [sp]
	bl SplitMemBlock
	ldr r6, [r0, #0xc]
	ldr r0, _0200161C ; =_020AEF08
	bl sub_02002E98
	b _02001610
_020015DC:
	ldr r0, _0200161C ; =_020AEF08
	bl sub_02002E98
	ldr r1, _0200162C ; =_02090B40
	add r0, sp, #0x10
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r1, _02001634 ; =_02090BFC
	mov r2, r4
	mov r3, r5
	stmia sp, {r8, sb}
	bl Debug_FatalError
_02001610:
	mov r0, r6
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200161C: .word _020AEF08
_02001620: .word MEMORY_ALLOCATION_ARENA_GETTERS
_02001624: .word _020B3384
_02001628: .word 0x001E6401
_0200162C: .word _02090B40
_02001630: .word _02090BA0
_02001634: .word _02090BFC
	arm_func_end MemLocateSet

	arm_func_start MemLocateUnset
MemLocateUnset: ; 0x02001638
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r0, _020017A8 ; =_020AEF08
	mov r6, r1
	bl sub_02002CB4
	ldr r1, _020017AC ; =MEMORY_ALLOCATION_ARENA_GETTERS
	mov r0, r7
	ldr r2, [r1, #4]
	mov r1, r6
	blx r2
	movs r7, r0
	ldreq r7, _020017B0 ; =_020B3384
	cmp r6, #0
	bne _0200167C
	ldr r0, _020017A8 ; =_020AEF08
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200167C:
	ldr r4, [r7, #8]
	ldr r1, [r7, #0xc]
	mov r5, #0
	b _02001794
_0200168C:
	ldr r0, [r4, #0xc]
	cmp r0, r6
	bne _0200178C
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #0x14]
	str r0, [r4, #8]
	ldr r0, [r7, #0xc]
	sub r0, r0, #1
	cmp r5, r0
	bge _0200171C
	add ip, r4, #0x18
	ldr r0, [ip, #4]
	cmp r0, #0
	bne _0200171C
	ldr r1, [r4, #0x10]
	ldr r0, [ip, #0x10]
	add lr, r5, #1
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r0, [r7, #0xc]
	sub r0, r0, #1
	str r0, [r7, #0xc]
	b _02001710
_020016F0:
	add r8, ip, #0x18
	mov r6, ip
	ldmia r8!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia r8, {r0, r1}
	stmia r6, {r0, r1}
	add lr, lr, #1
	add ip, ip, #0x18
_02001710:
	ldr r0, [r7, #0xc]
	cmp lr, r0
	blt _020016F0
_0200171C:
	cmp r5, #0
	ble _02001780
	sub r2, r4, #0x18
	ldr r0, [r2, #4]
	cmp r0, #0
	bne _02001780
	ldr r1, [r2, #0x10]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r2, #0x10]
	ldr r0, [r7, #0xc]
	sub r0, r0, #1
	str r0, [r7, #0xc]
	b _02001774
_02001754:
	add ip, r4, #0x18
	mov r6, r4
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia ip, {r0, r1}
	stmia r6, {r0, r1}
	add r5, r5, #1
	add r4, r4, #0x18
_02001774:
	ldr r0, [r7, #0xc]
	cmp r5, r0
	blt _02001754
_02001780:
	ldr r0, _020017A8 ; =_020AEF08
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200178C:
	add r5, r5, #1
	add r4, r4, #0x18
_02001794:
	cmp r5, r1
	blt _0200168C
	ldr r0, _020017A8 ; =_020AEF08
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020017A8: .word _020AEF08
_020017AC: .word MEMORY_ALLOCATION_ARENA_GETTERS
_020017B0: .word _020B3384
	arm_func_end MemLocateUnset

	arm_func_start sub_020017B4
sub_020017B4: ; 0x020017B4
	ldr r2, [r0, #8]
	ldr ip, [r0, #0xc]
	mov r3, #0
	b _020017DC
_020017C4:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r3, r3, #1
	add r2, r2, #0x18
_020017DC:
	cmp r3, ip
	blt _020017C4
	mov r0, #0
	bx lr
	arm_func_end sub_020017B4

	arm_func_start sub_020017EC
sub_020017EC: ; 0x020017EC
	stmdb sp!, {r3, lr}
	ldr r0, _02001804 ; =_020AEF08
	bl sub_02002CB4
	ldr r0, _02001804 ; =_020AEF08
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02001804: .word _020AEF08
	arm_func_end sub_020017EC

	arm_func_start sub_02001808
sub_02001808: ; 0x02001808
	stmdb sp!, {r4, lr}
	ldr r0, _0200187C ; =_020AEF08
	bl sub_02002CB4
	ldr r0, _02001880 ; =MEMORY_ALLOCATION_ARENA_GETTERS
	mov r4, #0
	ldr r2, [r0]
	ldr r0, _02001884 ; =_020B3384
	mov r1, r4
	blx r2
	cmp r0, #0
	ldreq r0, _02001884 ; =_020B3384
	mov r1, #0
	ldr r2, [r0, #8]
	ldr r3, [r0, #0xc]
	b _02001864
_02001844:
	ldr r0, [r2]
	cmp r0, #0
	bne _0200185C
	ldr r0, [r2, #0x10]
	cmp r4, r0
	movlt r4, r0
_0200185C:
	add r1, r1, #1
	add r2, r2, #0x18
_02001864:
	cmp r1, r3
	blt _02001844
	ldr r0, _0200187C ; =_020AEF08
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200187C: .word _020AEF08
_02001880: .word MEMORY_ALLOCATION_ARENA_GETTERS
_02001884: .word _020B3384
	arm_func_end sub_02001808

	arm_func_start sub_02001888
sub_02001888: ; 0x02001888
	tst r0, #0xff
	addne r0, r0, #0x100
	bx lr
	arm_func_end sub_02001888
